module

public import FKLTermData.MassLink
public import FKL.Build

/-! Raw builders of the terminal block expressions at argument scale `2^44` and coefficient scale
`2^264`, with their exact real values.

Per block: one aggregated `log 2` term with magnitude `(Σ M (2^44 - r)) << 44`, and per source record
`-(2 M r mu) log(mu/2^44)` and `-(M r (2^44 - 2mu)) log((2^44 - 2mu)/2^44)`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLTerm

open FKL FKLFine3 SuppliedTerminalRates SuppliedPopulationWeights
open scoped BigOperators

/-- Real value of the role-weighted terminal retention expression. -/
theorem retention_value (μ ρ : ℚ) :
    rationalLogValue (terminalRetentionExpression μ ρ) =
      (1 - (ρ : ℝ)) * Real.log 2 + (ρ : ℝ) * (-((μ : ℝ) * Real.log μ) -
        (1 - 2 * (μ : ℝ)) * Real.log (1 - 2 * (μ : ℝ)) - (μ : ℝ) * Real.log μ) := by
  simp only [terminalRetentionExpression, terminalEntropyExpression, rationalLogValue_append, logAtom_value,
    scaleLogExpression_value, entropyLogExpression, finiteLogSum_value, Fin.sum_univ_three]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons,
    Rat.cast_sub, Rat.cast_one, Rat.cast_neg, Rat.cast_mul, Rat.cast_ofNat]
  ring

/-- Entropy terms of one source record: mass `M` (at `2^176`), parameter `mu`, role `r` (at `2^44`). -/
def recEB (M mu r : Nat) (tail : List Raw) : List Raw :=
  term 44 mu (Nat.mul (Nat.mul 2 (Nat.mul M r)) mu) true
    (term 44 (Nat.sub 17592186044416 (Nat.mul 2 mu))
      (Nat.mul (Nat.mul M r) (Nat.sub 17592186044416 (Nat.mul 2 mu))) true tail)

/-- The entropy part of one record as a real number. -/
noncomputable def entReal (M mu r : Nat) : ℝ :=
  (M : ℝ) / 2 ^ 176 * ((r : ℝ) / 2 ^ 44) *
    (-(2 * ((mu : ℝ) / 2 ^ 44) * Real.log ((mu : ℝ) / 2 ^ 44)) -
      (1 - 2 * ((mu : ℝ) / 2 ^ 44)) * Real.log (1 - 2 * ((mu : ℝ) / 2 ^ 44)))

