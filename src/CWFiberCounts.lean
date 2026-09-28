import CWTypedInterfaces
import TypedFiberCounting

/-! Exact sizes of CW fine blocks. The middle class has q coordinates and
each extreme class has one, yielding q raised to the number of middle symbols. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The middle coordinate class is in bijection with the q ordinary CW indices. -/
def middleFiberEquiv (q : ℕ) : Fin q ≃ {entry : Fin (q+2) // coarse entry = 1} :=
  Equiv.ofBijective (fun index => ⟨⟨index.val+1, by omega⟩, coarse_middle index⟩) (by
    constructor
    · intro left right same
      have values := congrArg (fun entry : {entry : Fin (q+2) // coarse entry = 1} => entry.val.val) same
      apply Fin.ext
      dsimp at values
      omega
    · intro entry
      obtain zero | ⟨index, middle⟩ | extreme := coordinate_cases entry.val
      · have impossible := entry.property
        rw [zero, coarse_zero] at impossible
        omega
      · exact ⟨index, Subtype.ext middle.symm⟩
      · have impossible := entry.property
        rw [extreme, coarse_extreme] at impossible
        omega)

/-- Coarse class two consists of the unique extreme coordinate. -/
theorem coarse_eq_two {q : ℕ} (entry : Fin (q+2)) :
    coarse entry = 2 ↔ entry = ⟨q+1, by omega⟩ := by
  obtain rfl | ⟨index, rfl⟩ | rfl := coordinate_cases entry
  · simp [coarse_zero, Fin.ext_iff]
  · have different : (⟨index.val+1, by omega⟩ : Fin (q+2)) ≠ ⟨q+1, by omega⟩ := by
      intro equal
      have values := congrArg Fin.val equal
      dsimp at values
      omega
    simp [coarse_middle, different]
  · simp [coarse_extreme]

/-- A single fine label has q possible coordinates at label one and exactly one otherwise. -/
theorem fine_fiber_card (q : ℕ) (symbol : Fin 3) :
    Fintype.card {entry : Fin (q+2) // fineLabel entry = symbol} = if symbol = 1 then q else 1 := by
  fin_cases symbol
  · have same := Fintype.card_congr (Equiv.subtypeEquivRight (fun entry : Fin (q+2) => by
      change fineLabel entry = 0 ↔ entry = 0
      simpa only [Fin.ext_iff, fineLabel, Fin.val_zero] using coarse_eq_zero entry))
    simpa using same
  · have same := Fintype.card_congr (middleFiberEquiv q)
    simpa only [fineLabel, Fin.ext_iff, Fintype.card_fin, Fin.val_one, ↓reduceIte] using same.symm
  · have same := Fintype.card_congr (Equiv.subtypeEquivRight (fun entry : Fin (q+2) => by
      change fineLabel entry = 2 ↔ entry = ⟨q+1, by omega⟩
      simpa only [Fin.ext_iff, fineLabel] using coarse_eq_two entry))
    simpa using same

/-- Specifying a fine word amounts to independently selecting one coordinate from each of its fine classes. -/
def fineWordFiberEquiv {q length : ℕ} (word : Fin length → Fin 3) :
    {entry : Fin length → Fin (q+2) // fineWord entry = word} ≃
      (∀ position, {entry : Fin (q+2) // fineLabel entry = word position}) :=
  (Equiv.subtypeEquivRight (fun entry => show fineWord entry = word ↔
    ∀ position, fineLabel (entry position) = word position from funext_iff)).trans
      (Equiv.subtypePiEquivPi (p := fun position entry => fineLabel entry = word position))

/-- A complete fine block contains q to the number of its middle symbols coordinates. -/
theorem fine_word_fiber_card {q length : ℕ} (word : Fin length → Fin 3) :
    Fintype.card {entry : Fin length → Fin (q+2) // fineWord entry = word} = q^(Empirical.count word 1) := by
  rw [Fintype.card_congr (fineWordFiberEquiv word), Fintype.card_pi]
  simp_rw [fine_fiber_card]
  simp only [Finset.prod_ite, Finset.prod_const, one_pow,
    mul_one, Empirical.count, Nat.card_eq_fintype_card, Fintype.card_subtype]

/-- On a supported fine word the coarse-axis total is already determined, so it adds no coordinate restriction. -/
def axisFineFiberEquiv {q length total : ℕ} (word : Fin length → Fin 3) (supported : fineTotal word = total) :
    {entry : AxisVariable q length total // fineWord entry.val = word} ≃
      {entry : Fin length → Fin (q+2) // fineWord entry = word} where
  toFun entry := ⟨entry.val.val, entry.property⟩
  invFun entry := ⟨⟨entry.val, by
    change fineTotal (fineWord entry.val) = total
    rw [entry.property, supported]⟩, entry.property⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Supported fine blocks inside an actual coarse CW constituent have the expected q-power size. -/
theorem axis_fine_fiber_card {q length total : ℕ} (word : Fin length → Fin 3) (supported : fineTotal word = total) :
    Fintype.card {entry : AxisVariable q length total // fineWord entry.val = word} = q^(Empirical.count word 1) := by
  rw [Fintype.card_congr (axisFineFiberEquiv word supported)]
  exact fine_word_fiber_card word

end
end MatrixBounds.Tensor.CW
