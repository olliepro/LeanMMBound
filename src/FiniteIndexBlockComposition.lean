import FiniteIndexBlocks

/-! Compose independent exact finite checks without a large case-split proof. -/
namespace MatrixBounds.Numeric

/-- A proved predicate on one consecutive block of a finite index set. -/
structure IndexBlockCertificate {total : ℕ} (predicate : Fin total → Prop) (offset width : ℕ) : Prop where
  /-- The entire block lies inside the original index set. -/
  inside : offset+width ≤ total
  /-- Every actual index in the block satisfies the intended predicate. -/
  checked : ∀ index : Fin width, predicate (blockIndex offset width inside index)

namespace IndexBlockCertificate

/-- Join adjacent verified blocks; for example blocks [0,256) and [256,512) cover [0,512). -/
theorem append {total offset left right : ℕ} {predicate : Fin total → Prop}
    (first : IndexBlockCertificate predicate offset left)
    (second : IndexBlockCertificate predicate (offset+left) right) :
    IndexBlockCertificate predicate offset (left+right) := by
  have inside : offset+(left+right) ≤ total := by have := second.inside; omega
  refine ⟨inside, ?_⟩
  intro index
  let original := blockIndex offset (left+right) inside index
  have originalValue : original.val = offset+index.val := rfl
  by_cases early : index.val < left
  · exact of_block_check first.inside first.checked original (by omega) (by omega)
  · exact of_block_check second.inside second.checked original (by omega) (by have := index.isLt; omega)

/-- A certificate spanning the entire index set gives its predicate at every source index. -/
theorem complete {total : ℕ} {predicate : Fin total → Prop}
    (certificate : IndexBlockCertificate predicate 0 total) (index : Fin total) : predicate index :=
  of_block_check certificate.inside certificate.checked index (Nat.zero_le _) (by simp)

end IndexBlockCertificate
end MatrixBounds.Numeric
