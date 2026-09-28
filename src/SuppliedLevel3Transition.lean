import SuppliedLevel3TransitionBindings
import Level3TransitionRegrouping
import ContextProductReductions
import WeightedPools

/-! A complete actual transition from separately constrained level-three child
windows to waiting zero windows and the next terminal extraction interface. -/
namespace MatrixBounds.Numeric.SuppliedLevel3Transition

universe v
open Tensor Tensor.CW Interface Empirical SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- All twelve complete zero child windows within one preceding source/strategy/role history. -/
def waitingSector (label : Label3) (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun zero : Fin 12 => childWindow (K := K) label
    (SuppliedChildKinds.child2Equiv.symm (.inl zero)) size tolerance)

/-- All complete zero child windows retain every source and preceding role label. -/
def waiting (size : ℕ) (tolerance : Label3 → ℝ) :=
  heterogeneous (fun label => waitingSector (K := K) label size (tolerance label))

/-- Actual terminal parent windows belonging to the three positive children of one history. -/
def terminalSector (label : Label3) (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun child : Fin 3 => SuppliedAllocationWindows.terminal (K := K) (terminalSource label child)
    (terminalParentWeight (terminalSource label child) label.previous label.role*size) tolerance)

/-- Every complete child factor is retained exactly once as a waiting or actual terminal source window. -/
def partitionChildrenRestriction (label : Label3) (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (heterogeneous (fun child : ShapeAlphabet 4 => childWindow (K := K) label child size tolerance))
      (product (waitingSector (K := K) label size tolerance) (terminalSector (K := K) label size tolerance)) := by
  have reindexed := reindexRestriction SuppliedChildKinds.child2Equiv.symm
    (fun child => childWindow (K := K) label child size tolerance)
  have split := level3SumPartitionRestriction (fun index : Fin 12 ⊕ Fin 3 =>
    childWindow (K := K) label (SuppliedChildKinds.child2Equiv.symm index) size tolerance)
  have terminal (child : Fin 3) : CoordinateRestriction
      (childWindow (K := K) label (SuppliedChildKinds.child2Equiv.symm (.inr child)) size tolerance)
      (SuppliedAllocationWindows.terminal (K := K) (terminalSource label child)
        (terminalParentWeight (terminalSource label child) label.previous label.role*size) tolerance) := by
    rw [terminalChild_inverse]
    exact terminalChildRestriction label child size tolerance
  exact (reindexed.trans split).trans
    ((CoordinateRestriction.refl _).product (CoordinateRestriction.heterogeneous terminal))

/-- The terminal role retains the complete original source and both previous roles. -/
def terminalLabel (label : Label3) (child selected : Fin 3) : TerminalLabel :=
  ⟨terminalSource label child, label.previous, label.role, selected⟩

/-- Recover the full level-three predecessor of an actual terminal role label. -/
def terminalPredecessor (label : TerminalLabel) : Label3 :=
  ⟨(label.source.node, label.source.strategy), label.previous4, label.previous3⟩

/-- Nested source/child/selected-role labels enumerate the original terminal history labels exactly. -/
def terminalIndexEquiv : Label3 × Fin 3 × Fin 3 ≃ TerminalLabel where
  toFun index := terminalLabel index.1 index.2.1 index.2.2
  invFun label := (terminalPredecessor label, label.source.child, label.selected)
  left_inv index := by rcases index with ⟨⟨⟨node, strategy⟩, previous, role⟩, child, selected⟩; rfl
  right_inv label := by rcases label with ⟨⟨node, child, strategy⟩, previous4, previous3, selected⟩; rfl

/-- One actual terminal role window uses its inherited fine tolerance and exact integer population. -/
def allocatedTerminal (label : TerminalLabel) (size : ℕ) (tolerance : Label3 → ℝ) :=
  SuppliedAllocationWindows.terminal (K := K) label.source (terminalWeight label*size)
    (tolerance (terminalPredecessor label))

/-- Actual terminal roles are allocated separately inside each original positive child history. -/
theorem allocateTerminalSector (label : Label3) {size : ℕ} (sizePositive : 0 < size)
    (tolerance : Label3 → ℝ) (nonnegative : 0 ≤ tolerance label) :
    ContextReduction.{v} (terminalSector (K := K) label size (tolerance label))
      (heterogeneous (fun child : Fin 3 => heterogeneous (fun selected : Fin 3 =>
        allocatedTerminal (K := K) (terminalLabel label child selected) size tolerance))) 1 := by
  have allocation := ContextReduction.heterogeneous (fun _ : Fin 3 => 1)
    (fun child => SuppliedAllocationWindows.allocate_terminal (K := K)
      (terminalSource label child) label.previous label.role sizePositive nonnegative)
  simpa only [Finset.prod_const_one] using allocation

/-- Reindex the allocated terminal family by its original complete-history labels. -/
def terminalRegroupRestriction (size : ℕ) (tolerance : Label3 → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun label : Label3 => heterogeneous (fun child : Fin 3 => heterogeneous (fun selected : Fin 3 =>
        allocatedTerminal (K := K) (terminalLabel label child selected) size tolerance))))
      (heterogeneous (fun label : TerminalLabel => allocatedTerminal (K := K) label size tolerance)) where
  left entries label child selected := entries (terminalLabel label child selected)
  middle entries label child selected := entries (terminalLabel label child selected)
  right entries label child selected := entries (terminalLabel label child selected)
  coefficient x y z := by
    have identity := Equiv.prod_comp terminalIndexEquiv (fun label =>
      allocatedTerminal (K := K) label size tolerance (x label) (y label) (z label))
    simpa only [heterogeneous, Fintype.prod_prod_type, terminalIndexEquiv, Equiv.coe_fn_mk] using identity

