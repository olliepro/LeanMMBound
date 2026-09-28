import LogGridData.Part000
import LogGridData.Part001
import LogGridData.Part002
import LogGridData.Part003
import LogGridData.Part004
import LogGridData.Part005
import LogGridData.Part006
import LogGridData.Part007
import LogGridData.Part008
import LogGridData.Part009
import LogGridData.Part010
import LogGridData.Part011
import LogGridData.Part012
import LogGridData.Part013
import LogGridData.Part014
import LogGridData.Part015
import LogGridData.Part016
import LogGridData.Part017
import LogGridData.Part018
import LogGridData.Part019
import LogGridData.Part020
import LogGridData.Part021
import LogGridData.Part022
import LogGridData.Part023
import LogGridData.Part024
import LogGridData.Part025
import LogGridData.Part026
import LogGridData.Part027
import LogGridData.Part028
import LogGridData.Part029
import LogGridData.Part030
import LogGridData.Part031

namespace MatrixBounds.Numeric.CertifiedLogGrid
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- A valid default outside the checked finite table; the input-index theorem excludes this case. -/
def defaultEntry : CertifiedLogBound where
  input := 1
  bounds := Interval.point 0
  sound := by norm_num [Interval.Contains, Interval.point]

/-- Read the proved logarithm record at its exact supplied grid index. -/
def entry (index : Fin 256) : CertifiedLogBound :=
  match index.val/8 with
  | 0 => LogGridData.Part000.entries[index.val%8]?.getD defaultEntry
  | 1 => LogGridData.Part001.entries[index.val%8]?.getD defaultEntry
  | 2 => LogGridData.Part002.entries[index.val%8]?.getD defaultEntry
  | 3 => LogGridData.Part003.entries[index.val%8]?.getD defaultEntry
  | 4 => LogGridData.Part004.entries[index.val%8]?.getD defaultEntry
  | 5 => LogGridData.Part005.entries[index.val%8]?.getD defaultEntry
  | 6 => LogGridData.Part006.entries[index.val%8]?.getD defaultEntry
  | 7 => LogGridData.Part007.entries[index.val%8]?.getD defaultEntry
  | 8 => LogGridData.Part008.entries[index.val%8]?.getD defaultEntry
  | 9 => LogGridData.Part009.entries[index.val%8]?.getD defaultEntry
  | 10 => LogGridData.Part010.entries[index.val%8]?.getD defaultEntry
  | 11 => LogGridData.Part011.entries[index.val%8]?.getD defaultEntry
  | 12 => LogGridData.Part012.entries[index.val%8]?.getD defaultEntry
  | 13 => LogGridData.Part013.entries[index.val%8]?.getD defaultEntry
  | 14 => LogGridData.Part014.entries[index.val%8]?.getD defaultEntry
  | 15 => LogGridData.Part015.entries[index.val%8]?.getD defaultEntry
  | 16 => LogGridData.Part016.entries[index.val%8]?.getD defaultEntry
  | 17 => LogGridData.Part017.entries[index.val%8]?.getD defaultEntry
  | 18 => LogGridData.Part018.entries[index.val%8]?.getD defaultEntry
  | 19 => LogGridData.Part019.entries[index.val%8]?.getD defaultEntry
  | 20 => LogGridData.Part020.entries[index.val%8]?.getD defaultEntry
  | 21 => LogGridData.Part021.entries[index.val%8]?.getD defaultEntry
  | 22 => LogGridData.Part022.entries[index.val%8]?.getD defaultEntry
  | 23 => LogGridData.Part023.entries[index.val%8]?.getD defaultEntry
  | 24 => LogGridData.Part024.entries[index.val%8]?.getD defaultEntry
  | 25 => LogGridData.Part025.entries[index.val%8]?.getD defaultEntry
  | 26 => LogGridData.Part026.entries[index.val%8]?.getD defaultEntry
  | 27 => LogGridData.Part027.entries[index.val%8]?.getD defaultEntry
  | 28 => LogGridData.Part028.entries[index.val%8]?.getD defaultEntry
  | 29 => LogGridData.Part029.entries[index.val%8]?.getD defaultEntry
  | 30 => LogGridData.Part030.entries[index.val%8]?.getD defaultEntry
  | 31 => LogGridData.Part031.entries[index.val%8]?.getD defaultEntry
  | _ => defaultEntry

/-- The lookup table covers exactly the intended grid, in order, without an unchecked indexing assumption. -/
theorem input_correct : ∀ index : Fin 256, (entry index).input = 1+(index.val : ℚ)/256 := by decide +kernel

/-- Every looked-up interval contains the actual real logarithm of its intended grid point. -/
theorem bounds_sound (index : Fin 256) :
    (entry index).bounds.Contains (Real.log ((1+(index.val : ℚ)/256 : ℚ) : ℝ)) := by
  have inside := (entry index).sound
  rw [input_correct index] at inside
  exact inside

end MatrixBounds.Numeric.CertifiedLogGrid
