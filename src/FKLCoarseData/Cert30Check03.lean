module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block024
public import RateCertificateData.Level30Block025
public import RateCertificateData.Level30Block026
public import RateCertificateData.Level30Block027
public import RateCertificateData.Level30Block028
public import RateCertificateData.Level30Block029
public import RateCertificateData.Level30Block030
public import RateCertificateData.Level30Block031

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part024 : FKLCert.partRawEq S T KW MW tree 192 8 RateCertificateData.Level30Block024.terms = true := by decide +kernel

theorem part025 : FKLCert.partRawEq S T KW MW tree 200 8 RateCertificateData.Level30Block025.terms = true := by decide +kernel

theorem part026 : FKLCert.partRawEq S T KW MW tree 208 8 RateCertificateData.Level30Block026.terms = true := by decide +kernel

theorem part027 : FKLCert.partRawEq S T KW MW tree 216 8 RateCertificateData.Level30Block027.terms = true := by decide +kernel

theorem part028 : FKLCert.partRawEq S T KW MW tree 224 8 RateCertificateData.Level30Block028.terms = true := by decide +kernel

theorem part029 : FKLCert.partRawEq S T KW MW tree 232 8 RateCertificateData.Level30Block029.terms = true := by decide +kernel

theorem part030 : FKLCert.partRawEq S T KW MW tree 240 8 RateCertificateData.Level30Block030.terms = true := by decide +kernel

theorem part031 : FKLCert.partRawEq S T KW MW tree 248 8 RateCertificateData.Level30Block031.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
