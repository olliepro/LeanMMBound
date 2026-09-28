import CWTargetSymmetry
import RepairedTargets

/-! Simultaneous sparse repair instantiated for the actual selected CW child
targets, their concrete coordinate maps, and their derived symmetry action. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K Selected : Type*} [Fintype P] [CommRing K] [Fintype Selected] [Nonempty Selected]
variable {length prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A sparse-hole selected extraction repairs to complete independent child targets at the explicit subexponential cost.
All tensor maps, disjointness, part symmetries, and coordinate growth are supplied
by the actual CW construction; only the finite seed selection and hole counts
remain numerical/combinatorial inputs to this finite theorem. -/
theorem repairedTargets_rank (data : SplitRestrictionData length) (symmetric : data.Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (free : ProgressionFree buckets)
    (largePrime : 2*length < prime) (selected : Selected ↪ data.PrescribedEdges (P := P))
    (active : ∀ copy, data.active seed (selected copy).val)
    (member : ∀ copy, hashX seed.2.1 seed.1
      (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ (selected copy).val).x ∈ buckets)
    (unique : ∀ copy, ¬data.coarseCollision seed (selected copy).val)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ)
    (k constant bits edgeBits multiplier rank degree : ℕ) (positive : 0 < k) (largeRepair : 3*constant ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale k)
    (smallX : ∀ copy, Nat.card {parts // data.parentHole symmetric (selected copy) data.fineX acceptX parts} * scale k ≤
      constant*Fintype.card (data.TargetParts data.fineX))
    (smallY : ∀ copy, Nat.card {parts // data.targetHoles symmetric seed (selected copy) Shape.y yClass data.fineY acceptY parts} * scale k ≤
      constant*Fintype.card (data.TargetParts data.fineY))
    (smallZ : ∀ copy, Nat.card {parts // data.targetHoles symmetric seed (selected copy) Shape.z zClass data.fineZ acceptZ parts} * scale k ≤
      constant*Fintype.card (data.TargetParts data.fineZ))
    (certificate : Degeneration.Certificate (data.parentInterface (K := K) q acceptX acceptY acceptZ) rank degree) :
    RankLE (directSum (fun _ : Selected => data.target (K := K) q))
      (2^(3*coverLength (3*(edgeBits*multiplier)+3*bits*(2*length*multiplier)) k)*(rank*(degree+1)^2)) := by
  letI : Nonempty (data.TargetParts data.fineX) := ⟨representativeX⟩
  letI : Nonempty (data.TargetParts data.fineY) := ⟨representativeY⟩
  letI : Nonempty (data.TargetParts data.fineZ) := ⟨representativeZ⟩
  letI := data.targetParts_transitive data.fineX
  letI := data.targetParts_transitive data.fineY
  letI := data.targetParts_transitive data.fineZ
  exact Symmetry.accepted_batch_repair (G := data.TargetGroup) (data.target (K := K) q)
    (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
    (data.targetParts_equivariant q Shape.x data.fineX) (data.targetParts_equivariant q Shape.y data.fineY)
    (data.targetParts_equivariant q Shape.z data.fineZ) (data.target_invariant q)
    (fun copy => data.parentHole symmetric (selected copy) data.fineX acceptX)
    (fun copy => data.targetHoles symmetric seed (selected copy) Shape.y yClass data.fineY acceptY)
    (fun copy => data.targetHoles symmetric seed (selected copy) Shape.z zClass data.fineZ acceptZ)
    (3*(edgeBits*multiplier)+3*bits*(2*length*multiplier)) k constant rank degree positive largeRepair
    smallX smallY smallZ (data.target_batch_cube_bound selected q bits edgeBits multiplier (scale k) alphabet shapes population)
    (data.damagedTargetCertificate symmetric q seed buckets free largePrime selected active member unique
      acceptX acceptY acceptZ certificate)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
