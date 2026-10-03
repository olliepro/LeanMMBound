module

public import ApproximateTypes
public import HeterogeneousTypeGluing

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Tolerance windows on finite profile labels, with the neutral empty-pool
convention. Empty tensor-power factors impose no distribution constraint. -/
namespace MatrixBounds.Empirical

noncomputable section
variable {P B : Type*} [Fintype P]

/-- A bounded integer profile lies in the specified coordinatewise probability window. -/
def ProfileWithin (center : B → ℝ) (tolerance : ℝ) (profile : Profiles P B) : Prop :=
  ∀ symbol, |((profile symbol).val : ℝ)/Fintype.card P-center symbol| ≤ tolerance

/-- Empty pools accept their unique profile without imposing a probability-law constraint. -/
def ActiveProfileWithin (center : B → ℝ) (tolerance : ℝ) (profile : Profiles P B) : Prop :=
  Fintype.card P = 0 ∨ ProfileWithin center tolerance profile

/-- Reading an actual word's bounded profile recovers its original empirical-window predicate. -/
theorem profileWithin_profileOf (center : B → ℝ) (tolerance : ℝ) (word : P → B) :
    ProfileWithin center tolerance (profileOf word) ↔ Within center tolerance word := Iff.rfl

/-- On nonempty pools, the active-profile convention is precisely the ordinary distribution window. -/
theorem activeProfileWithin_nonempty [Nonempty P] (center : B → ℝ) (tolerance : ℝ) (profile : Profiles P B) :
    ActiveProfileWithin center tolerance profile ↔ ProfileWithin center tolerance profile := by
  simp only [ActiveProfileWithin, (Fintype.card_pos (α := P)).ne', false_or]

/-- An accepted bounded child profile is close to its nominal law whenever its split count is nonzero. -/
theorem split_profile_close {length : ℕ} {count : ℕ} (profile : Profiles (Fin (2*count)) (Fin length → Fin 3))
    (law : (Fin length → Fin 3) → ℝ) (tolerance : ℝ) (nonempty : count ≠ 0)
    (accepted : ActiveProfileWithin law tolerance profile) (symbol : Fin length → Fin 3) :
    |((profile symbol).val : ℝ)/(2*count)-law symbol| ≤ tolerance := by
  have positionsPositive : Fintype.card (Fin (2*count)) ≠ 0 := by simp only [Fintype.card_fin]; omega
  have close := (accepted.resolve_left positionsPositive) symbol
  simpa only [Fintype.card_fin, Nat.cast_mul, Nat.cast_ofNat] using close

end
end MatrixBounds.Empirical
