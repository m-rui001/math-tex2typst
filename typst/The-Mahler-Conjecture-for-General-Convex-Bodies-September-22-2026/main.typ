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

#align(center)[#text(size: 16pt, weight: "bold")[The Mahler Conjecture for General Convex Bodies]]
#align(center)[OpenAI]
#align(center)[September 22, 2026]

== 1 Introduction <sec:introduction>

The Mahler conjecture asks which convex bodies have the smallest product of their volume and the volume of a suitably centered polar body. We resolve the conjecture positively: simplices are exactly the minimizers in every positive dimension.

A #emph[convex body] in $bb(R)^n$ is a compact convex set with nonempty interior. We write $\| A \|$ for the $n$-dimensional Lebesgue volume of a measurable set $A$, and $chevron.l dot.op \, dot.op chevron.r$ for the Euclidean inner product. For $z in "int" K$, define

$ \( K - z \)^compose = { y in bb(R)^n : chevron.l y \, x - z chevron.r lt.eq 1 upright(" for every ") x in K } . $

The minimum of $\| \( K - z \)^compose \|$ is attained at a unique point $s \( K \) in "int" K$, the #emph[Santaló point] (a proof is included in Section 2). The volume product is

$ P \( K \) = \| K \| thin \| \( K - s \( K \) \)^compose \| = inf_(z in "int" K) \| K \| thin \| \( K - z \)^compose \| . $

It is invariant under invertible affine maps. A simplex is the convex hull of $n + 1$ affinely independent points.

#thm([Theorem 1.1.])[
  (General Mahler conjecture).  #emph[For every integer $n gt.eq 1$ and every convex body $K subset bb(R)^n$, 
$ P \( K \) gt.eq frac(\( n + 1 \)^(n + 1), \( n ! \)^2) . $

 Equality holds if and only if $K$ is a simplex.]
] <thm:mahler>

Theorem 1 applies without symmetry or boundary regularity assumptions. It also gives the displayed lower bound for $\| K \| thin \| \( K - z \)^compose \|$ at every interior translation point $z$. The symmetric Mahler conjecture asks for the different, stronger constant $4^n \/ n !$ on the restricted class of centrally symmetric bodies; that sharper statement is separate from Theorem 1 and is proved in the companion paper #cite(label("OpenAISymmetricMahler2026")) Theorem 1.1.

=== History and context <history-and-context>

The lower-volume-product problem grew out of Mahler’s work on polarity and the geometry of numbers. His polygon paper established the general planar inequality and its triangle equality case among polygons #cite(label("Mahler1938")); his transference paper formulated the higher-dimensional symmetric problem #cite(label("Mahler1939")). Meyer later gave a new proof of the planar general inequality and completed its equality characterization for arbitrary planar convex bodies: triangles are exactly the minimizers #cite(label("Meyer1991")). The affine center used here belongs to the classical Santaló theory #cite(label("Santalo1949")); we give its elementary existence and uniqueness argument in Section 2.

Several lines of work explain the distinction between an asymptotic lower bound and the exact simplex constant. The inverse Santaló theorem of Bourgain and Milman gives $\| K \| thin \| K^compose \| gt.eq c^n \| B_2^n \|^2$ for origin-symmetric bodies, where $c > 0$ is absolute and $B_2^n$ is the Euclidean unit ball #cite(label("BourgainMilman1987")). Kuperberg obtained explicit lower bounds through Gauss linking integrals, with separate conclusions in the symmetric and general settings #cite(label("Kuperberg2008")). Nazarov developed a complex-analytic proof using Bergman kernels and Hörmander estimates #cite(label("Nazarov2012")); Mastrantonis and Rubinstein extended that direct analytical method to nonsymmetric bodies #cite(label("MastrantonisRubinstein2024")). These approaches establish exponential-order lower bounds without the sharp constant asserted in Theorem 1.

Exact results in substantial special classes also preceded the general statement. Meyer and Reisner used shadow systems, one-parameter deformations of convex bodies, to prove the sharp inequality and simplex equality for polytopes with at most $n + 3$ vertices. Their key input is convexity of the reciprocal polar volume at the Santaló point along such a deformation #cite(label("MeyerReisner2006")) Theorems 1 and 10. Kim and Reisner established strict local minimality, with a quantitative estimate, at every simplex #cite(label("KimReisner2011")) Theorem 1; this is local information about the space of convex bodies. In dimension three, Iriyeh and Shibata proved the symmetric conjecture #cite(label("IriyehShibata2020")). The 2026 preprint of Chen, Li, Xi, and Xu proves $P \( K \) gt.eq 64 \/ 9$ for every three-dimensional convex body, with equality exactly for tetrahedra #cite(label("ChenLiXiXu2026")). Their shadow flows constrain the permitted deformations so that they can treat arbitrary polytopes in dimension three and then pass to general bodies. In contrast, the argument below works with projections onto a fixed cone and their Gaussian averages. Theorem 1 concerns arbitrary convex bodies in all dimensions, including its global equality classification.

=== Proof strategy <proof-strategy>

The first step is the cone/Laplace correspondence developed by Klartag #cite(label("Klartag2018")) Lemma 2.1 and Corollary 4.1. Choose $z_0 in "int" K$ and put $m = n + 1$. Lift the translated body to the cone

$ C = { \( t x \, t \) : t gt.eq 0 \, med x in K - z_0 } subset bb(R)^m \, #h(2em) D = { y : chevron.l y \, x chevron.r gt.eq 0 upright(" for every ") x in C } . $

For $V in "int" D$ and $U in "int" C$, set $chi_C \( V \) = integral_C e^(- chevron.l V \, x chevron.r) thin d x$ and define $chi_D \( U \)$ similarly. Section 2 shows that the desired inequality follows from $chi_C \( V \) chi_D \( U \) gt.eq 1$ whenever $chevron.l U \, V chevron.r = m$. We use positive duality and retain the short calculation to fix the signs and factorials.

The paired maps into $C$ and $D$ arise from Moreau’s decomposition #cite(label("Moreau1962")) #cite(label("Soltan2019")). Let $Pi_C$ and $Pi_D$ be Euclidean nearest-point projections, and write $Z = Sigma^(1 \/ 2) G$, where $G = \( G_1 \, dots.h \, G_m \)$ is standard Gaussian and $Sigma$ is positive definite. For a real layer parameter $z$, choose a bias $xi_z$ so that $X_z = Pi_C \( Z + xi_z \)$ has mean $a \( z \) U$, where $a \( z \) = bb(E) max { g + z \, 0 }$ for a standard one-dimensional Gaussian $g$. Its dual partner is $Y_z = Pi_D \( - Z - xi_z \)$. Section 3 proves that every such bias exists and then chooses linear coordinates and the covariance of $Z$ simultaneously. The dependence of the covariance on the projection field is essential to the later matrix cancellation. Integrating the projection maps over $z$ gives two injective, smoothed maps into the cones. Change of variables and Jensen’s inequality turn their Jacobians into a lower bound for the normalized logarithm of the Laplace product in Section 4. Write this lower bound as $- cal(E)$; the remaining task is to prove $cal(E) lt.eq 0$. Entropy and log-Laplace perturbations also appear in the functional volume-product work of Fradelizi and Marín Sola #cite(label("FradeliziMarinSola2024")); that is a related analytical setting, not an input theorem for these maps.

The main difficulty is that the derivative matrices $P_z = D Pi_C \( Z + xi_z \)$ need not commute and need not form an increasing family in $z$. Estimating them independently would discard the information needed for both the constant and equality. Sections 5 and 6 therefore compare the full family to spectral thresholds of a linear Gaussian matrix $L = sum_(i = 1)^m G_i M_i$, where the $M_i$ are deterministic symmetric matrices. Classical Hermite expansion and the Gaussian inverse-generator covariance identity #cite(label("HoudrePrivault2002")) Proposition 2.1 separate this linear part from higher Gaussian degrees. The resulting upper bound for $cal(E)$ subtracts a nonnegative layer defect and reduces all other terms to functions of $L$ and the chosen covariance.

Section 7 uses the matrix divided-difference formula to express those functions as averages over pairs of eigenvalues. A strict scalar inequality on each nontrivial interval absorbs the remaining errors. Equality then forces the coefficient matrices $M_i$ to commute and the projection derivative to be diagonal in one fixed basis. The cone splits into one-dimensional half-lines, so its bounded section is a simplex. The converse is a direct volume computation.

The dimension-independent estimates used in this chain are stated in Proposition 5. Appendix 9 proves the one-variable and pointwise layer bounds; Appendix 10 proves the strict interval inequality. Both include the analytic interpolation and tail arguments that turn their finite rational certificates into statements on the whole real line. Numerical sampling is not used as a substitute for these arguments. Figure 1 records the logical dependencies and locates the independent scalar branch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Cone formulation#linebreak()Section~2]]])])
  content((0, -1.65), [#box(width: 6.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Normalized Gaussian projections#linebreak()and entropy estimate#linebreak()Sections~3--4]]])])
  content((0, -3.3), [#box(width: 6.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Quadratic identities and#linebreak()layer error bounds#linebreak()Sections~5--6]]])])
  content((0, -4.95), [#box(width: 6.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Linear-field estimate and#linebreak()equality characterization#linebreak()Section~7]]])])
  content((9, 0.35), [#text(size: 9pt)[Independent scalar input]])
  content((9, -1), [#box(width: 5.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Scalar profile bounds#linebreak()Stated in Section~2;#linebreak()proved in Appendix~9]]])])
  content((9, -4.95), [#box(width: 5.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Segment variance estimate#linebreak()Appendix~10]]])])
  line((0, -0.56), (0, -1.09), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((0, -2.21), (0, -2.74), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((0, -3.86), (0, -4.39), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((9, -1.65), (9, -4.3), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((6.224, -1), (3.276, -1.65), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((6.224, -1.65), (5.2, -1.65), (5.2, -3.3), (3.276, -3.3), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
  line((6.224, -4.95), (3.276, -4.95), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#4d4d4d"))))
})],
  caption: [Figure 1: Principal logical dependencies. Arrows indicate where inputs are used, rather than the order of presentation. The scalar branch is independent of the cone and dimension; its proofs follow the geometric argument. ],
) <fig:proof-map>

=== Functional Mahler inequality <functional-mahler-inequality>

The functional version replaces a convex body by a log-concave function and polarity by convex conjugation. For a proper lower-semicontinuous convex function $phi : bb(R)^n arrow.r bb(R) union { + oo }$, define its Fenchel–Legendre transform by

$ phi^(*) \( y \) = sup_(x in bb(R)^n) { chevron.l x \, y chevron.r - phi \( x \) } \, #h(2em) y in bb(R)^n . $

We use the convention $e^(- oo) = 0$.

#thm([Corollary 1.2.])[
  (Functional Mahler inequality).  #emph[For every integer $n gt.eq 1$ and every proper lower-semicontinuous convex function $phi : bb(R)^n arrow.r bb(R) union { + oo }$ such that $0 < integral_(bb(R)^n) e^(- phi \( x \)) thin d x < oo$, 
$ (integral_(bb(R)^n) e^(- phi \( x \)) thin d x) (integral_(bb(R)^n) e^(- phi^(*) \( y \)) thin d y) gt.eq e^n . $

 The second integral is allowed to be infinite, in which case the inequality is immediate.]
] <cor:functional-mahler>

This sharp lower bound applies to general log-concave functions through their convex potentials; no centering or normalization of $phi$ is required. Its derivation uses Theorem 1 in all dimensions, not only in dimension $n$, through the implication of Fradelizi and Meyer #cite(label("FradeliziMeyer2008")) Proposition 2(a). Section 8 gives the proof, an extremizing example, and the distinction between geometric and functional equality cases.

The same functional bound has an entropy–transport consequence: for full-dimensional log-concave probability measures whose densities vanish at $cal(H)^(n - 1)$-almost every boundary point of their supports (the essential-continuity condition), it bounds their summed entropies relative to Lebesgue measure by a transport cost between the distributions of their potential gradients, with additive constant $- 3 n$. The precise definitions and statement appear in Corollary 26. This consequence uses the functional equivalence of Gozlan, as stated in #cite(label("FradeliziGozlanZugmeyer2021")) Theorem 1.3; essential continuity is an additional hypothesis, not a requirement on the convex bodies in Theorem 1.

== 2 Polarity, cone reduction, and the scalar input <sec:01-cones>

We first express the volume product as a product of Laplace integrals on dual cones. This relation is the one used by Klartag #cite(label("Klartag2018")) Lemma 2.1 and Corollary 4.1, with positive duality and a normalization adapted to the Gaussian argument. We include the calculation to fix the signs and factorials. The rest of the proof estimates the integrals after a suitable linear change of coordinates.

=== 2.1 The center of polarity <the-center-of-polarity>

For completeness we establish the minimizing-center convention used in Theorem 1. The support function of a convex body $K$ is $h_K \( u \) = sup_(x in K) chevron.l u \, x chevron.r$. Polar coordinates give, for $z in "int" K$ and $n gt.eq 2$,

$ \| \( K - z \)^compose \| = 1 / n integral_(S^(n - 1)) \( h_K \( u \) - chevron.l z \, u chevron.r \)^(- n) thin d sigma \( u \) \, $

where $sigma$ is surface measure on the unit sphere. This is strictly convex as a function of $z$: the function $t mapsto t^(- n)$ is strictly convex for $t > 0$, and for any two distinct centers their inner products differ on a set of positive surface measure. It also tends to infinity as $z$ approaches the boundary of $K$. Indeed, at a limiting boundary point choose a unit supporting normal $u_0$. Then $epsilon = h_K \( u_0 \) - chevron.l z \, u_0 chevron.r arrow.r 0$. The support functions $h_K \( u \) - chevron.l z \, u chevron.r$ have a common Lipschitz constant for $z in K$. On a spherical cap of radius $epsilon$ about $u_0$, their values are at most a constant times $epsilon$. The cap has measure at least a constant times $epsilon^(n - 1)$, so its contribution to the integral is at least a constant times $epsilon^(- 1)$. Existence and uniqueness of an interior minimizer follow. In dimension one the same conclusion follows directly from $\( z - a \)^(- 1) + \( b - z \)^(- 1)$ for $K = \[ a \, b \]$.

For an invertible affine map $x mapsto B x + a$,

$ \( B K + a - \( B z + a \) \)^compose = B^(- sans(T)) \( K - z \)^compose . $

The two volume factors change by reciprocal determinants. This proves affine invariance of the volume product and the equivariance $s \( B K + a \) = B s \( K \) + a$.

=== 2.2 The cone formulation <the-cone-formulation>

Put $m = n + 1$. For $z_0 in "int" K$, define

$ C = { \( y \, t \) : t gt.eq 0 \, med y in t \( K - z_0 \) } \, #h(2em) D = C^(*) = { w : chevron.l w \, x chevron.r gt.eq 0 upright(" for all ") x in C } . $

For cones, the star denotes this #emph[positive] duality. Both cones are closed, convex, solid, and pointed: solid means having nonempty interior, and pointed means containing no line. For interior vectors $V in D$ and $U in C$, write

$ chi_C \( V \) = integral_C e^(- chevron.l V \, x chevron.r) thin d x \, #h(2em) chi_D \( U \) = integral_D e^(- chevron.l U \, x chevron.r) thin d x $

using $m$-dimensional Lebesgue measure.

#thm([Lemma 2.1.])[
  (Cone reduction).  #emph[For $U = \( 0 \, m \)$ and $V = \( 0 \, 1 \)$, 
$ chi_C \( V \) chi_D \( U \) = frac(\( n ! \)^2, m^m) \| K \| thin \| \( K - z_0 \)^compose \| . $

 For any closed convex solid pointed cone and any interior pair $U in C$, $V in C^(*)$, the two Laplace integrals are finite. Their product and the inner product $chevron.l U \, V chevron.r$ are preserved by 
$ \( C \, D \, U \, V \) mapsto \( B C \, B^(- sans(T)) D \, B U \, B^(- sans(T)) V \) $

 for every invertible linear map $B$.]
] <lem:cone-reduction>

#proof[
  A point $\( w \, t \)$ lies in $D$ exactly when $t gt.eq sup_(x in K - z_0) chevron.l - w \, x chevron.r$. Since zero is interior to $K - z_0$, this forces $t gt.eq 0$, and the slice at height $t$ is $- t \( K - z_0 \)^compose$. Integrating the slices gives
  $ chi_C \( \( 0 \, 1 \) \) = n ! \| K \| \, #h(2em) chi_D \( \( 0 \, m \) \) = n ! m^(- m) \| \( K - z_0 \)^compose \| . $
  For general cone data, interiority of $V$ gives $chevron.l V \, x chevron.r gt.eq c \| x \|$ on $C$, and interiority of $U$ gives the analogous estimate on $D$. These inequalities prove finiteness. Under the displayed transformation, the two change-of-variables factors are $\| det B \|$ and $\| det B \|^(- 1)$, and the inner products in the exponential factors are unchanged. ◻
]

It therefore suffices to prove

#[#set math.equation(numbering: n => "(1)")
 $ chi_C \( V \) chi_D \( U \) med gt.eq med 1 \, $ <eq:1>]

whenever $C subset bb(R)^m$ is closed, convex, solid, and pointed, $D = C^(*)$, $U in "int" C$, $V in "int" D$, and $chevron.l U \, V chevron.r = m$. These will be the standing cone assumptions. We will also show that equality implies that $C$ is a linear image of an orthant; Section 7 completes the equality argument for the original body.

The proof constructs two maps from Gaussians using projections on the cones. To control their Jacobians we compare the whole field of projection derivatives to matrix thresholds, with a linear Gaussian matrix as threshold variable. A small feedback in the Gaussian covariance will be used to handle functions of that linear matrix. In the cone argument $C \, D$ refer to cones, while $sans(K) \, sans(C)$ below are scalar profiles and $upright(bold(K)) \, upright(bold(C))$ will be expectations of their symmetric-matrix evaluations. Real layer indices such as $z$ in the projection field are separate from the Gaussian vector input.

=== 2.3 Scalar profiles and their identities <scalar-profiles-and-their-identities>

The estimates will use fixed scalar functions, independent of the cone and its dimension. Write $phi.alt \( x \) = \( 2 pi \)^(- 1 \/ 2) e^(- x^2 \/ 2)$, $p \( x \) = integral_(- oo)^x phi.alt \( y \) thin d y$, and $gamma f = integral f \( x \) phi.alt \( x \) thin d x$. Put $cal(N) = x partial_x - partial_x^2$. To define three profiles, temporarily write $X = p \/ phi.alt$, $Y = \( 1 - p \) \/ phi.alt$, $f = - \( 1 - p \) - log p$, and $j = - p - log \( 1 - p \)$. Set

$ d = \( 1 + x X \)^2 f + \( 1 - x Y \)^2 j \, #h(2em) g = 1 / 2 \( 1 - X^2 f - Y^2 j \) \, #h(2em) v = log \( X Y \) . $

#thm([Lemma 2.2.])[
  (Profile identities).  #emph[The functions just defined satisfy 
#[#set math.equation(numbering: n => "(2)")
 $ \( cal(N) + 2 \) g = d \, #h(2em) d' = 2 x d - v' - 2 g' \, #h(2em) cal(N) d - v'' = - \( cal(N) + 2 \) \( d + g'' \) . $ <eq:2>]

]
] <lem:profile-identities>

#proof[
  We have $X' = 1 + x X$, $Y' = x Y - 1$, $f' = - phi.alt \( 1 - p \) \/ p$, and $j' = phi.alt p \/ \( 1 - p \)$. Direct substitution gives
  $ X^2 f' + Y^2 j' = 0 \, #h(2em) X X' f' + Y Y' j' = - 1 \, #h(2em) \( X' \)^2 f' + \( Y' \)^2 j' = - v' . $
  Also $X'' = x X' + X$ and $Y'' = x Y' + Y$. Thus $g' = - \( X X' f + Y Y' j \)$, and differentiating once more proves $\( cal(N) + 2 \) g = d$. Differentiating $d = \( X' \)^2 f + \( Y' \)^2 j$ proves its stated first-order identity. Finally, differentiating the first identity twice gives $d'' = \( cal(N) + 4 \) g''$; combining this with the derivative of the second identity proves the third. ◻
]

=== 2.4 The quantitative scalar inequalities <the-quantitative-scalar-inequalities>

The parameters used are (finite decimals throughout denote exact numbers)

$ b = .602 \, quad c = .365 \, quad k = sqrt(b - c) \, quad r = .22 \, quad w = 4.6 \, quad s = 3.6 \,\
eta = .022 \, quad kappa = 1.16 \, quad lambda = .65 \, quad a_R = 7.5 \,\
t_(-) = - .022 \, quad t_(+) = .064 \, quad t_c = .021 \, quad t_r = .043 \, quad m_(*) = .352 . $

Define

$ sans(K) & = d - 2 g \, #h(2em) sans(C) = - d + \( a_R - 1 \) g'' \,\
pi \( x \) & = r \( cos \( w "arsinh" \( x \/ s \) \) \, sin \( w "arsinh" \( x \/ s \) \) \) \,\
q \( x \) & = k - sqrt(b - r^2 - d \( x \)) \, #h(2em) u = \( pi \, q \) \, #h(2em) S_u = \( 2 + cal(N) \) u = \( S_pi \, S_q \) \,\
F & = d + \| u \|^2 = c + 2 k q . $

The key algebraic choice is that $d + \| u \|^2$ is affine in $q$. It will allow a quadratic profile correction to be estimated through one component. The circular part of $u$ supplies variation on every nontrivial segment; Appendix 10 quantifies that fact. The parameters are fixed independently of the body and dimension. The first group of inequalities below permits the covariance choice, the second controls errors from the projection layers, and the third controls the spectral interval averages of the linear Gaussian field. Their constants are not asserted to be optimal. The argument uses precisely the following inequalities, which we collect as one input. Their proofs appear in Appendices 9 and 10. A bar over a function with specified endpoints denotes its uniform average on that segment, or its value when the endpoints coincide.

#thm([Proposition 2.3.])[
  (Scalar inequalities).  #emph[The profiles and exact parameters above have the following properties.]
  #emph[•$b - r^2 - d > 0 \, med \| v' - x \| lt.eq .319 \, med sans(C) lt.eq - .341 \, med S_q > 0$, and 
$ lambda t_(-)^2 + t_(-) sans(C) + sans(K) > 0 \, #h(2em) lambda t_(+)^2 + t_(+) sans(C) + sans(K) < 0 \, #h(2em) 2 \( - .37 \) sans(C) - \( .37 \)^2 - 4 lambda sans(K) > m_(*)^2 . $

 •Write 
$ b_m & = frac(\( 1 + t_(+) \) \( b - 3 eta \), 3 \( 3 \( b + eta \) - 4 c \)) \, #h(2em) e_0 = .256 \, #h(2em) alpha = 2.26 \, #h(2em) h_s = .5 \,\
H \( z \, x \) & = 4 c + 4 k q \( x \) + 2 \( k - q \( x \) \) S_q \( z \) - 2 S_pi \( z \) dot.op pi \( x \) \, #h(2em) H_0 \( z \, x \) = H \( z \, x \) + v'' \( x \) - 2 kappa . $

 Pointwise, 
#[#set math.equation(numbering: n => "(3)")
 $ H + t_c H_0 - 1 / 2 t_r \( h_s + H_0^2 \/ h_s \) > 2 \( b + eta + \( b + eta - kappa \) t_(-) \) + 2 b_m S_q \( z \) S_q \( x \) + 2 e_0 \( 2 t_r \)^2 + H_0^2 \/ alpha \,\
4 c + 2 k \( S_q \( z \) + S_q \( x \) \) - S_q \( z \) S_q \( x \) - S_pi \( z \) dot.op S_pi \( x \) > 0 . $ <eq:3>]

 •For endpoints $x_(-) < x_(+)$, use subscripts $sigma in { - \, + }$ for evaluations, with $- sigma$ the opposite endpoint. Then 
#[#set math.equation(numbering: n => "(4)")
 $ e_K + Gamma & + frac(1, 8 lambda) sum_sigma \( overline(sans(C)) - sans(C)_(- sigma) - overline(\| u - u_sigma \|^2) \)^2 + t_(+) / 2 sum_sigma \| macron(u) - u_sigma \|^2 < overline(\| u \|^2) - \| macron(u) \|^2 \,\
e_K & = overline(sans(K)) - \( sans(K)_(+) + sans(K)_(-) \) \/ 2 \,\
Gamma & = .80 / m_(*)^2 #scale(x: 120%, y: 120%)[\[] 1.25 \( sans(K)_(+) - sans(K)_(-) + t_c \( sans(C)_(+) - sans(C)_(-) \) \)^2 + 5 t_r^2 \( sans(C)_(+) - sans(C)_(-) \)^2 #scale(x: 120%, y: 120%)[\]] . $ <eq:4>]

 For coincident endpoints the two sides in the inequality are equal.]
] <prop:scalar-input>

The first set of inequalities permits the covariance choice in Section 3. The function $v$ enters the entropy estimate, where Equation (2) expresses its contribution through $d$ and $g$. The identity $d + \| u \|^2 = F$ and the two-variable and segment inequalities are used in the later quadratic and spectral estimates. In particular $d \, g \, v \, q$ are even, as follows from their definitions.

We will also use that these profiles are smooth and that their derivatives have at most polynomial growth. The exponentially large factor $X$ does not make the profiles grow exponentially: its occurrences can be rewritten in terms of the Gaussian tail ratio $Y$. On $x gt.eq 0$, $Y = integral_0^oo e^(- x y - y^2 \/ 2) d y$ is comparable to $\( 1 + x \)^(- 1)$, and $1 - x Y = O \( \( 1 + x \)^(- 2) \)$. Set $h_0 \( y \) = \( - log \( 1 - y \) - y \) \/ y^2$, with its smooth value at zero. At $y = 1 - p$, the relevant formulas are

$ \( 1 + x X \)^2 f = \( 1 - p \( 1 - x Y \) \)^2 h_0 \( y \) \, #h(2em) X^2 f = Y^2 p^2 h_0 \( y \) \, #h(2em) j = - p - log \( Y phi.alt \) . $

Differentiating the Laplace integral for $Y$ gives bounds for its derivatives; these formulas then give polynomial derivative bounds for $d \, g \, v \, sans(K) \, sans(C)$. Reflection supplies the negative half-line. Moreover, $d arrow.r 1 \/ 2$ at both ends. The radicand in $q$ therefore tends to $b - r^2 - 1 \/ 2 = .0536 > 0$. Its positivity in Proposition 5, together with continuity on compact intervals, gives a uniform positive lower bound. Differentiation of the square root is thus legitimate globally and gives the same growth property for $q$. The bounds for $pi$ follow directly from its explicit formula, and those for $F$ follow from $F = d + \| u \|^2$. Appendix 9 provides the quantitative bounds used here. No such growth claim is made for the temporary factors $X \, Y$ separately.

In the cone argument below, a smooth scalar test always means that the test and all its derivatives have at most polynomial growth. We use natural logarithms. Matrix inequalities for symmetric matrices are in quadratic form order.

== 3 Biased projections and simultaneous normalization <sec:02-projections>

We now construct a family of projections whose means follow a prescribed curve in the cone. Its derivative field will provide both the Jacobians in the entropy argument and the matrix fields in the quadratic estimates. The final step of this section chooses coordinates and a Gaussian covariance simultaneously.

=== 3.1 The biased projection field <the-biased-projection-field>

For now fix the cone data satisfying the standing assumptions of Section 2, and a symmetric matrix $T$ with $t_(-) I lt.eq T lt.eq t_(+) I$. Set

$ Sigma = I + T \, #h(2em) Z = Sigma^(1 \/ 2) G \, $

where $G$ is standard Gaussian in $bb(R)^m$. Thus every eigenvalue of $Sigma$ lies in $\[ .978 \, 1.064 \]$. Expectations refer to $G$, unless another variable is specified. For matrix fields use

$ tau B = 1 / m bb(E) "tr" B \, #h(2em) tau_Lambda B = tau \( Lambda B \) \, #h(2em) chevron.l B \, E chevron.r_Lambda = tau_Lambda \( B compose E \) \, #h(2em) B compose E = 1 / 2 \( B E + E B \) . $

Here $B \, E$ are symmetric and $Lambda$ is a deterministic symmetric weight; the same notation applies to deterministic matrices. Transposition and cyclicity give $"tr" \( Lambda B E \) = "tr" \( Lambda E B \)$. We suppress the subscript $I$. For arbitrary square matrix fields write $parallel B parallel_2^2 = tau \( B^(sans(T)) B \)$, and put $\[ B \, E \] = B E - E B$.

Let $Pi_C$ denote Euclidean nearest-point projection onto $C$, and put $a \( z \) = phi.alt \( z \) + z p \( z \)$, so that $a > 0$ and $a' = p$.

#thm([Lemma 3.1.])[
  (Biased projections).  #emph[For every $z in bb(R)$ there is a unique vector $xi_z$ such that 
#[#set math.equation(numbering: n => "(5)")
 $ X_z = Pi_C \( Z + xi_z \) \, #h(2em) Y_z = Pi_D \( - Z - xi_z \) \, #h(2em) bb(E) X_z = a \( z \) U . $ <eq:5>]

 The map $z mapsto xi_z$ is smooth. The a.e. derivative $P_z = D Pi_C \( Z + xi_z \)$ is a symmetric positive contraction, and 
$ X_z - Y_z = Z + xi_z \, #h(2em) X_z dot.op Y_z = 0 \, #h(2em) \( bb(E) P_z \) xi'_z = p \( z \) U . $

 Define 
$ B \( z \) = 1 / m U dot.op bb(E) Y_z \, quad r_1 \( z \) = - B' \( z \) \, quad h \( z \) = tau_Sigma P_z \, quad s_0 = tau Sigma . $

 Then 
#[#set math.equation(numbering: n => "(6)")
 $ h \( z \) = 1 / m bb(E) \( X_z dot.op Z \) = 1 / m bb(E) \| X_z - bb(E) X_z \|^2 + a \( z \) B \( z \) \,\
h' = p B + a r_1 \, #h(2em) r_1 > 0 . $ <eq:6>]

]
] <lem:biased-projections>

#proof[
  Moreau’s cone decomposition, with the positive-dual convention, gives $Pi_C \( w \) - Pi_D \( - w \) = w$ and orthogonality of the two terms #cite(label("Moreau1962")) #cite(label("Soltan2019")). Here is the sign convention directly. Writing $x = Pi_C \( w \)$, the projection variational inequality is $chevron.l w - x \, c - x chevron.r lt.eq 0$ for $c in C$. Taking $c = 0 \, 2 x$ gives $chevron.l w - x \, x chevron.r = 0$; the same inequality then gives $y = x - w in D$. For $d in D$, $chevron.l - w - y \, d - y chevron.r = - chevron.l x \, d chevron.r lt.eq 0$, so $y = Pi_D \( - w \)$. Applying the projection inequality to two inputs also gives $\| Pi_C \( w \) - Pi_C \( w' \) \|^2 lt.eq chevron.l Pi_C \( w \) - Pi_C \( w' \) \, w - w' chevron.r$, hence the projection is one-Lipschitz. It is the gradient of the convex function
  $ Phi \( w \) = 1 / 2 \| Pi_C \( w \) \|^2 = sup_(x in C) #scale(x: 120%, y: 120%)[\(] chevron.l w \, x chevron.r - 1 / 2 \| x \|^2 #scale(x: 120%, y: 120%)[\)] . $
  Rademacher’s theorem gives its a.e. differentiability #cite(label("Rademacher1919")) #cite(label("NekvindaZajicek1988")). A Lipschitz function is absolutely continuous on coordinate lines; one-dimensional integration by parts and Fubini’s theorem identify these derivatives with the weak derivatives. The convex-gradient representation therefore makes the a.e. derivative symmetric and positive semidefinite, and the Lipschitz bound makes it at most $I$. Symmetry can equivalently be seen from commutation of weak mixed derivatives.
  For fixed $a > 0$, minimize $Psi_a \( xi \) = bb(E) Phi \( Z + xi \) - a U dot.op xi$. Write the orthogonal cone decomposition of $xi$ as $xi = x - y$. Since $U$ is interior to $C$, there is $c > 0$ with $U dot.op y gt.eq c \| y \|$ for $y in D$. Jensen’s inequality gives
  $ Psi_a \( xi \) gt.eq 1 / 2 \| x \|^2 - a \| U \| \| x \| + a c \| y \| . $
  This lower bound is coercive. Gaussian convolution makes $Psi_a$ smooth, with Hessian $bb(E) D Pi_C \( Z + xi \)$. This Hessian is strictly between $0$ and $I$: the nondegenerate Gaussian assigns positive probability to open subsets of $"int" C$, where the derivative is $I$, and of $- "int" D$, where it is zero. Thus the minimizer is unique, and its stationarity condition is $bb(E) X = a U$. The implicit function theorem proves smooth dependence on $z$ and the displayed formula for $xi'_z$.
  Choose a measurable bounded symmetric-contraction representative for the derivative where it is undefined. For each layer these exceptional inputs are Gaussian-null; Fubini’s theorem makes the choice immaterial to all layer integrals. Such a representative can be chosen jointly measurably by using difference quotients for the projection.
  Gaussian integration by parts gives $bb(E) \( X_z dot.op Z \) = bb(E) "tr" \( Sigma P_z \)$. Since $bb(E) Y_z = a U - xi_z$, orthogonality gives
  $ bb(E) \( X_z dot.op Z \) = bb(E) \| X_z \|^2 - a U dot.op xi_z . $
  Subtracting $\| bb(E) X_z \|^2$ proves the variance expression in Equation (6). Moreover, $nabla \| Pi_C \|^2 = 2 Pi_C$, so
  $ frac(d, d z) bb(E) \| X_z \|^2 = 2 a U dot.op xi'_z \, #h(2em) h' = 1 / m \( a U dot.op xi'_z - p U dot.op xi_z \) = p B + a r_1 . $
  Finally,
  $ r_1 = p / m U dot.op #scale(x: 120%, y: 120%)[\(] \( bb(E) P_z \)^(- 1) - I #scale(x: 120%, y: 120%)[\)] U > 0 . $
  No commutation of $Sigma$ with $bb(E) P_z$ is used. ◻
]

=== 3.2 Tails and layer integrals <tails-and-layer-integrals>

We need estimates that allow integration over all layers, despite possible nonsmoothness of the cone boundary. In Lemma 7, constants are locally uniform over invertible linear transformations of the fixed cone data, and uniform over the spectral box for $T$. They may depend on the dimension.

#thm([Lemma 3.2.])[
  (Gaussian layer tails).  #emph[For every finite $r gt.eq 1$, there are $c_r \, C_r > 0$ such that 
$ parallel P_z parallel_(L^r) + parallel X_z parallel_(L^r) & lt.eq C_r e^(- c_r z^2) &  & \( z lt.eq 0 \) \,\
parallel I - P_z parallel_(L^r) + parallel Y_z parallel_(L^r) & lt.eq C_r e^(- c_r z^2) &  & \( z gt.eq 0 \) . $

 Here any fixed finite-dimensional matrix norm can be used. Also $B \( z \) lt.eq C \( 1 + \| z \| \)$ for $z lt.eq 0$. The positive measure $mu = h' \( z \) thin d z$ has total mass $s_0$ and all polynomial moments. The measures with densities $a r_1$ and $p r_1$ have all polynomial moments as well.]
] <lem:projection-tails>

#proof[
  Interiority and Equation (5) give
  $ bb(E) \| X_z \| lt.eq C a \( z \) \, #h(2em) bb(E) \| Y_z \| lt.eq C B \( z \) . $
  For any one-Lipschitz vector function $F$, $\| F \( Z \) \| lt.eq bb(E) \| F \( Z \) \| + bb(E) \| Z \| + \| Z \|$; apply this to both projections. For $s gt.eq 0$,
  $ a \( - s \) = phi.alt \( s \) integral_0^oo t e^(- s t - t^2 \/ 2) thin d t asymp frac(phi.alt \( s \), \( 1 + s \)^2) \, #h(2em) p \( - s \) lt.eq C frac(phi.alt \( s \), 1 + s) . $
  The lower bound follows by restricting the integral to $\[ 0 \, \( 1 + s \)^(- 1) \]$; for the upper bound omit one or the other exponential factor. On $\[ 0 \, oo \)$, $a \( z \) asymp 1 + z$.
  For negative $z$, split $bb(E) \( X_z dot.op Z \)$ at $\| Z \| = C_0 \( 1 + \| z \| \)$. The first part is bounded by $C \( 1 + \| z \| \) a \( z \)$. In the second part the pointwise Lipschitz bound and Gaussian tails give the same bound when $C_0$ is sufficiently large. Hence
  $ 0 lt.eq h \( z \) lt.eq C \( 1 + \| z \| \) a \( z \) \, #h(2em) B \( z \) lt.eq h \( z \) \/ a \( z \) lt.eq C \( 1 + \| z \| \) . $
  Since $0 lt.eq P_z lt.eq I$ and $Sigma gt.eq .978 I$, this gives Gaussian decay of every finite moment of $P_z$. The first moment of $X_z$ is Gaussian-small, while the Lipschitz bound gives bounded moments of arbitrarily high order on the negative half-line. Interpolation gives the asserted decay of its $L^r$ norms.
  For positive $z$, Equation (6) gives $a B lt.eq h lt.eq s_0$, and thus
  $ \| bb(E) Y_z \| lt.eq C s_0 \/ a \( z \) \, #h(2em) xi_z = a \( z \) U - bb(E) Y_z . $
  A fixed interior ball about $U$ shows that $xi_z$ is a distance at least $c z$ from the complement of $C$ for all sufficiently large $z$. On $\| Z \| < c z$ the projection is the identity, so $Y_z = 0$ and $P_z = I$ almost surely. Gaussian tails and the pointwise Lipschitz bound prove the remaining estimates.
  The monotone function $h$ tends to $0$ and $s_0$ at the two ends, with Gaussian tails. Integrating these tail functions proves the mass and moment assertions for $mu$. Finally $a r_1 lt.eq h'$, and $p \/ a$ has polynomial growth, proving the corresponding assertions for the other two densities. ◻
]

