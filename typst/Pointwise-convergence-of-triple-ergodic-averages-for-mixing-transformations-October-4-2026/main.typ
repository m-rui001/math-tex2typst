#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.2pt, y: 75.2pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Pointwise-convergence-of-triple-ergodic-averages-for-mixing-transformations-October-4-2026]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Multiple ergodic averages measure how several observations along one orbit interact. We consider the three observations at times $n \, 2 n \, 3 n$. Let $\( X \, cal(F) \, mu \)$ be a probability space and let $T : X arrow.r X$ be an invertible measure preserving transformation such that both $T$ and $T^(- 1)$ are measurable. For bounded measurable functions $f_1 \, f_2 \, f_3 : X arrow.r bb(C)$, put

#[#set math.equation(numbering: n => "(1.1)")
 $ A_N \( f_1 \, f_2 \, f_3 \) \( x \) = 1 / N sum_(n = 1)^N f_1 \( T^n x \) f_2 \( T^(2 n) x \) f_3 \( T^(3 n) x \) \, #h(2em) N gt.eq 1 . $ <eq:main-average>]

The transformation is #emph[mixing] if, for every $A \, B in cal(F)$,

#[#set math.equation(numbering: n => "(1.2)")
 $ mu \( A ∩ T^(- m) B \) arrow.r mu \( A \) mu \( B \) quad upright("as ") \| m \| arrow.r oo \, quad m in bb(Z) . $ <eq:mixing>]

#thm([Theorem 1.1.])[
  #emph[Let $\( X \, cal(F) \, mu \)$ be an arbitrary probability space and let $T : X arrow.r X$ be an invertible mixing probability preserving transformation with measurable inverse. For every triple of bounded measurable functions $f_1 \, f_2 \, f_3 : X arrow.r bb(C)$, 
$ A_N \( f_1 \, f_2 \, f_3 \) \( x \) arrow.r product_(j = 1)^3 integral_X f_j thin d mu quad upright("for ") mu upright("-almost every ") x $

 as $N arrow.r oo$ through all positive integers. The exceptional null set may depend on the triple of functions.]
] <thm:main>

The analytic input to the proof is the companion paper #emph[An $L^3$ bound for the trilinear Hilbert transform] by OpenAI #cite(label("H")), denoted below by H. We use its local-form construction and several estimates within its proof. The required estimates are stated at their points of use. We also use H’s uniform local bound for fixed compactly supported scalar $L^q$ inputs at one exponent $q in \( 2 \, 3 \)$ shared by its argument and ours. Section 7 justifies this common choice using the parameter order in H’s proof. The new work here is an extension that allows the inputs to vary with spatial depth. Theorem 11 states that extension, and Sections 4–7 prove it from the specified results of H.

Furstenberg’s ergodic proof of Szemerédi’s theorem placed arithmetic progressions of orbit times at the center of ergodic Ramsey theory #cite(label("Furstenberg1977")) Theorem 1.4. The convergence theory subsequently developed along two distinct lines. For norm convergence, Conze and Lesigne proved the three-function result under total ergodicity #cite(label("ConzeLesigne1987")), and Host and Kra removed that restriction #cite(label("HostKra2001")). Host and Kra then proved norm convergence for every finite number of functions using nilpotent characteristic factors #cite(label("HostKra2005")) Theorem 1.1; Ziegler gave an independent, later construction and an alternative proof #cite(label("Ziegler2007")). For weakly mixing transformations the product-valued norm limit was already classical. We include the van der Corput induction for that fact, specialized to the mixing hypothesis (1.2); see #cite(label("FKO1982")) Section 3 and #cite(label("Bergelson1987")) Section 3.

Pointwise convergence asks for control along almost every individual orbit. Bourgain proved the two-function theorem for two powers of one transformation #cite(label("Bourgain1990")). Higher-function pointwise results have been established under additional structure, including $K$ systems on Lebesgue probability spaces #cite(label("DerrienLesigne1996")) Theorem 4.2, a singular-spectrum condition on the Pinsker factor of a weakly mixing system #cite(label("Assani1998")), and weak mixing together with the PID property, which requires every pairwise-independent finite self-joining to be the product #cite(label("GHSY2018")). The last result includes finite-rank mixing transformations #cite(label("GHSY2018")). Ergodic measurable distal systems on Lebesgue probability spaces provide another class with pointwise convergence #cite(label("HSY2019")). The September 2026 account of Kosz, Mirek, Peluse, Wan, and Wright discusses the unrestricted three-function problem for the times $n \, 2 n \, 3 n$ #cite(label("KMPWW2026")) Section 1.8, item 5; their theorem treats polynomials of distinct degrees. Theorem 1 concerns the mixing class.

The harmonic-analysis setting has a related progression structure. In the four-linear form associated with the trilinear Hilbert transform, matched quadratic phases can persist because

$ sum_(j = 0)^3 kappa_j \( x + j t \)^a = 0 quad \( a = 0 \, 1 \, 2 \) \, #h(2em) \( kappa_0 \, kappa_1 \, kappa_2 \, kappa_3 \) = \( - 1 \, 3 \, - 3 \, 1 \) . $

The bilinear time-frequency theory of Lacey and Thiele #cite(label("LT1997")) #cite(label("LT1999")) is a predecessor. Tao connected cancellation for truncated multilinear Hilbert transforms with higher-order uniformity #cite(label("Tao2015")); Zorin-Kranich and Durcik, Kovač, and Thiele developed further cancellation estimates through simplex forms #cite(label("ZK2017")) #cite(label("DKT2019")). H uses the quantitative degree-two inverse theorem of Leng, Sah, and Sawhney #cite(label("LSS2024")) Theorem 1.2 in a construction that sums local four-term progression forms uniformly over their depths. Our argument extends that local construction to the inputs needed for oscillation.

=== 1.1 Proof strategy <proof-strategy>

By homogeneity, assume $\| f_j \| lt.eq 1$. For an averaging profile $phi$ (Definition 2), which is a compactly supported smooth real function of integral one, write $phi_a \( t \) = a^(- 1) phi \( t \/ a \)$ and consider the finite sums

$ V_k^phi \( x \) = sum_(n in bb(Z)) phi_(2^k) \( n \) product_(j = 1)^3 f_j \( T^(j n) x \) \, #h(2em) k gt.eq 0 . $

Proposition 3 proves that, for every integer $W gt.eq 1$, every list $0 lt.eq k_1 < dots.h.c < k_(W + 1)$ fixed independently of $x$ satisfies

#[#set math.equation(numbering: n => "(1.3)")
 $ sum_(i = 1)^W integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| V_ell^phi - V_(k_i)^phi \| thin d mu lt.eq C_phi sqrt(W) . $ <eq:intro-oscillation>]

If the averages were not Cauchy on a set of positive measure, fixed endpoints could be chosen so that every block contributes a uniformly positive integral oscillation. The left side would then grow proportionally to $W$, contradicting (1.3). This is the quantitative oscillation method of Bourgain #cite(label("Bourgain1989")) Section 2C, also used for bilinear singular integrals by Demeter #cite(label("Demeter2007")). For each fixed profile, it gives almost-everywhere convergence of $V_k^phi$ as $k arrow.r oo$ on every invertible probability preserving system. Under (1.2), the norm argument and summation by parts for smooth weights identify this limit as $p = product_j integral_X f_j thin d mu$, independently of the profile. Signed $L^1$ approximations to interval weights and finite rational grids then recover all positive integer lengths in (1.1).

The pointwise maximum creates the new analytic requirement. At each point $x$, choose $ell_i \( x \) in { k_i \, dots.h \, k_(i + 1) }$ attaining the $i$th maximum. The identity

$ V_(ell_i \( x \))^phi \( x \) - V_(k_i)^phi \( x \) = sum_(k = k_i)^(ell_i \( x \) - 1) #scale(x: 120%, y: 120%)[\(] V_(k + 1)^phi \( x \) - V_k^phi \( x \) #scale(x: 120%, y: 120%)[\)] = : d_i \( x \) $

shows that the selected difference is a sum over a prefix of the scale block. Choose $\| alpha_i \( x \) \| lt.eq 1$ with $alpha_i \( x \) d_i \( x \) = \| d_i \( x \) \|$. The normalized test at scale $k$ is

$ frac(alpha_i \( x \), 4 sqrt(W)) thin upright(bold(1))_({ k_i lt.eq k < ell_i \( x \) }) . $

Its supremum plus internal total variation on the block is at most $1 \/ \( 2 sqrt(W) \)$, since its size is at most $1 \/ \( 4 sqrt(W) \)$ and it has at most one jump. In the real-variable model, H’s local forms integrate $product_(j = 0)^3 z_j \( y + j t \)$ against smooth kernels supported where all four coordinates lie inside one dyadic interval. In the application only the zeroth input varies with depth; the other three inputs use the same functions at every depth. Theorem 11 gives a local bound independent of the depth range and $W$, provided the varying input has supremum plus variation at most $W^(- 1 \/ 2)$ on each of its $W$ fixed blocks. Reversal from increasing scale order to spatial depth preserves this quantity. Section 3 realizes the scale differences by normalized translation averaging of local kernels, then passes through integer sequences to finite orbit segments. Multiplying the normalized test back by $4 sqrt(W)$ gives (1.3).

Section 4 supplies the operator step. The structured operators $A_nu$ arising in H, called rows, have a common $L^2$ domain and obey the Bessel bound

$ sum_nu parallel A_nu f parallel^2 lt.eq B^2 parallel f parallel_2^2 #h(2em) upright("for every ") f in L^2 \, $

with the same input in every term. Lemma 17 bounds the $L^1$ norm of the pointwise maximum of tested adjoint partial sums in terms of the tests’ $ell^2$ size and the Bessel bound, with logarithmic dependence on the column budget and no dependence on the number of depths. The tested adjoints are, on each relevant cell, combinations with spatially constant coefficients of column functions retained on descendant cells. Their distinct orthogonal auxiliary coordinates control the coefficient vectors, and refinement of the spatial cells lets the stopping argument assign each row to one group on its entire support. When each round reads one depth and those depths are nondecreasing, pointwise summation by parts pairs the partial sums with the input’s size and internal variation on each block. The $L^1$ estimate and Cauchy–Schwarz over blocks use the $W^(- 1 \/ 2)$ normalization to remove dependence on $W$, yielding Lemma 18. Lemma 20 treats the smooth rows. Sections 5–7 insert these estimates at the specified steps of H that compare inputs at different depths and complete the local estimate.

== 2 Smooth orbit averages and the pointwise theorem <sec:ergodic>

This section deduces Theorem 1 from a finite oscillation estimate for smooth orbit averages. The oscillation estimate forces almost everywhere convergence on every invertible probability preserving system. The mixing hypothesis (1.2) identifies the limit, and signed approximations then recover all positive integer averaging lengths.

We use the notion of an invertible probability preserving system fixed in the introduction. Every integer power of $T$ is measurable and measure preserving: positive powers follow by iteration, and applying invariance to the measurable set $T A$ gives $mu \( T A \) = mu \( A \)$.

#prodef([Definition 2.1.])[
  (Averaging profiles).  An averaging profile is a real function $phi in C_c^oo \( bb(R) \; bb(R) \)$ such that, for some $G gt.eq 1$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ parallel phi^(\( n \)) parallel_oo lt.eq #scale(x: 120%, y: 120%)[\(] G \( n + 2 \) #scale(x: 120%, y: 120%)[\)]^(G \( n + 2 \)) #h(2em) \( n = 0 \, 1 \, 2 \, dots.h \) \, $ <eq:profile-derivatives>]
  and
  #[#set math.equation(numbering: n => "(2.2)")
   $ integral_(bb(R)) phi \( t \) thin d t = 1 \, #h(2em) integral_(bb(R)) t^j phi \( t \) thin d t = 0 quad \( 1 lt.eq j lt.eq 3 \) . $ <eq:profile-moments>]
  The function may have either sign. For $a > 0$, write $phi_a \( t \) = a^(- 1) phi \( t \/ a \)$.
] <def:averaging-profile>

Section 3 uses the moment and derivative conditions to construct local kernels for adjacent smooth scale differences. Lemma 9 shows that these restrictions still permit signed profiles arbitrarily close in $L^1$ to $h_c \( t \) = c^(- 1) upright(bold(1))_(\( 0 \, c \]) \( t \)$ for every $c in \[ 1 \, 2 \]$.

#thm([Proposition 2.2.])[
  (Finite oscillation of smooth orbit averages).  #emph[For every averaging profile $phi$, there is a constant $C_phi < oo$ with the following property. On every invertible probability preserving system, let $f_1 \, f_2 \, f_3 : X arrow.r bb(C)$ be measurable with $\| f_j \( x \) \| lt.eq 1$ for all $x$, and define 
$ V_k^phi \( x \) = sum_(n in bb(Z)) phi_(2^k) \( n \) product_(j = 1)^3 f_j \( T^(j n) x \) \, #h(2em) k = 0 \, 1 \, 2 \, dots.h . $

 For every integer $w gt.eq 1$ and every deterministic list of integers $0 lt.eq k_1 < dots.h.c < k_(w + 1)$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| V_ell^phi - V_(k_i)^phi \| thin d mu lt.eq C_phi sqrt(w) . $ <eq:orbit-oscillation>]

 The constant is independent of the system, the inputs, $w$, and the endpoints.]
] <prop:orbit-oscillation>

Section 3 proves Proposition 3 from Theorem 11, which the later analytic sections prove. The sums defining $V_k^phi$ are finite. If $"supp" phi subset.eq \[ - B \, B \]$ with $B gt.eq 1$, then

#[#set math.equation(numbering: n => "(2.4)")
 $ \| V_k^phi \( x \) \| lt.eq 2^(- k) \( 2 B 2^k + 1 \) parallel phi parallel_oo lt.eq \( 2 B + 1 \) parallel phi parallel_oo . $ <eq:smooth-uniform-bound>]

Thus the averages and all the finite maxima in (2.3) are measurable and uniformly bounded.

The next criterion is the finite-block oscillation argument used by Bourgain and Demeter #cite(label("Bourgain1989")) #cite(label("Demeter2007")).

#thm([Lemma 2.3.])[
  (Oscillation forces almost everywhere convergence).  #emph[Let $\( X \, cal(F) \, mu \)$ be any probability space and let $Z_k : X arrow.r bb(C)$, $k gt.eq 0$, be measurable. Suppose that $\| Z_k \( x \) \| lt.eq M < oo$ for every $k \, x$, and that there is $C < oo$ such that, for every integer $w gt.eq 1$ and every deterministic list $0 lt.eq k_1 < dots.h.c < k_(w + 1)$, 
$ sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| Z_ell - Z_(k_i) \| thin d mu lt.eq C sqrt(w) . $

 Then $Z_k \( x \)$ converges in $bb(C)$ on a measurable conull set.]
] <lem:ergodic-cauchy>

#proof[
  Define
  $ omega \( x \) = lim_(K arrow.r oo) sup_(p \, q gt.eq K) \| Z_p \( x \) - Z_q \( x \) \| . $
  The suprema are countable and decrease with $K$, so $omega$ is measurable. Completeness of $bb(C)$ says that the convergence set is exactly ${ omega = 0 }$. If its complement has positive measure, then, since ${ omega > 0 } = union.big_(h gt.eq 1) { omega > 2 \/ h }$, there are $delta > 0$ and a measurable set $E = { omega > 2 delta }$ of measure $d > 0$. For every $K gt.eq 0$ and $x in E$,
  $ sup_(ell gt.eq K) \| Z_ell \( x \) - Z_K \( x \) \| gt.eq 1 / 2 sup_(p \, q gt.eq K) \| Z_p \( x \) - Z_q \( x \) \| gt.eq 1 / 2 omega \( x \) > delta . $
  The integral of the first supremum is at least $delta d$. For $L gt.eq K$, the measurable finite maxima
  $ M_(K \, L) \( x \) = max_(K lt.eq ell lt.eq L) \| Z_ell \( x \) - Z_K \( x \) \| $
  increase to this supremum. By monotone convergence there is a deterministic $L > K$ with $integral_X M_(K \, L) thin d mu gt.eq delta d \/ 2$. Starting with $k_1 = 0$, choose $k_(i + 1) > k_i$ successively with this property. The assumed estimate gives $w delta d \/ 2 lt.eq C sqrt(w)$ for every $w$, a contradiction for large $w$. Hence $omega = 0$ almost everywhere. ◻
]

Proposition 3 and Lemma 4 already give an almost everywhere limit for each fixed averaging profile. We now identify it for mixing systems.

=== 2.1 The product limit in norm <the-product-limit-in-norm>

Suppose for this subsection that $T$ satisfies the mixing condition (1.2). For every fixed bounded measurable $g \, h : X arrow.r bb(C)$, this implies

#[#set math.equation(numbering: n => "(2.5)")
 $ integral_X g \( x \) h \( T^m x \) thin d mu \( x \) arrow.r (integral_X g thin d mu) (integral_X h thin d mu) #h(2em) \( \| m \| arrow.r oo \) . $ <eq:ergodic-function-mixing>]

For finite complex simple functions this is the finite expansion into the set correlations in (1.2). Every bounded complex measurable function has uniform simple-function approximations, obtained by partitioning its bounded range into finitely many small sets. If $g_0 \, h_0$ are such approximations, the correlation error is at most

$ parallel g - g_0 parallel_oo parallel h parallel_oo + parallel g_0 parallel_oo parallel h - h_0 parallel_oo $

uniformly in $m$, and the product of integrals has the same continuity property. Taking the mixing limit for fixed approximations and then letting their errors tend to zero proves (2.5).

We include the classical van der Corput induction for multiple averages, specialized to mixing; see #cite(label("FKO1982")) Section 3 and #cite(label("Bergelson1987")) Section 3. The finite Hilbert space van der Corput inequality used below is the one recorded in #cite(label("HostKra2005")) Lemma D.1; the criterion follows by taking limits.

#thm([Lemma 2.4.])[
  (Hilbert space van der Corput criterion).  #emph[Let $cal(H)$ be a complex Hilbert space, with inner product linear in the first variable. Let $u_n in cal(H)$, $n gt.eq 1$, satisfy $parallel u_n parallel lt.eq M < oo$. Suppose that, for each fixed integer $h gt.eq 1$, 
$ gamma_h = lim_(N arrow.r oo) 1 / N sum_(n = 1)^(N - h) chevron.l u_(n + h) \, u_n chevron.r $

 exists, with a sum over an empty range interpreted as zero. If $gamma_h arrow.r 0$ as $h arrow.r oo$, then $parallel N^(- 1) sum_(n = 1)^N u_n parallel arrow.r 0$.]
] <lem:ergodic-vdc>

#proof[
  For fixed integers $N \, H gt.eq 1$, extend $u_n$ by zero outside ${ 1 \, dots.h \, N }$. The identity
  $ H sum_(n = 1)^N u_n = sum_(m = 1)^(N + H - 1) sum_(j = 0)^(H - 1) u_(m - j) $
  and Cauchy’s inequality give
  #[#set math.equation(numbering: n => "(2.6)")
   $ ∥1 / N sum_(n = 1)^N u_n∥^2 lt.eq frac(N + H - 1, N^2 H^2) #scale(x: 240%, y: 240%)[\[] & H sum_(n = 1)^N parallel u_n parallel^2\
 & + 2 sum_(h = 1)^(H - 1) \( H - h \) "Re" sum_(n = 1)^(N - h) chevron.l u_(n + h) \, u_n chevron.r #scale(x: 240%, y: 240%)[\]] . $ <eq:ergodic-finite-vdc>]
  Indeed, after Cauchy’s inequality the expression to expand is $\( N + H - 1 \) sum_m parallel sum_(j = 0)^(H - 1) u_(m - j) parallel^2$. Each diagonal term occurs $H$ times, and each pair of positions at difference $h$ occurs $H - h$ times, giving the displayed bracket.
  Fix $H$ and let $N arrow.r oo$ in (2.6). Then
  $ limsup_(N arrow.r oo) ∥1 / N sum_(n = 1)^N u_n∥^2 & lt.eq M^2 / H + 2 / H^2 sum_(h = 1)^(H - 1) \( H - h \) "Re" gamma_h\
 & lt.eq M^2 / H + 2 / H sum_(h = 1)^(H - 1) \| gamma_h \| . $
  The right side tends to zero as $H arrow.r oo$, because $\| gamma_h \| arrow.r 0$ implies convergence of its Cesàro means to zero. ◻
]

#thm([Lemma 2.5.])[
  (Cesàro norm convergence at distinct slopes).  #emph[On every invertible probability preserving system satisfying (1.2), for every integer $r gt.eq 1$, every list of pairwise distinct nonzero integers $lambda_1 \, dots.h \, lambda_r$, and every list of bounded measurable $f_1 \, dots.h \, f_r : X arrow.r bb(C)$, 
$ ∥1 / N sum_(n = 1)^N product_(j = 1)^r f_j \( T^(lambda_j n) thin dot.op \) - product_(j = 1)^r integral_X f_j thin d mu∥_(L^2 \( mu \)) arrow.r 0 #h(2em) \( N arrow.r oo \) . $

]
] <lem:ergodic-cesaro>

#proof[
  Write $U^m f = f compose T^m$, a unitary operator on $L^2 \( mu \; bb(C) \)$. Use the inner product $chevron.l f \, g chevron.r = integral_X f overline(g) thin d mu$. We induct on $r$, taking the empty product to be $1$, so the assertion for $r = 0$ is immediate. Suppose it is known for $r - 1$. First assume that at least one $f_j$ has integral zero. Put
  $ u_n = product_(j = 1)^r U^(lambda_j n) f_j \, #h(2em) g_(j \, h) = \( U^(lambda_j h) f_j \) overline(f_j) \, #h(2em) n \, h gt.eq 1 . $
  The vectors $u_n$ are uniformly bounded in $L^2$. Invariance gives
  $ chevron.l u_(n + h) \, u_n chevron.r & = integral_X product_(j = 1)^r U^(lambda_j n) g_(j \, h) thin d mu\
 & = integral_X g_(1 \, h) product_(j = 2)^r U^(\( lambda_j - lambda_1 \) n) g_(j \, h) thin d mu . $
  The second equality shifts all times by $- lambda_1 n$. For fixed $h$, the remaining slopes $lambda_j - lambda_1$, $2 lt.eq j lt.eq r$, are pairwise distinct and nonzero, and the functions $g_(j \, h)$ are fixed and bounded. Induction therefore gives
  $ frac(1, N - h) sum_(n = 1)^(N - h) product_(j = 2)^r U^(\( lambda_j - lambda_1 \) n) g_(j \, h) arrow.r product_(j = 2)^r integral_X g_(j \, h) thin d mu quad upright("in ") L^2 \( mu \) \, #h(2em) N arrow.r oo \, med N > h . $
  For $r = 1$ both products are $1$, so this assertion is immediate. The functional $A mapsto integral_X g_(1 \, h) A thin d mu$ is continuous on $L^2$ by Cauchy’s inequality. Hence, using $\( N - h \) \/ N arrow.r 1$,
  $ lim_(N arrow.r oo) 1 / N sum_(n = 1)^(N - h) chevron.l u_(n + h) \, u_n chevron.r = product_(j = 1)^r c_j \( h \) \, #h(2em) c_j \( h \) = integral_X \( U^(lambda_j h) f_j \) overline(f_j) thin d mu . $
  By (2.5) and $lambda_j eq.not 0$,
  $ c_j \( h \) arrow.r lr(|integral_X f_j thin d mu|)^2 #h(2em) \( h arrow.r oo \) . $
  The factors are bounded by $parallel f_j parallel_oo^2$, and at least one limit is zero. Their product tends to zero, so Lemma 5 gives $parallel N^(- 1) sum_(n = 1)^N u_n parallel_2 arrow.r 0$.
  For a general list, let $m_j = integral_X f_j thin d mu$. The identity
  $ product_(j = 1)^r U^(lambda_j n) f_j - product_(j = 1)^r m_j = sum_(i = 1)^r (product_(j < i) U^(lambda_j n) f_j) U^(lambda_i n) \( f_i - m_i \) (product_(j > i) m_j) $
  expresses the difference as a finite sum of products with a centered factor. Regard the later constants as constant functions at their corresponding slopes. The centered case just proved applies to every summand and completes the induction.
  For each fixed $h$, induction was used only for the fixed functions $g_(j \, h)$. The van der Corput argument fixes its finite lag range $H$ before sending $N$ to infinity, and sends $H$ to infinity afterwards. No convergence rate uniform in $h$ is needed. ◻
]

#thm([Lemma 2.6.])[
  (Norm convergence with smooth weights).  #emph[On every invertible probability preserving system satisfying (1.2), fix an integer $r gt.eq 1$, pairwise distinct nonzero integers $lambda_1 \, dots.h \, lambda_r$, and bounded measurable $f_1 \, dots.h \, f_r : X arrow.r bb(C)$. Set 
$ F_n = product_(j = 1)^r f_j \( T^(lambda_j n) thin dot.op \) \, #h(2em) p = product_(j = 1)^r integral_X f_j thin d mu \, #h(2em) n in bb(Z) . $

 For every $phi in C_c^1 \( bb(R) \; bb(C) \)$ with $integral_(bb(R)) phi = 1$, 
$ ∥sum_(n in bb(Z)) a^(- 1) phi \( n \/ a \) F_n - p∥_2 arrow.r 0 #h(2em) \( a arrow.r oo \, med a gt.eq 1 \) . $

 In particular the conclusion holds for every averaging profile.]
] <lem:ergodic-smooth-norm>

#proof[
  Apply Lemma 6 to the slopes $lambda_j$ and then to the slopes $- lambda_j$. For the $L^2$ vectors
  $ R_N^plus.minus = sum_(n = 1)^N \( F_(plus.minus n) - p \) $
  this gives $parallel R_N^plus.minus parallel_2 \/ N arrow.r 0$ for both signs. Choose $B gt.eq 1$ with $"supp" phi subset.eq \[ - B \, B \]$. For $a gt.eq 1$, put $M_a = floor.l B a floor.r + 1$ and $w_n^plus.minus = a^(- 1) phi \( plus.minus n \/ a \)$, so $w_(M_a)^plus.minus = 0$. Vector-valued summation by parts gives
  $ sum_(n = 1)^(M_a) w_n^plus.minus \( F_(plus.minus n) - p \) = sum_(n = 1)^(M_a - 1) \( w_n^plus.minus - w_(n + 1)^plus.minus \) R_n^plus.minus . $
  Since $\| w_n^plus.minus - w_(n + 1)^plus.minus \| lt.eq a^(- 2) parallel phi' parallel_oo$, the norm of this sum is at most
  $ frac(parallel phi' parallel_oo, a^2) sum_(n = 1)^(M_a - 1) parallel R_n^plus.minus parallel_2 . $
  For any $epsilon.alt > 0$, choose $N_0$ with $parallel R_n^plus.minus parallel_2 lt.eq epsilon.alt n$ for both signs and every $n gt.eq N_0$. As $M_a \/ a lt.eq B + 1$,
  $ 1 / a^2 sum_(n = 1)^(M_a - 1) parallel R_n^plus.minus parallel_2 lt.eq 1 / a^2 sum_(n = 1)^(N_0 - 1) parallel R_n^plus.minus parallel_2 + epsilon.alt / a^2 sum_(n = 1)^(M_a - 1) n lt.eq o \( 1 \) + epsilon.alt / 2 \( B + 1 \)^2 . $
  Letting $a arrow.r oo$ and then $epsilon.alt arrow.b 0$ proves convergence to zero for the positive-time and negative-time parts of the weighted sum of $F_n - p$. The term at $n = 0$ has norm at most $a^(- 1) \| phi \( 0 \) \| parallel F_0 - p parallel_2$, which also tends to zero. Finally the Riemann sums $S_a = a^(- 1) sum_n phi \( n \/ a \)$ tend to $integral phi = 1$, and
  $ sum_n a^(- 1) phi \( n \/ a \) F_n - p = sum_n a^(- 1) phi \( n \/ a \) \( F_n - p \) + p \( S_a - 1 \) . $
  This proves the assertion for signed and complex weights alike. ◻
]

=== 2.2 Moment approximation and all lengths <moment-approximation-and-all-lengths>

We need averaging profiles arbitrarily close in $L^1$ to normalized interval indicators. We first fix the smooth bump used in their construction and later in the local kernels.

#thm([Lemma 2.7.])[
  (A compact Gevrey bump).  #emph[There is a real nonnegative $rho in C_c^oo \( bb(R) \)$, supported in $\[ - 1 \, 1 \]$, with integral $1$, whose derivatives obey a bound of the form (2.1) for some constant $G gt.eq 1$.]
] <lem:ergodic-bump>

#proof[
  Start with
  $ rho_0 \( x \) = cases(delim: "{", e^(- 1 \/ \( 1 - x^2 \)) \, & \| x \| < 1 \,, 0 \, & \| x \| gt.eq 1 .) $
  For $\| x \| < 1$, put $d = 1 - x^2$. If $\| z - x \| lt.eq c d$ in the complex plane, with a sufficiently small fixed $c > 0$, then $1 - z^2 = d \( 1 - theta \)$ with $\| theta \| lt.eq 1 \/ 4$. Consequently $"Re" \( 1 \/ \( 1 - z^2 \) \) gt.eq c' \/ d$ for a fixed $c' > 0$. Cauchy’s estimate gives
  $ \| rho_0^(\( n \)) \( x \) \| lt.eq n ! \( c d \)^(- n) e^(- c' \/ d) . $
  For every fixed $n$, the right side tends to zero as $x$ approaches either endpoint, so the derivatives extend there by zero and the extension is smooth. Maximizing $d^(- n) e^(- c' \/ d)$ for $0 < d lt.eq 1$ and using $n ! lt.eq \( n + 1 \)^n$ gives a bound of the form (2.1). Divide by the positive integral of $rho_0$ to obtain $rho$. ◻
]

#thm([Lemma 2.8.])[
  (Approximation with three vanishing moments).  #emph[For every $c in \[ 1 \, 2 \]$ and every $epsilon.alt > 0$, there is an averaging profile $phi$ with 
$ parallel phi - h_c parallel_(L^1 \( bb(R) \)) < epsilon.alt \, #h(2em) h_c \( t \) = c^(- 1) upright(bold(1))_(\( 0 \, c \]) \( t \) . $

 The support and derivative constant may depend on $c \, epsilon.alt$.]
] <lem:ergodic-moments>

#proof[
  Use the bump $rho$ from Lemma 8. For $delta > 0$, set $rho_delta \( t \) = delta^(- 1) rho \( t \/ delta \)$ and $psi = h_c * rho_delta$. It is real, compactly supported, smooth, and has mass $1$. Its derivatives satisfy
  $ parallel psi^(\( n \)) parallel_oo lt.eq parallel h_c parallel_1 parallel rho_delta^(\( n \)) parallel_oo = delta^(- n - 1) parallel rho^(\( n \)) parallel_oo \, $
  which has the form (2.1) for fixed $delta$. Moreover,
  $ parallel psi - h_c parallel_1 lt.eq integral rho_delta \( s \) parallel h_c \( thin dot.op - s \) - h_c parallel_1 thin d s lt.eq frac(2 delta, c) integral \| v \| rho \( v \) thin d v \, $
  because $parallel h_c \( thin dot.op - s \) - h_c parallel_1 = 2 min \( \| s \| \, c \) \/ c$. Choose $delta$ to make this error less than $epsilon.alt \/ 2$, fix $psi$, and let $m_j = integral t^j psi \( t \) thin d t$, $1 lt.eq j lt.eq 3$.
  We correct these moments with broad translated bumps: their $j$th moments will be $D^j$ times fixed numbers, allowing a linear system with a fixed coefficient matrix to cancel the three moments with total coefficient size tending to zero as $D arrow.r oo$. Fix distinct real numbers $z_0 \, z_1 \, z_2 \, z_3$, and for $D gt.eq 1$ put
  $ rho_(i \, D) \( t \) = D^(- 1) rho \( t \/ D - z_i \) \, #h(2em) P_j \( z \) = integral \( z + v \)^j rho \( v \) thin d v \, #h(2em) 0 lt.eq i \, j lt.eq 3 . $
  Then $integral t^j rho_(i \, D) \( t \) thin d t = D^j P_j \( z_i \)$. Each $P_j$ is monic of degree $j$. The matrix $sans(M) = \( P_j \( z_i \) \)_(j \, i = 0)^3$ is therefore the Vandermonde matrix $\( z_i^j \)_(j \, i)$ multiplied on the left by a lower triangular matrix with diagonal entries $1$. Its determinant is $product_(i < i') \( z_(i') - z_i \) eq.not 0$. Choose the real vector $beta = \( beta_0 \, dots.h \, beta_3 \)$ satisfying
  $ sans(M) beta = \( 0 \, - m_1 \/ D \, - m_2 \/ D^2 \, - m_3 \/ D^3 \)^(sans(T)) . $
  The inverse matrix is fixed, so
  $ sum_i \| beta_i \| lt.eq parallel sans(M)^(- 1) parallel_(ell^1 arrow.r ell^1) (frac(\| m_1 \|, D) + frac(\| m_2 \|, D^2) + frac(\| m_3 \|, D^3)) lt.eq C_psi / D . $
  Thus $phi = psi + sum_i beta_i rho_(i \, D)$ has mass $1$ and its first three moments vanish exactly. The extra $L^1$ error is at most $parallel rho parallel_1 sum_i \| beta_i \| lt.eq C_psi \/ D$, which is less than $epsilon.alt \/ 2$ for large $D$. Each $rho_(i \, D)$ is a fixed translate and dilation of $rho$, with $parallel rho_(i \, D)^(\( n \)) parallel_oo = D^(- n - 1) parallel rho^(\( n \)) parallel_oo$. Multiplication by the fixed coefficients and finite addition preserve the derivative class, so the resulting sum satisfies (2.1) with a constant depending on the choices. It is compactly supported and real, with signs allowed, so it is an averaging profile. ◻
]

