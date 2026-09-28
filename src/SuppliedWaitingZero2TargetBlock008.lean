import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 16384 through 18431. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock008
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 16384 through 16511. -/
theorem block00 : IndexBlockCertificate valid 16384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16512 through 16639. -/
theorem block01 : IndexBlockCertificate valid 16512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16640 through 16767. -/
theorem block02 : IndexBlockCertificate valid 16640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16768 through 16895. -/
theorem block03 : IndexBlockCertificate valid 16768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16896 through 17023. -/
theorem block04 : IndexBlockCertificate valid 16896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17024 through 17151. -/
theorem block05 : IndexBlockCertificate valid 17024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17152 through 17279. -/
theorem block06 : IndexBlockCertificate valid 17152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17280 through 17407. -/
theorem block07 : IndexBlockCertificate valid 17280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17408 through 17535. -/
theorem block08 : IndexBlockCertificate valid 17408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17536 through 17663. -/
theorem block09 : IndexBlockCertificate valid 17536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17664 through 17791. -/
theorem block10 : IndexBlockCertificate valid 17664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17792 through 17919. -/
theorem block11 : IndexBlockCertificate valid 17792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 17920 through 18047. -/
theorem block12 : IndexBlockCertificate valid 17920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18048 through 18175. -/
theorem block13 : IndexBlockCertificate valid 18048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18176 through 18303. -/
theorem block14 : IndexBlockCertificate valid 18176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18304 through 18431. -/
theorem block15 : IndexBlockCertificate valid 18304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 16384 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock008
