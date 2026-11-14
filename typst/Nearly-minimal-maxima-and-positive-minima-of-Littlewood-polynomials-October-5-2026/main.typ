#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: false), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Nearly minimal maxima and positive minima \
of Littlewood polynomials]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A #emph[Littlewood polynomial of length $N$] is a polynomial

$ P \( z \) = sum_(k = 0)^(N - 1) epsilon_k z^k \, wide epsilon_k in { - 1 \, 1 } . $

Write $bb(T) = bb(R) \/ bb(Z)$ and $upright(e) \( t \) = exp \( 2 pi i t \)$,
  and give $bb(T)$ probability Haar measure. Parseval’s identity gives

$ integral_(bb(T)) \| P \( upright(e) \( t \) \) \|^2 thin d t = N \, wide ∥P∥_oo :=
  max_(t in bb(T)) \| P \( upright(e) \( t \) \) \| gt.eq sqrt(N) . $

We ask whether a maximum arbitrarily close to this lower bound can coexist with a minimum bounded below by a fixed
  positive multiple of $sqrt(N)$.

#thm([Theorem 1.1.])[
  #emph[For every $eta > 0$ there is an integer $N_0 = N_0 \( eta \)$ such that, for every integer $N gt.eq N_0$,
    there exist real signs $epsilon_0 \, dots.h \, epsilon_(N - 1)$ for which
$ 1 / 16 sqrt(N) lt.eq lr(|sum_(k = 0)^(N - 1) epsilon_k z^k|) lt.eq \( 1 + eta \) sqrt(N) wide \( \| z \| = 1 \) . $

]
] <thm:main>

The lower constant is independent of the accuracy of the upper bound.
  The conclusion holds for a single polynomial at every sufficiently large length, on the entire circle,
  including the real points $1$ and $- 1$.

=== 1.1 Context and antecedents <context-and-antecedents>

Questions about the flatness of polynomials with restricted coefficients have a long history in harmonic analysis.
  The two-sided flatness question appears in Erdős’s problems #cite(label("Erdos1957")) Problem 26 and in
  Littlewood’s work #cite(label("Littlewood1966")). The Rudin–Shapiro construction of real-sign polynomials gives
  an upper bound $sqrt(2 N)$ at dyadic lengths #cite(label("Rudin1959")).
  The requirement that the coefficients be real signs is substantial:
  Kahane constructed polynomials with complex unimodular coefficients whose normalized modulus tends uniformly to
  one #cite(label("Kahane1980")); see also Bombieri and Bourgain #cite(label("BombieriBourgain2009")).
  The real-sign questions and their relation to the Parseval lower bound are discussed in
  #cite(label("HaymanLingham2018")) Problems 4.13 and 4.31.

Balister, Bollobás, Morris, Sahasrabudhe and Tiba proved that flat Littlewood polynomials exist at every degree at
  least two: their modulus lies between two absolute positive multiples of the square root of the length
  #cite(label("BalisterEtAl2020")) Theorem 1.1. The companion manuscript #cite(label("OpenAIMinimal")) establishes
  that the best possible upper constant tends to one through all lengths.
  Theorem 1 combines the nearly minimal upper bound with a fixed positive lower bound.
  These two properties must be achieved by the same choice of signs,
  so neither of the preceding existence statements supplies the conclusion by itself.

The construction in #cite(label("OpenAIMinimal")) provides more than an upper bound.
  It gives relaxed real coefficients in $\[ - 1 \, 1 \]$ whose Fourier polynomial is uniformly approximated by
  quadratic-phase waves with disjoint supports. The modulus of this leading term has almost full mean-square mass,
  but it vanishes on some arcs. We reproduce the auxiliary polynomial, interval packing, sampling,
  and rounding arguments needed here. The standard external inputs are the Pippenger–Spencer hypergraph-coloring
  theorem and the Lovett–Meka partial-coloring theorem, stated at their points of use.

Our additional step constructs a correction on the arcs where the leading amplitude is small.
  On each arc its phase is $N$ times a fixed piecewise quadratic function,
  plus an affine adjustment with slope bounded independently of $N$. We call the fixed function the leading phase.
  At a transition, the correction and existing wave have the same leading phase derivative,
  and the affine adjustment makes their full phase values agree modulo integers.
  This keeps the waves aligned while the correction turns on.
  Across most of each arc, the leading phase derivative runs through an interval assigned only to that arc and its
  reflection. This separation controls individual Fourier coefficients;
  keeping that derivative strictly between zero and one controls the Fourier mass outside the permitted degrees.
  The two estimates preserve both the coefficient constraint and a lower-modulus margin.

The proof of #cite(label("BalisterEtAl2020")) also repairs small-modulus regions:
  a cosine polynomial from the Rudin–Shapiro construction is supplemented by a sine polynomial that is large on
  the exceptional arcs, with discrepancy estimates controlling the coefficients.
  Here the correction acts on the quadratic waves of #cite(label("OpenAIMinimal")),
  and its coefficient cost tends to zero as the upper bound approaches its minimum.

=== 1.2 Proof strategy and notation <proof-strategy-and-notation>

For a real vector $X = \( X_0 \, dots.h \, X_(N - 1) \)$, write

$ U_X \( t \) = 1 / sqrt(N) sum_(k = 0)^(N - 1) X_k upright(e) \( k t \) \, wide mu \( X \) = 1 /
  2 sum_(k = 0)^(N - 1) \( 1 - \| X_k \| \) quad upright("if ") X in \[ - 1 \, 1 \]^N . $

The quantity $mu \( X \)$ measures how far the coefficients are from signs.
  The rounding estimate proved in Section 6 changes $U_X$ by at most

$ C / sqrt(N) + C sqrt(frac(mu \( X \), N) log #h(-0.16667em) (frac(80 N, mu \( X \)))) \, $

with the square-root term defined to be zero at $mu \( X \) = 0$.
  Thus a small relative defect permits a uniformly small change on the whole circle.
  The construction must create its positive lower bound before this rounding is applied.

Fix a small accuracy parameter $delta > 0$. Sections 2 and 3 construct a bounded real trigonometric polynomial on
  an auxiliary torus and pack the angle intervals that will support the resulting quadratic waves.
  Section 4 produces vectors $Y_N in \[ - 1 \, 1 \]^N$ and leading functions $B_N$ with

$ U_(Y_N) = B_N + o \( 1 \) \, wide \| B_N \| = B lt.eq 1 + O \( delta \) \, wide integral_(bb(T)) B^2 gt.eq 1 -
  O \( delta \) . $

Here $B$ is a fixed sum of disjoint smooth bumps, independent of $N$.
  In particular, the arcs where $B < 1 \/ 8$ have total length $O \( delta \)$.

Section 5 constructs a conjugate-symmetric function $R_N$ on those arcs such that $B_N +
  R_N$ has minimum at least $1 \/ 8 - o \( 1 \)$, without raising its maximum. The essential Fourier estimates are

$ sqrt(N) thin \| hat(R)_N \( k \) \| = O \( sqrt(delta) \) quad \( 0 lt.eq k < N \) \, wide
  sum_(k in.not { 0 \, dots.h \, N - 1 }) \| hat(R)_N \( k \) \| = o \( 1 \) . $

The first bound permits a small rescaling that returns the corrected real coefficients to $\[ - 1 \, 1 \]$.
  The second shows that restricting the correction to the required degrees preserves its uniform effect on the
  circle. The rescaled coefficients still have relative defect tending to zero with $delta$.
  Section 7 applies the rounding estimate and chooses the parameters to prove Theorem 1.

All torus integrals below use probability Haar measure. For an integrable function $f$ on $bb(T)^m$ we use

$ hat(f) \( a \) = integral_(bb(T)^m) f \( y \) upright(e) \( - a dot.op y \) thin d y wide \( a in bb(Z)^m \) . $

All auxiliary dimensions, frequencies, intervals, and smooth cutoffs are fixed after $delta$ is chosen.
  Unless another limit is specified, $o \( 1 \)$ denotes a quantity tending to zero as $N arrow.r
  oo$ with these data fixed. Constants denoted by $O_delta$ may depend on these fixed data.
  An #emph[absolute] constant is independent of both $delta$ and $N$.

== 2 Spreading Fourier coefficients <sec:spreading>

This section supplies the auxiliary polynomial used in the sampling construction.
  We reproduce the coefficient-spreading argument of #cite(label("OpenAIMinimal")) Section 4,
  constructing a real trigonometric polynomial with almost unit mean-square mass whose Fourier coefficients fit
  within a total spectral width less than one. The coefficient assigned to a width $w$ must have size at most
  approximately $sqrt(w)$: this is the normalization of the quadratic integral in Lemma 3.
  Additional torus variables let us distribute each coefficient among many frequencies while controlling both
  their number and their sizes.

For a trigonometric polynomial $F$ on $bb(T)^m$, write

$ hat(F) \( a \) = integral_(bb(T)^m) F \( x \) upright(e) \( - a dot.op x \) thin d x \, wide a in bb(Z)^m . $

A finite set is a #emph[containing Fourier support] if every coefficient outside it vanishes;
  coefficients inside it are allowed to vanish as well. All norms and integrals on tori use probability Haar measure.

#thm([Proposition 2.1.])[
  (An auxiliary polynomial with controlled widths).  #emph[For every $0 < delta < 1 \/ 20$,
    there exist integers $m gt.eq 1$ and $r gt.eq 2$, nonzero vectors $a_1 \, dots.h \, a_r in bb(Z)^m$,
    a real-valued trigonometric polynomial $F$ on $bb(T)^m$, and a vector $v in
    bb(R)^m$ with the following properties. No two of the vectors $a_i$ are parallel, and
$ cal(A) = { a_1 \, - a_1 \, dots.h \, a_r \, - a_r } $

 is a containing Fourier support of $F$. Moreover,
#[#set math.equation(numbering: n => "(1)")
 $ ∥F∥_oo lt.eq 1 \, wide ∥F∥_2 gt.eq 1 - 3 delta . $ <eq:auxiliary-norms>]

 Writing $lambda_a = a dot.op v$ for $a in cal(A)$, we have
#[#set math.equation(numbering: n => "(2)")
 $ lambda_a eq.not 0 \, wide sum_(a in cal(A)) \| lambda_a \| < 1 \, wide
   frac(\| hat(F) \( a \) \|, sqrt(\| lambda_a \|)) lt.eq K_delta \, wide K_delta =
   sqrt(frac(\( 1 + delta \)^3, 1 - delta)) . $ <eq:auxiliary-widths>]

 All these objects depend on $delta$ alone.]
] <prop:auxiliary>

The construction starts with a polynomial of almost unit mean square.
  Quadratic oscillations in new variables spread its coefficients;
  finite Fourier truncation then gives the required polynomial.
  We first record the uniform quadratic estimate used to control the spread coefficients.

#thm([Lemma 2.2.])[
  (Uniform quadratic integration).  #emph[Let $g in C_c^oo \( bb(R) \)$ and let $beta in bb(R) \\ { 0 }$ be fixed.
    As $T arrow.r oo$ through positive real values,
#[#set math.equation(numbering: n => "(3)")
 $ integral_(bb(R)) g \( x \) upright(e) \( T beta x^2 \/ 2 - u x \) thin d x =  &
   frac(upright(e) \( "sgn" \( beta \) \/ 8 - u^2 \/ \( 2 T beta \) \), sqrt(T \| beta \|))\
 & wide dot.op (g (frac(u, T beta)) + O_(g \, beta) \( T^(- 1) \)) \, $ <eq:uniform-quadratic>]

 uniformly for every real $u$.]
] <lem:quadratic>

#proof[
  Use the real-line Fourier transform $hat(g) \( xi \) = integral_(bb(R)) g \( x \) upright(e) \( - xi x \) thin d
    x$, and put $x_0 = u \/ \( T beta \)$. Completing the square reduces the integral to
  $ upright(e) (- frac(u^2, 2 T beta)) integral_(bb(R)) g \( x_0 + y \) upright(e) \( T beta y^2 \/ 2 \) thin d y . $
  Insert the damping factor $exp \( - pi rho y^2 \)$ with $rho > 0$,
    and use Fourier inversion on $g \( x_0 + y \)$. The resulting double integral is absolutely integrable.
    The inner Gaussian integral is
  $ integral_(bb(R)) exp #scale(x: 120%, y: 120%)[\(] - pi \( rho - i T beta \) y^2 +
    2 pi i xi y #scale(x: 120%, y: 120%)[\)] thin d y = \( rho - i T beta \)^(- 1 \/ 2) exp
    (- frac(pi xi^2, rho - i T beta)) . $
  Here the square root is the branch analytic in the right half-plane and positive on the positive real axis.
    As $rho arrow.b 0$,
  $ \( rho - i T beta \)^(- 1 \/ 2) arrow.r frac(upright(e) \( "sgn" \( beta \) \/ 8 \), sqrt(T \| beta \|)) \,
    wide exp (- frac(pi xi^2, rho - i T beta)) arrow.r upright(e) (- frac(xi^2, 2 T beta)) . $
  The modulus of the exponential multiplier is at most one,
    and $\| \( rho - i T beta \)^(- 1 \/ 2) \| lt.eq \( T \| beta \| \)^(- 1 \/ 2)$.
    Since $hat(g)$ is Schwartz, dominated convergence applies on the Fourier side.
    On the original side it applies with dominating function $\| g \( x_0 + y \) \|$. We obtain the exact identity
  #[#set math.equation(numbering: n => "(4)")
   $ integral_(bb(R)) g \( x \) upright(e) \( T beta x^2 \/ 2 - u x \) thin d x =  &
     frac(upright(e) \( "sgn" \( beta \) \/ 8 - u^2 \/ \( 2 T beta \) \), sqrt(T \| beta \|))\
 & wide dot.op integral_(bb(R)) hat(g) \( xi \) upright(e) \( xi x_0 \) upright(e) (- frac(xi^2, 2 T beta)) d xi .
   $ <eq:quadratic-exact>]
  The difference of the last integral from $g \( x_0 \)$ has absolute value at most
  $ frac(pi, T \| beta \|) integral_(bb(R)) xi^2 \| hat(g) \( xi \) \| thin d xi . $
  This bound is independent of $x_0$, proving the required uniformity. ◻
]

