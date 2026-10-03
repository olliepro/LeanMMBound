module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch080 (j : ℕ) (hc : j < 64) (h : 5120 + j < 5542) :
    (IndexedCertificateRows.split ⟨5120 + j, h⟩).val = SplitCertificateData.Part080.rows[j]'(by rw [len080]; exact hc) := by
  have p : 5120 + j - 4096 < 1446 := Rows.sub_lt_of_part 5120 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5120 + j) h _ rfl
  have e := sel_splitGroup2 (5120 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5120 j 2048 (by decide))).2 (Rows.not_lt_of_part 5120 j 4096 (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5120 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 1024 (by decide))).1 (Rows.lt_sub_of_part 5120 j 64 4096 1088 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5120 j 4096 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link080 : ∀ j < 64, Good (5120 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part080.rows.length := by rw [len080]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5120 + j, h⟩).property
  rw [dispatch080 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound080.2 j hj')

theorem dispatch081 (j : ℕ) (hc : j < 64) (h : 5184 + j < 5542) :
    (IndexedCertificateRows.split ⟨5184 + j, h⟩).val = SplitCertificateData.Part081.rows[j]'(by rw [len081]; exact hc) := by
  have p : 5184 + j - 4096 < 1446 := Rows.sub_lt_of_part 5184 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5184 + j) h _ rfl
  have e := sel_splitGroup2 (5184 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5184 j 2048 (by decide))).2 (Rows.not_lt_of_part 5184 j 4096 (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5184 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5184 j 4096 1088 (by decide))).1 (Rows.lt_sub_of_part 5184 j 64 4096 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5184 j 4096 1088 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link081 : ∀ j < 64, Good (5184 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part081.rows.length := by rw [len081]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5184 + j, h⟩).property
  rw [dispatch081 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound081.2 j hj')

theorem dispatch082 (j : ℕ) (hc : j < 64) (h : 5248 + j < 5542) :
    (IndexedCertificateRows.split ⟨5248 + j, h⟩).val = SplitCertificateData.Part082.rows[j]'(by rw [len082]; exact hc) := by
  have p : 5248 + j - 4096 < 1446 := Rows.sub_lt_of_part 5248 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5248 + j) h _ rfl
  have e := sel_splitGroup2 (5248 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5248 j 2048 (by decide))).2 (Rows.not_lt_of_part 5248 j 4096 (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5248 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 1088 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 1152 (by decide))).1 (Rows.lt_sub_of_part 5248 j 64 4096 1216 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5248 j 4096 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link082 : ∀ j < 64, Good (5248 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part082.rows.length := by rw [len082]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5248 + j, h⟩).property
  rw [dispatch082 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound082.2 j hj')

theorem dispatch083 (j : ℕ) (hc : j < 64) (h : 5312 + j < 5542) :
    (IndexedCertificateRows.split ⟨5312 + j, h⟩).val = SplitCertificateData.Part083.rows[j]'(by rw [len083]; exact hc) := by
  have p : 5312 + j - 4096 < 1446 := Rows.sub_lt_of_part 5312 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5312 + j) h _ rfl
  have e := sel_splitGroup2 (5312 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5312 j 2048 (by decide))).2 (Rows.not_lt_of_part 5312 j 4096 (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5312 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 1088 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5312 j 4096 1216 (by decide))).1 (Rows.lt_sub_of_part 5312 j 64 4096 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5312 j 4096 1216 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link083 : ∀ j < 64, Good (5312 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part083.rows.length := by rw [len083]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5312 + j, h⟩).property
  rw [dispatch083 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound083.2 j hj')

theorem dispatch084 (j : ℕ) (hc : j < 64) (h : 5376 + j < 5542) :
    (IndexedCertificateRows.split ⟨5376 + j, h⟩).val = SplitCertificateData.Part084.rows[j]'(by rw [len084]; exact hc) := by
  have p : 5376 + j - 4096 < 1446 := Rows.sub_lt_of_part 5376 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5376 + j) h _ rfl
  have e := sel_splitGroup2 (5376 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5376 j 2048 (by decide))).2 (Rows.not_lt_of_part 5376 j 4096 (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5376 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1088 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1216 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1280 (by decide))).1 (Rows.lt_sub_of_part 5376 j 64 4096 1344 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5376 j 4096 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link084 : ∀ j < 64, Good (5376 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part084.rows.length := by rw [len084]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5376 + j, h⟩).property
  rw [dispatch084 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound084.2 j hj')

theorem dispatch085 (j : ℕ) (hc : j < 64) (h : 5440 + j < 5542) :
    (IndexedCertificateRows.split ⟨5440 + j, h⟩).val = SplitCertificateData.Part085.rows[j]'(by rw [len085]; exact hc) := by
  have p : 5440 + j - 4096 < 1446 := Rows.sub_lt_of_part 5440 j 64 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5440 + j) h _ rfl
  have e := sel_splitGroup2 (5440 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5440 j 2048 (by decide))).2 (Rows.not_lt_of_part 5440 j 4096 (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5440 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1088 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1216 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5440 j 4096 1344 (by decide))).1 (Rows.lt_sub_of_part 5440 j 64 4096 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5440 j 4096 1344 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link085 : ∀ j < 64, Good (5440 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part085.rows.length := by rw [len085]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5440 + j, h⟩).property
  rw [dispatch085 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound085.2 j hj')

theorem dispatch086 (j : ℕ) (hc : j < 38) (h : 5504 + j < 5542) :
    (IndexedCertificateRows.split ⟨5504 + j, h⟩).val = SplitCertificateData.Part086.rows[j]'(by rw [len086]; exact hc) := by
  have p : 5504 + j - 4096 < 1446 := Rows.sub_lt_of_part 5504 j 38 4096 1446 hc (by decide) (by decide)
  have e0 := sel_top (5504 + j) h _ rfl
  have e := sel_splitGroup2 (5504 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5504 j 2048 (by decide))).2 (Rows.not_lt_of_part 5504 j 4096 (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5504 j 4096 64 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 192 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 320 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 448 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 576 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 704 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 832 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 960 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1088 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1216 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1344 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1408 (by decide)))
  rw [Rows.sub_sub_part 5504 j 4096 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link086 : ∀ j < 38, Good (5504 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part086.rows.length := by rw [len086]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨5504 + j, h⟩).property
  rw [dispatch086 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound086.2 j hj')


end FKLBridge.Split
