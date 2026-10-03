module

public import PairedCoarseColumns
public import FKLCoarse.Build

/-! The real value of one physical-role paired coarse expression, with the role's coordinate
permutation eliminated: only the marginal-entropy axis `σ 0` depends on the role. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL Tensor.CW Entropy
open scoped BigOperators

theorem expression_value_perm {length n : ℕ} (P : Shape) (σ : Equiv.Perm (Fin 3))
    (e0 : Fin n ≃ ShapeAlphabet (2 * length)) (mass : Fin n → ℚ) (pot : Fin 3 → Fin (2 * length + 1) → ℚ)
    (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) (b0 : ℕ)
    (ha : ∀ c : Fin n, ((mass c : ℚ) : ℝ) = (a c : ℝ) / 2 ^ 44)
    (hsh : ∀ (c : Fin n) (b : Fin 3), Shape.coordinates (e0 c).val b = sh b c)
    (hfit : ∀ c : Fin n, fit c = decide ((e0 c).val.Fits P))
    (hpot : ∀ (b : Fin 3) (v : Fin (2 * length + 1)), ((pot b v : ℚ) : ℝ) = (un b v : ℝ) / 2 ^ (up b v))
    (hb0 : (σ 0).val = b0) :
    rationalLogValue (PairedCoarseColumns.expression (P.permute σ)
      (e0.trans (shapeAlphabetPermutation σ (2 * length))) mass (fun axis => pot (σ axis))) =
      CR n (2 * length + 1) a sh fit un up b0 := by
  set enum := e0.trans (shapeAlphabetPermutation σ (2 * length)) with henum
  have hcoord : ∀ (c : Fin n) (x : Fin 3), (shapeCoordinate (enum c) x).val = sh (σ x) c := by
    intro c x
    rw [henum, Equiv.trans_apply, shapeCoordinate_permutation]
    exact hsh c (σ x)
  have hmarg : ∀ (x : Fin 3) (v : Fin (2 * length + 1)),
      ((PairedCoarseColumns.marginal enum mass x v : ℚ) : ℝ) = xm n a sh (σ x) v := by
    intro x v
    unfold PairedCoarseColumns.marginal xm
    rw [marg_cast, sum_div', ← Fin.sum_univ_eq_sum_range (fun c => (if sh (σ x) c = v.val then (a c : ℝ) else 0) / 2 ^ 44) n]
    push_cast
    apply Finset.sum_congr rfl
    intro c _
    have hiff : shapeCoordinate (enum c) x = v ↔ sh (σ x) c = v.val := by
      rw [Fin.ext_iff, hcoord c x]
    by_cases h : shapeCoordinate (enum c) x = v
    · rw [if_pos h, if_pos (hiff.mp h), ha c]
    · rw [if_neg h, if_neg (fun h' => h (hiff.mpr h'))]; simp
  have E1 : entropy (fun v => ((PairedCoarseColumns.marginal enum mass 0 v : ℚ) : ℝ)) = margEnt n (2 * length + 1) a sh b0 := by
    unfold entropy margEnt
    congr 1
    rw [← Fin.sum_univ_eq_sum_range (fun v => xm n a sh b0 v * Real.log (xm n a sh b0 v)) (2 * length + 1)]
    apply Finset.sum_congr rfl
    intro v _
    dsimp only
    rw [hmarg 0 v, hb0]
  have E2 : entropy (fun c => ((mass c : ℚ) : ℝ)) =
      -∑ c ∈ Finset.range n, (a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44) := by
    unfold entropy
    congr 1
    rw [← Fin.sum_univ_eq_sum_range (fun c => (a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44)) n]
    apply Finset.sum_congr rfl
    intro c _
    dsimp only
    rw [ha c]
  have E3 : ((PairedCoarseColumns.normalizer (P.permute σ) enum (fun axis => pot (σ axis)) : ℚ) : ℝ) =
      zR n sh fit un up := by
    unfold PairedCoarseColumns.normalizer zR
    push_cast
    rw [← Fin.sum_univ_eq_sum_range (fun c => if fit c = true then uR un up 0 (sh 0 c) * uR un up 1 (sh 1 c) *
      uR un up 2 (sh 2 c) else 0) n]
    apply Finset.sum_congr rfl
    intro c _
    have hfits : (enum c).val.Fits (P.permute σ) ↔ (e0 c).val.Fits P := by
      have e : (enum c).val = (e0 c).val.permute σ := rfl
      rw [e]; exact Shape.permute_fits σ (e0 c).val P
    have hfc : fit c = true ↔ (e0 c).val.Fits P := by rw [hfit c]; exact decide_eq_true_iff
    have hfac : ∀ x : Fin 3, ((pot (σ x) (shapeCoordinate (enum c) x) : ℚ) : ℝ) = uR un up (σ x) (sh (σ x) c) := by
      intro x
      rw [hpot, hcoord c x]; rfl
    by_cases hf : (e0 c).val.Fits P
    · rw [if_pos (hfits.mpr hf), if_pos (hfc.mpr hf)]
      push_cast
      rw [hfac 0, hfac 1, hfac 2]
      have hp := Equiv.prod_comp σ (fun b : Fin 3 => uR un up b (sh b c))
      simp only [Fin.prod_univ_three] at hp
      rw [hp]; rfl
    · rw [if_neg (fun h => hf (hfits.mp h)), if_neg (fun h => hf (hfc.mp h))]
      simp
  have E4 : ∀ x : Fin 3, ∑ v : Fin (2 * length + 1), ((PairedCoarseColumns.marginal enum mass x v : ℚ) : ℝ) *
      Real.log ((pot (σ x) v : ℚ) : ℝ) =
      ∑ v ∈ Finset.range (2 * length + 1), xm n a sh (σ x) v * Real.log (uR un up (σ x) v) := by
    intro x
    rw [← Fin.sum_univ_eq_sum_range (fun v => xm n a sh (σ x) v * Real.log (uR un up (σ x) v)) (2 * length + 1)]
    apply Finset.sum_congr rfl
    intro v _
    rw [hmarg x v, hpot]; rfl
  have E5 : (∑ v ∈ Finset.range (2 * length + 1), xm n a sh (σ 0) v * Real.log (uR un up (σ 0) v)) +
      (∑ v ∈ Finset.range (2 * length + 1), xm n a sh (σ 1) v * Real.log (uR un up (σ 1) v)) +
      (∑ v ∈ Finset.range (2 * length + 1), xm n a sh (σ 2) v * Real.log (uR un up (σ 2) v)) =
      ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range (2 * length + 1), xm n a sh b v * Real.log (uR un up b v) := by
    have hs := Equiv.sum_comp σ (fun b : Fin 3 => ∑ v ∈ Finset.range (2 * length + 1),
      xm n a sh b v * Real.log (uR un up b v))
    simp only [Fin.sum_univ_three] at hs
    rw [hs, ← Fin.sum_univ_eq_sum_range (fun b => ∑ v ∈ Finset.range (2 * length + 1),
      xm n a sh b v * Real.log (uR un up b v)) 3, Fin.sum_univ_three]
  simp only [PairedCoarseColumns.expression, rationalLogValue_append, entropyLogExpression_value, logAtom_value,
    logExpectationExpression_value]
  rw [E1, E2, E3, E4 0, E4 1, E4 2]
  unfold CR common
  rw [← E5]
  push_cast
  ring

end MatrixBounds.Numeric.FKLCoarse
