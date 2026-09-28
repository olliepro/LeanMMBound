import MatrixBounds
import RepairRates
import Mathlib.GroupTheory.GroupAction.Basic

/-! Transitive symmetry converts a fraction of missing parts into a pointwise
failure bound. Parts need not be individual variables or have equal sizes. -/

namespace MatrixBounds.Symmetry

open scoped BigOperators
noncomputable section

variable {G B : Type*} [Group G] [Fintype G] [Fintype B]
variable [MulAction G B] [MulAction.IsPretransitive G B]

/-- Count group elements moving a specified part into the missing set. -/
def misses (holes : B → Prop) (part : B) : ℕ :=
  Nat.card {g : G // holes (g • part)}

omit [Fintype B] in
/-- Transitivity makes the missing-outcome count independent of the selected part. -/
theorem misses_constant (holes : B → Prop) (left right : B) :
    misses (G := G) holes left = misses (G := G) holes right := by
  classical
  have uniform := compatible_degree_constant (fun g : G => fun b : B => holes (g • b))
    (fun b c => by
      obtain ⟨a, ha⟩ := MulAction.exists_smul_eq G c b
      refine ⟨Equiv.mulRight a, ?_⟩
      intro g
      change holes (g • b) ↔ holes ((g * a) • c)
      rw [mul_smul, ha]) left right
  simpa only [misses, Nat.card_eq_fintype_card, Fintype.card_subtype,
    Finset.sum_boole, Nat.cast_id] using uniform

/-- Exact double counting: part count times local failures equals group count times holes. -/
theorem misses_identity (holes : B → Prop) (part : B) :
    Fintype.card B * misses (G := G) holes part =
      Fintype.card G * Nat.card {b // holes b} := by
  classical
  have row (g : G) : (∑ b : B, if holes (g • b) then (1 : ℕ) else 0) =
      Nat.card {b // holes b} := by
    have h := Equiv.sum_comp (MulAction.toPerm g) (fun b => if holes b then (1 : ℕ) else 0)
    simpa only [MulAction.toPerm_apply, Finset.sum_boole, Nat.cast_id,
      Nat.card_eq_fintype_card, Fintype.card_subtype] using h
  calc
    _ = ∑ b : B, misses (G := G) holes b := by
      simp only [misses_constant holes _ part, Finset.sum_const, Finset.card_univ, smul_eq_mul]
    _ = ∑ b : B, ∑ g : G, if holes (g • b) then (1 : ℕ) else 0 := by
      simp only [misses, Nat.card_eq_fintype_card, Fintype.card_subtype,
        Finset.sum_boole, Nat.cast_id]
    _ = ∑ g : G, ∑ b : B, if holes (g • b) then (1 : ℕ) else 0 := Finset.sum_comm
    _ = _ := by simp only [row, Finset.sum_const, Finset.card_univ, smul_eq_mul]

/-- A 1/denominator fraction of missing parts gives the same bound for every part.
For example, denominator = N² supplies the sparse-repair failure estimate. -/
theorem misses_fraction (holes : B → Prop) (part : B) (denominator : ℕ)
    (small : Nat.card {b // holes b} * denominator ≤ Fintype.card B) :
    misses (G := G) holes part * denominator ≤ Fintype.card G := by
  have positive : 0 < Fintype.card B := Fintype.card_pos_iff.mpr ⟨part⟩
  have multiplied := Nat.mul_le_mul_left (Fintype.card G) small
  have identity := misses_identity (G := G) holes part
  nlinarith

/-- Keep exactly variables whose part is moved outside the missing set. -/
def keepPart {V : Type*} (holes : B → Prop) (part : V → B) (g : G) (v : V) : Bool := by
  classical
  exact decide (¬ holes (g • part v))

omit [Fintype B] [MulAction.IsPretransitive G B] in
/-- The Boolean mask has exactly the failure count computed by the action. -/
theorem keepPart_misses {V : Type*} (holes : B → Prop) (part : V → B) (v : V) :
    Nat.card {g : G // keepPart holes part g v ≠ true} = misses (G := G) holes (part v) := by
  classical
  simp [keepPart, misses]

open Tensor Tensor.Repair RepairRates

/-- Transitive actions on axis parts and inverse-square hole fractions construct repair maps.
The same group acts on all three part sets; no independence between axes is assumed.
The input tensor is arbitrary, so supplying these sources from copies of a particular
interface tensor remains a separate restriction obligation. -/
theorem transitive_sparse_repair {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    [Fintype BX] [Fintype BY] [Fintype BZ]
    [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction G BX] [MulAction G BY] [MulAction G BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY]
    [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop)
    (growth k : ℕ) (large : 2 ≤ k)
    (smallX : Nat.card {b // holesX b} * scale k ^ 2 ≤ Fintype.card BX)
    (smallY : Nat.card {b // holesY b} * scale k ^ 2 ≤ Fintype.card BY)
    (smallZ : Nat.card {b // holesZ b} * scale k ^ 2 ≤ Fintype.card BZ)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k)) :
    Nonempty (RepairCertificate tensor (keepPart (G := G) holesX partX)
      (keepPart (G := G) holesY partY) (keepPart (G := G) holesZ partZ) (coverLength growth k)) := by
  let baseX : BX := Classical.choice inferInstance
  let baseY : BY := Classical.choice inferInstance
  let baseZ : BZ := Classical.choice inferInstance
  apply inverse_square_repair tensor _ _ _ growth k
    (misses (G := G) holesX baseX) (misses (G := G) holesY baseY)
    (misses (G := G) holesZ baseZ) large
  · intro x
    rw [keepPart_misses, misses_constant holesX (partX x) baseX]
  · intro y
    rw [keepPart_misses, misses_constant holesY (partY y) baseY]
  · intro z
    rw [keepPart_misses, misses_constant holesZ (partZ z) baseZ]
  · exact misses_fraction holesX baseX _ smallX
  · exact misses_fraction holesY baseY _ smallY
  · exact misses_fraction holesZ baseZ _ smallZ
  · exact size

end
end MatrixBounds.Symmetry
