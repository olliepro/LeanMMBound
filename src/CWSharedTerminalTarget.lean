import CWMixedSumInterfaces
import CWPermutedTerminalWindowTarget
import ContextComposition

/-! Terminal matrix conversion acts on the output of one shared mixed round,
preserving its higher-level child windows and every retained copy label. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric Terminal
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T S K : Type*} [Fintype T] [Fintype S] [CommRing K] {length : T → ℕ}

/-- Convert all terminal factors of a shared output to their complete matrix while keeping the ordinary child windows. -/
def sharedTerminalRestriction (data : ∀ type, SplitRestrictionData (length type))
    (axes : S → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : S → ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (terminalTolerance : S → ℝ) (nonnegative : ∀ type, 0 ≤ terminalTolerance type) :
    CoordinateRestriction
      (approximateTarget (K := K)
        (sumData data (fun type => permutedData (axes type) (extreme type) (middle type))) q
        (sumLaw lawX (fun _ child => oneLetterLaw (shapeXIndex child)))
        (sumLaw lawY (fun _ child => oneLetterLaw (shapeYIndex child)))
        (sumLaw lawZ (fun _ child => oneLetterLaw (shapeZIndex child))) (Sum.elim tolerance terminalTolerance))
      (product (approximateTarget (K := K) data q lawX lawY lawZ tolerance)
        (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
          (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle))) :=
  (sumApproximateRestriction data (fun type => permutedData (axes type) (extreme type) (middle type)) q
    lawX lawY lawZ (fun _ child => oneLetterLaw (shapeXIndex child))
    (fun _ child => oneLetterLaw (shapeYIndex child)) (fun _ child => oneLetterLaw (shapeZIndex child))
    tolerance terminalTolerance).trans
      ((CoordinateRestriction.refl _).product
        (permutedApproximateMatrixRestriction axes q extreme middle terminalTolerance nonnegative))

/-- The actual shared extraction produces complete terminal matrices in every retained copy at the original shared-round cost. -/
theorem shared_terminal_output {X Y Z : Type*} (source : Coeff K X Y Z)
    (data : ∀ type, SplitRestrictionData (length type))
    (axes : S → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : S → ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (terminalTolerance : S → ℝ) (nonnegative : ∀ type, 0 ≤ terminalTolerance type)
    (copies cost : ℕ)
    (extraction : ContextReduction.{v} source (directSum (fun _ : Fin copies =>
      approximateTarget (K := K) (sumData data (fun type => permutedData (axes type) (extreme type) (middle type))) q
        (sumLaw lawX (fun _ child => oneLetterLaw (shapeXIndex child)))
        (sumLaw lawY (fun _ child => oneLetterLaw (shapeYIndex child)))
        (sumLaw lawZ (fun _ child => oneLetterLaw (shapeZIndex child))) (Sum.elim tolerance terminalTolerance))) cost) :
    ContextReduction.{v} source (directSum (fun _ : Fin copies =>
      product (approximateTarget (K := K) data q lawX lawY lawZ tolerance)
        (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
          (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)))) cost := by
  simpa only [one_mul] using extraction.trans
    ((sharedTerminalRestriction data axes q extreme middle lawX lawY lawZ tolerance terminalTolerance nonnegative).context.batch)

end
end MatrixBounds.Tensor.CW.Mixed
