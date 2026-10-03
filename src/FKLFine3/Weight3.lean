module

public import FKLFine3.Static
public import FKLBridge.Dyadic
public import FKLBridge.Split
public import FKLBridge.Idx.DyadicA3
public import FKLBridge.Idx.DyadicAlloc3
public import FKLBridge.Idx.DyadicRootAlpha
public import FKLBridge.Idx.SplitAlpha4
public import FKL.Range

/-! Fast level-three role weights `strategyNumerator × allocation` at denominator `2^176`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine SuppliedPopulationWeights

def nodeParP : Nat := 168507140199286831725667047560625677439684932326013264796538286420846402422320172456779855760163885913251002157615457787409117955633620384749020560456815469446076108350345663068477731103248335953681507702922140673545157886095221428129958966731748300641559906187745120931448449247656162841182543295458775923310834633539693517619184045860587716441643650363138348393271443729216298708651485107853679776548885514616068074112604569539185466616369090509789498242646805680961970923596441044089380240592248569753406849950521138457698677251112932128669338375675844149007394316956474356768574932379905291100928103931279056056686229499855516038674086070810701066717344952678317863220616827309508360015586888301802011006003949667555288012849097105199545438207021536323804177356645381879711355959120758107527637444557546816359115367778570089483880483338802160848363151742540539749160026386557682883725553262114998195628306298029175567744083409205399654363208077751180675497209659323610634310287734708737935204012571127197317008176554410243770762128805266042573472032590033497874485325963530577398746619612570878286561475534834754534695192952081103086666426017818103475082838138911633474895243923720659690127632035013417764235388977808301998198634244903507315220419551688577171763691669721495734631480982186398243997144052464688103533803986516611622293443051129530896764243246319788097334879908015003874060375925008589488553474773555857762163229536038667312825900835948445119456143445801230350151559753527089567541475778400721298516647203754271757703037746175997134057401884872719103271784423826020289754528355507262512226532330207878353584097676046907356124198792181744215160439096185016684638162184581135625106982413783198464056051005646355127485986902611995181418656955533331166713318138235168342902450724233571837868691714484348483024024667045262724650034933232728081548002065293282180597560936570272800019437022498913387698015701873470993758919806599605412519109143440593867650365246528072826549715072
def nodeChiP : Nat := 9600338264318096937146533596365152687224249744052538479736122018409076345308047251458737497972552196065970601993726169437383340803005518317320573799739658598907317315611249588778725530129564917055194457414178389777673791107553613355685188321019951867848285047839935002770995794520259962042411629177234415285022290918992079645831283710034377667109264739992797724522590515809192584711289584689480237121182416622363508998481002463365917103827537793815709686623748784760877058721534241999486642773216668309902508662030802841449831365983291965810004098330519763870500296853113269484756128678957249382370361021334694246300236323529335959270677088517876399610298370156999295727657341956386074731650597966220401325562495585664515212562915023002958990291034682283675628519823714844402811779149890966196327123837779154016371480682153324284578418265838956869886834605162295704677410465009277911173915211459854443063366080920392708166407261855992862606757513167499805278317463303186760641183338258794351393515046866441756126645927610227377477721070893953772520383499183936980655267292471120699769901229517739269094465843572270607294062766029872000023069568382178984239310139249129605080306033206713195701412114288631591864393112285955014642772981000651521516736580551275217595406975892077939450305412640244415270806393823754798402910090003410604203385935164299811390139020115724394512823224812838470422431075054704029258788237012326392202070422524489763638654116975035051426676490082505321302983023277492333674644297018032558145360785855293794299681244186123544486021317790510183824114338265325051898393928565798656535304129006094946507385732932404372438957065749339387108255444393480981395991512226109471688966753150588479462808505994563581730311480219038065730585630883498282631175680287696814184504158224665410897739096677137407186487262816009394715710855076772660590114051086257164928386544372347828709028413086431559242351347359980812338720229290168134458239473356509078863344375953728803382297970446174307937172851096193761276147914111616622768457864034088799941303081183517661813308217899612017654461868843400994268780977410428071251540863524918986652205796847499674691091046452382970881114923479058530967988622042774965981160924191846370264501088251725375320584870135765196802570
def rcolP : Nat := 4254842203011791114175517398136391508835173919643198016111649070715001796835532182195206906060338605634855981465584937886735833102646634750493216511704998935833347493631015649084660732390896182739390880246536749093673165635962083551301036433410169770770
def nodePar (n : Nat) : Nat := lane nodeParP 7 n
def nodeChi (n : Nat) : Nat := lane nodeChiP 8 n
def rcol (p : Nat) : Nat := lane rcolP 8 p

