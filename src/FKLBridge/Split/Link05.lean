module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch050 (j : ℕ) (hc : j < 64) (h : 3200 + j < 5542) :
    (IndexedCertificateRows.split ⟨3200 + j, h⟩).val = SplitCertificateData.Part050.rows[j]'(by rw [len050]; exact hc) := by
  have p : 3200 + j - 2048 < 2048 := Rows.sub_lt_of_part 3200 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3200 + j) h _ rfl
  have e := sel_splitGroup1 (3200 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3200 j 2048 (by decide))).1 (Rows.lt_of_part 3200 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3200 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 2048 1152 (by decide))).1 (Rows.lt_sub_of_part 3200 j 64 2048 1216 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3200 j 2048 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link050 : ∀ j < 64, Good (3200 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part050.rows.length := by rw [len050]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3200 + j, h⟩).property
  rw [dispatch050 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound050.2 j hj')

theorem dispatch051 (j : ℕ) (hc : j < 64) (h : 3264 + j < 5542) :
    (IndexedCertificateRows.split ⟨3264 + j, h⟩).val = SplitCertificateData.Part051.rows[j]'(by rw [len051]; exact hc) := by
  have p : 3264 + j - 2048 < 2048 := Rows.sub_lt_of_part 3264 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3264 + j) h _ rfl
  have e := sel_splitGroup1 (3264 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3264 j 2048 (by decide))).1 (Rows.lt_of_part 3264 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3264 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3264 j 2048 1216 (by decide))).1 (Rows.lt_sub_of_part 3264 j 64 2048 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3264 j 2048 1216 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link051 : ∀ j < 64, Good (3264 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part051.rows.length := by rw [len051]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3264 + j, h⟩).property
  rw [dispatch051 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound051.2 j hj')

theorem dispatch052 (j : ℕ) (hc : j < 64) (h : 3328 + j < 5542) :
    (IndexedCertificateRows.split ⟨3328 + j, h⟩).val = SplitCertificateData.Part052.rows[j]'(by rw [len052]; exact hc) := by
  have p : 3328 + j - 2048 < 2048 := Rows.sub_lt_of_part 3328 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3328 + j) h _ rfl
  have e := sel_splitGroup1 (3328 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3328 j 2048 (by decide))).1 (Rows.lt_of_part 3328 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3328 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 2048 1280 (by decide))).1 (Rows.lt_sub_of_part 3328 j 64 2048 1344 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3328 j 2048 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link052 : ∀ j < 64, Good (3328 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part052.rows.length := by rw [len052]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3328 + j, h⟩).property
  rw [dispatch052 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound052.2 j hj')

theorem dispatch053 (j : ℕ) (hc : j < 64) (h : 3392 + j < 5542) :
    (IndexedCertificateRows.split ⟨3392 + j, h⟩).val = SplitCertificateData.Part053.rows[j]'(by rw [len053]; exact hc) := by
  have p : 3392 + j - 2048 < 2048 := Rows.sub_lt_of_part 3392 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3392 + j) h _ rfl
  have e := sel_splitGroup1 (3392 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3392 j 2048 (by decide))).1 (Rows.lt_of_part 3392 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3392 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3392 j 2048 1344 (by decide))).1 (Rows.lt_sub_of_part 3392 j 64 2048 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3392 j 2048 1344 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link053 : ∀ j < 64, Good (3392 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part053.rows.length := by rw [len053]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3392 + j, h⟩).property
  rw [dispatch053 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound053.2 j hj')

theorem dispatch054 (j : ℕ) (hc : j < 64) (h : 3456 + j < 5542) :
    (IndexedCertificateRows.split ⟨3456 + j, h⟩).val = SplitCertificateData.Part054.rows[j]'(by rw [len054]; exact hc) := by
  have p : 3456 + j - 2048 < 2048 := Rows.sub_lt_of_part 3456 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3456 + j) h _ rfl
  have e := sel_splitGroup1 (3456 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3456 j 2048 (by decide))).1 (Rows.lt_of_part 3456 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3456 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 2048 1408 (by decide))).1 (Rows.lt_sub_of_part 3456 j 64 2048 1472 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3456 j 2048 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link054 : ∀ j < 64, Good (3456 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part054.rows.length := by rw [len054]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3456 + j, h⟩).property
  rw [dispatch054 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound054.2 j hj')

theorem dispatch055 (j : ℕ) (hc : j < 64) (h : 3520 + j < 5542) :
    (IndexedCertificateRows.split ⟨3520 + j, h⟩).val = SplitCertificateData.Part055.rows[j]'(by rw [len055]; exact hc) := by
  have p : 3520 + j - 2048 < 2048 := Rows.sub_lt_of_part 3520 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3520 + j) h _ rfl
  have e := sel_splitGroup1 (3520 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3520 j 2048 (by decide))).1 (Rows.lt_of_part 3520 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3520 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3520 j 2048 1472 (by decide))).1 (Rows.lt_sub_of_part 3520 j 64 2048 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3520 j 2048 1472 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link055 : ∀ j < 64, Good (3520 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part055.rows.length := by rw [len055]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3520 + j, h⟩).property
  rw [dispatch055 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound055.2 j hj')

theorem dispatch056 (j : ℕ) (hc : j < 64) (h : 3584 + j < 5542) :
    (IndexedCertificateRows.split ⟨3584 + j, h⟩).val = SplitCertificateData.Part056.rows[j]'(by rw [len056]; exact hc) := by
  have p : 3584 + j - 2048 < 2048 := Rows.sub_lt_of_part 3584 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3584 + j) h _ rfl
  have e := sel_splitGroup1 (3584 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3584 j 2048 (by decide))).1 (Rows.lt_of_part 3584 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3584 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 2048 1536 (by decide))).1 (Rows.lt_sub_of_part 3584 j 64 2048 1600 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3584 j 2048 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link056 : ∀ j < 64, Good (3584 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part056.rows.length := by rw [len056]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3584 + j, h⟩).property
  rw [dispatch056 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound056.2 j hj')

theorem dispatch057 (j : ℕ) (hc : j < 64) (h : 3648 + j < 5542) :
    (IndexedCertificateRows.split ⟨3648 + j, h⟩).val = SplitCertificateData.Part057.rows[j]'(by rw [len057]; exact hc) := by
  have p : 3648 + j - 2048 < 2048 := Rows.sub_lt_of_part 3648 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3648 + j) h _ rfl
  have e := sel_splitGroup1 (3648 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3648 j 2048 (by decide))).1 (Rows.lt_of_part 3648 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3648 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3648 j 2048 1600 (by decide))).1 (Rows.lt_sub_of_part 3648 j 64 2048 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3648 j 2048 1600 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link057 : ∀ j < 64, Good (3648 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part057.rows.length := by rw [len057]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3648 + j, h⟩).property
  rw [dispatch057 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound057.2 j hj')

theorem dispatch058 (j : ℕ) (hc : j < 64) (h : 3712 + j < 5542) :
    (IndexedCertificateRows.split ⟨3712 + j, h⟩).val = SplitCertificateData.Part058.rows[j]'(by rw [len058]; exact hc) := by
  have p : 3712 + j - 2048 < 2048 := Rows.sub_lt_of_part 3712 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3712 + j) h _ rfl
  have e := sel_splitGroup1 (3712 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3712 j 2048 (by decide))).1 (Rows.lt_of_part 3712 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3712 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 2048 1664 (by decide))).1 (Rows.lt_sub_of_part 3712 j 64 2048 1728 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3712 j 2048 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link058 : ∀ j < 64, Good (3712 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part058.rows.length := by rw [len058]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3712 + j, h⟩).property
  rw [dispatch058 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound058.2 j hj')

theorem dispatch059 (j : ℕ) (hc : j < 64) (h : 3776 + j < 5542) :
    (IndexedCertificateRows.split ⟨3776 + j, h⟩).val = SplitCertificateData.Part059.rows[j]'(by rw [len059]; exact hc) := by
  have p : 3776 + j - 2048 < 2048 := Rows.sub_lt_of_part 3776 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3776 + j) h _ rfl
  have e := sel_splitGroup1 (3776 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3776 j 2048 (by decide))).1 (Rows.lt_of_part 3776 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3776 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3776 j 2048 1728 (by decide))).1 (Rows.lt_sub_of_part 3776 j 64 2048 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3776 j 2048 1728 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link059 : ∀ j < 64, Good (3776 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part059.rows.length := by rw [len059]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3776 + j, h⟩).property
  rw [dispatch059 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound059.2 j hj')


end FKLBridge.Split
