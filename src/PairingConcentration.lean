import GroupedConcentration
import PairingSectorTypes
import SplitPairing
import ConcentrationRepair

/-! The finite parent-interface hole bound for the actual complementary CW
pairing. Its center is the independent-concatenation mixture of the child types. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
variable {P B C : Type*} [Fintype P]

/-- Empirical windows commute with a bijective relabeling of complete fine patterns. -/
theorem within_map_equiv (equiv : B ≃ C) (center : C → ℝ) (tolerance : ℝ) (word : P → B) :
    Within center tolerance (fun parent => equiv (word parent)) ↔
      Within (fun symbol => center (equiv symbol)) tolerance word := by
  constructor
  · intro inside symbol
    simpa only [count_map_equiv, Equiv.symm_apply_apply] using inside (equiv symbol)
  · intro inside symbol
    simpa only [count_map_equiv, Equiv.apply_symm_apply] using inside (equiv.symm symbol)

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.CW

open Empirical Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T P B : Type*} {Positions : T → Type*}

/-- Tag a parent's left slot by false and its right slot by true. -/
def parentSlotEquiv (P : Type*) : (P × Bool) ≃ P ⊕ P where
  toFun slot := if slot.2 then Sum.inr slot.1 else Sum.inl slot.1
  invFun := Sum.elim (fun parent => (parent, false)) (fun parent => (parent, true))
  left_inv := by rintro ⟨parent, side⟩; cases side <;> rfl
  right_inv := by intro slot; cases slot <;> rfl

/-- The actual pairing is an injective assignment of the two child slots of every parent. -/
def Pairing.placement (pairing : Pairing Positions P) : P × Bool ↪ (type : T) × Positions type :=
  (parentSlotEquiv P).toEmbedding.trans pairing.symm.toEmbedding

/-- Encode two equal-length fine child words as their complete concatenated parent word. -/
def pairedPatternEquiv (length : ℕ) : (Bool → Fin length → Fin 3) ≃ (Fin (length+length) → Fin 3) where
  toFun pattern := concatenate (pattern false) (pattern true)
  invFun word side := if side then (fun position => word (Fin.natAdd length position))
    else (fun position => word (Fin.castAdd length position))
  left_inv := by
    intro pattern
    funext side position
    cases side <;> simp only [Bool.false_eq_true, ↓reduceIte, concatenate, Fin.addCases_left, Fin.addCases_right]
  right_inv := by
    intro word
    funext position
    refine Fin.addCases (fun index => ?_) (fun index => ?_) position
    · simp only [concatenate, Fin.addCases_left, Bool.false_eq_true, ↓reduceIte]
    · simp only [concatenate, Fin.addCases_right, ↓reduceIte]

/-- The parent fine word obtained by regrouping labelled exact child pools. -/
def Pairing.parentFineWord (pairing : Pairing Positions P) (length : ℕ)
    (words : ∀ type, Positions type → Fin length → Fin 3) : P → Fin (length+length) → Fin 3 :=
  fun parent => pairedPatternEquiv length (observedPattern pairing.placement words parent)