#proof[
  Fix $delta$. The choices below are successive: once a parameter has been chosen,
    it stays fixed while later parameters vary.
  ===== 2.1 A polynomial of almost unit mean square. <a-polynomial-of-almost-unit-mean-square.>
  Starting with $p_0 = 0$, introduce one new torus coordinate at each step and define
  #[#set math.equation(numbering: n => "(5)")
   $ p_j \( y_1 \, dots.h \, y_j \) = p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \) +
     frac(1 - p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \)^2, 2) cos \( 2 pi y_j \) . $ <eq:binary-recursion>]
  For $\| z \| lt.eq 1$, $\( 1 - z^2 \) \/ 2 = \( 1 - \| z \| \) \( 1 + \| z \| \) \/ 2 lt.eq 1 - \| z \|$.
    Thus $\| p_j \| lt.eq 1$ pointwise. Integrating first in $y_j$ shows that $p_j$ has mean zero.
    If $M_j = integral_(bb(T)^j) p_j^2$, integration of the square in the new variable gives
  #[#set math.equation(numbering: n => "(6)")
   $ M_j = M_(j - 1) + 1 / 8 integral_(bb(T)^(j - 1)) \( 1 - p_(j - 1)^2 \)^2 gt.eq M_(j - 1) + 1 /
     8 \( 1 - M_(j - 1) \)^2 . $ <eq:binary-energy>]
  Hence $M_j arrow.t 1$: a limit below one would make the increments bounded below by a positive constant.
    Choose $d gt.eq 2$ so that $M_d gt.eq 1 - delta$.
  Let $cal(S) subset bb(Z)^d$ be the Fourier support of $p_d$,
    consisting of the frequencies with nonzero coefficients, and put $c_s = hat(p)_d \( s \)$.
    Every vector in $cal(S)$ has last nonzero coordinate equal to $1$ or $- 1$.
    Indeed, the old term in (5) keeps the previous frequencies with new coordinate zero,
    whereas every frequency in the new term has new coordinate $1$ or $- 1$.
    The two terms cannot cancel each other. There is no constant frequency because the mean is zero.
  If two such vectors are parallel, comparing their last nonzero coordinates shows that they are equal or
    negatives. Let $s_1 \, dots.h \, s_D$ be those with positive last nonzero coordinate.
    They are pairwise nonparallel and $cal(S) = { plus.minus s_1 \, dots.h \, plus.minus s_D }$.
    There are at least two: the coefficient at the first coordinate vector in $p_1$ is nonzero,
    and the coefficient at the second coordinate vector in $p_2$ is $\( 1 - M_1 \) \/ 4 = 7 \/ 32 > 0$;
    both persist in later steps.
  We have obtained the mean-square mass needed in (1). It remains to distribute its Fourier coefficients so that
    the total width and the coefficient-to-width ratios in (2) are both controlled.
  ===== 2.2 Choosing the quadratic curvatures. <choosing-the-quadratic-curvatures.>
  Choose $gamma in bb(R)^d$ outside the finite union of hyperplanes $s^perp$, $s in cal(S)$,
    and define $rho_s = \| s dot.op gamma \| > 0$. We will choose vectors $b_1 \, dots.h \,
    b_D in bb(R)^d$ so that the products
  $ Delta_s = product_(j = 1)^D \| s dot.op b_j \| $
  are approximately a common multiple of $\| c_s \|^2 \/ rho_s$. Here is the reason for this target.
    At a large oscillation scale $B$, the construction below assigns about $B^D
    Delta_s$ Fourier positions to the original frequency $s$,
    with coefficient sizes bounded by about $\| c_s \| \/ sqrt(B^D Delta_s)$.
    Assigning each such position a width proportional to $rho_s \/
    B^D$ makes the total width of this family proportional to $Delta_s rho_s$,
    and the resulting upper bound for the ratio of squared coefficient size to width proportional to $\|
    c_s \|^2 \/ \( Delta_s rho_s \)$. Thus choosing $Delta_s rho_s$ approximately proportional to $\|
    c_s \|^2$ balances these upper bounds while making the total width track the Parseval mass $sum_s \|
    c_s \|^2$. The estimates and the common proportionality factor are made precise below.
  For each $j$, choose $b_j^0 in s_j^perp$ which is not orthogonal to any $s_l$ with $l eq.not j$.
    This is possible because each such orthogonality condition cuts out a proper subspace of $s_j^perp$,
    and a finite union of proper subspaces cannot cover that space. Choose $b_j^1$ satisfying
  $ s_j dot.op b_j^1 = frac(\| c_(s_j) \|^2, rho_(s_j) product_(l eq.not j) \| s_j dot.op b_l^0 \|) > 0 \, $
  and set $b_j = b_j^0 + tau b_j^1$ for a positive parameter $tau$.
    Every denominator is nonzero by the choices just made. For $s = s_j$,
  $ Delta_(s_j) / tau = \( s_j dot.op b_j^1 \) product_(l eq.not j) \| s_j dot.op b_l^0 +
    tau s_j dot.op b_l^1 \| arrow.r frac(\| c_(s_j) \|^2, rho_(s_j)) wide \( tau arrow.b 0 \) . $
  The same limit holds for $- s_j$. Fix a sufficiently small $tau > 0$ so that, simultaneously for all $s in cal(S)$,
  #[#set math.equation(numbering: n => "(7)")
   $ \( 1 - delta \) frac(tau \| c_s \|^2, rho_s) lt.eq Delta_s lt.eq \( 1 + delta \)
     frac(tau \| c_s \|^2, rho_s) . $ <eq:determinant-tuning>]
  In particular, every curvature $beta_(s \, j) := s dot.op b_j$ is nonzero.
    All these curvatures are fixed from now on; no lower bound uniform in $delta$ is needed.
  ===== 2.3 Spreading the coefficients. <spreading-the-coefficients.>
  Choose $g in C_c^oo \( \( - 1 \/ 2 \, 1 \/ 2 \) \)$ with $0 lt.eq g lt.eq 1$ and
  $ (integral_(bb(R)) g \( x \)^2 thin d x)^D gt.eq 1 - delta . $
  For a large positive real parameter $B$, and $z in \[ - 1 \/ 2 \, 1 \/ 2 \]^D$, define
  #[#set math.equation(numbering: n => "(8)")
   $ G \( y \, z \) = (product_(j = 1)^D g \( z_j \)) p_d (y + B / 2 sum_(j = 1)^D b_j z_j^2) \, wide
     y in bb(T)^d . $ <eq:spread-function>]
  The cutoff makes this function vanish near every boundary face in $z$,
    so it extends to a smooth real function on $bb(T)^(d + D)$. Translation invariance in $y$ gives
  #[#set math.equation(numbering: n => "(9)")
   $ ∥G∥_oo lt.eq 1 \, wide ∥G∥_2^2 = M_d (integral g^2)^D gt.eq \( 1 - delta \)^2 . $ <eq:spread-norms>]
  Fourier integration first in $y$ shows that the only possible frequencies are $\( s \, u \)$ with $s in
    cal(S)$ and $u in bb(Z)^D$, and
  #[#set math.equation(numbering: n => "(10)")
   $ hat(G) \( s \, u \) = c_s product_(j = 1)^D I_(s \, j) \( u_j \) \, wide I_(s \, j) \( w \) =
     integral_(bb(R)) g \( x \) upright(e) \( B beta_(s \, j) x^2 \/ 2 - w x \) thin d x . $ <eq:spread-coefficients>]
  Lemma 3 and $0 lt.eq g lt.eq 1$ imply
  $ \| I_(s \, j) \( w \) \| lt.eq frac(1 + O \( B^(- 1) \), sqrt(B \| beta_(s \, j) \|)) $
  uniformly for every real $w$. The constants may depend on the already fixed curvatures and cutoff.
    Since there are only finitely many pairs $\( s \, j \)$, for all sufficiently large $B$ we have
  #[#set math.equation(numbering: n => "(11)")
   $ \| hat(G) \( s \, u \) \| lt.eq \( 1 + delta \) frac(\| c_s \|, sqrt(B^D Delta_s))
     wide \( s in cal(S) \, med u in bb(Z)^D \) . $ <eq:spread-coefficient-bound>]
  The stationary points for these integrals suggest keeping the boxes
  $ cal(U)_s = {u in bb(Z)^D : \| u_j \| lt.eq frac(B \| beta_(s \, j) \|, 2) upright(" for every ") j} . $
  Their cardinalities satisfy
  #[#set math.equation(numbering: n => "(12)")
   $ \| cal(U)_s \| & = product_(j = 1)^D (2 ⌊frac(B \| beta_(s \, j) \|, 2)⌋ + 1)\
 & lt.eq B^D Delta_s product_(j = 1)^D (1 + frac(1, B \| beta_(s \, j) \|)) lt.eq \( 1 + delta \) B^D Delta_s
   $ <eq:spread-box-count>]
  for all sufficiently large $B$. Thus the product $Delta_s$ controls the number of retained frequencies as well
    as their coefficient bound.
  ===== 2.4 A summable bound outside the boxes. <a-summable-bound-outside-the-boxes.>
  We need uniform approximation after truncation, so the additive error in Lemma 3 cannot simply be summed over
    the whole lattice. Instead, outside the boxes the phase has no stationary point near the amplitude support.
  Choose $alpha < 1 \/ 2$ with $"supp" g subset \[ - alpha \, alpha \]$.
    For a fixed $beta eq.not 0$, if $\| w \| > B \| beta \| \/ 2$, then
  #[#set math.equation(numbering: n => "(13)")
   $ \| B beta x - w \| gt.eq \| w \| - B \| beta \| alpha gt.eq
     c_(alpha \, beta) \( B + \| w \| \) wide \( x in "supp" g \) \, $ <eq:offbox-derivative>]
  with $c_(alpha \, beta) > 0$. Indeed, the middle expression is at least $\( 1 - 2 alpha \) \| w \|$,
    while $B < 2 \| w \| \/ \| beta \|$. Integrate by parts $l$ times using
  $ frac(1, 2 pi i \( B beta x - w \)) frac(d, d x) upright(e) \( B beta x^2 \/ 2 - w x \) =
    upright(e) \( B beta x^2 \/ 2 - w x \) . $
  There are no boundary terms. Each term after these integrations contains a bounded derivative of $g$ and a
    factor bounded by $C_l B^h \( B + \| w \| \)^(- l - h)$ for some $0 lt.eq h lt.eq l$. Hence
  #[#set math.equation(numbering: n => "(14)")
   $ lr(|integral_(bb(R)) g \( x \) upright(e) \( B beta x^2 \/ 2 - w x \) thin d x|) lt.eq
     C_l \( B + \| w \| \)^(- l) wide (\| w \| > frac(B \| beta \|, 2)) . $ <eq:offbox-bound>]
  For integer $w$ the sum of this bound outside the one-dimensional box is $O \( B^(1 - l) \)$ when $l > 1$.
    The full sum over integer $w$ is $O \( B \)$: inside there are $O \( B \)$ terms,
    each at most $∥g∥_(L^1 \( bb(R) \))$, and the outside sum is bounded by (14).
  The complement of $cal(U)_s$ is contained in the union of the $D$ coordinate complements. Consequently
  #[#set math.equation(numbering: n => "(15)")
   $ sum_(u in.not cal(U)_s) \| hat(G) \( s \, u \) \| & lt.eq \| c_s \| sum_(j = 1)^D
     (sum_(\| u_j \| > B \| beta_(s \, j) \| \/ 2) \| I_(s \, j) \( u_j \) \|) product_(h eq.not j)
     (sum_(u_h in bb(Z)) \| I_(s \, h) \( u_h \) \|)\
 & = O \( B^(D - l) \) . $ <eq:spread-tail>]
  Fix an integer $l > D$. Summing over the finite set $cal(S)$ shows that the total discarded coefficient mass
    tends to zero. The Fourier series is absolutely convergent, so this mass also bounds the uniform truncation error.
  ===== 2.5 Truncation and the final budgets. <truncation-and-the-final-budgets.>
  Fix one $B$ large enough for (11), (12), and a truncation error at most $delta$ in (15). Define
  $ T_B \( y \, z \) = sum_(s in cal(S)) sum_(u in cal(U)_s) hat(G) \( s \, u \)
    upright(e) \( s dot.op y + u dot.op z \) \, wide F = frac(T_B, 1 + delta) . $
  The boxes satisfy $cal(U)_(- s) = cal(U)_s = - cal(U)_s$.
    Since $G$ is real, the retained coefficients have conjugate symmetry, and $F$ is real. By (9) and the uniform error,
  $ ∥F∥_oo lt.eq 1 \, wide ∥F∥_2 gt.eq frac(1 - 2 delta, 1 + delta) gt.eq 1 - 3 delta . $
  Set $m = d + D$ and take the containing support
  $ cal(A) = { \( s \, u \) : s in cal(S) \, med u in cal(U)_s } . $
  Its vectors are nonzero. If two are parallel, projection onto the first $d$ coordinates forces the
    proportionality factor to be $1$ or $- 1$; the full vectors must then be equal or negatives.
    Thus one representative from each signed pair gives nonparallel vectors $a_1 \, dots.h \, a_r$.
    Every box contains zero, so $r gt.eq D gt.eq 2$. Some of the corresponding Fourier coefficients can vanish;
    the containing support and all estimates remain valid in that case.
  Finally choose
  $ v = (frac(gamma, tau B^D \( 1 + delta \)^3) \, 0) in bb(R)^(d + D) . $
  For $a = \( s \, u \) in cal(A)$,
  $ \| lambda_a \| = \| a dot.op v \| = frac(rho_s, tau B^D \( 1 + delta \)^3) > 0 . $
  Using (12) and (7), with both signs already included in $cal(S)$, gives
  $ sum_(a in cal(A)) \| lambda_a \| & = sum_(s in cal(S)) \| cal(U)_s \| frac(rho_s, tau B^D \( 1 + delta \)^3)\
 & lt.eq frac(1, tau \( 1 + delta \)^2) sum_(s in cal(S)) Delta_s rho_s lt.eq
   frac(1, 1 + delta) sum_(s in cal(S)) \| c_s \|^2 = frac(M_d, 1 + delta) < 1 . $
  The coefficient bound (11), divided by $1 + delta$, also gives
  $ frac(\| hat(F) \( a \) \|^2, \| lambda_a \|) lt.eq frac(\| c_s \|^2 tau \( 1 + delta \)^3, Delta_s rho_s)
    lt.eq frac(\( 1 + delta \)^3, 1 - delta) = K_delta^2 . $
  These are all the assertions of the proposition. ◻
]

