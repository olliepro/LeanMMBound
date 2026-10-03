module

public import TerminalRateCertificateWindows
public import CertifiedLevel3Rate0

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3CertificateTable
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block008.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part009 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block009.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part010 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block010.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part011 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block011.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part012 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block012.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part013 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block013.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part014 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block014.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part015 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block015.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part016 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block016.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part017 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block017.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part018 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block018.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part019 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block019.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part020 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block020.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part021 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block021.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part022 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block022.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part023 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block023.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part024 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block024.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part025 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block025.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part026 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block026.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part027 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block027.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part028 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block028.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part029 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block029.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part030 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block030.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part031 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block031.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part032 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block032.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part033 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block033.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part034 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block034.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part035 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block035.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part036 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block036.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part037 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block037.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part038 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block038.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part039 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block039.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part040 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block040.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part041 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block041.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part042 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block042.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part043 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block043.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part044 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block044.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part045 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block045.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part046 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block046.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part047 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block047.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part048 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block048.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part049 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block049.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part050 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block050.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part051 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block051.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part052 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block052.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part053 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block053.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part054 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block054.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part055 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block055.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part056 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block056.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part057 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block057.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part058 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block058.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part059 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block059.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part060 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block060.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part061 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block061.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part062 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block062.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part063 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block063.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part064 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block064.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part065 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block065.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part066 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block066.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part067 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block067.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part068 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block068.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part069 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block069.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part070 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block070.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part071 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block071.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part072 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block072.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part073 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block073.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part074 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block074.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part075 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block075.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part076 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block076.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part077 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block077.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part078 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block078.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part079 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block079.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part080 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block080.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part081 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block081.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part082 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block082.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part083 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block083.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part084 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block084.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part085 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block085.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part086 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block086.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part087 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block087.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part088 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block088.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part089 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block089.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part090 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block090.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part091 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block091.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part092 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block092.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part093 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block093.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part094 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block094.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part095 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block095.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part096 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block096.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part097 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block097.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part098 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block098.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part099 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block099.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part100 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block100.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part101 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block101.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part102 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block102.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part103 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block103.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part104 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block104.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part105 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block105.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part106 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block106.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part107 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block107.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part108 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block108.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part109 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block109.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part110 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block110.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part111 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block111.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part112 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block112.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part113 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block113.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part114 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block114.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part115 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block115.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part116 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block116.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part117 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block117.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part118 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block118.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part119 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block119.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part120 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block120.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part121 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block121.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part122 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block122.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part123 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block123.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part124 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block124.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part125 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block125.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part126 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block126.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part127 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block127.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part128 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block128.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part129 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block129.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part130 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block130.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part131 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block131.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part132 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block132.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part133 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block133.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part134 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level30Block134.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part135 : SourceTable IntegerLogTerm 377 :=
  SourceTable.ofList RateCertificateData.Level30Block135.terms (by decide)

/-- Every unchanged original certificate term, with balanced coordinate lookup. -/
def table : SourceTable IntegerLogTerm 69497 := (((((((part000).append (part001)).append ((part002).append (part003))).append (((part004).append (part005)).append ((part006).append (part007)))).append ((((part008).append (part009)).append ((part010).append (part011))).append (((part012).append (part013)).append ((part014).append ((part015).append (part016)))))).append (((((part017).append (part018)).append ((part019).append (part020))).append (((part021).append (part022)).append ((part023).append (part024)))).append ((((part025).append (part026)).append ((part027).append (part028))).append (((part029).append (part030)).append ((part031).append ((part032).append (part033))))))).append ((((((part034).append (part035)).append ((part036).append (part037))).append (((part038).append (part039)).append ((part040).append (part041)))).append ((((part042).append (part043)).append ((part044).append (part045))).append (((part046).append (part047)).append ((part048).append ((part049).append (part050)))))).append (((((part051).append (part052)).append ((part053).append (part054))).append (((part055).append (part056)).append ((part057).append (part058)))).append ((((part059).append (part060)).append ((part061).append (part062))).append (((part063).append (part064)).append ((part065).append ((part066).append (part067)))))))).append (((((((part068).append (part069)).append ((part070).append (part071))).append (((part072).append (part073)).append ((part074).append (part075)))).append ((((part076).append (part077)).append ((part078).append (part079))).append (((part080).append (part081)).append ((part082).append ((part083).append (part084)))))).append (((((part085).append (part086)).append ((part087).append (part088))).append (((part089).append (part090)).append ((part091).append (part092)))).append ((((part093).append (part094)).append ((part095).append (part096))).append (((part097).append (part098)).append ((part099).append ((part100).append (part101))))))).append ((((((part102).append (part103)).append ((part104).append (part105))).append (((part106).append (part107)).append ((part108).append (part109)))).append ((((part110).append (part111)).append ((part112).append (part113))).append (((part114).append (part115)).append ((part116).append ((part117).append (part118)))))).append (((((part119).append (part120)).append ((part121).append (part122))).append (((part123).append (part124)).append ((part125).append (part126)))).append ((((part127).append (part128)).append ((part129).append (part130))).append (((part131).append (part132)).append ((part133).append ((part134).append (part135))))))))

