module

public import CWRoleWindowUnrouting
public import OrientedHeterogeneousProducts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete sixfold source windows and the six literal shared-extraction
regions are mutually related by explicit tensor coordinate restrictions. -/
namespace MatrixBounds.Tensor.CW

open Numeric Interface
noncomputable section
variable {K T : Type*} [CommRing K] [Fintype T]
variable {Positions : T → Type*} [∀ label, Fintype (Positions label)]

/-- Route all complete source copies into six literal orientations of the local shared parent tensor. -/
def sixfoldRegionRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) :
    CoordinateRestriction
      (heterogeneous (fun source : AxisOrder => heterogeneous (fun label : T =>
        orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance source label)))
      (heterogeneous (fun region : AxisOrder => orient region (heterogeneous (fun label : T =>
        orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label)))) :=
  ((flattenProductRestriction (fun source label =>
    orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance source label)).trans
      (sixfoldWindowRestriction q length shape law tolerance role)).trans
    ((unflattenProductRestriction (fun region label => orient region
      (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label))).trans
      (CoordinateRestriction.heterogeneous (fun region => orientHeterogeneousRestriction region
        (fun label => orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label))))

/-- Restore complete output windows from the six literal shared-extraction regions to their original source-copy labels. -/
def sixfoldRegionInverseRestriction (q : ℕ) (length : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ)
    (role : T → AxisOrder) :
    CoordinateRestriction
      (heterogeneous (fun region : AxisOrder => orient region (heterogeneous (fun label : T =>
        orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label))))
      (heterogeneous (fun source : AxisOrder => heterogeneous (fun label : T =>
        orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance source label))) :=
  ((CoordinateRestriction.heterogeneous (fun region => heterogeneousOrientRestriction region
    (fun label => orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label))).trans
      (flattenProductRestriction (fun region label => orient region
        (orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance (role label) label)))).trans
    ((sixfoldWindowInverseRestriction q length shape law tolerance role).trans
      (unflattenProductRestriction (fun source label =>
        orientedSourceWindow (K := K) (Positions := Positions) q length shape law tolerance source label)))

end
end MatrixBounds.Tensor.CW
