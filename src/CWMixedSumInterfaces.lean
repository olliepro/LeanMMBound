import CWWindowedInterfaces
import HeterogeneousRegrouping

/-! A shared extraction round can contain two arbitrary families of recursion
levels. Its actual complete output regroups into both families at unit cost. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T S K : Type*} [Fintype T] [Fintype S] [CommRing K]
variable {length : T → ℕ} {length' : S → ℕ}

/-- Each side's finite position set makes the combined dependent family finite. -/
instance sumPositionsFintype {Positions : T → Type u} {Positions' : S → Type u}
    [∀ type, Fintype (Positions type)] [∀ type, Fintype (Positions' type)] :
    ∀ type, Fintype (Sum.elim Positions Positions' type) :=
  Sum.rec (fun type => inferInstanceAs (Fintype (Positions type)))
    (fun type => inferInstanceAs (Fintype (Positions' type)))

/-- Nonempty active populations remain nonempty after combining labelled families. -/
instance sumPositionsNonempty {Positions : T → Type u} {Positions' : S → Type u}
    [∀ type, Nonempty (Positions type)] [∀ type, Nonempty (Positions' type)] :
    ∀ type, Nonempty (Sum.elim Positions Positions' type) :=
  Sum.rec (fun type => inferInstanceAs (Nonempty (Positions type)))
    (fun type => inferInstanceAs (Nonempty (Positions' type)))

/-- Combine two labelled split families into one family for a single shared hash round. -/
def sumData (first : ∀ type, SplitRestrictionData (length type))
    (second : ∀ type, SplitRestrictionData (length' type)) :
    ∀ type : T ⊕ S, SplitRestrictionData (Sum.elim length length' type) := Sum.rec first second

/-- Combine fixed child laws while retaining each family's possibly different word lengths. -/
def sumLaw (first : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (second : ∀ type, ShapeAlphabet (2*length' type) → (Fin (length' type) → Fin 3) → ℝ) :
    ∀ type : T ⊕ S, ShapeAlphabet (2*Sum.elim length length' type) →
      (Fin (Sum.elim length length' type) → Fin 3) → ℝ := Sum.rec first second

/-- The complete shared-round output separates into both labelled child families without any additional extraction. -/
def sumApproximateRestriction
    (first : ∀ type, SplitRestrictionData (length type)) (second : ∀ type, SplitRestrictionData (length' type))
    (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (lawX' lawY' lawZ' : ∀ type, ShapeAlphabet (2*length' type) → (Fin (length' type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (tolerance' : S → ℝ) :
    CoordinateRestriction
      (approximateTarget (K := K) (sumData first second) q (sumLaw lawX lawX')
        (sumLaw lawY lawY') (sumLaw lawZ lawZ') (Sum.elim tolerance tolerance'))
      (product (approximateTarget (K := K) first q lawX lawY lawZ tolerance)
        (approximateTarget (K := K) second q lawX' lawY' lawZ' tolerance')) := by
  rw [approximateTarget_eq_windowed, approximateTarget_eq_windowed, approximateTarget_eq_windowed]
  refine ⟨(fun entries index => ?_), (fun entries index => ?_), (fun entries index => ?_), ?_⟩
  · rcases index with ⟨type | type, child⟩
    · exact entries.1 ⟨type, child⟩
    · exact entries.2 ⟨type, child⟩
  · rcases index with ⟨type | type, child⟩
    · exact entries.1 ⟨type, child⟩
    · exact entries.2 ⟨type, child⟩
  · rcases index with ⟨type | type, child⟩
    · exact entries.1 ⟨type, child⟩
    · exact entries.2 ⟨type, child⟩
  · intro x y z
    simp only [Interface.heterogeneous, product, Fintype.prod_sigma, Fintype.prod_sum_type]
    rfl

/-- Two available parent-window products regroup as the input of one shared mixed extraction. -/
def sumParentRestriction {Positions : T → Type u} {Positions' : S → Type u}
    [∀ type, Fintype (Positions type)] [∀ type, Fintype (Positions' type)]
    [∀ type, Nonempty (Positions type)] [∀ type, Nonempty (Positions' type)]
    (first : ∀ type, SplitRestrictionData (length type)) (second : ∀ type, SplitRestrictionData (length' type))
    (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (lawX' lawY' lawZ' : ∀ type, ShapeAlphabet (2*length' type) → (Fin (length' type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (tolerance' : S → ℝ) :
    CoordinateRestriction
      (product (parentInterface (K := K) first q
        (nominalWindows (Positions := Positions) first lawX tolerance)
        (nominalWindows (Positions := Positions) first lawY tolerance)
        (nominalWindows (Positions := Positions) first lawZ tolerance))
        (parentInterface (K := K) second q
          (nominalWindows (Positions := Positions') second lawX' tolerance')
          (nominalWindows (Positions := Positions') second lawY' tolerance')
          (nominalWindows (Positions := Positions') second lawZ' tolerance')))
      (parentInterface (K := K) (sumData first second) q
        (nominalWindows (Positions := Sum.elim Positions Positions') (sumData first second)
          (sumLaw lawX lawX') (Sum.elim tolerance tolerance'))
        (nominalWindows (Positions := Sum.elim Positions Positions') (sumData first second)
          (sumLaw lawY lawY') (Sum.elim tolerance tolerance'))
        (nominalWindows (Positions := Sum.elim Positions Positions') (sumData first second)
          (sumLaw lawZ lawZ') (Sum.elim tolerance tolerance'))) := by
  rw [nominalParent_eq_windowed, nominalParent_eq_windowed, nominalParent_eq_windowed]
  refine ⟨(fun entries => (fun type => entries (.inl type), fun type => entries (.inr type))),
    (fun entries => (fun type => entries (.inl type), fun type => entries (.inr type))),
    (fun entries => (fun type => entries (.inl type), fun type => entries (.inr type))), ?_⟩
  intro x y z
  simp only [Interface.heterogeneous, product, Fintype.prod_sum_type]
  rfl

end
end MatrixBounds.Tensor.CW.Mixed
