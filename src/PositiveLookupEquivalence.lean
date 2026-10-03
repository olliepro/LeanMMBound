module

public import WeightedPools

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A partial source lookup becomes an actual bijection after exactly the
zero-weight absent entries are removed. No positive child can be discarded. -/
namespace MatrixBounds.Interface

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Exact partial indexing data, including both inverse identities on all present source entries. -/
structure PartialIndexing (A B : Type*) where
  /-- Optional original output label for a source index. -/
  encode : A → Option B
  /-- Original source index for every output label. -/
  decode : B → A
  /-- Decoding never invents a label absent from the original source. -/
  encode_decode : ∀ label, encode (decode label) = some label
  /-- Every present source entry returns to exactly the same original source index. -/
  decode_encode : ∀ index label, encode index = some label → decode label = index

namespace PartialIndexing

/-- Positive source weights and their decoded output weights identify exactly the same original labelled factors. -/
def positiveEquiv {A B : Type*} (indices : PartialIndexing A B) (weight : A → ℕ)
    (supported : ∀ index, 0 < weight index → indices.encode index ≠ none) :
    PositiveWeight weight ≃ PositiveWeight (fun label => weight (indices.decode label)) where
  toFun index :=
    let label := (indices.encode index.val).get (Option.isSome_iff_ne_none.mpr (supported index.val index.property))
    have present : indices.encode index.val = some label := (Option.some_get _).symm
    ⟨label, by
      change 0 < weight (indices.decode label)
      rw [indices.decode_encode index.val label present]
      exact index.property⟩
  invFun label := ⟨indices.decode label.val, label.property⟩
  left_inv index := by
    apply Subtype.ext
    exact indices.decode_encode index.val _ (Option.some_get _).symm
  right_inv label := by
    apply Subtype.ext
    simp only [indices.encode_decode, Option.get_some]

end PartialIndexing
end
end MatrixBounds.Interface
