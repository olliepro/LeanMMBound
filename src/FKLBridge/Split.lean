module

public import FKLBridge.Split.Link00
public import FKLBridge.Split.Link01
public import FKLBridge.Split.Link02
public import FKLBridge.Split.Link03
public import FKLBridge.Split.Link04
public import FKLBridge.Split.Link05
public import FKLBridge.Split.Link06
public import FKLBridge.Split.Link07
public import FKLBridge.Split.Link08

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric

theorem good_all : ∀ r < 5542, Good r := by
  have h0 : ∀ r < 0, Good r := Rows.range_zero
  have h1 := Rows.range_step 0 64 64 rfl h0 link000
  have h2 := Rows.range_step 64 64 128 rfl h1 link001
  have h3 := Rows.range_step 128 64 192 rfl h2 link002
  have h4 := Rows.range_step 192 64 256 rfl h3 link003
  have h5 := Rows.range_step 256 64 320 rfl h4 link004
  have h6 := Rows.range_step 320 64 384 rfl h5 link005
  have h7 := Rows.range_step 384 64 448 rfl h6 link006
  have h8 := Rows.range_step 448 64 512 rfl h7 link007
  have h9 := Rows.range_step 512 64 576 rfl h8 link008
  have h10 := Rows.range_step 576 64 640 rfl h9 link009
  have h11 := Rows.range_step 640 64 704 rfl h10 link010
  have h12 := Rows.range_step 704 64 768 rfl h11 link011
  have h13 := Rows.range_step 768 64 832 rfl h12 link012
  have h14 := Rows.range_step 832 64 896 rfl h13 link013
  have h15 := Rows.range_step 896 64 960 rfl h14 link014
  have h16 := Rows.range_step 960 64 1024 rfl h15 link015
  have h17 := Rows.range_step 1024 64 1088 rfl h16 link016
  have h18 := Rows.range_step 1088 64 1152 rfl h17 link017
  have h19 := Rows.range_step 1152 64 1216 rfl h18 link018
  have h20 := Rows.range_step 1216 64 1280 rfl h19 link019
  have h21 := Rows.range_step 1280 64 1344 rfl h20 link020
  have h22 := Rows.range_step 1344 64 1408 rfl h21 link021
  have h23 := Rows.range_step 1408 64 1472 rfl h22 link022
  have h24 := Rows.range_step 1472 64 1536 rfl h23 link023
  have h25 := Rows.range_step 1536 64 1600 rfl h24 link024
  have h26 := Rows.range_step 1600 64 1664 rfl h25 link025
  have h27 := Rows.range_step 1664 64 1728 rfl h26 link026
  have h28 := Rows.range_step 1728 64 1792 rfl h27 link027
  have h29 := Rows.range_step 1792 64 1856 rfl h28 link028
  have h30 := Rows.range_step 1856 64 1920 rfl h29 link029
  have h31 := Rows.range_step 1920 64 1984 rfl h30 link030
  have h32 := Rows.range_step 1984 64 2048 rfl h31 link031
  have h33 := Rows.range_step 2048 64 2112 rfl h32 link032
  have h34 := Rows.range_step 2112 64 2176 rfl h33 link033
  have h35 := Rows.range_step 2176 64 2240 rfl h34 link034
  have h36 := Rows.range_step 2240 64 2304 rfl h35 link035
  have h37 := Rows.range_step 2304 64 2368 rfl h36 link036
  have h38 := Rows.range_step 2368 64 2432 rfl h37 link037
  have h39 := Rows.range_step 2432 64 2496 rfl h38 link038
  have h40 := Rows.range_step 2496 64 2560 rfl h39 link039
  have h41 := Rows.range_step 2560 64 2624 rfl h40 link040
  have h42 := Rows.range_step 2624 64 2688 rfl h41 link041
  have h43 := Rows.range_step 2688 64 2752 rfl h42 link042
  have h44 := Rows.range_step 2752 64 2816 rfl h43 link043
  have h45 := Rows.range_step 2816 64 2880 rfl h44 link044
  have h46 := Rows.range_step 2880 64 2944 rfl h45 link045
  have h47 := Rows.range_step 2944 64 3008 rfl h46 link046
  have h48 := Rows.range_step 3008 64 3072 rfl h47 link047
  have h49 := Rows.range_step 3072 64 3136 rfl h48 link048
  have h50 := Rows.range_step 3136 64 3200 rfl h49 link049
  have h51 := Rows.range_step 3200 64 3264 rfl h50 link050
  have h52 := Rows.range_step 3264 64 3328 rfl h51 link051
  have h53 := Rows.range_step 3328 64 3392 rfl h52 link052
  have h54 := Rows.range_step 3392 64 3456 rfl h53 link053
  have h55 := Rows.range_step 3456 64 3520 rfl h54 link054
  have h56 := Rows.range_step 3520 64 3584 rfl h55 link055
  have h57 := Rows.range_step 3584 64 3648 rfl h56 link056
  have h58 := Rows.range_step 3648 64 3712 rfl h57 link057
  have h59 := Rows.range_step 3712 64 3776 rfl h58 link058
  have h60 := Rows.range_step 3776 64 3840 rfl h59 link059
  have h61 := Rows.range_step 3840 64 3904 rfl h60 link060
  have h62 := Rows.range_step 3904 64 3968 rfl h61 link061
  have h63 := Rows.range_step 3968 64 4032 rfl h62 link062
  have h64 := Rows.range_step 4032 64 4096 rfl h63 link063
  have h65 := Rows.range_step 4096 64 4160 rfl h64 link064
  have h66 := Rows.range_step 4160 64 4224 rfl h65 link065
  have h67 := Rows.range_step 4224 64 4288 rfl h66 link066
  have h68 := Rows.range_step 4288 64 4352 rfl h67 link067
  have h69 := Rows.range_step 4352 64 4416 rfl h68 link068
  have h70 := Rows.range_step 4416 64 4480 rfl h69 link069
  have h71 := Rows.range_step 4480 64 4544 rfl h70 link070
  have h72 := Rows.range_step 4544 64 4608 rfl h71 link071
  have h73 := Rows.range_step 4608 64 4672 rfl h72 link072
  have h74 := Rows.range_step 4672 64 4736 rfl h73 link073
  have h75 := Rows.range_step 4736 64 4800 rfl h74 link074
  have h76 := Rows.range_step 4800 64 4864 rfl h75 link075
  have h77 := Rows.range_step 4864 64 4928 rfl h76 link076
  have h78 := Rows.range_step 4928 64 4992 rfl h77 link077
  have h79 := Rows.range_step 4992 64 5056 rfl h78 link078
  have h80 := Rows.range_step 5056 64 5120 rfl h79 link079
  have h81 := Rows.range_step 5120 64 5184 rfl h80 link080
  have h82 := Rows.range_step 5184 64 5248 rfl h81 link081
  have h83 := Rows.range_step 5248 64 5312 rfl h82 link082
  have h84 := Rows.range_step 5312 64 5376 rfl h83 link083
  have h85 := Rows.range_step 5376 64 5440 rfl h84 link084
  have h86 := Rows.range_step 5440 64 5504 rfl h85 link085
  have h87 := Rows.range_step 5504 38 5542 rfl h86 link086
  exact h87

theorem parentX_eq (r : Fin 5542) : parentX r.val = (IndexedCertificateRows.split r).val.parent.x := (good_all r.val r.isLt r.isLt).1
theorem parentY_eq (r : Fin 5542) : parentY r.val = (IndexedCertificateRows.split r).val.parent.y := (good_all r.val r.isLt r.isLt).2.1
theorem parentZ_eq (r : Fin 5542) : parentZ r.val = (IndexedCertificateRows.split r).val.parent.z := (good_all r.val r.isLt r.isLt).2.2.1
theorem childTotal_eq (r : Fin 5542) : childTotal r.val = (IndexedCertificateRows.split r).val.childTotal := (good_all r.val r.isLt r.isLt).2.2.2.1
theorem width_eq (r : Fin 5542) : width r.val = (IndexedCertificateRows.split r).val.row.width := (good_all r.val r.isLt r.isLt).2.2.2.2.1

theorem cell_eq (r : Fin 5542) (c : ℕ) (hc : c < (IndexedCertificateRows.split r).val.row.width) : cell r.val c = (IndexedCertificateRows.split r).val.row.atColumn c :=
  (good_all r.val r.isLt r.isLt).2.2.2.2.2 c hc

end FKLBridge.Split