The strict signed width bound means that $w_i = \| lambda_(a_i) \|$ satisfies $2 sum_i w_i < 1$,
  exactly the input required by Lemma 4. The polynomial $F$, its support, and its velocity $v$ are now fixed.
  After the signed intervals have been packed, Section 4 will sample these fixed data along quadratic phases while
  only the length $N$ tends to infinity.

== 3 Packing signed intervals <sec:packing>

The stationary contributions of the quadratic phases used below must lie in disjoint intervals of the angle
  variable. The interval centers cannot be chosen separately:
  each group of centers comes from evaluating several integer linear forms at one point of a torus.
  The following lemma supplies the required packing under pairwise nonparallelism,
  even when larger collections of the forms satisfy linear relations.
  We give the argument from #cite(label("OpenAIMinimal")) Section “Packing signed intervals”.

For $c in bb(T)$ and $0 < ell < 1$, let

$ I \( c \, ell \) = { c + x med \( mod med 1 \) : - ell \/ 2 lt.eq x lt.eq ell \/ 2 } . $

Thus $I \( c \, ell \)$ is a closed interval of length $ell$.

#thm([Lemma 3.1.])[
  (Signed interval packing).  #emph[Let $m gt.eq 1$ and $r gt.eq 2$ be integers, and let $a_1 \, dots.h \,
    a_r in bb(Z)^m \\ { 0 }$ be pairwise nonparallel. If $w_1 \, dots.h \, w_r > 0$ and $2 sum_(i = 1)^r w_i < 1$,
    there are an integer $H gt.eq 1$ and points $theta_1 \, dots.h \,
    theta_H in bb(T)^m$ for which the $2 r H$ closed intervals
$ I #scale(x: 120%, y: 120%)[\(] sigma a_i dot.op theta_h \, w_i \/ H #scale(x: 120%, y: 120%)[\)] \, wide 1 lt.eq
  i lt.eq r \, quad 1 lt.eq h lt.eq H \, quad sigma in { - 1 \, 1 } \, $

 are pairwise disjoint.]
] <lem:signed-packing>

We encode compatible choices of centers by a hypergraph. Recall that an $r$-uniform hypergraph consists of a
  finite vertex set and a family of distinct $r$-element subsets, called edges.
  Its degree $d \( v \)$ counts edges containing $v$, and its codegree $d \( u \, v \)$ counts edges containing
  both distinct vertices $u \, v$. A matching is a family of pairwise disjoint edges.
  The combinatorial input is the following form of the Pippenger–Spencer theorem
  #cite(label("PippengerSpencer1989")), stated with these quantifiers in #cite(label("AlonYuster2005")) Lemma 2.1.

#thm([Theorem 3.2.])[
  (Pippenger–Spencer).  #emph[For each integer $r gt.eq 2$ and each $gamma > 0$,
    there is $beta > 0$ such that the following holds. If an $r$-uniform hypergraph satisfies, for some $D > 0$,
$ \( 1 - beta \) D < d \( v \) < \( 1 + beta \) D quad upright("for every vertex ") v \, wide
  d \( u \, v \) < beta D quad upright("for ") u eq.not v \, $

 then its edges can be partitioned into at most $\( 1 + gamma \) D$ matchings.]
] <thm:packing-edge-coloring>

In particular, a sequence of $r$-uniform hypergraphs with all degrees $\( 1 + o \( 1 \) \)
  D$ and maximum codegree $o \( D \)$ has a matching covering a $1 - o \( 1 \)$ proportion of its vertices.
  Indeed, degree summation gives $\( 1 + o \( 1 \) \) \| V \| D \/ r$ edges,
  and the theorem partitions them into $\( 1 + o \( 1 \) \) D$ matchings;
  a largest matching therefore has at least $\( 1 - o \( 1 \) \) \| V \| \/ r$ edges.

#proof[
  We place small disjoint slots on a finite grid in a half-circle.
    Each slot has one of the types $1 \, dots.h \, r$ and reserves both itself and its reflection.
    A compatible choice of one slot of every type will be an edge.
    We randomize the slots so that almost all vertices have the same degree,
    then use Theorem 5 to select many compatible choices without reusing a slot.
  ===== 3.1 The grid and the random slots. <the-grid-and-the-random-slots.>
  Choose positive numbers $alpha_i > 2 w_i$ with $sum_i alpha_i = 1$.
    Approximating large multiples of the $alpha_i$ by positive odd integers gives fixed odd integers $L_i$ such
    that, with $L = sum_i L_i$,
  #[#set math.equation(numbering: n => "(16)")
   $ w_i < frac(L_i, 2 L) wide \( 1 lt.eq i lt.eq r \) . $ <eq:packing-width-slack>]
  On a grid with spacing $1 \/ q$, a type-$i$ slot will have length $L_i \/ q$.
    We seek a matching of size $H tilde.op q \/ \( 2 L \)$, so that (16) makes the desired width $w_i \/
    H$ strictly smaller than the slot length.
  Let $b$ be the rank over $bb(Q)$ of the matrix with rows $a_i$. Then $b gt.eq 2$.
    For all sufficiently large primes $q$, this matrix has rank $b$ over $bb(F)_q$,
    and every pair of its rows has rank two. To see this, exclude the prime divisors of one nonzero $b$-by-$b$
    minor and one nonzero two-by-two minor for each pair of rows.
    In the rest of the proof $q$ tends to infinity through these primes.
    All implied constants may depend on the fixed forms and the fixed integers $L_i$.
  Put $n = \( q - 1 \) \/ 2$, $R = floor.l sqrt(q) floor.r$, and $U_q = { 1 \, dots.h \, n }$.
    For $s in bb(F)_q$, write $\| s \|_q$ for the absolute value of its representative in $\[ - n \, n \]$.
    We call $\| s \|_q$ its folded site. Partition $U_q$ into consecutive chunks of $R$ sites,
    with a possibly shorter final chunk; their number is $K = ceil.l n \/ R ceil.r$.
  Partition the integers periodically into consecutive slots,
    each period consisting of one type-$i$ slot of $L_i$ sites for each $i = 1 \, dots.h \, r$, in that order.
    In each chunk independently, translate this pattern by a uniform residue modulo $L$ and retain only the slots
    contained entirely in the chunk. A retained slot is a vertex of its type.
    Its middle site $c$ is an integer because $L_i$ is odd. Independently give each retained slot the oriented
    center $c$ or $- c$ in $bb(F)_q$, with equal probabilities.
    The orientation specifies which signed center will enter the linear equations;
    geometrically both signs will be used.
  A chunk of $u$ sites has $u \/ L + O \( 1 \)$ retained slots of each type, uniformly in the shift.
    Thus every realization has
  #[#set math.equation(numbering: n => "(17)")
   $ frac(q, 2 L) + O \( q \/ R + 1 \) $ <eq:packing-vertex-count>]
  vertices of each type. Call a site interior if its distance from both ends of its chunk is at least $L$.
    Let $C_j \( s \)$ indicate that $s$ is the oriented center of a type-$j$ vertex; in particular $C_j \( 0 \) =
    0$. If $\| s \|_q$ is interior, exactly one shift modulo $L$ puts a type-$j$ middle site there,
    and the required orientation has probability $1 \/ 2$. Consequently
  #[#set math.equation(numbering: n => "(18)")
   $ bb(E) C_j \( s \) = p \, wide p = frac(1, 2 L) \, $ <eq:packing-center-probability>]
  whenever $\| s \|_q$ is interior. Center events in different chunks are independent.
  ===== 3.2 Compatibility, degrees, and codegrees. <compatibility-degrees-and-codegrees.>
  Declare a set of one vertex of each type, with oriented centers $s_1 \, dots.h \, s_r$, to be an edge when
  $ a_i dot.op y = s_i wide \( 1 lt.eq i lt.eq r \) $
  has a solution $y in bb(F)_q^m$. Each compatible tuple is included only once.
    Since the evaluation map has rank $b$, every edge has exactly $q^(m - b)$ generating vectors $y$.
  For $s eq.not 0$, define
  $ Z_(i \, s) = 1 / q^(m - 1) sum_(y in bb(F)_q^m\
a_i dot.op y = s) product_(j eq.not i) C_j \( a_j dot.op y \) . $
  The affine fiber in this sum has $q^(m - 1)$ elements. If the vertex $\( i \, s \)$ is present,
    division by the multiplicity $q^(m - b)$ gives its degree:
  #[#set math.equation(numbering: n => "(19)")
   $ d \( i \, s \) = q^(b - 1) Z_(i \, s) . $ <eq:packing-degree>]
  Fixing two centers of different types leaves $q^(m - 2)$ possible generating vectors, by pairwise rank two.
    Their codegree is therefore at most
  #[#set math.equation(numbering: n => "(20)")
   $ q^(b - 2) . $ <eq:packing-codegree>]
  Vertices of the same type have codegree zero.
  We will show that almost all present vertices have degree close to $D_q = p^(r - 1) q^(b - 1)$.
    Joint independence of all the forms is unavailable. Instead,
    most vectors in a fixed fiber put the other evaluations in different chunks,
    where the slot choices are independent. The same observation for two fiber vectors will control the variance.
  ===== 3.3 Conditional first and second moments. <conditional-first-and-second-moments.>
  All relations in this paragraph are over $bb(F)_q$. For a fixed type $i$,
    exclude the nonzero centers $s$ for which there are indices $j < l$, both different from $i$, and a relation
  #[#set math.equation(numbering: n => "(21)")
   $ a_j + a_l = c a_i quad upright("or") quad a_j - a_l = c a_i \, wide c in bb(F)_q^times \,
     wide \| c s \|_q lt.eq R . $ <eq:packing-exceptional-relation>]
  Call this set $E_i$. For either signed combination of a fixed pair, there is at most one such $c$;
    if the combination is a multiple of $a_i$, the multiple cannot be zero by pairwise nonparallelism.
    Since multiplication by $c eq.not 0$ is a bijection,
  #[#set math.equation(numbering: n => "(22)")
   $ \| E_i \| lt.eq 2 binom(r - 1, 2) \( 2 R + 1 \) = O \( R \) . $ <eq:packing-exception-count>]
  Fix $s eq.not 0$ outside $E_i$, and let $Q_s$ be the chunk containing $\| s \|_q$.
    Sample $y$ uniformly from $a_i dot.op y = s$, independently of the random slots.
    For each $j eq.not i$, pairwise rank two makes $a_j dot.op y$ uniform on $bb(F)_q$.
    There are at most $2 L K$ noninterior positive sites, including those in a short final chunk.
    Thus a specified evaluation is zero, folds to a noninterior site, or folds into $Q_s$ with probability at most
  #[#set math.equation(numbering: n => "(23)")
   $ tau_q = frac(1 + 4 L K + 2 R, q) = O \( q^(- 1 \/ 2) \) . $ <eq:packing-boundary-probability>]
  Two residues folding into the same chunk have either a sum or a difference with folded absolute value at most
    $R$. On the fiber $a_i dot.op y = s$, each of $\( a_j + a_l \) dot.op y$ and $\( a_j - a_l \) dot.op
    y$ is either uniform on $bb(F)_q$ or constant. The latter case occurs precisely when its linear form is a
    multiple $c a_i$, and its value is then $c s$. Our exclusion of $E_i$ prevents that constant from having
    folded absolute value at most $R$. The uniform case has probability at most $\( 2 R + 1 \) \/ q$.
    A union bound therefore shows that the $r - 1$ evaluations fold into distinct interior chunks,
    all different from $Q_s$, except on an $O \( q^(- 1 \/ 2) \)$ fraction of the fiber.
  For the second moment take independent uniform vectors $y \, y'$ in the same fiber.
    The preceding argument controls collisions within each copy.
    Across copies, $a_j dot.op y$ and $a_l dot.op y'$ are independent uniform residues whenever $j \, l eq.not i$,
    including $j = l$. Their sum and difference are uniform, so the same bound controls each cross-copy collision.
    For $u = 1$ or $u = 2$ independent fiber samples, the fraction for which the combined list fails to occupy
    distinct interior chunks outside $Q_s$ is at most
  #[#set math.equation(numbering: n => "(24)")
   $ u \( r - 1 \) tau_q + 2 binom(u \( r - 1 \), 2) frac(2 R + 1, q) =
     O \( q^(- 1 \/ 2) \) . $ <eq:packing-good-tuples>]
  Let $V_(i \, s)$ be the event that the vertex $\( i \, s \)$ is present,
    and condition on this event whenever it has positive probability.
    It depends only on the random choices in $Q_s$. For every fiber tuple outside the exceptional fraction in
    (24), the required center events occur in distinct other chunks.
    Conditional on $V_(i \, s)$ they remain independent, each with probability $p$.
    The exceptional fraction depends only on the fiber vectors,
    and its contribution to an expectation is between zero and that fraction.
    Averaging over one and two fiber vectors therefore gives
  #[#set math.equation(numbering: n => "(25)")
   $ bb(E) \[ Z_(i \, s) divides V_(i \, s) \] & = p^(r - 1) + O \( q^(- 1 \/ 2) \) \,\
