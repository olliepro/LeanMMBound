import CheckedIndexTable
import CertificateData
import SplitCertificateData
import GibbsCertificateData

/-! Source-indexed access to all supplied rows. Bounds select actual existing
records, and acceptance follows from their original independent kernel checks. -/
namespace MatrixBounds.Numeric.IndexedCertificateRows
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Accepted dyadic rows 0 through 8191. -/
def dyadicGroup0 (index : Fin 8192) : {row : DyadicRow // row.check 17592186044416 = true} := by
  by_cases before0 : index.val < 256
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part000.rows CertificateData.Part000.rows_checked
      ⟨index.val-0, by change index.val-0 < 256; omega⟩
  by_cases before1 : index.val < 512
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part001.rows CertificateData.Part001.rows_checked
      ⟨index.val-256, by change index.val-256 < 256; omega⟩
  by_cases before2 : index.val < 768
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part002.rows CertificateData.Part002.rows_checked
      ⟨index.val-512, by change index.val-512 < 256; omega⟩
  by_cases before3 : index.val < 1024
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part003.rows CertificateData.Part003.rows_checked
      ⟨index.val-768, by change index.val-768 < 256; omega⟩
  by_cases before4 : index.val < 1280
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part004.rows CertificateData.Part004.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 256; omega⟩
  by_cases before5 : index.val < 1536
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part005.rows CertificateData.Part005.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 256; omega⟩
  by_cases before6 : index.val < 1792
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part006.rows CertificateData.Part006.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 256; omega⟩
  by_cases before7 : index.val < 2048
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part007.rows CertificateData.Part007.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 256; omega⟩
  by_cases before8 : index.val < 2304
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part008.rows CertificateData.Part008.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 256; omega⟩
  by_cases before9 : index.val < 2560
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part009.rows CertificateData.Part009.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 256; omega⟩
  by_cases before10 : index.val < 2816
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part010.rows CertificateData.Part010.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 256; omega⟩
  by_cases before11 : index.val < 3072
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part011.rows CertificateData.Part011.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 256; omega⟩
  by_cases before12 : index.val < 3328
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part012.rows CertificateData.Part012.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 256; omega⟩
  by_cases before13 : index.val < 3584
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part013.rows CertificateData.Part013.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 256; omega⟩
  by_cases before14 : index.val < 3840
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part014.rows CertificateData.Part014.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 256; omega⟩
  by_cases before15 : index.val < 4096
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part015.rows CertificateData.Part015.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 256; omega⟩
  by_cases before16 : index.val < 4352
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part016.rows CertificateData.Part016.rows_checked
      ⟨index.val-4096, by change index.val-4096 < 256; omega⟩
  by_cases before17 : index.val < 4608
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part017.rows CertificateData.Part017.rows_checked
      ⟨index.val-4352, by change index.val-4352 < 256; omega⟩
  by_cases before18 : index.val < 4864
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part018.rows CertificateData.Part018.rows_checked
      ⟨index.val-4608, by change index.val-4608 < 256; omega⟩
  by_cases before19 : index.val < 5120
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part019.rows CertificateData.Part019.rows_checked
      ⟨index.val-4864, by change index.val-4864 < 256; omega⟩
  by_cases before20 : index.val < 5376
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part020.rows CertificateData.Part020.rows_checked
      ⟨index.val-5120, by change index.val-5120 < 256; omega⟩
  by_cases before21 : index.val < 5632
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part021.rows CertificateData.Part021.rows_checked
      ⟨index.val-5376, by change index.val-5376 < 256; omega⟩
  by_cases before22 : index.val < 5888
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part022.rows CertificateData.Part022.rows_checked
      ⟨index.val-5632, by change index.val-5632 < 256; omega⟩
  by_cases before23 : index.val < 6144
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part023.rows CertificateData.Part023.rows_checked
      ⟨index.val-5888, by change index.val-5888 < 256; omega⟩
  by_cases before24 : index.val < 6400
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part024.rows CertificateData.Part024.rows_checked
      ⟨index.val-6144, by change index.val-6144 < 256; omega⟩
  by_cases before25 : index.val < 6656
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part025.rows CertificateData.Part025.rows_checked
      ⟨index.val-6400, by change index.val-6400 < 256; omega⟩
  by_cases before26 : index.val < 6912
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part026.rows CertificateData.Part026.rows_checked
      ⟨index.val-6656, by change index.val-6656 < 256; omega⟩
  by_cases before27 : index.val < 7168
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part027.rows CertificateData.Part027.rows_checked
      ⟨index.val-6912, by change index.val-6912 < 256; omega⟩
  by_cases before28 : index.val < 7424
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part028.rows CertificateData.Part028.rows_checked
      ⟨index.val-7168, by change index.val-7168 < 256; omega⟩
  by_cases before29 : index.val < 7680
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part029.rows CertificateData.Part029.rows_checked
      ⟨index.val-7424, by change index.val-7424 < 256; omega⟩
  by_cases before30 : index.val < 7936
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part030.rows CertificateData.Part030.rows_checked
      ⟨index.val-7680, by change index.val-7680 < 256; omega⟩
  exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part031.rows CertificateData.Part031.rows_checked
    ⟨index.val-7936, by change index.val-7936 < 256; omega⟩

/-- Accepted dyadic rows 8192 through 15278. -/
def dyadicGroup1 (index : Fin 7087) : {row : DyadicRow // row.check 17592186044416 = true} := by
  by_cases before32 : index.val < 256
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part032.rows CertificateData.Part032.rows_checked
      ⟨index.val-0, by change index.val-0 < 256; omega⟩
  by_cases before33 : index.val < 512
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part033.rows CertificateData.Part033.rows_checked
      ⟨index.val-256, by change index.val-256 < 256; omega⟩
  by_cases before34 : index.val < 768
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part034.rows CertificateData.Part034.rows_checked
      ⟨index.val-512, by change index.val-512 < 256; omega⟩
  by_cases before35 : index.val < 1024
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part035.rows CertificateData.Part035.rows_checked
      ⟨index.val-768, by change index.val-768 < 256; omega⟩
  by_cases before36 : index.val < 1280
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part036.rows CertificateData.Part036.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 256; omega⟩
  by_cases before37 : index.val < 1536
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part037.rows CertificateData.Part037.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 256; omega⟩
  by_cases before38 : index.val < 1792
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part038.rows CertificateData.Part038.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 256; omega⟩
  by_cases before39 : index.val < 2048
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part039.rows CertificateData.Part039.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 256; omega⟩
  by_cases before40 : index.val < 2304
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part040.rows CertificateData.Part040.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 256; omega⟩
  by_cases before41 : index.val < 2560
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part041.rows CertificateData.Part041.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 256; omega⟩
  by_cases before42 : index.val < 2816
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part042.rows CertificateData.Part042.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 256; omega⟩
  by_cases before43 : index.val < 3072
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part043.rows CertificateData.Part043.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 256; omega⟩
  by_cases before44 : index.val < 3328
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part044.rows CertificateData.Part044.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 256; omega⟩
  by_cases before45 : index.val < 3584
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part045.rows CertificateData.Part045.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 256; omega⟩
  by_cases before46 : index.val < 3840
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part046.rows CertificateData.Part046.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 256; omega⟩
  by_cases before47 : index.val < 4096
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part047.rows CertificateData.Part047.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 256; omega⟩
  by_cases before48 : index.val < 4352
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part048.rows CertificateData.Part048.rows_checked
      ⟨index.val-4096, by change index.val-4096 < 256; omega⟩
  by_cases before49 : index.val < 4608
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part049.rows CertificateData.Part049.rows_checked
      ⟨index.val-4352, by change index.val-4352 < 256; omega⟩
  by_cases before50 : index.val < 4864
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part050.rows CertificateData.Part050.rows_checked
      ⟨index.val-4608, by change index.val-4608 < 256; omega⟩
  by_cases before51 : index.val < 5120
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part051.rows CertificateData.Part051.rows_checked
      ⟨index.val-4864, by change index.val-4864 < 256; omega⟩
  by_cases before52 : index.val < 5376
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part052.rows CertificateData.Part052.rows_checked
      ⟨index.val-5120, by change index.val-5120 < 256; omega⟩
  by_cases before53 : index.val < 5632
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part053.rows CertificateData.Part053.rows_checked
      ⟨index.val-5376, by change index.val-5376 < 256; omega⟩
  by_cases before54 : index.val < 5888
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part054.rows CertificateData.Part054.rows_checked
      ⟨index.val-5632, by change index.val-5632 < 256; omega⟩
  by_cases before55 : index.val < 6144
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part055.rows CertificateData.Part055.rows_checked
      ⟨index.val-5888, by change index.val-5888 < 256; omega⟩
  by_cases before56 : index.val < 6400
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part056.rows CertificateData.Part056.rows_checked
      ⟨index.val-6144, by change index.val-6144 < 256; omega⟩
  by_cases before57 : index.val < 6656
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part057.rows CertificateData.Part057.rows_checked
      ⟨index.val-6400, by change index.val-6400 < 256; omega⟩
  by_cases before58 : index.val < 6912
  · exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part058.rows CertificateData.Part058.rows_checked
      ⟨index.val-6656, by change index.val-6656 < 256; omega⟩
  exact checkedListEntry (fun row : DyadicRow => row.check 17592186044416) CertificateData.Part059.rows CertificateData.Part059.rows_checked
    ⟨index.val-6912, by change index.val-6912 < 175; omega⟩

/-- Retrieve the exact accepted dyadic row at its original deduplicated index. -/
def dyadic (index : Fin 15279) : {row : DyadicRow // row.check 17592186044416 = true} := by
  by_cases before0 : index.val < 8192
  · exact dyadicGroup0 ⟨index.val-0, by omega⟩
  exact dyadicGroup1 ⟨index.val-8192, by omega⟩

/-- Accepted split rows 0 through 2047. -/
def splitGroup0 (index : Fin 2048) : {row : SplitRow // row.check 17592186044416 = true} := by
  by_cases before0 : index.val < 64
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part000.rows SplitCertificateData.Part000.rows_checked
      ⟨index.val-0, by change index.val-0 < 64; omega⟩
  by_cases before1 : index.val < 128
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part001.rows SplitCertificateData.Part001.rows_checked
      ⟨index.val-64, by change index.val-64 < 64; omega⟩
  by_cases before2 : index.val < 192
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part002.rows SplitCertificateData.Part002.rows_checked
      ⟨index.val-128, by change index.val-128 < 64; omega⟩
  by_cases before3 : index.val < 256
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part003.rows SplitCertificateData.Part003.rows_checked
      ⟨index.val-192, by change index.val-192 < 64; omega⟩
  by_cases before4 : index.val < 320
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part004.rows SplitCertificateData.Part004.rows_checked
      ⟨index.val-256, by change index.val-256 < 64; omega⟩
  by_cases before5 : index.val < 384
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part005.rows SplitCertificateData.Part005.rows_checked
      ⟨index.val-320, by change index.val-320 < 64; omega⟩
  by_cases before6 : index.val < 448
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part006.rows SplitCertificateData.Part006.rows_checked
      ⟨index.val-384, by change index.val-384 < 64; omega⟩
  by_cases before7 : index.val < 512
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part007.rows SplitCertificateData.Part007.rows_checked
      ⟨index.val-448, by change index.val-448 < 64; omega⟩
  by_cases before8 : index.val < 576
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part008.rows SplitCertificateData.Part008.rows_checked
      ⟨index.val-512, by change index.val-512 < 64; omega⟩
  by_cases before9 : index.val < 640
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part009.rows SplitCertificateData.Part009.rows_checked
      ⟨index.val-576, by change index.val-576 < 64; omega⟩
  by_cases before10 : index.val < 704
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part010.rows SplitCertificateData.Part010.rows_checked
      ⟨index.val-640, by change index.val-640 < 64; omega⟩
  by_cases before11 : index.val < 768
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part011.rows SplitCertificateData.Part011.rows_checked
      ⟨index.val-704, by change index.val-704 < 64; omega⟩
  by_cases before12 : index.val < 832
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part012.rows SplitCertificateData.Part012.rows_checked
      ⟨index.val-768, by change index.val-768 < 64; omega⟩
  by_cases before13 : index.val < 896
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part013.rows SplitCertificateData.Part013.rows_checked
      ⟨index.val-832, by change index.val-832 < 64; omega⟩
  by_cases before14 : index.val < 960
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part014.rows SplitCertificateData.Part014.rows_checked
      ⟨index.val-896, by change index.val-896 < 64; omega⟩
  by_cases before15 : index.val < 1024
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part015.rows SplitCertificateData.Part015.rows_checked
      ⟨index.val-960, by change index.val-960 < 64; omega⟩
  by_cases before16 : index.val < 1088
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part016.rows SplitCertificateData.Part016.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 64; omega⟩
  by_cases before17 : index.val < 1152
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part017.rows SplitCertificateData.Part017.rows_checked
      ⟨index.val-1088, by change index.val-1088 < 64; omega⟩
  by_cases before18 : index.val < 1216
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part018.rows SplitCertificateData.Part018.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 64; omega⟩
  by_cases before19 : index.val < 1280
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part019.rows SplitCertificateData.Part019.rows_checked
      ⟨index.val-1216, by change index.val-1216 < 64; omega⟩
  by_cases before20 : index.val < 1344
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part020.rows SplitCertificateData.Part020.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 64; omega⟩
  by_cases before21 : index.val < 1408
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part021.rows SplitCertificateData.Part021.rows_checked
      ⟨index.val-1344, by change index.val-1344 < 64; omega⟩
  by_cases before22 : index.val < 1472
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part022.rows SplitCertificateData.Part022.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 64; omega⟩
  by_cases before23 : index.val < 1536
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part023.rows SplitCertificateData.Part023.rows_checked
      ⟨index.val-1472, by change index.val-1472 < 64; omega⟩
  by_cases before24 : index.val < 1600
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part024.rows SplitCertificateData.Part024.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 64; omega⟩
  by_cases before25 : index.val < 1664
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part025.rows SplitCertificateData.Part025.rows_checked
      ⟨index.val-1600, by change index.val-1600 < 64; omega⟩
  by_cases before26 : index.val < 1728
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part026.rows SplitCertificateData.Part026.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 64; omega⟩
  by_cases before27 : index.val < 1792
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part027.rows SplitCertificateData.Part027.rows_checked
      ⟨index.val-1728, by change index.val-1728 < 64; omega⟩
  by_cases before28 : index.val < 1856
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part028.rows SplitCertificateData.Part028.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 64; omega⟩
  by_cases before29 : index.val < 1920
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part029.rows SplitCertificateData.Part029.rows_checked
      ⟨index.val-1856, by change index.val-1856 < 64; omega⟩
  by_cases before30 : index.val < 1984
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part030.rows SplitCertificateData.Part030.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 64; omega⟩
  exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part031.rows SplitCertificateData.Part031.rows_checked
    ⟨index.val-1984, by change index.val-1984 < 64; omega⟩

/-- Accepted split rows 2048 through 4095. -/
def splitGroup1 (index : Fin 2048) : {row : SplitRow // row.check 17592186044416 = true} := by
  by_cases before32 : index.val < 64
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part032.rows SplitCertificateData.Part032.rows_checked
      ⟨index.val-0, by change index.val-0 < 64; omega⟩
  by_cases before33 : index.val < 128
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part033.rows SplitCertificateData.Part033.rows_checked
      ⟨index.val-64, by change index.val-64 < 64; omega⟩
  by_cases before34 : index.val < 192
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part034.rows SplitCertificateData.Part034.rows_checked
      ⟨index.val-128, by change index.val-128 < 64; omega⟩
  by_cases before35 : index.val < 256
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part035.rows SplitCertificateData.Part035.rows_checked
      ⟨index.val-192, by change index.val-192 < 64; omega⟩
  by_cases before36 : index.val < 320
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part036.rows SplitCertificateData.Part036.rows_checked
      ⟨index.val-256, by change index.val-256 < 64; omega⟩
  by_cases before37 : index.val < 384
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part037.rows SplitCertificateData.Part037.rows_checked
      ⟨index.val-320, by change index.val-320 < 64; omega⟩
  by_cases before38 : index.val < 448
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part038.rows SplitCertificateData.Part038.rows_checked
      ⟨index.val-384, by change index.val-384 < 64; omega⟩
  by_cases before39 : index.val < 512
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part039.rows SplitCertificateData.Part039.rows_checked
      ⟨index.val-448, by change index.val-448 < 64; omega⟩
  by_cases before40 : index.val < 576
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part040.rows SplitCertificateData.Part040.rows_checked
      ⟨index.val-512, by change index.val-512 < 64; omega⟩
  by_cases before41 : index.val < 640
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part041.rows SplitCertificateData.Part041.rows_checked
      ⟨index.val-576, by change index.val-576 < 64; omega⟩
  by_cases before42 : index.val < 704
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part042.rows SplitCertificateData.Part042.rows_checked
      ⟨index.val-640, by change index.val-640 < 64; omega⟩
  by_cases before43 : index.val < 768
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part043.rows SplitCertificateData.Part043.rows_checked
      ⟨index.val-704, by change index.val-704 < 64; omega⟩
  by_cases before44 : index.val < 832
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part044.rows SplitCertificateData.Part044.rows_checked
      ⟨index.val-768, by change index.val-768 < 64; omega⟩
  by_cases before45 : index.val < 896
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part045.rows SplitCertificateData.Part045.rows_checked
      ⟨index.val-832, by change index.val-832 < 64; omega⟩
  by_cases before46 : index.val < 960
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part046.rows SplitCertificateData.Part046.rows_checked
      ⟨index.val-896, by change index.val-896 < 64; omega⟩
  by_cases before47 : index.val < 1024
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part047.rows SplitCertificateData.Part047.rows_checked
      ⟨index.val-960, by change index.val-960 < 64; omega⟩
  by_cases before48 : index.val < 1088
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part048.rows SplitCertificateData.Part048.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 64; omega⟩
  by_cases before49 : index.val < 1152
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part049.rows SplitCertificateData.Part049.rows_checked
      ⟨index.val-1088, by change index.val-1088 < 64; omega⟩
  by_cases before50 : index.val < 1216
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part050.rows SplitCertificateData.Part050.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 64; omega⟩
  by_cases before51 : index.val < 1280
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part051.rows SplitCertificateData.Part051.rows_checked
      ⟨index.val-1216, by change index.val-1216 < 64; omega⟩
  by_cases before52 : index.val < 1344
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part052.rows SplitCertificateData.Part052.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 64; omega⟩
  by_cases before53 : index.val < 1408
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part053.rows SplitCertificateData.Part053.rows_checked
      ⟨index.val-1344, by change index.val-1344 < 64; omega⟩
  by_cases before54 : index.val < 1472
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part054.rows SplitCertificateData.Part054.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 64; omega⟩
  by_cases before55 : index.val < 1536
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part055.rows SplitCertificateData.Part055.rows_checked
      ⟨index.val-1472, by change index.val-1472 < 64; omega⟩
  by_cases before56 : index.val < 1600
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part056.rows SplitCertificateData.Part056.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 64; omega⟩
  by_cases before57 : index.val < 1664
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part057.rows SplitCertificateData.Part057.rows_checked
      ⟨index.val-1600, by change index.val-1600 < 64; omega⟩
  by_cases before58 : index.val < 1728
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part058.rows SplitCertificateData.Part058.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 64; omega⟩
  by_cases before59 : index.val < 1792
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part059.rows SplitCertificateData.Part059.rows_checked
      ⟨index.val-1728, by change index.val-1728 < 64; omega⟩
  by_cases before60 : index.val < 1856
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part060.rows SplitCertificateData.Part060.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 64; omega⟩
  by_cases before61 : index.val < 1920
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part061.rows SplitCertificateData.Part061.rows_checked
      ⟨index.val-1856, by change index.val-1856 < 64; omega⟩
  by_cases before62 : index.val < 1984
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part062.rows SplitCertificateData.Part062.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 64; omega⟩
  exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part063.rows SplitCertificateData.Part063.rows_checked
    ⟨index.val-1984, by change index.val-1984 < 64; omega⟩

/-- Accepted split rows 4096 through 5541. -/
def splitGroup2 (index : Fin 1446) : {row : SplitRow // row.check 17592186044416 = true} := by
  by_cases before64 : index.val < 64
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part064.rows SplitCertificateData.Part064.rows_checked
      ⟨index.val-0, by change index.val-0 < 64; omega⟩
  by_cases before65 : index.val < 128
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part065.rows SplitCertificateData.Part065.rows_checked
      ⟨index.val-64, by change index.val-64 < 64; omega⟩
  by_cases before66 : index.val < 192
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part066.rows SplitCertificateData.Part066.rows_checked
      ⟨index.val-128, by change index.val-128 < 64; omega⟩
  by_cases before67 : index.val < 256
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part067.rows SplitCertificateData.Part067.rows_checked
      ⟨index.val-192, by change index.val-192 < 64; omega⟩
  by_cases before68 : index.val < 320
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part068.rows SplitCertificateData.Part068.rows_checked
      ⟨index.val-256, by change index.val-256 < 64; omega⟩
  by_cases before69 : index.val < 384
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part069.rows SplitCertificateData.Part069.rows_checked
      ⟨index.val-320, by change index.val-320 < 64; omega⟩
  by_cases before70 : index.val < 448
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part070.rows SplitCertificateData.Part070.rows_checked
      ⟨index.val-384, by change index.val-384 < 64; omega⟩
  by_cases before71 : index.val < 512
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part071.rows SplitCertificateData.Part071.rows_checked
      ⟨index.val-448, by change index.val-448 < 64; omega⟩
  by_cases before72 : index.val < 576
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part072.rows SplitCertificateData.Part072.rows_checked
      ⟨index.val-512, by change index.val-512 < 64; omega⟩
  by_cases before73 : index.val < 640
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part073.rows SplitCertificateData.Part073.rows_checked
      ⟨index.val-576, by change index.val-576 < 64; omega⟩
  by_cases before74 : index.val < 704
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part074.rows SplitCertificateData.Part074.rows_checked
      ⟨index.val-640, by change index.val-640 < 64; omega⟩
  by_cases before75 : index.val < 768
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part075.rows SplitCertificateData.Part075.rows_checked
      ⟨index.val-704, by change index.val-704 < 64; omega⟩
  by_cases before76 : index.val < 832
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part076.rows SplitCertificateData.Part076.rows_checked
      ⟨index.val-768, by change index.val-768 < 64; omega⟩
  by_cases before77 : index.val < 896
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part077.rows SplitCertificateData.Part077.rows_checked
      ⟨index.val-832, by change index.val-832 < 64; omega⟩
  by_cases before78 : index.val < 960
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part078.rows SplitCertificateData.Part078.rows_checked
      ⟨index.val-896, by change index.val-896 < 64; omega⟩
  by_cases before79 : index.val < 1024
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part079.rows SplitCertificateData.Part079.rows_checked
      ⟨index.val-960, by change index.val-960 < 64; omega⟩
  by_cases before80 : index.val < 1088
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part080.rows SplitCertificateData.Part080.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 64; omega⟩
  by_cases before81 : index.val < 1152
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part081.rows SplitCertificateData.Part081.rows_checked
      ⟨index.val-1088, by change index.val-1088 < 64; omega⟩
  by_cases before82 : index.val < 1216
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part082.rows SplitCertificateData.Part082.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 64; omega⟩
  by_cases before83 : index.val < 1280
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part083.rows SplitCertificateData.Part083.rows_checked
      ⟨index.val-1216, by change index.val-1216 < 64; omega⟩
  by_cases before84 : index.val < 1344
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part084.rows SplitCertificateData.Part084.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 64; omega⟩
  by_cases before85 : index.val < 1408
  · exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part085.rows SplitCertificateData.Part085.rows_checked
      ⟨index.val-1344, by change index.val-1344 < 64; omega⟩
  exact checkedListEntry (fun row : SplitRow => row.check 17592186044416) SplitCertificateData.Part086.rows SplitCertificateData.Part086.rows_checked
    ⟨index.val-1408, by change index.val-1408 < 38; omega⟩

/-- Retrieve the exact accepted split row at its original deduplicated index. -/
def split (index : Fin 5542) : {row : SplitRow // row.check 17592186044416 = true} := by
  by_cases before0 : index.val < 2048
  · exact splitGroup0 ⟨index.val-0, by omega⟩
  by_cases before1 : index.val < 4096
  · exact splitGroup1 ⟨index.val-2048, by omega⟩
  exact splitGroup2 ⟨index.val-4096, by omega⟩

/-- Accepted gibbs rows 0 through 4095. -/
def gibbsGroup0 (index : Fin 4096) : {row : GibbsRow // row.check = true} := by
  by_cases before0 : index.val < 128
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part000.rows GibbsCertificateData.Part000.rows_checked
      ⟨index.val-0, by change index.val-0 < 128; omega⟩
  by_cases before1 : index.val < 256
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part001.rows GibbsCertificateData.Part001.rows_checked
      ⟨index.val-128, by change index.val-128 < 128; omega⟩
  by_cases before2 : index.val < 384
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part002.rows GibbsCertificateData.Part002.rows_checked
      ⟨index.val-256, by change index.val-256 < 128; omega⟩
  by_cases before3 : index.val < 512
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part003.rows GibbsCertificateData.Part003.rows_checked
      ⟨index.val-384, by change index.val-384 < 128; omega⟩
  by_cases before4 : index.val < 640
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part004.rows GibbsCertificateData.Part004.rows_checked
      ⟨index.val-512, by change index.val-512 < 128; omega⟩
  by_cases before5 : index.val < 768
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part005.rows GibbsCertificateData.Part005.rows_checked
      ⟨index.val-640, by change index.val-640 < 128; omega⟩
  by_cases before6 : index.val < 896
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part006.rows GibbsCertificateData.Part006.rows_checked
      ⟨index.val-768, by change index.val-768 < 128; omega⟩
  by_cases before7 : index.val < 1024
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part007.rows GibbsCertificateData.Part007.rows_checked
      ⟨index.val-896, by change index.val-896 < 128; omega⟩
  by_cases before8 : index.val < 1152
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part008.rows GibbsCertificateData.Part008.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 128; omega⟩
  by_cases before9 : index.val < 1280
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part009.rows GibbsCertificateData.Part009.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 128; omega⟩
  by_cases before10 : index.val < 1408
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part010.rows GibbsCertificateData.Part010.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 128; omega⟩
  by_cases before11 : index.val < 1536
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part011.rows GibbsCertificateData.Part011.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 128; omega⟩
  by_cases before12 : index.val < 1664
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part012.rows GibbsCertificateData.Part012.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 128; omega⟩
  by_cases before13 : index.val < 1792
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part013.rows GibbsCertificateData.Part013.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 128; omega⟩
  by_cases before14 : index.val < 1920
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part014.rows GibbsCertificateData.Part014.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 128; omega⟩
  by_cases before15 : index.val < 2048
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part015.rows GibbsCertificateData.Part015.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 128; omega⟩
  by_cases before16 : index.val < 2176
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part016.rows GibbsCertificateData.Part016.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 128; omega⟩
  by_cases before17 : index.val < 2304
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part017.rows GibbsCertificateData.Part017.rows_checked
      ⟨index.val-2176, by change index.val-2176 < 128; omega⟩
  by_cases before18 : index.val < 2432
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part018.rows GibbsCertificateData.Part018.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 128; omega⟩
  by_cases before19 : index.val < 2560
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part019.rows GibbsCertificateData.Part019.rows_checked
      ⟨index.val-2432, by change index.val-2432 < 128; omega⟩
  by_cases before20 : index.val < 2688
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part020.rows GibbsCertificateData.Part020.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 128; omega⟩
  by_cases before21 : index.val < 2816
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part021.rows GibbsCertificateData.Part021.rows_checked
      ⟨index.val-2688, by change index.val-2688 < 128; omega⟩
  by_cases before22 : index.val < 2944
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part022.rows GibbsCertificateData.Part022.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 128; omega⟩
  by_cases before23 : index.val < 3072
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part023.rows GibbsCertificateData.Part023.rows_checked
      ⟨index.val-2944, by change index.val-2944 < 128; omega⟩
  by_cases before24 : index.val < 3200
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part024.rows GibbsCertificateData.Part024.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 128; omega⟩
  by_cases before25 : index.val < 3328
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part025.rows GibbsCertificateData.Part025.rows_checked
      ⟨index.val-3200, by change index.val-3200 < 128; omega⟩
  by_cases before26 : index.val < 3456
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part026.rows GibbsCertificateData.Part026.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 128; omega⟩
  by_cases before27 : index.val < 3584
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part027.rows GibbsCertificateData.Part027.rows_checked
      ⟨index.val-3456, by change index.val-3456 < 128; omega⟩
  by_cases before28 : index.val < 3712
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part028.rows GibbsCertificateData.Part028.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 128; omega⟩
  by_cases before29 : index.val < 3840
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part029.rows GibbsCertificateData.Part029.rows_checked
      ⟨index.val-3712, by change index.val-3712 < 128; omega⟩
  by_cases before30 : index.val < 3968
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part030.rows GibbsCertificateData.Part030.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 128; omega⟩
  exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part031.rows GibbsCertificateData.Part031.rows_checked
    ⟨index.val-3968, by change index.val-3968 < 128; omega⟩

/-- Accepted gibbs rows 4096 through 8191. -/
def gibbsGroup1 (index : Fin 4096) : {row : GibbsRow // row.check = true} := by
  by_cases before32 : index.val < 128
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part032.rows GibbsCertificateData.Part032.rows_checked
      ⟨index.val-0, by change index.val-0 < 128; omega⟩
  by_cases before33 : index.val < 256
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part033.rows GibbsCertificateData.Part033.rows_checked
      ⟨index.val-128, by change index.val-128 < 128; omega⟩
  by_cases before34 : index.val < 384
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part034.rows GibbsCertificateData.Part034.rows_checked
      ⟨index.val-256, by change index.val-256 < 128; omega⟩
  by_cases before35 : index.val < 512
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part035.rows GibbsCertificateData.Part035.rows_checked
      ⟨index.val-384, by change index.val-384 < 128; omega⟩
  by_cases before36 : index.val < 640
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part036.rows GibbsCertificateData.Part036.rows_checked
      ⟨index.val-512, by change index.val-512 < 128; omega⟩
  by_cases before37 : index.val < 768
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part037.rows GibbsCertificateData.Part037.rows_checked
      ⟨index.val-640, by change index.val-640 < 128; omega⟩
  by_cases before38 : index.val < 896
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part038.rows GibbsCertificateData.Part038.rows_checked
      ⟨index.val-768, by change index.val-768 < 128; omega⟩
  by_cases before39 : index.val < 1024
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part039.rows GibbsCertificateData.Part039.rows_checked
      ⟨index.val-896, by change index.val-896 < 128; omega⟩
  by_cases before40 : index.val < 1152
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part040.rows GibbsCertificateData.Part040.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 128; omega⟩
  by_cases before41 : index.val < 1280
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part041.rows GibbsCertificateData.Part041.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 128; omega⟩
  by_cases before42 : index.val < 1408
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part042.rows GibbsCertificateData.Part042.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 128; omega⟩
  by_cases before43 : index.val < 1536
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part043.rows GibbsCertificateData.Part043.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 128; omega⟩
  by_cases before44 : index.val < 1664
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part044.rows GibbsCertificateData.Part044.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 128; omega⟩
  by_cases before45 : index.val < 1792
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part045.rows GibbsCertificateData.Part045.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 128; omega⟩
  by_cases before46 : index.val < 1920
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part046.rows GibbsCertificateData.Part046.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 128; omega⟩
  by_cases before47 : index.val < 2048
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part047.rows GibbsCertificateData.Part047.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 128; omega⟩
  by_cases before48 : index.val < 2176
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part048.rows GibbsCertificateData.Part048.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 128; omega⟩
  by_cases before49 : index.val < 2304
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part049.rows GibbsCertificateData.Part049.rows_checked
      ⟨index.val-2176, by change index.val-2176 < 128; omega⟩
  by_cases before50 : index.val < 2432
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part050.rows GibbsCertificateData.Part050.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 128; omega⟩
  by_cases before51 : index.val < 2560
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part051.rows GibbsCertificateData.Part051.rows_checked
      ⟨index.val-2432, by change index.val-2432 < 128; omega⟩
  by_cases before52 : index.val < 2688
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part052.rows GibbsCertificateData.Part052.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 128; omega⟩
  by_cases before53 : index.val < 2816
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part053.rows GibbsCertificateData.Part053.rows_checked
      ⟨index.val-2688, by change index.val-2688 < 128; omega⟩
  by_cases before54 : index.val < 2944
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part054.rows GibbsCertificateData.Part054.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 128; omega⟩
  by_cases before55 : index.val < 3072
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part055.rows GibbsCertificateData.Part055.rows_checked
      ⟨index.val-2944, by change index.val-2944 < 128; omega⟩
  by_cases before56 : index.val < 3200
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part056.rows GibbsCertificateData.Part056.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 128; omega⟩
  by_cases before57 : index.val < 3328
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part057.rows GibbsCertificateData.Part057.rows_checked
      ⟨index.val-3200, by change index.val-3200 < 128; omega⟩
  by_cases before58 : index.val < 3456
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part058.rows GibbsCertificateData.Part058.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 128; omega⟩
  by_cases before59 : index.val < 3584
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part059.rows GibbsCertificateData.Part059.rows_checked
      ⟨index.val-3456, by change index.val-3456 < 128; omega⟩
  by_cases before60 : index.val < 3712
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part060.rows GibbsCertificateData.Part060.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 128; omega⟩
  by_cases before61 : index.val < 3840
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part061.rows GibbsCertificateData.Part061.rows_checked
      ⟨index.val-3712, by change index.val-3712 < 128; omega⟩
  by_cases before62 : index.val < 3968
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part062.rows GibbsCertificateData.Part062.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 128; omega⟩
  exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part063.rows GibbsCertificateData.Part063.rows_checked
    ⟨index.val-3968, by change index.val-3968 < 128; omega⟩

/-- Accepted gibbs rows 8192 through 12287. -/
def gibbsGroup2 (index : Fin 4096) : {row : GibbsRow // row.check = true} := by
  by_cases before64 : index.val < 128
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part064.rows GibbsCertificateData.Part064.rows_checked
      ⟨index.val-0, by change index.val-0 < 128; omega⟩
  by_cases before65 : index.val < 256
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part065.rows GibbsCertificateData.Part065.rows_checked
      ⟨index.val-128, by change index.val-128 < 128; omega⟩
  by_cases before66 : index.val < 384
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part066.rows GibbsCertificateData.Part066.rows_checked
      ⟨index.val-256, by change index.val-256 < 128; omega⟩
  by_cases before67 : index.val < 512
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part067.rows GibbsCertificateData.Part067.rows_checked
      ⟨index.val-384, by change index.val-384 < 128; omega⟩
  by_cases before68 : index.val < 640
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part068.rows GibbsCertificateData.Part068.rows_checked
      ⟨index.val-512, by change index.val-512 < 128; omega⟩
  by_cases before69 : index.val < 768
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part069.rows GibbsCertificateData.Part069.rows_checked
      ⟨index.val-640, by change index.val-640 < 128; omega⟩
  by_cases before70 : index.val < 896
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part070.rows GibbsCertificateData.Part070.rows_checked
      ⟨index.val-768, by change index.val-768 < 128; omega⟩
  by_cases before71 : index.val < 1024
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part071.rows GibbsCertificateData.Part071.rows_checked
      ⟨index.val-896, by change index.val-896 < 128; omega⟩
  by_cases before72 : index.val < 1152
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part072.rows GibbsCertificateData.Part072.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 128; omega⟩
  by_cases before73 : index.val < 1280
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part073.rows GibbsCertificateData.Part073.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 128; omega⟩
  by_cases before74 : index.val < 1408
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part074.rows GibbsCertificateData.Part074.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 128; omega⟩
  by_cases before75 : index.val < 1536
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part075.rows GibbsCertificateData.Part075.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 128; omega⟩
  by_cases before76 : index.val < 1664
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part076.rows GibbsCertificateData.Part076.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 128; omega⟩
  by_cases before77 : index.val < 1792
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part077.rows GibbsCertificateData.Part077.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 128; omega⟩
  by_cases before78 : index.val < 1920
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part078.rows GibbsCertificateData.Part078.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 128; omega⟩
  by_cases before79 : index.val < 2048
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part079.rows GibbsCertificateData.Part079.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 128; omega⟩
  by_cases before80 : index.val < 2176
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part080.rows GibbsCertificateData.Part080.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 128; omega⟩
  by_cases before81 : index.val < 2304
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part081.rows GibbsCertificateData.Part081.rows_checked
      ⟨index.val-2176, by change index.val-2176 < 128; omega⟩
  by_cases before82 : index.val < 2432
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part082.rows GibbsCertificateData.Part082.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 128; omega⟩
  by_cases before83 : index.val < 2560
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part083.rows GibbsCertificateData.Part083.rows_checked
      ⟨index.val-2432, by change index.val-2432 < 128; omega⟩
  by_cases before84 : index.val < 2688
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part084.rows GibbsCertificateData.Part084.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 128; omega⟩
  by_cases before85 : index.val < 2816
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part085.rows GibbsCertificateData.Part085.rows_checked
      ⟨index.val-2688, by change index.val-2688 < 128; omega⟩
  by_cases before86 : index.val < 2944
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part086.rows GibbsCertificateData.Part086.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 128; omega⟩
  by_cases before87 : index.val < 3072
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part087.rows GibbsCertificateData.Part087.rows_checked
      ⟨index.val-2944, by change index.val-2944 < 128; omega⟩
  by_cases before88 : index.val < 3200
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part088.rows GibbsCertificateData.Part088.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 128; omega⟩
  by_cases before89 : index.val < 3328
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part089.rows GibbsCertificateData.Part089.rows_checked
      ⟨index.val-3200, by change index.val-3200 < 128; omega⟩
  by_cases before90 : index.val < 3456
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part090.rows GibbsCertificateData.Part090.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 128; omega⟩
  by_cases before91 : index.val < 3584
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part091.rows GibbsCertificateData.Part091.rows_checked
      ⟨index.val-3456, by change index.val-3456 < 128; omega⟩
  by_cases before92 : index.val < 3712
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part092.rows GibbsCertificateData.Part092.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 128; omega⟩
  by_cases before93 : index.val < 3840
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part093.rows GibbsCertificateData.Part093.rows_checked
      ⟨index.val-3712, by change index.val-3712 < 128; omega⟩
  by_cases before94 : index.val < 3968
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part094.rows GibbsCertificateData.Part094.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 128; omega⟩
  exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part095.rows GibbsCertificateData.Part095.rows_checked
    ⟨index.val-3968, by change index.val-3968 < 128; omega⟩

/-- Accepted gibbs rows 12288 through 16383. -/
def gibbsGroup3 (index : Fin 4096) : {row : GibbsRow // row.check = true} := by
  by_cases before96 : index.val < 128
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part096.rows GibbsCertificateData.Part096.rows_checked
      ⟨index.val-0, by change index.val-0 < 128; omega⟩
  by_cases before97 : index.val < 256
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part097.rows GibbsCertificateData.Part097.rows_checked
      ⟨index.val-128, by change index.val-128 < 128; omega⟩
  by_cases before98 : index.val < 384
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part098.rows GibbsCertificateData.Part098.rows_checked
      ⟨index.val-256, by change index.val-256 < 128; omega⟩
  by_cases before99 : index.val < 512
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part099.rows GibbsCertificateData.Part099.rows_checked
      ⟨index.val-384, by change index.val-384 < 128; omega⟩
  by_cases before100 : index.val < 640
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part100.rows GibbsCertificateData.Part100.rows_checked
      ⟨index.val-512, by change index.val-512 < 128; omega⟩
  by_cases before101 : index.val < 768
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part101.rows GibbsCertificateData.Part101.rows_checked
      ⟨index.val-640, by change index.val-640 < 128; omega⟩
  by_cases before102 : index.val < 896
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part102.rows GibbsCertificateData.Part102.rows_checked
      ⟨index.val-768, by change index.val-768 < 128; omega⟩
  by_cases before103 : index.val < 1024
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part103.rows GibbsCertificateData.Part103.rows_checked
      ⟨index.val-896, by change index.val-896 < 128; omega⟩
  by_cases before104 : index.val < 1152
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part104.rows GibbsCertificateData.Part104.rows_checked
      ⟨index.val-1024, by change index.val-1024 < 128; omega⟩
  by_cases before105 : index.val < 1280
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part105.rows GibbsCertificateData.Part105.rows_checked
      ⟨index.val-1152, by change index.val-1152 < 128; omega⟩
  by_cases before106 : index.val < 1408
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part106.rows GibbsCertificateData.Part106.rows_checked
      ⟨index.val-1280, by change index.val-1280 < 128; omega⟩
  by_cases before107 : index.val < 1536
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part107.rows GibbsCertificateData.Part107.rows_checked
      ⟨index.val-1408, by change index.val-1408 < 128; omega⟩
  by_cases before108 : index.val < 1664
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part108.rows GibbsCertificateData.Part108.rows_checked
      ⟨index.val-1536, by change index.val-1536 < 128; omega⟩
  by_cases before109 : index.val < 1792
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part109.rows GibbsCertificateData.Part109.rows_checked
      ⟨index.val-1664, by change index.val-1664 < 128; omega⟩
  by_cases before110 : index.val < 1920
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part110.rows GibbsCertificateData.Part110.rows_checked
      ⟨index.val-1792, by change index.val-1792 < 128; omega⟩
  by_cases before111 : index.val < 2048
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part111.rows GibbsCertificateData.Part111.rows_checked
      ⟨index.val-1920, by change index.val-1920 < 128; omega⟩
  by_cases before112 : index.val < 2176
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part112.rows GibbsCertificateData.Part112.rows_checked
      ⟨index.val-2048, by change index.val-2048 < 128; omega⟩
  by_cases before113 : index.val < 2304
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part113.rows GibbsCertificateData.Part113.rows_checked
      ⟨index.val-2176, by change index.val-2176 < 128; omega⟩
  by_cases before114 : index.val < 2432
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part114.rows GibbsCertificateData.Part114.rows_checked
      ⟨index.val-2304, by change index.val-2304 < 128; omega⟩
  by_cases before115 : index.val < 2560
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part115.rows GibbsCertificateData.Part115.rows_checked
      ⟨index.val-2432, by change index.val-2432 < 128; omega⟩
  by_cases before116 : index.val < 2688
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part116.rows GibbsCertificateData.Part116.rows_checked
      ⟨index.val-2560, by change index.val-2560 < 128; omega⟩
  by_cases before117 : index.val < 2816
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part117.rows GibbsCertificateData.Part117.rows_checked
      ⟨index.val-2688, by change index.val-2688 < 128; omega⟩
  by_cases before118 : index.val < 2944
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part118.rows GibbsCertificateData.Part118.rows_checked
      ⟨index.val-2816, by change index.val-2816 < 128; omega⟩
  by_cases before119 : index.val < 3072
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part119.rows GibbsCertificateData.Part119.rows_checked
      ⟨index.val-2944, by change index.val-2944 < 128; omega⟩
  by_cases before120 : index.val < 3200
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part120.rows GibbsCertificateData.Part120.rows_checked
      ⟨index.val-3072, by change index.val-3072 < 128; omega⟩
  by_cases before121 : index.val < 3328
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part121.rows GibbsCertificateData.Part121.rows_checked
      ⟨index.val-3200, by change index.val-3200 < 128; omega⟩
  by_cases before122 : index.val < 3456
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part122.rows GibbsCertificateData.Part122.rows_checked
      ⟨index.val-3328, by change index.val-3328 < 128; omega⟩
  by_cases before123 : index.val < 3584
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part123.rows GibbsCertificateData.Part123.rows_checked
      ⟨index.val-3456, by change index.val-3456 < 128; omega⟩
  by_cases before124 : index.val < 3712
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part124.rows GibbsCertificateData.Part124.rows_checked
      ⟨index.val-3584, by change index.val-3584 < 128; omega⟩
  by_cases before125 : index.val < 3840
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part125.rows GibbsCertificateData.Part125.rows_checked
      ⟨index.val-3712, by change index.val-3712 < 128; omega⟩
  by_cases before126 : index.val < 3968
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part126.rows GibbsCertificateData.Part126.rows_checked
      ⟨index.val-3840, by change index.val-3840 < 128; omega⟩
  exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part127.rows GibbsCertificateData.Part127.rows_checked
    ⟨index.val-3968, by change index.val-3968 < 128; omega⟩

/-- Accepted gibbs rows 16384 through 16628. -/
def gibbsGroup4 (index : Fin 245) : {row : GibbsRow // row.check = true} := by
  by_cases before128 : index.val < 128
  · exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part128.rows GibbsCertificateData.Part128.rows_checked
      ⟨index.val-0, by change index.val-0 < 128; omega⟩
  exact checkedListEntry (fun row : GibbsRow => row.check) GibbsCertificateData.Part129.rows GibbsCertificateData.Part129.rows_checked
    ⟨index.val-128, by change index.val-128 < 117; omega⟩

/-- Retrieve the exact accepted gibbs row at its original deduplicated index. -/
def gibbs (index : Fin 16629) : {row : GibbsRow // row.check = true} := by
  by_cases before0 : index.val < 4096
  · exact gibbsGroup0 ⟨index.val-0, by omega⟩
  by_cases before1 : index.val < 8192
  · exact gibbsGroup1 ⟨index.val-4096, by omega⟩
  by_cases before2 : index.val < 12288
  · exact gibbsGroup2 ⟨index.val-8192, by omega⟩
  by_cases before3 : index.val < 16384
  · exact gibbsGroup3 ⟨index.val-12288, by omega⟩
  exact gibbsGroup4 ⟨index.val-16384, by omega⟩

end MatrixBounds.Numeric.IndexedCertificateRows
