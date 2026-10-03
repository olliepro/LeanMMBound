module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch070 (j : ℕ) (hc : j < 64) (h : 4480 + j < 5542) :
    (IndexedCertificateRows.split ⟨4480 + j, h⟩).val = SplitCertificateData.Part070.rows[j]'(by rw [len070]; exact hc) := by
  have p : 4480 + j - 4096 < 1446 := Rows.sub_lt_of_part 4480 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4480 + j) h _ rfl
  have e := sel_splitGroup2 (4480 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4480 j 2048 (by decide))).2 (Rows.not_lt_of_part 4480 j 4096 (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 4480 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 384 (by decide))).1 (Rows.lt_sub_of_part 4480 j 64 4096 448 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4480 j 4096 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link070 : ∀ j < 64, Good (4480 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part070.rows.length := by rw [len070]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4480 + j, h⟩).property
  rw [dispatch070 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound070.2 j hj')

theorem dispatch071 (j : ℕ) (hc : j < 64) (h : 4544 + j < 5542) :
    (IndexedCertificateRows.split ⟨4544 + j, h⟩).val = SplitCertificateData.Part071.rows[j]'(by rw [len071]; exact hc) := by
  have p : 4544 + j - 4096 < 1446 := Rows.sub_lt_of_part 4544 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4544 + j) h _ rfl
  have e := sel_splitGroup2 (4544 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4544 j 2048 (by decide))).2 (Rows.not_lt_of_part 4544 j 4096 (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 4544 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4544 j 4096 448 (by decide))).1 (Rows.lt_sub_of_part 4544 j 64 4096 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4544 j 4096 448 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link071 : ∀ j < 64, Good (4544 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part071.rows.length := by rw [len071]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4544 + j, h⟩).property
  rw [dispatch071 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound071.2 j hj')

theorem dispatch072 (j : ℕ) (hc : j < 64) (h : 4608 + j < 5542) :
    (IndexedCertificateRows.split ⟨4608 + j, h⟩).val = SplitCertificateData.Part072.rows[j]'(by rw [len072]; exact hc) := by
  have p : 4608 + j - 4096 < 1446 := Rows.sub_lt_of_part 4608 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4608 + j) h _ rfl
  have e := sel_splitGroup2 (4608 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4608 j 2048 (by decide))).2 (Rows.not_lt_of_part 4608 j 4096 (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 4608 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 512 (by decide))).1 (Rows.lt_sub_of_part 4608 j 64 4096 576 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4608 j 4096 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link072 : ∀ j < 64, Good (4608 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part072.rows.length := by rw [len072]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4608 + j, h⟩).property
  rw [dispatch072 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound072.2 j hj')

theorem dispatch073 (j : ℕ) (hc : j < 64) (h : 4672 + j < 5542) :
    (IndexedCertificateRows.split ⟨4672 + j, h⟩).val = SplitCertificateData.Part073.rows[j]'(by rw [len073]; exact hc) := by
  have p : 4672 + j - 4096 < 1446 := Rows.sub_lt_of_part 4672 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4672 + j) h _ rfl
  have e := sel_splitGroup2 (4672 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4672 j 2048 (by decide))).2 (Rows.not_lt_of_part 4672 j 4096 (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 4672 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4672 j 4096 576 (by decide))).1 (Rows.lt_sub_of_part 4672 j 64 4096 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4672 j 4096 576 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link073 : ∀ j < 64, Good (4672 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part073.rows.length := by rw [len073]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4672 + j, h⟩).property
  rw [dispatch073 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound073.2 j hj')

theorem dispatch074 (j : ℕ) (hc : j < 64) (h : 4736 + j < 5542) :
    (IndexedCertificateRows.split ⟨4736 + j, h⟩).val = SplitCertificateData.Part074.rows[j]'(by rw [len074]; exact hc) := by
  have p : 4736 + j - 4096 < 1446 := Rows.sub_lt_of_part 4736 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4736 + j) h _ rfl
  have e := sel_splitGroup2 (4736 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4736 j 2048 (by decide))).2 (Rows.not_lt_of_part 4736 j 4096 (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 4736 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 640 (by decide))).1 (Rows.lt_sub_of_part 4736 j 64 4096 704 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4736 j 4096 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link074 : ∀ j < 64, Good (4736 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part074.rows.length := by rw [len074]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4736 + j, h⟩).property
  rw [dispatch074 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound074.2 j hj')

theorem dispatch075 (j : ℕ) (hc : j < 64) (h : 4800 + j < 5542) :
    (IndexedCertificateRows.split ⟨4800 + j, h⟩).val = SplitCertificateData.Part075.rows[j]'(by rw [len075]; exact hc) := by
  have p : 4800 + j - 4096 < 1446 := Rows.sub_lt_of_part 4800 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4800 + j) h _ rfl
  have e := sel_splitGroup2 (4800 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4800 j 2048 (by decide))).2 (Rows.not_lt_of_part 4800 j 4096 (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 4800 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4800 j 4096 704 (by decide))).1 (Rows.lt_sub_of_part 4800 j 64 4096 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4800 j 4096 704 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link075 : ∀ j < 64, Good (4800 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part075.rows.length := by rw [len075]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4800 + j, h⟩).property
  rw [dispatch075 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound075.2 j hj')

theorem dispatch076 (j : ℕ) (hc : j < 64) (h : 4864 + j < 5542) :
    (IndexedCertificateRows.split ⟨4864 + j, h⟩).val = SplitCertificateData.Part076.rows[j]'(by rw [len076]; exact hc) := by
  have p : 4864 + j - 4096 < 1446 := Rows.sub_lt_of_part 4864 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4864 + j) h _ rfl
  have e := sel_splitGroup2 (4864 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4864 j 2048 (by decide))).2 (Rows.not_lt_of_part 4864 j 4096 (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 4864 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 768 (by decide))).1 (Rows.lt_sub_of_part 4864 j 64 4096 832 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4864 j 4096 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link076 : ∀ j < 64, Good (4864 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part076.rows.length := by rw [len076]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4864 + j, h⟩).property
  rw [dispatch076 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound076.2 j hj')

theorem dispatch077 (j : ℕ) (hc : j < 64) (h : 4928 + j < 5542) :
    (IndexedCertificateRows.split ⟨4928 + j, h⟩).val = SplitCertificateData.Part077.rows[j]'(by rw [len077]; exact hc) := by
  have p : 4928 + j - 4096 < 1446 := Rows.sub_lt_of_part 4928 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4928 + j) h _ rfl
  have e := sel_splitGroup2 (4928 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4928 j 2048 (by decide))).2 (Rows.not_lt_of_part 4928 j 4096 (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 4928 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 4928 j 4096 832 (by decide))).1 (Rows.lt_sub_of_part 4928 j 64 4096 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4928 j 4096 832 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link077 : ∀ j < 64, Good (4928 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part077.rows.length := by rw [len077]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4928 + j, h⟩).property
  rw [dispatch077 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound077.2 j hj')

theorem dispatch078 (j : ℕ) (hc : j < 64) (h : 4992 + j < 5542) :
    (IndexedCertificateRows.split ⟨4992 + j, h⟩).val = SplitCertificateData.Part078.rows[j]'(by rw [len078]; exact hc) := by
  have p : 4992 + j - 4096 < 1446 := Rows.sub_lt_of_part 4992 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (4992 + j) h _ rfl
  have e := sel_splitGroup2 (4992 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4992 j 2048 (by decide))).2 (Rows.not_lt_of_part 4992 j 4096 (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 4992 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 896 (by decide))).1 (Rows.lt_sub_of_part 4992 j 64 4096 960 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4992 j 4096 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link078 : ∀ j < 64, Good (4992 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part078.rows.length := by rw [len078]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨4992 + j, h⟩).property
  rw [dispatch078 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound078.2 j hj')

theorem dispatch079 (j : ℕ) (hc : j < 64) (h : 5056 + j < 5542) :
    (IndexedCertificateRows.split ⟨5056 + j, h⟩).val = SplitCertificateData.Part079.rows[j]'(by rw [len079]; exact hc) := by
  have p : 5056 + j - 4096 < 1446 := Rows.sub_lt_of_part 5056 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5056 + j) h _ rfl
  have e := sel_splitGroup2 (5056 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5056 j 2048 (by decide))).2 (Rows.not_lt_of_part 5056 j 4096 (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5056 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5056 j 4096 960 (by decide))).1 (Rows.lt_sub_of_part 5056 j 64 4096 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5056 j 4096 960 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link079 : ∀ j < 64, Good (5056 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part079.rows.length := by rw [len079]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5056 + j, h⟩).property
  rw [dispatch079 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound079.2 j hj')


end FKLBridge.Split