bb(E) \[ Z_(i \, s)^2 divides V_(i \, s) \] & = p^(2 \( r - 1 \)) + O \( q^(- 1 \/ 2) \) . $ <eq:packing-first-moment>]
  Here the expectations are over the slots and their orientations;
    the square in the second line expands as the average over the independent pair $y \, y'$.
    The bounds are uniform in $s in.not E_i$. No interior condition on $\| s \|_q$ is needed,
    since the entire chunk $Q_s$ was avoided.
  ===== 3.4 Deletion and a large matching. <deletion-and-a-large-matching.>
  Set $epsilon_q = q^(- 1 \/ 8)$. The two moment estimates imply
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( Z_(i \, s) - p^(r - 1) \)^2 divides V_(i \, s)
    #scale(x: 120%, y: 120%)[\]] = O \( q^(- 1 \/ 2) \) . $
  By Chebyshev’s inequality and (19), a present vertex with $s in.not
    E_i$ has degree outside $\[ \( 1 - epsilon_q \) D_q \, \( 1 + epsilon_q \) D_q \]$ with conditional
    probability $O \( q^(- 1 \/ 4) \)$. Summing over the at most $r \( q - 1 \)$ candidate centers,
    the expected number of these vertices is $O \( q^(3 \/ 4) \)$.
    The vertices with centers in the sets $E_i$ number $O \( q^(1 \/ 2) \)$ in every realization.
    Markov’s inequality thus gives a realization with at most $q^(7 \/ 8)$ vertices in these two classes,
    for sufficiently large $q$.
  Delete all these vertices and their incident edges. A surviving vertex loses at most the sum of its codegrees
    with deleted vertices, which by (20) is at most
  $ q^(7 \/ 8) q^(b - 2) = O \( q^(- 1 \/ 8) D_q \) . $
  Every remaining degree is consequently $\( 1 + O \( q^(- 1 \/ 8) \) \) D_q$,
    and the maximum codegree is still at most $q^(b - 2) = o \( D_q \)$.
    Moreover, (17) shows that each type retains $\( 1 + o \( 1 \) \) q \/ \( 2 L \)$ vertices.
    The matching consequence of Theorem 5 gives a matching of size at least $\( 1 - o \( 1 \) \) q \/ \( 2 L \)$.
    A matching uses one vertex of each type per edge, so its size is also at most $\( 1 + o \( 1 \) \)
    q \/ \( 2 L \)$. We have obtained
  #[#set math.equation(numbering: n => "(26)")
   $ H = \( 1 + o \( 1 \) \) frac(q, 2 L) . $ <eq:packing-matching-size>]
  ===== 3.5 From slots to closed intervals. <from-slots-to-closed-intervals.>
  For each matching edge choose a generating vector $y_h in bb(F)_q^m$, and set $theta_h =
    y_h \/ q med \( mod med bb(Z)^m \)$ using integer representatives of its coordinates.
    Then $a_i dot.op theta_h$ is the corresponding oriented center divided by $q$, modulo one.
  A slot with sites $t \, dots.h \, t + L_i - 1$ determines the real interval
  $ J = [frac(t - 1 \/ 2, q) \, frac(t + L_i - 1 \/ 2, q)] \, $
  of length $L_i \/ q$ and centered at its middle site divided by $q$.
    All positive slot intervals lie in $\[ 1 \/ \( 2 q \) \, 1 \/ 2 \]$ and have disjoint interiors.
    Their reflections modulo one lie in $\[ 1 \/ 2 \, 1 - 1 \/ \( 2 q \) \]$ and also have disjoint interiors.
    The whole family therefore has disjoint interiors, although adjacent intervals may share endpoints,
    including at $1 \/ 2$.
  By (16) and (26), for all sufficiently large $q$,
  $ w_i / H < L_i / q wide \( 1 lt.eq i lt.eq r \) . $
  Each desired closed interval is thus contained strictly inside its slot interval or its reflection.
    The two signs use this same pair regardless of the chosen orientation.
    The matching never reuses a slot, so all $2 r H$ closed intervals are pairwise disjoint. ◻
]

Each interval in the lemma is disjoint from its reflection and hence avoids $0$ and $1 \/ 2$.
  Once the forms and widths are fixed, we fix one prime and one matching from the proof.
  The resulting finite data $H \, theta_1 \, dots.h \, theta_H$ are independent of the later sampling length $N$;
  in particular, this use of a finite field imposes no arithmetic restriction on $N$.

== 4 Sampling and the geometry of the small values <sec:sampling>

We now sample the polynomial of Proposition 2 along quadratic paths.
  The signed packing makes the leading waves occupy disjoint arcs of the circle.
  Their modulus is consequently independent of the sampling length,
  which lets us locate its small values before constructing the correction.
  The sampling argument comes from #cite(label("OpenAIMinimal")) Section 5;
  the gap description below records the additional structure needed for the lower bound.

Recall that, for a real vector $Y = \( Y_0 \, dots.h \, Y_(N - 1) \)$, we write

$ U_Y \( t \) = 1 / sqrt(N) sum_(k = 0)^(N - 1) Y_k upright(e) \( k t \) . $

#thm([Proposition 4.1.])[
  (A structured starting construction).  #emph[Let $0 < delta < 1 \/ 100$, and put
$ K_delta = sqrt(frac(\( 1 + delta \)^3, 1 - delta)) \, wide b = 1 / 8 . $

 There are a smooth even function $B : bb(T) arrow.r \[ 0 \, K_delta \]$ and, for every positive integer $N$,
   real numbers $Y_(N \, k) in \[ - 1 \, 1 \]$ $\( 0 lt.eq k < N \)$ and a smooth function $B_N : bb(T) arrow.r
   bb(C)$ such that
#[#set math.equation(numbering: n => "(27)")
 $ B_N \( - t \) = overline(B_N \( t \)) \, wide \| B_N \( t \) \| = B \( t \) \, wide ∥U_(Y_N) - B_N∥_oo =
   O_delta \( N^(- 1) \) \,\
integral_(bb(T)) B \( t \)^2 thin d t gt.eq 1 - 7 delta \, wide 1 / N sum_(k = 0)^(N - 1) Y_(N \, k)^2 gt.eq 1 -
  8 delta quad upright("for all sufficiently large ") N . $ <eq:starting-approximation>]

 The function $B$ vanishes near $0$ and $1 \/ 2$. Its superlevel set ${ t in \[ 0 \, 1 \/ 2 \] : B \( t \) gt.eq
   b }$ is a nonempty finite union of pairwise disjoint closed intervals of positive length,
   contained in $\( 0 \, 1 \/ 2 \)$. Let $J_j = \[ u_j \, v_j \]$, $1 lt.eq j lt.eq M$,
   be the closures of its complementary intervals in $\[ 0 \, 1 \/ 2 \]$, and put
#[#set math.equation(numbering: n => "(28)")
 $ l_j = v_j - u_j > 0 \, wide L = sum_(j = 1)^M l_j \, wide 0 < L lt.eq C_0 delta \, wide C_0 =
   10 . $ <eq:starting-gaps>]

 Thus $B lt.eq b$ on the gaps $J_j$ and $B gt.eq b$ off their union.]
  #emph[An endpoint $z$ of a gap other than $0$ and $1 \/ 2$ is called a #emph[transition endpoint].
    At each such $z$, $B \( z \) = b$, and on a neighborhood $V_z
    subset \( 0 \, 1 \/ 2 \)$ there are a real constant $alpha_z$ and a real quadratic polynomial $psi_z$ such
    that, for every $N$,
#[#set math.equation(numbering: n => "(29)")
 $ B_N \( t \) = B \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] alpha_z +
   N psi_z \( t \) #scale(x: 120%, y: 120%)[\)] quad \( t in V_z \) \, wide x_z :=
   psi'_z \( z \) in \( 0 \, 1 \) . $ <eq:starting-endpoint-phase>]

 All objects except $Y_N$ and $B_N$ are fixed independently of $N$.
   Constants denoted by $O_delta$ may depend on all the data chosen for this fixed $delta$.]
] <prop:starting>

=== 4.1 A uniform formula for quadratic sums <a-uniform-formula-for-quadratic-sums>

The approximation in (27) must hold at every angle, including where a stationary point enters or leaves the
  support of a cutoff. Lemma 3 gives this uniformity; Poisson summation converts it into the following discrete formula.

#thm([Lemma 4.2.])[
  (Quadratic sampling).  #emph[Let $chi in C_c^oo \( bb(R) \)$,
    let $x_(*) in bb(R)$ and $lambda in bb(R) \\ { 0 }$, and let $J subset bb(R)$ be compact.
    For $beta in J$ and $ell in bb(Z)$, put
$ x_(beta \, ell) = x_(*) + frac(ell - beta, lambda) \, wide omega_(beta \, ell) = \( beta - ell \) x_(*) -
  frac(\( beta - ell \)^2, 2 lambda) . $

 As $N$ tends to infinity through positive integers, uniformly for $beta in J$,
#[#set math.equation(numbering: n => "(30)")
 $ & 1 / sqrt(N) sum_(k in bb(Z)) chi \( k \/ N \) upright(e) #h(-0.16667em)
   (beta k + frac(N lambda, 2) \( k \/ N - x_(*) \)^2)\
 & wide = 1 / sqrt(\| lambda \|) sum_(ell in bb(Z)) chi \( x_(beta \, ell) \) upright(e) #h(-0.16667em)
   (frac("sgn" lambda, 8) + N omega_(beta \, ell)) + O \( N^(- 1) \) . $ <eq:sampling-poisson>]

 The sum on the right has nonzero terms in one fixed finite set of indices for all $beta in J$.
   The error constant depends only on $chi \, x_(*) \, lambda \, J$.]
] <lem:sampling-poisson>

