module

public import VerifiedOrbitLevel2
public import CWPermutedTerminalLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied terminal fine laws are exactly their six-coordinate orbit
representations, and coincide with the actual terminal extraction centers. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Numeric Entropy
open scoped BigOperators
noncomputable section

/-- Compressed mass of the balanced complete fine law on the degree-one axis. -/
def binaryOrbitMass (orbit : Fin 6) : ℝ := if orbit = 1 then 1 else 0

/-- Compressed masses of the two degree-two orbits in the complete terminal law. -/
def ternaryOrbitMass (mu : ℝ) (orbit : Fin 6) : ℝ :=
  if orbit = 2 then 2*mu else if orbit = 3 then 1-2*mu else 0

/-- The complete two-letter column represented by a pair has exactly that pair's checked orbit label. -/
theorem terminal_pair_orbit_label (pair : Fin 3 × Fin 3) :
    OrbitLevel2.orbits.label ((finTwoArrowEquiv (Fin 3)).symm pair) = OrbitLevel2.encoding.code pair := rfl

/-- Decoding the degree-one orbit mass gives precisely the actual balanced terminal parent law. -/
theorem decode_binaryOrbitMass : OrbitLevel2.orbits.decode binaryOrbitMass = binaryParentLaw := by
  funext word
  rw [← (finTwoArrowEquiv (Fin 3)).symm_apply_apply word]
  generalize (finTwoArrowEquiv (Fin 3)) word = pair
  rcases pair with ⟨left, right⟩
  unfold OrbitMap.decode
  rw [terminal_pair_orbit_label, OrbitLevel2.sizes_correct]
  fin_cases left <;> fin_cases right <;>
    norm_num [binaryOrbitMass, binaryParentLaw, OrbitLevel2.encoding, OrbitLevel2.sizes,
      OrbitLevel2.suppliedSizes, finTwoArrowEquiv, funext_iff, Fin.forall_fin_succ, Fin.ext_iff]

/-- Decoding the degree-two orbit masses gives precisely the full terminal law with its two extreme words. -/
theorem decode_ternaryOrbitMass (mu : ℝ) : OrbitLevel2.orbits.decode (ternaryOrbitMass mu) = ternaryParentLaw mu := by
  funext word
  rw [← (finTwoArrowEquiv (Fin 3)).symm_apply_apply word]
  generalize (finTwoArrowEquiv (Fin 3)) word = pair
  rcases pair with ⟨left, right⟩
  unfold OrbitMap.decode
  rw [terminal_pair_orbit_label, OrbitLevel2.sizes_correct]
  fin_cases left <;> fin_cases right <;>
    norm_num [ternaryOrbitMass, ternaryParentLaw, OrbitLevel2.encoding, OrbitLevel2.sizes,
      OrbitLevel2.suppliedSizes, finTwoArrowEquiv, funext_iff, Fin.forall_fin_succ, Fin.ext_iff]

/-- The degree-one compressed law is nonnegative and has exactly unit mass. -/
theorem binaryOrbitMass_valid : (∀ orbit, 0 ≤ binaryOrbitMass orbit) ∧ ∑ orbit, binaryOrbitMass orbit = 1 := by
  constructor
  · intro orbit
    unfold binaryOrbitMass
    split_ifs <;> norm_num
  · simp [binaryOrbitMass]

/-- Every feasible terminal parameter defines nonnegative normalized compressed masses. -/
theorem ternaryOrbitMass_valid {mu : ℝ} (nonnegative : 0 ≤ mu) (upper : mu ≤ 1/2) :
    (∀ orbit, 0 ≤ ternaryOrbitMass mu orbit) ∧ ∑ orbit, ternaryOrbitMass mu orbit = 1 := by
  constructor
  · intro orbit
    unfold ternaryOrbitMass
    split_ifs <;> linarith
  · norm_num [ternaryOrbitMass, Fin.sum_univ_succ]

/-- The actual terminal parent laws, in every physical orientation, equal the supplied compressed expansions. -/
theorem permuted_parent_orbits (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) (axis : Fin 3) :
    (permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeCoordinate child axis)) =
      OrbitLevel2.orbits.decode (if axes axis = 2 then ternaryOrbitMass (parameter extreme middle) else binaryOrbitMass) := by
  rw [permuted_parent_law axes extreme middle positive axis]
  split_ifs
  · exact (decode_ternaryOrbitMass _).symm
  · exact decode_binaryOrbitMass.symm

end
end MatrixBounds.Tensor.CW.Terminal
