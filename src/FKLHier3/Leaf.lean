module

public import FKLHier3.LeafTree
public import FKLFine3.Bounds3
public import FKL.Pack
public import FKL.Range

/-! The packed level-three leaf table: lane `((s*15+c)*3+p)*6+o` of node `n`'s chunk. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL FKLFine3

theorem raw_div (a b : Nat) : Nat.div a b = a / b := rfl
theorem raw_mod (a b : Nat) : Nat.mod a b = a % b := rfl

/-- Table read of the leaf numerator, through the strategy slice of the node chunk. -/
noncomputable def leafT (n s c p o : ℕ) : ℕ :=
  lane (lane (leafTree.get n) 12960 s) 48 (Nat.add (Nat.mul (Nat.add (Nat.mul c 3) p) 6) o)

/-- Lane index of `(s, c, p, o)`. -/
def lidx (s c p o : ℕ) : ℕ := Nat.add (Nat.mul (Nat.add (Nat.mul (Nat.add (Nat.mul s 15) c) 3) p) 6) o

/-- The packed leaf vector of node `n`, recomputed from the base tables with literal loop indices
(so every row of the base tables is fetched once). -/
noncomputable def leafPack (n : ℕ) : ℕ :=
  sumN 6 (fun s => sumN 15 (fun c => sumN 3 (fun p => sumN 6 (fun o =>
    Nat.shiftLeft (fLeaf n s c p o) (Nat.mul 48 (lidx s c p o))))))

/-- The flat form of the packed leaf vector. -/
noncomputable def leafFlat (n : ℕ) : ℕ :=
  packN 48 1620 (fun k => fLeaf n (k / 270) (k / 18 % 15) (k / 6 % 3) (k % 6))

theorem leafPack_flat (n : ℕ) : leafPack n = leafFlat n := by
  unfold leafPack leafFlat
  simp only [sumN_eq, packN_eq, raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, lidx, raw_add]
  rw [show (1620 : ℕ) = 6 * 270 by norm_num, sum_range_mul]
  apply Finset.sum_congr rfl; intro s hs
  rw [show (270 : ℕ) = 15 * 18 by norm_num, sum_range_mul]
  apply Finset.sum_congr rfl; intro c hc
  rw [show (18 : ℕ) = 3 * 6 by norm_num, sum_range_mul]
  apply Finset.sum_congr rfl; intro p hp
  apply Finset.sum_congr rfl; intro o ho
  simp only [Finset.mem_range] at hs hc hp ho
  have k1 : (s * (15 * (3 * 6)) + (c * (3 * 6) + (p * 6 + o))) / 270 = s := by omega
  have k2 : (s * (15 * (3 * 6)) + (c * (3 * 6) + (p * 6 + o))) / 18 % 15 = c := by omega
  have k3 : (s * (15 * (3 * 6)) + (c * (3 * 6) + (p * 6 + o))) / 6 % 3 = p := by omega
  have k4 : (s * (15 * (3 * 6)) + (c * (3 * 6) + (p * 6 + o))) % 6 = o := by omega
  rw [k1, k2, k3, k4]
  congr 2
  ring

/-- Node `n`'s chunk is the recomputed packed vector. -/
def LeafOK (n : ℕ) : Prop := leafTree.get n = leafPack n

theorem leafOK_of_range (d lo len : ℕ) (h : allRange (fun n => Nat.beq (leafTree.get n) (leafPack n)) d lo len = true) :
    ∀ i < len, LeafOK (lo + i) := by
  intro i hi
  have := allRange_sound _ d lo len h i hi
  exact Nat.eq_of_beq_eq_true this

theorem leafT_eq (n : Fin 945) (h : LeafOK n) (s : Fin 6) (c : Fin 15) (p : Fin 3) (o : Fin 6) :
    leafT n s c p o = fLeaf n s c p o := by
  unfold leafT
  have hj : Nat.add (Nat.mul (Nat.add (Nat.mul c.val 3) p.val) 6) o.val < 270 := by
    simp only [raw_add, raw_mul]; omega
  rw [show (12960 : ℕ) = 48 * 270 by norm_num, lane_lane _ _ _ _ _ hj, h, leafPack_flat, leafFlat]
  have hk : 270 * s.val + Nat.add (Nat.mul (Nat.add (Nat.mul c.val 3) p.val) 6) o.val < 1620 := by
    simp only [raw_add, raw_mul]; omega
  rw [lane_packN]
  · simp only [raw_add, raw_mul]
    congr 1 <;> omega
  · intro k hk'
    have h1 : k / 270 < 6 := by omega
    have h2 : k / 18 % 15 < 15 := Nat.mod_lt _ (by norm_num)
    have h3 : k / 6 % 3 < 3 := Nat.mod_lt _ (by norm_num)
    have h4 : k % 6 < 6 := Nat.mod_lt _ (by norm_num)
    exact lt_of_le_of_lt (fLeaf_le n ⟨_, h1⟩ ⟨_, h2⟩ ⟨_, h3⟩ ⟨_, h4⟩) (by norm_num)
  · exact hk

end MatrixBounds.Numeric.FKLHier3
