import SuppliedPairedFineBlocks
import SuppliedPairedFineTableReads
import SuppliedRootFineParent3Block028
import SuppliedRootFineParent3Block029
import SuppliedRootFineParent3Block030
import SuppliedRootFineParent3Block031
import SuppliedRootFineParent3Block032
import SuppliedRootFineParent3Block033
import SuppliedRootFineParent3Block034

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache004A0
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 28. -/
def read28 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block028.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 28. -/
theorem read28_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read28 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨28, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block028.table read28 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 29. -/
def read29 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block029.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 29. -/
theorem read29_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read29 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨29, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block029.table read29 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 30. -/
def read30 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block030.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 30. -/
theorem read30_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read30 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨30, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block030.table read30 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 31. -/
def read31 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block031.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 31. -/
theorem read31_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read31 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨31, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block031.table read31 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 32. -/
def read32 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block032.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 32. -/
theorem read32_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read32 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨32, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block032.table read32 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 33. -/
def read33 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block033.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 33. -/
theorem read33_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read33 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨33, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block033.table read33 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 34. -/
def read34 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block034.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 34. -/
theorem read34_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read34 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨34, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block034.table read34 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through the proof-free read of original node 28. -/
def parents0 : ParentValues3 :=
  extendParent3 28 read28 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents0_eq : ∀ node strategy axis orbit, parents0 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 28 (by omega) read28 read28_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 29. -/
def parents1 : ParentValues3 :=
  extendParent3 29 read29 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents1_eq : ∀ node strategy axis orbit, parents1 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 29 (by omega) read29 read29_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 30. -/
def parents2 : ParentValues3 :=
  extendParent3 30 read30 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents2_eq : ∀ node strategy axis orbit, parents2 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 30 (by omega) read30 read30_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 31. -/
def parents3 : ParentValues3 :=
  extendParent3 31 read31 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents3_eq : ∀ node strategy axis orbit, parents3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 31 (by omega) read31 read31_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 32. -/
def parents4 : ParentValues3 :=
  extendParent3 32 read32 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents4_eq : ∀ node strategy axis orbit, parents4 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 32 (by omega) read32 read32_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 33. -/
def parents5 : ParentValues3 :=
  extendParent3 33 read33 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents5_eq : ∀ node strategy axis orbit, parents5 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 33 (by omega) read33 read33_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 34. -/
def parents6 : ParentValues3 :=
  extendParent3 34 read34 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents6_eq : ∀ node strategy axis orbit, parents6 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 34 (by omega) read34 read34_eq _ (fun _ _ _ _ => rfl)

