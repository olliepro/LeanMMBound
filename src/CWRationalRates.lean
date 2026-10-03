module

public import CWRationalData
public import CWRetentionContinuity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The three mixed extraction rates on rational data are exact fixed real
expressions, independent of the choice of divisible integer population. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Rational parent-law formula with its numerator weights independent of population size. -/
def rationalParentLaw {length : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : (Fin (length+length) → Fin 3) → ℝ :=
  fun word => ∑ child, ((numerator child : ℝ)/denominator)*
    (law child (leftHalf word)*law (complementEquiv parent (2*length) balanced child) (rightHalf word))

/-- Rational compatibility-pool masses include both children of each parent position. -/
def rationalPooledLaw {length : ℕ} (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    CompatibilityClass (2*length) → (Fin length → Fin 3) → ℝ :=
  fun sector symbol => ∑ child, if axisClass child = sector then
    (2*((numerator child : ℝ)/denominator))*law child symbol else 0

/-- Exact fixed coarse-X entropy formula for a rational split and positive Gibbs potentials. -/
def rationalCoarseRetention {length : ℕ} (parent : Shape)
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  let probability := fun child => (numerator child : ℝ)/denominator
  entropy (marginal probability shapeXIndex) + entropy probability -
    (Real.log (∑ child : SplitAlphabet parent (2*length), ux (splitXIndex child)*uy (splitYIndex child)*uz (splitZIndex child)) -
      ((∑ value, marginal probability shapeXIndex value*Real.log (ux value)) +
        (∑ value, marginal probability shapeYIndex value*Real.log (uy value)) +
        ∑ value, marginal probability shapeZIndex value*Real.log (uz value)))

/-- The actual coarse rate equals the fixed rational expression at every positive divisible size. -/
theorem fromRational_coarseRetention {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (ux uy uz : Fin (2*length+1) → ℝ) :
    (fromRational parent balanced numerator denominator size).coarseRetention (P := Fin size) ux uy uz =
      rationalCoarseRetention parent numerator denominator ux uy uz := by
  have profiles : (fun child => (rationalProfile numerator denominator size child : ℝ)/size) =
      fun child => (numerator child : ℝ)/denominator := by
    funext child
    exact rationalProfile_probability numerator denominatorPositive sizePositive divisible child
  have marginals (axis : ShapeAlphabet (2*length) → Fin (2*length+1)) :=
    rationalProfile_marginal numerator axis denominatorPositive sizePositive divisible
  have values (axis : ShapeAlphabet (2*length) → Fin (2*length+1)) (value : Fin (2*length+1)) :=
    congrFun (marginals axis) value
  unfold coarseRetention gibbsCost rationalCoarseRetention fromRational fromCoarse
  simp only [Fintype.card_fin, profiles, values]
  congr <;> funext value <;> simp only [marginal]

/-- Rational child profiles give the exact fixed compatibility-pool masses. -/
theorem fromRational_pooledLaw {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational parent balanced numerator denominator size).pooledLaw (P := Fin size) axisClass law =
      rationalPooledLaw numerator denominator axisClass law := by
  funext sector symbol
  unfold pooledLaw rationalPooledLaw
  simp_rw [mul_div_assoc, fromRational_probability parent balanced numerator denominatorPositive sizePositive divisible]

/-- Both actual fine-axis rates are the fixed parent entropy minus the exact compatibility-pool entropies. -/
theorem fromRational_lawRetention {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational parent balanced numerator denominator size).lawRetention (P := Fin size) axisClass law =
      entropy (rationalParentLaw parent balanced numerator denominator law) -
        ∑ sector, massEntropy (rationalPooledLaw numerator denominator axisClass law sector) := by
  unfold lawRetention
  rw [fromRational_parentLaw parent balanced numerator denominatorPositive sizePositive divisible,
    fromRational_pooledLaw parent balanced numerator denominatorPositive sizePositive divisible]
  rfl

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
