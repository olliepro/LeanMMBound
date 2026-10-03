module

public import IncidenceRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The X competitor rate follows from the complete marginal graph, Gibbs
counting, and the exact multinomial sizes of prescribed edges and coarse vertices. -/
namespace MatrixBounds.Selection

/-- An exact regular-fiber identity and exponential count bounds control the normalized degree. -/
theorem regular_fiber_exponential_rate {blocks edges allEdges degree : ℕ}
    (blocksPositive : 0 < blocks) (edgesPositive : 0 < edges)
    (identity : blocks*degree = allEdges) {cost blockLower edgeLower : ℝ}
    (allBound : (allEdges : ℝ) ≤ Real.exp cost)
    (blockBound : blockLower ≤ Real.log blocks) (edgeBound : edgeLower ≤ Real.log edges) :
    (degree : ℝ)/edges ≤ Real.exp (cost-blockLower-edgeLower) := by
  have positiveB : (0 : ℝ) < blocks := by exact_mod_cast blocksPositive
  have positiveE : (0 : ℝ) < edges := by exact_mod_cast edgesPositive
  calc
    _ = (allEdges : ℝ)/((blocks : ℝ)*edges) := by
      rw [← identity, Nat.cast_mul]
      field_simp
    _ ≤ Real.exp cost/((blocks : ℝ)*edges) :=
      div_le_div_of_nonneg_right allBound (mul_pos positiveB positiveE).le
    _ = Real.exp (cost-Real.log blocks-Real.log edges) := by
      rw [Real.exp_sub, Real.exp_sub, Real.exp_log positiveB, Real.exp_log positiveE, div_div]
    _ ≤ Real.exp (cost-blockLower-edgeLower) := Real.exp_le_exp.mpr (by linarith)

end MatrixBounds.Selection

namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P A BX BY BZ : Type*} [Fintype P] [Fintype A] [Nonempty A]
variable [Fintype BX] [Fintype BY] [Fintype BZ]

/-- The actual coarse-X fiber has the entropy rate used in asymmetric retention, with finite errors.
Positive Gibbs potentials give a certified upper count on all admissible marginal words. -/
theorem coarse_x_entropy_rate (profile : A → ℕ) (representative : TypedWord (P := P) profile)
    (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (block : TypedWord (P := P) (marginalProfile profile ix))
    (ux : BX → ℝ) (uy : BY → ℝ) (uz : BZ → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b) :
    (Nat.card {word : MarginalWords (P := P) ix iy iz
      (marginalProfile profile ix) (marginalProfile profile iy) (marginalProfile profile iz) //
        marginalX ix iy iz (marginalProfile profile ix) (marginalProfile profile iy)
          (marginalProfile profile iz) word = block} : ℝ) /
      Fintype.card (TypedWord (P := P) profile) ≤
    Real.exp (
      (Fintype.card P : ℝ)*Real.log (∑ a, ux (ix a)*uy (iy a)*uz (iz a)) -
      ((∑ b, (marginalProfile profile ix b : ℝ)*Real.log (ux b)) +
        (∑ b, (marginalProfile profile iy b : ℝ)*Real.log (uy b)) +
        ∑ b, (marginalProfile profile iz b : ℝ)*Real.log (uz b)) -
      ((Fintype.card P : ℝ)*Entropy.entropy (fun b => (marginalProfile profile ix b : ℝ)/Fintype.card P) -
        Fintype.card BX*(Real.log ((Fintype.card P : ℝ)+1)+1)) -
      ((Fintype.card P : ℝ)*Entropy.entropy (fun a => (profile a : ℝ)/Fintype.card P) -
        Fintype.card A*(Real.log ((Fintype.card P : ℝ)+1)+1))) := by
  letI : Nonempty (TypedWord (P := P) profile) := ⟨representative⟩
  letI : Nonempty (TypedWord (P := P) (marginalProfile profile ix)) := ⟨block⟩
  have identity := marginalX_degree_identity ix iy iz
    (marginalProfile profile ix) (marginalProfile profile iy) (marginalProfile profile iz) block
  have upper := marginal_word_count_bound (P := P) ix iy iz
    (marginalProfile profile ix) (marginalProfile profile iy) (marginalProfile profile iz)
    ux uy uz positiveX positiveY positiveZ
  apply Selection.regular_fiber_exponential_rate Fintype.card_pos Fintype.card_pos identity
  · simpa only [Nat.card_eq_fintype_card] using upper
  · exact (log_type_count_bounds_any (marginalProfile profile ix) block).1
  · exact (log_type_count_bounds_any profile representative).1

end
end MatrixBounds.Empirical
