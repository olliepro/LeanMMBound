module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys225 : Nat := 0x80000000000028000000000010000000000004000000000000e47770ea6a4070fe0491df202a39963e7b60140a263d1fc009fee02117c002c7ab4325560147e0cee6430080fd7e780d001d0e1770bf0009d7d74072200418b00cc7200164b9dc4f2800a54485b5d80038e4ac4eca001485cd32070002d9feb7350000b4f80ea20
def corr225 : List Raw := [⟨0x200000000000, 0xcdbc82f2f46ac81b2757a1d11e6800000000000000000000000, false⟩, ⟨0x400000000000, 0x2e3de3870a1dec4c2488cfb93f178000000000000000000000000, false⟩, ⟨0x500000000000, 0x14f93b8e9c96473dfa916a05370637000000000000000000000000, false⟩, ⟨0x800000000000, 0x142fc9c59ee161a332cbdf511b809800000000000000000000000, false⟩]
theorem check225 : check2 216 keys225 49 21 5 (z3Raw 90 [])
    (windowRaw C0.tree C0.KW C0.MW 5762 0 (windowRaw C1.tree C1.KW C1.MW 5549 0 (windowRaw C2.tree C2.KW C2.MW 5559 17 corr225))) = true := by decide +kernel
theorem boundary225 : rationalLogValue (orderedBlockExpression ⟨225, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨225, by decide⟩) + rawValue 44 220 corr225 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 90 []) (zero3_ordered ⟨90, by decide⟩)
    5762 5762 5549 5549 5559 5576 (by decide) (by decide) (by decide) rfl
    216 keys225 49 21 5 corr225 check225

def keys226 : Nat := 0x80000000000028000000000010000000000004000000000000e494ab8fedc071968e34b4602a52228c2e701473aa240f680a27b17fbfac02ac5acc10fa014709b1ce4a007e30156531001c8008ba2200098618154160042cc5e639c00157079ae568009c6b36c1480036baaaeb2c0013d4256ecf0002914496928000a4324c018
def corr226 : List Raw := [⟨0x200000000000, 0xcd74b35ca4e7fc204b44ae83fa1000000000000000000000000, false⟩, ⟨0x400000000000, 0x2f3208437c026557964bd06f47685000000000000000000000000, false⟩, ⟨0x500000000000, 0x14eb6d4cb299586a462b3b4c9e6f58000000000000000000000000, false⟩, ⟨0x800000000000, 0x1333a37de91f47e07ee124bc133a1000000000000000000000000, false⟩]
theorem check226 : check2 215 keys226 49 21 5 (z3Raw 91 [])
    (windowRaw C0.tree C0.KW C0.MW 5762 0 (windowRaw C1.tree C1.KW C1.MW 5549 17 (windowRaw C2.tree C2.KW C2.MW 5576 0 corr226))) = true := by decide +kernel
theorem boundary226 : rationalLogValue (orderedBlockExpression ⟨226, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨226, by decide⟩) + rawValue 44 220 corr226 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 91 []) (zero3_ordered ⟨91, by decide⟩)
    5762 5762 5549 5566 5576 5576 (by decide) (by decide) (by decide) rfl
    215 keys226 49 21 5 corr226 check226

def keys227 : Nat := 0x100000000000050000000000020000000000008000000000001c66bf27dd300a3c0d42eb04051dff8d32fa028123e4b70800aad670028800556a6c3f6400207a11d908000731fe4ddda00260e6617db0009c2d3b52900036a6b2c2e6001b52fe47af0002a1a074668000aa19ae844
def corr227 : List Raw := [⟨0x200000000000, 0x56efeeafead692ccdb2bf0ea6ae800000000000000000000000, false⟩, ⟨0x400000000000, 0x165df4c34ca9bbcd1b39fb5310c52000000000000000000000000, false⟩, ⟨0x500000000000, 0x19052d5a25ca4179abcb027d8987c9800000000000000000000000, false⟩, ⟨0x800000000000, 0x1e04923bda8491f5a2896b2da626b800000000000000000000000, false⟩]
theorem check227 : check2 216 keys227 49 18 5 (z3Raw 92 [])
    (windowRaw C0.tree C0.KW C0.MW 5762 3 (windowRaw C1.tree C1.KW C1.MW 5566 11 (windowRaw C2.tree C2.KW C2.MW 5576 0 corr227))) = true := by decide +kernel
theorem boundary227 : rationalLogValue (orderedBlockExpression ⟨227, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨227, by decide⟩) + rawValue 44 220 corr227 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 92 []) (zero3_ordered ⟨92, by decide⟩)
    5762 5765 5566 5577 5576 5576 (by decide) (by decide) (by decide) rfl
    216 keys227 49 18 5 corr227 check227

