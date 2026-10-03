module

public import TerminalRateCertificateWindows

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateCertificateCuts
set_option maxRecDepth 100000

/-- Source-order cut positions spanning every original numerical certificate term. -/
def entries : List ℕ := [0, 109, 217, 331, 451, 585, 719, 849, 955, 1093, 1229, 1365, 1549, 1661, 1825, 1985, 2119, 2283, 2415, 2577, 2755, 2907, 3045, 3175, 3313, 3491, 3621, 3803, 3935, 4101, 4233, 4413, 4569, 4753, 4903, 5043, 5183, 5339, 5473, 5621, 5759, 5931, 6067, 6245, 6383, 6555, 6707, 6845, 7029, 7175, 7327, 7497, 7645, 7803, 7947, 8105, 8265, 8387, 8527, 8669, 8845, 8987, 9167, 9327, 9447, 9623, 9767, 9925, 10093, 10211, 10395, 10543, 10717, 10877, 11043, 11155, 11251, 11419, 11551, 11739, 11839, 12029, 12171, 12303, 12479, 12603, 12779, 12941, 13055, 13237, 13355, 13523, 13635, 13745, 13911, 14017, 14185, 14295, 14487, 14605, 14791, 14959, 15065, 15239, 15341, 15497, 15595, 15705, 15875, 16007, 16187, 16305, 16481, 16615, 16791, 16909, 17069, 17159, 17269, 17447, 17569, 17707, 17881, 18025, 18189, 18287, 18405, 18559, 18709, 18853, 18951, 19083, 19231, 19365, 19491, 19607]

/-- Endpoint of a source-aligned certificate window. -/
def cut (index : ℕ) : ℕ := entries[index]?.getD 0

/-- The first window starts at the first original certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel

/-- The final window reaches the end of the complete original certificate. -/
theorem last : cut 135 = 19607 := by decide +kernel

/-- All successive source-order windows are ordered and adjacent. -/
theorem ordered : ∀ index : Fin 135, cut index.val ≤ cut (index.val+1) := by decide +kernel

end MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateCertificateCuts
