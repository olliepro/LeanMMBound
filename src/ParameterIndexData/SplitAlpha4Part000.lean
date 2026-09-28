import CheckedIndexTable

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 105 5542 :=
  CheckedIndexTable.ofList [
    5437,5438,5439,5440,5441,5442,5443,5444,5445,5446,5447,5448,5449,5450,5451,5452,5453,5454,5455,5456,5457,5458,5459,5460,5461,5462,5463,5464,5465,5466,5467,5468,
    5469,5470,5471,5472,5473,5474,5475,5476,5477,5478,5479,5480,5481,5482,5483,5484,5485,5486,5487,5488,5489,5490,5491,5492,5493,5494,5495,5496,5497,5498,5499,5500,
    5501,5502,5503,5504,5505,5506,5507,5508,5509,5510,5511,5512,5513,5514,5515,5516,5517,5518,5519,5520,5521,5522,5523,5524,5525,5526,5527,5528,5529,5530,5531,5532,
    5533,5534,5535,5536,5537,5538,5539,5540,5541
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 105 5542 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000
