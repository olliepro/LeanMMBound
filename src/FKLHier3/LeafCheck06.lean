module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange06_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 570 5 = true := by decide +kernel
theorem leafRange06_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 575 5 = true := by decide +kernel
theorem leafRange06_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 580 5 = true := by decide +kernel
theorem leafRange06_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 585 5 = true := by decide +kernel
theorem leafRange06_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 590 5 = true := by decide +kernel
theorem leafRange06_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 595 5 = true := by decide +kernel
theorem leafRange06_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 600 5 = true := by decide +kernel
theorem leafRange06_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 605 5 = true := by decide +kernel
theorem leafRange06_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 610 5 = true := by decide +kernel
theorem leafRange06_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 615 5 = true := by decide +kernel
theorem leafRange06_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 620 5 = true := by decide +kernel
theorem leafRange06_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 625 5 = true := by decide +kernel
theorem leafRange06_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 630 5 = true := by decide +kernel
theorem leafRange06_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 635 5 = true := by decide +kernel
theorem leafRange06_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 640 5 = true := by decide +kernel
theorem leafRange06_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 645 5 = true := by decide +kernel
theorem leafRange06_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 650 5 = true := by decide +kernel
theorem leafRange06_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 655 5 = true := by decide +kernel
theorem leafRange06_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 660 5 = true := by decide +kernel

theorem leafOK06 : ∀ i < 95, LeafOK (570 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 570 5 leafRange06_00 (i - 0) (by omega); rwa [show 570 + (i - 0) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 575 5 leafRange06_01 (i - 5) (by omega); rwa [show 575 + (i - 5) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 580 5 leafRange06_02 (i - 10) (by omega); rwa [show 580 + (i - 10) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 585 5 leafRange06_03 (i - 15) (by omega); rwa [show 585 + (i - 15) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 590 5 leafRange06_04 (i - 20) (by omega); rwa [show 590 + (i - 20) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 595 5 leafRange06_05 (i - 25) (by omega); rwa [show 595 + (i - 25) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 600 5 leafRange06_06 (i - 30) (by omega); rwa [show 600 + (i - 30) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 605 5 leafRange06_07 (i - 35) (by omega); rwa [show 605 + (i - 35) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 610 5 leafRange06_08 (i - 40) (by omega); rwa [show 610 + (i - 40) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 615 5 leafRange06_09 (i - 45) (by omega); rwa [show 615 + (i - 45) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 620 5 leafRange06_10 (i - 50) (by omega); rwa [show 620 + (i - 50) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 625 5 leafRange06_11 (i - 55) (by omega); rwa [show 625 + (i - 55) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 630 5 leafRange06_12 (i - 60) (by omega); rwa [show 630 + (i - 60) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 635 5 leafRange06_13 (i - 65) (by omega); rwa [show 635 + (i - 65) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 640 5 leafRange06_14 (i - 70) (by omega); rwa [show 640 + (i - 70) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 645 5 leafRange06_15 (i - 75) (by omega); rwa [show 645 + (i - 75) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 650 5 leafRange06_16 (i - 80) (by omega); rwa [show 650 + (i - 80) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 655 5 leafRange06_17 (i - 85) (by omega); rwa [show 655 + (i - 85) = 570 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 660 5 leafRange06_18 (i - 90) (by omega); rwa [show 660 + (i - 90) = 570 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
