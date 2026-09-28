import SuppliedPairedFineSplitPools
import SuppliedPairedFineIntegerParents
import RootFineCachedParent4
import RootFineParent4CacheTable

/-! Complete paired fine source expressions evaluated from exact integer parent, child, and split
inputs, retaining every original compatibility sector at both paired levels. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 4000000

/-- Read a checked consecutive parent4 window, retaining the exact source formula outside its bounds. -/
def parent4Window {start count : ℕ} (table : RootFineParent4CacheTable start count)
    (source : Fin 105) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if present : start ≤ source.val ∧ source.val < start+count then
    table.lookup ⟨source.val-start, by omega⟩ axis orbit
  else SuppliedRootFineParent4Integers.numerator source axis orbit

/-- Every window lookup and every source fallback equals the complete original parent4 law. -/
theorem parent4Window_eq {start count : ℕ} (table : RootFineParent4CacheTable start count)
    (source : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    parent4Window table source axis orbit = SuppliedRootFineParent4Integers.numerator source axis orbit := by
  unfold parent4Window
  split_ifs with present
  · refine (table.checked ⟨source.val-start, by omega⟩ axis orbit).trans ?_
    congr 1
    apply Fin.ext
    dsimp only
    omega
  · rfl

/-! ### Level four -/

/-- Complete integer four-letter child numerators of one source at denominator 2^178, by original column. -/
abbrev ChildValues4 := Fin 45 → Fin 3 → Fin 21 → ℤ

/-- Child numerators read through a verified parent3 table. -/
def windowChildren (parent3 : RootFineCachedParent4.Parent3Values) (source : Fin 105) : ChildValues4 :=
  fun column axis orbit => RootFineCachedParent4.child parent3 source column axis orbit

/-- Window children equal the complete original integer child hierarchy. -/
theorem windowChildren_eq (parent3 : RootFineCachedParent4.Parent3Values)
    (sourceEq3 : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (source : Fin 105) : ∀ column axis orbit, windowChildren parent3 source column axis orbit =
      SuppliedRootFineChild3Integers.numerator source (shapeColumnEquiv 8 column) axis orbit :=
  fun column axis orbit => RootFineCachedParent4.child_eq parent3 sourceEq3 source column axis orbit

/-- Complete integer four-letter child masses at the selected physical axis, denominator 2^178. -/
def childMass4 (children : ChildValues4) (role : AxisOrder) (axis : Fin 2) (column : Fin 45)
    (orbit : Fin 21) : ℤ :=
  children column (role.permutation (physicalAxis axis)) orbit

/-- All separately labelled and pooled level-four sectors from exact integer inputs. -/
def poolExpression4 (children : ChildValues4) (source : Fin 105) (role : AxisOrder)
    (axis : Fin 2) : RationalLogExpression :=
  splitPoolsExpression (columns := 45) (children := 21) (coordinates := 9)
    (isolatedColumn 8 role axis) (poolCoordinate 8 role axis) (RootFineCachedParent4.weight source)
    17592186044416 (childMass4 children role axis) (2^178) OrbitLevel3.sizes

/-- Exact eight-letter parent entropy with a kernel-friendly natural denominator. -/
def parentEntropy4 (parents : ParentValues4) (source : Fin 105) (role : AxisOrder) (axis : Fin 2) :
    RationalLogExpression :=
  orbitEntropyExpression
    (fun orbit => (parents source (role.permutation (physicalAxis axis)) orbit : ℚ)/((2^406 : ℕ) : ℚ))
    OrbitLevel4.sizes

/-- The natural-denominator parent entropy is the cached rational parent expression. -/
theorem parentEntropy4_eq (parents : ParentValues4) (source : Fin 105) (role : AxisOrder) (axis : Fin 2) :
    parentEntropy4 parents source role axis = parentExpression4 parents source role axis := by
  simp only [parentEntropy4, parentExpression4, Nat.cast_pow, Nat.cast_ofNat]

/-- Complete level-four fine source expression from exact integer parent, child, and split inputs. -/
def nodeExpression4 (parents : ParentValues4) (children : ChildValues4)
    (source : Fin 105) (role : AxisOrder) (axis : Fin 2) : RationalLogExpression :=
  parentEntropy4 parents source role axis ++ scaleLogExpression (-1) (poolExpression4 children source role axis)

/-- The integer pool expression evaluates every original physically labelled level-four sector. -/
theorem poolExpression4_value (children : ChildValues4) (source : Fin 105)
    (childrenEq : ∀ column axis orbit, children column axis orbit =
      SuppliedRootFineChild3Integers.numerator source (shapeColumnEquiv 8 column) axis orbit)
    (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (poolExpression4 children source role axis) =
      ∑ sector : Fin ((shapes 8).length + (8+1)), rationalLogValue (orbitMassEntropyExpression
        (splitPoolMass (SuppliedStage4.split source role) (mass4 source role axis) (actualClass axis)
          (physicalSectors 8 role sector)) OrbitLevel3.orbits.size) := by
  rw [poolExpression4, splitPoolsExpression_value (columns := 45) (children := 21) (coordinates := 9)
    _ _ _ _ _ _ _ (physicalLabel 8 role axis) (physicalLabel_eq 8 role axis)]
  simp only [Nat.cast_pow, Nat.cast_ofNat, funext OrbitLevel3.sizes_correct]
  apply Finset.sum_congr rfl
  intro sector _
  refine congrArg (fun pool => rationalLogValue (orbitMassEntropyExpression pool OrbitLevel3.sizes)) ?_
  funext orbit
  have physicalIdentity := permutedColumnPool_eq (SuppliedTypedParameters.level4Split source)
    (fun child => SuppliedHigherOrbitMass.child3 source child (role.permutation (physicalAxis axis)))
    (actualClass axis) role.permutation (shapeColumnEquiv 8) (physicalSectors 8 role) sector orbit
  simp only [RootFineCachedParent4.weight_eq, childMass4, childrenEq,
    SuppliedRootFineChild3Integers.numerator_value, SuppliedRootFineFastArithmetic.child3_eq,
    SuppliedRootFineArithmetic.child3_eq]
  exact physicalIdentity

/-- Integer input evaluation preserves the complete original level-four fine retention. -/
theorem nodeExpression4_value (parents : ParentValues4)
    (sourceEq4 : ∀ source axis orbit, parents source axis orbit =
      SuppliedRootFineParent4Integers.numerator source axis orbit)
    (children : ChildValues4) (source : Fin 105)
    (childrenEq : ∀ column axis orbit, children column axis orbit =
      SuppliedRootFineChild3Integers.numerator source (shapeColumnEquiv 8 column) axis orbit)
    (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (nodeExpression4 parents children source role axis) =
      rationalLogValue (sourceExpression4 source role axis) := by
  rw [sourceExpression4_value]
  have decoded : (fun child => OrbitLevel3.orbits.decode
      (fun orbit => (mass4 source role axis child orbit : ℝ))) =
      SuppliedStage4.law source role (physicalAxis axis) := by
    funext child
    exact (SuppliedHigherOrbitMass.child3_decode source _ _).symm
  have parentValue := parentExpression4_value parents sourceEq4 source role axis
  rw [← decoded] at parentValue ⊢
  have identity := expressionWithParent_value (SuppliedStage4.split source role) OrbitLevel3.orbits
    (mass4 source role axis) (actualClass axis) (physicalSectors 8 role)
    (parentExpression4 parents source role axis) parentValue
  simp only [nodeExpression4, expressionWithParent, rationalLogValue_append, scaleLogExpression_value,
    finiteLogSum_value, poolExpression4_value children source childrenEq, parentEntropy4_eq] at identity ⊢
  exact identity

/-! ### Level three -/

/-- Complete integer two-letter child masses at the selected physical axis, denominator 2^44. -/
def childMass3 (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2)
    (column : Fin 15) (orbit : Fin 6) : ℤ :=
  SuppliedRootFineParent3Columns.leaf source.1 source.2 column (role.permutation (physicalAxis axis)) orbit

/-- All separately labelled and pooled level-three sectors from exact integer inputs. -/
def poolExpression3 (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    RationalLogExpression :=
  splitPoolsExpression (columns := 15) (children := 6) (coordinates := 5)
    (isolatedColumn 4 role axis) (poolCoordinate 4 role axis)
    (SuppliedRootFineParent3Columns.weight source.1 source.2) 17592186044416
    (childMass3 source role axis) 17592186044416 OrbitLevel2.sizes

/-- Exact four-letter parent entropy with a kernel-friendly natural denominator. -/
def parentEntropy3 (parents : ParentValues3) (source : SuppliedStage3.Source) (role : AxisOrder)
    (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression
    (fun orbit => (parents source.1 source.2 (role.permutation (physicalAxis axis)) orbit : ℚ)/((2^134 : ℕ) : ℚ))
    OrbitLevel3.sizes

/-- The natural-denominator parent entropy is the cached rational parent expression. -/
theorem parentEntropy3_eq (parents : ParentValues3) (source : SuppliedStage3.Source) (role : AxisOrder)
    (axis : Fin 2) : parentEntropy3 parents source role axis = parentExpression3 parents source role axis := by
  simp only [parentEntropy3, parentExpression3, Nat.cast_pow, Nat.cast_ofNat]

/-- Complete level-three fine source expression from exact integer parent, child, and split inputs. -/
def nodeExpression3 (parents : ParentValues3) (source : SuppliedStage3.Source) (role : AxisOrder)
    (axis : Fin 2) : RationalLogExpression :=
  parentEntropy3 parents source role axis ++ scaleLogExpression (-1) (poolExpression3 source role axis)

/-- The integer pool expression evaluates every original physically labelled level-three sector. -/
theorem poolExpression3_value (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (poolExpression3 source role axis) =
      ∑ sector : Fin ((shapes 4).length + (4+1)), rationalLogValue (orbitMassEntropyExpression
        (splitPoolMass (SuppliedStage3.split source role) (mass3 source role axis) (actualClass axis)
          (physicalSectors 4 role sector)) OrbitLevel2.orbits.size) := by
  rw [poolExpression3, splitPoolsExpression_value (columns := 15) (children := 6) (coordinates := 5)
    _ _ _ _ _ _ _ (physicalLabel 4 role axis) (physicalLabel_eq 4 role axis)]
  simp only [Nat.cast_ofNat, funext OrbitLevel2.sizes_correct]
  apply Finset.sum_congr rfl
  intro sector _
  refine congrArg (fun pool => rationalLogValue (orbitMassEntropyExpression pool OrbitLevel2.sizes)) ?_
  funext orbit
  have physicalIdentity := permutedColumnPool_eq (SuppliedTypedParameters.level3Split source.1 source.2)
    (fun child => SuppliedLeafLaws.mass source.1 source.2 child (role.permutation (physicalAxis axis)))
    (actualClass axis) role.permutation (shapeColumnEquiv 4) (physicalSectors 4 role) sector orbit
  simp only [SuppliedRootFineParent3Columns.weight_eq, childMass3, SuppliedRootFineParent3Columns.leaf_eq,
    SuppliedRootFineLeafIntegers.leaf_value, SuppliedRootFineFastArithmetic.leafMass_eq]
  exact physicalIdentity

/-- Integer input evaluation preserves the complete original level-three fine retention. -/
theorem nodeExpression3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (nodeExpression3 parents source role axis) =
      rationalLogValue (sourceExpression3 source role axis) := by
  rw [sourceExpression3_value]
  have identity := expressionWithParent_value (SuppliedStage3.split source role) OrbitLevel2.orbits
    (mass3 source role axis) (actualClass axis) (physicalSectors 4 role)
    (parentExpression3 parents source role axis) (parentExpression3_value parents sourceEq source role axis)
  simp only [nodeExpression3, expressionWithParent, rationalLogValue_append, scaleLogExpression_value,
    finiteLogSum_value, poolExpression3_value, parentEntropy3_eq] at identity ⊢
  exact identity

end
end MatrixBounds.Numeric.SuppliedPairedFine
