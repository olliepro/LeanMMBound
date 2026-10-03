module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block104
public import RateCertificateData.Level30Block105
public import RateCertificateData.Level30Block106
public import RateCertificateData.Level30Block107
public import RateCertificateData.Level30Block108
public import RateCertificateData.Level30Block109
public import RateCertificateData.Level30Block110
public import RateCertificateData.Level30Block111

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part104 : FKLCert.partRawEq S T KW MW tree 832 8 RateCertificateData.Level30Block104.terms = true := by decide +kernel

theorem part105 : FKLCert.partRawEq S T KW MW tree 840 8 RateCertificateData.Level30Block105.terms = true := by decide +kernel

theorem part106 : FKLCert.partRawEq S T KW MW tree 848 8 RateCertificateData.Level30Block106.terms = true := by decide +kernel

theorem part107 : FKLCert.partRawEq S T KW MW tree 856 8 RateCertificateData.Level30Block107.terms = true := by decide +kernel

theorem part108 : FKLCert.partRawEq S T KW MW tree 864 8 RateCertificateData.Level30Block108.terms = true := by decide +kernel

theorem part109 : FKLCert.partRawEq S T KW MW tree 872 8 RateCertificateData.Level30Block109.terms = true := by decide +kernel

theorem part110 : FKLCert.partRawEq S T KW MW tree 880 8 RateCertificateData.Level30Block110.terms = true := by decide +kernel

theorem part111 : FKLCert.partRawEq S T KW MW tree 888 8 RateCertificateData.Level30Block111.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
