module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block080
public import RateCertificateData.Level30Block081
public import RateCertificateData.Level30Block082
public import RateCertificateData.Level30Block083
public import RateCertificateData.Level30Block084
public import RateCertificateData.Level30Block085
public import RateCertificateData.Level30Block086
public import RateCertificateData.Level30Block087

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part080 : FKLCert.partRawEq S T KW MW tree 640 8 RateCertificateData.Level30Block080.terms = true := by decide +kernel

theorem part081 : FKLCert.partRawEq S T KW MW tree 648 8 RateCertificateData.Level30Block081.terms = true := by decide +kernel

theorem part082 : FKLCert.partRawEq S T KW MW tree 656 8 RateCertificateData.Level30Block082.terms = true := by decide +kernel

theorem part083 : FKLCert.partRawEq S T KW MW tree 664 8 RateCertificateData.Level30Block083.terms = true := by decide +kernel

theorem part084 : FKLCert.partRawEq S T KW MW tree 672 8 RateCertificateData.Level30Block084.terms = true := by decide +kernel

theorem part085 : FKLCert.partRawEq S T KW MW tree 680 8 RateCertificateData.Level30Block085.terms = true := by decide +kernel

theorem part086 : FKLCert.partRawEq S T KW MW tree 688 8 RateCertificateData.Level30Block086.terms = true := by decide +kernel

theorem part087 : FKLCert.partRawEq S T KW MW tree 696 8 RateCertificateData.Level30Block087.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
