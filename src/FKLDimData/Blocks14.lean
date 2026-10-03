module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys126 : Nat := 0x5000000000002000000000000ffffffff08c0ffffffc0b200fffffdbeac80fffffc0c2c40ffc32f01d800feaa16840c00fe4dda23ee80f481efd8a700f30c0c625500efb51359c100ed7af8f31540ecc50c997380ecc15cf80f40ecbcaa592c00e8a1b3eebb40e86fe15becc0e86fdd3bb080e86fdd2d2d80e79e6342a740e76155012000e6f44b2db4c0e6f4457ebbc0e6f44568e500e6f44567ad80e6f445671780e6f445615100e6b3331329c0e6b3330bbb80e6b332f45c80e6b332f3fd80e6b332f0fd80e6b332eff8c0e5e25679b000e5caf89302c0e5caf892f000e5caf82f2bc0e5caf7a43cc0e5c3e2503100e5b6184e1f40e5b528ecd3c0e58596735540e5637ba19440e55cf19dd200e55cedf84180e55cedd664c0e55ce5219f80e4af996b00c0e4af99046ac0e4167fc39f40e3d350cb9680e3d34cfb64c0e3d34c19f940e3d343011dc0e3d31ea2d440e3aeaca58440e2727a912000e200bd11eec0e1f33471c6c0de0355776100c10aa2105d40b9906b66f500466f94990b003ef55defa2c021fcaa889f001e0ccb8e39401dff42ee11401d8d856ee0001c51535a7bc01c2ce15d2bc01c2cbcfee2401c2cb3e606c01c2cb3049b401c2caf3469801be9803c60c01b5066fb95401b506694ff401aa31ade60801aa312299b401aa31207be801aa30e622e001a9c845e6bc01a7a698caac01a4ad7132c401a49e7b1e0c01a3c1dafcf001a35085bc3401a3507d0d4401a35076d10001a35076cfd401a1da9865000194ccd100740194ccd0f0280194ccd0c0280194ccd0ba380194cccf44480194cccecd640190bba9eaf00190bba98e880190bba985280190bba971b00190bba814440190bb4d24b40189eaafee00018619cbd58c0179022d2d280179022c44f8017901ea41340175e4c1144c0134355a6d400133ea307f0c0133af3668c801285070ceac0104aeca63f000cf3f39dab000b7e1027590001b225dc11800155e97bf400003cd0fe2800000003f3d3c00000024153800000003f4e0000000000f74
def corr126 : List Raw := [⟨0x200000000000, 0x1d5637d374a8ae92e7faf672f1ff764d8d5ba653d7b54af1de000, false⟩, ⟨0x500000000000, 0x5e9c3dc3e7d4f1f5a87e9cc7aec98ec169ced7d5a1079506b4000, false⟩]
theorem check126 : check2 214 keys126 48 124 7 (leafRaw 126 [])
    (windowRaw C0.tree C0.KW C0.MW 5028 30 (windowRaw C1.tree C1.KW C1.MW 4806 54 (windowRaw C2.tree C2.KW C2.MW 4802 38 corr126))) = true := by decide +kernel
theorem boundary126 : rationalLogValue (orderedBlockExpression ⟨126, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨126, by decide⟩) + rawValue 44 220 corr126 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 126 []) (leaf_ordered ⟨126, by decide⟩)
    5028 5058 4806 4860 4802 4840 (by decide) (by decide) (by decide) rfl
    214 keys126 48 124 7 corr126 check126

