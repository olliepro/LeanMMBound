import FiniteSampling
import Mathlib.GroupTheory.GroupAction.MultipleTransitivity

/-! Uniform empirical-type words at distinct slots have the same law as
sampling distinct coordinates of any one word of that type. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- A uniform finite transitive group orbit has the uniform event distribution. -/
theorem uniform_orbit_event {G A : Type*} [Group G] [Fintype G] [Fintype A]
    [MulAction G A] [MulAction.IsPretransitive G A] (event : A → Prop) (point : A) :
    (Nat.card {g : G // event (g • point)} : ℝ) / Fintype.card G =
      (Nat.card {a : A // event a} : ℝ) / Fintype.card A := by
  have group_positive : (0 : ℝ) < Fintype.card G := by exact_mod_cast Fintype.card_pos
  have points_positive : (0 : ℝ) < Fintype.card A := by
    exact_mod_cast Fintype.card_pos_iff.mpr ⟨point⟩
  have identity := MatrixBounds.Symmetry.misses_identity (G := G) event point
  apply (div_eq_div_iff group_positive.ne' points_positive.ne').mpr
  have casted : (Fintype.card A : ℝ) * Nat.card {g : G // event (g • point)} =
      (Fintype.card G : ℝ) * Nat.card {a : A // event a} := by exact_mod_cast identity
  nlinarith

/-- Exact-type word sampling and coordinate sampling of one representative agree for every event.
The slots form an embedding, so the equality explicitly samples without replacement. -/
theorem exact_type_sampling_law {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P]
    (profile : B → ℕ) (representative : TypedWord (P := P) profile) {length : ℕ}
    (slots : Fin length ↪ P) (event : (Fin length → B) → Prop) :
    (Nat.card {word : TypedWord (P := P) profile // event (fun i => word.val (slots i))} : ℝ) /
        Fintype.card (TypedWord (P := P) profile) =
      (Nat.card {sample : Fin length ↪ P // event (fun i => representative.val (sample i))} : ℝ) /
        Fintype.card (Fin length ↪ P) := by
  letI : MulAction.IsPretransitive (Equiv.Perm P) (Fin length ↪ P) :=
    Equiv.Perm.isMultiplyPretransitive P length
  let wordEvent : TypedWord (P := P) profile → Prop := fun word => event (fun i => word.val (slots i))
  let slotEvent : (Fin length ↪ P) → Prop := fun sample => event (fun i => representative.val (sample i))
  have word_uniform := uniform_orbit_event (G := Equiv.Perm P) wordEvent representative
  have slot_uniform := uniform_orbit_event (G := Equiv.Perm P) slotEvent slots
  let inversion : {g : Equiv.Perm P // wordEvent (g • representative)} ≃
      {g : Equiv.Perm P // slotEvent (g • slots)} :=
    Equiv.subtypeEquiv (Equiv.inv (Equiv.Perm P)) (fun _ => Iff.rfl)
  have same := Nat.card_congr inversion
  change (Nat.card {g : Equiv.Perm P // wordEvent (g • representative)} : ℝ) / Fintype.card (Equiv.Perm P) =
    (Nat.card {word : TypedWord (P := P) profile // wordEvent word} : ℝ) /
      Fintype.card (TypedWord (P := P) profile) at word_uniform
  rw [same] at word_uniform
  exact word_uniform.symm.trans slot_uniform

/-- Embeddings and injective functions carry identical finite sampling data. -/
def embeddingSubtypeEquiv (Index Position : Type*) :
    (Index ↪ Position) ≃ {tuple : Index → Position // Function.Injective tuple} where
  toFun embedding := ⟨embedding, embedding.injective⟩
  invFun tuple := ⟨tuple.val, tuple.property⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Any event on k distinct slots of an exact type differs from independent sampling by at most k^2/N. -/
theorem exact_type_event_bias {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P]
    (profile : B → ℕ) (representative : TypedWord (P := P) profile) {length : ℕ}
    (positive_length : 0 < length) (slots : Fin length ↪ P) (event : (Fin length → B) → Prop) :
    |(Nat.card {word : TypedWord (P := P) profile // event (fun i => word.val (slots i))} : ℝ) /
        Fintype.card (TypedWord (P := P) profile) -
      (Nat.card {sample : Fin length → P // event (fun i => representative.val (sample i))} : ℝ) /
        Fintype.card (Fin length → P)| ≤ (length : ℝ)^2 / Fintype.card P := by
  letI : Nonempty (Fin length) := ⟨⟨0, positive_length⟩⟩
  letI : Nonempty P := ⟨slots ⟨0, positive_length⟩⟩
  let tupleEvent : (Fin length → P) → Prop := fun sample => event (fun i => representative.val (sample i))
  let eventEquiv : {sample : Fin length ↪ P // tupleEvent sample} ≃
      {sample : Fin length → P // Function.Injective sample ∧ tupleEvent sample} := {
    toFun sample := ⟨sample.val, sample.val.injective, sample.property⟩
    invFun sample := ⟨⟨sample.val, sample.property.1⟩, sample.property.2⟩
    left_inv _ := rfl
    right_inv _ := rfl }
  have denominator : Fintype.card (Fin length ↪ P) =
      Nat.card {sample : Fin length → P // Function.Injective sample} := by
    simpa only [Nat.card_eq_fintype_card] using Nat.card_congr (embeddingSubtypeEquiv (Fin length) P)
  have feasible : 0 < Nat.card {sample : Fin length → P // Function.Injective sample} := by
    have witness : Nonempty {sample : Fin length → P // Function.Injective sample} := ⟨⟨slots, slots.injective⟩⟩
    simpa only [Nat.card_eq_fintype_card] using (@Fintype.card_pos _ _ witness)
  rw [exact_type_sampling_law profile representative slots event,
    Nat.card_congr eventEquiv, denominator]
  simpa only [Fintype.card_fin] using Sampling.without_replacement_event_bound tupleEvent feasible

/-- Sampling coordinates independently realizes the product of empirical symbol frequencies. -/
theorem independent_pattern_probability {P B I : Type*} [Fintype P] [Fintype I]
    (word : P → B) (pattern : I → B) :
    (Nat.card {sample : I → P // ∀ i, word (sample i) = pattern i} : ℝ) /
        Fintype.card (I → P) = ∏ i, (count word (pattern i) : ℝ) / Fintype.card P := by
  let equiv : {sample : I → P // ∀ i, word (sample i) = pattern i} ≃
      (∀ i : I, {p : P // word p = pattern i}) := {
    toFun sample i := ⟨sample.val i, sample.property i⟩
    invFun sample := ⟨fun i => (sample i).val, fun i => (sample i).property⟩
    left_inv _ := rfl
    right_inv _ := rfl }
  rw [Nat.card_congr equiv]
  simp only [Nat.card_eq_fintype_card, Fintype.card_pi,
    Nat.cast_prod, Nat.cast_pow, Finset.prod_div_distrib, count,
    Finset.prod_const, Finset.card_univ]

/-- A prescribed pattern on k distinct coordinates is within k^2/N of its independent product law. -/
theorem exact_type_pattern_bias {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P]
    (profile : B → ℕ) (representative : TypedWord (P := P) profile) {length : ℕ}
    (positive_length : 0 < length) (slots : Fin length ↪ P) (pattern : Fin length → B) :
    |(Nat.card {word : TypedWord (P := P) profile // ∀ i, word.val (slots i) = pattern i} : ℝ) /
        Fintype.card (TypedWord (P := P) profile) -
      ∏ i, (profile (pattern i) : ℝ) / Fintype.card P| ≤ (length : ℝ)^2 / Fintype.card P := by
  have result := exact_type_event_bias profile representative positive_length slots
    (fun observed => ∀ i, observed i = pattern i)
  dsimp only at result
  have independent := independent_pattern_probability representative.val pattern
  simp only [Fintype.card_fun, Fintype.card_fin] at independent result
  rw [independent] at result
  have counts (symbol : B) : count representative.val symbol = profile symbol := representative.property symbol
  simpa only [counts] using result

/-- The pattern comparison is independent of how the finite set of sampled slots is indexed. -/
theorem exact_type_pattern_bias_indexed {P B I : Type*}
    [Fintype P] [Fintype B] [Fintype I] [DecidableEq P]
    (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (slots : I ↪ P) (pattern : I → B) :
    |(Nat.card {word : TypedWord (P := P) profile // ∀ i, word.val (slots i) = pattern i} : ℝ) /
        Fintype.card (TypedWord (P := P) profile) -
      ∏ i, (profile (pattern i) : ℝ) / Fintype.card P| ≤
        (Fintype.card I : ℝ)^2 / Fintype.card P := by
  by_cases empty : IsEmpty I
  · letI := empty
    have positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) profile) := by
      exact_mod_cast Fintype.card_pos_iff.mpr ⟨representative⟩
    simp [Nat.card_eq_fintype_card, positive.ne']
  haveI : Nonempty I := not_isEmpty_iff.mp empty
  let enumerate : Fin (Fintype.card I) ≃ I := (Fintype.equivFin I).symm
  have result := exact_type_pattern_bias profile representative Fintype.card_pos
    (enumerate.toEmbedding.trans slots) (fun j => pattern (enumerate j))
  have event_count :
      Nat.card {word : TypedWord (P := P) profile // ∀ j, word.val (slots (enumerate j)) = pattern (enumerate j)} =
        Nat.card {word : TypedWord (P := P) profile // ∀ i, word.val (slots i) = pattern i} := by
    apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
    intro word
    constructor
    · intro h i
      obtain ⟨j, rfl⟩ := enumerate.surjective i
      exact h j
    · intro h j
      exact h (enumerate j)
  change |(Nat.card {word : TypedWord (P := P) profile // ∀ j, word.val (slots (enumerate j)) = pattern (enumerate j)} : ℝ) /
    Fintype.card (TypedWord (P := P) profile) -
    ∏ j, (profile (pattern (enumerate j)) : ℝ) / Fintype.card P| ≤
    (Fintype.card I : ℝ)^2 / Fintype.card P at result
  rw [event_count, Equiv.prod_comp enumerate (fun i => (profile (pattern i) : ℝ) / Fintype.card P)] at result
  exact result

end
end MatrixBounds.Empirical
