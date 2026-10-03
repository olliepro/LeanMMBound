module

public import FKLFine3.Boundary
public import FKLFine3.Pack3
public import FKLFine3.Weight3
public import FKLHier3.LeafAll
public import FKLHier3.ParAll

/-! The concrete fast data of the level-three paired-fine checks: leaf and parent numerators are lanes of
the verified per-node tables. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL FKLHier3 Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- Packed pooled numerators of one sector, reading the leaf table. -/
noncomputable def poolVT (n s p r a sec : ℕ) : ℕ :=
  sumN 15 (fun c => Nat.mul (cond (inSec r a sec c) (Nat.mul 2 (fW n s c)) 0)
    (packN 96 6 (fun o => leafT n s c p o)))

noncomputable def fPoolT (n s p r a sec o : ℕ) : ℕ := lane (poolVT n s p r a sec) 96 o

theorem poolVT_eq (n : Fin 945) (s : Fin 6) (p : Fin 3) (r a sec : ℕ) :
    poolVT n s p r a sec = poolV n s p r a sec := by
  unfold poolVT poolV leafVec
  simp only [sumN_eq]
  apply Finset.sum_congr rfl; intro c hc
  have hc' := Finset.mem_range.mp hc
  have hv : packN 96 6 (fun o => leafT n s c p o) = packN 96 6 (fun o => fLeaf n s c p o) := by
    simp only [packN_eq]; apply Finset.sum_congr rfl; intro o ho
    rw [leafT_eq n (leaf_all n n.isLt) s ⟨c, hc'⟩ p ⟨o, Finset.mem_range.mp ho⟩]
  rw [hv]

theorem fPoolT_eq (n : Fin 945) (s : Fin 6) (p : Fin 3) (r a sec o : ℕ) :
    fPoolT n s p r a sec o = fPool n s p r a sec o := by
  unfold fPoolT fPool
  rw [poolVT_eq]

/-- Fast level-three data read from the verified tables. -/
noncomputable def data : Data where
  par := parT
  w := fW
  m := fun n s p c o => leafT n s c p o
  cr := fCr
  phys := phys
  iso := iso
  inSec := inSec
  pool := fPoolT
  sz3 := sz3
  sz2 := sz2

theorem data_valid : data.Valid where
  phys := phys_eq
  par := fun n s p o => by
    show ((parT n s p o : ℕ) : ℤ) = _
    rw [parT_eq n (leaf_all n n.isLt) (par_all n n.isLt)]; exact fPar_eq n s p o
  w := fW_eq
  m := fun n s p c o => by
    show ((leafT n s c p o : ℕ) : ℤ) = _
    rw [leafT_eq n (leaf_all n n.isLt)]; exact fLeaf_eq n s c p o
  cr := fCr_eq
  iso := fun r a c => iso_eq r a c
  inSec := fun r a sec c => inSec_eq r a sec c
  pool := fun n s r a sec _ o ho => by
    have hp : phys r a < 3 := by rw [phys_eq r a]; exact Fin.isLt _
    show fPoolT n s (phys r a) r a sec o = poolN 15 (fW n s) (fun c o => leafT n s c (phys r a) o) (inSec r a) sec o
    rw [fPoolT_eq n s ⟨phys r a, hp⟩, fPool_eq n s ⟨phys r a, hp⟩ r a sec o ho]
    unfold poolN
    simp only [sumN_eq]
    apply Finset.sum_congr rfl; intro c hc
    rw [leafT_eq n (leaf_all n n.isLt) s ⟨c, Finset.mem_range.mp hc⟩ ⟨phys r a, hp⟩ ⟨o, ho⟩]
  sz3 := sz3_eq
  sz2 := sz2_eq

end MatrixBounds.Numeric.FKLFine3
