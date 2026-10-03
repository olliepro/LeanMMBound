module

public import FKLDim.Block
public import FKLDimData.C0Reads
public import FKLDimData.C1Reads
public import FKLDimData.C2Reads

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLCert FKLDim SuppliedDimensionRates
open scoped BigOperators

def keys195 : Nat := 0x2000000000000a000000000004000000000001000000000000371e7311b2801b24b202f3600d6a7977f0b404bfe87a7d34025e122775da012e67e1f80c808f1e179b984034109c01b5e010ba53abce40085c05bd13b8042705a618d00116a97bc9de008a5a46659a0044edafd1f6801874379af8800c117732210005fe07b685400226af43965800ee2510e50000588fe0f1ec002302c183f00003b8d7246d8001d7097bbd4000ea4d08a540004fea0998c00027dc7f03d0001276aa41b8
def corr195 : List Raw := [⟨0x200000000000, 0x562788699810330893047630486800000000000000000000000, false⟩, ⟨0x400000000000, 0xbdc9e3301f95493127154e548a72800000000000000000000000, false⟩, ⟨0x500000000000, 0x65f84c2e7df857c22318cb5f37f02000000000000000000000000, false⟩, ⟨0x800000000000, 0x735424e342c7514adca609e6d12dc00000000000000000000000, false⟩]
theorem check195 : check2 214 keys195 49 31 5 (z3Raw 60 [])
    (windowRaw C0.tree C0.KW C0.MW 5661 11 (windowRaw C1.tree C1.KW C1.MW 5343 8 (windowRaw C2.tree C2.KW C2.MW 5325 8 corr195))) = true := by decide +kernel
theorem boundary195 : rationalLogValue (orderedBlockExpression ⟨195, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨195, by decide⟩) + rawValue 44 220 corr195 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 60 []) (zero3_ordered ⟨60, by decide⟩)
    5661 5672 5343 5351 5325 5333 (by decide) (by decide) (by decide) rfl
    214 keys195 49 31 5 corr195 check195

def keys196 : Nat := 0x2000000000000a0000000000040000000000010000000000003863702111c01ad42c33d5c009a300ee82c804bbf2c2be88023c79001b5400d04673db800042ec2f4b8c0020c600a03440089e57deb9400423ba88eea801824852376000993a42cd9e0044e864f770001695ee440a8008be860b6b000112d1d322e00077278547f00027ef5993c80010077e9b00
def corr196 : List Raw := [⟨0x200000000000, 0x17d68cba3fb19991ab6ad6446a14800000000000000000000000, false⟩, ⟨0x400000000000, 0x35b3e755c96c54d9be7a73e6621d9800000000000000000000000, false⟩, ⟨0x500000000000, 0x177a21f8a59b59e7eb7e0f9e8742b1000000000000000000000000, false⟩, ⟨0x800000000000, 0x18e8b3e4108f74fdab7fde32804f5000000000000000000000000, false⟩]
theorem check196 : check2 216 keys196 49 23 5 (z3Raw 61 [])
    (windowRaw C0.tree C0.KW C0.MW 5672 0 (windowRaw C1.tree C1.KW C1.MW 5351 8 (windowRaw C2.tree C2.KW C2.MW 5333 11 corr196))) = true := by decide +kernel
theorem boundary196 : rationalLogValue (orderedBlockExpression ⟨196, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨196, by decide⟩) + rawValue 44 220 corr196 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 61 []) (zero3_ordered ⟨61, by decide⟩)
    5672 5672 5351 5359 5333 5344 (by decide) (by decide) (by decide) rfl
    216 keys196 49 23 5 corr196 check196

def keys197 : Nat := 0x400000000000140000000000080000000000020000000000006e5a93aeba20365c00d1da30125813e9ef900927035f4c60032b9c30e1f40194a466ad3c0030068ccf59801717f945988007bc01b97f6002d1e48eb7c00103887ddf70008164705348
def corr197 : List Raw := [⟨0x200000000000, 0x34151bea9f938c7757105cb1ce98000000000000000000000000, false⟩, ⟨0x400000000000, 0xfbd5685e9455f487ed04f9e2a51d800000000000000000000000, false⟩, ⟨0x500000000000, 0x2ff57d4864a6b068f462dbd59224b000000000000000000000000, false⟩, ⟨0x800000000000, 0x1169cb9489c5157389eaa96b8c4a800000000000000000000000, false⟩]
theorem check197 : check2 213 keys197 49 16 4 (z3Raw 62 [])
    (windowRaw C0.tree C0.KW C0.MW 5672 6 (windowRaw C1.tree C1.KW C1.MW 5359 0 (windowRaw C2.tree C2.KW C2.MW 5344 6 corr197))) = true := by decide +kernel
theorem boundary197 : rationalLogValue (orderedBlockExpression ⟨197, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨197, by decide⟩) + rawValue 44 220 corr197 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 62 []) (zero3_ordered ⟨62, by decide⟩)
    5672 5678 5359 5359 5344 5350 (by decide) (by decide) (by decide) rfl
    213 keys197 49 16 4 corr197 check197

def keys198 : Nat := 0x80000000000028000000000010000000000004000000000000e3038e0330006e94e23ef9803661e660ab9012fe5209b5400959c835c15803141aca4550010c2ae3f9720043c74e11dc80178f841e44000b88f852e3400477e2b91c3001eccebaf16800b46b763c900058e738c2fa001f808d6d020003bbf57bb700014114ed2fc
def corr198 : List Raw := [⟨0x200000000000, 0xa4a233544a53735a0c3f9019d54000000000000000000000000, false⟩, ⟨0x400000000000, 0x54fa97da358df4559b06cb39985b8000000000000000000000000, false⟩, ⟨0x500000000000, 0x1d38f43da4178adb656583d6d9934a000000000000000000000000, false⟩, ⟨0x800000000000, 0x1bd00d75ded4ba4a676bbe4876394000000000000000000000000, false⟩]
theorem check198 : check2 216 keys198 49 21 5 (z3Raw 63 [])
    (windowRaw C0.tree C0.KW C0.MW 5678 3 (windowRaw C1.tree C1.KW C1.MW 5359 3 (windowRaw C2.tree C2.KW C2.MW 5350 11 corr198))) = true := by decide +kernel
