#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Interior regularity of planar \
Mumford--Shah minimizers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The planar Mumford–Shah problem balances smoothness of a function against the length of a set across which it may
  jump. Its regularity conjecture predicts that, in the interior,
  this set consists of regular arcs with only free endpoints and triple junctions.
  We prove this interior conclusion for the absolute comparison problem defined below.
  The proof also gives local finiteness of the global connected components of the closed set.

=== 1.1 The variational problem <sec:problem>

Let $Omega subset bb(R)^2$ be a bounded Lipschitz domain and let $g in L^oo \( Omega \)$ be real-valued.
  We write $cal(H)^1$ for one-dimensional Hausdorff measure. A pair $\( u \, K \)$ is #emph[admissible] if

$ K subset Omega upright(" is relatively closed") \, wide cal(H)^1 \( K \) < oo \, wide u in L^2 \( Omega \) \,
  wide u \|_(Omega \\ K) in W^(1 \, 2) \( Omega \\ K \) . $

No rectifiability of $K$ is assumed. Values of $u$ on $K$ do not affect any integral. For open $V subset Omega$, set

#[#set math.equation(numbering: n => "(1.1)")
 $ cal(F)_g \( u \, K \; V \) = integral_(V \\ K) \| nabla u \|^2 thin d x + cal(H)^1 \( K ∩ V \) +
   integral_V \| u - g \|^2 thin d x . $ <eq:original-energy>]

Here and below, $V subset.double Omega$ means that $overline(V)$ is a compact subset of $Omega$.

An admissible pair is an #emph[absolute minimizer] if, for every open $V subset.double
  Omega$ and every admissible $\( w \, L \)$ with

#[#set math.equation(numbering: n => "(1.2)")
 $ \( L triangle.stroked.t K \) union "spt" \( w - u \) subset.double V \, $ <eq:compact-comparison>]

one has $cal(F)_g \( u \, K \; V \) lt.eq cal(F)_g \( w \, L \; V \)$.
  The support of a function is understood in the essential sense. The pair is #emph[reduced] if

#[#set math.equation(numbering: n => "(1.3)")
 $ K = "spt"_Omega \( cal(H)^1 #h(-0.16667em) corner.l.b K \) . $ <eq:reduced>]

Equivalently, every disk centered at a point of $K$ and compactly contained in $Omega$ contains a positive length
  of $K$. This removes closed additions of zero length that have no effect on the energy.

=== 1.2 Main theorem <main-theorem>

#thm([Theorem 1.1.])[
  #emph[Let $\( u \, K \)$ be a reduced absolute minimizer of (1.1) in a bounded Lipschitz domain $Omega subset
    bb(R)^2$, with $g in L^oo \( Omega \)$. Every $x in K$ has an interior neighborhood in which $K$ has one of
    the following forms, with $C^(1 \, alpha)$ arcs for some $alpha > 0$:]
  + #emph[a single embedded arc with $x$ in its interior;]
  + #emph[a single embedded arc ending at $x$;]
  + #emph[three embedded arcs meeting only at $x$, with pairwise angles $120$ degrees.]
  #emph[Moreover, for every open $U subset.double Omega$,
#[#set math.equation(numbering: n => "(1.4)")
 $ \# { C in pi_0 \( K \) : C ∩ U eq.not diameter } < oo \, $ <eq:component-finiteness>]

 where $pi_0 \( K \)$ denotes the set of global connected components of $K$.]
] <thm:main>

The theorem gives the interior regularity conclusion of the planar Mumford–Shah conjecture.
  The compact-set qualification is essential to the scope of the statement:
  we make no assertion about finiteness up to $partial Omega$.
  The components counted in (1.4) are components of $K$, rather than of a truncation $K ∩ U$ or of its complement.

The geometric conclusion also gives an endpoint integrability estimate for the gradient. Corollary 12 proves

$ nabla u in L_(upright("loc"))^(4 \, oo) \( Omega \) \, wide
  nabla u in L_(upright("loc"))^p \( Omega \) quad \( 0 < p < 4 \) . $

Here weak $L^4$ means that the area of the gradient superlevel set ${ \| nabla u \| >
  t }$ in each relatively compact region is bounded by a constant times $t^(- 4)$.
  The exponent reflects the inverse-square-root gradient at a crack tip.

=== 1.3 History and related work <history-and-related-work>

Mumford and Shah introduced their functional as a model for image segmentation #cite(label("mumford_shah1989")).
  The fidelity term keeps the reconstruction close to the observed image,
  the Dirichlet term favors smooth variation within regions, and the length term penalizes the edges between them.
  Their regularity conjecture asks whether minimization itself forces the simple interior geometry suggested by
  this model. Deriving that geometry requires controlling arbitrary finite-length discontinuity sets,
  including possible accumulation of their components.

The theory of special functions of bounded variation provides the weak variational framework for this problem.
  De Giorgi and Ambrosio introduced this free-discontinuity setting #cite(label("degiorgi_ambrosio1988")),
  and Ambrosio developed the compactness and existence theory #cite(label("ambrosio1989"))
  #cite(label("ambrosio1990")). The existence and essential-closure results of De Giorgi, Carriero, and Leaci,
  together with the Dirichlet theory of Carriero and Leaci,
  connect weak minimizers with the classical closed-set formulation #cite(label("degiorgi_carriero_leaci1989"))
  #cite(label("carriero_leaci1990")). We use this connection to establish rectifiability of the given set before
  applying geometric regularity theory. The underlying bounded-variation extension and trace calculus are treated
  systematically in Ambrosio, Fusco, and Pallara #cite(label("ambrosio_fusco_pallara2000")).

Bonnet introduced the planar blow-up and monotonicity approach and classified global minimizers with connected
  crack set #cite(label("bonnet1996")) Theorems 2.2, 3.1, and 4.1.
  Regular-arc and partial-regularity theory was developed independently by David and by Ambrosio, Fusco,
  and Pallara #cite(label("david1996")) #cite(label("ambrosio_fusco_pallara1997"));
  David also established the triple-junction theory and developed its quantitative geometric framework
  #cite(label("david1996")) #cite(label("david2005")). Bonnet and David proved global minimality of the crack tip
  and classification when the part outside one connected component is bounded #cite(label("bonnet_david2001")).
  David and Léger proved that a global minimizer whose crack disconnects the plane must be a line or a
  $120$-degree triod #cite(label("david_leger2002")) Corollary 9.16.
  In the generalized-limit formulation recalled below, these classification results leave the possible bounded
  components of a limiting crack as the remaining obstruction.
  Higher-integrability theorems of De Lellis–Focardi in the plane and De Philippis–Figalli in arbitrary dimension
  supplied further control of the exceptional set #cite(label("delellis_focardi2013"))
  #cite(label("dephilippis_figalli2014")).

Regularity at an endpoint requires additional analysis. Work of Andersson and Mikayelyan on crack tips
  #cite(label("andersson_mikayelyan2019")) was revisited by De Lellis, Focardi,
  and Ghinassi #cite(label("delellis_focardi_ghinassi2021")) #cite(label("delellis_focardi_ghinassi_erratum")).
  For the bounded measurable fidelity datum used here, we invoke the exact geometric regularity and compactness
  statements in the monograph of De Lellis and Focardi #cite(label("delellis_focardi2025")).
  Recent work of Labourie and Lemenant establishes at most three limiting values and controls local components of
  the complement #cite(label("labourie_lemenant2026")). The component count in Theorem 1 concerns the closed crack
  set itself.

Deangelis’s recent preprint gives a proof of the global classification and the resulting interior arc, endpoint,
  and triple-junction structure #cite(label("deangelis2026")) Theorems 1.1 and 3.4.
  His compact-translation argument combines relaxed second variations, equality in a planar Hodge identity,
  and holomorphic rigidity. Both arguments use whole-plane projections and value variations with independently
  prescribed one-sided traces on a regular arc; see #cite(label("deangelis2026")) Section 3.2.
  The proof below obtains a scalar harmonic interaction from finite translations and an explicit cutoff at
  infinity; minimality forces this interaction to be constant.

=== 1.4 Proof strategy <proof-strategy>

We first pass from the stated finite-length formulation to a locally bounded, rectifiable minimizing pair.
  The reduction uses clipping inside disks and a Dirichlet comparison with smooth approximations of the boundary
  trace; it preserves the original pair.

At an interior point $x$, the rescaled closed sets $\( K - x \) \/ r_j$, with $r_j arrow.b 0$,
  have global generalized limits $H$. These are limits of absolute minimizers,
  with additive constants in each complementary component recorded as part of the limiting data.
  The established compactness and rigidity theorems reduce their classification to excluding a bounded component
  when $bb(R)^2 \\ H$ is connected. In this case the limit function $v$ is an absolute minimizer of the
  zero-fidelity energy on the whole plane.

A bounded component can be enlarged to a compact piece $A subset H$ at positive distance from $B = H \\ A$.
  We split the gradient of $v$ into a field carrying the jumps across $A$ and the gradient of a harmonic potential
  that extends through $A$. Translating $A$ leaves its length unchanged.
  The interaction between these two fields is harmonic in the translation parameter;
  minimality forces it to be constant. Independent changes in the jump values along a regular subarc of $A$ then
  force this harmonic potential to be affine. The energy growth bound makes its gradient zero;
  the value-variation identity then makes the remaining field zero. Removing $A$ saves positive length, a contradiction.

