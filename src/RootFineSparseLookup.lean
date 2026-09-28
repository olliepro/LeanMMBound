import RootFineCacheAssembly

/-! Short sparse candidate rows avoid repeatedly reducing large literal arrays in kernel checks. -/
namespace MatrixBounds.Numeric

/-- Read a complete integer row from its explicitly stored nonzero coordinates; absent coordinates are zero. -/
def sparseIntegerLookup : List (ℕ × ℤ) → ℕ → ℤ
  | [], _ => 0
  | (position, value)::remaining, coordinate =>
      if coordinate = position then value else sparseIntegerLookup remaining coordinate

end MatrixBounds.Numeric
