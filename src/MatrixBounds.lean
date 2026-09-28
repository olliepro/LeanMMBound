import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Prod
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.LinearCombination

/-!
# Checked components of the proposed mixed-level argument

This file does NOT prove a bound on the matrix multiplication exponent.
It checks algebraic and finite combinatorial components of the referenced draft.
The final implication takes an explicit numerical upper-bound hypothesis.
No connection to tensor rank or to the actual matrix multiplication exponent is
postulated as an axiom or hidden in a definition.
-/

namespace MatrixBounds

noncomputable section

open scoped BigOperators

section Hash

variable {F : Type*} [Field F] [NeZero (2 : F)]
variable {P : Type*} [Fintype P]

/-- X hash from the offset, weights, and coarse coordinate word. -/
def hashX (offset : F) (weight word : P → F) : F :=
  offset + ∑ p, weight p * word p

/-- Y hash from two offsets, weights, and its coarse coordinate word. -/
def hashY (offset shift : F) (weight word : P → F) : F :=
  offset + shift + ∑ p, weight p * word p

/-- Z hash allows a different coordinate-sum constant at each position. -/
def hashZ (offset shift : F) (weight total word : P → F) : F :=
  offset + (shift + ∑ p, weight p * (total p - word p)) / 2

omit [NeZero (2 : F)] in
/-- For fixed weights and bucket there is exactly one pair of offsets.
Over a finite field this is the algebraic basis of the bucket probability `1 / M²`. -/
theorem unique_bucket_offsets (weight x y : P → F) (bucket : F) :
    ∃! offsets : F × F,
      hashX offsets.1 weight x = bucket ∧ hashY offsets.1 offsets.2 weight y = bucket := by
  refine ⟨(bucket - ∑ p, weight p * x p,
    (∑ p, weight p * x p) - ∑ p, weight p * y p), ?_, ?_⟩
  · constructor <;> dsimp [hashX, hashY] <;> ring
  · rintro ⟨offset, shift⟩ ⟨hx, hy⟩
    dsimp [hashX, hashY] at hx hy
    apply Prod.ext
    · dsimp
      linear_combination hx
    · dsimp
      linear_combination hy - hx

omit [NeZero (2 : F)] in
/-- Exactly one offset pair out of the `|F|²` pairs puts fixed words in a fixed bucket. -/
theorem bucket_offset_count [Fintype F] (weight x y : P → F) (bucket : F) :
    letI := Classical.decEq F
    (Finset.univ.filter (fun offsets : F × F =>
      hashX offsets.1 weight x = bucket ∧
        hashY offsets.1 offsets.2 weight y = bucket)).card = 1 := by
  classical
  obtain ⟨offsets, hoffsets, hunique⟩ := unique_bucket_offsets weight x y bucket
  rw [Finset.card_eq_one]
  refine ⟨offsets, ?_⟩
  ext candidate
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_singleton]
  constructor
  · exact hunique candidate
  · rintro rfl
    exact hoffsets

/-- Coordinatewise admissibility implies the shared arithmetic progression.
For example, this applies over any odd prime field to mixed recursion levels. -/
theorem shared_hash_identity (offset shift : F) (weight total x y z : P → F)
    (admissible : ∀ p, x p + y p + z p = total p) :
    hashX offset weight x + hashY offset shift weight y =
      2 * hashZ offset shift weight total z := by
  have hs : (∑ p, weight p * (total p - z p)) =
      (∑ p, weight p * x p) + ∑ p, weight p * y p := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro p _
    rw [← admissible p]
    ring
  unfold hashX hashY hashZ
  rw [hs]
  field_simp
  ring

/-- A set is progression-free if all three-term progressions in it are constant. -/
def ProgressionFree (bucket : Set F) : Prop :=
  ∀ a ∈ bucket, ∀ b ∈ bucket, ∀ c ∈ bucket,
    a + b = 2 * c → a = c ∧ b = c

/-- Keeping hashes in a progression-free set puts every surviving edge in one bucket. -/
theorem surviving_hashes_equal (bucket : Set F) (hfree : ProgressionFree bucket)
    (offset shift : F) (weight total x y z : P → F)
    (admissible : ∀ p, x p + y p + z p = total p)
    (hx : hashX offset weight x ∈ bucket)
    (hy : hashY offset shift weight y ∈ bucket)
    (hz : hashZ offset shift weight total z ∈ bucket) :
    hashX offset weight x = hashZ offset shift weight total z ∧
      hashY offset shift weight y = hashZ offset shift weight total z := by
  exact hfree _ hx _ hy _ hz (shared_hash_identity offset shift weight total x y z admissible)

end Hash

section Counting

variable {Edge Block : Type*} [Fintype Edge] [Fintype Block]

