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

#align(center)[#text(size: 16pt, weight: "bold")[Relative independence of the separable quotient problem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Every infinite-dimensional Banach space contains a separable infinite-dimensional closed subspace: take the closed span of a countable linearly independent set. The corresponding assertion for quotients is the #emph[separable quotient problem], traditionally attributed to Banach and Mazur. For a scalar field $bb(F) in { bb(R) \, bb(C) }$, let $upright("SQ")_(bb(F))$ denote the statement

#quote(block: true)[
  Every infinite-dimensional Banach space over $bb(F)$ admits a bounded linear surjection onto a separable infinite-dimensional Banach space.
]

Equivalently, each such space $X$ has a closed subspace $M$ for which $X \/ M$ is separable and infinite dimensional. The equivalence follows by applying the open mapping theorem to the induced bijection from a space modulo the kernel of a surjection.

We work with the axiom of Choice throughout. Write $frak(c) = 2^(ℵ_0)$ for the cardinality of the continuum. For an uncountable cardinal $kappa$, a probability measure on $cal(P) \( kappa \)$ is #emph[$kappa$-additive] if it is additive on pairwise disjoint families of cardinality strictly less than $kappa$; the sum over such a family means the supremum of its finite subsums. We say that $kappa$ is #emph[real-valued measurable] if it carries such a measure vanishing on singletons. In particular, the hypothesis below requires a measure on #emph[every subset] of $frak(c)$, with this stronger additivity property.

The two implications below are proved in ZFC. Their hypotheses are then realized in models at the indicated consistency strengths; this gives the relative-independence conclusion.

#thm([Theorem 1.1.])[
  #emph[For each $bb(F) in { bb(R) \, bb(C) }$, ZFC proves the following implications.]
  + #emph[If $frak(c)$ is real-valued measurable, then $upright("SQ")_(bb(F))$ holds.]
  + #emph[If the continuum hypothesis holds, then $upright("SQ")_(bb(F))$ fails.]
  #emph[Consequently, if ZFC with a measurable cardinal is consistent, then $upright("SQ")_(bb(F))$ is independent of ZFC. Consistency of its failure requires only consistency of ZFC.]
] <intro:main>

The CH counterexamples already occur at norm density $ℵ_1$, the smallest possible nonseparable density (Corollary 31). At this density, an earlier positive theorem yields a sharper consistency conclusion. Let $upright("SQ")_(bb(F))^(ℵ_1)$ denote the assertion that every Banach space over $bb(F)$ of norm density exactly $ℵ_1$ has a separable infinite-dimensional quotient.

#thm([Corollary 1.2.])[
  #emph[If ZFC is consistent, then $upright("SQ")_(bb(F))^(ℵ_1)$ is independent of ZFC for each $bb(F) in { bb(R) \, bb(C) }$.]
] <intro:small-density>

The positive side of this corollary uses the density criterion of Saxon and Sánchez Ruiz described below, together with Martin’s axiom. The negative side uses the counterexample constructed here. The measurable cardinal hypothesis in Theorem 1 concerns the unrestricted quotient assertion.

===== 1.1 History and methods. <history-and-methods.>

The history and many positive cases of the problem are surveyed in #cite(label("Brech2025")) #cite(label("FerrandoKakolLopezPellicerSliwa2018")). Brech notes that the problem is not stated explicitly in Banach’s 1932 book and identifies Rosenthal’s 1969 paper as an early written formulation #cite(label("Brech2025")) p. 74. Johnson and Rosenthal developed the weak-star basic-sequence method and proved that every separable infinite-dimensional Banach space has an infinite-dimensional quotient with a Schauder basis #cite(label("JohnsonRosenthal1972")). Argyros, Dodos and Kanellopoulos proved the positive answer for every dual Banach space #cite(label("ArgyrosDodosKanellopoulos2008")) Theorem 15. Their Proposition 16, based on work of Hagler and Johnson #cite(label("HaglerJohnson1977")), also shows that an unconditional basic sequence in $X^(*)$ gives a separable infinite-dimensional quotient of $X$ with an unconditional basis. This implication is central to our positive argument. Morris and Yost give a common sufficient condition covering both dual spaces and spaces that are the closed linear span of a weakly compact subset #cite(label("MorrisYost2020")). More recently, Patri states a $c_0$-quotient criterion for $cal(L)_oo$ spaces admitting an infinite-dimensional Schur quotient, in which weakly convergent sequences converge in norm. He applies the criterion to a class of nonseparable Bourgain–Pisier spaces #cite(label("Patri2026")).

Earlier set-theoretic positive results depend on the density of the space. Write $frak(b)$ for the least cardinality of a family in $bb(N)^(bb(N))$ unbounded under eventual domination, where $f lt.eq^(*) g$ means $f \( n \) lt.eq g \( n \)$ for all sufficiently large $n$. Saxon and Sánchez Ruiz proved that every infinite-dimensional Banach space of density less than $frak(b)$ has a separable infinite-dimensional quotient #cite(label("SaxonSanchezRuiz1996")); see also #cite(label("Brech2025")) Theorem 2.1. In particular, the positive assertion at density $ℵ_1$ already follows under $frak(b) > ℵ_1$. For large densities, Dodos, Lopez-Abad and Todorčević proved, relative to infinitely many strongly compact cardinals, consistency with GCH of a positive answer for every Banach space of density at least $ℵ_omega$ #cite(label("DodosLopezAbadTodorcevic2011")). The positive implication here applies to every infinite-dimensional Banach space. The negative construction uses conditional norming operations in the tradition of Gowers–Maurey #cite(label("GowersMaurey1993")), branch functionals as in James-tree constructions #cite(label("James1974")) #cite(label("ArgyrosArvanitakisTolias2006")), and coding by order positions in coherent finite ordinal closures #cite(label("ArgyrosLopezAbadTodorcevic2005")) Section 2.4. We give the particular construction and all its estimates in full.

We write $B_Z$ and $S_Z$ for the closed unit ball and unit sphere of a Banach space $Z$, and $\[ z_i : i in I \]$ for a norm-closed linear span. All separability and density assertions about subsets of dual spaces refer to the norm topology unless another topology is specified.

===== 1.2 The common criterion. <the-common-criterion.>

For a closed subspace $F subset X^(*)$, define the evaluation map

$ R_F : X arrow.r F^(*) \, #h(2em) \( R_F x \) \( f \) = f \( x \) . $

A separable infinite-dimensional quotient exists precisely when some infinite-dimensional closed $F$ has norm-separable evaluation image. In the necessary direction $F$ may itself be chosen separable. Section 2 proves this criterion, including the surjectivity step. The two constructions in the paper use this same criterion in opposite ways.

For the positive implication, start with a putative counterexample $X$ and a separable infinite-dimensional subspace $E subset X^(*)$. The measure first forces $R_E \( B_X \)$ to have density $frak(c)$: a smaller dense set would allow simultaneous summable evaluations on a suitable basic sequence, and hence a separable quotient. From the large evaluation image we construct a seminormalized family in $X^(*)$ which vanishes almost everywhere at each point of $X$. Odell–Rosenthal supplies sequential bidual approximations. Coding these approximations lets us use ordinary Borel Fubini to select an unconditional basic sequence from that family. This contradicts the Hagler–Johnson consequence above. The Borel coding is what permits the integration argument; no interchange theorem for arbitrary power-set measures is needed.

For the negative implication, we build a dual space $E = X_0^(*)$ with coordinate vectors indexed by $omega_1$. We construct paths from successive finitely supported functionals with bounded partial sums; each path therefore defines a functional on $E$. Each piece carries an integer weight. The coding makes distinct paths share only finitely many weights, yielding uniform estimates for combinations of their tails. A block argument then gives, on every infinite-dimensional subspace of $E$, uncountably many norm-separated restrictions of path functionals. CH lets us assign all these paths to coordinates of $E$. A small perturbation of the quotient map $E^(*) arrow.r E^(*) \/ X_0$ produces a new predual $X$ whose evaluations approximate all path cosets. Its evaluation image on every separable infinite-dimensional subspace of $X^(*) tilde.eq E$ is nonseparable, excluding all separable infinite-dimensional quotients. The perturbation lemma in Section 9 isolates this change of predual from the combinatorial construction.

===== 1.3 Organization. <organization.>

Section 2 develops the evaluation criterion and a selection lemma for strictly singular operators. Section 3 proves the positive implication over $bb(R)$, and Section 4 transfers it to $bb(C)$ while preparing the corresponding transfer for counterexamples. Sections 5–Section 8 construct the coordinate dual, prove convergence for its block sequences, establish the required block estimates, and separate functionals on arbitrary subspaces. Section 9 changes its predual and proves the CH counterexample. Section 10 supplies the set-theoretic models and proves both Theorem 1 and the sharper restricted-density Corollary 2.

== 2 Separable evaluation images <sec:evaluation>

The positive and negative arguments will use the same test for the existence of a separable quotient. Let $X$ be a Banach space over $bb(K) in { bb(R) \, bb(C) }$, and write $B_X$ for its closed unit ball. For a closed subspace $F subset X^(*)$, define the evaluation operator

$ R_F : X arrow.r F^(*) \, #h(2em) \( R_F x \) \( f \) = f \( x \) . $

The relevant condition is norm separability of $R_F \( X \)$, rather than separability of $F$ itself. We first explain why this condition yields an actual quotient.

#thm([Lemma 2.1.])[
  (Prefix normers and surjectivity).  #emph[Let $\( f_n \)_(n gt.eq 1)$ be a sequence in $X^(*)$ with $0 < a lt.eq parallel f_n parallel lt.eq b < oo$. Suppose that, for each $m gt.eq 1$, a finite set $D_m subset B_X$ satisfies 
#[#set math.equation(numbering: n => "(1)")
 $ max_(d in D_m) \| v \( d \) \| gt.eq 1 / 2 parallel v parallel quad #scale(x: 120%, y: 120%)[\(] v in "span" { f_1 \, dots.h \, f_m } #scale(x: 120%, y: 120%)[\)] \, #h(2em) f_n \( D_m \) = { 0 } quad \( n > m \) . $ <ev:normers>]

 Then $\( f_n \)$ is a basic sequence whose prefix projections have norm at most $2$, and its coefficients satisfy 
#[#set math.equation(numbering: n => "(2)")
 $ \| c_n \| lt.eq 4 / a ∥sum_i c_i f_i∥ quad upright("for every finite sum.") $ <ev:coefficients>]

 Put $G = overline("span") { f_n : n gt.eq 1 }$, let $f_n^(\#)$ be its basis coefficient functionals, and put $Z = overline("span") { f_n^(\#) : n gt.eq 1 } subset G^(*)$. If $R_G \( X \) subset Z$, then $R_G : X arrow.r Z$ is onto. More precisely, its adjoint satisfies 
$ parallel R_G^(*) h parallel gt.eq 1 / 2 parallel h parallel #h(2em) \( h in Z^(*) \) . $

]
] <ev:prefix>

#proof[
  The vectors are linearly independent: a vector $f_n$ in the preceding span would vanish on its norming set $D_(n - 1)$ and hence be zero. For $v = sum_(i = 1)^N c_i f_i$ and $m lt.eq N$, the values of $v$ on $D_m$ equal those of its prefix. Thus
  $ ∥sum_(i = 1)^m c_i f_i∥ lt.eq 2 max_(d in D_m) \| v \( d \) \| lt.eq 2 parallel v parallel . $
  The prefix projections extend to $G$ and converge to the identity there, because they do so on the dense subspace of finite sums. Taking differences of two consecutive prefixes gives (2).
  Write $T = R_G : X arrow.r Z$. For $h in Z^(*)$, set
  $ v_m = sum_(i = 1)^m h \( f_i^(\#) \) f_i in G . $
  If $d in D_m$, then $T d = sum_(i = 1)^m f_i \( d \) f_i^(\#)$, so $\( T^(*) h \) \( d \) = v_m \( d \)$. Consequently $parallel T^(*) h parallel gt.eq parallel v_m parallel \/ 2$. For every finite linear combination $u$ of the coefficient functionals, we have $h \( u \) = u \( v_m \)$ for all sufficiently large $m$. Since these combinations are dense in $Z$,
  $ parallel h parallel lt.eq sup_m parallel v_m parallel lt.eq 2 parallel T^(*) h parallel . $
  This argument does not require the vectors $v_m$ to converge.
  We recall why an adjoint lower bound gives surjectivity. If $parallel T^(*) z^(*) parallel gt.eq c parallel z^(*) parallel$ for every $z^(*) in Z^(*)$, Hahn–Banach separation of the balanced convex set $overline(T \( B_X \))$ gives $c B_Z subset overline(T \( B_X \))$. For a residual $z eq.not 0$, choose $x in X$ with $parallel x parallel lt.eq parallel z parallel \/ c$ and $parallel z - T x parallel lt.eq parallel z parallel \/ 2$. Repeating this step makes the residuals decrease geometrically and the chosen vectors form an absolutely convergent series in $X$. Its sum maps to the original $z$ and has norm at most $2 parallel z parallel \/ c$. Apply this with $c = 1 \/ 2$. ◻
]

#thm([Proposition 2.2.])[
  (Evaluation criterion).  #emph[For an infinite-dimensional real or complex Banach space $X$, the following are equivalent:]
  + #emph[$X$ admits a bounded linear surjection onto a separable infinite-dimensional Banach space.]
  + #emph[There is a closed infinite-dimensional subspace $F subset X^(*)$ for which $R_F \( X \)$ is norm separable.]
  #emph[In the second assertion, $F$ may be required to be separable.]
] <ev:criterion>

#proof[
  Suppose that $T : X arrow.r Y$ is such a surjection. Choose a closed separable infinite-dimensional subspace $U subset Y^(*)$. The open mapping theorem makes $T^(*)$ bounded below, so $F = T^(*) U$ is a closed separable infinite-dimensional subspace of $X^(*)$. Under the isomorphism $T^(*) \|_U : U arrow.r F$, evaluation at $x$ becomes evaluation at $T x$. The evaluation map $Y arrow.r U^(*)$ is bounded and $Y$ is separable; hence $R_F \( X \)$ is norm separable.
  Conversely, assume the second assertion and choose $x_j in X$ so that ${ R_F x_j : j gt.eq 1 }$ is norm dense in $R_F \( X \)$. We construct $f_n in F$ of norm one. At stage $n$, require $f_n$ to annihilate $x_1 \, dots.h \, x_n$ and all finite sets $D_m$ already chosen, $m < n$. These conditions define a finite-codimensional subspace of $F$, so a unit vector satisfying them exists. After choosing $f_n$, choose $D_n subset B_X$ that is $1 \/ 2$-norming for $"span" { f_1 \, dots.h \, f_n }$. Such a finite set exists by compactness of the finite-dimensional unit sphere and the definition of the dual norm.
  Use the spaces $G$ and $Z$ from Lemma 3. For each $j$,
  $ R_G x_j = sum_(i < j) f_i \( x_j \) f_i^(\#) in Z . $
  Restriction from $F^(*)$ to $G^(*)$ is contractive. Density of the evaluations at the $x_j$, and closedness of $Z$, therefore give $R_G \( X \) subset Z$. Lemma 3 makes $R_G : X arrow.r Z$ onto. The coefficient functionals are linearly independent, so $Z$ is separable and infinite-dimensional. The space $G$ also supplies the separable witness in the second assertion. ◻
]

=== 2.1 Small restrictions of strictly singular operators <small-restrictions-of-strictly-singular-operators>

We will use one elementary selection principle both in changing scalars and in the later construction on arbitrary subspaces. An operator is #emph[strictly singular] if its restriction to no closed infinite-dimensional subspace is bounded below.

#thm([Lemma 2.3.])[
  #emph[Let $T : Y arrow.r Z$ be a strictly singular operator between real or complex Banach spaces. For every closed infinite-dimensional $M subset Y$ and every $epsilon > 0$, there is a closed infinite-dimensional $N subset M$ such that $parallel T \|_N parallel lt.eq epsilon$. For a finite family of strictly singular operators on $Y$, the same $N$ can be chosen to satisfy this bound for every operator in the family.]
] <ev:small>

#proof[
  Inductively choose unit vectors $y_n in M$ and finite $1 \/ 2$-norming sets in $B_(Y^(*))$ for their prefix spans. Require each new vector to annihilate all earlier norming sets and to satisfy $parallel T y_n parallel < epsilon 2^(- n) \/ 4$. The annihilation conditions leave an infinite-dimensional closed subspace; strict singularity says that $T$ is not bounded below there, so the choice is possible. The prefix calculation in Lemma 3, with vectors and norming functionals interchanged, shows that $\( y_n \)$ is basic and $\| a_n \| lt.eq 4 parallel sum_i a_i y_i parallel$. Therefore
  $ ∥T sum_n a_n y_n∥ lt.eq 4 sum_n parallel T y_n parallel ∥sum_n a_n y_n∥ lt.eq epsilon ∥sum_n a_n y_n∥ . $
  Continuity gives the bound on $N = overline("span") { y_n : n gt.eq 1 }$. For finitely many operators, apply the result successively inside the subspace already obtained. Restrictions of strictly singular operators remain strictly singular, and previous bounds persist on smaller subspaces. ◻
]

