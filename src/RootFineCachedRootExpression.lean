module

public import SuppliedRootFineRoot4Integers
public import SuppliedRootFineBinding

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Checked complete parent4 integers substitute into both actual root fine-rate expressions. -/
namespace MatrixBounds.Numeric.RootFineCachedRootExpression

set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

open Tensor.CW
open scoped BigOperators
noncomputable section

/-- Complete source coordinates of every positive eight-letter parent law. -/
abbrev Parent4Values := Fin 105 → Fin 3 → Fin 231 → ℤ

/-- Complete integer root law, including the original zero-coordinate children. -/
def rootNumerator (parent4 : Parent4Values) (column : Fin 153) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  match SuppliedChildKinds.kind4 column with
  | Sum.inl selected => SuppliedRootFineRoot4Integers.zero selected ((shapes 16)[column.val]) axis orbit
  | Sum.inr selected => parent4 selected axis orbit

/-- Replacing cached parents by their source identities preserves every full root child law. -/
theorem rootNumerator_eq (parent4 : Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit)
    (column : Fin 153) (axis : Fin 3) (orbit : Fin 231) :
    rootNumerator parent4 column axis orbit =
      SuppliedRootFineRoot4Integers.numerator (shapeColumnEquiv 16 column) axis orbit := by
  simp only [rootNumerator, SuppliedRootFineRoot4Integers.numerator,
    (shapeColumnEquiv 16).symm_apply_apply column, sourceEq]
  rfl

/-- Exact complete root masses on the two physical fine axes, using denominator2^406. -/
def mass (parent4 : Parent4Values) (axis : Fin 2) (column : Fin 153) (orbit : Fin 231) : ℚ :=
  (rootNumerator parent4 column (SuppliedRootStage.axes (SuppliedRootFine.physicalAxis axis)) orbit : ℚ)/(2:ℚ)^406

/-- Each cached rational root mass is exactly the original complete supplied mass. -/
theorem mass_eq (parent4 : Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit)
    (axis : Fin 2) (column : Fin 153) (orbit : Fin 231) :
    mass parent4 axis column orbit = SuppliedRootFine.mass axis column orbit := by
  rw [mass, rootNumerator_eq parent4 sourceEq, SuppliedRootFineRoot4Integers.numerator_value,
    SuppliedRootFineFastArithmetic.root4_eq]
  rfl

/-- Complete unpartitioned mixture on the original153 source root columns. -/
def mixture (parent4 : Parent4Values) (axis : Fin 2) (orbit : Fin 231) : ℚ :=
  ∑ column : Fin 153, SuppliedRootCoarse.mass column*mass parent4 axis column orbit

/-- Complete labelled compatibility pools retain every original singleton and coordinate label. -/
def pool (parent4 : Parent4Values) (axis : Fin 2) (sector : Fin 170) (orbit : Fin 231) : ℚ :=
  ∑ column : Fin 153, if SuppliedRootFine.classLabel axis column = finSumFinEquiv.symm sector then
    SuppliedRootCoarse.mass column*mass parent4 axis column orbit else 0

/-- Exact fine retention expression evaluated from independently checked integer parent data. -/
def expression (parent4 : Parent4Values) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (mixture parent4 axis) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (pool parent4 axis sector) OrbitLevel4.sizes))

/-- Cached arithmetic preserves the full original root fine expression term for term. -/
theorem expression_eq (parent4 : Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit) (axis : Fin 2) :
    expression parent4 axis = SuppliedRootFine.expression axis := by
  have mixtures : mixture parent4 = SuppliedRootFine.mixture := by
    funext selected orbit
    simp only [mixture, SuppliedRootFine.mixture, mass_eq parent4 sourceEq]
  have pools : pool parent4 = SuppliedRootFine.pool := by
    funext selected sector orbit
    simp only [pool, SuppliedRootFine.pool, mass_eq parent4 sourceEq]
  simp only [expression, SuppliedRootFine.expression, mixtures, pools]

end
end MatrixBounds.Numeric.RootFineCachedRootExpression
