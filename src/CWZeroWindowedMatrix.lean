module

public import CWZeroContext
public import WindowExactRestriction
public import CWZeroCoordinateRestrictions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Zero-coordinate leaves are consumed directly from the windowed interface
of a preceding extraction. Their exact profiles give actual matrix coordinates. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Explicit maps from an exact zero-Z leaf to its full typed matrix factor. -/
def zeroExactCoordinateRestriction {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ) :
    CoordinateRestriction (zeroExact (K := K) (P := P) q length total profile)
      (MatrixMul.tensor (K := K) (I := PUnit)
        (J := Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)
        (L := PUnit)) where
  left pair := pair.2
  middle pair := complementTypedVariable profile pair.1
  right _ := zeroTypedVariable q length
  coefficient x y z := congrFun (congrFun (congrFun (zero_exact_matrix_identity profile) x) y) z

/-- Every centered zero-Z window supplies the exact typed matrix by concrete variable selections. -/
def zeroWindowedMatrixRestriction {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (Interface.windowedPower (P := P)
      (constituent (K := K) q length ⟨total, 2*length-total, 0⟩)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (fun word => (profile word : ℝ)/Fintype.card P)
      (fun word => (complementProfile profile word : ℝ)/Fintype.card P)
      (fun word => (zeroProfile (P := P) length word : ℝ)/Fintype.card P) tolerance)
      (MatrixMul.tensor (K := K) (I := PUnit)
        (J := Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)
        (L := PUnit)) :=
  (Interface.centeredWindowExactRestriction _ _ _ _ profile (complementProfile profile)
    (zeroProfile (P := P) length) nonnegative).trans (zeroExactCoordinateRestriction profile)

/-- A centered zero-Y window contributes its typed dimension to the physical matrix row. -/
def zeroYWindowedMatrixRestriction {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (Interface.windowedPower (P := P)
      (constituent (K := K) q length ⟨2*length-total, 0, total⟩)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (fun word => (complementProfile profile word : ℝ)/Fintype.card P)
      (fun word => (zeroProfile (P := P) length word : ℝ)/Fintype.card P)
      (fun word => (profile word : ℝ)/Fintype.card P) tolerance)
      (MatrixMul.tensor (K := K)
        (I := Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)
        (J := PUnit) (L := PUnit)) := by
  have cycled := (zeroWindowedMatrixRestriction (K := K) (P := P) (q := q) (total := total) profile nonnegative).cyclic.trans
    MatrixMul.cyclicCoordinateRestriction
  rw [cyclic_windowed_constituent] at cycled
  exact cycled

/-- A centered zero-X window contributes the same typed dimension to the physical matrix column. -/
def zeroXWindowedMatrixRestriction {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (Interface.windowedPower (P := P)
      (constituent (K := K) q length ⟨0, total, 2*length-total⟩)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (fun word => (zeroProfile (P := P) length word : ℝ)/Fintype.card P)
      (fun word => (profile word : ℝ)/Fintype.card P)
      (fun word => (complementProfile profile word : ℝ)/Fintype.card P) tolerance)
      (MatrixMul.tensor (K := K) (I := PUnit) (J := PUnit)
        (L := Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)) := by
  have cycled := (zeroYWindowedMatrixRestriction (K := K) (P := P) (q := q) (total := total) profile nonnegative).cyclic.trans
    MatrixMul.cyclicCoordinateRestriction
  rw [cyclic_windowed_constituent] at cycled
  exact cycled

end
end MatrixBounds.Tensor.CW
