import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Pi
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Push
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! A finite union-bound argument for repairing missing parts.
The statement uses only integer counts, avoiding unformalized probability notation. -/

namespace MatrixBounds.Cover

open scoped BigOperators
noncomputable section

variable {Outcome Point : Type*} [Fintype Outcome] [Fintype Point]

/-- Sequences that miss one point correspond exactly to sequences of missing outcomes. -/
def missedSequenceEquiv (bad : Outcome → Point → Prop) (point : Point) (length : ℕ) :
    {sequence : Fin length → Outcome // ∀ j, bad (sequence j) point} ≃
      (Fin length → {outcome // bad outcome point}) where
  toFun sequence j := ⟨sequence.val j, sequence.property j⟩
  invFun sequence := ⟨fun j => (sequence j).val, fun j => (sequence j).property⟩
  left_inv _ := rfl
  right_inv _ := rfl

omit [Fintype Point] in
/-- Independent repeated choices have the exact expected power count for a missed point. -/
theorem missed_sequence_count (bad : Outcome → Point → Prop) (point : Point) (length : ℕ) :
    Nat.card {sequence : Fin length → Outcome // ∀ j, bad (sequence j) point} =
      Nat.card {outcome // bad outcome point} ^ length := by
  classical
  calc
    _ = Nat.card (Fin length → {outcome // bad outcome point}) :=
      Nat.card_congr (missedSequenceEquiv bad point length)
    _ = _ := by simp [Nat.card_eq_fintype_card]

/-- A finite family admits a complete cover once the union bound is strictly below one.
Inputs: each point is missed by at most `badCount` outcomes, and L choices satisfy
`numberOfPoints * badCount^L < numberOfOutcomes^L`.
Output: one length-L sequence covering every point. -/
theorem exists_cover (bad : Outcome → Point → Prop) (badCount length : ℕ)
    (perPoint : ∀ point, Nat.card {outcome // bad outcome point} ≤ badCount)
    (small : Fintype.card Point * badCount ^ length < Fintype.card Outcome ^ length) :
    ∃ sequence : Fin length → Outcome, ∀ point, ∃ j, ¬ bad (sequence j) point := by
  classical
  by_contra noCover
  push_neg at noCover
  have positive : ∀ sequence : Fin length → Outcome,
      1 ≤ ∑ point : Point, if ∀ j, bad (sequence j) point then 1 else 0 := by
    intro sequence
    obtain ⟨point, hpoint⟩ := noCover sequence
    have one := Finset.single_le_sum
      (f := fun point : Point => if ∀ j, bad (sequence j) point then (1 : ℕ) else 0)
      (fun _ _ => Nat.zero_le _) (Finset.mem_univ point)
    simpa [hpoint] using one
  have upper : ∀ point : Point,
      (∑ sequence : Fin length → Outcome, if ∀ j, bad (sequence j) point then (1 : ℕ) else 0)
        ≤ badCount ^ length := by
    intro point
    calc
      _ = Nat.card {sequence : Fin length → Outcome // ∀ j, bad (sequence j) point} := by
        simp [Nat.card_eq_fintype_card, Fintype.card_subtype]
      _ = _ := missed_sequence_count bad point length
      _ ≤ _ := Nat.pow_le_pow_left (perPoint point) length
  have bound : Fintype.card Outcome ^ length ≤ Fintype.card Point * badCount ^ length := by
    calc
      _ = ∑ _sequence : Fin length → Outcome, (1 : ℕ) := by simp
      _ ≤ ∑ sequence : Fin length → Outcome,
          ∑ point : Point, if ∀ j, bad (sequence j) point then 1 else 0 :=
        Finset.sum_le_sum (fun sequence _ => positive sequence)
      _ = ∑ point : Point, ∑ sequence : Fin length → Outcome,
          if ∀ j, bad (sequence j) point then 1 else 0 := Finset.sum_comm
      _ ≤ ∑ _point : Point, badCount ^ length := Finset.sum_le_sum (fun point _ => upper point)
      _ = _ := by simp
  exact (Nat.not_lt_of_ge bound) small

#print axioms exists_cover

end
end MatrixBounds.Cover
