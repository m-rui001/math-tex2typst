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

#align(center)[#text(size: 16pt, weight: "bold")[The irrationality exponent of $pi$ is $2$]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For an irrational real number $x$, its #emph[irrationality exponent] (also called its irrationality measure) is

$ mu \( x \) = sup {nu > 0 : 0 < lr(|x - p / q|) < q^(- nu) upright(" for infinitely many coprime ") p \, q in bb(Z) \, med q gt.eq 2} . $

The pigeonhole principle gives $mu \( x \) gt.eq 2$. An upper bound limits how frequently rational numbers can approximate $x$ exceptionally closely; irrationality alone supplies no finite upper bound. The expected value for the usual positive circle constant is $2$. Waldschmidt records the corresponding epsilon-dependent approximation conjecture in #cite(label("waldschmidt")) p. 265. Our main result proves it.

#thm([Theorem 1.1.])[
  #emph[The irrationality exponent of $pi$ is $2$. More precisely, for every real $nu > 2$, there is an integer $Q \( nu \)$ such that 
$ lr(|pi - p / q|) gt.eq q^(- nu) #h(2em) \( p in bb(Z) \, med q in bb(Z) \, med q gt.eq Q \( nu \) \) . $

]
] <thm:main>

The inequality applies to all integer numerators and denominators, whether or not the fraction is reduced. The threshold may depend on $nu$, and the argument does not give it effectively. In particular, an exponent of $2$ is different from a uniform positive lower bound of the form $c \/ q^2$, or equivalently from bounded continued-fraction partial quotients.

The related Flint–Hills problem, popularized by Pickover and discussed by Alekseyev #cite(label("alekseyev")), asks whether

$ sum_(n gt.eq 1) frac(1, n^3 sin^2 n) $

converges, with angles in radians. Integers very close to multiples of $pi$ make individual denominators small. A rational-approximation bound controls how often such small values can occur, not just their individual size.

#thm([Corollary 1.2.])[
  #emph[The classical Flint–Hills series converges.]
] <thm:flinthills>

Alekseyev showed that convergence requires $mu \( pi \) lt.eq 5 \/ 2$ #cite(label("alekseyev")) Corollary 4; Meiburg proved the sufficient strict condition $mu \( pi \) < 5 \/ 2$ #cite(label("meiburg")) Theorem 2.5. Theorem 1 supplies this condition. Section 5 includes a short dyadic proof of the implication needed here. Neither cited criterion settles its equality boundary at $5 \/ 2$.

More generally, for fixed real numbers $a \, b > 0$, consider the family

$ sum_(n = 1)^oo frac(1, n^a \| sin n \|^b) . $

Theorem 1 and the spacing argument in Section 5 show that, with angles in radians, this series converges if and only if $a > max { 1 \, b }$; see Corollary 12.

=== 1.1 Quantitative approximation and related work <quantitative-approximation-and-related-work>

Mahler’s 1953 paper #cite(label("mahler1953")) established a finite irrationality exponent for $pi$ by constructing polynomial-coefficient combinations of powers of logarithms and proving determinant nonvanishing. It gave the explicit exponent $42$ for all denominators at least two and also stated an eventual improvement to $30$. Mignotte refined that construction, obtaining exponent $21$ for all such denominators and $20$ eventually #cite(label("mignotte1974")) Theorem 1. Chudnovsky developed Hermite–Padé approximation to exponential functions with precise asymptotic estimates #cite(label("chudnovsky1982")).

Hata’s integral constructions led to the bound $mu \( pi \) lt.eq 8.01604539 dots.h$ #cite(label("hata1993")); Zudilin gives an account of the simultaneous logarithmic approximation and denominator arithmetic behind this value #cite(label("zudilin2004")) Theorem 2. Salikhov’s symmetric-integral method improved it to $7.606308 dots.h$ #cite(label("salikhov")) #cite(label("salikhov2010")). Zeilberger and Zudilin combined parameter experiments with a rigorous arithmetic and asymptotic analysis to obtain $7.103205334137 dots.h$ #cite(label("zeilbergerzudilin")). Bai’s September 2026 preprint claims the further bound $mu \( pi \) < 7.101862832357$ by a two-exponent variation of the latter integral #cite(label("Bai2026")). These quantitative bounds are context, not inputs to our proof.

The connection with trigonometric series also has a longer history: Mahler applied approximation estimates to sine-denominator Dirichlet series in #cite(label("mahler1953")) Section 16. For the classical Flint–Hills question, recent work of Dan on generalized series #cite(label("Dan2026")) and López Zapata’s continued-fraction criterion #cite(label("LopezZapata2026")) leaves convergence undecided. The earlier convergence claim of Mantzakouras and López Zapata was withdrawn in September 2026 because its proof did not establish convergence or the asserted irrationality bound #cite(label("MantzakourasLopezZapata2025")). Carella claims both exponent two and the stronger bounded-partial-quotient property #cite(label("Carella2022")). Neither claim is used here. The displayed proof of the stronger assertion contains a sign obstruction.#footnote[In the notation of #cite(label("Carella2022")) Theorem 8.1, Equations (52) and (55), let $C = p_(n + 1) - pi q_(n + 1) - 1 \/ q_n$. The convergent estimate $\| p_(n + 1) - pi q_(n + 1) \| < 1 \/ q_(n + 2) < 1 \/ q_n$ gives $- 2 \/ q_n < C < 0$. Thus $sin C < 0$ for large $n$, contrary to the positive lower bound in that argument. This objection concerns the displayed proof of the stronger assertion; it does not decide the exponent-two claim or the truth of the stronger conclusion.]

=== 1.2 The proof in outline <the-proof-in-outline>

The proof uses a multivariable interpolation theorem to construct a nonzero determinant, then compares two incompatible estimates for its absolute value. This organization is related to the interpolation-determinant method discussed by Laurent #cite(label("laurent1991")) Section 6. Successively separated approximation denominators already play a central role in Roth’s many-variable method #cite(label("roth1960")) Sections 2–3. Our application requires a different interpolation statement, adapted to logarithmic curves and with thresholds independent of their centers.

===== 1.2.1 Prescribing coefficients. <prescribing-coefficients.>

A jet here means a finite packet of Taylor coefficients. Give the coordinates $Y \, X_1 \, dots.h \, X_m$ positive weights and retain polynomial monomials satisfying one weighted degree inequality. Their exponent vectors fill a simplex. At each point $\( 1 \, c_(j 1) \, dots.h \, c_(j m) \)$, expand after the substitution

$ Y = 1 + t \, #h(2em) X_i = c_(j i) + u_i + log \( 1 + t \) . $

The variable $t$ follows the logarithmic curve; the variables $u_i$ are transverse displacements. Theorem 3 states that every packet below the prescribed weighted cutoff can be realized, at finitely many centers whose $X_i$-coordinates are pairwise distinct for each $i$, simultaneously. The weights of $X_1 \, dots.h \, X_m$ are chosen successively before the center locations are known. The weights leave more polynomial coefficients than prescribed Taylor coefficients, but that dimension count alone does not prove full rank at these special centers.

The proof in Section 2 starts from a local multiplicity comparison between coordinate directions and commuting differential directions. Derivative persistence and separated scales restrict any algebraic obstruction; logarithmic residues then force coordinate constancy. This stage is related to the zero-estimate methods of Philippon #cite(label("philippon1986")) and the separated multidegrees in Farhi’s Roth lemma #cite(label("farhi2006")) Section 5.2. The resulting curve inequality bounds total weighted contact at the centers by the weighted degree of the curve. It gives positivity on an ordinary blowup, and vanishing yields all the requested coefficients. The relation between curvewise positivity and asymptotic jet generation is familiar from Demailly’s work #cite(label("demailly1992")) Section 6; the weighted, multiple-center statement on the possibly singular schemes used here is proved explicitly.

===== 1.2.2 Two ways to make the determinant small. <two-ways-to-make-the-determinant-small.>

Suppose that a fixed exponent $nu > 2$ permits exceptionally close approximations with unbounded denominators. Choose finitely many of these successively and set $c_(j i) = 2 upright(i) j p_i \/ q_i$. They approximate the common logarithmic periods $2 pi upright(i) j$. After truncating the logarithms by a filtration-preserving change, interpolation gives a matrix over $bb(Q) \( upright(i) \)$ with independent rows. A square minor using all rows is nonzero. Clearing its denominators gives an arithmetic lower bound.

For the analytic bound, translate each row to the exact periods and expand in the transverse variables. The index $a$ denotes the chosen transverse coefficient. For a polynomial column $P$,

$ \[ u^a \] P \( e^z \, z + u_1 \, dots.h \, z + u_m \) $

is an entire function of $z$. Rows test its Taylor coefficients after $z = 2 pi upright(i) j + log \( 1 + t \)$. Rows with the same $a$ therefore test the same entire functions. On expanding those functions in $z$, repeated Taylor degrees within that group annihilate a determinant term. Distinct degrees then force a quadratic saving in the group size. This uses the Taylor-expansion mechanism also appearing in #cite(label("laurent2000")) Theorem 1. If many rows have small weighted transverse index, there are too few groups to avoid this saving. If few do, the many large indices instead supply powers of the small rational-approximation errors. Section 3 proves uniform bounds for both alternatives before summing the expansion.

===== 1.2.3 Why full simplices and separated choices matter. <why-full-simplices-and-separated-choices-matter.>

