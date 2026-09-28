import SuppliedDimensionRootLookup

/-! Balanced original hierarchy metadata preserves the full zero3 source population. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open Tensor.CW TerminalSourceNodeLookup SuppliedPopulationWeights
noncomputable section
set_option maxRecDepth 3000

/-- Balanced lookup over every unchanged original zero3 hierarchy record. -/
def zero3Table : SourceTable SuppliedShapeIndices.HierarchyNode 840 :=
  ((SourceTable.ofList SuppliedShapeIndices.zeroNodesPart000
      (show SuppliedShapeIndices.zeroNodesPart000.length = 256 by decide)).append
    (SourceTable.ofList SuppliedShapeIndices.zeroNodesPart001
      (show SuppliedShapeIndices.zeroNodesPart001.length = 256 by decide))).append
  ((SourceTable.ofList SuppliedShapeIndices.zeroNodesPart002
      (show SuppliedShapeIndices.zeroNodesPart002.length = 256 by decide)).append
    (SourceTable.ofList SuppliedShapeIndices.zeroNodesPart003
      (show SuppliedShapeIndices.zeroNodesPart003.length = 72 by decide)))

/-- Balanced hierarchy dispatch retains every zero3 source record in its original position. -/
theorem zero3Table_lookup (node : Fin 840) : zero3Table.lookup node = SuppliedShapeIndices.zeroNode node := by
  rw [zero3Table.lookup_eq]
  have entries : zero3Table.entries = SuppliedShapeIndices.zeroNodes := by
    simp only [zero3Table, SourceTable.append, SourceTable.ofList, SuppliedShapeIndices.zeroNodes, List.append_assoc]
  simp only [entries, SuppliedShapeIndices.zeroNode]

/-- Original zero3 parent selected through balanced source metadata. -/
def zero3Parent (node : Fin 840) : Fin 105 :=
  ⟨(zero3Table.lookup node).parent, by rw [zero3Table_lookup]; exact (SuppliedShapeIndices.zeroNode_bounds node).1⟩

/-- Balanced parent dispatch selects exactly the original source parent. -/
theorem zero3Parent_eq (node : Fin 840) :
    zero3Parent node = (SuppliedNodePartialIndexing.decode (.inr node)).1 := by
  apply Fin.ext
  simp only [zero3Parent, zero3Table_lookup, SuppliedNodePartialIndexing.decode]

/-- Original zero3 child probability numerator, selected directly at its complete source column. -/
def zero3SplitNumerator (node : Fin 840) : ℕ :=
  (SuppliedParameters.alpha4 (zero3Parent node)).val.row.atColumn (zero3Table.lookup node).child

/-- Direct finite column access preserves the actual original checked zero3 split numerator. -/
theorem zero3SplitNumerator_eq (node : Fin 840) :
    zero3SplitNumerator node =
      (SuppliedTypedParameters.level4Split (SuppliedNodePartialIndexing.decode (.inr node)).1).numerator
        (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2) := by
  rw [zero3SplitNumerator, zero3Parent_eq, zero3Table_lookup]
  symm
  exact checkedSplit_numerator_column (length := 4)
    (SuppliedParameters.alpha4 (SuppliedNodePartialIndexing.decode (.inr node)).1).val
    (SuppliedParameters.alpha4 (SuppliedNodePartialIndexing.decode (.inr node)).1).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha4.table
      SuppliedParameterChecks.SplitAlpha4_metadata (SuppliedNodePartialIndexing.decode (.inr node)).1)
    (SuppliedNodePartialIndexing.decode (.inr node)).2

/-- Complete original zero3 population numerator computed from balanced metadata and source columns. -/
def balancedZero3Numerator (node : Fin 840) : ℕ :=
  2*fastRootNumerator (zero3Parent node)*zero3SplitNumerator node

/-- Balanced arithmetic changes none of the complete original zero3 population. -/
theorem balancedZero3Numerator_eq (node : Fin 840) : balancedZero3Numerator node = zero3Numerator node := by
  simp only [balancedZero3Numerator, zero3Numerator, fastRootNumerator_eq, zero3Parent_eq, zero3SplitNumerator_eq]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
