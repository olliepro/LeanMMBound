#!/bin/bash
#SBATCH --job-name=palomar-dry
#SBATCH --account=pas2138
#SBATCH --partition=cpu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=16 --mem=32G
#SBATCH --time=05:30:00
#SBATCH --output=/fs/scratch/PAS2138/ollieproudman/integ/dry-%j.out
# Palomar-like dry run: clean copy, cache get, build, comparator; 16 vCPU / 32 GB / 5.5 h.
set -uo pipefail
export PATH=/fs/scratch/PAS2138/ollieproudman/integ/shimbin:$HOME/.elan/bin:$PATH
export LEAN_NUM_THREADS=16   # the Palomar runner has 16 vCPUs; Lake would otherwise see this node's 96
R=/fs/scratch/PAS2138/ollieproudman/integ/dry-$SLURM_JOB_ID
mkdir -p $R && cd $R
rsync -a --exclude .lake ../proj/ ./
t0=$(date +%s)
step() { local name=$1; shift; local s=$(date +%s); /usr/bin/time -f "$name: %e s wall, %M KB peak RSS (largest process)" "$@" > $R/$name.log 2>&1; local rc=$?; echo "$name rc=$rc $(( $(date +%s) - s )) s; total $(( $(date +%s) - t0 )) s"; tail -2 $R/$name.log; return $rc; }
step cache lake exe cache get || exit 1
step build lake build Solution Challenge || exit 1
step comparator bash scripts/verify-comparator.sh
echo "TOTAL $(( $(date +%s) - t0 )) s"
sacct -j $SLURM_JOB_ID --format=MaxRSS,MaxVMSize -n | head -3
