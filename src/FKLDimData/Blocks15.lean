module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys135 : Nat := 0x5000000000004000000000002000000000000908041f1edc0673b8e9e258008442f6fecc
def corr135 : List Raw := [⟨0x200000000000, 0x1edd1229b03505bc2dd78b60c000000000000000000000000, false⟩, ⟨0x400000000000, 0xb0c19527d31fce822a6a898348afdec00000000000000000000000, true⟩, ⟨0x500000000000, 0x12fb66eb46123a35263df84b54000000000000000000000000, false⟩]
theorem check135 : check2 218 keys135 48 6 3 (z3Raw 0 [])
    (windowRaw C0.tree C0.KW C0.MW 5170 4 (windowRaw C1.tree C1.KW C1.MW 5122 1 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr135))) = true := by decide +kernel
theorem boundary135 : rationalLogValue (orderedBlockExpression ⟨135, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨135, by decide⟩) + rawValue 44 220 corr135 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 0 []) (zero3_ordered ⟨0, by decide⟩)
    5170 5174 5122 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    218 keys135 48 6 3 corr135 check135

def keys136 : Nat := 0x100000000000050000000000020000000000008000000000001bfd60edb7b80984793554a002fba1a7954a0052875e8ac90016e641df2000084437b80cc
def corr136 : List Raw := [⟨0x200000000000, 0x42a196da1ea664137fb3074e36400000000000000000000000, false⟩, ⟨0x400000000000, 0x2360bd8e3f5e06d4291c9c4d5df800000000000000000000000, false⟩, ⟨0x500000000000, 0x3891173c6f1eb751f03579f8cdc000000000000000000000000, false⟩, ⟨0x800000000000, 0x210b20692e3c494814dafaa7da8646000000000000000000000000, true⟩]
theorem check136 : check2 216 keys136 49 10 4 (z3Raw 1 [])
    (windowRaw C0.tree C0.KW C0.MW 5174 7 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr136))) = true := by decide +kernel
theorem boundary136 : rationalLogValue (orderedBlockExpression ⟨136, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨136, by decide⟩) + rawValue 44 220 corr136 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 1 []) (zero3_ordered ⟨1, by decide⟩)
    5174 5181 5123 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    216 keys136 49 10 4 corr136 check136

def keys137 : Nat := 0x100000000000050000000000020000000000008000000000001c07a0a4b03809bdff55067404b3a781d8060251942d8f9500c6db0e8e0b0061bd876d75c022d40f4d8480071604d71080028b0b966e8800b6a9e270a000416b6aa8aa001f36215e260002dc3642a58000b1bd96fb0
def corr137 : List Raw := [⟨0x200000000000, 0x14ef59f711ebfbde9a0e5ca20fa1000000000000000000000000, false⟩, ⟨0x400000000000, 0x2b4f0d553045242713711b9b1b42000000000000000000000000, false⟩, ⟨0x500000000000, 0x8434aa3a889dad69f4ddc2f8646d000000000000000000000000, false⟩, ⟨0x800000000000, 0xd98e04926f1f804d1c5160c6cb800000000000000000000000, false⟩]
theorem check137 : check2 211 keys137 49 18 5 (z3Raw 2 [])
    (windowRaw C0.tree C0.KW C0.MW 5181 14 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr137))) = true := by decide +kernel
theorem boundary137 : rationalLogValue (orderedBlockExpression ⟨137, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨137, by decide⟩) + rawValue 44 220 corr137 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 2 []) (zero3_ordered ⟨2, by decide⟩)
    5181 5195 5123 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    211 keys137 49 18 5 corr137 check137

def keys138 : Nat := 0x100000000000050000000000020000000000008000000000001c3e50c107b80df50d663de0054f67849452028bf509384e00a21c790bd4803d9c68a617400ea22ec55be0053c8814aa00024ea8e4931000bbd09497a0005cc196994e0014134b9e2e0002e238bd100000b0db22958
def corr138 : List Raw := [⟨0x200000000000, 0x142bfea1e39328ba3bcc1a57430a400000000000000000000000, false⟩, ⟨0x400000000000, 0x8776f408fba7e4bae3d4efc8dfb4c00000000000000000000000, false⟩, ⟨0x500000000000, 0x1d6e763084a23fe206d41aed5e13d000000000000000000000000, false⟩, ⟨0x800000000000, 0xdfcd3c0d762849d881236c4b05f000000000000000000000000, false⟩]
theorem check138 : check2 212 keys138 49 18 5 (z3Raw 3 [])
    (windowRaw C0.tree C0.KW C0.MW 5195 14 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr138))) = true := by decide +kernel
theorem boundary138 : rationalLogValue (orderedBlockExpression ⟨138, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨138, by decide⟩) + rawValue 44 220 corr138 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 3 []) (zero3_ordered ⟨3, by decide⟩)
    5195 5209 5123 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    212 keys138 49 18 5 corr138 check138

