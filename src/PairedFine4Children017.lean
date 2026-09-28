import SuppliedPairedFineTableReads
import RootFineCachedParent4
import RootFineIntegerVectorCheck
import SuppliedRootFineParent3Block066
import SuppliedRootFineParent3Block067
import SuppliedRootFineParent3Block068
import SuppliedRootFineParent3Block069
import SuppliedRootFineParent3Block070
import SuppliedRootFineParent3Block071
import SuppliedRootFineParent3Block072
import SuppliedRootFineParent3Block073

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children017
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 66. -/
def read66 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block066.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 66. -/
theorem read66_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read66 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨66, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block066.table read66 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 67. -/
def read67 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block067.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 67. -/
theorem read67_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read67 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨67, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block067.table read67 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 68. -/
def read68 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block068.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 68. -/
theorem read68_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read68 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨68, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block068.table read68 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 69. -/
def read69 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block069.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 69. -/
theorem read69_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read69 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨69, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block069.table read69 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 70. -/
def read70 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block070.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 70. -/
theorem read70_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read70 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨70, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block070.table read70 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 71. -/
def read71 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block071.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 71. -/
theorem read71_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read71 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨71, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block071.table read71 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 72. -/
def read72 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block072.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 72. -/
theorem read72_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read72 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨72, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block072.table read72 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 73. -/
def read73 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block073.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 73. -/
theorem read73_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read73 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨73, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block073.table read73 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through proof-free reads of the checked tables, with the exact source formula elsewhere. -/
def parent3 : RootFineCachedParent4.Parent3Values :=
  extendParent3 66 read66 (extendParent3 67 read67 (extendParent3 68 read68 (extendParent3 69 read69 (extendParent3 70 read70 (extendParent3 71 read71 (extendParent3 72 read72 (extendParent3 73 read73 (SuppliedRootFineParent3Integers.numerator))))))))
/-- Every parent3 value equals the complete original integer hierarchy. -/
theorem parent3_eq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  (extendParent3_eq 66 (by omega) read66 read66_eq _ (extendParent3_eq 67 (by omega) read67 read67_eq _ (extendParent3_eq 68 (by omega) read68 read68_eq _ (extendParent3_eq 69 (by omega) read69 read69_eq _ (extendParent3_eq 70 (by omega) read70 read70_eq _ (extendParent3_eq 71 (by omega) read71 read71_eq _ (extendParent3_eq 72 (by omega) read72 read72_eq _ (extendParent3_eq 73 (by omega) read73 read73_eq _ (fun _ _ _ _ => rfl)))))))))

