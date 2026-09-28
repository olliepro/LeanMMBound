#!/bin/bash
#SBATCH --account=pas2138 --partition=cpu --time=1-00:00:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=96 --exclusive
#SBATCH --job-name=mmbound-cmpAB --output=/fs/scratch/PAS2138/aperrault/mmbound/logs/cmp_ab_%j.log
set -uo pipefail
ROOT=/fs/scratch/PAS2138/aperrault/mmbound
export ELAN_HOME=$ROOT/elan; export PATH=$ELAN_HOME/bin:$PATH
echo "START $(date) host=$(hostname) job=$SLURM_JOB_ID"
echo "== A. Comparator with the in-process kernel replay skipped (statement match + axiom check only)"
cd $ROOT; rm -rf comparator-425-nokernel; cp -a comparator-425 comparator-425-nokernel; cd comparator-425-nokernel
python3 - <<PY
p="Main.lean"; s=open(p).read()
old="  IO.ofExcept <| Comparator.checkAxioms solution theoremNames (← read).legalAxioms\n  runKernel solution"
assert s.count(old)==1
new="  IO.println \"STATEMENT_MATCH_OK\"\n  (← IO.getStdout).flush\n  IO.ofExcept <| Comparator.checkAxioms solution theoremNames (← read).legalAxioms\n  IO.println \"AXIOM_CHECK_OK (kernel replay skipped in this build; done separately)\"\n  (← IO.getStdout).flush"
open(p,"w").write(s.replace(old,new))
PY
git diff --stat | tail -1; lake build comparator 2>&1 | tail -2
cd $ROOT/cmp-work; echo "COMMIT:$(git rev-parse HEAD)"
export PATH=$ROOT/binwrap:$ROOT/lean4export-424/.lake/build/bin:$PATH
( time lake env $ROOT/comparator-425-nokernel/.lake/build/bin/comparator $ROOT/verification/comparator_run.json > $ROOT/logs/comparatorA_$SLURM_JOB_ID.log 2>&1 ); echo "A_RC:$?"
grep -E "STATEMENT_MATCH_OK|AXIOM_CHECK_OK|okay|uncaught|does not match" $ROOT/logs/comparatorA_$SLURM_JOB_ID.log | cut -c1-300
echo "== B. export to file, then nanoda (independent Rust kernel, multi-threaded)"
cd $ROOT/cmp-work
( time lake env lean4export SuppliedCertifiedPipeline -- MatrixBounds.Numeric.SuppliedCertifiedPipeline.exponent_lt > $ROOT/solution_export.txt ) 2>&1 | tail -3
ls -la $ROOT/solution_export.txt; echo "EXPORT_LINES:$(wc -l < $ROOT/solution_export.txt)"; echo "EXPORT_SHA256:$(sha256sum $ROOT/solution_export.txt | cut -c1-64)"; head -1 $ROOT/solution_export.txt
module load rust/1.97.1 2>&1 | tail -1; export CARGO_HOME=$ROOT/cargo; cargo --version
cd $ROOT/nanoda_lib && git checkout -q 66cca78 && cargo build --release 2>&1 | tail -3; ls -la target/release/nanoda_bin
cat > $ROOT/verification/nanoda_config.json <<JSON
{
  "export_file_path": "$ROOT/solution_export.txt",
  "use_stdin": false,
  "permitted_axioms": ["propext", "Classical.choice", "Quot.sound"],
  "unpermitted_axiom_hard_error": false,
  "nat_extension": true,
  "string_extension": true,
  "num_threads": 90,
  "print_success_message": true
}
JSON
echo "NANODA_START $(date)"
/usr/bin/time -v target/release/nanoda_bin $ROOT/verification/nanoda_config.json > $ROOT/logs/nanoda_$SLURM_JOB_ID.log 2>&1
rc=$?; echo "NANODA_RC:$rc"; echo "END $(date)"
grep -v "^\s" $ROOT/logs/nanoda_$SLURM_JOB_ID.log | tail -8 | cut -c1-300; grep -E "Elapsed|Maximum resident" $ROOT/logs/nanoda_$SLURM_JOB_ID.log
[ $rc -eq 0 ] && touch $ROOT/nanoda_done.txt || touch $ROOT/nanoda_failed.txt