def keys139 : Nat := 0x100000000000050000000000020000000000008000000000001ec2b40bc5b00e4420cb53e407211ab443fc029bbb06215500767a2c2b6c801c0f7583da4009442dae79800433501f6d50015e1659a190009ea5fa1d20004aa270d46c0004bb3d08a800012bc737e08000000000008
def corr139 : List Raw := [⟨0x8, 0xaca0ccb2740f181000000000000000000000000, true⟩, ⟨0x200000000000, 0xa144adfee884087867895517acc00000000000000000000000, false⟩, ⟨0x400000000000, 0x1b16e4185962d9fe29405abdd7e38c00000000000000000000000, false⟩, ⟨0x500000000000, 0x837348418512da9ed76efaa1b9220000000000000000000000000, false⟩, ⟨0x800000000000, 0x5c1164bff9a75f7f72f1c0ae9023c00000000000000000000000, false⟩]
theorem check139 : check2 214 keys139 49 18 5 (z3Raw 4 [])
    (windowRaw C0.tree C0.KW C0.MW 5209 13 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr139))) = true := by decide +kernel
theorem boundary139 : rationalLogValue (orderedBlockExpression ⟨139, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨139, by decide⟩) + rawValue 44 220 corr139 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 4 []) (zero3_ordered ⟨4, by decide⟩)
    5209 5222 5123 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    214 keys139 49 18 5 corr139 check139

def keys140 : Nat := 0x80000000000028000000000010000000000004000000000000e4b0843286c071a0a5f250602a697cd4aa901477f989c1800a29f21184b802ab2d972cc00145b6d1b026007e016ca475001c76cdc63b4009810f7ed7400429d8151ae00155036f21b8009bc951db0c0036d40662e00013b161053100028d9b92f00000a28d05c6c
def corr140 : List Raw := [⟨0x200000000000, 0xcc329562b2c63d5b774a2449c76400000000000000000000000, false⟩, ⟨0x400000000000, 0x2f6ac7f72f785b631ce6234d72894400000000000000000000000, false⟩, ⟨0x500000000000, 0x150c681d89c5b5e67731a85916d766000000000000000000000000, false⟩, ⟨0x800000000000, 0x134ad2168033c512810487a1d710b000000000000000000000000, false⟩]
theorem check140 : check2 216 keys140 49 21 5 (z3Raw 5 [])
    (windowRaw C0.tree C0.KW C0.MW 5222 17 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 0 corr140))) = true := by decide +kernel
theorem boundary140 : rationalLogValue (orderedBlockExpression ⟨140, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨140, by decide⟩) + rawValue 44 220 corr140 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 5 []) (zero3_ordered ⟨5, by decide⟩)
    5222 5239 5123 5123 5150 5150 (by decide) (by decide) (by decide) rfl
    216 keys140 49 21 5 corr140 check140

def keys141 : Nat := 0x80000000000028000000000010000000000004000000000000e47fdd4426c070ff7cfcd1e02a403d9cb140140b1c0448b009ff27cca19402c78a68230a01477f0282f40080f2fc4ede001d0c5e2eea0009d6f7c68e200417f60e2c2001640950651800a5316794000038e1b18c2c00147d23b1f80002d93ba78c8000b4a5b39b4
def corr141 : List Raw := [⟨0x200000000000, 0xce6155cee465d1aa4b49900c00c800000000000000000000000, false⟩, ⟨0x400000000000, 0x556dfc9fcc26389d9a95d0b8c0593b800000000000000000000000, true⟩, ⟨0x500000000000, 0x150cfa72d07bfeab6550049c3324cd000000000000000000000000, false⟩, ⟨0x800000000000, 0x14409604606518a5b4a68525cec9a000000000000000000000000, false⟩]
theorem check141 : check2 217 keys141 49 21 5 (z3Raw 6 [])
    (windowRaw C0.tree C0.KW C0.MW 5239 17 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5150 1 corr141))) = true := by decide +kernel
theorem boundary141 : rationalLogValue (orderedBlockExpression ⟨141, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨141, by decide⟩) + rawValue 44 220 corr141 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 6 []) (zero3_ordered ⟨6, by decide⟩)
    5239 5256 5123 5123 5150 5151 (by decide) (by decide) (by decide) rfl
    217 keys141 49 21 5 corr141 check141

def keys142 : Nat := 0x2000000000000a00000000000400000000000100000000000039359a5cd660152707635ae009df5c53e6dc028da96b0d140109aeb67f71003abd3284f60010b380a154c0053b0af5a8e00144a5e0e1a000307df38040000bc0443390
def corr142 : List Raw := [⟨0x200000000000, 0xec3cb8481904d4f07a5808e1e8000000000000000000000000, false⟩, ⟨0x400000000000, 0x375f392cf49e42db5d35042c0b0cc00000000000000000000000, false⟩, ⟨0x500000000000, 0x3e9f8db5d1bdf7950c2e5c1a47630800000000000000000000000, false⟩, ⟨0x800000000000, 0x4d6956ee394fdab9770e2c847cb3800000000000000000000000, false⟩]
theorem check142 : check2 213 keys142 49 15 4 (z3Raw 7 [])
    (windowRaw C0.tree C0.KW C0.MW 5256 11 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr142))) = true := by decide +kernel
theorem boundary142 : rationalLogValue (orderedBlockExpression ⟨142, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨142, by decide⟩) + rawValue 44 220 corr142 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 7 []) (zero3_ordered ⟨7, by decide⟩)
    5256 5267 5123 5123 5151 5151 (by decide) (by decide) (by decide) rfl
    213 keys142 49 15 4 corr142 check142

