#!/bin/bash
#SBATCH --account=pas2138 --partition=cpu --time=2-00:00:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=96 --exclusive
#SBATCH --job-name=mmbound-comparator --output=/fs/scratch/PAS2138/aperrault/mmbound/logs/cmp_run_%j.log
set -uo pipefail
ROOT=/fs/scratch/PAS2138/aperrault/mmbound
export ELAN_HOME=$ROOT/elan; export PATH=$ELAN_HOME/bin:$PATH
echo "START $(date) host=$(hostname) job=$SLURM_JOB_ID"
cd $ROOT/lean4export-424 && git checkout -q -f 3245035 && echo "leanprover/lean4:v4.24.0" > lean-toolchain && lake build 2>&1 | tail -2; git log -1 --format="L4E:%h %s"
cd $ROOT/cmp-work; echo "COMMIT:$(git rev-parse HEAD)"; git status --porcelain | head -3
export PATH=$ROOT/binwrap:$ROOT/lean4export-424/.lake/build/bin:$PATH
which landrun lean4export lake
echo "== comparator $(date)"
/usr/bin/time -v lake env $ROOT/comparator-425/.lake/build/bin/comparator $ROOT/verification/comparator_run.json > $ROOT/logs/comparator_out_$SLURM_JOB_ID.log 2>&1
rc=$?
echo "COMPARATOR_RC:$rc"; echo "END $(date)"
grep -v "^\s" $ROOT/logs/comparator_out_$SLURM_JOB_ID.log | tail -25 | cut -c1-300
if [ $rc -eq 0 ]; then touch $ROOT/cmp_done.txt; else touch $ROOT/cmp_failed.txt; fi
exit $rc
