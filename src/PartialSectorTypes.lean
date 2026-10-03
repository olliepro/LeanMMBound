module

public import CoarsenedCompatibility

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A variable-only pooled type together with forced child types implies the
finer asymmetric compatibility test. Unforced children remain pooled. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Slot Child Sector B : Type*}

/-- Keep each forced child label separately and pool every other child by its coarse index. -/
def partialClass (forced : Child → Prop) (sector : Child → Sector) (child : Child) : Child ⊕ Sector :=
  if forced child then Sum.inl child else Sum.inr (sector child)

/-- A separate class contains exactly its named child when that child is forced. -/
theorem partialClass_eq_inl (forced : Child → Prop) (sector : Child → Sector) (child target : Child) :
    partialClass forced sector child = Sum.inl target ↔ child = target ∧ forced child := by
  by_cases chosen : forced child <;> simp [partialClass, chosen]

/-- A pooled class contains exactly the unforced children with its coarse index. -/
theorem partialClass_eq_inr (forced : Child → Prop) (sector : Child → Sector) (child : Child) (label : Sector) :
    partialClass forced sector child = Sum.inr label ↔ ¬forced child ∧ sector child = label := by
  by_cases chosen : forced child <;> simp [partialClass, chosen]

/-- The sum of forced and unforced masses in a sector is the full pooled mass. -/
theorem partial_mass_partition [Fintype Child] (mass : Child → ℕ)
    (forced : Child → Prop) (sector : Child → Sector) (label : Sector) :
    (∑ child, if forced child ∧ sector child = label then mass child else 0) +
      (∑ child, if ¬forced child ∧ sector child = label then mass child else 0) =
        ∑ child, if sector child = label then mass child else 0 := by
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro child _
  by_cases chosen : forced child <;> by_cases same : sector child = label <;> simp [chosen, same]

/-- Equal pooled masses and equal forced entries imply equal refined compatibility profiles. -/
theorem partial_profile_eq [Fintype Child] (actual target : Child → B → ℕ)
    (forced : Child → Prop) (sector : Child → Sector)
    (pooled : pooledProfile actual sector = pooledProfile target sector)
    (known : ∀ child, forced child → actual child = target child) :
    pooledProfile actual (partialClass forced sector) = pooledProfile target (partialClass forced sector) := by
  funext label symbol
  cases label with
  | inl child =>
    unfold pooledProfile
    apply Finset.sum_congr rfl
    intro other _
    by_cases belongs : partialClass forced sector other = Sum.inl child
    · rw [if_pos belongs, if_pos belongs, known other ((partialClass_eq_inl forced sector other child).mp belongs).2]
    · rw [if_neg belongs, if_neg belongs]
  | inr label =>
    have total := congrFun (congrFun pooled label) symbol
    have fixed : (∑ child, if forced child ∧ sector child = label then actual child symbol else 0) =
        ∑ child, if forced child ∧ sector child = label then target child symbol else 0 := by
      apply Finset.sum_congr rfl
      intro child _
      by_cases condition : forced child ∧ sector child = label
      · rw [if_pos condition, if_pos condition, known child condition.1]
      · rw [if_neg condition, if_neg condition]
    have actualPartition := partial_mass_partition (fun child => actual child symbol) forced sector label
    have targetPartition := partial_mass_partition (fun child => target child symbol) forced sector label
    simp only [pooledProfile, partialClass_eq_inr] at total ⊢
    omega

/-- Coarsening the labels of any word sums its actual sector counts. -/
theorem sectorCount_coarsen [Fintype Slot] [Fintype Child] [Fintype B]
    (label : Slot → Child) (word : Slot → B) (sector : Child → Sector) :
    sectorCount (fun slot => sector (label slot)) word = pooledProfile (sectorCount label word) sector := by
  exact funext (fun pooled => funext (fun symbol =>
    sectorCompatible_coarsen label (sectorCount label word) sector word (fun _ _ => rfl) pooled symbol))

/-- Pooled variable restrictions and forced child profiles imply the asymmetric compatibility predicate.
The forced types can come from zero-coordinate tensor coefficients; no monomial deletion is used. -/
theorem sectorCompatible_partial [Fintype Slot] [Fintype Child] [Fintype B]
    (label : Slot → Child) (profile : Child → B → ℕ) (forced : Child → Prop) (sector : Child → Sector)
    (word : Slot → B)
    (pooled : SectorCompatible (fun slot => sector (label slot)) (pooledProfile profile sector) word)
    (known : ∀ child, forced child → ∀ symbol, sectorCount label word child symbol = profile child symbol) :
    SectorCompatible (fun slot => partialClass forced sector (label slot))
      (pooledProfile profile (partialClass forced sector)) word := by
  have total : pooledProfile (sectorCount label word) sector = pooledProfile profile sector := by
    rw [← sectorCount_coarsen]
    exact funext (fun pooledLabel => funext (pooled pooledLabel))
  have refined := partial_profile_eq (sectorCount label word) profile forced sector total
    (fun child chosen => funext (known child chosen))
  intro pooledLabel symbol
  rw [congrFun (congrFun (sectorCount_coarsen label word (partialClass forced sector)) pooledLabel) symbol]
  exact congrFun (congrFun refined pooledLabel) symbol

end
end MatrixBounds.Empirical
