module

public import FKLBridge.Split.Check00
public import FKLBridge.Split.Check01
public import FKLBridge.Split.Check02
public import FKLBridge.Split.Check03
public import FKLBridge.Split.Check04
public import FKLBridge.Split.Check05
public import FKLBridge.Split.Check06
public import FKLBridge.Split.Check07
public import FKLBridge.Split.Check08

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- One pass over the dispatch chain of `splitGroup0`, nested by its own conditions. -/
theorem sel_splitGroup0 (i : ℕ) (h : i < 2048) : ∀ v, (IndexedCertificateRows.splitGroup0 ⟨i, h⟩).val = v →
    (i < 64 → some v = SplitCertificateData.Part000.rows[i - 0]?) ∧ (¬ i < 64 → (i < 128 → some v = SplitCertificateData.Part001.rows[i - 64]?) ∧ (¬ i < 128 → (i < 192 → some v = SplitCertificateData.Part002.rows[i - 128]?) ∧ (¬ i < 192 → (i < 256 → some v = SplitCertificateData.Part003.rows[i - 192]?) ∧ (¬ i < 256 → (i < 320 → some v = SplitCertificateData.Part004.rows[i - 256]?) ∧ (¬ i < 320 → (i < 384 → some v = SplitCertificateData.Part005.rows[i - 320]?) ∧ (¬ i < 384 → (i < 448 → some v = SplitCertificateData.Part006.rows[i - 384]?) ∧ (¬ i < 448 → (i < 512 → some v = SplitCertificateData.Part007.rows[i - 448]?) ∧ (¬ i < 512 → (i < 576 → some v = SplitCertificateData.Part008.rows[i - 512]?) ∧ (¬ i < 576 → (i < 640 → some v = SplitCertificateData.Part009.rows[i - 576]?) ∧ (¬ i < 640 → (i < 704 → some v = SplitCertificateData.Part010.rows[i - 640]?) ∧ (¬ i < 704 → (i < 768 → some v = SplitCertificateData.Part011.rows[i - 704]?) ∧ (¬ i < 768 → (i < 832 → some v = SplitCertificateData.Part012.rows[i - 768]?) ∧ (¬ i < 832 → (i < 896 → some v = SplitCertificateData.Part013.rows[i - 832]?) ∧ (¬ i < 896 → (i < 960 → some v = SplitCertificateData.Part014.rows[i - 896]?) ∧ (¬ i < 960 → (i < 1024 → some v = SplitCertificateData.Part015.rows[i - 960]?) ∧ (¬ i < 1024 → (i < 1088 → some v = SplitCertificateData.Part016.rows[i - 1024]?) ∧ (¬ i < 1088 → (i < 1152 → some v = SplitCertificateData.Part017.rows[i - 1088]?) ∧ (¬ i < 1152 → (i < 1216 → some v = SplitCertificateData.Part018.rows[i - 1152]?) ∧ (¬ i < 1216 → (i < 1280 → some v = SplitCertificateData.Part019.rows[i - 1216]?) ∧ (¬ i < 1280 → (i < 1344 → some v = SplitCertificateData.Part020.rows[i - 1280]?) ∧ (¬ i < 1344 → (i < 1408 → some v = SplitCertificateData.Part021.rows[i - 1344]?) ∧ (¬ i < 1408 → (i < 1472 → some v = SplitCertificateData.Part022.rows[i - 1408]?) ∧ (¬ i < 1472 → (i < 1536 → some v = SplitCertificateData.Part023.rows[i - 1472]?) ∧ (¬ i < 1536 → (i < 1600 → some v = SplitCertificateData.Part024.rows[i - 1536]?) ∧ (¬ i < 1600 → (i < 1664 → some v = SplitCertificateData.Part025.rows[i - 1600]?) ∧ (¬ i < 1664 → (i < 1728 → some v = SplitCertificateData.Part026.rows[i - 1664]?) ∧ (¬ i < 1728 → (i < 1792 → some v = SplitCertificateData.Part027.rows[i - 1728]?) ∧ (¬ i < 1792 → (i < 1856 → some v = SplitCertificateData.Part028.rows[i - 1792]?) ∧ (¬ i < 1856 → (i < 1920 → some v = SplitCertificateData.Part029.rows[i - 1856]?) ∧ (¬ i < 1920 → (i < 1984 → some v = SplitCertificateData.Part030.rows[i - 1920]?) ∧ (¬ i < 1984 → some v = SplitCertificateData.Part031.rows[i - 1984]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.splitGroup0 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part000.rows (i - 0) (Rows.idx_lt_len _ 64 i 0 64 len000 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part001.rows (i - 64) (Rows.idx_lt_len _ 64 i 64 128 len001 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part002.rows (i - 128) (Rows.idx_lt_len _ 64 i 128 192 len002 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part003.rows (i - 192) (Rows.idx_lt_len _ 64 i 192 256 len003 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part004.rows (i - 256) (Rows.idx_lt_len _ 64 i 256 320 len004 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part005.rows (i - 320) (Rows.idx_lt_len _ 64 i 320 384 len005 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part006.rows (i - 384) (Rows.idx_lt_len _ 64 i 384 448 len006 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part007.rows (i - 448) (Rows.idx_lt_len _ 64 i 448 512 len007 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part008.rows (i - 512) (Rows.idx_lt_len _ 64 i 512 576 len008 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part009.rows (i - 576) (Rows.idx_lt_len _ 64 i 576 640 len009 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part010.rows (i - 640) (Rows.idx_lt_len _ 64 i 640 704 len010 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part011.rows (i - 704) (Rows.idx_lt_len _ 64 i 704 768 len011 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part012.rows (i - 768) (Rows.idx_lt_len _ 64 i 768 832 len012 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part013.rows (i - 832) (Rows.idx_lt_len _ 64 i 832 896 len013 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part014.rows (i - 896) (Rows.idx_lt_len _ 64 i 896 960 len014 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part015.rows (i - 960) (Rows.idx_lt_len _ 64 i 960 1024 len015 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part016.rows (i - 1024) (Rows.idx_lt_len _ 64 i 1024 1088 len016 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part017.rows (i - 1088) (Rows.idx_lt_len _ 64 i 1088 1152 len017 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part018.rows (i - 1152) (Rows.idx_lt_len _ 64 i 1152 1216 len018 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part019.rows (i - 1216) (Rows.idx_lt_len _ 64 i 1216 1280 len019 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part020.rows (i - 1280) (Rows.idx_lt_len _ 64 i 1280 1344 len020 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part021.rows (i - 1344) (Rows.idx_lt_len _ 64 i 1344 1408 len021 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part022.rows (i - 1408) (Rows.idx_lt_len _ 64 i 1408 1472 len022 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part023.rows (i - 1472) (Rows.idx_lt_len _ 64 i 1472 1536 len023 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part024.rows (i - 1536) (Rows.idx_lt_len _ 64 i 1536 1600 len024 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part025.rows (i - 1600) (Rows.idx_lt_len _ 64 i 1600 1664 len025 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part026.rows (i - 1664) (Rows.idx_lt_len _ 64 i 1664 1728 len026 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part027.rows (i - 1728) (Rows.idx_lt_len _ 64 i 1728 1792 len027 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part028.rows (i - 1792) (Rows.idx_lt_len _ 64 i 1792 1856 len028 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part029.rows (i - 1856) (Rows.idx_lt_len _ 64 i 1856 1920 len029 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part030.rows (i - 1920) (Rows.idx_lt_len _ 64 i 1920 1984 len030 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv SplitCertificateData.Part031.rows (i - 1984) (Rows.idx_lt_len _ 64 i 1984 2048 len031 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `splitGroup1`, nested by its own conditions. -/
theorem sel_splitGroup1 (i : ℕ) (h : i < 2048) : ∀ v, (IndexedCertificateRows.splitGroup1 ⟨i, h⟩).val = v →
    (i < 64 → some v = SplitCertificateData.Part032.rows[i - 0]?) ∧ (¬ i < 64 → (i < 128 → some v = SplitCertificateData.Part033.rows[i - 64]?) ∧ (¬ i < 128 → (i < 192 → some v = SplitCertificateData.Part034.rows[i - 128]?) ∧ (¬ i < 192 → (i < 256 → some v = SplitCertificateData.Part035.rows[i - 192]?) ∧ (¬ i < 256 → (i < 320 → some v = SplitCertificateData.Part036.rows[i - 256]?) ∧ (¬ i < 320 → (i < 384 → some v = SplitCertificateData.Part037.rows[i - 320]?) ∧ (¬ i < 384 → (i < 448 → some v = SplitCertificateData.Part038.rows[i - 384]?) ∧ (¬ i < 448 → (i < 512 → some v = SplitCertificateData.Part039.rows[i - 448]?) ∧ (¬ i < 512 → (i < 576 → some v = SplitCertificateData.Part040.rows[i - 512]?) ∧ (¬ i < 576 → (i < 640 → some v = SplitCertificateData.Part041.rows[i - 576]?) ∧ (¬ i < 640 → (i < 704 → some v = SplitCertificateData.Part042.rows[i - 640]?) ∧ (¬ i < 704 → (i < 768 → some v = SplitCertificateData.Part043.rows[i - 704]?) ∧ (¬ i < 768 → (i < 832 → some v = SplitCertificateData.Part044.rows[i - 768]?) ∧ (¬ i < 832 → (i < 896 → some v = SplitCertificateData.Part045.rows[i - 832]?) ∧ (¬ i < 896 → (i < 960 → some v = SplitCertificateData.Part046.rows[i - 896]?) ∧ (¬ i < 960 → (i < 1024 → some v = SplitCertificateData.Part047.rows[i - 960]?) ∧ (¬ i < 1024 → (i < 1088 → some v = SplitCertificateData.Part048.rows[i - 1024]?) ∧ (¬ i < 1088 → (i < 1152 → some v = SplitCertificateData.Part049.rows[i - 1088]?) ∧ (¬ i < 1152 → (i < 1216 → some v = SplitCertificateData.Part050.rows[i - 1152]?) ∧ (¬ i < 1216 → (i < 1280 → some v = SplitCertificateData.Part051.rows[i - 1216]?) ∧ (¬ i < 1280 → (i < 1344 → some v = SplitCertificateData.Part052.rows[i - 1280]?) ∧ (¬ i < 1344 → (i < 1408 → some v = SplitCertificateData.Part053.rows[i - 1344]?) ∧ (¬ i < 1408 → (i < 1472 → some v = SplitCertificateData.Part054.rows[i - 1408]?) ∧ (¬ i < 1472 → (i < 1536 → some v = SplitCertificateData.Part055.rows[i - 1472]?) ∧ (¬ i < 1536 → (i < 1600 → some v = SplitCertificateData.Part056.rows[i - 1536]?) ∧ (¬ i < 1600 → (i < 1664 → some v = SplitCertificateData.Part057.rows[i - 1600]?) ∧ (¬ i < 1664 → (i < 1728 → some v = SplitCertificateData.Part058.rows[i - 1664]?) ∧ (¬ i < 1728 → (i < 1792 → some v = SplitCertificateData.Part059.rows[i - 1728]?) ∧ (¬ i < 1792 → (i < 1856 → some v = SplitCertificateData.Part060.rows[i - 1792]?) ∧ (¬ i < 1856 → (i < 1920 → some v = SplitCertificateData.Part061.rows[i - 1856]?) ∧ (¬ i < 1920 → (i < 1984 → some v = SplitCertificateData.Part062.rows[i - 1920]?) ∧ (¬ i < 1984 → some v = SplitCertificateData.Part063.rows[i - 1984]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.splitGroup1 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part032.rows (i - 0) (Rows.idx_lt_len _ 64 i 0 64 len032 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part033.rows (i - 64) (Rows.idx_lt_len _ 64 i 64 128 len033 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part034.rows (i - 128) (Rows.idx_lt_len _ 64 i 128 192 len034 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part035.rows (i - 192) (Rows.idx_lt_len _ 64 i 192 256 len035 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part036.rows (i - 256) (Rows.idx_lt_len _ 64 i 256 320 len036 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part037.rows (i - 320) (Rows.idx_lt_len _ 64 i 320 384 len037 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part038.rows (i - 384) (Rows.idx_lt_len _ 64 i 384 448 len038 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part039.rows (i - 448) (Rows.idx_lt_len _ 64 i 448 512 len039 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part040.rows (i - 512) (Rows.idx_lt_len _ 64 i 512 576 len040 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part041.rows (i - 576) (Rows.idx_lt_len _ 64 i 576 640 len041 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part042.rows (i - 640) (Rows.idx_lt_len _ 64 i 640 704 len042 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part043.rows (i - 704) (Rows.idx_lt_len _ 64 i 704 768 len043 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part044.rows (i - 768) (Rows.idx_lt_len _ 64 i 768 832 len044 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part045.rows (i - 832) (Rows.idx_lt_len _ 64 i 832 896 len045 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part046.rows (i - 896) (Rows.idx_lt_len _ 64 i 896 960 len046 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part047.rows (i - 960) (Rows.idx_lt_len _ 64 i 960 1024 len047 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part048.rows (i - 1024) (Rows.idx_lt_len _ 64 i 1024 1088 len048 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part049.rows (i - 1088) (Rows.idx_lt_len _ 64 i 1088 1152 len049 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part050.rows (i - 1152) (Rows.idx_lt_len _ 64 i 1152 1216 len050 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part051.rows (i - 1216) (Rows.idx_lt_len _ 64 i 1216 1280 len051 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part052.rows (i - 1280) (Rows.idx_lt_len _ 64 i 1280 1344 len052 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part053.rows (i - 1344) (Rows.idx_lt_len _ 64 i 1344 1408 len053 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part054.rows (i - 1408) (Rows.idx_lt_len _ 64 i 1408 1472 len054 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part055.rows (i - 1472) (Rows.idx_lt_len _ 64 i 1472 1536 len055 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part056.rows (i - 1536) (Rows.idx_lt_len _ 64 i 1536 1600 len056 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part057.rows (i - 1600) (Rows.idx_lt_len _ 64 i 1600 1664 len057 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part058.rows (i - 1664) (Rows.idx_lt_len _ 64 i 1664 1728 len058 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part059.rows (i - 1728) (Rows.idx_lt_len _ 64 i 1728 1792 len059 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part060.rows (i - 1792) (Rows.idx_lt_len _ 64 i 1792 1856 len060 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part061.rows (i - 1856) (Rows.idx_lt_len _ 64 i 1856 1920 len061 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part062.rows (i - 1920) (Rows.idx_lt_len _ 64 i 1920 1984 len062 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv SplitCertificateData.Part063.rows (i - 1984) (Rows.idx_lt_len _ 64 i 1984 2048 len063 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `splitGroup2`, nested by its own conditions. -/
theorem sel_splitGroup2 (i : ℕ) (h : i < 1446) : ∀ v, (IndexedCertificateRows.splitGroup2 ⟨i, h⟩).val = v →
    (i < 64 → some v = SplitCertificateData.Part064.rows[i - 0]?) ∧ (¬ i < 64 → (i < 128 → some v = SplitCertificateData.Part065.rows[i - 64]?) ∧ (¬ i < 128 → (i < 192 → some v = SplitCertificateData.Part066.rows[i - 128]?) ∧ (¬ i < 192 → (i < 256 → some v = SplitCertificateData.Part067.rows[i - 192]?) ∧ (¬ i < 256 → (i < 320 → some v = SplitCertificateData.Part068.rows[i - 256]?) ∧ (¬ i < 320 → (i < 384 → some v = SplitCertificateData.Part069.rows[i - 320]?) ∧ (¬ i < 384 → (i < 448 → some v = SplitCertificateData.Part070.rows[i - 384]?) ∧ (¬ i < 448 → (i < 512 → some v = SplitCertificateData.Part071.rows[i - 448]?) ∧ (¬ i < 512 → (i < 576 → some v = SplitCertificateData.Part072.rows[i - 512]?) ∧ (¬ i < 576 → (i < 640 → some v = SplitCertificateData.Part073.rows[i - 576]?) ∧ (¬ i < 640 → (i < 704 → some v = SplitCertificateData.Part074.rows[i - 640]?) ∧ (¬ i < 704 → (i < 768 → some v = SplitCertificateData.Part075.rows[i - 704]?) ∧ (¬ i < 768 → (i < 832 → some v = SplitCertificateData.Part076.rows[i - 768]?) ∧ (¬ i < 832 → (i < 896 → some v = SplitCertificateData.Part077.rows[i - 832]?) ∧ (¬ i < 896 → (i < 960 → some v = SplitCertificateData.Part078.rows[i - 896]?) ∧ (¬ i < 960 → (i < 1024 → some v = SplitCertificateData.Part079.rows[i - 960]?) ∧ (¬ i < 1024 → (i < 1088 → some v = SplitCertificateData.Part080.rows[i - 1024]?) ∧ (¬ i < 1088 → (i < 1152 → some v = SplitCertificateData.Part081.rows[i - 1088]?) ∧ (¬ i < 1152 → (i < 1216 → some v = SplitCertificateData.Part082.rows[i - 1152]?) ∧ (¬ i < 1216 → (i < 1280 → some v = SplitCertificateData.Part083.rows[i - 1216]?) ∧ (¬ i < 1280 → (i < 1344 → some v = SplitCertificateData.Part084.rows[i - 1280]?) ∧ (¬ i < 1344 → (i < 1408 → some v = SplitCertificateData.Part085.rows[i - 1344]?) ∧ (¬ i < 1408 → some v = SplitCertificateData.Part086.rows[i - 1408]?)))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.splitGroup2 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part064.rows (i - 0) (Rows.idx_lt_len _ 64 i 0 64 len064 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part065.rows (i - 64) (Rows.idx_lt_len _ 64 i 64 128 len065 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part066.rows (i - 128) (Rows.idx_lt_len _ 64 i 128 192 len066 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part067.rows (i - 192) (Rows.idx_lt_len _ 64 i 192 256 len067 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part068.rows (i - 256) (Rows.idx_lt_len _ 64 i 256 320 len068 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part069.rows (i - 320) (Rows.idx_lt_len _ 64 i 320 384 len069 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part070.rows (i - 384) (Rows.idx_lt_len _ 64 i 384 448 len070 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part071.rows (i - 448) (Rows.idx_lt_len _ 64 i 448 512 len071 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part072.rows (i - 512) (Rows.idx_lt_len _ 64 i 512 576 len072 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part073.rows (i - 576) (Rows.idx_lt_len _ 64 i 576 640 len073 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part074.rows (i - 640) (Rows.idx_lt_len _ 64 i 640 704 len074 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part075.rows (i - 704) (Rows.idx_lt_len _ 64 i 704 768 len075 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part076.rows (i - 768) (Rows.idx_lt_len _ 64 i 768 832 len076 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part077.rows (i - 832) (Rows.idx_lt_len _ 64 i 832 896 len077 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part078.rows (i - 896) (Rows.idx_lt_len _ 64 i 896 960 len078 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part079.rows (i - 960) (Rows.idx_lt_len _ 64 i 960 1024 len079 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part080.rows (i - 1024) (Rows.idx_lt_len _ 64 i 1024 1088 len080 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part081.rows (i - 1088) (Rows.idx_lt_len _ 64 i 1088 1152 len081 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part082.rows (i - 1152) (Rows.idx_lt_len _ 64 i 1152 1216 len082 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part083.rows (i - 1216) (Rows.idx_lt_len _ 64 i 1216 1280 len083 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part084.rows (i - 1280) (Rows.idx_lt_len _ 64 i 1280 1344 len084 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk SplitCertificateData.Part085.rows (i - 1344) (Rows.idx_lt_len _ 64 i 1344 1408 len085 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv SplitCertificateData.Part086.rows (i - 1408) (Rows.idx_lt_len _ 38 i 1408 1446 len086 h (by decide) (by decide)) rfl

/-- One pass over the top-level dispatch of `split`. -/
theorem sel_top (r : ℕ) (h : r < 5542) : ∀ v, (IndexedCertificateRows.split ⟨r, h⟩).val = v →
    (r < 2048 → ∀ p : r - 0 < 2048, (IndexedCertificateRows.splitGroup0 ⟨r - 0, p⟩).val = v) ∧ (¬ r < 2048 → (r < 4096 → ∀ p : r - 2048 < 2048, (IndexedCertificateRows.splitGroup1 ⟨r - 2048, p⟩).val = v) ∧ (¬ r < 4096 → ∀ p : r - 4096 < 1446, (IndexedCertificateRows.splitGroup2 ⟨r - 4096, p⟩).val = v)) := by
  intro v hv
  unfold IndexedCertificateRows.split at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact fun p => hv


end FKLBridge.Split
