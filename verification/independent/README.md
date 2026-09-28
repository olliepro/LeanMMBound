# Independent verification (A. Perrault, 20–22 September 2026)

Everything here was run on the Ohio Supercomputer Center (Cardinal, 96-core CPU nodes) from a
fresh checkout of the sources at Lean tree `bb7aadd4c1d08f949ddfd20aec1f5a11ccacd884`
(`git rev-parse HEAD:src`; this is the tree of the current `main`, and of the earlier commit
`bd86c756` on which the runs were made), with a freshly installed Lean 4.24.0 toolchain and a
fresh Mathlib cache. Nothing prebuilt from the author's machines was reused.

| Step | Script | Result | Record |
|---|---|---|---|
| From-scratch `lake build` | `build.sbatch` | 8,899 jobs, 0 errors, 0 `sorry` warnings; 1 h 31 min wall, ≤ 21 GB per process | `build_summary_14730125.txt`, `lake_build_14730125.log.gz` (sha256 in summary) |
| Axiom audit (from that log) | — | 88,168 audit lines; only `propext`, `Classical.choice`, `Quot.sound` occur; `exponent_lt` depends on exactly these three | same |
| `lean4checker` (tag v4.24.0) | `l4c.sbatch`, `l4c2.sbatch` | every one of the 6,534 modules replayed through the kernel, 0 failures | `lean4checker_results.txt` (`rc\|seconds\|module\|last line`) |
| Statement audit | `Challenge.lean` | 121-line standalone file: the definitions of rank, the matrix multiplication tensor and `exponent`, copied from `src/` (see the note in the file), importing only Mathlib, ending in the theorem with `sorry` | read by A.P. |
| Comparator: statement identity + axioms | `cmp_ab.sbatch` (part A) | every constant in the dependency closure of the statement of `exponent_lt` is identical in `Challenge` and in the project; proof uses only the three permitted axioms | `comparator_summary.txt` |
| Comparator: full second-kernel replay | `cmp_run2.sbatch` | exported proof (19.3 M lines, sha256 in summary) replayed through the Lean 4.25 kernel: `Solution valid.` — 20 h 35 min single-threaded, 16.7 GB | `comparator_out_14743425.log.gz` |
| Standalone Python interval verifier | `../../numerical-certificate/` | finite-pipeline bound enclosed in [2.37104473, 2.37104474] < 2.3710449 | `../../numerical-certificate/report.json` |

## Notes and caveats

* **Tool versions.** No Comparator release targets Lean 4.24. We used Comparator commit
  `2a117fd` and `lean4export` commit `3245035` (both October 2025, the last before their jump to
  Lean 4.25+), with `lean4export`'s toolchain pinned to 4.24.0, and `landrun` commit `811cfff`
  built from source with gcc. `landrun_wrapper.sh` re-inserts the `--` separator that current
  `landrun` consumes and this Comparator relies on; it is part of the trusted base of the run.
* **Runtime warnings during the replay.** The replay log contains 26 `PANIC ... duplicate
  normalized declaration name` messages. All concern private helper lemmas in Lean's `Init` or in
  Mathlib (none in this project). In Lean 4.25 (`Lean/Environment.lean`, `addDeclCore`) the kernel
  check runs before the bookkeeping step that emits this message, and the message's fallback
  leaves the environment unchanged, so no declaration escaped kernel checking; the replay
  completed with exit status 0.
* **nanoda** (an independent Rust kernel) could not parse this export format (a `let`/`have`
  distinction not represented in export format 2.0.0); we did not modify the export to force it.
* The Mathlib cache download on RHEL needs `SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt`
  (see `build.sbatch`).

## Reproducing

Adjust the paths and account in the sbatch files, then run them in the order of the table.
`cmp_ab.sbatch` part A patches Comparator's `Main.lean` to stop after the statement and axiom
checks (the four-line patch is inlined in the script); part B's nanoda step is expected to fail as
noted above.
