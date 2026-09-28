import TensorBatching
import PolynomialDegeneration

/-! Extract independent tensor pieces by legitimate variable restrictions.
Unique compatibility determines the owner of each retained variable. -/
namespace MatrixBounds.Tensor.Extraction

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K X Y Z E : Type*} [CommSemiring K]

/-- Assign an object to its unique compatible edge, deleting objects with zero or multiple owners. -/
def uniqueOwner (compatible : E → X → Prop) (entry : X) : Option E :=
  if existsUnique : ∃! edge, compatible edge entry then
    some (Classical.choose existsUnique) else none

/-- A retained object is compatible with its owner and with no different edge. -/
theorem uniqueOwner_spec (compatible : E → X → Prop) (entry : X) (edge : E)
    (owned : uniqueOwner compatible entry = some edge) :
    compatible edge entry ∧ ∀ other, compatible other entry → other = edge := by
  classical
  unfold uniqueOwner at owned
  split_ifs at owned with unique
  · have same : Classical.choose unique = edge := Option.some.inj owned
    subst edge
    exact Classical.choose_spec unique

/-- Exactly one compatible edge is retained and receives that edge's label. -/
theorem uniqueOwner_eq (compatible : E → X → Prop) (entry : X) (edge : E)
    (present : compatible edge entry)
    (unique : ∀ other, compatible other entry → other = edge) :
    uniqueOwner compatible entry = some edge := by
  classical
  have existsUnique : ∃! edge, compatible edge entry := ⟨edge, present, unique⟩
  simp only [uniqueOwner, dif_pos existsUnique]
  congr 1
  exact unique _ (Classical.choose_spec existsUnique).1

/-- A compatible target retains its owner exactly when no distinct compatible competitor remains. -/
theorem uniqueOwner_no_collision (compatible : E → X → Prop) (entry : X) (edge : E)
    (present : compatible edge entry) :
    uniqueOwner compatible entry = some edge ↔ ¬∃ other, other ≠ edge ∧ compatible other entry := by
  constructor
  · intro owned ⟨other, different, competitor⟩
    exact different ((uniqueOwner_spec compatible entry edge owned).2 other competitor)
  · intro noCollision
    apply uniqueOwner_eq compatible entry edge present
    intro other competitor
    by_contra different
    exact noCollision ⟨other, different, competitor⟩

/-- The portion of a tensor whose three variables belong to a specified owner. -/
def ownedPiece (source : Coeff K X Y Z)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (edge : E) : Coeff K X Y Z :=
  fun x y z => if ownerX x = some edge ∧ ownerY y = some edge ∧ ownerZ z = some edge
    then source x y z else 0

/-- Coordinate matrix that keeps only variables assigned to the requested copy. -/
def ownerMap [DecidableEq X] (owner : X → Option E) : E × X → X → K :=
  fun target source => if owner target.2 = some target.1 ∧ source = target.2 then 1 else 0

/-- Disjoint ownership turns variable restrictions into independent tensor summands.
The maps act independently on the three axes; no individual coefficient is deleted in isolation. -/
theorem owned_pieces_restriction [Fintype X] [Fintype Y] [Fintype Z] [Fintype E]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z] [DecidableEq E]
    (source : Coeff K X Y Z)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ e f g x y z, ownerX x = some e → ownerY y = some f → ownerZ z = some g →
      source x y z ≠ 0 → e = f ∧ f = g) :
    restrict (ownerMap ownerX) (ownerMap ownerY) (ownerMap ownerZ) source =
      directSum (ownedPiece source ownerX ownerY ownerZ) := by
  classical
  funext ⟨e, x⟩ ⟨f, y⟩ ⟨g, z⟩
  simp only [restrict, mapX, mapY, mapZ, ownerMap, ite_and, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_irrel, Finset.sum_const_zero, Finset.sum_ite_eq', Finset.mem_univ, if_true]
  by_cases hx : ownerX x = some e
  · by_cases hy : ownerY y = some f
    · by_cases hz : ownerZ z = some g
      · by_cases nonzero : source x y z = 0
        · simp [hx, hy, hz, directSum, ownedPiece, nonzero]
        · obtain ⟨rfl, rfl⟩ := disjoint e f g x y z hx hy hz nonzero
          simp [hx, hy, hz, directSum, ownedPiece]
      · by_cases same : e = f ∧ f = g
        · obtain ⟨rfl, rfl⟩ := same
          simp [hx, hy, hz, directSum, ownedPiece]
        · simp [hz, directSum, same]
    · by_cases same : e = f ∧ f = g
      · obtain ⟨rfl, rfl⟩ := same
        simp [hx, hy, directSum, ownedPiece]
      · simp [hy, directSum, same]
  · by_cases same : e = f ∧ f = g
    · obtain ⟨rfl, rfl⟩ := same
      simp [hx, directSum, ownedPiece]
    · simp [hx, directSum, same]

/-- Necessary compatibility and unique Y/Z owners prohibit all cross-copy coefficients. -/
theorem compatibility_owners_disjoint (source : Coeff K X Y Z) (ownerX : X → Option E)
    (compatibleY : E → Y → Prop) (compatibleZ : E → Z → Prop)
    (necessary : ∀ e x y z, ownerX x = some e → source x y z ≠ 0 →
      compatibleY e y ∧ compatibleZ e z)
    (e f g : E) (x : X) (y : Y) (z : Z)
    (hx : ownerX x = some e) (hy : uniqueOwner compatibleY y = some f)
    (hz : uniqueOwner compatibleZ z = some g) (nonzero : source x y z ≠ 0) :
    e = f ∧ f = g := by
  obtain ⟨cy, cz⟩ := necessary e x y z hx nonzero
  have ef := (uniqueOwner_spec compatibleY y f hy).2 e cy
  have eg := (uniqueOwner_spec compatibleZ z g hz).2 e cz
  exact ⟨ef, ef.symm.trans eg⟩

/-- The three compatibility zero-outs preserve a polynomial degeneration budget. -/
def compatibilityExtraction [Fintype X] [Fintype Y] [Fintype Z] [Fintype E]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z] [DecidableEq E]
    {source : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Degeneration.Certificate source rank degree) (ownerX : X → Option E)
    (compatibleY : E → Y → Prop) (compatibleZ : E → Z → Prop)
    (necessary : ∀ e x y z, ownerX x = some e → source x y z ≠ 0 →
      compatibleY e y ∧ compatibleZ e z) :
    Degeneration.Certificate (directSum (ownedPiece source ownerX
      (uniqueOwner compatibleY) (uniqueOwner compatibleZ))) rank degree := by
  rw [← owned_pieces_restriction source ownerX (uniqueOwner compatibleY) (uniqueOwner compatibleZ)
    (compatibility_owners_disjoint source ownerX compatibleY compatibleZ necessary)]
  exact certificate.restrict _ _ _

end
end MatrixBounds.Tensor.Extraction
