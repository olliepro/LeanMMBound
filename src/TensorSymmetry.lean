import SymmetryCounts

/-! Coordinate symmetries realize moved holes as genuine restrictions of a fixed
broken tensor, rather than requiring a separate source for every mask. -/

namespace MatrixBounds.Tensor.Symmetry

noncomputable section
variable {K X Y Z : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z]

/-- Coordinate-selection matrix; row x reads source coordinate image x. -/
def select {V : Type*} [DecidableEq V] (image : V → V) (x source : V) : K :=
  if source = image x then 1 else 0

/-- Selection matrices implement simultaneous coordinate substitution exactly. -/
theorem restrict_select (tensor : Coeff K X Y Z)
    (ex : X → X) (ey : Y → Y) (ez : Z → Z) :
    restrict (select ex) (select ey) (select ez) tensor =
      fun x y z => tensor (ex x) (ey y) (ez z) := by
  funext x y z
  simp [restrict, mapX, mapY, mapZ, select]

/-- A symmetry of the complete tensor moves masks by a valid restriction of one fixed source.
The hypothesis is coefficient preservation, stated explicitly for every triple. -/
theorem moved_holes_restriction (tensor : Coeff K X Y Z)
    (ex : X ≃ X) (ey : Y ≃ Y) (ez : Z ≃ Z)
    (preserves : ∀ x y z, tensor (ex x) (ey y) (ez z) = tensor x y z)
    (kx : X → Bool) (ky : Y → Bool) (kz : Z → Bool) :
    restrict (select ex) (select ey) (select ez)
      (restrict (mask kx) (mask ky) (mask kz) tensor) =
    restrict (mask (kx ∘ ex)) (mask (ky ∘ ey)) (mask (kz ∘ ez)) tensor := by
  rw [restrict_select, restrict_mask, restrict_mask]
  funext x y z
  simp only [Function.comp_apply, preserves]

/-- Every moved-hole tensor inherits the rank budget of the fixed broken source. -/
theorem moved_holes_rank (tensor : Coeff K X Y Z)
    (ex : X ≃ X) (ey : Y ≃ Y) (ez : Z ≃ Z)
    (preserves : ∀ x y z, tensor (ex x) (ey y) (ez z) = tensor x y z)
    (kx : X → Bool) (ky : Y → Bool) (kz : Z → Bool) (rank : ℕ)
    (budget : RankLE (restrict (mask kx) (mask ky) (mask kz) tensor) rank) :
    RankLE (restrict (mask (kx ∘ ex)) (mask (ky ∘ ey)) (mask (kz ∘ ez)) tensor) rank := by
  rw [← moved_holes_restriction tensor ex ey ez preserves kx ky kz]
  exact rankLE_restrict budget _ _ _

/-- A repair certificate transfers uniform source rank bounds to the repaired tensor. -/
theorem rank_from_certificate {Outcome : Type*}
    (tensor : Coeff K X Y Z) (kx : Outcome → X → Bool)
    (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool) (length rank : ℕ)
    (certificate : Repair.RepairCertificate tensor kx ky kz length)
    (budget : ∀ outcome, RankLE (Repair.broken tensor kx ky kz outcome) rank) :
    RankLE tensor (2 ^ (3 * length) * rank) := by
  have sources := rankLE_directSum
    (fun pattern => Repair.broken tensor kx ky kz (certificate.source pattern)) rank
    (fun pattern => budget (certificate.source pattern))
  have result := rankLE_restrict sources certificate.xMap certificate.yMap certificate.zMap
  rw [certificate.reconstruct] at result
  simpa only [Repair.pattern_card, Fintype.card_fin] using result

open MatrixBounds.Symmetry RepairRates

/-- Repair from copies of one fixed broken tensor under part-preserving symmetries.
Inputs include transitive actions on parts, equivariant variable-to-part maps,
coefficient invariance, sparse holes, and a rank bound for the original source.
The output pays exactly the previously proved subexponential repair-copy cost. -/
theorem symmetric_repair_rank {G BX BY BZ : Type*} [Group G] [Fintype G]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ]
    [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction G BX] [MulAction G BY] [MulAction G BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY]
    [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop)
    (growth k rank : ℕ) (large : 2 ≤ k)
    (smallX : Nat.card {b // holesX b} * scale k ^ 2 ≤ Fintype.card BX)
    (smallY : Nat.card {b // holesY b} * scale k ^ 2 ≤ Fintype.card BY)
    (smallZ : Nat.card {b // holesZ b} * scale k ^ 2 ≤ Fintype.card BZ)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k))
    (budget : RankLE (Repair.broken tensor (keepPart holesX partX)
      (keepPart holesY partY) (keepPart holesZ partZ) (1 : G)) rank) :
    RankLE tensor (2 ^ (3 * coverLength growth k) * rank) := by
  classical
  obtain ⟨certificate⟩ := transitive_sparse_repair (G := G) tensor partX partY partZ
    holesX holesY holesZ growth k large smallX smallY smallZ size
  apply rank_from_certificate tensor _ _ _ _ rank certificate
  intro g
  have moved := moved_holes_rank tensor (MulAction.toPerm g) (MulAction.toPerm g)
    (MulAction.toPerm g) (preserves g) (keepPart holesX partX (1 : G))
    (keepPart holesY partY (1 : G)) (keepPart holesZ partZ (1 : G)) rank budget
  simpa only [Repair.broken, keepPart, Function.comp_def, MulAction.toPerm_apply,
    one_smul, equivX, equivY, equivZ] using moved

end
end MatrixBounds.Tensor.Symmetry
