import CWRationalMixedRates
import CWAsymptoticContextualExtraction

/-! Complete shared extraction directly on fixed rational stage parameters.
The actual graph references, symmetric counts, and scale caps are constructed
inside the proof rather than requested as algorithmic hypotheses. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K] {length : T → ℕ} {denominator : ℕ}

/-- A fixed rational mixed stage produces complete child windows at its exact shared entropy rate in every context, with arbitrary positive copy and overhead losses. -/
theorem eventual_rational_extraction (splits : ∀ type, RationalSplit (length type) denominator)
    (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type) (denominatorPositive : 0 < denominator)
    (q bits base : ℕ) (edgeBits : T → ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base)
    (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (rangeX : ∀ type child symbol, 0 ≤ lawX type child symbol ∧ lawX type child symbol ≤ 1)
    (rangeY : ∀ type child symbol, 0 ≤ lawY type child symbol ∧ lawY type child symbol ≤ 1)
    (rangeZ : ∀ type child symbol, 0 ≤ lawZ type child symbol ∧ lawZ type child symbol ≤ 1)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (positiveX : ∀ type b, 0 < ux type b) (positiveY : ∀ type b, 0 < uy type b) (positiveZ : ∀ type b, 0 < uz type b)
    {degreeError copyError costError : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ scale k → ∃ copies overhead : ℕ,
        Real.exp ((rationalRetention splits weight ux uy uz lawY lawZ degreeError-copyError)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (rationalParent (K := K) splits weight (scale k) q lawX lawY lawZ wide)
          (directSum (fun _ : Fin copies =>
            approximateTarget (K := K) (rationalData splits weight (scale k)) q lawX lawY lawZ delta)) overhead := by
  let rate := rationalRetention splits weight ux uy uz lawY lawZ degreeError
  let rateGrowth := max 0 (-rate)
  obtain ⟨delta, positiveDelta, threshold, extraction⟩ :=
    eventual_contextual_approximate_extraction.{v, 0} (K := K) length q degreePositive copyPositive costPositive
      (le_max_left 0 (-rate)) wide widePositive edgeBits weight bits base alphabet shapes baseLarge lengthBound
      lawX lawY lawZ rangeX rangeY rangeZ ux uy uz positiveX positiveY positiveZ
  refine ⟨delta, positiveDelta, max 1 threshold, ?_⟩
  intro k large divisible
  have scalePositive : 0 < scale k := (show 0 < k by omega).trans_le (index_le_scale k)
  letI : ∀ type, Nonempty (RationalPositions weight (scale k) type) :=
    fun type => ⟨⟨0, Nat.mul_pos (weightPositive type) scalePositive⟩⟩
  let data := rationalData splits weight (scale k)
  have reference : PrescribedEdges (RationalPositions weight (scale k)) data :=
    fun type => Classical.choice ((splits type).reference (dvd_mul_of_dvd_right divisible (weight type)))
  have nominal := rationalData_nominalRetention splits weight weightPositive denominatorPositive scalePositive
    divisible ux uy uz lawY lawZ degreeError
  have lower : -(rateGrowth*(scale k : ℝ)) ≤ rate*scale k := by
    have bound := mul_le_mul_of_nonneg_right (le_max_right 0 (-rate))
      (Nat.cast_nonneg (scale k) : (0 : ℝ) ≤ _)
    dsimp only [rateGrowth]
    nlinarith
  have actualLower : -(rateGrowth*(scale k : ℝ)) ≤
      nominalRetention (Positions := RationalPositions weight (scale k)) data ux uy uz lawY lawZ degreeError := by
    simpa only [data, nominal, rate] using lower
  obtain ⟨copies, overhead, retained, overheadBound, reduction⟩ := extraction k (by omega)
    (RationalPositions weight (scale k)) data (fun type => (splits type).data_symmetric _) reference
    (fun type => by
      simp only [RationalPositions, Fintype.card_fin]
      exact (Nat.le_mul_of_pos_left _ (weightPositive type)).trans (Nat.le_mul_of_pos_left _ (weightPositive type)))
    (fun _ => by simp only [RationalPositions, Fintype.card_fin, le_refl]) actualLower
  refine ⟨copies, overhead, ?_, overheadBound, ?_⟩
  · simpa only [data, nominal, sub_mul] using retained
  · simpa only [data, rationalData_parent splits weight weightPositive denominatorPositive scalePositive divisible] using reduction

end
end MatrixBounds.Tensor.CW.Mixed
