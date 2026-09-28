import ContextCopies
import UniformRetainedBatch

/-! Remove variation in chosen primes and copy indices before gluing types,
while preserving every companion tensor. -/
namespace MatrixBounds.Tensor

universe v
open Selection
noncomputable section
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- A uniform modulus cap supplies the same integer batch in every tensor context. -/
theorem contextReduction_uniform_retained_batch (source : Coeff K X Y Z) (target : Coeff K U V W)
    {cost retention cap : ℝ} {overhead : ℕ} (costPositive : 0 < cost)
    (available : ∃ prime copies : ℕ, 0 < prime ∧ (prime : ℝ) ≤ cap ∧
      Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      ContextReduction.{v} source (directSum (fun _ : Fin copies => target)) overhead) :
    ContextReduction.{v} source
      (directSum (fun _ : Fin (retainedCopies cost retention cap) => target)) overhead := by
  obtain ⟨prime, copies, primePositive, primeBound, retained, reduction⟩ := available
  have uniform := retained_count_uniform primePositive costPositive primeBound retained
  have smaller : retainedCopies cost retention cap ≤ copies := Nat.ceil_le.mpr uniform
  let embedding : Fin (retainedCopies cost retention cap) ↪ Fin copies :=
    ⟨Fin.castLE smaller, Fin.castLE_injective smaller⟩
  simpa only [one_mul] using reduction.trans (contextReduction_selectCopies target embedding)

end
end MatrixBounds.Tensor
