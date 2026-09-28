"""Standalone outward interval verifier for the proposed mixed-level bound.

Dependencies: Python standard library, NumPy, interval_arithmetic.py.
The file holds exact dyadic probabilities, fixed rational positive Gibbs
potentials, and indexing metadata that this verifier independently checks.
It does not invoke JAX, SciPy, softmax, an optimizer, or libm log/exp.

This verifies the numerical inequality CONDITIONAL ON the construction in
docs/technical-overview.md and formalized in src/. It is not itself a formal verification of that proof.
"""
import argparse,itertools,json,time,hashlib
from pathlib import Path
import numpy as np
from interval_arithmetic import I,H,PH,zeros,zeros_like,stack,einsum,log2
PERMS=list(itertools.permutations(range(3)))

def verify(path):
    start=time.monotonic();d=dict(np.load(path,allow_pickle=False));checks={}
    for name in ['rootA','rootAlpha','A3','alpha3','alpha4','leafzero','zero3','zero4','terminal_roles','alloc4','alloc3']:
        v=d[name];assert np.isfinite(v).all() and (v>=0).all() and (v<=1).all(),name
        sc=np.rint(v*2**44).astype(np.int64)
        assert np.array_equal(sc.astype(float)/2**44,v),name
        assert (sc.sum(-1)==2**44).all(),name
    assert np.isfinite(d['mu']).all() and (d['mu']>=0).all() and (d['mu']<=.5).all()
    assert np.array_equal(np.rint(d['mu']*2**44)/2**44,d['mu'])
    for k in ['U3','U4','UR']:assert np.isfinite(d[k]).all() and (d[k]>=2.**-200).all() and (d[k]<=1).all()
    assert np.isin(d['terminal_policy'],[0,1]).all()
    assert np.array_equal(d['rootA'],[1.]) and np.array_equal(d['roots'],[1])
    S={l:np.array([(i,j,2**l-i-j) for i in range(2**l+1) for j in range(2**l+1-i)]) for l in [2,3,4]}
    idx={l:{tuple(s):i for i,s in enumerate(S[l])} for l in S}
    pos={l:np.flatnonzero((S[l]>0).all(1)) for l in S};zero={l:np.flatnonzero((S[l]==0).any(1)) for l in S}
    for l in S:assert np.array_equal(S[l],d['S'+str(l)])
    n4=len(pos[4]);assert np.array_equal(d['i4'],np.arange(n4));assert np.array_equal(d['g4'],np.zeros(n4,int))
    p3=[];z3=[]
    for n,u in enumerate(pos[4]):
        for v,sh in enumerate(S[3]):
            if tuple(S[4][u]-sh) in idx[3]:
                if (sh>0).all():p3.append((n,v,int(np.flatnonzero(pos[3]==v)[0])))
                else:z3.append((n,v,int(np.flatnonzero(zero[3]==v)[0])))
    p3=np.array(p3);z3=np.array(z3);assert np.array_equal(p3,d['nodes_pos3']);assert np.array_equal(z3,d['nodes_zero3']);N=len(p3)
    meta={1:(np.array([[0],[1],[2]]),np.arange(3))}
    for l in [2,3,4]:
        words=np.array(list(itertools.product(range(3),repeat=2**(l-1))),dtype=np.int16);old=meta[l-1][1];nd=old.max()+1
        lookup={p:i for i,p in enumerate(itertools.combinations_with_replacement(range(nd),2))}
        mp=np.array([lookup[tuple(sorted((int(u),int(v))))] for u in old for v in old]);meta[l]=(words,mp)
        assert np.array_equal(mp,d['omap'+str(l)]);assert np.array_equal(np.bincount(mp),d['size'+str(l)])
    def decode(mass,l,total):
        words,mp=meta[l];size=np.bincount(mp);osum=np.zeros(len(size),int);osum[mp]=words.sum(1)
        assert np.all(np.asarray(mass)[osum!=np.asarray(total)[...,None]]==0) if np.asarray(mass).ndim==1 else np.all(np.where(osum==np.asarray(total)[...,None],0,mass)==0)
        return (I(mass)/size)[...,mp]
    def check_beta(name,b,sh,l):
        ss=b.sum(-1);assert ((ss.lo<=1)&(ss.hi>=1)).all(),name
        mask=meta[l][0].sum(1)!=np.asarray(sh)[...,None]
        assert np.all(np.where(mask,b.lo,0)==0) and np.all(np.where(mask,b.hi,0)==0),name
        checks[name]={'maximum_normalization_enclosure_width':float(np.max(ss.hi-ss.lo)),'off_support_mass':0}
    def hm_bound(alpha,U,sh):
        u=I(U);t=u[:,0,sh[:,0]]*u[:,1,sh[:,1]]*u[:,2,sh[:,2]]
        lu=log2(u);lt=lu[:,0,sh[:,0]]+lu[:,1,sh[:,1]]+lu[:,2,sh[:,2]]
        return log2(t.sum(-1))-(alpha*lt).sum(-1)
    K2,K3,K4=map(lambda l:len(S[l]),[2,3,4]);LQ=log2(I(5.));C=8*log2(I(7.))
    b2=zeros((N,K2,6,3,9));e2=zeros((N,K2,6,3));m2=zeros_like(e2)
    for iz,u in enumerate(zero[2]):
        sh=S[2][u];z=int(np.flatnonzero(sh==0)[0]);v=int(np.flatnonzero(sh>0)[0]);w=3-z-v
        pr=decode(d['leafzero'][:,iz],2,sh[v]);b2[:,u,:,z,0]=1;b2[:,u,:,v]=pr;b2[:,u,:,w]=pr[...,::-1]
        m2[:,u,:,z]=H(pr)+(pr*(meta[2][0]==1).sum(1)).sum(-1)*LQ
    mu=I(d['mu'])
    for ip,u in enumerate(pos[2]):
        for w in range(3):
            if S[2][u,w]==1:
                b2[:,u,:,w,1]=.5;b2[:,u,:,w,3]=.5;e2[:,u,:,w]=1;m2[:,u,:,w]=(1-2*mu[:,ip])*LQ
            else:
                b2[:,u,:,w,2]=mu[:,ip];b2[:,u,:,w,6]=mu[:,ip];b2[:,u,:,w,4]=1-2*mu[:,ip]
                e2[:,u,:,w]=H(b2[:,u,:,w]);m2[:,u,:,w]=2*mu[:,ip]*LQ
    check_beta('leaf2',b2,S[2][None,:,None,:],2)
    print('leaf distributions checked',flush=True)
    A3=I(d['A3']);a3=I(d['alpha3']);w3=2*a3;pr3=zeros((N,6,3,81));hm3=zeros((N,6))
    for ti in np.unique(p3[:,2]):
        nodes=np.flatnonzero(p3[:,2]==ti);sh=S[3][pos[3][ti]];valid=np.array([tuple(sh-u) in idx[2] for u in S[2]]);ix=np.flatnonzero(valid);cp=np.array([idx[2][tuple(sh-S[2][u])] for u in ix])
        assert np.all(d['alpha3'][nodes][:,:,~valid]==0);assert np.array_equal(d['alpha3'][nodes][:,:,ix],d['alpha3'][nodes][:,:,cp])
        alpha=a3[nodes][:,:,ix];hm3[nodes]=hm_bound(alpha.reshape(-1,len(ix)),d['U3'][nodes].reshape(-1,3,5),S[2][ix]).reshape(len(nodes),6)
        for uu,vv,u in zip(ix,cp,range(len(ix))):
            left=b2[nodes,uu];right=b2[nodes,vv]
            pr3[nodes]=pr3[nodes]+alpha[:,:,u,None,None]*(left[...,None]*right[...,None,:]).reshape(len(nodes),6,3,81)
    check_beta('parent3',pr3,S[3][p3[:,1]][:,None,:],3)
    leafE=einsum('nr,nru,nurw->nw',A3,w3,e2);leafM=einsum('nr,nru,nurw->nw',A3,w3,m2)
    def retention(alpha,children,parent,shapes,hm,alloc,weights):
        out=zeros((len(alpha),3));last=int(shapes.max());hc=H(children);hp=H(parent);ha=H(alpha)
        for rr,perm in enumerate(PERMS):
            # Zero-allocation rows are skipped as an exact optimization only.
            rows=np.flatnonzero(np.asarray(alloc)[:,rr]>0)
            if not len(rows):continue
            aa=alpha[rows];ww=weights[rows];ch=children[rows];cap=zeros((len(rows),3))
            marg=stack([aa[:,shapes[:,perm[0]]==v].sum(-1) for v in range(last+1)],axis=-1);cap[:,0]=H(marg)-hm[rows]+ha[rows]
            for role,axis in [(1,perm[1]),(2,perm[2])]:
                special=shapes[:,perm[2]]==0 if role==1 else ((shapes[:,perm[0]]==0)|(shapes[:,perm[1]]==0))
                eta=(ww[:,special]*hc[rows][:,special,axis]).sum(-1)
                for val in range(last+1):
                    ix=(shapes[:,axis]==val)&(~special)
                    if ix.any():eta=eta+PH(einsum('nu,nud->nd',ww[:,ix],ch[:,ix,axis]))
                cap[:,role]=hp[rows,axis]-eta
            out[rows]=out[rows]+I(np.asarray(alloc)[rows,rr,None])*cap
        return out
    ret3=retention(a3.reshape(-1,K2),b2.transpose(0,2,1,3,4).reshape(-1,K2,3,9),pr3.reshape(-1,3,81),S[2],hm3.ravel(),d['alloc3'].reshape(-1,6),w3.reshape(-1,K2)).reshape(N,6,3)
    print('level-three retention checked',flush=True)
    b3=zeros((n4,K3,3,81));b3[p3[:,0],p3[:,1]]=einsum('nr,nrwd->nwd',A3,pr3);mz3=zeros((len(z3),3))
    for zi in np.unique(z3[:,2]):
        nodes=np.flatnonzero(z3[:,2]==zi);sh=S[3][zero[3][zi]];z=int(np.flatnonzero(sh==0)[0]);v=int(np.flatnonzero(sh>0)[0]);w=3-z-v
        pr=decode(d['zero3'][nodes],3,sh[v]);parent,child=z3[nodes,:2].T;b3[parent,child,z,0]=1;b3[parent,child,v]=pr;b3[parent,child,w]=pr[:,::-1]
        mz3[nodes,z]=H(pr)+(pr*(meta[3][0]==1).sum(1)).sum(-1)*LQ
    adm=np.zeros((n4,K3),bool);adm[p3[:,0],p3[:,1]]=True;adm[z3[:,0],z3[:,1]]=True
    check_beta('child3',b3[adm],np.broadcast_to(S[3],(n4,K3,3))[adm],3)
    a4=I(d['alpha4']);w4=2*a4;b4=zeros((n4,3,6561));hm4=zeros(n4)
    for ti in range(n4):
        sh=S[4][pos[4][ti]];valid=np.array([tuple(sh-u) in idx[3] for u in S[3]]);ix=np.flatnonzero(valid);cp=np.array([idx[3][tuple(sh-S[3][u])] for u in ix]);assert np.array_equal(adm[ti],valid)
        assert np.all(d['alpha4'][ti,~valid]==0);assert np.array_equal(d['alpha4'][ti,ix],d['alpha4'][ti,cp])
        alpha=a4[ti:ti+1,ix];hm4[ti:ti+1]=hm_bound(alpha,d['U4'][ti:ti+1],S[3][ix])
        for uu,vv,u in zip(ix,cp,range(len(ix))):
            b4[ti]=b4[ti]+alpha[0,u]*(b3[ti,uu,...,None]*b3[ti,vv,:,None,:]).reshape(3,6561)
    check_beta('parent4',b4,S[4][pos[4]],4)
    ret4=retention(a4,b3,b4,S[3],hm4,d['alloc4'],w4)
    print('level-four retention checked',flush=True)
    A=I(d['rootA']);ar=I(d['rootAlpha']);br=zeros((1,K4,3,6561));br[0,pos[4]]=b4;mz4=zeros((1,len(zero[4]),3))
    for zi,u in enumerate(zero[4]):
        sh=S[4][u];z=int(np.flatnonzero(sh==0)[0]);v=int(np.flatnonzero(sh>0)[0]);w=3-z-v
        pr=decode(d['zero4'][:,zi],4,sh[v]);br[:,u,z,0]=1;br[:,u,v]=pr;br[:,u,w]=pr[:,::-1];mz4[:,zi,z]=H(pr)+(pr*(meta[4][0]==1).sum(1)).sum(-1)*LQ
    check_beta('root4',br,S[4][None,:,:],4)
    hm=hm_bound(ar,d['UR'],S[4]);R=zeros((1,3));alpha=ar[0];perm=PERMS[1]
    R[0,0]=H(stack([alpha[S[4][:,perm[0]]==v].sum() for v in range(17)]))-hm[0]+H(alpha)
    for role,axis in [(1,perm[1]),(2,perm[2])]:
        special=S[4][:,perm[2]]==0 if role==1 else ((S[4][:,perm[0]]==0)|(S[4][:,perm[1]]==0));eta=(alpha[special]*H(br[0,special,axis])).sum()
        for val in range(17):
            ix=(S[4][:,axis]==val)&(~special)
            if ix.any():eta=eta+PH(einsum('u,ud->d',alpha[ix],br[0,ix,axis]))
        R[0,role]=H(einsum('u,ud->d',alpha,br[0,:,axis]))-eta
    mass4=ar[0,pos[4]];massall3=mass4[:,None]*w4;mass3=massall3[p3[:,0],p3[:,1]];masszero3=massall3[z3[:,0],z3[:,1]]
    E4=einsum('n,nw->w',mass4,ret4);E3=einsum('n,nr,nrw->w',mass3,A3,ret3);E2=einsum('n,nw->w',mass3,leafE)
    M=einsum('g,gu,guw->w',A,ar[:,zero[4]],mz4)+einsum('n,nw->w',masszero3,mz3)+einsum('n,nw->w',mass3,leafM)
    pm=(mass3[:,None,None]*A3[:,:,None]*w3[:,:,pos[2]]).transpose(0,2,1)
    hh=H(stack([mu,mu,1-2*mu],axis=-1));roles=I(d['terminal_roles']);policy=d['terminal_policy'];terminal=zeros(3)
    for t in range(3):terminal[t]=(pm*(1+(hh-1)*roles[policy,t])).sum()
    total=E4+E3+terminal;EG=R[0].min();Eall=EG+total.min();MM=M.mean();candidate=(C-Eall)/MM
    # Decimal targets are exact rationals, not approximated float literals.
    target=I(2371177)/1000000;proposed=I(23710449)/10000000
    residual=Eall+target*MM-C;new_residual=Eall+proposed*MM-C
    # Explicit finite pipeline: two warm-up rounds, K-2 steady rounds,
    # and two drain rounds. No passage K -> infinity is needed for this bound.
    K=1000000
    g4=E4.min();g43=(E4+E3).min();g32=(E3+terminal).min();g2=terminal.min();gall=total.min()
    boundary_loss=2*gall-g4-g43-g32-g2
    finite_retention=EG+gall-boundary_loss/K
    finite_candidate=(C-finite_retention)/MM
    finite_residual=finite_retention+proposed*MM-C
    assert min(float(g4.lo),float(g43.lo),float(g32.lo),float(g2.lo),float(gall.lo))>0
    report={'certificate_file':Path(path).name,'certificate_sha256':hashlib.sha256(Path(path).read_bytes()).hexdigest(),
      'candidate_interval':candidate.report(),'C':C.report(),'E':Eall.report(),'M':M.report(),'root_retention':R.report(),'retention4':E4.report(),'retention3':E3.report(),'terminal_retention':terminal.report(),'combined_retention':total.report(),
      'target_exact_rational':'2371177/1000000','target_residual':residual.report(),'proposed_exact_rational':'23710449/10000000','proposed_residual':new_residual.report(),
      'finite_pipeline':{'batches':K,'boundary_loss':boundary_loss.report(),'candidate_interval':finite_candidate.report(),'proposed_residual':finite_residual.report(),'conditional_inequality_verified':bool(finite_residual.lo>0)},
      'conditional_inequality_verified':bool(residual.lo>0),'conditional_proposed_inequality_verified':bool(new_residual.lo>0),'exact_simplex_support_and_symmetry_checks':True,'normalization_enclosures':checks,'seconds':time.monotonic()-start,
      'mathematical_composition_lemma_formally_verified':False,'interval_method':'IEEE-754 outward operations; conservative reductions; rational-series logarithms; rational Gibbs upper bounds'}
    return report
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--certificate',default='pipeline_certificate.npz');p.add_argument('--output',default='pipeline_interval_certificate_report.json');a=p.parse_args();r=verify(a.certificate);Path(a.output).write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2));assert r['finite_pipeline']['conditional_inequality_verified']
