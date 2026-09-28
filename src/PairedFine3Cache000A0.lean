import SuppliedPairedFineBlocks
import SuppliedPairedFineTableReads
import SuppliedRootFineParent3Block000
import SuppliedRootFineParent3Block001
import SuppliedRootFineParent3Block002
import SuppliedRootFineParent3Block003
import SuppliedRootFineParent3Block004
import SuppliedRootFineParent3Block005
import SuppliedRootFineParent3Block006

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache000A0
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 0. -/
def read0 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block000.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 0. -/
theorem read0_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read0 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨0, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block000.table read0 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 1. -/
def read1 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block001.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 1. -/
theorem read1_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read1 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨1, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block001.table read1 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 2. -/
def read2 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block002.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 2. -/
theorem read2_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read2 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨2, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block002.table read2 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 3. -/
def read3 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block003.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 3. -/
theorem read3_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read3 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨3, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block003.table read3 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 4. -/
def read4 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block004.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 4. -/
theorem read4_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read4 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨4, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block004.table read4 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 5. -/
def read5 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block005.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 5. -/
theorem read5_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read5 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨5, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block005.table read5 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 6. -/
def read6 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block006.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 6. -/
theorem read6_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read6 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨6, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block006.table read6 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through the proof-free read of original node 0. -/
def parents0 : ParentValues3 :=
  extendParent3 0 read0 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents0_eq : ∀ node strategy axis orbit, parents0 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 0 (by omega) read0 read0_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 1. -/
def parents1 : ParentValues3 :=
  extendParent3 1 read1 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents1_eq : ∀ node strategy axis orbit, parents1 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 1 (by omega) read1 read1_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 2. -/
def parents2 : ParentValues3 :=
  extendParent3 2 read2 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents2_eq : ∀ node strategy axis orbit, parents2 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 2 (by omega) read2 read2_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 3. -/
def parents3 : ParentValues3 :=
  extendParent3 3 read3 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents3_eq : ∀ node strategy axis orbit, parents3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 3 (by omega) read3 read3_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 4. -/
def parents4 : ParentValues3 :=
  extendParent3 4 read4 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents4_eq : ∀ node strategy axis orbit, parents4 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 4 (by omega) read4 read4_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 5. -/
def parents5 : ParentValues3 :=
  extendParent3 5 read5 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents5_eq : ∀ node strategy axis orbit, parents5 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 5 (by omega) read5 read5_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 6. -/
def parents6 : ParentValues3 :=
  extendParent3 6 read6 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents6_eq : ∀ node strategy axis orbit, parents6 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 6 (by omega) read6 read6_eq _ (fun _ _ _ _ => rfl)

