module

public import CWWindowCollisionRates
public import CWParentCenterBounds
public import IncidenceRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Uniform entropy control for the actual maximum compatibility degree inside
an accepted parent window, rather than a bound for a single chosen fine word. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- The entropy upper cost of all pooled compatibility sectors, including their finite type-count errors. -/
def compatibilityCost (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) : ℝ :=
  let sectorSize := fun sector => Fintype.card {slot : P ⊕ P //
    axisClass (childLabels data.parent data.balanced (data.word reference.val) slot) = sector}
  (∑ sector, (sectorSize sector : ℝ)*Entropy.entropy
    (fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/sectorSize sector)) +
    ∑ sector, (Real.log ((sectorSize sector : ℝ)+1)+1)

/-- The explicit multinomial error for a complete parent fine-word alphabet. -/
def parentTypeError (Positions : Type*) [Fintype Positions] (length : ℕ) : ℝ :=
  Fintype.card (Fin (length+length) → Fin 3)*(Real.log ((Fintype.card Positions : ℝ)+1)+1)

set_option maxHeartbeats 800000 in
/-- Every fine word has the actual compatibility-degree entropy bound relative to the prescribed split count. -/
theorem fine_degree_entropy (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (representative : data.TargetParts profile) (fine : P → Fin (length+length) → Fin 3) :
    (Nat.card {word : TypedWord (P := P) data.split //
      compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
        (fun child => axis child.val) word.val fine} : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (data.compatibilityCost reference axisClass profile -
        (Fintype.card P : ℝ)*Entropy.entropy (fun symbol => (count fine symbol : ℝ)/Fintype.card P) + parentTypeError P length) := by
  have compatible := data.targetParts_compatible symmetric reference axis additive profile support axisClass representative
  have bound := compatibleFine_entropy_rate length data.parent data.balanced axisClass (pooledProfile profile axisClass)
    (fun child => axis child.val) data.split (count fine) (data.prescribedWord reference) ⟨fine, fun _ => rfl⟩
    ⟨_, compatible.2⟩
  simp +instances only [← Nat.card_eq_fintype_card, prescribedWord] at bound ⊢
  unfold compatibilityCost parentTypeError
  simp only [← Nat.card_eq_fintype_card]
  convert bound using 1
  congr 1
  ring

/-- A bound on all accepted individual degrees also bounds their finite maximum after normalization. -/
theorem window_degree_rate (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) {rate : ℝ} (rateNonnegative : 0 ≤ rate)
    (pointwise : ∀ fine, accept fine →
      (Nat.card {word : TypedWord (P := P) data.split // compatibleFine length data.parent data.balanced
        axisClass (pooledProfile profile axisClass) (fun child => axis child.val) word.val fine} : ℝ)/
          Fintype.card (TypedWord (P := P) data.split) ≤ rate) :
    (data.windowDegree axis axisClass profile accept : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ rate := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWord reference⟩
  have positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) data.split) := by exact_mod_cast Fintype.card_pos
  apply (div_le_iff₀ positive).mpr
  have nonnegative : 0 ≤ rate*(Fintype.card (TypedWord (P := P) data.split) : ℝ) := mul_nonneg rateNonnegative positive.le
  have bound : data.windowDegree axis axisClass profile accept ≤
      ⌊rate*(Fintype.card (TypedWord (P := P) data.split) : ℝ)⌋₊ := by
    unfold windowDegree
    apply Finset.sup_le
    intro fine _
    split_ifs with accepted
    · exact Nat.le_floor ((div_le_iff₀ positive).mp (pointwise fine accepted))
    · exact Nat.zero_le _
  exact (Nat.cast_le.mpr bound).trans (Nat.floor_le nonnegative)

/-- Entropy continuity throughout a parent window controls its actual maximum compatibility degree with explicit finite errors. -/
theorem window_degree_entropy (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (representative : data.TargetParts profile) (center : (Fin (length+length) → Fin 3) → ℝ) (tolerance error : ℝ)
    (control : ∀ fine : P → Fin (length+length) → Fin 3, Within (P := P) center tolerance fine →
      Entropy.entropy center-error ≤ Entropy.entropy (fun symbol => (count fine symbol : ℝ)/Fintype.card P)) :
    (data.windowDegree axis axisClass profile (Within (P := P) center tolerance) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (data.compatibilityCost reference axisClass profile -
        (Fintype.card P : ℝ)*(Entropy.entropy center-error) + parentTypeError P length) := by
  apply data.window_degree_rate reference axis axisClass profile (Within (P := P) center tolerance) (Real.exp_pos _).le
  intro fine inside
  apply (data.fine_degree_entropy symmetric reference axis additive axisClass profile support representative fine).trans
  apply Real.exp_le_exp.mpr
  have multiplied := mul_le_mul_of_nonneg_left (control fine inside) (Nat.cast_nonneg (Fintype.card P) : (0 : ℝ) ≤ _)
  linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
