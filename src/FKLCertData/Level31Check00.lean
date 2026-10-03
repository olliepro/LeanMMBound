module

public import FKLCertData.Level31Tree
public import RateCertificateData.Level31Block000
public import RateCertificateData.Level31Block001
public import RateCertificateData.Level31Block002
public import RateCertificateData.Level31Block003
public import RateCertificateData.Level31Block004
public import RateCertificateData.Level31Block005
public import RateCertificateData.Level31Block006
public import RateCertificateData.Level31Block007

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level31

theorem part000 : FKLCert.partRawEq S T KW MW tree 0 8 RateCertificateData.Level31Block000.terms = true := by decide +kernel

theorem part001 : FKLCert.partRawEq S T KW MW tree 8 8 RateCertificateData.Level31Block001.terms = true := by decide +kernel

theorem part002 : FKLCert.partRawEq S T KW MW tree 16 8 RateCertificateData.Level31Block002.terms = true := by decide +kernel

theorem part003 : FKLCert.partRawEq S T KW MW tree 24 8 RateCertificateData.Level31Block003.terms = true := by decide +kernel

theorem part004 : FKLCert.partRawEq S T KW MW tree 32 8 RateCertificateData.Level31Block004.terms = true := by decide +kernel

theorem part005 : FKLCert.partRawEq S T KW MW tree 40 8 RateCertificateData.Level31Block005.terms = true := by decide +kernel

theorem part006 : FKLCert.partRawEq S T KW MW tree 48 8 RateCertificateData.Level31Block006.terms = true := by decide +kernel

theorem part007 : FKLCert.partRawEq S T KW MW tree 56 8 RateCertificateData.Level31Block007.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level31