== 3 A measure on the continuum gives separable quotients <pos:section>

We prove the positive implication over the real field. The argument has two steps. First we show that failure of a separable infinite-dimensional quotient forces an evaluation image of maximal density, and use that image to construct a dual family whose evaluation at each fixed vector is almost surely zero. We then code the family by sequences in a separable space and select an infinite sequence satisfying all finite suppression estimates.

=== 3.1 The measure hypothesis <the-measure-hypothesis>

Throughout this section let $kappa = frak(c) = 2^(ℵ_0)$, regarded as its initial ordinal. Assume that $mu$ is a probability measure on $cal(P) \( kappa \)$, vanishes on singletons, and is #emph[$kappa$-additive] in the following convention: for every disjoint family $\( A_xi \)_(xi < lambda)$ with $lambda < kappa$,

$ mu #scale(x: 180%, y: 180%)[\(] union.big_(xi < lambda) A_xi #scale(x: 180%, y: 180%)[\)] = sum_(xi < lambda) mu \( A_xi \) \, $

where a sum of nonnegative terms is the supremum of its finite subsums. In particular, $mu$ is countably additive, and a union of fewer than $kappa$ null sets is null: disjointify such a family before applying the displayed identity. No additivity assertion for families of size $kappa$ is intended.

#thm([Lemma 3.1.])[
  #emph[The cardinal $kappa$ is regular. The measure $mu$ is atomless, and for each positive integer $N$ the set $kappa$ has a partition into $N$ sets of measure $1 \/ N$.]
] <pos:measure>

#proof[
  Every set of cardinality less than $kappa$ is null. If $"cf" \( kappa \) < kappa$, a cofinal family of fewer than $kappa$ initial segments would therefore express $kappa$ as a null set.
  Fix an injection $b : kappa arrow.r { 0 \, 1 }^(bb(N))$. If $A$ were a positive atom, then for each successive bit one of the two cells would have full measure in the preceding cell of $A$. This gives decreasing subsets $A_n subset A$ of measure $mu \( A \)$ on which the first $n$ bits are fixed. Their intersection has at most one point, whereas countable additivity gives it measure $mu \( A \) > 0$. This contradiction proves atomlessness.
  We include the elementary divisibility argument. Every positive set has a positive subset of measure at most any given $epsilon > 0$: repeatedly split a positive set into two positive sets and retain the smaller part. A maximal disjoint family of such small positive subsets of a measurable set $A$ is countable, since the measure is finite, and covers $A$ modulo a null set. For $0 lt.eq t lt.eq mu \( A \)$, successive unions of these pieces either attain measure $t$, converge upwards to $t$, or first cross $t$. In the last case the union before that crossing has measure in $\( t - epsilon \, t \)$. Thus one can approximate $t$ from below with error at most $epsilon$. Apply this construction repeatedly in the remainder of $A$, with errors tending to zero, and take the union. It has measure exactly $t$. Removing sets of measure $1 \/ N$ one at a time gives the required partition. ◻
]

=== 3.2 The density forced by failure of a quotient <the-density-forced-by-failure-of-a-quotient>

The evaluation operator $R_E : X arrow.r E^(*)$ for $E subset X^(*)$ is as in Proposition 4. The following argument uses the finite-dimensional Euclidean sections supplied by Dvoretzky’s Theorem #cite(label("Dvoretzky1961")) #cite(label("Figiel1976")).

#thm([Lemma 3.2.])[
  #emph[Let $X$ be a real Banach space with no separable infinite-dimensional quotient, and let $E subset X^(*)$ be an infinite-dimensional separable closed subspace. Under the measure hypothesis above, the set $D = R_E \( B_X \) subset B_(E^(*))$ has norm density $kappa$.]
] <pos:density>

#proof[
  Every member of $E^(*)$ is determined by its values on a fixed countable dense subset of $E$, so $\| D \| lt.eq frak(c) = kappa$. Suppose that $A subset D$ is norm dense and $\| A \| < kappa$.
  For $n gt.eq 1$ put $N_n = 16^n$. Inductively choose vectors $\( u_(n \, j) \)_(j = 1)^(N_n) subset E$ such that
  #[#set math.equation(numbering: n => "(3)")
   $ parallel a parallel_2 lt.eq parallel sum_(j = 1)^(N_n) a_j u_(n \, j) #scale(x: 180%, y: 180%)[parallel] lt.eq 2 parallel a parallel_2 #h(2em) \( a in bb(R)^(N_n) \) . $ <pos:rows>]
  After choosing row $n$, choose a finite set $D_n subset B_X$ that $1 \/ 2$-norms the span of all rows up to $n$. Require every subsequent row to annihilate $D_n$. At each step the finitely many annihilation conditions leave an infinite-dimensional closed subspace of $E$, so Dvoretzky’s Theorem gives (3) there.
  For each $n$, Lemma 6 gives a map $j_n : kappa arrow.r { 1 \, dots.h \, N_n }$ whose fibers have measure $1 \/ N_n$. For $y in A$, (3) implies $parallel \( y \( u_(n \, j) \) \)_(j = 1)^(N_n) parallel_2 lt.eq 2$, and hence
  $ integral_kappa \| y \( u_(n \, j_n \( alpha \)) \) \| thin d mu \( alpha \) lt.eq 2 / sqrt(N_n) . $
  The sum of these expectations is finite. Monotone convergence shows that $sum_n \| y \( u_(n \, j_n \( alpha \)) \) \| < oo$ for almost every $alpha$. Intersecting these conull sets over $y in A$ is valid because $\| A \| < kappa$. Choose one $alpha$ in their intersection and set $g_n = u_(n \, j_n \( alpha \))$.
  The vectors $g_n$ have norms between $1$ and $2$, and the sets $D_n$ are actual half-normers of their prefix spans, annihilated by all later vectors. Lemma 3 therefore makes $\( g_n \)$ basic, with coefficient functionals $g_n^(\#) in G^(*)$ of norm at most $4$, where $G = \[ g_n : n gt.eq 1 \]$. Set $Z = \[ g_n^(\#) : n gt.eq 1 \] subset G^(*)$. For $y in A$, the series $sum_n y \( g_n \) g_n^(\#)$ converges in $G^(*)$, since its tail has norm at most $4 sum_(n > m) \| y \( g_n \) \|$. On the dense span of the $g_n$ its sum agrees with $y \|_G$, so $y \|_G in Z$. Restriction is contractive and $A$ is dense in $D$, whence $R_G \( B_X \) subset Z$. Scaling gives $R_G \( X \) subset Z$. Lemma 3 now says that $R_G : X arrow.r Z$ is onto, contradicting the hypothesis on $X$. ◻
]

Uniform sampling in this proof requires only the indicated marginal distributions; the maps $j_n$ need not be independent.

The maximal density lets us separate each initial span in a transfinite enumeration of $D$ from a point outside that span. The resulting dual functional annihilates every earlier point of the enumeration. Thus, at any fixed point, the exceptional indices form a set of cardinality less than $kappa$ and have measure zero.

#thm([Lemma 3.3.])[
  #emph[Let $X$ and $E$ satisfy the hypotheses of Lemma 7. There are $epsilon > 0$ and a family $\( h_alpha \)_(alpha < kappa)$ in $S_(E^(* *))$ such that the functionals $f_alpha = h_alpha compose R_E in X^(*)$ satisfy 
#[#set math.equation(numbering: n => "(4)")
 $ epsilon < parallel f_alpha parallel lt.eq 1 #h(2em) \( alpha < kappa \) \, $ <pos:seminormalized>]

 and, for every $y in R_E \( B_X \)$, 
#[#set math.equation(numbering: n => "(5)")
 $ mu { alpha : h_alpha \( y \) eq.not 0 } = 0 . $ <pos:pointwise-null>]

]
] <pos:family>

#proof[
  Write $D = R_E \( B_X \)$. There is a $delta$-separated subset of $D$ of cardinality $kappa$ for some $delta > 0$. Otherwise, choose a maximal $1 \/ n$-separated subset for each $n gt.eq 1$. Each would have cardinality less than $kappa$, and their union would be dense in $D$ with cardinality less than $kappa$, by regularity. This contradicts Lemma 7.
  Enumerate $D = \( y_beta \)_(beta < kappa)$. For $alpha < kappa$, let $M_alpha = \[ y_beta : beta < alpha \] subset E^(*)$. Its density is less than $kappa$. Some $y in D$ has distance greater than $delta \/ 4$ from $M_alpha$: if every point of the separated set had distance at most $delta \/ 4$, a dense subset of $M_alpha$ of cardinality less than $kappa$ would provide centers at distance less than $3 delta \/ 8$ from all those points. Two points cannot share such a center, a contradiction. Hahn–Banach gives $h_alpha in S_(E^(* *))$ annihilating $M_alpha$ and satisfying $\| h_alpha \( y \) \| > delta \/ 4$. Since $y = R_E x$ for some $x in B_X$, the functional $f_alpha = h_alpha R_E$ satisfies (4) with $epsilon = delta \/ 4$. For $y = y_beta$, its nonzero evaluations occur only at indices $alpha lt.eq beta$, a set of cardinality less than $kappa$ and therefore $mu$-null. ◻
]

=== 3.3 Borel coding and ordered sampling <borel-coding-and-ordered-sampling>

We next explain how to use (5) when the vector being evaluated is itself chosen using other indices. This is the only place where an interchange of integrals is needed. Borel evaluation also plays a central role in the perfect-unconditionality theorem of Argyros, Dodos and Kanellopoulos #cite(label("ArgyrosDodosKanellopoulos2008")) Theorem 4. Here it permits an ordered sampling argument using ordinary Fubini. The next lemma needs only a countably additive measure; the stronger additivity was used to produce the family to which it will be applied.

#thm([Lemma 3.4.])[
  #emph[Let $X$ be a real Banach space, let $E subset X^(*)$ be a separable closed subspace containing no isomorphic copy of $ell_1$, and put $D = R_E \( B_X \)$. Let $I$ carry a countably additive probability $mu$ on $cal(P) \( I \)$ that vanishes on singletons. Suppose that $\( h_alpha \)_(alpha in I) subset E^(* *)$ satisfies $mu { alpha in I : h_alpha \( y \) eq.not 0 } = 0$ for every $y in D$, and that $f_alpha = h_alpha R_E$ satisfies $0 < epsilon lt.eq parallel f_alpha parallel lt.eq M < oo$ for every $alpha in I$. Then $X^(*)$ contains an infinite unconditional basic sequence.]
] <pos:sampling>

#proof[
  By the Odell–Rosenthal Theorem #cite(label("OdellRosenthal1975")), each $h_alpha$ is the weak-star limit of a sequence from $E$. Choose one such sequence $c_alpha in E^(bb(N))$. Equip $E^(bb(N))$ with the product of the norm topologies and $K = B_(E^(*))$ with the weak-star topology; both are Polish spaces, and $K$ is compact. There is a Borel function
  $ Phi : E^(bb(N)) times K arrow.r bb(R) $
  whose value at $\( c \, y \)$ is $lim_n y \( c_n \)$ if this limit exists and is zero otherwise. Indeed each map $\( c \, y \) mapsto y \( c_n \)$ is continuous, and the Cauchy criterion makes its convergence set Borel. To check the joint continuity, use $\| y' \( e' \) - y \( e \) \| lt.eq parallel e' - e parallel + \| y' \( e \) - y \( e \) \|$ for $y \, y' in K$.
  The map $alpha mapsto c_alpha$ is measurable because its domain has the full power-set sigma algebra. Let $eta$ be its Borel pushforward probability on $E^(bb(N))$. The function
  #[#set math.equation(numbering: n => "(6)")
   $ H \( y \) = integral_(E^(bb(N))) upright(bold(1))_({ Phi \( c \, y \) eq.not 0 }) thin d eta \( c \) $ <pos:H>]
  is Borel on $K$, by parameter integration of a bounded Borel function. Our chosen codes give $Phi \( c_alpha \, y \) = h_alpha \( y \)$, so $H \( y \) = 0$ for every $y in D$.
  For $n gt.eq 1$ define a probability $lambda_n$ on all subsets of $I^n$ by ordered iteration, with the first variable outermost:
  $ lambda_n \( A \) = integral_I dots.h.c integral_I upright(bold(1))_A \( alpha_1 \, dots.h \, alpha_n \) thin d mu \( alpha_n \) dots.h.c d mu \( alpha_1 \) . $
  Put $lambda_0$ equal to the unit mass on the one empty tuple. Every section and every intermediate integrand is measurable. Induction and monotone convergence prove countable additivity of $lambda_n$; approximation by simple functions proves the same ordered integral formula for bounded functions. This construction does not assert that changing the order of these power-set integrals preserves their value.
  Fix $n$, rational coefficients $a_1 \, dots.h \, a_n$, and a subset $s subset { 1 \, dots.h \, n }$. For each tuple $\( alpha_j \)_(j in s)$ choose $x_s in B_X$ such that
  #[#set math.equation(numbering: n => "(7)")
   $ lr(|sum_(j in s) a_j f_(alpha_j) \( x_s \)|) gt.eq 1 / 2 ∥sum_(j in s) a_j f_(alpha_j)∥ . $ <pos:normer>]
  Choose $x_s = 0$ if that sum is zero. The choice depends only on the indices in $s$. For $i in.not s$ we claim
  #[#set math.equation(numbering: n => "(8)")
   $ f_(alpha_i) \( x_s \) = 0 quad upright("for ") lambda_n upright("-almost every tuple.") $ <pos:cross-vanishing>]
  Fix any earlier prefix $\( alpha_1 \, dots.h \, alpha_(i - 1) \)$. The map
  $ Y : I^(n - i) arrow.r K \, #h(2em) Y \( alpha_(i + 1) \, dots.h \, alpha_n \) = R_E x_s $
  is independent of $alpha_i$ and takes its values in $D$. It is measurable on the full power-set domain. Let $nu = Y_(*) lambda_(n - i)$, with the same interpretation when $i = n$. The ordered integral, starting at variable $i$, of the indicator of a nonzero evaluation in (8) is
  $ & integral_I integral_(I^(n - i)) upright(bold(1))_({ Phi \( c_(alpha_i) \, Y \( t \) \) eq.not 0 }) thin d lambda_(n - i) \( t \) thin d mu \( alpha_i \)\
 & #h(2em) = integral_(E^(bb(N))) integral_K upright(bold(1))_({ Phi \( c \, y \) eq.not 0 }) thin d nu \( y \) thin d eta \( c \) = integral_K H \( y \) thin d nu \( y \) = 0 . $
  The change of order in the last line is ordinary Fubini for a Borel function on the product of two Polish spaces with Borel probability measures. The final equality does not require $D$ to be Borel: the Borel set ${ H eq.not 0 }$ has empty inverse image under $Y$, so is $nu$-null. Since the earlier prefix was arbitrary, integrating over those variables proves (8).
  Combining (7) and (8) gives
  #[#set math.equation(numbering: n => "(9)")
   $ ∥sum_(j in s) a_j f_(alpha_j)∥ lt.eq 2 ∥sum_(j = 1)^n a_j f_(alpha_j)∥ $ <pos:suppression>]
  almost surely. Also the coordinates are pairwise distinct almost surely: for $r < t$, the event $alpha_t = alpha_r$ constrains variable $t$ to a singleton after its preceding variables have been fixed. There are countably many rational coefficient tuples and finitely many subsets $s$. Consequently, for each $n$ there is a set $G_n subset I^n$ of $lambda_n$-measure one on which distinctness and all these inequalities hold.
  We must choose one sequence whose prefixes all lie in these sets. Suppose a prefix $p = \( alpha_1 \, dots.h \, alpha_m \)$ has been chosen with all its nonempty prefixes in their respective $G_j$, and with
  #[#set math.equation(numbering: n => "(10)")
   $ lambda_(n - m) \( \( G_n \)_p \) = 1 #h(2em) upright("for every ") n > m . $ <pos:prefix-invariant>]
  Here $\( G_n \)_p$ denotes the section obtained by fixing the prefix $p$. The invariant holds for the empty prefix. For $n = m + 1$, it says that $\( p \, alpha \) in G_(m + 1)$ for almost every $alpha$. For every $n > m + 1$, the definition of the ordered measures gives
  $ 1 = lambda_(n - m) \( \( G_n \)_p \) = integral_I lambda_(n - m - 1) \( \( G_n \)_(\( p \, alpha \)) \) thin d mu \( alpha \) . $
  The integrand lies in $\[ 0 \, 1 \]$, so it equals $1$ for almost every $alpha$. The intersection of these countably many conull sets is nonempty. Choose the next index there. This constructs the required infinite sequence without an infinite product measure.
  Continuity extends (9) to real coefficients on every finite prefix. Singleton suppressions and $parallel f_(alpha_j) parallel gt.eq epsilon$ give linear independence. The initial-segment projections have norm at most $2$ on the algebraic span and extend to its closure. Approximation by finite sums shows that these projections converge to the identity, so the selected sequence is a Schauder basis for its closed span. Every finite coordinate suppression also has norm at most $2$. For a vector approximated within $delta$ by a finite sum, every finite coordinate sum outside that sum’s support has norm at most $2 delta$. It follows that the basis expansion converges unconditionally. ◻
]

