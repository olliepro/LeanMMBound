module

public import FKLCoarseData.Cert40Tree
public import RateCertificateData.Level40Block000
public import RateCertificateData.Level40Block001
public import RateCertificateData.Level40Block002
public import RateCertificateData.Level40Block003
public import RateCertificateData.Level40Block004
public import RateCertificateData.Level40Block005

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert40

theorem part000 : FKLCert.partRawEq S T KW MW tree 0 8 RateCertificateData.Level40Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq S T KW MW tree 8 8 RateCertificateData.Level40Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq S T KW MW tree 16 8 RateCertificateData.Level40Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq S T KW MW tree 24 8 RateCertificateData.Level40Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq S T KW MW tree 32 8 RateCertificateData.Level40Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq S T KW MW tree 40 4 RateCertificateData.Level40Block005.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert40
