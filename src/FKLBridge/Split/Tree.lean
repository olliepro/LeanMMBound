module

public import FKLBridge.Rows
public import IndexedCertificateRows
public import FKLBridge.Split.Data00
public import FKLBridge.Split.Data01

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric

/-- Chunk tree: chunk `k` holds rows `8k … 8k+7`; bit `l` of `k` selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0000)
    (FKL.Tree.leaf chunk0512))
    (FKL.Tree.leaf chunk0256)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0128)
    (FKL.Tree.leaf chunk0640))
    (FKL.Tree.leaf chunk0384))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0064)
    (FKL.Tree.leaf chunk0576))
    (FKL.Tree.leaf chunk0320)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0192)
    (FKL.Tree.leaf chunk0448)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0032)
    (FKL.Tree.leaf chunk0544))
    (FKL.Tree.leaf chunk0288)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0160)
    (FKL.Tree.leaf chunk0672))
    (FKL.Tree.leaf chunk0416))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0096)
    (FKL.Tree.leaf chunk0608))
    (FKL.Tree.leaf chunk0352)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0224)
    (FKL.Tree.leaf chunk0480))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0016)
    (FKL.Tree.leaf chunk0528))
    (FKL.Tree.leaf chunk0272)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0144)
    (FKL.Tree.leaf chunk0656))
    (FKL.Tree.leaf chunk0400))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0080)
    (FKL.Tree.leaf chunk0592))
    (FKL.Tree.leaf chunk0336)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0208)
    (FKL.Tree.leaf chunk0464)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0048)
    (FKL.Tree.leaf chunk0560))
    (FKL.Tree.leaf chunk0304)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0176)
    (FKL.Tree.leaf chunk0688))
    (FKL.Tree.leaf chunk0432))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0112)
    (FKL.Tree.leaf chunk0624))
    (FKL.Tree.leaf chunk0368)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0240)
    (FKL.Tree.leaf chunk0496)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0008)
    (FKL.Tree.leaf chunk0520))
    (FKL.Tree.leaf chunk0264)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0136)
    (FKL.Tree.leaf chunk0648))
    (FKL.Tree.leaf chunk0392))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0072)
    (FKL.Tree.leaf chunk0584))
    (FKL.Tree.leaf chunk0328)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0200)
    (FKL.Tree.leaf chunk0456)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0040)
    (FKL.Tree.leaf chunk0552))
    (FKL.Tree.leaf chunk0296)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0168)
    (FKL.Tree.leaf chunk0680))
    (FKL.Tree.leaf chunk0424))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0104)
    (FKL.Tree.leaf chunk0616))
    (FKL.Tree.leaf chunk0360)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0232)
    (FKL.Tree.leaf chunk0488))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0024)
    (FKL.Tree.leaf chunk0536))
    (FKL.Tree.leaf chunk0280)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0152)
    (FKL.Tree.leaf chunk0664))
    (FKL.Tree.leaf chunk0408))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0088)
    (FKL.Tree.leaf chunk0600))
    (FKL.Tree.leaf chunk0344)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0216)
    (FKL.Tree.leaf chunk0472)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0056)
    (FKL.Tree.leaf chunk0568))
    (FKL.Tree.leaf chunk0312)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0184)
    (FKL.Tree.leaf chunk0440))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0120)
    (FKL.Tree.leaf chunk0632))
    (FKL.Tree.leaf chunk0376)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0248)
    (FKL.Tree.leaf chunk0504))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0004)
    (FKL.Tree.leaf chunk0516))
    (FKL.Tree.leaf chunk0260)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0132)
    (FKL.Tree.leaf chunk0644))
    (FKL.Tree.leaf chunk0388))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0068)
    (FKL.Tree.leaf chunk0580))
    (FKL.Tree.leaf chunk0324)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0196)
    (FKL.Tree.leaf chunk0452)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0036)
    (FKL.Tree.leaf chunk0548))
    (FKL.Tree.leaf chunk0292)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0164)
    (FKL.Tree.leaf chunk0676))
    (FKL.Tree.leaf chunk0420))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0100)
    (FKL.Tree.leaf chunk0612))
    (FKL.Tree.leaf chunk0356)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0228)
    (FKL.Tree.leaf chunk0484))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0020)
    (FKL.Tree.leaf chunk0532))
    (FKL.Tree.leaf chunk0276)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0148)
    (FKL.Tree.leaf chunk0660))
    (FKL.Tree.leaf chunk0404))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0084)
    (FKL.Tree.leaf chunk0596))
    (FKL.Tree.leaf chunk0340)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0212)
    (FKL.Tree.leaf chunk0468)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0052)
    (FKL.Tree.leaf chunk0564))
    (FKL.Tree.leaf chunk0308)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0180)
    (FKL.Tree.leaf chunk0692))
    (FKL.Tree.leaf chunk0436))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0116)
    (FKL.Tree.leaf chunk0628))
    (FKL.Tree.leaf chunk0372)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0244)
    (FKL.Tree.leaf chunk0500)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0012)
    (FKL.Tree.leaf chunk0524))
    (FKL.Tree.leaf chunk0268)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0140)
    (FKL.Tree.leaf chunk0652))
    (FKL.Tree.leaf chunk0396))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0076)
    (FKL.Tree.leaf chunk0588))
    (FKL.Tree.leaf chunk0332)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0204)
    (FKL.Tree.leaf chunk0460)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0044)
    (FKL.Tree.leaf chunk0556))
    (FKL.Tree.leaf chunk0300)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0172)
    (FKL.Tree.leaf chunk0684))
    (FKL.Tree.leaf chunk0428))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0108)
    (FKL.Tree.leaf chunk0620))
    (FKL.Tree.leaf chunk0364)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0236)
    (FKL.Tree.leaf chunk0492))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0028)
    (FKL.Tree.leaf chunk0540))
    (FKL.Tree.leaf chunk0284)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0156)
    (FKL.Tree.leaf chunk0668))
    (FKL.Tree.leaf chunk0412))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0092)
    (FKL.Tree.leaf chunk0604))
    (FKL.Tree.leaf chunk0348)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0220)
    (FKL.Tree.leaf chunk0476)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0060)
    (FKL.Tree.leaf chunk0572))
    (FKL.Tree.leaf chunk0316)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0188)
    (FKL.Tree.leaf chunk0444))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0124)
    (FKL.Tree.leaf chunk0636))
    (FKL.Tree.leaf chunk0380)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0252)
    (FKL.Tree.leaf chunk0508)))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0002)
    (FKL.Tree.leaf chunk0514))
    (FKL.Tree.leaf chunk0258)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0130)
    (FKL.Tree.leaf chunk0642))
    (FKL.Tree.leaf chunk0386))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0066)
    (FKL.Tree.leaf chunk0578))
    (FKL.Tree.leaf chunk0322)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0194)
    (FKL.Tree.leaf chunk0450)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0034)
    (FKL.Tree.leaf chunk0546))
    (FKL.Tree.leaf chunk0290)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0162)
    (FKL.Tree.leaf chunk0674))
    (FKL.Tree.leaf chunk0418))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0098)
    (FKL.Tree.leaf chunk0610))
    (FKL.Tree.leaf chunk0354)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0226)
    (FKL.Tree.leaf chunk0482))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0018)
    (FKL.Tree.leaf chunk0530))
    (FKL.Tree.leaf chunk0274)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0146)
    (FKL.Tree.leaf chunk0658))
    (FKL.Tree.leaf chunk0402))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0082)
    (FKL.Tree.leaf chunk0594))
    (FKL.Tree.leaf chunk0338)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0210)
    (FKL.Tree.leaf chunk0466)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0050)
    (FKL.Tree.leaf chunk0562))
    (FKL.Tree.leaf chunk0306)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0178)
    (FKL.Tree.leaf chunk0690))
    (FKL.Tree.leaf chunk0434))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0114)
    (FKL.Tree.leaf chunk0626))
    (FKL.Tree.leaf chunk0370)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0242)
    (FKL.Tree.leaf chunk0498)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0010)
    (FKL.Tree.leaf chunk0522))
    (FKL.Tree.leaf chunk0266)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0138)
    (FKL.Tree.leaf chunk0650))
    (FKL.Tree.leaf chunk0394))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0074)
    (FKL.Tree.leaf chunk0586))
    (FKL.Tree.leaf chunk0330)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0202)
    (FKL.Tree.leaf chunk0458)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0042)
    (FKL.Tree.leaf chunk0554))
    (FKL.Tree.leaf chunk0298)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0170)
    (FKL.Tree.leaf chunk0682))
    (FKL.Tree.leaf chunk0426))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0106)
    (FKL.Tree.leaf chunk0618))
    (FKL.Tree.leaf chunk0362)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0234)
    (FKL.Tree.leaf chunk0490))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0026)
    (FKL.Tree.leaf chunk0538))
    (FKL.Tree.leaf chunk0282)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0154)
    (FKL.Tree.leaf chunk0666))
    (FKL.Tree.leaf chunk0410))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0090)
    (FKL.Tree.leaf chunk0602))
    (FKL.Tree.leaf chunk0346)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0218)
    (FKL.Tree.leaf chunk0474)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0058)
    (FKL.Tree.leaf chunk0570))
    (FKL.Tree.leaf chunk0314)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0186)
    (FKL.Tree.leaf chunk0442))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0122)
    (FKL.Tree.leaf chunk0634))
    (FKL.Tree.leaf chunk0378)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0250)
    (FKL.Tree.leaf chunk0506))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0006)
    (FKL.Tree.leaf chunk0518))
    (FKL.Tree.leaf chunk0262)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0134)
    (FKL.Tree.leaf chunk0646))
    (FKL.Tree.leaf chunk0390))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0070)
    (FKL.Tree.leaf chunk0582))
    (FKL.Tree.leaf chunk0326)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0198)
    (FKL.Tree.leaf chunk0454)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0038)
    (FKL.Tree.leaf chunk0550))
    (FKL.Tree.leaf chunk0294)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0166)
    (FKL.Tree.leaf chunk0678))
    (FKL.Tree.leaf chunk0422))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0102)
    (FKL.Tree.leaf chunk0614))
    (FKL.Tree.leaf chunk0358)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0230)
    (FKL.Tree.leaf chunk0486))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0022)
    (FKL.Tree.leaf chunk0534))
    (FKL.Tree.leaf chunk0278)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0150)
    (FKL.Tree.leaf chunk0662))
    (FKL.Tree.leaf chunk0406))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0086)
    (FKL.Tree.leaf chunk0598))
    (FKL.Tree.leaf chunk0342)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0214)
    (FKL.Tree.leaf chunk0470)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0054)
    (FKL.Tree.leaf chunk0566))
    (FKL.Tree.leaf chunk0310)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0182)
    (FKL.Tree.leaf chunk0438))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0118)
    (FKL.Tree.leaf chunk0630))
    (FKL.Tree.leaf chunk0374)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0246)
    (FKL.Tree.leaf chunk0502)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0014)
    (FKL.Tree.leaf chunk0526))
    (FKL.Tree.leaf chunk0270)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0142)
    (FKL.Tree.leaf chunk0654))
    (FKL.Tree.leaf chunk0398))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0078)
    (FKL.Tree.leaf chunk0590))
    (FKL.Tree.leaf chunk0334)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0206)
    (FKL.Tree.leaf chunk0462)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0046)
    (FKL.Tree.leaf chunk0558))
    (FKL.Tree.leaf chunk0302)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0174)
    (FKL.Tree.leaf chunk0686))
    (FKL.Tree.leaf chunk0430))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0110)
    (FKL.Tree.leaf chunk0622))
    (FKL.Tree.leaf chunk0366)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0238)
    (FKL.Tree.leaf chunk0494))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0030)
    (FKL.Tree.leaf chunk0542))
    (FKL.Tree.leaf chunk0286)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0158)
    (FKL.Tree.leaf chunk0670))
    (FKL.Tree.leaf chunk0414))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0094)
    (FKL.Tree.leaf chunk0606))
    (FKL.Tree.leaf chunk0350)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0222)
    (FKL.Tree.leaf chunk0478)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0062)
    (FKL.Tree.leaf chunk0574))
    (FKL.Tree.leaf chunk0318)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0190)
    (FKL.Tree.leaf chunk0446))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0126)
    (FKL.Tree.leaf chunk0638))
    (FKL.Tree.leaf chunk0382)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0254)
    (FKL.Tree.leaf chunk0510))))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0001)
    (FKL.Tree.leaf chunk0513))
    (FKL.Tree.leaf chunk0257)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0129)
    (FKL.Tree.leaf chunk0641))
    (FKL.Tree.leaf chunk0385))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0065)
    (FKL.Tree.leaf chunk0577))
    (FKL.Tree.leaf chunk0321)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0193)
    (FKL.Tree.leaf chunk0449)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0033)
    (FKL.Tree.leaf chunk0545))
    (FKL.Tree.leaf chunk0289)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0161)
    (FKL.Tree.leaf chunk0673))
    (FKL.Tree.leaf chunk0417))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0097)
    (FKL.Tree.leaf chunk0609))
    (FKL.Tree.leaf chunk0353)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0225)
    (FKL.Tree.leaf chunk0481))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0017)
    (FKL.Tree.leaf chunk0529))
    (FKL.Tree.leaf chunk0273)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0145)
    (FKL.Tree.leaf chunk0657))
    (FKL.Tree.leaf chunk0401))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0081)
    (FKL.Tree.leaf chunk0593))
    (FKL.Tree.leaf chunk0337)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0209)
    (FKL.Tree.leaf chunk0465)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0049)
    (FKL.Tree.leaf chunk0561))
    (FKL.Tree.leaf chunk0305)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0177)
    (FKL.Tree.leaf chunk0689))
    (FKL.Tree.leaf chunk0433))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0113)
    (FKL.Tree.leaf chunk0625))
    (FKL.Tree.leaf chunk0369)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0241)
    (FKL.Tree.leaf chunk0497)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0009)
    (FKL.Tree.leaf chunk0521))
    (FKL.Tree.leaf chunk0265)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0137)
    (FKL.Tree.leaf chunk0649))
    (FKL.Tree.leaf chunk0393))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0073)
    (FKL.Tree.leaf chunk0585))
    (FKL.Tree.leaf chunk0329)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0201)
    (FKL.Tree.leaf chunk0457)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0041)
    (FKL.Tree.leaf chunk0553))
    (FKL.Tree.leaf chunk0297)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0169)
    (FKL.Tree.leaf chunk0681))
    (FKL.Tree.leaf chunk0425))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0105)
    (FKL.Tree.leaf chunk0617))
    (FKL.Tree.leaf chunk0361)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0233)
    (FKL.Tree.leaf chunk0489))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0025)
    (FKL.Tree.leaf chunk0537))
    (FKL.Tree.leaf chunk0281)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0153)
    (FKL.Tree.leaf chunk0665))
    (FKL.Tree.leaf chunk0409))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0089)
    (FKL.Tree.leaf chunk0601))
    (FKL.Tree.leaf chunk0345)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0217)
    (FKL.Tree.leaf chunk0473)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0057)
    (FKL.Tree.leaf chunk0569))
    (FKL.Tree.leaf chunk0313)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0185)
    (FKL.Tree.leaf chunk0441))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0121)
    (FKL.Tree.leaf chunk0633))
    (FKL.Tree.leaf chunk0377)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0249)
    (FKL.Tree.leaf chunk0505))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0005)
    (FKL.Tree.leaf chunk0517))
    (FKL.Tree.leaf chunk0261)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0133)
    (FKL.Tree.leaf chunk0645))
    (FKL.Tree.leaf chunk0389))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0069)
    (FKL.Tree.leaf chunk0581))
    (FKL.Tree.leaf chunk0325)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0197)
    (FKL.Tree.leaf chunk0453)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0037)
    (FKL.Tree.leaf chunk0549))
    (FKL.Tree.leaf chunk0293)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0165)
    (FKL.Tree.leaf chunk0677))
    (FKL.Tree.leaf chunk0421))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0101)
    (FKL.Tree.leaf chunk0613))
    (FKL.Tree.leaf chunk0357)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0229)
    (FKL.Tree.leaf chunk0485))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0021)
    (FKL.Tree.leaf chunk0533))
    (FKL.Tree.leaf chunk0277)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0149)
    (FKL.Tree.leaf chunk0661))
    (FKL.Tree.leaf chunk0405))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0085)
    (FKL.Tree.leaf chunk0597))
    (FKL.Tree.leaf chunk0341)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0213)
    (FKL.Tree.leaf chunk0469)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0053)
    (FKL.Tree.leaf chunk0565))
    (FKL.Tree.leaf chunk0309)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0181)
    (FKL.Tree.leaf chunk0437))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0117)
    (FKL.Tree.leaf chunk0629))
    (FKL.Tree.leaf chunk0373)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0245)
    (FKL.Tree.leaf chunk0501)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0013)
    (FKL.Tree.leaf chunk0525))
    (FKL.Tree.leaf chunk0269)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0141)
    (FKL.Tree.leaf chunk0653))
    (FKL.Tree.leaf chunk0397))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0077)
    (FKL.Tree.leaf chunk0589))
    (FKL.Tree.leaf chunk0333)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0205)
    (FKL.Tree.leaf chunk0461)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0045)
    (FKL.Tree.leaf chunk0557))
    (FKL.Tree.leaf chunk0301)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0173)
    (FKL.Tree.leaf chunk0685))
    (FKL.Tree.leaf chunk0429))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0109)
    (FKL.Tree.leaf chunk0621))
    (FKL.Tree.leaf chunk0365)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0237)
    (FKL.Tree.leaf chunk0493))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0029)
    (FKL.Tree.leaf chunk0541))
    (FKL.Tree.leaf chunk0285)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0157)
    (FKL.Tree.leaf chunk0669))
    (FKL.Tree.leaf chunk0413))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0093)
    (FKL.Tree.leaf chunk0605))
    (FKL.Tree.leaf chunk0349)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0221)
    (FKL.Tree.leaf chunk0477)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0061)
    (FKL.Tree.leaf chunk0573))
    (FKL.Tree.leaf chunk0317)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0189)
    (FKL.Tree.leaf chunk0445))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0125)
    (FKL.Tree.leaf chunk0637))
    (FKL.Tree.leaf chunk0381)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0253)
    (FKL.Tree.leaf chunk0509)))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0003)
    (FKL.Tree.leaf chunk0515))
    (FKL.Tree.leaf chunk0259)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0131)
    (FKL.Tree.leaf chunk0643))
    (FKL.Tree.leaf chunk0387))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0067)
    (FKL.Tree.leaf chunk0579))
    (FKL.Tree.leaf chunk0323)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0195)
    (FKL.Tree.leaf chunk0451)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0035)
    (FKL.Tree.leaf chunk0547))
    (FKL.Tree.leaf chunk0291)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0163)
    (FKL.Tree.leaf chunk0675))
    (FKL.Tree.leaf chunk0419))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0099)
    (FKL.Tree.leaf chunk0611))
    (FKL.Tree.leaf chunk0355)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0227)
    (FKL.Tree.leaf chunk0483))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0019)
    (FKL.Tree.leaf chunk0531))
    (FKL.Tree.leaf chunk0275)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0147)
    (FKL.Tree.leaf chunk0659))
    (FKL.Tree.leaf chunk0403))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0083)
    (FKL.Tree.leaf chunk0595))
    (FKL.Tree.leaf chunk0339)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0211)
    (FKL.Tree.leaf chunk0467)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0051)
    (FKL.Tree.leaf chunk0563))
    (FKL.Tree.leaf chunk0307)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0179)
    (FKL.Tree.leaf chunk0691))
    (FKL.Tree.leaf chunk0435))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0115)
    (FKL.Tree.leaf chunk0627))
    (FKL.Tree.leaf chunk0371)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0243)
    (FKL.Tree.leaf chunk0499)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0011)
    (FKL.Tree.leaf chunk0523))
    (FKL.Tree.leaf chunk0267)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0139)
    (FKL.Tree.leaf chunk0651))
    (FKL.Tree.leaf chunk0395))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0075)
    (FKL.Tree.leaf chunk0587))
    (FKL.Tree.leaf chunk0331)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0203)
    (FKL.Tree.leaf chunk0459)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0043)
    (FKL.Tree.leaf chunk0555))
    (FKL.Tree.leaf chunk0299)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0171)
    (FKL.Tree.leaf chunk0683))
    (FKL.Tree.leaf chunk0427))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0107)
    (FKL.Tree.leaf chunk0619))
    (FKL.Tree.leaf chunk0363)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0235)
    (FKL.Tree.leaf chunk0491))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0027)
    (FKL.Tree.leaf chunk0539))
    (FKL.Tree.leaf chunk0283)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0155)
    (FKL.Tree.leaf chunk0667))
    (FKL.Tree.leaf chunk0411))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0091)
    (FKL.Tree.leaf chunk0603))
    (FKL.Tree.leaf chunk0347)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0219)
    (FKL.Tree.leaf chunk0475)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0059)
    (FKL.Tree.leaf chunk0571))
    (FKL.Tree.leaf chunk0315)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0187)
    (FKL.Tree.leaf chunk0443))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0123)
    (FKL.Tree.leaf chunk0635))
    (FKL.Tree.leaf chunk0379)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0251)
    (FKL.Tree.leaf chunk0507))))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0007)
    (FKL.Tree.leaf chunk0519))
    (FKL.Tree.leaf chunk0263)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0135)
    (FKL.Tree.leaf chunk0647))
    (FKL.Tree.leaf chunk0391))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0071)
    (FKL.Tree.leaf chunk0583))
    (FKL.Tree.leaf chunk0327)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0199)
    (FKL.Tree.leaf chunk0455)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0039)
    (FKL.Tree.leaf chunk0551))
    (FKL.Tree.leaf chunk0295)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0167)
    (FKL.Tree.leaf chunk0679))
    (FKL.Tree.leaf chunk0423))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0103)
    (FKL.Tree.leaf chunk0615))
    (FKL.Tree.leaf chunk0359)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0231)
    (FKL.Tree.leaf chunk0487))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0023)
    (FKL.Tree.leaf chunk0535))
    (FKL.Tree.leaf chunk0279)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0151)
    (FKL.Tree.leaf chunk0663))
    (FKL.Tree.leaf chunk0407))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0087)
    (FKL.Tree.leaf chunk0599))
    (FKL.Tree.leaf chunk0343)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0215)
    (FKL.Tree.leaf chunk0471)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0055)
    (FKL.Tree.leaf chunk0567))
    (FKL.Tree.leaf chunk0311)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0183)
    (FKL.Tree.leaf chunk0439))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0119)
    (FKL.Tree.leaf chunk0631))
    (FKL.Tree.leaf chunk0375)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0247)
    (FKL.Tree.leaf chunk0503)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0015)
    (FKL.Tree.leaf chunk0527))
    (FKL.Tree.leaf chunk0271)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0143)
    (FKL.Tree.leaf chunk0655))
    (FKL.Tree.leaf chunk0399))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0079)
    (FKL.Tree.leaf chunk0591))
    (FKL.Tree.leaf chunk0335)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0207)
    (FKL.Tree.leaf chunk0463)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0047)
    (FKL.Tree.leaf chunk0559))
    (FKL.Tree.leaf chunk0303)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0175)
    (FKL.Tree.leaf chunk0687))
    (FKL.Tree.leaf chunk0431))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0111)
    (FKL.Tree.leaf chunk0623))
    (FKL.Tree.leaf chunk0367)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0239)
    (FKL.Tree.leaf chunk0495))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0031)
    (FKL.Tree.leaf chunk0543))
    (FKL.Tree.leaf chunk0287)) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0159)
    (FKL.Tree.leaf chunk0671))
    (FKL.Tree.leaf chunk0415))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0095)
    (FKL.Tree.leaf chunk0607))
    (FKL.Tree.leaf chunk0351)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0223)
    (FKL.Tree.leaf chunk0479)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0063)
    (FKL.Tree.leaf chunk0575))
    (FKL.Tree.leaf chunk0319)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0191)
    (FKL.Tree.leaf chunk0447))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk0127)
    (FKL.Tree.leaf chunk0639))
    (FKL.Tree.leaf chunk0383)) (FKL.Tree.node
    (FKL.Tree.leaf chunk0255)
    (FKL.Tree.leaf chunk0511))))))))))

