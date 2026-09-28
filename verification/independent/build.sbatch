#!/bin/bash
#SBATCH --account=pas2138 --partition=cpu --time=05:00:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=96 --exclusive
#SBATCH --job-name=mmbound-build --output=/fs/scratch/PAS2138/aperrault/mmbound/logs/build_%j.log
# Independent from-scratch build of olliepro/matrix-bounds-lean (A. Perrault).
set -uo pipefail
ROOT=/fs/scratch/PAS2138/aperrault/mmbound
REPO=$ROOT/matrix-bounds-lean
export ELAN_HOME=$ROOT/elan
export PATH=$ELAN_HOME/bin:$PATH
export LEAN_NUM_THREADS=48
export MATHLIB_CACHE_DIR=/fs/scratch/PAS2138/aperrault/mmbound/mathlib-cache
export SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
export CURL_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
echo "START $(date) host=$(hostname) job=$SLURM_JOB_ID"
nproc; free -g | head -2
cd "$REPO" || exit 2
echo "COMMIT:$(git rev-parse HEAD)"; echo "DIRTY:$(git status --porcelain | wc -l)"
echo "TOOLCHAIN:$(cat lean-toolchain)"
rm -rf .lake   # guarantee nothing prebuilt
if [ ! -x "$ELAN_HOME/bin/elan" ]; then
  curl -sSfL https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --no-modify-path --default-toolchain none || { echo "ELAN_INSTALL_FAILED"; touch $ROOT/build_failed.txt; exit 3; }
fi
lean --version; lake --version
echo "CACHE_GET $(date)"
lake exe cache get 2>&1 | tail -5; [ -f .lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean ] || { echo "CACHE_FAILED"; touch $ROOT/build_failed.txt; exit 4; }
echo "BUILD $(date)"
/usr/bin/time -v lake build > $ROOT/logs/lake_build_$SLURM_JOB_ID.log 2>&1
rc=$?
echo "END $(date) rc=$rc"
L=$ROOT/logs/lake_build_$SLURM_JOB_ID.log
echo "LOGLINES:$(wc -l < $L)"
echo "LOGSHA256:$(sha256sum $L | cut -d' ' -f1)"
echo "ERRORLINES:$(grep -c '^error' $L)"
echo "SORRYWARN:$(grep -c "declaration uses 'sorry'" $L)"
echo "AXIOMSETS:"; grep -o "depends on axioms: \[[^]]*\]" $L | sort | uniq -c
grep -c "does not depend on any axioms" $L | sed 's/^/NOAXIOMS:/'
grep "SuppliedCertifiedPipeline.exponent_lt'" $L | sed 's/^/MAIN:/'
tail -5 $L
grep -E "Maximum resident|Elapsed" $L | sed 's/^/TIME:/'
if [ $rc -eq 0 ]; then touch $ROOT/build_done.txt; else touch $ROOT/build_failed.txt; fi
exit $rc
