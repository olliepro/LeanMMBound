import CWCoarseGraph
import CWUniformPairing
import TensorHashing
import AcceptedRestrictions

/-! Hash and coarse-owner restrictions on the actual CW parent product. The
coarse graph is complete by construction, and a sufficiently large prime
recovers genuine integer coarse indices from the modular hashes. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K]

/-- Read the left-child coarse word of a parent axis in the prime residue field. -/
def parentCoarseMod (prime : ℕ) {q length total : ℕ}
    (entries : P → AxisVariable q (length+length) total) : P → ZMod prime :=
  fun position => (wordCoarse (leftHalf (entries position).val) : ZMod prime)

/-- The complete CW marginal graph, embedded coordinatewise into the prime field. -/
def coarseGraphEdges (prime : ℕ) (parent : Shape) (length : ℕ)
    (px py pz : Fin (2*length+1) → ℕ)
    (edge : CoarseWords (P := P) parent (2*length) px py pz) : CoarseEdge (ZMod prime) P :=
  modularEdge prime (splitWordEdge edge.val)

/-- Every nonzero parent coefficient with the prescribed marginals satisfies the modular support equation. -/
theorem coarseFiltered_mod_valid {prime : ℕ} [Fact prime.Prime]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (nonzero : coarseFiltered (K := K) q length parent px py pz x y z ≠ 0) (position : P) :
    parentCoarseMod prime x position + parentCoarseMod prime y position + parentCoarseMod prime z position =
      (2*length : ℕ) := by
  obtain ⟨edge, hx, hy, hz⟩ := coarseFiltered_complete q length parent px py pz x y z nonzero
  have identity := splitWordEdge_valid edge.val position
  rw [hx, hy, hz] at identity
  simpa only [parentCoarseMod, Nat.cast_add] using congrArg (fun value : ℕ => (value : ZMod prime)) identity

/-- The actual complete graph remains complete after the coordinatewise modular embedding. -/
theorem coarseFiltered_mod_complete (prime q length : ℕ) (parent : Shape)
    (px py pz : Fin (2*length+1) → ℕ)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (nonzero : coarseFiltered (K := K) q length parent px py pz x y z ≠ 0) :
    ∃ edge : CoarseWords (P := P) parent (2*length) px py pz,
      (coarseGraphEdges prime parent length px py pz edge).x = parentCoarseMod prime x ∧
      (coarseGraphEdges prime parent length px py pz edge).y = parentCoarseMod prime y ∧
      (coarseGraphEdges prime parent length px py pz edge).z = parentCoarseMod prime z := by
  obtain ⟨edge, hx, hy, hz⟩ := coarseFiltered_complete q length parent px py pz x y z nonzero
  refine ⟨edge, ?_, ?_, ?_⟩ <;>
    simp only [coarseGraphEdges, modularEdge, hx, hy, hz] <;> rfl

/-- The hashed parent tensor is obtained solely by independent variable restrictions. -/
def hashedCoarseParent {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) :=
  hashedTensor (coarseFiltered (K := K) q length parent px py pz)
    (parentCoarseMod prime) (parentCoarseMod prime) (parentCoarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets

/-- The coarse owner uses every admissible marginal edge, including nonprescribed competitors. -/
def parentCoarseOwner {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (seed : Seed (ZMod prime) P) :
    (P → AxisVariable q (length+length) parent.x) → Option (CoarseWords (P := P) parent (2*length) px py pz) :=
  coarseOwner (coarseGraphEdges prime parent length px py pz) (parentCoarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed

/-- Coarse ownership forces the physical X, Y, and Z child indices to match the owner's entire edge. -/
theorem parentCoarseOwner_forces {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (free : ProgressionFree buckets)
    (large : 2*length < prime) (edge : CoarseWords (P := P) parent (2*length) px py pz)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (owned : parentCoarseOwner q length parent px py pz seed x = some edge)
    (nonzero : hashedCoarseParent (K := K) q length parent px py pz seed buckets x y z ≠ 0) :
    (∀ position, wordCoarse (leftHalf (x position).val) = (edge.val position).val.val.x) ∧
    (∀ position, wordCoarse (leftHalf (y position).val) = (edge.val position).val.val.y) ∧
    (∀ position, wordCoarse (leftHalf (z position).val) = (edge.val position).val.val.z) := by
  have forced := coarse_owner_forces (coarseFiltered (K := K) q length parent px py pz)
    (coarseGraphEdges prime parent length px py pz) (parentCoarseMod prime) (parentCoarseMod prime) (parentCoarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) (coarseFiltered_mod_valid q length parent px py pz)
    (coarseFiltered_mod_complete prime q length parent px py pz) seed buckets free edge x y z owned nonzero
  have hx := bounded_word_cast_injective
    (fun position => (splitWord_small edge.val large position).1)
    (fun position => (wordCoarse_le (leftHalf (x position).val)).trans_lt large) forced.1
  have hy := bounded_word_cast_injective
    (fun position => (splitWord_small edge.val large position).2.1)
    (fun position => (wordCoarse_le (leftHalf (y position).val)).trans_lt large) forced.2.1
  have hz := bounded_word_cast_injective
    (fun position => (splitWord_small edge.val large position).2.2)
    (fun position => (wordCoarse_le (leftHalf (z position).val)).trans_lt large) forced.2.2
  exact ⟨fun position => (congrFun hx position).symm, fun position => (congrFun hy position).symm,
    fun position => (congrFun hz position).symm⟩

/-- The explicitly restricted and hashed parent product retains its CW source certificate budget. -/
def hashedCoarseParentCertificate {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (parentPower (K := K) (P := P) q length parent) rank degree) :
    Degeneration.Certificate (hashedCoarseParent (K := K) q length parent px py pz seed buckets) rank degree :=
  hashCertificate (acceptedCertificate (parentPower q length parent)
    (fun x position => wordCoarseIndex (leftHalf (x position).val))
    (fun y position => wordCoarseIndex (leftHalf (y position).val))
    (fun z position => wordCoarseIndex (leftHalf (z position).val))
    (HasType px) (HasType py) (HasType pz) certificate)
    (parentCoarseMod prime) (parentCoarseMod prime) (parentCoarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets

end
end MatrixBounds.Tensor.CW
