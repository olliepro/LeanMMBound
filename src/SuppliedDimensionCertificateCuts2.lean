import TerminalRateCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts2
set_option maxRecDepth 100000

/-- Adjacent source-order endpoints covering every original dimension certificate term. -/
def entries : List ℕ := [0, 2, 2, 2, 2, 2, 2, 2, 2, 12, 22, 46, 92, 92, 140, 176, 188, 234, 260, 296, 342, 390, 400, 422, 446, 490, 514, 572, 594, 640, 676, 722, 758, 802, 838, 892, 934, 992, 1044, 1056, 1078, 1126, 1148, 1218, 1242, 1290, 1350, 1362, 1434, 1458, 1506, 1566, 1614, 1674, 1720, 1764, 1834, 1862, 1880, 1902, 1950, 1982, 2030, 2090, 2102, 2172, 2208, 2244, 2304, 2328, 2400, 2448, 2508, 2556, 2628, 2684, 2684, 2716, 2728, 2786, 2810, 2858, 2918, 2930, 3002, 3038, 3086, 3146, 3170, 3242, 3278, 3350, 3396, 3396, 3424, 3436, 3488, 3512, 3570, 3618, 3666, 3726, 3750, 3820, 3856, 3928, 3976, 3976, 4006, 4028, 4088, 4122, 4180, 4216, 4288, 4322, 4392, 4440, 4440, 4472, 4520, 4568, 4626, 4674, 4746, 4794, 4802, 4840, 4900, 4956, 4998, 5012, 5054, 5100, 5128, 5150, 5150, 5150, 5150, 5150, 5150, 5150, 5151, 5151, 5151, 5151, 5151, 5151, 5151, 5151, 5151, 5151, 5151, 5154, 5154, 5157, 5160, 5160, 5163, 5169, 5172, 5175, 5175, 5175, 5175, 5175, 5178, 5184, 5184, 5190, 5196, 5199, 5205, 5214, 5220, 5220, 5220, 5220, 5220, 5223, 5231, 5237, 5242, 5253, 5259, 5264, 5275, 5289, 5297, 5297, 5297, 5300, 5300, 5308, 5319, 5325, 5333, 5344, 5350, 5361, 5375, 5389, 5389, 5389, 5392, 5398, 5403, 5409, 5423, 5434, 5440, 5454, 5463, 5474, 5491, 5491, 5491, 5494, 5500, 5505, 5511, 5522, 5531, 5542, 5556, 5559, 5576, 5576, 5576, 5579, 5585, 5593, 5599, 5610, 5624, 5630, 5644, 5644, 5647, 5653, 5661, 5675, 5684, 5695, 5695, 5698, 5709, 5717, 5728, 5728, 5737, 5748, 5748, 5757, 5757, 5760, 5760, 5760, 5760, 5760, 5760, 5772, 5803, 5859, 5922, 5966, 5986, 5990]

/-- Endpoint of one original dimension certificate window. -/
def cut (index : ℕ) : ℕ := entries[index]?.getD 0

/-- The first window starts at the first original certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel

/-- The final window reaches the end of the unchanged complete certificate. -/
theorem last : cut 267 = 5990 := by decide +kernel

/-- Every consecutive pair of endpoints is ordered. -/
theorem ordered : ∀ index : Fin 267, cut index.val ≤ cut (index.val+1) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts2
