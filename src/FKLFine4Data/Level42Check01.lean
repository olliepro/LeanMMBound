module

public import FKLFine4Data.Level42Tree
public import RateCertificateData.Level42Block008

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4Data.Level42

theorem part008 : FKLCert.partRawEq S T KW MW tree 64 6 RateCertificateData.Level42Block008.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLFine4Data.Level42
