import SuppliedTerminalRationalSplit
import CWPermutedTerminalCountScaling
import CWPermutedTerminalWindowTarget
import CWRationalChildren

/-! Terminal children from the shared rational extraction give the actual full
matrix factor, with their source parameters and integer population unchanged. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRationalChildren

open Tensor Tensor.CW Terminal Empirical SuppliedTerminalScaling
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Exact number of repetitions of the original terminal split at a fixed coefficient and growing size. -/
def repetitions (weight size : ℕ) : ℕ := weight/17592186044416*size

/-- Every full rational terminal child has the exact integer population of its repeated original terminal data. -/
theorem child_population (source : Source) (role : AxisOrder) (weight size : ℕ) (child : ShapeAlphabet 2) :
    (SuppliedTerminalRationalSplit.split source role).childWeight weight child*size =
      2*permutedCounts (axes source role)
        (repetitions weight size*extreme source) (repetitions weight size*middle source) child := by
  rw [permutedCounts_mul]
  unfold RationalSplit.childWeight SuppliedTerminalRationalSplit.split repetitions
  ring

/-- Complete output windows retain exactly the source terminal integer profiles after a coordinate renaming. -/
def windowsRestriction {K T : Type*} [CommRing K] [Fintype T]
    (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ) (tolerance : T → ℝ) :
    CoordinateRestriction
      (Mixed.rationalChildren (K := K) (fun type => SuppliedTerminalRationalSplit.split (source type) (role type))
        weight size q (fun _ => SuppliedTerminalRationalSplit.law 0)
        (fun _ => SuppliedTerminalRationalSplit.law 1) (fun _ => SuppliedTerminalRationalSplit.law 2) tolerance)
      (permutedApproximateTarget (K := K) (fun type => axes (source type) (role type)) q
        (fun type => repetitions (weight type) size*extreme (source type))
        (fun type => repetitions (weight type) size*middle (source type)) tolerance) := by
  unfold permutedApproximateTarget
  rw [Mixed.approximateTarget_eq_windowed]
  exact CoordinateRestriction.heterogeneous (fun index =>
    Interface.windowPositionRestriction
      (finCongr (child_population (source index.1) (role index.1) (weight index.1) size index.2))
      (constituent (K := K) q 1 index.2.val)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (SuppliedTerminalRationalSplit.law 0 index.2) (SuppliedTerminalRationalSplit.law 1 index.2)
      (SuppliedTerminalRationalSplit.law 2 index.2) (tolerance index.1))

/-- Terminal output from one shared rational extraction restricts to the actual complete rectangular matrix. -/
def matrixRestriction {K T : Type*} [CommRing K] [Fintype T]
    (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ)
    (tolerance : T → ℝ) (nonnegative : ∀ type, 0 ≤ tolerance type) :
    CoordinateRestriction
      (Mixed.rationalChildren (K := K) (fun type => SuppliedTerminalRationalSplit.split (source type) (role type))
        weight size q (fun _ => SuppliedTerminalRationalSplit.law 0)
        (fun _ => SuppliedTerminalRationalSplit.law 1) (fun _ => SuppliedTerminalRationalSplit.law 2) tolerance)
      (MatrixMul.tensor (K := K)
        (I := PermutedMixedRows (fun type => axes (source type) (role type)) q
          (fun type => repetitions (weight type) size*extreme (source type))
          (fun type => repetitions (weight type) size*middle (source type)))
        (J := PermutedMixedInner (fun type => axes (source type) (role type)) q
          (fun type => repetitions (weight type) size*extreme (source type))
          (fun type => repetitions (weight type) size*middle (source type)))
        (L := PermutedMixedColumns (fun type => axes (source type) (role type)) q
          (fun type => repetitions (weight type) size*extreme (source type))
          (fun type => repetitions (weight type) size*middle (source type)))) :=
  (windowsRestriction source role weight size q tolerance).trans
    (permutedApproximateMatrixRestriction _ q _ _ tolerance nonnegative)

end
end MatrixBounds.Numeric.SuppliedTerminalRationalChildren
