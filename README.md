# Matrix multiplication bounds: Lean formalization

**Paper: [Cross-Level Laser Extraction for Faster Matrix Multiplication](paper/matrix-multiplication-exponent.pdf)**
— LaTeX source in [`paper/`](paper/).
**Blog post: [Pocket-Sized Super Mathematical Intelligence](https://oliverproudfoot.substack.com/p/pocket-sized-super-mathematical-intelligence)**

This repository contains a complete, machine-checked proof in Lean 4 that the algebraic
matrix multiplication exponent is strictly below 2.3710449. The extraction pipeline is
constructed in full, its rates are identified with exact rational logarithmic expressions,
and Lean's kernel decides every numerical comparison in exact rational arithmetic. All
88,134 named declarations depend only on Lean's three standard foundations, `propext`,
`Classical.choice` and `Quot.sound`, and the proof sources in `src/` use no `sorry`,
`admit`, custom `axiom` or `native_decide`.

Specifically, `src/SuppliedCertifiedPipeline.lean` proves

```lean
theorem exponent_lt {K : Type} [CommRing K] :
    MatrixComplexity.exponent K < (23710449 : ℝ)/10000000
```

where `MatrixComplexity.exponent K` is the algebraic (exact tensor-rank) exponent of matrix
multiplication over `K`: the infimum of the real `τ` for which one constant bounds the rank
of every `n×n×n` matrix multiplication tensor by `C·n^τ`. The development is 5,492 Lean
modules with 47,316 named theorems, built on Lean 4.24.0 and a pinned Mathlib commit, and
`verification/verification.log` is the complete log of a from-scratch build of exactly these
sources, including the generated audit that reports the axiom dependencies of every
declaration. The statement's definitions, the construction, the numerical identification,
and build and audit instructions are documented in
[`docs/technical-overview.md`](docs/technical-overview.md).

## Independent verification

A second author rebuilt the development from a fresh checkout on a separate allocation, ran
`lean4checker` on every module, audited the formal statement against a standalone challenge file,
and ran the Lean FRO's Comparator (statement identity, axiom check, and a full replay of the
exported proof through a second kernel). Scripts, logs and a summary are in
[`verification/independent/`](verification/independent/README.md).
