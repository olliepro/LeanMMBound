# Technical overview

Companion to the README: the exact statement and its definitions, the repository layout,
build and audit instructions, the construction, and the numerical identification of every
rate with its kernel-checked certificate.

## Main theorem

File `src/SuppliedCertifiedPipeline.lean`, namespace
`MatrixBounds.Numeric.SuppliedCertifiedPipeline`:

```lean
theorem exponent_lt {K : Type} [CommRing K] :
    MatrixComplexity.exponent K < (23710449 : ℝ)/10000000

theorem exponent_rat_lt : MatrixComplexity.exponent ℚ < (23710449 : ℝ)/10000000
```

**What is bounded.** `MatrixComplexity.exponent K` (`MatrixBoundsStatement.lean`, which is
`Challenge.lean` without the final theorem; `TensorCore`, `MatrixTensor` and `MatrixExponent`
build on it) is the standard algebraic matrix multiplication exponent over `K`: `matrixRank K n` is the
minimal length of an exact rank decomposition of the `n×n×n` matrix multiplication
tensor (`TensorCore`, `MatrixTensor`; its evaluation equals Mathlib matrix
multiplication), a real `τ` is `Admissible K τ` when `0 ≤ τ` and one constant `C > 0`
satisfies `matrixRank K n ≤ C * n^τ` for all `n ≥ 1`, and `exponent K` is the infimum
of the admissible `τ`.

**Scope.** `K` is any commutative ring in universe `Type`; `exponent_rat_lt` is the
instance `K = ℚ`. Border rank and degeneration appear only inside the proof, through
proved polynomial-coefficient extraction; the final statement is about exact rank.

