module

public import FKLBridge.Split.Sel

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch010 (j : ℕ) (hc : j < 64) (h : 640 + j < 5542) :
    (IndexedCertificateRows.split ⟨640 + j, h⟩).val = SplitCertificateData.Part010.rows[j]'(by rw [len010]; exact hc) := by
  have p : 640 + j - 0 < 2048 := Rows.sub_lt_of_part 640 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (640 + j) h _ rfl
  have e := sel_splitGroup0 (640 + j - 0) p _ ((e0.1 (Rows.lt_of_part 640 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 640 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 640 (by decide))).1 (Rows.lt_sub_of_part 640 j 64 0 704 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 640 j 0 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link010 : ∀ j < 64, Good (640 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part010.rows.length := by rw [len010]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨640 + j, h⟩).property
  rw [dispatch010 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound010.2 j hj')

theorem dispatch011 (j : ℕ) (hc : j < 64) (h : 704 + j < 5542) :
    (IndexedCertificateRows.split ⟨704 + j, h⟩).val = SplitCertificateData.Part011.rows[j]'(by rw [len011]; exact hc) := by
  have p : 704 + j - 0 < 2048 := Rows.sub_lt_of_part 704 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (704 + j) h _ rfl
  have e := sel_splitGroup0 (704 + j - 0) p _ ((e0.1 (Rows.lt_of_part 704 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 704 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 704 j 0 704 (by decide))).1 (Rows.lt_sub_of_part 704 j 64 0 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 704 j 0 704 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link011 : ∀ j < 64, Good (704 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part011.rows.length := by rw [len011]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨704 + j, h⟩).property
  rw [dispatch011 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound011.2 j hj')

theorem dispatch012 (j : ℕ) (hc : j < 64) (h : 768 + j < 5542) :
    (IndexedCertificateRows.split ⟨768 + j, h⟩).val = SplitCertificateData.Part012.rows[j]'(by rw [len012]; exact hc) := by
  have p : 768 + j - 0 < 2048 := Rows.sub_lt_of_part 768 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (768 + j) h _ rfl
  have e := sel_splitGroup0 (768 + j - 0) p _ ((e0.1 (Rows.lt_of_part 768 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 768 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 768 (by decide))).1 (Rows.lt_sub_of_part 768 j 64 0 832 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 768 j 0 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link012 : ∀ j < 64, Good (768 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part012.rows.length := by rw [len012]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨768 + j, h⟩).property
  rw [dispatch012 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound012.2 j hj')

theorem dispatch013 (j : ℕ) (hc : j < 64) (h : 832 + j < 5542) :
    (IndexedCertificateRows.split ⟨832 + j, h⟩).val = SplitCertificateData.Part013.rows[j]'(by rw [len013]; exact hc) := by
  have p : 832 + j - 0 < 2048 := Rows.sub_lt_of_part 832 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (832 + j) h _ rfl
  have e := sel_splitGroup0 (832 + j - 0) p _ ((e0.1 (Rows.lt_of_part 832 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 832 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 832 j 0 832 (by decide))).1 (Rows.lt_sub_of_part 832 j 64 0 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 832 j 0 832 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link013 : ∀ j < 64, Good (832 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part013.rows.length := by rw [len013]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨832 + j, h⟩).property
  rw [dispatch013 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound013.2 j hj')

theorem dispatch014 (j : ℕ) (hc : j < 64) (h : 896 + j < 5542) :
    (IndexedCertificateRows.split ⟨896 + j, h⟩).val = SplitCertificateData.Part014.rows[j]'(by rw [len014]; exact hc) := by
  have p : 896 + j - 0 < 2048 := Rows.sub_lt_of_part 896 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (896 + j) h _ rfl
  have e := sel_splitGroup0 (896 + j - 0) p _ ((e0.1 (Rows.lt_of_part 896 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 896 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 896 (by decide))).1 (Rows.lt_sub_of_part 896 j 64 0 960 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 896 j 0 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link014 : ∀ j < 64, Good (896 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part014.rows.length := by rw [len014]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨896 + j, h⟩).property
  rw [dispatch014 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound014.2 j hj')

theorem dispatch015 (j : ℕ) (hc : j < 64) (h : 960 + j < 5542) :
    (IndexedCertificateRows.split ⟨960 + j, h⟩).val = SplitCertificateData.Part015.rows[j]'(by rw [len015]; exact hc) := by
  have p : 960 + j - 0 < 2048 := Rows.sub_lt_of_part 960 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (960 + j) h _ rfl
  have e := sel_splitGroup0 (960 + j - 0) p _ ((e0.1 (Rows.lt_of_part 960 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 960 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 960 j 0 960 (by decide))).1 (Rows.lt_sub_of_part 960 j 64 0 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 960 j 0 960 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link015 : ∀ j < 64, Good (960 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part015.rows.length := by rw [len015]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨960 + j, h⟩).property
  rw [dispatch015 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound015.2 j hj')

theorem dispatch016 (j : ℕ) (hc : j < 64) (h : 1024 + j < 5542) :
    (IndexedCertificateRows.split ⟨1024 + j, h⟩).val = SplitCertificateData.Part016.rows[j]'(by rw [len016]; exact hc) := by
  have p : 1024 + j - 0 < 2048 := Rows.sub_lt_of_part 1024 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1024 + j) h _ rfl
  have e := sel_splitGroup0 (1024 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1024 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1024 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 1024 (by decide))).1 (Rows.lt_sub_of_part 1024 j 64 0 1088 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1024 j 0 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link016 : ∀ j < 64, Good (1024 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part016.rows.length := by rw [len016]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1024 + j, h⟩).property
  rw [dispatch016 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound016.2 j hj')

theorem dispatch017 (j : ℕ) (hc : j < 64) (h : 1088 + j < 5542) :
    (IndexedCertificateRows.split ⟨1088 + j, h⟩).val = SplitCertificateData.Part017.rows[j]'(by rw [len017]; exact hc) := by
  have p : 1088 + j - 0 < 2048 := Rows.sub_lt_of_part 1088 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1088 + j) h _ rfl
  have e := sel_splitGroup0 (1088 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1088 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1088 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1088 j 0 1088 (by decide))).1 (Rows.lt_sub_of_part 1088 j 64 0 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1088 j 0 1088 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link017 : ∀ j < 64, Good (1088 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part017.rows.length := by rw [len017]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1088 + j, h⟩).property
  rw [dispatch017 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound017.2 j hj')

theorem dispatch018 (j : ℕ) (hc : j < 64) (h : 1152 + j < 5542) :
    (IndexedCertificateRows.split ⟨1152 + j, h⟩).val = SplitCertificateData.Part018.rows[j]'(by rw [len018]; exact hc) := by
  have p : 1152 + j - 0 < 2048 := Rows.sub_lt_of_part 1152 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1152 + j) h _ rfl
  have e := sel_splitGroup0 (1152 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1152 j 64 2048 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1152 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 1152 (by decide))).1 (Rows.lt_sub_of_part 1152 j 64 0 1216 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1152 j 0 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link018 : ∀ j < 64, Good (1152 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part018.rows.length := by rw [len018]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1152 + j, h⟩).property
  rw [dispatch018 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound018.2 j hj')

theorem dispatch019 (j : ℕ) (hc : j < 64) (h : 1216 + j < 5542) :
    (IndexedCertificateRows.split ⟨1216 + j, h⟩).val = SplitCertificateData.Part019.rows[j]'(by rw [len019]; exact hc) := by
  have p : 1216 + j - 0 < 2048 := Rows.sub_lt_of_part 1216 j 64 0 2048 hc (by decide) (by decide)
  have e0 := sel_top (1216 + j) h _ rfl
  have e := sel_splitGroup0 (1216 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1216 j 64 2048 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1216 j 0 64 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 192 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 320 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 448 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 576 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 704 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 832 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 960 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 1088 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1216 j 0 1216 (by decide))).1 (Rows.lt_sub_of_part 1216 j 64 0 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1216 j 0 1216 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link019 : ∀ j < 64, Good (1216 + j) := by
  intro j hj h
  have hj' : j < SplitCertificateData.Part019.rows.length := by rw [len019]; exact hj
  have hchk := (IndexedCertificateRows.split ⟨1216 + j, h⟩).property
  rw [dispatch019 j hj h] at hchk ⊢
  exact Rows.splitOk_sound _ _ _ hchk (sound019.2 j hj')


end FKLBridge.Split
