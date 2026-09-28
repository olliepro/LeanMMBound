import CertifiedLogQuery

/-! Checked rational linear combinations of actual real logarithms. Each block
checks its inputs, its analytic witnesses, and its complete summed enclosure. -/
namespace MatrixBounds.Numeric

/-- Multiply interval endpoints by a rational, with one sign test and two products. -/
def Interval.signedScale (coefficient : ℚ) (bounds : Interval) : Interval :=
  if 0 ≤ coefficient then ⟨coefficient*bounds.lower, coefficient*bounds.upper⟩
  else ⟨coefficient*bounds.upper, coefficient*bounds.lower⟩

/-- The efficient signed scaling operation encloses the true scaled real value. -/
theorem Interval.signedScale_sound (coefficient : ℚ) {bounds : Interval} {value : ℝ}
    (inside : bounds.Contains value) :
    (signedScale coefficient bounds).Contains ((coefficient : ℝ)*value) := by
  unfold signedScale
  split_ifs with nonnegative
  · have positive : (0 : ℝ) ≤ coefficient := by exact_mod_cast nonnegative
    unfold Contains
    push_cast
    exact ⟨mul_le_mul_of_nonneg_left inside.1 positive,
      mul_le_mul_of_nonneg_left inside.2 positive⟩
  · have negative : (coefficient : ℝ) ≤ 0 := by exact_mod_cast (le_of_not_ge nonnegative)
    unfold Contains
    push_cast
    exact ⟨mul_le_mul_of_nonpos_left inside.2 negative,
      mul_le_mul_of_nonpos_left inside.1 negative⟩

/-- One weighted logarithm, including a checkable witness for its actual argument. -/
structure WeightedLogQuery where
  coefficient : ℚ
  query : LogQuery

/-- The real value represented by a weighted logarithm record. -/
noncomputable def WeightedLogQuery.value (term : WeightedLogQuery) : ℝ :=
  (term.coefficient : ℝ)*Real.log (term.query.input : ℝ)

/-- The rational enclosure obtained from a weighted record's proposed log interval. -/
def WeightedLogQuery.bounds (term : WeightedLogQuery) : Interval :=
  Interval.signedScale term.coefficient term.query.bounds

/-- Every accepted logarithm witness also proves its complete signed weighted contribution. -/
theorem WeightedLogQuery.sound (term : WeightedLogQuery) (checked : term.query.check = true) :
    term.bounds.Contains term.value := Interval.signedScale_sound _ (term.query.sound checked)

/-- The exact real sum of a finite sequence of rationally weighted logarithms. -/
noncomputable def logLinearValue : List WeightedLogQuery → ℝ
  | [] => 0
  | term :: rest => term.value+logLinearValue rest

/-- Sum all proposed weighted enclosures with exact rational arithmetic. -/
def logLinearBounds : List WeightedLogQuery → Interval
  | [] => Interval.point 0
  | term :: rest => term.bounds.add (logLinearBounds rest)

/-- Check every logarithm reduction and every individual outward enclosure in a block. -/
def logLinearCheck : List WeightedLogQuery → Bool
  | [] => true
  | term :: rest => term.query.check && logLinearCheck rest

/-- A completely checked block encloses the sum of the actual real logarithmic terms. -/
theorem logLinearBounds_sound (terms : List WeightedLogQuery) (checked : logLinearCheck terms = true) :
    (logLinearBounds terms).Contains (logLinearValue terms) := by
  induction terms with
  | nil => simpa only [logLinearBounds, logLinearValue, Rat.cast_zero] using Interval.point_sound 0
  | cons term rest induction =>
    have facts : term.query.check = true ∧ logLinearCheck rest = true := by
      simpa only [logLinearCheck, Bool.and_eq_true] using checked
    exact Interval.add_sound (term.sound facts.1) (induction facts.2)

/-- Concatenating numerical blocks preserves their exact real sum. -/
theorem logLinearValue_append (left right : List WeightedLogQuery) :
    logLinearValue (left++right) = logLinearValue left+logLinearValue right := by
  induction left with
  | nil => simp only [List.nil_append, logLinearValue, zero_add]
  | cons term rest induction => simp only [List.cons_append, logLinearValue, induction, add_assoc]

/-- A stored outward-rounded block interval is sound after both finite checks pass. -/
theorem logLinearCertificate_sound (terms : List WeightedLogQuery) (reported : Interval)
    (termsChecked : logLinearCheck terms = true)
    (boundsChecked : reported.encloses (logLinearBounds terms) = true) :
    reported.Contains (logLinearValue terms) :=
  Interval.encloses_sound boundsChecked (logLinearBounds_sound terms termsChecked)

end MatrixBounds.Numeric
