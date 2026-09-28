import IndexedCertificateRows
import FiniteIndexBlockComposition

/-! Exact metadata of the original accepted rows. Each bounded check reduces
only the row's actual metadata, reusing its separately checked probability data. -/
namespace MatrixBounds.Numeric.DyadicRowMetadata
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Exact alphabet size determined by the original deduplicated row regions. -/
def expected (index : ℕ) : ℕ :=
  if index = 0 then 1 else if index = 1 then 153 else
  if index < 940 then 6 else if index < 6377 then 15 else if index < 6482 then 45 else
  if index < 14692 then 6 else if index < 15235 then 21 else if index < 15277 then 231 else
  if index < 15279 then 3 else 6

/-- Metadata assertion at an original accepted row. -/
def predicate (index : Fin 15279) : Prop :=
  (IndexedCertificateRows.dyadic index).val.width = expected index.val


/-- Independent kernel check of row metadata at indices 0 through 255. -/
theorem block000 : IndexBlockCertificate predicate 0 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 256 through 511. -/
theorem block001 : IndexBlockCertificate predicate 256 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 512 through 767. -/
theorem block002 : IndexBlockCertificate predicate 512 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 768 through 1023. -/
theorem block003 : IndexBlockCertificate predicate 768 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 1024 through 1279. -/
theorem block004 : IndexBlockCertificate predicate 1024 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 1280 through 1535. -/
theorem block005 : IndexBlockCertificate predicate 1280 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 1536 through 1791. -/
theorem block006 : IndexBlockCertificate predicate 1536 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 1792 through 2047. -/
theorem block007 : IndexBlockCertificate predicate 1792 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 2048 through 2303. -/
theorem block008 : IndexBlockCertificate predicate 2048 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 2304 through 2559. -/
theorem block009 : IndexBlockCertificate predicate 2304 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 2560 through 2815. -/
theorem block010 : IndexBlockCertificate predicate 2560 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 2816 through 3071. -/
theorem block011 : IndexBlockCertificate predicate 2816 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 3072 through 3327. -/
theorem block012 : IndexBlockCertificate predicate 3072 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 3328 through 3583. -/
theorem block013 : IndexBlockCertificate predicate 3328 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 3584 through 3839. -/
theorem block014 : IndexBlockCertificate predicate 3584 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 3840 through 4095. -/
theorem block015 : IndexBlockCertificate predicate 3840 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 4096 through 4351. -/
theorem block016 : IndexBlockCertificate predicate 4096 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 4352 through 4607. -/
theorem block017 : IndexBlockCertificate predicate 4352 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 4608 through 4863. -/
theorem block018 : IndexBlockCertificate predicate 4608 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 4864 through 5119. -/
theorem block019 : IndexBlockCertificate predicate 4864 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 5120 through 5375. -/
theorem block020 : IndexBlockCertificate predicate 5120 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 5376 through 5631. -/
theorem block021 : IndexBlockCertificate predicate 5376 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 5632 through 5887. -/
theorem block022 : IndexBlockCertificate predicate 5632 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 5888 through 6143. -/
theorem block023 : IndexBlockCertificate predicate 5888 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 6144 through 6399. -/
theorem block024 : IndexBlockCertificate predicate 6144 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 6400 through 6655. -/
theorem block025 : IndexBlockCertificate predicate 6400 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 6656 through 6911. -/
theorem block026 : IndexBlockCertificate predicate 6656 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 6912 through 7167. -/
theorem block027 : IndexBlockCertificate predicate 6912 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 7168 through 7423. -/
theorem block028 : IndexBlockCertificate predicate 7168 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 7424 through 7679. -/
theorem block029 : IndexBlockCertificate predicate 7424 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 7680 through 7935. -/
theorem block030 : IndexBlockCertificate predicate 7680 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 7936 through 8191. -/
theorem block031 : IndexBlockCertificate predicate 7936 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 8192 through 8447. -/
theorem block032 : IndexBlockCertificate predicate 8192 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 8448 through 8703. -/
theorem block033 : IndexBlockCertificate predicate 8448 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 8704 through 8959. -/
theorem block034 : IndexBlockCertificate predicate 8704 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 8960 through 9215. -/
theorem block035 : IndexBlockCertificate predicate 8960 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 9216 through 9471. -/
theorem block036 : IndexBlockCertificate predicate 9216 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 9472 through 9727. -/
theorem block037 : IndexBlockCertificate predicate 9472 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 9728 through 9983. -/
theorem block038 : IndexBlockCertificate predicate 9728 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 9984 through 10239. -/
theorem block039 : IndexBlockCertificate predicate 9984 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 10240 through 10495. -/
theorem block040 : IndexBlockCertificate predicate 10240 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 10496 through 10751. -/
theorem block041 : IndexBlockCertificate predicate 10496 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 10752 through 11007. -/
theorem block042 : IndexBlockCertificate predicate 10752 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 11008 through 11263. -/
theorem block043 : IndexBlockCertificate predicate 11008 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 11264 through 11519. -/
theorem block044 : IndexBlockCertificate predicate 11264 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 11520 through 11775. -/
theorem block045 : IndexBlockCertificate predicate 11520 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 11776 through 12031. -/
theorem block046 : IndexBlockCertificate predicate 11776 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 12032 through 12287. -/
theorem block047 : IndexBlockCertificate predicate 12032 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 12288 through 12543. -/
theorem block048 : IndexBlockCertificate predicate 12288 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 12544 through 12799. -/
theorem block049 : IndexBlockCertificate predicate 12544 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 12800 through 13055. -/
theorem block050 : IndexBlockCertificate predicate 12800 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 13056 through 13311. -/
theorem block051 : IndexBlockCertificate predicate 13056 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 13312 through 13567. -/
theorem block052 : IndexBlockCertificate predicate 13312 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 13568 through 13823. -/
theorem block053 : IndexBlockCertificate predicate 13568 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 13824 through 14079. -/
theorem block054 : IndexBlockCertificate predicate 13824 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 14080 through 14335. -/
theorem block055 : IndexBlockCertificate predicate 14080 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 14336 through 14591. -/
theorem block056 : IndexBlockCertificate predicate 14336 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 14592 through 14847. -/
theorem block057 : IndexBlockCertificate predicate 14592 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 14848 through 15103. -/
theorem block058 : IndexBlockCertificate predicate 14848 256 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- Independent kernel check of row metadata at indices 15104 through 15278. -/
theorem block059 : IndexBlockCertificate predicate 15104 175 :=
  ⟨by decide +kernel, by unfold predicate; decide +kernel⟩

/-- The bounded checks cover every accepted row, including the final partial block. -/
theorem complete : IndexBlockCertificate predicate 0 15279 :=
  (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((block000).append block001).append block002).append block003).append block004).append block005).append block006).append block007).append block008).append block009).append block010).append block011).append block012).append block013).append block014).append block015).append block016).append block017).append block018).append block019).append block020).append block021).append block022).append block023).append block024).append block025).append block026).append block027).append block028).append block029).append block030).append block031).append block032).append block033).append block034).append block035).append block036).append block037).append block038).append block039).append block040).append block041).append block042).append block043).append block044).append block045).append block046).append block047).append block048).append block049).append block050).append block051).append block052).append block053).append block054).append block055).append block056).append block057).append block058).append block059

/-- Every actual source row has its exact declared alphabet size. -/
theorem metadata (index : Fin 15279) : predicate index := complete.complete index

end MatrixBounds.Numeric.DyadicRowMetadata
