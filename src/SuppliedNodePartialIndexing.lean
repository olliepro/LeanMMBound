module

public import PositiveLookupEquivalence
public import SuppliedPopulationWeights

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The original hierarchy lookup is an exact partial bijection of all parent
and complete child labels. Positive population cannot enter an absent cell. -/
namespace MatrixBounds.Numeric.SuppliedNodePartialIndexing

open Tensor Tensor.CW Interface SuppliedPopulationWeights
noncomputable section

/-- Recover the original complete parent/child pair of a source hierarchy label. -/
def decode : Fin 945 ⊕ Fin 840 → Fin 105 × Fin 45
  | .inl node =>
    (⟨(SuppliedShapeIndices.positiveNode node).parent, (SuppliedShapeIndices.positiveNode_bounds node).1⟩,
     ⟨(SuppliedShapeIndices.positiveNode node).child, (SuppliedShapeIndices.positiveNode_bounds node).2.1⟩)
  | .inr node =>
    (⟨(SuppliedShapeIndices.zeroNode node).parent, (SuppliedShapeIndices.zeroNode_bounds node).1⟩,
     ⟨(SuppliedShapeIndices.zeroNode node).child, (SuppliedShapeIndices.zeroNode_bounds node).2.1⟩)

/-- Original source hierarchy labels and complete child pairs are inverse wherever present. -/
def indexing : PartialIndexing (Fin 105 × Fin 45) (Fin 945 ⊕ Fin 840) where
  encode pair := SuppliedNodeLookup.lookup pair.1 pair.2
  decode := decode
  encode_decode label := by
    cases label with
    | inl node => exact SuppliedNodeLookup.positive_inverse node
    | inr node => exact SuppliedNodeLookup.zero_inverse node
  decode_encode pair label present := by
    have correct := SuppliedNodeLookup.lookup_correct pair.1 pair.2
    cases label with
    | inl node =>
      simp only [SuppliedNodeLookup.correct, present] at correct
      exact Prod.ext (Fin.ext correct.1) (Fin.ext correct.2.1)
    | inr node =>
      simp only [SuppliedNodeLookup.correct, present] at correct
      exact Prod.ext (Fin.ext correct.1) (Fin.ext correct.2.1)

/-- Actual paired child populations on the complete original parent/child grid. -/
def childWeight (weight : Fin 105 → ℕ) (pair : Fin 105 × Fin 45) : ℕ :=
  (SuppliedTypedParameters.level4Split pair.1).childWeight (weight pair.1) (shapeColumnEquiv 8 pair.2)

/-- Every positive child population is represented by its original positive or zero-coordinate source node. -/
theorem child_supported (weight : Fin 105 → ℕ) (pair : Fin 105 × Fin 45)
    (positive : 0 < childWeight weight pair) : indexing.encode pair ≠ none := by
  have massPositive : 0 < (SuppliedTypedParameters.level4Split pair.1).numerator (shapeColumnEquiv 8 pair.2) :=
    Nat.pos_of_mul_pos_left (Nat.pos_of_mul_pos_left positive)
  have fits := (SuppliedTypedParameters.level4Split pair.1).supported (shapeColumnEquiv 8 pair.2) (Nat.ne_of_gt massPositive)
  apply SuppliedNodeLookup.lookup_ne_none
  have selected := SuppliedNodeLookup.shapeAt_column 8 (shapeColumnEquiv 8 pair.2)
  rw [(shapeColumnEquiv 8).symm_apply_apply pair.2] at selected
  rw [selected]
  simpa only [SuppliedHierarchyParents.level4Split_parent] using fits

/-- Retaining precisely positive child populations gives a lossless bijection to the original node labels. -/
def positiveEquiv (weight : Fin 105 → ℕ) :
    PositiveWeight (childWeight weight) ≃ PositiveWeight (fun label => childWeight weight (decode label)) :=
  indexing.positiveEquiv (childWeight weight) (child_supported weight)

end
end MatrixBounds.Numeric.SuppliedNodePartialIndexing
