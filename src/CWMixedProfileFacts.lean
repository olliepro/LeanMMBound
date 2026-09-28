import CWMixedProfiles
import CWActiveLaws

/-! Valid accepted profile tuples supply the exact representatives and uniform
law-closeness premises consumed by finite mixed extraction. Reprofiling changes
neither the graph nor any nominal entropy quantity. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} {length : T → ℕ}
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)]

/-- A reference in the original coarse graph is also a reference after replacing valid child profiles. -/
def reprofileReference (data : ∀ type, SplitRestrictionData (length type))
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ)
    (reference : PrescribedEdges Positions data) :
    PrescribedEdges Positions (reprofile data profileX profileY profileZ valid) := reference

/-- Reprofiling keeps the exact complementary split symmetry at every parent type. -/
theorem reprofile_symmetric (data : ∀ type, SplitRestrictionData (length type))
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ)
    (symmetric : ∀ type, (data type).Symmetric) :
    ∀ type, (reprofile data profileX profileY profileZ valid type).Symmetric := symmetric

/-- Valid tuples provide complete target part representatives on all three axes. -/
theorem valid_profiles_representatives (data : ∀ type, SplitRestrictionData (length type))
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ) :
    Nonempty (TargetParts data (profileCounts data profileX)) ∧ Nonempty (TargetParts data (profileCounts data profileY)) ∧
      Nonempty (TargetParts data (profileCounts data profileZ)) :=
  ⟨⟨fun type child => Classical.choice (valid type child).feasibleX⟩,
    ⟨fun type child => Classical.choice (valid type child).feasibleY⟩,
    ⟨fun type child => Classical.choice (valid type child).feasibleZ⟩⟩

/-- Accepted empirical profiles are uniformly close to the canonical nominal laws, even on empty child pools. -/
theorem accepted_childLaw_close (data : ∀ type, SplitRestrictionData (length type)) (profiles : ChildProfileTuple data)
    (representative : TargetParts data (profileCounts data profiles))
    (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (nonnegative : ∀ type, 0 ≤ tolerance type)
    (accepted : profilesAccepted data law tolerance profiles) (type : T)
    (child : ShapeAlphabet (2*length type)) (symbol : Fin (length type) → Fin 3) :
    |(data type).childLaw (profileCounts data profiles type) child symbol-(data type).activeLaw (law type) child symbol| ≤ tolerance type := by
  apply (data type).childLaw_close_active (profileCounts data profiles type) (representative type) (law type) (nonnegative type)
  intro child nonempty symbol
  exact split_profile_close (profiles type child) (law type child) (tolerance type) nonempty (accepted type child) symbol

end
end MatrixBounds.Tensor.CW.Mixed