omit [Fintype Block] in
/-- An invariant incidence relation on a transitive block set has constant degree.
The caller supplies an edge permutation carrying each selected block to any other.
This is the symmetry obligation needed before replacing averages by pointwise counts. -/
theorem compatible_degree_constant (compatible : Edge → Block → Prop)
    [∀ e b, Decidable (compatible e b)]
    (transport : ∀ b c : Block, ∃ perm : Equiv.Perm Edge,
      ∀ e, compatible e b ↔ compatible (perm e) c)
    (b c : Block) :
    (∑ e, if compatible e b then (1 : ℕ) else 0) =
      ∑ e, if compatible e c then (1 : ℕ) else 0 := by
  obtain ⟨perm, hp⟩ := transport b c
  calc
    _ = ∑ e, if compatible (perm e) c then (1 : ℕ) else 0 := by
      apply Finset.sum_congr rfl
      intro e _
      simp only [hp e]
    _ = _ := Equiv.sum_comp perm (fun e => if compatible e c then (1 : ℕ) else 0)

/-- Double counting produces a pointwise compatibility bound ONLY after uniformity.
Here `edgeCount` and `blockCount` are actual finite cardinalities, not entropy estimates. -/
theorem compatibility_double_count (compatible : Edge → Block → Prop)
    [∀ e b, Decidable (compatible e b)] (degree bound : ℕ)
    (uniform : ∀ b, (∑ e, if compatible e b then 1 else 0) = degree)
    (perEdge : ∀ e, (∑ b, if compatible e b then 1 else 0) ≤ bound) :
    Fintype.card Block * degree ≤ Fintype.card Edge * bound := by
  calc
    _ = ∑ b : Block, ∑ e : Edge, if compatible e b then 1 else 0 := by
      simp [uniform]
    _ = ∑ e : Edge, ∑ b : Block, if compatible e b then 1 else 0 :=
      Finset.sum_comm
    _ ≤ ∑ _e : Edge, bound := Finset.sum_le_sum (fun e _ => perEdge e)
    _ = _ := by simp

end Counting

section Reconstruction

variable {X Y Z : Type*}

/-- A coefficient tensor restricted to one box of a binary axis partition.
The three predicates describe missing parts; `true` selects missing and `false` present. -/
def tensorBox (tensor : X → Y → Z → ℝ)
    (missingX : X → Bool) (missingY : Y → Bool) (missingZ : Z → Bool)
    (bx by_ bz : Bool) (x : X) (y : Y) (z : Z) : ℝ :=
  if missingX x = bx ∧ missingY y = by_ ∧ missingZ z = bz then tensor x y z else 0

/-- The eight boxes partition coefficients exactly, even when axes share variables.
This verifies ordinary tensor summation, not direct-sum independence of the boxes. -/
theorem eight_boxes_reconstruct (tensor : X → Y → Z → ℝ)
    (missingX : X → Bool) (missingY : Y → Bool) (missingZ : Z → Bool)
    (x : X) (y : Y) (z : Z) :
    (∑ bx : Bool, ∑ by_ : Bool, ∑ bz : Bool,
      tensorBox tensor missingX missingY missingZ bx by_ bz x y z) = tensor x y z := by
  cases hx : missingX x <;> cases hy : missingY y <;> cases hz : missingZ z <;>
    simp [tensorBox, hx, hy, hz]

end Reconstruction

section Pipeline

/-- Three axis retention rates. Coordinates remain in one fixed physical ordering. -/
abbrev Rates := Fin 3 → ℝ

/-- Bottleneck rate of a three-axis retention vector. -/
def bottleneck (rates : Rates) : ℝ := min (rates 0) (min (rates 1) (rates 2))

/-- The bottleneck is bounded by each of its three axis rates. -/
theorem bottleneck_le (rates : Rates) (axis : Fin 3) : bottleneck rates ≤ rates axis := by
  rcases axis with ⟨axis, haxis⟩
  interval_cases axis
  · exact min_le_left _ _
  · exact le_trans (min_le_right _ _) (min_le_left _ _)
  · exact le_trans (min_le_right _ _) (min_le_right _ _)

/-- Any lower bound on all coordinates is a lower bound on the bottleneck. -/
theorem le_bottleneck (value : ℝ) (rates : Rates)
    (lower : ∀ axis, value ≤ rates axis) : value ≤ bottleneck rates := by
  exact le_min (lower 0) (le_min (lower 1) (lower 2))

/-- Joint extraction could outperform separate extraction; this is only an inequality. -/
theorem bottleneck_superadditive (left right : Rates) :
    bottleneck left + bottleneck right ≤ bottleneck (left + right) := by
  apply le_bottleneck
  intro axis
  exact add_le_add (bottleneck_le left axis) (bottleneck_le right axis)

/-- Finite startup/drain loss for the three-stage staggered schedule. -/
def boundaryLoss (level4 level3 level2 : Rates) : ℝ :=
  2 * bottleneck (level4 + level3 + level2) - bottleneck level4 -
    bottleneck (level4 + level3) - bottleneck (level3 + level2) - bottleneck level2

