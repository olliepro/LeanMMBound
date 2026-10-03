module

public import FKLMeta.Shapes

/-! Raw-`Nat` evaluator for `SplitRow.check` (the per-part `rows_checked` theorems of
`SplitCertificateData`).

The sparse row is scattered once into 48-bit lanes (`FKLBridge.Rows.scatter`); every shape mass is then
one lane read at index `off t x + y`. The complement of a fitting child `⟨x,y,z⟩` is the shape
`⟨px-x, py-y, ·⟩` of the same total; a non-fitting child has a complement of larger total, whose mass is
zero, so its own mass must be zero. -/

@[expose] public section

namespace FKLMeta.SplitFast

open MatrixBounds.Numeric FKLMeta

/-- Every sparse column is below `w`. -/
def boundsOk (w : Nat) (es : List (Nat × Nat)) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun e _ acc => Bool.and (Nat.blt e.1 w) acc) es

/-- Raw total mass. -/
def sumR (es : List (Nat × Nat)) : Nat :=
  List.rec (motive := fun _ => Nat) 0 (fun e _ acc => Nat.add e.2 acc) es

/-- Shape `⟨x, y, t-x-y⟩`: support and complement symmetry, with `P` the scattered row. -/
def cellOk (t px py pz P x y : Nat) : Bool :=
  cond (Bool.and (Nat.ble x px) (Bool.and (Nat.ble y py) (Nat.ble (Nat.sub (Nat.sub t x) y) pz)))
    (Nat.beq (FKL.lane P 48 (Nat.add (off t x) y)) (FKL.lane P 48 (Nat.add (off t (Nat.sub px x)) (Nat.sub py y))))
    (Nat.beq (FKL.lane P 48 (Nat.add (off t x) y)) 0)

/-- All shapes of total `t`. -/
def shapesOk (t px py pz P : Nat) : Bool :=
  allN (fun x => allN (fun y => cellOk t px py pz P x y) (Nat.sub (Nat.add t 1) x)) (Nat.add t 1)

/-- Fast form of `SplitRow.check D`. -/
def rowFast (D : Nat) (row : SplitRow) : Bool :=
  Bool.and (boundsOk row.row.width row.row.entries)
  (Bool.and (Nat.beq (sumR row.row.entries) D)
  (Bool.and (Nat.blt D 281474976710656)
  (Bool.and (Nat.beq row.row.width (off row.childTotal (Nat.add row.childTotal 1)))
  (Bool.and (Nat.beq (Nat.add (Nat.add row.parent.x row.parent.y) row.parent.z) (Nat.mul 2 row.childTotal))
    (shapesOk row.childTotal row.parent.x row.parent.y row.parent.z
      (FKLBridge.Rows.scatter 48 row.row.entries))))))

/-- Fast form of `rows.all (fun row => row.check D)`. -/
def allFast (D : Nat) (rows : List SplitRow) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun r _ acc => Bool.and (rowFast D r) acc) rows

theorem boundsOk_sound (w : Nat) : ∀ es : List (Nat × Nat), boundsOk w es = true → ∀ e ∈ es, e.1 < w := by
  intro es
  induction es with
  | nil => intro _ e he; simp at he
  | cons e es ih =>
    intro h x hx
    have h' : Bool.and (Nat.blt e.1 w) (boundsOk w es) = true := h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h'
    rcases List.mem_cons.mp hx with rfl | hx
    · exact h'.1
    · exact ih h'.2 x hx

theorem sumR_eq : ∀ es : List (Nat × Nat), sumR es = (es.map Prod.snd).sum := by
  intro es
  induction es with
  | nil => rfl
  | cons e es ih =>
    change Nat.add e.2 (sumR es) = _
    rw [FKL.raw_add, ih]; simp

/-- Lane `c` of the scatter is the column mass, once columns are in range and the mass is below `2^48`. -/
theorem lane_scatter (row : DyadicRow) (hsupp : ∀ e ∈ row.entries, e.1 < row.width)
    (hmass : row.mass < 2 ^ 48) (c : Nat) (hc : c < row.width) :
    FKL.lane (FKLBridge.Rows.scatter 48 row.entries) 48 c = row.atColumn c := by
  rw [FKLBridge.Rows.scatter_eq 48 row.width row.entries hsupp]
  exact FKLBridge.Rows.lane_sum 48 row.width (fun j => row.atColumn j)
    (fun j => lt_of_le_of_lt (FKLBridge.Rows.atColumn_le_mass row j) hmass) c hc

