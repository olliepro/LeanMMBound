module

public import CWOneLetterWindowedMatrix
public import CWPermutedTerminalMixedTarget
public import CWWindowedInterfaces
public import HeterogeneousRegrouping

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A complete approximate terminal output has its full matrix dimensions.
This conversion acts after the shared mixed round, so no separate terminal
minimum or extraction loss is introduced. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- Windowed one-letter child pools associated with arbitrary split counts. -/
def oneLetterWindowTarget (q : ℕ) (split : ShapeAlphabet 2 → ℕ) (tolerance : ℝ) :=
  Interface.heterogeneous (fun child : ShapeAlphabet 2 =>
    Interface.windowedPower (K := K) (P := Fin (2*split child)) (constituent q 1 child.val)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (oneLetterLaw (shapeXIndex child)) (oneLetterLaw (shapeYIndex child)) (oneLetterLaw (shapeZIndex child)) tolerance)

/-- Complete one-letter child windows map to the full product-dimension matrix for any split population. -/
def oneLetterWindowTargetRestriction (q : ℕ) (split : ShapeAlphabet 2 → ℕ)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (oneLetterWindowTarget (K := K) q split tolerance)
      (MatrixMul.tensor (K := K) (I := OneLetterRowIndices q split)
        (J := OneLetterInnerIndices q split) (L := OneLetterColumnIndices q split)) :=
  (CoordinateRestriction.heterogeneous (fun child : ShapeAlphabet 2 =>
    (oneLetterWindowRestriction (K := K) (P := Fin (2*split child)) q child nonnegative).trans
      (oneLetterMatrixFinRestriction q (2*split child) child))).trans
        MatrixMul.heterogeneousCoordinateRestriction

namespace Terminal

variable {T : Type*} [Fintype T]

/-- The actual complete approximate terminal output, with all physical child pools retained. -/
def permutedApproximateTarget (axes : T → Equiv.Perm (Fin 3)) (q : ℕ)
    (extreme middle : T → ℕ) (tolerance : T → ℝ) :=
  Mixed.approximateTarget (K := K) (fun type => permutedData (axes type) (extreme type) (middle type)) q
    (fun _ child => oneLetterLaw (shapeXIndex child)) (fun _ child => oneLetterLaw (shapeYIndex child))
    (fun _ child => oneLetterLaw (shapeZIndex child)) tolerance

/-- Coordinate selections realize all matrix factors of a complete approximate terminal output together. -/
def permutedApproximateMatrixRestriction (axes : T → Equiv.Perm (Fin 3)) (q : ℕ)
    (extreme middle : T → ℕ) (tolerance : T → ℝ) (nonnegative : ∀ type, 0 ≤ tolerance type) :
    CoordinateRestriction (permutedApproximateTarget (K := K) axes q extreme middle tolerance)
      (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
        (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)) := by
  unfold permutedApproximateTarget
  rw [Mixed.approximateTarget_eq_windowed]
  have regroup := Interface.unflattenRestriction
    (fun type (child : ShapeAlphabet 2) =>
      Interface.windowedPower (K := K) (P := Fin (2*permutedCounts (axes type) (extreme type) (middle type) child))
        (constituent q 1 child.val) (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (oneLetterLaw (shapeXIndex child)) (oneLetterLaw (shapeYIndex child)) (oneLetterLaw (shapeZIndex child)) (tolerance type))
  exact (regroup.trans ((CoordinateRestriction.heterogeneous (fun type =>
    oneLetterWindowTargetRestriction q (permutedCounts (axes type) (extreme type) (middle type)) (nonnegative type))).trans
      MatrixMul.heterogeneousCoordinateRestriction))

/-- All matrix factors of a mixed approximate terminal output are available together at unit contextual cost. -/
theorem contextReduction_permuted_approximate_matrix (axes : T → Equiv.Perm (Fin 3)) (q : ℕ)
    (extreme middle : T → ℕ) (tolerance : T → ℝ) (nonnegative : ∀ type, 0 ≤ tolerance type) :
    ContextReduction.{v} (permutedApproximateTarget (K := K) axes q extreme middle tolerance)
      (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
        (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)) 1 :=
  (permutedApproximateMatrixRestriction axes q extreme middle tolerance nonnegative).context

end Terminal
end
end MatrixBounds.Tensor.CW
