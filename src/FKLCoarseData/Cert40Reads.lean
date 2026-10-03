module

public import PairedCoarse4CertificateTable
public import FKLCoarseData.Cert40Check00

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert40

set_option maxRecDepth 100000

theorem reads : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.table 0 :=
  (FKLCert.rawReads_append S T KW MW tree ((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part000).append (((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part001).append (MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part002)))) ((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part003).append (((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part004).append (MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part005)))) 0
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part000 ((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part001).append (MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part002)) 0
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block000.terms _ 0 8 (by decide) part000 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part000 0)
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part001 MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part002 512
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block001.terms _ 8 8 (by decide) part001 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part001 512)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block002.terms _ 16 8 (by decide) part002 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part002 1024)))
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part003 ((MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part004).append (MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part005)) 1536
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block003.terms _ 24 8 (by decide) part003 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part003 1536)
    (FKLCert.rawReads_append S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part004 MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part005 2048
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block004.terms _ 32 8 (by decide) part004 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part004 2048)
    (FKLCert.rawReads_ofList S T KW MW tree RateCertificateData.Level40Block005.terms _ 40 4 (by decide) part005 : FKLCert.RawReads S T KW MW tree MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.part005 2560))))

end MatrixBounds.Numeric.FKLCoarseData.Cert40
