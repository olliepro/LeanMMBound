import ContextHeterogeneousGluing
import ContextHeterogeneousFlatten
import CWMixedProfileGluing

/-! Complete mixed profile gluing retains every waiting factor and prior batch.
Invalid profile tuples vanish as actual coefficient tensors. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K U V W : Type*} [Fintype T] [CommRing K] {length : T → ℕ}

/-- Uniform batches for the valid nearby exact tuples produce complete approximate mixed outputs, at the polynomial profile-count cost. -/
theorem contextReduction_glue_mixed_profiles (source : Coeff K U V W) (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (copies cost : ℕ)
    (algorithms : ∀ profileX profileY profileZ : ChildProfileTuple data, ValidProfiles data profileX profileY profileZ →
      profilesAccepted data lawX tolerance profileX → profilesAccepted data lawY tolerance profileY →
      profilesAccepted data lawZ tolerance profileZ →
      ContextReduction.{v} source (directSum (fun _ : Fin copies => profileTarget (K := K) data q profileX profileY profileZ)) cost) :
    ContextReduction.{v} source (directSum (fun _ : Fin copies => approximateTarget (K := K) data q lawX lawY lawZ tolerance))
      ((Fintype.card (ChildProfileTuple data))^3*cost) := by
  let family := fun index : ChildIndex length => constituent (K := K) q (length index.1) index.2.val
  have budget := Interface.contextReduction_glue_heterogeneous (Positions := ChildSlots data) source family
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (fun profile => profilesAccepted data lawX tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawY tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawZ tolerance (fun type child => profile ⟨type, child⟩)) copies cost (by
      intro profileX profileY profileZ acceptedX acceptedY acceptedZ
      let px : ChildProfileTuple data := fun type child => profileX ⟨type, child⟩
      let py : ChildProfileTuple data := fun type child => profileY ⟨type, child⟩
      let pz : ChildProfileTuple data := fun type child => profileZ ⟨type, child⟩
      have exactBudget : ContextReduction.{v} source (directSum (fun _ : Fin copies => profileTarget (K := K) data q px py pz)) cost := by
        by_cases valid : ValidProfiles data px py pz
        · exact algorithms px py pz valid acceptedX acceptedY acceptedZ
        · have zero : directSum (fun _ : Fin copies => profileTarget (K := K) data q px py pz) = fun _ _ _ => 0 := by
            rw [profileTarget_invalid_zero data q px py pz valid]
            funext x y z
            simp only [directSum, ite_self]
          rw [zero]
          exact contextReduction_zero source cost
      have flattened := (Interface.contextReduction_flatten.{v} (fun type child => Interface.exact (P := (data type).ChildPositions child)
        (constituent (K := K) q (length type) child.val) (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (profileCounts data px type child) (profileCounts data py type child) (profileCounts data pz type child))).batch (I := Fin copies)
      simpa only [one_mul] using exactBudget.trans flattened)
  convert budget using 1
  simp only [Fintype.card_prod, ChildProfileTuple, Fintype.card_pi, ChildIndex, Fintype.prod_sigma, ChildSlots]
  ring

end
end MatrixBounds.Tensor.CW.Mixed
