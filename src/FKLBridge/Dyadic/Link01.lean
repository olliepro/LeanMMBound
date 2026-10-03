module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch010 (j : ℕ) (hc : j < 256) (h : 2560 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨2560 + j, h⟩).val = CertificateData.Part010.rows[j]'(by rw [len010]; exact hc) := by
  have p : 2560 + j - 0 < 8192 := Rows.sub_lt_of_part 2560 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (2560 + j) h _ rfl
  have e := sel_dyadicGroup0 (2560 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2560 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 2560 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2560 (by decide))).1 (Rows.lt_sub_of_part 2560 j 256 0 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2560 j 0 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link010 : ∀ j < 256, Good (2560 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part010.rows.length := by rw [len010]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨2560 + j, h⟩).property
  rw [dispatch010 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound010.2 j hj')

theorem dispatch011 (j : ℕ) (hc : j < 256) (h : 2816 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨2816 + j, h⟩).val = CertificateData.Part011.rows[j]'(by rw [len011]; exact hc) := by
  have p : 2816 + j - 0 < 8192 := Rows.sub_lt_of_part 2816 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (2816 + j) h _ rfl
  have e := sel_dyadicGroup0 (2816 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2816 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 2816 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2816 (by decide))).1 (Rows.lt_sub_of_part 2816 j 256 0 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2816 j 0 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link011 : ∀ j < 256, Good (2816 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part011.rows.length := by rw [len011]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨2816 + j, h⟩).property
  rw [dispatch011 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound011.2 j hj')

theorem dispatch012 (j : ℕ) (hc : j < 256) (h : 3072 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨3072 + j, h⟩).val = CertificateData.Part012.rows[j]'(by rw [len012]; exact hc) := by
  have p : 3072 + j - 0 < 8192 := Rows.sub_lt_of_part 3072 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (3072 + j) h _ rfl
  have e := sel_dyadicGroup0 (3072 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3072 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 3072 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 3072 (by decide))).1 (Rows.lt_sub_of_part 3072 j 256 0 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3072 j 0 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link012 : ∀ j < 256, Good (3072 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part012.rows.length := by rw [len012]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨3072 + j, h⟩).property
  rw [dispatch012 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound012.2 j hj')

theorem dispatch013 (j : ℕ) (hc : j < 256) (h : 3328 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨3328 + j, h⟩).val = CertificateData.Part013.rows[j]'(by rw [len013]; exact hc) := by
  have p : 3328 + j - 0 < 8192 := Rows.sub_lt_of_part 3328 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (3328 + j) h _ rfl
  have e := sel_dyadicGroup0 (3328 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3328 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 3328 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 3328 (by decide))).1 (Rows.lt_sub_of_part 3328 j 256 0 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3328 j 0 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link013 : ∀ j < 256, Good (3328 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part013.rows.length := by rw [len013]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨3328 + j, h⟩).property
  rw [dispatch013 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound013.2 j hj')

theorem dispatch014 (j : ℕ) (hc : j < 256) (h : 3584 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨3584 + j, h⟩).val = CertificateData.Part014.rows[j]'(by rw [len014]; exact hc) := by
  have p : 3584 + j - 0 < 8192 := Rows.sub_lt_of_part 3584 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (3584 + j) h _ rfl
  have e := sel_dyadicGroup0 (3584 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3584 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 3584 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3584 (by decide))).1 (Rows.lt_sub_of_part 3584 j 256 0 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3584 j 0 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link014 : ∀ j < 256, Good (3584 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part014.rows.length := by rw [len014]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨3584 + j, h⟩).property
  rw [dispatch014 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound014.2 j hj')

theorem dispatch015 (j : ℕ) (hc : j < 256) (h : 3840 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨3840 + j, h⟩).val = CertificateData.Part015.rows[j]'(by rw [len015]; exact hc) := by
  have p : 3840 + j - 0 < 8192 := Rows.sub_lt_of_part 3840 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (3840 + j) h _ rfl
  have e := sel_dyadicGroup0 (3840 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3840 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3840 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3840 (by decide))).1 (Rows.lt_sub_of_part 3840 j 256 0 4096 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3840 j 0 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link015 : ∀ j < 256, Good (3840 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part015.rows.length := by rw [len015]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨3840 + j, h⟩).property
  rw [dispatch015 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound015.2 j hj')

theorem dispatch016 (j : ℕ) (hc : j < 256) (h : 4096 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨4096 + j, h⟩).val = CertificateData.Part016.rows[j]'(by rw [len016]; exact hc) := by
  have p : 4096 + j - 0 < 8192 := Rows.sub_lt_of_part 4096 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (4096 + j) h _ rfl
  have e := sel_dyadicGroup0 (4096 + j - 0) p _ ((e0.1 (Rows.lt_of_part 4096 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 4096 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 4096 j 0 4096 (by decide))).1 (Rows.lt_sub_of_part 4096 j 256 0 4352 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4096 j 0 4096 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link016 : ∀ j < 256, Good (4096 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part016.rows.length := by rw [len016]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨4096 + j, h⟩).property
  rw [dispatch016 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound016.2 j hj')

theorem dispatch017 (j : ℕ) (hc : j < 256) (h : 4352 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨4352 + j, h⟩).val = CertificateData.Part017.rows[j]'(by rw [len017]; exact hc) := by
  have p : 4352 + j - 0 < 8192 := Rows.sub_lt_of_part 4352 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (4352 + j) h _ rfl
  have e := sel_dyadicGroup0 (4352 + j - 0) p _ ((e0.1 (Rows.lt_of_part 4352 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 4352 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 0 4352 (by decide))).1 (Rows.lt_sub_of_part 4352 j 256 0 4608 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4352 j 0 4352 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link017 : ∀ j < 256, Good (4352 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part017.rows.length := by rw [len017]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨4352 + j, h⟩).property
  rw [dispatch017 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound017.2 j hj')

theorem dispatch018 (j : ℕ) (hc : j < 256) (h : 4608 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨4608 + j, h⟩).val = CertificateData.Part018.rows[j]'(by rw [len018]; exact hc) := by
  have p : 4608 + j - 0 < 8192 := Rows.sub_lt_of_part 4608 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (4608 + j) h _ rfl
  have e := sel_dyadicGroup0 (4608 + j - 0) p _ ((e0.1 (Rows.lt_of_part 4608 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 4608 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 0 4608 (by decide))).1 (Rows.lt_sub_of_part 4608 j 256 0 4864 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4608 j 0 4608 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link018 : ∀ j < 256, Good (4608 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part018.rows.length := by rw [len018]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨4608 + j, h⟩).property
  rw [dispatch018 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound018.2 j hj')

theorem dispatch019 (j : ℕ) (hc : j < 256) (h : 4864 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨4864 + j, h⟩).val = CertificateData.Part019.rows[j]'(by rw [len019]; exact hc) := by
  have p : 4864 + j - 0 < 8192 := Rows.sub_lt_of_part 4864 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (4864 + j) h _ rfl
  have e := sel_dyadicGroup0 (4864 + j - 0) p _ ((e0.1 (Rows.lt_of_part 4864 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 4864 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 0 4864 (by decide))).1 (Rows.lt_sub_of_part 4864 j 256 0 5120 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4864 j 0 4864 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link019 : ∀ j < 256, Good (4864 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part019.rows.length := by rw [len019]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨4864 + j, h⟩).property
  rw [dispatch019 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound019.2 j hj')


end FKLBridge.Dyadic
