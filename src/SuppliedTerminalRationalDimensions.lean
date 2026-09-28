import SuppliedTerminalRationalChildren

/-! The matrix obtained from the shared terminal output has exactly its claimed
volume rate at every positive divisible population, before asymptotic limits. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRationalChildren

open Tensor Tensor.CW Terminal Empirical SuppliedTerminalScaling
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Positive divisible terminal population coefficients give positive repetitions at every positive size. -/
theorem repetitions_positive {weight size : ℕ} (weightPositive : 0 < weight)
    (sizePositive : 0 < size) (divisible : 17592186044416 ∣ weight) : 0 < repetitions weight size :=
  Nat.mul_pos (Nat.div_pos (Nat.le_of_dvd weightPositive divisible) (by decide)) sizePositive

/-- The repeated actual terminal counts have exactly the original fixed coefficient times the growing size. -/
theorem repetitions_population (source : Source) {weight : ℕ} (divisible : 17592186044416 ∣ weight) (size : ℕ) :
    2*(repetitions weight size*extreme source+repetitions weight size*middle source) = weight*size := by
  rw [repeated_population]
  unfold repetitions
  rw [← Nat.mul_assoc, Nat.mul_comm 17592186044416, Nat.div_mul_cancel divisible]

/-- The exact total matrix-volume rate per unit growing size of the supplied terminal labels. -/
def volumeRate {T : Type*} [Fintype T] (source : T → Source) (weight : T → ℕ) (q : ℕ) : ℝ :=
  ∑ type, (weight type : ℝ)*(2-2*(SuppliedTerminalLaws.mu (source type).node (source type).child (source type).strategy : ℝ))*Real.log q

/-- Complete shared terminal matrix dimensions have the exact supplied logarithmic volume, with no tolerance or entropy loss. -/
theorem matrix_log_volume {T : Type*} [Fintype T]
    (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ)
    (weightPositive : ∀ type, 0 < weight type) (divisible : ∀ type, 17592186044416 ∣ weight type)
    {size q : ℕ} (sizePositive : 0 < size) (qPositive : 0 < q) :
    Real.log ((Fintype.card (PermutedMixedRows (fun type => axes (source type) (role type)) q
        (fun type => repetitions (weight type) size*extreme (source type))
        (fun type => repetitions (weight type) size*middle (source type)))*
      Fintype.card (PermutedMixedInner (fun type => axes (source type) (role type)) q
        (fun type => repetitions (weight type) size*extreme (source type))
        (fun type => repetitions (weight type) size*middle (source type)))*
      Fintype.card (PermutedMixedColumns (fun type => axes (source type) (role type)) q
        (fun type => repetitions (weight type) size*extreme (source type))
        (fun type => repetitions (weight type) size*middle (source type))) : ℕ) : ℝ) =
      volumeRate source weight q*size := by
  have repeatedPositive (type : T) := repetitions_positive (weightPositive type) sizePositive (divisible type)
  have countsPositive (type : T) :
      0 < repetitions (weight type) size*extreme (source type)+repetitions (weight type) size*middle (source type) :=
    Nat.add_pos_left (Nat.mul_pos (repeatedPositive type) (positive (source type)).1) _
  rw [permuted_mixed_matrix_log_volume _ q _ _ qPositive countsPositive]
  unfold volumeRate
  rw [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro type _
  have populationReal :
      2*((repetitions (weight type) size*extreme (source type) : ℕ)+
        (repetitions (weight type) size*middle (source type) : ℕ) : ℝ) = (weight type : ℝ)*size := by
    exact_mod_cast repetitions_population (source type) (divisible type) size
  rw [populationReal, repeated_parameter (source type) _ (repeatedPositive type)]
  ring

end
end MatrixBounds.Numeric.SuppliedTerminalRationalChildren
