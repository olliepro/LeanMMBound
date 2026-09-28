import SeparatedPoolEntropy
import CWCompatibilityNecessary

/-! The actual asymmetric CW class maps have exactly the separate-child and
ordinary-coordinate pool decomposition used by the supplied rate computation. -/
namespace MatrixBounds.Tensor.CW

open Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Actual Y compatibility is precisely separate zero-Z labels plus ordinary Y-coordinate pools. -/
theorem yClass_separated {total : ℕ} :
    (yClass : ShapeAlphabet total → CompatibilityClass total) =
      separatedClass (fun child : ShapeAlphabet total => child.val.z = 0) shapeYIndex := by
  funext child
  simp only [yClass, separatedClass]
  split_ifs <;> rfl

/-- Actual Z compatibility is precisely separate zero-X/zero-Y labels plus ordinary Z-coordinate pools. -/
theorem zClass_separated {total : ℕ} :
    (zClass : ShapeAlphabet total → CompatibilityClass total) =
      separatedClass (fun child : ShapeAlphabet total => child.val.x = 0 ∨ child.val.y = 0) shapeZIndex := by
  funext child
  simp only [zClass, separatedClass]
  split_ifs <;> rfl

variable {total : ℕ} {Word : Type*} [Fintype Word]

/-- Every actual Y-sector penalty has the verifier's exact separately weighted and pooled entropy formula. -/
theorem y_sector_entropy (weight : ShapeAlphabet total → ℝ) (law : ShapeAlphabet total → Word → ℝ)
    (normalized : ∀ child, weight child ≠ 0 → ∑ word, law child word = 1) :
    (∑ sector : CompatibilityClass total, massEntropy (fun word =>
      ∑ child, if yClass child = sector then weight child*law child word else 0)) =
      (∑ child, if child.val.z = 0 then weight child*entropy (law child) else 0)+
      ∑ label : Fin (total+1), massEntropy (fun word =>
        ∑ child, if child.val.z ≠ 0 ∧ shapeYIndex child = label then weight child*law child word else 0) := by
  have result := separatedPool_entropy (fun child : ShapeAlphabet total => child.val.z = 0) shapeYIndex weight law normalized
  unfold separatedPool at result
  simp only [← yClass_separated] at result
  convert result using 1
  congr 1
  · apply Finset.sum_congr rfl
    intro child _
    split_ifs <;> rfl
  · apply Finset.sum_congr rfl
    intro label _
    congr 1
    funext word
    apply Finset.sum_congr rfl
    intro child _
    split_ifs <;> rfl

/-- Every actual Z-sector penalty has the verifier's exact separately weighted and pooled entropy formula. -/
theorem z_sector_entropy (weight : ShapeAlphabet total → ℝ) (law : ShapeAlphabet total → Word → ℝ)
    (normalized : ∀ child, weight child ≠ 0 → ∑ word, law child word = 1) :
    (∑ sector : CompatibilityClass total, massEntropy (fun word =>
      ∑ child, if zClass child = sector then weight child*law child word else 0)) =
      (∑ child, if child.val.x = 0 ∨ child.val.y = 0 then weight child*entropy (law child) else 0)+
      ∑ label : Fin (total+1), massEntropy (fun word =>
        ∑ child, if ¬(child.val.x = 0 ∨ child.val.y = 0) ∧ shapeZIndex child = label then weight child*law child word else 0) := by
  have result := separatedPool_entropy (fun child : ShapeAlphabet total => child.val.x = 0 ∨ child.val.y = 0)
    shapeZIndex weight law normalized
  unfold separatedPool at result
  simp only [← zClass_separated] at result
  convert result using 1
  congr 1
  · apply Finset.sum_congr rfl
    intro child _
    split_ifs <;> rfl
  · apply Finset.sum_congr rfl
    intro label _
    congr 1
    funext word
    apply Finset.sum_congr rfl
    intro child _
    split_ifs <;> rfl

end
end MatrixBounds.Tensor.CW