#proof[
  First suppose $\| f_j \| lt.eq 1$, and write
  $ F_n \( x \) = product_(j = 1)^3 f_j \( T^(j n) x \) \, #h(2em) p = product_(j = 1)^3 integral_X f_j thin d mu \, #h(2em) A_N \( x \) = 1 / N sum_(n = 1)^N F_n \( x \) . $
  For each fixed averaging profile $phi$, Proposition 3, (2.4), and Lemma 4 give a measurable conull set $E_phi$ on which $V_k^phi$ has a limit $V_oo^phi$. Extend that limit by zero off $E_phi$; it is measurable. The mixing hypothesis and Lemma 7, with slopes $1 \, 2 \, 3$ and $a = 2^k$, give $parallel V_k^phi - p parallel_2 arrow.r 0$. Fatou’s lemma on the convergence set then yields
  $ integral_(E_phi) \| V_oo^phi - p \|^2 thin d mu lt.eq liminf_(k arrow.r oo) parallel V_k^phi - p parallel_2^2 = 0 \, $
  so $V_k^phi arrow.r p$ on a measurable conull set for each fixed profile.
  For $c in \[ 1 \, 2 \]$, $a = 2^k$, and $N_k = floor.l c a floor.r$, the indicator convention in $h_c$ gives
  $ sum_(n in bb(Z)) a^(- 1) h_c \( n \/ a \) F_n \( x \) = frac(1, c a) sum_(n = 1)^(N_k) F_n \( x \) = frac(N_k, c a) A_(N_k) \( x \) . $
  Since $\| A_N \| lt.eq 1$ and $0 lt.eq c a - N_k < 1$, for every averaging profile $phi$ and every $x$,
  #[#set math.equation(numbering: n => "(2.7)")
   $ \| A_(N_k) \( x \) - V_k^phi \( x \) \| lt.eq frac(1, c 2^k) + 2^(- k) sum_(n in bb(Z)) \| h_c \( n \/ 2^k \) - phi \( n \/ 2^k \) \| . $ <eq:ergodic-approximation>]
  The function $\| h_c - phi \|$ is bounded and compactly supported, with possible discontinuities only at $0 \, c$. It is Riemann integrable, and the sum on the right, including its factor $2^(- k)$, tends to $parallel h_c - phi parallel_1$.
  For each rational $c in \[ 1 \, 2 \]$ and integer $h gt.eq 1$, choose once an averaging profile $phi_(c \, h)$ with $parallel h_c - phi_(c \, h) parallel_1 < 2^(- h)$, using Lemma 9. Intersect their measurable conull convergence sets over this countable family, and call the resulting measurable conull set $E$. For $x in E$, every such $c$, and every $h$, (2.7) gives
  $ limsup_(k arrow.r oo) \| A_(floor.l c 2^k floor.r) \( x \) - p \| lt.eq parallel h_c - phi_(c \, h) parallel_1 < 2^(- h) . $
  Letting $h arrow.r oo$, we obtain
  #[#set math.equation(numbering: n => "(2.8)")
   $ A_(floor.l c 2^k floor.r) \( x \) arrow.r p quad upright("for every ") x in E upright(" and every rational ") c in \[ 1 \, 2 \] . $ <eq:ergodic-rational-lengths>]
  Fix an integer $s gt.eq 1$ and the rational grid $c_i = 1 + i \/ s$, $0 lt.eq i lt.eq s$. For $2^k lt.eq N < 2^(k + 1)$, choose the largest $i$ for which $n = floor.l c_i 2^k floor.r lt.eq N$. Then $i < s$, $n gt.eq 2^k$, and
  $ 0 lt.eq N - n < floor.l c_(i + 1) 2^k floor.r - floor.l c_i 2^k floor.r lt.eq 2^k \/ s + 1 . $
  For any $1 lt.eq n lt.eq N$, boundedness of the summands gives
  $ \| A_N - A_n \| lt.eq (1 / n - 1 / N) n + frac(N - n, N) = frac(2 \( N - n \), N) . $
  For the selected $n$, this is at most $2 \/ s + 2 \/ 2^k$. On $E$, the maximum of $\| A_(floor.l c_i 2^k floor.r) \( x \) - p \|$ over the finite grid tends to zero by (2.8). Consequently
  $ limsup_(N arrow.r oo) \| A_N \( x \) - p \| lt.eq 2 \/ s #h(2em) \( x in E \) . $
  This holds for every $s gt.eq 1$, so the limsup is zero.
  For general bounded measurable complex inputs, choose finite $M_j gt.eq max \( 1 \, sup_x \| f_j \( x \) \| \)$, apply the result to $f_j \/ M_j$, and multiply by $M_1 M_2 M_3$. The conull set may depend on the original triple. Every exceptional set used in the proof is measurable and every intersection is countable, so the proof requires no completeness or standardness assumption on the probability space. ◻
]

== 3 Local forms and the orbit oscillation estimate <sec:transfer>

We prove Proposition 3 from the local estimate for inputs depending on spatial depth. The proof constructs admissible kernels for the difference of two smooth scales, averages over translations of one dyadic lattice, and then transfers the resulting estimate first to integer sequences and then to finite orbit segments.

=== 3.1 Admissible local forms <admissible-local-forms>

Dyadic lattice intervals are taken half-open. If $J$ is a lattice interval and $I subset.eq J$ is a descendant, its depth in $J$ is $s \( I \) = log_2 \( \| J \| \/ \| I \| \)$. A finite rooted tree contains every ancestor between each of its intervals and its root.

The kernel class is the one used in #cite(label("H")) Section 2.

#prodef([Definition 3.1.])[
  (Admissible local kernels).  Fix $c_0 > 0$ and $C_0 gt.eq 1$. For an interval $I$ of length $r = \| I \|$, a kernel $w_I in C_c^oo \( bb(R)^2 \; bb(C) \)$ is admissible if the following hold.
  + For every $\( x \, t \) in "supp" w_I$ and $j in { 0 \, 1 \, 2 \, 3 }$, $x + j t in I$ and $"dist" \( x + j t \, partial I \) gt.eq c_0 r$.
  + For every $v in bb(R)$ and $j = 0 \, 1 \, 2 \, 3$,
    $ integral_(bb(R)) w_I \( v - j t \, t \) thin d t = 0 . $
  + For all nonnegative integers $p \, q$, with $n = p + q$,
    $ parallel partial_x^p partial_t^q w_I parallel_oo lt.eq r^(- n) #scale(x: 120%, y: 120%)[\(] C_0 \( n + 2 \) #scale(x: 120%, y: 120%)[\)]^(C_0 \( n + 2 \)) . $
  For measurable scalar functions $z_j : bb(R) arrow.r bb(C)$, define the associated local form, whenever its integral is finite, by
  $ H_I \( z_0 \, z_1 \, z_2 \, z_3 \) = r^(- 2) integral_(bb(R)^2) w_I \( x \, t \) product_(j = 0)^3 z_j \( x + j t \) thin d x thin d t . $
  For a Hilbert-valued argument with a distinguished physical scalar coordinate, the form uses that coordinate. We write $parallel z parallel_(p \, I) = \( \| I \|^(- 1) integral_I parallel z parallel^p \)^(1 \/ p)$ for the normalized interval norm, with the usual essential supremum when $p = oo$. Norms without an interval subscript use ordinary Lebesgue measure.
] <def:transfer-local-kernels>

For a nonempty consecutive integer block $B = { a \, dots.h \, b }$ and a sequence of complex functions $h_s$ on any common domain, write

$ cal(V)_B \( h \) \( y \) = max_(s in B) \| h_s \( y \) \| + sum_(s = a)^(b - 1) \| h_(s + 1) \( y \) - h_s \( y \) \| . $

The sum is zero for a singleton block.

#thm([Theorem 3.2.])[
  (Local estimate with variation in depth).  #emph[Fix the admissibility parameters $c_0 \, C_0$. Let $J$ be an interval in any dyadic lattice, let $cal(T)$ be a finite rooted tree below $J$, and let $d$ be its largest depth in $J$. Let $cal(I) subset.eq cal(T)$, with an admissible kernel on each of its intervals. For each $j in { 0 \, 1 \, 2 \, 3 }$, let $f_(j \, s) : J arrow.r bb(C)$, $0 lt.eq s lt.eq d$, be measurable, and write $f_j = \( f_(j \, s) \)_(s = 0)^d$. Suppose that ${ 0 \, dots.h \, d }$ is partitioned into $W_j gt.eq 1$ deterministic nonempty consecutive blocks and that, on every block $B$, 
$ cal(V)_B \( f_j \) \( y \) lt.eq W_j^(- 1 \/ 2) quad upright("for almost every ") y in J . $

 The four partitions may differ. Extend the inputs by zero outside $J$. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(I in cal(I)) \| I \| \| H_I \( f_(0 \, s \( I \)) \, f_(1 \, s \( I \)) \, f_(2 \, s \( I \)) \, f_(3 \, s \( I \)) \) #scale(x: 120%, y: 120%)[\|] lt.eq C_(upright("loc")) \( c_0 \, C_0 \) \| J \| . $ <eq:depth-local>]

 The constant is independent of the lattice, root, tree, kernels, depth range, blocks, and their numbers.]
] <thm:depth-local>

Sections 4–7 prove Theorem 11 from the specified analytic results of H. Values are prescribed also on depths without summation intervals; that full schedule is used in the proof.

The application below varies only slot zero. The other three inputs use the same functions at every depth and one block each, so their block condition is simply the bound $1$. Theorem 11 applies uniformly to translations of the lattice.

=== 3.2 Kernels and the continuous test <kernels-and-the-continuous-test>

For an averaging profile $phi$ and $a > 0$, Lemma 12 constructs an admissible kernel whose normalized spatial integral is $phi_(2 a) - phi_a$. The unit-scale difference $phi_2 - phi$ has zero moments through order three, hence a compactly supported fourth antiderivative. The construction multiplies a rescaling of this primitive by a smooth spatial bump, then differentiates in the four cancellation directions.

#thm([Lemma 3.3.])[
  (Exact realization of a smooth scale difference).  #emph[For every averaging profile $phi$ in Definition 2, there are a dyadic integer $D_phi = 2^d$, $d in bb(Z)_(gt.eq 0)$, a constant $C_(0 \, phi) gt.eq 1$, and $cal(W)_phi in C_c^oo \( bb(R)^2 \; bb(R) \)$ such that the following holds. For every $a > 0$ and every interval $I$ of length $r = D_phi a$, with midpoint $m_I$, the kernel 
$ w_I \( x \, t \) = cal(W)_phi (frac(x - m_I, r) \, t / r) $

 is admissible with $c_0 = 1 \/ 8$ and $C_0 = C_(0 \, phi)$. Moreover, for every $t in bb(R)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ 1 / r integral_(bb(R)) cal(W)_phi \( z \, t \/ r \) thin d z = phi_(2 a) \( t \) - phi_a \( t \) . $ <eq:transfer-kernel-normalization>]

 The parameters are fixed once $phi$ is fixed.]
] <lem:transfer-kernel>

#proof[
  Set $b = phi_2 - phi$. For $0 lt.eq j lt.eq 3$,
  $ integral t^j b \( t \) thin d t = \( 2^j - 1 \) integral t^j phi \( t \) thin d t = 0 \, $
  using the zero factor for $j = 0$ and (2.2) for the other moments. Choose $B gt.eq 1$ with $"supp" b subset.eq \[ - B \, B \]$, and define
  $ g \( t \) = 1 / 6 integral_(- oo)^t \( t - v \)^3 b \( v \) thin d v . $
  It vanishes for $t < - B$. For $t > B$, expansion of the cubic and the four zero moments show that it again vanishes. Differentiating gives $g^(\( 4 \)) = b$, so $g in C_c^oo \( bb(R) \)$ with support in $\[ - B \, B \]$. For $0 lt.eq j lt.eq 3$,
  $ g^(\( j \)) \( t \) = frac(1, \( 3 - j \) !) integral_(- oo)^t \( t - v \)^(3 - j) b \( v \) thin d v \, #h(2em) parallel g^(\( j \)) parallel_oo lt.eq frac(\( 2 B \)^(4 - j), \( 4 - j \) !) parallel b parallel_oo . $
  For $n gt.eq 4$, $g^(\( n \)) = b^(\( n - 4 \))$. The derivative bounds for $phi$ therefore give bounds of the form (2.1) for all derivatives of $g$, with a constant depending on $phi$.
  Let $rho$ be the bump from Lemma 8 and put $u \( z \) = 8 rho \( 8 z \)$. It has integral $1$, support in $\[ - 1 \/ 8 \, 1 \/ 8 \]$, and the same type of derivative bounds. Choose a dyadic integer $D = D_phi > 12 B$. Define
  $ F \( z \, sigma \) = u \( z \) D^(- 3) g \( D sigma \) \, #h(2em) L_j = partial_sigma - j partial_z \, #h(2em) cal(W)_phi = L_0 L_1 L_2 L_3 F . $
  The operators commute, and differentiation does not enlarge support. Thus, on the support of $cal(W)_phi$,
  $ \| z + j sigma \| lt.eq 1 / 8 + frac(3 B, D) < 3 / 8 #h(2em) \( 0 lt.eq j lt.eq 3 \) . $
  For the scaled kernel this places every $x + j t$ at distance strictly greater than $r \/ 8$ from the endpoints of $I$.
  For $j = 0 \, 1 \, 2 \, 3$, put $G_j = product_(ell eq.not j) L_ell F$. The chain rule gives, for every $v \, t in bb(R)$,
  $ w_I \( v - j t \, t \) = r thin frac(d, d t) G_j (frac(v - j t - m_I, r) \, t / r) . $
  The differentiated function is compactly supported in $t$, so the integral of its derivative is zero. This proves each of the four cancellation conditions for every $v$.
  Expansion of the operators gives
  $ cal(W)_phi \( z \, sigma \) = D u \( z \) g^(\( 4 \)) \( D sigma \) - 6 u' \( z \) g^(\( 3 \)) \( D sigma \) + 11 D^(- 1) u'' \( z \) g'' \( D sigma \) - 6 D^(- 2) u''' \( z \) g' \( D sigma \) . $
  A derivative $partial_z^p partial_sigma^q$ of total order $n$ is a sum of four products of derivatives of $u \, g$ of orders at most $n + 4$, with factors bounded by a constant times $D^(n + 1)$. For fixed $D$, their derivative bounds yield
  $ parallel partial_z^p partial_sigma^q cal(W)_phi parallel_oo lt.eq #scale(x: 120%, y: 120%)[\(] C_(0 \, phi) \( n + 2 \) #scale(x: 120%, y: 120%)[\)]^(C_(0 \, phi) \( n + 2 \)) $
  for one sufficiently large $C_(0 \, phi)$ and all $p \, q$. Rescaling gives the required factor $r^(- n)$ for derivatives in $x \, t$. Finally, integration in $z$ kills all three terms containing derivatives of $u$, and hence
  $ integral_(bb(R)) cal(W)_phi \( z \, sigma \) thin d z = D g^(\( 4 \)) \( D sigma \) = D b \( D sigma \) . $
  As $r = D a$, division by $r$ gives $a^(- 1) b \( t \/ a \) = phi_(2 a) \( t \) - phi_a \( t \)$. ◻
]

For the rest of this section fix an averaging profile $phi$, and write $D = D_phi$, $b = phi_2 - phi$, and

$ Delta_k \( t \) = phi_(2^(k + 1)) \( t \) - phi_(2^k) \( t \) = 2^(- k) b \( 2^(- k) t \) \, #h(2em) k in bb(Z) . $

Constants with subscript $phi$ may depend on this profile, the fixed choices in Lemma 12, and $C_(upright("loc")) \( 1 \/ 8 \, C_(0 \, phi) \)$. They are independent of the scales, blocks, inputs, and probability system.

#thm([Lemma 3.4.])[
  (A continuous test obtained by translation averaging).  #emph[For the fixed profile $phi$ and $D = D_phi$, there is $C_phi^(upright(c)) < oo$ with the following property. Let $k_(-) lt.eq k_(+)$ be integers, and partition ${ k_(-) \, dots.h \, k_(+) }$ into $w gt.eq 1$ deterministic nonempty consecutive blocks. Let $K subset bb(R)$ be an interval of length $L > 0$. Let $f_1 \, f_2 \, f_3 : bb(R) arrow.r bb(C)$ and $f_(0 \, k) : bb(R) arrow.r bb(C)$, $k_(-) lt.eq k lt.eq k_(+)$, be measurable and vanish almost everywhere outside $K$. Suppose $\| f_j \| lt.eq 1$ almost everywhere for $j = 1 \, 2 \, 3$, and $cal(V)_B \( f_0 \) \( x \) lt.eq w^(- 1 \/ 2)$ for almost every $x in bb(R)$ and every block $B$. Then 
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|sum_(k = k_(-))^(k_(+)) integral_(bb(R)^2) f_(0 \, k) \( x \) product_(j = 1)^3 f_j \( x + j t \) Delta_k \( t \) thin d x thin d t|) lt.eq C_phi^(upright(c)) \( L + D 2^(k_(+)) \) . $ <eq:transfer-continuous>]

]
] <lem:transfer-continuous>

#proof[
  Set $r_k = D 2^k$ and $R = r_(k_(+))$. For $0 lt.eq h < R$, use the one translated dyadic lattice
  $ cal(D)_h = { \[ h + m 2^q \, h + \( m + 1 \) 2^q \) : m \, q in bb(Z) } . $
  Every $r_k$ is a length in this lattice and divides $R$. Use the kernels of Lemma 12, and let $H_I^h$ denote the local form with inputs $f_(0 \, k) \, f_1 \, f_2 \, f_3$ when $\| I \| = r_k$. The zeroth coordinate $x$ of a supported kernel lies in $I$. Hence every nonzero summand belongs to a root interval of length $R$ meeting $K$. The total length of these finitely many roots is at most $L + 2 R$.
  In each root, the intervals at the specified lengths lie in a finite tree of depth $k_(+) - k_(-)$. Restrict the inputs to that root; all forms are unchanged because every progression coordinate on the support lies in the summation interval. The fixed slots use constant depth schedules with one block. For slot zero, depth is $s = k_(+) - k$; reversing the scale order reverses the block order and the order inside each block without changing $cal(V)_B$. All hypotheses of Theorem 11 therefore hold on this root. Summing its conclusion over the roots gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ lr(|sum_(k = k_(-))^(k_(+)) sum_(I in cal(D)_h\
\| I \| = r_k) r_k H_I^h|) lt.eq sum_(k = k_(-))^(k_(+)) sum_(I in cal(D)_h\
\| I \| = r_k) r_k \| H_I^h \| lt.eq C_(upright("loc")) \( 1 \/ 8 \, C_(0 \, phi) \) \( L + 2 R \) . $ <eq:transfer-before-averaging>]
  For $r = r_k$, the spatial sum below is $r$-periodic in $h$. Since $r$ divides $R$, averaging and unfolding the translates gives, for every $x \, t in bb(R)$,
  $ 1 / R integral_0^R sum_(I in cal(D)_h\
\| I \| = r) r^(- 1) w_I \( x \, t \) thin d h & = 1 / r integral_0^r sum_(m in bb(Z)) r^(- 1) cal(W)_phi (frac(x - h - \( m + 1 \/ 2 \) r, r) \, t / r) thin d h\
 & = 1 / r integral_(bb(R)) cal(W)_phi \( z \, t \/ r \) thin d z = Delta_k \( t \) . $
  Here the last equality is (3.2). The normalization of the form is
  $ r H_I^h = r^(- 1) integral_(bb(R)^2) w_I \( x \, t \) f_(0 \, k) \( x \) product_(j = 1)^3 f_j \( x + j t \) thin d x thin d t . $
  It follows that averaging the first sum in (3.4) over $h in \[ 0 \, R \)$ gives exactly the sum of integrals in (3.3). The finite scale range, bounded common support of the inputs, and kernel support justify the exchanges of sums and integrals. Taking the absolute value after averaging proves (3.3), with $C_phi^(upright(c)) = 2 C_(upright("loc")) \( 1 \/ 8 \, C_(0 \, phi) \)$ as one possible choice. ◻
]

=== 3.3 Planting integer sequences and transferring to orbits <planting-integer-sequences-and-transferring-to-orbits>

For sequences on $bb(Z)$, support in an integer interval means vanishing at every integer outside it. We measure such an interval by its cardinality.

#thm([Lemma 3.5.])[
  (The corresponding test on integer sequences).  #emph[For the fixed profile $phi$ and $D = D_phi$, there is $C_phi^(upright(d)) < oo$ with the following property. Let $0 lt.eq k_(-) lt.eq k_(+)$ be integers, and partition ${ k_(-) \, dots.h \, k_(+) }$ into $w gt.eq 1$ deterministic nonempty consecutive blocks. Let $cal(K) = { q \, dots.h \, q + L - 1 }$, with $q in bb(Z)$ and integer $L gt.eq 1$. Suppose $f_1 \, f_2 \, f_3 : bb(Z) arrow.r bb(C)$ and $f_(0 \, k) : bb(Z) arrow.r bb(C)$, $k_(-) lt.eq k lt.eq k_(+)$, are supported in $cal(K)$, with $\| f_j \( m \) \| lt.eq 1$ for every $m$ and $j = 1 \, 2 \, 3$. Suppose also that $cal(V)_B \( f_0 \) \( m \) lt.eq w^(- 1 \/ 2)$ for every $m in bb(Z)$ and every block. Then 
#[#set math.equation(numbering: n => "(3.5)")
 $ lr(|sum_(k = k_(-))^(k_(+)) sum_(m \, n in bb(Z)) f_(0 \, k) \( m \) product_(j = 1)^3 f_j \( m + j n \) Delta_k \( n \)|) lt.eq C_phi^(upright(d)) \( L + D 2^(k_(+)) \) . $ <eq:transfer-discrete>]

]
] <lem:transfer-discrete>

#proof[
  Fix $e = 1 \/ 100$. For any one of the input sequences, define
  $ tilde(f) \( y \) = sum_(m in bb(Z)) f \( m \) upright(bold(1))_(\[ m - e \, m + e \)) \( y \) . $
  These small intervals are disjoint. The planted inputs are supported in $\[ q - e \, q + L - 1 + e \]$, which is contained in a real interval of length $L$. Their size and block conditions persist pointwise, because every $y$ belongs to at most one of the half-open planted intervals.
  If the product of the four planted inputs is nonzero at $\( x \, t \)$, let $q_j$ be its unique integer centers with $\| x + j t - q_j \| lt.eq e$. We discard the null set of boundary equalities. Put
  $ m = q_0 \, #h(2em) n = q_1 - q_0 \, #h(2em) xi = x - m \, #h(2em) eta = t - n . $
  The first two coordinates give $\| xi \| lt.eq e$ and $\| eta \| lt.eq 2 e$. For $j = 2 \, 3$,
  $ \| q_j - \( m + j n \) \| lt.eq \| q_j - \( x + j t \) \| + \| xi + j eta \| lt.eq \( 2 j + 2 \) e < 1 . $
  This integer difference is zero. Conversely, the coordinates lie in the four small intervals centered at $m + j n$ precisely on the translate of
  $ Q_e = { \( xi \, eta \) : \| xi + j eta \| lt.eq e \, med 0 lt.eq j lt.eq 3 } \, $
  up to boundaries. The two middle inequalities follow from the endpoint inequalities by convexity. The map $\( xi \, eta \) mapsto \( xi \, xi + 3 eta \)$ has determinant $3$, so
  $ \| Q_e \| = frac(4 e^2, 3) = : A_e > 0 . $
  Distinct integer pairs give disjoint regions up to null boundaries, because their zeroth and first centers are unique. Therefore the continuous planted integral at scale $k$ is exactly
  $ I_k = sum_(m \, n in bb(Z)) f_(0 \, k) \( m \) product_(j = 1)^3 f_j \( m + j n \) integral_(Q_e) Delta_k \( n + eta \) thin d xi thin d eta . $
  Choose $B_b gt.eq 1$ with $"supp" b subset.eq \[ - B_b \, B_b \]$. At scale $a = 2^k gt.eq 1$, the mean value inequality gives
  $ \| Delta_k \( n + eta \) - Delta_k \( n \) \| lt.eq 2 e parallel b' parallel_oo a^(- 2) #h(2em) \( \( xi \, eta \) in Q_e \) . $
  If the difference is nonzero, then $\| n \| lt.eq B_b a + 2 e$, so there are at most $\( 2 B_b + 4 e + 1 \) a$ possible integers $n$. There are at most $L$ contributing integers $m$, and every coefficient product has absolute value at most $1$, since $cal(V)_B \( f_0 \) \( m \) lt.eq w^(- 1 \/ 2) lt.eq 1$. Consequently, with
  $ D_k = sum_(m \, n in bb(Z)) f_(0 \, k) \( m \) product_(j = 1)^3 f_j \( m + j n \) Delta_k \( n \) \, $
  we have
  $ \| I_k - A_e D_k \| lt.eq A_e thin 2 e parallel b' parallel_oo \( 2 B_b + 4 e + 1 \) L thin 2^(- k) . $
  The restriction $k gt.eq 0$ makes the errors summable, since $sum_(k = k_(-))^(k_(+)) 2^(- k) lt.eq 2$. Apply Lemma 13 to the planted inputs, sum this error bound, and divide by $A_e$. The resulting error is at most a constant depending only on $phi$ times $L$, proving (3.5). ◻
]

#proof[
  We first obtain the corresponding finite estimate on integer sequences. Let $cal(K)$ be an integer interval of cardinality $L gt.eq 1$, let $cal(E) subset.eq cal(K)$ be a nonempty integer interval, and let $f_1 \, f_2 \, f_3 : bb(Z) arrow.r bb(C)$ be supported in $cal(K)$ and bounded in absolute value by $1$. Put
  $ sans(V)_k \( m \) = sum_(n in bb(Z)) phi_(2^k) \( n \) product_(j = 1)^3 f_j \( m + j n \) \, #h(2em) k gt.eq 0 \, quad m in bb(Z) . $
  Fix deterministic integers $0 lt.eq k_1 < dots.h.c < k_(w + 1)$, with $w gt.eq 1$. For $m in cal(E)$, let $ell_i \( m \)$ be the smallest index attaining the maximum of $\| sans(V)_ell \( m \) - sans(V)_(k_i) \( m \) \|$ over $k_i lt.eq ell lt.eq k_(i + 1)$. Set
  $ d_i \( m \) = sans(V)_(ell_i \( m \)) \( m \) - sans(V)_(k_i) \( m \) \, #h(2em) alpha_i \( m \) = cases(delim: "{", overline(d_i \( m \)) \/ \| d_i \( m \) \| \, & d_i \( m \) eq.not 0 \,, 0 \, & d_i \( m \) = 0 .) $
  Thus $alpha_i \( m \) d_i \( m \) = \| d_i \( m \) \|$, also for complex inputs. In the block $k_i lt.eq k < k_(i + 1)$, define
  $ f_(0 \, k) \( m \) = cases(delim: "{", alpha_i \( m \) \/ \( 4 sqrt(w) \) \, & m in cal(E) upright(" and ") k < ell_i \( m \) \,, 0 \, & upright("otherwise") .) $
  On that block the supremum is at most $\( 4 sqrt(w) \)^(- 1)$, and there is at most one jump of that size. Hence $cal(V)_B \( f_0 \) \( m \) lt.eq \( 2 sqrt(w) \)^(- 1) lt.eq w^(- 1 \/ 2)$. The block endpoints are deterministic; only the prefix lengths and phases depend on $m$.
  The scale differences telescope exactly:
  $ & sum_(k = k_1)^(k_(w + 1) - 1) sum_(m \, n in bb(Z)) f_(0 \, k) \( m \) product_(j = 1)^3 f_j \( m + j n \) Delta_k \( n \)\
 & = frac(1, 4 sqrt(w)) sum_(m in cal(E)) sum_(i = 1)^w alpha_i \( m \) #scale(x: 120%, y: 120%)[\(] sans(V)_(ell_i \( m \)) \( m \) - sans(V)_(k_i) \( m \) #scale(x: 120%, y: 120%)[\)]\
 & = frac(1, 4 sqrt(w)) sum_(m in cal(E)) sum_(i = 1)^w max_(k_i lt.eq ell lt.eq k_(i + 1)) \| sans(V)_ell \( m \) - sans(V)_(k_i) \( m \) \| . $
  The final expression is nonnegative real. Lemma 14 applies to the blocks just constructed. Its largest difference scale is $2^(k_(w + 1) - 1) lt.eq 2^(k_(w + 1))$. We obtain
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_(m in cal(E)) sum_(i = 1)^w max_(k_i lt.eq ell lt.eq k_(i + 1)) \| sans(V)_ell \( m \) - sans(V)_(k_i) \( m \) \| lt.eq 4 C_phi^(upright(d)) sqrt(w) thin \( L + D 2^(k_(w + 1)) \) . $ <eq:transfer-sequence-oscillation>]
  We now use the finite-orbit form of Calderón’s transference principle; compare the explicit cutoff arguments in #cite(label("Bourgain1989")) Section 2B and #cite(label("KMT2022")), as well as #cite(label("Calderon1968")). Let the system and functions be as in Proposition 3, and retain the fixed endpoint list. Choose $B_phi gt.eq 1$ with $"supp" phi subset.eq \[ - B_phi \, B_phi \]$, and set $Q = ceil.l 3 B_phi 2^(k_(w + 1)) ceil.r$. For each integer $M gt.eq 1$ and $x in X$, use the finite sequences
  $ g_(j \, x) \( r \) = cases(delim: "{", f_j \( T^r x \) \, & 1 - Q lt.eq r lt.eq M + Q \,, 0 \, & upright("otherwise") \,) #h(2em) r in bb(Z) \, quad j = 1 \, 2 \, 3 . $
  Their common support interval has cardinality $M + 2 Q$, and contains the testing interval ${ 1 \, dots.h \, M }$. If $1 lt.eq m lt.eq M$, $k_1 lt.eq ell lt.eq k_(w + 1)$, and $phi_(2^ell) \( n \) eq.not 0$, then $\| j n \| lt.eq 3 B_phi 2^(k_(w + 1)) lt.eq Q$. Thus the sequence average is exactly
  $ sum_n phi_(2^ell) \( n \) product_(j = 1)^3 g_(j \, x) \( m + j n \) = V_ell^phi \( T^m x \) . $
  Apply (3.6) to these sequences for each $x$. The resulting finite maxima are measurable and bounded, as observed after (2.4). Integrating and using invariance of each $T^m$ gives
  $ M sum_(i = 1)^w integral_X max_(k_i lt.eq ell lt.eq k_(i + 1)) \| V_ell^phi - V_(k_i)^phi \| thin d mu lt.eq 4 C_phi^(upright(d)) sqrt(w) \( M + 2 Q + D 2^(k_(w + 1)) \) . $
  Divide by $M$ and let $M arrow.r oo$, keeping the endpoint list, hence $Q$, fixed. We obtain (2.3) with $C_phi = 4 C_phi^(upright(d))$. This finite transfer uses only measurability and measure preservation of the integer powers of $T$. ◻
]

== 4 Bessel rows with inputs varying in depth <sec:rows>

We shall apply fixed-input operator estimates to rows that read different members of one input sequence. The input is allowed bounded total variation on each of finitely many consecutive depth blocks. The additional structure of the rows is spatial: their adjoints have constant coefficients in a persistent catalog of columns with private coordinates. We first prove the result for such rows, and then treat smooth mean-zero rows with fixed carriers.

Throughout this section $R$ is a bounded dyadic interval of positive length. Unqualified $L^2$ norms use Lebesgue measure, without normalization. The inner product of a complex Hilbert space is linear in its first variable. A dyadic interval is taken half open. A finite dyadic partition of an interval $R$ consists of pairwise disjoint dyadic subintervals whose union is $R$; a partition refines another if each of its cells is contained in one cell of the other. Thus cells of a partition may have different depths. Choose an integer $s_R$ and define the spatial depth of a dyadic cell $I subset R$ by

$ s \( I \) = s_R + log_2 frac(\| R \|, \| I \|) . $

For an integer $h gt.eq s_R$, the full depth-$h$ partition consists of all cells in $R$ of depth $h$. On a dyadic subroot $R' subset R$, retain $s_(R') = s \( R' \)$, so the spatial depths of its cells are unchanged.

=== 4.1 The input size and variation bounds <the-input-size-and-variation-bounds>

Let

$ sans(S) = { s_(-) \, s_(-) + 1 \, dots.h \, s_(+) } $

be a nonempty finite interval of integers. Partition $sans(S)$ into $W gt.eq 1$ nonempty consecutive blocks $sans(S)_1 \, dots.h \, sans(S)_W$, in that order. This partition is fixed independently of the spatial point. For strongly measurable functions $F_s : R arrow.r cal(H)$ into a Hilbert space, the block normalization will mean

#[#set math.equation(numbering: n => "(4.1)")
 $ max_(s in sans(S)_b) parallel F_s \( y \) parallel_(cal(H)) + sum_(s \, s + 1 in sans(S)_b) parallel F_(s + 1) \( y \) - F_s \( y \) parallel_(cal(H)) lt.eq W^(- 1 \/ 2) quad \( 1 lt.eq b lt.eq W \) $ <eq:row-input-normalization>]

