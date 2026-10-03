module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block040
public import RateCertificateData.Level30Block041
public import RateCertificateData.Level30Block042
public import RateCertificateData.Level30Block043
public import RateCertificateData.Level30Block044
public import RateCertificateData.Level30Block045
public import RateCertificateData.Level30Block046
public import RateCertificateData.Level30Block047

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part040 : FKLCert.partRawEq S T KW MW tree 320 8 RateCertificateData.Level30Block040.terms = true := by decide +kernel

theorem part041 : FKLCert.partRawEq S T KW MW tree 328 8 RateCertificateData.Level30Block041.terms = true := by decide +kernel

theorem part042 : FKLCert.partRawEq S T KW MW tree 336 8 RateCertificateData.Level30Block042.terms = true := by decide +kernel

theorem part043 : FKLCert.partRawEq S T KW MW tree 344 8 RateCertificateData.Level30Block043.terms = true := by decide +kernel

theorem part044 : FKLCert.partRawEq S T KW MW tree 352 8 RateCertificateData.Level30Block044.terms = true := by decide +kernel

theorem part045 : FKLCert.partRawEq S T KW MW tree 360 8 RateCertificateData.Level30Block045.terms = true := by decide +kernel

theorem part046 : FKLCert.partRawEq S T KW MW tree 368 8 RateCertificateData.Level30Block046.terms = true := by decide +kernel

theorem part047 : FKLCert.partRawEq S T KW MW tree 376 8 RateCertificateData.Level30Block047.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
