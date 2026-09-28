import LogEnclosures

/-! Concrete logarithm constants certified by rational arithmetic and the proved
finite-series remainder. These are independent of the Python interval report. -/
namespace MatrixBounds.Numeric

/-- A rational enclosure of the natural logarithm of two, proved in Lean. -/
theorem log_two_bounds :
    (693147180559945309 : ℝ) / 10^18 ≤ Real.log 2 ∧
    Real.log 2 ≤ (693147180559945310 : ℝ) / 10^18 := by
  have bound := log_enclosure 2 (by norm_num) 40
  norm_num [logSeries, logError, Finset.sum_range_succ] at bound
  constructor <;> linarith

/-- A rational enclosure of log(7/4), the normalized CW rank constant. -/
theorem log_seven_quarters_bounds :
    (559615787935422685 : ℝ) / 10^18 ≤ Real.log (7/4) ∧
    Real.log (7/4) ≤ (559615787935422687 : ℝ) / 10^18 := by
  have bound := log_enclosure (7/4) (by norm_num) 40
  norm_num [logSeries, logError, Finset.sum_range_succ] at bound
  constructor <;> linarith

/-- The level-four source's logarithmic rank cost is enclosed by exact rational endpoints. -/
theorem source_cost_bounds :
    (22458839376460830 : ℝ) / 10^15 ≤ 8 * (Real.log 7 / Real.log 2) ∧
    8 * (Real.log 7 / Real.log 2) ≤ (22458839376460835 : ℝ) / 10^15 := by
  have two := log_two_bounds
  have seven := log_seven_quarters_bounds
  have logarithm : Real.log (7/4) = Real.log 7 - 2 * Real.log 2 := by
    rw [Real.log_div (by norm_num) (by norm_num)]
    have four : Real.log (4 : ℝ) = 2 * Real.log 2 := by
      rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]
      norm_num
    rw [four]
  have positive : 0 < Real.log 2 := by linarith [two.1]
  rw [← mul_div_assoc]
  constructor
  · rw [le_div_iff₀ positive]
    nlinarith
  · rw [div_le_iff₀ positive]
    nlinarith

end MatrixBounds.Numeric
