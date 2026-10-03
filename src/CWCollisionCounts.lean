module

public import CWCoarseGraph

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Integer collision bounds for actual admissible CW coarse words. Different
words sharing one vertex satisfy the nonconstant hash equation automatically. -/
namespace MatrixBounds.Tensor.CW

open Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P Competitor : Type*} [Fintype P] [Fintype Competitor]
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Condition on the actual reference coarse word hashing to a specified bucket. -/
abbrev WordBucket {parent : Shape} {total : ℕ} (reference : P → SplitAlphabet parent total)
    (bucket : ZMod prime) :=
  BucketEvent (modularEdge prime (splitWordEdge reference)).x (modularEdge prime (splitWordEdge reference)).y bucket

/-- A competitor survives in the same bucket as the reference. -/
def wordCollision {parent : Shape} {total : ℕ} (reference other : P → SplitAlphabet parent total)
    (bucket : ZMod prime) (seed : WordBucket reference bucket) : Prop :=
  (modularEdge prime (splitWordEdge other)).InBucket (fun _ => (total : ZMod prime)) seed.val bucket

/-- A family of distinct X-sharing admissible words has conditional collision count at most its size/M. -/
theorem shared_x_word_count {parent : Shape} {total : ℕ}
    (reference : P → SplitAlphabet parent total) (others : Competitor → P → SplitAlphabet parent total)
    (shared : ∀ other, (splitWordEdge (others other)).x = (splitWordEdge reference).x)
    (different : ∀ other, others other ≠ reference) (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference bucket // ∃ other, wordCollision reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (WordBucket reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (splitWordEdge reference)).x (modularEdge prime (splitWordEdge reference)).y bucket
    (fun other seed => wordCollision reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_x_collision (splitWordEdge reference) (splitWordEdge (others other))
        (fun _ => total) (splitWordEdge_valid (others other)) (shared other)
        (fun sameY => different other (splitWord_xy_injective (shared other) sameY))
        (fun p => (splitWord_small reference large p).2.1)
        (fun p => (splitWord_small (others other) large p).2.1) bucket
      simpa only [ZMod.card, wordCollision] using probability.le)
  simpa only [ZMod.card] using bound

/-- A family of distinct Y-sharing admissible words has the same finite collision bound. -/
theorem shared_y_word_count {parent : Shape} {total : ℕ}
    (reference : P → SplitAlphabet parent total) (others : Competitor → P → SplitAlphabet parent total)
    (shared : ∀ other, (splitWordEdge (others other)).y = (splitWordEdge reference).y)
    (different : ∀ other, others other ≠ reference) (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference bucket // ∃ other, wordCollision reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (WordBucket reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (splitWordEdge reference)).x (modularEdge prime (splitWordEdge reference)).y bucket
    (fun other seed => wordCollision reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_y_collision (splitWordEdge reference) (splitWordEdge (others other))
        (fun _ => total) (splitWordEdge_valid (others other)) (shared other)
        (fun sameX => different other (splitWord_xy_injective sameX (shared other)))
        (fun p => (splitWord_small reference large p).1)
        (fun p => (splitWord_small (others other) large p).1) bucket
      simpa only [ZMod.card, wordCollision] using probability.le)
  simpa only [ZMod.card] using bound

/-- Z-sharing admissible words obey the same integer collision bound, with no independent-stage assumption. -/
theorem shared_z_word_count {parent : Shape} {total : ℕ}
    (reference : P → SplitAlphabet parent total) (others : Competitor → P → SplitAlphabet parent total)
    (shared : ∀ other, (splitWordEdge (others other)).z = (splitWordEdge reference).z)
    (different : ∀ other, others other ≠ reference) (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference bucket // ∃ other, wordCollision reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (WordBucket reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (splitWordEdge reference)).x (modularEdge prime (splitWordEdge reference)).y bucket
    (fun other seed => wordCollision reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_z_collision (splitWordEdge reference) (splitWordEdge (others other))
        (fun _ => total) (splitWordEdge_valid reference) (splitWordEdge_valid (others other)) (shared other)
        (fun sameX => different other (splitWord_xz_injective sameX (shared other)))
        (fun p => (splitWord_small reference large p).1)
        (fun p => (splitWord_small (others other) large p).1) bucket
      simpa only [ZMod.card, wordCollision] using probability.le)
  simpa only [ZMod.card] using bound

end
end MatrixBounds.Tensor.CW
