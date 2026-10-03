module

public import CWRootDegrees
public import FiniteMaximumRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete marginal graph, including all nonprescribed competitors, has
the required uniform coarse-degree entropy bound. Gibbs potentials supply the
count certificate without assuming correctness of an entropy optimizer. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- Finite normalized coarse-degree exponent from positive Gibbs potentials and exact type-count errors. -/
def coarseDegreeExponent (data : RootRestrictionData length)
    (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  (Fintype.card P : ℝ)*Real.log (∑ a : SplitAlphabet (rootBox (2*length)) (2*length),
    ux (splitXIndex a)*uy (splitYIndex a)*uz (splitZIndex a)) -
  ((∑ b, ((data.coarse 0) b : ℝ)*Real.log (ux b)) +
    (∑ b, ((data.coarse 1) b : ℝ)*Real.log (uy b)) +
    ∑ b, ((data.coarse 2) b : ℝ)*Real.log (uz b)) -
  ((Fintype.card P : ℝ)*Entropy.entropy (fun b => ((data.coarse 0) b : ℝ)/Fintype.card P) -
    Fintype.card (Fin (2*length+1))*(Real.log ((Fintype.card P : ℝ)+1)+1)) -
  ((Fintype.card P : ℝ)*Entropy.entropy (fun a => (data.split a : ℝ)/Fintype.card P) -
    Fintype.card (ShapeAlphabet (2*length))*(Real.log ((Fintype.card P : ℝ)+1)+1))

/-- Every complete-graph X fiber satisfies one common entropy estimate relative to prescribed edges. -/
theorem coarse_fiber_entropy (data : RootRestrictionData length)
    (reference : data.PrescribedEdges (P := P)) (edge : data.Edges (P := P))
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b) :
    (Nat.card {other : data.Edges (P := P) //
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
        marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) edge} : ℝ)/
        Fintype.card (TypedWord (P := P) data.split) ≤ Real.exp (data.coarseDegreeExponent (P := P) ux uy uz) := by
  let block := marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) edge
  letI : Nonempty (TypedWord (P := P) (data.coarse 0)) := ⟨block⟩
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWordEquiv reference⟩
  letI : Nonempty (SplitAlphabet (rootBox (2*length)) (2*length)) := ⟨reference.val.val (Classical.choice inferInstance)⟩
  have identity := marginalX_degree_identity (@splitXIndex (rootBox (2*length)) (2*length)) splitYIndex splitZIndex
    (data.coarse 0) (data.coarse 1) (data.coarse 2) block
  have upper := marginal_word_count_bound (P := P) (@splitXIndex (rootBox (2*length)) (2*length))
    splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) ux uy uz positiveX positiveY positiveZ
  unfold coarseDegreeExponent
  apply Selection.regular_fiber_exponential_rate Fintype.card_pos Fintype.card_pos identity
  · simpa only [Nat.card_eq_fintype_card] using upper
  · exact (log_type_count_bounds_any (data.coarse 0) block).1
  · exact (log_type_count_bounds_any data.split (data.prescribedWordEquiv reference)).1

/-- The actual maximum complete-graph X degree satisfies the same finite entropy bound. -/
theorem coarse_degree_entropy (data : RootRestrictionData length)
    (reference : data.PrescribedEdges (P := P)) (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b) :
    (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (data.coarseDegreeExponent (P := P) ux uy uz) := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWordEquiv reference⟩
  unfold coarseDegree
  apply Selection.finite_maximum_normalized_bound _ _ Fintype.card_pos (Real.exp_pos _).le
  intro edge _
  exact data.coarse_fiber_entropy reference edge ux uy uz positiveX positiveY positiveZ

end
end MatrixBounds.Tensor.CW.RootRestrictionData
