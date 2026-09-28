#!/bin/bash
#SBATCH --account=pas2138 --partition=cpu --time=12:00:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=96 --exclusive
#SBATCH --job-name=mmbound-l4c --output=/fs/scratch/PAS2138/aperrault/mmbound/logs/l4c_%j.log
# lean4checker: one invocation per project module, 40 in parallel, per-module result lines.
set -uo pipefail
ROOT=/fs/scratch/PAS2138/aperrault/mmbound; REPO=$ROOT/matrix-bounds-lean
export ELAN_HOME=$ROOT/elan; export PATH=$ELAN_HOME/bin:$PATH
export BIN=$ROOT/lean4checker/.lake/build/bin/lean4checker
export RES=$ROOT/l4c_results_$SLURM_JOB_ID; mkdir -p $RES
echo "START $(date) host=$(hostname) job=$SLURM_JOB_ID"; cd $REPO; echo "COMMIT:$(git rev-parse HEAD)"
echo "== smoke test on one small module"
( time lake env $BIN MatrixExponent ) 2>&1 | tail -6; echo "SMOKE_RC:$?"
cd src; find . -name "*.lean" | sed "s|^\./||; s|\.lean$||; s|/|.|g" | sort > $RES/modules.txt; cd ..
echo "NMODS:$(wc -l < $RES/modules.txt)"
check() { m=$1; s=$(date +%s); out=$($BIN "$m" 2>&1); rc=$?; echo "$rc|$(( $(date +%s)-s ))|$m|$(echo "$out" | tail -1 | cut -c1-200)" >> $RES/results.txt; }
export -f check
lake env bash -c "cat $RES/modules.txt | xargs -P 40 -I{} bash -c \"check {}\""
echo "END $(date)"
echo "DONE:$(wc -l < $RES/results.txt)"; echo "FAILED:$(grep -vc "^0|" $RES/results.txt)"
grep -v "^0|" $RES/results.txt | head -20
sort -t"|" -k2 -n -r $RES/results.txt | head -5
[ "$(grep -vc "^0|" $RES/results.txt)" = "0" ] && touch $ROOT/l4c_done.txt || touch $ROOT/l4c_failed.txt
