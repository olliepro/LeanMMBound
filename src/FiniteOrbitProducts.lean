module

public import FiniteOrbitData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Products and coarsenings of actual finite word orbits have exact fiber
counts. These formulas evaluate recursive orbit sizes without enumerating words. -/
namespace MatrixBounds.Entropy.OrbitMap

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {A B C D : Type*} [Fintype A] [Fintype B] [Fintype C] [Fintype D]

/-- Take independent orbit labels on the two halves of a complete word. -/
def product (first : OrbitMap A B) (second : OrbitMap C D) : OrbitMap (A × C) (B × D) where
  label pair := (first.label pair.1, second.label pair.2)
  representative pair := (first.representative pair.1, second.representative pair.2)
  representative_label pair := Prod.ext (first.representative_label pair.1) (second.representative_label pair.2)

/-- A product orbit's actual words are exactly the Cartesian product of its two fibers. -/
def productFiberEquiv (first : OrbitMap A B) (second : OrbitMap C D) (orbit : B × D) :
    (first.product second).Fiber orbit ≃ first.Fiber orbit.1 × second.Fiber orbit.2 where
  toFun entry := (⟨entry.val.1, congrArg Prod.fst entry.property⟩, ⟨entry.val.2, congrArg Prod.snd entry.property⟩)
  invFun pair := ⟨(pair.1.val, pair.2.val), Prod.ext pair.1.property pair.2.property⟩
  left_inv _ := rfl
  right_inv _ := rfl

omit [Fintype B] [Fintype D] in
/-- The exact size of a product orbit is the product of the two actual orbit sizes. -/
theorem product_size (first : OrbitMap A B) (second : OrbitMap C D) (orbit : B × D) :
    (first.product second).size orbit = first.size orbit.1*second.size orbit.2 := by
  have count := Nat.card_congr (first.productFiberEquiv second orbit)
  simpa only [size, ← Nat.card_eq_fintype_card, Nat.card_prod] using count

/-- Coarsen an actual word partition through a second finite partition of its labels. -/
def compose (first : OrbitMap A B) (second : OrbitMap B C) : OrbitMap A C where
  label word := second.label (first.label word)
  representative orbit := first.representative (second.representative orbit)
  representative_label orbit := by rw [first.representative_label, second.representative_label]

/-- A coarsened fiber is the disjoint union of the complete original fibers having that new label. -/
def composeFiberEquiv (first : OrbitMap A B) (second : OrbitMap B C) (orbit : C) :
    (first.compose second).Fiber orbit ≃ ((label : second.Fiber orbit) × first.Fiber label.val) where
  toFun entry := ⟨⟨first.label entry.val, entry.property⟩, ⟨entry.val, rfl⟩⟩
  invFun entry := ⟨entry.2.val, by change second.label (first.label entry.2.val) = orbit; rw [entry.2.property]; exact entry.1.property⟩
  left_inv _ := rfl
  right_inv entry := by
    rcases entry with ⟨⟨label, inside⟩, ⟨word, same⟩⟩
    cases same
    rfl

omit [Fintype C] in
/-- Recursive coarsening adds precisely the sizes of its constituent labelled fibers. -/
theorem compose_size (first : OrbitMap A B) (second : OrbitMap B C) (orbit : C) :
    (first.compose second).size orbit = ∑ label : second.Fiber orbit, first.size label.val := by
  simpa only [size, Fintype.card_sigma] using Fintype.card_congr (first.composeFiberEquiv second orbit)

/-- Change the concrete word coordinates by a bijection without changing any orbit semantics. -/
def reindex (partition : OrbitMap A B) (words : C ≃ A) : OrbitMap C B where
  label word := partition.label (words word)
  representative orbit := words.symm (partition.representative orbit)
  representative_label orbit := by rw [Equiv.apply_symm_apply, partition.representative_label]

omit [Fintype B] in
/-- Renaming the word coordinates preserves the exact cardinality of every orbit. -/
theorem reindex_size (partition : OrbitMap A B) (words : C ≃ A) (orbit : B) :
    (partition.reindex words).size orbit = partition.size orbit :=
  Fintype.card_congr (Equiv.subtypeEquiv words (fun _ => Iff.rfl))

end
end MatrixBounds.Entropy.OrbitMap