attribute [local irreducible] integerLogValue

/-- Balanced lookup preserves the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedLevel3Rate0.value := by
  simp (config := { maxSteps := 1000000 }) only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, part012, part013, part014, part015, part016, part017, part018, part019, part020, part021, part022, part023, part024, part025, part026, part027, part028, part029, part030, part031, part032, part033, part034, part035, part036, part037, part038, part039, part040, part041, part042, part043, part044, part045, part046, part047, part048, part049, part050, part051, part052, part053, part054, part055, part056, part057, part058, part059, part060, part061, part062, part063, part064, part065, part066, part067, part068, part069, part070, part071, part072, part073, part074, part075, part076, part077, part078, part079, part080, part081, part082, part083, part084, part085, part086, part087, part088, part089, part090, part091, part092, part093, part094, part095, part096, part097, part098, part099, part100, part101, part102, part103, part104, part105, part106, part107, part108, part109, part110, part111, part112, part113, part114, part115, part116, part117, part118, part119, part120, part121, part122, part123, part124, part125, part126, part127, part128, part129, part130, part131, part132, part133, part134, part135, RateCertificateData.Level30Block000.certificate, RateCertificateData.Level30Block001.certificate, RateCertificateData.Level30Block002.certificate, RateCertificateData.Level30Block003.certificate, RateCertificateData.Level30Block004.certificate, RateCertificateData.Level30Block005.certificate, RateCertificateData.Level30Block006.certificate, RateCertificateData.Level30Block007.certificate, RateCertificateData.Level30Block008.certificate, RateCertificateData.Level30Block009.certificate, RateCertificateData.Level30Block010.certificate, RateCertificateData.Level30Block011.certificate, RateCertificateData.Level30Block012.certificate, RateCertificateData.Level30Block013.certificate, RateCertificateData.Level30Block014.certificate, RateCertificateData.Level30Block015.certificate, RateCertificateData.Level30Block016.certificate, RateCertificateData.Level30Block017.certificate, RateCertificateData.Level30Block018.certificate, RateCertificateData.Level30Block019.certificate, RateCertificateData.Level30Block020.certificate, RateCertificateData.Level30Block021.certificate, RateCertificateData.Level30Block022.certificate, RateCertificateData.Level30Block023.certificate, RateCertificateData.Level30Block024.certificate, RateCertificateData.Level30Block025.certificate, RateCertificateData.Level30Block026.certificate, RateCertificateData.Level30Block027.certificate, RateCertificateData.Level30Block028.certificate, RateCertificateData.Level30Block029.certificate, RateCertificateData.Level30Block030.certificate, RateCertificateData.Level30Block031.certificate, RateCertificateData.Level30Block032.certificate, RateCertificateData.Level30Block033.certificate, RateCertificateData.Level30Block034.certificate, RateCertificateData.Level30Block035.certificate, RateCertificateData.Level30Block036.certificate, RateCertificateData.Level30Block037.certificate, RateCertificateData.Level30Block038.certificate, RateCertificateData.Level30Block039.certificate, RateCertificateData.Level30Block040.certificate, RateCertificateData.Level30Block041.certificate, RateCertificateData.Level30Block042.certificate, RateCertificateData.Level30Block043.certificate, RateCertificateData.Level30Block044.certificate, RateCertificateData.Level30Block045.certificate, RateCertificateData.Level30Block046.certificate, RateCertificateData.Level30Block047.certificate, RateCertificateData.Level30Block048.certificate, RateCertificateData.Level30Block049.certificate, RateCertificateData.Level30Block050.certificate, RateCertificateData.Level30Block051.certificate, RateCertificateData.Level30Block052.certificate, RateCertificateData.Level30Block053.certificate, RateCertificateData.Level30Block054.certificate, RateCertificateData.Level30Block055.certificate, RateCertificateData.Level30Block056.certificate, RateCertificateData.Level30Block057.certificate, RateCertificateData.Level30Block058.certificate, RateCertificateData.Level30Block059.certificate, RateCertificateData.Level30Block060.certificate, RateCertificateData.Level30Block061.certificate, RateCertificateData.Level30Block062.certificate, RateCertificateData.Level30Block063.certificate, RateCertificateData.Level30Block064.certificate, RateCertificateData.Level30Block065.certificate, RateCertificateData.Level30Block066.certificate, RateCertificateData.Level30Block067.certificate, RateCertificateData.Level30Block068.certificate, RateCertificateData.Level30Block069.certificate, RateCertificateData.Level30Block070.certificate, RateCertificateData.Level30Block071.certificate, RateCertificateData.Level30Block072.certificate, RateCertificateData.Level30Block073.certificate, RateCertificateData.Level30Block074.certificate, RateCertificateData.Level30Block075.certificate, RateCertificateData.Level30Block076.certificate, RateCertificateData.Level30Block077.certificate, RateCertificateData.Level30Block078.certificate, RateCertificateData.Level30Block079.certificate, RateCertificateData.Level30Block080.certificate, RateCertificateData.Level30Block081.certificate, RateCertificateData.Level30Block082.certificate, RateCertificateData.Level30Block083.certificate, RateCertificateData.Level30Block084.certificate, RateCertificateData.Level30Block085.certificate, RateCertificateData.Level30Block086.certificate, RateCertificateData.Level30Block087.certificate, RateCertificateData.Level30Block088.certificate, RateCertificateData.Level30Block089.certificate, RateCertificateData.Level30Block090.certificate, RateCertificateData.Level30Block091.certificate, RateCertificateData.Level30Block092.certificate, RateCertificateData.Level30Block093.certificate, RateCertificateData.Level30Block094.certificate, RateCertificateData.Level30Block095.certificate, RateCertificateData.Level30Block096.certificate, RateCertificateData.Level30Block097.certificate, RateCertificateData.Level30Block098.certificate, RateCertificateData.Level30Block099.certificate, RateCertificateData.Level30Block100.certificate, RateCertificateData.Level30Block101.certificate, RateCertificateData.Level30Block102.certificate, RateCertificateData.Level30Block103.certificate, RateCertificateData.Level30Block104.certificate, RateCertificateData.Level30Block105.certificate, RateCertificateData.Level30Block106.certificate, RateCertificateData.Level30Block107.certificate, RateCertificateData.Level30Block108.certificate, RateCertificateData.Level30Block109.certificate, RateCertificateData.Level30Block110.certificate, RateCertificateData.Level30Block111.certificate, RateCertificateData.Level30Block112.certificate, RateCertificateData.Level30Block113.certificate, RateCertificateData.Level30Block114.certificate, RateCertificateData.Level30Block115.certificate, RateCertificateData.Level30Block116.certificate, RateCertificateData.Level30Block117.certificate, RateCertificateData.Level30Block118.certificate, RateCertificateData.Level30Block119.certificate, RateCertificateData.Level30Block120.certificate, RateCertificateData.Level30Block121.certificate, RateCertificateData.Level30Block122.certificate, RateCertificateData.Level30Block123.certificate, RateCertificateData.Level30Block124.certificate, RateCertificateData.Level30Block125.certificate, RateCertificateData.Level30Block126.certificate, RateCertificateData.Level30Block127.certificate, RateCertificateData.Level30Block128.certificate, RateCertificateData.Level30Block129.certificate, RateCertificateData.Level30Block130.certificate, RateCertificateData.Level30Block131.certificate, RateCertificateData.Level30Block132.certificate, RateCertificateData.Level30Block133.certificate, RateCertificateData.Level30Block134.certificate, RateCertificateData.Level30Block135.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedLevel3Rate0.value, CertifiedLevel3Rate0.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- Adjacent original-term window endpoints in complete source order. -/
