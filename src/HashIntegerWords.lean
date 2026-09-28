import HashCollisionRates
import ProgressionBuckets

/-! Natural coarse words embed into the prime field without aliasing. The
explicit coordinate bound is required before applying the 1/M collision law. -/
namespace MatrixBounds.HashCounting

noncomputable section
variable {P : Type*}

/-- Casting bounded coordinate words modulo M preserves distinctness. -/
theorem bounded_word_cast_injective {modulus : ℕ} {left right : P → ℕ}
    (left_small : ∀ p, left p < modulus) (right_small : ∀ p, right p < modulus)
    (equal : (fun p => (left p : ZMod modulus)) = fun p => (right p : ZMod modulus)) : left = right := by
  funext p
  exact HashBuckets.cast_injective_below (left_small p) (right_small p) (congrFun equal p)

/-- A differing bounded integer word supplies the nonconstant coordinate needed by the hash law. -/
theorem bounded_word_cast_ne {modulus : ℕ} {left right : P → ℕ}
    (left_small : ∀ p, left p < modulus) (right_small : ∀ p, right p < modulus)
    (different : left ≠ right) :
    (fun p => (left p : ZMod modulus)) ≠ fun p => (right p : ZMod modulus) :=
  fun equal => different (bounded_word_cast_injective left_small right_small equal)

/-- Cast all three natural coordinate words of an actual coarse edge into the residue field. -/
def modularEdge (modulus : ℕ) (edge : CoarseEdge ℕ P) : CoarseEdge (ZMod modulus) P :=
  ⟨fun p => (edge.x p : ZMod modulus), fun p => (edge.y p : ZMod modulus), fun p => (edge.z p : ZMod modulus)⟩

/-- Integer coordinate sums give exactly the heterogeneous admissibility equations in the field. -/
theorem modularEdge_valid {prime : ℕ} [Fact prime.Prime] (edge : CoarseEdge ℕ P) (total : P → ℕ)
    (valid : ∀ p, edge.x p + edge.y p + edge.z p = total p) :
    (modularEdge prime edge).Valid (fun p => (total p : ZMod prime)) := by
  intro p
  simpa only [modularEdge, Nat.cast_add] using congrArg (fun n : ℕ => (n : ZMod prime)) (valid p)

/-- Actual distinct natural Y words on an X-shared edge collide with exact conditional rate 1/M. -/
theorem natural_shared_x_collision {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    [Fintype P] [DecidableEq P] (reference competitor : CoarseEdge ℕ P) (total : P → ℕ)
    (valid : ∀ p, competitor.x p + competitor.y p + competitor.z p = total p)
    (shared : competitor.x = reference.x) (different : competitor.y ≠ reference.y)
    (reference_small : ∀ p, reference.y p < prime) (competitor_small : ∀ p, competitor.y p < prime)
    (bucket : ZMod prime) :
    (Nat.card {seed : BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket //
      (modularEdge prime competitor).InBucket (fun p => (total p : ZMod prime)) seed.val bucket} : ℝ) /
      Nat.card (BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket) = 1/(prime : ℝ) := by
  simpa only [ZMod.card] using shared_x_collision_probability (modularEdge prime reference)
    (modularEdge prime competitor) (fun p => (total p : ZMod prime)) (modularEdge_valid competitor total valid)
    (by simp only [modularEdge, shared])
    (bounded_word_cast_ne competitor_small reference_small different) bucket

/-- Actual distinct natural X words on a Y-shared edge obey the same conditional collision law. -/
theorem natural_shared_y_collision {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    [Fintype P] [DecidableEq P] (reference competitor : CoarseEdge ℕ P) (total : P → ℕ)
    (valid : ∀ p, competitor.x p + competitor.y p + competitor.z p = total p)
    (shared : competitor.y = reference.y) (different : competitor.x ≠ reference.x)
    (reference_small : ∀ p, reference.x p < prime) (competitor_small : ∀ p, competitor.x p < prime)
    (bucket : ZMod prime) :
    (Nat.card {seed : BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket //
      (modularEdge prime competitor).InBucket (fun p => (total p : ZMod prime)) seed.val bucket} : ℝ) /
      Nat.card (BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket) = 1/(prime : ℝ) := by
  simpa only [ZMod.card] using shared_y_collision_probability (modularEdge prime reference)
    (modularEdge prime competitor) (fun p => (total p : ZMod prime)) (modularEdge_valid competitor total valid)
    (by simp only [modularEdge, shared])
    (bounded_word_cast_ne competitor_small reference_small different) bucket

/-- A Z-shared natural edge collision has rate 1/M after the integer support sums are cast. -/
theorem natural_shared_z_collision {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    [Fintype P] [DecidableEq P] (reference competitor : CoarseEdge ℕ P) (total : P → ℕ)
    (validReference : ∀ p, reference.x p + reference.y p + reference.z p = total p)
    (validCompetitor : ∀ p, competitor.x p + competitor.y p + competitor.z p = total p)
    (shared : competitor.z = reference.z) (different : competitor.x ≠ reference.x)
    (reference_small : ∀ p, reference.x p < prime) (competitor_small : ∀ p, competitor.x p < prime)
    (bucket : ZMod prime) :
    (Nat.card {seed : BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket //
      (modularEdge prime competitor).InBucket (fun p => (total p : ZMod prime)) seed.val bucket} : ℝ) /
      Nat.card (BucketEvent (modularEdge prime reference).x (modularEdge prime reference).y bucket) = 1/(prime : ℝ) := by
  simpa only [ZMod.card] using shared_z_collision_probability (modularEdge prime reference)
    (modularEdge prime competitor) (fun p => (total p : ZMod prime))
    (modularEdge_valid reference total validReference) (modularEdge_valid competitor total validCompetitor)
    (by simp only [modularEdge, shared])
    (bounded_word_cast_ne competitor_small reference_small different) bucket

end
end MatrixBounds.HashCounting
