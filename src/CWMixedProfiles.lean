module

public import CWReprofile
public import CWMixedTargets
public import ApproximateProfiles

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite exact-profile tuples for the actual mixed child target. Valid tuples
produce split data with the same coarse graph; invalid tuples are proved zero. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K] {length : T → ℕ}

/-- One bounded fine profile in every separately labelled child pool of every parent type. -/
abbrev ChildProfileTuple (data : ∀ type, SplitRestrictionData (length type)) :=
  ∀ type, ∀ child : ShapeAlphabet (2*length type), Profiles ((data type).ChildPositions child) (Fin (length type) → Fin 3)

/-- Read integer counts from a bounded child-profile tuple. -/
def profileCounts (data : ∀ type, SplitRestrictionData (length type)) (profiles : ChildProfileTuple data) :=
  fun type child symbol => (profiles type child symbol).val

/-- Feasibility, support, and zero-sector compatibility for every pool of a mixed profile tuple. -/
def ValidProfiles (data : ∀ type, SplitRestrictionData (length type)) (profileX profileY profileZ : ChildProfileTuple data) : Prop :=
  ∀ type child, ExactProfilesValid ((data type).ChildPositions child) (length type) child.val
    (profileCounts data profileX type child) (profileCounts data profileY type child) (profileCounts data profileZ type child)

/-- Replace all valid child-profile tuples while preserving each parent's coarse graph and split counts. -/
def reprofile (data : ∀ type, SplitRestrictionData (length type)) (profileX profileY profileZ : ChildProfileTuple data)
    (valid : ValidProfiles data profileX profileY profileZ) : ∀ type, SplitRestrictionData (length type) :=
  fun type => (data type).withProfiles (profileCounts data profileX type) (profileCounts data profileY type)
    (profileCounts data profileZ type) (valid type)

/-- The actual exact child tensor for a bounded profile tuple, defined even when its profiles are invalid. -/
def profileTarget (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (profileX profileY profileZ : ChildProfileTuple data) :=
  Interface.heterogeneous (fun type => exactChildren (K := K) (Positions := (data type).ChildPositions)
    q (fun _ => length type) Subtype.val (profileCounts data profileX type)
    (profileCounts data profileY type) (profileCounts data profileZ type))

/-- Reprofiled split data has precisely the exact target named by the bounded profile tuple. -/
theorem target_reprofile (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ) :
    target (K := K) (reprofile data profileX profileY profileZ valid) q = profileTarget (K := K) data q profileX profileY profileZ := rfl

/-- A nonzero coefficient of the actual mixed target certifies all of its child-profile conditions. -/
theorem profileTarget_valid (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (profileX profileY profileZ : ChildProfileTuple data) (x y z)
    (nonzero : profileTarget (K := K) data q profileX profileY profileZ x y z ≠ 0) :
    ValidProfiles data profileX profileY profileZ := by
  intro type
  apply exactChildren_profiles_valid (K := K) q (fun _ => length type) Subtype.val
    (profileCounts data profileX type) (profileCounts data profileY type) (profileCounts data profileZ type)
    (x type) (y type) (z type)
  intro vanished
  exact nonzero (Finset.prod_eq_zero (Finset.mem_univ type) vanished)

/-- Invalid mixed profile tuples have no nonzero coefficients. -/
theorem profileTarget_invalid_zero (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (profileX profileY profileZ : ChildProfileTuple data) (invalid : ¬ValidProfiles data profileX profileY profileZ) :
    profileTarget (K := K) data q profileX profileY profileZ = fun _ _ _ => 0 := by
  funext x y z
  by_contra nonzero
  exact invalid (profileTarget_valid data q profileX profileY profileZ x y z nonzero)

/-- Any number of copies of an invalid profile tuple fit into any supplied rank budget. -/
theorem invalid_profile_batch (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (profileX profileY profileZ : ChildProfileTuple data) (invalid : ¬ValidProfiles data profileX profileY profileZ)
    (copies rank : ℕ) :
    RankLE (directSum (fun _ : Fin copies => profileTarget (K := K) data q profileX profileY profileZ)) rank := by
  rw [profileTarget_invalid_zero data q profileX profileY profileZ invalid]
  exact ⟨{
    left := fun _ _ => 0
    middle := fun _ _ => 0
    right := fun _ _ => 0
    reconstruct := fun _ _ _ => by simp only [directSum, ite_self, zero_mul, Finset.sum_const_zero] }⟩

/-- All three axes accept complete empirical profiles in nonempty child pools; empty pools impose no constraint. -/
def profilesAccepted (data : ∀ type, SplitRestrictionData (length type))
    (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (profile : ChildProfileTuple data) : Prop :=
  ∀ type child, ActiveProfileWithin (law type child) (tolerance type) (profile type child)

end
end MatrixBounds.Tensor.CW.Mixed
