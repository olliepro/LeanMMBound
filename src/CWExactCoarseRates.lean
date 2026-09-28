import CWCoarseEntropy

/-! If the three prescribed marginals determine the joint type, the complete
coarse graph has no entropy penalty. Its actual maximum degree has a direct
marginal-entropy bound that requires no positive Gibbs potentials. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length : ℕ}

/-- An everywhere-prescribed full graph has precisely the empirical joint-type count. -/
theorem complete_graph_count (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (complete : ∀ edge : data.Edges (P := P), data.prescribed edge) :
    Nat.card (data.Edges (P := P)) = Nat.card (TypedWord (P := P) data.split) := by
  let equivalence : data.Edges (P := P) ≃ data.PrescribedEdges (P := P) := {
    toFun := fun edge => ⟨edge, complete edge⟩
    invFun := Subtype.val
    left_inv := fun _ => rfl
    right_inv := fun _ => rfl }
  exact (Nat.card_congr equivalence).trans (data.prescribed_card reference)

/-- Every X-fiber in an everywhere-prescribed graph has reciprocal-marginal normalized size. -/
theorem complete_fiber_ratio (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (complete : ∀ edge : data.Edges (P := P), data.prescribed edge) (edge : data.Edges (P := P)) :
    (Nat.card {other : data.Edges (P := P) //
      marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ other =
        marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ edge} : ℝ) /
      Fintype.card (TypedWord (P := P) data.split) =
      1 / Fintype.card (TypedWord (P := P) data.coarseX) := by
  let block := marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ edge
  letI : Nonempty (TypedWord (P := P) data.coarseX) := ⟨block⟩
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWord reference⟩
  have identity := marginalX_degree_identity (@splitXIndex data.parent (2*length)) splitYIndex splitZIndex
    data.coarseX data.coarseY data.coarseZ block
  have total := data.complete_graph_count reference complete
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card] at total
  have productCount := identity.trans total
  have positiveB : (0 : ℝ) < Fintype.card (TypedWord (P := P) data.coarseX) := by exact_mod_cast Fintype.card_pos
  have positiveG : (0 : ℝ) < Fintype.card (TypedWord (P := P) data.split) := by exact_mod_cast Fintype.card_pos
  apply (div_eq_div_iff positiveG.ne' positiveB.ne').mpr
  rw [one_mul, mul_comm]
  exact_mod_cast productCount

/-- The actual complete maximum degree has its marginal-entropy rate and explicit finite counting error. -/
theorem complete_coarse_degree_rate (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (complete : ∀ edge : data.Edges (P := P), data.prescribed edge) :
    (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*Entropy.entropy
        (fun value => (data.coarseX value : ℝ)/Fintype.card P) +
        (2*(length : ℝ)+1)*(Real.log ((Fintype.card P : ℝ)+1)+1)) := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWord reference⟩
  unfold coarseDegree
  apply Selection.finite_maximum_normalized_bound _ _ Fintype.card_pos (Real.exp_pos _).le
  intro edge _
  rw [data.complete_fiber_ratio reference complete edge]
  let block := marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ edge
  letI : Nonempty (TypedWord (P := P) data.coarseX) := ⟨block⟩
  have positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) data.coarseX) := by exact_mod_cast Fintype.card_pos
  have lower := (log_type_count_bounds_any data.coarseX block).1
  simp only [Fintype.card_fin, Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_ofNat] at lower
  rw [← Real.exp_log positive, one_div, ← Real.exp_neg, Real.exp_le_exp]
  linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
