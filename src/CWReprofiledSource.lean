module

public import CWMixedNearbySource
public import CWMixedNominalRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The source certificate is fixed while all accepted valid exact output
profiles vary. Empty-pool laws are normalized to zero only where their weights
vanish, so this does not narrow the available nominal parent interface. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {Positions : T → Type u}
variable [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Every accepted valid tuple receives an extraction-source certificate from the same available nominal interface. -/
def reprofileSourceCertificate (data : ∀ type, SplitRestrictionData (length type))
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
    (acceptedZ : profilesAccepted data lawZ (fun type => (parameters type).delta) profileZ)
    {rank degree : ℕ} (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX wide) (nominalWindows (Positions := Positions) data lawY wide)
      (nominalWindows (Positions := Positions) data lawZ wide)) rank degree) :
    Degeneration.Certificate (parentInterface (K := K) (reprofile data profileX profileY profileZ valid) q
      (parentWindows (Positions := Positions) data (profileCounts data profileX) (fun type => (parameters type).control.tolerance))
      (parentWindows (Positions := Positions) data (profileCounts data profileY) (fun type => (parameters type).control.tolerance))
      (parentWindows (Positions := Positions) data (profileCounts data profileZ) (fun type => (parameters type).control.tolerance))) rank degree := by
  have windows (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) :
      nominalWindows (Positions := Positions) data (fun type => (data type).activeLaw (law type)) wide =
        nominalWindows (Positions := Positions) data law wide := by
    funext type
    unfold nominalWindows
    rw [(data type).parentLaw_active (symmetric type) (law type)]
  apply nearbySourceCertificate (reprofile data profileX profileY profileZ valid) q (reprofileReference data profileX profileY profileZ valid reference)
    representativeX representativeY representativeZ
    (fun type => (data type).activeLaw (lawX type)) (fun type => (data type).activeLaw (lawY type)) (fun type => (data type).activeLaw (lawZ type))
    (fun type => (data type).activeLaw_range (lawX type) (rangeX type))
    (fun type => (data type).activeLaw_range (lawY type) (rangeY type))
    (fun type => (data type).activeLaw_range (lawZ type) (rangeZ type))
    (fun type => (parameters type).delta) (fun type => (parameters type).control.tolerance) wide
    (fun type => (parameters type).positiveDelta.le) (fun type => (parameters type).margin)
    (accepted_childLaw_close data profileX representativeX lawX _ (fun type => (parameters type).positiveDelta.le) acceptedX)
    (accepted_childLaw_close data profileY representativeY lawY _ (fun type => (parameters type).positiveDelta.le) acceptedY)
    (accepted_childLaw_close data profileZ representativeZ lawZ _ (fun type => (parameters type).positiveDelta.le) acceptedZ)
  change Degeneration.Certificate (parentInterface (K := K) data q
    (nominalWindows (Positions := Positions) data (fun type => (data type).activeLaw (lawX type)) wide)
    (nominalWindows (Positions := Positions) data (fun type => (data type).activeLaw (lawY type)) wide)
    (nominalWindows (Positions := Positions) data (fun type => (data type).activeLaw (lawZ type)) wide)) rank degree
  rw [windows lawX, windows lawY, windows lawZ]
  exact certificate

end
end MatrixBounds.Tensor.CW.Mixed
