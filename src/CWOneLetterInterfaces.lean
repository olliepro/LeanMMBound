import CWConstituents
import WindowedInterface
import ContextRestrictions

/-! A one-letter child has a single fine part on each coarse axis.
Exact and approximate interface restrictions therefore retain its full power. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K]

/-- The complete fine word on a one-letter axis is determined by its coarse label. -/
theorem one_letter_fine {q : ℕ} (label : Fin 3) (entry : AxisVariable q 1 label.val) :
    fineWord entry.val = fun _ => label := by
  have total := fine_part_total entry
  simp only [fineTotal, Fin.sum_univ_one] at total
  funext position
  have positionZero : position = 0 := Subsingleton.elim _ _
  subst position
  exact Fin.ext total

/-- Integer profile of a constant one-letter fine word over a pool of the given size. -/
def oneLetterProfile (label : Fin 3) (size : ℕ) (word : Fin 1 → Fin 3) : ℕ :=
  if word = (fun _ => label) then size else 0

/-- Probability law of the only fine word on a one-letter coarse axis. -/
def oneLetterLaw (label : Fin 3) (word : Fin 1 → Fin 3) : ℝ :=
  if word = (fun _ => label) then 1 else 0

/-- Every family of one-letter coordinates already has its forced exact fine profile. -/
theorem one_letter_hasType {q : ℕ} (label : Fin 3) (entries : P → AxisVariable q 1 label.val) :
    HasType (oneLetterProfile label (Fintype.card P)) (fun p => fineWord (entries p).val) := by
  intro word
  simp only [one_letter_fine, count, oneLetterProfile, Nat.card_eq_fintype_card, Fintype.card_subtype]
  by_cases same : word = (fun _ => label)
  · simp [same]
  · simp [same, eq_comm]

/-- The exact one-letter axis has all coordinate families, with no loss of variables. -/
def oneLetterVariableEquiv {q : ℕ} (label : Fin 3) :
    (P → AxisVariable q 1 label.val) ≃ Interface.Variable (P := P)
      (fun x : AxisVariable q 1 label.val => fineWord x.val) (oneLetterProfile label (Fintype.card P)) where
  toFun entries := ⟨entries, one_letter_hasType label entries⟩
  invFun := Subtype.val
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

/-- The forced one-letter law passes every nonnegative empirical tolerance, including empty pools. -/
theorem one_letter_activeWithin {q : ℕ} (label : Fin 3) (entries : P → AxisVariable q 1 label.val)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    Interface.activeWithin (oneLetterLaw label) tolerance (fun p => fineWord (entries p).val) := by
  by_cases empty : Fintype.card P = 0
  · exact Or.inl empty
  apply Or.inr
  intro word
  rw [one_letter_hasType label entries word]
  have nonzero : (Fintype.card P : ℝ) ≠ 0 := by exact_mod_cast empty
  by_cases same : word = (fun _ => label)
  · simpa [oneLetterProfile, oneLetterLaw, same, nonzero] using nonnegative
  · simpa [oneLetterProfile, oneLetterLaw, same] using nonnegative

/-- All three one-letter empirical windows leave the complete constituent power intact. -/
theorem one_letter_window_identity (q : ℕ) (x y z : Fin 3)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    Interface.windowedPower (K := K) (P := P) (constituent q 1 ⟨x.val, y.val, z.val⟩)
      (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
      (oneLetterLaw x) (oneLetterLaw y) (oneLetterLaw z) tolerance =
      Interface.heterogeneous (fun _ : P => constituent q 1 ⟨x.val, y.val, z.val⟩) := by
  funext left middle right
  exact if_pos ⟨one_letter_activeWithin x left nonnegative,
    one_letter_activeWithin y middle nonnegative, one_letter_activeWithin z right nonnegative⟩

/-- Forced exact one-letter profiles contain the full constituent power in every tensor context. -/
theorem contextReduction_one_letter_exact (q : ℕ) (x y z : Fin 3) :
    ContextReduction.{v} (Interface.exact (K := K) (P := P) (constituent q 1 ⟨x.val, y.val, z.val⟩)
      (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
      (oneLetterProfile x (Fintype.card P)) (oneLetterProfile y (Fintype.card P)) (oneLetterProfile z (Fintype.card P)))
      (Interface.heterogeneous (fun _ : P => constituent q 1 ⟨x.val, y.val, z.val⟩)) 1 :=
  contextReduction_pullback _ (oneLetterVariableEquiv x) (oneLetterVariableEquiv y) (oneLetterVariableEquiv z)

end
end MatrixBounds.Tensor.CW
