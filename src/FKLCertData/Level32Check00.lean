module

public import FKLCertData.Level32Tree
public import RateCertificateData.Level32Block000
public import RateCertificateData.Level32Block001
public import RateCertificateData.Level32Block002
public import RateCertificateData.Level32Block003
public import RateCertificateData.Level32Block004
public import RateCertificateData.Level32Block005
public import RateCertificateData.Level32Block006
public import RateCertificateData.Level32Block007

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level32

theorem part000 : FKLCert.partRawEq S T KW MW tree 0 8 RateCertificateData.Level32Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq S T KW MW tree 8 8 RateCertificateData.Level32Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq S T KW MW tree 16 8 RateCertificateData.Level32Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq S T KW MW tree 24 8 RateCertificateData.Level32Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq S T KW MW tree 32 8 RateCertificateData.Level32Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq S T KW MW tree 40 8 RateCertificateData.Level32Block005.terms = true := by decide +kernel

theorem part006 : FKLCert.partRawEq S T KW MW tree 48 8 RateCertificateData.Level32Block006.terms = true := by decide +kernel

theorem part007 : FKLCert.partRawEq S T KW MW tree 56 8 RateCertificateData.Level32Block007.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level32
