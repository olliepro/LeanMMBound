module

public import ApproximateProfiles
public import HeterogeneousMasks

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A common physical form for approximate tensor powers, with neutral empty
position pools. This exposes the interface used by successive extractions. -/
namespace MatrixBounds.Interface

open Tensor Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K P X Y Z BX BY BZ : Type*} [CommSemiring K] [Fintype P]

/-- The empty-pool convention for empirical windows on actual axis words. -/
def activeWithin {B : Type*} (law : B → ℝ) (tolerance : ℝ) (word : P → B) : Prop :=
  Fintype.card P = 0 ∨ Within law tolerance word

/-- Reading an actual word's profile gives exactly its active empirical-window test. -/
theorem activeProfileWithin_word {B : Type*} (law : B → ℝ) (tolerance : ℝ) (word : P → B) :
    ActiveProfileWithin law tolerance (profileOf word) ↔ activeWithin law tolerance word := Iff.rfl

/-- An approximate tensor power keeps complete empirical laws independently on its three axes. -/
def windowedPower (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) :
    Coeff K (P → X) (P → Y) (P → Z) :=
  acceptedTensor (heterogeneous (fun _ : P => tensor))
    (fun entries position => partX (entries position)) (fun entries position => partY (entries position))
    (fun entries position => partZ (entries position))
    (activeWithin lawX tolerance) (activeWithin lawY tolerance) (activeWithin lawZ tolerance)

/-- Nonempty pools use the usual coordinatewise empirical window. -/
theorem activeWithin_nonempty [Nonempty P] {B : Type*} (law : B → ℝ) (tolerance : ℝ) (word : P → B) :
    activeWithin law tolerance word ↔ Within law tolerance word := by
  simp only [activeWithin, (Fintype.card_pos (α := P)).ne', false_or]

/-- Empty tensor powers have coefficient one and impose no law constraints. -/
theorem windowedPower_empty (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) (empty : Fintype.card P = 0)
    (x : P → X) (y : P → Y) (z : P → Z) :
    windowedPower tensor partX partY partZ lawX lawY lawZ tolerance x y z = 1 := by
  haveI : IsEmpty P := Fintype.card_eq_zero_iff.mp empty
  simp only [windowedPower, acceptedTensor, activeWithin, empty, true_or, and_self, if_true,
    heterogeneous, Finset.univ_eq_empty, Finset.prod_empty]

/-- Factorwise empirical windows equal one global conjunction of all labelled profile tests. -/
theorem heterogeneous_windowedPower {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)]
    {X Y Z BX BY BZ : T → Type*} (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ) :
    heterogeneous (fun type => windowedPower (P := Positions type) (family type)
      (partX type) (partY type) (partZ type) (lawX type) (lawY type) (lawZ type) (tolerance type)) =
    acceptedTensor (heterogeneousPower (Positions := Positions) family)
      (poolProfiles partX) (poolProfiles partY) (poolProfiles partZ)
      (fun profile => ∀ type, ActiveProfileWithin (lawX type) (tolerance type) (profile type))
      (fun profile => ∀ type, ActiveProfileWithin (lawY type) (tolerance type) (profile type))
      (fun profile => ∀ type, ActiveProfileWithin (lawZ type) (tolerance type) (profile type)) := by
  have identity := heterogeneous_accepted (fun type => heterogeneous (fun _ : Positions type => family type))
    (fun type entries => activeWithin (lawX type) (tolerance type) (fun p => partX type (entries p)))
    (fun type entries => activeWithin (lawY type) (tolerance type) (fun p => partY type (entries p)))
    (fun type entries => activeWithin (lawZ type) (tolerance type) (fun p => partZ type (entries p)))
  exact identity

end
end MatrixBounds.Interface