theorem boundary198 : rationalLogValue (orderedBlockExpression ⟨198, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨198, by decide⟩) + rawValue 44 220 corr198 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 63 []) (zero3_ordered ⟨63, by decide⟩)
    5678 5681 5359 5362 5350 5361 (by decide) (by decide) (by decide) rfl
    216 keys198 49 21 5 corr198 check198

def keys199 : Nat := 0x100000000000050000000000020000000000008000000000001be56fba0c000dc0c21bb29804c8b5a6c6700258dadd1ef700c3e90f6f9000432d5de3f580106e7473022005918685130002b27b3c1ec800dadc4308a8005a0542754e001f530401e90003786cecd3000122cde6cec
def corr199 : List Raw := [⟨0x200000000000, 0x2df205fd2fba463b0b1f7c705283000000000000000000000000, false⟩, ⟨0x400000000000, 0x2e39abe01427b96b346f8e403325d000000000000000000000000, false⟩, ⟨0x500000000000, 0xbae6d3593fa573f7f94fc07852404000000000000000000000000, false⟩, ⟨0x800000000000, 0x85aedea389b6df1860629fc009a8000000000000000000000000, false⟩]
theorem check199 : check2 215 keys199 49 18 5 (z3Raw 64 [])
    (windowRaw C0.tree C0.KW C0.MW 5681 0 (windowRaw C1.tree C1.KW C1.MW 5362 0 (windowRaw C2.tree C2.KW C2.MW 5361 14 corr199))) = true := by decide +kernel
theorem boundary199 : rationalLogValue (orderedBlockExpression ⟨199, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨199, by decide⟩) + rawValue 44 220 corr199 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 64 []) (zero3_ordered ⟨64, by decide⟩)
    5681 5681 5362 5362 5361 5375 (by decide) (by decide) (by decide) rfl
    215 keys199 49 18 5 corr199 check199

def keys200 : Nat := 0x100000000000050000000000020000000000008000000000001c99cd2fbf980dfdb9afac44051c17ff23ae025d0854e50700c1fc0cadd7003d7c9596a3400e7e5a5ce9c005310451615001faac30db0800b6053bfb68005ae1a7d958001eff91bf4b0002c45263d40000a18c99298
def corr200 : List Raw := [⟨0x200000000000, 0x10b797f684c5ad61c21be6d4857c000000000000000000000000, false⟩, ⟨0x400000000000, 0x766e4d0367e0e9b114d0c8ccf468800000000000000000000000, false⟩, ⟨0x500000000000, 0x1aed6695f6960c3e38b063f17cc8d000000000000000000000000, false⟩, ⟨0x800000000000, 0xde53723751011a0aeff3f55d530000000000000000000000000, false⟩]
theorem check200 : check2 212 keys200 49 18 5 (z3Raw 65 [])
    (windowRaw C0.tree C0.KW C0.MW 5681 0 (windowRaw C1.tree C1.KW C1.MW 5362 0 (windowRaw C2.tree C2.KW C2.MW 5375 14 corr200))) = true := by decide +kernel
theorem boundary200 : rationalLogValue (orderedBlockExpression ⟨200, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨200, by decide⟩) + rawValue 44 220 corr200 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 65 []) (zero3_ordered ⟨65, by decide⟩)
    5681 5681 5362 5362 5375 5389 (by decide) (by decide) (by decide) rfl
    212 keys200 49 18 5 corr200 check200

def keys201 : Nat := 0x80000000000028000000000010000000000004000000000000e4c7c53f3480703a5d0e64402a5176cdbfc013bb6c4f701809ac2154df3002ee2040ea3e0146ae802a260084b350bde5801d7f1ee2c2c00a2e2f049d60042fcd1f63100165dcfb3f9800a7906433f4003bcf14a62a00143a12f9de00031248145e0000c2b2389ac
def corr201 : List Raw := [⟨0x200000000000, 0x15584d9c822add5818f6b76f92e8000000000000000000000000, false⟩, ⟨0x400000000000, 0x1d30d39b864d4932974b19803367bc00000000000000000000000, false⟩, ⟨0x500000000000, 0x8b212e7e17826644deb2a50beef75800000000000000000000000, false⟩, ⟨0x800000000000, 0x6d1b8df743697409abfe9b7551fb800000000000000000000000, false⟩]
theorem check201 : check2 214 keys201 49 21 5 (z3Raw 66 [])
    (windowRaw C0.tree C0.KW C0.MW 5681 0 (windowRaw C1.tree C1.KW C1.MW 5362 17 (windowRaw C2.tree C2.KW C2.MW 5389 0 corr201))) = true := by decide +kernel
theorem boundary201 : rationalLogValue (orderedBlockExpression ⟨201, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨201, by decide⟩) + rawValue 44 220 corr201 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 66 []) (zero3_ordered ⟨66, by decide⟩)
    5681 5681 5362 5379 5389 5389 (by decide) (by decide) (by decide) rfl
    214 keys201 49 21 5 corr201 check201

def keys202 : Nat := 0x80000000000028000000000010000000000004000000000000ffe72e494980705977d3e80037b21eba0bd013771a8a454809a2527eca7002e6ed8bb80e010cfc9f4743003fccdf34ae80152a8ccffa4009fbca2ddca003033e11f5a0016aaf7f8ed8007697a36d40000db1bfe6520003fc22a99b00002e000b6f000001d1b0ff0
def corr202 : List Raw := [⟨0x200000000000, 0x25cba3c07b19f9f92daf4340a446400000000000000000000000, false⟩, ⟨0x400000000000, 0x5fbde8f0e5a82e18b2738c66fb3b7400000000000000000000000, false⟩, ⟨0x500000000000, 0x266976f8435bd1e2b332d6f9dead67000000000000000000000000, false⟩, ⟨0x800000000000, 0x25cbe7f4ad633326ac56f356ab324800000000000000000000000, false⟩]
theorem check202 : check2 216 keys202 49 21 5 (z3Raw 67 [])
    (windowRaw C0.tree C0.KW C0.MW 5681 3 (windowRaw C1.tree C1.KW C1.MW 5379 14 (windowRaw C2.tree C2.KW C2.MW 5389 0 corr202))) = true := by decide +kernel
