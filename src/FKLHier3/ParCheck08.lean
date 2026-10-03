module

public import FKLHier3.Par

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem parRange08_00 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 760 5 = true := by decide +kernel
theorem parRange08_01 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 765 5 = true := by decide +kernel
theorem parRange08_02 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 770 5 = true := by decide +kernel
theorem parRange08_03 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 775 5 = true := by decide +kernel
theorem parRange08_04 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 780 5 = true := by decide +kernel
theorem parRange08_05 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 785 5 = true := by decide +kernel
theorem parRange08_06 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 790 5 = true := by decide +kernel
theorem parRange08_07 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 795 5 = true := by decide +kernel
theorem parRange08_08 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 800 5 = true := by decide +kernel
theorem parRange08_09 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 805 5 = true := by decide +kernel
theorem parRange08_10 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 810 5 = true := by decide +kernel
theorem parRange08_11 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 815 5 = true := by decide +kernel
theorem parRange08_12 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 820 5 = true := by decide +kernel
theorem parRange08_13 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 825 5 = true := by decide +kernel
theorem parRange08_14 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 830 5 = true := by decide +kernel
theorem parRange08_15 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 835 5 = true := by decide +kernel
theorem parRange08_16 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 840 5 = true := by decide +kernel
theorem parRange08_17 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 845 5 = true := by decide +kernel
theorem parRange08_18 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 850 5 = true := by decide +kernel

theorem parOK08 : ∀ i < 95, ParOK (760 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := parOK_of_range 3 760 5 parRange08_00 (i - 0) (by omega); rwa [show 760 + (i - 0) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 765 5 parRange08_01 (i - 5) (by omega); rwa [show 765 + (i - 5) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 770 5 parRange08_02 (i - 10) (by omega); rwa [show 770 + (i - 10) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 775 5 parRange08_03 (i - 15) (by omega); rwa [show 775 + (i - 15) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 780 5 parRange08_04 (i - 20) (by omega); rwa [show 780 + (i - 20) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 785 5 parRange08_05 (i - 25) (by omega); rwa [show 785 + (i - 25) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 790 5 parRange08_06 (i - 30) (by omega); rwa [show 790 + (i - 30) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 795 5 parRange08_07 (i - 35) (by omega); rwa [show 795 + (i - 35) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 800 5 parRange08_08 (i - 40) (by omega); rwa [show 800 + (i - 40) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 805 5 parRange08_09 (i - 45) (by omega); rwa [show 805 + (i - 45) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 810 5 parRange08_10 (i - 50) (by omega); rwa [show 810 + (i - 50) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 815 5 parRange08_11 (i - 55) (by omega); rwa [show 815 + (i - 55) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 820 5 parRange08_12 (i - 60) (by omega); rwa [show 820 + (i - 60) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 825 5 parRange08_13 (i - 65) (by omega); rwa [show 825 + (i - 65) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 830 5 parRange08_14 (i - 70) (by omega); rwa [show 830 + (i - 70) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 835 5 parRange08_15 (i - 75) (by omega); rwa [show 835 + (i - 75) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 840 5 parRange08_16 (i - 80) (by omega); rwa [show 840 + (i - 80) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 845 5 parRange08_17 (i - 85) (by omega); rwa [show 845 + (i - 85) = 760 + i by omega] at this)
  · exact (by have := parOK_of_range 3 850 5 parRange08_18 (i - 90) (by omega); rwa [show 850 + (i - 90) = 760 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