The known classification now gives only a line, a halfline or three rays for a nonempty blow-up set.
  Epsilon regularity transfers these models to the original minimizer.
  Finally, a finite cover of $K ∩ overline(U)$ by connected model neighborhoods proves (1.4).
  The resulting absence of irregular points also yields the local weak-$L^4$ gradient estimate through the De
  Lellis–Focardi equivalence.

The reduction occupies Section 2, and Section 3 records the compactness and regularity results used below.
  Sections 4 and 5 establish the compact-piece exclusion. Section 6 completes the classification,
  proves Theorem 1, and derives the weak-$L^4$ consequence.

== 2 Reduction to rectifiable minimizers <sec:initial-reduction>

The admissible class in the problem does not assume that the closed set is rectifiable or that the function is
  bounded. We establish both properties locally before using the classical regularity theory.
  The essential point is that a portion of the closed set which carries no jump can be removed by a Dirichlet
  replacement, with an arbitrarily small error on the boundary of the replacement disk.

We use the following standard notation. A function is in $B
  V \( W \)$ if its distributional derivative is a finite vector-valued Radon measure on $W$.
  Its derivative decomposes into an absolutely continuous part, a jump part, and a Cantor part.
  The jump part is concentrated on the approximate jump set $J_u$,
  where two distinct one-sided approximate limits exist across a line.
  The space $S B V \( W \)$ consists of the $B V$ functions whose Cantor part vanishes.
  We use two basic facts from the $B V$ structure theorem: $J_u$ is countably $1$-rectifiable (covered,
  up to a set of zero length, by countably many Lipschitz images of intervals),
  and the Cantor part gives zero mass to every set of $sigma$-finite $cal(H)^1$ measure
  #cite(label("ambrosio_fusco_pallara2000")) Theorem 3.78 and Proposition 3.92(c).
  The same notation with the subscript $upright("loc")$ requires these properties on relatively compact open subsets.

#thm([Proposition 2.1.])[
  (Reduction to a rectifiable pair).  #emph[Let $Omega subset bb(R)^2$ be bounded and open,
    let $g in L^oo \( Omega \)$, and let $\( u \, K \)$ be an admissible absolute minimizer for $cal(F)_g$ as
    defined in Section 1.1. In particular, $K$ is relatively closed, $cal(H)^1 \( K \) < oo$,
    and $u in L^2 \( Omega \) ∩ W^(1 \, 2) \( Omega \\ K \)$; no rectifiability of $K$ is assumed. Then
$ u in L_(upright("loc"))^oo \( Omega \) ∩ S B V_(upright("loc")) \( Omega \) \, wide cal(H)^1 \( K \\ J_u \) = 0 . $

 The function satisfies $Delta u = u - g$ on $Omega \\ K$ and has there a $C_(upright("loc"))^(1 \, alpha)$
   representative for every $alpha in \( 0 \, 1 \)$. If the pair is reduced, then
#[#set math.equation(numbering: n => "(2.1)")
 $ K = "spt"_Omega \( cal(H)^1 #h(-0.16667em) corner.l.b J_u \) = overline(J_u)^(thin Omega) . $ <eq:jump-support>]

 Consequently, in the reduced case, on every smooth open set $W subset.double Omega$,
   the restricted pair is a reduced rectifiable absolute minimizer with bounded function.]
] <prop:initial-reduction>

The proof uses a standard Dirichlet theorem in the $S B V$ formulation. We record the precise version needed here.
  Its weak minimizer is an auxiliary replacement: essential closure will turn its jump set into an admissible
  closed comparison set, allowing us to test the original pair.
  For a disk $D$ and $w in C_c^1 \( bb(R)^2 \)$, consider the functional

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(J)_D \( z \) := integral_D #scale(x: 120%, y: 120%)[\(] \| nabla z \|^2 + \| z -
   g \|^2 #scale(x: 120%, y: 120%)[\)] thin d x + cal(H)^1 \( J_z ∩ overline(D) \) $ <eq:weak-dirichlet-energy>]

on $z in S B V \( bb(R)^2 \)$ satisfying $z = w$ almost everywhere on $bb(R)^2 \\ D$.
  Here $J_z$ is the jump set of the extension to the whole plane.
  In particular, a mismatch of boundary traces is charged in (2.2).

#thm([Lemma 2.2.])[
  (The smooth-data Dirichlet input).  #emph[Let $D subset bb(R)^2$ be a disk, $g in L^oo \( D \)$,
    and $w in C_c^1 \( bb(R)^2 \)$. The problem (2.2) has a bounded minimizer $z$, and
#[#set math.equation(numbering: n => "(2.3)")
 $ cal(H)^1 #scale(x: 120%, y: 120%)[\(] \( overline(J_z) \\ J_z \) ∩ overline(D) #scale(x: 120%, y: 120%)[\)] =
   0 . $ <eq:dirichlet-essential-closure>]

 In particular, $C := overline(J_z) ∩ overline(D)$ is compact and has finite length,
   and $z$ belongs to $W_(upright("loc"))^(1 \, 2)$ on the complement of $overline(J_z)$.
   On each relatively open portion of $partial D$ disjoint from $C$,
   its interior and exterior Sobolev traces agree almost everywhere.]
] <lem:dirichlet-input>

This is the smooth-boundary, smooth-exterior-data case of the Dirichlet existence and essential-closure theorem;
  see #cite(label("delellis_focardi2025")) Appendix B, specifically Theorem B.3.1(c), Corollary B.3.2(b),
  and Proposition B.4.2(c). The final two assertions also follow directly from the $S B V$ decomposition:
  on an open set which misses the closed jump set there is no singular derivative,
  while the absolutely continuous gradient is square integrable.
  Across a jump-free boundary portion, apply this observation to the whole-plane extension $z$,
  whose exterior value is $w$.

We explain explicitly why the boundary in (2.3) introduces no extra length.
  The boundary density theorem supplies a positive lower bound for $cal(H)^1 \( J_z ∩ B_r \( x \) \) \/ r$ as $r
  arrow.b 0$ at points $x in overline(J_z) ∩ partial D$. Put $mu =
  cal(H)^1 #h(-0.16667em) corner.l.b J_z$ and $nu = cal(H)^1 #h(-0.16667em) corner.l.b partial D$.
  The restriction of $mu$ to the circle is $nu #h(-0.16667em) corner.l.b \( J_z ∩ partial D \)$,
  while its remaining part is singular with respect to $nu$.
  Differentiation of measures, together with $nu \( B_r \( x \) \) \/ \( 2 r \) arrow.r 1$, gives

$ frac(mu \( B_r \( x \) \), r) arrow.r 0 quad upright("for ") cal(H)^1 upright("-almost every ") x in partial
  D \\ J_z . $

This contradicts the boundary lower bound at any such point in the closed jump set.
  Hence the boundary portion of the difference in (2.3) is null.
  The interior portion is the usual interior essential-closure theorem.
  No $C^1$ matching of normal derivatives across $partial D$ is used.

