import CWRoleWindowRouting
import HeterogeneousProductRegrouping

/-! After extraction the six oriented regions can be restored to separately
labelled source copies. No complete-window constraints are merged or relaxed. -/
namespace MatrixBounds.Tensor.CW

open Numeric Interface
noncomputable section
variable {K T : Type*} [CommRing K] [Fintype T]
variable {Positions : T → Type*} [∀ label, Fintype (Positions label)]

/-- Restore one physically oriented local window to the original source copy that supplies it. -/
def regionWindowInverseRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) (region : AxisOrder) (label : T) :
    CoordinateRestriction
      (orient region (orientedSourceWindow (K := K) (Positions := Positions)
        q length shape law tolerance (role label) label))
      (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance
        (AxisOrder.regionSourceEquiv (role label) region) label) := by
  have result := physicalWindowRestriction (K := K) (P := Positions label)
    region q (length label) ((shape label).permute (role label).permutation)
    (fun axis => law label ((role label).permutation axis)) (tolerance label)
  rw [AxisOrder.permute_region] at result
  simpa only [orientedSourceWindow, AxisOrder.regionSource_permutation, Equiv.Perm.mul_apply] using result

/-- Restore all six source copies from complete region windows while retaining every allocation-history label. -/
def sixfoldWindowInverseRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) :
    CoordinateRestriction
      (heterogeneous (fun index : AxisOrder × T => orient index.1
        (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role index.2) index.2)))
      (heterogeneous (fun index : AxisOrder × T => orientedSourceWindow (K := K) (Positions := Positions)
        q length shape law tolerance index.1 index.2)) :=
  (CoordinateRestriction.heterogeneous (fun index : AxisOrder × T =>
    regionWindowInverseRestriction q length shape law tolerance role index.1 index.2)).trans
      (inverseReindexRestriction (AxisOrder.labelledRegionEquiv role)
        (fun index => orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance index.1 index.2))

end
end MatrixBounds.Tensor.CW
