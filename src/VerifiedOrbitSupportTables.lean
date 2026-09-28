import VerifiedOrbitStatistics

namespace MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace OrbitLevel2
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 6, totalAt orbit.val = total orbit := by decide
end OrbitLevel2

namespace OrbitLevel3
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4,2,3,3,4,5,4,4,5,6,4,
  5,6,6,7,8
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 21, totalAt orbit.val = total orbit := by decide
end OrbitLevel3

namespace OrbitLevel4
/-- Exact coarse totals for every supplied orbit column. -/
def totalTable : Array ℕ := #[
  0,1,2,2,3,4,2,3,3,4,5,4,4,5,6,4,
  5,6,6,7,8,2,3,3,4,5,3,4,4,5,6,5,
  5,6,7,5,6,7,7,8,9,4,4,5,6,4,5,5,
  6,7,6,6,7,8,6,7,8,8,9,10,4,5,6,4,
  5,5,6,7,6,6,7,8,6,7,8,8,9,10,6,7,
  5,6,6,7,8,7,7,8,9,7,8,9,9,10,11,8,
  6,7,7,8,9,8,8,9,10,8,9,10,10,11,12,4,
  5,5,6,7,6,6,7,8,6,7,8,8,9,10,6,6,
  7,8,7,7,8,9,7,8,9,9,10,11,6,7,8,7,
  7,8,9,7,8,9,9,10,11,8,9,8,8,9,10,8,
  9,10,10,11,12,10,9,9,10,11,9,10,11,11,12,13,
  8,8,9,10,8,9,10,10,11,12,8,9,10,8,9,10,
  10,11,12,10,11,9,10,11,11,12,13,12,10,11,12,12,
  13,14,8,9,10,10,11,12,10,11,11,12,13,12,12,13,
  14,12,13,14,14,15,16
]

/-- Read the supplied orbit's coarse total at a sparse-row column. -/
def totalAt (column : ℕ) : ℕ := totalTable[column]?.getD 0

/-- The finite lookup agrees with the recursively proved statistic of every complete word. -/
theorem totalAt_correct : ∀ orbit : Fin 231, totalAt orbit.val = total orbit := by decide
end OrbitLevel4

end MatrixBounds.Numeric
