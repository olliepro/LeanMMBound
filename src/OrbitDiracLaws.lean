module

public import FiniteOrbitData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Singleton word orbits represent exact point masses, including all-zero
fine-coordinate laws used by zero-coordinate matrix leaves. -/
namespace MatrixBounds.Entropy.OrbitMap

noncomputable section
variable {Word Orbit : Type*} [Fintype Word]

/-- A singleton actual orbit contains precisely its designated representative. -/
theorem label_eq_iff_of_size_one (partition : OrbitMap Word Orbit) (orbit : Orbit)
    (singleton : partition.size orbit = 1) (word : Word) :
    partition.label word = orbit ↔ word = partition.representative orbit := by
  classical
  haveI : Subsingleton (partition.Fiber orbit) := Fintype.card_le_one_iff_subsingleton.mp singleton.le
  constructor
  · intro inside
    exact congrArg Subtype.val (Subsingleton.elim (⟨word, inside⟩ : partition.Fiber orbit)
      ⟨partition.representative orbit, partition.representative_label orbit⟩)
  · intro equal
    rw [equal, partition.representative_label]

/-- Expanding unit mass on a singleton orbit gives the point mass on its actual representative word. -/
theorem decode_singleton [DecidableEq Word] [DecidableEq Orbit] (partition : OrbitMap Word Orbit) (orbit : Orbit)
    (singleton : partition.size orbit = 1) :
    partition.decode (fun label => if label = orbit then 1 else 0) =
      fun word => if word = partition.representative orbit then 1 else 0 := by
  funext word
  have same := partition.label_eq_iff_of_size_one orbit singleton word
  unfold decode
  dsimp only
  by_cases inside : partition.label word = orbit
  · rw [if_pos inside, inside, singleton, Nat.cast_one, div_one, if_pos (same.mp inside)]
  · rw [if_neg inside, zero_div, if_neg (fun equal => inside (same.mpr equal))]

end
end MatrixBounds.Entropy.OrbitMap
