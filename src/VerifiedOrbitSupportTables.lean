module

public import VerifiedOrbitStatistics
public import FKLMeta.FineWords
public import FKL.Range

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace OrbitLevel2
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 6, totalAt orbit.val = total orbit := by decide
end OrbitLevel2

namespace OrbitLevel3
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4,2,3,3,4,5,4,4,5,6,4,
  5,6,6,7,8
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 21, totalAt orbit.val = total orbit := by decide
end OrbitLevel3

namespace OrbitLevel4
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4,2,3,3,4,5,4,4,5,6,4,
  5,6,6,7,8,2,3,3,4,5,3,4,4,5,6,5,
  5,6,7,5,6,7,7,8,9,4,4,5,6,4,5,5,
  6,7,6,6,7,8,6,7,8,8,9,10,4,5,6,4,
  5,5,6,7,6,6,7,8,6,7,8,8,9,10,6,7,
  5,6,6,7,8,7,7,8,9,7,8,9,9,10,11,8,
  6,7,7,8,9,8,8,9,10,8,9,10,10,11,12,4,
  5,5,6,7,6,6,7,8,6,7,8,8,9,10,6,6,
  7,8,7,7,8,9,7,8,9,9,10,11,6,7,8,7,
  7,8,9,7,8,9,9,10,11,8,9,8,8,9,10,8,
  9,10,10,11,12,10,9,9,10,11,9,10,11,11,12,13,
  8,8,9,10,8,9,10,10,11,12,8,9,10,8,9,10,
  10,11,12,10,11,9,10,11,11,12,13,12,10,11,12,12,
  13,14,8,9,10,10,11,12,10,11,11,12,13,12,12,13,
  14,12,13,14,14,15,16
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- Packed coarse totals and level-four columns (FKLMeta). -/
def fkl_st_t3 : ℕ := 0x8398c5218a4214831888310820

def fkl_st_t4 : ℕ := 0x41ee7358e6b18d62d6a62d4a4a1cd6316a6358b5a92b5316a5250a4a18b52928525086b16b5256a4a54c5a949429284250b525283a5073a0e65a92941d2839d0731949420e641cc6398a52316a5250a4a10941ce642d494a0e941ce8398c539949420e641cc6398a5218a45250839907318e6294862908941ce629cc5298a420ca418c48398c5218a4214831888310820

def fkl_st_c1 : ℕ := 0x527394a518c630842107bdef7bdce739ce735ad6b5ad6b18c6318c6316b5ad6b5ad6b5294a5294a529494a5294a5294a52842108421084210839ce739ce739ce739cc6318c6318c6318c6314a5294a5294a5294a5290842108421084210842106318c6318c6318c6318c63108421084210842108421084108421084210842108421084200000000000000000000000000

def fkl_st_c2 : ℕ := 0x5293a4e549ca349ca30a4e5183e939460f752728c1ee6d2728c1ee6b2939460f7358ba4e5183dcd62d549ca307b9ac5a9349ca307b9ac5a928a4e5183dcd62d4941e939460f7358b52507352728c1ee6b16a4a0e62d2728c1ee6b16a4a0e6292939460f7358b5250731483a4e5183dcd62d4941cc520c549ca307b9ac5a928398a4188349ca307b9ac5a928398a418820

theorem fkl_st_t3_walk : FKLMeta.walk (fun i v => Nat.beq v (FKL.lane fkl_st_t3 5 i)) OrbitLevel3.totalTable.toList 0 = true := by
  decide +kernel

theorem fkl_st_t4_walk : FKLMeta.walk (fun i v => Nat.beq v (FKL.lane fkl_st_t4 5 i)) totalTable.toList 0 = true := by
  decide +kernel

theorem fkl_st_t3_len : OrbitLevel3.totalTable.toList.length = 21 := by decide +kernel

theorem fkl_st_t4_len : totalTable.toList.length = 231 := by decide +kernel

theorem fkl_st_cols_walk : FKLMeta.walk (fun i p => Bool.and (Nat.beq p.1.val (FKL.lane fkl_st_c1 5 i))
    (Nat.beq p.2.val (FKL.lane fkl_st_c2 5 i))) columns.toList 0 = true := by
  decide +kernel

theorem fkl_st_checked : FKL.allRange (fun o => Nat.beq (FKL.lane fkl_st_t4 5 o)
    (Nat.add (FKL.lane fkl_st_t3 5 (FKL.lane fkl_st_c1 5 o)) (FKL.lane fkl_st_t3 5 (FKL.lane fkl_st_c2 5 o)))) 8 0 231 = true := by
  decide +kernel

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 231, totalAt orbit.val = total orbit := by
  intro orbit
  have hc := Nat.eq_of_beq_eq_true (FKL.allRange_sound _ 8 0 231 fkl_st_checked orbit.val orbit.isLt)
  rw [Nat.zero_add] at hc
  have h4 : totalAt orbit.val = FKL.lane fkl_st_t4 5 orbit.val := by
    have e := FKLMeta.FineWords.arr_get _ fkl_st_t4 5 0 231 fkl_st_t4_walk fkl_st_t4_len orbit.val orbit.isLt
    rw [Nat.zero_add] at e; exact e
  have h3 : ∀ x : Fin 21, OrbitLevel3.total x = FKL.lane fkl_st_t3 5 x.val := by
    intro x
    rw [← OrbitLevel3.totalAt_correct x]
    have e := FKLMeta.FineWords.arr_get _ fkl_st_t3 5 0 21 fkl_st_t3_walk fkl_st_t3_len x.val x.isLt
    rw [Nat.zero_add] at e; exact e
  have hco : orbit.val < columns.toList.length := by rw [Array.length_toList]; exact orbit.isLt
  have e := FKLMeta.walk_sound _ _ 0 fkl_st_cols_walk orbit.val hco
  simp only [Nat.zero_add, Bool.and_eq_true, Nat.beq_eq] at e
  unfold total MatrixBounds.Entropy.PairEncoding.statistic
  rw [h3, h3, h4, hc]
  have hcol : (encoding.columns orbit) = columns.toList[orbit.val] := by
    show columns[orbit.val] = _
    rw [Array.getElem_toList]
  rw [hcol, e.1, e.2]
  rfl
end OrbitLevel4

end MatrixBounds.Numeric
