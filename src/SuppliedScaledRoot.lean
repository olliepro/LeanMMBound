import SuppliedRootStage
import SuppliedPopulationWeights
import CWRootWeightedExtraction

/-! The supplied unrestricted source now has the same fixed integer root
coefficient and growing scale as its complete labelled descendants. -/
namespace MatrixBounds.Numeric.SuppliedScaledRoot

universe v
open Tensor Tensor.CW Empirical RepairRates SuppliedPopulationWeights
noncomputable section

/-- The fixed population coefficient reserved for the complete supplied pipeline is strictly positive. -/
theorem rootWeight_positive : 0 < rootWeight := by norm_num [rootWeight, DyadicPopulationArithmetic.denominator]

/-- The actual supplied root extracts at the population scale required by every subsequent rational allocation. -/
theorem eventual_extraction {K : Type*} [CommRing K] {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ scale k →
      ∃ copies overhead : ℕ,
        Real.exp (((rootWeight : ℝ)*SuppliedRootStage.retention-error)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (error*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := Fin (rootWeight*scale k)) 5 8)
          (directSum (fun _ : Fin copies =>
            (CertifiedRoot.data (rootWeight*scale k)).approximateTarget (K := K) 5
              (SuppliedRootStage.law 0) (SuppliedRootStage.law 1) (SuppliedRootStage.law 2) delta)) overhead :=
  RootRestrictionData.eventual_weighted_extraction.{v} 8 5 3 8 16 17592186044416 rootWeight rootWeight_positive
    (by decide) SuppliedRootStage.shape_card_bound (by decide) (by decide)
    CertifiedRoot.numerator CertifiedRoot.numerator_total (by decide)
    (SuppliedRootStage.potential 0) (SuppliedRootStage.potential 1) (SuppliedRootStage.potential 2)
    (SuppliedRootStage.potential_positive 0) (SuppliedRootStage.potential_positive 1) (SuppliedRootStage.potential_positive 2)
    (SuppliedRootStage.law 0) (SuppliedRootStage.law 1) (SuppliedRootStage.law 2)
    (SuppliedRootStage.law_range 1) (SuppliedRootStage.law_range 2) errorPositive

end
end MatrixBounds.Numeric.SuppliedScaledRoot
