module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 10 (rows 2560…2815). -/
theorem check010 : Rows.partOk tree Rows.dyOk CertificateData.Part010.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327, chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335, chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343, chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 320 256 = true := by decide +kernel
theorem sound010 : CertificateData.Part010.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part010.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (2560 + j) 3)) (Nat.land (2560 + j) 7) CertificateData.Part010.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part010.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327, chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335, chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343, chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 320 256 2560 rfl check010
theorem len010 : CertificateData.Part010.rows.length = 256 := sound010.1

/-- Kernel check of part 11 (rows 2816…3071). -/
theorem check011 : Rows.partOk tree Rows.dyOk CertificateData.Part011.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359, chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367, chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375, chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 352 256 = true := by decide +kernel
theorem sound011 : CertificateData.Part011.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part011.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (2816 + j) 3)) (Nat.land (2816 + j) 7) CertificateData.Part011.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part011.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359, chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367, chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375, chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 352 256 2816 rfl check011
theorem len011 : CertificateData.Part011.rows.length = 256 := sound011.1

/-- Kernel check of part 12 (rows 3072…3327). -/
theorem check012 : Rows.partOk tree Rows.dyOk CertificateData.Part012.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391, chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399, chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407, chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 384 256 = true := by decide +kernel
theorem sound012 : CertificateData.Part012.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part012.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (3072 + j) 3)) (Nat.land (3072 + j) 7) CertificateData.Part012.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part012.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391, chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399, chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407, chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 384 256 3072 rfl check012
theorem len012 : CertificateData.Part012.rows.length = 256 := sound012.1

/-- Kernel check of part 13 (rows 3328…3583). -/
theorem check013 : Rows.partOk tree Rows.dyOk CertificateData.Part013.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423, chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431, chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439, chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 416 256 = true := by decide +kernel
theorem sound013 : CertificateData.Part013.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part013.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (3328 + j) 3)) (Nat.land (3328 + j) 7) CertificateData.Part013.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part013.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423, chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431, chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439, chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 416 256 3328 rfl check013
theorem len013 : CertificateData.Part013.rows.length = 256 := sound013.1

/-- Kernel check of part 14 (rows 3584…3839). -/
theorem check014 : Rows.partOk tree Rows.dyOk CertificateData.Part014.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455, chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463, chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471, chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 448 256 = true := by decide +kernel
theorem sound014 : CertificateData.Part014.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part014.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (3584 + j) 3)) (Nat.land (3584 + j) 7) CertificateData.Part014.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part014.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455, chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463, chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471, chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 448 256 3584 rfl check014
theorem len014 : CertificateData.Part014.rows.length = 256 := sound014.1

/-- Kernel check of part 15 (rows 3840…4095). -/
theorem check015 : Rows.partOk tree Rows.dyOk CertificateData.Part015.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487, chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495, chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503, chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 480 256 = true := by decide +kernel
theorem sound015 : CertificateData.Part015.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part015.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (3840 + j) 3)) (Nat.land (3840 + j) 7) CertificateData.Part015.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part015.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487, chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495, chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503, chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 480 256 3840 rfl check015
theorem len015 : CertificateData.Part015.rows.length = 256 := sound015.1

/-- Kernel check of part 16 (rows 4096…4351). -/
theorem check016 : Rows.partOk tree Rows.dyOk CertificateData.Part016.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519, chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527, chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535, chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 512 256 = true := by decide +kernel
theorem sound016 : CertificateData.Part016.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part016.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (4096 + j) 3)) (Nat.land (4096 + j) 7) CertificateData.Part016.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part016.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519, chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527, chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535, chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 512 256 4096 rfl check016
theorem len016 : CertificateData.Part016.rows.length = 256 := sound016.1

/-- Kernel check of part 17 (rows 4352…4607). -/
theorem check017 : Rows.partOk tree Rows.dyOk CertificateData.Part017.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551, chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559, chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567, chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 544 256 = true := by decide +kernel
theorem sound017 : CertificateData.Part017.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part017.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (4352 + j) 3)) (Nat.land (4352 + j) 7) CertificateData.Part017.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part017.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551, chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559, chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567, chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 544 256 4352 rfl check017
theorem len017 : CertificateData.Part017.rows.length = 256 := sound017.1

/-- Kernel check of part 18 (rows 4608…4863). -/
theorem check018 : Rows.partOk tree Rows.dyOk CertificateData.Part018.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583, chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591, chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599, chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 576 256 = true := by decide +kernel
theorem sound018 : CertificateData.Part018.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part018.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (4608 + j) 3)) (Nat.land (4608 + j) 7) CertificateData.Part018.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part018.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583, chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591, chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599, chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 576 256 4608 rfl check018
theorem len018 : CertificateData.Part018.rows.length = 256 := sound018.1

/-- Kernel check of part 19 (rows 4864…5119). -/
theorem check019 : Rows.partOk tree Rows.dyOk CertificateData.Part019.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615, chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623, chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631, chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 608 256 = true := by decide +kernel
theorem sound019 : CertificateData.Part019.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part019.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (4864 + j) 3)) (Nat.land (4864 + j) 7) CertificateData.Part019.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part019.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615, chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623, chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631, chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 608 256 4864 rfl check019
theorem len019 : CertificateData.Part019.rows.length = 256 := sound019.1


end FKLBridge.Dyadic