The polynomial degree of $Y$ and those of the $X_i$ share one budget. Both the interpolation volume and the arithmetic column cost therefore come from full simplices. Comparing the row count in dimension $m + 1$ with the transverse-index count in dimension $m$ produces a collision saving that can grow with $m$, while the other errors decrease. Section 4 arranges this for each fixed $nu > 2$, then chooses approximation denominators meeting all the interpolation thresholds. Their independence from centers prevents a circular choice. Only after dimension, weights, and centers have been fixed does the polynomial degree tend to infinity. The final section proves Corollary 2 using a fixed exponent between $2$ and $5 \/ 2$, and establishes the exact convergence criterion in Corollary 12.

===== 1.2.4 Conventions and inputs. <conventions-and-inputs.>

All logarithms are natural; $log \( 1 + t \)$ denotes its power series at zero. Write $upright(i)^2 = - 1$, and let multi-indices have nonnegative integer entries. For them, $alpha ! = product_i alpha_i !$ and $binom(alpha, beta) = product_i binom(alpha_i, beta_i)$, with the latter zero unless $beta lt.eq alpha$ coordinatewise. Geometry is over $bb(C)$, and a curve means an integral algebraic curve. We use polynomial Bézout with isolated local multiplicities, ordinary blowups, nef-plus-ample, eventual Proj recovery, Serre vanishing, and smooth projective models of curves. Their exact hypotheses are checked at use; no prior irrationality bound for $pi$ is assumed.

== 2 Interpolation with separated weights <geom:section>

We prove the interpolation statement used in the determinant argument. Its essential uniformity is that the weights can be chosen before the interpolation points: each coordinate weight has a lower threshold depending on the earlier weights, but not on the locations of the points. The degree at which interpolation becomes surjective is allowed to depend on all the fixed data.

All multi-indices below have nonnegative integer entries. For a positive rational vector $W = \( w_0 \, dots.h \, w_m \)$, the $W$-degree of the monomial $Y^h X_1^(alpha_1) dots.h.c X_m^(alpha_m)$ is $w_0 h + sum_i w_i alpha_i$. Write $cal(P)_W \( H \)$ for the complex vector space of polynomials of $W$-degree at most $H$. For a positive rational vector $V = \( v_0 \, dots.h \, v_m \)$, let $cal(J)_V \( H \)$ be the quotient of $bb(C) \[ \[ t \, u_1 \, dots.h \, u_m \] \]$ by the ideal of series whose monomials all have $V$-weight at least $H$. Thus a vector in $cal(J)_V \( H \)$ is a packet of coefficients indexed by

$ v_0 s + sum_(i = 1)^m v_i beta_i < H . $

The strict inequality in this definition will be used throughout.

#thm([Theorem 2.1.])[
  (Separated-weight interpolation).  #emph[Fix integers $m \, K gt.eq 1$ and positive rational numbers $w_0 \, v_0 \, theta$ such that $0 < theta < 1$ and 
#[#set math.equation(numbering: n => "(2.1)")
 $ K theta^m < 1 \, #h(2em) K w_0 / v_0 theta^m < 1 . $ <geom:volume-hypotheses>]

 There are successive lower thresholds for positive rational numbers $w_1 \, dots.h \, w_m$, depending only on these fixed data and the previously chosen weights, with the following property. Put 
$ W = \( w_0 \, w_1 \, dots.h \, w_m \) \, #h(2em) V = \( v_0 \, w_1 \/ theta \, dots.h \, w_m \/ theta \) . $

 For any points 
$ a_j = \( 1 \, c_(j 1) \, dots.h \, c_(j m) \) in bb(C)^(m + 1) \, #h(2em) 0 lt.eq j < K \, $

 whose coordinates $c_(0 i) \, dots.h \, c_(K - 1 \, i)$ are pairwise distinct for each $i$, the map 
#[#set math.equation(numbering: n => "(2.2)")
 $ cal(P)_W \( H \) & arrow.r xor.big_(j = 0)^(K - 1) cal(J)_V \( H \) \,\
P & mapsto (P #scale(x: 120%, y: 120%)[\(] 1 + t \, \( c_(j i) + u_i + log \( 1 + t \) \)_(i = 1)^m #scale(x: 120%, y: 120%)[\)])_(j = 0)^(K - 1) . $ <geom:jet-map>]

 is surjective for all sufficiently large, sufficiently divisible integers $H$. The divisibility requirement can be chosen using only the weights. The remaining lower threshold for $H$ may depend on the points.]
] <geom:interpolation>

We first establish a numerical inequality on algebraic curves, and then use it to obtain all the jets in (2.2). The local estimate driving the curve argument is recorded separately.

=== 2.1 A local multiplicity comparison <a-local-multiplicity-comparison>

A collection of vector fields is called a #emph[normal basis] to a smooth subvariety at a point if its images form a basis of the ambient tangent space modulo the tangent space of the subvariety. For an irreducible subvariety, this terminology will refer to a general smooth point. There are only finitely many possible index sets in the applications below, so all their generic rank conditions can be checked on one common open subset.

#thm([Lemma 2.2.])[
  (Weighted transverse multiplicity).  #emph[Give the coordinates $x_1 \, dots.h \, x_d$ positive rational degree weights $rho_1 \, dots.h \, rho_d$. On an open subset of $bb(C)^d$, let $D_1 \, dots.h \, D_d$ be commuting analytic vector fields forming a frame, and assign them positive rational costs $kappa_1 \, dots.h \, kappa_d$. Fix $epsilon > 0$.]
  #emph[Let $N > 0$. Suppose that polynomials $f_1 \, dots.h \, f_r$ have weighted degree at most $N$, that $Z$ is an irreducible component of their common zero set of codimension $k gt.eq 1$, and that 
#[#set math.equation(numbering: n => "(2.3)")
 $ D^gamma f_ell \|_Z = 0 quad upright("whenever") quad sum_b kappa_b gamma_b < epsilon N . $ <geom:persistent-derivatives>]

 For any coordinate normal basis $A$ and any $D$-field normal basis $B$, each of cardinality $k$, one has 
#[#set math.equation(numbering: n => "(2.4)")
 $ product_(a in A) rho_a lt.eq 2 k ! thin epsilon^(- k) product_(b in B) kappa_b $ <geom:multiplicity-comparison>]

 The bound is uniform in the equations, the component $Z$, and the analytic frame; no lower threshold for $N$ is required.]
] <geom:multiplicity>

#proof[
  Choose a smooth point $x$ of $Z$ where both normal-basis conditions hold and which lies on no other irreducible component of the common zero set. Flowing from $Z$ along the fields indexed by $B$ gives local analytic coordinates $\( z \, b \)$, where $z$ parametrizes $Z$ and $b = \( b_1 \, dots.h \, b_k \)$ consists of transverse flow parameters. Commutativity implies that the chosen fields are the derivatives in the $b$-directions. Thus (2.3) says that in the expansion
  $ f_ell \( z \, b \) = sum_(alpha in bb(Z)_(gt.eq 0)^k) f_(ell \, alpha) \( z \) b^alpha \, $
  every coefficient function of $B$-weight less than $epsilon N$ vanishes identically on the chosen neighborhood in $Z$.
  Let $S$ be the affine coordinate slice through $x$ obtained by fixing the coordinates outside $A$. It is transverse to $Z$, and the zero set of the restricted equations is isolated at $x$. The flow parameters $b$ give regular analytic coordinates on $S$; the coordinates $z$ become analytic functions $z \( b \)$. Substitution cannot generate a missing term of smaller $B$-weight. Indeed, each surviving summand already contains a monomial $b^alpha$ of weight at least $epsilon N$, and its analytic coefficient has only nonnegative powers of $b$. Consequently the ideal of the restricted equations is contained in the monomial ideal of weight at least $epsilon N$. Its quotient therefore has length at least
  #[#set math.equation(numbering: n => "(2.5)")
   $ \# {alpha in bb(Z)_(gt.eq 0)^k : sum_(b in B) kappa_b alpha_b < epsilon N} gt.eq frac(\( epsilon N \)^k, 2 k ! product_(b in B) kappa_b) $ <geom:local-length-lower>]
  In fact the factor $1 \/ 2$ can be omitted: the simplex ${ x in bb(R)_(gt.eq 0)^k : sum_(b in B) kappa_b x_b < epsilon N }$ is covered by the disjoint half-open unit cubes $alpha + \[ 0 \, 1 \)^k$ indexed by the admissible multi-indices $alpha = floor.l x floor.r$. Its volume is $\( epsilon N \)^k \/ \( k ! product_(b in B) kappa_b \)$. Thus the displayed bound holds for every $N > 0$. Analytic local coordinates preserve finite length, so no radius or coefficient bound for the flow map is needed.
  In the regular local ring of the $k$-dimensional slice, the ideal generated by the restricted equations is primary to the maximal ideal. Over the infinite field $bb(C)$, $k$ sufficiently general constant linear combinations of these equations still have an isolated common zero at $x$: successive generic combinations avoid the finitely many positive-dimensional components that remain. Their ideal is contained in the original ideal. Their quotient length is therefore an upper bound for the length in (2.5).
  Each of the $k$ combinations has weighted degree at most $N$ in the variables indexed by $A$. We claim that their local intersection length is at most
  #[#set math.equation(numbering: n => "(2.6)")
   $ frac(N^k, product_(a in A) rho_a) . $ <geom:weighted-bezout>]
  Choose an integer $M_0$ clearing the denominators of the $rho_a$, and make the substitutions
  $ x_a = lambda_a + z_a^(M_0 rho_a) #h(2em) \( a in A \) . $
  Choose the constants $lambda_a$ so that no preimage of the given point is ramified. There are $product_(a in A) \( M_0 rho_a \)$ such preimages, each with the same local intersection length. The substituted polynomials have ordinary total degree at most $M_0 N$. The ordinary Bézout bound for isolated complete-intersection zeros, with their local multiplicities, bounds the sum of these lengths by $\( M_0 N \)^k$; see #cite(label("mondal2021")) Corollary VIII.3, p. 144. The multiplicities there are local quotient lengths, unchanged by completion #cite(label("mondal2021")) Section IV.4.2. Dividing gives (2.6). This application concerns isolated zeros only and permits other components elsewhere.
  Combining (2.5) and (2.6) proves the result. Neither the polynomials nor the possibly varying component enters the constant in (2.4). ◻
]

