module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys165 : Nat := 0x2000000000000a0000000000040000000000010000000000003fffff1e8b801c176b1983280db120cf20a0054db1d56102026bea2db9130135854aa528805bfca7938440282a3c665a8010de7e32157003e384097c4001824f18cb80009f96d8eea40033240604f80016a3982c24800908ccfe370002faa6439560006e6e1d4930001db12481e8000000385d20
def corr165 : List Raw := [⟨0x200000000000, 0x2000b32cd91fd747c739739fef21800000000000000000000000, false⟩, ⟨0x400000000000, 0x673508fee2db6208cc83e24379b32800000000000000000000000, false⟩, ⟨0x500000000000, 0x375f2e24d308e9c938e7a6c386ddbb000000000000000000000000, false⟩, ⟨0x800000000000, 0x1d32d0a50d14863f8df4eaa60aa7f6800000000000000000000000, true⟩]
theorem check165 : check2 217 keys165 49 23 5 (z3Raw 30 [])
    (windowRaw C0.tree C0.KW C0.MW 5460 11 (windowRaw C1.tree C1.KW C1.MW 5172 6 (windowRaw C2.tree C2.KW C2.MW 5175 3 corr165))) = true := by decide +kernel
theorem boundary165 : rationalLogValue (orderedBlockExpression ⟨165, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨165, by decide⟩) + rawValue 44 220 corr165 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 30 []) (zero3_ordered ⟨30, by decide⟩)
    5460 5471 5172 5178 5175 5178 (by decide) (by decide) (by decide) rfl
    217 keys165 49 23 5 corr165 check165

def keys166 : Nat := 0x100000000000050000000000020000000000008000000000001ffff0febcd80f49edd1c3c8070c0f6b48ec0385368558b601536b99466900a0853434b9002c341da420c013d34537eb90028040b5a4900132b6423560005b091175c4002d4ab9ce32001560b1f95c00071290830580037e8f3e8ea000001e02861000000016a160000000000010
def corr166 : List Raw := [⟨0x200000000000, 0x2e3e906a9ec62a56f89dd862d12800000000000000000000000, false⟩, ⟨0x400000000000, 0x1d4e82cc087ee13ad0955643e5af5800000000000000000000000, false⟩, ⟨0x500000000000, 0x57b9c9c82694e2cdc68be1b26a987000000000000000000000000, false⟩, ⟨0x800000000000, 0x273dcab6a8824f3e5920be3b77f8000000000000000000000000, false⟩]
theorem check166 : check2 214 keys166 49 22 5 (z3Raw 31 [])
    (windowRaw C0.tree C0.KW C0.MW 5471 6 (windowRaw C1.tree C1.KW C1.MW 5178 6 (windowRaw C2.tree C2.KW C2.MW 5178 6 corr166))) = true := by decide +kernel
theorem boundary166 : rationalLogValue (orderedBlockExpression ⟨166, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨166, by decide⟩) + rawValue 44 220 corr166 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 31 []) (zero3_ordered ⟨31, by decide⟩)
    5471 5477 5178 5184 5178 5184 (by decide) (by decide) (by decide) rfl
    214 keys166 49 22 5 corr166 check166

def keys167 : Nat := 0x80000000000028000000000010000000000004000000000000dece180007406e9aecdbca602a676a1ac56013876f22e778098d818b881802e3072f4d04013f7037a74300865bf3fc0a8020e85a59b9000aefd8b108c00574ef4f0b00019ecd2187e800b52369de74003b1d07f91e001a1926ac670003b34fda0c800137eb02ba0
def corr167 : List Raw := [⟨0x200000000000, 0x2402c8de04ea8593b9b5365afa95000000000000000000000000, false⟩, ⟨0x400000000000, 0x816714967fa027df86bb2eaf0b535400000000000000000000000, false⟩, ⟨0x500000000000, 0x3bfb56c0e08fbdef26cde5246ddca0800000000000000000000000, false⟩, ⟨0x800000000000, 0x3fa34c44ae9438d379cb4444db75b400000000000000000000000, false⟩]
theorem check167 : check2 217 keys167 49 21 5 (z3Raw 32 [])
    (windowRaw C0.tree C0.KW C0.MW 5477 17 (windowRaw C1.tree C1.KW C1.MW 5184 0 (windowRaw C2.tree C2.KW C2.MW 5184 0 corr167))) = true := by decide +kernel
theorem boundary167 : rationalLogValue (orderedBlockExpression ⟨167, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨167, by decide⟩) + rawValue 44 220 corr167 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 32 []) (zero3_ordered ⟨32, by decide⟩)
    5477 5494 5184 5184 5184 5184 (by decide) (by decide) (by decide) rfl
    217 keys167 49 21 5 corr167 check167

def keys168 : Nat := 0x2000000000000a000000000004000000000001000000000000385acb3539801ba53d0100b00dd253de6c6c06cc3d46d04c02a632c0546e013877a46b7d8097f2db58b9802e30484be04013dabda6a28008615152a7a8021e39506fa400bc7b95642e005c47a88a98002bb3b41f6e80133e7301d80007b33681a84003403a026080016acc05284000b46a54b74c003b1ce99406001c2165416a0003bbeb3a138001410f6e054
def corr168 : List Raw := [⟨0x200000000000, 0x6875946a3f241d0c30df9941020800000000000000000000000, false⟩, ⟨0x400000000000, 0x5519d14a2eb71e58d5569a8bc6e80800000000000000000000000, false⟩, ⟨0x500000000000, 0x1d430c3251b0e1854fe94716258e13800000000000000000000000, false⟩, ⟨0x800000000000, 0x1be2ccfe8c5390211bc91c458e68d000000000000000000000000, false⟩]
theorem check168 : check2 216 keys168 49 27 5 (z3Raw 33 [])
    (windowRaw C0.tree C0.KW C0.MW 5494 11 (windowRaw C1.tree C1.KW C1.MW 5184 6 (windowRaw C2.tree C2.KW C2.MW 5184 6 corr168))) = true := by decide +kernel
