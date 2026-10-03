module

public import FiniteOrbitData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Orbit compression preserves averages of every statistic constant on each
verified word fiber, including fine totals and middle-symbol multiplicities. -/
namespace MatrixBounds.Entropy.OrbitMap

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]

/-- Weighted statistics of the full expanded law equal their exact compressed orbit sums. -/
theorem decode_expectation (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) (statistic : Word → ℝ)
    (invariant : ∀ word, statistic word = statistic (partition.representative (partition.label word))) :
    (∑ word, partition.decode mass word*statistic word) =
      ∑ orbit, mass orbit*statistic (partition.representative orbit) := by
  have pointwise : (fun word => partition.decode mass word*statistic word) =
      partition.decode (fun orbit => mass orbit*statistic (partition.representative orbit)) := by
    funext word
    rw [invariant word]
    simp only [decode]
    ring
  rw [pointwise, partition.decode_total]

end
end MatrixBounds.Entropy.OrbitMap