def keys143 : Nat := 0x100000000000050000000000020000000000008000000000001c9a6a39aae80e0b218fc1b4051c1920852a026cd467ef8700baa9924cb0803d7c7feb90800e7e54af02a005127315535001fab0132c2800b572d99478005820d574bc001dd87377180002c44e88b40000a18b616b0
def corr143 : List Raw := [⟨0x200000000000, 0x13dee1d2707a182643d3fe72300f800000000000000000000000, false⟩, ⟨0x400000000000, 0x1a0ec8bf38c4474f846161b58acd7400000000000000000000000, false⟩, ⟨0x500000000000, 0x52c2e6dd380830fd51abf2b2694b8800000000000000000000000, false⟩, ⟨0x800000000000, 0x26d8dcf2ab6502c042363154b33ec00000000000000000000000, false⟩]
theorem check143 : check2 214 keys143 49 18 5 (z3Raw 8 [])
    (windowRaw C0.tree C0.KW C0.MW 5267 14 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr143))) = true := by decide +kernel
theorem boundary143 : rationalLogValue (orderedBlockExpression ⟨143, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨143, by decide⟩) + rawValue 44 220 corr143 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 8 []) (zero3_ordered ⟨8, by decide⟩)
    5267 5281 5123 5123 5151 5151 (by decide) (by decide) (by decide) rfl
    214 keys143 49 18 5 corr143 check143

def keys144 : Nat := 0x100000000000050000000000020000000000008000000000001c4087e88eb80dfdba0752740515f535386a025d082c959f00c1fc1fbd0f803ffba66f2b800dbdc756fd20053103d8fd90027a9d7127c000b605026e28005136a99262001eff93f04200028993b72c0000855a60370
def corr144 : List Raw := [⟨0x200000000000, 0x10baad902efa4de1a7d2e6048013c00000000000000000000000, false⟩, ⟨0x400000000000, 0x7abee3b039b011354a0f88904d03400000000000000000000000, false⟩, ⟨0x500000000000, 0x171439bb24bccc19af071b83aaedf000000000000000000000000, false⟩, ⟨0x800000000000, 0x8693ae49d2f0c22c5718fb70e70000000000000000000000000, false⟩]
theorem check144 : check2 212 keys144 49 18 5 (z3Raw 9 [])
    (windowRaw C0.tree C0.KW C0.MW 5281 14 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr144))) = true := by decide +kernel
theorem boundary144 : rationalLogValue (orderedBlockExpression ⟨144, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨144, by decide⟩) + rawValue 44 220 corr144 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 9 []) (zero3_ordered ⟨9, by decide⟩)
    5281 5295 5123 5123 5151 5151 (by decide) (by decide) (by decide) rfl
    212 keys144 49 18 5 corr144 check144

def keys145 : Nat := 0x80000000000028000000000010000000000004000000000000e2aab08768804cdae0677a2024ed23078c400c88bba2bcd805e56cf4f4b8009b9777610a0027898231d900100b2d97d08007f36fe1c04
def corr145 : List Raw := [⟨0x200000000000, 0x3df6d441558ea84af3a69346770000000000000000000000000, false⟩, ⟨0x400000000000, 0x84892af0a37d53ebc807c7ffbde800000000000000000000000, false⟩, ⟨0x500000000000, 0x15db0856b250ae7f9ff4a76c9375000000000000000000000000, false⟩, ⟨0x800000000000, 0x42048bc43cfc398451a4b9cb1800000000000000000000000, false⟩]
theorem check145 : check2 208 keys145 49 13 4 (z3Raw 10 [])
    (windowRaw C0.tree C0.KW C0.MW 5295 9 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr145))) = true := by decide +kernel
theorem boundary145 : rationalLogValue (orderedBlockExpression ⟨145, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨145, by decide⟩) + rawValue 44 220 corr145 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 10 []) (zero3_ordered ⟨10, by decide⟩)
    5295 5304 5123 5123 5151 5151 (by decide) (by decide) (by decide) rfl
    208 keys145 49 13 4 corr145 check145

def keys146 : Nat := 0x50000000000040000000000020000000000009727eef5fe806113e9d8720007c427318f8
def corr146 : List Raw := [⟨0x200000000000, 0x1e1fa470f833e807564a13c3e000000000000000000000000, false⟩, ⟨0x400000000000, 0x435970b7deb880f98a9b5ec3c2000000000000000000000000, false⟩, ⟨0x500000000000, 0x49e54e45f9eb6a6cf986b10537000000000000000000000000, false⟩]
theorem check146 : check2 202 keys146 48 6 3 (z3Raw 11 [])
    (windowRaw C0.tree C0.KW C0.MW 5304 3 (windowRaw C1.tree C1.KW C1.MW 5123 0 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr146))) = true := by decide +kernel
theorem boundary146 : rationalLogValue (orderedBlockExpression ⟨146, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨146, by decide⟩) + rawValue 44 220 corr146 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 11 []) (zero3_ordered ⟨11, by decide⟩)
    5304 5307 5123 5123 5151 5151 (by decide) (by decide) (by decide) rfl
    202 keys146 48 6 3 corr146 check146

