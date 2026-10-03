module

public import SuppliedAllocationWindows
public import SuppliedChildEquivalences
public import SuppliedShapeInterfaceBindings
public import SuppliedTerminalPhysicalSplit
public import CWRationalCanonicalInterfaces
public import SuppliedStagePresentations
public import ZeroParentRestoration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact complete-window bindings at the level-three to terminal interface. -/
namespace MatrixBounds.Numeric.SuppliedLevel3Transition

universe v
open Tensor Tensor.CW Interface Empirical SuppliedPopulationPaths SuppliedPopulationWeights
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- The original terminal record belonging to a positive child of one full-history parent. -/
def terminalSource (label : Label3) (child : Fin 3) : SuppliedTerminalScaling.Source :=
  ⟨label.source.1, child, label.source.2⟩

/-- Exact original coefficient of a complete child window, retaining the entire preceding history. -/
def childWeight (label : Label3) (child : ShapeAlphabet 4) : ℕ :=
  (SuppliedTypedParameters.level3Split label.source.1 label.source.2).childWeight (weight3 label) child

/-- Complete original child window at the exact inherited population. -/
def childWindow (label : Label3) (child : ShapeAlphabet 4) (size : ℕ) (tolerance : ℝ) :=
  SuppliedAllocationWindows.window (K := K) 2 child.val (childWeight label child*size)
    (fun axis => SuppliedLeafLaws.law label.source.1 label.source.2 child axis) tolerance

/-- Empty original parents have no nonempty children. -/
theorem childWeight_zero (label : Label3) (empty : weight3 label = 0) (child : ShapeAlphabet 4) :
    childWeight label child = 0 := by
  simp only [childWeight, RationalSplit.childWeight, empty, Nat.zero_div, zero_mul, mul_zero]

/-- The finite positive child classifier inverts the exact original terminal column. -/
theorem terminalChild_inverse (child : Fin 3) :
    SuppliedChildKinds.child2Equiv.symm (.inr child) = terminalChild child := by
  apply SuppliedChildKinds.child2Equiv.injective
  rw [Equiv.apply_symm_apply]
  simpa only [SuppliedChildKinds.child2Equiv, Equiv.trans_apply, Equiv.ofBijective_apply,
    terminalChild, (shapeColumnEquiv 4).symm_apply_apply (terminalColumn child)] using! (SuppliedShapeInterfaceBindings.terminal_kind child).symm

/-- The actual original positive child shape is exactly the terminal rational parent shape. -/
theorem terminalChild_shape (label : Label3) (child : Fin 3) :
    (terminalChild child).val = (SuppliedTerminalRationalSplit.split (terminalSource label child) .xyz).parent := by
  rw [SuppliedShapeInterfaceBindings.terminal_shape]
  change _ = Terminal.parent.permute (SuppliedTerminalScaling.axes (terminalSource label child) .xyz)
  rw [SuppliedTerminalRationalSplit.axes_identity]
  rfl

/-- The actual original complete child law is exactly the terminal rational parent center. -/
theorem terminalChild_law (label : Label3) (child : Fin 3) (axis : Fin 3) :
    SuppliedLeafLaws.law label.source.1 label.source.2 (terminalChild child) axis =
      (SuppliedTerminalRationalSplit.split (terminalSource label child) .xyz).parentLaw
        (SuppliedTerminalRationalSplit.law axis) := by
  rw [SuppliedShapeInterfaceBindings.terminal_law, SuppliedTerminalRationalSplit.parent_law]
  rfl

/-- The actual original positive child population is exactly its full-history terminal coefficient. -/
theorem terminalChild_weight (label : Label3) (child : Fin 3) :
    childWeight label (terminalChild child) =
      terminalParentWeight (terminalSource label child) label.previous label.role := by
  simpa only [childWeight, terminalSource] using
    SuppliedPopulationPaths.terminal_split (terminalSource label child) label.previous label.role

/-- Complete original positive child windows are the terminal parent windows by exact coordinate identities. -/
def terminalChildRestriction (label : Label3) (child : Fin 3) (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (childWindow (K := K) label (terminalChild child) size tolerance)
      (SuppliedAllocationWindows.terminal (K := K) (terminalSource label child)
        (terminalParentWeight (terminalSource label child) label.previous label.role*size) tolerance) := by
  unfold childWindow SuppliedAllocationWindows.terminal SuppliedAllocationWindows.window
  dsimp only
  rw [terminalChild_shape label child, terminalChild_weight label child,
    terminalChild_law label child 0, terminalChild_law label child 1, terminalChild_law label child 2]
  exact CoordinateRestriction.refl _

/-- Restore all empty original parent sectors and their empty children after the actual positive-parent extraction. -/
def restoreChildrenRestriction (size : ℕ) (tolerance : Label3 → ℝ) :
    CoordinateRestriction
      (SuppliedStagePresentations.level3.originalChildren (K := K) size 5 (fun label => tolerance label.val))
      (heterogeneous (fun label : Label3 => heterogeneous (fun child : ShapeAlphabet 4 =>
        childWindow (K := K) label child size (tolerance label)))) := by
  have restored := restoreZeroParentRestriction weight3 childWeight childWeight_zero size
    (fun _ child => constituent (K := K) 5 2 child.val)
    (fun _ _ x => fineWord x.val) (fun _ _ y => fineWord y.val) (fun _ _ z => fineWord z.val)
    (fun label child => SuppliedLeafLaws.law label.source.1 label.source.2 child 0)
    (fun label child => SuppliedLeafLaws.law label.source.1 label.source.2 child 1)
    (fun label child => SuppliedLeafLaws.law label.source.1 label.source.2 child 2)
    (fun label _ => tolerance label)
  have nested := unflattenRestriction (fun label : SuppliedPathStages.Labels3 => fun child : ShapeAlphabet 4 =>
    childWindow (K := K) label.val child size (tolerance label.val))
  exact nested.trans restored

end
end MatrixBounds.Numeric.SuppliedLevel3Transition
