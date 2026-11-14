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

#align(center)[#text(size: 16pt, weight: "bold")[The symmetric Mahler conjecture and its equality cases]]
#align(center)[OpenAI]
#align(center)[September 22, 2026]

== 1 Introduction <sec:introduction>

A convex body is a compact convex subset of $bb(R)^n$ with nonempty interior. If $K = - K$, its center $0$ is an interior point, and its polar body is

$ K^compose = { y in bb(R)^n : chevron.l x \, y chevron.r lt.eq 1 upright(" for every ") x in K } . $

Write $\| K \|$ for $n$-dimensional Lebesgue volume and $P \( K \) = \| K \| thin \| K^compose \|$ for the volume product. The two determinant factors cancel under an invertible linear change of coordinates, so $P \( T K \) = P \( K \)$. Mahler’s symmetric volume-product problem asks how small this linear invariant can be. The conjectured value is $4^n \/ n !$, the product of a cube and its polar cross-polytope. We prove this bound in every dimension and classify the equality cases.

The extremal bodies are defined recursively. A centered nondegenerate interval is a one-dimensional #emph[Hanner polytope]. Given Hanner polytopes $H_1 subset bb(R)^k$ and $H_2 subset bb(R)^l$, their Cartesian product and the convex hull

$ H_1 xor_oo H_2 & = H_1 times H_2 \,\
H_1 xor_1 H_2 & = "conv" #scale(x: 120%, y: 120%)[\(] \( H_1 times { 0 } \) union \( { 0 } times H_2 \) #scale(x: 120%, y: 120%)[\)] $

are Hanner polytopes in $bb(R)^(k + l)$. These are the $ell_oo$ and $ell_1$ sums, respectively. This class contains cubes, cross-polytopes, and mixed recursive sums. We call an invertible linear image of a Hanner polytope a #emph[linear Hanner body].

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 1$ and every origin-symmetric convex body $K subset bb(R)^n$, 
#[#set math.equation(numbering: n => "(1)")
 $ \| K \| thin \| K^compose \| gt.eq frac(4^n, n !) . $ <eq:main-inequality>]

 Equality holds if and only if $K$ is a linear Hanner body.]
] <thm:main>

The linear equivalence in the statement respects the fixed origin used for polarity.

=== 1.1 History and context <history-and-context>

Mahler introduced the volume-product problem in his work on convex bodies and transference in the geometry of numbers #cite(label("Mahler1939")); the planar inequality also goes back to him #cite(label("MahlerPlanar1939")). Reisner later characterized its equality cases as parallelograms, as a consequence of his zonoid theorem #cite(label("Reisner1986")) p. 340. Iriyeh and Shibata proved the complete three-dimensional symmetric theorem, including equality #cite(label("IriyehShibata")) Theorem 1.1. Fradelizi, Hubard, Meyer, Roldán-Pensado, and Zvavitch gave a shorter proof based on equipartitions, together with another equality argument and stability #cite(label("FradeliziHubardMeyerRoldanZvavitch2022")). Chen, Li, Xi, and Xu recently gave a shadow-flow proof of that theorem in a preprint that also treats the nonsymmetric three-dimensional problem #cite(label("ChenLiXiXu2026")) Theorem 7.1.

Hanner’s recursively constructed spaces #cite(label("Hanner1956")) already play a central role in the known higher-dimensional cases. Saint-Raymond proved the sharp inequality for unconditional bodies (those invariant under coordinate sign changes) #cite(label("SaintRaymond1981")); Meyer and Reisner identified the Hanner equality cases in that class #cite(label("Meyer1986")) #cite(label("Reisner1987")). Reisner also proved the sharp inequality for zonoids, which are Hausdorff limits of Minkowski sums of centered segments, and showed that equality within that class means a parallelotope #cite(label("Reisner1985")) #cite(label("Reisner1986")); Gordon, Meyer, and Reisner later gave a short geometric proof #cite(label("GordonMeyerReisner1988")). For local questions in Banach–Mazur distance, Nazarov, Petrov, Ryabogin, and Zvavitch established strict local minimality, up to linear equivalence, of the cube #cite(label("NazarovPetrovRyaboginZvavitch2010")). Kim extended this to all Hanner polytopes #cite(label("Kim2014")). Kim and Zvavitch obtained stability in the unconditional class and the inequality in a neighborhood of that class #cite(label("KimZvavitch2015")).

A separate line of work seeks dimension-independent exponential bounds without the sharp constant. Bourgain and Milman established such a reverse Blaschke–Santaló inequality #cite(label("BourgainMilman")); Kuperberg obtained an explicit stronger bound by a geometric argument using Gauss linking integrals #cite(label("Kuperberg")). Complex-analytic approaches provide another setting for these questions. Nazarov used Hörmander’s $macron(partial)$ theorem and Bergman kernels for the reverse Blaschke–Santaló inequality #cite(label("Nazarov2012")). Berndtsson recast Kuperberg’s proof using complex integrals #cite(label("Berndtsson")). In a symplectic approach, Karasev proved the sharp inequality for hyperplane sections and projections of $ell_p$ balls ($1 lt.eq p lt.eq oo$) and Hanner polytopes #cite(label("Karasev")) Theorems 4.2 and 4.4. These works give analytic and geometric precedents for volume-product estimates; their estimates are not hypotheses of our proof.

The analytic ingredient is a conformal map of the disk for which uniform angular measure on the boundary maps to a uniform imaginary coordinate. It is a rotation of Gross’s example for the uniform distribution in his conformal Skorokhod embedding #cite(label("Gross")) Section 3.2. A holomorphic mass estimate turns that boundary law into a lower bound for an integral of feasible-simplex volumes over the primal body. We prove the mass estimate directly by Stokes’ theorem, with its precise normalization; its general background is the theory of generalized Lelong numbers #cite(label("Demailly")) Sections 3 and 5. The symmetric-convex extremal-function framework of Lundin and Baran was a further motivation for the analytic search; see #cite(label("Lundin1985")) and the formula recorded in #cite(label("BosCalviLevenberg2001")) Proposition 1.2, pp. 246–247. The proof here instead uses the direct isolated-zero mass calculation, not those extremal-function formulas as premises. The equality argument leads to a classical property of normed spaces: any three pairwise-intersecting closed balls have a common point. Hanner studied the associated recursively constructed convex bodies #cite(label("Hanner1956")). Lima’s norm-additive decomposition criterion #cite(label("Lima1978")) Theorem 1.2, also recorded in Hansen–Lima #cite(label("HansenLima1981")) Theorem 3.6(4), is exactly the metric-median condition used below. Reisner’s unconditional equality theorem already connects minimal volume product to this ball intersection structure #cite(label("Reisner1987")) Theorem 1. Our endpoint argument obtains the structure without assuming unconditionality; Hansen–Lima’s finite-dimensional classification is the final input #cite(label("HansenLima1981")) Corollary 7.4.

For a body without a prescribed center, the general Mahler problem instead minimizes $\| K \| thin \| \( K - z \)^compose \|$ over $z in "int" K$. Its conjectured constant $\( n + 1 \)^(n + 1) \/ \( n ! \)^2$ is smaller than the symmetric constant for $n gt.eq 2$; a result for that general problem alone therefore does not establish Theorem 1. The argument here uses symmetry throughout and is independent of the general theorem proved in the companion paper #cite(label("OpenAIGeneralMahler2026")) Theorem 1.1.

=== 1.2 Proof overview <proof-overview>

Section 2 records polarity and the two norm-sum formulas. They show that every Hanner body has the stated volume product. The remaining work is the lower bound and its converse equality statement.

First let

$ A = { X in bb(R)^d : \| b_i dot.op X \| lt.eq 1 \, med 1 lt.eq i lt.eq m } \, #h(2em) A^compose = "conv" { plus.minus b_1 \, dots.h \, plus.minus b_m } \, $

where the nonzero, pairwise nonproportional rows $b_i$ span $bb(R)^d$. Section 3 constructs a planar lens with horizontal half-width $lambda \( t \)$ at height $t$. For $X in "int" A$, use this width to form

$ L_X = { Y in bb(R)^d : \| b_i dot.op Y \| lt.eq lambda \( b_i dot.op X \) \, med 1 lt.eq i lt.eq m } . $

Each independent $d$-tuple of signed constraints that are tight at one point of $L_X$ determines a simplex: take the convex hull of $0$ and those signed rows. Let $Sigma_X$ be the union of these simplices. It lies in $A^compose$.

Write $F$ for the conformal map from the unit disk to the lens. For each set $I$ of $d$ independent rows, sample independent uniform angles $theta_i$ and solve $b_i Z = F \( e^(i theta_i) \)$, $i in I$, for the complex vector $Z$. Let $P_I$ be the probability that all remaining row coordinates also lie in the closed lens. Section 5 applies the mass estimate of Section 4 to high powers of the inverse map: after a change of radial variables, the Jacobian integrals concentrate on these boundary samples and force $S := sum_I P_I gt.eq 1$. The uniform imaginary coordinate then identifies this probability sum with the simplex integral in Section 6:

$ 1 lt.eq S = frac(d !, 4^d) integral_A \| Sigma_X \| thin d X lt.eq frac(d !, 4^d) \| A \| thin \| A^compose \| . $

The first inequality is analytic; the last is the inclusion just described. The exact identity behind this bound also controls the missing volume $\| A^compose \| - \| Sigma_X \|$. Approximation extends the inequality to all origin-symmetric convex bodies.

For equality, set $Q = K^compose$ and pass to the body

$ B = K xor_1 \[ - 1 \, 1 \] \, #h(2em) B^compose = Q times \[ - 1 \, 1 \] $

in dimension $d = n + 1$. The norm-sum formula preserves equality at the new dimension. Inner polytope approximations to $Q$ therefore have integrated missing volume tending to zero. Section 7 uses product neighborhoods to obtain, for each interior point of $B$ and each nonzero direction, a representation whose rows attain their lens bounds at one vector satisfying all the constraints. This includes degenerate limiting representations. Finally, Section 8 examines points approaching an apex of $B$. The lens asymptotic gives a support-function inequality, and convex separation gives a metric median for every triple in the norm with unit ball $Q$: a point whose distances to each pair sum to that pair’s distance. The Hansen–Lima theorem then identifies $Q$, and hence $K$, as a linear Hanner body #cite(label("HansenLima1981")) Corollary 7.4.

We next derive functional and entropy–transport consequences of the all-dimensional theorem. The geometric proof begins in Section 2 and ends in Section 8.

=== 1.3 Functional Mahler inequality <sec:functional-mahler>

The volume-product problem has a functional form in which polarity is replaced by convex conjugation. For a proper lower-semicontinuous convex function $phi : bb(R)^n arrow.r bb(R) union { + oo }$, its Fenchel–Legendre transform is

