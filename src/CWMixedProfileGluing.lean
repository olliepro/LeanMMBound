module

public import CWMixedProfiles
public import HeterogeneousFlatten

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Glue all accepted valid mixed exact targets into a genuine approximate
child interface. Invalid tuples contribute zero, and empty child pools remain
neutral. All parent-type and child-shape labels are retained. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K] {length : T → ℕ}

/-- The flattened label of a child pool retains both its parent type and its child shape. -/
abbrev ChildIndex (length : T → ℕ) := (type : T) × ShapeAlphabet (2*length type)

/-- The physical child slots associated with a flattened child-pool label. -/
abbrev ChildSlots (data : ∀ type, SplitRestrictionData (length type)) (index : ChildIndex length) :=
  (data index.1).ChildPositions index.2

/-- The actual approximate mixed target on physical child coordinates, accepting full empirical types separately in every pool. -/
def approximateTarget (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :=
  acceptedTensor (Interface.heterogeneousPower (Positions := ChildSlots data)
    (fun index : ChildIndex length => constituent (K := K) q (length index.1) index.2.val))
    (Interface.poolProfiles (fun _ x => fineWord x.val)) (Interface.poolProfiles (fun _ y => fineWord y.val))
    (Interface.poolProfiles (fun _ z => fineWord z.val))
    (fun profile => profilesAccepted data lawX tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawY tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawZ tolerance (fun type child => profile ⟨type, child⟩))

/-- Uniform batches for the valid nearby exact tuples produce complete approximate mixed outputs, at the polynomial profile-count cost. -/
theorem glue_mixed_profile_batches (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (copies rank : ℕ)
    (algorithms : ∀ profileX profileY profileZ : ChildProfileTuple data, ValidProfiles data profileX profileY profileZ →
      profilesAccepted data lawX tolerance profileX → profilesAccepted data lawY tolerance profileY →
      profilesAccepted data lawZ tolerance profileZ →
      RankLE (directSum (fun _ : Fin copies => profileTarget (K := K) data q profileX profileY profileZ)) rank) :
    RankLE (directSum (fun _ : Fin copies => approximateTarget (K := K) data q lawX lawY lawZ tolerance))
      ((Fintype.card (ChildProfileTuple data))^3*rank) := by
  let family := fun index : ChildIndex length => constituent (K := K) q (length index.1) index.2.val
  have budget := Interface.glue_heterogeneous_exact_batches (Positions := ChildSlots data) family
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (fun profile => profilesAccepted data lawX tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawY tolerance (fun type child => profile ⟨type, child⟩))
    (fun profile => profilesAccepted data lawZ tolerance (fun type child => profile ⟨type, child⟩)) copies rank (by
      intro profileX profileY profileZ acceptedX acceptedY acceptedZ
      let px : ChildProfileTuple data := fun type child => profileX ⟨type, child⟩
      let py : ChildProfileTuple data := fun type child => profileY ⟨type, child⟩
      let pz : ChildProfileTuple data := fun type child => profileZ ⟨type, child⟩
      have exactBudget : RankLE (directSum (fun _ : Fin copies => profileTarget (K := K) data q px py pz)) rank := by
        by_cases valid : ValidProfiles data px py pz
        · exact algorithms px py pz valid acceptedX acceptedY acceptedZ
        · exact invalid_profile_batch data q px py pz valid copies rank
      exact Interface.rankLE_flatten_batch (fun type child => Interface.exact (P := (data type).ChildPositions child)
        (constituent (K := K) q (length type) child.val) (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (profileCounts data px type child) (profileCounts data py type child) (profileCounts data pz type child)) exactBudget)
  convert budget using 1
  · rfl
  · simp only [Fintype.card_prod, ChildProfileTuple, Fintype.card_pi, ChildIndex, Fintype.prod_sigma, ChildSlots]
    ring

end
end MatrixBounds.Tensor.CW.Mixed
