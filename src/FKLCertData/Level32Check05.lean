module

public import FKLCertData.Level32Tree
public import RateCertificateData.Level32Block040
public import RateCertificateData.Level32Block041
public import RateCertificateData.Level32Block042
public import RateCertificateData.Level32Block043
public import RateCertificateData.Level32Block044
public import RateCertificateData.Level32Block045
public import RateCertificateData.Level32Block046
public import RateCertificateData.Level32Block047

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level32

theorem part040 : FKLCert.partRawEq S T KW MW tree 320 8 RateCertificateData.Level32Block040.terms = true := by decide +kernel

theorem part041 : FKLCert.partRawEq S T KW MW tree 328 8 RateCertificateData.Level32Block041.terms = true := by decide +kernel

theorem part042 : FKLCert.partRawEq S T KW MW tree 336 8 RateCertificateData.Level32Block042.terms = true := by decide +kernel

theorem part043 : FKLCert.partRawEq S T KW MW tree 344 8 RateCertificateData.Level32Block043.terms = true := by decide +kernel

theorem part044 : FKLCert.partRawEq S T KW MW tree 352 8 RateCertificateData.Level32Block044.terms = true := by decide +kernel

theorem part045 : FKLCert.partRawEq S T KW MW tree 360 8 RateCertificateData.Level32Block045.terms = true := by decide +kernel

theorem part046 : FKLCert.partRawEq S T KW MW tree 368 8 RateCertificateData.Level32Block046.terms = true := by decide +kernel

theorem part047 : FKLCert.partRawEq S T KW MW tree 376 8 RateCertificateData.Level32Block047.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level32
