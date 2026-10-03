module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 0 (rows 0…63). -/
theorem check000 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007] 0 64 = true := by decide +kernel
theorem sound000 : SplitCertificateData.Part000.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part000.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (0 + j) 3)) (Nat.land (0 + j) 7) SplitCertificateData.Part000.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007] 0 64 0 rfl check000
theorem len000 : SplitCertificateData.Part000.rows.length = 64 := sound000.1

/-- Kernel check of part 1 (rows 64…127). -/
theorem check001 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part001.rows [chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015] 8 64 = true := by decide +kernel
theorem sound001 : SplitCertificateData.Part001.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part001.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (64 + j) 3)) (Nat.land (64 + j) 7) SplitCertificateData.Part001.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part001.rows [chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015] 8 64 64 rfl check001
theorem len001 : SplitCertificateData.Part001.rows.length = 64 := sound001.1

/-- Kernel check of part 2 (rows 128…191). -/
theorem check002 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part002.rows [chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023] 16 64 = true := by decide +kernel
theorem sound002 : SplitCertificateData.Part002.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part002.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (128 + j) 3)) (Nat.land (128 + j) 7) SplitCertificateData.Part002.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part002.rows [chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023] 16 64 128 rfl check002
theorem len002 : SplitCertificateData.Part002.rows.length = 64 := sound002.1

/-- Kernel check of part 3 (rows 192…255). -/
theorem check003 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part003.rows [chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 24 64 = true := by decide +kernel
theorem sound003 : SplitCertificateData.Part003.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part003.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (192 + j) 3)) (Nat.land (192 + j) 7) SplitCertificateData.Part003.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part003.rows [chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 24 64 192 rfl check003
theorem len003 : SplitCertificateData.Part003.rows.length = 64 := sound003.1

/-- Kernel check of part 4 (rows 256…319). -/
theorem check004 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part004.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039] 32 64 = true := by decide +kernel
theorem sound004 : SplitCertificateData.Part004.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part004.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (256 + j) 3)) (Nat.land (256 + j) 7) SplitCertificateData.Part004.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part004.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039] 32 64 256 rfl check004
theorem len004 : SplitCertificateData.Part004.rows.length = 64 := sound004.1

/-- Kernel check of part 5 (rows 320…383). -/
theorem check005 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part005.rows [chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047] 40 64 = true := by decide +kernel
theorem sound005 : SplitCertificateData.Part005.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part005.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (320 + j) 3)) (Nat.land (320 + j) 7) SplitCertificateData.Part005.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part005.rows [chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047] 40 64 320 rfl check005
theorem len005 : SplitCertificateData.Part005.rows.length = 64 := sound005.1

/-- Kernel check of part 6 (rows 384…447). -/
theorem check006 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part006.rows [chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055] 48 64 = true := by decide +kernel
theorem sound006 : SplitCertificateData.Part006.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part006.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (384 + j) 3)) (Nat.land (384 + j) 7) SplitCertificateData.Part006.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part006.rows [chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055] 48 64 384 rfl check006
theorem len006 : SplitCertificateData.Part006.rows.length = 64 := sound006.1

/-- Kernel check of part 7 (rows 448…511). -/
theorem check007 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part007.rows [chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 56 64 = true := by decide +kernel
theorem sound007 : SplitCertificateData.Part007.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part007.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (448 + j) 3)) (Nat.land (448 + j) 7) SplitCertificateData.Part007.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part007.rows [chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 56 64 448 rfl check007
theorem len007 : SplitCertificateData.Part007.rows.length = 64 := sound007.1

/-- Kernel check of part 8 (rows 512…575). -/
theorem check008 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part008.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071] 64 64 = true := by decide +kernel
theorem sound008 : SplitCertificateData.Part008.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part008.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (512 + j) 3)) (Nat.land (512 + j) 7) SplitCertificateData.Part008.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part008.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071] 64 64 512 rfl check008
theorem len008 : SplitCertificateData.Part008.rows.length = 64 := sound008.1

/-- Kernel check of part 9 (rows 576…639). -/
theorem check009 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part009.rows [chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079] 72 64 = true := by decide +kernel
theorem sound009 : SplitCertificateData.Part009.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part009.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (576 + j) 3)) (Nat.land (576 + j) 7) SplitCertificateData.Part009.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part009.rows [chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079] 72 64 576 rfl check009
theorem len009 : SplitCertificateData.Part009.rows.length = 64 := sound009.1


end FKLBridge.Split