def keys127 : Nat := 0x5000000000002000000000000fff632ad7800fff46a50c9c0f9c72d246080efa8ed6a6440efa8ecbe8d80ec6a86904240ec576b9ad000ebcd9c7f7100ebcd3023e480ebca934b5380ebc83d60cdc0ebc63c886dc0ebb3c03d4a40eb79c4fd2800eb1cc2bcc3c0ead9fcf17140ead9edd39580eac3c4ec5180e7e5237eedc0e7c61f543180e7c41da591c0e7c41cebbac0e7c41be3e500e7c4186ddb80e7c417fcc940e7c417b55a00e5e1d66746c0e5e18f9e8cc0e5caf8aee100e5caf7e43e00e5caf7b4b200e5caf7b00e00e5caf7acc880e5caf7ac1cc0e5caf7a6e780e5caf78a9940e5caf779dac0e5caf76de400e5caf6c4ae80e5cac67cd900e5cac5bf6980e5cac5be1140e5cac1351440e5cabfbf2200e5cabfb8ac00e5cabf8a4680e5cabf849200e5cabf7fc240e5cabf7f3780e5a6aa4ee4c0e571821afac0e57177375d00e56eba3cc080e56eaf4e5c40e55cf69b5600e55cf0272d00e55cf019c740e55cef15fec0e55cee60fdc0e55cee2f8540e55cee0912c0e55cedda7d80e55cedc89440e55cec04e4c0e55ce383c600e447de0cf780e3d354949b00e3d34e10f740e3d34e10c3c0e3d34d0023c0e3d34c51a680e3d34c221380e3d34bfb4440e3d34bc9e180e3d34baf9380e3d349ef3c00e3d3414bb040dfcbe221e08020341dde1f801c2cbeb44fc01c2cb610c4001c2cb4506c801c2cb4361e801c2cb404bbc01c2cb3ddec801c2cb3ae59801c2cb2ffdc401c2cb1ef3c401c2cb1ef08c01c2cab6b65001bb821f308801aa31c7c3a001aa313fb1b401aa312376bc01aa3122582801aa311f6ed401aa311d07ac01aa3119f02401aa310ea01401aa30fe638c01aa30fd8d3001aa30964aa001a9150b1a3c01a9145c33f801a8e88c8a3001a8e7de505401a5955b11b401a354080c8801a3540803dc01a35407b6e001a354075b9801a35404754001a354040de001a353ecaebc01a353a41eec01a353a4096801a35398327001a35093b51801a3508921c001a35088625401a35087566c01a35085918801a350853e3401a35085337801a35084ff2001a35084b4e001a35081bc2001a3507511f001a1e706173401a1e2998b940183be84aa600183be80336c0183be7922480183be41c1b00183be3144540183be25a6e401839e0abce80181adc811240153c3b13ae801526122c6a801526030e8ec014e33d433c4014863b02d800144c3fc2b5c01439c37792401437c29f324014356cb4ac801432cfdc1b80143263808f0013a8946530001395796fbdc0105713417280105712959bc00638d2db9f80000b95af36400009cd52880
def corr127 : List Raw := [⟨0x200000000000, 0x1d1a713c1a63a9ae155227f0a9d5b8869756f4a90dcfea88ad000, false⟩, ⟨0x500000000000, 0x76f4eb338cd77d8b4e699b0e7ea556d14ced2d22ac49115292000, false⟩]
theorem check127 : check2 214 keys127 48 158 8 (leafRaw 127 [])
    (windowRaw C0.tree C0.KW C0.MW 5058 36 (windowRaw C1.tree C1.KW C1.MW 4860 60 (windowRaw C2.tree C2.KW C2.MW 4840 60 corr127))) = true := by decide +kernel
theorem boundary127 : rationalLogValue (orderedBlockExpression ⟨127, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨127, by decide⟩) + rawValue 44 220 corr127 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 127 []) (leaf_ordered ⟨127, by decide⟩)
    5058 5094 4860 4920 4840 4900 (by decide) (by decide) (by decide) rfl
    214 keys127 48 158 8 corr127 check127