for almost every $y in R$. Since the data are finite, one may take the same exceptional null set for all blocks.

#thm([Lemma 4.1.])[
  (Size and variation of the depth inputs).  #emph[Assume Equation (4.1). For every measurable $E subset R$ of positive measure, every $s in sans(S)$, and $1 lt.eq q lt.eq oo$, one has 
$ parallel F_s parallel_(q \, E) lt.eq W^(- 1 \/ 2) lt.eq 1 \, #h(2em) parallel upright(bold(1))_E F_s parallel_2 lt.eq W^(- 1 \/ 2) \| E \|^(1 \/ 2) lt.eq \| E \|^(1 \/ 2) . $

 Here the first norm uses normalized measure on $E$, with the usual essential-supremum interpretation when $q = oo$.]
  #emph[Let $cal(J)$ be a finite collection of pairs $\[ r \, t \]$ with $r \, t in sans(S)$ and $r lt.eq t$. Its edge overlap is 
$ frak(m) = max_(s_(-) lt.eq j < s_(+)) \# { \[ r \, t \] in cal(J) : r lt.eq j < t } \, $

 where a maximum over an empty set is zero. Then 
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(\[ r \, t \] in cal(J)) parallel upright(bold(1))_E \( F_t - F_r \) parallel_2^2 lt.eq frak(m) (1 + frac(4 \( W - 1 \), W)) \| E \| lt.eq 5 frak(m) \| E \| . $ <eq:row-variation>]

 In particular the constant is independent of the number of blocks and depths. The same statements hold on a nondecreasing subsequence of the schedule, with repeated indices allowed and overlap counted in that subsequence.]
] <lem:depth-input-size>

#proof[
  The size statements follow pointwise from Equation (4.1). To prove the variation estimate, fix a point outside the exceptional null set and put
  $ d_j = parallel F_(j + 1) \( y \) - F_j \( y \) parallel_(cal(H)) \, #h(2em) v_b = sum_(j \, j + 1 in sans(S)_b) d_j . $
  Thus $v_b lt.eq W^(- 1 \/ 2)$. For an interval $\[ r \, t \]$ with both endpoints in $sans(S)_b$, let $delta_(r \, t) = parallel F_t \( y \) - F_r \( y \) parallel_(cal(H))$. The triangle inequality gives $delta_(r \, t) lt.eq sum_(j = r)^(t - 1) d_j lt.eq v_b$. Hence
  $ sum_(\[ r \, t \] in cal(J)\
r \, t in sans(S)_b) delta_(r \, t)^2 lt.eq v_b sum_(\[ r \, t \] in cal(J)\
r \, t in sans(S)_b) sum_(j = r)^(t - 1) d_j lt.eq frak(m) v_b^2 . $
  An interval whose endpoints are in different blocks crosses an edge between consecutive blocks. Assign it to its first such edge. At most $frak(m)$ intervals are assigned to each of the $W - 1$ edges. Each of their differences has norm at most $2 W^(- 1 \/ 2)$, by the two endpoint size bounds. The pointwise sum of all the squared differences is therefore at most
  $ frak(m) sum_(b = 1)^W v_b^2 + 4 frak(m) \( W - 1 \) W^(- 1) lt.eq frak(m) (1 + frac(4 \( W - 1 \), W)) . $
  Integration on $E$ proves Equation (4.2).
  For a nondecreasing list of indices, every repeated index contributes zero variation. Between distinct successive indices, the triangle inequality charges each original edge at most once. This proves the same bound on each nonempty restricted block, retaining the original $W$ block labels and assigning value zero to an empty block. Moreover, if intervals in the list have edge overlap $frak(m)$, the original edge between $j$ and $j + 1$ is crossed at most $frak(m)$ times: every interval crossing it crosses the single cut in the list between indices at most $j$ and indices greater than $j$. The preceding proof therefore applies verbatim. Constant extension before or after the schedule is also permitted by extending the first or last block. ◻
]

A scalar input and its lift $F_s = \( f_s \, 0 \)$ into a space with private coordinates have the same pointwise norm and variation. Thus Lemma 15 applies to the actual inputs used below on every subroot.

=== 4.2 A persistent catalog and the maximal estimate <a-persistent-catalog-and-the-maximal-estimate>

We use the private-column construction of #cite(label("H")) Section 3, allowing a Hilbert space in place of its physical scalar coordinate. Fix a dyadic root $R$ and a finite label set $cal(V)$. The cardinality of $cal(V)$ need not be bounded in terms of the budget below. For each $v in cal(V)$ choose a dyadic birth cell $J_v subset R$, a strongly measurable function $phi.alt_v : J_v arrow.r cal(H)_0$ into a Hilbert space, and a nonzero scalar $gamma_v$. In

$ cal(H) = cal(H)_0 xor ell^2 \( cal(V) \) $

define, once and for all,

$ Phi_v \( y \) = \( phi.alt_v \( y \) \, gamma_v upright(bold(e))_v \) \, #h(2em) y in J_v . $

The direction $upright(bold(e))_v$ is private to $v$, including when two physical functions coincide. On a descendant cell $Q$ the available labels are

$ cal(V) \( Q \) = { v in cal(V) : Q subset J_v } . $

Their columns on $Q$ are the restrictions of these same functions $Phi_v$. An indicator times such a restricted column denotes its extension by zero off that cell. This is what persistence means here. A mask may omit a label at a particular use, but such omission does not remove the label from the catalog or change its function on later descendants. We assume that $D gt.eq 2$ and

#[#set math.equation(numbering: n => "(4.3)")
 $ parallel Phi_v parallel_(L^oo \( J_v \; cal(H) \)) lt.eq D \, #h(2em) \| gamma_v \| gt.eq D^(- 1) \, #h(2em) sum_(v in cal(V)) upright(bold(1))_(J_v) \( y \) lt.eq D quad upright("for almost every ") y in R . $ <eq:row-catalog-budget>]

The last bound counts all birth labels on a path, including labels not selected in a current mask.

#thm([Lemma 4.2.])[
  (Bounds for the private catalog).  #emph[For every dyadic cell $Q subset R$ and every vector $a = \( a_v \)_(v in cal(V) \( Q \))$, one has 
#[#set math.equation(numbering: n => "(4.4)")
 $ D^(- 1) parallel a parallel_(ell^2) lt.eq ∥sum_(v in cal(V) \( Q \)) a_v Phi_v \( y \)∥_(cal(H)) lt.eq D^(3 \/ 2) parallel a parallel_(ell^2) quad upright("for almost every ") y in Q . $ <eq:row-catalog-comparison>]

 In particular constant coefficients in such a representation are unique. Coefficients may be regarded as vectors in the one space $ell^2 \( cal(V) \)$ by extending them by zero; the vector for a combination on $Q$ is unchanged when the combination is restricted to a descendant.]
  #emph[These assertions and the same value of $D$ hold after restriction to a dyadic subroot $R' subset R$: discard birth cells disjoint from $R'$, give an inherited label with $R' subset J_v$ the new birth cell $R'$, and retain the other birth cells contained in $R'$.]
] <lem:row-catalog>

#proof[
  Outside one common null set, the private component of the sum has squared norm $sum_v \| gamma_v \|^2 \| a_v \|^2$, which is at least $D^(- 2) parallel a parallel_(ell^2)^2$. Cauchy–Schwarz and the path count give
  $ ∥sum_v a_v Phi_v \( y \)∥_(cal(H)) lt.eq (sum_(v : y in J_v) parallel Phi_v \( y \) parallel_(cal(H))^2)^(1 \/ 2) parallel a parallel_(ell^2) lt.eq D^(3 \/ 2) parallel a parallel_(ell^2) . $
  The null set can be chosen common because $cal(V)$ is finite. The lower bound proves uniqueness. Availability is monotone on descendants, and restriction changes neither component of a column, so the assertion about coefficient vectors follows. Finally, two dyadic cells that intersect are nested. The stated change of births on $R'$ therefore retains precisely the old columns that can occur there, with their old values and directions. It cannot increase any of the three bounds in Equation (4.3). ◻
]

We now give the row estimate. Its hypotheses distinguish the partition supporting a row from the finer partition on which its adjoint coefficients are observed. The order of these two partitions ensures that every stopping decision assigns an entire row to one set of indices.

#thm([Lemma 4.3.])[
  (Maximal estimate for local catalog rows).  #emph[Use a root and catalog satisfying Equation (4.3). Let $N gt.eq 1$, and for $1 lt.eq n lt.eq N$ let $pi_n$ and $sigma_n$ be finite dyadic partitions of $R$ such that 
$ sigma_n upright(" refines ") pi_n \, #h(2em) pi_(n + 1) upright(" refines ") sigma_n quad \( 1 lt.eq n < N \) . $

 Let $cal(R)_1 \, dots.h \, cal(R)_N$ be pairwise disjoint finite row index sets, with union $cal(R)$. For every $nu in cal(R)_n$, let $cal(Y)_nu$ be a Hilbert space, let $Q_nu in pi_n$, and let $A_nu : L^2 \( R \; cal(H) \) arrow.r cal(Y)_nu$ be bounded and linear. Assume the following two properties.]
  + #emph[The whole row has support $Q_nu$: $A_nu = A_nu upright(bold(1))_(Q_nu)$. For every $K in sigma_n$ and every $c in cal(Y)_nu$, there are spatially constant coefficients $a_(nu \, K \, v) \( c \)$ such that, in $L^2 \( R \; cal(H) \)$, 
$ upright(bold(1))_K A_nu^(*) c = upright(bold(1))_K sum_(v in cal(V) \( K \)) a_(nu \, K \, v) \( c \) Phi_v . $

 There is no asserted uniform bound on these coefficients.]
  + #emph[For some $B gt.eq 0$ the original rows satisfy the joint operator estimate 
$ sum_(nu in cal(R)) parallel A_nu z parallel_(cal(Y)_nu)^2 lt.eq B^2 parallel z parallel_(L^2 \( R \; cal(H) \))^2 #h(2em) \( z in L^2 \( R \; cal(H) \) \) . $

]
  #emph[Cells with no rows and empty rounds are allowed, as are multiple rows with the same support cell. Define 
$ L_D = 1 + ceil.l 5 log_2 D ceil.r \, #h(2em) frak(C)_D = 8 / 3 sqrt(9 + L_D^2) lt.eq 40 / 3 log_2 \( 2 D \) . $

 For $1 lt.eq p lt.eq q lt.eq N$ and any tests $c_nu in cal(Y)_nu$ in these rounds, put 
$ E_c & = sum_(n = p)^q sum_(nu in cal(R)_n) parallel c_nu parallel_(cal(Y)_nu)^2 \,\
g_n & = sum_(nu in cal(R)_n) A_nu^(*) c_nu \, #h(2em) S_j = sum_(n = p)^j g_n \, quad S_(p - 1) = 0 \,\
M \( y \) & = max_(p - 1 lt.eq j lt.eq q) parallel S_j \( y \) parallel_(cal(H)) . $

 Then, for every $lambda > 0$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ \| { y in R : M \( y \) > lambda } \| lt.eq min {\| R \| \, frac(frak(C)_D^2 B^2 E_c, 4 lambda^2)} \, #h(2em) parallel M parallel_(L^1 \( R \)) lt.eq frak(C)_D B thin \| R \|^(1 \/ 2) E_c^(1 \/ 2) . $ <eq:row-maximal>]

]
] <lem:row-maximal>

#proof[
  Restrict to the rounds $p \, dots.h \, q$ and relabel them starting at one. Fix the test vector $c$ and $lambda > 0$. Choose representatives of the finitely many tested adjoints in their asserted cellwise forms, and remove their exceptional null sets together with the catalog null set. On a cell $K in sigma_n$, the resulting function $g_n$ has a unique coefficient vector $a_n \( K \) in ell^2 \( cal(V) \)$, supported on $cal(V) \( K \)$, by Lemma 16. The locality identity also gives $A_nu^(*) = upright(bold(1))_(Q_nu) A_nu^(*)$. Thus on $K$ only rows supported on the unique cell of $pi_n$ containing $K$ contribute to $a_n \( K \)$.
  Set
  $ T = 2^(ceil.l 5 log_2 D ceil.r) \, #h(2em) tau = frac(lambda, 4 D^(3 \/ 2)) . $
  We will select $T$ disjoint subfamilies of whole rows so that, away from paths with $T$ hits, every partial sum is a prefix of completed bucket sums plus a remainder of norm at most $lambda \/ 4$. The upper catalog bound controls the remainder; the lower bound and the original Bessel inequality control the measure of paths with $T$ hits. A binary-prefix estimate then costs only $log T$.
  We assign whole rows to buckets $1 \, dots.h \, T$ as follows. At the start of the first round, every cell has current bucket $1$ and current coefficient vector zero. Inductively these two states at the start of round $n$ are constant on each cell $Q in pi_n$, and the vector is supported on $cal(V) \( Q \)$. Assign every row with support $Q$ to its current bucket, unless that bucket is $T + 1$, in which case omit the row. On each $K in sigma_n$ contained in $Q$ with current bucket at most $T$, add $a_n \( K \)$ to the current coefficient vector. If the norm of the resulting vector is greater than $tau$, declare a hit, move to the next bucket, and set the current vector to zero. Otherwise retain the resulting vector and the current bucket. Once bucket $T$ has a hit, keep state $\( T + 1 \, 0 \)$ and make no further additions.
  This induction is well defined on whole cells. Indeed, the new states are constant on cells of $sigma_n$. All their coefficients refer to the same global label space: older columns and their coefficients restrict unchanged to $K$, and their labels remain available there. Since $pi_(n + 1)$ refines $sigma_n$, the states are constant on each support cell at the start of the next round. In particular a row is assigned one bucket for its entire support, and is never split by the set on which a hit has occurred. All hit sets are finite unions of cells and are measurable.
  Figure 1 illustrates the refinement that keeps this assignment on whole rows.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.23, 2.7), [#text(size: 9pt)[support cells $pi_n$]], anchor: "east", padding: 0.1176cm)
  content((-0.23, 1.5), [#text(size: 9pt)[observation cells $sigma_n$]], anchor: "east", padding: 0.1176cm)
  content((-0.23, 0.3), [#text(size: 9pt)[support cells $pi_(n+1)$]], anchor: "east", padding: 0.1176cm)
  rect((0, 2.4), (7.36, 3), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.68, 2.7), [#text(size: 9pt)[one row on $Q$, assigned to bucket $b$]])
  rect((0, 1.2), (3.68, 1.8), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.68, 1.2), (7.36, 1.8), fill: rgb("#dedede"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.84, 1.5), [#text(size: 9pt)[no new hit]])
  content((5.52, 1.5), [#text(size: 9pt)[a new hit]])
  rect((0, 0), (1.84, 0.6), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.84, 0), (3.68, 0.6), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.68, 0), (5.52, 0.6), fill: rgb("#dedede"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.52, 0), (7.36, 0.6), fill: rgb("#dedede"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.92, 0.3), [#text(size: 9pt)[$b$]])
  content((2.76, 0.3), [#text(size: 9pt)[$b$]])
  content((4.6, 0.3), [#text(size: 9pt)[$b+1$]])
  content((6.44, 0.3), [#text(size: 9pt)[$b+1$]])
  line((0, 0.6), (0, 1.2), (3.68, 0.6), (3.68, 1.2), (7.36, 0.6), (7.36, 1.2), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 1.8), (0, 2.4), (7.36, 1.8), (7.36, 2.4), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((7.774, 2.7), (7.774, 0.3), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((7.912, 1.5), [#text(size: 9pt)[chronological#linebreak()order]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Schematic view of one branch of the spatial partitions in consecutive rounds. The row on $Q$ has already entered bucket $b$ before a new hit is tested. Hits may differ on the observation cells. Each support cell in the next round lies inside one observation cell, so every row in that round still receives one bucket; the bottom labels give those bucket numbers. ],
  ) <fig:row-chronology>
  Let $cal(B)_i$ be the rows assigned to bucket $i$, and set
  $ v_i = sum_(nu in cal(B)_i) A_nu^(*) c_nu \, #h(2em) 1 lt.eq i lt.eq T . $
  For every subset $J subset { 1 \, dots.h \, T }$, the adjoint of the joint operator in the hypothesis gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ ∥sum_(i in J) v_i∥_2^2 lt.eq B^2 sum_(nu in union.big_(i in J) cal(B)_i) parallel c_nu parallel_(cal(Y)_nu)^2 . $ <eq:row-bucket-bessel>]
  Although the sets $cal(B)_i$ depend on the fixed test vector, they are actual subsets of the original row indices. Thus Equation (4.6) is the original operator inequality applied to a test vector with some coordinates set to zero. In particular
  $ sum_(i = 1)^T parallel v_i parallel_2^2 lt.eq B^2 E_c . $
  Let $Omega_T$ be the set of points whose path has $T$ hits during these rounds. At any point $y$, a tested adjoint from $cal(B)_i$ whose support does not contain $y$ vanishes there. If its support contains $y$, it was assigned $i$ exactly when the path’s current bucket was $i$; conversely, before stopping, every tested adjoint whose support contains $y$ enters that current bucket. Thus, on $Omega_T$, $v_i \( y \)$ is exactly the sum accumulated in bucket $i$ up to and including the round that causes its hit. The coefficient vector of this sum has norm greater than $tau$. All its labels remain available on the final observation cell containing $y$, so Equation (4.4) yields $parallel v_i \( y \) parallel_(cal(H)) > D^(- 1) tau$ for $1 lt.eq i lt.eq T$. Consequently
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| Omega_T \| lt.eq frac(B^2 E_c, T D^(- 2) tau^2) = frac(16 D^5 B^2 E_c, T lambda^2) . $ <eq:row-many-hits>]
  Outside $Omega_T$, at any intermediate round the partial sum equals a prefix of the completed bucket sums $v_i \( y \)$ plus the current unfinished sum. The latter has coefficient norm at most $tau$, and hence has Hilbert norm at most $D^(3 \/ 2) tau = lambda \/ 4$. This statement also includes the instant of a hit, by putting the newly completed bucket in the prefix and taking unfinished sum zero. Thus, with
  $ M_T \( y \) = max_(0 lt.eq j lt.eq T) ∥sum_(i = 1)^j v_i \( y \)∥_(cal(H)) \, $
  one has
  #[#set math.equation(numbering: n => "(4.8)")
   $ M \( y \) lt.eq M_T \( y \) + lambda \/ 4 #h(2em) \( y in.not Omega_T \) $ <eq:row-prefix-domination>]
  outside the fixed null set.
  It remains to estimate $M_T$ using Equation (4.6). We use the binary-prefix argument of Rademacher–Menshov type; compare #cite(label("KrauseLacey2020")) Lemma 2.7. For each $0 lt.eq k lt.eq log_2 T$, let $cal(D)_k$ be the partition of ${ 1 \, dots.h \, T }$ into consecutive dyadic index intervals of length $2^k$, and put $v_J = sum_(i in J) v_i$. Every prefix is the disjoint union of at most one interval from each $cal(D)_k$. The triangle inequality therefore gives pointwise
  $ M_T lt.eq sum_(k = 0)^(log_2 T) (sum_(J in cal(D)_k) parallel v_J parallel_(cal(H))^2)^(1 \/ 2) . $
  For a fixed $k$, Equation (4.6) and the disjointness of the index intervals imply
  $ integral_R sum_(J in cal(D)_k) parallel v_J \( y \) parallel_(cal(H))^2 thin d y = sum_(J in cal(D)_k) parallel v_J parallel_2^2 lt.eq B^2 E_c . $
  Minkowski’s inequality in $L^2 \( R \)$ now gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ parallel M_T parallel_2 lt.eq \( 1 + log_2 T \) B E_c^(1 \/ 2) = L_D B E_c^(1 \/ 2) . $ <eq:row-binary-prefix>]
  Equations (4.7)–(4.9) and Chebyshev’s inequality show that
  $ \| { M > lambda } \| & lt.eq \| Omega_T \| + \| { M_T > 3 lambda \/ 4 } \|\
 & lt.eq frac(16 B^2 E_c, lambda^2) (D^5 / T + L_D^2 / 9) lt.eq frac(16 \( 9 + L_D^2 \) B^2 E_c, 9 lambda^2) \, $
  because $T gt.eq D^5$. This is the stated weak estimate, as $frak(C)_D^2 \/ 4 = 16 \( 9 + L_D^2 \) \/ 9$. Integrating the minimum of this estimate and $\| R \|$ over $lambda > 0$ proves the $L^1$ estimate: for $H = \( frak(C)_D \/ 2 \) B E_c^(1 \/ 2) > 0$,
  $ integral_0^oo min { \| R \| \, H^2 \/ lambda^2 } thin d lambda = 2 H \| R \|^(1 \/ 2) . $
  If $H = 0$, the weak estimate gives $M = 0$ almost everywhere instead. Finally, put $x = log_2 D gt.eq 1$. Since $L_D lt.eq 5 x + 2$ and $9 + \( 5 x + 2 \)^2 lt.eq 25 \( x + 1 \)^2$, the asserted upper bound on $frak(C)_D$ follows. ◻
]

#thm([Lemma 4.4.])[
  (The depth-varying row estimate).  #emph[Let the root, catalog, partitions, and rows satisfy every hypothesis of Lemma 17. Let $\( F_s \)_(s in sans(S))$ satisfy Equation (4.1) on $R$. Choose $s_n in sans(S)$ with $s_1 lt.eq s_2 lt.eq dots.h.c lt.eq s_N$, and let every row of round $n$ read the same input $F_(s_n)$. These read indices label the input schedule independently of the spatial depths of the support cells. Then 
#[#set math.equation(numbering: n => "(4.10)")
 $ (sum_(n = 1)^N sum_(nu in cal(R)_n) parallel A_nu F_(s_n) parallel_(cal(Y)_nu)^2)^(1 \/ 2) lt.eq frak(C)_D B thin \| R \|^(1 \/ 2) lt.eq 40 / 3 B log_2 \( 2 D \) thin \| R \|^(1 \/ 2) . $ <eq:row-depth>]

 The constant is independent of the number of rows, depths, and input blocks.]
] <lem:row-depth>

#proof[
  Test the output vector against arbitrary $c = \( c_nu \)_(nu in cal(R))$ in the finite Hilbert direct sum of the row spaces. The rounds whose read index lies in a particular block $sans(S)_b$ are consecutive, or absent, because the $s_n$ are nondecreasing. On a nonempty such range $p lt.eq n lt.eq q$, form $g_n \, S_n \, M$ as in Lemma 17. Pointwise Abel summation, with the stipulated inner-product convention, is
  $ sum_(n = p)^q chevron.l F_(s_n) \, g_n chevron.r_(cal(H)) = chevron.l F_(s_q) \, S_q chevron.r_(cal(H)) + sum_(n = p)^(q - 1) chevron.l F_(s_n) - F_(s_(n + 1)) \, S_n chevron.r_(cal(H)) . $
  The absolute value of this expression is at most
  $ (parallel F_(s_q) parallel_(cal(H)) + sum_(n = p)^(q - 1) parallel F_(s_(n + 1)) - F_(s_n) parallel_(cal(H))) M lt.eq W^(- 1 \/ 2) M . $
  For the last inequality, the nondecreasing reads traverse each edge in the block at most once; repeated reads contribute zero. Integrating and using Equation (4.5) bounds this block’s pairing by
  $ frak(C)_D B thin W^(- 1 \/ 2) \| R \|^(1 \/ 2) (sum_(n = p)^q sum_(nu in cal(R)_n) parallel c_nu parallel_(cal(Y)_nu)^2)^(1 \/ 2) . $
  All sums are finite and each pairing is integrable by the $L^2$ inequality, so the pointwise identity may be integrated. Write $E_b$ for the squared coefficient sum in the last display, with $E_b = 0$ for an absent block. The adjoint identity and Cauchy–Schwarz over the $W$ blocks give
  $ lr(|sum_(n = 1)^N sum_(nu in cal(R)_n) chevron.l A_nu F_(s_n) \, c_nu chevron.r_(cal(Y)_nu)|) & lt.eq frak(C)_D B thin \| R \|^(1 \/ 2) W^(- 1 \/ 2) sum_(b = 1)^W E_b^(1 \/ 2)\
 & lt.eq frak(C)_D B thin \| R \|^(1 \/ 2) (sum_(nu in cal(R)) parallel c_nu parallel_(cal(Y)_nu)^2)^(1 \/ 2) . $
  Duality in the finite Hilbert direct sum proves Equation (4.10). ◻
]

The realized finite rows, partitions, and catalog may depend on the given depth inputs, provided they satisfy all preceding hypotheses and are held fixed while their ordinary operator inequality is tested on arbitrary inputs.

=== 4.3 Projection increments <projection-increments>

Here is a useful consequence for the inherited local projections of H. It also records why their splitting into support cells preserves the original Bessel bound.

#thm([Corollary 4.5.])[
  (Increments of inherited projections).  #emph[Use the catalog of Lemma 16. On a finite interval of integers $h gt.eq s_R$, let $cal(P)_h$ be the full partition of $R$ into cells of depth $h$. On each $Q in cal(P)_h$, let $P_(h \, Q)$ be the orthogonal projection in $L^2 \( Q \; cal(H) \)$ onto constant-coefficient combinations of a subset $cal(M)_h \( Q \) subset cal(V) \( Q \)$. Assume inheritance: if $Q' in cal(P)_(h + 1)$ is contained in $Q$, then $cal(M)_h \( Q \) subset cal(M)_(h + 1) \( Q' \)$. Let $P_h$ be the direct sum of the $P_(h \, Q)$ on $L^2 \( R \; cal(H) \)$.]
  #emph[Suppose $\( F_s \)_(s in sans(S))$ satisfies Equation (4.1). For any integer $J gt.eq 1$ and 
$ r_1 lt.eq t_1 lt.eq r_2 lt.eq t_2 lt.eq dots.h.c lt.eq r_J lt.eq t_J $

 in the projection depth range and nondecreasing $s_1 \, dots.h \, s_J in sans(S)$, one has 
#[#set math.equation(numbering: n => "(4.11)")
 $ sum_(j = 1)^J parallel \( P_(t_j) - P_(r_j) \) F_(s_j) parallel_2^2 lt.eq frak(C)_D^2 \| R \| . $ <eq:row-disjoint-increments>]

 If the intervals can be divided into $frak(m)$ such ordered families whose reads are nondecreasing, the right side is multiplied by $frak(m)$.]
  #emph[For each $s in sans(S)$ with $s gt.eq s_R$, let $cal(U)_s$ be any subcollection of the depth-$s$ cells of $R$. In particular fix an integer $ell$ and retain only those $s$ for which $s + ell$ and $s + ell + 1$ are in the projection range. Then 
#[#set math.equation(numbering: n => "(4.12)")
 $ sum_s sum_(I in cal(U)_s) \| I \| thin parallel \( P_(s + ell + 1) - P_(s + ell) \) F_s parallel_(2 \, I)^2 lt.eq frak(C)_D^2 \| R \| . $ <eq:row-increment>]

 For every integer $L gt.eq 0$, retaining only $s in sans(S)$ with $s gt.eq s_R$ for which $s$ and $s + L$ are in the projection range, 
#[#set math.equation(numbering: n => "(4.13)")
 $ (sum_s sum_(I in cal(U)_s) \| I \| thin parallel \( P_(s + L) - P_s \) F_s parallel_(2 \, I)^2)^(1 \/ 2) lt.eq L frak(C)_D \| R \|^(1 \/ 2) lt.eq \( 1 + L \) frak(C)_D \| R \|^(1 \/ 2) . $ <eq:row-delay>]

]
] <cor:row-projections>

#proof[
  The range of $P_h$ is contained in the range of $P_(h + 1)$: restrict a constant-coefficient combination on $Q$ to its children and use inheritance. Thus the $P_h$ are nested orthogonal projections. For $r lt.eq t$, $P_t - P_r$ is an orthogonal projection, and the projections corresponding to intervals with disjoint interiors have pairwise orthogonal ranges.
  For a cell $Q in cal(P)_r$, both $P_r$ and $P_t$ commute with multiplication by $upright(bold(1))_Q$, since both of their defining partitions refine $cal(P)_r$. The row
  $ A_(j \, Q) = \( P_(t_j) - P_(r_j) \) upright(bold(1))_Q : L^2 \( R \; cal(H) \) arrow.r L^2 \( R \; cal(H) \) \, #h(2em) Q in cal(P)_(r_j) \, $
  has both input and output supported in $Q$. Consequently
  $ sum_(Q in cal(P)_(r_j)) parallel A_(j \, Q) z parallel_2^2 = parallel \( P_(t_j) - P_(r_j) \) z parallel_2^2 \, #h(2em) sum_(j \, Q) parallel A_(j \, Q) z parallel_2^2 lt.eq parallel z parallel_2^2 . $
  This establishes the joint Bessel bound after the splitting. The adjoint of $A_(j \, Q)$ is $upright(bold(1))_Q \( P_(t_j) - P_(r_j) \)$. On a cell of $cal(P)_(t_j)$ its first term is a constant-coefficient combination there, while its second term is the restriction of such a combination on an $r_j$-cell. Both use labels available on the $t_j$-cell. Therefore the support and observation partitions in Lemma 18 are $cal(P)_(r_j)$ and $cal(P)_(t_j)$, respectively. The stated order of intervals gives the required refinement, and Lemma 18 with $B = 1$ proves Equation (4.11). Summing the estimates for $frak(m)$ subfamilies proves the overlap version. After discarding the zero increments $r = t$, intervals with edge overlap $frak(m)$ can be so divided by the usual greedy coloring in increasing left endpoint, whenever the reads in that order are nondecreasing: at a left endpoint fewer than $frak(m)$ colors are occupied by earlier intervals whose right endpoints are still larger.
  For fixed $ell$, the intervals $\[ s + ell \, s + ell + 1 \]$ are consecutive and their reads $s$ increase. Apply Equation (4.11). At each $s$ the cells in $cal(U)_s$ are disjoint, and $\| I \| parallel z parallel_(2 \, I)^2 = parallel upright(bold(1))_I z parallel_2^2$. Restricting the outputs to those cells can only decrease their squared sum, which proves Equation (4.12). Finally,
  $ \( P_(s + L) - P_s \) F_s = sum_(ell = 0)^(L - 1) \( P_(s + ell + 1) - P_(s + ell) \) F_s . $
  Minkowski’s inequality in the Hilbert direct sum over $\( s \, I \)$ and Equation (4.12) prove Equation (4.13). For $L = 0$ both sides of its first inequality are zero. ◻
]

=== 4.4 Smooth rows with fixed carriers <smooth-rows-with-fixed-carriers>

The remaining rows have smooth mean-zero test functions on their support cells, multiplied by a fixed function that may oscillate arbitrarily. Dyadic differences make their coefficients constant on finer cells. Private coordinates can then be adjoined at a controlled cost.

#thm([Lemma 4.6.])[
  (Smooth mean-zero rows on depth inputs).  #emph[Let $R$ be a finite dyadic root and let $cal(N)$ be a finite set of carrier labels. For each $nu in cal(N)$ fix one measurable function $m_nu : R arrow.r bb(C)$ with $parallel m_nu parallel_oo lt.eq 1$. This function is the same for every interval using the label $nu$. Let $cal(E)$ be a finite set of pairs $\( I \, nu \)$, where $I subset R$ is a dyadic interval of depth $s \( I \)$ and $nu in cal(N)$. Thus at most one row is selected for a given pair $\( I \, nu \)$.]
  #emph[For each selected pair, let $omega_(I \, nu) in C^1 \( overline(I) \)$ satisfy 
$ integral_I omega_(I \, nu) \( y \) thin d y = 0 \, #h(2em) parallel omega_(I \, nu) parallel_oo + \| I \| parallel omega'_(I \, nu) parallel_oo lt.eq A $

 for one $A gt.eq 0$. Suppose the selected physical rows 
$ cal(W)_(I \, nu) f = \| I \|^(- 1 \/ 2) integral_I m_nu \( y \) omega_(I \, nu) \( y \) f \( y \) thin d y $

 satisfy, for one $B_H gt.eq 0$, 
$ sum_(\( I \, nu \) in cal(E)) \| cal(W)_(I \, nu) f \|^2 lt.eq B_H^2 parallel f parallel_(L^2 \( R \))^2 #h(2em) \( f in L^2 \( R \) \) . $

 Let the scalar functions $\( f_s \)_(s in sans(S))$ satisfy Equation (4.1), with absolute values in place of Hilbert norms, and assume that every $s \( I \)$ belongs to $sans(S)$. Put 
$ d = 2 + \# cal(N) \, #h(2em) h_0 = ceil.l 10 log_2 \( 2 d \) ceil.r . $

 Then 
#[#set math.equation(numbering: n => "(4.14)")
 $ (sum_(\( I \, nu \) in cal(E)) \| cal(W)_(I \, nu) f_(s \( I \)) \|^2)^(1 \/ 2) & lt.eq frak(C)_d [\( h_0 + 1 \) \( B_H + 3 A \) + 2 A sqrt(d) thin \( h_0 + 3 \) 2^(- h_0)] \| R \|^(1 \/ 2)\
 & lt.eq 760 \( B_H + A \) #scale(x: 120%, y: 120%)[\(] log_2 \( 2 d \) #scale(x: 120%, y: 120%)[\)]^2 \| R \|^(1 \/ 2) . $ <eq:smooth-depth>]

 The estimate uses only the displayed Bessel inequality for the selected set $cal(E)$, not for any larger array of intervals and carriers.]
] <lem:smooth-depth>

