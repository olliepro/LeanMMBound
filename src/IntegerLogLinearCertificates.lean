module

public import IntegerLogQuery

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Weighted logarithm certificates whose complete checks use integer
arithmetic. The soundness conclusion is still about exact real logarithms. -/
namespace MatrixBounds.Numeric

/-- One exact signed rational coefficient and a witnessed exact logarithm input. -/
structure IntegerLogTerm where
  coefficient : ℤ
  denominator : ℕ
  query : IntegerLogQuery

/-- The actual real weighted logarithm represented by one integer record. -/
noncomputable def IntegerLogTerm.value (term : IntegerLogTerm) : ℝ :=
  ((term.coefficient : ℝ)/term.denominator)*Real.log (term.query.input : ℝ)

/-- Verify the coefficient denominator and the exact integer logarithm witness. -/
def IntegerLogTerm.check (term : IntegerLogTerm) : Bool :=
  decide (0 < term.denominator) && term.query.check

/-- Enclose one signed rational contribution at the common 60-bit output scale. -/
def IntegerLogTerm.bounds (term : IntegerLogTerm) : FixedBounds :=
  FixedBounds.scaleRatio term.coefficient term.denominator term.query.bounds

/-- A fully accepted record encloses its actual signed weighted logarithm. -/
theorem IntegerLogTerm.sound (term : IntegerLogTerm) (checked : term.check = true) :
    (term.bounds.interval (2^60)).Contains term.value := by
  have facts : 0 < term.denominator ∧ term.query.check = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  exact FixedBounds.scaleRatio_sound term.coefficient facts.1 (by positivity) (term.query.sound facts.2)

/-- Exact real sum of the terms of an integer-certified logarithmic block. -/
noncomputable def integerLogValue : List IntegerLogTerm → ℝ
  | [] => 0
  | term :: rest => term.value+integerLogValue rest

/-- Integer-only sum of all outward-rounded contribution endpoints. -/
def integerLogBounds : List IntegerLogTerm → FixedBounds
  | [] => ⟨0, 0⟩
  | term :: rest => term.bounds.add (integerLogBounds rest)

/-- Integer-only validation of all coefficients and logarithm witnesses in a complete block. -/
def integerLogCheck : List IntegerLogTerm → Bool
  | [] => true
  | term :: rest => term.check && integerLogCheck rest

/-- The complete integer computation encloses the actual finite real logarithmic expression. -/
theorem integerLogBounds_sound (terms : List IntegerLogTerm) (checked : integerLogCheck terms = true) :
    ((integerLogBounds terms).interval (2^60)).Contains (integerLogValue terms) := by
  induction terms with
  | nil => norm_num [integerLogValue, integerLogBounds, FixedBounds.interval, Interval.Contains]
  | cons term rest induction =>
    have facts : term.check = true ∧ integerLogCheck rest = true := by
      simpa only [integerLogCheck, Bool.and_eq_true] using checked
    exact FixedBounds.add_sound (term.sound facts.1) (induction facts.2)

/-- Exact block concatenation gives the sum of the two represented real logarithmic expressions. -/
theorem integerLogValue_append (left right : List IntegerLogTerm) :
    integerLogValue (left++right) = integerLogValue left+integerLogValue right := by
  induction left with
  | nil => simp only [List.nil_append, integerLogValue, zero_add]
  | cons term rest induction => simp only [List.cons_append, integerLogValue, induction, add_assoc]

/-- A checked reported pair of integer endpoints certifies the whole block's actual real value. -/
theorem integerLogCertificate_sound (terms : List IntegerLogTerm) (reported : FixedBounds)
    (termsChecked : integerLogCheck terms = true)
    (boundsChecked : integerLogBounds terms = reported) :
    (reported.interval (2^60)).Contains (integerLogValue terms) := by
  rw [← boundsChecked]
  exact integerLogBounds_sound terms termsChecked

end MatrixBounds.Numeric
