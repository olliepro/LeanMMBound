module

public import FKLCertData.Level32Tree
public import RateCertificateData.Level32Block064
public import RateCertificateData.Level32Block065
public import RateCertificateData.Level32Block066

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level32

theorem part064 : FKLCert.partRawEq S T KW MW tree 512 8 RateCertificateData.Level32Block064.terms = true := by decide +kernel

theorem part065 : FKLCert.partRawEq S T KW MW tree 520 8 RateCertificateData.Level32Block065.terms = true := by decide +kernel

theorem part066 : FKLCert.partRawEq S T KW MW tree 528 4 RateCertificateData.Level32Block066.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level32
