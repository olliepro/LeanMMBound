module

public import FKLCertData.Level32Tree
public import RateCertificateData.Level32Block032
public import RateCertificateData.Level32Block033
public import RateCertificateData.Level32Block034
public import RateCertificateData.Level32Block035
public import RateCertificateData.Level32Block036
public import RateCertificateData.Level32Block037
public import RateCertificateData.Level32Block038
public import RateCertificateData.Level32Block039

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level32

theorem part032 : FKLCert.partRawEq S T KW MW tree 256 8 RateCertificateData.Level32Block032.terms = true := by decide +kernel

theorem part033 : FKLCert.partRawEq S T KW MW tree 264 8 RateCertificateData.Level32Block033.terms = true := by decide +kernel

theorem part034 : FKLCert.partRawEq S T KW MW tree 272 8 RateCertificateData.Level32Block034.terms = true := by decide +kernel

theorem part035 : FKLCert.partRawEq S T KW MW tree 280 8 RateCertificateData.Level32Block035.terms = true := by decide +kernel

theorem part036 : FKLCert.partRawEq S T KW MW tree 288 8 RateCertificateData.Level32Block036.terms = true := by decide +kernel

theorem part037 : FKLCert.partRawEq S T KW MW tree 296 8 RateCertificateData.Level32Block037.terms = true := by decide +kernel

theorem part038 : FKLCert.partRawEq S T KW MW tree 304 8 RateCertificateData.Level32Block038.terms = true := by decide +kernel

theorem part039 : FKLCert.partRawEq S T KW MW tree 312 8 RateCertificateData.Level32Block039.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level32