/-- Empty terminal roles can be removed to recover precisely the next actual extraction parent interface. -/
def positiveTerminalRestriction (size : ℕ) (tolerance : Label3 → ℝ) :
    CoordinateRestriction (heterogeneous (fun label : TerminalLabel => allocatedTerminal (K := K) label size tolerance))
      (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
        (fun label => tolerance (terminalPredecessor label.val))) :=
  dropZeroWeightRestriction terminalWeight size
    (fun label => constituent (K := K) 5 2 (SuppliedTerminalRationalSplit.split label.source .xyz).parent)
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (fun label => (SuppliedTerminalRationalSplit.split label.source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 0))
    (fun label => (SuppliedTerminalRationalSplit.split label.source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 1))
    (fun label => (SuppliedTerminalRationalSplit.split label.source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 2))
    (fun label => tolerance (terminalPredecessor label))

/-- The actual canonical level-three output supplies every waiting zero window and the entire next terminal interface at unit cost.
All original source, strategy, child, earlier role, and selected role labels remain separate. -/
theorem transition {size : ℕ} (sizePositive : 0 < size) (tolerance : Label3 → ℝ)
    (nonnegative : ∀ label, 0 ≤ tolerance label) :
    ContextReduction.{v}
      (SuppliedStagePresentations.level3.originalChildren (K := K) size 5 (fun label => tolerance label.val))
      (product (waiting (K := K) size tolerance)
        (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
          (fun label => tolerance (terminalPredecessor label.val)))) 1 := by
  have restored := (restoreChildrenRestriction (K := K) size tolerance).context
  have partitioned := (CoordinateRestriction.heterogeneous (fun label =>
    partitionChildrenRestriction (K := K) label size (tolerance label))).context
  have collected := (level3CollectProductsRestriction
    (fun label => waitingSector (K := K) label size (tolerance label))
    (fun label => terminalSector (K := K) label size (tolerance label))).context
  have allocated := ContextReduction.heterogeneous (fun _ : Label3 => 1)
    (fun label => allocateTerminalSector (K := K) label sizePositive tolerance (nonnegative label))
  have terminal : ContextReduction.{v}
      (heterogeneous (fun label => terminalSector (K := K) label size (tolerance label)))
      (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
        (fun label => tolerance (terminalPredecessor label.val))) 1 := by
    simpa only [Finset.prod_const_one, one_mul] using
      (allocated.trans (terminalRegroupRestriction (K := K) size tolerance).context).trans
        (positiveTerminalRestriction (K := K) size tolerance).context
  simpa only [one_mul] using ((restored.trans partitioned).trans collected).trans
    (terminal.keep_left (waiting (K := K) size tolerance))

