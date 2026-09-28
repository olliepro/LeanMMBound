import ContextOperations
import LinearSymmetryRepair

/-! The explicit sparse-hole repair matrices preserve an arbitrary companion
tensor. Their cost depends only on the repaired tensor's own coordinate cube. -/
namespace MatrixBounds.Tensor.Symmetry

universe v
open MatrixBounds.Symmetry RepairRates
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z : Type*} [CommSemiring K] [Fintype X] [Fintype Y] [Fintype Z]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z]

/-- An explicit repair certificate composes context-preserving broken-source transformations at the exact finite pattern cost. -/
theorem contextReduction_from_repair {U V W Outcome : Type*}
    (source : Coeff K U V W) (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool) (length cost : ℕ)
    (certificate : Repair.RepairCertificate tensor kx ky kz length)
    (available : ∀ outcome, ContextReduction.{v} source (Repair.broken tensor kx ky kz outcome) cost) :
    ContextReduction.{v} source tensor (2^(3*length)*cost) := by
  have supplied := ContextReduction.directSum
    (fun pattern => Repair.broken tensor kx ky kz (certificate.source pattern))
    (fun pattern => available (certificate.source pattern))
  have repaired := contextReduction_restrict
    (directSum (fun pattern => Repair.broken tensor kx ky kz (certificate.source pattern)))
    certificate.xMap certificate.yMap certificate.zMap
  rw [certificate.reconstruct] at repaired
  simpa only [one_mul, Repair.pattern_card, Fintype.card_fin] using supplied.trans repaired

/-- Moving holes by a tensor automorphism preserves every companion tensor at unit cost. -/
theorem contextReduction_moved (tensor : Coeff K X Y Z)
    (ex : X ≃ X) (ey : Y ≃ Y) (ez : Z ≃ Z)
    (preserves : ∀ x y z, tensor (ex x) (ey y) (ez z) = tensor x y z)
    (kx : X → Bool) (ky : Y → Bool) (kz : Z → Bool) :
    ContextReduction.{v} (restrict (mask kx) (mask ky) (mask kz) tensor)
      (restrict (mask (kx ∘ ex)) (mask (ky ∘ ey)) (mask (kz ∘ ez)) tensor) 1 := by
  rw [← moved_holes_restriction tensor ex ey ez preserves kx ky kz]
  exact contextReduction_restrict _ _ _ _

/-- Transitive inverse-linear hole bounds give contextual repair without charging for previously produced copies or waiting factors. -/
theorem contextReduction_symmetric_repair {G BX BY BZ : Type*} [Group G] [Fintype G]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction G BX] [MulAction G BY] [MulAction G BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop)
    (growth k constant : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : Nat.card {b // holesX b}*scale k ≤ constant*Fintype.card BX)
    (smallY : Nat.card {b // holesY b}*scale k ≤ constant*Fintype.card BY)
    (smallZ : Nat.card {b // holesZ b}*scale k ≤ constant*Fintype.card BZ)
    (size : Fintype.card (X × Y × Z) ≤ 2^(growth*scale k)) :
    ContextReduction.{v} (Repair.broken tensor (keepPart holesX partX) (keepPart holesY partY) (keepPart holesZ partZ) (1 : G))
      tensor (2^(3*coverLength growth k)) := by
  obtain ⟨certificate⟩ := transitive_linear_repair (G := G) tensor partX partY partZ
    holesX holesY holesZ growth k constant positive large smallX smallY smallZ size
  have available (g : G) := contextReduction_moved.{v} tensor (MulAction.toPerm g) (MulAction.toPerm g)
    (MulAction.toPerm g) (preserves g) (keepPart holesX partX (1 : G))
    (keepPart holesY partY (1 : G)) (keepPart holesZ partZ (1 : G))
  have moved : ∀ g : G, ContextReduction.{v}
      (Repair.broken tensor (keepPart holesX partX) (keepPart holesY partY) (keepPart holesZ partZ) (1 : G))
      (Repair.broken tensor (keepPart holesX partX) (keepPart holesY partY) (keepPart holesZ partZ) g) 1 := by
    intro g
    have mx : (keepPart holesX partX (1 : G) ∘ MulAction.toPerm g) = keepPart holesX partX g := by
      funext x
      simp only [keepPart, Function.comp_def, MulAction.toPerm_apply]
      congr 1
      rw [one_smul, equivX]
    have my : (keepPart holesY partY (1 : G) ∘ MulAction.toPerm g) = keepPart holesY partY g := by
      funext y
      simp only [keepPart, Function.comp_def, MulAction.toPerm_apply]
      congr 1
      rw [one_smul, equivY]
    have mz : (keepPart holesZ partZ (1 : G) ∘ MulAction.toPerm g) = keepPart holesZ partZ g := by
      funext z
      simp only [keepPart, Function.comp_def, MulAction.toPerm_apply]
      congr 1
      rw [one_smul, equivZ]
    simpa only [Repair.broken, mx, my, mz] using available g
  simpa only [mul_one] using contextReduction_from_repair _ tensor _ _ _ _ 1 certificate moved

end
end MatrixBounds.Tensor.Symmetry