#proof[
  The assertion is immediate if $cal(E)$ is empty. Extend each $omega_(I \, nu)$ by zero off $I$. Let $bb(E)_h$ be dyadic conditional expectation on the full depth-$h$ partition of $R$; we use it for every integer $h gt.eq s_R$. These are nested orthogonal projections in $L^2 \( R \)$. For $s = s \( I \)$, exact mean zero and the zero extension give $bb(E)_s overline(omega_(I \, nu)) = 0$. Define the difference pieces for $h gt.eq 1$ and the initial sum by
  $ q_(I \, nu \, h) & = \| I \|^(- 1 \/ 2) \( bb(E)_(s + h) - bb(E)_(s + h - 1) \) overline(omega_(I \, nu)) quad \( h gt.eq 1 \) \,\
q_(I \, nu \, 0) & = \| I \|^(- 1 \/ 2) bb(E)_(s + h_0) overline(omega_(I \, nu)) = sum_(h = 1)^(h_0) q_(I \, nu \, h) . $
  Every $q_(I \, nu \, h)$ is supported in $I$, and for $h gt.eq 1$ it is constant on depth-$\( s + h \)$ cells and lies in the martingale difference space $"range" \( bb(E)_(s + h) - bb(E)_(s + h - 1) \)$. The initial sum is constant on depth-$\( s + h_0 \)$ cells. The zero extension causes no difficulty: cells at these depths do not cross the boundary of $I$.
  On a child of a depth-$\( s + h - 1 \)$ cell, the difference between its average of $omega_(I \, nu)$ and the parent’s average is at most the oscillation on the parent. The derivative bound therefore gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ parallel q_(I \, nu \, h) parallel_2 lt.eq 2 A thin 2^(- h) #h(2em) \( h gt.eq 1 \) . $ <eq:smooth-difference-size>]
  For a fixed $nu$ and $h$, these functions are pairwise orthogonal as $I$ varies through the selected pairs. Indeed, different support depths give different martingale difference spaces. At one depth the distinct intervals are disjoint, and there is at most one selected row for $\( I \, nu \)$. Thus their analysis operator has norm at most $2 A 2^(- h)$. Since multiplication by the one fixed $m_nu$ is a contraction, the physical lag-$h$ rows, whose adjoints are $q_(I \, nu \, h) overline(m_nu)$, have joint operator norm at most
  #[#set math.equation(numbering: n => "(4.16)")
   $ B_(upright("phys") \, h) lt.eq 2 A sqrt(\# cal(N)) thin 2^(- h) lt.eq 2 A sqrt(d) thin 2^(- h) . $ <eq:smooth-physical-lag>]
  This argument uses the fixedness and boundedness of $m_nu$, and requires no regularity or frequency separation for it.
  The derivative bound implies uniform convergence on $I$ of $bb(E)_(s + H) omega_(I \, nu)$ to $omega_(I \, nu)$ as $H arrow.r oo$. Consequently
  $ \| I \|^(- 1 \/ 2) overline(omega_(I \, nu)) = q_(I \, nu \, 0) + sum_(h > h_0) q_(I \, nu \, h) . $
  The associated physical row series also converges in operator norm, by Equation (4.16). Subtracting its tail from the original selected row operator therefore proves
  $ B_(upright("phys") \, 0) lt.eq B_H + 2 A sqrt(\# cal(N)) thin 2^(- h_0) lt.eq B_H + A . $
  For the last inequality use $2^(- h_0) lt.eq \( 2 d \)^(- 10)$ and $d gt.eq 2$.
  Adjoin one private direction for each complete carrier. Specifically take $cal(H)^(upright("aug")) = bb(C) xor ell^2 \( cal(N) \)$ and the root-born columns
  $ Phi_nu \( y \) = \( overline(m_nu \( y \)) \, upright(bold(e))_nu \) \, #h(2em) y in R . $
  Their norms are at most $sqrt(2)$, their private constants have size one, and the number of labels on any path is $\# cal(N) lt.eq d$. They satisfy Equation (4.3) with $D = d$. For $h = 0$ and for $h > h_0$, define the augmented scalar row by
  $ tilde(cal(W))_(I \, nu \, h) Z = chevron.l Z \, q_(I \, nu \, h) Phi_nu chevron.r_(L^2 \( R \; cal(H)^(upright("aug")) \)) . $
  Write $tilde(cal(W))_h$ for the joint operator consisting of these rows over $\( I \, nu \) in cal(E)$. The adjoint of the individual row sends $c$ to $c thin q_(I \, nu \, h) Phi_nu$. On a physical input $Z = \( f \, 0 \)$,
  $ tilde(cal(W))_(I \, nu \, h) \( f \, 0 \) = chevron.l m_nu f \, q_(I \, nu \, h) chevron.r_(L^2 \( R \)) \, $
  which is exactly the physical row for the corresponding bump piece.
  For a private input $z = \( z_nu \)_(nu in cal(N))$, the lag-$h$ analysis map has entries $chevron.l z_nu \, q_(I \, nu \, h) chevron.r$. The fixed-$nu$ orthogonality already proved, followed by orthogonality of the private coordinates, gives its norm at most $2 A 2^(- h)$. The physical and private input summands are orthogonal. Applying Cauchy–Schwarz to their two norm bounds and using Equation (4.16) gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ parallel tilde(cal(W))_h parallel lt.eq 2 A sqrt(\# cal(N) + 1) thin 2^(- h) lt.eq 2 A sqrt(d) thin 2^(- h) #h(2em) \( h > h_0 \) . $ <eq:smooth-augmented-lag>]
  For the initial sum, the identity $q_(I \, nu \, 0) = sum_(h = 1)^(h_0) q_(I \, nu \, h)$ and the operator triangle inequality bound its private part by $2 A sum_(h = 1)^(h_0) 2^(- h) lt.eq 2 A$. Its physical part has the bound $B_H + A$ above. Thus
  #[#set math.equation(numbering: n => "(4.18)")
   $ parallel tilde(cal(W))_0 parallel lt.eq B_H + 3 A . $ <eq:smooth-augmented-main>]
  The two pieces, each indexed by the same selected set $cal(E)$, have the following data:
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Piece
], table.cell(rowspan: 1, colspan: 1)[Observation depth
], table.cell(rowspan: 1, colspan: 1)[Joint augmented operator norm
], table.cell(rowspan: 1, colspan: 1)[Residue modulus for support depths
]),
  table.cell(rowspan: 1, colspan: 1)[Initial sum $q_0$
], table.cell(rowspan: 1, colspan: 1)[$s + h_0$
], table.cell(rowspan: 1, colspan: 1)[$B_H + 3 A$
], table.cell(rowspan: 1, colspan: 1)[$h_0 + 1$
],
  table.cell(rowspan: 1, colspan: 1)[Lag $q_h$, $h > h_0$
], table.cell(rowspan: 1, colspan: 1)[$s + h$
], table.cell(rowspan: 1, colspan: 1)[$2 A sqrt(d) thin 2^(- h)$
], table.cell(rowspan: 1, colspan: 1)[$h + 1$
],
)
]
  For either piece, let $ell$ denote its observation offset, namely $h_0$ or $h$. Each row is supported on its whole cell $I$ of depth $s = s \( I \)$, and its adjoint coefficient is constant on depth-$\( s + ell \)$ cells. Divide the selected support depths into residue classes modulo $ell + 1$. Within one class, group all selected rows of one depth $s$ in one round, using the full depth-$s$ support partition and the full depth-$\( s + ell \)$ observation partition of $R$; unused cells carry no rows. Successive support depths differ by at least $ell + 1$, so the next support partition refines the preceding observation partition. All rows in a round read the same $F_s = \( f_s \, 0 \)$, and these indices increase in $sans(S)$. The catalog has $D = d$, and restricting either displayed array to a residue class preserves its operator bound. Lemma 18 therefore applies in each of the at most $ell + 1$ classes.
  Write $V_0 in ell^2 \( cal(E) \)$ for the outputs of the initial sum on their respective $F_(s \( I \))$, and $V_h in ell^2 \( cal(E) \)$ for the analogous lag-$h$ vector. Extending each residue-class vector by zero to the full selected row space and using its triangle inequality yields
  $ parallel V_0 parallel_(ell^2 \( cal(E) \)) lt.eq \( h_0 + 1 \) frak(C)_d \( B_H + 3 A \) \| R \|^(1 \/ 2) \, #h(2em) parallel V_h parallel_(ell^2 \( cal(E) \)) lt.eq \( h + 1 \) frak(C)_d thin 2 A sqrt(d) thin 2^(- h) \| R \|^(1 \/ 2) . $
  These bounds are summable over $h > h_0$. The uniform bump expansion gives rowwise $cal(W)_(I \, nu) f_(s \( I \)) = \( V_0 \)_(I \, nu) + sum_(h > h_0) \( V_h \)_(I \, nu)$. There are finitely many selected rows; alternatively the last summable bounds give convergence directly in their Hilbert sum. Minkowski’s inequality and
  $ sum_(h > h_0) \( h + 1 \) 2^(- h) = \( h_0 + 3 \) 2^(- h_0) $
  prove the first inequality in Equation (4.14). For its last inequality put $l = log_2 \( 2 d \) gt.eq 2$. Then $h_0 + 1 lt.eq 11 l$, $h_0 + 3 lt.eq 12 l$, and $sqrt(d) thin 2^(- h_0) lt.eq 1$. The bracket there is at most $57 \( B_H + A \) l$, while $frak(C)_d lt.eq \( 40 \/ 3 \) l$. Their product is at most $760 \( B_H + A \) l^2$, as asserted. ◻
]

== 5 The base reduction with varying depth inputs <sec:base>

We prove Theorem 11 by adapting the local-form construction of #cite(label("H")) Sections 3–10. The scalar analytic and finite combinatorial estimates remain those of H. The row estimates of Section 4 replace the uses of one original input at different depths. This section constructs the tuple to which the later localization applies: cyclic approximations first give a tuple $X$, delayed high fits replace it by $Y$, and the decomposition $Y = B + U$ leaves three active patterns.

Fix the root $J$, finite tree $cal(T)$, original summation collection $cal(I)$, and four input schedules of Theorem 11. Write $s \( I \) = log_2 \( \| J \| \/ \| I \| \)$. On every subroot $R$, the spatial origin $s_R$ of Section 4 is $s \( R \)$; a restart does not reset depth. The actual augmented input is $F_(j \, s) = \( f_(j \, s) \, 0 \)$. Finitely needed temporal indices beyond the schedule use its nearest endpoint value, while the spatial inputs remain zero outside $J$. In the local forms put $y_j = x + j t$, $0 lt.eq j lt.eq 3$, and use the normalized norms of Definition 10. Only physical components enter a form. The notation $upright("(H.n)")$ denotes Equation $\( n \)$ of H.

Fix provisionally one $q$ with $2 < q < 3$. Section 7 will choose a single value satisfying both arguments’ degree restrictions and run H’s fixed-input proof at that exponent. Polynomial degrees below are absolute; their coefficients and the lower accuracy threshold may depend on $q \, c_0 \, C_0$. Accuracy indices $t$ are independent of spatial depths $s \, h$.

=== 5.1 Inputs, source columns, and the row estimate <inputs-source-columns-and-the-row-estimate>

Lemma 15 and Equation (4.2) give, on every subroot $R subset.eq J$,

#[#set math.equation(numbering: n => "(5.1)")
 $ parallel F_(j \, s) parallel_(p \, I) lt.eq 1 \, #h(2em) parallel upright(bold(1))_R F_(j \, s) parallel_2 lt.eq \| R \|^(1 \/ 2) quad \( 1 lt.eq p lt.eq oo \) \,\
sum_(\[ r \, t \]) parallel upright(bold(1))_R \( F_(j \, t) - F_(j \, r) \) parallel_2^2 lt.eq 5 a \| R \| . $ <eq:h-input-size>]

The first bound holds on every descendant $I$ and every prescribed or finitely extended input index. The second holds for depth intervals with edge overlap at most $a$. Restriction to a subroot, a nondecreasing subsequence, and repeated reads preserve these conclusions. Each slot retains its own full block schedule. We also use the #emph[Local absolute estimate] Lemma of #cite(label("H")) Section 2:

$ \| H_I \( z_0 \, z_1 \, z_2 \, z_3 \) \| lt.eq C product_(j = 0)^3 parallel z_j parallel_(p_j \, I) \, #h(2em) p_j gt.eq 1 \, quad sum_j p_j^(- 1) lt.eq 2 . $

The scalar labels are restrictions to their birth cells of the bounded quadratic chart atoms in the #emph[Quadratic chart atom] Definition of #cite(label("H")) Section 4. We use exactly that source-defined class and complexity: $H gt.eq e^2$ bounds the chart dimension by $log H$, the rational matrix height and amplitude support by $H$, and the amplitude derivatives by the fixed bounds in that Definition. The real quadratic, linear, and horizontal oscillation parameters are unrestricted. A bounded atom has supremum norm at most one, with scalar normalization factors kept in the external coefficients. The #emph[Elementary chart operations] Lemma of #cite(label("H")) Section 4 permits conjugation, bounded products, and affine changes of the real argument with a quasipolynomial complexity change. We write $e \( v \) = exp \( 2 pi i v \)$.

For a birth label $v$, write $Phi_v = \( phi_v \, sqrt(epsilon.alt_v) upright(bold(e))_v \)$, with the persistent birth cell and distinct private direction of Section 4. A joint budget $D gt.eq 2$ means exactly Equation (4.3), including every available label on a path. Lemma 16, equivalently the #emph[Coefficient and projection bounds] Lemma of #cite(label("H")) Section 3, gives for constant coefficients on a cell $I$ where the labels are available

#[#set math.equation(numbering: n => "(5.2)")
 $ D^(- 1) parallel c parallel_(ell^2) lt.eq ∥sum_v c_v Phi_v \( y \)∥ lt.eq D^(3 \/ 2) parallel c parallel_(ell^2) quad upright("for almost every ") y in I . $ <eq:h-column-bounds>]

Let $P_(I \, cal(V))$ denote the local orthogonal projection onto the constant-coefficient span of an available mask $cal(V)$. The same source Lemma gives

$ parallel P_(I \, cal(V)) z parallel_(oo \, I) lt.eq D^5 integral -_I parallel z parallel \, #h(2em) integral -_I #scale(x: 120%, y: 120%)[\(] f - \( P_(I \, cal(V)) \( f \, 0 \) \)_(upright("phys")) #scale(x: 120%, y: 120%)[\)] overline(phi_v) = epsilon.alt_v c_v \, $

where $c_v$ is that projection’s coefficient. Inherited masks retain their admitted labels on children; their full-partition direct sums are nested orthogonal projections. At a summation cut, the continuation convention of #cite(label("H")) Section 3 retains the old labels and locally refits them on every finer cell needed for the old summands. A new attempt may use a separate family. On a subroot, Lemma 16 rebases inherited labels without changing their private constants. These are local refits of the retained spans.

For every fixed realized finite row array and catalog satisfying Lemma 18, with ordinary Bessel norm $B$, that Lemma gives

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_nu parallel B_nu F_(j \, s \( nu \)) parallel^2 lt.eq C B^2 log^2 \( 2 D \) \| R \| . $ <eq:h-row-use>]

The read $s \( nu \)$ is common to its round and nondecreasing between rounds. The realized rows and catalog may have been selected using the schedules; they are fixed while the ordinary operator inequality is tested on arbitrary inputs.

=== 5.2 One capped trial and cyclic adaptive fits <one-capped-trial-and-cyclic-adaptive-fits>

For a physical residual $r$ in slot $j$, let $frak(d)_(j \, I) \( r \)$ be the supremum of the form against two normalized $L^2 \( I \)$ inputs and one normalized $L^q \( I \)$ input in the other slots, with the $L^q$ slot arbitrary. The #emph[Local detection] Lemma of #cite(label("H")) Section 4 says that if $C_1 gt.eq 1$, $0 < delta < 1 \/ 2$, $parallel r parallel_(2 \, I) lt.eq C_1$, and $frak(d)_(j \, I) \( r \) > delta$, there is a bounded chart atom $phi$ such that

$ lr(|integral -_I r overline(phi)|) gt.eq rho \, #h(2em) log \( 1 \/ rho \) \, med log \( "complexity" \( phi \) \) lt.eq C_q #scale(x: 120%, y: 120%)[\(] 1 + log C_1 + log \( 1 \/ delta \) #scale(x: 120%, y: 120%)[\)]^C . $

We may decrease $rho$ to lie in $\( 0 \, 1 \]$. The form norm of two specified factors below is the supremum against two normalized $L^2 \( I \)$ inputs in their complementary slots.

#thm([Lemma 5.1.])[
  (One capped insertion trial).  #emph[Let $R$ be an attempt root with a restricted normalized input schedule $F_s$. Let the candidate request cells belong to a fixed finite original request tree below $R$. Fix $0 < rho lt.eq 1$, $D_0 gt.eq 2$, and an integer cap $T gt.eq 1$. Process candidates in nondecreasing request-cell depth, allowing repetitions at one cell. Stop before the first request that would exceed $T$ successful requests on its spatial path, and remove that cut cell and its candidate descendants from the trial.]
  #emph[For each successful request $v$ at $I_v$, suppose there is a set $cal(R)_v$ of charged row indices, with these sets pairwise disjoint, such that 
$ sum_(nu in cal(R)_v) parallel Delta_nu F_(s \( nu \)) parallel_2^2 gt.eq c rho^2 \| I_v \| . $

 Assume all charged rows are a Bessel-norm-one subfamily of one realized finite nested sequence of full-partition projections and satisfy every hypothesis of Lemma 18. Suppose its completed catalog has budget 
$ D_T lt.eq C D_0 \( T + 1 \)^C \, $

 where $D_0$ includes all predetermined columns, including their future admissions on this attempt. Then the disjoint first-excess cells $cal(C)_T$, which are original request-tree cells, obey 
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(I in cal(C)_T) \| I \| lt.eq C T^(- 1) rho^(- 2) log^2 \( 2 D_T \) \| R \| . $ <eq:hbase-trial-cut>]

 If 
$ a = 1 + log \( 2 D_0 \) + log \( 1 \/ rho \) \, #h(2em) T = ⌈C_(*) rho^(- 4) \( 1 + a \)^8⌉ \, $

 then a sufficiently large fixed $C_(*)$ makes the right side at most $\| R \| \/ 4$, and $log \( 2 T \) lt.eq C \( a + log C_(*) \)$.]
] <lem:hbase-trial>

#proof[
  Freeze the completed rows and catalog. By their disjoint ownership and Equation (5.3),
  $ c rho^2 sum_v \| I_v \| lt.eq sum_(nu med upright("charged")) parallel Delta_nu F_(s \( nu \)) parallel_2^2 lt.eq C log^2 \( 2 D_T \) \| R \| . $
  Set $n \( y \) = \# { v : y in I_v }$. Earlier request cells meeting a candidate contain it or equal it, because request depths are nondecreasing. Thus their count is constant on that candidate. Each first-excess cell lies in ${ n gt.eq T }$, and removing its subtree makes these cells disjoint. Tonelli’s identity $integral_R n = sum_v \| I_v \|$ proves Equation (5.4).
  For the stated cap, the budget bound gives $log \( 2 D_T \) lt.eq C' \( a + log C_(*) \)$. Consequently the coefficient in Equation (5.4) is at most
  $ C C_(*)^(- 1) rho^2 \( 1 + a \)^(- 8) \( a + log C_(*) \)^2 \, $
  which is at most $1 \/ 4$ for fixed sufficiently large $C_(*)$. The logarithmic cap bound follows from the same formula. ◻
]

We realize the Lemma’s nested sequence in both applications by one rule. At each projection depth, refine and locally refit the entire root partition, admit the predetermined columns prescribed there, and then perform simultaneous insertion rounds. Cells with no request retain their projections. The next depth refines the entire partition, including branches with no later tests for this attempt. Refinements, admissions, and identity transitions remain in the nested sequence. Splitting an insertion increment on all cells of its partition preserves its joint Bessel norm, by the splitting identity in Corollary 19. The following two applications specify the charged supports, observations, and reads.

Apply this construction first to the #emph[Inherited adaptive approximation] Lemma of #cite(label("H")) Section 5, at accuracy $e^(- k)$, for the fixed provisional $q$ and sufficiently large $k$. Every attempt starts with an empty fit catalog. On an assigned original candidate cell $I$ of depth $s$, test

$ r = f_(j \, s) - \( P F_(j \, s) \)_(upright("phys")) \, $

where $P$ is the current local projection. Contraction gives $parallel r parallel_(2 \, I) lt.eq 2$. On failure of the $frak(d)_(j \, I)$ test, Local detection supplies a bounded atom with moment $rho$, where $log \( 1 \/ rho \) lt.eq k^(O \( 1 \))$. Adjoin $\( phi \, upright(bold(e))_v \)$ with a fresh private direction and refit. For the new projection $P^(+)$,

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel \( P^(+) - P \) F_(j \, s) parallel_(L^2 \( I \))^2 gt.eq frac(lr(|integral_I \( f_(j \, s) - \( P F_(j \, s) \)_(upright("phys")) \) overline(phi)|)^2, parallel \( phi \, upright(bold(e))_v \) parallel_(L^2 \( I \))^2) gt.eq c rho^2 \| I \| . $ <eq:hbase-fresh-gain>]

Indeed, projection of the fresh column off the old span preserves its pairing with the old residual and can only reduce its norm.

Here each request owns its insertion row on $I$. The support and observation partitions are the full depth-$s$ partition, and every round at this depth reads $F_(j \, s)$. Their refinement and read order therefore satisfy Lemma 18. The initial budget $D_0$ is fixed, and a path cap $T$ adds at most $T$ bounded columns of private weight one, giving the required polynomial budget $D_T$. Lemma 21 makes the cut cells have total length at most one quarter of the attempt root.

On every child root the restricted schedule is still normalized; the fit again starts with no columns and has the same detection, gain, full-partition chronology, and budget. The one-trial Lemma therefore applies anew. Its length bound prevents a child from cutting itself, so all new roots are proper original request-tree descendants. The finite recursion terminates, and the attempt-root lengths sum to at most $sum_(n gt.eq 0) 4^(- n) \| R \| = 4 \| R \| \/ 3$, as in H’s packing argument. Each original summand belongs to one attempt. The old projection family continues by inheritance and local refitting only for its old summands and their operator estimates.

On a retained cell the fit has passed:

$ g_I = P_I F_(j \, s) \, #h(2em) frak(d)_(j \, I) #scale(x: 120%, y: 120%)[\(] f_(j \, s) - \( g_I \)_(upright("phys")) #scale(x: 120%, y: 120%)[\)] lt.eq e^(- k) \, #h(2em) parallel g_I parallel_(2 \, I) lt.eq 1 . $

Within a segment, masks are inherited. The cap and Local detection bound path counts and atom complexities by $exp \( k^(O \( 1 \)) \)$. Private weights are one, so the coefficient $ell^2$ norm is at most the normalized projection norm; Cauchy–Schwarz over the path labels gives the same $exp \( k^(O \( 1 \)) \)$ physical supremum bound. All these statements hold anew on a normalized subroot.

We now use these fits cyclically in all four slots. Let $iota \( t \) = \( t - 1 \) med mod med 4$ be the slot updated at accuracy level $t$. Choose an absolute $A > 1$, a sufficiently large initial $k_1$, and set $k_(t + 1) = k_t^A$. Write $g_(t \, I) = P_I^t F_(iota \( t \) \, s)$ for the fit at level $t$, and set $g_(t - 4 \, I) = 0$ before that slot’s first update. For any fixed bounded number of levels, intersect their segment families. Every common root is a root of one constituent family or the original root, so their total length remains bounded.

#thm([Lemma 5.2.])[
  (The two earliest increments on depth inputs).  #emph[On each original summation cell $I$, put $s = s \( I \)$, its original spatial depth in $J$. At a finite terminal level $n$, write $g_(e \, n \, I)$ for the last fit in slot $e$ at or before $n$, or zero if there is none, and put $r_(e \, n \, I) = F_(e \, s) - g_(e \, n \, I)$. For $u < t$ with $iota \( u \) = i eq.not j = iota \( t \)$, let $a \, b$ be the other slots and set 
#[#set math.equation(numbering: n => "(5.6)")
 $ X_i^(u \, t) & = g_(u \, I) - g_(u - 4 \, I) \, & X_j^(u \, t) & = g_(t \, I) - g_(t - 4 \, I) \,\
X_a^(u \, t) & = F_(a \, s) - g_(a \, upright("prev") \, I) \, & X_b^(u \, t) & = F_(b \, s) - g_(b \, upright("prev") \, I) . $ <eq:hbase-X>]

 Here $g_(e \, upright("prev") \, I)$ is the last fit in slot $e$ strictly before $t$, or zero. In original slot order, 
#[#set math.equation(numbering: n => "(5.7)")
 $ H_I \( F_(dot.op \, s) \) = sum_(1 lt.eq u < t lt.eq n\
iota \( u \) eq.not iota \( t \)) H_I \( X_I^(u \, t) \) + upright("Rem")_(n \, I) \, #h(2em) sum_(I in cal(U)) \| I \| \| upright("Rem")_(n \, I) \| arrow.r 0 $ <eq:hbase-X-remainder>]

 for every fixed finite $cal(U) subset.eq cal(I)$. The remainder is the term with four $r_(e \, n \, I)$’s plus, for each slot $e$, the term with $g_(e \, n \, I)$ there and $r_(l \, n \, I)$ in the other three slots.]
  #emph[For sufficiently large $A$, there is an absolute $0 < theta_0 < A^(- 7) < 1$ such that, whenever $t gt.eq 12$, every pair of factors $X_l^(u \, t)$ has form norm at most $e^(- 2 k_t^(theta_0))$. All four factors have bounded normalized $L^2 \( I \)$ size.]
] <lem:hbase-X-output>

#proof[
  This is the algebra and per-cell comparison of the #emph[The two-earliest-increments expansion] Lemma of #cite(label("H")) Section 5, now using the one operand $F_(e \, s)$ throughout each cell. For a finite $n$, decompose each $F_(e \, s)$ into its slot’s increments $g_t - g_(t - 4)$ through $n$ and the terminal residual $r_(e \, n \, I)$. In a term with at least two increments, record the earliest two levels $u < t$. In each other slot, the sum of every later increment and its terminal residual is exactly $F_(e \, s) - g_(e \, upright("prev") \, I)$. Terms with at most one increment sum to the stated remainder. This proves the finite identity.
  For updates $v > w$ in distinct slots, replacing their pair of projections by their actual inputs has form-norm error at most
  #[#set math.equation(numbering: n => "(5.8)")
   $ C_q #scale(x: 120%, y: 120%)[\(] e^(- k_v) exp \( C_q k_w^(d_(upright("det"))) \) + e^(- k_w) #scale(x: 120%, y: 120%)[\)] \, $ <eq:hbase-pair-comparison>]
  where $d_(upright("det"))$ is absolute. First test the residual at $v$ against the physical supremum bound of $g_w$ as the $L^q$ opponent, then test the residual at $w$ against the normalized actual input. Choose $A > d_(upright("det"))$ with fixed reserve. The same calculation with an actual input in one position makes the form norm of two terminal residuals tend to zero. The two remaining factors of each remainder term have bounded $L^2$ size. Since $cal(U)$ is finite, its absolute remainder sum tends to zero.
  For the pair bound assume $t gt.eq 12$. Each of $X_j \, X_a \, X_b$ has coefficient sum zero after its existing fitted operands are replaced by the corresponding actual input: their preceding fits occur at $t - 4$ and, for $a \, b$, among $t - 3 \, t - 2 \, t - 1$, so all exist. Thus every pair contains a cancelling later factor; the early $X_i$ need not cancel when $u lt.eq 4$. If $u < t - 4$, consider a later factor $V$ paired with $X_i = g_u - g_(u - 4)$. Each existing fitted operand in $V$ has index at least $t - 4$. For each existing earlier fitted operand $g_w$, with $w in { u \, u - 4 }$, write the pairing with $V$ as the signed sum of pairings of $g_w$ with the later residuals $g_v - F$; the actual-input terms cancel because those coefficients sum to zero. Testing these later residuals against $g_w$ costs at most $C_q e^(- k_v) exp \( C_q k_w^(d_(upright("det"))) \)$, and $v > w$. Pairs excluding $i$ have no projection index below $t - 4$.
  If $u gt.eq t - 4$, the distinct cyclic slots imply $u gt.eq t - 3$. Every existing fitted operand in the tuple then has index at least $t - 7$. For such a pair, and for the pairs excluding $i$ in the preceding case, expand into projection/actual pairs and apply Equation (5.8). The two-actual contribution vanishes because at least one factor has coefficient sum zero. The bounded number of errors is at most $C_q e^(- c_q k_(t - 7))$. Since $k_(t - 7) = k_t^(A^(- 7))$, the stated choice of $theta_0$ gives the required bound for large $k_1$. Contraction and the triangle inequality give the local sizes. ◻
]

=== 5.3 The high replacement target <the-high-replacement-target>

Fix one tuple from Equation (5.6), put $k = k_t$, and write $J_0$ for the normalized root on which its construction is run (initially $J_0 = J$). Let $cal(I)_0 subset.eq cal(I)$ be the original summands under consideration on $J_0$. The original request-tree candidates are those already fixed for this construction. Fix a common segment of its older fit families. The positions $i \, j$ are now called low because their two signed fitted differences will be expanded into original scalar labels. In the residual positions $e = a \, b$, we seek an integer $K_0$ and further inherited projections for which

$ X_e = F_(e \, s) - g_(e \, upright("prev") \, I) quad upright("can be replaced by") quad P_(e \, s + K_0)^(upright("new")) F_(e \, s) - g_(e \, upright("prev") \, I) $

with summable error. A fixed label from each low position has a common birth root: the deeper birth cell, or the segment root when inherited there. Their fitted coefficients remain outside the scalar approximation. The following tools are stated for a generic fixed scalar pair, independently of the tuple notation.

=== 5.4 Two fixed scalar labels and their predictor list <two-fixed-scalar-labels-and-their-predictor-list>

Fix distinct slots $i \, j$, let $a \, b$ be the complementary slots, and fix bounded chart atoms $phi_i \, phi_j$ on their common birth root $J'$. Their two-input form is

$ cal(L)_I^(phi_i \, phi_j) \( z_a \, z_b \) := \| I \|^(- 2) integral_(bb(R)^2) w_I \( x \, t \) phi_i \( y_i \) phi_j \( y_j \) z_a \( y_a \) z_b \( y_b \) thin d x thin d t . $

For Hilbert-valued inputs, the displayed $z_e$ denotes its physical component. The #emph[Progression separation] Lemma of #cite(label("H")) Section 4 expands the scalar low product into terms $psi_a \( y_a \) psi_b \( y_b \) Q \( t \)$. With the scalar coefficient removed, $psi_a \, psi_b \, Q$ are fixed bounded chart atoms of complexity at most $H$; unrestricted fixed linear modulations do not enter $H$. For one such term define

$ H_I \( psi_a z_a \, psi_b z_b \; Q \) := \| I \|^(- 2) integral_(bb(R)^2) & w_I \( x \, t \) Q \( t \) psi_a \( y_a \) z_a \( y_a \)\
 & #h(2em) dot.op psi_b \( y_b \) z_b \( y_b \) thin d x thin d t . $

Choose the cutoff allowed by the #emph[Single-scale separation] Lemma of #cite(label("H")) Section 4 with

$ zeta in C_c^oo \( bb(R) \) \, #h(2em) 0 lt.eq zeta lt.eq 1 \, #h(2em) zeta = 1 med upright("on ") \[ - 1 \/ 3 \, 1 \/ 3 \] \, #h(2em) "supp" zeta subset \( - 1 \/ 2 \, 1 \/ 2 \) . $

This is permitted because $x \, x + 3 t in I$ on the kernel support imply $\| t \| \/ \| I \| lt.eq 1 \/ 3$. Set

$ A_r = sup_(xi in bb(R)) lr(|integral_(bb(R)) Q \( r u \) zeta \( u \) e \( - xi u \) thin d u|) . $

The normalization gives $0 lt.eq A_r lt.eq parallel zeta parallel_1 lt.eq 1$. The plateau also gives $integral zeta gt.eq 2 \/ 3$, so the source scalar test retains a uniform constant.

For a dyadic $K subset.eq J'$ and a selected finite use collection $cal(U) subset.eq cal(I)$ below $K$, call an opposing sequence $z_(e \, I)$ admissible on $K$ if

$ z_(e \, I) = sum_(ell = 1)^(m_e) c_(e \, ell) V_(e \, I)^ell \, #h(2em) m_e in { 0 \, 1 \, 2 \, 3 } \, #h(2em) \| c_(e \, ell) \| lt.eq 1 \, $

