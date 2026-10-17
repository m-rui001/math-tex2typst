# -*- coding: utf-8 -*-
"""Census of control sequences in note math that standard LaTeX does not define.

Spec line 28 requires custom material-preamble macros to be written out in standard
LaTeX, so a note that keeps shorthand command names is unreadable by a strict inline
math renderer. Fenced blocks and code spans are dropped first, then every remaining
backslash-word token inside a dollar span is counted against the allowlist below.
Read-only. Usage: python macro_census.py [SHOW_N]
"""
from __future__ import unicode_literals
import io, os, re, glob, sys, collections

B = chr(92)
D = chr(36)
ROOT = u'E:/math/' + u'研究笔记'
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
CODE = re.compile(u'`+[^`\n]*`+')
CS = re.compile(u'[' + B + B + u']([A-Za-z]+)')

STD = set(u'''alpha beta gamma delta epsilon varepsilon zeta eta theta vartheta iota kappa
lambda mu nu xi pi varrho rho sigma varsigma tau upsilon phi chi psi omega
Gamma Delta Theta Lambda Xi Pi Sigma Upsilon Phi Psi Omega
ell hbar imath jmath partial infty aleph beth gimel daleth
mathbb mathbf mathrm mathit mathsf mathtt mathcal mathfrak mathscr
text textrm textsf texttt textbf textit operatorname
frac dfrac tfrac binom tbinom dbinom genfrac sqrt
sum prod coprod int iint iiint ointointclockwise varointclockwise ointctrclockwise
bigcup bigcap bigodot bigoplus bigotimes bigvee bigwedge bigsqcup
lim limsup liminf max min sup inf det dim gcd hom ker arg deg Pr exp log ln lg
sin cos tan cot sec csc arcsin arccos arctan arcsec arccsc sinh cosh tanh coth
sech csch arsinh arcosh artanh arg
mod bmod pmod
left right big Big bigg Bigg bigl Bigr
langle rangle lvert rvert lVert rVert vert Vert mid nmid
le leq ge geq ne neq equiv approx cong sim simeq propto asmp sym
ll gg subset subseteq supset supseteq subsetneq supsetneq
cup cap setminus emptyset varnothing
forall exists nexists neg neg
in to rightarrow leftarrow Rightarrow Leftarrow leftrightarrow Leftrightarrow
leftrightarrow mapsto longmapsto longleftrightarrow longrightarrow longleftarrow
nearrow searrow swarrow nwarrow
hookrightarrow hookleftarrow twoheadrightarrow →
oplus ominus otimes oslash odot star ast bullet circ diamond boxtimes
ominus perp parallel triangle triangleleft triangleright
vartriangle trianglecdot
uparrow downarrow Uparrow Downarrow updownarrow
leftharpoonup rightharpoonup leftharpoondup rightharpoondown
implies iff
pm mp times div cdot
hat check breve bar vec dot Ddot tilde widehat widetilde overrightarrow overleftarrow
overline underline overbrace underbrace overset underset stackrel
displaystyle textstyle scriptstyle scriptscriptstyle
aligned array matrix pmatrix bmatrix vmatrix Vmatrix Bmatrix smallmatrix
cases dcases rcases subarray gathered split align alignat equation multline CDATA
begin end label ref cite eqref pageref tag ntag nonumber
mathopen mathclose mathrel mathbin mathord mathpunct mathinner
colon thinspace qquad quad
phantom hphantom vphantom
newline nospace stiff
succ succeq prec preceq
nleq ngeq nequiv ncong nsim napprox nin not
nleftarrow nrightarrow nLeftarrow nRightarrow nleftrightarrow
downdownarrows leftleftarrows rightrightarrows leftrightarrows
rightleftharpoonsleftharpoons
bm boldsymbol
prime primeprime
degree anglearc
varDelta nabla box
sideset raisebox
'''
    .split())


def nonmath_stripped(t):
    L = t.split(u'\n')
    out = []
    infence = False
    tok = None
    for l in L:
        s = l.strip()
        if s.startswith(u'```') or s.startswith(u'~~~'):
            if not infence:
                infence = True
                tok = s[0] * 3
                out.append(u'')
                continue
            if tok and s.startswith(tok):
                infence = False
                tok = None
                out.append(u'')
                continue
        out.append(u'' if infence else CODE.sub(u'', l))
    return u'\n'.join(out)


def run(show):
    cnt = collections.Counter()
    where = {}
    files_hit = 0
    for p in sorted(glob.glob(os.path.join(ROOT, 'D*.md'))):
        t = io.open(p, encoding='utf-8').read()
        m = nonmath_stripped(t)
        segs = re.split(u'[' + D + u']+', m)
        body = u''.join(segs[1::2])
        bad = [c for c in CS.findall(body) if c not in STD]
        if bad:
            files_hit += 1
            for c in bad:
                cnt[c] += 1
                where.setdefault(c, os.path.basename(p)[:12])
    print('files_hit=%d distinct=%d total=%d' % (files_hit, len(cnt), sum(cnt.values())))
    for c, n in cnt.most_common(show):
        print('%-16s %6d  e.g. %s' % (c, n, where[c]))


run(int(sys.argv[1]) if len(sys.argv) > 1 else 0)