theorem boundary202 : rationalLogValue (orderedBlockExpression ⟨202, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨202, by decide⟩) + rawValue 44 220 corr202 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 67 []) (zero3_ordered ⟨67, by decide⟩)
    5681 5684 5379 5393 5389 5389 (by decide) (by decide) (by decide) rfl
    216 keys202 49 21 5 corr202 check202

def keys203 : Nat := 0x100000000000050000000000020000000000008000000000001fbd9de4ee480f187331a00c054b0afd171802a4a92b8553013725ed0187005cfc5e5e500028a98e5cd86014182357ed6001cf199cbfe800770ab20ec80033a93df7ae00152e0e8db1000417eaa1b78000071b87b20
def corr203 : List Raw := [⟨0x200000000000, 0x12a11f0ef0b79d87c099796b200d800000000000000000000000, false⟩, ⟨0x400000000000, 0x2865f72ec9025168a2d9266c6a2c000000000000000000000000, false⟩, ⟨0x500000000000, 0x79ac60753f13954cff8b43ee2e57000000000000000000000000, false⟩, ⟨0x800000000000, 0x632427611dc2cc768d602875c6800000000000000000000000, false⟩]
theorem check203 : check2 210 keys203 49 18 5 (z3Raw 68 [])
    (windowRaw C0.tree C0.KW C0.MW 5684 5 (windowRaw C1.tree C1.KW C1.MW 5393 6 (windowRaw C2.tree C2.KW C2.MW 5389 3 corr203))) = true := by decide +kernel
theorem boundary203 : rationalLogValue (orderedBlockExpression ⟨203, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨203, by decide⟩) + rawValue 44 220 corr203 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 68 []) (zero3_ordered ⟨68, by decide⟩)
    5684 5689 5393 5399 5389 5392 (by decide) (by decide) (by decide) rfl
    210 keys203 49 18 5 corr203 check203

def keys204 : Nat := 0x2000000000000a0000000000040000000000010000000000003e321716c7e01c0ab3563d380decbecb747406e929007be602a693b0a6f0015320f7a6a18098d3aa9a8a4027fa99ce14c013d9a5a6a5100865ca863ea0020eac4ddcb400af087bfd9400575cdce8a90028a341c023800d03a8b6590005ac6237024002d4c0f2419000e547f0c7f000708ed921b000332f01d0d40007698092a7000271b8621780000d641ea10
def corr204 : List Raw := [⟨0x200000000000, 0x11f86d72f41ca4f865449c9bbfb8800000000000000000000000, false⟩, ⟨0x400000000000, 0x7f475b091db14bdb19611b2bba5b7800000000000000000000000, false⟩, ⟨0x500000000000, 0x3b83de5a986ddbce1a98de8ca74594000000000000000000000000, false⟩, ⟨0x800000000000, 0x3f8bed44fc5239cb862a1d6702567800000000000000000000000, false⟩]
theorem check204 : check2 217 keys204 49 27 5 (z3Raw 69 [])
    (windowRaw C0.tree C0.KW C0.MW 5689 3 (windowRaw C1.tree C1.KW C1.MW 5399 14 (windowRaw C2.tree C2.KW C2.MW 5392 6 corr204))) = true := by decide +kernel
theorem boundary204 : rationalLogValue (orderedBlockExpression ⟨204, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨204, by decide⟩) + rawValue 44 220 corr204 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 69 []) (zero3_ordered ⟨69, by decide⟩)
    5689 5692 5399 5413 5392 5398 (by decide) (by decide) (by decide) rfl
    217 keys204 49 27 5 corr204 check204

def keys205 : Nat := 0x2000000000000a0000000000040000000000010000000000003babba68c3a01bafeba26a400d9f5bd7ebb004d439be9d70025fc0c23fa4012db840d3650096c47297388030a98bbf95c010c1154d4ca0085afb8b8ca8040f3b0930b4011bb397b49a008973479b810043cb03e9df001733a551ef000b771294bbc00453dc08034001e383aaf9b000b4cfd9abf0003e8640b910000797439f2100035805ba5600016720fd0c8000a09d9c5200005009d78b3000182496ab4000001a63ce48
def corr205 : List Raw := [⟨0x200000000000, 0xe2fb65b87a0f5d7db5a845c5ecb000000000000000000000000, false⟩, ⟨0x400000000000, 0x45f365f650cec705e1d22b6ddcb2f000000000000000000000000, false⟩, ⟨0x500000000000, 0x220fa73bfa810981481251157d1a26000000000000000000000000, false⟩, ⟨0x800000000000, 0x2537bc9b0fef3f3d6910d1948cf2c000000000000000000000000, false⟩]
theorem check205 : check2 216 keys205 49 31 5 (z3Raw 70 [])
    (windowRaw C0.tree C0.KW C0.MW 5692 8 (windowRaw C1.tree C1.KW C1.MW 5413 14 (windowRaw C2.tree C2.KW C2.MW 5398 5 corr205))) = true := by decide +kernel
theorem boundary205 : rationalLogValue (orderedBlockExpression ⟨205, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨205, by decide⟩) + rawValue 44 220 corr205 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 70 []) (zero3_ordered ⟨70, by decide⟩)
    5692 5700 5413 5427 5398 5403 (by decide) (by decide) (by decide) rfl
    216 keys205 49 31 5 corr205 check205

