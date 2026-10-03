module

public import CWRationalStage
public import HeterogeneousRegrouping

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Combine fixed rational stages of different lengths into one genuine shared
extraction. Physical rate vectors are added before the bottleneck is taken. -/
namespace MatrixBounds.Tensor.CW.Mixed.RationalStage

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {S : Type*} [Fintype S] {Types : S → Type*} [∀ sector, Fintype (Types sector)]
variable {length : ∀ sector, Types sector → ℕ} {denominator : ℕ}

/-- Assemble separately labelled stages into one mixed family, retaining every population and physical law. -/
def combine (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator) :
    RationalStage ((sector : S) × Types sector) (fun index => length index.1 index.2) denominator where
  splits index := (stages index.1).splits index.2
  weight index := (stages index.1).weight index.2
  weightPositive index := (stages index.1).weightPositive index.2
  divisible index := (stages index.1).divisible index.2
  law index := (stages index.1).law index.2
  lawRange index := (stages index.1).lawRange index.2
  potential index := (stages index.1).potential index.2
  potentialPositive index := (stages index.1).potentialPositive index.2

/-- One shared extraction sees the sum of the physical rates, before choosing its bottleneck axis. -/
theorem combine_rates (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator) :
    (combine stages).rates = ∑ sector, (stages sector).rates := by
  funext axis
  fin_cases axis <;> simp [rates, combine, Fintype.sum_sigma]

variable {K : Type*} [CommRing K]

/-- The full fixed-law parent tensor supplied by one stage. -/
def parent {T : Type*} [Fintype T] {len : T → ℕ} (stage : RationalStage T len denominator)
    (size q : ℕ) (wide : T → ℝ) :=
  rationalParent (K := K) stage.splits stage.weight size q
    (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2) wide

/-- The full fixed-population child tensor obtained from one stage. -/
def children {T : Type*} [Fintype T] {len : T → ℕ} (stage : RationalStage T len denominator)
    (size q : ℕ) (delta : T → ℝ) :=
  rationalChildren (K := K) stage.splits stage.weight size q
    (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2) delta

/-- Flatten the actual parent windows of all active stages into the one shared mixed input. -/
def combineParentRestriction (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (size q : ℕ) (wide : ∀ sector, Types sector → ℝ) :
    CoordinateRestriction (Interface.heterogeneous (fun sector => (stages sector).parent (K := K) size q (wide sector)))
      ((combine stages).parent (K := K) size q (fun index => wide index.1 index.2)) :=
  Interface.flattenRestriction _

/-- Regroup every shared output child by its original stage while preserving all child and position labels. -/
def combineChildrenRestriction (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (size q : ℕ) (delta : ∀ sector, Types sector → ℝ) :
    CoordinateRestriction ((combine stages).children (K := K) size q (fun index => delta index.1 index.2))
      (Interface.heterogeneous (fun sector => (stages sector).children (K := K) size q (delta sector))) where
  left entries index := entries index.1.1 ⟨index.1.2, index.2⟩
  middle entries index := entries index.1.1 ⟨index.1.2, index.2⟩
  right entries index := entries index.1.1 ⟨index.1.2, index.2⟩
  coefficient x y z := by
    simp only [children, rationalChildren, Interface.heterogeneous, Fintype.prod_sigma, combine] <;> rfl

/-- Arbitrarily many fixed rational active stages share one extraction and earn the bottleneck of their summed rates. -/
theorem eventual_shared_extraction
    (stages : ∀ sector, RationalStage (Types sector) (length sector) denominator)
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : ∀ sector, Types sector → ℝ)
    (widePositive : ∀ sector type, 0 < wide sector type) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : ∀ sector, Types sector → ℝ, (∀ sector type, 0 < delta sector type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (stages sector).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (Interface.heterogeneous (fun sector => (stages sector).parent (K := K) (RepairRates.scale k) q (wide sector)))
          (directSum (fun _ : Fin copies => Interface.heterogeneous (fun sector =>
            (stages sector).children (K := K) (RepairRates.scale k) q (delta sector)))) cost := by
  obtain ⟨delta, positive, threshold, extraction⟩ := (combine stages).eventual_extraction (K := K)
    denominatorPositive q (fun index => wide index.1 index.2) (fun index => widePositive index.1 index.2) errorPositive
  refine ⟨(fun sector type => delta ⟨sector, type⟩), (fun sector type => positive ⟨sector, type⟩), threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, ?_, overhead, ?_⟩
  · simpa only [combine_rates] using retained
  · have combined := ((combineParentRestriction stages (RepairRates.scale k) q wide).context.trans reduction).trans
      ((combineChildrenRestriction stages (RepairRates.scale k) q (fun sector type => delta ⟨sector, type⟩)).context.batch)
    simpa only [one_mul, mul_one] using combined

end
end MatrixBounds.Tensor.CW.Mixed.RationalStage