$ phi^(*) \( y \) = sup_(x in bb(R)^n) { chevron.l x \, y chevron.r - phi \( x \) } \, #h(2em) y in bb(R)^n . $

We use the convention $e^(- oo) = 0$.

#thm([Corollary 1.2.])[
  (Even functional Mahler inequality).  #emph[For every integer $n gt.eq 1$ and every even proper lower-semicontinuous convex function $phi : bb(R)^n arrow.r bb(R) union { + oo }$ such that $0 < integral_(bb(R)^n) e^(- phi \( x \)) thin d x < oo$, 
$ (integral_(bb(R)^n) e^(- phi \( x \)) thin d x) (integral_(bb(R)^n) e^(- phi^(*) \( y \)) thin d y) gt.eq 4^n . $

 The second integral is allowed to be infinite, in which case the inequality is immediate.]
] <cor:functional-mahler>

#proof[
  Set $f = e^(- phi)$, a nonzero integrable log-concave function. For $z in bb(R)^n$, Fradelizi and Meyer use the polar function
  $ f^z \( y \) = inf_({ x : f \( x \) > 0 }) frac(e^(- chevron.l x - z \, y - z chevron.r), f \( x \)) $
  and the translation-minimized functional volume product
  $ cal(P) \( f \) = (integral_(bb(R)^n) f \( x \) thin d x) inf_(z in bb(R)^n) integral_(bb(R)^n) f^z \( y \) thin d y . $
  Their Proposition 1(a) states that the symmetric geometric Mahler inequality in every dimension implies $cal(P) \( f \) gt.eq 4^n$ for every even log-concave function on $bb(R)^n$ with $0 < integral_(bb(R)^n) f < oo$ #cite(label("FradeliziMeyer2008")). Theorem 1 supplies this all-dimensional hypothesis. Since $f^0 = e^(- phi^(*))$, the product in Corollary 2 is at least $cal(P) \( f \)$. ◻
]

The cited implication uses auxiliary convex bodies in dimensions $n + m$ and lets $m$ tend to infinity; it is not an application only of the geometric theorem in dimension $n$. The constant is sharp: for $phi \( x \) = sum_(i = 1)^n \| x_i \|$, the transform $phi^(*)$ is zero on $\[ - 1 \, 1 \]^n$ and $+ oo$ outside, and both integrals in the corollary equal $2^n$. The equality classification in Theorem 1 concerns convex bodies. The limiting implication does not by itself classify the even potentials for which equality holds #cite(label("FradeliziMeyer2008")) p. 1437.

For potentials without evenness, the companion paper on general convex bodies gives the sharp lower bound $e^n$ #cite(label("OpenAIGeneralMahler2026")) Corollary 1.2.

The functional inequality also has an entropy–transport formulation. For a log-concave probability measure $eta$ with a density, let $H \( eta \) = integral log \( d eta \/ d x \) thin d eta$ denote its entropy relative to Lebesgue measure, the negative of differential Shannon entropy. For probability measures $mu_1 \, mu_2$ with finite first moments, set

$ cal(T) \( mu_1 \, mu_2 \) = inf_(f in cal(F)) {integral f thin d mu_1 + integral f^(*) thin d mu_2} \, $

where $cal(F)$ is the class of proper lower-semicontinuous convex functions $bb(R)^n arrow.r bb(R) union { + oo }$ and $f^(*)$ is the Fenchel–Legendre transform. The cost $cal(T)$ is allowed to be $+ oo$.

#thm([Corollary 1.3.])[
  (Symmetric entropy–transport inequality).  #emph[For every integer $n gt.eq 1$, let $eta_i \( d x \) = e^(- V_i \( x \)) thin d x$, $i = 1 \, 2$, be full-dimensional log-concave probability measures, both symmetric about the origin, with proper lower-semicontinuous convex potentials $V_i$. Suppose their densities are essentially continuous, meaning that $e^(- V_i) = 0$ at $cal(H)^(n - 1)$-almost every point of $partial "supp" eta_i$. Their moment measures $nu_i = \( nabla V_i \)_(\#) eta_i$ have finite first moments, $H \( eta_i \) = - integral V_i thin d eta_i$ is finite, and 
$ H \( eta_1 \) + H \( eta_2 \) lt.eq - n log \( 4 e^2 \) + cal(T) \( nu_1 \, nu_2 \) . $

]
] <cor:entropy-transport>

#proof[
  For $rho_i = e^(- V_i)$, the identity $\| nabla rho_i \| = \| nabla V_i \| e^(- V_i)$ holds almost everywhere on the interior of the support. Lemma 4 and the proof of Proposition 7 of #cite(label("CorderoErausquinKlartag2015")) give $integral \| nabla rho_i \| < oo$ and $V_i in L^1 \( eta_i \)$, respectively. The pushforward definition of $nu_i$ therefore gives its finite first moment, and $H \( eta_i \) = - integral V_i thin d eta_i$ is finite. Gozlan’s equivalence between the symmetric functional inverse Santaló and entropy–transport inequalities, as stated in #cite(label("FradeliziGozlanZugmeyer2021")) Theorem 1.3, applies to Corollary 2 with $c = 4$. ◻
]

== 2 Polarity, norm sums, and Hanner polytopes <sec:convex>

All bodies below are symmetric about the origin. In addition to the polar and volume product defined in Section 1, we use the gauge and support function

$ p_A \( x \) = inf { t > 0 : x in t A } \, #h(2em) h_A \( y \) = max_(x in A) chevron.l x \, y chevron.r . $

Dual spaces are identified with Euclidean coordinate spaces, and $\| A \|$ always denotes volume in the dimension of $A$. The notation $h_A$ also applies to any nonempty compact convex set. The gauge is a norm with closed unit ball $A$. Convex separation gives the bipolar identity $A^(compose compose) = A$, and hence

#[#set math.equation(numbering: n => "(2)")
 $ p_A = h_(A^compose) \, #h(2em) h_A = p_(A^compose) . $ <eq:gauge-support>]

Indeed $x in t A$ is equivalent to $chevron.l x \, y chevron.r lt.eq t$ for every $y in A^compose$. For an invertible linear map $T$,

#[#set math.equation(numbering: n => "(3)")
 $ \( T A \)^compose = T^(- sans(T)) A^compose \, #h(2em) P \( T A \) = P \( A \) \, $ <eq:linear-polarity>]

since the two volumes acquire reciprocal determinant factors.

For bodies $A subset bb(R)^k$ and $A' subset bb(R)^l$, define

$ A xor_oo A' = A times A' \, #h(2em) A xor_1 A' = "conv" #scale(x: 120%, y: 120%)[\(] \( A times { 0 } \) union \( { 0 } times A' \) #scale(x: 120%, y: 120%)[\)] . $

These operations are taken in the product space. More generally, complementary subspaces are identified with product coordinates by an invertible linear map. Their gauges are

#[#set math.equation(numbering: n => "(4)")
 $ p_(A xor_oo A') \( x \, x' \) & = max { p_A \( x \) \, p_(A') \( x' \) } \,\
p_(A xor_1 A') \( x \, x' \) & = p_A \( x \) + p_(A') \( x' \) . $ <eq:sum-gauges>]

For the second identity, a convex combination from the two coordinate bodies has gauge sum at most one. Conversely, when the sum is at most one, use these two gauges as the coefficients of the normalized coordinate vectors and place any remaining weight at $0$. A zero coordinate contributes no term.

#thm([Lemma 2.1.])[
  (Polars and volumes of the two sums).  #emph[For origin-symmetric convex bodies of dimensions $k \, l gt.eq 1$, 
#[#set math.equation(numbering: n => "(5)")
 $ \( A xor_1 A' \)^compose = A^compose xor_oo \( A' \)^compose \, #h(2em) \( A xor_oo A' \)^compose = A^compose xor_1 \( A' \)^compose . $ <eq:sum-polars>]

 Moreover, 
#[#set math.equation(numbering: n => "(6)")
 $ \| A xor_oo A' \| = \| A \| thin \| A' \| \, #h(2em) \| A xor_1 A' \| = frac(k ! thin l !, \( k + l \) !) \| A \| thin \| A' \| . $ <eq:sum-volumes>]

 Consequently, for $s in { 1 \, oo }$, 
#[#set math.equation(numbering: n => "(7)")
 $ P \( A xor_s A' \) = frac(P \( A \) P \( A' \), binom(k + l, k)) . $ <eq:sum-products>]

]
] <lem:sums>

#proof[
  Testing a functional on the two coordinate bodies gives the first polar identity; taking polars again gives the second. The product volume follows from Fubini. By (4), the fiber of $A xor_1 A'$ over $x in A$ is $\( 1 - p_A \( x \) \) A'$. Since $\| { x : p_A \( x \) lt.eq t } \| = t^k \| A \|$ for $0 lt.eq t lt.eq 1$, integration gives
  $ \| A xor_1 A' \| = k \| A \| thin \| A' \| integral_0^1 t^(k - 1) \( 1 - t \)^l thin d t = frac(k ! thin l !, \( k + l \) !) \| A \| thin \| A' \| . $
  The last integral is evaluated by repeated integration by parts. Combining the polar and volume identities proves (7). ◻
]

The Hanner recursion from Section 1 uses precisely these two operations, following Hanner #cite(label("Hanner1956")). Their volume and polarity formulas give the attaining family immediately.

#thm([Lemma 2.2.])[
  (The Hanner volume product).  #emph[Every $d$-dimensional linear Hanner body $H$ satisfies 
$ P \( H \) = frac(4^d, d !) . $

 The polar of a linear Hanner body is again a linear Hanner body.]
] <lem:hanner>

#proof[
  A centered interval $\[ - a \, a \]$, $a > 0$, has polar $\[ - 1 \/ a \, 1 \/ a \]$ and volume product $4$. Equation (7) propagates $4^k \/ k !$ and $4^l \/ l !$ to $4^(k + l) \/ \( k + l \) !$ under either operation. Induction and linear invariance prove the first assertion. The polar identities exchange the two operations and preserve the interval base case. Equation (3) then proves closure under polarity also for linear images. ◻
]

In dimension one every origin-symmetric convex body is a centered nondegenerate interval. Thus both the sharp inequality and the full equality classification in that dimension follow directly from the base case above.

== 3 A conformal lens with a uniform boundary coordinate <sec:lens>

We construct a conformal image of the disk whose boundary has a uniformly distributed imaginary coordinate. This law will turn complex feasibility probabilities into real volumes. The horizontal half-width has further roles: strict curvature will make additional boundary equalities have probability zero, while concavity will extend feasibility from polar vertices to their convex hull. Its endpoint scaling will enter the equality argument near the apex of the lifted body. The map is a rotation of the uniform-distribution example in Gross’s conformal Skorokhod embedding #cite(label("Gross")) Section 3.2; we prove all its required properties directly.

Write $bb(D) = { z in bb(C) : \| z \| < 1 }$ and define

