import HashCounting
import Mathlib.SetTheory.Cardinal.Finite

/-! Conditioning on a fixed bucket preserves uniformity of the weight vector.
This is established by an equivalence of the finite sample spaces, not assumed
from pairwise independence of hashes. -/

namespace MatrixBounds.HashCounting

noncomputable section
variable {F P : Type*} [Field F] [Fintype F] [Fintype P] [DecidableEq P]

/-- A random seed consists of a weight vector and two independently selected offsets. -/
abbrev Seed (F P : Type*) := (P → F) × (F × F)

/-- Seeds placing the reference pair of coarse words in the specified hash bucket. -/
def BucketEvent (x y : P → F) (bucket : F) :=
  {seed : Seed F P // hashX seed.2.1 seed.1 x = bucket ∧
    hashY seed.2.1 seed.2.2 seed.1 y = bucket}

/-- Every weight vector has exactly one seed in a given bucket event.
Consequently a uniform seed conditioned on this event has uniform weights. -/
def bucketEquiv (x y : P → F) (bucket : F) : BucketEvent x y bucket ≃ (P → F) where
  toFun seed := seed.val.1
  invFun weight := ⟨(weight, Classical.choose (unique_bucket_offsets weight x y bucket)),
    (Classical.choose_spec (unique_bucket_offsets weight x y bucket)).1⟩
  left_inv seed := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · exact ((Classical.choose_spec (unique_bucket_offsets seed.val.1 x y bucket)).2
        seed.val.2 seed.property).symm
  right_inv _ := rfl

/-- Adding a collision equation to the bucket event corresponds exactly to its weight fiber. -/
def bucketCollisionEquiv (x y coefficient : P → F) (bucket target : F) :
    {seed : BucketEvent x y bucket // dot coefficient seed.val.1 = target} ≃
      {weight // dot coefficient weight = target} where
  toFun seed := ⟨(bucketEquiv x y bucket) seed.val, seed.property⟩
  invFun weight := ⟨(bucketEquiv x y bucket).symm weight.val, weight.property⟩
  left_inv seed := by
    apply Subtype.ext
    exact (bucketEquiv x y bucket).symm_apply_apply seed.val
  right_inv weight := by
    apply Subtype.ext
    exact (bucketEquiv x y bucket).apply_symm_apply weight.val

/-- Exact conditional collision probability after a specified reference bucket survives. -/
theorem conditional_collision_probability (x y coefficient : P → F) (bucket target : F)
    (pivot : P) (nonzero : coefficient pivot ≠ 0) :
    (Nat.card {seed : BucketEvent x y bucket // dot coefficient seed.val.1 = target} : ℝ) /
      Nat.card (BucketEvent x y bucket) = 1 / (Fintype.card F : ℝ) := by
  classical
  rw [Nat.card_congr (bucketCollisionEquiv x y coefficient bucket target),
    Nat.card_congr (bucketEquiv x y bucket)]
  simpa only [Nat.card_eq_fintype_card] using fiber_probability coefficient pivot nonzero target

#print axioms bucketEquiv
#print axioms conditional_collision_probability

end
end MatrixBounds.HashCounting