theorem boundary168 : rationalLogValue (orderedBlockExpression ⟨168, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨168, by decide⟩) + rawValue 44 220 corr168 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 33 []) (zero3_ordered ⟨33, by decide⟩)
    5494 5505 5184 5190 5184 5190 (by decide) (by decide) (by decide) rfl
    216 keys168 49 27 5 corr168 check168

def keys169 : Nat := 0x400000000000140000000000080000000000020000000000007195c61a0160365bff481f801258136638c0092710f731bc032b95e5ce840194a476c6bc002e2ff4c7790011b81f85280007bc043de2c002c71511b5500103867a627800816471c8b0
def corr169 : List Raw := [⟨0x200000000000, 0x34253115d29cf6924a77edc3648b000000000000000000000000, false⟩, ⟨0x400000000000, 0x89156b1db3fe63f3fc6dbbe1c4b0000000000000000000000000, false⟩, ⟨0x500000000000, 0x1a662e0896e2f6c4214959785b954000000000000000000000000, false⟩, ⟨0x800000000000, 0x5866ef3663a9e0bf91a565ad6c5000000000000000000000000, false⟩]
theorem check169 : check2 212 keys169 49 16 4 (z3Raw 34 [])
    (windowRaw C0.tree C0.KW C0.MW 5505 3 (windowRaw C1.tree C1.KW C1.MW 5190 3 (windowRaw C2.tree C2.KW C2.MW 5190 6 corr169))) = true := by decide +kernel
theorem boundary169 : rationalLogValue (orderedBlockExpression ⟨169, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨169, by decide⟩) + rawValue 44 220 corr169 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 34 []) (zero3_ordered ⟨34, by decide⟩)
    5505 5508 5190 5193 5190 5196 (by decide) (by decide) (by decide) rfl
    212 keys169 49 16 4 corr169 check169

def keys170 : Nat := 0x100000000000050000000000020000000000008000000000001adf3715376009868a605124047c7317f1b6023d05c0214a00d091a060ac8068020b4d3040214c6eefe8a0087f29f9662002f96ce0a7400113ae0510b00043adfe3aba0021be46d2640003a3fec2ac80012fd4d42dc
def corr170 : List Raw := [⟨0x200000000000, 0x4215a6f90c43eb30bbbfec9c2ce2000000000000000000000000, false⟩, ⟨0x400000000000, 0x208236a3c24885d4456e7c3dcf2e2000000000000000000000000, false⟩, ⟨0x500000000000, 0x7677c05ed7ea84ee6bc02a06e24b0000000000000000000000000, false⟩, ⟨0x800000000000, 0x493c164079b6da92503b1a3c362a000000000000000000000000, false⟩]
theorem check170 : check2 214 keys170 49 18 5 (z3Raw 35 [])
    (windowRaw C0.tree C0.KW C0.MW 5508 11 (windowRaw C1.tree C1.KW C1.MW 5193 0 (windowRaw C2.tree C2.KW C2.MW 5196 3 corr170))) = true := by decide +kernel
theorem boundary170 : rationalLogValue (orderedBlockExpression ⟨170, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨170, by decide⟩) + rawValue 44 220 corr170 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 35 []) (zero3_ordered ⟨35, by decide⟩)
    5508 5519 5193 5193 5196 5199 (by decide) (by decide) (by decide) rfl
    214 keys170 49 18 5 corr170 check170

def keys171 : Nat := 0x400000000000140000000000080000000000020000000000006c97e9eaa50035e9e31d909011f05333e37808f82997bf20033f36fb0e2c019f9b7d00eb002f415ac65280172e78223200085be3134a4003e86d0221000112d0e44910008968720a98
def corr171 : List Raw := [⟨0x200000000000, 0x24316157eaa162cc27b2feaf86b4000000000000000000000000, false⟩, ⟨0x400000000000, 0xd05a98dca627fa07758533806f62000000000000000000000000, false⟩, ⟨0x500000000000, 0x26e602a7d8a8136f62e0ff82b7a0c000000000000000000000000, false⟩, ⟨0x800000000000, 0xf34640e6f11c0ca8ac7cdd009ea000000000000000000000000, false⟩]
theorem check171 : check2 213 keys171 49 16 4 (z3Raw 36 [])
    (windowRaw C0.tree C0.KW C0.MW 5519 6 (windowRaw C1.tree C1.KW C1.MW 5193 0 (windowRaw C2.tree C2.KW C2.MW 5199 6 corr171))) = true := by decide +kernel
theorem boundary171 : rationalLogValue (orderedBlockExpression ⟨171, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨171, by decide⟩) + rawValue 44 220 corr171 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 36 []) (zero3_ordered ⟨36, by decide⟩)
    5519 5525 5193 5193 5199 5205 (by decide) (by decide) (by decide) rfl
    213 keys171 49 16 4 corr171 check171

def keys172 : Nat := 0x400000000000140000000000080000000000020000000000006d85da585ca0364bf4ed2110126c7edee01009013d86ea84033d0e2e7272019241e87e62002e5cf05a8b801677f3771e4007d0da0f1b00039f15f60a2001094c3861300080b8ee9670
def corr172 : List Raw := [⟨0x200000000000, 0x5dbb9f6977b6eed7d42a6a2f948000000000000000000000000, false⟩, ⟨0x400000000000, 0x3766e7e547008b092c8c7d87d675800000000000000000000000, false⟩, ⟨0x500000000000, 0xa0d5f7e8cac7a36ec988954f61e1000000000000000000000000, false⟩, ⟨0x800000000000, 0x4559f88520902cf1630dbd53042800000000000000000000000, false⟩]
theorem check172 : check2 211 keys172 49 16 4 (z3Raw 37 [])
    (windowRaw C0.tree C0.KW C0.MW 5525 3 (windowRaw C1.tree C1.KW C1.MW 5193 0 (windowRaw C2.tree C2.KW C2.MW 5205 9 corr172))) = true := by decide +kernel
