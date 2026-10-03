module

public import CWPartition
public import MatrixTensor

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A zero-coordinate CW slice is a nondegenerate pairing. Its fine blocks
therefore determine complementary words on the other two axes. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K]

/-- Swapping the two extreme coordinates complements a CW zero slice. -/
def complement (q : ℕ) : Equiv.Perm (Fin (q+2)) := Equiv.swap 0 ⟨q+1, by omega⟩

/-- Each coordinate is zero, one middle coordinate, or the extreme coordinate. -/
theorem coordinate_cases {q : ℕ} (entry : Fin (q+2)) : entry = 0 ∨
    (∃ index : Fin q, entry = ⟨index.val+1, by omega⟩) ∨ entry = ⟨q+1, by omega⟩ := by
  by_cases zero : entry = 0
  · exact Or.inl zero
  by_cases extreme : entry.val = q+1
  · exact Or.inr (Or.inr (Fin.ext extreme))
  apply Or.inr ∘ Or.inl
  have positive : 0 < entry.val := by
    have nonzero : entry.val ≠ 0 := fun h => zero (Fin.ext h)
    omega
  refine ⟨⟨entry.val-1, by omega⟩, Fin.ext ?_⟩
  dsimp
  omega

/-- Complementation fixes middle symbols and exchanges the extreme symbols. -/
theorem complement_middle {q : ℕ} (index : Fin q) :
    complement q (⟨index.val+1, by omega⟩ : Fin (q+2)) = ⟨index.val+1, by omega⟩ := by
  apply Equiv.swap_apply_of_ne_of_ne
  · intro h; have := congrArg Fin.val h; simp at this
  · intro h; have := congrArg Fin.val h; dsimp at this; omega

/-- The zero-Z coefficient is exactly the complementary X/Y pairing. -/
theorem zero_z_slice {q : ℕ} (x y : Fin (q+2)) :
    tensor (K := K) q x y 0 = if y = complement q x then 1 else 0 := by
  have middle_nonzero (index : Fin q) : (⟨index.val+1, by omega⟩ : Fin (q+2)) ≠ 0 := by
    intro h; have := congrArg Fin.val h; simp at this
  have extreme_nonzero : (⟨q+1, by omega⟩ : Fin (q+2)) ≠ 0 := by
    intro h; have := congrArg Fin.val h; simp at this
  have middle_extreme (index : Fin q) :
      (⟨index.val+1, by omega⟩ : Fin (q+2)) ≠ ⟨q+1, by omega⟩ := by
    intro h; have := congrArg Fin.val h; dsimp at this; omega
  obtain rfl | ⟨index, rfl⟩ | rfl := coordinate_cases x
  · simp [tensor, delta, middle_nonzero, extreme_nonzero, complement, eq_comm]
  · simp only [tensor, delta, middle_nonzero, extreme_nonzero, if_false, mul_zero, add_zero,
      complement_middle]
    have sum : (∑ i : Fin q,
        (if (⟨i.val+1, by omega⟩ : Fin (q+2)) = ⟨index.val+1, by omega⟩ then (1 : K) else 0) *
          (if (⟨i.val+1, by omega⟩ : Fin (q+2)) = y then 1 else 0)) =
        if y = (⟨index.val+1, by omega⟩ : Fin (q+2)) then 1 else 0 := by
      rw [Finset.sum_eq_single index]
      · simp [eq_comm]
      · intro i _ different
        have h : (⟨i.val+1, by omega⟩ : Fin (q+2)) ≠ ⟨index.val+1, by omega⟩ := by
          intro same
          apply different
          apply Fin.ext
          have := congrArg Fin.val same
          dsimp at this
          omega
        simp [h]
      · simp
    simpa only [if_neg (Ne.symm (middle_nonzero index)), if_neg (Ne.symm (middle_extreme index)),
      if_true, mul_one, zero_mul, zero_add, add_zero] using sum
  · simp [tensor, delta, middle_nonzero, extreme_nonzero, middle_extreme, complement, eq_comm]