#proof[
  For $beta in J$ and $ell in bb(Z)$, define
  $ phi.alt_(beta \, ell) \( x \) = lambda / 2 \( x - x_(*) \)^2 + \( beta - ell \) x . $
  Poisson summation, applied to a smooth compactly supported function, gives
  #[#set math.equation(numbering: n => "(31)")
   $ & 1 / sqrt(N) sum_(k in bb(Z)) chi \( k \/ N \) upright(e) #h(-0.16667em)
     (beta k + frac(N lambda, 2) \( k \/ N - x_(*) \)^2)\
 & #h(30mm)  = sqrt(N) sum_(ell in bb(Z)) integral_(bb(R)) chi \( x \) upright(e) #h(-0.16667em)
   (N phi.alt_(beta \, ell) \( x \)) thin d x . $ <eq:sampling-poisson-identity>]
  The factor $N$ from the change of scale combines with the original $N^(- 1 \/ 2)$ to give $sqrt(N)$.
  Choose a fixed integer $Q$ so large that, for $\| ell \| > Q$,
  $ \| phi.alt'_(beta \, ell) \( x \) \| = \| lambda \( x - x_(*) \) + beta -
    ell \| gt.eq \| ell \| \/ 2 wide \( x in "supp" chi \, med beta in J \) . $
  Two integrations by parts have no boundary terms and give
  $ integral chi thin upright(e) \( N phi.alt_(beta \, ell) \) =
    frac(1, \( 2 pi i N \)^2) integral
    (frac(chi'', \( phi.alt'_(beta \, ell) \)^2) - frac(3 lambda chi', \( phi.alt'_(beta \, ell) \)^3) + frac(3
    lambda^2 chi, \( phi.alt'_(beta \, ell) \)^4)) upright(e) \( N phi.alt_(beta \, ell) \) . $
  Each integral is $O \( N^(- 2) \| ell \|^(- 2) \)$. The entire tail in (31) is therefore $O \( N^(- 3 \/ 2) \)$,
    uniformly in $beta$. This summable bound is needed before adding the stationary-phase errors.
  For each of the finitely many indices $\| ell \| lt.eq Q$, expand
  $ N phi.alt_(beta \, ell) \( x \) = frac(N lambda x^2, 2) - N \( ell - beta + lambda x_(*) \) x +
    frac(N lambda x_(*)^2, 2) . $
  Apply Lemma 3 with $T = N$, curvature $lambda$, and $u = N \( ell - beta + lambda x_(*) \)$.
    Its stationary point is $x_(beta \, ell)$, and $phi.alt_(beta \, ell) \( x_(beta \, ell) \) =
    omega_(beta \, ell)$. After multiplication by $sqrt(N)$, the error is $O \( N^(- 1) \)$ uniformly in $beta$.
    Increase $Q$ if necessary so that $chi \( x_(beta \, ell) \) = 0$ whenever $\| ell \| > Q$ and $beta in J$.
    Adding the finite set of leading terms and errors proves the formula. ◻
]

=== 4.2 Disjoint waves and their mass <disjoint-waves-and-their-mass>

#proof[
  Fix $delta$, and take $F$, $cal(A) = { plus.minus a_i : 1 lt.eq i lt.eq r }$, and $v$ from Proposition 2. Write
  $ F \( y \) = sum_(a in cal(A)) c_a upright(e) \( a dot.op y \) \, wide c_a = hat(F) \( a \) \, wide lambda_a =
    a dot.op v . $
  The widths $w_i = \| lambda_(a_i) \|$ satisfy $2 sum_i w_i < 1$.
    Lemma 4, with all centers negated, supplies $H gt.eq 1$ and $theta_1 \, dots.h \,
    theta_H in bb(T)^m$ such that the closed arcs
  #[#set math.equation(numbering: n => "(32)")
   $ I_(a \, h) = - a dot.op theta_h + [- frac(\| lambda_a \|, 2 H) \, frac(\| lambda_a \|, 2 H)]
     med \( mod med 1 \) \, wide a in cal(A) \, quad 1 lt.eq h lt.eq H \, $ <eq:sampling-packed-intervals>]
  are pairwise disjoint. They have length less than one and avoid $0$ and $1 \/ 2$:
    an arc containing either point would meet its distinct reflected arc $I_(- a \, h)$ there.
  Put $x_h^(*) = \( h - 1 \/ 2 \) \/ H$. Choose
  #[#set math.equation(numbering: n => "(33)")
   $ chi_h in C_c^oo #h(-0.16667em) (\( h - 1 \) \/ H \, h \/ H) \, wide 0 lt.eq chi_h lt.eq 1 \, wide
     sum_(h = 1)^H integral_(bb(R)) chi_h^2 gt.eq 1 - delta . $ <eq:sampling-cutoffs>]
  We require each $chi_h$ to be positive on a single interval;
    on that interval it strictly increases to a plateau at height one and strictly decreases after the plateau.
    The plateau has positive length. Such cutoffs exist with arbitrarily short boundary layers in each block,
    giving the last inequality in (33). Choose real lifts of the $theta_h$, and set
  #[#set math.equation(numbering: n => "(34)")
   $ Y_(N \, k) = sum_(h = 1)^H chi_h \( k \/ N \) F #h(-0.16667em)
     (k theta_h + N / 2 v \( k \/ N - x_h^(*) \)^2) \, wide 0 lt.eq k < N . $ <eq:sampling-coefficients>]
  At most one cutoff is nonzero for each $k$. Since $F$ is real and $∥∥ F_oo lt.eq 1$,
    these are real numbers in $\[ - 1 \, 1 \]$.
  For $a in cal(A)$, $1 lt.eq h lt.eq H$, and $ell in bb(Z)$, define, for $t in bb(R)$,
  #[#set math.equation(numbering: n => "(35)")
   $ u_(a \, h \, ell) \( t \) & = t + a dot.op theta_h - ell \,\
x_(a \, h \, ell) \( t \) & = x_h^(*) - frac(u_(a \, h \, ell) \( t \), lambda_a) \,\
psi_(a \, h \, ell) \( t \) & = u_(a \, h \, ell) \( t \) x_h^(*) -
  frac(u_(a \, h \, ell) \( t \)^2, 2 lambda_a) . $ <eq:sampling-phases>]
  Define the leading waves by
  #[#set math.equation(numbering: n => "(36)")
   $ B_N \( t \) = sum_(a \, h \, ell) c_a / sqrt(\| lambda_a \|) thin chi_h #scale(x: 120%, y: 120%)[\(]
     x_(a \, h \, ell) \( t \) #scale(x: 120%, y: 120%)[\)] upright(e) #h(-0.16667em)
     (frac("sgn" lambda_a, 8) + N psi_(a \, h \, ell) \( t \)) . $ <eq:sampling-leading-waves>]
  The sum is locally finite; shifting $t$ by an integer merely reindexes $ell$. It defines a smooth function on $bb(T)$.
  Expand $F$ in (34) and apply Lemma 7 with $beta = t + a dot.op theta_h$, $lambda = lambda_a$, $x_(*) = x_h^(*)$,
    and $chi = chi_h$. The sum over $k$ extends to $bb(Z)$ because the cutoffs are supported strictly inside
    $\( 0 \, 1 \)$. As $t$ ranges over a fundamental interval,
    all linear frequencies $beta$ lie in a fixed compact interval. There are only finitely many pairs $\( a \, h \)$, so
  #[#set math.equation(numbering: n => "(37)")
   $ ∥U_(Y_N) - B_N∥_oo = O_delta \( N^(- 1) \) . $ <eq:sampling-uniform-approximation>]
  For a term of (36) to be nonzero, $x_(a \, h \, ell) \( t \)$ must lie in the $h$th block. Thus
  $ \| t + a dot.op theta_h - ell \| < frac(\| lambda_a \|, 2 H) \, $
  so $t med \( mod med 1 \)$ lies in $I_(a \, h)$. Pairwise disjointness allows at most one pair $\( a \, h \)$,
    and its arc length is less than one, so at most one integer $ell$ contributes.
    Consequently $\| B_N \( t \) \|$ does not depend on $N$. It equals the smooth nonnegative function
  #[#set math.equation(numbering: n => "(38)")
   $ B \( t \) = sum_(a \, h \, ell) frac(\| c_a \|, sqrt(\| lambda_a \|)) thin chi_h #scale(x: 120%, y: 120%)[\(]
     x_(a \, h \, ell) \( t \) #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq B \( t \) lt.eq
     K_delta . $ <eq:sampling-modulus>]
  It vanishes near $0$ and $1 \/ 2$ because all its supporting arcs avoid those points.
    As $F$ is real, $c_(- a) = overline(c_a)$ and $lambda_(- a) = - lambda_a$.
    In (36), replacing $\( t \, a \, ell \)$ with $\( - t \, - a \, - ell \)$ changes $u$ to $- u$,
    keeps $x$ unchanged, and changes $psi$ and $"sgn" lambda_a$ to their negatives.
    Hence $B_N \( - t \) = overline(B_N \( t \))$, and $B$ is even.
  The disjointness also makes the mass calculation exact. On the arc indexed by $\( a \, h \)$,
    the change of variables from $x$ to $t$ has absolute Jacobian $\| lambda_a \|$. Therefore
  #[#set math.equation(numbering: n => "(39)")
   $ integral_(bb(T)) B^2 & = sum_(a in cal(A)) sum_(h = 1)^H \| c_a \|^2 integral_(bb(R)) chi_h \( x \)^2 thin d x\
 & = ∥∥ F_2^2 sum_(h = 1)^H integral_(bb(R)) chi_h^2 gt.eq \( 1 - 3 delta \)^2 \( 1 - delta \) gt.eq 1 -
   7 delta . $ <eq:sampling-mass-identity>]
  If $E_N = ∥U_(Y_N) - B_N∥_oo$, then
  $ lr(|integral_(bb(T)) \| U_(Y_N) \|^2 - integral_(bb(T)) B^2|) lt.eq E_N \( 2 K_delta + E_N \) =
    O_delta \( N^(- 1) \) . $
  Parseval now gives the second inequality in (27) for all sufficiently large $N$.
    This calculation covers repeated values of $lambda_a$, since separation occurs in the angle variable.
  ===== 4.2.1 The gaps and their endpoint phases. <the-gaps-and-their-endpoint-phases.>
  It remains to locate the small values of the fixed function $B$.
    Each arc supports one bump of height $\| c_a \| \/ sqrt(\| lambda_a \|)$.
    If this height is at least $b$, the set where that bump is at least $b$ is a closed interval of positive
    length. The positive-length plateau ensures this even when the height equals $b$.
    A lower bump, including one with $c_a = 0$, contributes no such interval.
    The supporting arcs are disjoint and avoid $0 \, 1 \/ 2$,
    so the claimed description of the superlevel set follows.
    It is nonempty because (39) gives $integral B^2 > b^2$, and evenness places a nonempty part in each
    half-circle. The closures of the complementary intervals are thus precisely the gaps $J_j$ in the statement,
    and every gap has positive length.
  Let $E = { t in bb(T) : B \( t \) < b }$. The endpoints of the finitely many intervals have measure zero,
    and evenness gives $\| E \| = 2 L$. Using $B lt.eq K_delta$ and (39),
  $ 1 - 7 delta lt.eq integral_(bb(T)) B^2 lt.eq b^2 \| E \| + K_delta^2 \( 1 - \| E \| \) . $
  Thus
  #[#set math.equation(numbering: n => "(40)")
   $ L lt.eq frac(K_delta^2 - 1 + 7 delta, 2 \( K_delta^2 - b^2 \)) lt.eq 10 delta . $ <eq:sampling-gap-measure>]
  For the last inequality, $K_delta^2 - 1 lt.eq 5 delta$ when $delta < 1 \/ 100$ and $K_delta^2 - b^2 gt.eq 1 -
    1 \/ 64$. Also $L > 0$, since $B$ vanishes on neighborhoods of $0$ and $1 \/ 2$.
  Finally, at a transition endpoint $z$, continuity gives $B \( z \) = b > 0$.
    There is a neighborhood of $z$ on which exactly one term of (36) is nonzero.
    For its fixed indices $\( a \, h \, ell \)$ choose $alpha_z in bb(R)$ with
  $ upright(e) \( alpha_z \) = frac(c_a, \| c_a \|) upright(e) #h(-0.16667em) (frac("sgn" lambda_a, 8)) \, wide
    psi_z = psi_(a \, h \, ell) . $
  This yields (29). Differentiating (35) gives
  $ psi'_z \( z \) = x_(a \, h \, ell) \( z \) in \( \( h - 1 \) \/ H \, h \/ H \) subset \( 0 \, 1 \) \, $
  because the cutoff is positive there. All data have been fixed before $N$ varies,
    and every positive integer $N$ was permitted in the construction. This completes the proof. ◻
]

== 5 A correction with small Fourier coefficients <sec:correction>

The function furnished by Proposition 6 can be small on short intervals.
  We now add a wave of fixed amplitude on each such interval. Its phase has two parts:
  $N$ times a fixed piecewise quadratic leading phase, and an affine adjustment whose slope is bounded
  independently of $N$. Where the correction meets a nonzero original wave,
  we match their leading phase derivatives and use the adjustment to match their full phase values modulo integers
  at the endpoint. Turning on the amplitude in a short strip then prevents cancellation.

On most of each gap, the leading phase derivative runs through a range reserved for that gap and its reflection.
  On these traversals, a given Fourier coefficient can receive stationary contributions from at most one gap and
  its reflection. In the oscillatory integrals, we keep the affine adjustment in the amplitude;
  it is the leading phase derivative that governs the separation.

#thm([Proposition 5.1.])[
  (Correction on short gaps).  #emph[Fix $0 < delta < 1 \/ 100$, and put
$ b = 1 / 8 \, wide K_delta = sqrt(frac(\( 1 + delta \)^3, 1 - delta)) . $

 Suppose that $B_N in C^oo \( bb(T) \; bb(C) \)$, $N in bb(N)$, satisfy $B_N \( - t \) = overline(B_N \( t \))$,
   and that their common modulus $B = \| B_N \| in C^oo \( bb(T) \)$ has the following properties.]
  + #emph[$0 lt.eq B lt.eq K_delta$, and $B$ vanishes in neighborhoods of $0$ and $1 \/ 2$. The set
$ E = { t in \[ 0 \, 1 \/ 2 \] : B \( t \) gt.eq b } $

 is a nonempty finite union of disjoint closed intervals of positive length.
   The closures of its complementary intervals are $J_j = \[ u_j \, v_j \]$, $1 lt.eq j lt.eq M$,
   with lengths $l_j = v_j - u_j > 0$, and
$ 0 < L := sum_(j = 1)^M l_j lt.eq 10 delta . $

]
  + #emph[At every endpoint $z in \( 0 \, 1 \/ 2 \)$ of a gap $J_j$, there are a neighborhood of $z$,
    a real number $alpha_z$, and a real quadratic polynomial $psi_z$, all independent of $N$, such that
$ B_N \( t \) = B \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] alpha_z +
  N psi_z \( t \) #scale(x: 120%, y: 120%)[\)] \, wide x_z := psi'_z \( z \) in \( 0 \, 1 \) . $

]
  #emph[There is an absolute constant $D$ such that, for every sufficiently large integer $N$,
    there is a continuous function $R_N : bb(T) arrow.r bb(C)$ satisfying $R_N \( - t \) = overline(R_N \( t \))$,
    supported on the gaps and their reflections, for which
#[#set math.equation(numbering: n => "(41)")
 $ b - o \( 1 \) & lt.eq \| B_N \( t \) + R_N \( t \) \| lt.eq K_delta &  & \( t in bb(T) \) \,\
max_(0 lt.eq k < N) sqrt(N) thin \| hat(R)_N \( k \) \| & lt.eq D sqrt(delta) \,\
sum_(k in bb(Z) \\ { 0 \, dots.h \, N - 1 }) \| hat(R)_N \( k \) \| & =
  O_delta \( N^(- 1 \/ 4) \) . $ <eq:corrected-envelope>]

 Every Fourier coefficient $hat(R)_N \( k \)$ is real. The threshold for $N$ and the constants implicit in
   $o \( 1 \)$ and $O_delta$ may depend on all the fixed input data; $D$ does not.]
] <prop:correction>

The hypotheses are precisely the geometric and local phase properties established in Proposition 6.
  We prove the proposition by first constructing the correction and checking its modulus,
  and then estimating its Fourier coefficients. All choices made below are fixed before $N$ tends to infinity,
  except the explicitly indexed amplitudes and phase adjustments.

=== 5.1 Assigning the phase derivatives <assigning-the-phase-derivatives>

Call the gap endpoints in $\( 0 \, 1 \/ 2 \)$ #emph[transition endpoints].
  At these points $B \( z \) = b$, and the prescribed derivative is $x_z = psi'_z \( z \)$.
  At the two remaining endpoints set $x_0 = x_(1 \/ 2) = 1 \/ 8$. For each gap choose a closed interval

$ D_j = \[ p_j \, q_j \] subset \( 1 \/ 4 \, 3 \/ 4 \) \, wide s_j := q_j - p_j = frac(l_j, 4 L) \, $

so that these intervals are pairwise disjoint and none of their endpoints equals any prescribed $x_z$.
  We call $D_j$ the derivative slot of $J_j$. Such a choice is possible because $sum_j s_j = 1 \/ 4$:
  first place the intervals with positive separations inside $\( 1 \/ 4 \, 3 \/ 4 \)$,
  and then translate them together by a sufficiently small amount avoiding the finitely many forbidden endpoint
  equalities.

We will make the leading derivative traverse $D_j$ linearly on a subinterval of length at most $l_j$,
  giving curvature at least $s_j \/ l_j = 1 \/ \( 4 L \)$. For amplitudes with uniformly bounded supremum norm and
  total variation, the quadratic estimate proved below then gives a coefficient cost $O \( sqrt(L \/ N) \)$ for
  this traversal and its reflection. The separated slots allow at most one such pair to be stationary for a given
  frequency. Joining these traversals to the prescribed endpoint derivatives may cross other ranges;
  we will control those contributions separately by using short intervals with large curvature.

Choose positive lengths $h_j^(-) \, h_j^(+) < l_j \/ 4$. Define a continuous, piecewise affine function $xi_j :
  J_j arrow.r \( 0 \, 1 \)$ by the three successive linear interpolations

$ upright("interval") & upright("endpoint values of ") xi_j\
 & x_(u_j) \, med p_j\
 & p_j \, med q_j\
 & q_j \, med x_(v_j) . $

