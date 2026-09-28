import IntegerLogLinearCertificates
import FiniteOrbitData
import Mathlib.Algebra.BigOperators.Fin

/-! Exact symbolic logarithmic expressions connect finite entropy formulas to
the real values represented by the numerical certificates. -/
namespace MatrixBounds.Numeric

open Entropy
open scoped BigOperators

/-- One exact rational coefficient multiplying the logarithm of an exact rational argument. -/
structure LogMonomial where
  argument : ℚ
  coefficient : ℚ
  deriving DecidableEq

/-- Actual real interpretation of an exact logarithmic monomial. -/
noncomputable def LogMonomial.value (term : LogMonomial) : ℝ :=
  (term.coefficient : ℝ)*Real.log (term.argument : ℝ)

/-- An ordered exact expression, retaining all source terms until a proved simplification is applied. -/
abbrev RationalLogExpression := List LogMonomial

/-- Interpret the complete finite expression as an actual real sum. -/
noncomputable def rationalLogValue (expression : RationalLogExpression) : ℝ :=
  (expression.map LogMonomial.value).sum

/-- A single logarithmic term, eliminating exactly the three trivially zero cases. -/
def logAtom (argument coefficient : ℚ) : RationalLogExpression :=
  if argument = 0 ∨ argument = 1 ∨ coefficient = 0 then [] else [⟨argument, coefficient⟩]

/-- Exact zero elimination preserves the full real logarithmic term. -/
theorem logAtom_value (argument coefficient : ℚ) :
    rationalLogValue (logAtom argument coefficient) = (coefficient : ℝ)*Real.log (argument : ℝ) := by
  unfold logAtom
  split_ifs with trivial
  · rcases trivial with zero | one | zero
    · simp [rationalLogValue, zero]
    · simp [rationalLogValue, one]
    · simp [rationalLogValue, zero]
  · simp [rationalLogValue, LogMonomial.value]

/-- Concatenation is exact addition of the represented real expressions. -/
theorem rationalLogValue_append (left right : RationalLogExpression) :
    rationalLogValue (left++right) = rationalLogValue left+rationalLogValue right := by
  simp only [rationalLogValue, List.map_append, List.sum_append]

/-- Scale every exact coefficient by a rational, preserving all original arguments. -/
def scaleLogExpression (coefficient : ℚ) (expression : RationalLogExpression) : RationalLogExpression :=
  expression.map (fun term => ⟨term.argument, coefficient*term.coefficient⟩)

/-- Exact symbolic scaling has the intended real linear interpretation. -/
theorem scaleLogExpression_value (coefficient : ℚ) (expression : RationalLogExpression) :
    rationalLogValue (scaleLogExpression coefficient expression) = (coefficient : ℝ)*rationalLogValue expression := by
  induction expression with
  | nil => simp [scaleLogExpression, rationalLogValue]
  | cons term rest induction =>
    simp only [scaleLogExpression, rationalLogValue, List.map_cons, List.sum_cons,
      LogMonomial.value, Rat.cast_mul] at induction ⊢
    rw [induction]
    ring

/-- Concatenate a finite list of exact expressions without losing any source term. -/
def sumLogExpressions : List RationalLogExpression → RationalLogExpression
  | [] => []
  | expression :: rest => expression++sumLogExpressions rest

/-- Concatenating finitely many expressions gives their exact real sum. -/
theorem sumLogExpressions_value (expressions : List RationalLogExpression) :
    rationalLogValue (sumLogExpressions expressions) = (expressions.map rationalLogValue).sum := by
  induction expressions with
  | nil => simp [sumLogExpressions, rationalLogValue]
  | cons expression rest induction =>
    simp only [sumLogExpressions, rationalLogValue_append, induction, List.map_cons, List.sum_cons]

/-- Expand a finite indexed sum into exact logarithmic terms. -/
def finiteLogSum {n : ℕ} (expression : Fin n → RationalLogExpression) : RationalLogExpression :=
  sumLogExpressions (List.ofFn expression)

/-- Symbolic finite indexed sums agree exactly with their real finite sums. -/
theorem finiteLogSum_value {n : ℕ} (expression : Fin n → RationalLogExpression) :
    rationalLogValue (finiteLogSum expression) = ∑ index, rationalLogValue (expression index) := by
  rw [finiteLogSum, sumLogExpressions_value, List.map_ofFn, Fin.sum_ofFn]
  rfl

