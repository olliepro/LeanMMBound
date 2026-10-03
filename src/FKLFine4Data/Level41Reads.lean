module

public import PairedFine4TableA0
public import FKLFine4Data.Level41Check00

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4Data.Level41

set_option maxRecDepth 100000

theorem reads : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.table 0 :=
  (FKLCert.rawReads_append S T KW MW tree ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part000).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part001)) ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part002).append (((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part003).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part004)))) 0
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part000 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part001 0
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level41Block000.terms _ 0 8 (by decide) part000 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part000 0)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level41Block001.terms _ 8 8 (by decide) part001 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part001 512))
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part002 ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part003).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part004)) 1024
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level41Block002.terms _ 16 8 (by decide) part002 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part002 1024)
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part003 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part004 1536
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level41Block003.terms _ 24 8 (by decide) part003 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part003 1536)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level41Block004.terms _ 32 4 (by decide) part004 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0.part004 2048))))

end MatrixBounds.Numeric.FKLFine4Data.Level41
