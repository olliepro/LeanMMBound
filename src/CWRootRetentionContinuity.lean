module

public import CWRootProfileLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One positive child-window tolerance controls root retention for every
population, split profile, and compatibility grouping, including empty pools. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Root fine retention is uniformly continuous in nonempty child-pool laws with a population-independent tolerance. -/
theorem exists_uniform_retention_tolerance (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ delta > 0, ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : RootRestrictionData length) (_reference : TypedWord (P := P) data.split)
      (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (law law' : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1) →
      (∀ child symbol, 0 ≤ law' child symbol ∧ law' child symbol ≤ 1) →
      (∀ child, data.split child ≠ 0 → ∀ symbol, |law child symbol-law' child symbol| ≤ delta) →
      |data.lawRetention (P := P) axisClass law-data.lawRetention (P := P) axisClass law'| < error := by
  let sectors : ℝ := Fintype.card (CompatibilityClass (2*length))
  have sectorsNonnegative : 0 ≤ sectors := Nat.cast_nonneg _
  let sectorError := error/(2*(sectors+1))
  have sectorErrorPositive : 0 < sectorError := by dsimp [sectorError]; positivity
  obtain ⟨globalDelta, globalPositive, globalControl⟩ := Entropy.entropy_uniform_tolerance
    (A := Fin length → Fin 3) (half_pos positive)
  obtain ⟨poolDelta, poolPositive, poolControl⟩ := Entropy.massEntropy_uniform_tolerance
    (A := Fin length → Fin 3) 1 sectorErrorPositive
  refine ⟨min globalDelta poolDelta/2, by positivity, ?_⟩
  intro P finite nonempty data reference axisClass law law' range range' close
  have deltaNonnegative : 0 ≤ min globalDelta poolDelta/2 := by positivity
  have globalSmall : min globalDelta poolDelta/2 < globalDelta := by
    have := min_le_left globalDelta poolDelta
    linarith
  have poolSmall : min globalDelta poolDelta/2 < poolDelta := by
    have := min_le_right globalDelta poolDelta
    linarith
  have global := globalControl (data.lawMass (P := P) (fun _ => True) law) (data.lawMass (P := P) (fun _ => True) law')
    (data.lawMass_range reference _ law range) (data.lawMass_range reference _ law' range')
    (fun symbol => (data.lawMass_close reference _ law law' deltaNonnegative close symbol).trans_lt globalSmall)
  have pool (sector : CompatibilityClass (2*length)) := poolControl
    (data.lawMass (P := P) (fun child => axisClass child = sector) law)
    (data.lawMass (P := P) (fun child => axisClass child = sector) law')
    (data.lawMass_range reference _ law range) (data.lawMass_range reference _ law' range')
    (fun symbol => (data.lawMass_close reference _ law law' deltaNonnegative close symbol).trans_lt poolSmall)
  have sumBound : |(∑ sector, Entropy.massEntropy (data.lawMass (P := P) (fun child => axisClass child = sector) law)) -
      ∑ sector, Entropy.massEntropy (data.lawMass (P := P) (fun child => axisClass child = sector) law')| ≤ sectors*sectorError := by
    rw [← Finset.sum_sub_distrib]
    apply (Finset.abs_sum_le_sum_abs _ _).trans
    calc
      _ ≤ ∑ _ : CompatibilityClass (2*length), sectorError := Finset.sum_le_sum (fun sector _ => (pool sector).le)
      _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]; rfl
  have sectorTotal : sectors*sectorError < error/2 := by
    have identity : sectorError*(2*(sectors+1)) = error := div_mul_cancel₀ _ (by positivity)
    nlinarith
  unfold lawRetention
  calc
    _ = |(Entropy.entropy (data.lawMass (P := P) (fun _ => True) law)-Entropy.entropy (data.lawMass (P := P) (fun _ => True) law')) -
      ((∑ sector, Entropy.massEntropy (data.lawMass (P := P) (fun child => axisClass child = sector) law)) -
        ∑ sector, Entropy.massEntropy (data.lawMass (P := P) (fun child => axisClass child = sector) law'))| := by congr 1; ring
    _ ≤ _ := abs_sub _ _
    _ < error := by linarith

end
end MatrixBounds.Tensor.CW.RootRestrictionData
