module

public import CWRootGraph

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A shared hash and complete-graph coarse owner on the unrestricted root
source. All filtering is by variables, and the original CW budget is preserved. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Read each unrestricted root word's actual coarse index in the prime field. -/
def coarseMod (prime : ℕ) {q length : ℕ} (entries : P → Fin length → Fin (q+2)) : P → ZMod prime :=
  fun position => (wordCoarse (entries position) : ZMod prime)

/-- The root's full marginal graph embedded into the shared residue field. -/
def graphEdges (data : RootRestrictionData length) (prime : ℕ) (edge : data.Edges (P := P)) : CoarseEdge (ZMod prime) P :=
  modularEdge prime (splitWordEdge edge.val)

omit [Fintype P] [NeZero (2 : ZMod prime)] in
/-- Every complete root graph edge satisfies the exact hash support equation. -/
theorem graph_valid (data : RootRestrictionData length) (edge : data.Edges (P := P)) :
    (data.graphEdges prime edge).Valid (fun _ => ((2*length : ℕ) : ZMod prime)) :=
  modularEdge_valid (splitWordEdge edge.val) (fun _ => 2*length) (splitWordEdge_valid edge.val)

omit [NeZero (2 : ZMod prime)] in
/-- Nonzero coarse-filtered root coefficients satisfy the same modular support equation. -/
theorem coarseFiltered_mod_valid (data : RootRestrictionData length) (q : ℕ)
    (x y z : P → Fin length → Fin (q+2))
    (nonzero : data.coarseFiltered (K := K) q x y z ≠ 0) (position : P) :
    coarseMod prime x position + coarseMod prime y position + coarseMod prime z position = (2*length : ℕ) := by
  obtain ⟨edge, hx, hy, hz⟩ := data.coarseFiltered_complete q x y z nonzero
  have identity := splitWordEdge_valid edge.val position
  rw [hx, hy, hz] at identity
  simpa only [coarseMod, Nat.cast_add] using congrArg (fun value : ℕ => (value : ZMod prime)) identity

/-- The root's actual marginal graph remains complete after reduction modulo the hash prime. -/
theorem coarseFiltered_mod_complete (data : RootRestrictionData length) (prime q : ℕ)
    (x y z : P → Fin length → Fin (q+2))
    (nonzero : data.coarseFiltered (K := K) q x y z ≠ 0) :
    ∃ edge : data.Edges (P := P), (data.graphEdges prime edge).x = coarseMod prime x ∧
      (data.graphEdges prime edge).y = coarseMod prime y ∧ (data.graphEdges prime edge).z = coarseMod prime z := by
  obtain ⟨edge, hx, hy, hz⟩ := data.coarseFiltered_complete q x y z nonzero
  refine ⟨edge, ?_, ?_, ?_⟩ <;> simp only [graphEdges, modularEdge, hx, hy, hz] <;> rfl

/-- Apply the shared progression-free hash by three separate root-axis restrictions. -/
def hashedRoot (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) :=
  hashedTensor (data.coarseFiltered (K := K) q) (coarseMod prime) (coarseMod prime) (coarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets

/-- The coarse owner checks uniqueness among all active root marginal edges. -/
def coarseOwner (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P) :
    (P → Fin length → Fin (q+2)) → Option (data.Edges (P := P)) :=
  Extraction.coarseOwner (data.graphEdges prime) (coarseMod prime) (fun _ => ((2*length : ℕ) : ZMod prime)) seed

/-- Unique coarse ownership forces all three physical root-coordinate words to the owner's edge. -/
theorem coarseOwner_forces (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (edge : data.Edges (P := P)) (x y z : P → Fin length → Fin (q+2))
    (owned : data.coarseOwner q seed x = some edge)
    (nonzero : data.hashedRoot (K := K) q seed buckets x y z ≠ 0) :
    (∀ position, wordCoarse (x position) = (data.word edge position).val.x) ∧
    (∀ position, wordCoarse (y position) = (data.word edge position).val.y) ∧
    (∀ position, wordCoarse (z position) = (data.word edge position).val.z) := by
  have forced := coarse_owner_forces (data.coarseFiltered (K := K) q)
    (data.graphEdges prime) (coarseMod prime) (coarseMod prime) (coarseMod prime)
    (fun _ => ((2*length : ℕ) : ZMod prime)) (data.coarseFiltered_mod_valid q)
    (data.coarseFiltered_mod_complete prime q) seed buckets free edge x y z owned nonzero
  have hx := bounded_word_cast_injective (fun position => (splitWord_small edge.val large position).1)
    (fun position => (wordCoarse_le (x position)).trans_lt large) forced.1
  have hy := bounded_word_cast_injective (fun position => (splitWord_small edge.val large position).2.1)
    (fun position => (wordCoarse_le (y position)).trans_lt large) forced.2.1
  have hz := bounded_word_cast_injective (fun position => (splitWord_small edge.val large position).2.2)
    (fun position => (wordCoarse_le (z position)).trans_lt large) forced.2.2
  exact ⟨fun position => (congrFun hx position).symm, fun position => (congrFun hy position).symm,
    fun position => (congrFun hz position).symm⟩

omit [NeZero (2 : ZMod prime)] in
/-- Every nonzero hashed root coefficient has a nonzero CW factor at every original position. -/
theorem hashedRoot_factors (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (x y z : P → Fin length → Fin (q+2))
    (nonzero : data.hashedRoot (K := K) q seed buckets x y z ≠ 0) (position : P) :
    wordPower (tensor (K := K) q) length (x position) (y position) (z position) ≠ 0 := by
  have original := (hashed_nonzero _ _ _ _ _ _ _ x y z nonzero).1
  have product := (accepted_nonzero _ _ _ _ _ _ _ x y z original).1
  intro zero
  exact product (Finset.prod_eq_zero (Finset.mem_univ position) zero)

/-- Hashing preserves every supplied root polynomial certificate and therefore its original rank budget. -/
def hashedRootCertificate (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (rootPower (K := K) (P := P) q length) rank degree) :
    Degeneration.Certificate (data.hashedRoot (K := K) q seed buckets) rank degree :=
  hashCertificate (data.coarseFilteredCertificate q certificate)
    (coarseMod prime) (coarseMod prime) (coarseMod prime) (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets

end
end MatrixBounds.Tensor.CW.RootRestrictionData
