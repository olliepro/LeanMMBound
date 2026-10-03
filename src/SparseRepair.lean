module

public import FiniteRepair
public import FiniteCover

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Combines finite counting with tensor restrictions to repair sparse holes.
The hypotheses are local missing-outcome counts, not an assumed existence of a
global cover or an assumed rank bound for the complete tensor. -/

namespace MatrixBounds.Tensor.Repair

open scoped BigOperators
noncomputable section

variable {K X Y Z Outcome : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z] [Fintype Outcome]
variable [DecidableEq X] [DecidableEq Y] [DecidableEq Z] [DecidableEq Outcome]

/-- Explicit reconstruction from 2^(3L) independently labelled available sources.
The matrices are the witness, rather than a promise that reconstruction is possible. -/
structure RepairCertificate (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (length : ℕ) where
  source : Pattern (Fin length) → Outcome
  xMap : X → Pattern (Fin length) × X → K
  yMap : Y → Pattern (Fin length) × Y → K
  zMap : Z → Pattern (Fin length) × Z → K
  reconstruct : restrict xMap yMap zMap
    (directSum (fun pattern => broken tensor kx ky kz (source pattern))) = tensor

omit [DecidableEq Outcome] in
/-- Local failure counts construct actual repair matrices, without assuming any rank bound. -/
theorem repair_certificate_from_counts (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (badCount length : ℕ) (length_positive : 0 < length)
    (misses : ∀ x y z, Nat.card {outcome //
      ¬ (kx outcome x = true ∧ ky outcome y = true ∧ kz outcome z = true)} ≤ badCount)
    (small : Fintype.card (X × Y × Z) * badCount ^ length < Fintype.card Outcome ^ length) :
    Nonempty (RepairCertificate tensor kx ky kz length) := by
  classical
  let bad : Outcome → X × Y × Z → Prop := fun outcome point =>
    ¬ (kx outcome point.1 = true ∧ ky outcome point.2.1 = true ∧ kz outcome point.2.2 = true)
  obtain ⟨sequence, hsequence⟩ := Cover.exists_cover bad badCount length
    (fun point => misses point.1 point.2.1 point.2.2) small
  letI : Nonempty (Fin length) := ⟨⟨0, length_positive⟩⟩
  have cover : ∀ x y z, tensor x y z ≠ 0 → ∃ j : Fin length,
      kx (sequence j) x = true ∧ ky (sequence j) y = true ∧ kz (sequence j) z = true := by
    intro x y z _
    obtain ⟨j, hj⟩ := hsequence (x, y, z)
    exact ⟨j, not_not.mp hj⟩
  obtain ⟨mx, my, mz, hmaps⟩ := finite_repair_restriction tensor (fun j => kx (sequence j))
    (fun j => ky (sequence j)) (fun j => kz (sequence j)) cover
  exact ⟨⟨(fun pattern => sequence (sourceIndex pattern)), mx, my, mz, hmaps⟩⟩

omit [DecidableEq Outcome] in
/-- Finite repair directly from per-coordinate failure counts and an integer union bound.
Each outcome supplies one tensor with holes. If at most b outcomes miss any
coordinate triple, L outcomes suffice when D*b^L < G^L, where D is the number
of coordinate triples and G the number of outcomes. The output rank cost is
at most 2^(3L) times the individual source rank budget. -/
theorem repair_from_counts (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (badCount length rank : ℕ) (length_positive : 0 < length)
    (misses : ∀ x y z, Nat.card {outcome //
      ¬ (kx outcome x = true ∧ ky outcome y = true ∧ kz outcome z = true)} ≤ badCount)
    (small : Fintype.card (X × Y × Z) * badCount ^ length < Fintype.card Outcome ^ length)
    (budget : ∀ outcome, RankLE (broken tensor kx ky kz outcome) rank) :
    RankLE tensor (2 ^ (3 * length) * rank) := by
  classical
  let bad : Outcome → X × Y × Z → Prop := fun outcome point =>
    ¬ (kx outcome point.1 = true ∧ ky outcome point.2.1 = true ∧ kz outcome point.2.2 = true)
  obtain ⟨sequence, hsequence⟩ := Cover.exists_cover bad badCount length
    (fun point => misses point.1 point.2.1 point.2.2) small
  letI : Nonempty (Fin length) := ⟨⟨0, length_positive⟩⟩
  have cover : ∀ x y z, tensor x y z ≠ 0 → ∃ j : Fin length,
      kx (sequence j) x = true ∧ ky (sequence j) y = true ∧ kz (sequence j) z = true := by
    intro x y z _
    obtain ⟨j, hj⟩ := hsequence (x, y, z)
    exact ⟨j, not_not.mp hj⟩
  have result := finite_repair tensor (fun j => kx (sequence j))
    (fun j => ky (sequence j)) (fun j => kz (sequence j)) cover rank
    (fun j => budget (sequence j))
  simpa only [Fintype.card_fin] using result

omit [DecidableEq Outcome] in
/-- Missing any of three axis parts is bounded by the sum of the three failure counts. -/
theorem three_axis_union_bound (px py pz : Outcome → Prop) :
    Nat.card {outcome // ¬ (px outcome ∧ py outcome ∧ pz outcome)} ≤
      Nat.card {outcome // ¬ px outcome} + Nat.card {outcome // ¬ py outcome} +
      Nat.card {outcome // ¬ pz outcome} := by
  classical
  have pointwise : ∀ outcome : Outcome,
      (if ¬ (px outcome ∧ py outcome ∧ pz outcome) then (1 : ℕ) else 0) ≤
        (if ¬ px outcome then 1 else 0) + (if ¬ py outcome then 1 else 0) +
        (if ¬ pz outcome then 1 else 0) := by
    intro outcome
    by_cases hx : px outcome <;> by_cases hy : py outcome <;> by_cases hz : pz outcome <;>
      simp [hx, hy, hz]
  have summed := Finset.sum_le_sum (s := Finset.univ) (fun outcome _ => pointwise outcome)
  simpa only [Finset.sum_add_distrib, Finset.sum_boole, Nat.cast_id,
    Nat.card_eq_fintype_card, Fintype.card_subtype] using summed

omit [DecidableEq Outcome] in
/-- Local bounds for each axis imply the full finite sparse-hole repair theorem. -/
theorem sparse_hole_repair (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (bx by_ bz length rank : ℕ) (length_positive : 0 < length)
    (missX : ∀ x, Nat.card {outcome // kx outcome x ≠ true} ≤ bx)
    (missY : ∀ y, Nat.card {outcome // ky outcome y ≠ true} ≤ by_)
    (missZ : ∀ z, Nat.card {outcome // kz outcome z ≠ true} ≤ bz)
    (small : Fintype.card (X × Y × Z) * (bx + by_ + bz) ^ length <
      Fintype.card Outcome ^ length)
    (budget : ∀ outcome, RankLE (broken tensor kx ky kz outcome) rank) :
    RankLE tensor (2 ^ (3 * length) * rank) := by
  apply repair_from_counts tensor kx ky kz (bx + by_ + bz) length rank length_positive
    ?_ small budget
  intro x y z
  exact le_trans (three_axis_union_bound
    (fun outcome => kx outcome x = true) (fun outcome => ky outcome y = true)
    (fun outcome => kz outcome z = true))
    (Nat.add_le_add (Nat.add_le_add (missX x) (missY y)) (missZ z))

#print axioms repair_from_counts
#print axioms sparse_hole_repair
#print axioms repair_certificate_from_counts

end
end MatrixBounds.Tensor.Repair
