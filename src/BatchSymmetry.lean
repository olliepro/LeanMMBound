module

public import TensorSymmetry
public import FiniteSelection

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent identical output tensors can be repaired as one batch. A common
internal symmetry and a permutation of copies are enough for transitivity. -/
namespace MatrixBounds.Tensor.Symmetry

open scoped BigOperators
noncomputable section
variable {E G X Y Z B K : Type*} [Group G]

/-- Act on a copy label by a permutation and on its internal coordinate by a tensor symmetry. -/
instance batchAction [MulAction G X] : MulAction (Equiv.Perm E × G) (E × X) where
  smul group entry := (group.1 entry.1, group.2 • entry.2)
  one_smul entry := Prod.ext rfl (one_smul G entry.2)
  mul_smul left right entry := Prod.ext rfl (mul_smul left.2 right.2 entry.2)

/-- A transitive internal part action makes the complete batch part action transitive. -/
instance batchActionTransitive [MulAction G B] [MulAction.IsPretransitive G B] :
    MulAction.IsPretransitive (Equiv.Perm E × G) (E × B) where
  exists_smul_eq left right := by
    classical
    obtain ⟨group, moves⟩ := MulAction.exists_smul_eq G left.2 right.2
    refine ⟨(Equiv.swap left.1 right.1, group), ?_⟩
    change (Equiv.swap left.1 right.1 left.1, group • left.2) = right
    simp only [Equiv.swap_apply_left, moves]

/-- Copy permutations and a common tensor automorphism preserve the entire independent batch. -/
theorem batch_invariant [CommSemiring K] [Fintype E] [DecidableEq E]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    (tensor : Coeff K X Y Z)
    (preserves : ∀ (group : G) x y z, tensor (group • x) (group • y) (group • z) = tensor x y z)
    (group : Equiv.Perm E × G) (x : E × X) (y : E × Y) (z : E × Z) :
    directSum (fun _ : E => tensor) (group • x) (group • y) (group • z) =
      directSum (fun _ : E => tensor) x y z := by
  change (if group.1 x.1 = group.1 y.1 ∧ group.1 y.1 = group.1 z.1 then
    tensor (group.2 • x.2) (group.2 • y.2) (group.2 • z.2) else 0) = _
  simp only [Equiv.apply_eq_iff_eq, preserves, directSum]

/-- An equivariant internal part map remains equivariant after attaching copy labels. -/
theorem batch_parts_equivariant [MulAction G X] [MulAction G B]
    (part : X → B) (equivariant : ∀ (group : G) x, part (group • x) = group • part x)
    (group : Equiv.Perm E × G) (entry : E × X) :
    (fun x : E × X => (x.1, part x.2)) (group • entry) = group • (entry.1, part entry.2) := by
  change (group.1 entry.1, part (group.2 • entry.2)) = (group.1 entry.1, group.2 • part entry.2)
  rw [equivariant]

omit [Group G] in
/-- Global batch holes count as the sum of the possibly different per-copy hole patterns. -/
theorem batch_hole_count [Fintype E] [Fintype B] (holes : E → B → Prop) :
    Nat.card {entry : E × B // holes entry.1 entry.2} = ∑ copy, Nat.card {part // holes copy part} := by
  classical
  rw [Selection.count_as_sum, Fintype.sum_prod_type]
  simp only [Selection.count_as_sum]

omit [Group G] in
/-- Uniform per-copy hole bounds imply the same bound for all parts of the complete batch. -/
theorem batch_holes_bound [Fintype E] [Fintype B] (holes : E → B → Prop) (scale constant : ℕ)
    (small : ∀ copy, Nat.card {part // holes copy part} * scale ≤ constant * Fintype.card B) :
    Nat.card {entry : E × B // holes entry.1 entry.2} * scale ≤ constant * Fintype.card (E × B) := by
  rw [batch_hole_count, Finset.sum_mul]
  have summed := Finset.sum_le_sum (s := Finset.univ) (fun copy _ => small copy)
  simpa only [Finset.sum_const, Finset.card_univ, Fintype.card_prod, smul_eq_mul,
    Nat.mul_left_comm] using summed

end
end MatrixBounds.Tensor.Symmetry
