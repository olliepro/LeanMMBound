module

public import FKLMeta.Walk
public import FKLMeta.Shapes
public import FKL.Lane
public import Mathlib.Data.Fintype.Sum
public import Mathlib.Data.Fintype.Card

/-! Bijectivity of a finite classification `Fin N → Fin m ⊕ Fin n` from a packed code table and a packed
inverse table. -/

@[expose] public section

namespace FKLMeta.Kinds

/-- `inl z ↦ z`, `inr p ↦ m + p`. -/
def codeOf {m n : ℕ} (v : Fin m ⊕ Fin n) : ℕ := Sum.elim (fun z => z.val) (fun p => Nat.add m p.val) v

theorem codeOf_lt {m n : ℕ} (v : Fin m ⊕ Fin n) : codeOf v < m + n := by
  cases v with
  | inl z => simp only [codeOf, Sum.elim_inl]; omega
  | inr p => simp only [codeOf, Sum.elim_inr, FKL.raw_add]; omega

theorem codeOf_inj {m n : ℕ} (v w : Fin m ⊕ Fin n) (h : codeOf v = codeOf w) : v = w := by
  cases v with
  | inl z =>
    cases w with
    | inl z' => simp only [codeOf, Sum.elim_inl] at h; rw [Fin.ext h]
    | inr p' => simp only [codeOf, Sum.elim_inl, Sum.elim_inr, FKL.raw_add] at h; omega
  | inr p =>
    cases w with
    | inl z' => simp only [codeOf, Sum.elim_inl, Sum.elim_inr, FKL.raw_add] at h; omega
    | inr p' => simp only [codeOf, Sum.elim_inr, FKL.raw_add] at h; rw [Fin.ext (by omega : p.val = p'.val)]

theorem code_of_walk {m n : ℕ} (arr : Array (Fin m ⊕ Fin n)) (K : ℕ)
    (h : FKLMeta.walk (fun i v => Nat.beq (codeOf v) (FKL.lane K 8 i)) arr.toList 0 = true)
    (c : ℕ) (hc : c < arr.size) : codeOf arr[c] = FKL.lane K 8 c := by
  have hc' : c < arr.toList.length := by rw [Array.length_toList]; exact hc
  have e := Nat.eq_of_beq_eq_true (FKLMeta.walk_sound _ _ 0 h c hc')
  rw [Nat.zero_add] at e
  rw [← Array.getElem_toList hc']; exact e

theorem bijective_of_codes {m n N : ℕ} (hN : N = m + n) (f : Fin N → Fin m ⊕ Fin n) (K INV : ℕ)
    (hK : ∀ c : Fin N, codeOf (f c) = FKL.lane K 8 c.val)
    (hinv : FKLMeta.allN (fun v => Bool.and (Nat.blt (FKL.lane INV 8 v) N)
      (Nat.beq (FKL.lane K 8 (FKL.lane INV 8 v)) v)) N = true) :
    Function.Bijective f := by
  have hs : Function.Surjective f := by
    intro y
    have hy : codeOf y < N := by rw [hN]; exact codeOf_lt y
    have e := FKLMeta.allN_sound _ _ hinv (codeOf y) hy
    simp only [Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at e
    refine ⟨⟨FKL.lane INV 8 (codeOf y), e.1⟩, codeOf_inj _ _ ?_⟩
    rw [hK]; exact e.2
  refine (Fintype.bijective_iff_surjective_and_card f).mpr ⟨hs, ?_⟩
  simp [hN]

end FKLMeta.Kinds
