module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch040 (j : ℕ) (hc : j < 64) (h : 2560 + j < 5542) :
    (IndexedCertificateRows.split ⟨2560 + j, h⟩).val = SplitCertificateData.Part040.rows[j]'(by rw [len040]; exact hc) := by
  have p : 2560 + j - 2048 < 2048 := Rows.sub_lt_of_part 2560 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2560 + j) h _ rfl
  have e := sel_splitGroup1 (2560 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2560 j 2048 (by decide))).1 (Rows.lt_of_part 2560 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 2560 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 2048 512 (by decide))).1 (Rows.lt_sub_of_part 2560 j 64 2048 576 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2560 j 2048 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link040 : ∀ j < 64, Good (2560 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part040.rows.length := by rw [len040]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2560 + j, h⟩).property
  rw [dispatch040 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound040.2 j hj')

theorem dispatch041 (j : ℕ) (hc : j < 64) (h : 2624 + j < 5542) :
    (IndexedCertificateRows.split ⟨2624 + j, h⟩).val = SplitCertificateData.Part041.rows[j]'(by rw [len041]; exact hc) := by
  have p : 2624 + j - 2048 < 2048 := Rows.sub_lt_of_part 2624 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2624 + j) h _ rfl
  have e := sel_splitGroup1 (2624 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2624 j 2048 (by decide))).1 (Rows.lt_of_part 2624 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 2624 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2624 j 2048 576 (by decide))).1 (Rows.lt_sub_of_part 2624 j 64 2048 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2624 j 2048 576 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link041 : ∀ j < 64, Good (2624 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part041.rows.length := by rw [len041]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2624 + j, h⟩).property
  rw [dispatch041 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound041.2 j hj')

theorem dispatch042 (j : ℕ) (hc : j < 64) (h : 2688 + j < 5542) :
    (IndexedCertificateRows.split ⟨2688 + j, h⟩).val = SplitCertificateData.Part042.rows[j]'(by rw [len042]; exact hc) := by
  have p : 2688 + j - 2048 < 2048 := Rows.sub_lt_of_part 2688 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2688 + j) h _ rfl
  have e := sel_splitGroup1 (2688 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2688 j 2048 (by decide))).1 (Rows.lt_of_part 2688 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 2688 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 2048 640 (by decide))).1 (Rows.lt_sub_of_part 2688 j 64 2048 704 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2688 j 2048 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link042 : ∀ j < 64, Good (2688 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part042.rows.length := by rw [len042]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2688 + j, h⟩).property
  rw [dispatch042 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound042.2 j hj')

theorem dispatch043 (j : ℕ) (hc : j < 64) (h : 2752 + j < 5542) :
    (IndexedCertificateRows.split ⟨2752 + j, h⟩).val = SplitCertificateData.Part043.rows[j]'(by rw [len043]; exact hc) := by
  have p : 2752 + j - 2048 < 2048 := Rows.sub_lt_of_part 2752 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2752 + j) h _ rfl
  have e := sel_splitGroup1 (2752 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2752 j 2048 (by decide))).1 (Rows.lt_of_part 2752 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 2752 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 2752 j 2048 704 (by decide))).1 (Rows.lt_sub_of_part 2752 j 64 2048 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2752 j 2048 704 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link043 : ∀ j < 64, Good (2752 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part043.rows.length := by rw [len043]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2752 + j, h⟩).property
  rw [dispatch043 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound043.2 j hj')

theorem dispatch044 (j : ℕ) (hc : j < 64) (h : 2816 + j < 5542) :
    (IndexedCertificateRows.split ⟨2816 + j, h⟩).val = SplitCertificateData.Part044.rows[j]'(by rw [len044]; exact hc) := by
  have p : 2816 + j - 2048 < 2048 := Rows.sub_lt_of_part 2816 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2816 + j) h _ rfl
  have e := sel_splitGroup1 (2816 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2816 j 2048 (by decide))).1 (Rows.lt_of_part 2816 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 2816 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 2048 768 (by decide))).1 (Rows.lt_sub_of_part 2816 j 64 2048 832 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2816 j 2048 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link044 : ∀ j < 64, Good (2816 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part044.rows.length := by rw [len044]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2816 + j, h⟩).property
  rw [dispatch044 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound044.2 j hj')

theorem dispatch045 (j : ℕ) (hc : j < 64) (h : 2880 + j < 5542) :
    (IndexedCertificateRows.split ⟨2880 + j, h⟩).val = SplitCertificateData.Part045.rows[j]'(by rw [len045]; exact hc) := by
  have p : 2880 + j - 2048 < 2048 := Rows.sub_lt_of_part 2880 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2880 + j) h _ rfl
  have e := sel_splitGroup1 (2880 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2880 j 2048 (by decide))).1 (Rows.lt_of_part 2880 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 2880 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 2880 j 2048 832 (by decide))).1 (Rows.lt_sub_of_part 2880 j 64 2048 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2880 j 2048 832 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link045 : ∀ j < 64, Good (2880 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part045.rows.length := by rw [len045]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2880 + j, h⟩).property
  rw [dispatch045 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound045.2 j hj')

theorem dispatch046 (j : ℕ) (hc : j < 64) (h : 2944 + j < 5542) :
    (IndexedCertificateRows.split ⟨2944 + j, h⟩).val = SplitCertificateData.Part046.rows[j]'(by rw [len046]; exact hc) := by
  have p : 2944 + j - 2048 < 2048 := Rows.sub_lt_of_part 2944 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (2944 + j) h _ rfl
  have e := sel_splitGroup1 (2944 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 2944 j 2048 (by decide))).1 (Rows.lt_of_part 2944 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 2944 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 2048 896 (by decide))).1 (Rows.lt_sub_of_part 2944 j 64 2048 960 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2944 j 2048 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link046 : ∀ j < 64, Good (2944 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part046.rows.length := by rw [len046]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨2944 + j, h⟩).property
  rw [dispatch046 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound046.2 j hj')

theorem dispatch047 (j : ℕ) (hc : j < 64) (h : 3008 + j < 5542) :
    (IndexedCertificateRows.split ⟨3008 + j, h⟩).val = SplitCertificateData.Part047.rows[j]'(by rw [len047]; exact hc) := by
  have p : 3008 + j - 2048 < 2048 := Rows.sub_lt_of_part 3008 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3008 + j) h _ rfl
  have e := sel_splitGroup1 (3008 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3008 j 2048 (by decide))).1 (Rows.lt_of_part 3008 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3008 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3008 j 2048 960 (by decide))).1 (Rows.lt_sub_of_part 3008 j 64 2048 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3008 j 2048 960 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link047 : ∀ j < 64, Good (3008 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part047.rows.length := by rw [len047]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3008 + j, h⟩).property
  rw [dispatch047 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound047.2 j hj')

theorem dispatch048 (j : ℕ) (hc : j < 64) (h : 3072 + j < 5542) :
    (IndexedCertificateRows.split ⟨3072 + j, h⟩).val = SplitCertificateData.Part048.rows[j]'(by rw [len048]; exact hc) := by
  have p : 3072 + j - 2048 < 2048 := Rows.sub_lt_of_part 3072 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3072 + j) h _ rfl
  have e := sel_splitGroup1 (3072 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3072 j 2048 (by decide))).1 (Rows.lt_of_part 3072 j 64 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3072 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 2048 1024 (by decide))).1 (Rows.lt_sub_of_part 3072 j 64 2048 1088 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3072 j 2048 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link048 : ∀ j < 64, Good (3072 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part048.rows.length := by rw [len048]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3072 + j, h⟩).property
  rw [dispatch048 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound048.2 j hj')

theorem dispatch049 (j : ℕ) (hc : j < 64) (h : 3136 + j < 5542) :
    (IndexedCertificateRows.split ⟨3136 + j, h⟩).val = SplitCertificateData.Part049.rows[j]'(by rw [len049]; exact hc) := by
  have p : 3136 + j - 2048 < 2048 := Rows.sub_lt_of_part 3136 j 64 2048 2048 hc (by decide) (by decide)
  have e0 := sel_top (3136 + j) h _ rfl
  have e := sel_splitGroup1 (3136 + j - 2048) p _ (((e0.2 (Rows.not_lt_of_part 3136 j 2048 (by decide))).1 (Rows.lt_of_part 3136 j 64 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3136 j 2048 64 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 128 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 192 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 256 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 320 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 384 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 448 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 512 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 576 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 640 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 704 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 768 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 832 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 896 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 960 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3136 j 2048 1088 (by decide))).1 (Rows.lt_sub_of_part 3136 j 64 2048 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3136 j 2048 1088 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link049 : ∀ j < 64, Good (3136 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part049.rows.length := by rw [len049]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨3136 + j, h⟩).property
  rw [dispatch049 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound049.2 j hj')


end FKLBridge.Split