#[#set math.equation(numbering: n => "(8)")
 $ F \( z \) = 8 / pi^2 sum_(j = 0)^oo frac(\( - 1 \)^j z^(2 j + 1), \( 2 j + 1 \)^2) . $ <eq:lens-map>]

The series converges uniformly on $overline(bb(D))$.

#thm([Lemma 3.1.])[
  (The planar lens).  #emph[The function $F$ is a biholomorphism from $bb(D)$ onto a bounded convex domain $D$, with inverse $g$, and $F' \( 0 \) = 8 \/ pi^2$. There is a continuous even function $lambda : \[ - 1 \, 1 \] arrow.r \[ 0 \, oo \)$, positive on $\( - 1 \, 1 \)$ and zero at $plus.minus 1$, such that 
#[#set math.equation(numbering: n => "(9)")
 $ overline(D) = { v + i t : \| t \| lt.eq 1 \, med \| v \| lt.eq lambda \( t \) } . $ <eq:lens-domain>]

 The function $lambda$ is smooth on $\( - 1 \, 1 \)$ and satisfies 
#[#set math.equation(numbering: n => "(10)")
 $ lambda' \( t \) = - 2 / pi "arctanh" #h(-0.16667em) (sin frac(pi t, 2)) \, #h(2em) lambda'' \( t \) = - sec frac(pi t, 2) < 0 . $ <eq:lens-width-curvature>]

 If $Theta$ is uniform on $\[ 0 \, 2 pi \)$, then 
#[#set math.equation(numbering: n => "(11)")
 $ F \( e^(i Theta) \) med =^(upright("law")) med epsilon lambda \( T \) + i T \, $ <eq:lens-boundary-law>]

 where $T$ is uniform on $\[ - 1 \, 1 \]$ and $epsilon$ is an independent uniform sign.]
] <lem:planar-lens>

#proof[
  The map is odd and commutes with conjugation. Put
  $ w = arctan z = frac(1, 2 i) log frac(1 + i z, 1 - i z) \, #h(2em) z in bb(D) . $
  The fraction inside the logarithm lies in the right half-plane, where we use the principal logarithm. Thus $\| Re w \| < pi \/ 4$, $tan w = z$, and $w = 0$ only when $z = 0$. Differentiating the series gives
  #[#set math.equation(numbering: n => "(12)")
   $ F' \( z \) = 8 / pi^2 w / z \, #h(2em) 1 + frac(z F'' \( z \), F' \( z \)) = frac(sin \( 2 w \), 2 w) \, $ <eq:lens-derivatives>]
  with their limiting values at zero. In particular $F'$ has no zeros. For $w = a + i b eq.not 0$, the real part of the last expression is
  $ frac(a sin \( 2 a \) cosh \( 2 b \) + b cos \( 2 a \) sinh \( 2 b \), 2 \( a^2 + b^2 \)) > 0 \, $
  since $\| a \| < pi \/ 4$; its value at zero is $1$.
  Fix $0 < r < 1$ and put $gamma_r \( theta \) = F \( r e^(i theta) \)$. This curve is regular, and its tangent angle $beta$ satisfies
  $ beta' \( theta \) = Re #h(-0.16667em) (1 + frac(z F'' \( z \), F' \( z \))) > 0 \, #h(2em) beta \( theta + 2 pi \) = beta \( theta \) + 2 pi . $
  The second identity uses the zero-free derivative in the disk. At a fixed parameter $theta_0$, project the curve onto its right unit normal there. The derivative of this projection has the sign of $- sin \( beta \( theta \) - beta \( theta_0 \) \)$. It is negative until the tangent has turned through $pi$, and positive thereafter, until the curve returns to $theta_0$. Hence the projection has its unique maximum at $theta_0$. This proves simplicity and shows that every point of the curve is the unique supporting point of its convex hull in the corresponding normal direction. All normal directions occur, so the curve is the boundary of that convex hull and is positively oriented. The harmonic maximum principle for these supporting projections places $F \( r bb(D) \)$ strictly inside the curve. The argument principle then gives exactly one preimage for every point inside and none outside. Thus $F$ maps $r bb(D)$ biholomorphically onto its bounded convex interior $D_r$.
  As $r$ increases, these domains exhaust $D = F \( bb(D) \)$. Consequently $F$ is univalent on $bb(D)$, $D$ is convex, and its inverse $g$ is holomorphic. For each $0 < r < 1$, continuity also gives $overline(D_r) = F \( r overline(bb(D)) \) subset D$. Continuity on the closed disk gives boundedness and $overline(D) = F \( overline(bb(D)) \)$. No boundary value $F \( zeta \)$, $\| zeta \| = 1$, lies in $D$: otherwise continuity of $g$ there and $g \( F \( r zeta \) \) = r zeta$ would give $g \( F \( zeta \) \) = zeta in.not bb(D)$. It follows that $partial D = F \( partial bb(D) \)$.
  We now compute this boundary. On the right semicircle, $z = e^(i s)$ with $- pi \/ 2 < s < pi \/ 2$, one has
  $ frac(1 + i z, 1 - i z) = frac(i cos s, 1 + sin s) \, #h(2em) Re w = pi / 4 \, #h(2em) Im w = 1 / 2 "arctanh" \( sin s \) . $
  The formulas for $w$ and $F'$ extend analytically across each compact subarc, so we may differentiate the boundary values. Writing $F \( e^(i s) \) = v \( s \) + i t \( s \)$ gives
  $ t' \( s \) = 2 / pi \, #h(2em) v' \( s \) = - 4 / pi^2 "arctanh" \( sin s \) . $
  Since $t \( 0 \) = 0$, we have $t \( s \) = 2 s \/ pi$. Define $lambda \( t \) = v \( pi t \/ 2 \)$ and extend it to $\[ - 1 \, 1 \]$ by continuity. Conjugation makes $lambda$ even. The values $F \( plus.minus i \)$ are purely imaginary by the series, so $lambda \( plus.minus 1 \) = 0$. Differentiation gives (10); strict concavity and the endpoint values then give positivity in the interior. Oddness and conjugation show that the other semicircle traces the graph $v = - lambda \( t \)$. These two graphs give (9). On either semicircle the imaginary coordinate traverses $\[ - 1 \, 1 \]$ at constant absolute speed $2 \/ pi$. Each semicircle has probability $1 \/ 2$, which proves (11). ◻
]

Figure 1 illustrates the coordinate law.

#figure(
  [#image("fig/lens-boundary-law.pdf.png", width: 100%)],
  caption: [Figure 1: The conformal lens and its boundary coordinate. Equally spaced angles on either semicircle give equally spaced imaginary coordinates on the corresponding boundary branch. On the right semicircle, $F \( e^(i s) \) = lambda \( 2 s \/ pi \) + 2 i s \/ pi$; reflection gives the left branch. Thus a uniform angle gives a uniform coordinate in $\[ - 1 \, 1 \]$ and an independent fair branch sign. The horizontal arrow marks the half-width $lambda \( t_0 \)$, with $s_0 = pi \/ 6$ and $t_0 = 1 \/ 3$. ],
) <fig:lens-boundary-law>

The two boundary graphs are smooth away from $plus.minus i$ and have strictly turning tangent directions by (10). In particular, a fixed tangent line direction occurs at only finitely many parameters away from these two endpoints. The boundary has planar Lebesgue measure zero, as is also immediate from its graph description.

#thm([Lemma 3.2.])[
  (Endpoint scaling).  #emph[As $eta arrow.b 0$, 
#[#set math.equation(numbering: n => "(13)")
 $ lambda \( 1 - eta \) = 2 / pi eta log 1 / eta + O \( eta \) . $ <eq:lens-endpoint-asymptotic>]

 For every $0 < a lt.eq b < oo$, 
#[#set math.equation(numbering: n => "(14)")
 $ sup_(a lt.eq c lt.eq b) lr(|frac(lambda \( 1 - delta c \), lambda \( 1 - delta \)) - c|) arrow.r 0 #h(2em) \( delta arrow.b 0 \) . $ <eq:lens-endpoint-ratio>]

]
] <lem:lens-endpoint>

#proof[
  Equation (10) and $"arctanh" \( cos x \) = log cot \( x \/ 2 \)$ give
  $ lambda \( 1 - eta \) = 2 / pi integral_0^eta log cot frac(pi s, 4) thin d s . $
  Here $log cot \( pi s \/ 4 \) = log \( 1 \/ s \) + O \( 1 \)$ uniformly as $s arrow.b 0$. Integration proves (13). Writing $L = log \( 1 \/ delta \)$, the same uniform remainder gives
  $ frac(lambda \( 1 - delta c \), lambda \( 1 - delta \)) = c thin frac(L - log c + O \( 1 \), L + O \( 1 \)) = c + O_(a \, b) \( L^(- 1) \) $
  uniformly for $a lt.eq c lt.eq b$, which proves (14). ◻
]

== 4 Mass at an isolated holomorphic zero <sec:holomorphic-mass>

The next estimate turns the order of a holomorphic zero into an integral bound for its Jacobian minors. Its application will use high powers of the inverse planar map. In complex dimension $d$, the mass bound grows as the $d$th power of their exponent, matching the radial rescaling that will produce boundary feasibility probabilities in Section 5. The estimate is a special case of the sublevel-mass and comparison formulas for generalized Lelong numbers; see Demailly #cite(label("Demailly")) Sections 3 and 5. We give a direct Stokes proof in the normalization used here.

On $bb(C)^d$, write $z_j = x_j + i y_j$ and use the complex orientation

$ d V = d x_1 and d y_1 and dots.h.c and d x_d and d y_d . $

For a smooth real function $v$, our convention is

#[#set math.equation(numbering: n => "(15)")
 $ d^c = i / 4 \( macron(partial) - partial \) \, #h(2em) d d^c = i / 2 partial macron(partial) . $ <eq:mass-dc-convention>]

Thus $d^c v \( xi \) = - 1 / 4 d v \( i xi \)$ for a real tangent vector $xi$, and

#[#set math.equation(numbering: n => "(16)")
 $ d d^c \| z \|^2 = sum_(j = 1)^d d x_j and d y_j \, #h(2em) \( d d^c v \)^d = d ! det \( v_(macron(z)_i z_j) \) thin d V . $ <eq:mass-volume-normalization>]

The second identity follows by expanding the exterior product, or by a unitary diagonalization of the Hermitian Hessian.

#thm([Lemma 4.1.])[
  (Holomorphic mass).  #emph[Let $d gt.eq 1$, $N gt.eq d$, and let $cal(U) subset bb(C)^d$ be open and contain $0$. Suppose that $f = \( f_1 \, dots.h \, f_N \) : cal(U) arrow.r bb(C)^N$ is holomorphic and has the following properties:]
  + #emph[$f^(- 1) \( 0 \) = { 0 }$;]
  + #emph[for an integer $k gt.eq 1$, 
