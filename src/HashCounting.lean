import MatrixBounds
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Pi
import Mathlib.Logic.Equiv.Sum

/-! Exact finite counting for the collision step. No asymptotic or probabilistic
claim is assumed: all probabilities below are ratios of finite cardinalities. -/

namespace MatrixBounds.HashCounting

open scoped BigOperators
noncomputable section

variable {F P : Type*} [Field F] [Fintype P] [DecidableEq P]

/-- The linear form tested by a collision between two coarse words. -/
def dot (coefficient weight : P → F) : F := ∑ p, coefficient p * weight p

/-- Translate only one weight coordinate by the specified field element. -/
def translate (pivot : P) (amount : F) (weight : P → F) : P → F :=
  fun p => weight p + if p = pivot then amount else 0

/-- Changing one weight changes the linear form by its coefficient times the change. -/
theorem dot_translate (coefficient weight : P → F) (pivot : P) (amount : F) :
    dot coefficient (translate pivot amount weight) =
      dot coefficient weight + coefficient pivot * amount := by
  simp [dot, translate, mul_add, Finset.sum_add_distrib, mul_ite]

/-- A nonzero pivot coefficient gives an explicit bijection between any two fibers.
For example, shifting by `(target - source) / coefficient pivot` maps the source
collision equation to the target equation. -/
def fiberEquiv (coefficient : P → F) (pivot : P) (nonzero : coefficient pivot ≠ 0)
    (source target : F) :
    {weight // dot coefficient weight = source} ≃ {weight // dot coefficient weight = target} where
  toFun weight := ⟨translate pivot ((target - source) / coefficient pivot) weight, by
    rw [dot_translate, weight.property]
    field_simp
    ring⟩
  invFun weight := ⟨translate pivot ((source - target) / coefficient pivot) weight, by
    rw [dot_translate, weight.property]
    field_simp
    ring⟩
  left_inv weight := by
    apply Subtype.ext
    funext p
    dsimp [translate]
    split_ifs <;> ring
  right_inv weight := by
    apply Subtype.ext
    funext p
    dsimp [translate]
    split_ifs <;> ring

/-- All fibers of a nonconstant linear form over a finite field have equal size. -/
theorem fiber_card_equal [Fintype F] (coefficient : P → F) (pivot : P)
    (nonzero : coefficient pivot ≠ 0) (source target : F) :
    letI := Classical.decEq F
    Fintype.card {weight // dot coefficient weight = source} =
      Fintype.card {weight // dot coefficient weight = target} := by
  classical
  exact Fintype.card_congr (fiberEquiv coefficient pivot nonzero source target)

/-- The total number of weights is the field size times any one fiber size. -/
theorem fiber_count_identity [Fintype F] (coefficient : P → F) (pivot : P)
    (nonzero : coefficient pivot ≠ 0) (target : F) :
    letI := Classical.decEq F
    Fintype.card (P → F) =
      Fintype.card F * Fintype.card {weight // dot coefficient weight = target} := by
  classical
  calc
    _ = Fintype.card (Σ t : F, {weight // dot coefficient weight = t}) :=
      (Fintype.card_congr (Equiv.sigmaFiberEquiv (dot coefficient))).symm
    _ = ∑ t : F, Fintype.card {weight // dot coefficient weight = t} := Fintype.card_sigma
    _ = _ := by
      have uniform : ∀ t : F, Fintype.card {weight // dot coefficient weight = t} =
          Fintype.card {weight // dot coefficient weight = target} :=
        fun t => fiber_card_equal coefficient pivot nonzero t target
      simp [uniform]

/-- Exact collision probability for uniformly chosen weights is the reciprocal field size. -/
theorem fiber_probability [Fintype F] (coefficient : P → F) (pivot : P)
    (nonzero : coefficient pivot ≠ 0) (target : F) :
    letI := Classical.decEq F
    (Fintype.card {weight // dot coefficient weight = target} : ℝ) /
      Fintype.card (P → F) = 1 / (Fintype.card F : ℝ) := by
  classical
  have count := fiber_count_identity coefficient pivot nonzero target
  have hweights : (0 : ℝ) < Fintype.card (P → F) := by exact_mod_cast Fintype.card_pos
  have hfield : (0 : ℝ) < Fintype.card F := by exact_mod_cast Fintype.card_pos
  apply (div_eq_div_iff (ne_of_gt hweights) (ne_of_gt hfield)).mpr
  have hc : (Fintype.card (P → F) : ℝ) =
      (Fintype.card F : ℝ) * Fintype.card {weight // dot coefficient weight = target} := by
    exact_mod_cast count
  nlinarith

omit [Fintype P] [DecidableEq P] in
/-- Two different words have a nonzero coefficient in their collision equation. -/
theorem different_words_have_pivot (left right : P → F) (different : left ≠ right) :
    ∃ pivot, left pivot - right pivot ≠ 0 := by
  by_contra h
  push_neg at h
  apply different
  funext p
  exact sub_eq_zero.mp (h p)

omit [DecidableEq P] in
/-- Equality of Y hashes is exactly a homogeneous linear equation in the weights. -/
theorem hashY_collision_iff (offset shift : F) (weight left right : P → F) :
    hashY offset shift weight left = hashY offset shift weight right ↔
      dot (fun p => left p - right p) weight = 0 := by
  have hd : dot (fun p => left p - right p) weight =
      (∑ p, weight p * left p) - ∑ p, weight p * right p := by
    simp only [dot, sub_mul, Finset.sum_sub_distrib]
    simp only [mul_comm]
  rw [hd]
  simp only [hashY, add_right_inj, sub_eq_zero]

#print axioms fiberEquiv
#print axioms fiber_count_identity
#print axioms fiber_probability
#print axioms hashY_collision_iff

end
end MatrixBounds.HashCounting
