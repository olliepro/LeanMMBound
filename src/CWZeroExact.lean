module

public import CWTypedDimensions
public import CWZeroMatrix

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact zero-coordinate CW interfaces contain matrix multiplication tensors
whose nontrivial dimension is the actual typed coordinate count. -/
namespace MatrixBounds.Tensor.CW

open Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Complementing all coordinates makes the two coarse word totals sum to twice the word length. -/
theorem wordCoarse_complement_sum {q length : ℕ} (word : Fin length → Fin (q+2)) :
    wordCoarse (wordComplement q length word) + wordCoarse word = 2*length := by
  have point (position : Fin length) : coarse (complement q (word position)) + coarse (word position) = 2 := by
    rw [coarse_complement]
    exact Nat.sub_add_cancel (coarse_le_two _)
  change (∑ position, coarse (complement q (word position))) + (∑ position, coarse (word position)) = _
  rw [← Finset.sum_add_distrib]
  simp only [point, Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul]
  omega

/-- Complementing actual CW coordinates complements their complete fine words. -/
theorem fineWord_complement {q length : ℕ} (word : Fin length → Fin (q+2)) :
    fineWord (wordComplement q length word) = fineComplement length (fineWord word) := by
  funext position
  apply Fin.ext
  change coarse (complement q (word position)) = 3-(coarse (word position)+1)
  rw [coarse_complement]
  omega

/-- The complementary word belongs to the complementary coarse axis of a zero sector. -/
def complementAxis {q length total : ℕ} (entry : AxisVariable q length total) :
    AxisVariable q length (2*length-total) :=
  ⟨wordComplement q length entry.val, by
    have sum := wordCoarse_complement_sum entry.val
    rw [entry.property] at sum
    omega⟩

/-- The complete fine profile forced on the opposite nonzero axis of a zero sector. -/
def complementProfile {length : ℕ} (profile : (Fin length → Fin 3) → ℕ) : (Fin length → Fin 3) → ℕ :=
  fun symbol => profile ((fineComplement length).symm symbol)

/-- Map an exact X-interface variable to its complementary exact Y-interface variable. -/
def complementTypedVariable {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    (entry : Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile) :
    Interface.Variable (P := P) (fun y : AxisVariable q length (2*length-total) => fineWord y.val) (complementProfile profile) :=
  ⟨fun p => complementAxis (entry.val p), by
    have labels : (fun p => fineWord (complementAxis (entry.val p)).val) =
        fun p => fineComplement length (fineWord (entry.val p).val) := by
      funext p
      exact fineWord_complement _
    rw [labels]
    exact hasType_map_equiv (fineComplement length) profile _ entry.property⟩

/-- The unique coordinate word on an axis with coarse total zero. -/
def zeroAxis (q length : ℕ) : AxisVariable q length 0 :=
  ⟨fun _ => 0, by simp [wordCoarse, coarse_zero]⟩

/-- Exact fine profile of an all-zero axis repeated over the parent positions. -/
def zeroProfile (length : ℕ) : (Fin length → Fin 3) → ℕ :=
  fun symbol => if symbol = (fun _ => 0) then Fintype.card P else 0

/-- The all-zero coordinate family realizes that exact profile. -/
def zeroTypedVariable (q length : ℕ) :
    Interface.Variable (P := P) (fun z : AxisVariable q length 0 => fineWord z.val) (zeroProfile (P := P) length) :=
  ⟨fun _ => zeroAxis q length, by
    have zeroFine : fineWord (zeroAxis q length).val = (fun _ => 0) := by
      funext position
      apply Fin.ext
      exact coarse_zero q
    intro symbol
    change count (fun _ : P => fineWord (zeroAxis q length).val) symbol = zeroProfile (P := P) length symbol
    rw [zeroFine]
    simp only [count, zeroProfile, Nat.card_eq_fintype_card, Fintype.card_subtype]
    by_cases same : symbol = (fun _ => 0)
    · simp [same]
    · simp [same, eq_comm]⟩

/-- An exact zero-Z interface with complementary nonzero-axis profiles. -/
def zeroExact (q length total : ℕ) (profile : (Fin length → Fin 3) → ℕ) :=
  Interface.exact (P := P) (constituent (K := K) q length ⟨total, 2*length-total, 0⟩)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    profile (complementProfile profile) (zeroProfile (P := P) length)

/-- Products of zero-sector pairings identify exactly equal complete coordinate families. -/
theorem zero_z_family_pairing {q length : ℕ} (left right : P → Fin length → Fin (q+2)) :
    (∏ p, wordPower (tensor (K := K) q) length (left p) (wordComplement q length (right p)) (fun _ => 0)) =
      if left = right then 1 else 0 := by
  by_cases same : left = right
  · subst right
    simp [word_zero_z_pairing]
  · rw [if_neg same]
    have different : ∃ p, right p ≠ left p := by
      by_contra all
      push_neg at all
      exact same (funext (fun p => (all p).symm))
    obtain ⟨p, different⟩ := different
    apply Finset.prod_eq_zero (Finset.mem_univ p)
    rw [word_zero_z_pairing]
    simp only [Equiv.apply_eq_iff_eq, if_neg different]

/-- The exact zero-sector interface restricts to a genuine 1-by-dimension-by-1 matrix tensor. -/
theorem zero_exact_matrix_identity {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ) :
    (fun (x : PUnit × Interface.Variable (P := P) (fun v : AxisVariable q length total => fineWord v.val) profile)
      (y : Interface.Variable (P := P) (fun v : AxisVariable q length total => fineWord v.val) profile × PUnit)
      (_z : PUnit × PUnit) => zeroExact (K := K) (P := P) q length total profile x.2
        (complementTypedVariable profile y.1) (zeroTypedVariable q length)) =
      MatrixMul.tensor (K := K) := by
  funext x y z
  change (∏ p, wordPower (tensor (K := K) q) length (x.2.val p).val
    (wordComplement q length (y.1.val p).val) (fun _ => 0)) = _
  rw [zero_z_family_pairing]
  have same : (fun p => (x.2.val p).val) = (fun p => (y.1.val p).val) ↔ x.2 = y.1 := by
    constructor
    · intro equal
      apply Subtype.ext
      funext p
      exact Subtype.ext (congrFun equal p)
    · intro equal
      rw [equal]
  simp only [same, MatrixMul.tensor, Subsingleton.elim x.1 z.1,
    Subsingleton.elim y.2 z.2, true_and, and_true]

/-- A certificate for the exact zero-sector interface supplies its full-dimension matrix constituent. -/
def zeroExactMatrixCertificate {q length total rank degree : ℕ}
    (profile : (Fin length → Fin 3) → ℕ)
    (certificate : Degeneration.Certificate (zeroExact (K := K) (P := P) q length total profile) rank degree) :
    Degeneration.Certificate (MatrixMul.tensor (K := K) (I := PUnit)
      (J := Interface.Variable (P := P) (fun v : AxisVariable q length total => fineWord v.val) profile)
      (L := PUnit)) rank degree := by
  rw [← zero_exact_matrix_identity profile]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.CW
