module

public import Mathlib.Algebra.BigOperators.Field
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
public import Mathlib.Data.Fintype.Prod
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Tactic.Ring
public import MatrixBoundsStatement

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite coefficient tensors, actual axis maps, and rank decompositions.
These are operations on tensor coefficients in specified finite bases. Unlike
an arbitrary function transforming a tensor, each `restrict` operation is the
product of three independent linear changes of variables. -/

namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section

variable {K X Y Z U V W R : Type*} [CommSemiring K]

/-- Apply a matrix to the first tensor axis; rows are target coordinates. -/
def mapX [Fintype X] (matrix : U → X → K) (tensor : Coeff K X Y Z) : Coeff K U Y Z :=
  fun u y z => ∑ x, matrix u x * tensor x y z

/-- Apply a matrix to the second tensor axis. -/
def mapY [Fintype Y] (matrix : V → Y → K) (tensor : Coeff K X Y Z) : Coeff K X V Z :=
  fun x v z => ∑ y, matrix v y * tensor x y z

/-- Apply a matrix to the third tensor axis. -/
def mapZ [Fintype Z] (matrix : W → Z → K) (tensor : Coeff K X Y Z) : Coeff K X Y W :=
  fun x y w => ∑ z, matrix w z * tensor x y z

/-- A tensor restriction given explicitly by three independent coordinate matrices. -/
def restrict [Fintype X] [Fintype Y] [Fintype Z]
    (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K)
    (tensor : Coeff K X Y Z) : Coeff K U V W :=
  mapZ mz (mapY my (mapX mx tensor))

