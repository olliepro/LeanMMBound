module

public import CWRootCompatibility
public import CWTypedInterfaces

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The unrestricted root's explicit target maps preserve complete profiles,
all pooled tests, and the physical coarse coordinate word. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Project physical coordinates to the separately labelled exact fine parts of the root target. -/
def targetParts (data : RootRestrictionData length) (q : ℕ) (axis : Shape → ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) : data.TargetParts profile :=
  fun child => Interface.partWord _ (profile child) (entries child)

/-- A root edge places the fine parts on the same single position set as the physical coordinates. -/
def targetFine (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (parts : data.TargetParts profile) :
    P → Fin length → Fin 3 :=
  regroupParts (typePlacement data.split edge) (fun child => (parts child).val)

/-- The fine word of a mapped target axis is exactly its regrouped tuple of fine parts. -/
theorem targetAxis_fine (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) :
    fineWords (data.targetAxis edge q axis profile entries) =
      data.targetFine edge profile (data.targetParts q axis profile entries) := rfl

/-- The mapped root coordinates satisfy every full empirical child profile. -/
theorem targetAxis_full (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) :
    SectorCompatible edge.val profile (fineWords (data.targetAxis edge q axis profile entries)) :=
  typePlacement_compatible data.split edge profile (data.targetParts q axis profile entries)

/-- The root axis map realizes the bounded coarse indices used in the marginal filtering. -/
theorem targetAxis_index (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) (index : ShapeAlphabet (2*length) → Fin (2*length+1))
    (values : ∀ child, (index child).val = axis child.val) :
    (fun position => wordCoarseIndex (data.targetAxis edge q axis profile entries position)) =
      fun position => index (edge.val position) := by
  funext position
  apply Fin.ext
  exact (data.targetAxis_coarse edge q axis profile entries position).trans (values _).symm

/-- Every mapped root axis passes its variable-only pooled profile test. -/
theorem targetAxis_pooled (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) (index : ShapeAlphabet (2*length) → Fin (2*length+1))
    (values : ∀ child, (index child).val = axis child.val) :
    pooledAxis (pooledProfile profile index) (data.targetAxis edge q axis profile entries) := by
  unfold pooledAxis
  rw [data.targetAxis_index edge q axis profile entries index values]
  exact sectorCompatible_coarsen edge.val profile index _ (data.targetAxis_full edge q axis profile entries)

/-- Mapped root target coordinates satisfy every coarsening of their owner's complete profiles. -/
theorem targetAxis_compatible (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) :
    compatibleFine axis axisClass profile edge.val (fineWords (data.targetAxis edge q axis profile entries)) :=
  ⟨data.targetAxis_coarse edge q axis profile entries,
    sectorCompatible_coarsen edge.val profile axisClass _ (data.targetAxis_full edge q axis profile entries)⟩

/-- Every supported formal fine part is realized by actual CW coordinates when the middle alphabet is nonempty. -/
theorem targetParts_surjective (data : RootRestrictionData length) {q : ℕ} (positive : 0 < q)
    (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0) :
    Function.Surjective (data.targetParts q axis profile) := by
  intro parts
  choose entries same using fun child => exact_part_surjective positive (profile child) (support child) (parts child)
  exact ⟨entries, funext same⟩

/-- The actual root compatibility predicate holds on every supported exact target fine part. -/
theorem targetParts_compatible (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (parts : data.TargetParts profile) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) :
    compatibleFine axis axisClass profile edge.val (data.targetFine edge profile parts) := by
  obtain ⟨entries, rfl⟩ := data.targetParts_surjective (q := 1) (by omega) axis profile support parts
  rw [← data.targetAxis_fine edge 1 axis profile entries]
  exact data.targetAxis_compatible edge 1 axis profile entries axisClass

end
end MatrixBounds.Tensor.CW.RootRestrictionData
