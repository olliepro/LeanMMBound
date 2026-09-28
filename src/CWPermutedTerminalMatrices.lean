import CWPermutedTerminalData
import CWTerminalMatrixRates
import CWOneLetterMatrixVolume

/-! Every physically oriented terminal target has actual matrix coordinate
maps, and its matrix volume is exactly independent of that orientation. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- Row coordinates of the matrix product over all labelled one-letter child pools. -/
abbrev OneLetterRowIndices (q : ℕ) (split : ShapeAlphabet 2 → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterRows q (2*split child) child.val)

/-- Inner coordinates of the same actual matrix product. -/
abbrev OneLetterInnerIndices (q : ℕ) (split : ShapeAlphabet 2 → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterInner q (2*split child) child.val)

/-- Column coordinates of the same actual matrix product. -/
abbrev OneLetterColumnIndices (q : ℕ) (split : ShapeAlphabet 2 → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterColumns q (2*split child) child.val)

/-- Canonical one-letter exact child profiles have explicit maps to a product-dimension matrix tensor. -/
def oneLetterDataMatrixRestriction (q : ℕ) (parent : Shape) (balanced : parent.total = 4)
    (coarseX coarseY coarseZ : Fin 3 → ℕ) (split : ShapeAlphabet 2 → ℕ) :
    CoordinateRestriction ((oneLetterData parent balanced coarseX coarseY coarseZ split).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := OneLetterRowIndices q split)
        (J := OneLetterInnerIndices q split) (L := OneLetterColumnIndices q split)) :=
  (CoordinateRestriction.heterogeneous (fun child : ShapeAlphabet 2 =>
    (oneLetterExactFinRestriction (K := K) q (2*split child) child).trans
      (oneLetterMatrixFinRestriction q (2*split child) child))).trans
        MatrixMul.heterogeneousCoordinateRestriction

/-- The product of the actual row, inner, and column cardinalities is the product of the child volumes. -/
theorem one_letter_product_volume (q : ℕ) (split : ShapeAlphabet 2 → ℕ) :
    Fintype.card (OneLetterRowIndices q split)*Fintype.card (OneLetterInnerIndices q split)*
      Fintype.card (OneLetterColumnIndices q split) =
      ∏ child : ShapeAlphabet 2, oneLetterRows q (2*split child) child.val*
        oneLetterInner q (2*split child) child.val*oneLetterColumns q (2*split child) child.val := by
  simp only [Fintype.card_pi, Fintype.card_fin, Finset.prod_mul_distrib]

namespace Terminal

/-- Actual matrix-coordinate restriction for any physical orientation of the terminal constituent. -/
def permutedMatrixRestriction (axes : Equiv.Perm (Fin 3)) (q extreme middle : ℕ) :
    CoordinateRestriction ((permutedData axes extreme middle).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := OneLetterRowIndices q (permutedCounts axes extreme middle))
        (J := OneLetterInnerIndices q (permutedCounts axes extreme middle))
        (L := OneLetterColumnIndices q (permutedCounts axes extreme middle))) :=
  oneLetterDataMatrixRestriction _ _ _ _ _ _ _

/-- Permuting physical roles leaves the exact terminal matrix volume unchanged. -/
theorem permuted_matrix_volume (axes : Equiv.Perm (Fin 3)) (q extreme middle : ℕ) :
    Fintype.card (OneLetterRowIndices q (permutedCounts axes extreme middle))*
      Fintype.card (OneLetterInnerIndices q (permutedCounts axes extreme middle))*
      Fintype.card (OneLetterColumnIndices q (permutedCounts axes extreme middle)) =
      q^(2*middle)*q^(2*extreme)*q^(2*middle) := by
  rw [one_letter_product_volume, ← Equiv.prod_comp (shapeAlphabetPermutation axes 2)]
  simp only [permutedCounts, Function.comp_apply, Equiv.symm_apply_apply,
    one_letter_matrix_volume_permute]
  rw [← one_letter_product_volume]
  change Fintype.card (RowIndices q (counts extreme middle))*Fintype.card (InnerIndices q (counts extreme middle))*
    Fintype.card (ColumnIndices q (counts extreme middle)) = _
  rw [terminal_rows_card, terminal_inner_card, terminal_columns_card]

/-- The permuted terminal matrix keeps the exact verifier volume rate at every feasible positive population. -/
theorem permuted_matrix_log_volume (axes : Equiv.Perm (Fin 3)) (q extreme middle : ℕ)
    (positiveQ : 0 < q) (positive : 0 < extreme+middle) :
    Real.log ((Fintype.card (OneLetterRowIndices q (permutedCounts axes extreme middle))*
      Fintype.card (OneLetterInnerIndices q (permutedCounts axes extreme middle))*
      Fintype.card (OneLetterColumnIndices q (permutedCounts axes extreme middle)) : ℕ) : ℝ) =
      (2*((extreme : ℝ)+middle))*((2-2*parameter extreme middle)*Real.log q) := by
  rw [permuted_matrix_volume]
  exact terminal_log_volume q extreme middle positiveQ positive

/-- Conversion of an oriented terminal output to its concrete matrix factor preserves every waiting tensor. -/
theorem contextReduction_permuted_terminal_matrix (axes : Equiv.Perm (Fin 3)) (q extreme middle : ℕ) :
    ContextReduction.{v} ((permutedData axes extreme middle).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := OneLetterRowIndices q (permutedCounts axes extreme middle))
        (J := OneLetterInnerIndices q (permutedCounts axes extreme middle))
        (L := OneLetterColumnIndices q (permutedCounts axes extreme middle))) 1 :=
  (permutedMatrixRestriction axes q extreme middle).context

end Terminal
end
end MatrixBounds.Tensor.CW