/-- Exact symbolic entropy, including zero masses without any logarithm witness for zero. -/
def entropyLogExpression {n : ℕ} (mass : Fin n → ℚ) : RationalLogExpression :=
  finiteLogSum (fun index => logAtom (mass index) (-mass index))

/-- Expanding entropy into logarithmic terms preserves the actual complete finite entropy. -/
theorem entropyLogExpression_value {n : ℕ} (mass : Fin n → ℚ) :
    rationalLogValue (entropyLogExpression mass) = entropy (fun index => (mass index : ℝ)) := by
  simp only [entropyLogExpression, finiteLogSum_value, logAtom_value, Rat.cast_neg, neg_mul,
    Finset.sum_neg_distrib, entropy]

/-- Exact symbolic unnormalized entropy, including its total-mass logarithm. -/
def massEntropyLogExpression {n : ℕ} (mass : Fin n → ℚ) : RationalLogExpression :=
  entropyLogExpression mass++logAtom (∑ index, mass index) (∑ index, mass index)

/-- The complete symbolic pool expression equals its true unnormalized entropy, including empty pools. -/
theorem massEntropyLogExpression_value {n : ℕ} (mass : Fin n → ℚ) :
    rationalLogValue (massEntropyLogExpression mass) = massEntropy (fun index => (mass index : ℝ)) := by
  simp only [massEntropyLogExpression, rationalLogValue_append, entropyLogExpression_value,
    logAtom_value, Rat.cast_sum, massEntropy]

/-- Symbolic correction from compressed orbit masses to the complete word entropy. -/
def orbitCorrectionExpression {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) : RationalLogExpression :=
  finiteLogSum (fun index => logAtom (sizes index) (mass index))

/-- Orbit correction terms represent exactly the expected logarithm of the true orbit sizes. -/
theorem orbitCorrectionExpression_value {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) :
    rationalLogValue (orbitCorrectionExpression mass sizes) = ∑ index, (mass index : ℝ)*Real.log (sizes index) := by
  simp only [orbitCorrectionExpression, finiteLogSum_value, logAtom_value, Rat.cast_natCast]

/-- Complete entropy of a decoded word distribution as an exact finite symbolic expression. -/
def orbitEntropyExpression {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) : RationalLogExpression :=
  entropyLogExpression mass++orbitCorrectionExpression mass sizes

/-- The symbolic compressed expression is the actual full-word entropy, with no compressed-entropy assumption. -/
theorem orbitEntropyExpression_value {Word : Type*} [Fintype Word] {n : ℕ}
    (partition : OrbitMap Word (Fin n)) (mass : Fin n → ℚ) :
    rationalLogValue (orbitEntropyExpression mass partition.size) =
      entropy (partition.decode (fun index => (mass index : ℝ))) := by
  rw [partition.decode_entropy]
  simp only [orbitEntropyExpression, rationalLogValue_append,
    entropyLogExpression_value, orbitCorrectionExpression_value]

/-- Extract the exact symbolic monomial represented by a checked integer numerical term. -/
def IntegerLogTerm.monomial (term : IntegerLogTerm) : LogMonomial :=
  ⟨term.query.input, (term.coefficient : ℚ)/term.denominator⟩

/-- Integer coefficient representation preserves the monomial's exact real value. -/
theorem IntegerLogTerm.monomial_value (term : IntegerLogTerm) : term.monomial.value = term.value := by
  simp only [monomial, LogMonomial.value, IntegerLogTerm.value, Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast]

/-- A checked integer block's value is exactly the value of its complete rational symbolic expression. -/
theorem integerLogValue_expression (terms : List IntegerLogTerm) :
    integerLogValue terms = rationalLogValue (terms.map IntegerLogTerm.monomial) := by
  induction terms with
  | nil => simp [integerLogValue, rationalLogValue]
  | cons term rest induction =>
    simp only [integerLogValue, rationalLogValue, List.map_cons, List.sum_cons,
      IntegerLogTerm.monomial_value] at induction ⊢
    rw [induction]

end MatrixBounds.Numeric
