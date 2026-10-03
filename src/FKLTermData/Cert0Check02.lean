module

public import FKLTermData.Cert0Tree
public import RateCertificateData.Terminal0Block016
public import RateCertificateData.Terminal0Block017
public import RateCertificateData.Terminal0Block018
public import RateCertificateData.Terminal0Block019
public import RateCertificateData.Terminal0Block020
public import RateCertificateData.Terminal0Block021
public import RateCertificateData.Terminal0Block022
public import RateCertificateData.Terminal0Block023

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Cert0

theorem part016 : FKLCert.partRawEq S T KW MW tree 128 8 RateCertificateData.Terminal0Block016.terms = true := by decide +kernel

theorem part017 : FKLCert.partRawEq S T KW MW tree 136 8 RateCertificateData.Terminal0Block017.terms = true := by decide +kernel

theorem part018 : FKLCert.partRawEq S T KW MW tree 144 8 RateCertificateData.Terminal0Block018.terms = true := by decide +kernel

theorem part019 : FKLCert.partRawEq S T KW MW tree 152 8 RateCertificateData.Terminal0Block019.terms = true := by decide +kernel

theorem part020 : FKLCert.partRawEq S T KW MW tree 160 8 RateCertificateData.Terminal0Block020.terms = true := by decide +kernel

theorem part021 : FKLCert.partRawEq S T KW MW tree 168 8 RateCertificateData.Terminal0Block021.terms = true := by decide +kernel

theorem part022 : FKLCert.partRawEq S T KW MW tree 176 8 RateCertificateData.Terminal0Block022.terms = true := by decide +kernel

theorem part023 : FKLCert.partRawEq S T KW MW tree 184 8 RateCertificateData.Terminal0Block023.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Cert0
