import CWRationalCanonicalInterfaces
import CWRationalSixfoldAssembly
import HeterogeneousExchange

/-! Shared sixfold extraction on the actual original source families, with
independent outer batch labels restored after the mixed extraction. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Numeric Empirical Interface
open scoped BigOperators
noncomputable section
variable {K S : Type} [CommRing K] [Fintype S]
variable {Types : S → Type} [∀ sector, Fintype (Types sector)]
variable {length : ∀ sector, Types sector → ℕ} {denominator : ℕ}

/-- One shared extraction advances every canonical batch at the bottleneck of the sum of its physical rate vectors. -/
theorem RationalStage.eventual_labelled_canonical_extraction
    (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (presentations : ∀ sector, RationalStage.PhysicalPresentation (stages sector))
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : ∀ sector, Types sector → ℝ)
    (widePositive : ∀ sector type, 0 < wide sector type) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : ∀ sector, Types sector → ℝ, (∀ sector type, 0 < delta sector type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (stages sector).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (heterogeneous (fun sector => heterogeneous (fun order : AxisOrder => orient order
            ((presentations sector).originalParent (K := K) (RepairRates.scale k) q (wide sector)))))
          (directSum (fun _ : Fin (copies^6) => heterogeneous (fun sector =>
            heterogeneous (fun order : AxisOrder => orient order
              ((presentations sector).originalChildren (K := K) (RepairRates.scale k) q (delta sector)))))) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ := RationalStage.eventual_labelled_sixfold_extraction (K := K)
    stages presentations denominatorPositive q wide widePositive errorPositive
  refine ⟨delta, positive, threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, retained, overhead, ?_⟩
  have before := (CoordinateRestriction.heterogeneous (fun sector =>
    CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
      physicalWindowFamilyRestriction (K := K) q (fun type => length sector type+length sector type)
        (fun type => (stages sector).weight type*RepairRates.scale k)
        (fun type => ((presentations sector).original type).parent)
        (fun type axis => ((presentations sector).original type).parentLaw ((presentations sector).law type axis))
        (wide sector) order))).context
  have after := (CoordinateRestriction.heterogeneous (fun sector =>
    CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
      physicalWindowFamilyInverseRestriction (K := K) q (fun index : ChildIndex (length sector) => length sector index.1)
        (fun index => ((presentations sector).original index.1).childWeight ((stages sector).weight index.1) index.2*RepairRates.scale k)
        (fun index => index.2.val) (fun index axis => (presentations sector).law index.1 axis index.2)
        (fun index => delta sector index.1) order))).context.batch (I := Fin (copies^6))
  simpa only [one_mul, mul_one] using (before.trans reduction).trans after

end
end MatrixBounds.Tensor.CW.Mixed
