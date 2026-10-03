module

public import FKLBridge.Dyadic.Link00
public import FKLBridge.Dyadic.Link01
public import FKLBridge.Dyadic.Link02
public import FKLBridge.Dyadic.Link03
public import FKLBridge.Dyadic.Link04
public import FKLBridge.Dyadic.Link05

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric

theorem good_all : ∀ r < 15279, Good r := by
  have h0 : ∀ r < 0, Good r := Rows.range_zero
  have h1 := Rows.range_step 0 256 256 rfl h0 link000
  have h2 := Rows.range_step 256 256 512 rfl h1 link001
  have h3 := Rows.range_step 512 256 768 rfl h2 link002
  have h4 := Rows.range_step 768 256 1024 rfl h3 link003
  have h5 := Rows.range_step 1024 256 1280 rfl h4 link004
  have h6 := Rows.range_step 1280 256 1536 rfl h5 link005
  have h7 := Rows.range_step 1536 256 1792 rfl h6 link006
  have h8 := Rows.range_step 1792 256 2048 rfl h7 link007
  have h9 := Rows.range_step 2048 256 2304 rfl h8 link008
  have h10 := Rows.range_step 2304 256 2560 rfl h9 link009
  have h11 := Rows.range_step 2560 256 2816 rfl h10 link010
  have h12 := Rows.range_step 2816 256 3072 rfl h11 link011
  have h13 := Rows.range_step 3072 256 3328 rfl h12 link012
  have h14 := Rows.range_step 3328 256 3584 rfl h13 link013
  have h15 := Rows.range_step 3584 256 3840 rfl h14 link014
  have h16 := Rows.range_step 3840 256 4096 rfl h15 link015
  have h17 := Rows.range_step 4096 256 4352 rfl h16 link016
  have h18 := Rows.range_step 4352 256 4608 rfl h17 link017
  have h19 := Rows.range_step 4608 256 4864 rfl h18 link018
  have h20 := Rows.range_step 4864 256 5120 rfl h19 link019
  have h21 := Rows.range_step 5120 256 5376 rfl h20 link020
  have h22 := Rows.range_step 5376 256 5632 rfl h21 link021
  have h23 := Rows.range_step 5632 256 5888 rfl h22 link022
  have h24 := Rows.range_step 5888 256 6144 rfl h23 link023
  have h25 := Rows.range_step 6144 256 6400 rfl h24 link024
  have h26 := Rows.range_step 6400 256 6656 rfl h25 link025
  have h27 := Rows.range_step 6656 256 6912 rfl h26 link026
  have h28 := Rows.range_step 6912 256 7168 rfl h27 link027
  have h29 := Rows.range_step 7168 256 7424 rfl h28 link028
  have h30 := Rows.range_step 7424 256 7680 rfl h29 link029
  have h31 := Rows.range_step 7680 256 7936 rfl h30 link030
  have h32 := Rows.range_step 7936 256 8192 rfl h31 link031
  have h33 := Rows.range_step 8192 256 8448 rfl h32 link032
  have h34 := Rows.range_step 8448 256 8704 rfl h33 link033
  have h35 := Rows.range_step 8704 256 8960 rfl h34 link034
  have h36 := Rows.range_step 8960 256 9216 rfl h35 link035
  have h37 := Rows.range_step 9216 256 9472 rfl h36 link036
  have h38 := Rows.range_step 9472 256 9728 rfl h37 link037
  have h39 := Rows.range_step 9728 256 9984 rfl h38 link038
  have h40 := Rows.range_step 9984 256 10240 rfl h39 link039
  have h41 := Rows.range_step 10240 256 10496 rfl h40 link040
  have h42 := Rows.range_step 10496 256 10752 rfl h41 link041
  have h43 := Rows.range_step 10752 256 11008 rfl h42 link042
  have h44 := Rows.range_step 11008 256 11264 rfl h43 link043
  have h45 := Rows.range_step 11264 256 11520 rfl h44 link044
  have h46 := Rows.range_step 11520 256 11776 rfl h45 link045
  have h47 := Rows.range_step 11776 256 12032 rfl h46 link046
  have h48 := Rows.range_step 12032 256 12288 rfl h47 link047
  have h49 := Rows.range_step 12288 256 12544 rfl h48 link048
  have h50 := Rows.range_step 12544 256 12800 rfl h49 link049
  have h51 := Rows.range_step 12800 256 13056 rfl h50 link050
  have h52 := Rows.range_step 13056 256 13312 rfl h51 link051
  have h53 := Rows.range_step 13312 256 13568 rfl h52 link052
  have h54 := Rows.range_step 13568 256 13824 rfl h53 link053
  have h55 := Rows.range_step 13824 256 14080 rfl h54 link054
  have h56 := Rows.range_step 14080 256 14336 rfl h55 link055
  have h57 := Rows.range_step 14336 256 14592 rfl h56 link056
  have h58 := Rows.range_step 14592 256 14848 rfl h57 link057
  have h59 := Rows.range_step 14848 256 15104 rfl h58 link058
  have h60 := Rows.range_step 15104 175 15279 rfl h59 link059
  exact h60

theorem width_eq (r : Fin 15279) : width r.val = (IndexedCertificateRows.dyadic r).val.width := (good_all r.val r.isLt r.isLt).1

theorem cell_eq (r : Fin 15279) (c : ℕ) (hc : c < (IndexedCertificateRows.dyadic r).val.width) : cell r.val c = (IndexedCertificateRows.dyadic r).val.atColumn c :=
  (good_all r.val r.isLt r.isLt).2 c hc

end FKLBridge.Dyadic
