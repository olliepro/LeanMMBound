import CWMixedOwnership
import HeterogeneousMasks

/-! The global heterogeneous extraction starts from the available product of
parent interfaces. Reordering its independent masks preserves that certificate. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- The unfiltered physical product of all parent types. -/
def parentSource (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) :=
  Interface.heterogeneous (fun type => parentPower (K := K) (P := Positions type) q (length type) (data type).parent)

/-- Every type's coarse marginal test is imposed on its own physical left-child word. -/
def coarseTest (data : ∀ type, SplitRestrictionData (length type)) {q : ℕ} {axis : Shape → ℕ}
    (profile : ∀ type, Fin (2*length type+1) → ℕ) (entries : Axis Positions data q axis) : Prop :=
  ∀ type, HasType (profile type) (fun position => wordCoarseIndex (leftHalf (entries type position).val))

/-- Impose every available parent fine-word window independently. -/
def windowTest (data : ∀ type, SplitRestrictionData (length type)) {q : ℕ} {axis : Shape → ℕ}
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (entries : Axis Positions data q axis) : Prop := ∀ type, accept type (parentFine (entries type))

/-- The available source contains precisely the given parent-interface factors. -/
def parentInterface (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  Interface.heterogeneous (fun type => (data type).parentInterface (K := K) q (acceptX type) (acceptY type) (acceptZ type))

/-- Coarse filtering can be expressed as one independent mask on each global axis. -/
theorem coarseSource_eq (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) :
    coarseSource (K := K) (Positions := Positions) data q =
      acceptedTensor (parentSource (K := K) (Positions := Positions) data q) id id id
        (coarseTest data (fun type => (data type).coarseX))
        (coarseTest data (fun type => (data type).coarseY))
        (coarseTest data (fun type => (data type).coarseZ)) := by
  exact Interface.heterogeneous_accepted
    (fun type => parentPower (K := K) (P := Positions type) q (length type) (data type).parent)
    (fun type entries => HasType (data type).coarseX (fun position => wordCoarseIndex (leftHalf (entries position).val)))
    (fun type entries => HasType (data type).coarseY (fun position => wordCoarseIndex (leftHalf (entries position).val)))
    (fun type entries => HasType (data type).coarseZ (fun position => wordCoarseIndex (leftHalf (entries position).val)))

/-- Factorwise parent windows are exactly the global conjunction of their variable tests. -/
theorem parentInterface_eq (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :
    parentInterface (K := K) data q acceptX acceptY acceptZ =
      acceptedTensor (parentSource (K := K) data q) id id id
        (windowTest data acceptX) (windowTest data acceptY) (windowTest data acceptZ) := by
  exact Interface.heterogeneous_accepted
    (fun type => parentPower (K := K) (P := Positions type) q (length type) (data type).parent)
    (fun type entries => acceptX type (parentFine entries))
    (fun type entries => acceptY type (parentFine entries))
    (fun type entries => acceptZ type (parentFine entries))

variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Prepare the available interface by coarse filtering, one global hash, and the own-axis pooling tests. -/
def preparedSource (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  acceptedTensor (hashedTensor
    (acceptedTensor (parentInterface (K := K) data q acceptX acceptY acceptZ) id id id
      (coarseTest data (fun type => (data type).coarseX))
      (coarseTest data (fun type => (data type).coarseY))
      (coarseTest data (fun type => (data type).coarseZ)))
    (axisCoarse prime data) (axisCoarse prime data) (axisCoarse prime data)
    (fun position => (total length position : ZMod prime)) seed buckets) id id id (fun _ => True)
    (fun entries => ∀ type, pooledAxisType (pooledProfile (data type).fineY shapeYIndex) (entries type))
    (fun entries => ∀ type, pooledAxisType (pooledProfile (data type).fineZ shapeZIndex) (entries type))

omit [NeZero (2 : ZMod prime)] in
/-- Moving the parent windows past the coarse/hash/pool masks gives precisely the globally owned source. -/
theorem prepared_eq_pooled (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :
    preparedSource (K := K) data q seed buckets acceptX acceptY acceptZ =
      pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ := by
  funext x y z
  simp only [preparedSource, pooledSource, hashedSource, parentInterface_eq, coarseSource_eq,
    hashedTensor, acceptedTensor, windowTest, id_eq, true_and, forall_and]
  split_ifs <;> simp_all

/-- Every global preparatory restriction preserves the available interface's original rank and degree budget. -/
def prepareInterfaceCertificate (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (parentInterface (K := K) data q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ) rank degree := by
  rw [← prepared_eq_pooled data q seed buckets acceptX acceptY acceptZ]
  exact acceptedCertificate _ id id id _ _ _
    (hashCertificate (acceptedCertificate _ id id id
      (coarseTest data (fun type => (data type).coarseX))
      (coarseTest data (fun type => (data type).coarseY))
      (coarseTest data (fun type => (data type).coarseZ)) certificate)
      (axisCoarse prime data) (axisCoarse prime data) (axisCoarse prime data)
      (fun position => (total length position : ZMod prime)) seed buckets)

end
end MatrixBounds.Tensor.CW.Mixed
