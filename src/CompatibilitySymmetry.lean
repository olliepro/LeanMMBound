module

public import RegularFibers

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Compatibility degrees remain uniform after fixing a coarse word. The
stabilizer argument supplies the pointwise symmetry needed by double counting. -/
namespace MatrixBounds.Selection

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {G Edge Block Coarse : Type*} [Group G]
variable [MulAction G Edge] [MulAction G Block] [MulAction G Coarse]

/-- Transitivity upstairs yields a transporter that fixes the shared projected point. -/
theorem exists_stabilizing_transport [MulAction.IsPretransitive G Block]
    (projection : Block → Coarse)
    (equivariant : ∀ (g : G) block, projection (g • block) = g • projection block)
    (coarse : Coarse) (left right : {block // projection block = coarse}) :
    ∃ g : G, g • coarse = coarse ∧ g • left.val = right.val := by
  obtain ⟨g, moves⟩ := MulAction.exists_smul_eq G left.val right.val
  refine ⟨g, ?_, moves⟩
  calc
    g • coarse = g • projection left.val := congrArg (fun b => g • b) left.property.symm
    _ = projection (g • left.val) := (equivariant g left.val).symm
    _ = coarse := by rw [moves, right.property]

/-- A group-invariant compatibility relation has constant degree within each fixed coarse fiber. -/
theorem compatibility_fiber_degree [MulAction.IsPretransitive G Block]
    (edgeProjection : Edge → Coarse) (blockProjection : Block → Coarse)
    (equivariantEdge : ∀ (g : G) edge, edgeProjection (g • edge) = g • edgeProjection edge)
    (equivariantBlock : ∀ (g : G) block, blockProjection (g • block) = g • blockProjection block)
    (compatible : Edge → Block → Prop)
    (invariant : ∀ (g : G) edge block, compatible (g • edge) (g • block) ↔ compatible edge block)
    (coarse : Coarse) (left right : {block // blockProjection block = coarse}) :
    Nat.card {edge : {edge // edgeProjection edge = coarse} // compatible edge.val left.val} =
      Nat.card {edge : {edge // edgeProjection edge = coarse} // compatible edge.val right.val} := by
  obtain ⟨g, fixes, moves⟩ := exists_stabilizing_transport blockProjection equivariantBlock coarse left right
  let permutation := fiberTransport edgeProjection equivariantEdge g fixes
  apply Nat.card_congr (Equiv.subtypeEquiv permutation ?_)
  intro edge
  change compatible edge.val left.val ↔ compatible (g • edge.val) right.val
  rw [← moves]
  exact (invariant g edge.val left.val).symm

/-- A group-invariant relation has constant incidence degree on a transitive block set. -/
theorem invariant_degree_constant [MulAction.IsPretransitive G Block]
    (compatible : Edge → Block → Prop)
    (invariant : ∀ (g : G) edge block, compatible (g • edge) (g • block) ↔ compatible edge block)
    (left right : Block) :
    Nat.card {edge // compatible edge left} = Nat.card {edge // compatible edge right} := by
  obtain ⟨g, moves⟩ := MulAction.exists_smul_eq G left right
  apply Nat.card_congr (Equiv.subtypeEquiv (MulAction.toPerm g) ?_)
  intro edge
  change compatible edge left ↔ compatible (g • edge) right
  rw [← moves]
  exact (invariant g edge left).symm

/-- Transitivity on both sides gives an exact incidence identity for every edge and block. -/
theorem invariant_incidence_identity [Fintype Edge] [Fintype Block]
    [MulAction.IsPretransitive G Edge] [MulAction.IsPretransitive G Block]
    (compatible : Edge → Block → Prop)
    (invariant : ∀ (g : G) edge block, compatible (g • edge) (g • block) ↔ compatible edge block)
    (edge : Edge) (block : Block) :
    Fintype.card Block * Nat.card {other // compatible other block} =
      Fintype.card Edge * Nat.card {other // compatible edge other} := by
  have columns (other : Block) := invariant_degree_constant compatible invariant other block
  have rows (other : Edge) := invariant_degree_constant (fun b e => compatible e b)
    (fun g e b => invariant g b e) other edge
  have incidence : (∑ b : Block, Nat.card {e // compatible e b}) =
      ∑ e : Edge, Nat.card {b // compatible e b} := by
    have indicator := Finset.sum_comm (s := Finset.univ) (t := Finset.univ)
      (f := fun b e => if compatible e b then (1 : ℕ) else 0)
    simpa only [Finset.sum_boole, Nat.card_eq_fintype_card, Fintype.card_subtype] using! indicator
  simpa only [columns, rows, Finset.sum_const, Finset.card_univ, smul_eq_mul] using incidence

end
end MatrixBounds.Selection
