module

public import CWTerminalCounts
public import CWOneLetterMatrices

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The common target of the terminal extraction is an actual rectangular
matrix tensor, with all three dimensions derived from its integer split counts. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- Row index set contributed by every labelled one-letter child pool. -/
abbrev RowIndices (q : ℕ) (profile : Symbol → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterRows q (2*fullProfile profile child) child.val)

/-- Inner index set contributed by every labelled one-letter child pool. -/
abbrev InnerIndices (q : ℕ) (profile : Symbol → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterInner q (2*fullProfile profile child) child.val)

/-- Column index set contributed by every labelled one-letter child pool. -/
abbrev ColumnIndices (q : ℕ) (profile : Symbol → ℕ) :=
  ∀ child : ShapeAlphabet 2, Fin (oneLetterColumns q (2*fullProfile profile child) child.val)

/-- The exact terminal child target has explicit coordinate maps into one product-dimension matrix tensor. -/
def targetMatrixRestriction (q : ℕ) (profile : Symbol → ℕ) :
    CoordinateRestriction ((data profile).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := RowIndices q profile)
        (J := InnerIndices q profile) (L := ColumnIndices q profile)) :=
  (CoordinateRestriction.heterogeneous (fun child : ShapeAlphabet 2 =>
    (oneLetterExactFinRestriction (K := K) q (2*fullProfile profile child) child).trans
      (oneLetterMatrixFinRestriction q (2*fullProfile profile child) child))).trans
        MatrixMul.heterogeneousCoordinateRestriction

/-- The terminal row dimension is q raised to twice the middle split count. -/
theorem terminal_rows_card (q extreme middle : ℕ) :
    Fintype.card (RowIndices q (counts extreme middle)) = q^(2*middle) := by
  rw [Fintype.card_pi]
  simp only [Fintype.card_fin]
  rw [← (shapeColumnEquiv 2).prod_comp]
  change (∏ column : Fin 6, oneLetterRows q
    (2*fullProfile (counts extreme middle) (shapeColumnEquiv 2 column))
    (shapeColumnEquiv 2 column).val) = q^(2*middle)
  simp only [Fin.prod_univ_succ]
  norm_num [oneLetterRows, fullCounts_formula, parent, Shape.Fits, shapeColumnEquiv,
    List.Nodup.getEquiv, shapes, List.range_succ, Fin.prod_univ_succ]

/-- The terminal inner dimension is q raised to twice the extreme split count. -/
theorem terminal_inner_card (q extreme middle : ℕ) :
    Fintype.card (InnerIndices q (counts extreme middle)) = q^(2*extreme) := by
  rw [Fintype.card_pi]
  simp only [Fintype.card_fin]
  rw [← (shapeColumnEquiv 2).prod_comp]
  change (∏ column : Fin 6, oneLetterInner q
    (2*fullProfile (counts extreme middle) (shapeColumnEquiv 2 column))
    (shapeColumnEquiv 2 column).val) = q^(2*extreme)
  simp only [Fin.prod_univ_succ]
  norm_num [oneLetterInner, fullCounts_formula, parent, Shape.Fits, shapeColumnEquiv,
    List.Nodup.getEquiv, shapes, List.range_succ, Fin.prod_univ_succ]

/-- The terminal column dimension is q raised to twice the middle split count. -/
theorem terminal_columns_card (q extreme middle : ℕ) :
    Fintype.card (ColumnIndices q (counts extreme middle)) = q^(2*middle) := by
  rw [Fintype.card_pi]
  simp only [Fintype.card_fin]
  rw [← (shapeColumnEquiv 2).prod_comp]
  change (∏ column : Fin 6, oneLetterColumns q
    (2*fullProfile (counts extreme middle) (shapeColumnEquiv 2 column))
    (shapeColumnEquiv 2 column).val) = q^(2*middle)
  simp only [Fin.prod_univ_succ]
  norm_num [oneLetterColumns, fullCounts_formula, parent, Shape.Fits, shapeColumnEquiv,
    List.Nodup.getEquiv, shapes, List.range_succ, Fin.prod_univ_succ]

/-- The complete terminal target contains the claimed finite numerical matrix multiplication tensor. -/
def finiteMatrixRestriction (q extreme middle : ℕ) :
    CoordinateRestriction ((data (counts extreme middle)).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := Fin (q^(2*middle)))
        (J := Fin (q^(2*extreme))) (L := Fin (q^(2*middle)))) :=
  (targetMatrixRestriction q (counts extreme middle)).trans
    (MatrixMul.relabelCoordinateRestriction
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, terminal_rows_card]))
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, terminal_inner_card]))
      (Fintype.equivOfCardEq (by rw [Fintype.card_fin, terminal_columns_card])))

/-- The terminal exact target supplies its complete matrix dimensions in every tensor context at unit cost. -/
theorem contextReduction_terminal_matrix (q extreme middle : ℕ) :
    ContextReduction.{v} ((data (counts extreme middle)).target (K := K) q)
      (MatrixMul.tensor (K := K) (I := Fin (q^(2*middle)))
        (J := Fin (q^(2*extreme))) (L := Fin (q^(2*middle)))) 1 :=
  (finiteMatrixRestriction q extreme middle).context

end
end MatrixBounds.Tensor.CW.Terminal