$ f \( z \) = H \( z \) + O \( \| z \|^(k + 1) \) quad upright("near ") 0 \, $

 where each component of $H$ is a homogeneous polynomial of degree $k$ and $H \( z \) eq.not 0$ whenever $z eq.not 0$;]
  + #emph[for every $0 < s < 1$, the set ${ z in cal(U) : \| f \( z \) \|^2 lt.eq s }$ is compact in $cal(U)$.]
  #emph[Then, with $tau = \| f \|^2$, 
#[#set math.equation(numbering: n => "(17)")
 $ integral_({ tau < 1 }) sum_(I subset { 1 \, dots.h \, N }\
\| I \| = d) lr(|det (frac(partial f_i, partial z_j))_(i in I \, med 1 lt.eq j lt.eq d)|)^2 thin d V gt.eq frac(\( pi k \)^d, d !) . $ <eq:holomorphic-minor-mass>]

 All norms are Euclidean. Rows in each determinant are in increasing index order.]
] <lem:holomorphic-mass>

#proof[
  We first bound the integral of $\( d d^c tau \)^d$. The conversion to Jacobian minors will then follow from Cauchy–Binet. Both $tau$ and $log tau$ away from $0$ have positive semidefinite complex Hessians. Indeed, if $Z$ is the complex derivative matrix of $f$, the Hessian of $tau$ is $Z^(*) Z$. For a complex direction $xi$, the Hessian of $log tau$ evaluates to
  $ frac(\| f \|^2 \| d f \( xi \) \|^2 - \| chevron.l d f \( xi \) \, f chevron.r \|^2, \| f \|^4) gt.eq 0 $
  by Cauchy–Schwarz. Their top exterior powers are therefore nonnegative.
  ===== 4.1 Comparison with a small sphere. <comparison-with-a-small-sphere.>
  Fix a regular value $s in \( 0 \, 1 \)$ of $tau$ and set $E_s = { z in cal(U) : tau \( z \) < s }$. By compactness of the sublevel and the regular-value theorem, $overline(E_s)$ is a compact smooth manifold with boundary ${ tau = s }$. Stokes’ theorem gives
  $ integral_(E_s) \( d d^c tau \)^d = integral_(partial E_s) d^c tau and \( d d^c tau \)^(d - 1) . $
  Put $gamma = d^c log tau$ on $cal(U) \\ { 0 }$. The identities
  $ d^c log tau = tau^(- 1) d^c tau \, #h(2em) d d^c log tau = tau^(- 1) d d^c tau - tau^(- 2) d tau and d^c tau $
  and the vanishing of the pullback of $d tau$ to $partial E_s$ imply
  #[#set math.equation(numbering: n => "(18)")
   $ s^(- d) integral_(E_s) \( d d^c tau \)^d = integral_(partial E_s) gamma and \( d gamma \)^(d - 1) . $ <eq:mass-level-flux>]
  For sufficiently small $epsilon > 0$, the closed Euclidean ball $overline(B_epsilon)$ is contained in $E_s$. Orient $S_epsilon = partial B_epsilon$ outward from this ball. Applying Stokes on $E_s \\ overline(B_epsilon)$ gives
  #[#set math.equation(numbering: n => "(19)")
   $ s^(- d) integral_(E_s) \( d d^c tau \)^d - integral_(S_epsilon) gamma and \( d gamma \)^(d - 1) = integral_(E_s \\ overline(B_epsilon)) \( d d^c log tau \)^d gt.eq 0 . $ <eq:mass-punctured-flux>]
  Thus it remains to determine the flux through a shrinking sphere.
  ===== 4.2 The homogeneous flux. <the-homogeneous-flux.>
  Let $T \( z \) = \| H \( z \) \|^2$ and $S = { z : \| z \| = 1 }$. The holomorphic Taylor expansion implies
  $ epsilon^(- 2 k) tau \( epsilon z \) arrow.r T \( z \) quad upright("in ") C^2 upright(" on a fixed closed annulus containing ") S . $
  For example, termwise differentiation of the convergent Taylor series gives this convergence for the rescaled map and then for its squared norm. Since $T$ is strictly positive on that annulus, the logarithms converge in $C^2$ as well. Pulling back to $S$ by dilation, the additive constant $2 k log epsilon$ disappears under $d^c$. Consequently
  #[#set math.equation(numbering: n => "(20)")
   $ lim_(epsilon arrow.b 0) integral_(S_epsilon) gamma and \( d gamma \)^(d - 1) = integral_S alpha and \( d alpha \)^(d - 1) \, #h(2em) alpha = d^c log T \|_S . $ <eq:mass-homogeneous-limit>]
  We compare this flux with that of the radial function $\| z \|^(2 k)$. Homogeneity gives
  $ T \( r z \) = r^(2 k) T \( z \) quad \( r > 0 \) \, #h(2em) T \( e^(i theta) z \) = T \( z \) . $
  Thus $log T - k log \| z \|^2$ is unchanged by dilation and by common phase rotation. These invariances will make its contribution to the flux vanish. On $S$, put
  $ alpha_0 = d^c log \| z \|^2 \|_S \, #h(2em) beta = d^c #scale(x: 120%, y: 120%)[\(] log T - k log \| z \|^2 #scale(x: 120%, y: 120%)[\)] \|_S \, #h(2em) alpha_t = k alpha_0 + t beta quad \( 0 lt.eq t lt.eq 1 \) . $
  Thus $alpha_1 = alpha$. For the nowhere-zero tangent vector field $V \( z \) = i z$ on $S$, the dilation identity and (15) give $beta \( V \) = 0$ and $alpha_0 \( V \) = 1 \/ 2$. The phase-rotation identity makes every $alpha_t$ invariant under the flow of $V$. Cartan’s identity therefore gives
  $ iota_V d alpha_t = cal(L)_V alpha_t - d #scale(x: 120%, y: 120%)[\(] alpha_t \( V \) #scale(x: 120%, y: 120%)[\)] = 0 \, $
  where $iota_V$ denotes contraction and $cal(L)_V$ the Lie derivative. It follows that the top-degree form $beta and \( d alpha_t \)^(d - 1)$ on the $\( 2 d - 1 \)$-dimensional sphere vanishes: its contraction with the nonzero vector $V$ is zero. Differentiation and integration by parts on the closed sphere now yield
  $ frac(d, d t) integral_S alpha_t and \( d alpha_t \)^(d - 1) = d integral_S beta and \( d alpha_t \)^(d - 1) = 0 . $
  For $d = 1$ this is simply the derivative of $integral_S alpha_t$; the same argument applies.
  On the unit sphere, $alpha_0$ and $d alpha_0$ are the restrictions of $d^c \| z \|^2$ and $d d^c \| z \|^2$, respectively. Hence a final use of Stokes and (16) gives
  $ integral_S alpha and \( d alpha \)^(d - 1) & = k^d integral_S alpha_0 and \( d alpha_0 \)^(d - 1)\
 & = k^d integral_({ \| z \| < 1 }) \( d d^c \| z \|^2 \)^d\
 & = k^d d ! thin "vol"_(2 d) \( { \| z \| < 1 } \) = \( pi k \)^d . $
  ===== 4.3 The minor bound. <the-minor-bound.>
  Equations (19) and (20) imply
  $ integral_(E_s) \( d d^c tau \)^d gt.eq s^d \( pi k \)^d $
  for every regular $s in \( 0 \, 1 \)$. Sard’s theorem supplies an increasing sequence of such values tending to $1$. Since the integrand is nonnegative, monotone convergence gives
  $ integral_({ tau < 1 }) \( d d^c tau \)^d gt.eq \( pi k \)^d . $
  Finally, the complex Hessian $Z^(*) Z$ and Cauchy–Binet give the identity
  $ \( d d^c tau \)^d = d ! sum_(\| I \| = d) \| det Z_I \|^2 thin d V . $
  Division by $d !$ proves (17). ◻
]

== 5 Feasible bases <sec:feasibility>

We now apply the holomorphic mass estimate to finitely many real strip constraints. It gives a lower bound for the sum of their boundary feasibility probabilities. For the lens of Lemma 6, these probabilities will become volumes of real simplices.

Fix $d gt.eq 1$ and nonzero real row vectors $b_1 \, dots.h \, b_m$ spanning $\( bb(R)^d \)^(*)$. Write

#[#set math.equation(numbering: n => "(21)")
 $ A = { X in bb(R)^d : \| b_i X \| lt.eq 1 upright(" for every ") i } \, #h(2em) C = A^compose = "conv" { plus.minus b_1 \, dots.h \, plus.minus b_m } . $ <eq:strip-body>]

We identify rows with vectors when taking a convex hull, and extend their action complex-linearly to $bb(C)^d$. The spanning assumption makes $A$ bounded, and $0 in "int" A$. The polar identity follows from the bipolar theorem: the polar of the displayed convex hull is exactly $A$. Let $cal(B)$ be the collection of $d$-element sets of independent rows. For $I in cal(B)$, put $B_I = \( b_i \)_(i in I)$ in increasing index order and $D_I = \| det B_I \|$. Dependent row sets are omitted throughout.

For the next lemma, $F$ may be any biholomorphism of the unit disk onto a bounded planar domain $D$, with $F \( 0 \) = 0$ and a continuous extension to the closed disk. For independent uniform angles $theta_i in \[ 0 \, 2 pi \)$, $i in I$, define

#[#set math.equation(numbering: n => "(22)")
 $ Z_I \( theta \) = B_I^(- 1) #scale(x: 120%, y: 120%)[\(] F \( e^(i theta_i) \) #scale(x: 120%, y: 120%)[\)]_(i in I) \, #h(2em) P_I = bb(P) { b_j Z_I \( theta \) in overline(D) upright(" for all ") j } \, #h(2em) S = sum_(I in cal(B)) P_I . $ <eq:feasible-probabilities>]

The active coordinates $i in I$ already belong to $overline(D)$; thus the probability tests only the remaining rows.

#thm([Lemma 5.1.])[
  (Boundary feasibility).  #emph[Let $d gt.eq 1$ and let $b_1 \, dots.h \, b_m$ be nonzero real rows spanning $\( bb(R)^d \)^(*)$. Let $F : bb(D) arrow.r D$ be a biholomorphism onto a bounded planar domain, continuous on $overline(bb(D))$, with $F \( 0 \) = 0$. Then the sum $S$ in (22) satisfies $S gt.eq 1$. No condition on extra-row boundary equalities or on dependent row subsets is required.]
] <lem:holomorphic-feasibility>

