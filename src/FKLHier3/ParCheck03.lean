module

public import FKLHier3.Par

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem parRange03_00 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 285 5 = true := by decide +kernel
theorem parRange03_01 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 290 5 = true := by decide +kernel
theorem parRange03_02 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 295 5 = true := by decide +kernel
theorem parRange03_03 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 300 5 = true := by decide +kernel
theorem parRange03_04 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 305 5 = true := by decide +kernel
theorem parRange03_05 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 310 5 = true := by decide +kernel
theorem parRange03_06 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 315 5 = true := by decide +kernel
theorem parRange03_07 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 320 5 = true := by decide +kernel
theorem parRange03_08 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 325 5 = true := by decide +kernel
theorem parRange03_09 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 330 5 = true := by decide +kernel
theorem parRange03_10 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 335 5 = true := by decide +kernel
theorem parRange03_11 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 340 5 = true := by decide +kernel
theorem parRange03_12 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 345 5 = true := by decide +kernel
theorem parRange03_13 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 350 5 = true := by decide +kernel
theorem parRange03_14 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 355 5 = true := by decide +kernel
theorem parRange03_15 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 360 5 = true := by decide +kernel
theorem parRange03_16 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 365 5 = true := by decide +kernel
theorem parRange03_17 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 370 5 = true := by decide +kernel
theorem parRange03_18 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 375 5 = true := by decide +kernel

theorem parOK03 : ∀ i < 95, ParOK (285 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := parOK_of_range 3 285 5 parRange03_00 (i - 0) (by omega); rwa [show 285 + (i - 0) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 290 5 parRange03_01 (i - 5) (by omega); rwa [show 290 + (i - 5) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 295 5 parRange03_02 (i - 10) (by omega); rwa [show 295 + (i - 10) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 300 5 parRange03_03 (i - 15) (by omega); rwa [show 300 + (i - 15) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 305 5 parRange03_04 (i - 20) (by omega); rwa [show 305 + (i - 20) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 310 5 parRange03_05 (i - 25) (by omega); rwa [show 310 + (i - 25) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 315 5 parRange03_06 (i - 30) (by omega); rwa [show 315 + (i - 30) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 320 5 parRange03_07 (i - 35) (by omega); rwa [show 320 + (i - 35) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 325 5 parRange03_08 (i - 40) (by omega); rwa [show 325 + (i - 40) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 330 5 parRange03_09 (i - 45) (by omega); rwa [show 330 + (i - 45) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 335 5 parRange03_10 (i - 50) (by omega); rwa [show 335 + (i - 50) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 340 5 parRange03_11 (i - 55) (by omega); rwa [show 340 + (i - 55) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 345 5 parRange03_12 (i - 60) (by omega); rwa [show 345 + (i - 60) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 350 5 parRange03_13 (i - 65) (by omega); rwa [show 350 + (i - 65) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 355 5 parRange03_14 (i - 70) (by omega); rwa [show 355 + (i - 70) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 360 5 parRange03_15 (i - 75) (by omega); rwa [show 360 + (i - 75) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 365 5 parRange03_16 (i - 80) (by omega); rwa [show 365 + (i - 80) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 370 5 parRange03_17 (i - 85) (by omega); rwa [show 370 + (i - 85) = 285 + i by omega] at this)
  · exact (by have := parOK_of_range 3 375 5 parRange03_18 (i - 90) (by omega); rwa [show 375 + (i - 90) = 285 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
