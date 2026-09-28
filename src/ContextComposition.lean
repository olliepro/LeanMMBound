import ContextCopies

/-! Later extractions preserve every earlier output copy. Consecutive stages
multiply copy counts and overheads while retaining arbitrary waiting factors. -/
namespace MatrixBounds.Tensor

universe v w
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- A contextual transformation applies simultaneously inside every independent old copy at the same overhead. -/
theorem ContextReduction.batch {I : Type w} [Fintype I] [DecidableEq I]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{max v w} source target cost) :
    ContextReduction.{v} (directSum (fun _ : I => source)) (directSum (fun _ : I => target)) cost := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  let diagonal : Coeff K I I I := fun i j k => if i = j ∧ j = k then 1 else 0
  have pulled := rankLE_pullback algorithm
    (fun x : (A × I) × X => (x.1.1, x.1.2, x.2))
    (fun y : (B × I) × Y => (y.1.1, y.1.2, y.2))
    (fun z : (C × I) × Z => (z.1.1, z.1.2, z.2))
  have input : RankLE (product (product companion diagonal) source) rank := by
    convert pulled using 1
    funext x y z
    simp only [product, directSum, diagonal, mul_ite, ite_mul, mul_one, mul_zero, zero_mul]
  have transformed := reduction (A × I) (B × I) (C × I) (product companion diagonal) rank input
  have output := rankLE_pullback transformed
    (fun x : A × (I × U) => ((x.1, x.2.1), x.2.2))
    (fun y : B × (I × V) => ((y.1, y.2.1), y.2.2))
    (fun z : C × (I × W) => ((z.1, z.2.1), z.2.2))
  convert output using 1
  funext x y z
  simp only [product, directSum, diagonal, mul_ite, ite_mul, mul_one, mul_zero, zero_mul]

/-- Two genuine extraction stages multiply their independent output counts, with only the product of their overheads. -/
theorem ContextReduction.compose_extractions {A B C : Type*} {I : Type w} {J : Type*}
    [Fintype I] [DecidableEq I] [DecidableEq J]
    {source : Coeff K X Y Z} {middle : Coeff K U V W} {target : Coeff K A B C}
    {firstCost secondCost : ℕ}
    (first : ContextReduction.{v} source (directSum (fun _ : I => middle)) firstCost)
    (second : ContextReduction.{max v w} middle (directSum (fun _ : J => target)) secondCost) :
    ContextReduction.{v} source (directSum (fun _ : I × J => target)) (secondCost*firstCost) := by
  have both := first.trans (second.batch (I := I))
  simpa only [one_mul] using both.trans (contextReduction_flattenCopies target)

end
end MatrixBounds.Tensor