def keys228 : Nat := 0x80000000000028000000000010000000000004000000000000e3f1f491ef0054d50e4856602a57485b6a000a2d16f5310005008d223c780085e60af8bc002d45283be6000c9a22971780053a26e8d00
def corr228 : List Raw := [⟨0x200000000000, 0x1c2a4f79843269c7ca4e2ab575d7800000000000000000000000, false⟩, ⟨0x400000000000, 0x48e54f982212ce58fd8c72b051ae6800000000000000000000000, false⟩, ⟨0x500000000000, 0xd8633643d8eb48b1f03c214c30b98800000000000000000000000, false⟩, ⟨0x800000000000, 0x4d4c4a9e879cc6a20feaaa456f42000000000000000000000000, false⟩]
theorem check228 : check2 215 keys228 49 13 4 (z3Raw 93 [])
    (windowRaw C0.tree C0.KW C0.MW 5765 0 (windowRaw C1.tree C1.KW C1.MW 5577 6 (windowRaw C2.tree C2.KW C2.MW 5576 3 corr228))) = true := by decide +kernel
theorem boundary228 : rationalLogValue (orderedBlockExpression ⟨228, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨228, by decide⟩) + rawValue 44 220 corr228 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 93 []) (zero3_ordered ⟨93, by decide⟩)
    5765 5765 5577 5583 5576 5579 (by decide) (by decide) (by decide) rfl
    215 keys228 49 13 4 corr228 check228

def keys229 : Nat := 0x400000000000140000000000080000000000020000000000007210b38a544038b9539210301b62210b74680aac0afd25dc04e79196f02e026b9cde0ff600b818041f72004ff8e80a4f8021fe00938f40073ee5be6f800304b9cad9900133140f0f2c00856eb38a2c003324a5364100166184f4240009e970c6cc800486633624c001519a08d4b0002c4688b0d8000b400bb970
def corr229 : List Raw := [⟨0x200000000000, 0x2c8d385c9f756637c4b01f3c74e9800000000000000000000000, false⟩, ⟨0x400000000000, 0x5c1f8cdc17e4197c388165777223fc00000000000000000000000, false⟩, ⟨0x500000000000, 0x1ee95d689073add75ae1d0edc771dc800000000000000000000000, false⟩, ⟨0x800000000000, 0x1a190037dc0ae1bcd213447707bbb800000000000000000000000, false⟩]
theorem check229 : check2 216 keys229 49 24 5 (z3Raw 94 [])
    (windowRaw C0.tree C0.KW C0.MW 5765 0 (windowRaw C1.tree C1.KW C1.MW 5583 14 (windowRaw C2.tree C2.KW C2.MW 5579 6 corr229))) = true := by decide +kernel
theorem boundary229 : rationalLogValue (orderedBlockExpression ⟨229, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨229, by decide⟩) + rawValue 44 220 corr229 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 94 []) (zero3_ordered ⟨94, by decide⟩)
    5765 5765 5583 5597 5579 5585 (by decide) (by decide) (by decide) rfl
    216 keys229 49 24 5 corr229 check229

def keys230 : Nat := 0x2000000000000a00000000000400000000000100000000000035977d0926c01acbbe48c4300a85514726ac04bd05a63a90025e82d0fda8008593bfdcc08042c9dfd419401d6d5e4c118008a14cd278700450a65e76b001cd02ef572400c35daa08d00061aed1d52700226cb0f18900113657661b4000eb92389e400075c90b1af0002722862bd000139142a2c8
def corr230 : List Raw := [⟨0x200000000000, 0x32abef2441b66e9a0afe0795130000000000000000000000000, false⟩, ⟨0x400000000000, 0x3a10661140fd6ee3ac9c4a9c1a766000000000000000000000000, false⟩, ⟨0x500000000000, 0x11d3177f500332687f469a400d7618000000000000000000000000, false⟩, ⟨0x800000000000, 0x104f423052c294747ab675072ceea000000000000000000000000, false⟩]
theorem check230 : check2 215 keys230 49 23 5 (z3Raw 95 [])
    (windowRaw C0.tree C0.KW C0.MW 5765 3 (windowRaw C1.tree C1.KW C1.MW 5597 8 (windowRaw C2.tree C2.KW C2.MW 5585 8 corr230))) = true := by decide +kernel
theorem boundary230 : rationalLogValue (orderedBlockExpression ⟨230, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨230, by decide⟩) + rawValue 44 220 corr230 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 95 []) (zero3_ordered ⟨95, by decide⟩)
    5765 5768 5597 5605 5585 5593 (by decide) (by decide) (by decide) rfl
    215 keys230 49 23 5 corr230 check230

def keys231 : Nat := 0x2000000000000a0000000000040000000000010000000000003c7a6ec0da201c5c79a71c0808f34f9808240479a794b08a019f8c761d5d00cfc5fa2ef3801332cd176040070b227e4bc0027a596befe0011d012d0080008e7efe2978
def corr231 : List Raw := [⟨0x200000000000, 0x361bbfa31cb96fbffa30a088160c000000000000000000000000, false⟩, ⟨0x400000000000, 0x89e377945e147aa6068b037c7afc000000000000000000000000, false⟩, ⟨0x500000000000, 0x1acdef5540bdccc344eb106c70f94000000000000000000000000, false⟩, ⟨0x800000000000, 0x4944bfc400156b8f3445bfb6ef8000000000000000000000000, false⟩]
theorem check231 : check2 212 keys231 49 15 4 (z3Raw 96 [])
    (windowRaw C0.tree C0.KW C0.MW 5768 2 (windowRaw C1.tree C1.KW C1.MW 5605 3 (windowRaw C2.tree C2.KW C2.MW 5593 6 corr231))) = true := by decide +kernel