=== 2.2 The curve inequality <the-curve-inequality>

Choose a positive rational number $sigma$ sufficiently small that

#[#set math.equation(numbering: n => "(2.7)")
 $ \( 1 + 3 sigma \)^(m + 1) K \( w_0 \/ v_0 \) theta^m & < 1 \,\
\( 1 + 3 sigma \)^m K theta^m & < 1 \,\
\( 1 + sigma \) theta & < 1 . $ <geom:sigma>]

This choice is possible by (2.1). Set $v_i = w_i \/ theta$ for $i > 0$. Fix $L_0 = m + 2$ and put

#[#set math.equation(numbering: n => "(2.8)")
 $ C_(*) = max_(1 lt.eq k lt.eq m) 2 k ! \( L_0 \/ sigma \)^k . $ <geom:constant>]

We choose the positive weights successively so that for every pair of subsets $A \, B subset.eq { 0 \, dots.h \, m }$ of the same cardinality between $1$ and $m$,

#[#set math.equation(numbering: n => "(2.9)")
 $ product_(a in A) w_a > C_(*) product_(b in B) v_b $ <geom:separation>]

whenever the largest positive index in their symmetric difference belongs to $A$.

Here and below a condition involving that largest index is imposed only when a positive index does differ. The successive choice is possible: if this largest index is $i$, the ratio in (2.9) is $w_i$ times a positive expression in the already chosen lower weights and the fixed zeroth weights. Every higher index occurs in both sets or in neither; in the former case its ratio is $w_j \/ v_j = theta$. Hence the expression is independent of all higher weights. There are finitely many pairs of sets. A sufficiently large choice of $w_i$ enforces all conditions whose largest differing index is $i$, and subsequent choices do not disturb them. This construction involves no interpolation point.

Let $C$ be an irreducible algebraic curve whose generic point lies in the affine coordinate chart. Such a curve has a smooth projective model over $bb(C)$; see #cite(label("stacks")) Theorem 53.2.6 and Lemma 53.2.8, Tag 0BXX. On that model define

#[#set math.equation(numbering: n => "(2.10)")
 $ deg_W C = sum_P max {0 \, - frac("ord"_P Y, w_0) \, - frac("ord"_P X_1, w_1) \, dots.h \, - frac("ord"_P X_m, w_m)} . $ <geom:curve-degree>]

The order of an identically zero coordinate is understood as $+ oo$; it contributes no pole. At a branch $P$ through $a_j$, set

#[#set math.equation(numbering: n => "(2.11)")
 $ h_P = min {frac("ord"_P \( Y - 1 \), v_0) \, frac("ord"_P \( X_1 - c_(j 1) - log Y \), v_1) \, dots.h \, frac("ord"_P \( X_m - c_(j m) - log Y \), v_m)} . $ <geom:branch-contact>]

The logarithm here is its formal expansion at $Y = 1$. All entries have positive order, possibly infinite, and their minimum is finite on a nonconstant curve.

#thm([Proposition 2.3.])[
  (Curve inequality).  #emph[With the weights chosen above, every such curve satisfies 
#[#set math.equation(numbering: n => "(2.12)")
 $ deg_W C gt.eq \( 1 + sigma \) sum_(P mapsto a_j) h_P \, $ <geom:curve-bound>]

 where the sum includes all branches through the prescribed points.]
] <geom:curve-inequality>

#proof[
  There is nothing to prove if the curve misses all the points. Suppose instead that (2.12) fails. For every sufficiently large auxiliary integer $N$, linear algebra gives a nonzero polynomial $F_N$ of $W$-degree at most $N$ whose expansions at all the points have $V$-order at least $\( 1 + 3 sigma \) N$. Indeed, the number of its coefficients has leading term
  $ frac(N^(m + 1), \( m + 1 \) ! product_(a = 0)^m w_a) \, $
  whereas the number of conditions has leading term
  $ frac(K \( 1 + 3 sigma \)^(m + 1) N^(m + 1), \( m + 1 \) ! product_(a = 0)^m v_a) . $
  Their comparison is the first inequality in (2.7). This argument requires no independence among the conditions.
  On the open set $Y eq.not 0$ consider the commuting frame
  #[#set math.equation(numbering: n => "(2.13)")
   $ D_0 = Y partial_Y + sum_(i = 1)^m partial_(X_i) \, #h(2em) D_i = partial_(X_i) quad \( 1 lt.eq i lt.eq m \) . $ <geom:frame>]
  It preserves polynomial degree at most $N$. In the formal coordinates of (2.2),
  $ D_0 = \( 1 + t \) partial_t \, #h(2em) D_i = partial_(u_i) . $
  Thus differentiation by $D_a$ decreases weighted order by at most $v_a$. Every $D^gamma F_N$ with $sum_a v_a gamma_a lt.eq sigma N$ retains order at least $\( 1 + 2 sigma \) N$ at each point. On a branch $P$, its order is consequently at least $\( 1 + 2 sigma \) N h_P$.
  A polynomial of $W$-degree at most $N$ restricts to a rational function on the complete model of $C$ with total pole degree at most $N deg_W C$. Since we assumed that (2.12) fails, the just obtained total zero order exceeds this pole bound. The ordinary divisor equality for a nonzero rational function therefore forces
  #[#set math.equation(numbering: n => "(2.14)")
   $ D^gamma F_N \|_C = 0 #h(2em) (sum_a v_a gamma_a lt.eq sigma N) . $ <geom:derivatives-on-curve>]
  All the assertions about branch orders hold for formal power series: each monomial has order at least its weight times $h_P$, and cancellation can only increase the order.
  We have converted excess contact into vanishing of many derivatives on $C$. We next find a component on which that vanishing persists, as in the derivative-ideal method of zero estimates #cite(label("philippon1986")) Section 5, and compare all its normal bases. Put $delta = sigma N \/ L_0$. For $0 lt.eq r lt.eq L_0$, let $V_r$ be the common zero set in $Y eq.not 0$ of the derivatives of cost at most $r delta$. Let $C^compose$ be the part of $C$ in this affine open set. The $V_r$ form a decreasing chain, and (2.14) puts $C^compose$ in $V_(L_0)$. Choose an irreducible component of $V_(L_0)$ containing $C^compose$, and extend it backwards to nested irreducible components of the earlier $V_r$. Every selected component has dimension between $1$ and $m$: it contains a curve, and it lies in the proper zero set of $F_N$. Since there are $L_0 + 1 = m + 3$ levels, two adjacent selected components coincide. Denote this persistent component by $Z$, and write $k = "codim" Z$.
  Take the derivatives of cost at most $r delta$ as the equations of the earlier of these two levels. Any further derivative of cost less than $delta$ vanishes along $Z$, because the fields commute and $Z$ is also a component at the next level. Lemma 4, with $epsilon = sigma \/ L_0$, gives
  #[#set math.equation(numbering: n => "(2.15)")
   $ product_(a in A) w_a lt.eq C_(*) product_(b in B) v_b $ <geom:all-bases>]
  for every coordinate normal basis $A$ and every frame normal basis $B$. The equations and $Z$ may vary with $N$; the uniformity proved in Lemma 4 is exactly what permits this use.
  We show that $Y$ is constant on $Z$, working on the common smooth open subset where all the normal-basis conditions hold. Suppose first that some positive coordinate direction is nontangent to $Z$, and choose the largest such index $i$. Every larger positive index occurs in neither kind of normal basis, since $D_j = partial_(X_j)$ for $j > 0$. Some coordinate normal basis $A$ contains $i$. If a frame normal basis $B$ omitted $i$, the largest positive index where these sets differ would be $i$. Then (2.9) would contradict (2.15). Thus every frame normal basis contains $D_i$.
  The other frame vectors consequently fail to span the normal quotient. Their ambient span is the hyperplane
  $ ker \( d X_i - d Y \/ Y \) . $
  For an ambient hyperplane $Q$ and a tangent space $T$, the image of $Q$ in the quotient by $T$ fails to be surjective precisely when $T subset.eq Q$. We obtain
  #[#set math.equation(numbering: n => "(2.16)")
   $ d X_i = d Y \/ Y quad upright("on ") Z . $ <geom:log-differential>]
  This identity forces $Y$ to be constant on the algebraic variety $Z$. Indeed, if $Y$ were nonconstant, choose a smooth point where $d Y eq.not 0$ and intersect with general algebraic hyperplanes through that point until a curve remains on which $Y$ is nonconstant. On the smooth complete model of this curve, (2.16) is an identity of meromorphic differentials. A nonconstant meromorphic function $Y$ has a zero or pole, where $d Y \/ Y$ has nonzero residue $"ord"_P Y$. An exact differential $d X_i$ has zero residue at every point. This is a contradiction. It follows also that $X_i$ is constant, since $d X_i = 0$ in characteristic zero.
  If instead every positive coordinate direction is tangent, the $m$ independent vectors $partial_(X_i)$ all lie in the tangent space of $Z$. Properness forces that tangent space to be their span, and $d Y = 0$ on $Z$ again. We conclude in all cases that $Y$ is constant on $Z$. Since $C^compose subset.eq Z$ meets a prescribed point with $Y = 1$, we have $Y = 1$ on $C^compose$, and hence on $C$ by density.
  It remains to rule out a violating curve in that fiber. We work with $C^compose$ in the affine fiber $Y = 1$, while computing orders and degrees on the complete model of $C$ as before. In this fiber, the degree weights are $w_i$, the order weights are $v_i = w_i \/ theta$, and $h_P = min_i "ord"_P \( X_i - c_(j i) \) \/ v_i$. Choose a new auxiliary polynomial in these $m$ variables. The ratio of the number of vanishing conditions to the number of coefficients now tends to $K \( 1 + 3 sigma \)^m theta^m < 1$, by the second inequality in (2.7). Thus, for sufficiently large $N$, there is a nonzero polynomial $G_N \( X_1 \, dots.h \, X_m \)$ of weighted degree at most $N$ and order at least $\( 1 + 3 sigma \) N$ at every center.
  An ordinary partial derivative of cost at most $sigma N$ still has order at least $\( 1 + 2 sigma \) N$ at every center and degree at most $N$. The same zero–pole comparison on $C$ therefore gives
  $ partial_X^gamma G_N \|_C = 0 #h(2em) (sum_(i = 1)^m v_i gamma_i lt.eq sigma N) . $
  If $m = 1$, this is already impossible: a nonzero polynomial on the affine line cannot vanish on a curve. Suppose henceforth that $m gt.eq 2$. For $0 lt.eq r lt.eq L_0$, let $U_r$ be the common zero set in this fiber of the partial derivatives of $G_N$ of cost at most $r delta$, with $delta = sigma N \/ L_0$ as before. The curve $C^compose$ lies in $U_(L_0)$. Choose nested irreducible components containing $C^compose$ backwards through this chain. Their dimensions lie between $1$ and $m - 1$, since $G_N$ is nonzero, so two adjacent components coincide in a component $Z'$. Its codimension in the fiber satisfies $1 lt.eq k lt.eq m - 1$.
  For the equations at the earlier of these two levels, every further partial derivative of cost less than $delta$ vanishes on $Z'$. Lemma 4, again with $epsilon = sigma \/ L_0$, therefore gives (2.15) for $Z'$, with the same $C_(*)$ and with normal-basis index sets contained in ${ 1 \, dots.h \, m }$.
  Here the coordinate and frame bases are the same. They must have a unique index set: two different basis sets could be ordered so that the largest differing index belongs to $A$, contradicting (2.9). The codimension is positive, so this unique normal basis has some index $i$. The other coordinate directions fail to span the normal quotient; hence the tangent space is contained in $ker d X_i$, and $X_i$ is constant on $Z'$. Coordinatewise distinctness shows that $Z'$ meets at most one prescribed point. Every prescribed point of $C$ belongs to $C^compose subset.eq Z'$, so the same holds for $C$.
  Let that point be $a_j$. Choose a coordinate $X_l$ nonconstant on $C$. The nonzero rational function $X_l - c_(j l)$ has total pole degree at most $w_l deg_W C$, and at each branch through $a_j$ it has order at least $\( w_l \/ theta \) h_P$. Therefore
  $ deg_W C gt.eq theta^(- 1) sum_(P mapsto a_j) h_P > \( 1 + sigma \) sum_(P mapsto a_j) h_P \, $
  by the last inequality in (2.7). This final contradiction proves (2.12). ◻
]

