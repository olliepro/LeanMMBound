import CWPairing
import AcceptedRestrictions

/-! Parent-interface restrictions become holes in complete fine blocks of the
regrouped child tensor. This identity is at the level of actual CW coefficients. -/
namespace MatrixBounds.Tensor.CW

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K T P : Type*} {Positions : T → Type*} [CommRing K]
variable [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)]

/-- Fine labels commute with the coordinate concatenation used to form a parent. -/
theorem fineWord_concatenate {q leftLength rightLength : ℕ}
    (left : Fin leftLength → Fin (q+2)) (right : Fin rightLength → Fin (q+2)) :
    fineWord (concatenate left right) = concatenate (fineWord left) (fineWord right) := by
  funext position
  refine Fin.addCases (fun i => ?_) (fun i => ?_) position <;>
    simp only [fineWord, concatenate, Fin.addCases_left, Fin.addCases_right]

/-- Regroup fine-block words using precisely the same labelled slots as the coordinate map. -/
def Pairing.fineAxis (pairing : Pairing Positions P) (length : T → ℕ)
    (words : ∀ t, Positions t → Fin (length t) → Fin 3) (parent : P) :
    Fin (length (pairing.left parent).1 + length (pairing.right parent).1) → Fin 3 :=
  concatenate (words (pairing.left parent).1 (pairing.left parent).2)
    (words (pairing.right parent).1 (pairing.right parent).2)

omit [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)] in
/-- Parent fine labels depend only on child fine labels, not on coordinates inside the blocks. -/
theorem paired_fine_identity (pairing : Pairing Positions P) (q : ℕ) (length total : T → ℕ)
    (entries : ∀ t, Positions t → AxisVariable q (length t) (total t)) :
    (fun parent => fineWord (pairing.axis q length total entries parent).val) =
      pairing.fineAxis length (fun t position => fineWord (entries t position).val) := by
  funext parent
  exact fineWord_concatenate _ _

/-- Pull an acceptance predicate on parent fine words back to the exact child part labels. -/
def Pairing.accepts (pairing : Pairing Positions P) (length : T → ℕ)
    (profile : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (accepted : (∀ parent, Fin (length (pairing.left parent).1 + length (pairing.right parent).1) → Fin 3) → Prop)
    (parts : ∀ t, Empirical.TypedWord (P := Positions t) (profile t)) : Prop :=
  accepted (pairing.fineAxis length (fun t => (parts t).val))

/-- Apply any parent fine-type restrictions before regrouping into child factors. -/
def acceptedParents (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ) (shape : T → Numeric.Shape)
    (acceptedX acceptedY acceptedZ :
      (∀ parent, Fin (length (pairing.left parent).1 + length (pairing.right parent).1) → Fin 3) → Prop) :=
  Empirical.acceptedTensor (pairedParents (K := K) pairing q length shape)
    (fun x parent => fineWord (x parent).val) (fun y parent => fineWord (y parent).val)
    (fun z parent => fineWord (z parent).val) acceptedX acceptedY acceptedZ

/-- Parent restrictions on regrouped coordinates delete entire exact child fine blocks. -/
theorem paired_accepted_identity (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ)
    (shape : T → Numeric.Shape) (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (acceptedX acceptedY acceptedZ :
      (∀ parent, Fin (length (pairing.left parent).1 + length (pairing.right parent).1) → Fin 3) → Prop) :
    (fun x y z => acceptedParents (K := K) pairing q length shape acceptedX acceptedY acceptedZ
      (pairing.typedAxis q length (fun t => (shape t).x) profileX x)
      (pairing.typedAxis q length (fun t => (shape t).y) profileY y)
      (pairing.typedAxis q length (fun t => (shape t).z) profileZ z)) =
      Empirical.acceptedTensor (exactChildren (K := K) (Positions := Positions) q length shape profileX profileY profileZ)
        (fun x t => Interface.partWord _ (profileX t) (x t))
        (fun y t => Interface.partWord _ (profileY t) (y t))
        (fun z t => Interface.partWord _ (profileZ t) (z t))
        (pairing.accepts length profileX acceptedX) (pairing.accepts length profileY acceptedY)
        (pairing.accepts length profileZ acceptedZ) := by
  funext x y z
  simp only [acceptedParents, Empirical.acceptedTensor, Pairing.typedAxis, paired_fine_identity,
    Pairing.accepts, Interface.partWord]
  congr 1
  exact pairing_product_identity pairing q length shape _ _ _

/-- The exact child tensor with parent holes inherits the actual parent-interface certificate. -/
def pairedAcceptedCertificate (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ)
    (shape : T → Numeric.Shape) (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (acceptedX acceptedY acceptedZ :
      (∀ parent, Fin (length (pairing.left parent).1 + length (pairing.right parent).1) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (acceptedParents (K := K) pairing q length shape acceptedX acceptedY acceptedZ) rank degree) :
    Degeneration.Certificate
      (Empirical.acceptedTensor (exactChildren (K := K) (Positions := Positions) q length shape profileX profileY profileZ)
        (fun x t => Interface.partWord _ (profileX t) (x t))
        (fun y t => Interface.partWord _ (profileY t) (y t))
        (fun z t => Interface.partWord _ (profileZ t) (z t))
        (pairing.accepts length profileX acceptedX) (pairing.accepts length profileY acceptedY)
        (pairing.accepts length profileZ acceptedZ)) rank degree := by
  rw [← paired_accepted_identity pairing q length shape profileX profileY profileZ acceptedX acceptedY acceptedZ]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.CW