theorem boundary172 : rationalLogValue (orderedBlockExpression ⟨172, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨172, by decide⟩) + rawValue 44 220 corr172 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 37 []) (zero3_ordered ⟨37, by decide⟩)
    5525 5528 5193 5193 5205 5214 (by decide) (by decide) (by decide) rfl
    211 keys172 49 16 4 corr172 check172

def keys173 : Nat := 0x100000000000050000000000020000000000008000000000001c5557de1f30099b5d69aa3802f2b5d3cdca004dcb9d44dd0013c4b37b9e8007f36eeba34
def corr173 : List Raw := [⟨0x200000000000, 0x42f9b8687b26e84f13d037c717800000000000000000000000, false⟩, ⟨0x400000000000, 0x1f71c3175f19bb4855e69cb426c000000000000000000000000, false⟩, ⟨0x500000000000, 0x34884d0a416c6bbfb994677de07000000000000000000000000, false⟩, ⟨0x800000000000, 0x41cdb7a6e0bce1b8dc5fcf67c800000000000000000000000, false⟩]
theorem check173 : check2 205 keys173 49 10 4 (z3Raw 38 [])
    (windowRaw C0.tree C0.KW C0.MW 5528 0 (windowRaw C1.tree C1.KW C1.MW 5193 0 (windowRaw C2.tree C2.KW C2.MW 5214 6 corr173))) = true := by decide +kernel
theorem boundary173 : rationalLogValue (orderedBlockExpression ⟨173, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨173, by decide⟩) + rawValue 44 220 corr173 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 38 []) (zero3_ordered ⟨38, by decide⟩)
    5528 5528 5193 5193 5214 5220 (by decide) (by decide) (by decide) rfl
    205 keys173 49 10 4 corr173 check173

def keys174 : Nat := 0x100000000000050000000000020000000000008000000000001c179df390d00c9b23a22ee404ddd90a0798024d402e1e0a00c90792928d8045cb5f8049001ac90ac163c007160d753ea00289192ebd1800afa46ed90c0041615979b60005bc4d708b00017760b4948000b2360da6c
def corr174 : List Raw := [⟨0x200000000000, 0x69bbe7f173683025eaa88376499800000000000000000000000, false⟩, ⟨0x400000000000, 0x1ab2d4a6c1677971c06eca0e6548400000000000000000000000, false⟩, ⟨0x500000000000, 0x4894153b8cf7a1bf8166eba48d6d000000000000000000000000, false⟩, ⟨0x800000000000, 0xd65a26813cf9caa9a4c7f7f878400000000000000000000000, false⟩]
theorem check174 : check2 210 keys174 49 18 5 (z3Raw 39 [])
    (windowRaw C0.tree C0.KW C0.MW 5528 3 (windowRaw C1.tree C1.KW C1.MW 5193 11 (windowRaw C2.tree C2.KW C2.MW 5220 0 corr174))) = true := by decide +kernel
theorem boundary174 : rationalLogValue (orderedBlockExpression ⟨174, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨174, by decide⟩) + rawValue 44 220 corr174 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 39 []) (zero3_ordered ⟨39, by decide⟩)
    5528 5531 5193 5204 5220 5220 (by decide) (by decide) (by decide) rfl
    210 keys174 49 18 5 corr174 check174

def keys175 : Nat := 0x100000000000050000000000020000000000008000000000001b1f07ddf620098417149b9c04aec2e0540802361fc0fdfd00d408641b7b80614e32b4d54021915a97b6e0086a9200478002e3db1ec68000fe8e81a1b00046cb8a054e0021cf76cb0c000365b968b400013eb4d1608
def corr175 : List Raw := [⟨0x200000000000, 0x2d33df6dff7fc60c738a482c3732800000000000000000000000, false⟩, ⟨0x400000000000, 0xa2412e9c8428f643c2e1795db1d5800000000000000000000000, false⟩, ⟨0x500000000000, 0x20da0506515a532f889a1789ce274000000000000000000000000, false⟩, ⟨0x800000000000, 0xc406f76825e03a8e86122f879ec000000000000000000000000, false⟩]
theorem check175 : check2 212 keys175 49 18 5 (z3Raw 40 [])
    (windowRaw C0.tree C0.KW C0.MW 5531 3 (windowRaw C1.tree C1.KW C1.MW 5204 11 (windowRaw C2.tree C2.KW C2.MW 5220 0 corr175))) = true := by decide +kernel
theorem boundary175 : rationalLogValue (orderedBlockExpression ⟨175, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨175, by decide⟩) + rawValue 44 220 corr175 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 40 []) (zero3_ordered ⟨40, by decide⟩)
    5531 5534 5204 5215 5220 5220 (by decide) (by decide) (by decide) rfl
    212 keys175 49 18 5 corr175 check175

def keys176 : Nat := 0x100000000000050000000000020000000000008000000000001aebb69ffba00d6db524ebd404c115b5be160235c3926d8500d432aed3c18042b25f39b100110dbc9cf58005fa46cdb4c002f8ed5233480113b927a6fc0086d70374460021d70feaf80003b507c511000134ecf218c
def corr176 : List Raw := [⟨0x200000000000, 0x319de3b46457b3fd210d502bc08c000000000000000000000000, false⟩, ⟨0x400000000000, 0x25c5947b14abcc108be6fdb45fd79000000000000000000000000, false⟩, ⟨0x500000000000, 0x85a1de2643804bb273496465b6b56800000000000000000000000, false⟩, ⟨0x800000000000, 0x54b3fa03d634cdcad0656e7b5918800000000000000000000000, false⟩]
theorem check176 : check2 214 keys176 49 18 5 (z3Raw 41 [])
    (windowRaw C0.tree C0.KW C0.MW 5534 3 (windowRaw C1.tree C1.KW C1.MW 5215 11 (windowRaw C2.tree C2.KW C2.MW 5220 0 corr176))) = true := by decide +kernel