#proof[
  We divide the argument into local boundedness, the $S B V$ extension, and removal of excess length.
  #emph[Step 1: circles with bounded traces.] Variations $u + t phi$, with $phi in C_c^oo \( Omega \\ K \)$,
    preserve the admissible class and have compact support. Their first variation gives
  $ integral_(Omega \\ K) nabla u dot.op nabla phi + \( u - g \) phi thin d x = 0 . $
  Thus $Delta u = u - g$ off $K$. In two dimensions, local $W^(1 \, 2)$ membership implies local $L^p$ membership
    for every finite $p$. Interior elliptic estimates therefore give $u in
    W_(upright("loc"))^(2 \, p) \( Omega \\ K \)$ for all such $p$,
    and hence the asserted $C_(upright("loc"))^(1 \, alpha)$ regularity. We use this representative off $K$ from now on.
  Fix $q in Omega$. For almost every radius $s$ with $overline(B)_s \( q \) subset Omega$,
    the following two properties hold:
  #[#set math.equation(numbering: n => "(2.4)")
   $ Sigma_s := K ∩ partial B_s \( q \) upright(" is finite") \, wide
     integral_(partial B_s \( q \) \\ K) \( \| u \|^2 + \| nabla u \|^2 \) thin d cal(H)^1 < oo . $ <eq:good-circle>]
  The first assertion is Eilenberg’s coarea inequality applied to the $1$-Lipschitz distance map on a Borel set of
    finite $cal(H)^1$ measure. It requires no rectifiability. The second follows from polar integration.
    To recall the elementary content of the first inequality,
    cover a compact portion of $K$ by sets of diameter less than $delta$.
    On each distance level, every $delta$-separated collection contains at most one point in each covering set.
    The image of a covering set lies in an interval no longer than its diameter.
    Integration over the levels, followed by refinement of the covers and $delta arrow.b 0$,
    bounds the integral of the level cardinality by the length of the covered set.
  Call a disk satisfying (2.4) a good disk. The circle minus $Sigma_s$ consists of finitely many open arcs.
    On each arc the restriction of $u$ is $C^1$, and its tangential derivative is square integrable by (2.4).
    It is therefore a one-dimensional $W^(1 \, 2)$ function and has finite one-sided limits at the arc endpoints.
    Its supremum is finite. Taking the maximum over the finitely many arcs shows that the circle trace $f$ is
    bounded. If $Sigma_s$ is empty, the same conclusion follows from $W^(1 \, 2)$ on the full circle.
  #emph[Step 2: local boundedness by clipping.] Fix a good disk $B = B_s \( q \)$ and choose
  $ M > max { parallel f parallel_oo \, parallel g parallel_oo } . $
  Let $T_M \( a \) = max { - M \, min { a \, M } }$ and set
  $ tilde(u) = T_M \( u \) quad upright("in ") B \, wide tilde(u) = u quad upright("in ") Omega \\ B . $
  The traces agree on $partial B \\ K$. Sobolev gluing there, together with the chain rule for $T_M$,
    shows that $tilde(u) in W^(1 \, 2) \( Omega \\ K \) ∩ L^2 \( Omega \)$.
    Its difference from $u$ is supported in $overline(B)$. Choose an open $V$ with $overline(B) subset.double V
    subset.double Omega$ and use $\( tilde(u) \, K \)$ in the defining comparison on $V$.
    The Dirichlet term does not increase, and the fidelity term strictly decreases wherever $\| u \| > M$ in $B$.
    For example, on ${ u > M }$ the decrease is $\( u - M \) \( u + M - 2 g \) > 0$.
    Minimality therefore gives $\| u \| lt.eq M$ almost everywhere in $B$.
    Good disks exist with arbitrarily small radii about every point.
    A finite cover of each compact subset of $Omega$ proves $u in L_(upright("loc"))^oo \( Omega \)$.
  #emph[Step 3: the $S B V$ extension.] We give the finite-ball extension argument underlying
    #cite(label("ambrosio_fusco_pallara2000")) Proposition 4.4; it requires no rectifiability of the closed set.
    Choose smooth open sets $W subset.double W' subset.double Omega$.
    The definition of $cal(H)^1$ and compactness give finite covers of $K ∩
    overline(W)$ by open balls of radii $a_(i j)$ such that
  $ max_i a_(i j) arrow.r 0 \, wide sum_i a_(i j) lt.eq C \( 1 + cal(H)^1 \( K \) \) \, wide
    overline(G_j) subset W' \, quad G_j := union.big_i B_(a_(i j)) . $
  Their areas tend to zero and their perimeters satisfy $"Per" \( G_j \) lt.eq 2 pi sum_i a_(i j)$.
    Moreover, $partial G_j ∩ W$ misses $K$, since the open union covers $K ∩ overline(W)$.
    Set $u_j = 0$ on $G_j ∩ W$ and $u_j = u$ elsewhere in $W$.
    Integration by parts along the exposed circular arcs gives
  $ \| D u_j \| \( W \) lt.eq integral_(W \\ K) \| nabla u \| thin d x +
    2 pi parallel u parallel_(L^oo \( W' \)) sum_i a_(i j) . $
  This estimate can equivalently be read as the finite-perimeter product rule.
    Test fields compactly supported in $W$ produce no term on $partial W$.
    Since $u_j arrow.r u$ in $L^1 \( W \)$, lower semicontinuity proves $u in B V \( W \)$.
  Off $K$ the derivative is absolutely continuous, so its Cantor part is supported on $K$.
    That part vanishes on sets of finite $cal(H)^1$ measure, and hence it vanishes everywhere in $W$.
    Thus $u in S B V_(upright("loc")) \( Omega \)$. Continuity off $K$ gives $J_u subset K$.
    Finally, $K$ has area zero, so the absolutely continuous gradient in the $S B
    V$ decomposition agrees almost everywhere with the original off-set gradient.
  We have now placed the function in the weak admissible class.
    It remains to show that the original closed set has exactly the length charged by the jump set.
  #emph[Step 4: smooth boundary data and Dirichlet replacement.] Fix a good disk $D =
    B_s \( q \)$ and its trace $f$. Choose closed finite unions of circle arcs $E_m subset partial
    D$ containing the finite set $Sigma_s = K ∩ partial D$ in their relative interiors, with
  $ ell_m := cal(H)^1 \( E_m \) arrow.r 0 . $
  There are $C^1$ functions $a_m$ on the circle which agree with $f$ outside $E_m$:
    on each short arc interpolate the endpoint values and first tangential derivatives,
    and keep $f$ on the remaining arcs. A radial collar and cutoff extend $a_m$ to a function $w_m in
    C_c^1 \( bb(R)^2 \)$. Each such extension has bounded first derivatives; no bound uniform in $m$ is needed.
    Let $z_m$ be the minimizer in Lemma 3 for exterior datum $w_m$.
  The function equal to $u$ in $D$ and to $w_m$ outside $D$ is in $S B
    V \( bb(R)^2 \)$ by the trace gluing formula #cite(label("ambrosio_fusco_pallara2000")) Theorems 3.84
    and 3.87, Corollary 3.89. Its jump set on the circle is contained, up to a null set, in $E_m$. Consequently,
  #[#set math.equation(numbering: n => "(2.5)")
   $ cal(J)_D \( z_m \) lt.eq integral_D #scale(x: 120%, y: 120%)[\(] \| nabla u \|^2 + \| u -
     g \|^2 #scale(x: 120%, y: 120%)[\)] thin d x + cal(H)^1 \( J_u ∩ D \) + ell_m . $ <eq:dirichlet-replacement-bound>]
  Put
  $ C_m = overline(J_(z_m)) ∩ overline(D) \, wide L_m = \( K \\ D \) union C_m union E_m \, wide v_m =
    cases(delim: "{", z_m & upright("in ") D \,, u & upright("in ") Omega \\ D .) $
  The set $L_m$ is relatively closed and has finite length by (2.3).
    The function $v_m$ is locally $W^(1 \, 2)$ away from $L_m$.
    Near a circle point outside $L_m$, the interior trace of $z_m$ matches $w_m$ almost everywhere by Lemma 3,
    and that datum matches $u$ because this boundary portion lies outside $E_m$.
    This verifies Sobolev gluing at every possible seam. The function and its gradient have finite global $L^2$
    norms, so $v_m in W^(1 \, 2) \( Omega \\ L_m \) ∩ L^2 \( Omega \)$.
  Both $L_m Delta K$ and $"spt" \( v_m - u \)$ lie in $overline(D)$.
    We may therefore compare in any open $V$ with $overline(D) subset.double V subset.double Omega$.
    Outside $D$ the volume terms agree, and the unchanged portion of $K$ has the same length.
    Since $K ∩ partial D$ is finite, it has zero length. Using (2.3), minimality and (2.5) give
  $ cal(H)^1 \( K ∩ D \) & lt.eq cal(J)_D \( z_m \) + ell_m -
    integral_D #scale(x: 120%, y: 120%)[\(] \| nabla u \|^2 + \| u - g \|^2 #scale(x: 120%, y: 120%)[\)] thin d x\
 & lt.eq cal(H)^1 \( J_u ∩ D \) + 2 ell_m . $
  The two boundary errors have distinct sources: one charges the mismatched weak trace,
    and the other inserts $E_m$ in the closed comparison set.
    Letting $m arrow.r oo$ and using $J_u subset K$ proves $cal(H)^1 \( \( K \\ J_u \) ∩ D \) = 0$.
    A countable good-disk cover of $Omega$ yields $cal(H)^1 \( K \\ J_u \) = 0$.
  #emph[Step 5: reduced support and restriction.] If $K$ is reduced, equality of the two length measures gives
  $ K = "spt"_Omega \( cal(H)^1 #h(-0.16667em) corner.l.b K \) =
    "spt"_Omega \( cal(H)^1 #h(-0.16667em) corner.l.b J_u \) . $
  The support of the jump-length measure is contained in the relative closure of $J_u$,
    while $J_u subset K$ and relative closedness give the reverse containment in $K$. Thus
  $ K = "spt"_Omega \( cal(H)^1 #h(-0.16667em) corner.l.b J_u \) subset overline(J_u)^(thin Omega) subset K \, $
  which proves (2.1). Rectifiability follows from the rectifiability of $J_u$ and the nullity of $K \\ J_u$.
  Finally, in the reduced case, restrict to a smooth $W subset.double Omega$.
    Every compactly supported comparison in $W$ extends by the original pair outside $W$,
    with an unchanged collar. Thus absolute minimality is preserved.
    Reducedness is local and is preserved as well, and the boundedness assertion follows from Step 2.
    This also matches the locally Sobolev comparison class of the classical theory.
    A competitor of finite energy has square-integrable gradient and, on its bounded comparison region $V$, satisfies
  $ integral_V \| w \|^2 lt.eq 2 integral_V \| w - g \|^2 + 2 \| V \| thin parallel g parallel_oo^2 . $
  It has finite crack length there and agrees with the original pair on the unchanged collar.
    Extension therefore gives an admissible competitor in the original global $L^2$ and $W^(1 \, 2)$ class.
    A competitor of infinite energy cannot improve the original finite energy. ◻
]

== 3 Planar compactness and regularity facts <sec:known-facts>

We recall the precise form of the planar theory used below.
  The distinction between an absolute minimizer and a generalized limit matters only until we know that the
  complement of the limiting set is connected.

For a closed rectifiable set $H subset bb(R)^2$ of locally finite length and a function $v in
  W^(1 \, 2) \( D \\ H \)$ for each bounded open $D$, define

$ E_0 \( v \, H \; V \) = integral_(V \\ H) \| nabla v \|^2 thin d x + cal(H)^1 \( H ∩ V \) . $

An absolute minimizer of $E_0$ satisfies the comparison inequality for all pairs in this local class agreeing
  outside a compact subset of $V$, for every bounded open $V subset.double bb(R)^2$.

In the compactness theorem, $\( u_j \, K_j \)$ denotes a sequence of rescaled minimizing pairs and $H$ is the
  local Hausdorff limit of their closed sets. Write $D_k$, with $k$ in a countable index set,
  for the connected components of the limiting complement and choose reference points $z_k in D_k$.
  Local Hausdorff convergence places each fixed $z_k$ off $K_j$ for all sufficiently large $j$,
  where the regular representative of $u_j$ is available. On each $D_k$ the function $u_j$ is normalized by
  subtracting $u_j \( z_k \)$. In addition to the normalized limiting harmonic functions, retain the limits

$ p_(k l) = lim_(j arrow.r oo) #scale(x: 120%, y: 120%)[\(] u_j \( z_k \) -
  u_j \( z_l \) #scale(x: 120%, y: 120%)[\)] in \[ - oo \, oo \] . $

Write $v$ for the function given by these normalized limits on the components.
  The resulting object is a triple $\( v \, H \, { p_(k l) } \)$.
  Throughout this paper, #emph[generalized minimizer] means a limit of #emph[reduced absolute] minimizers in the
  sense of #cite(label("delellis_focardi2025")) Definition 2.2.4;
  a #emph[global] generalized minimizer has limiting domain $bb(R)^2$.
  We use this specific class, including its information about finite relative constants.

\[3\]

#thm([Proposition 3.1.])[
  (The planar theory used here).  #emph[The following facts hold.]
  + #emph[ Let $\( u \, K \)$ be a reduced, rectifiable absolute minimizer of the fidelity functional in an open
    set $Omega subset bb(R)^2$, with bounded fidelity datum and locally bounded $u$.
    For each $x in K$ and each sequence $r_j arrow.b 0$, a subsequence of
$ K_j = frac(K - x, r_j) \, wide u_j \( y \) = frac(u \( x + r_j y \), sqrt(r_j)) $

 on the expanding domains $\( Omega - x \) \/ r_j$ has a global generalized limit $\( v \, H \, { p_(k l) } \)$.
   The sets converge locally in the bilateral Hausdorff sense.
   The set $H$ is closed, rectifiable, locally of finite length,
   and is the support of $cal(H)^1 #h(-0.16667em) corner.l.b H$; moreover $0 in H$.
   For every bounded open $D subset.double bb(R)^2$, $v in W^(1 \, 2) \( D \\ H \)$.]
  + #emph[ If a global generalized minimizer has connected complement $D = bb(R)^2 \\ H$,
    then $\( v \, H \)$ is an absolute minimizer of the homogeneous energy $E_0$ under every compactly supported
    change. In particular, changes whose support meets $H$ are allowed.]
  + #emph[ Every global generalized minimizer has a reduced, closed, rectifiable set $H$ of locally finite length,
    and $v in W^(1 \, 2) \( D \\ H \)$ for every bounded open $D subset.double bb(R)^2$.
    There are positive dimensional constants $c \, C$ such that
$ c r lt.eq cal(H)^1 \( H ∩ B_r \( y \) \) lt.eq C r quad \( y in H \, med r > 0 \) \, $

$ integral_(B_R \\ H) \| nabla v \|^2 thin d x lt.eq 2 pi R quad \( R > 0 \) . $

 Almost every point of $H$ with respect to $cal(H)^1$ has a neighborhood in which the entire set is a single $C^1$ arc.]
  + #emph[ A global generalized minimizer has at most one unbounded connected component of its closed set.
    If its closed set disconnects the plane, that set is a line or three half-lines meeting at $120$ degrees.
    If all but at most one connected component of its closed set lie in one compact set, the set is empty, a line,
    three half-lines meeting at $120$ degrees, or a half-line.]
  + #emph[ There are $alpha in \( 0 \, 1 \)$ and $epsilon > 0$ with the following property,
    with the constants chosen for the fixed bounds on the fidelity datum.
    Suppose that a reduced absolute minimizer is defined in a neighborhood of $overline(B_(2 s) \( x \))$,
    where $s lt.eq 1$. If its closed set in $B_(2 s) \( x \)$ has bilateral Hausdorff distance less than $epsilon
    s$ from a diameter, a radius, or three radii meeting at $120$ degrees,
    then its entire intersection with $B_s \( x \)$ is $C^(1 \, alpha)$-diffeomorphic to that model.
    Any three arcs meeting in the smaller ball meet at $120$ degrees.
    The endpoint or junction in this conclusion need not be the original center $x$.]
] <prop:planar-facts>

