import PositiveLookupEquivalence
import ZeroWeightRestoration
import HeterogeneousFiniteRegrouping

/-! A partial original lookup reindexes full empirical-window tensors exactly
when every absent source label has zero population. -/
namespace MatrixBounds.Interface.PartialIndexing

open Tensor
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {A B K : Type*} [Fintype A] [Fintype B] [CommSemiring K]

/-- Reindex all complete windows through an exact partial source lookup; the only absent factors are proved neutral. -/
def windowRestriction (indices : PartialIndexing A B) (weight : A → ℕ)
    (supported : ∀ index, 0 < weight index → indices.encode index ≠ none) (size : ℕ)
    {X Y Z BX BY BZ : A → Type*} (family : ∀ index, Coeff K (X index) (Y index) (Z index))
    (partX : ∀ index, X index → BX index) (partY : ∀ index, Y index → BY index) (partZ : ∀ index, Z index → BZ index)
    (lawX : ∀ index, BX index → ℝ) (lawY : ∀ index, BY index → ℝ) (lawZ : ∀ index, BZ index → ℝ) (tolerance : A → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun index => windowedPower (P := Fin (weight index*size)) (family index)
        (partX index) (partY index) (partZ index) (lawX index) (lawY index) (lawZ index) (tolerance index)))
      (heterogeneous (fun label => windowedPower (P := Fin (weight (indices.decode label)*size)) (family (indices.decode label))
        (partX (indices.decode label)) (partY (indices.decode label)) (partZ (indices.decode label))
        (lawX (indices.decode label)) (lawY (indices.decode label)) (lawZ (indices.decode label)) (tolerance (indices.decode label)))) := by
  have drop := dropZeroWeightRestriction weight size family partX partY partZ lawX lawY lawZ tolerance
  have rename := reindexRestriction (indices.positiveEquiv weight supported).symm
    (fun index : PositiveWeight weight => windowedPower (P := Fin (weight index.val*size)) (family index.val)
      (partX index.val) (partY index.val) (partZ index.val) (lawX index.val) (lawY index.val) (lawZ index.val) (tolerance index.val))
  have restore := restoreZeroWeightRestriction (fun label => weight (indices.decode label)) size
    (fun label => family (indices.decode label)) (fun label => partX (indices.decode label))
    (fun label => partY (indices.decode label)) (fun label => partZ (indices.decode label))
    (fun label => lawX (indices.decode label)) (fun label => lawY (indices.decode label))
    (fun label => lawZ (indices.decode label)) (fun label => tolerance (indices.decode label))
  exact (drop.trans rename).trans restore

end
end MatrixBounds.Interface.PartialIndexing
