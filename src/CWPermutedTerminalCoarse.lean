module

public import CWPermutedTerminalData
public import CWTerminalDegreeRate

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete coarse graph of every terminal physical orientation still
has no extra joint types. This supplies its actual coarse degree count. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Zero extension to the full alphabet preserves every terminal coordinate marginal. -/
theorem fullCounts_marginal (extreme middle : ℕ) (axis : Fin 3) :
    marginalProfile (fullProfile (counts extreme middle)) (fun child => shapeCoordinate child axis) =
      marginalProfile (counts extreme middle) (fun child => shapeCoordinate child.val axis) := by
  have same := supported_marginal (fun child : ShapeAlphabet 2 => child.val.Fits parent)
    (fullProfile (counts extreme middle)) (fullProfile_outside (counts extreme middle))
    ((data (counts extreme middle)).prescribedWord (countsReference extreme middle))
    (fun child => shapeCoordinate child axis)
  simp only [fullProfile_supported] at same
  convert same.symm using 2

omit [Fintype P] in
/-- Every physical axis of a complete permuted edge has the computed marginal profile. -/
theorem permuted_edge_marginal (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) (axis : Fin 3) (value : Fin 3) :
    count (fun position => shapeCoordinate (edge.val position).val axis) value =
      marginalProfile (permutedCounts axes extreme middle) (fun child => shapeCoordinate child axis) value := by
  fin_cases axis
  · exact edge.property.1 value
  · exact edge.property.2.1 value
  · exact edge.property.2.2 value

/-- Read a permuted terminal edge in the original four-symbol coordinates. -/
def unpermutedEdgeWord (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) : P → Symbol :=
  fun position => (splitAlphabetPermutation axes parent 2).symm (edge.val position)

omit [Fintype P] in
/-- Undoing the shape permutation also undoes the coarse coordinate projection. -/
theorem unpermuted_edge_coordinate (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) (axis : Fin 3) (position : P) :
    shapeCoordinate (unpermutedEdgeWord axes extreme middle edge position).val axis =
      shapeCoordinate (edge.val position).val (axes.symm axis) :=
  shapeCoordinate_permutation axes.symm 2 (edge.val position).val axis

omit [Fintype P] in
/-- All three marginals of the restored word are the original terminal marginals. -/
theorem unpermuted_edge_marginal (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) (axis : Fin 3) (value : Fin 3) :
    count (fun position => shapeCoordinate (unpermutedEdgeWord axes extreme middle edge position).val axis) value =
      marginalProfile (counts extreme middle) (fun child => shapeCoordinate child.val axis) value := by
  simp only [unpermuted_edge_coordinate]
  rw [permuted_edge_marginal]
  change marginalProfile (fullProfile (counts extreme middle) ∘ (shapeAlphabetPermutation axes 2).symm)
    (fun child => shapeCoordinate child (axes.symm axis)) value = _
  rw [marginalProfile_shapePermutation, Equiv.apply_symm_apply, fullCounts_marginal]

/-- The restored complete edge has exactly the original four-symbol joint profile. -/
theorem unpermuted_edge_typed (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) :
    HasType (counts extreme middle) (unpermutedEdgeWord axes extreme middle edge) := by
  let restored := unpermutedEdgeWord axes extreme middle edge
  have constraints (axis : Fin 3) (value : Fin 3) :
      marginalProfile (count restored) (fun child => shapeCoordinate child.val axis) value =
        marginalProfile (counts extreme middle) (fun child => shapeCoordinate child.val axis) value := by
    rw [← projected_count]
    exact unpermuted_edge_marginal axes extreme middle edge axis value
  have equal := joint_of_marginals (count restored) (counts extreme middle)
    (fun value => by
      convert constraints 0 value using 1 <;> unfold marginalProfile <;>
        apply Finset.sum_congr rfl <;> intro child _
      all_goals rw [show splitXIndex child = shapeCoordinate child.val 0 from by apply Fin.ext; rfl]
      all_goals split_ifs <;> rfl)
    (fun value => by
      convert constraints 1 value using 1 <;> unfold marginalProfile <;>
        apply Finset.sum_congr rfl <;> intro child _
      all_goals rw [show splitYIndex child = shapeCoordinate child.val 1 from by apply Fin.ext; rfl]
      all_goals split_ifs <;> rfl)
    (fun value => by
      convert constraints 2 value using 1 <;> unfold marginalProfile <;>
        apply Finset.sum_congr rfl <;> intro child _
      all_goals rw [show splitZIndex child = shapeCoordinate child.val 2 from by apply Fin.ext; rfl]
      all_goals split_ifs <;> rfl)
  exact congrFun equal

/-- Every complete edge in every physical terminal orientation is prescribed. -/
theorem permuted_all_edges_prescribed (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (edge : (permutedData axes extreme middle).Edges (P := P)) :
    (permutedData axes extreme middle).prescribed edge := by
  let restored := unpermutedEdgeWord axes extreme middle edge
  have fullTyped : HasType (fullProfile (counts extreme middle)) (fun position => (restored position).val) := by
    apply hasType_subtype_val (fun child : ShapeAlphabet 2 => child.val.Fits parent)
      (fullProfile (counts extreme middle)) (fullProfile_outside (counts extreme middle))
      ⟨restored, ?_⟩
    simpa only [fullProfile_supported] using unpermuted_edge_typed axes extreme middle edge
  have reindexed := hasType_relabel (shapeAlphabetPermutation axes 2)
    (fullProfile (counts extreme middle)) (fun position => (restored position).val) fullTyped
  have same : (shapeAlphabetPermutation axes 2) ∘ (fun position => (restored position).val) =
      (permutedData axes extreme middle).word edge := by
    funext position
    exact (shapeAlphabetPermutation axes 2).apply_symm_apply (edge.val position).val
  rw [same] at reindexed
  exact reindexed

/-- The full graph is exactly the prescribed-edge graph after any physical terminal permutation. -/
def permutedPrescribedEquiv (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).Edges (P := P) ≃
      (permutedData axes extreme middle).PrescribedEdges (P := P) where
  toFun edge := ⟨edge, permuted_all_edges_prescribed axes extreme middle edge⟩
  invFun := Subtype.val
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

end
end MatrixBounds.Tensor.CW.Terminal
