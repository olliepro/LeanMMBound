import VerifiedOrbitLevel4
import FineOrbitStatistics
import CWZeroOrbitDimensions

/-! Exact additive statistics of all supplied recursive word orbits. The
identities concern every complete word, rather than just representatives. -/
namespace MatrixBounds.Numeric

open Entropy Tensor.CW
set_option maxRecDepth 100000

namespace OrbitLevel2

/-- Total fine degree at a supplied two-letter orbit. -/
def total : Fin 6 → ℕ := encoding.statistic Fin.val

/-- Number of middle symbols at a supplied two-letter orbit. -/
def middle : Fin 6 → ℕ := encoding.statistic (fun symbol => if symbol = 1 then 1 else 0)

/-- The complete word's degree agrees with its supplied orbit statistic. -/
theorem total_correct (word : Fin 2 → Fin 3) : fineTotal word = total (orbits.label word) :=
  encoding.wordOrbits_statistic oneLetterOrbits Fin.val Fin.val (oneLetterOrbits_statistic _) word

/-- The complete word's middle count agrees with its supplied orbit statistic. -/
theorem middle_correct (word : Fin 2 → Fin 3) : Empirical.count word 1 = middle (orbits.label word) := by
  rw [middle_count_statistic]
  exact encoding.wordOrbits_statistic oneLetterOrbits _ _ (oneLetterOrbits_statistic _) word

/-- Every actual two-letter orbit size divides the fixed expansion denominator. -/
theorem sizes_divide (orbit : Fin 6) : orbits.size orbit ∣ 2 := by
  rw [sizes_correct]
  exact (by decide : ∀ index : Fin 6, sizes index ∣ 2) orbit

end OrbitLevel2

namespace OrbitLevel3

/-- Total fine degree at a supplied four-letter orbit. -/
def total : Fin 21 → ℕ := encoding.statistic OrbitLevel2.total

/-- Number of middle symbols at a supplied four-letter orbit. -/
def middle : Fin 21 → ℕ := encoding.statistic OrbitLevel2.middle

/-- The complete word's degree agrees with its supplied orbit statistic. -/
theorem total_correct (word : Fin 4 → Fin 3) : fineTotal word = total (orbits.label word) :=
  encoding.wordOrbits_statistic OrbitLevel2.orbits Fin.val OrbitLevel2.total OrbitLevel2.total_correct word

/-- The complete word's middle count agrees with its supplied orbit statistic. -/
theorem middle_correct (word : Fin 4 → Fin 3) : Empirical.count word 1 = middle (orbits.label word) := by
  rw [middle_count_statistic]
  apply encoding.wordOrbits_statistic OrbitLevel2.orbits _ OrbitLevel2.middle
  intro child
  rw [← middle_count_statistic]
  exact OrbitLevel2.middle_correct child

/-- Every actual four-letter orbit size divides the fixed expansion denominator. -/
theorem sizes_divide (orbit : Fin 21) : orbits.size orbit ∣ 8 := by
  rw [sizes_correct]
  exact (by decide : ∀ index : Fin 21, sizes index ∣ 8) orbit

end OrbitLevel3

namespace OrbitLevel4

/-- Total fine degree at a supplied eight-letter orbit. -/
def total : Fin 231 → ℕ := encoding.statistic OrbitLevel3.total

/-- Number of middle symbols at a supplied eight-letter orbit. -/
def middle : Fin 231 → ℕ := encoding.statistic OrbitLevel3.middle

/-- The complete word's degree agrees with its supplied orbit statistic. -/
theorem total_correct (word : Fin 8 → Fin 3) : fineTotal word = total (orbits.label word) :=
  encoding.wordOrbits_statistic OrbitLevel3.orbits Fin.val OrbitLevel3.total OrbitLevel3.total_correct word

/-- The complete word's middle count agrees with its supplied orbit statistic. -/
theorem middle_correct (word : Fin 8 → Fin 3) : Empirical.count word 1 = middle (orbits.label word) := by
  rw [middle_count_statistic]
  apply encoding.wordOrbits_statistic OrbitLevel3.orbits _ OrbitLevel3.middle
  intro child
  rw [← middle_count_statistic]
  exact OrbitLevel3.middle_correct child

/-- Every actual eight-letter orbit size divides the fixed expansion denominator. -/
theorem sizes_divide (orbit : Fin 231) : orbits.size orbit ∣ 128 := by
  rw [sizes_correct]
  exact (by decide : ∀ index : Fin 231, sizes index ∣ 128) orbit

end OrbitLevel4
end MatrixBounds.Numeric
