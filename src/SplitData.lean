import DyadicData

/-! Exact support and complement-symmetry checks for the split distributions
in the supplied numerical certificate. -/
namespace MatrixBounds.Numeric

/-- Three nonnegative coarse coordinates of a matrix-multiplication constituent. -/
structure Shape where
  x : ℕ
  y : ℕ
  z : ℕ
  deriving DecidableEq, Inhabited

/-- Sum of a constituent's coarse coordinates. -/
def Shape.total (shape : Shape) : ℕ := shape.x + shape.y + shape.z

/-- Componentwise containment is the exact condition for an admissible left-child shape. -/
def Shape.Fits (child parent : Shape) : Prop :=
  child.x ≤ parent.x ∧ child.y ≤ parent.y ∧ child.z ≤ parent.z

instance (child parent : Shape) : Decidable (child.Fits parent) := inferInstanceAs
  (Decidable (child.x ≤ parent.x ∧ child.y ≤ parent.y ∧ child.z ≤ parent.z))

/-- The right-child coarse coordinates are the parent coordinates minus the left child's. -/
def Shape.complement (parent child : Shape) : Shape :=
  ⟨parent.x-child.x, parent.y-child.y, parent.z-child.z⟩

/-- Enumerate all coarse shapes of a fixed total in the certificate's lexicographic order. -/
def shapes (total : ℕ) : List Shape :=
  (List.range (total+1)).flatMap (fun x =>
    (List.range (total-x+1)).map (fun y => ⟨x, y, total-x-y⟩))

/-- Every enumerated shape has the intended total. -/
theorem shapes_total {total : ℕ} {shape : Shape} (present : shape ∈ shapes total) : shape.total = total := by
  simp only [shapes, List.mem_flatMap, List.mem_range, List.mem_map] at present
  obtain ⟨x, hx, y, hy, rfl⟩ := present
  simp only [Shape.total]
  omega

/-- Admissible complements stay within the parent and complementing twice recovers the child. -/
theorem Shape.complement_involution {parent child : Shape} (fits : child.Fits parent) :
    (parent.complement child).Fits parent ∧ parent.complement (parent.complement child) = child := by
  obtain ⟨hx, hy, hz⟩ := fits
  constructor
  · exact ⟨Nat.sub_le _ _, Nat.sub_le _ _, Nat.sub_le _ _⟩
  · cases parent
    cases child
    simp only [complement, mk.injEq]
    dsimp at hx hy hz
    omega

/-- One contextual split distribution, with its parent and the common child coordinate total. -/
structure SplitRow where
  parent : Shape
  childTotal : ℕ
  row : DyadicRow

/-- Look up a shape's exact numerator by summing its listed column entries. -/
def SplitRow.massAt (data : SplitRow) (shape : Shape) : ℕ :=
  (data.row.entries.map (fun entry =>
    if (shapes data.childTotal)[entry.1]? = some shape then entry.2 else 0)).sum

/-- Check each nonzero sparse entry is admissible and has an equal complementary mass. -/
def SplitRow.check (data : SplitRow) (denominator : ℕ) : Bool :=
  data.row.check denominator && decide (data.row.width = (shapes data.childTotal).length) &&
    decide (data.parent.total = 2*data.childTotal) &&
    (shapes data.childTotal).all (fun child =>
      decide (data.massAt child = 0 ∨ child.Fits data.parent) &&
      decide (data.massAt child = data.massAt (data.parent.complement child)))

/-- Accepted split data has correct dimensions, normalized mass, admissible support, and symmetry. -/
theorem SplitRow.check_sound {data : SplitRow} {denominator : ℕ} (checked : data.check denominator = true) :
    data.row.check denominator = true ∧ data.row.width = (shapes data.childTotal).length ∧
      data.parent.total = 2*data.childTotal ∧
      ∀ child ∈ shapes data.childTotal,
        (data.massAt child ≠ 0 → child.Fits data.parent) ∧
          data.massAt child = data.massAt (data.parent.complement child) := by
  simp only [check, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at checked
  obtain ⟨⟨⟨row, width⟩, total⟩, entries⟩ := checked
  refine ⟨row, width, total, ?_⟩
  intro child present
  obtain ⟨support, symmetry⟩ := entries child present
  exact ⟨fun nonzero => support.resolve_left nonzero, symmetry⟩

end MatrixBounds.Numeric
