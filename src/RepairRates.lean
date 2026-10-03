module

public import SparseRepair
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Positivity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit integer schedules for subexponential repair.
We use the unbounded subsequence N(k) = k*2^k, avoiding informal logarithmic
rounding. With at most 2^(C*N) coordinate triples and failure fraction ≤ 2^(-k),
L(k) = C*2^k+1 outcomes suffice. The repair-copy count 2^(3L(k)) is proved
subexponential relative to N(k), by a quantified inequality for every accuracy.
The `CW*` and `Supplied*` modules instantiate these bounds for the actual mixed-level interfaces. -/

namespace MatrixBounds.RepairRates

/-- Growing tensor-power sizes on which the integer cover estimate is exact. -/
def scale (k : ℕ) : ℕ := k * 2 ^ k

/-- Number of selected outcomes sufficient for an exponentially sized coordinate cube. -/
def coverLength (growth k : ℕ) : ℕ := growth * 2 ^ k + 1

/-- The chosen subsequence exceeds its index, so it is unbounded. -/
theorem index_le_scale (k : ℕ) : k ≤ scale k := by
  have hpow : 1 ≤ 2 ^ k := Nat.one_le_pow k 2 (by omega)
  unfold scale
  nlinarith

/-- A strict exponent margin pays for the finite union bound. -/
theorem cover_exponent_gap (growth k : ℕ) (positive : 0 < k) :
    growth * scale k < k * coverLength growth k := by
  unfold scale coverLength
  nlinarith

/-- Explicit finite union-bound inequality, retaining integer rounding and zero failures. -/
theorem cover_count_small (growth k points bad outcomes : ℕ) (positive : 0 < k)
    (outcomes_positive : 0 < outcomes)
    (point_bound : points ≤ 2 ^ (growth * scale k))
    (failure_bound : 2 ^ k * bad ≤ outcomes) :
    points * bad ^ coverLength growth k < outcomes ^ coverLength growth k := by
  by_cases hbad : bad = 0
  · subst bad
    have hp : 0 < outcomes ^ coverLength growth k := pow_pos outcomes_positive _
    simpa [coverLength] using hp
  · have hbadpos : 0 < bad ^ coverLength growth k := pow_pos (Nat.pos_of_ne_zero hbad) _
    calc
      _ ≤ 2 ^ (growth * scale k) * bad ^ coverLength growth k :=
        Nat.mul_le_mul_right _ point_bound
      _ < 2 ^ (k * coverLength growth k) * bad ^ coverLength growth k :=
        Nat.mul_lt_mul_of_pos_right
          (Nat.pow_lt_pow_right (by omega) (cover_exponent_gap growth k positive)) hbadpos
      _ = (2 ^ k * bad) ^ coverLength growth k := by rw [mul_pow, ← pow_mul]
      _ ≤ _ := Nat.pow_le_pow_left failure_bound _

/-- Quantitative vanishing repair exponent; the threshold is fully explicit. -/
theorem repair_exponent_small (growth accuracy k : ℕ)
    (large : 3 * accuracy * (growth + 1) ≤ k) :
    accuracy * (3 * coverLength growth k) ≤ scale k := by
  have hpow : 1 ≤ 2 ^ k := Nat.one_le_pow k 2 (by omega)
  have multiplied := Nat.mul_le_mul_right (2 ^ k) large
  unfold scale coverLength
  nlinarith

/-- Subexponential copy cost: for every positive accuracy, eventually copies^accuracy ≤ 2^N.
This is an exact natural-number formulation of log₂(copies)/N tending to zero. -/
theorem repair_cost_subexponential (growth accuracy : ℕ) :
    ∃ threshold, ∀ k ≥ threshold,
      (2 ^ (3 * coverLength growth k)) ^ accuracy ≤ 2 ^ scale k := by
  refine ⟨3 * accuracy * (growth + 1), ?_⟩
  intro k hk
  rw [← pow_mul]
  apply Nat.pow_le_pow_right (by omega)
  simpa only [Nat.mul_comm] using repair_exponent_small growth accuracy k hk

/-- Inverse-square holes imply the failure fraction required by the explicit schedule. -/
theorem inverse_square_failure (k bad outcomes : ℕ) (large : 2 ≤ k)
    (holes : bad * scale k ^ 2 ≤ 3 * outcomes) : 2 ^ k * bad ≤ outcomes := by
  have hpow : 1 ≤ 2 ^ k := Nat.one_le_pow k 2 (by omega)
  have hn : 2 * 2 ^ k ≤ scale k := Nat.mul_le_mul_right (2 ^ k) large
  have square : 3 * 2 ^ k ≤ scale k ^ 2 := by nlinarith
  have multiplied := Nat.mul_le_mul_left bad square
  nlinarith

