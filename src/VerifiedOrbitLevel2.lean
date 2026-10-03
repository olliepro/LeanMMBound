module

public import FineWordOrbits
public import FiniteIndexBlocks

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact supplied recursive orbit metadata, checked against actual fine words. -/
namespace MatrixBounds.Numeric.OrbitLevel2
open MatrixBounds.Entropy
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Exact lexicographic unordered child-orbit columns. -/
def columns : Array (Fin 3 × Fin 3) := #[
  (0,0),(0,1),(0,2),(1,1),(1,2),(2,2)
]

/-- Exact code of each ordered child-orbit pair, with its left index varying slowest. -/
def codes : Array (Fin 6) := #[
  0,1,2,1,3,4,2,4,5
]

/-- The concrete encoding identifies precisely left/right exchange and retains every unordered pair. -/
def encoding : PairEncoding 3 6 where
  columns orbit := columns[orbit.val]'(by change orbit.val < 6; exact orbit.isLt)
  code pair :=
    let lower := min pair.1.val pair.2.val
    let upper := max pair.1.val pair.2.val
    ⟨(lower*3-lower*(lower+1)/2+upper)%6, Nat.mod_lt _ (by decide +kernel)⟩
  code_columns := by decide +kernel
  columns_code := by decide +kernel

/-- Actual complete fine-word orbits obtained from the two recursive child halves. -/
def orbits : OrbitMap (Fin 2 → Fin 3) (Fin 6) :=
  encoding.wordOrbits oneLetterOrbits

/-- Consecutive exact labels from the original supplied word-to-orbit map. -/
def mapChunk000 : Array ℕ := #[
  0,1,2,1,3,4,2,4,5
]

/-- The original supplied map, with bounded chunks preserving each exact word index. -/
def suppliedMap (index : Fin 9) : ℕ :=
  match index.val/256 with
  | 0 => mapChunk000[index.val%256]?.getD 0
  | _ => 0


/-- The exact finite assertion checked at one supplied index. -/
def map_checked_predicate (index : Fin 9) : Prop := (orbits.label (fineWordColumns 2 index)).val = suppliedMap index

/-- One bounded block of the complete exact finite check. -/
theorem map_checked_block000 : ∀ index : Fin 9,
    map_checked_predicate (blockIndex 0 9 (by decide +kernel) index) := by unfold map_checked_predicate; decide +kernel

/-- The bounded checks cover every supplied index without an unchecked remainder. -/
theorem map_checked (index : Fin 9) : map_checked_predicate index := by
  have := index.isLt
  exact of_block_check (by decide +kernel) map_checked_block000 index (by omega) (by omega)


/-- The original supplied orbit-size metadata. -/
def suppliedSizes : Array ℕ := #[
  1,2,2,1,2,1
]

/-- Read the exact claimed size of a supplied orbit. -/
def sizes (orbit : Fin 6) : ℕ :=
  suppliedSizes[orbit.val]'(by change orbit.val < 6; exact orbit.isLt)

/-- The exact finite assertion checked at one supplied index. -/
def recursive_sizes_checked_predicate (index : Fin 6) : Prop := encoding.parentSize (fun _ : Fin 3 => 1) index = sizes index

/-- One bounded block of the complete exact finite check. -/
theorem recursive_sizes_checked_block000 : ∀ index : Fin 6,
    recursive_sizes_checked_predicate (blockIndex 0 6 (by decide +kernel) index) := by unfold recursive_sizes_checked_predicate; decide +kernel

/-- The bounded checks cover every supplied index without an unchecked remainder. -/
theorem recursive_sizes_checked (index : Fin 6) : recursive_sizes_checked_predicate index := by
  have := index.isLt
  exact of_block_check (by decide +kernel) recursive_sizes_checked_block000 index (by omega) (by omega)


/-- Every supplied size is the actual number of complete fine words in its verified orbit. -/
theorem sizes_correct (orbit : Fin 6) : orbits.size orbit = sizes orbit := by
  unfold orbits
  rw [PairEncoding.wordOrbits_size, PairEncoding.pairOrbit_size_evaluator]
  have childSizes : oneLetterOrbits.size = (fun _ : Fin 3 => 1) := funext oneLetterOrbits_size
  rw [childSizes]
  exact recursive_sizes_checked orbit

end MatrixBounds.Numeric.OrbitLevel2
