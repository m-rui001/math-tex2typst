from fractions import Fraction as F
import math, itertools
rows=[(0,7181518,[(0,5,-849651),(0,7,-2958744),(1,5,751659),(1,6,-43084),(1,7,-146216),(3,2,720949),(3,5,-127514),(4,2,222437),(4,3,-262822),(5,3,-117700),(6,1,-55024),(7,1,-166049)]),
(1,-112991,[(0,5,142772),(0,6,-142342),(0,7,527055),(0,8,50742),(1,6,197917),(1,8,-18343),(2,4,5764),(2,7,-21183),(3,2,75832),(3,5,-6115),(4,5,2660),(5,3,-9455),(6,1,-27091),(6,3,-3494),(7,1,479),(7,2,-15331)]),
(1,-4247311,[(0,5,-12207250),(0,6,-14064191),(0,7,-14063663),(0,8,-15662679),(1,6,483831),(1,8,3987214),(2,4,-814558),(2,7,888887),(3,2,966462),(3,5,145978),(4,5,-171722),(5,3,34350),(6,1,389319),(6,3,97603),(7,1,412447),(7,2,-53786)]),
(2,3438746,[(1,4,6689266),(1,5,6620205),(1,6,6625065),(1,7,4969272),(1,8,4878238),(2,7,-1387380),(3,6,-586188),(3,7,344087),(4,2,-1120634),(4,5,-318530),(4,6,559169),(5,5,157455),(6,1,1207103),(6,3,211617),(6,4,33240),(7,1,577001),(7,3,-142578)]),
(5,-98645,[(0,5,-2719776),(0,8,-8519913),(1,4,-949523),(1,7,-1952105),(1,8,-1562606),(2,8,-8919966),(3,2,248826),(3,5,-1017623),(3,7,3656005),(3,8,-2081871),(4,2,-33163),(4,3,-305905),(4,6,35677),(4,7,-1320749),(4,8,-1040378),(5,3,502094),(5,5,1060633),(5,8,-998003),(6,1,-113617),(6,3,184919),(6,4,209239),(6,5,-68198),(6,7,-266297),(7,2,-606696),(7,3,-563620),(7,4,437345),(7,6,-432189)]),
(5,-3160276,[(0,5,-1698129),(0,8,10575875),(1,4,-252576),(1,7,-8002616),(1,8,22592844),(2,8,7370640),(3,2,289294),(3,5,1400647),(3,7,1987740),(3,8,4030699),(4,2,-1731401),(4,3,-1034062),(4,6,-1106371),(4,7,-1257051),(4,8,1461735),(5,3,1408149),(5,5,1136847),(5,8,1878501),(6,1,-2838516),(6,3,-734099),(6,4,1062416),(6,5,11745),(6,7,611312),(7,2,-480776),(7,3,20459),(7,4,316925),(7,6,37092)]),
(7,1441784,[(0,7,3441286),(0,8,-6097155),(3,7,-1002399),(4,7,-251321),(5,8,1143225),(6,6,-17397),(7,1,-1007464),(7,3,-662286),(7,6,-344621),(7,8,-1115284)])]
P=10**7
EPS=F(3,10**6)
def Uf(c,z,T,p):
    if z<0 or p<0: return 0
    if z>T or p>T: return 0
    s=0
    for h in range(max(0,p+z-T),min(p,z)+1):
        s+= (-1)**(z-h)*math.comb(z,h)*math.comb(T-z,p-h)*c**(p-h)
    return s
def VV(r,D,T,p,j,k):
    if r>j+k: return 0
    return Uf(1,r,j+k,j)*Uf(1,D-r,T-r,p)
def pow2int(n):
    return F(2)**n if n>=0 else F(1,2**(-n))