/-- Tail-recursive comparison of hierarchy records with the packed parent and child lanes. -/
def nodesOK (l : List SuppliedShapeIndices.HierarchyNode) : Nat → Nat → Bool :=
  List.rec (motive := fun _ => Nat → Nat → Bool) (fun _ _ => true)
    (fun x _ rec P C => Bool.and (Nat.beq (Nat.land P 127) x.parent)
      (Bool.and (Nat.beq (Nat.land C 255) x.child) (rec (Nat.shiftRight P 7) (Nat.shiftRight C 8)))) l

theorem nodesOK_cons (x : SuppliedShapeIndices.HierarchyNode) (l : List SuppliedShapeIndices.HierarchyNode) (P C : Nat) :
    nodesOK (x :: l) P C = Bool.and (Nat.beq (Nat.land P 127) x.parent)
      (Bool.and (Nat.beq (Nat.land C 255) x.child) (nodesOK l (Nat.shiftRight P 7) (Nat.shiftRight C 8))) := rfl

theorem nodesOK_sound : ∀ (l : List SuppliedShapeIndices.HierarchyNode) (P C : Nat), nodesOK l P C = true →
    ∀ i (h : i < l.length), lane P 7 i = l[i].parent ∧ lane C 8 i = l[i].child := by
  intro l
  induction l with
  | nil => intro _ _ _ i h; simp at h
  | cons x l ih =>
    intro P C hok i hi
    rw [nodesOK_cons] at hok
    simp only [Bool.and_eq_true, Nat.beq_eq] at hok
    obtain ⟨h1, h2, h3⟩ := hok
    rcases i with _ | i
    · simp only [List.getElem_cons_zero]
      exact ⟨(show lane P 7 0 = Nat.land P 127 from rfl).trans h1, (show lane C 8 0 = Nat.land C 255 from rfl).trans h2⟩
    · have := ih _ _ h3 i (by simpa using hi)
      simp only [List.getElem_cons_succ]
      rw [← this.1, ← this.2, lane_eq, lane_eq, lane_eq, lane_eq]
      simp only [raw_shiftRight, Nat.shiftRight_eq_div_pow, Nat.div_div_eq_div_mul, ← pow_add]
      constructor <;> ring_nf

theorem nodes_checked : nodesOK SuppliedShapeIndices.positiveNodes nodeParP nodeChiP = true := by decide +kernel

theorem node_eq (n : Fin 945) : nodePar n = (SuppliedShapeIndices.positiveNode n).parent ∧
    nodeChi n = (SuppliedShapeIndices.positiveNode n).child :=
  nodesOK_sound _ _ _ nodes_checked n.val (by rw [SuppliedShapeIndices.positiveNodes_length]; exact n.isLt)

theorem rcol_eq : ∀ p : Fin 105, rcol p = (rootColumn p).val := by decide +kernel

/-- Level-four split rows all have the 45 original columns. -/
theorem widths4 : allRange (fun i => Nat.beq (FKLBridge.Split.width (ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 i)) 45)
    7 0 105 = true := by decide +kernel

theorem width45 (p : Fin 105) : (SuppliedParameters.alpha4 p).val.row.width = 45 := by
  have hi := allRange_sound _ 7 0 105 widths4 p.val p.isLt
  simp only [Nat.zero_add, Nat.beq_eq] at hi
  rw [← FKLBridge.Idx.SplitAlpha4.get_eq, FKLBridge.Split.width_eq] at hi
  exact hi

/-- Doubled node mass numerator. -/
noncomputable def fNN (n : Nat) : Nat :=
  Nat.mul (Nat.mul 2 (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) (rcol (nodePar n))))
    (FKLBridge.Split.cell (ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 (nodePar n)) (nodeChi n))

