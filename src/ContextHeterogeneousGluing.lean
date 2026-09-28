import ContextTypeGluing
import HeterogeneousTypeGluing

/-! Products of exact interfaces yield complete accepted products inside
arbitrary companion tensors, including independent earlier batches. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K U V W : Type*} [Fintype T] [CommSemiring K]
variable {Positions X Y Z BX BY BZ : T → Type*} [∀ type, Fintype (Positions type)]

/-- Exact heterogeneous variables restrict to the ambient fiber of the same empirical profiles in every context. -/
theorem contextReduction_exact_to_profile_fibers (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (profileX : ∀ type, Profiles (Positions type) (BX type)) (profileY : ∀ type, Profiles (Positions type) (BY type))
    (profileZ : ∀ type, Profiles (Positions type) (BZ type)) :
    ContextReduction.{v} (heterogeneous (fun type => exact (P := Positions type)
      (family type) (partX type) (partY type) (partZ type)
      (fun symbol => (profileX type symbol).val) (fun symbol => (profileY type symbol).val) (fun symbol => (profileZ type symbol).val)))
      (subtypeTensor (heterogeneousPower (Positions := Positions) family)
        (fun x => poolProfiles partX x = profileX) (fun y => poolProfiles partY y = profileY)
        (fun z => poolProfiles partZ z = profileZ)) 1 :=
  contextReduction_pullback _ (profileFiberVariables partX profileX)
    (profileFiberVariables partY profileY) (profileFiberVariables partZ profileZ)

variable [∀ type, Fintype (X type)] [∀ type, Fintype (Y type)] [∀ type, Fintype (Z type)]
variable [∀ type, Fintype (BX type)] [∀ type, Fintype (BY type)] [∀ type, Fintype (BZ type)]

/-- A common contextual extraction for each accepted profile glues into the full heterogeneous output batch. -/
theorem contextReduction_glue_heterogeneous (source : Coeff K U V W)
    (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (acceptX : (∀ type, Profiles (Positions type) (BX type)) → Prop)
    (acceptY : (∀ type, Profiles (Positions type) (BY type)) → Prop)
    (acceptZ : (∀ type, Profiles (Positions type) (BZ type)) → Prop) (copies cost : ℕ)
    (reductions : ∀ profileX profileY profileZ, acceptX profileX → acceptY profileY → acceptZ profileZ →
      ContextReduction.{v} source (directSum (fun _ : Fin copies => heterogeneous (fun type => exact (P := Positions type)
        (family type) (partX type) (partY type) (partZ type)
        (fun symbol => (profileX type symbol).val) (fun symbol => (profileY type symbol).val) (fun symbol => (profileZ type symbol).val)))) cost) :
    ContextReduction.{v} source (directSum (fun _ : Fin copies => acceptedTensor (heterogeneousPower (Positions := Positions) family)
      (poolProfiles partX) (poolProfiles partY) (poolProfiles partZ) acceptX acceptY acceptZ))
      (Fintype.card ((∀ type, Profiles (Positions type) (BX type)) ×
        (∀ type, Profiles (Positions type) (BY type)) × (∀ type, Profiles (Positions type) (BZ type)))*cost) := by
  apply contextReduction_glue_exact_types _ _ _ _ _ _ _ _ copies cost
  intro labels acceptedX acceptedY acceptedZ
  have fibers := (contextReduction_exact_to_profile_fibers.{v} family partX partY partZ labels.1 labels.2.1 labels.2.2).batch (I := Fin copies)
  simpa only [one_mul] using (reductions labels.1 labels.2.1 labels.2.2 acceptedX acceptedY acceptedZ).trans fibers

end
end MatrixBounds.Interface
