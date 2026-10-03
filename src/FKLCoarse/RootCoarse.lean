module

public import FKLCoarse.Build
public import FKLCoarse.Corr
public import FKLCert.Term
public import FKLBridge.Gibbs
public import FKLBridge.Dyadic
public import FKLBridge.Idx.GibbsUR
public import FKLBridge.Idx.DyadicRootAlpha
public import SuppliedRootCoarseExpression

/-! Fast replacement of `SuppliedRootCoarse.normalized_checked`: the root coarse expression has the value of the
certificate's `Root0Block000` terms, from one hashed FKL check (one source, one role, all 153 columns). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse.Root

open FKL FKLCert Tensor Tensor.CW
open scoped BigOperators

def shRP : Nat := 7151559618928529435223389422131484477757106221184194465295427974107138748375132305774283362175661741621896111083448773940303718196646405826431726062775465775183599531078300378330762273052335262517545922807472844296768215673030278233260773402699917210627819662237004988140639162719044120318344332495507076870159178240749752035469634158388910623831028743596871912729784972994335132296145212459008573596735401747841322496586508190340808942385179531554392969338136905268438698850701193716437218184616098334459759805721203558507348884250883286586449961181054310385235717575158126073489905559028151030985683157336216099840955727146028833906799128169262235172864621602318069414723939885419331584
/-- Physical coordinate `b` (= original coordinate `axes b`) of root column `c`. -/
def shR (b c : Nat) : Nat := lane shRP 5 (Nat.add (Nat.mul b 153) c)

/-- `SuppliedRootStage.axes` as a packed table. -/
def axN (b : Nat) : Nat := lane 24 2 b

theorem shR_eq : ∀ (c : Fin 153) (b : Fin 3), (SuppliedRootCoarse.coordinate c b).val = shR b c := by
  decide +kernel

theorem axN_eq : ∀ b : Fin 3, (SuppliedRootStage.axes b).val = axN b := by decide +kernel

/-- Root mass numerator of column `c` (denominator `2^44`). -/
noncomputable def aR (c : Nat) : Nat := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) c

/-- Gibbs row of physical root axis `b`. -/
noncomputable def gR (b : Nat) : Nat := ptGet FKLBridge.Idx.GibbsUR.tree 2 15 (axN b)
noncomputable def unR (b v : Nat) : Nat := FKLBridge.Gibbs.numerator (gR b) v
noncomputable def upR (b v : Nat) : Nat := FKLBridge.Gibbs.power (gR b) v

/-- The single role weight `1` (all other role slots empty). -/
def crR (r : Nat) : Nat := cond (Nat.beq r 0) 1 0

/-- All raw terms of the root expression. -/
noncomputable def rootRaw (S ms : Nat) (tail : List Raw) : List Raw :=
  srcB S ms 153 17 aR shR (fun _ => true) unR upR crR (fun _ => 0) tail

theorem aR_eq (c : Fin 153) : ((SuppliedRootCoarse.mass c : ℚ) : ℝ) = (aR c : ℝ) / 2 ^ 44 := by
  have hw := SuppliedTypedParameters.rootDistribution.width_eq
  have hg : ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0 =
      (ParameterIndexData.DyadicRootAlpha.table.get 0).val := (FKLBridge.Idx.DyadicRootAlpha.get_eq 0).symm
  unfold aR SuppliedRootCoarse.mass TypedProbabilityRow.rational TypedProbabilityRow.numerator
  rw [hg, FKLBridge.Dyadic.cell_eq _ _ (by
      change c.val < SuppliedTypedParameters.rootDistribution.row.width
      rw [hw]; exact c.isLt)]
  rw [Rat.cast_div, Rat.cast_natCast, Rat.cast_natCast]
  congr 1
  norm_num

