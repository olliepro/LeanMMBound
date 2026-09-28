import CWShapePermutations
import TypePlacement
import CoordinateRestriction

/-! The root acts on the unrestricted CW power, with one constituent per
position. Its multiplicities are single split counts, without a paired parent. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Exact integer data for an unrestricted root extraction with complete fine profiles. -/
structure RootRestrictionData (length : ℕ) where
  /-- Multiplicities of the length-`length` constituent shapes in one root target. -/
  split : ShapeAlphabet (2*length) → ℕ
  /-- Complete empirical X profiles in each labelled shape pool. -/
  fineX : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  /-- Complete empirical Y profiles in each labelled shape pool. -/
  fineY : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  /-- Complete empirical Z profiles in each labelled shape pool. -/
  fineZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ
  /-- Zero-Z constituents force complementary X and Y fine profiles. -/
  zeroZ : ∀ child, child.val.z = 0 → ∀ word,
    fineY child word = fineX child ((fineComplement length).symm word)
  /-- Zero-X constituents force complementary Y and Z fine profiles. -/
  zeroX : ∀ child, child.val.x = 0 → ∀ word,
    fineZ child word = fineY child ((fineComplement length).symm word)
  /-- Zero-Y constituents force complementary X and Z fine profiles. -/
  zeroY : ∀ child, child.val.y = 0 → ∀ word,
    fineZ child word = fineX child ((fineComplement length).symm word)

/-- The unrestricted source is the original CW power grouped into labelled words of the root length. -/
def rootPower {K P : Type*} [CommRing K] [Fintype P] (q length : ℕ) :=
  Interface.heterogeneous (fun _ : P => wordPower (tensor (K := K) q) length)

/-- Its polynomial certificate retains the original rank budget, with no extra parent constituent. -/
def rootPowerCertificate {K P : Type*} [CommRing K] [Fintype P] (q length : ℕ) :
    Degeneration.Certificate (rootPower (K := K) (P := P) q length)
      ((q+2)^(length*Fintype.card P)) (3*length*Fintype.card P) := by
  have result := Degeneration.heterogeneousCertificate
    (fun _ : P => wordPower (tensor (K := K) q) length)
    (fun _ => (q+2)^length) (fun _ => 3*length) (fun _ => (certificate q).wordPower length)
  simpa only [rootPower, Finset.prod_const, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, ← pow_mul, Nat.mul_comm (Fintype.card P)] using result

namespace RootRestrictionData

variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

/-- Each target pool has exactly its root split multiplicity. -/
abbrev ChildPositions (data : RootRestrictionData length) (child : ShapeAlphabet (2*length)) := Fin (data.split child)

/-- Root target fine parts are independent exact-type words on the separately labelled pools. -/
abbrev TargetParts (data : RootRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :=
  ∀ child, TypedWord (P := data.ChildPositions child) (profile child)

/-- One axis of the root target retains all complete child types. -/
abbrev TargetAxis (data : RootRestrictionData length) (q : ℕ) (axis : Shape → ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :=
  ∀ child : ShapeAlphabet (2*length), Interface.Variable (P := data.ChildPositions child)
    (fun entry : AxisVariable q length (axis child.val) => fineWord entry.val) (profile child)

/-- The complete root target is the product of all exact constituent interfaces. -/
def target (data : RootRestrictionData length) (q : ℕ) :=
  exactChildren (K := K) (Positions := data.ChildPositions) q (fun _ => length) Subtype.val
    data.fineX data.fineY data.fineZ

/-- A prescribed root shape word places every exact target coordinate into the original CW source positions. -/
def targetAxis (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) (position : P) : Fin length → Fin (q+2) :=
  let slot := (typePlacement data.split edge).symm position
  ((entries slot.1).val slot.2).val

omit [CommRing K] in
/-- Mapped target coordinates have exactly the coarse totals of their prescribed root edge. -/
theorem targetAxis_coarse (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) (position : P) :
    wordCoarse (data.targetAxis edge q axis profile entries position) = axis (edge.val position).val := by
  change wordCoarse ((entries ((typePlacement data.split edge).symm position).1).val
    ((typePlacement data.split edge).symm position).2).val = _
  rw [((entries ((typePlacement data.split edge).symm position).1).val
    ((typePlacement data.split edge).symm position).2).property,
    typePlacement_inverse_label]

/-- Every prescribed root edge pulls the original source back to the same exact labelled child target. -/
theorem target_identity (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split) (q : ℕ) :
    (fun x y z => rootPower (K := K) (P := P) q length
      (data.targetAxis edge q Shape.x data.fineX x) (data.targetAxis edge q Shape.y data.fineY y)
      (data.targetAxis edge q Shape.z data.fineZ z)) = data.target (K := K) q := by
  funext x y z
  have reindexed := Equiv.prod_comp (typePlacement data.split edge).symm
    (fun slot : (child : ShapeAlphabet (2*length)) × data.ChildPositions child =>
      wordPower (tensor (K := K) q) length ((x slot.1).val slot.2).val
        ((y slot.1).val slot.2).val ((z slot.1).val slot.2).val)
  simpa only [rootPower, Interface.heterogeneous, targetAxis, target, exactChildren,
    Interface.exact, constituent, Fintype.prod_sigma] using reindexed

end RootRestrictionData
end
end MatrixBounds.Tensor.CW
