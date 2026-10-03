module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block128
public import RateCertificateData.Level30Block129
public import RateCertificateData.Level30Block130
public import RateCertificateData.Level30Block131
public import RateCertificateData.Level30Block132
public import RateCertificateData.Level30Block133
public import RateCertificateData.Level30Block134
public import RateCertificateData.Level30Block135

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part128 : FKLCert.partRawEq S T KW MW tree 1024 8 RateCertificateData.Level30Block128.terms = true := by decide +kernel

theorem part129 : FKLCert.partRawEq S T KW MW tree 1032 8 RateCertificateData.Level30Block129.terms = true := by decide +kernel

theorem part130 : FKLCert.partRawEq S T KW MW tree 1040 8 RateCertificateData.Level30Block130.terms = true := by decide +kernel

theorem part131 : FKLCert.partRawEq S T KW MW tree 1048 8 RateCertificateData.Level30Block131.terms = true := by decide +kernel

theorem part132 : FKLCert.partRawEq S T KW MW tree 1056 8 RateCertificateData.Level30Block132.terms = true := by decide +kernel

theorem part133 : FKLCert.partRawEq S T KW MW tree 1064 8 RateCertificateData.Level30Block133.terms = true := by decide +kernel

theorem part134 : FKLCert.partRawEq S T KW MW tree 1072 8 RateCertificateData.Level30Block134.terms = true := by decide +kernel

theorem part135 : FKLCert.partRawEq S T KW MW tree 1080 6 RateCertificateData.Level30Block135.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