theorem boundary231 : rationalLogValue (orderedBlockExpression ⟨231, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨231, by decide⟩) + rawValue 44 220 corr231 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 96 []) (zero3_ordered ⟨96, by decide⟩)
    5768 5770 5605 5608 5593 5599 (by decide) (by decide) (by decide) rfl
    212 keys231 49 15 4 corr231 check231

def keys232 : Nat := 0x80000000000028000000000010000000000004000000000000e421807531806d87db3540602ab02d96d440139e47c9e70809ae7302d0f002e0604c3630013fe385b7020087f7cc4a89001cfbab4ae0400c131e769060042b73d774f0019941950bd000b30b02cfac004866326158001519a0dbba0002c46367d10000b3fe8cba8
def corr232 : List Raw := [⟨0x200000000000, 0x2c9b8020ccf36dce222f2ee4b866800000000000000000000000, false⟩, ⟨0x400000000000, 0x58bba2e463b15abc8968fb37b02bf000000000000000000000000, false⟩, ⟨0x500000000000, 0x1e4a62d72946cc1f243a4515521735000000000000000000000000, false⟩, ⟨0x800000000000, 0x19d81b065e22291befe54ae725557800000000000000000000000, false⟩]
theorem check232 : check2 216 keys232 49 21 5 (z3Raw 97 [])
    (windowRaw C0.tree C0.KW C0.MW 5770 0 (windowRaw C1.tree C1.KW C1.MW 5608 6 (windowRaw C2.tree C2.KW C2.MW 5599 11 corr232))) = true := by decide +kernel
theorem boundary232 : rationalLogValue (orderedBlockExpression ⟨232, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨232, by decide⟩) + rawValue 44 220 corr232 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 97 []) (zero3_ordered ⟨97, by decide⟩)
    5770 5770 5608 5614 5599 5610 (by decide) (by decide) (by decide) rfl
    216 keys232 49 21 5 corr232 check232

def keys233 : Nat := 0x4000000000001400000000000800000000000200000000000071f91bfc7c2038cdcb2cb6b0153541f4c7680a3c51db6e60051cd53ac422028129930f3e00ab1940cb36005565e77236c028046f1e5b40103ccff43e200398f3671fa801306bc34c200085e3da6738002d4532e8830013842e30c68006d8b841e0c0036a7d6b71a0019344874390002a17b06738000aa02af010
def corr233 : List Raw := [⟨0x200000000000, 0x60a476cbdb75b93c3ca6ac0438c000000000000000000000000, false⟩, ⟨0x400000000000, 0x5bb7b21808c211f4f30a493309c97000000000000000000000000, false⟩, ⟨0x500000000000, 0x25f83ca8936012f07f5394a283285d800000000000000000000000, false⟩, ⟨0x800000000000, 0x22eeb4433cf5944f2e83e5b055013000000000000000000000000, false⟩]
theorem check233 : check2 216 keys233 49 24 5 (z3Raw 98 [])
    (windowRaw C0.tree C0.KW C0.MW 5770 3 (windowRaw C1.tree C1.KW C1.MW 5614 3 (windowRaw C2.tree C2.KW C2.MW 5610 14 corr233))) = true := by decide +kernel
theorem boundary233 : rationalLogValue (orderedBlockExpression ⟨233, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨233, by decide⟩) + rawValue 44 220 corr233 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 98 []) (zero3_ordered ⟨98, by decide⟩)
    5770 5773 5614 5617 5610 5624 (by decide) (by decide) (by decide) rfl
    216 keys233 49 24 5 corr233 check233

def keys234 : Nat := 0x5000000000004000000000002000000000000a95d351e76c0a3ae7b031f40557b1fe7f90051689e53b28006d66514e7c0053a2c8dd6c
def corr234 : List Raw := [⟨0x200000000000, 0x1ce26df60bd9c67477146cfde66c000000000000000000000000, false⟩, ⟨0x400000000000, 0x3eaf9646a19a009e6aeb93021994000000000000000000000000, false⟩, ⟨0x500000000000, 0xb27764e1cca90227375786a16054000000000000000000000000, false⟩]
theorem check234 : check2 211 keys234 48 9 4 (z3Raw 99 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5617 0 (windowRaw C2.tree C2.KW C2.MW 5624 6 corr234))) = true := by decide +kernel
theorem boundary234 : rationalLogValue (orderedBlockExpression ⟨234, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨234, by decide⟩) + rawValue 44 220 corr234 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 99 []) (zero3_ordered ⟨99, by decide⟩)
    5773 5773 5617 5617 5624 5630 (by decide) (by decide) (by decide) rfl
    211 keys234 48 9 4 corr234 check234

