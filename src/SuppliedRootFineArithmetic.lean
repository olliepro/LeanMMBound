import SuppliedRootStage

/-! Executable rational hierarchy arithmetic replaces actual orbit fiber
cardinalities by their independently checked finite size tables. -/
namespace MatrixBounds.Numeric.SuppliedRootFineArithmetic

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section

/-- Exact parent arithmetic skips only source children whose original numerator is zero. -/
def sparseParent {I C P : Type*} [Fintype I] (numerator : I → ℕ) (denominator : ℕ)
    (complement : I → I) (childSize : C → ℕ) (parentSize : P → ℕ)
    (columns : P → C × C) (mass : I → C → ℚ) (orbit : P) : ℚ :=
  parentSize orbit*∑ child, if numerator child = 0 then 0 else
    ((numerator child : ℚ)/denominator)*
      ((mass child (columns orbit).1/childSize (columns orbit).1)*
        (mass (complement child) (columns orbit).2/childSize (columns orbit).2))

/-- Skipping zero-weight terms preserves the original complete rational parent formula. -/
theorem sparseParent_eq {I C P : Type*} [Fintype I] (numerator : I → ℕ) (denominator : ℕ)
    (complement : I → I) (childSize : C → ℕ) (parentSize : P → ℕ)
    (columns : P → C × C) (mass : I → C → ℚ) (orbit : P) :
    sparseParent numerator denominator complement childSize parentSize columns mass orbit =
      OrbitArithmetic.parentMass (fun child => (numerator child : ℚ)/denominator)
        complement childSize parentSize columns mass orbit := by
  unfold sparseParent OrbitArithmetic.parentMass
  congr 1
  apply Finset.sum_congr rfl
  intro child _
  split_ifs with zero
  · simp only [zero, Nat.cast_zero, zero_div, zero_mul]
  · rfl

/-- Complete four-letter parent masses with verified orbit sizes and original supplied children. -/
def parent3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) : Fin 21 → ℚ :=
  let split := SuppliedTypedParameters.level3Split node strategy
  sparseParent split.numerator 17592186044416
    (complementEquiv split.parent 4 split.balanced) OrbitLevel2.sizes OrbitLevel3.sizes
    OrbitLevel3.encoding.columns (fun child => SuppliedLeafLaws.mass node strategy child axis)

/-- The executable four-letter calculation equals the actual complete supplied parent masses. -/
theorem parent3_eq (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    parent3 node strategy axis = SuppliedLeafOrbitMass.parent3 node strategy axis := by
  funext orbit
  have parentSize (index : Fin 21) :
      (OrbitLevel3.encoding.wordOrbits OrbitLevel2.orbits).size index = OrbitLevel3.sizes index :=
    OrbitLevel3.sizes_correct index
  simp only [parent3, sparseParent_eq, SuppliedLeafOrbitMass.parent3, splitParentMass,
    OrbitArithmetic.parentMass, OrbitLevel2.sizes_correct, parentSize]

/-- Original six-strategy mixture of the executable four-letter parents. -/
def mixed3 (node : Fin 945) (axis : Fin 3) : Fin 21 → ℚ :=
  OrbitArithmetic.mixture (SuppliedTypedParameters.strategies node).rational
    (fun strategy => parent3 node strategy axis)

/-- The executable strategy mixture is the actual original rational source mixture. -/
theorem mixed3_eq (node : Fin 945) (axis : Fin 3) :
    mixed3 node axis = SuppliedLeafOrbitMass.mixed3 node axis := by
  simp only [mixed3, SuppliedLeafOrbitMass.mixed3, parent3_eq]

/-- Exact source child lookup, with executable parent mixtures for positive children. -/
def child3 (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) : Fin 21 → ℚ :=
  match SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => fun _ => 0
  | some (Sum.inl node) => mixed3 node axis
  | some (Sum.inr node) => SuppliedHigherOrbitMass.zero3 node child.val axis

/-- All supported, zero-coordinate, and absent original child positions retain their exact masses. -/
theorem child3_eq (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) :
    child3 parent child axis = SuppliedHigherOrbitMass.child3 parent child axis := by
  simp only [child3, SuppliedHigherOrbitMass.child3, mixed3_eq]
  rfl

/-- Complete eight-letter parent masses with the exact verified recursive orbit sizes. -/
def parent4 (parent : Fin 105) (axis : Fin 3) : Fin 231 → ℚ :=
  let split := SuppliedTypedParameters.level4Split parent
  sparseParent split.numerator 17592186044416
    (complementEquiv split.parent 8 split.balanced) OrbitLevel3.sizes OrbitLevel4.sizes
    OrbitLevel4.encoding.columns (fun child => child3 parent child axis)

/-- The executable eight-letter parent is exactly the actual original complete source law. -/
theorem parent4_eq (parent : Fin 105) (axis : Fin 3) :
    parent4 parent axis = SuppliedHigherOrbitMass.parent4 parent axis := by
  funext orbit
  have parentSize (index : Fin 231) :
      (OrbitLevel4.encoding.wordOrbits OrbitLevel3.orbits).size index = OrbitLevel4.sizes index :=
    OrbitLevel4.sizes_correct index
  simp only [parent4, sparseParent_eq, SuppliedHigherOrbitMass.parent4, splitParentMass,
    OrbitArithmetic.parentMass, child3_eq, OrbitLevel3.sizes_correct, parentSize]

/-- Complete original root-child masses, including every supplied zero-coordinate child. -/
def root4 (child : ShapeAlphabet 16) (axis : Fin 3) : Fin 231 → ℚ :=
  match SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | Sum.inl zero => SuppliedHigherOrbitMass.zero4 zero child.val axis
  | Sum.inr positive => parent4 positive axis

/-- The executable root-child arithmetic is exactly the actual supplied rational full-law hierarchy. -/
theorem root4_eq (child : ShapeAlphabet 16) (axis : Fin 3) :
    root4 child axis = SuppliedHigherOrbitMass.root4 child axis := by
  simp only [root4, SuppliedHigherOrbitMass.root4, parent4_eq]
  rfl

end
end MatrixBounds.Numeric.SuppliedRootFineArithmetic
