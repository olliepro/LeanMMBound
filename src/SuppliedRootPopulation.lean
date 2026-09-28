import SuppliedScaledRoot
import SuppliedShapeInterfaceBindings

/-! Exact source-coordinate root populations, including all positive and
zero-coordinate children, at the fixed common pipeline scale. -/
namespace MatrixBounds.Numeric.SuppliedRootPopulation

open Tensor Tensor.CW Empirical SuppliedPopulationWeights DyadicPopulationArithmetic
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- Original complete root mass numerator before the physical Y/Z exchange. -/
def numerator (child : ShapeAlphabet 16) : ℕ :=
  SuppliedTypedParameters.rootDistribution.numerator ((shapeColumnEquiv 16).symm child)

/-- Original complete child population coefficient at the fixed root scale. -/
def weight (child : ShapeAlphabet 16) : ℕ := scaled 7 (numerator child)

/-- Original child expressed in the root extraction's physical coordinate order. -/
def physicalChild : ShapeAlphabet 16 ≃ ShapeAlphabet 16 := shapeAlphabetPermutation SuppliedRootStage.axes 16

/-- The extraction numerators are exactly the supplied root distribution in its declared physical order. -/
theorem numerator_physical (child : ShapeAlphabet 16) : CertifiedRoot.numerator (physicalChild child) = numerator child := by
  simp only [CertifiedRoot.numerator, Function.comp_apply, physicalChild, SuppliedRootStage.axes, Equiv.symm_apply_apply]
  exact congrArg (fun row : DyadicRow => row.atColumn ((shapeColumnEquiv 16).symm child).val)
    SuppliedParameters.rootAlpha_eq.symm

/-- Every complete actual root output population has its original integer coefficient times the common scale. -/
theorem population (child : ShapeAlphabet 16) (size : ℕ) :
    (CertifiedRoot.data (rootWeight*size)).split (physicalChild child) = weight child*size := by
  change ((rootWeight*size)/17592186044416)*CertifiedRoot.numerator (physicalChild child) = _
  rw [numerator_physical]
  have divided : (rootWeight*size)/17592186044416 = denominator^7*size := by
    change (denominator^8*size)/denominator = denominator^7*size
    rw [show denominator^8*size = denominator*(denominator^7*size) by ring]
    exact Nat.mul_div_right _ (by decide)
  rw [divided]
  unfold weight scaled
  ring

/-- Positive original root columns carry exactly the incoming weights of the next supplied level-four parents. -/
theorem positive_weight (parent : Fin 105) :
    weight (shapeColumnEquiv 16 (rootColumn parent)) = parent4Weight parent := by
  simp only [weight, numerator, Equiv.symm_apply_apply, parent4Weight, rootNumerator]

/-- Each actual physical root child carries the original complete fine laws on the correct physical axes. -/
theorem physical_law (child : ShapeAlphabet 16) (axis : Fin 3) :
    SuppliedRootStage.law axis (physicalChild child) = SuppliedHigherLaws.root4 child (SuppliedRootStage.axes axis) := by
  simp only [SuppliedRootStage.law, physicalChild, Equiv.symm_apply_apply]

end
end MatrixBounds.Numeric.SuppliedRootPopulation
