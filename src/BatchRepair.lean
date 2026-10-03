module

public import BatchSymmetry
public import LinearSymmetryRepair
public import Mathlib.Data.Fintype.Perm

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Repair all retained outputs together without paying separately for the
number of outputs. Different copies may have different sparse-hole patterns. -/
namespace MatrixBounds.Tensor.Symmetry

open MatrixBounds.Symmetry RepairRates
noncomputable section
variable {K E G X Y Z BX BY BZ : Type*} [CommSemiring K] [Group G] [Fintype E] [Fintype G]
variable [DecidableEq E] [Fintype X] [Fintype Y] [Fintype Z]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
variable [MulAction G BX] [MulAction G BY] [MulAction G BZ]

omit [Fintype G] in
/-- The direct sum of differently masked copies is one masked complete batch. -/
theorem broken_batch_identity (tensor : Coeff K X Y Z)
    (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop) :
    Repair.broken (directSum (fun _ : E => tensor))
      (keepPart (fun b : E × BX => holesX b.1 b.2) (fun x : E × X => (x.1, partX x.2)))
      (keepPart (fun b : E × BY => holesY b.1 b.2) (fun y : E × Y => (y.1, partY y.2)))
      (keepPart (fun b : E × BZ => holesZ b.1 b.2) (fun z : E × Z => (z.1, partZ z.2)))
      (1 : Equiv.Perm E × G) =
    directSum (fun copy : E => Repair.broken tensor (keepPart (holesX copy) partX)
      (keepPart (holesY copy) partY) (keepPart (holesZ copy) partZ) (1 : G)) := by
  classical
  funext ⟨i, x⟩ ⟨j, y⟩ ⟨k, z⟩
  by_cases same : i = j ∧ j = k
  · obtain ⟨rfl, rfl⟩ := same
    simp [Repair.broken, restrict_mask, directSum, keepPart]
  · simp [Repair.broken, restrict_mask, directSum, keepPart, same]

/-- Joint sparse repair preserves the rank advantage of the retained batch.
The rank input is a budget for the entire damaged batch, and the repair cost is
one subexponential factor multiplying that budget, independent of the number of copies. -/
theorem batch_linear_repair_rank [Nonempty E]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (growth k constant rank : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : ∀ copy, Nat.card {b // holesX copy b} * scale k ≤ constant * Fintype.card BX)
    (smallY : ∀ copy, Nat.card {b // holesY copy b} * scale k ≤ constant * Fintype.card BY)
    (smallZ : ∀ copy, Nat.card {b // holesZ copy b} * scale k ≤ constant * Fintype.card BZ)
    (size : Fintype.card ((E × X) × (E × Y) × (E × Z)) ≤ 2 ^ (growth * scale k))
    (budget : RankLE (directSum (fun copy : E => Repair.broken tensor (keepPart (holesX copy) partX)
      (keepPart (holesY copy) partY) (keepPart (holesZ copy) partZ) (1 : G))) rank) :
    RankLE (directSum (fun _ : E => tensor)) (2 ^ (3 * coverLength growth k) * rank) := by
  apply symmetric_linear_repair_rank (G := Equiv.Perm E × G) (directSum (fun _ : E => tensor))
    (fun x : E × X => (x.1, partX x.2)) (fun y : E × Y => (y.1, partY y.2))
    (fun z : E × Z => (z.1, partZ z.2))
    (batch_parts_equivariant partX equivX) (batch_parts_equivariant partY equivY)
    (batch_parts_equivariant partZ equivZ) (batch_invariant tensor preserves)
    (fun b : E × BX => holesX b.1 b.2) (fun b : E × BY => holesY b.1 b.2)
    (fun b : E × BZ => holesZ b.1 b.2) growth k constant rank positive large
    (batch_holes_bound holesX _ _ smallX) (batch_holes_bound holesY _ _ smallY)
    (batch_holes_bound holesZ _ _ smallZ) size
  rwa [broken_batch_identity]

end
end MatrixBounds.Tensor.Symmetry