All references in this paragraph are to the 4 January 2025 author version of De Lellis–Focardi
  #cite(label("delellis_focardi2025")). Item Proposition 3.1 uses Assumption 2.2.1,
  Theorem 2.2.3 and Definition 2.2.4, together with the lower density bound in Theorem 2.1.3.
  Item Proposition 3.1 specializes Definition 2.2.2(ii) and Theorem 2.2.3(ii).
  For Item Proposition 3.1, Lemma 2.1.2 and equation (1.4.1) give the total homogeneous energy bound $2 pi R$;
  Theorem 2.1.3 gives lower density. The almost-everywhere arc assertion follows from Theorem 1.5.2(i),(v),
  which applies to generalized minimizers: the irregular part has dimension less than one,
  and the triple junctions and regular loose ends form a discrete set.
  These sets have zero length; every remaining point has a neighborhood consisting of a single regular arc.
  For Item Proposition 3.1, Corollary 4.4.3 bounds the number of unbounded components,
  Theorem 4.4.1 treats a disconnected complement, and Theorem 1.4.6 treats a common compact remainder.
  Item Proposition 3.1 is Theorem 1.3.3, including its endpoint and junction conclusions.
  We explain two applications whose hypotheses will be important.

For Proposition 3.1, fix an ambient open set $W subset.double Omega$ containing $x$.
  Apply the compactness theorem to the constant sequence of original minimizers on $W$, with $lambda_j = 1$,
  $x_j = x$, and $r_j arrow.b 0$. Local boundedness supplies the uniform bound on the #emph[unscaled] functions
  required by Assumption 2.2.1 of the reference; the rescaled domains exhaust $bb(R)^2$.
  Theorem 2.2.3 supplies $v in W^(1 \, 2) \( D \\ H \)$ on each bounded open $D$,
  including square integrability up to $H$. This stronger conclusion is part of the compactness theorem,
  not a consequence of componentwise local convergence alone.
  It permits multiplication by smooth cutoffs whose support meets $H$, as required in Section 5.
  The density lower bound and length convergence ensure that the Hausdorff limit remains reduced.
  Indeed, at a limit point choose convergent points of $K_j$, apply the lower bound in a small ball around them,
  and pass to a slightly larger ball whose boundary has zero limiting length.
  Thus every neighborhood of that limit point has positive length.
  The inclusion $0 in H$ also follows directly from $0 in K_j$.

For Proposition 3.1, recall that a topological competitor in #cite(label("delellis_focardi2025")) Definition 2.2.2
  must preserve the separation of exterior points which belong to different components of the original complement.
  When that complement is connected, there are no such pairs of points.
  Every admissible compact change therefore satisfies the separation condition,
  and Theorem 2.2.3(ii) of that reference gives absolute minimality on the whole plane.
  In particular, the support of a change may meet $H$. This is the comparison class used in the compact-piece
  argument; no condition of vanishing trace on $H$ is imposed.

== 4 Isolating a compact piece <sec:isolation>

A bounded component need not be separated from the rest of a closed set.
  The following lemma enlarges it to a separated compact piece without losing connectedness of the complement
  after removal.

#thm([Lemma 4.1.])[
  (Isolating a compact piece).  #emph[Let $H subset bb(R)^2$ be closed, locally of finite length,
    and equal to the support of $cal(H)^1 #h(-0.16667em) corner.l.b H$.
    Every nonempty bounded connected component of $H$ is contained in a nonempty compact subset $A subset
    H$ such that, with $B = H \\ A$,
$ B upright(" is closed") \, wide "dist" \( A \, B \) > 0 \, wide 0 < cal(H)^1 \( A \) < oo . $

 Here the distance to the empty set is interpreted as infinity.
   If $bb(R)^2 \\ H$ is connected, $bb(R)^2 \\ B$ is connected.]
] <lem:compact-isolation>

