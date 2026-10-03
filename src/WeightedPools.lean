module

public import ActivePools
public import CoordinateRestriction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Positive population labels can be selected before choosing the asymptotic
scale. Zero-weight pools contribute exactly the scalar one on every axis. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K]
variable {X Y Z BX BY BZ : T → Type*}

/-- Retain precisely the labels with positive fixed integer population coefficients. -/
abbrev PositiveWeight (weight : T → ℕ) := {type // 0 < weight type}

/-- A physical position proves positivity of its fixed weight, so no coordinate is lost by dropping zero pools. -/
def includePositive (weight : T → ℕ) (size : ℕ)
    (entries : ∀ type : PositiveWeight weight, Fin (weight type.val*size) → X type.val) :
    ∀ type, Fin (weight type*size) → X type := fun type position =>
  entries ⟨type, Nat.pos_of_mul_pos_right (Nat.lt_of_le_of_lt (Nat.zero_le position.val) position.isLt)⟩ position

/-- Dropping zero coefficient labels preserves the full product coefficient, including all empirical window tests. -/
theorem positive_weight_identity (weight : T → ℕ) (size : ℕ)
    (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ)
    (x : ∀ type : PositiveWeight weight, Fin (weight type.val*size) → X type.val)
    (y : ∀ type : PositiveWeight weight, Fin (weight type.val*size) → Y type.val)
    (z : ∀ type : PositiveWeight weight, Fin (weight type.val*size) → Z type.val) :
    heterogeneous (fun type => windowedPower (P := Fin (weight type*size)) (family type) (partX type) (partY type) (partZ type)
      (lawX type) (lawY type) (lawZ type) (tolerance type)) (includePositive weight size x) (includePositive weight size y)
        (includePositive weight size z) =
    heterogeneous (fun type : PositiveWeight weight => windowedPower (P := Fin (weight type.val*size)) (family type.val)
      (partX type.val) (partY type.val) (partZ type.val) (lawX type.val) (lawY type.val) (lawZ type.val) (tolerance type.val)) x y z := by
  let coefficient := fun type => windowedPower (P := Fin (weight type*size)) (family type) (partX type) (partY type) (partZ type)
    (lawX type) (lawY type) (lawZ type) (tolerance type)
      (includePositive weight size x type) (includePositive weight size y type) (includePositive weight size z type)
  have partition := Fintype.prod_subtype_mul_prod_subtype (fun type => 0 < weight type) coefficient
  have zeroProduct : (∏ type : {type // ¬0 < weight type}, coefficient type.val) = 1 := by
    apply Finset.prod_eq_one
    intro type _
    have zero : weight type.val = 0 := Nat.eq_zero_of_not_pos type.property
    exact windowedPower_empty _ _ _ _ _ _ _ _ (by simp only [Fintype.card_fin, zero, zero_mul]) _ _ _
  rw [zeroProduct, mul_one] at partition
  change (∏ type, coefficient type) = _
  rw [← partition]
  rfl

/-- Select positive fixed-weight pools through actual coordinate maps, with labels independent of the growing scale. -/
def dropZeroWeightRestriction (weight : T → ℕ) (size : ℕ)
    (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun type => windowedPower (P := Fin (weight type*size)) (family type) (partX type) (partY type) (partZ type)
        (lawX type) (lawY type) (lawZ type) (tolerance type)))
      (heterogeneous (fun type : PositiveWeight weight => windowedPower (P := Fin (weight type.val*size)) (family type.val)
        (partX type.val) (partY type.val) (partZ type.val) (lawX type.val) (lawY type.val) (lawZ type.val) (tolerance type.val))) where
  left := includePositive weight size
  middle := includePositive weight size
  right := includePositive weight size
  coefficient := positive_weight_identity weight size family partX partY partZ lawX lawY lawZ tolerance

omit [CommSemiring K] in
/-- Removing zero-weight types preserves every weighted real rate sum exactly. -/
theorem sum_positive_weights (weight : T → ℕ) (rate : T → ℝ) :
    (∑ type : PositiveWeight weight, (weight type.val : ℝ)*rate type.val) = ∑ type, (weight type : ℝ)*rate type := by
  have partition := Fintype.sum_subtype_add_sum_subtype (fun type => 0 < weight type)
    (fun type => (weight type : ℝ)*rate type)
  have zeroSum : (∑ type : {type // ¬0 < weight type}, (weight type.val : ℝ)*rate type.val) = 0 := by
    apply Finset.sum_eq_zero
    intro type _
    simp only [Nat.eq_zero_of_not_pos type.property, Nat.cast_zero, zero_mul]
  simpa only [zeroSum, add_zero] using partition

end
end MatrixBounds.Interface
