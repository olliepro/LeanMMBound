module

public import TypeBatchGluing
public import HeterogeneousInterface

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Products of exact interfaces use dependent tuples of subtype coordinates.
They glue into the corresponding ambient approximate interface while preserving
all separately labelled pools, including pools with different alphabets. -/
namespace MatrixBounds.Interface

open Tensor Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K]
variable {Positions X Y Z BX BY BZ : T → Type*} [∀ type, Fintype (Positions type)]

/-- The unrestricted product of all labelled position pools. -/
def heterogeneousPower (family : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    Coeff K (∀ type, Positions type → X type) (∀ type, Positions type → Y type) (∀ type, Positions type → Z type) :=
  fun x y z => ∏ type, ∏ position, family type (x type position) (y type position) (z type position)

/-- Complete bounded empirical profiles for every separately labelled axis pool. -/
def poolProfiles (part : ∀ type, X type → BX type) (entries : ∀ type, Positions type → X type) :
    ∀ type, Profiles (Positions type) (BX type) := fun type => profileOf (fun position => part type (entries type position))

/-- A variable in an ambient profile fiber is a tuple of exact-interface variables. -/
def profileFiberVariables (part : ∀ type, X type → BX type)
    (profiles : ∀ type, Profiles (Positions type) (BX type))
    (entries : {entries : ∀ type, Positions type → X type // poolProfiles part entries = profiles}) :
    ∀ type, Variable (P := Positions type) (part type) (fun symbol => (profiles type symbol).val) :=
  fun type => ⟨entries.val type, fun symbol =>
    congrArg Fin.val (congrFun (congrFun entries.property type) symbol)⟩

/-- A batch of genuine heterogeneous exact interfaces supplies the corresponding batch of ambient type fibers. -/
theorem exact_batch_to_profile_fibers (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (profileX : ∀ type, Profiles (Positions type) (BX type)) (profileY : ∀ type, Profiles (Positions type) (BY type))
    (profileZ : ∀ type, Profiles (Positions type) (BZ type)) {copies rank : ℕ}
    (algorithm : RankLE (directSum (fun _ : Fin copies => heterogeneous (fun type => exact (P := Positions type)
      (family type) (partX type) (partY type) (partZ type)
      (fun symbol => (profileX type symbol).val) (fun symbol => (profileY type symbol).val) (fun symbol => (profileZ type symbol).val)))) rank) :
    RankLE (directSum (fun _ : Fin copies => subtypeTensor (heterogeneousPower (Positions := Positions) family)
      (fun x => poolProfiles partX x = profileX) (fun y => poolProfiles partY y = profileY)
      (fun z => poolProfiles partZ z = profileZ))) rank := by
  exact rankLE_pullback algorithm
    (fun x : Fin copies × {entries : ∀ type, Positions type → X type // poolProfiles partX entries = profileX} =>
      (x.1, profileFiberVariables partX profileX x.2))
    (fun y : Fin copies × {entries : ∀ type, Positions type → Y type // poolProfiles partY entries = profileY} =>
      (y.1, profileFiberVariables partY profileY y.2))
    (fun z : Fin copies × {entries : ∀ type, Positions type → Z type // poolProfiles partZ entries = profileZ} =>
      (z.1, profileFiberVariables partZ profileZ z.2))

variable [∀ type, Fintype (X type)] [∀ type, Fintype (Y type)] [∀ type, Fintype (Z type)]
variable [∀ type, Fintype (BX type)] [∀ type, Fintype (BY type)] [∀ type, Fintype (BZ type)]

/-- Exact heterogeneous output batches glue into the full accepted product, with one factor for the number of profile triples. -/
theorem glue_heterogeneous_exact_batches (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (acceptX : (∀ type, Profiles (Positions type) (BX type)) → Prop)
    (acceptY : (∀ type, Profiles (Positions type) (BY type)) → Prop)
    (acceptZ : (∀ type, Profiles (Positions type) (BZ type)) → Prop) (copies rank : ℕ)
    (algorithms : ∀ profileX profileY profileZ, acceptX profileX → acceptY profileY → acceptZ profileZ →
      RankLE (directSum (fun _ : Fin copies => heterogeneous (fun type => exact (P := Positions type)
        (family type) (partX type) (partY type) (partZ type)
        (fun symbol => (profileX type symbol).val) (fun symbol => (profileY type symbol).val) (fun symbol => (profileZ type symbol).val)))) rank) :
    RankLE (directSum (fun _ : Fin copies => acceptedTensor (heterogeneousPower (Positions := Positions) family)
      (poolProfiles partX) (poolProfiles partY) (poolProfiles partZ) acceptX acceptY acceptZ))
      (Fintype.card ((∀ type, Profiles (Positions type) (BX type)) ×
        (∀ type, Profiles (Positions type) (BY type)) × (∀ type, Profiles (Positions type) (BZ type)))*rank) := by
  apply glue_exact_type_batches _ _ _ _ _ _ _ copies rank
  intro labels acceptedX acceptedY acceptedZ
  exact exact_batch_to_profile_fibers family partX partY partZ labels.1 labels.2.1 labels.2.2
    (algorithms labels.1 labels.2.1 labels.2.2 acceptedX acceptedY acceptedZ)

end
end MatrixBounds.Interface