We refer to the first and last intervals as the outer pieces and to the remaining interval as the middle piece.
  The slopes on the outer pieces are nonzero. As their lengths tend to zero,
  their absolute slopes tend to infinity. We may therefore choose these lengths so that

#[#set math.equation(numbering: n => "(42)")
 $ sum_(upright("outer pieces")\
upright("in ") \[ 0 \, 1 \/ 2 \]) \| xi'_j \|^(- 1 \/ 2) lt.eq sqrt(delta) . $ <eq:outer-slope-budget>]

There are only finitely many terms in this sum. The slope on every middle piece satisfies

#[#set math.equation(numbering: n => "(43)")
 $ d_j := frac(s_j, l_j - h_j^(-) - h_j^(+)) gt.eq frac(1, 4 L) . $ <eq:middle-slope>]

Let $phi.alt_j$ be a primitive of $xi_j$. Thus $phi.alt_j$ is $C^1$ on $J_j$ and quadratic on each of its three
  pieces. Since all the endpoint values used in the interpolations lie in $\( 0 \, 1 \)$,
  there is a fixed $c_delta > 0$ such that

#[#set math.equation(numbering: n => "(44)")
 $ c_delta lt.eq phi.alt'_j \( t \) lt.eq 1 - c_delta wide \( t in J_j \, med 1 lt.eq j lt.eq M \) .
   $ <eq:derivative-interior>]

Here and below, a subscript $delta$ allows dependence on all the fixed data.
  This compact containment will keep the Fourier mass of the correction inside the coefficient interval $0 lt.eq k < N$.

=== 5.2 Matching phases while turning on the correction <matching-phases-while-turning-on-the-correction>

Set $A = 1 \/ 2$. For each $N$, choose the endpoint values of an affine function $gamma_(j \, N) : J_j arrow.r
  bb(R)$ in $\[ 0 \, 1 \)$ so that

#[#set math.equation(numbering: n => "(45)")
 $ upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt_j \( z \) +
   gamma_(j \, N) \( z \) #scale(x: 120%, y: 120%)[\)] =
   cases(delim: "{", B_N \( z \) \/ b \, & z upright(" is a transition endpoint") \,, 1 \, & z in { 0 \, 1 \/
   2 } .) $ <eq:endpoint-phase-match>]

Any point of the unit circle has a representative with argument in $\[ 0 \, 1 \)$,
  so both endpoint conditions can be imposed independently. Their affine interpolation satisfies

#[#set math.equation(numbering: n => "(46)")
 $ \| gamma'_(j \, N) \| lt.eq l_j^(- 1) \, wide integral_(J_j) \| gamma'_(j \, N) \( t \) \| thin d t lt.eq
   1 . $ <eq:gamma-bounds>]

We turn the amplitude on over strips of width $w = w_N$. The requirements $N w^2 arrow.r
  0$ and $\( N w \)^(- 1) arrow.r 0$ will serve different purposes:
  the first preserves phase alignment on a strip, and the second makes the exterior Fourier tail tend to zero. We take

#[#set math.equation(numbering: n => "(47)")
 $ w = N^(- 3 \/ 4) . $ <eq:taper-width>]

Fix a smooth nondecreasing function $theta.alt : bb(R) arrow.r \[ 0 \, 1 \]$ with $theta.alt =
  0$ on $\( - oo \, 0 \]$ and $theta.alt = 1$ on $\[ 1 \, oo \)$.
  On $J_j$ define $r_(j \, N)$ as the product of the following factors:
  include $theta.alt \( \( t - u_j \) \/ w \)$ if $u_j$ is a transition endpoint,
  and include $theta.alt \( \( v_j - t \) \/ w \)$ if $v_j$ is a transition endpoint.
  No factor is included at $0$ or $1 \/ 2$. For large enough $N$ the two strips are disjoint,
  each lies within its outer piece, and each lies in the neighborhood where the corresponding local formula for
  $B_N$ holds. Thus $r_(j \, N) = 1$ off the transition strips, it vanishes to all orders at transition endpoints, and

#[#set math.equation(numbering: n => "(48)")
 $ 0 lt.eq r_(j \, N) lt.eq 1 \, wide integral_(J_j) \| r'_(j \, N) \( t \) \| thin d t lt.eq
   2 . $ <eq:taper-variation>]

On the positive half-circle put

#[#set math.equation(numbering: n => "(49)")
 $ R_N \( t \) =
   cases(delim: "{", A r_(j \, N) \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt_j \( t \) +
   gamma_(j \, N) \( t \) #scale(x: 120%, y: 120%)[\)] \, & t in J_j \,, 0 \, & t in.not union.big_j J_j \,)
   $ <eq:correction-definition>]

and extend it by $R_N \( - t \) = overline(R_N \( t \))$.
  At transition endpoints the amplitude is zero, while (45) gives

#[#set math.equation(numbering: n => "(50)")
 $ R_N \( 0 \) = R_N \( 1 \/ 2 \) = A . $ <eq:reflection-values>]

