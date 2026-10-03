module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 30 (rows 3840…3967). -/
theorem check030 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part030.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487, chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495] 480 128 = true := by decide +kernel
theorem sound030 : GibbsCertificateData.Part030.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part030.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3840 + j) 3)) (Nat.land (3840 + j) 7) GibbsCertificateData.Part030.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part030.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487, chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495] 480 128 3840 rfl check030
theorem len030 : GibbsCertificateData.Part030.rows.length = 128 := sound030.1

/-- Kernel check of part 31 (rows 3968…4095). -/
theorem check031 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part031.rows [chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503, chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 496 128 = true := by decide +kernel
theorem sound031 : GibbsCertificateData.Part031.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part031.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (3968 + j) 3)) (Nat.land (3968 + j) 7) GibbsCertificateData.Part031.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part031.rows [chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503, chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 496 128 3968 rfl check031
theorem len031 : GibbsCertificateData.Part031.rows.length = 128 := sound031.1

/-- Kernel check of part 32 (rows 4096…4223). -/
theorem check032 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part032.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519, chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527] 512 128 = true := by decide +kernel
theorem sound032 : GibbsCertificateData.Part032.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part032.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4096 + j) 3)) (Nat.land (4096 + j) 7) GibbsCertificateData.Part032.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part032.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519, chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527] 512 128 4096 rfl check032
theorem len032 : GibbsCertificateData.Part032.rows.length = 128 := sound032.1

/-- Kernel check of part 33 (rows 4224…4351). -/
theorem check033 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part033.rows [chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535, chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 528 128 = true := by decide +kernel
theorem sound033 : GibbsCertificateData.Part033.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part033.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4224 + j) 3)) (Nat.land (4224 + j) 7) GibbsCertificateData.Part033.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part033.rows [chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535, chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 528 128 4224 rfl check033
theorem len033 : GibbsCertificateData.Part033.rows.length = 128 := sound033.1

/-- Kernel check of part 34 (rows 4352…4479). -/
theorem check034 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part034.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551, chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559] 544 128 = true := by decide +kernel
theorem sound034 : GibbsCertificateData.Part034.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part034.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4352 + j) 3)) (Nat.land (4352 + j) 7) GibbsCertificateData.Part034.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part034.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551, chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559] 544 128 4352 rfl check034
theorem len034 : GibbsCertificateData.Part034.rows.length = 128 := sound034.1

/-- Kernel check of part 35 (rows 4480…4607). -/
theorem check035 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part035.rows [chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567, chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 560 128 = true := by decide +kernel
theorem sound035 : GibbsCertificateData.Part035.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part035.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4480 + j) 3)) (Nat.land (4480 + j) 7) GibbsCertificateData.Part035.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part035.rows [chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567, chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 560 128 4480 rfl check035
theorem len035 : GibbsCertificateData.Part035.rows.length = 128 := sound035.1

/-- Kernel check of part 36 (rows 4608…4735). -/
theorem check036 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part036.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583, chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591] 576 128 = true := by decide +kernel
theorem sound036 : GibbsCertificateData.Part036.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part036.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4608 + j) 3)) (Nat.land (4608 + j) 7) GibbsCertificateData.Part036.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part036.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583, chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591] 576 128 4608 rfl check036
theorem len036 : GibbsCertificateData.Part036.rows.length = 128 := sound036.1

/-- Kernel check of part 37 (rows 4736…4863). -/
theorem check037 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part037.rows [chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599, chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 592 128 = true := by decide +kernel
theorem sound037 : GibbsCertificateData.Part037.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part037.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4736 + j) 3)) (Nat.land (4736 + j) 7) GibbsCertificateData.Part037.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part037.rows [chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599, chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 592 128 4736 rfl check037
theorem len037 : GibbsCertificateData.Part037.rows.length = 128 := sound037.1

/-- Kernel check of part 38 (rows 4864…4991). -/
theorem check038 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part038.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615, chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623] 608 128 = true := by decide +kernel
theorem sound038 : GibbsCertificateData.Part038.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part038.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4864 + j) 3)) (Nat.land (4864 + j) 7) GibbsCertificateData.Part038.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part038.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615, chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623] 608 128 4864 rfl check038
theorem len038 : GibbsCertificateData.Part038.rows.length = 128 := sound038.1

/-- Kernel check of part 39 (rows 4992…5119). -/
theorem check039 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part039.rows [chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631, chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 624 128 = true := by decide +kernel
theorem sound039 : GibbsCertificateData.Part039.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part039.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (4992 + j) 3)) (Nat.land (4992 + j) 7) GibbsCertificateData.Part039.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part039.rows [chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631, chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 624 128 4992 rfl check039
theorem len039 : GibbsCertificateData.Part039.rows.length = 128 := sound039.1


end FKLBridge.Gibbs