theorem pot_eq (b : Fin 3) (v : Fin 17) :
    ((SuppliedRootCoarse.potential b v : ℚ) : ℝ) = (unR b v : ℝ) / 2 ^ (upR b v) := by
  have hg : gR b = (ParameterIndexData.GibbsUR.table.get (SuppliedRootStage.axes b)).val := by
    unfold gR
    rw [FKLBridge.Idx.GibbsUR.get_eq, axN_eq]
  have hw := (SuppliedTypedParameters.potentialRoot (SuppliedRootStage.axes b)).width_eq
  have hlen : v.val < (IndexedCertificateRows.gibbs (ParameterIndexData.GibbsUR.table.get
      (SuppliedRootStage.axes b))).val.entries.length := by
    change v.val < (SuppliedTypedParameters.potentialRoot (SuppliedRootStage.axes b)).row.entries.length
    rw [hw]; exact v.isLt
  unfold unR upR SuppliedRootCoarse.potential
  rw [hg, FKLBridge.Gibbs.numerator_eq _ _ hlen, FKLBridge.Gibbs.power_eq _ _ hlen]
  unfold TypedGibbsRow.rational BinaryRational.rational
  push_cast
  rfl

/-- The real value of the root expression. -/
theorem expression_real :
    rationalLogValue SuppliedRootCoarse.expression = CR 153 17 aR shR (fun _ => true) unR upR 0 := by
  have hmarg : ∀ (b : Fin 3) (v : Fin 17),
      ((SuppliedRootCoarse.marginalMass b v : ℚ) : ℝ) = xm 153 aR shR b v := by
    intro b v
    unfold SuppliedRootCoarse.marginalMass xm
    rw [marg_cast, sum_div', ← Fin.sum_univ_eq_sum_range (fun c => (if shR b c = v.val then (aR c : ℝ) else 0) / 2 ^ 44) 153]
    push_cast
    apply Finset.sum_congr rfl
    intro c _
    have hiff : SuppliedRootCoarse.coordinate c b = v ↔ shR b c = v.val := by
      rw [Fin.ext_iff, shR_eq c b]
    by_cases h : SuppliedRootCoarse.coordinate c b = v
    · rw [if_pos h, if_pos (hiff.mp h), aR_eq c]
    · rw [if_neg h, if_neg (fun h' => h (hiff.mpr h'))]; simp
  have E1 : rationalLogValue (entropyLogExpression (SuppliedRootCoarse.marginalMass 0)) = margEnt 153 17 aR shR 0 := by
    rw [entropyLogExpression_value]
    unfold Entropy.entropy margEnt
    congr 1
    rw [← Fin.sum_univ_eq_sum_range (fun v => xm 153 aR shR 0 v * Real.log (xm 153 aR shR 0 v)) 17]
    apply Finset.sum_congr rfl
    intro v _
    dsimp only
    rw [hmarg 0 v]; rfl
  have E2 : rationalLogValue (entropyLogExpression SuppliedRootCoarse.mass) =
      -∑ c ∈ Finset.range 153, (aR c : ℝ) / 2 ^ 44 * Real.log ((aR c : ℝ) / 2 ^ 44) := by
    rw [entropyLogExpression_value]
    unfold Entropy.entropy
    congr 1
    rw [← Fin.sum_univ_eq_sum_range (fun c => (aR c : ℝ) / 2 ^ 44 * Real.log ((aR c : ℝ) / 2 ^ 44)) 153]
    apply Finset.sum_congr rfl
    intro c _
    dsimp only
    rw [aR_eq c]
  have E3 : ((SuppliedRootCoarse.normalizer : ℚ) : ℝ) = zR 153 shR (fun _ => true) unR upR := by
    unfold SuppliedRootCoarse.normalizer zR
    push_cast
    rw [← Fin.sum_univ_eq_sum_range (fun c => if (fun _ => true) c = true then uR unR upR 0 (shR 0 c) *
      uR unR upR 1 (shR 1 c) * uR unR upR 2 (shR 2 c) else 0) 153]
    apply Finset.sum_congr rfl
    intro c _
    simp only [if_true]
    have hf : ∀ b : Fin 3, ((SuppliedRootCoarse.potential b (SuppliedRootCoarse.coordinate c b) : ℚ) : ℝ) =
        uR unR upR b (shR b c) := by
      intro b; rw [pot_eq, shR_eq c b]; rfl
    rw [hf 0, hf 1, hf 2]; rfl
  have E4 : ∀ b : Fin 3, rationalLogValue (finiteLogSum (fun v => logAtom (SuppliedRootCoarse.potential b v)
      (SuppliedRootCoarse.marginalMass b v))) =
      ∑ v ∈ Finset.range 17, xm 153 aR shR b v * Real.log (uR unR upR b v) := by
    intro b
    rw [finiteLogSum_value, ← Fin.sum_univ_eq_sum_range (fun v => xm 153 aR shR b v * Real.log (uR unR upR b v)) 17]
    apply Finset.sum_congr rfl
    intro v _
    rw [logAtom_value, hmarg b v, pot_eq]; rfl
  have E5 : ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range 17, xm 153 aR shR b v * Real.log (uR unR upR b v) =
      (∑ v ∈ Finset.range 17, xm 153 aR shR 0 v * Real.log (uR unR upR 0 v)) +
      (∑ v ∈ Finset.range 17, xm 153 aR shR 1 v * Real.log (uR unR upR 1 v)) +
      (∑ v ∈ Finset.range 17, xm 153 aR shR 2 v * Real.log (uR unR upR 2 v)) := by
    simp [Finset.sum_range_succ]
  unfold SuppliedRootCoarse.expression
  simp only [rationalLogValue_append, logAtom_value]
  rw [E1, E2, E3, E4 0, E4 1, E4 2]
  unfold CR common
  rw [E5, show ((0 : Fin 3) : ℕ) = 0 from rfl, show ((1 : Fin 3) : ℕ) = 1 from rfl,
    show ((2 : Fin 3) : ℕ) = 2 from rfl]
  push_cast
  ring

