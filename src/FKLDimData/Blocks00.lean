module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys000 : Nat := 0x5000000000002000000000000ff64b74be7c0fee499507e40fa0dc4ad2e40f98239aae000f63997849bc0f5b44cb87280ebf9ad741f40ea66ed377780ea66e06f5fc0ea66e0505f40e98b4b6494c0e6acbfdee800e160217f2040d66ce6bd8400d169f352fc409192ad0a8ec06e6d52f571402e960cad03c0299319427c001e9fde80dfc01953402118001674b49b6b4015991fafa0c015991f90a040159912c888801406528be0c00a4bb3478d8009c6687b6440067dc655200005f23b52d1c0011b66af81c0009b48b4184
def corr000 : List Raw := [⟨0x200000000000, 0x6ecdb652afd602d0bcef50203b5e28f2a1dd7574f98f34f0d3c8400, true⟩, ⟨0x500000000000, 0x74535ab009dbf4b5960564436e031fe6536747ce28701f1b8f624400, true⟩]
theorem check000 : check2 225 keys000 48 34 6 (leafRaw 0 [])
    (windowRaw C0.tree C0.KW C0.MW 0 34 (windowRaw C1.tree C1.KW C1.MW 0 2 (windowRaw C2.tree C2.KW C2.MW 0 2 corr000))) = true := by decide +kernel
theorem boundary000 : rationalLogValue (orderedBlockExpression ⟨0, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨0, by decide⟩) + rawValue 44 220 corr000 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 0 []) (leaf_ordered ⟨0, by decide⟩)
    0 34 0 2 0 2 (by decide) (by decide) (by decide) rfl
    225 keys000 48 34 6 corr000 check000

def keys001 : Nat := 0x5000000000002000000000000ffff426b7780fffbb8009340ecaaa0ff8b40eac2bceb6380eaba259c5cc0eaaa1d373a40eaa97f5b2c80eaa62e532880eaa4d5907040e9767bd637c0e97676a8c5c0e97676a8bb80e97676a58340e976769e5a80e976769826c0e93bbd2f9b80e93bbc140c80e93bb9b8fc00e93bb9b77080e93bb9b746c0e93bb9ac61c0e7e2afe4cac0e7e2acbe6440e7e2abc1b980e7e2abbcbc40e7e2aa8d7bc0e7e2aa433f40e7ac98f41e801853670be180181d55bcc0c0181d55728440181d544343c0181d543e4680181d53419bc0181d501b354016c446539e4016c44648b94016c446488f8016c44647040016c443ebf38016c442d0648016898967d94016898961a5801689895a7cc0168989574480168989573a4016898429c840155b2a6f8fc01559d1acd780155680a4d3801555e2c8c5c01545da63a340153d43149c8013555f0074c0000447ff6cc00000bd94888
def corr001 : List Raw := [⟨0x200000000000, 0xa8fd33f1e9fc184b9a9487a01dfa94907adfdc929c7a0734f000, false⟩, ⟨0x500000000000, 0x2143206a7e84fb261e7a3ce7a1daf1c4f92e4972cf1eeaf26e000, false⟩]
theorem check001 : check2 212 keys001 48 58 6 (leafRaw 1 [])
    (windowRaw C0.tree C0.KW C0.MW 34 56 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr001))) = true := by decide +kernel
theorem boundary001 : rationalLogValue (orderedBlockExpression ⟨1, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨1, by decide⟩) + rawValue 44 220 corr001 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 1 []) (leaf_ordered ⟨1, by decide⟩)
    34 90 2 2 2 2 (by decide) (by decide) (by decide) rfl
    212 keys001 48 58 6 corr001 check001

def keys002 : Nat := 0x5000000000002000000000000fffff6692540fc87f30871c0ec977323edc0ec9771959c00ec9771901980ec97718f76c0ec977186cac0ec958f2ce440ec1fba50e9c0ec1fba4e6a40ec1fba4ca500ec1fba4bab80ec1fba4b7fc0ec1fba486240ea866c78cc00ea84eb5ec0c0ea6d30fc3100e5f2a0dd6980e5f2a0ba3740e5d709ae8500e39b8eaa4040e276b25ffa40e276b2572300e276b194ef80e276b054b300e276afd62fc0e276af8998c0df3c1c0f6c40b009d7fa038098633bbddcc0679cc44223404ff62805fc8020c3e3f093c01d89507667401d895029d0401d894fab4d001d894e6b10801d894da8dd001d894da005c01c647155bfc01a28f6517b001a0d5f45c8c01a0d5f2296801592cf03cf00157b14a13f4015799387340013e045b79dc013e045b4804013e045b4548013e045b35b0013e045b195c013e045af1640136a70d31bc013688e79354013688e70894013688e6fe68013688e6a640013688cdc124003780cf78e4000000996dac
def corr002 : List Raw := [⟨0x200000000000, 0x1a6aab718d8884c68724145496524b7be6db479312b117f0a2000, false⟩, ⟨0x500000000000, 0xa194a5a5ddcf66d540014bc920d716510b464468607ed448d0000, false⟩]
theorem check002 : check2 214 keys002 48 62 6 (leafRaw 2 [])
    (windowRaw C0.tree C0.KW C0.MW 90 60 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr002))) = true := by decide +kernel
