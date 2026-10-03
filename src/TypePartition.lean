module

public import EmpiricalTypes
public import TensorCore

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact-type partitions of approximate interfaces. An arbitrary accepted set
of integer profiles covers tolerance windows and other finite type restrictions. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P]

/-- Every empirical count lies between zero and the number of positions. -/
theorem count_le_positions (word : P → B) (symbol : B) : count word symbol ≤ Fintype.card P := by
  classical
  simpa only [count, Nat.card_eq_fintype_card] using
    Fintype.card_subtype_le (fun p => word p = symbol)

/-- Finite space of all integer profiles, including infeasible ones for convenient counting. -/
abbrev Profiles (P B : Type*) [Fintype P] := B → Fin (Fintype.card P + 1)

/-- The unique bounded profile of a word. -/
def profileOf (word : P → B) : Profiles P B :=
  fun symbol => ⟨count word symbol, Nat.lt_succ_of_le (count_le_positions word symbol)⟩

/-- Fixed alphabets give only polynomially many possible empirical profiles. -/
theorem profiles_card [Fintype B] :
    Fintype.card (Profiles P B) = (Fintype.card P + 1) ^ Fintype.card B := by
  simp only [Profiles, Fintype.card_fun, Fintype.card_fin]

open MatrixBounds.Tensor
variable {K X Y Z PX PY PZ : Type*} [CommSemiring K]
variable [Fintype PX] [Fintype PY] [Fintype PZ]

/-- Restrict a tensor to one prescribed triple of finite type labels. -/
def exactPiece (tensor : Coeff K X Y Z) (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (labels : PX × PY × PZ) : Coeff K X Y Z := fun x y z =>
  if typeX x = labels.1 ∧ typeY y = labels.2.1 ∧ typeZ z = labels.2.2 then tensor x y z else 0

/-- Select all triples whose three empirical labels are accepted. -/
def acceptedTensor (tensor : Coeff K X Y Z) (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) : Coeff K X Y Z :=
  fun x y z => if acceptX (typeX x) ∧ acceptY (typeY y) ∧ acceptZ (typeZ z) then tensor x y z else 0

/-- Accepted exact-type pieces partition the accepted tensor, with each coefficient counted once. -/
theorem sum_exact_pieces (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) :
    (fun x y z => ∑ labels : PX × PY × PZ,
      if acceptX labels.1 ∧ acceptY labels.2.1 ∧ acceptZ labels.2.2
      then exactPiece tensor typeX typeY typeZ labels x y z else 0) =
      acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ := by
  funext x y z
  rw [Finset.sum_eq_single (typeX x, typeY y, typeZ z)]
  · simp [exactPiece, acceptedTensor]
  · intro labels _ different
    have mismatch : ¬ (typeX x = labels.1 ∧ typeY y = labels.2.1 ∧ typeZ z = labels.2.2) := by
      intro h
      apply different
      exact Prod.ext h.1.symm (Prod.ext h.2.1.symm h.2.2.symm)
    simp [exactPiece, mismatch]
  · simp

/-- Type-piece gluing is an actual tensor restriction from independent sources. -/
theorem glue_exact_pieces [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (tensor : Coeff K X Y Z) (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) :
    restrict identify identify identify
      (directSum (fun labels : PX × PY × PZ =>
        if acceptX labels.1 ∧ acceptY labels.2.1 ∧ acceptZ labels.2.2
        then exactPiece tensor typeX typeY typeZ labels else fun _ _ _ => 0)) =
      acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ := by
  rw [identify_directSum]
  convert sum_exact_pieces tensor typeX typeY typeZ acceptX acceptY acceptZ using 1
  funext x y z
  apply Finset.sum_congr rfl
  intro labels _
  split_ifs <;> rfl

end
end MatrixBounds.Empirical
