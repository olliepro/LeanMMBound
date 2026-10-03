# Palomar dry run (3 October 2026)

A from-scratch run of the registry's verification steps on a resource envelope matching the
Palomar runner: one Ohio Supercomputer Center (Cardinal) node allocation with 16 CPUs and 32 GB
of memory, Slurm job 15234039. The script `palomar_dry.sbatch` copies the repository without
`.lake`, then runs the three steps in order with `LEAN_NUM_THREADS=16`.

| Step | Command | Wall time | Result |
|---|---|---|---|
| Mathlib cache | `lake exe cache get` | 241 s | `cache.log` |
| Build | `lake build Solution Challenge` | 1,486 s | 4,762 jobs, 0 errors; the only `sorry` is the one in `Challenge.lean` (`build.log.gz`) |
| Comparator | `scripts/verify-comparator.sh` | 4,558 s | statement and axioms match; con-ron (136,476 declarations), nanoda and the Lean kernel accept; `Your solution is okay!` (`comparator.log`) |
| **Total** | | **6,286 s** (1 h 45 min) | budget 19,800 s |

Slurm reports a peak resident memory of 20.3 GB for the whole job (`summary.txt`); the largest
single process peaked at 2.5 GB.

The cluster's `bubblewrap` 0.4.1 predates the `--clearenv` option that Comparator's sandbox
passes, so the run put `bwrap-clearenv-shim.sh` (installed as `bwrap` on `PATH`) in front of
it: the shim drops `--clearenv` and starts `bwrap` under `env -i`, which clears the environment
the same way. A current `bubblewrap` needs no shim.
