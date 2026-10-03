module

public import FKLCoarse.Roles
public import FKLCoarse.Weight
public import FKLCoarse.Corr
public import FKLBridge.Gibbs
public import FKLBridge.Idx.GibbsU3
public import FKLBridge.Idx.SplitAlpha3
public import FKLCert.WindowValue
public import PairedCoarse3CertificateTable

/-! Level-three paired coarse: fast source data, the block builder, and the boundary from one accepted
kernel check per block. Scales: arguments `2^322`, coefficients `2^220` (role weights `2^176`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL FKLCert Tensor Tensor.CW SuppliedPairedCoarse TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators

/-- Packed split-row index of node `n`, strategy `s`. -/
noncomputable def sa3 (n s : ℕ) : ℕ := ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 (Nat.add (Nat.mul n 6) s)

/-- Split mass numerator of column `c` (denominator `2^44`). -/
noncomputable def a3 (n s c : ℕ) : ℕ := FKLBridge.Split.cell (sa3 n s) c

/-- Admissibility of column `c` under the split parent. -/
noncomputable def fit3 (n s c : ℕ) : Bool :=
  fitOf sh3 (FKLBridge.Split.parentX (sa3 n s)) (FKLBridge.Split.parentY (sa3 n s)) (FKLBridge.Split.parentZ (sa3 n s)) c

/-- Gibbs row index of node `n`, strategy `s`, physical axis `b`. -/
noncomputable def g3 (n s b : ℕ) : ℕ :=
  ptGet FKLBridge.Idx.GibbsU3.tree 7 14 (Nat.add (Nat.mul (Nat.add (Nat.mul n 6) s) 3) b)

/-- Gibbs potential numerator. -/
noncomputable def un3 (n s b v : ℕ) : ℕ := FKLBridge.Gibbs.numerator (g3 n s b) v

/-- Gibbs potential denominator exponent. -/
noncomputable def up3 (n s b v : ℕ) : ℕ := FKLBridge.Gibbs.power (g3 n s b) v

/-- All raw terms of the six roles of source `(n, s)`. -/
noncomputable def src3 (n s : ℕ) (tail : List Raw) : List Raw :=
  srcB 322 0 15 5 (a3 n s) sh3 (fit3 n s) (un3 n s) (up3 n s) (fCr n s) ax0 tail

/-- Key exactness of source `(n, s)`. -/
noncomputable def ok3 (n s : ℕ) : Bool := okSrc 322 15 5 sh3 (fit3 n s) (up3 n s)

/-- The 42 sources of block `b`. -/
noncomputable def block3Raw (b : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => loopL 6 (fun s t => src3 (Nat.add (Nat.mul 7 b) j) s t) t) tail

/-- Key exactness of every source of block `b`. -/
noncomputable def okBlock3 (b : ℕ) : Bool := allN 7 (fun j => allN 6 (fun s => ok3 (Nat.add (Nat.mul 7 b) j) s))

theorem sa3_eq (n : Fin 945) (s : Fin 6) :
    sa3 n s = (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s)).val := by
  rw [FKLBridge.Idx.SplitAlpha3.get_eq, SuppliedParameters.flat2_val]; rfl

/-- Every level-three split row has the fifteen original columns. -/
theorem widthsOK : allRange (fun i => Nat.beq (FKLBridge.Split.width (ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 i)) 15)
    13 0 5670 = true := by decide +kernel

theorem width15 (n : Fin 945) (s : Fin 6) :
    (SuppliedParameters.alpha3 n s).val.row.width = 15 := by
  have hi := allRange_sound _ 13 0 5670 widthsOK (SuppliedParameters.flat2 n s).val (SuppliedParameters.flat2 n s).isLt
  simp only [Nat.zero_add, Nat.beq_eq] at hi
  rw [← FKLBridge.Idx.SplitAlpha3.get_eq, FKLBridge.Split.width_eq] at hi
  exact hi

theorem col3_eq (n : Fin 945) (s : Fin 6) (c : Fin 15) :
    ((columnMass3 (n, s) c : ℚ) : ℝ) = (a3 n s c : ℝ) / 2 ^ 44 := by
  unfold columnMass3 a3
  rw [sa3_eq, FKLBridge.Split.cell_eq _ c (by
    change c.val < (SuppliedParameters.alpha3 n s).val.row.width; rw [width15]; exact c.isLt)]
  rw [Rat.cast_div, Rat.cast_natCast]
  norm_num
  rfl

theorem fit3_eq (n : Fin 945) (s : Fin 6) (c : Fin 15) :
    fit3 n s c = decide ((shapeColumnEquiv 4 c).val.Fits (SuppliedTypedParameters.level3Split n s).parent) := by
  have px := FKLBridge.Split.parentX_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  have py := FKLBridge.Split.parentY_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  have pz := FKLBridge.Split.parentZ_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  rw [← sa3_eq] at px py pz
  set P := (SuppliedTypedParameters.level3Split n s).parent with hPdef
  have hPx : FKLBridge.Split.parentX (sa3 n s) = P.x := px
  have hPy : FKLBridge.Split.parentY (sa3 n s) = P.y := py
  have hPz : FKLBridge.Split.parentZ (sa3 n s) = P.z := pz
  unfold fit3
  rw [hPx, hPy, hPz]
  exact fitOf_eq _ P sh3 c (sh3_eq c)

