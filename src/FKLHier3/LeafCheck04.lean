module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange04_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 380 5 = true := by decide +kernel
theorem leafRange04_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 385 5 = true := by decide +kernel
theorem leafRange04_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 390 5 = true := by decide +kernel
theorem leafRange04_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 395 5 = true := by decide +kernel
theorem leafRange04_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 400 5 = true := by decide +kernel
theorem leafRange04_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 405 5 = true := by decide +kernel
theorem leafRange04_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 410 5 = true := by decide +kernel
theorem leafRange04_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 415 5 = true := by decide +kernel
theorem leafRange04_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 420 5 = true := by decide +kernel
theorem leafRange04_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 425 5 = true := by decide +kernel
theorem leafRange04_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 430 5 = true := by decide +kernel
theorem leafRange04_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 435 5 = true := by decide +kernel
theorem leafRange04_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 440 5 = true := by decide +kernel
theorem leafRange04_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 445 5 = true := by decide +kernel
theorem leafRange04_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 450 5 = true := by decide +kernel
theorem leafRange04_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 455 5 = true := by decide +kernel
theorem leafRange04_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 460 5 = true := by decide +kernel
theorem leafRange04_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 465 5 = true := by decide +kernel
theorem leafRange04_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 470 5 = true := by decide +kernel

theorem leafOK04 : ∀ i < 95, LeafOK (380 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 380 5 leafRange04_00 (i - 0) (by omega); rwa [show 380 + (i - 0) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 385 5 leafRange04_01 (i - 5) (by omega); rwa [show 385 + (i - 5) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 390 5 leafRange04_02 (i - 10) (by omega); rwa [show 390 + (i - 10) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 395 5 leafRange04_03 (i - 15) (by omega); rwa [show 395 + (i - 15) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 400 5 leafRange04_04 (i - 20) (by omega); rwa [show 400 + (i - 20) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 405 5 leafRange04_05 (i - 25) (by omega); rwa [show 405 + (i - 25) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 410 5 leafRange04_06 (i - 30) (by omega); rwa [show 410 + (i - 30) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 415 5 leafRange04_07 (i - 35) (by omega); rwa [show 415 + (i - 35) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 420 5 leafRange04_08 (i - 40) (by omega); rwa [show 420 + (i - 40) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 425 5 leafRange04_09 (i - 45) (by omega); rwa [show 425 + (i - 45) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 430 5 leafRange04_10 (i - 50) (by omega); rwa [show 430 + (i - 50) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 435 5 leafRange04_11 (i - 55) (by omega); rwa [show 435 + (i - 55) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 440 5 leafRange04_12 (i - 60) (by omega); rwa [show 440 + (i - 60) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 445 5 leafRange04_13 (i - 65) (by omega); rwa [show 445 + (i - 65) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 450 5 leafRange04_14 (i - 70) (by omega); rwa [show 450 + (i - 70) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 455 5 leafRange04_15 (i - 75) (by omega); rwa [show 455 + (i - 75) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 460 5 leafRange04_16 (i - 80) (by omega); rwa [show 460 + (i - 80) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 465 5 leafRange04_17 (i - 85) (by omega); rwa [show 465 + (i - 85) = 380 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 470 5 leafRange04_18 (i - 90) (by omega); rwa [show 470 + (i - 90) = 380 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