theorem boundary176 : rationalLogValue (orderedBlockExpression ⟨176, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨176, by decide⟩) + rawValue 44 220 corr176 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 41 []) (zero3_ordered ⟨41, by decide⟩)
    5534 5537 5215 5226 5220 5220 (by decide) (by decide) (by decide) rfl
    214 keys176 49 18 5 corr176 check176

def keys177 : Nat := 0x100000000000050000000000020000000000008000000000001acd99a441980d66cc8cb8cc04bd7389e1b4025eb9acb594011e7ad34528808f3d6191108033f31d7d768019f98666a6400858d7e3e328042c6bbd3a900113f2b5d4280089f95271b50030bc2f21c180185e15de30c0089a8fd1c940044d473ff0a0011b8f985a58008dc6374028000ea1584cd4000750aa40f2000270a7dec480013853c376c
def corr177 : List Raw := [⟨0x200000000000, 0x38c48e850e5a58f2e90c19405c10000000000000000000000000, false⟩, ⟨0x400000000000, 0x3ee6ee4f3d38b47e0681d14a8aef4000000000000000000000000, false⟩, ⟨0x500000000000, 0x12cef6e7820e86e6d94fa1d5dff6d0000000000000000000000000, false⟩, ⟨0x800000000000, 0x1049c432910d1cf9b18b0470bdebc000000000000000000000000, false⟩]
theorem check177 : check2 215 keys177 49 26 5 (z3Raw 42 [])
    (windowRaw C0.tree C0.KW C0.MW 5537 11 (windowRaw C1.tree C1.KW C1.MW 5226 11 (windowRaw C2.tree C2.KW C2.MW 5220 0 corr177))) = true := by decide +kernel
theorem boundary177 : rationalLogValue (orderedBlockExpression ⟨177, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨177, by decide⟩) + rawValue 44 220 corr177 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 42 []) (zero3_ordered ⟨42, by decide⟩)
    5537 5548 5226 5237 5220 5220 (by decide) (by decide) (by decide) rfl
    215 keys177 49 26 5 corr177 check177

def keys178 : Nat := 0x80000000000028000000000010000000000004000000000000fffeb7a765806e5a0211a52035a78290641012ef9b3280d008f1d3ea661c0341127300ec010bae9e4d460044f58394d9801827ebd619800c0221048640044e827a15900168f73a7528008c072f980c000eea245dea0004fde209f80000028f6e9000000000a1528
def corr178 : List Raw := [⟨0x200000000000, 0x17e7f0a79fdfed567318a02f744f800000000000000000000000, false⟩, ⟨0x400000000000, 0x3cf65733dd3cb6b53e80af0e03b56800000000000000000000000, false⟩, ⟨0x500000000000, 0x18d94dd0b16b6a00b3942c2a08ab6b000000000000000000000000, false⟩, ⟨0x800000000000, 0x19ac9d3ea9fcf261f376f1db629d5800000000000000000000000, false⟩]
theorem check178 : check2 216 keys178 49 21 5 (z3Raw 43 [])
    (windowRaw C0.tree C0.KW C0.MW 5548 14 (windowRaw C1.tree C1.KW C1.MW 5237 0 (windowRaw C2.tree C2.KW C2.MW 5220 3 corr178))) = true := by decide +kernel
theorem boundary178 : rationalLogValue (orderedBlockExpression ⟨178, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨178, by decide⟩) + rawValue 44 220 corr178 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 43 []) (zero3_ordered ⟨43, by decide⟩)
    5548 5562 5237 5237 5220 5223 (by decide) (by decide) (by decide) rfl
    216 keys178 49 21 5 corr178 check178

def keys179 : Nat := 0x80000000000028000000000010000000000004000000000000e209eda1c6806ec0967b54c035a8ff5f1f5015342ac8004809a31221c6dc04bc112e8054023c74da5d7d00d0405baa1c004fca0f73a1402174a5d77b801063113ac050044f0f27dd880211cac7f9a800c133a1fbd6005ccaddaf7c0025561828ec8011358e44080005a60dcebbc002d2c19270d0011853727258006949a4c5c800112bcbad3000077481962400027de9b9128001007303508
def corr179 : List Raw := [⟨0x200000000000, 0x7cf2663f77c52fb72c46bb2964b000000000000000000000000, false⟩, ⟨0x400000000000, 0x210b6f6fe8f47f819f06f8111053d000000000000000000000000, false⟩, ⟨0x500000000000, 0x78b29af30b92c6aa87167d037e3ad800000000000000000000000, false⟩, ⟨0x800000000000, 0x533033a77e31daa7ea55ebe584b3c00000000000000000000000, false⟩]
theorem check179 : check2 214 keys179 49 29 5 (z3Raw 44 [])
    (windowRaw C0.tree C0.KW C0.MW 5562 6 (windowRaw C1.tree C1.KW C1.MW 5237 11 (windowRaw C2.tree C2.KW C2.MW 5223 8 corr179))) = true := by decide +kernel
theorem boundary179 : rationalLogValue (orderedBlockExpression ⟨179, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨179, by decide⟩) + rawValue 44 220 corr179 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 44 []) (zero3_ordered ⟨44, by decide⟩)
    5562 5568 5237 5248 5223 5231 (by decide) (by decide) (by decide) rfl
    214 keys179 49 29 5 corr179 check179