#proof[
  Let $g = F^(- 1)$ and set
  $ Omega = { z in bb(C)^d : b_j z in D upright(" for every ") j } \, #h(2em) h_j \( z \) = g \( b_j z \) . $
  The set $Omega$ is open, bounded, and contains $0$. For an integer $k gt.eq 1$, apply Lemma 8 to the holomorphic map
  $ f_k = \( h_1^k \, dots.h \, h_m^k \) \, #h(2em) tau_k = sum_(j = 1)^m \| h_j \|^(2 k) . $
  We shall let $k$ tend to infinity. The mass lower bound has scale $k^d$. The radial substitution below removes the same factor from the Jacobian integrals and leaves a fixed domain on which the inferred points tend to boundary samples. The unique zero of $f_k$ is $0$: $g$ vanishes only at $0$, and the rows span. Writing $c = g' \( 0 \) eq.not 0$, its degree-$k$ leading term is $\( \( c b_1 z \)^k \, dots.h \, \( c b_m z \)^k \)$, also nonzero whenever $z eq.not 0$. For $0 < s < 1$, the set ${ tau_k lt.eq s }$ is compact in $Omega$. Indeed each of its row coordinates belongs to the fixed compact set $F \( { \| w \| lt.eq s^(1 \/ \( 2 k \)) } \) subset D$. A basis of rows bounds $z$; limits retain all these inclusions and the inequality $tau_k lt.eq s$. All hypotheses of the mass lemma therefore hold. The derivative row of $h_j^k$ is a scalar multiple of $b_j$, so dependent row subsets have zero minors. Consequently
  #[#set math.equation(numbering: n => "(23)")
   $ sum_(I in cal(B)) M_(I \, k) gt.eq k^d frac(pi^d, d !) \, #h(2em) M_(I \, k) := integral_({ tau_k < 1 }) lr(|det frac(partial \( h_i^k \)_(i in I), partial \( z_1 \, dots.h \, z_d \))|)^2 thin d V_(2 d) \( z \) . $ <eq:feasibility-mass>]
  Fix $I$. The change of variables $u_i = h_i \( z \)$, $i in I$, is one-to-one onto its image, with inverse $z = B_I^(- 1) \( F \( u_i \) \)_(i in I)$. Its squared complex Jacobian is its real volume Jacobian. The squared determinant in $M_(I \, k)$ is this Jacobian factor times $k^(2 d) product_i \| u_i \|^(2 k - 2)$. The transformed integration domain is contained in
  $ {u in bb(D)^d : sum_(i in I) \| u_i \|^(2 k) < 1 \, quad b_j B_I^(- 1) \( F \( u_i \) \)_(i in I) in D upright(" for all ") j} . $
  We use this larger domain for an upper bound, and then put $u_i = rho_i^(1 \/ k) e^(i theta_i)$. The coordinate hyperplanes, on which polar coordinates are undefined, have Lebesgue measure zero. Since
  $ k^2 \| u_i \|^(2 k - 2) thin d V_2 \( u_i \) = k rho_i thin d rho_i thin d theta_i \, $
  we obtain
  #[#set math.equation(numbering: n => "(24)")
   $ M_(I \, k) / k^d lt.eq integral_(rho_i > 0 \, med sum_i rho_i^2 < 1\
theta in \[ 0 \, 2 pi \)^d) upright(bold(1)) #h(-0.16667em) {b_j B_I^(- 1) #scale(x: 120%, y: 120%)[\(] F \( rho_i^(1 \/ k) e^(i theta_i) \) #scale(x: 120%, y: 120%)[\)]_(i in I) in D upright(" for every ") j} product_(i in I) rho_i thin d rho_i thin d theta_i . $ <eq:feasibility-radial>]
  The measure in this integral is finite: its total mass is the volume $pi^d \/ d !$ of the unit ball in $bb(C)^d$. For every positive $rho_i$, continuity of $F$ on the closed disk makes the inferred points converge to $Z_I \( theta \)$. If a limiting row coordinate lies outside $overline(D)$, that constraint fails for all sufficiently large $k$. Thus the upper limit of the indicator is bounded by the indicator of the event defining $P_I$, including all possible boundary equalities. The upper-bound form of Fatou’s lemma, applied to functions bounded by $1$ on this finite measure space, gives
  $ limsup_(k arrow.r oo) M_(I \, k) / k^d lt.eq frac(pi^d, d !) P_I . $
  There are only finitely many bases, so (23) and these upper bounds give
  $ frac(pi^d, d !) & lt.eq limsup_(k arrow.r oo) sum_(I in cal(B)) M_(I \, k) / k^d\
 & lt.eq sum_(I in cal(B)) limsup_(k arrow.r oo) M_(I \, k) / k^d\
 & lt.eq frac(pi^d, d !) sum_(I in cal(B)) P_I . $
  Thus $S gt.eq 1$. ◻
]

=== 5.1 Boundary equalities for the lens <boundary-equalities-for-the-lens>

The lower bound for $S$ allows additional boundary equalities. The real volume identity in Section 6 will need the stronger fact that these equalities have probability zero. From now on, $F \, D$, and $lambda$ are those of Lemma 6. We may also require that no two rows are proportional. For any finite strip presentation this is achieved without changing $A$ by keeping, on each row line, a row of largest magnitude; its strip implies all the discarded strips on that line. Zero rows, if present initially, impose no constraint and are discarded. In dimension one the reduced list has a single row, so there are no extra-row boundary equalities to consider.

#thm([Lemma 5.2.])[
  (Additional boundary equalities have probability zero).  #emph[Let $F : bb(D) arrow.r D$ be the lens map of Lemma 6. Assume that the nonzero spanning rows $b_1 \, dots.h \, b_m$ are pairwise nonproportional. For every $I in cal(B)$ and $j in.not I$, 
$ bb(P) { b_j Z_I \( theta \) in partial D } = 0 . $

]
] <lem:boundary-ties>

#proof[
  Write $b_j B_I^(- 1) = \( c_i \)_(i in I)$. At least two coefficients, say $c_a \, c_b$, are nonzero; otherwise $b_j$ would be proportional to a basis row. Let $gamma \( theta \) = F \( e^(i theta) \)$. Apart from its two endpoints, the lens boundary consists of the smooth regular branches $\( plus.minus lambda \( t \) \, t \)$, $- 1 < t < 1$. Their tangent directions have at most one occurrence on each branch for any fixed unoriented line direction, because $lambda'$ is strictly monotone. The boundary parameter has constant nonzero speed in $t$ on each branch, as established in the proof of Lemma 6.
  Hold all phases other than $theta_a \, theta_b$ fixed. The map
  $ \( theta_a \, theta_b \) mapsto c_a gamma \( theta_a \) + c_b gamma \( theta_b \) + sum_(i eq.not a \, b) c_i gamma \( theta_i \) $
  has real Jacobian determinant $det \( c_a gamma' \( theta_a \) \, c_b gamma' \( theta_b \) \)$. For every nonendpoint $theta_a$, it vanishes at only finitely many nonendpoint values of $theta_b$. Its zero set, including the excluded endpoint lines, therefore has planar measure zero by Fubini’s theorem. Off that set the inverse function theorem gives local diffeomorphism charts. A countable subcover of such charts suffices, and in each chart the inverse is locally Lipschitz, so it sends a planar null set to a null set. The set $partial D$ is planar-null, being a countable union of compact smooth subarcs and two points. Its inverse image consequently has measure zero in the two remaining phases. A final application of Fubini over the fixed phases proves the assertion. ◻
]

== 6 The real simplex identity <sec:simplex>

The lens boundary law now turns the feasibility sum into an exact integral over the strip body. The simplices in this integral lie in the polar body; their missing volume will also be the quantity used in the equality argument.

Keep the nonzero spanning, pairwise nonproportional rows of (21). For $X in "int" A$, define

#[#set math.equation(numbering: n => "(25)")
 $ L_X = { Y in bb(R)^d : \| b_j Y \| lt.eq lambda \( b_j X \) upright(" for every ") j } . $ <eq:real-feasibility-body>]

All widths are strictly positive, so $L_X$ contains a neighborhood of $0$; a basis of rows shows that it is bounded. It is therefore a convex polytope with nonempty interior. For a basis $I$ and signs $epsilon.alt = \( epsilon.alt_i \)_(i in I) in { - 1 \, 1 }^I$, let

$ Y_(I \, epsilon.alt) \( X \) = B_I^(- 1) #scale(x: 120%, y: 120%)[\(] epsilon.alt_i lambda \( b_i X \) #scale(x: 120%, y: 120%)[\)]_(i in I) . $

We call $\( I \, epsilon.alt \)$ feasible at $X$ when this vector belongs to $L_X$. This definition specifies a unique vector for every choice, whether or not it is feasible. Set

#[#set math.equation(numbering: n => "(26)")
 $ T_(I \, epsilon.alt) = "conv" #scale(x: 120%, y: 120%)[\(] 0 \, { epsilon.alt_i b_i : i in I } #scale(x: 120%, y: 120%)[\)] \, #h(2em) Sigma_X = union.big_(\( I \, epsilon.alt \) upright(" feasible at ") X) T_(I \, epsilon.alt) . $ <eq:feasible-simplex-union>]

Thus $Sigma_X$ is a finite union of closed $d$-simplices contained in $C = A^compose$. This definition applies at every interior $X$, including points with additional tight constraints. For integration only, declare every pair infeasible and set $Sigma_X = diameter$ when $X in partial A$.

A feasible pair specifies a vertex $Y_(I \, epsilon.alt) \( X \)$ of $L_X$. A strictly positive combination of its signed tight rows defines a linear functional maximized uniquely at that vertex. This is why different feasible pairs give simplices with disjoint interiors whenever their vertices are distinct. The proof below removes, outside a null set of $X$, the boundary ties that could make two pairs specify the same vertex.

#thm([Proposition 6.1.])[
  (Feasible-simplex identity).  #emph[Let $b_1 \, dots.h \, b_m$ be nonzero, pairwise nonproportional real rows spanning $\( bb(R)^d \)^(*)$, and let $F \, D \, lambda$ be as in Lemma 6. With $A$, $S$, and $Sigma_X$ defined in (21), (22), and (26), respectively, 
#[#set math.equation(numbering: n => "(27)")
 $ 1 lt.eq S = frac(d !, 4^d) integral_A \| Sigma_X \| thin d X lt.eq frac(d !, 4^d) \| A \| thin \| A^compose \| . $ <eq:simplex-integral>]

 In particular, $\| A \| thin \| A^compose \| gt.eq 4^d \/ d !$, and 
#[#set math.equation(numbering: n => "(28)")
 $ 0 lt.eq integral_A #scale(x: 120%, y: 120%)[\(] \| A^compose \| - \| Sigma_X \| #scale(x: 120%, y: 120%)[\)] thin d X lt.eq \| A \| thin \| A^compose \| - frac(4^d, d !) . $ <eq:simplex-deficit>]

]
] <prop:simplex-integral>

