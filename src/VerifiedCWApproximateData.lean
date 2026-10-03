module

public import CWRationalData
public import VerifiedSplitProfiles
public import CWTargetMaps

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied checked split rows directly instantiate the integer data,
symmetry, and reference edges required by complete approximate extraction. -/
namespace MatrixBounds.Numeric

open Empirical Tensor.CW
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- The actual extraction record encoded by a checked row at a divisible population. -/
def checkedSplitData (row : SplitRow) {length denominator : ℕ}
    (checked : row.check denominator = true) (total : row.childTotal = 2*length) (size : ℕ) :
    SplitRestrictionData length :=
  SplitRestrictionData.fromRational row.parent
    (by rw [(SplitRow.check_sound checked).2.2.1, total])
    (fun child => row.massAt child.val) denominator size

/-- Checked row normalization also holds on the extraction's actual child alphabet. -/
theorem checkedSplitData_normalized (row : SplitRow) {length denominator : ℕ}
    (checked : row.check denominator = true) (total : row.childTotal = 2*length) :
    (∑ child : ShapeAlphabet (2*length), row.massAt child.val) = denominator := by
  rcases row with ⟨parent, childTotal, entries⟩
  dsimp only at total
  subst childTotal
  have identity := checked_shape_mass_total checked
  change (∑ child : ShapeAlphabet (2*length),
    ({ parent := parent, childTotal := 2*length, row := entries } : SplitRow).massAt child.val) = denominator at identity
  exact identity

/-- Every checked row yields a genuine prescribed marginal-graph reference at every divisible size. -/
theorem checkedSplitData_reference (row : SplitRow) {length denominator size : ℕ}
    (checked : row.check denominator = true) (total : row.childTotal = 2*length)
    (divisible : denominator ∣ size) :
    Nonempty ((checkedSplitData row checked total size).PrescribedEdges (P := Fin size)) := by
  apply SplitRestrictionData.fromRational_reference _ _ _
    (checkedSplitData_normalized row checked total) divisible
  intro child nonzero
  apply ((SplitRow.check_sound checked).2.2.2 child.val _).1 nonzero
  simpa only [total] using child.property

/-- Checked complementary symmetry is exactly the symmetry premise of mixed extraction. -/
theorem checkedSplitData_symmetric (row : SplitRow) {length denominator size : ℕ}
    (checked : row.check denominator = true) (total : row.childTotal = 2*length) :
    (checkedSplitData row checked total size).Symmetric := by
  intro child
  change (size/denominator)*row.massAt
    ((complementEquiv row.parent (2*length) _).symm child).val = (size/denominator)*row.massAt child.val
  congr 1
  have identity := checked_complement_mass checked
  rcases row with ⟨parent, childTotal, entries⟩
  dsimp only at total
  subst childTotal
  exact identity child

/-- Every supplied split table row now provides both extraction feasibility and exact symmetry. -/
theorem supplied_approximate_data {row : SplitRow} (present : row ∈ SplitCertificateData.rows)
    {length size : ℕ} (total : row.childTotal = 2*length) (divisible : 17592186044416 ∣ size) :
    let checked := List.all_eq_true.mp SplitCertificateData.rows_checked row present
    let data := checkedSplitData row checked total size
    data.Symmetric ∧ Nonempty (data.PrescribedEdges (P := Fin size)) := by
  exact ⟨checkedSplitData_symmetric row _ total, checkedSplitData_reference row _ total divisible⟩

end
end MatrixBounds.Numeric