def keys180 : Nat := 0x2000000000000a000000000004000000000001000000000000384d054210401b41118fce480da0871b0c40054cb4a21aea025fb5d49d67012f2bd3a30c809795a5615bc0305769fd00c0182b92fb2da009eb7e29d3700430673899b8010f2d9bb0b6005bbb674214002ddd6d8893801372aa2cfd0007845e5ea20003c22d1fadc0016b28195840007bc0eb1edc003dda11a3c2001c35e9b81d0003caf55332800140e92f5ac
def corr180 : List Raw := [⟨0x200000000000, 0xe5c5cefc442461f3bac4c3d1556000000000000000000000000, false⟩, ⟨0x400000000000, 0x2c4d6dc26f7d72533cb68ef4e3db9000000000000000000000000, false⟩, ⟨0x500000000000, 0x1cff901b6f79662a2de487c1419a1e000000000000000000000000, false⟩, ⟨0x800000000000, 0x22504e468bdf333f386e1c5cfc67b000000000000000000000000, false⟩]
theorem check180 : check2 216 keys180 49 27 5 (z3Raw 45 [])
    (windowRaw C0.tree C0.KW C0.MW 5568 11 (windowRaw C1.tree C1.KW C1.MW 5248 6 (windowRaw C2.tree C2.KW C2.MW 5231 6 corr180))) = true := by decide +kernel
theorem boundary180 : rationalLogValue (orderedBlockExpression ⟨180, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨180, by decide⟩) + rawValue 44 220 corr180 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 45 []) (zero3_ordered ⟨45, by decide⟩)
    5568 5579 5248 5254 5231 5237 (by decide) (by decide) (by decide) rfl
    216 keys180 49 27 5 corr180 check180

def keys181 : Nat := 0x400000000000140000000000080000000000020000000000006e5aa472656035a8639aa8201303c4832b280977eadc9c7c04b79d68f4f4022e57640b2000d796109c0a0042f024d725c02175fd99028010af6255a1f0046d25504a6802279486f288010e95679378006091b608050030066ea4c000113a04135e4005a3bfe46aa00227c7abccc0003c75fcbd00001dc998c754000d53ba626a0004fdd42256000276b46e5400013b27bc394
def corr181 : List Raw := [⟨0x200000000000, 0x18e1cd8388a39ac4f52d4b124fd5000000000000000000000000, false⟩, ⟨0x400000000000, 0x3d19179dbfde57ba8f23dcec87420400000000000000000000000, false⟩, ⟨0x500000000000, 0x19226f3bd5b96b25d9ecd862f5094d800000000000000000000000, false⟩, ⟨0x800000000000, 0x1a0cd421c7eaef079d10262e33a6d400000000000000000000000, false⟩]
theorem check181 : check2 216 keys181 49 28 5 (z3Raw 46 [])
    (windowRaw C0.tree C0.KW C0.MW 5579 14 (windowRaw C1.tree C1.KW C1.MW 5254 5 (windowRaw C2.tree C2.KW C2.MW 5237 5 corr181))) = true := by decide +kernel
theorem boundary181 : rationalLogValue (orderedBlockExpression ⟨181, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨181, by decide⟩) + rawValue 44 220 corr181 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 46 []) (zero3_ordered ⟨46, by decide⟩)
    5579 5593 5254 5259 5237 5242 (by decide) (by decide) (by decide) rfl
    216 keys181 49 28 5 corr181 check181

def keys182 : Nat := 0x4000000000001400000000000800000000000200000000000071089c8c4a8035a9eaa02870134601e92228097c2065f08c04bc24602bf0022e57383ae400d791e129778042e949c77d802160186f28801063005ff8d0044edb3baae802275eddaac80108edcbf8b200608b7f3ea200254760ed3200113575afb5c005a58b3869000228505722d00044b7618de8001dc6d0e5c4000e8975b7060004fb8d1d4400026d5862320001007aab860
def corr182 : List Raw := [⟨0x200000000000, 0x5dcd3bfc7a35ec865abbf4ca151000000000000000000000000, false⟩, ⟨0x400000000000, 0x9a14f7f4342e538fa9b05f368bdb400000000000000000000000, false⟩, ⟨0x500000000000, 0x6b3aa9277ac5e62c651c78a43f98c800000000000000000000000, false⟩, ⟨0x800000000000, 0x8078be8a13b1ea9ba88c0f35cf2fc00000000000000000000000, false⟩]
theorem check182 : check2 214 keys182 49 28 5 (z3Raw 47 [])
    (windowRaw C0.tree C0.KW C0.MW 5593 5 (windowRaw C1.tree C1.KW C1.MW 5259 8 (windowRaw C2.tree C2.KW C2.MW 5242 11 corr182))) = true := by decide +kernel
theorem boundary182 : rationalLogValue (orderedBlockExpression ⟨182, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨182, by decide⟩) + rawValue 44 220 corr182 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 47 []) (zero3_ordered ⟨47, by decide⟩)
    5593 5598 5259 5267 5242 5253 (by decide) (by decide) (by decide) rfl
    214 keys182 49 28 5 corr182 check182

def keys183 : Nat := 0x400000000000140000000000080000000000020000000000006b5846e429e035ac22d6cbb011e80022275008f3ffadb894033f4e7c738c019fa6c01a6300308d64bc7e001846b17965000884612349200442302f91d0011ac9dd0598008d63596054
def corr183 : List Raw := [⟨0x200000000000, 0x350f21ac72218e3b9c809e7de082c00000000000000000000000, false⟩, ⟨0x400000000000, 0x38e3290af72130416ad49c94a75ee400000000000000000000000, false⟩, ⟨0x500000000000, 0xa96ff6d3fe0467da7131d61977dc7800000000000000000000000, false⟩, ⟨0x800000000000, 0x57037f59983c3f552e359837a98f000000000000000000000000, false⟩]
theorem check183 : check2 215 keys183 49 16 4 (z3Raw 48 [])
    (windowRaw C0.tree C0.KW C0.MW 5598 6 (windowRaw C1.tree C1.KW C1.MW 5267 0 (windowRaw C2.tree C2.KW C2.MW 5253 6 corr183))) = true := by decide +kernel
