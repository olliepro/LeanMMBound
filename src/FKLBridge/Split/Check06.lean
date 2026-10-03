module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 60 (rows 3840…3903). -/
theorem check060 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part060.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487] 480 64 = true := by decide +kernel
theorem sound060 : SplitCertificateData.Part060.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part060.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3840 + j) 3)) (Nat.land (3840 + j) 7) SplitCertificateData.Part060.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part060.rows [chunk0480, chunk0481, chunk0482, chunk0483, chunk0484, chunk0485, chunk0486, chunk0487] 480 64 3840 rfl check060
theorem len060 : SplitCertificateData.Part060.rows.length = 64 := sound060.1

/-- Kernel check of part 61 (rows 3904…3967). -/
theorem check061 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part061.rows [chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495] 488 64 = true := by decide +kernel
theorem sound061 : SplitCertificateData.Part061.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part061.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3904 + j) 3)) (Nat.land (3904 + j) 7) SplitCertificateData.Part061.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part061.rows [chunk0488, chunk0489, chunk0490, chunk0491, chunk0492, chunk0493, chunk0494, chunk0495] 488 64 3904 rfl check061
theorem len061 : SplitCertificateData.Part061.rows.length = 64 := sound061.1

/-- Kernel check of part 62 (rows 3968…4031). -/
theorem check062 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part062.rows [chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503] 496 64 = true := by decide +kernel
theorem sound062 : SplitCertificateData.Part062.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part062.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3968 + j) 3)) (Nat.land (3968 + j) 7) SplitCertificateData.Part062.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part062.rows [chunk0496, chunk0497, chunk0498, chunk0499, chunk0500, chunk0501, chunk0502, chunk0503] 496 64 3968 rfl check062
theorem len062 : SplitCertificateData.Part062.rows.length = 64 := sound062.1

/-- Kernel check of part 63 (rows 4032…4095). -/
theorem check063 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part063.rows [chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 504 64 = true := by decide +kernel
theorem sound063 : SplitCertificateData.Part063.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part063.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4032 + j) 3)) (Nat.land (4032 + j) 7) SplitCertificateData.Part063.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part063.rows [chunk0504, chunk0505, chunk0506, chunk0507, chunk0508, chunk0509, chunk0510, chunk0511] 504 64 4032 rfl check063
theorem len063 : SplitCertificateData.Part063.rows.length = 64 := sound063.1

/-- Kernel check of part 64 (rows 4096…4159). -/
theorem check064 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part064.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519] 512 64 = true := by decide +kernel
theorem sound064 : SplitCertificateData.Part064.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part064.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4096 + j) 3)) (Nat.land (4096 + j) 7) SplitCertificateData.Part064.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part064.rows [chunk0512, chunk0513, chunk0514, chunk0515, chunk0516, chunk0517, chunk0518, chunk0519] 512 64 4096 rfl check064
theorem len064 : SplitCertificateData.Part064.rows.length = 64 := sound064.1

/-- Kernel check of part 65 (rows 4160…4223). -/
theorem check065 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part065.rows [chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527] 520 64 = true := by decide +kernel
theorem sound065 : SplitCertificateData.Part065.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part065.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4160 + j) 3)) (Nat.land (4160 + j) 7) SplitCertificateData.Part065.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part065.rows [chunk0520, chunk0521, chunk0522, chunk0523, chunk0524, chunk0525, chunk0526, chunk0527] 520 64 4160 rfl check065
theorem len065 : SplitCertificateData.Part065.rows.length = 64 := sound065.1

/-- Kernel check of part 66 (rows 4224…4287). -/
theorem check066 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part066.rows [chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535] 528 64 = true := by decide +kernel
theorem sound066 : SplitCertificateData.Part066.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part066.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4224 + j) 3)) (Nat.land (4224 + j) 7) SplitCertificateData.Part066.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part066.rows [chunk0528, chunk0529, chunk0530, chunk0531, chunk0532, chunk0533, chunk0534, chunk0535] 528 64 4224 rfl check066
theorem len066 : SplitCertificateData.Part066.rows.length = 64 := sound066.1

/-- Kernel check of part 67 (rows 4288…4351). -/
theorem check067 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part067.rows [chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 536 64 = true := by decide +kernel
theorem sound067 : SplitCertificateData.Part067.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part067.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4288 + j) 3)) (Nat.land (4288 + j) 7) SplitCertificateData.Part067.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part067.rows [chunk0536, chunk0537, chunk0538, chunk0539, chunk0540, chunk0541, chunk0542, chunk0543] 536 64 4288 rfl check067
theorem len067 : SplitCertificateData.Part067.rows.length = 64 := sound067.1

/-- Kernel check of part 68 (rows 4352…4415). -/
theorem check068 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part068.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551] 544 64 = true := by decide +kernel
theorem sound068 : SplitCertificateData.Part068.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part068.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4352 + j) 3)) (Nat.land (4352 + j) 7) SplitCertificateData.Part068.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part068.rows [chunk0544, chunk0545, chunk0546, chunk0547, chunk0548, chunk0549, chunk0550, chunk0551] 544 64 4352 rfl check068
theorem len068 : SplitCertificateData.Part068.rows.length = 64 := sound068.1

/-- Kernel check of part 69 (rows 4416…4479). -/
theorem check069 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part069.rows [chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559] 552 64 = true := by decide +kernel
theorem sound069 : SplitCertificateData.Part069.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part069.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (4416 + j) 3)) (Nat.land (4416 + j) 7) SplitCertificateData.Part069.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part069.rows [chunk0552, chunk0553, chunk0554, chunk0555, chunk0556, chunk0557, chunk0558, chunk0559] 552 64 4416 rfl check069
theorem len069 : SplitCertificateData.Part069.rows.length = 64 := sound069.1


end FKLBridge.Split
