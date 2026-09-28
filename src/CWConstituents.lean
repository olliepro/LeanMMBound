import CWFineCompatibility
import SplitData
import ExactInterface

/-! Actual coarse CW constituents and their finite fine-block partitions.
Numerical shape data now names explicit coefficient tensors and variable sets. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- One axis of a coarse CW constituent consists of words with the prescribed total label. -/
abbrev AxisVariable (q length total : ℕ) :=
  {word : Fin length → Fin (q+2) // wordCoarse word = total}

/-- The coarse constituent tensor is the source CW power restricted on all three axes. -/
def constituent {K : Type*} [CommRing K] (q length : ℕ) (shape : Numeric.Shape) :
    Coeff K (AxisVariable q length shape.x) (AxisVariable q length shape.y) (AxisVariable q length shape.z) :=
  fun x y z => wordPower (tensor q) length x.val y.val z.val

/-- Restrict the explicit CW power degeneration to any prescribed coarse constituent. -/
def constituentCertificate {K : Type*} [CommRing K] (q length : ℕ) (shape : Numeric.Shape) :
    Degeneration.Certificate (constituent (K := K) q length shape) ((q+2)^length) (3*length) :=
  ((certificate q).wordPower length).pullback Subtype.val Subtype.val Subtype.val

/-- Nonzero coarse constituents have the required total shape, as a property of actual coefficients. -/
theorem constituent_support {K : Type*} [CommRing K] {q length : ℕ} {shape : Numeric.Shape}
    (x : AxisVariable q length shape.x) (y : AxisVariable q length shape.y) (z : AxisVariable q length shape.z)
    (nonzero : constituent (K := K) q length shape x y z ≠ 0) : shape.total = 2*length := by
  have support := word_support_total x.val y.val z.val nonzero
  simpa only [x.property, y.property, z.property, Numeric.Shape.total] using support

/-- Sum of the symbols in a finite fine-block label word. -/
def fineTotal {length : ℕ} (word : Fin length → Fin 3) : ℕ := ∑ position, (word position).val

/-- Fine labels of a coarse constituent axis have exactly the axis total. -/
theorem fine_part_total {q length total : ℕ} (entry : AxisVariable q length total) :
    fineTotal (fineWord entry.val) = total := entry.property

/-- A canonical coordinate realizing each coarse symbol when the middle CW class is nonempty. -/
def liftFine (q : ℕ) (symbol : Fin 3) : Fin (q+2) :=
  if symbol = 0 then 0 else if symbol = 1 then ⟨1, by omega⟩ else ⟨q+1, by omega⟩

/-- Every fine symbol is realized by the canonical coordinate in a nonempty CW middle class. -/
theorem fineLabel_lift {q : ℕ} (positive : 0 < q) (symbol : Fin 3) : fineLabel (liftFine q symbol) = symbol := by
  have middle : coarse (1 : Fin (q+2)) = 1 := coarse_middle ⟨0, positive⟩
  fin_cases symbol <;> apply Fin.ext <;> simp [liftFine, fineLabel, coarse_zero, coarse_extreme, middle]

/-- A valid fine-block word lifts to an actual coarse constituent variable. -/
def liftFineWord {q length total : ℕ} (positive : 0 < q) (word : Fin length → Fin 3)
    (supported : fineTotal word = total) : AxisVariable q length total :=
  ⟨fun position => liftFine q (word position), by
    change (∑ position, (fineLabel (liftFine q (word position))).val) = total
    simpa only [fineLabel_lift positive] using supported⟩

/-- The lifted variable has precisely the requested complete fine-block label. -/
theorem fineWord_lift {q length total : ℕ} (positive : 0 < q) (word : Fin length → Fin 3)
    (supported : fineTotal word = total) : fineWord (liftFineWord positive word supported).val = word := by
  funext position
  exact fineLabel_lift positive (word position)

/-- A constituent's fine-block partition contains every supported fine word. -/
theorem fine_part_surjective {q length total : ℕ} (positive : 0 < q) :
    Function.Surjective (fun entry : AxisVariable q length total =>
      (⟨fineWord entry.val, fine_part_total entry⟩ : {word : Fin length → Fin 3 // fineTotal word = total})) := by
  intro word
  exact ⟨liftFineWord positive word.val word.property, Subtype.ext (fineWord_lift positive word.val word.property)⟩

end
end MatrixBounds.Tensor.CW
