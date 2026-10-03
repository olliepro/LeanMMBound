module

public import PipelineNumericIntervals

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Positive changes of the population unit scale every finite pipeline term,
including startup and drain corrections. -/
namespace MatrixBounds

noncomputable section

/-- A common nonnegative multiplier commutes with the physical-axis bottleneck. -/
theorem bottleneck_scale {factor : ℝ} (nonnegative : 0 ≤ factor) (rates : Rates) :
    bottleneck (fun axis => factor*rates axis) = factor*bottleneck rates := by
  simp only [bottleneck, mul_min_of_nonneg _ _ nonnegative]

/-- Changing the common population unit scales every actual scheduled round's retention. -/
theorem scheduledRetention_scale {factor : ℝ} (nonnegative : 0 ≤ factor)
    (batches : ℕ) (first second third : Rates) :
    scheduledRetention batches (fun axis => factor*first axis) (fun axis => factor*second axis)
      (fun axis => factor*third axis) = factor*scheduledRetention batches first second third := by
  have pair (x y : Rates) : (fun axis => factor*x axis)+(fun axis => factor*y axis) =
      fun axis => factor*(x+y) axis := by funext axis; simp only [Pi.add_apply]; ring
  simp only [scheduledRetention, pair, bottleneck_scale nonnegative]
  ring

/-- A finite batch count restores the exact per-batch formula, including the complete boundary term. -/
theorem scheduledRetention_per_batch {batches : ℕ} (positive : 0 < batches)
    (root : ℝ) (first second third : Rates) :
    (batches : ℝ)*root+scheduledRetention batches first second third =
      batches*(root+bottleneck (first+second+third)-boundaryLoss first second third/batches) := by
  rw [schedule_identity]
  have nonzero : (batches : ℝ) ≠ 0 := by exact_mod_cast positive.ne'
  field_simp
  ring

end
end MatrixBounds
