#!/bin/bash
# Wrapper: current landrun consumes the first "--"; the Oct-2025 Comparator relies on "--" reaching
# lean4export. Insert an explicit "--" before the sandboxed command so later ones pass through.
REAL=/fs/scratch/PAS2138/aperrault/mmbound/bin/landrun
opts=()
while [ $# -gt 0 ]; do
  case "$1" in
    --best-effort|--unrestricted-network|--unrestricted-filesystem|--add-exec|--ldd) opts+=("$1"); shift;;
    --ro|--rox|--rw|--rwx|--env|--bind-tcp|--connect-tcp|--log-level) opts+=("$1" "$2"); shift 2;;
    *) break;;
  esac
done
exec "$REAL" "${opts[@]}" -- "$@"