=== 3.4 The positive conclusion <the-positive-conclusion>

#thm([Theorem 3.5.])[
  #emph[Suppose that $frak(c)$ carries a $frak(c)$-additive probability measure on its full power set that vanishes on singletons, with additivity understood for disjoint families of cardinality strictly less than $frak(c)$. Then every infinite-dimensional real Banach space has a separable infinite-dimensional quotient.]
] <pos:theorem>

#proof[
  Suppose that $X$ is a counterexample. A consequence of the Hagler–Johnson Theorem, in the precise form of #cite(label("ArgyrosDodosKanellopoulos2008")) Proposition 16, says that an unconditional basic sequence in $X^(*)$ gives a separable infinite-dimensional quotient of $X$. Thus $X^(*)$ contains no such sequence. Choose an infinite-dimensional separable closed subspace $E subset X^(*)$. It contains no isomorphic copy of $ell_1$, whose usual basis would give an unconditional basic sequence in $X^(*)$.
  Lemmas 7 and 8 give a seminormalized family $f_alpha = h_alpha R_E$ with the pointwise null-support property. Lemma 9 then produces an unconditional basic sequence in $X^(*)$, the desired contradiction. ◻
]

The real positive implication is now complete. The next section transfers it to complex Banach spaces; Section 10 supplies a model of its measure hypothesis from a measurable cardinal.

== 4 Passing between real and complex spaces <sec:fields>

Theorem 10 has established the positive implication for real Banach spaces. We now transfer it to complex spaces. We also prepare the transfer needed for the negative implication: after constructing a real counterexample, we will take its complexification. The two transfers require different arguments.

#thm([Proposition 4.1.])[
  #emph[Let $X$ be an infinite-dimensional complex Banach space, and let $X_(bb(R))$ be its underlying real space. If $X_(bb(R))$ has a separable infinite-dimensional real quotient, then $X$ has a separable infinite-dimensional complex quotient.]
] <ev:positive-transfer>

#proof[
  The map
  $ A : \( X_(bb(R)) \)^(*) arrow.r \( X^(*) \)_(bb(R)) \, #h(2em) \( A g \) \( x \) = g \( x \) - i g \( i x \) \, $
  is a real-linear isometry with inverse $f mapsto "Re" f$. Indeed $A g$ is complex-linear, and phase rotation in $B_X$ proves $parallel A g parallel = parallel g parallel$. Apply Proposition 4 to $X_(bb(R))$, and transport its witness under $A$ to a real closed infinite-dimensional subspace $E subset \( X^(*) \)_(bb(R))$. The complex-valued real-linear evaluations on $E$ have norm-separable image: under $A$, evaluation at $x$ is the difference of real evaluation at $x$ and $i$ times real evaluation at $i x$. Evaluation on $i E$ also has norm-separable image.
  Consider the real operator
  $ q : i E arrow.r \( X^(*) \)_(bb(R)) \/ E \, #h(2em) q \( w \) = w + E . $
  First suppose that $q$ is not strictly singular. There are a closed infinite-dimensional $W subset i E$ and $c > 0$ such that $"dist" \( w \, E \) gt.eq c parallel w parallel$ for $w in W$. Since $i W subset E$, the space $H = W + i W$ is a complex subspace whose displayed sum is direct over $bb(R)$, and
  $ parallel w parallel lt.eq c^(- 1) parallel w + i v parallel \, #h(2em) parallel v parallel lt.eq \( 1 + c^(- 1) \) parallel w + i v parallel quad \( w \, v in W \) . $
  These estimates make $H$ closed and its real coordinate projections bounded. The two coordinate projections combine the norm-separable evaluation images on $W$ and $i W$ into a separable set of real-linear maps $H arrow.r bb(C)$. The original evaluations are complex linear, with the same norm, so $R_H \( X \)$ is norm separable in $H^(*)$. Proposition 4, over $bb(C)$, gives the desired quotient.
  Now suppose that $q$ is strictly singular. Fix positive numbers $epsilon_n$ with $sum_n epsilon_n < oo$. Choose $f_n in E$ of norm one inductively, requiring that all later vectors vanish on finite actual $1 \/ 2$-norming sets $D_m subset B_X$ for the #emph[complex] spans of the earlier vectors. Each such vanishing condition consists of two real linear equations, so their common kernel in $E$, say $M$, is closed and infinite dimensional. Thus $i M$ is a closed infinite-dimensional subspace of $i E$. Strict singularity of $q \|_(i M)$ lets us choose $f_n$ with $"dist" \( i f_n \, E \) < epsilon_n \/ 2$. Choose $g_n in E$ with $parallel g_n - i f_n parallel < epsilon_n$. Lemma 3 shows that $\( f_n \)$ is complex basic, with coefficient bound $4$.
  Put $H = overline("span")_(bb(C)) { f_n : n gt.eq 1 }$. For finite sums, define a real-linear map by
  $ L (sum_n \( a_n + i b_n \) f_n) = sum_n \( a_n f_n + b_n g_n \) \, #h(2em) a_n \, b_n in bb(R) . $
  The operator $K = L - I$ extends to $H$, because
  $ K h = sum_n "Im" #scale(x: 120%, y: 120%)[\(] f_n^(\#) \( h \) #scale(x: 120%, y: 120%)[\)] \( g_n - i f_n \) \, #h(2em) parallel K - K_N parallel lt.eq 4 sum_(n > N) epsilon_n \, $
  where $K_N$ is the finite partial sum. In particular, $K$ is a norm limit of finite-rank real-linear operators. Since $E$ is closed and $L$ maps finite sums into $E$, we have $L \( H \) subset E$.
  For $x in X$, write $e_x \( h \) = h \( x \)$ on $H$ and also use $e_x$ for evaluation on $X^(*)$. Work temporarily in the normed space of bounded real-linear maps from $H$ to $bb(C)$. The family ${ e_x compose L : x in X }$ is norm separable, by the evaluation property of $E$ and boundedness of $L$. For $x in B_X$, the functionals $e_x compose K_N$ form a bounded subset of a finite-dimensional space, and
  $ sup_(x in B_X) parallel e_x compose K - e_x compose K_N parallel lt.eq parallel K - K_N parallel arrow.r 0 . $
  Thus ${ e_x compose K : x in B_X }$ is totally bounded. The identity $e_x = e_x compose L - e_x compose K$ proves norm separability of the evaluations on $B_X$, and their countably many dilates give the same conclusion on $X$. The complex-linear functionals on $H$ embed isometrically in the space of real-linear maps just used. Hence $R_H \( X \) subset H^(*)$ is norm separable, and Proposition 4 applies again. ◻
]

Apply Theorem 10 to the underlying real space of a complex Banach space, then apply Proposition 11. This proves the positive implication over $bb(C)$. To transfer a counterexample, we first show that a finite real direct sum cannot acquire a separable infinite-dimensional quotient when neither summand has one.

#thm([Lemma 4.2.])[
  #emph[If neither of two real Banach spaces $X_1 \, X_2$ has a separable infinite-dimensional quotient, then their direct sum has none.]
] <ev:finite-sum>

#proof[
  Use the norm $parallel \( x_1 \, x_2 \) parallel = max \( parallel x_1 parallel \, parallel x_2 parallel \)$ on $Y = X_1 xor X_2$, so $Y^(*) = X_1^(*) xor_1 X_2^(*)$. If $Y$ had such a quotient, Proposition 4 would provide a closed infinite-dimensional $F subset Y^(*)$ with norm-separable evaluation image. Let $p_j : F arrow.r X_j^(*)$ be its coordinate operators.
  If $p_1$ is not strictly singular, choose a closed infinite-dimensional $G subset F$ on which it is bounded below. Otherwise, Lemma 5 gives a closed infinite-dimensional $G subset F$ with $parallel p_1 \|_G parallel lt.eq 1 \/ 2$, and then
  $ parallel p_2 g parallel = parallel g parallel - parallel p_1 g parallel gt.eq 1 / 2 parallel g parallel #h(2em) \( g in G \) . $
  Thus some $p_j$ identifies $G$ with a closed infinite-dimensional $H subset X_j^(*)$. For $x in X_j$, evaluation on $H$ is obtained by evaluating the corresponding coordinate vector of $Y$ on $F$, restricting to $G$, and composing with $\( p_j \|_G \)^(- 1)$. Its image is norm separable. Proposition 4 gives the forbidden quotient of $X_j$. ◻
]

#thm([Corollary 4.3.])[
  #emph[The universal separable quotient assertions over $bb(R)$ and over $bb(C)$ are equivalent. More specifically, if a real Banach space $X$ has no separable infinite-dimensional quotient, its complexification has no separable infinite-dimensional complex quotient.]
] <ev:fields>

#proof[
  Proposition 11 proves the positive implication from real to complex spaces. For the other implication, suppose $X$ is a real counterexample. Give $X_(bb(C)) = X + i X$ the norm
  $ parallel x + i y parallel_(bb(C)) = sup_(theta in bb(R)) parallel cos theta thin x - sin theta thin y parallel . $
  Phase rotation proves absolute homogeneity over $bb(C)$, and the triangle inequality follows from that of $X$. Moreover,
  $ max \( parallel x parallel \, parallel y parallel \) lt.eq parallel x + i y parallel_(bb(C)) lt.eq parallel x parallel + parallel y parallel lt.eq 2 max \( parallel x parallel \, parallel y parallel \) . $
  Thus $X_(bb(C))$ is complete and its underlying real space is isomorphic to $X xor_oo X$. A separable infinite-dimensional complex quotient would give a separable infinite-dimensional real quotient of this sum, contrary to Lemma 12. ◻
]

== 5 A dual space with coded norming functionals <sec:norming>

We begin the real counterexample by constructing a dual space $E$ with coordinate predual $X_0$. Its infinite-dimensional subspaces will admit many separated functionals, and those functionals will be combined into an operator that changes the predual. The two tasks require different features of the norm: averages along coded paths give separation, while estimates for combinations of different paths make the operator bounded. We specify these goals below before choosing the averaging parameters.

Everything from this section through the construction of the counterexample is over the real field. Write $Gamma = omega_1$ and fix a partition

$ Gamma = union.big_(k = 0)^oo C_k $

into pairwise disjoint unbounded sets. For $alpha in Gamma$, let $"col" \( alpha \)$ denote its color. A finite nonempty set has both an ordinal range and a color range: these are the intervals between its least and greatest ordinal, and between its least and greatest color. Finite supports are #emph[successive] if their ordinal ranges are strictly successive. They are #emph[mixed-successive] if their ordinal ranges and their color ranges are both strictly successive.

An ordinal interval means any convex subset of $Gamma$, including the whole set. A color interval means a convex subset of ${ 0 \, 1 \, 2 \, dots.h }$. A #emph[rectangle] is the intersection of an ordinal interval with the set of coordinates whose colors lie in a color interval. These are the projection sets used below.

=== 5.1 Parameters and finite coordinate closures <parameters-and-finite-coordinate-closures>

There is one pure family for every $k gt.eq 0$, and one mixed family, denoted by $*$. For the pure family $k$, set

$ s_k = k + 2 \, #h(2em) r_k = s'_k \, #h(2em) s'_(k + 1) lt.eq q_k < s'_k \, $

where $a' = a \/ \( a - 1 \)$ is the conjugate exponent. For the mixed family set

$ s_(*) = 2 \, #h(2em) r_(*) = 2 \, #h(2em) s'_1 lt.eq q_(*) < 2 . $

Parameters belonging to different families are chosen independently. Whenever a family is fixed, we omit its subscript and write $s \, r \, q$. In particular,

$ 1 < q < r = s' \, #h(2em) q' > r \, #h(2em) 1 / q' < 1 / s . $

Our aim is a norm on $c_00 \( Gamma \)$ whose completion $E$ has the following properties. Write $e_alpha$ for its coordinate vectors and $e_alpha^(*)$ for the coordinate functionals, and set $X_0 = \[ e_alpha^(*) : alpha < omega_1 \] subset E^(*)$. We shall prove $E = X_0^(*)$ under the canonical evaluation map. For each family $t in { 0 \, 1 \, dots.h \, * }$ we shall also construct a set $cal(P)_t$ of infinite paths, each defining a functional $P in B_(E^(*))$. The properties to be established are:

+ On each color, every finitely supported scalar family satisfies the coordinate upper estimate
  $ parallel sum_(alpha in C_k) b_alpha e_alpha parallel lt.eq parallel \( b_alpha \) parallel_(ell_(s_k)) . $
+ If $Q : E^(*) arrow.r E^(*) \/ X_0$ is the quotient map, then finite combinations of distinct members of one path family satisfy
  $ parallel sum_(P in cal(P)_t) a_P Q P parallel lt.eq parallel \( a_P \) parallel_(ell_(q_t)) . $
+ Every infinite-dimensional closed $F subset E$ has, in a single family, an uncountable set of path restrictions $P \|_F$ separated by a positive distance in $F^(*)$.

The coordinate estimate is proved in this section, the estimate modulo $X_0$ follows from the path analysis in Section 6, and Section 8 proves the separation assertion using the prescribed-weight pairs of Section 7.

Here is why the exponents connect adjacent colors. Under CH we can label all paths in pure family $k$ by distinct coordinates of $C_(k + 1)$. The first estimate makes evaluation at those coordinates an $ell_(s'_(k + 1))$ family for every $y in E^(*)$. Since $s'_(k + 1) lt.eq q_k$, these coefficients can be inserted into the second estimate to form a bounded combination of path cosets. In the adjoint direction the conjugate inequality $q'_k lt.eq s_(k + 1)$ makes the corresponding coordinate series converge in $E$. The mixed family uses $C_1$ in the same way. Section 9 carries out this construction with small summable coefficients, then uses the separated restrictions to exclude separable quotients of the resulting predual.

The remaining parameters specify the norming operations that will give these properties. A weight-$j$ average of at most $L_j$ successive norming functionals will use coefficient $1 \/ m_j$. If each functional has coefficient $ell_r$ norm at most one, their disjoint supports give the bound $theta_j = L_j^(1 \/ r) \/ m_j$ for the average. The integers $d_j$ enter only the finite-depth estimate for prescribed-weight pairs; their inequalities are recorded here so that all parameter choices are made together.

#thm([Lemma 5.1.])[
  (Choice of parameters).  #emph[For each family there are strictly increasing sequences of positive integers $\( L_j \)$ and $\( m_j \)$, and positive integers $\( d_j \)$, such that, with 
$ theta_j = L_j^(1 \/ r) / m_j \, #h(2em) c_0 = sum_(j = 1)^oo theta_j \, #h(2em) B_j = 2 sum_(h < j) L_h \, $

 one has 
#[#set math.equation(numbering: n => "(11)")
 $ c_0 < 1 / 8 \, #h(2em) sum_(j gt.eq J) theta_j lt.eq 4 theta_J \, #h(2em) sum_(j = 1)^oo 1 / m_j < 1 / 8 \,\
frac(log \( L_j \/ m_j \), log L_j) arrow.r 1 / s \,\
\( 1 \/ 8 \)^(d_j) lt.eq theta_j \, #h(2em) \( 1 + B_j \)^(d_j) #scale(x: 120%, y: 120%)[\(] 1 + B_j + L_j^(1 \/ q') #scale(x: 120%, y: 120%)[\)] lt.eq L_j / m_j . $ <ch:parameter-smallness>]

 In particular, $L_j \/ m_j arrow.r oo$.]
] <ch:parameters>

#proof[
  Put $eta_j = \( 2^(- 10 - j) \)^r$ and choose $L_j = floor.l eta_j m_j^r floor.r$. By taking $m_j$ large, arrange
  $ eta_j \/ 2 lt.eq L_j \/ m_j^r lt.eq eta_j . $
  It follows that
  $ 2^(- 1 \/ r) 2^(- 10 - j) lt.eq theta_j lt.eq 2^(- 10 - j) . $
  These bounds imply the first two inequalities in (11), since $2^(1 + 1 \/ r) < 4$. Choose $d_j$ before choosing $m_j$, so that $\( 1 \/ 8 \)^(d_j) lt.eq 2^(- 1 \/ r) 2^(- 10 - j)$. At step $j$, the numbers $B_j$ and $d_j$ are already fixed. Because
  $ L_j / m_j = theta_j L_j^(1 \/ s) quad upright("and") quad 1 / q' < 1 / s \, $
  the second inequality in (11) holds for all sufficiently large choices of $m_j$. Increase $m_j$ further to make both integer sequences strictly increasing, to ensure $1 \/ m_j < 2^(- j - 4)$, and to make $\| log theta_j \| \/ log L_j < 1 \/ j$. The last condition gives (11); its positive limit also gives $L_j \/ m_j arrow.r oo$. ◻
]

