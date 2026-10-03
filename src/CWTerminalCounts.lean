module

public import CWTerminalData
public import TypeDenominators

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Symmetric terminal split counts and their feasible reference words.
Both endpoint profiles are included in the same exact integer construction. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
open scoped BigOperators
noncomputable section

/-- Counts a,b,b,a on the four terminal child shapes; either count may be zero. -/
def counts (extreme middle : ℕ) (child : Symbol) : ℕ :=
  if splitZIndex child = 1 then middle else extreme

/-- The complete terminal type occupies exactly twice the sum of its two independent counts. -/
theorem counts_total (extreme middle : ℕ) : (∑ child, counts extreme middle child) = 2*(extreme+middle) := by
  rw [← symbolEquiv.sum_comp]
  norm_num [symbolEquiv, symbol, counts, splitZIndex, splitZ, Fin.sum_univ_succ, Fin.ext_iff]
  omega

local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Full-alphabet counts have the expected value on admissible shapes and vanish elsewhere. -/
theorem fullCounts_formula (extreme middle : ℕ) (child : ShapeAlphabet 2) :
    fullProfile (counts extreme middle) child =
      if child.val.Fits parent then (if child.val.z = 1 then middle else extreme) else 0 := by
  by_cases fits : child.val.Fits parent
  · simp [fullProfile, counts, fits, splitZIndex, splitZ, Fin.ext_iff]
  · simp [fullProfile, fits]

/-- The actual complete terminal split data has complementary symmetry, including zero counts. -/
theorem counts_symmetric (extreme middle : ℕ) : (data (counts extreme middle)).Symmetric := by
  intro child
  change fullProfile (counts extreme middle) (complementSymbol parent 2 (by decide) child) =
    fullProfile (counts extreme middle) child
  by_cases fits : child.val.Fits parent
  · rw [complementSymbol, dif_pos fits, fullCounts_formula, fullCounts_formula]
    have complementFits := (Shape.complement_involution fits).1
    simp only [complementFits, fits, if_true]
    have zBound : child.val.z ≤ 2 := fits.2.2
    dsimp [Shape.complement, parent]
    have same : 2-child.val.z = 1 ↔ child.val.z = 1 := by omega
    simp only [same]
  · simp only [complementSymbol, dif_neg fits]

/-- There is an actual terminal word with every nonnegative choice of the two independent counts. -/
theorem counts_feasible (extreme middle : ℕ) :
    Nonempty (TypedWord (P := Fin (2*(extreme+middle))) (counts extreme middle)) := by
  have feasible := profile_feasible (counts extreme middle)
  rwa [counts_total] at feasible

/-- Choose a finite prescribed edge of the actual terminal extraction data. -/
def countsReference (extreme middle : ℕ) :
    (data (counts extreme middle)).PrescribedEdges (P := Fin (2*(extreme+middle))) :=
  reference _ (counts_feasible extreme middle).some

end
end MatrixBounds.Tensor.CW.Terminal
