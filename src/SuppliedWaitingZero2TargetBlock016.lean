import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 32768 through 34815. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock016
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 32768 through 32895. -/
theorem block00 : IndexBlockCertificate valid 32768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32896 through 33023. -/
theorem block01 : IndexBlockCertificate valid 32896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33024 through 33151. -/
theorem block02 : IndexBlockCertificate valid 33024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33152 through 33279. -/
theorem block03 : IndexBlockCertificate valid 33152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33280 through 33407. -/
theorem block04 : IndexBlockCertificate valid 33280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33408 through 33535. -/
theorem block05 : IndexBlockCertificate valid 33408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33536 through 33663. -/
theorem block06 : IndexBlockCertificate valid 33536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33664 through 33791. -/
theorem block07 : IndexBlockCertificate valid 33664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33792 through 33919. -/
theorem block08 : IndexBlockCertificate valid 33792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 33920 through 34047. -/
theorem block09 : IndexBlockCertificate valid 33920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34048 through 34175. -/
theorem block10 : IndexBlockCertificate valid 34048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34176 through 34303. -/
theorem block11 : IndexBlockCertificate valid 34176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34304 through 34431. -/
theorem block12 : IndexBlockCertificate valid 34304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34432 through 34559. -/
theorem block13 : IndexBlockCertificate valid 34432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34560 through 34687. -/
theorem block14 : IndexBlockCertificate valid 34560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34688 through 34815. -/
theorem block15 : IndexBlockCertificate valid 34688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 32768 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock016
