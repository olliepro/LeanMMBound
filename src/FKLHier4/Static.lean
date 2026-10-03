module

public import VerifiedOrbitComplements
public import SuppliedRootFineParent4Integers
public import SuppliedLeafLaws
public import FKL.Lane

/-! Small static tables of the level-four hierarchy (orbit sizes, pair columns, word scales, complements,
eight-letter child shapes and their zero/positive axes), checked once against their definitions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL Tensor Tensor.CW

def sz4P : Nat := 81032453925421398493219214877992367239453614504849367295059777506899879212047545195214277106558197639138826682295408364545663473474876756002558876297495106802043278647137512686035214072757161741599798673299687683689348039970911943549612297093798678877606304729876404816153096277992330255774469972356447738243262456055916701409536543640615348648179885751246584410289846495802634773220058655404311268085890739706506367413348477516871216951518481198615563589264432344922408002298573622409060417345598910458100708739916222115099479441678952426260457706752001
def sz4 (o : Nat) : Nat := FKL.lane sz4P 8 o

def col41P : Nat := 315234334899234927382199545337851778310403822266293332172880940429804328532892930961265489269894643538296953865843150416865292402484093473488600271657178113818483462558355176480712705547755829611525530869721195956444359096668881688421951162259757901787023858737872876957559444314360445632293957475925889546131457777252139244025644960627004398370816
def col41 (o : Nat) : Nat := FKL.lane col41P 5 o

def col42P : Nat := 315713191751666388100527754731525671389246160922622313570940361296225267798426840589933410029220335214294102547129924169698823208040641602793738918133462983479711354112795967432059846022566781141478691695869297499223549499017848020611025054363376957386443848475164640461941187239742144781001340663280348215043983924997338306709402510390356032456736
def col42 (o : Nat) : Nat := FKL.lane col42P 5 o

def wsc4P : Nat := 9833193875034701687833128
def wsc4 (o : Nat) : Nat := FKL.lane wsc4P 4 o

def comp3P : Nat := 47168019095736187844353899124
def comp3 (o : Nat) : Nat := FKL.lane comp3P 5 o

def sh8XP : Nat := 810920607990572664732450050533245137802995380707655680
def sh8X (c : Nat) : Nat := FKL.lane sh8XP 4 c

def sh8YP : Nat := 6034558123801687139181527099657828703839597893005840
def sh8Y (c : Nat) : Nat := FKL.lane sh8YP 4 c

def sh8ZP : Nat := 375789014099705919486836847261931423159219897259640
def sh8Z (c : Nat) : Nat := FKL.lane sh8ZP 4 c

def zAx8P : Nat := 496162123388680342943825920
def zAx8 (c : Nat) : Nat := FKL.lane zAx8P 2 c

def pAx8P : Nat := 87382
def pAx8 (c : Nat) : Nat := FKL.lane pAx8P 2 c

/-- Column index of the total-eight shape `(x, y, 8-x-y)`. -/
def idx8 (x y : Nat) : Nat := Nat.add (Nat.div (Nat.mul x (Nat.sub 19 x)) 2) y

theorem sz4_eq : ∀ o : Fin 231, sz4 o = OrbitLevel4.sizes o := by decide +kernel
theorem cols4_eq : ∀ o : Fin 231, col41 o = (OrbitLevel4.encoding.columns o).1.val ∧
    col42 o = (OrbitLevel4.encoding.columns o).2.val := by decide +kernel
theorem wsc4_eq : ∀ o : Fin 21, wsc4 o = SuppliedRootFineParent4Integers.wordScale o := by decide +kernel
theorem comp3_eq : ∀ o : Fin 21, comp3 o = (OrbitLevel3.complement o).val := by decide +kernel
theorem shapes8_length : (shapes 8).length = 45 := by decide +kernel
theorem shape8_eq : ∀ c : Fin 45, ((shapes 8)[c.val]?).map (fun sh => (sh.x, sh.y, sh.z)) =
    some (sh8X c, sh8Y c, sh8Z c) := by decide +kernel

/-- The `c`-th original eight-letter child shape. -/
def shape8 (c : Fin 45) : Shape := (shapes 8)[c.val]'(lt_of_lt_of_eq c.isLt shapes8_length.symm)

theorem zAx8_eq : ∀ c : Fin 45, zAx8 c = (SuppliedLeafLaws.zeroAxis (shape8 c)).val := by decide +kernel
theorem pAx8_eq : ∀ c : Fin 45, pAx8 c = (SuppliedLeafLaws.positiveAxis (shape8 c)).val := by decide +kernel
theorem idx8_shape : ∀ c : Fin 45, idx8 (sh8X c) (sh8Y c) = c.val := by decide +kernel
theorem wsc4_le : ∀ i : Fin 21, wsc4 i ≤ 8 := by decide +kernel
theorem cols4_lt : ∀ o : Fin 231, col41 o < 21 ∧ col42 o < 21 := by decide +kernel
theorem sz4_le : ∀ o : Fin 231, sz4 o ≤ 128 := by decide +kernel

end MatrixBounds.Numeric.FKLHier4
