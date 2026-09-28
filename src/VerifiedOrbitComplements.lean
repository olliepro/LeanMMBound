import VerifiedOrbitLevel4
import FineOrbitComplement

/-! Supplied recursive orbit coordinates support the exact fine-symbol
complement required for the other nonzero axis of every zero leaf. -/
namespace MatrixBounds.Numeric

open Entropy Tensor.CW
noncomputable section

namespace OrbitLevel2

/-- Exact complement permutation of the six two-letter orbits. -/
def complement : Equiv.Perm (Fin 6) := encoding.liftInvolution Fin.rev Fin.rev_rev

/-- The supplied two-letter labels commute with complementing every fine symbol. -/
theorem complement_correct (word : Fin 2 → Fin 3) :
    orbits.label (fineComplement 2 word) = complement (orbits.label word) :=
  encoding.wordOrbits_complement oneLetterOrbits Fin.rev oneLetterOrbits_complement word

/-- Complementary two-letter orbits contain exactly equally many complete words. -/
theorem complement_size (orbit : Fin 6) : orbits.size (complement orbit) = orbits.size orbit :=
  orbits.symmetry_size (fineComplement 2) complement complement_correct orbit

/-- Complementing the complete two-letter law is the exact permutation of compressed masses. -/
theorem decode_complement (mass : Fin 6 → ℝ) :
    (fun word => orbits.decode mass ((fineComplement 2).symm word)) =
      orbits.decode (fun orbit => mass (complement orbit)) :=
  orbits.decode_symmetry (fineComplement 2) complement complement_correct mass

end OrbitLevel2

namespace OrbitLevel3

/-- Exact complement permutation of the twenty-one four-letter orbits. -/
def complement : Equiv.Perm (Fin 21) := encoding.liftInvolution OrbitLevel2.complement
  (OrbitLevel2.encoding.mapLabels_involutive Fin.rev Fin.rev_rev)

/-- The supplied four-letter labels commute with complementing every fine symbol. -/
theorem complement_correct (word : Fin 4 → Fin 3) :
    orbits.label (fineComplement 4 word) = complement (orbits.label word) :=
  encoding.wordOrbits_complement OrbitLevel2.orbits OrbitLevel2.complement OrbitLevel2.complement_correct word

/-- Complementary four-letter orbits contain exactly equally many complete words. -/
theorem complement_size (orbit : Fin 21) : orbits.size (complement orbit) = orbits.size orbit :=
  orbits.symmetry_size (fineComplement 4) complement complement_correct orbit

/-- Complementing the complete four-letter law is the exact permutation of compressed masses. -/
theorem decode_complement (mass : Fin 21 → ℝ) :
    (fun word => orbits.decode mass ((fineComplement 4).symm word)) =
      orbits.decode (fun orbit => mass (complement orbit)) :=
  orbits.decode_symmetry (fineComplement 4) complement complement_correct mass

end OrbitLevel3

namespace OrbitLevel4

/-- Exact complement permutation of the 231 eight-letter orbits. -/
def complement : Equiv.Perm (Fin 231) := encoding.liftInvolution OrbitLevel3.complement
  (OrbitLevel3.encoding.mapLabels_involutive OrbitLevel2.complement
    (OrbitLevel2.encoding.mapLabels_involutive Fin.rev Fin.rev_rev))

/-- The supplied eight-letter labels commute with complementing every fine symbol. -/
theorem complement_correct (word : Fin 8 → Fin 3) :
    orbits.label (fineComplement 8 word) = complement (orbits.label word) :=
  encoding.wordOrbits_complement OrbitLevel3.orbits OrbitLevel3.complement OrbitLevel3.complement_correct word

/-- Complementary eight-letter orbits contain exactly equally many complete words. -/
theorem complement_size (orbit : Fin 231) : orbits.size (complement orbit) = orbits.size orbit :=
  orbits.symmetry_size (fineComplement 8) complement complement_correct orbit

/-- Complementing the complete eight-letter law is the exact permutation of compressed masses. -/
theorem decode_complement (mass : Fin 231 → ℝ) :
    (fun word => orbits.decode mass ((fineComplement 8).symm word)) =
      orbits.decode (fun orbit => mass (complement orbit)) :=
  orbits.decode_symmetry (fineComplement 8) complement complement_correct mass

end OrbitLevel4
end
end MatrixBounds.Numeric