We next supply finite coordinate sets on which a rational functional can be recorded by positions, without recording its ordinal labels. Encoding supports in this way follows the method of #cite(label("ArgyrosLopezAbadTodorcevic2005")) Sections 2.3–2.4; we prove the coherence properties needed here directly.

#thm([Lemma 5.2.])[
  (Coherent finite closures).  #emph[For every $beta < omega_1$ there are nested finite sets $F_p \( beta \) subset \[ 0 \, beta \]$, $p gt.eq 1$, containing $beta$, exhausting $\[ 0 \, beta \]$, and satisfying 
#[#set math.equation(numbering: n => "(12)")
 $ alpha in F_p \( beta \) quad arrow.r.double quad F_p \( alpha \) = F_p \( beta \) ∩ \[ 0 \, alpha \] . $ <ch:coherence>]

 Consequently, two such closures with the same index $p$ that contain a common coordinate $alpha$ have the same ordered initial segment through $alpha$.]
] <ch:closures>

#proof[
  Construct the sets by induction on $beta$. At zero use ${ 0 }$, and at a successor append $beta$ to every closure of its predecessor. Suppose $beta$ is a nonzero limit. Enumerate its predecessors as $\( a_i \)$, and choose an increasing cofinal sequence $\( alpha_i \)_(i gt.eq 0)$ below $beta$ such that $alpha_i gt.eq a_h$ for $h lt.eq i$. Let $p_0 = 1$. Recursively choose strictly increasing $p_i > 1$, $i gt.eq 1$, so large that $F_(p_i) \( alpha_i \)$ contains $alpha_(i - 1)$ and $a_0 \, dots.h \, a_i$. For $p_i lt.eq p < p_(i + 1)$ set
  $ F_p \( beta \) = F_p \( alpha_i \) union { beta } . $
  At a switch, coherence at $alpha_i$ gives
  $ F_(p_i) \( alpha_(i - 1) \) = F_(p_i) \( alpha_i \) ∩ \[ 0 \, alpha_(i - 1) \] \, $
  so the sets remain nested. The enumerated predecessors are eventually included, and coherence follows directly from coherence at $alpha_i$. The last assertion follows by applying (12) to the common coordinate. ◻
]

For $alpha lt.eq beta$ put

$ rho \( alpha \, beta \) = min { p : alpha in F_p \( beta \) } . $

For a finite nonempty set $A$, write $max rho \( A \) = max { rho \( alpha \, beta \) : alpha \, beta in A \, alpha lt.eq beta }$. If $p gt.eq max rho \( A \)$, then $A subset F_p \( max A \)$.

We will repeatedly use the following precise form of position alignment. Suppose $F_p \( beta \)$ and $F_p \( gamma \)$ contain $alpha$, and two arrays on these closures have identical entries at corresponding order positions. If the first array is supported strictly before $alpha$, then the arrays define exactly the same finitely supported function on $Gamma$. Indeed, the positions through $alpha$ coincide by Lemma 15, and every later entry of the first array, hence also of the second array, is zero. Equality of position codes alone does not assert equality of ordinal supports; the common coordinate is the additional input in this observation.

=== 5.2 Operations, paths and the norm <operations-paths-and-the-norm>

All norming functionals below are finitely supported rational arrays on $Gamma$. A Type I expression of weight $j$ in a fixed family has the form

#[#set math.equation(numbering: n => "(13)")
 $ phi.alt = 1 / m_j sum_(h = 1)^d g_h \, #h(2em) 1 lt.eq d lt.eq L_j \, $ <ch:type-i>]

with nonzero children $g_h$ having successive supports in the pure case and mixed-successive supports in the mixed case. The membership conditions on the children are specified shortly.

Following the special-sequence method of #cite(label("GowersMaurey1993")), the next weight will record the preceding rational functionals. A finite #emph[path] in one family is a list of nonzero Type I pieces $phi.alt_1 \, dots.h \, phi.alt_l$, successive in that family’s order, with declared weights $j_1 \, dots.h \, j_l$ and integer metadata $p_1 < dots.h.c < p_l$ satisfying

$ p_i gt.eq j_i \, #h(2em) p_i gt.eq max rho (union.big_(h lt.eq i) "supp" phi.alt_h) . $

The code of the prefix through $i$ records all $j_h \, p_h$, $h lt.eq i$, and the zero-filled arrays of all $phi.alt_h$, $h lt.eq i$, at the order positions of $F_(p_i) \( beta_i \)$, where $beta_i = max union.big_(h lt.eq i) "supp" phi.alt_h$. There are countably many such codes. In each family fix an injection $sigma$ from the set of possible codes to the positive integers such that its value is greater than the final metadata entry. Such an injection is obtained by enumerating the codes and successively choosing unused sufficiently large integers. The path rule is

#[#set math.equation(numbering: n => "(14)")
 $ j_(i + 1) = sigma \( upright("code of the prefix through ") i \) . $ <ch:path-rule>]

The first weight is arbitrary. All weights along a path are strictly increasing. A path includes its pieces, declared weights and metadata; it is not merely the sum of its pieces.

For a pure path, a crop means restriction of its sum to an ordinal interval. For a mixed path it means restriction to a rectangle. A weight is #emph[active] in a cropped path if its piece remains nonzero after the crop. Path rules always refer to the original uncropped pieces. The distinction between an uncropped sequence and its surviving indices also appears in #cite(label("ArgyrosArvanitakisTolias2006")) Section 3; here the surviving indices are the active weights.

For each $k$, start $K_k$ with $0$ and the coordinate functionals $plus.minus e_alpha^(*)$, $alpha in C_k$. Enlarge it in finite stages by the following pure operations:

+ Type I expressions (13) whose children belong to earlier stages of $K_k$;
+ Type II expressions
  #[#set math.equation(numbering: n => "(15)")
   $ sum_(b = 1)^h a_b thin P_(I_b) (sum_(i = 1)^(l_b) phi.alt_(b \, i)) \, #h(2em) a_b in bb(Q) \, quad sum_(b = 1)^h \| a_b \|^q lt.eq 1 \, $ <ch:type-ii>]
  where each list $\( phi.alt_(b \, i) \)_(i = 1)^(l_b)$ is a finite path, the Type I children of all its pieces belong to earlier stages, and the cropped paths have pairwise disjoint active weight sets.

Here $P_A$ denotes restriction to coordinates in $A$, on both arrays and vectors as appropriate. Empty cropped terms are discarded. A functional may have several expressions or declared weights; all arguments use a specified valid expression.

Now start $K$ with all members of all the $K_k$ as terminal functionals, and apply the same finite-stage rules with the mixed parameters, mixed succession and rectangle crops. Children in these mixed rules belong to earlier stages of $K$.

#thm([Lemma 5.3.])[
  (Norm and projections).  #emph[The formula 
$ parallel x parallel = sup_(f in K) \| f \( x \) \| #h(2em) \( x in c_00 \( Gamma \) \) $

 defines a norm. In its completion $E$, the coordinate vectors have norm one, and projections onto ordinal intervals and rectangles are contractive. Every vector has countable support and is a norm limit of finitely supported vectors. The corresponding pure norm on $C_k$ is given by $K_k$ and agrees with the full norm.]
] <ch:norm>

#proof[
  First note that each $K_k$ is symmetric and stable under ordinal crops, and $K$ is symmetric and stable under rectangle crops. For Type I, distribute the crop to the children and discard zeros; the remaining children still have the required succession. For Type II, intersect the existing crops with the new crop. This changes neither the paths nor their codes and only removes active weights. These observations prove stability by induction on the construction stage. A rectangle crop of a pure terminal either gives zero or leaves an ordinal crop within the same color.
  Every coefficient of every member of $K_k$ or $K$ has absolute value at most one. At a Type I node, disjointness of children gives the stronger bound $1 \/ m_j$. At a Type II node, a given coordinate meets at most one piece of each path. Contributions from different paths have distinct active weights, so their absolute sum is at most $sum_j 1 \/ m_j < 1$. Induction first establishes these bounds in the pure families and then in the mixed family. Consequently
  $ parallel x parallel_oo lt.eq parallel x parallel lt.eq parallel x parallel_1 #h(2em) \( x in c_00 \( Gamma \) \) . $
  Crop stability proves contractivity of the asserted projections. Each coordinate functional therefore extends continuously to $E$. A countable sequence of finite approximations shows that every vector vanishes outside a countable set. Moreover, $K$ remains norming on the completion, by finite approximation. Since its members use only finitely many coordinates, those coordinates determine every vector.
  It remains to compare the pure and full norms. We claim that
  #[#set math.equation(numbering: n => "(16)")
   $ { f \| C_k : f in K } subset "absconv" \( K_k \) \, $ <ch:color-restriction>]
  where zero is allowed in the absolutely convex hull. It holds for terminals. At a mixed Type I node at most one child meets $C_k$. At a mixed Type II node at most one piece of each path meets $C_k$, and at most one child of that piece does so. By induction the restriction is an absolutely convex combination of pure functionals whose total coefficient mass is at most $sum_j 1 \/ m_j < 1$. This proves (16). The opposite norm inequality follows from $K_k subset K$. ◻
]

#thm([Lemma 5.4.])[
  (Coordinate upper estimates).  #emph[ For each $k$ and every finitely supported scalar family $\( b_alpha \)_(alpha in C_k)$, 
#[#set math.equation(numbering: n => "(17)")
 $ ∥sum_(alpha in C_k) b_alpha e_alpha∥ lt.eq parallel \( b_alpha \) parallel_(ell_(s_k)) . $ <ch:ell-s>]

 Thus the same coordinate series converges in $E$ whenever $\( b_alpha \) in ell_(s_k) \( C_k \)$.]
] <ch:color-bound>

#proof[
  Fix a pure family and show by induction that each member of $K_k$ has coefficient $ell_r$ norm at most one. This holds at coordinates. A Type I piece of weight $j$ has coefficient norm at most $L_j^(1 \/ r) \/ m_j = theta_j$, by the disjoint supports of its children. A cropped path with active weight set $A_b$ therefore has coefficient norm at most
  $ t_b = (sum_(j in A_b) theta_j^r)^(1 \/ r) . $
  For a Type II expression, the triangle inequality and Hölder’s inequality give
  $ ∥sum_b a_b P_(I_b) sum_i phi.alt_(b \, i)∥_(ell_r) lt.eq parallel \( a_b \) parallel_(ell_q) parallel \( t_b \) parallel_(ell_(q')) lt.eq parallel \( t_b \) parallel_(ell_r) lt.eq (sum_j theta_j^r)^(1 \/ r) < 1 . $
  We used $q' > r$ and disjointness of the active weight sets. Now apply Hölder’s inequality to vectors on $C_k$ and use Lemma 16. Applying (17) to finite tails proves convergence of every asserted infinite series. ◻
]

=== 5.3 The coordinate predual <the-coordinate-predual>

The construction so far provides a Banach space $E$. Its coordinate functionals span a predual; proving this now will avoid any appeal to bounded completeness later.

#thm([Proposition 5.5.])[
  #emph[Let 
$ X_0 = overline("span") { e_alpha^(*) : alpha < omega_1 } subset E^(*) . $

 The canonical evaluation map $E arrow.r X_0^(*)$ is an isometric isomorphism.]
] <ch:predual>

#proof[
  Each $f in K$ is a finite linear combination of coordinate functionals and has norm at most one on $E$. Thus $K subset B_(X_0)$ and the evaluation map is isometric.
  For surjectivity fix $g in X_0^(*)$ and put $a_alpha = g \( e_alpha^(*) \)$. We construct, by transfinite induction on $gamma lt.eq omega_1$, a vector $x_gamma in E$ whose coordinates are $a_alpha$ for $alpha < gamma$ and zero otherwise. Each constructed prefix satisfies
  #[#set math.equation(numbering: n => "(18)")
   $ parallel x_gamma parallel lt.eq parallel g parallel . $ <ch:prefix-bound>]
  Indeed, for finite $f in K$,
  $ f \( x_gamma \) = g \( P_(< gamma) f \) \, #h(2em) parallel P_(< gamma) f parallel_(X_0) lt.eq 1 \, $
  using crop stability. This proves the bound whenever the prefix has been constructed.
  Start with $x_0 = 0$, and at a successor append $a_gamma e_gamma$. Suppose $lambda$ is a limit ordinal and all earlier prefixes exist. If $\( x_gamma \)_(gamma < lambda)$ were not norm Cauchy, there would be $delta > 0$ and successive intervals $\[ alpha_i \, beta_i \)$ below $lambda$ for which
  $ v_i = x_(beta_i) - x_(alpha_i) \, #h(2em) parallel v_i parallel gt.eq delta . $
  The intervals can be chosen recursively from the failure of the Cauchy condition. Consider first the case that for some color $k$ and some $delta' > 0$, infinitely many $v_i$ satisfy $parallel P_(C_k) v_i parallel gt.eq delta'$. For any $j$, select $L_j$ of them. By the pure/full norm equality and symmetry, choose pure normers supported in their respective intervals, with evaluation at least $delta' \/ 2$. Their weight-$j$ Type I average belongs to $K_k$. Evaluating on a prefix that covers all the selected intervals gives
  $ parallel g parallel gt.eq frac(delta' L_j, 2 m_j) \, $
  contradicting $L_j \/ m_j arrow.r oo$.
  In the remaining case, $parallel P_(C_k) v_i parallel arrow.r 0$ for every fixed $k$. Pass to a subsequence and choose successive finite color intervals $D_i$ so that
  $ parallel P_("col"^(- 1) \( D_i \)) v_i parallel gt.eq delta \/ 2 . $
  Here is the recursive choice. After the preceding upper color cutoff has been fixed, its finitely many color projections tend to zero, so choose the next $v_i$ with their sum of norms less than $delta \/ 4$. For this individual vector the projection onto sufficiently high colors has norm less than $delta \/ 4$, by finite approximation and contractivity. The intervening color interval has the desired norm. Take rectangle-cropped normers of evaluations at least $delta \/ 4$. Their supports are mixed-successive. Selecting $L_j$ of them and using a mixed Type I average again contradicts (18), now with lower bound $delta L_j \/ \( 4 m_j \)$.
  Thus the prefixes are Cauchy at every limit, including $omega_1$. Completeness supplies their limit, with the required coordinates and earlier projections, and (18) is preserved. The terminal vector $x_(omega_1)$ agrees with $g$ on every coordinate functional, hence on $X_0$ by density. This proves surjectivity. ◻
]

== 6 Infinite paths and weak-Cauchy block sequences <sec:paths>

An infinite path is an infinite list of pieces, declared weights and metadata whose every finite prefix satisfies the rules of Section 5. We first show that different paths have almost disjoint weight sets. We then use the Type II operation to obtain convergence on all paths simultaneously, and show that this already controls every functional on a block subspace.

#thm([Lemma 6.1.])[
  (Bounded path functionals).  #emph[For every actual infinite path $\( phi.alt_l \, j_l \, p_l \)_(l gt.eq 1)$, the formula 
$ P \( x \) = sum_(l = 1)^oo phi.alt_l \( x \) $

 defines a member of $B_(E^(*))$. The sum converges for every $x in E$. The same is true after an allowed crop of the path.]
] <path:bounded>

#proof[
  Every finite partial sum is a Type II functional, with one path and coefficient one. These sums have norm at most one. Their evaluations eventually stabilize on every finitely supported vector, since the pieces have successive disjoint supports. Uniform boundedness of the partial sums and finite approximation therefore give convergence on every vector in $E$, with limit norm at most one. Cropping follows either by the same argument or by composing with a contractive projection. ◻
]

#thm([Lemma 6.2.])[
  (Rigidity of shared weights).  #emph[Distinct infinite paths in the same family have only finitely many weights in common. Consequently, for any finitely many distinct paths $P_1 \, dots.h \, P_h$ in that family, one may delete finitely many initial pieces of each to obtain tails $tilde(P)_1 \, dots.h \, tilde(P)_h$ satisfying 
#[#set math.equation(numbering: n => "(19)")
 $ ∥sum_(b = 1)^h a_b tilde(P)_b∥_(E^(*)) lt.eq parallel \( a_b \)_(b = 1)^h parallel_(ell_q) #h(2em) \( a_b in bb(R) \) . $ <path:tail-estimate>]

 Each difference $P_b - tilde(P)_b$ belongs to $X_0$.]
] <path:rigidity>

#proof[
  Suppose two infinite paths have infinitely many common weights. Except possibly for their first weights, equality of weights implies equality of the preceding codes, by injectivity of $sigma$. In particular, the preceding prefixes have the same length, the same metadata and weights, and the same arrays in their respective ordered closures. The lengths of these matching prefixes tend to infinity.
  Interchange the two paths if necessary so that the supremum of the support of the first does not exceed that of the second. Fix a coordinate $alpha$ in the first path. There is a coordinate $xi gt.eq alpha$ in the second path: an infinite successive path has no greatest support coordinate. For sufficiently long matching prefixes, both $alpha$ and $xi$ have appeared, and their common final metadata $p$ is at least $rho \( alpha \, xi \)$. The closure for the second prefix contains $xi$, hence $F_p \( xi \)$, hence $alpha$; the closure for the first prefix also contains $alpha$. Their ordered initial segments through $alpha$ coincide by Lemma 15.
  Every piece preceding the first path’s piece that contains $alpha$ is supported strictly before $alpha$. Position alignment therefore makes this entire piece exactly equal to the corresponding piece in the second path, not merely equal on an initial interval. Its weight and metadata agree as well. Taking $alpha$ in arbitrarily late pieces identifies all the path data. Thus the paths were identical.
  For finitely many distinct paths, discard initial pieces beyond all pairwise common weights. Their remaining weight sets are disjoint. Each finite sum of tail pieces is the crop of a finite prefix of the original path; this retains the required uncropped coding. Type II therefore gives (19) first for rational coefficients and finite tails. Pass to the path limits on each vector, use the norm bound, and approximate real coefficients. The discarded pieces have finite support and hence belong to $X_0$. ◻
]

