module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch000 (j : ℕ) (hc : j < 64) (h : 0 + j < 5542) :
    (IndexedCertificateRows.split ⟨0 + j, h⟩).val = SplitCertificateData.Part000.rows[j]'(by rw [len000]; exact hc) := by
  have p : 0 + j - 0 < 2048 := Rows.sub_lt_of_part 0 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (0 + j) h _ rfl
  have e := sel_splitGroup0 (0 + j - 0) p _ ((e0.1 (Rows.lt_of_part 0 j 64 2048 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 0 j 64 0 64 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 0 j 0 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link000 : ∀ j < 64, Good (0 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part000.rows.length := by rw [len000]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨0 + j, h⟩).property
  rw [dispatch000 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound000.2 j hj')

theorem dispatch001 (j : ℕ) (hc : j < 64) (h : 64 + j < 5542) :
    (IndexedCertificateRows.split ⟨64 + j, h⟩).val = SplitCertificateData.Part001.rows[j]'(by rw [len001]; exact hc) := by
  have p : 64 + j - 0 < 2048 := Rows.sub_lt_of_part 64 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (64 + j) h _ rfl
  have e := sel_splitGroup0 (64 + j - 0) p _ ((e0.1 (Rows.lt_of_part 64 j 64 2048 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 64 j 0 64 (by decide))).1 (Rows.lt_sub_of_part 64 j 64 0 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 64 j 0 64 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link001 : ∀ j < 64, Good (64 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part001.rows.length := by rw [len001]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨64 + j, h⟩).property
  rw [dispatch001 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound001.2 j hj')

theorem dispatch002 (j : ℕ) (hc : j < 64) (h : 128 + j < 5542) :
    (IndexedCertificateRows.split ⟨128 + j, h⟩).val = SplitCertificateData.Part002.rows[j]'(by rw [len002]; exact hc) := by
  have p : 128 + j - 0 < 2048 := Rows.sub_lt_of_part 128 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (128 + j) h _ rfl
  have e := sel_splitGroup0 (128 + j - 0) p _ ((e0.1 (Rows.lt_of_part 128 j 64 2048 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 128 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 128 j 0 128 (by decide))).1 (Rows.lt_sub_of_part 128 j 64 0 192 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 128 j 0 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link002 : ∀ j < 64, Good (128 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part002.rows.length := by rw [len002]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨128 + j, h⟩).property
  rw [dispatch002 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound002.2 j hj')

theorem dispatch003 (j : ℕ) (hc : j < 64) (h : 192 + j < 5542) :
    (IndexedCertificateRows.split ⟨192 + j, h⟩).val = SplitCertificateData.Part003.rows[j]'(by rw [len003]; exact hc) := by
  have p : 192 + j - 0 < 2048 := Rows.sub_lt_of_part 192 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (192 + j) h _ rfl
  have e := sel_splitGroup0 (192 + j - 0) p _ ((e0.1 (Rows.lt_of_part 192 j 64 2048 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 192 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 192 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 192 j 0 192 (by decide))).1 (Rows.lt_sub_of_part 192 j 64 0 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 192 j 0 192 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link003 : ∀ j < 64, Good (192 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part003.rows.length := by rw [len003]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨192 + j, h⟩).property
  rw [dispatch003 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound003.2 j hj')

theorem dispatch004 (j : ℕ) (hc : j < 64) (h : 256 + j < 5542) :
    (IndexedCertificateRows.split ⟨256 + j, h⟩).val = SplitCertificateData.Part004.rows[j]'(by rw [len004]; exact hc) := by
  have p : 256 + j - 0 < 2048 := Rows.sub_lt_of_part 256 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (256 + j) h _ rfl
  have e := sel_splitGroup0 (256 + j - 0) p _ ((e0.1 (Rows.lt_of_part 256 j 64 2048 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 256 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 256 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 256 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 256 j 0 256 (by decide))).1 (Rows.lt_sub_of_part 256 j 64 0 320 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 256 j 0 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link004 : ∀ j < 64, Good (256 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part004.rows.length := by rw [len004]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨256 + j, h⟩).property
  rw [dispatch004 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound004.2 j hj')

theorem dispatch005 (j : ℕ) (hc : j < 64) (h : 320 + j < 5542) :
    (IndexedCertificateRows.split ⟨320 + j, h⟩).val = SplitCertificateData.Part005.rows[j]'(by rw [len005]; exact hc) := by
  have p : 320 + j - 0 < 2048 := Rows.sub_lt_of_part 320 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (320 + j) h _ rfl
  have e := sel_splitGroup0 (320 + j - 0) p _ ((e0.1 (Rows.lt_of_part 320 j 64 2048 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 320 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 320 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 320 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 320 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 320 j 0 320 (by decide))).1 (Rows.lt_sub_of_part 320 j 64 0 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 320 j 0 320 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link005 : ∀ j < 64, Good (320 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part005.rows.length := by rw [len005]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨320 + j, h⟩).property
  rw [dispatch005 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound005.2 j hj')

theorem dispatch006 (j : ℕ) (hc : j < 64) (h : 384 + j < 5542) :
    (IndexedCertificateRows.split ⟨384 + j, h⟩).val = SplitCertificateData.Part006.rows[j]'(by rw [len006]; exact hc) := by
  have p : 384 + j - 0 < 2048 := Rows.sub_lt_of_part 384 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (384 + j) h _ rfl
  have e := sel_splitGroup0 (384 + j - 0) p _ ((e0.1 (Rows.lt_of_part 384 j 64 2048 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 384 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 384 (by decide))).1 (Rows.lt_sub_of_part 384 j 64 0 448 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 384 j 0 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link006 : ∀ j < 64, Good (384 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part006.rows.length := by rw [len006]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨384 + j, h⟩).property
  rw [dispatch006 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound006.2 j hj')

theorem dispatch007 (j : ℕ) (hc : j < 64) (h : 448 + j < 5542) :
    (IndexedCertificateRows.split ⟨448 + j, h⟩).val = SplitCertificateData.Part007.rows[j]'(by rw [len007]; exact hc) := by
  have p : 448 + j - 0 < 2048 := Rows.sub_lt_of_part 448 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (448 + j) h _ rfl
  have e := sel_splitGroup0 (448 + j - 0) p _ ((e0.1 (Rows.lt_of_part 448 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 448 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 448 j 0 448 (by decide))).1 (Rows.lt_sub_of_part 448 j 64 0 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 448 j 0 448 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link007 : ∀ j < 64, Good (448 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part007.rows.length := by rw [len007]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨448 + j, h⟩).property
  rw [dispatch007 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound007.2 j hj')

theorem dispatch008 (j : ℕ) (hc : j < 64) (h : 512 + j < 5542) :
    (IndexedCertificateRows.split ⟨512 + j, h⟩).val = SplitCertificateData.Part008.rows[j]'(by rw [len008]; exact hc) := by
  have p : 512 + j - 0 < 2048 := Rows.sub_lt_of_part 512 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (512 + j) h _ rfl
  have e := sel_splitGroup0 (512 + j - 0) p _ ((e0.1 (Rows.lt_of_part 512 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 512 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 512 (by decide))).1 (Rows.lt_sub_of_part 512 j 64 0 576 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 512 j 0 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link008 : ∀ j < 64, Good (512 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part008.rows.length := by rw [len008]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨512 + j, h⟩).property
  rw [dispatch008 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound008.2 j hj')

theorem dispatch009 (j : ℕ) (hc : j < 64) (h : 576 + j < 5542) :
    (IndexedCertificateRows.split ⟨576 + j, h⟩).val = SplitCertificateData.Part009.rows[j]'(by rw [len009]; exact hc) := by
  have p : 576 + j - 0 < 2048 := Rows.sub_lt_of_part 576 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (576 + j) h _ rfl
  have e := sel_splitGroup0 (576 + j - 0) p _ ((e0.1 (Rows.lt_of_part 576 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 576 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 576 j 0 576 (by decide))).1 (Rows.lt_sub_of_part 576 j 64 0 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 576 j 0 576 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link009 : ∀ j < 64, Good (576 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part009.rows.length := by rw [len009]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨576 + j, h⟩).property
  rw [dispatch009 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound009.2 j hj')


end FKLBridge.Split