theorem recEB_value (M mu r : Nat) (hmu : 2 * mu ≤ 17592186044416) (tail : List Raw) :
    rawValue 44 264 (recEB M mu r tail) = entReal M mu r + rawValue 44 264 tail := by
  unfold recEB entReal
  simp only [rawValue_term, Raw.value_neg]
  have hX44 : (2 : ℝ) ^ 44 ≠ 0 := by positivity
  have hk' : ((17592186044416 - 2 * mu : ℕ) : ℝ) = 2 ^ 44 * (1 - 2 * ((mu : ℝ) / 2 ^ 44)) := by
    rw [Nat.cast_sub hmu]; push_cast; ring
  simp only [raw_mul, raw_sub, Nat.cast_mul, Nat.cast_ofNat]
  rw [hk', mul_div_cancel_left₀ _ hX44]
  rw [show (2 : ℝ) ^ 264 = ((2 : ℝ) ^ 44) ^ 6 by rw [← pow_mul],
    show (2 : ℝ) ^ 176 = ((2 : ℝ) ^ 44) ^ 4 by rw [← pow_mul]]
  generalize (2 : ℝ) ^ 44 = X at *
  generalize Real.log ((mu : ℝ) / X) = lm
  generalize Real.log (1 - 2 * ((mu : ℝ) / X)) = lk
  field_simp
  ring

/-- Magnitude numerator of the `log 2` coefficient of one record. -/
noncomputable def l2mag (n t s a : Nat) : Nat :=
  Nat.mul (FKLTermData.Mass.fMassT n t s) (Nat.sub 17592186044416 (fRole n t s a))

/-- Entropy terms of one source record `(n, t, s)` at physical axis `a`. -/
noncomputable def recRaw (n t s a : Nat) (tail : List Raw) : List Raw :=
  recEB (FKLTermData.Mass.fMassT n t s) (fMu n t s) (fRole n t s a) tail

/-- Entropy terms of all children and strategies of one node. -/
noncomputable def nodeRaw (n a : Nat) (tail : List Raw) : List Raw :=
  loopL 3 (fun t tl => loopL 6 (fun s tl => recRaw n t s a tl) tl) tail

/-- Summed `log 2` magnitude numerator of one block. -/
noncomputable def blockL2 (b a : Nat) : Nat :=
  sumN 7 (fun j => sumN 3 (fun t => sumN 6 (fun s => l2mag (Nat.add (Nat.mul 7 b) j) t s a)))

/-- All raw terms of one block. -/
noncomputable def blockRaw (b a : Nat) (tail : List Raw) : List Raw :=
  term 44 35184372088832 (Nat.shiftLeft (blockL2 b a) 44) false
    (loopL 7 (fun j tl => nodeRaw (Nat.add (Nat.mul 7 b) j) a tl) tail)

/-- The `log 2` contribution of one unit of `l2mag`. -/
noncomputable def c2 : ℝ := (2 : ℝ) ^ 44 / 2 ^ 264 * Real.log 2

/-- Exact split of one semantic record into its `log 2` and entropy parts. -/
theorem rec_split (n : Fin 945) (t : Fin 3) (s : Fin 6) (a : Fin 3) :
    rationalLogValue (scaleLogExpression (sourceMass (source n t s)) (fastSourceExpression (source n t s) a)) =
      (l2mag n t s a : ℝ) * c2 + entReal (FKLTermData.Mass.fMassT n t s) (fMu n t s) (fRole n t s a) := by
  rw [scaleLogExpression_value, fastSourceExpression, retention_value]
  have hmu : ((SuppliedRootFineTerminalLookup.mu (source n t s).node (source n t s).child
      (source n t s).strategy : ℚ) : ℝ) = (fMu n t s : ℝ) / 2 ^ 44 := by
    rw [fMu_eq]; simp only [SuppliedRootFineTerminalLookup.mu, source]; push_cast; norm_num
  have hr : (((SuppliedTerminalRoles.distribution (source n t s)).rational a : ℚ) : ℝ) =
      (fRole n t s a : ℝ) / 2 ^ 44 := by
    rw [fRole_eq]; simp only [TypedProbabilityRow.rational]; push_cast; norm_num
  have hm : (sourceMass (source n t s) : ℝ) = (FKLTermData.Mass.fMassT n t s : ℝ) / 2 ^ 176 := by
    rw [FKLTermData.Mass.fMassT_eq, fMass_eq]
  have hl : (l2mag n t s a : ℝ) = (FKLTermData.Mass.fMassT n t s : ℝ) * (2 ^ 44 - (fRole n t s a : ℝ)) := by
    unfold l2mag
    rw [raw_mul, raw_sub, Nat.cast_mul, Nat.cast_sub (fRole_le n t s a)]; norm_num
  rw [hmu, hr, hm, hl, c2, entReal]
  rw [show (2 : ℝ) ^ 264 = ((2 : ℝ) ^ 44) ^ 6 by rw [← pow_mul],
    show (2 : ℝ) ^ 176 = ((2 : ℝ) ^ 44) ^ 4 by rw [← pow_mul]]
  have hX44 : (2 : ℝ) ^ 44 ≠ 0 := by positivity
  generalize (2 : ℝ) ^ 44 = X at *
  generalize Real.log 2 = l2
  generalize Real.log ((fMu n t s : ℝ) / X) = lm
  generalize Real.log (1 - 2 * ((fMu n t s : ℝ) / X)) = lk
  field_simp
  ring

theorem nodeRaw_value (n : Fin 945) (a : Fin 3) (tail : List Raw) :
    rawValue 44 264 (nodeRaw n a tail) =
      (∑ t ∈ Finset.range 3, ∑ s ∈ Finset.range 6,
        entReal (FKLTermData.Mass.fMassT n t s) (fMu n t s) (fRole n t s a)) + rawValue 44 264 tail := by
  unfold nodeRaw
  rw [rawValue_loopL 44 264 3 _ (fun t => ∑ s ∈ Finset.range 6,
      entReal (FKLTermData.Mass.fMassT n t s) (fMu n t s) (fRole n t s a))]
  intro t ht tl
  rw [rawValue_loopL 44 264 6 _ (fun s => entReal (FKLTermData.Mass.fMassT n t s) (fMu n t s) (fRole n t s a))]
  intro s hs tl'
  exact recEB_value _ _ _ (twoMu_le n ⟨t, ht⟩ ⟨s, hs⟩) tl'

/-- The summand of a block at node offset `j`, child `t`, strategy `s`. -/
noncomputable def blockTerm (b a j t s : Nat) : ℝ :=
  (l2mag (Nat.add (Nat.mul 7 b) j) t s a : ℝ) * c2 +
    entReal (FKLTermData.Mass.fMassT (Nat.add (Nat.mul 7 b) j) t s) (fMu (Nat.add (Nat.mul 7 b) j) t s)
      (fRole (Nat.add (Nat.mul 7 b) j) t s a)

theorem blockExpression_sum (b : Fin 135) (a : Fin 3) :
    rationalLogValue (blockExpression b a) =
      ∑ j ∈ Finset.range 7, ∑ t ∈ Finset.range 3, ∑ s ∈ Finset.range 6, blockTerm b a j t s := by
  simp only [blockExpression, finiteLogSum_value]
  rw [Finset.sum_range]
  apply Fintype.sum_congr; intro o
  rw [Finset.sum_range]
  apply Fintype.sum_congr; intro t
  rw [Finset.sum_range]
  apply Fintype.sum_congr; intro s
  have hlt : Nat.add (Nat.mul 7 b.val) o.val < 945 := by
    have := b.isLt; have := o.isLt; simp only [raw_add, raw_mul]; omega
  have e : blockNode b o = (⟨Nat.add (Nat.mul 7 b.val) o.val, hlt⟩ : Fin 945) := by
    ext; simp [blockNode, finProdFinEquiv]; ring
  rw [e]
  exact rec_split ⟨_, hlt⟩ t s a

theorem blockRaw_value (b : Fin 135) (a : Fin 3) (tail : List Raw) :
    rawValue 44 264 (blockRaw b a tail) = rationalLogValue (blockExpression b a) + rawValue 44 264 tail := by
  rw [blockExpression_sum]
  unfold blockRaw
  rw [rawValue_term, Raw.value_pos]
  rw [rawValue_loopL 44 264 7 _ (fun j => ∑ t ∈ Finset.range 3, ∑ s ∈ Finset.range 6,
      entReal (FKLTermData.Mass.fMassT (Nat.add (Nat.mul 7 b) j) t s) (fMu (Nat.add (Nat.mul 7 b) j) t s)
        (fRole (Nat.add (Nat.mul 7 b) j) t s a))]
  · have h2 : ((35184372088832 : ℕ) : ℝ) / 2 ^ 44 = 2 := by norm_num
    rw [h2]
    have hS : ((Nat.shiftLeft (blockL2 b a) 44 : ℕ) : ℝ) / 2 ^ 264 * Real.log 2 =
        (∑ j ∈ Finset.range 7, ∑ t ∈ Finset.range 3, ∑ s ∈ Finset.range 6,
          (l2mag (Nat.add (Nat.mul 7 b) j) t s a : ℝ)) * c2 := by
      rw [raw_shiftLeft, Nat.shiftLeft_eq, blockL2]
      simp only [sumN_eq, Nat.cast_mul, Nat.cast_sum, Nat.cast_pow, Nat.cast_ofNat, c2]
      ring
    rw [hS]
    simp only [Finset.sum_mul, blockTerm, Finset.sum_add_distrib]
    ring
  · intro j hj tl
    have hlt : Nat.add (Nat.mul 7 b.val) j < 945 := by
      have := b.isLt; simp only [raw_add, raw_mul]; omega
    exact nodeRaw_value ⟨_, hlt⟩ a tl

end MatrixBounds.Numeric.FKLTerm
