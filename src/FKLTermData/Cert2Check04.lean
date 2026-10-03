module

public import FKLTermData.Cert2Tree
public import RateCertificateData.Terminal2Block032
public import RateCertificateData.Terminal2Block033
public import RateCertificateData.Terminal2Block034
public import RateCertificateData.Terminal2Block035
public import RateCertificateData.Terminal2Block036
public import RateCertificateData.Terminal2Block037
public import RateCertificateData.Terminal2Block038

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Cert2

theorem part032 : FKLCert.partRawEq S T KW MW tree 256 8 RateCertificateData.Terminal2Block032.terms = true := by decide +kernel

theorem part033 : FKLCert.partRawEq S T KW MW tree 264 8 RateCertificateData.Terminal2Block033.terms = true := by decide +kernel

theorem part034 : FKLCert.partRawEq S T KW MW tree 272 8 RateCertificateData.Terminal2Block034.terms = true := by decide +kernel

theorem part035 : FKLCert.partRawEq S T KW MW tree 280 8 RateCertificateData.Terminal2Block035.terms = true := by decide +kernel

theorem part036 : FKLCert.partRawEq S T KW MW tree 288 8 RateCertificateData.Terminal2Block036.terms = true := by decide +kernel

theorem part037 : FKLCert.partRawEq S T KW MW tree 296 8 RateCertificateData.Terminal2Block037.terms = true := by decide +kernel

theorem part038 : FKLCert.partRawEq S T KW MW tree 304 3 RateCertificateData.Terminal2Block038.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Cert2
