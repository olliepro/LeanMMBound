module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 10 (rows 1280…1407). -/
theorem check010 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part010.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167, chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175] 160 128 = true := by decide +kernel
theorem sound010 : GibbsCertificateData.Part010.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part010.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1280 + j) 3)) (Nat.land (1280 + j) 7) GibbsCertificateData.Part010.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part010.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167, chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175] 160 128 1280 rfl check010
theorem len010 : GibbsCertificateData.Part010.rows.length = 128 := sound010.1

/-- Kernel check of part 11 (rows 1408…1535). -/
theorem check011 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part011.rows [chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183, chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 176 128 = true := by decide +kernel
theorem sound011 : GibbsCertificateData.Part011.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part011.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1408 + j) 3)) (Nat.land (1408 + j) 7) GibbsCertificateData.Part011.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part011.rows [chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183, chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 176 128 1408 rfl check011
theorem len011 : GibbsCertificateData.Part011.rows.length = 128 := sound011.1

/-- Kernel check of part 12 (rows 1536…1663). -/
theorem check012 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part012.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199, chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207] 192 128 = true := by decide +kernel
theorem sound012 : GibbsCertificateData.Part012.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part012.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1536 + j) 3)) (Nat.land (1536 + j) 7) GibbsCertificateData.Part012.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part012.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199, chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207] 192 128 1536 rfl check012
theorem len012 : GibbsCertificateData.Part012.rows.length = 128 := sound012.1

/-- Kernel check of part 13 (rows 1664…1791). -/
theorem check013 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part013.rows [chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215, chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 208 128 = true := by decide +kernel
theorem sound013 : GibbsCertificateData.Part013.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part013.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1664 + j) 3)) (Nat.land (1664 + j) 7) GibbsCertificateData.Part013.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part013.rows [chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215, chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 208 128 1664 rfl check013
theorem len013 : GibbsCertificateData.Part013.rows.length = 128 := sound013.1

/-- Kernel check of part 14 (rows 1792…1919). -/
theorem check014 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part014.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231, chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239] 224 128 = true := by decide +kernel
theorem sound014 : GibbsCertificateData.Part014.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part014.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1792 + j) 3)) (Nat.land (1792 + j) 7) GibbsCertificateData.Part014.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part014.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231, chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239] 224 128 1792 rfl check014
theorem len014 : GibbsCertificateData.Part014.rows.length = 128 := sound014.1

/-- Kernel check of part 15 (rows 1920…2047). -/
theorem check015 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part015.rows [chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247, chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 240 128 = true := by decide +kernel
theorem sound015 : GibbsCertificateData.Part015.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part015.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (1920 + j) 3)) (Nat.land (1920 + j) 7) GibbsCertificateData.Part015.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part015.rows [chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247, chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 240 128 1920 rfl check015
theorem len015 : GibbsCertificateData.Part015.rows.length = 128 := sound015.1

/-- Kernel check of part 16 (rows 2048…2175). -/
theorem check016 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part016.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263, chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271] 256 128 = true := by decide +kernel
theorem sound016 : GibbsCertificateData.Part016.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part016.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2048 + j) 3)) (Nat.land (2048 + j) 7) GibbsCertificateData.Part016.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part016.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263, chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271] 256 128 2048 rfl check016
theorem len016 : GibbsCertificateData.Part016.rows.length = 128 := sound016.1

/-- Kernel check of part 17 (rows 2176…2303). -/
theorem check017 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part017.rows [chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279, chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 272 128 = true := by decide +kernel
theorem sound017 : GibbsCertificateData.Part017.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part017.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2176 + j) 3)) (Nat.land (2176 + j) 7) GibbsCertificateData.Part017.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part017.rows [chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279, chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 272 128 2176 rfl check017
theorem len017 : GibbsCertificateData.Part017.rows.length = 128 := sound017.1

/-- Kernel check of part 18 (rows 2304…2431). -/
theorem check018 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part018.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295, chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303] 288 128 = true := by decide +kernel
theorem sound018 : GibbsCertificateData.Part018.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part018.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2304 + j) 3)) (Nat.land (2304 + j) 7) GibbsCertificateData.Part018.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part018.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295, chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303] 288 128 2304 rfl check018
theorem len018 : GibbsCertificateData.Part018.rows.length = 128 := sound018.1

/-- Kernel check of part 19 (rows 2432…2559). -/
theorem check019 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part019.rows [chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311, chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 304 128 = true := by decide +kernel
theorem sound019 : GibbsCertificateData.Part019.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part019.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2432 + j) 3)) (Nat.land (2432 + j) 7) GibbsCertificateData.Part019.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part019.rows [chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311, chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 304 128 2432 rfl check019
theorem len019 : GibbsCertificateData.Part019.rows.length = 128 := sound019.1


end FKLBridge.Gibbs
