import SuppliedTerminalRationalRates
import SuppliedTypedParameters
import WeightedSectorAllocation

/-! The source certificate's three-way terminal role policy is realized by
actual physical permutations and has its stated weighted entropy vector. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRoles

open Tensor Tensor.CW Tensor.CW.Terminal Entropy Empirical SuppliedTerminalScaling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Original source policy, including its four exceptional entries, as a normalized three-role distribution. -/
def distribution (source : Source) : TypedProbabilityRow 3 17592186044416 :=
  SuppliedTypedParameters.terminalRoleDistribution source.node source.child source.strategy

/-- Actual physical role putting the terminal's ternary coordinate on the selected extraction axis. -/
def role (source : Source) (selected : Fin 3) : AxisOrder :=
  AxisOrder.permutationEquiv.symm ((SuppliedTerminalLaws.childAxes source.child)⁻¹*Equiv.swap selected 2)

/-- The chosen role composes with the original child orientation exactly as required. -/
theorem axes_role (source : Source) (selected : Fin 3) :
    axes source (role source selected) = Equiv.swap selected 2 := by
  unfold axes role
  change _*AxisOrder.permutationEquiv (AxisOrder.permutationEquiv.symm _) = _
  rw [Equiv.apply_symm_apply, mul_inv_cancel_left]

/-- The original supplied ternary entropy, before assigning any physical axis. -/
def ternary (source : Source) : ℝ :=
  entropy (![parameter (extreme source) (middle source),
    1-2*parameter (extreme source) (middle source), parameter (extreme source) (middle source)] : Fin 3 → ℝ)

/-- Actual terminal entropy in a selected role equals the ternary entropy precisely on that role's chosen axis. -/
theorem selected_entropy (source : Source) (selected axis : Fin 3) :
    axisEntropy (extreme source) (middle source) (axes source (role source selected) axis) =
      if selected = axis then ternary source else Real.log 2 := by
  rw [axes_role]
  unfold axisEntropy ternary
  have selected_iff : (Equiv.swap selected 2) axis = 2 ↔ selected = axis := by
    fin_cases selected <;> fin_cases axis <;> decide
  simp only [selected_iff]

/-- Exact real probabilities from the original terminal role row have total one. -/
theorem distribution_total (source : Source) :
    (∑ selected, ((distribution source).rational selected : ℝ)) = 1 := by
  exact_mod_cast ((distribution source).rational_valid (by decide)).2

/-- The original three-role terminal policy yields the claimed axiswise convex combination of entropies. -/
theorem allocated_entropy (source : Source) (axis : Fin 3) :
    (∑ selected, ((distribution source).rational selected : ℝ)*
      axisEntropy (extreme source) (middle source) (axes source (role source selected) axis)) =
      (1-((distribution source).rational axis : ℝ))*Real.log 2+
        ((distribution source).rational axis : ℝ)*ternary source := by
  simp_rw [selected_entropy]
  have expand (selected : Fin 3) :
      (if selected = axis then ternary source else Real.log 2) =
        Real.log 2 + if selected = axis then ternary source-Real.log 2 else 0 := by
    split_ifs <;> ring
  simp_rw [expand, mul_add, mul_ite, mul_zero]
  rw [Finset.sum_add_distrib, ← Finset.sum_mul, distribution_total]
  simp only [Finset.sum_ite_eq', Finset.mem_univ, if_true]
  ring

/-- Every terminal role allocation preserves exactly the original population coefficient. -/
theorem allocated_total (source : Source) {weight : ℕ} (divisible : 17592186044416 ∣ weight) :
    (∑ selected, Interface.allocatedWeight weight 17592186044416 (distribution source).numerator selected) = weight :=
  Interface.allocatedWeight_total _ (distribution source).numerator_total divisible

end
end MatrixBounds.Numeric.SuppliedTerminalRoles
