module

public import FKLDim.ZeroDim
public import FKLDim.Static
public import FKLFine3.Weight3
public import FKLBridge.Idx.DyadicZero3
public import FKLBridge.Idx.DyadicZero4
public import SuppliedDimensionHigherArithmetic

/-! Fast zero3 and zero4 dimension data and their block builders. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLDim

open FKL FKLFine3 SuppliedDimensionRates SuppliedPopulationWeights
open scoped BigOperators

/-- Root probability numerator at root column `c`. -/
noncomputable def rootAt (c : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) c

theorem rootAt_eq (c : Fin 153) : rootAt c = SuppliedTypedParameters.rootDistribution.numerator c := by
  have hw := SuppliedTypedParameters.rootDistribution.width_eq
  have hg : ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0 =
      (ParameterIndexData.DyadicRootAlpha.table.get 0).val := (FKLBridge.Idx.DyadicRootAlpha.get_eq 0).symm
  unfold rootAt
  rw [hg, FKLBridge.Dyadic.cell_eq _ _ (by
      change c.val < SuppliedTypedParameters.rootDistribution.row.width
      rw [hw]; exact c.isLt)]
  rfl

/-! ### zero3 -/

theorem zero_nodes_checked : nodesOK SuppliedShapeIndices.zeroNodes zparP zchiP = true := by decide +kernel

theorem zero_node_eq (n : Fin 840) : zpar n = (SuppliedShapeIndices.zeroNode n).parent ∧
    zchi n = (SuppliedShapeIndices.zeroNode n).child :=
  nodesOK_sound _ _ _ zero_nodes_checked n.val (by rw [SuppliedShapeIndices.zeroNodes_length]; exact n.isLt)

/-- Zero3 population numerator at denominator `2^88`. -/
noncomputable def pop3 (n : ℕ) : ℕ :=
  Nat.mul (Nat.mul 2 (rootAt (rcol (zpar n)))) (FKLBridge.Split.cell (ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 (zpar n)) (zchi n))

/-- Zero3 orbit numerators. -/
noncomputable def num3 (n o : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicZero3.tree 7 14 n) o

theorem pop3_eq (n : Fin 840) : pop3 n = zero3Numerator n := by
  rw [← balancedZero3Numerator_eq]
  obtain ⟨hp, hc⟩ := zero_node_eq n
  have hpar : zpar n = (zero3Parent n).val := by
    rw [hp]; simp only [zero3Parent, zero3Table_lookup]
  have hchi : zchi n = (zero3Table.lookup n).child := by rw [hc, zero3Table_lookup]
  have hroot : rootAt (rcol (zpar n)) = fastRootNumerator (zero3Parent n) := by
    rw [hpar, rcol_eq, rootAt_eq, fastRootNumerator_eq]; rfl
  have hsplit : FKLBridge.Split.cell (ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 (zpar n)) (zchi n) =
      zero3SplitNumerator n := by
    have hb := (SuppliedShapeIndices.zeroNode_bounds n).2.1
    rw [hpar, ← FKLBridge.Idx.SplitAlpha4.get_eq, hchi, FKLBridge.Split.cell_eq _ _ (by
      change (zero3Table.lookup n).child < (SuppliedParameters.alpha4 (zero3Parent n)).val.row.width
      rw [width45, zero3Table_lookup]; exact hb)]
    rfl
  unfold pop3 balancedZero3Numerator
  rw [hroot, hsplit]; rfl

theorem num3_eq (n : Fin 840) (o : Fin 21) : num3 n o = (SuppliedTypedParameters.zero3 n).numerator o := by
  have hw := (SuppliedTypedParameters.zero3 n).width_eq
  unfold num3
  rw [← FKLBridge.Idx.DyadicZero3.get_eq, FKLBridge.Dyadic.cell_eq _ o (by
    change o.val < (SuppliedTypedParameters.zero3 n).row.width; rw [hw]; exact o.isLt)]
  rfl

theorem zero3Mass_eq (n : Fin 840) : zero3Mass n = (pop3 n : ℚ) / 2 ^ 88 := by
  rw [zero3Mass, ← pop3_eq]; norm_num [DyadicPopulationArithmetic.denominator]

theorem zero3_rat (n : Fin 840) (o : Fin 21) :
    (SuppliedTypedParameters.zero3 n).rational o = (num3 n o : ℚ) / 2 ^ 44 := by
  rw [TypedProbabilityRow.rational, num3_eq]; norm_num