where the scalar coefficients $c_(e \, ell)$ are fixed independently of $I$ and $s \( I \)$, and each $V_(e \, I)^ell$ is one of these types:

$ F_(e \, s \( I \)) \|_I \, #h(2em) P_(e \, I) F_(e \, s \( I \)) \, #h(2em) Z_(e \, I) . $

All raw and projected constituents in slot $e$ use the same full normalized schedule $F_(e \, s)$; the two slots may have different schedules. Each projected constituent uses one inherited current family common to all its cells, with the finitely many families under a joint budget $D_(upright(h))$. Missing cells are completed by inheritance and local refitting. An energy constituent is supported on its cell and satisfies the total bound

$ sum_(I in cal(U)) \| I \| parallel Z_(e \, I) parallel_(2 \, I)^2 lt.eq L^2 \| K \| . $

Bilinearity and the triangle inequality reduce the estimates with two opponents to at most nine constituent pairs, and the delayed estimate to at most three opposing terms. These absolute factors are absorbed into constants. All families used in an operator estimate are fixed as realized families.

#thm([Lemma 5.3.])[
  (A separated scale sum on depth inputs).  #emph[For the fixed separated term above, let both opponents be admissible on $K$ with parameters $D_(upright(h)) \, L$. For $m in bb(Z)_(gt.eq 0)$, let $cal(U)_m subset.eq cal(U)$ consist of any selected cells on which $e^(- m - 1) < A_(\| I \|) lt.eq e^(- m)$. Then 
#[#set math.equation(numbering: n => "(5.9)")
 $ sum_(I in cal(U)_m) \| I \| \| H_I \( psi_a z_(a \, I) \, psi_b z_(b \, I) \; Q \) \| lt.eq e^(- m) "poly" #scale(x: 120%, y: 120%)[\(] 1 + m \, log \( 2 H \) \, log \( 2 D_(upright(h)) \) \, 1 + L #scale(x: 120%, y: 120%)[\)] \| K \| . $ <eq:hbase-scale-sum>]

 These bands cover every positive $A_(\| I \|)$. If $A_(\| I \|) = 0$, the corresponding two-input form vanishes.]
] <lem:hbase-scale>

#proof[
  Use the scalar construction and frequency estimates in the #emph[A scale sum for one separated term] Lemma of #cite(label("H")) Section 5. Put $cal(K) = 1 + m + log \( 2 H \)$. The #emph[Scale-wise Weyl alternative] and #emph[Chart expansion and uniform tails] Lemmas of #cite(label("H")) Section 4 produce phases
  $ e \( lambda_(*) t^2 + gamma t \) \, #h(2em) \| lambda_(*) \| r^2 lt.eq D_1 \, #h(2em) log D_1 lt.eq "poly" \( cal(K) \) . $
  The unscaled $lambda_(*) \, gamma$ are bounded-height rational evaluations of one fixed underlying parameter vector. This scalar construction is independent of the opponents.
  At one depth $s$, disjointness, contraction, and Equation (5.1) give
  $ sum_(I in cal(U)\
s \( I \) = s) parallel z_(e \, I) parallel_(L^2 \( I \))^2 lt.eq C \( 1 + L \)^2 \| K \| . $
  The energy case follows from its total square sum. Cauchy–Schwarz therefore bounds the sum of products of the two ordinary $L^2$ sizes by $C \( 1 + L \)^2 \| K \|$. The original single-scale bilinear norm is $C A_r$, so this handles the polynomially many exceptional scales in the source proof before expanding their coefficients. It also handles the effective-quadratic and center-replacement errors, whose scalar smooth-kernel weights have a small sum by the #emph[Height bins] Lemma of #cite(label("H")) Section 3.
  For the chart tails, the pooled conclusion of the #emph[Chart expansion and uniform tails] Lemma supplies a coefficient envelope for each fixed pair $\( lambda_(*) \, gamma \)$, uniformly over the allowed rational splittings and bounded slow data at different scales. Split
  $ e \( lambda_(*) t^2 \) = 1 + #scale(x: 120%, y: 120%)[\(] e \( lambda_(*) t^2 \) - 1 #scale(x: 120%, y: 120%)[\)] . $
  The second kernel has smooth-kernel norm at most $C \| lambda_(*) \| r^2 "poly" \( D_1 \)$. For this one fixed unscaled $lambda_(*)$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(r med upright("dyadic")\
\| lambda_(*) \| r^2 lt.eq D_1) \| lambda_(*) \| r^2 lt.eq C D_1 . $ <eq:hbase-quadratic-weight>]
  The terms are zero when $lambda_(*) = 0$; otherwise they form a geometric series of ratio $1 \/ 4$. The per-depth estimate handles this part. As in the source scale-sum proof, choose the pooled mass below $e^(- 2 m) \( 1 + D_1 \)^(- 2)$, with fixed polynomial reserve for the smooth-kernel costs, and then sum the fixed-pair envelopes.
  For the linear parts we now instantiate the smooth-row Lemma. In the coordinates $\( y_a \, y_b \)$, the two one-variable marginals of $w_I$ vanish. The double-primitive expansion in H’s #emph[A scale sum for one separated term] Lemma expresses it as a summable series of tensors of interior, exactly mean-zero smooth bumps. Their fixed-order derivative bounds grow polynomially in the full tensor index, while the tensor coefficients decay faster than every fixed polynomial.
  Fix one separated term, one opposing slot $e$, and one full tensor index. For a retained frequency $nu$, the complete carrier is
  $ m_nu \( y \) = e \( nu y \) psi_e \( y \) \, #h(2em) parallel m_nu parallel_oo lt.eq 1 \, #h(2em) cal(W)_(I \, nu) f = \| I \|^(- 1 \/ 2) integral_I m_nu \( y \) omega_(I \, nu) \( y \) f \( y \) thin d y . $
  The multiplier $psi_e$ is one fixed bounded function on the common birth root. Take the source-selected array on the original finite use collection below $J'$: it consists exactly of the retained intervals and their retained clump representatives, with at most one row for each $\( I \, nu \)$. The source proof gives the ordinary joint Bessel bound for this selected array, with squared bound polynomial in $cal(K)$ and polynomial dependence on the fixed tensor index. Let $B_H$ be its Bessel norm and $A_(upright("bump"))$ its common value-plus-scaled-derivative bound.
  The retained carrier catalog $cal(N)$ has $log \( 2 + \# cal(N) \) lt.eq "poly" \( cal(K) \)$. Indeed the chart dimension is at most $log H$; the logarithms of the rational heights and pooled truncation bounds are polynomial in $cal(K)$. Counting the resulting bounded integer and rational indices preserves a polynomial logarithm. This is the finite catalog supplied by the #emph[Chart expansion and uniform tails] Lemma and the source pooled truncation. Retain only rows whose intervals lie in $K$. Zero extension of an $L^2 \( K \)$ test to $J'$ preserves their ordinary Bessel bound. With $d_(upright("car")) = 2 + \# cal(N)$, Lemma 20 gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ (sum_(\( I \, nu \) in cal(E)) \| cal(W)_(I \, nu) f_(e \, s \( I \)) \|^2)^(1 \/ 2) lt.eq C \( B_H + A_(upright("bump")) \) log^2 \( 2 d_(upright("car")) \) \| K \|^(1 \/ 2) . $ <eq:h-smooth-use>]
  Thus the raw scheduled input costs only the stated polynomial. For the linear part of one tail pair, its frequency and multiplier are fixed before its absolute coefficient envelope is summed; the same argument uses its singleton complete carrier. A fixed predictor-list entry below is another singleton application.
  The #emph[Compression] Lemma of #cite(label("H")) Section 3 is an ordinary operator estimate. If $B_nu = B_nu upright(bold(1))_(u \( nu \))$ have joint Bessel norm $B$, and one common ordered list of inherited families $P^1 \, dots.h \, P^m$, with $m gt.eq 1$, has joint budget $D$, then
  #[#set math.equation(numbering: n => "(5.12)")
   $ (sum_nu parallel B_nu P_(u \( nu \))^m dots.h.c P_(u \( nu \))^1 g parallel^2)^(1 \/ 2) lt.eq B thin frak(C) \( m \, D \) parallel g parallel_2 \, #h(2em) frak(C) \( m \, D \) = #scale(x: 120%, y: 120%)[\(] C \( m + 1 \)^C log \( 2 D \) #scale(x: 120%, y: 120%)[\)]^(C \( m + 1 \)) . $ <eq:h-compression>]
  This is uniform in repeated decision cells and labels on disjoint branches. A nonempty product has adjoint range in catalog combinations on its whole decision cell; an empty product uses the original Bessel bound. Complements are expanded into fixed ordered products, and averages are restored with their total variation after compatible choices have been fixed.
  For a projected constituent, fix this selected array and its one inherited current family $P_e$, together with its persistent catalog of budget $D_(upright(h))$. Regard each physical row as a row on the augmented space by ignoring private coordinates. Its Bessel bound is unchanged. Compression with decision cell $I$ gives the ordinary norm $B_H frak(C) \( 1 \, D_(upright(h)) \)$ for $A_(I \, nu) = cal(W)_(I \, nu) P_(e \, I)$. Moreover
  $ A_(I \, nu) = A_(I \, nu) upright(bold(1))_I \, #h(2em) A_(I \, nu)^(*) = P_(e \, I) cal(W)_(I \, nu)^(*) \, $
  whose output is a constant-coefficient combination of available catalog columns on all of $I$. If the selected array is nonempty, list its support depths increasingly as $s_1 < dots.h.c < s_N$, group exactly its rows at each depth, and take both support and observation partitions to be the full depth-$s_n$ partition of $K$. Unused cells have no rows. These partitions refine in order and round $n$ reads $F_(e \, s_n)$. Lemma 18 therefore gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ (sum_(\( I \, nu \) in cal(E)) \| A_(I \, nu) F_(e \, s \( I \)) \|^2)^(1 \/ 2) lt.eq C B_H frak(C) \( 1 \, D_(upright(h)) \) log \( 2 D_(upright(h)) \) \| K \|^(1 \/ 2) . $ <eq:hbase-projected-rows>]
  The empty array is trivial. An energy constituent instead uses H’s per-interval Bessel bound over separated centers and its total square sum.
  The source Fourier-supremum test bounds each combined clump coefficient by $O \( e^(- m) \)$; this scalar coefficient multiplies the paired row arrays after their Bessel estimates. Cauchy–Schwarz between the two arrays and the rapid tensor coefficient decay prove Equation (5.9), including the linear pooled tails treated with their separate singleton carriers. If $A_r = 0$, uniqueness of the Fourier transform gives $Q \( r u \) zeta \( u \) = 0$ almost everywhere. Since $zeta = 1$ on the relevant support, the corresponding form is zero. ◻
]

#thm([Corollary 5.4.])[
  (A finite predictor list for scheduled opponents).  #emph[Fix the two bounded scalar atoms $phi_i \, phi_j$ on $J'$, of complexity at most $H_(upright("low"))$, and let $B gt.eq 1$. There is a finite index set $frak(A)$, a bound $D_(upright("pred"))$, scalar coefficients $c_(r \, alpha)$, and fixed triples $\( psi_(a \, alpha) \, psi_(b \, alpha) \, lambda_alpha \)$ on $J'$ with $parallel psi_(e \, alpha) parallel_oo lt.eq 1$, such that 
$ \# frak(A) \, quad "complexity" \( psi_(e \, alpha) \) \, quad \| c_(r \, alpha) \| lt.eq D_(upright("pred")) \, #h(2em) log D_(upright("pred")) lt.eq "poly" #scale(x: 120%, y: 120%)[\(] 1 + B + log \( 2 H_(upright("low")) \) #scale(x: 120%, y: 120%)[\)] . $

 Here $c_(r \, alpha)$ is a scalar depending only on the fixed pair, its scalar construction, $B$, and the dyadic scale $r$; it is zero unless $\| lambda_alpha \| r^2 lt.eq D_(upright("pred"))$. The list and these coefficients are chosen before any opposing sequences or completed high catalogs.]
  #emph[Define its forms explicitly by 
#[#set math.equation(numbering: n => "(5.14)")
 $ T_I^alpha \( z_a \, z_b \) := \| I \|^(- 2) integral_(bb(R)^2) & w_I \( x \, t \) e \( lambda_alpha t^2 \) psi_(a \, alpha) \( y_a \) z_a \( y_a \)\
 & #h(2em) dot.op psi_(b \, alpha) \( y_b \) z_b \( y_b \) thin d x thin d t . $ <eq:hbase-predictor-list>]

 For every dyadic $K subset.eq J'$, selected finite use collection $cal(U)$ below $K$, and pair of admissible opposing sequences on $K$, define the actual error $e_I$ by the per-cell identity 
#[#set math.equation(numbering: n => "(5.15)")
 $ cal(L)_I^(phi_i \, phi_j) \( z_(a \, I) \, z_(b \, I) \) = sum_(alpha in frak(A)) c_(\| I \| \, alpha) T_I^alpha \( z_(a \, I) \, z_(b \, I) \) + e_I . $ <eq:hbase-list-identity>]

 Then, uniformly over those opposing sequences and their completed catalogs, 
#[#set math.equation(numbering: n => "(5.16)")
 $ sum_(I in cal(U)) \| I \| \| e_I \| lt.eq e^(- B) "poly" #scale(x: 120%, y: 120%)[\(] log \( 2 D_(upright(h)) \) \, 1 + L #scale(x: 120%, y: 120%)[\)] \| K \| . $ <eq:hbase-list-error>]

 The error $e_I$ may depend on the opposing sequence; the assertion is its aggregate bound.]
] <cor:hbase-predictor-list>

#proof[
  This is the #emph[A finite predictor list] Corollary of #cite(label("H")) Section 5, with Lemma 23 supplying its opponent estimates. The #emph[Progression separation] Lemma has dyadic shell coefficient mass $D_(upright("sep")) T_(upright("sh"))^(- 100)$ and shell complexity $\( D_(upright("sep")) T_(upright("sh")) \)^C$, with $log D_(upright("sep")) lt.eq "poly" \( log \( 2 H_(upright("low")) \) \)$. The polynomial in Equation (5.9) is bounded by a product of a polynomial in $1 + m + log \( 2 H \)$ and one in $log \( 2 D_(upright(h)) \) \, 1 + L$. The separation-shell cutoff and the small-$A_r$ cutoff may therefore be chosen using only $B \, H_(upright("low"))$. The pooled-tail estimate supplies the required absolute-sum precision on the retained bands.
  The surviving bounded-height choices form the finite list after distributing
  $ e \( gamma t \) = e #scale(x: 120%, y: 120%)[\(] - gamma y_a \/ \( b - a \) #scale(x: 120%, y: 120%)[\)] e #scale(x: 120%, y: 120%)[\(] gamma y_b \/ \( b - a \) #scale(x: 120%, y: 120%)[\)] $
  into the fixed multipliers. H’s construction makes their scalar coefficients depend only on scale and the fixed scalar data. Normalize the multipliers by moving their scalar sizes to the coefficients. This gives the stated count, coefficient, and complexity bounds and the identity with $e_I$ its actual difference.
  The same fixed list has the stated bound on every $K subset.eq J'$. Use its original scalar cutoffs and carriers, and retain only the source-selected rows whose cells are in the chosen use collection inside $K$. Their ordinary Bessel bound follows by zero extending a test on $K$ to $J'$, as in the preceding proof. The restricted schedules remain normalized, and the chosen current families are locally refitted on $K$. Thus the per-depth, smooth-row, projected-row, and energy estimates in that proof apply anew with root budget $\| K \|^(1 \/ 2)$ in each slot. Summing the same discarded scalar shells, bands, and pooled envelopes proves Equation (5.16). This proves the aggregate identity for all the stated opponents using one scalar list. ◻
]

=== 5.5 Delayed predictor replacement at a fixed use depth <delayed-predictor-replacement-at-a-fixed-use-depth>

#thm([Lemma 5.5.])[
  (Delayed predictor replacement on depth inputs).  #emph[Use the fixed list and a dyadic $K subset.eq J'$ from Corollary 24. Fix $alpha in frak(A)$ and a selected collection $cal(U)$ below $K$ on which $\| lambda_alpha \| \| I \|^2 lt.eq D_(upright("pred"))$. Let $K_0 in bb(Z)_(gt.eq 0)$ and $0 < epsilon.alt lt.eq 1$. Suppose an inherited family $P_(a \, h)$ on the full partitions of $K$, with budget $D_(upright(h))$, contains the same predictor 
$ Phi_v = \( overline(psi_(a \, alpha)) \, sqrt(epsilon.alt) thin upright(bold(e))_v \) $

 on every use cell and all its continued descendants. Other columns are allowed within that budget. Let $z_(b \, I)$ be an admissible opposing sequence on $K$. Then 
#[#set math.equation(numbering: n => "(5.17)")
 $ & sum_(I in cal(U)) \| I \| lr(|T_I^alpha \( F_(a \, s \( I \)) \, z_(b \, I) \) - T_I^alpha \( P_(a \, s \( I \) + K_0) F_(a \, s \( I \)) \, z_(b \, I) \)|)\
 & #h(2em) lt.eq C #scale(x: 120%, y: 120%)[\(] 2^(- K_0) + \( 1 + K_0 \) sqrt(epsilon.alt) #scale(x: 120%, y: 120%)[\)] "poly" #scale(x: 120%, y: 120%)[\(] D_(upright("pred")) \, log \( 2 D_(upright(h)) \) \, 1 + L #scale(x: 120%, y: 120%)[\)] \| K \| . $ <eq:hbase-delayed>]

 For sequential replacement, let $e$ denote the opposing slot and take its full inherited family $P_(e \, h)$ on $K$, under the stated joint budget. On a use cell $I$ of depth $s = s \( I \)$, the restriction of $P_(e \, s + K_0) F_(e \, s)$ to $I$ is a current constituent plus one whole rolling energy constituent with parameter $C \( 1 + K_0 \) log \( 2 D_(upright(h)) \)$. Subtracting one older current constituent still gives an admissible opponent.]
] <lem:hbase-delayed>

#proof[
  We adapt the #emph[Delayed predictor replacement] Lemma of #cite(label("H")) Section 5. Fix one use depth $s$ throughout the following calculation in $h$, and abbreviate $psi_(a \, alpha)$ by $psi_a$. Let $E_h$ be conditional expectation on the full depth-$h$ partition of $K$, and set
  $ r_h^(\[ s \]) = #scale(x: 120%, y: 120%)[\(] f_(a \, s) - \( P_(a \, h) F_(a \, s) \)_(upright("phys")) #scale(x: 120%, y: 120%)[\)] psi_a \, #h(2em) mu_h^(\[ s \]) = E_h r_h^(\[ s \]) . $
  Use these functions below a use cell, where $Phi_v$ is present. If $b_(h \, v)^(\[ s \])$ is its coefficient on a depth-$h$ cell, orthogonality to $Phi_v$ and the zero private coordinates of $F_(a \, s)$ give, with $Delta_h = P_(a \, h + 1) - P_(a \, h)$,
  #[#set math.equation(numbering: n => "(5.18)")
   $ mu_h^(\[ s \]) = epsilon.alt b_(h \, v)^(\[ s \]) \, #h(2em) mu_(h + 1)^(\[ s \]) - mu_h^(\[ s \]) = sqrt(epsilon.alt) thin \( Delta_h F_(a \, s) \)_v . $ <eq:hbase-predictor-moment>]
  The second identity holds on the fine cells and survives every further column insertion because the same predictor direction persists. Also
  $ r_h^(\[ s \]) - r_(h + 1)^(\[ s \]) = psi_a \( Delta_h F_(a \, s) \)_(upright("phys")) . $
  Let $I$ have depth $s$, put $h_(*) = s + K_0$, and let $omega_I$ be a smooth bump with bounded value and scale-normalized first derivative. For every finite $n > h_(*)$,
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral_I r_(h_(*))^(\[ s \]) omega_I =  & integral_I mu_(h_(*))^(\[ s \]) omega_I + sum_(h = h_(*))^(n - 1) integral_I \( r_h^(\[ s \]) - r_(h + 1)^(\[ s \]) \) \( omega_I - E_h omega_I \)\
 & + sum_(h = h_(*))^(n - 1) integral_I \( mu_(h + 1)^(\[ s \]) - mu_h^(\[ s \]) \) \( E_(h + 1) omega_I - E_h omega_I \) + integral_I r_n^(\[ s \]) \( omega_I - E_n omega_I \) . $ <eq:hbase-telescope>]
  Indeed, telescope $integral_I r_h^(\[ s \]) \( omega_I - E_h omega_I \)$. In the pairing with $E_(h + 1) omega_I - E_h omega_I$, conditional expectation replaces $r_(h + 1)^(\[ s \])$ by $mu_(h + 1)^(\[ s \])$, while the pairing with $mu_h^(\[ s \])$ vanishes. The terminal term tends to zero because
  $ parallel r_n^(\[ s \]) parallel_(L^2 \( I \)) lt.eq 2 parallel F_(a \, s) parallel_(L^2 \( I \)) \, #h(2em) parallel omega_I - E_n omega_I parallel_(L^2 \( I \)) lt.eq C \| I \|^(1 \/ 2) 2^(s - n) . $
  For each finite $n$, continue the family by retaining its labels and locally refitting on the needed descendants. These bounds then dispose of the terminal term as $n$ increases.
  To sum the telescope across use depths, recall the following projection energy bounds. Let $R subset.eq J$ be a normalized dyadic subroot with its restricted normalized schedule $F_(j \, s)$. Take one full inherited continuation $\( P_h \)$ on its complete depth partitions over the needed finite range, with catalog budget $D$. All depths are the original depths in $J$, with spatial origin $s \( R \)$. Put $Delta_h = P_(h + 1) - P_h$. For a fixed integer offset $ell$, an integer $L_(upright("proj")) gt.eq 0$, and selected disjoint depth-$s$ use cells $cal(U)_s$ inside $R$, Corollary 19 gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ sum_s sum_(I in cal(U)_s) parallel upright(bold(1))_I Delta_(s + ell) F_(j \, s) parallel_2^2 lt.eq C log^2 \( 2 D \) \| R \| \,\
sum_s sum_(I in cal(U)_s) parallel upright(bold(1))_I \( P_(s + L_(upright("proj"))) - P_s \) F_(j \, s) parallel_2^2 lt.eq C \( 1 + L_(upright("proj")) \)^2 log^2 \( 2 D \) \| R \| . $ <eq:h-projection-energy>]
  Only valid projection depths are summed. These are Equations (4.12) and (4.13), and they apply anew on every subroot. The present Lemma uses $R = K$ and $D = D_(upright(h))$. In every finer evaluation belonging to a use at depth $s$, the operand remains $F_(j \, s)$.
  We first sum the mean-zero tensor part. Both conditional-expectation errors in the two sums have supremum $O \( 2^(s - h) \)$. Normalize each bump test by $\| I \|^(- 1 \/ 2)$; a length-weighted tensor form is a product of two such tests, up to the fixed coordinate Jacobian. At $h = s + ell$, the first normalized test is bounded by
  $ C 2^(- ell) parallel upright(bold(1))_I Delta_(s + ell) F_(a \, s) parallel_2 \, $
  and the second has the additional factor $sqrt(epsilon.alt)$ from Equation (5.18). Apply the fixed-offset part of Equation (5.20) at each $ell$ and then Minkowski’s inequality over $ell gt.eq K_0$. The Hilbert sum of these remainder tests is at most
  #[#set math.equation(numbering: n => "(5.21)")
   $ C 2^(- K_0) log \( 2 D_(upright(h)) \) \| K \|^(1 \/ 2) . $ <eq:hbase-predictor-remainder>]
  This bound includes every fine cell of an increment and remains valid after selecting the stated coarse uses. The allowed bump bounds multiply it.
  When $integral_I omega_I = 0$, the initial term may use $mu_(h_(*))^(\[ s \]) - mu_s^(\[ s \])$, since $mu_s^(\[ s \])$ is constant on $I$. By Equation (5.18), it is a sum of the $K_0$ private increments at offsets $0 \, dots.h \, K_0 - 1$. Equation (5.20) bounds the Hilbert sum of these normalized tests by
  $ C K_0 sqrt(epsilon.alt) log \( 2 D_(upright(h)) \) \| K \|^(1 \/ 2) . $
  Expand $w_I$ into the mean-zero tensors used in the proof of Lemma 23 and pair the error tests with the opposing rows. At one fixed tensor index, a raw opponent has the singleton fixed carrier $psi_(b \, alpha)$ and one row per selected use cell. The singleton case of the ordinary mean-zero Bessel calculation invoked in H’s predictor proof, followed by Lemma 20, bounds it. For a projected constituent, apply the calculation in Equation (5.13) to this fixed singleton array and its one inherited current family; its full support and observation partitions and its use-depth reads are the same. An energy constituent uses the per-interval Bessel bound and its total energy. Rapid tensor coefficient decay absorbs the polynomial bump costs. This proves the asserted estimate for the part of $T_I^alpha$ in which $e \( lambda_alpha t^2 \)$ is replaced by one.
  For the quadratic-difference part, hold $s$ fixed. Put $x_s = \| lambda_alpha \| \| I \|^2$ at this depth. A smooth tensor expansion of $w_I \( e \( lambda_alpha t^2 \) - 1 \)$ has coefficient and fixed-derivative cost at most
  $ x_s "poly" \( D_(upright("pred")) \) \, #h(2em) x_s lt.eq D_(upright("pred")) . $
  These bumps may have nonzero mean. Ordinary orthogonality of the full nested sequence on the one operand $F_(a \, s)$ gives
  $ sum_(h gt.eq h_(*)) parallel Delta_h F_(a \, s) parallel_2^2 lt.eq parallel upright(bold(1))_K F_(a \, s) parallel_2^2 . $
  The local test bounds above and Cauchy–Schwarz in $h$ consequently give Hilbert-sum norm $C 2^(- K_0) parallel upright(bold(1))_K F_(a \, s) parallel_2$ for the two remainder sums over the disjoint depth-$s$ use cells. For the initial mean, $mu_(h_(*))^(\[ s \]) = sqrt(epsilon.alt) \( P_(a \, h_(*)) F_(a \, s) \)_v$; contraction instead gives $C sqrt(epsilon.alt) parallel upright(bold(1))_K F_(a \, s) parallel_2$. The opposing normalized tests at this depth have Hilbert-sum norm at most $C \( 1 + L \) \| K \|^(1 \/ 2)$, by disjointness, contraction, or the energy bound. Their total contribution is therefore at most
  $ x_s "poly" \( D_(upright("pred")) \) #scale(x: 120%, y: 120%)[\(] 2^(- K_0) + sqrt(epsilon.alt) #scale(x: 120%, y: 120%)[\)] \( 1 + L \) \| K \| . $
  For this one fixed $lambda_alpha$, Equation (5.10) gives $sum_(s : x_s lt.eq D_(upright("pred"))) x_s lt.eq C D_(upright("pred"))$. This proves the quadratic-difference part.
  Finally, on each use cell the delayed projection decomposes exactly as
  $ P_(b \, s + K_0) F_(b \, s) = P_(b \, s) F_(b \, s) + \( P_(b \, s + K_0) - P_(b \, s) \) F_(b \, s) . $
  The second term, restricted to each use cell as one whole constituent, has total energy parameter at most $C \( 1 + K_0 \) log \( 2 D_(upright(h)) \)$ by Equation (5.20). Together with the current first term it gives two admissible constituents; subtracting one older current constituent gives the permitted third. ◻
]

=== 5.6 High fits and the replacement tuple <high-fits-and-the-replacement-tuple>

Return to the fixed tuple and one common older segment $R_(upright("old")) subset.eq J_0$. We follow the #emph[Truncating the two high positions] Proposition of #cite(label("H")) Section 5. The low columns, their path counts, their coefficient sums, and their atom complexities are bounded by $D_(upright("old")) = exp \( k^(O \( 1 \)) \)$. Expand the two low differences only for this replacement. Index the available scalar pairs by $p$, and let $J_p$ be the deeper birth root, rebased to $R_(upright("old"))$ when inherited there. Pairs with disjoint births have no common use. Their coefficient products on a use cell are bounded by a fixed power of $D_(upright("old"))$, and

#[#set math.equation(numbering: n => "(5.22)")
 $ n_(upright("pair")) \( y \) := \# { p : y in J_p } lt.eq D_(upright("old"))^C \, #h(2em) sum_p \| J_p \| = integral_(R_(upright("old"))) n_(upright("pair")) \( y \) thin d y lt.eq D_(upright("old"))^C \| R_(upright("old")) \| . $ <eq:hbase-low-packing>]

For every $p$, choose its scalar list by Corollary 24, with $B$ a sufficiently large fixed power of $k$. Choose one common numerical bound $D_(upright("pred"))$ from that Corollary at this $B$ and the common upper bound on low atom complexity. It bounds the count, coefficient sizes at every scale, atom complexities, and quadratic cutoff of each pair-specific list; its logarithm is a fixed polynomial in $k$. The lists remain distinct on their roots $J_p$, and the predictor count on a path uses only the pair roots on that path. In high slot $e$, admit the conjugate predictors for each pair’s list at that pair’s first joint availability, with distinct private directions of weight $sqrt(epsilon.alt)$. Pairs inherited at an attempt root have their predictors present there; later pairs retain their predetermined first-availability admissions. The predictor path count is at most $D_(upright("old"))^C D_(upright("pred"))$. After these lists and their common bound are fixed, choose the integer $K_0$ and $log \( 1 \/ epsilon.alt \)$ as sufficiently large fixed powers of $k$.

Here is the error rate that these choices must supply. For a single completed owner family with numerical budget $D_(upright(h))$, put

$ Lambda = C \( 1 + K_0 \) log \( 2 D_(upright(h)) \) \, $

and

$ frak(e)_k \( D_(upright(h)) \) =  & e^(- B) "poly" #scale(x: 120%, y: 120%)[\(] log \( 2 D_(upright(h)) \) \, 1 + Lambda #scale(x: 120%, y: 120%)[\)]\
 & + #scale(x: 120%, y: 120%)[\(] 2^(- K_0) + \( 1 + K_0 \) sqrt(epsilon.alt) #scale(x: 120%, y: 120%)[\)] "poly" #scale(x: 120%, y: 120%)[\(] D_(upright("pred")) \, log \( 2 D_(upright(h)) \) \, 1 + Lambda #scale(x: 120%, y: 120%)[\)] . $

The first term is the finite-list error on both sides of a change of high input. The second is the delayed error, summed over the bounded list coefficients and entries. In a sequential change, the undelayed opponent is raw, optionally minus one previous current constituent. The delayed opponent is current plus one whole energy constituent with parameter $Lambda$, optionally minus that one previous current constituent. Thus these are exactly the opposing classes of the two scalar results.

Choose $B$ to absorb the fixed low coefficient and pair-count powers. This fixes $D_(upright("pred"))$. Choose $K_0$ and $log \( 1 \/ epsilon.alt \)$ afterward to absorb the fixed powers of $D_(upright("pred"))$ and the same low costs, retaining an $e^(- 2 k)$ reserve. Once the completed $log D_(upright(h))$ is a fixed power of $k$, its remaining factors in $frak(e)_k$ are fixed powers of $k$. Increasing the initial $k_1$ then gives $D_(upright("old"))^C frak(e)_k \( D_(upright(h)) \) lt.eq C e^(- k)$, for the fixed power $C$ needed below. We now verify that the high catalogs have this logarithmic size.

On one high attempt root $R_(upright("fit"))$, build $P_(e \, h)^(upright("new"))$ in projection-depth order. The restricted older data fix the previous approximants and the predictor admissions; the high family’s extra-fit catalog begins empty. At each $h$, refine and locally refit the full preceding partition and admit all predetermined predictors becoming available there. This is done also on branches with no further tests. A candidate coarse use cell at this step has depth $s = h - K_0$; it is an assigned original request-tree cell. Depths with no such candidate still carry the full refinements and admissions.

For a chosen precision $chi_e$, test on each candidate $I$

$ r_(e \, I) = f_(e \, s) - \( P_(e \, h)^(upright("new")) F_(e \, s) \)_(upright("phys")) $

in $frak(d)_(e \, I)$ at threshold $e^(- chi_e)$. The fine direct sum is an $L^2 \( I \)$ contraction, so this residual has bounded normalized size. Local detection gives on failure a bounded atom $phi$ with coarse moment at least $rho'$, where $log \( 1 \/ rho' \)$ and its complexity log are bounded by a fixed polynomial in $k \, chi_e$.

Insert one common label $\( phi \, upright(bold(e))_v \)$, born on $I$, into the mask of every depth-$h$ subcell $Q subset.eq I$, and retain it on their descendants. Its scalar function and private direction are common, while its fitted coefficients may differ between the $Q$’s. With $m_Q = integral -_Q r_(e \, I) overline(phi)$, the fresh-column estimate on each fine cell and Cauchy–Schwarz give

