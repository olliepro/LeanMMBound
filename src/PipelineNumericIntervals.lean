import RationalIntervalOperations
import MatrixBounds

/-! Exact interval accounting for the physical axes, finite pipeline boundary
terms, and final rectangular volume budget. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Three rational enclosures in the physical coordinate ordering of the pipeline. -/
abbrev RateBounds := Fin 3 → Interval

/-- Pointwise addition of complete three-axis interval vectors. -/
def addRateBounds (left right : RateBounds) : RateBounds := fun axis => (left axis).add (right axis)

/-- Endpoint minima enclose the physical bottleneck after summing active rates. -/
def bottleneckBounds (bounds : RateBounds) : Interval :=
  (bounds 0).minimum ((bounds 1).minimum (bounds 2))

/-- Pointwise interval addition encloses the actual physical-axis rate sum. -/
theorem addRateBounds_sound {left right : RateBounds} {x y : Rates}
    (hx : ∀ axis, (left axis).Contains (x axis)) (hy : ∀ axis, (right axis).Contains (y axis)) :
    ∀ axis, (addRateBounds left right axis).Contains ((x+y) axis) :=
  fun axis => Interval.add_sound (hx axis) (hy axis)

/-- The three-axis interval bottleneck encloses the actual bottleneck. -/
theorem bottleneckBounds_sound {bounds : RateBounds} {rates : Rates}
    (inside : ∀ axis, (bounds axis).Contains (rates axis)) :
    (bottleneckBounds bounds).Contains (bottleneck rates) :=
  Interval.minimum_sound (inside 0) (Interval.minimum_sound (inside 1) (inside 2))

/-- Exact interval evaluation of the complete warm-up and drain correction. -/
def boundaryLossBounds (level4 level3 terminal : RateBounds) : Interval :=
  ((((Interval.scale 2 (bottleneckBounds (addRateBounds (addRateBounds level4 level3) terminal))).sub
    (bottleneckBounds level4)).sub (bottleneckBounds (addRateBounds level4 level3))).sub
    (bottleneckBounds (addRateBounds level3 terminal))).sub (bottleneckBounds terminal)

/-- All signed boundary-correction terms are enclosed, including both drain terms. -/
theorem boundaryLossBounds_sound {level4 level3 terminal : RateBounds} {x y z : Rates}
    (hx : ∀ axis, (level4 axis).Contains (x axis))
    (hy : ∀ axis, (level3 axis).Contains (y axis))
    (hz : ∀ axis, (terminal axis).Contains (z axis)) :
    (boundaryLossBounds level4 level3 terminal).Contains (boundaryLoss x y z) := by
  simpa only [Rat.cast_ofNat] using Interval.sub_sound
    (Interval.sub_sound (Interval.sub_sound (Interval.sub_sound
      (Interval.scale_sound 2 (bottleneckBounds_sound (addRateBounds_sound (addRateBounds_sound hx hy) hz)))
      (bottleneckBounds_sound hx)) (bottleneckBounds_sound (addRateBounds_sound hx hy)))
      (bottleneckBounds_sound (addRateBounds_sound hy hz))) (bottleneckBounds_sound hz)

/-- Root retention plus scheduled retention per batch, including finite boundary loss. -/
noncomputable def finitePipelineRetention (batches : ℕ) (root level4 level3 terminal : Rates) : ℝ :=
  bottleneck root+bottleneck (level4+level3+terminal)-boundaryLoss level4 level3 terminal/batches

/-- Exact interval evaluation of total finite-pipeline retention per batch. -/
def finitePipelineRetentionBounds (batches : ℕ) (root level4 level3 terminal : RateBounds) : Interval :=
  ((bottleneckBounds root).add (bottleneckBounds (addRateBounds (addRateBounds level4 level3) terminal))).sub
    (Interval.scale (1/(batches : ℚ)) (boundaryLossBounds level4 level3 terminal))

