import CWTerminalCenters
import CWFiniteExtraction
import WindowedInterface
import CWContextualReprofile

/-! The terminal extractor consumes the same windowed constituent powers
that earlier extraction and labelled sector allocation produce. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- The terminal source interface is exactly the windowed power with the verifier's full fine laws. -/
theorem terminal_parent_interface (q extreme middle : ℕ) (positive : 0 < extreme+middle) (tolerance : ℝ) :
    (data (counts extreme middle)).parentInterface (K := K) q
      ((data (counts extreme middle)).parentWindow (P := Fin (2*(extreme+middle)))
        (data (counts extreme middle)).fineX tolerance)
      ((data (counts extreme middle)).parentWindow (P := Fin (2*(extreme+middle)))
        (data (counts extreme middle)).fineY tolerance)
      ((data (counts extreme middle)).parentWindow (P := Fin (2*(extreme+middle)))
        (data (counts extreme middle)).fineZ tolerance) =
      Interface.windowedPower (P := Fin (2*(extreme+middle))) (constituent (K := K) q 2 parent)
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        binaryParentLaw binaryParentLaw (ternaryParentLaw (parameter extreme middle)) tolerance := by
  letI : Nonempty (Fin (2*(extreme+middle))) := ⟨⟨0, by omega⟩⟩
  simp only [SplitRestrictionData.parentWindow, terminal_center_x extreme middle positive,
    terminal_center_y extreme middle positive, terminal_center_z extreme middle positive]
  funext x y z
  simp only [SplitRestrictionData.parentInterface, Interface.windowedPower,
    acceptedTensor, Interface.activeWithin_nonempty]
  rfl

/-- A larger available terminal parent window supplies the chosen extraction window at unit cost. -/
theorem contextReduction_terminal_narrow {T : Type*} [Fintype T]
    (q : ℕ) (extreme middle : T → ℕ) (narrow wide : ℝ) (smaller : narrow ≤ wide) :
    let terminal := fun type => data (counts (extreme type) (middle type))
    let Positions := fun type => Fin (2*(extreme type+middle type))
    ContextReduction.{v} (Mixed.parentInterface (K := K) terminal q
      (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineX) (fun _ => wide))
      (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineY) (fun _ => wide))
      (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineZ) (fun _ => wide)))
      (Mixed.parentInterface (K := K) terminal q
        (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineX) (fun _ => narrow))
        (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineY) (fun _ => narrow))
        (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineZ) (fun _ => narrow))) 1 := by
  dsimp only
  apply Mixed.contextReduction_narrowerParent
  · intro type fine inside
    exact within_mono _ fine smaller inside
  · intro type fine inside
    exact within_mono _ fine smaller inside
  · intro type fine inside
    exact within_mono _ fine smaller inside

end
end MatrixBounds.Tensor.CW.Terminal
