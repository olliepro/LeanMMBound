import TerminalRateCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts1
set_option maxRecDepth 100000

/-- Adjacent source-order endpoints covering every original dimension certificate term. -/
def entries : List ℕ := [0, 2, 2, 2, 2, 2, 2, 2, 14, 38, 62, 96, 140, 152, 186, 230, 230, 274, 302, 326, 360, 372, 418, 466, 502, 570, 582, 654, 666, 724, 748, 796, 832, 880, 912, 954, 986, 1018, 1030, 1086, 1132, 1216, 1236, 1308, 1330, 1390, 1438, 1462, 1522, 1546, 1606, 1654, 1690, 1746, 1778, 1808, 1842, 1874, 1920, 1954, 2036, 2060, 2132, 2180, 2204, 2264, 2300, 2348, 2408, 2420, 2492, 2528, 2576, 2610, 2646, 2648, 2692, 2758, 2782, 2866, 2878, 2950, 2998, 3022, 3082, 3118, 3154, 3214, 3238, 3296, 3318, 3354, 3354, 3402, 3468, 3492, 3568, 3580, 3662, 3698, 3734, 3794, 3818, 3876, 3898, 3934, 3934, 3982, 4052, 4088, 4160, 4194, 4266, 4290, 4350, 4372, 4406, 4406, 4454, 4536, 4572, 4620, 4678, 4714, 4750, 4750, 4806, 4860, 4920, 4966, 4966, 5024, 5066, 5078, 5110, 5122, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5123, 5126, 5129, 5132, 5135, 5138, 5141, 5141, 5144, 5147, 5147, 5147, 5147, 5147, 5154, 5160, 5166, 5172, 5172, 5178, 5184, 5184, 5190, 5193, 5193, 5193, 5193, 5193, 5204, 5215, 5226, 5237, 5237, 5248, 5254, 5259, 5267, 5267, 5271, 5271, 5271, 5277, 5287, 5298, 5312, 5323, 5326, 5340, 5343, 5351, 5359, 5359, 5362, 5362, 5362, 5379, 5393, 5399, 5413, 5427, 5433, 5444, 5449, 5455, 5461, 5461, 5464, 5464, 5481, 5492, 5498, 5515, 5523, 5529, 5540, 5540, 5546, 5546, 5549, 5549, 5566, 5577, 5583, 5597, 5605, 5608, 5614, 5617, 5617, 5617, 5634, 5648, 5659, 5665, 5665, 5668, 5671, 5687, 5696, 5699, 5702, 5707, 5719, 5722, 5722, 5728, 5731, 5734, 5734, 5734, 5734, 5734, 5734, 5739, 5761, 5805, 5868, 5922, 5953, 5963, 5963]

/-- Endpoint of one original dimension certificate window. -/
def cut (index : ℕ) : ℕ := entries[index]?.getD 0

/-- The first window starts at the first original certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel

/-- The final window reaches the end of the unchanged complete certificate. -/
theorem last : cut 267 = 5963 := by decide +kernel

/-- Every consecutive pair of endpoints is ordered. -/
theorem ordered : ∀ index : Fin 267, cut index.val ≤ cut (index.val+1) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts1