#[#set math.equation(numbering: n => "(5.23)")
 $ c sum_(Q subset.eq I\
s \( Q \) = h) \| Q \| \| m_Q \|^2 gt.eq c \| I \| lr(|integral -_I r_(e \, I) overline(phi)|)^2 gt.eq c \( rho' \)^2 \| I \| . $ <eq:hbase-high-gain>]

One request owns the distinct insertion rows on all these $Q$’s. The label counts once at every point of $I$.

After the admissions, perform simultaneous insertion rounds at $h$. Each still-failing coarse $I$ may request one such label; every other fine cell retains its projection. The charged fine rows have support and observation cells $Q \/ Q$ in the full depth-$h$ partition and read $F_(e \, h - K_0)$. Repeated rounds read the same input. The uncharged refinements and admissions remain in the global nested sequence, and splitting on all fine cells preserves Bessel norm one. These data meet Lemma 18 and the disjoint charged-row hypothesis of Lemma 21.

The predetermined budget $D_0$ includes all predictor admissions, including future ones, and the bounded older data needed for the joint budget. Its logarithm is polynomial in $k$. A coarse path cap $T$ adds at most $T$ common bounded labels of private weight one. Thus $D_T lt.eq C D_0 \( T + 1 \)^C$, and $log \( 2 D_T \) lt.eq k^(O \( 1 \)) + C log \( 2 T \)$. The one-trial Lemma chooses a cap with logarithm polynomial in $k \, chi_e$ and first-excess cells of total length at most $\| R_(upright("fit")) \| \/ 4$. Only original coarse request cells are cut.

The two families at a cut have separate roles.

#emph[Old family.] If a coarse cell at depth $s$ is cut while $h = s + K_0$, every strict ancestor was already evaluated at a smaller delayed depth. On the cut branch, keep the old family’s current depth-$h$ fine-cell masks unchanged through the remaining rounds at $h$. On finer descendants inherit every label in those masks, including extra-fit labels, and locally refit. Its predictors and their private directions persist, supplying every finer projection in Equation (5.19) for the old ancestor summands. No further residual test on this branch is needed for those summands.

#emph[New attempt.] Send the cut coarse summands and their original candidate descendants to a fresh attempt. It retains the restricted predetermined older data and the prescribed predictors: inherited pairs have their predictors at the new root, and later pairs keep their first-availability admissions. Its extra-fit catalog has no labels from the old extra fit. This is the fresh-extra-catalog choice permitted in the proof of the source high-truncation Proposition. The new $D_0$ covers only its predetermined data and admissions, and its cap counts only its own extra requests.

On each new root, restriction preserves the input normalization; rebasing and local refitting preserve the predetermined path and private budgets. The same common-label gain, distinct fine rows, and full-partition read chronology apply there, with the new empty extra catalog. Thus Lemma 21 applies anew and again gives the quarter fraction. The cut roots are proper original request-tree descendants, and the finite recursion has total root length at most $4 \| R_(upright("fit")) \| \/ 3$. This realizes the continuation and restart scheme of #cite(label("H")) Section 5 with the scheduled rows.

Apply this algorithm in the two high slots successively. Let $S_(upright("old")) = exp \( k^(O \( 1 \)) \)$ dominate the older supremum and predictor costs. Choose $chi_1$ with $e^(- chi_1) S_(upright("old")) lt.eq e^(- 2 k)$, and construct the first high fit and its capped catalog. For a depth-$\( s + K_0 \)$ cell $Q subset I$,

$ parallel F_(e \, s) parallel_(2 \, Q) lt.eq 2^(K_0 \/ 2) parallel F_(e \, s) parallel_(2 \, I) . $

The private-coordinate coefficient bound therefore bounds the first fit’s physical supremum on $I$ by $2^(K_0)$ times a fixed power of its count and inverse private weights. Its logarithm is polynomial in $k \, chi_1$; denote the resulting bound by $S_1$. Now choose $chi_2 gt.eq chi_1$ and construct the second fit so that

$ e^(- chi_1) S_(upright("old")) lt.eq e^(- 2 k) \, #h(2em) e^(- chi_2) S_1 lt.eq e^(- 2 k) . $

This also gives $e^(- chi_2) S_(upright("old")) lt.eq e^(- chi_1) S_(upright("old")) lt.eq e^(- 2 k)$. Since $chi_1$ and $log S_1$ are fixed powers of $k$, both precision logs and both completed catalog logs remain fixed powers of $k$. In particular their individual budgets have a common numerical upper bound $D_(upright(h)) = exp \( k^(O \( 1 \)) \)$. For any one common owner piece below, a fixed enlargement of this number also bounds the joint catalog of its two high families and the bounded number of older families. These tuple-specific precision logs do not enter $k_(t + 1) = k_t^A$.

Intersect the two high ownership trees with the bounded number of older segment trees. Their maximal common refinement changes owner only at a constituent segment root. Its piece roots $cal(S) \( R_(upright("old")) \)$ have total length at most $C \| R_(upright("old")) \|$. Each original summand in this older segment is assigned to one piece $S$, even when piece roots are nested. On its assigned cells define

#[#set math.equation(numbering: n => "(5.24)")
 $ Y_i = X_i \, #h(2em) Y_j = X_j \, #h(2em) Y_e = P_(e \, s + K_0)^(upright("new")) F_(e \, s) - g_(e \, upright("prev") \, I) quad \( e = a \, b \) . $ <eq:hbase-Y>]

Each projection here is the family of that cell’s owner, with its own full continuation.

We verify the aggregate replacement across these owners. For a low pair $p$ and piece $S$, put $K = J_p ∩ S$ when this is nonempty; dyadic nesting makes $K$ one cell. Select only the original coarse summands owned by $S$ on which that pair is available. Use the original scalar list and coefficients chosen on $J_p$, and the one owner family in each high slot on $S$, with its complete descendant continuation. On $K$, rebase an inherited pair and its predictors when needed and locally refit the owner family. This rebasing uses the same masks and retained spans on each used cell, hence the same local owner projection there. The scalar results apply anew on $K$: their source-selected raw rows are the original array restricted to these cells, with the same Bessel bound by zero extension of tests from $K$, and their projected rows use this owner’s individual catalog. The normalized schedules and row energies have root budget $\| K \|^(1 \/ 2)$. Apply the finite-list identity before and after each high change and the delayed estimate to the retained entries. With the low coefficient products outside, the resulting cost for this pair and owner is at most a fixed power of $D_(upright("old"))$ times $frak(e)_k \( D_(upright(h)) \) \| K \|$.

Writing $n_(upright("seg")) \( y \) = \# { S in cal(S) \( R_(upright("old")) \) : y in S }$, the intersection lengths satisfy

$ sum_(p \, S) \| J_p ∩ S \| = integral_(R_(upright("old"))) n_(upright("pair")) \( y \) n_(upright("seg")) \( y \) thin d y lt.eq D_(upright("old"))^C sum_(S in cal(S) \( R_(upright("old")) \)) \| S \| . $

Here empty intersections contribute zero. Combining the coefficient and pair-count powers into $D_(upright("old"))^C$ proves

#[#set math.equation(numbering: n => "(5.25)")
 $ & sum_(S in cal(S) \( R_(upright("old")) \)) sum_(I med upright("owned")\
upright("by") med S) \| I \| thin \| H_I \( X_I \) - H_I \( Y_I \) \|\
 & #h(2em) lt.eq D_(upright("old"))^C frak(e)_k \( D_(upright(h)) \) sum_(S in cal(S) \( R_(upright("old")) \)) \| S \| lt.eq C e^(- k) \| R_(upright("old")) \| . $ <eq:hbase-high-errors>]

This sums fresh estimates using each owner’s continuation and the original scalar list.

The high residuals pass their $frak(d)$ tests on the coarse cells. The pair comparison used for $X$ applies with the two high precision logs ordered after the old logs. If the earliest low index is separated from $t$, test the later residual difference against each existing early fitted operand; otherwise every existing old fitted operand has index at least $t - 7$. For $t gt.eq 12$, each of $Y_j \, Y_a \, Y_b$ cancels when its existing fitted operands are replaced by the same $F_(e \, s)$, so every pair has a cancelling later factor, as in the proof of Lemma 22. The high-truncation comparison in #cite(label("H")) Section 5 therefore supplies an absolute exponent $theta_(upright("av")) > 0$ for which each pair of $Y$ factors has form norm at most $e^(- k^(theta_(upright("av"))))$, when $t gt.eq 12$. Contraction gives a fixed bound $C_(upright("size"))$ for every local $L^2 \( I \)$ size. Choose once

#[#set math.equation(numbering: n => "(5.26)")
 $ 0 < theta < min { 1 \, theta_(upright("av")) \, theta_0 } \, #h(2em) eta = e^(- k^theta) . $ <eq:hbase-quality>]

After increasing $k_1$, both the pair norm and $C_(upright("size"))^2 e^(- k^(theta_(upright("av"))))$ are at most $eta$. Thus every full $Y$ pair has norm at most $eta$, and $\| H_I \( Y_I \) \| lt.eq eta$ for $t gt.eq 12$.

Across all common older segments, let $cal(R)_(upright("base"))$ be the final base segments and let $cal(I)_R$ be the preimage of $R$ under their owner map. The sets $cal(I)_R$ partition this fixed $cal(I)_0$, each $I in cal(I)_R$ lies in $R$, and no auxiliary projection cell is a summand. Summing Equation (5.25) over the older segments gives the separate global statement

#[#set math.equation(numbering: n => "(5.27)")
 $ sum_(R in cal(R)_(upright("base"))) \| R \| lt.eq C \| J_0 \| \, #h(2em) sum_(R in cal(R)_(upright("base"))) sum_(I in cal(I)_R) \| I \| thin \| H_I \( X_I \) - H_I \( Y_I \) \| lt.eq C e^(- k) \| J_0 \| . $ <eq:hbase-high-replacement>]

=== 5.7 The constructed tuple and its active patterns <the-constructed-tuple-and-its-active-patterns>

#thm([Proposition 5.6.])[
  (Base data and active reduction).  #emph[Fix the constructed tuple with later accuracy $t$, put $k = k_t$, and use its final segments $R in cal(R)_(upright("base"))$ and original owner sets $cal(I)_R$ from Equation (5.27). On an owned cell of depth $s$, define 
#[#set math.equation(numbering: n => "(5.28)")
 $ Y_l = B_l + U_l \, #h(2em) B_i = X_i \, quad B_j = X_j \, quad U_i = U_j = 0 \,\
B_e = P_(e \, s)^(upright("new")) F_(e \, s) - g_(e \, upright("prev") \, I) \, #h(2em) U_e = \( P_(e \, s + K_0)^(upright("new")) - P_(e \, s)^(upright("new")) \) F_(e \, s) quad \( e = a \, b \) \,\
parallel B_(l \, I) parallel_(2 \, I) \, med parallel U_(l \, I) parallel_(2 \, I) \, med parallel Y_(l \, I) parallel_(2 \, I) lt.eq C \,\
Lambda_k = C \( 1 + K_0 \) log \( 2 D_(upright("base")) \) lt.eq k^C \, #h(2em) sum_(I in cal(I)_R) \| I \| parallel U_(e \, I) parallel_(2 \, I)^2 lt.eq Lambda_k^2 \| R \| quad \( e = a \, b \) . $ <eq:h-base-data>]

 Each $B_l$ is a signed sum of at most two current nested-catalog projections applied to $F_(l \, s)$. Their basic catalogs have distinct private directions and inherited masks. Their path counts, column sizes, inverse private weights, bounded scalar atom complexities, and current coefficient sums are bounded by $D_(upright("base"))$, with 
$ e^k lt.eq D_(upright("base")) lt.eq exp \( k^C \) . $

 For $t gt.eq 12$, the associated full $Y$ tuple has the pair bound and pointwise form bound $eta$ of Equation (5.26).]
  #emph[For three available basic scalar columns $bold(phi)$ in distinct slots, let $"act"_I \( bold(phi) \)$ be their form norm against a normalized $L^2 \( I \)$ input in the fourth slot. For a sufficiently large fixed $C_(upright("act"))$, put 
$ cal(A)_R = {I in cal(I)_R : "act"_I \( bold(phi) \) > D_(upright("base"))^(- C_(upright("act"))) upright(" for some available triple ") bold(phi)} . $

 This common active set has path multiplicity 
$ sum_(I in cal(A)_R) upright(bold(1))_I \( y \) lt.eq M lt.eq D_(upright("base"))^C . $

 Define three patterns in their original slots by 
$ z_l^diameter = B_l & upright("for every ") l \,\
z_a^a = U_a \, & z_l^a = B_l & \( l eq.not a \) \,\
z_b^b = U_b \, & z_l^b = B_l & \( l eq.not b \) \, #h(2em) cal(P) = { z^diameter \, z^a \, z^b } . $

 For $z in cal(P)$, let 
#[#set math.equation(numbering: n => "(5.29)")
 $ frak(M)_R \( z \) := sum_(I in cal(A)_R) \| I \| min { eta \, \| H_I \( z_I \) \| } . $ <eq:h-active-pattern-target>]

 Then for $t gt.eq 12$, 
#[#set math.equation(numbering: n => "(5.30)")
 $ sum_(I in cal(I)_R) \| I \| thin \| H_I \( Y_I \) \| lt.eq C eta Lambda_k^2 \| R \| + e^(- k) \| R \| + sum_(z in cal(P)) frak(M)_R \( z \) . $ <eq:h-active-minimum>]

 The $e^(- k) \| R \|$ term is the total inactive error for the three patterns. The finitely many leading accuracy levels have a bound independent of the number of spatial depths. These base data and their estimates hold anew on normalized subroots with the inherited basic lists and their local continuations.]
] <prop:hbase-data>

#proof[
  The definitions give $Y = B + U$. Contraction bounds the local sizes. Choose $D_(upright("base"))$ to dominate the bounded number of basic catalogs used by this tuple and enlarge it to be at least $e^k$. The preceding logarithmic bounds give $D_(upright("base")) lt.eq exp \( k^C \)$. On $R$, use its owner families with their full inherited continuations. Equation (5.20), applied anew on this root, gives the stated $U$ energies.
  The scalar input for the active set is the #emph[Few active scales for a fixed triple] Lemma of #cite(label("H")) Section 5. For three fixed bounded basic scalar columns on their common birth subtree and $0 < delta lt.eq 1$, it gives on every spatial path
  $ \# { I : "act"_I \( bold(phi) \) > delta } lt.eq "poly" #scale(x: 120%, y: 120%)[\(] log D_(upright("base")) + log \( 1 \/ delta \) #scale(x: 120%, y: 120%)[\)] \, $
  and
  $ sum_(I med upright(o n med t h e med p a t h)\
"act"_I \( bold(phi) \) lt.eq delta) "act"_I \( bold(phi) \) lt.eq delta "poly" #scale(x: 120%, y: 120%)[\(] log D_(upright("base")) \, log \( 1 \/ delta \) #scale(x: 120%, y: 120%)[\)] . $
  The bounds are uniform in the path location and unrestricted real oscillation parameters. Every detected atom and predictor used here is a fixed scalar label at birth. At most $D_(upright("base"))^3$ available triples lie on one path. With $delta = D_(upright("base"))^(- C_(upright("act")))$, the first source bound gives $M lt.eq D_(upright("base"))^C$ after enlarging the fixed power.
  On an inactive owned cell, expand three $B$ factors of a pattern into their basic scalar columns. Their coefficients are constant on that cell and their sums are bounded by a fixed power of $D_(upright("base"))$; the fourth factor has bounded normalized $L^2$ size. For each fixed triple, the second source bound controls the inactive path sum by $D_(upright("base"))^(- C_(upright("act"))) "poly" \( log D_(upright("base")) \, C_(upright("act")) \)$. Bound the varying coefficients by their uniform sizes, sum the pathwise triples and the three patterns, and integrate over path points in $R$. The total absolute length-weighted inactive sum is at most
  $ D_(upright("base"))^(C - C_(upright("act"))) "poly" \( log D_(upright("base")) \, C_(upright("act")) \) \| R \| lt.eq e^(- k) \| R \| $
  when $C_(upright("act"))$ dominates the fixed power costs and $k_1$ is sufficiently large.
  It remains to derive the displayed minimum. Let $z^(U U)$ have $Y_i = B_i$ and $Y_j = B_j$ in the low slots and $U_a \, U_b$ in the other two. For $t gt.eq 12$, the complementary $Y_i \, Y_j$ pair bound and Cauchy–Schwarz give
  $ sum_(I in cal(I)_R) \| I \| thin \| H_I \( z_I^(U U) \) \| lt.eq C eta (sum_(I in cal(I)_R) \| I \| parallel U_(a \, I) parallel_(2 \, I)^2)^(1 \/ 2) (sum_(I in cal(I)_R) \| I \| parallel U_(b \, I) parallel_(2 \, I)^2)^(1 \/ 2) lt.eq C eta Lambda_k^2 \| R \| . $
  At each owned cell, multilinearity gives $H_I \( Y \) = sum_(z in cal(P)) H_I \( z \) + H_I \( z^(U U) \)$. The full-tuple bound $\| H_I \( Y \) \| lt.eq eta$, established before the pattern split, therefore gives
  $ \| H_I \( Y \) \| lt.eq min {eta \, sum_(z in cal(P)) \| H_I \( z \) \| + \| H_I \( z^(U U) \) \|} lt.eq \| H_I \( z^(U U) \) \| + min {eta \, sum_(z in cal(P)) \| H_I \( z \) \|} . $
  Sum over $cal(I)_R$, use the absolute inactive bound outside $cal(A)_R$, and on the active cells apply $min \( eta \, sum_z a_z \) lt.eq sum_z min \( eta \, a_z \)$. This proves Equation (5.30). It assigns no pair bound or pointwise $eta$ bound to an individual pattern.
  For a leading level, the Local absolute estimate bounds the two-$U$ term by $C Lambda_k^2 \| R \|$ without $eta$. At each of the finitely many such levels, $D_(upright("base"))$, $Lambda_k$, and $M$ are constants independent of spatial depth. The local sizes and $sum_(I in cal(A)_R) \| I \| lt.eq M \| R \|$ bound the active contribution independently of the number of depths.
  Finally, on a normalized subroot the original schedule restrictions remain normalized, basic masks remain inherited with the same budgets, and local refitting gives the required full continuations. The row estimate applied there supplies the $U$ energies anew. The arguments handed to localization are the whole $B \, U$ factors above, together with the associated $Y$ pair bound; the scalar pair expansion was used only in the high replacement and the triple expansion only on inactive cells. ◻
]

== 6 Localization, frozen rows, and the side estimates <sec:localization>

Fix a later accuracy level $t gt.eq 12$, write $k = k_t$, and choose a final base segment $R_0 in cal(R)_(upright("base"))$ and a pattern $z in cal(P)$ from Proposition 26. With $eta = e^(- k^theta)$ and $0 < theta < 1$ as in (5.26), its target (5.29) is

$ frak(M)_(R_0) \( z \) = sum_(I in cal(A)_(R_0)) \| I \| min { eta \, \| H_I \( z_I \) \| } . $

Here $cal(A)_(R_0)$ is the original active collection assigned to this segment. On a cell of depth $s$, write $z_I = \( z_(0 \, s) \, dots.h \, z_(3 \, s) \)$ for its whole current arguments. The truncation was obtained from the full tuple $Y$ before the $B \/ U$ patterns were separated. The pair estimate for $Y$ will be used after filter transfer restores the two complementary $B$ inputs to $Y$.

We first work on one localization attempt with root $R subset.eq R_0$. Let $cal(A)_R^(upright("att")) subset.eq cal(A)_(R_0)$ be the original active cells assigned to it. Let $cal(A)_R^(upright("main"))$ be the cells in $cal(A)_R^(upright("att"))$ surviving the initial marking-failure cuts, namely those not at or below a marking-failure root. This collection is fixed before the dependent cuts. Let $cal(A)_R^(upright("ret")) subset.eq cal(A)_R^(upright("main"))$ be those retained after all cuts. An assigned proper ancestor of a cut remains one whole $H_I$ summand. The estimates in this section bound the contribution of $cal(A)_R^(upright("ret"))$ by a multiple of $\| R \|$. A realized finite operator family is fixed during its operator tests. A later cut transfers original summands at that cell and below to a new attempt without changing the parent’s fixed functions or operators. Section 7 renews the estimates on the new roots and sums their lengths.

All depths $s \, b \, u_b \, v_b \, t_b$ below remain the original depths in $J$. Passing to $R$ does not reset an input schedule or its auxiliary nearest-endpoint extension. An endpoint output before depth $s \( R \)$ is set to zero. The localization attempts here are distinct from the fit attempts that produced the base segments.

=== 6.1 One attempt and its localization data <one-attempt-and-its-localization-data>

Set $P = ceil.l eta^(- alpha) ceil.r$, with the fixed $alpha > 0$ chosen in Section 7. For fixed $alpha$, $log \( 2 P \) = O \( k \)$. The main catalog consists of the basic columns and the additional columns used by H’s local filters; its budget $D_(upright(m))$ also anticipates the later helper columns. It bounds path counts, column sizes, coefficient bounds, inverse private weights, and main-use multiplicities. We use

$ log D_(upright("base")) \, med log D_(upright(m)) lt.eq C_q k^C \, #h(2em) cal(L) = k^(O \( 1 \)) \, #h(2em) G_0 = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_q \( 1 + log \( 2 k \) \)^C #scale(x: 120%, y: 120%)[\)] . $

There are $cal(L)$ colors, and the relevant main histories have $O \( log cal(L) \)$ factors. The value of $G_0$ may increase within this displayed class.

We describe the main data of #cite(label("H")) Section 6 before checking their realization for the present inputs. A present vertex is an occurrence of an original basic column, with H’s full normalized curvature tag, including its horizontal chart data. The present lists grow by inheritance along downward paths. In slot $l$, the quadratic chart phase is $kappa_l$ times the phase represented by that tag, where $kappa = \( - 1 \, 3 \, - 3 \, 1 \)$; linear modulation is not part of the tag. Distances are measured in H’s ambient graph on all hypothetical tags satisfying its bounds. They depend on the tags and absolute depth, and do not increase as depth increases. Every added main or helper column is attached to a present vertex and has its tag; these insertions add no graph vertices.

A group $G$ is a source index with a fixed color and a set of actual central uses. Its pad mask $cal(M)_(G \, h) \( I \)$ is a set of present vertices on the cell $I$, retaining historical central uses. Such masks may continue by inheritance after the group has ceased to be current on a branch. At a given rank, the associated pad projection is the orthogonal projection in $L^2 \( I \; cal(H) \)$ onto constant-coefficient combinations of the available columns of at most that rank whose tags belong to the mask. Pads are nested on a fixed cell, and each individual pad family is inherited on the complete depth partitions and unused-cell continuations needed below. A positive smeared filter is the normalized average of its $P$ pad projections. A named history is a specified ordered history of these source filters and their complements. After the catalogs are fixed it is a fixed bounded operator; expanding its complements and choosing individual pads gives ordered products of inherited orthogonal projections.

Usability is relative to the pad mask supplying a range: that mask is nonempty, and the cell has an actual use of $G$ at or below it. The #emph[Mask inclusion, closure, and separation] Lemma of #cite(label("H")) Section 6 gives three properties. At an actual use, the pad-$h$ mask contains every present vertex at graph distance at most $h$ from the center; its pad-$h + 1$ mask contains every neighbor of a pad-$h$ vertex. For distinct groups of the same color, vertices in their respective pad masks on overlapping usable endpoints are separated by graph distance greater than one at the finer endpoint.

We now verify the closure input. At the cell $I$ of depth $s$ being tested, hold fixed its one current basic argument $b = z_(l \, s)$, of type $B$ or $U$. For two specified positions, let $frak(d)_I \( v \, w \)$ be the supremum of the absolute form with those entries and arbitrary normalized $L^2 \( I \)$ functions in the other positions. At rank $r$, H requires, for every named target history and each of its prescribed individual-pad choices,

#[#set math.equation(numbering: n => "(6.1)")
 $ frak(d)_I #scale(x: 120%, y: 120%)[\(] upright("one lower-rank source") \, \( 1 - P_(r \, cal(M)) \) cal(H) b #scale(x: 120%, y: 120%)[\)] lt.eq frac(tau_3, D_(upright("base")) sqrt(n_(r - 1))) parallel b parallel_(2 \, I) \, #h(2em) tau_3 = D_(upright("base"))^(- C_tau) . $ <eq:h-closure-test>]

The source is one pure available lower-rank column whose tag lies in the target mask, and $n_(r - 1)$ bounds the path count through the preceding rank. This is Equation (H.13) of #cite(label("H")) Section 6; the individual tests also control the normalized averages.

In the #emph[Catalog closure and its budget] Lemma of H, the tested state $X_i = cal(H)_i b$ changes with the insertion index $i$ because its projections acquire columns, while $b$ stays fixed on $I$. The #emph[Uniform same-tag test] Lemma supplies on failure a fresh target-column increment satisfying

$ parallel \( P_(i \, upright("new")) - P_(i \, upright("old")) \) X_i parallel_(2 \, I) gt.eq c frac(tau_3, D_(upright("base")) sqrt(n_(r - 1)) H_0) parallel b parallel_(2 \, I) \, #h(2em) H_0 lt.eq exp \( C_q k^C \) . $

For one named history and mask in a trial of at most $T$ insertions, the target increments are orthogonal rows and every underlying positive projection is nested in $i$. Expanding complements and applying the products-of-prefixes calculation of #cite(label("H")) Section 3 gives

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_i parallel \( P_(i \, upright("new")) - P_(i \, upright("old")) \) cal(H)_i b parallel_(2 \, I)^2 lt.eq \( C log \( 2 T \) \)^(O \( log cal(L) \)) parallel b parallel_(2 \, I)^2 . $ <eq:h-closure-prefix>]

This is a fixed-vector estimate on $b$, so it applies when $b$ contains $F_(l \, s)$: the depth $s$ is fixed during the cell test. The lower bound and (6.2) cancel the norm of $b$. Counting named masks and histories and taking $n_r \/ n_(r - 1) = exp \( k^(C_2) \)$ through $cal(L) + 5$ ranks gives $log n_max lt.eq C_q k^C$, using the active path count from the base reduction.

This is an a priori count from names of contexts, including the anticipated number of helper bases; it is independent of the numeric edge height $H_(upright("ed"))$ and later mode precision. As in H, choose the mismatch accuracy after this count and then choose $H_(upright("ed"))$ and realize compatible graph, mask, and main-catalog data. We fix these main projections, color histories, ball masks, and actual central uses, including the small marking-failure cuts and the inherited continuations with local refits on unused branches needed for operator estimates. The actual helper selections will be made after their bases have been constructed.

The #emph[Bessel separation of usable endpoint spaces] Lemma of #cite(label("H")) Section 6 supplies the following operator interface. For one fixed slot and color, let

$ h_G = sum_(v \, U) a_(v \, G \, U) upright(bold(1))_U Phi_v $

be finite sums of available pure main columns. Each coefficient is constant on an entire usable endpoint cell $U$, and the particular pad mask certifying that term contains the indicated vertex bearing its tag. If the group, label, and inverse-private-weight counts on a path are bounded by $exp \( C_q k^C \)$, H’s chosen mismatch accuracy gives

#[#set math.equation(numbering: n => "(6.3)")
 $ ∥sum_G h_G∥_2^2 lt.eq C sum_G parallel h_G parallel_2^2 . $ <eq:h-usable-synthesis>]

Labels and cells may be repeated at arbitrary endpoint times. The constant does not count these repetitions or the depth of a future certificate. If an output is restricted to a union $E$ of finer cells, then $\( upright(bold(1))_E P_U \)^(*) = P_U upright(bold(1))_E$; its adjoint range is still the column span on the whole $U$. In particular, for a common depth $t$, certified unions $E_G$ of $t$-cells, and individual ball projections $L_(G \, t)$, duality gives

#[#set math.equation(numbering: n => "(6.4)")
 $ sum_G parallel upright(bold(1))_(E_G) L_(G \, t) h parallel_2^2 lt.eq C parallel h parallel_2^2 quad upright("for one shared input ") h . $ <eq:h-usable-rows>]

The binary localization proof in H now applies to the one current tuple $\( z_(0 \, s) \, dots.h \, z_(3 \, s) \)$ on each original cell in $cal(A)_R^(upright("main"))$. Each pad in a smeared filter acts on that same operand. The closure tests are (6.1), the mismatch estimates concern fixed column tags, and the other factors use only local $L^2$ sizes. The #emph[Localization into current groups] Proposition of #cite(label("H")) Section 6, Equation (H.14), therefore gives at most $"poly" \( k \)$ fixed search leaves and, for every $I in cal(A)_R^(upright("main"))$,

#[#set math.equation(numbering: n => "(6.5)")
 $ H_I \( z_(dot.op \, s) \) = sum_lambda med sum_(G med upright("current")) H_I \( Z_(0 \, G \, s)^lambda \, dots.h \, Z_(3 \, G \, s)^lambda \) + e_I \,\
Z_(l \, G \, s)^lambda = overline(L)_(l \, G \, s)^lambda cal(B)_(l \, s)^lambda z_(l \, s) \, #h(2em) sum_(I in cal(A)_R^(upright("main"))) \| I \| \| e_I \| lt.eq C e^(- k) \| R \| . $ <eq:h-localization>]

Here $overline(L)$ is one positive average of ball projections, and $cal(B)$ is a source-ordered history of cumulative filters and complements of length $O \( log cal(L) \)$, independent of $G$. The history and slot choices are fixed by the search leaf throughout the tree. Only groups with an actual current central use on $I$ are summed in each leaf, and that sum may be empty. The sum over groups stays inside the contribution of the original cell; subadditivity distributes the minimum with $eta$ only over the fixed leaves.

=== 6.2 Variation of the localized $B$ output <variation-of-the-localized-b-output>

Fix one slot, one search leaf, and its color, and suppress their subscripts. Write the full basic expression as

$ B_s = sum_(tau = 1)^(h_0) epsilon_tau Q_s^tau F_s \, #h(2em) h_0 lt.eq 2 \, $

with its signs and constituent basic projection families fixed. Define the full endpoint output

$ Z_(G \, s) = overline(L)_(G \, s) cal(B)_s B_s $

using the source positive ball average and the fixed group-independent history of the leaf. We evaluate this expression on every needed endpoint of the complete inherited families within the attempt, including endpoints where $G$ has no current central use. All individual pad families and unused-cell continuations are fixed for the calculation. The same pad choice is coupled across compared depths in each average.

We also use a shared output $Z_s^(upright("sh"))$ from H’s group-independent current-depth coarse histories on $F_s$. These are the histories of the fixed source leaf and the remaining input-side histories obtained when a source transfer step removes its prescribed positive output-side filters in decreasing rank. They retain the source order, $O \( log cal(L) \)$ main factors, normalized positive pad averages or controlled complements, and at most two fixed signed basic constituents. Their complement expansions have the source bound $2^(O \( log cal(L) \))$. The identity is included. The output has no outer ball and is counted once across its uses.

#thm([Lemma 6.1.])[
  (Certified variation with depth inputs).  #emph[For the full endpoint outputs $Z_(G \, s) = overline(L)_(G \, s) cal(B)_s B_s$ just defined, let $cal(J)$ be a common finite collection of depth intervals $\[ r \, t \]$ with edge-overlap multiplicity at most $a$. For each $G \, \[ r \, t \]$, let $E_(G \, r \, t)$ be a union of $t$-cells having a downstream actual-use certificate for $G$. Then 
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_(G \, \[ r \, t \] in cal(J)) parallel upright(bold(1))_(E_(G \, r \, t)) \( Z_(G \, t) - Z_(G \, r) \) parallel_2^2 lt.eq a G_0 \| R \| . $ <eq:h-certified-variation>]

 For one shared output $Z_s^(upright("sh"))$ in the stated source class, let $E_(r \, t)$ be the union of the required $t$-cells across all its uses. Then 
$ sum_(\[ r \, t \] in cal(J)) parallel upright(bold(1))_(E_(r \, t)) \( Z_t^(upright("sh")) - Z_r^(upright("sh")) \) parallel_2^2 lt.eq a G_0 \| R \| . $

 This shared assertion has no group sum or group certificate. All outputs before the attempt root are zero.]
] <lem:h-certified-variation>

