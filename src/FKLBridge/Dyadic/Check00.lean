module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 0 (rows 0…255). -/
theorem check000 : Rows.partOk tree Rows.dyOk CertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007, chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015, chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023, chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 0 256 = true := by decide +kernel
theorem sound000 : CertificateData.Part000.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part000.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (0 + j) 3)) (Nat.land (0 + j) 7) CertificateData.Part000.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part000.rows [chunk0000, chunk0001, chunk0002, chunk0003, chunk0004, chunk0005, chunk0006, chunk0007, chunk0008, chunk0009, chunk0010, chunk0011, chunk0012, chunk0013, chunk0014, chunk0015, chunk0016, chunk0017, chunk0018, chunk0019, chunk0020, chunk0021, chunk0022, chunk0023, chunk0024, chunk0025, chunk0026, chunk0027, chunk0028, chunk0029, chunk0030, chunk0031] 0 256 0 rfl check000
theorem len000 : CertificateData.Part000.rows.length = 256 := sound000.1

/-- Kernel check of part 1 (rows 256…511). -/
theorem check001 : Rows.partOk tree Rows.dyOk CertificateData.Part001.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039, chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047, chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055, chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 32 256 = true := by decide +kernel
theorem sound001 : CertificateData.Part001.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part001.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (256 + j) 3)) (Nat.land (256 + j) 7) CertificateData.Part001.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part001.rows [chunk0032, chunk0033, chunk0034, chunk0035, chunk0036, chunk0037, chunk0038, chunk0039, chunk0040, chunk0041, chunk0042, chunk0043, chunk0044, chunk0045, chunk0046, chunk0047, chunk0048, chunk0049, chunk0050, chunk0051, chunk0052, chunk0053, chunk0054, chunk0055, chunk0056, chunk0057, chunk0058, chunk0059, chunk0060, chunk0061, chunk0062, chunk0063] 32 256 256 rfl check001
theorem len001 : CertificateData.Part001.rows.length = 256 := sound001.1

/-- Kernel check of part 2 (rows 512…767). -/
theorem check002 : Rows.partOk tree Rows.dyOk CertificateData.Part002.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071, chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079, chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087, chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 64 256 = true := by decide +kernel
theorem sound002 : CertificateData.Part002.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part002.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (512 + j) 3)) (Nat.land (512 + j) 7) CertificateData.Part002.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part002.rows [chunk0064, chunk0065, chunk0066, chunk0067, chunk0068, chunk0069, chunk0070, chunk0071, chunk0072, chunk0073, chunk0074, chunk0075, chunk0076, chunk0077, chunk0078, chunk0079, chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087, chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 64 256 512 rfl check002
theorem len002 : CertificateData.Part002.rows.length = 256 := sound002.1

/-- Kernel check of part 3 (rows 768…1023). -/
theorem check003 : Rows.partOk tree Rows.dyOk CertificateData.Part003.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103, chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111, chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119, chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 96 256 = true := by decide +kernel
theorem sound003 : CertificateData.Part003.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part003.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (768 + j) 3)) (Nat.land (768 + j) 7) CertificateData.Part003.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part003.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103, chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111, chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119, chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 96 256 768 rfl check003
theorem len003 : CertificateData.Part003.rows.length = 256 := sound003.1

/-- Kernel check of part 4 (rows 1024…1279). -/
theorem check004 : Rows.partOk tree Rows.dyOk CertificateData.Part004.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135, chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143, chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151, chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 128 256 = true := by decide +kernel
theorem sound004 : CertificateData.Part004.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part004.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (1024 + j) 3)) (Nat.land (1024 + j) 7) CertificateData.Part004.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part004.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135, chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143, chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151, chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 128 256 1024 rfl check004
theorem len004 : CertificateData.Part004.rows.length = 256 := sound004.1

/-- Kernel check of part 5 (rows 1280…1535). -/
theorem check005 : Rows.partOk tree Rows.dyOk CertificateData.Part005.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167, chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175, chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183, chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 160 256 = true := by decide +kernel
theorem sound005 : CertificateData.Part005.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part005.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (1280 + j) 3)) (Nat.land (1280 + j) 7) CertificateData.Part005.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part005.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167, chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175, chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183, chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 160 256 1280 rfl check005
theorem len005 : CertificateData.Part005.rows.length = 256 := sound005.1

/-- Kernel check of part 6 (rows 1536…1791). -/
theorem check006 : Rows.partOk tree Rows.dyOk CertificateData.Part006.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199, chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207, chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215, chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 192 256 = true := by decide +kernel
theorem sound006 : CertificateData.Part006.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part006.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (1536 + j) 3)) (Nat.land (1536 + j) 7) CertificateData.Part006.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part006.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199, chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207, chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215, chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 192 256 1536 rfl check006
theorem len006 : CertificateData.Part006.rows.length = 256 := sound006.1

/-- Kernel check of part 7 (rows 1792…2047). -/
theorem check007 : Rows.partOk tree Rows.dyOk CertificateData.Part007.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231, chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239, chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247, chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 224 256 = true := by decide +kernel
theorem sound007 : CertificateData.Part007.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part007.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (1792 + j) 3)) (Nat.land (1792 + j) 7) CertificateData.Part007.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part007.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231, chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239, chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247, chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 224 256 1792 rfl check007
theorem len007 : CertificateData.Part007.rows.length = 256 := sound007.1

/-- Kernel check of part 8 (rows 2048…2303). -/
theorem check008 : Rows.partOk tree Rows.dyOk CertificateData.Part008.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263, chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271, chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279, chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 256 256 = true := by decide +kernel
theorem sound008 : CertificateData.Part008.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part008.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (2048 + j) 3)) (Nat.land (2048 + j) 7) CertificateData.Part008.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part008.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263, chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271, chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279, chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 256 256 2048 rfl check008
theorem len008 : CertificateData.Part008.rows.length = 256 := sound008.1

/-- Kernel check of part 9 (rows 2304…2559). -/
theorem check009 : Rows.partOk tree Rows.dyOk CertificateData.Part009.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295, chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303, chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311, chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 288 256 = true := by decide +kernel
theorem sound009 : CertificateData.Part009.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part009.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (2304 + j) 3)) (Nat.land (2304 + j) 7) CertificateData.Part009.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part009.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295, chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303, chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311, chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 288 256 2304 rfl check009
theorem len009 : CertificateData.Part009.rows.length = 256 := sound009.1


end FKLBridge.Dyadic
