module

public import FKLHier3.Par

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL

theorem parRange02_00 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 190 5 = true := by decide +kernel
theorem parRange02_01 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 195 5 = true := by decide +kernel
theorem parRange02_02 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 200 5 = true := by decide +kernel
theorem parRange02_03 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 205 5 = true := by decide +kernel
theorem parRange02_04 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 210 5 = true := by decide +kernel
theorem parRange02_05 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 215 5 = true := by decide +kernel
theorem parRange02_06 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 220 5 = true := by decide +kernel
theorem parRange02_07 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 225 5 = true := by decide +kernel
theorem parRange02_08 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 230 5 = true := by decide +kernel
theorem parRange02_09 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 235 5 = true := by decide +kernel
theorem parRange02_10 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 240 5 = true := by decide +kernel
theorem parRange02_11 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 245 5 = true := by decide +kernel
theorem parRange02_12 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 250 5 = true := by decide +kernel
theorem parRange02_13 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 255 5 = true := by decide +kernel
theorem parRange02_14 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 260 5 = true := by decide +kernel
theorem parRange02_15 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 265 5 = true := by decide +kernel
theorem parRange02_16 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 270 5 = true := by decide +kernel
theorem parRange02_17 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 275 5 = true := by decide +kernel
theorem parRange02_18 : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) 3 280 5 = true := by decide +kernel

theorem parOK02 : ∀ i < 95, ParOK (190 + i) := by
  intro i hi
  have : (0 ≤ i ∧ i < 5) ∨ (5 ≤ i ∧ i < 10) ∨ (10 ≤ i ∧ i < 15) ∨ (15 ≤ i ∧ i < 20) ∨ (20 ≤ i ∧ i < 25) ∨ (25 ≤ i ∧ i < 30) ∨ (30 ≤ i ∧ i < 35) ∨ (35 ≤ i ∧ i < 40) ∨ (40 ≤ i ∧ i < 45) ∨ (45 ≤ i ∧ i < 50) ∨ (50 ≤ i ∧ i < 55) ∨ (55 ≤ i ∧ i < 60) ∨ (60 ≤ i ∧ i < 65) ∨ (65 ≤ i ∧ i < 70) ∨ (70 ≤ i ∧ i < 75) ∨ (75 ≤ i ∧ i < 80) ∨ (80 ≤ i ∧ i < 85) ∨ (85 ≤ i ∧ i < 90) ∨ (90 ≤ i ∧ i < 95) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact (by have := parOK_of_range 3 190 5 parRange02_00 (i - 0) (by omega); rwa [show 190 + (i - 0) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 195 5 parRange02_01 (i - 5) (by omega); rwa [show 195 + (i - 5) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 200 5 parRange02_02 (i - 10) (by omega); rwa [show 200 + (i - 10) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 205 5 parRange02_03 (i - 15) (by omega); rwa [show 205 + (i - 15) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 210 5 parRange02_04 (i - 20) (by omega); rwa [show 210 + (i - 20) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 215 5 parRange02_05 (i - 25) (by omega); rwa [show 215 + (i - 25) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 220 5 parRange02_06 (i - 30) (by omega); rwa [show 220 + (i - 30) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 225 5 parRange02_07 (i - 35) (by omega); rwa [show 225 + (i - 35) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 230 5 parRange02_08 (i - 40) (by omega); rwa [show 230 + (i - 40) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 235 5 parRange02_09 (i - 45) (by omega); rwa [show 235 + (i - 45) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 240 5 parRange02_10 (i - 50) (by omega); rwa [show 240 + (i - 50) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 245 5 parRange02_11 (i - 55) (by omega); rwa [show 245 + (i - 55) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 250 5 parRange02_12 (i - 60) (by omega); rwa [show 250 + (i - 60) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 255 5 parRange02_13 (i - 65) (by omega); rwa [show 255 + (i - 65) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 260 5 parRange02_14 (i - 70) (by omega); rwa [show 260 + (i - 70) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 265 5 parRange02_15 (i - 75) (by omega); rwa [show 265 + (i - 75) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 270 5 parRange02_16 (i - 80) (by omega); rwa [show 270 + (i - 80) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 275 5 parRange02_17 (i - 85) (by omega); rwa [show 275 + (i - 85) = 190 + i by omega] at this)
  · exact (by have := parOK_of_range 3 280 5 parRange02_18 (i - 90) (by omega); rwa [show 280 + (i - 90) = 190 + i by omega] at this)

end MatrixBounds.Numeric.FKLHier3