theorem boundary183 : rationalLogValue (orderedBlockExpression ⟨183, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨183, by decide⟩) + rawValue 44 220 corr183 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 48 []) (zero3_ordered ⟨48, by decide⟩)
    5598 5604 5267 5267 5253 5259 (by decide) (by decide) (by decide) rfl
    215 keys183 49 16 4 corr183 check183

def keys184 : Nat := 0x2000000000000a00000000000400000000000100000000000035e9e183b070150a288f8838097c201a79b4047c7ef0023801a00289703c00858066f229003acb52f4f940113af7b028200738da21fcd002f415602ef0010b7ceefc6c00437bfd1d50000744bc424b00026d58dcda8000000006d1c
def corr184 : List Raw := [⟨0x200000000000, 0x1411a940c1325e749f5d26d9d68d400000000000000000000000, false⟩, ⟨0x400000000000, 0xbd530653a1b241d7bdfde6f7398c000000000000000000000000, false⟩, ⟨0x500000000000, 0x5be1c91bd8d0e3a671dec354b6f10800000000000000000000000, false⟩, ⟨0x800000000000, 0x61d1880f1bd3ee23b6cf772ad3e9c00000000000000000000000, false⟩]
theorem check184 : check2 214 keys184 49 19 5 (z3Raw 49 [])
    (windowRaw C0.tree C0.KW C0.MW 5604 6 (windowRaw C1.tree C1.KW C1.MW 5267 4 (windowRaw C2.tree C2.KW C2.MW 5259 5 corr184))) = true := by decide +kernel
theorem boundary184 : rationalLogValue (orderedBlockExpression ⟨184, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨184, by decide⟩) + rawValue 44 220 corr184 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 49 []) (zero3_ordered ⟨49, by decide⟩)
    5604 5610 5267 5271 5259 5264 (by decide) (by decide) (by decide) rfl
    214 keys184 49 19 5 corr184 check184

def keys185 : Nat := 0x100000000000050000000000020000000000008000000000001adf35bafab8098689e8b610049dd270a0a4023d082b700d00d090696c7e0064439a66b040214c70745e20087f2a95e5e002f96cb74f800113aec6dae40043ae036dee0020085e14ed0003a3fec5b080012fd6d1730
def corr185 : List Raw := [⟨0x200000000000, 0x35c464e18909787f8aeaf3a6113e800000000000000000000000, false⟩, ⟨0x400000000000, 0x1f6658a9fed67a4ea7009729d6f94800000000000000000000000, false⟩, ⟨0x500000000000, 0x72cc0ac83b553f737cb2d01b40ae0000000000000000000000000, false⟩, ⟨0x800000000000, 0x492ccba1bbc97754ba5c8a694449000000000000000000000000, false⟩]
theorem check185 : check2 214 keys185 49 18 5 (z3Raw 50 [])
    (windowRaw C0.tree C0.KW C0.MW 5610 3 (windowRaw C1.tree C1.KW C1.MW 5271 0 (windowRaw C2.tree C2.KW C2.MW 5264 11 corr185))) = true := by decide +kernel
theorem boundary185 : rationalLogValue (orderedBlockExpression ⟨185, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨185, by decide⟩) + rawValue 44 220 corr185 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 50 []) (zero3_ordered ⟨50, by decide⟩)
    5610 5613 5271 5271 5264 5275 (by decide) (by decide) (by decide) rfl
    214 keys185 49 18 5 corr185 check185

def keys186 : Nat := 0x100000000000050000000000020000000000008000000000001b3118dc1c10099b3a808bd8049d9c43a0ce02498b08189b00cb022c14d8806446cd7dd6c0210fc4c188e008686d99035002e10c58452800f6ed65cf640040e13f7b68002016a8383e0002f51111b78001108f8747c
def corr186 : List Raw := [⟨0x200000000000, 0x1e5f44e730b23ac051e6d5bc1d65c00000000000000000000000, false⟩, ⟨0x400000000000, 0x888af5e861ad6570db89d58e9002800000000000000000000000, false⟩, ⟨0x500000000000, 0x1c8b40c652c6666ceb2d1d5d05bdb000000000000000000000000, false⟩, ⟨0x800000000000, 0xca4e41441a4c0a4d11a0df9e61cc00000000000000000000000, false⟩]
theorem check186 : check2 212 keys186 49 18 5 (z3Raw 51 [])
    (windowRaw C0.tree C0.KW C0.MW 5613 0 (windowRaw C1.tree C1.KW C1.MW 5271 0 (windowRaw C2.tree C2.KW C2.MW 5275 14 corr186))) = true := by decide +kernel
theorem boundary186 : rationalLogValue (orderedBlockExpression ⟨186, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨186, by decide⟩) + rawValue 44 220 corr186 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 51 []) (zero3_ordered ⟨51, by decide⟩)
    5613 5613 5271 5271 5275 5289 (by decide) (by decide) (by decide) rfl
    212 keys186 49 18 5 corr186 check186

def keys187 : Nat := 0x100000000000050000000000020000000000008000000000001c405f1a67380df50b0e0a000515f6f588d20259f1693a9c00c36d52e02c003ffb5e86a3000dbdce96a3a0053c8dffa5e0027aa1ee079000bbd1720c8800513fbde44e001f33f1050c000289956f5f0000855ae34c0
def corr187 : List Raw := [⟨0x200000000000, 0x11303609d8777694dea2e9b0a806000000000000000000000000, false⟩, ⟨0x400000000000, 0x7aa54dbf28835ed43e73e55f9048800000000000000000000000, false⟩, ⟨0x500000000000, 0x1706e6e4d3bb7a4b2346c484f1ce2000000000000000000000000, false⟩, ⟨0x800000000000, 0x866f9a8ef8ad171bd1e5a36561f800000000000000000000000, false⟩]
theorem check187 : check2 212 keys187 49 18 5 (z3Raw 52 [])
    (windowRaw C0.tree C0.KW C0.MW 5613 0 (windowRaw C1.tree C1.KW C1.MW 5271 6 (windowRaw C2.tree C2.KW C2.MW 5289 8 corr187))) = true := by decide +kernel