def keys206 : Nat := 0x2000000000000a00000000000400000000000100000000000038bddc4c1cd01bd8d6edba600d65d98767080697e89d93f802a694f65cc5015334f30711809824eedda20027e2429a474013d5cde75870084ec686b3b80227893a535800c5e3d70e10006137dc412a002c052530a90015e54e3a60c00a5a7a9e9b4004397b29f360016a7f4af9880070e4edf15800382fe1b9c2001a58f4d1010003902b759f000124338cbb4
def corr206 : List Raw := [⟨0x200000000000, 0x3cffb99903c727381921f23b51f000000000000000000000000, false⟩, ⟨0x400000000000, 0x433cc27de7aa9ca9f0f7f6318393800000000000000000000000, false⟩, ⟨0x500000000000, 0xee218cab9fbec44ae7df060764ed800000000000000000000000, false⟩, ⟨0x800000000000, 0x9b91289a8ad1a8686c375753a09800000000000000000000000, false⟩]
theorem check206 : check2 211 keys206 49 27 5 (z3Raw 71 [])
    (windowRaw C0.tree C0.KW C0.MW 5700 11 (windowRaw C1.tree C1.KW C1.MW 5427 6 (windowRaw C2.tree C2.KW C2.MW 5403 6 corr206))) = true := by decide +kernel
theorem boundary206 : rationalLogValue (orderedBlockExpression ⟨206, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨206, by decide⟩) + rawValue 44 220 corr206 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 71 []) (zero3_ordered ⟨71, by decide⟩)
    5700 5711 5427 5433 5403 5409 (by decide) (by decide) (by decide) rfl
    211 keys206 49 27 5 corr206 check206

def keys207 : Nat := 0x80000000000028000000000010000000000004000000000000deb4442641006e1b568a4d4034bd341cc9b015344634beb00a9a22ce4b7c04b9fc34f0da025ccd4c4833009f07e8145b004f820a3e00402174c448312010b893384050045930df2780022c68c6782400c418f7463c00614a9dfc75002bf1905f0d8014b8880dbc0005a979d51c2002d18d00a78000db78838148006d9df111ac000ec3816734000760d811cf0002825a6edd00013f6a14ed8
def corr207 : List Raw := [⟨0x200000000000, 0x5002aacd1c260de6416cadd2ed1400000000000000000000000, false⟩, ⟨0x400000000000, 0x11baf21671433ee0dc559289d4019400000000000000000000000, false⟩, ⟨0x500000000000, 0x89ac1b6ea0783b646c5bdd86650d1000000000000000000000000, false⟩, ⟨0x800000000000, 0x96bc8cf2cd543a4f06d0667de707000000000000000000000000, false⟩]
theorem check207 : check2 214 keys207 49 29 5 (z3Raw 72 [])
    (windowRaw C0.tree C0.KW C0.MW 5711 0 (windowRaw C1.tree C1.KW C1.MW 5433 11 (windowRaw C2.tree C2.KW C2.MW 5409 14 corr207))) = true := by decide +kernel
theorem boundary207 : rationalLogValue (orderedBlockExpression ⟨207, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨207, by decide⟩) + rawValue 44 220 corr207 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 72 []) (zero3_ordered ⟨72, by decide⟩)
    5711 5711 5433 5444 5409 5423 (by decide) (by decide) (by decide) rfl
    214 keys207 49 29 5 corr207 check207

def keys208 : Nat := 0x2000000000000a0000000000040000000000010000000000003e317821ceb01dd45ef23d500d9f76ad583804d4515426f2025fc2252d20012dc12566c60096c46008660030a72efdfd8010c11ec38de0085afa73ead8040f1d9a360c011bb48671f4008970f792d00043ca48f7180016ed95ef9a8008ad9c277d6003c6bfceb88000fa21ea14400072be46fe44000f2d72e5b80006b001d1280002ce0133260001413b15bac000a014671ec000302f565e800001c7611c2000001d01f1ac
def corr208 : List Raw := [⟨0x200000000000, 0xe3300376e9b2bcab950bb43562f800000000000000000000000, false⟩, ⟨0x400000000000, 0x2c26a65b1ceeccad4e86d1a2c095e000000000000000000000000, false⟩, ⟨0x500000000000, 0x1d39ab11c3551df34d23e28572ce12000000000000000000000000, false⟩, ⟨0x800000000000, 0x22a77048d38f00a2ffa957c2e4164000000000000000000000000, false⟩]
theorem check208 : check2 216 keys208 49 31 5 (z3Raw 73 [])
    (windowRaw C0.tree C0.KW C0.MW 5711 11 (windowRaw C1.tree C1.KW C1.MW 5444 5 (windowRaw C2.tree C2.KW C2.MW 5423 11 corr208))) = true := by decide +kernel
theorem boundary208 : rationalLogValue (orderedBlockExpression ⟨208, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨208, by decide⟩) + rawValue 44 220 corr208 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 73 []) (zero3_ordered ⟨73, by decide⟩)
    5711 5722 5444 5449 5423 5434 (by decide) (by decide) (by decide) rfl
    216 keys208 49 31 5 corr208 check208

def keys209 : Nat := 0x100000000000050000000000020000000000008000000000001bd6ed63efb00dd7f88b563006e92b170cba02a694a0c566015334ebf27e009c3b676dcd002e307a57024013f126055e1009eae756fca8017337adaca800afa6cef3f200576730127e001a01a23392800b53bb02044005a67e37e94001d8e8f90ba000e1c9e9db78006963fb92e4
def corr209 : List Raw := [⟨0x200000000000, 0x41e781949c231ec9c6d3976cce6000000000000000000000000, false⟩, ⟨0x400000000000, 0x1b262360e552afdbdfcd8c8831619000000000000000000000000, false⟩, ⟨0x500000000000, 0x516a206d3be34e9da520fb7095160000000000000000000000000, false⟩, ⟨0x800000000000, 0x2a52d728364f41cc5eb9fe061d01000000000000000000000000, false⟩]
theorem check209 : check2 214 keys209 49 22 5 (z3Raw 74 [])
    (windowRaw C0.tree C0.KW C0.MW 5722 6 (windowRaw C1.tree C1.KW C1.MW 5449 6 (windowRaw C2.tree C2.KW C2.MW 5434 6 corr209))) = true := by decide +kernel
