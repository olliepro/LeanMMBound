module

public import PooledEntropy
public import CWPooledDegrees

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Entropy rates derived from actual finite incidence counts. The coarse edge
count cancels, leaving compatibility entropy minus the parent fine-type entropy. -/
namespace MatrixBounds.Selection

/-- An integer incidence inequality and two log bounds give the pointwise competitor rate. -/
theorem incidence_exponential_rate {blocks edges compatible degree : ℕ}
    (blocksPositive : 0 < blocks) (edgesPositive : 0 < edges) (compatiblePositive : 0 < compatible)
    (incidence : blocks*degree ≤ edges*compatible) {lower upper : ℝ}
    (blockBound : lower ≤ Real.log blocks) (compatibleBound : Real.log compatible ≤ upper) :
    (degree : ℝ)/edges ≤ Real.exp (upper-lower) := by
  have positiveB : (0 : ℝ) < blocks := by exact_mod_cast blocksPositive
  have positiveE : (0 : ℝ) < edges := by exact_mod_cast edgesPositive
  have positiveC : (0 : ℝ) < compatible := by exact_mod_cast compatiblePositive
  calc
    _ ≤ (compatible : ℝ)/blocks := by
      rw [div_le_div_iff₀ positiveE positiveB]
      exact_mod_cast (show degree*blocks ≤ compatible*edges by simpa only [Nat.mul_comm] using incidence)
    _ = Real.exp (Real.log compatible-Real.log blocks) := by
      rw [Real.exp_sub, Real.exp_log positiveC, Real.exp_log positiveB]
    _ ≤ Real.exp (upper-lower) := Real.exp_le_exp.mpr (by linarith)

end MatrixBounds.Selection

namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- The finite CW compatibility degree has the predicted entropy exponent, with explicit errors.
It bounds each parent fine block individually and includes empty compatibility sectors. -/
theorem compatibleFine_entropy_rate {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (axisIndex : ShapeAlphabet total → ℕ) (splitProfile : ShapeAlphabet total → ℕ)
    (parentProfile : (Fin (length+length) → Fin 3) → ℕ)
    (reference : TypedWord (P := P) splitProfile) (block : TypedWord (P := P) parentProfile)
    (representative : {fine : P → Fin (length+length) → Fin 3 //
      pooledCompatible length parent balanced axisClass profile reference.val fine}) :
    (Nat.card {left : TypedWord (P := P) splitProfile //
      compatibleFine length parent balanced axisClass profile axisIndex left.val block.val} : ℝ) /
        Fintype.card (TypedWord (P := P) splitProfile) ≤
      Real.exp (
        (∑ sector, (Fintype.card {slot : P ⊕ P // axisClass (childLabels parent balanced reference.val slot) = sector} : ℝ)*
          Entropy.entropy (fun symbol => (profile sector symbol : ℝ)/
            Fintype.card {slot : P ⊕ P // axisClass (childLabels parent balanced reference.val slot) = sector})) +
        (∑ sector, (Real.log ((Fintype.card {slot : P ⊕ P //
          axisClass (childLabels parent balanced reference.val slot) = sector} : ℝ)+1)+1)) -
        ((Fintype.card P : ℝ)*Entropy.entropy (fun symbol => (parentProfile symbol : ℝ)/Fintype.card P) -
          Fintype.card (Fin (length+length) → Fin 3)*(Real.log ((Fintype.card P : ℝ)+1)+1))) := by
  let label := fun slot : P ⊕ P => axisClass (childLabels parent balanced reference.val slot)
  letI : Nonempty (TypedWord (P := P) splitProfile) := ⟨reference⟩
  letI : Nonempty (TypedWord (P := P) parentProfile) := ⟨block⟩
  let sectors : {word : P ⊕ P → Fin length → Fin 3 // SectorCompatible label profile word} :=
    ⟨fineHalves length representative.val, representative.property⟩
  letI : Nonempty {word : P ⊕ P → Fin length → Fin 3 // SectorCompatible label profile word} := ⟨sectors⟩
  have incidence := compatibleFine_degree_bound length parent balanced axisClass profile axisIndex
    splitProfile parentProfile reference block
  have cardFormula := sectorCompatible_card label profile
  simp only [← Nat.card_eq_fintype_card] at incidence cardFormula ⊢
  rw [← cardFormula] at incidence
  apply Selection.incidence_exponential_rate
    (by simpa only [Nat.card_eq_fintype_card] using (Fintype.card_pos (α := TypedWord (P := P) parentProfile)))
    (by simpa only [Nat.card_eq_fintype_card] using (Fintype.card_pos (α := TypedWord (P := P) splitProfile)))
    (by simpa only [Nat.card_eq_fintype_card] using
      (Fintype.card_pos (α := {word : P ⊕ P → Fin length → Fin 3 // SectorCompatible label profile word}))) incidence
  · simpa only [← Nat.card_eq_fintype_card] using (log_type_count_bounds_any parentProfile block).1
  · simpa only [← Nat.card_eq_fintype_card] using
      (pooled_entropy_bounds label profile (sectorCompatibleEquiv label profile sectors)).2

end
end MatrixBounds.Tensor.CW