theorem boundary002 : rationalLogValue (orderedBlockExpression ⟨2, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨2, by decide⟩) + rawValue 44 220 corr002 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 2 []) (leaf_ordered ⟨2, by decide⟩)
    90 150 2 2 2 2 (by decide) (by decide) (by decide) rfl
    214 keys002 48 62 6 corr002 check002

def keys003 : Nat := 0x5000000000002000000000000ec17b60961c0ec17b2a36e80ec17b2a27200ec17b15dc980ec17b15a3e80ec17b1582cc0eb57b4165580eb57b4109d80eb57b4108240eb57b41015c0eb57b40ff480eb57b40fd900eb1bf4727880eb1b4a97ad80eb1aaef71d80e69a5f9e8100e69a5cf60c00e69a5b2dab40e2827bf03a40e2827b552000e2827b4a2cc0e28278882c40e28275a51b00e28273ae2b001d7d8c51d5001d7d8a5ae5001d7d8777d3c01d7d84b5d3401d7d84aae0001d7d840fc5c01965a4d254c01965a309f4001965a0617f0014e55108e28014e4b568528014e40b8d878014a84bf0270014a84bf00b8014a84befea4014a84bef7dc014a84bef628014a84be9aa8013e84ea7d34013e84ea5c18013e84ea2368013e84d5d8e0013e84d5c918013e849f69e4
def corr003 : List Raw := [⟨0x200000000000, 0x21d5bd91012ac26a1093a1d0e6014268cb4da266990253eb5f000, false⟩, ⟨0x500000000000, 0x18d669d1cf4a46aecd0deb32d331992e6039a97ca2a5706c08e800, false⟩]
theorem check003 : check2 216 keys003 48 50 6 (leafRaw 3 [])
    (windowRaw C0.tree C0.KW C0.MW 150 48 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr003))) = true := by decide +kernel
theorem boundary003 : rationalLogValue (orderedBlockExpression ⟨3, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨3, by decide⟩) + rawValue 44 220 corr003 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 3 []) (leaf_ordered ⟨3, by decide⟩)
    150 198 2 2 2 2 (by decide) (by decide) (by decide) rfl
    216 keys003 48 50 6 corr003 check003

def keys004 : Nat := 0x5000000000002000000000000fe9eb0238740fd4c317b4280f49a49749040f2b2472d8800eb6af64dbfc0eb6af2bd0080eb6af2bbb040eb6af1707780eb6af16c53c0eb6af16bde40eb2c81aa1080eb2bb32058c0eb2b9012d7c0ea15bcd30740ea15b3b8e9c0ea15b3b2cd80ea15b3b10600ea15b3afbcc0ea159fb95240e6b454ea4a80e6b454951700e6b4531adb80e275678449c0e2755ab5de80e2754b6ddcc0e2754b01df80e2754a62c840e27549e5b680e24b09e034001db4f61fcc001d8ab61a49801d8ab59d37c01d8ab4fe20801d8ab49223401d8aa54a21801d8a987bb640194bace52480194bab6ae900194bab15b58015ea6046adc015ea4c50434015ea4c4efa0015ea4c4d328015ea4c47164015ea432cf8c014d46fed284014d44cdfa74014d37e55ef8014950e9421c014950e93ac4014950e8f888014950d444fc014950d42ff80149509b240400d4db8d278000b65b68b6fc002b3ce84bd8001614fdc78c
def corr004 : List Raw := [⟨0x200000000000, 0x2168fc2e355a2acde07f26ab028bdbdc26465dd551316e0cabc00, false⟩, ⟨0x500000000000, 0x19038f21f994ed6597f169375aae8907a9c1382c2fb2f2f8533000, false⟩]
theorem check004 : check2 216 keys004 48 60 6 (leafRaw 4 [])
    (windowRaw C0.tree C0.KW C0.MW 198 58 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr004))) = true := by decide +kernel
