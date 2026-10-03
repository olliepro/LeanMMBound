module

public import DyadicData
public import GibbsData

/-! Raw-`Nat` evaluators for `DyadicRow.check` and `GibbsRow.check` over literal row lists
(the `rows_checked` theorems of `CertificateData.Part###` and `GibbsCertificateData.Part###`). -/

@[expose] public section

namespace FKLMeta.RowFast

open MatrixBounds.Numeric

/-- Columns below `w` and total mass `D`, in one pass (`acc` is the running mass). -/
def dyEntries (w : Nat) (es : List (Nat × Nat)) : Nat → Nat → Bool :=
  List.rec (motive := fun _ => Nat → Nat → Bool) (fun D acc => Nat.beq acc D)
    (fun e _ rec D acc => Bool.and (Nat.blt e.1 w) (rec D (Nat.add acc e.2))) es

theorem dyEntries_sound (w : Nat) : ∀ (es : List (Nat × Nat)) (D acc : Nat), dyEntries w es D acc = true →
    (∀ e ∈ es, e.1 < w) ∧ acc + (es.map Prod.snd).sum = D := by
  intro es
  induction es with
  | nil => intro D acc h; exact ⟨fun e he => by simp at he, by simpa [dyEntries] using h⟩
  | cons e es ih =>
    intro D acc h
    change Bool.and (Nat.blt e.1 w) (dyEntries w es D (Nat.add acc e.2)) = true at h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨hb, hr⟩ := ih D _ h.2
    refine ⟨fun x hx => ?_, ?_⟩
    · rcases List.mem_cons.mp hx with rfl | hx
      · exact h.1
      · exact hb x hx
    · simp only [List.map_cons, List.sum_cons]
      have : Nat.add acc e.2 = acc + e.2 := rfl
      omega

/-- Fast form of `rows.all (fun row => row.check D)`. -/
def dyAll (D : Nat) (rows : List DyadicRow) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun r _ acc => Bool.and (dyEntries r.width r.entries D 0) acc) rows

theorem dyAll_sound (D : Nat) : ∀ rows : List DyadicRow, dyAll D rows = true → rows.all (fun row => row.check D) = true := by
  intro rows
  induction rows with
  | nil => intro _; rfl
  | cons r rs ih =>
    intro h
    change Bool.and (dyEntries r.width r.entries D 0) (dyAll D rs) = true at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨hb, hs⟩ := dyEntries_sound _ _ _ _ h.1
    simp only [List.all_cons, Bool.and_eq_true]
    refine ⟨?_, ih h.2⟩
    unfold DyadicRow.check DyadicRow.mass
    simp only [Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq]
    exact ⟨hb, by omega⟩

/-- Every numerator is positive. -/
def giEntries (es : List BinaryRational) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun e _ acc => Bool.and (Nat.blt 0 e.numerator) acc) es

theorem giEntries_sound : ∀ es : List BinaryRational, giEntries es = true →
    es.all (fun entry => decide (0 < entry.numerator)) = true := by
  intro es
  induction es with
  | nil => intro _; rfl
  | cons e es ih =>
    intro h
    change Bool.and (Nat.blt 0 e.numerator) (giEntries es) = true at h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h
    simp only [List.all_cons, Bool.and_eq_true, decide_eq_true_eq]
    exact ⟨h.1, ih h.2⟩

/-- Fast form of `rows.all GibbsRow.check`. -/
def giAll (rows : List GibbsRow) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun r _ acc => Bool.and (giEntries r.entries) acc) rows

theorem giAll_sound : ∀ rows : List GibbsRow, giAll rows = true → rows.all GibbsRow.check = true := by
  intro rows
  induction rows with
  | nil => intro _; rfl
  | cons r rs ih =>
    intro h
    change Bool.and (giEntries r.entries) (giAll rs) = true at h
    simp only [Bool.and_eq_true] at h
    simp only [List.all_cons, Bool.and_eq_true]
    exact ⟨giEntries_sound _ h.1, ih h.2⟩

end FKLMeta.RowFast
