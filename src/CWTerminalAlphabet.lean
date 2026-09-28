import CWCoarseGraph
import Mathlib.Tactic.FinCases

/-! The terminal positive constituent (1,1,2) has exactly four admissible
one-letter child shapes. Its three marginals determine the joint split law. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
open scoped BigOperators
noncomputable section

/-- The representative positive terminal parent shape. Other orientations permute its axes. -/
def parent : Shape := ⟨1, 1, 2⟩

/-- Its actual admissible one-letter CW child alphabet. -/
abbrev Symbol := SplitAlphabet parent 2

/-- Enumerate the four admissible children in the order 002, 011, 101, 110. -/
def symbol : Fin 4 → Symbol := ![
  ⟨⟨⟨0, 0, 2⟩, by decide⟩, by decide⟩,
  ⟨⟨⟨0, 1, 1⟩, by decide⟩, by decide⟩,
  ⟨⟨⟨1, 0, 1⟩, by decide⟩, by decide⟩,
  ⟨⟨⟨1, 1, 0⟩, by decide⟩, by decide⟩]

/-- The four listed children are distinct actual coarse shapes. -/
theorem symbol_injective : Function.Injective symbol := by
  intro left right same
  have hx := congrArg splitX same
  have hy := congrArg splitY same
  fin_cases left <;> fin_cases right <;> simp_all [symbol, splitX, splitY]

/-- Every admissible child of the terminal constituent is one of the four listed shapes. -/
theorem symbol_surjective : Function.Surjective symbol := by
  intro child
  have total := shapes_total child.val.property
  have fits := child.property
  rcases child with ⟨⟨⟨x, y, z⟩, present⟩, fits⟩
  dsimp [Shape.Fits, parent, Shape.total] at fits total
  have boundX : x ≤ 1 := fits.1
  have boundY : y ≤ 1 := fits.2.1
  interval_cases x <;> interval_cases y
  · refine ⟨0, ?_⟩
    have : z = 2 := by omega
    subst z
    rfl
  · refine ⟨1, ?_⟩
    have : z = 1 := by omega
    subst z
    rfl
  · refine ⟨2, ?_⟩
    have : z = 1 := by omega
    subst z
    rfl
  · refine ⟨3, ?_⟩
    have : z = 0 := by omega
    subst z
    rfl

/-- The actual terminal split alphabet is equivalent to four explicit symbols. -/
def symbolEquiv : Fin 4 ≃ Symbol := Equiv.ofBijective symbol ⟨symbol_injective, symbol_surjective⟩

/-- The actual terminal split support has precisely four elements. -/
theorem symbol_card : Fintype.card Symbol = 4 := by
  simpa only [Fintype.card_fin] using (Fintype.card_congr symbolEquiv).symm

local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Three coordinate marginals uniquely determine a terminal joint profile, for counts or real masses. -/
theorem joint_of_marginals {R : Type*} [AddCancelCommMonoid R] (left right : Symbol → R)
    (sameX : ∀ value : Fin 3, (∑ child, if splitXIndex child = value then left child else 0) =
      ∑ child, if splitXIndex child = value then right child else 0)
    (sameY : ∀ value : Fin 3, (∑ child, if splitYIndex child = value then left child else 0) =
      ∑ child, if splitYIndex child = value then right child else 0)
    (sameZ : ∀ value : Fin 3, (∑ child, if splitZIndex child = value then left child else 0) =
      ∑ child, if splitZIndex child = value then right child else 0) : left = right := by
  have hx := sameX 0
  have hy := sameY 0
  have hz0 := sameZ 0
  have hz2 := sameZ 2
  simp only [← symbolEquiv.sum_comp] at hx hy hz0 hz2
  norm_num [symbolEquiv, symbol, splitXIndex, splitYIndex, splitZIndex, splitX, splitY, splitZ,
    Fin.sum_univ_succ, Fin.ext_iff] at hx hy hz0 hz2
  funext child
  obtain ⟨index, rfl⟩ := symbol_surjective child
  fin_cases index
  · exact hz2
  · exact add_left_cancel (hz2 ▸ hx)
  · exact add_left_cancel (hz2 ▸ hy)
  · exact hz0

end
end MatrixBounds.Tensor.CW.Terminal
