module

public import CWRationalChildren
public import CWRationalPermutations
public import CWRoleWindowRouting

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Shared extraction children retain their original shape and population labels
when a parent used a physical role. Only the actual axes are permuted. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- Reindex each original child shape into the physical order selected by its parent. -/
def roleChildEquiv (role : T → AxisOrder) : ChildIndex length ≃ ChildIndex length :=
  Equiv.sigmaCongrRight (fun type => shapeAlphabetPermutation (role type).permutation (2*length type))

omit [Fintype T] in
/-- Physical child reindexing preserves the original exact fixed population coefficient. -/
theorem role_childWeight (split : RationalSplit (length type) denominator) (order : AxisOrder)
    (weight : ℕ) (child : ShapeAlphabet (2*length type)) :
    (split.permute order.permutation).childWeight weight
      (shapeAlphabetPermutation order.permutation (2*length type) child) = split.childWeight weight child := by
  simp only [RationalSplit.childWeight, RationalSplit.permute, Function.comp_apply, Equiv.symm_apply_apply]

/-- Every physically reindexed child window is an actual window on the original child with the chosen physical axes. -/
def roleChildWindowRestriction (splits : ∀ type, RationalSplit (length type) denominator)
    (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) (index : ChildIndex length) :
    CoordinateRestriction
      (windowedPower (K := K)
        (P := Fin ((splits index.1 |>.permute (role index.1).permutation).childWeight (weight index.1)
          (shapeAlphabetPermutation (role index.1).permutation (2*length index.1) index.2)*size))
        (constituent q (length index.1) (index.2.val.permute (role index.1).permutation))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (law index.1 ((role index.1).permutation 0) index.2)
        (law index.1 ((role index.1).permutation 1) index.2)
        (law index.1 ((role index.1).permutation 2) index.2) (tolerance index.1))
      (orientedSourceWindow (K := K)
        (Positions := fun label : ChildIndex length => Fin ((splits label.1).childWeight (weight label.1) label.2*size))
        q (fun label => length label.1) (fun label => label.2.val)
        (fun label axis => law label.1 axis label.2) (fun label => tolerance label.1) (role index.1) index) :=
  windowPositionRestriction
    (finCongr (congrArg (fun population => population*size) (role_childWeight (splits index.1) (role index.1) (weight index.1) index.2)))
    (constituent q (length index.1) (index.2.val.permute (role index.1).permutation))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (law index.1 ((role index.1).permutation 0) index.2)
    (law index.1 ((role index.1).permutation 1) index.2)
    (law index.1 ((role index.1).permutation 2) index.2) (tolerance index.1)

/-- Restore original child labels in the actual full output of a physically oriented rational extraction. -/
def roleChildrenRestriction (splits : ∀ type, RationalSplit (length type) denominator)
    (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) :
    CoordinateRestriction
      (rationalChildren (K := K) (fun type => (splits type).permute (role type).permutation) weight size q
        (fun type child => law type ((role type).permutation 0) ((shapeAlphabetPermutation (role type).permutation _).symm child))
        (fun type child => law type ((role type).permutation 1) ((shapeAlphabetPermutation (role type).permutation _).symm child))
        (fun type child => law type ((role type).permutation 2) ((shapeAlphabetPermutation (role type).permutation _).symm child)) tolerance)
      (heterogeneous (fun index : ChildIndex length => orientedSourceWindow (K := K)
        (Positions := fun label : ChildIndex length => Fin ((splits label.1).childWeight (weight label.1) label.2*size))
        q (fun label => length label.1) (fun label => label.2.val)
        (fun label axis => law label.1 axis label.2) (fun label => tolerance label.1) (role index.1) index)) := by
  unfold rationalChildren
  refine (reindexRestriction (roleChildEquiv role) _).trans ?_
  apply CoordinateRestriction.heterogeneous
  intro index
  rw [roleChildEquiv, Equiv.sigmaCongrRight_apply]
  simpa only [Equiv.symm_apply_apply] using!
    roleChildWindowRestriction (K := K) splits role weight size q law tolerance index

end
end MatrixBounds.Tensor.CW.Mixed
