module

public import FKLTermData.Cert0Tree
public import RateCertificateData.Terminal0Block032
public import RateCertificateData.Terminal0Block033
public import RateCertificateData.Terminal0Block034
public import RateCertificateData.Terminal0Block035
public import RateCertificateData.Terminal0Block036
public import RateCertificateData.Terminal0Block037
public import RateCertificateData.Terminal0Block038

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Cert0

theorem part032 : FKLCert.partRawEq S T KW MW tree 256 8 RateCertificateData.Terminal0Block032.terms = true := by decide +kernel

theorem part033 : FKLCert.partRawEq S T KW MW tree 264 8 RateCertificateData.Terminal0Block033.terms = true := by decide +kernel

theorem part034 : FKLCert.partRawEq S T KW MW tree 272 8 RateCertificateData.Terminal0Block034.terms = true := by decide +kernel

theorem part035 : FKLCert.partRawEq S T KW MW tree 280 8 RateCertificateData.Terminal0Block035.terms = true := by decide +kernel

theorem part036 : FKLCert.partRawEq S T KW MW tree 288 8 RateCertificateData.Terminal0Block036.terms = true := by decide +kernel

theorem part037 : FKLCert.partRawEq S T KW MW tree 296 8 RateCertificateData.Terminal0Block037.terms = true := by decide +kernel

theorem part038 : FKLCert.partRawEq S T KW MW tree 304 3 RateCertificateData.Terminal0Block038.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Cert0