For a smooth scalar test $f$ as in Section 2, define

#[#set math.equation(numbering: n => "(7)")
 $ H_f = integral_(bb(R)) \( p \( z \) I - P_z \) f' \( z \) thin d z \, #h(2em) iota \( z \) = z \,\
A = H_iota \, #h(2em) M_i = bb(E) G_i A \, #h(2em) L = sum_(i = 1)^m G_i M_i \, #h(2em) R = A - L . $ <eq:7>]

Lemma 7 makes these layer integrals convergent in every finite $L^r$, and all the displayed matrix fields have all finite moments.

#thm([Lemma 3.3.])[
  (The Gaussian Sobolev interface).  #emph[For every smooth $f$ with polynomially bounded derivatives, the centered vector field 
$ W_f = integral_(bb(R)) \( p \( z \) Z - X_z + bb(E) X_z \) f' \( z \) thin d z $

 converges in Gaussian $W^(1 \, 2)$, and its weak Jacobian in $G$ is $D_G W_f = H_f Sigma^(1 \/ 2)$.]
] <lem:projection-sobolev>

#proof[
  At negative layers the integrand tends to zero in $L^2$ at a Gaussian rate. At positive layers use
  $ X_z - bb(E) X_z = Z + Y_z - bb(E) Y_z $
  to write it as $\( p \( z \) - 1 \) Z - Y_z + bb(E) Y_z$, with the same decay. The weak Jacobian of the integrand is $\( p \( z \) I - P_z \) Sigma^(1 \/ 2)$, whose $L^2$ norm has integrable Gaussian tails as well. Thus the truncated integrals and their weak derivatives are Cauchy in $L^2$; closedness of the weak derivative gives the claim. Each integrand is centered. This argument differentiates the Lipschitz projections, not their derivative fields $P_z$. ◻
]

For comparison, when $C$ is the nonnegative orthant, $U$ is the all-ones vector, and $T = 0$, one has $xi_z = z U$ and

$ P_z = "diag" \( 1_({ - G_i lt.eq z }) \) \, #h(2em) A = L = "diag" \( - G_i \) . $

Indeed $integral_(bb(R)) \( p \( z \) - 1_({ v_0 lt.eq z }) \) thin d z = v_0$. In the general case the family $P_z$ is neither assumed nested nor assumed to consist of projections. The field $L$ is its deterministic-coefficient, degree-one Gaussian comparison.

=== 3.3 Choosing coordinates and covariance <choosing-coordinates-and-covariance>

The remaining task is to arrange both a mean balance for $A$ and a matrix equation for $T$.

#thm([Proposition 3.4.])[
  (Simultaneous normalization).  #emph[A linear transformation of the cone data and a symmetric $T$ in the prescribed spectral box can be chosen so that 
#[#set math.equation(numbering: n => "(8)")
 $ bb(E) A = 0 \, #h(2em) lambda T^2 + upright(bold(C)) compose T + upright(bold(K)) = 0 \, #h(2em) upright(bold(H)) := - upright(bold(C)) - 2 lambda T gt.eq m_(*) I \,\
upright(bold(C)) = bb(E) sans(C) \( L \) \, #h(2em) upright(bold(K)) = bb(E) sans(K) \( L \) . $ <eq:8>]

 Matrix functions here and below use spectral calculus for symmetric matrices.]
] <prop:normalization>

#proof[
  We use the scalar bounds in Proposition 5. For a symmetric matrix $Q$, transform the original data by
  $ C_Q = e^Q C_(upright("in")) \, #h(2em) D_Q = e^(- Q) D_(upright("in")) \, #h(2em) U_Q = e^Q U_(upright("in")) \, #h(2em) V_Q = e^(- Q) V_(upright("in")) . $
  Lemma 3 preserves the Laplace product and $U_Q dot.op V_Q = m$. Let $T$ vary over its spectral box. For each pair $\( Q \, T \)$, construct the biases and fields as above; we suppress their dependence on $Q \, T$ in the notation. We first establish continuity, then construct a continuous self-map and exclude its fixed points on a sufficiently large $Q$-sphere.
  ===== 3.3.1 Continuity. <continuity.>
  Under convergent invertible transformations the cone projections converge uniformly on compact sets. To see this, projected points are bounded by the norm of the input; subsequential limits belong to the limiting cone and minimize the limiting distance, so uniqueness identifies the limit. Equicontinuity upgrades the conclusion to compact-uniform convergence. The coercive lower bound in Lemma 6 is locally uniform, so the biases also converge at every fixed layer.
  There is no need to assert pointwise convergence of the derivatives of these projections. Gaussian integration by parts instead gives
  $ \( bb(E) P_z \) Sigma^(1 \/ 2) & = bb(E) X_z G^(sans(T)) \,\
\( bb(E) G_i P_z \) Sigma^(1 \/ 2) & = bb(E) X_z \( G_i G^(sans(T)) - e_i^(sans(T)) \) \, $
  where $e_i$ is the $i$-th coordinate vector. The pointwise Lipschitz bounds dominate these expectations locally in the parameters. Lemma 7, also with a Gaussian factor $G_i$ by Hölder’s inequality, permits integration over layers. Hence $bb(E) A$ and all $M_i$ are continuous. Their local boundedness and the polynomial growth of the profiles then give continuity of $upright(bold(C)) \, upright(bold(K))$.
  ===== 3.3.2 The covariance update. <the-covariance-update.>
  Put $Delta = upright(bold(C))^2 - 4 lambda upright(bold(K))$, and set
  $ T_(upright("new")) = frac(- upright(bold(C)) - sqrt(Delta), 2 lambda) . $
  The scalar inequalities, spectral calculus, and expectation imply
  $ Delta gt.eq m_(*)^2 I \,\
\( upright(bold(C)) + 2 lambda t_(+) I \)^2 lt.eq Delta lt.eq \( upright(bold(C)) + 2 lambda t_(-) I \)^2 . $
  For the first inequality use $\( upright(bold(C)) + .37 I \)^2 gt.eq 0$. For the other two, expand the squares and use the corresponding endpoint inequalities in Proposition 5. Moreover $upright(bold(C)) + 2 lambda t_plus.minus I < 0$, since $upright(bold(C)) lt.eq - .341 I$ and $2 lambda t_(+) = .0832$.
  The Löwner–Heinz inequality states that positive square root is order preserving, including for noncommuting matrices #cite(label("Chansangiam2013")) Theorem 2.3. Indeed its integral representation uses the order-preserving matrices $B \( B + t I \)^(- 1)$. Taking square roots in the preceding sandwich therefore gives
  $ - upright(bold(C)) - 2 lambda t_(+) I lt.eq sqrt(Delta) lt.eq - upright(bold(C)) - 2 lambda t_(-) I \, $
  so $t_(-) I lt.eq T_(upright("new")) lt.eq t_(+) I$. The positive discriminant gap also gives continuity of this update.
  ===== 3.3.3 A uniform inward estimate. <a-uniform-inward-estimate.>
  We claim that $"tr" \( Q bb(E) A \) < 0$ whenever $sigma = parallel Q parallel_(upright("Frob"))$ is sufficiently large, uniformly over its eigenbasis and over $T$ in the box. All constants in this paragraph depend only on the original cone data and the fixed dimension, not on $Q \, T$.
  Diagonalize $Q$, write its eigenvalues as $d_j$, and put $h_j \( z \) = bb(E) \( P_z \)_(j j)$. Applying the original interior-vector bounds to $e^(- Q) X_z$ and $e^Q Y_z$ gives
  $ bb(E) \| \( X_z \)_j \| lt.eq C a \( z \) e^(d_j) \, #h(2em) bb(E) \| \( Y_z \)_j \| lt.eq C B \( z \) e^(- d_j) . $
  Gaussian integration by parts in this basis gives $h_j = bb(E) \[ \( X_z \)_j \( Sigma^(- 1) Z \)_j \]$, and the analogous identity for $1 - h_j$ uses $- Y_z$. The covariance bounds and the one-Lipschitz coordinate bounds imply, for every cutoff $J gt.eq 1$,
  $ h_j & lt.eq C J bb(E) \| \( X_z \)_j \| + C e^(- c J^2) \,\
1 - h_j & lt.eq C J bb(E) \| \( Y_z \)_j \| + C e^(- c J^2) . $
  For example, bound $\| \( X_z \)_j \|$ by its absolute mean plus $bb(E) \| Z \| + \| Z \|$, and split the Gaussian integral at $\| Z \| = J$. A tail term containing the absolute mean is absorbed by the first term. These bounds require no commutation of $Q$ and $Sigma$.
  Set $A_j = integral_(bb(R)) \( p - h_j \) thin d z$ and $epsilon = 1 \/ sqrt(m)$. The quantity to be made negative is $"tr" \( Q bb(E) A \) = sum_j d_j A_j$. Thus a negative eigenvalue requires a lower bound on $A_j$, whereas a positive eigenvalue requires an upper bound. We obtain a uniform bound for each sign and then improve it when $\| d_j \| gt.eq epsilon sigma$.
  If $d_j lt.eq 0$, use $J = 1 + \| z \|$ on the negative half-line in the estimate for $h_j$. The bound $bb(E) \| \( X_z \)_j \| lt.eq C a \( z \) e^(d_j) lt.eq C a \( z \)$ makes its integral bounded independently of $Q \, T$. On the positive half-line, $p - h_j gt.eq p - 1$, whose integral is finite. Together these give $A_j gt.eq - C$.
  If in addition $d_j lt.eq - epsilon sigma$, the same estimate with a sufficiently large fixed cutoff gives $h_j lt.eq 1 \/ 4$ on $\[ 0 \, e^(epsilon sigma \/ 2) \]$ for large $sigma$: here $a \( z \) e^(d_j) lt.eq C \( 1 + e^(epsilon sigma \/ 2) \) e^(- epsilon sigma)$ tends to zero. On this interval $p - h_j gt.eq 1 \/ 4$. The complementary integrals retain their uniform lower bound, so
  $ A_j gt.eq 1 / 4 e^(epsilon sigma \/ 2) - C . $
  For positive eigenvalues we first note the uniform integral bound
  $ integral_0^oo B thin d z lt.eq 2 integral_0^oo p B thin d z lt.eq 2 integral_0^oo h' thin d z lt.eq 2 s_0 . $
  On $\[ 0 \, e^(2 sigma) \]$, use $J = C_1 sqrt(sigma)$, with $C_1$ large enough that the integrated Gaussian error is negligible. This bounds the integral of $1 - h_j$ there by $C sqrt(sigma) e^(- d_j) + o \( 1 \)$.
  The remaining tail must be controlled despite the changing cone. The transformed and scaled image of a fixed interior ball about the original $U$ contains a ball about $a U_Q$ of radius at least $c a e^(- sigma)$. On the other hand,
  $ \| bb(E) Y_z \| lt.eq C e^sigma B \( z \) lt.eq C e^sigma \/ a \( z \) . $
  For $z gt.eq e^(2 sigma)$, this error is negligible relative to the radius. Thus $xi_z = a U_Q - bb(E) Y_z$ has interior distance at least $c z e^(- sigma)$, and
  $ 1 - h_j \( z \) lt.eq C e^(- c z^2 e^(- 2 sigma)) \, #h(2em) integral_(e^(2 sigma))^oo \( 1 - h_j \) thin d z lt.eq C e^sigma integral_(e^sigma)^oo e^(- c u^2) thin d u = o \( 1 \) . $
  Combining these bounds with $integral_(- oo)^0 p < oo$, for every $d_j gt.eq 0$ we have
  $ A_j lt.eq C + C sqrt(sigma) e^(- d_j) . $
  If $d_j gt.eq epsilon sigma$, choose $rho > 0$ with $rho^2 \/ 2 < epsilon$. The lower bound on $a$ gives
  $ sup_(- rho sqrt(sigma) lt.eq z lt.eq 0) frac(e^(- d_j), a \( z \)) lt.eq C \( 1 + sigma \) e^(- \( epsilon - rho^2 \/ 2 \) sigma) arrow.r 0 . $
  For every real $z$, the bound $a B lt.eq h lt.eq s_0$ gives $B \( z \) lt.eq s_0 \/ a \( z \)$. A large fixed cutoff in the estimate for $1 - h_j$ consequently gives $h_j gt.eq 3 \/ 4$ throughout this interval. Its contribution to $A_j$ is at most $- rho sqrt(sigma) \/ 4$, since $p lt.eq 1 \/ 2$ there. On the rest of the negative half-line use $p - h_j lt.eq p$; its integral is bounded by $integral_(- oo)^0 p$. On the positive half-line use $p - h_j lt.eq 1 - h_j$ and the preceding bound $C sqrt(sigma) e^(- d_j) + o \( 1 \)$, which is bounded when $d_j gt.eq epsilon sigma$. Hence $A_j lt.eq - c sqrt(sigma) + C$.
  At least one eigenvalue has $\| d_j \| gt.eq epsilon sigma$. A positive such eigenvalue contributes at most $- c sigma^(3 \/ 2) + O \( sigma \)$ to $sum_j d_j A_j$; a negative such eigenvalue contributes a still larger negative amount in magnitude. Every remaining negative eigenvalue contributes at most $C \| d_j \|$, and every remaining positive eigenvalue contributes at most $C d_j + C sqrt(sigma) d_j e^(- d_j) = O \( sigma \)$. There are only $m$ terms. Hence $"tr" \( Q bb(E) A \) = sum_j d_j A_j < 0$ for all sufficiently large $sigma$, as claimed.
  ===== 3.3.4 The fixed point. <the-fixed-point.>
  Take a closed Frobenius ball of such a radius and the closed spectral box for $T$. On their product update $T$ as above and update $Q$ by nearest-point projection of $Q + bb(E) A$ back to the ball. This is a continuous self-map of a finite-dimensional compact convex set. Brouwer’s fixed point theorem #cite(label("Brouwer1911")) applies. A fixed point on the $Q$-sphere would require $bb(E) A$ to be a nonnegative multiple of $Q$, contradicting the inward estimate. At an interior fixed point, $bb(E) A = 0$.
  Finally write $S = sqrt(Delta)$. At the fixed point $T = \( - upright(bold(C)) - S \) \/ \( 2 lambda \)$, and direct expansion gives
  $ lambda T^2 + upright(bold(C)) compose T + upright(bold(K)) = frac(S^2 - upright(bold(C))^2, 4 lambda) + upright(bold(K)) = 0 . $
  The mixed products cancel without any commutation assumption. Also $upright(bold(H)) = S gt.eq m_(*) I$, proving Equation (8). ◻
]

We henceforth use the fixed choices of Proposition 9. In particular $T$ and all $M_i$ are deterministic as functions of the Gaussian input. The balance $bb(E) A = 0$ makes $R = A - L$ orthogonal to Gaussian degrees zero and one.

== 4 The entropy inequality <sec:03-entropy>

We use two cone-valued maps of a Gaussian to bound the dual Laplace integrals. Change of variables bounds these integrals through the maps’ expected log Jacobians and linear costs. Comparison with the one-dimensional Gaussian model will put the remaining scalar terms into the form needed for the quadratic argument. We first prove the log integrability required by change of variables and Jensen’s inequality, and then carry out that argument with smoothed maps.

=== 4.1 Projection maps and their Jacobians <projection-maps-and-their-jacobians>

In the orthant example of Section 3, the coordinate maps $- log p \( - G_i \)$ and $- log p \( G_i \)$ take values in the positive half-line. Since $p \( G_i \)$ is uniform on $\( 0 \, 1 \)$, each has the standard exponential distribution. The following weights express these maps as integrals of the biased projections and extend the construction to arbitrary cones.

Define the positive scalar weights

$ c_X \( z \) = frac(phi.alt \( z \), p \( z \)) \, #h(2em) j_X \( z \) = z + c_X \( z \) \, #h(2em) W_X \( z \) = - c'_X \( z \) = j_X \( z \) c_X \( z \) \,\
c_Y \( z \) = c_X \( - z \) \, #h(2em) W_Y \( z \) = W_X \( - z \) = c'_Y \( z \) \, $

and the random positive semidefinite matrices

$ cal(J)_X = integral_(bb(R)) W_X \( z \) P_z thin d z \, #h(2em) cal(J)_Y = integral_(bb(R)) W_Y \( z \) \( I - P_z \) thin d z . $

The weights are polynomially bounded; $W_X$ decays at a Gaussian rate at the positive end, and $W_Y$ at the negative end. Thus these matrices have finite expected trace.

Consider the formal cone-valued maps

$ cal(T)_X \( G \) = integral_(bb(R)) W_X \( z \) X_z thin d z \, #h(2em) cal(T)_Y \( G \) = integral_(bb(R)) W_Y \( z \) Y_z thin d z . $

Their formal Jacobian factors are $cal(J)_X Sigma^(1 \/ 2)$ and $- cal(J)_Y Sigma^(1 \/ 2)$. In the orthant model, integration by parts gives exactly the coordinate maps above. To justify change of variables without imposing regularity on the cone boundary, we will use truncated, Gaussian-smoothed versions of these maps. The first task is to control the log determinants of $cal(J)_X$ and $cal(J)_Y$.

Define the symmetric nonnegative kernel

$ "nt" \( x \, z \) = tau #scale(x: 120%, y: 120%)[\(] P_(min \( x \, z \)) compose \( I - P_(max \( x \, z \)) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) N = integral.double "nt" \( x \, z \) thin d x thin d z . $

Its nonnegativity follows because the trace of a product of two positive semidefinite matrices is nonnegative. It is integrable against any polynomial weight: on $x lt.eq z$, split into $x lt.eq z lt.eq 0$, $x lt.eq 0 lt.eq z$, and $0 lt.eq x lt.eq z$. Lemma 7 gives Gaussian decay of $P_x$ at the negative end and of $I - P_z$ at the positive end. On the mixed region Hölder’s inequality gives decay in both variables; on each same-sign region the inner interval has polynomial length. The other ordered half-plane follows by symmetry.

=== 4.2 The log-Jacobian estimate <the-log-jacobian-estimate>

#thm([Lemma 4.1.])[
  (Log-Jacobian gain).  #emph[The matrices $cal(J)_X \, cal(J)_Y$ are positive definite almost surely, their log determinants are integrable, and 
#[#set math.equation(numbering: n => "(9)")
 $ tau \( log cal(J)_X + log cal(J)_Y \) gt.eq - gamma v - tau H_v + 1 / 8 N . $ <eq:11>]

]
] <lem:log-jacobian>

#proof[
  We first establish integrability and an exact formula for the contribution of $cal(J)_X$. Set
  $ J \( z \) = integral_(- oo)^z W_X \( l \) P_l thin d l \, #h(2em) S_z = J \( z \) \/ c_X \( z \) \, #h(2em) F_X \( z \) = tau log \( c_X \( z \) I + J \( z \) \) . $
  For finite $z$ the matrix inside the logarithm is bounded below by $c_X \( z \) I$, and its expected trace is finite. Hence its log determinant is integrable. Its derivative is $- W_X \( z \) \( I - P_z \)$, so the matrix and $F_X$ decrease with $z$. The trace differentiation formula gives, almost everywhere,
  $ F'_X \( z \) = - j_X \( z \) \( 1 - h_1 \( z \) \) + beta_X \( z \) \, #h(2em) h_1 \( z \) = tau P_z \, $
  where
  $ beta_X \( z \) = j_X \( z \) tau #scale(x: 120%, y: 120%)[\[] S_z \( I + S_z \)^(- 1) \( I - P_z \) #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $
  The derivative is locally bounded uniformly in the Gaussian input after normalization, which justifies differentiation under expectation on compact intervals. The nonnegativity uses positivity under the trace and requires no commutation.
  Compare $F_X$ with
  $ F_0 \( z \) = integral log c_X \( min \( z \, x \) \) thin d gamma \( x \) \, #h(2em) F'_0 = - j_X \( 1 - p \) . $
  Both functions equal $log c_X \( z \) + o \( 1 \)$ at negative infinity. For $F_X$, this follows from $0 lt.eq tau log \( I + S_z \) lt.eq tau S_z = o \( 1 \)$, using the layer tails; for $F_0$, it follows from the Gaussian tail and the polynomial growth of $log c_X$. Thus
  $ \( F_X - F_0 \)' = j_X \( h_1 - p \) + beta_X \, $
  and the signed first term is absolutely integrable. Integrating from a finite lower endpoint and letting it tend to negative infinity proves that $beta_X$ is integrable on every left half-line. At positive infinity $F_0$ tends to the finite number $gamma log c_X$. If the remaining integral of $beta_X$ were infinite, the last identity would force $F_X$ to tend to positive infinity, contrary to its decrease. The same identity bounds $F_X$ below. Consequently the limiting expectation is finite and
  $ lim_(z arrow.r oo) F_X \( z \) = gamma log c_X + integral j_X \( h_1 - p \) thin d z + integral beta_X \( z \) thin d z . $
  The matrices decrease to $cal(J)_X$. Subtracting the integrable log determinant at any finite layer permits monotone convergence to their limit, even if a zero eigenvalue is initially allowed there. The finite limiting expectation excludes that possibility almost surely. The finite expected trace controls the positive part of the limiting log determinant, so its negative part is integrable as well. We have therefore proved
  $ tau log cal(J)_X = gamma log c_X + integral j_X \( h_1 - p \) thin d z + integral beta_X \( z \) thin d z . $
  Reflection, replacing $P_z$ by $I - P_(- z)$, gives the corresponding identity for $cal(J)_Y$.
  It remains to estimate the nonnegative surplus. For $l lt.eq z$, set $D_(l \, z) = c_X \( z \)^(- 1) integral_l^z W_X \( y \) P_y thin d y$. Then
  $ 0 lt.eq D_(l \, z) lt.eq S_z \, #h(2em) D_(l \, z) lt.eq #scale(x: 120%, y: 120%)[\(] c_X \( l \) \/ c_X \( z \) - 1 #scale(x: 120%, y: 120%)[\)] I . $
  The matrix function $D mapsto D \( I + D \)^(- 1) = I - \( I + D \)^(- 1)$ is order preserving. Applying this fact and then scalar spectral calculus to $D_(l \, z)$ yields
  $ S_z \( I + S_z \)^(- 1) gt.eq D_(l \, z) \( I + D_(l \, z) \)^(- 1) gt.eq frac(1, c_X \( l \)) integral_l^z W_X \( y \) P_y thin d y . $
  We will average this inequality over $l$. First, $W_X$ is decreasing. To prove this, let $g_1$ be standard normal and condition on $g_1 lt.eq z$. The nonnegative random variable $z - g_1$ has mean $j_X \( z \)$ and variance $j'_X \( z \) = 1 - c_X \( z \) j_X \( z \) > 0$. Its survival function
  $ H_(*) \( s \) = p \( z - s \) \/ p \( z \) \, #h(2em) s gt.eq 0 \, $
  is log-concave, because $\( log p \)'' = - j_X c_X$. Since $H_(*) \( 0 \) = 1$, concavity of its logarithm implies $H_(*) \( s + t \) lt.eq H_(*) \( s \) H_(*) \( t \)$. Integrating over the positive quadrant gives
  $ 1 / 2 bb(E) \[ \( z - g_1 \)^2 divides g_1 lt.eq z \] = integral_0^oo #h(-0.16667em) integral_0^oo H_(*) \( s + t \) thin d s thin d t lt.eq j_X \( z \)^2 . $
  Thus $j'_X lt.eq j_X^2$, and $W'_X = c_X \( j'_X - j_X^2 \) lt.eq 0$.
  For $z gt.eq 0$, choose the positive measure $omega_z$ on $\[ - z \, z \]$ specified by
  $ integral_(\[ - z \, y \]) frac(d omega_z \( l \), c_X \( l \)) = frac(1, 4 j_X \( z \) W_X \( y \)) \, #h(2em) - z lt.eq y lt.eq z . $
  Its existence follows from the monotonicity of $1 \/ W_X$, with the indicated initial atom at $- z$. Integration by parts gives
  $ omega_z \( \[ - z \, z \] \) = frac(1, 4 j_X \( z \)^2) + frac(z, 2 j_X \( z \)) lt.eq pi / 8 + 1 / 2 < 1 \, $
  since $j_X$ is increasing, $j_X \( 0 \) = sqrt(2 \/ pi)$, and $j_X \( z \) gt.eq z$. Integrating the matrix inequality against this subprobability measure and using positivity gives
  $ beta_X \( z \) gt.eq 1 / 4 integral_(- z)^z "nt" \( y \, z \) thin d y #h(2em) \( z gt.eq 0 \) . $
  The reflected argument gives the corresponding estimate on the other half of the ordered region $y lt.eq z$: the two regions are distinguished by $y + z gt.eq 0$ and $y + z lt.eq 0$. Their common boundary has measure zero. Since $N$ is the integral of a symmetric kernel over the whole plane, the two surplus integrals sum to at least $N \/ 8$.
  Finally, the two scalar comparison terms sum to $- gamma v$, because $c_X c_Y = 1 \/ \( X Y \)$. The linear terms sum to
  $ integral #scale(x: 120%, y: 120%)[\(] j_X \( z \) - j_X \( - z \) #scale(x: 120%, y: 120%)[\)] \( h_1 \( z \) - p \( z \) \) thin d z = - tau H_v \, $
  using $j_X \( z \) - j_X \( - z \) = v' \( z \)$. This proves Equation (9). ◻
]

=== 4.3 Cone-valued maps and change of variables <cone-valued-maps-and-change-of-variables>

#thm([Lemma 4.2.])[
  (Entropy from the projection maps).  #emph[With $C_Y = integral W_Y B = integral c_Y r_1$, 
$ 1 / m log #scale(x: 120%, y: 120%)[\(] chi_C \( V \) chi_D \( U \) #scale(x: 120%, y: 120%)[\)] gt.eq log \( 2 pi e \) + tau log Sigma + tau \( log cal(J)_X + log cal(J)_Y \) - 1 - C_Y . $

]
] <lem:cone-entropy-maps>

#proof[
  Let $Z'$ be an independent copy of $Z$, fix $0 < zeta < 1$, and put $tilde(Z) = zeta Z + sqrt(1 - zeta^2) Z'$. The law of $tilde(Z)$ is the same as that of $Z$. Temporarily write $X_z \( h \) \, Y_z \( h \) \, P_z \( h \)$ for the fields evaluated with $Z = h$. For integers $j gt.eq 1$, define maps of $G$ by
  $ cal(T)_(X \, j) \( G \) & = integral_(- j)^j W_X \( z \) bb(E)_(Z') X_z \( tilde(Z) \) thin d z \,\
cal(T)_(Y \, j) \( G \) & = integral_(- j)^j W_Y \( z \) bb(E)_(Z') Y_z \( tilde(Z) \) thin d z . $
  Their Jacobians are $J_(X \, j) zeta Sigma^(1 \/ 2)$ and $- J_(Y \, j) zeta Sigma^(1 \/ 2)$, where
  $ J_(X \, j) & = integral_(- j)^j W_X \( z \) bb(E)_(Z') P_z \( tilde(Z) \) thin d z \,\
J_(Y \, j) & = integral_(- j)^j W_Y \( z \) bb(E)_(Z') \( I - P_z \( tilde(Z) \) \) thin d z . $
  Gaussian smoothing makes the maps smooth. Both factors are positive definite, because the conditional Gaussian sees an open set where the relevant projection derivative is the identity. Viewed as functions of $Z$, the two maps have symmetric positive and negative definite derivatives, respectively. Integration along line segments proves strict monotonicity up to sign, hence injectivity. Their values belong to $C$ and $D$; since their derivatives are nonsingular, their images are open and lie in the interiors of these cones. The inverse function theorem gives a smooth inverse on each image.
  For fixed $j \, zeta$, the log determinants of the factors are integrable. Indeed, restrict the layer integral to a fixed compact subinterval of $\[ - 1 \, 1 \]$. Its biases are bounded. A fixed ball in $"int" C$, or in $- "int" D$, has conditional Gaussian probability at least $c exp \[ - C \( 1 + \| Z \| \)^2 \]$ after the relevant translations. Thus each factor is bounded below by this scalar times $I$. The upper bound is deterministic, since $0 lt.eq P_z lt.eq I$ and the layer interval is finite. The map values also have finite first moments by the Lipschitz bounds.
  For completeness, let $rho$ be the standard Gaussian density on $bb(R)^m$. Change of variables over the image of $cal(T)_(X \, j)$, followed by Jensen’s inequality, gives
  $ log chi_C \( V \) & gt.eq log bb(E) frac(e^(- V dot.op cal(T)_(X \, j) \( G \)) \| det D_G cal(T)_(X \, j) \( G \) \|, rho \( G \))\
 & gt.eq m / 2 log \( 2 pi e \) + bb(E) log \| det D_G cal(T)_(X \, j) \| - bb(E) \[ V dot.op cal(T)_(X \, j) \] . $
  The integrability just proved justifies this step. The same argument applies to $cal(T)_(Y \, j)$ and $chi_D \( U \)$. It uses only containment of the images in the cones, not surjectivity.
  As $j arrow.r oo$, the factors increase in matrix order to $bb(E)_(Z') cal(J)_X \( tilde(Z) \)$ and $bb(E)_(Z') cal(J)_Y \( tilde(Z) \)$. Their expected traces are finite by equality of the marginal laws. Subtracting the integrable log determinant for $j = 1$ makes monotone convergence applicable; the positive parts are controlled by the expected traces. Conditional concavity of log determinant #cite(label("BoydVandenberghe2004")) then gives
  $ bb(E) log det bb(E)_(Z') cal(J)_X \( tilde(Z) \) gt.eq bb(E) log det cal(J)_X \( Z \) \, $
  and similarly for $Y$. Lemma 10 supplies the two-sided integrability needed for this conditional Jensen inequality.
  After dividing the sum of the two bounds by $m$, the two right Jacobian factors contribute $2 log zeta + tau log Sigma$. By the marginal law of $tilde(Z)$, Equation (5), and $U dot.op V = m$, the cost terms converge to $integral W_X a$ and $integral W_Y B$. The layer tails justify both limits. Integration by parts gives
  $ integral W_X a = integral c_X p = integral phi.alt = 1 \, #h(2em) integral W_Y B = integral c_Y r_1 = C_Y . $
  The boundary products vanish by the same tails. Letting $zeta arrow.t 1$ removes the term $2 log zeta$ and completes the proof. No limiting change of variables for the unsmoothed maps is needed. ◻
]

=== 4.4 Identification of the scalar terms <identification-of-the-scalar-terms>

Combining Lemmas 10 and 11 gives

$ 1 / m log #scale(x: 120%, y: 120%)[\(] chi_C \( V \) chi_D \( U \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 + tau log Sigma - tau H_v - C_Y + 1 / 8 N . $

Here $gamma v = log \( 2 pi \) - 1$: under $gamma$, $p$ is uniform on $\( 0 \, 1 \)$, so each of $gamma log p$ and $gamma log \( 1 - p \)$ equals $- 1$, whereas $gamma \( - 2 log phi.alt \) = log \( 2 pi \) + 1$.

We now compare $B \, r_1 \, h$, and $mu$ with their Gaussian references. This will express the scalar cost in terms of the profile $d$.

The Gaussian reference functions are

$ B_0 \( z \) = a \( - z \) \, #h(2em) q_0 \( z \) = 1 - p \( z \) . $

Put

$ Delta B = B - s_0 B_0 \, quad Delta r = r_1 - s_0 q_0 \, quad h_delta = h - s_0 p \, quad Delta_mu = mu - s_0 gamma . $

The identity $p B_0 + a q_0 = phi.alt$ shows that $Delta_mu$ has density $p Delta B + a Delta r = h'_delta$; also $\( Delta B \)' = - Delta r$. As for $gamma$, we use measures as integration functionals. For a smooth scalar test $j$, define

#[#set math.equation(numbering: n => "(10)")
 $ delta \[ j \] = - integral_(bb(R)) #scale(x: 120%, y: 120%)[\[] 2 p Delta B thin j + \( p Delta r + h_delta \) \( 2 z j - j' \) #scale(x: 120%, y: 120%)[\]] thin d z . $ <eq:9>]

This integral is absolutely convergent. In particular $Delta B$ grows at most linearly at the negative end, while $p Delta B$ and $h_delta$ have Gaussian tails; the weighted integrability of $p Delta r$ follows from Lemma 7.

#thm([Proposition 4.3.])[
  (Entropy inequality).  #emph[For the cone data and the fixed projection field constructed in Section 3, 
#[#set math.equation(numbering: n => "(11)")
 $ 1 / m log #scale(x: 120%, y: 120%)[\(] chi_C \( V \) chi_D \( U \) #scale(x: 120%, y: 120%)[\)] gt.eq tau \( log Sigma - T \) + tau_T H_v - delta \[ d \] + 1 / 8 N . $ <eq:10>]

]
] <prop:entropy>

#proof[
  Integration by parts gives
  $ tau_Sigma H_v = - integral h_delta v' thin d z = Delta_mu v . $
  We will prove $C_Y - s_0 + Delta_mu v = delta \[ d \]$. First, $integral p Delta B = integral a Delta r$, by integrating the derivative of $a Delta B$; their sum is the zero total mass of $Delta_mu$. Thus both integrals vanish. Since $integral c_Y q_0 = 1$ and $c_Y = 2 a - p v'$,
  $ C_Y - s_0 + Delta_mu v = - integral \( p Delta r + h_delta \) v' thin d z . $
  For any smooth polynomial-growth test $w_0$, we have
  #[#set math.equation(numbering: n => "(12)")
   $ integral #scale(x: 120%, y: 120%)[\[] p Delta B \( 2 + cal(N) \) w_0 + \( p Delta r + h_delta \) w'_0 #scale(x: 120%, y: 120%)[\]] thin d z = 0 . $ <eq:12>]
  Indeed, integrate the $w''_0$ term once by parts and use $\( Delta B \)' = - Delta r$, $h'_delta = p Delta B + a Delta r$, and $a - phi.alt = z p$. The expression becomes
  $ integral #scale(x: 120%, y: 120%)[\[] 2 p Delta B thin w_0 + \( a Delta B + h_delta \) w'_0 #scale(x: 120%, y: 120%)[\]] thin d z \, $
  which is zero because $\( a Delta B + h_delta \)' = 2 p Delta B$. The boundary products vanish: $Delta B = O \( 1 + \| z \| \)$ at the negative end, where $a \, p$ have Gaussian decay, and $B \, h - s_0$ have Gaussian decay at the positive end. The densities involving $Delta r$ have all needed polynomial moments by Lemma 7.
  Apply Equation (12) to $w_0 = g$. Equation (2) gives
  $ integral #scale(x: 120%, y: 120%)[\[] p Delta B thin d + \( p Delta r + h_delta \) g' #scale(x: 120%, y: 120%)[\]] thin d z = 0 . $
  Substituting $2 z d - d' = v' + 2 g'$ in the definition of $delta \[ d \]$ now proves the desired scalar identity. Finally,
  $ tau H_v = Delta_mu v - tau_T H_v \, #h(2em) s_0 = 1 + tau T . $
  Inserting these identities in the entropy bound yields exactly Equation (11). ◻
]

Define

$ cal(E) = delta \[ d \] - tau_T H_v + tau \( T - log Sigma \) - 1 / 8 N . $

Equation (11) bounds the normalized logarithm of the product of Laplace integrals below by $- cal(E)$. It therefore remains to prove $cal(E) lt.eq 0$.

== 5 Quadratic identities <sec:04-quadratic>

The entropy estimate reduces the cone inequality to $cal(E) lt.eq 0$. We now rewrite the signed term $delta \[ d \] - tau_T H_v$ in $cal(E)$. We first express the covariance of the layer integrals $H_f$ through a scalar kernel. Comparing that kernel with its Gaussian reference gives identities for both $delta \[ l \]$ and $delta \[ l^2 \]$. We then apply them to $d = F - \| u \|^2$, separating the functionals of the linear field $L$ from the residual field $R = A - L$ and the layer defects.

Throughout this section the choices in (8) are fixed. In particular, $T \, Sigma = I + T$, and the coefficients $M_i$ of $L = sum_i G_i M_i$ are deterministic. Scalar tests are smooth, with their derivatives of at most polynomial growth, as in the preceding sections.

=== 5.1 Gaussian covariance with a deterministic matrix weight <gaussian-covariance-with-a-deterministic-matrix-weight>

Let $cal(N)_G$ be the nonnegative Gaussian number operator in $G in bb(R)^m$, given on smooth fields by $cal(N)_G = G dot.op nabla_G - Delta_G$ and acting entrywise on matrix fields, and put

$ cal(K)_G = \( 1 + cal(N)_G \)^(- 1) . $

For symmetric matrix fields $E \, F$, recall that

$ chevron.l E \, F chevron.r_Sigma = 1 / m bb(E) "tr" #scale(x: 120%, y: 120%)[\(] Sigma \( E F + F E \) \/ 2 #scale(x: 120%, y: 120%)[\)] = 1 / m bb(E) "tr" \( Sigma E F \) . $

The second equality follows by transposition and cyclicity of trace; it does not require commutation. Since $Sigma > 0$, this is a positive inner product. Its Gaussian form norm is

