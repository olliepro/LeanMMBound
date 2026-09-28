import PhysicalRoleRouting
import CWPhysicalWindowInverse

/-! Route actual complete CW windows from six symmetric source copies into
physical extraction regions while retaining every source and strategy label. -/
namespace MatrixBounds.Tensor.CW

open Numeric Interface
noncomputable section
variable {K T : Type*} [CommRing K] [Fintype T]
variable {Positions : T → Type*} [∀ label, Fintype (Positions label)]

/-- One source window in a fixed physical coordinate order, with its full fine-law centers. -/
def orientedSourceWindow (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (order : AxisOrder) (label : T) :=
  windowedPower (K := K) (P := Positions label) (constituent q (length label) ((shape label).permute order.permutation))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (law label (order.permutation 0)) (law label (order.permutation 1))
    (law label (order.permutation 2)) (tolerance label)

/-- Routed source windows are exactly the oriented local windows on which one region's shared extraction acts. -/
def regionWindowRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) (region : AxisOrder) (label : T) :
    CoordinateRestriction
      (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance
        (AxisOrder.regionSourceEquiv (role label) region) label)
      (orient region (orientedSourceWindow (K := K) (Positions := Positions)
        q length shape law tolerance (role label) label)) := by
  have result := physicalWindowInverseRestriction (K := K) (P := Positions label)
    region q (length label) ((shape label).permute (role label).permutation)
    (fun axis => law label ((role label).permutation axis)) (tolerance label)
  rw [AxisOrder.permute_region] at result
  simpa only [orientedSourceWindow, AxisOrder.regionSource_permutation,
    Equiv.Perm.mul_apply] using result

/-- Sixfold routing acts on actual tensor coefficients and retains every labelled allocation sector. -/
def sixfoldWindowRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) :
    CoordinateRestriction
      (heterogeneous (fun index : AxisOrder × T => orientedSourceWindow (K := K) (Positions := Positions)
        q length shape law tolerance index.1 index.2))
      (heterogeneous (fun index : AxisOrder × T => orient index.1
        (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role index.2) index.2))) :=
  (AxisOrder.routeRestriction role (fun index => orientedSourceWindow (K := K) (Positions := Positions)
    q length shape law tolerance index.1 index.2)).trans
      (CoordinateRestriction.heterogeneous (fun index => regionWindowRestriction q length shape law tolerance role index.1 index.2))

end
end MatrixBounds.Tensor.CW
