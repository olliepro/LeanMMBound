import SuppliedWaitingZero2TargetCertificates

/-! Every original level-two zero-leaf reference selects a registry row with
exactly its intended first-positive-axis coarse total. -/
namespace MatrixBounds.Numeric.SuppliedZeroLeafTargets
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- The original complete shape of a supplied level-two zero-child column. -/
def shape (child : Fin 12) : Shape :=
  SuppliedShapeIndices.shapeAt 4 ((SuppliedShapeIndices.childColumns 4 false)[child.val]?.getD 0)

/-- Exact coarse total of the source's first positive physical axis. -/
def target (child : Fin 12) : ℕ :=
  Shape.coordinates (shape child) (SuppliedLeafLaws.positiveAxis (shape child))

/-- Exact support-code match at an original flattened node/child/strategy position. -/
def valid (index : Fin ((945*12)*6)) : Prop :=
  (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicLeafzero.table.get index)).val =
    target index.divNat.modNat+1

/-- All original source leaf references have their actual support target. -/
theorem complete : IndexBlockCertificate valid 0 68040 := by
  refine ⟨by decide +kernel, ?_⟩
  intro index
  exact SuppliedWaitingZero2TargetCertificates.original_valid (blockIndex 0 68040 (by decide +kernel) index)


/-- Every original source leaf position refers to the registry row for its actual coarse target. -/
theorem code_correct (node : Fin 945) (child : Fin 12) (strategy : Fin 6) :
    (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicLeafzero.table.get
      (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy))).val = target child+1 := by
  have checked := complete.complete (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy)
  have first := finProdFinEquiv.symm_apply_apply (SuppliedParameters.flat2 node child, strategy)
  change ((SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy).divNat,
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy).modNat) =
    (SuppliedParameters.flat2 node child, strategy) at first
  have second := finProdFinEquiv.symm_apply_apply (node, child)
  change ((SuppliedParameters.flat2 node child).divNat, (SuppliedParameters.flat2 node child).modNat) = (node, child) at second
  simpa only [valid, (Prod.mk.inj first).1, (Prod.mk.inj second).2] using checked

end MatrixBounds.Numeric.SuppliedZeroLeafTargets