Fix a pure family $k$ or the mixed family. By a block sequence in the family we mean a sequence of nonzero finitely supported vectors that are successive and supported on $C_k$ in the pure case, or mixed-successive in the mixed case. A sequence $\( x_i \)$ is weak-Cauchy if $\( f \( x_i \) \)$ converges for every continuous linear functional $f$.

#thm([Proposition 6.3.])[
  (Weak-Cauchy blocks).  #emph[ Every bounded block sequence in a fixed family has a weak-Cauchy subsequence.]
] <path:weak-cauchy>

#proof[
  Write $M = sup_i parallel x_i parallel$. The proof has two steps. First we pass to a subsequence on which every actual infinite path in the family converges. Then we show that every pointwise limit of norming functionals converges on the same sequence.
  #emph[Step 1: convergence on all actual paths.] Fix $delta > 0$. If an as yet untreated path satisfies $limsup_i \| P \( x_i \) \| > delta$, pass to an infinite subsequence on which $\| P \( x_i \) \| > delta$ and $P \( x_i \)$ converges. Continue this procedure, retaining all previously obtained convergence.
  Only finitely many new paths can be selected at this threshold. Indeed, if $h$ distinct paths have been selected, remove their finite prefixes as in Lemma 20. Those prefixes vanish on all sufficiently late blocks. By (19) and finite dimensional $ell_q$ duality, at each such block
  $ (sum_(b = 1)^h \| P_b \( x_i \) \|^(q'))^(1 \/ q') lt.eq parallel x_i parallel lt.eq M . $
  Since every selected absolute value exceeds $delta$ on the retained subsequence, $h lt.eq \( M \/ delta \)^(q')$. The selection must therefore stop. At that point every unselected path has limsup of its absolute evaluations at most $delta$.
  Apply this finite procedure successively to thresholds decreasing to zero and nested subsequences. Take a diagonal subsequence with the usual tail containment in each preceding subsequence. Every selected path converges on it. An unselected path has absolute limsup at most every threshold and hence tends to zero. Relabel this subsequence as $\( x_i \)$.
  #emph[Step 2: convergence on pointwise limits of norming functionals.] Each individual norming functional is finitely supported and already vanishes on all sufficiently late blocks. This does not control every functional on the block span. We must instead control the compact pointwise closure of the norming set; at the end of the proof a measure representation will pass from this closure to the whole dual.
  Let $S = union.big_i "supp" x_i$, a countable set. Use $K_k$ in the pure case and $K$ in the mixed case, and let $cal(C)$ be the pointwise closure of its restrictions in $\[ - 1 \, 1 \]^S$. This is a compact metrizable space. Each $u in cal(C)$ acts with norm at most one on the closed block span, because this holds on finite vectors by pointwise approximation. Define its oscillation on the blocks by
  $ "osc" \( u \) = limsup_i u \( x_i \) - liminf_i u \( x_i \) \, #h(2em) D = sup_(u in cal(C)) "osc" \( u \) lt.eq 2 M . $
  We will prove that $D = 0$.
  Fix $u in cal(C)$ and choose norming functionals converging pointwise on $S$ to $u$. Subsequences may be taken without changing this limit. Choose one valid expression for each functional. After subselection the top expressions are all terminals, all Type I, or all Type II. The following analysis does not require their construction depths to be bounded: all child limits will lie in the same compact set $cal(C)$.
  #emph[Terminals and Type I limits.] In a pure family, a sequence of coordinate terminals has either a fixed coordinate on a subsequence or the zero pointwise limit; its oscillation is zero. In the mixed family, terminal functionals belong to individual pure colors. If those colors drift, the pointwise limit is zero; if the color is fixed, it meets at most one of the mixed-successive blocks, again giving zero oscillation.
  For Type I expressions whose weights tend to infinity, the coordinate bound $1 \/ m_j$ gives pointwise limit zero. Otherwise fix the weight $j$, the number of children, and the pointwise limits of all children. Thus
  $ u = 1 / m_j sum_(h = 1)^d v_h \, #h(2em) d lt.eq L_j \, quad v_h in cal(C) . $
  Nonzero coordinates of different child limits remain in their original order. At most one child limit can meet infinitely many blocks. For if an earlier child met infinitely many, its hits would eventually occur beyond any fixed hit of a later child, contradicting the order. Every other child is zero on all sufficiently late blocks. Consequently
  #[#set math.equation(numbering: n => "(20)")
   $ "osc" \( u \) lt.eq D \/ m_j . $ <path:type-i-oscillation>]
  This conclusion also applies to a pointwise limit of cropped Type I pieces: distribute the crops to the children and discard zeros before taking the limits.
  #emph[Individual terms in a Type II limit.] The key issue is the limit of one cropped path. We shall show that, on all sufficiently late blocks, such a limit agrees either with zero, with a limit of a single Type I piece, or with an actual infinite path. The first and third alternatives have zero oscillation; the second has the small factor $1 \/ m_j$ from (20). After classifying the individual terms, we will use their disjoint active weights to sum these factors.
  Index each cropped path term by its smallest active weight $b$. These indices are distinct within each expression. A diagonal subsequence makes presence or absence eventually constant for each index, makes its coefficient converge to a number $a_b$, and makes its crop membership converge at every coordinate of $S$. Put $a_b = 0$ for absent terms. Fatou’s inequality on finite sets gives
  #[#set math.equation(numbering: n => "(21)")
   $ sum_b \| a_b \|^q lt.eq 1 . $ <path:limit-coefficients>]
  For each present term, also take pointwise limits of its path crop. Call the resulting functional on the block span $u_b$. All subsequent choices impose only countably many conditions, indexed by a term, a finite chain position and a coordinate of $S$. Nested subsequences and a diagonal retain every finite collection of these conditions simultaneously for all sufficiently late approximants.
  The original uncropped weight list through $b$ has only finitely many possibilities, since weights strictly increase. Fix this initial list by subselection. Examine its successive extensions one position at a time. At each position the path either ends, the next weight tends to infinity, or the next weight can be fixed on a subsequence. Diagonalizing produces a finite fixed chain, possibly followed by a divergent-weight suffix, or an infinite fixed chain. Take pointwise limits of all cropped pieces in this chain as well.
  A suffix whose weights tend to infinity contributes zero in the pointwise limit. Each coordinate meets at most one piece of the suffix, and its coefficient is bounded by the reciprocal of its least weight’s $m$-parameter. Whenever a fixed piece has a fixed successor weight, that successor fixes its entire preceding code. In particular, the support size of the piece is uniformly bounded by the length of the finite array in that code. Its pointwise limit therefore has finite support.
  For a finite fixed chain, only its last piece can have a limit with infinite support. If its weight is $j$, (20) gives
  #[#set math.equation(numbering: n => "(22)")
   $ "osc" \( u_b \) lt.eq D \/ m_j . $ <path:finite-chain-oscillation>]
  If the last cropped piece has zero pointwise limit, then $u_b$ is finitely supported and its oscillation is zero. Otherwise the last weight is active in all sufficiently late approximating terms. The last weights for these potentially oscillating terms are therefore distinct: two of them cannot be active in different terms of the same Type II approximant.
  #emph[Infinite fixed chains and their limiting crops.] It remains to transfer convergence from actual paths to infinite fixed chains, then sum the Type II terms in dual norm. In this case every individual piece has a finitely supported pointwise limit. The pointwise limit of the path crop is the sum of these piece limits. To see that no additional contribution escapes to high piece positions, note that the coordinate error after the first $l$ pieces is at most $1 \/ m_(j_(l + 1))$, uniformly in sufficiently late approximants. If only finitely many cropped piece limits are nonzero, $u_b$ is finitely supported and has zero oscillation.
  Suppose instead that arbitrarily late pieces have nonzero cropped limits. Choose a coordinate $beta in S$ with nonzero limit in one such piece. Eventually $beta$ belongs to the actual support of that piece and is retained by its crop. The fixed next weight fixes the prefix code through this piece, including its metadata $p$. All corresponding approximating closures contain $beta$, and their initial segments through $beta$ are therefore exactly $F_p \( beta \)$. Every earlier uncropped piece is supported strictly before $beta$. The position-alignment observation following Lemma 15 shows that these earlier pieces are eventually the same actual functions on $Gamma$.
  Choosing $beta$ in arbitrarily late effective pieces proves eventual stabilization of every uncropped prefix, with its weights and metadata. These stabilized prefixes define an actual infinite path $P$. Its pieces are valid Type I expressions because each stabilized piece equals a piece from an approximating path; every finite prefix satisfies the required coding rule for the same reason.
  The limiting crop changes $P$ on only finitely many coordinates of $S$. To prove this, fix one retained coordinate $beta$ in a piece. For a coordinate $alpha in S$ belonging to any strictly later piece, choose a retained coordinate $gamma$ in a still later effective piece. In late approximants the stabilized coordinates $beta \, alpha \, gamma$ have their fixed ordinal order, and, in the mixed case, their fixed color order. Both $beta$ and $gamma$ lie in the crop. Interval convexity, in both orders when required, forces $alpha$ to lie in it too. Thus the limiting crop retains every path coordinate of $S$ after the piece containing $beta$. Only the finitely many finite pieces up to and including the piece containing $beta$ can differ. It follows that $u_b \( x_i \) - P \( x_i \)$ is eventually zero. Step 1 proves convergence of $P \( x_i \)$, so every infinite-chain term has zero oscillation.
  #emph[Reassembling the Type II limit.] We have
  #[#set math.equation(numbering: n => "(23)")
   $ u = sum_b a_b u_b quad upright("pointwise on ") S . $ <path:limit-series>]
  Indeed, terms with smallest active weight $b > N$ have coordinate error at most
  $ sum_(j > N) 1 / m_j \, $
  uniformly in all approximants. At a given coordinate there is at most one contributing piece per path, and the contributing active weights are globally distinct. This proves (23) after passing to the finitely many indices $b lt.eq N$ and then letting $N arrow.r oo$.
  The series also converges in dual norm on the block span. For every finite set of present indices and every real coefficient vector $\( c_b \)$ with $ell_q$ norm at most one, replace the coefficients of the corresponding approximating Type II terms by rational approximations to $\( c_b \)$ inside the closed $ell_q$ unit ball. They remain admissible, since the paths and their pairwise disjoint active weights have not changed. Passing to the pointwise limits on finite vectors yields
  $ ∥sum_b c_b u_b∥_(\[ x_i \]^(*)) lt.eq 1 . $
  By (21), finite truncations of $sum_b a_b u_b$ are therefore Cauchy in dual norm. Their norm limit agrees with (23) on the block vectors.
  Oscillation is subadditive and changes by at most $2 M parallel v - w parallel$ when one bounded functional is replaced by another. Using finite truncations, the distinct potentially oscillating last weights in (22), and $\| a_b \| lt.eq 1$, we obtain
  #[#set math.equation(numbering: n => "(24)")
   $ "osc" \( u \) lt.eq D sum_(j = 1)^oo 1 / m_j . $ <path:type-ii-oscillation>]
  All other terms have zero oscillation.
  The terminal, Type I and Type II cases are exhaustive. Equations (20) and (24), together with Lemma 14, imply
  $ D lt.eq (sum_j 1 \/ m_j) D < 1 / 8 D quad upright("if ") D > 0 . $
  Hence $D = 0$: every $u in cal(C)$ gives a convergent sequence $u \( x_i \)$.
  Finally, evaluation embeds the block span isometrically into $C \( cal(C) \)$; for a finite vector, its evaluation is continuous, and finite approximation extends this assertion to the closed span. Given any functional on the block span, extend it by Hahn–Banach to $C \( cal(C) \)$. The Riesz–Markov representation theorem #cite(label("Rudin1987")) Theorem 6.19 represents the extension by a finite signed Borel measure $nu$, with $\| nu \| \( cal(C) \) < oo$. The functions $u mapsto u \( x_i \)$ are uniformly bounded by $M$ and converge at every $u in cal(C)$. Bounded convergence with respect to $\| nu \|$ proves convergence under the given functional. The selected subsequence is therefore weak-Cauchy. ◻
]

== 7 Vectors detected at a prescribed weight <pair:section>

The next step makes the path coding usable inside arbitrary subspaces. We must be able to prescribe the next weight of a path and still find a bounded vector on which its next piece has a substantial value. All constants in this section are uniform in the family and in the prescribed weight.

Fix one family. In a pure family, an admissible block sequence consists of nonzero finite vectors on its color with successive ordinal supports. In the mixed family, its supports are successive in both ordinal and color order. A finite block of such a sequence is a nonzero finite linear combination of its members; successive blocks use successive finite sets of indices. We use the parameters $s \, r = s' \, q \, L_j \, m_j \, theta_j \, c_0 \, B_j \, d_j$ of this family from Lemma 14. In particular $1 < q < r$, and $theta_j = L_j^(1 \/ r) \/ m_j$.

#thm([Proposition 7.1.])[
  #emph[Let $\( z_n \)$ be an infinite admissible block sequence in $E$. Given a tail of this sequence and an integer $J gt.eq 1$, there are a finite block $y$ in that tail and a Type I functional $phi.alt$ of weight $J$ in the same family such that 
$ parallel y parallel lt.eq 500 \, #h(2em) phi.alt \( y \) gt.eq 1 / 2 . $

 The support of $phi.alt$ lies in the ordinal range of $y$, and also in its color range in the mixed case.]
] <pair:exact>

Prescribed-weight vector–functional pairs are a standard tool in these constructions; compare #cite(label("ArgyrosLopezAbadTodorcevic2005")) Section 3 and #cite(label("ArgyrosArvanitakisTolias2006")) Section 1. We prove the estimate needed here directly.

The proof has three steps. First we find blocks whose norm is spread over intervals. Differences of a weak-Cauchy subsequence then permit a Ramsey argument that limits how often one path can interact with prescribed weight windows. Finally we estimate every norming expression by following only its pieces below the prescribed weight.

=== 7.1 Blocks and weight windows <blocks-and-weight-windows>

#thm([Lemma 7.2.])[
  #emph[For every integer $N gt.eq 1$, every infinite admissible block sequence has a finite unit block $u$ such that, for all $1 lt.eq d lt.eq N$ and all successive disjoint ordinal intervals $I_1 \, dots.h \, I_d$, 
$ sum_(b = 1)^d parallel P_(I_b) u parallel lt.eq 8 d^(1 \/ r) . $

 The block can be chosen in any prescribed tail.]
] <pair:partition>

#proof[
  Work in that tail. Let $a \( k \)$ be the supremum of the norms of sums of $k$ successive finite unit blocks. Contractivity of interval projections gives $a \( k \) lt.eq k$. Norm each of $L_h$ successive unit blocks to within a factor $2$, crop the normers to their block ranges, and combine them by a Type I operation of weight $h$. In the mixed case use the ordinal and color ranges. Thus
  $ a \( L_h \) gt.eq frac(L_h, 2 m_h) . $
  Choose $t > s$ sufficiently close to $s$ that $d^(1 \/ t') lt.eq 2 d^(1 \/ r)$ for $1 lt.eq d lt.eq N$. The parameter limit in Lemma 14 implies that $a \( k \) \/ k^(1 \/ t)$ is unbounded. Consequently there is a record index $k$ such that
  $ a \( ell \) lt.eq a \( k \) \( ell \/ k \)^(1 \/ t) quad \( 1 lt.eq ell lt.eq k \) \, #h(2em) a \( k \) gt.eq N^(1 \/ s) . $
  Choose successive unit blocks $v_1 \, dots.h \, v_k$ with $parallel sum v_i parallel gt.eq a \( k \) \/ 2$, and normalize their sum to obtain $u$.
  For each $I_b$, let $ell_b$ count the blocks whose ordinal ranges are contained in $I_b$. There are at most two further blocks whose ranges partly meet $I_b$. Their projected norms are at most $1$ each. Since $sum_b ell_b lt.eq k$, the record inequality and Hölder’s inequality give
  $ sum_(b = 1)^d parallel P_(I_b) u parallel & lt.eq 2 sum_(b : ell_b > 0) \( ell_b \/ k \)^(1 \/ t) + frac(4 d, a \( k \))\
 & lt.eq 2 d^(1 \/ t') + frac(4 d, N^(1 \/ s)) lt.eq 8 d^(1 \/ r) . $
  ◻
]

Fix $J$, put $L = L_J$, and choose $epsilon.alt > 0$ so that

#[#set math.equation(numbering: n => "(25)")
 $ epsilon.alt L^(1 \/ r) lt.eq theta_J . $ <pair:epsilon>]