=== 2.3 From the curve inequality to all coefficient packets <from-the-curve-inequality-to-all-coefficient-packets>

We complete the proof of Theorem 3. The argument uses ordinary projective schemes and the ordinary blow-up; smoothness or normality of the compactification will not be needed. Curve positivity and asymptotic jet generation are closely related in the Seshadri-constant approach of #cite(label("demailly1992")) Section 6. Here we supply the passage for our weighted ideals at several points, including the eventual ordinary-power comparison required on a possibly singular scheme.

Choose an integer $R$ sufficiently large that $R \/ w_a$ and $R \/ v_a$ are positive integers for every index. Embed affine space by all monomials of $W$-degree at most $R$, including the constant monomial, and let $X$ be the projective closure of the image. Since these monomials include each coordinate, the chart of the constant monomial is precisely the original affine space. Let $L = cal(O)_X \( 1 \)$, a very ample line bundle.

For any curve meeting this chart,

#[#set math.equation(numbering: n => "(2.17)")
 $ deg \( L \|_C \) = R deg_W C . $ <geom:projective-degree>]

To see this on its smooth complete model, at each point clear the largest pole of the homogeneous monomial coordinates. Every monomial has pole order at most $R$ times the maximum in (2.10). A pure power of one coordinate attains that bound whenever the maximum is positive, and the constant monomial attains it when the maximum is zero. The resulting sections have no common zero, proving (2.17).

To make the local data algebraic, replace $log \( 1 + t \)$ in each coordinate by a fixed Taylor polynomial $G_i \( t \)$ whose omitted terms have $t$-weight strictly greater than $v_i$. Then

$ t = Y - 1 \, #h(2em) u'_i = X_i - c_(j i) - G_i \( t \) $

are regular local coordinates at $a_j$. This replacement preserves $h_P$. Indeed, if $t$ is not identically zero on a branch, each omitted term has order divided by $v_i$ strictly larger than $"ord"_P \( t \) \/ v_0$; if $t$ is identically zero, its tail vanishes. It also preserves interpolation surjectivity for every threshold: the formal coordinate change fixes $t$ and changes $u_i$ only by terms of weight greater than $v_i$. It and its inverse preserve the weighted filtration and induce inverse triangular maps on each finite coefficient packet.

At $a_j$ form the finite-colength ideal

$ I_j = (t^(R \/ v_0) \, \( u'_1 \)^(R \/ v_1) \, dots.h \, \( u'_m \)^(R \/ v_m)) . $

The points are distinct. These local ideals, together with the unit ideal away from the points, define a coherent ideal sheaf $I$ on $X$. For a branch through a center,

#[#set math.equation(numbering: n => "(2.18)")
 $ "ord"_P I = min_a {\( R \/ v_a \) "ord"_P z_a} = R h_P \, #h(2em) z_0 = t \, quad z_i = u'_i . $ <geom:ideal-valuation>]

Let $p : X' arrow.r X$ be the ordinary blow-up of $I$, namely the relative Proj of its Rees algebra, and write

$ I cal(O)_(X') = cal(O)_(X') \( - E \) . $

The scheme $X$ is integral and Noetherian, $I$ is a coherent nonzero ideal, and $E$ is an effective Cartier divisor. The tautological bundle $cal(O)_(X') \( - E \)$ is relatively ample; these are the standard blow-up properties in #cite(label("stacks")) Tags 02OS, 02ND, and 02NS.

Write $A = p^(*) L$ in additive divisor notation. We claim that

#[#set math.equation(numbering: n => "(2.19)")
 $ A - \( 1 + sigma \) E quad upright("is nef") . $ <geom:nef-class>]

For a noncontracted integral curve $Gamma$ upstairs whose image meets the affine chart, the map to its image is birational, since $p$ is an isomorphism away from the finite center. On the complete normalizations, (2.17) and (2.18) give

$ A dot.op Gamma = R deg_W p \( Gamma \) \, #h(2em) E dot.op Gamma = R sum_(P mapsto a_j) h_P . $

Proposition 5 gives the desired nonnegative degree. A curve whose image misses the affine chart avoids the exceptional divisor. A contracted curve has $A$-degree zero and positive degree for $- E$ by relative ampleness. These cases account for every integral curve, proving (2.19).

For sufficiently large $a > 1$, the divisor $a A - E$ is ample. One can see this directly: choose $b$ so that $I ⊗ L^b$ is globally generated. The Rees construction embeds $X'$ in a product $X times bb(P)^r$, with the second hyperplane bundle restricting to $b A - E$. Tensoring with the first very ample bundle makes $\( b + 1 \) A - E$ ample. Now the identity

#[#set math.equation(numbering: n => "(2.20)")
 $ A - E = frac(a - 1, a \( 1 + sigma \) - 1) #scale(x: 120%, y: 120%)[\(] A - \( 1 + sigma \) E #scale(x: 120%, y: 120%)[\)] + frac(sigma, a \( 1 + sigma \) - 1) \( a A - E \) $ <geom:ample-combination>]

expresses $A - E$ as a positive multiple of a nef class plus a positive multiple of an ample class. It is therefore ample; see #cite(label("lazarsfeld")) Corollary 1.4.10. This theorem applies to projective schemes and does not require a smooth blow-up.

For all sufficiently large $n$, the graded-piece and relative vanishing theorems for the ordinary Rees algebra give

#[#set math.equation(numbering: n => "(2.21)")
 $ p_(*) cal(O)_(X') \( - n E \) = I^n \, #h(2em) R^q p_(*) cal(O)_(X') \( - n E \) = 0 quad \( q > 0 \) . $ <geom:rees-pushdown>]

