module

public import FiniteOrbitData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Equivariant word permutations preserve exact orbit sizes and transport
decoded probability laws by the corresponding orbit permutation. -/
namespace MatrixBounds.Entropy.OrbitMap

noncomputable section
variable {Word Orbit : Type*} [Fintype Word]

/-- A word permutation compatible with orbit labels gives an actual bijection of the corresponding fibers. -/
def symmetryFiberEquiv (partition : OrbitMap Word Orbit) (words : Equiv.Perm Word) (labels : Equiv.Perm Orbit)
    (equivariant : ∀ word, partition.label (words word) = labels (partition.label word)) (orbit : Orbit) :
    partition.Fiber orbit ≃ partition.Fiber (labels orbit) where
  toFun entry := ⟨words entry.val, by rw [equivariant, entry.property]⟩
  invFun entry := ⟨words.symm entry.val, by
    apply labels.injective
    rw [← equivariant, words.apply_symm_apply, entry.property]⟩
  left_inv entry := by apply Subtype.ext; exact words.symm_apply_apply entry.val
  right_inv entry := by apply Subtype.ext; exact words.apply_symm_apply entry.val

/-- Equivariant orbit labels have exactly equal full-word fiber cardinalities. -/
theorem symmetry_size (partition : OrbitMap Word Orbit) (words : Equiv.Perm Word) (labels : Equiv.Perm Orbit)
    (equivariant : ∀ word, partition.label (words word) = labels (partition.label word)) (orbit : Orbit) :
    partition.size (labels orbit) = partition.size orbit := by
  classical
  exact (Fintype.card_congr (partition.symmetryFiberEquiv words labels equivariant orbit)).symm

/-- Transforming complete words is exactly transformation of compressed orbit masses. -/
theorem decode_symmetry (partition : OrbitMap Word Orbit) (words : Equiv.Perm Word) (labels : Equiv.Perm Orbit)
    (equivariant : ∀ word, partition.label (words word) = labels (partition.label word)) (mass : Orbit → ℝ) :
    (fun word => partition.decode mass (words word)) = partition.decode (fun orbit => mass (labels orbit)) := by
  funext word
  simp only [decode, equivariant, partition.symmetry_size words labels equivariant]

end
end MatrixBounds.Entropy.OrbitMap
