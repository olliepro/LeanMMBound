module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block064
public import RateCertificateData.Level30Block065
public import RateCertificateData.Level30Block066
public import RateCertificateData.Level30Block067
public import RateCertificateData.Level30Block068
public import RateCertificateData.Level30Block069
public import RateCertificateData.Level30Block070
public import RateCertificateData.Level30Block071

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part064 : FKLCert.partRawEq S T KW MW tree 512 8 RateCertificateData.Level30Block064.terms = true := by decide +kernel

theorem part065 : FKLCert.partRawEq S T KW MW tree 520 8 RateCertificateData.Level30Block065.terms = true := by decide +kernel

theorem part066 : FKLCert.partRawEq S T KW MW tree 528 8 RateCertificateData.Level30Block066.terms = true := by decide +kernel

theorem part067 : FKLCert.partRawEq S T KW MW tree 536 8 RateCertificateData.Level30Block067.terms = true := by decide +kernel

theorem part068 : FKLCert.partRawEq S T KW MW tree 544 8 RateCertificateData.Level30Block068.terms = true := by decide +kernel

theorem part069 : FKLCert.partRawEq S T KW MW tree 552 8 RateCertificateData.Level30Block069.terms = true := by decide +kernel

theorem part070 : FKLCert.partRawEq S T KW MW tree 560 8 RateCertificateData.Level30Block070.terms = true := by decide +kernel

theorem part071 : FKLCert.partRawEq S T KW MW tree 568 8 RateCertificateData.Level30Block071.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