def keys128 : Nat := 0x5000000000002000000000000fffdc7671200fff7dd4b9c00ffe086d40a40ffa0eae2e140fe57ad2522c0fdb375768a40f7bd7a138d80f517a7b9f200f42587cd9c00efb7928ec680efb4c1980dc0eec560f1ca80ecf229add640ecc06cd21980ecbfcef59200ec7c94e36cc0ec1c729fdec0ec1c5ca74f40ec1838706700ebbeb5f54b00ebaf9166a380eb1b4766c840eae93f3be800eae93c3bf240eacb1288f700e9b62270ff40e87061ea7700e87060d8d4c0e87060d37a00e86e65f63a00e85a4a8971c0e7c1ae8d8e40e76b52cf2b80e76b5294e340e76b4d6d5380e6b32e755bc0e6b32d0f7500e6b32cf3d600e6b32cf1ef00e6b32cf17fc0e6b32cedf000e611d034d880e5caf963ccc0e5caf95cf5c0e5caf91e7880e5caf7ac2440e5caf7aa6900e5b569da9280e5b567e87ac0e5b47a803940e5b478339b80e55cf05e7880e55cedfcdfc0e55cedba2c80e55ceda3b1c0e55ced92cec0e509b037bfc0e48fd2e5eb00e48460065f80e483afeea500e4473ee26240e3d3509a4880e3d34e32edc0e3d34def9940e3d34bebabc0e3d34bdaa000e387f7c02ac0ce338a15e1c031cc75ea1e401c78083fd5401c2cb42560001c2cb41454401c2cb21066c01c2cb1cd12401c2caf65b7801bb8c11d9dc01b7c50115b001b7b9ff9a0801b702d1a15001af64fc840401aa3126d31401aa3125c4e401aa31245d3801aa3120320401aa30fa187801a4b87cc64801a4b857fc6c01a4a981785401a4a96256d801a35085597001a350853dbc01a3506e187801a3506a30a401a35069c334019ee2fcb2780194cd3121000194cd30e8040194cd30e1100194cd30c2a00194cd2f08b00194cd18aa4401894b292ac801894ad6b1cc01894ad30d480183e517271c017a5b5768e4017919a09c600178f9f2c8600178f9f272b40178f9e1589001649dd8f00c01534ed7709001516c3c40dc01516c0c4180014e4b89937c014506e995c8014414a0ab50013e7c78f990013e3a358b0c013e38d60214013836b1c93401340310a6e00133f932de680130dd65229c0113a9f0e3580104b3e67f24010486d7139800bda783264000ae858460e00084285ec7280024c8a8975c001a852dadd40005f151d1ec0001f792bf5c0000822b4640000023898ee0
def corr128 : List Raw := [⟨0x200000000000, 0x13fe40d356e8e636f0bbc579317b673c90ea69816a933f91fe400, false⟩, ⟨0x500000000000, 0x3da405fa88f8c18fe37e750b6aeae4063d037aa861f47b4ac7800, false⟩]
theorem check128 : check2 213 keys128 48 138 8 (leafRaw 128 [])
    (windowRaw C0.tree C0.KW C0.MW 5094 34 (windowRaw C1.tree C1.KW C1.MW 4920 46 (windowRaw C2.tree C2.KW C2.MW 4900 56 corr128))) = true := by decide +kernel
theorem boundary128 : rationalLogValue (orderedBlockExpression ⟨128, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨128, by decide⟩) + rawValue 44 220 corr128 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 128 []) (leaf_ordered ⟨128, by decide⟩)
    5094 5128 4920 4966 4900 4956 (by decide) (by decide) (by decide) rfl
    213 keys128 48 138 8 corr128 check128

def keys129 : Nat := 0x5000000000002000000000000fdf224b021c0e9333a1f4280e9333a1f3140e9333a1d1180e9333a1ca040e9333a1bcb40e933364bccc0e8eb3b718d40e8d9d97edf00e8d92e2bc440e8d92c0e2100e8d920095b00e8d9004ff680e6f44b03e100e6f44afa1240e6f446b799c0e6f4453540c0e6f445323200e6f4452a9340e47771c06240e32893e7dec01cd76c1821401b888e3f9dc0190bbad56cc0190bbacdce00190bbacabf40190bb9486640190bb505edc0190bb4fc1f001726ffb009801726dff6a5001726d3f1df001726d1d43bc01726268121001714c48e72c016ccc9b4334016ccc5e434c016ccc5e35fc016ccc5e2ee8016ccc5e0cec016ccc5e0bd80020ddb4fde4
def corr129 : List Raw := [⟨0x200000000000, 0x1f41ffbd2e534e5bab560f403bd338406e9a8b44a37deac7a9800, false⟩, ⟨0x500000000000, 0x4cf17d986c7cba64ae7af703bc53b8a3bb02dcc4b01d727550e00, false⟩]
theorem check129 : check2 213 keys129 48 44 6 (leafRaw 129 [])
    (windowRaw C0.tree C0.KW C0.MW 5128 0 (windowRaw C1.tree C1.KW C1.MW 4966 0 (windowRaw C2.tree C2.KW C2.MW 4956 42 corr129))) = true := by decide +kernel
