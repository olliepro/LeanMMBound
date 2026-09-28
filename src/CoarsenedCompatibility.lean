import PooledCompatibility

/-! Exact labelled child profiles imply their pooled compatibility profiles.
The pooled profile is the sum over the child labels in its sector. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Slot Child Sector B : Type*}

/-- Joint empirical counts of sector labels and fine symbols are sector counts. -/
theorem count_joint (label : Slot → Child) (word : Slot → B) (child : Child) (symbol : B) :
    count (fun slot => (label slot, word slot)) (child, symbol) =
      sectorCount label word child symbol := by
  apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
  intro slot
  simp only [Prod.mk.injEq]

/-- Merging child labels sums their integer fine-symbol profiles, retaining every fine symbol. -/
def pooledProfile [Fintype Child] (profile : Child → B → ℕ) (sector : Child → Sector)
    (label : Sector) (symbol : B) : ℕ :=
  ∑ child, if sector child = label then profile child symbol else 0

/-- Projecting the joint child/symbol profile gives precisely the pooled profile. -/
theorem marginal_joint_profile [Fintype Child] [Fintype B]
    (profile : Child → B → ℕ) (sector : Child → Sector) (label : Sector) (symbol : B) :
    marginalProfile (fun pair : Child × B => profile pair.1 pair.2)
      (fun pair => (sector pair.1, pair.2)) (label, symbol) =
      pooledProfile profile sector label symbol := by
  unfold marginalProfile pooledProfile
  rw [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro child _
  by_cases same : sector child = label
  · simp [same]
  · simp [same]

/-- Every fully typed child word satisfies the corresponding pooled compatibility test. -/
theorem sectorCompatible_coarsen [Fintype Slot] [Fintype Child] [Fintype B]
    (label : Slot → Child) (profile : Child → B → ℕ) (sector : Child → Sector)
    (word : Slot → B) (typed : SectorCompatible label profile word) :
    SectorCompatible (fun slot => sector (label slot)) (pooledProfile profile sector) word := by
  have joint : HasType (fun pair : Child × B => profile pair.1 pair.2)
      (fun slot => (label slot, word slot)) := by
    rintro ⟨child, symbol⟩
    rw [count_joint]
    exact typed child symbol
  have projected := hasType_projected (fun pair : Child × B => profile pair.1 pair.2)
    (fun pair => (sector pair.1, pair.2)) (fun slot => (label slot, word slot)) joint
  intro pooled symbol
  have result := projected (pooled, symbol)
  rw [count_joint, marginal_joint_profile] at result
  exact result

end
end MatrixBounds.Empirical