Indeed, on any affine open of the Noetherian base the Rees algebra is a Noetherian graded algebra generated in degree one. Its sufficiently high graded pieces recover the sections of its associated sheaf on Proj, and the higher cohomology of those twists vanishes. A finite affine cover gives one common threshold; see #cite(label("stacks")) Tags 0AG6 and 0AG7. In particular, (2.21) uses ordinary powers $I^n$, not their integral closures, and makes no assertion about small $n$.

By the projection formula, Leray, and Serre vanishing for the ample line bundle $A - E$,

#[#set math.equation(numbering: n => "(2.22)")
 $ H^1 \( X \, I^n ⊗ L^n \) = H^1 \( X' \, cal(O)_(X') \( n \( A - E \) \) \) = 0 $ <geom:serre-vanishing>]

for all sufficiently large $n$; see #cite(label("stacks")) Tag 0B5U. The exact sequence for $I^n$ consequently gives a surjection from $H^0 \( X \, L^n \)$ onto all its local coefficient data modulo $I^n$. The constant projective coordinate trivializes $L$ on the affine chart. Finite-colength local quotients are unchanged by completion, so these algebraic classes are also the formal coefficient data used in the theorem. In these trivializations, every element of $I^n$ has weighted order at least $n R$, because every displayed generator of $I$ has weight $R$. Thus

#[#set math.equation(numbering: n => "(2.23)")
 $ I^n subset.eq { upright("local series of weight at least ") n R } . $ <geom:ideal-inclusion>]

Surjectivity modulo $I^n$ therefore implies surjectivity onto the smaller quotient consisting of the desired packets of weight less than $n R$. Equality in (2.23) is not needed.

Finally, every section of $L^n$ for sufficiently large $n$ is supplied by a homogeneous degree-$n$ polynomial in the projective embedding coordinates. This follows from Serre vanishing applied to the homogeneous ideal sheaf of $X$ in its projective space. Such a polynomial restricts on the affine chart to one of $W$-degree at most $n R$. Taking $H = n R$ and undoing the filtered Taylor-polynomial coordinate change proves the surjectivity in (2.2), and completes the proof of Theorem 3.

== 3 The arithmetic and analytic determinant estimates <det:section>

Interpolation now supplies the algebraic rank needed for an interpolation determinant, in the sense of #cite(label("laurent1991")) Section 6. We estimate one full-row minor from below arithmetically, and then translate its rows to exact logarithmic periods to obtain an analytic upper bound.

Throughout this section all parameters except $H$ are fixed. Write

$ w alpha = sum_(i = 1)^m w_i alpha_i \, #h(2em) w_(*) = min_(1 lt.eq i lt.eq m) w_i \, #h(2em) omega = 2 pi upright(i) . $

Let $nu > 2$, and suppose that integers $p_i$ and $q_i gt.eq 2$ satisfy

#[#set math.equation(numbering: n => "(3.1)")
 $ lr(|pi - p_i / q_i|) lt.eq q_i^(- nu) \, #h(2em) w_i = ceil.l log q_i ceil.r \, #h(2em) r_i = frac(2 upright(i) p_i, q_i) quad \( 1 lt.eq i lt.eq m \) . $ <det:approximations>]

Assume that $p_i eq.not 0$ and that $m \, K \, w_0 \, v_0 \, theta \, w_1 \, dots.h \, w_m$ satisfy the hypotheses of Theorem 3, with centers $c_(j i) = j r_i$, $0 lt.eq j < K$. In particular $w_i$ is a positive integer for $i > 0$, while $w_0$ and $v_0$ are positive rational numbers. Fix $F_0 > 2 \/ theta$, and put

#[#set math.equation(numbering: n => "(3.2)")
 $ T_i = ⌈frac(F_0 w_i, v_0)⌉ \, #h(2em) G_i \( t \) = sum_(1 lt.eq k < T_i) frac(\( - 1 \)^(k + 1) t^k, k) . $ <det:truncations>]

Empty sums are zero. The first omitted term has weight $v_0 T_i gt.eq F_0 w_i > w_i \/ theta$. Consequently the substitution $u_i mapsto u_i + G_i \( t \) - log \( 1 + t \)$ is an invertible substitution preserving the weighted filtration. It induces an invertible map on every finite space of coefficients of weight less than $H$. Thus replacing the logarithms in Theorem 3 by these $G_i$ preserves surjectivity.

=== 3.1 A full-row-rank minor and its arithmetic size <a-full-row-rank-minor-and-its-arithmetic-size>

Use the monomials

$ P \( Y \, X \) = Y^h X^alpha \, #h(2em) h in bb(Z)_(gt.eq 0) \, quad alpha in bb(Z)_(gt.eq 0)^m \, #h(2em) w_0 h + w alpha lt.eq H $

as columns, and the triples

$ rho = \( j \, s \, beta \) \, #h(2em) 0 lt.eq j < K \, quad s in bb(Z)_(gt.eq 0) \, quad beta in bb(Z)_(gt.eq 0)^m \, #h(2em) v_0 s + frac(w beta, theta) < H $

as rows. The matrix entry is the coefficient of $t^s u^beta$ in

#[#set math.equation(numbering: n => "(3.3)")
 $ P #scale(x: 120%, y: 120%)[\(] 1 + t \, j r_1 + G_1 \( t \) + u_1 \, dots.h \, j r_m + G_m \( t \) + u_m #scale(x: 120%, y: 120%)[\)] . $ <det:matrix>]

For all sufficiently large, sufficiently divisible $H$, choose a square minor $Delta_H eq.not 0$ using every row, as permitted by Theorem 3. Denote its size by $M = M_H$, and set

#[#set math.equation(numbering: n => "(3.4)")
 $ macron(b) = macron(b)_H = frac(1, M H) sum_(rho = \( j \, s \, beta \)) w beta . $ <det:bbar>]

The elementary lattice count for a simplex gives

#[#set math.equation(numbering: n => "(3.5)")
 $ M tilde.op frac(K theta^m H^(m + 1), \( m + 1 \) ! thin v_0 product_(i = 1)^m w_i) \, #h(2em) 0 lt.eq macron(b) lt.eq theta . $ <det:row-count>]

Indeed, after scaling by $H$, the lattice boxes of side lengths $H^(- 1)$ are Riemann sums for the fixed simplex. Its volume is $theta^m \/ \( \( m + 1 \) ! v_0 product_i w_i \)$; its boundary has volume zero, so the strict inequality in the row definition does not affect the leading term. We always let $H$ tend to infinity only after all the weights and centers have been fixed.

#thm([Lemma 3.1.])[
  (Arithmetic lower bound).  #emph[Let $Lambda = 4 log 2$, and define 
#[#set math.equation(numbering: n => "(3.6)")
 $ E_(upright("ar")) = frac(Lambda F_0 m, v_0) + Lambda sum_(i = 1)^m 1 / w_i + theta / w_(*) . $ <det:arith-error>]

 Then every minor just chosen satisfies 
#[#set math.equation(numbering: n => "(3.7)")
 $ frac(log \| Delta_H \|, M H) gt.eq - \( 1 - macron(b) \) - E_(upright("ar")) . $ <det:lower>]

]
] <det:arithmetic>

#proof[
  Let $L_i = "lcm" \( 1 \, dots.h \, T_i - 1 \)$, interpreted as $1$ if $T_i = 1$, and put
  $ D_H = product_(i = 1)^m L_i^(floor.l H \/ w_i floor.r) . $
  Scale a column $Y^h X^alpha$ by $product_i q_i^(alpha_i)$ and a row $\( j \, s \, beta \)$ by $product_i q_i^(- beta_i)$. The scaled entry is zero unless $alpha gt.eq beta$ componentwise; otherwise it is
  $ product_i binom(alpha_i, beta_i) \[ t^s \] \( 1 + t \)^h product_i #scale(x: 120%, y: 120%)[\(] q_i \( j r_i + G_i \( t \) \) #scale(x: 120%, y: 120%)[\)]^(alpha_i - beta_i) . $
  Here $q_i j r_i = 2 upright(i) j p_i in bb(Z) \[ upright(i) \]$. Since $G_i$ has coefficients in $L_i^(- 1) bb(Z)$, the denominator of this entry divides $product_i L_i^(alpha_i - beta_i)$, which divides $D_H$. Thus multiplying every entry of the scaled matrix by $D_H$ gives a matrix over $bb(Z) \[ upright(i) \]$ with nonzero determinant. A nonzero Gaussian integer has modulus at least one, so
  #[#set math.equation(numbering: n => "(3.8)")
   $ log \| Delta_H \| & gt.eq - M log D_H - sum_(upright("columns ") alpha) sum_i alpha_i log q_i\
 & quad + sum_(upright("rows ") beta) sum_i beta_i log q_i . $ <det:clearing>]
  For each selected column, $sum_i alpha_i log q_i lt.eq w alpha lt.eq H$. Also $0 lt.eq w_i - log q_i < 1$, and hence
  $ sum_(upright("rows ") beta) sum_i beta_i log q_i gt.eq M H macron(b) - sum_(upright("rows ") beta) sum_i beta_i gt.eq M H macron(b) - frac(M H theta, w_(*)) . $
  For completeness, $log "lcm" \( 1 \, dots.h \, n \) lt.eq Lambda n$. To see this, the factorial valuation formula shows that each prime power in $\( ell \, 2 ell \]$ contributes its logarithmic prime weight to $log binom(2 ell, ell)$; all the other contributions to the latter are nonnegative. Thus the increase of the log least common multiple across this interval is at most $2 ell log 2$. Summing over dyadic intervals up to the smallest power of two above $n$ gives at most $4 n log 2$. Therefore
  $ frac(log D_H, H) lt.eq Lambda sum_i T_i / w_i lt.eq frac(Lambda F_0 m, v_0) + Lambda sum_i 1 / w_i . $
  Substitution in (3.8) proves (3.7). ◻
]

