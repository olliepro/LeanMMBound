import MatrixBounds
import Mathlib.Combinatorics.Additive.AP.Three.Behrend
import Mathlib.Algebra.Field.ZMod

/-! Large progression-free hash buckets in prime fields. The integer Behrend
construction is imported from Mathlib; the no-wrap embedding into ZMod is proved here. -/
namespace MatrixBounds.HashBuckets

noncomputable section

/-- Casting small natural numbers into a residue ring is injective. -/
theorem cast_injective_below {modulus a b : ℕ} (ha : a < modulus) (hb : b < modulus)
    (equal : (a : ZMod modulus) = b) : a = b := by
  have values := congrArg ZMod.val equal
  simpa only [ZMod.val_natCast, Nat.mod_eq_of_lt ha, Nat.mod_eq_of_lt hb] using values

/-- An integer progression-free set below half the modulus remains progression-free modulo p. -/
theorem progression_free_mod {prime bound : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (small : 2 * bound ≤ prime) (set : Finset ℕ) (inside : set ⊆ Finset.range bound)
    (free : ThreeAPFree (set : Set ℕ)) :
    ProgressionFree (↑(set.image (fun a : ℕ => (a : ZMod prime))) : Set (ZMod prime)) := by
  intro x hx y hy z hz relation
  obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hx
  obtain ⟨b, hb, rfl⟩ := Finset.mem_image.mp hy
  obtain ⟨c, hc, rfl⟩ := Finset.mem_image.mp hz
  have a_small := Finset.mem_range.mp (inside ha)
  have b_small := Finset.mem_range.mp (inside hb)
  have c_small := Finset.mem_range.mp (inside hc)
  have cast_relation : ((a+b : ℕ) : ZMod prime) = ((c+c : ℕ) : ZMod prime) := by
    push_cast
    simpa only [two_mul] using relation
  have natural_relation := cast_injective_below (by omega : a+b < prime)
    (by omega : c+c < prime) cast_relation
  have ac : a = c := free ha hc hb natural_relation
  have bc : b = c := free hb hc ha (by omega)
  exact ⟨congrArg (fun n : ℕ => (n : ZMod prime)) ac, congrArg (fun n : ℕ => (n : ZMod prime)) bc⟩

/-- A prime-field hash bucket has the explicit Behrend lower bound at half the modulus. -/
theorem exists_large_bucket (prime : ℕ) [Fact prime.Prime] [NeZero (2 : ZMod prime)] :
    ∃ bucket : Finset (ZMod prime), ProgressionFree (bucket : Set (ZMod prime)) ∧
      ((prime / 2 : ℕ) : ℝ) * Real.exp (-4 * Real.sqrt (Real.log (prime / 2 : ℕ))) ≤ bucket.card := by
  obtain ⟨set, inside, cardinality, free⟩ := rothNumberNat_spec (prime/2)
  refine ⟨set.image (fun a : ℕ => (a : ZMod prime)),
    progression_free_mod (Nat.mul_div_le prime 2) set inside free, ?_⟩
  have injective : Set.InjOn (fun a : ℕ => (a : ZMod prime)) (set : Set ℕ) := by
    intro a ha b hb equal
    have a_small := Finset.mem_range.mp (inside ha)
    have b_small := Finset.mem_range.mp (inside hb)
    exact cast_injective_below (by omega) (by omega) equal
  rw [Finset.card_image_of_injOn injective, cardinality]
  exact Behrend.roth_lower_bound

end
end MatrixBounds.HashBuckets
