import CWPermutedTerminalMatrices
import CWMixedTargets

/-! Differently oriented terminal child targets combine into one actual
rectangular matrix factor. Their complete logarithmic volumes add exactly. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- Mixed row coordinates preserve the full type and child-pool labels. -/
abbrev PermutedMixedRows (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :=
  ∀ type, OneLetterRowIndices q (permutedCounts (axes type) (extreme type) (middle type))

/-- Mixed inner coordinates preserve the same complete labelled factorization. -/
abbrev PermutedMixedInner (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :=
  ∀ type, OneLetterInnerIndices q (permutedCounts (axes type) (extreme type) (middle type))

/-- Mixed column coordinates preserve the same complete labelled factorization. -/
abbrev PermutedMixedColumns (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :=
  ∀ type, OneLetterColumnIndices q (permutedCounts (axes type) (extreme type) (middle type))

/-- Apply the actual matrix restrictions in all physical orientations and combine their matrix factors. -/
def permutedMixedMatrixRestriction (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :
    CoordinateRestriction (Mixed.target (K := K)
      (fun type => permutedData (axes type) (extreme type) (middle type)) q)
      (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
        (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)) :=
  (CoordinateRestriction.heterogeneous (fun type =>
    permutedMatrixRestriction (axes type) q (extreme type) (middle type))).trans
      MatrixMul.heterogeneousCoordinateRestriction

/-- The finite mixed matrix volume is the exact product of the orientation-independent terminal volumes. -/
theorem permuted_mixed_matrix_volume (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :
    Fintype.card (PermutedMixedRows axes q extreme middle)*Fintype.card (PermutedMixedInner axes q extreme middle)*
      Fintype.card (PermutedMixedColumns axes q extreme middle) =
      ∏ type, q^(2*middle type)*q^(2*extreme type)*q^(2*middle type) := by
  rw [Fintype.card_pi (α := fun type => OneLetterRowIndices q (permutedCounts (axes type) (extreme type) (middle type))),
    Fintype.card_pi (α := fun type => OneLetterInnerIndices q (permutedCounts (axes type) (extreme type) (middle type))),
    Fintype.card_pi (α := fun type => OneLetterColumnIndices q (permutedCounts (axes type) (extreme type) (middle type)))]
  rw [← Finset.prod_mul_distrib, ← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro type _
  exact permuted_matrix_volume (axes type) q (extreme type) (middle type)

/-- Matrix volumes add in logarithmic units across all differently oriented terminal types. -/
theorem permuted_mixed_matrix_log_volume (axes : T → Equiv.Perm (Fin 3)) (q : ℕ)
    (extreme middle : T → ℕ) (positiveQ : 0 < q) (positive : ∀ type, 0 < extreme type+middle type) :
    Real.log ((Fintype.card (PermutedMixedRows axes q extreme middle)*
      Fintype.card (PermutedMixedInner axes q extreme middle)*
      Fintype.card (PermutedMixedColumns axes q extreme middle) : ℕ) : ℝ) =
      ∑ type, (2*((extreme type : ℝ)+middle type))*
        ((2-2*parameter (extreme type) (middle type))*Real.log q) := by
  rw [permuted_mixed_matrix_volume, Nat.cast_prod]
  rw [Real.log_prod Finset.univ _ (fun type _ => by
    have positiveVolume : 0 < q^(2*middle type)*q^(2*extreme type)*q^(2*middle type) := by positivity
    exact_mod_cast positiveVolume.ne')]
  apply Finset.sum_congr rfl
  intro type _
  exact terminal_log_volume q (extreme type) (middle type) positiveQ (positive type)

/-- The complete mixed oriented target supplies its matrix factor at unit contextual cost. -/
theorem contextReduction_permuted_mixed_matrix (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :
    ContextReduction.{v} (Mixed.target (K := K)
      (fun type => permutedData (axes type) (extreme type) (middle type)) q)
      (MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
        (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)) 1 :=
  (permutedMixedMatrixRestriction axes q extreme middle).context

end
end MatrixBounds.Tensor.CW.Terminal