#proof[
  We first convert each probability into a real integral. By (11), each active boundary coordinate has the law $epsilon.alt_i lambda \( t_i \) + i t_i$, with $t_i$ uniform on $\[ - 1 \, 1 \]$ and $epsilon.alt_i$ an independent fair sign. Consequently each fixed sign choice has joint measure $4^(- d) thin d t_I$ on $\[ - 1 \, 1 \]^d$. Writing the inferred complex vector as $Y + i X$ gives
  $ t_I = B_I X \, #h(2em) Y = Y_(I \, epsilon.alt) \( X \) . $
  The constraints that all row coordinates lie in $overline(D)$ are exactly $X in A$ and $Y in L_X$, apart from the immaterial boundary $partial A$. This boundary has measure zero, since it is contained in the finitely many hyperplanes $b_j X = plus.minus 1$. The change of variables $t_I = B_I X$ therefore gives
  #[#set math.equation(numbering: n => "(29)")
   $ P_I = D_I / 4^d integral_A sum_(epsilon.alt in { - 1 \, 1 }^I) upright(bold(1)) { \( I \, epsilon.alt \) upright(" is feasible at ") X } thin d X . $ <eq:probability-real-integral>]
  For almost every $X in "int" A$, every feasible pair $\( I \, epsilon.alt \)$ has no tight constraint outside $I$. Indeed, such an additional equality means that an extra row of $Y + i X$ lies on $partial D$. Lemma 10 makes this event null in the basis phases; the boundary law and the invertible change $t_I = B_I X$ make its set of $X$ null for each fixed sign choice. There are finitely many bases, sign choices, and extra rows, so a single null set removes all these equalities.
  Fix $X$ outside this null set. Distinct feasible pairs have distinct vectors $Y_(I \, epsilon.alt) \( X \)$. If their bases differ, a shared vector would have a tight row outside one of the bases. If their bases agree but some signs differ, the shared vector would satisfy opposite equations with the same strictly positive width, which is impossible.
  The interiors of their simplices are disjoint. To see this, let $e in "int" T_(I \, epsilon.alt)$. It has a representation $e = sum_(i in I) alpha_i epsilon.alt_i b_i$ with all $alpha_i > 0$ and $sum_i alpha_i < 1$. For every $Y in L_X$,
  $ e Y lt.eq sum_(i in I) alpha_i lambda \( b_i X \) \, $
  and equality holds at $Y_(I \, epsilon.alt) \( X \)$. Equality forces every independent equation $epsilon.alt_i b_i Y = lambda \( b_i X \)$, so this is the unique maximizer of the linear functional $e$ on $L_X$. If $e$ belonged to the interiors of two feasible simplices, their distinct vectors would both be its unique maximizer, a contradiction. Each simplex has volume $D_I \/ d !$, and their boundaries have measure zero. It follows that, for almost every $X$,
  #[#set math.equation(numbering: n => "(30)")
   $ d ! thin \| Sigma_X \| = sum_(I in cal(B)) sum_(epsilon.alt in { - 1 \, 1 }^I) D_I thin upright(bold(1)) { \( I \, epsilon.alt \) upright(" is feasible at ") X } . $ <eq:simplex-volume-sum>]
  All integrals here are measurable. For each pair, feasibility is a finite collection of closed inequalities between continuous functions of $X in "int" A$. In particular the set
  $ { \( X \, e \) : X in "int" A \, med e in Sigma_X } $
  is a finite union of products of Borel feasibility sets and fixed closed simplices. Fubini’s theorem makes $X mapsto \| Sigma_X \|$ measurable, and it is bounded by $\| C \|$. Sum (29), use (30), and apply Lemma 9. This proves the first equality and lower bound in (27). The containment $Sigma_X subset C$ proves the upper bound. In particular, the missing volume has the exact expression
  $ integral_A #scale(x: 120%, y: 120%)[\(] \| C \| - \| Sigma_X \| #scale(x: 120%, y: 120%)[\)] thin d X = \| A \| thin \| C \| - frac(4^d, d !) S . $
  It is nonnegative by containment, and $S gt.eq 1$ bounds it above by $\| A \| thin \| C \| - 4^d \/ d !$. This proves (28) and identifies the quantity that will tend to zero in the equality argument. ◻
]

For a concrete union with positive missing volume, take $b_1 = \( 1 \, 0 \)$, $b_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \)$, $b_3 = b_2 - b_1$, and $X = 0.9 \( 1 \, 1 \/ sqrt(3) \)$, as in Figure 2. Then $b_1 X = b_2 X = 0.9$ and $b_3 X = 0$. Write $a = lambda \( 0.9 \)$. The endpoint integral for $lambda$ and $cot x < 1 \/ x$ for $0 < x < pi \/ 2$ give

$ a < frac(log \( 40 \/ pi \) + 1, 5 pi) < 4 / 15 \, #h(2em) lambda \( 0 \) > 8 / pi^2 (1 - 1 / 9) > 32 / 45 . $

The second bound uses the alternating series for $F \( 1 \)$. In particular, $2 a < lambda \( 0 \)$, so the third strip in the example is strictly redundant.

#figure(
  [#image("fig/feasible-simplex-deficit.pdf.png", width: 100%)],
  caption: [Figure 2: A feasible-simplex union can leave part of the polar uncovered. Here $b_1 = \( 1 \, 0 \)$, $b_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \)$, $b_3 = \( - 1 \/ 2 \, sqrt(3) \/ 2 \)$, $C = "conv" { plus.minus b_1 \, plus.minus b_2 \, plus.minus b_3 }$, and $X = 0.9 \( 1 \, 1 \/ sqrt(3) \)$. The third strip is redundant in $L_X$, as verified above. The four witnesses $Y_(epsilon.alt_1 epsilon.alt_2)$, defined by $b_i Y = epsilon.alt_i a$ for $i = 1 \, 2$, correspond to the four triangles $"conv" \( 0 \, epsilon.alt_1 b_1 \, epsilon.alt_2 b_2 \)$ with matching sign labels. Their union is $Sigma_X = "conv" { plus.minus b_1 \, plus.minus b_2 }$. The two hatched caps have total area $sqrt(3) \/ 2$, one third of $\| C \|$. ],
) <fig:feasible-simplex-deficit>

=== 6.1 Approximation of an arbitrary convex body <approximation-of-an-arbitrary-convex-body>

#thm([Corollary 6.2.])[
  (The symmetric volume-product inequality).  #emph[For every origin-symmetric convex body $K subset bb(R)^d$, $d gt.eq 1$, 
$ \| K \| thin \| K^compose \| gt.eq frac(4^d, d !) . $

]
] <cor:symmetric-inequality>

#proof[
  Put $Q = K^compose$ and choose $a > 0$ with $a B_2^d subset Q$, where $B_2^d$ is the Euclidean unit ball. For $epsilon_j arrow.b 0$, take a finite $epsilon_j$-net in $Q$, adjoin its negatives, and let $Q_j$ be its convex hull. Thus $Q_j subset Q$, and their support functions satisfy, for every Euclidean unit vector $u$,
  $ h_Q \( u \) - epsilon_j lt.eq h_(Q_j) \( u \) lt.eq h_Q \( u \) \, #h(2em) h_Q \( u \) gt.eq a . $
  For $delta_j = epsilon_j \/ a < 1$, this implies
  #[#set math.equation(numbering: n => "(31)")
   $ \( 1 - delta_j \) Q subset Q_j subset Q \, #h(2em) K subset A_j := Q_j^compose subset \( 1 - delta_j \)^(- 1) K . $ <eq:polar-approximation>]
  The first inclusions follow from the support-function inequalities and convex separation; the second follow by polarity. In particular $Q_j$ and $A_j$ are full-dimensional symmetric polytopes for large $j$.
  Choose one vertex from each antipodal vertex pair of $Q_j$ as a row list. These rows are nonzero and span. They are pairwise nonproportional: two distinct boundary vertices on the same ray from an interior origin cannot both be extreme, and the antipodal duplication has already been removed. Their strip body is $A_j$. Proposition 11 therefore gives $\| A_j \| thin \| Q_j \| gt.eq 4^d \/ d !$. The homothetic bounds (31) show both $\| Q_j \| arrow.r \| Q \|$ and $\| A_j \| arrow.r \| K \|$, because dilation by $t > 0$ multiplies volume by $t^d$. Passing to the limit proves the assertion. No smoothness, simplicity, or general-position assumption is imposed on $K$. In dimension one the assertion can also be read directly: $K = \[ - a \, a \]$ has polar $\[ - 1 \/ a \, 1 \/ a \]$ and product $4$. ◻
]

== 7 Equality and a common feasibility witness <sec:zero-deficit>

The integral in (27) measures how much of the polar body is covered by feasible simplices. For a body attaining the sharp volume product, we shall make the uncovered volume tend to zero after adjoining one segment. Compactness then gives a feasible witness at every interior point and in every direction. The resulting representation will be the input to the equality classification.

Throughout this section $K = - K subset bb(R)^n$ is a convex body, $n gt.eq 1$, satisfying

$ \| K \| thin \| K^compose \| = frac(4^n, n !) . $

Set $Q = K^compose$, $d = n + 1$, and

#[#set math.equation(numbering: n => "(32)")
 $ B = K xor_1 \[ - 1 \, 1 \] = { \( x \, s \) : p_K \( x \) + \| s \| lt.eq 1 } \, #h(2em) C = B^compose = Q times \[ - 1 \, 1 \] . $ <eq:segment-lift>]

The polar $C$ has the two horizontal faces $Q times { 1 }$ and $Q times { - 1 }$. The representations constructed below will use vectors from these faces. In this lifted space, $X$ and $Y$ belong to $bb(R)^d$, while elements of $C$ act on them by the Euclidean pairing. Recall that the lens width $lambda : \[ - 1 \, 1 \] arrow.r \[ 0 \, oo \)$ is continuous, even and concave, with $lambda \( 0 \) > 0$ and $lambda \( t \) lt.eq lambda \( 0 \)$.

#thm([Proposition 7.1.])[
  (A representation minimizing the lens cost).  #emph[Let $K subset bb(R)^n$, $n gt.eq 1$, be an origin-symmetric convex body with $P \( K \) = 4^n \/ n !$. Put $Q = K^compose$, $d = n + 1$, and define the lifted bodies $B \, C$ by (32). For every $X in "int" B$ and every nonzero $xi = \( q \, a \) in bb(R)^n times bb(R)$, put 
$ T = p_C \( xi \) = max { p_Q \( q \) \, \| a \| } . $

 There are $1 lt.eq r lt.eq d$ vectors $c_i = \( b_i \, sigma_i \)$ with $b_i in Q$ and $sigma_i in { - 1 \, 1 }$, nonnegative numbers $alpha_i$, and a vector $Y in bb(R)^d$, such that 
#[#set math.equation(numbering: n => "(33)")
 $ xi = sum_(i = 1)^r alpha_i c_i \, #h(2em) sum_(i = 1)^r alpha_i = T \, $ <eq:optimal-representation>]

 and 
