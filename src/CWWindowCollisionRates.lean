module

public import CWFineCollisionCounts
public import CWTargetSupport

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Uniform finite degrees and collision counts inside the accepted parent
windows. Blocks outside these windows are already charged as parent holes. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ} [Fact prime.Prime]

/-- Maximum size of a complete-graph X fiber, including nonprescribed edges. -/
def coarseDegree (data : SplitRestrictionData length) : ℕ :=
  Finset.univ.sup fun reference : data.Edges (P := P) =>
    Nat.card {other : data.Edges (P := P) //
      marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ other =
        marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ reference}

/-- The largest exact-type compatibility degree among accepted parent fine words. -/
def windowDegree (data : SplitRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) : ℕ :=
  Finset.univ.sup fun fine => if accept fine then
    Nat.card {word : TypedWord (P := P) data.split //
      compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
        (fun child => axis child.val) word.val fine} else 0

/-- Every accepted word's compatibility degree is bounded by the explicit maximum. -/
theorem degree_le_windowDegree (data : SplitRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop)
    (fine : P → Fin (length+length) → Fin 3) (accepted : accept fine) :
    Nat.card {word : TypedWord (P := P) data.split //
      compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
        (fun child => axis child.val) word.val fine} ≤ data.windowDegree axis axisClass profile accept := by
  have bound := Finset.le_sup (s := Finset.univ)
    (f := fun fine => if accept fine then Nat.card {word : TypedWord (P := P) data.split //
      compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
        (fun child => axis child.val) word.val fine} else 0) (Finset.mem_univ fine)
  simpa only [if_pos accepted] using! bound

/-- The collision event charged at a fine axis includes only accepted parent blocks. -/
def windowCollision (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (seed : Seed (ZMod prime) P) (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (parts : data.TargetParts profile) : Prop :=
  let fine := (data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val)
  accept fine ∧ data.fineCollision seed axis axisClass profile edge.val fine

/-- Intersecting a fine collision with its parent window bounds it by the maximum accepted degree. -/
theorem window_collision_count (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (parts : data.TargetParts profile)
    (bucket : ZMod prime)
    (counting : Nat.card {seed : WordBucket edge.val.val bucket //
      data.fineCollision seed.val axis axisClass profile edge.val
        ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))} * prime ≤
      Nat.card {word : TypedWord (P := P) data.split //
        compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
          (fun child => axis child.val) word.val
          ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))} *
        Nat.card (WordBucket edge.val.val bucket)) :
    Nat.card {seed : WordBucket edge.val.val bucket //
      data.windowCollision symmetric seed.val edge axis axisClass profile accept parts} * prime ≤
      data.windowDegree axis axisClass profile accept * Nat.card (WordBucket edge.val.val bucket) := by
  let fine := (data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val)
  by_cases accepted : accept fine
  · have inclusion : Nat.card {seed : WordBucket edge.val.val bucket //
        data.windowCollision symmetric seed.val edge axis axisClass profile accept parts} ≤
        Nat.card {seed : WordBucket edge.val.val bucket // data.fineCollision seed.val axis axisClass profile edge.val fine} :=
      Nat.card_mono (Set.toFinite _) (fun _ present => present.2)
    exact (Nat.mul_le_mul_right prime inclusion).trans (counting.trans
      (Nat.mul_le_mul_right _ (data.degree_le_windowDegree axis axisClass profile accept fine accepted)))
  · have empty : IsEmpty {seed : WordBucket edge.val.val bucket //
        data.windowCollision symmetric seed.val edge axis axisClass profile accept parts} :=
      ⟨fun seed => accepted seed.property.1⟩
    simp only [Nat.card_of_isEmpty, zero_mul, Nat.zero_le]

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
