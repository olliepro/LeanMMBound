import HashSurvivors

/-! The finite selection step of mixed-level extraction: one common hash keeps
many prescribed edges with small fine-Y and fine-Z collision-hole sets. -/
namespace MatrixBounds.Selection

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Three arbitrary bad events each of probability at most one sixth leave at least half. -/
theorem three_events_half {Outcome : Type*} [Fintype Outcome]
    (badX badY badZ : Outcome → Prop)
    (smallX : Nat.card {seed // badX seed}*6 ≤ Fintype.card Outcome)
    (smallY : Nat.card {seed // badY seed}*6 ≤ Fintype.card Outcome)
    (smallZ : Nat.card {seed // badZ seed}*6 ≤ Fintype.card Outcome) :
    Fintype.card Outcome ≤ 2*Nat.card {seed // ¬badX seed ∧ ¬badY seed ∧ ¬badZ seed} := by
  let bad : Fin 3 → Outcome → Prop := fun stage =>
    if stage = 0 then badX else if stage = 1 then badY else badZ
  have bound := three_stage_half bad (by
    intro stage
    fin_cases stage
    · simpa only [bad, ↓reduceIte] using smallX
    · simpa only [bad, ↓reduceIte] using smallY
    · simpa only [bad, ↓reduceIte] using smallZ)
  simpa [bad, Fin.exists_fin_succ] using bound

/-- Coarse uniqueness plus Markov bounds for both fine axes gives half-survival.
The modulus includes one inverse-hole-scale factor for each fine axis. -/
theorem collision_good_fraction {Outcome BY BZ : Type*}
    [Fintype Outcome] [Fintype BY] [Fintype BZ] [Nonempty BY] [Nonempty BZ]
    (badX : Outcome → Prop) (holesY : Outcome → BY → Prop) (holesZ : Outcome → BZ → Prop)
    (modulus degreeX degreeY degreeZ scale : ℕ) (positive : 0 < modulus)
    (boundX : Nat.card {seed // badX seed}*modulus ≤ degreeX*Fintype.card Outcome)
    (boundY : ∀ block, Nat.card {seed // holesY seed block}*modulus ≤ degreeY*Fintype.card Outcome)
    (boundZ : ∀ block, Nat.card {seed // holesZ seed block}*modulus ≤ degreeZ*Fintype.card Outcome)
    (largeX : 6*degreeX ≤ modulus) (largeY : 6*(scale*degreeY) ≤ modulus)
    (largeZ : 6*(scale*degreeZ) ≤ modulus) :
    Fintype.card Outcome ≤ 2*Nat.card {seed // ¬badX seed ∧
      Nat.card {block // holesY seed block}*scale < Fintype.card BY ∧
      Nat.card {block // holesZ seed block}*scale < Fintype.card BZ} := by
  have y := event_modulus_slack
    (fun seed => Fintype.card BY ≤ Nat.card {block // holesY seed block}*scale)
    modulus (scale*degreeY) 6 positive (many_holes_count holesY modulus degreeY scale boundY) largeY
  have z := event_modulus_slack
    (fun seed => Fintype.card BZ ≤ Nat.card {block // holesZ seed block}*scale)
    modulus (scale*degreeZ) 6 positive (many_holes_count holesZ modulus degreeZ scale boundZ) largeZ
  simpa only [not_le] using three_events_half badX _ _
    (event_modulus_slack badX modulus degreeX 6 positive boundX largeX) y z

end
end MatrixBounds.Selection

namespace MatrixBounds.HashCounting

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {F P E BY BZ : Type*} [Field F] [Fintype F] [Fintype P] [DecidableEq P] [Fintype E]
variable [Fintype BY] [Fintype BZ] [Nonempty BY] [Nonempty BZ]

/-- The selected edge has a unique coarse-X owner and inverse-scale sparse holes on both fine axes. -/
def GoodCollisionEdge (badX : Seed F P → E → Prop)
    (holesY : Seed F P → E → BY → Prop) (holesZ : Seed F P → E → BZ → Prop)
    (scale : ℕ) (seed : Seed F P) (edge : E) : Prop :=
  ¬badX seed edge ∧ Nat.card {block // holesY seed edge block}*scale < Fintype.card BY ∧
    Nat.card {block // holesZ seed edge block}*scale < Fintype.card BZ

/-- All three collision stages use one common seed and retain the claimed finite number of edges. -/
theorem exists_mixed_selection (x y : E → P → F) (buckets : Finset F)
    (badX : Seed F P → E → Prop)
    (holesY : Seed F P → E → BY → Prop) (holesZ : Seed F P → E → BZ → Prop)
    (degreeX degreeY degreeZ scale : ℕ)
    (boundX : ∀ edge bucket, bucket ∈ buckets →
      Nat.card {seed : BucketEvent (x edge) (y edge) bucket // badX seed.val edge}*Fintype.card F ≤
        degreeX*Nat.card (BucketEvent (x edge) (y edge) bucket))
    (boundY : ∀ edge bucket, bucket ∈ buckets → ∀ block,
      Nat.card {seed : BucketEvent (x edge) (y edge) bucket // holesY seed.val edge block}*Fintype.card F ≤
        degreeY*Nat.card (BucketEvent (x edge) (y edge) bucket))
    (boundZ : ∀ edge bucket, bucket ∈ buckets → ∀ block,
      Nat.card {seed : BucketEvent (x edge) (y edge) bucket // holesZ seed.val edge block}*Fintype.card F ≤
        degreeZ*Nat.card (BucketEvent (x edge) (y edge) bucket))
    (largeX : 6*degreeX ≤ Fintype.card F) (largeY : 6*(scale*degreeY) ≤ Fintype.card F)
    (largeZ : 6*(scale*degreeZ) ≤ Fintype.card F) :
    ∃ seed : Seed F P, Fintype.card E*buckets.card ≤ 2*(Fintype.card F)^2*
      Nat.card {edge // hashX seed.2.1 seed.1 (x edge) ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 (y edge) = hashX seed.2.1 seed.1 (x edge) ∧
        GoodCollisionEdge badX holesY holesZ scale seed edge} := by
  apply exists_many_surviving_edges x y buckets (GoodCollisionEdge badX holesY holesZ scale)
  intro edge bucket member
  have checked := Selection.collision_good_fraction (fun seed : BucketEvent (x edge) (y edge) bucket => badX seed.val edge)
    (fun seed block => holesY seed.val edge block) (fun seed block => holesZ seed.val edge block)
    (Fintype.card F) degreeX degreeY degreeZ scale Fintype.card_pos
    (by simpa only [Nat.card_eq_fintype_card] using boundX edge bucket member)
    (by intro block; simpa only [Nat.card_eq_fintype_card] using boundY edge bucket member block)
    (by intro block; simpa only [Nat.card_eq_fintype_card] using boundZ edge bucket member block)
    largeX largeY largeZ
  simpa only [GoodCollisionEdge, Nat.card_eq_fintype_card] using checked

end
end MatrixBounds.HashCounting
