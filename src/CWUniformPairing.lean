import CWPairing

/-! Regrouping into the fixed parent tensor used by every prescribed edge.
The dependent child-pool shapes are checked against one common parent shape. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K T P : Type*} {Positions : T → Type*} [CommRing K]
variable [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)]

/-- A fixed parent interface before empirical restrictions, with one identical constituent per position. -/
def parentPower (q length : ℕ) (parent : Numeric.Shape) :=
  Interface.heterogeneous (fun _ : P => constituent (K := K) q (length+length) parent)

/-- The fixed parent power has the product of its explicit CW polynomial certificates. -/
def parentPowerCertificate (q length : ℕ) (parent : Numeric.Shape) :
    Degeneration.Certificate (parentPower (K := K) (P := P) q length parent)
      ((q+2)^((length+length)*Fintype.card P)) (3*(length+length)*Fintype.card P) := by
  have certificate := Degeneration.heterogeneousCertificate
    (fun _ : P => constituent (K := K) q (length+length) parent)
    (fun _ => (q+2)^(length+length)) (fun _ => 3*(length+length))
    (fun _ => constituentCertificate q (length+length) parent)
  simpa only [parentPower, Finset.prod_const, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, ← pow_mul, Nat.mul_comm (Fintype.card P)] using certificate
/-- Concatenate typed child coordinates into the common parent axis, using the checked total identity. -/
def Pairing.uniformAxis (pairing : Pairing Positions P) (q length parentTotal : ℕ) (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (profile : T → (Fin length → Fin 3) → ℕ)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q length (total t) => fineWord x.val) (profile t)) (parent : P) :
    AxisVariable q (length+length) parentTotal :=
  ⟨concatenate ((entries (pairing.left parent).1).val (pairing.left parent).2).val
    ((entries (pairing.right parent).1).val (pairing.right parent).2).val, by
      rw [wordCoarse_concatenate,
        ((entries (pairing.left parent).1).val (pairing.left parent).2).property,
        ((entries (pairing.right parent).1).val (pairing.right parent).2).property, totals parent]⟩

/-- A labelled pairing with the correct child shapes pulls one fixed parent tensor back to the child target. -/
theorem uniform_pairing_identity (pairing : Pairing Positions P) (q length : ℕ) (parent : Numeric.Shape)
    (shape : T → Numeric.Shape)
    (shapes : ∀ position, addShape (shape (pairing.left position).1) (shape (pairing.right position).1) = parent)
    (profileX profileY profileZ : T → (Fin length → Fin 3) → ℕ) :
    (fun x y z => parentPower (K := K) (P := P) q length parent
      (pairing.uniformAxis q length parent.x (fun t => (shape t).x)
        (fun position => congrArg Numeric.Shape.x (shapes position)) profileX x)
      (pairing.uniformAxis q length parent.y (fun t => (shape t).y)
        (fun position => congrArg Numeric.Shape.y (shapes position)) profileY y)
      (pairing.uniformAxis q length parent.z (fun t => (shape t).z)
        (fun position => congrArg Numeric.Shape.z (shapes position)) profileZ z)) =
      exactChildren (K := K) (Positions := Positions) q (fun _ => length) shape profileX profileY profileZ := by
  funext x y z
  exact pairing_product_identity pairing q (fun _ => length) shape
    (fun t => (x t).val) (fun t => (y t).val) (fun t => (z t).val)

/-- The fixed parent tensor's certificate supplies the exact child target through explicit coordinate maps. -/
def uniformPairingCertificate (pairing : Pairing Positions P) (q length : ℕ) (parent : Numeric.Shape)
    (shape : T → Numeric.Shape)
    (shapes : ∀ position, addShape (shape (pairing.left position).1) (shape (pairing.right position).1) = parent)
    (profileX profileY profileZ : T → (Fin length → Fin 3) → ℕ)
    {rank degree : ℕ} (certificate : Degeneration.Certificate (parentPower (K := K) (P := P) q length parent) rank degree) :
    Degeneration.Certificate
      (exactChildren (K := K) (Positions := Positions) q (fun _ => length) shape profileX profileY profileZ) rank degree := by
  rw [← uniform_pairing_identity pairing q length parent shape shapes profileX profileY profileZ]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.CW
