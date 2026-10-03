module

public import VerifiedOrbitComplements
public import SuppliedLeafLaws
public import SuppliedChildKinds
public import RootFineExecutablePools
public import SuppliedRootStage
public import SuppliedRootFineExpression
public import FKL.Lane
public import FKLHier4.Static

/-! Static tables of the root fine computation (child kinds, zero/positive axes of the sixteen-letter
shapes, eight-letter orbit complement, isolated columns and pool coordinates, physical axes). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLRoot

open FKL Tensor Tensor.CW

/-- Child kind of root column `c`: a zero child `z < 48`, or `512 + p` for the positive parent `p`. -/
def kindRP : Nat := 1730240834935758410407580740551306544731605096875889703476809250302702925548825217724763424772600344148450126310778016123650672252514634643880910302905454192434299419811387917548376479312960712109077277561758872969957191832230415365065269335882398879570492365571711137225944039346822916528926114400962188599925711936416361113779686012199493043943050891893586487825961411090404780666430323434093893468315809865699397765001700638931665562602885982046044796486656
def kindR (c : Nat) : Nat := FKL.lane kindRP 10 c

def zAx16P : Nat := 52251970253199363740899801390804028362057134113581575025808955450390117306784322220080496640
def zAx16 (c : Nat) : Nat := FKL.lane zAx16P 2 c

def pAx16P : Nat := 5726623062
def pAx16 (c : Nat) : Nat := FKL.lane pAx16P 2 c

def comp4P : Nat := 332069690531152788249397032376582898645600904408303528182309512350506317036119311107361255472641929154467636949371640417420146314941489774023952632086542182309909419192260938370316679077713414794615294530752897441746719932323496897015959301151027280493695551651470667364560072351350998691400605002269470739542581797110817264210906610379252615634253533122004117806393993613072557095942710289596808276299493842235001768212218412828974943774911098802624135995078702490127008486471497897580362708918006827091322123852869110182798825741202067340018565899750
def comp4 (o : Nat) : Nat := FKL.lane comp4P 8 o

def isoRP : Nat := 107010066751252921784334102577965414747720587229125824816785811531539493299291816664466849793
def isoR (a c : Nat) : Bool := Nat.beq (FKL.lane isoRP 1 (Nat.add (Nat.mul a 153) c)) 1

def coordRP : Nat := 36851407552129632739922461842492450764901140672046745892900706242490048146275084939192471012615535020711834282848007652787399773977744336236516338669730267240757123093438556373295731427954429795724418258564246002403257215772389519691091950637287005112873057526949035048170657588276449881722510446253980792434489840026494430235287419089510951798363300849691396156219164589628569720947430638951066263627919800430922634603902519791957652876165275399706074593776
def coordR (a c : Nat) : Nat := FKL.lane coordRP 5 (Nat.add (Nat.mul a 153) c)

/-- Membership of a pooled root column in coordinate sector `k`. -/
def inSecR (a k c : Nat) : Bool := Bool.and (!(isoR a c)) (Nat.beq (coordR a c) k)

def axRP : Nat := 6
def axR (a : Nat) : Nat := FKL.lane axRP 2 a

theorem shapes16_length : (shapes 16).length = 153 := by decide +kernel

theorem kindR_eq : ∀ c : Fin 153, kindR c =
    (match SuppliedChildKinds.kind4 c with | .inl z => z.val | .inr p => 512 + p.val) := by decide +kernel
theorem zAx16_eq : ∀ c : Fin 153,
    zAx16 c = (SuppliedLeafLaws.zeroAxis ((shapes 16)[c.val]'(lt_of_lt_of_eq c.isLt shapes16_length.symm))).val := by
  decide +kernel
theorem pAx16_eq : ∀ c : Fin 153,
    pAx16 c = (SuppliedLeafLaws.positiveAxis ((shapes 16)[c.val]'(lt_of_lt_of_eq c.isLt shapes16_length.symm))).val := by
  decide +kernel
/-- The pair code of the eight-letter orbit encoding. -/
def code4 (x y : Nat) : Nat := (min x y * 21 - min x y * (min x y + 1) / 2 + max x y) % 231

theorem comp4_code : ∀ o : Fin 231, comp4 o = code4 (FKLHier4.comp3 (FKLHier4.col41 o)) (FKLHier4.comp3 (FKLHier4.col42 o)) := by
  decide +kernel

theorem comp4_eq (o : Fin 231) : comp4 o = (OrbitLevel4.complement o).val := by
  have e : (OrbitLevel4.complement o).val = code4 (OrbitLevel3.complement (OrbitLevel4.encoding.columns o).1).val
      (OrbitLevel3.complement (OrbitLevel4.encoding.columns o).2).val := rfl
  rw [e, ← FKLHier4.comp3_eq, ← FKLHier4.comp3_eq, ← (FKLHier4.cols4_eq o).1, ← (FKLHier4.cols4_eq o).2]
  exact comp4_code o
theorem isoR_eq : ∀ (a : Fin 2) (c : Fin 153), isoR a c = RootFineExecutablePools.isolated a c := by decide +kernel
theorem coordR_eq : ∀ (a : Fin 2) (c : Fin 153), coordR a c = (RootFineExecutablePools.coordinate a c).val := by
  decide +kernel
theorem axR_eq : ∀ a : Fin 2, axR a = (SuppliedRootStage.axes (SuppliedRootFine.physicalAxis a)).val := by decide +kernel

end MatrixBounds.Numeric.FKLRoot
