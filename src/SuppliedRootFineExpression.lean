module

public import SuppliedRootFineArithmetic
public import SuppliedRootCoarseBinding
public import RootLogExpressions
public import Mathlib.Logic.Equiv.Fin.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete finite-column expressions for the actual two root fine rates,
including all individually forced and pooled compatibility classes. -/
namespace MatrixBounds.Numeric.SuppliedRootFine

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- The two fine rates use physical axes Y and Z. -/
def physicalAxis (axis : Fin 2) : Fin 3 := axis.succ

/-- Exact complete root masses at their original columns and actual physical axes. -/
def mass (axis : Fin 2) (column : Fin 153) : Fin 231 → ℚ :=
  SuppliedRootFineArithmetic.root4 (shapeColumnEquiv 16 column)
    (SuppliedRootStage.axes (physicalAxis axis))

/-- Executable source-column compatibility labels retain forced children individually. -/
def classLabel (axis : Fin 2) (column : Fin 153) : Fin 153 ⊕ Fin 17 :=
  if axis = 0 then
    if SuppliedRootCoarse.coordinate column 2 = 0 then Sum.inl column
    else Sum.inr (SuppliedRootCoarse.coordinate column 1)
  else if SuppliedRootCoarse.coordinate column 0 = 0 ∨ SuppliedRootCoarse.coordinate column 1 = 0 then
    Sum.inl column
  else Sum.inr (SuppliedRootCoarse.coordinate column 2)

/-- All original singleton and coordinate-pool labels form a complete 170-sector enumeration. -/
def sectorEnumeration : Fin 170 ≃ CompatibilityClass 16 :=
  finSumFinEquiv.symm.trans (Equiv.sumCongr SuppliedRootCoarse.enumeration (Equiv.refl (Fin 17)))

/-- The exact actual asymmetric compatibility class used by either fine extraction axis. -/
def actualClass (axis : Fin 2) : ShapeAlphabet 16 → CompatibilityClass 16 :=
  if axis = 0 then yClass else zClass

/-- Complete fine-orbit mass of the unpartitioned root mixture. -/
def mixture (axis : Fin 2) (orbit : Fin 231) : ℚ :=
  ∑ column : Fin 153, SuppliedRootCoarse.mass column*mass axis column orbit

/-- Complete fine-orbit mass of one labelled compatibility pool. -/
def pool (axis : Fin 2) (sector : Fin 170) (orbit : Fin 231) : ℚ :=
  ∑ column : Fin 153, if classLabel axis column = finSumFinEquiv.symm sector then
    SuppliedRootCoarse.mass column*mass axis column orbit else 0

/-- Exact root fine entropy minus every complete compatibility-pool entropy. -/
def expression (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (mixture axis) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (pool axis sector) OrbitLevel4.sizes))

/-- Executable hierarchy masses equal the actual root-child law masses at every original column. -/
theorem mass_enumeration (axis : Fin 2) (column : Fin 153) :
    SuppliedRootStage.mass (physicalAxis axis) (SuppliedRootCoarse.enumeration column) = mass axis column := by
  rw [mass, SuppliedRootFineArithmetic.root4_eq]
  change SuppliedHigherOrbitMass.root4
    ((shapeAlphabetPermutation SuppliedRootStage.axes 16).symm
      (shapeAlphabetPermutation SuppliedRootStage.axes 16 (shapeColumnEquiv 16 column))) _ = _
  rw [Equiv.symm_apply_apply]

/-- The computable singleton/pool label is exactly the physical extraction's compatibility class. -/
theorem class_enumeration (axis : Fin 2) (column : Fin 153) :
    actualClass axis (SuppliedRootCoarse.enumeration column) =
      sectorEnumeration (finSumFinEquiv (classLabel axis column)) := by
  simp only [sectorEnumeration, Equiv.trans_apply, Equiv.symm_apply_apply,
    Equiv.sumCongr_apply]
  have coordinates (selected : Fin 3) := SuppliedRootCoarse.coordinate_enumeration column selected
  by_cases first : axis = 0
  · simp only [actualClass, classLabel, if_pos first]
    unfold yClass
    have z : (SuppliedRootCoarse.enumeration column).val.z = 0 ↔
        SuppliedRootCoarse.coordinate column 2 = 0 := by
      rw [← coordinates 2]
      change _ ↔ (⟨(SuppliedRootCoarse.enumeration column).val.z, _⟩ : Fin 17) = 0
      simp only [Fin.ext_iff, Fin.val_zero]
    by_cases zero : (SuppliedRootCoarse.enumeration column).val.z = 0
    · simp only [if_pos zero, if_pos (z.mp zero), Sum.map_inl]
    · simp only [if_neg zero, if_neg (fun h => zero (z.mpr h)), Sum.map_inr]
      exact congrArg Sum.inr (coordinates 1)
  · simp only [actualClass, classLabel, if_neg first]
    unfold zClass
    have x : (SuppliedRootCoarse.enumeration column).val.x = 0 ↔
        SuppliedRootCoarse.coordinate column 0 = 0 := by
      rw [← coordinates 0]
      change _ ↔ (⟨(SuppliedRootCoarse.enumeration column).val.x, _⟩ : Fin 17) = 0
      simp only [Fin.ext_iff, Fin.val_zero]
    have y : (SuppliedRootCoarse.enumeration column).val.y = 0 ↔
        SuppliedRootCoarse.coordinate column 1 = 0 := by
      rw [← coordinates 1]
      change _ ↔ (⟨(SuppliedRootCoarse.enumeration column).val.y, _⟩ : Fin 17) = 0
      simp only [Fin.ext_iff, Fin.val_zero]
    have equivalent : ((SuppliedRootCoarse.enumeration column).val.x = 0 ∨
      (SuppliedRootCoarse.enumeration column).val.y = 0) ↔
      (SuppliedRootCoarse.coordinate column 0 = 0 ∨ SuppliedRootCoarse.coordinate column 1 = 0) := or_congr x y
    by_cases zero : (SuppliedRootCoarse.enumeration column).val.x = 0 ∨
        (SuppliedRootCoarse.enumeration column).val.y = 0
    · simp only [if_pos zero, if_pos (equivalent.mp zero), Sum.map_inl]
    · simp only [if_neg zero, if_neg (fun h => zero (equivalent.mpr h)), Sum.map_inr]
      exact congrArg Sum.inr (coordinates 2)

end
end MatrixBounds.Numeric.SuppliedRootFine