#proof[
  Expand the complements, choose one basic constituent, and choose one individual pad in each average, coupled at all depths. One term of the full ball output is
  #[#set math.equation(numbering: n => "(6.7)")
   $ hat(Z)_(G \, s) = L_(G \, s) B'_s F_s \, #h(2em) B'_s = P_s^m dots.h.c P_s^1 . $ <eq:h-current-product>]
  Here $L_(G \, s)$ is an individual nested ball projection and the $P_s^j$ are nested main projection families shared across groups. Every nonzero $B$ constituent has its specified basic projection as the input-side factor $P_s^1$. An empty product is allowed for a shared history.
  Color the intervals into at most $a$ collections with disjoint interiors. Within one color, omit zero intervals and order the others as $r_1 < t_1 lt.eq r_2 < t_2 lt.eq dots.h.c$. Initially suppose both endpoints lie within the attempt. The exact difference of the coupled term is
  #[#set math.equation(numbering: n => "(6.8)")
   $ hat(Z)_(G \, t) - hat(Z)_(G \, r) =  & \( L_(G \, t) - L_(G \, r) \) B'_r F_r + L_(G \, t) \( B'_t - B'_r \) F_r\
 & + L_(G \, t) B'_t \( F_t - F_r \) . $ <eq:h-variation-decomposition>]
  We first establish ordinary Bessel bounds for the two operator-change terms, then evaluate their rows on $F_r$. The last term changes only the shared input at the right endpoint.
  For the first term, initially omit $B'_r$. On each $r$-cell $U$, split off
  $ C_(G \, r \, t \, U) = upright(bold(1))_(E_(G \, r \, t) ∩ U) \( L_(G \, t) - L_(G \, r) \) upright(bold(1))_U . $
  At each interval $\[ r \, t \]$, locality on the $r$ partition makes the outputs of these split rows disjoint. For a fixed $G$, the unrestricted increments on the disjoint intervals are orthogonal, and output restriction is a contraction, so the split rows have an ordinary Bessel bound. Their adjoints take values in the sums of the whole ball ranges on the $r$- and $t$-cells. For a nonzero split row, a certified $t$-cell in $E_(G \, r \, t) ∩ U$ supplies a downstream use below $U$. It certifies $U$ for its particular pad mask whenever that mask is nonempty; an empty mask contributes the zero projection. Thus both endpoint ranges are eligible for (6.3). Applying that bound to the adjoint sums makes these ordinary rows jointly Bessel across groups and intervals.
  Insert $B'_r$ at the decision cell $U$ by (5.12). For a nonempty product the row adjoint has the order
  $ P_U^1 dots.h.c P_U^m \( L_(G \, t) - L_(G \, r) \) upright(bold(1))_(E_(G \, r \, t) ∩ U) . $
  Its final action is $P_U^1$, so its range is a main-catalog combination on the entire $U$. The input-support and observation depths are both $r$, and the read index is $r$. With an empty product, both endpoint ranges are combinations on the $t$-cells: the earlier range has this description there by inheritance. The input-support depth is then $r$, the observation depth is $t$, and the read remains $r$. In both cases the next input-support partition refines the current observation partition, because $t lt.eq r_(upright("next"))$. Equation (5.3), with budget $D_(upright(m))$, now bounds the squared sum of the first term on the varying reads $F_r$ by $G_0 \| R \|$.
  For the second term, (6.4) first bounds the outer ball rows at each common right endpoint on an arbitrary shared operand. It remains to bound the ordinary rows from
  $ B'_t - B'_r = sum_(j = 1)^m P_t^m dots.h.c P_t^(j + 1) \( P_t^j - P_r^j \) P_r^(j - 1) dots.h.c P_r^1 . $
  After the triangle inequality over $j$, the left factors are contractions. For each $j$, the middle increments on the disjoint intervals are Bessel. Split them into $r$-cell input-support rows; the exact split-norm identity in the proof of Corollary 19 preserves the Bessel bound. Insert the right product by Compression. If that product is nonempty, the final adjoint range is a combination on its whole $r$-cell; if it is empty, as it is for $j = 1$, inheritance represents both increment ranges on the $t$-cells. The respective observation depths are $r$ and $t$, the input-support depth and read index are $r$, and the next input-support depth is at least $t$. We have obtained the ordinary Bessel bounds before applying (5.3) to the reads $F_r$. The resulting squared sum is $G_0 \| R \|$. This argument also bounds the operator change for a shared no-ball history; an empty history has zero operator change.
  For the final term, the product is shared across groups, so the endpoint Bessel bound gives
  $ sum_G parallel upright(bold(1))_(E_(G \, r \, t)) L_(G \, t) B'_t \( F_t - F_r \) parallel_2^2 lt.eq C parallel B'_t \( F_t - F_r \) parallel_2^2 lt.eq C parallel upright(bold(1))_R \( F_t - F_r \) parallel_2^2 . $
  Equation (5.1) sums these differences. For a shared history the same proof bounds its full $L^2 \( R \)$ difference before the single restriction to $E_(r \, t)$; for the shared identity it is precisely the input-difference estimate.
  At most $a$ intervals cross the start of the attempt. The zero convention, (6.4), contraction, and $parallel upright(bold(1))_R F_t parallel_2^2 lt.eq \| R \|$ bound those terms. Finally restore the positive averages by Jensen’s inequality with coupled pads and restore the fixed signed constituents and complement expansions by the triangle inequality in the finite Hilbert sum of rows. Their source-controlled lengths are $O \( log cal(L) \)$, so their costs and the row losses fit $G_0$. Summing the interval colors proves both assertions. ◻
]

#thm([Corollary 6.2.])[
  (The endpoint histories used by filter transfer).  #emph[Fix one source search leaf, one step in the #emph[Outgoing filters and near-band defects] Lemma of #cite(label("H")) Section 6, and one choice in that step’s expansion of the complementary factors. In its outgoing complementary slot write $x_(c \, s) = cal(C)_(c \, s) B_(c \, s)$ for exactly the input-side source history left after deleting the outgoing positive filter. This inner history is shared across groups. It retains the source order, its normalized averages or identities, its $O \( log cal(L) \)$ length, and the specified input-side basic $Q_s^tau$ in each nonzero constituent. Write $x_(d \, s)$ for the whole remaining source history in the other complementary slot. All endpoint evaluations use the complete inherited families, with coupled pads at compared depths, and may occur when the group is not current.]
  #emph[Let $Q_(c \, p \, s)$, $1 lt.eq p lt.eq P$, be exactly that step’s individual outgoing projections, and put $Q_(c \, 0 \, s) = 0$, $Q_(c \, P + 1 \, s) = 1$. For a ball transfer, each $Q_(c \, p \, s) x_(c \, s)$ with $1 lt.eq p lt.eq P$ is an eligible group-indexed ball endpoint, while $x_(c \, s)$ is shared. For a cumulative transfer the outer ball has already been removed and all these endpoints are shared. The other endpoint $x_(d \, s)$ either has its one source positive ball average outermost, with shared inner history, or is shared after that ball has been removed.]
  #emph[Each specified eligible ball output, using its source positive average or one individual allowed pad as a singleton average, satisfies (6.6). Each specified shared output satisfies the shared conclusion of Lemma 27, with one union of required right-endpoint cells across its uses.]
] <cor:h-transfer-endpoint-variation>

#proof[
  The calculation for $hat(Z)$ in (6.8) applies to each of these remaining source histories before recombination: it uses their original order and inherited families, not the removed output-side factors. For a no-ball history use the shared part of that proof. The controlled signed constituents and averages are restored in the same way. This gives the asserted bound per history or individual endpoint.
  In particular, a nonterminal outgoing band $\( Q_(c \, p \, s) - Q_(c \, p - 1 \, s) \) x_(c \, s)$ is a difference of two eligible endpoints. A terminal ball band is the shared $x_(c \, s)$ minus the positive endpoint $Q_(c \, P \, s) x_(c \, s)$; the shared term is counted once. Splitting one band costs a fixed factor, and summing the $P + 1$ bands retains the allowed polynomial cost in $P$. ◻
]

=== 6.3 The input in a frozen mode row <the-input-in-a-frozen-mode-row>

We next replace the fixed-input evaluation in #emph[Composition with the lift and main histories] of #cite(label("H")) Section 8. The modes in that construction form a catalog separate from the main columns. Let $D_(*)$ be its budget, and let $K$ be the positive dyadic integer chosen by H for the analysis-block length after its mode and gap parameters. The quantitative conventions are

#[#set math.equation(numbering: n => "(6.9)")
 $ log D_(upright("base")) \, med log D_(upright(m)) lt.eq C_q k^C \, #h(2em) log D_(*) lt.eq C_q \( 1 + k + P \)^C \,\
K lt.eq C_q \( 1 + k + P \)^(C_5) \, #h(2em) G_0 = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_q \( 1 + log \( 2 k \) \)^C #scale(x: 120%, y: 120%)[\)] . $ <eq:h-budget-hierarchy>]

The budget $D_(*) gt.eq e^k$ covers mode counts, coefficient sums, rational heights, and inverse private weights. It also bounds the available mode labels over relevant groups on a path and the actual cell/group uses. The horizontal parameter dimension of a tag or of two tags together is at most $d_max lt.eq C_q k^C$. All displayed polynomial degrees have absolute upper bounds before $q$ is chosen.

Partition the attempt depths into $\[ b \, b + K \)$, and put

$ u_b = b - 4 K \, #h(2em) v_b = b - 2 K \, #h(2em) t_b = b + K . $

Write $r_s = 2^(- s) \| J \|$ for the interval length at original depth $s$. In a $B$ slot freeze the full endpoint output $Z_(l \, G \, u_b)$, with value zero when $u_b$ precedes the attempt. It is computed from $F_(l \, u_b)$ on whole $u_b$-cells, whether or not the group is current there. A $v_b$-cell is retained for this operation only when a descendant actual use occurs in the block.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.8), (11.11, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((11.11, 0.8), [#text(size: 9pt)[depth]], anchor: "west", padding: 0.1176cm)
  line((0.475, 0.66), (0.475, 0.94), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.275, 0.66), (4.275, 0.94), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.075, 0.66), (8.075, 0.94), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9.975, 0.66), (9.975, 0.94), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((8.075, 1.1), (9.975, 1.6), fill: rgb("#ebebeb"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9.025, 0.8), (9.025, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((9.025, 1.35), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ebebeb"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s$]]])])
  content((9.025, 1.86), [#text(size: 9pt)[actual uses]])
  line((0.6175, 2.25), (7.932, 2.25), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", length: 0.17cm, fill: black), end: (symbol: ")>", length: 0.17cm, fill: black)))
  content((4.275, 2.25), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$4K$ depths]]])])
  content((0.475, 0.45), [#text(size: 9pt)[$u_b=b-4K$#linebreak()freeze $Z_(l,G,u_b)$]], anchor: "north", padding: 0.1176cm)
  content((4.275, 0.45), [#text(size: 9pt)[$v_b=b-2K$#linebreak()common test cell]], anchor: "north", padding: 0.1176cm)
  content((8.075, 0.45), [#text(size: 9pt)[$b$#linebreak()block begins]], anchor: "north", padding: 0.1176cm)
  content((9.975, 0.45), [#text(size: 9pt)[$t_b=b+K$#linebreak()block ends]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The depth convention of the first-match construction in #cite(label("H")) Section 8. In the analysis block $\[ b \, b + K \)$, the basic output in slot $l$ is frozen at $u_b = b - 4 K$, tested on common cells at $v_b = b - 2 K$, and used at actual depths $b lt.eq s < t_b = b + K$. The deterministic input block partitions in Theorem 11 need not align with these analysis blocks. ],
) <fig:frozen-depths>

A primary in this mode construction is an individual main column $Phi$ matched to the maximal pad of the role’s outer ball filter. At its first match on a cell $I_0$, the #emph[First-match expansion and bounded lift] Lemma of #cite(label("H")) Section 8 chooses a finite list of augmented modes. For each prospective branch offset $rho$, the modes use H’s cutoff $zeta^rho$ and gauge $p^rho$ in the form

$ psi_m \( y \) = (zeta^rho \( y \) e \( kappa_l p^rho \( y \) \) e \( lambda_m y^2 + gamma_m y \) \, sqrt(epsilon.alt_(upright(m))) thin upright(bold(e))_m) . $

The list, its labels, and its scalar expansion coefficients $a_(Phi \, m)$ are retained on every relevant descendant of the first match; separate first-match branches may use separate private labels. They are not resampled at later freezing times, including when a coefficient subsequently frozen is zero. All modes of one primary have one $lambda_m$. The quantities $\| lambda_m \| \| I_0 \|^2$, $sum_m \| a_(Phi \, m) \|$, their number, and the heights of their relative linear-frequency vectors are bounded by a quantity whose logarithm is polynomial in $P \, k$.

For a fixed prospective offset the same source Lemma gives one pointwise bounded linear map $cal(R)_(l \, G)$, fixed across blocks. On an outer main output $sum_Phi beta_Phi Phi$ with coefficients constant on an endpoint cell, it gives exactly $sum_(Phi \, m) beta_Phi a_(Phi \, m) psi_m$. Thus

$ tilde(Z)_(l \, G \, b) = cal(R)_(l \, G) Z_(l \, G \, u_b) $

has coefficients constant on its whole $u_b$-cell. The mode labels and their private coordinates use $D_(*)$; the main endpoint projections still use $D_(upright(m))$.

Write $cal(H)_(upright("mode"))$ for the augmented mode Hilbert space.

#thm([Lemma 6.3.])[
  (Frozen composition with depth inputs).  #emph[Fix a slot, one search leaf and its color, and a prospective choice of the offsets for its groups, with the corresponding block-independent maps $cal(R)_(l \, G)$. For every group $G$ of that color, let $P_e$ be finitely many local mode projections: $P_e$ is the orthogonal projection in $L^2 \( J_e \; cal(H)_(upright("mode")) \)$ onto constant-coefficient combinations of the restrictions of its available augmented modes. Extend it to $L^2 \( R \; cal(H)_(upright("mode")) \)$ by restricting the input to $J_e$ and extending the output by zero. Suppose these rows have joint squared Bessel bound at most $G_0$ in each group.]
  #emph[Suppose $J_e subset.eq U_e$, where $U_e$ is a main endpoint cell with a downstream actual-use certificate and is usable for each nonzero pad range contributing to $overline(L)_(l \, G \, U_e)$. The row’s mode labels are available already at $U_e$. Write 
$ B_(l \, U_e) = sum_(tau = 1)^(h_0) epsilon_tau Q_(l \, U_e)^tau F_(l \, s \( U_e \)) \, #h(2em) h_0 lt.eq 2 \, $

 for its specified basic-$B$ expression, and let $cal(B)_(l \, U_e)$ be the shared main history of the leaf. Then 
#[#set math.equation(numbering: n => "(6.10)")
 $ sum_(G \, e) parallel P_e cal(R)_(l \, G) overline(L)_(l \, G \, U_e) cal(B)_(l \, U_e) B_(l \, U_e) parallel_2^2 lt.eq G_0 \| R \| . $ <eq:h-frozen-composition>]

 Endpoint depths may be arbitrary and need not be current; any number of rows may share one endpoint cell. The bound is uniform in the prospective choices of offsets.]
] <lem:h-frozen-composition>

#proof[
  We first form an ordinary joint Bessel operator using the fixed lift, outer main projections, and usable-endpoint synthesis. We then insert the shared histories and the constituent basic projection, and only afterward evaluate the rows on their varying endpoint inputs.
  For a fixed group the rows $P_e cal(R)_(l \, G)$ are Bessel because $cal(R)_(l \, G)$ is one fixed bounded operator. They are local to $J_e$, hence to the containing decision cell $U_e$. Compression inserts an outer individual main projection on $U_e$; the triangle inequality in the finite Hilbert sum of rows restores its positive average. If $A_G$ denotes this row operator, an individual row adjoint has the order
  $ L_(l \, G \, U_e) cal(R)_(l \, G)^(*) P_e . $
  Its range is the main ball range on the whole $U_e$. The pad usability hypothesis and (6.3) therefore give
  $ ∥sum_G A_G^(*) w_G∥_2^2 lt.eq C sum_G parallel A_G^(*) w_G parallel_2^2 lt.eq G_0 sum_G parallel w_G parallel^2 . $
  By duality, the ordinary rows are jointly Bessel across all groups and rows. Their use of the whole endpoint $U_e$ is the reason the synthesis bound applies despite the smaller output cell $J_e$.
  Apply Compression again at the decision cells $U_e$ to insert the shared histories and one fixed basic constituent. Expand complements into their signed ordered products and retain normalized positive averages. For each coupled expanded term, the resulting ordinary rows $T_e$ satisfy
  #[#set math.equation(numbering: n => "(6.11)")
   $ sum_(G \, e) parallel T_e h parallel_2^2 lt.eq G_0 parallel h parallel_2^2 quad upright("for every ") h in L^2 \( R \; cal(H) \) . $ <eq:h-frozen-operator>]
  Every nonzero basic constituent has its input-side projection $Q_(l \, U_e)^tau$, even if all other selected factors are identities. Thus the final action of $T_e^(*)$ is $Q_(l \, U_e)^tau$, and its range is a main-catalog combination on the entire $U_e$. The composed row has input support on $U_e$. Grouping rows by $s \( U_e \)$, the full depth partition serves as both input-support and observation partition, and the read is $F_(l \, s \( U_e \))$. These partitions refine and the read indices increase. Equation (5.3), applied to (6.11) with budget $D_(upright(m))$, proves (6.10) after restoring the controlled signed terms and averages.
  The mode projections entered the ordinary Bessel operator before this last evaluation. The final adjoint range is the basic main range on $U_e$, so the row estimate uses $D_(upright(m))$. For a row from block $b$, its read and observation depth are $s \( U_e \) = u_b$, regardless of the later mode-output cell $J_e$ or the actual use depth. ◻
]

Lemmas 27 and 29 now provide the cross-depth variation and frozen-evaluation bounds needed for H’s mode split. We next verify the resulting side energy and component data.

=== 6.4 Side and core data from the frozen modes <side-and-core-data-from-the-frozen-modes>

Fix a prospective choice of the group offsets. On each retained $v_b$-cell, make H’s permitted choice to keep the full available mode list frozen at $u_b$, including every matched primary and every zero-coefficient label. PRE and CURRENT mean exactly the graphs of Equation (H.22) in #cite(label("H")) Section 8 on that list and that same $v_b$-cell. Their edge tests use the supremum of the affine-slope difference $omega_m \( x \) - omega_(m') \( x \)$, where $omega_m \( x \) = 2 lambda_m x + gamma_m$, after the source’s permitted integral shifts. The comparison scales are $r_(v_b)$ for PRE and $r_(t_b)$ for CURRENT. A minimal PRE component and a minimal CURRENT component are their respective height-zero components. Available lists and old labels persist on relevant descendants; admitted edges persist or grow as the source height or descendant block advances.

We retain H’s source-defined good predicates and core/side classification. The #emph[Coherence of good predicates] Lemma says that a minimal PRE component classified as side consists entirely of side modes. It also says that the upper good-height masks select unions of complete core subtotals inside minimal CURRENT components. A minimal CURRENT component may contain side modes as well. At an upper height, a successful CURRENT component means one containing a core mode good at that height; its good modes have one PRE predecessor at the prescribed lower height.

For a $B$ role, let $V_(l \, G \, b)$ be the exact subtotal of the side modes of $tilde(Z)_(l \, G \, b)$, including their private coordinates, on retained $v_b$-cells. Set it to zero on branches without a needed output or certificate. For the fixed prospective offset it is one fixed function throughout the block. We verify the source square-energy estimate for these new frozen operands.

An event in the proof of #emph[Square energy of the linear side] in #cite(label("H")) Section 8 consists of a block, a retained $v_b$-cell $J$, and a minimal PRE component $cal(E)$ of side modes. The #emph[Separated mode rows] Lemma and the #emph[Bad-density chains] Lemma organize its projection rows into ten block congruence classes and $O \( d_max log \( 2 D_(upright(m)) \) \)$ chain levels. The source chain calculation absorbs its larger mode-height parameter before this final length bound. Thus the per-group squared Bessel cost is $G_0$. Lemma 29, with $U_e$ the containing $u_b$-cell, gives the source Equation (H.24):

$ sum_(G \, b \, J \, cal(E)) parallel P_(cal(E) \, J) tilde(Z)_(l \, G \, b) parallel_2^2 lt.eq G_0 \| R \| . $

Here $P_(cal(E) \, J)$ is the local projection onto that component’s augmented modes. If $T_(cal(E) \, J)$ is its exact coefficient subtotal, the source separation and the bound $sum_m \| alpha_m \| lt.eq D_(*)$ on the frozen cell give

$ parallel P_(cal(E) \, J) tilde(Z) - T_(cal(E) \, J) parallel_(2 \, J) lt.eq D_(*)^(- 190) . $

The path budgets sum these additive errors. Almost orthogonality of the distinct minimal PRE subtotals then yields

#[#set math.equation(numbering: n => "(6.12)")
 $ sum_(G \, b) parallel V_(l \, G \, b) parallel_2^2 lt.eq G_0 \| R \| . $ <eq:h-linear-energy>]

This deduction is uniform in the prospective choices of offsets. It uses the persistent lists and graphs and each endpoint’s own coefficient subtotal; it requires no relation between coefficients frozen in different blocks.

Let $A_(l \, G \, b)$ be the exact core subtotal. In a $B$ role define

$ S_(l \, G \, s)^(upright("roll")) = Z_(l \, G \, s) - Z_(l \, G \, u_b) \, #h(2em) S_(l \, G \, s) = S_(l \, G \, s)^(upright("roll")) + V_(l \, G \, b) \, quad b lt.eq s < b + K . $

The physical identity in #emph[Fixing offsets and separating the side terms] of #cite(label("H")) Section 8 is

#[#set math.equation(numbering: n => "(6.13)")
 $ \( Z_(l \, G \, s) \)_(upright("phys")) = \( A_(l \, G \, b) \)_(upright("phys")) + \( S_(l \, G \, s) \)_(upright("phys")) + cal(E)_(l \, G \, b) \,\
cal(E)_(l \, G \, b) = \( Z_(l \, G \, u_b) \)_(upright("phys")) - \( tilde(Z)_(l \, G \, b) \)_(upright("phys")) . $ <eq:h-core-side>]

In a basic-$U$ role there is no core: set $S_(l \, G \, s) = Z_(l \, G \, s)^(thin U)$ and take no physical error. The core and side subtotals retain their augmented coordinates in all norm estimates.

This decomposition determines the remaining estimates. Terms with at least three side positions will use their path-square bounds at a power $p in \( 2 \/ 3 \, 1 \)$. Terms with exactly two sides will restore the two whole current complements and use filter transfer. Terms with at least three cores will use H’s conditional counting estimate. For a powered within-cell group contribution $x$, the truncation gives $min \( eta \, x \) lt.eq eta^(1 - p) x^p$. The transfer’s bands with adjacent pad indices will be estimated at power one, with their prescribed fixed-offset sums kept inside the cell.

It remains to select the offsets. The main catalogs, the coefficients $beta_Phi$ in $Z_(l \, G \, u_b) = sum_Phi beta_Phi Phi$ on each whole $u_b$-cell, and all actual main uses were fixed before the prospective offsets. With the source accuracy $delta_c = exp \( - k^(C_c) \)$, where $C_c$ is chosen after the main budgets, H’s explicit lift and offset average give

$ bb(E)_rho sum_(l \, G \, I med upright("used")) \| I \| parallel cal(E)_(l \, G \, b \( I \)) parallel_(2 \, I)^2 lt.eq D_(upright(m))^C d_max delta_c thin \| R \| . $

This sum is over all those pre-existing actual uses, before any offset-dependent cuts. The coefficient and physical supremum bounds are on the whole $u_b$-cell. By (5.1), its operand $F_(l \, u_b)$ has normalized norm at most one, so the lag $4 K$ introduces no size factor. Choose offsets satisfying the displayed bound, with the inverse-main-budget accuracy $delta_c$ prescribed by H. The uniform estimate (6.12) remains valid for this choice, and subsequent pruning only removes terms from the nonnegative error sum.

The chosen whole augmented states $S_(l \, G \, s)$ are now fixed. Realize H’s helper closure on these states and their named histories by the same fixed-base calculation (6.1)–(6.2). There are at most $exp \( C_q k^C \)$ such bases per active cell over the specified slots, groups, and patterns. They are whole states, with no choice of a mode, height, or amplitude as a helper base. Their existing private coordinates are distinct from the fresh helper directions. This realizes the anticipated helper count within $D_(upright(m))$. The dependent size and counting cuts described next are imposed after these choices.

The separate integrated square bounds for the side components follow from the two new lemmas and the basic energy. For the rolling component, apply (6.6) to $\[ u_b \, s \]$, $b lt.eq s < b + K$, with the unions of actual $s$-cells as endpoint sets; these intervals have $O \( K \)$ overlap. At each depth the use cells for fixed $G \, b$ are disjoint, so a fixed $V_(l \, G \, b)$ is counted at most $K$ times. In a $U$ role, (6.4) at each depth and the basic energy in (5.28) bound the current outputs. Consequently

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(s \, G) sum_(I med upright(u s e d med a t) med s) \| I \| parallel S_(l \, G \, s)^(upright("roll")) parallel_(2 \, I)^2 & lt.eq C K G_0 \| R \| &  & upright("in a ") B upright(" role") \,\
sum_(s \, G) sum_(I med upright(u s e d med a t) med s) \| I \| parallel V_(l \, G \, b \( s \)) parallel_(2 \, I)^2 & lt.eq K G_0 \| R \| &  & upright("in a ") B upright(" role") \,\
sum_(s \, G) sum_(I med upright(u s e d med a t) med s) \| I \| parallel S_(l \, G \, s) parallel_(2 \, I)^2 & lt.eq P^C \| R \| &  & upright("in either role") \,\
sum_(s \, G) sum_(I med upright(u s e d med a t) med s) \| I \| parallel Z_(l \, G \, s)^(thin U) parallel_(2 \, I)^2 & lt.eq G_0 \| R \| &  & upright("in a ") U upright(" role") . $ <eq:h-side-square>]

The first two inequalities concern a $B$ role. Their sum bounds its whole $S$ by the squared triangle inequality. The fixed polynomial in $k$ from the basic energy is included in $G_0$.

H’s componentwise first-crossing construction in #cite(label("H")) Section 7, Side estimate applies to this finite list of components. Apply it separately to the nonnegative partial path sums for $S^(upright("roll"))$, for the repeated $V$, and for the basic-$U$ output when present, using their respective integrated bounds above. By increasing the thresholds by fixed factors, their first-crossing cells have any prescribed small fixed total relative length. On the retained paths this gives

#[#set math.equation(numbering: n => "(6.15)")
 $ sum_(s \, G) parallel S_(l \, G \, s)^(upright("roll")) parallel_(2 \, I_s \( x \))^2 & lt.eq P^C &  & upright("in a ") B upright(" role") \,\
sum_(s \, G) parallel V_(l \, G \, b \( s \)) parallel_(2 \, I_s \( x \))^2 & lt.eq P^C &  & upright("in a ") B upright(" role") \,\
sum_(s \, G) parallel Z_(l \, G \, s)^(thin U) parallel_(2 \, I_s \( x \))^2 & lt.eq P^C &  & upright("in a ") U upright(" role") \,\
sum_(s \, G) parallel S_(l \, G \, s) parallel_(2 \, I_s \( x \))^2 & lt.eq P^C &  & upright("in either role") . $ <eq:h-side-cap>]

Only actual uses are summed. The final cap follows from the separate component caps and $parallel S^(upright("roll")) + V parallel^2 lt.eq 2 parallel S^(upright("roll")) parallel^2 + 2 parallel V parallel^2$. The exponent may be increased for the polynomially many configurations where a power cost is allowed.

These separate caps also give the local input for H’s component sizes. At a retained $B$ use, the current local size of $Z_s$ is bounded by contraction and (5.28). The bounded lift and $Z_(u_b) = Z_s - S_s^(upright("roll"))$ therefore give

$ parallel tilde(Z)_(l \, G \, b) parallel_(2 \, I) + parallel V_(l \, G \, b) parallel_(2 \, I) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel Z_(l \, G \, s) parallel_(2 \, I) + parallel S_(l \, G \, s)^(upright("roll")) parallel_(2 \, I) #scale(x: 120%, y: 120%)[\)] + parallel V_(l \, G \, b) parallel_(2 \, I) lt.eq P^C . $

The core subtotal $A = tilde(Z) - V$ has the same type of local bound. H’s local $L^2$ form estimate and Cauchy–Schwarz over the original actual uses now turn the selected integrated physical-error bound into total absolute error $O \( e^(- k) \| R \| \)$.

We next record the representative and top-count inputs for the core calculation. A successful component’s type is the pair of floor logarithms, to base $1.1$, of its unique good PRE predecessor’s primary count and mode count. For a fixed role, group, upper height, and type, the #emph[Hereditary representatives] Lemma of #cite(label("H")) Section 8 chooses a mode label $a$ in each such predecessor and inherits it on later contained predecessors. Write $z$ for the group’s primary center and $theta_z$ for the horizontal vector in its tag. H uses $theta.alt = theta_z \/ Q_0$, where $Q_0$ is H’s denominator-clearing integer common to the roles of this group. Write $L_h \, E_h \, Xi$ for the source shift denominator, shift range, and separation threshold. For distinct representatives on comparable actual cells $I \, I'$ and $x_(*) in I ∩ I'$, it gives

#[#set math.equation(numbering: n => "(6.16)")
 $ \| omega_a \( x_(*) \) - omega_(a') \( x_(*) \) + n dot.op theta.alt \/ L_h \| > Xi / 2 max \( \| I \|^(- 1) \, \| I' \|^(- 1) \) quad \( n in bb(Z)^(dim theta_z) \, med \| n \|_oo lt.eq E_h \) . $ <eq:h-representative-separation>]

The identification across depths is the persistent mode label and its value $omega_a \( x_(*) \)$.

For an actual cell $I$ and a successful component $cal(F)$, H uses

$ sigma_(cal(F))^2 = sum_(cal(D) subset.eq cal(F)\
cal(D) med upright(m i n i m a l med C U R R E N T)) (parallel A_(cal(D)) parallel_(2 \, I) + D_(*)^(- 30) #h(-0.16667em) #h(-0.16667em) sum_(m med upright("core")\
m in cal(D)) \| alpha_m \|)^2 . $

Here $A_(cal(D))$ is the complete core subtotal within $cal(D)$; side labels in that component are kept separately. The #emph[Component-size comparison] Lemma of #cite(label("H")) Section 8 gives the same-cell bounds

$ sigma_(cal(F))^2 lt.eq C #scale(x: 120%, y: 120%)[\(] parallel P_(cal(F) \, I) tilde(Z)_(l \, G \, b) parallel_(2 \, I)^2 + parallel V_(cal(F)) parallel_(2 \, I)^2 + D_(*)^(- 50) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sum_(cal(F)) parallel V_(cal(F)) parallel_(2 \, I)^2 lt.eq C parallel V_(l \, G \, b) parallel_(2 \, I)^2 . $

The projection $P_(cal(F) \, I)$ uses all mode labels of $cal(F)$ on $I$, and $V_(cal(F))$ is their exact side subtotal. This is an almost-orthogonality estimate for arbitrary coefficient subtotals on one cell.

For a fixed source role, upper height, type, and dyadic threshold $D_(*)^(- 1) lt.eq sigma lt.eq D_(*)^2$, H takes, for each group and representative, the first actual-use cells on each spatial branch for which $sigma_(cal(F)) gt.eq sigma$. Several incomparable tops for the same group and representative are allowed. The resulting top rows $P_(cal(F) \, I)$ are separated mode rows. They are supported on $I subset.eq U_e$, the $u_b$-cell of the frozen list, and the top itself is a downstream certificate. Applying Lemma 29 gives squared energy $G_0 \| R \|$ for their frozen projections. Summing the side term of the size comparison first at one depth and then through a block gives at most $K sum_(G \, b) parallel V_(l \, G \, b) parallel_2^2 lt.eq K G_0 \| R \|$. The $D_(*)^(- 50)$ floor is absorbed because $sigma^2 gt.eq D_(*)^(- 2)$. Hence

$ sigma^2 sum_(upright("tops")) \| I \| lt.eq C \( 1 + K \) G_0 \| R \| . $

There are polynomially many choices in $P \, k$ of height, type, and threshold. The first-crossing construction of the #emph[Top count] Proposition in #cite(label("H")) Section 8 gives, on retained paths,

#[#set math.equation(numbering: n => "(6.17)")
 $ sum_G \| cal(A)_j^G \| lt.eq min \( D_(*) \, P^C sigma_j^(- 2) \) . $ <eq:h-top-count>]

Here $cal(A)_j^G$ is the set of distinct representatives actually used in the bin $\[ sigma_j \, 2 sigma_j \)$ along the retained path in question, for the fixed role, height, and type. The full label budget supplies the minimum for $sigma_j < D_(*)^(- 1)$; bins above the tested range are empty after the source budget enlargement. Finally, the local bounds on $tilde(Z)$ and $V$ above and the component-size comparison give $sigma_(cal(F)) lt.eq P^C$ on retained uses. These are the local sizes and role counts needed by the core calculation.

=== 6.5 The side estimate <the-side-estimate>

We use the #emph[Side estimate] Proposition of #cite(label("H")) Section 7, with the component bounds just verified. Suppose first that three positions have sizes whose path squares obey (6.15). Along a path put $a_s = \( sum_G a_(s \, G)^2 \)^(1 \/ 2)$ and define $b_s \, c_s$ analogously, using a shared size directly when appropriate. Cauchy–Schwarz in the group index bounds the absolute group sum by $P^C a_s b_s c_s$, using the retained bound $P^C$ for the fourth local size. For $2 \/ 3 < p < 1$, Hölder and $3 p > 2$ give

$ sum_s \( a_s b_s c_s \)^p lt.eq (sum_s a_s^2)^(p \/ 2) (sum_s b_s^2)^(p \/ 2) (sum_s c_s^2)^(p \/ 2) . $

Integrating the path caps therefore gives total length-weighted $p$th-power cost $P^C \| R \|$. The power is taken after the group sum at each original cell.

For exactly two sides, replace their two core complements in (6.13) by the whole current $Z$ arguments. The corrections have a third side, apart from the physical errors already estimated. We recall the source filter algebra for these whole complements. Let the side positions be $a \, b$ and the complementary positions be $c \, d$. Expand each complementary factor $1 - overline(Q)$ as identity minus a positive average. The #emph[Outgoing filters and near-band defects] Lemma of #cite(label("H")) Section 6 removes the positive filters from $c \, d$ in decreasing rank and transfers helper averages to the fixed whole state $S_a$. Its final main term is

$ H_I \( cal(D)_(a \, s) S_a \, S_b \, B_c \, B_d \) \, $

where $cal(D)_(a \, s)$ has $O \( log cal(L) \)$ helper factors.

