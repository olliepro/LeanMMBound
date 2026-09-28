import ContextRepair
import RepairedTargets

/-! Simultaneous repair preserves the context of the whole extracted batch;
previous copies and waiting factors are not charged again in the cover size. -/
namespace MatrixBounds.Tensor.Symmetry

universe v
open MatrixBounds.Symmetry RepairRates
noncomputable section
variable {K E G X Y Z BX BY BZ : Type*} [CommSemiring K] [Group G] [Fintype E] [Fintype G]
variable [DecidableEq E] [Fintype X] [Fintype Y] [Fintype Z]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
variable [MulAction G BX] [MulAction G BY] [MulAction G BZ]

/-- Repair an entire damaged batch in any tensor context, paying one subexponential multiplier. -/
theorem contextReduction_batch_repair [Nonempty E]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (growth k constant : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : ∀ copy, Nat.card {b // holesX copy b} * scale k ≤ constant * Fintype.card BX)
    (smallY : ∀ copy, Nat.card {b // holesY copy b} * scale k ≤ constant * Fintype.card BY)
    (smallZ : ∀ copy, Nat.card {b // holesZ copy b} * scale k ≤ constant * Fintype.card BZ)
    (size : Fintype.card ((E × X) × (E × Y) × (E × Z)) ≤ 2 ^ (growth * scale k)) :
    ContextReduction.{v} (directSum (fun copy : E => Repair.broken tensor (keepPart (holesX copy) partX)
      (keepPart (holesY copy) partY) (keepPart (holesZ copy) partZ) (1 : G)))
      (directSum (fun _ : E => tensor)) (2^(3*coverLength growth k)) := by
  rw [← broken_batch_identity]
  exact contextReduction_symmetric_repair (G := Equiv.Perm E × G) (directSum (fun _ : E => tensor))
    (fun x : E × X => (x.1, partX x.2)) (fun y : E × Y => (y.1, partY y.2))
    (fun z : E × Z => (z.1, partZ z.2))
    (batch_parts_equivariant partX equivX) (batch_parts_equivariant partY equivY)
    (batch_parts_equivariant partZ equivZ) (batch_invariant tensor preserves)
    (fun b : E × BX => holesX b.1 b.2) (fun b : E × BY => holesY b.1 b.2)
    (fun b : E × BZ => holesZ b.1 b.2) growth k constant positive large
    (batch_holes_bound holesX _ _ smallX) (batch_holes_bound holesY _ _ smallY)
    (batch_holes_bound holesZ _ _ smallZ) size

omit [Fintype E] [Fintype G] in
/-- Accepted damaged batches and broken-copy batches have identical coefficients. -/
theorem accepted_batch_broken_identity
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop) :
    (directSum (fun copy : E => Empirical.acceptedTensor tensor partX partY partZ
      (fun b => ¬holesX copy b) (fun b => ¬holesY copy b) (fun b => ¬holesZ copy b))) =
    directSum (fun copy : E => Repair.broken tensor (keepPart (holesX copy) partX)
      (keepPart (holesY copy) partY) (keepPart (holesZ copy) partZ) (1 : G)) := by
  congr 1
  funext copy
  exact accepted_is_broken tensor partX partY partZ (holesX copy) (holesY copy) (holesZ copy)

/-- Accepted damaged copies repair in arbitrary tensor contexts with one common repair cost. -/
theorem contextReduction_accepted_batch_repair [Nonempty E]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (growth k constant : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : ∀ copy, Nat.card {b // holesX copy b} * scale k ≤ constant * Fintype.card BX)
    (smallY : ∀ copy, Nat.card {b // holesY copy b} * scale k ≤ constant * Fintype.card BY)
    (smallZ : ∀ copy, Nat.card {b // holesZ copy b} * scale k ≤ constant * Fintype.card BZ)
    (size : Fintype.card ((E × X) × (E × Y) × (E × Z)) ≤ 2 ^ (growth * scale k)) :
    ContextReduction.{v} (directSum (fun copy : E => Empirical.acceptedTensor tensor partX partY partZ
      (fun b => ¬holesX copy b) (fun b => ¬holesY copy b) (fun b => ¬holesZ copy b)))
      (directSum (fun _ : E => tensor)) (2^(3*coverLength growth k)) := by
  rw [accepted_batch_broken_identity (G := G)]
  exact contextReduction_batch_repair tensor partX partY partZ equivX equivY equivZ preserves
    holesX holesY holesZ growth k constant positive large smallX smallY smallZ size

end
end MatrixBounds.Tensor.Symmetry