/-- Dense numerator of column `c` of the split row `r` (48-bit lanes, scale `2^44`). -/
noncomputable def cell (r c : ℕ) : ℕ := Rows.cellAt (tree.get (Nat.shiftRight r 3)) 0 48 (Nat.land r 7) (Nat.add c 5)
/-- Field `f` of split row `r`: 0,1,2 parent x,y,z; 3 childTotal; 4 width. -/
noncomputable def field (r f : ℕ) : ℕ := Rows.cellAt (tree.get (Nat.shiftRight r 3)) 0 48 (Nat.land r 7) f
noncomputable def parentX (r : ℕ) : ℕ := field r 0
noncomputable def parentY (r : ℕ) : ℕ := field r 1
noncomputable def parentZ (r : ℕ) : ℕ := field r 2
noncomputable def childTotal (r : ℕ) : ℕ := field r 3
noncomputable def width (r : ℕ) : ℕ := field r 4

/-- The fast accessors agree with the original split row at index `r`. -/
def Good (r : ℕ) : Prop := ∀ h : r < 5542, parentX r = (IndexedCertificateRows.split ⟨r, h⟩).val.parent.x ∧ parentY r = (IndexedCertificateRows.split ⟨r, h⟩).val.parent.y ∧
  parentZ r = (IndexedCertificateRows.split ⟨r, h⟩).val.parent.z ∧ childTotal r = (IndexedCertificateRows.split ⟨r, h⟩).val.childTotal ∧ width r = (IndexedCertificateRows.split ⟨r, h⟩).val.row.width ∧
  ∀ c < (IndexedCertificateRows.split ⟨r, h⟩).val.row.width, cell r c = (IndexedCertificateRows.split ⟨r, h⟩).val.row.atColumn c

end FKLBridge.Split
