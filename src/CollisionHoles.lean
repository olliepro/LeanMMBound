import HashCollisionRates

/-! Markov control of collision holes uses only per-block collision counts.
No independence between blocks or successive zero-out stages is assumed. -/
namespace MatrixBounds.Selection

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Outcome Block : Type*} [Fintype Outcome] [Fintype Block]

/-- Double-count seed/block incidences in either order. -/
theorem hole_count_double (holes : Outcome → Block → Prop) :
    (∑ seed, Nat.card {block // holes seed block}) = ∑ block, Nat.card {seed // holes seed block} := by
  simp only [count_as_sum]
  exact Finset.sum_comm

/-- Per-block collision bounds control the seeds that lose an inverse-scale fraction of blocks. -/
theorem many_holes_count [Nonempty Block] (holes : Outcome → Block → Prop) (modulus competitors scale : ℕ)
    (per_block : ∀ block, Nat.card {seed // holes seed block} * modulus ≤ competitors*Fintype.card Outcome) :
    Nat.card {seed // Fintype.card Block ≤ Nat.card {block // holes seed block}*scale} * modulus ≤
      scale*competitors*Fintype.card Outcome := by
  have total := Finset.sum_le_sum (s := Finset.univ) (fun block _ => per_block block)
  rw [← Finset.sum_mul, ← hole_count_double holes] at total
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul] at total
  have markov := markov_count (fun seed => Nat.card {block // holes seed block}*scale) (Fintype.card Block)
  rw [← Finset.sum_mul] at markov
  have multiplied := Nat.mul_le_mul_right modulus markov
  have scaled := Nat.mul_le_mul_right scale total
  have bound : Fintype.card Block *
      (Nat.card {seed // Fintype.card Block ≤ Nat.card {block // holes seed block}*scale}*modulus) ≤
      Fintype.card Block*(scale*competitors*Fintype.card Outcome) := by nlinarith
  exact Nat.le_of_mul_le_mul_left bound Fintype.card_pos

/-- A sufficiently large common modulus makes the rejected-seed fraction explicitly small. -/
theorem many_holes_slack [Nonempty Block] (holes : Outcome → Block → Prop)
    (modulus competitors scale slack : ℕ)
    (per_block : ∀ block, Nat.card {seed // holes seed block}*modulus ≤ competitors*Fintype.card Outcome)
    (large : slack*scale*competitors ≤ modulus) (positive : 0 < scale*competitors) :
    Nat.card {seed // Fintype.card Block ≤ Nat.card {block // holes seed block}*scale}*slack ≤ Fintype.card Outcome := by
  have markov := many_holes_count holes modulus competitors scale per_block
  have lower := Nat.mul_le_mul_left
    (Nat.card {seed // Fintype.card Block ≤ Nat.card {block // holes seed block}*scale}) large
  have bound : (scale*competitors) *
      (Nat.card {seed // Fintype.card Block ≤ Nat.card {block // holes seed block}*scale}*slack) ≤
      (scale*competitors)*Fintype.card Outcome := by nlinarith
  exact Nat.le_of_mul_le_mul_left bound positive

omit [Fintype Block] in
/-- Zero competitors force every collision-hole set to be empty when the modulus is positive. -/
theorem no_holes_of_zero_competitors (holes : Outcome → Block → Prop) {modulus : ℕ}
    (positive : 0 < modulus) (per_block : ∀ block, Nat.card {seed // holes seed block}*modulus = 0) :
    ∀ seed block, ¬holes seed block := by
  intro seed block hit
  have nonempty : Nonempty {seed // holes seed block} := ⟨⟨seed, hit⟩⟩
  have count_positive : 0 < Nat.card {seed // holes seed block} := by
    simpa only [Nat.card_eq_fintype_card] using (@Fintype.card_pos _ _ nonempty)
  have multiplied := Nat.mul_pos count_positive positive
  rw [per_block block] at multiplied
  omega

end
end MatrixBounds.Selection
