module

public import CWCollisionCounts
public import CWPooledDegrees
public import SupportedTypes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual fine-block compatibility degrees bound the collision holes used by
Y/Z ownership. Competitors are prescribed exact split words, excluding the owner. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- View a supported exact split word as an actual admissible coarse word. -/
def admissibleWord {parent : Shape} {total : ℕ} (splitProfile : ShapeAlphabet total → ℕ)
    (support : ∀ symbol, ¬symbol.val.Fits parent → splitProfile symbol = 0)
    (word : TypedWord (P := P) splitProfile) : P → SplitAlphabet parent total :=
  (supportedTypeEquiv (fun symbol => symbol.val.Fits parent) splitProfile support word).val

/-- Distinct supported exact split words remain distinct after their support proofs are attached. -/
theorem admissibleWord_injective {parent : Shape} {total : ℕ} (splitProfile : ShapeAlphabet total → ℕ)
    (support : ∀ symbol, ¬symbol.val.Fits parent → splitProfile symbol = 0) :
    Function.Injective (admissibleWord (P := P) splitProfile support) := by
  intro left right same
  apply Subtype.ext
  funext position
  exact congrArg (fun word : P → SplitAlphabet parent total => (word position).val) same

omit [Fintype P] in
/-- Excluding a reference edge only reduces the total compatibility degree. -/
theorem other_compatible_count_le {A : Type*} [Fintype A] (compatible : A → Prop) (reference : A) :
    Nat.card {other // other ≠ reference ∧ compatible other} ≤ Nat.card {other // compatible other} := by
  apply Nat.card_le_card_of_injective
    (fun other : {other // other ≠ reference ∧ compatible other} =>
      (⟨other.val, other.property.2⟩ : {other // compatible other}))
  intro left right same
  exact Subtype.ext (congrArg (fun other : {other // compatible other} => other.val) same)

/-- Coarse-X collision holes are bounded by the actual A/B_X fiber degree of the complete graph. -/
theorem coarse_x_collision_count {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (parent : Shape) (total : ℕ) (px py pz : Fin (total+1) → ℕ)
    (reference : CoarseWords (P := P) parent total px py pz) (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val bucket //
      ∃ other : {other : CoarseWords (P := P) parent total px py pz // other ≠ reference ∧
        marginalX splitXIndex splitYIndex splitZIndex px py pz other =
          marginalX splitXIndex splitYIndex splitZIndex px py pz reference},
        wordCollision reference.val other.val.val bucket seed} * prime ≤
      Nat.card {other : CoarseWords (P := P) parent total px py pz //
        marginalX splitXIndex splitYIndex splitZIndex px py pz other =
          marginalX splitXIndex splitYIndex splitZIndex px py pz reference} * Nat.card (WordBucket reference.val bucket) := by
  let compatible := fun other : CoarseWords (P := P) parent total px py pz =>
    marginalX splitXIndex splitYIndex splitZIndex px py pz other =
      marginalX splitXIndex splitYIndex splitZIndex px py pz reference
  let others := {other : CoarseWords (P := P) parent total px py pz // other ≠ reference ∧ compatible other}
  have bound := shared_x_word_count reference.val (fun other : others => other.val.val)
    (fun other => by
      funext position
      exact congrArg (fun word : TypedWord (P := P) px => (word.val position).val) other.property.2)
    (fun other same => other.property.1 (Subtype.ext same)) large bucket
  have fewer := other_compatible_count_le compatible reference
  have degreeBound : Fintype.card others ≤ Nat.card {other // compatible other} := by
    simpa only [Nat.card_eq_fintype_card] using fewer
  exact bound.trans (Nat.mul_le_mul_right _ degreeBound)

/-- Fine Y compatibility gives the finite conditional collision bound required for ownership. -/
theorem compatible_y_collision_count {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (splitProfile : ShapeAlphabet total → ℕ)
    (support : ∀ symbol, ¬symbol.val.Fits parent → splitProfile symbol = 0)
    (reference : TypedWord (P := P) splitProfile) (fine : P → Fin (length+length) → Fin 3)
    (agrees : coarseAgreement (fun child => child.val.y)
      (fun word => fineTotal (fun i => word (Fin.castAdd length i))) reference.val fine)
    (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket (admissibleWord splitProfile support reference) bucket //
      ∃ other : {other : TypedWord (P := P) splitProfile // other ≠ reference ∧
        compatibleFine length parent balanced yClass profile (fun child => child.val.y) other.val fine},
        wordCollision (admissibleWord splitProfile support reference)
          (admissibleWord splitProfile support other.val) bucket seed} * prime ≤
      Nat.card {other : TypedWord (P := P) splitProfile //
        compatibleFine length parent balanced yClass profile (fun child => child.val.y) other.val fine} *
          Nat.card (WordBucket (admissibleWord splitProfile support reference) bucket) := by
  let compatible := fun other : TypedWord (P := P) splitProfile =>
    compatibleFine length parent balanced yClass profile (fun child => child.val.y) other.val fine
  let others := {other : TypedWord (P := P) splitProfile // other ≠ reference ∧ compatible other}
  have bound := shared_y_word_count (admissibleWord splitProfile support reference)
    (fun other : others => admissibleWord splitProfile support other.val) (fun other => by
      funext position
      exact ((other.property.2.1 position).symm.trans (agrees position)))
    (fun other same => other.property.1 (admissibleWord_injective splitProfile support same)) large bucket
  have fewer := other_compatible_count_le compatible reference
  have degreeBound : Fintype.card others ≤ Nat.card {other // compatible other} := by
    simpa only [Nat.card_eq_fintype_card] using fewer
  exact bound.trans (Nat.mul_le_mul_right _ degreeBound)

/-- Fine Z compatibility supplies the same conditional collision bound after Y's full types are imposed. -/
theorem compatible_z_collision_count {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (splitProfile : ShapeAlphabet total → ℕ)
    (support : ∀ symbol, ¬symbol.val.Fits parent → splitProfile symbol = 0)
    (reference : TypedWord (P := P) splitProfile) (fine : P → Fin (length+length) → Fin 3)
    (agrees : coarseAgreement (fun child => child.val.z)
      (fun word => fineTotal (fun i => word (Fin.castAdd length i))) reference.val fine)
    (large : total < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket (admissibleWord splitProfile support reference) bucket //
      ∃ other : {other : TypedWord (P := P) splitProfile // other ≠ reference ∧
        compatibleFine length parent balanced zClass profile (fun child => child.val.z) other.val fine},
        wordCollision (admissibleWord splitProfile support reference)
          (admissibleWord splitProfile support other.val) bucket seed} * prime ≤
      Nat.card {other : TypedWord (P := P) splitProfile //
        compatibleFine length parent balanced zClass profile (fun child => child.val.z) other.val fine} *
          Nat.card (WordBucket (admissibleWord splitProfile support reference) bucket) := by
  let compatible := fun other : TypedWord (P := P) splitProfile =>
    compatibleFine length parent balanced zClass profile (fun child => child.val.z) other.val fine
  let others := {other : TypedWord (P := P) splitProfile // other ≠ reference ∧ compatible other}
  have bound := shared_z_word_count (admissibleWord splitProfile support reference)
    (fun other : others => admissibleWord splitProfile support other.val) (fun other => by
      funext position
      exact ((other.property.2.1 position).symm.trans (agrees position)))
    (fun other same => other.property.1 (admissibleWord_injective splitProfile support same)) large bucket
  have fewer := other_compatible_count_le compatible reference
  have degreeBound : Fintype.card others ≤ Nat.card {other // compatible other} := by
    simpa only [Nat.card_eq_fintype_card] using fewer
  exact bound.trans (Nat.mul_le_mul_right _ degreeBound)

end
end MatrixBounds.Tensor.CW
