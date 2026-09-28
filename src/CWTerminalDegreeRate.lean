import CWTerminalData
import CWCoarseEntropy

/-! The terminal coarse degree has its marginal-entropy bound without positive
Gibbs potentials. Endpoint split laws therefore require no limiting argument. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- The entire terminal graph has exactly the full-alphabet prescribed type count. -/
theorem full_graph_prescribed_count (profile : Symbol → ℕ) (word : TypedWord (P := P) profile) :
    Fintype.card ((data profile).Edges (P := P)) = Fintype.card (TypedWord (P := P) (data profile).split) := by
  have identity := (Nat.card_congr (prescribedEquiv (P := P) profile)).trans
    ((data profile).prescribed_card (reference profile word))
  simpa only [Nat.card_eq_fintype_card] using identity

/-- A complete terminal X fiber has reciprocal-marginal normalized degree, including zero split entries. -/
theorem terminal_fiber_ratio (profile : Symbol → ℕ) (word : TypedWord (P := P) profile)
    (edge : (data profile).Edges (P := P)) :
    (Nat.card {other : (data profile).Edges (P := P) //
      marginalX splitXIndex splitYIndex splitZIndex (data profile).coarseX (data profile).coarseY (data profile).coarseZ other =
        marginalX splitXIndex splitYIndex splitZIndex (data profile).coarseX (data profile).coarseY (data profile).coarseZ edge} : ℝ) /
      Fintype.card (TypedWord (P := P) (data profile).split) =
      1 / Fintype.card (TypedWord (P := P) (data profile).coarseX) := by
  let block := marginalX splitXIndex splitYIndex splitZIndex
    (data profile).coarseX (data profile).coarseY (data profile).coarseZ edge
  letI : Nonempty (TypedWord (P := P) (data profile).coarseX) := ⟨block⟩
  letI : Nonempty (TypedWord (P := P) (data profile).split) := ⟨(data profile).prescribedWord (reference profile word)⟩
  have identity := marginalX_degree_identity (@splitXIndex parent 2) splitYIndex splitZIndex
    (data profile).coarseX (data profile).coarseY (data profile).coarseZ block
  have complete := identity.trans (full_graph_prescribed_count profile word)
  have positiveB : (0 : ℝ) < Fintype.card (TypedWord (P := P) (data profile).coarseX) := by exact_mod_cast Fintype.card_pos
  have positiveG : (0 : ℝ) < Fintype.card (TypedWord (P := P) (data profile).split) := by exact_mod_cast Fintype.card_pos
  apply (div_eq_div_iff positiveG.ne' positiveB.ne').mpr
  rw [one_mul, mul_comm]
  exact_mod_cast complete

/-- Actual terminal maximum coarse degree has the marginal-entropy rate with an explicit finite type-count error. -/
theorem terminal_coarse_degree_rate (profile : Symbol → ℕ) (word : TypedWord (P := P) profile) :
    ((data profile).coarseDegree (P := P) : ℝ) / Fintype.card (TypedWord (P := P) (data profile).split) ≤
      Real.exp (-(Fintype.card P : ℝ)*Entropy.entropy
        (fun label => ((data profile).coarseX label : ℝ)/Fintype.card P) +
          3*(Real.log ((Fintype.card P : ℝ)+1)+1)) := by
  letI : Nonempty (TypedWord (P := P) (data profile).split) := ⟨(data profile).prescribedWord (reference profile word)⟩
  unfold SplitRestrictionData.coarseDegree
  apply Selection.finite_maximum_normalized_bound _ _ Fintype.card_pos (Real.exp_pos _).le
  intro edge _
  rw [terminal_fiber_ratio profile word edge]
  let block := marginalX splitXIndex splitYIndex splitZIndex
    (data profile).coarseX (data profile).coarseY (data profile).coarseZ edge
  letI : Nonempty (TypedWord (P := P) (data profile).coarseX) := ⟨block⟩
  have positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) (data profile).coarseX) := by exact_mod_cast Fintype.card_pos
  have lower := (log_type_count_bounds_any (data profile).coarseX block).1
  norm_num only [Fintype.card_fin, Nat.cast_ofNat] at lower
  rw [← Real.exp_log positive, one_div, ← Real.exp_neg, Real.exp_le_exp]
  linarith

end
end MatrixBounds.Tensor.CW.Terminal
