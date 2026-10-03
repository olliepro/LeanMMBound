module

public import FKLCert.Window
public import FKLCoarseData.Cert40Chunks00
public import FKLCoarseData.Cert40Chunks01

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.Cert40

def S : Nat := 197
def T : Nat := 132
def KW : Nat := 201
def MW : Nat := 130
def tree : FKL.Tree := (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0000) (FKL.Tree.leaf chunk0032)) (FKL.Tree.node (FKL.Tree.leaf chunk0016) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0008) (FKL.Tree.leaf chunk0040)) (FKL.Tree.node (FKL.Tree.leaf chunk0024) (FKL.Tree.leaf 0)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0004) (FKL.Tree.leaf chunk0036)) (FKL.Tree.node (FKL.Tree.leaf chunk0020) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0012) (FKL.Tree.leaf chunk0044)) (FKL.Tree.node (FKL.Tree.leaf chunk0028) (FKL.Tree.leaf 0))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0002) (FKL.Tree.leaf chunk0034)) (FKL.Tree.node (FKL.Tree.leaf chunk0018) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0010) (FKL.Tree.leaf chunk0042)) (FKL.Tree.node (FKL.Tree.leaf chunk0026) (FKL.Tree.leaf 0)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0006) (FKL.Tree.leaf chunk0038)) (FKL.Tree.node (FKL.Tree.leaf chunk0022) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0014) (FKL.Tree.leaf chunk0046)) (FKL.Tree.node (FKL.Tree.leaf chunk0030) (FKL.Tree.leaf 0)))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0001) (FKL.Tree.leaf chunk0033)) (FKL.Tree.node (FKL.Tree.leaf chunk0017) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0009) (FKL.Tree.leaf chunk0041)) (FKL.Tree.node (FKL.Tree.leaf chunk0025) (FKL.Tree.leaf 0)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0005) (FKL.Tree.leaf chunk0037)) (FKL.Tree.node (FKL.Tree.leaf chunk0021) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0013) (FKL.Tree.leaf chunk0045)) (FKL.Tree.node (FKL.Tree.leaf chunk0029) (FKL.Tree.leaf 0))))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0003) (FKL.Tree.leaf chunk0035)) (FKL.Tree.node (FKL.Tree.leaf chunk0019) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0011) (FKL.Tree.leaf chunk0043)) (FKL.Tree.node (FKL.Tree.leaf chunk0027) (FKL.Tree.leaf 0)))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0007) (FKL.Tree.leaf chunk0039)) (FKL.Tree.node (FKL.Tree.leaf chunk0023) (FKL.Tree.leaf 0))) (FKL.Tree.node (FKL.Tree.node (FKL.Tree.leaf chunk0015) (FKL.Tree.leaf chunk0047)) (FKL.Tree.node (FKL.Tree.leaf chunk0031) (FKL.Tree.leaf 0)))))))

end MatrixBounds.Numeric.FKLCoarseData.Cert40