def keys147 : Nat := 0x5000000000004000000000002000000000000908067a758c0673b6bbcc74008442c9be00
def corr147 : List Raw := [⟨0x200000000000, 0x1ebe5fab8d6e42e6e76554222000000000000000000000000, false⟩, ⟨0x400000000000, 0xc6fb5f228a16d429189aabdde000000000000000000000000, false⟩, ⟨0x500000000000, 0x12d0aa3ebb866d67772b4e4a00000000000000000000000000, false⟩]
theorem check147 : check2 200 keys147 48 6 3 (z3Raw 12 [])
    (windowRaw C0.tree C0.KW C0.MW 5307 0 (windowRaw C1.tree C1.KW C1.MW 5123 3 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr147))) = true := by decide +kernel
theorem boundary147 : rationalLogValue (orderedBlockExpression ⟨147, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨147, by decide⟩) + rawValue 44 220 corr147 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 12 []) (zero3_ordered ⟨12, by decide⟩)
    5307 5307 5123 5126 5151 5151 (by decide) (by decide) (by decide) rfl
    200 keys147 48 6 3 corr147 check147

def keys148 : Nat := 0x50000000000040000000000020000000000009908281092c09908280b08008e1f095fae006973c2cb09805edfea25a1405edfea20aa40086d33d548800817edcf56c00817edcec30
def corr148 : List Raw := [⟨0x200000000000, 0x45534981ddf8099dce4364df915000000000000000000000000, false⟩, ⟨0x400000000000, 0x8c663c18ae2084d691bc9b206eb000000000000000000000000, false⟩, ⟨0x500000000000, 0x170712db99547a755be7a403d155000000000000000000000000, false⟩]
theorem check148 : check2 208 keys148 48 12 4 (z3Raw 13 [])
    (windowRaw C0.tree C0.KW C0.MW 5307 6 (windowRaw C1.tree C1.KW C1.MW 5126 3 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr148))) = true := by decide +kernel
theorem boundary148 : rationalLogValue (orderedBlockExpression ⟨148, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨148, by decide⟩) + rawValue 44 220 corr148 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 13 []) (zero3_ordered ⟨13, by decide⟩)
    5307 5313 5126 5129 5151 5151 (by decide) (by decide) (by decide) rfl
    208 keys148 48 12 4 corr148 check148

def keys149 : Nat := 0x400000000000140000000000080000000000020000000000006ce91a0936a03636cac64b601229a628e2f0090d3dbbde0803379f9cffac019a0e2cb2fb002e73081f29801724c60a014007f5a86b9ee003c24178e4600107061445400082f438c29c
def corr149 : List Raw := [⟨0x200000000000, 0x1d9edcebd8632e19341202fc986b800000000000000000000000, false⟩, ⟨0x400000000000, 0x8bd515a301b4ed3cef7f54d7c358400000000000000000000000, false⟩, ⟨0x500000000000, 0x1a1068ef3b239f59885e8a745859a000000000000000000000000, false⟩, ⟨0x800000000000, 0x90fd105a9ed909df16ea82ba43c400000000000000000000000, false⟩]
theorem check149 : check2 212 keys149 49 16 4 (z3Raw 14 [])
    (windowRaw C0.tree C0.KW C0.MW 5313 9 (windowRaw C1.tree C1.KW C1.MW 5129 3 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr149))) = true := by decide +kernel
theorem boundary149 : rationalLogValue (orderedBlockExpression ⟨149, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨149, by decide⟩) + rawValue 44 220 corr149 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 14 []) (zero3_ordered ⟨14, by decide⟩)
    5313 5322 5129 5132 5151 5151 (by decide) (by decide) (by decide) rfl
    212 keys149 49 16 4 corr149 check149

def keys150 : Nat := 0x100000000000050000000000020000000000008000000000001c8694d106200ab6972f2b9404c837e2a7f40248d942397c00cb5b68d3dc804fd0a88ef500212c201b0f60087d2e926b700216fdb0e9a000b136bf08200040dfd83d9600131791f94700031fa0e32280011c38b9a3c
def corr150 : List Raw := [⟨0x200000000000, 0x2aeda1c5a8389951080d4f72ab86000000000000000000000000, false⟩, ⟨0x400000000000, 0x2d27e0c7c0245798f0ea6546b0cab800000000000000000000000, false⟩, ⟨0x500000000000, 0x8829e0c8fe1593332f7b4b4a62948000000000000000000000000, false⟩, ⟨0x800000000000, 0x2fd766c814987fba92bc18394da1800000000000000000000000, false⟩]
theorem check150 : check2 214 keys150 49 18 5 (z3Raw 15 [])
    (windowRaw C0.tree C0.KW C0.MW 5322 11 (windowRaw C1.tree C1.KW C1.MW 5132 3 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr150))) = true := by decide +kernel
theorem boundary150 : rationalLogValue (orderedBlockExpression ⟨150, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨150, by decide⟩) + rawValue 44 220 corr150 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 15 []) (zero3_ordered ⟨15, by decide⟩)
    5322 5333 5132 5135 5151 5151 (by decide) (by decide) (by decide) rfl
    214 keys150 49 18 5 corr150 check150

