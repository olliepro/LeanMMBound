import MatrixProductVolume

/-! Complete families of actual finite matrices retain their multiplicative
volumes and additive logarithmic volumes. -/
namespace MatrixBounds.Tensor.MatrixMul

open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- All logarithmic volumes of a finite labelled matrix family add exactly. -/
theorem family_log_volume {T : Type} [Fintype T] (rows inner columns : T → Type)
    [∀ label, Fintype (rows label)] [∀ label, Fintype (inner label)] [∀ label, Fintype (columns label)]
    (positive : ∀ label, 0 < Fintype.card (rows label)*Fintype.card (inner label)*Fintype.card (columns label)) :
    Real.log ((Fintype.card (∀ label, rows label)*Fintype.card (∀ label, inner label)*Fintype.card (∀ label, columns label) : ℕ) : ℝ) =
      ∑ label, Real.log ((Fintype.card (rows label)*Fintype.card (inner label)*Fintype.card (columns label) : ℕ) : ℝ) := by
  rw [family_volume, Nat.cast_prod, Real.log_prod]
  intro label _
  exact_mod_cast (positive label).ne'

/-- A fixed finite number of complete equal-dimension matrices multiplies the logarithmic volume by that number. -/
theorem identical_log_volume (batches : ℕ) (rows inner columns : Type)
    [Fintype rows] [Fintype inner] [Fintype columns]
    (positive : 0 < Fintype.card rows*Fintype.card inner*Fintype.card columns) :
    Real.log ((Fintype.card (Fin batches → rows)*Fintype.card (Fin batches → inner)*Fintype.card (Fin batches → columns) : ℕ) : ℝ) =
      (batches : ℝ)*Real.log ((Fintype.card rows*Fintype.card inner*Fintype.card columns : ℕ) : ℝ) := by
  have equality := family_log_volume (fun _ : Fin batches => rows) (fun _ => inner) (fun _ => columns) (fun _ => positive)
  simpa only [← Nat.card_eq_fintype_card, Finset.sum_const, Finset.card_univ, Fintype.card_fin, Nat.card_fin, nsmul_eq_mul] using equality

end
end MatrixBounds.Tensor.MatrixMul
