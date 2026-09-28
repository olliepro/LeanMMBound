import BatchRestrictions

/-! Tensor reductions remain valid beside any untouched tensor factor.
This supplies both persistent batch labels and waiting pipeline sectors. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- A restriction of one tensor factor leaves all coordinates and coefficients of its companion tensor unchanged. -/
theorem restrict_product_right {A B C : Type*} [Fintype A] [Fintype B] [Fintype C]
    [Fintype X] [Fintype Y] [Fintype Z] (companion : Coeff K A B C)
    (source : Coeff K X Y Z) (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    restrict (batchMap mx) (batchMap my) (batchMap mz) (product companion source) =
      product companion (restrict mx my mz source) := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, batchMap, product, Fintype.sum_prod_type,
    ite_mul, zero_mul, Finset.sum_ite_irrel, Finset.sum_const_zero,
    Finset.sum_ite_eq, Finset.mem_univ, if_true, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro c _
  apply Finset.sum_congr rfl
  intro b _
  apply Finset.sum_congr rfl
  intro a _
  ring

/-- A proved tensor transformation valid in every finite tensor context, with a fixed multiplicative overhead.
For example, keeping a waiting matrix factor uses it as the companion tensor. -/
def ContextReduction (source : Coeff K X Y Z) (target : Coeff K U V W) (cost : ℕ) : Prop :=
  ∀ (A B C : Type v) [Fintype A] [Fintype B] [Fintype C] (companion : Coeff K A B C) (rank : ℕ),
    RankLE (product companion source) rank → RankLE (product companion target) (cost*rank)

/-- Linear restrictions act at unit cost in any untouched tensor context. -/
theorem contextReduction_restrict [Fintype X] [Fintype Y] [Fintype Z]
    (source : Coeff K X Y Z) (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    ContextReduction.{v} source (restrict mx my mz source) 1 := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  simpa only [restrict_product_right, one_mul] using
    rankLE_restrict algorithm (batchMap mx) (batchMap my) (batchMap mz)

/-- Coordinate pullbacks preserve every companion factor at unit cost. -/
theorem contextReduction_pullback (source : Coeff K X Y Z) (mx : U → X) (my : V → Y) (mz : W → Z) :
    ContextReduction.{v} source (fun x y z => source (mx x) (my y) (mz z)) 1 := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  simpa only [product, one_mul] using rankLE_pullback algorithm
    (fun x : A × U => (x.1, mx x.2)) (fun y : B × V => (y.1, my y.2)) (fun z : C × W => (z.1, mz z.2))

/-- The identity transformation is valid in every tensor context. -/
theorem ContextReduction.refl (source : Coeff K X Y Z) : ContextReduction.{v} source source 1 := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  simpa only [one_mul] using algorithm

/-- Context-preserving transformations compose with the product of their actual overheads. -/
theorem ContextReduction.trans {A B C : Type*} {source : Coeff K X Y Z} {middle : Coeff K U V W}
    {target : Coeff K A B C} {firstCost secondCost : ℕ}
    (first : ContextReduction.{v} source middle firstCost) (second : ContextReduction.{v} middle target secondCost) :
    ContextReduction.{v} source target (secondCost*firstCost) := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  simpa only [Nat.mul_assoc] using second A B C companion _ (first A B C companion rank algorithm)

/-- Independent copies are the tensor context given by a diagonal coefficient tensor. -/
theorem ContextReduction.toBatchReduction {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) : BatchReduction.{v} source target cost := by
  intro E finite rank algorithm
  let diagonal : Coeff K E E E := fun i j k => if i = j ∧ j = k then 1 else 0
  have sourceIdentity : product diagonal source = directSum (fun _ : E => source) := by
    funext x y z
    simp only [product, diagonal, directSum, ite_mul, one_mul, zero_mul]
  have targetIdentity : product diagonal target = directSum (fun _ : E => target) := by
    funext x y z
    simp only [product, diagonal, directSum, ite_mul, one_mul, zero_mul]
  rw [← targetIdentity]
  exact reduction E E E diagonal rank (sourceIdentity ▸ algorithm)

end
end MatrixBounds.Tensor
