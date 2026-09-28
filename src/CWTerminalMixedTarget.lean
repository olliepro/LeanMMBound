import CWTerminalMatrices
import CWMixedTargets

/-! The entire mixed terminal child target becomes one rectangular matrix
factor, with exact dimensions multiplying across all labelled parent types. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- Apply every concrete terminal matrix restriction and combine their matrix indices. -/
def mixedMatrixRestriction (q : ℕ) (extreme middle : T → ℕ) :
    CoordinateRestriction (Mixed.target (K := K) (fun type => data (counts (extreme type) (middle type))) q)
      (MatrixMul.tensor (K := K) (I := ∀ type, Fin (q^(2*middle type)))
        (J := ∀ type, Fin (q^(2*extreme type))) (L := ∀ type, Fin (q^(2*middle type)))) :=
  (CoordinateRestriction.heterogeneous (fun type => finiteMatrixRestriction q (extreme type) (middle type))).trans
    MatrixMul.heterogeneousCoordinateRestriction

/-- Multiplying the actual q-power dimensions adds their twice-count exponents. -/
theorem mixed_terminal_dimension (q : ℕ) (count : T → ℕ) :
    Fintype.card (∀ type, Fin (q^(2*count type))) = q^(2*∑ type, count type) := by
  rw [Fintype.card_pi]
  simp only [Fintype.card_fin]
  rw [Finset.prod_pow_eq_pow_sum, ← Finset.mul_sum]

/-- The mixed terminal target has one explicit standard matrix tensor with the exact total dimensions. -/
def mixedFiniteMatrixRestriction (q : ℕ) (extreme middle : T → ℕ) :
    CoordinateRestriction (Mixed.target (K := K) (fun type => data (counts (extreme type) (middle type))) q)
      (MatrixMul.tensor (K := K) (I := Fin (q^(2*∑ type, middle type)))
        (J := Fin (q^(2*∑ type, extreme type))) (L := Fin (q^(2*∑ type, middle type)))) :=
  (mixedMatrixRestriction q extreme middle).trans
    (MatrixMul.relabelCoordinateRestriction
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, mixed_terminal_dimension]))
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, mixed_terminal_dimension]))
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, mixed_terminal_dimension])))

/-- Mixed terminal matrix conversion preserves every waiting factor at unit cost. -/
theorem contextReduction_mixed_terminal_matrix (q : ℕ) (extreme middle : T → ℕ) :
    ContextReduction.{v} (Mixed.target (K := K) (fun type => data (counts (extreme type) (middle type))) q)
      (MatrixMul.tensor (K := K) (I := Fin (q^(2*∑ type, middle type)))
        (J := Fin (q^(2*∑ type, extreme type))) (L := Fin (q^(2*∑ type, middle type)))) 1 :=
  (mixedFiniteMatrixRestriction q extreme middle).context

end
end MatrixBounds.Tensor.CW.Terminal
