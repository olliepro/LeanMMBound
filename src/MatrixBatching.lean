import TensorBatching
import RankAmplification

/-! Reusing a batch algorithm recursively gives single-matrix algorithms with
the amortized rank per batch, rounded upward to an integer. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Independent square matrix products, indexed by a finite batch number.
For example, `squareBatch K 3 2` represents three independent 2 by 2 products. -/
abbrev squareBatch (K : Type*) [CommSemiring K] (copies size : ℕ) :=
  directSum (fun _ : Fin copies =>
    tensor (K := K) (I := Fin size) (J := Fin size) (L := Fin size))

/-- A substituted batch of matrix products multiplies matrix dimensions. -/
theorem squareBatch_substitution {copies base inner terms budget : ℕ}
    (outer : RankLE (squareBatch K copies base) terms)
    (inputs : RankLE (squareBatch K terms inner) budget) :
    RankLE (squareBatch K copies (base * inner)) budget := by
  let equiv : Fin (base * inner) ≃ Fin base × Fin inner := Fintype.equivOfCardEq (by simp)
  have result := rankLE_substitution outer inputs
  have pulled := rankLE_pullback result
    (fun x : Fin copies × (Fin (base * inner) × Fin (base * inner)) =>
      ((x.1, (equiv x.2.1).1, (equiv x.2.2).1), ((equiv x.2.1).2, (equiv x.2.2).2)))
    (fun y : Fin copies × (Fin (base * inner) × Fin (base * inner)) =>
      ((y.1, (equiv y.2.1).1, (equiv y.2.2).1), ((equiv y.2.1).2, (equiv y.2.2).2)))
    (fun z : Fin copies × (Fin (base * inner) × Fin (base * inner)) =>
      ((z.1, (equiv z.2.1).1, (equiv z.2.2).1), ((equiv z.2.1).2, (equiv z.2.2).2)))
  convert pulled using 1
  funext x y z
  simp only [squareBatch, directSum, product, tensor]
  have ex (a b : Fin (base * inner)) : a = b ↔ equiv a = equiv b := equiv.injective.eq_iff.symm
  simp only [ex, Prod.ext_iff]
  split_ifs <;> simp_all

/-- Recursive batching at depth k costs at most s*c^k terms if r ≤ c*s.
The invariant retains all s independent products throughout the recursion. -/
theorem squareBatch_iterate {copies base terms groups : ℕ}
    (algorithm : RankLE (squareBatch K copies base) terms)
    (capacity : terms ≤ groups * copies) (power : ℕ) :
    RankLE (squareBatch K copies (base ^ power)) (copies * groups ^ power) := by
  induction power with
  | zero =>
    have scalar : RankLE (tensor (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1)) 1 := by
      simpa using (schoolbook_rank (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1))
    simpa only [pow_zero, Nat.mul_one, Fintype.card_fin] using
      rankLE_directSum (fun _ : Fin copies => tensor (K := K) (I := Fin 1)
        (J := Fin 1) (L := Fin 1)) 1 (fun _ => scalar)
  | succ power ih =>
    have inputs := rankLE_padded_batches _ ih capacity
    have result := squareBatch_substitution algorithm inputs
    rw [pow_succ, pow_succ]
    rw [Nat.mul_comm (base ^ power) base]
    convert result using 1
    ac_rfl

/-- A nonempty batch algorithm yields power-size matrix rank bounds with a constant batch cost. -/
theorem matrixRank_le_batch_powers {copies base terms groups : ℕ} (nonempty : 0 < copies)
    (algorithm : RankLE (squareBatch K copies base) terms)
    (capacity : terms ≤ groups * copies) (power : ℕ) :
    matrixRank K (base ^ power) ≤ copies * groups ^ power :=
  matrixRank_le K (rankLE_one_copy _ ⟨0, nonempty⟩
    (squareBatch_iterate algorithm capacity power))

/-- Integer amortized batch cost bounds the actual matrix multiplication exponent. -/
theorem exponent_le_of_batch_integer {copies base terms groups : ℕ}
    (nonempty : 0 < copies) (base_large : 1 < base)
    (algorithm : RankLE (squareBatch K copies base) terms)
    (capacity : terms ≤ groups * copies) (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (cost : (groups : ℝ) ≤ (base : ℝ) ^ rate) : exponent K ≤ rate := by
  apply exponent_le_of_admissible K
  apply admissible_of_power_bounds K base base_large rate copies rate_nonneg
    (by exact_mod_cast nonempty)
  intro power
  have bound : (matrixRank K (base ^ power) : ℝ) ≤ (copies : ℝ) * (groups : ℝ) ^ power := by
    exact_mod_cast matrixRank_le_batch_powers nonempty algorithm capacity power
  calc
    _ ≤ (copies : ℝ) * (groups : ℝ) ^ power := bound
    _ ≤ (copies : ℝ) * ((base : ℝ) ^ rate) ^ power :=
      mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (by positivity) cost _) (by positivity)
    _ = _ := by
      rw [Nat.cast_pow, ← Real.rpow_natCast_mul (by positivity),
        ← Real.rpow_mul_natCast (by positivity)]
      rw [mul_comm rate]

end
end MatrixBounds.MatrixComplexity
