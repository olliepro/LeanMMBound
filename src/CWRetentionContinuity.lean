module

public import CWLawStability
public import MassEntropyContinuity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Fine retention varies uniformly continuously with the complete child laws.
The tolerance is fixed before the population, split counts, and parent shape. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Fine-axis retention expressed on arbitrary child probability laws. -/
def lawRetention (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  Entropy.entropy (data.parentLaw (P := P) law) - ∑ sector, Entropy.massEntropy (data.pooledLaw (P := P) axisClass law sector)

/-- The law formula equals the retention rate derived from the actual integer profiles. -/
theorem fineRetention_childLaw (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) :
    data.fineRetention (P := P) axisClass profile = data.lawRetention (P := P) axisClass (data.childLaw profile) := by
  unfold fineRetention lawRetention
  have pools : data.pooledLaw (P := P) axisClass (data.childLaw profile) =
      fun sector symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P := by
    funext sector symbol
    exact data.pooledLaw_childLaw axisClass profile representative sector symbol
  rw [pools, data.parentCenter_childLaw]

/-- One child-law tolerance controls retention uniformly for every feasible parent population and every compatibility grouping. -/
theorem exists_uniform_retention_tolerance (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ delta > 0, ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : SplitRestrictionData length) (_reference : data.PrescribedEdges (P := P))
      (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (law law' : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1) →
      (∀ child symbol, 0 ≤ law' child symbol ∧ law' child symbol ≤ 1) →
      (∀ child symbol, |law child symbol-law' child symbol| ≤ delta) →
      |data.lawRetention (P := P) axisClass law-data.lawRetention (P := P) axisClass law'| < error := by
  let sectors : ℝ := Fintype.card (CompatibilityClass (2*length))
  have sectorsNonnegative : 0 ≤ sectors := Nat.cast_nonneg _
  let sectorError := error/(2*(sectors+1))
  have sectorErrorPositive : 0 < sectorError := by dsimp [sectorError]; positivity
  obtain ⟨parentDelta, parentPositive, parentControl⟩ := Entropy.entropy_uniform_tolerance
    (A := Fin (length+length) → Fin 3) (half_pos positive)
  obtain ⟨poolDelta, poolPositive, poolControl⟩ := Entropy.massEntropy_uniform_tolerance
    (A := Fin length → Fin 3) 2 sectorErrorPositive
  refine ⟨min parentDelta poolDelta/4, by positivity, ?_⟩
  intro P finite nonempty data reference axisClass law law' range range' close
  have deltaNonnegative : 0 ≤ min parentDelta poolDelta/4 := by positivity
  have parentSmall : 2*(min parentDelta poolDelta/4) < parentDelta := by
    have := min_le_left parentDelta poolDelta
    linarith
  have poolSmall : 2*(min parentDelta poolDelta/4) < poolDelta := by
    have := min_le_right parentDelta poolDelta
    linarith
  have parent := parentControl (data.parentLaw (P := P) law) (data.parentLaw (P := P) law')
    (data.parentLaw_range reference law range) (data.parentLaw_range reference law' range')
    (fun word => (data.parentLaw_close reference law law' range range' deltaNonnegative close word).trans_lt parentSmall)
  have pool (sector : CompatibilityClass (2*length)) := poolControl
    (data.pooledLaw (P := P) axisClass law sector) (data.pooledLaw (P := P) axisClass law' sector)
    (data.pooledLaw_range reference axisClass law range sector) (data.pooledLaw_range reference axisClass law' range' sector)
    (fun symbol => (data.pooledLaw_close reference axisClass law law' deltaNonnegative close sector symbol).trans_lt poolSmall)
  have sumBound : |(∑ sector, Entropy.massEntropy (data.pooledLaw (P := P) axisClass law sector)) -
      ∑ sector, Entropy.massEntropy (data.pooledLaw (P := P) axisClass law' sector)| ≤ sectors*sectorError := by
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
    _ = |(Entropy.entropy (data.parentLaw (P := P) law)-Entropy.entropy (data.parentLaw (P := P) law')) -
      ((∑ sector, Entropy.massEntropy (data.pooledLaw (P := P) axisClass law sector)) -
        ∑ sector, Entropy.massEntropy (data.pooledLaw (P := P) axisClass law' sector))| := by congr 1; ring
    _ ≤ _ := abs_sub _ _
    _ < error := by linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
