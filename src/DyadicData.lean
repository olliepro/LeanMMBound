import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum

/-! Sparse integer data for exact dyadic distributions. Executable row checks
are connected to real nonnegativity and normalization by theorems below. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- A sparse row records column indices and nonnegative integer numerators. -/
structure DyadicRow where
  width : ℕ
  entries : List (ℕ × ℕ)
  deriving DecidableEq

/-- Exact total numerator mass in the row. -/
def DyadicRow.mass (row : DyadicRow) : ℕ := (row.entries.map Prod.snd).sum

/-- Numerator mass at one column; repeated columns are interpreted additively. -/
def DyadicRow.atColumn (row : DyadicRow) (column : ℕ) : ℕ :=
  (row.entries.map (fun entry => if entry.1 = column then entry.2 else 0)).sum

/-- An executable row check tests support bounds and exact total mass. -/
def DyadicRow.check (row : DyadicRow) (denominator : ℕ) : Bool :=
  row.entries.all (fun entry => decide (entry.1 < row.width)) && decide (row.mass = denominator)

/-- Boolean validation gives explicit support and normalization facts. -/
theorem DyadicRow.check_sound {row : DyadicRow} {denominator : ℕ}
    (checked : row.check denominator = true) :
    (∀ entry ∈ row.entries, entry.1 < row.width) ∧ row.mass = denominator := by
  simpa [check, List.all_eq_true] using checked

/-- Summing sparse column masses recovers the row's total when all columns are in range. -/
theorem DyadicRow.sum_columns (row : DyadicRow)
    (support : ∀ entry ∈ row.entries, entry.1 < row.width) :
    (∑ i : Fin row.width, row.atColumn i.val) = row.mass := by
  rcases row with ⟨width, entries⟩
  dsimp at *
  induction entries with
  | nil => simp [atColumn, mass]
  | cons entry entries ih =>
    have first : entry.1 < width := support entry (by simp)
    have rest : ∀ e ∈ entries, e.1 < width := fun e he => support e (by simp [he])
    have point : (∑ i : Fin width, if entry.1 = i.val then entry.2 else 0) = entry.2 := by
      rw [Finset.sum_eq_single (⟨entry.1, first⟩ : Fin width)]
      · simp
      · intro i _ h
        have different : entry.1 ≠ i.val := by
          intro equal
          apply h
          exact Fin.ext equal.symm
        simp [different]
      · simp
    simpa only [atColumn, mass, List.map_cons, List.sum_cons, Finset.sum_add_distrib,
      point] using congrArg (fun n => entry.2 + n) (ih rest)

/-- Interpret the exact integer row as real probabilities with a specified denominator. -/
noncomputable def DyadicRow.probability (row : DyadicRow) (denominator : ℕ)
    (column : Fin row.width) : ℝ := (row.atColumn column.val : ℝ) / denominator

/-- Accepted dyadic data defines a normalized nonnegative real probability vector. -/
theorem DyadicRow.probability_valid {row : DyadicRow} {denominator : ℕ}
    (positive : 0 < denominator) (checked : row.check denominator = true) :
    (∀ i, 0 ≤ row.probability denominator i) ∧ ∑ i, row.probability denominator i = 1 := by
  obtain ⟨support, total⟩ := check_sound checked
  constructor
  · intro i
    exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · unfold probability
    rw [← Finset.sum_div, ← Nat.cast_sum, sum_columns row support, total]
    exact div_self (by exact_mod_cast Nat.ne_of_gt positive)

end MatrixBounds.Numeric
