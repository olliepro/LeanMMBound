module

public import FKLHier4.ChildCheck00
public import FKLHier4.ChildCheck01
public import FKLHier4.ChildCheck02
public import FKLHier4.ChildCheck03
public import FKLHier4.ChildCheck04
public import FKLHier4.ChildCheck05
public import FKLHier4.ChildCheck06
public import FKLHier4.ChildCheck07
public import FKLHier4.ChildCheck08
public import FKLHier4.ChildCheck09
public import FKLHier4.ChildCheck10
public import FKLHier4.ChildCheck11
public import FKLHier4.ChildCheck12
public import FKLHier4.ChildCheck13
public import FKLHier4.ChildCheck14

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

theorem child_all (n : ℕ) (hn : n < 105) : ChildOK n := by
  have : (0 ≤ n ∧ n < 7) ∨ (7 ≤ n ∧ n < 14) ∨ (14 ≤ n ∧ n < 21) ∨ (21 ≤ n ∧ n < 28) ∨ (28 ≤ n ∧ n < 35) ∨ (35 ≤ n ∧ n < 42) ∨ (42 ≤ n ∧ n < 49) ∨ (49 ≤ n ∧ n < 56) ∨ (56 ≤ n ∧ n < 63) ∨ (63 ≤ n ∧ n < 70) ∨ (70 ≤ n ∧ n < 77) ∨ (77 ≤ n ∧ n < 84) ∨ (84 ≤ n ∧ n < 91) ∨ (91 ≤ n ∧ n < 98) ∨ (98 ≤ n ∧ n < 105) := by omega
  rcases this with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · have := childOK00 (n - 0) (by omega)
    rwa [show 0 + (n - 0) = n by omega] at this
  · have := childOK01 (n - 7) (by omega)
    rwa [show 7 + (n - 7) = n by omega] at this
  · have := childOK02 (n - 14) (by omega)
    rwa [show 14 + (n - 14) = n by omega] at this
  · have := childOK03 (n - 21) (by omega)
    rwa [show 21 + (n - 21) = n by omega] at this
  · have := childOK04 (n - 28) (by omega)
    rwa [show 28 + (n - 28) = n by omega] at this
  · have := childOK05 (n - 35) (by omega)
    rwa [show 35 + (n - 35) = n by omega] at this
  · have := childOK06 (n - 42) (by omega)
    rwa [show 42 + (n - 42) = n by omega] at this
  · have := childOK07 (n - 49) (by omega)
    rwa [show 49 + (n - 49) = n by omega] at this
  · have := childOK08 (n - 56) (by omega)
    rwa [show 56 + (n - 56) = n by omega] at this
  · have := childOK09 (n - 63) (by omega)
    rwa [show 63 + (n - 63) = n by omega] at this
  · have := childOK10 (n - 70) (by omega)
    rwa [show 70 + (n - 70) = n by omega] at this
  · have := childOK11 (n - 77) (by omega)
    rwa [show 77 + (n - 77) = n by omega] at this
  · have := childOK12 (n - 84) (by omega)
    rwa [show 84 + (n - 84) = n by omega] at this
  · have := childOK13 (n - 91) (by omega)
    rwa [show 91 + (n - 91) = n by omega] at this
  · have := childOK14 (n - 98) (by omega)
    rwa [show 98 + (n - 98) = n by omega] at this

end MatrixBounds.Numeric.FKLHier4
