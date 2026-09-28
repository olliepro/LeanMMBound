import TerminalRateCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts0
set_option maxRecDepth 100000

/-- Adjacent source-order endpoints covering every original dimension certificate term. -/
def entries : List ℕ := [0, 34, 90, 150, 198, 256, 328, 388, 406, 446, 492, 538, 598, 646, 706, 766, 814, 862, 912, 972, 1030, 1054, 1076, 1124, 1170, 1226, 1286, 1334, 1394, 1430, 1490, 1538, 1598, 1646, 1704, 1746, 1802, 1848, 1860, 1882, 1924, 1972, 2020, 2080, 2128, 2176, 2212, 2272, 2320, 2378, 2414, 2462, 2522, 2558, 2614, 2646, 2680, 2680, 2714, 2748, 2796, 2832, 2892, 2916, 2976, 3024, 3060, 3120, 3156, 3192, 3252, 3276, 3336, 3360, 3394, 3394, 3394, 3438, 3462, 3522, 3546, 3606, 3630, 3690, 3738, 3762, 3822, 3858, 3894, 3938, 3962, 3986, 3986, 3986, 4028, 4052, 4104, 4140, 4200, 4212, 4284, 4320, 4356, 4404, 4428, 4452, 4452, 4452, 4494, 4530, 4578, 4622, 4670, 4706, 4754, 4776, 4794, 4794, 4802, 4832, 4880, 4904, 4964, 4998, 5022, 5022, 5028, 5058, 5094, 5128, 5128, 5142, 5162, 5162, 5170, 5170, 5174, 5181, 5195, 5209, 5222, 5239, 5256, 5267, 5281, 5295, 5304, 5307, 5307, 5313, 5322, 5333, 5344, 5358, 5375, 5386, 5392, 5406, 5417, 5423, 5426, 5426, 5429, 5435, 5446, 5460, 5471, 5477, 5494, 5505, 5508, 5519, 5525, 5528, 5528, 5531, 5534, 5537, 5548, 5562, 5568, 5579, 5593, 5598, 5604, 5610, 5613, 5613, 5613, 5616, 5622, 5622, 5633, 5647, 5647, 5661, 5672, 5672, 5678, 5681, 5681, 5681, 5681, 5684, 5689, 5692, 5700, 5711, 5711, 5722, 5728, 5728, 5731, 5731, 5731, 5731, 5734, 5739, 5739, 5747, 5752, 5755, 5759, 5759, 5762, 5762, 5762, 5762, 5765, 5765, 5765, 5768, 5770, 5770, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5773, 5785, 5871, 5978, 6001, 6001, 6001, 6001, 6001, 6001, 6001, 6001, 6001]

/-- Endpoint of one original dimension certificate window. -/
def cut (index : ℕ) : ℕ := entries[index]?.getD 0

/-- The first window starts at the first original certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel

/-- The final window reaches the end of the unchanged complete certificate. -/
theorem last : cut 267 = 6001 := by decide +kernel

/-- Every consecutive pair of endpoints is ordered. -/
theorem ordered : ∀ index : Fin 267, cut index.val ≤ cut (index.val+1) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateCuts0
