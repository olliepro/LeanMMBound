import LabelledConcentration
import GroupedMoments
import ApproximateTypes

/-! The actual empirical parent distribution of independently typed labelled
child pools concentrates around the mixture of the independent child laws. -/
namespace MatrixBounds.Empirical

open Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Pool Parent Group Slot B : Type*} {Positions : Pool → Type*}

/-- Restrict the parent-slot embedding to a specified parent group without losing injectivity. -/
def groupPlacement (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (group : Parent → Group) (label : Group) : {parent // group parent = label} × Slot ↪
      (pool : Pool) × Positions pool :=
  ((Function.Embedding.subtype (fun parent => group parent = label)).prodMap
    (Function.Embedding.refl Slot)).trans placement

/-- A grouped parent's observed pattern reads each of its assigned labelled child slots. -/
def observedPattern (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (words : ∀ pool, Positions pool → B) (parent : Parent) (slot : Slot) : B :=
  poolRead words (placement (parent, slot))

variable [Fintype Pool] [Fintype Parent] [Fintype Group] [Fintype Slot] [Fintype B]
variable [∀ pool, Fintype (Positions pool)]

/-- The expected parent law is the group-size-weighted mixture of independent child distributions. -/
def groupedCenter (group : Parent → Group) (label : Group → Slot → Pool)
    (profile : Pool → B → ℕ) (pattern : Slot → B) : ℝ :=
  ∑ type, ((Fintype.card {parent // group parent = type} : ℝ)/Fintype.card Parent) *
    ∏ slot, (profile (label type slot) (pattern slot) : ℝ)/Fintype.card (Positions (label type slot))

/-- All parent groups together obey an inverse-population bound, even with zero-size groups. -/
theorem grouped_pattern_concentration [Nonempty Parent]
    (profile : Pool → B → ℕ) (representative : ∀ pool, TypedWord (P := Positions pool) (profile pool))
    (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (group : Parent → Group) (label : Group → Slot → Pool)
    (labels : ∀ parent slot, (placement (parent, slot)).1 = label (group parent) slot)
    (pattern : Slot → B) {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ pool, TypedWord (P := Positions pool) (profile pool) // threshold ≤
      |(count (observedPattern placement (fun pool => (words pool).val)) pattern : ℝ)/Fintype.card Parent -
        groupedCenter (Positions := Positions) group label profile pattern|} : ℝ) /
      Fintype.card (∀ pool, TypedWord (P := Positions pool) (profile pool)) ≤
        ((1+6*(Fintype.card Slot : ℝ))*Fintype.card Group) / ((Fintype.card Parent : ℝ)*threshold^2) := by
  letI : Nonempty (∀ pool, TypedWord (P := Positions pool) (profile pool)) := ⟨representative⟩
  let event := fun parent (words : ∀ pool, TypedWord (P := Positions pool) (profile pool)) =>
    ∀ slot, poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot
  let center := fun type => ∏ slot,
    (profile (label type slot) (pattern slot) : ℝ)/Fintype.card (Positions (label type slot))
  have individual (type : Group) := labelled_block_second_moment profile representative
    (groupPlacement placement group type) (label type)
    (fun parent slot => (labels parent.val slot).trans (congrArg (fun type => label type slot) parent.property)) pattern
  have bound := grouped_frequency_concentration group (fun parent => indicator (event parent)) center
    (1+6*(Fintype.card Slot : ℝ)) individual positive
  have counts (words : ∀ pool, TypedWord (P := Positions pool) (profile pool)) :
      (∑ parent, indicator (event parent) words) =
        count (observedPattern placement (fun pool => (words pool).val)) pattern := by
    have events (parent : Parent) : event parent words ↔
        observedPattern placement (fun pool => (words pool).val) parent = pattern := funext_iff.symm
    simp only [indicator, events, count, Nat.card_eq_fintype_card, Fintype.card_subtype,
      Finset.sum_boole]
  simpa only [counts] using bound

/-- A finite union over complete parent patterns bounds failure of the actual empirical window. -/
theorem grouped_parent_window_concentration [Nonempty Parent]
    (profile : Pool → B → ℕ) (representative : ∀ pool, TypedWord (P := Positions pool) (profile pool))
    (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (group : Parent → Group) (label : Group → Slot → Pool)
    (labels : ∀ parent slot, (placement (parent, slot)).1 = label (group parent) slot)
    {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ pool, TypedWord (P := Positions pool) (profile pool) //
      ¬Within (groupedCenter (Positions := Positions) group label profile) threshold
        (observedPattern placement (fun pool => (words pool).val))} : ℝ) /
      Fintype.card (∀ pool, TypedWord (P := Positions pool) (profile pool)) ≤
        ((Fintype.card (Slot → B) : ℝ)*(1+6*(Fintype.card Slot : ℝ))*Fintype.card Group) /
          ((Fintype.card Parent : ℝ)*threshold^2) := by
  let bad : (Slot → B) → (∀ pool, TypedWord (P := Positions pool) (profile pool)) → Prop := fun pattern words =>
    threshold ≤ |(count (observedPattern placement (fun pool => (words pool).val)) pattern : ℝ)/Fintype.card Parent -
      groupedCenter (Positions := Positions) group label profile pattern|
  have contained : Nat.card {words : ∀ pool, TypedWord (P := Positions pool) (profile pool) //
      ¬Within (groupedCenter (Positions := Positions) group label profile) threshold
        (observedPattern placement (fun pool => (words pool).val))} ≤
        Nat.card {words // ∃ pattern, bad pattern words} := by
    simp only [Nat.card_eq_fintype_card]
    apply Fintype.card_subtype_mono
    intro words outside
    simp only [Within, not_forall, not_le] at outside
    obtain ⟨pattern, fails⟩ := outside
    exact ⟨pattern, fails.le⟩
  have union := contained.trans (Selection.union_count bad)
  have divided := div_le_div_of_nonneg_right
    (show (Nat.card {words : ∀ pool, TypedWord (P := Positions pool) (profile pool) //
      ¬Within (groupedCenter (Positions := Positions) group label profile) threshold
        (observedPattern placement (fun pool => (words pool).val))} : ℝ) ≤
      ∑ pattern, (Nat.card {words // bad pattern words} : ℝ) by exact_mod_cast union)
    (Nat.cast_nonneg (Fintype.card (∀ pool, TypedWord (P := Positions pool) (profile pool))))
  rw [Finset.sum_div] at divided
  apply divided.trans
  have summed := Finset.sum_le_sum (s := Finset.univ) (fun pattern _ =>
    grouped_pattern_concentration profile representative placement group label labels pattern positive)
  convert summed using 1
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  ring

end
end MatrixBounds.Empirical