def keys235 : Nat := 0x100000000000050000000000020000000000008000000000001c92ac048c900e3331782394054a45ff49ea028a083b841600a3841df887803f13b4e36dc00e3f19a436e004c287875350021649db59c800ab85100cd4004e165303cc0013d4c469fc0002909503960000a3be71540
def corr235 : List Raw := [⟨0x200000000000, 0xba30180080a9d758c6360422f7f000000000000000000000000, false⟩, ⟨0x400000000000, 0x2f3b0bf255ddc5fe4cdf847d7b37a000000000000000000000000, false⟩, ⟨0x500000000000, 0x14f814fc2db5d7c1e6387d03a32a5e000000000000000000000000, false⟩, ⟨0x800000000000, 0x1343de07796b02b493ae97c9f07ad000000000000000000000000, false⟩]
theorem check235 : check2 216 keys235 49 18 5 (z3Raw 100 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5617 0 (windowRaw C2.tree C2.KW C2.MW 5630 14 corr235))) = true := by decide +kernel
theorem boundary235 : rationalLogValue (orderedBlockExpression ⟨235, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨235, by decide⟩) + rawValue 44 220 corr235 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 100 []) (zero3_ordered ⟨100, by decide⟩)
    5773 5773 5617 5617 5630 5644 (by decide) (by decide) (by decide) rfl
    216 keys235 49 18 5 corr235 check235

def keys236 : Nat := 0x80000000000028000000000010000000000004000000000000e3fee78bb44071fe0532ce402a4259b56f5014d115d095000a5c48a9aa5c029c6732b31a014780a732610077040dc4f6801c28528c3600094d503869a00438bae9b0400164213e74500096678037880035747877b8001459bd76aa000266a3720d800099a653a00
def corr236 : List Raw := [⟨0x200000000000, 0x1550d051721e7cb249878e801fed800000000000000000000000, false⟩, ⟨0x400000000000, 0x1dc9110f820ba64390a9d20e7a0f8000000000000000000000000, false⟩, ⟨0x500000000000, 0x8a943feb0fb638965a7b513886dde000000000000000000000000, false⟩, ⟨0x800000000000, 0x5be29f4642d36dbf99e1c2a1905a800000000000000000000000, false⟩]
theorem check236 : check2 214 keys236 49 21 5 (z3Raw 101 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5617 17 (windowRaw C2.tree C2.KW C2.MW 5644 0 corr236))) = true := by decide +kernel
theorem boundary236 : rationalLogValue (orderedBlockExpression ⟨236, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨236, by decide⟩) + rawValue 44 220 corr236 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 101 []) (zero3_ordered ⟨101, by decide⟩)
    5773 5773 5617 5634 5644 5644 (by decide) (by decide) (by decide) rfl
    214 keys236 49 21 5 corr236 check236

def keys237 : Nat := 0x80000000000028000000000010000000000004000000000000e3e90b49eb4071f27d3313c02a995bbdff8014aa47136bd009bd0da37a3402d77c9235ee0142e0282586007912a30dd6001c4e6bb5f64009585a8b62c004338c1898800169188a76580096a50831300049fc9c0cf800138a1bfa82000272dea36300009c9ad60ec
def corr237 : List Raw := [⟨0x200000000000, 0x29ddbab4254d8600d73892656655400000000000000000000000, false⟩, ⟨0x400000000000, 0x2f464761a563f74176bc9fdaa6b23400000000000000000000000, false⟩, ⟨0x500000000000, 0xbd61bf801499c03d7eee62b23e746000000000000000000000000, false⟩, ⟨0x800000000000, 0x6c9684a343fba36f03da5b861ac3800000000000000000000000, false⟩]
theorem check237 : check2 215 keys237 49 21 5 (z3Raw 102 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5634 14 (windowRaw C2.tree C2.KW C2.MW 5644 3 corr237))) = true := by decide +kernel
theorem boundary237 : rationalLogValue (orderedBlockExpression ⟨237, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨237, by decide⟩) + rawValue 44 220 corr237 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 102 []) (zero3_ordered ⟨102, by decide⟩)
    5773 5773 5634 5648 5644 5647 (by decide) (by decide) (by decide) rfl
    215 keys237 49 21 5 corr237 check237

def keys238 : Nat := 0x80000000000028000000000010000000000004000000000000d72a1ed7f6806b5ebf87702025fe01ed50b011e6558be0b008f32abd8f1403418ee92fb401a0c772797800857801ef62802231fee0d3800c035652bc6005fae4852d5002277a8974e0010ea4f135440044dbb814e400226ddc04610003c6a166e8000136a7bec48
def corr238 : List Raw := [⟨0x200000000000, 0x442f09e0c8d2b32774c95494ea80000000000000000000000000, false⟩, ⟨0x400000000000, 0x2765876b54e8273b4856b2a8937c0000000000000000000000000, false⟩, ⟨0x500000000000, 0x8b2c8db1106da36e7cad3b8d22c00000000000000000000000000, false⟩, ⟨0x800000000000, 0x55004997c4d3c1a763c27b9c8d40000000000000000000000000, false⟩]
theorem check238 : check2 214 keys238 49 21 5 (z3Raw 103 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5648 11 (windowRaw C2.tree C2.KW C2.MW 5647 6 corr238))) = true := by decide +kernel
theorem boundary238 : rationalLogValue (orderedBlockExpression ⟨238, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨238, by decide⟩) + rawValue 44 220 corr238 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 103 []) (zero3_ordered ⟨103, by decide⟩)
    5773 5773 5648 5659 5647 5653 (by decide) (by decide) (by decide) rfl
    214 keys238 49 21 5 corr238 check238

