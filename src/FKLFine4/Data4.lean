module

public import FKLFine4.Boundary4
public import FKLFine4.Weight4
public import FKLHier4.Tables

/-! The concrete fast data of the level-four paired-fine checks: parent and child numerators are lanes of
the verified level-four hierarchy tables; pools are SWAR-packed (lanes of 232 bits). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL FKLHier4 FKLFine3 Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators
set_option exponentiation.threshold 1000

/-- Packed pooled numerators of one sector. -/
noncomputable def poolV4 (p ph r a sec : ℕ) : ℕ :=
  sumN 45 (fun c => Nat.mul (cond (inSec4 r a sec c) (Nat.mul 2 (fW4 p c)) 0)
    (packN 232 21 (fun o => childT p c ph o)))

/-- Pool numerator read from the packed sector vector. -/
noncomputable def fPool4 (p ph r a sec o : ℕ) : ℕ := lane (poolV4 p ph r a sec) 232 o

theorem fPool4_eq (p : Fin 105) (ph : ℕ) (hph : ph < 3) (r a sec o : ℕ) (ho : o < 21) :
    fPool4 p ph r a sec o = poolN 45 (fW4 p) (fun c o => childT p c ph o) (inSec4 r a) sec o := by
  unfold fPool4 poolV4 poolN
  have hk : ∀ c, Nat.mul (cond (inSec4 r a sec c) (Nat.mul 2 (fW4 p c)) 0) (packN 232 21 (fun o => childT p c ph o)) =
      (cond (inSec4 r a sec c) (2 * fW4 p c) 0) * packN 232 21 (fun o => childT p c ph o) := by
    intro c; cases inSec4 r a sec c <;> rfl
  simp only [hk, sumN_eq]
  rw [sum_packN, lane_packN]
  · apply Finset.sum_congr rfl; intro c _
    cases inSec4 r a sec c <;> simp [raw_mul, Nat.mul_assoc]
  · intro o' ho'
    calc (∑ c ∈ Finset.range 45, cond (inSec4 r a sec c) (2 * fW4 p c) 0 * childT p c ph o')
        ≤ ∑ c ∈ Finset.range 45, (2 * 17592186044416) * 2 ^ 180 := by
          apply Finset.sum_le_sum; intro c hc
          have hc' := Finset.mem_range.mp hc
          have hw : fW4 p c ≤ 17592186044416 := fW4_le p ⟨c, hc'⟩
          have hl : childT p c ph o' ≤ 2 ^ 180 := le_of_lt (childT_lt p c ph o' hc' hph ho')
          apply Nat.mul_le_mul _ hl
          cases inSec4 r a sec c <;> simp <;> omega
      _ < 2 ^ 232 := by norm_num
  · exact ho

/-- Fast level-four data read from the verified tables. -/
noncomputable def data4 : Data4 where
  par := par4T
  w := fW4
  m := fun p ph c o => childT p c ph o
  cr := fCr4
  phys := phys
  iso := iso4
  inSec := inSec4
  pool := fPool4
  sz4 := FKLHier4.sz4
  sz3 := FKLFine3.sz3

theorem data4_valid : data4.Valid where
  phys := phys_eq
  par := fun p ph o => par4T_int p ph o
  w := fW4_eq
  m := fun p ph c o => childT_num p c ph o
  cr := fCr4_eq
  iso := fun r a c => iso4_eq r a c
  inSec := fun r a sec c => inSec4_eq r a sec c
  pool := fun p r a sec _ o ho => by
    have hp : phys r a < 3 := by rw [phys_eq r a]; exact Fin.isLt _
    exact fPool4_eq p (phys r a) hp r a sec o ho
  sz4 := FKLHier4.sz4_eq
  sz3 := FKLFine3.sz3_eq

end MatrixBounds.Numeric.FKLFine4
