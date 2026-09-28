import FiniteOrbitProducts

/-! Orbit decoding is compatible with exact changes of the complete word
coordinates, such as the concatenation of two child words. -/
namespace MatrixBounds.Entropy.OrbitMap

noncomputable section
variable {A B C : Type*} [Fintype A] [Fintype C]

/-- The same compressed mass expands compatibly through every bijective word-coordinate change. -/
theorem decode_reindex (partition : OrbitMap A B) (words : C ≃ A) (mass : B → ℝ) :
    (partition.reindex words).decode mass = partition.decode mass ∘ words := by
  funext word
  change mass (partition.label (words word)) /
    (partition.reindex words).size (partition.label (words word)) = _
  rw [reindex_size]
  rfl

end
end MatrixBounds.Entropy.OrbitMap
