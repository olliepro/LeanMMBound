module

public import CWExactProfileValidity
public import CWTargetMaps

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every valid exact child-type tuple can replace the fine profiles of a split
instance while retaining its complete coarse graph and prescribed split count. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {length : ℕ}

/-- Replace the three child fine profiles using their proved zero-sector compatibility; parent and coarse profiles remain definitionally equal. -/
def withProfiles (data : SplitRestrictionData length)
    (profileX profileY profileZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (valid : ∀ child, ExactProfilesValid (data.ChildPositions child) length child.val
      (profileX child) (profileY child) (profileZ child)) : SplitRestrictionData length :=
  { data with
    fineX := profileX
    fineY := profileY
    fineZ := profileZ
    zeroZ := fun child => (valid child).zeroZ
    zeroX := fun child => (valid child).zeroX
    zeroY := fun child => (valid child).zeroY }

/-- Replacing valid child profiles preserves the split's complementary symmetry. -/
theorem withProfiles_symmetric (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (profileX profileY profileZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (valid : ∀ child, ExactProfilesValid (data.ChildPositions child) length child.val
      (profileX child) (profileY child) (profileZ child)) :
    (data.withProfiles profileX profileY profileZ valid).Symmetric := symmetric

/-- Each valid exact-profile tuple supplies feasible child parts on all three axes. -/
theorem withProfiles_feasible (data : SplitRestrictionData length)
    (profileX profileY profileZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (valid : ∀ child, ExactProfilesValid (data.ChildPositions child) length child.val
      (profileX child) (profileY child) (profileZ child)) :
    Nonempty (data.TargetParts profileX) ∧ Nonempty (data.TargetParts profileY) ∧ Nonempty (data.TargetParts profileZ) :=
  ⟨⟨fun child => Classical.choice (valid child).feasibleX⟩,
    ⟨fun child => Classical.choice (valid child).feasibleY⟩, ⟨fun child => Classical.choice (valid child).feasibleZ⟩⟩

end
end MatrixBounds.Tensor.CW.SplitRestrictionData

namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {Positions : T → Type*} [∀ type, Fintype (Positions type)]

/-- Any nonzero heterogeneous child coefficient certifies every pool's feasibility, support, and forced zero-sector complements. -/
theorem exactChildren_profiles_valid (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (profileX profileY profileZ : ∀ type, (Fin (length type) → Fin 3) → ℕ)
    (x y z) (nonzero : exactChildren (K := K) (Positions := Positions) q length shape profileX profileY profileZ x y z ≠ 0) :
    ∀ type, ExactProfilesValid (Positions type) (length type) (shape type) (profileX type) (profileY type) (profileZ type) := by
  intro type
  apply exact_profiles_valid (K := K) (shape type) (profileX type) (profileY type) (profileZ type) (x type) (y type) (z type)
  intro vanished
  exact nonzero (Finset.prod_eq_zero (Finset.mem_univ type) vanished)

/-- A heterogeneous exact type with any invalid child pool is the zero tensor and costs no scalar products. -/
theorem exactChildren_invalid_zero (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (profileX profileY profileZ : ∀ type, (Fin (length type) → Fin 3) → ℕ)
    (invalid : ¬∀ type, ExactProfilesValid (Positions type) (length type) (shape type)
      (profileX type) (profileY type) (profileZ type)) :
    exactChildren (K := K) (Positions := Positions) q length shape profileX profileY profileZ = fun _ _ _ => 0 := by
  funext x y z
  by_contra nonzero
  exact invalid (exactChildren_profiles_valid q length shape profileX profileY profileZ x y z nonzero)

end
end MatrixBounds.Tensor.CW