theorem boundary209 : rationalLogValue (orderedBlockExpression ⟨209, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨209, by decide⟩) + rawValue 44 220 corr209 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 74 []) (zero3_ordered ⟨74, by decide⟩)
    5722 5728 5449 5455 5434 5440 (by decide) (by decide) (by decide) rfl
    214 keys209 49 22 5 corr209 check209

def keys210 : Nat := 0x4000000000001400000000000800000000000200000000000070275f82b80037b321a2ebd01ba6ad470bd00a9906b8524004e1db41687a026358879b1a00b8c1e7b5e8804f669cd75d0021979f0cfd00083a36dae52002bc0ba2e050015d3f535e4400a2da6967080033da8246f50016abe79b5e000b531c5d4e4003b1d1fbfe4001c23de8dfc0003b38b5700000137fee82b0
def corr210 : List Raw := [⟨0x200000000000, 0x21b5687bc316231ef09136890d2d800000000000000000000000, false⟩, ⟨0x400000000000, 0x80f6832b4dde93bd61fb7b6402dab000000000000000000000000, false⟩, ⟨0x500000000000, 0x3bdcf1167b6e41b94b17639a72fdde000000000000000000000000, false⟩, ⟨0x800000000000, 0x3f932e22129bb45ee0171506aad8d000000000000000000000000, false⟩]
theorem check210 : check2 217 keys210 49 24 5 (z3Raw 75 [])
    (windowRaw C0.tree C0.KW C0.MW 5728 0 (windowRaw C1.tree C1.KW C1.MW 5455 6 (windowRaw C2.tree C2.KW C2.MW 5440 14 corr210))) = true := by decide +kernel
theorem boundary210 : rationalLogValue (orderedBlockExpression ⟨210, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨210, by decide⟩) + rawValue 44 220 corr210 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 75 []) (zero3_ordered ⟨75, by decide⟩)
    5728 5728 5455 5461 5440 5454 (by decide) (by decide) (by decide) rfl
    217 keys210 49 24 5 corr210 check210

def keys211 : Nat := 0x400000000000140000000000080000000000020000000000006f71a543b9002a6859bc588013981a2d835809cb82ef279402df733b2b52016f99c1251f009faf7c70e8001522fc3e400005fcdc9d270001d65a6a072000eb17c953b000686dad62a0
def corr211 : List Raw := [⟨0x200000000000, 0x20a68c126893417a6a2334ea000d800000000000000000000000, false⟩, ⟨0x400000000000, 0x479a23fe3f7a57c0776a8f37073b2800000000000000000000000, false⟩, ⟨0x500000000000, 0xd5f3370e541e08f393df9e437b9e2000000000000000000000000, false⟩, ⟨0x800000000000, 0x61b3d302732ae9d4fe33d7a58c40000000000000000000000000, false⟩]
theorem check211 : check2 215 keys211 49 16 4 (z3Raw 76 [])
    (windowRaw C0.tree C0.KW C0.MW 5728 3 (windowRaw C1.tree C1.KW C1.MW 5461 0 (windowRaw C2.tree C2.KW C2.MW 5454 9 corr211))) = true := by decide +kernel
theorem boundary211 : rationalLogValue (orderedBlockExpression ⟨211, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨211, by decide⟩) + rawValue 44 220 corr211 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 76 []) (zero3_ordered ⟨76, by decide⟩)
    5728 5731 5461 5461 5454 5463 (by decide) (by decide) (by decide) rfl
    215 keys211 49 16 4 corr211 check211

def keys212 : Nat := 0x100000000000050000000000020000000000008000000000001c16e71bf1280a9760642e64054b305967380268b3d1907100a27ea9f4a880502359be520021a1ddf614a007f7a0c40540027e4592e4d800b569a89500003334fff63e00156a7f6313000368b1c2038000fc73bea3c
def corr212 : List Raw := [⟨0x200000000000, 0x7e341a471018a891a44024c8161800000000000000000000000, false⟩, ⟨0x400000000000, 0x18789d2202d5be45809215914407ec00000000000000000000000, false⟩, ⟨0x500000000000, 0x19235ef8dec179feb4f40bd982a4e5000000000000000000000000, false⟩, ⟨0x800000000000, 0x1fbbec9ad1d44574a21a49e2c051b000000000000000000000000, false⟩]
theorem check212 : check2 216 keys212 49 18 5 (z3Raw 77 [])
    (windowRaw C0.tree C0.KW C0.MW 5731 0 (windowRaw C1.tree C1.KW C1.MW 5461 3 (windowRaw C2.tree C2.KW C2.MW 5463 11 corr212))) = true := by decide +kernel
theorem boundary212 : rationalLogValue (orderedBlockExpression ⟨212, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨212, by decide⟩) + rawValue 44 220 corr212 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 77 []) (zero3_ordered ⟨77, by decide⟩)
    5731 5731 5461 5464 5463 5474 (by decide) (by decide) (by decide) rfl
    216 keys212 49 18 5 corr212 check212

def keys213 : Nat := 0x80000000000028000000000010000000000004000000000000e4d599a586c07058a26c3620277d15b811c013610d8e1368087ef68962cc0379ddc86f4e0175f899221b0084da1a5f9c001d5ea3674d400a2515a8c500042da29c9de0016091fac13800a73dbe801c0046a6f2df4c001de5b51b78000307e153068000bc07df1a8
def corr213 : List Raw := [⟨0x200000000000, 0x14a9c577c1c4cca01f70e616e0f3000000000000000000000000, false⟩, ⟨0x400000000000, 0x1d142811dffd8efde7b9cb9e7789f000000000000000000000000, false⟩, ⟨0x500000000000, 0x8b415b674cddf086e528dcc906dfc000000000000000000000000, false⟩, ⟨0x800000000000, 0x6d7d29922315d1415b8ae97e4b42000000000000000000000000, false⟩]
theorem check213 : check2 214 keys213 49 21 5 (z3Raw 78 [])
    (windowRaw C0.tree C0.KW C0.MW 5731 0 (windowRaw C1.tree C1.KW C1.MW 5464 0 (windowRaw C2.tree C2.KW C2.MW 5474 17 corr213))) = true := by decide +kernel
