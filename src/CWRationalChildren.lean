module

public import CWRationalPopulation
public import WindowedReindexing

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete rational split outputs have the same fixed population convention
as subsequent stages. The transition is an actual coordinate renaming. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K] {length : T → ℕ} {denominator : ℕ}

/-- All separately labelled rational child windows with fixed integer population coefficients. -/
def rationalChildren (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ) (size q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :=
  Interface.heterogeneous (fun index : ChildIndex length =>
    Interface.windowedPower (P := Fin ((splits index.1).childWeight (weight index.1) index.2*size))
      (constituent (K := K) q (length index.1) index.2.val)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (lawX index.1 index.2) (lawY index.1 index.2) (lawZ index.1 index.2) (tolerance index.1))

/-- Regroup an actual complete mixed output into its fixed scaled child-pool populations without losing any variables. -/
def rationalChildrenRestriction (splits : ∀ type, RationalSplit (length type) denominator)
    (weight : T → ℕ) (divisible : ∀ type, denominator ∣ weight type) (size q : ℕ)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (tolerance : T → ℝ) :
    CoordinateRestriction (approximateTarget (K := K) (rationalData splits weight size) q lawX lawY lawZ tolerance)
      (rationalChildren (K := K) splits weight size q lawX lawY lawZ tolerance) := by
  rw [approximateTarget_eq_windowed]
  exact CoordinateRestriction.heterogeneous (fun index =>
    Interface.windowPositionRestriction
      (finCongr ((splits index.1).child_population (divisible index.1) size index.2))
      (constituent (K := K) q (length index.1) index.2.val)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (lawX index.1 index.2) (lawY index.1 index.2) (lawZ index.1 index.2) (tolerance index.1))

end
end MatrixBounds.Tensor.CW.Mixed
