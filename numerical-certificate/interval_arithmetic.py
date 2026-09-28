"""Outward binary64 interval operations used by verify_pipeline_certificate.py.

Basic operations are enclosed by nextafter. Reductions use a conservative
8*n*eps absolute roundoff bound. Assumptions: IEEE-754 binary64 round-to-nearest,
no flush-to-zero, and NumPy's sum performs at most n additions per n terms.
Transcendentals are NOT delegated to libm: log2 uses a rational atanh series
with a rigorously bounded positive tail. Constants ln(2) and e use Fraction.
This is an executable arithmetic certificate, not a formal proof assistant.
"""
from fractions import Fraction
import math
import numpy as np
EPS=np.finfo(np.float64).eps
TINY=np.nextafter(0.,1.)
def down(x): return np.nextafter(x,-np.inf)
def up(x): return np.nextafter(x,np.inf)

class I:
    __array_priority__=1000
    def __init__(self,lo,hi=None):
        if isinstance(lo,I): self.lo=lo.lo;self.hi=lo.hi;return
        self.lo=np.asarray(lo,dtype=np.float64);self.hi=np.asarray(lo if hi is None else hi,dtype=np.float64)
        if np.any(self.lo>self.hi):raise ValueError('reversed interval')
    @property
    def shape(self):return self.lo.shape
    @property
    def ndim(self):return self.lo.ndim
    def __len__(self):return len(self.lo)
    def __getitem__(self,key):return I(self.lo[key],self.hi[key])
    def __setitem__(self,key,val):
        v=I(val);self.lo[key]=v.lo;self.hi[key]=v.hi
    def __add__(self,b):
        b=I(b);lo=down(self.lo+b.lo);hi=up(self.hi+b.hi)
        z=(self.lo==0)&(self.hi==0)&(b.lo==0)&(b.hi==0)
        lo=np.where((self.lo>=0)&(b.lo>=0),np.maximum(lo,0),lo)
        return I(np.where(z,0,lo),np.where(z,0,hi))
    __radd__=__add__
    def __neg__(self):return I(-self.hi,-self.lo)
    def __sub__(self,b):return self+-I(b)
    def __rsub__(self,b):return I(b)+-self
    def __mul__(self,b):
        b=I(b)
        a1=self.lo*b.lo;a2=self.lo*b.hi;a3=self.hi*b.lo;a4=self.hi*b.hi
        lo=down(np.minimum(np.minimum(a1,a2),np.minimum(a3,a4)))
        hi=up(np.maximum(np.maximum(a1,a2),np.maximum(a3,a4)))
        nonneg=((self.lo>=0)&(b.lo>=0))|((self.hi<=0)&(b.hi<=0))
        z=((self.lo==0)&(self.hi==0))|((b.lo==0)&(b.hi==0))
        return I(np.where(z,0,np.where(nonneg,np.maximum(lo,0),lo)),np.where(z,0,hi))
    __rmul__=__mul__
    def __truediv__(self,b):
        b=I(b)
        if np.any((b.lo<=0)&(b.hi>=0)):raise ZeroDivisionError('interval includes zero')
        return self*I(down(1/b.hi),up(1/b.lo))
    def __rtruediv__(self,b):return I(b)/self
    def reshape(self,*shape):return I(self.lo.reshape(*shape),self.hi.reshape(*shape))
    def transpose(self,*axes):return I(self.lo.transpose(*axes),self.hi.transpose(*axes))
    @property
    def T(self):return self.transpose()
    def ravel(self):return self.reshape(-1)
    def copy(self):return I(self.lo.copy(),self.hi.copy())
    def sum(self,axis=None,keepdims=False):
        if axis is None:n=self.lo.size
        else:
            axes=(axis,) if isinstance(axis,int) else axis
            n=math.prod(self.lo.shape[a] for a in axes)
        if n==0:return I(np.sum(self.lo,axis=axis,keepdims=keepdims))
        if n*EPS>.001:raise ValueError('reduction too long for bound')
        sl=np.sum(self.lo,axis=axis,keepdims=keepdims);sh=np.sum(self.hi,axis=axis,keepdims=keepdims)
        al=np.sum(np.abs(self.lo),axis=axis,keepdims=keepdims);ah=np.sum(np.abs(self.hi),axis=axis,keepdims=keepdims)
        el=up((8*n*EPS)*al+4*n*TINY);eh=up((8*n*EPS)*ah+4*n*TINY)
        lo=down(sl-el);hi=up(sh+eh)
        nonneg=np.all(self.lo>=0,axis=axis,keepdims=keepdims)
        zero=(al==0)&(ah==0)
        return I(np.where(zero,0,np.where(nonneg,np.maximum(lo,0),lo)),np.where(zero,0,hi))
    def mean(self,axis=None):
        n=self.lo.size if axis is None else self.lo.shape[axis]
        return self.sum(axis)/n
    def min(self,axis=None):return I(np.min(self.lo,axis),np.min(self.hi,axis))
    def max(self,axis=None):return I(np.max(self.lo,axis),np.max(self.hi,axis))
    def report(self):return {'lo':self.lo.tolist(),'hi':self.hi.tolist()}

