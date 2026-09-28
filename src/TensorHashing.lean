import SequentialExtraction
import HashEdges
import TypePartition

/-! Actual independent-axis hash restrictions, followed by coarse-X ownership.
Completeness refers to a finite list of actual support edges, rather than to a
permission to delete individual tensor coefficients. -/
namespace MatrixBounds.Tensor.Extraction

open HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K F P X Y Z E : Type*} [CommSemiring K] [Field F] [Fintype P] [NeZero (2 : F)]

/-- Keep exactly the variables whose axis hashes lie in the prescribed bucket set. -/
def hashedTensor (source : Coeff K X Y Z) (coarseX : X → P → F) (coarseY : Y → P → F)
    (coarseZ : Z → P → F) (total : P → F) (seed : Seed F P) (buckets : Set F) : Coeff K X Y Z :=
  Empirical.acceptedTensor source
    (fun x => hashX seed.2.1 seed.1 (coarseX x))
    (fun y => hashY seed.2.1 seed.2.2 seed.1 (coarseY y))
    (fun z => hashZ seed.2.1 seed.2.2 seed.1 total (coarseZ z))
    (fun value => value ∈ buckets) (fun value => value ∈ buckets) (fun value => value ∈ buckets)

/-- Hash zero-outs have explicit diagonal coordinate matrices and preserve the certificate budget. -/
def hashCertificate [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    {source : Coeff K X Y Z} {rank degree : ℕ} (certificate : Degeneration.Certificate source rank degree)
    (coarseX : X → P → F) (coarseY : Y → P → F) (coarseZ : Z → P → F)
    (total : P → F) (seed : Seed F P) (buckets : Set F) :
    Degeneration.Certificate (hashedTensor source coarseX coarseY coarseZ total seed buckets) rank degree := by
  have restricted := certificate.restrict
    (mask (fun x => decide (hashX seed.2.1 seed.1 (coarseX x) ∈ buckets)))
    (mask (fun y => decide (hashY seed.2.1 seed.2.2 seed.1 (coarseY y) ∈ buckets)))
    (mask (fun z => decide (hashZ seed.2.1 seed.2.2 seed.1 total (coarseZ z) ∈ buckets)))
  simpa only [restrict_mask, decide_eq_true_eq, hashedTensor, Empirical.acceptedTensor] using restricted

omit [NeZero (2 : F)] in
/-- A nonzero hashed coefficient comes from the original tensor and has three retained hashes. -/
theorem hashed_nonzero (source : Coeff K X Y Z) (coarseX : X → P → F) (coarseY : Y → P → F)
    (coarseZ : Z → P → F) (total : P → F) (seed : Seed F P) (buckets : Set F) (x : X) (y : Y) (z : Z)
    (nonzero : hashedTensor source coarseX coarseY coarseZ total seed buckets x y z ≠ 0) :
    source x y z ≠ 0 ∧ hashX seed.2.1 seed.1 (coarseX x) ∈ buckets ∧
      hashY seed.2.1 seed.2.2 seed.1 (coarseY y) ∈ buckets ∧
      hashZ seed.2.1 seed.2.2 seed.1 total (coarseZ z) ∈ buckets := by
  unfold hashedTensor Empirical.acceptedTensor at nonzero
  split_ifs at nonzero with retained
  · exact ⟨nonzero, retained⟩
  · exact (nonzero rfl).elim

/-- On valid support, progression-free buckets force equality of all retained hashes. -/
theorem hashed_same_bucket (source : Coeff K X Y Z)
    (coarseX : X → P → F) (coarseY : Y → P → F) (coarseZ : Z → P → F)
    (total : P → F) (valid : ∀ x y z, source x y z ≠ 0 →
      ∀ p, coarseX x p + coarseY y p + coarseZ z p = total p)
    (seed : Seed F P) (buckets : Set F) (free : ProgressionFree buckets) (x : X) (y : Y) (z : Z)
    (nonzero : hashedTensor source coarseX coarseY coarseZ total seed buckets x y z ≠ 0) :
    hashY seed.2.1 seed.2.2 seed.1 (coarseY y) = hashX seed.2.1 seed.1 (coarseX x) ∧
      hashZ seed.2.1 seed.2.2 seed.1 total (coarseZ z) = hashX seed.2.1 seed.1 (coarseX x) := by
  obtain ⟨original, hx, hy, hz⟩ := hashed_nonzero source coarseX coarseY coarseZ total seed buckets x y z nonzero
  obtain ⟨xz, yz⟩ := free _ hx _ hy _ hz
    (shared_hash_identity _ _ _ _ _ _ _ (valid x y z original))
  exact ⟨yz.trans xz.symm, xz.symm⟩

/-- A coarse X variable is assigned only if exactly one support edge remains in its bucket. -/
def coarseOwner (edges : E → CoarseEdge F P) (coarseX : X → P → F)
    (total : P → F) (seed : Seed F P) : X → Option E :=
  uniqueOwner (fun edge x => (edges edge).x = coarseX x ∧
    (edges edge).InBucket total seed (hashX seed.2.1 seed.1 (coarseX x)))

/-- The unique coarse-X owner determines the complete coarse edge of every remaining coefficient. -/
theorem coarse_owner_forces (source : Coeff K X Y Z) (edges : E → CoarseEdge F P)
    (coarseX : X → P → F) (coarseY : Y → P → F) (coarseZ : Z → P → F)
    (total : P → F) (valid : ∀ x y z, source x y z ≠ 0 →
      ∀ p, coarseX x p + coarseY y p + coarseZ z p = total p)
    (complete : ∀ x y z, source x y z ≠ 0 → ∃ edge,
      (edges edge).x = coarseX x ∧ (edges edge).y = coarseY y ∧ (edges edge).z = coarseZ z)
    (seed : Seed F P) (buckets : Set F) (free : ProgressionFree buckets)
    (edge : E) (x : X) (y : Y) (z : Z)
    (owned : coarseOwner edges coarseX total seed x = some edge)
    (nonzero : hashedTensor source coarseX coarseY coarseZ total seed buckets x y z ≠ 0) :
    (edges edge).x = coarseX x ∧ (edges edge).y = coarseY y ∧ (edges edge).z = coarseZ z := by
  have original := (hashed_nonzero source coarseX coarseY coarseZ total seed buckets x y z nonzero).1
  obtain ⟨other, hx, hy, hz⟩ := complete x y z original
  obtain ⟨sameY, sameZ⟩ := hashed_same_bucket source coarseX coarseY coarseZ total valid seed buckets free x y z nonzero
  have selected : other = edge := (uniqueOwner_spec _ x edge owned).2 other
    ⟨hx, by
      simp only [CoarseEdge.InBucket, hx, hy, hz]
      exact ⟨True.intro, sameY, sameZ⟩⟩
  subst other
  exact ⟨hx, hy, hz⟩

end
end MatrixBounds.Tensor.Extraction
