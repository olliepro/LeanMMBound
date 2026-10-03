module

public import FKLCertData.Level31Tree
public import RateCertificateData.Level31Block032
public import RateCertificateData.Level31Block033
public import RateCertificateData.Level31Block034
public import RateCertificateData.Level31Block035
public import RateCertificateData.Level31Block036
public import RateCertificateData.Level31Block037
public import RateCertificateData.Level31Block038
public import RateCertificateData.Level31Block039

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level31

theorem part032 : FKLCert.partRawEq S T KW MW tree 256 8 RateCertificateData.Level31Block032.terms = true := by decide +kernel

theorem part033 : FKLCert.partRawEq S T KW MW tree 264 8 RateCertificateData.Level31Block033.terms = true := by decide +kernel

theorem part034 : FKLCert.partRawEq S T KW MW tree 272 8 RateCertificateData.Level31Block034.terms = true := by decide +kernel

theorem part035 : FKLCert.partRawEq S T KW MW tree 280 8 RateCertificateData.Level31Block035.terms = true := by decide +kernel

theorem part036 : FKLCert.partRawEq S T KW MW tree 288 8 RateCertificateData.Level31Block036.terms = true := by decide +kernel

theorem part037 : FKLCert.partRawEq S T KW MW tree 296 8 RateCertificateData.Level31Block037.terms = true := by decide +kernel

theorem part038 : FKLCert.partRawEq S T KW MW tree 304 8 RateCertificateData.Level31Block038.terms = true := by decide +kernel

theorem part039 : FKLCert.partRawEq S T KW MW tree 312 8 RateCertificateData.Level31Block039.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level31
