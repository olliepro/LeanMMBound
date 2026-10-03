module

public import FKLRoot.Expr
public import FKLCert.Term
public import FKL.Search

/-! Raw decoding of a whole certificate term list: one kernel pass checks exactness of every record and
the decoded raw list has the value of the certificate expression. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLRoot

open FKL FKLCert

/-- Every record decodes exactly at scales `S`, `T`. -/
noncomputable def allExact (S T : ℕ) (l : List IntegerLogTerm) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun e _ r => Bool.and (FKLCert.exact S T e) r) l

/-- The decoded raw terms. -/
noncomputable def certRaw (S T : ℕ) (l : List IntegerLogTerm) : List Raw :=
  List.rec (motive := fun _ => List Raw) [] (fun e _ r => rawOf S T e :: r) l

theorem certRaw_value (S T : ℕ) (l : List IntegerLogTerm) (h : allExact S T l = true) :
    rawValue S T (certRaw S T l) = rationalLogValue (l.map IntegerLogTerm.monomial) := by
  induction l with
  | nil => simp [certRaw, rawValue, rationalLogValue]
  | cons e l ih =>
    have h' : FKLCert.exact S T e = true ∧ allExact S T l = true := by
      simpa [allExact] using h
    show rawValue S T (rawOf S T e :: certRaw S T l) = _
    rw [rawValue_cons, ih h'.2, rawOf_value S T e h'.1]
    simp [rationalLogValue]

end MatrixBounds.Numeric.FKLRoot
