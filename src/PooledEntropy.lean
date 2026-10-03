module

public import PooledCompatibility

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Entropy bounds for compatibility sectors, including empty sectors. Zero
allocations in the supplied parameters need no artificial positivity assumption. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P B : Type*} [Fintype P] [Fintype B]

/-- The exact type-count bounds remain valid when the position set is empty. -/
theorem log_type_count_bounds_any (profile : B → ℕ) (representative : TypedWord (P := P) profile) :
    (Fintype.card P : ℝ)*Entropy.entropy (fun b => (profile b : ℝ)/Fintype.card P) -
      Fintype.card B*(Real.log ((Fintype.card P : ℝ)+1)+1) ≤
      Real.log (Fintype.card (TypedWord (P := P) profile) : ℝ) ∧
    Real.log (Fintype.card (TypedWord (P := P) profile) : ℝ) ≤
      (Fintype.card P : ℝ)*Entropy.entropy (fun b => (profile b : ℝ)/Fintype.card P) +
        Real.log ((Fintype.card P : ℝ)+1)+1 := by
  by_cases positive : 0 < Fintype.card P
  · exact log_type_count_bounds profile representative positive
  · have empty : Fintype.card P = 0 := by omega
    letI : IsEmpty P := Fintype.card_eq_zero_iff.mp empty
    have unique : Fintype.card (TypedWord (P := P) profile) = 1 := by
      apply Fintype.card_eq_one_iff.mpr
      refine ⟨representative, fun word => ?_⟩
      apply Subtype.ext
      funext p
      exact isEmptyElim p
    simp [unique]

/-- Logarithmic compatibility counts equal summed sector entropies up to explicit finite errors.
Empty sectors are permitted and contribute zero to the main entropy term. -/
theorem pooled_entropy_bounds {Slot Sector : Type*} [Fintype Slot] [Fintype Sector]
    (label : Slot → Sector) (profile : Sector → B → ℕ)
    (representative : ∀ sector, TypedWord (P := {slot // label slot = sector}) (profile sector)) :
    (∑ sector, (Fintype.card {slot // label slot = sector} : ℝ)*
      Entropy.entropy (fun b => (profile sector b : ℝ)/Fintype.card {slot // label slot = sector})) -
      ∑ sector, (Fintype.card B : ℝ)*(Real.log ((Fintype.card {slot // label slot = sector} : ℝ)+1)+1) ≤
        Real.log (Nat.card {word : Slot → B // SectorCompatible label profile word} : ℝ) ∧
    Real.log (Nat.card {word : Slot → B // SectorCompatible label profile word} : ℝ) ≤
      (∑ sector, (Fintype.card {slot // label slot = sector} : ℝ)*
        Entropy.entropy (fun b => (profile sector b : ℝ)/Fintype.card {slot // label slot = sector})) +
        ∑ sector, (Real.log ((Fintype.card {slot // label slot = sector} : ℝ)+1)+1) := by
  have logarithm : Real.log (Nat.card {word : Slot → B // SectorCompatible label profile word} : ℝ) =
      ∑ sector, Real.log (Fintype.card (TypedWord (P := {slot // label slot = sector}) (profile sector)) : ℝ) := by
    rw [Nat.card_congr (sectorCompatibleEquiv label profile)]
    simpa only [← Nat.card_eq_fintype_card] using log_heterogeneous_count profile representative
  rw [logarithm]
  constructor
  · have lower := Finset.sum_le_sum (s := Finset.univ)
      (fun sector _ => (log_type_count_bounds_any (profile sector) (representative sector)).1)
    simpa only [Finset.sum_sub_distrib, ← Nat.card_eq_fintype_card] using lower
  · have upper := Finset.sum_le_sum (s := Finset.univ)
      (fun sector _ => (log_type_count_bounds_any (profile sector) (representative sector)).2)
    simpa only [Finset.sum_add_distrib, ← Nat.card_eq_fintype_card, add_assoc] using upper

end
end MatrixBounds.Empirical