def keys151 : Nat := 0x100000000000050000000000020000000000008000000000001c8328541a100a9bd848e61c052db8366f7e026ffdd4b56b00b588ad4b91805113158d42001e22fb1f33e0070d48e12c000252c8b35b700095077c45400049e1a166e40014bd97917100026a03f4fe000098dd74798
def corr151 : List Raw := [⟨0x200000000000, 0x1fa0ba36e40c874a36125bbeda75400000000000000000000000, false⟩, ⟨0x400000000000, 0x6c0bdacce12e9a8e598d29e1f47a400000000000000000000000, false⟩, ⟨0x500000000000, 0x456e0929fa27374d7d287f6c19c5c000000000000000000000000, false⟩, ⟨0x800000000000, 0x40b976dc4ffe9c14752cf1ae28b0800000000000000000000000, false⟩]
theorem check151 : check2 213 keys151 49 18 5 (z3Raw 16 [])
    (windowRaw C0.tree C0.KW C0.MW 5333 11 (windowRaw C1.tree C1.KW C1.MW 5135 3 (windowRaw C2.tree C2.KW C2.MW 5151 0 corr151))) = true := by decide +kernel
theorem boundary151 : rationalLogValue (orderedBlockExpression ⟨151, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨151, by decide⟩) + rawValue 44 220 corr151 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 16 []) (zero3_ordered ⟨16, by decide⟩)
    5333 5344 5135 5138 5151 5151 (by decide) (by decide) (by decide) rfl
    213 keys151 49 18 5 corr151 check151

def keys152 : Nat := 0x400000000000140000000000080000000000020000000000007208e565704038d0f82ad9201541601e62180a3e4ee511bc051e5b02c7fa0281a2ba1f3b00aab6cdbf8f80554bd715bfc027daa40d71001037eefc6d200397f24dbeb8012ff87a406800858524004c002cf642d4580013792f612a0006d938c7390003679d4c9240018fedbc83500029e775ce08000a8c76a16c
def corr152 : List Raw := [⟨0x200000000000, 0x6030e399e66b3ab536649b7df1a000000000000000000000000, false⟩, ⟨0x400000000000, 0x5bae8514435c9e40e52ea78aa2739000000000000000000000000, false⟩, ⟨0x500000000000, 0x2600b19914fed1826d3bc481e03b3a000000000000000000000000, false⟩, ⟨0x800000000000, 0x22eb4d397fd5eb818d4d0df5c6fb8000000000000000000000000, false⟩]
theorem check152 : check2 216 keys152 49 24 5 (z3Raw 17 [])
    (windowRaw C0.tree C0.KW C0.MW 5344 14 (windowRaw C1.tree C1.KW C1.MW 5138 3 (windowRaw C2.tree C2.KW C2.MW 5151 3 corr152))) = true := by decide +kernel
theorem boundary152 : rationalLogValue (orderedBlockExpression ⟨152, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨152, by decide⟩) + rawValue 44 220 corr152 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 17 []) (zero3_ordered ⟨17, by decide⟩)
    5344 5358 5138 5141 5151 5154 (by decide) (by decide) (by decide) rfl
    216 keys152 49 24 5 corr152 check152

def keys153 : Nat := 0x80000000000028000000000010000000000004000000000000e38bf40f4d0070fc208007402a6158e008f0141684d9a3f009b96691d1cc02c1e843a9100144b273a9e800876781bfe5001e547e75edc009d6ebab53c0044abf8a71c0016921b8dd8000a59e7a94a000387685edf4001537fe55890003203888b90000d13b48a68
def corr153 : List Raw := [⟨0x200000000000, 0x177d7bd8475e969c04e6f06d9e40000000000000000000000000, false⟩, ⟨0x400000000000, 0x7588ff3ce05a4b3bb60695526f8b2000000000000000000000000, false⟩, ⟨0x500000000000, 0x3878d3e7ce3d3b4bd54d055cc0a168000000000000000000000000, false⟩, ⟨0x800000000000, 0x3ad4a0785a3bc14e257946b0c3b4e000000000000000000000000, false⟩]
theorem check153 : check2 217 keys153 49 21 5 (z3Raw 18 [])
    (windowRaw C0.tree C0.KW C0.MW 5358 17 (windowRaw C1.tree C1.KW C1.MW 5141 0 (windowRaw C2.tree C2.KW C2.MW 5154 0 corr153))) = true := by decide +kernel
theorem boundary153 : rationalLogValue (orderedBlockExpression ⟨153, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨153, by decide⟩) + rawValue 44 220 corr153 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 18 []) (zero3_ordered ⟨18, by decide⟩)
    5358 5375 5141 5141 5154 5154 (by decide) (by decide) (by decide) rfl
    217 keys153 49 21 5 corr153 check153

