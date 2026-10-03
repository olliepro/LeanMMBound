module

public import RationalLogExpressions
public import CWRationalRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact symbolic expansion of the actual coarse Gibbs retention formula,
including all admissible splits and all three marginal expectations. -/
namespace MatrixBounds.Numeric

open Entropy Empirical Tensor.CW
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Rational coordinate marginal, preserving every source label in the finite sum. -/
def rationalMarginal {I B : Type*} [Fintype I] (mass : I → ℚ) (coordinate : I → B) (label : B) : ℚ :=
  ∑ index, if coordinate index = label then mass index else 0

/-- The exact rational marginal casts to the actual real coordinate marginal. -/
theorem rationalMarginal_cast {I B : Type*} [Fintype I]
    (mass : I → ℚ) (coordinate : I → B) (label : B) :
    (rationalMarginal mass coordinate label : ℝ) = marginal (fun index => (mass index : ℝ)) coordinate label := by
  simp only [rationalMarginal, marginal, Rat.cast_sum, apply_ite, Rat.cast_zero]

/-- Symbolic rational expectation of a logarithmic potential over a finite coordinate alphabet. -/
def logExpectationExpression {n : ℕ} (mass potential : Fin n → ℚ) : RationalLogExpression :=
  finiteLogSum (fun index => logAtom (potential index) (mass index))

/-- The expanded potential expression equals its full actual real expectation. -/
theorem logExpectationExpression_value {n : ℕ} (mass potential : Fin n → ℚ) :
    rationalLogValue (logExpectationExpression mass potential) =
      ∑ index, (mass index : ℝ)*Real.log (potential index : ℝ) := by
  simp only [logExpectationExpression, finiteLogSum_value, logAtom_value]

/-- Rational Gibbs normalizer over exactly the admissible complementary splits. -/
def rationalGibbsNormalizer {length : ℕ} (parent : Shape)
    (ux uy uz : Fin (2*length+1) → ℚ) : ℚ :=
  ∑ child : SplitAlphabet parent (2*length),
    ux (splitXIndex child)*uy (splitYIndex child)*uz (splitZIndex child)

/-- The rational normalizer is exactly the sum appearing in the actual Gibbs bound. -/
theorem rationalGibbsNormalizer_cast {length : ℕ} (parent : Shape)
    (ux uy uz : Fin (2*length+1) → ℚ) :
    (rationalGibbsNormalizer parent ux uy uz : ℝ) =
      ∑ child : SplitAlphabet parent (2*length),
        (ux (splitXIndex child) : ℝ)*(uy (splitYIndex child) : ℝ)*(uz (splitZIndex child) : ℝ) := by
  simp only [rationalGibbsNormalizer, Rat.cast_sum, Rat.cast_mul]

/-- Entropy is unchanged by the explicitly supplied bijective enumeration of its complete alphabet. -/
theorem entropy_enumeration {I : Type*} [Fintype I] {n : ℕ}
    (enumeration : Fin n ≃ I) (mass : I → ℝ) :
    entropy (fun index => mass (enumeration index)) = entropy mass :=
  congrArg Neg.neg (Equiv.sum_comp enumeration (fun index => mass index*Real.log (mass index)))

/-- Expand the actual fixed coarse-retention formula into finite exact rational logarithmic terms. -/
def coarseRetentionExpression {length n : ℕ} (parent : Shape)
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (ux uy uz : Fin (2*length+1) → ℚ) (enumeration : Fin n ≃ ShapeAlphabet (2*length)) :
    RationalLogExpression :=
  let mass := fun child => (numerator child : ℚ)/denominator
  entropyLogExpression (rationalMarginal mass shapeXIndex)++
    entropyLogExpression (fun index => mass (enumeration index))++
    logAtom (rationalGibbsNormalizer parent ux uy uz) (-1)++
    logExpectationExpression (rationalMarginal mass shapeXIndex) ux++
    logExpectationExpression (rationalMarginal mass shapeYIndex) uy++
    logExpectationExpression (rationalMarginal mass shapeZIndex) uz

/-- Every symbolic coarse-retention term is exactly its actual complete-alphabet extraction rate. -/
theorem coarseRetentionExpression_value {length n : ℕ} (parent : Shape)
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (ux uy uz : Fin (2*length+1) → ℚ) (enumeration : Fin n ≃ ShapeAlphabet (2*length)) :
    rationalLogValue (coarseRetentionExpression parent numerator denominator ux uy uz enumeration) =
      SplitRestrictionData.rationalCoarseRetention parent numerator denominator
        (fun value => (ux value : ℝ)) (fun value => (uy value : ℝ)) (fun value => (uz value : ℝ)) := by
  simp only [coarseRetentionExpression, rationalLogValue_append, entropyLogExpression_value,
    logAtom_value, logExpectationExpression_value, rationalGibbsNormalizer_cast,
    Rat.cast_neg, Rat.cast_one, neg_one_mul]
  simp_rw [rationalMarginal_cast]
  simp only [Rat.cast_div, Rat.cast_natCast]
  rw [entropy_enumeration enumeration (fun child => (numerator child : ℝ)/denominator)]
  unfold SplitRestrictionData.rationalCoarseRetention
  dsimp only
  simp only [entropy, marginal]
  ring

end
end MatrixBounds.Numeric
