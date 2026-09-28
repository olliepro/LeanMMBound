import SubtypeExtension

/-! Glue a common number of independent output copies across all exact type
triples. The budget is multiplied by the finite number of type triples once. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
variable {K X Y Z : Type*} [CommSemiring K]

/-- The zero coefficient tensor has a decomposition at any nonnegative rank budget. -/
theorem rankLE_zero (rank : ℕ) : RankLE (fun (_ : X) (_ : Y) (_ : Z) => (0 : K)) rank := by
  exact ⟨{
    left := fun _ _ => 0
    middle := fun _ _ => 0
    right := fun _ _ => 0
    reconstruct := fun _ _ _ => by simp }⟩

end
end MatrixBounds.Tensor

namespace MatrixBounds.Empirical

open Tensor
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z PX PY PZ : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z] [Fintype PX] [Fintype PY] [Fintype PZ]

/-- Exact subtype algorithms for a common number of copies glue into that many full accepted interfaces with only the type-count factor. -/
theorem glue_exact_type_batches (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) (copies rank : ℕ)
    (algorithms : ∀ labels : PX × PY × PZ,
      acceptX labels.1 → acceptY labels.2.1 → acceptZ labels.2.2 →
      RankLE (directSum (fun _ : Fin copies => subtypeTensor tensor
        (fun x => typeX x = labels.1) (fun y => typeY y = labels.2.1) (fun z => typeZ z = labels.2.2))) rank) :
    RankLE (directSum (fun _ : Fin copies => acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ))
      (Fintype.card (PX × PY × PZ)*rank) := by
  let family := fun labels : PX × PY × PZ =>
    if acceptX labels.1 ∧ acceptY labels.2.1 ∧ acceptZ labels.2.2
      then exactPiece tensor typeX typeY typeZ labels else fun _ _ _ => 0
  have budgets (labels : PX × PY × PZ) : RankLE (directSum (fun _ : Fin copies => family labels)) rank := by
    dsimp only [family]
    split_ifs with accepted
    · simpa only [acceptedTensor, exactPiece, id_eq] using rankLE_extend_subtype_batch tensor
        (fun x => typeX x = labels.1) (fun y => typeY y = labels.2.1) (fun z => typeZ z = labels.2.2)
        (algorithms labels accepted.1 accepted.2.1 accepted.2.2)
    · convert rankLE_zero (K := K) (X := Fin copies × X) (Y := Fin copies × Y) (Z := Fin copies × Z) rank using 1
      funext x y z
      simp only [directSum, ite_self]
  have combined := rankLE_sum (fun labels => directSum (fun _ : Fin copies => family labels)) rank budgets
  have identity : (fun x y z => ∑ labels : PX × PY × PZ, directSum (fun _ : Fin copies => family labels) x y z) =
      directSum (fun _ : Fin copies => acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ) := by
    funext x y z
    by_cases same : x.1 = y.1 ∧ y.1 = z.1
    · simp only [directSum, if_pos same]
      simpa only [family, ite_apply] using
        congrFun (congrFun (congrFun (sum_exact_pieces tensor typeX typeY typeZ acceptX acceptY acceptZ) x.2) y.2) z.2
    · simp only [directSum, if_neg same, Finset.sum_const_zero]
  rwa [identity] at combined

end
end MatrixBounds.Empirical
