import ContextComposition
import ContextRank

/-! A finite sequence of actual contextual extractions multiplies all output
counts and overheads, with one initial polynomial coefficient extraction. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- A single output copy is the same coefficient tensor, with a harmless singleton label. -/
theorem contextReduction_singleton {X Y Z : Type*} (tensor : Coeff K X Y Z) :
    ContextReduction.{v} tensor (directSum (fun _ : Fin 1 => tensor)) 1 := by
  have pulled := contextReduction_pullback.{v} tensor
    (fun x : Fin 1 × X => x.2) (fun y : Fin 1 × Y => y.2) (fun z : Fin 1 × Z => z.2)
  convert pulled using 1
  funext x y z
  simp only [directSum, Subsingleton.elim x.1 y.1, Subsingleton.elim y.1 z.1, and_self, if_true]

/-- Composing two integer-indexed extraction batches gives exactly the product copy count. -/
theorem ContextReduction.compose_fin_extractions {X Y Z U V W A B C : Type*}
    {source : Coeff K X Y Z} {middle : Coeff K U V W} {target : Coeff K A B C}
    {firstCopies secondCopies firstCost secondCost : ℕ}
    (first : ContextReduction.{v} source (directSum (fun _ : Fin firstCopies => middle)) firstCost)
    (second : ContextReduction.{v} middle (directSum (fun _ : Fin secondCopies => target)) secondCost) :
    ContextReduction.{v} source (directSum (fun _ : Fin (firstCopies*secondCopies) => target)) (firstCost*secondCost) := by
  let copies : Fin (firstCopies*secondCopies) ≃ Fin firstCopies × Fin secondCopies :=
    Fintype.equivOfCardEq (by simp only [Fintype.card_fin, Fintype.card_prod])
  have both := first.compose_extractions second
  simpa only [one_mul, Nat.mul_comm secondCost firstCost] using
    both.trans (contextReduction_relabelCopies target copies)

/-- Every finite prefix preserves all stages' earned copies and pays exactly the product of their proved overheads. -/
theorem contextReduction_sequence {X Y Z : ℕ → Type*}
    (tensors : ∀ stage, Coeff K (X stage) (Y stage) (Z stage)) (copies overhead : ℕ → ℕ) (length : ℕ)
    (stages : ∀ stage, stage < length → ContextReduction.{v} (tensors stage)
      (directSum (fun _ : Fin (copies stage) => tensors (stage+1))) (overhead stage)) :
    ContextReduction.{v} (tensors 0)
      (directSum (fun _ : Fin (∏ stage ∈ Finset.range length, copies stage) => tensors length))
      (∏ stage ∈ Finset.range length, overhead stage) := by
  induction length with
  | zero => simpa only [Finset.range_zero, Finset.prod_empty] using contextReduction_singleton (tensors 0)
  | succ length induction =>
    have earlier := induction (fun stage before => stages stage (Nat.lt_succ_of_lt before))
    have combined := earlier.compose_fin_extractions (stages length (Nat.lt_succ_self length))
    let numbering : Fin (∏ stage ∈ Finset.range (length+1), copies stage) ≃
        Fin ((∏ stage ∈ Finset.range length, copies stage)*copies length) :=
      Fintype.equivOfCardEq (by simp only [Fintype.card_fin, Finset.prod_range_succ])
    simpa only [one_mul, Finset.prod_range_succ] using
      combined.trans (contextReduction_relabelCopies (tensors (length+1)) numbering)

/-- A finite sequence starts from the genuine initial polynomial certificate and extracts coefficients once. -/
theorem context_sequence_rank {X Y Z : ℕ → Type*}
    (tensors : ∀ stage, Coeff K (X stage) (Y stage) (Z stage)) (copies overhead : ℕ → ℕ) (length : ℕ)
    (stages : ∀ stage, stage < length → ContextReduction.{v} (tensors stage)
      (directSum (fun _ : Fin (copies stage) => tensors (stage+1))) (overhead stage))
    (rank degree : ℕ) (certificate : Degeneration.Certificate (tensors 0) rank degree) :
    RankLE (directSum (fun _ : Fin (∏ stage ∈ Finset.range length, copies stage) => tensors length))
      ((∏ stage ∈ Finset.range length, overhead stage)*(rank*(degree+1)^2)) :=
  (contextReduction_sequence tensors copies overhead length stages).apply_certificate certificate

end
end MatrixBounds.Tensor
