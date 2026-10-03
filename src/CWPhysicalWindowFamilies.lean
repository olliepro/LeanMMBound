module

public import CWRoleWindowRouting
public import OrientedHeterogeneousProducts
public import SixfoldComposition

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Canonical complete window families and their physically oriented source
copies have explicit coordinate maps in both directions. -/
namespace MatrixBounds.Tensor.CW

universe v
open Numeric Interface
noncomputable section
variable {K T : Type} [CommRing K] [Fintype T]

/-- Complete separately labelled source windows in their original coordinate order. -/
def sourceWindowFamily (q : ℕ) (length population : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ) :=
  heterogeneous (fun label => windowedPower (K := K) (P := Fin (population label))
    (constituent q (length label) (shape label))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (law label 0) (law label 1) (law label 2) (tolerance label))

/-- Complete separately labelled source windows in one specified physical coordinate order. -/
def physicalWindowFamily (q : ℕ) (length population : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ) (order : AxisOrder) :=
  heterogeneous (fun label => orientedSourceWindow (K := K) (Positions := fun label => Fin (population label))
    q length shape law tolerance order label)

/-- Orienting a full labelled window product gives all of its actual physical source windows. -/
def physicalWindowFamilyRestriction (q : ℕ) (length population : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ) (order : AxisOrder) :
    CoordinateRestriction (orient order (sourceWindowFamily (K := K) q length population shape law tolerance))
      (physicalWindowFamily (K := K) q length population shape law tolerance order) :=
  (heterogeneousOrientRestriction order _).trans
    (CoordinateRestriction.heterogeneous (fun label => physicalWindowRestriction order q (length label)
      (shape label) (law label) (tolerance label)))

/-- Restore actual physical source windows to the literal orientation of their full original labelled tensor. -/
def physicalWindowFamilyInverseRestriction (q : ℕ) (length population : T → ℕ) (shape : T → Shape)
    (law : ∀ label, Fin 3 → (Fin (length label) → Fin 3) → ℝ) (tolerance : T → ℝ) (order : AxisOrder) :
    CoordinateRestriction (physicalWindowFamily (K := K) q length population shape law tolerance order)
      (orient order (sourceWindowFamily (K := K) q length population shape law tolerance)) :=
  (CoordinateRestriction.heterogeneous (fun label => physicalWindowInverseRestriction order q (length label)
      (shape label) (law label) (tolerance label))).trans (orientHeterogeneousRestriction order _)

end
end MatrixBounds.Tensor.CW