theorem boundary129 : rationalLogValue (orderedBlockExpression ⟨129, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨129, by decide⟩) + rawValue 44 220 corr129 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 129 []) (leaf_ordered ⟨129, by decide⟩)
    5128 5128 4966 4966 4956 4998 (by decide) (by decide) (by decide) rfl
    213 keys129 48 44 6 corr129 check129

def keys130 : Nat := 0x5000000000002000000000000ffffffffd280ffafbdec7740ff6d8399cb00fee2bb76cf80f28a432a52c0efc7f9872b40efc7f9816f40ee45f6a2e640ed48a5ea6300eb4064887540ea031bfa53c0e9cf9488dd80e9cf7646cc00e9cf74716900e9b275dce980e76d4376b000e76b8d0bf280e76b51964b00e76b4dee6280e76b4d32eb00e750154b1200e74785efae00e740fb5fa440e735c0e56040e5d63cb1bdc0e5cafe5fbcc0e5600d6bdd40e55cabbcc140e528396d41c0e528396c5280e52559970400e52559905940e3d33f860200e3d308fa9640e1e4d2c759c0e18970827780e0c3e21a6cc0e07205fa2440d7d7850aafc0c8084700bdc0b5e7c10bc2c0b3a51bfdc180804cec19e9c07fb313e616404c5ae4023e804a183ef43d4037f7b8ff424028287af550401f8dfa05dbc01f3c1de593401e768f7d88801e1b2d38a6401c2cf70569c01c2cc079fe001adaa66fa6c01adaa668fc001ad7c693ad801ad7c692be401aa354433ec01a9ff29422c01a3501a043401a29c34e424018ca3f1a9fc018bf04a05bc018b87a10520018afeab4ee001894b2cd15001894b2119d801894ae69b500189472f40d801892bc895000164d8a23168016308b8e9700163089b9340016306b77228015fce405ac4014bf9b778ac012b75a159d0011ba095d19c01038067e90c010380678d4c00d75bcd5ad40011d4489308000927c6635000050421388c0000000002d8
def corr130 : List Raw := [⟨0x200000000000, 0x18cc7f7107f17d89efaacd504ad812bd518592d1103cadd2e000, false⟩, ⟨0x500000000000, 0x3c2204ff387827c2541711134ae262a66b57e7ad73fbe796c800, false⟩]
theorem check130 : check2 209 keys130 48 88 7 (leafRaw 130 [])
    (windowRaw C0.tree C0.KW C0.MW 5128 14 (windowRaw C1.tree C1.KW C1.MW 4966 58 (windowRaw C2.tree C2.KW C2.MW 4998 14 corr130))) = true := by decide +kernel
theorem boundary130 : rationalLogValue (orderedBlockExpression ⟨130, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨130, by decide⟩) + rawValue 44 220 corr130 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 130 []) (leaf_ordered ⟨130, by decide⟩)
    5128 5142 4966 5024 4998 5012 (by decide) (by decide) (by decide) rfl
    209 keys130 48 88 7 corr130 check130

