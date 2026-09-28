import SuppliedPairedFineBlocks
import SuppliedPairedFineTableReads
import SuppliedRootFineParent3Block819
import SuppliedRootFineParent3Block820
import SuppliedRootFineParent3Block821
import SuppliedRootFineParent3Block822
import SuppliedRootFineParent3Block823
import SuppliedRootFineParent3Block824
import SuppliedRootFineParent3Block825

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache117A0
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 819. -/
def read819 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block819.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 819. -/
theorem read819_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read819 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨819, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block819.table read819 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 820. -/
def read820 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block820.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 820. -/
theorem read820_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read820 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨820, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block820.table read820 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 821. -/
def read821 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block821.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 821. -/
theorem read821_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read821 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨821, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block821.table read821 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 822. -/
def read822 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block822.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 822. -/
theorem read822_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read822 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨822, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block822.table read822 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 823. -/
def read823 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block823.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 823. -/
theorem read823_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read823 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨823, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block823.table read823 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 824. -/
def read824 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block824.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 824. -/
theorem read824_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read824 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨824, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block824.table read824 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 825. -/
def read825 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block825.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 825. -/
theorem read825_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read825 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨825, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block825.table read825 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through the proof-free read of original node 819. -/
def parents0 : ParentValues3 :=
  extendParent3 819 read819 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents0_eq : ∀ node strategy axis orbit, parents0 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 819 (by omega) read819 read819_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 820. -/
def parents1 : ParentValues3 :=
  extendParent3 820 read820 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents1_eq : ∀ node strategy axis orbit, parents1 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 820 (by omega) read820 read820_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 821. -/
def parents2 : ParentValues3 :=
  extendParent3 821 read821 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents2_eq : ∀ node strategy axis orbit, parents2 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 821 (by omega) read821 read821_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 822. -/
def parents3 : ParentValues3 :=
  extendParent3 822 read822 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents3_eq : ∀ node strategy axis orbit, parents3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 822 (by omega) read822 read822_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 823. -/
def parents4 : ParentValues3 :=
  extendParent3 823 read823 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents4_eq : ∀ node strategy axis orbit, parents4 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 823 (by omega) read823 read823_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 824. -/
def parents5 : ParentValues3 :=
  extendParent3 824 read824 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents5_eq : ∀ node strategy axis orbit, parents5 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 824 (by omega) read824 read824_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 825. -/
def parents6 : ParentValues3 :=
  extendParent3 825 read825 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents6_eq : ∀ node strategy axis orbit, parents6 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 825 (by omega) read825 read825_eq _ (fun _ _ _ _ => rfl)

