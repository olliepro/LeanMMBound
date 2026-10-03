module

public import CWRootData
public import CWReprofile
public import ApproximateProfiles
public import ContextHeterogeneousGluing
public import WindowedInterface

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The full root output is glued from all bounded exact child-profile tuples.
Invalid tuples vanish coefficientwise; the source remains the original CW power. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K U V W : Type*} [CommRing K] {length : ℕ}

/-- One bounded empirical profile for each separately labelled root child pool. -/
abbrev ChildProfileTuple (data : RootRestrictionData length) :=
  ∀ child : ShapeAlphabet (2*length), Profiles (data.ChildPositions child) (Fin length → Fin 3)

/-- Read the integer multiplicities in every root child-profile label. -/
def profileCounts (data : RootRestrictionData length) (profiles : data.ChildProfileTuple) :=
  fun child symbol => (profiles child symbol).val

/-- Feasibility, supported totals, and forced complementary profiles for all root child pools. -/
def ValidProfiles (data : RootRestrictionData length) (profileX profileY profileZ : data.ChildProfileTuple) : Prop :=
  ∀ child, ExactProfilesValid (data.ChildPositions child) length child.val
    (data.profileCounts profileX child) (data.profileCounts profileY child) (data.profileCounts profileZ child)

/-- Replace valid root fine profiles while leaving the root split counts and all coarse graph data fixed. -/
def reprofile (data : RootRestrictionData length) (profileX profileY profileZ : data.ChildProfileTuple)
    (valid : data.ValidProfiles profileX profileY profileZ) : RootRestrictionData length :=
  { data with
    fineX := data.profileCounts profileX
    fineY := data.profileCounts profileY
    fineZ := data.profileCounts profileZ
    zeroZ := fun child => (valid child).zeroZ
    zeroX := fun child => (valid child).zeroX
    zeroY := fun child => (valid child).zeroY }

/-- Actual exact target associated with arbitrary bounded fine-profile labels. -/
def profileTarget (data : RootRestrictionData length) (q : ℕ)
    (profileX profileY profileZ : data.ChildProfileTuple) :=
  exactChildren (K := K) (Positions := data.ChildPositions) q (fun _ => length) Subtype.val
    (data.profileCounts profileX) (data.profileCounts profileY) (data.profileCounts profileZ)

/-- Reprofiled root data produces exactly the tensor named by those child-profile labels. -/
theorem target_reprofile (data : RootRestrictionData length) (q : ℕ)
    (profileX profileY profileZ : data.ChildProfileTuple) (valid : data.ValidProfiles profileX profileY profileZ) :
    (data.reprofile profileX profileY profileZ valid).target (K := K) q =
      data.profileTarget (K := K) q profileX profileY profileZ := rfl

/-- Any invalid root child-profile tuple is identically zero as a coefficient tensor. -/
theorem profileTarget_invalid_zero (data : RootRestrictionData length) (q : ℕ)
    (profileX profileY profileZ : data.ChildProfileTuple) (invalid : ¬data.ValidProfiles profileX profileY profileZ) :
    data.profileTarget (K := K) q profileX profileY profileZ = fun _ _ _ => 0 :=
  exactChildren_invalid_zero q (fun _ => length) Subtype.val _ _ _ invalid

omit [CommRing K] in
/-- Valid root profile tuples supply complete fine-part representatives on all three axes. -/
theorem valid_profiles_representatives (data : RootRestrictionData length)
    (profileX profileY profileZ : data.ChildProfileTuple) (valid : data.ValidProfiles profileX profileY profileZ) :
    Nonempty (data.TargetParts (data.profileCounts profileX)) ∧
    Nonempty (data.TargetParts (data.profileCounts profileY)) ∧ Nonempty (data.TargetParts (data.profileCounts profileZ)) :=
  ⟨⟨fun child => Classical.choice (valid child).feasibleX⟩,
    ⟨fun child => Classical.choice (valid child).feasibleY⟩, ⟨fun child => Classical.choice (valid child).feasibleZ⟩⟩

