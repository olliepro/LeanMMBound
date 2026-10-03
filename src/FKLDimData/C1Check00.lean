module

public import FKLDimData.C1Tree
public import RateCertificateData.Dimension1Block000
public import RateCertificateData.Dimension1Block001
public import RateCertificateData.Dimension1Block002
public import RateCertificateData.Dimension1Block003
public import RateCertificateData.Dimension1Block004
public import RateCertificateData.Dimension1Block005
public import RateCertificateData.Dimension1Block006
public import RateCertificateData.Dimension1Block007

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData.C1

theorem part000 : FKLCert.partRawEq 44 220 KW MW tree 0 8 RateCertificateData.Dimension1Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq 44 220 KW MW tree 8 8 RateCertificateData.Dimension1Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq 44 220 KW MW tree 16 8 RateCertificateData.Dimension1Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq 44 220 KW MW tree 24 8 RateCertificateData.Dimension1Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq 44 220 KW MW tree 32 8 RateCertificateData.Dimension1Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq 44 220 KW MW tree 40 8 RateCertificateData.Dimension1Block005.terms = true := by decide +kernel

theorem part006 : FKLCert.partRawEq 44 220 KW MW tree 48 8 RateCertificateData.Dimension1Block006.terms = true := by decide +kernel

theorem part007 : FKLCert.partRawEq 44 220 KW MW tree 56 8 RateCertificateData.Dimension1Block007.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLDimData.C1
