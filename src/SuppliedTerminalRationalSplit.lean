import SuppliedTerminalScaling
import CWRationalStage
import CWPermutedTerminalNominal

/-! Original terminal counts form genuine rational length-one split data in
the same shared-stage representation used by the higher paired levels. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRationalSplit

open Tensor Tensor.CW Tensor.CW.Terminal Entropy Empirical SuppliedTerminalScaling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Exact full-alphabet terminal count normalization at the original supplied dyadic denominator. -/
theorem counts_total (source : Source) (role : AxisOrder) :
    (∑ child, permutedCounts (axes source role) (extreme source) (middle source) child) = 17592186044416 := by
  have total := profile_total _ ((permutedData (axes source role) (extreme source) (middle source)).prescribedWord
    (permutedReference (axes source role) (extreme source) (middle source)))
  simpa only [Fintype.card_fin, population] using total

/-- The original terminal counts are an actual normalized supported symmetric rational split in every physical role. -/
def split (source : Source) (role : AxisOrder) : RationalSplit 1 17592186044416 where
  parent := Terminal.parent.permute (axes source role)
  balanced := (Shape.permute_total (axes source role) Terminal.parent).trans (by decide)
  numerator := permutedCounts (axes source role) (extreme source) (middle source)
  normalized := counts_total source role
  supported child nonzero := by
    by_contra outside
    exact nonzero (permutedCounts_support (axes source role) (extreme source) (middle source) child outside)
  symmetric := permuted_counts_symmetric (axes source role) (extreme source) (middle source)

/-- The terminal child's complete one-letter law in each physical axis. -/
def law (axis : Fin 3) (child : ShapeAlphabet 2) : (Fin 1 → Fin 3) → ℝ :=
  oneLetterLaw (shapeCoordinate child axis)

/-- Every actual one-letter terminal child-law coordinate is a probability coordinate. -/
theorem law_range (axis : Fin 3) (child : ShapeAlphabet 2) (word : Fin 1 → Fin 3) :
    0 ≤ law axis child word ∧ law axis child word ≤ 1 := by
  unfold law oneLetterLaw
  split_ifs <;> norm_num

/-- The rational terminal parent formula is exactly the genuine integer-count terminal parent law. -/
theorem parent_law_integer (source : Source) (role : AxisOrder) (axis : Fin 3) :
    (split source role).parentLaw (law axis) =
      (permutedData (axes source role) (extreme source) (middle source)).parentLaw
        (P := Fin (2*(extreme source+middle source))) (law axis) := by
  funext word
  unfold RationalSplit.parentLaw SplitRestrictionData.rationalParentLaw SplitRestrictionData.parentLaw
  simp only [split, permutedData, oneLetterMarginalData, oneLetterData, Fintype.card_fin, population]

/-- The terminal row's exact original complete fine law is the rational shared-extraction parent center. -/
theorem parent_law (source : Source) (role : AxisOrder) (axis : Fin 3) :
    (split source role).parentLaw (law axis) =
      OrbitLevel2.orbits.decode (fun orbit =>
        (SuppliedTerminalLaws.mass source.node source.child source.strategy (role.permutation axis) orbit : ℝ)) := by
  rw [parent_law_integer]
  have sumPositive : 0 < extreme source+middle source := Nat.add_pos_left (positive source).1 _
  unfold law
  rw [permuted_parent_orbits _ _ _ sumPositive]
  simp only [extreme, middle]
  rw [SuppliedTerminalLaws.parameter_exact source.node source.child source.strategy,
    SuppliedTerminalLaws.mass_cast]
  rfl

/-- Exact terminal Gibbs potential that realizes the three actual terminal entropy entries. -/
def potential (source : Source) (role : AxisOrder) (axis : Fin 3) (value : Fin 3) : ℝ :=
  coordinatePotential (axes source role) (SuppliedTerminalLaws.mu source.node source.child source.strategy) axis value

/-- Every terminal Gibbs potential is strictly positive at every original source parameter. -/
theorem potential_positive (source : Source) (role : AxisOrder) (axis value : Fin 3) :
    0 < potential source role axis value :=
  coordinatePotential_positive _ (SuppliedTerminalLaws.mu_interior source.node source.child source.strategy).1
    (SuppliedTerminalLaws.mu_interior source.node source.child source.strategy).2 axis value

/-- Supplied terminal labels form a complete actual rational stage that can share extraction with both higher levels. -/
def stage {T : Type*} [Fintype T] (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ)
    (weightPositive : ∀ type, 0 < weight type) (divisible : ∀ type, 17592186044416 ∣ weight type) :
    Mixed.RationalStage T (fun _ => 1) 17592186044416 where
  splits type := split (source type) (role type)
  weight := weight
  weightPositive := weightPositive
  divisible := divisible
  law _ := law
  lawRange _ := law_range
  potential type := potential (source type) (role type)
  potentialPositive type := potential_positive (source type) (role type)

end
end MatrixBounds.Numeric.SuppliedTerminalRationalSplit
