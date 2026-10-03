module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 0 (rows 0…127). -/
theorem check000 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007, chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015] 0 128 = true := by decide +kernel
theorem sound000 : GibbsCertificateData.Part000.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part000.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (0 + j) 3)) (Nat.land (0 + j) 7) GibbsCertificateData.Part000.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007, chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015] 0 128 0 rfl check000
theorem len000 : GibbsCertificateData.Part000.rows.length = 128 := sound000.1

/-- Kernel check of part 1 (rows 128…255). -/
theorem check001 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part001.rows [chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023, chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 16 128 = true := by decide +kernel
theorem sound001 : GibbsCertificateData.Part001.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part001.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (128 + j) 3)) (Nat.land (128 + j) 7) GibbsCertificateData.Part001.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part001.rows [chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023, chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 16 128 128 rfl check001
theorem len001 : GibbsCertificateData.Part001.rows.length = 128 := sound001.1

/-- Kernel check of part 2 (rows 256…383). -/
theorem check002 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part002.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039, chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047] 32 128 = true := by decide +kernel
theorem sound002 : GibbsCertificateData.Part002.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part002.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (256 + j) 3)) (Nat.land (256 + j) 7) GibbsCertificateData.Part002.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part002.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039, chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047] 32 128 256 rfl check002
theorem len002 : GibbsCertificateData.Part002.rows.length = 128 := sound002.1

/-- Kernel check of part 3 (rows 384…511). -/
theorem check003 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part003.rows [chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055, chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 48 128 = true := by decide +kernel
theorem sound003 : GibbsCertificateData.Part003.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part003.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (384 + j) 3)) (Nat.land (384 + j) 7) GibbsCertificateData.Part003.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part003.rows [chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055, chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 48 128 384 rfl check003
theorem len003 : GibbsCertificateData.Part003.rows.length = 128 := sound003.1

/-- Kernel check of part 4 (rows 512…639). -/
theorem check004 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part004.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071, chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079] 64 128 = true := by decide +kernel
theorem sound004 : GibbsCertificateData.Part004.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part004.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (512 + j) 3)) (Nat.land (512 + j) 7) GibbsCertificateData.Part004.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part004.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071, chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079] 64 128 512 rfl check004
theorem len004 : GibbsCertificateData.Part004.rows.length = 128 := sound004.1

/-- Kernel check of part 5 (rows 640…767). -/
theorem check005 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part005.rows [chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087, chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 80 128 = true := by decide +kernel
theorem sound005 : GibbsCertificateData.Part005.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part005.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (640 + j) 3)) (Nat.land (640 + j) 7) GibbsCertificateData.Part005.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part005.rows [chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087, chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 80 128 640 rfl check005
theorem len005 : GibbsCertificateData.Part005.rows.length = 128 := sound005.1

/-- Kernel check of part 6 (rows 768…895). -/
theorem check006 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part006.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103, chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111] 96 128 = true := by decide +kernel
theorem sound006 : GibbsCertificateData.Part006.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part006.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (768 + j) 3)) (Nat.land (768 + j) 7) GibbsCertificateData.Part006.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part006.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103, chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111] 96 128 768 rfl check006
theorem len006 : GibbsCertificateData.Part006.rows.length = 128 := sound006.1

/-- Kernel check of part 7 (rows 896…1023). -/
theorem check007 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part007.rows [chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119, chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 112 128 = true := by decide +kernel
theorem sound007 : GibbsCertificateData.Part007.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part007.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (896 + j) 3)) (Nat.land (896 + j) 7) GibbsCertificateData.Part007.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part007.rows [chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119, chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 112 128 896 rfl check007
theorem len007 : GibbsCertificateData.Part007.rows.length = 128 := sound007.1

/-- Kernel check of part 8 (rows 1024…1151). -/
theorem check008 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part008.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135, chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143] 128 128 = true := by decide +kernel
theorem sound008 : GibbsCertificateData.Part008.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part008.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1024 + j) 3)) (Nat.land (1024 + j) 7) GibbsCertificateData.Part008.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part008.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135, chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143] 128 128 1024 rfl check008
theorem len008 : GibbsCertificateData.Part008.rows.length = 128 := sound008.1

/-- Kernel check of part 9 (rows 1152…1279). -/
theorem check009 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part009.rows [chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151, chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 144 128 = true := by decide +kernel
theorem sound009 : GibbsCertificateData.Part009.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part009.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1152 + j) 3)) (Nat.land (1152 + j) 7) GibbsCertificateData.Part009.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part009.rows [chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151, chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 144 128 1152 rfl check009
theorem len009 : GibbsCertificateData.Part009.rows.length = 128 := sound009.1


end FKLBridge.Gibbs
