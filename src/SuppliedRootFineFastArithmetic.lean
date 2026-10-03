module

public import SuppliedRootFineArithmetic
public import SuppliedRootFineTerminalLookup

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The executable hierarchy uses balanced original terminal lookups.
Every optimized function is proved equal to the actual supplied rational law. -/
namespace MatrixBounds.Numeric.SuppliedRootFineFastArithmetic

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section

/-- Original terminal orbit masses, using the proved exact fast parameter access. -/
def terminalMass (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) : Fin 6 → ℚ :=
  if SuppliedTerminalLaws.childAxes child axis = 2 then
    SuppliedTerminalLaws.ternaryMass (SuppliedRootFineTerminalLookup.mu node child strategy)
  else SuppliedTerminalLaws.binaryMass

/-- Fast terminal access leaves the actual complete physical orbit law unchanged. -/
theorem terminalMass_eq (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) :
    terminalMass node child strategy axis = SuppliedTerminalLaws.mass node child strategy axis := by
  simp only [terminalMass, SuppliedRootFineTerminalLookup.mu_eq, SuppliedTerminalLaws.mass]

/-- Complete two-letter child masses with original zero leaves and fast terminal input access. -/
def leafMass (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) : Fin 6 → ℚ :=
  match SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm child) with
  | Sum.inl zero => SuppliedLeafLaws.zeroMass node zero strategy child.val axis
  | Sum.inr positive => terminalMass node positive strategy axis

/-- The executable child masses equal every actual original complete two-letter source law. -/
theorem leafMass_eq (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) :
    leafMass node strategy child axis = SuppliedLeafLaws.mass node strategy child axis := by
  simp only [leafMass, SuppliedLeafLaws.mass, terminalMass_eq]
  rfl

/-- Four-letter parent arithmetic uses the original split and all complete child masses. -/
def parent3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) : Fin 21 → ℚ :=
  let split := SuppliedTypedParameters.level3Split node strategy
  SuppliedRootFineArithmetic.sparseParent split.numerator 17592186044416
    (complementEquiv split.parent 4 split.balanced) OrbitLevel2.sizes OrbitLevel3.sizes
    OrbitLevel3.encoding.columns (fun child => leafMass node strategy child axis)

/-- The fast four-letter parent equals the original proved executable rational parent. -/
theorem parent3_eq (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    parent3 node strategy axis = SuppliedRootFineArithmetic.parent3 node strategy axis := by
  simp only [parent3, SuppliedRootFineArithmetic.parent3, leafMass_eq]

/-- Original exact strategy mixture evaluated with the fast terminal access. -/
def mixed3 (node : Fin 945) (axis : Fin 3) : Fin 21 → ℚ :=
  OrbitArithmetic.mixture (SuppliedTypedParameters.strategies node).rational
    (fun strategy => parent3 node strategy axis)

/-- Every original strategy remains represented with its exact source coefficient. -/
theorem mixed3_eq (node : Fin 945) (axis : Fin 3) :
    mixed3 node axis = SuppliedRootFineArithmetic.mixed3 node axis := by
  simp only [mixed3, SuppliedRootFineArithmetic.mixed3, parent3_eq]

/-- Original higher child lookup with the fast complete positive parent mixture. -/
def child3 (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) : Fin 21 → ℚ :=
  match SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => fun _ => 0
  | some (Sum.inl node) => mixed3 node axis
  | some (Sum.inr node) => SuppliedHigherOrbitMass.zero3 node child.val axis

/-- Complete higher child lookup still represents the exact original source masses. -/
theorem child3_eq (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) :
    child3 parent child axis = SuppliedRootFineArithmetic.child3 parent child axis := by
  simp only [child3, SuppliedRootFineArithmetic.child3, mixed3_eq]
  rfl

/-- Original eight-letter parents evaluated through the fast exact lower hierarchy. -/
def parent4 (parent : Fin 105) (axis : Fin 3) : Fin 231 → ℚ :=
  let split := SuppliedTypedParameters.level4Split parent
  SuppliedRootFineArithmetic.sparseParent split.numerator 17592186044416
    (complementEquiv split.parent 8 split.balanced) OrbitLevel3.sizes OrbitLevel4.sizes
    OrbitLevel4.encoding.columns (fun child => child3 parent child axis)

/-- Fast eight-letter parent arithmetic equals the original exact supplied law. -/
theorem parent4_eq (parent : Fin 105) (axis : Fin 3) :
    parent4 parent axis = SuppliedRootFineArithmetic.parent4 parent axis := by
  simp only [parent4, SuppliedRootFineArithmetic.parent4, child3_eq]

/-- Complete root children evaluated with the proved fast hierarchy. -/
def root4 (child : ShapeAlphabet 16) (axis : Fin 3) : Fin 231 → ℚ :=
  match SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | Sum.inl zero => SuppliedHigherOrbitMass.zero4 zero child.val axis
  | Sum.inr positive => parent4 positive axis

/-- Every fast complete root-child mass equals the actual supplied rational hierarchy. -/
theorem root4_eq (child : ShapeAlphabet 16) (axis : Fin 3) :
    root4 child axis = SuppliedRootFineArithmetic.root4 child axis := by
  simp only [root4, SuppliedRootFineArithmetic.root4, parent4_eq]
  rfl

end
end MatrixBounds.Numeric.SuppliedRootFineFastArithmetic
