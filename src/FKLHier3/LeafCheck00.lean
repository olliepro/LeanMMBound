module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange00_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 0 5 = true := by decide +kernel
theorem leafRange00_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 5 5 = true := by decide +kernel
theorem leafRange00_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 10 5 = true := by decide +kernel
theorem leafRange00_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 15 5 = true := by decide +kernel
theorem leafRange00_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 20 5 = true := by decide +kernel
theorem leafRange00_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 25 5 = true := by decide +kernel
theorem leafRange00_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 30 5 = true := by decide +kernel
theorem leafRange00_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 35 5 = true := by decide +kernel
theorem leafRange00_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 40 5 = true := by decide +kernel
theorem leafRange00_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 45 5 = true := by decide +kernel
theorem leafRange00_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 50 5 = true := by decide +kernel
theorem leafRange00_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 55 5 = true := by decide +kernel
theorem leafRange00_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 60 5 = true := by decide +kernel
theorem leafRange00_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 65 5 = true := by decide +kernel
theorem leafRange00_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 70 5 = true := by decide +kernel
theorem leafRange00_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 75 5 = true := by decide +kernel
theorem leafRange00_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 80 5 = true := by decide +kernel
theorem leafRange00_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 85 5 = true := by decide +kernel
theorem leafRange00_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 90 5 = true := by decide +kernel

theorem leafOK00 : ∀ i < 95, LeafOK (0 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 0 5 leafRange00_00 (i - 0) (by omega); rwa [show 0 + (i - 0) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 5 5 leafRange00_01 (i - 5) (by omega); rwa [show 5 + (i - 5) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 10 5 leafRange00_02 (i - 10) (by omega); rwa [show 10 + (i - 10) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 15 5 leafRange00_03 (i - 15) (by omega); rwa [show 15 + (i - 15) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 20 5 leafRange00_04 (i - 20) (by omega); rwa [show 20 + (i - 20) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 25 5 leafRange00_05 (i - 25) (by omega); rwa [show 25 + (i - 25) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 30 5 leafRange00_06 (i - 30) (by omega); rwa [show 30 + (i - 30) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 35 5 leafRange00_07 (i - 35) (by omega); rwa [show 35 + (i - 35) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 40 5 leafRange00_08 (i - 40) (by omega); rwa [show 40 + (i - 40) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 45 5 leafRange00_09 (i - 45) (by omega); rwa [show 45 + (i - 45) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 50 5 leafRange00_10 (i - 50) (by omega); rwa [show 50 + (i - 50) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 55 5 leafRange00_11 (i - 55) (by omega); rwa [show 55 + (i - 55) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 60 5 leafRange00_12 (i - 60) (by omega); rwa [show 60 + (i - 60) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 65 5 leafRange00_13 (i - 65) (by omega); rwa [show 65 + (i - 65) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 70 5 leafRange00_14 (i - 70) (by omega); rwa [show 70 + (i - 70) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 75 5 leafRange00_15 (i - 75) (by omega); rwa [show 75 + (i - 75) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 80 5 leafRange00_16 (i - 80) (by omega); rwa [show 80 + (i - 80) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 85 5 leafRange00_17 (i - 85) (by omega); rwa [show 85 + (i - 85) = 0 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 90 5 leafRange00_18 (i - 90) (by omega); rwa [show 90 + (i - 90) = 0 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
