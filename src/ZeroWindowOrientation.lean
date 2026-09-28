import CanonicalZeroShape
import CWPhysicalWindows
import CWZeroOrbitExtraction
import DyadicOrbitSupport

/-! Physical permutations carry the complete supplied zero-law tensor window
to the exact canonical window used by the proved matrix extraction. -/
namespace MatrixBounds.Numeric

universe v
open Tensor Tensor.CW Entropy
noncomputable section

namespace TypedProbabilityRow

/-- The real rational row is exactly the original integer orbit-numerator probability vector. -/
theorem cast_orbit_probability {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator) (orbit : Fin orbits) :
    (source.rational orbit : ℝ) = (source.row.orbitNumerator orbit : ℝ)/denominator := by
  simp only [rational, numerator, DyadicRow.orbitNumerator, Rat.cast_div, Rat.cast_natCast]

/-- Orienting the actual complete supplied zero-law window realizes the canonical matrix-extraction window at unit cost. -/
theorem canonical_window {K : Type*} [CommRing K] {length orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroLaw : partition.decode (fun orbit => if orbit = zeroOrbit then 1 else 0) = zeroFineLaw length)
    (complementLaw : ∀ mass : Fin orbits → ℝ,
      (fun word => partition.decode mass ((fineComplement length).symm word)) =
        partition.decode (fun orbit => mass (complement orbit)))
    (shape : Shape) (balanced : shape.total = 2*length) (zero positive : Fin 3)
    (different : zero ≠ positive) (vanishes : Shape.coordinates shape zero = 0)
    (q size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v}
      (orient (zeroCanonicalOrder zero positive)
        (Interface.windowedPower (K := K) (P := Fin size) (constituent q length shape)
          (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
          (source.orientedLaw partition zeroOrbit complement zero positive 0)
          (source.orientedLaw partition zeroOrbit complement zero positive 1)
          (source.orientedLaw partition zeroOrbit complement zero positive 2) tolerance))
      (orbitZeroWindow (K := K) q (Shape.coordinates shape positive) denominator size partition source.row.orbitNumerator tolerance) 1 := by
  have placement := (physicalWindowRestriction (K := K) (P := Fin size)
    (zeroCanonicalOrder zero positive) q length shape
    (fun axis => source.orientedLaw partition zeroOrbit complement zero positive axis) tolerance).context
  rw [canonical_zero_shape shape length zero positive different balanced vanishes,
    source.canonicalLaw_x partition zeroOrbit complement zero positive different,
    source.canonicalLaw_y partition zeroOrbit complement zero positive different,
    source.canonicalLaw_z partition zeroOrbit complement zero positive different, zeroLaw,
    ← complementLaw (fun orbit => (source.rational orbit : ℝ))] at placement
  simpa only [orbitZeroWindow, source.cast_orbit_probability] using placement

end TypedProbabilityRow
end
end MatrixBounds.Numeric
