module

public import FKLDim.ZeroDim
public import FKLDim.Static
public import FKLFine3.Leaf
public import FKLFine3.Split3
public import FKLFine3.Weight3
public import SuppliedDimensionLeafArithmetic

/-! Fast leaf (zero2 and terminal) dimension data and the leaf block builder. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLDim

open FKL FKLFine3 SuppliedDimensionRates SuppliedPopulationWeights
open scoped BigOperators

/-- Doubled strategy numerator `2 · nodeNumerator n · strategies n s`. -/
noncomputable def q2 (n s : ℕ) : ℕ :=
  Nat.mul 2 (Nat.mul (fNN n) (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s))

/-- Zero2 population numerator at denominator `2^176`. -/
noncomputable def pop2 (n z s : ℕ) : ℕ := Nat.mul (q2 n s) (fW n s (zcol z))

/-- Terminal population numerator at denominator `2^176`. -/
noncomputable def popT (n t s : ℕ) : ℕ := Nat.mul (q2 n s) (fW n s (tcol t))

theorem q2_eq (n : Fin 945) (s : Fin 6) : q2 n s = 2 * strategyNumerator (n, s) := by
  unfold q2 strategyNumerator
  rw [fNN_eq, a3_eq]; rfl

theorem pop2_eq (n : Fin 945) (z : Fin 12) (s : Fin 6) : pop2 n z s = zero2Numerator (n, s) z := by
  unfold pop2
  rw [q2_eq, zcol_eq, fW_eq, zero2Numerator, ← zero2SplitNumerator_eq]
  rfl

theorem popT_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    popT n t s = terminalNumerator (SuppliedTerminalRates.source n t s) := by
  unfold popT
  rw [q2_eq, tcol_eq, fW_eq, terminalNumerator,
    ← SuppliedTerminalRates.terminalSplitNumerator_eq]
  rfl

theorem den4 : ((DyadicPopulationArithmetic.denominator ^ 4 : ℕ) : ℚ) = 2 ^ 176 := by
  norm_num [DyadicPopulationArithmetic.denominator]

theorem zero2Mass_eq (n : Fin 945) (z : Fin 12) (s : Fin 6) :
    zero2Mass (n, s) z = (pop2 n z s : ℚ) / 2 ^ 176 := by
  rw [zero2Mass, ← pop2_eq, den4]

theorem sourceMass_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source n t s) = (popT n t s : ℚ) / 2 ^ 176 := by
  rw [SuppliedTerminalRates.sourceMass, ← popT_eq, den4]

theorem fastZero2Mass_fZ2 (n : Fin 945) (z : Fin 12) (s : Fin 6) (o : Fin 6) :
    fastZero2Mass (n, s) z o = (fZ2 n z s o : ℚ) / 2 ^ 44 := by
  rw [fastZero2Mass_eq, TypedProbabilityRow.rational, fZ2_eq]
  norm_num

