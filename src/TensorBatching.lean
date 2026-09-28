import TensorProduct
import TensorSymmetry

/-! Bilinear algorithms acting on batches. Substitution into a rank decomposition
is expressed by concrete tensor restrictions of independent source copies. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
variable {K X Y Z U V W R : Type*} [CommSemiring K]

/-- Selecting arbitrary coordinates of each factor preserves a rank budget. -/
theorem rankLE_pullback {tensor : Coeff K X Y Z} {budget : ℕ}
    (algorithm : RankLE tensor budget) (ex : U → X) (ey : V → Y) (ez : W → Z) :
    RankLE (fun x y z => tensor (ex x) (ey y) (ez z)) budget := by
  obtain ⟨d⟩ := algorithm
  exact ⟨⟨fun r x => d.left r (ex x), fun r y => d.middle r (ey y),
    fun r z => d.right r (ez z), fun x y z => d.reconstruct (ex x) (ey y) (ez z)⟩⟩

/-- Relabeling the copy index leaves every rank budget unchanged. -/
theorem rankLE_relabel_copies {I J : Type*} [Fintype I] [Fintype J]
    [DecidableEq I] [DecidableEq J] (tensor : Coeff K X Y Z) (equiv : J ≃ I)
    {budget : ℕ} (algorithm : RankLE (directSum (fun _ : I => tensor)) budget) :
    RankLE (directSum (fun _ : J => tensor)) budget := by
  have result := rankLE_pullback algorithm
    (fun x : J × X => (equiv x.1, x.2))
    (fun y : J × Y => (equiv y.1, y.2))
    (fun z : J × Z => (equiv z.1, z.2))
  simpa only [directSum, Equiv.apply_eq_iff_eq] using result

/-- Repeating an algorithm for a batch gives an algorithm for any integral number of batches. -/
theorem rankLE_grouped_copies (tensor : Coeff K X Y Z) {copies budget : ℕ}
    (algorithm : RankLE (directSum (fun _ : Fin copies => tensor)) budget) (groups : ℕ) :
    RankLE (directSum (fun _ : Fin (groups * copies) => tensor)) (groups * budget) := by
  have repeated := rankLE_directSum
    (fun _ : Fin groups => directSum (fun _ : Fin copies => tensor)) budget (fun _ => algorithm)
  let equiv : Fin (groups * copies) ≃ Fin groups × Fin copies :=
    Fintype.equivOfCardEq (by simp)
  have result := rankLE_pullback repeated
    (fun x : Fin (groups * copies) × X => ((equiv x.1).1, (equiv x.1).2, x.2))
    (fun y : Fin (groups * copies) × Y => ((equiv y.1).1, (equiv y.1).2, y.2))
    (fun z : Fin (groups * copies) × Z => ((equiv z.1).1, (equiv z.1).2, z.2))
  convert result using 1
  · funext x y z
    simp only [directSum, ← ite_and]
    congr 1
    rw [← equiv.injective.eq_iff, ← equiv.injective.eq_iff, Prod.ext_iff, Prod.ext_iff]
    apply propext
    tauto
  · simp

/-- Substitute an arbitrary inner tensor into a decomposition of the outer tensor.
Each rank-one outer term uses one independent copy of the inner tensor. -/
theorem decomposition_substitution [Fintype R] [DecidableEq R]
    [Fintype U] [Fintype V] [Fintype W] [DecidableEq U] [DecidableEq V] [DecidableEq W]
    {outer : Coeff K X Y Z} (d : Decomposition outer R) (inner : Coeff K U V W) :
    restrict (fun (x : X × U) (source : R × U) => if x.2 = source.2 then d.left source.1 x.1 else 0)
      (fun (y : Y × V) (source : R × V) => if y.2 = source.2 then d.middle source.1 y.1 else 0)
      (fun (z : Z × W) (source : R × W) => if z.2 = source.2 then d.right source.1 z.1 else 0)
      (directSum (fun _ : R => inner)) = product outer inner := by
  rw [restrict_directSum (fun _ : R => inner)
    (fun r (x : X × U) u => if x.2 = u then d.left r x.1 else 0)
    (fun r (y : Y × V) v => if y.2 = v then d.middle r y.1 else 0)
    (fun r (z : Z × W) w => if z.2 = w then d.right r z.1 else 0)]
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, ite_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, if_true, product, d.reconstruct, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro r _
  ring

/-- A rank budget for the batch of inner tensors transfers to the substituted product. -/
theorem rankLE_substitution [Fintype U] [Fintype V] [Fintype W]
    [DecidableEq U] [DecidableEq V] [DecidableEq W]
    {outer : Coeff K X Y Z} {inner : Coeff K U V W} {terms budget : ℕ}
    (algorithm : RankLE outer terms)
    (batch : RankLE (directSum (fun _ : Fin terms => inner)) budget) :
    RankLE (product outer inner) budget := by
  obtain ⟨d⟩ := algorithm
  rw [← decomposition_substitution d inner]
  exact rankLE_restrict batch _ _ _

/-- Select an injected collection of independent copies by three explicit axis maps. -/
theorem select_copies {I J : Type*} [Fintype I] [DecidableEq I] [DecidableEq J]
    [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z) (embedding : J ↪ I) :
    restrict (fun (x : J × X) (source : I × X) => if source = (embedding x.1, x.2) then (1 : K) else 0)
      (fun (y : J × Y) (source : I × Y) => if source = (embedding y.1, y.2) then (1 : K) else 0)
      (fun (z : J × Z) (source : I × Z) => if source = (embedding z.1, z.2) then (1 : K) else 0)
      (directSum (fun _ : I => tensor)) = directSum (fun _ : J => tensor) := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true]
  simp only [directSum, EmbeddingLike.apply_eq_iff_eq]

/-- Removing independent copies cannot increase the required rank budget. -/
theorem rankLE_fewer_copies [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z) {small large budget : ℕ} (size : small ≤ large)
    (algorithm : RankLE (directSum (fun _ : Fin large => tensor)) budget) :
    RankLE (directSum (fun _ : Fin small => tensor)) budget := by
  let embedding : Fin small ↪ Fin large := ⟨Fin.castLE size, Fin.castLE_injective size⟩
  rw [← select_copies tensor embedding]
  exact rankLE_restrict algorithm _ _ _

/-- A budget for one batch covers any smaller collection than a fixed number of batches. -/
theorem rankLE_padded_batches [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z) {copies terms budget groups : ℕ}
    (algorithm : RankLE (directSum (fun _ : Fin copies => tensor)) budget)
    (size : terms ≤ groups * copies) :
    RankLE (directSum (fun _ : Fin terms => tensor)) (groups * budget) :=
  rankLE_fewer_copies tensor size (rankLE_grouped_copies tensor algorithm groups)

/-- Any one member of a nonempty batch inherits the batch's rank budget. -/
theorem rankLE_one_copy {I : Type*} [Fintype I] [DecidableEq I]
    (tensor : Coeff K X Y Z) (copy : I) {budget : ℕ}
    (algorithm : RankLE (directSum (fun _ : I => tensor)) budget) : RankLE tensor budget := by
  simpa only [directSum, and_self, if_true] using
    rankLE_pullback algorithm (fun x => (copy, x)) (fun y => (copy, y)) (fun z => (copy, z))

end
end MatrixBounds.Tensor
