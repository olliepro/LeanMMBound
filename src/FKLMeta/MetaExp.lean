module

public import Mathlib.Tactic.NormNum

/-! Raw forms of the row-metadata functions `DyadicRowMetadata.expected`, `GibbsRowMetadata.expected`,
`SplitRowMetadata.expected` (their equality lemmas live in `FKLMeta.ParamMeta` and in the rewritten
metadata files), and a raw list length. -/

@[expose] public section

namespace FKLMeta.MetaExp

theorem cond_blt {α : Type} (i n : ℕ) (a b : α) : cond (Nat.blt i n) a b = if i < n then a else b := by
  by_cases h : i < n
  · rw [if_pos h, show Nat.blt i n = true from Nat.blt_eq.mpr h, cond_true]
  · rw [if_neg h, show Nat.blt i n = false from Bool.eq_false_iff.mpr (fun e => h (Nat.blt_eq.mp e)), cond_false]

theorem cond_beq {α : Type} (i n : ℕ) (a b : α) : cond (Nat.beq i n) a b = if i = n then a else b := by
  by_cases h : i = n
  · rw [if_pos h, show Nat.beq i n = true from Nat.beq_eq.mpr h, cond_true]
  · rw [if_neg h, show Nat.beq i n = false from Bool.eq_false_iff.mpr (fun e => h (Nat.beq_eq.mp e)), cond_false]

def dyExp (i : ℕ) : ℕ :=
  cond (Nat.beq i 0) 1 (cond (Nat.beq i 1) 153 (cond (Nat.blt i 940) 6 (cond (Nat.blt i 6377) 15
    (cond (Nat.blt i 6482) 45 (cond (Nat.blt i 14692) 6 (cond (Nat.blt i 15235) 21 (cond (Nat.blt i 15277) 231
    (cond (Nat.blt i 15279) 3 6))))))))

def giExp (i : ℕ) : ℕ := cond (Nat.blt i 16311) 5 (cond (Nat.blt i 16626) 9 17)

def spExp (i : ℕ) : ℕ := cond (Nat.blt i 5437) 4 8

/-- Raw list length. -/
def lenR {α : Type} (l : List α) : ℕ := List.rec (motive := fun _ => ℕ) 0 (fun _ _ n => Nat.succ n) l

theorem lenR_eq {α : Type} (l : List α) : lenR l = l.length := by
  induction l with
  | nil => rfl
  | cons a l ih => change Nat.succ (lenR l) = _; rw [ih]; rfl

end FKLMeta.MetaExp
