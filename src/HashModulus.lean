module

public import ProgressionBuckets
public import Mathlib.NumberTheory.Bertrand

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Choose an odd prime hash modulus with only a factor-two size overhead.
The progression-free bucket size remains an explicit real lower bound. -/
namespace MatrixBounds.HashBuckets

noncomputable section

/-- Two is nonzero in every residue field whose prime exceeds two. -/
theorem two_ne_zero {prime : ℕ} (large : 2 < prime) : (2 : ZMod prime) ≠ 0 := by
  intro zero
  have value := congrArg ZMod.val zero
  rw [ZMod.val_two_eq_two_mod, ZMod.val_zero, Nat.mod_eq_of_lt large] at value
  omega

/-- Every integer requirement at least two is exceeded by an odd prime at most twice as large. -/
theorem exists_hash_prime (requirement : ℕ) (large : 2 ≤ requirement) :
    ∃ prime, prime.Prime ∧ requirement < prime ∧ prime ≤ 2*requirement ∧ (2 : ZMod prime) ≠ 0 := by
  obtain ⟨prime, primality, lower, upper⟩ := Nat.exists_prime_lt_and_le_two_mul requirement (by omega)
  exact ⟨prime, primality, lower, upper, two_ne_zero (by omega)⟩

/-- The selected modulus and its progression-free bucket satisfy all quantitative finite bounds. -/
theorem exists_prime_bucket (requirement : ℕ) (large : 2 ≤ requirement) :
    ∃ prime, ∃ primality : prime.Prime, ∃ nonzero : (2 : ZMod prime) ≠ 0,
      letI : Fact prime.Prime := ⟨primality⟩
      letI : NeZero (2 : ZMod prime) := ⟨nonzero⟩
      ∃ bucket : Finset (ZMod prime), requirement < prime ∧ prime ≤ 2*requirement ∧
      ProgressionFree (bucket : Set (ZMod prime)) ∧
      ((prime/2 : ℕ) : ℝ) * Real.exp (-4*Real.sqrt (Real.log (prime/2 : ℕ))) ≤ bucket.card := by
  obtain ⟨prime, primality, lower, upper, nonzero⟩ := exists_hash_prime requirement large
  letI : Fact prime.Prime := ⟨primality⟩
  letI : NeZero (2 : ZMod prime) := ⟨nonzero⟩
  obtain ⟨bucket, free, size⟩ := exists_large_bucket prime
  exact ⟨prime, primality, nonzero, bucket, lower, upper, free, size⟩

end
end MatrixBounds.HashBuckets
