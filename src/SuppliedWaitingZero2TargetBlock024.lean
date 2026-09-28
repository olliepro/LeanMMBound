import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 49152 through 51199. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock024
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 49152 through 49279. -/
theorem block00 : IndexBlockCertificate valid 49152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49280 through 49407. -/
theorem block01 : IndexBlockCertificate valid 49280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49408 through 49535. -/
theorem block02 : IndexBlockCertificate valid 49408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49536 through 49663. -/
theorem block03 : IndexBlockCertificate valid 49536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49664 through 49791. -/
theorem block04 : IndexBlockCertificate valid 49664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49792 through 49919. -/
theorem block05 : IndexBlockCertificate valid 49792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49920 through 50047. -/
theorem block06 : IndexBlockCertificate valid 49920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50048 through 50175. -/
theorem block07 : IndexBlockCertificate valid 50048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50176 through 50303. -/
theorem block08 : IndexBlockCertificate valid 50176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50304 through 50431. -/
theorem block09 : IndexBlockCertificate valid 50304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50432 through 50559. -/
theorem block10 : IndexBlockCertificate valid 50432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50560 through 50687. -/
theorem block11 : IndexBlockCertificate valid 50560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50688 through 50815. -/
theorem block12 : IndexBlockCertificate valid 50688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50816 through 50943. -/
theorem block13 : IndexBlockCertificate valid 50816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 50944 through 51071. -/
theorem block14 : IndexBlockCertificate valid 50944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51072 through 51199. -/
theorem block15 : IndexBlockCertificate valid 51072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 49152 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock024
