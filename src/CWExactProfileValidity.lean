import CWTypedInterfaces
import TypeBatchGluing

/-! Every nonzero exact CW interface automatically has feasible supported
profiles and the forced complementary profiles in zero-coordinate sectors.
Invalid exact-type tuples therefore contribute only the zero tensor when gluing. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K P : Type*} [CommRing K] [Fintype P] {q length : ℕ}

omit [Fintype P] in
/-- Physical exact-interface coordinates have no fine-profile mass outside their coarse axis total. -/
theorem exact_profile_supported {total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    (entry : Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)
    (symbol : Fin length → Fin 3) (outside : fineTotal symbol ≠ total) : profile symbol = 0 := by
  rw [← entry.property symbol]
  letI : IsEmpty {position : P // fineWord (entry.val position).val = symbol} :=
    ⟨fun position => outside ((congrArg fineTotal position.property).symm.trans (fine_part_total (entry.val position.val)))⟩
  exact Nat.card_of_isEmpty

/-- All profile conditions required for a nonzero exact child tensor, including zero-sector complements. -/
structure ExactProfilesValid (Positions : Type*) [Fintype Positions] (length : ℕ) (shape : Shape)
    (profileX profileY profileZ : (Fin length → Fin 3) → ℕ) : Prop where
  /-- The exact X fine type is realizable. -/
  feasibleX : Nonempty (TypedWord (P := Positions) profileX)
  /-- The exact Y fine type is realizable. -/
  feasibleY : Nonempty (TypedWord (P := Positions) profileY)
  /-- The exact Z fine type is realizable. -/
  feasibleZ : Nonempty (TypedWord (P := Positions) profileZ)
  /-- X counts respect the coarse total. -/
  supportX : ∀ symbol, fineTotal symbol ≠ shape.x → profileX symbol = 0
  /-- Y counts respect the coarse total. -/
  supportY : ∀ symbol, fineTotal symbol ≠ shape.y → profileY symbol = 0
  /-- Z counts respect the coarse total. -/
  supportZ : ∀ symbol, fineTotal symbol ≠ shape.z → profileZ symbol = 0
  /-- A zero Z axis forces complementary X and Y types. -/
  zeroZ : shape.z = 0 → ∀ symbol, profileY symbol = profileX ((fineComplement length).symm symbol)
  /-- A zero X axis forces complementary Y and Z types. -/
  zeroX : shape.x = 0 → ∀ symbol, profileZ symbol = profileY ((fineComplement length).symm symbol)
  /-- A zero Y axis forces complementary X and Z types. -/
  zeroY : shape.y = 0 → ∀ symbol, profileZ symbol = profileX ((fineComplement length).symm symbol)

/-- Any actual nonzero exact-interface coefficient witnesses every required child-profile condition. -/
theorem exact_profiles_valid (shape : Shape) (profileX profileY profileZ : (Fin length → Fin 3) → ℕ)
    (x : Interface.Variable (P := P) (fun x : AxisVariable q length shape.x => fineWord x.val) profileX)
    (y : Interface.Variable (P := P) (fun y : AxisVariable q length shape.y => fineWord y.val) profileY)
    (z : Interface.Variable (P := P) (fun z : AxisVariable q length shape.z => fineWord z.val) profileZ)
    (nonzero : Interface.exact (constituent (K := K) q length shape) (fun x => fineWord x.val)
      (fun y => fineWord y.val) (fun z => fineWord z.val) profileX profileY profileZ x y z ≠ 0) :
    ExactProfilesValid P length shape profileX profileY profileZ := by
  have positionNonzero (position : P) : wordPower (tensor (K := K) q) length
      (x.val position).val (y.val position).val (z.val position).val ≠ 0 := by
    intro vanished
    exact nonzero (Finset.prod_eq_zero (Finset.mem_univ position) vanished)
  refine ⟨⟨Interface.partWord _ _ x⟩, ⟨Interface.partWord _ _ y⟩, ⟨Interface.partWord _ _ z⟩,
    exact_profile_supported profileX x, exact_profile_supported profileY y, exact_profile_supported profileZ z,
    ?_, ?_, ?_⟩
  · intro zero symbol
    have forced := zero_z_type_forced (fun p => (x.val p).val) (fun p => (y.val p).val) (fun p => (z.val p).val)
      profileX positionNonzero (fun p => (z.val p).property.trans zero) x.property
    exact (y.property symbol).symm.trans (forced symbol)
  · intro zero symbol
    have forced := zero_x_type_forced (fun p => (x.val p).val) (fun p => (y.val p).val) (fun p => (z.val p).val)
      profileY positionNonzero (fun p => (x.val p).property.trans zero) y.property
    exact (z.property symbol).symm.trans (forced symbol)
  · intro zero symbol
    have forced := zero_y_type_forced_from_x (fun p => (x.val p).val) (fun p => (y.val p).val) (fun p => (z.val p).val)
      profileX positionNonzero (fun p => (y.val p).property.trans zero) x.property
    exact (z.property symbol).symm.trans (forced symbol)

/-- Any exact-profile tuple failing the required support, feasibility, or complement conditions has identically zero coefficients. -/
theorem exact_invalid_zero (shape : Shape) (profileX profileY profileZ : (Fin length → Fin 3) → ℕ)
    (invalid : ¬ExactProfilesValid P length shape profileX profileY profileZ) :
    Interface.exact (P := P) (constituent (K := K) q length shape) (fun x => fineWord x.val)
      (fun y => fineWord y.val) (fun z => fineWord z.val) profileX profileY profileZ = fun _ _ _ => 0 := by
  funext x y z
  by_contra nonzero
  exact invalid (exact_profiles_valid shape profileX profileY profileZ x y z nonzero)

end
end MatrixBounds.Tensor.CW