def keys154 : Nat := 0x80000000000028000000000010000000000004000000000000e0b8b231fb4054d4fb31b9602a588aeab9201416da4c1ad809a2eee3459402c1d3fe37f201450eb47fd6009e0426ff530043425a9691000fef096c55e004fc65eec720016ab6c25d0800753f61ce3c0038756ec1580015689cd4980003688180ec8000fc639bf3c
def corr154 : List Raw := [⟨0x200000000000, 0x7f6ec33a6943f470617140b6995000000000000000000000000, false⟩, ⟨0x400000000000, 0x187d2c91c18c4d182b514bd61f954800000000000000000000000, false⟩, ⟨0x500000000000, 0x19326bc1a0ef2f3e089b38940fc76b800000000000000000000000, false⟩, ⟨0x800000000000, 0x1fcea17504223b311569ce76d263d800000000000000000000000, false⟩]
theorem check154 : check2 216 keys154 49 21 5 (z3Raw 19 [])
    (windowRaw C0.tree C0.KW C0.MW 5375 11 (windowRaw C1.tree C1.KW C1.MW 5141 3 (windowRaw C2.tree C2.KW C2.MW 5154 3 corr154))) = true := by decide +kernel
theorem boundary154 : rationalLogValue (orderedBlockExpression ⟨154, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨154, by decide⟩) + rawValue 44 220 corr154 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 19 []) (zero3_ordered ⟨19, by decide⟩)
    5375 5386 5141 5144 5154 5157 (by decide) (by decide) (by decide) rfl
    216 keys154 49 21 5 corr154 check154

def keys155 : Nat := 0x400000000000140000000000080000000000020000000000006f71d90c0a002a5ac92cf0201398290e8cf809cb84b9433402df7274b392016f98037a0700a074a4196a801522c80fa54005fcc2ec236001d6597556a000eb16d5a2d00065a893f8a4
def corr155 : List Raw := [⟨0x200000000000, 0x1e72fc198b4694eeccd6cfc9dfa7000000000000000000000000, false⟩, ⟨0x400000000000, 0x47765e7e9c19370af359750bbea68c00000000000000000000000, false⟩, ⟨0x500000000000, 0xd594eb1d7aff164ba2ca16f301344800000000000000000000000, false⟩, ⟨0x800000000000, 0x61efdc243f202e8d3f91df7a35f0400000000000000000000000, false⟩]
theorem check155 : check2 215 keys155 49 16 4 (z3Raw 20 [])
    (windowRaw C0.tree C0.KW C0.MW 5386 6 (windowRaw C1.tree C1.KW C1.MW 5144 3 (windowRaw C2.tree C2.KW C2.MW 5157 3 corr155))) = true := by decide +kernel
theorem boundary155 : rationalLogValue (orderedBlockExpression ⟨155, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨155, by decide⟩) + rawValue 44 220 corr155 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 20 []) (zero3_ordered ⟨20, by decide⟩)
    5386 5392 5144 5147 5157 5160 (by decide) (by decide) (by decide) rfl
    215 keys155 49 16 4 corr155 check155

def keys156 : Nat := 0x100000000000050000000000020000000000008000000000001be5713ce3f00dc0c349807404c8b8018e0c0258dafddb4000c3e900b3cd80432d2997eb00106e6b9d55a0059184709e6002b27bf2176800dadb9a57f4005a04b4412a001f5300bd25000378653a2b800122cc5e928
def corr156 : List Raw := [⟨0x200000000000, 0x2e102be13969e8d729cf79a5f4d0000000000000000000000000, false⟩, ⟨0x400000000000, 0x2e54074e95a57e712db0c8d1617f8000000000000000000000000, false⟩, ⟨0x500000000000, 0xbb5ba69d94ef3a557e790650cf590000000000000000000000000, false⟩, ⟨0x800000000000, 0x86041f7a4293f38d44476602ee38000000000000000000000000, false⟩]
theorem check156 : check2 215 keys156 49 18 5 (z3Raw 21 [])
    (windowRaw C0.tree C0.KW C0.MW 5392 14 (windowRaw C1.tree C1.KW C1.MW 5147 0 (windowRaw C2.tree C2.KW C2.MW 5160 0 corr156))) = true := by decide +kernel
theorem boundary156 : rationalLogValue (orderedBlockExpression ⟨156, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨156, by decide⟩) + rawValue 44 220 corr156 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 21 []) (zero3_ordered ⟨21, by decide⟩)
    5392 5406 5147 5147 5160 5160 (by decide) (by decide) (by decide) rfl
    215 keys156 49 18 5 corr156 check156

def keys157 : Nat := 0x100000000000050000000000020000000000008000000000001b3119311ea8099b3814db9404ace4a8ed0a02498b0e61ad00cb022924f600628348b59540210fbbf655c008687ae8334002e10c26f61800f6ed53f5a00040e13ea8ce001f8088b3260002f532c0ce80011081c4670
def corr157 : List Raw := [⟨0x200000000000, 0x1efdcb66c267597081f97a140258000000000000000000000000, false⟩, ⟨0x400000000000, 0x8c31feb430c0a55c8db1c4f9103c000000000000000000000000, false⟩, ⟨0x500000000000, 0x1cf1ce8935706dae23d8b68a2ca30000000000000000000000000, false⟩, ⟨0x800000000000, 0xcabd3d393f7e0805e98b0f95bf0000000000000000000000000, false⟩]
theorem check157 : check2 212 keys157 49 18 5 (z3Raw 22 [])
    (windowRaw C0.tree C0.KW C0.MW 5406 11 (windowRaw C1.tree C1.KW C1.MW 5147 0 (windowRaw C2.tree C2.KW C2.MW 5160 3 corr157))) = true := by decide +kernel
