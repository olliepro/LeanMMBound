import HashConditional

/-! Shared-vertex collisions for actual admissible coarse triples. The three
axis cases reduce to nonconstant linear equations after fixing one reference bucket. -/
namespace MatrixBounds.HashCounting

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {F P : Type*} [Field F] [NeZero (2 : F)] [Fintype P]

/-- The three coordinate words of one coarse tensor edge. -/
structure CoarseEdge (F P : Type*) where
  x : P → F
  y : P → F
  z : P → F

/-- A coarse edge has the prescribed possibly heterogeneous coordinate sum. -/
def CoarseEdge.Valid (edge : CoarseEdge F P) (total : P → F) : Prop :=
  ∀ p, edge.x p + edge.y p + edge.z p = total p

/-- All three hashes of a coarse edge equal the requested bucket. -/
def CoarseEdge.InBucket (edge : CoarseEdge F P) (total : P → F) (seed : Seed F P) (bucket : F) : Prop :=
  hashX seed.2.1 seed.1 edge.x = bucket ∧ hashY seed.2.1 seed.2.2 seed.1 edge.y = bucket ∧
    hashZ seed.2.1 seed.2.2 seed.1 total edge.z = bucket

/-- The first two hash equalities force the third for every admissible coarse edge. -/
theorem bucket_z_of_xy (edge : CoarseEdge F P) (total : P → F) (valid : edge.Valid total)
    (seed : Seed F P) (bucket : F) (hx : hashX seed.2.1 seed.1 edge.x = bucket)
    (hy : hashY seed.2.1 seed.2.2 seed.1 edge.y = bucket) :
    hashZ seed.2.1 seed.2.2 seed.1 total edge.z = bucket := by
  have identity := shared_hash_identity seed.2.1 seed.2.2 seed.1 total edge.x edge.y edge.z valid
  rw [hx, hy] at identity
  apply mul_left_cancel₀ (show (2 : F) ≠ 0 from NeZero.ne _)
  linear_combination -identity

/-- Bucket membership may be checked using only X and Y for an admissible edge. -/
theorem inBucket_iff_xy (edge : CoarseEdge F P) (total : P → F) (valid : edge.Valid total)
    (seed : Seed F P) (bucket : F) :
    edge.InBucket total seed bucket ↔ hashX seed.2.1 seed.1 edge.x = bucket ∧
      hashY seed.2.1 seed.2.2 seed.1 edge.y = bucket := by
  exact ⟨fun h => ⟨h.1, h.2.1⟩, fun h => ⟨h.1, h.2, bucket_z_of_xy edge total valid seed bucket h.1 h.2⟩⟩

omit [NeZero (2 : F)] in
/-- X-hash collisions are exactly homogeneous linear equations in the weight vector. -/
theorem hashX_collision_iff (offset : F) (weight left right : P → F) :
    hashX offset weight left = hashX offset weight right ↔ dot (fun p => left p-right p) weight = 0 := by
  have identity : dot (fun p => left p-right p) weight =
      (∑ p, weight p*left p) - ∑ p, weight p*right p := by
    simp only [dot, sub_mul, Finset.sum_sub_distrib]
    simp only [mul_comm]
  rw [identity]
  simp only [hashX, add_right_inj, sub_eq_zero]

/-- A competitor sharing X survives exactly when its Y-difference linear form vanishes. -/
theorem shared_x_collision_iff (reference competitor : CoarseEdge F P) (total : P → F)
    (valid : competitor.Valid total) (shared : competitor.x = reference.x) (bucket : F)
    (seed : BucketEvent reference.x reference.y bucket) :
    competitor.InBucket total seed.val bucket ↔ dot (fun p => competitor.y p-reference.y p) seed.val.1 = 0 := by
  simp only [inBucket_iff_xy competitor total valid, shared, seed.property.1, true_and]
  have equation := hashY_collision_iff seed.val.2.1 seed.val.2.2 seed.val.1 competitor.y reference.y
  rwa [seed.property.2] at equation

/-- A competitor sharing Y survives exactly when its X-difference linear form vanishes. -/
theorem shared_y_collision_iff (reference competitor : CoarseEdge F P) (total : P → F)
    (valid : competitor.Valid total) (shared : competitor.y = reference.y) (bucket : F)
    (seed : BucketEvent reference.x reference.y bucket) :
    competitor.InBucket total seed.val bucket ↔ dot (fun p => competitor.x p-reference.x p) seed.val.1 = 0 := by
  simp only [inBucket_iff_xy competitor total valid, shared, seed.property.2, and_true]
  have equation := hashX_collision_iff seed.val.2.1 seed.val.1 competitor.x reference.x
  rwa [seed.property.1] at equation

/-- Sharing Z gives the same X-difference equation; the varying coordinate totals cancel exactly. -/
theorem shared_z_collision_iff (reference competitor : CoarseEdge F P) (total : P → F)
    (validReference : reference.Valid total) (validCompetitor : competitor.Valid total)
    (shared : competitor.z = reference.z) (bucket : F) (seed : BucketEvent reference.x reference.y bucket) :
    competitor.InBucket total seed.val bucket ↔ dot (fun p => competitor.x p-reference.x p) seed.val.1 = 0 := by
  rw [← hashX_collision_iff seed.val.2.1, seed.property.1]
  constructor
  · exact fun h => h.1
  · intro hx
    have hz : hashZ seed.val.2.1 seed.val.2.2 seed.val.1 total competitor.z = bucket := by
      rw [shared]
      exact bucket_z_of_xy reference total validReference seed.val bucket seed.property.1 seed.property.2
    have identity := shared_hash_identity seed.val.2.1 seed.val.2.2 seed.val.1 total
      competitor.x competitor.y competitor.z validCompetitor
    rw [hx, hz] at identity
    refine ⟨hx, ?_, hz⟩
    linear_combination identity

end
end MatrixBounds.HashCounting
