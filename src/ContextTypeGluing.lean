module

public import ContextSubtypeExtension
public import ContextOperations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A common output batch glues across all accepted exact profile triples
without changing previously produced copies or waiting tensor factors. -/
namespace MatrixBounds.Empirical

universe v
open Tensor
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W PX PY PZ : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z] [Fintype PX] [Fintype PY] [Fintype PZ]

/-- Contextual exact-type batches assemble the full accepted tensor at the finite profile-count cost. -/
theorem contextReduction_glue_exact_types (source : Coeff K U V W) (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) (copies cost : ℕ)
    (reductions : ∀ labels : PX × PY × PZ,
      acceptX labels.1 → acceptY labels.2.1 → acceptZ labels.2.2 →
      ContextReduction.{v} source (directSum (fun _ : Fin copies => subtypeTensor tensor
        (fun x => typeX x = labels.1) (fun y => typeY y = labels.2.1) (fun z => typeZ z = labels.2.2))) cost) :
    ContextReduction.{v} source
      (directSum (fun _ : Fin copies => acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ))
      (Fintype.card (PX × PY × PZ)*cost) := by
  let family := fun labels : PX × PY × PZ =>
    if acceptX labels.1 ∧ acceptY labels.2.1 ∧ acceptZ labels.2.2
      then exactPiece tensor typeX typeY typeZ labels else fun _ _ _ => 0
  have pieces (labels : PX × PY × PZ) :
      ContextReduction.{v} source (directSum (fun _ : Fin copies => family labels)) cost := by
    dsimp only [family]
    split_ifs with accepted
    · have extension := (contextReduction_extend_subtypes.{v} tensor
        (fun x => typeX x = labels.1) (fun y => typeY y = labels.2.1) (fun z => typeZ z = labels.2.2)).batch (I := Fin copies)
      have result := (reductions labels accepted.1 accepted.2.1 accepted.2.2).trans extension
      simpa only [acceptedTensor, exactPiece, id_eq, one_mul] using! result
    · have zero : directSum (fun _ : Fin copies => (fun (_ : X) (_ : Y) (_ : Z) => (0 : K))) = fun _ _ _ => 0 := by
        funext x y z
        simp only [directSum, ite_self]
      rw [zero]
      exact contextReduction_zero source cost
  have combined := ContextReduction.sum (fun labels => directSum (fun _ : Fin copies => family labels)) pieces
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
