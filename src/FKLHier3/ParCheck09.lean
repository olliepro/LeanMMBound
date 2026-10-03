module

public import FKLHier3.Par

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem parRange09_00 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 855 5 = true := by decide +kernel
theorem parRange09_01 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 860 5 = true := by decide +kernel
theorem parRange09_02 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 865 5 = true := by decide +kernel
theorem parRange09_03 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 870 5 = true := by decide +kernel
theorem parRange09_04 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 875 5 = true := by decide +kernel
theorem parRange09_05 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 880 5 = true := by decide +kernel
theorem parRange09_06 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 885 5 = true := by decide +kernel
theorem parRange09_07 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 890 5 = true := by decide +kernel
theorem parRange09_08 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 895 5 = true := by decide +kernel
theorem parRange09_09 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 900 5 = true := by decide +kernel
theorem parRange09_10 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 905 5 = true := by decide +kernel
theorem parRange09_11 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 910 5 = true := by decide +kernel
theorem parRange09_12 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 915 5 = true := by decide +kernel
theorem parRange09_13 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 920 5 = true := by decide +kernel
theorem parRange09_14 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 925 5 = true := by decide +kernel
theorem parRange09_15 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 930 5 = true := by decide +kernel
theorem parRange09_16 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 935 5 = true := by decide +kernel
theorem parRange09_17 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 940 5 = true := by decide +kernel

theorem parOK09 : ∀ i < 90, ParOK (855 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := parOK_of_range 3 855 5 parRange09_00 (i - 0) (by omega); rwa [show 855 + (i - 0) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 860 5 parRange09_01 (i - 5) (by omega); rwa [show 860 + (i - 5) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 865 5 parRange09_02 (i - 10) (by omega); rwa [show 865 + (i - 10) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 870 5 parRange09_03 (i - 15) (by omega); rwa [show 870 + (i - 15) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 875 5 parRange09_04 (i - 20) (by omega); rwa [show 875 + (i - 20) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 880 5 parRange09_05 (i - 25) (by omega); rwa [show 880 + (i - 25) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 885 5 parRange09_06 (i - 30) (by omega); rwa [show 885 + (i - 30) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 890 5 parRange09_07 (i - 35) (by omega); rwa [show 890 + (i - 35) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 895 5 parRange09_08 (i - 40) (by omega); rwa [show 895 + (i - 40) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 900 5 parRange09_09 (i - 45) (by omega); rwa [show 900 + (i - 45) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 905 5 parRange09_10 (i - 50) (by omega); rwa [show 905 + (i - 50) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 910 5 parRange09_11 (i - 55) (by omega); rwa [show 910 + (i - 55) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 915 5 parRange09_12 (i - 60) (by omega); rwa [show 915 + (i - 60) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 920 5 parRange09_13 (i - 65) (by omega); rwa [show 920 + (i - 65) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 925 5 parRange09_14 (i - 70) (by omega); rwa [show 925 + (i - 70) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 930 5 parRange09_15 (i - 75) (by omega); rwa [show 930 + (i - 75) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 935 5 parRange09_16 (i - 80) (by omega); rwa [show 935 + (i - 80) = 855 + i by omega] at this)
  · exact (by have := parOK_of_range 3 940 5 parRange09_17 (i - 85) (by omega); rwa [show 940 + (i - 85) = 855 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
