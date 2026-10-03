module

public import FKL.Kron

/-! Packed natural-number tables: a list of lanes below `2^w` packed little-endian into one `Nat`,
read back by `lane`. -/

@[expose] public section

namespace FKL

theorem raw_land (a b : Nat) : Nat.land a b = a &&& b := rfl
theorem raw_shiftRight (a b : Nat) : Nat.shiftRight a b = a >>> b := rfl
theorem raw_shiftLeft (a b : Nat) : Nat.shiftLeft a b = a <<< b := rfl
theorem raw_sub (a b : Nat) : Nat.sub a b = a - b := rfl
theorem raw_add (a b : Nat) : Nat.add a b = a + b := rfl
theorem raw_mul (a b : Nat) : Nat.mul a b = a * b := rfl
theorem raw_pow2 (w : Nat) : Nat.shiftLeft 1 w = 2 ^ w := by rw [raw_shiftLeft, Nat.one_shiftLeft]

/-- Little-endian packing of a list into lanes of width `w`. -/
def pack (w : Nat) : List Nat → Nat
  | [] => 0
  | x :: xs => x + pack w xs * 2 ^ w

theorem lane_eq (d w i : Nat) : lane d w i = d / 2 ^ (w * i) % 2 ^ w := by
  simp only [lane, raw_land, raw_shiftRight, raw_sub, raw_mul, raw_pow2, Nat.shiftRight_eq_div_pow]
  exact Nat.and_two_pow_sub_one_eq_mod _ _

theorem lane_pack_cons_zero (w x : Nat) (xs : List Nat) (hx : x < 2 ^ w) :
    lane (pack w (x :: xs)) w 0 = x := by
  rw [lane_eq, Nat.mul_zero, pow_zero, Nat.div_one, pack, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hx]

theorem lane_pack_cons_succ (w x : Nat) (xs : List Nat) (hx : x < 2 ^ w) (i : Nat) :
    lane (pack w (x :: xs)) w (i + 1) = lane (pack w xs) w i := by
  rw [lane_eq, lane_eq, pack, Nat.mul_add, Nat.mul_one, Nat.add_comm (w * i) w, pow_add,
    ← Nat.div_div_eq_div_mul]
  congr 2
  rw [Nat.add_mul_div_right _ _ (Nat.two_pow_pos w), Nat.div_eq_of_lt hx, Nat.zero_add]

/-- Reading lane `i` of a packed list returns its `i`-th entry. -/
theorem lane_pack (w : Nat) : ∀ (l : List Nat), (∀ x ∈ l, x < 2 ^ w) → ∀ (i : Nat) (h : i < l.length),
    lane (pack w l) w i = l[i]
  | [], _, i, h => absurd h (Nat.not_lt_zero _)
  | x :: xs, hl, 0, _ => lane_pack_cons_zero w x xs (hl x List.mem_cons_self)
  | x :: xs, hl, i + 1, h => by
    rw [lane_pack_cons_succ w x xs (hl x List.mem_cons_self)]
    exact lane_pack w xs (fun y hy => hl y (List.mem_cons_of_mem _ hy)) i (by simpa using h)

/-- Raw executable test that every list entry fits in a lane. -/
def fits (w : Nat) (l : List Nat) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun x _ rec => Bool.and (Nat.blt x (Nat.shiftLeft 1 w)) rec) l

theorem fits_cons (w x : Nat) (xs : List Nat) :
    fits w (x :: xs) = Bool.and (Nat.blt x (Nat.shiftLeft 1 w)) (fits w xs) := rfl

theorem fits_sound (w : Nat) (l : List Nat) (h : fits w l = true) : ∀ x ∈ l, x < 2 ^ w := by
  induction l with
  | nil => simp
  | cons x xs ih =>
    rw [fits_cons] at h
    simp only [Bool.and_eq_true, Nat.blt_eq, raw_pow2] at h
    intro y hy
    rcases List.mem_cons.mp hy with rfl | hy
    · exact h.1
    · exact ih h.2 y hy

/-- Raw executable comparison of a packed constant with an explicit list, lane by lane. -/
def packedEq (w d : Nat) (l : List Nat) : Bool :=
  List.rec (motive := fun _ => Nat → Bool) (fun d => Nat.beq d 0)
    (fun x _ rec d => Bool.and (Nat.beq (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1)) x)
      (Bool.and (Nat.blt x (Nat.shiftLeft 1 w)) (rec (Nat.shiftRight d w)))) l d

theorem packedEq_cons (w d x : Nat) (xs : List Nat) :
    packedEq w d (x :: xs) = Bool.and (Nat.beq (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1)) x)
      (Bool.and (Nat.blt x (Nat.shiftLeft 1 w)) (packedEq w (Nat.shiftRight d w) xs)) := rfl

theorem packedEq_sound (w : Nat) (l : List Nat) : ∀ d, packedEq w d l = true → d = pack w l ∧ ∀ x ∈ l, x < 2 ^ w := by
  induction l with
  | nil => intro d h; simpa [packedEq, pack] using h
  | cons x xs ih =>
    intro d h
    rw [packedEq_cons] at h
    simp only [Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq, raw_pow2, raw_land, raw_sub] at h
    obtain ⟨hx, hlt, hrest⟩ := h
    obtain ⟨hd, hfit⟩ := ih _ hrest
    have hmod : d % 2 ^ w = x := by rw [← hx, Nat.and_two_pow_sub_one_eq_mod]
    refine ⟨?_, ?_⟩
    · rw [pack, ← hd, raw_shiftRight, Nat.shiftRight_eq_div_pow, ← hmod]
      exact (Nat.mod_add_div' d (2 ^ w)).symm
    · intro y hy
      rcases List.mem_cons.mp hy with rfl | hy
      · exact hlt
      · exact hfit y hy

/-- A checked packed constant reads back every entry of its list. -/
theorem lane_of_packedEq (w d : Nat) (l : List Nat) (h : packedEq w d l = true) (i : Nat) (hi : i < l.length) :
    lane d w i = l[i] := by
  obtain ⟨hd, hfit⟩ := packedEq_sound w l d h
  rw [hd]
  exact lane_pack w l hfit i hi

end FKL
