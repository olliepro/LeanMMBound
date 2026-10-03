module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch020 (j : ℕ) (hc : j < 64) (h : 1280 + j < 5542) :
    (IndexedCertificateRows.split ⟨1280 + j, h⟩).val = SplitCertificateData.Part020.rows[j]'(by rw [len020]; exact hc) := by
  have p : 1280 + j - 0 < 2048 := Rows.sub_lt_of_part 1280 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1280 + j) h _ rfl
  have e := sel_splitGroup0 (1280 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1280 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1280 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1280 (by decide))).1 (Rows.lt_sub_of_part 1280 j 64 0 1344 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1280 j 0 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link020 : ∀ j < 64, Good (1280 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part020.rows.length := by rw [len020]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1280 + j, h⟩).property
  rw [dispatch020 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound020.2 j hj')

theorem dispatch021 (j : ℕ) (hc : j < 64) (h : 1344 + j < 5542) :
    (IndexedCertificateRows.split ⟨1344 + j, h⟩).val = SplitCertificateData.Part021.rows[j]'(by rw [len021]; exact hc) := by
  have p : 1344 + j - 0 < 2048 := Rows.sub_lt_of_part 1344 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1344 + j) h _ rfl
  have e := sel_splitGroup0 (1344 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1344 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1344 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1344 j 0 1344 (by decide))).1 (Rows.lt_sub_of_part 1344 j 64 0 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1344 j 0 1344 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link021 : ∀ j < 64, Good (1344 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part021.rows.length := by rw [len021]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1344 + j, h⟩).property
  rw [dispatch021 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound021.2 j hj')

theorem dispatch022 (j : ℕ) (hc : j < 64) (h : 1408 + j < 5542) :
    (IndexedCertificateRows.split ⟨1408 + j, h⟩).val = SplitCertificateData.Part022.rows[j]'(by rw [len022]; exact hc) := by
  have p : 1408 + j - 0 < 2048 := Rows.sub_lt_of_part 1408 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1408 + j) h _ rfl
  have e := sel_splitGroup0 (1408 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1408 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1408 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1408 (by decide))).1 (Rows.lt_sub_of_part 1408 j 64 0 1472 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1408 j 0 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link022 : ∀ j < 64, Good (1408 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part022.rows.length := by rw [len022]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1408 + j, h⟩).property
  rw [dispatch022 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound022.2 j hj')

theorem dispatch023 (j : ℕ) (hc : j < 64) (h : 1472 + j < 5542) :
    (IndexedCertificateRows.split ⟨1472 + j, h⟩).val = SplitCertificateData.Part023.rows[j]'(by rw [len023]; exact hc) := by
  have p : 1472 + j - 0 < 2048 := Rows.sub_lt_of_part 1472 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1472 + j) h _ rfl
  have e := sel_splitGroup0 (1472 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1472 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1472 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1472 j 0 1472 (by decide))).1 (Rows.lt_sub_of_part 1472 j 64 0 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1472 j 0 1472 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link023 : ∀ j < 64, Good (1472 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part023.rows.length := by rw [len023]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1472 + j, h⟩).property
  rw [dispatch023 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound023.2 j hj')

theorem dispatch024 (j : ℕ) (hc : j < 64) (h : 1536 + j < 5542) :
    (IndexedCertificateRows.split ⟨1536 + j, h⟩).val = SplitCertificateData.Part024.rows[j]'(by rw [len024]; exact hc) := by
  have p : 1536 + j - 0 < 2048 := Rows.sub_lt_of_part 1536 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1536 + j) h _ rfl
  have e := sel_splitGroup0 (1536 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1536 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1536 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1536 (by decide))).1 (Rows.lt_sub_of_part 1536 j 64 0 1600 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1536 j 0 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link024 : ∀ j < 64, Good (1536 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part024.rows.length := by rw [len024]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1536 + j, h⟩).property
  rw [dispatch024 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound024.2 j hj')

theorem dispatch025 (j : ℕ) (hc : j < 64) (h : 1600 + j < 5542) :
    (IndexedCertificateRows.split ⟨1600 + j, h⟩).val = SplitCertificateData.Part025.rows[j]'(by rw [len025]; exact hc) := by
  have p : 1600 + j - 0 < 2048 := Rows.sub_lt_of_part 1600 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1600 + j) h _ rfl
  have e := sel_splitGroup0 (1600 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1600 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1600 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1600 j 0 1600 (by decide))).1 (Rows.lt_sub_of_part 1600 j 64 0 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1600 j 0 1600 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link025 : ∀ j < 64, Good (1600 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part025.rows.length := by rw [len025]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1600 + j, h⟩).property
  rw [dispatch025 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound025.2 j hj')

theorem dispatch026 (j : ℕ) (hc : j < 64) (h : 1664 + j < 5542) :
    (IndexedCertificateRows.split ⟨1664 + j, h⟩).val = SplitCertificateData.Part026.rows[j]'(by rw [len026]; exact hc) := by
  have p : 1664 + j - 0 < 2048 := Rows.sub_lt_of_part 1664 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1664 + j) h _ rfl
  have e := sel_splitGroup0 (1664 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1664 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1664 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1664 (by decide))).1 (Rows.lt_sub_of_part 1664 j 64 0 1728 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1664 j 0 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link026 : ∀ j < 64, Good (1664 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part026.rows.length := by rw [len026]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1664 + j, h⟩).property
  rw [dispatch026 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound026.2 j hj')

theorem dispatch027 (j : ℕ) (hc : j < 64) (h : 1728 + j < 5542) :
    (IndexedCertificateRows.split ⟨1728 + j, h⟩).val = SplitCertificateData.Part027.rows[j]'(by rw [len027]; exact hc) := by
  have p : 1728 + j - 0 < 2048 := Rows.sub_lt_of_part 1728 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1728 + j) h _ rfl
  have e := sel_splitGroup0 (1728 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1728 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1728 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1728 j 0 1728 (by decide))).1 (Rows.lt_sub_of_part 1728 j 64 0 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1728 j 0 1728 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link027 : ∀ j < 64, Good (1728 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part027.rows.length := by rw [len027]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1728 + j, h⟩).property
  rw [dispatch027 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound027.2 j hj')

theorem dispatch028 (j : ℕ) (hc : j < 64) (h : 1792 + j < 5542) :
    (IndexedCertificateRows.split ⟨1792 + j, h⟩).val = SplitCertificateData.Part028.rows[j]'(by rw [len028]; exact hc) := by
  have p : 1792 + j - 0 < 2048 := Rows.sub_lt_of_part 1792 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1792 + j) h _ rfl
  have e := sel_splitGroup0 (1792 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1792 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1792 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1728 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1792 (by decide))).1 (Rows.lt_sub_of_part 1792 j 64 0 1856 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1792 j 0 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link028 : ∀ j < 64, Good (1792 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part028.rows.length := by rw [len028]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1792 + j, h⟩).property
  rw [dispatch028 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound028.2 j hj')

theorem dispatch029 (j : ℕ) (hc : j < 64) (h : 1856 + j < 5542) :
    (IndexedCertificateRows.split ⟨1856 + j, h⟩).val = SplitCertificateData.Part029.rows[j]'(by rw [len029]; exact hc) := by
  have p : 1856 + j - 0 < 2048 := Rows.sub_lt_of_part 1856 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1856 + j) h _ rfl
  have e := sel_splitGroup0 (1856 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1856 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1856 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1216 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1344 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1472 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1600 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1728 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 1856 j 0 1856 (by decide))).1 (Rows.lt_sub_of_part 1856 j 64 0 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1856 j 0 1856 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link029 : ∀ j < 64, Good (1856 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part029.rows.length := by rw [len029]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1856 + j, h⟩).property
  rw [dispatch029 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound029.2 j hj')


end FKLBridge.Split