/-- Cyclically permuting the three axes preserves the CW tensor. -/
theorem tensor_cyclic {q : ℕ} (x y z : Fin (q+2)) :
    tensor (K := K) q x y z = tensor q y z x := by
  simp only [tensor, Finset.sum_add_distrib]
  simp only [mul_comm, mul_left_comm, mul_assoc]
  ring

/-- The zero-X coefficient pairs Y with the complement of Z. -/
theorem zero_x_slice {q : ℕ} (y z : Fin (q+2)) :
    tensor (K := K) q 0 y z = if z = complement q y then 1 else 0 := by
  rw [tensor_cyclic, zero_z_slice]

/-- The zero-Y coefficient pairs Z with the complement of X. -/
theorem zero_y_slice {q : ℕ} (x z : Fin (q+2)) :
    tensor (K := K) q x 0 z = if x = complement q z then 1 else 0 := by
  rw [tensor_cyclic, zero_x_slice]

/-- A word of coarse total zero consists entirely of the distinguished zero symbol. -/
theorem wordCoarse_zero {q length : ℕ} (word : Fin length → Fin (q+2)) :
    wordCoarse word = 0 ↔ ∀ position, word position = 0 := by
  simp only [wordCoarse, Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => Nat.zero_le _),
    Finset.mem_univ, forall_true_left, coarse_eq_zero]

/-- A nonzero tensor-power coefficient in a zero-Z sector forces the complete X/Y fine words. -/
theorem zero_z_word_forces {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (zero : wordCoarse z = 0) :
    y = fun position => complement q (x position) := by
  funext position
  have entry_zero := (wordCoarse_zero z).mp zero position
  have entry_nonzero : tensor (K := K) q (x position) (y position) (z position) ≠ 0 := by
    intro vanished
    exact nonzero (Finset.prod_eq_zero (Finset.mem_univ position) vanished)
  rw [entry_zero, zero_z_slice] at entry_nonzero
  by_contra different
  exact entry_nonzero (if_neg different)

/-- Cyclic symmetry also holds for every tensor power in its word coordinates. -/
theorem word_tensor_cyclic {q length : ℕ} (x y z : Fin length → Fin (q+2)) :
    wordPower (tensor (K := K) q) length x y z = wordPower (tensor q) length y z x := by
  exact Finset.prod_congr rfl (fun i _ => tensor_cyclic (x i) (y i) (z i))

/-- Zero-X sectors force complete Y/Z fine words through the same complement. -/
theorem zero_x_word_forces {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (zero : wordCoarse x = 0) :
    z = fun position => complement q (y position) := by
  apply zero_z_word_forces (K := K) y z x _ zero
  rwa [← word_tensor_cyclic (K := K) x y z]

/-- Zero-Y sectors force complete Z/X fine words through the same complement. -/
theorem zero_y_word_forces {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (zero : wordCoarse y = 0) :
    x = fun position => complement q (z position) := by
  apply zero_z_word_forces (K := K) z x y _ zero
  rwa [word_tensor_cyclic (K := K) z x y]

/-- The coarse label is always one of zero, one, and two. -/
theorem coarse_le_two {q : ℕ} (entry : Fin (q+2)) : coarse entry ≤ 2 := by
  unfold coarse
  split_ifs <;> omega

/-- Complementary CW coordinates have complementary coarse labels. -/
theorem coarse_complement {q : ℕ} (entry : Fin (q+2)) :
    coarse (complement q entry) = 2-coarse entry := by
  obtain rfl | ⟨index, rfl⟩ | rfl := coordinate_cases entry
  · simp [complement, coarse_zero, coarse_extreme]
  · simp [complement_middle, coarse_middle]
  · simp [complement, coarse_zero, coarse_extreme]

/-- In a zero sector, the fine coarse-label word on one axis determines the other. -/
theorem zero_z_fine_forces {q length : ℕ} (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) (zero : wordCoarse z = 0)
    (position : Fin length) : coarse (y position) = 2-coarse (x position) := by
  rw [zero_z_word_forces x y z nonzero zero]
  exact coarse_complement (x position)

end
end MatrixBounds.Tensor.CW