theorem boundary004 : rationalLogValue (orderedBlockExpression ⟨4, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨4, by decide⟩) + rawValue 44 220 corr004 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 4 []) (leaf_ordered ⟨4, by decide⟩)
    198 256 2 2 2 2 (by decide) (by decide) (by decide) rfl
    216 keys004 48 60 6 corr004 check004

def keys005 : Nat := 0x5000000000002000000000000fffffc61a4c0f9ae8e815800ebfbb24d8100ebdf258d51c0eb85d5a75dc0eb85ad192840eb8556c67880e9fa5e9ddf40e9fa5e98e900e9fa5e97ad40e9fa5e96e7c0e9fa5e964880e9fa5e95c540e9d6687e4200e9d664b75700e9d663655b40e9d6635ba040e9d6635958c0e9d6635611c0e9af8299ff80e9af805c1000e9af80551980e9af803c0240e9af803753c0e9af802f4040e7c37cdc0f00e7c379495740e7c3785226c0e725460ec280e7254256c400e724ff182f80ddf11ba3e040dd8bed55bc00daa769105340d7699d438840c0b11d880f803f4ee277f080289662bc77c0255896efacc0227412aa4400220ee45c1fc018db00e7d08018dabda93c0018dab9f13d80183c87add940183c86b6a8c0183c8323f10016507fd0bfc016507fc8ac4016507fc3fdc016507faae68016507fa3f00016507d66008016299ca9ee4016299ca6a74016299ca45fc016299c9aa4c016299b48a90016299781be001605a16a3ac01605a169b7801605a16918401605a16852c01605a16717001605a16220c0147aa9398780147a52e6d7c0147a2a58a2401420da72ae4014044db27f000651717ea8000000039e5b4
def corr005 : List Raw := [⟨0x200000000000, 0x1bd628b56addf55225400404757056a87dd31d3245705c0cfb400, false⟩, ⟨0x500000000000, 0xaeebd7c83deeed37d9420644432a73473b23af2c5c5bb6036d800, false⟩]
theorem check005 : check2 214 keys005 48 74 7 (leafRaw 5 [])
    (windowRaw C0.tree C0.KW C0.MW 256 72 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr005))) = true := by decide +kernel
theorem boundary005 : rationalLogValue (orderedBlockExpression ⟨5, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨5, by decide⟩) + rawValue 44 220 corr005 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 5 []) (leaf_ordered ⟨5, by decide⟩)
    256 328 2 2 2 2 (by decide) (by decide) (by decide) rfl
    214 keys005 48 74 7 corr005 check005

def keys006 : Nat := 0x5000000000002000000000000fffdc2932680fa47d14e9ac0fa29d58a3780f77011bc96c0f5d4b26e2580f3b80e085f40f3af20e40d00f0a09c7e1ec0ee4d6872ab80edcaaec84980ec11b1bc1780ec115a95c4c0ec114fb7ad00ec114cca0980ec114cbc2040eb023f929080e9c4b8b6d7c0e9c4b8a6f8c0e9c4b4df2f80e9c4b4dc6b40e9c4b378a800e9c4b3786e00e8313c4abd40e82fde6ab0c0e82fce6e3d80e12b80100840b8b5e9684000a4d1e9bb624095af86ee52c08d0b37653f8072f4c89ac0806a507911ad405b2e16449dc0474a1697c0001ed47feff7c017d03191c28017d021954f4017cec3b542c0163b4c879200163b4c875800163b4b2394c0163b4b20d080163b47590740163b4749284014fdc06d6f8013eeb343dfc013eeb335f68013eeb048530013eea56a3b4013ee4e43e88012355137b68011b2978d54800f5f6381e1400c50df1bf3000c47f1f7a0c00a2b4d91da80088fee43694005d62a75c88005b82eb1654000023d6cd98
def corr006 : List Raw := [⟨0x200000000000, 0xadf3a93b257562f74291857326190c82880dc5ff9e2fa9da0000, false⟩, ⟨0x500000000000, 0x175bb8a5ef4482d640ffd88b078b6e5d0319cbf1655aff5135000, false⟩]
theorem check006 : check2 212 keys006 48 62 6 (leafRaw 6 [])
    (windowRaw C0.tree C0.KW C0.MW 328 60 (windowRaw C1.tree C1.KW C1.MW 2 0 (windowRaw C2.tree C2.KW C2.MW 2 0 corr006))) = true := by decide +kernel