=== 3.2 Translation to entire functions <translation-to-entire-functions>

For every multi-index $a in bb(Z)_(gt.eq 0)^m$ and every selected column $P$, define the entire function

#[#set math.equation(numbering: n => "(3.9)")
 $ f_(a \, P) \( z \) = \[ u^a \] P \( e^z \, z + u_1 \, dots.h \, z + u_m \) . $ <det:test-functions>]

We regard $\( f_(a \, P) \)_P$ as a row vector of entire functions, indexed by the selected columns. For $P = Y^h X^alpha$ it has the explicit entry

#[#set math.equation(numbering: n => "(3.10)")
 $ f_(a \, P) \( z \) = cases(delim: "{", binom(alpha, a) e^(h z) z^(\| alpha \| - \| a \|) \, & a lt.eq alpha \,, 0 \, & upright("otherwise") .) $ <det:test-monomials>]

In particular only indices $a$ with $w a lt.eq H$ can contribute.

#thm([Lemma 3.2.])[
  (Exact row translation).  #emph[Every row $rho = \( j \, s \, beta \)$ of (3.3) is a sum of at most 
#[#set math.equation(numbering: n => "(3.11)")
 $ Q_H = \( floor.l H floor.r + 1 \)^(2 m) \( floor.l H \/ v_0 floor.r + 1 \) $ <det:term-count>]

 scalar multiples of row vectors of the form 
$ #scale(x: 120%, y: 120%)[\(] \[ t^ell \] f_(a \, P) \( j omega + log \( 1 + t \) \) #scale(x: 120%, y: 120%)[\)]_P \, #h(2em) a gt.eq beta \, quad w a lt.eq H \, quad 0 lt.eq ell lt.eq s . $

 Each scalar $xi$ occurring with index $a$ satisfies 
#[#set math.equation(numbering: n => "(3.12)")
 $ \| xi \| & lt.eq exp { - nu w \( a - beta \) + H E_(upright("tr")) } \,\
E_(upright("tr")) & = nu / F_0 + frac(log 2, v_0) + frac(log 4 + log \( 2 K \) + nu, w_(*)) . $ <det:translation-bound>]

]
] <det:translation>

#proof[
  Put
  $ epsilon.alt_i = j \( r_i - omega \) \, #h(2em) tau_i \( t \) = G_i \( t \) - log \( 1 + t \) . $
  Since $e^(j omega) = 1$, the substitutions in (3.3) can be written as $Y = e^z$, $X_i = z + u_i + epsilon.alt_i + tau_i \( t \)$, where $z = j omega + log \( 1 + t \)$. Expanding first in the variables $u_i$, then in the constants $epsilon.alt_i$ and tails $tau_i$, gives the exact row vector identity
  #[#set math.equation(numbering: n => "(3.13)")
   $ upright("row")_(j \, s \, beta) =  & sum_(a gt.eq beta\
w a lt.eq H) binom(a, beta) sum_(0 lt.eq d lt.eq a - beta) binom(a - beta, d) epsilon.alt^(a - beta - d) sum_(k = 0)^s (\[ t^k \] product_i tau_i \( t \)^(d_i))\
 & #h(35mm)  dot.op #scale(x: 120%, y: 120%)[\(] \[ t^(s - k) \] f_(a \, P) \( j omega + log \( 1 + t \) \) #scale(x: 120%, y: 120%)[\)]_P . $ <det:row-identity>]
  All scalar factors in this identity are independent of the column $P$. This is therefore an identity to which determinant multilinearity applies directly.
  The product of tails vanishes to order at least $sum_i d_i T_i$. Consequently a nonzero coefficient in (3.13) satisfies
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_i d_i w_i lt.eq v_0 / F_0 sum_i d_i T_i lt.eq frac(v_0 s, F_0) < H / F_0 . $ <det:tail-budget>]
  On $\| t \| = 1 \/ 2$,
  $ \| tau_i \( t \) \| lt.eq sum_(k gt.eq T_i) 2^(- k) / k lt.eq 1 . $
  Cauchy’s coefficient estimate thus bounds the tail coefficient in (3.13) by $2^k lt.eq 2^s$. From (3.1),
  $ \| epsilon.alt_i \| lt.eq 2 K q_i^(- nu) lt.eq 2 K e^nu e^(- nu w_i) . $
  Moreover $binom(a, beta) binom(a - beta, d) lt.eq 4^(\| a \|)$ and $\| a \| lt.eq H \/ w_(*)$. Combining these inequalities and using (3.14) gives
  $ log \| xi \| lt.eq - nu w \( a - beta \) + frac(nu H, F_0) + frac(H log 2, v_0) + frac(H \( log 4 + log \( 2 K \) + nu \), w_(*)) $
  for each nonzero scalar. A zero scalar obeys the required bound as well. Finally, each coordinate of $a$ and $d$ is at most $H$ because $w_i gt.eq 1$, while $0 lt.eq k lt.eq H \/ v_0$. This proves the term count and the Lemma. ◻
]

=== 3.3 Repeated Taylor degrees force a quadratic saving <repeated-taylor-degrees-force-a-quadratic-saving>

The Taylor expansion of interpolation determinants eliminates repeated degrees #cite(label("laurent2000")) Theorem 1. Our rows fall into different transverse-index groups, so this cancellation is used only inside a fixed group. The next bound is uniform over all row choices.

#thm([Lemma 3.3.])[
  (Collision estimate).  #emph[Choose one translated test row from each row expansion in Lemma 7, and remove its scalar factor. Let $T$ be the resulting square matrix, and let $n_a$ be the number of its rows with index $a$. With 
#[#set math.equation(numbering: n => "(3.15)")
 $ c = frac(log 2, 4) \, #h(2em) E_(upright("hol")) = frac(100 K, w_0) + frac(log 2, v_0) + frac(log \( 200 K \), w_(*)) \, $ <det:hol-error>]

 there is a quantity $rho_H arrow.r 0$, independent of all these row choices and of the selected columns, such that 
#[#set math.equation(numbering: n => "(3.16)")
 $ \| det T \| lt.eq exp {- c sum_a n_a^2 + M H \( E_(upright("hol")) + rho_H \)} . $ <det:collision-bound>]

]
] <det:collision>

#proof[
  Put $R = 100 K$. Equation (3.10) gives, on $\| z \| lt.eq R$,
  $ \| f_(a \, P) \( z \) \| lt.eq exp {H (R / w_0 + frac(log \( 2 R \), w_(*)))} = : cal(D)_H . $
  Expand
  $ f_(a \, P) \( z \) = sum_(d gt.eq 0) c_(a \, d \, P) \( z \/ R \)^d . $
  Cauchy’s estimate gives $\| c_(a \, d \, P) \| lt.eq cal(D)_H$. A row of $T$ is a test of order $ell lt.eq s$ at some center $j$. Since
  $ \| j omega + log \( 1 + t \) \| lt.eq 2 pi \( K - 1 \) + log 2 < 50 K = R \/ 2 #h(2em) \( \| t \| = 1 \/ 2 \) \, $
  its value on $\( z \/ R \)^d$ has modulus at most $2^ell 2^(- d)$.
  Expand the determinant in these power-series rows. The expansion is absolutely convergent: a coefficient determinant has modulus at most $M ! cal(D)_H^M$, and the sum of the product bounds $2^(- d)$ over all degrees is finite. If two rows have the same pair $\( a \, d \)$, their coefficient vectors $\( c_(a \, d \, P) \)_P$ agree, and that summand vanishes. Thus every nonzero summand has distinct degrees within each group $a$, and so
  $ sum_(upright("rows")) d gt.eq sum_a binom(n_a, 2) . $
  Use half of the geometric decay for this lower bound and sum the other half freely over all nonnegative degrees. Since $sum ell lt.eq M H \/ v_0$, this gives
  $ \| det T \| lt.eq M ! cal(D)_H^M 2^(M H \/ v_0) 2^(- 1 / 2 sum_a binom(n_a, 2)) \( 1 - 2^(- 1 \/ 2) \)^(- M) . $
  Because $sum_a n_a = M$, the asserted inequality follows with, for example,
  $ rho_H = frac(log M + 1 / 4 log 2 - log \( 1 - 2^(- 1 \/ 2) \), H) . $
  Equation (3.5) shows that $rho_H arrow.r 0$ with the fixed parameters stipulated above. ◻
]

=== 3.4 A comparison with two alternatives <a-comparison-with-two-alternatives>

Put

#[#set math.equation(numbering: n => "(3.17)")
 $ E_(upright("an")) = E_(upright("tr")) + E_(upright("hol")) . $ <det:analytic-error>]

Let $0 < A < 1$ set a cutoff $A H$ for transverse weights, and let $0 < eta < 1$ be a fraction of rows. The main arithmetic cost is $1 - macron(b)$. In each term of the determinant expansion, if at least $eta M$ rows have $w a lt.eq A H$, they give a collision saving; otherwise the rows with $w a > A H$ supply approximation-error factors. We seek a saving larger than $1 - macron(b) + E_(upright("ar")) + E_(upright("an"))$, and choose $A$ and $eta$ in Section 4.

