import RootCoarseEnumeration
import CWShapePermutations

/-! Exact finite-column expansion of a paired coarse Gibbs rate, with an
explicit admissibility filter on the original complete shape enumeration. -/
namespace MatrixBounds.Numeric.PairedCoarseColumns

open Tensor.CW Entropy Empirical
open scoped BigOperators
noncomputable section

/-- The finite-column coarse marginal retains every original shape probability. -/
def marginal {length n : ℕ} (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (mass : Fin n → ℚ) (axis : Fin 3) (value : Fin (2*length+1)) : ℚ :=
  ∑ column, if shapeCoordinate (enumeration column) axis = value then mass column else 0

/-- The complete Gibbs normalizer includes precisely the finite columns fitting the actual parent. -/
def normalizer {length n : ℕ} (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (potential : Fin 3 → Fin (2*length+1) → ℚ) : ℚ :=
  ∑ column, if (enumeration column).val.Fits parent then
    potential 0 (shapeCoordinate (enumeration column) 0)*potential 1 (shapeCoordinate (enumeration column) 1)*
      potential 2 (shapeCoordinate (enumeration column) 2) else 0

/-- Every coarse marginal, joint entropy, potential expectation, and Gibbs normalizer becomes an exact expression. -/
def expression {length n : ℕ} (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (mass : Fin n → ℚ) (potential : Fin 3 → Fin (2*length+1) → ℚ) : RationalLogExpression :=
  entropyLogExpression (marginal enumeration mass 0)++entropyLogExpression mass++
    logAtom (normalizer parent enumeration potential) (-1)++
    logExpectationExpression (marginal enumeration mass 0) (potential 0)++
    logExpectationExpression (marginal enumeration mass 1) (potential 1)++
    logExpectationExpression (marginal enumeration mass 2) (potential 2)

/-- Finite-column marginalization agrees exactly with marginalizing the complete original alphabet. -/
theorem marginal_eq {length n : ℕ} (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ) (axis : Fin 3) :
    rationalMarginal (fun child => (numerator child : ℚ)/denominator)
      (fun child => shapeCoordinate child axis) =
    marginal enumeration (fun column => (numerator (enumeration column) : ℚ)/denominator) axis := by
  funext value
  exact rationalMarginal_enumeration enumeration _ _ value

/-- Filtering complete finite columns is exactly the Gibbs sum over admissible split children. -/
theorem normalizer_eq {length n : ℕ} (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (potential : Fin 3 → Fin (2*length+1) → ℚ) :
    rationalGibbsNormalizer parent (potential 0) (potential 1) (potential 2) = normalizer parent enumeration potential := by
  classical
  let term := fun child : ShapeAlphabet (2*length) =>
    potential 0 (shapeCoordinate child 0)*potential 1 (shapeCoordinate child 1)*potential 2 (shapeCoordinate child 2)
  have filtered := Finset.sum_subtype (F := inferInstance) (Finset.univ.filter (fun child : ShapeAlphabet (2*length) => child.val.Fits parent))
    (by simp : ∀ child : ShapeAlphabet (2*length), child ∈ Finset.univ.filter (fun child => child.val.Fits parent) ↔ child.val.Fits parent) term
  rw [Finset.sum_filter] at filtered
  calc
    _ = ∑ child : ShapeAlphabet (2*length), if child.val.Fits parent then term child else 0 := filtered.symm
    _ = _ := (enumeration.sum_comp (fun child => if child.val.Fits parent then term child else 0)).symm

/-- Finite original columns give exactly the complete paired coarse-retention expression. -/
theorem expression_eq {length n : ℕ} (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (potential : Fin 3 → Fin (2*length+1) → ℚ) :
    coarseRetentionExpression parent numerator denominator (potential 0) (potential 1) (potential 2) enumeration =
      expression parent enumeration (fun column => (numerator (enumeration column) : ℚ)/denominator) potential := by
  unfold coarseRetentionExpression expression
  dsimp only
  have mx := marginal_eq enumeration numerator denominator 0
  have my := marginal_eq enumeration numerator denominator 1
  have mz := marginal_eq enumeration numerator denominator 2
  change rationalMarginal _ shapeXIndex = _ at mx
  change rationalMarginal _ shapeYIndex = _ at my
  change rationalMarginal _ shapeZIndex = _ at mz
  rw [mx, my, mz, normalizer_eq]

/-- The executable finite-column expression has the actual complete rational coarse rate as its real value. -/
theorem expression_value {length n : ℕ} (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (potential : Fin 3 → Fin (2*length+1) → ℚ) :
    rationalLogValue (expression parent enumeration (fun column => (numerator (enumeration column) : ℚ)/denominator) potential) =
      SplitRestrictionData.rationalCoarseRetention parent numerator denominator
        (fun value => (potential 0 value : ℝ)) (fun value => (potential 1 value : ℝ)) (fun value => (potential 2 value : ℝ)) := by
  rw [← expression_eq]
  exact coarseRetentionExpression_value parent numerator denominator (potential 0) (potential 1) (potential 2) enumeration

end
end MatrixBounds.Numeric.PairedCoarseColumns