/-- Complete empirical windows in every root pool, with no constraint on an empty pool. -/
def profilesAccepted (data : RootRestrictionData length)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (tolerance : ℝ)
    (profile : data.ChildProfileTuple) : Prop :=
  ∀ child, ActiveProfileWithin (law child) tolerance (profile child)

/-- Full approximate root output on the actual constituent coordinates, with every child pool separately labelled. -/
def approximateTarget (data : RootRestrictionData length) (q : ℕ)
    (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :=
  acceptedTensor (Interface.heterogeneousPower (Positions := data.ChildPositions)
    (fun child : ShapeAlphabet (2*length) => constituent (K := K) q length child.val))
    (Interface.poolProfiles (fun _ x => fineWord x.val)) (Interface.poolProfiles (fun _ y => fineWord y.val))
    (Interface.poolProfiles (fun _ z => fineWord z.val))
    (data.profilesAccepted lawX tolerance) (data.profilesAccepted lawY tolerance) (data.profilesAccepted lawZ tolerance)

/-- The complete root output has the same windowed-power interface form used by subsequent stages. -/
theorem approximateTarget_eq_windowed (data : RootRestrictionData length) (q : ℕ)
    (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :
    data.approximateTarget (K := K) q lawX lawY lawZ tolerance =
      Interface.heterogeneous (fun child : ShapeAlphabet (2*length) =>
        Interface.windowedPower (P := data.ChildPositions child) (constituent (K := K) q length child.val)
          (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
          (lawX child) (lawY child) (lawZ child) tolerance) := by
  rw [Interface.heterogeneous_windowedPower]
  rfl

set_option maxHeartbeats 2000000 in
/-- Uniform contextual extractions for accepted valid exact profiles glue to the whole approximate root target. -/
theorem contextReduction_glue_profiles (source : Coeff K U V W) (data : RootRestrictionData length) (q : ℕ)
    (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) (copies cost : ℕ)
    (algorithms : ∀ profileX profileY profileZ : data.ChildProfileTuple, data.ValidProfiles profileX profileY profileZ →
      data.profilesAccepted lawX tolerance profileX → data.profilesAccepted lawY tolerance profileY →
      data.profilesAccepted lawZ tolerance profileZ →
      ContextReduction.{v} source (directSum (fun _ : Fin copies => data.profileTarget (K := K) q profileX profileY profileZ)) cost) :
    ContextReduction.{v} source (directSum (fun _ : Fin copies => data.approximateTarget (K := K) q lawX lawY lawZ tolerance))
      ((Fintype.card data.ChildProfileTuple)^3*cost) := by
  have budget := Interface.contextReduction_glue_heterogeneous (Positions := data.ChildPositions) source
    (fun child : ShapeAlphabet (2*length) => constituent (K := K) q length child.val)
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (data.profilesAccepted lawX tolerance) (data.profilesAccepted lawY tolerance) (data.profilesAccepted lawZ tolerance)
    copies cost (by
      intro profileX profileY profileZ acceptedX acceptedY acceptedZ
      by_cases valid : data.ValidProfiles profileX profileY profileZ
      · exact algorithms profileX profileY profileZ valid acceptedX acceptedY acceptedZ
      · have zero : directSum (fun _ : Fin copies => data.profileTarget (K := K) q profileX profileY profileZ) = fun _ _ _ => 0 := by
          rw [data.profileTarget_invalid_zero q profileX profileY profileZ valid]
          funext x y z
          simp only [directSum, ite_self]
        change ContextReduction source (directSum (fun _ : Fin copies => data.profileTarget (K := K) q profileX profileY profileZ)) cost
        rw [zero]
        exact contextReduction_zero source cost)
  have cardinal : Fintype.card (data.ChildProfileTuple × data.ChildProfileTuple × data.ChildProfileTuple) =
      (Fintype.card data.ChildProfileTuple)^3 := by
    simp only [Fintype.card_prod]
    ring
  simp only [← Nat.card_eq_fintype_card] at cardinal budget ⊢
  rw [cardinal] at budget
  exact budget

end
end MatrixBounds.Tensor.CW.RootRestrictionData
