import CWPermutedTerminalGibbs
import CWMixedNominalRates

/-! The ordinary mixed nominal rates recover the complete terminal physical
entropy vector, so terminal factors fit in the same shared extraction round. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- The actual nominal Y law of a terminal child family has the selected physical entropy. -/
theorem permuted_nominal_y_retention (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).lawRetention (P := Fin (2*(extreme+middle))) yClass
      (fun child => oneLetterLaw (shapeYIndex child)) = axisEntropy extreme middle (axes 1) := by
  rw [one_letter_y_retention]
  exact permuted_parent_entropy axes extreme middle positive 1

/-- The nominal Z law gives the other physical terminal entropy in the same mixed extraction. -/
theorem permuted_nominal_z_retention (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).lawRetention (P := Fin (2*(extreme+middle))) zClass
      (fun child => oneLetterLaw (shapeZIndex child)) = axisEntropy extreme middle (axes 2) := by
  rw [one_letter_z_retention]
  exact permuted_parent_entropy axes extreme middle positive 2

/-- All three terminal entries of the general mixed nominal rate formula equal their explicit physical rates. -/
theorem permuted_nominal_rates (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positiveExtreme : 0 < extreme) (positiveMiddle : 0 < middle) (error : ℝ) :
    let terminal := permutedData axes extreme middle
    let population := (2*((extreme : ℝ)+middle))
    let potential := coordinatePotential axes (parameter extreme middle)
    population*(terminal.coarseRetention (P := Fin (2*(extreme+middle))) (potential 0) (potential 1) (potential 2)-error) =
      population*(axisEntropy extreme middle (axes 0)-error) ∧
    population*(terminal.lawRetention (P := Fin (2*(extreme+middle))) yClass (fun child => oneLetterLaw (shapeYIndex child))-error) =
      population*(axisEntropy extreme middle (axes 1)-error) ∧
    population*(terminal.lawRetention (P := Fin (2*(extreme+middle))) zClass (fun child => oneLetterLaw (shapeZIndex child))-error) =
      population*(axisEntropy extreme middle (axes 2)-error) := by
  have positive : 0 < extreme+middle := by omega
  simp only [permuted_coarseRetention_exact axes extreme middle positiveExtreme positiveMiddle,
    permuted_nominal_y_retention axes extreme middle positive, permuted_nominal_z_retention axes extreme middle positive,
    and_self]

end
end MatrixBounds.Tensor.CW.Terminal