/-- Exactness of every certificate record. -/
noncomputable def allExact (S T : Nat) (l : List IntegerLogTerm) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun t _ acc => Bool.and (exact S T t) acc) l

theorem rawValue_map_rawOf (S T : Nat) : ∀ l : List IntegerLogTerm, allExact S T l = true →
    rawValue S T (l.map (rawOf S T)) = rationalLogValue (l.map IntegerLogTerm.monomial) := by
  intro l
  induction l with
  | nil => intro _; simp [rawValue, rationalLogValue]
  | cons t l ih =>
    intro h
    have h' : exact S T t = true ∧ allExact S T l = true := by
      simpa [allExact, Bool.and_eq_true] using h
    rw [List.map_cons, rawValue_cons, ih h'.2, rawOf_value S T t h'.1]
    simp [rationalLogValue]

/-- One accepted check gives the root value identity. -/
theorem value_of_check (S ms L K kw nk P M1 : Nat) (hS : 44 ≤ S)
    (h : Bool.and (okSrc S 153 17 shR (fun _ => true) upR)
      (Bool.and (allExact S (0 + 44 + ms) RateCertificateData.Root0Block000.terms)
        (check2H L K kw nk P M1 (rootRaw S ms [])
          (RateCertificateData.Root0Block000.terms.map (rawOf S (0 + 44 + ms))))) = true) :
    rationalLogValue SuppliedRootCoarse.expression =
      rationalLogValue (RateCertificateData.Root0Block000.terms.map IntegerLogTerm.monomial) := by
  simp only [Bool.and_eq_true] at h
  obtain ⟨hok, hex, hchk⟩ := h
  have e := check2H_sound S (0 + 44 + ms) L K kw nk P M1 _ _ hchk
  rw [rawValue_map_rawOf S _ _ hex] at e
  unfold rootRaw at e
  rw [srcB_value S 0 ms 153 17 hS aR shR (fun _ => true) unR upR crR (fun _ => 0) hok (fun _ _ => by norm_num) [],
    rawValue_nil, add_zero] at e
  rw [← e, expression_real]
  simp [crR]

end MatrixBounds.Numeric.FKLCoarse.Root
