module

public import WindowedInterface
public import CoordinateRestriction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Bijective position renaming preserves complete empirical windows and the
actual tensor coefficients, including neutral empty pools. -/
namespace MatrixBounds.Empirical

noncomputable section

/-- A position bijection preserves every exact symbol multiplicity. -/
theorem count_comp_equiv {P Q A : Type*} (positions : P ≃ Q) (word : Q → A) (symbol : A) :
    count (word ∘ positions) symbol = count word symbol :=
  Nat.card_congr (Equiv.subtypeEquiv positions (fun _ => Iff.rfl))

end
end MatrixBounds.Empirical

namespace MatrixBounds.Interface

open Empirical Tensor
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K P Q X Y Z BX BY BZ : Type*} [CommSemiring K] [Fintype P] [Fintype Q]

/-- Complete empirical acceptance is unchanged under a bijection of physical positions. -/
theorem activeWithin_comp_equiv {A : Type*} (positions : P ≃ Q) (law : A → ℝ)
    (tolerance : ℝ) (word : Q → A) :
    activeWithin law tolerance (word ∘ positions) ↔ activeWithin law tolerance word := by
  simp only [activeWithin, Within, count_comp_equiv, Fintype.card_congr positions]

/-- Rename the actual factor positions of a complete windowed tensor power by explicit axis maps. -/
def windowPositionRestriction (positions : P ≃ Q) (tensor : Coeff K X Y Z)
    (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) :
    CoordinateRestriction (windowedPower (P := P) tensor partX partY partZ lawX lawY lawZ tolerance)
      (windowedPower (P := Q) tensor partX partY partZ lawX lawY lawZ tolerance) where
  left entries := entries ∘ positions
  middle entries := entries ∘ positions
  right entries := entries ∘ positions
  coefficient x y z := by
    have acceptX := activeWithin_comp_equiv positions lawX tolerance (partX ∘ x)
    have acceptY := activeWithin_comp_equiv positions lawY tolerance (partY ∘ y)
    have acceptZ := activeWithin_comp_equiv positions lawZ tolerance (partZ ∘ z)
    simp only [windowedPower, acceptedTensor, Function.comp_def] at acceptX acceptY acceptZ ⊢
    rw [acceptX, acceptY, acceptZ]
    congr 1
    exact Equiv.prod_comp positions (fun position => tensor (x position) (y position) (z position))

end
end MatrixBounds.Interface
