module

public import FKLTermData.A0Blocks00
public import FKLTermData.A0Blocks01
public import FKLTermData.A0Blocks02
public import FKLTermData.A0Blocks03
public import FKLTermData.A0Blocks04
public import FKLTermData.A0Blocks05
public import FKLTermData.A0Blocks06
public import FKLTermData.A0Blocks07
public import FKLTermData.A0Blocks08
public import FKLTermData.A0Blocks09
public import FKLTermData.A0Blocks10
public import FKLTermData.A0Blocks11
public import FKLTermData.A0Blocks12
public import FKLTermData.A0Blocks13
public import FKLTermData.A0Blocks14

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.A0

open FKL FKLTerm

def corrs : List (List Raw) := [corr000, corr001, corr002, corr003, corr004, corr005, corr006, corr007, corr008, corr009, corr010, corr011, corr012, corr013, corr014, corr015, corr016, corr017, corr018, corr019, corr020, corr021, corr022, corr023, corr024, corr025, corr026, corr027, corr028, corr029, corr030, corr031, corr032, corr033, corr034, corr035, corr036, corr037, corr038, corr039, corr040, corr041, corr042, corr043, corr044, corr045, corr046, corr047, corr048, corr049, corr050, corr051, corr052, corr053, corr054, corr055, corr056, corr057, corr058, corr059, corr060, corr061, corr062, corr063, corr064, corr065, corr066, corr067, corr068, corr069, corr070, corr071, corr072, corr073, corr074, corr075, corr076, corr077, corr078, corr079, corr080, corr081, corr082, corr083, corr084, corr085, corr086, corr087, corr088, corr089, corr090, corr091, corr092, corr093, corr094, corr095, corr096, corr097, corr098, corr099, corr100, corr101, corr102, corr103, corr104, corr105, corr106, corr107, corr108, corr109, corr110, corr111, corr112, corr113, corr114, corr115, corr116, corr117, corr118, corr119, corr120, corr121, corr122, corr123, corr124, corr125, corr126, corr127, corr128, corr129, corr130, corr131, corr132, corr133, corr134]
def corrKeys : Nat := 0x2000000000001ffffffffffc3fffffffffe07ffffffffd40ffffffff2d81fffffffdc603fffffff9e207fffffff3000fffffffe2301fffffffb5203fffffff02e07ffffffd7780fffffffa0c01fffffff30403ffffffe03807ffffffbc3c0fffffff5e281ffffffe8ad03ffffffcb0e07ffffff86800ffffffee3e01ffffffd97803ffffffa13407ffffff35000ffffffe58201ffffff496503fffffe599607fffffab18c0ffffff3f1281ed4c64a7ba03d76c58953207ab1aa282240f53c129d1281ea78242bdc03d4dd324f7a07a9ba6488580f536643af901ea6c70273803d4d2e943c607a9a54a9fe80f534a71dc581ea6875f4d403d4d0e6021e07a9a1ac767c0f53432904181ea6863fb8003d4d0c7e76407a9a18b48e00f53431055c81ea686201ac03d4d0c400fe07a9a1869b0c0f53430ce2281ea686183e803d4d0c307cc07a9a1860e300f53430bd9181ea6861778603d4d0c2e7bc07a9a185cf400f53430b9db81ea686173b603d4d0c2e76a07a9a185cebc0f53430b9b901ea6861734d03d4d0c2e27007a9a18411140f5342fd52101ea68468e2a03d4d086fd6c07a99e89eb9c0f533203dfe01ea56794ce803d48e9eea66002b7161159a0056a61acc6000accdfc2020015985d8519002b2f79029400565ee5c75800acbd02adf0015979efbbb002b2f3d1d9000565e7a32cc00acbcf46470015979e8c51002b2f3d189600565e7a312800acbcf46248015979e8c30002b2f3d184400565e7a21e800acbcf426e8015979e7c74002b2f3cf83400565e79f06000acbcf31dd8015979e593d002b2f3bff0200565e77f95000acbcefaa38015979d2dc8002b2f38189c00565e70120000acbcd6fbe80159794e261002b2f19fde200565e282cb000acb58e23a801596ad5806002b2d16bc3a00564e3f632000ac99bc50700159166ddea002b22cdb08600561f6f509000ac3ed62ed801539575f77002893a76ace004ace6d61180000000c0ed80000001539d00000001a66a00000002da6c00000001a7e0000000032c0000000005ecc000000009a20000000011c2000000001e600000000034f2000000005d4c00000000a1d8000000010f1000000001fc80000000033f0000000005f4000000000a22000000000fd20000000012b8000000001dd00000000034000000000061e0000000008e8000000000d280000000000b000000000002000000000001
theorem corr_check : check2 267 corrKeys 47 149 8 corrs.flatten [] = true := by decide +kernel
theorem corr_sum : (corrs.map (rawValue 44 264)).sum = 0 := corrections_cancel corrs 267 corrKeys 47 149 8 corr_check

end MatrixBounds.Numeric.FKLTermData.A0
