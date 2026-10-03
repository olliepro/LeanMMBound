module

public import CWConstituents
public import WindowedPermutations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Physical axis permutations of the CW tensor are the corresponding actual
permuted coarse constituents, not just a permutation of numerical rates. -/
namespace MatrixBounds.Tensor.CW

open Numeric
open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K]

/-- Swap the first two coordinates of a coarse shape. -/
def transposeShape (shape : Shape) : Shape := ⟨shape.y, shape.x, shape.z⟩

/-- Cycle a coarse shape in the same direction as its tensor axes. -/
def cyclicShape (shape : Shape) : Shape := ⟨shape.y, shape.z, shape.x⟩

/-- The complete CW coefficient is unchanged by exchanging its first two coordinates. -/
theorem tensor_transpose {q : ℕ} (x y z : Fin (q+2)) :
    tensor (K := K) q x y z = tensor q y x z := by
  simp only [tensor, Finset.sum_add_distrib]
  simp only [mul_comm, mul_left_comm, mul_assoc]
  ring

/-- Exchanging complete CW words preserves every coefficient. -/
theorem word_tensor_transpose {q length : ℕ} (x y z : Fin length → Fin (q+2)) :
    wordPower (tensor (K := K) q) length x y z = wordPower (tensor q) length y x z :=
  Finset.prod_congr rfl (fun position _ => tensor_transpose (x position) (y position) (z position))

/-- Cycling a CW constituent gives exactly the constituent of the cycled shape. -/
theorem cyclic_constituent (q length : ℕ) (shape : Shape) :
    cyclic (constituent (K := K) q length shape) = constituent q length (cyclicShape shape) := by
  funext x y z
  exact word_tensor_cyclic z.val x.val y.val

/-- Swapping a CW constituent gives exactly the constituent of the swapped shape. -/
theorem transposeXY_constituent (q length : ℕ) (shape : Shape) :
    transposeXY (constituent (K := K) q length shape) = constituent q length (transposeShape shape) := by
  funext x y z
  exact word_tensor_transpose y.val x.val z.val

/-- A cycled windowed CW power has the cycled shape and the correctly permuted physical fine laws. -/
theorem cyclic_windowed_constituent {P : Type*} [Fintype P] (q length : ℕ) (shape : Shape)
    (lawX lawY lawZ : (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :
    cyclic (Interface.windowedPower (P := P) (constituent (K := K) q length shape)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val) lawX lawY lawZ tolerance) =
    Interface.windowedPower (P := P) (constituent (K := K) q length (cyclicShape shape))
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val) lawY lawZ lawX tolerance := by
  rw [Interface.cyclic_windowedPower, cyclic_constituent]
  rfl

/-- A transposed windowed CW power preserves the corresponding physical fine-law restrictions. -/
theorem transposeXY_windowed_constituent {P : Type*} [Fintype P] (q length : ℕ) (shape : Shape)
    (lawX lawY lawZ : (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :
    transposeXY (Interface.windowedPower (P := P) (constituent (K := K) q length shape)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val) lawX lawY lawZ tolerance) =
    Interface.windowedPower (P := P) (constituent (K := K) q length (transposeShape shape))
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val) lawY lawX lawZ tolerance := by
  rw [Interface.transposeXY_windowedPower, transposeXY_constituent]
  rfl

end
end MatrixBounds.Tensor.CW
