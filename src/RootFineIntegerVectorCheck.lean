module

public import RootFineParent3CacheTable

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A compact Boolean vector certificate checks every orbit without expanding a dependent universal proof. -/
namespace MatrixBounds.Numeric

/-- Compare two complete integer vectors at every original finite coordinate. -/
def integerVectorCheck {width : ℕ} (left right : Fin width → ℤ) : Bool :=
  (List.finRange width).all (fun coordinate => decide (left coordinate = right coordinate))

/-- Acceptance of the Boolean vector certificate proves every original coordinate equality. -/
theorem integerVectorCheck_sound {width : ℕ} (left right : Fin width → ℤ)
    (checked : integerVectorCheck left right = true) (coordinate : Fin width) :
    left coordinate = right coordinate := by
  exact of_decide_eq_true (List.all_eq_true.mp checked coordinate (List.mem_finRange coordinate))

end MatrixBounds.Numeric