/-- Prepared complete child numerators at 2^178 in original column, physical axis, and orbit order. -/
def rows : Fin 45 → Fin 3 → Fin 21 → ℤ := ![
  ![![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544]],
  ![![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0]],
  ![![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12248926233324610171292293830710125463508314939719680, 153419928064165948291775418989550168123049912389599232, 0, 0, 217455030918981656126519043967317002318126553216581632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12248926233324610171292293830710125463508314939719680, 0, 0, 153419928064165948291775418989550168123049912389599232, 217455030918981656126519043967317002318126553216581632, 0, 0]],
  ![![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 23824322765697986556848500021750126228882733056131072, 0, 0, 34757524672732388423387155668845004104054740560642048, 324542037778041839609351101096982165571747306929127424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23824322765697986556848500021750126228882733056131072, 0, 0, 34757524672732388423387155668845004104054740560642048, 0, 0, 324542037778041839609351101096982165571747306929127424, 0, 0, 0, 0]],
  ![![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 1661561233550564453096900484164500191917746432245760, 0, 0, 0, 99290041563025325606224845389496006037222691906256896, 0, 2337316624050514354131606244554660467215627521622016, 50817742988214962290227072470758155492505097636675584, 0, 0, 229017222807630847885906332198603973715823617049100288, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 1661561233550564453096900484164500191917746432245760, 0, 0, 0, 99290041563025325606224845389496006037222691906256896, 0, 2337316624050514354131606244554660467215627521622016, 50817742988214962290227072470758155492505097636675584, 0, 0, 229017222807630847885906332198603973715823617049100288, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0]],
  ![![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63356784534367497457213032796935684096, 0, 0, 1250193094086790891530945278300576711199162368, 383123883966279057146011330889134560391075272411054080, 0, 0]],
  ![![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 13556560038953352640999705975467872884518303249203200, 126315242366945191337960165118968252301385077929017344, 0, 0, 243252082810573670610626885693141170718781399367680000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10241964119536139172280375494319519841165791723520, 0, 0, 13556130466113197080900050928090970607139263646531584, 0, 0, 369557512786239481369514425483992005777704351107645440, 0, 0, 0, 0]],
  ![![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10170309691400246663688444688092571845876391016923136, 0, 0, 31764681766402889343771810396329546558642934532538368, 341188893758669078582126501703155177500165454996439040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 76885715274435651701007715701825495885021293051904, 0, 0, 0, 55167053219254899886747005510550450528569510902890496, 0, 38972988414632101909420398257752740363574647369728, 30213767589940930391656674800681945873947306636779520, 0, 0, 297627205703587316557572648362385321265919367065808896, 0, 0, 0, 0, 0]],
  ![![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 257142345731342565414680532891860089716212508917760, 0, 0, 0, 60424996306008962532166485590127940939496753524113408, 0, 106526123930444842254965635988910807958659167109120, 31065163766048384796664653453708901626634774867705856, 0, 0, 291270056674753079853085971574859682440878380478054400, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 9507052173548230237249589874435826773548456050950144, 0, 0, 32166381162208851404708848219185531749359521347141632, 341450451880715132947628318693955937381776803147808768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 12136196103286551356038938503334658014076928809500672, 152169824395030273271981532405914788158715314479038464, 0, 0, 218817864718155389961566285878327849731892537257361408, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12136196103286551356038938503334658014076928809500672, 0, 0, 152169824395030273271981532405914788158715314479038464, 218817864718155389961566285878327849731892537257361408, 0, 0]],
  ![![0, 0, 13679888465831276658602702711826380741803757726072832, 126301039203248347682744443455156382501530666694344704, 0, 0, 243142957547392590248239610620594532661350356125483008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14326909051093727857342468091413623520014469431296, 0, 0, 13679286700163526040895261392147839079886918936166400, 0, 0, 369430271607257594820834152927338043201277847140302848, 0, 0, 0, 0]],
  ![![0, 0, 12818858491010846216508061626741301694966428277407744, 128298508716050332452983942664155416686467883514986496, 0, 0, 242006518009411035920094752496680577523250468753506304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12820012446066623628448283645371086822162504116862976, 128296582403989789282847847762539399309782658647588864, 0, 0, 242007290366415801678290625379666809772739617781448704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 54292081221179419423397185055038601491716239261696, 0, 0, 0, 52817102120745524551976233211261693410868576139608064, 0, 1199079386718494560311459697719709474319890089873408, 23017801835532556016859372932447828099879586423955456, 0, 0, 306035609792254460041016293761093026318125011653201920, 0, 0, 0, 0, 0]],
  ![![0, 0, 6652631771219608418531200069432130996309838268465152, 135088788411212915244588050442356508770395250136973312, 0, 0, 241382465034039690926467506275788656137979692140462080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10132703599043248832762895997662766614740927491604480, 0, 0, 24742602121870167029715661135609993173444692614840320, 348248579495558798727108199654304536116499160439455744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 9450323588984938095632198354309655489831506454511616, 0, 0, 14705956551007583862918142622253849576959799505977344, 358967605076479692631036415811013790837893474585411584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 3572101328147328404645853419646241195335614464, 162419520739645172464143758787872490761614166708977664, 0, 0, 220704360904725713978114593353851385496829418501308416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 4805541971090636685801309505011500464472064, 0, 0, 0, 816144820527127339848168035576178992723525632, 0, 115209403158537005410610788054275129204378624, 6562242926869239174210002558212861236263315456, 0, 0, 383123877718069522063592600632994604556357921890208768, 0, 0, 0, 0, 0], ![0, 0, 614775261731437433186557905174871239424999424, 162419524457960616230995771265567715772185496948572160, 0, 0, 220704360143736336627153552335451674957628044172328960, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
]

/-- Column 0: prepared values equal the actual complete child law on every physical axis. -/
theorem checked0 : ∀ axis, integerVectorCheck (rows 0 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 0 axis orbit) = true := by decide +kernel
/-- Column 1: prepared values equal the actual complete child law on every physical axis. -/
theorem checked1 : ∀ axis, integerVectorCheck (rows 1 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 1 axis orbit) = true := by decide +kernel
/-- Column 2: prepared values equal the actual complete child law on every physical axis. -/
theorem checked2 : ∀ axis, integerVectorCheck (rows 2 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 2 axis orbit) = true := by decide +kernel
/-- Column 3: prepared values equal the actual complete child law on every physical axis. -/
theorem checked3 : ∀ axis, integerVectorCheck (rows 3 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 3 axis orbit) = true := by decide +kernel
/-- Column 4: prepared values equal the actual complete child law on every physical axis. -/
theorem checked4 : ∀ axis, integerVectorCheck (rows 4 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 4 axis orbit) = true := by decide +kernel
/-- Column 5: prepared values equal the actual complete child law on every physical axis. -/
theorem checked5 : ∀ axis, integerVectorCheck (rows 5 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 5 axis orbit) = true := by decide +kernel
/-- Column 6: prepared values equal the actual complete child law on every physical axis. -/
theorem checked6 : ∀ axis, integerVectorCheck (rows 6 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 6 axis orbit) = true := by decide +kernel
/-- Column 7: prepared values equal the actual complete child law on every physical axis. -/
theorem checked7 : ∀ axis, integerVectorCheck (rows 7 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 7 axis orbit) = true := by decide +kernel
/-- Column 8: prepared values equal the actual complete child law on every physical axis. -/
theorem checked8 : ∀ axis, integerVectorCheck (rows 8 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 8 axis orbit) = true := by decide +kernel
/-- Column 9: prepared values equal the actual complete child law on every physical axis. -/
theorem checked9 : ∀ axis, integerVectorCheck (rows 9 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 9 axis orbit) = true := by decide +kernel
/-- Column 10: prepared values equal the actual complete child law on every physical axis. -/
theorem checked10 : ∀ axis, integerVectorCheck (rows 10 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 10 axis orbit) = true := by decide +kernel
/-- Column 11: prepared values equal the actual complete child law on every physical axis. -/
theorem checked11 : ∀ axis, integerVectorCheck (rows 11 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 11 axis orbit) = true := by decide +kernel
/-- Column 12: prepared values equal the actual complete child law on every physical axis. -/
theorem checked12 : ∀ axis, integerVectorCheck (rows 12 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 12 axis orbit) = true := by decide +kernel
/-- Column 13: prepared values equal the actual complete child law on every physical axis. -/
theorem checked13 : ∀ axis, integerVectorCheck (rows 13 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 13 axis orbit) = true := by decide +kernel
/-- Column 14: prepared values equal the actual complete child law on every physical axis. -/
theorem checked14 : ∀ axis, integerVectorCheck (rows 14 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 14 axis orbit) = true := by decide +kernel
/-- Column 15: prepared values equal the actual complete child law on every physical axis. -/
theorem checked15 : ∀ axis, integerVectorCheck (rows 15 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 15 axis orbit) = true := by decide +kernel
/-- Column 16: prepared values equal the actual complete child law on every physical axis. -/
theorem checked16 : ∀ axis, integerVectorCheck (rows 16 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 16 axis orbit) = true := by decide +kernel
/-- Column 17: prepared values equal the actual complete child law on every physical axis. -/
theorem checked17 : ∀ axis, integerVectorCheck (rows 17 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 17 axis orbit) = true := by decide +kernel
/-- Column 18: prepared values equal the actual complete child law on every physical axis. -/
theorem checked18 : ∀ axis, integerVectorCheck (rows 18 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 18 axis orbit) = true := by decide +kernel
/-- Column 19: prepared values equal the actual complete child law on every physical axis. -/
theorem checked19 : ∀ axis, integerVectorCheck (rows 19 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 19 axis orbit) = true := by decide +kernel
/-- Column 20: prepared values equal the actual complete child law on every physical axis. -/
theorem checked20 : ∀ axis, integerVectorCheck (rows 20 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 20 axis orbit) = true := by decide +kernel
/-- Column 21: prepared values equal the actual complete child law on every physical axis. -/
theorem checked21 : ∀ axis, integerVectorCheck (rows 21 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 21 axis orbit) = true := by decide +kernel
/-- Column 22: prepared values equal the actual complete child law on every physical axis. -/
theorem checked22 : ∀ axis, integerVectorCheck (rows 22 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 22 axis orbit) = true := by decide +kernel
/-- Column 23: prepared values equal the actual complete child law on every physical axis. -/
theorem checked23 : ∀ axis, integerVectorCheck (rows 23 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 23 axis orbit) = true := by decide +kernel
/-- Column 24: prepared values equal the actual complete child law on every physical axis. -/
theorem checked24 : ∀ axis, integerVectorCheck (rows 24 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 24 axis orbit) = true := by decide +kernel
/-- Column 25: prepared values equal the actual complete child law on every physical axis. -/
theorem checked25 : ∀ axis, integerVectorCheck (rows 25 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 25 axis orbit) = true := by decide +kernel
/-- Column 26: prepared values equal the actual complete child law on every physical axis. -/
theorem checked26 : ∀ axis, integerVectorCheck (rows 26 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 26 axis orbit) = true := by decide +kernel
/-- Column 27: prepared values equal the actual complete child law on every physical axis. -/
theorem checked27 : ∀ axis, integerVectorCheck (rows 27 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 27 axis orbit) = true := by decide +kernel
/-- Column 28: prepared values equal the actual complete child law on every physical axis. -/
theorem checked28 : ∀ axis, integerVectorCheck (rows 28 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 28 axis orbit) = true := by decide +kernel
/-- Column 29: prepared values equal the actual complete child law on every physical axis. -/
theorem checked29 : ∀ axis, integerVectorCheck (rows 29 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 29 axis orbit) = true := by decide +kernel
/-- Column 30: prepared values equal the actual complete child law on every physical axis. -/
theorem checked30 : ∀ axis, integerVectorCheck (rows 30 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 30 axis orbit) = true := by decide +kernel
/-- Column 31: prepared values equal the actual complete child law on every physical axis. -/
theorem checked31 : ∀ axis, integerVectorCheck (rows 31 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 31 axis orbit) = true := by decide +kernel
/-- Column 32: prepared values equal the actual complete child law on every physical axis. -/
theorem checked32 : ∀ axis, integerVectorCheck (rows 32 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 32 axis orbit) = true := by decide +kernel
/-- Column 33: prepared values equal the actual complete child law on every physical axis. -/
theorem checked33 : ∀ axis, integerVectorCheck (rows 33 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 33 axis orbit) = true := by decide +kernel
/-- Column 34: prepared values equal the actual complete child law on every physical axis. -/
theorem checked34 : ∀ axis, integerVectorCheck (rows 34 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 34 axis orbit) = true := by decide +kernel
/-- Column 35: prepared values equal the actual complete child law on every physical axis. -/
theorem checked35 : ∀ axis, integerVectorCheck (rows 35 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 35 axis orbit) = true := by decide +kernel
/-- Column 36: prepared values equal the actual complete child law on every physical axis. -/
theorem checked36 : ∀ axis, integerVectorCheck (rows 36 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 36 axis orbit) = true := by decide +kernel
/-- Column 37: prepared values equal the actual complete child law on every physical axis. -/
theorem checked37 : ∀ axis, integerVectorCheck (rows 37 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 37 axis orbit) = true := by decide +kernel
/-- Column 38: prepared values equal the actual complete child law on every physical axis. -/
theorem checked38 : ∀ axis, integerVectorCheck (rows 38 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 38 axis orbit) = true := by decide +kernel
/-- Column 39: prepared values equal the actual complete child law on every physical axis. -/
theorem checked39 : ∀ axis, integerVectorCheck (rows 39 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 39 axis orbit) = true := by decide +kernel
/-- Column 40: prepared values equal the actual complete child law on every physical axis. -/
theorem checked40 : ∀ axis, integerVectorCheck (rows 40 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 40 axis orbit) = true := by decide +kernel
/-- Column 41: prepared values equal the actual complete child law on every physical axis. -/
theorem checked41 : ∀ axis, integerVectorCheck (rows 41 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 41 axis orbit) = true := by decide +kernel
/-- Column 42: prepared values equal the actual complete child law on every physical axis. -/
theorem checked42 : ∀ axis, integerVectorCheck (rows 42 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 42 axis orbit) = true := by decide +kernel
/-- Column 43: prepared values equal the actual complete child law on every physical axis. -/
theorem checked43 : ∀ axis, integerVectorCheck (rows 43 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 43 axis orbit) = true := by decide +kernel
/-- Column 44: prepared values equal the actual complete child law on every physical axis. -/
theorem checked44 : ∀ axis, integerVectorCheck (rows 44 axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 44 axis orbit) = true := by decide +kernel

/-- Every prepared child row is exact. -/
theorem rows_checked : ∀ column axis, integerVectorCheck (rows column axis)
    (fun orbit => RootFineCachedParent4.child parent3 17 column axis orbit) = true := by
  intro column axis
  fin_cases column
  exacts [checked0 axis, checked1 axis, checked2 axis, checked3 axis, checked4 axis, checked5 axis, checked6 axis, checked7 axis, checked8 axis, checked9 axis, checked10 axis, checked11 axis, checked12 axis, checked13 axis, checked14 axis, checked15 axis, checked16 axis, checked17 axis, checked18 axis, checked19 axis, checked20 axis, checked21 axis, checked22 axis, checked23 axis, checked24 axis, checked25 axis, checked26 axis, checked27 axis, checked28 axis, checked29 axis, checked30 axis, checked31 axis, checked32 axis, checked33 axis, checked34 axis, checked35 axis, checked36 axis, checked37 axis, checked38 axis, checked39 axis, checked40 axis, checked41 axis, checked42 axis, checked43 axis, checked44 axis]

/-- Fast exact child lookup for original parent 17. -/
def numerator (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) : ℤ := rows column axis orbit

/-- Every cached child value equals the complete original integer child hierarchy. -/
theorem numerator_eq : ∀ column axis orbit, numerator column axis orbit =
    SuppliedRootFineChild3Integers.numerator 17 (shapeColumnEquiv 8 column) axis orbit :=
  fun column axis orbit => (integerVectorCheck_sound _ _ (rows_checked column axis) orbit).trans
    (RootFineCachedParent4.child_eq parent3 parent3_eq 17 column axis orbit)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children017
