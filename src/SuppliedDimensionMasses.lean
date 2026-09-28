import SuppliedWaitingZero4Data
import SuppliedWaitingZero3Data
import SuppliedWaitingZero2Data
import SuppliedTerminalRateExpression

/-! Original source populations for all matrix contributions. Summing old
physical roles recovers the exact original unallocated coefficient. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates
open Tensor Tensor.CW SuppliedPopulationWeights SuppliedPopulationPaths DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 200000

/-- Original complete root columns, indexed by their exact zero-coordinate source labels. -/
def zero4Column : Fin 48 → Fin 153 := ![0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,32,33,47,48,61,62,74,75,86,87,97,98,107,108,116,117,124,125,131,132,137,138,142,143,146,147,149,150,151,152]

/-- Original complete level-two columns, indexed by their exact zero-coordinate source labels. -/
def zero2Column : Fin 12 → Fin 15 := ![0,1,2,3,4,5,8,9,11,12,13,14]

/-- Each explicit root column has precisely its original zero-coordinate source classification. -/
theorem zero4Column_kind : ∀ node : Fin 48, SuppliedChildKinds.kind4 (zero4Column node) = .inl node := by decide +kernel

/-- Each explicit leaf column has precisely its original zero-coordinate source classification. -/
theorem zero2Column_kind : ∀ child : Fin 12, SuppliedChildKinds.kind2 (zero2Column child) = .inl child := by decide +kernel

/-- Root zero-factor labels preserve their exact original complete source column. -/
theorem zero4_column (node : Fin 48) :
    (shapeColumnEquiv 16).symm (SuppliedWaitingZero4.child node) = zero4Column node :=
  SuppliedChildKinds.kind4_bijective.injective
    ((SuppliedWaitingZero4.child_kind node).trans (zero4Column_kind node).symm)

/-- Level-two zero-factor labels preserve their exact original complete source column. -/
theorem zero2_child (child : Fin 12) :
    SuppliedWaitingZero2.child child = shapeColumnEquiv 4 (zero2Column child) := by
  apply (shapeColumnEquiv 4).symm.injective
  rw [Equiv.symm_apply_apply]
  exact SuppliedChildKinds.kind2_bijective.injective
    ((SuppliedWaitingZero2.child_kind child).trans (zero2Column_kind child).symm)

/-- Original doubled source numerator of an unallocated zero3 hierarchy node. -/
def zero3Numerator (node : Fin 840) : ℕ :=
  let pair := SuppliedNodePartialIndexing.decode (.inr node)
  2*rootNumerator pair.1*(SuppliedTypedParameters.level4Split pair.1).numerator (shapeColumnEquiv 8 pair.2)

/-- Original doubled source numerator of a zero2 leaf after its strategy mixture. -/
def zero2Numerator (source : SuppliedStage3.Source) (child : Fin 12) : ℕ :=
  2*strategyNumerator source*(SuppliedTypedParameters.level3Split source.1 source.2).numerator
    (shapeColumnEquiv 4 (zero2Column child))

/-- Original root-scale rational population of a zero4 constituent. -/
def zero4Mass (node : Fin 48) : ℚ := SuppliedTypedParameters.rootDistribution.rational (zero4Column node)

/-- Original root-scale rational population of a zero3 hierarchy node. -/
def zero3Mass (node : Fin 840) : ℚ := (zero3Numerator node : ℚ)/(denominator^2 : ℕ)

/-- Original root-scale rational population of a zero2 source leaf. -/
def zero2Mass (source : SuppliedStage3.Source) (child : Fin 12) : ℚ :=
  (zero2Numerator source child : ℚ)/(denominator^4 : ℕ)

/-- Summing every original zero3 inherited role recovers the original doubled source population. -/
theorem zero3_weight_sum (node : Fin 840) :
    (∑ previous : AxisOrder, SuppliedLevel4Transition.zeroWeight node previous) = scaled 6 (zero3Numerator node) := by
  unfold SuppliedLevel4Transition.zeroWeight SuppliedNodePartialIndexing.childWeight role4Weight
  simp_rw [child_scaled]
  unfold zero3Numerator scaled
  simp only [← Finset.mul_sum, ← Finset.sum_mul, SuppliedRoleIndex.allocation4_total]
  unfold denominator
  ring

/-- Summing both original role histories recovers the source zero2 population after its strategy mixture. -/
theorem zero2_weight_sum (source : SuppliedStage3.Source) (child : Fin 12) :
    (∑ previous : AxisOrder, ∑ role : AxisOrder,
      SuppliedWaitingZero2.weight (⟨source, previous, role⟩, child)) = scaled 4 (zero2Numerator source child) := by
  unfold SuppliedWaitingZero2.weight SuppliedLevel3Transition.childWeight weight3
  simp_rw [child_scaled, zero2_child]
  unfold zero2Numerator scaled inherited4
  simp only [← Finset.mul_sum, ← Finset.sum_mul,
    SuppliedRoleIndex.allocation3_total, SuppliedRoleIndex.allocation4_total]
  unfold denominator
  ring

/-- Reserved integer populations are precisely the common root scale times their rational source mass. -/
theorem root_scaled_mass (depth consumed numerator : ℕ) (total : depth+consumed = 8) :
    (rootWeight : ℝ)*(((numerator : ℚ)/(denominator^consumed : ℕ) : ℚ) : ℝ) =
      (scaled depth numerator : ℝ) := by
  have nonzero : (denominator : ℝ) ≠ 0 := by norm_num [denominator]
  simp only [rootWeight, scaled, Rat.cast_div, Rat.cast_natCast, Nat.cast_mul, Nat.cast_pow]
  rw [← total, pow_add]
  simp only [Rat.cast_pow, Rat.cast_natCast]
  field_simp

/-- The actual root zero4 coefficient is precisely the common scale times its original source probability. -/
theorem zero4_root_mass (node : Fin 48) :
    (rootWeight : ℝ)*(zero4Mass node : ℝ) = (SuppliedWaitingZero4.weight node : ℝ) := by
  simpa only [zero4Mass, SuppliedWaitingZero4.weight, SuppliedRootPopulation.weight,
    SuppliedRootPopulation.numerator, zero4_column, TypedProbabilityRow.rational, pow_one] using
    root_scaled_mass 7 1 (SuppliedTypedParameters.rootDistribution.numerator (zero4Column node)) rfl

/-- The summed zero3 population is precisely its original rational source mass at the common scale. -/
theorem zero3_root_mass (node : Fin 840) :
    (rootWeight : ℝ)*(zero3Mass node : ℝ) = (scaled 6 (zero3Numerator node) : ℝ) :=
  root_scaled_mass 6 2 (zero3Numerator node) rfl

/-- The summed zero2 population is precisely its original rational source mass at the common scale. -/
theorem zero2_root_mass (source : SuppliedStage3.Source) (child : Fin 12) :
    (rootWeight : ℝ)*(zero2Mass source child : ℝ) = (scaled 4 (zero2Numerator source child) : ℝ) :=
  root_scaled_mass 4 4 (zero2Numerator source child) rfl

/-- Summing the actual terminal role allocation recovers its entire source population. -/
theorem terminal_role_sum (source : SuppliedTerminalScaling.Source) :
    (∑ selected : Fin 3, terminalRoleWeight (source, selected)) = SuppliedPopulationWeights.terminalWeight source := by
  simp only [terminalRoleWeight, scaled, ← Finset.mul_sum, TypedProbabilityRow.numerator_total]
  unfold SuppliedPopulationWeights.terminalWeight scaled
  norm_num [denominator]
  ring

end
end MatrixBounds.Numeric.SuppliedDimensionRates
