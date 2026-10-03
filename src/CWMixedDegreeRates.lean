module

public import CWMixedDegrees
public import ProductDegreeRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Product degree estimates are normalized by the actual prescribed global
graph size, with feasibility and positivity supplied by a real reference edge. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- A feasible prescribed global edge makes the actual global edge count positive. -/
theorem prescribed_positive (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) : 0 < Fintype.card (PrescribedEdges Positions data) := by
  letI : Nonempty (PrescribedEdges Positions data) := ⟨reference⟩
  exact Fintype.card_pos

/-- Every feasible complete graph has a positive product coarse degree, since the reference belongs to its own fiber. -/
theorem coarse_product_positive (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) : 0 < ∏ type, (data type).coarseDegree (P := Positions type) := by
  let edge := forget data reference
  let fiber := {other : Edges Positions data // (naturalEdge data other).x = (naturalEdge data edge).x}
  letI : Nonempty fiber := ⟨⟨edge, rfl⟩⟩
  have positive : 0 < Nat.card fiber := Nat.card_pos
  exact positive.trans_le (coarse_degree_le data edge)

/-- Local normalized degree bounds sum their retention exponents against the actual global prescribed count. -/
theorem degree_product_retention (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (degrees : T → ℕ) (retention : T → ℝ) {rate : ℝ}
    (pointwise : ∀ type, (degrees type : ℝ)/Fintype.card (TypedWord (P := Positions type) (data type).split) ≤
      Real.exp (-retention type)) (lower : rate ≤ ∑ type, retention type) :
    ((∏ type, degrees type : ℕ) : ℝ)/Fintype.card (PrescribedEdges Positions data) ≤ Real.exp (-rate) := by
  have count := prescribed_card data reference
  simp only [Nat.card_eq_fintype_card] at count
  rw [count]
  exact Selection.normalized_product_retention degrees _ retention pointwise lower

end
end MatrixBounds.Tensor.CW.Mixed
