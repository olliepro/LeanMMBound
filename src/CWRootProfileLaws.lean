import CWRootFineRates
import MassEntropyContinuity

/-! Root fine laws are single weighted mixtures, not paired concatenations.
Zero-weight pools contribute nothing to their global or compatibility masses. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- The empirical probability law in a root child pool, with zero coordinates for empty pools. -/
def childLaw (data : RootRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) : ℝ :=
  (profile child symbol : ℝ)/data.split child

/-- Root-normalized fine mass over any specified collection of separately labelled child pools. -/
def lawMass (data : RootRestrictionData length) (selected : ShapeAlphabet (2*length) → Prop)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (symbol : Fin length → Fin 3) : ℝ :=
  ∑ child, if selected child then ((data.split child : ℝ)/Fintype.card P)*law child symbol else 0

/-- Root fine retention is global fine entropy minus the sum of compatibility-sector mass entropies. -/
def lawRetention (data : RootRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  Entropy.entropy (data.lawMass (P := P) (fun _ => True) law) -
    ∑ sector, Entropy.massEntropy (data.lawMass (P := P) (fun child => axisClass child = sector) law)

/-- Feasible fine counts cannot exceed the root child pool size. -/
theorem child_count_le (data : RootRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    profile child symbol ≤ data.split child := by
  rw [← (representative child).property symbol]
  simpa only [ChildPositions, Fintype.card_fin] using count_le_positions (representative child).val symbol

/-- Every feasible empirical child law lies in the unit cube, including empty pools. -/
theorem childLaw_range (data : RootRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    0 ≤ data.childLaw profile child symbol ∧ data.childLaw profile child symbol ≤ 1 := by
  refine ⟨by unfold childLaw; positivity, ?_⟩
  exact div_le_one_of_le₀ (by exact_mod_cast data.child_count_le profile representative child symbol) (Nat.cast_nonneg _)

/-- Multiplying a child law by its pool weight recovers the exact root-normalized count. -/
theorem childLaw_weighted (data : RootRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    ((data.split child : ℝ)/Fintype.card P)*data.childLaw profile child symbol =
      (profile child symbol : ℝ)/Fintype.card P := by
  by_cases empty : data.split child = 0
  · have zero : profile child symbol = 0 := by have := data.child_count_le profile representative child symbol; omega
    simp only [childLaw, empty, zero, Nat.cast_zero, zero_div, zero_mul]
  · have nonzero : (data.split child : ℝ) ≠ 0 := by exact_mod_cast empty
    unfold childLaw
    field_simp

/-- Integer-profile root retention is exactly the weighted-law formula on its empirical child laws. -/
theorem fineRetention_childLaw (data : RootRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) :
    fineRetention (P := P) axisClass profile = data.lawRetention (P := P) axisClass (data.childLaw profile) := by
  have global : data.lawMass (P := P) (fun _ => True) (data.childLaw profile) =
      fun symbol => (globalProfile profile symbol : ℝ)/Fintype.card P := by
    funext symbol
    simp only [lawMass, if_true, globalProfile, Nat.cast_sum, Finset.sum_div,
      data.childLaw_weighted profile representative]
  have pools (sector : CompatibilityClass (2*length)) :
      data.lawMass (P := P) (fun child => axisClass child = sector) (data.childLaw profile) =
        fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P := by
    funext symbol
    unfold lawMass pooledProfile
    rw [Nat.cast_sum, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro child _
    split_ifs
    · exact data.childLaw_weighted profile representative child symbol
    · simp only [Nat.cast_zero, zero_div]
  unfold fineRetention lawRetention
  rw [global]
  simp_rw [pools]

variable [Nonempty P]

/-- The root split weights sum to one for any actual prescribed word. -/
theorem weights_sum (data : RootRestrictionData length) (reference : TypedWord (P := P) data.split) :
    ∑ child, (data.split child : ℝ)/Fintype.card P = 1 := by
  rw [← Finset.sum_div, ← Nat.cast_sum, profile_total data.split reference]
  exact div_self (by exact_mod_cast (Fintype.card_pos (α := P)).ne')

/-- Every selected collection of child pools has coordinate masses in the unit cube. -/
theorem lawMass_range (data : RootRestrictionData length) (reference : TypedWord (P := P) data.split)
    (selected : ShapeAlphabet (2*length) → Prop)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1) (symbol : Fin length → Fin 3) :
    0 ≤ data.lawMass (P := P) selected law symbol ∧ data.lawMass (P := P) selected law symbol ≤ 1 := by
  have weight (child : ShapeAlphabet (2*length)) : 0 ≤ (data.split child : ℝ)/Fintype.card P := by positivity
  constructor
  · apply Finset.sum_nonneg
    intro child _
    split_ifs
    · exact mul_nonneg (weight child) (range _ _).1
    · exact le_rfl
  · calc
      _ ≤ ∑ child, (data.split child : ℝ)/Fintype.card P := by
        apply Finset.sum_le_sum
        intro child _
        split_ifs
        · exact mul_le_of_le_one_right (weight child) (range _ _).2
        · exact weight child
      _ = 1 := data.weights_sum reference

/-- Coordinate closeness in nonempty pools controls every global or pooled root mass with no amplification. -/
theorem lawMass_close (data : RootRestrictionData length) (reference : TypedWord (P := P) data.split)
    (selected : ShapeAlphabet (2*length) → Prop)
    (law law' : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    {delta : ℝ} (nonnegative : 0 ≤ delta)
    (close : ∀ child, data.split child ≠ 0 → ∀ symbol, |law child symbol-law' child symbol| ≤ delta)
    (symbol : Fin length → Fin 3) :
    |data.lawMass (P := P) selected law symbol-data.lawMass (P := P) selected law' symbol| ≤ delta := by
  have weight (child : ShapeAlphabet (2*length)) : 0 ≤ (data.split child : ℝ)/Fintype.card P := by positivity
  unfold lawMass
  rw [← Finset.sum_sub_distrib]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    _ ≤ ∑ child, ((data.split child : ℝ)/Fintype.card P)*delta := by
      apply Finset.sum_le_sum
      intro child _
      by_cases empty : data.split child = 0
      · simp only [empty, Nat.cast_zero, zero_div, zero_mul, ite_self, sub_self, abs_zero, le_refl]
      · split_ifs
        · rw [← mul_sub, abs_mul, abs_of_nonneg (weight child)]
          exact mul_le_mul_of_nonneg_left (close child empty symbol) (weight child)
        · simpa only [sub_self, abs_zero] using mul_nonneg (weight child) nonnegative
    _ = delta := by rw [← Finset.sum_mul, data.weights_sum reference, one_mul]

end
end MatrixBounds.Tensor.CW.RootRestrictionData
