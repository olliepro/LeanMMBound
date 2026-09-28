import TensorCore
import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic.SplitIfs

/-! A finite repair theorem using membership signatures.

If L broken copies cover the support of a tensor, partition each axis by its L
membership bits. Every resulting nonzero box is supplied by one of those copies.
There are at most 2^(3L) boxes. We construct actual restrictions, so reconstructing
the tensor does not rely on deleting individual monomials.

Producing a cover of size O(N / log N) from the missing-block fractions is a
separate probabilistic step, not assumed proved here. -/

namespace MatrixBounds.Tensor.Repair

open scoped BigOperators
noncomputable section

variable {K X Y Z I : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z] [Fintype I]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z] [DecidableEq I] [Nonempty I]

/-- The three axis-membership signatures describing a single box. -/
abbrev Pattern (I : Type*) := (I → Bool) × (I → Bool) × (I → Bool)

/-- Restrict an axis to the variables with exactly the prescribed membership signature. -/
def signatureMask (keep : I → X → Bool) (pattern : I → Bool) : X → Bool :=
  fun x => decide ((fun i => keep i x) = pattern)

/-- A copy of the target with its missing variable parts zeroed out. -/
def broken (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool) (i : I) :
    Coeff K X Y Z := restrict (mask (kx i)) (mask (ky i)) (mask (kz i)) tensor

/-- One signature box, expressed directly by its coefficients. -/
def piece (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool)
    (pattern : Pattern I) : Coeff K X Y Z := fun x y z =>
  if (fun i => kx i x) = pattern.1 ∧ (fun i => ky i y) = pattern.2.1 ∧
      (fun i => kz i z) = pattern.2.2 then tensor x y z else 0

omit [Fintype X] [Fintype Y] [Fintype Z] [DecidableEq X] [DecidableEq Y]
  [DecidableEq Z] [Nonempty I] in
/-- Every coefficient belongs to exactly one signature box. -/
theorem sum_pieces (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool) :
    (fun x y z => ∑ pattern : Pattern I, piece tensor kx ky kz pattern x y z) = tensor := by
  classical
  funext x y z
  simp [piece, Fintype.sum_prod_type, ite_and]

/-- Choose one source supplying a given signature; unused signatures may select any source. -/
def sourceIndex (pattern : Pattern I) : I :=
  if h : ∃ i, pattern.1 i = true ∧ pattern.2.1 i = true ∧ pattern.2.2 i = true
  then Classical.choose h else Classical.choice (inferInstance : Nonempty I)

omit [DecidableEq I] in
/-- A signature known to have a supplying source is assigned such a source. -/
theorem sourceIndex_spec (pattern : Pattern I)
    (h : ∃ i, pattern.1 i = true ∧ pattern.2.1 i = true ∧ pattern.2.2 i = true) :
    pattern.1 (sourceIndex pattern) = true ∧ pattern.2.1 (sourceIndex pattern) = true ∧
      pattern.2.2 (sourceIndex pattern) = true := by
  dsimp [sourceIndex]
  rw [dif_pos h]
  exact Classical.choose_spec h

omit [DecidableEq I] in
/-- Each signature box is a valid restriction of its assigned broken copy.
Coverage is required only on nonzero coefficients, not on the full coordinate cube. -/
theorem piece_from_source (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool)
    (cover : ∀ x y z, tensor x y z ≠ 0 →
      ∃ i, kx i x = true ∧ ky i y = true ∧ kz i z = true)
    (pattern : Pattern I) :
    restrict (mask (signatureMask kx pattern.1))
      (mask (signatureMask ky pattern.2.1)) (mask (signatureMask kz pattern.2.2))
      (broken tensor kx ky kz (sourceIndex pattern)) = piece tensor kx ky kz pattern := by
  classical
  funext x y z
  rw [restrict_mask]
  simp only [signatureMask, decide_eq_true_eq, piece]
  by_cases hs : (fun i => kx i x) = pattern.1 ∧ (fun i => ky i y) = pattern.2.1 ∧
      (fun i => kz i z) = pattern.2.2
  · rw [if_pos hs, if_pos hs]
    unfold broken
    rw [restrict_mask]
    by_cases ht : tensor x y z = 0
    · simp [ht]
    · obtain ⟨hx, hy, hz⟩ := hs
      have available : ∃ i, pattern.1 i = true ∧ pattern.2.1 i = true ∧
          pattern.2.2 i = true := by
        simpa only [← hx, ← hy, ← hz] using cover x y z ht
      have good := sourceIndex_spec pattern available
      have selected : kx (sourceIndex pattern) x = true ∧
          ky (sourceIndex pattern) y = true ∧ kz (sourceIndex pattern) z = true := by
        simpa only [← hx, ← hy, ← hz] using good
      exact if_pos selected
  · rw [if_neg hs, if_neg hs]

