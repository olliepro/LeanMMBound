import HeterogeneousInterface
import ConstrainedCounting

/-! Equivariant maps onto transitive finite sets have equal fibers. Applied to
coarse marginal words, this proves the exact competitor degrees used by hashing. -/
namespace MatrixBounds.Selection

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {G Edge Block : Type*} [Group G] [MulAction G Edge] [MulAction G Block]

/-- A group element transporting two blocks also gives a bijection between their edge fibers. -/
def fiberTransport (projection : Edge → Block)
    (equivariant : ∀ (g : G) edge, projection (g • edge) = g • projection edge)
    {left right : Block} (g : G) (moves : g • left = right) :
    {edge // projection edge = left} ≃ {edge // projection edge = right} where
  toFun edge := ⟨g • edge.val, by rw [equivariant, edge.property, moves]⟩
  invFun edge := ⟨g⁻¹ • edge.val, by rw [equivariant, edge.property, ← moves, inv_smul_smul]⟩
  left_inv edge := by apply Subtype.ext; exact inv_smul_smul g edge.val
  right_inv edge := by apply Subtype.ext; exact smul_inv_smul g edge.val

/-- All coarse-block fibers have the same cardinality under a transitive action. -/
theorem fiber_card_constant [MulAction.IsPretransitive G Block] (projection : Edge → Block)
    (equivariant : ∀ (g : G) edge, projection (g • edge) = g • projection edge) (left right : Block) :
    Nat.card {edge // projection edge = left} = Nat.card {edge // projection edge = right} := by
  obtain ⟨g, moves⟩ := MulAction.exists_smul_eq G left right
  exact Nat.card_congr (fiberTransport projection equivariant g moves)

/-- Equal fibers give the exact identity: blocks times competitors per block equals all edges. -/
theorem fiber_card_identity [Fintype Edge] [Fintype Block] [MulAction.IsPretransitive G Block]
    (projection : Edge → Block) (equivariant : ∀ (g : G) edge, projection (g • edge) = g • projection edge)
    (block : Block) :
    Fintype.card Block * Nat.card {edge // projection edge = block} = Fintype.card Edge := by
  have total : (∑ b : Block, Nat.card {edge // projection edge = b}) = Fintype.card Edge := by
    simpa only [Nat.card_eq_fintype_card, Fintype.card_sigma] using
      Fintype.card_congr (Equiv.sigmaFiberEquiv projection)
  have same (b : Block) := fiber_card_constant projection equivariant b block
  simpa only [same, Finset.sum_const, Finset.card_univ, smul_eq_mul] using total

end
end MatrixBounds.Selection

namespace MatrixBounds.Empirical

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P A BX BY BZ : Type*} [Fintype P] [Fintype A]

/-- Position permutations preserve the three marginal constraints simultaneously. -/
instance marginalWordsAction (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (px : BX → ℕ) (py : BY → ℕ) (pz : BZ → ℕ) :
    MulAction (Equiv.Perm P) (MarginalWords (P := P) ix iy iz px py pz) where
  smul permutation word := ⟨reorder permutation word.val, by
    refine ⟨?_, ?_, ?_⟩
    · intro b
      exact (count_reorder permutation (fun p => ix (word.val p)) b).trans (word.property.1 b)
    · intro b
      exact (count_reorder permutation (fun p => iy (word.val p)) b).trans (word.property.2.1 b)
    · intro b
      exact (count_reorder permutation (fun p => iz (word.val p)) b).trans (word.property.2.2 b)⟩
  one_smul word := by apply Subtype.ext; rfl
  mul_smul left right word := by apply Subtype.ext; rfl

/-- Project an admissible joint coarse word to its typed X marginal. -/
def marginalX (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (px : BX → ℕ) (py : BY → ℕ) (pz : BZ → ℕ)
    (word : MarginalWords (P := P) ix iy iz px py pz) : TypedWord (P := P) px :=
  ⟨fun p => ix (word.val p), word.property.1⟩

/-- X-fiber degree is exactly A/B_X, established by symmetry of the actual coarse words. -/
theorem marginalX_degree_identity [Fintype BX] (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (px : BX → ℕ) (py : BY → ℕ) (pz : BZ → ℕ) (block : TypedWord (P := P) px) :
    Fintype.card (TypedWord (P := P) px) *
      Nat.card {word : MarginalWords (P := P) ix iy iz px py pz // marginalX ix iy iz px py pz word = block} =
      Fintype.card (MarginalWords (P := P) ix iy iz px py pz) := by
  apply Selection.fiber_card_identity (G := Equiv.Perm P) (marginalX ix iy iz px py pz)
  intro permutation word
  rfl

/-- Project a joint exact-type word to the induced exact type of one coordinate. -/
def typedProjection {B : Type*} (profile : A → ℕ) (index : A → B)
    (word : TypedWord (P := P) profile) : TypedWord (P := P) (marginalProfile profile index) :=
  ⟨fun p => index (word.val p), hasType_projected profile index word.val word.property⟩

/-- Projection of exact types commutes with all position permutations. -/
theorem typedProjection_equivariant {B : Type*} (profile : A → ℕ) (index : A → B)
    (permutation : Equiv.Perm P) (word : TypedWord (P := P) profile) :
    typedProjection profile index (permutation • word) = permutation • typedProjection profile index word := rfl

/-- Prescribed joint types have exactly G/B edges over every projected coarse word. -/
theorem typedProjection_degree_identity {B : Type*} [Fintype B] (profile : A → ℕ) (index : A → B)
    (block : TypedWord (P := P) (marginalProfile profile index)) :
    Fintype.card (TypedWord (P := P) (marginalProfile profile index)) *
      Nat.card {word : TypedWord (P := P) profile // typedProjection profile index word = block} =
      Fintype.card (TypedWord (P := P) profile) := by
  exact Selection.fiber_card_identity (G := Equiv.Perm P) (typedProjection profile index)
    (typedProjection_equivariant profile index) block

end
end MatrixBounds.Empirical
