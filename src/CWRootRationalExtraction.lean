import CWRootRationalData
import CWRootAsymptoticApproximate

/-! The unrestricted root extraction instantiated with a fixed rational law.
References, scale comparisons, and the lower rate cap are proved internally. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- Every fixed normalized rational root law gives complete approximate child tensors at its exact entropy rate, with arbitrary positive exponential losses. -/
theorem eventual_rational_extraction (length q bits edgeBits base denominator : ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (baseLarge : 2 ≤ base) (lengthBound : 2*length ≤ base)
    (numerator : ShapeAlphabet (2*length) → ℕ) (normalized : ∑ child, numerator child = denominator)
    (denominatorPositive : 0 < denominator)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b)
    (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (rangeY : ∀ child symbol, 0 ≤ lawY child symbol ∧ lawY child symbol ≤ 1)
    (rangeZ : ∀ child symbol, 0 ≤ lawZ child symbol ∧ lawZ child symbol ≤ 1)
    {degreeError copyError costError : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ k : ℕ, threshold ≤ k → denominator ∣ scale k →
      ∃ copies overhead : ℕ,
        Real.exp ((rationalRetention numerator denominator ux uy uz lawY lawZ-degreeError-copyError)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := Fin (scale k)) q length)
          (directSum (fun _ : Fin copies =>
            (fromRational numerator denominator (scale k)).approximateTarget (K := K) q lawX lawY lawZ delta)) overhead := by
  let rate := rationalRetention numerator denominator ux uy uz lawY lawZ
  let rateGrowth := max 0 (degreeError-rate)
  obtain ⟨threshold, delta, positiveDelta, extraction⟩ :=
    eventual_approximate_extraction.{v} (K := K) length q bits edgeBits 1 base
      alphabet shapes baseLarge lengthBound degreePositive copyPositive costPositive (le_max_left 0 (degreeError-rate))
  refine ⟨max 1 threshold, delta, positiveDelta, ?_⟩
  intro k large divisible
  have scalePositive : 0 < scale k := (show 0 < k by omega).trans_le (index_le_scale k)
  letI : Nonempty (Fin (scale k)) := ⟨⟨0, scalePositive⟩⟩
  let data := fromRational numerator denominator (scale k)
  obtain ⟨reference⟩ := fromRational_reference numerator normalized divisible
  have nominal := fromRational_nominalRetention numerator denominatorPositive scalePositive divisible ux uy uz lawY lawZ
  have lower : -(rateGrowth*(scale k : ℝ)) ≤ (scale k : ℝ)*(rate-degreeError) := by
    have bound := mul_le_mul_of_nonneg_right (le_max_right 0 (degreeError-rate))
      (Nat.cast_nonneg (scale k) : (0 : ℝ) ≤ _)
    dsimp only [rateGrowth]
    nlinarith
  have actualLower : -(rateGrowth*(scale k : ℝ)) ≤
      (Fintype.card (Fin (scale k)) : ℝ)*(data.nominalRetention (P := Fin (scale k)) ux uy uz lawY lawZ-degreeError) := by
    simpa only [data, Fintype.card_fin, nominal, rate] using lower
  obtain ⟨copies, overhead, retained, overheadBound, reduction⟩ := extraction k (by omega) (Fin (scale k)) data reference
    (by simp only [Fintype.card_fin, one_mul, le_refl]) (by simp only [Fintype.card_fin, one_mul, le_refl])
    ux uy uz positiveX positiveY positiveZ lawX lawY lawZ rangeY rangeZ actualLower
  refine ⟨copies, overhead, ?_, overheadBound, reduction⟩
  simpa only [data, Fintype.card_fin, nominal, sub_mul, mul_comm (scale k : ℝ)] using retained

end
end MatrixBounds.Tensor.CW.RootRestrictionData
