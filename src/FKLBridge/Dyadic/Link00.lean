module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch000 (j : ℕ) (hc : j < 256) (h : 0 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨0 + j, h⟩).val = CertificateData.Part000.rows[j]'(by rw [len000]; exact hc) := by
  have p : 0 + j - 0 < 8192 := Rows.sub_lt_of_part 0 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (0 + j) h _ rfl
  have e := sel_dyadicGroup0 (0 + j - 0) p _ ((e0.1 (Rows.lt_of_part 0 j 256 8192 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 0 j 256 0 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 0 j 0 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link000 : ∀ j < 256, Good (0 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part000.rows.length := by rw [len000]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨0 + j, h⟩).property
  rw [dispatch000 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound000.2 j hj')

theorem dispatch001 (j : ℕ) (hc : j < 256) (h : 256 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨256 + j, h⟩).val = CertificateData.Part001.rows[j]'(by rw [len001]; exact hc) := by
  have p : 256 + j - 0 < 8192 := Rows.sub_lt_of_part 256 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (256 + j) h _ rfl
  have e := sel_dyadicGroup0 (256 + j - 0) p _ ((e0.1 (Rows.lt_of_part 256 j 256 8192 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 256 j 0 256 (by decide))).1 (Rows.lt_sub_of_part 256 j 256 0 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 256 j 0 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link001 : ∀ j < 256, Good (256 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part001.rows.length := by rw [len001]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨256 + j, h⟩).property
  rw [dispatch001 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound001.2 j hj')

theorem dispatch002 (j : ℕ) (hc : j < 256) (h : 512 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨512 + j, h⟩).val = CertificateData.Part002.rows[j]'(by rw [len002]; exact hc) := by
  have p : 512 + j - 0 < 8192 := Rows.sub_lt_of_part 512 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (512 + j) h _ rfl
  have e := sel_dyadicGroup0 (512 + j - 0) p _ ((e0.1 (Rows.lt_of_part 512 j 256 8192 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 512 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 512 (by decide))).1 (Rows.lt_sub_of_part 512 j 256 0 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 512 j 0 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link002 : ∀ j < 256, Good (512 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part002.rows.length := by rw [len002]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨512 + j, h⟩).property
  rw [dispatch002 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound002.2 j hj')

theorem dispatch003 (j : ℕ) (hc : j < 256) (h : 768 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨768 + j, h⟩).val = CertificateData.Part003.rows[j]'(by rw [len003]; exact hc) := by
  have p : 768 + j - 0 < 8192 := Rows.sub_lt_of_part 768 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (768 + j) h _ rfl
  have e := sel_dyadicGroup0 (768 + j - 0) p _ ((e0.1 (Rows.lt_of_part 768 j 256 8192 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 768 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 768 (by decide))).1 (Rows.lt_sub_of_part 768 j 256 0 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 768 j 0 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link003 : ∀ j < 256, Good (768 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part003.rows.length := by rw [len003]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨768 + j, h⟩).property
  rw [dispatch003 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound003.2 j hj')

theorem dispatch004 (j : ℕ) (hc : j < 256) (h : 1024 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨1024 + j, h⟩).val = CertificateData.Part004.rows[j]'(by rw [len004]; exact hc) := by
  have p : 1024 + j - 0 < 8192 := Rows.sub_lt_of_part 1024 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (1024 + j) h _ rfl
  have e := sel_dyadicGroup0 (1024 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1024 j 256 8192 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 1024 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 1024 (by decide))).1 (Rows.lt_sub_of_part 1024 j 256 0 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1024 j 0 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link004 : ∀ j < 256, Good (1024 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part004.rows.length := by rw [len004]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨1024 + j, h⟩).property
  rw [dispatch004 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound004.2 j hj')

theorem dispatch005 (j : ℕ) (hc : j < 256) (h : 1280 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨1280 + j, h⟩).val = CertificateData.Part005.rows[j]'(by rw [len005]; exact hc) := by
  have p : 1280 + j - 0 < 8192 := Rows.sub_lt_of_part 1280 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (1280 + j) h _ rfl
  have e := sel_dyadicGroup0 (1280 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1280 j 256 8192 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 1280 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1280 (by decide))).1 (Rows.lt_sub_of_part 1280 j 256 0 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1280 j 0 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link005 : ∀ j < 256, Good (1280 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part005.rows.length := by rw [len005]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨1280 + j, h⟩).property
  rw [dispatch005 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound005.2 j hj')

theorem dispatch006 (j : ℕ) (hc : j < 256) (h : 1536 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨1536 + j, h⟩).val = CertificateData.Part006.rows[j]'(by rw [len006]; exact hc) := by
  have p : 1536 + j - 0 < 8192 := Rows.sub_lt_of_part 1536 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (1536 + j) h _ rfl
  have e := sel_dyadicGroup0 (1536 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1536 j 256 8192 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 1536 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1536 (by decide))).1 (Rows.lt_sub_of_part 1536 j 256 0 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1536 j 0 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link006 : ∀ j < 256, Good (1536 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part006.rows.length := by rw [len006]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨1536 + j, h⟩).property
  rw [dispatch006 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound006.2 j hj')

theorem dispatch007 (j : ℕ) (hc : j < 256) (h : 1792 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨1792 + j, h⟩).val = CertificateData.Part007.rows[j]'(by rw [len007]; exact hc) := by
  have p : 1792 + j - 0 < 8192 := Rows.sub_lt_of_part 1792 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (1792 + j) h _ rfl
  have e := sel_dyadicGroup0 (1792 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1792 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 1792 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1792 (by decide))).1 (Rows.lt_sub_of_part 1792 j 256 0 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1792 j 0 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link007 : ∀ j < 256, Good (1792 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part007.rows.length := by rw [len007]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨1792 + j, h⟩).property
  rw [dispatch007 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound007.2 j hj')

theorem dispatch008 (j : ℕ) (hc : j < 256) (h : 2048 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨2048 + j, h⟩).val = CertificateData.Part008.rows[j]'(by rw [len008]; exact hc) := by
  have p : 2048 + j - 0 < 8192 := Rows.sub_lt_of_part 2048 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (2048 + j) h _ rfl
  have e := sel_dyadicGroup0 (2048 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2048 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 2048 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 2048 (by decide))).1 (Rows.lt_sub_of_part 2048 j 256 0 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2048 j 0 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link008 : ∀ j < 256, Good (2048 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part008.rows.length := by rw [len008]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨2048 + j, h⟩).property
  rw [dispatch008 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound008.2 j hj')

theorem dispatch009 (j : ℕ) (hc : j < 256) (h : 2304 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨2304 + j, h⟩).val = CertificateData.Part009.rows[j]'(by rw [len009]; exact hc) := by
  have p : 2304 + j - 0 < 8192 := Rows.sub_lt_of_part 2304 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (2304 + j) h _ rfl
  have e := sel_dyadicGroup0 (2304 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2304 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 2304 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 2304 (by decide))).1 (Rows.lt_sub_of_part 2304 j 256 0 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2304 j 0 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link009 : ∀ j < 256, Good (2304 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part009.rows.length := by rw [len009]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨2304 + j, h⟩).property
  rw [dispatch009 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound009.2 j hj')


end FKLBridge.Dyadic
