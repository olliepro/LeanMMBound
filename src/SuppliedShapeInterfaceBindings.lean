import SuppliedPopulationWeights

/-! Complete child windows have exactly the coarse shapes and complete laws of
the next original source interface; these are source bindings, not assumptions. -/
namespace MatrixBounds.Numeric.SuppliedShapeInterfaceBindings

open Tensor Tensor.CW SuppliedPopulationWeights
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Every positive root source column names its original level-four node. -/
theorem root_kind : ∀ parent : Fin 105,
    SuppliedChildKinds.kind4 (rootColumn parent) = Sum.inr parent := by decide +kernel

/-- Every positive terminal source column names the corresponding original terminal child. -/
theorem terminal_kind : ∀ child : Fin 3,
    SuppliedChildKinds.kind2 (terminalColumn child) = Sum.inr child := by decide +kernel

/-- The original positive root-child coarse shape is exactly its next level-four parent shape. -/
theorem root_shape (parent : Fin 105) :
    (shapeColumnEquiv 16 (rootColumn parent)).val = SuppliedHierarchyParents.parent4 parent := by
  have selected := SuppliedNodeLookup.shapeAt_column 16 (shapeColumnEquiv 16 (rootColumn parent))
  simpa only [Equiv.symm_apply_apply, rootColumn, SuppliedHierarchyParents.parent4] using selected.symm

/-- Every actual source node child has exactly the next level-three parent shape. -/
theorem node_shape (node : Fin 945) : (nodeChild node).val = SuppliedHierarchyParents.parent3 node := by
  have selected := SuppliedNodeLookup.shapeAt_column 8 (nodeChild node)
  simpa only [nodeChild, Equiv.symm_apply_apply, SuppliedHierarchyParents.parent3] using selected.symm

/-- The three terminal child shapes are the actual canonical terminal in their original physical orientation. -/
theorem terminal_shape : ∀ child : Fin 3,
    (terminalChild child).val = Terminal.parent.permute (SuppliedTerminalLaws.childAxes child) := by decide +kernel

/-- The complete root-child law is the complete parent center of the next original level-four extraction. -/
theorem root_law (parent : Fin 105) (axis : Fin 3) :
    SuppliedHigherLaws.root4 (shapeColumnEquiv 16 (rootColumn parent)) axis = SuppliedHigherLaws.parent4 parent axis := by
  simp only [SuppliedHigherLaws.root4, Equiv.symm_apply_apply, root_kind]

/-- The complete positive level-three child law is exactly its original six-strategy mixture center. -/
theorem node_law (node : Fin 945) (axis : Fin 3) :
    SuppliedHigherLaws.child3 (nodeParent node) (nodeChild node) axis = SuppliedLeafLaws.mixed3 node axis := by
  unfold SuppliedHigherLaws.child3
  simp only [nodeChild, Equiv.symm_apply_apply, nodeParent]
  rw [SuppliedNodeLookup.positive_inverse]

/-- The complete original terminal-child law is exactly the original terminal parameter's decoded fine law. -/
theorem terminal_law (node : Fin 945) (strategy : Fin 6) (child : Fin 3) (axis : Fin 3) :
    SuppliedLeafLaws.law node strategy (terminalChild child) axis =
      OrbitLevel2.orbits.decode (fun orbit => (SuppliedTerminalLaws.mass node child strategy axis orbit : ℝ)) := by
  simp only [SuppliedLeafLaws.law, SuppliedLeafLaws.mass, terminalChild, Equiv.symm_apply_apply, terminal_kind]

end
end MatrixBounds.Numeric.SuppliedShapeInterfaceBindings
