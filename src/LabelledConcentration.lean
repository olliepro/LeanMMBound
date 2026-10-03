module

public import HeterogeneousConcentration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Concentration for disjoint blocks whose slots carry pool labels. A pool can
contribute no slots, one slot, or several slots; repeated labels are sampled
without replacement within that pool. -/
namespace MatrixBounds.Empirical

open Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Pool Parent Slot B : Type*} {Positions : Pool → Type*}

/-- Read the symbol at a labelled position from the corresponding pool word. -/
def poolRead (words : ∀ pool, Positions pool → B) (position : (pool : Pool) × Positions pool) : B :=
  words position.1 position.2

/-- The embedding of precisely those slots of a block assigned to one specified pool. -/
def labelledPoolSlots (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (label : Slot → Pool) (labels : ∀ parent slot, (placement (parent, slot)).1 = label slot)
    (pool : Pool) : Parent × {slot // label slot = pool} ↪ Positions pool :=
  ({ toFun := fun input => ⟨placement (input.1, input.2.val),
       (labels input.1 input.2.val).trans input.2.property⟩
     inj' := by
       intro left right same
       have equal := placement.injective (congrArg Subtype.val same)
       exact Prod.ext (Prod.mk.inj equal).1 (Subtype.ext (Prod.mk.inj equal).2) } :
    Parent × {slot // label slot = pool} ↪ {position : (pool : Pool) × Positions pool // position.1 = pool}).trans
      (Equiv.sigmaSubtype pool).toEmbedding

/-- Reading a restricted pool embedding agrees with reading the original labelled position. -/
theorem labelledPoolSlots_read (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (label : Slot → Pool) (labels : ∀ parent slot, (placement (parent, slot)).1 = label slot)
    (words : ∀ pool, Positions pool → B) (pool : Pool) (parent : Parent)
    (slot : {slot // label slot = pool}) :
    words pool (labelledPoolSlots placement label labels pool (parent, slot)) =
      poolRead words (placement (parent, slot.val)) := by
  let position : {position : (pool : Pool) × Positions pool // position.1 = pool} :=
    ⟨placement (parent, slot.val), (labels parent slot.val).trans slot.property⟩
  have same := congrArg (fun position : {position : (pool : Pool) × Positions pool // position.1 = pool} =>
    poolRead words position.val) ((Equiv.sigmaSubtype pool).symm_apply_apply position)
  exact same

/-- The per-pool conjunction is exactly the pattern event on the original labelled block. -/
theorem labelled_block_event [Fintype Pool] [Fintype Parent] [Fintype Slot]
    [∀ pool, Fintype (Positions pool)] [Fintype B]
    (profile : Pool → B → ℕ) (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (label : Slot → Pool) (labels : ∀ parent slot, (placement (parent, slot)).1 = label slot)
    (pattern : Slot → B) (parent : Parent)
    (words : ∀ pool, TypedWord (P := Positions pool) (profile pool)) :
    heterogeneousBlockEvent profile (labelledPoolSlots placement label labels)
      (fun _ slot => pattern slot.val) parent words ↔
        ∀ slot, poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot := by
  change (∀ pool slot, (words pool).val (labelledPoolSlots placement label labels pool (parent, slot)) =
    pattern slot.val) ↔ _
  constructor
  · intro event slot
    exact (labelledPoolSlots_read placement label labels (fun pool => (words pool).val)
      (label slot) parent ⟨slot, rfl⟩).symm.trans (event (label slot) ⟨slot, rfl⟩)
  · intro event pool slot
    exact (labelledPoolSlots_read placement label labels (fun pool => (words pool).val)
      pool parent slot).trans (event slot.val)

/-- Factoring a pattern law by pool labels gives the product over its original slots. -/
theorem labelled_block_center [Fintype Pool] [Fintype Slot] [∀ pool, Fintype (Positions pool)]
    (profile : Pool → B → ℕ) (label : Slot → Pool) (pattern : Slot → B) :
    heterogeneousBlockCenter (P := Positions) profile (fun pool (slot : {slot // label slot = pool}) => pattern slot.val) =
      ∏ slot, (profile (label slot) (pattern slot) : ℝ) / Fintype.card (Positions (label slot)) := by
  have reindex := Equiv.prod_comp (Equiv.sigmaFiberEquiv label)
    (fun slot => (profile (label slot) (pattern slot) : ℝ) / Fintype.card (Positions (label slot)))
  simp only [Fintype.prod_sigma] at reindex
  rw [← reindex]
  apply Finset.prod_congr rfl
  intro pool _
  apply Finset.prod_congr rfl
  intro slot _
  change (profile pool (pattern slot.val) : ℝ) / Fintype.card (Positions pool) = _
  simp only [Equiv.sigmaFiberEquiv_apply, slot.property]

/-- Summing the number of participating slots over pools recovers the block length. -/
theorem labelled_slot_count [Fintype Pool] [Fintype Slot] (label : Slot → Pool) :
    (∑ pool, (Fintype.card {slot // label slot = pool} : ℝ)) = Fintype.card Slot := by
  have same := Fintype.card_congr (Equiv.sigmaFiberEquiv label)
  simpa only [Fintype.card_sigma, Nat.cast_sum] using congrArg (fun size : ℕ => (size : ℝ)) same

/-- The frequency of any fixed labelled block pattern has a uniform finite-population bound.
For two slots, the numerator is 13, even when both slots use the same pool. -/
theorem labelled_block_concentration [Fintype Pool] [Fintype Parent] [Nonempty Parent]
    [Fintype Slot] [Fintype B] [∀ pool, Fintype (Positions pool)]
    (profile : Pool → B → ℕ) (representative : ∀ pool, TypedWord (P := Positions pool) (profile pool))
    (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (label : Slot → Pool) (labels : ∀ parent slot, (placement (parent, slot)).1 = label slot)
    (pattern : Slot → B) {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ pool, TypedWord (P := Positions pool) (profile pool) // threshold ≤
      |(∑ parent, indicator (fun words => ∀ slot,
        poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot) words) /
          Fintype.card Parent -
        ∏ slot, (profile (label slot) (pattern slot) : ℝ) / Fintype.card (Positions (label slot))|} : ℝ) /
      Fintype.card (∀ pool, TypedWord (P := Positions pool) (profile pool)) ≤
        (1 + 6*(Fintype.card Slot : ℝ)) / ((Fintype.card Parent : ℝ)*threshold^2) := by
  have bound := heterogeneous_block_uniform_concentration profile representative
    (labelledPoolSlots placement label labels) (fun _ slot => pattern slot.val) positive
  have events : heterogeneousBlockEvent profile (labelledPoolSlots placement label labels)
      (fun _ slot => pattern slot.val) = fun parent words =>
        ∀ slot, poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot := by
    funext parent words
    exact propext (labelled_block_event profile placement label labels pattern parent words)
  rw [events, labelled_block_center, labelled_slot_count] at bound
  exact bound

/-- The labelled block-count error has a linear second-moment bound, including an empty parent group. -/
theorem labelled_block_second_moment [Fintype Pool] [Fintype Parent]
    [Fintype Slot] [Fintype B] [∀ pool, Fintype (Positions pool)]
    (profile : Pool → B → ℕ) (representative : ∀ pool, TypedWord (P := Positions pool) (profile pool))
    (placement : Parent × Slot ↪ (pool : Pool) × Positions pool)
    (label : Slot → Pool) (labels : ∀ parent slot, (placement (parent, slot)).1 = label slot)
    (pattern : Slot → B) :
    average (fun words : ∀ pool, TypedWord (P := Positions pool) (profile pool) =>
      ((∑ parent, indicator (fun words => ∀ slot,
        poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot) words) -
        Fintype.card Parent *
          ∏ slot, (profile (label slot) (pattern slot) : ℝ) / Fintype.card (Positions (label slot)))^2) ≤
      (1 + 6*(Fintype.card Slot : ℝ)) * Fintype.card Parent := by
  by_cases empty : IsEmpty Parent
  · letI := empty
    simp [average]
  haveI : Nonempty Parent := not_isEmpty_iff.mp empty
  have bound := heterogeneous_block_second_moment profile representative
    (labelledPoolSlots placement label labels) (fun _ slot => pattern slot.val)
  have events : heterogeneousBlockEvent profile (labelledPoolSlots placement label labels)
      (fun _ slot => pattern slot.val) = fun parent words =>
        ∀ slot, poolRead (fun pool => (words pool).val) (placement (parent, slot)) = pattern slot := by
    funext parent words
    exact propext (labelled_block_event profile placement label labels pattern parent words)
  rw [events, labelled_block_center, labelled_slot_count] at bound
  exact bound

end
end MatrixBounds.Empirical