theorem boundary187 : rationalLogValue (orderedBlockExpression ⟨187, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨187, by decide⟩) + rawValue 44 220 corr187 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 52 []) (zero3_ordered ⟨52, by decide⟩)
    5613 5613 5271 5277 5289 5297 (by decide) (by decide) (by decide) rfl
    212 keys187 49 18 5 corr187 check187

def keys188 : Nat := 0x80000000000028000000000010000000000004000000000000ecc761df4c8070c70981da8028be66bb8f4012be25060c30061ec849031c01ecf7b90a4c0079285b422c003a8a56b5488013389e20b3800411299fb660005c53eb01a000161e5d39d800027d62bc00
def corr188 : List Raw := [⟨0x200000000000, 0x2f19a77e3db090c366c5c49bd373800000000000000000000000, false⟩, ⟨0x400000000000, 0x593c164c9232a7cd6fa746074eae800000000000000000000000, false⟩, ⟨0x500000000000, 0x154090b9e9ff21e3da4f01706885b000000000000000000000000, false⟩, ⟨0x800000000000, 0x6401a761c3727d2e83a4181fe8d000000000000000000000000, false⟩]
theorem check188 : check2 212 keys188 49 17 5 (z3Raw 53 [])
    (windowRaw C0.tree C0.KW C0.MW 5613 3 (windowRaw C1.tree C1.KW C1.MW 5277 10 (windowRaw C2.tree C2.KW C2.MW 5297 0 corr188))) = true := by decide +kernel
theorem boundary188 : rationalLogValue (orderedBlockExpression ⟨188, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨188, by decide⟩) + rawValue 44 220 corr188 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 53 []) (zero3_ordered ⟨53, by decide⟩)
    5613 5616 5277 5287 5297 5297 (by decide) (by decide) (by decide) rfl
    212 keys188 49 17 5 corr188 check188

def keys189 : Nat := 0x80000000000028000000000010000000000004000000000000f10b875edd80717bb7bf854036f12299a3401b397f2178a009902edc6f200218ce835fd40097f9fad9120041e74ee2318016574939b04008d8a7fb312003987d8ebcf001bc858bf85800b57408a934000e10e6cffc0004b5f607ed00012504cc5d800035883df68
def corr189 : List Raw := [⟨0x200000000000, 0x2d510b1eb5af7d1fb95dbfa3b63400000000000000000000000, false⟩, ⟨0x400000000000, 0x2d6bbd561d7328fd76afdbf536b53000000000000000000000000, false⟩, ⟨0x500000000000, 0xb7a27c9c3af4486b2d2643a1daf0d800000000000000000000000, false⟩, ⟨0x800000000000, 0x886709b9e6a132e7a221e724709fc00000000000000000000000, false⟩]
theorem check189 : check2 215 keys189 49 21 5 (z3Raw 54 [])
    (windowRaw C0.tree C0.KW C0.MW 5616 6 (windowRaw C1.tree C1.KW C1.MW 5287 11 (windowRaw C2.tree C2.KW C2.MW 5297 0 corr189))) = true := by decide +kernel
theorem boundary189 : rationalLogValue (orderedBlockExpression ⟨189, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨189, by decide⟩) + rawValue 44 220 corr189 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 54 []) (zero3_ordered ⟨54, by decide⟩)
    5616 5622 5287 5298 5297 5297 (by decide) (by decide) (by decide) rfl
    215 keys189 49 21 5 corr189 check189

def keys190 : Nat := 0x80000000000028000000000010000000000004000000000000e427ee6092006ea44bb9a300364a49805a3012fd9b1d1b280948f063d0b0031818d54894010c2450f74a0043d1d288eb00176b10e086800b90ceedbc40047ea01be82001f6a78463d800b4c57ac338004eec897e6c0021b77c678a0003c067bd4c000140f5b638c
def corr190 : List Raw := [⟨0x200000000000, 0x34e29ddd495a58134abe3676b07f000000000000000000000000, false⟩, ⟨0x400000000000, 0x59660b13c98093e3f8373a2cf9693000000000000000000000000, false⟩, ⟨0x500000000000, 0x1e115afc563bdca6adcff1df260808000000000000000000000000, false⟩, ⟨0x800000000000, 0x1bd6780426d88946e2a00fa76f781000000000000000000000000, false⟩]
theorem check190 : check2 216 keys190 49 21 5 (z3Raw 55 [])
    (windowRaw C0.tree C0.KW C0.MW 5622 0 (windowRaw C1.tree C1.KW C1.MW 5298 14 (windowRaw C2.tree C2.KW C2.MW 5297 3 corr190))) = true := by decide +kernel
theorem boundary190 : rationalLogValue (orderedBlockExpression ⟨190, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨190, by decide⟩) + rawValue 44 220 corr190 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 55 []) (zero3_ordered ⟨55, by decide⟩)
    5622 5622 5298 5312 5297 5300 (by decide) (by decide) (by decide) rfl
    216 keys190 49 21 5 corr190 check190

def keys191 : Nat := 0x100000000000050000000000020000000000008000000000001ad481d6ee000d69ddbf666004bc118db070025df1093648011e3a82ca7a808f1d16915f00341126e542c01a0813790dc0085d806380b8042e94ab67e40113d73c7c960089e1bf0a680030500f38c90018266f357b00089d0e369ac0044d6084c540011853714d40008c070d03d4000eea7b14840007747da36400027f07488a00013ef46800c
def corr191 : List Raw := [⟨0x200000000000, 0x1c015b0925f01099acf41295bf83000000000000000000000000, false⟩, ⟨0x400000000000, 0x3c68b66643f7b3e2e06653c40eb28800000000000000000000000, false⟩, ⟨0x500000000000, 0x1a13ccc330c220a05ba8f3d50fe292000000000000000000000000, false⟩, ⟨0x800000000000, 0x1b87558a7c65a837b79721eed0b78800000000000000000000000, false⟩]
theorem check191 : check2 216 keys191 49 26 5 (z3Raw 56 [])
    (windowRaw C0.tree C0.KW C0.MW 5622 11 (windowRaw C1.tree C1.KW C1.MW 5312 11 (windowRaw C2.tree C2.KW C2.MW 5300 0 corr191))) = true := by decide +kernel
