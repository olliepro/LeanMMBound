module

public import SuppliedPairedCoarseBlocks
public import FKL.Lane

/-! Small static tables of the paired coarse computation, checked once against their semantic
definitions: shape coordinates of the 15 (level three) and 45 (level four) original columns, and the
marginal-entropy axis of every physical role. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL Tensor Tensor.CW

def sh3P : Nat := 86735494431923900110173378090476273664
/-- Coordinate `b` of the `c`-th total-four shape. -/
def sh3 (b c : Nat) : Nat := lane sh3P 3 (Nat.add (Nat.mul b 15) c)

def sh8P : Nat := 882556501751755771378480892237060204392275381839998294755789194764206292795357011074010415947586847941165827616881768525649269532837454398891382233377181532160
/-- Coordinate `b` of the `c`-th total-eight shape. -/
def sh8 (b c : Nat) : Nat := lane sh8P 4 (Nat.add (Nat.mul b 45) c)

def ax0P : Nat := 2640
/-- The marginal-entropy axis `σ 0` of physical role `r`. -/
def ax0 (r : Nat) : Nat := lane ax0P 2 r

theorem sh3_eq : ∀ (c : Fin 15) (b : Fin 3), Shape.coordinates (shapeColumnEquiv 4 c).val b = sh3 b c := by
  decide +kernel

theorem sh8_eq : ∀ (c : Fin 45) (b : Fin 3), Shape.coordinates (shapeColumnEquiv 8 c).val b = sh8 b c := by
  decide +kernel

theorem ax0_eq : ∀ r : Fin 6, ((SuppliedRoleIndex.order r).permutation 0).val = ax0 r := by
  decide +kernel

theorem ax0_lt (r : ℕ) (hr : r < 6) : ax0 r < 3 := by
  have := ax0_eq ⟨r, hr⟩
  rw [← this]; exact Fin.isLt _

/-- Admissibility of a column under a parent with coordinates `px, py, pz`. -/
def fitOf (sh : Nat → Nat → Nat) (px py pz c : Nat) : Bool :=
  Bool.and (Nat.ble (sh 0 c) px) (Bool.and (Nat.ble (sh 1 c) py) (Nat.ble (sh 2 c) pz))

theorem fitOf_eq {total : ℕ} (child : ShapeAlphabet total) (P : Shape) (sh : Nat → Nat → Nat) (c : Nat)
    (h : ∀ b : Fin 3, Shape.coordinates child.val b = sh b c) :
    fitOf sh P.x P.y P.z c = decide (child.val.Fits P) := by
  have h0 : sh 0 c = child.val.x := (h 0).symm
  have h1 : sh 1 c = child.val.y := (h 1).symm
  have h2 : sh 2 c = child.val.z := (h 2).symm
  unfold fitOf
  rw [h0, h1, h2, Bool.eq_iff_iff]
  simp only [Bool.and_eq_true, Nat.ble_eq]
  exact (decide_eq_true_iff (p := child.val.Fits P)).symm

end MatrixBounds.Numeric.FKLCoarse