/-- Exact summary of original node 819 on fine axis 0. -/
def summary0 : RationalLogExpression := [
  ⟨(2206079 : ℚ) / 4398046511104, (-139051009879483919849025464414725 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(4996221 : ℚ) / 4398046511104, (-67019025671287612027850650044189 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(4398041514883 : ℚ) / 4398046511104, (-58995079919269470906142831653527992547 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(4398044305025 : ℚ) / 4398046511104, (-277212421725803683946980140586709306875 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2 : ℚ) / 1, (-62957809137293689827785004298103028145404873047296967 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(4 : ℚ) / 1, (125545954223395869890429875618624637019510470072617927 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]
/-- Original node 819: all strategies and physical roles normalize to the summary. -/
theorem checked0 : mergeNormalizeLogExpression (cachedNode3 parents0 819 0) = summary0 := by decide +kernel
/-- Exact summary of original node 820 on fine axis 0. -/
def summary1 : RationalLogExpression := [
  ⟨(3615 : ℚ) / 4398046511104, (-1418107294455082010644349269965 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(8943592720588281 : ℚ) / 2417851639229258349412352, (3508429896459644098116485405338909291198971 : ℚ) / 200867255532373784442745261542645325315275374222849104412672⟩, ⟨(521894488017471255098235 : ℚ) / 19342813113834066795298816, (-204730948933188486650438673932567793814735824788385 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩,
  ⟨(331796287607 : ℚ) / 4398046511104, (204730920865749314973285889000684551103461495196617 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩, ⟨(786466167403 : ℚ) / 2199023255552, (-62918024448119091594425574156596087380385 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(1553120766604003455771143 : ℚ) / 2417851639229258349412352, (609264699388881391831232996361020922658341122590213 : ℚ) / 200867255532373784442745261542645325315275374222849104412672⟩,
  ⟨(706277558287 : ℚ) / 1099511627776, (-277061509631180928541142336360965749917 : ℚ) / 91343852333181432387730302044767688728495783936⟩, ⟨(1412557088149 : ℚ) / 2199023255552, (-113005880087631699822735331578957162063455 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(4066250223497 : ℚ) / 4398046511104, (2509030944050672844641386773674740122362726043825207 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩,
  ⟨(18820918609917657402559621 : ℚ) / 19342813113834066795298816, (-7383148539161723979291250744562907503629455024546911 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩, ⟨(2 : ℚ) / 1, (-456513709335928735008479022644553257404206279419834297 : ℚ) / 401734511064747568885490523085290650630550748445698208825344⟩, ⟨(4 : ℚ) / 1, (3168961228273446281338001964708231944272511310024207361 : ℚ) / 3213876088517980551083924184682325205044405987565585670602752⟩,
  ⟨(8 : ℚ) / 1, (204730948933188486650438673932567793814735824788385 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩
]
/-- Original node 820: all strategies and physical roles normalize to the summary. -/
theorem checked1 : mergeNormalizeLogExpression (cachedNode3 parents1 820 0) = summary1 := by decide +kernel
/-- Exact summary of original node 821 on fine axis 0. -/
def summary2 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-1188510920465503574789 : ℚ) / 19342813113834066795298816⟩, ⟨(4 : ℚ) / 1, (1188510920465503574789 : ℚ) / 19342813113834066795298816⟩
]
/-- Original node 821: all strategies and physical roles normalize to the summary. -/
theorem checked2 : mergeNormalizeLogExpression (cachedNode3 parents2 821 0) = summary2 := by decide +kernel
/-- Exact summary of original node 822 on fine axis 0. -/
def summary3 : RationalLogExpression := [
  ⟨(57408082658724315 : ℚ) / 4835703278458516698824704, (89270954998615704129884781632376836156505 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(11361180489 : ℚ) / 1099511627776, (-17666910044600454383293800698233203 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(2908366033 : ℚ) / 274877906944, (-7045298293259929001411930550413996678270427 : ℚ) / 2923003274661805836407369665432566039311865085952⟩,
  ⟨(5816732081 : ℚ) / 549755813888, (-10802287445982749429386050093992795338507767 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(683075642394734779100473 : ℚ) / 9671406556917033397649408, (-1062199120903821409680574166588781016317602232771 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(370933648027 : ℚ) / 4398046511104, (1062198942361911412449165906819217751563929919761 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(736227694358608262460965 : ℚ) / 4835703278458516698824704, (1144851845384421090338416648321970081280583046055 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(334797619765 : ℚ) / 2199023255552, (-520618384441775601296340381944333655 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(4027112863077 : ℚ) / 4398046511104, (11531968174591363111357411101525809537788072156911 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(8888396914098960045249223 : ℚ) / 9671406556917033397649408, (-13821671865360205292034244398169749700349238249021 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(543939081807 : ℚ) / 549755813888, (-1010152476160288847139287946148906895631383049 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(271969540911 : ℚ) / 274877906944, (-658825787627039975166171741146280337395855909 : ℚ) / 2923003274661805836407369665432566039311865085952⟩,
  ⟨(2 : ℚ) / 1, (-173215353718666495379137302089053050049411610048903762971533 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(4 : ℚ) / 1, (149042440880328891109186626398826228874028493742320068031603 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(8 : ℚ) / 1, (12086456419168802134975337845113410587691558153291847469965 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]
/-- Original node 822: all strategies and physical roles normalize to the summary. -/
theorem checked3 : mergeNormalizeLogExpression (cachedNode3 parents3 822 0) = summary3 := by decide +kernel
/-- Exact summary of original node 823 on fine axis 0. -/
def summary4 : RationalLogExpression := [
  ⟨(1654367509487 : ℚ) / 4398046511104, (-7700882000195192586765248370339031650187185 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(1654367585523 : ℚ) / 4398046511104, (-31383315840637341201474844662581293565672895 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(1654367592059 : ℚ) / 4398046511104, (-5848620988266666480221156392791763699193235 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(1654367608979 : ℚ) / 4398046511104, (-6520725071298028031506769057084699726025845 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(1654367631223 : ℚ) / 4398046511104, (-165459863731172771946726308015337778748854935 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(2743678879881 : ℚ) / 4398046511104, (-274406199093491829712564787575014275249859945 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(2743678902125 : ℚ) / 4398046511104, (-10814268671350078119342772188278662444116875 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(2743678919045 : ℚ) / 4398046511104, (-9699620681652659874179408074223332936034925 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(2743678925581 : ℚ) / 4398046511104, (-52047527429998685135046147033158160618816065 : ℚ) / 365375409332725729550921208179070754913983135744⟩,
  ⟨(2743679001617 : ℚ) / 4398046511104, (-12771496125681076454441195183657326396000335 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2 : ℚ) / 1, (-3212400418727328197082297350199981486166189888341595762085 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(4 : ℚ) / 1, (4565736675505736659145550904278890391159022735100679138725 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩
]
/-- Original node 823: all strategies and physical roles normalize to the summary. -/
theorem checked4 : mergeNormalizeLogExpression (cachedNode3 parents4 823 0) = summary4 := by decide +kernel
/-- Exact summary of original node 824 on fine axis 0. -/
def summary5 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-161467072393179694325 : ℚ) / 9671406556917033397649408⟩, ⟨(4 : ℚ) / 1, (161467072393179694325 : ℚ) / 9671406556917033397649408⟩
]
/-- Original node 824: all strategies and physical roles normalize to the summary. -/
theorem checked5 : mergeNormalizeLogExpression (cachedNode3 parents5 824 0) = summary5 := by decide +kernel
/-- Exact summary of original node 825 on fine axis 0. -/
def summary6 : RationalLogExpression := [
  ⟨(11 : ℚ) / 68719476736, (-2428615507604738092963894515075 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(3969263872280805 : ℚ) / 2417851639229258349412352, (876346890363308686003337489027353024518694125 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(260975401302890627320975 : ℚ) / 9671406556917033397649408, (-57618991518869995266461354663222525227001249454654375 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(165914855645 : ℚ) / 2199023255552, (57618988013482433813226610649872569117589151379877875 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(1572957721211 : ℚ) / 4398046511104, (-1826533159724377090397423961078424375875 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(786481007311 : ℚ) / 2199023255552, (-108778882029016387407594235816542082125 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(1412542248241 : ℚ) / 2199023255552, (-195369964632406260595021154086584445875 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2825088789893 : ℚ) / 4398046511104, (-3280519421674264162724308208098811080125 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(1553114508943169178007323 : ℚ) / 2417851639229258349412352, (342901634682299850338715965359349152601524632534899475 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(2825098841481 : ℚ) / 4398046511104, (-623734441539721484699884333827297526347825 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(2033108399907 : ℚ) / 2199023255552, (706058827999120027519107732224042368765627493918707725 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(9410431154066030398419825 : ℚ) / 9671406556917033397649408, (-2077665366728319428873971593661438979171726024058305625 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(2 : ℚ) / 1, (-2201842206770952518831555335031066164022493030199053975 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(4 : ℚ) / 1, (2084437106745591314316872810273420560937441566596342225 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(8 : ℚ) / 1, (57618991518869995266461354663222525227001249454654375 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]
/-- Original node 825: all strategies and physical roles normalize to the summary. -/
theorem checked6 : mergeNormalizeLogExpression (cachedNode3 parents6 825 0) = summary6 := by decide +kernel

/-- Every complete node summary in original source order. -/
def summaries : Fin 7 → RationalLogExpression := ![summary0, summary1, summary2, summary3, summary4, summary5, summary6]
/-- Each original node is identified separately without omitting any strategy or role. -/
theorem checked : ∀ offset, rationalLogValue (summaries offset) =
    rationalLogValue (sourceSum3 (finProdFinEquiv ((117 : Fin 135), offset)) 0) := by
  intro offset
  fin_cases offset
  · exact node3_value parents0 parents0_eq 819 0 summary0 checked0
  · exact node3_value parents1 parents1_eq 820 0 summary1 checked1
  · exact node3_value parents2 parents2_eq 821 0 summary2 checked2
  · exact node3_value parents3 parents3_eq 822 0 summary3 checked3
  · exact node3_value parents4 parents4_eq 823 0 summary4 checked4
  · exact node3_value parents5 parents5_eq 824 0 summary5 checked5
  · exact node3_value parents6 parents6_eq 825 0 summary6 checked6
/-- Seven independently checked complete node summaries. -/
def expression : RationalLogExpression := finiteLogSum summaries
/-- Combining the seven exact summaries preserves the whole source-block value. -/
theorem value : rationalLogValue expression =
    ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((117 : Fin 135), offset)) 0) :=
  block3_value 117 0 summaries checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache117A0
