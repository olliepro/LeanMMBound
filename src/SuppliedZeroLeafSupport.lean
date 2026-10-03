module

public import SuppliedZeroRegistrySemantics
public import SuppliedZeroLeafTargets
public import CertifiedZeroOrbitExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! All 68040 original leaf-zero positions inherit their complete fine support
from the deduplicated row registry, with the actual original coarse targets. -/
namespace MatrixBounds.Numeric.SuppliedZeroLeafSupport

open Tensor Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- The exact original leaf row together with its first-positive-axis coarse target. -/
def entry (node : Fin 945) (child : Fin 12) (strategy : Fin 6) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero2 node child strategy).row, SuppliedZeroLeafTargets.target child⟩

/-- Every original level-two zero-leaf position passes its complete normalization, width, and support check. -/
theorem checked (node : Fin 945) (child : Fin 12) (strategy : Fin 6) :
    (entry node child strategy).check 6 17592186044416 OrbitLevel2.totalAt = true := by
  let index := ParameterIndexData.DyadicLeafzero.table.get (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy)
  have code : (SuppliedZeroRegistry.table.get index).val = SuppliedZeroLeafTargets.target child+1 :=
    SuppliedZeroLeafTargets.code_correct node child strategy
  have width : (IndexedCertificateRows.dyadic index).val.width = 6 :=
    (SuppliedTypedParameters.zero2 node child strategy).width_eq
  have support := SuppliedZeroRegistry.support2 index width (by rw [code]; omega)
  rw [code, Nat.add_sub_cancel] at support
  have sourceSupport : (SuppliedTypedParameters.zero2 node child strategy).row.supportCheck
      OrbitLevel2.totalAt (SuppliedZeroLeafTargets.target child) = true := support
  simp only [entry, ZeroOrbitRow.check, (SuppliedTypedParameters.zero2 node child strategy).accepted,
    (SuppliedTypedParameters.zero2 node child strategy).width_eq, decide_true, Bool.true_and, sourceSupport]

/-- Every actual leaf-zero numerator vanishes away from its original coarse total. -/
theorem supported (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (orbit : Fin 6)
    (outside : OrbitLevel2.total orbit ≠ SuppliedZeroLeafTargets.target child) :
    (entry node child strategy).row.orbitNumerator orbit = 0 :=
  ((entry node child strategy).check_sound OrbitLevel2.totalAt OrbitLevel2.total OrbitLevel2.totalAt_correct
    (checked node child strategy)).2 orbit outside

end
end MatrixBounds.Numeric.SuppliedZeroLeafSupport
