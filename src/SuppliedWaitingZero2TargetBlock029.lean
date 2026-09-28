import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 59392 through 61439. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock029
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 59392 through 59519. -/
theorem block00 : IndexBlockCertificate valid 59392 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59520 through 59647. -/
theorem block01 : IndexBlockCertificate valid 59520 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59648 through 59775. -/
theorem block02 : IndexBlockCertificate valid 59648 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59776 through 59903. -/
theorem block03 : IndexBlockCertificate valid 59776 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59904 through 60031. -/
theorem block04 : IndexBlockCertificate valid 59904 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60032 through 60159. -/
theorem block05 : IndexBlockCertificate valid 60032 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60160 through 60287. -/
theorem block06 : IndexBlockCertificate valid 60160 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60288 through 60415. -/
theorem block07 : IndexBlockCertificate valid 60288 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60416 through 60543. -/
theorem block08 : IndexBlockCertificate valid 60416 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60544 through 60671. -/
theorem block09 : IndexBlockCertificate valid 60544 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60672 through 60799. -/
theorem block10 : IndexBlockCertificate valid 60672 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60800 through 60927. -/
theorem block11 : IndexBlockCertificate valid 60800 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 60928 through 61055. -/
theorem block12 : IndexBlockCertificate valid 60928 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61056 through 61183. -/
theorem block13 : IndexBlockCertificate valid 61056 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61184 through 61311. -/
theorem block14 : IndexBlockCertificate valid 61184 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61312 through 61439. -/
theorem block15 : IndexBlockCertificate valid 61312 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 59392 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock029
