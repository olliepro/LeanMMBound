import CWActiveCollisions

/-! Actual fine-ownership collision probabilities, counted over prescribed
graph edges and then bounded by the full exact-type compatibility degree. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The competitors of a fine part are distinct prescribed graph edges passing its compatibility test. -/
abbrev FineCompetitors (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (fine : P → Fin (length+length) → Fin 3) :=
  {other : data.PrescribedEdges (P := P) // other ≠ reference ∧
    compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
      (fun child => axis child.val) (data.word other.val) fine}

/-- Prescribed competitors inject into all exact split words compatible with the fine part. -/
theorem fineCompetitors_card_le (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (fine : P → Fin (length+length) → Fin 3) :
    Nat.card (data.FineCompetitors reference axis axisClass profile fine) ≤
      Nat.card {word : TypedWord (P := P) data.split //
        compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
          (fun child => axis child.val) word.val fine} := by
  exact (other_compatible_count_le _ reference).trans (data.prescribed_compatible_degree_le
    (fun word => compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
      (fun child => axis child.val) word fine))

omit [NeZero (2 : ZMod prime)] in
/-- Inclusion into the reference-bucket union transfers a finite competitor bound to actual fine collisions. -/
theorem fine_collision_transfer (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (fine : P → Fin (length+length) → Fin 3) (bucket : ZMod prime)
    (toBucket : ∀ other : data.FineCompetitors reference axis axisClass profile fine,
      ∀ seed : WordBucket reference.val.val bucket, data.active seed.val other.val.val →
        wordCollision reference.val.val other.val.val.val bucket seed)
    (counting : Nat.card {seed : WordBucket reference.val.val bucket //
      ∃ other : data.FineCompetitors reference axis axisClass profile fine,
        wordCollision reference.val.val other.val.val.val bucket seed} * prime ≤
      Nat.card (data.FineCompetitors reference axis axisClass profile fine) *
        Nat.card (WordBucket reference.val.val bucket)) :
    Nat.card {seed : WordBucket reference.val.val bucket //
      data.fineCollision seed.val axis axisClass profile reference.val fine} * prime ≤
      Nat.card {word : TypedWord (P := P) data.split //
        compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
          (fun child => axis child.val) word.val fine} * Nat.card (WordBucket reference.val.val bucket) := by
  have inclusion : Nat.card {seed : WordBucket reference.val.val bucket //
      data.fineCollision seed.val axis axisClass profile reference.val fine} ≤
      Nat.card {seed : WordBucket reference.val.val bucket //
        ∃ other : data.FineCompetitors reference axis axisClass profile fine,
          wordCollision reference.val.val other.val.val.val bucket seed} := by
    apply Nat.card_mono (Set.toFinite _)
    intro seed collision
    obtain ⟨other, different, prescribed, active, compatible⟩ := collision
    let competitor : data.FineCompetitors reference axis axisClass profile fine :=
      ⟨⟨other, prescribed⟩, fun same => different (congrArg Subtype.val same), compatible⟩
    exact ⟨competitor, toBucket competitor seed active⟩
  exact (Nat.mul_le_mul_right prime inclusion).trans (counting.trans
    (Nat.mul_le_mul_right _ (data.fineCompetitors_card_le reference axis axisClass profile fine)))

/-- Actual Y-ownership collisions have conditional count at most the Y compatibility degree divided by the modulus. -/
theorem actual_y_collision_count (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (fine : P → Fin (length+length) → Fin 3)
    (agrees : coarseAgreement (fun child => child.val.y)
      (fun word => fineTotal (fun i => word (Fin.castAdd length i))) (data.word reference.val) fine)
    (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val.val bucket //
      data.fineCollision seed.val Shape.y yClass data.fineY reference.val fine} * prime ≤
      Nat.card {word : TypedWord (P := P) data.split //
        compatibleFine length data.parent data.balanced yClass (pooledProfile data.fineY yClass)
          (fun child => child.val.y) word.val fine} * Nat.card (WordBucket reference.val.val bucket) := by
  have shared (other : data.FineCompetitors reference Shape.y yClass data.fineY fine) :
      (splitWordEdge other.val.val.val).y = (splitWordEdge reference.val.val).y := by
    funext position
    exact (other.property.2.1 position).symm.trans (agrees position)
  apply data.fine_collision_transfer reference Shape.y yClass data.fineY fine bucket
    (fun other seed active => data.active_shared_y_bucket reference.val other.val.val bucket seed active (shared other))
  have bound := shared_y_word_count reference.val.val
    (fun other : data.FineCompetitors reference Shape.y yClass data.fineY fine => other.val.val.val)
    shared (fun other same => other.property.1 (Subtype.ext (Subtype.ext same))) large bucket
  simpa only [Nat.card_eq_fintype_card] using bound

/-- Actual Z-ownership collisions satisfy the corresponding conditional count with the same seed. -/
theorem actual_z_collision_count (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (fine : P → Fin (length+length) → Fin 3)
    (agrees : coarseAgreement (fun child => child.val.z)
      (fun word => fineTotal (fun i => word (Fin.castAdd length i))) (data.word reference.val) fine)
    (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val.val bucket //
      data.fineCollision seed.val Shape.z zClass data.fineZ reference.val fine} * prime ≤
      Nat.card {word : TypedWord (P := P) data.split //
        compatibleFine length data.parent data.balanced zClass (pooledProfile data.fineZ zClass)
          (fun child => child.val.z) word.val fine} * Nat.card (WordBucket reference.val.val bucket) := by
  have shared (other : data.FineCompetitors reference Shape.z zClass data.fineZ fine) :
      (splitWordEdge other.val.val.val).z = (splitWordEdge reference.val.val).z := by
    funext position
    exact (other.property.2.1 position).symm.trans (agrees position)
  apply data.fine_collision_transfer reference Shape.z zClass data.fineZ fine bucket
    (fun other seed active => data.active_shared_z_bucket reference.val other.val.val bucket seed active (shared other))
  have bound := shared_z_word_count reference.val.val
    (fun other : data.FineCompetitors reference Shape.z zClass data.fineZ fine => other.val.val.val)
    shared (fun other same => other.property.1 (Subtype.ext (Subtype.ext same))) large bucket
  simpa only [Nat.card_eq_fintype_card] using bound

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