#thm([Proposition 3.4.])[
  (Determinant comparison).  #emph[Let $0 < A < 1$ and $0 < eta < 1$, and define 
#[#set math.equation(numbering: n => "(3.18)")
 $ g = nu #scale(x: 120%, y: 120%)[\(] A \( 1 - eta \) - theta #scale(x: 120%, y: 120%)[\)] - \( 1 - theta \) \, #h(2em) L = frac(eta^2 K theta^m, \( m + 1 \) v_0 A^m) . $ <det:budgets>]

 The approximations (3.1) and the interpolation hypotheses cannot hold simultaneously if 
#[#set math.equation(numbering: n => "(3.19)")
 $ g > 0 \, #h(2em) E_(upright("ar")) + E_(upright("an")) < g \, #h(2em) c L > 1 + E_(upright("ar")) + E_(upright("an")) . $ <det:contradiction-conditions>]

]
] <det:comparison>

#proof[
  Let
  $ D_A \( H \) = \# { a in bb(Z)_(gt.eq 0)^m : w a lt.eq A H } \, #h(2em) L_H = frac(eta^2 M, H D_A \( H \)) . $
  The simplex count, now in dimension $m$, and (3.5) show that
  $ D_A \( H \) tilde.op frac(\( A H \)^m, m ! product_i w_i) \, #h(2em) L_H arrow.r L . $
  Expand $Delta_H$ by the row identities in Lemma 7. For a choice of terms with indices $a_rho$, the product of their scalar factors has modulus at most
  $ exp {- nu sum_rho w a_rho + nu M H macron(b) + M H E_(upright("tr"))} . $
  There are at most $Q_H^M$ term choices. Apply Lemma 8 to each one.
  Suppose first that at least $eta M$ of its indices obey $w a lt.eq A H$. There are at most $D_A \( H \)$ such indices, so Cauchy–Schwarz gives
  $ sum_a n_a^2 gt.eq frac(\( eta M \)^2, D_A \( H \)) = M H L_H . $
  The scalar main exponent $- nu sum_rho w \( a_rho - beta_rho \)$ is nonpositive, because $a_rho gt.eq beta_rho$. Discarding it leaves an upper bound $- c L_H + E_(upright("an")) + rho_H$ after division by $M H$.
  In the other case, more than $\( 1 - eta \) M$ indices have $w a > A H$. Hence $sum_rho w a_rho gt.eq M H A \( 1 - eta \)$. Discarding the nonpositive collision term leaves the upper bound $- nu \( A \( 1 - eta \) - macron(b) \) + E_(upright("an")) + rho_H$. Taking absolute values before summing the determinant expansion gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ frac(log \| Delta_H \|, M H) & lt.eq E_(upright("an")) + epsilon_H + max { - c L_H \, - nu \( A \( 1 - eta \) - macron(b) \) } \,\
epsilon_H & = rho_H + frac(log Q_H, H) arrow.r 0 . $ <det:upper>]
  All bounds here are uniform over the row-term choices.
  For the second alternative, the gap between the two main exponents is at least $g$, since $macron(b) lt.eq theta$ gives
  $ nu \( A \( 1 - eta \) - macron(b) \) - \( 1 - macron(b) \) = nu A \( 1 - eta \) - 1 - \( nu - 1 \) macron(b) gt.eq g . $
  Under (3.19), both quantities inside the maximum in (3.20), after adding $E_(upright("an")) + epsilon_H$, are strictly less than $- \( 1 - macron(b) \) - E_(upright("ar"))$ for all sufficiently large $H$. For the first quantity, use $L_H arrow.r L$ and $1 - macron(b) lt.eq 1$; for the second, use the displayed uniform gap. This contradicts Lemma 6. ◻
]

== 4 Choice of parameters and proof of Theorem 1 <sec:parameters>

We now combine the interpolation theorem and the determinant estimates. The order of choices is essential: the dimension is fixed before the approximation scales, and all these data are fixed before the polynomial degree tends to infinity.

#thm([Lemma 4.1.])[
  #emph[For every real $nu > 2$, there are positive rational numbers $theta \, A \, B \, C$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ 0 < theta < A < B < 1 \, #h(2em) nu \( A - theta \) > 1 - theta \, #h(2em) C > 1 \, quad B < 1 \/ C \, quad B < C theta < 1 . $ <par:inequalities>]

 One can then choose $0 < eta < 1$ such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ g := nu #scale(x: 120%, y: 120%)[\(] A \( 1 - eta \) - theta #scale(x: 120%, y: 120%)[\)] - \( 1 - theta \) > 0 . $ <par:gap>]

]
] <par:constants>

#proof[
  Choose a rational $b$ with $1 \/ 2 < b < 1 - 1 \/ nu$. For a sufficiently small positive rational $delta$, put $theta = 1 - delta$ and $A = 1 - b delta$. Then $0 < theta < A < 1$, and
  $ nu \( A - theta \) - \( 1 - theta \) = #scale(x: 120%, y: 120%)[\(] nu \( 1 - b \) - 1 #scale(x: 120%, y: 120%)[\)] delta > 0 \, $
  whereas
  $ theta - A^2 = \( 2 b - 1 \) delta - b^2 delta^2 > 0 . $
  It follows that the interval $\( A \/ theta \, 1 \/ A \)$ is nonempty. Choose a rational $C$ in this interval. Since $A > theta$, we have $C > 1$; since $theta < A$, we also have $C theta < theta \/ A < 1$. Now choose a rational $B$ between $A$ and $min \( 1 \/ C \, C theta \)$. This proves (4.1). Finally, the strict inequality at $eta = 0$ allows a sufficiently small $eta > 0$ in (4.2). ◻
]

The two inequalities used in this construction have different roles. The inequality $nu \( A - theta \) > 1 - theta$ supplies the approximation-error gap. The inequality $A^2 < theta$ permits $A \/ theta < C < 1 \/ A$, and hence a choice of $B$ for which $C B < 1$, $C theta \/ B > 1$, and $B \/ A > 1$. With the full-simplex counts of Section 3, these three ratios make the dimension-dependent errors tend to zero while the collision saving tends to infinity. We now choose one finite dimension realizing both requirements; it will remain fixed throughout the degree limit.

#proof[
  Fix $nu > 2$. Suppose for a contradiction that there are arbitrarily large positive integers $q$ for which some $p in bb(Z)$ satisfies
  #[#set math.equation(numbering: n => "(4.3)")
   $ lr(|pi - p / q|) lt.eq q^(- nu) . $ <par:good>]
  Fix $theta \, A \, B \, C \, eta \, g$ from Lemma 10, and put $epsilon_0 = min \( g \/ 2 \, 1 \/ 2 \)$. First choose $F_0 > 2 \/ theta$ so large that $nu \/ F_0 < epsilon_0 \/ 3$.
  For an integer $m$, set
  #[#set math.equation(numbering: n => "(4.4)")
   $ K = floor.l C^m floor.r \, #h(2em) w_0 = B^(- m) \, #h(2em) v_0 = 2 K theta^m w_0 . $ <par:dimension>]
  These are admissible rational interpolation data:
  #[#set math.equation(numbering: n => "(4.5)")
   $ K theta^m lt.eq \( C theta \)^m < 1 \, #h(2em) K w_0 / v_0 theta^m = 1 / 2 . $ <par:volume>]
  The relevant limits as $m arrow.r oo$ are
  #[#set math.equation(numbering: n => "(4.6)")
   $ K / w_0 lt.eq \( C B \)^m arrow.r 0 \, #h(2em) v_0 tilde.op 2 (frac(C theta, B))^m arrow.r oo \, #h(2em) m / v_0 arrow.r 0 . $ <par:limits>]
  With the notation of Proposition 9, these choices give
  #[#set math.equation(numbering: n => "(4.7)")
   $ L = frac(eta^2 K theta^m, \( m + 1 \) v_0 A^m) = frac(eta^2 \( B \/ A \)^m, 2 \( m + 1 \)) arrow.r oo . $ <par:collision-growth>]
  Thus, with $Lambda = 4 log 2$ and $c = \( log 2 \) \/ 4$, choose $m$ large enough that
  #[#set math.equation(numbering: n => "(4.8)")
   $ frac(Lambda F_0 m + 2 log 2, v_0) + frac(100 K, w_0) < epsilon_0 / 3 \, #h(2em) c L > 2 . $ <par:dimension-margin>]
  Fix this $m$, and hence $K \, w_0 \, v_0$.
  The remaining constants are now fixed. Choose approximations $p_i \/ q_i$ satisfying (4.3), with $w_i = ceil.l log q_i ceil.r$, successively sufficiently large for Theorem 3 and, in addition, for
  #[#set math.equation(numbering: n => "(4.9)")
   $ Lambda sum_(i = 1)^m 1 / w_i + frac(theta + log 4 + log \( 2 K \) + nu + log \( 200 K \), w_(*)) < epsilon_0 / 3 \, #h(2em) w_(*) = min_(i > 0) w_i . $ <par:weight-margin>]
  This is possible: first impose a sufficiently large lower bound on every $w_i$, using $sum_i 1 \/ w_i lt.eq m \/ w_(*)$, and then impose the successive geometric thresholds. The assumed denominators are unbounded, so every finite sequence of such requirements can be met. The thresholds for weight separation are independent of the centers. For sufficiently large $q_i$, $p_i eq.not 0$, and hence $c_(j i) = j r_i$, $r_i = 2 upright(i) p_i \/ q_i$, are distinct across $j$ in each coordinate. No independence between different coordinates is required.
  Using (3.6), (3.12), (3.15), and (3.17), the sum of errors is exactly
  $ E_(upright("ar")) + E_(upright("an")) & = nu / F_0 + frac(Lambda F_0 m + 2 log 2, v_0) + frac(100 K, w_0)\
 & quad + Lambda sum_i 1 / w_i + frac(theta + log 4 + log \( 2 K \) + nu + log \( 200 K \), w_(*)) . $
  Our three choices make this less than $epsilon_0$. In particular it is less than $g$, while $c L > 2 > 1 + E_(upright("ar")) + E_(upright("an"))$. All hypotheses of Proposition 9 now hold, a contradiction. The degree $H$ in that Proposition tends to infinity only after the dimension, weights, and centers just chosen are fixed.
  We have excluded (4.3) for arbitrarily large $q$, for each fixed $nu > 2$. This gives the required eventual lower bound, in fact with a strict inequality. The contradiction allowed unreduced fractions and zero error. If $pi$ were rational, exact representations with arbitrarily large denominators would contradict it; hence $pi$ is irrational.
  Finally divide the unit interval into $N$ equal parts and apply pigeonhole to $0 \, pi \, dots.h \, N pi$ modulo one. There exist $p in bb(Z)$ and $1 lt.eq q lt.eq N$ such that
  $ 0 < lr(|pi - p / q|) lt.eq frac(1, q N) lt.eq 1 / q^2 . $
  After reduction, the same error is at most the inverse square of the reduced denominator. These errors tend to zero as $N arrow.r oo$; irrationality forces the reduced denominators to be unbounded. Every exponent less than two therefore occurs infinitely often in the defining inequality. Hence $mu \( pi \) gt.eq 2$, and the upper bound already proved gives $mu \( pi \) = 2$. ◻
]

