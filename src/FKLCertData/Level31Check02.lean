module

public import FKLCertData.Level31Tree
public import RateCertificateData.Level31Block016
public import RateCertificateData.Level31Block017
public import RateCertificateData.Level31Block018
public import RateCertificateData.Level31Block019
public import RateCertificateData.Level31Block020
public import RateCertificateData.Level31Block021
public import RateCertificateData.Level31Block022
public import RateCertificateData.Level31Block023

@[expose] public section

namespace MatrixBounds.Numeric.FKLCertData.Level31

theorem part016 : FKLCert.partRawEq S T KW MW tree 128 8 RateCertificateData.Level31Block016.terms = true := by decide +kernel

theorem part017 : FKLCert.partRawEq S T KW MW tree 136 8 RateCertificateData.Level31Block017.terms = true := by decide +kernel

theorem part018 : FKLCert.partRawEq S T KW MW tree 144 8 RateCertificateData.Level31Block018.terms = true := by decide +kernel

theorem part019 : FKLCert.partRawEq S T KW MW tree 152 8 RateCertificateData.Level31Block019.terms = true := by decide +kernel

theorem part020 : FKLCert.partRawEq S T KW MW tree 160 8 RateCertificateData.Level31Block020.terms = true := by decide +kernel

theorem part021 : FKLCert.partRawEq S T KW MW tree 168 8 RateCertificateData.Level31Block021.terms = true := by decide +kernel

theorem part022 : FKLCert.partRawEq S T KW MW tree 176 8 RateCertificateData.Level31Block022.terms = true := by decide +kernel

theorem part023 : FKLCert.partRawEq S T KW MW tree 184 8 RateCertificateData.Level31Block023.terms = true := by decide +kernel

end MatrixBounds.Numeric.FKLCertData.Level31
