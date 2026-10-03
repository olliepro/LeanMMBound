module

public import FKLTermData.Cert2Tree
public import RateCertificateData.Terminal2Block008
public import RateCertificateData.Terminal2Block009
public import RateCertificateData.Terminal2Block010
public import RateCertificateData.Terminal2Block011
public import RateCertificateData.Terminal2Block012
public import RateCertificateData.Terminal2Block013
public import RateCertificateData.Terminal2Block014
public import RateCertificateData.Terminal2Block015

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Cert2

theorem part008 : FKLCert.partRawEq S T KW MW tree 64 8 RateCertificateData.Terminal2Block008.terms = true := by decide +kernel

theorem part009 : FKLCert.partRawEq S T KW MW tree 72 8 RateCertificateData.Terminal2Block009.terms = true := by decide +kernel

theorem part010 : FKLCert.partRawEq S T KW MW tree 80 8 RateCertificateData.Terminal2Block010.terms = true := by decide +kernel

theorem part011 : FKLCert.partRawEq S T KW MW tree 88 8 RateCertificateData.Terminal2Block011.terms = true := by decide +kernel

theorem part012 : FKLCert.partRawEq S T KW MW tree 96 8 RateCertificateData.Terminal2Block012.terms = true := by decide +kernel

theorem part013 : FKLCert.partRawEq S T KW MW tree 104 8 RateCertificateData.Terminal2Block013.terms = true := by decide +kernel

theorem part014 : FKLCert.partRawEq S T KW MW tree 112 8 RateCertificateData.Terminal2Block014.terms = true := by decide +kernel

theorem part015 : FKLCert.partRawEq S T KW MW tree 120 8 RateCertificateData.Terminal2Block015.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Cert2
