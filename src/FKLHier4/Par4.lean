module

public import FKLHier4.Child
public import FKLHier4.Split4
public import SuppliedRootFineParent4IntegerValidity

/-! Level-four parent numerators (denominator `2^406`) by the exact sparse convolution of split weights
and child numerators. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL FKLFine3 Tensor Tensor.CW
open scoped BigOperators

/-- Parent numerator of parent `p`, axis `a`, orbit `o`. -/
noncomputable def fPar4 (p a o : ℕ) : ℕ :=
  Nat.mul (sz4 o) (sumN 45 (fun c => (fun w => cond (Nat.beq w 0) 0
    (Nat.mul (Nat.mul w (Nat.mul (fChild p c a (col41 o)) (wsc4 (col41 o))))
      (Nat.mul (fChild p (fComp4 p c) a (col42 o)) (wsc4 (col42 o))))) (fW4 p c)))

theorem fPar4_eq (p : Fin 105) (a : Fin 3) (o : Fin 231) :
    ((fPar4 p a o : ℕ) : ℤ) = SuppliedRootFineParent4Integers.numerator p a o := by
  rw [← RootFineCachedParent4.numerator_eq SuppliedRootFineParent3Integers.numerator (fun _ _ _ _ => rfl)]
  unfold RootFineCachedParent4.numerator SuppliedRootFineParent3Integers.sparseIntegerParent fPar4
  obtain ⟨h1, h2⟩ := cols4_eq o
  rw [raw_mul, sumN_eq, Nat.cast_mul, Nat.cast_sum, Finset.sum_range, sz4_eq o]
  congr 1
  apply Finset.sum_congr rfl
  intro c _
  rw [fW4_eq p c]
  by_cases hw : RootFineCachedParent4.weight p c = 0
  · simp [hw]
  · have hb : Nat.beq (RootFineCachedParent4.weight p c) 0 = false := beq_false hw
    simp only [hb, Bool.cond_false, hw, ite_false, raw_mul]
    have hc : fComp4 p c = (RootFineCachedParent4.complement p c).val := fComp4_eq p c
    have e1 := fChild_eq p c a (OrbitLevel4.encoding.columns o).1
    have e2 := fChild_eq p (RootFineCachedParent4.complement p c) a (OrbitLevel4.encoding.columns o).2
    rw [hc, h1, h2]
    push_cast
    rw [e1, e2, wsc4_eq, wsc4_eq]

theorem fPar4_le (p : Fin 105) (a : Fin 3) (o : Fin 231) : fPar4 p a o ≤ 2 ^ 406 := by
  have h := fPar4_eq p a o
  have hsum := SuppliedRootFineParent4Integers.numerator_normalized p a
  have hle : SuppliedRootFineParent4Integers.numerator p a o ≤ 2 ^ 406 := by
    rw [← hsum]
    exact Finset.single_le_sum (fun i _ => SuppliedRootFineParent4Integers.numerator_nonnegative p a i)
      (Finset.mem_univ o)
  rw [← h] at hle
  exact_mod_cast hle

end MatrixBounds.Numeric.FKLHier4