/-- Role weight numerator at denominator `2^176`. -/
noncomputable def fCr (n s r : Nat) : Nat :=
  Nat.mul (Nat.mul (fNN n) (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s))
    (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicAlloc3.tree 7 13 (Nat.add (Nat.mul n 6) s)) r)

theorem a3_eq (n : Fin 945) (s : Fin 6) :
    FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s = (SuppliedTypedParameters.strategies n).numerator s := by
  have hw := (SuppliedTypedParameters.strategies n).width_eq
  rw [← FKLBridge.Idx.DyadicA3.get_eq, FKLBridge.Dyadic.cell_eq _ s (by
    change s.val < (SuppliedTypedParameters.strategies n).row.width; rw [hw]; exact s.isLt)]
  rfl

theorem al3_eq (n : Fin 945) (s : Fin 6) (r : Fin 6) :
    FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicAlloc3.tree 7 13 (Nat.add (Nat.mul n 6) s)) r =
      SuppliedRoleIndex.allocation3 n s (SuppliedRoleIndex.order r) := by
  have hw := (SuppliedTypedParameters.allocation3 n s).width_eq
  have hcol : SuppliedRoleIndex.column (SuppliedRoleIndex.order r) = r := by revert r; decide
  have hi : Nat.add (Nat.mul n.val 6) s.val = (SuppliedParameters.flat2 n s).val := by
    rw [SuppliedParameters.flat2_val]; rfl
  rw [hi, ← FKLBridge.Idx.DyadicAlloc3.get_eq, FKLBridge.Dyadic.cell_eq _ r (by
    change r.val < (SuppliedTypedParameters.allocation3 n s).row.width; rw [hw]; exact r.isLt)]
  unfold SuppliedRoleIndex.allocation3
  rw [hcol]; rfl

theorem fNN_eq (n : Fin 945) : fNN n = nodeNumerator n := by
  obtain ⟨hp, hc⟩ := node_eq n
  have hpar : nodePar n = (nodeParent n).val := hp
  have hrc : rcol (nodePar n) = (rootColumn (nodeParent n)).val := by rw [hpar, rcol_eq]
  have hroot : FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) (rcol (nodePar n)) =
      rootNumerator (nodeParent n) := by
    have hw := SuppliedTypedParameters.rootDistribution.width_eq
    have hg : ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0 =
        (ParameterIndexData.DyadicRootAlpha.table.get 0).val := (FKLBridge.Idx.DyadicRootAlpha.get_eq 0).symm
    rw [hrc, hg, FKLBridge.Dyadic.cell_eq _ _ (by
        change (rootColumn (nodeParent n)).val < SuppliedTypedParameters.rootDistribution.row.width
        rw [hw]; exact (rootColumn (nodeParent n)).isLt)]
    rfl
  have hsplit : FKLBridge.Split.cell (ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 (nodePar n)) (nodeChi n) =
      (SuppliedTypedParameters.level4Split (nodeParent n)).numerator (nodeChild n) := by
    have hb := (SuppliedShapeIndices.positiveNode_bounds n).2.1
    rw [hpar, ← FKLBridge.Idx.SplitAlpha4.get_eq, hc, FKLBridge.Split.cell_eq _ _ (by
      change (SuppliedShapeIndices.positiveNode n).child < (SuppliedParameters.alpha4 (nodeParent n)).val.row.width
      rw [width45]; simpa using hb)]
    unfold SuppliedTypedParameters.level4Split nodeChild
    exact (checkedSplit_numerator_column (length := 4) _ _ _ ⟨_, hb⟩).symm
  unfold fNN nodeNumerator
  rw [hroot, hsplit]; rfl

theorem fCr_eq (n : Fin 945) (s : Fin 6) (r : Fin 6) :
    (fCr n s r : ℝ) / 2 ^ 176 = (sourceMass3 ((n, s), SuppliedRoleIndex.order r) : ℝ) := by
  have e : fCr n s r = strategyNumerator (n, s) * SuppliedRoleIndex.allocation3 n s (SuppliedRoleIndex.order r) := by
    unfold fCr strategyNumerator
    rw [fNN_eq, a3_eq, al3_eq]; rfl
  rw [e, sourceMass3]
  push_cast
  norm_num [DyadicPopulationArithmetic.denominator]

end MatrixBounds.Numeric.FKLFine3
