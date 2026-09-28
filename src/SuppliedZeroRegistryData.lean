import CheckedIndexTable

/-! Exact target registry over the original deduplicated probability rows.
Zero means unused by zero-leaf extraction; positive codes are one plus the required coarse total. -/
namespace MatrixBounds.Numeric.SuppliedZeroRegistry
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000


/-- Exact source support-target codes beginning at deduplicated row 0. -/
def leaf000 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 11 0 ++ [4] ++ List.replicate 107 0 ++ [3] ++ List.replicate 8 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 128. -/
def leaf001 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 256. -/
def leaf002 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 384. -/
def leaf003 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 512. -/
def leaf004 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 640. -/
def leaf005 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 768. -/
def leaf006 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 896. -/
def leaf007 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1024. -/
def leaf008 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1152. -/
def leaf009 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1280. -/
def leaf010 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1408. -/
def leaf011 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1536. -/
def leaf012 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1664. -/
def leaf013 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1792. -/
def leaf014 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 1920. -/
def leaf015 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2048. -/
def leaf016 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2176. -/
def leaf017 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2304. -/
def leaf018 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2432. -/
def leaf019 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2560. -/
def leaf020 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2688. -/
def leaf021 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2816. -/
def leaf022 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 2944. -/
def leaf023 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3072. -/
def leaf024 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3200. -/
def leaf025 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3328. -/
def leaf026 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3456. -/
def leaf027 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3584. -/
def leaf028 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3712. -/
def leaf029 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3840. -/
def leaf030 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 3968. -/
def leaf031 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4096. -/
def leaf032 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4224. -/
def leaf033 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4352. -/
def leaf034 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4480. -/
def leaf035 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4608. -/
def leaf036 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4736. -/
def leaf037 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4864. -/
def leaf038 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 4992. -/
def leaf039 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5120. -/
def leaf040 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5248. -/
def leaf041 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5376. -/
def leaf042 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5504. -/
def leaf043 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5632. -/
def leaf044 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5760. -/
def leaf045 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 5888. -/
def leaf046 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6016. -/
def leaf047 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6144. -/
def leaf048 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6272. -/
def leaf049 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 0) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6400. -/
def leaf050 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 82 0 ++ [5] ++ [2] ++ List.replicate 44 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6528. -/
def leaf051 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6656. -/
def leaf052 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6784. -/
def leaf053 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 6912. -/
def leaf054 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7040. -/
def leaf055 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7168. -/
def leaf056 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7296. -/
def leaf057 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7424. -/
def leaf058 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7552. -/
def leaf059 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7680. -/
def leaf060 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7808. -/
def leaf061 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 7936. -/
def leaf062 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8064. -/
def leaf063 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8192. -/
def leaf064 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8320. -/
def leaf065 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8448. -/
def leaf066 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8576. -/
def leaf067 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8704. -/
def leaf068 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8832. -/
def leaf069 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 8960. -/
def leaf070 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9088. -/
def leaf071 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9216. -/
def leaf072 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9344. -/
def leaf073 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9472. -/
def leaf074 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9600. -/
def leaf075 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9728. -/
def leaf076 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9856. -/
def leaf077 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 9984. -/
def leaf078 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10112. -/
def leaf079 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10240. -/
def leaf080 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10368. -/
def leaf081 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10496. -/
def leaf082 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10624. -/
def leaf083 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10752. -/
def leaf084 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 10880. -/
def leaf085 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11008. -/
def leaf086 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11136. -/
def leaf087 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11264. -/
def leaf088 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11392. -/
def leaf089 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11520. -/
def leaf090 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11648. -/
def leaf091 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11776. -/
def leaf092 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 11904. -/
def leaf093 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12032. -/
def leaf094 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12160. -/
def leaf095 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12288. -/
def leaf096 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12416. -/
def leaf097 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12544. -/
def leaf098 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12672. -/
def leaf099 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12800. -/
def leaf100 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 12928. -/
def leaf101 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13056. -/
def leaf102 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13184. -/
def leaf103 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13312. -/
def leaf104 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13440. -/
def leaf105 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13568. -/
def leaf106 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13696. -/
def leaf107 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13824. -/
def leaf108 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 13952. -/
def leaf109 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14080. -/
def leaf110 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14208. -/
def leaf111 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14336. -/
def leaf112 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14464. -/
def leaf113 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 128 3) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14592. -/
def leaf114 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList (List.replicate 100 3 ++ [9] ++ [2] ++ [3,3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [8] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7]) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14720. -/
def leaf115 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList ([3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [4] ++ [5] ++ [6] ++ [7] ++ [5] ++ [6] ++ [7] ++ [6] ++ [7,7] ++ List.replicate 4 3 ++ [4] ++ [3,3] ++ [4] ++ [5] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [7] ++ List.replicate 3 3 ++ [4] ++ [5] ++ [6] ++ [7] ++ List.replicate 3 3 ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [5] ++ [6] ++ [7] ++ [3] ++ [6] ++ [7] ++ [3] ++ [7] ++ List.replicate 3 3 ++ [4] ++ [3,3] ++ [4] ++ [3] ++ [4] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4,4] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4,4] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ List.replicate 3 4 ++ [5] ++ [6] ++ [7] ++ [3] ++ [4,4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [6] ++ [7] ++ [3] ++ [4] ++ [7] ++ [3] ++ [4] ++ [3] ++ [4] ++ [3] ++ [4]) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14848. -/
def leaf116 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList ([5] ++ [3,3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5,5] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4,4] ++ [5,5] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4,4] ++ [5,5] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4,4] ++ List.replicate 3 5 ++ [6] ++ [7] ++ [3] ++ [4] ++ [5,5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [7] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [6,6] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5,5] ++ [6,6] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4,4] ++ [5,5] ++ [6,6] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4,4] ++ [5,5] ++ [6,6] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5,5] ++ List.replicate 3 6 ++ [7] ++ [3] ++ [4] ++ [5] ++ [6,6]) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 14976. -/
def leaf117 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList ([7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4] ++ [5] ++ [6] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [6,6] ++ [7,7] ++ [3] ++ [4] ++ [5] ++ [3] ++ [4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [4] ++ [5] ++ [6] ++ [4,4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [6,6] ++ List.replicate 3 7 ++ [3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [3] ++ [4] ++ [5] ++ [6,6] ++ [7,7] ++ [4] ++ [5] ++ [4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [5] ++ [6] ++ [4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5]) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 15104. -/
def leaf118 : CheckedIndexTable 128 18 :=
  CheckedIndexTable.ofList ([6,6] ++ List.replicate 3 7 ++ [3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3,3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [4,4] ++ [5] ++ [6,6] ++ [7,7] ++ List.replicate 3 5 ++ [6,6] ++ [7,7] ++ [6] ++ [4] ++ [5] ++ [6,6] ++ List.replicate 3 7 ++ [3] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [5] ++ [6,6] ++ [7,7] ++ [5] ++ [6,6] ++ [7,7] ++ [4] ++ [5] ++ [6] ++ [7,7] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [4] ++ [5] ++ [6] ++ [7] ++ [5] ++ [6] ++ [7,7] ++ [6,6] ++ [7,7] ++ [5] ++ [6] ++ [7,7] ++ [4] ++ [5] ++ [6] ++ [7] ++ [5] ++ [6] ++ [7] ++ [6] ++ [7,7] ++ [6] ++ [7,7] ++ [5] ++ [6] ++ [7] ++ [6] ++ List.replicate 3 7 ++ [6]) (by decide +kernel) (by decide +kernel)

/-- Exact source support-target codes beginning at deduplicated row 15232. -/
def leaf119 : CheckedIndexTable 47 18 :=
  CheckedIndexTable.ofList (List.replicate 3 7 ++ [17] ++ [2] ++ [3] ++ [4] ++ [5] ++ [6] ++ [7] ++ [8] ++ [9] ++ [10] ++ [11] ++ [12] ++ [13] ++ [14] ++ [15] ++ [16] ++ [3,3] ++ [4,4] ++ [5,5] ++ [6,6] ++ [7,7] ++ [8,8] ++ [9,9] ++ [10,10] ++ [11,11] ++ [12,12] ++ [13,13] ++ [14,14] ++ [15,15] ++ [0,0]) (by decide +kernel) (by decide +kernel)

/-- Complete deduplicated-row target registry with proved bounded lookup. -/
def table : CheckedIndexTable 15279 18 :=
  (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((leaf000).append leaf001).append leaf002).append leaf003).append leaf004).append leaf005).append leaf006).append leaf007).append leaf008).append leaf009).append leaf010).append leaf011).append leaf012).append leaf013).append leaf014).append leaf015).append leaf016).append leaf017).append leaf018).append leaf019).append leaf020).append leaf021).append leaf022).append leaf023).append leaf024).append leaf025).append leaf026).append leaf027).append leaf028).append leaf029).append leaf030).append leaf031).append leaf032).append leaf033).append leaf034).append leaf035).append leaf036).append leaf037).append leaf038).append leaf039).append leaf040).append leaf041).append leaf042).append leaf043).append leaf044).append leaf045).append leaf046).append leaf047).append leaf048).append leaf049).append leaf050).append leaf051).append leaf052).append leaf053).append leaf054).append leaf055).append leaf056).append leaf057).append leaf058).append leaf059).append leaf060).append leaf061).append leaf062).append leaf063).append leaf064).append leaf065).append leaf066).append leaf067).append leaf068).append leaf069).append leaf070).append leaf071).append leaf072).append leaf073).append leaf074).append leaf075).append leaf076).append leaf077).append leaf078).append leaf079).append leaf080).append leaf081).append leaf082).append leaf083).append leaf084).append leaf085).append leaf086).append leaf087).append leaf088).append leaf089).append leaf090).append leaf091).append leaf092).append leaf093).append leaf094).append leaf095).append leaf096).append leaf097).append leaf098).append leaf099).append leaf100).append leaf101).append leaf102).append leaf103).append leaf104).append leaf105).append leaf106).append leaf107).append leaf108).append leaf109).append leaf110).append leaf111).append leaf112).append leaf113).append leaf114).append leaf115).append leaf116).append leaf117).append leaf118).append leaf119

end MatrixBounds.Numeric.SuppliedZeroRegistry
