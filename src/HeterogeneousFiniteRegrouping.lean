module

public import HeterogeneousRegrouping
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Coordinate maps expose finite labelled tensor products one factor at a
time and rename their labels by actual finite equivalences. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Separate the first factor from a finite sequence of dependent tensor factors. -/
def finSuccProductRestriction {n : ℕ} {X Y Z : Fin (n+1) → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (heterogeneous family)
      (product (family 0) (heterogeneous (fun index : Fin n => family index.succ))) where
  left entries := Fin.cases entries.1 entries.2
  middle entries := Fin.cases entries.1 entries.2
  right entries := Fin.cases entries.1 entries.2
  coefficient x y z := by simp only [heterogeneous, Fin.prod_univ_succ, Fin.cases_zero, Fin.cases_succ, product]

/-- Restore the first factor and its dependent tail to a single finite labelled family. -/
def productFinSuccRestriction {n : ℕ} {X Y Z : Fin (n+1) → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (product (family 0) (heterogeneous (fun index : Fin n => family index.succ)))
      (heterogeneous family) where
  left entries := (entries 0, fun index => entries index.succ)
  middle entries := (entries 0, fun index => entries index.succ)
  right entries := (entries 0, fun index => entries index.succ)
  coefficient x y z := by simp only [heterogeneous, Fin.prod_univ_succ, product]

/-- Rename all factor labels by a bijection, transporting their dependent coordinate types. -/
def reindexRestriction {T S : Type*} [Fintype T] [Fintype S] (labels : T ≃ S) {X Y Z : S → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (heterogeneous family) (heterogeneous (fun index : T => family (labels index))) where
  left entries index := (Equiv.piCongrLeft X labels entries) index
  middle entries index := (Equiv.piCongrLeft Y labels entries) index
  right entries index := (Equiv.piCongrLeft Z labels entries) index
  coefficient x y z := by
    unfold heterogeneous
    rw [← Equiv.prod_comp labels]
    simp only [Equiv.piCongrLeft_apply_apply]

end
end MatrixBounds.Interface