The extension is therefore continuous both at $0$ and at the identified points $- 1 \/ 2$ and $1 \/ 2$.
  In particular, the two points corresponding to $z = 1$ and $z = -
  1$ on the unit circle are covered by the construction. Figure 1 separates the fixed outer pieces from the
  shrinking taper strips and illustrates the use of disjoint derivative slots.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 6.55), [#text(size: 9pt)[\(a\) One interior gap $J_j=[u_j,v_j]$]], anchor: "west", padding: 0.1176cm)
  rect((1.4, 4.1), (8.4, 5), fill: rgb("#f7f7ff"), stroke: none)
  rect((1.4, 0.65), (1.65, 5.9), fill: rgb("#ffeede"), stroke: none)
  rect((8.15, 0.65), (8.4, 5.9), fill: rgb("#ffeede"), stroke: none)
  line((0.9, 3.2), (0.9, 5.95), stroke: (paint: rgb("#404040"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  line((1.15, 3.2), (8.95, 3.2), stroke: (paint: rgb("#404040"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((8.95, 3.2), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  content((0.65, 6.15), [#text(size: 9pt)[$xi_j= phi_j'$]], anchor: "west", padding: 0.1176cm)
  line((0.9, 4.1), (2.2, 4.1), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.9, 5), (7.6, 5), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.82, 4.1), [#text(size: 9pt)[$p_j$]], anchor: "east", padding: 0.1176cm)
  content((0.82, 5), [#text(size: 9pt)[$q_j$]], anchor: "east", padding: 0.1176cm)
  line((2.2, 3.2), (2.2, 4.1), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((7.6, 3.2), (7.6, 5), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.4, 5.65), (2.2, 4.1), stroke: (paint: rgb("#262626"), thickness: 1.15pt, miter-limit: 10))
  line((2.2, 4.1), (7.6, 5), stroke: (paint: rgb("#0000a6"), thickness: 1.15pt, miter-limit: 10))
  line((7.6, 5), (8.4, 3.9), stroke: (paint: rgb("#262626"), thickness: 1.15pt, miter-limit: 10))
  circle((1.4, 5.65), radius: 0.04762, fill: rgb("#262626"), stroke: none)
  circle((2.2, 4.1), radius: 0.04762, fill: rgb("#262626"), stroke: none)
  circle((7.6, 5), radius: 0.04762, fill: rgb("#262626"), stroke: none)
  circle((8.4, 3.9), radius: 0.04762, fill: rgb("#262626"), stroke: none)
  content((1.55, 5.6), [#text(size: 9pt)[$x_(u_j)$]], anchor: "west", padding: 0.07056cm)
  content((8.4, 3.9), [#text(size: 9pt)[$x_(v_j)$]], anchor: "west", padding: 0.07056cm)
  content((4.95, 5.18), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$xi_j'=d_j gt.eq 1"/"(4L)$]]], anchor: "south", padding: 0.1176cm)
  line((1.4, 3.26), (1.4, 3.14), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.4, 3.26), (8.4, 3.14), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.4, 3.13), [#text(size: 9pt)[$u_j$]], anchor: "north", padding: 0.1176cm)
  content((8.4, 3.13), [#text(size: 9pt)[$v_j$]], anchor: "north", padding: 0.1176cm)
  line((1.4, 2.6), (2.2, 2.6), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#595959")), end: (symbol: ">>", fill: rgb("#595959"))))
  content((1.8, 2.529), [#text(size: 9pt)[$h_j^-$]], anchor: "north", padding: 0.1176cm)
  line((2.2, 2.6), (7.6, 2.6), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#595959")), end: (symbol: ">>", fill: rgb("#595959"))))
  content((4.9, 2.529), [#text(size: 9pt)[middle piece]], anchor: "north", padding: 0.1176cm)
  line((7.6, 2.6), (8.4, 2.6), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#595959")), end: (symbol: ">>", fill: rgb("#595959"))))
  content((8, 2.529), [#text(size: 9pt)[$h_j^+$]], anchor: "north", padding: 0.1176cm)
  line((0.9, 0.65), (0.9, 1.95), stroke: (paint: rgb("#404040"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  line((1.15, 0.65), (8.95, 0.65), stroke: (paint: rgb("#404040"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((8.95, 0.65), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  content((0.82, 1.73), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  content((0.82, 0.65), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  content((4.9, 1.15), [#text(fill: rgb("#994d00"))[#text(size: 9pt)[$r_(j,N)$]]])
  bezier((1.4, 0.65), (1.65, 1.73), (1.535, 0.65), (1.515, 1.73), stroke: (paint: rgb("#994d00"), thickness: 1.1pt, miter-limit: 10))
  line((1.65, 1.73), (8.15, 1.73), stroke: (paint: rgb("#994d00"), thickness: 1.1pt, miter-limit: 10))
  bezier((8.15, 1.73), (8.4, 0.65), (8.285, 1.73), (8.265, 0.65), stroke: (paint: rgb("#994d00"), thickness: 1.1pt, miter-limit: 10))
  line((1.65, 0.65), (1.65, 1.73), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((8.15, 0.65), (8.15, 1.73), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.4, 0.3), (1.65, 0.3), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  line((8.15, 0.3), (8.4, 0.3), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  line((1.4, 0.24), (1.4, 0.36), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  line((1.65, 0.24), (1.65, 0.36), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  line((8.15, 0.24), (8.15, 0.36), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  line((8.4, 0.24), (8.4, 0.36), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10))
  content((1.525, 0.2), [#text(size: 9pt)[$w$]], anchor: "north", padding: 0.1176cm)
  content((8.275, 0.2), [#text(size: 9pt)[$w$]], anchor: "north", padding: 0.1176cm)
  content((10.05, 6.55), [#text(size: 9pt)[\(b\) Derivative slots]], anchor: "west", padding: 0.1176cm)
  line((10.4, 1.6), (10.4, 6), stroke: (paint: rgb("#404040"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((10.75, 6.05), [#text(size: 9pt)[derivative value]], anchor: "west", padding: 0.1176cm)
  line((10.34, 1.6), (10.46, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.28, 1.6), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  line((10.34, 2.675), (10.46, 2.675), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.28, 2.675), [#text(size: 9pt)[$frac(1, 4)$]], anchor: "east", padding: 0.1176cm)
  line((10.34, 4.825), (10.46, 4.825), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.28, 4.825), [#text(size: 9pt)[$frac(3, 4)$]], anchor: "east", padding: 0.1176cm)
  line((10.34, 5.9), (10.46, 5.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.28, 5.9), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  rect((11.15, 2.71), (11.75, 3.26), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  rect((11.15, 3.36), (11.75, 4.16), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  rect((11.15, 4.26), (11.75, 4.825), fill: rgb("#f7f7f7"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((11.45, 2.85), (11.45, 3.12), stroke: (paint: rgb("#0000a6"), thickness: 3.0pt, miter-limit: 10))
  line((11.45, 3.5), (11.45, 4.02), stroke: (paint: rgb("#0000a6"), thickness: 3.0pt, miter-limit: 10))
  line((11.45, 4.4), (11.45, 4.685), stroke: (paint: rgb("#0000a6"), thickness: 3.0pt, miter-limit: 10))
  content((11.98, 2.985), [#text(size: 9pt)[$D_a$]], anchor: "west", padding: 0.1176cm)
  content((11.98, 3.76), [#text(size: 9pt)[$D_j=[p_j,q_j]$]], anchor: "west", padding: 0.1176cm)
  content((11.98, 4.543), [#text(size: 9pt)[$D_b$]], anchor: "west", padding: 0.1176cm)
  line((10.4, 4.11), (14.65, 4.11), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  circle((11.45, 4.11), radius: 0.05292, fill: black, stroke: none)
  content((14.7, 4.11), [#text(size: 9pt)[$k"/"N$]], anchor: "west", padding: 0.1176cm)
  content((12.65, 1), [#box(width: 4.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[At most one slot is close to $k"/"N$.]]])])
})],
  caption: [Figure 1: Schematic of the correction. In (a), the leading phase derivative $xi_j = phi.alt'_j$ matches the prescribed endpoint values and traverses $D_j$ on the middle piece. The outer lengths $h_j^plus.minus$ are fixed; the shaded taper strips have shrinking width $w = N^(- 3 \/ 4)$, enlarged here. The lower curve shows the amplitude factor for an interior gap. In (b), the dashed neighborhoods of the slots are fixed and disjoint. At most one middle piece and its reflection can have a leading phase derivative close to $k \/ N$; all other middle pieces are nonstationary. ],
) <fig:gap-slots>

On a gap outside its transition strips, the reverse triangle inequality gives

$ \| B_N + R_N \| gt.eq A - b = 3 / 8 . $

To check a transition strip at $z$, compare the phases after subtracting their values at $z$.
  Since $phi.alt'_j \( z \) = psi'_z \( z \)$ and both derivatives are Lipschitz near $z$,

$ \| phi.alt_j \( t \) - phi.alt_j \( z \) - psi_z \( t \) + psi_z \( z \) #scale(x: 120%, y: 120%)[\|] lt.eq
  C_delta \| t - z \|^2 . $

Together with (46) and the endpoint phase agreement, this shows that the two phases differ, modulo an integer,
  by at most

#[#set math.equation(numbering: n => "(51)")
 $ C_delta \( N w^2 + w \) = O_delta \( N^(- 1 \/ 2) \) . $ <eq:phase-strip-error>]

Consequently, throughout that strip,

$ B_N \( t \) + R_N \( t \) = upright(e) #scale(x: 120%, y: 120%)[\(] alpha_z +
  N psi_z \( t \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] B \( t \) + A r_(j \, N) \( t \) +
  O_delta \( N^(- 1 \/ 2) \) #scale(x: 120%, y: 120%)[\)] . $

Because $B \( z \) = b$ and $B$ is fixed and smooth, $B \( t \) gt.eq b - O_delta \( w \)$ there.
  This proves the lower bound $b - o \( 1 \)$ on every strip.
  Off the gaps, $R_N = 0$ and $B gt.eq b$, and reflection preserves all these modulus bounds.
  The upper bound is simpler: on gaps $\| B_N + R_N \| lt.eq b + A = 5 \/ 8 < K_delta$,
  and elsewhere it is at most $K_delta$. This proves (41).

The correction now gives the required lower envelope. The remaining task is to show that its Fourier coefficients
  cost only $O \( sqrt(delta) \)$ on the scale $N^(- 1 \/ 2)$ and that discarding frequencies outside ${ 0 \,
  dots.h \, N - 1 }$ changes it uniformly by $o \( 1 \)$.

=== 5.3 A bound for each Fourier coefficient <a-bound-for-each-fourier-coefficient>

Split the integral for $hat(R)_N \( k \)$ into the three pieces of every gap and their reflections.
  On a positive piece its contribution has the form

#[#set math.equation(numbering: n => "(52)")
 $ integral_I a \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt \( t \) -
   k t #scale(x: 120%, y: 120%)[\)] thin d t \, wide a \( t \) =
   A r_(j \, N) \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] gamma_(j \, N) \( t \)
   #scale(x: 120%, y: 120%)[\)] \, quad phi.alt = phi.alt_j \|_I . $ <eq:piece-integral>]

On the reflected piece we use $phi.alt \( t \) = - phi.alt_j \( - t \)$ and $a \( t \) =
  overline(A r_(j \, N) \( - t \) upright(e) \( gamma_(j \, N) \( - t \) \))$.
  In particular, the reflected phase derivative is

#[#set math.equation(numbering: n => "(53)")
 $ phi.alt' \( t \) = xi_j \( - t \) . $ <eq:reflected-derivative>]

Thus the original and reflected middle pieces use the same slot $D_j$. By (46) and (48), on every piece

#[#set math.equation(numbering: n => "(54)")
 $ sup_I \| a \| + integral_I \| a' \( t \) \| thin d t lt.eq A + 2 A + 2 pi A = : C_1 . $ <eq:amplitude-bv>]

This constant is absolute, even if a gap is very short or there are many gaps.

We use two elementary oscillatory integral estimates. If $phi.alt$ is quadratic with $phi.alt'' = d eq.not 0$, then

#[#set math.equation(numbering: n => "(55)")
 $
   lr(|integral_I a \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt \( t \) - k t
   #scale(x: 120%, y: 120%)[\)] thin d t|) lt.eq C / sqrt(N \| d \|) (sup_I \| a \| + integral_I \| a' \|) .
   $ <eq:quadratic-integral>]

Indeed, completing the square and scaling reduce the integral without $a$ over any subinterval to an integral of
  $upright(e) \( plus.minus u^2 \/ 2 \)$, multiplied by $\( N \| d \| \)^(- 1 \/ 2)$.
  Those integrals are uniformly bounded: on $\[ - 1 \, 1 \]$ use length,
  and on each exterior half-line integrate by parts using the phase derivative $plus.minus u$.
  Integration against a primitive then proves (55). We also use the first-derivative bound

#[#set math.equation(numbering: n => "(56)")
 $
   lr(|integral_I a \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt \( t \) - k t
   #scale(x: 120%, y: 120%)[\)] thin d t|) lt.eq frac(C, N rho) (sup_I \| a \| + integral_I \| a' \|)
   $ <eq:first-derivative-integral>]

when $N phi.alt' - k$ is monotone and has absolute value at least $N rho$ on $I$.
  One integration by parts proves this bound, since the total variation of $1 \/ \( N phi.alt' - k \)$ is at most
  $2 \/ \( N rho \)$.

Let $C_2$ be the absolute constant obtained by combining (54) with (55).
  The outer pieces and their reflections contribute at most

$ frac(2 C_2 sqrt(delta), sqrt(N)) $

by (42). For the middle pieces choose a fixed $rho > 0$ so that the closed $rho$-neighborhoods of the finitely
  many slots $D_j$ are disjoint. For any $k$, at most one slot is within distance $rho$ of $k \/ N$.
  On that middle piece and its reflection, (55) and (43) give a total bound

$ frac(4 C_2 sqrt(L), sqrt(N)) . $

On all remaining middle pieces, $\| N phi.alt' - k \| gt.eq N rho$,
  so (56) bounds their total contribution by $O_delta \( N^(- 1) \)$, uniformly in $k$.
  The number of pieces and the separation $rho$ enter only this last error. We conclude that

$ sqrt(N) thin \| hat(R)_N \( k \) \| lt.eq 2 C_2 sqrt(delta) + 4 C_2 sqrt(L) + O_delta \( N^(- 1 \/ 2) \) . $

Since $L lt.eq 10 delta$, for sufficiently large $N$ this is at most $D sqrt(delta)$ with, for example, $D =
  2 C_2 + 4 sqrt(10) C_2 + 1$. This proves (41) with an absolute constant. Hermitian symmetry also gives

$ overline(hat(R)_N \( k \)) = integral_(bb(T)) overline(R_N \( t \)) upright(e) \( k t \) thin d t =
  integral_(bb(T)) R_N \( - t \) upright(e) \( k t \) thin d t = hat(R)_N \( k \) . $

=== 5.4 The Fourier mass outside the coefficient interval <the-fourier-mass-outside-the-coefficient-interval>

Let $k < 0$ or $k gt.eq N$, and write $T = N + \| k \|$. On each piece in (52), set

$ V \( t \) = N phi.alt' \( t \) - k . $

The derivative containment (44), also valid on reflected pieces by (53), implies

#[#set math.equation(numbering: n => "(57)")
 $ \| V \( t \) \| gt.eq c_delta T \, wide \| V' \( t \) \| lt.eq C_delta N \, wide V'' \( t \) =
   0 $ <eq:exterior-derivatives>]

on each piece interior, after decreasing $c_delta$ if necessary.
  The scaled smooth steps and the affine phase adjustments give

#[#set math.equation(numbering: n => "(58)")
 $ sup_I \| a' \| lt.eq C_delta w^(- 1) \, wide integral_I \| a'' \( t \) \| thin d t lt.eq
   C_delta w^(- 1) . $ <eq:amplitude-two-derivatives>]

For the second estimate, the term of size $w^(- 2)$ from a differentiated step is supported on a strip of length
  $w$; the other terms are bounded using (46). Recall also the absolute bounds on $sup \| a \|$ and $integral \|
  a' \|$ in (54).

One integration by parts on a piece gives

#[#set math.equation(numbering: n => "(59)")
 $ integral_I a thin upright(e) \( N phi.alt - k t \) =
   [frac(a thin upright(e) \( N phi.alt - k t \), 2 pi i V)]_(partial I) -
   frac(1, 2 pi i) integral_I \( a \/ V \)' thin upright(e) \( N phi.alt - k t \) . $ <eq:first-ibp-tail>]

The boundary terms in this first integration cancel when all pieces are summed.
  At a join within a gap, the numerator is the continuous function $R_N \( t \)
  upright(e) \( - k t \)$ and the denominator agrees because $phi.alt'_j$ is continuous.
  At transition endpoints the numerator vanishes. At $0$, the reflected and original phase derivatives both equal
  $x_0$, and the numerator has the common value $A$. Finally, at the identified endpoints $- 1 \/ 2$ and $1 \/ 2$,
  both phase derivatives equal $x_(1 \/ 2)$ and the numerator has the common value $A \( - 1 \)^k$.
  Thus cancellation holds on the full circle, including the two reflection joins.

For a second integration by parts define, on each piece,

$ Q = frac(\( a \/ V \)', V) = a' / V^2 - frac(a V', V^3) . $

No cancellation of the new boundary terms is needed. Using $V'' = 0$,

#[#set math.equation(numbering: n => "(60)")
 $ Q' = a'' / V^2 - frac(3 a' V', V^3) + frac(3 a \( V' \)^2, V^4) . $ <eq:second-ibp-algebra>]

Equations (57) and (58) bound the endpoint values of $Q$ by

$ C_delta (w^(- 1) / T^2 + N / T^3) $

and the integral of $\| Q' \|$ by

$ C_delta (w^(- 1) / T^2 + N / T^3 + N^2 / T^4) . $

Summing over the fixed finite number of pieces in (59), and integrating its remaining integrals once more,
  therefore gives

$ \| hat(R)_N \( k \) \| lt.eq C_delta (w^(- 1) / T^2 + N / T^3 + N^2 / T^4) lt.eq
  frac(C_delta w^(- 1), \( N + \| k \| \)^2) . $

Since $sum_(k < 0 upright(" or ") k gt.eq N) \( N + \| k \| \)^(- 2) = O \( N^(- 1) \)$, we obtain

$ sum_(k < 0 upright(" or ") k gt.eq N) \| hat(R)_N \( k \) \| lt.eq C_delta \( N w \)^(- 1) =
  O_delta \( N^(- 1 \/ 4) \) \, $

as asserted in (41). This completes the proof of Proposition 8. $square.stroked.tiny$

In particular, the Fourier series of $R_N$ is absolutely convergent. Its sum equals $R_N$:
  both are continuous and have the same Fourier coefficients, so uniqueness of Fourier coefficients applies. Hence

#[#set math.equation(numbering: n => "(61)")
 $ sup_(t in bb(T)) lr(|R_N \( t \) - sum_(k = 0)^(N - 1) hat(R)_N \( k \) upright(e) \( k t \)|) =
   O_delta \( N^(- 1 \/ 4) \) . $ <eq:correction-projection>]

We may therefore add the correction using only the required consecutive degrees, with a uniform error tending to zero.

== 6 Rounding with a small defect mass <sec:rounding>

The uniform rounding error bounds the loss in the lower modulus and the increase in the upper modulus.
  The following estimate controls that error in terms of the total distance of the relaxed coefficients from
  signs. We give the full argument from #cite(label("OpenAIMinimal")) Section 6.
  Its discrepancy input belongs to Spencer’s partial-coloring method #cite(label("Spencer1985"));
  the precise real-vector theorem used below is due to Lovett and Meka #cite(label("LovettMeka2015")) Theorem 4 of
  arXiv:1203.5747v2.

#thm([Lemma 6.1.])[
  (Rounding with a small defect).  #emph[There is an absolute constant $C$ with the following property.
    Let $N gt.eq 1$ be an integer and let $X = \( X_0 \, dots.h \, X_(N - 1) \) in \[ - 1 \, 1 \]^N$. Put
$ mu \( X \) = 1 / 2 sum_(k = 0)^(N - 1) \( 1 - \| X_k \| \) . $

 Then there are signs $epsilon_0 \, dots.h \, epsilon_(N - 1)$ satisfying
#[#set math.equation(numbering: n => "(62)")
 $ max_(t in bb(T)) lr(|sum_(k = 0)^(N - 1) \( epsilon_k - X_k \) upright(e) \( k t \)|) lt.eq
   C (1 + sqrt(mu \( X \) log frac(80 N, mu \( X \)))) . $ <eq:defect-rounding>]

 The square-root term is defined to be zero when $mu \( X \) = 0$.
   In that case one may take $epsilon = X$, giving zero error.]
] <lem:rounding>

We first obtain a discrepancy estimate for arbitrary real matrices.
  We then round the coefficient defects on successively coarser dyadic grids.
  At every scale a simultaneous reversal of the discrepancy signs keeps the total defect mass from increasing.
  This controls how many coordinates can move and yields the dependence on $mu \( X \)$.

=== 6.1 A discrepancy bound for real matrices <a-discrepancy-bound-for-real-matrices>

#thm([Lemma 6.2.])[
  #emph[There is an absolute constant $C_0$ such that, for integers $1 lt.eq s lt.eq
    R$ and a real matrix $B in \[ - 1 \, 1 \]^(R times s)$, there is a vector $xi in { - 1 \, 1 }^s$ satisfying
$ ∥B xi∥_oo lt.eq C_0 sqrt(s log \( 2 R \/ s \)) . $

]
] <lem:rounding-matrix>

#proof[
  We use the following existential consequence of the Lovett–Meka theorem #cite(label("LovettMeka2015")) Theorem 4
    of arXiv:1203.5747v2. Given vectors $v_1 \, dots.h \, v_R in bb(R)^u$,
    a starting point $x_0 in \[ - 1 \, 1 \]^u$, and nonnegative numbers $c_1 \, dots.h \, c_R$ such that
  $ sum_(i = 1)^R exp \( - c_i^2 \/ 16 \) lt.eq u \/ 16 \, $
  there exists, for every sufficiently small $eta > 0$, a point $x in \[ - 1 \, 1 \]^u$ with
  $ \| chevron.l v_i \, x - x_0 chevron.r \| lt.eq c_i ∥v_i∥_2 quad \( 1 lt.eq i lt.eq R \) \,
    wide \| x_k \| gt.eq 1 - eta quad upright("for at least ") u \/ 2 upright(" coordinates ") k . $
  The cited theorem finds such a point with positive probability; we use only its existence assertion.
    Letting $eta$ tend to zero and taking a convergent subsequence in the compact cube gives a point with at least
    $ceil.l u \/ 2 ceil.r$ coordinates equal to signs and the same discrepancy bounds.
    Indeed, there are only finitely many choices of these coordinates,
    and all the displayed inequalities are closed under limits.
  Start at zero in $\[ - 1 \, 1 \]^s$. At a stage with $u$ coordinates not yet equal to signs,
    restrict the rows of $B$ to those coordinates, take their current values as $x_0$, and choose
  $ c_i = 4 sqrt(log \( 16 R \/ u \)) wide \( 1 lt.eq i lt.eq R \) . $
  The threshold sum is exactly $u \/ 16$, and every restricted row has Euclidean norm at most $sqrt(u)$.
    Thus this step changes each row sum by at most $4 sqrt(u log \( 16 R \/ u \))$ and fixes at least half the
    remaining coordinates. Leave the fixed coordinates unchanged and repeat. Zero rows impose no restriction.
    The process terminates with a sign vector.
  If $u_h$ is the number of remaining coordinates before step $h$, starting with $h = 0$, then $u_h lt.eq
    2^(- h) s$. The function $u log \( 16 R \/ u \)$ is increasing for $0 < u lt.eq R$.
    With $L = log \( 16 R \/ s \) gt.eq log 16$, the sum of the row errors is therefore at most
  $ 4 sum_h sqrt(u_h log \( 16 R \/ u_h \)) & lt.eq 4 sqrt(s L) sum_(h = 0)^oo 2^(- h \/ 2) sqrt(1 + frac(h log 2, L))\
 & lt.eq 4 sqrt(s L) sum_(h = 0)^oo 2^(- h \/ 2) sqrt(1 + h \/ 4) . $
  The last series converges, and $log \( 16 R \/ s \) lt.eq 4 log \( 2 R \/ s \)$ for $s lt.eq R$.
    This proves the lemma with an absolute constant, including when $s = R$. ◻
]

=== 6.2 Dyadic rounding and the Fourier error <dyadic-rounding-and-the-fourier-error>

Apply the matrix estimate to real and imaginary Fourier evaluations on a grid of $20 N$ points.
  After dyadic rounding, a derivative bound for the error polynomial will transfer the estimate to the whole circle.

#proof[
  Let $X = \( X_0 \, dots.h \, X_(N - 1) \) in \[ - 1 \, 1 \]^N$ and $mu = 1 / 2 sum_k \( 1 - \| X_k \| \)$.
    If $mu = 0$, every $X_k$ is already a sign, and we take $epsilon_k = X_k$.
    Suppose henceforth that $0 < mu lt.eq N \/ 2$. Set
  $ sigma_k = cases(delim: "{", 1 \, & X_k gt.eq 0 \,, - 1 \, & X_k < 0 \,) wide p_k = frac(1 - \| X_k \|, 2) . $
  Then $X_k = sigma_k \( 1 - 2 p_k \)$, $0 lt.eq p_k lt.eq 1 \/ 2$, and $sum_k p_k = mu$.
    In particular, this definition includes $X_k = 0$.
  Put $M = 20 N$ and $R = 2 M = 40 N$. For the grid points $t_ell = ell \/ M$, $0 lt.eq ell < M$,
    define the real $R times N$ matrix $A$ by
  $ A_(2 ell \, k) = sigma_k cos \( 2 pi k t_ell \) \, wide A_(2 ell + 1 \, k) =
    sigma_k sin \( 2 pi k t_ell \) quad \( 0 lt.eq k < N \) . $
  Its entries belong to $\[ - 1 \, 1 \]$, and every selection of its columns has at most $N lt.eq R$ columns.
  Choose an integer $J gt.eq 1$ with $N 2^(- J) lt.eq 1$, and first round down:
  $ p_k^(\( J \)) = 2^(- J) floor.l 2^J p_k floor.r . $
  This does not increase the mass, and
  #[#set math.equation(numbering: n => "(63)")
   $ ∥A \( p^(\( J \)) - p \)∥_oo lt.eq sum_k \| p_k^(\( J \)) - p_k \| lt.eq N 2^(- J) lt.eq
     1 . $ <eq:rounding-initial>]
  We next construct $p^(\( j - 1 \))$ from $p^(\( j \))$, for $j = J \, J - 1 \, dots.h \, 1$.
    Intermediate entries may exceed $1 \/ 2$, but it is enough to keep them in $\[ 0 \, 1 \]$,
    whose endpoints encode the two choices of final sign. We preserve the two properties
  $ p^(\( j \)) in \( \[ 0 \, 1 \] ∩ 2^(- j) bb(Z) \)^N \, wide sum_k p_k^(\( j \)) lt.eq mu . $
  Let $S_j$ be the set of coordinates for which $2^j p_k^(\( j \))$ is odd, and let $s_j = \| S_j \|$.
    If $s_j = 0$, no change is needed. Otherwise apply Lemma 10 to the columns indexed by $S_j$,
    obtaining signs $xi_k$. Replace all these signs by their negatives if necessary so that $sum_(k in S_j) xi_k
    lt.eq 0$, and define
  $ p_k^(\( j - 1 \)) =
    cases(delim: "{", p_k^(\( j \)) + 2^(- j) xi_k \, & k in S_j \,, p_k^(\( j \)) \, & k in.not S_j .) $
  An odd integer in $\[ 0 \, 2^j \]$ lies between $1$ and $2^j - 1$;
    adding either sign therefore gives an even integer still in $\[ 0 \, 2^j \]$.
    Thus the new vector belongs to $\( \[ 0 \, 1 \] ∩ 2^(- \( j - 1 \)) bb(Z) \)^N$.
    Its mass does not increase, and the simultaneous sign reversal has left the discrepancy unchanged.
    The step error is consequently at most
  #[#set math.equation(numbering: n => "(64)")
   $ ∥A \( p^(\( j - 1 \)) - p^(\( j \)) \)∥_oo lt.eq C_0 thin 2^(- j) sqrt(s_j log \( 80 N \/ s_j \))
     wide \( s_j > 0 \) . $ <eq:rounding-step>]
  Every coordinate in $S_j$ is at least $2^(- j)$, so the mass bound gives
  $ s_j lt.eq min \( N \, 2^j mu \) . $
  This is where the total defect enters the estimate. Put $U_j = 2^j mu$ and $L_mu = log \( 80 N \/ mu \)$.
    The function $f \( s \) = s log \( 80 N \/ s \)$ is increasing on $\( 0 \, N \]$. If $U_j lt.eq N$, then
  $ f \( s_j \) lt.eq f \( U_j \) = U_j log \( 80 N \/ U_j \) lt.eq U_j L_mu . $
  If $U_j > N$, then, using $mu lt.eq N \/ 2$,
  $ f \( s_j \) lt.eq N log 80 lt.eq U_j L_mu . $
  These estimates apply at every nonempty stage. Summing (64) and (63) therefore gives, for $p' =
    p^(\( 0 \)) in { 0 \, 1 }^N$,
  #[#set math.equation(numbering: n => "(65)")
   $ ∥A \( p' - p \)∥_oo & lt.eq 1 + C_0 sqrt(mu L_mu) sum_(j = 1)^oo 2^(- j \/ 2)\
 & = 1 + frac(C_0, sqrt(2) - 1) sqrt(mu log \( 80 N \/ mu \)) . $ <eq:rounding-matrix-error>]
  Empty stages contribute zero, without invoking the discrepancy bound with no columns.
  Now set $epsilon_k = sigma_k \( 1 - 2 p'_k \) in { - 1 \, 1 }$ and define the error polynomial
  $ Q \( z \) = sum_(k = 0)^(N - 1) \( epsilon_k - X_k \) z^k = - 2 sum_(k = 0)^(N - 1) sigma_k \( p'_k - p_k \) z^k . $
  By the definition of $A$, the real and imaginary parts of $Q \( upright(e) \( t_ell \) \)$ each have absolute
    value at most $2 ∥A \( p' - p \)∥_oo$. Hence
  #[#set math.equation(numbering: n => "(66)")
   $ G := max_(0 lt.eq ell < M) \| Q \( upright(e) \( t_ell \) \) \| lt.eq
     2 sqrt(2) thin ∥A \( p' - p \)∥_oo . $ <eq:rounding-grid>]
  It remains to pass from this grid bound to the whole circle. We apply this step only to $Q$, the rounding error.
  Write $S = max_(\| z \| = 1) \| Q \( z \) \|$. If $Q = 0$, there is nothing to prove.
    Otherwise let $d lt.eq N - 1$ be its degree. Applying the maximum principle to $Q$ on the unit disk and to the
    reversed polynomial $z^d Q \( 1 \/ z \)$ gives
  $ \| Q \( z \) \| lt.eq S max \( 1 \, \| z \|^d \) \, wide max_(\| z \| lt.eq 1 + 1 \/ N) \| Q \( z \) \| lt.eq
    exp \( 1 \) S . $
  Cauchy’s estimate on the disk of radius $1 \/ N$ centered at a point of the unit circle yields $\| Q' \( z \) \|
    lt.eq exp \( 1 \) N S$ there. Consequently
  $ lr(|frac(d, d t) Q \( upright(e) \( t \) \)|) lt.eq 2 pi exp \( 1 \) N S . $
  Every point of $bb(T)$ has circular distance at most $1 \/ \( 2 M \)$ from the grid.
    Integrating this derivative along the shorter arc gives
  $ S lt.eq G + frac(pi exp \( 1 \), 20) S \, wide S lt.eq frac(G, 1 - pi exp \( 1 \) \/ 20) . $
  The denominator is positive. Combining this inequality with (66) and (65) proves Lemma 9,
    with an absolute constant. The same argument covers $N = 1$, when the error polynomial is constant. ◻
]

== 7 Proof of the main theorem <sec:completion>

We now combine the construction with the rounding estimate. The order of the choices is important:
  the accuracy parameter fixes all auxiliary data, and only then does the length tend to infinity.

#proof[
  Let $b = 1 \/ 8$ and let $D > 0$ be the absolute constant in Proposition 8.
    For a fixed sufficiently small $delta > 0$, take the real coefficients $Y_(N \, k)$ and the functions $B_N$
    from Proposition 6, and the correction $R_N$ from Proposition 8.
    All estimates below hold for every sufficiently large integer $N$. Put
  $ s_delta = D sqrt(delta) \, wide S_delta = 1 + s_delta \, wide X_(N \, k) =
    frac(Y_(N \, k) + sqrt(N) thin hat(R)_N \( k \), S_delta) quad \( 0 lt.eq k < N \) . $
  Conjugate symmetry of $R_N$ makes $hat(R)_N \( k \)$ real.
    Since $\| Y_(N \, k) \| lt.eq 1$ and $sqrt(N) \| hat(R)_N \( k \) \| lt.eq s_delta$,
    the vector $X_N$ belongs to $\[ - 1 \, 1 \]^N$. The uniform approximation in Proposition 6 and the exterior
    Fourier-tail estimate in Proposition 8 give
  #[#set math.equation(numbering: n => "(67)")
   $ U_(X_N) \( t \) = frac(B_N \( t \) + R_N \( t \), S_delta) + o \( 1 \) wide
     upright("uniformly for ") t in bb(T) . $ <eq:completion-profile>]
  Consequently,
  #[#set math.equation(numbering: n => "(68)")
   $ min_(t in bb(T)) \| U_(X_N) \( t \) \| gt.eq b / S_delta - o \( 1 \) \, wide ∥U_(X_N)∥_oo lt.eq K_delta +
     o \( 1 \) . $ <eq:completion-envelope>]
  In the second inequality we used $S_delta gt.eq 1$.
  The same coefficient bound controls the cost of rounding. Directly,
  $ \| X_(N \, k) - Y_(N \, k) \| = frac(\| sqrt(N) thin hat(R)_N \( k \) - s_delta Y_(N \, k) \|, S_delta) lt.eq
    2 s_delta . $
  Both coefficients lie in $\[ - 1 \, 1 \]$, so $\| X_(N \, k)^2 - Y_(N \, k)^2 \| lt.eq 4 s_delta$.
    Using the mean-square estimate from Proposition 6 and $1 - \| x \| lt.eq 1 - x^2$ for $\| x \| lt.eq 1$, we obtain
  #[#set math.equation(numbering: n => "(69)")
   $ frac(mu \( X_N \), N) lt.eq frac(1, 2 N) sum_(k = 0)^(N - 1) \( 1 - X_(N \, k)^2 \) lt.eq 4 delta +
     2 D sqrt(delta) = : q_delta . $ <eq:completion-defect>]
  Choose $delta$ small enough that $q_delta < 1 \/ 2$. The function $q mapsto q
    log \( 80 \/ q \)$ is increasing on $\( 0 \, 1 \/ 2 \]$. Lemma 9 therefore supplies signs $epsilon_0 \,
    dots.h \, epsilon_(N - 1)$ with
  #[#set math.equation(numbering: n => "(70)")
   $ ∥U_epsilon - U_(X_N)∥_oo lt.eq C / sqrt(N) + C sqrt(q_delta log \( 80 \/ q_delta \)) . $ <eq:completion-rounding>]
  If $mu \( X_N \) = 0$, we instead take $epsilon_k = X_(N \, k)$, so this bound also covers that case.
  Fix $c = 1 \/ 16$ once and for all. As $delta arrow.b 0$,
  $ b / S_delta - C sqrt(q_delta log \( 80 \/ q_delta \)) arrow.r 1 / 8 \, wide K_delta +
    C sqrt(q_delta log \( 80 \/ q_delta \)) arrow.r 1 . $
  For any prescribed $eta > 0$, first choose $delta$ so small that the first expression is strictly larger than
    $c$ and the second is strictly smaller than $1 + eta$. Fix every construction datum associated with this
    $delta$. We may then choose $N_0$ so that for every $N gt.eq
    N_0$ all preceding estimates hold and the errors in (68) and (70) are smaller than these strict margins.
    It follows that
  $ c lt.eq \| U_epsilon \( t \) \| lt.eq 1 + eta wide \( t in bb(T) \) . $
  Multiplication by $sqrt(N)$ gives the asserted polynomial.
    Rounding assigns a real sign to each of the consecutive indices $0 \, dots.h \, N - 1$;
    all estimates include $t = 0$ and $t = 1 \/ 2$ and hold through every sufficiently large integer length. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
