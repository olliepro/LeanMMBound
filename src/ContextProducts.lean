import ContextComposition

/-! A stage can act on its active factor while carrying its waiting factor
unchanged; new independent copies contain both resulting factors. -/
namespace MatrixBounds.Tensor

universe v w
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- Keep a fixed finite companion factor throughout a transformation, including any additional outer context. -/
theorem ContextReduction.keep_left {A B C : Type w} [Fintype A] [Fintype B] [Fintype C]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{max v w} source target cost) (waiting : Coeff K A B C) :
    ContextReduction.{v} (product waiting source) (product waiting target) cost := by
  intro D E F finiteD finiteE finiteF companion rank algorithm
  have pulled := rankLE_pullback algorithm
    (fun x : (D × A) × X => (x.1.1, x.1.2, x.2))
    (fun y : (E × B) × Y => (y.1.1, y.1.2, y.2))
    (fun z : (F × C) × Z => (z.1.1, z.1.2, z.2))
  have input : RankLE (product (product companion waiting) source) rank := by
    convert pulled using 1
    funext x y z
    exact mul_assoc _ _ _
  have output := reduction _ _ _ (product companion waiting) rank input
  have restored := rankLE_pullback output
    (fun x : D × (A × U) => ((x.1, x.2.1), x.2.2))
    (fun y : E × (B × V) => ((y.1, y.2.1), y.2.2))
    (fun z : F × (C × W) => ((z.1, z.2.1), z.2.2))
  convert restored using 1
  funext x y z
  exact (mul_assoc _ _ _).symm

/-- A waiting tensor distributes into every newly selected independent output copy by explicit axis maps. -/
theorem contextReduction_distribute_left {A B C I : Type*} [DecidableEq I]
    (waiting : Coeff K A B C) (target : Coeff K U V W) :
    ContextReduction.{v} (product waiting (directSum (fun _ : I => target)))
      (directSum (fun _ : I => product waiting target)) 1 := by
  have pulled := contextReduction_pullback.{v} (product waiting (directSum (fun _ : I => target)))
    (fun x : I × (A × U) => (x.2.1, x.1, x.2.2))
    (fun y : I × (B × V) => (y.2.1, y.1, y.2.2))
    (fun z : I × (C × W) => (z.2.1, z.1, z.2.2))
  convert pulled using 1
  funext x y z
  simp only [product, directSum, mul_ite, mul_zero]

/-- Every extracted copy retains the entire waiting factor, with the original extraction overhead. -/
theorem ContextReduction.extract_with_waiting {A B C : Type w} [Fintype A] [Fintype B] [Fintype C]
    {I : Type*} [DecidableEq I] {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{max v w} source (directSum (fun _ : I => target)) cost)
    (waiting : Coeff K A B C) :
    ContextReduction.{v} (product waiting source) (directSum (fun _ : I => product waiting target)) cost := by
  simpa only [one_mul] using (reduction.keep_left waiting).trans (contextReduction_distribute_left waiting target)

end
end MatrixBounds.Tensor
