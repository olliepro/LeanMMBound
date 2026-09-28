import RootFineSingletonPools

/-! The original170 root sectors are evaluated with153 direct singleton entries and17 complete coordinate sums. -/
namespace MatrixBounds.Numeric.RootFineExecutablePools

open scoped BigOperators
noncomputable section

/-- The exact original physical compatibility policy deciding individually retained children. -/
def isolated (axis : Fin 2) (column : Fin 153) : Bool :=
  if axis = 0 then decide (SuppliedRootCoarse.coordinate column 2 = 0)
  else decide (SuppliedRootCoarse.coordinate column 0 = 0 ∨ SuppliedRootCoarse.coordinate column 1 = 0)

/-- The corresponding original physical coordinate for every pooled child. -/
def coordinate (axis : Fin 2) (column : Fin 153) : Fin 17 :=
  if axis = 0 then SuppliedRootCoarse.coordinate column 1 else SuppliedRootCoarse.coordinate column 2

/-- The executable isolated/pooled split is precisely the original complete compatibility labelling. -/
theorem label_eq (axis : Fin 2) (column : Fin 153) :
    SuppliedRootFine.classLabel axis column = singletonPoolLabel (isolated axis) (coordinate axis) column := by
  unfold SuppliedRootFine.classLabel singletonPoolLabel isolated coordinate
  split_ifs <;> simp_all

/-- Evaluate every original labelled pool, reading singleton children directly. -/
def pool (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (sector : Fin 170) (orbit : Fin 231) : ℚ :=
  match finSumFinEquiv.symm sector with
  | Sum.inl selected => if isolated axis selected then
      SuppliedRootCoarse.mass selected*RootFineCachedRootExpression.mass parent4 axis selected orbit else 0
  | Sum.inr selected => ∑ column : Fin 153, if isolated axis column then 0 else
      if coordinate axis column = selected then
        SuppliedRootCoarse.mass column*RootFineCachedRootExpression.mass parent4 axis column orbit else 0

/-- Direct singleton evaluation leaves every complete original root pool unchanged. -/
theorem pool_eq (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (sector : Fin 170) (orbit : Fin 231) :
    pool parent4 axis sector orbit = RootFineCachedRootExpression.pool parent4 axis sector orbit := by
  unfold pool RootFineCachedRootExpression.pool
  simp_rw [label_eq]
  cases sectorCase : (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected =>
    exact (singletonPool_value (isolated axis) (coordinate axis)
      (fun column => SuppliedRootCoarse.mass column*RootFineCachedRootExpression.mass parent4 axis column orbit) selected).symm
  | inr selected =>
    exact (coordinatePool_value (isolated axis) (coordinate axis)
      (fun column => SuppliedRootCoarse.mass column*RootFineCachedRootExpression.mass parent4 axis column orbit) selected).symm

/-- The complete original fine retention expression with direct singleton pool evaluation. -/
def expression (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (RootFineCachedRootExpression.mixture parent4 axis) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (pool parent4 axis sector) OrbitLevel4.sizes))

/-- Optimized labelled pools preserve the full original expression term for term. -/
theorem expression_eq (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2) :
    expression parent4 axis = RootFineCachedRootExpression.expression parent4 axis := by
  have pools : pool parent4 axis = RootFineCachedRootExpression.pool parent4 axis :=
    funext (fun sector => funext (pool_eq parent4 axis sector))
  simp only [expression, RootFineCachedRootExpression.expression, pools]

end
end MatrixBounds.Numeric.RootFineExecutablePools
