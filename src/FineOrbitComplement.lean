import PairOrbitSymmetries
import OrbitSymmetryTransport
import FineWordOrbits

/-! Complementing all fine symbols acts by an exact recursively computable
permutation of the word-orbit labels. -/
namespace MatrixBounds.Entropy

open Tensor.CW
noncomputable section

/-- Complementing the complete one-letter word reverses its singleton orbit label. -/
theorem oneLetterOrbits_complement (word : Fin 1 → Fin 3) :
    oneLetterOrbits.label (fineComplement 1 word) = (oneLetterOrbits.label word).rev := rfl

/-- Child-orbit complement compatibility propagates to every complete parent word. -/
theorem PairEncoding.wordOrbits_complement {length children parents : ℕ}
    (encoding : PairEncoding children parents) (child : OrbitMap (Fin length → Fin 3) (Fin children))
    (transform : Fin children → Fin children)
    (childIdentity : ∀ word, child.label (fineComplement length word) = transform (child.label word))
    (word : Fin (length+length) → Fin 3) :
    (encoding.wordOrbits child).label (fineComplement (length+length) word) =
      encoding.mapLabels transform ((encoding.wordOrbits child).label word) := by
  change encoding.code (child.label (fineComplement length (leftHalf word)),
    child.label (fineComplement length (rightHalf word))) =
      encoding.mapLabels transform (encoding.code (child.label (leftHalf word), child.label (rightHalf word)))
  rw [childIdentity, childIdentity, encoding.mapLabels_code]

end
end MatrixBounds.Entropy
