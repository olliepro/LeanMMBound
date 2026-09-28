#!/bin/bash
#SBATCH --account=pas2138 --partition=cpu --time=12:00:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=96 --exclusive
#SBATCH --job-name=mmbound-l4c2 --output=/fs/scratch/PAS2138/aperrault/mmbound/logs/l4c2_%j.log
# Second lean4checker worker: same module list in REVERSE order, 88 parallel, skips modules the first worker already finished.
set -uo pipefail
ROOT=/fs/scratch/PAS2138/aperrault/mmbound; REPO=$ROOT/matrix-bounds-lean
export ELAN_HOME=$ROOT/elan; export PATH=$ELAN_HOME/bin:$PATH
export BIN=$ROOT/lean4checker/.lake/build/bin/lean4checker
export RES=$ROOT/l4c_results_14734012
echo "START $(date) host=$(hostname) job=$SLURM_JOB_ID"; cd $REPO; echo "COMMIT:$(git rev-parse HEAD)"
check() { m=$1; grep -q "|$m|" $RES/results.txt $RES/results2.txt 2>/dev/null && return 0; s=$(date +%s); out=$($BIN "$m" 2>&1); rc=$?; echo "$rc|$(( $(date +%s)-s ))|$m|$(echo "$out" | tail -1 | cut -c1-200)" >> $RES/results2.txt; }
export -f check
lake env bash -c "tac $RES/modules.txt | xargs -P 88 -I{} bash -c \"check {}\""
echo "END $(date)"
cat $RES/results.txt $RES/results2.txt | cut -d"|" -f3 | sort -u > $RES/covered.txt
echo "COVERED:$(wc -l < $RES/covered.txt)/$(wc -l < $RES/modules.txt)"
echo "FAILED:$(cat $RES/results.txt $RES/results2.txt | grep -vc "^0|")"
