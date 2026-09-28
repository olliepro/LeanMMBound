import SuppliedWaitingZero2Data
import HeterogeneousProductRegrouping

/-! The actual complete waiting zero2 tensor restricts to exactly its positive
populations, retaining all original windows and complete allocation histories. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedLevel3Transition SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- Complete source windows for precisely the positive waiting populations. -/
def source (size : ℕ) (tolerance : Label3 → ℝ) :=
  heterogeneous (fun label : Active => sourceWindow (K := K) label.val size (tolerance label.val.1))

/-- Restore every exact original leaf window, then omit only neutral zero coefficients. -/
def selectRestriction (size : ℕ) (tolerance : Label3 → ℝ) :
    CoordinateRestriction (waiting (K := K) size tolerance) (source (K := K) size tolerance) :=
  ((flattenProductRestriction (fun previous zero => SuppliedLevel3Transition.childWindow (K := K) previous
      (child zero) size (tolerance previous))).trans
    (CoordinateRestriction.heterogeneous (fun label : Label => sourceRestriction (K := K) label size (tolerance label.1)))).trans
    (dropZeroWeightRestriction weight size
      (fun label => constituent (K := K) 5 2 (shape label.2))
      (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
      (fun label => law label 0) (fun label => law label 1) (fun label => law label 2)
      (fun label => tolerance label.1))

/-- Product row indices of all separately labelled positive waiting matrices. -/
abbrev MatrixRows (size : ℕ) := ∀ label : Active, Rows label.val size

/-- Product contracted indices of all separately labelled positive waiting matrices. -/
abbrev MatrixInner (size : ℕ) := ∀ label : Active, Inner label.val size

/-- Product column indices of all separately labelled positive waiting matrices. -/
abbrev MatrixColumns (size : ℕ) := ∀ label : Active, Columns label.val size

end
end MatrixBounds.Numeric.SuppliedWaitingZero2