theorem rowFast_sound (D : Nat) (row : SplitRow) (h : rowFast D row = true) : row.check D = true := by
  simp only [rowFast, Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq] at h
  obtain ⟨hb, hs, hD, hw, ht, hsh⟩ := h
  simp only [FKL.raw_add, FKL.raw_mul] at hw ht
  have hsupp := boundsOk_sound _ _ hb
  have hmass : row.row.mass = D := by rw [DyadicRow.mass, ← sumR_eq]; exact hs
  rw [off_eq _ _ le_rfl, ← shapes_length] at hw
  have dense : ∀ c, c < row.row.width →
      FKL.lane (FKLBridge.Rows.scatter 48 row.row.entries) 48 c = row.row.atColumn c :=
    lane_scatter row.row hsupp (by rw [hmass]; exact hD)
  -- every shape of total `t` sits at an index below the width
  have idx_lt : ∀ x y, x ≤ row.childTotal → y ≤ row.childTotal - x →
      offR row.childTotal x + y < row.row.width := by
    intro x y hx hy
    have := shapes_bwd row.childTotal x y hx hy
    rw [hw]
    exact (List.getElem?_eq_some_iff.mp this).1
  have mass_eq : ∀ x y, x ≤ row.childTotal → y ≤ row.childTotal - x →
      row.massAt ⟨x, y, row.childTotal - x - y⟩ =
        FKL.lane (FKLBridge.Rows.scatter 48 row.row.entries) 48 (Nat.add (off row.childTotal x) y) := by
    intro x y hx hy
    rw [massAt_valid row x y hx hy, FKL.raw_add, off_eq _ _ (by omega), dense _ (idx_lt x y hx hy)]
  unfold SplitRow.check
  simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true]
  refine ⟨⟨⟨?_, hw⟩, ?_⟩, ?_⟩
  · unfold DyadicRow.check
    simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true]
    exact ⟨hsupp, hmass⟩
  · unfold Shape.total; omega
  · intro child hc
    obtain ⟨x, y, hx, hy, rfl⟩ := mem_shapes _ _ hc
    have hcell := allN_sound _ _ (allN_sound _ _ hsh x (by rw [FKL.raw_add]; omega)) y
      (by rw [FKL.raw_sub, FKL.raw_add]; omega)
    unfold cellOk at hcell
    simp only [FKL.raw_sub] at hcell
    cases hf : (Bool.and (Nat.ble x row.parent.x) (Bool.and (Nat.ble y row.parent.y)
        (Nat.ble (row.childTotal - x - y) row.parent.z))) with
    | true =>
      rw [hf] at hcell
      simp only [cond_true, Nat.beq_eq] at hcell
      simp only [Bool.and_eq_true, Nat.ble_eq] at hf
      obtain ⟨fx, fy, fz⟩ := hf
      have hfit : (⟨x, y, row.childTotal - x - y⟩ : Shape).Fits row.parent := ⟨fx, fy, fz⟩
      have hcomp : row.parent.complement ⟨x, y, row.childTotal - x - y⟩ =
          ⟨row.parent.x - x, row.parent.y - y, row.childTotal - (row.parent.x - x) - (row.parent.y - y)⟩ := by
        have h3 : row.parent.x + row.parent.y + row.parent.z = 2 * row.childTotal := ht
        unfold Shape.complement; dsimp only; congr 1; omega
      refine ⟨Or.inr hfit, ?_⟩
      rw [hcomp, mass_eq x y hx hy, mass_eq _ _ (by omega) (by omega)]
      exact hcell
    | false =>
      rw [hf] at hcell
      simp only [cond_false, Nat.beq_eq] at hcell
      have hnf : ¬ (x ≤ row.parent.x ∧ y ≤ row.parent.y ∧ row.childTotal - x - y ≤ row.parent.z) := by
        intro hh
        have : (Bool.and (Nat.ble x row.parent.x) (Bool.and (Nat.ble y row.parent.y)
            (Nat.ble (row.childTotal - x - y) row.parent.z))) = true := by
          simp only [Bool.and_eq_true, Nat.ble_eq]; exact hh
        rw [hf] at this; exact absurd this (by simp)
      have hzero : row.massAt ⟨x, y, row.childTotal - x - y⟩ = 0 := by rw [mass_eq x y hx hy]; exact hcell
      have hcz : row.massAt (row.parent.complement ⟨x, y, row.childTotal - x - y⟩) = 0 := by
        apply massAt_invalid
        unfold Shape.complement; dsimp only
        omega
      exact ⟨Or.inl hzero, by rw [hzero, hcz]⟩

theorem allFast_sound (D : Nat) : ∀ rows : List SplitRow, allFast D rows = true →
    rows.all (fun row => row.check D) = true := by
  intro rows
  induction rows with
  | nil => intro _; rfl
  | cons r rs ih =>
    intro h
    have h' : Bool.and (rowFast D r) (allFast D rs) = true := h
    simp only [Bool.and_eq_true] at h'
    simp only [List.all_cons, Bool.and_eq_true]
    exact ⟨rowFast_sound D r h'.1, ih h'.2⟩

end FKLMeta.SplitFast
