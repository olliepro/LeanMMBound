module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block000
public import RateCertificateData.Level30Block001
public import RateCertificateData.Level30Block002
public import RateCertificateData.Level30Block003
public import RateCertificateData.Level30Block004
public import RateCertificateData.Level30Block005
public import RateCertificateData.Level30Block006
public import RateCertificateData.Level30Block007

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part000 : FKLCert.partRawEq S T KW MW tree 0 8 RateCertificateData.Level30Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq S T KW MW tree 8 8 RateCertificateData.Level30Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq S T KW MW tree 16 8 RateCertificateData.Level30Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq S T KW MW tree 24 8 RateCertificateData.Level30Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq S T KW MW tree 32 8 RateCertificateData.Level30Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq S T KW MW tree 40 8 RateCertificateData.Level30Block005.terms = true := by decide +kernel

theorem part006 : FKLCert.partRawEq S T KW MW tree 48 8 RateCertificateData.Level30Block006.terms = true := by decide +kernel

theorem part007 : FKLCert.partRawEq S T KW MW tree 56 8 RateCertificateData.Level30Block007.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