theorem boundary157 : rationalLogValue (orderedBlockExpression ⟨157, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨157, by decide⟩) + rawValue 44 220 corr157 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 22 []) (zero3_ordered ⟨22, by decide⟩)
    5406 5417 5147 5147 5160 5163 (by decide) (by decide) (by decide) rfl
    212 keys157 49 18 5 corr157 check157

def keys158 : Nat := 0x400000000000140000000000080000000000020000000000006d85d8883ba024ee8aa9c300126c7f44c3a809013da57e18033d0e205056019241dcb23a00c887764d55001677f4472080073e2d5434200212986784f0010171d5aa88008021a32498
def corr158 : List Raw := [⟨0x200000000000, 0xc1d45c29d64160ce2f71a4f6a25000000000000000000000000, false⟩, ⟨0x400000000000, 0x1a0fb34a9ba9ddb9ca1078662735000000000000000000000000, false⟩, ⟨0x500000000000, 0x4bf545c2ac5597ed76784b7c3152000000000000000000000000, false⟩, ⟨0x800000000000, 0x71f59424e56327fef86d4a6ea6000000000000000000000000, false⟩]
theorem check158 : check2 210 keys158 49 16 4 (z3Raw 23 [])
    (windowRaw C0.tree C0.KW C0.MW 5417 6 (windowRaw C1.tree C1.KW C1.MW 5147 0 (windowRaw C2.tree C2.KW C2.MW 5163 6 corr158))) = true := by decide +kernel
theorem boundary158 : rationalLogValue (orderedBlockExpression ⟨158, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨158, by decide⟩) + rawValue 44 220 corr158 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 23 []) (zero3_ordered ⟨23, by decide⟩)
    5417 5423 5147 5147 5163 5169 (by decide) (by decide) (by decide) rfl
    210 keys158 49 16 4 corr158 check158

def keys159 : Nat := 0x50000000000040000000000020000000000009b5bc8494a809b5bc8478ec05ce0fcccccc05ce0fccb2c0007c33aeba48007c33aeb898
def corr159 : List Raw := [⟨0x200000000000, 0x5a6864d9904509277b519c1235000000000000000000000000, false⟩, ⟨0x400000000000, 0x12fac80967f6708b684ae63edcb000000000000000000000000, false⟩, ⟨0x500000000000, 0x2742892d637f78691dc96aa7df0000000000000000000000000, false⟩]
theorem check159 : check2 205 keys159 48 9 4 (z3Raw 24 [])
    (windowRaw C0.tree C0.KW C0.MW 5423 3 (windowRaw C1.tree C1.KW C1.MW 5147 0 (windowRaw C2.tree C2.KW C2.MW 5169 3 corr159))) = true := by decide +kernel
theorem boundary159 : rationalLogValue (orderedBlockExpression ⟨159, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨159, by decide⟩) + rawValue 44 220 corr159 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 24 []) (zero3_ordered ⟨24, by decide⟩)
    5423 5426 5147 5147 5169 5172 (by decide) (by decide) (by decide) rfl
    205 keys159 48 9 4 corr159 check159

def keys160 : Nat := 0x80000000000028000000000010000000000004000000000000dfeb07fa57c04c23c991c50025ca028a90400c227a1506d005f74352927c00a50eba75ca002dcc82dbbc0010886f669c8007c4252d888
def corr160 : List Raw := [⟨0x200000000000, 0x4416d311a540ef78b95174c6e8000000000000000000000000, false⟩, ⟨0x400000000000, 0x11ead334929f3e51f9231d4ad7a400000000000000000000000, false⟩, ⟨0x500000000000, 0x27614688fac0439ebe41849e47e800000000000000000000000, false⟩, ⟨0x800000000000, 0x20f2048b400d53d4e9e378bd80c4dbc00000000000000000000000, true⟩]
theorem check160 : check2 216 keys160 49 13 4 (z3Raw 25 [])
    (windowRaw C0.tree C0.KW C0.MW 5426 0 (windowRaw C1.tree C1.KW C1.MW 5147 7 (windowRaw C2.tree C2.KW C2.MW 5172 3 corr160))) = true := by decide +kernel
theorem boundary160 : rationalLogValue (orderedBlockExpression ⟨160, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨160, by decide⟩) + rawValue 44 220 corr160 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 25 []) (zero3_ordered ⟨25, by decide⟩)
    5426 5426 5147 5154 5172 5175 (by decide) (by decide) (by decide) rfl
    216 keys160 49 13 4 corr160 check160

def keys161 : Nat := 0x80000000000028000000000010000000000004000000000000d9a4ee0e600048f03bc64e4023ce404064c00d0a0b8e3a90065e0c9bf17c00b986149c48003ca93d785c0010ed45193100083ebeb44bc
def corr161 : List Raw := [⟨0x200000000000, 0x5e2738751be6b772004d6cea738800000000000000000000000, false⟩, ⟨0x400000000000, 0x108be3bc5414daef83da5b3a5ac1800000000000000000000000, false⟩, ⟨0x500000000000, 0x2cfbe1c0aab232286621e499383f000000000000000000000000, false⟩, ⟨0x800000000000, 0x73e03fdeda4ef98020cdf6fe06000000000000000000000000, false⟩]
theorem check161 : check2 209 keys161 49 13 4 (z3Raw 26 [])
    (windowRaw C0.tree C0.KW C0.MW 5426 3 (windowRaw C1.tree C1.KW C1.MW 5154 6 (windowRaw C2.tree C2.KW C2.MW 5175 0 corr161))) = true := by decide +kernel
