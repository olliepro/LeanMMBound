module

public import CWRationalMixedRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact integer population propagation through a paired split. A fixed
denominator divisibility choice makes all subsequent child populations linear
in the same unbounded scale, including the zero-weight child pools. -/
namespace MatrixBounds.Tensor.CW.RationalSplit

open Empirical Numeric
open scoped BigOperators
noncomputable section
variable {length denominator : ℕ}

/-- The integer population coefficient of one child after a fixed rational parent split. -/
def childWeight (split : RationalSplit length denominator) (weight : ℕ) (child : ShapeAlphabet (2*length)) : ℕ :=
  2*((weight/denominator)*split.numerator child)

/-- If the parent coefficient is divisible, every actual child pool has the fixed coefficient times the same scale. -/
theorem child_population (split : RationalSplit length denominator) {weight : ℕ}
    (divisible : denominator ∣ weight) (size : ℕ) (child : ShapeAlphabet (2*length)) :
    2*(split.data (weight*size)).split child = split.childWeight weight child*size := by
  change 2*((weight*size/denominator)*split.numerator child) = 2*((weight/denominator)*split.numerator child)*size
  rw [Nat.mul_comm weight size, Nat.mul_div_assoc size divisible]
  ring

/-- The complete child population is exactly twice the parent population coefficient. -/
theorem childWeight_total (split : RationalSplit length denominator) {weight : ℕ}
    (divisible : denominator ∣ weight) : (∑ child, split.childWeight weight child) = 2*weight := by
  unfold childWeight
  rw [← Finset.mul_sum, ← Finset.mul_sum, split.normalized, Nat.div_mul_cancel divisible]

/-- Child coefficient positivity is equivalent to positive split mass when the parent coefficient is positive and divisible. -/
theorem childWeight_positive (split : RationalSplit length denominator) {weight : ℕ}
    (weightPositive : 0 < weight) (divisible : denominator ∣ weight) (child : ShapeAlphabet (2*length)) :
    0 < split.childWeight weight child ↔ 0 < split.numerator child := by
  have factorPositive : 0 < weight/denominator := by
    have factor := Nat.div_mul_cancel divisible
    by_contra absent
    have zero : weight/denominator = 0 := Nat.eq_zero_of_not_pos absent
    rw [zero, zero_mul] at factor
    omega
  constructor
  · intro positive
    exact Nat.pos_of_mul_pos_left (Nat.pos_of_mul_pos_left positive)
  · intro positive
    exact Nat.mul_pos (by decide) (Nat.mul_pos factorPositive positive)

end
end MatrixBounds.Tensor.CW.RationalSplit