theorem boundary006 : rationalLogValue (orderedBlockExpression ⟨6, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨6, by decide⟩) + rawValue 44 220 corr006 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 6 []) (leaf_ordered ⟨6, by decide⟩)
    328 388 2 2 2 2 (by decide) (by decide) (by decide) rfl
    212 keys006 48 62 6 corr006 check006

def keys007 : Nat := 0x5000000000002000000000000fb26d73d4940f800ee061f40f72d46eb65c0f5aae947b580f26136508180ee1e40891640ebc51e445f00e90689be3e80e6acc08e7040e50de82af6c0e33265b9cb40e2fd26218540e01621726b40cb6cf0842a80ab415167a6c054beae98594034930f7bd5801fe9de8d94c01d02d9de7ac01ccd9a4634c01af217d5094019533f718fc016f97641c180143ae1bba10011e1bf76e9c00d9ec9af7e800a5516b84a8008d2b9149a4007ff11f9e0c004d928c2b6c
def corr007 : List Raw := [⟨0x200000000000, 0x198933d5d234023c83d0c5335d0d4ec6edbca4c8e4d32884000, false⟩, ⟨0x500000000000, 0x219485fe6503a12dbea3a02289d03ff7848d0aca4bdae4be000, false⟩]
theorem check007 : check2 204 keys007 48 32 5 (leafRaw 7 [])
    (windowRaw C0.tree C0.KW C0.MW 388 18 (windowRaw C1.tree C1.KW C1.MW 2 12 (windowRaw C2.tree C2.KW C2.MW 2 0 corr007))) = true := by decide +kernel
theorem boundary007 : rationalLogValue (orderedBlockExpression ⟨7, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨7, by decide⟩) + rawValue 44 220 corr007 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 7 []) (leaf_ordered ⟨7, by decide⟩)
    388 406 2 14 2 2 (by decide) (by decide) (by decide) rfl
    204 keys007 48 32 5 corr007 check007

def keys008 : Nat := 0x5000000000002000000000000fffffffed200ffd1ab4fe740ffc09642fc00ff0589680680fcabe127ac00f9c3f40c9400f40c21223980f3f9d3bb9cc0ed607bb49300e81881f29100e81881e27c00e8186c5cee00e778528aa3c0e7394a16cc80e6effaba8180e6e084da8bc0e6112b38eec0e6112b389080e5d3853fb400e5bdb5288ac0e5bdaef74f40e49e65649700e45c37f0db40e42da7d8f140e42da61c6ec0e42d958f3140e42d93ff11c0e42d924d9280e345648cfd00e1796e141c00e172073c2900e15eaaee1ac0df43e6a7a140d8260ffb9100b9d5543a99808bc1be8b52c08b319f6748c074ce6098b740743e4174ad40462aabc5668027d9f0046f0020bc19585ec01ea15511e5401e8df8c3d7001e8691ebe4001cba9b7303001bd26db26d801bd26c00ee401bd26a70cec01bd259e391401bd258270ec01ba3c80f24c01b619a9b69001a425108b0c01a424ad775401a2c7ac04c0019eed4c76f8019eed4c71140191f7b257440191005457e8018c6b5e933801887ad755c4017e793a3120017e77e1d840017e77e0d6f00129f844b6d000c062c4463400bf3deddc680063c0bf36c0003541ed8540000fa7697f980003f69bd0400002e54b018c0000000012e0
def corr008 : List Raw := [⟨0x200000000000, 0x2b5a408b5ce217909b3a690ae814f8a66b6bfeb0e1b8fc859800, false⟩, ⟨0x500000000000, 0x4af12682d225d027a5d5f280a8a88ab18558d753efeece83e800, false⟩]
theorem check008 : check2 209 keys008 48 76 7 (leafRaw 8 [])
    (windowRaw C0.tree C0.KW C0.MW 406 40 (windowRaw C1.tree C1.KW C1.MW 14 24 (windowRaw C2.tree C2.KW C2.MW 2 10 corr008))) = true := by decide +kernel
theorem boundary008 : rationalLogValue (orderedBlockExpression ⟨8, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨8, by decide⟩) + rawValue 44 220 corr008 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (leafRaw 8 []) (leaf_ordered ⟨8, by decide⟩)
    406 446 14 38 2 12 (by decide) (by decide) (by decide) rfl
    209 keys008 48 76 7 corr008 check008

end MatrixBounds.Numeric.FKLDimData
