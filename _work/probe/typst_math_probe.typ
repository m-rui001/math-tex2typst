#set page(width: 20cm, height: auto, margin: 1cm)
#set math.equation(numbering: none)

Test align with raw ampersands:

$ a &= b\ c &= d $

Test aligned():

$ aligned($a$ &= $b$, $c$ &= $d$) $

Test setminus:

$ bb(R)^n \ { 0 } $

Test backslash-setminus-variant:

$ bb(R)^n setminus { 0 } $

Test substack:

$ sum_(i in I) substack(i in I \ j in J) $

Test underbrace with substack:

$ underbrace(c_d, substack(i in I \ j in J)) $

Test text/roman:

$ op{tr}(A) + "if" x + math.rm(wt) $

Test spacing:

$ a negmedspace b thinspace c medspace d quad e qquad f $

Test norm bars:

$ left \\| u \\| _right|_(L^2) $

Test abs:

$ abs(a+b) $

Test floor ceiling:

$ floor(x) ceil(y) lr(( a b )) $

Test bigg:

$ lr(( frac(1,2) rr) ) $

Test over/le:

$ a lt.eq b gt.eq c eq.not d $

Test greek variants:

$ epsilon.alt phi.alt.var theta.alt varphi.alt emptyset $

Test arrows:

$ a arrow.r.double.long b arrow.r^f c $

Test mathscr/mathbb/mathfrak/mathbf/boldsymbol:

$ script(F) bb(R) frak(a) bold(A) boldsym(B) $

Test operatorname:

$ op{Lip}(C) + operatorname{supp}(f) $

Test matrix:

$ mat(delim: "(" , 1, 0; 0, 1) times.circle mat(1,2;3,4) $

Test integral/sum with limits:

$ integral_0^T sum_(i=1)^n prod_(j in J) bigcup_(k in K) $

Test hat tilde bar mac vec:

$ hat(x) tilde(y) bar(z) mac(w) vec(v) dot(d) $

Test text in math with \tfrac:

$ tfrac(1,2) frac(d f, d x) $