#[#set math.equation(numbering: n => "(34)")
 $ \| h dot.op Y \| lt.eq lambda \( h dot.op X \) quad \( h in C \) \, #h(2em) c_i dot.op Y = lambda \( c_i dot.op X \) quad \( 1 lt.eq i lt.eq r \) . $ <eq:common-witness>]

 In particular, for every finite representation $xi = sum_(j = 1)^s beta_j h_j$ with $beta_j gt.eq 0$ and $h_j in C$, 
#[#set math.equation(numbering: n => "(35)")
 $ sum_(i = 1)^r alpha_i lambda \( c_i dot.op X \) lt.eq sum_(j = 1)^s beta_j lambda \( h_j dot.op X \) . $ <eq:optimal-cost>]

 The choices may depend on $X$ and $xi$; the same choice satisfies (35) for all the competing representations.]
] <prop:optimal-representation>

The last coordinates $sigma_i$ split the chosen rows into two groups. In Section 8, we compare representation costs as $X$ approaches the apex $\( 0 \, 1 \)$ of $B$; the endpoint behavior of $lambda$ makes the two signs contribute differently. We now prove Proposition 13 in three steps: approximate $C$ by polytopes, locate feasible simplices near each prescribed point and direction, and pass to a common witness to compare costs.

=== 7.1 Inner polytopes and vanishing missing volume <inner-polytopes-and-vanishing-missing-volume>

The horizontal section of $B$ at height $s in \[ - 1 \, 1 \]$ is $\( 1 - \| s \| \) K$. Hence

$ \| B \| = \| K \| integral_(- 1)^1 \( 1 - \| s \| \)^n thin d s = frac(2 \| K \|, n + 1) \, #h(2em) \| C \| = 2 \| Q \| \, $

and therefore

#[#set math.equation(numbering: n => "(36)")
 $ \| B \| thin \| C \| = frac(4, n + 1) \| K \| thin \| Q \| = frac(4^d, d !) . $ <eq:lift-equality>]

Choose full-dimensional symmetric polytopes $Q_j subset Q$ converging to $Q$ in Hausdorff distance. For example, take the convex hulls of increasingly fine finite symmetric nets in $Q$, including a fixed spanning symmetric set. There are numbers $t_j in \( 0 \, 1 \)$ with $t_j arrow.r 1$ such that

$ t_j Q subset.eq Q_j subset.eq Q . $

Indeed, if $Q$ contains a Euclidean ball of radius $r_0 > 0$ and the Hausdorff error is $epsilon_j$, then on Euclidean unit directions

$ h_(Q_j) gt.eq h_Q - epsilon_j gt.eq \( 1 - epsilon_j \/ r_0 \) h_Q . $

The support-function criterion for containment gives the claim, after discarding finitely many indices and choosing $t_j$ slightly smaller if necessary.

Put $C_j = Q_j times \[ - 1 \, 1 \]$ and $B_j = C_j^compose$. The inclusions above give

#[#set math.equation(numbering: n => "(37)")
 $ t_j C subset.eq C_j subset.eq C \, #h(2em) B subset.eq B_j subset.eq t_j^(- 1) B . $ <eq:lift-sandwich>]

In particular, $\| B_j \| thin \| C_j \| arrow.r \| B \| thin \| C \|$. Use one row from each antipodal vertex pair of $C_j$ to describe $B_j$ as an intersection of strips. These rows span $bb(R)^d$, and no two are proportional: a ray from the interior point $0$ meets the boundary of a convex body in only one point. Every signed row is a vertex of $C_j$, and thus belongs to $Q_j times { - 1 \, 1 }$.

Let $Sigma_(j \, X)$ be the union of the feasible signed basis simplices for this strip description, as in (27). In particular, for every $X in "int" B_j$ it is a finite union of closed simplices contained in $C_j$. Its definition is retained also at the exceptional interior points where several constraints are simultaneously tight. The integral estimate and (36) imply

#[#set math.equation(numbering: n => "(38)")
 $ 0 lt.eq D_j & := integral_(B_j) #scale(x: 120%, y: 120%)[\(] \| C_j \| - \| Sigma_(j \, X) \| #scale(x: 120%, y: 120%)[\)] thin d X\
 & lt.eq \| B_j \| thin \| C_j \| - frac(4^d, d !) arrow.r 0 . $ <eq:vanishing-missing-volume>]

=== 7.2 From an integral deficit to each point and direction <from-an-integral-deficit-to-each-point-and-direction>

Fix $X in "int" B$ and $e in partial C$. We first construct indices $j_k arrow.r oo$ and points

#[#set math.equation(numbering: n => "(39)")
 $ X_k in "int" B_(j_k) \, #h(2em) e_k in Sigma_(j_k \, X_k) \, #h(2em) \( X_k \, e_k \) arrow.r \( X \, e \) . $ <eq:nearby-feasible-pairs>]

This is a consequence of (38) on product neighborhoods; it does not require a pointwise limit of the functions $X mapsto \| Sigma_(j \, X) \|$.

For each $k$, choose a Euclidean ball $U_k$ of positive volume contained in $"int" B ∩ B \( X \, 1 \/ k \)$. There is also a ball $V_k$ of positive volume with closure contained in $"int" C ∩ B \( e \, 1 \/ k \)$. To see this at the boundary point $e$, first move a small distance from $e$ toward $0$; the resulting point is interior because $0 in "int" C$. Take a sufficiently small ball about that point. By (37), $U_k subset "int" B_j$ for every $j$, and $V_k subset C_j$ for all sufficiently large $j$. The second assertion follows also from $max_(h in overline(V_k)) p_C \( h \) < 1$ and $t_j arrow.r 1$.

Choose $j_k > j_(k - 1)$ so large that these inclusions hold and $D_(j_k) < \| U_k \| thin \| V_k \|$. If $Sigma_(j_k \, Z)$ missed $V_k$ for every $Z in U_k$, its missing volume would be at least $\| V_k \|$ throughout $U_k$, contradicting this inequality. Thus choose $X_k in U_k$ and $e_k in Sigma_(j_k \, X_k) ∩ V_k$. This proves (39).

Choose one feasible simplex containing $e_k$. Its $d$ signed basis rows, written $c_(1 k) \, dots.h \, c_(d k) in Q_(j_k) times { - 1 \, 1 }$, give weights $theta_(i k) gt.eq 0$ satisfying

#[#set math.equation(numbering: n => "(40)")
 $ e_k = sum_(i = 1)^d theta_(i k) c_(i k) \, #h(2em) sum_(i = 1)^d theta_(i k) lt.eq 1 . $ <eq:approximate-representation>]

The coefficient left over is the weight of the simplex vertex $0$. Feasibility supplies one vector $Y_k$ such that

$ c_(i k) dot.op Y_k = lambda \( c_(i k) dot.op X_k \) quad \( 1 lt.eq i lt.eq d \) \, #h(2em) \| v dot.op Y_k \| lt.eq lambda \( v dot.op X_k \) quad upright("for every vertex ") v upright(" of ") C_(j_k) . $

Here a sign on a basis row has been absorbed using the evenness of $lambda$.

The last inequality extends to all $h in C_(j_k)$. Indeed, write $h = sum_ell s_ell v_ell$ as a convex combination of vertices. The triangle inequality followed by concavity gives

$ \| h dot.op Y_k \| lt.eq sum_ell s_ell \| v_ell dot.op Y_k \| lt.eq sum_ell s_ell lambda \( v_ell dot.op X_k \) lt.eq lambda \( h dot.op X_k \) . $

Consequently $Y_k in lambda \( 0 \) B_(j_k)$. The polar sandwich (37) makes these witnesses uniformly bounded, even if the selected bases approach singularity.

Pass to a subsequence on which $Y_k arrow.r Y$, every $c_(i k) arrow.r c_i$, and every $theta_(i k) arrow.r theta_i$. This uses a fixed finite product of compact sets: all rows belong to $Q times { - 1 \, 1 }$ and all weights belong to $\[ 0 \, 1 \]$. No independence of the limiting rows is needed. We have

$ c_i in Q times { - 1 \, 1 } \, #h(2em) e = sum_(i = 1)^d theta_i c_i \, #h(2em) theta_i gt.eq 0 \, #h(2em) sum_i theta_i lt.eq 1 \, $

and continuity of $lambda$ gives $c_i dot.op Y = lambda \( c_i dot.op X \)$ for all $i$. For arbitrary $h in C$, use $h_k = t_(j_k) h in C_(j_k)$ in the feasibility inequality and pass to the limit. It follows that

#[#set math.equation(numbering: n => "(41)")
 $ \| h dot.op Y \| lt.eq lambda \( h dot.op X \) #h(2em) \( h in C \) . $ <eq:limiting-feasibility>]

The subsequence has already been fixed; this argument proves (41) for all $h$ with the same $Y$.

Since $e in partial C$, its gauge is one. Therefore

$ 1 = p_C \( e \) lt.eq sum_(i = 1)^d theta_i p_C \( c_i \) lt.eq sum_(i = 1)^d theta_i lt.eq 1 . $

Thus $sum_i theta_i = 1$: none of the limiting mass remains at the simplex vertex $0$.

=== 7.3 Comparison with every positive representation <comparison-with-every-positive-representation>

To prove Proposition 13, fix its $X$ and nonzero $xi$, and apply the preceding construction to $e = xi \/ T in partial C$. Set $alpha_i = T theta_i$ and discard any zero weights if desired. This gives at most $d$ rows and proves (33) and (34). For any finite competing representation $xi = sum_j beta_j h_j$, $beta_j gt.eq 0$, $h_j in C$, the common witness gives

$ sum_i alpha_i lambda \( c_i dot.op X \) = xi dot.op Y = sum_j beta_j h_j dot.op Y lt.eq sum_j beta_j lambda \( h_j dot.op X \) . $

This proves (35) and completes the proof of Proposition 13. In particular, the conclusion holds for each prescribed $X$ and $xi$, including directions for which every limiting representation is degenerate.

== 8 From endpoint costs to metric medians <sec:median>

We now convert the optimal representations into a geometric property of the polar body. A #emph[metric median] of three points in a normed space is a point that lies between every pair: if the points are $x_0 \, x_1 \, x_2$, a median $m$ satisfies

$ parallel x_i - x_j parallel = parallel x_i - m parallel + parallel m - x_j parallel #h(2em) \( 0 lt.eq i < j lt.eq 2 \) . $

The median need not be unique. Its existence will imply the ball intersection property that characterizes linear Hanner bodies.

#thm([Proposition 8.1.])[
  (Medians of an equality body).  #emph[Let $K subset bb(R)^n$, $n gt.eq 1$, be an origin-symmetric convex body with $P \( K \) = 4^n \/ n !$, and put $Q = K^compose$. Every triple of points in $\( bb(R)^n \, p_Q \)$ has a metric median.]
] <prop:metric-median>

