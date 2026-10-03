module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 70 (rows 4480…4543). -/
theorem check070 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part070.rows [chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567] 560 64 = true := by decide +kernel
theorem sound070 : SplitCertificateData.Part070.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part070.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4480 + j) 3)) (Nat.land (4480 + j) 7) SplitCertificateData.Part070.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part070.rows [chunk0560, chunk0561, chunk0562, chunk0563, chunk0564, chunk0565, chunk0566, chunk0567] 560 64 4480 rfl check070
theorem len070 : SplitCertificateData.Part070.rows.length = 64 := sound070.1

/-- Kernel check of part 71 (rows 4544…4607). -/
theorem check071 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part071.rows [chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 568 64 = true := by decide +kernel
theorem sound071 : SplitCertificateData.Part071.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part071.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4544 + j) 3)) (Nat.land (4544 + j) 7) SplitCertificateData.Part071.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part071.rows [chunk0568, chunk0569, chunk0570, chunk0571, chunk0572, chunk0573, chunk0574, chunk0575] 568 64 4544 rfl check071
theorem len071 : SplitCertificateData.Part071.rows.length = 64 := sound071.1

/-- Kernel check of part 72 (rows 4608…4671). -/
theorem check072 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part072.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583] 576 64 = true := by decide +kernel
theorem sound072 : SplitCertificateData.Part072.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part072.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4608 + j) 3)) (Nat.land (4608 + j) 7) SplitCertificateData.Part072.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part072.rows [chunk0576, chunk0577, chunk0578, chunk0579, chunk0580, chunk0581, chunk0582, chunk0583] 576 64 4608 rfl check072
theorem len072 : SplitCertificateData.Part072.rows.length = 64 := sound072.1

/-- Kernel check of part 73 (rows 4672…4735). -/
theorem check073 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part073.rows [chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591] 584 64 = true := by decide +kernel
theorem sound073 : SplitCertificateData.Part073.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part073.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4672 + j) 3)) (Nat.land (4672 + j) 7) SplitCertificateData.Part073.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part073.rows [chunk0584, chunk0585, chunk0586, chunk0587, chunk0588, chunk0589, chunk0590, chunk0591] 584 64 4672 rfl check073
theorem len073 : SplitCertificateData.Part073.rows.length = 64 := sound073.1

/-- Kernel check of part 74 (rows 4736…4799). -/
theorem check074 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part074.rows [chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599] 592 64 = true := by decide +kernel
theorem sound074 : SplitCertificateData.Part074.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part074.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4736 + j) 3)) (Nat.land (4736 + j) 7) SplitCertificateData.Part074.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part074.rows [chunk0592, chunk0593, chunk0594, chunk0595, chunk0596, chunk0597, chunk0598, chunk0599] 592 64 4736 rfl check074
theorem len074 : SplitCertificateData.Part074.rows.length = 64 := sound074.1

/-- Kernel check of part 75 (rows 4800…4863). -/
theorem check075 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part075.rows [chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 600 64 = true := by decide +kernel
theorem sound075 : SplitCertificateData.Part075.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part075.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4800 + j) 3)) (Nat.land (4800 + j) 7) SplitCertificateData.Part075.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part075.rows [chunk0600, chunk0601, chunk0602, chunk0603, chunk0604, chunk0605, chunk0606, chunk0607] 600 64 4800 rfl check075
theorem len075 : SplitCertificateData.Part075.rows.length = 64 := sound075.1

/-- Kernel check of part 76 (rows 4864…4927). -/
theorem check076 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part076.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615] 608 64 = true := by decide +kernel
theorem sound076 : SplitCertificateData.Part076.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part076.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4864 + j) 3)) (Nat.land (4864 + j) 7) SplitCertificateData.Part076.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part076.rows [chunk0608, chunk0609, chunk0610, chunk0611, chunk0612, chunk0613, chunk0614, chunk0615] 608 64 4864 rfl check076
theorem len076 : SplitCertificateData.Part076.rows.length = 64 := sound076.1

/-- Kernel check of part 77 (rows 4928…4991). -/
theorem check077 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part077.rows [chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623] 616 64 = true := by decide +kernel
theorem sound077 : SplitCertificateData.Part077.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part077.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4928 + j) 3)) (Nat.land (4928 + j) 7) SplitCertificateData.Part077.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part077.rows [chunk0616, chunk0617, chunk0618, chunk0619, chunk0620, chunk0621, chunk0622, chunk0623] 616 64 4928 rfl check077
theorem len077 : SplitCertificateData.Part077.rows.length = 64 := sound077.1

/-- Kernel check of part 78 (rows 4992…5055). -/
theorem check078 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part078.rows [chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631] 624 64 = true := by decide +kernel
theorem sound078 : SplitCertificateData.Part078.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part078.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4992 + j) 3)) (Nat.land (4992 + j) 7) SplitCertificateData.Part078.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part078.rows [chunk0624, chunk0625, chunk0626, chunk0627, chunk0628, chunk0629, chunk0630, chunk0631] 624 64 4992 rfl check078
theorem len078 : SplitCertificateData.Part078.rows.length = 64 := sound078.1

/-- Kernel check of part 79 (rows 5056…5119). -/
theorem check079 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part079.rows [chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 632 64 = true := by decide +kernel
theorem sound079 : SplitCertificateData.Part079.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part079.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5056 + j) 3)) (Nat.land (5056 + j) 7) SplitCertificateData.Part079.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part079.rows [chunk0632, chunk0633, chunk0634, chunk0635, chunk0636, chunk0637, chunk0638, chunk0639] 632 64 5056 rfl check079
theorem len079 : SplitCertificateData.Part079.rows.length = 64 := sound079.1


end FKLBridge.Split
