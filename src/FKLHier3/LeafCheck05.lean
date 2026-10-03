module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange05_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 475 5 = true := by decide +kernel
theorem leafRange05_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 480 5 = true := by decide +kernel
theorem leafRange05_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 485 5 = true := by decide +kernel
theorem leafRange05_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 490 5 = true := by decide +kernel
theorem leafRange05_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 495 5 = true := by decide +kernel
theorem leafRange05_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 500 5 = true := by decide +kernel
theorem leafRange05_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 505 5 = true := by decide +kernel
theorem leafRange05_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 510 5 = true := by decide +kernel
theorem leafRange05_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 515 5 = true := by decide +kernel
theorem leafRange05_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 520 5 = true := by decide +kernel
theorem leafRange05_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 525 5 = true := by decide +kernel
theorem leafRange05_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 530 5 = true := by decide +kernel
theorem leafRange05_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 535 5 = true := by decide +kernel
theorem leafRange05_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 540 5 = true := by decide +kernel
theorem leafRange05_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 545 5 = true := by decide +kernel
theorem leafRange05_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 550 5 = true := by decide +kernel
theorem leafRange05_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 555 5 = true := by decide +kernel
theorem leafRange05_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 560 5 = true := by decide +kernel
theorem leafRange05_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 565 5 = true := by decide +kernel

theorem leafOK05 : ∀ i < 95, LeafOK (475 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 475 5 leafRange05_00 (i - 0) (by omega); rwa [show 475 + (i - 0) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 480 5 leafRange05_01 (i - 5) (by omega); rwa [show 480 + (i - 5) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 485 5 leafRange05_02 (i - 10) (by omega); rwa [show 485 + (i - 10) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 490 5 leafRange05_03 (i - 15) (by omega); rwa [show 490 + (i - 15) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 495 5 leafRange05_04 (i - 20) (by omega); rwa [show 495 + (i - 20) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 500 5 leafRange05_05 (i - 25) (by omega); rwa [show 500 + (i - 25) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 505 5 leafRange05_06 (i - 30) (by omega); rwa [show 505 + (i - 30) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 510 5 leafRange05_07 (i - 35) (by omega); rwa [show 510 + (i - 35) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 515 5 leafRange05_08 (i - 40) (by omega); rwa [show 515 + (i - 40) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 520 5 leafRange05_09 (i - 45) (by omega); rwa [show 520 + (i - 45) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 525 5 leafRange05_10 (i - 50) (by omega); rwa [show 525 + (i - 50) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 530 5 leafRange05_11 (i - 55) (by omega); rwa [show 530 + (i - 55) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 535 5 leafRange05_12 (i - 60) (by omega); rwa [show 535 + (i - 60) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 540 5 leafRange05_13 (i - 65) (by omega); rwa [show 540 + (i - 65) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 545 5 leafRange05_14 (i - 70) (by omega); rwa [show 545 + (i - 70) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 550 5 leafRange05_15 (i - 75) (by omega); rwa [show 550 + (i - 75) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 555 5 leafRange05_16 (i - 80) (by omega); rwa [show 555 + (i - 80) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 560 5 leafRange05_17 (i - 85) (by omega); rwa [show 560 + (i - 85) = 475 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 565 5 leafRange05_18 (i - 90) (by omega); rwa [show 565 + (i - 90) = 475 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