theorem boundary213 : rationalLogValue (orderedBlockExpression ⟨213, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨213, by decide⟩) + rawValue 44 220 corr213 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 78 []) (zero3_ordered ⟨78, by decide⟩)
    5731 5731 5464 5464 5474 5491 (by decide) (by decide) (by decide) rfl
    214 keys213 49 21 5 corr213 check213

def keys214 : Nat := 0x80000000000028000000000010000000000004000000000000e472496f450070f2900a33602a381eb58ce014083bc26f3809fb571d93d802c964194d3e0147e583c4a8008105bc5fdf001d162c5c4b8009db2afcde60041a4153023001649628964800a6489f1dc80038f057e8d600149890e28a0002dcbf73c00000b6b7a66b4
def corr214 : List Raw := [⟨0x200000000000, 0xcfca236cd9ba120770d5fb1ce8e000000000000000000000000, false⟩, ⟨0x400000000000, 0x2e377e58f1cb6e5c50ebcee951949c00000000000000000000000, false⟩, ⟨0x500000000000, 0x14ec9df235d1264b29ae288e963e01000000000000000000000000, false⟩, ⟨0x800000000000, 0x1423b1d97b2c68748037a55b3241dc00000000000000000000000, false⟩]
theorem check214 : check2 215 keys214 49 21 5 (z3Raw 79 [])
    (windowRaw C0.tree C0.KW C0.MW 5731 0 (windowRaw C1.tree C1.KW C1.MW 5464 17 (windowRaw C2.tree C2.KW C2.MW 5491 0 corr214))) = true := by decide +kernel
theorem boundary214 : rationalLogValue (orderedBlockExpression ⟨214, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨214, by decide⟩) + rawValue 44 220 corr214 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 79 []) (zero3_ordered ⟨79, by decide⟩)
    5731 5731 5464 5481 5491 5491 (by decide) (by decide) (by decide) rfl
    215 keys214 49 21 5 corr214 check214

def keys215 : Nat := 0x100000000000050000000000020000000000008000000000001c3ddb2fc6400a09ede8e3100504f6bb5e36026e27ef49cb00b0a22707640058510aadf28021dcf2011e6007963a624a5002763a4287f000a5f546d8e8003880b61ee4001c4054421d000322089eac8000d23252d10
def corr215 : List Raw := [⟨0x200000000000, 0x10f0a1d977db3997e54e084360d5000000000000000000000000, false⟩, ⟨0x400000000000, 0x4648617be8f5b777f94d512f43fe8000000000000000000000000, false⟩, ⟨0x500000000000, 0x2f8d7a10478d982a7e5426a6cbacf3000000000000000000000000, false⟩, ⟨0x800000000000, 0x3756302d467508fa574a731d57630800000000000000000000000, false⟩]
theorem check215 : check2 217 keys215 49 18 5 (z3Raw 80 [])
    (windowRaw C0.tree C0.KW C0.MW 5731 3 (windowRaw C1.tree C1.KW C1.MW 5481 11 (windowRaw C2.tree C2.KW C2.MW 5491 0 corr215))) = true := by decide +kernel
theorem boundary215 : rationalLogValue (orderedBlockExpression ⟨215, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨215, by decide⟩) + rawValue 44 220 corr215 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 80 []) (zero3_ordered ⟨80, by decide⟩)
    5731 5734 5481 5492 5491 5491 (by decide) (by decide) (by decide) rfl
    217 keys215 49 18 5 corr215 check215

def keys216 : Nat := 0x100000000000050000000000020000000000008000000000001ffc1e0d86580f23cd8a9664071c122dedf402a635dea4b30152d0e1c4ad0051471c492380278d9ce804e0044bbdbda29001b864ead33800b4ec34bb74003aba74364c001541cb521800003cdf5dd10000009fe4e4c
def corr216 : List Raw := [⟨0x200000000000, 0x69f4a78f81e31a77a98f15dd258000000000000000000000000, false⟩, ⟨0x400000000000, 0x2ee8d0018c05e26be772ffc564974c00000000000000000000000, false⟩, ⟨0x500000000000, 0x8b8d6695eae25c51190eba16f4055000000000000000000000000, false⟩, ⟨0x800000000000, 0x34f79e297bcc3358fe37124be433400000000000000000000000, false⟩]
theorem check216 : check2 214 keys216 49 18 5 (z3Raw 81 [])
    (windowRaw C0.tree C0.KW C0.MW 5734 5 (windowRaw C1.tree C1.KW C1.MW 5492 6 (windowRaw C2.tree C2.KW C2.MW 5491 3 corr216))) = true := by decide +kernel
theorem boundary216 : rationalLogValue (orderedBlockExpression ⟨216, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨216, by decide⟩) + rawValue 44 220 corr216 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 81 []) (zero3_ordered ⟨81, by decide⟩)
    5734 5739 5492 5498 5491 5494 (by decide) (by decide) (by decide) rfl
    214 keys216 49 18 5 corr216 check216

def keys217 : Nat := 0x2000000000000a0000000000040000000000010000000000003852675dae701c162d9c19000dda9f6df7a4054ccc164bee02a664d4693d0141107e13d5009ab83b5515002c32f78da760141b9ad4bde009eccda217d004380b3b75c000f8f54f8276005c1da6dda50028082105438013f6e2d0fc8005abd8271dc002d3a7da472001564a40d49000711d1dac6c003802eea7920017e0478e2b000374a02c260000ee16ed2d4
def corr217 : List Raw := [⟨0x200000000000, 0x1e755b07e9ad5d6a2e03d9c444dfc00000000000000000000000, false⟩, ⟨0x400000000000, 0x805b08067c915032db7cd009b780e800000000000000000000000, false⟩, ⟨0x500000000000, 0x3c030384c21c74c9876ba3bdaa85c1800000000000000000000000, false⟩, ⟨0x800000000000, 0x3ea74aeb103990bf3877031b5fba1c00000000000000000000000, false⟩]
theorem check217 : check2 217 keys217 49 27 5 (z3Raw 82 [])
    (windowRaw C0.tree C0.KW C0.MW 5739 0 (windowRaw C1.tree C1.KW C1.MW 5498 17 (windowRaw C2.tree C2.KW C2.MW 5494 6 corr217))) = true := by decide +kernel