def keys239 : Nat := 0x100000000000050000000000020000000000008000000000001ae543ec9ee80d6bd80b331804bfc0085884023ccad6475500d063a44a5e0042bc02013b001119031289600601aaf707a002fd723c68180113bd370b0000875275be4000226de123ef0003c69ed3c6800136a764be8
def corr239 : List Raw := [⟨0x200000000000, 0x13b8fe15d3a42a2b149b16eee41d000000000000000000000000, false⟩, ⟨0x400000000000, 0x23496541601beef406c0774e0c679800000000000000000000000, false⟩, ⟨0x500000000000, 0x7d2ad85ac73cfc32330dce0e237b0000000000000000000000000, false⟩, ⟨0x800000000000, 0x5512e1202d8d59d15c099f56d69c800000000000000000000000, false⟩]
theorem check239 : check2 214 keys239 49 18 5 (z3Raw 104 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5659 6 (windowRaw C2.tree C2.KW C2.MW 5653 8 corr239))) = true := by decide +kernel
theorem boundary239 : rationalLogValue (orderedBlockExpression ⟨239, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨239, by decide⟩) + rawValue 44 220 corr239 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 104 []) (zero3_ordered ⟨104, by decide⟩)
    5773 5773 5659 5665 5653 5661 (by decide) (by decide) (by decide) rfl
    214 keys239 49 18 5 corr239 check239

def keys240 : Nat := 0x100000000000050000000000020000000000008000000000001c7d22c3eb200e3e5061f560052a930d9f38023ccb13425700d06388daea803c89382857400e27300ca0c004ac2c2c5b700219c4fb3ba000b48c206ca0004b524979e200226ddb07d4000272da2e0f00009c98f378c
def corr240 : List Raw := [⟨0x200000000000, 0x312ab889eb7a2edcf6416045c9dd800000000000000000000000, false⟩, ⟨0x400000000000, 0x2e6f567ff7e7ca10b5004e4268cb8c00000000000000000000000, false⟩, ⟨0x500000000000, 0xbc876759bfdb1dffee65b093d2745000000000000000000000000, false⟩, ⟨0x800000000000, 0x6cdd9f7aad4ccc09b2ee65b042a7c00000000000000000000000, false⟩]
theorem check240 : check2 215 keys240 49 18 5 (z3Raw 105 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5665 0 (windowRaw C2.tree C2.KW C2.MW 5661 14 corr240))) = true := by decide +kernel
theorem boundary240 : rationalLogValue (orderedBlockExpression ⟨240, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨240, by decide⟩) + rawValue 44 220 corr240 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 105 []) (zero3_ordered ⟨105, by decide⟩)
    5773 5773 5665 5665 5661 5675 (by decide) (by decide) (by decide) rfl
    215 keys240 49 18 5 corr240 check240

def keys241 : Nat := 0x40000000000014000000000008000000000002000000000000720005f2bd402a995f60251014b920c9486009bd0c74b5fc02d77cbd3a8a014e20d8aab300a17014653080129a2f1afd0004b2e27fc440024fe84353c000d5d8716208004e2784cd38
def corr241 : List Raw := [⟨0x200000000000, 0x29651414965ff6c09d28906f90e9400000000000000000000000, false⟩, ⟨0x400000000000, 0x6c7be2408fd909cabe540bd42b6ec00000000000000000000000, false⟩, ⟨0x500000000000, 0x1331a5209c92cf57ff5307a6174f1000000000000000000000000, false⟩, ⟨0x800000000000, 0x14701256066a2e0218363bc43a8000000000000000000000000, false⟩]
theorem check241 : check2 212 keys241 49 16 4 (z3Raw 106 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5665 3 (windowRaw C2.tree C2.KW C2.MW 5675 9 corr241))) = true := by decide +kernel
theorem boundary241 : rationalLogValue (orderedBlockExpression ⟨241, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨241, by decide⟩) + rawValue 44 220 corr241 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 106 []) (zero3_ordered ⟨106, by decide⟩)
    5773 5773 5665 5668 5675 5684 (by decide) (by decide) (by decide) rfl
    212 keys241 49 16 4 corr241 check241

def keys242 : Nat := 0x100000000000050000000000020000000000008000000000001d2fc83ec8080e3fc684ce9c05484bec052a029a2814ea4e00a3c01ca78d803b8132445dc00e13fae298a00438a674c1d00205620f22a800b20fde00f00032b56c8554001459d0ae50000266823f33000099919c440
def corr242 : List Raw := [⟨0x200000000000, 0x15571f63b10faae6634e3698c50fc00000000000000000000000, false⟩, ⟨0x400000000000, 0x1cf0ad63de97ff82f296fe3a17c72400000000000000000000000, false⟩, ⟨0x500000000000, 0x8842249df39c9267edb729e2ff8b6800000000000000000000000, false⟩, ⟨0x800000000000, 0x5b0e3c5d84e26ebf4909240f906e800000000000000000000000, false⟩]
theorem check242 : check2 214 keys242 49 18 5 (z3Raw 107 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5668 3 (windowRaw C2.tree C2.KW C2.MW 5684 11 corr242))) = true := by decide +kernel
theorem boundary242 : rationalLogValue (orderedBlockExpression ⟨242, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨242, by decide⟩) + rawValue 44 220 corr242 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 107 []) (zero3_ordered ⟨107, by decide⟩)
    5773 5773 5668 5671 5684 5695 (by decide) (by decide) (by decide) rfl
    214 keys242 49 18 5 corr242 check242