#proof[
  Let $C$ be the given component. It is compact, so choose $R$ with $C subset B_R$ and set $X =
    H ∩ overline(B_R)$. The component in $X$ of any $p in C$ is exactly $C$.
  We use the compact-space fact that a component is the intersection of all its clopen neighborhoods.
    For completeness, in a compact metric space let $Q_n$ be the points joined to $p$ by a finite chain with
    consecutive distances less than $1 \/ n$. Each $Q_n$ is clopen. Their nested intersection $Q$ is connected:
    otherwise the two compact pieces of a separation admit disjoint neighborhoods at positive distance;
    for large $n$, compactness puts $Q_n$ in their union, where a $1 \/ n$-chain cannot join the two pieces.
    Thus $Q$ is the component of $p$, proving the stated fact.
  For each $z in X ∩ partial B_R$, choose a clopen neighborhood of $C$ in $X$ which omits $z$.
    Finitely many of their complements cover $X ∩ partial B_R$;
    take $A$ to be the intersection of the corresponding neighborhoods.
    If $X ∩ partial B_R$ is empty, take $A = X$. In either case $A$ is compact, contains $C$,
    and is disjoint from $partial B_R$. Its positive distance from that circle shows that its relative openness in
    $X$ also gives relative openness in $H$. Consequently $B = H \\ A$ is closed,
    and its distance from compact $A$ is positive. Local finite length gives $cal(H)^1 \( A \) < oo$;
    the support assumption and relative openness give $cal(H)^1 \( A \) > 0$.
  Finally, $D = bb(R)^2 \\ H$ is dense because $H$ has locally finite length.
    A set lying between a connected set and its closure is connected.
    The larger complement $bb(R)^2 \\ B$ lies between $D$ and $overline(D) = bb(R)^2$,
    which proves the last assertion. ◻
]

The compact piece $A$ may contain several connected components of $H$.
  What matters in Section 5 is its positive separation from the fixed remainder $B$,
  which permits every sufficiently small translation of the whole piece.

== 5 Excluding an isolated compact piece <sec:compact-piece>

We now work with a global absolute minimizer of $E_0$ whose complement is connected.
  The target is to exclude a separated compact piece of positive length that contains a regular arc.
  The main idea is to split the gradient into the field produced by that compact part and a field harmonic across
  it. Translating the compact part preserves its length and its own Dirichlet energy.
  The remaining interaction is harmonic in the translation parameter, so minimality forces it to be constant.
  We then vary the jump across one regular arc to show that the entire gradient vanishes,
  making the compact part removable.

The strategic electrostatic analogy is Earnshaw’s no-stable-equilibrium principle; see Rahi, Kardar,
  and Emig #cite(label("rahi_kardar_emig2009")) pp. 1–2 for a modern discussion.
  This analogy motivates the translation strategy, but does not provide a sign rule for bounded-domain Dirichlet
  variations. The whole-plane projection, cutoff, finite-translation,
  and jump-variation arguments needed here are supplied below.

Compact translations and independently variable jumps on regular arcs also enter Deangelis’s proof of global
  classification #cite(label("deangelis2026")). His argument uses relaxed second variations,
  equality in a planar Hodge identity, and holomorphic rigidity.
  The finite translations below produce a scalar harmonic interaction,
  whose constancy can be tested against every compactly supported change of the jump.

Throughout this section, $B_R = B_R \( 0 \) subset bb(R)^2$.
  A function on the complement of a set of zero area, and its gradient density,
  are assigned arbitrary values on that set when integrated with respect to area.
  For a scalar function defined off a closed set, compact support means compact essential support in the ambient
  plane; the support is allowed to meet that closed set. For a scalar function or vector field $a$,
  its translate by $t in bb(R)^2$ is

$ a_t \( x \) = a \( x - t \) . $

For a set $A$, write $A_t = A + t = { x + t : x in A }$. We use the distributional conventions

$ "curl" \( a_1 \, a_2 \) = partial_1 a_2 - partial_2 a_1 \, wide nabla^perp b = \( - partial_2 b \, partial_1 b \) . $

Thus $Delta a = nabla "div" a + nabla^perp "curl" a$.

#thm([Proposition 5.1.])[
  (Exclusion of a separated compact piece).  #emph[Let $H subset bb(R)^2$ be closed, rectifiable,
    and locally of finite $cal(H)^1$ measure, and assume $D = bb(R)^2 \\ H$ is connected.
    Let $\( v \, H \)$ be an absolute minimizer of $E_0$ under compactly supported comparisons, with
$ v in W^(1 \, 2) \( B_R \\ H \) quad \( R > 0 \) \, wide integral_(B_R) \| nabla v \|^2 lt.eq
  C \( 1 + R \) quad \( R gt.eq 1 \) . $

 There is no compact set $A subset H$ satisfying all of the following:]
  + #emph[$cal(H)^1 \( A \) > 0$;]
  + #emph[$B = H \\ A$ is closed and $"dist" \( A \, B \) > 0$, with the distance interpreted as $+ oo$ if $B =
    diameter$;]
  + #emph[$A$ contains an open subarc of $H$ that is an embedded $C^1$ arc.]
  #emph[In the third condition, an open subarc means that some open neighborhood meets $H$ in just that arc.]
] <prop:compact-piece>

Here is the decomposition that organizes the argument. Suppose provisionally that $H = A union B$,
  where $A$ is compact and separated from the closed remainder $B$.
  Choose a smooth cutoff $chi$ supported away from $B$ and equal to one near $A$, so that $h =
  chi v$ carries the part of the function near $A$. The projection in Lemma 7 constructs a potential $phi.alt$
  whose gradient is square integrable on the whole plane. We then set

$ F = chi v - phi.alt \, wide f = \( 1 - chi \) v + phi.alt \, wide v = f + F . $

The proof of Proposition 6 will show that $f$ is harmonic across $A$,
  while $F$ has its only possible jump on $A$ and decays at infinity.
  Thus $f$ can be held fixed while $F$ and the compact set are translated together.
  The three lemmas below construct this split, justify the finite-disk comparisons,
  and identify the resulting harmonic interaction. The proposition then uses independent changes of the jump to
  force both gradient contributions to vanish.

=== 5.1 A finite-energy field carrying the compact jump <a-finite-energy-field-carrying-the-compact-jump>

The first lemma constructs a finite-energy field whose only possible jump lies on a prescribed compact set.
  The decay at infinity will allow us to translate this field and then return to the original function far away.

#thm([Lemma 5.2.])[
  (Projection of a compactly supported function).  #emph[Let $A subset bb(R)^2$ be compact and have zero area.
    Suppose $h in W^(1 \, 2) \( bb(R)^2 \\ A \)$ has compact support, and write $e =
    nabla h$ for its gradient density. Let
$ Z = overline({ nabla zeta : zeta in C_c^oo \( bb(R)^2 \) })^(thin L^2 \( bb(R)^2 \; bb(R)^2 \)) \, $

 and let $Q$ be the orthogonal projection onto $Z$. There is a unique $phi.alt in
   W_(upright("loc"))^(1 \, 2) \( bb(R)^2 \)$ satisfying $nabla phi.alt = Q e$ and tending to zero at infinity. Set
$ F = h - phi.alt quad upright("on ") bb(R)^2 \\ A \, wide p = e - nabla phi.alt quad upright("on ") bb(R)^2 . $

 Then $p in L^2 \( bb(R)^2 \; bb(R)^2 \)$, $F in W^(1 \, 2) \( B_R \\ A \)$ for every $R > 0$, and $nabla F =
   p$ off $A$. Distributionally on the whole plane,
#[#set math.equation(numbering: n => "(5.1)")
 $ "div" p = 0 \, wide "supp" \( "curl" p \) subset A \, wide Delta p =
   nabla^perp "curl" p . $ <eq:compact-field-equations>]

 Outside a sufficiently large disk, $F$ and $p$ are smooth, and
#[#set math.equation(numbering: n => "(5.2)")
 $ F \( x \) = O \( \| x \|^(- 1) \) \, wide \| nabla^k F \( x \) \| =
   O_k \( \| x \|^(- 1 - k) \) quad \( k gt.eq 1 \) . $ <eq:compact-field-decay>]

 In particular $p \( x \) = O \( \| x \|^(- 2) \)$ there.]
] <lem:compact-projection>

#proof[
  Every element of $Z$ is the gradient of a scalar function in $W_(upright("loc"))^(1 \, 2) \( bb(R)^2 \)$.
    Indeed, for a defining sequence of gradients, subtract the mean of each potential on $B_1$.
    Poincaré’s inequality, first on $B_1$ and then on larger overlapping balls,
    makes these potentials Cauchy in $W^(1 \, 2)$ on every fixed ball. Apply this to $Q e$.
  The projection identity gives
  $ integral_(bb(R)^2) \( e - nabla phi.alt \) dot.op nabla zeta = 0 wide \( zeta in C_c^oo \( bb(R)^2 \) \) . $
  Consequently $Delta phi.alt = "div" e$ and $"div" p = 0$.
    Since $e$ has compact support, $phi.alt$ is harmonic outside a disk.
    Its gradient has finite energy on the whole plane. The Fourier expansion of a single-valued harmonic function
    on the exterior of a disk consists of a constant, a logarithmic term,
    and modes $r^(plus.minus n)$ for integers $n gt.eq 1$. Finite Dirichlet energy excludes the logarithmic and
    growing modes. Subtracting the remaining constant gives
  $ phi.alt \( x \) = O \( \| x \|^(- 1) \) \, wide \| nabla^k phi.alt \( x \) \| =
    O_k \( \| x \|^(- 1 - k) \) quad \( k gt.eq 1 \) . $
  This normalization is unique. The bounds follow, for example,
    by estimating the decaying Fourier series outside a larger concentric disk.
  Off $A$, the field $p$ is the weak gradient of $h - phi.alt$, so its curl vanishes there.
    This proves the support assertion in (5.1); the last identity follows from $"div" p = 0$.
    Finally $h = 0$ outside a disk, so $F = - phi.alt$ there. ◻
]

