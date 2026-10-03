module

public import FKLDimData.C0Tree
public import RateCertificateData.Dimension0Block008
public import RateCertificateData.Dimension0Block009
public import RateCertificateData.Dimension0Block010
public import RateCertificateData.Dimension0Block011

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData.C0

theorem part008 : FKLCert.partRawEq 44 220 KW MW tree 64 8 RateCertificateData.Dimension0Block008.terms = true := by decide +kernel

theorem part009 : FKLCert.partRawEq 44 220 KW MW tree 72 8 RateCertificateData.Dimension0Block009.terms = true := by decide +kernel

theorem part010 : FKLCert.partRawEq 44 220 KW MW tree 80 8 RateCertificateData.Dimension0Block010.terms = true := by decide +kernel

theorem part011 : FKLCert.partRawEq 44 220 KW MW tree 88 6 RateCertificateData.Dimension0Block011.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLDimData.C0