def zeros(shape):return I(np.zeros(shape),np.zeros(shape))
def zeros_like(a):return zeros(a.shape)
def stack(args,axis=0):
    a=[I(x) for x in args];return I(np.stack([x.lo for x in a],axis),np.stack([x.hi for x in a],axis))
def einsum(spec,*args):
    """Explicit interval broadcast products then conservative reductions."""
    lhs,out=spec.split('->');labs=lhs.split(',')
    if any(len(set(s))!=len(s) for s in labs):raise ValueError('repeated input label')
    all_labels=list(out)
    for s in labs:
        for c in s:
            if c not in all_labels:all_labels.append(c)
    val=I(1.)
    for s,x in zip(labs,args):
        x=I(x);order=[s.index(c) for c in all_labels if c in s];xx=x.transpose(*order) if order else x
        shape=[x.shape[s.index(c)] if c in s else 1 for c in all_labels]
        val=val*xx.reshape(shape)
    if len(all_labels)>len(out):val=val.sum(tuple(range(len(out),len(all_labels))))
    return val

def fraction_interval(f):
    x=float(f);return I(down(x),up(x))
LN2_L=sum((Fraction(2, (2*k+1)*3**(2*k+1)) for k in range(41)),Fraction(0))
LN2_T=Fraction(2,83*3**83)/(1-Fraction(1,9))
LN2=I(fraction_interval(LN2_L).lo,fraction_interval(LN2_L+LN2_T).hi)
E_L=sum((Fraction(1,math.factorial(k)) for k in range(33)),Fraction(0))
E_T=Fraction(3,math.factorial(33))
E=I(fraction_interval(E_L).lo,fraction_interval(E_L+E_T).hi)
INV_E=1/E;FPEAK=1/(E*LN2)

def log2_point(x):
    """Enclose log2 of each EXACT positive binary64 number in x."""
    x=np.asarray(x,dtype=float)
    if np.any(x<=0):raise ValueError('log domain')
    m,e=np.frexp(x);m=m*2;e=e-1  # exact scaling, including subnormals
    y=(I(m)-1)/(I(m)+1);z=y*y
    v=I(1.)/61
    for k in range(29,-1,-1):v=1/I(2*k+1)+z*v
    # Sum k=0,...,30. R <= 2*y^63/(63*(1-y^2)) < 2^-96.
    lnm=2*y*v+I(0.,2.**-96)
    ans=I(e)+lnm/LN2
    exact=(m==1)
    return I(np.where(exact,e,ans.lo),np.where(exact,e,ans.hi))
def log2(x):
    x=I(x);a=log2_point(x.lo);b=log2_point(x.hi);return I(a.lo,b.hi)
def f_point(x):
    x=np.asarray(x,dtype=float);ans=zeros(x.shape);ix=x>0
    if np.any(ix):ans[ix]=-I(x[ix])*log2_point(x[ix])
    return ans
def entropy_terms(x):
    x=I(x)
    if np.any(x.hi<0):raise ValueError('negative entropy mass')
    l=np.maximum(x.lo,0);h=x.hi
    a=f_point(l);b=f_point(h)
    lo=np.minimum(a.lo,b.lo);hi=np.maximum(a.hi,b.hi)
    crosses=(l<=INV_E.hi)&(h>=INV_E.lo)
    return I(lo,np.where(crosses,np.maximum(hi,FPEAK.hi),hi))
def H(x):return entropy_terms(x).sum(-1)
def PH(x):return H(x)-entropy_terms(I(x).sum(-1))

if __name__=='__main__':
    import mpmath as mp,json
    mp.mp.dps=100;rng=np.random.default_rng(418)
    samples=np.r_[np.ldexp(rng.uniform(.5,1,300),rng.integers(-1050,1010,300)),[1.,2.,.5,np.nextafter(0.,1.),np.nextafter(1.,0.),np.nextafter(1.,2.)]]
    z=log2_point(samples)
    for x,l,h in zip(samples,z.lo,z.hi):
        v=mp.log(mp.mpf(float(x)),2);assert mp.mpf(float(l))<=v<=mp.mpf(float(h)),(x,l,h,v)
    p=rng.dirichlet(np.ones(150)*.1,size=20);hh=H(I(p))
    for row,l,h in zip(p,hh.lo,hh.hi):
        v=-sum(mp.mpf(float(t))*mp.log(mp.mpf(float(t)),2) for t in row if t)
        assert mp.mpf(float(l))<=v<=mp.mpf(float(h))
    print(json.dumps({'log_test_count':len(samples),'entropy_test_count':len(p),'passed':True,'ln2':LN2.report(),'inv_e':INV_E.report(),'max_log_interval_width':float(np.max(z.hi-z.lo))},indent=2))