$ parallel E parallel_(1 \, Sigma)^2 := chevron.l E \, \( 1 + cal(N)_G \) E chevron.r_Sigma = tau_Sigma E^2 + sum_(i = 1)^m tau_Sigma \( partial_(G_i) E \)^2 \, $

with the left side interpreted as a closed quadratic form.

The covariance formula below is the finite-dimensional Gaussian form of the Ornstein–Uhlenbeck semigroup representation in #cite(label("HoudrePrivault2002")) Proposition 2.1, Equation (2.4). We include its Hermite proof in the normalization used here.

#thm([Lemma 5.1.])[
  (Gaussian covariance formula).  #emph[Let $cal(X) \, cal(Y)$ be centered elements of the Gaussian Sobolev space $W^(1 \, 2) \( bb(R)^m \; bb(R)^m \)$. Then 
$ bb(E) \( cal(X) dot.op cal(Y) \) = bb(E) sum_(i = 1)^m \( partial_(G_i) cal(X) \) dot.op cal(K)_G \( partial_(G_i) cal(Y) \) . $

 Moreover, for every square-integrable symmetric matrix field $E$, $cal(K)_G E$ belongs to the form domain of $1 + cal(N)_G$, for the deterministic weight $Sigma$.]
] <lem:gaussian-covariance>

#proof[
  Use the orthonormal multivariate Hermite basis, indexed by $upright(bold(a)) = \( a_1 \, dots.h \, a_m \) in { 0 \, 1 \, 2 \, dots.h }^m$; see, for example, #cite(label("Bell2015")) Sections 5–6. The number operator has eigenvalue $\| upright(bold(a)) \| = sum_i a_i$, and differentiation in coordinate $i$ lowers the index by $e_i$ with factor $sqrt(a_i)$. Thus, on a nonconstant mode, differentiation and application of $cal(K)_G$ give the multiplier
  $ sum_(i : a_i > 0) frac(a_i, 1 + \| upright(bold(a)) \| - 1) = 1 . $
  This proves the covariance formula for finite Hermite sums and then for $W^(1 \, 2)$ fields by convergence of the coefficients and their weak derivatives.
  For a matrix field with coefficient $E_(upright(bold(a)))$, the contribution of $cal(K)_G E$ to its squared form norm is
  $ frac(chevron.l E_(upright(bold(a))) \, E_(upright(bold(a))) chevron.r_Sigma, 1 + \| upright(bold(a)) \|) . $
  It is summable whenever $E$ is square-integrable. The deterministic weight $Sigma$ acts only on matrix coefficients, so it commutes with the Hermite degree decomposition. The same expansion gives the stated form norm and its Dirichlet expression. ◻
]

The regularity needed here is that of the vector fields in Lemma 8. We will not differentiate the measurable projection derivatives $P_z$, or the fields $H_f$. The latter need only be square-integrable before applying $cal(K)_G$.

Define the scalar bilinear kernel

$ cal(Q) \[ f \, j \] = integral.double f \( x \) j \( z \) thin p \( min \( x \, z \) \) r_1 \( max \( x \, z \) \) thin d x thin d z . $

Its density is nonnegative and has both marginals $mu$: integrating at a fixed coordinate $z$ gives $a \( z \) r_1 \( z \) + p \( z \) B \( z \) = h' \( z \)$, by (6).

The covariance also records the contact between projections at different layers. Define

$ "ct" \( x \, z \) = 1 / m bb(E) \[ X_(min \( x \, z \)) dot.op Y_(max \( x \, z \)) \] \, #h(2em) "Ct" \( f \, j \) = integral.double "ct" \( x \, z \) f' \( x \) j' \( z \) thin d x thin d z . $

Positive duality gives $"ct" gt.eq 0$. At a single layer, Moreau’s orthogonality gives $X_z dot.op Y_z = 0$; at distinct layers the contact need not vanish. These integrals converge absolutely: on $x lt.eq z$, the same three-region argument used for $"nt"$ applies to $X_x$ and $Y_z$, with the remaining factors controlled by their polynomial moment bounds.

#thm([Lemma 5.2.])[
  (Covariance of the layer integrals).  #emph[For smooth scalar tests $f \, j$ with $gamma f = gamma j = 0$, 
#[#set math.equation(numbering: n => "(13)")
 $ chevron.l H_f \, cal(K)_G H_j chevron.r_Sigma = cal(Q) \[ f \, j \] + "Ct" \( f \, j \) . $ <eq:13>]

]
] <lem:layer-covariance>

#proof[
  Consider the centered vector fields
  $ cal(W)_f = integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] p \( z \) Z - X_z + bb(E) X_z #scale(x: 120%, y: 120%)[\)] f' \( z \) thin d z $
  and $cal(W)_j$. By Lemma 8, they belong to Gaussian $W^(1 \, 2)$, with Jacobians $H_f Sigma^(1 \/ 2)$ and $H_j Sigma^(1 \/ 2)$. Applying Lemma 13 and dividing by $m$ gives $chevron.l H_f \, cal(K)_G H_j chevron.r_Sigma$.
  We also compute this covariance from the layers. If $x lt.eq z$, the identities $X_z = Z + xi_z + Y_z$ and $xi_z = a \( z \) U - bb(E) Y_z$ imply
  $ 1 / m bb(E) #scale(x: 120%, y: 120%)[\[] \( X_x - bb(E) X_x \) dot.op \( X_z - bb(E) X_z \) #scale(x: 120%, y: 120%)[\]] = h \( x \) - a \( x \) B \( z \) + "ct" \( x \, z \) . $
  Indeed, the terms involving $a \( x \) a \( z \) \| U \|^2$ cancel after subtracting the product of the means. For the centered differences defining $cal(W)_f$, the remaining covariance kernel, apart from $"ct" \( x \, z \) - a \( min \( x \, z \) \) B \( max \( x \, z \) \)$, is
  $ s_0 p \( x \) p \( z \) - p \( x \) h \( z \) - h \( x \) p \( z \) + h \( min \( x \, z \) \) . $
  Since $mu$ has mass $s_0$ and cumulative function $h$, this equals
  $ integral #scale(x: 120%, y: 120%)[\(] p \( x \) - upright(bold(1))_({ y lt.eq x }) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] p \( z \) - upright(bold(1))_({ y lt.eq z }) #scale(x: 120%, y: 120%)[\)] thin d mu \( y \) . $
  The centered-test identity
  $ integral #scale(x: 120%, y: 120%)[\(] p \( z \) - upright(bold(1))_({ y lt.eq z }) #scale(x: 120%, y: 120%)[\)] f' \( z \) thin d z = f \( y \) $
  therefore turns its integral against $f' \( x \) j' \( z \)$ into $mu \[ f j \]$.
  The mixed distributional derivative of $a \( min \( x \, z \) \) B \( max \( x \, z \) \)$ is
  $ d mu \( x \) thin delta_x \( d z \) - p \( min \( x \, z \) \) r_1 \( max \( x \, z \) \) thin d x thin d z . $
  Off the diagonal this follows from $a' = p$ and $B' = - r_1$. On the diagonal, the jump is $p B + a r_1 = h'$. Integrating by parts in both variables thus gives $mu \[ f j \] - cal(Q) \[ f \, j \]$ for this kernel. Subtraction proves (13).
  For noncompact tests, insert smooth cutoffs and pass to the limit. The tail estimates imply integrability with polynomial weights of $a \( min \( x \, z \) \) B \( max \( x \, z \) \)$: one separates the ordered region into $x lt.eq z lt.eq 0$, $x lt.eq 0 lt.eq z$, and $0 lt.eq x lt.eq z$. The diagonal measure and the density of $cal(Q)$ have all polynomial moments, since their marginals are $mu$. These bounds justify the integrations by parts and the limit. ◻
]

=== 5.2 The scalar reference kernel and its variation <the-scalar-reference-kernel-and-its-variation>

Let $cal(Q)_0$ be the same kernel with $r_1 = q_0 = 1 - p$. The following identity converts its variation into the functional $delta$ from (10).

#thm([Lemma 5.3.])[
  (Reference inversion and variation).  #emph[Let $h_f^(*) \, h_j^(*)$ be smooth scalar tests, and set $f = \( 1 + cal(N) \) h_f^(*)$, $j = \( 1 + cal(N) \) h_j^(*)$. Then 
#[#set math.equation(numbering: n => "(14)")
 $ cal(Q)_0 \[ f \, j \] & = gamma \[ f h_j^(*) \] \,\
\( cal(Q) - s_0 cal(Q)_0 \) \[ f \, j \] & = Delta_mu w + delta \[ \( h_f^(*) \)' \( h_j^(*) \)' \] \, & w' & = f' h_j^(*) + j' h_f^(*) . $ <eq:14>]

 The choice of the additive constant in $w$ is immaterial.]
] <lem:kernel-variation>

#proof[
  Write $b_1 = h_f^(*)$, $b_2 = h_j^(*)$. Direct differentiation gives
  $ integral_(- oo)^z p f = a b_1 - p b'_1 \, #h(2em) integral_z^oo q_0 f = B_0 b_1 + q_0 b'_1 \, $
  and the analogous formulas for $j$. Boundary terms vanish by polynomial growth and the Gaussian tails. As $q_0 a + p B_0 = phi.alt$, insertion into $cal(Q)_0$ gives $cal(Q)_0 \[ f \, j \] = gamma \[ j b_1 \] = gamma \[ f b_2 \]$, using self-adjointness of $1 + cal(N)$ under $gamma$.
  Put
  $ H_1 = f b_2 + j b_1 \, #h(2em) J_1 = f b'_2 + j b'_1 \, #h(2em) w' = H'_1 - J_1 . $
  Split the kernel variation into its two ordered half-planes. Symmetry and the preceding primitive formulas give
  $ \( cal(Q) - s_0 cal(Q)_0 \) \[ f \, j \] & = integral Delta r \( z \) [j \( z \) integral_(- oo)^z p \( x \) f \( x \) thin d x + f \( z \) integral_(- oo)^z p \( x \) j \( x \) thin d x] d z\
 & = integral Delta r \( a H_1 - p J_1 \) . $
  Use $Delta r = - \( Delta B \)'$, $Delta_mu w = - integral h_delta w'$, and $\( a Delta B + h_delta \)' = 2 p Delta B$. After integration by parts, subtracting $Delta_mu w$ leaves
  $ - integral #scale(x: 120%, y: 120%)[\[] p Delta B thin H_1 + \( p Delta r + h_delta \) J_1 #scale(x: 120%, y: 120%)[\]] . $
  The product rule for $cal(N)$ gives
  $ H_1 & = \( 2 + cal(N) \) \( b_1 b_2 \) + 2 b'_1 b'_2 \,\
J_1 & = \( b_1 b_2 \)' + 2 z thin b'_1 b'_2 - \( b'_1 b'_2 \)' . $
  Equation (12) cancels the terms involving $b_1 b_2$. The remaining expression is $delta \[ b'_1 b'_2 \]$ by (10), proving (14). All boundary terms contain the weighted differences controlled by the preceding tail estimates. Finally $Delta_mu$ has total mass zero, so constants in $w$ do not affect the formula. ◻
]

=== 5.3 Defects from spectral thresholds <defects-from-spectral-thresholds>

For a deterministic symmetric weight $Lambda$, extend the kernel $"nt"$ of Section 4 by

$ "nt"_Lambda \( x \, z \) & = tau_Lambda #scale(x: 120%, y: 120%)[\(] P_(min \( x \, z \)) compose \( I - P_(max \( x \, z \)) \) #scale(x: 120%, y: 120%)[\)] \,\
"Nt"_Lambda \( f \, j \) & = integral.double "nt"_Lambda \( x \, z \) f' \( x \) j' \( z \) thin d x thin d z \, #h(2em) N_Lambda = "Nt"_Lambda \( iota \, iota \) . $

We omit the subscript $I$. The layer-tail argument again gives absolute convergence for smooth tests with polynomially bounded derivatives. A general weighted kernel need not be nonnegative.

For a symmetric random matrix $B_(*)$ with all finite moments, define

$ Theta_z \( B_(*) \) = upright(bold(1))_(\( - oo \, z \]) \( B_(*) \) \, #h(2em) E_z^(B_(*)) = P_z - Theta_z \( B_(*) \) . $

We will use $B_(*) = A$ and $B_(*) = L$. For a deterministic symmetric matrix $Lambda$, put

$ e_Lambda^(B_(*)) \( f \, j \) = integral f' \( z \) chevron.l E_z^(B_(*)) \, j \( B_(*) \) - j \( z \) I chevron.r_Lambda thin d z . $

An omitted superscript means $B_(*) = L$. An omitted trace weight means $Lambda = I$.

Define a measure on layer and spectral-endpoint pairs by

$ integral F_0 \( z \, x \) thin d beta^(B_(*)) \( z \, x \) = integral d z thin tau #h(-0.16667em) [E_z^(B_(*)) \( B_(*) - z I \) F_0 \( z \, B_(*) \)] . $

This is a nonnegative measure. In a spectral basis of $B_(*)$, with eigenvalues $x_i$, its density is the normalized expected sum of $\( E_z^(B_(*)) \)_(i i) \( x_i - z \)$. If $x_i > z$, the first factor is $\( P_z \)_(i i) gt.eq 0$; if $x_i lt.eq z$, it is $\( P_z \)_(i i) - 1 lt.eq 0$. Its mass is

$ cal(B)^(B_(*)) = e^(B_(*)) \( iota \, iota \) . $

Write $beta \, cal(B)$ for $B_(*) = L$. The layer tails, Hölder’s inequality, and the moments of $B_(*)$ give convergence of these integrals with polynomial weights. For instance, the spectral thresholds have arbitrarily high inverse polynomial tail bounds from the moments of $B_(*)$, while the projection-layer errors have the stronger Gaussian tail bounds already established.

Set

$ M_f^(B_(*)) = H_f - f \( B_(*) \) + \( gamma f \) I = - integral E_z^(B_(*)) f' \( z \) thin d z . $

These matrix fields are distinct from the deterministic linear coefficients $M_i$ in (7).

#thm([Lemma 5.4.])[
  (Quadratic threshold defect).  #emph[For every such $B_(*) \, f \, Lambda$, 
#[#set math.equation(numbering: n => "(15)")
 $ chevron.l M_f^(B_(*)) \, M_f^(B_(*)) chevron.r_Lambda = 2 e_Lambda^(B_(*)) \( f \, f \) - "Nt"_Lambda \( f \, f \) . $ <eq:15>]

]
] <lem:threshold-defect>

#proof[
  Abbreviate $Theta_y = Theta_y \( B_(*) \)$. For $x < z$, $Theta_x Theta_z = Theta_x$, and expansion gives
  $ E_x^(B_(*)) compose E_z^(B_(*)) + P_x compose \( I - P_z \) = P_x compose \( I - Theta_z \) + \( I - P_z \) compose Theta_x . $
  Multiply by $f' \( x \) f' \( z \)$, integrate over $x < z$, and include the opposite order. The first two terms give the left side of (15) and $"Nt"_Lambda \( f \, f \)$. The terms on the right give $2 e_Lambda^(B_(*)) \( f \, f \)$, by the spectral identity
  $ f \( B_(*) \) - f \( y \) I = integral #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ y lt.eq l }) I - Theta_l #scale(x: 120%, y: 120%)[\)] f' \( l \) thin d l . $
  All rearrangements are justified by the polynomially weighted integrability above. In particular, no nesting of $P_z$, or commutation of $P_z$ with a threshold or with $Lambda$, has been assumed. ◻
]

For the linear test $iota \( x \) = x$, we have $M_iota^L = A - L = R$ and $M_iota^A = 0$. Thus

$ 2 e_Lambda \( iota \, iota \) = tau_Lambda R^2 + N_Lambda \, #h(2em) 2 e_Lambda^A \( iota \, iota \) = N_Lambda . $

The next identities compare a layer integral with evaluation at $L$. Use

$ Delta_Lambda j = tau_Lambda #scale(x: 120%, y: 120%)[\(] j \( L \) - \( gamma j \) I #scale(x: 120%, y: 120%)[\)] . $

#thm([Lemma 5.5.])[
  (Layer-to-spectral comparison).  #emph[For smooth scalar tests $f \, j$, with $gamma f = 0$ in the last identity, 
#[#set math.equation(numbering: n => "(16)")
 $ tau_Lambda H_j & = Delta_Lambda j + chevron.l R \, j' \( L \) chevron.r_Lambda + e_Lambda \( iota \, j' \) \,\
tau_Sigma H_j & = Delta_mu j \,\
chevron.l H_f \, j \( L \) chevron.r_Sigma & = mu \[ f j \] + \( Delta_Sigma - Delta_mu \) w - e_Sigma \( f \, j \) \, #h(2em) w' = f j' . $ <eq:16>]

]
] <lem:layer-spectral>

#proof[
  The first identity follows from $R = - integral E_z^L thin d z$:
  $ chevron.l R \, j' \( L \) chevron.r_Lambda + e_Lambda \( iota \, j' \) = - integral j' \( z \) tau_Lambda E_z^L thin d z . $
  For the second, integration by parts in $tau_Sigma H_j = integral \( s_0 p - h \) j'$ gives $Delta_mu j$. For the third, subtract $f \( L \)$ from $H_f$ in the pairing and write $j \( L \) = \( j \( L \) - j \( z \) I \) + j \( z \) I$. The first part gives $- e_Sigma \( f \, j \)$. For the scalar part use $f' j = \( f j - w \)'$ and the second identity. Combining with $tau_Sigma \( f j \) \( L \)$ gives the last line of (16). ◻
]

=== 5.4 Linear and quadratic profile identities <linear-and-quadratic-profile-identities>

In the reference-variation formula (14), the derivatives of the two inverse tests appear as the product inside $delta$. Using the same centered primitive of $l$ in both slots gives $delta \[ l^2 \]$; pairing it with $\( 1 + cal(N) \)^(- 1) iota = iota \/ 2$ gives $delta \[ l \] \/ 2$. These are the two choices used below. For a smooth scalar test $l$, let $h_l$ be its antiderivative centered under the one-dimensional Gaussian. Apply $1 + cal(N)$ to this primitive to define $f_l$; its derivative will be denoted by $S_l$. Thus

$ h'_l = l \, #h(2em) gamma h_l = 0 \, #h(2em) f_l = \( 1 + cal(N) \) h_l \, #h(2em) S_l = f'_l = \( 2 + cal(N) \) l \, #h(2em) psi'_l = \( cal(N) - 1 \) h_l . $

The last definition introduces the additional primitive $psi_l$ that will occur in the scalar variation term. Choose its additive constant linearly in $l$. Gaussian integration by parts shows that $f_l$ is centered under $gamma$, so the layer covariance formula applies to it.

We now compare the two matrix fields obtained from $h_l$: the resolvent $cal(K)_G H_(f_l)$ of its layer test, and the direct evaluation $h_l \( L \)$. Denote their difference by $d_l^(*)$, its squared form norm by $D_Sigma \( l \)^2$, and its pairing with the remainder $R$ by $sigma_Sigma \( l \)$. We also define the difference $J_Sigma \( l \)$ between the displayed spectral term and the Dirichlet term of $h_l \( L \)$:

$ d_l^(*) & = cal(K)_G H_(f_l) - h_l \( L \) \, & D_Sigma \( l \)^2 & = parallel d_l^(*) parallel_(1 \, Sigma)^2 \, & sigma_Sigma \( l \) & = 2 chevron.l R \, d_l^(*) chevron.r_Sigma \,\
J_Sigma \( l \) & = tau_Sigma #scale(x: 120%, y: 120%)[\(] L h_(l^2) \( L \) #scale(x: 120%, y: 120%)[\)] - sum_(i = 1)^m tau_Sigma #scale(x: 120%, y: 120%)[\(] partial_(G_i) h_l \( L \) #scale(x: 120%, y: 120%)[\)]^2 . $

For vector-valued $l$, sum $D_Sigma \( l \)^2$ and $J_Sigma \( l \)$ over its components. The quadratic identity below separates the nonnegative quantity $D_Sigma \( l \)^2$ from $J_Sigma \( l \)$, which depends only on $L$ and the deterministic trace weight.

These form quantities are finite. In a spectral basis of $L$,

$ #scale(x: 120%, y: 120%)[\(] partial_(G_i) h_l \( L \) #scale(x: 120%, y: 120%)[\)]_(a b) = h_l^(\[ 1 \]) \( x_a \, x_b \) \( M_i \)_(a b) \, #h(2em) h_l^(\[ 1 \]) \( x \, y \) = cases(delim: "{", frac(h_l \( x \) - h_l \( y \), x - y) \, & x eq.not y \,, h'_l \( x \) \, & x = y .) $

The formula follows for polynomials by differentiating products. Approximation of a smooth function and its first derivative on compact intervals gives the general formula; the Hilbert–Schmidt norm of this derivative is bounded by the supremum of the scalar derivative on the spectral interval times the norm of its matrix direction. Polynomial growth and the Gaussian moments of the linear matrix $L$ then give square-integrable derivatives. Lemma 13 supplies the form regularity of $cal(K)_G H_(f_l)$.

#thm([Lemma 5.6.])[
  (Profile identities).  #emph[For every smooth scalar test $l$, 
#[#set math.equation(numbering: n => "(17)")
 $ delta \[ l \] & = Delta_Sigma psi_l + sigma_Sigma \( l \) - 2 e_Sigma \( iota \, h_l \) - e_Sigma \( f_l \, iota \) - 2 "Ct" \( iota \, f_l \) \,\
D_Sigma \( l \)^2 + J_Sigma \( l \) & = delta \[ l^2 \] - Delta_Sigma psi_(l^2) + 2 e_Sigma \( f_l \, h_l \) + "Ct" \( f_l \, f_l \) . $ <eq:17>]

]
] <lem:profile-quadratics>

#proof[
  For the linear identity, evaluate $mu \[ iota f_l \] - 2 cal(Q) \[ iota \, f_l \]$ in two ways. Since $\( 1 + cal(N) \)^(- 1) iota = iota \/ 2$, Equation (14) gives
  $ mu \[ iota f_l \] - 2 cal(Q) \[ iota \, f_l \] = Delta_mu psi_l - delta \[ l \] . $
  The reference Gaussian term vanishes by self-adjointness of $1 + cal(N)$, and the derivative of the remaining primitive is $f_l - 2 h_l = psi'_l$.
  For the second evaluation, replace $cal(Q) \[ iota \, f_l \]$ using Equation (13) and replace $mu \[ iota f_l \]$ using the last line of Equation (16). Since $H_iota = A = L + R$ and $cal(K)_G L = L \/ 2$, the same quantity $mu \[ iota f_l \] - 2 cal(Q) \[ iota \, f_l \]$ equals
  $ - \( Delta_Sigma - Delta_mu \) v_0 + e_Sigma \( f_l \, iota \) - 2 chevron.l R \, cal(K)_G H_(f_l) chevron.r_Sigma + 2 "Ct" \( iota \, f_l \) \, #h(2em) v'_0 = f_l . $
  Equate these two evaluations. Equation (16), applied to $psi_l - v_0$, whose derivative is $- 2 h_l$, rewrites the remaining difference between $Delta_mu$ and $Delta_Sigma$. Its pairing with $R$ combines with $2 chevron.l R \, cal(K)_G H_(f_l) chevron.r_Sigma$ to give $2 chevron.l R \, d_l^(*) chevron.r_Sigma = sigma_Sigma \( l \)$. The other terms are precisely the first line of Equation (17).
  For the quadratic identity write $b_1 = h_l$, $f = f_l$. Expand the squared form norm of $d_l^(*) = cal(K)_G H_f - b_1 \( L \)$. In Hermite degree $j$, the form contributes a factor $1 + j$ and $cal(K)_G$ contributes its reciprocal. Thus the cross term is $- 2 chevron.l H_f \, b_1 \( L \) chevron.r_Sigma$, and the square of $cal(K)_G H_f$ is $chevron.l H_f \, cal(K)_G H_f chevron.r_Sigma$. This uses the form regularity already proved, not a derivative of $H_f$. Consequently
  $ D_Sigma \( l \)^2 =  & chevron.l H_f \, cal(K)_G H_f chevron.r_Sigma - 2 chevron.l H_f \, b_1 \( L \) chevron.r_Sigma + tau_Sigma b_1 \( L \)^2\
 & + sum_i tau_Sigma #scale(x: 120%, y: 120%)[\(] partial_(G_i) b_1 \( L \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Adding $J_Sigma \( l \)$ cancels exactly the same weighted Dirichlet term. By (13), the remaining expression is
  $ cal(Q) \[ f \, f \] + "Ct" \( f \, f \) - 2 chevron.l H_f \, b_1 \( L \) chevron.r_Sigma + tau_Sigma #scale(x: 120%, y: 120%)[\(] b_1 \( L \)^2 + L h_(l^2) \( L \) #scale(x: 120%, y: 120%)[\)] . $
  Insert (14) for $cal(Q) \[ f \, f \]$ and (16) for the pairing. The reference terms cancel because
  $ gamma \[ x h_(l^2) \] = gamma \[ l^2 \] = gamma \[ \( f - b_1 \) b_1 \] . $
  The $Delta_mu$ terms have the primitive
  $ 2 integral^x f' b_1 - 2 f b_1 + 2 integral^x f b'_1 \, $
  whose derivative is zero. Besides $delta \[ l^2 \] + "Ct" \( f \, f \) + 2 e_Sigma \( f \, b_1 \)$, what remains is $Delta_Sigma$ applied to
  $ b_1^2 + x h_(l^2) - 2 integral^x f b'_1 . $
  Its derivative is
  $ h_(l^2) - x l^2 + 2 l l' = - \( cal(N) - 1 \) h_(l^2) = - psi'_(l^2) . $
  Since $Delta_Sigma$ annihilates constants, this proves the second identity. All form expansions used a deterministic weight; none requires it to commute with the matrix fields. ◻
]

=== 5.5 Combining the fixed profiles <combining-the-fixed-profiles>

We can now arrange the signed term from the entropy estimate. For a two-variable layer profile $Phi \( z \, x \)$, define

$ cal(L)_Lambda \[ Phi \] = integral d z thin ⟨E_z^L \, thin x mapsto integral_z^x Phi \( z \, y \) thin d y\|_(x = L)⟩_Lambda . $

With $overline(Phi) \( z \, x \) = integral_0^1 Phi \( z \, z + t \( x - z \) \) thin d t$, this means

$ e_Lambda \( f \, j \) = cal(L)_Lambda \[ f' \( z \) j' \( x \) \] \, #h(2em) cal(L)_I \[ Phi \] = integral overline(Phi) \( z \, x \) thin d beta \( z \, x \) . $

This convention includes coincident endpoints and either ordering of the endpoints.

#thm([Proposition 5.7.])[
  (Decomposition of the entropy term).  #emph[With the fixed profiles $F = d + \| u \|^2 = c + 2 k q$, one has 
#[#set math.equation(numbering: n => "(18)")
 $ delta \[ d \] - tau_T H_v lt.eq  & Delta_(upright(p)) + sigma_Sigma \( F \) - D_Sigma \( u \)^2 - J_Sigma \( u \) - chevron.l R \, v' \( L \) chevron.r_T\
 & - cal(L)_I \[ H \] - cal(L)_T \[ H + v'' \( x \) \] \,\
Delta_(upright(p)) =  & Delta_I psi_d + Delta_T \( psi_d - v \) . $ <eq:18>]

]
] <prop:quadratic-decomposition>

#proof[
  Use the first line of (17) for $F$, subtract the second line for each component of $u$, and use $delta \[ d \] = delta \[ F \] - delta \[ \| u \|^2 \]$. The combined layer profile for the weight $Sigma$ is
  $ 2 F \( x \) + S_F \( z \) - 2 S_u \( z \) dot.op u \( x \) = 4 c + 4 k q \( x \) + 2 \( k - q \( x \) \) S_q \( z \) - 2 S_pi \( z \) dot.op pi \( x \) = H \( z \, x \) . $
  The contact integral being subtracted is
  $ integral.double "ct" \( x \, z \) #scale(x: 120%, y: 120%)[\(] S_F \( x \) + S_F \( z \) - S_u \( x \) dot.op S_u \( z \) #scale(x: 120%, y: 120%)[\)] thin d x thin d z . $
  It is nonnegative: $"ct" gt.eq 0$, and its scalar factor is the second positive expression in (3). Discarding this integral preserves the upper bound.
  Finally, subtract $tau_T H_v$ using the first line of (16). Its derivative correction is $- chevron.l R \, v' \( L \) chevron.r_T$, and its layer correction is $- e_T \( iota \, v' \) = - cal(L)_T \[ v'' \( x \) \]$. Splitting $Sigma = I + T$ gives the two layer terms in (18), while $Delta_Sigma psi_d - Delta_T v = Delta_(upright(p))$. ◻
]

Equation (18) leaves two kinds of error: the field $R$ and the defects $E_z^L$. The next section bounds them while retaining a nonnegative layer remainder. The terms $Delta_(upright(p))$ and $J_Sigma \( u \)$, which depend only on the linear field $L$, will then be evaluated spectrally.

== 6 Controlling the layer errors <sec:05-layers>

We now bound the terms in Equation (18) that still involve the nonlinear field $A$, its remainder $R = A - L$, and the layer defects $E_z^L$. Our objective is to bound $cal(E)$, defined at the end of Section 4, through functionals of $L$, retaining a nonpositive integral against the layer measure $beta = beta^L$. Throughout this section, all the constants are those fixed earlier; in particular, $t_plus.minus = t_c plus.minus t_r$ and $Sigma = I + T$. For a symmetric matrix field $E$, write $parallel E parallel_Sigma^2 = tau_Sigma E^2$.

=== 6.1 The Gaussian remainder <the-gaussian-remainder>

The deterministic weight $Sigma$ preserves orthogonality of Gaussian Hermite degrees. Write

$ R_e \( G \) = frac(R \( G \) + R \( - G \), 2) \, #h(2em) R_o \( G \) = frac(R \( G \) - R \( - G \), 2) . $

The normalization $bb(E) A = 0$ and the definition of $L$ as the degree-one part of $A$ show that $R_e$ has degrees at least $2$, whereas $R_o$ has degrees at least $3$.

#thm([Lemma 6.1.])[
  (Control of the Gaussian remainder).  #emph[With the notation of Section 5, 
#[#set math.equation(numbering: n => "(19)")
 $ sigma_Sigma \( F \) - D_Sigma \( u \)^2 lt.eq \( b + eta \) tau_Sigma R^2 - eta tau_Sigma R_o^2 + b_m parallel M_(f_q)^L parallel_2^2 . $ <eq:19>]

 Moreover, 
$ parallel M_(f_q)^L parallel_2^2 lt.eq 2 cal(L)_I \[ S_q \( z \) S_q \( x \) \] . $

]
] <lem:layers-gaussian>

#proof[
  The definitions of $h_l \, f_l \, d_l^(*)$ depend linearly on $l$. For the constant profile $l = 1$, its centered primitive is $x$ and its image under $1 + cal(N)$ is $2 x$. Hence
  $ d_1^(*) = 2 cal(K)_G A - L = 2 cal(K)_G R \, $
  because $cal(K)_G L = L \/ 2$. Since $F = c + 2 k q$, it follows that
  $ sigma_Sigma \( F \) = 4 c chevron.l R \, cal(K)_G R chevron.r_Sigma + 4 k chevron.l R \, d_q^(*) chevron.r_Sigma . $
  The vector $u = \( pi \, q \)$ gives $D_Sigma \( u \)^2 gt.eq parallel d_q^(*) parallel_(1 \, Sigma)^2$. We estimate the resulting quadratic expression separately on odd and even Hermite degrees.
  On the odd degrees, completion of the square in the $\( 1 + cal(N)_G \)$-form norm gives
  $ 4 k chevron.l R_o \, \( d_q^(*) \)_o chevron.r_Sigma - parallel \( d_q^(*) \)_o parallel_(1 \, Sigma)^2 lt.eq 4 k^2 chevron.l R_o \, cal(K)_G R_o chevron.r_Sigma . $
  Here the square is centered at $2 k cal(K)_G R_o$, so the calculation remains valid in the form domain. Since $c + k^2 = b$ and $cal(K)_G lt.eq 1 \/ 4$ on the degrees of $R_o$, the odd contribution is at most $b tau_Sigma R_o^2$.
  For the even degrees, the evenness of $q$ implies that its Gaussian-centered primitive $h_q$ is odd, and hence $f_q$ is odd. The field $L$ is odd in $G$, so $h_q \( L \)$ and $f_q \( L \)$ are odd matrix fields. Thus
  $ \( d_q^(*) \)_e = cal(K)_G \( M_(f_q)^L \)_e . $
  Put $frak(b) = b + eta$ and
  $ b'_m = frac(b_m, 1 + t_(+)) = frac(b - 3 eta, 3 \( 3 frak(b) - 4 c \)) = 134 / 309 > 0 . $
  On a positive even degree, the eigenvalue $rho$ of $cal(K)_G$ lies in $\( 0 \, 1 \/ 3 \]$. Writing $R_j \, M_j$ for the components of $R \, M_(f_q)^L$ in that degree, the quadratic form to estimate is
  $ 4 c rho parallel R_j parallel_Sigma^2 + 4 k rho chevron.l R_j \, M_j chevron.r_Sigma - rho parallel M_j parallel_Sigma^2 . $
  The scalar matrix inequality
  $ mat(delim: "(", 4 c rho, 2 k rho; 2 k rho, - rho) lt.eq mat(delim: "(", frak(b), 0; 0, b'_m) $
  holds for $0 lt.eq rho lt.eq 1 \/ 3$. Indeed, the first diagonal entry of the difference is at least
  $ frak(b) - frac(4 c, 3) = 103 / 750 > 0 \, $
  and its determinant is
  $ \( frak(b) - 4 c rho \) \( b'_m + rho \) - 4 k^2 rho^2 = \( 1 - 3 rho \) (frak(b) thin b'_m + frac(4 b, 3) rho) gt.eq 0 . $
  The constant degree has zero $R$-coefficient and contributes a nonpositive term. Summing the even degrees therefore gives at most
  $ frak(b) tau_Sigma R_e^2 + b'_m parallel \( M_(f_q)^L \)_e parallel_Sigma^2 lt.eq frak(b) tau_Sigma R_e^2 + b_m parallel M_(f_q)^L parallel_2^2 \, $
  where we used $Sigma lt.eq \( 1 + t_(+) \) I$. Together with the odd estimate, this proves Equation (19).
  Finally, Equation (15) yields
  $ parallel M_(f_q)^L parallel_2^2 = 2 e \( f_q \, f_q \) - "Nt" \( f_q \, f_q \) . $
  The kernel defining $"Nt"$ is nonnegative, and $f'_q = S_q > 0$; hence its last term is nonnegative. The identity $e \( f_q \, f_q \) = cal(L)_I \[ S_q \( z \) S_q \( x \) \]$ proves the remaining assertion. ◻
]

=== 6.2 A positivity fact for spectral layers <a-positivity-fact-for-spectral-layers>

The weight $T$ need not commute with $A$, $L$, or the projection derivatives $P_z$. The following elementary fact allows us to retain the positive parts of the layer terms without a commutation assumption.

#thm([Lemma 6.2.])[
  (Positive blocks and weighted diagonal bounds).  #emph[Let $B_(*)$ be a real symmetric matrix, let $0 lt.eq P lt.eq I$, and fix $z$ outside the spectrum of $B_(*)$. In an orthonormal eigenbasis of $B_(*)$, write 
$ E = P - 1_(\( - oo \, z \]) \( B_(*) \) \, #h(2em) a_i = \| x_i - z \| \, #h(2em) epsilon.alt_i = "sgn" \( x_i - z \) . $

 Then 
$ \( E^2 \)_(i i) lt.eq epsilon.alt_i E_(i i) . $

 The matrix $S$ with entries 
$ S_(i j) = cases(delim: "{", epsilon.alt_i sqrt(a_i a_j) thin E_(i j) \, & epsilon.alt_i = epsilon.alt_j \,, 0 \, & epsilon.alt_i eq.not epsilon.alt_j) $

 is positive semidefinite, and $"tr" S = sum_i a_i epsilon.alt_i E_(i i)$. For any nonnegative numbers $w_i$, 
$ sum_(i \, j) frac(a_i w_i + a_j w_j, 2) \| E_(i j) \|^2 lt.eq sum_i a_i w_i epsilon.alt_i E_(i i) . $

]
] <lem:layers-diagonal>

#proof[
  Write $Q = 1_(\( - oo \, z \]) \( B_(*) \)$. Since $Q$ is diagonal in the chosen basis and $P^2 lt.eq P$,
  $ \( E^2 \)_(i i) = \( P^2 \)_(i i) - 2 Q_(i i) P_(i i) + Q_(i i) lt.eq P_(i i) - 2 Q_(i i) P_(i i) + Q_(i i) = epsilon.alt_i E_(i i) . $
  On the block $x_i > z$, the compression of $E$ is the compression of $P$, and is positive semidefinite. On the block $x_i < z$, the compression of $- E$ is the compression of $I - P$, and has the same property. Diagonal congruence by the factors $sqrt(a_i)$ proves the assertion about $S$. Finally, symmetry of $E$ gives
  $ sum_(i \, j) frac(a_i w_i + a_j w_j, 2) \| E_(i j) \|^2 = sum_i a_i w_i \( E^2 \)_(i i) lt.eq sum_i a_i w_i epsilon.alt_i E_(i i) . $
  ◻
]

