import SuppliedPopulationPaths

/-! Allocation history remains part of each tensor label. Summing its rate
contributions is exactly the original certificate's coarser population formula. -/
namespace MatrixBounds.Numeric.SuppliedPopulationPaths

open Tensor Tensor.CW SuppliedPopulationWeights
open scoped BigOperators
noncomputable section

/-- Enumerate all level-three histories while placing the current source and role before the inherited role. -/
def label3Equiv : (SuppliedStage3.Source × AxisOrder) × AxisOrder ≃ Label3 where
  toFun label := ⟨label.1.1, label.2, label.1.2⟩
  invFun label := ((label.source, label.role), label.previous)
  left_inv _ := rfl
  right_inv _ := rfl

/-- Enumerate every terminal history with its current source/axis preceding the two inherited roles. -/
def terminalLabelEquiv : (SuppliedTerminalScaling.Source × Fin 3) × (AxisOrder × AxisOrder) ≃ TerminalLabel where
  toFun label := ⟨label.1.1, label.2.1, label.2.2, label.1.2⟩
  invFun label := ((label.source, label.selected), (label.previous4, label.previous3))
  left_inv _ := rfl
  right_inv _ := rfl

/-- Any level-three rate depending on the actual source and current role has exactly the certificate's summed coefficient. -/
theorem sum_weight3 (rate : SuppliedStage3.Source → AxisOrder → ℝ) :
    (∑ label, (weight3 label : ℝ)*rate label.source label.role) =
      ∑ source, ∑ role, (role3Weight (source, role) : ℝ)*rate source role := by
  rw [← Equiv.sum_comp label3Equiv (fun label => (weight3 label : ℝ)*rate label.source label.role)]
  simp only [Fintype.sum_prod_type, label3Equiv, Equiv.coe_fn_mk]
  simp only [← Finset.sum_mul, ← Nat.cast_sum, weight3_sum]

/-- Any terminal rate depending on its actual source and current selected axis has the exact original summed coefficient. -/
theorem sum_terminal (rate : SuppliedTerminalScaling.Source → Fin 3 → ℝ) :
    (∑ label, (terminalWeight label : ℝ)*rate label.source label.selected) =
      ∑ source, ∑ selected, (terminalRoleWeight (source, selected) : ℝ)*rate source selected := by
  rw [← Equiv.sum_comp terminalLabelEquiv (fun label => (terminalWeight label : ℝ)*rate label.source label.selected)]
  simp only [Fintype.sum_prod_type, terminalLabelEquiv, Equiv.coe_fn_mk]
  simp only [← Finset.sum_mul, ← Nat.cast_sum, terminal_sum]

end
end MatrixBounds.Numeric.SuppliedPopulationPaths