theorem boundary161 : rationalLogValue (orderedBlockExpression ⟨161, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨161, by decide⟩) + rawValue 44 220 corr161 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 26 []) (zero3_ordered ⟨26, by decide⟩)
    5426 5429 5154 5160 5175 5175 (by decide) (by decide) (by decide) rfl
    209 keys161 49 13 4 corr161 check161

def keys162 : Nat := 0x400000000000140000000000080000000000020000000000006c4dc1d6c2e03626e0e2c6d01179f056338808bcf8207870035ccd7774b201ae66b9400e002f0c6239c880178631123a4007ef25ac004003f792d010000112d9e13c5800896cefe604
def corr162 : List Raw := [⟨0x200000000000, 0x2667eab45efe65c690128753439e000000000000000000000000, false⟩, ⟨0x400000000000, 0x8844f01e853ec6e2585cd714dce2000000000000000000000000, false⟩, ⟨0x500000000000, 0x19bd58572694885bdc31e5ea71de8000000000000000000000000, false⟩, ⟨0x800000000000, 0x7d30a16a42b39f1cf90a197df80000000000000000000000000, false⟩]
theorem check162 : check2 212 keys162 49 16 4 (z3Raw 27 [])
    (windowRaw C0.tree C0.KW C0.MW 5429 6 (windowRaw C1.tree C1.KW C1.MW 5160 6 (windowRaw C2.tree C2.KW C2.MW 5175 0 corr162))) = true := by decide +kernel
theorem boundary162 : rationalLogValue (orderedBlockExpression ⟨162, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨162, by decide⟩) + rawValue 44 220 corr162 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 27 []) (zero3_ordered ⟨27, by decide⟩)
    5429 5435 5160 5166 5175 5175 (by decide) (by decide) (by decide) rfl
    212 keys162 49 16 4 corr162 check162

def keys163 : Nat := 0x80000000000028000000000010000000000004000000000000d75d9bab6e406b6d94029b602608be6b889011ea658ce30808f3ad9ce4540341ff33f06201a0a77644f8008564936aa500221b4ceeb1800bf4a0b0254005f1e31a94f0022772d34fd8010dad7ea3e0004429fd9d7400220bd81ea70003b509d04b000134eac5b44
def corr163 : List Raw := [⟨0x200000000000, 0x4349b531fa48467f482a06c815d6000000000000000000000000, false⟩, ⟨0x400000000000, 0x279c39fb5a0b451b898e3647e3474000000000000000000000000, false⟩, ⟨0x500000000000, 0x8b5f13f872236541a09627dc31b08000000000000000000000000, false⟩, ⟨0x800000000000, 0x54dac9af84d7d31768429dc690b8400000000000000000000000, false⟩]
theorem check163 : check2 214 keys163 49 21 5 (z3Raw 28 [])
    (windowRaw C0.tree C0.KW C0.MW 5435 11 (windowRaw C1.tree C1.KW C1.MW 5166 6 (windowRaw C2.tree C2.KW C2.MW 5175 0 corr163))) = true := by decide +kernel
theorem boundary163 : rationalLogValue (orderedBlockExpression ⟨163, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨163, by decide⟩) + rawValue 44 220 corr163 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 28 []) (zero3_ordered ⟨28, by decide⟩)
    5435 5446 5166 5172 5175 5175 (by decide) (by decide) (by decide) rfl
    214 keys163 49 21 5 corr163 check163

def keys164 : Nat := 0x100000000000050000000000020000000000008000000000001c88669ec0180e2ee4003c6805592613ab4402744916add6009f41830beb0043e6bb5b5e000e79e2789ce004cbb02b0f5002141d590e9800b1be0418a8004f17fa7fe20014e9f012880002c11f3b640000b2aa6a40c
def corr164 : List Raw := [⟨0x200000000000, 0x278b680303c9bc1f8295642064c8000000000000000000000000, false⟩, ⟨0x400000000000, 0x5821adbb0fdbefe8bb142a85daa79000000000000000000000000, false⟩, ⟨0x500000000000, 0x1e316db167c308d5e96f72a3a49851000000000000000000000000, false⟩, ⟨0x800000000000, 0x19bad22e80165c3d62feb3b5915ff000000000000000000000000, false⟩]
theorem check164 : check2 216 keys164 49 18 5 (z3Raw 29 [])
    (windowRaw C0.tree C0.KW C0.MW 5446 14 (windowRaw C1.tree C1.KW C1.MW 5172 0 (windowRaw C2.tree C2.KW C2.MW 5175 0 corr164))) = true := by decide +kernel
theorem boundary164 : rationalLogValue (orderedBlockExpression ⟨164, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨164, by decide⟩) + rawValue 44 220 corr164 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 29 []) (zero3_ordered ⟨29, by decide⟩)
    5446 5460 5172 5172 5175 5175 (by decide) (by decide) (by decide) rfl
    216 keys164 49 18 5 corr164 check164

end MatrixBounds.Numeric.FKLDimData
