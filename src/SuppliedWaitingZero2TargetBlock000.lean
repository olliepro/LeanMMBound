import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 0 through 2047. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock000
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 0 through 127. -/
theorem block00 : IndexBlockCertificate valid 0 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 128 through 255. -/
theorem block01 : IndexBlockCertificate valid 128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 256 through 383. -/
theorem block02 : IndexBlockCertificate valid 256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 384 through 511. -/
theorem block03 : IndexBlockCertificate valid 384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 512 through 639. -/
theorem block04 : IndexBlockCertificate valid 512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 640 through 767. -/
theorem block05 : IndexBlockCertificate valid 640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 768 through 895. -/
theorem block06 : IndexBlockCertificate valid 768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 896 through 1023. -/
theorem block07 : IndexBlockCertificate valid 896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1024 through 1151. -/
theorem block08 : IndexBlockCertificate valid 1024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1152 through 1279. -/
theorem block09 : IndexBlockCertificate valid 1152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1280 through 1407. -/
theorem block10 : IndexBlockCertificate valid 1280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1408 through 1535. -/
theorem block11 : IndexBlockCertificate valid 1408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1536 through 1663. -/
theorem block12 : IndexBlockCertificate valid 1536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1664 through 1791. -/
theorem block13 : IndexBlockCertificate valid 1664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1792 through 1919. -/
theorem block14 : IndexBlockCertificate valid 1792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 1920 through 2047. -/
theorem block15 : IndexBlockCertificate valid 1920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 0 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock000
