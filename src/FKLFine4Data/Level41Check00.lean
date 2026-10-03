module

public import FKLFine4Data.Level41Tree
public import RateCertificateData.Level41Block000
public import RateCertificateData.Level41Block001
public import RateCertificateData.Level41Block002
public import RateCertificateData.Level41Block003
public import RateCertificateData.Level41Block004

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4Data.Level41

theorem part000 : FKLCert.partRawEq S T KW MW tree 0 8 RateCertificateData.Level41Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq S T KW MW tree 8 8 RateCertificateData.Level41Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq S T KW MW tree 16 8 RateCertificateData.Level41Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq S T KW MW tree 24 8 RateCertificateData.Level41Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq S T KW MW tree 32 4 RateCertificateData.Level41Block004.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLFine4Data.Level41
