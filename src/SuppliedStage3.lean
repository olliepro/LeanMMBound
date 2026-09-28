import SuppliedHigherLaws
import CWRationalPermutations
import CWRationalMixedExtraction
import PhysicalRoles

/-! Actual level-3 shared extraction with all original source parameters and
physical role choices instantiated. Labels may retain arbitrary source multiplicities. -/
namespace MatrixBounds.Numeric.SuppliedStage3

universe v
open Tensor Tensor.CW Entropy Empirical RepairRates
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- One original parent parameter label, preserving its source coordinates. -/
abbrev Source := Fin 945 × Fin 6

/-- Actual rational split in a specified physical extraction role. -/
def split (source : Source) (role : AxisOrder) : RationalSplit 2 17592186044416 :=
  (SuppliedTypedParameters.level3Split source.1 source.2).permute role.permutation

/-- The complete supplied child law transported into its physical extraction role. -/
def law (source : Source) (role : AxisOrder) (axis : Fin 3) (child : ShapeAlphabet 4) :
    (Fin 2 → Fin 3) → ℝ :=
  SuppliedLeafLaws.law source.1 source.2 ((shapeAlphabetPermutation role.permutation 4).symm child)
    (role.permutation axis)

/-- Every transported supplied child-law coordinate lies in the probability interval. -/
theorem law_range (source : Source) (role : AxisOrder) (axis : Fin 3)
    (child : ShapeAlphabet 4) (word : Fin 2 → Fin 3) :
    0 ≤ law source role axis child word ∧ law source role axis child word ≤ 1 :=
  SuppliedLeafLaws.law_range source.1 source.2 _ _ _

/-- The permuted extraction parent center is exactly the corresponding original complete parent law. -/
theorem parent_center (source : Source) (role : AxisOrder) (axis : Fin 3) :
    (split source role).parentLaw (law source role axis) =
      SuppliedLeafLaws.parent3 source.1 source.2 (role.permutation axis) :=
  (SuppliedTypedParameters.level3Split source.1 source.2).permute_parentLaw role.permutation
    (fun child => SuppliedLeafLaws.law source.1 source.2 child (role.permutation axis))

/-- Exact original Gibbs potentials in the chosen physical role. -/
def potential (source : Source) (role : AxisOrder) (axis : Fin 3) (coordinate : Fin 5) : ℝ :=
  ((SuppliedTypedParameters.potential3 source.1 source.2 (role.permutation axis)).rational coordinate : ℝ)

/-- Every transported supplied Gibbs potential is strictly positive. -/
theorem potential_positive (source : Source) (role : AxisOrder) (axis : Fin 3) (coordinate : Fin 5) :
    0 < potential source role axis coordinate :=
  (SuppliedTypedParameters.potential3 source.1 source.2 (role.permutation axis)).rational_positive coordinate

/-- The actual complete child shape alphabet fits the extraction's finite encoding budget. -/
theorem shape_card_bound : Fintype.card (ShapeAlphabet 4) ≤ 2^4 := by
  rw [Fintype.card_congr (shapeColumnEquiv 4).symm, Fintype.card_fin]
  decide

/-- Any labelled collection of supplied parents admits shared contextual extraction at its actual weighted rate.
All child laws, parent centers, Gibbs positivity, and reference edges are supplied internally. -/
theorem eventual_extraction {K T : Type*} [CommRing K] [Fintype T]
    (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type)
    (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    {degreeError copyError costError : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ scale k → ∃ copies overhead : ℕ,
        Real.exp ((Mixed.rationalRetention (fun type => split (source type) (role type)) weight
          (fun type => potential (source type) (role type) 0)
          (fun type => potential (source type) (role type) 1)
          (fun type => potential (source type) (role type) 2)
          (fun type => law (source type) (role type) 1)
          (fun type => law (source type) (role type) 2) degreeError-copyError)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (Mixed.rationalParent (K := K) (fun type => split (source type) (role type)) weight (scale k) 5
          (fun type => law (source type) (role type) 0)
          (fun type => law (source type) (role type) 1)
          (fun type => law (source type) (role type) 2) wide)
          (directSum (fun _ : Fin copies =>
            Mixed.approximateTarget (K := K) (Mixed.rationalData (fun type => split (source type) (role type)) weight (scale k)) 5
              (fun type => law (source type) (role type) 0)
              (fun type => law (source type) (role type) 1)
              (fun type => law (source type) (role type) 2) delta)) overhead :=
  Mixed.eventual_rational_extraction.{v} (fun type => split (source type) (role type)) weight weightPositive (by decide)
    5 3 4 (fun _ => 4) (by decide) (fun _ => shape_card_bound) (by decide) (fun _ => by decide)
    wide widePositive (fun type => law (source type) (role type) 0)
    (fun type => law (source type) (role type) 1) (fun type => law (source type) (role type) 2)
    (fun type => law_range (source type) (role type) 0)
    (fun type => law_range (source type) (role type) 1) (fun type => law_range (source type) (role type) 2)
    (fun type => potential (source type) (role type) 0)
    (fun type => potential (source type) (role type) 1) (fun type => potential (source type) (role type) 2)
    (fun type => potential_positive (source type) (role type) 0)
    (fun type => potential_positive (source type) (role type) 1) (fun type => potential_positive (source type) (role type) 2)
    degreePositive copyPositive costPositive

end
end MatrixBounds.Numeric.SuppliedStage3
