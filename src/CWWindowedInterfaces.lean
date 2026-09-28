import WindowedInterface
import CWMixedProfileGluing
import CWMixedNearbySource

/-! Actual input and output tensors share a common windowed-power form.
Parent and child labels stay explicit for regrouping and strategy allocation. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {length : T → ℕ}

/-- The full approximate output is the product of independently windowed child-pool powers. -/
theorem approximateTarget_eq_windowed (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :
    approximateTarget (K := K) data q lawX lawY lawZ tolerance =
      Interface.heterogeneous (fun index : ChildIndex length => Interface.windowedPower (P := ChildSlots data index)
        (constituent (K := K) q (length index.1) index.2.val)
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (lawX index.1 index.2) (lawY index.1 index.2) (lawZ index.1 index.2) (tolerance index.1)) := by
  rw [Interface.heterogeneous_windowedPower]
  funext x y z
  simp only [approximateTarget, acceptedTensor, profilesAccepted, Interface.poolProfiles]
  congr 1
  apply propext
  simp only [Sigma.forall]

/-- A nonempty nominal parent interface is the same physical windowed-power product. -/
theorem nominalParent_eq_windowed {Positions : T → Type*} [∀ type, Fintype (Positions type)]
    [∀ type, Nonempty (Positions type)] (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :
    parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX tolerance) (nominalWindows (Positions := Positions) data lawY tolerance)
      (nominalWindows (Positions := Positions) data lawZ tolerance) =
      Interface.heterogeneous (fun type => Interface.windowedPower (P := Positions type)
        (constituent (K := K) q (length type+length type) (data type).parent)
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        ((data type).parentLaw (P := Positions type) (lawX type)) ((data type).parentLaw (P := Positions type) (lawY type)) ((data type).parentLaw (P := Positions type) (lawZ type)) (tolerance type)) := by
  funext x y z
  apply Finset.prod_congr rfl
  intro type _
  simp only [SplitRestrictionData.parentInterface, Interface.windowedPower, acceptedTensor,
    Interface.activeWithin_nonempty]
  rfl

end
end MatrixBounds.Tensor.CW.Mixed
