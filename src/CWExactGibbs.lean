module

public import CWCoarseRates
public import CWTerminalProbabilities
public import EntropyRelabeling

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A split distribution represented exactly by positive coordinate potentials
has zero Gibbs penalty in the actual extraction rate. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- Exact normalized coordinate potentials make the complete graph Gibbs entropy equal to the prescribed split entropy. -/
theorem gibbsCost_exact (data : SplitRestrictionData length) (reference : TypedWord (P := P) data.split)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b)
    (marginalX : data.coarseX = marginalProfile data.split shapeXIndex)
    (marginalY : data.coarseY = marginalProfile data.split shapeYIndex)
    (marginalZ : data.coarseZ = marginalProfile data.split shapeZIndex)
    (support : ∀ child, ¬child.val.Fits data.parent → data.split child = 0)
    (exactWeight : ∀ child : SplitAlphabet data.parent (2*length),
      (data.split child.val : ℝ)/Fintype.card P = ux (splitXIndex child)*uy (splitYIndex child)*uz (splitZIndex child)) :
    data.gibbsCost (P := P) ux uy uz = entropy (fun child => (data.split child : ℝ)/Fintype.card P) := by
  let probability := fun child : ShapeAlphabet (2*length) => (data.split child : ℝ)/Fintype.card P
  have outside (child : ShapeAlphabet (2*length)) (absent : ¬child.val.Fits data.parent) : probability child = 0 := by
    simp only [probability, support child absent, Nat.cast_zero, zero_div]
  have total : (∑ child, probability child) = 1 := by
    simp only [probability, ← Finset.sum_div, ← Nat.cast_sum, profile_total data.split reference]
    exact div_self (by exact_mod_cast (Fintype.card_pos (α := P)).ne')
  have restrictedTotal : (∑ child : SplitAlphabet data.parent (2*length), probability child.val) = 1 := by
    rw [← total]
    symm
    exact Finset.sum_congr_set {child : ShapeAlphabet (2*length) | child.val.Fits data.parent} _ _ (fun _ _ => rfl) outside
  have partition : (∑ child : SplitAlphabet data.parent (2*length),
      ux (splitXIndex child)*uy (splitYIndex child)*uz (splitZIndex child)) = 1 := by
    simpa only [probability, exactWeight] using restrictedTotal
  have expectation (axis : ShapeAlphabet (2*length) → Fin (2*length+1)) (potential : Fin (2*length+1) → ℝ) :
      (∑ value, ((marginalProfile data.split axis value : ℕ) : ℝ)/Fintype.card P*Real.log (potential value)) =
        ∑ child, probability child*Real.log (potential (axis child)) := by
    have identity := expectation_marginal probability axis (fun value => Real.log (potential value))
    rw [← marginalProfile_div] at identity
    exact identity.symm
  unfold gibbsCost
  rw [partition, Real.log_one, marginalX, marginalY, marginalZ, expectation, expectation, expectation]
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  have supportedSum := Finset.sum_congr_set {child : ShapeAlphabet (2*length) | child.val.Fits data.parent}
    (fun child => probability child*Real.log (ux (shapeXIndex child)) +
      probability child*Real.log (uy (shapeYIndex child)) + probability child*Real.log (uz (shapeZIndex child)))
    (fun child : SplitAlphabet data.parent (2*length) => probability child.val*Real.log (probability child.val))
    (by
      intro child fits
      dsimp only
      have identity := exactWeight ⟨child, fits⟩
      change probability child = ux (shapeXIndex child)*uy (shapeYIndex child)*uz (shapeZIndex child) at identity
      rw [identity, Real.log_mul (mul_pos (positiveX _) (positiveY _)).ne' (positiveZ _).ne',
        Real.log_mul (positiveX _).ne' (positiveY _).ne']
      ring)
    (by intro child absent; simp only [outside child absent, zero_mul, zero_add])
  rw [supportedSum, entropy_supported _ probability outside]
  simp only [zero_sub, entropy]
  congr 1

/-- Exact Gibbs representation removes the penalty from the actual normalized coarse-X retention. -/
theorem coarseRetention_of_exact_gibbs (data : SplitRestrictionData length) (reference : TypedWord (P := P) data.split)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b)
    (marginalX : data.coarseX = marginalProfile data.split shapeXIndex)
    (marginalY : data.coarseY = marginalProfile data.split shapeYIndex)
    (marginalZ : data.coarseZ = marginalProfile data.split shapeZIndex)
    (support : ∀ child, ¬child.val.Fits data.parent → data.split child = 0)
    (exactWeight : ∀ child : SplitAlphabet data.parent (2*length),
      (data.split child.val : ℝ)/Fintype.card P = ux (splitXIndex child)*uy (splitYIndex child)*uz (splitZIndex child)) :
    data.coarseRetention (P := P) ux uy uz = entropy (fun value => (data.coarseX value : ℝ)/Fintype.card P) := by
  unfold coarseRetention
  rw [data.gibbsCost_exact reference ux uy uz positiveX positiveY positiveZ marginalX marginalY marginalZ support exactWeight]
  ring

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