**Proof chain.** `SuppliedCertifiedAssembly.lean` derives the bound from explicit
identity hypotheses: `stages_level4_of` and `stages_level3_of` turn three axis
identities each into the certified level-four and level-three rate vectors,
`retention_eq_of` combines the root, level-four, level-three, and terminal
identities into the certified million-batch retention, and `exponent_lt_of` feeds
the retention and volume identities into `CertifiedPipelineScalar.exponent_bound_of_actual_extractions`
together with the actual rectangular algorithms of
`SuppliedNormalizedExtraction.asymptotic_extractions`. `SuppliedCertifiedPipeline.lean`
discharges every hypothesis with the proved identities listed under
[Numerical identification](#numerical-identification).

**How to check.** The repository follows the Palomar registry layout. `Challenge.lean` restates
the definitions and the theorem with `sorry`, importing only Mathlib; `Solution.lean` imports
`SuppliedCertifiedPipeline`; `comparator.json` names the theorem and the permitted axioms.

```sh
lake exe cache get
lake build
./scripts/verify-comparator.sh
```

* `lake build` builds `Challenge` and `Solution`, and with them the 2,170 modules of the
  proof's import closure.
* `verify-comparator.sh` runs Lake's Comparator: it rebuilds both modules in a sandbox, exports
  them, checks that `exponent_lt` has exactly the statement of `Challenge.lean` over exactly the
  same definitions, checks that only `propext`, `Classical.choice` and `Quot.sound` are used,
  and replays the whole proof through three kernels (con-ron, nanoda and Lean's own).
* `#print axioms MatrixBounds.Numeric.SuppliedCertifiedPipeline.exponent_lt` in a
  file importing `SuppliedCertifiedPipeline` shows the same three axioms.

**Resources.** On a 16-vCPU, 32 GB machine a from-scratch run takes about 1 h 45 min (6,286 s
in the recorded run): about 4 min for the Mathlib cache, about 25 min for `lake build` (4,762 Lake
jobs, with `LEAN_NUM_THREADS=16`) and about 76 min for Comparator. The whole job peaked at about
20 GB of memory. Generated modules use a large thread stack (`weakLeanArgs = ["--tstack=262144"]`
in `lakefile.toml`). The record of that run is in `verification/palomar-dry-run/`.

## Layout

* `Challenge.lean`, `Solution.lean`, `comparator.json`, `formalization.yaml` — the Palomar
  submission surface.
* `src/` — all Lean modules (flat module names; `lakefile.toml` sets `srcDir = "src"`). The
  generated data modules are in `src/CertificateData`, `src/RateCertificateData`, etc., and
  the fast kernel checks in `src/FKL*` (see [`fast-kernel-checks.md`](fast-kernel-checks.md)).
* `verification/` — the Palomar dry-run record, and `independent/`, Andrew Perrault's audit
  of the Lean 4.24 release.
* `docs/` — this document, the fast-kernel-check notes, and design notes for the paired-fine
  identification stream.
* `numerical-certificate/` — the supplied external certificate and its report (documentation only).
* `scripts/` — Palomar's Comparator, source-check and metadata-validator scripts.

## Build and audit

Lean is pinned to `v4.35.0-rc2` and Mathlib to its `v4.35.0-rc2` tag, and every file uses the
module system. The 2,170 modules in `src/` are exactly the import closure of
`SuppliedCertifiedPipeline` (modules that described alternative routes, and the earlier
generated audit modules, were removed in this release; they remain in the Lean 4.24 release,
commit `884a354`). The source uses no `sorry`, `admit`, custom `axiom` or `native_decide`;
every numeric comparison is checked by the kernel on exact integers and rationals. Allowed
foundational dependencies are `propext`, `Classical.choice` and `Quot.sound`, and Comparator
checks this for the final theorem.

The large table checks of the numerical identification are carried out by the fast kernel
checks of `src/FKL*`: each table is packed into natural numbers, a generic checker is proved
sound once, and the kernel evaluates the checker with GMP-accelerated `Nat` arithmetic. This
replaced the earlier per-node certificate, cache and correction modules. Some module names in
the sections below refer to those superseded modules or to removed alternative routes; they can
be read in commit `884a354`.

## Tensor algorithms and exponent bounds

* `TensorCore`, `TensorProduct`, and `MatrixTensor` define explicit rank
  decompositions, independent axis restrictions, direct sums, products, and the
  matrix multiplication tensor. Its evaluation equals Mathlib matrix multiplication.
* `MatrixExponent` defines the algebraic rank exponent as the infimum of uniform
  polynomial matrix-rank bounds. `RankAmplification` proves padding and powering.
* `PolynomialDegeneration`, `MatrixDegeneration`, and `DegenerationExponent`
  provide polynomial certificates and coefficient extraction with quadratic
  overhead. Powering before extraction removes this overhead from the exponent.
* `CoppersmithWinograd` proves the q+2-term polynomial degeneration.
  `TensorPowers` supplies the q=5 level-four certificate: rank 7^8, leading degree 24.
* `TensorBatching`, `MatrixBatching`, `BatchPowers`, and `AsymptoticSum` prove the
  asymptotic sum inequality for **identical square summands**, including polynomial
  degenerations. A certificate for s independent size-b products with rank r,
  where `r ≤ s*b^rate` and `b > 1`, bounds the defined exponent by rate. Explicit
  recursive batching and tensor powers remove integer rounding.
* `TensorCyclic`, `RectangularBatches`, and `RectangularSum` extend the
  asymptotic sum inequality to identical rectangular summands. Three cyclic
  orientations turn s rectangular products of volume v into s^3 square
  products of side v, with cubed rank and tripled degeneration degree.
* `HeterogeneousProducts` constructs rank decompositions and polynomial
  certificates for products whose factors have different axis alphabets.
* `ExtractionExponent` converts exponential source-rank, output-count, and
  matrix-side estimates into an exponent bound. `SuppliedNormalizedExtraction`
  supplies actual rectangular extractions for the complete supplied pipeline.

## Extraction and repair

The complete **paired mixed approximate extraction** is proved in
`CWAsymptoticApproximateExtraction.eventual_approximate_mixed_extraction`.
Given an available nominal parent certificate, it constructs positive child
windows before choosing populations, then produces batches of the actual full
approximate child tensor. Its copy count is at least `exp(g - error*N)`, and
its rank budget is at most the input rank times `exp(costError*N)` for arbitrary
positive losses and all sufficiently large scheduled sizes. Here `g` is the
explicit nominal minimum of the three global entropy sums, including the
per-parent degree error. `CWNominalRetentionLoss` separates that error from
the zero-error rate. Feasibility, support, zero sectors, empty child pools,
nearby type variation, polynomial profile counts, interpolation, shared-prime
losses, and repair overhead are all included in the checked construction.

`CWAsymptoticContextualExtraction.eventual_contextual_approximate_extraction`
proves the stronger transformation needed for successive stages: every finite
companion tensor, including waiting factors and old copy labels, is preserved.
The complete extraction, repair, nearby-profile gluing, and vanishing-overhead
estimates are proved in this contextual form. `ContextComposition` composes
these actual transformations, multiplying the old and new output counts.
`ContextRank` converts the original polynomial certificate to exact rank once.

`SectorAllocation` and `RationalSectorAllocation` give actual variable restrictions
from parent mixture windows to labelled sector windows. `ActivePools` removes
empty pools; `TensorOrientations`, `CWAxisPermutations`, and `PhysicalRoles`
verify all six physical axis orders and their bookkeeping. `ContextProducts`
preserves waiting factors, while `ContextSequenceRates` composes finite sequences
and proves the product copy counts and summed rate bounds.

The terminal constituent has explicit integer extraction data.
`CWTerminalCoarse` and `CWTerminalDegreeRate` prove uniqueness of the joint
split type from its marginals and the resulting coarse-degree entropy bound,
including endpoint laws. `CWOneLetterEntropy` proves zero pooled compatibility
entropy. `CWTerminalMatrices.contextReduction_terminal_matrix` transforms the
actual terminal child target with split counts `(a,b,b,a)` into matrix
multiplication of dimensions `(q^(2b), q^(2a), q^(2b))`, preserving every tensor
context. `CWTerminalMatrixRates` identifies their exact logarithms with the
claimed terminal dimension rates. `CWTerminalParentLaws`, `CWTerminalCenters`,
and `CWTerminalRetention` identify the actual complete fine laws, parent-window
centers, and all three counting rates. `CWTerminalExtraction` supplies the finite
mixed terminal matrix extraction. `CWTerminalAsymptotic.eventual_terminal_extraction`
absorbs its shared-prime, Behrend, and repair losses, starting from every fixed
positive parent window and preserving arbitrary waiting factors. Its thresholds
are chosen before the terminal population counts.

`ShapePermutations`, `TypeRelabeling`, and `CWShapePermutations` transport actual
shape alphabets, exact words, marginals, and child complements. `CWPermutedTerminalData`
constructs feasible symmetric terminal split data for all physical permutations;
`CWPermutedTerminalLaws` identifies their full parent laws and entropy vectors.
`CWPermutedTerminalAsymptotic.eventual_permuted_terminal_extraction` combines
arbitrarily oriented terminal types in one actual extraction, using the minimum
after summing the physical-axis rates. Its common window and thresholds are
chosen before both the orientations and the population counts.
`CWPermutedTerminalMixedTarget` proves the exact matrix volume of this combined
output; all these transformations preserve arbitrary waiting tensor factors.

`CWRootAsymptoticApproximate.eventual_approximate_extraction` proves the
unrestricted root step from the original CW power. It constructs complete child
windows, with a uniform positive tolerance chosen before the populations and
profiles. The actual coarse graph, fine incidence counts, shared prime, variable
restrictions, sparse repair, and exact-profile gluing are proved. Both retained
copy loss and total overhead can be made arbitrarily small in exponential rate.
`CWRootData.rootPowerCertificate` preserves the original `(q+2)^(length*N)`
rank budget. Root fine rates use single child multiplicities, without a paired
parent or an assumed extraction theorem.

`CWPermutedTerminalInterfaces` identifies complete physical terminal windows.
`CWZeroRationalExtraction` supplies actual zero-coordinate matrix restrictions
and uniform rational dimension rates. `CWExactGibbs` and
`CWPermutedTerminalNominal` identify terminal rates with the general mixed
extraction rates in every physical orientation. `CWSharedTerminalTarget`
converts the terminal part of a shared output to complete matrix factors while
preserving the ordinary child windows and all retained copy labels.

`VerifiedCWApproximateData` turns the supplied split rows directly into
supported symmetric extraction data. `CWRationalRates` and `CWRootRationalData`
identify their actual normalized rates and parent centers with fixed rational
expressions. `CWRootRationalExtraction.eventual_rational_extraction` constructs
the rational root's references and scale bounds internally.
`CWPhysicalWindows` transports complete windows through all six physical orders;
`CWPermutedCoarseData` transports their references, symmetry, and parent laws.
`CWMixedSumInterfaces` regroups both the input and output of shared rounds.

`CWRationalStage.RationalStage.eventual_extraction` packages fixed supported
rational parameters into the complete contextual extraction with one arbitrary
positive loss. It constructs graph references and scale bounds internally.
`CWRationalChildren` identifies every actual child population with its fixed
integer coefficient times the common scale. `ScaledSectorAllocation` gives
the corresponding exact labelled allocation maps. `CertifiedRootParameters`
binds the supplied root row to its actual XZY physical orientation.

`ContextHeterogeneousBatching` combines finitely many independent extractions
with the product copy count and cost, retaining their entire vectors of labels.
`PipelineTensorSchedule` partitions actual batch tensors into active and waiting
factors and composes the shared rounds, preserving all waiting factors in every
new copy. `PipelineActiveRates` identifies the active labels with their physical
phase rates. `PipelineCertificate` proves the final rank bound with exactly
K+2 rounds and the complete warm-up and drain correction, given those rounds'
actual extraction bounds and the original certificate.
`CWRationalStageAssembly` constructs the shared extraction for any finite family
of fixed rational stages, preserving their separately labelled outputs and
earning the bottleneck of the sum of their physical rates. `WeightedSectorAllocation`
and `WeightedPools` handle fixed integer role coefficients and neutral zero pools.

The final exponent additionally needs the labelled role allocations, successive
interfaces, and supplied parameters instantiated in the finite batch schedule
(the `Supplied*` modules below), and the identification of their rates with the
checked numerical expressions (the identification streams described under
[Numerical identification](#numerical-identification)).

`SuppliedPopulationPaths` fixes the actual integer populations from the original
source rows and retains both prior physical role choices in later child labels.
`SuppliedPathStages` constructs shared extractions for these complete labelled
stages and proves that their rate sums equal the aggregated source formulas.
`SuppliedScaledRoot` supplies the actual root at the same population scale.
`SuppliedShapeInterfaceBindings` checks the complete shapes and laws connecting
successive original positive children and their next parent interfaces.
`PhysicalRoleRouting`, `CWRoleWindowRouting`, and `SixfoldExtraction` prove
coordinate routing and extraction across all six source orientations.
`SuppliedTerminalRationalChildren` converts shared terminal outputs to full
matrix factors, and `SuppliedTerminalRationalDimensions` proves their exact
logarithmic volume. `SuppliedPhysicalZero3` and `SuppliedPhysicalZero4` prove
matrix extraction from the original higher zero-coordinate windows.
The complete composition through all child sectors and the finite batch schedule
is proved in `SuppliedSourcePipeline` and `SuppliedNormalizedExtraction` (below);
equality of the resulting rates with the checked numerical rate expressions is
proved in the identification modules.


* `HashCounting`, `HashConditional`, and `MatrixBounds` prove the shared hash
  identity and exact conditional collision probabilities. `ProgressionBuckets`
  uses Mathlib's Behrend construction to give prime-field progression-free buckets.
  `HashEdges` and `HashCollisionRates` check the X-, Y-, and Z-shared collision
  cases, fixed-bucket survival probability, and conditioned competitor union bound.
* `CWConstituents`, `CWRegroup`, `CWPairing`, and `CWParentHoles` identify actual
  coarse CW constituents, regroup labelled child slots into parents, and show
  that parent acceptance restrictions delete whole child fine blocks.
* `SplitPairing`, `ShapeAlphabet`, and `VerifiedSplitProfiles` turn the supplied
  checked split rows into feasible symmetric exact profiles at every divisible
  size and construct the corresponding parent/child slot bijections.
* `HashModulus` chooses an odd prime within a factor of two of a given requirement.
  `HashIntegerWords` checks the no-wrap condition before applying each collision law.
  `HashSurvivors` and `MixedSelection` select a single seed with at least
  G*|B|/(2*M^2) good edges and inverse-scale fine-axis collision holes.
  `BehrendRetention` makes the bucket loss explicit as G/(6*M)*exp(-4*sqrt(log M)).
* `TensorHashing` constructs actual hash masks and proves coarse-X ownership
  determines the full surviving coarse edge. `SequentialExtraction` allows
  the Z compatibility test to use the full Y type imposed at the preceding stage.
* `OwnedTargets` identifies extracted owner pieces with damaged copies of a
  common target. `RepairedTargets` connects a damaged-batch polynomial
  certificate to the complete-batch finite rank bound. `CWInterfaceSize`
  supplies uniform coordinate-growth bounds for heterogeneous exact CW targets.
* `VariableExtraction` constructs three axis maps for unique compatibility owners.
  Under explicit necessary compatibility conditions, the output pieces are
  independent and inherit a polynomial certificate.
* `BatchSymmetry` and `BatchRepair` repair a whole retained batch with different
  hole patterns per copy. The overhead multiplies the batch budget once.
* `CWPartition`, `CWZeroSlice`, and `CWFineCompatibility` derive coarse support
  and the necessary complementary fine-type conditions from actual CW coefficients.
  `CWZeroMatrix` provides coordinate maps for the zero-sector matrix constituents.
* `CWMixedHash` instantiates the shared hash equation on nonzero coefficients
  of heterogeneous CW products, allowing different selected child lengths.
* `RegularFibers` proves the exact A/B and G/B competitor identities by
  equivariance. `CompatibilitySymmetry` proves constant compatibility degrees
  within a fixed coarse word using its stabilizer.
* `CWCoarseHalves` and `CWCoarseGraph` prove that every nonzero filtered parent
  coefficient has an edge in the finite graph of admissible child words.
  `CWCollisionCounts` derives all three integer collision bounds for those words.
* `PooledCompatibility`, `CoarsenedCompatibility`, and `PartialSectorTypes`
  define the actual sector predicates, count their words, and prove that pooled
  restrictions plus forced child types imply the finer compatibility tests.
  `PooledEntropy` includes empty sectors in the entropy estimates.
* `CWPooledCompatibility` defines the asymmetric Y/Z sector maps and proves
  their permutation invariance. `CWPooledDegrees` derives the pointwise
  competitor bound by exact double counting. `CWCompatibilityNecessary`
  proves necessity of these tests for actual nonzero CW coefficients.
* `CWUniformPairing` constructs a common parent tensor and its explicit CW
  certificate. `PairingSectorTypes` proves that mapped target variables satisfy
  the labelled child profiles and pooled predicates. `SupportedTypes` and
  `VerifiedCWPairing` connect checked full-table profiles to the actual support
  alphabet and the fixed-parent coordinate maps.
* `LabelledConcentration`, `GroupedMoments`, `GroupedConcentration`, and
  `PairingConcentration` prove the parent-interface hole estimate for the
  actual complementary pairing. Repeated child labels use sampling without
  replacement; empty groups are included. The bound is uniform in the child
  profiles and has the integer inverse-population form needed by repair.
  Its mixture center is explicitly the independent-concatenation distribution.
* `CWParentCompatibility` splits actual parent coordinates and proves the
  necessary Y and Z ownership tests from nonzero parent coefficients, with
  the full Y types imposed before the Z test.
* `CWCoarseOwnership`, `CWAxisPooling`, `CWSequentialData`, and
  `CWSequentialExtraction` construct the actual sequential owner restrictions
  and prove that cross-copy coefficients vanish. `CWWindowedSource` starts this
  extraction from the available approximate parent interface at the same budget.
  `CWPrescribedGraph` proves that its prescribed edge count is exactly the
  multinomial type count. `CWTargetMaps` supplies each prescribed edge's maps
  from one common child target, preserving coefficients and all required types.
  `SelectedTargets` handles an injected subfamily of the independent owner pieces.
* `RefinedOwnership`, `CWWindowedOwners`, and `CWTargetOwnership` identify final
  ownership with the exact union of parent-window and compatibility-collision
  holes. `CWTargetCoefficients` and `CWExtractedTargets` produce the actual
  damaged common-target batch from the available parent interface certificate.
  `CWTargetSymmetry` and `CWRepairedTargets` instantiate simultaneous repair,
  including the target group action and coordinate growth. `CWTargetConcentration`
  gives one parent-hole bound for every prescribed edge and permits collision
  counts to be restricted to blocks inside the parent window.
* `CWCompatibleCollisions` bounds actual X/Y/Z ownership collision events by
  the corresponding graph degrees. `IncidenceRates` and `CoarseRetentionRates`
  derive the entropy bounds on those degrees from finite cardinalities and
  positive Gibbs potentials, with explicit error terms.
* `MassEntropy` and `PooledMassEntropy` identify the sector exponent with the
  verifier's unnormalized pooled entropy expression. `LogarithmicLoss` gives
  explicit thresholds that absorb the finite logarithmic errors. Parent
  entropy continuity is uniform over all empirical population sizes.
* `SectorTypes` counts pooled, separately labelled child sectors as a product
  of exact type counts, including unequal sector sizes and entropy errors.
* `FiniteSelection` proves union, Markov, and averaging bounds for retaining many
  acceptable copies, without assuming independent deletion stages.
* `FiniteCover`, `FiniteRepair`, `SparseRepair`, `RepairRates`, `SymmetryCounts`,
  and `TensorSymmetry` construct actual repair maps with subexponential cost.
  Both inverse-square and inverse-linear hole bounds are available.
* `EmpiricalTypes`, `ExactInterface`, and `HeterogeneousInterface` define exact
  typed interfaces, permutation actions, transitivity on parts, equivariance,
  and coefficient invariance, including products with different alphabets.
* `TypedFiberCounting` counts actual typed coordinates, including unequal part sizes.
  `CWFiberCounts` computes CW fine-block sizes as q to the number of middle symbols.
  `CWTypedDimensions` combines these with multinomial estimates to obtain the
  entropy-plus-middle-coordinate formula for actual dimensions. `CWZeroExact`
  supplies explicit coordinate maps from an exact zero-Z interface to a genuine
  1-by-dimension-by-1 matrix multiplication tensor with that full dimension.
* `TypeCounting` proves exact multinomial counts and profile feasibility.
  `TypeEntropy` proves entropy bounds for actual heterogeneous word counts.
  `GibbsCounting` and `ConstrainedCounting` directly bound admissible word counts
  using positive Gibbs weights. `TypeDenominators` obtains fixed rational profiles at arbitrarily large divisible
  sizes on the same subsequence used for repair.
* `TypePartition` partitions accepted interfaces into polynomially many exact
  type pieces and glues them by a restriction from independent sources.
  `SubtypeExtension`, `TypeBatchGluing`, and `HeterogeneousTypeGluing` extend
  genuine exact-interface algorithms to ambient axes and glue a common number
  of output copies. The separately labelled heterogeneous pools are preserved.
  `ProfileCountRates` bounds the full profile count by a fixed polynomial and
  proves that this cost is eventually below any positive exponential loss.
  `UniformRetainedBatch` derives a common integer copy count from a shared
  prime cap, allowing different exact types to use different selected primes.

## Concentration and continuity

* `TypeSampling` proves the exact without-replacement pair law.
* `FiniteSampling` and `TypeSamplingGeneral` show that k distinct slots in a
  uniform exact-type word differ from independent sampling by at most k^2/N for
  every event, using finite equivalences and transitive permutation actions.
* `SamplingBounds` and `IndicatorConcentration` prove finite second-moment bounds
  and concentration from one- and two-point distribution errors.
* `BlockConcentration` applies these results to disjoint blocks in **one exact-type
  word**. For m paired-child blocks with N=2m slots, the bad-word fraction for a
  fixed pattern is at most `13/(m*tolerance^2)`. A union bound controls all patterns.

* `ProductSampling` and `HeterogeneousConcentration` extend this to independent
  pools with different alphabets and sizes. For m parents with k_t slots from
  each pool, the bad-pattern fraction is at most
  `(1 + 6*sum_t k_t)/(m*tolerance^2)`, uniformly over feasible profiles.
  A finite union bound controls all parent-pattern coordinates.
* `ConcentrationRepair` converts parent-type concentration to the exact integer
  hole bound used by repair. `CollisionHoles` supplies the corresponding Markov
  bound without independence assumptions. `ApproximateTypes` and
  `AcceptedRestrictions` realize tolerance-window inclusion by actual axis maps.
* `InterfaceContinuity` proves uniform finite-alphabet entropy continuity and
  the `2*tolerance` stability of mixed independent-concatenation distributions.
  `CWProfileLaws`, `CWLawStability`, and `CWRetentionContinuity` connect these
  estimates to the actual empirical child profiles and pooled mass entropies.
  Retention continuity is uniform over all populations and feasible split
  profiles, including empty child pools. `CWNearbyWindows` supplies the
  nominal-parent window inclusion and a budget-preserving certificate map.
  `CWDegreeControlShrink` permits arbitrarily small positive parent tolerances.

## Numerical certificate

The parameters are task 028 of the project owner's OSC parameter search (campaign `wave01`),
frozen to exact dyadic rationals with denominator 2^44 by that campaign's certifier. The
formalization requires every terminal parameter `mu` to be strictly between 0 and 1/2; the
search produced 71 entries equal to 0 and one equal to 1/2, so the shipped certificate replaces
each 0 by 2^-44 and the 1/2 by (2^43-1)/2^44; the change moves the exact scalar by about
4e-17, and the theorem is about the shipped parameters. The unmodified search output (SHA256
`c6765a6076ec2edc6daabfcc2260927d7a245de1987353cc5d11a1af049eb250`) is held by the search
campaign; `interval_report_wave01.json` is that campaign's certifier report for it. The project owner's original `Pipeline Verifier Standalone.zip` provided the verifier; its
files and reproduced report are preserved in `numerical-certificate/`. NPZ SHA256:
`61b184d2a8e92e5a6330841867776fb95b569b9a7d5fbe8f90fa3e66d404ac6c`.

The external verifier passed. At 1,000,000 batches it encloses the candidate in
`[2.3710447333440032, 2.371044733425613]` (report in `numerical-certificate/report.json`).
The Lean kernel checks the same exact rational logarithmic expressions and their
strict budget in `CertifiedPipelineScalar.scalar_bound`, without any floating-point
evaluation, and those expressions are identified with the actual rates of the
constructed extraction pipeline by the identification modules described under
[Numerical identification](#numerical-identification). The external report is
retained for reproducibility; the Lean proof does not use it.

`DyadicData` and 127 `CertificateData.PartNNN` modules encode all 15,279 distinct
simplex rows with exact integer numerators and denominator 2^44. Lean's kernel
checks their column bounds and exact normalization. `dyadic_row_index.json`
records array shapes and row mappings. `SplitData`, `SplitSemantics`,
`SplitCertificateData`, and `VerifiedSplitData` also check all 5,775 distinct
contextual split rows: correct parent/child totals, admissible support, and
complementary symmetry. Their sparse entries are related to unique shape columns.
`TerminalParameterData` additionally checks all 17,010 original terminal
parameters are strictly between zero and one half. `CertifiedTerminalParameters`
and `CWTerminalScaling` realize each by positive integer split counts at the
common denominator and all its positive multiples, with the exact parameter,
parent law, and logarithmic matrix dimension. The indexed derived distributions
are bound to the instantiated pipeline by the `Supplied*` modules described below.

`GibbsData` and `GibbsCertificateData` represent all 16,629 distinct supplied
coordinate-potential rows by exact integer numerators and power-of-two
denominators. Every entry is proved strictly positive in Lean. These checks
establish admissibility of the supplied Gibbs inputs. The complete numerical
expressions described below are checked as standalone kernel computations and
then identified with the construction's rates by the identification streams.

`VerifiedOrbitLevel2`, `VerifiedOrbitLevel3`, and `VerifiedOrbitLevel4` check all
supplied word-to-orbit labels and sizes against actual recursive finite word
partitions. This includes all 6,561 complete words and 231 orbits at length eight.
`VerifiedOrbitStatistics` and `VerifiedOrbitComplements` prove the exact coarse
totals, middle-symbol counts, and complement action of those partitions.
`CWRationalOrbitParents`, `CWRationalOrbitRates`, and `CWRootOrbitRates` prove
that the actual derived parent laws and compatibility pools have the compressed
entropy formulas, including the root's different child multiplicity.

`ZeroOrbitCertificateData` checks exact normalization and coarse support for
8,797 distinct supplied zero-leaf row/target pairs, reusing the original dyadic
data. `CWZeroOrbitDimensions` and `CertifiedZeroOrbitExtraction` connect accepted
rows to actual matrix factors with the compressed entropy-plus-middle-count
dimension rate. Their full index binding is carried out by `SuppliedZeroExtractions`
and the dimension identification stream.

`EntropyBounds`, `FactorialEntropy`, `LogEnclosures`, `RationalIntervals`, and
`CertifiedConstants` prove Gibbs bounds, multinomial estimates, logarithm
enclosures, interval operations, and the source-cost enclosure.
`RationalIntervalOperations`, `IntervalPowerTrace`, and `NormalizedLogTrace`
add exact checked outward rounding and finite rounded power certificates for
natural logarithms. `ScaledLogTrace` extends these certificates by exact binary
range reduction. `CertifiedLogTraces` demonstrates complete kernel checks for
logarithms of 5, 7, and a rational with denominator 2^400, with interval width
at most 10^-12. These use kernel reduction, not native computation.
`RationalEntropyIntervals` proves sound enclosures of actual decoded word
entropy and unnormalized compatibility entropy from rational orbit masses.
`RationalOrbitArithmetic` identifies computable rational parent and mixture
formulas with their exact real counterparts. `CWTerminalOrbitLaws` and
`VerifiedZeroOrbitLaws` identify the actual terminal and zero-axis fine laws in
the supplied orbit coordinates.

`FixedIntegerIntervals`, `FixedCubicLogBounds`, `IntegerLogParameter`, and
`IntegerLogQuery` prove a fast integer checker for actual real logarithms.
Its exact binary and grid reductions, cross-multiplied parameter bounds,
cubic approximation, geometric remainder, and outward integer rounding are all
proved. `CertifiedLogGrid` and `FixedLogGrid` supply 256 proved shared grid values.
No floating-point evaluation participates in a Lean proof.

All **216,152 weighted logarithmic terms**, involving **156,935 distinct positive
rational arguments**, are checked in 429 `RateCertificateData` blocks.
`IntegerLogLinearCertificates` and `CertifiedLogBlocks` prove their signed sums.
The fifteen `Certified*Rate*` modules retain the complete exact real expressions
and their proved integer endpoint enclosures. These certificate term lists are
the unchanged input of the identification streams: no term list was edited when
the identities were proved.

`PipelineNumericIntervals` accounts for all three physical rate axes and every
finite boundary term. `CertifiedPipelineScalar.scalar_bound` proves that the
resulting expression at **1,000,000 batches is strictly below 2.3710448**;
`scalar_below_target` proves it is below 2.3710449. This is a checked scalar
statement about the certified expressions. `exponent_bound_of_actual_extractions`
states the actual-extraction condition that turns it into a matrix-exponent
theorem; that condition is discharged in `SuppliedCertifiedAssembly.exponent_lt_of`
from the actual extractions and the proved rate identities.
`RectangularExtractionExponent` proves that genuine rectangular extractions with
arbitrary small losses suffice.

`RationalLogExpressions`, `RationalLogNormalization`, `OrbitLogExpressions`,
`CoarseLogExpressions`, `RootLogExpressions`, and `TerminalLogExpressions`
connect symbolic entropy expansions to the actual extraction formulas and
integer matrix dimensions. Exact sorting and coefficient coalescing preserve
their real values. `SeparatedPoolEntropy` and `CWSeparatedPools` prove the
verifier's separate-child and ordinary-pool decomposition, including zero weights.
These bridges are instantiated at every supplied index, and the aggregate
symbolic identities with the fifteen checked expressions are proved, in the
identification streams described under
[Numerical identification](#numerical-identification).

`CheckedIndexTable` preserves the original array order with a proved lookup tree.
`ParameterIndexData` binds all 104,530 original array references to their accepted
rows. `SuppliedShapeIndices` identifies the complete original shape arrays and
proves that all 945 positive and 840 zero nodes are exactly the admissible children.
The four exceptional terminal-policy positions are retained explicitly.

`SuppliedTypedParameters` constructs the actual rational splits, normalized
strategy and role vectors, zero-leaf orbit vectors, and positive Gibbs potentials
at their original finite indices, with all input validity and alphabet-size
conditions discharged. `SuppliedHierarchyParents` binds their coarse parents.
`SuppliedTerminalLaws` identifies every indexed terminal law with its genuine
integer-count extraction parent center. `SuppliedLeafLaws` constructs all complete
level-two laws, level-three parent laws, and six-strategy mixtures and proves their
normalization and coordinate bounds. `SuppliedNodeLookup` proves all 4,725
parent/child lookups and their inverse source-node bindings, including every
absent support entry. `SuppliedHigherLaws` constructs normalized, bounded
higher parent and root-child laws. `SuppliedLeafOrbitMass` and
`SuppliedHigherOrbitMass` prove that exact rational compressed masses decode to
all these actual complete laws, with exact entropy identities.

`SuppliedRootStage.eventual_extraction` instantiates the actual contextual root
extraction with the supplied parameters and the physical X-Z-Y orientation.
`SuppliedStage3` and `SuppliedStage4` instantiate shared paired extraction
for labelled collections of the original source parameters in every physical role.
`SuppliedStrategyAllocation` and `SuppliedRoleAllocation` realize the original
strategy and role rows as actual disjoint tensor restrictions with exact integer
population coefficients. `SuppliedZeroExtractions` instantiates canonical matrix
extraction for every higher zero row, with all original source support conditions
checked. `OrientedZeroLawIdentities` proves the corresponding fine-law axis
identities. All physical tensor interfaces and the six-region assembly are proved.

The supplied stages have proved complete source and child interfaces in all
six physical regions (`CWRationalStagePresentation`, `CWRationalSixfoldAssembly`,
`CWRationalCanonicalInterfaces`, `SuppliedStagePresentations`). The actual root
extraction reaches the original complete child windows with their exact integer
populations (`SuppliedRootPopulation`, `SuppliedRootChildren`, `SuppliedSixfoldRoot`).
`SuppliedInitialAllocation` proves the complete initial transition, retaining all
zero-coordinate factors and allocating every positive parent into its original
level-four role sectors. `SuppliedAllocationWindows` realizes every subsequent
strategy and role allocation while preserving all preceding role labels.
`SuppliedNodePartialIndexing`, `PartialWindowReindexing`, and the zero-weight
restoration lemmas prove that partial hierarchy lookup can omit only neutral
empty windows. `SuppliedLevel4Transition` and `SuppliedLevel3Transition`
prove both complete later interfaces, preserving every history label.

`SuppliedSourcePipeline.eventual_extraction` composes the original sixfold CW
sources, all initial allocations, and the entire finite shared pipeline into
all completed batches. It proves actual integer copy and overhead bounds,
including startup and drain rounds. `SuppliedBatchWidths` and
`EventualContextSequence` choose each positive window width before the growing
scale and supply a common threshold for every finite round. Waiting factors
remain inside every retained batch; none are merged across earlier histories.
`SuppliedSourceCertificate` supplies the original polynomial rank certificate.

`SuppliedWaitingZero2Sixfold`, `SuppliedWaitingZero3Sixfold`, and
`SuppliedWaitingZero4Sixfold` extract genuine matrices from every complete
sixfold waiting family, with arbitrarily small volume loss. The exact zero2
support certificate checks all 68,040 original leaf references in 34 bounded
modules. `SuppliedTerminalMatrix` and `SuppliedTerminalSixfoldMatrix` prove the
actual terminal matrix restriction and its exact logarithmic volume.
`SuppliedCompletedMatrix` and `SuppliedPipelineMatrix` combine every waiting
and terminal factor, with a common threshold for all separately chosen windows.

`SuppliedNormalizedExtraction.asymptotic_extractions` unconditionally
constructs actual standard rectangular matrix multiplication algorithms from
the original supplied CW sources for every positive error allowance. It proves
source rank, retained-copy count, and complete matrix-volume bounds with the
normalized cost `8*log 7`. `SuppliedSourceRank` includes the one polynomial
coefficient-extraction overhead. `SuppliedNormalizedRates` preserves the exact
finite startup and drain terms when changing the population unit.
`SuppliedNormalizedExtraction.exponent_le` consequently needs only positivity
of the actual volume and a strict scalar budget for these actual rates; both are
supplied by the identities below.

`SuppliedRootCoarseRate.rate_eq` identifies the actual root coarse retention with
its certified numerical expression. `SuppliedRootFineBinding` and
`SuppliedTerminalRateExpression` bind the other root and terminal semantic
rates to exact rational logarithmic expressions; their comparisons with the
supplied numerical certificate are the root fine and terminal streams below.

## Numerical identification

The exponent theorem needs the actual normalized rates of the constructed
pipeline to equal the kernel-checked certificate expressions of
`CertifiedPipelineScalar`. `SuppliedCertifiedAssembly` states these as twelve
axis-rate identities (three physical axes at each of the root, level-four,
level-three, and terminal stages, i.e. the twelve `CertifiedRootRate*`,
`CertifiedLevel4Rate*`, `CertifiedLevel3Rate*`, and `CertifiedTerminalRate*`
values) plus the matrix-volume identity (the sum of the three
`CertifiedDimensionRate*` values); `SuppliedCertifiedPipeline` proves each one
from the identity streams below. On the construction side every rate is a sum, over the
original source nodes, roles, and strategies, of parent orbit entropies minus
isolated-child and pooled-sector entropies (for the fine axes) or of coarse
Gibbs entropies (for the coarse axes), with integer population coefficients; on
the certificate side every rate is a fixed list of weighted logarithmic terms in
`RateCertificateData`. The streams prove that both sides are the same real number.

**Methodology (common to all streams).** The construction's rational entropy
expressions are normalized, node by node, into canonical sorted term lists by
a kernel `decide` on exact integer numerators at a fixed power-of-two
denominator. The certificate term lists are cut into windows aligned with
blocks of source nodes, and each block's normalized construction expression is
compared window by window with the corresponding certificate window. Where the
two sides differ in form (for example the certificate's normalized child
entropy terms `log p_c,i` against the construction's pooled terms
`log (2 w_c p_c,i)`, whose shared-argument parts appear in neighbouring
windows), the difference is a fixed correction expression; the corrections are
listed in a table and are proved to cancel exactly when summed. Every numeric
step is `decide +kernel` on exact rationals; the certificate term lists are
unchanged from the earlier checkpoint, and no floating-point value enters any
proof. The certificate data is bound to the actual construction because each
block module reads the same node tables (`SuppliedRootFineParent3Block`,
`SuppliedRootFineParent4Block`, `SuppliedNodeLookup`, `SuppliedTypedParameters`)
that define the instantiated stages, and its summary value is proved equal to
the value of the corresponding stage rate summand (the `*_value` lemmas of the
shared node and block modules).

**Root coarse (1 identity).** `SuppliedRootCoarseRate.rate_eq` identifies the
actual root coarse retention with `CertifiedRootRate0`. This identity was
already present in the earlier checkpoint.

**Root fine (2 identities).** `SuppliedRootFineCertifiedRates.retention_eq`
proves `SuppliedRootStage.retention = bottleneck CertifiedPipelineScalar.rootRates`,
combining the coarse identity with the two fine axes. The fine axes are computed
through 945 `SuppliedRootFineParent3Block` modules (level-three parent tables at
denominator 2^134), 105 `SuppliedRootFineParent4Block` modules (level-four parent
tables at 2^406), and 5 `SuppliedRootFinePoolBlock` modules; `SuppliedRootFineCheck1`
and `SuppliedRootFineCheck2` decide, in the kernel, that the assembled root fine
expressions equal `CertifiedRootRate1` and `CertifiedRootRate2`.

**Paired coarse (2 identities).** `PairedCoarse4Certified.normalized_rate_eq`
and `PairedCoarse3Certified.normalized_rate_eq` (namespace
`MatrixBounds.Numeric.SuppliedPairedCoarse`) identify the level-four and
level-three coarse axis rates (`rates 0`, normalized by the root weight) with
`CertifiedLevel4Rate0` and `CertifiedLevel3Rate0`. Level three uses 135
`PairedCoarse3NodeCache`, 135 `PairedCoarse3SourceBlock`, and 135
`PairedCoarse3Boundary` modules; level four uses 15 `PairedCoarse4SourceBlock`
and 15 `PairedCoarse4Boundary` modules. Each level has a certificate table module
cutting its `RateCertificateData` blocks into windows and a corrections module
whose exact cancellation is decided in the kernel.

**Paired fine (4 identities).** `SuppliedPairedFineCertified.level3_rate1`,
`level3_rate2`, `level4_rate1`, and `level4_rate2` identify the two fine axes of
the level-three and level-four stages with `CertifiedLevel3Rate1/2` and
`CertifiedLevel4Rate1/2`. The shared modules `SuppliedPairedFineSourceExpressions`,
`SuppliedPairedFineStageExpressions`, `SuppliedPairedFinePoolArithmetic`,
`SuppliedPairedFinePhysicalPools`, `SuppliedPairedFineIntegerParents`,
`SuppliedPairedFineSingletonLabels`, `SuppliedPairedFineSplitPools`,
`SuppliedPairedFineNodes`, `SuppliedPairedFineBlocks`, and
`SuppliedPairedFineTableReads` reduce each stage rate to a sum of per-node
expressions of the form: source mass times (parent orbit entropy at the
physically permuted axis, minus `2 w_c` times the orbit-mass entropy of every
isolated child `c`, minus the orbit-mass entropy of every pooled coordinate
sector), where the isolated columns and pool coordinates are determined by the
physical role permutation. Per parent, 105 `PairedFine4Children`,
`PairedFine4Parent`, and `PairedFine4Node` modules check the literal level-four
child and parent numerators against the stage data and decide the twelve
role-by-axis node summaries; 15 `PairedFine4Block` and `PairedFine4Boundary`
modules per axis merge seven-source blocks and compare them with the certificate
windows. Level three uses 135 `PairedFine3Cache`, `PairedFine3Block`, and
`PairedFine3Boundary` modules per axis. Each axis of each level has its own
certificate table and corrections module, with the shared-argument corrections
proved to cancel exactly. `docs/paired-fine-design.md` records the
exact mathematical form and the module design.

**Terminal (3 identities).** `SuppliedTerminalRates.vector_eq` (in
`SuppliedTerminalRateBinding`) identifies the whole terminal rate vector with
`CertifiedPipelineScalar.terminalRates`, through 135 `TerminalRateInputBlock`
modules and 135 `TerminalRateAxis{0,1,2}Block` modules for each of the three
physical axes, assembled by `TerminalRateAxis0Binding`, `TerminalRateAxis1Binding`,
and `TerminalRateAxis2Binding`.

**Dimension (1 identity).** `SuppliedDimensionRates.normalized_volume_eq` (in
`SuppliedDimensionRateBinding`) identifies the actual normalized matrix volume
with `CertifiedPipelineScalar.volume`. It is assembled from 267
`SuppliedDimensionBoundary` modules: 135 leaf blocks
(`SuppliedDimensionLeafInputData`, `SuppliedDimensionLeafInputCheck`,
`SuppliedDimensionLeafInputBlock`, `SuppliedDimensionLeafCachedBlock`), 120
zero3 blocks, and 12 zero4 blocks, compared with the windows of
`SuppliedDimensionCertificateTable0/1/2` with the corrections of
`SuppliedDimensionCorrectionData`.

## Finite extraction and asymptotic assembly

`CWFiniteExtraction.finite_split_extraction` proves the complete finite
selection-and-repair step for one fixed parent shape and child length. Its input
is a certificate for the available parent-window tensor, supported feasible
child profiles, and explicit size bounds. The output gives both the retained
copy count and a rank bound for complete independent child targets.
`CWActiveCollisions`, `CWFineCollisionCounts`, `CWTargetSupport`,
`CWWindowCollisionRates`, and `CWActualSelection` supply the actual graph
collision counts, support checks, accepted-window degrees, and common seed.
The heterogeneous construction has an actual product graph on the disjoint
union of all parent positions (`CWMixedGraph`), one global conditional collision
law (`CWMixedCollisionCounts`), and product bounds on its degrees
(`CWMixedDegrees`). `CWMixedSource`, `CWMixedOwnershipData`, and `CWMixedOwnership`
prove global coarse forcing and physical sequential ownership without requiring
any component to have an independently active hash. `HeterogeneousMasks`,
`CWMixedPrepared`, and `CWMixedWindowedOwners` preserve the available
parent-interface certificate through these restrictions. `CWMixedTargets`
gives the common heterogeneous child target and its actual coordinate maps.
`CWMixedEvents`, `CWMixedActualCounts`, and `CWMixedSelection` prove
quantitative selection for these actual global collision events: one seed
retains the finite mixed-selection count, with the modulus bounded against
products of local degrees on each axis, and sparse global fine-part collisions.
`CWMixedTargetOwnership`, `CWMixedTargetCoefficients`, and
`CWMixedExtractedTargets` identify the actual global ownership holes and supply
the whole independent damaged-target batch from the available parent-interface
certificate. `ProductHoleCounts`, `CWMixedConcentration`,
`CWMixedTargetSymmetry`, and `CWMixedRepairedTargets` supply the actual global
parent-hole bounds, symmetries, coordinate growth, and simultaneous repair.
`CWFiniteMixedExtraction.finite_mixed_extraction` assembles these into the
complete finite extraction-and-repair theorem with one shared hash across
different parent shapes and child lengths. Its modulus requirements use products
of local degrees before comparison across axes.

`CWMixedEntropyExtraction.finite_mixed_entropy_extraction` derives the
degree requirements from actual coarse Gibbs and fine pooled-entropy rates.
`CWDegreeControl` constructs a threshold and positive tolerance independent of
population and profiles for every positive entropy loss. `CWCoarseRates` and
`CWCompatibilityRates` prove the finite logarithmic errors; `CWAsymptoticDegrees`
absorbs them above that threshold. `CWMixedRateExtraction` constructs the shared
prime requirement and proves a retained-copy lower bound with the minimum of
the three summed rates, an explicit polynomial factor, and the Behrend loss.
Its output consists of complete exact heterogeneous child targets. The approximate
interface construction and full finite pipeline are proved as described above,
and the actual final rectangular matrix output and its asymptotic rank bounds are
proved in `SuppliedNormalizedExtraction`.

The final assembly is then short: `SuppliedCertifiedPipeline` substitutes the
proved rate and volume identities into `SuppliedCertifiedAssembly.exponent_lt_of`,
which applies the actual extractions of `SuppliedNormalizedExtraction` and the
checked strict budget of `CertifiedPipelineScalar` to obtain
`MatrixComplexity.exponent K < 23710449/10000000` for every commutative ring
`K : Type`.