theorem boundary217 : rationalLogValue (orderedBlockExpression ⟨217, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨217, by decide⟩) + rawValue 44 220 corr217 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 82 []) (zero3_ordered ⟨82, by decide⟩)
    5739 5739 5498 5515 5494 5500 (by decide) (by decide) (by decide) rfl
    217 keys217 49 27 5 corr217 check217

def keys218 : Nat := 0x80000000000028000000000010000000000004000000000000df7ec4465b006fb7001409c02718375c1430132dc26c36c80980fe08c650021a844d0f52010c196a4b0500839e88e76300217f3b077e801016a33e2c8007dd746a6f20029ca47d1c68014db15a55d0005d66df784a002e989851200004538e73190001f0e141964000c8255b1720005030a7f3b000246767ce08000c9c1bc130
def corr218 : List Raw := [⟨0x200000000000, 0x634375faf0cd6f7d6727a134c96400000000000000000000000, false⟩, ⟨0x400000000000, 0x12df8a93c107478b3b75279fe57b1c00000000000000000000000, false⟩, ⟨0x500000000000, 0x1282a7e7898af16a5c779dd3b2c933800000000000000000000000, false⟩, ⟨0x800000000000, 0x175f50c91fda4730d92346fecfeda800000000000000000000000, false⟩]
theorem check218 : check2 215 keys218 49 25 5 (z3Raw 83 [])
    (windowRaw C0.tree C0.KW C0.MW 5739 8 (windowRaw C1.tree C1.KW C1.MW 5515 8 (windowRaw C2.tree C2.KW C2.MW 5500 5 corr218))) = true := by decide +kernel
theorem boundary218 : rationalLogValue (orderedBlockExpression ⟨218, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨218, by decide⟩) + rawValue 44 220 corr218 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 83 []) (zero3_ordered ⟨83, by decide⟩)
    5739 5747 5515 5523 5500 5505 (by decide) (by decide) (by decide) rfl
    215 keys218 49 25 5 corr218 check218

def keys219 : Nat := 0x80000000000028000000000010000000000004000000000000df67ec27b0406f51d46747002a68e4b9b5c015345074f4d809c60d6c5aa00280dafe620e013f1613fcca00839ec0f88d001f75c2f026400b04ed92c5400550c00bb870016aa2752dc000b527c0be780034b740cfb400190872305e0003208e167f8000c9bec2a98
def corr219 : List Raw := [⟨0x200000000000, 0xfa47075c59d5b737de339b1d838400000000000000000000000, false⟩, ⟨0x400000000000, 0x2f8fe8244f3d739aac1f56f8b1fd8800000000000000000000000, false⟩, ⟨0x500000000000, 0x8e163484248810d33c3b49976656c000000000000000000000000, false⟩, ⟨0x800000000000, 0x4228661dd3d05681afb365051cb1400000000000000000000000, false⟩]
theorem check219 : check2 214 keys219 49 21 5 (z3Raw 84 [])
    (windowRaw C0.tree C0.KW C0.MW 5747 5 (windowRaw C1.tree C1.KW C1.MW 5523 6 (windowRaw C2.tree C2.KW C2.MW 5505 6 corr219))) = true := by decide +kernel
theorem boundary219 : rationalLogValue (orderedBlockExpression ⟨219, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨219, by decide⟩) + rawValue 44 220 corr219 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 84 []) (zero3_ordered ⟨84, by decide⟩)
    5747 5752 5523 5529 5505 5511 (by decide) (by decide) (by decide) rfl
    214 keys219 49 21 5 corr219 check219

def keys220 : Nat := 0x80000000000028000000000010000000000004000000000000df7ecebc4d806fb705ff422037d9fc53ca601bd474fd11100a9a392c7b6804cb705f293402603f9baa25009f8b0b6024804350a81c5e8021832d61a6e0085fcd078d200405a6d6f87001609dbf6a7400aa17d45d7e0053948041380029b624ea42800bacd3f12dc005d30f6748a002d5450949b0016a4f841a0800696e78837400114e3d03040007c3761c6300028185272800012337bf9ec
def corr220 : List Raw := [⟨0x200000000000, 0x8d8fcd7cce8210d8fb1fbb2c440800000000000000000000000, false⟩, ⟨0x400000000000, 0x40a166f15026aa6406bb0f9960819400000000000000000000000, false⟩, ⟨0x500000000000, 0x1b1322ef02e50d290a9bbf96856053800000000000000000000000, false⟩, ⟨0x800000000000, 0x1b822d3fae1b89a65556d39c97bfb000000000000000000000000, false⟩]
theorem check220 : check2 216 keys220 49 29 5 (z3Raw 85 [])
    (windowRaw C0.tree C0.KW C0.MW 5752 3 (windowRaw C1.tree C1.KW C1.MW 5529 11 (windowRaw C2.tree C2.KW C2.MW 5511 11 corr220))) = true := by decide +kernel
theorem boundary220 : rationalLogValue (orderedBlockExpression ⟨220, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨220, by decide⟩) + rawValue 44 220 corr220 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 85 []) (zero3_ordered ⟨85, by decide⟩)
    5752 5755 5529 5540 5511 5522 (by decide) (by decide) (by decide) rfl
    216 keys220 49 29 5 corr220 check220

