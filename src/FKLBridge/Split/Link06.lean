module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch060 (j : ℕ) (hc : j < 64) (h : 3840 + j < 5542) :
    (IndexedCertificateRows.split ⟨3840 + j, h⟩).val = SplitCertificateData.Part060.rows[j]'(by rw [len060]; exact hc) := by
  have p : 3840 + j - 2048 < 2048 := Rows.sub_lt_of_part 3840 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3840 + j) h _ rfl
  have e := sel_splitGroup1 (3840 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3840 j 2048 (by decide))).1 (Rows.lt_of_part 3840 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3840 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1728 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 2048 1792 (by decide))).1 (Rows.lt_sub_of_part 3840 j 64 2048 1856 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3840 j 2048 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link060 : ∀ j < 64, Good (3840 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part060.rows.length := by rw [len060]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3840 + j, h⟩).property
  rw [dispatch060 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound060.2 j hj')

theorem dispatch061 (j : ℕ) (hc : j < 64) (h : 3904 + j < 5542) :
    (IndexedCertificateRows.split ⟨3904 + j, h⟩).val = SplitCertificateData.Part061.rows[j]'(by rw [len061]; exact hc) := by
  have p : 3904 + j - 2048 < 2048 := Rows.sub_lt_of_part 3904 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3904 + j) h _ rfl
  have e := sel_splitGroup1 (3904 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3904 j 2048 (by decide))).1 (Rows.lt_of_part 3904 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3904 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1728 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3904 j 2048 1856 (by decide))).1 (Rows.lt_sub_of_part 3904 j 64 2048 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3904 j 2048 1856 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link061 : ∀ j < 64, Good (3904 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part061.rows.length := by rw [len061]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3904 + j, h⟩).property
  rw [dispatch061 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound061.2 j hj')

theorem dispatch062 (j : ℕ) (hc : j < 64) (h : 3968 + j < 5542) :
    (IndexedCertificateRows.split ⟨3968 + j, h⟩).val = SplitCertificateData.Part062.rows[j]'(by rw [len062]; exact hc) := by
  have p : 3968 + j - 2048 < 2048 := Rows.sub_lt_of_part 3968 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3968 + j) h _ rfl
  have e := sel_splitGroup1 (3968 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3968 j 2048 (by decide))).1 (Rows.lt_of_part 3968 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3968 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1728 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1856 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 2048 1920 (by decide))).1 (Rows.lt_sub_of_part 3968 j 64 2048 1984 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3968 j 2048 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link062 : ∀ j < 64, Good (3968 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part062.rows.length := by rw [len062]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3968 + j, h⟩).property
  rw [dispatch062 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound062.2 j hj')

theorem dispatch063 (j : ℕ) (hc : j < 64) (h : 4032 + j < 5542) :
    (IndexedCertificateRows.split ⟨4032 + j, h⟩).val = SplitCertificateData.Part063.rows[j]'(by rw [len063]; exact hc) := by
  have p : 4032 + j - 2048 < 2048 := Rows.sub_lt_of_part 4032 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (4032 + j) h _ rfl
  have e := sel_splitGroup1 (4032 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 4032 j 2048 (by decide))).1 (Rows.lt_of_part 4032 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 4032 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1088 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1152 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1216 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1280 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1344 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1408 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1472 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1536 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1600 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1664 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1728 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1792 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1856 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1920 (by decide))).2 (Rows.not_lt_sub_of_part 4032 j 2048 1984 (by decide)))
  rw [Rows.sub_sub_part 4032 j 2048 1984 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link063 : ∀ j < 64, Good (4032 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part063.rows.length := by rw [len063]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4032 + j, h⟩).property
  rw [dispatch063 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound063.2 j hj')

theorem dispatch064 (j : ℕ) (hc : j < 64) (h : 4096 + j < 5542) :
    (IndexedCertificateRows.split ⟨4096 + j, h⟩).val = SplitCertificateData.Part064.rows[j]'(by rw [len064]; exact hc) := by
  have p : 4096 + j - 4096 < 1446 := Rows.sub_lt_of_part 4096 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4096 + j) h _ rfl
  have e := sel_splitGroup2 (4096 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4096 j 2048 (by decide))).2 (Rows.not_lt_of_part 4096 j 4096 (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 4096 j 64 4096 64 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4096 j 4096 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link064 : ∀ j < 64, Good (4096 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part064.rows.length := by rw [len064]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4096 + j, h⟩).property
  rw [dispatch064 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound064.2 j hj')

theorem dispatch065 (j : ℕ) (hc : j < 64) (h : 4160 + j < 5542) :
    (IndexedCertificateRows.split ⟨4160 + j, h⟩).val = SplitCertificateData.Part065.rows[j]'(by rw [len065]; exact hc) := by
  have p : 4160 + j - 4096 < 1446 := Rows.sub_lt_of_part 4160 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4160 + j) h _ rfl
  have e := sel_splitGroup2 (4160 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4160 j 2048 (by decide))).2 (Rows.not_lt_of_part 4160 j 4096 (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 4160 j 4096 64 (by decide))).1 (Rows.lt_sub_of_part 4160 j 64 4096 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4160 j 4096 64 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link065 : ∀ j < 64, Good (4160 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part065.rows.length := by rw [len065]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4160 + j, h⟩).property
  rw [dispatch065 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound065.2 j hj')

theorem dispatch066 (j : ℕ) (hc : j < 64) (h : 4224 + j < 5542) :
    (IndexedCertificateRows.split ⟨4224 + j, h⟩).val = SplitCertificateData.Part066.rows[j]'(by rw [len066]; exact hc) := by
  have p : 4224 + j - 4096 < 1446 := Rows.sub_lt_of_part 4224 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4224 + j) h _ rfl
  have e := sel_splitGroup2 (4224 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4224 j 2048 (by decide))).2 (Rows.not_lt_of_part 4224 j 4096 (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 4224 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4224 j 4096 128 (by decide))).1 (Rows.lt_sub_of_part 4224 j 64 4096 192 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4224 j 4096 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link066 : ∀ j < 64, Good (4224 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part066.rows.length := by rw [len066]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4224 + j, h⟩).property
  rw [dispatch066 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound066.2 j hj')

theorem dispatch067 (j : ℕ) (hc : j < 64) (h : 4288 + j < 5542) :
    (IndexedCertificateRows.split ⟨4288 + j, h⟩).val = SplitCertificateData.Part067.rows[j]'(by rw [len067]; exact hc) := by
  have p : 4288 + j - 4096 < 1446 := Rows.sub_lt_of_part 4288 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4288 + j) h _ rfl
  have e := sel_splitGroup2 (4288 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4288 j 2048 (by decide))).2 (Rows.not_lt_of_part 4288 j 4096 (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 4288 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4288 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4288 j 4096 192 (by decide))).1 (Rows.lt_sub_of_part 4288 j 64 4096 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4288 j 4096 192 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link067 : ∀ j < 64, Good (4288 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part067.rows.length := by rw [len067]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4288 + j, h⟩).property
  rw [dispatch067 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound067.2 j hj')

theorem dispatch068 (j : ℕ) (hc : j < 64) (h : 4352 + j < 5542) :
    (IndexedCertificateRows.split ⟨4352 + j, h⟩).val = SplitCertificateData.Part068.rows[j]'(by rw [len068]; exact hc) := by
  have p : 4352 + j - 4096 < 1446 := Rows.sub_lt_of_part 4352 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4352 + j) h _ rfl
  have e := sel_splitGroup2 (4352 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4352 j 2048 (by decide))).2 (Rows.not_lt_of_part 4352 j 4096 (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 4352 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 4096 256 (by decide))).1 (Rows.lt_sub_of_part 4352 j 64 4096 320 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4352 j 4096 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link068 : ∀ j < 64, Good (4352 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part068.rows.length := by rw [len068]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4352 + j, h⟩).property
  rw [dispatch068 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound068.2 j hj')

theorem dispatch069 (j : ℕ) (hc : j < 64) (h : 4416 + j < 5542) :
    (IndexedCertificateRows.split ⟨4416 + j, h⟩).val = SplitCertificateData.Part069.rows[j]'(by rw [len069]; exact hc) := by
  have p : 4416 + j - 4096 < 1446 := Rows.sub_lt_of_part 4416 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4416 + j) h _ rfl
  have e := sel_splitGroup2 (4416 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4416 j 2048 (by decide))).2 (Rows.not_lt_of_part 4416 j 4096 (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 4416 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4416 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4416 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4416 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4416 j 4096 320 (by decide))).1 (Rows.lt_sub_of_part 4416 j 64 4096 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4416 j 4096 320 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link069 : ∀ j < 64, Good (4416 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part069.rows.length := by rw [len069]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4416 + j, h⟩).property
  rw [dispatch069 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound069.2 j hj')


end FKLBridge.Split
