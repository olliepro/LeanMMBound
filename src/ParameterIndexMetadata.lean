import CheckedIndexTable
import DyadicRowMetadata
import SplitRowMetadata
import GibbsRowMetadata

/-! Transfer the verified row metadata along every original parameter-array lookup. -/
namespace MatrixBounds.Numeric

/-- Every source-indexed reference inherits any Boolean predicate checked on its entire table. -/
theorem CheckedIndexTable.get_check {count bound : ℕ} (table : CheckedIndexTable count bound)
    (test : ℕ → Bool) (checked : table.entries.all test = true) (index : Fin count) :
    test (table.get index).val = true := by
  rw [table.get_val]
  exact List.all_eq_true.mp checked _ (List.getElem_mem _)

namespace ParameterIndexMetadata

/-- A source-array metadata check gives the actual selected sparse row's fixed alphabet size. -/
theorem dyadic_width {count width : ℕ} (table : CheckedIndexTable count 15279)
    (checked : table.entries.all (fun index => decide (DyadicRowMetadata.expected index = width)) = true)
    (index : Fin count) : (IndexedCertificateRows.dyadic (table.get index)).val.width = width :=
  (DyadicRowMetadata.metadata (table.get index)).trans
    (of_decide_eq_true (table.get_check _ checked index))

/-- A source-array metadata check gives the actual selected split's child coordinate total. -/
theorem split_total {count total : ℕ} (table : CheckedIndexTable count 5542)
    (checked : table.entries.all (fun index => decide (SplitRowMetadata.expected index = total)) = true)
    (index : Fin count) : (IndexedCertificateRows.split (table.get index)).val.childTotal = total :=
  (SplitRowMetadata.metadata (table.get index)).trans
    (of_decide_eq_true (table.get_check _ checked index))

/-- A source-array metadata check gives the actual selected Gibbs row's fixed alphabet size. -/
theorem gibbs_width {count width : ℕ} (table : CheckedIndexTable count 16629)
    (checked : table.entries.all (fun index => decide (GibbsRowMetadata.expected index = width)) = true)
    (index : Fin count) : (IndexedCertificateRows.gibbs (table.get index)).val.entries.length = width :=
  (GibbsRowMetadata.metadata (table.get index)).trans
    (of_decide_eq_true (table.get_check _ checked index))

end ParameterIndexMetadata
end MatrixBounds.Numeric