def keys221 : Nat := 0x80000000000028000000000010000000000004000000000000ffff719bf600791ec20f29203852b9e03aa01534507295880a08caa40a1002c30a47c41201406d7e4f8f00280729f944800dc27be1adc00558c1c139a001c48331b73000c8439aee00000008e640a0
def corr221 : List Raw := [⟨0x200000000000, 0xf8d3ec51bc28f61eb2c24de5fafc00000000000000000000000, false⟩, ⟨0x400000000000, 0x1e9e842c5aff861712a5cc688b4d8400000000000000000000000, false⟩, ⟨0x500000000000, 0x5b57ddda89cfce1cc6052bfa6706f000000000000000000000000, false⟩, ⟨0x800000000000, 0x26ac7ab7e3100f8d9b771498eb78000000000000000000000000, false⟩]
theorem check221 : check2 214 keys221 49 17 5 (z3Raw 86 [])
    (windowRaw C0.tree C0.KW C0.MW 5755 4 (windowRaw C1.tree C1.KW C1.MW 5540 0 (windowRaw C2.tree C2.KW C2.MW 5522 9 corr221))) = true := by decide +kernel
theorem boundary221 : rationalLogValue (orderedBlockExpression ⟨221, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨221, by decide⟩) + rawValue 44 220 corr221 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 86 []) (zero3_ordered ⟨86, by decide⟩)
    5755 5759 5540 5540 5522 5531 (by decide) (by decide) (by decide) rfl
    214 keys221 49 17 5 corr221 check221

def keys222 : Nat := 0x80000000000028000000000010000000000004000000000000e0b1a608a7806ed4f7e960c02a66626faad0153326a8c62809ab8b32783802837322e0c6013d99b76dff008701ef2cdd801f1e2a2e41c00b83b866c36004fda9f65670016af643bfd800b4e9f5fb7c003802e6f2780017e04794f00003746a45720000edf5f1130
def corr222 : List Raw := [⟨0x200000000000, 0x1bf0dc2106df9624757ac81f7c3f800000000000000000000000, false⟩, ⟨0x400000000000, 0x63b95c9eb22a7e1e2d868572747a1000000000000000000000000, false⟩, ⟨0x500000000000, 0x36b1d6480e370f6ace9db3e33c293a000000000000000000000000, false⟩, ⟨0x800000000000, 0x3c4f5dbf2fdc75a3c932e29ef9f26800000000000000000000000, false⟩]
theorem check222 : check2 217 keys222 49 21 5 (z3Raw 87 [])
    (windowRaw C0.tree C0.KW C0.MW 5759 0 (windowRaw C1.tree C1.KW C1.MW 5540 6 (windowRaw C2.tree C2.KW C2.MW 5531 11 corr222))) = true := by decide +kernel
theorem boundary222 : rationalLogValue (orderedBlockExpression ⟨222, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨222, by decide⟩) + rawValue 44 220 corr222 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 87 []) (zero3_ordered ⟨87, by decide⟩)
    5759 5759 5540 5546 5531 5542 (by decide) (by decide) (by decide) rfl
    217 keys222 49 21 5 corr222 check222

def keys223 : Nat := 0x80000000000028000000000010000000000004000000000000e382e8e5e24070fac33a6c40282ca96b6e30141653d352c809b8cf5fec2402c1f35b4efe0160f98a962b008774f3cf60001e56791d858009d7bd9d7d20044b8cbce2100169dc84d2b000a5afe502d4003877bd65e4001c3bd7ee28000320f88e630000d19ab4d6c
def corr223 : List Raw := [⟨0x200000000000, 0x10ea6558513a124501b767af9a0b800000000000000000000000, false⟩, ⟨0x400000000000, 0x7476e2e3566f7bd10685e3e2d2499000000000000000000000000, false⟩, ⟨0x500000000000, 0x38369faabf847de71e45f2fcf2f973000000000000000000000000, false⟩, ⟨0x800000000000, 0x3ac0a65a2140ea0eef238e5dc92eb800000000000000000000000, false⟩]
theorem check223 : check2 217 keys223 49 21 5 (z3Raw 88 [])
    (windowRaw C0.tree C0.KW C0.MW 5759 3 (windowRaw C1.tree C1.KW C1.MW 5546 0 (windowRaw C2.tree C2.KW C2.MW 5542 14 corr223))) = true := by decide +kernel
theorem boundary223 : rationalLogValue (orderedBlockExpression ⟨223, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨223, by decide⟩) + rawValue 44 220 corr223 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 88 []) (zero3_ordered ⟨88, by decide⟩)
    5759 5762 5546 5546 5542 5556 (by decide) (by decide) (by decide) rfl
    217 keys223 49 21 5 corr223 check223

def keys224 : Nat := 0x5000000000004000000000002000000000000a98cf96b6980a968c0f08e005146c1e378804f1b93927c80075773021a0005507d2bf98
def corr224 : List Raw := [⟨0x200000000000, 0x6a30d75929d1fea90e03a2f9c28000000000000000000000000, false⟩, ⟨0x400000000000, 0xe8e22e267856d79391fc5d063d8000000000000000000000000, false⟩, ⟨0x500000000000, 0x293acde0af4499584daca82c8c58000000000000000000000000, false⟩]
theorem check224 : check2 209 keys224 48 9 4 (z3Raw 89 [])
    (windowRaw C0.tree C0.KW C0.MW 5762 0 (windowRaw C1.tree C1.KW C1.MW 5546 3 (windowRaw C2.tree C2.KW C2.MW 5556 3 corr224))) = true := by decide +kernel
theorem boundary224 : rationalLogValue (orderedBlockExpression ⟨224, by decide⟩) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow ⟨224, by decide⟩) + rawValue 44 220 corr224 :=
  boundary_of_check SuppliedDimensionRates.SuppliedDimensionCertificateTable0.table SuppliedDimensionRates.SuppliedDimensionCertificateTable1.table SuppliedDimensionRates.SuppliedDimensionCertificateTable2.table C0.tree C1.tree C2.tree C0.KW C0.MW C1.KW C1.MW C2.KW C2.MW
    C0.reads C1.reads C2.reads _ _ (z3Raw 89 []) (zero3_ordered ⟨89, by decide⟩)
    5762 5762 5546 5549 5556 5559 (by decide) (by decide) (by decide) rfl
    209 keys224 48 9 4 corr224 check224

end MatrixBounds.Numeric.FKLDimData
