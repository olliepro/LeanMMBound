module

public import FKLHier3.Leaf

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem leafRange01_00 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 95 5 = true := by decide +kernel
theorem leafRange01_01 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 100 5 = true := by decide +kernel
theorem leafRange01_02 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 105 5 = true := by decide +kernel
theorem leafRange01_03 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 110 5 = true := by decide +kernel
theorem leafRange01_04 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 115 5 = true := by decide +kernel
theorem leafRange01_05 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 120 5 = true := by decide +kernel
theorem leafRange01_06 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 125 5 = true := by decide +kernel
theorem leafRange01_07 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 130 5 = true := by decide +kernel
theorem leafRange01_08 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 135 5 = true := by decide +kernel
theorem leafRange01_09 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 140 5 = true := by decide +kernel
theorem leafRange01_10 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 145 5 = true := by decide +kernel
theorem leafRange01_11 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 150 5 = true := by decide +kernel
theorem leafRange01_12 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 155 5 = true := by decide +kernel
theorem leafRange01_13 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 160 5 = true := by decide +kernel
theorem leafRange01_14 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 165 5 = true := by decide +kernel
theorem leafRange01_15 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 170 5 = true := by decide +kernel
theorem leafRange01_16 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 175 5 = true := by decide +kernel
theorem leafRange01_17 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 180 5 = true := by decide +kernel
theorem leafRange01_18 : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) 3 185 5 = true := by decide +kernel

theorem leafOK01 : ∀ i < 95, LeafOK (95 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := leafOK_of_range 3 95 5 leafRange01_00 (i - 0) (by omega); rwa [show 95 + (i - 0) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 100 5 leafRange01_01 (i - 5) (by omega); rwa [show 100 + (i - 5) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 105 5 leafRange01_02 (i - 10) (by omega); rwa [show 105 + (i - 10) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 110 5 leafRange01_03 (i - 15) (by omega); rwa [show 110 + (i - 15) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 115 5 leafRange01_04 (i - 20) (by omega); rwa [show 115 + (i - 20) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 120 5 leafRange01_05 (i - 25) (by omega); rwa [show 120 + (i - 25) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 125 5 leafRange01_06 (i - 30) (by omega); rwa [show 125 + (i - 30) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 130 5 leafRange01_07 (i - 35) (by omega); rwa [show 130 + (i - 35) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 135 5 leafRange01_08 (i - 40) (by omega); rwa [show 135 + (i - 40) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 140 5 leafRange01_09 (i - 45) (by omega); rwa [show 140 + (i - 45) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 145 5 leafRange01_10 (i - 50) (by omega); rwa [show 145 + (i - 50) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 150 5 leafRange01_11 (i - 55) (by omega); rwa [show 150 + (i - 55) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 155 5 leafRange01_12 (i - 60) (by omega); rwa [show 155 + (i - 60) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 160 5 leafRange01_13 (i - 65) (by omega); rwa [show 160 + (i - 65) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 165 5 leafRange01_14 (i - 70) (by omega); rwa [show 165 + (i - 70) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 170 5 leafRange01_15 (i - 75) (by omega); rwa [show 170 + (i - 75) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 175 5 leafRange01_16 (i - 80) (by omega); rwa [show 175 + (i - 80) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 180 5 leafRange01_17 (i - 85) (by omega); rwa [show 180 + (i - 85) = 95 + i by omega] at this)
  · exact (by have := leafOK_of_range 3 185 5 leafRange01_18 (i - 90) (by omega); rwa [show 185 + (i - 90) = 95 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
