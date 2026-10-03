module

public import PooledCompatibility
public import ShapeAlphabet

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The actual asymmetric CW sector labels: zero-coordinate child shapes keep
their individual types, while the other children pool by their own axis index. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Split each complete parent fine word into its separately labelled left and right child words. -/
def fineHalves (length : ℕ) : (P → Fin (length+length) → Fin 3) ≃ (P ⊕ P → Fin length → Fin 3) where
  toFun words slot := Sum.elim
    (fun p i => words p (Fin.castAdd length i)) (fun p i => words p (Fin.natAdd length i)) slot
  invFun words parent := Fin.addCases (words (Sum.inl parent)) (words (Sum.inr parent))
  left_inv words := by
    funext parent i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i <;>
      simp only [Fin.addCases_left, Fin.addCases_right, Sum.elim_inl, Sum.elim_inr]
  right_inv words := by
    funext slot i
    cases slot <;> simp only [Fin.addCases_left, Fin.addCases_right, Sum.elim_inl, Sum.elim_inr]

/-- A compatibility sector is either an individually forced child shape or a pooled coarse-axis index. -/
abbrev CompatibilityClass (total : ℕ) := ShapeAlphabet total ⊕ Fin (total+1)

/-- Y compatibility keeps zero-Z child types separate and pools the others by their Y index. -/
def yClass {total : ℕ} (child : ShapeAlphabet total) : CompatibilityClass total :=
  if child.val.z = 0 then Sum.inl child else
    Sum.inr ⟨child.val.y, by have := shapes_total child.property; unfold Shape.total at this; omega⟩

/-- Z compatibility keeps zero-X and zero-Y types separate and pools the others by their Z index. -/
def zClass {total : ℕ} (child : ShapeAlphabet total) : CompatibilityClass total :=
  if child.val.x = 0 ∨ child.val.y = 0 then Sum.inl child else
    Sum.inr ⟨child.val.z, by have := shapes_total child.property; unfold Shape.total at this; omega⟩

/-- Record both complementary children of each coarse split without losing their left/right labels. -/
def childLabels {total : ℕ} (parent : Shape) (balanced : parent.total = 2*total)
    (left : P → ShapeAlphabet total) : P ⊕ P → ShapeAlphabet total :=
  Sum.elim left (fun p => complementEquiv parent total balanced (left p))

/-- The fine-block compatibility predicate for either actual asymmetric axis class map. -/
def pooledCompatible {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (left : P → ShapeAlphabet total) (fine : P → Fin (length+length) → Fin 3) : Prop :=
  SectorCompatible (fun slot => axisClass (childLabels parent balanced left slot)) profile (fineHalves length fine)

omit [Fintype P] in
/-- Splitting fine words commutes with the simultaneous permutation of parent positions. -/
theorem fineHalves_reorder (length : ℕ) (permutation : Equiv.Perm P)
    (fine : P → Fin (length+length) → Fin 3) :
    fineHalves length (reorder permutation fine) =
      reorder (Equiv.sumCongr permutation permutation) (fineHalves length fine) := by
  funext slot position
  cases slot <;> rfl

omit [Fintype P] in
/-- Coarse complementary child labels commute with the same parent-position permutation. -/
theorem childLabels_reorder {total : ℕ} (parent : Shape) (balanced : parent.total = 2*total)
    (permutation : Equiv.Perm P) (left : P → ShapeAlphabet total) :
    childLabels parent balanced (reorder permutation left) =
      reorder (Equiv.sumCongr permutation permutation) (childLabels parent balanced left) := by
  funext slot
  cases slot <;> rfl

omit [Fintype P] in
/-- The actual Y or Z pooled compatibility relation is invariant under joint parent permutations. -/
theorem pooledCompatible_reorder {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (permutation : Equiv.Perm P) (left : P → ShapeAlphabet total)
    (fine : P → Fin (length+length) → Fin 3) :
    pooledCompatible length parent balanced axisClass profile (reorder permutation left) (reorder permutation fine) ↔
      pooledCompatible length parent balanced axisClass profile left fine := by
  unfold pooledCompatible
  rw [fineHalves_reorder, childLabels_reorder]
  exact sectorCompatible_reorder (Equiv.sumCongr permutation permutation)
    (fun slot => axisClass (childLabels parent balanced left slot)) profile (fineHalves length fine)

/-- The actual compatibility word count equals the product of the forced and pooled sector counts. -/
theorem pooledCompatible_card {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ) (left : P → ShapeAlphabet total) :
    Nat.card {fine : P → Fin (length+length) → Fin 3 // pooledCompatible length parent balanced axisClass profile left fine} =
      ∏ sector, Fintype.card (TypedWord (P := {slot : P ⊕ P // axisClass (childLabels parent balanced left slot) = sector})
        (profile sector)) := by
  let equivalence :
      {fine : P → Fin (length+length) → Fin 3 // pooledCompatible length parent balanced axisClass profile left fine} ≃
      {word : P ⊕ P → Fin length → Fin 3 //
        SectorCompatible (fun slot => axisClass (childLabels parent balanced left slot)) profile word} :=
    Equiv.subtypeEquiv (fineHalves length) (fun _ => Iff.rfl)
  rw [Nat.card_congr equivalence]
  simpa only [← Nat.card_eq_fintype_card] using
    sectorCompatible_card (fun slot => axisClass (childLabels parent balanced left slot)) profile

end
end MatrixBounds.Tensor.CW
