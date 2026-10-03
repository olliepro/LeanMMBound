module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange07_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 665 5 = true := by decide +kernel
theorem leafRange07_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 670 5 = true := by decide +kernel
theorem leafRange07_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 675 5 = true := by decide +kernel
theorem leafRange07_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 680 5 = true := by decide +kernel
theorem leafRange07_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 685 5 = true := by decide +kernel
theorem leafRange07_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 690 5 = true := by decide +kernel
theorem leafRange07_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 695 5 = true := by decide +kernel
theorem leafRange07_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 700 5 = true := by decide +kernel
theorem leafRange07_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 705 5 = true := by decide +kernel
theorem leafRange07_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 710 5 = true := by decide +kernel
theorem leafRange07_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 715 5 = true := by decide +kernel
theorem leafRange07_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 720 5 = true := by decide +kernel
theorem leafRange07_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 725 5 = true := by decide +kernel
theorem leafRange07_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 730 5 = true := by decide +kernel
theorem leafRange07_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 735 5 = true := by decide +kernel
theorem leafRange07_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 740 5 = true := by decide +kernel
theorem leafRange07_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 745 5 = true := by decide +kernel
theorem leafRange07_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 750 5 = true := by decide +kernel
theorem leafRange07_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 755 5 = true := by decide +kernel

theorem leafOK07 : ∀ i < 95, LeafOK (665 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 665 5 leafRange07_00 (i - 0) (by omega); rwa [show 665 + (i - 0) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 670 5 leafRange07_01 (i - 5) (by omega); rwa [show 670 + (i - 5) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 675 5 leafRange07_02 (i - 10) (by omega); rwa [show 675 + (i - 10) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 680 5 leafRange07_03 (i - 15) (by omega); rwa [show 680 + (i - 15) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 685 5 leafRange07_04 (i - 20) (by omega); rwa [show 685 + (i - 20) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 690 5 leafRange07_05 (i - 25) (by omega); rwa [show 690 + (i - 25) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 695 5 leafRange07_06 (i - 30) (by omega); rwa [show 695 + (i - 30) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 700 5 leafRange07_07 (i - 35) (by omega); rwa [show 700 + (i - 35) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 705 5 leafRange07_08 (i - 40) (by omega); rwa [show 705 + (i - 40) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 710 5 leafRange07_09 (i - 45) (by omega); rwa [show 710 + (i - 45) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 715 5 leafRange07_10 (i - 50) (by omega); rwa [show 715 + (i - 50) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 720 5 leafRange07_11 (i - 55) (by omega); rwa [show 720 + (i - 55) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 725 5 leafRange07_12 (i - 60) (by omega); rwa [show 725 + (i - 60) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 730 5 leafRange07_13 (i - 65) (by omega); rwa [show 730 + (i - 65) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 735 5 leafRange07_14 (i - 70) (by omega); rwa [show 735 + (i - 70) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 740 5 leafRange07_15 (i - 75) (by omega); rwa [show 740 + (i - 75) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 745 5 leafRange07_16 (i - 80) (by omega); rwa [show 745 + (i - 80) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 750 5 leafRange07_17 (i - 85) (by omega); rwa [show 750 + (i - 85) = 665 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 755 5 leafRange07_18 (i - 90) (by omega); rwa [show 755 + (i - 90) = 665 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
