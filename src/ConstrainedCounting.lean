module

public import GibbsCounting

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Cardinality bounds for admissible coarse words with three prescribed
marginals. Positive coordinate potentials provide a finite counting certificate. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P A BX BY BZ : Type*} [Fintype P] [Fintype A]
variable [Fintype BX] [Fintype BY] [Fintype BZ]

/-- Integer marginal profile obtained by grouping the joint-symbol counts by one coordinate. -/
def marginalProfile {B : Type*} (profile : A → ℕ) (index : A → B) (label : B) : ℕ :=
  ∑ symbol, if index symbol = label then profile symbol else 0

/-- Projecting an actual word gives precisely the integer marginal of its empirical profile. -/
theorem projected_count {B : Type*} (word : P → A) (index : A → B) (label : B) :
    count (fun p => index (word p)) label = marginalProfile (count word) index label := by
  have result := sum_by_counts word (fun symbol => if index symbol = label then 1 else 0)
  simp only [mul_ite, mul_one, mul_zero, Finset.sum_boole] at result
  change Nat.card {p // index (word p) = label} = ∑ a, if index a = label then count word a else 0
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  exact_mod_cast result

/-- Exact joint types induce all their exact projected types. -/
theorem hasType_projected {B : Type*} (profile : A → ℕ) (index : A → B)
    (word : P → A) (typed : HasType profile word) :
    HasType (marginalProfile profile index) (fun p => index (word p)) := by
  intro label
  rw [projected_count]
  have same : count word = profile := funext typed
  rw [same]

/-- Admissible joint words are exactly those with all three prescribed marginal profiles. -/
abbrev MarginalWords (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (px : BX → ℕ) (py : BY → ℕ) (pz : BZ → ℕ) :=
  {word : P → A // HasType px (fun p => ix (word p)) ∧
    HasType py (fun p => iy (word p)) ∧ HasType pz (fun p => iz (word p))}

omit [Fintype BX] [Fintype BY] [Fintype BZ] in
/-- Joint empirical profiles witness feasibility of the three-marginal constraint. -/
theorem marginalWords_nonempty (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (profile : A → ℕ) (representative : TypedWord (P := P) profile) :
    Nonempty (MarginalWords (P := P) ix iy iz
      (marginalProfile profile ix) (marginalProfile profile iy) (marginalProfile profile iz)) := by
  exact ⟨⟨representative.val, hasType_projected profile ix representative.val representative.property,
    hasType_projected profile iy representative.val representative.property,
    hasType_projected profile iz representative.val representative.property⟩⟩

/-- Gibbs potentials bound the number of actual words with fixed X,Y,Z marginal types.
No maximum-entropy value or optimizer correctness is assumed. -/
theorem marginal_word_count_bound [Nonempty A] (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (px : BX → ℕ) (py : BY → ℕ) (pz : BZ → ℕ)
    (ux : BX → ℝ) (uy : BY → ℝ) (uz : BZ → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b) :
    (Nat.card (MarginalWords (P := P) ix iy iz px py pz) : ℝ) ≤
      Real.exp ((Fintype.card P : ℝ)*Real.log (∑ a, ux (ix a)*uy (iy a)*uz (iz a)) -
        ((∑ b, (px b : ℝ)*Real.log (ux b)) + (∑ b, (py b : ℝ)*Real.log (uy b)) +
          ∑ b, (pz b : ℝ)*Real.log (uz b))) := by
  apply gibbs_word_count _ (fun a => ux (ix a)*uy (iy a)*uz (iz a))
    (fun a => mul_pos (mul_pos (positiveX _) (positiveY _)) (positiveZ _))
  rintro word ⟨typedX, typedY, typedZ⟩
  simp only [Real.log_mul (mul_pos (positiveX _) (positiveY _)).ne' (positiveZ _).ne',
    Real.log_mul (positiveX _).ne' (positiveY _).ne', Finset.sum_add_distrib]
  rw [typed_word_log_weight px ux ⟨fun p => ix (word p), typedX⟩,
    typed_word_log_weight py uy ⟨fun p => iy (word p), typedY⟩,
    typed_word_log_weight pz uz ⟨fun p => iz (word p), typedZ⟩]

end
end MatrixBounds.Empirical
