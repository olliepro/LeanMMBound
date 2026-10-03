module

public import SuppliedWaitingZero2Data
public import SuppliedPhysicalZero2

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete original leaf support certificate proves nonempty exact
matrix indices for every separately labelled zero2 waiting population. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2

open Tensor Tensor.CW Interface Entropy WaitingZeroMatrix
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 2000000
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Every selected original zero2 matrix index set is nonempty, including zero population. -/
theorem indices_positive (label : Label) (size : ℕ) : 0 < Fintype.card (Indices label size) := by
  have normalized := ((entry label).check_sound OrbitLevel2.totalAt OrbitLevel2.total OrbitLevel2.totalAt_correct
    (SuppliedZeroLeafSupport.checked label.1.source.1 label.2 label.1.source.2)).1
  have expandedNormalized := OrbitLevel2.orbits.expanded_normalized (entry label).row.orbitNumerator
    normalized (by decide : 0 < 17592186044416) (by decide : 0 < 2) OrbitLevel2.sizes_divide
  have supported := expanded_fine_support OrbitLevel2.orbits (entry label).row.orbitNumerator
    OrbitLevel2.total OrbitLevel2.total_correct (entry label).total 2
    (SuppliedZeroLeafSupport.supported label.1.source.1 label.2 label.1.source.2)
  exact rational_card_positive (by decide : 0 < 5) _ expandedNormalized (population_divisible label size) supported

end
end MatrixBounds.Numeric.SuppliedWaitingZero2