/-- Extend a positive-parent tolerance to unused empty parents without changing any actual extracted window. -/
def extendTolerance (tolerance : SuppliedPathStages.Labels3 → ℝ) (label : Label3) : ℝ :=
  if positive : 0 < weight3 label then tolerance ⟨label, positive⟩ else 1

/-- Every actual positive-parent tolerance is unchanged by its extension. -/
theorem extendTolerance_positive (tolerance : SuppliedPathStages.Labels3 → ℝ) (label : SuppliedPathStages.Labels3) :
    extendTolerance tolerance label.val = tolerance label := by
  simp only [extendTolerance, dif_pos label.property]

/-- Extending positive actual extraction tolerances gives positive tolerances on all original histories. -/
theorem extendTolerance_pos (tolerance : SuppliedPathStages.Labels3 → ℝ)
    (positive : ∀ label, 0 < tolerance label) (label : Label3) : 0 < extendTolerance tolerance label := by
  unfold extendTolerance
  split_ifs with supported
  · exact positive ⟨label, supported⟩
  · norm_num

/-- The positive-parent extraction output feeds the entire next terminal interface with no extra hypotheses on empty labels. -/
theorem positive_transition {size : ℕ} (sizePositive : 0 < size)
    (tolerance : SuppliedPathStages.Labels3 → ℝ) (positive : ∀ label, 0 < tolerance label) :
    ContextReduction.{v}
      (SuppliedStagePresentations.level3.originalChildren (K := K) size 5 tolerance)
      (product (waiting (K := K) size (extendTolerance tolerance))
        (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
          (fun label => extendTolerance tolerance (terminalPredecessor label.val)))) 1 := by
  simpa only [extendTolerance_positive] using transition (K := K) sizePositive (extendTolerance tolerance)
    (fun label => (extendTolerance_pos tolerance positive label).le)

/-- The complete sixfold extraction output supplies six waiting families and exactly the next sixfold terminal input.
This can be batched over every retained copy without changing the unit conversion cost. -/
theorem sixfold_positive_transition {size : ℕ} (sizePositive : 0 < size)
    (tolerance : SuppliedPathStages.Labels3 → ℝ) (positive : ∀ label, 0 < tolerance label) :
    ContextReduction.{v}
      (heterogeneous (fun order : AxisOrder => orient order
        (SuppliedStagePresentations.level3.originalChildren (K := K) size 5 tolerance)))
      (product (heterogeneous (fun order : AxisOrder => orient order
          (waiting (K := K) size (extendTolerance tolerance))))
        (heterogeneous (fun order : AxisOrder => orient order
          (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
            (fun label => extendTolerance tolerance (terminalPredecessor label.val)))))) 1 := by
  have lifted := (positive_transition (K := K) sizePositive tolerance positive).sixfold
  have separated := (CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
    level3OrientProductRestriction order (waiting (K := K) size (extendTolerance tolerance))
      (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
        (fun label => extendTolerance tolerance (terminalPredecessor label.val))))).context
  have collected := (level3CollectProductsRestriction
    (fun order : AxisOrder => orient order (waiting (K := K) size (extendTolerance tolerance)))
    (fun order : AxisOrder => orient order (SuppliedStagePresentations.terminal.originalParent (K := K) size 5
      (fun label => extendTolerance tolerance (terminalPredecessor label.val))))).context
  simpa only [one_pow, one_mul] using (lifted.trans separated).trans collected

end
end MatrixBounds.Numeric.SuppliedLevel3Transition
