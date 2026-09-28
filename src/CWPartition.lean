import TensorPowers

/-! The actual CW tensor carries the coarse support used by the shared hash.
These statements inspect coefficients, including all middle and extreme terms. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K]

/-- The three coarse CW variable classes: zero, middle, and extreme. -/
def coarse {q : ℕ} (entry : Fin (q+2)) : ℕ :=
  if entry = 0 then 0 else if entry.val = q+1 then 2 else 1

/-- The distinguished zero coordinate has coarse index zero. -/
theorem coarse_zero (q : ℕ) : coarse (0 : Fin (q+2)) = 0 := by simp [coarse]

/-- Every one of the q middle coordinates has coarse index one. -/
theorem coarse_middle {q : ℕ} (index : Fin q) : coarse (⟨index.val+1, by omega⟩ : Fin (q+2)) = 1 := by
  have nonzero : (⟨index.val+1, by omega⟩ : Fin (q+2)) ≠ 0 := by intro h; have := congrArg Fin.val h; simp at this
  have not_extreme : index.val+1 ≠ q+1 := by omega
  simp only [coarse, if_neg nonzero, if_neg not_extreme]

/-- The extreme coordinate has coarse index two. -/
theorem coarse_extreme (q : ℕ) : coarse (⟨q+1, by omega⟩ : Fin (q+2)) = 2 := by
  have nonzero : (⟨q+1, by omega⟩ : Fin (q+2)) ≠ 0 := by intro h; have := congrArg Fin.val h; simp at this
  simp [coarse, nonzero]

/-- Coarse class zero contains exactly one original CW coordinate. -/
theorem coarse_eq_zero {q : ℕ} (entry : Fin (q+2)) : coarse entry = 0 ↔ entry = 0 := by
  by_cases zero : entry = 0
  · simp [coarse, zero]
  · simp only [coarse, if_neg zero]
    split_ifs <;> simp [zero]

/-- Every nonzero CW coefficient has coarse coordinate sum two. -/
theorem support_total {q : ℕ} (x y z : Fin (q+2)) (nonzero : tensor (K := K) q x y z ≠ 0) :
    coarse x + coarse y + coarse z = 2 := by
  by_contra wrong
  have term_zero (a b c : Fin (q+2)) (valid : coarse a + coarse b + coarse c = 2) :
      delta (K := K) a x * delta b y * delta c z = 0 := by
    by_cases hx : a = x
    · by_cases hy : b = y
      · by_cases hz : c = z
        · subst a; subst b; subst c; exact (wrong valid).elim
        · simp [delta, hz]
      · simp [delta, hy]
    · simp [delta, hx]
  apply nonzero
  unfold tensor
  have middle (i : Fin q) :
      delta (K := K) ⟨i.val+1, by omega⟩ x * delta ⟨i.val+1, by omega⟩ y * delta 0 z +
      delta ⟨i.val+1, by omega⟩ x * delta 0 y * delta ⟨i.val+1, by omega⟩ z +
      delta 0 x * delta ⟨i.val+1, by omega⟩ y * delta ⟨i.val+1, by omega⟩ z = 0 := by
    rw [term_zero _ _ _ (by simp [coarse_middle, coarse_zero]),
      term_zero _ _ _ (by simp [coarse_middle, coarse_zero]),
      term_zero _ _ _ (by simp [coarse_middle, coarse_zero])]
    simp
  rw [Finset.sum_congr rfl (fun i _ => middle i)]
  rw [term_zero _ _ _ (by simp [coarse_extreme, coarse_zero]),
    term_zero _ _ _ (by simp [coarse_extreme, coarse_zero]),
    term_zero _ _ _ (by simp [coarse_extreme, coarse_zero])]
  simp

/-- Coarse index of one whole axis word in a CW tensor power. -/
def wordCoarse {q length : ℕ} (word : Fin length → Fin (q+2)) : ℕ := ∑ i, coarse (word i)

/-- Coarse support is valid separately at every position of a nonzero tensor-power coefficient. -/
theorem word_support_coordinates {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (position : Fin length) :
    coarse (x position) + coarse (y position) + coarse (z position) = 2 := by
  apply support_total (K := K)
  intro zero
  exact nonzero (Finset.prod_eq_zero (Finset.mem_univ position) zero)

/-- Coarse totals in the n-fold CW source add to 2n, including mixed-level factor sizes. -/
theorem word_support_total {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) :
    wordCoarse x + wordCoarse y + wordCoarse z = 2*length := by
  unfold wordCoarse
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  simp only [word_support_coordinates x y z nonzero, Finset.sum_const,
    Finset.card_univ, Fintype.card_fin, smul_eq_mul]
  omega

end
end MatrixBounds.Tensor.CW