/-- The generic parent-pattern map agrees with the tensor's actual typed axis map. -/
theorem Pairing.parentFineWord_uniformAxis (pairing : Pairing Positions P) (q length parentTotal : ℕ)
    (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (profile : T → (Fin length → Fin 3) → ℕ)
    (entries : ∀ type, Interface.Variable (P := Positions type)
      (fun x : AxisVariable q length (total type) => fineWord x.val) (profile type)) :
    pairing.parentFineWord length (fun type position => fineWord ((entries type).val position).val) =
      fun parent => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val := by
  funext parent position
  refine Fin.addCases (fun index => ?_) (fun index => ?_) position
  · change Fin.addCases _ _ (Fin.castAdd length index) = fineLabel (Fin.addCases _ _ (Fin.castAdd length index))
    rw [Fin.addCases_left, Fin.addCases_left]
    rfl
  · change Fin.addCases _ _ (Fin.natAdd length index) = fineLabel (Fin.addCases _ _ (Fin.natAdd length index))
    rw [Fin.addCases_right, Fin.addCases_right]
    rfl

variable [Fintype T] [Fintype P]

/-- The full parent mixture center formed from any exact complementary split and exact child profiles. -/
def complementaryParentCenter (length : ℕ) (complement : T ≃ T) (split : P → T)
    (profile : T → (Fin length → Fin 3) → ℕ) [∀ type, Fintype (Positions type)]
    (word : Fin (length+length) → Fin 3) : ℝ :=
  groupedCenter (Positions := Positions) split (fun type side => if side then complement type else type)
    profile ((pairedPatternEquiv length).symm word)

/-- The actual paired parent windows fail on only an inverse-population fraction of child fine blocks. -/
theorem complementary_parent_concentration [Nonempty P]
    (length : ℕ) (complement : T ≃ T) (alpha : T → ℕ)
    (symmetric : ∀ type, alpha (complement.symm type) = alpha type)
    (split : TypedWord (P := P) alpha) (profile : T → (Fin length → Fin 3) → ℕ)
    (representative : ∀ type, TypedWord (P := Fin (2*alpha type)) (profile type))
    {tolerance : ℝ} (positive : 0 < tolerance) :
    (Nat.card {words : ∀ type, TypedWord (P := Fin (2*alpha type)) (profile type) //
      ¬Within (complementaryParentCenter (Positions := fun type => Fin (2*alpha type))
        length complement split.val profile) tolerance
        ((complementaryPairing complement alpha symmetric split).parentFineWord length
          (fun type => (words type).val))} : ℝ) /
      Fintype.card (∀ type, TypedWord (P := Fin (2*alpha type)) (profile type)) ≤
        ((Fintype.card (Fin (length+length) → Fin 3) : ℝ)*13*Fintype.card T) /
          ((Fintype.card P : ℝ)*tolerance^2) := by
  let pairing := complementaryPairing complement alpha symmetric split
  have labels (parent : P) (side : Bool) :
      (pairing.placement (parent, side)).1 = if side then complement (split.val parent) else split.val parent := by
    cases side
    · exact complementaryPairing_left complement alpha symmetric split parent
    · exact complementaryPairing_right complement alpha symmetric split parent
  have bound := grouped_parent_window_concentration profile representative pairing.placement split.val
    (fun type side => if side then complement type else type) labels positive
  have windows (words : ∀ type, TypedWord (P := Fin (2*alpha type)) (profile type)) :
      Within (complementaryParentCenter (Positions := fun type => Fin (2*alpha type))
        length complement split.val profile) tolerance (pairing.parentFineWord length (fun type => (words type).val)) ↔
      Within (groupedCenter (Positions := fun type => Fin (2*alpha type)) split.val
        (fun type side => if side then complement type else type) profile) tolerance
        (observedPattern pairing.placement (fun type => (words type).val)) := by
    change Within _ _ (fun parent => pairedPatternEquiv length
      (observedPattern pairing.placement (fun type => (words type).val) parent)) ↔ _
    rw [within_map_equiv]
    simp only [complementaryParentCenter, Equiv.symm_apply_apply]
  simp only [← windows, Fintype.card_bool, Nat.cast_ofNat] at bound
  simp only [← Nat.card_eq_fintype_card] at bound ⊢
  rw [Nat.card_congr (pairedPatternEquiv length)] at bound
  convert bound using 1; norm_num

/-- The parent-hole estimate has the exact integer form required by the sparse repair construction. -/
theorem complementary_parent_repair_bound [Nonempty P]
    (length : ℕ) (complement : T ≃ T) (alpha : T → ℕ)
    (symmetric : ∀ type, alpha (complement.symm type) = alpha type)
    (split : TypedWord (P := P) alpha) (profile : T → (Fin length → Fin 3) → ℕ)
    (representative : ∀ type, TypedWord (P := Fin (2*alpha type)) (profile type))
    {tolerance : ℝ} (positive : 0 < tolerance) (scale multiplier : ℕ)
    (scale_bound : scale ≤ multiplier*Fintype.card P) :
    Nat.card {words : ∀ type, TypedWord (P := Fin (2*alpha type)) (profile type) //
      ¬Within (complementaryParentCenter (Positions := fun type => Fin (2*alpha type))
        length complement split.val profile) tolerance
        ((complementaryPairing complement alpha symmetric split).parentFineWord length
          (fun type => (words type).val))} * scale ≤
      ⌈((Fintype.card (Fin (length+length) → Fin 3) : ℝ)*13*Fintype.card T)*multiplier/tolerance^2⌉₊ *
        Fintype.card (∀ type, TypedWord (P := Fin (2*alpha type)) (profile type)) := by
  letI : Nonempty (∀ type, TypedWord (P := Fin (2*alpha type)) (profile type)) := ⟨representative⟩
  exact fraction_to_repair_bound Fintype.card_pos Fintype.card_pos positive scale_bound
    (complementary_parent_concentration length complement alpha symmetric split profile representative positive)

/-- Expanding the center recovers the prescribed mixture of left and right child frequencies. -/
theorem complementaryParentCenter_eq (length : ℕ) (complement : T ≃ T) (alpha : T → ℕ)
    (split : TypedWord (P := P) alpha) (profile : T → (Fin length → Fin 3) → ℕ)
    (word : Fin (length+length) → Fin 3) :
    complementaryParentCenter (Positions := fun type => Fin (2*alpha type)) length complement split.val profile word =
      ∑ type, ((alpha type : ℝ)/Fintype.card P) *
        (((profile type (fun i => word (Fin.castAdd length i)) : ℝ)/(2*alpha type)) *
          ((profile (complement type) (fun i => word (Fin.natAdd length i)) : ℝ)/(2*alpha (complement type)))) := by
  unfold complementaryParentCenter groupedCenter
  apply Finset.sum_congr rfl
  intro type _
  have groupSize : Fintype.card {parent // split.val parent = type} = alpha type := by
    simpa only [count, Nat.card_eq_fintype_card] using split.property type
  simp only [groupSize, Fintype.prod_bool, Bool.false_eq_true, ↓reduceIte,
    pairedPatternEquiv, Equiv.coe_fn_symm_mk, Fintype.card_fin, Nat.cast_mul, Nat.cast_ofNat]
  ring

end
end MatrixBounds.Tensor.CW
