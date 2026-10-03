# Matrix multiplication bounds: Lean formalization

**Paper: [Cross-Level Laser Extraction for Faster Matrix Multiplication](paper/matrix-multiplication-exponent.pdf)**
— LaTeX source in [`paper/`](paper/).
**Blog post: [Pocket-Sized Super Mathematical Intelligence](https://oliverproudfoot.substack.com/p/pocket-sized-super-mathematical-intelligence)**

This repository contains a complete, machine-checked proof in Lean 4 that the algebraic
matrix multiplication exponent is strictly below 2.3710449. The extraction pipeline is
constructed in full, its rates are identified with exact rational logarithmic expressions,
and Lean's kernel decides every numerical comparison in exact arithmetic. The proof depends
only on Lean's three standard foundations, `propext`, `Classical.choice` and `Quot.sound`,
and the sources in `src/` use no `sorry`, `admit`, custom `axiom` or `native_decide`.

Specifically, `src/SuppliedCertifiedPipeline.lean` proves

```lean
theorem exponent_lt {K : Type} [CommRing K] :
    MatrixComplexity.exponent K < (23710449 : ℝ)/10000000
```

where `MatrixComplexity.exponent K` is the algebraic (exact tensor-rank) exponent of matrix
multiplication over `K`: the infimum of the real `τ` for which one constant bounds the rank
of every `n×n×n` matrix multiplication tensor by `C·n^τ`. The development is 2,170 Lean
modules on Lean `v4.35.0-rc2` with Mathlib, in the layout of the
[Palomar registry](https://palomar-registry.org/): `Challenge.lean` restates the definitions and
the theorem using only Mathlib, and `lake exe cache get && lake build && ./scripts/verify-comparator.sh`
checks that the proof establishes exactly that statement and replays it through three kernels
(about 1 h 45 min on 16 vCPUs and 32 GB; record in [`verification/palomar-dry-run/`](verification/palomar-dry-run/)).
The large numerical tables are checked by generic, once-proved checkers that the kernel runs
on packed natural numbers ([`docs/fast-kernel-checks.md`](docs/fast-kernel-checks.md)). The
statement's definitions, the construction and the numerical identification are documented in
[`docs/technical-overview.md`](docs/technical-overview.md). Submissions to the registry go
through https://submit.palomar-registry.org/.

## Independent verification

Andrew Perrault rebuilt the Lean 4.24 release (commit `884a354`) from a fresh checkout on a
separate allocation, ran `lean4checker` on every module, audited the formal statement against a
standalone challenge file, and ran the Lean FRO's Comparator (statement identity, axiom check,
and a full replay of the exported proof through a second kernel). Scripts, logs and a summary
are in [`verification/independent/`](verification/independent/README.md). The root
`Challenge.lean` is his challenge file (`verification/independent/Challenge.lean.orig`) with the
module-system header, `public` imports, four `backward.*` options and a porting note added;
every declaration is unchanged. (`backward.proofsInPublic` gives proof helpers the same names in
every module, which Comparator needs.) The project builds on the same declarations, verbatim, in
`src/MatrixBoundsStatement.lean`.

## License

Apache-2.0 (see [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE)).
