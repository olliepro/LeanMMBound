module

public import FKLCoarse.Roles
public import FKLCoarse.Weight
public import FKLCoarse.Corr
public import FKLBridge.Gibbs
public import FKLBridge.Idx.GibbsU4
public import FKLBridge.Idx.SplitAlpha4
public import FKLCert.WindowValue
public import PairedCoarse4CertificateTable

/-! Level-four paired coarse: fast source data, the block builder, and the boundary from one accepted
kernel check per block. Scales: arguments `2^197`, coefficients `2^132` (role weights `2^88`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL FKLCert Tensor Tensor.CW SuppliedPairedCoarse TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators

/-- Packed split-row index of level-four source `p`. -/
noncomputable def sa4 (p : ℕ) : ℕ := ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 p

/-- Split mass numerator of column `c` (denominator `2^44`). -/
noncomputable def a4 (p c : ℕ) : ℕ := FKLBridge.Split.cell (sa4 p) c

/-- Admissibility of column `c` under the split parent. -/
noncomputable def fit4 (p c : ℕ) : Bool :=
  fitOf sh8 (FKLBridge.Split.parentX (sa4 p)) (FKLBridge.Split.parentY (sa4 p)) (FKLBridge.Split.parentZ (sa4 p)) c

/-- Gibbs row index of source `p`, physical axis `b`. -/
noncomputable def g4 (p b : ℕ) : ℕ := ptGet FKLBridge.Idx.GibbsU4.tree 7 15 (Nat.add (Nat.mul p 3) b)

/-- Gibbs potential numerator. -/
noncomputable def un4 (p b v : ℕ) : ℕ := FKLBridge.Gibbs.numerator (g4 p b) v

/-- Gibbs potential denominator exponent. -/
noncomputable def up4 (p b v : ℕ) : ℕ := FKLBridge.Gibbs.power (g4 p b) v

/-- All raw terms of the six roles of source `p`. -/
noncomputable def src4 (p : ℕ) (tail : List Raw) : List Raw :=
  srcB 197 0 45 9 (a4 p) sh8 (fit4 p) (un4 p) (up4 p) (fCr4 p) ax0 tail

/-- Key exactness of source `p`. -/
noncomputable def ok4 (p : ℕ) : Bool := okSrc 197 45 9 sh8 (fit4 p) (up4 p)

/-- The seven sources of block `b`. -/
noncomputable def block4Raw (b : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => src4 (Nat.add (Nat.mul 7 b) j) t) tail

/-- Key exactness of every source of block `b`. -/
noncomputable def okBlock4 (b : ℕ) : Bool := allN 7 (fun j => ok4 (Nat.add (Nat.mul 7 b) j))

theorem sa4_eq (p : Fin 105) : sa4 p = (ParameterIndexData.SplitAlpha4.table.get p).val := by
  rw [FKLBridge.Idx.SplitAlpha4.get_eq]; rfl

theorem col4_eq (p : Fin 105) (c : Fin 45) :
    ((columnMass4 p c : ℚ) : ℝ) = (a4 p c : ℝ) / 2 ^ 44 := by
  unfold columnMass4 a4
  rw [sa4_eq, FKLBridge.Split.cell_eq _ c (by
    change c.val < (SuppliedParameters.alpha4 p).val.row.width; rw [width45]; exact c.isLt)]
  rw [Rat.cast_div, Rat.cast_natCast]
  norm_num
  rfl

theorem fit4_eq (p : Fin 105) (c : Fin 45) :
    fit4 p c = decide ((shapeColumnEquiv 8 c).val.Fits (SuppliedTypedParameters.level4Split p).parent) := by
  have px := FKLBridge.Split.parentX_eq (ParameterIndexData.SplitAlpha4.table.get p)
  have py := FKLBridge.Split.parentY_eq (ParameterIndexData.SplitAlpha4.table.get p)
  have pz := FKLBridge.Split.parentZ_eq (ParameterIndexData.SplitAlpha4.table.get p)
  rw [← sa4_eq] at px py pz
  set P := (SuppliedTypedParameters.level4Split p).parent with hPdef
  have hPx : FKLBridge.Split.parentX (sa4 p) = P.x := px
  have hPy : FKLBridge.Split.parentY (sa4 p) = P.y := py
  have hPz : FKLBridge.Split.parentZ (sa4 p) = P.z := pz
  unfold fit4
  rw [hPx, hPy, hPz]
  exact fitOf_eq _ P sh8 c (sh8_eq c)

theorem pot4_eq (p : Fin 105) (b : Fin 3) (v : Fin 9) :
    (((SuppliedTypedParameters.potential4 p b).rational v : ℚ) : ℝ) = (un4 p b v : ℝ) / 2 ^ (up4 p b v) := by
  have hg : g4 p b = (ParameterIndexData.GibbsU4.table.get (SuppliedParameters.flat2 p b)).val := by
    unfold g4
    rw [FKLBridge.Idx.GibbsU4.get_eq, SuppliedParameters.flat2_val]; rfl
  have hw := (SuppliedTypedParameters.potential4 p b).width_eq
  have hlen : v.val < (IndexedCertificateRows.gibbs (ParameterIndexData.GibbsU4.table.get
      (SuppliedParameters.flat2 p b))).val.entries.length := by
    change v.val < (SuppliedTypedParameters.potential4 p b).row.entries.length
    rw [hw]; exact v.isLt
  unfold un4 up4
  rw [hg, FKLBridge.Gibbs.numerator_eq _ _ hlen, FKLBridge.Gibbs.power_eq _ _ hlen]
  unfold TypedGibbsRow.rational BinaryRational.rational
  push_cast
  rfl

theorem src4_value (p : Fin 105) (hok : ok4 p = true) (tail : List Raw) :
    rawValue 197 (88 + 44 + 0) (src4 p tail) =
      (∑ role : Fin 6, rationalLogValue (supportedScale (mass4 p role) (directExpression4 p role))) +
        rawValue 197 (88 + 44 + 0) tail :=
  roles_value (length := 4) (n := 45) (SuppliedTypedParameters.level4Split p).parent (shapeColumnEquiv 8)
    (columnMass4 p) (fun b => (SuppliedTypedParameters.potential4 p b).rational) (mass4 p) 197 88 0
    (by norm_num) (a4 p) sh8 (fit4 p) (un4 p) (up4 p) (fCr4 p) (col4_eq p) sh8_eq (fit4_eq p)
    (pot4_eq p) (fCr4_eq p) hok tail

theorem block4Raw_value (b : Fin 15) (hok : okBlock4 b = true) (tail : List Raw) :
    rawValue 197 132 (block4Raw b tail) = rationalLogValue (block4 b) + rawValue 197 132 tail := by
  unfold block4Raw
  rw [rawValue_loopL 197 132 7 _ (fun j => if h : j < 7 then
      ∑ role : Fin 6, rationalLogValue (supportedScale (mass4 (finProdFinEquiv (b, ⟨j, h⟩)) role)
        (directExpression4 (finProdFinEquiv (b, ⟨j, h⟩)) role)) else 0)]
  · rw [block4, finiteLogSum_value, Finset.sum_range]
    simp only [finiteLogSum_value, Fin.is_lt, dite_true, Fin.eta]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 7 b.val) j < 105 := by
      have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, ⟨j, hj⟩) = (⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 105) := by
      ext; simp [finProdFinEquiv]; ring
    rw [e]
    exact src4_value ⟨_, hlt⟩ (allN_sound _ 7 hok j hj) t

/-- An accepted fast block check gives the block boundary identity. -/
theorem boundary4_of_check (tree : Tree) (KW MW : ℕ)
    (hreads : RawReads 197 132 KW MW tree PairedCoarse4CertificateTable.table 0)
    (b : Fin 15) (a c : ℕ) (hc : c ≤ 2763) (L K kw nk P M1 : ℕ) (corr : List Raw)
    (h : Bool.and (okBlock4 b) (check2H L K kw nk P M1 (block4Raw b []) (windowRaw tree KW MW a (c - a) corr)) = true) :
    rationalLogValue (block4 b) =
      rationalLogValue (certificateWindow PairedCoarse4CertificateTable.table a c) + rawValue 197 132 corr := by
  rw [Bool.and_eq_true] at h
  have e := check2H_sound 197 132 L K kw nk P M1 _ _ h.2
  rw [block4Raw_value b h.1 [], windowRaw_value 197 132 KW MW tree _ hreads a c hc corr, rawValue_nil, add_zero] at e
  exact e

end MatrixBounds.Numeric.FKLCoarse