/-- Exact summary of original node 0 on fine axis 0. -/
def summary0 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-334426582471905 : ℚ) / 2417851639229258349412352⟩, ⟨(4 : ℚ) / 1, (334426582471905 : ℚ) / 2417851639229258349412352⟩
]
/-- Original node 0: all strategies and physical roles normalize to the summary. -/
theorem checked0 : mergeNormalizeLogExpression (cachedNode3 parents0 0 0) = summary0 := by decide +kernel
/-- Exact summary of original node 1 on fine axis 0. -/
def summary1 : RationalLogExpression := [
  ⟨(371489 : ℚ) / 4398046511104, (-8599519078240896005723073403678917 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(4398046139615 : ℚ) / 4398046511104, (-101809425540467997230036517715957510049595 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(2 : ℚ) / 1, (-111957149245258528323383983058475563557249834346780049 : ℚ) / 3213876088517980551083924184682325205044405987565585670602752⟩,
  ⟨(4 : ℚ) / 1, (111973660746843472258551986698123485127353251419559313 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩
]
/-- Original node 1: all strategies and physical roles normalize to the summary. -/
theorem checked1 : mergeNormalizeLogExpression (cachedNode3 parents1 1 0) = summary1 := by decide +kernel
/-- Exact summary of original node 2 on fine axis 0. -/
def summary2 : RationalLogExpression := [
  ⟨(169361011615 : ℚ) / 549755813888, (-113927008763419891174154301056775 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(172294855649 : ℚ) / 549755813888, (-46822120515783268369886337912747 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(189167190467 : ℚ) / 549755813888, (-45424236349878513447558616036659 : ℚ) / 5846006549323611672814739330865132078623730171904⟩,
  ⟨(804374081095 : ℚ) / 2199023255552, (-5382463250020719035447350516629668323845 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(1678413506957 : ℚ) / 4398046511104, (-2366191261554654383477968154449635 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2719633004147 : ℚ) / 4398046511104, (-3834080113377644530266359092685085 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(1394649174457 : ℚ) / 2199023255552, (-9332284697646753171122816383300162330107 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(360588623421 : ℚ) / 549755813888, (-86587229079824079981116983757517 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(377460958239 : ℚ) / 549755813888, (-102577191931221021307793281298517 : ℚ) / 5846006549323611672814739330865132078623730171904⟩,
  ⟨(380394802273 : ℚ) / 549755813888, (-255886768500366858997682677242105 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(2 : ℚ) / 1, (-492493170072748976118589753236585155087201834373309 : ℚ) / 401734511064747568885490523085290650630550748445698208825344⟩, ⟨(4 : ℚ) / 1, (677433233622276297796810687068022194110522863915197 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩
]
/-- Original node 2: all strategies and physical roles normalize to the summary. -/
theorem checked2 : mergeNormalizeLogExpression (cachedNode3 parents2 2 0) = summary2 := by decide +kernel
/-- Exact summary of original node 3 on fine axis 0. -/
def summary3 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-12876670504471954213 : ℚ) / 19342813113834066795298816⟩, ⟨(4 : ℚ) / 1, (12876670504471954213 : ℚ) / 19342813113834066795298816⟩
]
/-- Original node 3: all strategies and physical roles normalize to the summary. -/
theorem checked3 : mergeNormalizeLogExpression (cachedNode3 parents3 3 0) = summary3 := by decide +kernel
/-- Exact summary of original node 4 on fine axis 0. -/
def summary4 : RationalLogExpression := [
  ⟨(1545544049935 : ℚ) / 4398046511104, (-250804950562511961584958737681175 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(1586395501393 : ℚ) / 4398046511104, (-9198124348750422329368967161933649000691 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(396599045323 : ℚ) / 1099511627776, (-3179388675918562001380489703238699797637 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(1586396187953 : ℚ) / 4398046511104, (-7282651611237776626857124096095186667063761 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2811650323151 : ℚ) / 4398046511104, (-12907412354888672902359089214291163918743087 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(702912582453 : ℚ) / 1099511627776, (-5634991639961307543241950650400935818107 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(2811651009711 : ℚ) / 4398046511104, (-16302312752338453796358140824273049241357 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2852502461169 : ℚ) / 4398046511104, (-462893140304233189295298272883945 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2 : ℚ) / 1, (-21792849916806933105456713412436721521245043991234561847 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(4 : ℚ) / 1, (29824306588909826477531026819476198392528568195261744951 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]
/-- Original node 4: all strategies and physical roles normalize to the summary. -/
theorem checked4 : mergeNormalizeLogExpression (cachedNode3 parents4 4 0) = summary4 := by decide +kernel
/-- Exact summary of original node 5 on fine axis 0. -/
def summary5 : RationalLogExpression := [
  ⟨(266621 : ℚ) / 274877906944, (-114759817840992181183712375 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(41419799097326836116547 : ℚ) / 2417851639229258349412352, (287202322074928832828157126445589370405327 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(85293451684171764609741 : ℚ) / 4835703278458516698824704, (591419512294564497430651695034255605150081 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(46462581280290329245925 : ℚ) / 2417851639229258349412352, (-322168661464022214663415070047106749330425 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(387538402516893484657515 : ℚ) / 19342813113834066795298816, (-2687167285252320109218540586245120283998615 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(14581524937 : ℚ) / 549755813888, (-1512500014282255538329476885923310613643 : ℚ) / 11692013098647223345629478661730264157247460343808⟩,
  ⟨(379648711701 : ℚ) / 4398046511104, (-2632460657693518444159394622441 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(379750508409 : ℚ) / 4398046511104, (-2633166509763164777687261199069 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(44640391327 : ℚ) / 274877906944, (17483169694546690917628971800758689462549 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(800343634959 : ℚ) / 4398046511104, (321489236074062119495933806108097863398291 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(3597702876145 : ℚ) / 4398046511104, (1445157678217261814484004069403868775402605 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(230237515617 : ℚ) / 274877906944, (90171287390758828548458178160738043692779 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(4269174071970272363793715 : ℚ) / 4835703278458516698824704, (29602188652119103826917260130070039766322815 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(2136666291713768231277501 : ℚ) / 2417851639229258349412352, (14815511756526742731510044112784959137480241 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(17285114312719000646767765 : ℚ) / 19342813113834066795298816, (-119853912286693677122153044589684027840693865 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(2162674971456254096262939 : ℚ) / 2417851639229258349412352, (-14995854331308260388606960469106435224865799 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(1980182570903 : ℚ) / 2199023255552, (-13730463326471030233891684395123 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(990478879799 : ℚ) / 1099511627776, (-6867919218439815979008108679059 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(535174288951 : ℚ) / 549755813888, (-55512103375960056648906276104103850134389 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(274877640323 : ℚ) / 274877906944, (-118313665960405396367396936479625 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(2 : ℚ) / 1, (-4338631937811641713843601415633458455604161979011796517 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(4 : ℚ) / 1, (3686867588368907426535270158692650440313447823344955867 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(8 : ℚ) / 1, (325882174721367143654165628470404007645357077833420325 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]
/-- Original node 5: all strategies and physical roles normalize to the summary. -/
theorem checked5 : mergeNormalizeLogExpression (cachedNode3 parents5 5 0) = summary5 := by decide +kernel
/-- Exact summary of original node 6 on fine axis 0. -/
def summary6 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-69627485486150570187 : ℚ) / 9671406556917033397649408⟩, ⟨(4 : ℚ) / 1, (69627485486150570187 : ℚ) / 9671406556917033397649408⟩
]
/-- Original node 6: all strategies and physical roles normalize to the summary. -/
theorem checked6 : mergeNormalizeLogExpression (cachedNode3 parents6 6 0) = summary6 := by decide +kernel

/-- Every complete node summary in original source order. -/
def summaries : Fin 7 → RationalLogExpression := ![summary0, summary1, summary2, summary3, summary4, summary5, summary6]
/-- Each original node is identified separately without omitting any strategy or role. -/
theorem checked : ∀ offset, rationalLogValue (summaries offset) =
    rationalLogValue (sourceSum3 (finProdFinEquiv ((0 : Fin 135), offset)) 0) := by
  intro offset
  fin_cases offset
  · exact node3_value parents0 parents0_eq 0 0 summary0 checked0
  · exact node3_value parents1 parents1_eq 1 0 summary1 checked1
  · exact node3_value parents2 parents2_eq 2 0 summary2 checked2
  · exact node3_value parents3 parents3_eq 3 0 summary3 checked3
  · exact node3_value parents4 parents4_eq 4 0 summary4 checked4
  · exact node3_value parents5 parents5_eq 5 0 summary5 checked5
  · exact node3_value parents6 parents6_eq 6 0 summary6 checked6
/-- Seven independently checked complete node summaries. -/
def expression : RationalLogExpression := finiteLogSum summaries
/-- Combining the seven exact summaries preserves the whole source-block value. -/
theorem value : rationalLogValue expression =
    ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((0 : Fin 135), offset)) 0) :=
  block3_value 0 0 summaries checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache000A0
