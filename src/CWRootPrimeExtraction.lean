import CWFiniteRootExtraction
import ContextCopies
import BehrendRetention

/-! An actual prime and progression-free bucket set implement root extraction
with an explicit finite copy count and context-preserving repair. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric HashCounting Extraction RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

/-- The unrestricted root has a complete repaired extraction at a chosen prime of controlled size. -/
theorem finite_prime_extraction (data : RootRestrictionData length) (q : ℕ)
    (reference : data.PrescribedEdges (P := P))
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ) (k bits edgeBits multiplier requirement : ℕ) (largeRepair : 3 ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale k)
    (requirementLarge : 2 ≤ requirement) (lengthBound : 2*length ≤ requirement)
    (degreeX : 6*data.coarseDegree (P := P) ≤ requirement)
    (degreeY : 6*(scale k*data.fineDegree (P := P) Shape.y yClass data.fineY) ≤ requirement)
    (degreeZ : 6*(scale k*data.fineDegree (P := P) Shape.z zClass data.fineZ) ≤ requirement) :
    ∃ prime copies : ℕ, prime.Prime ∧ requirement < prime ∧ prime ≤ 2*requirement ∧
      (Fintype.card (TypedWord (P := P) data.split) : ℝ)/(6*prime)*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      ContextReduction.{v} (rootPower (K := K) (P := P) q length)
        (directSum (fun _ : Fin copies => data.target (K := K) q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  obtain ⟨prime, primality, nonzero, buckets, lower, upper, free, bucketBound⟩ :=
    HashBuckets.exists_prime_bucket requirement requirementLarge
  letI : Fact prime.Prime := ⟨primality⟩
  letI : NeZero (2 : ZMod prime) := ⟨nonzero⟩
  have largePrime : 3 ≤ prime := by omega
  have halfPositive : (0 : ℝ) < (prime/2 : ℕ) := by exact_mod_cast (show 0 < prime/2 by omega)
  have bucketPositive : 0 < (buckets.card : ℝ) := (mul_pos halfPositive (Real.exp_pos _)).trans_le bucketBound
  have bucketNonempty : buckets.Nonempty := Finset.card_pos.mp (by exact_mod_cast bucketPositive)
  obtain ⟨seed, retained, repaired⟩ := finite_root_extraction.{v} (K := K) data q reference buckets bucketNonempty
    free (lengthBound.trans_lt lower) supportY supportZ representativeX representativeY representativeZ
    k bits edgeBits multiplier largeRepair alphabet shapes population
    (degreeX.trans lower.le) (degreeY.trans lower.le) (degreeZ.trans lower.le)
  let Selected := data.SelectedEdges seed buckets (scale k)
  letI : Fintype Selected := by unfold Selected SelectedEdges; infer_instance
  have bound := HashBuckets.surviving_count_lower largePrime bucketBound retained
  refine ⟨prime, Fintype.card Selected, primality, lower, upper, ?_, ?_⟩
  · rw [data.prescribed_card] at bound
    simpa only [Nat.card_eq_fintype_card] using bound
  · simpa only [one_mul] using repaired.trans
      (contextReduction_relabelCopies (data.target (K := K) q) (Fintype.equivFin Selected).symm)

end
end MatrixBounds.Tensor.CW.RootRestrictionData
