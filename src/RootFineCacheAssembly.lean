module

public import RootFineSparseVectorCheck

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Small reusable finite-case proofs keep each generated cache module compact. -/
namespace MatrixBounds.Numeric

/-- Assemble three separately proved finite coordinate cases without regenerating case-analysis proofs. -/
theorem finThreeCases {predicate : Fin 3 → Prop} (zero : predicate 0) (one : predicate 1)
    (two : predicate 2) (index : Fin 3) : predicate index := by
  fin_cases index
  · exact zero
  · exact one
  · exact two

/-- Assemble the six original strategy cases using a shared proof of exhaustive finite enumeration. -/
theorem finSixCases {predicate : Fin 6 → Prop} (zero : predicate 0) (one : predicate 1)
    (two : predicate 2) (three : predicate 3) (four : predicate 4) (five : predicate 5)
    (index : Fin 6) : predicate index := by
  fin_cases index
  · exact zero
  · exact one
  · exact two
  · exact three
  · exact four
  · exact five

/-- A complete verified source node forms a one-node cache block at its unchanged original position. -/
def RootFineParent3CacheTable.single (source : Fin 945)
    (value : Fin 6 → Fin 3 → Fin 21 → ℤ)
    (checked : ∀ strategy axis orbit, value strategy axis orbit =
      SuppliedRootFineParent3Columns.numerator source strategy axis orbit) :
    RootFineParent3CacheTable source.val 1 where
  bounded := source.isLt
  lookup _ := value
  checked node strategy axis orbit := by
    have zero : node.val = 0 := by have := node.isLt; omega
    simpa only [zero, Nat.add_zero] using checked strategy axis orbit

end MatrixBounds.Numeric