We apply Lemma 21 pointwise in $G$, with $P = P_z$ and $B_(*) = A$ or $L$, and then integrate over $z$. The normalized expected integral of $sum_i a_i epsilon.alt_i \( E_z^(B_(*)) \)_(i i)$ is $cal(B)^(B_(*))$, and its version with a weight $w \( z \, x_i \)$ is $integral w thin d beta^(B_(*))$. For each $G$, the excluded spectral endpoints form a finite set of layers and thus do not affect these integrals. All subsequent sums use the normalization $m^(- 1) bb(E)$; the moment and layer convergence bounds established earlier justify their integration.

#thm([Lemma 6.3.])[
  (The weighted constant layer).  #emph[The weighted non-nesting term satisfies 
#[#set math.equation(numbering: n => "(20)")
 $ N_T = 2 e_T^A \( iota \, iota \) gt.eq t_(-) N - sqrt(c_g N \/ 2) thin parallel \[ A \, T \] parallel_2 \, #h(2em) c_g = 2 log 2 - 1 / 3 . $ <eq:20>]

]
] <lem:layers-constant>

#proof[
  Equation (15), applied with threshold $A$, gives $N_T = 2 e_T^A \( iota \, iota \)$ and $N = 2 cal(B)^A$. In a spectral basis of $A$, the scalar kernel multiplying $\( E_z^A \)_(i j) T_(j i)$ in $2 e_T^A \( iota \, iota \)$ is $x_i + x_j - 2 z$. Separate this kernel into a comparison term and a remainder. The comparison term is $2 epsilon.alt sqrt(a_i a_j)$ when both endpoints have sign $epsilon.alt$, and zero when they have opposite signs. Its pairing is $2 "tr" \( T S_z \)$, where $S_z gt.eq 0$ is supplied by Lemma 21. Thus the original pairing equals $2 "tr" \( T S_z \)$ plus the pairing with the remaining kernel. Since $T gt.eq t_(-) I$, the normalized expected integral of the comparison term is at least $2 t_(-) cal(B)^A = t_(-) N$.
  Let $k_z \( x_i \, x_j \)$ be the remaining kernel, and put $omega_z = \( a_i + a_j \) \/ 2$. On a common-sign block it is $epsilon.alt \( sqrt(a_i) - sqrt(a_j) \)^2$; between the endpoints it remains $x_i + x_j - 2 z$. We claim that
  $ integral_(bb(R)) frac(k_z \( x_i \, x_j \)^2, omega_z) thin d z = c_g \( x_i - x_j \)^2 . $
  If the endpoints coincide, the remaining kernel vanishes; the quotient is assigned value zero wherever its denominator vanishes. Otherwise, translation and scaling reduce the calculation to endpoints $0 \, 1$. The interval between them contributes
  $ 2 integral_0^1 \( 1 - 2 z \)^2 thin d z = 2 / 3 . $
  The two exterior intervals contribute
  $ 4 integral_0^oo frac(\( sqrt(1 + t) - sqrt(t) \)^4, 1 + 2 t) thin d t = 2 log 2 - 1 . $
  For completeness, use the scalar substitution
  $ u_0 = \( sqrt(1 + t) - sqrt(t) \)^2 \, #h(2em) t = frac(\( 1 - u_0 \)^2, 4 u_0) \, #h(2em) \| d t \| = frac(1 - u_0^2, 4 u_0^2) thin d u_0 . $
  The last integral becomes
  $ 2 integral_0^1 frac(u_0 \( 1 - u_0^2 \), 1 + u_0^2) thin d u_0 = 2 log 2 - 1 . $
  This proves the claim.
  Cauchy–Schwarz in the variables $G \, z \, i \, j$, with weight $omega_z$, bounds the absolute value of the remaining pairing by
  $ (1 / m bb(E) integral sum_(i \, j) omega_z \| \( E_z^A \)_(i j) \|^2 thin d z)^(1 \/ 2) (1 / m bb(E) sum_(i \, j) \| T_(j i) \|^2 integral frac(k_z \( x_i \, x_j \)^2, omega_z) thin d z)^(1 \/ 2) . $
  Lemma 21 bounds the first factor by $sqrt(cal(B)^A)$. The second factor is $sqrt(c_g) parallel \[ A \, T \] parallel_2$, since the commutator has entries $\( x_i - x_j \) T_(i j)$. This proves Equation (20). ◻
]

=== 6.3 Combining the quadratic and constant-layer terms <combining-the-quadratic-and-constant-layer-terms>

We have controlled the Gaussian remainder and the constant part of the $T$-weighted layer. We next apply those estimates to Equation (18); the resulting bound will leave just the variable profile $H_0$ to estimate.

The identity $H + v'' = 2 kappa + H_0$ gives

$ - 2 kappa cal(L)_T \[ 1 \] = - 2 kappa e_T \( iota \, iota \) = - kappa tau_T R^2 - kappa N_T $

by Equation (15). To track the signs when combining this with Equation (19), put

$ a_0 = b + eta + \( b + eta - kappa \) t_(-) . $

Here $b + eta - kappa = - .536 < 0$, while $t_(-) = - .022 < 0$; consequently $a_0 gt.eq b + eta$. Since $R^2 gt.eq 0$ and $T gt.eq t_(-) I$,

$ \( b + eta \) tau_Sigma R^2 - kappa tau_T R^2 & = \( b + eta \) tau R^2 + \( b + eta - kappa \) tau_T R^2\
 & lt.eq a_0 tau R^2 = 2 a_0 cal(B) - a_0 N\
 & lt.eq 2 a_0 cal(B) - \( b + eta \) N . $

The equality uses Equation (15), and the last inequality uses $N = 2 cal(B)^A gt.eq 0$.

Including the term $- N \/ 8$ in $cal(E)$, the remaining terms from Equation (20) are

$ - Lambda_0 N + kappa sqrt(c_g N \/ 2) thin parallel \[ A \, T \] parallel_2 \, #h(2em) Lambda_0 = b + eta + kappa t_(-) + 1 / 8 = .72348 > 0 . $

Completing the square in $sqrt(N)$ bounds this expression by

$ frac(kappa^2 c_g, 8 Lambda_0) parallel \[ A \, T \] parallel_2^2 lt.eq e_0 parallel \[ A \, T \] parallel_2^2 . $

This last comparison has a positive margin: using $log 2 < .694$,

$ frac(kappa^2 c_g, 8 Lambda_0) < 665231 / 2713050 < .245197 \, #h(2em) e_0 = .256 . $

The elementary bound on $log 2$, if needed, follows from

$ log 2 = 2 sum_(j = 0)^oo frac(1, \( 2 j + 1 \) 3^(2 j + 1)) lt.eq 2 / 3 + 2 / 81 + 2 / 1215 + 1 / 6804 < .694 . $

The fields $L$ and $R$ occupy orthogonal Gaussian degrees. As $T$ is deterministic, their commutators with $T$ remain orthogonal. Also, in a spectral basis of $T$, every difference of two eigenvalues has absolute value at most $2 t_r$. It follows that

$ e_0 parallel \[ A \, T \] parallel_2^2 & = e_0 parallel \[ L \, T \] parallel_2^2 + e_0 parallel \[ R \, T \] parallel_2^2\
 & lt.eq e_0 parallel \[ L \, T \] parallel_2^2 + e_0 \( 2 t_r \)^2 tau R^2\
 & lt.eq e_0 parallel \[ L \, T \] parallel_2^2 + 2 e_0 \( 2 t_r \)^2 cal(B) . $

Define the scalar profile

$ P_0 \( z \, x \) = 2 a_0 + 2 b_m S_q \( z \) S_q \( x \) + 2 e_0 \( 2 t_r \)^2 . $

The bound in Lemma 20 for $parallel M_(f_q)^L parallel_2^2$, together with the preceding inequalities, now gives

#[#set math.equation(numbering: n => "(21)")
 $ cal(E) lt.eq  & Delta_(upright(p)) - J_Sigma \( u \) + e_0 parallel \[ L \, T \] parallel_2^2 - eta tau_Sigma R_o^2 - chevron.l R \, v' \( L \) chevron.r_T + tau \( T - log Sigma \)\
 & - cal(L)_I \[ H - P_0 \] - cal(L)_T \[ H_0 \] . $ <eq:21>]

=== 6.4 The variable weighted layer <the-variable-weighted-layer>

For a profile $Phi \( z \, x \)$, let

$ overline(Phi) \( z \, x \) = cases(delim: "{", frac(1, x - z) integral_z^x Phi \( z \, y \) thin d y \, & x eq.not z \,, Phi \( z \, z \) \, & x = z .) $

Thus the bar is the uniform average over the interval with endpoints $z \, x$, regardless of their order. Define

$ g_z \( x \) & = overline(H_0) \( z \, x \) \,\
W \( z \, x \) & = overline(H - P_0) \( z \, x \) + t_c g_z \( x \) - t_r / 2 (h_s + frac(g_z \( x \)^2, h_s)) \,\
W_0 \( z \, x \) & = frac(overline(H_0^2) \( z \, x \), alpha) . $

Averaging the first inequality in Equation (3) gives

$ overline(H - P_0) + t_c g_z - t_r / 2 (h_s + overline(H_0^2) / h_s) > overline(H_0^2) / alpha . $

Since $g_z^2 lt.eq overline(H_0^2)$, we conclude that $W > W_0 gt.eq 0$, also for coincident endpoints.

#thm([Lemma 6.4.])[
  (The variable layer bound).  #emph[The last two terms of Equation (21) satisfy 
#[#set math.equation(numbering: n => "(22)")
 $ - cal(L)_I \[ H - P_0 \] - cal(L)_T \[ H_0 \] lt.eq frac(alpha \( log 2 + .25 \), 4) thin parallel \[ L \, T \] parallel_2^2 - integral \( W - W_0 \) thin d beta . $ <eq:22>]

]
] <lem:layers-variable>

#proof[
  Work in a spectral basis of $L$, and use $a_i \, epsilon.alt_i \, E_z^L \, S_z$ as in Lemma 21. Write $g_i = g_z \( x_i \)$. The kernel multiplying $T_(j i) \( E_z^L \)_(i j)$ in $cal(L)_T \[ H_0 \]$ is
  $ frac(\( x_i - z \) g_i + \( x_j - z \) g_j, 2) . $
  Separate this kernel into the comparison term $epsilon.alt_i sqrt(a_i a_j) \( g_i + g_j \) \/ 2$ on a common-sign block, zero on the other blocks, and a remainder $k_z \( x_i \, x_j \)$. The original pairing therefore equals $"tr" \( S_z \( T compose g_z \( L \) \) \)$ plus the pairing with $k_z$. We will bound the comparison term from below and the absolute value of the remainder from above.
  We first bound this pairing in matrix order. For any real symmetric matrix $V_0$, the spectral range of $T$ implies
  $ T compose V_0 gt.eq t_c V_0 - t_r / 2 (h_s I + V_0^2 / h_s) . $
  Indeed, writing $D = T - t_c I$, we have $parallel D parallel lt.eq t_r$, and for every vector $v_0$,
  $ \| chevron.l v_0 \, D V_0 v_0 chevron.r \| lt.eq t_r \| v_0 \| thin \| V_0 v_0 \| lt.eq t_r / 2 (h_s \| v_0 \|^2 + h_s^(- 1) \| V_0 v_0 \|^2) . $
  This proves the matrix inequality without a commutation assumption or a sign restriction on $V_0$. Apply it with $V_0 = g_z \( L \)$, and pair against $S_z gt.eq 0$. After integration, the comparison part of $cal(L)_T \[ H_0 \]$ is bounded below by
  $ integral [t_c g_z - t_r / 2 \( h_s + g_z^2 \/ h_s \)] thin d beta . $
  Together with $cal(L)_I \[ H - P_0 \] = integral overline(H - P_0) thin d beta$, this accounts for the term $- integral W thin d beta$.
  It remains to estimate the pairing with the remainder $k_z \( x_i \, x_j \)$. Use the nonnegative scalar weight
  $ D_z = frac(a_i W_0 \( z \, x_i \) + a_j W_0 \( z \, x_j \), 2) . $
  Lemma 21 gives
  $ 1 / m bb(E) integral sum_(i \, j) D_z \| \( E_z^L \)_(i j) \|^2 thin d z lt.eq integral W_0 thin d beta . $
  We will prove the scalar estimate
  $ integral_(bb(R)) frac(k_z \( x_i \, x_j \)^2, D_z) thin d z lt.eq alpha \( log 2 + .25 \) \( x_i - x_j \)^2 . $
  Whenever $D_z = 0$, the defining integrals of $H_0 \( z \, dot.op \)^2$ on both relevant segments vanish. The corresponding integrals of $H_0$, and hence $k_z$, vanish as well; we set the quotient equal to zero there. For coincident endpoints, $k_z$ vanishes identically. We therefore assume below that $ell = \| x_i - x_j \| > 0$.
  If $z$ lies between the endpoints, put $a = \| x_i - z \|$, $b = \| x_j - z \|$, so $a + b = ell$. Let $Q_z$ be the integral of $H_0 \( z \, y \)^2$ over the interval between $x_i \, x_j$. Then $D_z = Q_z \/ \( 2 alpha \)$. Twice $k_z$ is a signed sum of the integrals of $H_0$ over the two subintervals, so Cauchy–Schwarz gives
  $ k_z^2 lt.eq frac(ell Q_z, 4) \, #h(2em) k_z^2 / D_z lt.eq frac(alpha ell, 2) . $
  The integral over this middle interval is therefore at most $alpha ell^2 \/ 2$.
  If $z$ lies outside the interval, order the distances so that $a gt.eq b > 0$, and let $epsilon.alt$ be their common sign. Writing $g_a \, g_b$ for the two segment averages, we have
  $ k_z^2 = frac(\( sqrt(a) - sqrt(b) \)^2, 4) \( sqrt(a) thin g_a - sqrt(b) thin g_b \)^2 . $
  Set $h_z \( t \) = H_0 \( z \, z + epsilon.alt t \)$, for $0 lt.eq t lt.eq a$. Then
  $ sqrt(a) thin g_a - sqrt(b) thin g_b = 1 / sqrt(a) integral_b^a h_z \( t \) thin d t + (1 / sqrt(a) - 1 / sqrt(b)) integral_0^b h_z \( t \) thin d t . $
  Furthermore,
  $ 2 alpha D_z = integral_b^a h_z \( t \)^2 thin d t + 2 integral_0^b h_z \( t \)^2 thin d t . $
  Cauchy–Schwarz, with multiplicity $1$ on $\( b \, a \]$ and multiplicity $2$ on $\[ 0 \, b \]$, consequently gives
  $ \( sqrt(a) thin g_a - sqrt(b) thin g_b \)^2 lt.eq 2 alpha D_z [frac(a - b, a) + 1 / 2 \( 1 - sqrt(b \/ a) \)^2] . $
  In either exterior interval, write $a = ell \( 1 + t \)$, $b = ell t$. Integrating the last estimate over both exterior intervals gives at most
  $ alpha ell^2 integral_0^oo \( sqrt(1 + t) - sqrt(t) \)^2 [frac(1, 1 + t) + 1 / 2 (1 - sqrt(frac(t, 1 + t)))^2] d t . $
  Use the substitution $u_0 = \( sqrt(1 + t) - sqrt(t) \)^2$ from the proof of Lemma 22. The integral becomes
  $ integral_0^1 (frac(1, 1 + u_0) - u_0 / 2) d u_0 = log 2 - 1 / 4 . $
  Adding the middle-interval contribution proves the scalar estimate with coefficient $alpha \( log 2 - 1 / 4 + 1 / 2 \) = alpha \( log 2 + 1 / 4 \)$.
  Put $cal(V) = integral W_0 thin d beta$. Weighted Cauchy–Schwarz in $G \, z \, i \, j$, followed by the scalar estimate, bounds the absolute value of the remaining pairing by
  $ sqrt(cal(V)) thin sqrt(alpha \( log 2 + .25 \)) thin parallel \[ L \, T \] parallel_2 . $
  The convention for zero weights already covers $cal(V) = 0$. The comparison term has already contributed $- integral W thin d beta$ to the upper bound for $- cal(L)_I \[ H - P_0 \] - cal(L)_T \[ H_0 \]$. The remainder can increase this bound by at most the absolute value just estimated. Writing $W = \( W - W_0 \) + W_0$, we obtain
  $ - integral \( W - W_0 \) thin d beta - cal(V) + sqrt(alpha \( log 2 + .25 \) cal(V)) thin parallel \[ L \, T \] parallel_2 . $
  Completion of the square in $sqrt(cal(V))$ proves Equation (22). ◻
]

=== 6.5 The resulting bound on the linear field <the-resulting-bound-on-the-linear-field>

Applying Lemma 23 in Equation (21) leaves one term involving $R$. Since $v$ is even and $L$ is odd in $G$, the field $v' \( L \)$ is odd. The field $R_o$ is orthogonal to degree one, so

$ chevron.l R \, v' \( L \) chevron.r_T = chevron.l R_o \, v' \( L \) - L chevron.r_T . $

The scalar estimate $\| v' \( x \) - x \| lt.eq .319$, applied by spectral calculus, gives $parallel v' \( L \) - L parallel lt.eq .319$. Hilbert–Schmidt Cauchy–Schwarz therefore yields

$ \| chevron.l R_o \, v' \( L \) - L chevron.r_T \| lt.eq .319 thin \( tau R_o^2 \)^(1 \/ 2) \( tau T^2 \)^(1 \/ 2) . $

For example, this follows directly from $parallel T \( v' \( L \) - L \) parallel_2^2 lt.eq .319^2 tau T^2$; no commutation with $T$ is needed. As $Sigma gt.eq \( 1 + t_(-) \) I$, completing the square gives

$ - eta tau_Sigma R_o^2 - chevron.l R \, v' \( L \) chevron.r_T lt.eq frac(.319^2, 4 eta \( 1 + t_(-) \)) thin tau T^2 . $

For $t in \[ t_(-) \, t_(+) \]$, the scalar logarithm satisfies

$ t - log \( 1 + t \) = t^2 integral_0^1 frac(r_0, 1 + r_0 t) thin d r_0 lt.eq frac(t^2, 2 \( 1 + t_(-) \)) . $

Applying this to the eigenvalues of $T$, we obtain

$ & - eta tau_Sigma R_o^2 - chevron.l R \, v' \( L \) chevron.r_T + tau \( T - log Sigma \)\
 & #h(8mm)  lt.eq (frac(.319^2, 4 eta \( 1 + t_(-) \)) + frac(1, 2 \( 1 + t_(-) \))) tau T^2 = 4417 / 2608 tau T^2 lt.eq 1.8 thin tau T^2 . $

The last coefficient has margin $1.8 - 4417 \/ 2608 = 1387 \/ 13040 > 0$. The commutator coefficient also has a positive margin:

$ e_0 + frac(alpha \( log 2 + .25 \), 4) < .256 + frac(2.26 \( .694 + .25 \), 4) = .78936 < .80 . $

Thus Equations (21) and (22) imply

#[#set math.equation(numbering: n => "(23)")
 $ cal(E) lt.eq Delta_(upright(p)) - J_Sigma \( u \) + .80 parallel \[ L \, T \] parallel_2^2 + 1.8 thin tau T^2 - integral \( W - W_0 \) thin d beta . $ <eq:23>]

Every term on the right except the final integral is now a functional of the linear Gaussian field $L$ and the deterministic matrix $T$. The final integral is nonnegative before its minus sign, because $W > W_0$ and $beta$ is a positive measure.

== 7 The linear-field bound and simplex rigidity <sec:06-linear-equality>

Equation (23) leaves us to estimate the terms depending on the linear Gaussian field $L = sum_(ell = 1)^m G_ell M_ell$ and the fixed matrix $T$. We now evaluate these terms and use the segment inequality (4) to control their sum. The strict terms retained in this calculation will also determine the equality case.

=== 7.1 Spectral averaging and Gaussian integration by parts <spectral-averaging-and-gaussian-integration-by-parts>

The matrices $T$ and $M_ell$ are fixed throughout this section, as in (8). At a given Gaussian input, choose an orthonormal eigenbasis of $L$, with eigenvalues $x_1 \, dots.h \, x_m$, and express all matrix entries in that basis. The indices $i \, j$ refer to this spectral basis; $ell$ still labels the fixed coefficient $M_ell$ and the Gaussian variable $G_ell$. Only the matrix coordinates are changed. Define a positive symmetric measure $nu$ on $bb(R)^2$ by

$ nu \[ Phi \] = 1 / m bb(E) sum_(ell \, i \, j) \| \( M_ell \)_(i j) \|^2 Phi \( x_i \, x_j \) \, #h(2em) upright(bold(S)) = sum_ell M_ell^2 . $

At each Gaussian input, it assigns weight $m^(- 1) sum_ell \| \( M_ell \)_(i j) \|^2$ to the ordered pair $\( x_i \, x_j \)$, and then averages over that input. It is not in general a probability measure. This definition is independent of the chosen eigenbasis: between two fixed eigenspaces, the sum of the squared entries is the squared Hilbert–Schmidt norm of the corresponding block. In particular, repeated eigenvalues cause no ambiguity. The measure has total mass $nu \[ 1 \] = tau upright(bold(S)) < oo$, and it integrates every function of polynomial growth, because $L$ is linear in a finite-dimensional Gaussian.

For a scalar or vector profile $f$, write

$ macron(f)_(i j) = integral_0^1 f \( \( 1 - t \) x_i + t x_j \) thin d t . $

Thus $macron(f)_(i j) = f \( x_i \)$ when $x_i = x_j$. For a scalar profile define

$ frak(R) \( f \) = sum_ell bb(E) [M_ell compose \( macron(f) ⊙ M_ell \) - M_ell^2 compose f \( L \)] . $

Here $⊙$ denotes entrywise multiplication in an eigenbasis of $L$. The resulting matrix is returned to the fixed coordinates before taking expectation. This convention is essential: the matrices $M_ell$ are deterministic in the fixed coordinates, whereas their entries in a spectral basis of $L$ generally depend on $G$.

In the next identity, $cal(N) = x partial_x - partial_x^2$ acts on the scalar profile before evaluation at $L$. It is not the operator $cal(N)_G$ acting on the resulting Gaussian matrix field.

#thm([Lemma 7.1.])[
  (Gaussian spectral identity).  #emph[Let $F_(*)$ be a smooth scalar function whose derivatives have polynomial growth, and put $f = F''_(*)$. Then 
#[#set math.equation(numbering: n => "(24)")
 $ bb(E) \[ \( cal(N) F_(*) \) \( L \) \] = \( upright(bold(S)) - I \) compose bb(E) f \( L \) + frak(R) \( f \) . $ <eq:24>]

]
] <lem:linear-spectral-identity>

#proof[
  For a smooth scalar function $h$, its matrix derivative at a real symmetric matrix satisfies
  $ #scale(x: 120%, y: 120%)[\(] D h \( L \) \[ M \] #scale(x: 120%, y: 120%)[\)]_(i j) = (integral_0^1 h' \( \( 1 - t \) x_i + t x_j \) thin d t) M_(i j) . $
  This is the Daleckiı̆–Kreı̆n divided-difference derivative formula; see #cite(label("Noferini2017")) Theorem 2.11. To justify it directly here, first use polynomials and then approximate $h$ in $C^1$ on a compact interval containing the spectrum. The divided differences converge uniformly, and the derivative maps converge in Hilbert–Schmidt norm. This gives the formula locally, including coincident eigenvalues, without differentiating a choice of eigenvectors.
  Apply this formula to $h = F'_(*)$. In the fixed coordinates,
  $ partial_(G_ell) F'_(*) \( L \) = D F'_(*) \( L \) \[ M_ell \] = macron(f) ⊙ M_ell . $
  The last expression is interpreted by the preceding spectral convention. Its Hilbert–Schmidt norm is at most $sup_(\| x \| lt.eq parallel L parallel_(upright("op"))) \| f \( x \) \| thin parallel M_ell parallel_(upright("HS"))$. Since $parallel L parallel_(upright("op")) lt.eq C \| G \|$, polynomial growth permits Gaussian integration by parts, for example by inserting smooth cutoffs in $G$ and then letting their supports increase. Thus the local polynomial approximation is used only to establish the derivative formula; no global interchange of polynomial approximants and Gaussian expectations is needed.
  Finally, $L$ commutes with $F'_(*) \( L \)$, so
  $ bb(E) \[ \( cal(N) F_(*) \) \( L \) \] & = bb(E) \[ L compose F'_(*) \( L \) \] - bb(E) f \( L \)\
 & = sum_ell M_ell compose bb(E) \[ macron(f) ⊙ M_ell \] - bb(E) f \( L \) . $
  Adding and subtracting $upright(bold(S)) compose bb(E) f \( L \)$ proves (24). ◻
]

=== 7.2 The linear-field estimate <the-linear-field-estimate>

The normalization (8) will cancel the term involving $upright(bold(S)) - I$ in Equation (24). A second estimate controls the weighted Dirichlet term by positive Gram matrices, and a commutator estimate accounts for the remaining covariance error.

#thm([Proposition 7.2.])[
  (Linear-field bound).  #emph[For the normalized field satisfying (8), with $t_(-) I lt.eq T lt.eq t_(+) I$, and the fixed profiles satisfying (2)–(4) and $sans(C) lt.eq - .341$, 
$ Delta_(upright(p)) - J_Sigma \( u \) + .80 parallel \[ L \, T \] parallel_2^2 lt.eq - 1.94 tau T^2 . $

 Consequently, with the notation of Equation (23), 
$ cal(E) lt.eq - .14 tau T^2 - integral \( W - W_0 \) thin d beta lt.eq 0 . $

 If $cal(E) = 0$, then $T = 0$, the measure $nu$ is supported on the diagonal, and $beta = 0$.]
] <prop:linear-field-bound>

#proof[
  #emph[The scalar functional.] Since $d$ is even, $psi_d$ is even, and the differential identities (2) give
  $ psi''_d = cal(N) d = \( cal(N) + 2 \) sans(K) \, #h(2em) \( psi_d - v \)'' = \( cal(N) + 2 \) \( sans(C) - a_R g'' \) . $
  For any smooth $F_(*)$, one has $\( cal(N) F_(*) \)'' = \( cal(N) + 2 \) F''_(*)$. Define the even second primitives
  $ A_K \( x \) = integral_0^x \( x - y \) sans(K) \( y \) thin d y \, #h(2em) A_C \( x \) = integral_0^x \( x - y \) sans(C) \( y \) thin d y . $
  They satisfy $A''_K = sans(K)$ and $A''_C = sans(C)$, and their derivatives have polynomial growth. The preceding identities show that $psi_d - cal(N) A_K$ and $psi_d - v - cal(N) \( A_C - a_R g \)$ have zero second derivative. Since $v$ and $g$ are also even, both differences are even and therefore constant. Thus, for constants $c_K \, c_C$,
  $ psi_d = cal(N) A_K + c_K \, #h(2em) psi_d - v = cal(N) A_C - a_R cal(N) g + c_C . $
  The reference-mean difference $Delta_Lambda j = tau_Lambda \( j \( L \) - \( gamma j \) I \)$ annihilates constants. Scalar Gaussian integration by parts gives $gamma \( cal(N) A_K \) = gamma \( cal(N) A_C \) = gamma \( cal(N) g \) = 0$, justified by polynomial growth. We can therefore apply Lemma 24 to $A_K$ and $A_C$. The remaining term is evaluated directly: $cal(N) g = sans(K)$, so its matrix expectation is $- a_R bb(E) sans(K) \( L \) = - a_R upright(bold(K))$.
  The unweighted trace of the first remainder is $tau frak(R) \( sans(K) \) = nu \[ e_K \]$. Applying Lemma 24 and using trace cyclicity therefore gives
  #[#set math.equation(numbering: n => "(25)")
   $ Delta_(upright(p)) & = nu \[ e_K \] + tau #scale(x: 120%, y: 120%)[\[] \( upright(bold(S)) - I \) \( upright(bold(K)) + T compose upright(bold(C)) \) #scale(x: 120%, y: 120%)[\]] - a_R tau \( T upright(bold(K)) \) + tau_T frak(R) \( sans(C) \)\
 & = nu \[ e_K \] + tau_T frak(R) \( sans(C) \) - lambda tau \( upright(bold(S)) T^2 \) - tau #scale(x: 120%, y: 120%)[\[] T^2 \( - a_R upright(bold(C)) - a_R lambda T - lambda I \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq nu \[ e_K \] + tau_T frak(R) \( sans(C) \) - lambda tau \( upright(bold(S)) T^2 \) - 1.94 tau T^2 . $ <eq:25>]
  For the second line use $upright(bold(K)) + T compose upright(bold(C)) = - lambda T^2$ from (8). For the last line, the same normalization and $upright(bold(C)) lt.eq - .341 I$ give
  $ - upright(bold(C)) - lambda T = frac(upright(bold(H)) - upright(bold(C)), 2) gt.eq frac(m_(*) + .341, 2) I \, #h(2em) a_R frac(m_(*) + .341, 2) - lambda = 1.94875 > 1.94 . $
  Pairing this operator inequality with $T^2 gt.eq 0$ is legitimate without commutation. In particular, the term involving $upright(bold(S)) - I$ has been eliminated without imposing a sign on that matrix.
  #emph[The weighted Dirichlet term.] By linearity in the trace weight, $J_Sigma = J_I + J_T$. Applying Gaussian integration by parts to the term containing $L$, and the derivative formula above to the Dirichlet term, yields
  $ J_I \( u \) = nu #scale(x: 120%, y: 120%)[\[] overline(\| u \|^2) - \| macron(u) \|^2 #scale(x: 120%, y: 120%)[\]] . $
  For the weighted part, fix a Gaussian input and express $T$ and every $M_ell$ in the chosen eigenbasis of $L$; they need not be diagonal. Expand the products in $J_T \( u \)$ and average the summands with outer indices $i \, k$ interchanged. The scalar kernel multiplying $\( M_ell \)_(i j) \( M_ell \)_(j k) T_(k i)$ is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] overline(\| u \|^2)_(i j) + overline(\| u \|^2)_(k j) #scale(x: 120%, y: 120%)[\)] - macron(u)_(i j) dot.op macron(u)_(k j) . $
  Set $u_j = u \( x_j \)$. Replacing both copies of the profile by $u - u_j$ leaves this kernel unchanged: its constant and linear terms cancel. The symmetrized kernel of $tau_T frak(R) \( sans(C) \)$ is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] overline(sans(C))_(i j) - sans(C)_i + overline(sans(C))_(k j) - sans(C)_k #scale(x: 120%, y: 120%)[\)] \, #h(2em) sans(C)_i = sans(C) \( x_i \) . $
  Swapping $i \, k$ identifies its two contributions after summation; thus its contraction can also use the single term $overline(sans(C))_(i j) - sans(C)_i$. Define
  $ b_(i j)^(*) = overline(sans(C))_(i j) - sans(C)_i - overline(\| u - u_j \|^2)_(i j) . $
  Subtracting the shifted kernel of $J_T \( u \)$ now gives the kernel of $tau_T frak(R) \( sans(C) \) - J_T \( u \)$:
  $ 1 / 2 \( b_(i j)^(*) + b_(k j)^(*) \) + \( macron(u)_(i j) - u_j \) dot.op \( macron(u)_(k j) - u_j \) . $
  For fixed $ell \, j$, this is multiplied by $T_(k i) \( M_ell \)_(i j) \( M_ell \)_(k j)$ and summed over $i \, k$; we have used symmetry to replace $\( M_ell \)_(j k)$ by $\( M_ell \)_(k j)$. Swapping $i \, k$ in half of the first term yields
  $ sum_(i \, k) T_(k i) \( M_ell \)_(i j) \( M_ell \)_(k j) frac(b_(i j)^(*) + b_(k j)^(*), 2) = sum_i \( T M_ell \)_(i j) \( M_ell \)_(i j) b_(i j)^(*) . $
  The second term is $"tr" \( T Q \)$, where
  $ Q_(i k) = \( M_ell \)_(i j) \( M_ell \)_(k j) \( macron(u)_(i j) - u_j \) dot.op \( macron(u)_(k j) - u_j \) . $
  This is the Gram matrix of the vectors $\( M_ell \)_(i j) \( macron(u)_(i j) - u_j \)$, so $Q gt.eq 0$ and $"tr" \( T Q \) lt.eq t_(+) "tr" Q$. Sum over $ell \, j$, take expectation, and divide by $m$. The definition of $nu$ then gives
  #[#set math.equation(numbering: n => "(26)")
   $ tau_T frak(R) \( sans(C) \) - J_T \( u \) & lt.eq 1 / m bb(E) sum_(ell \, i \, j) \( T M_ell \)_(i j) \( M_ell \)_(i j) b_(i j)^(*) + t_(+) nu \[ \| macron(u)_(i j) - u_j \|^2 \]\
 & lt.eq lambda tau \( upright(bold(S)) T^2 \) + frac(1, 4 lambda) nu \[ \( b_(i j)^(*) \)^2 \] + t_(+) nu \[ \| macron(u)_(i j) - u_j \|^2 \] . $ <eq:26>]
  The second step is scalar Young’s inequality entry by entry, followed by $sum_ell parallel T M_ell parallel_(upright("HS"))^2 = "tr" \( upright(bold(S)) T^2 \)$. The first term in this bound is exactly the one retained with a minus sign in (25).
  #emph[The commutator term.] For any fixed $M = M_ell$, commute $M$ with the quadratic matrix equation in (8). Expanding the Jordan products gives
  $ upright(bold(H)) compose \[ M \, T \] = \[ M \, upright(bold(K)) \] + T compose \[ M \, upright(bold(C)) \] . $
  The matrix $\[ M \, T \]$ is skew-symmetric, but the lower norm estimate still holds. In an orthonormal basis diagonalizing $upright(bold(H))$, the map $B mapsto upright(bold(H)) compose B$ multiplies entry $i j$ by $\( h_i + h_j \) \/ 2 gt.eq m_(*)$; hence it increases the Hilbert–Schmidt norm by at least the factor $m_(*)$ on all matrices. Likewise,
  $ parallel \( T - t_c I \) compose B parallel_2 lt.eq t_r parallel B parallel_2 \, $
  because the spectrum of $T - t_c I$ lies in $\[ - t_r \, t_r \]$. Splitting the right side at $t_c I$ and using $parallel A + B parallel_2^2 lt.eq 1.25 parallel A parallel_2^2 + 5 parallel B parallel_2^2$ gives
  $ m_(*)^2 parallel \[ M \, T \] parallel_2^2 lt.eq 1.25 parallel \[ M \, upright(bold(K)) + t_c upright(bold(C)) \] parallel_2^2 + 5 t_r^2 parallel \[ M \, upright(bold(C)) \] parallel_2^2 . $
  All matrices $M_ell$ are deterministic in this step. Thus, in fixed coordinates,
  $ \[ M \, bb(E) f \( L \) \] = bb(E) \[ M \, f \( L \) \] \, #h(2em) parallel bb(E) \[ M \, f \( L \) \] parallel_2^2 lt.eq bb(E) 1 / m parallel \[ M \, f \( L \) \] parallel_(upright("HS"))^2 . $
  Only after Jensen’s inequality do we pass to an eigenbasis of $L$. There the commutator has entries $\( M_ell \)_(i j) \( f \( x_j \) - f \( x_i \) \)$. The resulting endpoint weights are therefore precisely those defining $nu$. Gaussian orthogonality also gives $parallel \[ L \, T \] parallel_2^2 = sum_ell parallel \[ M_ell \, T \] parallel_2^2$. With the definition of $Gamma$ in (4), these observations yield
  #[#set math.equation(numbering: n => "(27)")
   $ .80 parallel \[ L \, T \] parallel_2^2 = .80 sum_ell parallel \[ M_ell \, T \] parallel_2^2 lt.eq nu \[ Gamma \] . $ <eq:27>]
  #emph[Assembly and strictness.] Combine (25)–(27). The two terms involving $lambda tau \( upright(bold(S)) T^2 \)$ cancel, giving
  $ & Delta_(upright(p)) - J_Sigma \( u \) + .80 parallel \[ L \, T \] parallel_2^2\
 & quad lt.eq nu #scale(x: 240%, y: 240%)[\[] e_K + Gamma + frac(\( b_(i j)^(*) \)^2, 4 lambda) + t_(+) \| macron(u)_(i j) - u_j \|^2\
 & #h(20mm)  - #scale(x: 120%, y: 120%)[\(] overline(\| u \|^2)_(i j) - \| macron(u)_(i j) \|^2 #scale(x: 120%, y: 120%)[\)] #scale(x: 240%, y: 240%)[\]] - 1.94 tau T^2 . $
  The measure $nu$ is symmetric. Averaging the integrand with the one obtained by swapping $i \, j$ changes its square term to $#scale(x: 120%, y: 120%)[\(] \( b_(i j)^(*) \)^2 + \( b_(j i)^(*) \)^2 #scale(x: 120%, y: 120%)[\)] \/ \( 8 lambda \)$, and its mean-displacement term to $t_(+) \( \| macron(u)_(i j) - u_j \|^2 + \| macron(u)_(i j) - u_i \|^2 \) \/ 2$. In the first square, $j$ is the endpoint $sigma$ of (4) and $i$ is the opposite endpoint. The symmetrized integrand is therefore strictly negative when $x_i eq.not x_j$, by (4), and is zero when the endpoints coincide. All endpoint terms are integrable by polynomial growth, so this proves the linear-field bound in Proposition 25.
  Substituting the displayed estimate into Equation (23) bounds $cal(E)$ above by the same nonpositive $nu$-integral, together with $- .14 tau T^2 - integral \( W - W_0 \) thin d beta$. The layer integral is finite by the projection-layer tails and the Gaussian tails of $L$, and $W - W_0 > 0$ by (3) and the averaging argument preceding (22). This proves the asserted bound on $cal(E)$, in particular $cal(E) lt.eq 0$. If $cal(E) = 0$, these three nonpositive contributions must all vanish. It follows that $T = 0$, $nu$ assigns zero mass to distinct endpoints, and $beta = 0$. No uniform strict margin is required: a nonnegative measurable function that is positive on a set can have integral zero only if that set has measure zero. ◻
]