/-- The seven zero3 nodes of block `b`. -/
noncomputable def z3Raw (b : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => (fun n => zdimB 44 21 (num3 n) sz3 mid3 (pop3 n) 0 88 t) (Nat.add (Nat.mul 7 b) j)) tail

theorem z3Raw_value (b : Fin 120) :
    rawValue 44 220 (z3Raw b []) = rationalLogValue (zero3BlockExpression b) := by
  unfold z3Raw
  simp only [zero3BlockExpression, finiteLogSum_value]
  rw [rawValue_loopL 44 220 7 _ (fun j => if h : j < 7 then rationalLogValue (weightedExpression
      (zero3Mass (finProdFinEquiv (b, (⟨j, h⟩ : Fin 7)))) (fastZero3Source (finProdFinEquiv (b, (⟨j, h⟩ : Fin 7)))))
      else 0), rawValue_nil, add_zero, Finset.sum_range]
  · simp only [Fin.is_lt, dite_true, Fin.eta]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 7 b.val) j < 840 := by have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, (⟨j, hj⟩ : Fin 7)) = (⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 840) := by
      ext; simp [finProdFinEquiv, raw_add, raw_mul]; ring
    rw [e]
    exact zdimB_value 44 220 21 _ sz3 mid3 _ 0 88 88 rfl rfl _ (zero3_rat ⟨_, hlt⟩) _ _ sz3_eq mid3_eq _
      (zero3Mass_eq ⟨_, hlt⟩) t

/-! ### zero4 -/

/-- Zero4 population numerator at denominator `2^44`. -/
noncomputable def pop4 (n : ℕ) : ℕ := rootAt (z4col n)

/-- Zero4 orbit numerators. -/
noncomputable def num4 (n o : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicZero4.tree 6 14 n) o

theorem num4_eq (n : Fin 48) (o : Fin 231) : num4 n o = (SuppliedTypedParameters.zero4 n).numerator o := by
  have hw := (SuppliedTypedParameters.zero4 n).width_eq
  unfold num4
  rw [← FKLBridge.Idx.DyadicZero4.get_eq, FKLBridge.Dyadic.cell_eq _ o (by
    change o.val < (SuppliedTypedParameters.zero4 n).row.width; rw [hw]; exact o.isLt)]
  rfl

theorem zero4Mass_eq (n : Fin 48) : zero4Mass n = (pop4 n : ℚ) / 2 ^ 44 := by
  rw [zero4Mass, TypedProbabilityRow.rational, pop4, z4col_eq, rootAt_eq]
  generalize SuppliedTypedParameters.rootDistribution.numerator (zero4Column n) = x
  norm_num

theorem zero4_rat (n : Fin 48) (o : Fin 231) :
    (SuppliedTypedParameters.zero4 n).rational o = (num4 n o : ℚ) / 2 ^ 44 := by
  rw [TypedProbabilityRow.rational, num4_eq]; norm_num

/-- The four zero4 factors of block `b`. -/
noncomputable def z4Raw (b : ℕ) (tail : List Raw) : List Raw :=
  loopL 4 (fun j t => (fun n => zdimB 44 231 (num4 n) sz4 mid4 (pop4 n) 0 132 t) (Nat.add (Nat.mul 4 b) j)) tail

theorem z4Raw_value (b : Fin 12) :
    rawValue 44 220 (z4Raw b []) = rationalLogValue (zero4BlockExpression b) := by
  unfold z4Raw
  simp only [zero4BlockExpression, finiteLogSum_value]
  rw [rawValue_loopL 44 220 4 _ (fun j => if h : j < 4 then rationalLogValue (weightedExpression
      (zero4Mass (finProdFinEquiv (b, (⟨j, h⟩ : Fin 4)))) (fastZero4Source (finProdFinEquiv (b, (⟨j, h⟩ : Fin 4)))))
      else 0), rawValue_nil, add_zero, Finset.sum_range]
  · simp only [Fin.is_lt, dite_true, Fin.eta]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 4 b.val) j < 48 := by have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, (⟨j, hj⟩ : Fin 4)) = (⟨Nat.add (Nat.mul 4 b.val) j, hlt⟩ : Fin 48) := by
      ext; simp [finProdFinEquiv, raw_add, raw_mul]; ring
    rw [e]
    exact zdimB_value 44 220 231 _ sz4 mid4 _ 0 132 44 rfl rfl _ (zero4_rat ⟨_, hlt⟩) _ _ sz4_eq mid4_eq _
      (zero4Mass_eq ⟨_, hlt⟩) t

end MatrixBounds.Numeric.FKLDim