def keys243 : Nat := 0x400000000000140000000000080000000000020000000000006f6cc8e99ca028ac555a1030130eb342e4c0095a2b52b2bc0313e277c162010a1a4531e7007b3ef66b4480223764499fc00ebe319f61800546976cce800181820f3198007e0fbdca80000d274b6db40005ed3049e100024f0dca140000b78010e1c
def corr243 : List Raw := [⟨0x200000000000, 0x11d74a043d06a37d30eef8a4bb0c000000000000000000000000, false⟩, ⟨0x400000000000, 0x79820fdd6521463c3defe4339930000000000000000000000000, false⟩, ⟨0x500000000000, 0x1e049c39234a3c126c7f08ec83bcf000000000000000000000000, false⟩, ⟨0x800000000000, 0x11f5ce9f19b81a8d85697c90bd35800000000000000000000000, false⟩]
theorem check243 : check2 212 keys243 49 20 5 (z3Raw 108 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5671 16 (windowRaw C2.tree C2.KW C2.MW 5695 0 corr243))) = true := by decide +kernel
theorem boundary243 : rationalLogValue (orderedBlockExpression ⟨243, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨243, by decide⟩) + rawValue 44 220 corr243 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 108 []) (zero3_ordered ⟨108, by decide⟩)
    5773 5773 5671 5687 5695 5695 (by decide) (by decide) (by decide) rfl
    212 keys243 49 20 5 corr243 check243

def keys244 : Nat := 0x400000000000140000000000080000000000020000000000006c27b7476e803606652c84c0121c568535f0090552a4c1fc033b2a551e20019b88f2e389002f9dd9ed8c0017659b8eec4008257af11b600405df95c9c00108b16203880083b0f1d6e4
def corr244 : List Raw := [⟨0x200000000000, 0x22920b841d4d1739531baab4d5ee000000000000000000000000, false⟩, ⟨0x400000000000, 0xb4c4cb2d7a514a8273ed1edbec86000000000000000000000000, false⟩, ⟨0x500000000000, 0x21b100b5d2af5aacdda1c7184acc8000000000000000000000000, false⟩, ⟨0x800000000000, 0xc90cd513d2aafefd2f7366f3d8c000000000000000000000000, false⟩]
theorem check244 : check2 212 keys244 49 16 4 (z3Raw 109 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5687 9 (windowRaw C2.tree C2.KW C2.MW 5695 3 corr244))) = true := by decide +kernel
theorem boundary244 : rationalLogValue (orderedBlockExpression ⟨244, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨244, by decide⟩) + rawValue 44 220 corr244 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 109 []) (zero3_ordered ⟨109, by decide⟩)
    5773 5773 5687 5696 5695 5698 (by decide) (by decide) (by decide) rfl
    212 keys244 49 16 4 corr244 check244

def keys245 : Nat := 0x100000000000050000000000020000000000008000000000001b03329677e0098755fcee480455d04acbe8022ae824156400d92c3b285b006c961d453ec021434ce2f560088de0ca740002f9dd9ee5d8010177e5512400457ecb33cc0022bf658511000349f2920380012789f85f0
def corr245 : List Raw := [⟨0x200000000000, 0x274c5cf381f447487b55fd384c15800000000000000000000000, false⟩, ⟨0x400000000000, 0x64887829cba75989c308610be127c00000000000000000000000, false⟩, ⟨0x500000000000, 0x15d743cdc985c48ecab325e30c67c800000000000000000000000, false⟩, ⟨0x800000000000, 0x80f95c3b2084a958d5d93993dd2400000000000000000000000, false⟩]
theorem check245 : check2 212 keys245 49 18 5 (z3Raw 110 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5696 3 (windowRaw C2.tree C2.KW C2.MW 5698 11 corr245))) = true := by decide +kernel
theorem boundary245 : rationalLogValue (orderedBlockExpression ⟨245, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨245, by decide⟩) + rawValue 44 220 corr245 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 110 []) (zero3_ordered ⟨110, by decide⟩)
    5773 5773 5696 5699 5698 5709 (by decide) (by decide) (by decide) rfl
    212 keys245 49 18 5 corr245 check245

def keys246 : Nat := 0x2000000000000a0000000000040000000000010000000000003ce1269b35a01b09edc12e90090e29b4b7100482a951fd82019d952ac47e00cdc4a77d908017659b3b1c0008257b5db7c0031ed964ca600108b161e6080083b10f5c6c
def corr246 : List Raw := [⟨0x200000000000, 0x22a530ee49add82fea809b0a14f1400000000000000000000000, false⟩, ⟨0x400000000000, 0x8f6bbc82bc717d979ff43e79d8aac00000000000000000000000, false⟩, ⟨0x500000000000, 0x1ac53696de7be2386b8c9be3be715800000000000000000000000, false⟩, ⟨0x800000000000, 0x8a53a88d8bdf9715e8b267c1264000000000000000000000000, false⟩]
theorem check246 : check2 212 keys246 49 15 4 (z3Raw 111 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5699 3 (windowRaw C2.tree C2.KW C2.MW 5709 8 corr246))) = true := by decide +kernel
theorem boundary246 : rationalLogValue (orderedBlockExpression ⟨246, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨246, by decide⟩) + rawValue 44 220 corr246 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 111 []) (zero3_ordered ⟨111, by decide⟩)
    5773 5773 5699 5702 5709 5717 (by decide) (by decide) (by decide) rfl
    212 keys246 49 15 4 corr246 check246

