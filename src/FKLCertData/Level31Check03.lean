module

public import FKLCertData.Level31Tree
public import RateCertificateData.Level31Block024
public import RateCertificateData.Level31Block025
public import RateCertificateData.Level31Block026
public import RateCertificateData.Level31Block027
public import RateCertificateData.Level31Block028
public import RateCertificateData.Level31Block029
public import RateCertificateData.Level31Block030
public import RateCertificateData.Level31Block031

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level31

theorem part024 : FKLCert.partRawEq S T KW MW tree 192 8 RateCertificateData.Level31Block024.terms = true := by decide +kernel

theorem part025 : FKLCert.partRawEq S T KW MW tree 200 8 RateCertificateData.Level31Block025.terms = true := by decide +kernel

theorem part026 : FKLCert.partRawEq S T KW MW tree 208 8 RateCertificateData.Level31Block026.terms = true := by decide +kernel

theorem part027 : FKLCert.partRawEq S T KW MW tree 216 8 RateCertificateData.Level31Block027.terms = true := by decide +kernel

theorem part028 : FKLCert.partRawEq S T KW MW tree 224 8 RateCertificateData.Level31Block028.terms = true := by decide +kernel

theorem part029 : FKLCert.partRawEq S T KW MW tree 232 8 RateCertificateData.Level31Block029.terms = true := by decide +kernel

theorem part030 : FKLCert.partRawEq S T KW MW tree 240 8 RateCertificateData.Level31Block030.terms = true := by decide +kernel

theorem part031 : FKLCert.partRawEq S T KW MW tree 248 8 RateCertificateData.Level31Block031.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level31
