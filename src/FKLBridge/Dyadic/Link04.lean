module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch040 (j : ℕ) (hc : j < 256) (h : 10240 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨10240 + j, h⟩).val = CertificateData.Part040.rows[j]'(by rw [len040]; exact hc) := by
  have p : 10240 + j - 8192 < 7087 := Rows.sub_lt_of_part 10240 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (10240 + j) h _ rfl
  have e := sel_dyadicGroup1 (10240 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 10240 j 8192 (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 10240 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 2048 (by decide))).1 (Rows.lt_sub_of_part 10240 j 256 8192 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10240 j 8192 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link040 : ∀ j < 256, Good (10240 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part040.rows.length := by rw [len040]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨10240 + j, h⟩).property
  rw [dispatch040 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound040.2 j hj')

theorem dispatch041 (j : ℕ) (hc : j < 256) (h : 10496 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨10496 + j, h⟩).val = CertificateData.Part041.rows[j]'(by rw [len041]; exact hc) := by
  have p : 10496 + j - 8192 < 7087 := Rows.sub_lt_of_part 10496 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (10496 + j) h _ rfl
  have e := sel_dyadicGroup1 (10496 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 10496 j 8192 (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 10496 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 2304 (by decide))).1 (Rows.lt_sub_of_part 10496 j 256 8192 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10496 j 8192 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link041 : ∀ j < 256, Good (10496 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part041.rows.length := by rw [len041]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨10496 + j, h⟩).property
  rw [dispatch041 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound041.2 j hj')

theorem dispatch042 (j : ℕ) (hc : j < 256) (h : 10752 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨10752 + j, h⟩).val = CertificateData.Part042.rows[j]'(by rw [len042]; exact hc) := by
  have p : 10752 + j - 8192 < 7087 := Rows.sub_lt_of_part 10752 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (10752 + j) h _ rfl
  have e := sel_dyadicGroup1 (10752 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 10752 j 8192 (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 10752 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2560 (by decide))).1 (Rows.lt_sub_of_part 10752 j 256 8192 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10752 j 8192 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link042 : ∀ j < 256, Good (10752 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part042.rows.length := by rw [len042]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨10752 + j, h⟩).property
  rw [dispatch042 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound042.2 j hj')

theorem dispatch043 (j : ℕ) (hc : j < 256) (h : 11008 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨11008 + j, h⟩).val = CertificateData.Part043.rows[j]'(by rw [len043]; exact hc) := by
  have p : 11008 + j - 8192 < 7087 := Rows.sub_lt_of_part 11008 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (11008 + j) h _ rfl
  have e := sel_dyadicGroup1 (11008 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 11008 j 8192 (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 11008 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2816 (by decide))).1 (Rows.lt_sub_of_part 11008 j 256 8192 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11008 j 8192 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link043 : ∀ j < 256, Good (11008 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part043.rows.length := by rw [len043]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨11008 + j, h⟩).property
  rw [dispatch043 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound043.2 j hj')

theorem dispatch044 (j : ℕ) (hc : j < 256) (h : 11264 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨11264 + j, h⟩).val = CertificateData.Part044.rows[j]'(by rw [len044]; exact hc) := by
  have p : 11264 + j - 8192 < 7087 := Rows.sub_lt_of_part 11264 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (11264 + j) h _ rfl
  have e := sel_dyadicGroup1 (11264 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 11264 j 8192 (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 11264 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 3072 (by decide))).1 (Rows.lt_sub_of_part 11264 j 256 8192 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11264 j 8192 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link044 : ∀ j < 256, Good (11264 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part044.rows.length := by rw [len044]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨11264 + j, h⟩).property
  rw [dispatch044 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound044.2 j hj')

theorem dispatch045 (j : ℕ) (hc : j < 256) (h : 11520 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨11520 + j, h⟩).val = CertificateData.Part045.rows[j]'(by rw [len045]; exact hc) := by
  have p : 11520 + j - 8192 < 7087 := Rows.sub_lt_of_part 11520 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (11520 + j) h _ rfl
  have e := sel_dyadicGroup1 (11520 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 11520 j 8192 (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 11520 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 3328 (by decide))).1 (Rows.lt_sub_of_part 11520 j 256 8192 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11520 j 8192 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link045 : ∀ j < 256, Good (11520 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part045.rows.length := by rw [len045]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨11520 + j, h⟩).property
  rw [dispatch045 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound045.2 j hj')

theorem dispatch046 (j : ℕ) (hc : j < 256) (h : 11776 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨11776 + j, h⟩).val = CertificateData.Part046.rows[j]'(by rw [len046]; exact hc) := by
  have p : 11776 + j - 8192 < 7087 := Rows.sub_lt_of_part 11776 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (11776 + j) h _ rfl
  have e := sel_dyadicGroup1 (11776 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 11776 j 8192 (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 11776 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3584 (by decide))).1 (Rows.lt_sub_of_part 11776 j 256 8192 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11776 j 8192 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link046 : ∀ j < 256, Good (11776 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part046.rows.length := by rw [len046]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨11776 + j, h⟩).property
  rw [dispatch046 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound046.2 j hj')

theorem dispatch047 (j : ℕ) (hc : j < 256) (h : 12032 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨12032 + j, h⟩).val = CertificateData.Part047.rows[j]'(by rw [len047]; exact hc) := by
  have p : 12032 + j - 8192 < 7087 := Rows.sub_lt_of_part 12032 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (12032 + j) h _ rfl
  have e := sel_dyadicGroup1 (12032 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 12032 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12032 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3840 (by decide))).1 (Rows.lt_sub_of_part 12032 j 256 8192 4096 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12032 j 8192 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link047 : ∀ j < 256, Good (12032 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part047.rows.length := by rw [len047]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨12032 + j, h⟩).property
  rw [dispatch047 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound047.2 j hj')

theorem dispatch048 (j : ℕ) (hc : j < 256) (h : 12288 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨12288 + j, h⟩).val = CertificateData.Part048.rows[j]'(by rw [len048]; exact hc) := by
  have p : 12288 + j - 8192 < 7087 := Rows.sub_lt_of_part 12288 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (12288 + j) h _ rfl
  have e := sel_dyadicGroup1 (12288 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 12288 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12288 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 12288 j 8192 4096 (by decide))).1 (Rows.lt_sub_of_part 12288 j 256 8192 4352 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12288 j 8192 4096 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link048 : ∀ j < 256, Good (12288 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part048.rows.length := by rw [len048]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨12288 + j, h⟩).property
  rw [dispatch048 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound048.2 j hj')

theorem dispatch049 (j : ℕ) (hc : j < 256) (h : 12544 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨12544 + j, h⟩).val = CertificateData.Part049.rows[j]'(by rw [len049]; exact hc) := by
  have p : 12544 + j - 8192 < 7087 := Rows.sub_lt_of_part 12544 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (12544 + j) h _ rfl
  have e := sel_dyadicGroup1 (12544 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 12544 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12544 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 8192 4352 (by decide))).1 (Rows.lt_sub_of_part 12544 j 256 8192 4608 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12544 j 8192 4352 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link049 : ∀ j < 256, Good (12544 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part049.rows.length := by rw [len049]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨12544 + j, h⟩).property
  rw [dispatch049 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound049.2 j hj')


end FKLBridge.Dyadic
