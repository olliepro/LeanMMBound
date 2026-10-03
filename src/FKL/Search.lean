module

public import FKL.Kron

/-! Binary search over a packed ascending key array; used only as the slot function of `kron`
(soundness never depends on its correctness, only on the checked key equality). -/

@[expose] public section

namespace FKL

/-- After `depth` halvings of `[lo, hi)`, the last index whose key is `≤ k`. -/
noncomputable def bsearch (K w k : Nat) (depth : Nat) : Nat → Nat → Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat) (fun lo _ => lo)
    (fun _ rec lo hi => (fun mid => cond (Nat.ble (lane K w mid) k) (rec mid hi) (rec lo mid))
      (Nat.shiftRight (Nat.add lo hi) 1)) depth

/-- The slot function for `nk` packed keys of width `w`. -/
noncomputable def slotOf (K w nk depth : Nat) (k : Nat) : Nat := bsearch K w k depth 0 nk

/-- The complete acceptance test for two raw lists against a packed key array. -/
noncomputable def check2 (L K w nk depth : Nat) (l₁ l₂ : List Raw) : Bool :=
  accepted L (kron L K w nk (slotOf K w nk depth) true l₂ (kron L K w nk (slotOf K w nk depth) false l₁ ⟨0, 0, 0, true⟩))

theorem check2_sound (S T L K w nk depth : Nat) (l₁ l₂ : List Raw) (h : check2 L K w nk depth l₁ l₂ = true) :
    rawValue S T l₁ = rawValue S T l₂ :=
  kron_sound S T L K w nk (slotOf K w nk depth) l₁ l₂ h

end FKL
