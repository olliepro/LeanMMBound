module

public import CWTerminalCoarse
public import CWOneLetterData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Integer terminal profiles are instantiated as actual CW extraction data,
with feasible graph edges and all three exact child interfaces constructed. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Extend the four-symbol terminal profile by zero to all one-letter child shapes. -/
def fullProfile (profile : Symbol → ℕ) (child : ShapeAlphabet 2) : ℕ :=
  if fits : child.val.Fits parent then profile ⟨child, fits⟩ else 0

/-- The full terminal profile restricts to the original four-symbol counts. -/
theorem fullProfile_supported (profile : Symbol → ℕ) (child : Symbol) :
    fullProfile profile child.val = profile child := by
  simp only [fullProfile, dif_pos child.property]

/-- Every excluded one-letter shape has zero prescribed count. -/
theorem fullProfile_outside (profile : Symbol → ℕ) (child : ShapeAlphabet 2) (outside : ¬child.val.Fits parent) :
    fullProfile profile child = 0 := by simp only [fullProfile, dif_neg outside]

/-- Actual terminal extraction data with its canonical forced fine profiles. -/
def data (profile : Symbol → ℕ) : SplitRestrictionData 1 :=
  oneLetterData parent (by decide) (marginalProfile profile splitXIndex)
    (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex) (fullProfile profile)

/-- Every terminal marginal graph edge is prescribed in the full six-shape alphabet. -/
theorem all_edges_prescribed (profile : Symbol → ℕ) (edge : (data profile).Edges (P := P)) :
    (data profile).prescribed edge := by
  have typed := terminal_marginals_force_type profile edge
  intro child
  by_cases fits : child.val.Fits parent
  · change count (fun p => (edge.val p).val) child = fullProfile profile child
    rw [count_subtype_val (fun child : ShapeAlphabet 2 => child.val.Fits parent) edge.val ⟨child, fits⟩]
    exact (typed ⟨child, fits⟩).trans (fullProfile_supported profile ⟨child, fits⟩).symm
  · change count (fun p => (edge.val p).val) child = fullProfile profile child
    rw [count_subtype_outside (fun child : ShapeAlphabet 2 => child.val.Fits parent) edge.val child fits,
      fullProfile_outside profile child fits]

/-- A word of the four-symbol type provides a feasible reference for the actual extraction theorem. -/
def reference (profile : Symbol → ℕ) (word : TypedWord (P := P) profile) :
    (data profile).PrescribedEdges (P := P) :=
  ⟨(terminalGraphEquiv profile).symm word, all_edges_prescribed profile ((terminalGraphEquiv profile).symm word)⟩

/-- The complete terminal graph and the prescribed-edge graph have exactly the same vertices and edges. -/
def prescribedEquiv (profile : Symbol → ℕ) :
    (data profile).Edges (P := P) ≃ (data profile).PrescribedEdges (P := P) where
  toFun edge := ⟨edge, all_edges_prescribed profile edge⟩
  invFun := Subtype.val
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

/-- All X child pools of the terminal extraction have an explicit fine-type representative. -/
def representativeX (profile : Symbol → ℕ) : (data profile).TargetParts (data profile).fineX :=
  oneLetterRepresentativeX _ _ _ _ _ _

/-- All Y child pools of the terminal extraction have an explicit fine-type representative. -/
def representativeY (profile : Symbol → ℕ) : (data profile).TargetParts (data profile).fineY :=
  oneLetterRepresentativeY _ _ _ _ _ _

/-- All Z child pools of the terminal extraction have an explicit fine-type representative. -/
def representativeZ (profile : Symbol → ℕ) : (data profile).TargetParts (data profile).fineZ :=
  oneLetterRepresentativeZ _ _ _ _ _ _

end
end MatrixBounds.Tensor.CW.Terminal
