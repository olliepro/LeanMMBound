import SuppliedSixfoldRoot
import OrientedCertificates

/-! Explicit CW polynomial certificates for the actual sixfold supplied source
and any fixed finite number of separately labelled source batches. -/
namespace MatrixBounds.Numeric.SuppliedSourceCertificate

open Tensor Tensor.CW Interface SuppliedPopulationWeights
open scoped BigOperators
noncomputable section

/-- The full original sixfold source has exactly six copies of its original CW polynomial budget. -/
def source {K : Type} [CommRing K] (size : ℕ) :
    Degeneration.Certificate (SuppliedSixfoldRoot.source (K := K) size)
      ((7^(8*(rootWeight*size)))^6) (6*(24*(rootWeight*size))) := by
  have certificate := Degeneration.heterogeneousCertificate
    (fun order : AxisOrder => orient order (rootPower (K := K) (P := Fin (rootWeight*size)) 5 8))
    (fun _ => 7^(8*(rootWeight*size))) (fun _ => 24*(rootWeight*size))
    (fun order => by simpa only [Fintype.card_fin, Nat.reduceAdd, Nat.reduceMul] using
      (rootPowerCertificate (K := K) (P := Fin (rootWeight*size)) 5 8).orient order)
  simpa only [Finset.prod_const, Finset.sum_const, Finset.card_univ, axisOrder_card, smul_eq_mul] using certificate

/-- Independent finite source batches retain the product rank budget and additive polynomial degree. -/
def batches {K : Type} [CommRing K] (count size : ℕ) :
    Degeneration.Certificate
      (heterogeneous (fun _ : Fin count => SuppliedSixfoldRoot.source (K := K) size))
      (((7^(8*(rootWeight*size)))^6)^count) (count*(6*(24*(rootWeight*size)))) := by
  have certificate := Degeneration.heterogeneousCertificate
    (fun _ : Fin count => SuppliedSixfoldRoot.source (K := K) size)
    (fun _ => (7^(8*(rootWeight*size)))^6) (fun _ => 6*(24*(rootWeight*size))) (fun _ => source size)
  simpa only [Finset.prod_const, Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul] using certificate

end
end MatrixBounds.Numeric.SuppliedSourceCertificate
