module

public import FKLHier3.LeafCheck00
public import FKLHier3.LeafCheck01
public import FKLHier3.LeafCheck02
public import FKLHier3.LeafCheck03
public import FKLHier3.LeafCheck04
public import FKLHier3.LeafCheck05
public import FKLHier3.LeafCheck06
public import FKLHier3.LeafCheck07
public import FKLHier3.LeafCheck08
public import FKLHier3.LeafCheck09

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

theorem leaf_all (n : ℕ) (hn : n < 945) : LeafOK n := by
  have : n < 95 ∨ (95 ≤ n ∧ n < 190) ∨ (190 ≤ n ∧ n < 285) ∨ (285 ≤ n ∧ n < 380) ∨ (380 ≤ n ∧ n < 475) ∨
      (475 ≤ n ∧ n < 570) ∨ (570 ≤ n ∧ n < 665) ∨ (665 ≤ n ∧ n < 760) ∨ (760 ≤ n ∧ n < 855) ∨ (855 ≤ n ∧ n < 945) := by omega
  rcases this with h | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩ | ⟨h1, h⟩
  · have := leafOK00 (n - 0) (by omega)
    rwa [show 0 + (n - 0) = n by omega] at this
  · have := leafOK01 (n - 95) (by omega)
    rwa [show 95 + (n - 95) = n by omega] at this
  · have := leafOK02 (n - 190) (by omega)
    rwa [show 190 + (n - 190) = n by omega] at this
  · have := leafOK03 (n - 285) (by omega)
    rwa [show 285 + (n - 285) = n by omega] at this
  · have := leafOK04 (n - 380) (by omega)
    rwa [show 380 + (n - 380) = n by omega] at this
  · have := leafOK05 (n - 475) (by omega)
    rwa [show 475 + (n - 475) = n by omega] at this
  · have := leafOK06 (n - 570) (by omega)
    rwa [show 570 + (n - 570) = n by omega] at this
  · have := leafOK07 (n - 665) (by omega)
    rwa [show 665 + (n - 665) = n by omega] at this
  · have := leafOK08 (n - 760) (by omega)
    rwa [show 760 + (n - 760) = n by omega] at this
  · have := leafOK09 (n - 855) (by omega)
    rwa [show 855 + (n - 855) = n by omega] at this

end MatrixBounds.Numeric.FKLHier3
