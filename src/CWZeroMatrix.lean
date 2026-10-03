module

public import CWZeroSlice
public import TensorBatching

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit matrix multiplication constituents obtained from zero-coordinate
CW sectors. Arbitrary admissible word subsets are retained by coordinate maps. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K]

/-- Coordinatewise complement as a permutation of complete CW variable words. -/
def wordComplement (q length : ℕ) : Equiv.Perm (Fin length → Fin (q+2)) where
  toFun word position := complement q (word position)
  invFun word position := complement q (word position)
  left_inv word := by funext position; simp [complement]
  right_inv word := by funext position; simp [complement]

/-- A zero-Z tensor-power slice is exactly one complementary pairing of word coordinates. -/
theorem word_zero_z_pairing {q length : ℕ} (x y : Fin length → Fin (q+2)) :
    wordPower (tensor (K := K) q) length x y (fun _ => 0) =
      if y = wordComplement q length x then 1 else 0 := by
  classical
  by_cases paired : y = wordComplement q length x
  · subst y
    simp [wordPower, zero_z_slice, wordComplement]
  · rw [if_neg paired]
    have mismatch : ∃ position, y position ≠ complement q (x position) := by
      by_contra none
      apply paired
      funext position
      by_contra different
      exact none ⟨position, different⟩
    obtain ⟨position, different⟩ := mismatch
    apply Finset.prod_eq_zero (Finset.mem_univ position)
    rw [zero_z_slice, if_neg different]

/-- Injectively selected complementary words form a 1-by-n-by-1 matrix multiplication tensor.
The three maps are coordinate selections on X, Y, and Z respectively. -/
theorem zero_z_matrix_identity {q length : ℕ} {Index : Type*} [DecidableEq Index] [Fintype Index]
    (words : Index ↪ (Fin length → Fin (q+2))) :
    (fun (x : PUnit × Index) (y : Index × PUnit) (_z : PUnit × PUnit) =>
      wordPower (tensor (K := K) q) length (words x.2) (wordComplement q length (words y.1)) (fun _ => 0)) =
      MatrixMul.tensor (K := K) (I := PUnit) (J := Index) (L := PUnit) := by
  funext x y z
  rw [word_zero_z_pairing]
  simp only [EmbeddingLike.apply_eq_iff_eq, MatrixMul.tensor,
    Subsingleton.elim x.1 z.1, Subsingleton.elim y.2 z.2, true_and, and_true]
  simp only [eq_comm]

/-- A source rank budget transports to any selected zero-sector matrix constituent. -/
theorem zero_z_matrix_rank {q length budget : ℕ} {Index : Type*} [DecidableEq Index] [Fintype Index]
    (words : Index ↪ (Fin length → Fin (q+2)))
    (rank : RankLE (wordPower (tensor (K := K) q) length) budget) :
    RankLE (MatrixMul.tensor (K := K) (I := PUnit) (J := Index) (L := PUnit)) budget := by
  rw [← zero_z_matrix_identity words]
  exact rankLE_pullback rank _ _ _

/-- Polynomial source certificates also restrict to these genuine matrix constituents. -/
def zeroZMatrixCertificate {q length rank degree : ℕ} {Index : Type*} [DecidableEq Index] [Fintype Index]
    (words : Index ↪ (Fin length → Fin (q+2)))
    (certificate : Degeneration.Certificate (wordPower (tensor (K := K) q) length) rank degree) :
    Degeneration.Certificate (MatrixMul.tensor (K := K) (I := PUnit) (J := Index) (L := PUnit)) rank degree := by
  rw [← zero_z_matrix_identity words]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.CW