open Tensor Tensor.Repair

/-- A concrete sparse-hole repair schedule with no unproved asymptotic counting step.
At N = k*2^k, each axis may miss at most a 1/N² fraction of outcomes. With an
exponentially bounded coordinate cube, this constructs repair maps using the
subexponential number of sources quantified by `repair_cost_subexponential`. -/
theorem inverse_square_repair {K X Y Z Outcome : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z] [Fintype Outcome] [Nonempty Outcome]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (growth k bx by_ bz : ℕ) (large : 2 ≤ k)
    (missX : ∀ x, Nat.card {outcome // kx outcome x ≠ true} ≤ bx)
    (missY : ∀ y, Nat.card {outcome // ky outcome y ≠ true} ≤ by_)
    (missZ : ∀ z, Nat.card {outcome // kz outcome z ≠ true} ≤ bz)
    (smallX : bx * scale k ^ 2 ≤ Fintype.card Outcome)
    (smallY : by_ * scale k ^ 2 ≤ Fintype.card Outcome)
    (smallZ : bz * scale k ^ 2 ≤ Fintype.card Outcome)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k)) :
    Nonempty (RepairCertificate tensor kx ky kz (coverLength growth k)) := by
  classical
  have failure : 2 ^ k * (bx + by_ + bz) ≤ Fintype.card Outcome :=
    inverse_square_failure k _ _ large (by nlinarith)
  apply repair_certificate_from_counts tensor kx ky kz (bx + by_ + bz)
    (coverLength growth k) (by unfold coverLength; omega) ?_
    (cover_count_small growth k _ _ _ (by omega) Fintype.card_pos size failure)
  intro x y z
  exact le_trans (three_axis_union_bound (fun outcome => kx outcome x = true)
    (fun outcome => ky outcome y = true) (fun outcome => kz outcome z = true))
    (Nat.add_le_add (Nat.add_le_add (missX x) (missY y)) (missZ z))

/-- Inverse-linear hole fractions suffice once the scale index absorbs their fixed constant. -/
theorem inverse_linear_failure (k constant bad outcomes : ℕ) (positive : 0 < k)
    (large : constant ≤ k) (holes : bad * scale k ≤ constant * outcomes) :
    2 ^ k * bad ≤ outcomes := by
  have bound := holes.trans (Nat.mul_le_mul_right outcomes large)
  unfold scale at bound
  have rearranged : k * (2 ^ k * bad) ≤ k * outcomes := by nlinarith [bound]
  exact Nat.le_of_mul_le_mul_left rearranged positive

/-- Sparse repair only requires inverse-linear holes, with an explicit constant-dependent threshold.
This weaker hypothesis supports a second-moment concentration route for parent types. -/
theorem inverse_linear_repair {K X Y Z Outcome : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z] [Fintype Outcome] [Nonempty Outcome]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z)
    (kx : Outcome → X → Bool) (ky : Outcome → Y → Bool) (kz : Outcome → Z → Bool)
    (growth k constant bx by_ bz : ℕ) (positive : 0 < k) (large : 3 * constant ≤ k)
    (missX : ∀ x, Nat.card {outcome // kx outcome x ≠ true} ≤ bx)
    (missY : ∀ y, Nat.card {outcome // ky outcome y ≠ true} ≤ by_)
    (missZ : ∀ z, Nat.card {outcome // kz outcome z ≠ true} ≤ bz)
    (smallX : bx * scale k ≤ constant * Fintype.card Outcome)
    (smallY : by_ * scale k ≤ constant * Fintype.card Outcome)
    (smallZ : bz * scale k ≤ constant * Fintype.card Outcome)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k)) :
    Nonempty (RepairCertificate tensor kx ky kz (coverLength growth k)) := by
  classical
  have failure : 2 ^ k * (bx + by_ + bz) ≤ Fintype.card Outcome :=
    inverse_linear_failure k (3*constant) _ _ positive large (by nlinarith)
  apply repair_certificate_from_counts tensor kx ky kz (bx + by_ + bz)
    (coverLength growth k) (by unfold coverLength; omega) ?_
    (cover_count_small growth k _ _ _ positive Fintype.card_pos size failure)
  intro x y z
  exact le_trans (three_axis_union_bound (fun outcome => kx outcome x = true)
    (fun outcome => ky outcome y = true) (fun outcome => kz outcome z = true))
    (Nat.add_le_add (Nat.add_le_add (missX x) (missY y)) (missZ z))

#print axioms cover_count_small
#print axioms repair_cost_subexponential
#print axioms inverse_square_repair

end MatrixBounds.RepairRates
