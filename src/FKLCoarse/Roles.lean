module

public import FKLCoarse.Semantic
public import FKLCoarse.Static

/-! The six-role source builder computes the exact value of all role expressions of one source. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL Tensor Tensor.CW
open scoped BigOperators

theorem roles_value {length n : ℕ} (P : Shape) (e0 : Fin n ≃ ShapeAlphabet (2 * length)) (mass : Fin n → ℚ)
    (pot : Fin 3 → Fin (2 * length + 1) → ℚ) (wt : Fin 6 → ℚ) (S TC ms : ℕ) (hS : 44 ≤ S)
    (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) (cr : ℕ → ℕ)
    (ha : ∀ c : Fin n, ((mass c : ℚ) : ℝ) = (a c : ℝ) / 2 ^ 44)
    (hsh : ∀ (c : Fin n) (b : Fin 3), Shape.coordinates (e0 c).val b = sh b c)
    (hfit : ∀ c : Fin n, fit c = decide ((e0 c).val.Fits P))
    (hpot : ∀ (b : Fin 3) (v : Fin (2 * length + 1)), ((pot b v : ℚ) : ℝ) = (un b v : ℝ) / 2 ^ (up b v))
    (hcr : ∀ r : Fin 6, (cr r : ℝ) / 2 ^ TC = ((wt r : ℚ) : ℝ))
    (hok : okSrc S n (2 * length + 1) sh fit up = true) (tail : List Raw) :
    rawValue S (TC + 44 + ms) (srcB S ms n (2 * length + 1) a sh fit un up cr ax0 tail) =
      (∑ role : Fin 6, rationalLogValue (SuppliedPairedCoarse.supportedScale (wt role)
        (PairedCoarseColumns.expression (P.permute (SuppliedRoleIndex.order role).permutation)
          (e0.trans (shapeAlphabetPermutation (SuppliedRoleIndex.order role).permutation (2 * length))) mass
          (fun axis => pot ((SuppliedRoleIndex.order role).permutation axis))))) +
        rawValue S (TC + 44 + ms) tail := by
  rw [srcB_value S TC ms n (2 * length + 1) hS a sh fit un up cr ax0 hok ax0_lt tail]
  congr 1
  rw [← Fin.sum_univ_eq_sum_range (fun r => (cr r : ℝ) / 2 ^ TC * CR n (2 * length + 1) a sh fit un up (ax0 r)) 6]
  apply Finset.sum_congr rfl
  intro r _
  rw [SuppliedPairedCoarse.supportedScale_value, scaleLogExpression_value, hcr r,
    expression_value_perm P _ e0 mass pot a sh fit un up (ax0 r) ha hsh hfit hpot (ax0_eq r)]

end MatrixBounds.Numeric.FKLCoarse
