module

public import CWCoarseData
public import CWRationalRates
public import CWRootNearbyRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The unrestricted root uses the same exact rational certificate law at
every divisible size, with one child occurrence per coarse root position. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Instantiate unrestricted root data directly from rational coarse numerators. -/
def fromRational {length : ℕ} (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominator size : ℕ) : RootRestrictionData length :=
  fromCoarse (rationalProfile numerator denominator size)

/-- Normalized rational root counts always have a genuine complete-graph reference at divisible sizes. -/
theorem fromRational_reference {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (normalized : ∑ child, numerator child = denominator) (divisible : denominator ∣ size) :
    Nonempty ((fromRational numerator denominator size).PrescribedEdges (P := Fin size)) := by
  obtain ⟨word⟩ := rationalProfile_feasible numerator normalized divisible
  exact ⟨(fromRational numerator denominator size).edgeOfWord word⟩

/-- Divisible root populations recover the exact rational probability vector. -/
theorem fromRational_probability {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (child : ShapeAlphabet (2*length)) :
    ((fromRational numerator denominator size).split child : ℝ)/Fintype.card (Fin size) =
      (numerator child : ℝ)/denominator := by
  simpa only [fromRational, fromCoarse, Fintype.card_fin] using
    rationalProfile_probability numerator denominatorPositive sizePositive divisible child

/-- The root's actual coarse rate is exactly its fixed complete-alphabet Gibbs expression. -/
theorem fromRational_coarseRetention {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (ux uy uz : Fin (2*length+1) → ℝ) :
    (fromRational numerator denominator size).coarseRetention (P := Fin size) ux uy uz =
      SplitRestrictionData.rationalCoarseRetention (rootBox (2*length)) numerator denominator ux uy uz := by
  have profiles : (fun child => (rationalProfile numerator denominator size child : ℝ)/size) =
      fun child => (numerator child : ℝ)/denominator :=
    funext (rationalProfile_probability numerator denominatorPositive sizePositive divisible)
  have values (axis : ShapeAlphabet (2*length) → Fin (2*length+1)) (value : Fin (2*length+1)) :=
    congrFun (SplitRestrictionData.rationalProfile_marginal numerator axis denominatorPositive sizePositive divisible) value
  unfold coarseRetention gibbsCost coarse SplitRestrictionData.rationalCoarseRetention fromRational fromCoarse
  simp only [Fintype.card_fin, profiles, shapeCoordinate_x, shapeCoordinate_y, shapeCoordinate_z, values]
  congr <;> funext value <;> simp only [marginal]

/-- The fixed root mass formula counts each root child once, retaining its compatibility sector. -/
def rationalLawMass {length : ℕ} (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (selected : ShapeAlphabet (2*length) → Prop)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : (Fin length → Fin 3) → ℝ :=
  fun symbol => ∑ child, if selected child then ((numerator child : ℝ)/denominator)*law child symbol else 0

/-- Actual root global and pooled masses equal the certificate's rational mixtures. -/
theorem fromRational_lawMass {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (selected : ShapeAlphabet (2*length) → Prop)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational numerator denominator size).lawMass (P := Fin size) selected law =
      rationalLawMass numerator denominator selected law := by
  funext symbol
  unfold lawMass rationalLawMass
  simp_rw [fromRational_probability numerator denominatorPositive sizePositive divisible]

/-- Root fine retention expressed entirely in fixed rational weights and nominal child laws. -/
def rationalFineRetention {length : ℕ} (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  entropy (rationalLawMass numerator denominator (fun _ => True) law) -
    ∑ sector, massEntropy (rationalLawMass numerator denominator (fun child => axisClass child = sector) law)

/-- The root fine-rate formula is independent of the chosen divisible population. -/
theorem fromRational_lawRetention {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational numerator denominator size).lawRetention (P := Fin size) axisClass law =
      rationalFineRetention numerator denominator axisClass law := by
  unfold lawRetention rationalFineRetention
  simp_rw [fromRational_lawMass numerator denominatorPositive sizePositive divisible]

/-- The fixed rational root retention compares all three complete physical rates. -/
def rationalRetention {length : ℕ} (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  min (SplitRestrictionData.rationalCoarseRetention (rootBox (2*length)) numerator denominator ux uy uz)
    (min (rationalFineRetention numerator denominator yClass lawY) (rationalFineRetention numerator denominator zClass lawZ))

/-- The actual root extraction rate is precisely the fixed rational certificate expression. -/
theorem fromRational_nominalRetention {length denominator size : ℕ}
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (ux uy uz : Fin (2*length+1) → ℝ)
    (lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational numerator denominator size).nominalRetention (P := Fin size) ux uy uz lawY lawZ =
      rationalRetention numerator denominator ux uy uz lawY lawZ := by
  unfold nominalRetention rationalRetention
  rw [fromRational_coarseRetention numerator denominatorPositive sizePositive divisible,
    fromRational_lawRetention numerator denominatorPositive sizePositive divisible,
    fromRational_lawRetention numerator denominatorPositive sizePositive divisible]

end
end MatrixBounds.Tensor.CW.RootRestrictionData
