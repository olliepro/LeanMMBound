module

public import DyadicRowMetadata
public import GibbsRowMetadata
public import SplitRowMetadata
public import FKLMeta.MetaExp

/-! Raw forms of the row-metadata functions `DyadicRowMetadata.expected`, `GibbsRowMetadata.expected` and
`SplitRowMetadata.expected`, for the slice checks of `SuppliedParameterChecks`. -/

@[expose] public section

namespace FKLMeta.ParamMeta

open MatrixBounds.Numeric FKLMeta.MetaExp

theorem dyExp_eq (i : ℕ) : dyExp i = DyadicRowMetadata.expected i := by
  simp only [dyExp, DyadicRowMetadata.expected, cond_blt, cond_beq]

theorem giExp_eq (i : ℕ) : giExp i = GibbsRowMetadata.expected i := by
  simp only [giExp, GibbsRowMetadata.expected, cond_blt]

theorem spExp_eq (i : ℕ) : spExp i = SplitRowMetadata.expected i := by
  simp only [spExp, SplitRowMetadata.expected, cond_blt]

theorem all_of (f g : ℕ → ℕ) (hfg : ∀ i, f i = g i) (l : List ℕ) (K : ℕ)
    (h : l.all (fun i => Nat.beq (f i) K) = true) : l.all (fun i => decide (g i = K)) = true := by
  simp only [List.all_eq_true, Nat.beq_eq, decide_eq_true_eq] at h ⊢
  intro i hi; rw [← hfg]; exact h i hi

theorem dy_all (l : List ℕ) (K : ℕ) (h : l.all (fun i => Nat.beq (dyExp i) K) = true) :
    l.all (fun i => decide (DyadicRowMetadata.expected i = K)) = true := all_of _ _ dyExp_eq l K h

theorem gi_all (l : List ℕ) (K : ℕ) (h : l.all (fun i => Nat.beq (giExp i) K) = true) :
    l.all (fun i => decide (GibbsRowMetadata.expected i = K)) = true := all_of _ _ giExp_eq l K h

theorem sp_all (l : List ℕ) (K : ℕ) (h : l.all (fun i => Nat.beq (spExp i) K) = true) :
    l.all (fun i => decide (SplitRowMetadata.expected i = K)) = true := all_of _ _ spExp_eq l K h

/-- Raw `List.all`. -/
def allL (f : ℕ → Bool) (l : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun a _ acc => Bool.and (f a) acc) l

theorem allL_eq (f : ℕ → Bool) : ∀ l : List ℕ, allL f l = l.all f := by
  intro l
  induction l with
  | nil => rfl
  | cons a l ih => change Bool.and (f a) (allL f l) = _; rw [ih]; rfl

theorem dy_leaf (l : List ℕ) (K : ℕ) (h : allL (fun i => Nat.beq (dyExp i) K) l = true) :
    l.all (fun i => decide (DyadicRowMetadata.expected i = K)) = true := dy_all l K (by rw [← allL_eq]; exact h)

theorem gi_leaf (l : List ℕ) (K : ℕ) (h : allL (fun i => Nat.beq (giExp i) K) l = true) :
    l.all (fun i => decide (GibbsRowMetadata.expected i = K)) = true := gi_all l K (by rw [← allL_eq]; exact h)

theorem sp_leaf (l : List ℕ) (K : ℕ) (h : allL (fun i => Nat.beq (spExp i) K) l = true) :
    l.all (fun i => decide (SplitRowMetadata.expected i = K)) = true := sp_all l K (by rw [← allL_eq]; exact h)

end FKLMeta.ParamMeta