#proof[
  Write $parallel dot.op parallel = p_Q$. Translation reduces the triple to $0 \, x \, y$. If two points coincide, that repeated point is a median, so assume that $0 \, x \, y$ are distinct. Set
  $ p_1 = parallel x parallel \, #h(2em) p_2 = parallel y parallel \, #h(2em) p = parallel x - y parallel \, #h(2em) s = p_1 + p_2 \, #h(2em) a = p_1 - p_2 . $
  All three distances are positive. The triangle and reverse triangle inequalities give $s gt.eq p gt.eq \| a \|$. Define
  #[#set math.equation(numbering: n => "(42)")
   $ A_(+) = frac(p + a, 2) \, #h(2em) A_(-) = frac(p - a, 2) \, #h(2em) c = frac(s - p, 2) . $ <eq:median-radii>]
  These numbers are nonnegative, with $A_(+) + A_(-) = p$, $c + A_(+) = p_1$, and $c + A_(-) = p_2$.
  ===== 8.1 The compact set of aggregate directions. <the-compact-set-of-aggregate-directions.>
  Let
  #[#set math.equation(numbering: n => "(43)")
   $ D_0 = { r_(+) - r_(-) : med r_(+) + r_(-) = x - y \, quad parallel r_(+) parallel lt.eq A_(+) \, quad parallel r_(-) parallel lt.eq A_(-) } . $ <eq:aggregate-set>]
  Our goal is to prove $x + y in D_0 + \( s - p \) Q$. Such membership supplies $r_(+) \, r_(-)$ for which $m = x - r_(+) = y + r_(-)$ has distances to $0 \, x \, y$ bounded by $c \, A_(+) \, A_(-)$, respectively; the triangle inequalities then force the three median equalities. We shall prove this membership by estimating support functions in each direction.
  The set $D_0$ is compact and convex: it is the linear image of the intersection of $A_(+) Q times A_(-) Q$ with the affine subspace $r_(+) + r_(-) = x - y$. It is nonempty, since $r_plus.minus = \( A_plus.minus \/ p \) \( x - y \)$ satisfy the constraints. This also covers $A_(+) = 0$ or $A_(-) = 0$.
  ===== 8.2 Endpoint comparison. <endpoint-comparison.>
  Fix $u in "int" K$ and let $X_delta = \( delta u \, 1 - delta \)$, $0 < delta < 1$. The lifted body $B = K xor_1 \[ - 1 \, 1 \]$ contains $X_delta$ in its interior because
  $ p_B \( X_delta \) = delta p_K \( u \) + 1 - delta < 1 . $
  Apply Proposition 13 with this $X_delta$ and $\( q \, a \) = \( x - y \, p_1 - p_2 \)$. Its total weight is $T = max { parallel q parallel \, \| a \| } = p$. We obtain rows $\( b_i \, sigma_i \) in Q times { - 1 \, 1 }$ and weights $alpha_i gt.eq 0$ satisfying (33) and (35). Their aggregates
  $ r_plus.minus = sum_(sigma_i = plus.minus 1) alpha_i b_i $
  have $r_(+) + r_(-) = x - y$. Since $sum_(sigma_i = plus.minus 1) alpha_i = \( p plus.minus a \) \/ 2 = A_plus.minus$, they satisfy $parallel r_plus.minus parallel lt.eq A_plus.minus$ and hence $r_(+) - r_(-) in D_0$. No choice of these representations across different $u$ or $delta$ is required.
  For $b in Q$ and $sigma = plus.minus 1$, evenness of $lambda$ gives
  $ lambda #scale(x: 120%, y: 120%)[\(] chevron.l \( b \, sigma \) \, X_delta chevron.r #scale(x: 120%, y: 120%)[\)] = lambda #scale(x: 120%, y: 120%)[\(] 1 - delta \( 1 - sigma chevron.l b \, u chevron.r \) #scale(x: 120%, y: 120%)[\)] . $
  The factors $1 - sigma chevron.l b \, u chevron.r$ belong to $\[ 1 - p_K \( u \) \, 1 + p_K \( u \) \]$, a compact subinterval of $\( 0 \, oo \)$. Lemma 7 therefore gives an error $epsilon_u \( delta \) arrow.r 0$ such that
  #[#set math.equation(numbering: n => "(44)")
   $ lr(|frac(lambda \( chevron.l \( b \, sigma \) \, X_delta chevron.r \), lambda \( 1 - delta \)) - 1 + sigma chevron.l b \, u chevron.r|) lt.eq epsilon_u \( delta \) quad \( b in Q \, med sigma = plus.minus 1 \) . $ <eq:median-endpoint-error>]
  In particular, the normalized cost of the optimal representation is at least
  $ p - chevron.l r_(+) - r_(-) \, u chevron.r - p epsilon_u \( delta \) gt.eq p - h_(D_0) \( u \) - p epsilon_u \( delta \) . $
  Compare this cost, using (35), with the two-term representation
  $ \( x - y \, a \) = p_1 \( x \/ p_1 \, 1 \) + p_2 \( - y \/ p_2 \, - 1 \) . $
  Both rows belong to $Q times { - 1 \, 1 }$. By (44), their normalized cost tends to $s - chevron.l x + y \, u chevron.r$. Letting $delta arrow.b 0$ yields
  #[#set math.equation(numbering: n => "(45)")
   $ chevron.l x + y \, u chevron.r lt.eq h_(D_0) \( u \) + s - p #h(2em) \( u in "int" K \) . $ <eq:median-support-interior>]
  The error was uniform only over $b \, sigma$ for the fixed $u$; that is all this limit requires.
  ===== 8.3 Separation and the median. <separation-and-the-median.>
  Continuity extends (45) to $u in K$. For any nonzero $v in bb(R)^n$, the point $u = v \/ h_Q \( v \)$ lies on $partial K$, by (2). Homogeneity of support functions gives
  $ chevron.l x + y \, v chevron.r lt.eq h_(D_0) \( v \) + \( s - p \) h_Q \( v \) . $
  The same inequality holds at $v = 0$. The right side is the support function of the compact convex set $D_0 + \( s - p \) Q$, with the convention $0 Q = { 0 }$. Convex separation therefore implies
  #[#set math.equation(numbering: n => "(46)")
   $ x + y in D_0 + \( s - p \) Q . $ <eq:median-membership>]
  Choose the corresponding pair $r_(+) \, r_(-)$ in (43), and put
  $ m = x - r_(+) = y + r_(-) . $
  Then $2 m = x + y - \( r_(+) - r_(-) \)$, so (46) gives
  $ parallel m parallel lt.eq c \, #h(2em) parallel x - m parallel lt.eq A_(+) \, #h(2em) parallel y - m parallel lt.eq A_(-) . $
  The triangle inequality forces all three bounds to be equalities:
  $ p_1 & lt.eq parallel m parallel + parallel x - m parallel lt.eq c + A_(+) = p_1 \,\
p_2 & lt.eq parallel m parallel + parallel y - m parallel lt.eq c + A_(-) = p_2 . $
  Thus $m$ lies between $0 \, x$ and between $0 \, y$, and
  $ parallel x - m parallel + parallel m - y parallel = A_(+) + A_(-) = p = parallel x - y parallel . $
  This proves the median property. The argument permits $c = 0$ or either $A_plus.minus = 0$, so saturated triangle inequalities require no limiting argument. ◻
]

=== 8.1 Three balls and the equality classification <three-balls-and-the-equality-classification>

A normed space has the #emph[three-ball intersection property], also called the #emph[3.2 intersection property], if any three closed balls that intersect pairwise have a common point. Their radii may differ. The equivalence between this intersection property and the metric-median condition is Lima’s classical norm-additive decomposition criterion #cite(label("Lima1978")) Theorem 1.2; see also Hansen–Lima #cite(label("HansenLima1981")) Theorem 3.6(4). We include the short direction needed here, with arbitrary radii.

#thm([Lemma 8.2.])[
  (From medians to three balls).  #emph[Suppose every triple of points in a real normed space has a metric median. Then the space has the three-ball intersection property, including balls of radius zero.]
] <lem:three-balls>

#proof[
  Consider pairwise-intersecting balls with centers $x_1 \, x_2 \, x_3$ and radii $r_1 \, r_2 \, r_3 gt.eq 0$. Let $m$ be a metric median of their centers, and set $d_i = parallel m - x_i parallel$. Pairwise intersection and the median property imply
  $ d_i + d_j = parallel x_i - x_j parallel lt.eq r_i + r_j #h(2em) \( i eq.not j \) . $
  If every $d_i lt.eq r_i$, the median is a common point. Otherwise, after relabeling, $t = d_1 - r_1 > 0$. For $j = 2 \, 3$ the displayed inequalities give $d_j + t lt.eq r_j$, so no other ball excludes $m$. Since $0 < t lt.eq d_1$, the point
  $ z = m + t / d_1 \( x_1 - m \) $
  is well defined and lies on the segment from $m$ to $x_1$. It satisfies
  $ parallel z - x_1 parallel & = d_1 - t = r_1 \,\
parallel z - x_j parallel & lt.eq parallel z - m parallel + d_j = t + d_j lt.eq r_j quad \( j = 2 \, 3 \) . $
  Thus $z$ lies in all three balls. This includes $r_1 = 0$, when $z = x_1$. ◻
]

The required structure theorem is due to Hansen and Lima. In their terminology the balls are closed and have arbitrary radii #cite(label("HansenLima1981")) Section 1.

#thm([Theorem 8.3.])[
  (Hansen–Lima).  #emph[A nonzero finite-dimensional real Banach space with the 3.2 intersection property is linearly isometric to a space obtained from the real line by finitely many $ell_1$ and $ell_oo$ direct sums.]
] <thm:hansen-lima>

This is #cite(label("HansenLima1981")) Corollary 7.4. The two direct-sum norms are exactly those in (4), so their unit balls are Hanner polytopes.

#thm([Proposition 8.4.])[
  (Classification of equality).  #emph[If an origin-symmetric convex body $K subset bb(R)^n$, $n gt.eq 1$, satisfies $P \( K \) = 4^n \/ n !$, then it is a linear Hanner body.]
] <prop:equality-classification>

#proof[
  Put $Q = K^compose$. Proposition 14 and Lemma 15 give the 3.2 intersection property for $\( bb(R)^n \, p_Q \)$. This is a real Banach space, since every finite-dimensional normed space is complete. Theorem 16 gives an invertible linear map $T$ and a Hanner polytope $H$ with $Q = T H$. By (3) and Lemma 5,
  $ K = Q^compose = T^(- sans(T)) H^compose $
  is a linear Hanner body. The converse was proved in Lemma 5; together with Corollary 12, this completes Theorem 1. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
