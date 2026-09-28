import CheckedIndexTable

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha4Part000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 105 15279 :=
  CheckedIndexTable.ofList [
    6377,6378,6379,6380,6381,6382,6383,6384,6385,6386,6387,6388,6389,6390,6391,6392,6393,6394,6395,6396,6397,6398,6399,6400,6401,6402,6403,6404,6405,6406,6407,6408,
    6409,6410,6411,6412,6413,6414,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6434,6435,6436,6437,6438,6439,6440,
    6441,6442,6443,6444,6445,6446,6447,6448,6449,6450,6451,6452,6453,6454,6455,6456,6457,6458,6459,6460,6461,6462,6463,6464,6465,6466,6467,6468,6469,6470,6471,6472,
    6473,6474,6475,6476,6477,6478,6479,6480,6481
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 105 15279 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha4Part000