def keys247 : Nat := 0x400000000000140000000000080000000000020000000000006f6cd347012028a8601206101382baddd568095c9ff961c80312bf6d9228010fa23fbcb3007b53c56128801da052c88c400ec0316420e0054693943130018181642720007de12b79e8000cb17732da0005f1195c4b0001962ee6810000b7f3e7ff0
def corr247 : List Raw := [⟨0x200000000000, 0x11e03473e84d4181304705a1795d800000000000000000000000, false⟩, ⟨0x400000000000, 0x781801f597a3c45520b1d771c6c5c00000000000000000000000, false⟩, ⟨0x500000000000, 0x1b26c8398d1cbc2aae8041dbd1f10800000000000000000000000, false⟩, ⟨0x800000000000, 0xe17eba00ce52afc48d9c1b1a44bc00000000000000000000000, false⟩]
theorem check247 : check2 212 keys247 49 20 5 (z3Raw 112 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5702 5 (windowRaw C2.tree C2.KW C2.MW 5717 11 corr247))) = true := by decide +kernel
theorem boundary247 : rationalLogValue (orderedBlockExpression ⟨247, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨247, by decide⟩) + rawValue 44 220 corr247 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 112 []) (zero3_ordered ⟨112, by decide⟩)
    5773 5773 5702 5707 5717 5728 (by decide) (by decide) (by decide) rfl
    212 keys247 49 20 5 corr247 check247

def keys248 : Nat := 0x400000000000140000000000080000000000020000000000006fdd7679a0a0361dbb92367012648aeba03008f2325bdcd00341c463795c0192362c4dd5002f8b8e70050014af9a2ef08007e1a53f91e002e55e377390011489ba60f00084e1d8f894
def corr248 : List Raw := [⟨0x200000000000, 0x78a0d4c1ad824beda7f2522a8fb800000000000000000000000, false⟩, ⟨0x400000000000, 0x18bddcad36a679371b4e5357de9e800000000000000000000000, false⟩, ⟨0x500000000000, 0x4820345d0b8a62e398698d3788ef000000000000000000000000, false⟩, ⟨0x800000000000, 0x10d69f51efef97cb53287857866000000000000000000000000, false⟩]
theorem check248 : check2 210 keys248 49 16 4 (z3Raw 113 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5707 12 (windowRaw C2.tree C2.KW C2.MW 5728 0 corr248))) = true := by decide +kernel
theorem boundary248 : rationalLogValue (orderedBlockExpression ⟨248, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨248, by decide⟩) + rawValue 44 220 corr248 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 113 []) (zero3_ordered ⟨113, by decide⟩)
    5773 5773 5707 5719 5728 5728 (by decide) (by decide) (by decide) rfl
    210 keys248 49 16 4 corr248 check248

def keys249 : Nat := 0x400000000000140000000000080000000000020000000000006c3c735ec620244cb2a526e01226324e677008f237be178c0341c1f888d0019967a39f7f00ccb1969d098017c61783668007e080df86a0022911435b50010e90949c98008746a1cdfc
def corr249 : List Raw := [⟨0x200000000000, 0x7d9466f51279e97a2b709b3982a000000000000000000000000, false⟩, ⟨0x400000000000, 0x13b1f27a3a78274de776fc09b0a6000000000000000000000000, false⟩, ⟨0x500000000000, 0x3688a41ad26278dfcfc891cdcd7b000000000000000000000000, false⟩, ⟨0x800000000000, 0x75b21e64a33b953fd1fa42b730000000000000000000000000, false⟩]
theorem check249 : check2 209 keys249 49 16 4 (z3Raw 114 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5719 3 (windowRaw C2.tree C2.KW C2.MW 5728 9 corr249))) = true := by decide +kernel
theorem boundary249 : rationalLogValue (orderedBlockExpression ⟨249, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨249, by decide⟩) + rawValue 44 220 corr249 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 114 []) (zero3_ordered ⟨114, by decide⟩)
    5773 5773 5719 5722 5728 5737 (by decide) (by decide) (by decide) rfl
    209 keys249 49 16 4 corr249 check249

def keys250 : Nat := 0x2000000000000a00000000000400000000000100000000000037eec03d8a201382b1609b3809323eb0d65c03246fcffa92010fa3aca2ce003b408873bc0014af8d68d6c005cab8d08060021386bcd2000032c5cb73b0000cb173cf74
def corr250 : List Raw := [⟨0x200000000000, 0x3ab57b6e08a1fe155f16b6a49ac000000000000000000000000, false⟩, ⟨0x400000000000, 0x110e79b007242a4f7f101d0b8560000000000000000000000000, false⟩, ⟨0x500000000000, 0x2db57eb067afb2b8f08e5e7b25a0000000000000000000000000, false⟩, ⟨0x800000000000, 0xd5bb9c647584268b90a055ef78000000000000000000000000, false⟩]
theorem check250 : check2 209 keys250 49 15 4 (z3Raw 115 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5722 0 (windowRaw C2.tree C2.KW C2.MW 5737 11 corr250))) = true := by decide +kernel
theorem boundary250 : rationalLogValue (orderedBlockExpression ⟨250, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨250, by decide⟩) + rawValue 44 220 corr250 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 115 []) (zero3_ordered ⟨115, by decide⟩)
    5773 5773 5722 5722 5737 5748 (by decide) (by decide) (by decide) rfl
    209 keys250 49 15 4 corr250 check250

