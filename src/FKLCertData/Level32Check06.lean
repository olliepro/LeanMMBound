module

public import FKLCertData.Level32Tree
public import RateCertificateData.Level32Block048
public import RateCertificateData.Level32Block049
public import RateCertificateData.Level32Block050
public import RateCertificateData.Level32Block051
public import RateCertificateData.Level32Block052
public import RateCertificateData.Level32Block053
public import RateCertificateData.Level32Block054
public import RateCertificateData.Level32Block055

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level32

theorem part048 : FKLCert.partRawEq S T KW MW tree 384 8 RateCertificateData.Level32Block048.terms = true := by decide +kernel

theorem part049 : FKLCert.partRawEq S T KW MW tree 392 8 RateCertificateData.Level32Block049.terms = true := by decide +kernel

theorem part050 : FKLCert.partRawEq S T KW MW tree 400 8 RateCertificateData.Level32Block050.terms = true := by decide +kernel

theorem part051 : FKLCert.partRawEq S T KW MW tree 408 8 RateCertificateData.Level32Block051.terms = true := by decide +kernel

theorem part052 : FKLCert.partRawEq S T KW MW tree 416 8 RateCertificateData.Level32Block052.terms = true := by decide +kernel

theorem part053 : FKLCert.partRawEq S T KW MW tree 424 8 RateCertificateData.Level32Block053.terms = true := by decide +kernel

theorem part054 : FKLCert.partRawEq S T KW MW tree 432 8 RateCertificateData.Level32Block054.terms = true := by decide +kernel

theorem part055 : FKLCert.partRawEq S T KW MW tree 440 8 RateCertificateData.Level32Block055.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level32