/-- The retention interval contains every term of the actual finite-batch formula. -/
theorem finitePipelineRetentionBounds_sound (batches : ℕ) {root level4 level3 terminal : RateBounds}
    {r x y z : Rates} (hr : ∀ axis, (root axis).Contains (r axis))
    (hx : ∀ axis, (level4 axis).Contains (x axis))
    (hy : ∀ axis, (level3 axis).Contains (y axis))
    (hz : ∀ axis, (terminal axis).Contains (z axis)) :
    (finitePipelineRetentionBounds batches root level4 level3 terminal).Contains (finitePipelineRetention batches r x y z) := by
  have result := Interval.sub_sound
    (Interval.add_sound (bottleneckBounds_sound hr)
      (bottleneckBounds_sound (addRateBounds_sound (addRateBounds_sound hx hy) hz)))
    (Interval.scale_sound (1/(batches : ℚ)) (boundaryLossBounds_sound hx hy hz))
  have shift : ((1/(batches : ℚ) : ℚ) : ℝ)*boundaryLoss x y z = boundaryLoss x y z/batches := by
    push_cast
    ring
  simpa only [finitePipelineRetention, shift] using result

/-- All interval inputs needed for the final finite-pipeline scalar budget. -/
structure PipelineBounds where
  cost : Interval
  root : RateBounds
  level4 : RateBounds
  level3 : RateBounds
  terminal : RateBounds
  dimension : RateBounds

/-- Enclose the exact rectangular-budget slack at a proposed rational exponent. -/
def PipelineBounds.residual (bounds : PipelineBounds) (batches : ℕ) (rate : ℚ) : Interval :=
  ((finitePipelineRetentionBounds batches bounds.root bounds.level4 bounds.level3 bounds.terminal).add
    (Interval.scale (rate/3) (Interval.sum bounds.dimension))).sub bounds.cost

/-- The residual enclosure is sound for the complete real rate vectors and source budget. -/
theorem PipelineBounds.residual_sound (bounds : PipelineBounds) (batches : ℕ) (rate : ℚ)
    {cost : ℝ} {root level4 level3 terminal dimension : Rates}
    (costSound : bounds.cost.Contains cost)
    (rootSound : ∀ axis, (bounds.root axis).Contains (root axis))
    (level4Sound : ∀ axis, (bounds.level4 axis).Contains (level4 axis))
    (level3Sound : ∀ axis, (bounds.level3 axis).Contains (level3 axis))
    (terminalSound : ∀ axis, (bounds.terminal axis).Contains (terminal axis))
    (dimensionSound : ∀ axis, (bounds.dimension axis).Contains (dimension axis)) :
    (bounds.residual batches rate).Contains
      (finitePipelineRetention batches root level4 level3 terminal+(rate : ℝ)/3*(∑ axis, dimension axis)-cost) := by
  simpa only [Rat.cast_div, Rat.cast_ofNat] using Interval.sub_sound
    (Interval.add_sound (finitePipelineRetentionBounds_sound batches rootSound level4Sound level3Sound terminalSound)
      (Interval.scale_sound (rate/3) (Interval.sum_sound bounds.dimension dimension dimensionSound))) costSound

/-- A positive residual lower endpoint proves the complete strict nominal rectangular budget. -/
theorem PipelineBounds.strict_budget (bounds : PipelineBounds) (batches : ℕ) (rate : ℚ)
    {cost : ℝ} {root level4 level3 terminal dimension : Rates}
    (costSound : bounds.cost.Contains cost)
    (rootSound : ∀ axis, (bounds.root axis).Contains (root axis))
    (level4Sound : ∀ axis, (bounds.level4 axis).Contains (level4 axis))
    (level3Sound : ∀ axis, (bounds.level3 axis).Contains (level3 axis))
    (terminalSound : ∀ axis, (bounds.terminal axis).Contains (terminal axis))
    (dimensionSound : ∀ axis, (bounds.dimension axis).Contains (dimension axis))
    (positive : 0 < (bounds.residual batches rate).lower) :
    cost < finitePipelineRetention batches root level4 level3 terminal+(rate : ℝ)/3*(∑ axis, dimension axis) := by
  have inside := bounds.residual_sound batches rate costSound rootSound level4Sound level3Sound terminalSound dimensionSound
  have strict : (0 : ℝ) < (bounds.residual batches rate).lower := by exact_mod_cast positive
  linarith [inside.1]

end MatrixBounds.Numeric