theorem pot3_eq (n : Fin 945) (s : Fin 6) (b : Fin 3) (v : Fin 5) :
    (((SuppliedTypedParameters.potential3 n s b).rational v : ℚ) : ℝ) = (un3 n s b v : ℝ) / 2 ^ (up3 n s b v) := by
  have hg : g3 n s b = (ParameterIndexData.GibbsU3.table.get
      (SuppliedParameters.flat2 (SuppliedParameters.flat2 n s) b)).val := by
    unfold g3
    rw [FKLBridge.Idx.GibbsU3.get_eq, SuppliedParameters.flat2_val, SuppliedParameters.flat2_val]; rfl
  have hw := (SuppliedTypedParameters.potential3 n s b).width_eq
  have hlen : v.val < (IndexedCertificateRows.gibbs (ParameterIndexData.GibbsU3.table.get
      (SuppliedParameters.flat2 (SuppliedParameters.flat2 n s) b))).val.entries.length := by
    change v.val < (SuppliedTypedParameters.potential3 n s b).row.entries.length
    rw [hw]; exact v.isLt
  unfold un3 up3
  rw [hg, FKLBridge.Gibbs.numerator_eq _ _ hlen, FKLBridge.Gibbs.power_eq _ _ hlen]
  unfold TypedGibbsRow.rational BinaryRational.rational
  push_cast
  rfl

theorem src3_value (n : Fin 945) (s : Fin 6) (hok : ok3 n s = true) (tail : List Raw) :
    rawValue 322 (176 + 44 + 0) (src3 n s tail) =
      (∑ role : Fin 6, rationalLogValue (supportedScale (mass3 (n, s) role) (directExpression3 (n, s) role))) +
        rawValue 322 (176 + 44 + 0) tail :=
  roles_value (length := 2) (n := 15) (SuppliedTypedParameters.level3Split n s).parent (shapeColumnEquiv 4)
    (columnMass3 (n, s)) (fun b => (SuppliedTypedParameters.potential3 n s b).rational) (mass3 (n, s)) 322 176 0
    (by norm_num) (a3 n s) sh3 (fit3 n s) (un3 n s) (up3 n s) (fCr n s) (col3_eq n s) sh3_eq (fit3_eq n s)
    (pot3_eq n s) (fCr_eq n s) hok tail

theorem block3Raw_value (b : Fin 135) (hok : okBlock3 b = true) (tail : List Raw) :
    rawValue 322 220 (block3Raw b tail) = rationalLogValue (block3 b) + rawValue 322 220 tail := by
  unfold block3Raw
  rw [rawValue_loopL 322 220 7 _ (fun j => if h : j < 7 then
      rationalLogValue (node3 (finProdFinEquiv (b, ⟨j, h⟩))) else 0)]
  · rw [block3, finiteLogSum_value, Finset.sum_range]; simp only [Fin.is_lt, dite_true, Fin.eta]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 7 b.val) j < 945 := by
      have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, ⟨j, hj⟩) = (⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 945) := by
      ext; simp [finProdFinEquiv, raw_add, raw_mul]; ring
    rw [e]
    rw [rawValue_loopL 322 220 6 _ (fun s => if h : s < 6 then
        ∑ role : Fin 6, rationalLogValue (supportedScale (mass3 ((⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 945), ⟨s, h⟩) role)
          (directExpression3 ((⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 945), ⟨s, h⟩) role)) else 0)]
    · rw [node3, finiteLogSum_value, Finset.sum_range]
      simp only [finiteLogSum_value, Fin.is_lt, dite_true, Fin.eta]
    · intro s hs t'
      rw [dif_pos hs]
      have hk := allN_sound _ 6 (allN_sound _ 7 hok j hj) s hs
      exact src3_value ⟨_, hlt⟩ ⟨s, hs⟩ hk t'

/-- An accepted fast block check gives the block boundary identity. -/
theorem boundary3_of_check (tree : Tree) (KW MW : ℕ)
    (hreads : RawReads 322 220 KW MW tree PairedCoarse3CertificateTable.table 0)
    (b : Fin 135) (a c : ℕ) (hc : c ≤ 69497) (L K kw nk P M1 : ℕ) (corr : List Raw)
    (h : Bool.and (okBlock3 b) (check2H L K kw nk P M1 (block3Raw b []) (windowRaw tree KW MW a (c - a) corr)) = true) :
    rationalLogValue (block3 b) =
      rationalLogValue (certificateWindow PairedCoarse3CertificateTable.table a c) + rawValue 322 220 corr := by
  rw [Bool.and_eq_true] at h
  have e := check2H_sound 322 220 L K kw nk P M1 _ _ h.2
  rw [block3Raw_value b h.1 [], windowRaw_value 322 220 KW MW tree _ hreads a c hc corr, rawValue_nil, add_zero] at e
  exact e

end MatrixBounds.Numeric.FKLCoarse