def cuts : List ℕ := [0, 388, 804, 1203, 1649, 2113, 2659, 3124, 3511, 3939, 4399, 4848, 5430, 5882, 6429, 6998, 7477, 7993, 8431, 8973, 9537, 10025, 10493, 10984, 11450, 12027, 12541, 13119, 13618, 14188, 14703, 15268, 15863, 16399, 16966, 17407, 17933, 18447, 18902, 19432, 19940, 20534, 21057, 21662, 22214, 22766, 23312, 23823, 24418, 24977, 25477, 26088, 26623, 27226, 27738, 28273, 28818, 29297, 29764, 30247, 30844, 31338, 31923, 32479, 32972, 33544, 34074, 34594, 35185, 35680, 36279, 36823, 37375, 37924, 38510, 38937, 39342, 39922, 40358, 40985, 41434, 42040, 42607, 43076, 43683, 44176, 44743, 45346, 45773, 46406, 46850, 47424, 47870, 48276, 48833, 49251, 49790, 50248, 50864, 51357, 51977, 52588, 53021, 53631, 54061, 54631, 55029, 55446, 56038, 56524, 57143, 57633, 58223, 58732, 59354, 59814, 60376, 60764, 61180, 61759, 62197, 62729, 63326, 63867, 64423, 64823, 65277, 65792, 66361, 66854, 67232, 67689, 68156, 68647, 69093, 69497]
/-- Read a source-aligned endpoint. -/
def cut (index : ℕ) : ℕ := cuts[index]?.getD 0
/-- The source partition begins with the first certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel
/-- The source partition ends after the last certificate term. -/
theorem last : cut 135 = 69497 := by decide +kernel
/-- Every consecutive window is ordered and adjacent. -/
theorem ordered : ∀ index : Fin 135, cut index.val ≤ cut (index.val+1) := by decide +kernel
/-- Complete original certificate window corresponding to one original source block. -/
def window (block : Fin 135) : RationalLogExpression :=
  certificateWindow table (cut block.val) (cut (block.val+1))
/-- Every original numerical term occurs in exactly one source-aligned window. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedLevel3Rate0.value := by
  rw [← table_value]
  exact certificate_windows_value table cut first last
    (fun index present => ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3CertificateTable