For one step from $c$ to $a$, write $Q_(l \, p)$, $1 lt.eq p lt.eq P$, for the outgoing and corresponding helper projections, and put

$ Q_(l \, 0) = 0 \, quad Q_(l \, P + 1) = 1 \, quad A_l^p = Q_(l \, p) - Q_(l \, p - 1) \, quad overline(Q)_l = P^(- 1) sum_(p = 1)^P Q_(l \, p) . $

Here $x_c$ is the exact remaining input-side source history on $B_c$, $x_d$ is the whole remaining history on $B_d$, $x_a$ is the already transferred helper history on $S_a$, and $x_b = S_b$. The exact difference is

#[#set math.equation(numbering: n => "(6.18)")
 $ H_I \( x_a \, x_b \, overline(Q)_c x_c \, x_d \) - H_I \( overline(Q)_a x_a \, x_b \, x_c \, x_d \) = sum_(p \, q' = 1)^(P + 1) frac(p - q', P) H_I \( A_a^p x_a \, x_b \, A_c^(q') x_c \, x_d \) . $ <eq:h-transfer>]

The pad projections are nested on this cell, so the $A_l^p$ are orthogonal bands summing to the identity. The average has weight $\( P - p + 1 \) \/ P$ on band $p$, which proves the identity. H’s closure and tag-separation estimates bound the sum with $\| p - q' \| > 2$ by $D_(upright("base"))^(- C_3) parallel S_a parallel_(2 \, I) parallel S_b parallel_(2 \, I)$, for any prescribed fixed $C_3$ after choosing its numerical accuracies. The helper closure here uses the already fixed whole $S_a$ as its base in (6.1). For the retained terms, keep the entire band sum at each fixed offset $q' - p$.

In the final main term, write $B_c = Y_c - U_c$ and $B_d = Y_d - U_d$. Each correction has a third basic side. The remaining complementary pair $Y_c \, Y_d$ has form norm at most $eta$ against the two side inputs, by the full-pair statement of Proposition 26. Contraction of the helper factors and Cauchy–Schwarz in the side sizes give absolute main cost $eta P^C \| R \|$. The numerical transfer errors are summable with the chosen inverse-base-budget accuracy.

For a retained offset, write $C_(G \, s)^(q') = A_c^(q') x_(c \, s)$ for the outgoing complementary band stack and $D_(G \, s) = x_(d \, s)$ for the other complement. Freeze both at the block start $b$, using their full endpoint evaluations there. These endpoints differ from the mode freezing depth $u_b$. Corollary 28 applies to exactly these source histories. For a ball transfer, a nonterminal band is the difference of two eligible positive ball endpoints; its terminal band is the shared inner history minus the positive $P$-pad endpoint. For a cumulative transfer, the outer ball has already been removed and all the complementary endpoints are shared. The other complement has its one source positive outer ball or is shared. Thus each band costs a fixed multiple of its endpoint estimates, and the shared histories are counted once across their uses. Summing the $P + 1$ bands and the $O \( K \)$ overlap of $\[ b \, s \]$ retains the allowed polynomial cost $P^C \| R \|$. Their nonnegative partial path sums enter the power-cost first-crossing cuts.

At a required endpoint the pad bands are orthogonal, and the remaining source histories are contractions of bounded basic inputs. Choose $C_(upright("fr")) gt.eq 1$ to dominate the retained current local norm of the band stack and of the other complement. A freeze error has a third path-square size by the preceding endpoint bounds. If the other frozen complement is large, write it as its bounded current value plus its difference. Likewise, if a frozen local size exceeds $2 C_(upright("fr"))$ while the current one is at most $C_(upright("fr"))$, then the difference exceeds $C_(upright("fr"))$, and the flag is at most $C_(upright("fr"))^(- 2)$ times the squared difference size. Its square root is therefore another path-square size. Certified variation applies on the whole ancestor cells with downstream certificates; propagation through a block costs at most $K$ in this power budget. H’s freeze, large-complement, and restoration errors therefore have total $p$th-power cost $P^C \| R \|$. A large-complement flag is charged to that error sum; only a first crossing of its accumulated budget makes a restart cut. On the remaining uses the frozen complements have bounded local sizes on their entire ancestor hulls in the block.

==== 6.5.1 Fixed stacks for the two side inputs <fixed-stacks-for-the-two-side-inputs>

Fix a source transfer step, a near offset, and a search leaf. Under these fixed data, let $chi$ record the source auxiliary side-component and binary-length names for the two side stacks. Pairing their choices raises the auxiliary count to a fixed power, so a common auxiliary list has at most $G_0$ entries after enlarging $G_0$ within its stated class; unused combinations are set to zero. Write $nu = \( G \, b \, chi \)$ for the full stack index. Concrete binary interval positions and band labels $p$ are stack coordinates, and individual pads remain in coupled averages. For one full index, a stored side stack is a function into a finite Hilbert direct sum:

$ upright("stack")_(upright("untouched") \, nu) \( y \) = \( W_(nu \, i) \( y \) \)_(i in cal(I)_nu) in xor.big_(i in cal(I)_nu) cal(H) \,\
parallel upright("stack")_(upright("untouched") \, nu) parallel_2^2 = sum_i parallel W_(nu \, i) parallel_2^2 . $

The banded stack $upright("stack")_(a \, nu)$ has in addition the band index $p in { 1 \, dots.h \, P + 1 }$. Here $cal(H)$ is the augmented ambient Hilbert space of the stored coordinates. Each whole coordinate is restricted, when formed, to the union of the use cells selecting its position and valid band. Later cuts remove summands without changing that stored function. At a use, each side selects one position; the banded side retains all valid matched band indices at the fixed offset.

The source stack construction gives the squared energies

#[#set math.equation(numbering: n => "(6.19)")
 $ sum_nu parallel upright("stack")_(a \, nu) parallel_2^2 lt.eq P G_0 \| R \| \, #h(2em) sum_nu parallel upright("stack")_(upright("untouched") \, nu) parallel_2^2 lt.eq G_0 \| R \| . $ <eq:h-stacks>]

Both sums range over all full indices $nu = \( G \, b \, chi \)$. The $G_0$ cardinality overhead counts only the auxiliary labels $chi$; both energies sum all groups and blocks. Their quantitative purpose is the following. The whole-hull maximal and sparse calculation below turns these energies into a root-size sum with cost $P^(1 \/ 2) G_0 \| R \|$. The coefficient $O \( P^(- 1) \)$ in the matched transfer bands then leaves the gain $P^(- 1 \/ 2)$. We first check the fixed-vector arguments behind (6.19).

For a sequence $W_s$ in one block, write

$ W_s = W_b + sum_(\[ r \, t \] in cal(P) \( b \, s \)) \( W_t - W_r \) \, $

where $cal(P) \( b \, s \)$ is the binary decomposition of the prefix. At a fixed length its intervals are disjoint and at most one is selected at a use. Store each resulting function on its selecting-use union as above. For a basic-$U$ side, store each already formed depth function directly; (6.14) bounds its energy, and subsequent helper products are local contractions.

For a linear side $V_(G \, b)$, let $T_s$ be the product of the subsequent helper projections, including one endpoint of a band difference when needed. The products-of-prefixes estimate of #cite(label("H")) Section 3, on at most $K + 1$ times, gives for each fixed binary length

$ parallel T_b V_(G \, b) parallel_2^2 + sum_(\[ r \, t \] med upright(a t med t h a t med l e n g t h)) parallel \( T_t - T_r \) V_(G \, b) parallel_2^2 lt.eq \( C log \( K + 2 \) \)^(O \( m \)) parallel V_(G \, b) parallel_2^2 . $

The input $V_(G \, b)$ is the one fixed function on the block. Use (6.12), sum the logarithmic length choices, and pay at most $P + 1$ band indices for the first stack.

For a rolling side put $W_s = T_s \( Z_(G \, s) - Z_(G \, u_b) \)$. Its base value uses (6.6) on $\[ u_b \, b \]$, whose overlap across blocks is bounded. Its increments split exactly as

$ W_t - W_r = T_t \( Z_(G \, t) - Z_(G \, r) \) + \( T_t - T_r \) \( Z_(G \, r) - Z_(G \, u_b) \) . $

The first term uses certified variation on the whole endpoint cells containing its selected use cells. For the second, also decompose $\[ u_b \, r \]$ into binary intervals. Fix an outer length, an inner length, and an inner interval $\[ a \, v \]$. Every outer position selecting this interval acts on the one fixed function

$ X = upright(bold(1))_Omega \( Z_(G \, v) - Z_(G \, a) \) \, $

where $Omega$ is the union of its required $r$-cells. Since $v lt.eq r$, locality of $T_t - T_r$ gives the required outputs from $X$. Enlarge $Omega$ to the containing whole $v$-cells to bound its norm; those cells have downstream certificates. The fixed-vector product-jump estimate sums the outer positions by $\( C log \( K + 2 \) \)^(O \( m \)) parallel X parallel_2^2$. Then (6.6) sums these squared inputs over groups and the disjoint inner intervals at that length. The $O \( K \)$-depth windows for different blocks have bounded overlap. The two endpoint outputs in $X$ use $F_v$ and $F_a$, but $X$ itself is fixed once $a \, v$ are fixed, as required for the outer product-jump estimate.

This proves (6.19). Coupled pad averages are restored by Jensen’s inequality. When the fixed search-leaf and transfer-step choices are restored later, their auxiliary overhead fits an enlarged $G_0$.

We collect the main-row and stack costs here. For $m = O \( log cal(L) \) = O \( log k \)$, the Compression factor in (5.12) satisfies

$ log frak(C) \( m \, D_(upright(m)) \) lt.eq C \( m + 1 \) #scale(x: 120%, y: 120%)[\(] log \( m + 1 \) + log log \( 2 D_(upright(m)) \) #scale(x: 120%, y: 120%)[\)] lt.eq C_q \( 1 + log \( 2 k \) \)^C . $

A row application loses $log \( 2 D_(upright(m)) \)$ in norm, hence $log^2 \( 2 D_(upright(m)) \)$ in squared energy. This loss, the controlled signed expansions, and the telescoping counts fit $G_0$. The factors $\( C log \( K + 2 \) \)^(O \( m \))$ and the binary length choices also fit $G_0$ by (6.9). Thus no fixed power of $K$ enters (6.19). Its powers in the component and top bounds stay in the allowed $P^C$ budgets. The larger $D_(*)$ is used in the mode construction, Bessel, and counting arguments; the final row adjoints in the two new lemmas use $D_(upright(m))$.

==== 6.5.2 The fixed-input comparison on a short block <the-fixed-input-comparison-on-a-short-block>

For $2 < q < 3$, put $M_q g = \( M \( \| g \|^q \) \)^(1 \/ q)$, where $M$ is the uncentered Hardy–Littlewood maximal operator. For every integer $N gt.eq 1$, let $C_N \( q \)$ be the least constant such that

#[#set math.equation(numbering: n => "(6.20)")
 $ sum_(I in cal(A)) \| I \| \| H_I \( g_0 \, g_1 \, g_2 \, g_3 \) \| lt.eq C_N \( q \) integral_(bb(R)) product_(j = 0)^3 M_q g_j $ <eq:h-fixed-local>]

for every dyadic lattice, finite collection $cal(A)$ in at most $N$ consecutive depths, admissible kernel family, and four compactly supported scalar $L^q$ functions $g_j$ fixed across the collection. The #emph[Local absolute estimate] Lemma of H gives $C_N \( q \) lt.eq C N$, so this constant is finite before its uniform bound is used.

For our application choose $N = d + 1$, where $d$ is the largest original depth in Theorem 11. The summation cells in each short-block piece are retained original active cells, with their original depths in ${ 0 \, dots.h \, d }$. Restarts only change their assigned attempt. Hull ancestors and completion leaves, including a boundary level one step below a block, supply the geometry and leaf norm conditions; they are not additional form summation cells.

We use the following specialization of the #emph[Short-block comparison] Lemma of #cite(label("H")) Section 7. Let a finite tree piece have internal summation cells in at most $K$ consecutive depths of this original $N$-depth range and leaves in that block or one depth below. Let deterministic Hilbert-valued stacks $upright(bold(z))_j$, supported on its root $Q$, satisfy $parallel upright(bold(z))_j parallel_(2 \, L) lt.eq s_j$ on every leaf $L$. Suppose scalar randomizations $z_j^sigma$ satisfy, for every finite real $a gt.eq 1$,

$ #scale(x: 120%, y: 120%)[\(] bb(E)_sigma \| z_j^sigma \( y \) \|^a #scale(x: 120%, y: 120%)[\)]^(1 \/ a) lt.eq C_a parallel upright(bold(z))_j \( y \) parallel quad upright("for almost every ") y \, $

with $C_a$ independent of the tree and $K$. Then, for arbitrary measurable signs $\| epsilon.alt_I \( sigma \) \| lt.eq 1$ and any subcollection of the internal cells,

#[#set math.equation(numbering: n => "(6.21)")
 $ bb(E)_sigma lr(|sum_I \| I \| epsilon.alt_I \( sigma \) H_I \( z_0^sigma \, dots.h \, z_3^sigma \)|) lt.eq \( 1 + C_N \( q \) \) C_q \( 1 + log \( K + 2 \) \)^C \( K + 2 \)^(C_19 \( q - 2 \)) \| Q \| product_j s_j . $ <eq:h-short-block>]

The degree $C_19$ is absolute. Products of at most two independent Rademacher randomizations of a finite vector stack satisfy the stated moment hypothesis.

Apply this comparison to the stacks in (6.19), the frozen complementary band stack, and the other frozen complement. The scalar inputs are sums of their physical components. Use independent signs $epsilon_i \, eta_j$ for the two position indices and signs $zeta_p$ for the band index. At the fixed offset $ell = q' - p$, index the complementary coordinate $q' = p + ell$ by $p$. Randomize the banded side by $epsilon_i zeta_p$, the untouched side by $eta_j$, and that complementary band coordinate by $zeta_p$. At a use put $epsilon_(i \( s \)) eta_(j \( s \))$ in the kernel. Expectation selects the two positions and all matched bands, leaving $\( p - q' \) \/ P = O \( P^(- 1) \)$. Iterated Khintchine inequalities bound every finite scalar moment by the augmented stack norm.

After fixing the signs, these randomized physical stack sums are fixed scalar $L^2$ functions. As a randomized family, they satisfy the pointwise moment bounds for every finite $a gt.eq 1$, controlled by the deterministic stacks with the stated leaf sizes; the randomizations are not asserted to lie in $L^q$. In H’s #emph[Return to the continuous form by bursts] step, fix the auxiliary random and fast parameters outside a null set. The burst inputs are then finite scalar linear combinations of indicators of bounded intervals with finite coefficients. They are therefore compactly supported $L^q$ functions fixed across the original summation cells. H applies (6.20) to these inputs with the original admissible kernels and then integrates the auxiliary parameters. The clipping and mixed-maximal calculation in that proof gives the exact block power $\( K + 2 \)^(11 \( q - 2 \) \/ \( q - 1 \)) lt.eq \( K + 2 \)^(11 \( q - 2 \))$; the remaining block factors are logarithmic.

For the whole-hull calculation, let $Omega_nu$ be the union of the use cells for one full index $nu = \( G \, b \, chi \)$. Its maximal use cells are disjoint roots, and the hull contains every cell between those roots and their uses. For the already fixed stack define

$ m_nu^(upright("full")) \( x \) = sup_(I med upright(i n med t h e med f u l l med h u l l)\
x in I) integral -_I parallel upright("stack")_nu parallel^2 . $

Set $m_nu^(upright("full")) = 0$ outside its hull. The supremum is defined on every whole hull cell, including branches below later cuts. A zero-energy family contributes nothing. Otherwise suppose a family has total stack energy $E \| R \|$ with $E > 0$, and $sum_nu \| Omega_nu \| lt.eq M_0 \| R \|$, where $M_0 lt.eq exp \( C_q k^C \)$ follows from the active cell/group path counts and the auxiliary-choice overhead, with all groups and blocks included in this support sum. The dyadic maximal calculation in #cite(label("H")) Section 7 gives

$ sum_nu \| { m_nu^(upright("full")) > T } \| & lt.eq min \( M_0 \| R \| \, C E \| R \| \/ T \) \,\
sum_nu integral_R min \( m_nu^(upright("full")) \, C_1 E \) & lt.eq C E \( 1 + log \( 2 + C_1 M_0 \) \) \| R \| . $

For a fixed sufficiently large $C_1$, first-crossing cuts on the individual and then joint partial ancestor suprema yield the retained caps

$ sum_nu m_(a \, nu) \( x \) lt.eq P G_0 \, #h(2em) sum_nu m_(upright("untouched") \, nu) \( x \) lt.eq G_0 . $

Here $m_(a \, nu) \, m_(upright("untouched") \, nu)$ use the retained hull cells, still taken whole. Include every potentially needed hull ancestor within the block before these common cuts. At a crossing the cell is removed before its value enters a retained cap; below a cut only earlier retained ancestors contribute. The caps therefore hold also on portions of retained hull cells below a cut, with the small relative length cost supplied by the full maximal bounds.

On each retained hull, make the source sparse decomposition: from a root $Q$, stop where either squared side average first exceeds sixteen times its average on $Q$. A zero root average gives zero contribution. The stopped cells have total length at most $\| Q \| \/ 8$, so the disjoint remainders $E_Q$ have measure at least $7 \| Q \| \/ 8$. Complete each piece by children immediately below its included cells. A child’s squared average is at most twice its parent’s, which gives the leaf bounds in (6.21); the frozen complementary sizes are bounded on the whole hull and its boundary leaves. If $a_Q \, b_Q$ are the side sizes at the piece roots, the whole-hull convention puts $Q$ in both suprema at every $x in E_Q$, even below a cut. Hence

$ sum_(nu \, Q) \| Q \| a_Q b_Q & lt.eq C integral_R sum_nu sqrt(m_(a \, nu) m_(upright("untouched") \, nu))\
 & lt.eq C integral_R (sum_nu m_(a \, nu))^(1 \/ 2) (sum_nu m_(upright("untouched") \, nu))^(1 \/ 2) lt.eq P^(1 \/ 2) G_0 \| R \| . $

This is the promised root-size cost from the stack energies and the whole-hull cuts. Combining it with (6.21) and the matched coefficient $O \( P^(- 1) \)$ gives the near-band form of Equation (H.19) of #cite(label("H")) Section 7:

#[#set math.equation(numbering: n => "(6.22)")
 $ \( 1 + C_N \( q \) \) C_q P^(- 1 \/ 2) G_0 \( K + 2 \)^(C_19 \( q - 2 \)) \| R \| . $ <eq:h-near-band>]

It bounds the absolute sum of original cell contributions with the prescribed band sum retained inside each contribution at a fixed offset. The logarithmic block factors fit $G_0$; the displayed power of $K + 2$ comes from the fixed-input short-block comparison.

=== 6.6 The core calculation <the-core-calculation>

The remaining terms have at least three core positions. We specialize the conditional calculation in #emph[Counts for the tested core tuples] and #emph[Powered estimate for the core terms] of #cite(label("H")) Section 9. Its good-height predicates, shifted annular tests, pure-shift gap, and numerical separation and height reserves remain exactly those of the source construction. We check the inputs that can be affected by the changed endpoint operands.

Fix a retained path point $x_(*)$, a group, an upper height, role types, frequency bins $\( mu \, nu \, Lambda \)$, and amplitude bins $sigma_j$. Let $N_s^G$ be H’s exact count of tested core representative-label tuples at depth $s$ for these data. In a core role put $M_j^G = \| cal(A)_j^G \|$. In the optional side role put

$ M_l^G = sigma_l^(- 2) sum_(s : thin G med upright("used")) parallel S_(l \, G \, s) parallel_(2 \, I_s)^2 \, #h(2em) M' = max_j M_j^G . $

Omit groups with no nonzero count, so $M' gt.eq 1$. H’s cell calculation gives, apart from total absolute error $O \( e^(- k) \| R \| \)$, terms of the form

$ C_L mu nu^(- L) Lambda^(- L) (product_(j = 0)^3 sigma_j) N_s^G . $

Here $0 < mu lt.eq 1 lt.eq nu$ and $Lambda gt.eq 1$ are dyadic, with $Lambda = 1$ for four core positions. The good-height masks select the full core subtotals within the minimal CURRENT components, with the coefficient floor already included in $sigma_(cal(F))$.

The preceding arguments provide the three inputs to the source count that depend on endpoint data. First, a representative label has the fixed value $omega_a \( x_(*) \)$. Distinct labels in one role obey (6.16). Together with H’s exact tested-tuple constraints, this ensures that two labels in distinct core roles determine at most one tested tuple, and the source height-bin estimate bounds its scale multiplicity. Second, the frozen-row, component-size, and top argument gives (6.17), including the $D_(*)$ cap in each core role. Third, a side role uses the actual same-cell function $S_(l \, G \, s)$ in its Fourier windows. Parseval gives its incidence bound

$ w_s = sigma_l^(- 2) parallel S_(l \, G \, s) parallel_(2 \, I_s)^2 \, $

whose sum is $M_l^G$ and whose path budget is supplied by (6.15).

The remaining hypotheses of the #emph[Sparse mass of separated progression tests] Lemma of #cite(label("H")) Section 9 are exactly H’s shifted frequency tests and pure-shift gap, retained from its construction. As in its proof of #emph[Counts for the tested core tuples], every successful component contains a nonexceptional primary, whose pure-horizontal alternatives exclude the required intermediate range for every permitted shift. This is a property of the persistent mode graph and its parameters. The finite Lemma therefore applies to the persistent labels and the actual side incidences and gives, for an absolute $p_0 in \( 0 \, 1 \)$,

#[#set math.equation(numbering: n => "(6.23)")
 $ sum_s N_s^G lt.eq L_0 min_(i eq.not j) M_i^G M_j^G \, #h(2em) L_0 lt.eq P^C \( 1 + log \( nu \/ mu \) \)^C \,\
sum_s \( N_s^G \)^(p_0) lt.eq P^C \( 1 + nu + mu^(- 1) + Lambda \)^C \( M' \)^(2 p_0) . $ <eq:h-core-counts>]

This source calculation identifies representative labels across depths and uses same-cell side data; coefficients frozen in different blocks may be unrelated.

Finally (6.17) and (6.15) give $sum_G M_j^G lt.eq P^C sigma_j^(- 2)$ in every role, with the additional $D_(*)$ cap in a core role. H interpolates the two inequalities in (6.23), keeps $N_s^G$ inside its power, and sums the amplitude and frequency bins. Its #emph[Powered estimate for the core terms], Equation (H.37) of #cite(label("H")) Section 9, gives absolute constants $epsilon > 0$ and $C_4$, with $p = 1 - epsilon > 2 \/ 3$, and total contribution

#[#set math.equation(numbering: n => "(6.24)")
 $ C_q eta^epsilon P^(C_4) \| R \| + O \( e^(- k) \| R \| \) $ <eq:h-core-estimate>]

for the terms with at least three core positions on this attempt’s retained cells. The original cell minimum is applied before subadditivity and the group count remains inside the power. Numerical errors are estimated absolutely. The conditional source calculation thus uses the supplied persistent labels, full core-subtotal masks, role counts, and actual side Fourier data, with no further cross-depth estimate on an original input.

== 7 Completion of the local estimate <sec:completion>

=== 7.1 Restarts on the original summands <restarts-on-the-original-summands>

We complete the target for a base segment $R_0$ by the construction in #cite(label("H")) Section 10, One attempt and its restarts. On an attempt $R$, the main realization and actual uses precede the prospective-offset calculation; the chosen whole sides then precede helper closure and its dependent size and counting cuts. The parent functions and operators remain fixed when original summands are transferred at a cut.

The cuts accumulate nonnegative partial path counts, component square sizes, or partial ancestor suprema. Their integrated bounds permit the thresholds to be increased by fixed factors. Together with the initial marking-failure cuts, the union of first stopped cells can then be chosen to have total length at most $\| R \| \/ 4$. For the strong stack thresholds, only auxiliary choices contribute a cardinality overhead, absorbed in $G_0$; all full indices $nu = \( G \, b \, chi \)$ are controlled jointly by the aggregate energy and full-hull bounds. The polynomially many configurations in $P \, k$ occur in the power budgets. The hull construction includes every potentially needed ancestor within a block before the common cuts, and its maximal functions remain defined on whole retained hull cells, including portions below a cut. Large-frozen-complement flags are charged to the powered error sum; only a first crossing of their accumulated budget creates a restart root.

At a stopped cell $R'$, send the original base summands there and at its descendants to a fresh attempt. Their original depths, input schedules, and basic expressions remain assigned to them. The restrictions $F_(j \, s) \|_(R')$ satisfy the same block normalization in each slot. On $R'$, the input size bound (5.1) gives the ordinary $L^2$ budget $\| R' \|^(1 \/ 2)$, and (5.1) has right side $5 a \| R' \|$. Rebase the inherited basic columns with their private constants unchanged and use genuine local refits and inherited continuations on the new root. The old continuations needed by the parent’s summands remain fixed.

All root bounds are obtained anew on $R'$. Equation (5.20) gives the basic rolling energy with factor $\| R' \|$. The proofs of (6.6) and (6.10) apply to the new main and mode constructions, and their newly constructed linear sides satisfy (6.12) on $R'$. In particular, this linear energy is proved by the new-root construction, with no inference of proportional child energy from a parent’s arbitrary family. The local sizes, column budgets, and inherited label properties used in those proofs hold on $R'$ as well. The displayed cross-depth bounds and local sizes thus have the same constants on every new root, independently of the remaining number of depths.

The packing-of-attempts Lemma of #cite(label("H")) Section 3 now gives

$ sum_(R med upright(a t t e m p t med r o o t)\
upright(f o r med t h e med s e g m e n t) med R_0) \| R \| lt.eq \| R_0 \| sum_(n gt.eq 0) 4^(- n) = 4 / 3 \| R_0 \| . $

The recursion is finite on the original finite depth tree; equivalently, induction on the remaining depths gives this geometric bound.

=== 7.2 The estimate at one accuracy <the-estimate-at-one-accuracy>

At each $I in cal(A)_R^(upright("ret"))$, apply the minimum to the absolute value of its whole contribution. Use (6.5) and subadditivity to separate the fixed search leaves while keeping the group sum inside the cell. In each leaf expand (6.13). Terms with at least three cores use (6.24); terms with at least three sides use the $p$th-power estimate of the side calculation, where $p = 1 - epsilon > 2 \/ 3$ is supplied by the core calculation. Exactly two sides use the transferred main term and its freeze, large-complement, and restoration estimates. These cases exhaust the four-position expansion.

For each powered within-cell contribution use

$ min \( eta \, x \) lt.eq eta^(1 - p) x^p #h(2em) \( x gt.eq 0 \) . $

The near terms use (6.22) at power one, with their coupled band sums kept inside the cell. Physical and numerical errors are also estimated at power one. Increase $C_4$ to include the powered costs and the smaller main cost $eta P^C \| R \|$. The overhead from source leaves and auxiliary choices fits $G_0$ for the strong terms; the polynomially many power-budget choices fit the enlarged $C_4$. The strong energy and hull bounds already sum all groups and blocks. Thus on the retained cells of one attempt,

#[#set math.equation(numbering: n => "(7.1)")
 $ sum_(I in cal(A)_R^(upright("ret"))) \| I \| min \( eta \, \| H_I \( z_I \) \| \) & lt.eq C_q eta^epsilon P^(C_4) \| R \|\
 & quad + \( 1 + C_N \( q \) \) C_q P^(- 1 \/ 2) G_0 \( K + 2 \)^(C_19 \( q - 2 \)) \| R \|\
 & quad + O \( e^(- k) \| R \| \) . $ <eq:h-retained-estimate>]

This is the conditional retained-cell calculation of #cite(label("H")) Section 10, with its basic square, variation, and frozen-row hypotheses supplied above. Summing it over the attempt roots by the preceding packing bounds the full segment target on $cal(A)_(R_0)$ by the same right-hand expression with $\| R_0 \|$, up to a fixed factor.

=== 7.3 Choice of $q$, $alpha$, and starting accuracy <choice-of-q-alpha-and-starting-accuracy>

The degrees in (7.1) and (6.9) can be fixed independently of $q$. The main-row and stack calculation following (6.19) records the norm and squared losses: row logarithms, Compression of $O \( log k \)$ main factors, and the strong stack factors fit $G_0$; the larger $D_(*)$ is confined to the mode construction, Bessel, and counting estimates. The base row, smooth, and delay estimates add fixed polynomial degrees in $k$. Powers of $K$ enter the allowed component and top budgets and the displayed short-block factor. These facts preserve absolute upper bounds on $C_4 \, C_5 \, C_19$.

We need the fixed-input constant at the same $q$. The #emph[Uniform local estimate] of #cite(label("H")) Section 2 is stated for some $q in \( 2 \, 3 \)$, and its proof permits the choice required here. The #emph[Local detection] Lemma of #cite(label("H")) Section 4 holds for every $q > 2$, with an absolute logarithmic degree and $q$-dependence only in its coefficient. The #emph[Short-block comparison] Lemma of #cite(label("H")) Section 7 holds for every $2 < q < 3$, with the explicit power $11 \( q - 2 \) \/ \( q - 1 \)$ used above. The other degree bounds in H’s hierarchy are fixed before $q$. Its #emph[Order of the parameters] in #cite(label("H")) Section 10 requires

$ C_19^(upright(H)) C_5^(upright(H)) \( q - 2 \) < 1 / 8 \, $

where the superscript denotes the source degree bounds. The source stagger and quality exponents precede $q$, while its power parameter and starting accuracy follow $q$.

Choose the one $q in \( 2 \, 3 \)$ for this proof so close to two that

#[#set math.equation(numbering: n => "(7.2)")
 $ max { C_19^(upright(H)) C_5^(upright(H)) \, thin C_19 C_5 } \( q - 2 \) < 1 / 8 . $ <eq:h-common-q>]

Run the fixed-input parameter and absorption proof of #cite(label("H")) Sections 2 and 10 at this chosen value, with its own subsequent choices of power parameter and starting accuracy. Its normalized absorption Proposition and outer reduction give

#[#set math.equation(numbering: n => "(7.3)")
 $ C_(upright(H)) \( q \) := sup_(N gt.eq 1) C_N \( q \) < oo $ <eq:h-uniform-fixed>]

for the fixed compactly supported $L^q$ functions in (6.20). This is the consequence of H’s proof-level parameter order at the one selected $q$.

Now choose our $alpha > 0$ with $alpha C_4 < epsilon \/ 2$; $C_4$ already dominates the powered side costs. For this fixed $alpha$, $P = ceil.l e^(alpha k^theta) ceil.r$ dominates every fixed power of $k$ and $G_0 = P^(o \( 1 \))$. By (7.2), after increasing the starting $k$,

$ P^(- 1 \/ 2) G_0 \( K + 2 \)^(C_19 \( q - 2 \)) lt.eq C_q P^(- 1 \/ 4) \,\
eta^epsilon P^(C_4) lt.eq C_q eta^(epsilon \/ 2) \, #h(2em) P^(- 1 \/ 4) lt.eq eta^(alpha \/ 4) . $

Indeed the $K$ power costs less than $P^(1 \/ 8)$, and $G_0 lt.eq P^(1 \/ 8)$ for large $k$. Since $0 < theta < 1$, the numerical error $e^(- k)$ is smaller than the resulting quality power. Substitute (7.3) into (7.1) and sum the attempt roots. For a fixed $c_(*) > 0$, this gives the full segment bound

#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(I in cal(A)_(R_0)) \| I \| min \( eta \, \| H_I \( z_I \) \| \) lt.eq C_q eta^(c_(*)) \| R_0 \| . $ <eq:h-quality-gain>]

The fixed constant $C_(upright(H)) \( q \)$ is included in $C_q$.

=== 7.4 Summing the accuracy expansion <summing-the-accuracy-expansion>

Use the final accuracy summation of #cite(label("H")) Section 10, Summing the base expansion. For a tuple with later level $t$, the earlier level has $O \( t \)$ choices and there are only a bounded number of slot patterns. The intersections of the tuple’s bounded number of basic segment families have total root length at most a fixed multiple of $\| J \|$; the localization attempt packing preserves that bound. The noninitial costs in (7.4) therefore sum because

$ sum_(t gt.eq 12) t thin e^(- c_(*) k_t^theta) < oo \, #h(2em) k_(t + 1) = k_t^A \, quad A > 1 . $

The separate global replacement errors in (5.27) and the two-$U$ errors have the same summable multiplicity. The finitely many initial levels have the depth-independent bound from the base active-scale reduction.

Finally take the two-earliest-increments expansion at a finite accuracy cutoff. At each fixed cell all its accuracy updates were evaluated on the same actual $F_(j \, s \( I \))$; the per-cell pair comparisons in the base proof therefore make the terminal residual tend to zero. There are finitely many original cells, so this limit commutes with their finite sum. The triangle inequality, the uniform summable bounds, and passage to that cutoff limit give $C \| J \|$ for the original sum.

The cross-depth estimates (5.1), (5.3), (5.20), and (5.11), together with the single-depth size bound (5.1), have constants independent of the four input block partitions and their numbers $W_j$. The resulting constant is therefore uniform in the input schedules, as required by Theorem 11.


#bibliography("refs.bib", style: "ieee", title: [References])
