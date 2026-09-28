import EntropyBounds

/-! Reindexing and deleting zero-mass symbols preserve actual entropy values. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A B : Type*} [Fintype A] [Fintype B]

/-- A bijection of finite probability coordinates preserves entropy without normalization assumptions. -/
theorem entropy_relabel (labels : A ≃ B) (probability : A → ℝ) :
    entropy (probability ∘ labels.symm) = entropy probability := by
  unfold entropy
  rw [← labels.sum_comp]
  simp only [Function.comp_apply, Equiv.symm_apply_apply]

omit [Fintype B] in
/-- Restricting a finite law to a set containing its support leaves entropy unchanged. -/
theorem entropy_supported (supported : A → Prop) [DecidablePred supported]
    (probability : A → ℝ) (outside : ∀ a, ¬supported a → probability a = 0) :
    entropy probability = entropy (fun a : {a // supported a} => probability a.val) := by
  unfold entropy
  congr 1
  exact Finset.sum_congr_set {a | supported a} _ _ (fun _ _ => rfl)
    (fun a absent => by simp only [outside a absent, zero_mul])

end
end MatrixBounds.Entropy
