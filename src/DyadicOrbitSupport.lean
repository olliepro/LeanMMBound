import DyadicData
import OrbitRationalProfiles

/-! Executable sparse-row support checks are sufficient for the support of
every complete decoded fine word, including zero-coordinate matrix leaves. -/
namespace MatrixBounds.Numeric.DyadicRow

open scoped BigOperators

/-- Check the declared statistic of each nonzero supplied orbit entry. -/
def supportCheck (row : DyadicRow) (statistic : ℕ → ℕ) (target : ℕ) : Bool :=
  row.entries.all (fun entry => decide (statistic entry.1 = target))

/-- An accepted sparse support check gives zero numerator at every excluded orbit column. -/
theorem supportCheck_sound {row : DyadicRow} {statistic : ℕ → ℕ} {target : ℕ}
    (checked : row.supportCheck statistic target = true) (column : ℕ)
    (outside : statistic column ≠ target) : row.atColumn column = 0 := by
  have supported : ∀ entry ∈ row.entries, statistic entry.1 = target := by
    simpa only [supportCheck, List.all_eq_true, decide_eq_true_eq] using checked
  unfold atColumn
  apply List.sum_eq_zero
  intro value present
  obtain ⟨entry, entryPresent, rfl⟩ := List.mem_map.mp present
  have different : entry.1 ≠ column := by
    intro same
    exact outside (same ▸ supported entry entryPresent)
  simp only [different, if_false]

/-- Read a sparse supplied row on a specified finite orbit alphabet. -/
def orbitNumerator {orbits : ℕ} (row : DyadicRow) (orbit : Fin orbits) : ℕ := row.atColumn orbit.val

/-- Checked row width and mass normalize the exact numerator function on its intended orbit alphabet. -/
theorem orbitNumerator_total {orbits denominator : ℕ} (row : DyadicRow)
    (width : row.width = orbits) (checked : row.check denominator = true) :
    (∑ orbit : Fin orbits, row.orbitNumerator orbit) = denominator := by
  cases width
  exact (row.sum_columns (check_sound checked).1).trans (check_sound checked).2

/-- A checked supplied support statistic gives the precise support required by the actual orbit partition. -/
theorem orbitNumerator_support {orbits target : ℕ} (row : DyadicRow)
    (statistic : ℕ → ℕ) (orbitStatistic : Fin orbits → ℕ)
    (agrees : ∀ orbit, statistic orbit.val = orbitStatistic orbit)
    (checked : row.supportCheck statistic target = true) (orbit : Fin orbits)
    (outside : orbitStatistic orbit ≠ target) : row.orbitNumerator orbit = 0 :=
  supportCheck_sound checked orbit.val (by simpa only [agrees orbit] using outside)

end MatrixBounds.Numeric.DyadicRow