theorem boundary191 : rationalLogValue (orderedBlockExpression ⟨191, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨191, by decide⟩) + rawValue 44 220 corr191 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 56 []) (zero3_ordered ⟨56, by decide⟩)
    5622 5633 5312 5323 5300 5300 (by decide) (by decide) (by decide) rfl
    216 keys191 49 26 5 corr191 check191

def keys192 : Nat := 0x80000000000028000000000010000000000004000000000000e18c1ed865406f29060b12c0372cef82ddd01abe25a523180b23f107a22004d1843d91da025e467981140091cfaa58a98042bd1570108020c64e33ccc008a9aa5c7ea004239af9c620018cee6fc26800c023330e98005e4fd66308002651d70f7700113febdac0c005a57acfefa002d1f6e4ad7001433fca2310004d91a5989400112c3daf1a00074ed1759c00026ddcc0920001007c62170
def corr192 : List Raw := [⟨0x200000000000, 0x253bd10bb2868d7d9a3d4804420000000000000000000000000, false⟩, ⟨0x400000000000, 0x11435f9151c43b6813451569a95c9800000000000000000000000, false⟩, ⟨0x500000000000, 0x5e2f1e98b8dbc5c69bbe137c9b1f4000000000000000000000000, false⟩, ⟨0x800000000000, 0x5961c44cce1b70b6ecf48a43a9dd000000000000000000000000, false⟩]
theorem check192 : check2 214 keys192 49 29 5 (z3Raw 57 [])
    (windowRaw C0.tree C0.KW C0.MW 5633 14 (windowRaw C1.tree C1.KW C1.MW 5323 3 (windowRaw C2.tree C2.KW C2.MW 5300 8 corr192))) = true := by decide +kernel
theorem boundary192 : rationalLogValue (orderedBlockExpression ⟨192, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨192, by decide⟩) + rawValue 44 220 corr192 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 57 []) (zero3_ordered ⟨57, by decide⟩)
    5633 5647 5323 5326 5300 5308 (by decide) (by decide) (by decide) rfl
    214 keys192 49 29 5 corr192 check192

def keys193 : Nat := 0x80000000000028000000000010000000000004000000000000df2e84cefb006e183f04340035a8481a45601abdb6ebb210097744ec8cdc04b997833e12024e6a786e3500c4fdbad2870042e9cde0f200215c2a69d10008b272ab7a500458c9a76b4801939572377400c6844fa902006225c0a7d7002afce042cb001141bead4f400812c439b9a002d4c2c3e7e00168c239b448009e6847b2f4000ec243d32200075a9b129e0002825d1dfc80013668638e8
def corr193 : List Raw := [⟨0x200000000000, 0x2edea93eb97b4abf8d5745cee9b800000000000000000000000, false⟩, ⟨0x400000000000, 0xad6966499801a4802c42c6b5b375000000000000000000000000, false⟩, ⟨0x500000000000, 0x4d49f3757b3f1cac9604c7b594bcd000000000000000000000000, false⟩, ⟨0x800000000000, 0x5269acd291127cf4f413b3f9500a000000000000000000000000, false⟩]
theorem check193 : check2 213 keys193 49 29 5 (z3Raw 58 [])
    (windowRaw C0.tree C0.KW C0.MW 5647 0 (windowRaw C1.tree C1.KW C1.MW 5326 14 (windowRaw C2.tree C2.KW C2.MW 5308 11 corr193))) = true := by decide +kernel
theorem boundary193 : rationalLogValue (orderedBlockExpression ⟨193, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨193, by decide⟩) + rawValue 44 220 corr193 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 58 []) (zero3_ordered ⟨58, by decide⟩)
    5647 5647 5326 5340 5308 5319 (by decide) (by decide) (by decide) rfl
    213 keys193 49 29 5 corr193 check193

def keys194 : Nat := 0x2000000000000a000000000004000000000001000000000000385b9d5817801b834f9a30980d568a2fc8e406ab3d04fd5c025c9c5d2546011cf81746b4808e7bf6cd97c033d616d2d50019eafe8bc8b0085cccc3cbf8022d9a41257800cab441caa8006556abbed40031406029cf80133bf9a8fa0008a0eb937fc004506c84ef30016ab21ed50000b455319938004ec0781a2c00275f1adbef0003afda6bc1800140f150168
def corr194 : List Raw := [⟨0x200000000000, 0x4baa53de71716771d73465fac7e400000000000000000000000, false⟩, ⟨0x400000000000, 0xfc4a5b4786b7d67d37b356c4844dc00000000000000000000000, false⟩, ⟨0x500000000000, 0x595914dca5dfe9e8e1bd883639333000000000000000000000000, false⟩, ⟨0x800000000000, 0x57f03a350424b6e2e8d9bf628f45000000000000000000000000, false⟩]
theorem check194 : check2 214 keys194 49 27 5 (z3Raw 59 [])
    (windowRaw C0.tree C0.KW C0.MW 5647 14 (windowRaw C1.tree C1.KW C1.MW 5340 3 (windowRaw C2.tree C2.KW C2.MW 5319 6 corr194))) = true := by decide +kernel
theorem boundary194 : rationalLogValue (orderedBlockExpression ⟨194, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨194, by decide⟩) + rawValue 44 220 corr194 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 59 []) (zero3_ordered ⟨59, by decide⟩)
    5647 5661 5340 5343 5319 5325 (by decide) (by decide) (by decide) rfl
    214 keys194 49 27 5 corr194 check194

end MatrixBounds.Numeric.FKLDimData