== 5 Flint–Hills series and its generalization <sec:series>

We first prove Corollary 2. Alekseyev showed that convergence of the classical Flint–Hills series requires $mu \( pi \) lt.eq 5 \/ 2$ #cite(label("alekseyev")) Corollary 4; Meiburg proved that $mu \( pi \) < 5 \/ 2$ is sufficient #cite(label("meiburg")) Theorem 2.5. We include the short spacing argument needed for the consequence of Theorem 1. Write $parallel x parallel = min_(p in bb(Z)) \| x - p \|$ for distance to the nearest integer.

#thm([Lemma 5.1.])[
  (Dyadic spacing estimate).  #emph[Let $alpha > 0$ be irrational. Suppose that, for some $c > 0$ and $1 < nu < 5 \/ 2$, 
$ parallel q alpha parallel gt.eq c q^(1 - nu) #h(2em) \( q in bb(Z) \, med q gt.eq 1 \) . $

 Then 
$ sum_(q = 1)^oo frac(1, q^3 parallel q alpha parallel^2) < oo . $

]
] <series:dyadic>

#proof[
  Fix a positive integer $K$, and put $d = c \( 2 K \)^(1 - nu)$. For $K lt.eq q < 2 K$, the points $q alpha$ on the circle $bb(R) \/ bb(Z)$ have distance at least $d$ from zero. Two distinct such points also have circle distance at least $d$: apply the hypothesis to their nonzero integer difference, whose absolute value is less than $2 K$, and use $1 - nu < 0$.
  On either half-circle starting at zero, arrange the distances in increasing order. Their first distance is at least $d$, and each successive distance increases by at least $d$. Thus these distances are at least $d \, 2 d \, 3 d \, dots.h$. No positive integer multiple of $alpha$ lies at either endpoint of a half-circle. Consequently
  $ sum_(K lt.eq q < 2 K) frac(1, q^3 parallel q alpha parallel^2) lt.eq frac(2, K^3 d^2) sum_(j = 1)^oo 1 / j^2 = O #scale(x: 120%, y: 120%)[\(] K^(2 nu - 5) #scale(x: 120%, y: 120%)[\)] . $
  The implied constant depends only on $c$ and $nu$. Since $2 nu - 5 < 0$, summing over $K = 1 \, 2 \, 4 \, dots.h$ proves the assertion. ◻
]

#proof[
  Fix a real number $nu$ with $2 < nu < 5 \/ 2$, and choose a positive integer $Q$ as in Theorem 1. Taking a nearest integer numerator in that theorem gives
  $ parallel q pi parallel gt.eq q^(1 - nu) #h(2em) \( q gt.eq Q \) . $
  The same theorem has established irrationality of $pi$. Hence
  $ c = min ({ 1 } union {q^(nu - 1) parallel q pi parallel : q in bb(Z) \, med 1 lt.eq q < Q}) > 0 . $
  It follows that $parallel q pi parallel gt.eq c q^(1 - nu)$ for every positive integer $q$, including the finitely many exceptions below $Q$. Lemma 11 therefore gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ sum_(q = 1)^oo frac(1, q^3 parallel q pi parallel^2) < oo . $ <series:distance-sum>]
  For each positive integer $n$, choose a nearest nonnegative integer $q$ to $n \/ pi$, and group the integers $n$ by $q$. Then $\| n - q pi \| lt.eq pi \/ 2$. The group with $q = 0$ is finite, and its terms in the Flint–Hills series are finite because irrationality of $pi$ excludes $sin n = 0$ for a positive integer $n$. For each $q gt.eq 1$, its group lies in an interval of length $pi < 4$, so contains at most four integers. Every integer in that group satisfies
  $ n gt.eq pi \( q - 1 \/ 2 \) gt.eq frac(pi q, 2) . $
  Concavity of sine on $\[ 0 \, pi \/ 2 \]$ also gives
  $ \| sin n \| = \| sin \( n - q pi \) \| gt.eq 2 / pi \| n - q pi \| gt.eq 2 / pi parallel q pi parallel . $
  The contribution of the group indexed by $q gt.eq 1$ is consequently at most
  $ 8 / pi frac(1, q^3 parallel q pi parallel^2) . $
  Summing this bound and using (5.1) proves convergence of $sum_(n gt.eq 1) n^(- 3) sin^(- 2) n$, with angles in radians. ◻
]

The same spacing argument gives the convergence criterion for the two-parameter family.

#thm([Corollary 5.2.])[
  (Generalized Flint–Hills series).  #emph[For fixed real numbers $a \, b > 0$, the series 
$ sum_(n = 1)^oo frac(1, n^a \| sin n \|^b) $

 with angles in radians converges if and only if $a > max { 1 \, b }$.]
] <series:generalized>

#proof[
  Suppose first that $a > max { 1 \, b }$, and choose $epsilon > 0$ so that $a > max { 1 \, b } + b epsilon$. Theorem 1, with the finitely many exceptional denominators absorbed into a positive constant as above, gives $parallel q pi parallel gt.eq c_epsilon q^(- 1 - epsilon)$ for all $q gt.eq 1$. For an integer $K gt.eq 1$, put $d = c_epsilon \( 2 K \)^(- 1 - epsilon)$. As in the proof of Lemma 11, the points $q pi$ on $bb(R) \/ bb(Z)$ with $K lt.eq q < 2 K$ are mutually $d$-separated and at least $d$ from zero. There are at most $K$ points, so the half-circle ordering gives
  $ sum_(K lt.eq q < 2 K) frac(1, q^a parallel q pi parallel^b) lt.eq 2 K^(- a) d^(- b) sum_(j = 1)^K j^(- b) lt.double_(a \, b \, epsilon) cases(delim: "{", K^(1 - a + b epsilon) \, & 0 < b < 1 \,, K^(1 - a + epsilon) log \( 2 K \) \, & b = 1 \,, K^(b - a + b epsilon) \, & b > 1 .) $
  Each power of $K$ is negative by the choice of $epsilon$; summing over $K = 1 \, 2 \, 4 \, dots.h$, including the logarithmic factor when $b = 1$, proves convergence of $sum_(q gt.eq 1) q^(- a) parallel q pi parallel^(- b)$. Use the same nearest-multiple groups as in the preceding proof. The $q = 0$ group is finite, while the group indexed by $q gt.eq 1$ contributes at most
  $ 4 \( 2 \/ pi \)^a \( pi \/ 2 \)^b q^(- a) parallel q pi parallel^(- b) . $
  This proves the required convergence.
  If $a lt.eq 1$, including the boundary $a = 1$, then $\| sin n \| lt.eq 1$ compares the series from below with the divergent series $sum n^(- a)$. It remains to consider $1 < a lt.eq b$. Let $p_j \/ q_j$ be the continued-fraction convergents to $pi$, whose positive integer numerators tend to infinity. They satisfy
  $ \| sin p_j \| = \| sin \( p_j - pi q_j \) \| lt.eq \| p_j - pi q_j \| < q_j^(- 1) . $
  Since $p_j \/ q_j arrow.r pi$, eventually $p_j lt.eq \( pi + 1 \) q_j$, and hence
  $ frac(1, p_j^a \| sin p_j \|^b) > p_j^(- a) q_j^b gt.eq \( pi + 1 \)^(- b) p_j^(b - a) . $
  These summands are bounded away from zero when $a = b$, and tend to infinity when $a < b$. Thus the series also diverges throughout $1 < a lt.eq b$, including its boundary $a = b > 1$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
