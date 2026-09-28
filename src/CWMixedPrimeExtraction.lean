import CWFiniteMixedExtraction
import BehrendRetention

/-! Choose the shared prime and progression-free buckets automatically, and
state the finite extraction using a natural number of genuine target copies. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- An explicit degree requirement supplies a suitable shared prime, a Behrend retained-copy lower bound, and the complete target rank bound. -/
theorem finite_mixed_prime_extraction (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (q : ℕ) (reference : PrescribedEdges Positions data)
    (supportY : ∀ type child block, fineTotal block ≠ child.val.y → (data type).fineY child block = 0)
    (supportZ : ∀ type child block, fineTotal block ≠ child.val.z → (data type).fineZ child block = 0)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (tolerance : T → ℝ) (positiveTolerance : ∀ type, 0 < tolerance type)
    (k bits rank degree requirement : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier tolerance+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (requirementLarge : 2 ≤ requirement) (lengthBound : ∀ type, 2*length type ≤ requirement)
    (degreeX : 6*(∏ type, (data type).coarseDegree (P := Positions type)) ≤ requirement)
    (degreeY : 6*(scale k*∏ type, (data type).windowDegree Shape.y yClass (data type).fineY
      ((data type).parentWindow (P := Positions type) (data type).fineY (tolerance type))) ≤ requirement)
    (degreeZ : 6*(scale k*∏ type, (data type).windowDegree Shape.z zClass (data type).fineZ
      ((data type).parentWindow (P := Positions type) (data type).fineZ (tolerance type))) ≤ requirement)
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (parentWindows (Positions := Positions) data (fun type => (data type).fineX) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance)) rank degree) :
    ∃ prime copies : ℕ, prime.Prime ∧ requirement < prime ∧ prime ≤ 2*requirement ∧
      (Fintype.card (PrescribedEdges Positions data) : ℝ)/(6*prime)*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      RankLE (directSum (fun _ : Fin copies => target (K := K) data q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)*(rank*(degree+1)^2)) := by
  obtain ⟨prime, primality, nonzero, buckets, lower, upper, free, bucketBound⟩ :=
    HashBuckets.exists_prime_bucket requirement requirementLarge
  letI : Fact prime.Prime := ⟨primality⟩
  letI : NeZero (2 : ZMod prime) := ⟨nonzero⟩
  have largePrime : 3 ≤ prime := by omega
  have halfPositive : (0 : ℝ) < (prime/2 : ℕ) := by exact_mod_cast (show 0 < prime/2 by omega)
  have bucketPositive : 0 < (buckets.card : ℝ) := (mul_pos halfPositive (Real.exp_pos _)).trans_le bucketBound
  have bucketNonempty : buckets.Nonempty := Finset.card_pos.mp (by exact_mod_cast bucketPositive)
  obtain ⟨seed, retained, repaired⟩ := finite_mixed_extraction data symmetric q reference buckets bucketNonempty
    free (fun type => (lengthBound type).trans_lt lower) supportY supportZ representativeX representativeY representativeZ
    tolerance positiveTolerance k bits rank degree edgeBits multiplier positive largeRepair alphabet shapes
    populationLower populationUpper (degreeX.trans lower.le) (degreeY.trans lower.le) (degreeZ.trans lower.le) certificate
  let Selected := SelectedEdges data symmetric seed buckets
    (parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance)
    (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance) (scale k)
  letI : Fintype Selected := by unfold Selected SelectedEdges; infer_instance
  have bound := HashBuckets.surviving_count_lower largePrime bucketBound retained
  refine ⟨prime, Fintype.card Selected, primality, lower, upper, ?_, ?_⟩
  · simpa only [Nat.card_eq_fintype_card] using bound
  · exact rankLE_relabel_copies (target (K := K) data q) (Fintype.equivFin Selected).symm repaired

end
end MatrixBounds.Tensor.CW.Mixed
