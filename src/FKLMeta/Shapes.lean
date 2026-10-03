module

public import FKLBridge.Rows

/-! Index arithmetic of the lexicographic shape enumeration `shapes t`, and a raw-`Nat`
evaluator for `SplitRow.check`.

`shapes t` lists `⟨x, y, t-x-y⟩` for `x ≤ t`, `y ≤ t-x` in lexicographic order, so the shape
`⟨x, y, t-x-y⟩` sits at index `off t x + y`, where `off t x = x·(2t+3-x)/2`. -/

@[expose] public section

namespace FKLMeta

open MatrixBounds.Numeric

/-! ### Small raw loops -/

/-- `f i = true` for every `i < n` (linear recursion; only for small `n`). -/
def allN (f : Nat → Bool) (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i acc => Bool.and acc (f i)) n

theorem allN_sound (f : Nat → Bool) : ∀ n, allN f n = true → ∀ i < n, f i = true := by
  intro n
  induction n with
  | zero => intro _ i hi; omega
  | succ n ih =>
    intro h i hi
    have h' : Bool.and (allN f n) (f n) = true := h
    simp only [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | hi
    · exact ih h'.1 i hi
    · rw [hi]; exact h'.2

/-! ### Shape offsets -/

/-- Raw offset of the shapes with first coordinate `x` in `shapes t`. -/
def off (t x : Nat) : Nat := Nat.div (Nat.mul x (Nat.sub (Nat.add (Nat.mul 2 t) 3) x)) 2

/-- Recursive form of the offset. -/
def offR (t : Nat) : Nat → Nat
  | 0 => 0
  | x + 1 => offR t x + (t - x + 1)

theorem two_offR (t : Nat) : ∀ x, x ≤ t + 1 → 2 * offR t x = x * (2 * t + 3 - x) := by
  intro x
  induction x with
  | zero => intro _; simp [offR]
  | succ x ih =>
    intro hx
    have hx' : x ≤ t := by omega
    rw [offR, Nat.mul_add, ih (by omega)]
    obtain ⟨u, rfl⟩ := Nat.exists_eq_add_of_le hx'
    rw [show 2 * (x + u) + 3 - x = x + 2 * u + 3 by omega, show x + u - x + 1 = u + 1 by omega,
      show 2 * (x + u) + 3 - (x + 1) = x + 2 * u + 2 by omega]
    ring

theorem off_eq (t x : Nat) (hx : x ≤ t + 1) : off t x = offR t x := by
  show x * (2 * t + 3 - x) / 2 = offR t x
  rw [← two_offR t x hx]; omega

theorem offR_mono (t a : Nat) : ∀ b, a ≤ b → offR t a ≤ offR t b := by
  intro b
  induction b with
  | zero => intro h; rw [Nat.le_zero.mp h]
  | succ b ih =>
    intro h
    rcases Nat.lt_or_eq_of_le h with h | h
    · have := ih (by omega); rw [offR]; omega
    · rw [h]

/-! ### Indexing `shapes t` -/

/-- One block of `shapes t`. -/
def block (t x : Nat) : List Shape := (List.range (t - x + 1)).map (fun y => (⟨x, y, t - x - y⟩ : Shape))

theorem shapes_eq (t : Nat) : shapes t = (List.range (t + 1)).flatMap (block t) := rfl

theorem block_length (t x : Nat) : (block t x).length = t - x + 1 := by simp [block]

theorem flat_length (t : Nat) : ∀ n, n ≤ t + 1 → ((List.range n).flatMap (block t)).length = offR t n := by
  intro n
  induction n with
  | zero => intro _; simp [offR]
  | succ n ih =>
    intro hn
    rw [List.range_succ, List.flatMap_append, List.length_append, ih (by omega), offR]
    simp [block_length]

theorem block_get (t x j : Nat) (hj : j < t - x + 1) : (block t x)[j]? = some ⟨x, j, t - x - j⟩ := by
  simp only [block, List.getElem?_map, List.getElem?_range hj, Option.map_some]

theorem block_get_none (t x j : Nat) (hj : ¬ j < t - x + 1) : (block t x)[j]? = none :=
  List.getElem?_eq_none (by rw [block_length]; omega)

theorem flat_fwd (t : Nat) : ∀ n, n ≤ t + 1 → ∀ (k : Nat) (s : Shape),
    ((List.range n).flatMap (block t))[k]? = some s →
    ∃ x y, x < n ∧ y ≤ t - x ∧ s = ⟨x, y, t - x - y⟩ ∧ k = offR t x + y := by
  intro n
  induction n with
  | zero => intro _ k s h; simp at h
  | succ n ih =>
    intro hn k s h
    rw [List.range_succ, List.flatMap_append] at h
    by_cases hk : k < ((List.range n).flatMap (block t)).length
    · rw [List.getElem?_append_left hk] at h
      obtain ⟨x, y, hx, hy, hs, hkk⟩ := ih (by omega) k s h
      exact ⟨x, y, by omega, hy, hs, hkk⟩
    · rw [List.getElem?_append_right (by omega), flat_length t n (by omega)] at h
      rw [flat_length t n (by omega)] at hk
      simp only [List.flatMap_cons, List.flatMap_nil, List.append_nil] at h
      by_cases hj : k - offR t n < t - n + 1
      · rw [block_get t n _ hj] at h
        exact ⟨n, k - offR t n, by omega, by omega, (Option.some.inj h).symm, by omega⟩
      · rw [block_get_none t n _ hj] at h; exact absurd h (by simp)

theorem flat_bwd (t : Nat) : ∀ n, n ≤ t + 1 → ∀ x y, x < n → y ≤ t - x →
    ((List.range n).flatMap (block t))[offR t x + y]? = some ⟨x, y, t - x - y⟩ := by
  intro n
  induction n with
  | zero => intro _ x y hx; omega
  | succ n ih =>
    intro hn x y hx hy
    rw [List.range_succ, List.flatMap_append]
    rcases Nat.lt_succ_iff_lt_or_eq.mp hx with hx | hx
    · have hlt : offR t x + y < ((List.range n).flatMap (block t)).length := by
        rw [flat_length t n (by omega)]
        have := offR_mono t (x + 1) n (by omega)
        rw [offR] at this; omega
      rw [List.getElem?_append_left hlt]
      exact ih (by omega) x y hx hy
    · subst hx
      rw [List.getElem?_append_right (by rw [flat_length t x (by omega)]; omega), flat_length t x (by omega)]
      simp only [List.flatMap_cons, List.flatMap_nil, List.append_nil]
      rw [show offR t x + y - offR t x = y by omega]
      exact block_get t x y (by omega)

theorem shapes_fwd (t k : Nat) (s : Shape) (h : (shapes t)[k]? = some s) :
    ∃ x y, x ≤ t ∧ y ≤ t - x ∧ s = ⟨x, y, t - x - y⟩ ∧ k = offR t x + y := by
  obtain ⟨x, y, hx, hy, hs, hk⟩ := flat_fwd t (t + 1) le_rfl k s h
  exact ⟨x, y, by omega, hy, hs, hk⟩

theorem shapes_bwd (t x y : Nat) (hx : x ≤ t) (hy : y ≤ t - x) :
    (shapes t)[offR t x + y]? = some ⟨x, y, t - x - y⟩ :=
  flat_bwd t (t + 1) le_rfl x y (by omega) hy

theorem shapes_length (t : Nat) : (shapes t).length = offR t (t + 1) := flat_length t (t + 1) le_rfl

theorem mem_shapes (t : Nat) (s : Shape) (h : s ∈ shapes t) :
    ∃ x y, x ≤ t ∧ y ≤ t - x ∧ s = ⟨x, y, t - x - y⟩ := by
  simp only [shapes, List.mem_flatMap, List.mem_range, List.mem_map] at h
  obtain ⟨x, hx, y, hy, rfl⟩ := h
  exact ⟨x, y, by omega, by omega, rfl⟩

/-! ### Masses -/

theorem massAt_valid (data : SplitRow) (x y : Nat) (hx : x ≤ data.childTotal) (hy : y ≤ data.childTotal - x) :
    data.massAt ⟨x, y, data.childTotal - x - y⟩ = data.row.atColumn (offR data.childTotal x + y) := by
  unfold SplitRow.massAt DyadicRow.atColumn
  congr 1
  apply List.map_congr_left
  intro e _
  by_cases he : e.1 = offR data.childTotal x + y
  · rw [if_pos (by rw [he]; exact shapes_bwd _ x y hx hy), if_pos he]
  · rw [if_neg he, if_neg]
    intro h
    obtain ⟨x', y', _, _, hs, hk⟩ := shapes_fwd _ _ _ h
    simp only [Shape.mk.injEq] at hs
    exact he (by rw [hk, ← hs.1, ← hs.2.1])

theorem massAt_invalid (data : SplitRow) (s : Shape) (hs : s.x + s.y + s.z ≠ data.childTotal) :
    data.massAt s = 0 := by
  unfold SplitRow.massAt
  apply List.sum_eq_zero
  intro v hv
  obtain ⟨e, _, rfl⟩ := List.mem_map.mp hv
  rw [if_neg]
  intro h
  obtain ⟨x', y', hx, hy, hs', _⟩ := shapes_fwd _ _ _ h
  subst hs'
  exact hs (by dsimp only; omega)

end FKLMeta
