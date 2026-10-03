module

public import FKLCert.Term
public import FKL.Table
public import TerminalSourceNodeLookup

/-! Packed raw certificate tables linked to `SourceTable IntegerLogTerm` slices.

Raw lane layout (width `KW + MW + 1`): key in bits `[0, KW)`, magnitude in `[KW, KW+MW)`, sign at `KW+MW`.
The global raw table is an `FKL.Tree` of chunks of 64 lanes. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCert

open FKL TerminalSourceNodeLookup

/-- Decode one packed raw term. -/
def decode (KW MW x : Nat) : Raw :=
  ⟨Nat.land x (Nat.sub (Nat.shiftLeft 1 KW) 1),
   Nat.land (Nat.shiftRight x KW) (Nat.sub (Nat.shiftLeft 1 MW) 1),
   Nat.beq (Nat.land (Nat.shiftRight x (Nat.add KW MW)) 1) 1⟩

/-- Raw equality test of two raw terms. -/
def rawBeq (a b : Raw) : Bool := Bool.and (Nat.beq a.key b.key) (Bool.and (Nat.beq a.mag b.mag) (a.neg == b.neg))

theorem rawBeq_eq (a b : Raw) (h : rawBeq a b = true) : a = b := by
  cases a; cases b
  simp only [rawBeq, Bool.and_eq_true, Nat.beq_eq, beq_iff_eq] at h
  obtain ⟨h1, h2, h3⟩ := h
  subst h1 h2 h3; rfl

/-- Compare a packed chunk lane by lane with the decodings of a list of certificate records. -/
noncomputable def chunkRawEq (S T KW MW : Nat) (d : Nat) (l : List IntegerLogTerm) : Bool :=
  List.rec (motive := fun _ => Nat → Bool) (fun _ => true)
    (fun e _ rec d => Bool.and (rawBeq (decode KW MW (Nat.land d (Nat.sub (Nat.shiftLeft 1 (Nat.add (Nat.add KW MW) 1)) 1)))
        (rawOf S T e)) (Bool.and (exact S T e) (rec (Nat.shiftRight d (Nat.add (Nat.add KW MW) 1))))) l d

theorem chunkRawEq_cons (S T KW MW d : Nat) (e : IntegerLogTerm) (l : List IntegerLogTerm) :
    chunkRawEq S T KW MW d (e :: l) =
      Bool.and (rawBeq (decode KW MW (Nat.land d (Nat.sub (Nat.shiftLeft 1 (Nat.add (Nat.add KW MW) 1)) 1)))
        (rawOf S T e)) (Bool.and (exact S T e) (chunkRawEq S T KW MW (Nat.shiftRight d (Nat.add (Nat.add KW MW) 1)) l)) := rfl

theorem chunkRawEq_sound (S T KW MW : Nat) (l : List IntegerLogTerm) : ∀ d, chunkRawEq S T KW MW d l = true →
    ∀ j (hj : j < l.length), decode KW MW (lane d (KW + MW + 1) j) = rawOf S T l[j] ∧ exact S T l[j] = true := by
  induction l with
  | nil => intro d _ j hj; simp at hj
  | cons e l ih =>
    intro d h j hj
    rw [chunkRawEq_cons] at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨h1, h2, h3⟩ := h
    rcases j with _ | j
    · refine ⟨?_, h2⟩
      have := rawBeq_eq _ _ h1
      simpa [lane, raw_add] using this
    · have := ih _ h3 j (by simpa using hj)
      simp only [List.getElem_cons_succ]
      refine ⟨?_, this.2⟩
      rw [← this.1, lane_eq, lane_eq]
      congr 1
      rw [raw_shiftRight, Nat.shiftRight_eq_div_pow, Nat.div_div_eq_div_mul, ← pow_add]
      simp only [raw_add]
      congr 2
      ring

/-- Raw `List.drop`. -/
noncomputable def dropR {A : Type} (n : Nat) (l : List A) : List A :=
  Nat.rec (motive := fun _ => List A → List A) (fun l => l)
    (fun _ rec l => rec (List.rec (motive := fun _ => List A) [] (fun _ t _ => t) l)) n l

/-- Raw `List.take`. -/
noncomputable def takeR {A : Type} (n : Nat) (l : List A) : List A :=
  Nat.rec (motive := fun _ => List A → List A) (fun _ => [])
    (fun _ rec l => List.rec (motive := fun _ => List A) [] (fun x t _ => x :: rec t) l) n l

theorem dropR_eq {A : Type} : ∀ (n : Nat) (l : List A), dropR n l = l.drop n
  | 0, l => rfl
  | n + 1, [] => by
    show dropR n [] = _
    rw [dropR_eq n []]; simp
  | n + 1, x :: l => by
    show dropR n l = _
    rw [dropR_eq n l]; simp

