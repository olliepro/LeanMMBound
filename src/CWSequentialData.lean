import CWAxisPooling

/-! Data and actual variable restrictions for one CW split extraction. All
profiles are integer counts. Complement conditions record the necessary exact
child identities in zero-coordinate sectors. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Integer profiles describing one parent-to-children extraction at the given child length. -/
structure SplitRestrictionData (length : ℕ) where
  /-- The common parent constituent shape. -/
  parent : Shape
  /-- The parent contains two length-`length` CW children. -/
  balanced : parent.total = 2*(2*length)
  /-- Left-child coarse X, Y, and Z marginal counts. -/
  coarseX : Fin (2*length+1) → ℕ
  coarseY : Fin (2*length+1) → ℕ
  coarseZ : Fin (2*length+1) → ℕ
  /-- Prescribed counts of complete left-child shapes. -/
  split : ShapeAlphabet (2*length) → ℕ
  /-- Complete fine-word counts in each labelled X, Y, and Z child pool. -/
  fineX : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  fineY : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  fineZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  /-- Zero-Z child sectors have complementary X and Y types. -/
  zeroZ : ∀ child, child.val.z = 0 → ∀ symbol,
    fineY child symbol = fineX child ((fineComplement length).symm symbol)
  /-- Zero-X child sectors have complementary Y and Z types. -/
  zeroX : ∀ child, child.val.x = 0 → ∀ symbol,
    fineZ child symbol = fineY child ((fineComplement length).symm symbol)
  /-- Zero-Y child sectors have complementary X and Z types. -/
  zeroY : ∀ child, child.val.y = 0 → ∀ symbol,
    fineZ child symbol = fineX child ((fineComplement length).symm symbol)

namespace SplitRestrictionData

variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The complete marginal graph includes every admissible competitor. -/
abbrev Edges (data : SplitRestrictionData length) :=
  CoarseWords (P := P) data.parent (2*length) data.coarseX data.coarseY data.coarseZ

/-- Read the complete shape word underlying an admissible marginal edge. -/
def word (data : SplitRestrictionData length) (edge : data.Edges (P := P)) : P → ShapeAlphabet (2*length) :=
  fun position => (edge.val position).val

/-- Prescribed edges have the exact joint split profile, in addition to all marginal constraints. -/
def prescribed (data : SplitRestrictionData length) (edge : data.Edges (P := P)) : Prop := HasType data.split (data.word edge)

/-- An active edge has equal X, Y, and Z hashes in its own bucket. -/
def active (data : SplitRestrictionData length) (seed : Seed (ZMod prime) P) (edge : data.Edges (P := P)) : Prop :=
  (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).InBucket
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed
    (hashX seed.2.1 seed.1 (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).x)

/-- X ownership requires uniqueness in the complete graph, the prescribed split, and full child X types. -/
def ownerX (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P) :=
  refineOwner (parentCoarseOwner q length data.parent data.coarseX data.coarseY data.coarseZ seed)
    (fun edge entries => data.prescribed edge ∧
      fullChildType data.parent data.balanced (data.word edge) data.fineX entries)

/-- Y compatibility combines its actual coarse/fine test with the prescribed active edge condition. -/
def compatibleY (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → AxisVariable q (length+length) data.parent.y) : Prop :=
  data.prescribed edge ∧ data.active seed edge ∧
    compatibleFine length data.parent data.balanced yClass (pooledProfile data.fineY yClass)
      (fun child => child.val.y) (data.word edge) (parentFine entries)

/-- Z compatibility uses the individually forced zero-X/zero-Y sectors and its remaining pooled sectors. -/
def compatibleZ (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → AxisVariable q (length+length) data.parent.z) : Prop :=
  data.prescribed edge ∧ data.active seed edge ∧
    compatibleFine length data.parent data.balanced zClass (pooledProfile data.fineZ zClass)
      (fun child => child.val.z) (data.word edge) (parentFine entries)

/-- A uniquely compatible Y block is further restricted to all of its owner's full child profiles. -/
def fullY (data : SplitRestrictionData length) (q : ℕ)
    (edge : data.Edges (P := P)) (entries : P → AxisVariable q (length+length) data.parent.y) : Prop :=
  fullChildType data.parent data.balanced (data.word edge) data.fineY entries

/-- The final Z owner likewise imposes its complete child profiles. -/
def fullZ (data : SplitRestrictionData length) (q : ℕ)
    (edge : data.Edges (P := P)) (entries : P → AxisVariable q (length+length) data.parent.z) : Prop :=
  fullChildType data.parent data.balanced (data.word edge) data.fineZ entries

/-- Apply the parent interface windows and the variable-only Y/Z pooled tests to the hashed parent tensor. -/
def pooledParent (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  acceptedTensor (hashedCoarseParent (K := K) q length data.parent data.coarseX data.coarseY data.coarseZ seed buckets)
    id id id (fun entries => acceptX (parentFine entries))
    (fun entries => acceptY (parentFine entries) ∧ pooledAxisType (pooledProfile data.fineY shapeYIndex) entries)
    (fun entries => acceptZ (parentFine entries) ∧ pooledAxisType (pooledProfile data.fineZ shapeZIndex) entries)

/-- The resulting independent summands are defined by the actual sequential axis-owner maps. -/
def extractedPieces (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  directSum (ownedPiece (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ) (data.ownerX q seed)
    (refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullY q))
    (refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullZ q)))

end SplitRestrictionData
end
end MatrixBounds.Tensor.CW