omit [Nonempty I] in
/-- The number of possible boxes is exactly 2^(3L) for L available source masks. -/
theorem pattern_card : Fintype.card (Pattern I) = 2 ^ (3 * Fintype.card I) := by
  simp only [Pattern, Fintype.card_prod, Fintype.card_fun, Fintype.card_bool]
  rw [← pow_add, ← pow_add]
  congr 1
  omega

/-- Full finite reconstruction as a tensor restriction, with no rank hypothesis.
The sources are independently labelled copies of the available broken tensors,
one for each membership pattern. This output can be fed to another restriction. -/
theorem finite_repair_restriction (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool)
    (cover : ∀ x y z, tensor x y z ≠ 0 →
      ∃ i, kx i x = true ∧ ky i y = true ∧ kz i z = true) :
    ∃ (mx : X → Pattern I × X → K) (my : Y → Pattern I × Y → K)
      (mz : Z → Pattern I × Z → K),
      restrict mx my mz (directSum (fun pattern : Pattern I =>
        broken tensor kx ky kz (sourceIndex pattern))) = tensor := by
  classical
  refine ⟨(fun x source => mask (signatureMask kx source.1.1) x source.2),
    (fun y source => mask (signatureMask ky source.1.2.1) y source.2),
    (fun z source => mask (signatureMask kz source.1.2.2) z source.2), ?_⟩
  rw [restrict_directSum (fun pattern : Pattern I => broken tensor kx ky kz (sourceIndex pattern))
    (fun pattern => mask (signatureMask kx pattern.1))
    (fun pattern => mask (signatureMask ky pattern.2.1))
    (fun pattern => mask (signatureMask kz pattern.2.2))]
  calc
    _ = fun x y z => ∑ pattern : Pattern I, piece tensor kx ky kz pattern x y z := by
      funext x y z
      apply Finset.sum_congr rfl
      intro pattern _
      exact congrFun (congrFun (congrFun (piece_from_source tensor kx ky kz cover pattern) x) y) z
    _ = tensor := sum_pieces tensor kx ky kz

/-- Finite hole repair with an explicit rank budget and explicit axis restrictions.
If L available broken copies cover every nonzero coefficient and each has rank at
most r, the complete tensor has rank at most 2^(3L) * r. For L = o(N), the repair
factor is subexponential; proving the required L for the proposed interfaces is
an additional obligation. -/
theorem finite_repair (tensor : Coeff K X Y Z)
    (kx : I → X → Bool) (ky : I → Y → Bool) (kz : I → Z → Bool)
    (cover : ∀ x y z, tensor x y z ≠ 0 →
      ∃ i, kx i x = true ∧ ky i y = true ∧ kz i z = true)
    (rank : ℕ) (budget : ∀ i, RankLE (broken tensor kx ky kz i) rank) :
    RankLE tensor (2 ^ (3 * Fintype.card I) * rank) := by
  classical
  have each : ∀ pattern : Pattern I, RankLE (piece tensor kx ky kz pattern) rank := by
    intro pattern
    have h := rankLE_restrict (budget (sourceIndex pattern))
      (mask (signatureMask kx pattern.1)) (mask (signatureMask ky pattern.2.1))
      (mask (signatureMask kz pattern.2.2))
    rw [piece_from_source tensor kx ky kz cover pattern] at h
    exact h
  have result := rankLE_sum (piece tensor kx ky kz) rank each
  rw [sum_pieces, pattern_card] at result
  exact result

#print axioms finite_repair
#print axioms finite_repair_restriction
#print axioms piece_from_source
#print axioms pattern_card

end
end MatrixBounds.Tensor.Repair
