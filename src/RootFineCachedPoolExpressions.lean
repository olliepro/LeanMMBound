import RootFinePoolVectors
import RootFineCertificateExpressions

/-! Cached exact integer coordinate pools evaluate the supplied complete root fine expressions. -/
namespace MatrixBounds.Numeric.RootFineCachedPoolExpressions

noncomputable section

variable (parent4 : RootFineCachedRootExpression.Parent4Values)
  (vectors : Fin 36 → Fin 231 → ℤ)
  (vectorEq : ∀ row orbit, vectors row orbit = RootFinePoolVectors.numerator parent4 row orbit)
include vectorEq

/-- Original integer-mixture cache position of one physical root fine axis. -/
def mixtureRow (axis : Fin 2) : Fin 36 := ⟨18*axis.val, by have := axis.isLt; omega⟩

/-- Original coordinate-pool cache position, retaining all17 source coordinate labels. -/
def poolRow (axis : Fin 2) (coordinate : Fin 17) : Fin 36 :=
  ⟨18*axis.val+coordinate.val+1, by have := axis.isLt; have := coordinate.isLt; omega⟩

/-- Complete cached root mixture interpreted at its exact common denominator. -/
def mixture (axis : Fin 2) (orbit : Fin 231) : ℚ :=
  (vectors (mixtureRow axis) orbit : ℚ)/(2:ℚ)^450

/-- Complete cached coordinate pool interpreted at its exact common denominator. -/
def coordinatePool (axis : Fin 2) (coordinate : Fin 17) (orbit : Fin 231) : ℚ :=
  (vectors (poolRow axis coordinate) orbit : ℚ)/(2:ℚ)^450

/-- Cached original mixtures retain exactly the source rational root mixture. -/
theorem mixture_value (axis : Fin 2) (orbit : Fin 231) :
    mixture vectors axis orbit = RootFineCachedRootExpression.mixture parent4 axis orbit := by
  have originalAxis : RootFinePoolVectors.axis (mixtureRow axis) = axis := by
    apply Fin.ext
    change 18*axis.val/18 = axis.val
    omega
  have originalPosition : (mixtureRow axis).val%18 = 0 := by
    change (18*axis.val)%18 = 0
    omega
  rw [mixture, vectorEq, RootFinePoolVectors.numerator,
    if_pos originalPosition, originalAxis, RootFineIntegerPools.mixture_value]

/-- Every cached coordinate pool retains the complete original rational pool with its original sector label. -/
theorem coordinatePool_value (axis : Fin 2) (coordinate : Fin 17) (orbit : Fin 231) :
    coordinatePool vectors axis coordinate orbit = RootFineExecutablePools.pool parent4 axis
      (finSumFinEquiv (Sum.inr coordinate)) orbit := by
  have originalAxis : RootFinePoolVectors.axis (poolRow axis coordinate) = axis := by
    apply Fin.ext
    change (18*axis.val+coordinate.val+1)/18 = axis.val
    have := coordinate.isLt
    omega
  have originalSector : RootFinePoolVectors.sector (poolRow axis coordinate) =
      finSumFinEquiv (Sum.inr coordinate) := by
    apply Fin.ext
    change 153+(18*axis.val+coordinate.val+1)%18-1 = 153+coordinate.val
    have := coordinate.isLt
    omega
  have originalPosition : (poolRow axis coordinate).val%18 ≠ 0 := by
    change (18*axis.val+coordinate.val+1)%18 ≠ 0
    have := coordinate.isLt
    omega
  rw [coordinatePool, vectorEq, RootFinePoolVectors.numerator,
    if_neg originalPosition, originalAxis, originalSector, RootFineIntegerPools.pool_value]

/-- Complete singleton sectors keep their original weighted child entropies; coordinate pools use checked integers. -/
def sectorExpression (axis : Fin 2) (sector : Fin 170) : RationalLogExpression :=
  match (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | Sum.inl selected => if RootFineExecutablePools.isolated axis selected then
      scaleLogExpression (SuppliedRootCoarse.mass selected)
        (orbitEntropyExpression (RootFineCachedRootExpression.mass parent4 axis selected)
          OrbitLevel4.sizes)
    else []
  | Sum.inr coordinate => orbitMassEntropyExpression (coordinatePool vectors axis coordinate) OrbitLevel4.sizes

/-- Cached pool vectors preserve every complete original certificate-style sector expression. -/
theorem sectorExpression_eq (axis : Fin 2) (sector : Fin 170) :
    sectorExpression parent4 vectors axis sector =
      RootFineCertificateExpressions.sectorExpression parent4 axis sector := by
  unfold sectorExpression RootFineCertificateExpressions.sectorExpression
  cases sectorCase : (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected => rfl
  | inr coordinate =>
    have originalSector : finSumFinEquiv (Sum.inr coordinate) = sector := by
      rw [← sectorCase, Equiv.apply_symm_apply]
    have pools : coordinatePool vectors axis coordinate =
        RootFineExecutablePools.pool parent4 axis sector := by
      funext orbit
      rw [coordinatePool_value parent4 vectors vectorEq, originalSector]
    simp only [pools]

/-- Both exact original root fine expressions, using independently checked complete integer mixtures and pools. -/
def expression (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (mixture vectors axis) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (sectorExpression parent4 vectors axis))

/-- Every cached expression agrees term for term with the complete source expression in certificate convention. -/
theorem expression_eq (axis : Fin 2) :
    expression parent4 vectors axis = RootFineCertificateExpressions.expression parent4 axis := by
  have mixtures := funext (mixture_value parent4 vectors vectorEq axis)
  have sectors := funext (sectorExpression_eq parent4 vectors vectorEq axis)
  simp only [expression, RootFineCertificateExpressions.expression, mixtures, sectors]

/-- Each complete cached expression equals the actual supplied root fine retention rate. -/
theorem expression_value
    (parentEq : ∀ parent selected orbit, parent4 parent selected orbit =
      SuppliedRootFineParent4Integers.numerator parent selected orbit) (axis : Fin 2) :
    rationalLogValue (expression parent4 vectors axis) = rationalLogValue (SuppliedRootFine.expression axis) := by
  rw [expression_eq parent4 vectors vectorEq]
  exact RootFineCertificateExpressions.expression_value parent4 parentEq axis

end
end MatrixBounds.Numeric.RootFineCachedPoolExpressions