theorem takeR_eq {A : Type} : ∀ (n : Nat) (l : List A), takeR n l = l.take n
  | 0, l => rfl
  | n + 1, [] => rfl
  | n + 1, x :: l => by
    show x :: takeR n l = _
    rw [takeR_eq n l]; simp

/-- All 64-lane sub-chunks of one certificate part: chunk `base + s` holds records `64 s … 64 s + 63`. -/
noncomputable def partRawEq (S T KW MW : Nat) (tree : Tree) (base nsub : Nat) (l : List IntegerLogTerm) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun s rec => Bool.and rec (chunkRawEq S T KW MW (tree.get (Nat.add base s))
      (takeR 64 (dropR (Nat.mul 64 s) l)))) nsub

/-- The global raw table entry `i`. -/
noncomputable def fastRaw (tree : Tree) (KW MW i : Nat) : Raw := decode KW MW (ptGet tree 6 (KW + MW + 1) i)

theorem partRawEq_sound (S T KW MW : Nat) (tree : Tree) (base : Nat) (l : List IntegerLogTerm) :
    ∀ nsub, partRawEq S T KW MW tree base nsub l = true → ∀ j (hj : j < l.length), j < 64 * nsub →
      fastRaw tree KW MW (64 * base + j) = rawOf S T l[j] ∧ exact S T l[j] = true := by
  intro nsub
  induction nsub with
  | zero => intro _ j _ hj'; omega
  | succ n ih =>
    intro h j hj hjn
    have h' : partRawEq S T KW MW tree base n l = true ∧
        chunkRawEq S T KW MW (tree.get (base + n)) (takeR 64 (dropR (64 * n) l)) = true := by
      simpa [partRawEq, raw_add, raw_mul] using h
    by_cases hlt : j < 64 * n
    · exact ih h'.1 j hj hlt
    · have hjr : j - 64 * n < 64 := by omega
      have hlen : j - 64 * n < (takeR 64 (dropR (64 * n) l)).length := by
        rw [takeR_eq, dropR_eq]; simp; omega
      have := chunkRawEq_sound S T KW MW _ _ h'.2 (j - 64 * n) hlen
      have hget : (takeR 64 (dropR (64 * n) l))[j - 64 * n] = l[j] := by
        simp only [takeR_eq, dropR_eq, List.getElem_take, List.getElem_drop]
        congr 1; omega
      rw [hget] at this
      refine ⟨?_, this.2⟩
      rw [fastRaw, ptGet_eq, ← this.1]
      have hdiv : (64 * base + j) / 2 ^ 6 = base + n := by
        rw [show (2 : ℕ) ^ 6 = 64 by norm_num]; omega
      have hmod : (64 * base + j) % 2 ^ 6 = j - 64 * n := by
        rw [show (2 : ℕ) ^ 6 = 64 by norm_num]; omega
      rw [hdiv, hmod]

/-- A certificate source table read by the global raw table from offset `off`. -/
def RawReads (S T KW MW : Nat) (tree : Tree) {count : Nat} (t : SourceTable IntegerLogTerm count) (off : Nat) : Prop :=
  ∀ i : Fin count, fastRaw tree KW MW (off + i.val) = rawOf S T (t.lookup i) ∧ exact S T (t.lookup i) = true

theorem rawReads_ofList (S T KW MW : Nat) (tree : Tree) {count : Nat} (l : List IntegerLogTerm)
    (hl : l.length = count) (base nsub : Nat) (hn : count ≤ 64 * nsub)
    (h : partRawEq S T KW MW tree base nsub l = true) :
    RawReads S T KW MW tree (SourceTable.ofList l hl) (64 * base) := by
  intro i
  have hi : i.val < l.length := by rw [hl]; exact i.isLt
  exact partRawEq_sound S T KW MW tree base l nsub h i.val hi (by omega)

theorem rawReads_append (S T KW MW : Nat) (tree : Tree) {left right : Nat}
    (A : SourceTable IntegerLogTerm left) (B : SourceTable IntegerLogTerm right) (off : Nat)
    (hA : RawReads S T KW MW tree A off) (hB : RawReads S T KW MW tree B (off + left)) :
    RawReads S T KW MW tree (A.append B) off := by
  intro i
  have hlook := (A.append B).lookup_eq i
  by_cases hlt : i.val < left
  · have := hA ⟨i.val, hlt⟩
    have e : (A.append B).lookup i = A.lookup ⟨i.val, hlt⟩ := by
      simp only [SourceTable.append, dif_pos hlt]
    rw [e]; exact this
  · have hr : i.val - left < right := by have := i.isLt; omega
    have := hB ⟨i.val - left, hr⟩
    have e : (A.append B).lookup i = B.lookup ⟨i.val - left, hr⟩ := by
      simp only [SourceTable.append, dif_neg hlt]
    rw [e]
    have ho : off + left + (i.val - left) = off + i.val := by omega
    simpa [ho] using this

end MatrixBounds.Numeric.FKLCert