def keys131 : Nat := 0x5000000000002000000000000ffff8d2319c0ffdfe2ffeb40ffdb36eecdc0ffaf00e22940ff0aa758a440ff03292db2c0fef04012a500f76a5def7dc0f3a033b98880efe22ec1e3c0efc7f99baac0efc7f98a8fc0ef131664aac0eef5572526c0eecc51332a40ebed72d7a600eaee8d8dc940ea47135e8ec0e941d3e294c0e76b4e309800e76b4d62f3c0e66b2945e040e6581254e480e65812280700e658120e2880e6580d7d0300e6580c749500e6580c6ed740e6580c6d2940e6580bdb7800e658064ee380e6580646bec0e658063612c0e5dfd37e6bc0e598d9195680e5964b8a3700e5963d4f6980e5950082d0c0e57a593ab500e57a57daad40e57a57bb2700e52839753b00e5283950e140e52559959600e52559712700e48610d21f40e47936ee0cc0e4344c779d40e31e060978c0e2fa1a2fc980e1dadcda33c0cc73a38a1ac0338c5c75e5401e252325cc401d05e5d036801ce1f9f687401bcbb38862c01b86c911f3401b79ef2de0c01adaa68ed9001adaa66a6a001ad7c6af1ec01ad7c68ac5001a85a844d9001a85a82552c01a85a6c54b001a6aff7d2f401a69c2b096801a69b475c9001a6726e6a9801a202c81944019a7f9c9ed4019a7f9b9414019a7f9b11c8019a7f424880019a7f392d6c019a7f39128c019a7f38b6b0019a7f282fd0019a7edf1d78019a7edd7f90019a7edab1b801994d6ba1fc01894b29d0c401894b1cf680016be2c1d6b4015b8eca171401511727236c014128d285a001133aeccd5c0110aa8dad94010ece99b5540103806757040103806645540101dd13e1c400c5fcc4677800895a2108240010fbfed5b0000fcd6d24d4000f558a75bc00050ff1dd6c00024c911324000201d0014c0000072dce64
def corr131 : List Raw := [⟨0x200000000000, 0x3c61ba8e6548665dea2fdfe1d531875482769bc8e7dec9769800, false⟩, ⟨0x500000000000, 0x8768d826211457797b0cdc63b434fb6aa3be579b10de5da59000, false⟩]
theorem check131 : check2 210 keys131 48 106 7 (leafRaw 131 [])
    (windowRaw C0.tree C0.KW C0.MW 5142 20 (windowRaw C1.tree C1.KW C1.MW 5024 42 (windowRaw C2.tree C2.KW C2.MW 5012 42 corr131))) = true := by decide +kernel
theorem boundary131 : rationalLogValue (orderedBlockExpression ⟨131, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨131, by decide⟩) + rawValue 44 220 corr131 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 131 []) (leaf_ordered ⟨131, by decide⟩)
    5142 5162 5024 5066 5012 5054 (by decide) (by decide) (by decide) rfl
    210 keys131 48 106 7 corr131 check131

def keys132 : Nat := 0x5000000000002000000000000ffffff001e80ffa4ba05e240f83d2e4ef900f27b6d04cf40f069a9c55e00f00be1e0b800edf073e7d280ec29614e3c00eba7894c8880ea4b229d3400e9cf72a76880e943727bd780e76b4c126000e76b424ae4c0e76aa9077a40e74ecc64ea40e749c7162c00e740ebb3bbc0e740eb8a9940e740eb7c8e40e740e62ac580e7409d780700e71347f2f200e57fe91742c0e57a1823f900e57a17497100e57a16f5ad00e57a16b84380e57a16a8df401a85e95720c01a85e947bc801a85e90a53001a85e8b68f001a85e7dc07001a8016e8bd4018ecb80d0e0018bf6287f90018bf19d53a8018bf148371c018bf147566c018bf144c444018b638e9d40018b1339b15c0189556f885c01894bdb51b401894b3eda00016bc8d84288016308d58978015b4dd62cc00145876b3778013d69eb1c400120f8c182d800ff41e1f48000f96563aa2000d8492fb30c007c2d1b10700005b45fa1dc0000000ffe18
def corr132 : List Raw := [⟨0x200000000000, 0x3fe6e0910bce35dfab7933804c092f87f0eca3b63b20a0c77800, false⟩, ⟨0x500000000000, 0x715a343c7efa030004052ba190144872d7b2985f06bca4940000, false⟩]
theorem check132 : check2 210 keys132 48 60 6 (leafRaw 132 [])
    (windowRaw C0.tree C0.KW C0.MW 5162 0 (windowRaw C1.tree C1.KW C1.MW 5066 12 (windowRaw C2.tree C2.KW C2.MW 5054 46 corr132))) = true := by decide +kernel
theorem boundary132 : rationalLogValue (orderedBlockExpression ⟨132, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨132, by decide⟩) + rawValue 44 220 corr132 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 132 []) (leaf_ordered ⟨132, by decide⟩)
    5162 5162 5066 5078 5054 5100 (by decide) (by decide) (by decide) rfl
    210 keys132 48 60 6 corr132 check132