We now construct a weakly null admissible block sequence $\( x_i \)$ and integer windows $\[ J_i \, T_i \]$ satisfying

#[#set math.equation(numbering: n => "(26)")
 $ & 1 lt.eq parallel x_i parallel lt.eq 2 \, #h(2em) J_i > J \, #h(2em) J_(i + 1) > T_i \,\
 & J_i > max { rho \( alpha \, beta \) : alpha lt.eq beta upright(" belong to ") union.big_(h < i) "supp" x_h } \,\
 & sum_(b = 1)^d parallel P_(I_b) x_i parallel lt.eq A d^(1 \/ r) quad \( d lt.eq L_(J_i) \) \, #h(2em) A = 16 \,\
 & parallel x_i parallel_1 sum_(j > T_i) m_j^(- 1) lt.eq epsilon.alt \, #h(2em) parallel x_i parallel_1 sum_(j > T_i) m_j^(- 1) arrow.r 0 . $ <pair:window-order>]

Here $parallel x parallel_1 = sum_alpha \| x \( alpha \) \|$ for a finite vector, and the maximum over an empty set imposes no condition.

For completeness, choose preliminary successive unit blocks $u_i$ recursively. Choose $J_i > J$, also larger than the preceding $T$ (when present) and all the $rho$-values on the supports chosen so far. Apply Lemma 23 with $N = L_(J_i)$, then choose $T_i gt.eq J_i$ so large that

$ parallel u_i parallel_1 sum_(j > T_i) m_j^(- 1) lt.eq min { epsilon.alt \/ 2 \, 1 \/ i } . $

By Proposition 21, pass to a weak-Cauchy subsequence and take differences of successive pairs. These differences are weakly null. Projection onto the first member of a pair gives the lower norm bound $1$; the upper bound is $2$. Give each difference the window from the first member’s $J$ to the second member’s $T$. Both old partition bounds apply for $d lt.eq L_(J_i)$, where $J_i$ is the new lower endpoint, so their sum gives (26). The remaining assertions follow by monotonicity of the tails and the original spacing. We relabel the resulting sequence and windows as above.

=== 7.2 A path cannot repeatedly meet its weight windows <a-path-cannot-repeatedly-meet-its-weight-windows>

For a finite uncropped path $P = \( phi.alt_ell \)$ with weights $j_ell$, write

$ P \[ i \] = sum_(ell : med J_i lt.eq j_ell lt.eq T_i) phi.alt_ell . $

We say that $P$ hits $i$ at threshold $delta > 0$ when $\| P \[ i \] \( x_i \) \| > delta$. This definition uses the original pieces and their original coding, even when the path is later cropped inside a norming expression.

#thm([Lemma 7.3.])[
  #emph[For every $delta > 0$ and every infinite set of indices there is an infinite subset on which no finite uncropped path has four hits at threshold $delta$.]
] <pair:four-hits>

#proof[
  Color a four-element set positively if one finite path hits all four indices. By the infinite Ramsey theorem, it suffices to rule out an infinite set $M$ all of whose four-element subsets are positive.
  Fix $v < t < k$ in $M$. For each $w in M$ with $w < v$, choose a path hitting $w \, v \, t \, k$. Partition these paths according to their actual histories of weights below $J_v$: this history records the uncropped pieces, their weights, and their metadata, with their actual ordinal coordinates. We claim that representatives of different classes have disjoint weight sets in $\[ J_k \, T_k \]$.
  Indeed, suppose two such paths share a weight in that window. It is a successor weight in both paths, because both hit $t$. Injectivity of the coding map identifies their preceding compressed codes. These codes have a common final metadata value $p gt.eq J_t$, so (26) gives $p > max rho \( "supp" x_v \)$. Choose coordinates $a \, b$ of $"supp" x_v$ at which the respective $v$-window pieces are nonzero, and suppose $a lt.eq b$. The first closure contains $a$; the second contains $b$, and hence $a$, by coherence and the bound on $p$. The two closures have the same initial segment through $a$, by Lemma 15.
  In the first path every piece of weight below $J_v$ lies strictly before $a$. Its compressed array is zero after the position of $a$. Equality of the codes therefore identifies that entire uncropped piece in the second path: the positions through $a$ have the same ordinal labels, and every later coefficient is zero. The metadata agree as well. Thus the two actual histories below $J_v$ are equal, proving the claim.
  Crop each class representative to its pieces in $\[ J_k \, T_k \]$. This is a legal ordinal crop because pieces and weights are successive. Their active weight sets are pairwise disjoint. Type II combinations and rational approximation therefore give
  $ parallel \( P_b \[ k \] \( x_k \) \)_b parallel_(q') lt.eq parallel x_k parallel lt.eq 2 . $
  Every coordinate has absolute value greater than $delta$. In particular, the number of classes is bounded by an integer $D$ depending only on $delta$, for example any integer $D gt.eq \( 2 \/ delta \)^(q')$.
  Choose triples $v_n < t_n < k_n$ from $M$ with $v_n arrow.r oo$, and label the classes for each triple by elements of ${ 1 \, dots.h \, D }$. Each fixed $w in M$ has a label once $w < v_n$. Successive subsequences followed by a diagonal subsequence make its label eventually constant, for every fixed $w$. One label occurs for an infinite set $M_0$ of fixed indices. For each sufficiently large $n$, let $P_n$ be a representative of that label. Then, for every fixed $w in M_0$, $P_n$ hits $w$ for all sufficiently large $n$: eventually $T_w < J_(v_n)$, and equality of actual histories below $J_(v_n)$ preserves the whole $w$-window.
  Choose $w_0 in M_0$ so large that
  $ A sum_(j gt.eq J_(w_0)) theta_j < delta \/ 4 . $
  For fixed $w in M_0$ with $w > w_0$, consider $n$ large enough that $P_n$ hits both $w_0$ and $w$. Every piece of weight below $J_(w_0)$ precedes a coordinate in $"supp" x_(w_0)$, and hence vanishes on $x_w$. For $J_(w_0) lt.eq j < J_w$, the child intervals of a weight-$j$ piece and (26) give the bound $A theta_j$ on its absolute evaluation at $x_w$. The total contribution of weights above $T_w$ is at most the expression in (26), which is less than $delta \/ 4$ for all sufficiently large $w$. Consequently
  $ \| P_n \( x_w \) \| gt.eq delta \/ 2 $
  for every sufficiently large fixed $w in M_0$, once $n$ is sufficiently large depending on $w$.
  The finite path sums belong to $B_(E^(*))$. A weak-star convergent subnet of $\( P_n \)$ has a limit $P$ satisfying $\| P \( x_w \) \| gt.eq delta \/ 2$ at every one of these fixed indices: each inequality is eventually true and defines a weak-star closed set. This contradicts weak nullity of $\( x_w \)$. ◻
]

Select $L$ of the blocks successively. After selecting the $i$th block, choose $delta_(i + 1) > 0$ such that

#[#set math.equation(numbering: n => "(27)")
 $ T_i delta_(i + 1) lt.eq epsilon.alt 2^(- i) \, $ <pair:threshold>]

and apply Lemma 24 to the remaining infinite set. Relabel the selected blocks $x_1 \, dots.h \, x_L$, carrying their windows with them. For each $i < L$, every uncropped path has at most three hits at threshold $delta_(i + 1)$ among the selected indices strictly after $i$.

=== 7.3 Estimating a norming expression <estimating-a-norming-expression>

We prove

#[#set math.equation(numbering: n => "(28)")
 $ ∥sum_(i = 1)^L x_i∥ lt.eq 500 L \/ m_J . $ <pair:sum-bound>]

In pure mode the relevant norming set is $K_k$; in mixed mode it is $K$, including its pure terminal functionals. Lemma 16 identifies the pure norm with the full norm on that color. The estimate follows by a recursion on a finite expression in the relevant norming set. We allow an arbitrary set $I subset { 1 \, dots.h \, L }$ to be assigned to each node; its evaluation vector is $\( \| f \( x_i \) \| upright(bold(1))_I \( i \) \)_(i = 1)^L$. Allowing these subsets is essential because different descendants will receive different blocks.

At a nonterminal node, regard Type I as a single path with coefficient $1$, and write Type II as a combination of cropped paths $P_b$ with coefficients $a_b$, where $sum_b \| a_b \|^q lt.eq 1$. Across all these paths the active weights are distinct. A group of weight $j$ is a cropped Type I piece, represented as $m_j^(- 1)$ times a sum of at most $L_j$ nonzero successive cropped children. The children have lower construction stage. The following estimates also apply when some assigned evaluations vanish. We first bound every evaluation vector in $ell_r$; we then stop the same recursion at depth $d_J$ and separate the small $ell_r$ charges from the finitely many remaining $ell_1$ charges.

===== 7.3.1 Weights above a window. <weights-above-a-window.>

For each $i in I$, the total absolute contribution of groups with $j > T_i$ is at most $epsilon.alt$, by the coefficient bound $1 \/ m_j$ and (26). Its vector norm in $ell_r^L$ is at most $epsilon.alt L^(1 \/ r)$.

===== 7.3.2 Weights in a window. <weights-in-a-window.>

Let $t_(b i)$ be the signed evaluation on $x_i$ of the $b$th cropped path’s pieces with weights in $\[ J_i \, T_i \]$. Further cropping to those pieces preserves disjoint active weights. Hence

#[#set math.equation(numbering: n => "(29)")
 $ parallel \( t_(b i) \)_b parallel_(q') lt.eq 2 . $ <pair:column>]

For each path with a nonzero $t_(b i)$ on $I$, let $e$ be the first such index. Mark $e$, every subsequent nonzero index at which the path’s crop partly meets $"supp" x_i$, and every subsequent index that is an uncropped hit at threshold $delta_(e + 1)$. The latter instruction is empty if $e = L$. An interval has at most two boundary blocks; a rectangle has at most four, two for each order. The thinning gives at most three large hits after $e$. Thus each path has at most eight marked indices. At any other nonzero index the whole block lies in the crop, so its cropped evaluation agrees with its uncropped evaluation and has absolute value at most $delta_(e + 1)$.

At most $T_e$ paths can have earliest index $e$, since each then has a nonzero active piece of a distinct weight in $\[ J_e \, T_e \]$. By (27), the total unmarked contribution at each column is at most $sum_(e < i) T_e delta_(e + 1) lt.eq epsilon.alt$. For the marked contribution $M_i$, Hölder’s inequality and (29) give

$ M_i lt.eq 2 (sum_(b : med i upright(" is marked for ") b) \| a_b \|^q)^(1 \/ q) . $

Summing its $q$th powers and using the eight-mark bound yields

#[#set math.equation(numbering: n => "(30)")
 $ parallel M parallel_r lt.eq parallel M parallel_q lt.eq 2 thin 8^(1 \/ q) lt.eq 16 \, #h(2em) parallel M parallel_1 lt.eq 16 L^(1 \/ q') . $ <pair:marked>]

===== 7.3.3 Weights below a window. <weights-below-a-window.>

For a group of weight $j < J_i$, let $d_(j i)$ be the number of its child ordinal ranges meeting $"supp" x_i$. If $d_(j i) = 0$ there is no contribution. Otherwise (26) applies, because $d_(j i) lt.eq L_j lt.eq L_(J_i)$, and bounds the absolute contribution by

$ A / m_j d_(j i)^(1 \/ r) . $

When $d_(j i) = 1$, we may instead continue to that unique child, assigning it $i$ and retaining the coefficient $\| a_b \| \/ m_j lt.eq 1 \/ m_j$. Within one group, the index sets assigned to its different children are disjoint. When $d_(j i) gt.eq 2$, we stop and charge this bound at the current node. The boundary incidence estimate is

#[#set math.equation(numbering: n => "(31)")
 $ sum_(i : med d_(j i) gt.eq 2) d_(j i) lt.eq 2 L_j . $ <pair:incidence>]

Indeed, a child range can meet at most one block that also meets an earlier child range, and at most one that also meets a later child range; this follows from the succession of both the blocks and the child ranges. Every counted incidence has one of these two properties. Thus the boundary charge for one group has $ell_r$ norm at most $2 A theta_j$.

===== 7.3.4 A uniform bound on all recursive evaluations. <a-uniform-bound-on-all-recursive-evaluations.>

If every continued child vector has $ell_r$ norm at most $K$, disjointness of the assignments within one group bounds their combined contribution by $K L_j^(1 \/ r) \/ m_j = K theta_j$. Summing over distinct weights gives $c_0 K$. Assignments from different weights may overlap; this last step uses the triangle inequality and does not require disjointness between groups.

A terminal coordinate functional has evaluation at most $2$ on at most one block. In mixed mode the same is true of a terminal pure functional, since its color meets at most one mixed block. Induction on the construction stage, with arbitrary assigned sets at every stage, now bounds every node’s evaluation vector by $K_0 = 64$ in $ell_r$. In fact the nonterminal estimate is

$ 16 + 2 epsilon.alt L^(1 \/ r) + 2 A c_0 + c_0 K_0 < 64 \, $

by (25), $A = 16$, $c_0 < 1 \/ 8$, and $theta_J < 1 \/ 8$.

===== 7.3.5 Stopping above the prescribed weight. <stopping-above-the-prescribed-weight.>

We refine this recursion by continuing only the singleton cases with $j < J$. Expand these continuations to depth $d = d_J$. For low groups with $j gt.eq J$, stop the singleton cases as well. Their total incidence is at most $2 L_j + L lt.eq 3 L_j$, by (31) and $L = L_J lt.eq L_j$. Their $ell_r$ charge is consequently at most $3 A theta_j$ per group. Together with the high and unmarked charges, the resulting small charge at any node has norm at most

$ 3 A sum_(j gt.eq J) theta_j + 2 epsilon.alt L^(1 \/ r) lt.eq \( 12 A + 2 \) theta_J . $

Propagate these charges through the continued edges. The support condition is preserved at every step: a node assigned $I$ has all its charge and residual vectors zero outside $I$, and each child receives only its own assigned subset. To see why the contraction also applies to substituted charge vectors, let $w_(j h) gt.eq 0$ be arbitrary vectors supported on the child assignments of the continued group of weight $j$. Those supports are disjoint as $h$ varies within a group, although supports from different groups may overlap. If every $parallel w_(j h) parallel_r lt.eq K$, their recombination, with the path coefficients included, has norm at most

$ sum_(j < J) 1 / m_j (sum_h parallel w_(j h) parallel_r^r)^(1 \/ r) lt.eq K sum_(j < J) theta_j lt.eq c_0 K . $

The first inequality uses disjointness within a group and the triangle inequality across groups. Recursive substitution preserves the support condition, so it costs at most $c_0$ at each level. Thus all the small charges, together with the residual evaluation vectors at depth $d$, have total $ell_r$ norm at most

#[#set math.equation(numbering: n => "(32)")
 $ frac(12 A + 2, 1 - c_0) theta_J + c_0^d K_0 lt.eq (frac(194, 7 \/ 8) + 64) theta_J = 2000 / 7 theta_J . $ <pair:small-total>]

The depth condition in Lemma 14 was used in the second inequality. Hölder’s inequality converts this to an $ell_1$ bound $2000 / 7 L^(1 \/ s) theta_J = 2000 / 7 L \/ m_J$.

It remains to count the other charges above depth $d$: terminal charges, marked charges, and boundary charges of weights $j < J$. At a node their $ell_1$ sum is at most

$ 2 + 16 L^(1 \/ q') + A B_J lt.eq 16 \( 1 + B_J + L^(1 \/ q') \) . $

For the last term we used (31), $d_(j i)^(1 \/ r) lt.eq d_(j i)$, and $m_j gt.eq 1$. A node has at most $sum_(j < J) L_j$ continued children. The number of nodes at depths strictly below $d$ is therefore at most $\( 1 + B_J \)^d$, also when $J = 1$ and $B_J = 0$. Propagation coefficients are at most $1$. The other parameter inequality from Lemma 14 bounds their total cost by $16 L \/ m_J$. Combining this with (32) gives

$ sum_(i = 1)^L \| f \( x_i \) \| lt.eq 2112 / 7 L / m_J < 500 L / m_J $

for every relevant norming functional $f$. Taking the supremum proves (28).

#proof[
  Perform the preceding construction in the prescribed tail and put $y = \( m_J \/ L \) sum_(i = 1)^L x_i$. Equation (28) gives $parallel y parallel lt.eq 500$. Choose a normer $g_i$ in the family with $g_i \( x_i \) gt.eq 1 \/ 2$ and crop it to the ordinal range of $x_i$, also to its color range in the mixed case. These nonzero normers are successive, so
  $ phi.alt = 1 / m_J sum_(i = 1)^L g_i $
  is a Type I functional of weight $J$. Their cross evaluations vanish, and hence $phi.alt \( y \) = L^(- 1) sum_i g_i \( x_i \) gt.eq 1 \/ 2$. The crops give the asserted support bounds. ◻
]

