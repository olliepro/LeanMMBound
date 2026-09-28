import CWOneLetterInterfaces
import CWTargetMaps

/-! Canonical exact child profiles for a split into one-letter CW constituents.
The zero-coordinate compatibility identities are proved from the shapes. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The bounded X-coordinate of a coarse child shape. -/
def shapeXIndex {total : ℕ} (child : ShapeAlphabet total) : Fin (total+1) :=
  ⟨child.val.x, by have := shapes_total child.property; unfold Shape.total at this; omega⟩

/-- Complementary one-letter labels have exactly complementary complete fine profiles. -/
theorem oneLetterProfile_complement (left right : Fin 3) (size : ℕ) (total : left.val+right.val = 2)
    (word : Fin 1 → Fin 3) :
    oneLetterProfile right size word = oneLetterProfile left size ((fineComplement 1).symm word) := by
  have equivalent : word = (fun _ => right) ↔ (fineComplement 1).symm word = (fun _ => left) := by
    constructor
    · intro same
      rw [same]
      funext position
      apply Fin.ext
      dsimp [fineComplement, Fin.rev]
      omega
    · intro same
      funext position
      have value := congrArg Fin.val (congrFun same position)
      dsimp [fineComplement, Fin.rev] at value
      apply Fin.ext
      have bound := (word position).isLt
      omega
  simp only [oneLetterProfile, equivalent]

/-- Construct all exact fine profiles of a one-letter split, with compatibility supplied by proofs.
Inputs are a balanced parent and integer coarse/split profiles; output is extraction data. -/
def oneLetterData (parent : Shape) (balanced : parent.total = 4)
    (coarseX coarseY coarseZ : Fin 3 → ℕ) (split : ShapeAlphabet 2 → ℕ) : SplitRestrictionData 1 where
  parent := parent
  balanced := balanced
  coarseX := coarseX
  coarseY := coarseY
  coarseZ := coarseZ
  split := split
  fineX child := oneLetterProfile (shapeXIndex child) (2*split child)
  fineY child := oneLetterProfile (shapeYIndex child) (2*split child)
  fineZ child := oneLetterProfile (shapeZIndex child) (2*split child)
  zeroZ child zero word := oneLetterProfile_complement _ _ _ (by
    have := shapes_total child.property
    dsimp [shapeXIndex, shapeYIndex]
    unfold Shape.total at this
    omega) word
  zeroX child zero word := oneLetterProfile_complement _ _ _ (by
    have := shapes_total child.property
    dsimp [shapeYIndex, shapeZIndex]
    unfold Shape.total at this
    omega) word
  zeroY child zero word := oneLetterProfile_complement _ _ _ (by
    have := shapes_total child.property
    dsimp [shapeXIndex, shapeZIndex]
    unfold Shape.total at this
    omega) word

/-- The constant fine word realizes the canonical one-letter profile at every pool size. -/
def oneLetterRepresentative (label : Fin 3) (size : ℕ) :
    TypedWord (P := Fin size) (oneLetterProfile label size) :=
  ⟨fun _ _ => label, by
    intro word
    simp only [count, oneLetterProfile, Nat.card_eq_fintype_card, Fintype.card_subtype]
    by_cases same : word = (fun _ => label)
    · simp [same]
    · simp [same, eq_comm]⟩

/-- The X target profile of the constructed extraction data is always feasible. -/
def oneLetterRepresentativeX (parent : Shape) (balanced : parent.total = 4)
    (coarseX coarseY coarseZ : Fin 3 → ℕ) (split : ShapeAlphabet 2 → ℕ) :
    (oneLetterData parent balanced coarseX coarseY coarseZ split).TargetParts
      (oneLetterData parent balanced coarseX coarseY coarseZ split).fineX :=
  fun child => oneLetterRepresentative (shapeXIndex child) (2*split child)

/-- The Y target profile of the constructed extraction data is always feasible. -/
def oneLetterRepresentativeY (parent : Shape) (balanced : parent.total = 4)
    (coarseX coarseY coarseZ : Fin 3 → ℕ) (split : ShapeAlphabet 2 → ℕ) :
    (oneLetterData parent balanced coarseX coarseY coarseZ split).TargetParts
      (oneLetterData parent balanced coarseX coarseY coarseZ split).fineY :=
  fun child => oneLetterRepresentative (shapeYIndex child) (2*split child)

/-- The Z target profile of the constructed extraction data is always feasible. -/
def oneLetterRepresentativeZ (parent : Shape) (balanced : parent.total = 4)
    (coarseX coarseY coarseZ : Fin 3 → ℕ) (split : ShapeAlphabet 2 → ℕ) :
    (oneLetterData parent balanced coarseX coarseY coarseZ split).TargetParts
      (oneLetterData parent balanced coarseX coarseY coarseZ split).fineZ :=
  fun child => oneLetterRepresentative (shapeZIndex child) (2*split child)

end
end MatrixBounds.Tensor.CW
