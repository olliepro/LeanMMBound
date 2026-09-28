import RationalIntervalOperations
import FiniteOrbitData

/-! Exact rational orbit masses and independently checked logarithm bounds
give sound intervals for actual full-word entropy and compatibility-pool entropy. -/
namespace MatrixBounds.Numeric

open Entropy
open scoped BigOperators

/-- Enclose a rational mass times its own logarithm, handling the zero contribution exactly. -/
def weightedLogBounds (mass : ℚ) (logarithm : Interval) : Interval :=
  if mass = 0 then Interval.point 0 else Interval.scale mass logarithm

/-- A logarithm bound is needed only for a nonzero mass; zero mass contributes exactly zero. -/
theorem weightedLogBounds_sound (mass : ℚ) (logarithm : Interval)
    (logSound : mass ≠ 0 → logarithm.Contains (Real.log (mass : ℝ))) :
    (weightedLogBounds mass logarithm).Contains ((mass : ℝ)*Real.log (mass : ℝ)) := by
  by_cases zero : mass = 0
  · simpa only [weightedLogBounds, zero, if_true, Rat.cast_zero, zero_mul] using Interval.point_sound 0
  · simpa only [weightedLogBounds, if_neg zero] using Interval.scale_sound mass (logSound zero)

/-- Enclose the entropy of a complete finite rational mass vector without requiring unit total mass. -/
def rationalEntropyBounds {I : Type*} [Fintype I] (mass : I → ℚ) (logarithm : I → Interval) : Interval :=
  (Interval.sum (fun index => weightedLogBounds (mass index) (logarithm index))).neg

/-- Exact finite interval arithmetic encloses the actual entropy of the rational mass vector. -/
theorem rationalEntropyBounds_sound {I : Type*} [Fintype I] (mass : I → ℚ) (logarithm : I → Interval)
    (logSound : ∀ index, mass index ≠ 0 → (logarithm index).Contains (Real.log (mass index : ℝ))) :
    (rationalEntropyBounds mass logarithm).Contains (entropy (fun index => (mass index : ℝ))) :=
  Interval.neg_sound (Interval.sum_sound _ _ (fun index => weightedLogBounds_sound _ _ (logSound index)))

/-- Enclose the unnormalized compatibility-pool entropy, including the logarithm of its exact total mass. -/
def rationalMassEntropyBounds {I : Type*} [Fintype I] (mass : I → ℚ)
    (logarithm : I → Interval) (totalLogarithm : Interval) : Interval :=
  (rationalEntropyBounds mass logarithm).add (weightedLogBounds (∑ index, mass index) totalLogarithm)

/-- The compatibility-pool enclosure is sound for arbitrary rational masses, including an empty pool. -/
theorem rationalMassEntropyBounds_sound {I : Type*} [Fintype I] (mass : I → ℚ)
    (logarithm : I → Interval) (totalLogarithm : Interval)
    (logSound : ∀ index, mass index ≠ 0 → (logarithm index).Contains (Real.log (mass index : ℝ)))
    (totalSound : (∑ index, mass index) ≠ 0 → totalLogarithm.Contains (Real.log ((∑ index, mass index : ℚ) : ℝ))) :
    (rationalMassEntropyBounds mass logarithm totalLogarithm).Contains (massEntropy (fun index => (mass index : ℝ))) := by
  simpa only [rationalMassEntropyBounds, massEntropy, Rat.cast_sum] using
    Interval.add_sound (rationalEntropyBounds_sound mass logarithm logSound)
      (weightedLogBounds_sound (∑ index, mass index) totalLogarithm totalSound)

/-- Enclose the exact orbit-size correction shared by ordinary and unnormalized entropy. -/
def orbitCorrectionBounds {I : Type*} [Fintype I] (mass : I → ℚ) (sizeLogarithm : I → Interval) : Interval :=
  Interval.sum (fun index => Interval.scale (mass index) (sizeLogarithm index))

/-- Orbit-size interval corrections enclose the exact correction for the actual complete word fibers. -/
theorem orbitCorrectionBounds_sound {Word I : Type*} [Fintype Word] [Fintype I]
    (partition : OrbitMap Word I) (mass : I → ℚ) (sizeLogarithm : I → Interval)
    (sizeSound : ∀ index, (sizeLogarithm index).Contains (Real.log (partition.size index))) :
    (orbitCorrectionBounds mass sizeLogarithm).Contains
      (∑ index, (mass index : ℝ)*Real.log (partition.size index)) :=
  Interval.sum_sound _ _ (fun index => Interval.scale_sound (mass index) (sizeSound index))

/-- Checked compressed arithmetic encloses the actual entropy of every complete decoded word law. -/
theorem orbitEntropyBounds_sound {Word I : Type*} [Fintype Word] [Fintype I]
    (partition : OrbitMap Word I) (mass : I → ℚ) (logarithm sizeLogarithm : I → Interval)
    (logSound : ∀ index, mass index ≠ 0 → (logarithm index).Contains (Real.log (mass index : ℝ)))
    (sizeSound : ∀ index, (sizeLogarithm index).Contains (Real.log (partition.size index))) :
    ((rationalEntropyBounds mass logarithm).add (orbitCorrectionBounds mass sizeLogarithm)).Contains
      (entropy (partition.decode (fun index => (mass index : ℝ)))) := by
  rw [partition.decode_entropy]
  exact Interval.add_sound (rationalEntropyBounds_sound mass logarithm logSound)
    (orbitCorrectionBounds_sound partition mass sizeLogarithm sizeSound)

/-- Checked compressed arithmetic also encloses the actual entropy of every unnormalized complete compatibility pool. -/
theorem orbitMassEntropyBounds_sound {Word I : Type*} [Fintype Word] [Fintype I]
    (partition : OrbitMap Word I) (mass : I → ℚ) (logarithm sizeLogarithm : I → Interval) (totalLogarithm : Interval)
    (logSound : ∀ index, mass index ≠ 0 → (logarithm index).Contains (Real.log (mass index : ℝ)))
    (sizeSound : ∀ index, (sizeLogarithm index).Contains (Real.log (partition.size index)))
    (totalSound : (∑ index, mass index) ≠ 0 → totalLogarithm.Contains (Real.log ((∑ index, mass index : ℚ) : ℝ))) :
    ((rationalMassEntropyBounds mass logarithm totalLogarithm).add (orbitCorrectionBounds mass sizeLogarithm)).Contains
      (massEntropy (partition.decode (fun index => (mass index : ℝ)))) := by
  rw [partition.decode_massEntropy]
  exact Interval.add_sound (rationalMassEntropyBounds_sound mass logarithm totalLogarithm logSound totalSound)
    (orbitCorrectionBounds_sound partition mass sizeLogarithm sizeSound)

end MatrixBounds.Numeric