def keys251 : Nat := 0x100000000000050000000000020000000000008000000000001bbec6e5565009739b73c5940301e0e3832e00561dfb36e8001904940f2700088a2c53410
def corr251 : List Raw := [⟨0x200000000000, 0x4135a3b170bbc968e01403bb53800000000000000000000000, false⟩, ⟨0x400000000000, 0x265f232e91d6e1d034a8f5bf9a4800000000000000000000000, false⟩, ⟨0x500000000000, 0x3af3f2cc3c5c963d4c130d85f60000000000000000000000000, false⟩, ⟨0x800000000000, 0x4ba1fe4cc79bae5d55ca04b08000000000000000000000000, false⟩]
theorem check251 : check2 205 keys251 49 10 4 (z3Raw 116 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5722 6 (windowRaw C2.tree C2.KW C2.MW 5748 0 corr251))) = true := by decide +kernel
theorem boundary251 : rationalLogValue (orderedBlockExpression ⟨251, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨251, by decide⟩) + rawValue 44 220 corr251 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 116 []) (zero3_ordered ⟨116, by decide⟩)
    5773 5773 5722 5728 5748 5748 (by decide) (by decide) (by decide) rfl
    205 keys251 49 10 4 corr251 check251

def keys252 : Nat := 0x400000000000140000000000080000000000020000000000006efb1d5c80c025ce6c061fc012e592918c500972c9488994030325a04b16018192d0185300c07847ea370015877d84a240064123e12e2002228afc9960010dd6edc0800086eb76d88c
def corr252 : List Raw := [⟨0x200000000000, 0x9d16fb58fb15d711a456521f94000000000000000000000000, false⟩, ⟨0x400000000000, 0x1d5ae47d840b274d39581f2f210800000000000000000000000, false⟩, ⟨0x500000000000, 0x45f208f61d63184b118303cc9ff000000000000000000000000, false⟩, ⟨0x800000000000, 0x4bdfd5a5c260f77c627baee5b800000000000000000000000, false⟩]
theorem check252 : check2 206 keys252 49 16 4 (z3Raw 117 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5728 3 (windowRaw C2.tree C2.KW C2.MW 5748 9 corr252))) = true := by decide +kernel
theorem boundary252 : rationalLogValue (orderedBlockExpression ⟨252, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨252, by decide⟩) + rawValue 44 220 corr252 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 117 []) (zero3_ordered ⟨117, by decide⟩)
    5773 5773 5728 5731 5748 5757 (by decide) (by decide) (by decide) rfl
    206 keys252 49 16 4 corr252 check252

def keys253 : Nat := 0x50000000000040000000000020000000000008f1c9975d8c0682294b25b4008c0d1d7cc0
def corr253 : List Raw := [⟨0x200000000000, 0x1d799f3075696c569f7f6c394000000000000000000000000, false⟩, ⟨0x400000000000, 0x83944cf45cbb85e89608093c6c000000000000000000000000, false⟩, ⟨0x500000000000, 0x89a3fa9d0b23f45fdc01f44280000000000000000000000000, false⟩]
theorem check253 : check2 203 keys253 48 6 3 (z3Raw 118 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5731 3 (windowRaw C2.tree C2.KW C2.MW 5757 0 corr253))) = true := by decide +kernel
theorem boundary253 : rationalLogValue (orderedBlockExpression ⟨253, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨253, by decide⟩) + rawValue 44 220 corr253 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 118 []) (zero3_ordered ⟨118, by decide⟩)
    5773 5773 5731 5734 5757 5757 (by decide) (by decide) (by decide) rfl
    203 keys253 48 6 3 corr253 check253

def keys254 : Nat := 0x50000000000040000000000020000000000008f1d4812f0c06821e4b5ad4008c0d337620
def corr254 : List Raw := [⟨0x200000000000, 0x1d877d09a00b45b4006fd87b3800000000000000000000000, false⟩, ⟨0x400000000000, 0xc1ac12391eaa22abff902784c800000000000000000000000, false⟩, ⟨0x500000000000, 0x122d4fe1c0ff9c77bccec33228000000000000000000000000, false⟩]
theorem check254 : check2 200 keys254 48 6 3 (z3Raw 119 [])
    (windowRaw C0.tree C0.KW C0.MW 5773 0 (windowRaw C1.tree C1.KW C1.MW 5734 0 (windowRaw C2.tree C2.KW C2.MW 5757 3 corr254))) = true := by decide +kernel
theorem boundary254 : rationalLogValue (orderedBlockExpression ⟨254, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨254, by decide⟩) + rawValue 44 220 corr254 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 119 []) (zero3_ordered ⟨119, by decide⟩)
    5773 5773 5734 5734 5757 5760 (by decide) (by decide) (by decide) rfl
    200 keys254 48 6 3 corr254 check254

end MatrixBounds.Numeric.FKLDimData
