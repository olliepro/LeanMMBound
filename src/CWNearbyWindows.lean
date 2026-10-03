module

public import CWLawStability
public import CWMixedPrepared

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact child profiles near nominal child laws use an actual restriction of
the available parent interface, with the original degeneration budget. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- The extraction window around a nearby exact profile fits inside the available nominal parent window. -/
theorem nearby_profile_window (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (representative : data.TargetParts profile)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
    {delta narrow wide : ℝ} (nonnegative : 0 ≤ delta) (margin : narrow+2*delta ≤ wide)
    (close : ∀ child symbol, |data.childLaw profile child symbol-law child symbol| ≤ delta)
    (word : P → Fin (length+length) → Fin 3)
    (inside : Within (data.parentCenter (P := P) profile) narrow word) :
    Within (data.parentLaw (P := P) law) wide word := by
  rw [data.parentCenter_childLaw] at inside
  apply within_mono _ word margin
  exact within_shift _ _ word
    (data.parentLaw_close reference (data.childLaw profile) law (data.child_profile_range profile representative)
      range nonnegative close) inside

end
end MatrixBounds.Tensor.CW.SplitRestrictionData

namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- Parent windows centered at arbitrary nominal child laws, with each type's own positive width. -/
def nominalWindows (data : ∀ type, SplitRestrictionData (length type))
    (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :=
  fun type => Within (P := Positions type) ((data type).parentLaw (P := Positions type) (law type)) (tolerance type)

/-- Narrowing all factor windows is a genuine independent-axis restriction with no budget increase. -/
def narrowerParentCertificate (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (wideX narrowX wideY narrowY wideZ narrowZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (includesX : ∀ type fine, narrowX type fine → wideX type fine)
    (includesY : ∀ type fine, narrowY type fine → wideY type fine)
    (includesZ : ∀ type fine, narrowZ type fine → wideZ type fine) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q wideX wideY wideZ) rank degree) :
    Degeneration.Certificate (parentInterface (K := K) data q narrowX narrowY narrowZ) rank degree := by
  rw [parentInterface_eq] at certificate ⊢
  exact narrowerAcceptedCertificate _ id id id _ _ _ _ _ _
    (fun entries inside type => includesX type (parentFine (entries type)) (inside type))
    (fun entries inside type => includesY type (parentFine (entries type)) (inside type))
    (fun entries inside type => includesZ type (parentFine (entries type)) (inside type)) certificate

end
end MatrixBounds.Tensor.CW.Mixed
