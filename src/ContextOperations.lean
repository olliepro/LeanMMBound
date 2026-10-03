module

public import ContextRestrictions
public import TypeBatchGluing

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite addition and independent-copy assembly preserve arbitrary untouched
tensor factors. Their rank multipliers count only new supplied copies. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z U V W I : Type*} [CommSemiring K] [Fintype I] [DecidableEq I]

omit [DecidableEq I] in
/-- A sum of uniformly bounded contextual transformations pays only the number of summed terms. -/
theorem ContextReduction.sum [Fintype U] [Fintype V] [Fintype W]
    {source : Coeff K X Y Z} (family : I → Coeff K U V W) {cost : ℕ}
    (reductions : ∀ i, ContextReduction.{v} source (family i) cost) :
    ContextReduction.{v} source (fun x y z => ∑ i, family i x y z) (Fintype.card I*cost) := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  have combined := rankLE_sum (fun i => product companion (family i)) (cost*rank)
    (fun i => reductions i A B C companion rank algorithm)
  change RankLE (fun (x : A × U) (y : B × V) (z : C × W) => companion x.1 y.1 z.1*(∑ i, family i x.2 y.2 z.2)) _
  simpa only [product, Finset.mul_sum, Nat.mul_assoc] using combined

/-- Assemble independent target families while preserving all previously present context coordinates. -/
theorem ContextReduction.directSum {source : Coeff K X Y Z} (family : I → Coeff K U V W) {cost : ℕ}
    (reductions : ∀ i, ContextReduction.{v} source (family i) cost) :
    ContextReduction.{v} source (directSum family) (Fintype.card I*cost) := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  have combined := rankLE_directSum (fun i => product companion (family i)) (cost*rank)
    (fun i => reductions i A B C companion rank algorithm)
  have pulled := rankLE_pullback combined
    (fun x : A × (I × U) => (x.2.1, x.1, x.2.2))
    (fun y : B × (I × V) => (y.2.1, y.1, y.2.2))
    (fun z : C × (I × W) => (z.2.1, z.1, z.2.2))
  change RankLE (fun (x : A × (I × U)) (y : B × (I × V)) (z : C × (I × W)) => companion x.1 y.1 z.1*Tensor.directSum family x.2 y.2 z.2) _
  simpa only [product, Tensor.directSum, mul_ite, mul_zero, Nat.mul_assoc] using pulled

omit [Fintype I] [DecidableEq I] in
/-- An identically zero target has zero complexity in every tensor context. -/
theorem contextReduction_zero (source : Coeff K X Y Z) (cost : ℕ) :
    ContextReduction.{v} source (fun (_ : U) (_ : V) (_ : W) => (0 : K)) cost := by
  intro A B C finiteA finiteB finiteC companion rank _
  change RankLE (fun (x : A × U) (y : B × V) (z : C × W) => companion x.1 y.1 z.1*0) (cost*rank)
  simp only [mul_zero]
  exact rankLE_zero _

end
end MatrixBounds.Tensor