def keys133 : Nat := 0x5000000000002000000000000fffff3d87900ffffefa6a100fffe21e1f340fffdb8b20a80fffd8de9f5c0fffd224d7280fff9b5e26cc0ffe8e6aeca40ffd9e32b1440ffa68b30f680f0c19ad49a80ee2a15efb5c0ec61c3620400ec2b3ea5b300ebdd58748000ebca4e6f7dc0eae95a2bfe00eae91ff41f00eae91fe5f840eae91f320040eae91bfe25c0eae91bdbb740e95d5f8a2680e76b5294ff80e740f901fb80e3d36cfb97c0e3d35f9c4400e3d35d22bb80e3d356ad2000e3d34fcef200e3d347486600e3d334e00840e15244b14380dea460bdd600215b9f422a001eadbb4ebc801c2ccb1ff7c01c2cb8b79a001c2cb0310e001c2ca952e0001c2ca2dd44801c2ca063bc001c2c9304684018bf06fe04801894ad6b008016a2a075d9801516e42448c01516e401da401516e0cdffc01516e01a07c01516e00be1001516a5d402001435b19082401422a78b800013d4c15a4d00139e3c9dfc0011d5ea104a400f3e652b6580005974cf098000261cd4ebc00017195135c000064a1d93400002ddb28d80000272160a400002474df5800001de1e0cc0000010595f0000000c27870
def corr133 : List Raw := [⟨0x200000000000, 0x3a4d488eb30c3c5d16fabba6635234ee2e6be2c3618f7414c00, false⟩, ⟨0x500000000000, 0x5b36e91900cd00e89771c8754bc40d943d74a3114f20e77c000, false⟩]
theorem check133 : check2 206 keys133 48 70 7 (leafRaw 133 [])
    (windowRaw C0.tree C0.KW C0.MW 5162 8 (windowRaw C1.tree C1.KW C1.MW 5078 32 (windowRaw C2.tree C2.KW C2.MW 5100 28 corr133))) = true := by decide +kernel
theorem boundary133 : rationalLogValue (orderedBlockExpression ⟨133, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨133, by decide⟩) + rawValue 44 220 corr133 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 133 []) (leaf_ordered ⟨133, by decide⟩)
    5162 5170 5078 5110 5100 5128 (by decide) (by decide) (by decide) rfl
    206 keys133 48 70 7 corr133 check133

def keys134 : Nat := 0x5000000000002000000000000fffb9bead500fffb875c7380fff843a90440fe9ecbbb5300fb199e87d600fa1020887bc0f6c4393dd4c0f16c8743b380eef44b6aa540ea6eb6e25400e993710a0840e95d677adf80e8d7d2c85b00e863dcf37a00e60554b1f840e3ce68c60680e329ec17a4c01cd613e85b401c319739f98019faab4e07c0179c230c860017282d37a50016a298852080166c8ef5f7c01591491dac00110bb4955ac00e9378bc4c80093bc6c22b4005efdf77844004e661782a0001613444ad000007bc56fbc0000478a38c80000464152b0
def corr134 : List Raw := [⟨0x200000000000, 0x18807732e2273f5ca3cd83161cf574cfb4eef9f9d176b328000, false⟩, ⟨0x500000000000, 0x22c2d64be078f8317ebf885f6f83a8275a2c503abf63f501000, false⟩]
theorem check134 : check2 204 keys134 48 36 6 (leafRaw 134 [])
    (windowRaw C0.tree C0.KW C0.MW 5170 0 (windowRaw C1.tree C1.KW C1.MW 5110 12 (windowRaw C2.tree C2.KW C2.MW 5128 22 corr134))) = true := by decide +kernel
theorem boundary134 : rationalLogValue (orderedBlockExpression ⟨134, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨134, by decide⟩) + rawValue 44 220 corr134 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 134 []) (leaf_ordered ⟨134, by decide⟩)
    5170 5170 5110 5122 5128 5150 (by decide) (by decide) (by decide) rfl
    204 keys134 48 36 6 corr134 check134

end MatrixBounds.Numeric.FKLDimData
