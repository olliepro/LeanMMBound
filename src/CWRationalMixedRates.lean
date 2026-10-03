module

public import CWRationalSplit
public import CWNominalRetentionLoss
public import CWWindowedInterfaces

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Integer multiples of one common scale realize fixed rational mixed-stage
populations, centers, and the minimum of the three total rate sums. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- Label the actual positions of each rational stage factor at one common integer scale. -/
abbrev RationalPositions (weight : T → ℕ) (size : ℕ) (type : T) := Fin (weight type*size)

/-- Construct all actual split records from their fixed rational specifications. -/
def rationalData (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ) (size : ℕ) :=
  fun type => (splits type).data (weight type*size)

/-- The fixed mixed retention compares sums after weighting every type by its population. -/
def rationalRetention (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) : ℝ :=
  mixedRetention (fun type => (weight type : ℝ)*((splits type).coarseRetention (ux type) (uy type) (uz type)-error))
    (fun type => (weight type : ℝ)*((splits type).fineRetention yClass (lawY type)-error))
    (fun type => (weight type : ℝ)*((splits type).fineRetention zClass (lawZ type)-error))

/-- Fixed rational populations recover the exact nominal shared-round rate times the common scale. -/
theorem rationalData_nominalRetention (splits : ∀ type, RationalSplit (length type) denominator)
    (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type) {size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) :
    nominalRetention (Positions := RationalPositions weight size) (rationalData splits weight size)
      ux uy uz lawY lawZ error = rationalRetention splits weight ux uy uz lawY lawZ error*size := by
  have coarse (type : T) := (splits type).data_coarseRetention denominatorPositive
    (Nat.mul_pos (weightPositive type) sizePositive) (dvd_mul_of_dvd_right divisible (weight type)) (ux type) (uy type) (uz type)
  have fine (type : T) (axisClass : ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
      (law : ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) :=
    (splits type).data_fineRetention denominatorPositive (Nat.mul_pos (weightPositive type) sizePositive)
      (dvd_mul_of_dvd_right divisible (weight type)) axisClass law
  unfold nominalRetention nominalCoarseRate nominalFineRate rationalData rationalRetention
  simp only [RationalPositions, Fintype.card_fin, Nat.cast_mul, coarse, fine]
  have rearrange (a b : ℝ) : a*(size : ℝ)*b = (a*b)*size := by ring
  simp only [rearrange, mixedRetention, ← Finset.sum_mul,
    min_mul_of_nonneg _ _ (Nat.cast_nonneg size : (0 : ℝ) ≤ _)]

/-- The uniform local degree error subtracts its exact weighted total from the fixed shared rate. -/
theorem rationalRetention_error (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) :
    rationalRetention splits weight ux uy uz lawY lawZ error =
      rationalRetention splits weight ux uy uz lawY lawZ 0-error*∑ type, (weight type : ℝ) := by
  unfold rationalRetention
  simp only [mul_sub, sub_zero]
  rw [mixedRetention_sub]
  congr 1
  rw [Finset.mul_sum]
  exact Finset.sum_congr rfl (fun _ _ => mul_comm _ _)

variable {K : Type*} [CommRing K]

/-- The available mixed parent tensor with its fixed rational centers. -/
def rationalParent (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ) (size q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :=
  Interface.heterogeneous (fun type => Interface.windowedPower (P := RationalPositions weight size type)
    (constituent (K := K) q (length type+length type) (splits type).parent)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    ((splits type).parentLaw (lawX type)) ((splits type).parentLaw (lawY type)) ((splits type).parentLaw (lawZ type)) (tolerance type))

/-- Actual parent interfaces at divisible populations are exactly the fixed rational parent-window tensors. -/
theorem rationalData_parent (splits : ∀ type, RationalSplit (length type) denominator)
    (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type) {size : ℕ}
    [∀ type, Nonempty (RationalPositions weight size type)]
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size) (q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :
    parentInterface (K := K) (rationalData splits weight size) q
      (nominalWindows (Positions := RationalPositions weight size) (rationalData splits weight size) lawX tolerance)
      (nominalWindows (Positions := RationalPositions weight size) (rationalData splits weight size) lawY tolerance)
      (nominalWindows (Positions := RationalPositions weight size) (rationalData splits weight size) lawZ tolerance) =
        rationalParent (K := K) splits weight size q lawX lawY lawZ tolerance := by
  rw [nominalParent_eq_windowed]
  unfold rationalParent rationalData
  have center (type : T) := (splits type).data_parentLaw denominatorPositive
    (Nat.mul_pos (weightPositive type) sizePositive) (dvd_mul_of_dvd_right divisible (weight type))
  simp_rw [center]
  rfl

end
end MatrixBounds.Tensor.CW.Mixed
