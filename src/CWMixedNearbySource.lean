import CWNearbyWindows
import CWMixedConcentration

/-! All nearby exact child-type tuples start from the same available nominal
parent interface. The three derived window inclusions give actual independent
axis restrictions, preserving its original polynomial certificate. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Transport the fixed nominal parent certificate to the actual extraction windows of any nearby feasible child profiles. -/
def nearbySourceCertificate (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (reference : PrescribedEdges Positions data)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (rangeX : ∀ type child symbol, 0 ≤ lawX type child symbol ∧ lawX type child symbol ≤ 1)
    (rangeY : ∀ type child symbol, 0 ≤ lawY type child symbol ∧ lawY type child symbol ≤ 1)
    (rangeZ : ∀ type child symbol, 0 ≤ lawZ type child symbol ∧ lawZ type child symbol ≤ 1)
    (delta narrow wide : T → ℝ) (nonnegative : ∀ type, 0 ≤ delta type)
    (margin : ∀ type, narrow type+2*delta type ≤ wide type)
    (closeX : ∀ type child symbol, |(data type).childLaw (data type).fineX child symbol-lawX type child symbol| ≤ delta type)
    (closeY : ∀ type child symbol, |(data type).childLaw (data type).fineY child symbol-lawY type child symbol| ≤ delta type)
    (closeZ : ∀ type child symbol, |(data type).childLaw (data type).fineZ child symbol-lawZ type child symbol| ≤ delta type)
    {rank degree : ℕ}
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX wide)
      (nominalWindows (Positions := Positions) data lawY wide)
      (nominalWindows (Positions := Positions) data lawZ wide)) rank degree) :
    Degeneration.Certificate (parentInterface (K := K) data q
      (parentWindows (Positions := Positions) data (fun type => (data type).fineX) narrow)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineY) narrow)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) narrow)) rank degree := by
  apply narrowerParentCertificate data q _ _ _ _ _ _ _ _ _ certificate
  · intro type fine inside
    exact (data type).nearby_profile_window (reference type) (data type).fineX (representativeX type)
      (lawX type) (rangeX type) (nonnegative type) (margin type) (closeX type) fine inside
  · intro type fine inside
    exact (data type).nearby_profile_window (reference type) (data type).fineY (representativeY type)
      (lawY type) (rangeY type) (nonnegative type) (margin type) (closeY type) fine inside
  · intro type fine inside
    exact (data type).nearby_profile_window (reference type) (data type).fineZ (representativeZ type)
      (lawZ type) (rangeZ type) (nonnegative type) (margin type) (closeZ type) fine inside

end
end MatrixBounds.Tensor.CW.Mixed