== 8 Path functionals on arbitrary subspaces <branch:section>

The exact pairs of Proposition 22 belong to block subspaces. We now transfer their separation property to every infinite-dimensional closed subspace of $E$. The transfer uses a projection onto an initial ordinal segment, followed, when possible, by a projection onto one color. These projections preserve the path evaluations that we shall construct.

#thm([Lemma 8.1.])[
  #emph[Let $F$ be an infinite-dimensional closed subspace of $E$. There are a nonzero limit ordinal $gamma lt.eq omega_1$, an infinite-dimensional closed subspace $H subset P_(< gamma) E$, a bounded linear map $U : H arrow.r F$, and one of the following two alternatives:]
  + #emph[For some color $C_k$, we have $H subset P_(C_k) E$ and $P_(C_k) P_(< gamma) U h = h$ for every $h in H$.]
  + #emph[We have $P_(< gamma) U h = h$ for every $h in H$, and every restriction $P_(C_k) \|_H$ is strictly singular.]
  #emph[In both alternatives, $P_(< beta) \|_H$ is strictly singular for every $beta < gamma$. Moreover, if $P$ is an actual path functional supported below $gamma$, and supported on $C_k$ in the first alternative, then 
#[#set math.equation(numbering: n => "(33)")
 $ P \( U h \) = P \( h \) #h(2em) \( h in H \) . $ <branch:lift-identity>]

]
] <branch:reduction>

#proof[
  Choose $gamma lt.eq omega_1$ least such that $P_(< gamma) \|_F$ is not strictly singular; it exists because $P_(< omega_1) = I_E$. It is nonzero. It cannot be a successor $beta + 1$: on an infinite-dimensional closed subspace where $P_(< beta + 1)$ is bounded below, intersect with the kernel of $e_beta^(*)$. This intersection is still infinite dimensional, and $P_(< beta) = P_(< beta + 1)$ there, contradicting minimality.
  Choose an infinite-dimensional closed $F_0 subset F$ on which $P_(< gamma)$ is bounded below. Its image $H_0 = P_(< gamma) F_0$ is closed, and its inverse $U_0 : H_0 arrow.r F_0$ is bounded. Every earlier projection is strictly singular on $H_0$. Indeed, if $P_(< beta)$ were bounded below by $a > 0$ on an infinite-dimensional closed $M subset H_0$, then
  $ parallel P_(< beta) U_0 h parallel = parallel P_(< beta) h parallel gt.eq a parallel h parallel gt.eq frac(a, parallel U_0 parallel) parallel U_0 h parallel #h(2em) \( h in M \) $
  would contradict the choice of $gamma$.
  If all the color projections are strictly singular on $H_0$, take $H = H_0$ and $U = U_0$, giving the second alternative. Otherwise choose $k$ and an infinite-dimensional closed $H_1 subset H_0$ such that $C = P_(C_k)$ is bounded below by $b > 0$ on $H_1$. Set
  $ H = C H_1 \, #h(2em) U = U_0 \( C \|_(H_1) \)^(- 1) . $
  The space $H$ is closed, and $C P_(< gamma) U = I_H$. To check earlier projections, suppose $P_(< beta)$ is bounded below by $a > 0$ on an infinite-dimensional closed $M subset H$. On $\( C \|_(H_1) \)^(- 1) M$, commutation and contractivity of the projections give
  $ parallel P_(< beta) z parallel gt.eq parallel C P_(< beta) z parallel = parallel P_(< beta) C z parallel gt.eq a parallel C z parallel gt.eq a b parallel z parallel \, $
  contradicting strict singularity on $H_0$.
  Finally, put $R = P_(< gamma)$ in the second alternative and $R = P_(C_k) P_(< gamma)$ in the first. Then $R U = I_H$. Each finite partial sum of a path with the stated support is fixed by composition with $R$. Passing to its pointwise limit on $E$ gives $P compose R = P$, and hence (33). ◻
]

#thm([Theorem 8.2.])[
  #emph[For every infinite-dimensional closed subspace $F subset E$, there are a single operation family, a number $delta_F > 0$, and actual path functionals $P_b in B_(E^(*))$ of that family, indexed by $b in { 0 \, 1 }^(bb(N))$, such that 
$ parallel P_b \|_F - P_c \|_F parallel gt.eq delta_F #h(2em) \( b eq.not c \) . $

]
] <branch:separation>

#proof[
  Apply Lemma 25. We use the pure $k$ family in its first alternative and the mixed family in its second. There are two steps: approximate vectors in $H$ by successive finite blocks, and use exact pairs in those blocks to label a binary tree.
  ===== 8.1 Successive blocks and a small perturbation. <successive-blocks-and-a-small-perturbation.>
  Choose positive numbers $epsilon_i$ with
  $ sum_(i = 1)^oo epsilon_i lt.eq 1 / 32000 . $
  We construct $h_i in H$ and nonzero finite vectors $z_i in E$ satisfying
  #[#set math.equation(numbering: n => "(34)")
   $ parallel h_i parallel = 1 \, #h(2em) parallel h_i - z_i parallel < epsilon_i \, #h(2em) "supp" z_i subset \[ 0 \, gamma \) \, $ <branch:block-approximation>]
  with the $z_i$ successive on $C_k$ in the pure case, and successive in both ordinal and color ranges in the mixed case.
  Here is the inductive step. After $z_1 \, dots.h \, z_(i - 1)$ have been chosen, let $beta < gamma$ lie strictly above their supports; this is possible because $gamma$ is a limit ordinal. For $i = 1$, take $beta = 0$. In the mixed case let $l$ be the largest color previously used, with $l = - 1$ at the first step. Apply Lemma 5 to $P_(< beta) \|_H$, and in the mixed case also to the finitely many maps $P_(C_j) \|_H$, $0 lt.eq j lt.eq l$. We may therefore choose a unit vector $h_i in H$ for which
  $ parallel P_(< beta) h_i parallel < epsilon_i \/ 3 \, #h(2em) sum_(j = 0)^l parallel P_(C_j) h_i parallel < epsilon_i \/ 3 quad upright("in the mixed case") . $
  The second sum is zero when $l = - 1$. In the pure case remove the initial ordinal segment from $h_i$; in the mixed case remove also all colors at most $l$. The resulting vector differs from $h_i$ by less than $2 epsilon_i \/ 3$, because the remaining ordinal projection is contractive. It is supported below $gamma$ and in the required ordinal and color tails. A finite-support approximation, cropped to those same sets, gives $z_i$ satisfying (34). In the pure case the approximation is additionally cropped to $C_k$.
  The ordinal interval projections show that $\( z_i \)$ is a basic sequence with prefix projections of norm at most one. Since $parallel z_i parallel gt.eq 1 \/ 2$, its coefficients satisfy
  $ \| a_i \| lt.eq 4 parallel sum_j a_j z_j parallel $
  on finite sums. Consequently the map defined there by $V z_i = h_i$ extends to a bounded map $V : \[ z_i \] arrow.r H$ with
  #[#set math.equation(numbering: n => "(35)")
   $ parallel V - I parallel lt.eq 4 sum_i epsilon_i lt.eq eta \, #h(2em) eta := 1 / 8000 \, #h(2em) parallel V parallel lt.eq 1 + eta . $ <branch:perturbation>]
  Here $I : \[ z_i \] arrow.r E$ is the inclusion, so the first norm is taken for maps into $E$; the image of $V$ lies in $H$ because $H$ is closed.
  ===== 8.2 A binary tree of exact pairs. <a-binary-tree-of-exact-pairs.>
  As in the James tree construction #cite(label("James1974")), branches will separate dual functionals. Here the nodes carry the prescribed-weight pairs constructed in Proposition 22. List the finite binary sequences in breadth-first order, ordering each finite level lexicographically. For each node $s$ we shall choose a finite block vector $y_s in "span" { z_i : i in bb(N) }$, a Type I functional $phi.alt_s$, its declared weight $J_s$, and its integer metadata $p_s$. Apply Proposition 22 successively in this order, always beyond every block used at earlier nodes. It gives
  #[#set math.equation(numbering: n => "(36)")
   $ parallel y_s parallel lt.eq 500 \, #h(2em) phi.alt_s \( y_s \) gt.eq 1 / 2 . $ <branch:node-pair>]
  The support of $phi.alt_s$ lies in the ordinal block range used for $y_s$, and in its color range as well in the mixed case. Thus the supporting ranges for different nodes are disjoint and successive in the chosen enumeration. In particular,
  #[#set math.equation(numbering: n => "(37)")
   $ phi.alt_s \( y_t \) = 0 #h(2em) \( s eq.not t \) . $ <branch:cross-evaluations>]
  We now specify the weights and metadata, so that every branch is an actual path. Give the root any positive weight. Once $phi.alt_s$ is chosen, choose $p_s$ greater than the metadata at its predecessor, and at least $J_s$ and the maximum of $rho$ on the finite union of supports along the branch from the root to $s$. At the root the predecessor condition is omitted. Form the prescribed order-position code of this whole prefix, and let both children of $s$ have weight equal to its $sigma$-value. Their weight is therefore already known when they are processed. Proposition 22 allows any target weight in any tail, so every step is possible. The siblings have the same weight; this causes no conflict, since they never belong to the same path. The disjoint-active-weight requirement for a Type II combination places no additional restriction on the individual paths constructed here.
  For $b in { 0 \, 1 }^(bb(N))$, let
  $ P_b = sum_(n = 0)^oo phi.alt_(b \| n) \, $
  where $b \| 0$ is the root. Succession and the chosen codes make this an actual path in the selected family. Its finite partial sums have norm at most one, so it defines $P_b in B_(E^(*))$. Every piece is supported below $gamma$, and on $C_k$ in the pure case. Thus (33) applies to every $P_b$.
  If $b eq.not c$, choose a node $s$ on $b$ beyond their first divergence. Equations (36) and (37) give
  $ P_b \( y_s \) gt.eq 1 / 2 \, #h(2em) P_c \( y_s \) = 0 . $
  Test their restrictions to $F$ at $U V y_s$. By the lift identity and (35),
  $ \( P_b - P_c \) \( U V y_s \) & = \( P_b - P_c \) \( V y_s \)\
 & gt.eq 1 / 2 - 2 eta parallel y_s parallel gt.eq 3 / 8 \, #h(2em) parallel U V y_s parallel lt.eq 500 parallel U parallel \( 1 + eta \) . $
  The conclusion follows with
  $ delta_F = frac(3, 8 dot.op 500 parallel U parallel \( 1 + eta \)) > 0 . $
  ◻
]

== 9 Changing the predual <sec:predual>

We now assume CH. The preceding construction produced a dual space $E = X_0^(*)$ in which every infinite-dimensional subspace is distinguished by uncountably many path functionals. Its coordinate predual $X_0$ does not itself give the required counterexample: on each separable subspace of $E$, the coordinate evaluations form a separable set. We construct a different predual whose evaluations approximate all the path functionals modulo coordinate evaluations. The evaluation criterion then excludes every separable infinite-dimensional quotient.

=== 9.1 A small perturbation of a quotient map <a-small-perturbation-of-a-quotient-map>

We first isolate the functional-analytic step. For a Banach space $E$, write $J_E : E arrow.r E^(* *)$ for its canonical embedding.

#thm([Lemma 9.1.])[
  #emph[Let $Y$ be a closed subspace of $E^(*)$ such that the evaluation map $E arrow.r Y^(*)$ is an isometric isomorphism. Set $W = E^(*) \/ Y$ and let $Q : E^(*) arrow.r W$ be the quotient map. Suppose that a bounded linear map $B : E^(*) arrow.r W$ satisfies 
$ parallel B parallel lt.eq 1 / 10 \, #h(2em) B^(*) \( W^(*) \) subset J_E \( E \) \, #h(2em) B \( E^(*) \) subset V := overline(B \( Y \)) . $

 Then $X = ker \( Q - B \)$ is a Banach space, restriction induces an isomorphism $E arrow.r X^(*)$, and $overline(B \( X \)) = V$.]
] <twist:lemma>

#proof[
  Put $L = Q - B$ and $b = parallel B parallel$. Every $w in W$ has a $Q$-lift of norm at most $\( 11 \/ 10 \) parallel w parallel$. Starting with such a lift $y_0$ of $w$, lift the error $B y_0$, then the next error, and so on. The resulting series converges because $\( 11 \/ 10 \) b < 1$. Its sum is an $L$-lift of $w$ of norm at most
  #[#set math.equation(numbering: n => "(38)")
   $ C parallel w parallel \, #h(2em) C = frac(11 \/ 10, 1 - \( 11 \/ 10 \) b) . $ <eq:lift-constant>]
  In particular $L$ is onto and $C b < 1$.
  Restriction to $Y$ gives the decomposition
  $ E^(* *) = Y^perp xor J_E \( E \) . $
  Indeed the restriction of $z^(* *)$ belongs to $Y^(*) = E$, and subtracting its canonical image leaves an element of $Y^perp$. Moreover $Q^(*)$ is an isometric isomorphism from $W^(*)$ onto $Y^perp$. Since $L$ is onto,
  $ X^perp = L^(*) \( W^(*) \) = { Q^(*) w^(*) - B^(*) w^(*) : w^(*) in W^(*) } . $
  For completeness, the first equality follows by factoring a bounded functional vanishing on $ker L$ through $L$; the lift bound makes the factor bounded. The displayed subspace is a graph over $Y^perp$ with values in $J_E \( E \)$. Consequently $J_E \( E \)$ maps bijectively onto $E^(* *) \/ X^perp = X^(*)$. This bijection is bounded with bounded inverse, by the open mapping theorem. Thus restriction identifies $E$ with $X^(*)$.
  Let $G = overline(B \( X \)) subset V$. Define
  $ A : W arrow.r V \/ G \, #h(2em) A \( L y \) = B y + G . $
  This is well-defined because two $L$-lifts differ by an element of $X$. The lift bound gives $parallel A parallel lt.eq C b < 1$. For $y in Y$ one has $L y = - B y$, and hence $A \( B y \) = - B y + G$. By density, $A \|_V$ is minus the canonical quotient map $V arrow.r V \/ G$. If $G eq.not V$, that quotient map has norm one, contradicting $parallel A parallel < 1$. Therefore $G = V$. ◻
]

=== 9.2 Coding path cosets by coordinates <coding-path-cosets-by-coordinates>

Return to the space of Section 5, with $Y = X_0$. Let $t$ range over the countably many pure families $k gt.eq 0$ and the mixed family, denoted by $*$. Write $q_t$ for its Type II exponent and $cal(P)_t$ for its set of actual infinite paths, including their weights and metadata. Regard a path also as its bounded functional on $E$.

#thm([Lemma 9.2.])[
  #emph[For each family $t$ there is a contraction 
$ S_t : ell_(q_t) \( cal(P)_t \) arrow.r W \, #h(2em) S_t e_P = Q P . $

]
] <twist:path-map>

#proof[
  Consider finitely many distinct paths. By Lemma 20, removing a finite prefix from each leaves pairwise disjoint weight sets. A removed prefix has finite support and belongs to $X_0$, so it does not change the path coset. Finite truncations of the remaining tails are allowed crops of the original path prefixes, with their uncropped metadata unchanged. The Type II rule bounds every rational $ell_(q_t)$-unit combination of them by one in $E^(*)$. Their pointwise limits on $E$ give bounded full-tail representatives in $E^(*)$. Applying $Q$ to those representatives, and then approximating real coefficients, gives
  $ parallel sum_P a_P Q P parallel lt.eq #scale(x: 180%, y: 180%)[\(] sum_P \| a_P \|^(q_t) #scale(x: 180%, y: 180%)[\)]^(1 \/ q_t) $
  for every finitely supported real family $\( a_P \)$. Completion gives $S_t$. ◻
]

Each path is specified by countably many finite ordinal supports, rational arrays, weights and integer metadata. Under CH,

$ \| cal(P)_t \| lt.eq \( ℵ_1 \)^(ℵ_0) = ℵ_1 . $

For pure family $k$, assign distinct labels to coordinates in $C_(k + 1)$; for the mixed family assign them to coordinates in $C_1$. The latter color is shared with pure family $0$, so partition it into two sets of cardinality $ℵ_1$ first. This gives injections

$ iota_k : cal(P)_k arrow.r C_(k + 1) \, #h(2em) iota_(*) : cal(P)_(*) arrow.r C_1 $

whose ranges are mutually disjoint.

Write $s_(upright("src")) \( t \) = s_(k + 1)$ for pure family $k$, and $s_(upright("src")) \( * \) = s_1$. The choice of parameters gives $s_(upright("src")) \( t \)' lt.eq q_t$. For $y in E^(*)$ define

$ b_t \( y \) = #scale(x: 120%, y: 120%)[\(] y \( e_(iota_t \( P \)) \) #scale(x: 120%, y: 120%)[\)]_(P in cal(P)_t) . $

The pure-coordinate bound in Lemma 5.4, followed by finite-dimensional duality and then a supremum over finite subsets, gives