theorem mu_fMu (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    SuppliedRootFineTerminalLookup.mu n t s = (fMu n t s : ℚ) / 2 ^ 44 := by
  rw [SuppliedRootFineTerminalLookup.mu, fMu_eq]
  norm_num

/-- All zero2 children and strategies of node `n`. -/
noncomputable def nodeZ2 (n : ℕ) (tail : List Raw) : List Raw :=
  loopL 12 (fun z t => loopL 6 (fun s t => zdimB 44 6 (fZ2 n z s) sz2 mid2 (pop2 n z s) 0 0 t) t) tail

/-- All terminal children and strategies of node `n`. -/
noncomputable def nodeT (n : ℕ) (tail : List Raw) : List Raw :=
  loopL 3 (fun c t => loopL 6 (fun s t => tdimB 44 (popT n c s) (fMu n c s) 0 t) t) tail

/-- The seven nodes of leaf block `b`: zero2 then terminal contributions. -/
noncomputable def leafRaw (b : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => nodeZ2 (Nat.add (Nat.mul 7 b) j) t) (loopL 7 (fun j t => nodeT (Nat.add (Nat.mul 7 b) j) t) tail)

theorem nodeZ2_value (n : Fin 945) (tail : List Raw) :
    rawValue 44 220 (nodeZ2 n tail) =
      (∑ child : Fin 12, ∑ strategy : Fin 6,
        rationalLogValue (weightedExpression (zero2Mass (n, strategy) child) (fastZero2Source (n, strategy) child))) +
      rawValue 44 220 tail := by
  unfold nodeZ2
  rw [rawValue_loopL 44 220 12 _ (fun z => if h : z < 12 then ∑ strategy : Fin 6,
      rationalLogValue (weightedExpression (zero2Mass (n, strategy) ⟨z, h⟩) (fastZero2Source (n, strategy) ⟨z, h⟩))
      else 0)]
  · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
  · intro z hz t
    rw [dif_pos hz, rawValue_loopL 44 220 6 _ (fun s => if h : s < 6 then
        rationalLogValue (weightedExpression (zero2Mass (n, ⟨s, h⟩) ⟨z, hz⟩) (fastZero2Source (n, ⟨s, h⟩) ⟨z, hz⟩))
        else 0)]
    · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
    · intro s hs t'
      rw [dif_pos hs]
      exact zdimB_value 44 220 6 _ sz2 mid2 _ 0 0 176 rfl rfl _
        (fastZero2Mass_fZ2 n ⟨z, hz⟩ ⟨s, hs⟩) _ _ sz2_eq mid2_eq _ (zero2Mass_eq n ⟨z, hz⟩ ⟨s, hs⟩) t'

theorem nodeT_value (n : Fin 945) (tail : List Raw) :
    rawValue 44 220 (nodeT n tail) =
      (∑ child : Fin 3, ∑ strategy : Fin 6,
        rationalLogValue (weightedExpression (SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source n child strategy))
          (fastTerminalSource (SuppliedTerminalRates.source n child strategy)))) +
      rawValue 44 220 tail := by
  unfold nodeT
  rw [rawValue_loopL 44 220 3 _ (fun c => if h : c < 3 then ∑ strategy : Fin 6,
      rationalLogValue (weightedExpression (SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source n ⟨c, h⟩ strategy))
        (fastTerminalSource (SuppliedTerminalRates.source n ⟨c, h⟩ strategy))) else 0)]
  · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
  · intro c hc t
    rw [dif_pos hc, rawValue_loopL 44 220 6 _ (fun s => if h : s < 6 then
        rationalLogValue (weightedExpression (SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source n ⟨c, hc⟩ ⟨s, h⟩))
          (fastTerminalSource (SuppliedTerminalRates.source n ⟨c, hc⟩ ⟨s, h⟩))) else 0)]
    · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
    · intro s hs t'
      rw [dif_pos hs]
      have hmu : 2 * fMu n c s ≤ 35184372088832 := (twoMu_le n ⟨c, hc⟩ ⟨s, hs⟩).trans (by norm_num)
      exact tdimB_value 44 220 _ _ 0 176 (by norm_num) rfl hmu _ (sourceMass_eq n ⟨c, hc⟩ ⟨s, hs⟩) _
        (mu_fMu n ⟨c, hc⟩ ⟨s, hs⟩) t'

theorem leafRaw_value (b : Fin 135) :
    rawValue 44 220 (leafRaw b []) = rationalLogValue (leafBlockExpression b) := by
  unfold leafRaw
  rw [loopBlock 7 135 b nodeZ2 (fun n => ∑ child : Fin 12, ∑ strategy : Fin 6,
      rationalLogValue (weightedExpression (zero2Mass (n, strategy) child) (fastZero2Source (n, strategy) child)))
      (fun n t => nodeZ2_value n t),
    loopBlock 7 135 b nodeT (fun n => ∑ child : Fin 3, ∑ strategy : Fin 6,
      rationalLogValue (weightedExpression (SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source n child strategy))
        (fastTerminalSource (SuppliedTerminalRates.source n child strategy)))) (fun n t => nodeT_value n t),
    rawValue_nil, add_zero]
  simp only [leafBlockExpression, zero2BlockExpression, terminalBlockExpression, rationalLogValue_append,
    finiteLogSum_value]

end MatrixBounds.Numeric.FKLDim
