import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 26624 through 28671. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock013
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 26624 through 26751. -/
theorem block00 : IndexBlockCertificate valid 26624 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26752 through 26879. -/
theorem block01 : IndexBlockCertificate valid 26752 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26880 through 27007. -/
theorem block02 : IndexBlockCertificate valid 26880 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27008 through 27135. -/
theorem block03 : IndexBlockCertificate valid 27008 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27136 through 27263. -/
theorem block04 : IndexBlockCertificate valid 27136 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27264 through 27391. -/
theorem block05 : IndexBlockCertificate valid 27264 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27392 through 27519. -/
theorem block06 : IndexBlockCertificate valid 27392 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27520 through 27647. -/
theorem block07 : IndexBlockCertificate valid 27520 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27648 through 27775. -/
theorem block08 : IndexBlockCertificate valid 27648 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27776 through 27903. -/
theorem block09 : IndexBlockCertificate valid 27776 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 27904 through 28031. -/
theorem block10 : IndexBlockCertificate valid 27904 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28032 through 28159. -/
theorem block11 : IndexBlockCertificate valid 28032 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28160 through 28287. -/
theorem block12 : IndexBlockCertificate valid 28160 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28288 through 28415. -/
theorem block13 : IndexBlockCertificate valid 28288 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28416 through 28543. -/
theorem block14 : IndexBlockCertificate valid 28416 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28544 through 28671. -/
theorem block15 : IndexBlockCertificate valid 28544 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 26624 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock013
