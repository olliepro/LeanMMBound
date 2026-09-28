import CWMixedRateExtraction
import CWDegreeControl

/-! The finite heterogeneous extraction is now instantiated by the actual
coarse Gibbs and fine pooled-entropy estimates. No graph degree or collision
count bound is an input to this theorem. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric HashCounting Extraction RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type u} [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Actual heterogeneous entropy contributions determine the retained-copy bound for complete exact child targets. -/
theorem finite_mixed_entropy_extraction (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (q : ℕ) (reference : PrescribedEdges Positions data)
    (supportY : ∀ type child block, fineTotal block ≠ child.val.y → (data type).fineY child block = 0)
    (supportZ : ∀ type child block, fineTotal block ≠ child.val.z → (data type).fineZ child block = 0)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (error : ℝ) (control : ∀ type, SplitRestrictionData.DegreeControl.{u} (length type) error)
    (populationLarge : ∀ type, (control type).threshold ≤ Fintype.card (Positions type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (positiveX : ∀ type b, 0 < ux type b) (positiveY : ∀ type b, 0 < uy type b) (positiveZ : ∀ type b, 0 < uz type b)
    (k bits rank degree base : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier (fun type => (control type).tolerance)+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base)
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (parentWindows (Positions := Positions) data (fun type => (data type).fineX) (fun type => (control type).tolerance))
      (parentWindows (Positions := Positions) data (fun type => (data type).fineY) (fun type => (control type).tolerance))
      (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) (fun type => (control type).tolerance))) rank degree) :
    let retention := mixedRetention
      (fun type => (Fintype.card (Positions type) : ℝ)*((data type).coarseRetention (P := Positions type)
        (ux type) (uy type) (uz type)-error))
      (fun type => (Fintype.card (Positions type) : ℝ)*((data type).fineRetention (P := Positions type) yClass (data type).fineY-error))
      (fun type => (Fintype.card (Positions type) : ℝ)*((data type).fineRetention (P := Positions type) zClass (data type).fineZ-error))
    ∃ prime copies : ℕ, prime.Prime ∧
      (prime : ℝ) ≤ 2*modulusFactor base (scale k)*
        ((Fintype.card (PrescribedEdges Positions data) : ℝ)*Real.exp (-retention)) ∧
      Real.exp retention/(12*modulusFactor base (scale k))*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      RankLE (directSum (fun _ : Fin copies => target (K := K) data q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)*(rank*(degree+1)^2)) := by
  apply finite_mixed_rate_extraction data symmetric q reference supportY supportZ representativeX representativeY representativeZ
    (fun type => (control type).tolerance) (fun type => (control type).positiveTolerance)
    k bits rank degree base edgeBits multiplier positive largeRepair alphabet shapes populationLower populationUpper
    baseLarge lengthBound _ _ _ _ _ _ certificate
  · intro type
    simpa only [neg_mul] using (control type).coarse (Positions type) (populationLarge type)
      (data type) (reference type) (ux type) (uy type) (uz type) (positiveX type) (positiveY type) (positiveZ type)
  · intro type
    simpa only [neg_mul] using (control type).fine (Positions type) (populationLarge type)
      (data type) (symmetric type) (reference type) Shape.y (fun _ _ => rfl) yClass (data type).fineY
      (supportY type) (representativeY type)
  · intro type
    simpa only [neg_mul] using (control type).fine (Positions type) (populationLarge type)
      (data type) (symmetric type) (reference type) Shape.z (fun _ _ => rfl) zClass (data type).fineZ
      (supportZ type) (representativeZ type)

end
end MatrixBounds.Tensor.CW.Mixed
