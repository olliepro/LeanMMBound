module

public import SuppliedTerminalRationalSplit

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied rational terminal stage has exactly the three terminal entropy
rates, so it can share a bottleneck with the higher stages without extra loss. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRationalSplit

open Tensor Tensor.CW Tensor.CW.Terminal Entropy Empirical SuppliedTerminalScaling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Original source terminal potentials coincide with the positive potentials of the actual integer data. -/
theorem potential_integer (source : Source) (role : AxisOrder) :
    potential source role = coordinatePotential (axes source role) (parameter (extreme source) (middle source)) := by
  unfold potential extreme middle
  rw [SuppliedTerminalLaws.parameter_exact]

/-- The supplied rational terminal coarse rate equals the original integer extraction rate. -/
theorem coarse_integer (source : Source) (role : AxisOrder) :
    (split source role).coarseRetention (potential source role 0) (potential source role 1) (potential source role 2) =
      (permutedData (axes source role) (extreme source) (middle source)).coarseRetention
        (P := Fin (2*(extreme source+middle source)))
        (potential source role 0) (potential source role 1) (potential source role 2) := by
  unfold RationalSplit.coarseRetention SplitRestrictionData.rationalCoarseRetention
    SplitRestrictionData.coarseRetention SplitRestrictionData.gibbsCost
  simp only [split, permutedData, oneLetterMarginalData, oneLetterData, Fintype.card_fin, population]
  simp_rw [← marginalProfile_div]

/-- The supplied rational terminal fine rate equals its actual integer extraction rate on every compatibility class. -/
theorem fine_integer (source : Source) (role : AxisOrder) (axis : Fin 3)
    (axisClass : ShapeAlphabet 2 → CompatibilityClass 2) :
    (split source role).fineRetention axisClass (law axis) =
      (permutedData (axes source role) (extreme source) (middle source)).lawRetention
        (P := Fin (2*(extreme source+middle source))) axisClass (law axis) := by
  unfold RationalSplit.fineRetention SplitRestrictionData.lawRetention
  rw [parent_law_integer]
  congr 1
  unfold SplitRestrictionData.rationalPooledLaw SplitRestrictionData.pooledLaw
  simp only [split, permutedData, oneLetterMarginalData, oneLetterData, Fintype.card_fin, population]
  simp only [mul_div_assoc]

/-- Terminal coarse extraction at the supplied potential has no Gibbs penalty. -/
theorem coarse_exact (source : Source) (role : AxisOrder) :
    (split source role).coarseRetention (potential source role 0) (potential source role 1) (potential source role 2) =
      axisEntropy (extreme source) (middle source) (axes source role 0) := by
  rw [coarse_integer, potential_integer]
  exact permuted_coarseRetention_exact _ _ _ (positive source).1 (positive source).2

/-- The Y compatibility rate is exactly the entropy of the physically selected terminal axis. -/
theorem fine_y_exact (source : Source) (role : AxisOrder) :
    (split source role).fineRetention yClass (law 1) =
      axisEntropy (extreme source) (middle source) (axes source role 1) := by
  rw [fine_integer]
  exact permuted_nominal_y_retention _ _ _ (Nat.add_pos_left (positive source).1 _)

/-- The Z compatibility rate is exactly the entropy of the physically selected terminal axis. -/
theorem fine_z_exact (source : Source) (role : AxisOrder) :
    (split source role).fineRetention zClass (law 2) =
      axisEntropy (extreme source) (middle source) (axes source role 2) := by
  rw [fine_integer]
  exact permuted_nominal_z_retention _ _ _ (Nat.add_pos_left (positive source).1 _)

/-- Every axis of a shared terminal stage is the exact weighted sum of the original terminal entropies. -/
theorem stage_rates {T : Type*} [Fintype T] (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ)
    (weightPositive : ∀ type, 0 < weight type) (divisible : ∀ type, 17592186044416 ∣ weight type) (axis : Fin 3) :
    (stage source role weight weightPositive divisible).rates axis =
      ∑ type, (weight type : ℝ)*axisEntropy (extreme (source type)) (middle (source type)) (axes (source type) (role type) axis) := by
  fin_cases axis <;> simp only [Mixed.RationalStage.rates, stage,
    coarse_exact, fine_y_exact, fine_z_exact] <;> rfl

end
end MatrixBounds.Numeric.SuppliedTerminalRationalSplit
