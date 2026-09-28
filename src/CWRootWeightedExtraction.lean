import CWRootRationalExtraction

/-! A fixed integer root population coefficient uses the same growing schedule
as every later rational stage, with one arbitrary positive asymptotic loss. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Any positive fixed root population coefficient is realized by the actual unrestricted extraction.
Both output loss and extraction cost are measured against the same scale used by its child stages. -/
theorem eventual_weighted_extraction {K : Type*} [CommRing K]
    (length q bits edgeBits base denominator weight : ℕ) (weightPositive : 0 < weight)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (baseLarge : 2 ≤ base) (lengthBound : 2*length ≤ base)
    (numerator : ShapeAlphabet (2*length) → ℕ) (normalized : ∑ child, numerator child = denominator)
    (denominatorPositive : 0 < denominator)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b)
    (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (rangeY : ∀ child symbol, 0 ≤ lawY child symbol ∧ lawY child symbol ≤ 1)
    (rangeZ : ∀ child symbol, 0 ≤ lawZ child symbol ∧ lawZ child symbol ≤ 1)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ k : ℕ, threshold ≤ k → denominator ∣ scale k →
      ∃ copies overhead : ℕ,
        Real.exp (((weight : ℝ)*rationalRetention numerator denominator ux uy uz lawY lawZ-error)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (error*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := Fin (weight*scale k)) q length)
          (directSum (fun _ : Fin copies =>
            (fromRational numerator denominator (weight*scale k)).approximateTarget (K := K) q lawX lawY lawZ delta)) overhead := by
  let rate := rationalRetention numerator denominator ux uy uz lawY lawZ
  let degreeError := error/(2*(weight : ℝ))
  have weightReal : (0 : ℝ) < weight := by exact_mod_cast weightPositive
  have degreePositive : 0 < degreeError := div_pos errorPositive (by positivity)
  have degreeIdentity : (weight : ℝ)*degreeError = error/2 := by
    dsimp only [degreeError]
    field_simp
  let rateGrowth := max 0 ((weight : ℝ)*(degreeError-rate))
  obtain ⟨threshold, delta, positiveDelta, extraction⟩ :=
    eventual_approximate_extraction.{v} (K := K) length q bits edgeBits weight base
      alphabet shapes baseLarge lengthBound degreePositive (half_pos errorPositive) errorPositive (le_max_left _ _)
  refine ⟨max 1 threshold, delta, positiveDelta, ?_⟩
  intro k large divisible
  have scalePositive : 0 < scale k := (show 0 < k by omega).trans_le (index_le_scale k)
  have sizePositive := Nat.mul_pos weightPositive scalePositive
  letI : Nonempty (Fin (weight*scale k)) := ⟨⟨0, sizePositive⟩⟩
  have sizeDivisible := dvd_mul_of_dvd_right divisible weight
  let data := fromRational numerator denominator (weight*scale k)
  obtain ⟨reference⟩ := fromRational_reference numerator normalized sizeDivisible
  have nominal := fromRational_nominalRetention numerator denominatorPositive sizePositive sizeDivisible ux uy uz lawY lawZ
  have lower : -(rateGrowth*(scale k : ℝ)) ≤ (weight*scale k : ℝ)*(rate-degreeError) := by
    have bound := mul_le_mul_of_nonneg_right (le_max_right 0 ((weight : ℝ)*(degreeError-rate)))
      (Nat.cast_nonneg (scale k) : (0 : ℝ) ≤ _)
    dsimp only [rateGrowth]
    nlinarith
  have actualLower : -(rateGrowth*(scale k : ℝ)) ≤
      (Fintype.card (Fin (weight*scale k)) : ℝ)*(data.nominalRetention (P := Fin (weight*scale k)) ux uy uz lawY lawZ-degreeError) := by
    simpa only [data, Fintype.card_fin, nominal, rate, Nat.cast_mul] using lower
  have populationLower : scale k ≤ weight*(weight*scale k) := by
    nlinarith [Nat.mul_le_mul_right (scale k) (show 1 ≤ weight by omega)]
  obtain ⟨copies, overhead, retained, overheadBound, reduction⟩ := extraction k (by omega)
    (Fin (weight*scale k)) data reference (by simpa only [Fintype.card_fin] using populationLower)
    (by simp only [Fintype.card_fin, le_refl])
    ux uy uz positiveX positiveY positiveZ lawX lawY lawZ rangeY rangeZ actualLower
  refine ⟨copies, overhead, ?_, overheadBound, reduction⟩
  have exponent : (weight*scale k : ℝ)*(rate-degreeError)-(error/2)*scale k =
      ((weight : ℝ)*rate-error)*scale k := by nlinarith [congrArg (fun x : ℝ => x*scale k) degreeIdentity]
  simpa only [data, Fintype.card_fin, nominal, Nat.cast_mul, exponent, rate] using retained

end
end MatrixBounds.Tensor.CW.RootRestrictionData
