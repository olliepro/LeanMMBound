module

public import PairedFine4TableA1
public import FKLFine4Data.Level42Check00
public import FKLFine4Data.Level42Check01

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4Data.Level42

set_option maxRecDepth 100000

theorem reads : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.table 0 :=
  (FKLCert.rawReads_append S T KW MW tree ((((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part000).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part001))).append (((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part002).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part003)))) ((((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part004).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part005))).append (((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part006).append (((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part007).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part008)))))) 0
    (FKLCert.rawReads_append S T KW MW tree ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part000).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part001)) ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part002).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part003)) 0
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part000 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part001 0
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block000.terms _ 0 8 (by decide) part000 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part000 0)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block001.terms _ 8 8 (by decide) part001 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part001 512))
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part002 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part003 1024
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block002.terms _ 16 8 (by decide) part002 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part002 1024)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block003.terms _ 24 8 (by decide) part003 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part003 1536)))
    (FKLCert.rawReads_append S T KW MW tree ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part004).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part005)) ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part006).append (((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part007).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part008)))) 2048
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part004 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part005 2048
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block004.terms _ 32 8 (by decide) part004 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part004 2048)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block005.terms _ 40 8 (by decide) part005 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part005 2560))
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part006 ((MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part007).append (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part008)) 3072
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block006.terms _ 48 8 (by decide) part006 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part006 3072)
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part007 MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part008 3584
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block007.terms _ 56 8 (by decide) part007 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part007 3584)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level42Block008.terms _ 64 6 (by decide) part008 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.part008 4096)))))

end MatrixBounds.Numeric.FKLFine4Data.Level42
