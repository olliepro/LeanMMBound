module

public import Mathlib.Tactic.NormNum

/-! Linear walks over literal row lists with their global index. -/

@[expose] public section

namespace FKLMeta

/-- `f (i + j) l[j] = true` for every position `j` of `l`. -/
def walk {α : Type} (f : Nat → α → Bool) (l : List α) : Nat → Bool :=
  List.rec (motive := fun _ => Nat → Bool) (fun _ => true)
    (fun a _ rec i => Bool.and (f i a) (rec (Nat.succ i))) l

theorem walk_sound {α : Type} (f : Nat → α → Bool) : ∀ (l : List α) (i : Nat), walk f l i = true →
    ∀ j (hj : j < l.length), f (i + j) l[j] = true := by
  intro l
  induction l with
  | nil => intro i _ j hj; simp at hj
  | cons a l ih =>
    intro i h j hj
    change Bool.and (f i a) (walk f l (Nat.succ i)) = true at h
    simp only [Bool.and_eq_true] at h
    rcases j with _ | j
    · simpa using h.1
    · have := ih (Nat.succ i) h.2 j (by simpa using hj)
      rw [show i + (j + 1) = Nat.succ i + j by omega]
      simpa using this

end FKLMeta