/-- The boundary correction is nonnegative, including for signed input rates. -/
theorem boundaryLoss_nonnegative (level4 level3 level2 : Rates) :
    0 ≤ boundaryLoss level4 level3 level2 := by
  have hleft := bottleneck_superadditive level4 (level3 + level2)
  have hright := bottleneck_superadditive (level4 + level3) level2
  rw [← add_assoc] at hleft
  unfold boundaryLoss
  linarith

/-- Total scheduled retention with `batches ≥ 2`; multiplication counts interior rounds. -/
def scheduledRetention (batches : ℕ) (level4 level3 level2 : Rates) : ℝ :=
  bottleneck level4 + bottleneck (level4 + level3) +
    ((batches : ℝ) - 2) * bottleneck (level4 + level3 + level2) +
    bottleneck (level3 + level2) + bottleneck level2

/-- Algebraic accounting includes the startup and drain rounds exactly. -/
theorem schedule_identity (batches : ℕ) (level4 level3 level2 : Rates) :
    scheduledRetention batches level4 level3 level2 =
      batches * bottleneck (level4 + level3 + level2) -
        boundaryLoss level4 level3 level2 := by
  unfold scheduledRetention boundaryLoss
  ring

/-- Three nonnegative retention vectors can have a strict joint bottleneck advantage. -/
theorem strict_joint_advantage :
    let first : Rates := fun i => if i.val = 0 then 0 else 1
    let second : Rates := fun i => if i.val = 1 then 0 else 1
    bottleneck first + bottleneck second < bottleneck (first + second) := by
  norm_num [bottleneck, Pi.add_apply]
  split_ifs <;> norm_num

end Pipeline

section NumericalConclusion

/-- Inputs for the final scalar inequality; these fields do not certify tensor feasibility. -/
structure BoundInputs where
  rankBudget : ℝ
  rootRetention : ℝ
  jointRetention : ℝ
  boundary : ℝ
  batches : ℝ
  meanSide : ℝ
  batches_positive : 0 < batches
  meanSide_positive : 0 < meanSide

/-- The proposed scalar bound from a fixed finite pipeline. -/
def BoundInputs.bound (inputs : BoundInputs) : ℝ :=
  (inputs.rankBudget - inputs.rootRetention - inputs.jointRetention +
    inputs.boundary / inputs.batches) / inputs.meanSide

/-- Residual whose strict positivity certifies that the scalar bound beats a threshold. -/
def BoundInputs.residual (inputs : BoundInputs) (threshold : ℝ) : ℝ :=
  inputs.rootRetention + inputs.jointRetention - inputs.boundary / inputs.batches +
    threshold * inputs.meanSide - inputs.rankBudget

/-- A positive residual is exactly equivalent to the proposed bound being smaller. -/
theorem residual_positive_iff (inputs : BoundInputs) (threshold : ℝ) :
    0 < inputs.residual threshold ↔ inputs.bound < threshold := by
  unfold BoundInputs.residual BoundInputs.bound
  rw [div_lt_iff₀ inputs.meanSide_positive]
  constructor <;> intro h <;> linarith

/-- Conditional conclusion: supplying a valid upper bound and a positive residual suffices.
The `upperBound` argument is indispensable; no theorem here supplies it for matrix multiplication. -/
theorem exponent_lt_of_verified_bound (inputs : BoundInputs) (exponent threshold : ℝ)
    (upperBound : exponent ≤ inputs.bound)
    (positiveResidual : 0 < inputs.residual threshold) : exponent < threshold := by
  exact lt_of_le_of_lt upperBound ((residual_positive_iff inputs threshold).mp positiveResidual)

/-- The quoted decimal upper endpoint is strictly below the desired rational threshold.
This checks only those two rational numbers, not the unavailable interval certificate. -/
theorem quoted_endpoint_below_threshold :
    (237104473336090 : ℝ) / 100000000000000 < 23710449 / 10000000 := by
  norm_num

/-- The quoted residual lower endpoint is positive, as an exact rational number. -/
theorem quoted_residual_lower_positive :
    (2798 : ℝ) / 10000000000 > 0 := by
  norm_num

end NumericalConclusion

#print axioms shared_hash_identity
#print axioms unique_bucket_offsets
#print axioms bucket_offset_count
#print axioms surviving_hashes_equal
#print axioms compatible_degree_constant
#print axioms compatibility_double_count
#print axioms eight_boxes_reconstruct
#print axioms schedule_identity
#print axioms boundaryLoss_nonnegative
#print axioms bottleneck_le
#print axioms le_bottleneck
#print axioms bottleneck_superadditive
#print axioms strict_joint_advantage
#print axioms residual_positive_iff
#print axioms exponent_lt_of_verified_bound
#print axioms quoted_endpoint_below_threshold
#print axioms quoted_residual_lower_positive

end

end MatrixBounds
