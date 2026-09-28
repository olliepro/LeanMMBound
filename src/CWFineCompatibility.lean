import CWZeroSlice
import EmpiricalTypes

/-! Actual necessary compatibility of complete fine-block empirical types in
zero-coordinate CW sectors. The fine alphabet is the finite set {0,1,2}. -/
namespace MatrixBounds.Empirical

noncomputable section

/-- Relabeling symbols by a bijection transports empirical counts along its inverse. -/
theorem count_map_equiv {P B C : Type*} (equiv : B ≃ C) (word : P → B) (symbol : C) :
    count (fun p => equiv (word p)) symbol = count word (equiv.symm symbol) := by
  apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
  intro p
  constructor
  · intro same
    simpa using congrArg equiv.symm same
  · intro same
    change equiv (word p) = symbol
    rw [same]
    exact equiv.apply_symm_apply symbol

/-- A fixed complete type forces the complete type of a bijectively relabeled word. -/
theorem hasType_map_equiv {P B C : Type*} (equiv : B ≃ C) (profile : B → ℕ) (word : P → B)
    (typed : HasType profile word) :
    HasType (fun symbol => profile (equiv.symm symbol)) (fun p => equiv (word p)) := by
  intro symbol
  rw [count_map_equiv]
  exact typed (equiv.symm symbol)

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.CW

open MatrixBounds.Empirical
noncomputable section
variable {K : Type*} [CommRing K]

/-- One fine-block label, interpreted in the finite three-symbol alphabet. -/
def fineLabel {q : ℕ} (entry : Fin (q+2)) : Fin 3 := ⟨coarse entry, by have := coarse_le_two entry; omega⟩

/-- The complete fine-block label word of a CW power variable. -/
def fineWord {q length : ℕ} (word : Fin length → Fin (q+2)) : Fin length → Fin 3 :=
  fun position => fineLabel (word position)

/-- Reverse each fine symbol, exchanging zero and two and fixing one. -/
def fineComplement (length : ℕ) : Equiv.Perm (Fin length → Fin 3) where
  toFun word position := (word position).rev
  invFun word position := (word position).rev
  left_inv word := by funext position; simp
  right_inv word := by funext position; simp

/-- A nonzero coefficient in a zero-Z sector forces the entire complementary fine block. -/
theorem zero_z_fine_word {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (zero : wordCoarse z = 0) :
    fineWord y = fineComplement length (fineWord x) := by
  funext position
  apply Fin.ext
  dsimp [fineWord, fineLabel, fineComplement, Fin.rev]
  have forced := zero_z_fine_forces x y z nonzero zero position
  omega

/-- Fixed complete X types force the complete Y types used by zero-Z compatibility tests. -/
theorem zero_z_type_forced {P : Type*} {q length : ℕ}
    (x y z : P → Fin length → Fin (q+2)) (profile : (Fin length → Fin 3) → ℕ)
    (nonzero : ∀ p, wordPower (tensor (K := K) q) length (x p) (y p) (z p) ≠ 0)
    (zero : ∀ p, wordCoarse (z p) = 0) (typed : HasType profile (fun p => fineWord (x p))) :
    HasType (fun symbol => profile ((fineComplement length).symm symbol)) (fun p => fineWord (y p)) := by
  have same : (fun p => fineWord (y p)) = fun p => fineComplement length (fineWord (x p)) := by
    funext p
    exact zero_z_fine_word (x p) (y p) (z p) (nonzero p) (zero p)
  rw [same]
  exact hasType_map_equiv (fineComplement length) profile (fun p => fineWord (x p)) typed

/-- Fixed complete Y types force complete Z types in zero-X sectors. -/
theorem zero_x_type_forced {P : Type*} {q length : ℕ}
    (x y z : P → Fin length → Fin (q+2)) (profile : (Fin length → Fin 3) → ℕ)
    (nonzero : ∀ p, wordPower (tensor (K := K) q) length (x p) (y p) (z p) ≠ 0)
    (zero : ∀ p, wordCoarse (x p) = 0) (typed : HasType profile (fun p => fineWord (y p))) :
    HasType (fun symbol => profile ((fineComplement length).symm symbol)) (fun p => fineWord (z p)) := by
  apply zero_z_type_forced (K := K) y z x profile _ zero typed
  intro p
  rw [← word_tensor_cyclic (K := K) (x p) (y p) (z p)]
  exact nonzero p

/-- Fixed complete Z types force complete X types in zero-Y sectors. -/
theorem zero_y_type_forced {P : Type*} {q length : ℕ}
    (x y z : P → Fin length → Fin (q+2)) (profile : (Fin length → Fin 3) → ℕ)
    (nonzero : ∀ p, wordPower (tensor (K := K) q) length (x p) (y p) (z p) ≠ 0)
    (zero : ∀ p, wordCoarse (y p) = 0) (typed : HasType profile (fun p => fineWord (z p))) :
    HasType (fun symbol => profile ((fineComplement length).symm symbol)) (fun p => fineWord (x p)) := by
  apply zero_z_type_forced (K := K) z x y profile _ zero typed
  intro p
  rw [word_tensor_cyclic (K := K) (z p) (x p) (y p)]
  exact nonzero p

/-- In the zero-Y case, complete X types also force the complementary Z types. -/
theorem zero_y_type_forced_from_x {P : Type*} {q length : ℕ}
    (x y z : P → Fin length → Fin (q+2)) (profile : (Fin length → Fin 3) → ℕ)
    (nonzero : ∀ p, wordPower (tensor (K := K) q) length (x p) (y p) (z p) ≠ 0)
    (zero : ∀ p, wordCoarse (y p) = 0) (typed : HasType profile (fun p => fineWord (x p))) :
    HasType (fun symbol => profile ((fineComplement length).symm symbol)) (fun p => fineWord (z p)) := by
  have same : (fun p => fineWord (z p)) = fun p => fineComplement length (fineWord (x p)) := by
    funext p
    have complementary := zero_z_fine_word (K := K) (z p) (x p) (y p)
      (by rw [word_tensor_cyclic (K := K) (z p) (x p) (y p)]; exact nonzero p) (zero p)
    rw [complementary]
    exact ((fineComplement length).symm_apply_apply (fineWord (z p))).symm
  rw [same]
  exact hasType_map_equiv (fineComplement length) profile (fun p => fineWord (x p)) typed

end
end MatrixBounds.Tensor.CW
