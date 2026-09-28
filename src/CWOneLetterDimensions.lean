import CWOneLetterInterfaces
import CWFiberCounts

/-! The full dimensions of one-letter leaves, obtained from their actual
coordinate alphabets rather than from a numerical dimension assignment. -/
namespace MatrixBounds.Tensor.CW

open Empirical
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- The one-letter coarse axis has q middle coordinates or one extreme coordinate. -/
theorem one_letter_axis_card (q : ℕ) (label : Fin 3) :
    Fintype.card (AxisVariable q 1 label.val) = if label = 1 then q else 1 := by
  let allFine : AxisVariable q 1 label.val ≃
      {entry : AxisVariable q 1 label.val // fineWord entry.val = fun _ => label} := {
    toFun entry := ⟨entry, one_letter_fine label entry⟩
    invFun := Subtype.val
    left_inv := fun _ => rfl
    right_inv := fun _ => rfl }
  rw [Fintype.card_congr allFine, axis_fine_fiber_card (fun _ : Fin 1 => label)
    (by simp [fineTotal])]
  by_cases middle : label = 1 <;>
    simp [count, Nat.card_eq_fintype_card, Fintype.card_subtype, middle]

/-- A one-letter exact interface keeps q to the number of pool positions on its middle axis. -/
theorem one_letter_exact_variable_card (q : ℕ) (label : Fin 3) :
    Fintype.card (Interface.Variable (P := P) (fun entry : AxisVariable q 1 label.val => fineWord entry.val)
      (oneLetterProfile label (Fintype.card P))) =
      if label = 1 then q^(Fintype.card P) else 1 := by
  rw [← Fintype.card_congr (oneLetterVariableEquiv (P := P) (q := q) label),
    Fintype.card_fun, one_letter_axis_card]
  split_ifs <;> simp

end
end MatrixBounds.Tensor.CW
