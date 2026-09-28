import ProductDegreeRates
import BehrendRetention

/-! A concrete shared modulus requirement bounds all three product degrees.
The maximum retention cost is taken after forming each full product. -/
namespace MatrixBounds.Selection

noncomputable section

/-- Integer requirement paying for coarse uniqueness and both fine-axis collision bounds. -/
def sharedRequirement (base slack degreeX degreeY degreeZ : ℕ) : ℕ :=
  base + 6*degreeX + 6*(slack*degreeY) + 6*(slack*degreeZ)

/-- The explicit shared requirement dominates its base and all three collision requirements. -/
theorem sharedRequirement_bounds (base slack degreeX degreeY degreeZ : ℕ) :
    base ≤ sharedRequirement base slack degreeX degreeY degreeZ ∧
    6*degreeX ≤ sharedRequirement base slack degreeX degreeY degreeZ ∧
    6*(slack*degreeY) ≤ sharedRequirement base slack degreeX degreeY degreeZ ∧
    6*(slack*degreeZ) ≤ sharedRequirement base slack degreeX degreeY degreeZ := by
  unfold sharedRequirement
  omega

/-- The polynomial slack factor used when converting the shared requirement into a retention estimate. -/
def modulusFactor (base slack : ℕ) : ℝ := base+6+12*slack

/-- A common normalized degree bound controls the explicit modulus requirement, including its fixed base. -/
theorem sharedRequirement_upper {base slack degreeX degreeY degreeZ edges : ℕ} {rate : ℝ}
    (edgePositive : 0 < edges) (coarsePositive : 0 < degreeX)
    (boundX : (degreeX : ℝ)/edges ≤ Real.exp (-rate))
    (boundY : (degreeY : ℝ)/edges ≤ Real.exp (-rate))
    (boundZ : (degreeZ : ℝ)/edges ≤ Real.exp (-rate)) :
    (sharedRequirement base slack degreeX degreeY degreeZ : ℝ) ≤
      modulusFactor base slack*((edges : ℝ)*Real.exp (-rate)) := by
  have edgePositiveReal : (0 : ℝ) < edges := by exact_mod_cast edgePositive
  have hx := (div_le_iff₀ edgePositiveReal).mp boundX
  have hy := (div_le_iff₀ edgePositiveReal).mp boundY
  have hz := (div_le_iff₀ edgePositiveReal).mp boundZ
  have one : (1 : ℝ) ≤ degreeX := by exact_mod_cast coarsePositive
  have baseBound := mul_le_mul_of_nonneg_left (one.trans hx) (Nat.cast_nonneg base : (0 : ℝ) ≤ _)
  have yBound := mul_le_mul_of_nonneg_left hy (Nat.cast_nonneg slack : (0 : ℝ) ≤ _)
  have zBound := mul_le_mul_of_nonneg_left hz (Nat.cast_nonneg slack : (0 : ℝ) ≤ _)
  unfold sharedRequirement modulusFactor
  push_cast
  nlinarith

/-- The Behrend retained-count estimate cancels the prescribed-edge count against the modulus upper bound. -/
theorem shared_modulus_retention {prime copies edges : ℕ} {factor rate : ℝ}
    (edgePositive : 0 < edges) (primePositive : 0 < prime) (factorPositive : 0 < factor)
    (primeUpper : (prime : ℝ) ≤ factor*((edges : ℝ)*Real.exp (-rate)))
    (retained : (edges : ℝ)/(6*prime)*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies) :
    Real.exp rate/(6*factor)*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies := by
  have edgePositiveReal : (0 : ℝ) < edges := by exact_mod_cast edgePositive
  have primePositiveReal : (0 : ℝ) < prime := by exact_mod_cast primePositive
  have fraction : Real.exp rate/(6*factor) ≤ (edges : ℝ)/(6*prime) := by
    apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
    have bound := mul_le_mul_of_nonneg_left primeUpper (Real.exp_pos rate).le
    rw [Real.exp_neg] at bound
    have cancellation : Real.exp rate*(factor*((edges : ℝ)*(Real.exp rate)⁻¹)) = factor*edges := by
      field_simp
    rw [cancellation] at bound
    nlinarith
  exact (mul_le_mul_of_nonneg_right fraction (Real.exp_pos _).le).trans retained

end
end MatrixBounds.Selection