=== 7.3 Equality and the volume product <equality-and-the-volume-product>

#proof[
  In dimension one, write $K = \[ a \, b \]$ with $a < b$. For $a < z < b$,
  $ \| K \| thin \| \( K - z \)^compose \| = \( b - a \) (frac(1, z - a) + frac(1, b - z)) gt.eq 4 \, $
  with equality exactly at $z = \( a + b \) \/ 2$. Every one-dimensional convex body is a simplex, so this proves the theorem for $n = 1$. For the remaining argument let $n gt.eq 2$ and $m = n + 1$.
  The Laplace bound (1) follows from Equation (11) and Proposition 25. Through the cone-volume identity this gives the required lower bound at every translation point $z_0 in "int" K$.
  Suppose first that equality holds in the Laplace bound. Equation (11) gives $0 gt.eq - cal(E) gt.eq 0$, so $cal(E) = 0$. Hence $nu$ is supported on the diagonal and $beta = 0$. The diagonal support has the following basis-independent consequence:
  $ nu \[ \( x - y \)^2 \] = 1 / m sum_ell bb(E) parallel \[ L \, M_ell \] parallel_(upright("HS"))^2 = 1 / m sum_(ell \, k) parallel \[ M_k \, M_ell \] parallel_(upright("HS"))^2 . $
  The second identity uses $L = sum_k G_k M_k$ and Gaussian orthogonality. Its left side is zero, so all the deterministic real symmetric matrices $M_ell$ commute. Choose a single orthonormal basis that diagonalizes them simultaneously; in this basis $L$ is diagonal for every $G$. Repeated eigenvalues do not affect this conclusion.
  In this fixed basis, the vanishing of $beta$ says that the nonnegative integrand
  $ sum_i #scale(x: 120%, y: 120%)[\(] \( P_z \)_(i i) - upright(bold(1))_({ x_i lt.eq z }) #scale(x: 120%, y: 120%)[\)] \( x_i - z \) $
  vanishes for almost every $\( G \, z \)$. Away from the spectral endpoints, each diagonal entry of $P_z$ is therefore the corresponding zero or one of $Theta_z \( L \)$. A positive semidefinite matrix with a zero diagonal entry has a zero row and column there. Apply this fact to $P_z$ at a zero entry and to $I - P_z$ at an entry equal to one. Since $0 lt.eq P_z lt.eq I$, it follows that $P_z = Theta_z \( L \)$ for almost every $\( G \, z \)$.
  For every $G$ the spectral endpoint set contains only finitely many values of $z$, so it has zero product measure. Fubini’s theorem now provides one fixed layer $z$ at which $D Pi_C \( Z + xi_z \)$ is diagonal almost surely. The covariance $Sigma$ is positive definite, so $Z + xi_z$ has an everywhere positive Gaussian density. Thus $D Pi_C$ is diagonal Lebesgue-almost everywhere in the same fixed basis.
  The projection $Pi_C$ is globally Lipschitz. Its cross weak derivatives vanish, and consequently its $i$th component depends only on coordinate $i$. For completeness, mollifying gives smooth maps with the same vanishing cross derivatives; each mollified component is constant along the other coordinate directions, and local uniform convergence gives the assertion for $Pi_C$. Write
  $ Pi_C \( x_1 \, dots.h \, x_m \) = \( f_1 \( x_1 \) \, dots.h \, f_m \( x_m \) \) . $
  Its image is both $C$ and the Cartesian product of the ranges of the $f_i$. Since $Pi_C \( 0 \) = 0$, every $f_j \( 0 \) = 0$, and evaluation at $t e_i$ gives $Pi_C \( t e_i \) = f_i \( t \) e_i in C$. Conversely, if $t e_i in C$, the projection fixes that point, so $f_i \( t \) = t$. The $i$th range is therefore exactly the axis section ${ t in bb(R) : t e_i in C }$, a closed convex cone. Solidity of $C$ excludes the factor ${ 0 }$, and pointedness excludes the factor $bb(R)$. Each factor is therefore a half-line, so the normalized cone is an orthant up to signs.
  Undoing the invertible transformation shows that the original cone has $m$ linearly independent generating rays. Every nonzero point of the original cone has strictly positive height, so each ray meets the height-one hyperplane. Rescale the generators to these intersection points. In a nonnegative linear combination of the rescaled generators, height one means that the coefficients sum to one. The section is therefore their convex hull. An affine relation among the intersection points would be a linear relation among the independent generators, so these $m = n + 1$ points are affinely independent. Thus $K$ is a simplex. If equality holds for the infimum defining $P \( K \)$, apply this argument at its interior attaining point.
  Conversely, the translated volume product is unchanged by applying an invertible affine map to both the body and its translation point: the linear part on the body is paired with its inverse transpose on the polar. It suffices to take
  $ K = "conv" { 0 \, e_1 \, dots.h \, e_n } \, #h(2em) z_0 = upright(bold(1)) / m \, $
  where $upright(bold(1))$ is the all-ones vector. The defining polar inequalities give
  $ \( K - z_0 \)^compose = "conv" { m upright(bold(1)) \, - m e_1 \, dots.h \, - m e_n } . $
  Indeed, writing $s = sum_(i = 1)^n y_i$, the polar inequalities are $s gt.eq - m$ and $y_i lt.eq 1 + s \/ m$. Set
  $ alpha_0 = frac(s + m, m^2) \, #h(2em) alpha_i = alpha_0 - y_i / m quad \( 1 lt.eq i lt.eq n \) . $
  These coefficients sum to one and satisfy $y = alpha_0 \( m upright(bold(1)) \) + sum_(i = 1)^n alpha_i \( - m e_i \)$. They are nonnegative exactly when the polar inequalities hold, proving the displayed convex-hull formula. Its volume is
  $ \| \( K - z_0 \)^compose \| = frac(m^n det \( I + upright(bold(1)) upright(bold(1))^(sans(T)) \), n !) = frac(m^m, n !) . $
  Since $\| K \| = 1 \/ n !$, this gives equality in the lower bound. The scalar estimates used in the argument are established in Appendices 9 and 10. ◻
]

== 8 Functional and entropy–transport consequences <sec:consequences>

The geometric theorem has two consequences outside the class of convex bodies. We first prove Corollary 2, using the all-dimensional geometric-to-functional implication, and verify its sharp constant. We then give the entropy–transport formulation, including the additional regularity assumption on the densities. Neither argument is an input to the geometric proof.

=== 8.1 The functional inequality and sharpness <the-functional-inequality-and-sharpness>

#proof[
  Set $f = e^(- phi)$, a nonzero integrable log-concave function. For $z in bb(R)^n$, define
  $ f^z \( y \) = inf_({ x : f \( x \) > 0 }) frac(e^(- chevron.l x - z \, y - z chevron.r), f \( x \)) \, #h(2em) cal(P) \( f \) = (integral_(bb(R)^n) f \( x \) thin d x) inf_(z in bb(R)^n) integral_(bb(R)^n) f^z \( y \) thin d y . $
  Fradelizi and Meyer proved that the general geometric Mahler inequality in every dimension implies $cal(P) \( f \) gt.eq e^n$ for every log-concave function on $bb(R)^n$ with $0 < integral_(bb(R)^n) f < oo$ #cite(label("FradeliziMeyer2008")) Proposition 2(a). Theorem 1 supplies precisely this all-dimensional hypothesis. At $z = 0$ the defining infimum gives $f^0 = e^(- phi^(*))$, so the product in Corollary 2 is at least $cal(P) \( f \)$. ◻
]

The translation-minimized bound used in the proof controls the origin-centered conjugate without imposing a centering or normalization condition on $phi$. The cited implication applies the geometric inequality to auxiliary bodies in dimensions $n + m$ and then lets $m$ tend to infinity; it is not merely a fixed-dimensional reformulation.

For sharpness, let $iota_A$ be zero on $A$ and $+ oo$ outside $A$. The potential and its transform

$ phi \( x \) = sum_(i = 1)^n x_i + iota_(\[ - 1 \, oo \)^n) \( x \) \, #h(2em) phi^(*) \( y \) = n - sum_(i = 1)^n y_i + iota_(\( - oo \, 1 \]^n) \( y \) $

satisfy $integral_(bb(R)^n) e^(- phi) = e^n$ and $integral_(bb(R)^n) e^(- phi^(*)) = 1$. This example attains the constant $e^n$. The simplex equality classification in Theorem 1 does not by itself classify equality for functional Mahler: the limiting implication does not transfer equality cases #cite(label("FradeliziMeyer2008")) p. 1437. For even potentials, the symmetric companion gives the sharper constant $4^n$ #cite(label("OpenAISymmetricMahler2026")) Corollary 1.2.

=== 8.2 The entropy–transport inequality <the-entropytransport-inequality>

The functional inequality also has an entropy–transport formulation. For a log-concave probability measure $eta$ with a density, let $H \( eta \) = integral log \( d eta \/ d x \) thin d eta$ denote its entropy relative to Lebesgue measure, the negative of differential Shannon entropy. For probability measures $mu_1 \, mu_2$ with finite first moments, set

$ cal(T) \( mu_1 \, mu_2 \) = inf_(f in cal(F)) {integral f thin d mu_1 + integral f^(*) thin d mu_2} \, $

where $cal(F)$ is the class of proper lower-semicontinuous convex functions $bb(R)^n arrow.r bb(R) union { + oo }$ and $f^(*)$ is the Fenchel–Legendre transform. The cost $cal(T)$ is allowed to be $+ oo$.

#thm([Corollary 8.1.])[
  (Entropy–transport inequality).  #emph[For every integer $n gt.eq 1$, let $eta_i \( d x \) = e^(- V_i \( x \)) thin d x$, $i = 1 \, 2$, be full-dimensional log-concave probability measures, with proper lower-semicontinuous convex potentials $V_i$. Suppose their densities are essentially continuous, meaning that $e^(- V_i) = 0$ at $cal(H)^(n - 1)$-almost every point of $partial "supp" eta_i$. Their moment measures $nu_i = \( nabla V_i \)_(\#) eta_i$ have finite first moments, $H \( eta_i \) = - integral V_i thin d eta_i$ is finite, and 
$ H \( eta_1 \) + H \( eta_2 \) lt.eq - 3 n + cal(T) \( nu_1 \, nu_2 \) . $

]
] <cor:entropy-transport>

#proof[
  Gozlan’s equivalence between the functional inverse Santaló and entropy–transport inequalities, as stated in #cite(label("FradeliziGozlanZugmeyer2021")) Theorem 1.3, applies to Corollary 2 with $c = e$ and gives the constant $- n log \( e thin e^2 \) = - 3 n$. ◻
]

== 9 Quantitative one-variable estimates <sec:07-scalar>

This section proves the scalar bounds used in the matrix argument and in Appendix 10. The proof separates three tasks: exact arithmetic at finitely many nodes, analytic interpolation between those nodes, and estimates on the two unbounded tails. The final pointwise inequalities then follow from a finite collection of rectangles with strict positive margins.

=== 9.1 Profiles and the required estimates <profiles-and-the-required-estimates>

Throughout this section and Appendix 10, finite decimal constants (including decimal endpoints of intervals) denote exact rationals. All notation introduced for the calculations below is local to this section. The parameters are

$ b = .602 \, quad c = .365 \, quad k = sqrt(b - c) \, quad r = .22 \, quad s = 3.6 \, quad w = 4.6 \,\
eta = .022 \, quad kappa = 1.16 \, quad a_R = 7.5 \, quad lambda = .65 . $

Put $t_(-) = - .022 \, med t_(+) = .064 \, med t_c = .021 \, med t_r = .043 \, med m_(*) = .352$, so $t_plus.minus = t_c plus.minus t_r$. Write $phi.alt \, p$ for the standard Gaussian density and distribution function and $cal(N) = x partial_x - partial_x^2$. We recall the following profiles on the real line (these formulas also specify them at zero):

$ X = p \/ phi.alt \, quad Y = \( 1 - p \) \/ phi.alt \, quad f = - \( 1 - p \) - log p \, quad j = - p - log \( 1 - p \) \, quad B = 1 - x Y \,\
d = \( 1 + x X \)^2 f + B^2 j \, #h(2em) g = 1 / 2 \( 1 - X^2 f - Y^2 j \) \, #h(2em) v = log \( X Y \) \,\
sans(K) = d - 2 g \, quad sans(C) = - d + \( a_R - 1 \) g'' \, quad t = "arsinh" \( x \/ s \) \, quad a_t = s cosh t \,\
pi \( x \) = r \( cos \( w t \) \, sin \( w t \) \) \, #h(2em) ell \( x \) = sqrt(b - r^2 - d \( x \)) \, quad q \( x \) = k - ell \( x \) \,\
S_q = \( 2 + cal(N) \) q \, quad S_pi = \( 2 + cal(N) \) pi \, quad rho = \| S_pi \| . $

Thus $v = - log \[ \( phi.alt \/ p \) \( phi.alt \/ \( 1 - p \) \) \]$. In numerical constants such as $sqrt(2 pi)$, the symbol $pi$ denotes the circular constant; the vector profile is denoted by $pi \( x \)$. Dots denote $t$-derivatives, $n_F = dot.double(F) - tanh \( t \) dot(F) = a_t^2 F'' \( x \)$.

The square root defining $q$ is initially understood wherever its radicand is positive. We prove a uniform lower bound for that radicand before using any global derivative estimate for $q$. Reflection makes $d \, g \, v \, sans(K) \, sans(C) \, q$ even; the two components of $pi \( x \)$ are even and odd, respectively.

#thm([Lemma 9.1.])[
  (Real profile bounds).  #emph[For every real $x$, one has $ell > 0$. Bounds on values, and absolute bounds on derivatives, are as follows (a dash means no bound asserted): 
$ & inf med gt.eq & sup med lt.eq & \| dot(F) \| & \| dot.double(F) \| & \| n_F \|\
sans(K) & - .007 & .0275 & .066 & .238 & -\
sans(C) & - .501 & - .341 & .247 & .79 & .79\
q & .0775 & .2559 & .193 & .53 & .53 $

 Also $\| v' \( x \) - x \| lt.eq .319$, and 
$ lambda t_(-)^2 + t_(-) sans(C) + sans(K) > 0 \, #h(2em) lambda t_(+)^2 + t_(+) sans(C) + sans(K) < 0 \, #h(2em) 2 \( - .37 \) sans(C) - \( .37 \)^2 - 4 lambda sans(K) > m_(*)^2 . $

 We have 
$ U_(*) := 1.507 max \( 0 \, - n_(sans(K)) \) + frac(12 dot.op .80, m_(*)^2) [1.25 \( dot(sans(K)) + t_c dot(sans(C)) \)^2 + 5 t_r^2 dot(sans(C))^2] lt.eq .54 thin r^2 w^2 . $

 The following additional bounds hold on $\| t \| gt.eq 1.4$: 
$ - .0001 lt.eq sans(K) lt.eq .0191 \, quad - .501 lt.eq sans(C) lt.eq - .495 \, quad .235 lt.eq q \, #h(2em) \| dot(sans(K)) \| lt.eq .0211 \, quad \| dot(sans(C)) \| lt.eq .0084 \, quad n_(sans(K)) gt.eq 0 . $

 For $\| t \| gt.eq 3.6$, $0 lt.eq sans(K) lt.eq .0008$, $\| sans(C) + .5 \| lt.eq .0002$, $q gt.eq .255$. For $\| x \| gt.eq 5$, $q gt.eq .2203$. Also $integral_0^oo \( sans(K) \)_(+) \( x \) thin d x lt.eq .422$ and $integral_0^(s sinh \( 1.4 \)) \( sans(K) \)_(+) lt.eq .126$.]
] <lem:scalar-ranges>

#thm([Lemma 9.2.])[
  (Pointwise layer inequalities).  #emph[We have $.113 lt.eq S_q lt.eq .514 \, med rho lt.eq 1.104$. For any $z \, x$, put 
$ H = 4 c + 4 k q \( x \) + 2 \( k - q \( x \) \) S_q \( z \) - 2 S_pi \( z \) dot.op pi \( x \) \, #h(2em) J = H + v'' \( x \) - 2 kappa \, quad b_m = frac(\( 1 + t_(+) \) \( b - 3 eta \), 3 \( 3 \( b + eta \) - 4 c \)) . $

 Thus $J$ is the profile $H_0$ in Proposition 5. With $h_s = .5 \, med e_0 = .256 \, med alpha = 2.26$, 
$ H + t_c J - 1 / 2 t_r \( h_s + J^2 \/ h_s \) - J^2 \/ alpha > 2 \( b + eta + \( b + eta - kappa \) t_(-) \) + 2 b_m S_q \( z \) S_q \( x \) + 2 e_0 \( 2 t_r \)^2 . $

 Also $b + eta + kappa t_(-) + .125 > 0$, $1.053 kappa^2 \/ \[ 8 \( b + eta + kappa t_(-) + .125 \) \] < e_0$ and $e_0 + \( log 2 + .25 \) alpha \/ 4 < .80$. We also have $4 c + 2 k \( S_q \( x \) + S_q \( z \) \) - S_q \( x \) S_q \( z \) - S_pi \( x \) dot.op S_pi \( z \) > .25$.]
] <lem:scalar-layer>

We prove Lemmas 27 and 28 in the remainder of the section. In particular, none of their numerical conclusions is used to justify the finite arithmetic that establishes it.

=== 9.2 Stable formulas and finite certificates <stable-formulas-and-finite-certificates>

By reflection it suffices to calculate on $x gt.eq 0$. Write $u = 1 - p = Y phi.alt$, $h = h \( u \) = \( - log \( 1 - u \) - u \) \/ u^2$, with the removable value $h \( 0 \) = 1 \/ 2$. The following formulas avoid cancellation between exponentially large factors:

$ Y = integral_0^oo e^(- x y - y^2 \/ 2) d y \, quad B = 1 - x Y \, & j = x^2 \/ 2 + log sqrt(2 pi) - log Y - p \,\
d = B^2 j + \( 1 - p B \)^2 h \, & sans(K) = d + Y^2 \( j + p^2 h \) - 1 \,\
g' = Y \( B j - \( 1 - p B \) p h \) \, & g'' = x g' - sans(K) \,\
R_v = v' - x = phi.alt \/ p - B \/ Y \, & V_2 = v'' = 2 - \( phi.alt \/ p \) \( x + phi.alt \/ p \) - B \/ Y^2 \,\
D_1 = d' = x \( 2 d - 1 \) - R_v - 2 g' \, & D_2 = d'' = 2 d + 2 x D_1 - 2 g'' - V_2 \,\
G_3 = g''' = x g'' + 3 g' - D_1 \, & G_4 = g'''' = x G_3 + 4 g'' - D_2 . $

Indeed $X' = 1 + x X \, med Y' = x Y - 1 \, med f' = - phi.alt \( 1 - p \) \/ p \, med j' = phi.alt p \/ \( 1 - p \)$; differentiation gives the identities. For $F = d \, sans(K) \, sans(C)$, respectively, use

$ \( P_F \, Q_F \) = \( D_1 \, D_2 \) \, quad \( D_1 - 2 g' \, D_2 - 2 g'' \) \, quad \( - D_1 + 6.5 G_3 \, - D_2 + 6.5 G_4 \) \,\
dot(F) = a_t P_F \, #h(2em) dot.double(F) = a_t^2 Q_F + x P_F \, #h(2em) n_F = a_t^2 Q_F . $

Further,

$ dot(q) = frac(dot(d), 2 ell) \, #h(2em) dot.double(q) = frac(dot.double(d) \/ 2 + dot(q)^2, ell) \, #h(2em) n_q = frac(n_d \/ 2 + dot(q)^2, ell) \,\
S_q = 2 q + x / a_t \( 1 + a_t^(- 2) \) dot(q) - dot.double(q) \/ a_t^2 \,\
rho = r sqrt(\( 2 + w^2 \/ a_t^2 \)^2 + \( 1 + a_t^(- 2) \)^2 w^2 x^2 \/ a_t^2) . $

For $0 lt.eq t lt.eq 3.6$, we use a uniform mesh and additional nodes for interpolation. The samples are at $t_i = i \/ 40 \, med 0 lt.eq i lt.eq 151$; a subscript $i$ denotes evaluation at that node. In the first table below, the second column encloses these values, with symmetric endpoints denoted $plus.minus$. The third column bounds $\| F_(i + 1) - 2 F_i + F_(i - 1) \|$ for $0 lt.eq i lt.eq 150$, with the value at $- 1$ supplied by parity. The fourth bounds $\| F_(i + 1) - F_i \|$ for $0 lt.eq i lt.eq 150$, when needed.

#thm([Lemma 9.3.])[
  (Finite certificates).  #emph[The following sample bounds hold with exact rational endpoints. 
$ & upright("value") & \| Delta^2 \| & \| Delta \|\
d & \[ .3862 \, .5 \] & .000260 & -\
dot(d) & plus.minus .1338 & .00092 & .01037\
dot.double(d) & plus.minus .415 & .00421 & .03670\
sans(K) & \[ - .00692 \, .02737 \] & .000148 & -\
dot(sans(K)) & plus.minus .06542 & .000673 & -\
dot.double(sans(K)) & plus.minus .2355 & .00373 & -\
n_(sans(K)) & plus.minus .2355 & .00402 & -\
sans(C) & \[ - .5 \, - .3413 \] & .00049 & -\
dot(sans(C)) & plus.minus .2456 & .00222 & -\
dot.double(sans(C)) & plus.minus .780 & .0129 & -\
n_(sans(C)) & plus.minus .780 & .0138 & -\
R_v & plus.minus .318 & .00167 & -\
V_2 & plus.minus 1.06 & .00186 & -\
q & \[ .0777 \, .25525 \] & - & -\
dot(q) & plus.minus .1908 & - & .0127\
dot.double(q) & plus.minus .508 & - & .047\
n_q & plus.minus .508 & - & - $

 The same nodes give the following simultaneous bounds: 
$ i & sup U_(*) & inf \( lambda t_(-)^2 + sans(C) t_(-) + sans(K) \) & sup \( lambda t_(+)^2 + sans(C) t_(+) + sans(K) \) & inf \( 2 \( - .37 \) sans(C) - .37^2 - 4 lambda sans(K) \)\
0 : 151 & .537 & .00090 & - .00074 & .132 $

 Here the entries for extrema are bounds in the indicated directions. For $56 lt.eq i lt.eq 144$, sample bounds are $0 lt.eq sans(K) lt.eq .019 \, med \| dot(sans(K)) \| lt.eq .0207 \, med n_(sans(K)) gt.eq .00315 \, med - .5 lt.eq sans(C) lt.eq - .49512 \, med \| dot(sans(C)) \| lt.eq .0071 \, med q gt.eq .2353$. For $45 lt.eq i lt.eq 144$, $q gt.eq .2204$.]
  #emph[For $i = 56 \, 144$, respectively, the finite sums satisfy 
$ x_i \( \( sans(K)_i \)_(+) + .238 \/ 12800 \) - 40 sum_(j = 1)^i \( a_(t_j) - a_(t_(j - 1)) \) \( \( sans(K)_j \)_(+) - \( sans(K)_(j - 1) \)_(+) \) lt.eq .126 \, med .335 . $

]
] <lem:scalar-certificates>

#proof[
  At each node, we first enclose $x_i = s sinh \( i \/ 40 \)$, $a_(t_i)$, $phi.alt \( x_i \)$, and $Y \( x_i \)$ by the rules below. These give $u \, p \, h \, j$, and hence $d \, g' \, g'' \, sans(K) \, R_v \, V_2$ by the stable formulas. Next compute $D_1 \, D_2 \, G_3 \, G_4$, and use $P_F \, Q_F$ to obtain the dotted derivatives and $n_F$. The enclosure $d_i lt.eq .5$ at each node gives $b - r^2 - d_i gt.eq .0536$; only then do we evaluate $q_i$ and its derivative formulas. This is a nodewise check, not yet a positivity assertion between nodes.
  Taking interval hulls of these samples gives the value columns. Subtraction gives the first and second differences on the index ranges specified above. For the second difference at zero, use the odd reflection for dotted first derivatives and $R_v$, and the even reflection for the other rows. Evaluating the four expressions in the second table directly at the same nodes gives their simultaneous bounds. The same arithmetic evaluates the two finite sums in the statement. Interpolation will later turn them into integral bounds; here they are only finite expressions in the enclosed node data. The primitive enclosures are as follows.
  ===== 9.2.1 Node coordinates and Gaussian density. <node-coordinates-and-gaussian-density.>
  Take $E = #scale(x: 120%, y: 120%)[\(] sum_(m = 0)^26 \( i \/ 160 \)^m \/ m ! + \[ - 10^(- 27) \, 10^(- 27) \] #scale(x: 120%, y: 120%)[\)]^4$. This encloses $e^(i \/ 40)$, so $s \( E - 1 \/ E \) \/ 2$ and $s \( E + 1 \/ E \) \/ 2$ enclose $x_i$ and $a_(t_i)$, respectively; intersect the former with $\[ 0 \, 90 \]$. For $i lt.eq 73$, enclose $phi.alt$ by the same exponential sum with argument $- x_i^2 \/ 128$ and the same error, raised to the 64th power and divided by $sqrt(2 pi)$. For $i gt.eq 74$, use $\[ 0 \, 10^(- 26) \]$. Indeed $x_73 < 11 < x_74$, and $e^(11^2 \/ 2) > 10^26$, for instance from $e^(1 \/ 2) > 1.645$. Every Taylor sum just used has a true argument of absolute value at most $1$. Thus $e^1 \/ 27 ! < 3 \/ 27 ! < 10^(- 27)$ bounds its error before taking powers.
  ===== 9.2.2 Gaussian tails. <gaussian-tails.>
  For $i lt.eq 30$, take $y_m = x_i \( - x_i^2 \/ 2 \)^m \/ m !$ and $L = sum_(m = 0)^39 y_m \/ \( 2 m + 1 \) + \[ 0 \, y_40 \/ 81 \]$, then use $Y = \( 1 \/ 2 - L \/ sqrt(2 pi) \) \/ phi.alt$. This integrates the Taylor bounds for a negative exponential. The terms can be formed recursively as $y_(m + 1) = - y_m x_i^2 \/ \( 2 m + 2 \)$.
  For $i gt.eq 31$, division by the small Gaussian density is avoided. Start with $T_34 = \[ 0 \, 34 \/ x_i \]$, put $T_m = m \/ \( x_i + T_(m + 1) \)$ for $m = 33 \, dots.h \, 1$, and use $Y = 1 \/ \( x_i + T_1 \)$. To justify this enclosure, put $I_m \( x \) = integral_0^oo y^m e^(- x y - y^2 \/ 2) thin d y$. Integration by parts gives $m I_(m - 1) = x I_m + I_(m + 1)$, so $T_m = I_m \/ I_(m - 1) = m \/ \( x + T_(m + 1) \)$ and $0 < T_34 < 34 \/ x$. Also $x I_0 + I_1 = 1$, giving the formula for $Y = I_0$.
  ===== 9.2.3 Logarithmic profiles and square roots. <logarithmic-profiles-and-square-roots.>
  The tail enclosure gives $u = \( Y phi.alt \) ∩ \[ 0 \, 1 \/ 2 \]$ and $p = 1 - u$. For $h$, use $sum_(m = 0)^44 u^m \/ \( m + 2 \) + \[ 0 \, 2 u^45 \/ 47 \]$; the last interval bounds the remaining positive series because $u lt.eq 1 \/ 2$. To evaluate the logarithms in $j$, scale each argument by a power of 2 into $\[ 1 \, 2.01 \]$. For a scaled argument $z$, including $z = 2$, take $2 sum_(m = 0)^24 y^(2 m + 1) \/ \( 2 m + 1 \)$, where $y = \( z - 1 \) \/ \( z + 1 \)$, with absolute error $2 \| y \|^51 \/ \( 51 \( 1 - y^2 \) \)$. Correct for the scaling by the corresponding multiple of $log 2$. Use $log sqrt(2 pi) = 1 / 2 log \( 2 pi \)$ and $3.14159265358979323846264338 lt.eq pi lt.eq 3.14159265358979323846264339$. These endpoints follow, for example, from the arctangent series at $1 \/ 5 \, 1 \/ 239$ in $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$. For the square roots in the profiles, consecutive multiples of $10^(- 26)$ enclosing each endpoint suffice.
  Every addition, multiplication, reciprocal, and power is evaluated by the full range of that operation on its interval arguments; endpoints are rounded outwards. In particular the square of an interval crossing zero has lower endpoint zero. The intersections and square-root rules above preserve inclusion. They therefore give rational certificates, without an assumption about the accuracy of numerical special functions. For example, the two displayed finite integral sums lie respectively in $\[ .1250504493 \, .1250504494 \]$ and $\[ .3344848649 \, .3344848650 \]$, and the four simultaneous bounds have strict slack before rounding to the displayed table.
  The supplementary programs #raw("scalar_intervals.py") and #raw("scalar_algebra.py") implement these rules with integer endpoints on a $10^(- 70)$ grid and the specified $10^(- 26)$ square-root grid. They also record each resulting interval. The formulas and remainder bounds here specify the certificates independently of those programs. A program-to-claim index and reproduction instructions for both appendices are supplied in #raw("verification/README.md"). ◻
]

=== 9.3 Analytic interpolation <analytic-interpolation>

#thm([Lemma 9.4.])[
  (A common analytic strip).  #emph[As functions of $t$, the profiles $d \, sans(K) \, sans(C) \, R_v \, V_2$ are analytic in a neighborhood of ${ t : \| Im t \| lt.eq .45 }$. On this strip, the first three have modulus at most $1300$, and the last two at most $11000$.]
] <lem:scalar-strip>

#proof[
  First suppose $Re t gt.eq 0$, and write $x = A + i y = s sinh t$. Then $A gt.eq 0$, and the elementary bounds $sin \( .45 \) < .435$, $tan \( .45 \) < .5$ give
  $ y^2 lt.eq 2.5 + .25 A^2 . $
  The Laplace integrals for $Y$ and $B = - Y'$ give
  $ \| Y \| lt.eq Y \( A \) lt.eq min \( 1.254 \, 1 \/ A \) \, #h(2em) \| B \| lt.eq min \( 1 \, 1 \/ A^2 \) \, $
  where expressions containing $1 \/ A$ are omitted at $A = 0$. The corresponding tail integral for $u = 1 - p$ gives
  $ \| u \| lt.eq e^(y^2 \/ 2) u \( A \) lt.eq 1.75 \, $
  since $u \( A \) e^(A^2 \/ 8)$ decreases on $\[ 0 \, oo \)$. Indeed $A u \( A \) lt.eq phi.alt \( A \)$ follows by integrating the Gaussian tail, and differentiating the product proves this monotonicity.
  If $A lt.eq .9$, then $A \| y \| < pi \/ 2$. Horizontal integration of $phi.alt$ from $i y$ to $A + i y$, starting with $Re p \( i y \) = 1 \/ 2$, gives $Re p gt.eq 1 \/ 2$. If $A gt.eq .9$, then
  $ \| u \| lt.eq u \( .9 \) e^(1.25 + .125 dot.op .9^2) < .80 \, #h(2em) u \( .9 \) lt.eq 1 / 2 - frac(.9 - .9^3 \/ 6, sqrt(2 pi)) . $
  Thus $Re p > 0$ throughout the right-half image. The identity
  $ h \( u \) = integral_0^1 frac(v, 1 - u v) thin d v $
  shows analyticity and $\| h \| lt.eq 2.5$: the denominator has real part at least $1 \/ 2$ in the first region and modulus at least $.2$ in the second.
  We also need a nonvanishing bound for $Y$. Its Laplace transform and the characteristic function $e^(- A \| s' \|)$ of a Cauchy variable $T_A$ of scale $A$ give
  $ Re Y \( A + i y \) = sqrt(pi \/ 2) thin bb(E) e^(- \( y + T_A \)^2 \/ 2) > 0 . $
  At $A = 0$, take $T_A = 0$. If $A lt.eq 2$, with probability at least $1 \/ 4$ one has $\| y + T_A \| lt.eq max \( \| y \| \, A \) lt.eq 2$. For instance, when $y gt.eq 0$ the permitted interval contains $\[ - A \, 0 \]$; reflection handles the other sign. Hence $Re Y gt.eq sqrt(pi \/ 2) e^(- 2) \/ 4 > .02$. If $A gt.eq 2$, the mean of the integration variable under the Laplace weight is at most $1 \/ A$, because the Gaussian factor is a decreasing tilt of an exponential density. Consequently
  $ lr(|frac(Y \( A + i y \), Y \( A \)) - 1|) lt.eq frac(\| y \|, A) lt.eq sqrt(7 \/ 8) < .936 \, #h(2em) Y \( A \) gt.eq e^(- 1 - 1 \/ \( 2 A^2 \)) / A > .324 / A . $
  In both regions,
  $ \| Y \| gt.eq frac(.02, 1 + A) . $
  The principal logarithms of $p$ and $Y$ are therefore analytic here. The analytic logarithm of $1 - p = phi.alt Y$ is $log Y - x^2 \/ 2 - log sqrt(2 pi)$, which agrees with its real value on the positive axis. This specifies the branch in $j$. The preceding bounds yield
  $ \| j \| lt.eq .625 A^2 + log \( 1 + A \) + 10.5 \, #h(2em) \| B j \| lt.eq 12 \, #h(2em) \| Y^2 j \| lt.eq 19 . $
  For example, use $\| log Y \| lt.eq log 50 + log \( 1 + A \) + pi \/ 2$, $\| p \| lt.eq 2.75$, and then split at $A = 1$ for the last two bounds. The stable formulas, together with $\| 1 - p B \| lt.eq 3.75$ and $\| x Y \| = \| 1 - B \| lt.eq 2$, now imply
  $ \| d \| < 48 \, #h(2em) \| sans(K) \| < 99 \, #h(2em) \| x g' \| < 76 \, #h(2em) \| sans(C) \| lt.eq 48 + 6.5 \( 76 + 99 \) < 1300 . $
  Also
  $ \| phi.alt \/ p \| lt.eq 7 e^(- .375 A^2) \, #h(2em) \| B \/ Y \| lt.eq 100 \, #h(2em) \| B \/ Y^2 \| lt.eq 10000 . $
  Thus $\| R_v \| lt.eq 107$. Since $\| x \| lt.eq 1.25 A + 1.6$ and $A e^(- .375 A^2) lt.eq 1$, $\| x phi.alt \/ p \| < 20$, giving $\| V_2 \| lt.eq 2 + 20 + 49 + 10000 < 11000$.
  Reflection gives the left-half bounds. On the imaginary segment in question, both $p$ and $1 - p$ have real part $1 \/ 2$, and $Re Y > 0$. The formulas are therefore regular on a neighborhood of that segment. The right-half expressions and their parity reflections agree near zero and hence by analytic continuation across the segment. This proves the asserted full-strip analyticity and bounds. ◻
]

#thm([Lemma 9.5.])[
  (Interpolation from second differences).  #emph[Put $cal(R) \( M \) = .536 M + .00001$. For any of 
$ F \, dot(F) \, dot.double(F) \, n_F quad \( F = d \, sans(K) \, sans(C) \) \, #h(2em) R_v \, V_2 \, $

 the error from its central chord, the affine interpolant through the two endpoints of a mesh cell in $\[ 0 \, 3.6 \]$, is at most $cal(R) \( M \)$, where $M$ bounds its absolute second differences whose three nodes lie in the sixteen-node stencil for that cell.]
] <lem:scalar-interpolation>

#proof[
  Fix one of the functions in the statement and denote it by $Psi$. Use the 16 nodes $i - 7 \, dots.h \, i + 8$ for the cell $\[ t_i \, t_(i + 1) \]$, reflecting by parity when necessary. Let $cal(I)_8$ be its interpolating polynomial on this stencil, of degree at most 15. We first bound $Psi - cal(I)_8$, and then compare $cal(I)_8$ with the central chord. The first error is at most
  $ 4 dot.op 10^5 product_(j = 0)^7 \( \( j + 1 \/ 2 \) \/ \( 40 dot.op .36 \) \)^2 < .00001 $
  in the cell. Indeed Lemma 30 and Cauchy’s estimates from the strip of half-width $.45$ to that of half-width $.36$ bound, across the gap $.09$, $dot(F)$ by $1300 \/ .09$, $dot.double(F)$ by $2 dot.op 1300 \/ .09^2$, and $n_F$ by their sum, which is less than $4 dot.op 10^5$. Here $\| tanh t \| lt.eq 1$ on $\| Im t \| lt.eq .36$. Apply the real interpolation remainder and Cauchy’s estimate of order 16 on the inner strip. The paired nodal factors attain their maximum at the midpoint of the cell; the displayed bound is less than $.000007336661$.
  For the comparison with the chord, normalize the cell by $t = t_i + delta theta$, where $delta = 1 \/ 40$ and $0 lt.eq theta lt.eq 1$, and put $Psi_k = Psi \( t_i + k delta \)$. For $1 lt.eq l lt.eq 8$, let $cal(I)_l$ interpolate these values at $k = 1 - l \, dots.h \, l$; thus $cal(I)_1$ is the central chord. For $2 lt.eq l lt.eq 8$, let $cal(J)_l^(-)$ omit the rightmost node $l$, and let $cal(J)_l^(+)$ omit the leftmost node $1 - l$. The interpolation identity
  $ cal(I)_l \( theta \) = frac(l - theta, 2 l - 1) cal(J)_l^(-) \( theta \) + frac(theta + l - 1, 2 l - 1) cal(J)_l^(+) \( theta \) $
  follows by checking the nodal values and the degree. Its weights are nonnegative and sum to one on the central cell.
  The common nodes of $cal(J)_l^(-)$ and $cal(J)_l^(+)$ are exactly those of $cal(I)_(l - 1)$. With $Delta Psi_k = Psi_(k + 1) - Psi_k$, Newton interpolation therefore gives
  $ cal(J)_l^(-) - cal(I)_(l - 1) & = frac(Delta^(2 l - 2) Psi_(1 - l), \( 2 l - 2 \) !) product_(k = 2 - l)^(l - 1) \( theta - k \) \,\
cal(J)_l^(+) - cal(I)_(l - 1) & = frac(Delta^(2 l - 2) Psi_(2 - l), \( 2 l - 2 \) !) product_(k = 2 - l)^(l - 1) \( theta - k \) . $
  There is no mesh factor in these formulas because the nodes in the $theta$ coordinate have spacing one. Equivalently, the powers of $delta$ in the nodal product cancel those in the divided difference. Expanding $Delta^(2 l - 2) = Delta^(2 l - 4) Delta^2$ and using the second-difference bound gives
  $ \| Delta^(2 l - 2) Psi_k \| lt.eq 2^(2 l - 4) M . $
  Pair the nodal factors about $1 \/ 2$. On $0 lt.eq theta lt.eq 1$,
  $ lr(|product_(k = 2 - l)^(l - 1) \( theta - k \)|) = product_(j = 0)^(l - 2) #scale(x: 120%, y: 120%)[\(] \( j + 1 / 2 \)^2 - \( theta - 1 / 2 \)^2 #scale(x: 120%, y: 120%)[\)] lt.eq product_(j = 0)^(l - 2) \( j + 1 / 2 \)^2 . $
  The convex-blend identity bounds $\| cal(I)_l - cal(I)_(l - 1) \|$ by the product of these two bounds divided by $\( 2 l - 2 \) !$. Summing over the seven successive pairs of added nodes yields
  $ \| cal(I)_8 - cal(I)_1 \| lt.eq M sum_(l = 2)^8 frac(2^(2 l - 4), \( 2 l - 2 \) !) product_(j = 0)^(l - 2) \( j + 1 \/ 2 \)^2 = 4387 / 8192 M < .536 M . $
  Adding the analytic remainder proves the claimed chord error. For the final cell $i = 143$, the largest stencil index is $151$; near zero, parity supplies the negative indices. These stencils cover the entire interval $\[ 0 \, 3.6 \]$. ◻
]

=== 9.4 Bounds between the nodes <bounds-between-the-nodes>

Apply Lemma 31 using the third column of Lemma 29 on its first thirteen lines. In particular $d lt.eq .50015$, so $b - r^2 - d gt.eq .05345 > 0$ on this finite region. This conclusion uses only the $d$ table and its interpolation bound, and therefore precedes all estimates involving $q$ or $1 \/ ell$.

We now estimate the chord errors for $q$ and its derivatives. Set $delta = 1 \/ 40$ and $l = 1 \/ \( 2 ell \)$; the positive radicand just proved licenses this division throughout the finite region. The interpolated bounds for $d \, dot(d) \, dot.double(d)$, together with

$ dot(l) = 2 l^3 dot(d) \, #h(2em) dot.double(l) = 2 l^3 dot.double(d) + 12 l^5 dot(d)^2 \, $

give $l lt.eq 2.164$, $\| dot(l) \| lt.eq 2.8$, and $\| dot.double(l) \| lt.eq 19.2$. The chord error for $l$ is consequently at most $e = 19.2 delta^2 \/ 8 = 19.2 \/ 12800$.

For the products below, let $J_E \, J_F \, J_(E F)$ denote the affine chords of $E \, F \, E F$ on a cell, and put $theta = \( t - t_i \) \/ delta$. The exact identity

$ E F - J_(E F) = E \( F - J_F \) + J_F \( E - J_E \) - theta \( 1 - theta \) \( E_(i + 1) - E_i \) \( F_(i + 1) - F_i \) $

shows that errors $epsilon.alt_E \, epsilon.alt_F$ for the two factors give the product error

$ sup \| E \| thin epsilon.alt_F + max \( \| F_i \| \, \| F_(i + 1) \| \) thin epsilon.alt_E + 1 / 4 \| E_(i + 1) - E_i \| thin \| F_(i + 1) - F_i \| . $

Apply this first to $dot(q) = l dot(d)$, using the first-difference column of the sample table and $\| l_(i + 1) - l_i \| lt.eq 2.8 delta$. It gives

$ 2.164 cal(R) \( .00092 \) + .1338 e + \( 2.8 delta \) dot.op .01037 \/ 4 < .0016 . $

Since the endpoint values of $dot(q)$ have modulus at most $.1908$ and first differences at most $.0127$, the corresponding error for $dot(q)^2$ is at most

$ \( 2 dot.op .1908 + .0016 \) dot.op .0016 + .0127^2 \/ 4 < .000654 . $

We may therefore apply the product bound to $dot.double(q) = l dot.double(d) + 2 l dot(q)^2$. The resulting error is bounded by

$ & 2.164 cal(R) \( .00421 \) + .415 e + \( 2.8 delta \) dot.op .03670 \/ 4\
 & #h(2em)  + 2 #scale(x: 120%, y: 120%)[\[] 2.164 dot.op .000654 + .1908^2 e + \( 2.8 delta \) \( 2 dot.op .1908 dot.op .0127 \) \/ 4 #scale(x: 120%, y: 120%)[\]] < .0095 \, $

where the first three terms bound the contribution of $l dot.double(d)$, and twice the bracketed expression bounds that of $2 l dot(q)^2$. Combining this error with the sample bound $\| dot.double(q)_i \| lt.eq .508$ gives a chord error $\( .508 + .0095 \) delta^2 \/ 8 < .000042$ for $q$.

For $n_q = dot.double(q) - tanh \( t \) dot(q)$, use the product bound once more. The first and second derivatives of $tanh t$ have modulus at most $1 \, 1$, respectively, so the error is less than

$ .0095 + .0016 + .1908 \/ 12800 + delta dot.op .0127 \/ 4 < .012 . $

For $S_q$, use $S_q = 2 q + tanh \( t \) \( 1 + a_t^(- 2) \) dot(q) - a_t^(- 2) dot.double(q)$. The first and second derivative bounds for $a_t^(- 2)$ are $1 \/ s^2 \, 2 \/ s^2$, and those for $tanh \( t \) \( 1 + a_t^(- 2) \)$ are $1.08 \, 2$. The three terms in this expression therefore have total error at most

$ & 2 dot.op .000042 + \( 1 + 1 \/ s^2 \) dot.op .0016 + .1908 dot.op 2 \/ 12800 + \( 1.08 delta \) dot.op .0127 \/ 4\
 & #h(2em)  + frac(.0095 + .508 dot.op 2 \/ 12800 + delta dot.op .047 \/ 4, s^2) < .003 . $

We have obtained the five errors $.000042 \, .0016 \, .0095 \, .012 \, .003$ for $q \, dot(q) \, dot.double(q) \, n_q \, S_q$.

We can sharpen value errors of $sans(K) \, sans(C)$ to $.238 delta^2 \/ 8 \, .79 delta^2 \/ 8$ using the established derivative bounds.

The expression $U_(*)$ is a convex function of the three arguments $\( - n_(sans(K)) \, dot(sans(K)) \, dot(sans(C)) \)$: its first term is a positive part and the others are positive multiples of squares of linear forms. On the chord joining two sample triples it is thus at most the larger endpoint value, bounded by $.537$. It remains to account for the errors in those three arguments. Put $epsilon.alt_c = cal(R) \( .00222 \)$ and $E_(*) = cal(R) \( .000673 \) + t_c epsilon.alt_c$. The positive-part term changes by at most $1.507 cal(R) \( .00402 \)$; applying $\| a^2 - b^2 \| lt.eq \| a - b \| \( 2 \| b \| + \| a - b \| \)$ to each square gives the following total addition to $.537$:

$ 1.507 cal(R) \( .00402 \) + frac(12 dot.op .80, m_(*)^2) (1.25 E_(*) #scale(x: 120%, y: 120%)[\[] 2 \( .06542 + t_c dot.op .2456 \) + E_(*) #scale(x: 120%, y: 120%)[\]] + 5 t_r^2 epsilon.alt_c \( 2 dot.op .2456 + epsilon.alt_c \)) < .010 . $

Consequently $U_(*) < .547 < .54 r^2 w^2$ on the finite region.

As for the three inequalities sampled together with $U_(*)$, upper absolute errors from the chords are $< .000024 \, .000024 \, .0001$, respectively, using $.238 \/ 12800 < .000019 \, med .79 \/ 12800 < .000062$ for the $sans(K) \, sans(C)$ errors. Hence the margins in that table suffice. These estimates prove the finite-range part of Lemma 27. For the restricted range $t gt.eq 1.4$, the central sample values obey $n_(sans(K)) gt.eq .00315 > cal(R) \( .00402 \)$, so this sign persists between nodes. The condition $x gt.eq 5$ is covered because $s sinh \( 45 \/ 40 \) < 5$.

To interpret the two finite integral sums, let $f_i = \( sans(K)_i \)_(+)$. Convexity of positive part bounds the positive part of a chord of $sans(K)$ by the chord through $f_i$. Add the established value error $.238 \/ 12800$ and integrate against $d x = s cosh t thin d t$. Summation by parts gives precisely the sums in Lemma 29: the endpoint term is $x_i f_i$, and the contribution of the slope $40 \( f_j - f_(j - 1) \)$ on the $j$th cell is $- 40 \( f_j - f_(j - 1) \) \( a_(t_j) - a_(t_(j - 1)) \)$, because $integral x thin d t = s cosh t$. The added constant error contributes $x_i dot.op .238 \/ 12800$. Their upper bounds are therefore valid for the full integrals, not merely for a quadrature at the nodes. It remains to control the infinite tail and the layer inequalities.

=== 9.5 Uniform estimates on the tails <uniform-estimates-on-the-tails>

#thm([Lemma 9.6.])[
  (Tail derivative bounds).  #emph[For $x gt.eq 64$, set $D = x partial_x$, $xi = x^(- 2)$, and $L = log x + 1 / 2 log \( 2 pi \) - 1 / 2$. For each row function $F$, the entries are upper bounds for $\| D^j F \| \/ xi$, uniformly on this range: 
$ & j = 0 & j = 1 & j = 2\
sans(K) - xi \( L - 3 / 2 \) & .0064 & .027 & .11\
d - 1 / 2 & .51 & 1.02 & 2.1\
sans(C) + 1 / 2 & .55 & 1.16 & 2.61 $

 These estimates supply the tail part of the proof of Lemma 27. On $x gt.eq 64$ we also have $q in \[ .255 \, .2556 \]$, $S_q in \[ .509 \, .512 \]$, $V_2 in \[ .999 \, 1.001 \]$.]
] <lem:scalar-tail>

#proof[
  It suffices to work on $x gt.eq 64$: the endpoint of the finite region is $x_144 > 65.8 > 64$, so the two arguments overlap. Put $D = x partial_x \, med xi = x^(- 2) \, med xi_0 = 1 \/ 4096 \, med m = x Y = 1 - xi n$, with
  $ n = integral_0^oo y e^(- y - xi y^2 \/ 2) thin d y \, #h(2em) L = log x + 1 / 2 log \( 2 pi \) - 1 / 2 \, #h(2em) Z = log x + 1 / 2 log \( 2 pi \) - log m - p + p^2 h . $
  Useful exact expressions are
  $ d & = h + xi \( 1 / 2 n^2 - 2 p h n \) + xi^2 n^2 Z \, #h(2em) g = 1 / 4 + 1 / 4 \( 1 - m^2 \) - 1 / 2 xi m^2 Z \,\
sans(K) & = \( h - 1 / 2 \) + xi #scale(x: 120%, y: 120%)[\(] cal(A) + \( m^2 + xi n^2 \) Z #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(A) = 1 / 2 n^2 - 2 p h n - n + 1 / 2 xi n^2 . $
  We prove the three rows by keeping each derivative bound and its prefactor explicit. For a nonnegative numerical vector $V = \( V_j \)_(j = 0)^4$, write
  $ F prec.curly.eq a V quad upright("to mean") quad \| D^j F \( x \) \| lt.eq a \( x \) V_j quad \( 0 lt.eq j lt.eq 4 \, med x gt.eq 64 \) . $
  The prefactor $a$ is a pointwise bound; the notation does not differentiate $a$. If $F prec.curly.eq a A$ and $G prec.curly.eq b B$, the product rule gives $F G prec.curly.eq a b \( A B \)$, where juxtaposition now denotes binomial convolution:
  $ \( A B \)_j = sum_(i = 0)^j binom(j, i) A_i B_(j - i) . $
  Use the numerical vectors $P_j = 2^j$, $I_j = upright(bold(1))_(j = 0)$, and $J_j = upright(bold(1))_(j = 1)$. In particular $xi prec.curly.eq xi P$, since $D xi = - 2 xi$. Thus multiplying a function by $xi$ introduces both that prefactor and a convolution by $P$. All vector inequalities below are componentwise.
  ===== 9.5.1 The bounds for $n$ and $m$. <the-bounds-for-n-and-m.>
  Differentiating the integral for $n$, with $D = - 2 xi partial_xi$, gives $\| n_xi^(\( i \)) \| lt.eq \( 2 i + 1 \) ! \/ 2^i$ and $\| 1 - n \| lt.eq 3 xi$. For $1 lt.eq j lt.eq 4$, expand $\( xi partial_xi \)^j$. After division by $2^j xi$, each resulting bound is at most
  $ 3 + 7 dot.op 30 xi_0 + 6 dot.op 630 xi_0^2 + 22680 xi_0^3 < 3.1 . $
  Consequently $n - 1 prec.curly.eq 3.1 xi P$. Set $N = I + 3.1 xi_0 P$, so $n prec.curly.eq N$. The identity $m - 1 = - xi n$ then gives
  $ m - 1 prec.curly.eq xi P N \, #h(2em) P N lt.eq 1.02 P . $
  With $M = I + 1.02 xi_0 P$, we also have $m prec.curly.eq M$.
  ===== 9.5.2 The logarithmic term. <the-logarithmic-term.>
  The series for $- log m$ is a series in $1 - m$. For a power of order $k$, convolution satisfies $\( P^k \)_j = k^j P_j$. Including the factor $1 \/ k$ from the logarithm and using $j lt.eq 4$, its derivative bounds are therefore controlled by
  $ - log m prec.curly.eq xi dot.op 1.02 P sum_(k gt.eq 1) k^3 \( 1.02 xi_0 \)^(k - 1) . $
  The vector on the right is at most $1.04 xi P$, using $sum_(k gt.eq 1) k^3 z^(k - 1) = \( 1 + 4 z + z^2 \) \/ \( 1 - z \)^4$; the series and its derivatives converge absolutely in this tail.
  The remaining corrections in $Z$ are Gaussian. The product rule applied to $u = phi.alt m \/ x$ gives $\| D^j u \| lt.eq 10^(- 18) xi^2$ for $j lt.eq 4$, using $x^20 e^(- x^2 \/ 2) < 10^(- 200)$. Substitution into the series for $h$ gives
  $ h - 1 / 2 \, quad p h - 1 / 2 \, quad p - 1 prec.curly.eq 10^(- 6) xi^2 P . $
  Since $Z - L = - log m - p + p^2 h + 1 / 2$, these bounds imply $Z - L prec.curly.eq 1.05 xi P$. We also need a bound for $Z$ itself, whose logarithmic growth prevents a uniform absolute bound on the tail. Put $H_0 = 4.59 I + J + 1.05 xi_0 P$. Since $D L = 1$, $D^j L = 0$ for $j gt.eq 2$, and $xi L$ decreases on $x gt.eq 64$, the precise bounds represented by these vectors are
  $ \| D^j n \| lt.eq N_j \, #h(2em) \| D^j m \| lt.eq M_j \, #h(2em) xi \| D^j Z \| lt.eq xi_0 \( H_0 \)_j \, #h(2em) 0 lt.eq j lt.eq 4 . $
  Thus $Z prec.curly.eq \( xi_0 \/ xi \) H_0$. The last prefactor will cancel one power of $xi$ when we bound the exact formulas above.
  ===== 9.5.3 The algebraic corrections. <the-algebraic-corrections.>
  The two corrections needed for $sans(K)$ are $cal(A) + 1.5$ and $m^2 + xi n^2 - 1$. To bound the first, use the identity
  $ cal(A) + 1.5 = 1 / 2 \( n - 1 \) \( n + 1 \) - 2 \( n - 1 \) + 1 / 2 xi n^2 - 2 \( p h - 1 / 2 \) n . $
  For the second, write $m^2 - 1 = \( m - 1 \) \( m + 1 \)$. The product rule then bounds their derivative vectors, after division by $xi$, by the first and second lines below, respectively:
  $ & 1.55 P \( N + I \) + 6.2 P + .5 P N^2 + 2 dot.op 10^(- 6) xi_0 P N med lt.eq med 10 P \,\
 & 1.02 P \( M + I \) + P N^2 med lt.eq med 3.2 P . $
  The comparisons on the right hold through order 4, as follows by expanding $N \, M$ and using $\( P^k \)_j = k^j P_j$. The bound $10 xi P$ also applies to $1 / 2 n^2 - 2 p h n + 1 / 2$. Its expansion replaces $- 2 \( n - 1 \)$ by $- \( n - 1 \)$ and omits $1 / 2 xi n^2$, so the same nonnegative bound suffices.
  ===== 9.5.4 The remainder in $sans(K)$. <the-remainder-in-mathsf-k.>
  Subtract the main term from its exact expression:
  $ sans(K) - xi \( L - 3 / 2 \) = \( h - 1 / 2 \) + xi #scale(x: 120%, y: 120%)[\[] \( cal(A) + 3 / 2 \) + \( Z - L \) + \( m^2 + xi n^2 - 1 \) Z #scale(x: 120%, y: 120%)[\]] . $
  The first two terms inside brackets have combined bound $11.05 xi P$; the last has bound $3.2 xi_0 P H_0$. Multiplication by the outside factor $xi$, followed by $xi lt.eq xi_0$, therefore bounds the derivative vector of this remainder by $xi$ times
  $ xi_0 \( 10^(- 6) P + P \( 11.05 P + 3.2 P H_0 \) \) . $
  Its first three components are at most $\( .0064 \, .027 \, .11 \)$, as in the first table row.
  ===== 9.5.5 The remainder in $d$. <the-remainder-in-d.>
  Isolate $- xi \/ 2$ in the formula for $d - 1 / 2$:
  $ d - 1 / 2 = \( h - 1 / 2 \) - 1 / 2 xi + xi \( 1 / 2 n^2 - 2 p h n + 1 / 2 \) + xi^2 n^2 Z . $
  The four terms give $d - 1 / 2 prec.curly.eq xi E_d$, where
  $ E_d = 1 / 2 P + xi_0 \( 10^(- 6) P + 10 P^2 + P^2 N^2 H_0 \) . $
  The last term uses $xi^2 prec.curly.eq xi^2 P^2$ and $Z prec.curly.eq \( xi_0 \/ xi \) H_0$. The first three components of $E_d$ are at most $\( .51 \, 1.02 \, 2.1 \)$, proving the second row.
  ===== 9.5.6 From $g$ to the remainder in $sans(C)$. <from-g-to-the-remainder-in-mathsf-c.>
  Using $m = 1 - xi n$, rewrite
  $ g - 1 / 4 = 1 / 2 xi n - 1 / 4 xi^2 n^2 - 1 / 2 xi m^2 Z . $
  The product bounds give the absolute estimate $g - 1 / 4 prec.curly.eq xi_0 E_g$, with the constant prefactor $xi_0$, where
  $ xi_0 E_g = xi_0 P \( 1 / 2 N + .25 xi_0 P N^2 + .5 M^2 H_0 \) . $
  This estimate is not in units of the varying $xi$. Now $g'' = xi \( D^2 - D \) g$, so two more $D$-derivatives and one factor $xi$ are required. Explicitly, for $0 lt.eq j lt.eq 2$,
  $ \| D^j g'' \| lt.eq xi xi_0 sum_(i = 0)^j binom(j, i) P_i #scale(x: 120%, y: 120%)[\(] \( E_g \)_(j - i + 2) + \( E_g \)_(j - i + 1) #scale(x: 120%, y: 120%)[\)] . $
  Since $sans(C) + 1 / 2 = - \( d - 1 / 2 \) + 6.5 g''$, its derivative bounds in units of $xi$, through order 2, are
  $ E_d + 6.5 xi_0 P #scale(x: 120%, y: 120%)[\(] \( E_g \)_(j + 1) + \( E_g \)_(j + 2) #scale(x: 120%, y: 120%)[\)]_(j = 0)^2 . $
  Their components are at most $\( .55 \, 1.16 \, 2.61 \)$, proving the third row. This completes the derivative table.
  ===== 9.5.7 Conversion to the real derivative bounds. <conversion-to-the-real-derivative-bounds.>
  The $D$-bounds give the derivatives used in Lemma 27 through
  $ dot(F) = \( a_t \/ x \) D F \, #h(2em) n_F = \( a_t \/ x \)^2 \( D^2 - D \) F \, #h(2em) dot.double(F) = n_F + D F \, #h(2em) a_t \/ x lt.eq 1.002 . $
  In particular, $\( D^2 - D \) \( xi \( L - 1.5 \) \) = xi \( 6 \( L - 1.5 \) - 5 \)$. The first row of the table therefore gives
  $ \( D^2 - D \) sans(K) gt.eq xi #scale(x: 120%, y: 120%)[\(] 6 \( L - 1.5 \) - 5 - .11 - .027 #scale(x: 120%, y: 120%)[\)] > 0 \, $
  because $L gt.eq L \( 64 \) > 4.5$. Hence $n_(sans(K)) > 0$. For upper bounds, use $L \( 64 \) < 4.59$ and the fact that $xi \( L - 1.5 \)$ and $xi \( 2 L - 4 \)$ decrease on this tail. The table and the conversion formulas give
  $ 0 & lt.eq sans(K) lt.eq xi_0 \( 4.59 - 1.5 + .0064 \) \, quad \| dot(sans(K)) \| lt.eq 1.002 xi_0 \( 2 dot.op 4.59 - 4 + .027 \) \, quad \| dot.double(sans(K)) \| < .02 \,\
\| sans(C) + .5 \| & lt.eq .55 xi_0 \, quad \| dot(sans(C)) \| lt.eq 1.002 dot.op 1.16 xi_0 \, quad \| n_(sans(C)) \| \, med \| dot.double(sans(C)) \| < .002 . $
  These imply the global and restricted derivative bounds for $sans(K) \, sans(C)$ on the tail.
  ===== 9.5.8 The $q$ and layer-profile ranges. <the-q-and-layer-profile-ranges.>
  The second row of the table first gives
  $ ell^2 = b - r^2 - d gt.eq .0536 - .51 xi_0 > .231^2 . $
  This tail bound on the radicand is independent of the estimates for $q$, and permits division by $ell$ in its derivative formulas. Substitution of the value and derivative bounds for $d$ gives
  $ k - sqrt(.0536 + .51 xi_0) lt.eq q lt.eq k - sqrt(.0536 - .51 xi_0) \, #h(2em) \| dot(q) \| < .00055 \, quad \| n_q \| < .0017 . $
  Thus $q in \[ .255 \, .2556 \]$. The identity $S_q = 2 q + tanh \( t \) dot(q) - a_t^(- 2) n_q$ then yields $S_q in \[ .509 \, .512 \]$. The bounds for $dot(q) \, n_q$ also give the required bound for $dot.double(q) = n_q + tanh \( t \) dot(q)$.
  For the two derivatives of $v$, the integral for $n$ gives $1 - 3 xi lt.eq n lt.eq 1$, while $m = 1 - xi n$ gives $1 - xi lt.eq m lt.eq 1$. Consequently
  $ V_2 = 2 - \( phi.alt \/ p \) \( x + phi.alt \/ p \) - n \/ m^2 in \[ .999 \, 1.001 \] \, #h(2em) R_v = phi.alt \/ p - n \/ \( x m \) . $
  The Gaussian term in $V_2$ is smaller than $.0001$. The same Gaussian estimate and $m gt.eq 1 - xi_0$ bound $\| R_v \|$ by $.319$, as required.
  ===== 9.5.9 The covariance inequalities and $U_(*)$. <the-covariance-inequalities-and-u_.>
  The value estimates just obtained imply $0 lt.eq sans(K) lt.eq .0008$ and $- .501 lt.eq sans(C) lt.eq - .499$. Inserting these intervals in $lambda t_plus.minus^2 + t_plus.minus sans(C) + sans(K)$ gives the lower bound $.010$ for $t_(-)$ and the upper bound $- .027$ for $t_(+)$. For the third covariance inequality, the same intervals give
  $ 2 \( - .37 \) sans(C) - .37^2 - 4 lambda sans(K) gt.eq .74 dot.op .499 - .37^2 - 2.6 dot.op .0008 > m_(*)^2 . $
  Finally $n_(sans(K)) > 0$ removes the positive-part term in $U_(*)$. Using $\| dot(sans(K)) \| < .002$ and $\| dot(sans(C)) \| < .001$ in its two squares gives $U_(*) < .001$.
  ===== 9.5.10 The positive-part integral. <the-positive-part-integral.>
  The first table row and $log sqrt(2 pi) - 2 + .0064 < 0$ give $sans(K) lt.eq \( log x \) x^(- 2)$. Hence
  $ integral_(x_144)^oo sans(K)_(+) lt.eq integral_64^oo frac(log x, x^2) thin d x = frac(log 64 + 1, 64) < .086 . $
  Combining this with the finite upper bound $.335$ gives a total less than $.422$. All derivatives needed in the finite argument are also bounded by the displayed tail estimates. Reflection completes the proof of Lemma 27. ◻
]

For every integer $j gt.eq 0$ and $x gt.eq 1$, differentiating the Laplace integral gives

$ Y^(\( j \)) \( x \) = \( - 1 \)^j integral_0^oo y^j e^(- x y - y^2 \/ 2) thin d y \, #h(2em) \| Y^(\( j \)) \( x \) \| lt.eq j ! x^(- j - 1) . $

Together with $Y \( x \) asymp x^(- 1)$ on this half-line, the stable formulas, reflection, and the uniform lower bound for the radicand show that $d \, g \, v \, sans(K) \, sans(C) \, pi \, q$ are smooth and have derivatives of at most polynomial growth. These global growth assertions concern the profiles, not the temporary factors $X \, Y$ separately.

=== 9.6 The pointwise layer inequalities <the-pointwise-layer-inequalities>

#proof[
  We apply the real bounds separately to $t_x = "arsinh" \( x \/ s \)$ and $t_z = "arsinh" \( z \/ s \)$. The following table encloses the values of the even profiles $q \, S_q \, V_2 \, rho$, not merely their samples. Each row specifies an interval of $\| t \|$ in units of $1 \/ 40$, and every displayed bound is multiplied by 1000.
  For $q \, S_q \, V_2$, take the sample minima and maxima on each closed row through index $144$, and enlarge by the errors $.000042 \, .003 \, .00101$, respectively. The last row also includes the tail bounds of Lemma 32. For $rho$, the exact formula makes an endpoint bound possible. Put $y = tanh^2 t$ and $v_1 = \( 1 - y \) \/ s^2$. Differentiating gives
  $ frac(d, d y) frac(rho^2, r^2 w^2) = \( 1 + v_1 \)^2 - frac(2 \( 2 + w^2 v_1 \), s^2) - frac(2 y \( 1 + v_1 \), s^2) gt.eq 1 - 6 / s^2 - frac(2 \( w^2 + 1 \), s^4) > .27 . $
  Here $0 lt.eq y lt.eq 1$ and $0 lt.eq v_1 lt.eq 1 \/ s^2$. Thus $rho$ increases for $t gt.eq 0$, giving its upper endpoint bound in each row, including the limiting bound in the last row.
  $ & q_min & q_max & S_(q \, min) & S_(q \, max) & V_(2 \, min) & V_(2 \, max) & rho_max\
0 : 4 & 77 & 81 & 113 & 132 & 725 & 743 & 804\
4 : 8 & 80 & 88 & 125 & 166 & 740 & 785 & 814\
8 : 12 & 87 & 100 & 159 & 220 & 782 & 848 & 831\
12 : 16 & 99 & 116 & 213 & 288 & 845 & 920 & 853\
16 : 20 & 115 & 134 & 281 & 359 & 917 & 986 & 877\
20 : 28 & 133 & 171 & 352 & 464 & 983 & 1055 & 927\
28 : 40 & 170 & 211 & 457 & 504 & 1041 & 1059 & 992\
40 : 68 & 210 & 245 & 497 & 513 & 1009 & 1044 & 1072\
68 + & 244 & 256 & 506 & 514 & 999 & 1012 & 1104 $
  In particular, the table proves $.113 lt.eq S_q lt.eq .514$ and $rho lt.eq 1.104$. Number its rows from 1 to 9, and write $q_i^plus.minus \, S_i^plus.minus \, V_i^plus.minus \, rho_i^(+)$ for their endpoints after division by 1000. Let $i_x \, i_z$ be the rows containing $\| t_x \| \, \| t_z \|$; these two row choices are independent.
  We first enclose $H$ on this pair of rows. Its scalar part $4 c + 4 k q + 2 \( k - q \) S$ increases in both $q$ and $S$, because its partial derivatives are $4 k - 2 S > 0$ and $2 \( k - q \) > 0$. The inequalities $q < k$ and $S_q < 2 k$ used here follow from the table. Also $\| pi \( x \) \| = r$, so $\| 2 S_pi \( z \) dot.op pi \( x \) \| lt.eq 2 r rho_(i_z)^(+)$. Consequently $H in \[ H_(-) \, H_(+) \]$, where
  $ H_(-) & = 4 c + 4 k q_(i_x)^(-) + 2 \( k - q_(i_x)^(-) \) S_(i_z)^(-) - 2 r rho_(i_z)^(+) \,\
H_(+) & = 4 c + 4 k q_(i_x)^(+) + 2 \( k - q_(i_x)^(+) \) S_(i_z)^(+) + 2 r rho_(i_z)^(+) . $
  At the same time $V_2 \( x \) in \[ V_(i_x)^(-) \, V_(i_x)^(+) \]$.
  To verify the first layer inequality, subtract its right side from its left side and use $J = H + V_2 \( x \) - 2 kappa$. Since $S_q \( x \) \, S_q \( z \)$ are positive, replacing their product by $S_(i_x)^(+) S_(i_z)^(+)$ gives the lower bound
  $ cal(D)_(i_x \, i_z) \( H \, V \) =  & H + t_c \( H + V - 2 kappa \) - (frac(t_r, 2 h_s) + 1 / alpha) \( H + V - 2 kappa \)^2\
 & - 2 \( b + eta + \( b + eta - kappa \) t_(-) \) - 2 b_m S_(i_z)^(+) S_(i_x)^(+) - 2 e_0 \( 2 t_r \)^2 - frac(t_r h_s, 2) . $
  This is a concave function of the two coordinates $H \, V$. Every point of $\[ H_(-) \, H_(+) \] times \[ V_(i_x)^(-) \, V_(i_x)^(+) \]$ is a convex combination of its four vertices, so its value is at least the smallest vertex value. There are $9 dot.op 9 = 81$ pairs of rows and four vertex evaluations for each pair. The resulting lower bounds, multiplied by 1000 and minimized over all rows of $x$, are
  $ 11 \, med 14 \, med 33 \, med 64 \, med 63 \, med 39 \, med 54 \, med 45 \, med 40 $
  in the order of the rows of $z$. Each is positive, proving the strict inequality on every rectangle.
  For the last inequality in the lemma, $4 c + 2 k \( S_q \( x \) + S_q \( z \) \) - S_q \( x \) S_q \( z \)$ increases in each $S_q$ argument, again because the other argument is less than $2 k$. The vector product is at most $rho \( x \) rho \( z \) lt.eq 1.104^2$. Thus its left side is bounded below by
  $ 4 c + 4 k dot.op .113 - .113^2 - 1.104^2 > .25 . $
  Finally the auxiliary estimates follow directly from rational arithmetic and the logarithm enclosure in Lemma 29:
  $ b + eta + kappa t_(-) + .125 > 0 \, #h(2em) frac(1.053 kappa^2, 8 \( b + eta + kappa t_(-) + .125 \)) < .256 \, #h(2em) .256 + frac(\( log 2 + .25 \) 2.26, 4) < .80 . $
  All rectangle margins are strictly positive. This proves the pointwise assertions for every pair of real arguments and completes the scalar estimates. ◻
]

== 10 A strict segment inequality <sec:08-segments>

We use the constants and profiles of Appendix 9. In particular, all finite decimals below are exact rationals. For an interval $\[ x_(-) \, x_(+) \]$, a bar denotes its uniform average in the physical coordinate $x$; endpoint subscripts are evaluations, not derivatives. The coordinate $t = "arsinh" \( x \/ s \)$ and the notation $n_F = dot.double(F) - tanh \( t \) dot(F) = \( s cosh t \)^2 F'' \( x \)$ are as in that Section. When a profile is written below with a $t$-coordinate argument, it means its composition with $x = s sinh t$; for example $sans(K) \( t \)$ means $sans(K) \( s sinh t \)$. A subscript $+$ or $-$ still denotes its value at the corresponding physical endpoint $x_(+)$ or $x_(-)$. Proposition 33 proves the segment estimate used in the matrix argument.

#thm([Proposition 10.1.])[
  (Strict segment inequality).  #emph[Put $u = \( pi \, q \)$. For every pair $x_(-) < x_(+)$, define $e_K$ and $Gamma$ as below. Then 
$ e_K & + Gamma + frac(sum_(sigma in { - \, + }) \( overline(sans(C)) - sans(C)_(- sigma) - overline(\| u - u_sigma \|^2) \)^2, 8 lambda) + t_(+) thin 1 / 2 sum_(sigma in { - \, + }) \| overline(u) - u_sigma \|^2 < overline(\| u \|^2) - \| overline(u) \|^2 \,\
e_K & = overline(sans(K)) - \( sans(K)_(+) + sans(K)_(-) \) \/ 2 \,\
Gamma & = .80 / m_(*)^2 (1.25 \( sans(K)_(+) - sans(K)_(-) + t_c \( sans(C)_(+) - sans(C)_(-) \) \)^2 + 5 t_r^2 \( sans(C)_(+) - sans(C)_(-) \)^2) \, $

 where $- sigma$ denotes the opposite endpoint. At coincident endpoints, both sides of the asserted inequality are zero.]
] <prop:segment-estimate>

=== 10.1 Coordinates and reduction to scalar budgets <subsec:segments-reduction>

We prove Proposition 33 by separating intervals according to their width and location in the $t$ coordinate. Write the endpoint coordinates as

$ l = m - h \, #h(2em) y = m + h \, #h(2em) h > 0 . $

Here $m$ is a scalar midpoint, unrelated to the ambient dimension. The profiles $sans(K) \, sans(C) \, q$ are even, while reflection applies the fixed orthogonal map $\( u_1 \, u_2 \, u_3 \) mapsto \( u_1 \, - u_2 \, u_3 \)$ to $u$. It exchanges the endpoints and preserves every average and squared quantity in Proposition 33. We may therefore assume $m gt.eq 0$, so that $y gt.eq \| l \|$.

The estimates below cover the endpoint pairs in the following order. This division leaves the final coverage check, including all shared boundaries, to the end of the proof.

$ 0 < h lt.eq .16 & upright("short widths, Subsection ") upright("10.2") \,\
h gt.eq .16 upright(" and a tail case") & upright("Subsection ") upright("10.3") \,\
\| l \| lt.eq 1.4 \, med y lt.eq 3.6 \, med .16 lt.eq h lt.eq .54 & upright("middle widths, Subsection ") upright("10.5") \,\
\| l \| lt.eq 1.4 \, med y lt.eq 3.6 \, med h gt.eq .54 & upright("larger widths, Subsection ") upright("10.6") . $

The tail cases mean $l lt.eq - 1.4$, $l gt.eq 1.4$, or $\| l \| < 1.4$ with $y gt.eq 3.6$. The remaining bounded region uses the auxiliary estimates in Subsection 10.4.

Since $d x = s cosh \( t \) thin d t$, the normalized averaging density on $\[ l \, y \]$ is

$ frac(cosh t, 2 cosh m sinh h) . $

Identifying the two circle coordinates with a complex number and integrating $r e^(i w t) cosh t$ gives the mean $r e^(i w m) \( A_h + i B_h tanh m \)$, where

$ A_h = frac(cos \( w h \) + w coth h sin \( w h \), 1 + w^2) \, #h(2em) B_h = frac(coth h sin \( w h \) - w cos \( w h \), 1 + w^2) . $

Put

$ f_0^(*) & = frac(r^2, 1 + w^2) (w^2 - frac(sin^2 \( w h \), sinh^2 h)) \, & p_a & = 2 r^2 \( 1 - A_h cos \( w h \) \) \, & p_d & = - 2 r^2 B_h tanh m sin \( w h \) \,\
b_sigma & = overline(\( q - q_sigma \)^2) \, & b_a & = \( b_(+) + b_(-) \) \/ 2 \, & b_d & = \( b_(+) - b_(-) \) \/ 2 \,\
 &  & c_a & = overline(sans(C)) - \( sans(C)_(+) + sans(C)_(-) \) \/ 2 \, & c_d & = \( sans(C)_(+) - sans(C)_(-) \) \/ 2 . $

The elementary identity

$ A_h^2 + B_h^2 = frac(1 + sin^2 \( w h \) \/ sinh^2 h, 1 + w^2) $

shows that $f_0^(*) = r^2 \( 1 - A_h^2 - B_h^2 \)$ lower bounds the variance of the circle coordinates. It is strictly positive for $h > 0$, because $\| sin \( w h \) \| lt.eq w h < w sinh h$. Taking scalar products with the two endpoint vectors also gives $overline(\| pi - pi_plus.minus \|^2) = p_a plus.minus p_d$. Consequently

$ overline(sans(C)) - sans(C)_minus.plus - overline(\| u - u_plus.minus \|^2) = \( c_a - p_a - b_a \) plus.minus \( c_d - p_d - b_d \) \, #h(2em) 1 / 2 sum_sigma \| macron(u) - u_sigma \|^2 = p_a + b_a - \( overline(\| u \|^2) - \| macron(u) \|^2 \) . $

Let $V_u = overline(\| u \|^2) - \| macron(u) \|^2$ and $V_q = overline(q^2) - macron(q)^2$. The two preceding identities turn the inequality of Proposition 33 into the assertion that its squared terms plus $e_K + Gamma + t_(+) \( p_a + b_a \)$ are less than $\( 1 + t_(+) \) V_u$. Because $V_u gt.eq f_0^(*) + V_q$ and $1 + t_(+) > 0$, it will usually suffice to prove

#[#set math.equation(numbering: n => "(s0)")
 $ e_K + Gamma + frac(\( c_a - p_a - b_a \)^2 + \( c_d - p_d - b_d \)^2, 4 lambda) + t_(+) \( p_a + b_a \) < \( 1 + t_(+) \) f_0^(*) . $ <eq:s0>]

#thm([Lemma 10.2.])[
  (Chord kernel).  #emph[For every twice continuously differentiable profile $F$ on the segment, let $t = m + h beta$ and 
$ theta = frac(sinh t - sinh \( m - h \), 2 cosh m sinh h) \, #h(2em) S = frac(sinh h, h) \, #h(2em) g_h = 3 / 4 S \( 1 + cosh h \) . $

 Then 
$ overline(F) - \( F_(-) + F_(+) \) \/ 2 = - h^2 / 3 integral_(- 1)^1 W \( beta \) thin n_F \( m + h beta \) thin frac(d beta, 2) \, #h(2em) W = 6 theta \( 1 - theta \) frac(cosh m, cosh t) frac(sinh h, h) \, $

 where $n_F$ is evaluated at $x = s sinh \( m + h beta \)$. Moreover, 
$ 0 lt.eq W lt.eq 3 / 2 S \, #h(2em) W lt.eq g_h \( 1 - beta^2 \) \, #h(2em) integral_(- 1)^1 W thin frac(d beta, 2) lt.eq S / 2 \( 1 + cosh h \) . $

]
] <lem:segment-chord>

#proof[
  The uniform trapezoidal error in the $x$ coordinate is $- \( x_(+) - x_(-) \)^2 integral_0^1 theta \( 1 - theta \) F'' \( x_(-) + theta \( x_(+) - x_(-) \) \) thin d theta \/ 2$. Substitute $x_(+) - x_(-) = 2 s cosh m sinh h$ and $d theta = h cosh t thin d beta \/ \( 2 cosh m sinh h \)$ to obtain the stated identity. For the first upper bound on $W$, rearranging its definition reduces the claim to $\( sinh t - sinh m cosh h \)^2 gt.eq cosh m \( cosh m - cosh t \) sinh^2 h$. To check this inequality, regard $m \, t$ as fixed and put $zeta = cosh h - 1 gt.eq 0$. The difference of its two sides is
  $ \( sinh t - sinh m \)^2 + 2 \( cosh \( m - t \) - 1 \) zeta + \( cosh t cosh m - 1 \) zeta^2 . $
  Every coefficient is nonnegative. This proves $W lt.eq 3 S \/ 2$.
  The sharper bound near the endpoints comes from factoring the two differences of hyperbolic sines in $theta \( 1 - theta \)$. With $u_plus.minus = \( 1 plus.minus beta \) \/ 2$, the factorization gives
  $ theta \( 1 - theta \) frac(cosh m, cosh t) = frac(sinh \( u_(+) h \) sinh \( u_(-) h \), sinh^2 h) frac(cosh \( 2 m + beta h \) + cosh h, cosh \( 2 m + beta h \) + cosh \( beta h \)) . $
  Since $0 lt.eq u_plus.minus lt.eq 1$, convexity gives $sinh \( u_plus.minus h \) lt.eq u_plus.minus sinh h$. Thus the product on the left is bounded by
  $ frac(1 - beta^2, 4) frac(cosh \( 2 m + beta h \) + cosh h, cosh \( 2 m + beta h \) + cosh \( beta h \)) $
  The quotient in this display is at most $\( 1 + cosh h \) \/ 2$: subtract one and use $cosh \( 2 m + beta h \) + cosh \( beta h \) gt.eq 2$. This proves the pointwise bound involving $g_h$. Its integral uses $integral_(- 1)^1 \( 1 - beta^2 \) thin d beta \/ 2 = 2 \/ 3$ and gives $integral W thin d beta \/ 2 lt.eq S \( 1 + \( cosh h - 1 \) \/ 2 \)$, as required. ◻
]

=== 10.2 Short widths <subsec:segments-short>

Suppose $h lt.eq .16$. Lemma 34 bounds $W$ by $1.507$ and its integral by $1.012$. Put $G = r^2 w^2$ and $u_0 = G h^2 \/ 3$, the scale of the circle variance on a short interval. By the chord identity and Cauchy–Schwarz applied to the endpoint derivative integrals, the joint bound $U_(*)$ in Lemma 27 gives

$ e_K + Gamma lt.eq h^2 / 3 integral_(- 1)^1 U_(*) \( m + h beta \) thin frac(d beta, 2) lt.eq .54 u_0 . $

The coefficient $12 dot.op .80 \/ m_(*)^2$ in $U_(*)$ arises from $\( F_(+) - F_(-) \)^2 lt.eq 4 h^2 integral_(- 1)^1 dot(F) \( m + h beta \)^2 thin d beta \/ 2$. The other terms obey

$ f_0^(*) \/ u_0 gt.eq \( 1 - 2 w^4 h^2 \/ \( 15 \( 1 + w^2 \) \) \) \/ \( 1 + h^2 \/ 3 \) \, & \| p_d \| lt.eq 2 h u_0 \,\
p_a \/ u_0 lt.eq 4 + .15 h^2 \, & b_a \/ u_0 lt.eq \( .193 \)^2 \( 4 + .15 h^2 \) \/ G \,\
\| c_a \| \/ u_0 lt.eq .79 dot.op 1.012 \/ G \, & \| c_d \| lt.eq .247 h \, quad \| b_d \| lt.eq 2 \( .193 \) h dot.op .53 dot.op 1.012 h^2 \/ 3 . $

We justify the table by separating the angular estimates from the endpoint and chord errors. For the lower bound on $f_0^(*)$, substitute $sinh^2 h gt.eq h^2 + h^4 \/ 3$ and $sin^2 y lt.eq y^2 - y^4 \/ 3 + 2 y^6 \/ 45$, valid for $\| y \| lt.eq 2$, in its defining formula. For the angular half-difference, write the numerator of $B_h$ as $\( sin \( w h \) - w h cos \( w h \) \) \/ h + \( coth h - 1 \/ h \) sin \( w h \)$. The estimates $\| sin y - y cos y \| lt.eq \| y \|^3 \/ 3$ and $0 lt.eq coth h - 1 \/ h lt.eq h \/ 3$ give $\| B_h \| lt.eq w h^2 \/ 3$, hence $\| p_d \| lt.eq 2 h u_0$. The latter hyperbolic bound follows by comparing the coefficients of $h cosh h$ and $\( 1 + h^2 \/ 3 \) sinh h$.

For the endpoint distances, the derivatives are taken in $t$, but the expectation is still uniform in physical length. Odd terms cancel in the second moment of $beta = \( t - m \) \/ h$, so

$ overline(beta^2) = frac(integral_(- 1)^1 beta^2 cosh \( h beta \) thin d beta \/ 2, S) lt.eq frac(1 \/ 3 + h^2 \/ 10 + h^4 cosh h \/ 168, 1 + h^2 \/ 6) lt.eq 1 / 3 + .05 h^2 #h(2em) \( h lt.eq .54 \) . $

The first inequality uses the first three even terms and their Taylor remainder. For the last, $cosh h lt.eq \( 1 - h^2 \/ 2 \)^(- 1) < 7 \/ 5$ on this range, and cross-multiplication gives the stated bound. If a profile has $t$-derivative norm at most $L$, then the half-sum of its squared distances to the two endpoint values is bounded, after averaging, by $L^2 h^2 \( 1 + overline(beta^2) \)$. Apply this with $L = r w$ for the circle and $L = .193$ for $q$. Division by $u_0$ gives the bounds on $p_a$ and $b_a$, including their factor $4$.

For the $sans(C)$ terms, the chord identity gives $\| c_a \| lt.eq .79 dot.op 1.012 h^2 \/ 3$, and integration of $\| dot(sans(C)) \| lt.eq .247$ gives $\| c_d \| lt.eq .247 h$. Finally, $\| b_d \| = \| q_(+) - q_(-) \| thin \| macron(q) - \( q_(+) + q_(-) \) \/ 2 \|$. The derivative bound controls the first factor by $2 \( .193 \) h$; the chord identity controls the second by $.53 dot.op 1.012 h^2 \/ 3$. These give the last entries of the table.

It remains to compare these costs with the right side of Equation (s0). Subtract the two squared terms and the $t_(+)$ term from that right side, then divide by $u_0$. The preceding bounds give the following lower bound, with $H = .16$, $P = 4 + .15 H^2$, and $Q = .193^2 P \/ G$:

$ & \( 1 + t_(+) \) frac(1 - 2 w^4 H^2 \/ \( 15 \( 1 + w^2 \) \), 1 + H^2 \/ 3) - t_(+) \( P + Q \)\
 & quad - frac(1, 4 lambda) #scale(x: 180%, y: 180%)[\[] frac(G H^2, 3) \( P + Q + .79 dot.op 1.012 \/ G \)^2\
 & #h(94.6451pt)  + 3 / G #scale(x: 120%, y: 120%)[\(] .247 + 2 / 3 \( G + .193 dot.op .53 dot.op 1.012 \) H^2 #scale(x: 120%, y: 120%)[\)]^2 #scale(x: 180%, y: 180%)[\]] . $

The displayed rational lower bound is greater than $.55510$, hence greater than $.55$. It exceeds the normalized cost $.54$, proving Equation (s0) throughout this short-width range.

=== 10.3 Segments with endpoints in the tails <subsec:segments-tails>

We next handle all segments with $h gt.eq .16$ that leave the central region. All profile ranges and positive-part integral bounds in this subsection come from Lemmas 27 and 32.

===== 10.3.1 A central endpoint and a distant endpoint. <a-central-endpoint-and-a-distant-endpoint.>

If $\| m - h \| < 1.4 \, med m + h gt.eq 3.6$, then $h gt.eq 1.1$ and we can use

$ f_0^(*) gt.eq .0449 \, quad .0818 lt.eq p_a lt.eq .1074 \, quad \| p_d \| lt.eq .0132 . $

===== 10.3.2 Endpoints in opposite tails. <endpoints-in-opposite-tails.>

If $m - h lt.eq - 1.4$, then $h gt.eq 1.4 \, med m + h gt.eq 1.4$, and bounds here are

$ f_0^(*) gt.eq .0456 \, quad .0830 lt.eq p_a lt.eq .1062 \, quad \| p_d \| lt.eq .0129 . $

These angular bounds follow by diagonalizing the two elementary quadratic forms in $cos \( w h \)$ and $sin \( w h \)$:

$ frac(1 - sqrt(1 + w^2 coth^2 h), 2 \( 1 + w^2 \)) & lt.eq A_h cos \( w h \) lt.eq frac(1 + sqrt(1 + w^2 coth^2 h), 2 \( 1 + w^2 \)) \,\
\| B_h sin \( w h \) \| & lt.eq frac(coth h + sqrt(coth^2 h + w^2), 2 \( 1 + w^2 \)) . $

Here $sinh h > 1.335 \, 1.904$ and $coth h < 1.25 \, 1.13$ in the two cases, respectively. The positive-term series for $sinh h$ and $exp \( 2 h \)$ give these bounds.

In the central/distant case, the physical endpoints satisfy $x_(+) > 65.8$ and $\| x_(-) \| < 6.86$. If the segment contains zero, its length is at least $65.8$. The integral of $\( sans(K) \)_(+)$ over its positive part is at most $.422$, and over its negative part at most $.126$. If the segment does not contain zero, its length is at least $65.8 - 6.86$ and the integral is at most $.422$. Therefore

$ overline(sans(K)) lt.eq max {frac(.422 + .126, 65.8) \, frac(.422, 65.8 - 6.86)} < .0084 . $

For $b_(+)$, separate the physical set $\| x \| < 5$ from its complement. Its probability is at most $10 \/ \( 65.8 - 6.86 \)$ under the uniform segment measure. The far endpoint has $q_(+) in \[ .255 \, .2556 \]$ by Lemma 32, since $x_(+) > 64$. Globally $q in \[ .0775 \, .2559 \]$, and on the complement $q in \[ .2203 \, .2559 \]$. Consequently

$ b_(+) lt.eq frac(10, 65.8 - 6.86) \( .1781 \)^2 + (1 - frac(10, 65.8 - 6.86)) \( .0353 \)^2 < .0068 . $

The global oscillation also gives $b_(-) lt.eq .1784^2 < .032$. The one-variable $sans(C)$ ranges give $c_a in \[ - .081 \, .160 \]$ and $\| c_d \| lt.eq .080$.

In the opposite-tail case, both endpoints have $\| t \| gt.eq 1.4$. Use the global bound $overline(sans(K)) lt.eq .0275$ and $b_plus.minus lt.eq .1784^2 < .032$. The endpoint $sans(C)$ range is now $\[ - .501 \, - .495 \]$, giving $- .006 lt.eq c_a lt.eq .160$ and $\| c_d \| lt.eq .003$.

For clarity, to bound $e_K + Gamma$ in these cases take intervals $cal(I)_(-) \, cal(I)_(+)$ for $sans(K)_(-) \, sans(K)_(+)$ and $o = \| sans(C)_(+) - sans(C)_(-) \|_max$, from the one-variable bounds:

$ & cal(I)_(-) & cal(I)_(+) & o & overline(sans(K))_max & upright("upper bound on ") e_K + Gamma\
upright("central/distant") & \[ - .007 \, .0275 \] & \[ 0 \, .0008 \] & .160 & .0084 & .0144\
upright("opposite tails") & \[ - .0001 \, .0191 \] & \[ - .0001 \, .0191 \] & .006 & .0275 & .0277 $

After replacing $\| sans(C)_(+) - sans(C)_(-) \|$ by $o$, the expression to maximize is convex in the two $sans(K)$ endpoint values. Its maximum on the rectangle therefore occurs at a vertex. Add to $overline(sans(K))_max$ the maximum, over pairs of endpoints $z_plus.minus$ of these intervals, of $- \( z_(+) + z_(-) \) \/ 2 + .80 \[ 1.25 \( \| z_(+) - z_(-) \| + t_c o \)^2 + 5 t_r^2 o^2 \] \/ m_(*)^2$. This gives the last column of the table.

For the other costs in Equation (s0), $\| b_d \| lt.eq .016$ in both cases. The central/distant bounds give $b_a lt.eq .0194$, $\| c_a - p_a - b_a \| lt.eq .2078$, and $\| c_d - p_d - b_d \| lt.eq .1092$. Thus the remaining budget is at least

$ 1.064 \( .0449 \) - frac(.2078^2 + .1092^2, 2.6) - .064 \( .1074 + .0194 \) > .018 > .0144 . $

For opposite tails, the corresponding bounds are $b_a lt.eq .032$, $\| c_a - p_a - b_a \| lt.eq .1442$, and $\| c_d - p_d - b_d \| lt.eq .0319$. They give

$ 1.064 \( .0456 \) - frac(.1442^2 + .0319^2, 2.6) - .064 \( .1062 + .032 \) > .031 > .0277 . $

In each case the remaining budget exceeds the bound on $e_K + Gamma$.

===== 10.3.3 Both endpoints in the positive tail. <both-endpoints-in-the-positive-tail.>

If $m - h gt.eq 1.4$ and $h gt.eq .16$, then $e_K lt.eq 0$ by convexity, and

$ Gamma \/ f_0^(*) lt.eq .10 \, #h(2em) p_a + \| p_d \| lt.eq min \( .150 \, thin 6.65 f_0^(*) \) \, #h(2em) f_0^(*) gt.eq .008 . $

To bound $Gamma \/ f_0^(*)$, first suppose $h lt.eq .4$. The short-width lower bound on $f_0^(*) \/ u_0$ remains valid up to $w h = 2$, and gives $f_0^(*) \/ h^2 > .18$ here. Combine it with the derivative bounds on the endpoint differences in $Gamma$. For $h gt.eq .4$, instead use $f_0^(*) gt.eq .0332$, following from $sinh \( .4 \) > .410$, and the value ranges of the endpoint profiles. Both estimates give $Gamma \/ f_0^(*) lt.eq .10$.

For the circle endpoint distance, when $h lt.eq .3$ the short-width estimates give $p_a + \| p_d \| lt.eq \( 4 + .15 h^2 + 2 h \) u_0$. Together with the same variance lower bound this gives both asserted upper bounds on $p_a + \| p_d \|$. For $h gt.eq .3$, use the angular quadratic-form bounds with $coth \( .3 \) < 3.434$ to obtain $.150$. The variance bound $f_0^(*) gt.eq .02256$, from $sinh \( .3 \) > .304$, then gives $.150 < 6.65 f_0^(*)$. On the remaining range $\[ .16 \, .3 \]$, the functions $sin \( w h \) \/ h$ and $h \/ sinh h$ are positive decreasing. Thus $f_0^(*)$ is increasing, and its lower bound at $.16$ gives $f_0^(*) gt.eq .008$ throughout.

All points of this segment lie in the positive tail. The profile ranges therefore give $\| overline(sans(C)) - sans(C)_plus.minus \| lt.eq .006$ and $b_plus.minus lt.eq .00045$. The sum of the two squares in Equation (s0) is the mean, over endpoint labels $sigma$, of $\( overline(sans(C)) - sans(C)_(- sigma) - overline(\| u - u_sigma \|^2) \)^2$. Each circle contribution is bounded both by $.150$ and by $6.65 f_0^(*)$, hence by $sqrt(.150 dot.op 6.65 f_0^(*))$. After division by $f_0^(*)$, the whole left side of Equation (s0) is therefore at most

$ .10 + frac(1, 4 lambda) (sqrt(.150 dot.op 6.65) + .00645 / sqrt(.008))^2 + t_(+) \( 6.65 + .00045 \/ .008 \) < 1 + t_(+) . $

=== 10.4 Auxiliary estimates in the bounded region <subsec:segments-auxiliary>

The preceding cases leave $h gt.eq .16$, $l = m - h in \[ - 1.4 \, 1.4 \]$, $y = m + h lt.eq 3.6$, with $m gt.eq 0$ and $y gt.eq \| l \|$. For middle widths with $l gt.eq 0$, retaining the $q$ variance will offset part of the endpoint-distance cost $b_a$. We therefore use the sufficient inequality

#[#set math.equation(numbering: n => "(sv)")
 $ e_K + Gamma + #scale(x: 120%, y: 120%)[\[] \( c_a - p_a - b_a \)^2 + \( c_d - p_d - b_d \)^2 #scale(x: 120%, y: 120%)[\]] \/ \( 4 lambda \) + t_(+) \( p_a + b_a \) < \( 1 + t_(+) \) \( f_0^(*) + V_q \) . $ <eq:sv>]

Indeed the squared deviations of the mean at the endpoints average to $p_a + b_a - \( overline(\| u \|^2) - \| macron(u) \|^2 \)$.

Put

$ sans(D) = sans(K) + t_c sans(C) \, #h(2em) d_(*)^K = frac(.80 dot.op 1.25, m_(*)^2) \, #h(2em) d_(*)^C = frac(.80 dot.op 5 t_r^2, m_(*)^2) \,\
T_0 = .54 \, #h(2em) S = frac(sinh h, h) \, #h(2em) g_h = 3 / 4 S \( 1 + cosh h \) . $

Thus $Gamma = d_(*)^K \( sans(D) \( y \) - sans(D) \( l \) \)^2 + d_(*)^C \( sans(C) \( y \) - sans(C) \( l \) \)^2$. Here are concentration constants:

$ j & A_j \( t \) & alpha_j & beta_j\
D & dot(sans(D)) & .07052 & .0754\
E & - dot(sans(C)) & .281 & .254\
N & - n_(sans(K)) & .24 & .277\
C & n_(sans(C)) & .728 & .812 #h(2em) L_j \( H \) = 2 alpha_j \/ 3 - beta_j H \/ 2 . $

#thm([Lemma 10.3.])[
  (Concentration and primitive bounds).  #emph[The following bounds hold in the bounded region just specified. For a set in $\[ 0 \, 3.6 \]$ of length $2 H$, $0 < H lt.eq T_0$, the mean of $\( A_j \)_(+)$ on the set is at most $alpha_j - beta_j H$. Also $dot(sans(D)) gt.eq - .022$ on $\[ 0 \, 3.6 \]$, and for $0 lt.eq t lt.eq t' lt.eq 3.6$, 
$ sans(C) \( t' \) - sans(C) \( t \) lt.eq .000124 \, #h(2em) q \( t \) - q \( t' \) lt.eq .000084 . $

 We will use $b_a lt.eq .0163$, and primitive bounds 
#[#set math.equation(numbering: n => "(s1)")
 $ l < 0 : & e_K + Gamma lt.eq min \( .018 \, .0146 dot.op 4 h^2 + .00010 \) + .00015 \,\
l gt.eq 0 : & e_K + Gamma lt.eq .01815 + 1 \/ \( 312 sinh^2 \( 2 h \) \) . $ <eq:s1>]

]
] <lem:segment-auxiliary>

#proof[
  We establish the concentration, interpolation, and primitive assertions in turn.
  #strong[Concentration from finite threshold sums.] For the concentration assertion, compare with a threshold $v$: the total on any given set is at most $2 H v + I_j \( v \)$, where $I_j \( v \) = integral_0^3.6 \( A_j - v \)_(+) d t$ and we use $v gt.eq 0$. The same threshold bound holds for a measurable density $0 lt.eq theta.alt lt.eq 1$ on $\[ 0 \, 3.6 \]$ with $integral_0^3.6 theta.alt = 2 H$:
  $ integral_0^3.6 theta.alt \( t \) \( A_j \( t \) \)_(+) thin d t lt.eq 2 H v + I_j \( v \) \, #h(2em) v gt.eq 0 . $
  This follows by multiplying the pointwise threshold bound by $theta.alt$.
  Here is a small table for this comparison on successive intervals of $1000 H$ with endpoints
  $ 0 \, 75 \, 150 \, 200 \, 250 \, 300 \, 350 \, 400 \, 540 . $
  Row entries give $1000 v$, followed below by upper bounds for $10^5 I_j \( v \)$ in the same order.
  $ D & 61 & 54 & 44 & 37 & 29 & 21 & 14 & 0\
E & 247 & 224 & 192 & 167 & 141 & 116 & 90 & 42\
N & 216 & 178 & 143 & 115 & 77 & 42 & 17 & 0\
C & 664 & 545 & 444 & 347 & 234 & 152 & 97 & 21\
D & 0 & 105 & 419 & 716 & 1124 & 1598 & 2069 & 3167\
E & 0 & 351 & 1326 & 2363 & 3673 & 5133 & 6885 & 10779\
N & 0 & 577 & 1576 & 2624 & 4378 & 6352 & 8026 & 9323\
C & 0 & 1776 & 4528 & 8066 & 13250 & 17831 & 21389 & 27670 $
  At both ends of each interval these upper bounds divided by $10^5$ are $lt.eq 2 H \( alpha_j - beta_j H - v \)$, which suffices by concavity. For the integral entries use exactly
  $ sum_(i = 0)^144 delta_i / 80 \( A_j \( t_i \) + epsilon_j - v \)_(+) \, #h(2em) epsilon_j = .00040 \, med .00120 \, med .00217 \, med .00741 $
  respectively, with $t_i = i \/ 40$, $delta_i = 2$ except $delta_0 = delta_144 = 1$, using the values and interval rules of the one-variable estimates. Indeed by the chord errors there, each $A_j$ has upper error from its chord at most $epsilon_j$, so the formula works by convexity. The sample values are enclosed by the finite rational rules of Lemma 29; the interpolation estimates in Lemma 31 justify the passage between nodes. For example, with $cal(R) \( M \) = .536 M + .00001$, the required errors are
  $ cal(R) \( .000673 \) + .021 cal(R) \( .00222 \) & = .00039592632 < .00040 \,\
cal(R) \( .00222 \) & = .00119992 < .00120 \,\
cal(R) \( .00402 \) & = .00216472 < .00217 \,\
cal(R) \( .0138 \) & = .0074068 < .00741 . $
  Thus these sums are rigorous upper bounds for the integrals; no additional derivative evaluation between nodes is needed.
  #strong[Averaging the interpolated profiles.] For the remaining assertions put
  $ P_F \( t \) = integral_0^1 F \( t s' \) cosh \( t s' \) thin d s' med #scale(x: 180%, y: 180%)[\/] integral_0^1 cosh \( t s' \) thin d s' \, #h(2em) P = P_(sans(K)) . $
  Use as approximate samples (starred) at $t_i$, with $F_i = F \( t_i \)$,
  $ P_(F \, i)^(*) = F_i - 40 sum_(k = 1)^i frac(cosh t_k - cosh t_(k - 1), sinh t_i) \( F_k - F_(k - 1) \) \, #h(2em) P_(F \, 0)^(*) = F_0 . $
  This is an exact integration formula for the piecewise affine interpolant of $F$ in the $t$ coordinate, averaged against physical length. Indeed, integration by parts gives $P_F \( t \) = F \( t \) - integral_0^t dot(F) \( v \) sinh v thin d v \/ sinh t$; on each mesh cell the interpolant’s derivative is the constant $40 \( F_k - F_(k - 1) \)$. Errors for $P_F$ from the chord through its starred samples are at most
  $ F & sans(K) & q & q^2\
upright("error") & .000051 & .000128 & .000076 $
  Indeed sample errors are bounded by $G_F \/ 12800$ for $G_F = sup \| dot.double(F) \|$; also $\| dot.double(P)_F \| lt.eq G_F + 2 L_F + o_F$ where $L_F = sup \| dot(F) \| \, med o_F = "osc" F$. Differentiating the quotient, the terms besides the weighted mean of $\( s' \)^2 dot.double(F)$ are $2 "Cov" \( s' dot(F) \, s' tanh \( t s' \) \) + "Cov" \( F \, \( s' \)^2 \) - 2 bb(E)_(*) \[ s' tanh \( t s' \) \] "Cov" \( F \, s' tanh \( t s' \) \)$ in its weighted expectation $bb(E)_(*)$. Bounding covariances by one quarter of the products of their ranges establishes this derivative estimate. Adding the error at the starred nodes and the chord error of the exact average gives the total bound $\( 2 G_F + 2 L_F + o_F \) \/ 12800$. For $\( F \, G_F \, L_F \, o_F \) = \( sans(K) \, .238 \, .066 \, .0345 \)$ and $\( q \, .53 \, .193 \, .1784 \)$ this is below the first two stated errors. For $q^2$ we can use $G_F = .347 \, med L_F = .099 \, med o_F = .060$. Chord errors for $sans(K) \, sans(D) \, sans(C) \, q$ are bounded by $.000019 \, .000020 \, .000062 \, .000042$ using the one-variable estimates.
  Here are the sample bounds for this part. In the formulas inside the table use sampled values at $t_i$, including the starred samples for $P_F$. Put $q_M = .2559$, and define
  $ B_0 \( t \) & = P \( t \) - \( sans(K) \( t \) + sans(K) \( 0 \) \) \/ 2 + d_(*)^K \( sans(D) \( t \) - sans(D) \( 0 \) \)^2 + d_(*)^C \( sans(C) \( t \) - sans(C) \( 0 \) \)^2 \,\
B_1 \( t \) & = - 1 / 2 \( sans(K) \( t \) - sans(K) \( 0 \) \) + d_(*)^K \( sans(D) \( t \) - sans(D) \( 0 \) \)_(+) \( sans(D) \( t \) + sans(D) \( 0 \) + .0214 \)_(+) \,\
Z_1 \( t \) & = tanh t thin \( .0178 - P \( t \) \) . $
  $ i & upright("expression") & upright("bound")\
0 : 144 & sans(D) - sans(D) \( 0 \) & \[ - 10^(- 8) \, .0314 \]\
 & P & lt.eq .01767\
 & B_0 & lt.eq .01773\
 & B_0 - .0146 t_i^2 & lt.eq .00001\
 & dot(sans(D)) & gt.eq - .0213\
0 : 56 & B_1 + 1 / 2 \( P - .0049 \)_(+) & lt.eq .000001\
 & Z_1 & \[ 0 \, .00742 \]\
 & B_1 + 78 Z_1^2 & lt.eq .000001\
 & P_(q^2) - \( q + q_M \) P_q + \( q^2 + q_M^2 \) \/ 2 & lt.eq .01587\
0 : 144 & - sans(C) \, quad q \, quad min \( sans(D) \, - .01065 \) \, quad min \( P \, .0049 \) & upright("nondecreasing (samples)") $
  The arithmetic for these tables proceeds in the following order. At each node $t_i = i \/ 40$, first use the one-variable sample rules to enclose $sans(K)_i$, $q_i$ and $sans(C)_i = - d_i + 6.5 g'' \( s sinh t_i \)$, together with their indicated derivatives. Form $sans(D)_i = sans(K)_i + .021 sans(C)_i$. For the threshold table the four columns are $dot(sans(K))_i + .021 dot(sans(C))_i$, $- dot(sans(C))_i$, $- n_(sans(K) \, i)$ and $n_(sans(C) \, i)$.
  The starred primitive samples are not point evaluations. For each of them, start the numerator sum in its defining formula at zero and add the profile differences times the corresponding differences of $cosh t_i$. Equivalently, use $a_(t_i) = s cosh t_i$ and $x_i = s sinh t_i$; the common factor $s$ cancels in the quotient. With these starred samples and the point-value columns in hand, substitute into $B_0 \, B_1 \, Z_1$ and the endpoint-distance expression. Squares are the full ranges of squares of the interval arguments. At $t = 0$, take $tanh t = 0$ exactly.
  For the last table row, compare successive nodes $i \, i + 1$ for $0 lt.eq i < 144$. The differences for $- sans(C)$ and $q$ are bounded below by $.000005$ and $.000012$, respectively. For the two clipped columns the lower bound is zero; clipping is applied to the interval endpoints before taking these differences. These operations, with the finite enclosure rules from the one-variable table, specify both tables here.
  The monotonicity line and the chord errors prove the two claimed almost-monotonicity bounds, and for $0 lt.eq t lt.eq y lt.eq 3.6$,
  $ P \( y \) & gt.eq min \( P \( t \) \, .0049 \) - 2 dot.op .000051 \, #h(2em) P lt.eq .0178 \,\
sans(D) \( y \) & gt.eq min \( sans(D) \( t \) \, - .01065 \) - .000040 . $
  To justify this implication, let $J_F$ be the piecewise affine interpolant of the relevant samples. If $min \( F_i \, c \)$ is nondecreasing, then $min \( J_F \, c \)$ is nondecreasing as well: each cell connects its two clipped endpoint values monotonically, and a cell with both endpoints above $c$ remains above $c$. Since clipping is 1-Lipschitz, $\| F - J_F \| lt.eq epsilon.alt$ implies, for $t lt.eq y$,
  $ F \( y \) gt.eq min \( F \( y \) \, c \) gt.eq min \( J_F \( y \) \, c \) - epsilon.alt gt.eq min \( F \( t \) \, c \) - 2 epsilon.alt . $
  For starred P samples the same argument uses their total chord error. Saturated interval values in the finite calculation are the exact constant $c$; uncertain overlapping intervals are not used to infer monotonicity. Also $B_0 \( t \) lt.eq min \( .018 \, .0146 t^2 + .00010 \)$ by convexity in its profile arguments. Here the added errors are $< .000075$ (use the sample ranges for $sans(D) - sans(D) \( 0 \) \, sans(C) - sans(C) \( 0 \)$), and $.0146 t^2$ has chord error less than .000003.
  #strong[The primitive budget.] Take $t = \| l \|$. Since $sans(K)$ is even, its primitive in physical length is represented by $s sinh \( t \) P \( t \)$ on the positive half-axis. Subtracting the primitives at the two endpoints gives $overline(sans(K)) = P \( y \) + theta \( P \( y \) - P \( t \) \)$, where $theta = sinh l \/ \( sinh y - sinh l \)$. After subtracting $B_0 \( y \)$ from $e_K + Gamma$, the remaining terms are $theta \( P \( y \) - P \( t \) \)$ and
  $ - 1 / 2 \( sans(K) \( t \) - sans(K) \( 0 \) \) + d_(*)^K \( sans(D) \( t \) - sans(D) \( 0 \) \) \( sans(D) \( t \) + sans(D) \( 0 \) - 2 sans(D) \( y \) \) + d_(*)^C \( sans(C) \( t \) - sans(C) \( 0 \) \) \( sans(C) \( t \) + sans(C) \( 0 \) - 2 sans(C) \( y \) \) . $
  We first bound this common correction, before distinguishing the sign of $l$. Put $X = sans(D) \( t \) - sans(D) \( 0 \)$ and $epsilon = .000040$. The product with coefficient $d_(*)^K$ is
  $ X #scale(x: 120%, y: 120%)[\(] sans(D) \( t \) + sans(D) \( 0 \) - 2 sans(D) \( y \) #scale(x: 120%, y: 120%)[\)] = X #scale(x: 120%, y: 120%)[\(] 2 \[ sans(D) \( t \) - sans(D) \( y \) \] - X #scale(x: 120%, y: 120%)[\)] . $
  The node and chord bounds give $- .000021 lt.eq X lt.eq .032$. If $X < 0$, use $sans(D) \( y \) - sans(D) \( 0 \) lt.eq .032$ to bound this product above by $.000021 \( 2 dot.op .032 + .000021 \)$. If $X gt.eq 0$ and $sans(D) \( t \) lt.eq - .01065$, clipped monotonicity gives $sans(D) \( y \) gt.eq sans(D) \( t \) - epsilon$. Hence
  $ X #scale(x: 120%, y: 120%)[\(] 2 \[ sans(D) \( t \) - sans(D) \( y \) \] - X #scale(x: 120%, y: 120%)[\)] lt.eq - X^2 + 2 epsilon X lt.eq epsilon^2 . $
  In the other case, $sans(D) \( t \) > - .01065$, the same clipped bound gives $sans(D) \( y \) gt.eq - .01065 - .000040 > - .0107$. The product is then bounded by $\( sans(D) \( t \) - sans(D) \( 0 \) \)_(+) \( sans(D) \( t \) + sans(D) \( 0 \) + .0214 \)_(+)$, the product already present in $B_1 \( t \)$.
  For the $sans(C)$ product, suppose first $sans(C) \( t \) > sans(C) \( 0 \)$. Almost-monotonicity bounds the first factor by $.000124$, while the global range bounds the second factor above by $.320$. If $sans(C) \( t \) lt.eq sans(C) \( 0 \)$, set $a = sans(C) \( 0 \) - sans(C) \( t \) gt.eq 0$. The bound $sans(C) \( y \) lt.eq sans(C) \( t \) + .000124$ makes the product at most $- a^2 + 2 \( .000124 \) a lt.eq .000124^2$. After multiplying these errors by $d_(*)^K$ and $d_(*)^C$, their sum is less than $.000014$. Thus the common correction is at most $B_1 \( t \) + .000014$.
  We next pass from the samples of $B_1$ to its true values. The product $\( x - b \)_(+) \( x - b' \)_(+)$ is zero up to the larger threshold and is a nondecreasing convex quadratic thereafter. Thus the product in $B_1$ is convex in $sans(D) \( t \)$, with $sans(D) \( 0 \)$ fixed. Its two clipped factors sum to at most $.058$, both for the chords and for the true arguments. Here we use $sans(D) \( 0 \) < - .0140$; the exact formula is $\( 1 - 6.5 t_c \) \( \( 2 + pi \) c_(*) - 1 \) - 2 t_c c_(*)$, with $c_(*) = log 2 - 1 \/ 2$. Consequently the upper error of $B_1$ from the chord through its sample values is at most $1 / 2 dot.op .000019 + d_(*)^K dot.op .058 dot.op .000020 < .000020$.
  If $l < 0$, then $theta in \[ - 1 \/ 2 \, 0 \]$. The lower bound $P \( y \) gt.eq min \( P \( t \) \, .0049 \) - 2 dot.op .000051$ therefore gives $theta \( P \( y \) - P \( t \) \) lt.eq .5 \( P \( t \) - .0049 \)_(+) + .000051$. Use the table row for $B_1 + 1 / 2 \( P - .0049 \)_(+)$. Convexity of the positive part and the chord error of $P$ add at most $.000051 \/ 2$ to the $B_1$ chord error. The total correction is bounded by
  $ .000014 + .000020 + .000001 + .000051 \/ 2 + .000051 < .00015 . $
  Combining this with $B_0 \( y \) lt.eq min \( .018 \, .0146 y^2 + .00010 \)$ and $y lt.eq 2 h$ proves the $l < 0$ line of Equation (s1).
  For $l gt.eq 0$, $t = l$ and $0 lt.eq theta lt.eq tanh l \/ sinh \( 2 h \)$. Since $P \( y \) lt.eq .0178$ and $P \( t \) lt.eq .0178$, the nonnegative function $Z_1 \( t \) = tanh t \( .0178 - P \( t \) \)$ satisfies $theta \( P \( y \) - P \( t \) \) lt.eq Z_1 \( t \) \/ sinh \( 2 h \)$. This time we use the table row for $B_1 + 78 Z_1^2$.
  The error of $Z_1$ from its starred chord is at most $.000066$. To see this, combine the separate errors in the two factors with $1 / 4 \| Delta P_i^(*) \| \| Delta tanh t_i \|$, the difference between the product of their chords and the chord of their products. The derivative estimate $\| dot(P) \| lt.eq L_(sans(K)) + o_(sans(K)) \/ 4$ follows by the same weighted differentiation used above. Explicitly,
  $ .000051 + frac(.0178 + .007 + .238 \/ 12800, 12800) + frac(1, 4 dot.op 40) (\( .066 + .0345 \/ 4 \) \/ 40 + 2 dot.op .238 \/ 12800) < .000066 . $
  The starred samples lie in $\[ 0 \, .00742 \]$. Convexity of the square therefore bounds the error in $78 Z_1^2$ by $78 dot.op .000066 \( 2 dot.op .00742 + .000066 \)$. Including the common correction, the $B_1$ chord error and the table margin gives $.000014 + .000020 + .000001 + 78 dot.op .000066 \( 2 dot.op .00742 + .000066 \) < .00015$. It follows that
  $ e_K + Gamma - B_0 \( y \) lt.eq .00015 + Z_1 \( t \) \/ sinh \( 2 h \) - 78 Z_1 \( t \)^2 \, $
  Maximizing $Z \/ sinh \( 2 h \) - 78 Z^2$ over real $Z$ gives $1 \/ \( 312 sinh^2 \( 2 h \) \)$. Together with the bound on $B_0$, this proves (s1) when $l gt.eq 0$, completing the primitive estimates.
  #strong[The q endpoint-distance bound.] Finally, on the part $\| l \| lt.eq t' lt.eq y$, $q \( t' \)$ lies between the two endpoint values up to .000084, so the half sum of squared differences pointwise is at most $.1784^2 \/ 2 + .000084 \( .1784 + .000084 \) < .0163$. If $l < 0$, reflect the extra part $\[ l \, \| l \| \]$ to $\[ 0 \, t \]$, where $t = \| l \|$. To bound its mean endpoint-distance, maximize the convex quadratic in the other endpoint value $q \( y \) in \[ q \( t \) - .000084 \, q_M \]$. The upper endpoint $q_M$ suffices: throughout $0 lt.eq t lt.eq 1.4$, the $q_max$ column in the proof of Lemma 28 (rows through $40 : 68$) gives $q \( t \) lt.eq .245$, whereas $q \( v \) lt.eq q \( t \) + .000084$ on $\[ 0 \, t \]$. Hence $q_M - q \( t \) > 3 \( .000084 \)$, so the squared distance to $q_M$ is at least the squared distance to $q \( t \) - .000084$ at every such $q \( v \)$. After averaging, we obtain the following conservative bound:
  $ P_(q^2) \( t \) - \( q \( t \) + q_M \) P_q \( t \) + \( q \( t \)^2 + q_M^2 \) \/ 2 + .000084^2 \/ 2 #h(2em) \( t = \| l \| \) . $
  The table applies with upper error at most .00018 on its profile expression, proving $b_a lt.eq .0163$. Indeed for the product use the given chord errors plus $1 / 4 \| Delta P_(q \, i)^(*) \| \| Delta q_i \|$, with $\| dot(P)_q \| lt.eq L_q + o_q \/ 4$; altogether the upper error is at most
  $ & .000076 + 2 q_M dot.op .000128 + \( q_M + .53 \/ 12800 \) dot.op .000042\
 & quad + frac(.193, 4 dot.op 40) (\( .193 + .1784 \/ 4 \) \/ 40 + 2 dot.op .53 \/ 12800)\
 & quad + 1 / 2 dot.op .000042 \( 2 q_M + .000042 \) < .00018 \, $
  using also convexity for the $q \( t \)^2 \/ 2$ term. This completes the proof. ◻
]

==== 10.4.1 Consequences for weighted chord errors <consequences-for-weighted-chord-errors>

We first suppose $\[ l \, y \] subset \[ 0 \, 3.6 \]$ and apply the concentration bound to $F = \( A_j \)_(+)$. The kernel $1 - beta^2$ has the layer-cake identity

$ integral_(- 1)^1 \( 1 - beta^2 \) F \( m + h beta \) thin frac(d beta, 2) = integral_0^1 2 \( u' \)^2 (frac(1, 2 u') integral_(- u')^(u') F \( m + h beta \) thin d beta) d u' . $

The expression in parentheses is the uniform mean on the interval $\[ m - h u' \, m + h u' \]$, whose length is $2 h u'$. For $h u' lt.eq T_0$ it is at most $alpha_j - beta_j h u'$. For longer intervals it is still at most $alpha_j - beta_j T_0$: choose a subset of length $2 T_0$ with at least as large a mean and apply the concentration bound to that subset. Since $min \( h u' \, T_0 \) gt.eq u' min \( h \, T_0 \)$, integration gives

$ integral_0^1 2 \( u' \)^2 \[ alpha_j - beta_j u' min \( h \, T_0 \) \] thin d u' = frac(2 alpha_j, 3) - frac(beta_j min \( h \, T_0 \), 2) = L_j \( min \( h \, T_0 \) \) . $

For a segment crossing zero we need only $F = \( n_(sans(C)) \)_(+)$, which is even. Reflect the interval $\[ m - h u' \, m + h u' \]$ to $\[ 0 \, 3.6 \]$. The pushforward of its length measure has density $upright(bold(1))_(\[ m - h u' \, m + h u' \]) \( t \) + upright(bold(1))_(\[ m - h u' \, m + h u' \]) \( - t \)$, which is at most two and has mass $2 h u'$. Divide this density by two. It is now bounded by one and has mass $h u' = 2 \( h u' \/ 2 \)$, so the density version of the concentration estimate bounds the original interval mean by $alpha_C - beta_C h u' \/ 2$. Here $h \/ 2 lt.eq T_0$ ensures that every parameter $h u' \/ 2$ is allowed. The same layer-cake integral therefore gives $L_C \( h \/ 2 \)$, with no extra factor of two.

Apply these bounds to the chord identity and use $W \( beta \) lt.eq g_h \( 1 - beta^2 \)$. They give

#[#set math.equation(numbering: n => "(s2)")
 $ - c_a lt.eq h^2 g_h L_C \( h'_s \) \/ 3 \, #h(2em) h'_s = cases(delim: "{", min \( h \, T_0 \) & l gt.eq 0 \,, h \/ 2 & l < 0 \, med h \/ 2 lt.eq T_0 .) $ <eq:s2>]

For $l gt.eq 0$ and $.16 lt.eq h lt.eq T_0$, the chord identity with $F = sans(K)$ similarly gives $e_K lt.eq h^2 g_h L_N \( h \) \/ 3$. The endpoint differences in $Gamma$ use the unweighted means. Put $d_s = alpha_D - beta_D h$ and $b_s = alpha_E - beta_E h$. The mean of $dot(sans(D))$ is between $- .022$ and $d_s$, and $d_s > .022$ on this width range. Therefore $\| sans(D) \( y \) - sans(D) \( l \) \| lt.eq 2 h d_s$. For $- dot(sans(C))$, almost-monotonicity supplies the lower mean bound $- .000124 \/ \( 2 h \)$, while concentration supplies the upper bound $b_s$. Since $b_s > .000124 \/ \( 2 h \)$, this gives $\| sans(C) \( y \) - sans(C) \( l \) \| lt.eq 2 h b_s$, and hence $\| c_d \| lt.eq h b_s$. Substituting these two endpoint differences in $Gamma$ proves

#[#set math.equation(numbering: n => "(s3)")
 $ e_K + Gamma lt.eq h^2 #scale(x: 120%, y: 120%)[\[] g_h L_N \( h \) + 12 d_(*)^K d_s^2 + 12 d_(*)^C b_s^2 #scale(x: 120%, y: 120%)[\]] \/ 3 . $ <eq:s3>]

We abbreviate $p = p_a \, f = f_0^(*) \, chi = t_(+)$ in the rest of this segment proof, and put

$ G_0 = r^2 w^2 \, #h(2em) d_h = 2 r^2 B_h sin \( w h \) \, quad p_d = - d_h tanh m . $

We will use the signs of the two half-differences as well as their absolute bounds. Angular thresholds such as $pi \/ w$ use the usual circular constant. For $h gt.eq .16$, the bound on $\| B_h sin \( w h \) \|$ and $coth \( .16 \) lt.eq 1 \/ .16 + .16 \/ 3$ give $\| d_h \| < .031$. If $h lt.eq pi \/ w$, then $d_h gt.eq 0$: use $coth h gt.eq 1 \/ h$ and $sin z - z cos z gt.eq 0$ for $0 lt.eq z lt.eq pi$. In this case $- .031 lt.eq p_d lt.eq 0$, while range and almost-monotonicity give $- .08 lt.eq c_d lt.eq .000062$. Therefore $- .08 lt.eq c_d - p_d lt.eq .031062$, proving $\| c_d - p_d \| lt.eq .08$. When $l gt.eq 0$ and $.16 lt.eq h lt.eq T_0$, use the sharper lower bound $c_d gt.eq - h b_s$ instead. Since $h b_s > .032 > .031062$, we obtain $\| c_d - p_d \| lt.eq h b_s$.

=== 10.5 Middle widths <subsec:segments-middle>

We remain in the bounded region $m gt.eq 0$, $\| l \| lt.eq 1.4$, $y lt.eq 3.6$, and now take $.16 lt.eq h lt.eq T_0$. We first establish $p \/ h^2 > .33$. If $w h lt.eq pi \/ 2$, use $\| A_h \| lt.eq 1$ and $1 - cos \( w h \) gt.eq 4 \( w h \)^2 \/ pi^2$, the latter following from monotonicity of $sin z \/ z$. For $pi \/ 2 lt.eq w h lt.eq w T_0 < 5 pi \/ 6$, we have $sin \( w h \) gt.eq 1 \/ 2$, $cos \( w h \) gt.eq - 1$, and $w coth h gt.eq w = 4.6$; hence the numerator of $A_h$ is positive. Thus $p gt.eq 2 r^2$ and $p \/ h^2 gt.eq 2 r^2 \/ T_0^2 > .33$. The chord estimate now gives $c_a lt.eq .79 h^2 g_h \/ \( 1.5 dot.op 3 \) < p$.

First treat $l < 0$. The endpoint-distance moment bound, valid through $h = .54$, gives $b_a \/ h^2 lt.eq B_a^(*) = \( .193 \)^2 \( 4 \/ 3 + .05 h^2 \)$. For the half-difference, combine $\| q_(+) - q_(-) \| lt.eq 2 \( .193 \) h$ with the chord error $\| macron(q) - \( q_(+) + q_(-) \) \/ 2 \| lt.eq .53 h^2 g_h \/ \( 1.5 dot.op 3 \) < h^2 \/ 5$. Thus $\| b_d \| lt.eq .078 h^3 = : B_d^(*)$. By Equations (s1) and (s2), it suffices for Equation (s0) that

#[#set math.equation(numbering: n => "(s4)")
 $ \( 1 + chi \) f > .0584 h^2 + .00025 + chi \( p + h^2 B_a^(*) \) + frac(\( p + h^2 \( g_h L_C \( h \/ 2 \) \/ 3 + B_a^(*) \) \)^2 + \( .08 + B_d^(*) \)^2, 4 lambda) . $ <eq:s4>]

==== 10.5.1 Nonnegative endpoints and the q variance <nonnegative-endpoints-and-the-q-variance>

For $l gt.eq 0$ in this range put

$ a_s = p \/ h^2 + g_h L_C \( h \) \/ 3 \, quad z = \| q_(+) - q_(-) \| \/ \( 2 h \) lt.eq .193 \, quad v_h = h coth h - h . $

Then $0 lt.eq p - c_a lt.eq h^2 a_s$. To lower bound $V_q$ use that the averaging density with respect to $d t$ on $\[ l \, y \]$ is at least $v_h \/ \( 2 h \)$ (since $cosh \( t \) \/ cosh m gt.eq e^(- h)$). No monotonicity of $q$ is needed. For a nonnegative continuous function $psi$, the derivative bound and the fundamental theorem of calculus give

$ integral_l^y psi \( q \( t \) \) thin d t gt.eq 1 / .193 integral_l^y psi \( q \( t \) \) \| dot(q) \( t \) \| thin d t gt.eq 1 / .193 lr(|integral_(q_(-))^(q_(+)) psi \( v \) thin d v|) . $

Applied to the test $\( q - macron(q) \)^2$ (with $macron(q)$ fixed and the endpoint-value interval of length $2 h z$, where the integral of this squared deviation is at least $\( 2 h z \)^3 \/ 12$), this gives

$ V_q \/ h^2 gt.eq v_h z^3 \/ \( 3 dot.op .193 \) . $

We have $0 lt.eq b_a - V_q lt.eq h^2 \( z^2 + h^2 \/ 25 \)$ (it is the square of the chord-mean error plus the squared half difference) and $\| b_d \| lt.eq 2 h^3 z \/ 5$. For Equation (sv) divided by $h^2$ we use

$ & frac(\( c_a - p - b_a \)^2 + \( c_d - p_d - b_d \)^2, 4 lambda h^2) + frac(chi \( p + b_a \) - \( 1 + chi \) V_q, h^2)\
 & #h(2em) #h(2em) lt.eq frac(h^2 a_s^2 + b_s^2, 4 lambda) + chi p \/ h^2 + R \, $

where

$ R = Q_s \( z^2 + h^2 \/ 25 \) + h^2 b_s z \/ \( 5 lambda \) + h^4 z^2 \/ \( 25 lambda \) - frac(.855, 3 dot.op .193) v_h z^3 \, #h(2em) Q_s = chi + h^2 \( 2 a_s + .05 \) \/ \( 4 lambda \) . $

In fact in the first square use

$ \( p - c_a + b_a \)^2 lt.eq \( h^2 a_s + b_a - V_q \)^2 + 2 \( h^2 a_s + .0163 \) V_q . $

Here $z^2 + h^2 \/ 25 lt.eq .193^2 + .54^2 \/ 25 = .048913 < .05$. The upper bound $h^2 a_s lt.eq .16025$ proved below gives

$ 1 - frac(h^2 a_s + .0163, 2 lambda) gt.eq 1 - frac(.16025 + .0163, 1.3) > .86419 > .855 . $

More explicitly, put $D_q = b_a - V_q$, $H_a = h^2 a_s$, and $delta_q = z^2 + h^2 \/ 25$. Then $0 lt.eq D_q lt.eq h^2 delta_q$ and

$ \( p - c_a + b_a \)^2 & lt.eq \( H_a + D_q + V_q \)^2\
 & = \( H_a + D_q \)^2 + 2 \( H_a + b_a \) V_q - V_q^2\
 & lt.eq \( H_a + D_q \)^2 + 2 \( H_a + .0163 \) V_q . $

The other square is at most $\( h b_s + 2 h^3 z \/ 5 \)^2$, while $chi b_a - \( 1 + chi \) V_q = chi D_q - V_q$. After division by $h^2$, the terms involving $D_q$ are bounded by $Q_s delta_q$, since $delta_q lt.eq .05$. Expanding the other square produces $h^2 b_s z \/ \( 5 lambda \) + h^4 z^2 \/ \( 25 lambda \)$ beyond its constant term. The retained coefficient of $- V_q \/ h^2$ is at least $.855$; substitution of the variance lower bound gives precisely $R$.

==== 10.5.2 A cubic bound for the remaining variance cost <a-cubic-bound-for-the-remaining-variance-cost>

We verify that $R \/ h^2 lt.eq .027$, by setting $Z = z \/ h$. An upper bound on each interval $\[ L \, H \]$ with successive endpoints $.16 \, .23 \, .29 \, .35 \, .40 \, .45 \, .50 \, .54$ is the maximum on $Z gt.eq 0$ of $Q \/ 25 + A Z^2 + B Z - N_0 Z^3$. The following table bounds $h^2 a_s \, Q \, A \, B$ upwards and $N_0$ downwards. Its final column bounds the maximum of the cubic formed from those rounded coefficients. Every entry is scaled by $10^5$; the seven rows correspond to the seven successive width intervals. The columns are rounded independently from their defining formulas with the unrounded $A_0$; a column is not calculated recursively from an earlier rounded column.

$ h^2 a_s & Q & A & B & N_0 & sup \( R \/ h^2 \)\
8298 & 12885 & 12902 & 1576 & 20047 & 2028\
13121 & 16655 & 16699 & 1851 & 26748 & 2449\
15242 & 18360 & 18453 & 2069 & 31598 & 2526\
15218 & 18414 & 18572 & 2208 & 35687 & 2308\
15449 & 18673 & 18925 & 2309 & 38555 & 2242\
15768 & 19010 & 19395 & 2370 & 40970 & 2218\
16025 & 19288 & 19811 & 2390 & 42963 & 2195 $

For details put

$ S_u \( h \) = 1 + h^2 \/ 6 + .0084 h^4 \, quad H_u \( h \) = 1 + h^2 \/ 2 + .0421 h^4 \, #h(2em) g_u \( h \) = .75 S_u \( h \) \( 1 + H_u \( h \) \) . $

These are upper bounds for $S$, $cosh h$, and $g_h$ on the present range. For example, after dividing the remainder of $S$ by $h^4$, its first term is $1 \/ 120$ and its successive term ratio is at most $.54^2 \/ 42$. Thus its sum is at most $875 \/ 104271 < .0084$. For $cosh h$ the corresponding bound is $3125 \/ 74271 < .0421$. The product defining $g_u$ has nonnegative factors, so it also has the claimed direction. For the first column use

$ A_0 = g_u \( H \) H^2 L_C \( H \) \/ 3 + min (G_0 H^2 \( 4 \/ 3 + .05 H^2 \) \, med 2 r^2 [1 - frac(1 - sqrt(1 + w^2 \( 1 \/ L + L \/ 3 \)^2), 2 \( 1 + w^2 \))]) . $

Indeed $h^2 L_C \( h \)$ is increasing here and we bounded $p$ as in the short-interval and tail estimates, using $coth h lt.eq 1 \/ h + h \/ 3$. Use

$ Q & = chi + frac(2 A_0 + .05 H^2, 4 lambda) \, & A & = Q + frac(H^4, 25 lambda) \,\
B & = frac(H \( alpha_E - beta_E H \), 5 lambda) \, & N_0 & = frac(.855 L \( 1 - L + L^2 \/ 3 - .023 L^4 \), 3 dot.op .193) . $

The endpoint choices have the required directions. The derivatives of $h^2 L_C \( h \)$ and $h b_s$ are positive through $.54$; for the latter, $\( h b_s \)' = .281 - .508 h gt.eq .00668$. Also $h v_h = 2 h^2 \/ \( e^(2 h) - 1 \)$ is increasing: its derivative has the sign of $\( 1 - h \) e^(2 h) - 1$. The function $\( 1 - h \) e^(2 h)$ increases to $h = .5$ and then decreases, while its value at $.54$ is greater than $.46 \( 1 + 1.08 + 1.08^2 \/ 2 \) > 1$. Finally, the coefficient of $h^(2 n)$, $n gt.eq 2$, in $cosh h - \( 1 + h^2 \/ 3 - .023 h^4 \) S$, multiplied by $\( 2 n - 3 \) !$, is $.023 - 1 \/ \[ 3 \( 4 n^2 - 1 \) \] > 0$. The lower coefficients vanish, proving $h coth h gt.eq 1 + h^2 \/ 3 - .023 h^4$ and hence the lower bound $N_0$. The maximum for the rounded bounds in the display uses $Z_(*) = \( A + sqrt(A^2 + 3 N_0 B) \) \/ \( 3 N_0 \)$ and is $Q \/ 25 + \( A Z_(*)^2 + 2 B Z_(*) \) \/ 3$. The formulas generating these bounds use rational operations and two positive square roots, in $A_0$ and $Z_(*)$. For a positive rational $a$, a fully rational rule is to put $k = floor.l sqrt(floor.l 10^160 a floor.r) floor.r$ by integer square comparison and use $sqrt(a) in \[ k \/ 10^80 \, \( k + 1 \) \/ 10^80 \]$. Substitution with outward rational arithmetic verifies the stated coefficient bounds. Using the rounded coefficients gives, in row order, cubic maxima strictly below

$ .02028 \, med .02449 \, med .02526 \, med .02308 \, med .02242 \, med .02218 \, med .02195 . $

In the fourth row the displayed upper bound $B = .02208$ is exact; all rounding inequalities here are non-strict. Every cost bound is below $.027$, which proves the required uniform estimate.

Consequently, Equation (s3) reduces Equation (sv) to

#[#set math.equation(numbering: n => "(s5)")
 $ \( 1 + chi \) f \/ h^2 > #scale(x: 120%, y: 120%)[\[] g_h L_N \( h \) + 12 d_(*)^K d_s^2 + 12 d_(*)^C b_s^2 #scale(x: 120%, y: 120%)[\]] \/ 3 + \( h^2 a_s^2 + b_s^2 \) \/ \( 4 lambda \) + chi p \/ h^2 + .027 h^2 . $ <eq:s5>]

==== 10.5.3 Exact polynomial certificates <exact-polynomial-certificates>

We now prove Equations (s4) and (s5) throughout their common width interval by finite polynomial certificates. Multiply both inequalities (right terms brought to the left) by $S^2$. With $"sinc" z = \( sin z \) \/ z$ the angular functions obey

$ p S \/ h^2 & = frac(2 G_0, 1 + w^2) #scale(x: 120%, y: 120%)[\[] \( S - cosh h thin "sinc" \( 2 w h \) \) \/ h^2 + S thin "sinc"^2 \( w h \) #scale(x: 120%, y: 120%)[\]] \,\
f S^2 \/ h^2 & = frac(G_0, 1 + w^2) \( S^2 - "sinc"^2 \( w h \) \) \/ h^2 . $

The coefficient sequences below represent the four even series

$ S = sum_(i gt.eq 0) s_i h^(2 i) \, #h(2em) cosh h = sum_(i gt.eq 0) a_i h^(2 i) \, #h(2em) "sinc" \( 2 w h \) = sum_(i gt.eq 0) d_i h^(2 i) \, #h(2em) "sinc"^2 \( w h \) = sum_(i gt.eq 0) e_i h^(2 i) \, $

where $s_i = 1 \/ \( 2 i + 1 \) !$, $a_i = 1 \/ \( 2 i \) !$, $d_i = \( - 4 w^2 \)^i \/ \( 2 i + 1 \) !$, and $e_i = 2 \( - 4 w^2 \)^i \/ \( 2 i + 2 \) !$. Ordinary convolution on nonnegative indices is denoted by $*$. Thus $\( a * d \)_i$ and $\( s * e \)_i$ are the coefficients of the two products in the formula for $p S \/ h^2$. We use the following upper and lower polynomials:

$ p S \/ h^2 med lt.eq med P_u & = .00025 + frac(2 G_0, 1 + w^2) [sum_(i = 1)^7 \( s_i - \( a * d \)_i \) h^(2 i - 2) + sum_(i = 0)^7 \( s * e \)_i h^(2 i)] \,\
f S^2 \/ h^2 med gt.eq med F_(*) & = frac(G_0, 1 + w^2) sum_(i = 1)^6 frac(2 dot.op 4^i \( 1 - \( - w^2 \)^i \), \( 2 i + 2 \) !) h^(2 i - 2) . $

For $F_(*)$, the omitted series starts at $i = 7$. It alternates with first term positive and decreasing magnitudes: the successive ratios from that index are bounded by $8 w^2 h^2 \/ \( 18 dot.op 17 \) < 1$. Its sum is therefore nonnegative, which gives the lower bound. For $P_u$, both omitted series start at $i = 8$. Before the common multiplier, their absolute coefficients are bounded by

$ frac(1 + 9.26^(2 i + 1) \/ \( 2 w \), \( 2 i + 1 \) !) \, #h(2em) frac(1 + \( 1 + 2 w \)^(2 i + 3), 2 w^2 \( 2 i + 3 \) !) . $

These bounds follow by expanding $cosh h sin \( 2 w h \)$ and $sinh h cos \( 2 w h \)$ in complex exponentials, whose frequencies have modulus $sqrt(1 + 4 w^2) < 9.26$. Multiply the first coefficient bound by $h^(2 i - 2)$, the second by $h^(2 i)$, and both by $2 G_0 \/ \( 1 + w^2 \)$. At $i = 8$, setting $h = .54$ makes their sum less than $.000153$. For every later term the ratio is below $.10$: the factorial denominator factors increase with $i$, whereas the geometric numerator ratios and $h^2 lt.eq .54^2$ stay bounded. The entire omitted tail is consequently less than $.000153 \/ \( 1 - .10 \) < .00025$, the allowance included in $P_u$.

The following polynomials lower bound the two deficits after multiplication by $S^2$, in the order of Equations (s4) and (s5). Indeed, $P_u gt.eq p S \/ h^2 gt.eq 0$, and all other factors occurring inside the squares are nonnegative. The linear factors also have the required signs: on this interval $L_N \( h \) gt.eq .08521 > 0$ and $L_C \( h \) > .26609 > 0$. Replacing $S$ by $S_u$ and $g_h$ by $g_u$ therefore increases every upper cost and gives

$ T_(\( 4 \)) =  & \( 1 + chi \) h^2 F_(*) - S_u^2 #scale(x: 120%, y: 120%)[\[] .0584 h^2 + .00025 + chi h^2 B_a^(*) + \( .08 + B_d^(*) \)^2 \/ \( 4 lambda \) #scale(x: 120%, y: 120%)[\]]\
 & - chi h^2 P_u S_u - h^4 \( P_u + S_u \( g_u L_C \( h \/ 2 \) \/ 3 + B_a^(*) \) \)^2 \/ \( 4 lambda \) \,\
T_(\( 5 \)) =  & \( 1 + chi \) F_(*) - S_u^2 [#scale(x: 120%, y: 120%)[\(] g_u L_N \( h \) + 12 d_(*)^K d_s^2 + 12 d_(*)^C b_s^2 #scale(x: 120%, y: 120%)[\)] \/ 3 + b_s^2 \/ \( 4 lambda \) + .027 h^2]\
 & - h^2 \( P_u + S_u g_u L_C \( h \) \/ 3 \)^2 \/ \( 4 lambda \) - chi P_u S_u . $

Both polynomials are positive on $\[ .16 \, .54 \]$, as the following finite rational certificate shows. Put $h = .16 + .38 u$, $0 lt.eq u lt.eq 1$, and write

$ T \( .16 + .38 u \) = sum_(r = 0)^d beta_r binom(d, r) u^r \( 1 - u \)^(d - r) \, #h(2em) d = deg T . $

The basis functions are nonnegative and sum to one. It therefore suffices that every $beta_r$ be strictly positive. The degrees are 32,30 respectively. Lower bounds for coefficients multiplied by $10^5$, grouped by index $0 : 7 \, 8 : 15 \, 16 : 23 \, 24 : 32$ (through 30 in row two) are

$ & 0 : 7 & 8 : 15 & 16 : 23 & 24 : d\
T_(\( 4 \)) & 173 & 576 & 770 & 412\
T_(\( 5 \)) & 1586 & 701 & 408 & 407 $

To verify by sums, if $t_j = \[ h^j \] T$ from the displayed polynomials, take for each index $r$ the sum

$ sum_(i = 0)^r binom(r, i) / binom(deg T, i) \( .38 \)^i sum_(j = i)^(deg T) t_j binom(j, i) \( .16 \)^(j - i) . $

The expression is a finite rational sum: the coefficients $t_j$ are specified by the preceding products, factorials, and convolutions. Binomial expansion first gives the power coefficients in $u$; the identity $u^i = sum_(r = i)^d binom(r, i) binom(d, i)^(- 1) binom(d, r) u^r \( 1 - u \)^(d - r)$ then gives the displayed basis change. Direct substitution yields the grouped lower bounds. Since each is positive, the Bernstein representation proves strict positivity on the entire closed interval. This completes the middle widths through .54.

=== 10.6 Larger widths <subsec:segments-large>

We remain in the bounded region $m gt.eq 0$, $\| l \| lt.eq 1.4$, $y lt.eq 3.6$, and now take $h gt.eq .54$. Equation (s1) controls $e_K + Gamma$ throughout this region; write $b_M = .0163$. For $.54 lt.eq h lt.eq pi \/ w$, put $E \( h \) = cos^2 \( w h \) + 1 / 2 w coth h sin \( 2 w h \)$. Since $w h in \( 3 pi \/ 4 \, pi \]$, we have $sin \( 2 w h \) lt.eq 0$ and $cos \( 2 w h \) gt.eq 0$. Thus

$ E' \( h \) = - w sin \( 2 w h \) - 1 / 2 w "csch"^2 h sin \( 2 w h \) + w^2 coth h cos \( 2 w h \) gt.eq 0 . $

As $p = 2 r^2 \( 1 - E \/ \( 1 + w^2 \) \)$, this proves that $p$ is decreasing. Thus $p > .08$. Also $f$ is increasing up to $pi \/ w$. In any part of the current range $- c_a lt.eq .0802$, by almost-monotonicity (all values on the segment are at least $sans(C) \( y \) - .000124$), and $c_a lt.eq .160$ by the profile range. On $\[ L \, H \]$ inside or covering part of $\[ .54 \, pi \/ w \]$, Equation (s2) gives additional bounds on $- c_a$. For the intervals with endpoints $.54 \, .58 \, .63 \, .684$, write

$ R_P = min \( .0802 \, H^2 g_H L_C \( .54 \) \/ 3 \) \, quad R_O = min \( .0802 \, H^2 g_H L_C \( H \/ 2 \) \/ 3 \) $

(nonnegative or opposite signs of endpoints, respectively), using monotonicity of $h^2 L_C \( h \/ 2 \)$ here. Then $\| c_a - p - b_a \| lt.eq R_j + p + b_M$ in case $j in { P \, O }$, and $\| c_d - p_d - b_d \| lt.eq .08 + b_M$ since $\| b_d \| lt.eq b_a$. Here are bounds scaled by $10^5$, rounding $p$ up, $f$ down. Column $U_P$ bounds $e_K + Gamma$ for $l gt.eq 0$; for $l < 0$ use .01815 before scaling. Last two columns bound the remaining budgets below in the two cases:

$ p & f & U_P & R_P & R_O & P & O\
11379 & 4367 & 2004 & 5141 & 7101 & 2190 & 1901\
10895 & 4500 & 1970 & 6216 & 8020 & 2278 & 2006\
10112 & 4593 & 1937 & 7539 & 8020 & 2348 & 2276 $

Indeed use $p \( L \) \, f \( L \)$, $.01815 + 1 \/ \( 312 sinh^2 \( 2 L \) \)$, the displayed formulas and, for the budgets,

$ \( 1 + chi \) f - chi \( p + b_M \) - #scale(x: 120%, y: 120%)[\[] \( R_j + p + b_M \)^2 + \( .08 + b_M \)^2 #scale(x: 120%, y: 120%)[\]] \/ \( 4 lambda \) . $

For these numerical entries, Taylor polynomials through degree 20 for the trigonometric and hyperbolic functions have absolute error below $10^(- 8)$: their arguments are at most three (use the angle $w L$), and

$ frac(e^3 3^21, 21 !) < frac(21 dot.op 3^21, 21 !) < 10^(- 8) . $

The bound $e^3 < 21$ follows, for example, from $e < 11 \/ 4$. The last grid endpoint $.684$ exceeds $pi \/ w$, so the last row is used only up to $pi \/ w$; the larger endpoint provides valid radius upper bounds throughout that row. This proves Equation (s0) on this part.

It remains to consider $h gt.eq pi \/ w > .68$. The angular range bound gives $p > .077$, so the existing bounds $- .0802 lt.eq c_a lt.eq .160$ and $0 lt.eq b_a lt.eq b_M$ imply $\| c_a - p - b_a \| lt.eq .0802 + p + b_M$. For the other squared term, the sign of $d_h$ determines which estimate is stronger. If $d_h gt.eq 0$, then $- .031 lt.eq p_d lt.eq 0$, and the bounds on $c_d$ still give $\| c_d - p_d \| lt.eq .08$.

If $d_h < 0$, expand its definition as

$ d_h = frac(2 r^2, 1 + w^2) #scale(x: 120%, y: 120%)[\(] coth h sin^2 \( w h \) - w sin \( w h \) cos \( w h \) #scale(x: 120%, y: 120%)[\)] . $

Replacing $coth h$ by $1$ decreases the quadratic form in parentheses. Its smallest eigenvalue is $\( 1 - sqrt(1 + w^2) \) \/ 2$, so in this sign case $\| d_h \| lt.eq r^2 \( sqrt(1 + w^2) - 1 \) \/ \( 1 + w^2 \) < .00810$. Thus $\| c_d - p_d \| lt.eq .08 + .00810 = .08810$. There is a compensating improvement in $p$: negativity of $d_h$ forces $sin \( w h \) cos \( w h \) > 0$, hence $A_h cos \( w h \) > 0$ and $p lt.eq 2 r^2 = .0968$.

For $pi \/ w lt.eq h lt.eq .9$, the same bound $p lt.eq .0968$ holds without a sign condition on $d_h$. Indeed $pi lt.eq w h lt.eq 4.14 < 3 pi \/ 2$, so both sine and cosine are nonpositive and $A_h cos \( w h \) gt.eq 0$. To bound $f$ on this interval, first let $h lt.eq .78$. Then $\| sin \( w h \) \| lt.eq w \( h - pi \/ w \) lt.eq w \( .78 - .68 \)$, while $sinh h gt.eq sinh \( .68 \)$. For $.78 lt.eq h lt.eq .9$, use $\| sin \( w h \) \| lt.eq 1$ and $sinh h gt.eq sinh \( .78 \) > .85$ instead. Inserting either pair in the definition of $f$ gives $f gt.eq .0431$. The remaining budget, with $.0802$ in place of $R_j$ and $.08810$ in place of $.08$, is therefore at least $.02005$. The primitive cost in Equation (s1) is at most $.01912$.

For $h gt.eq .9$, the same variance formula with $sinh h gt.eq sinh \( .9 \)$ gives $f gt.eq .04413$. The general angular range estimate gives $p lt.eq .10882$, and Equation (s1) costs at most $.01853$. Use the improved $p$ bound when $d_h < 0$, and the improved half-difference bound when $d_h gt.eq 0$. The two substitutions into the remaining-budget formula are

$ & p med upright("at most") & \| c_d - p_d \| med upright("at most") & upright("budget at least") & upright("cost at most")\
d_h < 0 & .0968 & .08810 & .02115 & .01853\
d_h gt.eq 0 & .10882 & .08 & .01916 & .01853 $

All these numerical estimates follow, for example, from $coth \( .68 \) lt.eq 1 \/ .68 + .68 \/ 3$, $coth \( .9 \) < 1.3965$, $sinh \( .78 \) > .85$, $sinh \( .9 \) > 1.024$, $sinh \( 1.36 \) > 1.819$ and $sinh \( 1.8 \) > 2.94$. The positive series for $exp \( 2 h \)$ and $sinh h$ through degree seven give these elementary bounds. The three remaining budgets exceed their respective costs:

$ .02005 > .01912 \, #h(2em) .02115 > .01853 \, #h(2em) .01916 > .01853 . $

They therefore prove Equation (s0) in all the final width cases.

===== 10.6.1 Completion of the proof of Proposition 33. <completion-of-the-proof-of-proposition-propsegment-estimate.>

After reflection, every distinct endpoint pair has $m gt.eq 0$ and $h > 0$. Subsection 10.2 covers $h lt.eq .16$. For larger $h$, Subsection 10.3 covers $l lt.eq - 1.4$, $l gt.eq 1.4$, and $\| l \| < 1.4$ with $y gt.eq 3.6$. The remaining bounded region has $l in \[ - 1.4 \, 1.4 \]$ and $y lt.eq 3.6$; its widths are covered by Subsections 10.5 and 10.6. The boundaries $l = plus.minus 1.4$, $y = 3.6$, and $h = .16 \, .54 \, pi \/ w \, .9$ each belong to at least one of these arguments. The positive polynomial coefficients and the strict budget margins prove strictness for every $h > 0$. By the reduction in Subsection 10.1, this is the required inequality. At coincident endpoints every deviation and endpoint difference vanishes, giving the asserted equality.0◻


#bibliography("refs.bib", style: "ieee", title: [References])
