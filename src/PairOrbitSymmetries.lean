module

public import PairOrbitEncoding

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Symbol relabelings descend to the checked unordered-pair orbit encoding. -/
namespace MatrixBounds.Entropy.PairEncoding

variable {children parents : ℕ}

/-- Exchanging the two child labels leaves the actual unordered-pair label unchanged. -/
theorem code_swap (encoding : PairEncoding children parents) (left right : Fin children) :
    encoding.code (left, right) = encoding.code (right, left) := by
  apply Function.LeftInverse.injective encoding.code_columns
  simp only [encoding.columns_code, min_comm, max_comm]

/-- Apply a child-label transformation to both components of a parent orbit. -/
def mapLabels (encoding : PairEncoding children parents) (transform : Fin children → Fin children)
    (orbit : Fin parents) : Fin parents :=
  encoding.code (transform (encoding.columns orbit).1, transform (encoding.columns orbit).2)

/-- Transforming a parent label agrees with transforming each label of every representing pair. -/
theorem mapLabels_code (encoding : PairEncoding children parents) (transform : Fin children → Fin children)
    (pair : Fin children × Fin children) :
    encoding.mapLabels transform (encoding.code pair) = encoding.code (transform pair.1, transform pair.2) :=
  (encoding.symmetric_invariant (fun left right => encoding.code (transform left, transform right))
    (fun left right => encoding.code_swap (transform left) (transform right)) pair).symm

/-- An involution of the child labels induces an involution of all parent orbit labels. -/
theorem mapLabels_involutive (encoding : PairEncoding children parents) (transform : Fin children → Fin children)
    (involutive : Function.Involutive transform) : Function.Involutive (encoding.mapLabels transform) := by
  intro orbit
  change encoding.mapLabels transform (encoding.code (transform (encoding.columns orbit).1,
    transform (encoding.columns orbit).2)) = orbit
  rw [encoding.mapLabels_code, involutive, involutive, encoding.code_columns]

/-- The exact parent-label permutation induced by an involution of the child labels. -/
def liftInvolution (encoding : PairEncoding children parents) (transform : Fin children → Fin children)
    (involutive : Function.Involutive transform) : Equiv.Perm (Fin parents) :=
  Function.Involutive.toPerm _ (encoding.mapLabels_involutive transform involutive)

end MatrixBounds.Entropy.PairEncoding
