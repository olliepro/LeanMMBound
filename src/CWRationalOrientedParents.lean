import CWRationalOrientedChildren
import CWRationalStage

/-! Parent interfaces of the physical rational extraction are exactly the
complete original parent windows in their selected physical roles. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- Complete original child laws in the actual physical role of their parent. -/
def roleLaw (role : T → AxisOrder)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (axis : Fin 3) (type : T) (child : ShapeAlphabet (2*length type)) : (Fin (length type) → Fin 3) → ℝ :=
  law type ((role type).permutation axis) ((shapeAlphabetPermutation (role type).permutation (2*length type)).symm child)

omit [Fintype T] in
/-- The physical rational parent's complete center equals the original parent law on its selected axis. -/
theorem role_parentLaw (splits : ∀ type, RationalSplit (length type) denominator) (role : T → AxisOrder)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (type : T) (axis : Fin 3) :
    ((splits type).permute (role type).permutation).parentLaw (roleLaw role law axis type) =
      (splits type).parentLaw (law type ((role type).permutation axis)) :=
  (splits type).permute_parentLaw (role type).permutation (law type ((role type).permutation axis))

/-- The actual rational parent tensor equals the separately labelled original full windows in their assigned roles. -/
theorem roleParent_eq (splits : ∀ type, RationalSplit (length type) denominator)
    (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) :
    rationalParent (K := K) (fun type => (splits type).permute (role type).permutation) weight size q
      (roleLaw role law 0) (roleLaw role law 1) (roleLaw role law 2) tolerance =
      heterogeneous (fun type => orientedSourceWindow (K := K) (Positions := fun label => Fin (weight label*size))
        q (fun label => length label+length label) (fun label => (splits label).parent)
        (fun label axis => (splits label).parentLaw (law label axis)) tolerance (role type) type) := by
  unfold rationalParent orientedSourceWindow
  simp only [role_parentLaw]
  rfl

end
end MatrixBounds.Tensor.CW.Mixed
