module

public import FKLBridge.Gibbs.Link00
public import FKLBridge.Gibbs.Link01
public import FKLBridge.Gibbs.Link02
public import FKLBridge.Gibbs.Link03
public import FKLBridge.Gibbs.Link04
public import FKLBridge.Gibbs.Link05
public import FKLBridge.Gibbs.Link06
public import FKLBridge.Gibbs.Link07
public import FKLBridge.Gibbs.Link08
public import FKLBridge.Gibbs.Link09
public import FKLBridge.Gibbs.Link10
public import FKLBridge.Gibbs.Link11
public import FKLBridge.Gibbs.Link12

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric

theorem good_all : ∀ r < 16629, Good r := by
  have h0 : ∀ r < 0, Good r := Rows.range_zero
  have h1 := Rows.range_step 0 128 128 rfl h0 link000
  have h2 := Rows.range_step 128 128 256 rfl h1 link001
  have h3 := Rows.range_step 256 128 384 rfl h2 link002
  have h4 := Rows.range_step 384 128 512 rfl h3 link003
  have h5 := Rows.range_step 512 128 640 rfl h4 link004
  have h6 := Rows.range_step 640 128 768 rfl h5 link005
  have h7 := Rows.range_step 768 128 896 rfl h6 link006
  have h8 := Rows.range_step 896 128 1024 rfl h7 link007
  have h9 := Rows.range_step 1024 128 1152 rfl h8 link008
  have h10 := Rows.range_step 1152 128 1280 rfl h9 link009
  have h11 := Rows.range_step 1280 128 1408 rfl h10 link010
  have h12 := Rows.range_step 1408 128 1536 rfl h11 link011
  have h13 := Rows.range_step 1536 128 1664 rfl h12 link012
  have h14 := Rows.range_step 1664 128 1792 rfl h13 link013
  have h15 := Rows.range_step 1792 128 1920 rfl h14 link014
  have h16 := Rows.range_step 1920 128 2048 rfl h15 link015
  have h17 := Rows.range_step 2048 128 2176 rfl h16 link016
  have h18 := Rows.range_step 2176 128 2304 rfl h17 link017
  have h19 := Rows.range_step 2304 128 2432 rfl h18 link018
  have h20 := Rows.range_step 2432 128 2560 rfl h19 link019
  have h21 := Rows.range_step 2560 128 2688 rfl h20 link020
  have h22 := Rows.range_step 2688 128 2816 rfl h21 link021
  have h23 := Rows.range_step 2816 128 2944 rfl h22 link022
  have h24 := Rows.range_step 2944 128 3072 rfl h23 link023
  have h25 := Rows.range_step 3072 128 3200 rfl h24 link024
  have h26 := Rows.range_step 3200 128 3328 rfl h25 link025
  have h27 := Rows.range_step 3328 128 3456 rfl h26 link026
  have h28 := Rows.range_step 3456 128 3584 rfl h27 link027
  have h29 := Rows.range_step 3584 128 3712 rfl h28 link028
  have h30 := Rows.range_step 3712 128 3840 rfl h29 link029
  have h31 := Rows.range_step 3840 128 3968 rfl h30 link030
  have h32 := Rows.range_step 3968 128 4096 rfl h31 link031
  have h33 := Rows.range_step 4096 128 4224 rfl h32 link032
  have h34 := Rows.range_step 4224 128 4352 rfl h33 link033
  have h35 := Rows.range_step 4352 128 4480 rfl h34 link034
  have h36 := Rows.range_step 4480 128 4608 rfl h35 link035
  have h37 := Rows.range_step 4608 128 4736 rfl h36 link036
  have h38 := Rows.range_step 4736 128 4864 rfl h37 link037
  have h39 := Rows.range_step 4864 128 4992 rfl h38 link038
  have h40 := Rows.range_step 4992 128 5120 rfl h39 link039
  have h41 := Rows.range_step 5120 128 5248 rfl h40 link040
  have h42 := Rows.range_step 5248 128 5376 rfl h41 link041
  have h43 := Rows.range_step 5376 128 5504 rfl h42 link042
  have h44 := Rows.range_step 5504 128 5632 rfl h43 link043
  have h45 := Rows.range_step 5632 128 5760 rfl h44 link044
  have h46 := Rows.range_step 5760 128 5888 rfl h45 link045
  have h47 := Rows.range_step 5888 128 6016 rfl h46 link046
  have h48 := Rows.range_step 6016 128 6144 rfl h47 link047
  have h49 := Rows.range_step 6144 128 6272 rfl h48 link048
  have h50 := Rows.range_step 6272 128 6400 rfl h49 link049
  have h51 := Rows.range_step 6400 128 6528 rfl h50 link050
  have h52 := Rows.range_step 6528 128 6656 rfl h51 link051
  have h53 := Rows.range_step 6656 128 6784 rfl h52 link052
  have h54 := Rows.range_step 6784 128 6912 rfl h53 link053
  have h55 := Rows.range_step 6912 128 7040 rfl h54 link054
  have h56 := Rows.range_step 7040 128 7168 rfl h55 link055
  have h57 := Rows.range_step 7168 128 7296 rfl h56 link056
  have h58 := Rows.range_step 7296 128 7424 rfl h57 link057
  have h59 := Rows.range_step 7424 128 7552 rfl h58 link058
  have h60 := Rows.range_step 7552 128 7680 rfl h59 link059
  have h61 := Rows.range_step 7680 128 7808 rfl h60 link060
  have h62 := Rows.range_step 7808 128 7936 rfl h61 link061
  have h63 := Rows.range_step 7936 128 8064 rfl h62 link062
  have h64 := Rows.range_step 8064 128 8192 rfl h63 link063
  have h65 := Rows.range_step 8192 128 8320 rfl h64 link064
  have h66 := Rows.range_step 8320 128 8448 rfl h65 link065
  have h67 := Rows.range_step 8448 128 8576 rfl h66 link066
  have h68 := Rows.range_step 8576 128 8704 rfl h67 link067
  have h69 := Rows.range_step 8704 128 8832 rfl h68 link068
  have h70 := Rows.range_step 8832 128 8960 rfl h69 link069
  have h71 := Rows.range_step 8960 128 9088 rfl h70 link070
  have h72 := Rows.range_step 9088 128 9216 rfl h71 link071
  have h73 := Rows.range_step 9216 128 9344 rfl h72 link072
  have h74 := Rows.range_step 9344 128 9472 rfl h73 link073
  have h75 := Rows.range_step 9472 128 9600 rfl h74 link074
  have h76 := Rows.range_step 9600 128 9728 rfl h75 link075
  have h77 := Rows.range_step 9728 128 9856 rfl h76 link076
  have h78 := Rows.range_step 9856 128 9984 rfl h77 link077
  have h79 := Rows.range_step 9984 128 10112 rfl h78 link078
  have h80 := Rows.range_step 10112 128 10240 rfl h79 link079
  have h81 := Rows.range_step 10240 128 10368 rfl h80 link080
  have h82 := Rows.range_step 10368 128 10496 rfl h81 link081
  have h83 := Rows.range_step 10496 128 10624 rfl h82 link082
  have h84 := Rows.range_step 10624 128 10752 rfl h83 link083
  have h85 := Rows.range_step 10752 128 10880 rfl h84 link084
  have h86 := Rows.range_step 10880 128 11008 rfl h85 link085
  have h87 := Rows.range_step 11008 128 11136 rfl h86 link086
  have h88 := Rows.range_step 11136 128 11264 rfl h87 link087
  have h89 := Rows.range_step 11264 128 11392 rfl h88 link088
  have h90 := Rows.range_step 11392 128 11520 rfl h89 link089
  have h91 := Rows.range_step 11520 128 11648 rfl h90 link090
  have h92 := Rows.range_step 11648 128 11776 rfl h91 link091
  have h93 := Rows.range_step 11776 128 11904 rfl h92 link092
  have h94 := Rows.range_step 11904 128 12032 rfl h93 link093
  have h95 := Rows.range_step 12032 128 12160 rfl h94 link094
  have h96 := Rows.range_step 12160 128 12288 rfl h95 link095
  have h97 := Rows.range_step 12288 128 12416 rfl h96 link096
  have h98 := Rows.range_step 12416 128 12544 rfl h97 link097
  have h99 := Rows.range_step 12544 128 12672 rfl h98 link098
  have h100 := Rows.range_step 12672 128 12800 rfl h99 link099
  have h101 := Rows.range_step 12800 128 12928 rfl h100 link100
  have h102 := Rows.range_step 12928 128 13056 rfl h101 link101
  have h103 := Rows.range_step 13056 128 13184 rfl h102 link102
  have h104 := Rows.range_step 13184 128 13312 rfl h103 link103
  have h105 := Rows.range_step 13312 128 13440 rfl h104 link104
  have h106 := Rows.range_step 13440 128 13568 rfl h105 link105
  have h107 := Rows.range_step 13568 128 13696 rfl h106 link106
  have h108 := Rows.range_step 13696 128 13824 rfl h107 link107
  have h109 := Rows.range_step 13824 128 13952 rfl h108 link108
  have h110 := Rows.range_step 13952 128 14080 rfl h109 link109
  have h111 := Rows.range_step 14080 128 14208 rfl h110 link110
  have h112 := Rows.range_step 14208 128 14336 rfl h111 link111
  have h113 := Rows.range_step 14336 128 14464 rfl h112 link112
  have h114 := Rows.range_step 14464 128 14592 rfl h113 link113
  have h115 := Rows.range_step 14592 128 14720 rfl h114 link114
  have h116 := Rows.range_step 14720 128 14848 rfl h115 link115
  have h117 := Rows.range_step 14848 128 14976 rfl h116 link116
  have h118 := Rows.range_step 14976 128 15104 rfl h117 link117
  have h119 := Rows.range_step 15104 128 15232 rfl h118 link118
  have h120 := Rows.range_step 15232 128 15360 rfl h119 link119
  have h121 := Rows.range_step 15360 128 15488 rfl h120 link120
  have h122 := Rows.range_step 15488 128 15616 rfl h121 link121
  have h123 := Rows.range_step 15616 128 15744 rfl h122 link122
  have h124 := Rows.range_step 15744 128 15872 rfl h123 link123
  have h125 := Rows.range_step 15872 128 16000 rfl h124 link124
  have h126 := Rows.range_step 16000 128 16128 rfl h125 link125
  have h127 := Rows.range_step 16128 128 16256 rfl h126 link126
  have h128 := Rows.range_step 16256 128 16384 rfl h127 link127
  have h129 := Rows.range_step 16384 128 16512 rfl h128 link128
  have h130 := Rows.range_step 16512 117 16629 rfl h129 link129
  exact h130

theorem length_eq (r : Fin 16629) : length r.val = (IndexedCertificateRows.gibbs r).val.entries.length := (good_all r.val r.isLt r.isLt).1

theorem numerator_eq (r : Fin 16629) (i : ℕ) (hi : i < (IndexedCertificateRows.gibbs r).val.entries.length) :
    numerator r.val i = ((IndexedCertificateRows.gibbs r).val.entries[i]).numerator := ((good_all r.val r.isLt r.isLt).2 i hi).1

theorem power_eq (r : Fin 16629) (i : ℕ) (hi : i < (IndexedCertificateRows.gibbs r).val.entries.length) :
    power r.val i = ((IndexedCertificateRows.gibbs r).val.entries[i]).denominatorPower := ((good_all r.val r.isLt r.isLt).2 i hi).2

end FKLBridge.Gibbs
