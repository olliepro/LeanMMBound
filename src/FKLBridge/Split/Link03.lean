module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch030 (j : ℕ) (hc : j < 64) (h : 1920 + j < 5542) :
    (IndexedCertificateRows.split ⟨1920 + j, h⟩).val = SplitCertificateData.Part030.rows[j]'(by rw [len030]; exact hc) := by
  have p : 1920 + j - 0 < 2048 := Rows.sub_lt_of_part 1920 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1920 + j) h _ rfl
  have e := sel_splitGroup0 (1920 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1920 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1920 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1728 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1856 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1920 (by decide))).1 (Rows.lt_sub_of_part 1920 j 64 0 1984 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1920 j 0 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link030 : ∀ j < 64, Good (1920 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part030.rows.length := by rw [len030]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1920 + j, h⟩).property
  rw [dispatch030 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound030.2 j hj')

theorem dispatch031 (j : ℕ) (hc : j < 64) (h : 1984 + j < 5542) :
    (IndexedCertificateRows.split ⟨1984 + j, h⟩).val = SplitCertificateData.Part031.rows[j]'(by rw [len031]; exact hc) := by
  have p : 1984 + j - 0 < 2048 := Rows.sub_lt_of_part 1984 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1984 + j) h _ rfl
  have e := sel_splitGroup0 (1984 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1984 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1984 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1728 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1856 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 1984 j 0 1984 (by decide)))
  rw [Rows.sub_sub_part 1984 j 0 1984 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link031 : ∀ j < 64, Good (1984 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part031.rows.length := by rw [len031]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1984 + j, h⟩).property
  rw [dispatch031 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound031.2 j hj')

theorem dispatch032 (j : ℕ) (hc : j < 64) (h : 2048 + j < 5542) :
    (IndexedCertificateRows.split ⟨2048 + j, h⟩).val = SplitCertificateData.Part032.rows[j]'(by rw [len032]; exact hc) := by
  have p : 2048 + j - 2048 < 2048 := Rows.sub_lt_of_part 2048 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2048 + j) h _ rfl
  have e := sel_splitGroup1 (2048 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2048 j 2048 (by decide))).1 (Rows.lt_of_part 2048 j 64 4096 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 2048 j 64 2048 64 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2048 j 2048 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link032 : ∀ j < 64, Good (2048 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part032.rows.length := by rw [len032]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2048 + j, h⟩).property
  rw [dispatch032 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound032.2 j hj')

theorem dispatch033 (j : ℕ) (hc : j < 64) (h : 2112 + j < 5542) :
    (IndexedCertificateRows.split ⟨2112 + j, h⟩).val = SplitCertificateData.Part033.rows[j]'(by rw [len033]; exact hc) := by
  have p : 2112 + j - 2048 < 2048 := Rows.sub_lt_of_part 2112 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2112 + j) h _ rfl
  have e := sel_splitGroup1 (2112 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2112 j 2048 (by decide))).1 (Rows.lt_of_part 2112 j 64 4096 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 2112 j 2048 64 (by decide))).1 (Rows.lt_sub_of_part 2112 j 64 2048 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2112 j 2048 64 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link033 : ∀ j < 64, Good (2112 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part033.rows.length := by rw [len033]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2112 + j, h⟩).property
  rw [dispatch033 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound033.2 j hj')

theorem dispatch034 (j : ℕ) (hc : j < 64) (h : 2176 + j < 5542) :
    (IndexedCertificateRows.split ⟨2176 + j, h⟩).val = SplitCertificateData.Part034.rows[j]'(by rw [len034]; exact hc) := by
  have p : 2176 + j - 2048 < 2048 := Rows.sub_lt_of_part 2176 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2176 + j) h _ rfl
  have e := sel_splitGroup1 (2176 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2176 j 2048 (by decide))).1 (Rows.lt_of_part 2176 j 64 4096 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 2176 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 2048 128 (by decide))).1 (Rows.lt_sub_of_part 2176 j 64 2048 192 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2176 j 2048 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link034 : ∀ j < 64, Good (2176 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part034.rows.length := by rw [len034]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2176 + j, h⟩).property
  rw [dispatch034 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound034.2 j hj')

theorem dispatch035 (j : ℕ) (hc : j < 64) (h : 2240 + j < 5542) :
    (IndexedCertificateRows.split ⟨2240 + j, h⟩).val = SplitCertificateData.Part035.rows[j]'(by rw [len035]; exact hc) := by
  have p : 2240 + j - 2048 < 2048 := Rows.sub_lt_of_part 2240 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2240 + j) h _ rfl
  have e := sel_splitGroup1 (2240 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2240 j 2048 (by decide))).1 (Rows.lt_of_part 2240 j 64 4096 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 2240 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2240 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2240 j 2048 192 (by decide))).1 (Rows.lt_sub_of_part 2240 j 64 2048 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2240 j 2048 192 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link035 : ∀ j < 64, Good (2240 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part035.rows.length := by rw [len035]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2240 + j, h⟩).property
  rw [dispatch035 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound035.2 j hj')

theorem dispatch036 (j : ℕ) (hc : j < 64) (h : 2304 + j < 5542) :
    (IndexedCertificateRows.split ⟨2304 + j, h⟩).val = SplitCertificateData.Part036.rows[j]'(by rw [len036]; exact hc) := by
  have p : 2304 + j - 2048 < 2048 := Rows.sub_lt_of_part 2304 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2304 + j) h _ rfl
  have e := sel_splitGroup1 (2304 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2304 j 2048 (by decide))).1 (Rows.lt_of_part 2304 j 64 4096 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 2304 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 2048 256 (by decide))).1 (Rows.lt_sub_of_part 2304 j 64 2048 320 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2304 j 2048 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link036 : ∀ j < 64, Good (2304 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part036.rows.length := by rw [len036]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2304 + j, h⟩).property
  rw [dispatch036 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound036.2 j hj')

theorem dispatch037 (j : ℕ) (hc : j < 64) (h : 2368 + j < 5542) :
    (IndexedCertificateRows.split ⟨2368 + j, h⟩).val = SplitCertificateData.Part037.rows[j]'(by rw [len037]; exact hc) := by
  have p : 2368 + j - 2048 < 2048 := Rows.sub_lt_of_part 2368 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2368 + j) h _ rfl
  have e := sel_splitGroup1 (2368 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2368 j 2048 (by decide))).1 (Rows.lt_of_part 2368 j 64 4096 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 2368 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2368 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2368 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2368 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2368 j 2048 320 (by decide))).1 (Rows.lt_sub_of_part 2368 j 64 2048 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2368 j 2048 320 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link037 : ∀ j < 64, Good (2368 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part037.rows.length := by rw [len037]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2368 + j, h⟩).property
  rw [dispatch037 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound037.2 j hj')

theorem dispatch038 (j : ℕ) (hc : j < 64) (h : 2432 + j < 5542) :
    (IndexedCertificateRows.split ⟨2432 + j, h⟩).val = SplitCertificateData.Part038.rows[j]'(by rw [len038]; exact hc) := by
  have p : 2432 + j - 2048 < 2048 := Rows.sub_lt_of_part 2432 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2432 + j) h _ rfl
  have e := sel_splitGroup1 (2432 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2432 j 2048 (by decide))).1 (Rows.lt_of_part 2432 j 64 4096 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 2432 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 2048 384 (by decide))).1 (Rows.lt_sub_of_part 2432 j 64 2048 448 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2432 j 2048 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link038 : ∀ j < 64, Good (2432 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part038.rows.length := by rw [len038]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2432 + j, h⟩).property
  rw [dispatch038 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound038.2 j hj')

theorem dispatch039 (j : ℕ) (hc : j < 64) (h : 2496 + j < 5542) :
    (IndexedCertificateRows.split ⟨2496 + j, h⟩).val = SplitCertificateData.Part039.rows[j]'(by rw [len039]; exact hc) := by
  have p : 2496 + j - 2048 < 2048 := Rows.sub_lt_of_part 2496 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2496 + j) h _ rfl
  have e := sel_splitGroup1 (2496 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2496 j 2048 (by decide))).1 (Rows.lt_of_part 2496 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 2496 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2496 j 2048 448 (by decide))).1 (Rows.lt_sub_of_part 2496 j 64 2048 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2496 j 2048 448 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link039 : ∀ j < 64, Good (2496 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part039.rows.length := by rw [len039]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2496 + j, h⟩).property
  rw [dispatch039 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound039.2 j hj')


end FKLBridge.Split
