import CWConstituents

/-! Supported empirical fine profiles describe actual nonempty CW fine parts,
not merely formal labels. Canonical lifts realize every feasible fine-type word. -/
namespace MatrixBounds.Tensor.CW

open MatrixBounds.Empirical
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Any symbol that actually occurs in an exact-type word has positive profile count. -/
theorem profile_positive_at {B : Type*} (profile : B → ℕ) (word : TypedWord (P := P) profile) (position : P) :
    0 < profile (word.val position) := by
  rw [← word.property (word.val position)]
  letI : Nonempty {p : P // word.val p = word.val position} := ⟨⟨position, rfl⟩⟩
  simp only [count, Nat.card_eq_fintype_card]
  exact Fintype.card_pos

/-- Off-support zero counts ensure every fine block of an exact-type word has the required coarse total. -/
theorem typed_fine_supported {length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    (support : ∀ block, fineTotal block ≠ total → profile block = 0)
    (word : TypedWord (P := P) profile) (position : P) : fineTotal (word.val position) = total := by
  by_contra wrong
  have positive := profile_positive_at profile word position
  rw [support _ wrong] at positive
  omega

/-- Lift a feasible complete fine-type word to an actual variable of the exact CW interface. -/
def liftTypedFineVariable {q length total : ℕ} (positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (support : ∀ block, fineTotal block ≠ total → profile block = 0)
    (word : TypedWord (P := P) profile) :
    Interface.Variable (P := P) (fun entry : AxisVariable q length total => fineWord entry.val) profile :=
  ⟨fun p => liftFineWord positive (word.val p) (typed_fine_supported profile support word p), by
    have labels : (fun p => fineWord (liftFineWord positive (word.val p)
        (typed_fine_supported profile support word p)).val) = word.val := by
      funext p
      exact fineWord_lift positive (word.val p) (typed_fine_supported profile support word p)
    change HasType profile _
    rw [labels]
    exact word.property⟩

/-- Every supported fine-type part contains an actual CW interface variable. -/
theorem exact_part_surjective {q length total : ℕ} (positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (support : ∀ block, fineTotal block ≠ total → profile block = 0) :
    Function.Surjective (Interface.partWord (P := P)
      (fun entry : AxisVariable q length total => fineWord entry.val) profile) := by
  intro word
  refine ⟨liftTypedFineVariable positive profile support word, ?_⟩
  apply Subtype.ext
  funext p
  exact fineWord_lift positive (word.val p) (typed_fine_supported profile support word p)

/-- Feasible supported profiles give nonempty exact-interface variable sets. -/
theorem exact_variable_nonempty {q length total : ℕ} (positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (support : ∀ block, fineTotal block ≠ total → profile block = 0)
    (word : TypedWord (P := P) profile) :
    Nonempty (Interface.Variable (P := P) (fun entry : AxisVariable q length total => fineWord entry.val) profile) :=
  ⟨liftTypedFineVariable positive profile support word⟩

/-- The number of exact fine parts is bounded by the number of actual interface variables. -/
theorem exact_part_card_le {q length total : ℕ} (positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (support : ∀ block, fineTotal block ≠ total → profile block = 0) :
    Fintype.card (TypedWord (P := P) profile) ≤
      Fintype.card (Interface.Variable (P := P)
        (fun entry : AxisVariable q length total => fineWord entry.val) profile) := by
  exact Fintype.card_le_of_surjective _ (exact_part_surjective positive profile support)

/-- A coarse CW axis contains at most all words in its q+2-symbol coordinate alphabet. -/
theorem axis_card_le (q length total : ℕ) : Fintype.card (AxisVariable q length total) ≤ (q+2)^length := by
  simpa only [Fintype.card_fun, Fintype.card_fin] using
    Fintype.card_subtype_le (fun word : Fin length → Fin (q+2) => wordCoarse word = total)

/-- Exact-profile restrictions preserve a uniform exponential upper bound on variable counts. -/
theorem exact_variable_card_le (q length total : ℕ) (profile : (Fin length → Fin 3) → ℕ) :
    Fintype.card (Interface.Variable (P := P)
      (fun entry : AxisVariable q length total => fineWord entry.val) profile) ≤
      (q+2)^(length*Fintype.card P) := by
  have restricted := Fintype.card_subtype_le (fun word : P → AxisVariable q length total =>
    HasType profile (fun p => fineWord (word p).val))
  rw [Fintype.card_fun] at restricted
  apply restricted.trans
  rw [pow_mul]
  exact Nat.pow_le_pow_left (axis_card_le q length total) (Fintype.card P)

end
end MatrixBounds.Tensor.CW
