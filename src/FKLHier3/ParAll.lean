module

public import FKLHier3.ParCheck00
public import FKLHier3.ParCheck01
public import FKLHier3.ParCheck02
public import FKLHier3.ParCheck03
public import FKLHier3.ParCheck04
public import FKLHier3.ParCheck05
public import FKLHier3.ParCheck06
public import FKLHier3.ParCheck07
public import FKLHier3.ParCheck08
public import FKLHier3.ParCheck09

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

theorem par_all (n : ℕ) (hn : n < 945) : ParOK n := by
  have : n < 95 ∨ (95 ≤ n ∧ n < 190) ∨ (190 ≤ n ∧ n < 285) ∨ (285 ≤ n ∧ n < 380) ∨ (380 ≤ n ∧ n < 475) ∨
      (475 ≤ n ∧ n < 570) ∨ (570 ≤ n ∧ n < 665) ∨ (665 ≤ n ∧ n < 760) ∨ (760 ≤ n ∧ n < 855) ∨ (855 ≤ n ∧ n < 945) := by omega
  rcases this with h | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩
  · have := parOK00 (n - 0) (by omega)
    rwa [show 0 + (n - 0) = n by omega] at this
  · have := parOK01 (n - 95) (by omega)
    rwa [show 95 + (n - 95) = n by omega] at this
  · have := parOK02 (n - 190) (by omega)
    rwa [show 190 + (n - 190) = n by omega] at this
  · have := parOK03 (n - 285) (by omega)
    rwa [show 285 + (n - 285) = n by omega] at this
  · have := parOK04 (n - 380) (by omega)
    rwa [show 380 + (n - 380) = n by omega] at this
  · have := parOK05 (n - 475) (by omega)
    rwa [show 475 + (n - 475) = n by omega] at this
  · have := parOK06 (n - 570) (by omega)
    rwa [show 570 + (n - 570) = n by omega] at this
  · have := parOK07 (n - 665) (by omega)
    rwa [show 665 + (n - 665) = n by omega] at this
  · have := parOK08 (n - 760) (by omega)
    rwa [show 760 + (n - 760) = n by omega] at this
  · have := parOK09 (n - 855) (by omega)
    rwa [show 855 + (n - 855) = n by omega] at this

end MatrixBounds.Numeric.FKLHier3
