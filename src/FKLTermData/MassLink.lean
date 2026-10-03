module

public import FKLTermData.MassCheck00
public import FKLTermData.MassCheck01

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Mass

open FKL

theorem all (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    ptGet tree 7 W (FKLTerm.flatT n t s) = FKLTerm.fMass n t s := by
  rcases (show (0 ≤ n.val ∧ n.val < 189) ∨ (189 ≤ n.val ∧ n.val < 378) ∨ (378 ≤ n.val ∧ n.val < 567) ∨ (567 ≤ n.val ∧ n.val < 756) ∨ (756 ≤ n.val ∧ n.val < 945) by omega) with h | h | h | h | h
  · have e := FKL.allRange_sound _ 8 0 189 chk0 (n.val - 0) (by omega)
    rw [show 0 + (n.val - 0) = n.val by omega] at e
    unfold nodeOK at e
    exact Nat.eq_of_beq_eq_true (FKLTerm.allLt_sound _ 6 (FKLTerm.allLt_sound _ 3 e t t.isLt) s s.isLt)
  · have e := FKL.allRange_sound _ 8 189 189 chk1 (n.val - 189) (by omega)
    rw [show 189 + (n.val - 189) = n.val by omega] at e
    unfold nodeOK at e
    exact Nat.eq_of_beq_eq_true (FKLTerm.allLt_sound _ 6 (FKLTerm.allLt_sound _ 3 e t t.isLt) s s.isLt)
  · have e := FKL.allRange_sound _ 8 378 189 chk2 (n.val - 378) (by omega)
    rw [show 378 + (n.val - 378) = n.val by omega] at e
    unfold nodeOK at e
    exact Nat.eq_of_beq_eq_true (FKLTerm.allLt_sound _ 6 (FKLTerm.allLt_sound _ 3 e t t.isLt) s s.isLt)
  · have e := FKL.allRange_sound _ 8 567 189 chk3 (n.val - 567) (by omega)
    rw [show 567 + (n.val - 567) = n.val by omega] at e
    unfold nodeOK at e
    exact Nat.eq_of_beq_eq_true (FKLTerm.allLt_sound _ 6 (FKLTerm.allLt_sound _ 3 e t t.isLt) s s.isLt)
  · have e := FKL.allRange_sound _ 8 756 189 chk4 (n.val - 756) (by omega)
    rw [show 756 + (n.val - 756) = n.val by omega] at e
    unfold nodeOK at e
    exact Nat.eq_of_beq_eq_true (FKLTerm.allLt_sound _ 6 (FKLTerm.allLt_sound _ 3 e t t.isLt) s s.isLt)

/-- Fast terminal source mass numerator read from the packed table. -/
noncomputable def fMassT (n t s : Nat) : Nat := ptGet tree 7 W (FKLTerm.flatT n t s)

theorem fMassT_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) : fMassT n t s = FKLTerm.fMass n t s := all n t s

end MatrixBounds.Numeric.FKLTermData.Mass
