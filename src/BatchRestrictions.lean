import TensorBatching
import PolynomialDegeneration

/-! Independent linear restrictions lift through arbitrary existing batches.
This keeps the already earned copy index in every later extraction stage. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- Apply an axis matrix independently inside each outer copy, keeping copy labels distinct. -/
def batchMap {E : Type*} (matrix : U → X → K) : E × U → E × X → K :=
  fun target source => if target.1 = source.1 then matrix target.2 source.2 else 0

/-- Three block-diagonal axis maps apply a restriction inside every copy without changing its outer label. -/
theorem restrict_batch {E : Type*} [Fintype E] [Fintype X] [Fintype Y] [Fintype Z]
    (source : Coeff K X Y Z) (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    restrict (batchMap (E := E) mx) (batchMap (E := E) my) (batchMap (E := E) mz)
      (directSum (fun _ : E => source)) = directSum (fun _ : E => restrict mx my mz source) := by
  funext ⟨i, x⟩ ⟨j, y⟩ ⟨k, z⟩
  by_cases first : i = j <;> by_cases second : j = k <;>
    simp [restrict, mapX, mapY, mapZ, batchMap, directSum, Fintype.sum_prod_type,
      ite_and, first, second, mul_ite, ite_mul, Finset.sum_ite_irrel, eq_comm]
  all_goals tauto

/-- A transformation that preserves arbitrary existing output batches, with one common rank multiplier.
For example, cost=1 includes any restriction by independent linear maps. -/
def BatchReduction (source : Coeff K X Y Z) (target : Coeff K U V W) (cost : ℕ) : Prop :=
  ∀ (E : Type v) [Fintype E], ∀ rank : ℕ,
    RankLE (directSum (fun _ : E => source)) rank →
    RankLE (directSum (fun _ : E => target)) (cost*rank)

/-- Every independent-axis linear restriction preserves the full incoming batch budget. -/
theorem batchReduction_restrict [Fintype X] [Fintype Y] [Fintype Z]
    (source : Coeff K X Y Z) (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    BatchReduction.{v} source (restrict mx my mz source) 1 := by
  intro E finite rank algorithm
  simpa only [restrict_batch, one_mul] using rankLE_restrict algorithm (batchMap mx) (batchMap my) (batchMap mz)

/-- Coordinate pullbacks also preserve every existing copy label and the whole batch budget. -/
theorem batchReduction_pullback (source : Coeff K X Y Z) (mx : U → X) (my : V → Y) (mz : W → Z) :
    BatchReduction.{v} source (fun x y z => source (mx x) (my y) (mz z)) 1 := by
  intro E finite rank algorithm
  simpa only [directSum, one_mul] using rankLE_pullback algorithm
    (fun x : E × U => (x.1, mx x.2)) (fun y : E × V => (y.1, my y.2)) (fun z : E × W => (z.1, mz z.2))

/-- Doing nothing preserves a batch at unit cost. -/
theorem BatchReduction.refl (source : Coeff K X Y Z) : BatchReduction.{v} source source 1 := by
  intro E finite rank algorithm
  simpa only [one_mul] using algorithm

/-- Successive batch-preserving transformations multiply only their overheads. -/
theorem BatchReduction.trans {A B C : Type*} {source : Coeff K X Y Z} {middle : Coeff K U V W}
    {target : Coeff K A B C} {firstCost secondCost : ℕ}
    (first : BatchReduction.{v} source middle firstCost) (second : BatchReduction.{v} middle target secondCost) :
    BatchReduction.{v} source target (secondCost*firstCost) := by
  intro E finite rank algorithm
  simpa only [Nat.mul_assoc] using second E (firstCost*rank) (first E rank algorithm)

/-- A batch-preserving restriction can be applied to an incoming polynomial degeneration after one coefficient extraction. -/
theorem BatchReduction.apply_certificate {E : Type v} [Fintype E]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost rank degree : ℕ}
    (reduction : BatchReduction.{v} source target cost)
    (certificate : Degeneration.Certificate (directSum (fun _ : E => source)) rank degree) :
    RankLE (directSum (fun _ : E => target)) (cost*(rank*(degree+1)^2)) :=
  reduction E _ certificate.exact_rank

end
end MatrixBounds.Tensor
