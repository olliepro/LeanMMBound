module

public import SplitCertificateData
public import SplitSemantics

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Semantic conclusions for every contextual split distribution in the supplied
certificate, obtained from the kernel-checked integer data. -/
namespace MatrixBounds.Numeric.SplitCertificateData

open scoped BigOperators

/-- A row present in the supplied split table defines an actual normalized real distribution. -/
theorem probability_valid {data : SplitRow} (present : data ∈ rows) :
    (∀ column, 0 ≤ data.row.probability 17592186044416 column) ∧
      ∑ column, data.row.probability 17592186044416 column = 1 := by
  have checked := List.all_eq_true.mp rows_checked data present
  exact DyadicRow.probability_valid (by decide) (SplitRow.check_sound checked).1

/-- All recorded split parents have exactly twice the child total. -/
theorem parent_total {data : SplitRow} (present : data ∈ rows) : data.parent.total = 2*data.childTotal := by
  exact (SplitRow.check_sound (List.all_eq_true.mp rows_checked data present)).2.2.1

/-- Positive mass in any recorded split belongs to an admissible complementary pair. -/
theorem supported_complement {data : SplitRow} (present : data ∈ rows)
    {child : Shape} (listed : child ∈ shapes data.childTotal) (nonzero : data.massAt child ≠ 0) :
    child.Fits data.parent ∧ (data.parent.complement child).Fits data.parent ∧
      (data.parent.complement child).total = data.childTotal ∧
      data.parent.complement (data.parent.complement child) = child ∧
      data.massAt child = data.massAt (data.parent.complement child) := by
  have constraints := (SplitRow.check_sound (List.all_eq_true.mp rows_checked data present)).2.2.2 child listed
  have fits := constraints.1 nonzero
  have complements := Shape.complement_involution fits
  exact ⟨fits, complements.1, Shape.complement_total (parent_total present) (shapes_total listed) fits,
    complements.2, constraints.2⟩

end MatrixBounds.Numeric.SplitCertificateData
