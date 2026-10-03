module

public import FKLTermData.Cert1Tree
public import RateCertificateData.Terminal1Block024
public import RateCertificateData.Terminal1Block025
public import RateCertificateData.Terminal1Block026
public import RateCertificateData.Terminal1Block027
public import RateCertificateData.Terminal1Block028
public import RateCertificateData.Terminal1Block029
public import RateCertificateData.Terminal1Block030
public import RateCertificateData.Terminal1Block031

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Cert1

theorem part024 : FKLCert.partRawEq S T KW MW tree 192 8 RateCertificateData.Terminal1Block024.terms = true := by decide +kernel

theorem part025 : FKLCert.partRawEq S T KW MW tree 200 8 RateCertificateData.Terminal1Block025.terms = true := by decide +kernel

theorem part026 : FKLCert.partRawEq S T KW MW tree 208 8 RateCertificateData.Terminal1Block026.terms = true := by decide +kernel

theorem part027 : FKLCert.partRawEq S T KW MW tree 216 8 RateCertificateData.Terminal1Block027.terms = true := by decide +kernel

theorem part028 : FKLCert.partRawEq S T KW MW tree 224 8 RateCertificateData.Terminal1Block028.terms = true := by decide +kernel

theorem part029 : FKLCert.partRawEq S T KW MW tree 232 8 RateCertificateData.Terminal1Block029.terms = true := by decide +kernel

theorem part030 : FKLCert.partRawEq S T KW MW tree 240 8 RateCertificateData.Terminal1Block030.terms = true := by decide +kernel

theorem part031 : FKLCert.partRawEq S T KW MW tree 248 8 RateCertificateData.Terminal1Block031.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Cert1
