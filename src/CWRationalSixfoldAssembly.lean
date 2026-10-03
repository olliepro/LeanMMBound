module

public import CWRationalStagePresentation
public import CWRationalStageAssembly
public import HeterogeneousExchange

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Sixfold shared stages keep their independent outer batch labels. Explicit
coordinate maps connect the mixed extraction to scheduled batch products. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric Interface
open scoped BigOperators
noncomputable section
variable {K S : Type} [CommRing K] [Fintype S]
variable {Types : S → Type} [∀ sector, Fintype (Types sector)]
variable {length : ∀ sector, Types sector → ℕ} {denominator : ℕ}

/-- Assemble the original source presentations of independently labelled rational stages. -/
def RationalStage.PhysicalPresentation.combine
    (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (presentations : ∀ sector, RationalStage.PhysicalPresentation (stages sector)) :
    RationalStage.PhysicalPresentation (RationalStage.combine stages) where
  original index := (presentations index.1).original index.2
  role index := (presentations index.1).role index.2
  law index := (presentations index.1).law index.2
  splits_eq index := (presentations index.1).splits_eq index.2
  laws_eq index axis := (presentations index.1).laws_eq index.2 axis

/-- Flatten all active batch labels into the six-region parent interface used by one shared extraction. -/
def combineSixfoldParentRestriction
    (splits : ∀ sector type, RationalSplit (length sector type) denominator)
    (weight : ∀ sector, Types sector → ℕ) (size q : ℕ)
    (law : ∀ sector type, Fin 3 → ShapeAlphabet (2*length sector type) → (Fin (length sector type) → Fin 3) → ℝ)
    (tolerance : ∀ sector, Types sector → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun sector => sixfoldParent (K := K) (splits sector) (weight sector) size q (law sector) (tolerance sector)))
      (sixfoldParent (K := K) (fun index : (sector : S) × Types sector => splits index.1 index.2)
        (fun index => weight index.1 index.2) size q (fun index => law index.1 index.2)
        (fun index => tolerance index.1 index.2)) where
  left entries sector source type := entries source ⟨sector, type⟩
  middle entries sector source type := entries source ⟨sector, type⟩
  right entries sector source type := entries source ⟨sector, type⟩
  coefficient x y z := by
    simp only [sixfoldParent, heterogeneous, Fintype.prod_sigma]
    exact Finset.prod_comm

/-- Restore every batch's full sixfold child family with all original parent and child labels preserved. -/
def combineSixfoldChildrenRestriction
    (splits : ∀ sector type, RationalSplit (length sector type) denominator)
    (weight : ∀ sector, Types sector → ℕ) (size q : ℕ)
    (law : ∀ sector type, Fin 3 → ShapeAlphabet (2*length sector type) → (Fin (length sector type) → Fin 3) → ℝ)
    (tolerance : ∀ sector, Types sector → ℝ) :
    CoordinateRestriction
      (sixfoldChildren (K := K) (fun index : (sector : S) × Types sector => splits index.1 index.2)
        (fun index => weight index.1 index.2) size q (fun index => law index.1 index.2)
        (fun index => tolerance index.1 index.2))
      (heterogeneous (fun sector => sixfoldChildren (K := K) (splits sector) (weight sector) size q (law sector) (tolerance sector))) where
  left entries source index := entries index.1.1 source ⟨index.1.2, index.2⟩
  middle entries source index := entries index.1.1 source ⟨index.1.2, index.2⟩
  right entries source index := entries index.1.1 source ⟨index.1.2, index.2⟩
  coefficient x y z := by
    simp only [sixfoldChildren, heterogeneous, Fintype.prod_sigma]
    exact Finset.prod_comm

/-- One actual shared six-region extraction advances every active batch while retaining its original outer label. -/
theorem RationalStage.eventual_labelled_sixfold_extraction
    (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (presentations : ∀ sector, RationalStage.PhysicalPresentation (stages sector))
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : ∀ sector, Types sector → ℝ)
    (widePositive : ∀ sector type, 0 < wide sector type) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : ∀ sector, Types sector → ℝ, (∀ sector type, 0 < delta sector type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (stages sector).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (heterogeneous (fun sector => sixfoldParent (K := K) (presentations sector).original
            (stages sector).weight (RepairRates.scale k) q (presentations sector).law (wide sector)))
          (directSum (fun _ : Fin (copies^6) => heterogeneous (fun sector =>
            sixfoldChildren (K := K) (presentations sector).original (stages sector).weight
              (RepairRates.scale k) q (presentations sector).law (delta sector)))) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ := RationalStage.eventual_sixfold_extraction (K := K)
    (RationalStage.combine stages) (RationalStage.PhysicalPresentation.combine stages presentations)
    denominatorPositive q (fun index => wide index.1 index.2) (fun index => widePositive index.1 index.2) errorPositive
  refine ⟨(fun sector type => delta ⟨sector, type⟩), (fun sector type => positive ⟨sector, type⟩), threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, ?_, overhead, ?_⟩
  · simpa only [RationalStage.combine_rates] using retained
  · have before := (combineSixfoldParentRestriction (K := K) (fun sector => (presentations sector).original)
      (fun sector => (stages sector).weight) (RepairRates.scale k) q (fun sector => (presentations sector).law) wide).context
    have after := (combineSixfoldChildrenRestriction (K := K) (fun sector => (presentations sector).original)
      (fun sector => (stages sector).weight) (RepairRates.scale k) q (fun sector => (presentations sector).law)
      (fun sector type => delta ⟨sector, type⟩)).context.batch (I := Fin (copies^6))
    simpa only [one_mul, mul_one] using (before.trans reduction).trans after

end
end MatrixBounds.Tensor.CW.Mixed
