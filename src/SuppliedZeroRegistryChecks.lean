import SuppliedZeroRegistryData
import IndexedCertificateRows
import DyadicOrbitSupport
import VerifiedOrbitSupportTables
import FiniteIndexBlockComposition

namespace MatrixBounds.Numeric.SuppliedZeroRegistry
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- The registry records either an unused row or a valid supported zero law of its exact supplied width. -/
def check (index : Fin 15279) : Bool :=
  let code := (table.get index).val
  let row := (IndexedCertificateRows.dyadic index).val
  if code = 0 then true
  else if row.width = 6 then row.supportCheck OrbitLevel2.totalAt (code-1)
  else if row.width = 21 then row.supportCheck OrbitLevel3.totalAt (code-1)
  else if row.width = 231 then row.supportCheck OrbitLevel4.totalAt (code-1)
  else false

/-- Exact support of a deduplicated original source row. -/
def valid (index : Fin 15279) : Prop := check index = true

/-- Independent original-source checks at positions 0 through 127. -/
theorem validBlock000 : IndexBlockCertificate valid 0 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 128 through 255. -/
theorem validBlock001 : IndexBlockCertificate valid 128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 256 through 383. -/
theorem validBlock002 : IndexBlockCertificate valid 256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 384 through 511. -/
theorem validBlock003 : IndexBlockCertificate valid 384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 512 through 639. -/
theorem validBlock004 : IndexBlockCertificate valid 512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 640 through 767. -/
theorem validBlock005 : IndexBlockCertificate valid 640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 768 through 895. -/
theorem validBlock006 : IndexBlockCertificate valid 768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 896 through 1023. -/
theorem validBlock007 : IndexBlockCertificate valid 896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1024 through 1151. -/
theorem validBlock008 : IndexBlockCertificate valid 1024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1152 through 1279. -/
theorem validBlock009 : IndexBlockCertificate valid 1152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1280 through 1407. -/
theorem validBlock010 : IndexBlockCertificate valid 1280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1408 through 1535. -/
theorem validBlock011 : IndexBlockCertificate valid 1408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1536 through 1663. -/
theorem validBlock012 : IndexBlockCertificate valid 1536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1664 through 1791. -/
theorem validBlock013 : IndexBlockCertificate valid 1664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1792 through 1919. -/
theorem validBlock014 : IndexBlockCertificate valid 1792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 1920 through 2047. -/
theorem validBlock015 : IndexBlockCertificate valid 1920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2048 through 2175. -/
theorem validBlock016 : IndexBlockCertificate valid 2048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2176 through 2303. -/
theorem validBlock017 : IndexBlockCertificate valid 2176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2304 through 2431. -/
theorem validBlock018 : IndexBlockCertificate valid 2304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2432 through 2559. -/
theorem validBlock019 : IndexBlockCertificate valid 2432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2560 through 2687. -/
theorem validBlock020 : IndexBlockCertificate valid 2560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2688 through 2815. -/
theorem validBlock021 : IndexBlockCertificate valid 2688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2816 through 2943. -/
theorem validBlock022 : IndexBlockCertificate valid 2816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 2944 through 3071. -/
theorem validBlock023 : IndexBlockCertificate valid 2944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3072 through 3199. -/
theorem validBlock024 : IndexBlockCertificate valid 3072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3200 through 3327. -/
theorem validBlock025 : IndexBlockCertificate valid 3200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3328 through 3455. -/
theorem validBlock026 : IndexBlockCertificate valid 3328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3456 through 3583. -/
theorem validBlock027 : IndexBlockCertificate valid 3456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3584 through 3711. -/
theorem validBlock028 : IndexBlockCertificate valid 3584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3712 through 3839. -/
theorem validBlock029 : IndexBlockCertificate valid 3712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3840 through 3967. -/
theorem validBlock030 : IndexBlockCertificate valid 3840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 3968 through 4095. -/
theorem validBlock031 : IndexBlockCertificate valid 3968 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4096 through 4223. -/
theorem validBlock032 : IndexBlockCertificate valid 4096 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4224 through 4351. -/
theorem validBlock033 : IndexBlockCertificate valid 4224 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4352 through 4479. -/
theorem validBlock034 : IndexBlockCertificate valid 4352 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4480 through 4607. -/
theorem validBlock035 : IndexBlockCertificate valid 4480 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4608 through 4735. -/
theorem validBlock036 : IndexBlockCertificate valid 4608 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4736 through 4863. -/
theorem validBlock037 : IndexBlockCertificate valid 4736 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4864 through 4991. -/
theorem validBlock038 : IndexBlockCertificate valid 4864 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 4992 through 5119. -/
theorem validBlock039 : IndexBlockCertificate valid 4992 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5120 through 5247. -/
theorem validBlock040 : IndexBlockCertificate valid 5120 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5248 through 5375. -/
theorem validBlock041 : IndexBlockCertificate valid 5248 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5376 through 5503. -/
theorem validBlock042 : IndexBlockCertificate valid 5376 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5504 through 5631. -/
theorem validBlock043 : IndexBlockCertificate valid 5504 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5632 through 5759. -/
theorem validBlock044 : IndexBlockCertificate valid 5632 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5760 through 5887. -/
theorem validBlock045 : IndexBlockCertificate valid 5760 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 5888 through 6015. -/
theorem validBlock046 : IndexBlockCertificate valid 5888 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6016 through 6143. -/
theorem validBlock047 : IndexBlockCertificate valid 6016 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6144 through 6271. -/
theorem validBlock048 : IndexBlockCertificate valid 6144 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6272 through 6399. -/
theorem validBlock049 : IndexBlockCertificate valid 6272 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6400 through 6527. -/
theorem validBlock050 : IndexBlockCertificate valid 6400 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6528 through 6655. -/
theorem validBlock051 : IndexBlockCertificate valid 6528 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6656 through 6783. -/
theorem validBlock052 : IndexBlockCertificate valid 6656 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6784 through 6911. -/
theorem validBlock053 : IndexBlockCertificate valid 6784 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 6912 through 7039. -/
theorem validBlock054 : IndexBlockCertificate valid 6912 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7040 through 7167. -/
theorem validBlock055 : IndexBlockCertificate valid 7040 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7168 through 7295. -/
theorem validBlock056 : IndexBlockCertificate valid 7168 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7296 through 7423. -/
theorem validBlock057 : IndexBlockCertificate valid 7296 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7424 through 7551. -/
theorem validBlock058 : IndexBlockCertificate valid 7424 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7552 through 7679. -/
theorem validBlock059 : IndexBlockCertificate valid 7552 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7680 through 7807. -/
theorem validBlock060 : IndexBlockCertificate valid 7680 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7808 through 7935. -/
theorem validBlock061 : IndexBlockCertificate valid 7808 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 7936 through 8063. -/
theorem validBlock062 : IndexBlockCertificate valid 7936 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8064 through 8191. -/
theorem validBlock063 : IndexBlockCertificate valid 8064 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8192 through 8319. -/
theorem validBlock064 : IndexBlockCertificate valid 8192 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8320 through 8447. -/
theorem validBlock065 : IndexBlockCertificate valid 8320 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8448 through 8575. -/
theorem validBlock066 : IndexBlockCertificate valid 8448 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8576 through 8703. -/
theorem validBlock067 : IndexBlockCertificate valid 8576 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8704 through 8831. -/
theorem validBlock068 : IndexBlockCertificate valid 8704 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8832 through 8959. -/
theorem validBlock069 : IndexBlockCertificate valid 8832 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 8960 through 9087. -/
theorem validBlock070 : IndexBlockCertificate valid 8960 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9088 through 9215. -/
theorem validBlock071 : IndexBlockCertificate valid 9088 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9216 through 9343. -/
theorem validBlock072 : IndexBlockCertificate valid 9216 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9344 through 9471. -/
theorem validBlock073 : IndexBlockCertificate valid 9344 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9472 through 9599. -/
theorem validBlock074 : IndexBlockCertificate valid 9472 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9600 through 9727. -/
theorem validBlock075 : IndexBlockCertificate valid 9600 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9728 through 9855. -/
theorem validBlock076 : IndexBlockCertificate valid 9728 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9856 through 9983. -/
theorem validBlock077 : IndexBlockCertificate valid 9856 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 9984 through 10111. -/
theorem validBlock078 : IndexBlockCertificate valid 9984 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10112 through 10239. -/
theorem validBlock079 : IndexBlockCertificate valid 10112 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10240 through 10367. -/
theorem validBlock080 : IndexBlockCertificate valid 10240 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10368 through 10495. -/
theorem validBlock081 : IndexBlockCertificate valid 10368 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10496 through 10623. -/
theorem validBlock082 : IndexBlockCertificate valid 10496 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10624 through 10751. -/
theorem validBlock083 : IndexBlockCertificate valid 10624 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10752 through 10879. -/
theorem validBlock084 : IndexBlockCertificate valid 10752 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 10880 through 11007. -/
theorem validBlock085 : IndexBlockCertificate valid 10880 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11008 through 11135. -/
theorem validBlock086 : IndexBlockCertificate valid 11008 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11136 through 11263. -/
theorem validBlock087 : IndexBlockCertificate valid 11136 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11264 through 11391. -/
theorem validBlock088 : IndexBlockCertificate valid 11264 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11392 through 11519. -/
theorem validBlock089 : IndexBlockCertificate valid 11392 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11520 through 11647. -/
theorem validBlock090 : IndexBlockCertificate valid 11520 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11648 through 11775. -/
theorem validBlock091 : IndexBlockCertificate valid 11648 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11776 through 11903. -/
theorem validBlock092 : IndexBlockCertificate valid 11776 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 11904 through 12031. -/
theorem validBlock093 : IndexBlockCertificate valid 11904 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12032 through 12159. -/
theorem validBlock094 : IndexBlockCertificate valid 12032 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12160 through 12287. -/
theorem validBlock095 : IndexBlockCertificate valid 12160 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12288 through 12415. -/
theorem validBlock096 : IndexBlockCertificate valid 12288 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12416 through 12543. -/
theorem validBlock097 : IndexBlockCertificate valid 12416 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12544 through 12671. -/
theorem validBlock098 : IndexBlockCertificate valid 12544 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12672 through 12799. -/
theorem validBlock099 : IndexBlockCertificate valid 12672 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12800 through 12927. -/
theorem validBlock100 : IndexBlockCertificate valid 12800 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 12928 through 13055. -/
theorem validBlock101 : IndexBlockCertificate valid 12928 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13056 through 13183. -/
theorem validBlock102 : IndexBlockCertificate valid 13056 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13184 through 13311. -/
theorem validBlock103 : IndexBlockCertificate valid 13184 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13312 through 13439. -/
theorem validBlock104 : IndexBlockCertificate valid 13312 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13440 through 13567. -/
theorem validBlock105 : IndexBlockCertificate valid 13440 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13568 through 13695. -/
theorem validBlock106 : IndexBlockCertificate valid 13568 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13696 through 13823. -/
theorem validBlock107 : IndexBlockCertificate valid 13696 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13824 through 13951. -/
theorem validBlock108 : IndexBlockCertificate valid 13824 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 13952 through 14079. -/
theorem validBlock109 : IndexBlockCertificate valid 13952 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14080 through 14207. -/
theorem validBlock110 : IndexBlockCertificate valid 14080 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14208 through 14335. -/
theorem validBlock111 : IndexBlockCertificate valid 14208 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14336 through 14463. -/
theorem validBlock112 : IndexBlockCertificate valid 14336 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14464 through 14591. -/
theorem validBlock113 : IndexBlockCertificate valid 14464 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14592 through 14719. -/
theorem validBlock114 : IndexBlockCertificate valid 14592 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14720 through 14847. -/
theorem validBlock115 : IndexBlockCertificate valid 14720 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14848 through 14975. -/
theorem validBlock116 : IndexBlockCertificate valid 14848 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 14976 through 15103. -/
theorem validBlock117 : IndexBlockCertificate valid 14976 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 15104 through 15231. -/
theorem validBlock118 : IndexBlockCertificate valid 15104 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Independent original-source checks at positions 15232 through 15278. -/
theorem validBlock119 : IndexBlockCertificate valid 15232 47 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Complete kernel-checked correspondence across all 15279 source positions. -/
theorem validComplete : IndexBlockCertificate valid 0 15279 :=
  (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((validBlock000).append validBlock001).append validBlock002).append validBlock003).append validBlock004).append validBlock005).append validBlock006).append validBlock007).append validBlock008).append validBlock009).append validBlock010).append validBlock011).append validBlock012).append validBlock013).append validBlock014).append validBlock015).append validBlock016).append validBlock017).append validBlock018).append validBlock019).append validBlock020).append validBlock021).append validBlock022).append validBlock023).append validBlock024).append validBlock025).append validBlock026).append validBlock027).append validBlock028).append validBlock029).append validBlock030).append validBlock031).append validBlock032).append validBlock033).append validBlock034).append validBlock035).append validBlock036).append validBlock037).append validBlock038).append validBlock039).append validBlock040).append validBlock041).append validBlock042).append validBlock043).append validBlock044).append validBlock045).append validBlock046).append validBlock047).append validBlock048).append validBlock049).append validBlock050).append validBlock051).append validBlock052).append validBlock053).append validBlock054).append validBlock055).append validBlock056).append validBlock057).append validBlock058).append validBlock059).append validBlock060).append validBlock061).append validBlock062).append validBlock063).append validBlock064).append validBlock065).append validBlock066).append validBlock067).append validBlock068).append validBlock069).append validBlock070).append validBlock071).append validBlock072).append validBlock073).append validBlock074).append validBlock075).append validBlock076).append validBlock077).append validBlock078).append validBlock079).append validBlock080).append validBlock081).append validBlock082).append validBlock083).append validBlock084).append validBlock085).append validBlock086).append validBlock087).append validBlock088).append validBlock089).append validBlock090).append validBlock091).append validBlock092).append validBlock093).append validBlock094).append validBlock095).append validBlock096).append validBlock097).append validBlock098).append validBlock099).append validBlock100).append validBlock101).append validBlock102).append validBlock103).append validBlock104).append validBlock105).append validBlock106).append validBlock107).append validBlock108).append validBlock109).append validBlock110).append validBlock111).append validBlock112).append validBlock113).append validBlock114).append validBlock115).append validBlock116).append validBlock117).append validBlock118).append validBlock119

end MatrixBounds.Numeric.SuppliedZeroRegistry
