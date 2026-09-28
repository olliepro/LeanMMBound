import HashEdges
import FiniteSelection

/-! Exact conditioned survival and collision probabilities for coarse edges,
including all three choices of shared axis. -/
namespace MatrixBounds.HashCounting

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {F P : Type*} [Field F] [Fintype F] [Fintype P] [DecidableEq P]

/-- Conditioning on a bucket is a finite sample space of seeds. -/
instance bucketEventFintype (x y : P → F) (bucket : F) : Fintype (BucketEvent x y bucket) :=
  inferInstanceAs (Fintype {seed : Seed F P // hashX seed.2.1 seed.1 x = bucket ∧
    hashY seed.2.1 seed.2.2 seed.1 y = bucket})

/-- A fixed X/Y pair lands in a specified bucket with exact probability 1/|F|^2. -/
theorem fixed_bucket_probability (x y : P → F) (bucket : F) :
    (Nat.card (BucketEvent x y bucket) : ℝ) / Fintype.card (Seed F P) = 1/(Fintype.card F : ℝ)^2 := by
  rw [Nat.card_congr (bucketEquiv x y bucket)]
  simp only [Nat.card_eq_fintype_card, Seed, Fintype.card_prod, Nat.cast_mul]
  have weights : (0 : ℝ) < Fintype.card (P → F) := by exact_mod_cast Fintype.card_pos
  have field : (0 : ℝ) < Fintype.card F := by exact_mod_cast Fintype.card_pos
  field_simp [weights.ne', field.ne']

/-- A collision event characterized by a nonzero linear form has exact conditional rate 1/|F|. -/
theorem conditional_event_of_linear (x y coefficient : P → F) (bucket : F)
    (event : BucketEvent x y bucket → Prop)
    (equation : ∀ seed, event seed ↔ dot coefficient seed.val.1 = 0)
    (nonconstant : ∃ pivot, coefficient pivot ≠ 0) :
    (Nat.card {seed : BucketEvent x y bucket // event seed} : ℝ) / Nat.card (BucketEvent x y bucket) =
      1/(Fintype.card F : ℝ) := by
  obtain ⟨pivot, nonzero⟩ := nonconstant
  rw [Nat.card_congr (Equiv.subtypeEquivRight equation)]
  exact conditional_collision_probability x y coefficient bucket 0 pivot nonzero

variable [NeZero (2 : F)]

/-- Conditional collision rate for a distinct Y word on an edge sharing X. -/
theorem shared_x_collision_probability (reference competitor : CoarseEdge F P) (total : P → F)
    (valid : competitor.Valid total) (shared : competitor.x = reference.x)
    (different : competitor.y ≠ reference.y) (bucket : F) :
    (Nat.card {seed : BucketEvent reference.x reference.y bucket // competitor.InBucket total seed.val bucket} : ℝ) /
      Nat.card (BucketEvent reference.x reference.y bucket) = 1/(Fintype.card F : ℝ) := by
  exact conditional_event_of_linear reference.x reference.y (fun p => competitor.y p-reference.y p) bucket _
    (shared_x_collision_iff reference competitor total valid shared bucket)
    (different_words_have_pivot competitor.y reference.y different)

/-- Conditional collision rate for a distinct X word on an edge sharing Y. -/
theorem shared_y_collision_probability (reference competitor : CoarseEdge F P) (total : P → F)
    (valid : competitor.Valid total) (shared : competitor.y = reference.y)
    (different : competitor.x ≠ reference.x) (bucket : F) :
    (Nat.card {seed : BucketEvent reference.x reference.y bucket // competitor.InBucket total seed.val bucket} : ℝ) /
      Nat.card (BucketEvent reference.x reference.y bucket) = 1/(Fintype.card F : ℝ) := by
  exact conditional_event_of_linear reference.x reference.y (fun p => competitor.x p-reference.x p) bucket _
    (shared_y_collision_iff reference competitor total valid shared bucket)
    (different_words_have_pivot competitor.x reference.x different)

/-- Conditional collision rate for a distinct X word on an edge sharing Z. -/
theorem shared_z_collision_probability (reference competitor : CoarseEdge F P) (total : P → F)
    (validReference : reference.Valid total) (validCompetitor : competitor.Valid total)
    (shared : competitor.z = reference.z) (different : competitor.x ≠ reference.x) (bucket : F) :
    (Nat.card {seed : BucketEvent reference.x reference.y bucket // competitor.InBucket total seed.val bucket} : ℝ) /
      Nat.card (BucketEvent reference.x reference.y bucket) = 1/(Fintype.card F : ℝ) := by
  exact conditional_event_of_linear reference.x reference.y (fun p => competitor.x p-reference.x p) bucket _
    (shared_z_collision_iff reference competitor total validReference validCompetitor shared bucket)
    (different_words_have_pivot competitor.x reference.x different)

omit [NeZero (2 : F)] in
/-- Any finite competitor family has collision probability at most its size divided by the modulus. -/
theorem conditional_competitor_union {Competitor : Type*} [Fintype Competitor]
    (x y : P → F) (bucket : F) (collision : Competitor → BucketEvent x y bucket → Prop)
    (individual : ∀ other, (Nat.card {seed : BucketEvent x y bucket // collision other seed} : ℝ) /
      Nat.card (BucketEvent x y bucket) ≤ 1/(Fintype.card F : ℝ)) :
    (Nat.card {seed : BucketEvent x y bucket // ∃ other, collision other seed} : ℝ) /
      Nat.card (BucketEvent x y bucket) ≤ (Fintype.card Competitor : ℝ)/Fintype.card F := by
  classical
  have union := Selection.union_count collision
  have divided := div_le_div_of_nonneg_right (show
      (Nat.card {seed : BucketEvent x y bucket // ∃ other, collision other seed} : ℝ) ≤
        ∑ other, (Nat.card {seed : BucketEvent x y bucket // collision other seed} : ℝ) by exact_mod_cast union)
    (Nat.cast_nonneg (Nat.card (BucketEvent x y bucket)))
  rw [Finset.sum_div] at divided
  apply divided.trans
  have sum := Finset.sum_le_sum (s := Finset.univ) (fun other _ => individual other)
  simpa only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one_div] using sum

omit [NeZero (2 : F)] in
/-- The conditional union bound as an exact integer inequality, ready for finite seed selection. -/
theorem conditional_competitor_count {Competitor : Type*} [Fintype Competitor]
    (x y : P → F) (bucket : F) (collision : Competitor → BucketEvent x y bucket → Prop)
    (individual : ∀ other, (Nat.card {seed : BucketEvent x y bucket // collision other seed} : ℝ) /
      Nat.card (BucketEvent x y bucket) ≤ 1/(Fintype.card F : ℝ)) :
    Nat.card {seed : BucketEvent x y bucket // ∃ other, collision other seed} * Fintype.card F ≤
      Fintype.card Competitor * Nat.card (BucketEvent x y bucket) := by
  have count := conditional_competitor_union x y bucket collision individual
  have bucketPositive : (0 : ℝ) < Nat.card (BucketEvent x y bucket) := by
    rw [Nat.card_congr (bucketEquiv x y bucket), Nat.card_eq_fintype_card]
    exact_mod_cast (Fintype.card_pos (α := P → F))
  have fieldPositive : (0 : ℝ) < Fintype.card F := by exact_mod_cast (Fintype.card_pos (α := F))
  rw [div_le_div_iff₀ bucketPositive fieldPositive] at count
  exact_mod_cast count

end
end MatrixBounds.HashCounting
