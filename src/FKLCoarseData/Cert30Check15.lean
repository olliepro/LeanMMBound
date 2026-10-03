module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block120
public import RateCertificateData.Level30Block121
public import RateCertificateData.Level30Block122
public import RateCertificateData.Level30Block123
public import RateCertificateData.Level30Block124
public import RateCertificateData.Level30Block125
public import RateCertificateData.Level30Block126
public import RateCertificateData.Level30Block127

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part120 : FKLCert.partRawEq S T KW MW tree 960 8 RateCertificateData.Level30Block120.terms = true := by decide +kernel

theorem part121 : FKLCert.partRawEq S T KW MW tree 968 8 RateCertificateData.Level30Block121.terms = true := by decide +kernel

theorem part122 : FKLCert.partRawEq S T KW MW tree 976 8 RateCertificateData.Level30Block122.terms = true := by decide +kernel

theorem part123 : FKLCert.partRawEq S T KW MW tree 984 8 RateCertificateData.Level30Block123.terms = true := by decide +kernel

theorem part124 : FKLCert.partRawEq S T KW MW tree 992 8 RateCertificateData.Level30Block124.terms = true := by decide +kernel

theorem part125 : FKLCert.partRawEq S T KW MW tree 1000 8 RateCertificateData.Level30Block125.terms = true := by decide +kernel

theorem part126 : FKLCert.partRawEq S T KW MW tree 1008 8 RateCertificateData.Level30Block126.terms = true := by decide +kernel

theorem part127 : FKLCert.partRawEq S T KW MW tree 1016 8 RateCertificateData.Level30Block127.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
