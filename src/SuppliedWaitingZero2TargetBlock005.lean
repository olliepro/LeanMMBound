import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 10240 through 12287. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock005
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 10240 through 10367. -/
theorem block00 : IndexBlockCertificate valid 10240 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10368 through 10495. -/
theorem block01 : IndexBlockCertificate valid 10368 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10496 through 10623. -/
theorem block02 : IndexBlockCertificate valid 10496 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10624 through 10751. -/
theorem block03 : IndexBlockCertificate valid 10624 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10752 through 10879. -/
theorem block04 : IndexBlockCertificate valid 10752 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10880 through 11007. -/
theorem block05 : IndexBlockCertificate valid 10880 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11008 through 11135. -/
theorem block06 : IndexBlockCertificate valid 11008 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11136 through 11263. -/
theorem block07 : IndexBlockCertificate valid 11136 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11264 through 11391. -/
theorem block08 : IndexBlockCertificate valid 11264 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11392 through 11519. -/
theorem block09 : IndexBlockCertificate valid 11392 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11520 through 11647. -/
theorem block10 : IndexBlockCertificate valid 11520 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11648 through 11775. -/
theorem block11 : IndexBlockCertificate valid 11648 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11776 through 11903. -/
theorem block12 : IndexBlockCertificate valid 11776 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 11904 through 12031. -/
theorem block13 : IndexBlockCertificate valid 11904 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12032 through 12159. -/
theorem block14 : IndexBlockCertificate valid 12032 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12160 through 12287. -/
theorem block15 : IndexBlockCertificate valid 12160 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 10240 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock005