=== 5.2 The energy comparison and its harmonic interaction <the-energy-comparison-and-its-harmonic-interaction>

The comparison translates $F$ together with $A$ and also changes its jump by an independent field $P$ with
  amplitude $sigma$. We include the distant cutoff that makes this an admissible compact comparison;
  all interaction integrals below converge absolutely.

#thm([Lemma 5.3.])[
  (Translated comparison).  #emph[Let $H = A union B subset bb(R)^2$ be closed, rectifiable,
    and locally of finite $cal(H)^1$ measure, where $A$ is compact, $B$ is closed, and $"dist" \( A \, B \) > 0$.
    Let $\( v \, H \)$ be an absolute minimizer of $E_0$ under compactly supported comparisons, with
$ v in W^(1 \, 2) \( B_R \\ H \) quad \( R > 0 \) \, wide integral_(B_R) \| nabla v \|^2 lt.eq
  C \( 1 + R \) quad \( R gt.eq 1 \) . $

 Suppose $v = f + F$ off $H$, where $f in W^(1 \, 2) \( B_R \\ B \)$ for every $R > 0$,
   and $\( F \, p \)$ is obtained from a compactly supported $h in W^(1 \, 2) \( bb(R)^2 \\ A \)$ by Lemma 7.
   Put $G = nabla v - p$, and assume
$ G = nabla f upright(" off ") B \, wide integral_(B_R) \| G \|^2 lt.eq C' \( 1 + R \) quad \( R gt.eq 1 \) . $

 For any compactly supported $h' in W^(1 \, 2) \( bb(R)^2 \\ A \)$,
   let $\( P \, q \)$ be its counterpart of $\( F \, p \)$ in Lemma 7.
   Choose $delta > 0$ so that $A_t ∩ B = diameter$ whenever $\| t \| < delta$. Define
$ I_p \( t \) = integral_(bb(R)^2) G dot.op p_t \, wide I_q \( t \) = integral_(bb(R)^2) G dot.op q_t . $

 Then these integrals converge absolutely, and for every $\| t \| < delta$ and $sigma in bb(R)$,
#[#set math.equation(numbering: n => "(5.3)")
 $ 0 lt.eq 2 #scale(x: 120%, y: 120%)[\(] I_p \( t \) - I_p \( 0 \) #scale(x: 120%, y: 120%)[\)] +
   2 sigma #scale(x: 120%, y: 120%)[\(] I_q \( t \) + chevron.l p \,
   q chevron.r_(L^2) #scale(x: 120%, y: 120%)[\)] + sigma^2 parallel q parallel_(L^2)^2 . $ <eq:translated-energy>]

]
] <lem:translated-comparison>

#proof[
  Fix $t$ and $sigma$. For large $R$, let $eta_R$ be smooth, equal to one near $overline(B)_R$,
    zero near $bb(R)^2 \\ B_(2 R)$, and satisfy $\| nabla eta_R \| lt.eq C \/ R$.
    Use the set $J = B union A_t$ and the function
  $ V_R =
    cases(delim: "{", f + F_t + sigma P_t \, & x in B_R \\ J \,, v + eta_R \( F_t - F + sigma P_t \) \, & x in \(
    B_(2 R) \\ overline(B)_R \) \\ J \,, v \, & x in.not B_(2 R) union J .) $
  Take $R$ large enough to contain the compact pieces and all supports used in the projection constructions.
    The first formula is Sobolev off $J$, since $f$ extends across $A$ and $F_t \, P_t$ are Sobolev off $A_t$.
    The formulas agree near the interfaces because $v = f + F$ off $H$.
    The set $J$ is rectifiable because $A$ and $B$ are subsets of the rectifiable set $H$,
    and translation preserves rectifiability. Thus $\( V_R \, J \)$ is admissible.
    Its change from $\( v \, H \)$ has compact support in a bounded open disk slightly larger than $B_(2 R)$.
    In that disk the length terms cancel exactly, since $A_t$ is disjoint from $B$ and $cal(H)^1 \( A_t \) =
    cal(H)^1 \( A \)$.
  On the gluing annulus, the exterior estimates of Lemma 7 give
  $ parallel nabla #scale(x: 120%, y: 120%)[\[] eta_R \( F_t - F + sigma P_t \) #scale(x: 120%, y: 120%)[\]]
    #scale(x: 120%, y: 120%)[parallel]_(L^2) lt.eq C_(t \, h \, h') \( 1 + \| sigma \| \) R^(- 1) . $
  The change of Dirichlet energy on that annulus is therefore $O \( \( 1 + \| sigma \| \) R^(- 1 \/ 2) \) +
    O \( \( 1 + \| sigma \| \)^2 R^(- 2) \)$, which tends to zero.
    Here we used $parallel nabla v parallel_(L^2 \( B_(2 R) \)) = O \( R^(1 \/ 2) \)$.
  For completeness, the interactions are absolutely integrable at infinity: on a dyadic annulus of radius $s$,
  $ parallel G parallel_(L^2) = O \( s^(1 \/ 2) \) \, wide parallel p_t parallel_(L^2) +
    parallel q_t parallel_(L^2) = O \( s^(- 1) \) \, $
  so their products have integrals $O \( s^(- 1 \/ 2) \)$, summable over dyadic annuli.
    On bounded sets the products are integrable by Cauchy–Schwarz.
  Inside $B_R$, the two gradients are $G + p_t + sigma q_t$ and $G + p$.
    Expand their squared norms in the finite comparison, then let $R arrow.r oo$. Translation invariance gives
  $ parallel p_t parallel_2 = parallel p parallel_2 \, quad parallel q_t parallel_2 = parallel q parallel_2 \,
    quad chevron.l p_t \, q_t chevron.r = chevron.l p \, q chevron.r . $
  These equalities and the preceding estimates yield (5.3).
    In particular, no subtraction of infinite whole-plane Dirichlet energies is involved. ◻
]

#thm([Lemma 5.4.])[
  (Harmonicity and constancy of the interaction).  #emph[In the setting of Lemma 8,
    suppose in addition that $f$ is harmonic on $O = bb(R)^2 \\ B$.
    After decreasing $delta$ if necessary, $I_p$ is harmonic on $B_delta \( 0 \)$ as a function of the translation
    parameter. Consequently
#[#set math.equation(numbering: n => "(5.4)")
 $ I_p \( t \) = I_p \( 0 \) \, wide I_q \( t \) = - chevron.l p \,
   q chevron.r_(L^2) quad \( \| t \| < delta \) $ <eq:constant-interactions>]

 for every compactly supported $h'$ allowed in Lemma 8.]
] <lem:harmonic-interaction>

#proof[
  Choose $zeta in C_c^oo \( O \)$ equal to one on a neighborhood of all $A_t$ for $\| t \| < delta$,
    and split $I_p$ using $zeta G$ and $\( 1 - zeta \) G$. The field $zeta
    G$ is a smooth compactly supported test field on the whole plane, because $G = nabla f$ on $O$.
    Distributional differentiation and (5.1) give
  $ Delta_t chevron.l p_t \, zeta G chevron.r = chevron.l nabla^perp "curl" p_t \, zeta G chevron.r = -
    chevron.l "curl" p_t \, "curl" \( zeta G \) chevron.r = 0 . $
  Indeed $"curl" p_t$ is supported on $A_t$, and $"curl" \( zeta G \) = 0$ on a neighborhood of $A_t$.
  On the support of $1 - zeta$, the field $p_t$ is harmonic and smooth,
    uniformly separated from $A_t$ on bounded sets. At infinity,
    its $k$th translation derivatives are $O \( \| x \|^(- 2 - k) \)$.
    Together with the growth bound for $G$, the dyadic estimate in the preceding proof gives an integrable bound
    for each differentiated integrand, locally uniformly in $t$.
    Differentiation under the second integral is therefore justified, and its translation Laplacian also vanishes.
    Thus $I_p$ is harmonic.
  Taking $sigma = 0$ in (5.3) shows that $I_p$ has a minimum at the origin.
    The minimum principle makes it constant on the translation disk.
    For any fixed $t$, the remaining right side of (5.3) is a quadratic polynomial in $sigma$ with zero constant
    term, nonnegative for all real $sigma$. Its linear coefficient must vanish. This proves (5.4). ◻
]

=== 5.3 Jump variations force the whole field to vanish <jump-variations-force-the-whole-field-to-vanish>

The preceding lemmas turn the energy inequality into an equality for every compactly supported value variation.
  We now use variations whose two traces on a regular arc differ.
  Their arbitrary jumps measure the normal derivative of the harmonic function $f$ on every nearby translate of the arc.

