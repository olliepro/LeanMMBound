module

public import WindowedInterface
public import CoordinateRestriction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact empirical types inside an available window are actual coordinate
restrictions, uniformly for empty and nonempty position pools. -/
namespace MatrixBounds.Interface

open Tensor Empirical
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K P X Y Z BX BY BZ : Type*} [CommSemiring K] [Fintype P]

/-- A prescribed exact profile passes a window whenever its normalized entries lie in that window. -/
theorem activeWithin_of_profile {B : Type*} (profile : B → ℕ) (law : B → ℝ) (tolerance : ℝ)
    (inside : ∀ symbol, |(profile symbol : ℝ)/Fintype.card P-law symbol| ≤ tolerance)
    (word : TypedWord (P := P) profile) : activeWithin law tolerance word.val := by
  right
  intro symbol
  rw [word.property symbol]
  exact inside symbol

/-- The coordinate inclusions of exact profiles in three available windows preserve every coefficient. -/
def windowExactRestriction (tensor : Coeff K X Y Z)
    (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (profileX : BX → ℕ) (profileY : BY → ℕ) (profileZ : BZ → ℕ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ)
    (insideX : ∀ symbol, |(profileX symbol : ℝ)/Fintype.card P-lawX symbol| ≤ tolerance)
    (insideY : ∀ symbol, |(profileY symbol : ℝ)/Fintype.card P-lawY symbol| ≤ tolerance)
    (insideZ : ∀ symbol, |(profileZ symbol : ℝ)/Fintype.card P-lawZ symbol| ≤ tolerance) :
    CoordinateRestriction (windowedPower (P := P) tensor partX partY partZ lawX lawY lawZ tolerance)
      (exact (P := P) tensor partX partY partZ profileX profileY profileZ) where
  left := Subtype.val
  middle := Subtype.val
  right := Subtype.val
  coefficient x y z := by
    apply if_pos
    exact ⟨activeWithin_of_profile profileX lawX tolerance insideX (partWord partX profileX x),
      activeWithin_of_profile profileY lawY tolerance insideY (partWord partY profileY y),
      activeWithin_of_profile profileZ lawZ tolerance insideZ (partWord partZ profileZ z)⟩

/-- Any nonnegative window around the exact empirical centers contains their exact tensor interface. -/
def centeredWindowExactRestriction (tensor : Coeff K X Y Z)
    (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (profileX : BX → ℕ) (profileY : BY → ℕ) (profileZ : BZ → ℕ)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (windowedPower (P := P) tensor partX partY partZ
      (fun symbol => (profileX symbol : ℝ)/Fintype.card P)
      (fun symbol => (profileY symbol : ℝ)/Fintype.card P)
      (fun symbol => (profileZ symbol : ℝ)/Fintype.card P) tolerance)
      (exact (P := P) tensor partX partY partZ profileX profileY profileZ) :=
  windowExactRestriction tensor partX partY partZ profileX profileY profileZ _ _ _ tolerance
    (fun _ => by simpa only [sub_self, abs_zero] using nonnegative)
    (fun _ => by simpa only [sub_self, abs_zero] using nonnegative)
    (fun _ => by simpa only [sub_self, abs_zero] using nonnegative)

end
end MatrixBounds.Interface