/-- Exact summary of original node 28 on fine axis 0. -/
def summary0 : RationalLogExpression := [
  ⟨(1654427940853 : ℚ) / 4398046511104, (-81106213640491918372930696515183267011127 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(827214577101 : ℚ) / 2199023255552, (-126856983100319282752375835029371908534523 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(1654430642041 : ℚ) / 4398046511104, (-780300930564013899353073812094057637780479 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(827215350461 : ℚ) / 2199023255552, (-313304476808772064136869075242577788376749 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(413607686803 : ℚ) / 1099511627776, (-48187243066165550898653994411452252723513061 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(685903940973 : ℚ) / 1099511627776, (-79911038837750842401711243923473145894893851 : ℚ) / 5846006549323611672814739330865132078623730171904⟩,
  ⟨(1371807905091 : ℚ) / 2199023255552, (-519566709862375190534323733678225201326419 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(2743615869063 : ℚ) / 4398046511104, (-1294007715608425183463961487680667537335297 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(1371808678451 : ℚ) / 2199023255552, (-210372876828405038453547444254360593485573 : ℚ) / 11692013098647223345629478661730264157247460343808⟩,
  ⟨(2743618570251 : ℚ) / 4398046511104, (-134502391075472317772439474597972415358409 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(2 : ℚ) / 1, (-282121388877628428100886780122086730038204592665586324821 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(4 : ℚ) / 1, (397683188124898773054845407617315060768188159386114610517 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩
]
/-- Original node 28: all strategies and physical roles normalize to the summary. -/
theorem checked0 : mergeNormalizeLogExpression (cachedNode3 parents0 28 0) = summary0 := by decide +kernel
/-- Exact summary of original node 29 on fine axis 0. -/
def summary1 : RationalLogExpression := [
  ⟨(22277485767 : ℚ) / 1099511627776, (-105095489238934767204384678346236512062043865 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(1077234142009 : ℚ) / 1099511627776, (-5081922186525349216107322337632694944742082855 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(2 : ℚ) / 1, (-49744400638770711577268384814275851344961821610660556518431 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(4 : ℚ) / 1, (41581506832359082656052484540985714527603594560725277133793 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(8 : ℚ) / 1, (4081446903205814460607950136645068408679113524967639692319 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]
/-- Original node 29: all strategies and physical roles normalize to the summary. -/
theorem checked1 : mergeNormalizeLogExpression (cachedNode3 parents1 29 0) = summary1 := by decide +kernel
/-- Exact summary of original node 30 on fine axis 0. -/
def summary2 : RationalLogExpression := [
  ⟨(116651433641 : ℚ) / 4398046511104, (-4113785091779724785755271847959276969815305 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(116651435283 : ℚ) / 4398046511104, (-143934427246432695417422523540327310927674111 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(116651435285 : ℚ) / 4398046511104, (-175427196110126423339983144302108389100331545 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(29162858839 : ℚ) / 1099511627776, (-30198824105473054544918833474576856305301799 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(15249930823 : ℚ) / 549755813888, (-6247359705303157416232680575013945357 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(24795584927 : ℚ) / 549755813888, (-530201628317589231277475016180739353 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(524960228961 : ℚ) / 549755813888, (-11225174522663385607937800878489359079 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(534505883065 : ℚ) / 549755813888, (-218968240240899505770574648347695054835 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(1070348768937 : ℚ) / 1099511627776, (-1108371246560080233297834198596603659724326617 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(4281395075819 : ℚ) / 4398046511104, (-6438610307328198427570358422559955768775433703 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(4281395075821 : ℚ) / 4398046511104, (-5282748099575244882916826548699301396836173057 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(4281395077463 : ℚ) / 4398046511104, (-150986050423438270511581129007911356619002615 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(2 : ℚ) / 1, (-233360787746943705740839329585377453410024494325235156604537 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(4 : ℚ) / 1, (198308968249728409773687746779860407468102771511033482357127 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(8 : ℚ) / 1, (17525909748607647983575791402758522970960861407100837123705 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]
/-- Original node 30: all strategies and physical roles normalize to the summary. -/
theorem checked2 : mergeNormalizeLogExpression (cachedNode3 parents2 30 0) = summary2 := by decide +kernel
/-- Exact summary of original node 31 on fine axis 0. -/
def summary3 : RationalLogExpression := [
  ⟨(103 : ℚ) / 1099511627776, (-667765468547691529528093811282193783 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(6897673939395365 : ℚ) / 2417851639229258349412352, (44718723009995603265139220504856767392665104679765 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(69864876349221926024959 : ℚ) / 2417851639229258349412352, (-452945163984123416076841065696762081819474212041537209999 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(353599146241 : ℚ) / 4398046511104, (226472559632700203040618900278770788481353409688216265117 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(1580653037849 : ℚ) / 4398046511104, (-153719924263057359465553721614875308291720925 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(1580653038681 : ℚ) / 4398046511104, (-179030238368105247706852783703311026143592927 : ℚ) / 187072209578355573530071658587684226515959365500928⟩,
  ⟨(197581629843 : ℚ) / 549755813888, (-31828530153409383561521312103722313632296011 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(1548876272275754457291995 : ℚ) / 2417851639229258349412352, (10041612521151660338244226174778038931401500474031893249195 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(704347384805 : ℚ) / 1099511627776, (-4566396712957786507213236036439984416692035605 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(352174184045 : ℚ) / 549755813888, (-56731927178835101713161871971461122728022965 : ℚ) / 23384026197294446691258957323460528314494920687616⟩, ⟨(2817393472423 : ℚ) / 4398046511104, (-319107743825638397427151734992486609081630241 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(2817393473255 : ℚ) / 4398046511104, (-273994039778237417512532753767254871856707875 : ℚ) / 187072209578355573530071658587684226515959365500928⟩,
  ⟨(4044447364863 : ℚ) / 4398046511104, (2590380538973279232581505941569679468784400852168024530531 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(2347986762653537028065537 : ℚ) / 2417851639229258349412352, (-15222373599098218803407238057917397868970302178367942310257 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(2 : ℚ) / 1, (-70013479447856607037798505703854340143192948134102457934471 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(4 : ℚ) / 1, (130550890093397184387799615303660732625140909507904975606739 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(8 : ℚ) / 1, (452945163984123416076841065696762081819474212041537209999 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]
/-- Original node 31: all strategies and physical roles normalize to the summary. -/
theorem checked3 : mergeNormalizeLogExpression (cachedNode3 parents3 31 0) = summary3 := by decide +kernel
/-- Exact summary of original node 32 on fine axis 0. -/
def summary4 : RationalLogExpression := [
  ⟨(325 : ℚ) / 4398046511104, (-4622855952738592966495256779725 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(205 : ℚ) / 2199023255552, (-2652056334635245274324853335265 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(61 : ℚ) / 549755813888, (-1679907332595466107779167375425 : ℚ) / 91343852333181432387730302044767688728495783936⟩,
  ⟨(251 : ℚ) / 2199023255552, (-84261634092590927167974451143159 : ℚ) / 182687704666362864775460604089535377456991567872⟩, ⟨(651 : ℚ) / 4398046511104, (-1654846176939880650287560181001 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(1033 : ℚ) / 4398046511104, (-1396382780275373024661017706189 : ℚ) / 182687704666362864775460604089535377456991567872⟩,
  ⟨(4398046510071 : ℚ) / 4398046511104, (-5945165937573421439940062285095517045043 : ℚ) / 182687704666362864775460604089535377456991567872⟩, ⟨(4398046510453 : ℚ) / 4398046511104, (-11179862448274853904711982311899663776503 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(2199023255301 : ℚ) / 2199023255552, (-738220290435342724726123419869435398233609 : ℚ) / 182687704666362864775460604089535377456991567872⟩,
  ⟨(549755813827 : ℚ) / 549755813888, (-15139980701392872692664463214315057622975 : ℚ) / 91343852333181432387730302044767688728495783936⟩, ⟨(2199023255347 : ℚ) / 2199023255552, (-28448456362698682190183595214159857048351 : ℚ) / 365375409332725729550921208179070754913983135744⟩, ⟨(4398046510779 : ℚ) / 4398046511104, (-62558570747002764694733461330840553972787 : ℚ) / 365375409332725729550921208179070754913983135744⟩,
  ⟨(2 : ℚ) / 1, (-3630758314033851092991167871551382542365341134488013523 : ℚ) / 401734511064747568885490523085290650630550748445698208825344⟩, ⟨(4 : ℚ) / 1, (3630758314239421747966910077211637837577226426816858835 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩
]
/-- Original node 32: all strategies and physical roles normalize to the summary. -/
theorem checked4 : mergeNormalizeLogExpression (cachedNode3 parents4 32 0) = summary4 := by decide +kernel
/-- Exact summary of original node 33 on fine axis 0. -/
def summary5 : RationalLogExpression := [
  ⟨(39499197577 : ℚ) / 137438953472, (-215026119303109496576696241201 : ℚ) / 1461501637330902918203684832716283019655932542976⟩, ⟨(97939755895 : ℚ) / 137438953472, (-533165404045030421129710941135 : ℚ) / 1461501637330902918203684832716283019655932542976⟩, ⟨(2 : ℚ) / 1, (-157246891592595227550441786161266560382178977923 : ℚ) / 1606938044258990275541962092341162602522202993782792835301376⟩,
  ⟨(4 : ℚ) / 1, (314494481203107649479471930081720381732330170499 : ℚ) / 3213876088517980551083924184682325205044405987565585670602752⟩
]
/-- Original node 33: all strategies and physical roles normalize to the summary. -/
theorem checked5 : mergeNormalizeLogExpression (cachedNode3 parents5 33 0) = summary5 := by decide +kernel
/-- Exact summary of original node 34 on fine axis 0. -/
def summary6 : RationalLogExpression := [
  ⟨(45481413 : ℚ) / 2199023255552, (-37812228814803907361602472625 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(277637167967 : ℚ) / 4398046511104, (-3551097345283361144041965687075 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(349779984779 : ℚ) / 2199023255552, (-290799250658772978904833913665375 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(851128884959 : ℚ) / 2199023255552, (-47878454077517800942141079713192272219504825 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(883850798221 : ℚ) / 2199023255552, (-531326880943494238894292226151575 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(1315172457331 : ℚ) / 2199023255552, (-790615883430751717990813799934825 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(1347894370593 : ℚ) / 2199023255552, (-75822945107650119854731951629002402778152775 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(1849243270773 : ℚ) / 2199023255552, (-1537419466029013982744780803262625 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(4120409343137 : ℚ) / 4398046511104, (-52701786245110083829792333295325 : ℚ) / 374144419156711147060143317175368453031918731001856⟩,
  ⟨(2198977774139 : ℚ) / 2199023255552, (-1828180904458972157742253114455375 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2 : ℚ) / 1, (-504183443273622973508197546969252352016278953023288309525 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(4 : ℚ) / 1, (714755111241838433839705930069690643185339828692060171525 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(8 : ℚ) / 1, (92837668049833549384919550707794330516875 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]
/-- Original node 34: all strategies and physical roles normalize to the summary. -/
theorem checked6 : mergeNormalizeLogExpression (cachedNode3 parents6 34 0) = summary6 := by decide +kernel

/-- Every complete node summary in original source order. -/
def summaries : Fin 7 → RationalLogExpression := ![summary0, summary1, summary2, summary3, summary4, summary5, summary6]
/-- Each original node is identified separately without omitting any strategy or role. -/
theorem checked : ∀ offset, rationalLogValue (summaries offset) =
    rationalLogValue (sourceSum3 (finProdFinEquiv ((4 : Fin 135), offset)) 0) := by
  intro offset
  fin_cases offset
  · exact node3_value parents0 parents0_eq 28 0 summary0 checked0
  · exact node3_value parents1 parents1_eq 29 0 summary1 checked1
  · exact node3_value parents2 parents2_eq 30 0 summary2 checked2
  · exact node3_value parents3 parents3_eq 31 0 summary3 checked3
  · exact node3_value parents4 parents4_eq 32 0 summary4 checked4
  · exact node3_value parents5 parents5_eq 33 0 summary5 checked5
  · exact node3_value parents6 parents6_eq 34 0 summary6 checked6
/-- Seven independently checked complete node summaries. -/
def expression : RationalLogExpression := finiteLogSum summaries
/-- Combining the seven exact summaries preserves the whole source-block value. -/
theorem value : rationalLogValue expression =
    ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((4 : Fin 135), offset)) 0) :=
  block3_value 4 0 summaries checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache004A0
