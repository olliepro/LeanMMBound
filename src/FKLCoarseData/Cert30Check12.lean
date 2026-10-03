module

public import FKLCoarseData.Cert30Tree
public import RateCertificateData.Level30Block096
public import RateCertificateData.Level30Block097
public import RateCertificateData.Level30Block098
public import RateCertificateData.Level30Block099
public import RateCertificateData.Level30Block100
public import RateCertificateData.Level30Block101
public import RateCertificateData.Level30Block102
public import RateCertificateData.Level30Block103

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert30

theorem part096 : FKLCert.partRawEq S T KW MW tree 768 8 RateCertificateData.Level30Block096.terms = true := by decide +kernel

theorem part097 : FKLCert.partRawEq S T KW MW tree 776 8 RateCertificateData.Level30Block097.terms = true := by decide +kernel

theorem part098 : FKLCert.partRawEq S T KW MW tree 784 8 RateCertificateData.Level30Block098.terms = true := by decide +kernel

theorem part099 : FKLCert.partRawEq S T KW MW tree 792 8 RateCertificateData.Level30Block099.terms = true := by decide +kernel

theorem part100 : FKLCert.partRawEq S T KW MW tree 800 8 RateCertificateData.Level30Block100.terms = true := by decide +kernel

theorem part101 : FKLCert.partRawEq S T KW MW tree 808 8 RateCertificateData.Level30Block101.terms = true := by decide +kernel

theorem part102 : FKLCert.partRawEq S T KW MW tree 816 8 RateCertificateData.Level30Block102.terms = true := by decide +kernel

theorem part103 : FKLCert.partRawEq S T KW MW tree 824 8 RateCertificateData.Level30Block103.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCoarseData.Cert30
