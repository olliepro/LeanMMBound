module

public import SuppliedRootFineExpression

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The two complete executable root expressions are the actual fine-axis
retentions of the supplied physical root tensor extraction. -/
namespace MatrixBounds.Numeric.SuppliedRootFine

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- The original complete root mixture is precisely its finite-column orbit calculation. -/
theorem mixture_eq (axis : Fin 2) (orbit : Fin 231) :
    rootOrbitMass (length := 8) CertifiedRoot.numerator 17592186044416 (fun _ => True)
      (SuppliedRootStage.mass (physicalAxis axis)) orbit = mixture axis orbit := by
  unfold rootOrbitMass
  rw [← SuppliedRootCoarse.enumeration.sum_comp]
  simp only [↓reduceIte, Nat.cast_ofNat, SuppliedRootCoarse.mass_enumeration,
    mass_enumeration, mixture]

/-- The complete actual compatibility pool equals its finite original-column calculation. -/
theorem pool_eq (axis : Fin 2) (sector : Fin 170) (orbit : Fin 231) :
    rootOrbitMass (length := 8) CertifiedRoot.numerator 17592186044416
      (fun child => actualClass axis child = sectorEnumeration sector)
      (SuppliedRootStage.mass (physicalAxis axis)) orbit = pool axis sector orbit := by
  unfold rootOrbitMass
  rw [← SuppliedRootCoarse.enumeration.sum_comp]
  unfold pool
  apply Finset.sum_congr rfl
  intro column _
  have selected : actualClass axis (SuppliedRootCoarse.enumeration column) = sectorEnumeration sector ↔
      classLabel axis column = finSumFinEquiv.symm sector := by
    rw [class_enumeration, sectorEnumeration.injective.eq_iff]
    exact finSumFinEquiv.apply_eq_iff_eq_symm_apply
  by_cases same : classLabel axis column = finSumFinEquiv.symm sector
  · simp only [if_pos same, if_pos (selected.mpr same), Nat.cast_ofNat,
      SuppliedRootCoarse.mass_enumeration, mass_enumeration]
  · simp only [if_neg same, if_neg (fun h => same (selected.mp h))]

/-- Exact executable source expression agrees with the full actual root fine-retention expansion. -/
theorem expression_eq (axis : Fin 2) :
    rootFineRetentionExpression CertifiedRoot.numerator 17592186044416 OrbitLevel4.orbits
      (SuppliedRootStage.mass (physicalAxis axis)) (actualClass axis) sectorEnumeration = expression axis := by
  unfold rootFineRetentionExpression
  have sizes := funext OrbitLevel4.sizes_correct
  have mixtureIdentity := funext (mixture_eq axis)
  have pools (sector : Fin 170) := funext (pool_eq axis sector)
  simp only [mixtureIdentity, pools, sizes, expression]

/-- Both complete executable expressions are actual physical root fine extraction rates. -/
theorem expression_value (axis : Fin 2) : rationalLogValue (expression axis) =
    RootRestrictionData.rationalFineRetention (length := 8) CertifiedRoot.numerator 17592186044416
      (actualClass axis) (SuppliedRootStage.law (physicalAxis axis)) := by
  rw [← expression_eq]
  have identity := rootFineRetentionExpression_value CertifiedRoot.numerator 17592186044416
    OrbitLevel4.orbits (SuppliedRootStage.mass (physicalAxis axis)) (actualClass axis) sectorEnumeration
  simp_rw [← SuppliedRootStage.law_decode] at identity
  exact identity

end
end MatrixBounds.Numeric.SuppliedRootFine