$ parallel b_t \( y \) parallel_(s_(upright("src")) \( t \)') lt.eq parallel y parallel \, #h(2em) parallel b_t \( y \) parallel_(q_t) lt.eq parallel y parallel . $

Choose positive numbers $tau_t$ with $sum_t tau_t lt.eq 1 \/ 10$, and put

$ B y = sum_t tau_t S_t b_t \( y \) \, #h(2em) y in E^(*) . $

This series converges in $W$ and defines an operator of norm at most $1 \/ 10$.

#thm([Lemma 9.3.])[
  #emph[The operator $B$ satisfies 
$ overline(B \( X_0 \)) = overline("span") { Q P : P in cal(P)_t \, med t upright(" a family") } = : V \, #h(2em) B \( E^(*) \) subset V \, #h(2em) B^(*) \( W^(*) \) subset J_E \( E \) . $

]
] <twist:properties>

#proof[
  The first two claims follow from finite approximation in each $ell_(q_t) \( cal(P)_t \)$ and the summability of the $tau_t$. For the reverse inclusion in the first claim, use the assigned coordinate functional: disjointness of the label ranges gives $B e_(iota_t \( P \))^(*) = tau_t Q P$.
  Fix $w^(*) in W^(*)$. The coefficient family $S_t^(*) w^(*)$ belongs to $ell_(q'_t) \( cal(P)_t \)$ with norm at most $parallel w^(*) parallel$. Since $q'_t lt.eq s_(upright("src")) \( t \)$, it also belongs to $ell_(s_(upright("src")) \( t \))$ with no larger norm. The pure-coordinate bound therefore makes
  $ v_t = sum_(P in cal(P)_t) \( S_t^(*) w^(*) \) \( P \) e_(iota_t \( P \)) $
  a norm-convergent vector series in $E$, of norm at most $parallel w^(*) parallel$. Here, as usual, an $ell_p$ family with finite $p$ has countable support. The vector $v = sum_t tau_t v_t$ converges in $E$. Testing the definition of $B$ against $w^(*)$, first on finite sums and then by continuity, gives $B^(*) w^(*) = J_E v$. ◻
]

=== 9.3 The obstruction to all separable quotients <the-obstruction-to-all-separable-quotients>

Set $X = ker \( Q - B \)$. Proposition 18 and Lemmas 27 and 29 identify $X^(*)$ with $E$, and show that $overline(B \( X \)) = V$. Write $R : E arrow.r X^(*)$ for this restriction isomorphism. In particular $X$ is infinite dimensional. The following argument explains why density of these path cosets is the property needed for the quotient problem.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X= ker (Q-B)$])
  content((5.401, 0), [$V= overline(B(X))$])
  content((0, 1.861), [$E^*$])
  content((5.401, 1.941), [$W=E^*"/"X_0$])
  line((0.3275, 1.866), (4.554, 1.928), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.701, 1.901), [$Q$], anchor: "south", padding: 0.1176cm)
  line((0.9889, 0), (4.589, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.701, 0), [$B|_X$], anchor: "north", padding: 0.1176cm)
  line((0, 0.301), (0, 1.601), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.401, 0.3363), (5.401, 1.636), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The new predual $X$. The square commutes because $Q x = B x$ on $X$, and $B \( X \)$ is dense in the closed span $V$ of the path cosets. The vertical arrows are inclusions; restriction identifies $X^(*)$ with $E$. ],
) <fig:predual>

#thm([Theorem 9.4.])[
  #emph[Under CH there is an infinite-dimensional real Banach space with no separable infinite-dimensional quotient.]
] <twist:counterexample>

#proof[
  Use the space $X$ just constructed. Let $F subset E$ be any infinite-dimensional separable closed subspace, and put
  $ C_F = overline({ y \|_F : y in X_0 }) subset F^(*) . $
  This space is separable. Indeed a countable dense subset of $F$ is supported on a common countable set of coordinates; all other coordinate functionals vanish on $F$. Since $X_0$ is the closed coordinate span, its restrictions belong to the closed span of a countable family.
  Restriction induces a bounded map
  $ T_F : W arrow.r F^(*) \/ C_F \, #h(2em) T_F \( Q y \) = y \|_F + C_F . $
  We claim that $T_F \( V \)$ is nonseparable. Otherwise its closure $M$ would be separable. The inverse image of $M$ under the quotient map $F^(*) arrow.r F^(*) \/ C_F$ is then separable: its kernel $C_F$ is separable, and the restriction of the quotient map to this inverse image still has the quotient norm. More explicitly, lift a countable dense set $\( m_n \)$ in $M$ to vectors $\( u_n \)$ in $F^(*)$, and choose a countable dense set $\( c_j \)$ in $C_F$. For any vector $z$ in the inverse image, first make its quotient close to $m_n$. The quotient norm then makes $z - u_n$ close to a vector of $C_F$, which can in turn be approximated by some $c_j$. Thus the countable set ${ u_n + c_j : n \, j gt.eq 1 }$ is dense in the inverse image. But this inverse image contains every path restriction $P \|_F$. Theorem 26 supplies an uncountable norm-separated family among those restrictions, a contradiction.
  Because $overline(B \( X \)) = V$, continuity gives $overline(T_F \( B X \)) = overline(T_F \( V \))$; hence $T_F \( B X \)$ is nonseparable. For $x in X$ we have $Q x = B x$, so the evaluation image ${ x \|_F : x in X } subset F^(*)$ has a nonseparable image in $F^(*) \/ C_F$. It is itself nonseparable. Given any infinite-dimensional separable closed $F' subset X^(*)$, apply this conclusion to $F = R^(- 1) \( F' \)$. Composition with the bounded isomorphism $R \|_F : F arrow.r F'$ identifies the two evaluation images and preserves norm separability. Thus the evaluations on every such $F'$ are nonseparable. The necessary direction of Proposition 4 therefore rules out a separable infinite-dimensional quotient of $X$. ◻
]

The scalar-field transfer of Section 4 supplies a complex counterexample as well. This is a consequence of the finite-sum lemma there, rather than of the positive real-to-complex implication.

#thm([Corollary 9.5.])[
  #emph[Under CH, the real counterexample $X$ constructed above satisfies $"dens" X = "dens" X^(*) = ℵ_1$. Its complexification is a counterexample over $bb(C)$ of norm density $ℵ_1$.]
] <twist:density>

#proof[
  Lemma 16 makes the finitely supported rational vectors a dense subset of $E$ of cardinality $ℵ_1$, while the coordinate vectors $e_alpha$, $alpha < omega_1$, are pairwise at distance at least one. Hence $"dens" E = ℵ_1$, and the isomorphism $E tilde.eq X^(*)$ from Lemma 27 gives $"dens" X^(*) = ℵ_1$.
  Choose a norm-dense set $D subset S_(X^(*))$ of cardinality $ℵ_1$, and, for each $f in D$, choose $x_f in S_X$ with $\| f \( x_f \) \| > 1 \/ 2$. The vectors $x_f$ have dense linear span: otherwise Hahn–Banach supplies $g in S_(X^(*))$ vanishing on their closed span, and choosing $f in D$ with $parallel f - g parallel < 1 \/ 2$ contradicts $\| f \( x_f \) \| > 1 \/ 2$. Rational linear combinations of these vectors give $"dens" X lt.eq ℵ_1$. The space $X$ cannot be separable, since it is infinite dimensional and would then be its own forbidden quotient. Thus $"dens" X = ℵ_1$.
  The complexification in Corollary 13 has underlying real space isomorphic to $X xor_oo X$, so it has the same density. That corollary also gives the absence of separable infinite-dimensional complex quotients. ◻
]

== 10 Set-theoretic models and consistency bounds <model:section>

The analytic implications concern Banach spaces inside a fixed model of set theory. We now verify that their hypotheses give the two required relative-consistency statements. Choice is retained throughout.

Real-valued measurability and its strict additivity convention are as defined in the introduction; this agrees with #cite(label("Caicedo2006")) Definition 1.1. Atomlessness is a separate property and is not part of that definition.

We use the following preservation theorem of Solovay #cite(label("Solovay1971")) Theorem 7, in the formulation recorded in #cite(label("Caicedo2006")) Fact 1.27.

#thm([Theorem 10.1.])[
  (Solovay).  #emph[If $kappa$ is real-valued measurable, then forcing with a measure algebra preserves its real-valued measurability. In particular, in the extension there is a $kappa$-additive probability measure on the full power set of $kappa$ in that extension, vanishing on singletons.]
] <model:solovay>

Here a measure algebra is the Boolean algebra of measurable sets modulo null sets of a probability space, with zero omitted when it is used as a forcing notion. The special case of Theorem 32 used below also has a direct proof in #cite(label("FuchinoGreenbergShelah2006")) Section 2, Lemmas 2.1–2.4. That construction measures every subset of $kappa$ in the extension, is countably additive, and makes unions of fewer than $kappa$ null sets null. These properties give the stated additivity: in a disjoint family of size less than $kappa$, only countably many members have positive measure, and the union of the remaining members is null.

#thm([Proposition 10.2.])[
  #emph[If ZFC with a measurable cardinal is consistent, then ZFC with a real-valued measurable continuum is consistent.]
] <model:positive>

#proof[
  Work in a ground model of ZFC with a measurable cardinal $kappa$. A $kappa$-complete nonprincipal ultrafilter on $kappa$ gives a ${ 0 \, 1 }$-valued probability measure witnessing its real-valued measurability.
  We first record the cardinal arithmetic needed to control the continuum. The cardinal $kappa$ is regular: sets of size less than $kappa$ are null, so a cofinal union of fewer than $kappa$ such sets cannot cover $kappa$. It is also a strong limit. Otherwise, for some $lambda < kappa$ there would be an injection $e : kappa arrow.r cal(P) \( lambda \)$. For each $xi < lambda$, the ultrafilter chooses one of the two sets on which the statement $xi in e \( alpha \)$ is constant. Their intersection belongs to the ultrafilter by $kappa$-completeness, although injectivity makes that intersection have at most one element. This is impossible. Every countable sequence of ordinals below $kappa$ is therefore bounded, and
  $ kappa^(ℵ_0) lt.eq sum_(lambda < kappa) lambda^(ℵ_0) lt.eq kappa . $
  Here $lambda^(ℵ_0) lt.eq 2^(max \( lambda \, ℵ_0 \)) < kappa$ for every $lambda < kappa$. The reverse inequality is immediate, so $kappa^(ℵ_0) = kappa$.
  Let $bb(B)_kappa$ be the measure algebra of the fair-bit product on $2^(kappa times bb(N))$. We use the probability space generated by finite-coordinate cylinders, or its completion; the quotient algebra is the same. Every element of this algebra has a representative determined by countably many coordinates. Such a representative is the inverse image of a Borel set in a countable product. Thus
  $ \| bb(B)_kappa \| lt.eq kappa^(ℵ_0) thin 2^(ℵ_0) = kappa $
  in the ground model. An antichain consists of disjoint nonzero elements modulo null sets and hence is countable: for each positive integer $n$, only finitely many of its elements can have measure greater than $1 \/ n$. Consequently the forcing has the countable chain condition and preserves cardinals #cite(label("Kunen1980")) Chapter VII, Theorem 5.10.
  The generic coordinate sequences give $kappa$ distinct reals. Indeed, for distinct $alpha \, beta < kappa$, the event that their coordinate sequences agree has product measure zero. For the reverse bound, every real has a name specified by countably many antichains deciding its bits. Each antichain is countable, so at most $\| bb(B)_kappa \|^(ℵ_0) lt.eq kappa$ such deciding-antichain descriptions suffice to name all reals #cite(label("Kunen1980")) Chapter VII, Definition 5.11 and Lemmas 5.12–5.13. Hence the extension satisfies $frak(c) = kappa$.
  Theorem 32 now gives the required measure on $cal(P) \( frak(c) \)$ in the extension. Set forcing preserves ZFC, including Choice #cite(label("Kunen1980")) Chapter VII, Theorem 4.2. The definable forcing relation and truth theorem #cite(label("Kunen1980")) Chapter VII, Theorems 3.5–3.6 give the asserted relative-consistency implication in their syntactic, or finite-fragment, interpretation #cite(label("Kunen1980")) Chapter VII, Sections 1 and 9: a finite contradiction proof in the extension theory would yield one in the ground theory. This requires no transitive set model of all ZFC. ◻
]

=== Completion of the relative-consistency argument <completion-of-the-relative-consistency-argument>

Let $upright("SQ")_(bb(R))$ and $upright("SQ")_(bb(C))$ denote the separable quotient assertions over the indicated scalar fields. Applying Theorem 10 and Proposition 11 to Proposition 33 yields, for each $bb(F) in { bb(R) \, bb(C) }$,

$ "Con" \( upright("ZFC") + upright("there is a measurable cardinal") \) med arrow.r.double med "Con" \( upright("ZFC") + upright("SQ")_(bb(F)) \) . $

On the other side, Gödel’s constructible-universe theorem #cite(label("Godel1938")), in the formulation of #cite(label("Kunen1980")) Chapter VI, Corollary 4.9, gives $"Con" \( upright("ZFC") \) arrow.r.double "Con" \( upright("ZFC") + upright("CH") \)$. Theorem 30, together with Corollary 13, therefore gives

$ "Con" \( upright("ZFC") \) med arrow.r.double med "Con" \( upright("ZFC") + not upright("SQ")_(bb(F)) \) #h(2em) \( bb(F) = bb(R) \, bb(C) \) . $

Under the measurable-cardinal consistency hypothesis both sides are consistent with ZFC. Therefore ZFC proves neither $upright("SQ")_(bb(F))$ nor its negation, for either scalar field.

=== 10.1 Independence at density $ℵ_1$ <independence-at-density-aleph_1>

For the restricted assertion, the positive consistency bound can be lowered using the earlier small-density theorem of Saxon and Sánchez Ruiz #cite(label("SaxonSanchezRuiz1996")): every infinite-dimensional real Banach space of norm density less than $frak(b)$ has a separable infinite-dimensional quotient; see #cite(label("Brech2025")) Theorem 2.1 for its statement and a proof sketch. We explain the set-theoretic hypothesis that makes this theorem apply at density $ℵ_1$.

The axiom $upright("MA")_(ℵ_1)$ states that, in any nonempty partial order with the countable chain condition, every collection of at most $ℵ_1$ dense sets is met by a filter. Full Martin’s axiom, denoted by $upright("MA")$, requires this conclusion for every collection of fewer than $frak(c)$ dense sets. The axiom $upright("MA")_(ℵ_1)$ implies $frak(b) > ℵ_1$. To see this, fix a family $cal(A) subset bb(N)^(bb(N))$ of cardinality at most $ℵ_1$. A condition is a pair $\( s \, A \)$, where $s$ is a finite sequence of natural numbers and $A$ is a finite subset of $cal(A)$. A stronger condition $\( t \, B \)$ extends $s$, contains $A$ in $B$, and satisfies $t \( n \) gt.eq f \( n \)$ for every $f in A$ and every new coordinate $n$ of $t$. Conditions with a fixed stem $s$ have common extensions for every finite subcollection: retain $s$ and take the union of their finite sets. There are only countably many stems, so the partial order is $sigma$-centered and in particular has the countable chain condition.

For each $f in cal(A)$, the conditions with $f in A$ form a dense set. For each $n$, the conditions whose stem has length at least $n$ also form a dense set, since finitely many functions can be dominated when a stem is extended. A filter meeting all these sets has a union of stems $g in bb(N)^(bb(N))$. Once a condition has included $f$ in its finite set, every common strengthening with a sufficiently long stem dominates $f$ on the new coordinates. Directedness of the filter therefore gives $f lt.eq^(*) g$. Thus $cal(A)$ is bounded, proving $frak(b) > ℵ_1$.

#proof[
  Starting with a ground model of ZFC and GCH, the forcing construction in #cite(label("Kunen1980")) Chapter VIII, Theorem 6.3 gives a model of Martin’s axiom with $frak(c) = ℵ_2$. Gödel’s constructible-universe theorem and the relative-consistency interpretation of forcing therefore give
  $ "Con" \( upright("ZFC") \) arrow.r.double "Con" \( upright("ZFC") + upright("MA") + frak(c) = ℵ_2 \) . $
  This model satisfies $upright("MA")_(ℵ_1)$, hence $frak(b) > ℵ_1$ by the preceding argument. The small-density theorem gives a separable infinite-dimensional quotient for every real Banach space of norm density $ℵ_1$. A complex Banach space has the same norm density as its underlying real space, so Proposition 11 gives the corresponding complex conclusion.
  On the other side, consistency of ZFC gives a CH model, and Corollary 31 supplies real and complex counterexamples of norm density $ℵ_1$ there. Consequently, for each field $bb(F) in { bb(R) \, bb(C) }$,
  $ "Con" \( upright("ZFC") \) arrow.r.double {"Con" \( upright("ZFC") + upright("SQ")_(bb(F))^(ℵ_1) \) \,\
"Con" \( upright("ZFC") + not upright("SQ")_(bb(F))^(ℵ_1) \) . $
  This proves the asserted independence with no large-cardinal consistency hypothesis. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
