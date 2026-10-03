module

public import FKLDimData.C2Tree
public import RateCertificateData.Dimension2Block000
public import RateCertificateData.Dimension2Block001
public import RateCertificateData.Dimension2Block002
public import RateCertificateData.Dimension2Block003
public import RateCertificateData.Dimension2Block004
public import RateCertificateData.Dimension2Block005
public import RateCertificateData.Dimension2Block006
public import RateCertificateData.Dimension2Block007

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData.C2

theorem part000 : FKLCert.partRawEq 44 220 KW MW tree 0 8 RateCertificateData.Dimension2Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq 44 220 KW MW tree 8 8 RateCertificateData.Dimension2Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq 44 220 KW MW tree 16 8 RateCertificateData.Dimension2Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq 44 220 KW MW tree 24 8 RateCertificateData.Dimension2Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq 44 220 KW MW tree 32 8 RateCertificateData.Dimension2Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq 44 220 KW MW tree 40 8 RateCertificateData.Dimension2Block005.terms = true := by decide +kernel

theorem part006 : FKLCert.partRawEq 44 220 KW MW tree 48 8 RateCertificateData.Dimension2Block006.terms = true := by decide +kernel

theorem part007 : FKLCert.partRawEq 44 220 KW MW tree 56 8 RateCertificateData.Dimension2Block007.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLDimData.C2