/-- An X-axis map transports a rank decomposition without adding terms. -/
def Decomposition.mapX [Fintype X] [Fintype R]
    {tensor : Coeff K X Y Z} (d : Decomposition tensor R) (matrix : U → X → K) :
    Decomposition (Tensor.mapX matrix tensor) R where
  left r u := ∑ x, matrix u x * d.left r x
  middle := d.middle
  right := d.right
  reconstruct u y z := by
    simp only [Tensor.mapX, d.reconstruct, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro r _
    simp only [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro x _
    ring

/-- A Y-axis map transports a rank decomposition without adding terms. -/
def Decomposition.mapY [Fintype Y] [Fintype R]
    {tensor : Coeff K X Y Z} (d : Decomposition tensor R) (matrix : V → Y → K) :
    Decomposition (Tensor.mapY matrix tensor) R where
  left := d.left
  middle r v := ∑ y, matrix v y * d.middle r y
  right := d.right
  reconstruct x v z := by
    simp only [Tensor.mapY, d.reconstruct, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro r _
    simp only [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro y _
    ring

/-- A Z-axis map transports a rank decomposition without adding terms. -/
def Decomposition.mapZ [Fintype Z] [Fintype R]
    {tensor : Coeff K X Y Z} (d : Decomposition tensor R) (matrix : W → Z → K) :
    Decomposition (Tensor.mapZ matrix tensor) R where
  left := d.left
  middle := d.middle
  right r w := ∑ z, matrix w z * d.right r z
  reconstruct x y w := by
    simp only [Tensor.mapZ, d.reconstruct, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro r _
    apply Finset.sum_congr rfl
    intro z _
    ring

/-- Three independent axis maps preserve the number of decomposition terms. -/
def Decomposition.restrict [Fintype X] [Fintype Y] [Fintype Z] [Fintype R]
    {tensor : Coeff K X Y Z} (d : Decomposition tensor R)
    (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    Decomposition (Tensor.restrict mx my mz tensor) R :=
  (d.mapX mx |>.mapY my).mapZ mz

/-- Coordinate restrictions cannot increase tensor rank. -/
theorem rankLE_restrict [Fintype X] [Fintype Y] [Fintype Z]
    {tensor : Coeff K X Y Z} {n : ℕ} (h : RankLE tensor n)
    (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    RankLE (restrict mx my mz tensor) n := by
  obtain ⟨d⟩ := h
  exact ⟨d.restrict mx my mz⟩

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- Independent copies have different variables on all three axes. -/
def directSum (family : I → Coeff K X Y Z) : Coeff K (I × X) (I × Y) (I × Z) :=
  fun x y z => if x.1 = y.1 ∧ y.1 = z.1 then family x.1 x.2 y.2 z.2 else 0

/-- Independent decompositions combine using one disjoint set of terms per source. -/
def directSumDecomposition [Fintype R] (family : I → Coeff K X Y Z)
    (d : ∀ i, Decomposition (family i) R) : Decomposition (directSum family) (I × R) where
  left term x := if term.1 = x.1 then (d term.1).left term.2 x.2 else 0
  middle term y := if term.1 = y.1 then (d term.1).middle term.2 y.2 else 0
  right term z := if term.1 = z.1 then (d term.1).right term.2 z.2 else 0
  reconstruct x y z := by
    rw [Fintype.sum_prod_type, Finset.sum_comm]
    simp only [ite_mul, mul_ite]
    by_cases hxy : x.1 = y.1 <;> by_cases hyz : y.1 = z.1 <;>
      simp_all [directSum, (d z.1).reconstruct, eq_comm]

/-- The rank budget of independent sources is at most their number times the per-source budget. -/
theorem rankLE_directSum (family : I → Coeff K X Y Z) (n : ℕ)
    (h : ∀ i, RankLE (family i) n) : RankLE (directSum family) (Fintype.card I * n) := by
  classical
  let d : ∀ i, Decomposition (family i) (Fin n) := fun i => Classical.choice (h i)
  have hcard : RankLE (directSum family) (Fintype.card (I × Fin n)) :=
    ⟨(directSumDecomposition family d).reindex (Fintype.equivFin (I × Fin n)).symm⟩
  simpa only [Fintype.card_prod, Fintype.card_fin] using hcard

/-- Matrix identifying all copies of the same variable, without identifying distinct variables. -/
def identify [DecidableEq X] : X → I × X → K :=
  fun x source => if x = source.2 then 1 else 0

/-- Summing tensors with shared variables is a restriction of their independent direct sum.
This supplies the actual linear maps needed to glue disjoint coefficient boxes. -/
theorem identify_directSum [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (family : I → Coeff K X Y Z) :
    restrict identify identify identify (directSum family) = fun x y z => ∑ i, family i x y z := by
  funext x y z
  simp [restrict, mapX, mapY, mapZ, identify, directSum, Fintype.sum_prod_type, ite_and]

/-- Apply different restrictions to independent sources and add the resulting tensors.
The displayed three matrices are a single valid restriction of the source direct sum. -/
theorem restrict_directSum [Fintype X] [Fintype Y] [Fintype Z]
    (family : I → Coeff K X Y Z)
    (mx : I → U → X → K) (my : I → V → Y → K) (mz : I → W → Z → K) :
    restrict (fun u source => mx source.1 u source.2)
      (fun v source => my source.1 v source.2) (fun w source => mz source.1 w source.2)
      (directSum family) = fun u v w => ∑ i, restrict (mx i) (my i) (mz i) (family i) u v w := by
  funext u v w
  simp [restrict, mapX, mapY, mapZ, directSum, Fintype.sum_prod_type,
    mul_ite, ite_and, Finset.mul_sum]

/-- A decomposition of the independent sources gives one of their ordinary sum. -/
theorem rankLE_sum_of_directSum [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (family : I → Coeff K X Y Z) (n : ℕ) (h : RankLE (directSum family) n) :
    RankLE (fun x y z => ∑ i, family i x y z) n := by
  have hmap := rankLE_restrict h
    (identify (K := K)) (identify (K := K)) (identify (K := K))
  rw [identify_directSum] at hmap
  exact hmap

/-- Ordinary tensor addition has rank at most the sum of equal per-term rank budgets. -/
theorem rankLE_sum [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (family : I → Coeff K X Y Z) (n : ℕ) (h : ∀ i, RankLE (family i) n) :
    RankLE (fun x y z => ∑ i, family i x y z) (Fintype.card I * n) :=
  rankLE_sum_of_directSum family _ (rankLE_directSum family n h)

/-- A binary axis box is an actual coordinate restriction. -/
def mask [DecidableEq X] (keep : X → Bool) : X → X → K :=
  fun x source => if x = source ∧ keep x = true then 1 else 0

/-- Zeroing variable parts agrees exactly with independent diagonal axis maps. -/
theorem restrict_mask [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z) (kx : X → Bool) (ky : Y → Bool) (kz : Z → Bool) :
    restrict (mask kx) (mask ky) (mask kz) tensor =
      fun x y z => if kx x = true ∧ ky y = true ∧ kz z = true then tensor x y z else 0 := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, mask]
  cases kx x <;> cases ky y <;> cases kz z <;> simp

end
end MatrixBounds.Tensor
