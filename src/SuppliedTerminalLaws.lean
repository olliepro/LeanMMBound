module

public import SuppliedParameterRows
public import CWTerminalOrbitLaws
public import CWRationalLawValidity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every original indexed terminal parameter is realized by positive integer
split counts, with the exact original compressed parent laws in physical coordinates. -/
namespace MatrixBounds.Numeric.SuppliedTerminalLaws

open Tensor.CW Tensor.CW.Terminal Entropy
open scoped BigOperators
noncomputable section

/-- Exact supplied terminal parameter, retaining node, positive-child, and strategy indices. -/
def mu (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℚ :=
  (SuppliedParameters.terminalNumerator node child strategy : ℚ)/17592186044416

/-- Integer extreme count for the original terminal parameter. -/
def extreme (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℕ :=
  SuppliedParameters.terminalNumerator node child strategy

/-- Integer middle count for the original terminal parameter. -/
def middle (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℕ :=
  TerminalParameterData.middleCount (extreme node child strategy)

/-- The actual integer-count parameter is exactly the supplied rational parameter. -/
theorem parameter_exact (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    parameter (extreme node child strategy) (middle node child strategy) = (mu node child strategy : ℝ) := by
  rw [mu, Rat.cast_div, Rat.cast_natCast, Rat.cast_ofNat]
  exact TerminalParameterData.parameter_exact _ (SuppliedParameters.terminalNumerator_mem node child strategy)

/-- Both integer counts are positive for every supplied terminal index. -/
theorem counts_positive (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    0 < extreme node child strategy ∧ 0 < middle node child strategy :=
  SuppliedParameters.terminalCounts_positive node child strategy

/-- All supplied terminal parameters lie strictly inside the admissible interval. -/
theorem mu_interior (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    0 < (mu node child strategy : ℝ) ∧ (mu node child strategy : ℝ) < 1/2 := by
  rw [← parameter_exact]
  exact parameter_interior (counts_positive node child strategy).1 (counts_positive node child strategy).2

/-- Put the degree-two terminal axis in its original positive-child position. -/
def childAxes (child : Fin 3) : Equiv.Perm (Fin 3) :=
  if child = 0 then Equiv.refl _ else if child = 1 then Equiv.swap 1 2 else Equiv.swap 0 2

/-- Exact rational compressed masses for a terminal degree-one coordinate. -/
def binaryMass (orbit : Fin 6) : ℚ := if orbit = 1 then 1 else 0

/-- Exact rational compressed masses for a terminal degree-two coordinate. -/
def ternaryMass (parameter : ℚ) (orbit : Fin 6) : ℚ :=
  if orbit = 2 then 2*parameter else if orbit = 3 then 1-2*parameter else 0

/-- Original terminal fine masses for each physical coordinate before choosing an extraction role. -/
def mass (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) : Fin 6 → ℚ :=
  if childAxes child axis = 2 then ternaryMass (mu node child strategy) else binaryMass

/-- The exact rational masses cast to the complete actual terminal orbit laws. -/
theorem mass_cast (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) :
    (fun orbit => (mass node child strategy axis orbit : ℝ)) =
      if childAxes child axis = 2 then ternaryOrbitMass (mu node child strategy) else binaryOrbitMass := by
  funext orbit
  by_cases degreeTwo : childAxes child axis = 2
  · simp only [mass, if_pos degreeTwo]
    unfold ternaryMass ternaryOrbitMass
    split_ifs <;> push_cast <;> rfl
  · simp only [mass, if_neg degreeTwo]
    unfold binaryMass binaryOrbitMass
    split_ifs <;> norm_num

/-- Every source terminal orbit vector is a nonnegative probability distribution. -/
theorem mass_valid (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) :
    (∀ orbit, 0 ≤ (mass node child strategy axis orbit : ℝ)) ∧
      ∑ orbit, (mass node child strategy axis orbit : ℝ) = 1 := by
  have castAt (orbit : Fin 6) := congrFun (mass_cast node child strategy axis) orbit
  simp_rw [castAt]
  split_ifs
  · exact ternaryOrbitMass_valid (mu_interior node child strategy).1.le (mu_interior node child strategy).2.le
  · exact binaryOrbitMass_valid

/-- Every decoded source terminal fine-law coordinate is between zero and one. -/
theorem law_range (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3)
    (word : Fin 2 → Fin 3) :
    0 ≤ OrbitLevel2.orbits.decode (fun orbit => (mass node child strategy axis orbit : ℝ)) word ∧
      OrbitLevel2.orbits.decode (fun orbit => (mass node child strategy axis orbit : ℝ)) word ≤ 1 := by
  obtain ⟨nonnegative, normalized⟩ := mass_valid node child strategy axis
  apply OrbitLevel2.orbits.decode_unit_range _ _ word
  intro orbit
  refine ⟨nonnegative orbit, ?_⟩
  rw [← normalized]
  exact Finset.single_le_sum (fun index _ => nonnegative index) (Finset.mem_univ orbit)

/-- The original source fine law is exactly the complete parent center of the genuine integer terminal extraction. -/
theorem actual_parent_law (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) :
    (permutedData (childAxes child) (extreme node child strategy) (middle node child strategy)).parentLaw
      (P := Fin (2*(extreme node child strategy+middle node child strategy)))
      (fun shape => oneLetterLaw (shapeCoordinate shape axis)) =
        OrbitLevel2.orbits.decode (fun orbit => (mass node child strategy axis orbit : ℝ)) := by
  have positive : 0 < extreme node child strategy+middle node child strategy := by
    have := (counts_positive node child strategy).1
    omega
  rw [permuted_parent_orbits _ _ _ positive, parameter_exact, mass_cast]

end
end MatrixBounds.Numeric.SuppliedTerminalLaws
