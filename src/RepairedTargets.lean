import OwnedTargets
import BatchRepair
import Mathlib.Data.Finite.Card

/-! Connect the extracted damaged batch to the complete target batch with an
explicit finite rank budget. Parent and collision hole counts add without independence. -/
namespace MatrixBounds.Selection

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Combine parent-interface holes with collision holes at the same inverse scale. -/
theorem union_holes_bound {Block : Type*} [Fintype Block]
    (parent collision : Block → Prop) (scale constant : ℕ)
    (parent_bound : Nat.card {block // parent block}*scale ≤ constant*Fintype.card Block)
    (collision_bound : Nat.card {block // collision block}*scale ≤ Fintype.card Block) :
    Nat.card {block // parent block ∨ collision block}*scale ≤ (constant+1)*Fintype.card Block := by
  have count := Set.card_union_le {block : Block | parent block} {block : Block | collision block}
  have multiplied := Nat.mul_le_mul_right scale count
  change Nat.card {block // parent block ∨ collision block}*scale ≤
    (Nat.card {block // parent block} + Nat.card {block // collision block})*scale at multiplied
  nlinarith

end
end MatrixBounds.Selection

namespace MatrixBounds.Tensor.Symmetry

open MatrixBounds.Symmetry RepairRates
noncomputable section
variable {K E G X Y Z BX BY BZ : Type*} [CommSemiring K] [Group G]
variable [Fintype X] [Fintype Y] [Fintype Z]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
variable [MulAction G BX] [MulAction G BY] [MulAction G BZ]

/-- Fine-block acceptance is exactly the broken-copy representation used by the repair theorem. -/
theorem accepted_is_broken (target : Coeff K X Y Z)
    (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop) :
    Empirical.acceptedTensor target partX partY partZ (fun b => ¬holesX b)
      (fun b => ¬holesY b) (fun b => ¬holesZ b) =
    Repair.broken target (keepPart holesX partX) (keepPart holesY partY) (keepPart holesZ partZ) (1 : G) := by
  classical
  unfold Empirical.acceptedTensor Repair.broken
  rw [restrict_mask]
  funext x y z
  simp [keepPart]

/-- A damaged-batch polynomial certificate repairs to the complete batch at the exact finite cost.
The degeneration overhead is polynomial in its degree; the repair factor is
the previously proved subexponential function of the common scale. -/
theorem accepted_batch_repair [Fintype E] [Nonempty E] [DecidableEq E] [Fintype G]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (target : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, target (g • x) (g • y) (g • z) = target x y z)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (growth k constant rank degree : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : ∀ copy, Nat.card {b // holesX copy b}*scale k ≤ constant*Fintype.card BX)
    (smallY : ∀ copy, Nat.card {b // holesY copy b}*scale k ≤ constant*Fintype.card BY)
    (smallZ : ∀ copy, Nat.card {b // holesZ copy b}*scale k ≤ constant*Fintype.card BZ)
    (size : Fintype.card ((E × X) × (E × Y) × (E × Z)) ≤ 2^(growth*scale k))
    (certificate : Degeneration.Certificate
      (directSum (fun copy : E => Empirical.acceptedTensor target partX partY partZ
        (fun b => ¬holesX copy b) (fun b => ¬holesY copy b) (fun b => ¬holesZ copy b))) rank degree) :
    RankLE (directSum (fun _ : E => target)) (2^(3*coverLength growth k)*(rank*(degree+1)^2)) := by
  apply batch_linear_repair_rank target partX partY partZ equivX equivY equivZ preserves
    holesX holesY holesZ growth k constant (rank*(degree+1)^2) positive large smallX smallY smallZ size
  simpa only [accepted_is_broken (G := G)] using certificate.exact_rank

end
end MatrixBounds.Tensor.Symmetry
