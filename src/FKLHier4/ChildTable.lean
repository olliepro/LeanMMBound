module

public import FKLHier4.Child
public import FKLHier4.ChildTree

/-! The packed level-four child table, verified per parent against `fChild`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL FKLHier3 FKLFine3 Tensor Tensor.CW
open scoped BigOperators

/-- Table read of the child numerator (axis slice, column slice, orbit lane). -/
noncomputable def childT (p c a o : ℕ) : ℕ := lane (lane (lane (childTree.get p) 170100 a) 3780 c) 180 o

/-- Per-parent kernel check: the chunk is the recomputed packed vector. -/
noncomputable def childChk (p : ℕ) : Bool := Nat.beq (childTree.get p) (childPack p)

def ChildOK (p : ℕ) : Prop := childChk p = true

theorem childOK_of_range (d lo len : ℕ) (h : allRange childChk d lo len = true) :
    ∀ i < len, ChildOK (lo + i) := fun i hi => allRange_sound _ d lo len h i hi

theorem fChild_lt (p : Fin 105) (c a o : ℕ) (hc : c < 45) (ha : a < 3) (ho : o < 21) :
    fChild p c a o < 2 ^ 180 :=
  lt_of_le_of_lt (fChild_le p ⟨c, hc⟩ a ha o ho) (by norm_num)

theorem colPack_lt (p : Fin 105) (a : ℕ) (ha : a < 3) (c : ℕ) (hc : c < 45) :
    packN 180 21 (fun o => fChild p c a o) < 2 ^ 3780 :=
  lt_of_lt_of_eq (packN_lt 180 21 _ (fun o ho => fChild_lt p c a o hc ha ho)) (congrArg (2 ^ ·) (by norm_num))

theorem axPack_lt (p : Fin 105) (a : ℕ) (ha : a < 3) :
    packN 3780 45 (fun c => packN 180 21 (fun o => fChild p c a o)) < 2 ^ 170100 :=
  lt_of_lt_of_eq (packN_lt 3780 45 _ (fun c hc => colPack_lt p a ha c hc)) (congrArg (2 ^ ·) (by norm_num))

theorem childT_eq (p : Fin 105) (h : ChildOK p) (c a o : ℕ) (hc : c < 45) (ha : a < 3) (ho : o < 21) :
    childT p c a o = fChild p c a o := by
  have hg : childTree.get p = childPack p := Nat.eq_of_beq_eq_true h
  unfold childT
  rw [hg, childPack, lane_packN _ _ _ (fun a ha => axPack_lt p a ha) a ha,
    lane_packN _ _ _ (fun c hc => colPack_lt p a ha c hc) c hc,
    lane_packN _ _ _ (fun o ho => fChild_lt p c a o hc ha ho) o ho]

end MatrixBounds.Numeric.FKLHier4
