module

public import CWCoarseHalves
public import RegularFibers
public import HashIntegerWords
public import TypePartition

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete coarse graph of an actual CW constituent power. Its alphabet
contains exactly the admissible child shapes, so Gibbs counting uses the right support. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- The finite child support consists of shapes of the required total that fit the parent. -/
abbrev SplitAlphabet (parent : Shape) (total : ℕ) :=
  {child : ShapeAlphabet total // child.val.Fits parent}

/-- Natural X-coordinate of an admissible child. -/
def splitX {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : ℕ := child.val.val.x

/-- Natural Y-coordinate of an admissible child. -/
def splitY {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : ℕ := child.val.val.y

/-- Natural Z-coordinate of an admissible child. -/
def splitZ {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : ℕ := child.val.val.z

/-- Bounded X-coordinate in the finite coarse marginal alphabet. -/
def splitXIndex {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : Fin (total+1) :=
  ⟨splitX child, by have := shapes_total child.val.property; unfold Shape.total at this; dsimp [splitX]; omega⟩

/-- Bounded Y-coordinate in the finite coarse marginal alphabet. -/
def splitYIndex {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : Fin (total+1) :=
  ⟨splitY child, by have := shapes_total child.val.property; unfold Shape.total at this; dsimp [splitY]; omega⟩

/-- Bounded Z-coordinate in the finite coarse marginal alphabet. -/
def splitZIndex {parent : Shape} {total : ℕ} (child : SplitAlphabet parent total) : Fin (total+1) :=
  ⟨splitZ child, by have := shapes_total child.val.property; unfold Shape.total at this; dsimp [splitZ]; omega⟩

/-- Coarse edges are precisely admissible child words satisfying the three marginal profiles. -/
abbrev CoarseWords (parent : Shape) (total : ℕ) (profileX profileY profileZ : Fin (total+1) → ℕ) :=
  MarginalWords (P := P) (@splitXIndex parent total) splitYIndex splitZIndex profileX profileY profileZ

/-- Read the three natural coordinate words from an admissible child word. -/
def splitWordEdge {parent : Shape} {total : ℕ} (word : P → SplitAlphabet parent total) : CoarseEdge ℕ P :=
  ⟨fun position => splitX (word position), fun position => splitY (word position),
    fun position => splitZ (word position)⟩

omit [CommRing K] [Fintype P] in
/-- Every word over this alphabet satisfies the exact coarse support equations. -/
theorem splitWordEdge_valid {parent : Shape} {total : ℕ} (word : P → SplitAlphabet parent total) (position : P) :
    (splitWordEdge word).x position + (splitWordEdge word).y position + (splitWordEdge word).z position = total :=
  shapes_total (word position).val.property

omit [CommRing K] [Fintype P] in
/-- The coordinate triple records the entire admissible word without duplicates. -/
theorem splitWordEdge_injective {parent : Shape} {total : ℕ} :
    Function.Injective (@splitWordEdge P parent total) := by
  intro left right same
  funext position
  apply Subtype.ext
  apply Subtype.ext
  have hx := congrArg (fun edge => edge.x position) same
  have hy := congrArg (fun edge => edge.y position) same
  have hz := congrArg (fun edge => edge.z position) same
  cases hleft : (left position).val.val
  cases hright : (right position).val.val
  simp only [splitWordEdge, splitX, splitY, splitZ, hleft, hright] at hx hy hz
  simp only [hx, hy, hz]

omit [CommRing K] [Fintype P] in
/-- Both X and Y coordinates determine the admissible word because the total fixes Z. -/
theorem splitWord_xy_injective {parent : Shape} {total : ℕ} {left right : P → SplitAlphabet parent total}
    (sameX : (splitWordEdge left).x = (splitWordEdge right).x)
    (sameY : (splitWordEdge left).y = (splitWordEdge right).y) : left = right := by
  apply splitWordEdge_injective
  have sameZ : (splitWordEdge left).z = (splitWordEdge right).z := by
    funext position
    have hl := splitWordEdge_valid left position
    have hr := splitWordEdge_valid right position
    rw [sameX, sameY] at hl
    omega
  cases hl : splitWordEdge left
  cases hr : splitWordEdge right
  simp only [hl, hr] at sameX sameY sameZ
  cases sameX
  cases sameY
  cases sameZ
  rfl

omit [CommRing K] [Fintype P] in
/-- X and Z also determine the full admissible word through its fixed coordinate total. -/
theorem splitWord_xz_injective {parent : Shape} {total : ℕ} {left right : P → SplitAlphabet parent total}
    (sameX : (splitWordEdge left).x = (splitWordEdge right).x)
    (sameZ : (splitWordEdge left).z = (splitWordEdge right).z) : left = right := by
  apply splitWord_xy_injective sameX
  funext position
  have hl := splitWordEdge_valid left position
  have hr := splitWordEdge_valid right position
  rw [sameX, sameZ] at hl
  omega

omit [CommRing K] [Fintype P] in
/-- A modulus exceeding the child total prevents aliasing of every coarse coordinate. -/
theorem splitWord_small {parent : Shape} {total modulus : ℕ} (word : P → SplitAlphabet parent total)
    (large : total < modulus) (position : P) :
    (splitWordEdge word).x position < modulus ∧ (splitWordEdge word).y position < modulus ∧
      (splitWordEdge word).z position < modulus := by
  have support := splitWordEdge_valid word position
  omega

/-- The parent tensor product restricted to prescribed left-child coarse marginal types. -/
def coarseFiltered (q length : ℕ) (parent : Shape) (profileX profileY profileZ : Fin (2*length+1) → ℕ) :=
  acceptedTensor (fun (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y) (z : P → AxisVariable q (length+length) parent.z) =>
      ∏ position, constituent (K := K) q (length+length) parent (x position) (y position) (z position))
    (fun x position => wordCoarseIndex (leftHalf (x position).val))
    (fun y position => wordCoarseIndex (leftHalf (y position).val))
    (fun z position => wordCoarseIndex (leftHalf (z position).val))
    (HasType profileX) (HasType profileY) (HasType profileZ)

/-- Every nonzero filtered coefficient has an edge in the complete finite marginal graph. -/
theorem coarseFiltered_complete (q length : ℕ) (parent : Shape) (profileX profileY profileZ : Fin (2*length+1) → ℕ)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (nonzero : coarseFiltered (K := K) q length parent profileX profileY profileZ x y z ≠ 0) :
    ∃ word : CoarseWords (P := P) parent (2*length) profileX profileY profileZ,
      (splitWordEdge word.val).x = (fun position => wordCoarse (leftHalf (x position).val)) ∧
      (splitWordEdge word.val).y = (fun position => wordCoarse (leftHalf (y position).val)) ∧
      (splitWordEdge word.val).z = (fun position => wordCoarse (leftHalf (z position).val)) := by
  unfold coarseFiltered acceptedTensor at nonzero
  split_ifs at nonzero with typed
  · have factors (position : P) : constituent (K := K) q (length+length) parent
        (x position) (y position) (z position) ≠ 0 := by
      intro zero
      exact nonzero (Finset.prod_eq_zero (Finset.mem_univ position) zero)
    let word : P → SplitAlphabet parent (2*length) := fun position =>
      ⟨actualLeftSymbol parent (x position) (y position) (z position) (factors position),
        leftShape_fits parent (x position) (y position) (z position)⟩
    refine ⟨⟨word, ?_⟩, rfl, rfl, rfl⟩
    exact typed
  · exact (nonzero rfl).elim

end
end MatrixBounds.Tensor.CW
