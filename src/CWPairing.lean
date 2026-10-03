module

public import CWRegroup
public import HeterogeneousProducts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Regroup all child factors into actual CW parents. A bijection of labelled
positions records every slot, including slots from different recursion levels. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K T P : Type*} {Positions : T → Type*} [CommRing K]
variable [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)]

/-- A labelled pairing assigns each child slot to exactly one left or right parent slot. -/
abbrev Pairing (Positions : T → Type*) (P : Type*) := ((t : T) × Positions t) ≃ P ⊕ P

/-- The type and position of the left child assigned to a parent. -/
def Pairing.left (pairing : Pairing Positions P) (parent : P) : (t : T) × Positions t :=
  pairing.symm (Sum.inl parent)

/-- The type and position of the right child assigned to a parent. -/
def Pairing.right (pairing : Pairing Positions P) (parent : P) : (t : T) × Positions t :=
  pairing.symm (Sum.inr parent)

/-- The actual parent axis map concatenates its two uniquely assigned child coordinates. -/
def Pairing.axis (pairing : Pairing Positions P) (q : ℕ) (length total : T → ℕ)
    (entries : ∀ t, Positions t → AxisVariable q (length t) (total t)) (parent : P) :
    AxisVariable q (length (pairing.left parent).1 + length (pairing.right parent).1)
      (total (pairing.left parent).1 + total (pairing.right parent).1) :=
  concatenateAxis (entries (pairing.left parent).1 (pairing.left parent).2)
    (entries (pairing.right parent).1 (pairing.right parent).2)

/-- The product of paired parent coefficients is the product over all original child slots. -/
theorem pairing_product_identity (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ)
    (shape : T → Numeric.Shape)
    (x : ∀ t, Positions t → AxisVariable q (length t) (shape t).x)
    (y : ∀ t, Positions t → AxisVariable q (length t) (shape t).y)
    (z : ∀ t, Positions t → AxisVariable q (length t) (shape t).z) :
    (∏ parent, constituent (K := K) q
      (length (pairing.left parent).1 + length (pairing.right parent).1)
      (addShape (shape (pairing.left parent).1) (shape (pairing.right parent).1))
      (pairing.axis q length (fun t => (shape t).x) x parent)
      (pairing.axis q length (fun t => (shape t).y) y parent)
      (pairing.axis q length (fun t => (shape t).z) z parent)) =
      ∏ t, ∏ position, constituent (K := K) q (length t) (shape t)
        (x t position) (y t position) (z t position) := by
  simp only [Pairing.axis, constituent, concatenateAxis, wordPower_concatenate, Finset.prod_mul_distrib]
  have reindexed := Equiv.prod_comp pairing.symm
    (fun slot : (t : T) × Positions t => wordPower (tensor (K := K) q) (length slot.1)
      (x slot.1 slot.2).val (y slot.1 slot.2).val (z slot.1 slot.2).val)
  simpa only [Fintype.prod_sum_type, Fintype.prod_sigma, Pairing.left, Pairing.right] using reindexed

/-- A paired parent product is an actual heterogeneous family of coarse CW constituents. -/
def pairedParents (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ) (shape : T → Numeric.Shape) :=
  Interface.heterogeneous (fun parent => constituent (K := K) q
    (length (pairing.left parent).1 + length (pairing.right parent).1)
    (addShape (shape (pairing.left parent).1) (shape (pairing.right parent).1)))

/-- Keep exact complete fine types separately in every labelled child pool. -/
def exactChildren (q : ℕ) (length : T → ℕ) (shape : T → Numeric.Shape)
    (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ) :=
  Interface.heterogeneous (fun t => Interface.exact (P := Positions t)
    (constituent (K := K) q (length t) (shape t))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (profileX t) (profileY t) (profileZ t))

/-- Exact typed child variables regroup to parent variables without merging their pool labels. -/
def Pairing.typedAxis (pairing : Pairing Positions P) (q : ℕ) (length total : T → ℕ)
    (profile : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q (length t) (total t) => fineWord x.val) (profile t)) :=
  pairing.axis q length total (fun t => (entries t).val)

/-- Pulling the parent tensor back along typed regrouping maps gives precisely the exact child target. -/
theorem paired_exact_identity (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ)
    (shape : T → Numeric.Shape) (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ) :
    (fun x y z => pairedParents (K := K) pairing q length shape
      (pairing.typedAxis q length (fun t => (shape t).x) profileX x)
      (pairing.typedAxis q length (fun t => (shape t).y) profileY y)
      (pairing.typedAxis q length (fun t => (shape t).z) profileZ z)) =
      exactChildren (K := K) (Positions := Positions) q length shape profileX profileY profileZ := by
  funext x y z
  exact pairing_product_identity pairing q length shape (fun t => (x t).val)
    (fun t => (y t).val) (fun t => (z t).val)

/-- Any certificate for the paired parent product gives one for this specified exact child tensor. -/
def pairedExactCertificate (pairing : Pairing Positions P) (q : ℕ) (length : T → ℕ)
    (shape : T → Numeric.Shape) (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    {rank degree : ℕ} (certificate : Degeneration.Certificate (pairedParents (K := K) pairing q length shape) rank degree) :
    Degeneration.Certificate (exactChildren (K := K) (Positions := Positions)
      q length shape profileX profileY profileZ) rank degree := by
  rw [← paired_exact_identity pairing q length shape profileX profileY profileZ]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.CW
