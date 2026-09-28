import CWMixedTargetOwnership
import CWFiniteExtraction
import ProductHoleCounts

/-! Parent-window concentration and selected collision holes on the entire
heterogeneous target. The finite constants add across parent types. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- Each parent type uses its own independent-child mixture and tolerance window. -/
def parentWindows (data : ∀ type, SplitRestrictionData (length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ) (tolerance : T → ℝ) :=
  fun type => (data type).parentWindow (P := Positions type) (profile type) (tolerance type)

/-- The heterogeneous parent-hole constant is the sum of the explicit local concentration constants. -/
def parentRepairConstant (length multiplier : T → ℕ) (tolerance : T → ℝ) : ℕ :=
  ∑ type, SplitRestrictionData.parentRepairConstant (length type) (multiplier type) (tolerance type)

/-- The global parent-hole count has the sum-of-constants inverse-population bound on the full product of target parts. -/
theorem parentHole_bound [∀ type, Nonempty (Positions type)]
    (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (representative : TargetParts data profile) (tolerance : T → ℝ) (positive : ∀ type, 0 < tolerance type)
    (scale : ℕ) (multiplier : T → ℕ) (population : ∀ type, scale ≤ multiplier type*Fintype.card (Positions type)) :
    Nat.card {parts // parentHole data symmetric edge profile (parentWindows (Positions := Positions) data profile tolerance) parts}*scale ≤
      parentRepairConstant length multiplier tolerance*Fintype.card (TargetParts data profile) := by
  let holes := fun type => (data type).parentHole (symmetric type) (edge type) (profile type)
    ((data type).parentWindow (P := Positions type) (profile type) (tolerance type))
  let constants := fun type => SplitRestrictionData.parentRepairConstant (length type) (multiplier type) (tolerance type)
  have localBounds (type : T) : Nat.card {parts // holes type parts}*scale ≤ constants type*Nat.card ((data type).TargetParts (profile type)) := by
    simpa only [Nat.card_eq_fintype_card] using (data type).parentHole_bound (symmetric type) (edge type)
      (profile type) (representative type) (positive type) scale (multiplier type) (population type)
  have combined := Selection.product_holes_bound holes scale constants localBounds
  have same : Nat.card {parts // parentHole data symmetric edge profile (parentWindows (Positions := Positions) data profile tolerance) parts} =
      Nat.card {parts : TargetParts data profile // ∃ type, holes type (parts type)} := by
    apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
    intro parts
    simp only [parentHole, parentWindows, targetFine, holes, SplitRestrictionData.parentHole, not_forall]
  rw [same]
  simpa only [← Nat.card_eq_fintype_card] using combined

/-- Combining all parent holes with the selected global window collisions costs one additional unit. -/
theorem targetHoles_windowed_bound {prime : ℕ} [Fact prime.Prime]
    (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (scale constant : ℕ)
    (parentBound : Nat.card {parts // parentHole data symmetric edge profile accept parts}*scale ≤
      constant*Fintype.card (TargetParts data profile))
    (collisionBound : Nat.card {parts // windowCollision data symmetric seed edge axis axisClass profile accept parts}*scale ≤
      Fintype.card (TargetParts data profile)) :
    Nat.card {parts // targetHoles data symmetric seed edge axis axisClass profile accept parts}*scale ≤
      (constant+1)*Fintype.card (TargetParts data profile) := by
  have bound := Selection.union_holes_bound _ _ scale constant parentBound collisionBound
  have same : Nat.card {parts // targetHoles data symmetric seed edge axis axisClass profile accept parts} =
      Nat.card {parts : TargetParts data profile // parentHole data symmetric edge profile accept parts ∨
        windowCollision data symmetric seed edge axis axisClass profile accept parts} := by
    apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
    intro parts
    unfold targetHoles parentHole windowCollision
    tauto
  rwa [same]

end
end MatrixBounds.Tensor.CW.Mixed