#proof[
  Suppose such an $A$ exists, and put $O = bb(R)^2 \\ B$. Because $H$ has zero area, $D$ is dense in the plane.
    The set $O$ contains the connected set $D$ and is contained in its closure, so $O$ is connected.
  Set $m = nabla v$ off $H$. Comparing $v$ with $v + s psi$ for $psi in
    C_c^oo \( bb(R)^2 \)$ and both signs of $s$ gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ "div" m = 0 quad upright("in ") cal(D)' \( bb(R)^2 \) . $ <eq:whole-plane-divergence>]
  Choose $chi in C_c^oo \( O \)$ equal to one on a neighborhood of $A$.
    The function $h = chi v$, extended by zero near $B$, belongs to $W^(1 \, 2) \( bb(R)^2 \\ A \)$ and has
    compact support. Apply Lemma 7, obtaining $phi.alt \, F \, p$, and define
  $ f = \( 1 - chi \) v + phi.alt quad upright("on ") O \, wide G = m - p . $
  Near $A$, the first term in $f$ vanishes; thus $f$ extends across $A$ and belongs to $W^(1 \, 2) \( B_R \\ B \)$
    for every $R$. Off $H$ we have $v = f + F$ and $G = nabla f$.
    These identities hold almost everywhere on $O$, since $A$ has zero area.
    By (5.5) and (5.1), $"div" G = 0$ on the whole plane. It follows that $f$ is harmonic on $O$. Also
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_(B_R) \| G \|^2 lt.eq 2 integral_(B_R) \| m \|^2 + 2 parallel p parallel_2^2 lt.eq
     C_1 \( 1 + R \) wide \( R gt.eq 1 \) . $ <eq:external-field-growth>]
  We have separated $v$ into a function $f$ harmonic through $A$ and a function $F$ whose possible jumps lie on
    $A$. Figure 1 shows how the comparison keeps $B$ and $f$ fixed while translating $A$, $F$,
    and an independent jump variation $P$ together. A distant cutoff returns the comparison to the original function.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.05, -1.35), (13.85, 3.6), stroke: none)
  content((3.25, 3.6), [#text(size: 9pt)[Original pair]], anchor: "north", padding: 0.1176cm)
  bezier((0.25, 2.75), (1.15, 1.95), (0.85, 2.6), (0.7, 2.05), stroke: (paint: rgb("#595959"), thickness: 1.05pt, miter-limit: 10))
  bezier((1.15, 1.95), (1.55, 1), (1.55, 1.8), (1.2, 1.2), stroke: (paint: rgb("#595959"), thickness: 1.05pt, miter-limit: 10), mark: (start: "<"))
  content((1, 3.05), [#text(fill: rgb("#595959"))[#text(size: 9pt)[$B$]]], anchor: "east", padding: 0.1176cm)
  bezier((2.6, 1.8), (3.9, 1.8), (3.05, 2.25), (3.45, 1.5), stroke: (paint: rgb("#0000a6"), thickness: 1.25pt, miter-limit: 10))
  bezier((3.05, 0.95), (4.45, 1.05), (3.55, 1.3), (4, 0.55), stroke: (paint: rgb("#0000a6"), thickness: 1.25pt, miter-limit: 10))
  content((4.35, 2.35), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$A$]]])
  content((3.25, 0.15), [#text(size: 9pt)[$H=B union A$]])
  content((3.25, -0.48), [#text(size: 9pt)[$v=f+F$]])
  content((3.25, -1.05), [#text(fill: rgb("#595959"))[#text(size: 8pt)[$f$ extends harmonically through $A$]]])
  content((10.35, 3.6), [#text(size: 9pt)[Translated comparison]], anchor: "north", padding: 0.1176cm)
  bezier((7.35, 2.75), (8.25, 1.95), (7.95, 2.6), (7.8, 2.05), stroke: (paint: rgb("#595959"), thickness: 1.05pt, miter-limit: 10))
  bezier((8.25, 1.95), (8.65, 1), (8.65, 1.8), (8.3, 1.2), stroke: (paint: rgb("#595959"), thickness: 1.05pt, miter-limit: 10), mark: (start: "<"))
  content((8.1, 3.05), [#text(fill: rgb("#595959"))[#text(size: 9pt)[$B$]]], anchor: "east", padding: 0.1176cm)
  bezier((9.7, 1.8), (11, 1.8), (10.15, 2.25), (10.55, 1.5), stroke: (paint: rgb("#b2b2b2"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((10.15, 0.95), (11.55, 1.05), (10.65, 1.3), (11.1, 0.55), stroke: (paint: rgb("#b2b2b2"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((10.3, 2.35), (11.6, 2.35), (10.75, 2.8), (11.15, 2.05), stroke: (paint: rgb("#0000a6"), thickness: 1.25pt, miter-limit: 10))
  bezier((10.75, 1.5), (12.15, 1.6), (11.25, 1.85), (11.7, 1.1), stroke: (paint: rgb("#0000a6"), thickness: 1.25pt, miter-limit: 10))
  line((11.7, 1.78), (12.3, 2.33), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((12.07, 2.055), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  content((11.85, 2.98), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$A_t=A+t$]]])
  content((10.35, 0.15), [#text(size: 9pt)[$J=B union A_t$]])
  content((10.35, -0.48), [#text(size: 9pt)[$V_R=f+F_t+ sigma P_t$]])
  content((10.35, -1.05), [#text(fill: rgb("#595959"))[#text(size: 8pt)[$f$ stays fixed; $F$ and $P$ are translated]]])
})],
    caption: [Figure 1: The comparison associated with a hypothetical separated compact piece $A$. The remainder $B$ is fixed, while $A$ is translated by a small vector $t$ with $A_t ∩ B = diameter$; the dashed curves mark its former position. The displayed formula for $V_R$ holds in the inner comparison disk. Far away, a cutoff returns the function to $v$. The drawings are schematic: $A$ may contain several components, and no regularity of all of $A$ or $B$ is asserted. The functions $F$ and $P$ need not have compact support. ],
  ) <fig:compact-translation>
  All hypotheses of Lemmas 8 and 9 now hold. In particular,
    (5.4) holds for every compactly supported $h' in W^(1 \, 2) \( bb(R)^2 \\ A \)$.
  We explain how to remove the projected potential from these interactions.
    Let $phi.alt'$ be the normalized potential associated with such an $h'$.
    Since $"div" G = 0$, testing with $theta_R phi.alt'_t$, where $theta_R$ is a smooth cutoff on $B_(2 R)$ equal
    to one on $B_R$, gives
  $ integral theta_R G dot.op nabla phi.alt'_t = - integral G dot.op nabla theta_R thin phi.alt'_t . $
  The compactly supported Sobolev test is justified by smooth approximation, because $G in L_(upright("loc"))^2$.
    By the exterior normalization $phi.alt'_t = O \( R^(- 1) \)$ on the cutoff annulus and (5.6),
    the right side is $O \( R^(- 1 \/ 2) \)$. The uncut left integrand is absolutely integrable by the same dyadic
    estimate used in Lemma 8. Hence
  #[#set math.equation(numbering: n => "(5.7)")
   $ integral_(bb(R)^2) G dot.op nabla phi.alt'_t = 0 \, wide I_q \( t \) =
     integral_(bb(R)^2) G dot.op \( nabla h' \)_t . $ <eq:remove-projection>]
  This step uses the distributional equation and decay, not a claim that $G$ belongs to global $L^2$.
  Take a smaller part of the regular arc in $A$. After a rigid change of coordinates, it has the form
  $ gamma \( s \) = \( s \, kappa \( s \) \) \, wide s in I \, $
  where $I$ is a bounded interval and $kappa$ is $C^1$ on a neighborhood of $overline(I)$.
    Choose $I$ and $a > 0$ so that the graph strip ${ \( s \, kappa \( s \) + r \) : s in I \,
    med \| r \| < a }$ is relatively compact in $O$ and meets $H$ only in the continuation of this arc.
    Let $n \( s \)$ be one of its continuous unit normals. Choose $eta in
    C_c^oo \( \( - a \, a \) \)$ with $eta \( 0 \) = 1$. For every $beta in C_c^oo \( I \)$ define, on the strip,
  $ h'_beta \( x_1 \, x_2 \) = upright(bold(1))_({ x_2 > kappa \( x_1 \) }) thin beta \( x_1 \)
    eta \( x_2 - kappa \( x_1 \) \) \, $
  and extend it by zero outside the strip. Its support avoids the ends and the outer edge of the strip.
    Since $kappa$ is $C^1$, this function is Sobolev on each side, has its only jump on $A$,
    and belongs to $W^(1 \, 2) \( bb(R)^2 \\ A \)$. Its trace difference on the arc is $beta$.
    Thus only $C^1$ regularity of the arc is needed. Denote by $q_beta$ the field associated with $h'_beta$ by Lemma 7.
  Decrease the translation disk once so that every translate of this fixed strip stays in $O$.
    Integration by parts on its translated upper side, where $f$ is harmonic, and (5.7) give
  #[#set math.equation(numbering: n => "(5.8)")
   $ I_(q_beta) \( t \) = plus.minus integral_I beta \( s \) thin n \( s \) dot.op nabla f \( gamma \( s \) + t \)
     thin \| gamma' \( s \) \| thin d s . $ <eq:jump-flux>]
  There are no other boundary terms, because the test vanishes near all other edges.
    Translation preserves the normal $n \( s \)$.
  By (5.4), the left side of (5.8) is independent of $t$, for every $beta$.
    The fundamental lemma for tests on $I$ and continuity imply
  $ n \( s \) dot.op nabla f \( gamma \( s \) + t \) = n \( s \) dot.op nabla f \( gamma \( s \) \)
    wide \( s in I \, \| t \| < delta \) . $
  Fix an interior $s_0$. A single fixed directional derivative of $f$ is constant on a disk about
    $gamma \( s_0 \)$. In two dimensions this forces a harmonic function to be affine there:
    in rotated coordinates $partial_1 f = c$ gives $f = c x_1 + a \( x_2 \)$, and $Delta f = 0$ gives $a'' = 0$.
    Unique continuation for harmonic functions makes $f$ affine on the connected open set $O$.
  Thus $G$ is a constant vector almost everywhere in the plane.
    The growth estimate (5.6) forces that vector to be zero. Now take $h' = h$, so $q = p$, in (5.4).
    It gives $parallel p parallel_2^2 = 0$. Consequently $m = G + p = 0$ almost everywhere on $D$.
    Since $D$ is connected, $v$ is constant there. Extend this constant across $A$ and use the closed rectifiable
    set $B$. This is an admissible comparison supported on the compact set $A$:
    the function agrees with $v$ almost everywhere, the Dirichlet energy is unchanged,
    and the length decreases by $cal(H)^1 \( A \) > 0$. This contradicts absolute minimality. ◻
]

== 6 Classification and interior regularity <sec:assembly>

We now pass from the exclusion of compact pieces to the local geometry of the original singular set.
  The only limiting sets still available will be the three models in the epsilon-regularity theorem.

#thm([Corollary 6.1.])[
  (Classification of the generalized limits).  #emph[The closed set of every global generalized minimizer arising
    from absolute minimizers is empty, a line, a $120$-degree triod of half-lines, or a half-line.]
] <cor:classification>

#proof[
  Let $\( v \, H \, { p_(k l) } \)$ be such a minimizer. If $H$ disconnects the plane,
    Proposition 4(Proposition 3.1) gives the conclusion. Otherwise Proposition 4(Proposition 3.1) gives absolute
    minimality. If $H$ had a bounded component, Lemma 5 would enclose it in a separated compact piece $A$ of
    positive length. Its length measure is concentrated on points with arc neighborhoods,
    by Proposition 4(Proposition 3.1), so one such arc lies in $A$. Proposition 6 rules out this piece.
    Thus $H$ has no bounded component, while Proposition 4(Proposition 3.1) allows at most one unbounded
    component. Hence $H$ is empty or connected. In either case all but at most one component lie in a compact set,
    so the remaining classification statement in that proposition applies. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Proposition 2 allows us to apply Proposition 4.
    Fix $x in K$ and take a blow-up with limiting set $H$. Since $0 in H$,
    Corollary 10 leaves three possibilities: a line, a half-line, or a triod of half-lines.
    Choose $rho > 0$ so that in $B_(3 rho) \( 0 \)$ the limiting set is a model centered at zero.
    If the vertex of a half-line or triod is different from zero,
    it suffices to take $3 rho$ less than its distance from zero; the model is then a line.
  Local bilateral Hausdorff convergence gives
  $ "dist"_(upright(H)) #scale(x: 120%, y: 120%)[\(] K_j ∩ B_(2 rho) \( 0 \) \,
    H ∩ B_(2 rho) \( 0 \) #scale(x: 120%, y: 120%)[\)] = o \( rho \) . $
  To justify truncation at the sphere, move each model point near $partial
    B_(2 rho)$ slightly inward along its ray, apply convergence in $B_(3 rho)$,
    and then let the inward displacement tend to zero. Approximating points are now inside $B_(2 rho)$;
    the reverse distance follows by the same radial projection onto the truncated model.
  Put $s_j = r_j rho$ and return to the original coordinates.
    For large $j$, the closed set in $B_(2 s_j) \( x \)$ has model distance $o \( s_j \)$,
    the enlarged ball is compactly contained in the original domain, and $s_j lt.eq 1$.
    The fixed-data epsilon-regularity statement Proposition 4(Proposition 3.1) now applies to the original
    minimizer. It follows that the entire set $K ∩ B_(s_j) \( x \)$ is $C^(1 \, alpha)$-diffeomorphic to the
    corresponding model.
  The endpoint or triple junction in this chart may have shifted from its center. This causes no difficulty:
    $x$ is either an interior point of one of the arcs or the actual endpoint or junction.
    Restricting the chart around $x$ gives its corresponding local model.
    The equal-angle conclusion for a triple junction is part of the epsilon-regularity theorem.
    We have therefore proved the asserted interior regularity at every point of $K$.
  It remains to prove local finiteness of the global connected components.
    For each $x in K$, retain one of the original epsilon-regularity disks $B_(s_x) \( x \) subset.double Omega$,
    whose entire intersection with $K$ is connected. If $U subset.double Omega$ is open,
    then $K ∩ overline(U)$ is compact, so finitely many of these disks cover it.
    Each disk meets only one global connected component of $K$,
    because its entire intersection with $K$ is connected. Every global component meeting $U$ therefore belongs to
    the finite list represented by the covering disks. ◻
]

#prodef([Remark 6.2.])[
  (Local scope).  The local models also make the endpoints and triple junctions a relatively closed discrete
    subset of $K$, so only finitely many of them meet a compact subset of $Omega$.
    Define the edges to be the connected components left after deleting these endpoints and triple junctions from
    $K$. In each model chart, deleting those points leaves at most three connected pieces,
    each contained in one global edge. A finite model-chart cover therefore meets only finitely many global edges.
    These are interior finiteness statements, with no assertion at $partial Omega$.
    They concern global components rather than components of $K ∩ U$:
    even one straight line can have infinitely many intersection components with an arbitrary relatively compact
    open set.
]

The geometric conclusion also gives an endpoint integrability estimate for the gradient.
  Its exponent is suggested by the crack-tip profile $r^(1 \/ 2) sin \( theta \/ 2 \)$:
  the gradient has size proportional to $r^(- 1 \/ 2)$, so its superlevel sets near the tip have area of order
  $t^(- 4)$ for large $t$, whereas its fourth power is not locally integrable #cite(label("delellis_focardi2025"))
  Section 1.4. The next result gives this weak-$L^4$ bound for every minimizer in Theorem 1,
  using the De Lellis–Focardi equivalence between the absence of irregular points and the weak-$L^4$ estimate.

#thm([Corollary 6.3.])[
  (Local weak-$L^4$ gradient bound).  #emph[Let $\( u \, K \)$ satisfy the hypotheses of Theorem 1.
    Let $nabla u$ denote the approximate gradient furnished by Proposition 2;
    it agrees almost everywhere on $Omega \\ K$ with the gradient in (1.1).
    For every open $U subset.double Omega$ there is a constant $C_U < oo$, depending on $U$ and the minimizer, such that
#[#set math.equation(numbering: n => "(6.1)")
 $ cal(L)^2 #scale(x: 120%, y: 120%)[\(] { x in U \\ K : \| nabla u \( x \) \| > t } #scale(x: 120%, y: 120%)[\)]
   lt.eq C_U t^(- 4) wide upright("for every ") t > 0 \, $ <eq:weak-l4>]

 where $cal(L)^2$ denotes planar Lebesgue measure. In particular,
   $nabla u in L_(upright("loc"))^(4 \, oo) \( Omega \)$ and $nabla u in
   L_(upright("loc"))^p \( Omega \)$ for every $0 < p < 4$.]
] <cor:weak-l4>

#proof[
  Fix $U subset.double Omega$ and choose a smooth open set $W$ with $U subset.double W subset.double Omega$.
    Proposition 2 makes the restricted pair a reduced rectifiable absolute minimizer for the energy $E_1$ of De
    Lellis–Focardi, with bounded fidelity datum. The three models in Theorem 1 are precisely their regular
    pure-jump, loose-end, and triple-junction models: the arcs can be straightened to their tangent rays by a
    $C^1$ chart tangent to the identity at the center, and the triple angles are $120$ degrees
    #cite(label("delellis_focardi2025")) Definitions 1.3.2 and 1.5.1.
    Thus the irregular stratum $K^(\( i \))$ of the restricted pair is empty.
    Their weak-$L^4$ equivalence #cite(label("delellis_focardi2025")) Theorem 1.5.4;
    see also Theorem 6.1.6 gives the superlevel estimate (6.1) on $U$, after increasing $C_U$ for $0 < t < 1$.
    Since $cal(H)^1 \( K \) < oo$ implies $cal(L)^2 \( K \) = 0$,
    this is also the weak-$L^4$ bound for the approximate gradient.
    For $0 < p < 4$, the layer-cake formula bounds $integral_U \| nabla u \|^p thin d x$ by
  $ p integral_0^oo t^(p - 1) min { cal(L)^2 \( U \) \, C_U t^(- 4) } thin d t < oo . $
  ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
