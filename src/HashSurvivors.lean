import HashCollisionRates
import CollisionHoles

/-! A finite surviving-copy bound that combines conditioned deletion estimates
across all hash buckets. Earlier deletion events may be arbitrarily correlated. -/
namespace MatrixBounds.Selection

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Averaging an integer-valued score gives a seed attaining its mean, without rounding. -/
theorem exists_score_at_least {Outcome : Type*} [Fintype Outcome] [Nonempty Outcome]
    (score : Outcome → ℕ) (multiplier target : ℕ)
    (total : target * Fintype.card Outcome ≤ multiplier * ∑ seed, score seed) :
    ∃ seed, target ≤ multiplier * score seed := by
  classical
  by_contra none
  push_neg at none
  have small := Finset.sum_lt_sum_of_nonempty (s := Finset.univ)
    Finset.univ_nonempty (fun seed _ => none seed)
  simp only [← Finset.mul_sum, Finset.sum_const, Finset.card_univ, smul_eq_mul] at small
  nlinarith

/-- A modulus larger than a slacked competitor count gives the desired event fraction.
Zero competitors are included and force the event to be empty. -/
theorem event_modulus_slack {Outcome : Type*} [Fintype Outcome]
    (event : Outcome → Prop) (modulus competitors slack : ℕ) (positive : 0 < modulus)
    (count : Nat.card {seed // event seed} * modulus ≤ competitors * Fintype.card Outcome)
    (large : slack * competitors ≤ modulus) :
    Nat.card {seed // event seed} * slack ≤ Fintype.card Outcome := by
  by_cases zero : competitors = 0
  · rw [zero, zero_mul] at count
    have empty : Nat.card {seed // event seed} = 0 := by nlinarith
    rw [empty]
    simp only [zero_mul, Nat.zero_le]
  · have lower := Nat.mul_le_mul_left (Nat.card {seed // event seed}) large
    have bound : competitors * (Nat.card {seed // event seed} * slack) ≤
        competitors * Fintype.card Outcome := by nlinarith
    exact Nat.le_of_mul_le_mul_left bound (Nat.pos_of_ne_zero zero)

/-- Three deletion stages each losing at most one sixth leave at least half the seeds. -/
theorem three_stage_half {Outcome : Type*} [Fintype Outcome]
    (bad : Fin 3 → Outcome → Prop)
    (small : ∀ stage, Nat.card {seed // bad stage seed} * 6 ≤ Fintype.card Outcome) :
    Fintype.card Outcome ≤ 2 * Nat.card {seed // ¬ ∃ stage, bad stage seed} := by
  have union := union_count bad
  have total := Finset.sum_le_sum (s := Finset.univ) (fun stage _ => small stage)
  simp only [← Finset.sum_mul, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul] at total
  have partition := event_partition (fun _ : Outcome => True) (fun seed => ∃ stage, bad stage seed)
  simp only [true_and, Nat.card_eq_fintype_card, Fintype.card_subtype_true] at partition
  simp only [Nat.card_eq_fintype_card] at union total ⊢
  omega

end
end MatrixBounds.Selection

namespace MatrixBounds.HashCounting

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {F P E : Type*} [Field F] [Fintype F] [Fintype P] [DecidableEq P] [Fintype E]

/-- Nested conditioning and good-seed selection describe the same subset of seeds. -/
def goodBucketEquiv (x y : P → F) (bucket : F) (good : Seed F P → Prop) :
    {seed : BucketEvent x y bucket // good seed.val} ≃
      {seed : Seed F P // hashX seed.2.1 seed.1 x = bucket ∧
        hashY seed.2.1 seed.2.2 seed.1 y = bucket ∧ good seed} where
  toFun seed := ⟨seed.val.val, seed.val.property.1, seed.val.property.2, seed.property⟩
  invFun seed := ⟨⟨seed.val, seed.property.1, seed.property.2.1⟩, seed.property.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Each seed can put a fixed edge in at most one bucket, so bucket counts add exactly. -/
theorem good_bucket_count (x y : P → F) (buckets : Finset F) (good : Seed F P → Prop) :
    (∑ bucket ∈ buckets, Nat.card {seed : BucketEvent x y bucket // good seed.val}) =
      Nat.card {seed : Seed F P // hashX seed.2.1 seed.1 x ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 y = hashX seed.2.1 seed.1 x ∧ good seed} := by
  classical
  simp only [Nat.card_congr (goodBucketEquiv x y _ good), Selection.count_as_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro seed _
  by_cases hy : hashY seed.2.1 seed.2.2 seed.1 y = hashX seed.2.1 seed.1 x
  · by_cases hg : good seed
    · simp [hy, hg, eq_comm]
    · simp [hg]
  · have absent (bucket : F) : ¬(hashX seed.2.1 seed.1 x = bucket ∧
        hashY seed.2.1 seed.2.2 seed.1 y = bucket ∧ good seed) := by
      intro hit
      exact hy (hit.2.1.trans hit.1.symm)
    simp [hy, absent]

/-- Uniform conditioned half-survival yields G*|B|/(2*M^2) good edges for one seed.
This is an integer inequality, so no hidden floor or positivity loss occurs. -/
theorem exists_many_surviving_edges (x y : E → P → F) (buckets : Finset F)
    (good : Seed F P → E → Prop)
    (half : ∀ edge bucket, bucket ∈ buckets →
      Nat.card (BucketEvent (x edge) (y edge) bucket) ≤
        2 * Nat.card {seed : BucketEvent (x edge) (y edge) bucket // good seed.val edge}) :
    ∃ seed : Seed F P, Fintype.card E * buckets.card ≤
      2 * (Fintype.card F)^2 * Nat.card {edge //
        hashX seed.2.1 seed.1 (x edge) ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 (y edge) = hashX seed.2.1 seed.1 (x edge) ∧ good seed edge} := by
  classical
  have per_edge (edge : E) := Finset.sum_le_sum (s := buckets) (fun bucket member => half edge bucket member)
  simp only [Nat.card_congr (bucketEquiv _ _ _), Nat.card_eq_fintype_card,
    Finset.sum_const, smul_eq_mul, ← Finset.mul_sum] at per_edge
  have counts (edge : E) := good_bucket_count (x edge) (y edge) buckets (fun seed => good seed edge)
  simp only [Nat.card_eq_fintype_card] at counts
  simp_rw [counts] at per_edge
  have total := Finset.sum_le_sum (s := Finset.univ) (fun edge _ => per_edge edge)
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, ← Finset.mul_sum,
    ← Nat.card_eq_fintype_card, Selection.count_as_sum] at total
  rw [Finset.sum_comm] at total
  let score (seed : Seed F P) := Nat.card {edge //
    hashX seed.2.1 seed.1 (x edge) ∈ buckets ∧
    hashY seed.2.1 seed.2.2 seed.1 (y edge) = hashX seed.2.1 seed.1 (x edge) ∧ good seed edge}
  apply Selection.exists_score_at_least score (2 * Fintype.card F ^ 2) (Fintype.card E * buckets.card)
  have total_score : Fintype.card E * (buckets.card * Fintype.card (P → F)) ≤
      2 * ∑ seed, score seed := by
    dsimp only [score]
    simp only [Selection.count_as_sum]
    simpa only [Nat.card_eq_fintype_card] using total
  simp only [Seed, Fintype.card_prod]
  convert Nat.mul_le_mul_left (Fintype.card F ^ 2) total_score using 1 <;> ring


end
end MatrixBounds.HashCounting
