module

public import ContextExtraction
public import CWReprofiledSource

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every nearby exact tuple uses a contextual restriction of the same nominal
parent tensor. Empty child pools are included through their canonical laws. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {Positions : T → Type u}
variable [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- Narrowing each factor window preserves arbitrary companion tensors and previous batches. -/
theorem contextReduction_narrowerParent (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (wideX narrowX wideY narrowY wideZ narrowZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (includesX : ∀ type fine, narrowX type fine → wideX type fine)
    (includesY : ∀ type fine, narrowY type fine → wideY type fine)
    (includesZ : ∀ type fine, narrowZ type fine → wideZ type fine) :
    ContextReduction.{v} (parentInterface (K := K) data q wideX wideY wideZ)
      (parentInterface (K := K) data q narrowX narrowY narrowZ) 1 := by
  rw [parentInterface_eq, parentInterface_eq]
  have identity := restrict_narrower_accepted (parentSource (K := K) data q) id id id
    (windowTest data wideX) (windowTest data narrowX)
    (windowTest data wideY) (windowTest data narrowY)
    (windowTest data wideZ) (windowTest data narrowZ)
    (fun entries inside type => includesX type (parentFine (entries type)) (inside type))
    (fun entries inside type => includesY type (parentFine (entries type)) (inside type))
    (fun entries inside type => includesZ type (parentFine (entries type)) (inside type))
  rw [← identity]
  exact contextReduction_restrict _ _ _ _

variable [∀ type, Nonempty (Positions type)]

/-- A valid nearby tuple inherits its exact extraction windows from the fixed nominal parent tensor in every context. -/
theorem contextReduction_reprofileSource (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (q : ℕ) (reference : PrescribedEdges Positions data)
    {error : ℝ} (positive : 0 < error) (wide : T → ℝ)
    (parameters : ∀ type, SplitRestrictionData.NearbyParameters.{u} (length type) positive (wide type))
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (rangeX : ∀ type child symbol, 0 ≤ lawX type child symbol ∧ lawX type child symbol ≤ 1)
    (rangeY : ∀ type child symbol, 0 ≤ lawY type child symbol ∧ lawY type child symbol ≤ 1)
    (rangeZ : ∀ type child symbol, 0 ≤ lawZ type child symbol ∧ lawZ type child symbol ≤ 1)
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ)
    (representativeX : TargetParts data (profileCounts data profileX))
    (representativeY : TargetParts data (profileCounts data profileY))
    (representativeZ : TargetParts data (profileCounts data profileZ))
    (acceptedX : profilesAccepted data lawX (fun type => (parameters type).delta) profileX)
    (acceptedY : profilesAccepted data lawY (fun type => (parameters type).delta) profileY)
    (acceptedZ : profilesAccepted data lawZ (fun type => (parameters type).delta) profileZ) :
    ContextReduction.{v} (parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX wide) (nominalWindows (Positions := Positions) data lawY wide)
      (nominalWindows (Positions := Positions) data lawZ wide))
      (parentInterface (K := K) (reprofile data profileX profileY profileZ valid) q
        (parentWindows (Positions := Positions) data (profileCounts data profileX) (fun type => (parameters type).control.tolerance))
        (parentWindows (Positions := Positions) data (profileCounts data profileY) (fun type => (parameters type).control.tolerance))
        (parentWindows (Positions := Positions) data (profileCounts data profileZ) (fun type => (parameters type).control.tolerance))) 1 := by
  have inclusion (profiles : ChildProfileTuple data) (representative : TargetParts data (profileCounts data profiles))
      (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
      (range : ∀ type child symbol, 0 ≤ law type child symbol ∧ law type child symbol ≤ 1)
      (accepted : profilesAccepted data law (fun type => (parameters type).delta) profiles)
      (type : T) (fine : Positions type → Fin (length type+length type) → Fin 3)
      (inside : parentWindows (Positions := Positions) data (profileCounts data profiles)
        (fun type => (parameters type).control.tolerance) type fine) :
      nominalWindows (Positions := Positions) data law wide type fine := by
    have bound := (data type).nearby_profile_window (reference type) (profileCounts data profiles type) (representative type)
      ((data type).activeLaw (law type)) ((data type).activeLaw_range (law type) (range type))
      (parameters type).positiveDelta.le (parameters type).margin
      (accepted_childLaw_close data profiles representative law _ (fun type => (parameters type).positiveDelta.le) accepted type) fine inside
    rw [(data type).parentLaw_active (symmetric type) (law type)] at bound
    exact bound
  exact contextReduction_narrowerParent data q _ _ _ _ _ _
    (inclusion profileX representativeX lawX rangeX acceptedX)
    (inclusion profileY representativeY lawY rangeY acceptedY)
    (inclusion profileZ representativeZ lawZ rangeZ acceptedZ)

end
end MatrixBounds.Tensor.CW.Mixed