def computeY(D):
    R=[r for r in range(1,D+1) if r%2==1]
    idx={r:i for i,r in enumerate(R)}
    Y=[[F(0) for _ in R] for _ in R]
    for (t,ell,ents) in rows:
        for (p,j,a) in ents:
            i=p+j-t
            if not (0<=i<=8): continue
            for (q,l,b) in ents:
                k=q+l-t
                if not (0<=k<=8): continue
                T=p+j+k
                if T<D: continue
                for r in R:
                    for s in R:
                        vr=VV(r,D,T,p,j,k); vs=VV(s,D,T,q,l,i)
                        if vr==0 or vs==0: continue
                        expn=1-2*T+p+q-t+(r+s)//2
                        assert (r+s)%2==0
                        term=a*b*vr*vs*pow2int(expn)*F(math.factorial(i)*math.factorial(k)*math.factorial(t),math.factorial(T-D))
                        Y[idx[r]][idx[s]]-=F(term,10**14)
    return R,Y
def ur(D,r): return F(1, math.factorial(r)*math.factorial(D-r))
def computeZ(D):
    R=[r for r in range(1,D+1) if r%2==1]
    idx={r:i for i,r in enumerate(R)}
    Z=[[F(0) for _ in R] for _ in R]
    quads=[A for A in itertools.combinations(range(0,30),4) if sum(A)==D+1]
    for A in quads:
        fA=1
        for b in A: fA*=math.factorial(b)
        AS=list(A)
        Ls={}
        for r in R:
            tot=F(0)
            for x,y in itertools.combinations(AS,2):
                rest=[z for z in AS if z!=x and z!=y]
                j,k=rest[0],rest[1]
                if not (j<k): j,k=k,j
                perm=[x,y,j,k]
                srt=sorted(perm)
                # sign of sorting perm into increasing order = sign of permutation
                inv=0
                for ii in range(4):
                    for jj in range(ii+1,4):
                        if perm[ii]>perm[jj]: inv+=1
                sigma=(-1)**inv
                p=x+y-1
                v=VV(r,D,D,p,j,k)
                if v==0: continue
                tot+= sigma*(x-y)*math.factorial(p)*math.factorial(j)*math.factorial(k)*v
                # note: also the swapped (y,x) ordered pair? sum is over x<y in A
            e2=(1-2*D+r)//2
            assert (1-2*D+r)%2==0
            Ls[r]=pow2int(e2)*tot
        for r in R:
            for s in R:
                Z[idx[r]][idx[s]]+=Ls[r]*Ls[s]/fA
    return R,Z
def leverrier(M):
    d=len(M)
    J=[[F(1) if i==j else F(0) for j in range(d)] for i in range(d)]
    cs=[]
    MM=[[M[ii][jj] for jj in range(d)] for ii in range(d)]  # recurrence as printed: X=MJ
    for b in range(1,d+1):
        X=[[sum(MM[i][k]*J[k][j] for k in range(d)) for j in range(d)] for i in range(d)]
        tr=sum(X[i][i] for i in range(d))
        c=F(tr,b)
        cs.append(c)
        J=[[ (c if i==j else F(0)) - X[i][j] for j in range(d)] for i in range(d)]
    return cs
paper={1:'0',2:'0',3:'00',4:'00',5:'+00',6:'000',7:'+000',8:'+000',9:'++000',10:'+0000',
 11:'+++000',12:'++0000',13:'++++000',14:'+++0000',15:'+++++000',16:'++++0000',
 17:'++++++000',18:'+++++0000',19:'+++++++000',20:'++++++0000',21:'++++++++000',
 22:'+++++++0000',23:'+++++++++000'}
for D in range(1,24):
    R,Y=computeY(D)
    _,Z=computeZ(D)
    d=len(R)
    B=[[F(0) for _ in R] for _ in R]
    for a in range(d):
        r=R[a]
        B[a][a]=( (2 if r==1 else 0)+EPS)*ur(D,r)
    # subtract D_u Y D_u
    for a in range(d):
        for b in range(d):
            B[a][b]-= ur(D,R[a])*Y[a][b]*ur(D,R[b])
    # M = Z B Z
    ZB=[[sum(Z[a][k]*B[k][b] for k in range(d)) for b in range(d)] for a in range(d)]
    M=[[sum(ZB[a][k]*Z[k][b] for k in range(d)) for b in range(d)] for a in range(d)]
    cs=leverrier(M)
    sign=''.join('+' if c>0 else ('0' if c==0 else '-') for c in cs)
    print(D, sign, paper[D], 'OK' if sign==paper[D] else '*** MISMATCH', 'd=',d)
