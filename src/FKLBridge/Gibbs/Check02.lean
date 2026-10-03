module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 20 (rows 2560…2687). -/
theorem check020 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part020.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327, chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335] 320 128 = true := by decide +kernel
theorem sound020 : GibbsCertificateData.Part020.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part020.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2560 + j) 3)) (Nat.land (2560 + j) 7) GibbsCertificateData.Part020.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part020.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327, chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335] 320 128 2560 rfl check020
theorem len020 : GibbsCertificateData.Part020.rows.length = 128 := sound020.1

/-- Kernel check of part 21 (rows 2688…2815). -/
theorem check021 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part021.rows [chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343, chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 336 128 = true := by decide +kernel
theorem sound021 : GibbsCertificateData.Part021.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part021.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2688 + j) 3)) (Nat.land (2688 + j) 7) GibbsCertificateData.Part021.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part021.rows [chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343, chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 336 128 2688 rfl check021
theorem len021 : GibbsCertificateData.Part021.rows.length = 128 := sound021.1

/-- Kernel check of part 22 (rows 2816…2943). -/
theorem check022 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part022.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359, chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367] 352 128 = true := by decide +kernel
theorem sound022 : GibbsCertificateData.Part022.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part022.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2816 + j) 3)) (Nat.land (2816 + j) 7) GibbsCertificateData.Part022.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part022.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359, chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367] 352 128 2816 rfl check022
theorem len022 : GibbsCertificateData.Part022.rows.length = 128 := sound022.1

/-- Kernel check of part 23 (rows 2944…3071). -/
theorem check023 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part023.rows [chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375, chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 368 128 = true := by decide +kernel
theorem sound023 : GibbsCertificateData.Part023.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part023.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (2944 + j) 3)) (Nat.land (2944 + j) 7) GibbsCertificateData.Part023.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part023.rows [chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375, chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 368 128 2944 rfl check023
theorem len023 : GibbsCertificateData.Part023.rows.length = 128 := sound023.1

/-- Kernel check of part 24 (rows 3072…3199). -/
theorem check024 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part024.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391, chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399] 384 128 = true := by decide +kernel
theorem sound024 : GibbsCertificateData.Part024.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part024.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3072 + j) 3)) (Nat.land (3072 + j) 7) GibbsCertificateData.Part024.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part024.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391, chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399] 384 128 3072 rfl check024
theorem len024 : GibbsCertificateData.Part024.rows.length = 128 := sound024.1

/-- Kernel check of part 25 (rows 3200…3327). -/
theorem check025 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part025.rows [chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407, chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 400 128 = true := by decide +kernel
theorem sound025 : GibbsCertificateData.Part025.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part025.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3200 + j) 3)) (Nat.land (3200 + j) 7) GibbsCertificateData.Part025.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part025.rows [chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407, chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 400 128 3200 rfl check025
theorem len025 : GibbsCertificateData.Part025.rows.length = 128 := sound025.1

/-- Kernel check of part 26 (rows 3328…3455). -/
theorem check026 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part026.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423, chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431] 416 128 = true := by decide +kernel
theorem sound026 : GibbsCertificateData.Part026.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part026.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3328 + j) 3)) (Nat.land (3328 + j) 7) GibbsCertificateData.Part026.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part026.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423, chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431] 416 128 3328 rfl check026
theorem len026 : GibbsCertificateData.Part026.rows.length = 128 := sound026.1

/-- Kernel check of part 27 (rows 3456…3583). -/
theorem check027 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part027.rows [chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439, chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 432 128 = true := by decide +kernel
theorem sound027 : GibbsCertificateData.Part027.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part027.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3456 + j) 3)) (Nat.land (3456 + j) 7) GibbsCertificateData.Part027.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part027.rows [chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439, chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 432 128 3456 rfl check027
theorem len027 : GibbsCertificateData.Part027.rows.length = 128 := sound027.1

/-- Kernel check of part 28 (rows 3584…3711). -/
theorem check028 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part028.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455, chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463] 448 128 = true := by decide +kernel
theorem sound028 : GibbsCertificateData.Part028.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part028.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3584 + j) 3)) (Nat.land (3584 + j) 7) GibbsCertificateData.Part028.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part028.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455, chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463] 448 128 3584 rfl check028
theorem len028 : GibbsCertificateData.Part028.rows.length = 128 := sound028.1

/-- Kernel check of part 29 (rows 3712…3839). -/
theorem check029 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part029.rows [chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471, chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 464 128 = true := by decide +kernel
theorem sound029 : GibbsCertificateData.Part029.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part029.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3712 + j) 3)) (Nat.land (3712 + j) 7) GibbsCertificateData.Part029.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part029.rows [chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471, chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 464 128 3712 rfl check029
theorem len029 : GibbsCertificateData.Part029.rows.length = 128 := sound029.1


end FKLBridge.Gibbs
