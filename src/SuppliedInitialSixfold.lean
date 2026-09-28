import SuppliedInitialAllocation
import SuppliedSixfoldRoot

/-! Actual root extraction and all initial allocations are composed before
the scheduled level-four, level-three, and terminal rounds begin. -/
namespace MatrixBounds.Numeric.SuppliedInitialSixfold

universe v
open Tensor Tensor.CW Interface Empirical SuppliedPopulationWeights SuppliedInitialAllocation
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- A complete initial batch retains all zero factors beside its allocated active level-four windows in each source copy. -/
def batch {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun order : AxisOrder => orient order
    (product (waiting (K := K) size tolerance) (active (K := K) size tolerance)))

/-- Root extraction reaches the actual initial batch tensor with its retained-copy and overhead bounds. -/
theorem eventual_extraction {K : Type} [CommRing K] {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp (((rootWeight : ℝ)*SuppliedRootStage.retention-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v} (SuppliedSixfoldRoot.source (K := K) (RepairRates.scale k))
          (directSum (fun _ : Fin (copies^6) => batch (K := K) (RepairRates.scale k) delta)) (cost^6) := by
  obtain ⟨threshold, delta, positive, extraction⟩ := SuppliedSixfoldRoot.eventual_extraction (K := K) errorPositive
  refine ⟨max 1 threshold, delta, positive, ?_⟩
  intro k large divisible
  have sizePositive : 0 < RepairRates.scale k :=
    (show 0 < k by omega).trans_le (RepairRates.index_le_scale k)
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k (by omega) divisible
  refine ⟨copies, cost, retained, overhead, ?_⟩
  have canonical := (CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
    physicalWindowFamilyInverseRestriction (K := K) 5 (fun _ : ShapeAlphabet 16 => 8)
      (fun child => SuppliedRootPopulation.weight child*RepairRates.scale k) Subtype.val
      SuppliedHigherLaws.root4 (fun _ => delta) order)).context
  have allocation := (allocate_all (K := K) sizePositive positive.le).sixfold
  have combined := reduction.trans ((canonical.trans allocation).batch (I := Fin (copies^6)))
  simpa only [one_pow, one_mul, mul_one] using combined

end
end MatrixBounds.Numeric.SuppliedInitialSixfold
