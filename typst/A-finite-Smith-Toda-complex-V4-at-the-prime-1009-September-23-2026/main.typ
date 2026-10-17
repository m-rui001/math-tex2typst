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

#align(center)[#text(size: 16pt, weight: "bold")[A finite Smith--Toda complex $V \( 4 \)$ at the prime $1009$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <intro:section>

The Smith–Toda realization problem asks how far one can kill the chromatic parameters in Brown–Peterson homology, one at a time, while retaining a finite spectrum. At a prime $p$, write

$ B P_(*) = bb(Z)_(\( p \)) \[ v_1 \, v_2 \, dots.h \] \, #h(2em) \| v_i \| = 2 \( p^i - 1 \) \, $

with Hazewinkel generators. A #emph[finite $p$-local spectrum] is a retract of the $p$-localization of a finite CW spectrum. A #emph[Smith–Toda complex $V \( n \)$] is such a spectrum with Brown–Peterson homology $B P_(*) \/ \( p \, v_1 \, dots.h \, v_n \)$, including the canonical $B P_(*) B P$-comodule structure and a generator in degree zero. In this quotient each listed generator is killed to its first power. The comodule records the Brown–Peterson cooperations, so its specification is part of the realization problem, in addition to the underlying graded module. The periodicity theorem gives generalized Moore spectra whose homology kills suitable powers of the initial generators #cite(label("HopkinsSmith1998")) Proposition 5.14. Requiring every exponent to be one is a more restrictive realization problem.

The mod-$p$ Moore spectrum gives $V \( 0 \)$ at every prime. The classical constructions of $V \( 1 \)$, $V \( 2 \)$, and $V \( 3 \)$ for $p > 2$, $p > 4$, and $p > 6$ are due to Adams, Smith, and Toda #cite(label("Adams1966")) #cite(label("Smith1970")) #cite(label("Toda1971")); see also the historical account in #cite(label("Nave2010"), form: "prose") p. 493. Successive cofibers turn a suitable first-power $v_i$ self-map into the next quotient. The difficulty is producing the self-map on the finite spectrum: an algebraically primitive coefficient need not survive the Adams–Novikov spectral sequence (ANSS) to an actual map. These constructions thus connect the algebra of complex cobordism with specific attaching maps in the stable homotopy category.

The next case remained outside those constructions. The September 2023 version of #cite(label("CulverZhang2024"), form: "prose") Remark 3.29 records the existence of $V \( 4 \)$ as open at every prime. There are also height-dependent nonexistence results: #cite(label("Nave2010"), form: "prose") Theorem 1.3 proves that $V \( \( p + 1 \) \/ 2 \)$ does not exist for $p gt.eq 7$, and that $V \( \( p - 1 \) \/ 2 \)$, if it exists, cannot be a ring spectrum. Those obstructions leave room for $V \( 4 \)$ at a sufficiently large prime. We establish the following specified-prime realization.

#thm([Theorem 1.1.])[
  #emph[At $p = 1009$ there is a finite $p$-local spectrum $X$ and an isomorphism 
$ B P_(*) X med tilde.equiv med B P_(*) \/ \( p \, v_1 \, v_2 \, v_3 \, v_4 \) $

 of graded $B P_(*) B P$-comodules, with the canonical quotient comodule on the right and its generator in degree zero.]
] <intro:main>

Theorem 1 gives a positive answer to the Smith–Toda $V \( 4 \)$ existence problem at the stated prime. Its conclusion concerns the ordinary $p$-local stable category; finiteness is established before any chromatic localization. For comparison, #cite(label("KatoShimomuraShimomura2025"), form: "prose") Theorem 1.7 construct at this prime an $L_5$-local spectrum $W_5$ with

$ B P_(*) W_5 = v_5^(- 1) B P_(*) \/ \( p \, v_1 \, v_2 \, v_3 \, v_4 \) \, $

where $L_5$ denotes localization with respect to $v_5^(- 1) B P$. That realization has $v_5$ inverted and does not supply the ordinary finite realization of the unlocalized quotient required here. The choice $1009$ makes the finite inequalities in our calculation generous. We do not require a product on the final spectrum $X$.

=== 1.1 Methods and proof strategy <methods-and-proof-strategy>

The algebraic setting comes from the spectrum of Brown and Peterson #cite(label("BrownPeterson1966")), Quillen’s formal-group description of cobordism and its $p$-typical summand #cite(label("Quillen1969")), and Hazewinkel’s explicit $p$-typical generators #cite(label("HazewinkelIII")). Our main tool is the sphere-source Adams–Novikov spectral sequence, whose cobordism-theoretic construction goes back to Novikov #cite(label("Novikov1967")). We use its ordinary $B P$ resolution, its cobar $E_2$ term, and its compatibility with actual binary maps; see #cite(label("Ravenel2004"), form: "prose") Sections 2.2–2.3. The algebraic estimates use filtered Hopf-algebra cohomology as developed by #cite(label("May1966"), form: "prose") Section 4, Theorem 4, with the odd-primary filtration of #cite(label("Ravenel2004"), form: "prose") Theorem 3.2.5 and an additional filtration adjustment constructed below.

A closer predecessor is the work of #cite(label("LeeRavenel1994"), form: "prose") author preprint, pp. 2–6 on the nilpotence order of the first beta-family sphere class $beta_1$. They use a modified May calculation on $V \( 3 \)$ and constrain Adams–Novikov differentials through multiplication by $beta_1$ and the $V \( 2 \)$-module structure of $V \( 3 \)$. Our final obstruction calculation requires an annihilation relation for products of a beta power with specific filtration-five classes, together with a bound on the page at which those products vanish. Toda’s work on sphere relations #cite(label("Toda1967")) p. 839, Corollary and his subsequent cyclic extended-power constructions #cite(label("Toda1968")) Sections 1–3, especially Theorem 3 provide the topological antecedents. We give the particular coefficient-cohomology calculations and finite-cell arguments needed for this bound below.

The construction has three stages. First we construct $Y = V \( 3 \)$ with a binary product and a two-sided unit. These unit identities are enough to turn a sphere map realizing $v_4$ into a self-map of $Y$. We obtain the lower complexes and their products by finite cofiber constructions and explicit vanishing of their attaching obstructions; we do not need an associative product on $Y$.

Second, we prove that the filtration-zero class $v_4$ survives in the Adams–Novikov spectral sequence for $Y$. To describe the obstruction calculation, put $q = 2 p - 2$ and $u_i = 1 + p + dots.h.c + p^(i - 1)$ for $i gt.eq 1$. Divide the internal degree by $q$ and call the resulting integer the #emph[weight]. A cobar class of cohomological degree $s$ and weight $w$ lies in stem $q w - s$. Every possible positive differential on $v_4$ therefore has target

#[#set math.equation(numbering: n => "(1.1)")
 $ \( s \, w \) = \( q k + 1 \, u_4 + k \) \, #h(2em) k gt.eq 1 . $ <intro:targets>]

A finite May calculation leaves only $k = 1 \, 2 \, p - 1 \, p$. For $k = 1$, a relation supplied by the coboundary of $v_5$, together with an injective multiplication on the target, forces the differential to vanish. For $k = 2 \, p - 1$, we compute actual cohomology by taking the Frobenius kernel of the group of truncated additive coordinate changes. The quotient acts triangularly on kernel cohomology. Filtering this coefficient module by weight identifies the first possible differential and checks that both its source and its target are present. This step controls the polynomial generators as well as the exterior generators on the May page.

The remaining case $k = p$ requires a topological argument. We write $beta in pi_(p q - 2) S_(\( p \))^0$ for the first beta-family sphere class. The entire $E_2$ target consists of products of a large power of its detector with certain filtration-five classes of $Y$. We realize those low-filtration classes by maps $gamma$ and construct an explicit relation

$ beta^(thin p \( p - 2 \) + 1) gamma = 0 . $

The construction uses a cyclic extended power of a sphere and the averaging retract of a smash power of a two-cell spectrum. The corresponding Adams–Novikov product has filtration strictly smaller than the length of the prospective differential on $v_4$. Consequently the whole target has vanished before that differential could occur. The bound on the page is the point: eventual vanishing in homotopy, without such a bound, would not settle this obstruction.

Finally the filtration-zero edge gives a map $S^(2 \( p^4 - 1 \)) arrow.r Y$ with Brown–Peterson Hurewicz image $v_4$. Multiplication by the binary product on $Y$ extends it to $Sigma^(2 \( p^4 - 1 \)) Y arrow.r Y$. Its cofiber is finite, and the nonzerodivisor property of $v_4$ identifies its homology with the required quotient. The bottom sphere map identifies the quotient coaction and fixes the generator in degree zero.

Section 2 fixes the Brown–Peterson coordinates and the topological spectral-sequence conventions. Section 3 constructs the filtered cobar calculation, and Section 4 supplies the unital lower complexes. Section 5 lists the height-four targets and removes the first differential; Section 6 proves the two Frobenius vanishings. Section 7 establishes the homotopy relation, its page bound, and the realizing cofiber. Appendix 8 provides the ordinary convergent resolution and the filtered binary pairing that connects the algebraic calculation to the actual homotopy product.

== 2 Brown–Peterson coordinates and the Adams–Novikov resolution <fw:section>

Throughout the proof,

#[#set math.equation(numbering: n => "(2.1)")
 $ p = 1009 \, #h(2em) q = 2 p - 2 = 2016 \, #h(2em) u_i = frac(p^i - 1, p - 1) quad \( i gt.eq 0 \) . $ <fw:parameters>]

The integer $1009$ is prime: its square root is less than $32$, and none of $2 \, 3 \, 5 \, 7 \, 11 \, 13 \, 17 \, 19 \, 23 \, 29 \, 31$ divides it. Put

$ R = B P_(*) = bb(Z)_(\( p \)) \[ v_1 \, v_2 \, dots.h \] \, #h(2em) Gamma = B P_(*) B P = R \[ t_1 \, t_2 \, dots.h \] \, #h(2em) I_m = \( p \, v_1 \, dots.h \, v_(m - 1) \) . $

Both $v_i$ and $t_i$ have internal degree $q u_i$. We call internal degree divided by $q$ the #emph[weight]. A cobar class of cohomological degree $s$ and weight $w$ has stem $q w - s$.

We use the ordinary Brown–Peterson spectrum, its polynomial cooperation algebra, and a strictly unital associative model of its multiplication. For the identification of these polynomial rings with the homotopy and cooperations of $B P$, see #cite(label("Ravenel2004"), form: "prose") Theorems 4.1.18–4.1.19. The Hazewinkel recursion and the integrality of its polynomial generators are given in #cite(label("Ravenel2004"), form: "prose") Equation A2.2.1 and Theorem A2.2.3; the formal-sum coordinate convention is explained in the proof of Theorem A2.1.27 there. The formal-group foundations are due to #cite(label("Quillen1969"), form: "prose") Section 5, Theorem 4; the explicit generators and cooperations are developed in #cite(label("HazewinkelIII"), form: "prose") Sections 3.1 and 4.4. A coherent associative model exists, in particular, by forgetting structure from #cite(label("BasterraMandell2013"), form: "prose") Theorem 1.1. No commutative or $E_oo$ model of $B P$ is required below. We give the particular coordinate, convergence, and pairing arguments needed for the construction.

=== 2.1 Coordinates and additive ranges <coordinates-and-additive-ranges>

Let $a_i$ be the coefficients in the formal-group sum expression

$ \[ p \]_F \( x \) = sum_F a_i x^(p^i) \, #h(2em) a_0 = p . $

The strict coordinate change is written in the same convention as $sum_F t_i x^(p^i)$, with $t_0 = 1$. Reversing the convention for composition reverses the cobar conventions without changing any of the arguments.

#thm([Lemma 2.1.])[
  (Leading coefficients and low cooperations).  #emph[For each $m gt.eq 1$, $I_m$ is an invariant ideal and $v_m$ is primitive modulo $I_m$. Modulo $I_m$, the coproducts of $t_i$, $i lt.eq m$, are the additive-composition coproducts. At the specialization that kills $p$ and all $v_i$, the resulting Hopf algebra is 
#[#set math.equation(numbering: n => "(2.2)")
 $ P = bb(F)_p \[ t_1 \, t_2 \, dots.h \] \, #h(2em) Delta \( t_i \) = sum_(ell = 0)^i t_ell ⊗ t_(i - ell)^(p^ell) . $ <fw:additive-hopf>]

]
] <fw:coordinates>

#proof[
  Write the logarithm as $log_F \( x \) = sum_(i gt.eq 0) l_i x^(p^i)$, where $l_0 = 1$. The Hazewinkel recursion is
  $ p l_n = v_n + sum_(i = 1)^(n - 1) l_i v_(n - i)^(p^i) . $
  Applying the logarithm to the formal sum for $\[ p \]_F$ and comparing the coefficient of $x^(p^n)$ shows that the coefficient of the indecomposable $v_n$ in $a_n$ is
  #[#set math.equation(numbering: n => "(2.3)")
   $ c_n = 1 - p^(p^n - 1) . $ <fw:coordinate-unit>]
  Indeed the two terms involving $l_n$ are $p l_n$ and $p^(p^n) l_n$, and the coefficient of $v_n$ in $l_n$ is $1 \/ p$. All other terms involve lower $v_i$. The coefficients $a_n$ are integral, so the grading and polynomial independence of the $v_i$ give $a_n - c_n v_n in \( v_1 \, dots.h \, v_(n - 1) \) R$. Each $c_n$ is a $p$-local unit.
  The invariance and primitivity follow inductively. The element $p$ is invariant. Once the lower coefficients vanish, the first surviving term of the $p$-series is $c_m v_m x^(p^m)$. A strict coordinate change has leading term $x$, so comparison of this first surviving term on the two sides of the coordinate-change identity fixes $c_m v_m$, and hence $v_m$. This proves both invariance of the next ideal and the asserted primitivity.
  After all base generators have been killed, the formal group is additive, and composition of additive $p$-polynomials gives Equation (2.2). Modulo $I_m$, a correction to this coproduct must have a positive base coefficient, of weight at least $u_m$. For $i < m$ its weight is already too large. For $i = m$ the only possibility is a constant multiple of $v_m$ with no positive-weight cooperation factor. Applying either counit excludes that term. This proves the stated range. ◻
]

#thm([Lemma 2.2.])[
  (The relation supplied by $v_5$).  #emph[In the cobar cohomology with coefficients $R \/ I_4$, there is a scalar $e in bb(F)_p$ such that 
#[#set math.equation(numbering: n => "(2.4)")
 $ v_4 #scale(x: 120%, y: 120%)[\(] h_(1 \, 4) + e v_4^(p - 1) h_(1 \, 0) #scale(x: 120%, y: 120%)[\)] = 0 \, $ <fw:v5-cohomology-relation>]

 where $h_(1 \, j)$ is represented by the primitive $t_1^(p^j)$.]
] <fw:v5-relation>

#proof[
  Modulo $I_4$, the first two formal-sum coefficients are unit multiples of $v_4 \, v_5$. There is no decomposable correction involving $v_4$ to the second of these coefficients: $u_5 = p u_4 + 1$ is not a multiple of $u_4$. The formal group law has no nonlinear term of total ordinary degree less than $p^4$, because a coefficient of such a term would have positive weight less than $u_4$. Thus, through exponent $p^5$, its $p$-series is the ordinary sum of its $x^(p^4)$ and $x^(p^5)$ terms. The nonlinear terms in adding these two inputs have exponent greater than $p^5$.
  In the identity intertwining this $p$-series with a strict coordinate change, only $x + t_1 x^p$ from that change can affect these two exponents. On the side where the change is applied after the $p$-series, the coefficient of $x^(p^5)$ acquires a term proportional to $v_4^p t_1$. On the other side it acquires a term proportional to $v_4 t_1^(p^4)$. All nonlinear corrections to the strict formal-sum change enter too late after taking the $p^4$-th power. Consequently
  $ eta_R \( v_5 \) - v_5 = c thin v_4 t_1^(p^4) + d thin v_4^p t_1 quad upright("in ") Gamma \/ I_4 Gamma \, $
  where $c \, d in bb(F)_p$ and $c eq.not 0$. The nonzero coefficient follows also directly from the unit factors $c_4 \, c_5$ in Equation (2.3); their reductions cannot annihilate the first displayed contribution. Divide this coboundary by $c$ and put $e = d \/ c$. Since $t_1$ is primitive modulo $I_4$, all its $p$-power iterates are primitive, and the resulting cohomology relation is Equation (2.4). ◻
]

For a comodule concentrated in weights that are nonnegative integers, let $C^(s \, w)$ denote normalized cobar cochains of length $s$ and weight $w$. We use the convention in which a positive-length cochain has a coefficient followed by $s$ reduced cooperation factors. This convention fixes the signs of the usual cobar differential and cup product.

#thm([Lemma 2.3.])[
  (Normalized positivity).  #emph[If the coefficient comodule has no negative weights, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ C^(s \, w) eq.not 0 quad arrow.r.double quad w gt.eq s . $ <fw:positivity>]

]
] <fw:normalized-bound>

#proof[
  Every reduced cooperation factor is a polynomial monomial containing at least one $t_i$, and hence has weight at least one. The coefficient has nonnegative weight. Adding these weights proves the claim. ◻
]

#thm([Lemma 2.4.])[
  (A comparison in three cochain degrees).  #emph[Suppose $s gt.eq 1$, $w < u_(m + 1)$, and $w - u_m < s - 1$. Additive specialization identifies the normalized cobar complexes for $R \/ I_m$ and $P$, in weight $w$, in all three degrees $s - 1 \, s \, s + 1$. It intertwines both adjacent differentials, and therefore induces an isomorphism on cohomology in degree $\( s \, w \)$. The same conclusion in every cochain degree holds if $w < u_m$.]
] <fw:range-comparison>

#proof[
  In each of the three degrees, any positive coefficient monomial consumes at least $u_m$ weight. It would leave at most $w - u_m < s - 1$ for at least $s - 1$ reduced bar factors, which is impossible. A coordinate $t_i$ with $i gt.eq m + 1$ exceeds the entire weight budget. Thus these cochain groups have scalar coefficients and only $t_1 \, dots.h \, t_m$ in their bars. Their coproducts are additive by Lemma 2. This identifies the two groups adjacent to the desired cohomology group as well as the group itself, so both kernels and images agree. If $w < u_m$, the same exclusion of coefficients and coordinates works without a cochain-length restriction. ◻
]

=== 2.2 Convergence, pairings, and the edge <convergence-pairings-and-the-edge>

The following two propositions specify the topological spectral sequence and the binary pairings used throughout the construction. The ordinary Adams–Novikov resolution and its convergence are treated in #cite(label("Ravenel2004"), form: "prose") Theorems 2.2.3, 2.2.13–2.2.14; #cite(label("Ravenel2004"), form: "prose") Theorem 2.3.3 gives the binary-pairing, Leibniz, and homotopy-compatibility statements in this form. Their complete proofs in the particular resolution used here, including the ordinary totalization model and its filtration, are given in Appendix 8.

#thm([Proposition 2.5.])[
  (The bounded-below Adams–Novikov resolution).  #emph[For every bounded-below $p$-local spectrum $Z$, the sphere-source Adams–Novikov spectral sequence has 
$ E_2^(s \, t) \( Z \) = H^(s \, t) #scale(x: 120%, y: 120%)[\(] C_Gamma^bullet \( B P_(*) Z \) #scale(x: 120%, y: 120%)[\)] quad arrow.r.double quad pi_(t - s) Z . $

 It converges strongly, and the induced filtration in each stem is finite. The differential $d_r$ changes $\( s \, t \)$ by $\( r \, r - 1 \)$. The filtration-zero edge identifies $E_oo^(0 \, *)$ with the image of the $B P$-Hurewicz map $pi_(*) Z arrow.r B P_(*) Z$.]
] <fw:anss>

The proof is given in Appendix 8.1.

#thm([Proposition 2.6.])[
  (Binary pairings of the resolution).  #emph[For bounded-below $p$-local spectra $Z_1 \, Z_2 \, Z_3$, an actual map $f : Z_1 and Z_2 arrow.r Z_3$ induces pairings of the Adams–Novikov spectral sequences, with the Leibniz rule on every page. The $E_2$ pairing is the cobar cup pairing induced by the exterior $B P$-homology pairing, and the $E_oo$ pairing is the associated-graded pairing of the actual homotopy map $f$. No associativity of $f$ is needed. If $Z_1 = Z_2 = Z_3 = Z$ has a binary two-sided unital multiplication and $B P_(*) Z = R \/ I$ is cyclic on its unit, the $E_2$ pairing is the ordinary multiplication on cobar cohomology with quotient-ring coefficients.]
] <fw:anss-pairing>

The proof is given in Appendix 8.2.

#thm([Corollary 2.7.])[
  (Sparsity).  #emph[If $B P_(*) Z$ is concentrated in internal degrees divisible by $q$, then all pages of its Adams–Novikov spectral sequence have that same internal sparsity. Every possibly nonzero positive differential has length $r = q k + 1$ for an integer $k gt.eq 1$. In weight notation it changes $\( s \, w \)$ to $\( s + q k + 1 \, w + k \)$. In particular, a primitive coefficient of weight $u_n$ in filtration zero can have only targets 
#[#set math.equation(numbering: n => "(2.6)")
 $ \( s \, w \) = \( q k + 1 \, u_n + k \) \, #h(2em) k gt.eq 1 . $ <fw:primitive-targets>]

]
] <fw:sparsity>

#proof[
  The coefficient and cooperation gradings give the assertion on the cobar page. A differential preserves the sparse support only if $q$ divides $r - 1$. Subsequent pages are subquotients of earlier pages. Since $r gt.eq 2$ on or after the cohomology page, the first allowed length is $q + 1$. ◻
]

#thm([Lemma 2.8.])[
  (The additive comparison for the $v_4$ targets).  #emph[Let $s = q k + 1$, $w = u_4 + k$, $k gt.eq 1$. A nonzero normalized cobar group in degree $\( s \, w \)$ with coefficients $R \/ I_4$ requires 
#[#set math.equation(numbering: n => "(2.7)")
 $ \( q - 1 \) k lt.eq u_4 - 1 \, #h(2em) w lt.eq frac(q u_4 - 1, q - 1) < 2 u_4 < p^4 < u_5 . $ <fw:preliminary-v4-bound>]

 For every such $k$, additive specialization is an isomorphism on cohomology in degree $\( s \, w \)$, by an identification of the cochain groups of lengths $s - 1 \, s \, s + 1$. No $v_4$ coefficient or $t_4$ bar occurs in any of those three cochain groups.]
] <fw:additive-comparison>

#proof[
  The first two inequalities are the rearrangement of $w gt.eq s$. Here
  $ u_4 = 1 \, 028 \, 262 \, 820 \, #h(2em) 2 u_4 = 2 \, 056 \, 525 \, 640 < p^4 = 1 \, 036 \, 488 \, 922 \, 561 \, $
  so the remaining inequalities in Equation (2.7) hold at the fixed prime. For a cochain length $d in { s - 1 \, s \, s + 1 }$, a coefficient containing $v_4$ would leave at most $k$ weight for $d gt.eq q k > k$ reduced factors. It therefore cannot occur. A bar containing $t_4$ would leave at most $k$ weight for the other $d - 1 gt.eq q k - 1 > k$ bars, and likewise cannot occur. Higher generators exceed the weight bound. The remaining coproducts are additive by Lemma 2; equivalently, apply Lemma 5. This identifies both adjacent differentials and proves the cohomology assertion. ◻
]

== 3 Filtered cobar preliminaries <may:preliminaries>

We use the filtered Hopf-algebra method of #cite(label("May1966"), form: "prose"), with the odd-primary May-type filtration in the form of #cite(label("Ravenel2004"), form: "prose") Theorem 3.2.5, and allow an additional digit-zero weight needed for the injectivity argument in Section 5. For earlier applications of Ravenel’s filtration to $V \( 3 \)$ and powers of $beta_1$, see #cite(label("LeeRavenel1994"), form: "prose"). We construct this modified filtration below, including its initial page and convergence. Throughout this section, cohomological degree and weight are denoted by $\( s \, w \)$. Unless an Adams–Novikov differential is named explicitly, the spectral sequences in this section are algebraic spectral sequences of cobar complexes. Put

$ P = bb(F)_p \[ t_1 \, t_2 \, dots.h \] \, #h(2em) \| t_i \|_w = u_i \, #h(2em) overline(Delta) \( t_i \) = sum_(0 < l < i) t_l ⊗ t_(i - l)^(p^l) . $

Reversing all coproducts reverses the cobar conventions and changes none of the conclusions. We use the displayed convention.

#thm([Lemma 3.1.])[
  (The filtered cobar calculation).  #emph[For every integer $M gt.eq 0$, the cobar cohomology of $P$ admits a multiplicative, degreewise finite spectral sequence whose initial cohomology page is 
#[#set math.equation(numbering: n => "(3.1)")
 $ Lambda \( h_(i \, j) : i gt.eq 1 \, j gt.eq 0 \) ⊗ bb(F)_p \[ b_(i \, j) : i gt.eq 1 \, j gt.eq 0 \] . $ <may:initial-page>]

 The bidegrees and auxiliary filtrations are 
$ & \( s \, w \) & F_M\
h_(i \, j) & \( 1 \, p^j u_i \) & 2 i - 1 + M \[ j = 0 \]\
b_(i \, j) & \( 2 \, p^(j + 1) u_i \) & p \( 2 i - 1 + M \[ j = 0 \] \) . $

 Here $\[ j = 0 \]$ is $1$ or $0$ according as $j = 0$ or $j eq.not 0$. All differentials lower $F_M$. If an exterior generator is written $h_(\[ a \, b \)) = h_(b - a \, a)$, its first differential is 
#[#set math.equation(numbering: n => "(3.2)")
 $ d_1 h_(\[ a \, b \)) = sum_(a < l < b) h_(\[ a \, l \)) h_(\[ l \, b \)) \, #h(2em) d_1 b_(i \, j) = 0 . $ <may:splitting>]

 The same statements hold for the Hopf subalgebra $P_r = bb(F)_p \[ t_1 \, dots.h \, t_r \]$, with $i lt.eq r$ in (3.1).]
] <may:page>

#proof[
  Write every exponent in base $p$ and assign a digit factor $t_i^(p^j)$ the filtration $2 i - 1 + M \[ j = 0 \]$. For a monomial, add these filtrations with the digit multiplicities, without carrying. Carrying $p$ copies of one digit to the next digit lowers filtration: its decrease is
  $ p \( 2 i - 1 + M \[ j = 0 \] \) - \( 2 i - 1 + M \[ j + 1 = 0 \] \) gt.eq p - 1 > 1 . $
  A nonprimitive coproduct summand of $t_i^(p^j)$ replaces it by $t_l^(p^j) ⊗ t_(i - l)^(p^(j + l))$ and decreases filtration by exactly one. These observations show that this is a multiplicative coalgebra filtration, and that its associated graded Hopf algebra is the tensor product of primitive truncated polynomial Hopf algebras
  $ ⨂_(i \, j) bb(F)_p \[ z_(i \, j) \] \/ \( z_(i \, j)^p \) . $
  For one such factor the dual algebra is again a truncated polynomial algebra: factorial rescaling identifies its basis in exponents less than $p$ with the ordinary polynomial basis. The free resolution alternating multiplication by its generator and its $\( p - 1 \)$st power computes its cohomology as one exterior generator in degree one and one polynomial generator in degree two. Their weights are respectively the weight of $z_(i \, j)$ and $p$ times that weight. Tensoring these resolutions gives (3.1), including the stated auxiliary filtrations. The exterior square is zero since its cohomological degree is odd and $p$ is odd.
  The filtration-one part of the reduced coproduct gives the splitting formula for $h$. For the polynomial generator associated to a digit $z$, a filtration-one contribution would replace one of its $p$ copies by a split pair and leave $p - 1$ unsplit copies of $z$. In the associated-graded cohomology of the $z$ factor, a nonzero multiplicity has the form $p a + epsilon.alt$, with $a gt.eq 0$ and $epsilon.alt in { 0 \, 1 }$. The multiplicity $p - 1$ has neither form, so that component has zero cohomology. Carries cannot contribute to this first differential by the strict inequality above. This proves $d_1 b = 0$.
  In a fixed positive internal weight only finitely many digit factors occur, every monomial exponent is bounded, and a normalized bar has positive weight. Its length is consequently bounded as well. Thus all the filtrations under discussion are finite in each weight, and their spectral sequences converge to the indicated cobar cohomology. The construction restricts to $P_r$ because its coproduct uses only the first $r$ coordinates. ◻
]

For later calculations we fix the following notation, always distinguishing the bare exterior letter $b$ from the indexed polynomial letters:

#[#set math.equation(numbering: n => "(3.3)")
 $ x = h_(1 \, 0) \, quad a = h_(2 \, 0) \, quad c = h_(3 \, 0) \, #h(2em) y = h_(1 \, 1) \, quad b = h_(2 \, 1) \, quad z = h_(1 \, 2) \,\
A = b_(1 \, 0) \, #h(2em) B = b_(2 \, 0) \, #h(2em) C = b_(1 \, 1) . $ <may:low-alphabet>]

An exterior interval $h_(i \, j)$ covers positions $j \, dots.h \, j + i - 1$ in its weight, and a polynomial letter $b_(i \, j)$ covers positions $j + 1 \, dots.h \, j + i$. Let $m$ be the number of exterior letters, let $H_r$ count those covering position $r$, and let $L = \( s - m \) \/ 2$ be the number of polynomial letters, counted with multiplicity. If only positions $0 \, 1 \, 2$ occur, the alphabet is precisely (3.3). Writing $n_A \, n_B \, n_C$ for the polynomial multiplicities gives

#[#set math.equation(numbering: n => "(3.4)")
 $ w = H_0 + p \( H_1 + L - n_C \) + p^2 \( H_2 + n_B + n_C \) \, #h(2em) n_A = L - n_B - n_C . $ <may:three-position-weight>]

== 4 The unital complexes through height three <low:section>

We first construct the lower complexes, retaining a binary two-sided unit. The algebraic input is the May upper bound of Lemma 10: a bidegree containing no initial-page monomial has zero cobar cohomology. The two vanishing families below serve different parts of the induction: the first makes each $v_n$ survive to a self-map, and the second permits the two unit maps to extend to a binary product over every pair of cells.

#thm([Lemma 4.1.])[
  (Lower obstruction groups).  #emph[The following cobar cohomology groups vanish.]
  + #emph[For $1 lt.eq n lt.eq 3$ and $k gt.eq 1$, the group with coefficients $R \/ I_n$ in bidegree 
$ \( s \, w \) = \( q k + 1 \, u_n + k \) . $

]
  + #emph[For $0 lt.eq n lt.eq 3$, choose $e_i in { 0 \, 1 \, 2 }$ for $0 lt.eq i lt.eq n$ and put 
$ U = sum_(i = 0)^n e_i u_i \, #h(2em) rho = sum_(i = 0)^n e_i gt.eq 2 . $

 For every $k gt.eq 1$, the group with coefficients $R \/ I_(n + 1)$ in bidegree 
$ \( s \, w \) = \( q k + 1 - rho \, U + k \) $

 is zero.]
] <low:algebraic-vanishing>

#proof[
  Include the first case in the notation of the second by setting $U = u_n$ and $rho = 0$, while retaining its indicated coefficient comodule. If the normalized cochain group in degree $\( s \, w \)$ is nonzero, Lemma 4 gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ 2015 k lt.eq U + rho - 1 . $ <low:normalized-cutoff>]
  The exact values
  $ \( u_0 \, u_1 \, u_2 \, u_3 \, u_4 \) = \( 0 \, 1 \, 1010 \, 1 \, 019 \, 091 \, 1 \, 028 \, 262 \, 820 \) $
  give Table 1. Each upper bound is obtained by substituting the displayed maxima in Equation (4.1) and taking the integer part. A zero upper bound on $k$ excludes all $k gt.eq 1$.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Case
], table.cell(rowspan: 1, colspan: 1)[Maximum $U$
], table.cell(rowspan: 1, colspan: 1)[Maximum $rho$
], table.cell(rowspan: 1, colspan: 1)[Maximum $k$
], table.cell(rowspan: 1, colspan: 1)[Maximum $w$
]),
  table.cell(rowspan: 1, colspan: 1)[Product, $n = 0$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[Product, $n = 1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[Product, $n = 2$
], table.cell(rowspan: 1, colspan: 1)[$2022$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2023$
],
  table.cell(rowspan: 1, colspan: 1)[Product, $n = 3$
], table.cell(rowspan: 1, colspan: 1)[$2 \, 040 \, 204$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$1012$
], table.cell(rowspan: 1, colspan: 1)[$2 \, 041 \, 216$
],
  table.cell(rowspan: 1, colspan: 1)[$v_1$ target
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[$v_2$ target
], table.cell(rowspan: 1, colspan: 1)[$1010$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[$v_3$ target
], table.cell(rowspan: 1, colspan: 1)[$1 \, 019 \, 091$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$505$
], table.cell(rowspan: 1, colspan: 1)[$1 \, 019 \, 596$
],
)
]],
    caption: [Table 1: Preliminary bounds for all lower obstruction bidegrees. ],
  )
  These bounds also justify the additive comparison in the adjacent cochain degrees. For either remaining product case, $w < u_(n + 1)$, so no positive coefficient or coordinate $t_i$ with $i gt.eq n + 1$ can occur. The retained coproducts are additive modulo $I_(n + 1)$, and the last assertion of Lemma 5 applies in every degree. For a remaining $v_n$ target, a positive coefficient costs at least $u_n$, leaving at most $k$ weight for $d gt.eq s - 1 = q k > k$ reduced bars when $d in { s - 1 \, s \, s + 1 }$. Such a coefficient cannot occur. A bar containing $t_n$ or a higher coordinate leaves at most $k$ for the other $d - 1 gt.eq q k - 1 > k$ bars and cannot occur either. Hence the same three cochain degrees are additive. In all cases, both adjacent differentials are identified, so the desired cohomology is identified with that for $P$.
  Every remaining weight in Table 1 is at most $2 \, 041 \, 216$, whereas
  $ p^3 = 1 \, 027 \, 243 \, 729 . $
  A May letter covering position $3$ or above has weight at least $p^3$. Thus only positions $0 \, 1 \, 2$ can occur. We use the common exterior and polynomial alphabet of Equation (3.3), with the interval coverage conventions of Section 3. Allowing this entire alphabet only enlarges the upper bound if fewer coordinates were retained in the preceding comparison.
  Suppose a monomial of the desired bidegree exists. Let $m lt.eq 6$ be its number of exterior letters and $L = \( s - m \) \/ 2$ its total polynomial exponent. Every polynomial letter has weight at least $p$, so
  $ U + k gt.eq p L = p \( p - 1 \) k + frac(p \( 1 - rho - m \), 2) . $
  For all profiles under consideration, $U lt.eq 2 p^2 + 4 p + 6$ and $rho lt.eq 8$. Consequently
  #[#set math.equation(numbering: n => "(4.2)")
   $ \( p^2 - p - 1 \) k lt.eq U + frac(p \( rho + 5 \), 2) lt.eq 2 p^2 + 21 / 2 p + 6 . $ <low:polynomial-cutoff>]
  If $k gt.eq 3$, the left side exceeds the last expression by at least
  $ p^2 - 27 / 2 p - 9 = frac(2 \, 008 \, 901, 2) > 0 . $
  It follows that $1 lt.eq k lt.eq 2$.
  Write $U = F_0 + p F_1 + p^2 F_2$. In a product profile the digits are
  $ F_0 = e_1 + e_2 + e_3 \, #h(2em) F_1 = e_2 + e_3 \, #h(2em) F_2 = e_3 \, $
  with missing $e_i$ set to zero. For a $v_n$ target they are initial strings of ones. In every case,
  #[#set math.equation(numbering: n => "(4.3)")
   $ 6 gt.eq F_0 gt.eq F_1 gt.eq F_2 gt.eq 0 \, #h(2em) F_1 lt.eq 4 \, quad F_2 lt.eq 2 . $ <low:digits>]
  Let $H_r$ count the exterior letters covering position $r$, and let $n_B \, n_C$ be the polynomial exponents of $B \, C$. Adding weights gives the exact identity
  #[#set math.equation(numbering: n => "(4.4)")
   $ F_0 + k + p F_1 + p^2 F_2 = H_0 + p \( H_1 + L - n_C \) + p^2 \( H_2 + n_B + n_C \) . $ <low:weight-equation>]
  We next extract its digits without an unproved no-carry assumption.
  First, $0 lt.eq H_0 lt.eq 3$ and $1 lt.eq F_0 + k lt.eq 8 < p$. Reduction modulo $p$ therefore gives $H_0 = F_0 + k$. Also $B \, C$ each cost at least $p^2$, so
  $ p^2 \( n_B + n_C \) lt.eq w lt.eq 2 p^2 + 4 p + 8 < 3 p^2 \; $
  the last strict inequality has difference $p^2 - 4 p - 8 = 1 \, 014 \, 037 > 0$. Hence $n_B + n_C lt.eq 2$.
  Put $delta = \( m + rho - 1 \) \/ 2$. It is an integer because $s - m$ is even. For a target with $rho = 0$, that parity forces $m$ odd, hence $m gt.eq 1$; for a product profile $rho gt.eq 2$. Thus $delta gt.eq 0$. The bounds $m lt.eq 6$, $rho lt.eq 8$ and the same parity give $delta lt.eq 6$. Now $L = \( p - 1 \) k - delta$. Subtracting the position-zero equation from Equation (4.4), dividing by $p$, and rearranging gives
  $ H_1 - k - delta - n_C - F_1 = p \( F_2 - k - H_2 - n_B - n_C \) . $
  Since $H_1 lt.eq 4$, the left side lies in $\[ - 14 \, 3 \]$. Its only possible multiple of $p = 1009$ is zero. We have therefore proved the three exact relations
  #[#set math.equation(numbering: n => "(4.5)")
   $ H_0 = F_0 + k \, #h(2em) H_2 + n_B + n_C = F_2 - k \, #h(2em) H_1 = F_1 + k + delta + n_C . $ <low:coverage-relations>]
  Among the exterior letters covering position zero, only $x \, a$ fail to cover position two. Thus $H_2 gt.eq H_0 - 2$. Equations (4.3) and (4.5) imply
  $ F_0 - F_2 + 2 k lt.eq 2 . $
  As $k gt.eq 1$, equality is forced: $k = 1$ and $F_0 = F_1 = F_2 = f$. All the intervening inequalities are equalities, giving
  $ n_B = n_C = 0 \, #h(2em) H_0 = f + 1 \, #h(2em) H_2 = f - 1 . $
  The bounds on $H_0 \, H_2$ leave only $f = 1 \, 2$.
  If $f = 1$, the exterior letters $x \, a$ must occur and $c \, b \, z$ must be absent. Only $y$ is optional, so $H_1 lt.eq 2$ and $m gt.eq 2$. On the other hand, the last relation in Equation (4.5) gives $H_1 = 2 + delta > 2$, since $delta = \( m + rho - 1 \) \/ 2 > 0$. If $f = 2$, the letters $x \, a \, c$ must occur and $b \, z$ must be absent. Again only $y$ is optional, so $H_1 lt.eq 3$ and $m gt.eq 3$, whereas the same relation gives $H_1 = 3 + delta > 3$. Both possibilities are impossible. There is no monomial on the May upper-bound page, and hence no cobar cohomology in any of the stated bidegrees. ◻
]

#thm([Lemma 4.2.])[
  (Finite local cell attachments).  #emph[A spectrum obtained from finitely many $p$-local sphere cells is the $p$-localization of a finite CW spectrum.]
] <low:finite-localization>

#proof[
  Proceed one attachment at a time. If the previously constructed spectrum is the localization of a finite spectrum $Z$, an attaching map belongs to $pi_d \( Z_(\( p \)) \) = pi_d \( Z \) ⊗ bb(Z)_(\( p \))$ and can be written $a \/ m$ with $p divides.not m$. After localization, multiplication by $m$ on its sphere source is an equivalence. The localized cone of the integral attaching map $a$ is therefore equivalent to the cone of $a \/ m$. Induction over the finitely many cells proves the assertion. ◻
]

#thm([Proposition 4.3.])[
  (Construction through $V \( 3 \)$).  #emph[For $0 lt.eq n lt.eq 3$ there is a finite $p$-local cell spectrum $V \( n \)$ with a bottom-cell unit $eta_n : S_(\( p \)) arrow.r V \( n \)$ and a binary multiplication 
$ mu_n : V \( n \) and V \( n \) arrow.r V \( n \) $

 whose two unit identities hold. Its cells are indexed by subsets of ${ 0 \, dots.h \, n }$, in dimensions 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(i in S) \( q u_i + 1 \) \, $ <low:cell-dimensions>]

 and its $B P$-homology is the canonical quotient comodule $R \/ I_(n + 1)$, generated in degree zero by the bottom unit. In particular, we may fix 
#[#set math.equation(numbering: n => "(4.7)")
 $ Y = V \( 3 \) \, #h(2em) B P_(*) Y = R \/ I_4 \, $ <low:Y>]

 with such a binary two-sided unital multiplication.]
] <low:V3>

#proof[
  Start with $V \( 0 \)$, the cofiber of $p : S_(\( p \)) arrow.r S_(\( p \))$. Since multiplication by $p$ is injective on $R$, its $B P$-homology is $R \/ \( p \)$, with the canonical quotient coaction and bottom generator. Its cells are in dimensions zero and one, as in Equation (4.6).
  We give first the product-extension argument, which applies to this initial complex and to every later complex once its asserted homology and cells have been obtained. The subcomplex
  $ U_n = \( S_(\( p \)) and V \( n \) \) union_(S_(\( p \)) and S_(\( p \))) \( V \( n \) and S_(\( p \)) \) med subset.eq med V \( n \) and V \( n \) $
  has a map to $V \( n \)$ given by the two identity maps, which agree on the common bottom sphere. Every remaining cell corresponds to a pair of nonempty subsets of ${ 0 \, dots.h \, n }$. If $e_i$ counts occurrences of $i$ in that pair, its dimension is $q U + rho$, with precisely the parameters in the second part of Lemma 11. The obstruction to extending across the cell lies in $pi_(q U + rho - 1) V \( n \)$.
  An Adams–Novikov term in that stem has $q w - s = q U + rho - 1$, or
  $ w = U + k \, #h(2em) s = q k + 1 - rho . $
  Since $2 lt.eq rho lt.eq 8 < q$, nonnegative filtration requires $k gt.eq 1$. Every corresponding $E_2$ group is zero by Lemma 11. Strong convergence and finite filtration, from Proposition 6, give $pi_(q U + rho - 1) V \( n \) = 0$. Extending cell by cell therefore produces $mu_n$, agreeing with both identity maps on $U_n$. This constructs the initial product on $V \( 0 \)$ as well.
  Suppose now that $V \( n - 1 \)$, including its product, has been constructed, where $1 lt.eq n lt.eq 3$. By Lemma 2, $v_n$ is a primitive element of $B P_(*) V \( n - 1 \) = R \/ I_n$. It defines a filtration-zero $E_2$ class. Its possible positive differential targets are exactly Equation (2.6); the first part of Lemma 11 makes them all zero. There is no incoming differential to filtration zero. The edge assertion in Proposition 6 consequently realizes $v_n$ by a homotopy map
  $ tilde(v)_n : S_(\( p \))^(q u_n) arrow.r V \( n - 1 \) . $
  Use the product to form
  $ f_n = mu_(n - 1) \( tilde(v)_n and "id" \) : Sigma^(q u_n) V \( n - 1 \) arrow.r V \( n - 1 \) \, $
  and define $V \( n \)$ as its cofiber.
  The induced map on $B P$-homology is multiplication by $v_n$: the coefficient pairing is $R$-bilinear, the homology is cyclic on the unit, and $tilde(v)_n$ has the specified Hurewicz image. This multiplication is injective on the polynomial quotient $R \/ I_n$. The cofiber exact sequence therefore gives precisely $R \/ I_(n + 1)$, with no additional shifted kernel summand. The bottom sphere map surjects onto this cyclic homology, so its kernel $I_(n + 1)$ identifies the coaction with the canonical quotient coaction, as well as fixing the generator in degree zero.
  The mapping cone adds the old cells shifted by $q u_n + 1$, giving exactly Equation (4.6). The product-extension argument already proved then constructs $mu_n$. This completes the induction. All attachments are finite $p$-local cell attachments, and Lemma 12 gives finiteness in the sense of the stated realization problem. No associativity of any $mu_n$ has been asserted or used. ◻
]

#thm([Corollary 4.4.])[
  (The action of $p$ on $Y$).  #emph[For the spectrum $Y$ of Proposition 13, $pi_0 Y = bb(F)_p$ and $p "id"_Y$ is nullhomotopic.]
] <low:p-null>

#proof[
  The bottom two cells form the mod-$p$ Moore spectrum. All other cells have dimension at least $q u_1 + 1 = q + 1 > 1$, so they do not change $pi_0$. Thus $p eta_3 = 0$ in $pi_0 Y$. Applying the left unit identity of its binary multiplication gives
  $ p "id"_Y = mu_3 #scale(x: 120%, y: 120%)[\(] \( p eta_3 \) and "id"_Y #scale(x: 120%, y: 120%)[\)] = 0 . $
  ◻
]

== 5 The height-four obstruction calculation <may:section>

The algebraic spectral sequences below use the filtered cobar complexes of Section 3.

=== 5.1 Possible differential targets <possible-differential-targets>

We now use the finite spectrum $Y$ furnished by Proposition 13. Its homology is $R \/ I_4$, its bottom cell is a unit, and it has a binary two-sided unital multiplication. The possible positive Adams–Novikov differentials from $v_4$ have targets

#[#set math.equation(numbering: n => "(5.1)")
 $ s = q k + 1 \, #h(2em) w = u_4 + k \, #h(2em) k gt.eq 1 . $ <may:obstruction-degrees>]

#thm([Lemma 5.1.])[
  (Explicit cutoffs).  #emph[The groups in (5.1) are identified with $H^(s \, w) \( P \)$. Their May page has only positions $0 \, 1 \, 2 \, 3$, and it is zero unless $k lt.eq p + 2$. For $k gt.eq 2$, only positions $0 \, 1 \, 2$ can occur.]
] <may:target-bound>

#proof[
  If $w < s$, the degree-$\( s \, w \)$ cochain groups for both $Y$ and $P$ are zero, as is the May page, and all the conclusions are immediate. We may therefore suppose $w gt.eq s$. The normalized bound in Lemma 4 then gives $\( q - 1 \) k lt.eq u_4 - 1$. Consequently
  $ w lt.eq u_4 + frac(u_4 - 1, q - 1) < frac(q, q - 1) u_4 < 4 p^3 < p^4 quad \( p = 1009 \) \, $
  where $u_4 < 2 p^3$ and $q \/ \( q - 1 \) < 2$. Thus no letter can reach position four. Also $w < u_5$. A coefficient containing $v_4$ leaves at most $k$ weight for normalized bars, whereas the three lengths $s - 1 \, s \, s + 1$ are all greater than $k$, because $s - 1 = q k > k$. Higher coefficient generators are excluded by $w < u_5$. The adjacent-chain comparison of Lemma 9 therefore identifies the required cohomology with that of $P$.
  There are ten possible exterior intervals on positions $0 \, 1 \, 2 \, 3$. Since $s$ is odd, $m$ is odd and hence $m lt.eq 9$. Every polynomial letter has weight at least $p$, so
  $ u_4 + k gt.eq p L gt.eq p \( \( p - 1 \) k - 4 \) \, #h(2em) \( p^2 - p - 1 \) k lt.eq u_4 + 4 p . $
  But
  $ \( p^2 - p - 1 \) \( p + 3 \) - \( u_4 + 4 p \) = p^2 - 9 p - 4 > 0 quad \( p = 1009 \) . $
  It follows that $k lt.eq p + 2$.
  For $k gt.eq 2$ we have $L gt.eq 2 p - 6$. If any letter reaches position three, that letter has weight at least $p^3$, while all other polynomial letters have total weight at least $\( L - 1 \) p$. This is a valid lower bound whether the distinguished letter is exterior or polynomial. Thus
  $ w gt.eq p^3 + 2 p^2 - 7 p > p^3 + p^2 + 2 p + 3 = u_4 + p + 2 gt.eq w \, $
  since the strict difference is $p^2 - 9 p - 3 > 0$ at $p = 1009$. This contradiction excludes position three in that range. ◻
]

=== 5.2 The first obstruction <the-first-obstruction>

The first possible differential is $d_(q + 1)$, and its target is the actual cobar cohomology in degree $\( q + 1 \, u_4 + 1 \)$. We first explain why an injective multiplication on this group will rule out the differential. Lemma 3 gives

$ v_4 h_(1 \, 4) + e v_4^p h_(1 \, 0) = 0 $

in the $E_2$ algebra for $Y$. By $q$-sparsity no earlier positive differential occurs, so Proposition 7 makes $d_(q + 1)$ a derivation on this algebra. Let $sigma$ denote the algebraic specialization to $P$-cohomology. Differentiate the relation and then apply $sigma$. All terms containing $v_4$ specialize to zero, and $d_(q + 1) \( v_4^p \) = p v_4^(p - 1) d_(q + 1) \( v_4 \) = 0$. Hence

#[#set math.equation(numbering: n => "(5.2)")
 $ sigma #scale(x: 120%, y: 120%)[\(] d_(q + 1) \( v_4 \) #scale(x: 120%, y: 120%)[\)] h_(1 \, 4) = 0 . $ <may:specialized-obstruction>]

Specialization is applied after the topological differential, to an identity of cobar-cohomology classes; no spectrum realizing $sigma$ is required.

It remains to prove that multiplication by $h_(1 \, 4)$ is injective on $H^(q + 1 \, u_4 + 1) \( P \)$. Its degree shift is $\( 1 \, p^4 \)$, so its product lies in degree $\( q + 2 \, u_5 + 1 \)$. An incoming May differential to that product must have source degree $\( q + 1 \, u_5 + 1 \)$. The next lemma lists the initial May monomials in the obstruction degree and in this incoming-source degree. We will use the digit-zero adjustment of Lemma 10 to separate the surviving source filtrations from the product filtration.

In the alphabet of Equation (3.3), the splitting differential is

#[#set math.equation(numbering: n => "(5.3)")
 $ d a = x y \, #h(2em) d b = y z \, #h(2em) d c = x b + a z \, $ <may:small-splitting>]

with the exterior order $x \, a \, c \, y \, b \, z$ used for signs.

#thm([Lemma 5.2.])[
  (The first target and all incoming-source intervals).  #emph[In bidegree $\( s \, w \) = \( q + 1 \, u_4 + 1 \)$ the complete initial May page consists of 
#[#set math.equation(numbering: n => "(5.4)")
 $ a c b B^(p - 2) \, #h(2em) a c y b z B^(p - 3) . $ <may:first-target-list>]

 The first is not a splitting cycle and the second is a splitting cycle. In bidegree $\( q + 1 \, u_5 + 1 \)$ the complete list is given in Table 2. The four entries of exterior length three or five have no nonzero splitting cycle in their span.]
] <may:first-list>

#proof[
  We prove exhaustion simultaneously for $w = u_n + 1$, with $n = 4 \, 5$. Since $u_n + 1 < p^n$, the available exterior intervals are $\[ a \, b \)$ with $0 lt.eq a < b lt.eq n$, and the polynomial intervals cover positions $1 \, dots.h \, n - 1$. The target weight has base-$p$ digits $\( 2 \, 1 \, dots.h \, 1 \)$. At position zero, $H_0 lt.eq n < p$, so $H_0 = 2$ and there is no carry into position one. As $s = 2 p - 1$ is odd, write
  $ m = 2 D - 1 \, #h(2em) L = p - D . $
  There are exactly two exterior intervals starting at zero; at most $n \( n - 1 \) \/ 2$ others are available. Hence $m lt.eq 11$, $2 lt.eq D lt.eq 6$, and
  #[#set math.equation(numbering: n => "(5.5)")
   $ p - 6 lt.eq L lt.eq p - 2 . $ <may:L-range>]
  The lower bound on $D$ follows from $m$ being odd and at least two.
  Let $c_r$ be the carry into position $r$, with $c_1 = c_n = 0$, and let $B_r$ count polynomial intervals covering position $r$. The largest possible exterior coverage at a position is nine. Inductively, the quantity $H_r + B_r + c_r$ is at most $9 + \( p - 2 \) + 1 = p + 8 < 2 p$; therefore every carry is zero or one. The digit equations are
  #[#set math.equation(numbering: n => "(5.6)")
   $ B_r = 1 - H_r - c_r + p c_(r + 1) \, #h(2em) 1 lt.eq r lt.eq n - 1 . $ <may:carry-equations>]
  If there were no carry, then $B_r lt.eq 1$ for every $r$, and $L lt.eq sum B_r lt.eq 4$, contrary to $L gt.eq p - 6 = 1003$.
  Call a position high when $c_(r + 1) = 1$. A high position has $B_r gt.eq p - 9$, and a nonhigh position has $B_r lt.eq 1$. There cannot be two blocks of high positions. Indeed, choose high positions $a < b$ in different blocks and a nonhigh position $c$ between them. An interval covering both $a$ and $b$ also covers $c$, whence
  $ L gt.eq B_a + B_b - B_c gt.eq 2 \( p - 9 \) - 1 = 2 p - 19 > p - 2 . $
  Here $2 p - 19 = 1999$ and $p - 2 = 1007$. This contradicts (5.5). Thus the high positions form a single block $\[ l \, r \]$ with $1 lt.eq l lt.eq r lt.eq n - 2$. At the next position (5.6) reads $B_(r + 1) = - H_(r + 1)$, so
  #[#set math.equation(numbering: n => "(5.7)")
   $ B_(r + 1) = H_(r + 1) = 0 . $ <may:gap-after-block>]
  At the beginning of the block, $B_l = p + 1 - H_l lt.eq L$, giving $H_l gt.eq D + 1$. If $l < r$, its end gives $B_r = p - H_r lt.eq L$, hence $H_r gt.eq D$.
  A singleton block is impossible. Every exterior interval covering its position $l$ must end at $l + 1$ by (5.7). When $l = 1$ there are only two such intervals. When $l > 1$, at most one begins before $l$, since $H_(l - 1) lt.eq 1$, and at most one begins at $l$. Thus in either case $H_l lt.eq 2$, contradicting $H_l gt.eq D + 1 gt.eq 3$. We henceforth have $l < r$.
  If $l > 1$, at most two exterior intervals cover both $l$ and $r$: they must end at $r + 1$, and at most one starts before $l$, while at most one starts at $l$. At least one of the two intervals starting at zero misses both positions, since $H_(l - 1) lt.eq 1$. Consequently
  $ H_l + H_r = m + \# { upright("intervals meeting both") } - \# { upright("intervals meeting neither") } lt.eq m + 1 . $
  This contradicts $H_l + H_r gt.eq 2 D + 1 = m + 2$. Therefore $l = 1$. There are now at most two exterior intervals covering both endpoints, namely $\[ 0 \, r + 1 \)$ and $\[ 1 \, r + 1 \)$. Equality in the same counting identity is forced: both are present, every exterior interval meets position $1$ or position $r$, and
  $ H_1 = D + 1 \, #h(2em) H_r = D . $
  It follows that $B_1 = B_r = L$. Every polynomial interval therefore covers both positions, and by (5.7) every one is exactly $\[ 1 \, r + 1 \)$. No exterior or polynomial interval can occur after the block. The carry supplies the target digit at $r + 1$; all further digits would be zero. Since the required remaining digits are all one, necessarily $r = n - 2$. Thus
  #[#set math.equation(numbering: n => "(5.8)")
   $ upright("polynomial factor ") b_(n - 2 \, 0)^(p - D) \, #h(2em) H_0 = 2 \, quad H_1 = D + 1 \, quad H_2 = dots.h.c = H_(n - 2) = D \, quad H_(n - 1) = 0 . $ <may:forced-profile>]
  It remains to list a small, now forced set of exterior intervals. For $n = 4$, the intervals $\[ 0 \, 3 \)$ and $\[ 1 \, 3 \)$ are mandatory. The other start-zero interval must be $\[ 0 \, 2 \)$; $\[ 0 \, 1 \)$ would meet neither endpoint. The only optional intervals are $\[ 1 \, 2 \)$ and $\[ 2 \, 3 \)$. The coverage requirements in (5.8) require both or neither. This is exactly (5.4).
  For $n = 5$, the mandatory intervals are $\[ 0 \, 4 \)$ and $\[ 1 \, 4 \)$. The remaining start-zero interval is $\[ 0 \, t \)$ with $t = 2$ or $3$. The only optional intervals are $\[ 1 \, 2 \) \, \[ 1 \, 3 \) \, \[ 2 \, 4 \) \, \[ 3 \, 4 \)$; $\[ 2 \, 3 \)$ meets neither endpoint and is forbidden. Write their inclusion indicators as $e_12 \, e_13 \, e_24 \, e_34 in { 0 \, 1 }$, and let their sum be $o$. The three required coverage equations are
  #[#set math.equation(numbering: n => "(5.9)")
   $ e_12 + e_13 = o \/ 2 \, #h(2em) e_24 + e_34 = o \/ 2 \, #h(2em) e_13 + e_24 + \[ t = 3 \] = o \/ 2 \, $ <may:four-indicators>]
  where $o in { 0 \, 2 \, 4 }$. For $t = 2$ the solutions are no optional intervals, the pair ${ 12 \, 24 }$, the pair ${ 13 \, 34 }$, and all four. For $t = 3$ the only solution is the pair ${ 12 \, 34 }$. This proves the exhaustive Table 2, including its length-seven entry.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, left, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[Exterior intervals (exclusive right endpoints)
], table.cell(rowspan: 1, colspan: 1)[Polynomial factor
]),
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$02 \, 04 \, 14$
], table.cell(rowspan: 1, colspan: 1)[$b_(3 \, 0)^(p - 2)$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$03 \, 04 \, 12 \, 14 \, 34$
], table.cell(rowspan: 1, colspan: 1)[$b_(3 \, 0)^(p - 3)$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$02 \, 04 \, 13 \, 14 \, 34$
], table.cell(rowspan: 1, colspan: 1)[$b_(3 \, 0)^(p - 3)$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$02 \, 04 \, 12 \, 14 \, 24$
], table.cell(rowspan: 1, colspan: 1)[$b_(3 \, 0)^(p - 3)$
],
  table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$02 \, 04 \, 12 \, 13 \, 14 \, 24 \, 34$
], table.cell(rowspan: 1, colspan: 1)[$b_(3 \, 0)^(p - 4)$
],
)
]],
    caption: [Table 2: Every initial May monomial in bidegree $\( q + 1 \, u_5 + 1 \)$. The symbol $a b$ in this table denotes the interval $\[ a \, b \)$, not a product of the letters in (3.3). ],
  )
  For completeness, the splitting calculation is also explicit. The length-three entry has, for example, a nonzero component on $01 \, 04 \, 12 \, 14$. For the three length-five entries in their displayed order, take the following four rows, ordering exterior intervals lexicographically:
  $ 01 \, 04 \, 12 \, 13 \, 14 \, 34 & 1 & - 1 & 0\
02 \, 03 \, 12 \, 14 \, 24 \, 34 & 1 & 0 & 1\
02 \, 04 \, 12 \, 13 \, 24 \, 34 & 0 & 1 & 1\
02 \, 04 \, 12 \, 14 \, 23 \, 34 & - 1 & - 1 & 1 $
  The common polynomial factor is $b_(3 \, 0)^(p - 3)$. The minor using the first, second, and fourth rows is $3$, which is nonzero in $bb(F)_1009$. Thus these three images are linearly independent. Finally, (5.3) shows that $a c b$ has a nonzero splitting differential and that $a c y b z$ is closed: every term in the latter differential repeats an exterior factor. This finishes the lemma. ◻
]

#thm([Proposition 5.3.])[
  (An injective multiplication).  #emph[Multiplication by the primitive class $h_(1 \, 4)$ is injective on actual cobar cohomology in bidegree $\( q + 1 \, u_4 + 1 \)$: 
$ H^(q + 1 \, u_4 + 1) \( P \) arrow.r^(med h_(1 \, 4) med) H^(q + 2 \, u_5 + 1) \( P \) . $

]
] <may:injectivity>

#proof[
  Use the filtration in Lemma 10 with the explicit choice $M = 3 p$. If the source cohomology is nonzero, any nonzero class has leading detector a nonzero scalar multiple of $a c y b z B^(p - 3)$, by Lemma 16. Its filtration is
  $ F_0 = 3 p^2 - 9 p + 13 + M \( 2 + p \( p - 3 \) \) . $
  The cocycle $\[ t_1^(p^4) \]$ represents $h_(1 \, 4)$, with degree, weight, and filtration shifts $\( 1 \, p^4 \, 1 \)$. The proposed leading product therefore has filtration
  #[#set math.equation(numbering: n => "(5.10)")
   $ F_(*) = 3 p^2 - 9 p + 14 + M \( 2 + p \( p - 3 \) \) . $ <may:product-filtration>]
  Every possible incoming May differential to this product has source cohomological degree $q + 1$ and weight $u_5 + 1$. Table 2 is its complete initial-page source list. The length-three and length-five source filtrations are respectively
  $ 5 p^2 - 10 p + 15 + M \( 2 + p \( p - 2 \) \) \, #h(2em) 5 p^2 - 15 p + 19 + M \( 2 + p \( p - 3 \) \) \; $
  all three length-five sources have the latter filtration. The length-three and length-five entries disappear under $d_1$, since their displayed splitting maps are injective. None can be a splitting boundary for the product itself, because its polynomial factor is a power of $B = b_(2 \, 0)$, whereas their polynomial factor is a power of $b_(3 \, 0)$. The length-seven source has filtration
  $ F_7 = 5 p^2 - 20 p + 23 + M \( 2 + p \( p - 4 \) \) . $
  For $M = 3 p$ the difference is
  $ F_7 - F_(*) = 2 p^2 - 11 p + 9 - p M = - p^2 - 11 p + 9 < 0 . $
  As all May differentials lower filtration, this last source cannot hit the proposed product on any later page. There are no other incoming sources.
  This argument does not require $B$ to represent a permanent class by itself. Choose an actual cocycle for the given nonzero source cohomology class and multiply that entire cocycle by $\[ t_1^(p^4) \]$. The result is an actual cocycle. Its leading associated-graded cup product is the nonzero monomial $a c y b z B^(p - 3) h_(1 \, 4)$, since the new exterior letter is distinct from all the old ones. An actual cocycle has no outgoing May differential; its leading detector could disappear only by becoming a boundary, which the preceding incoming-source calculation excludes at every page. Its product cohomology class is therefore nonzero. ◻
]

#thm([Proposition 5.4.])[
  (The first Adams–Novikov differential).  #emph[In the Adams–Novikov spectral sequence for $Y$, one has $d_(q + 1) \( v_4 \) = 0$.]
] <may:first-differential>

#proof[
  Equation (5.2) and Proposition 17 give $sigma \( d_(q + 1) \( v_4 \) \) = 0$. Lemma 15 identifies this specialization with the original target group. Hence $d_(q + 1) \( v_4 \) = 0$. ◻
]

=== 5.3 The remaining targets <the-remaining-targets>

#thm([Proposition 5.5.])[
  (All later obstruction candidates).  #emph[For $k gt.eq 2$ the complete initial May page in (5.1) is Table 3; all other values of $k$ give an empty page. Put $N_0 = \( p - 1 \)^2$ and $N = p \( p - 1 \) - 2$.]
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#emph[$k$]
], table.cell(rowspan: 1, colspan: 1)[#emph[Initial May monomials]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$x a c B A^(p - 2) C^(p - 2)$, $quad x a c y z A^(p - 2) C^(p - 2)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p - 1$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$y B^3 A^(N_0 - 3)$, $quad b B^2 A^(N_0 - 2)$, $quad y b z B A^(N_0 - 2)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$c y b A^(N + 1)$, $quad a y b B A^N$]
],
)
]],
    caption: [Table 3: #emph[Every initial May monomial for the later $v_4$ obstruction bidegrees.] ],
  )
] <may:remaining-list>

#proof[
  Lemma 15 allows only positions $0 \, 1 \, 2$ and $2 lt.eq k lt.eq p + 2$. Thus (3.4) applies. There are six exterior letters; $m$ is odd, so write
  $ m = 2 f + 1 \, quad 0 lt.eq f lt.eq 2 \, #h(2em) L = \( p - 1 \) k - f . $
  Reducing the weight modulo $p$ gives $H_0 equiv 1 + k med \( mod med p \)$, with $0 lt.eq H_0 lt.eq 3$. The only possibilities are $k = 2$ or $k = p + d$ with $- 1 lt.eq d lt.eq 2$.
  When $k = 2$, $H_0 = 3$ forces all of $x \, a \, c$. The other exterior letters are an even subset of ${ y \, b \, z }$. Put $T = H_2 + n_B + n_C$. Substitution in (3.4) gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ p T - n_C + H_1 = p^2 - p + 3 + f . $ <may:k2-equation>]
  For the four possible exterior subsets the value $e = H_1 - 3 - f$ is $- 2$ or $- 1$. Therefore $n_C equiv e med \( mod med p \)$. Since $0 lt.eq n_C lt.eq L lt.eq 2 p - 3$, the only possible lift is $n_C = p + e$: the lift $e$ is negative, and $2 p + e gt.eq 2 p - 2 > L$. Equation (5.11) now gives $T = p$. All the remaining counts follow as displayed:
  $ upright("extra exterior letters") & f & H_1 & H_2 & n_C & n_B & n_A\
diameter & 1 & 2 & 1 & p - 2 & 1 & p - 2\
y \, b & 2 & 4 & 2 & p - 1 & - 1 & p - 2\
y \, z & 2 & 3 & 2 & p - 2 & 0 & p - 2\
b \, z & 2 & 3 & 3 & p - 2 & - 1 & p - 1 $
  The negative counts exclude the second and fourth rows. The first and third are exactly the $k = 2$ row of Table 3.
  Now let $k = p + d$, $- 1 lt.eq d lt.eq 2$. Then $H_0 = 1 + d$, and the weight equation becomes
  #[#set math.equation(numbering: n => "(5.12)")
   $ p T - n_C + H_1 = \( 2 - d \) p + 2 + d + f . $ <may:pd-equation>]
  Since $n_C lt.eq T$ and $H_1 gt.eq 0$, it follows that
  $ \( p - 1 \) T lt.eq \( 2 - d \) \( p - 1 \) + \( 4 + f \) . $
  Here $4 + f lt.eq 6 < p - 1$, so $T lt.eq 2 - d lt.eq 3$ and $n_C lt.eq 3$. Rearranging (5.12) now gives
  $ p \( T - \( 2 - d \) \) = 2 + d + f + n_C - H_1 . $
  The right side lies between $- 3$ and $9$, strictly between $- p$ and $p$. Both sides therefore vanish, proving the exact equations
  #[#set math.equation(numbering: n => "(5.13)")
   $ H_2 + n_B + n_C = 2 - d \, #h(2em) H_1 = 2 + d + f + n_C . $ <may:pd-exact>]
  For $d gt.eq 1$, these require $3 + f lt.eq H_1 lt.eq min \( 2 f + 1 \, 4 \)$, impossible for each of $f = 0 \, 1 \, 2$. For $d = 0$, exactly one of $x \, a \, c$ occurs, so $H_1 lt.eq 3$. Equation (5.13) forces $f = 1$, $n_C = 0$, and $H_1 = 3$. The only exterior triples are $a y b$ and $c y b$. Their $H_2$ values are respectively $1$ and $2$, giving the two $k = p$ monomials in the table.
  For $d = - 1$, only $y \, b \, z$ can occur. If $m = 1$, the choices $y \, b \, z$ have $\( H_1 \, H_2 \)$ equal to $\( 1 \, 0 \) \, \( 1 \, 1 \) \, \( 0 \, 1 \)$. Equation (5.13) excludes $z$ and gives respectively $\( n_C \, n_B \) = \( 0 \, 3 \) \, \( 0 \, 2 \)$ for the other two. If $m = 3$, the exterior factor is $y b z$, with $f = 1$, $H_1 = H_2 = 2$; the same equations give $\( n_C \, n_B \) = \( 0 \, 1 \)$. Since $L = N_0 - f$, these are exactly the three $k = p - 1$ monomials. Every nonnegative count and every exterior subset has now been considered. ◻
]

The first two rows of Table 3 use only the first three or two coordinates, respectively. Every monomial in its last row has a large common power of $A$. The following comparisons turn these two observations into surjections on actual cobar cohomology, which are the inputs to the remaining obstruction arguments.

#thm([Lemma 5.6.])[
  (Two comparison surjections).  #emph[The following initial-page tests give surjections on actual cobar cohomology.]
  + #emph[If every monomial of (3.1) in bidegree $\( s \, w \)$ uses only generators with $i lt.eq r$, then $H^(s \, w) \( P_r \) arrow.r H^(s \, w) \( P \)$ is surjective.]
  + #emph[Put $A = b_(1 \, 0)$. If every initial-page monomial in bidegree $\( s \, w \)$ contains $A^a$, then multiplication by the actual cocycle representing $A^a$ gives a surjection 
$ H^(s - 2 a \, w - p a) \( P \) arrow.r H^(s \, w) \( P \) . $

]
  #emph[These conclusions also transport through additive comparisons that identify the source and target cohomology groups and commute with the indicated maps.]
] <may:comparison>

#proof[
  The subalgebra map includes a subset of the exterior and polynomial generators in (3.1); its initial-page map is therefore injective in every bidegree. Likewise, multiplication by the polynomial $A^a$ is injective in every bidegree on that page. It is induced by a filtered cochain map: $t_1$ is primitive, and
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_(i = 1)^(p - 1) binom(p, i) / p \[ t_1^i divides t_1^(p - i) \] $ <may:A-cocycle>]
  is an actual cocycle, obtained by taking the integral divided reduced coproduct and then reducing modulo $p$. It has leading class $A$. For the second comparison shift the source cohomological degree, weight, and auxiliary filtration by $2 a$, $p a$, and $a p \( 1 + M \)$.
  Take the filtered mapping cone of either cochain map. The long exact sequence of associated-graded cohomology, together with injectivity in #emph[all] bidegrees, identifies its initial cohomology page with the cokernel of the specified page map; there is no extra kernel from the next degree. That cokernel is zero in the stated target bidegree. Finite filtration therefore gives zero cone cohomology there. The ordinary cone long exact sequence gives the required surjection. Transport through the stated commuting comparisons preserves that surjectivity. ◻
]

Section 6 removes the first two rows of Table 3 in actual cobar cohomology. The last row is treated in Section 7 by a homotopy argument with an explicit Adams–Novikov page bound.

== 6 Eliminating two obstruction degrees by Frobenius <frob:section>

Throughout this section $p = 1009$. We eliminate the rows $k = 2$ and $k = p - 1$ of Table 3 in actual cobar cohomology. The Frobenius extension reduces this task to quotient-group cohomology with coefficients in kernel cohomology. A filtration of those coefficients then reduces the calculation to trivial-coefficient quotient groups, which we compute by May methods. We first establish these three steps and identify the coefficient modules that the two obstruction degrees require.

=== 6.1 The Frobenius extension and its action <the-frobenius-extension-and-its-action>

Let $G_r$, for $r = 2 \, 3$, be the affine group scheme over $bb(F)_p$ with coordinate algebra

$ P_r = bb(F)_p \[ t_1 \, dots.h \, t_r \] \, #h(2em) Delta t_i = t_i ⊗ 1 + 1 ⊗ t_i + sum_(0 < l < i) t_l ⊗ t_(i - l)^(p^l) . $

The weight of $t_i$ is $u_i$. Thus, on points over a commutative $bb(F)_p$-algebra,

#[#set math.equation(numbering: n => "(6.1)")
 $ \( g h \)_i = g_i + h_i + sum_(0 < l < i) g_l h_(i - l)^(p^l) . $ <frob:group-law>]

We write $H^a \( G_r \; M \)$ for rational group cohomology, equivalently the cohomology of the normalized coordinate cobar complex with coefficients in the $G_r$-module $M$.

The spectral sequence below is the Lyndon–Hochschild–Serre spectral sequence for an affine group scheme and a normal subgroup; see #cite(label("Jantzen1985"), form: "prose") Part I, Proposition 6.6(3) and Section 6.7 for the spectral sequence and the quotient action on kernel cohomology. We verify the required acyclicity and compute that action for this extension.

#thm([Lemma 6.1.])[
  (The Frobenius extension).  #emph[There is a finite faithfully flat exact sequence of affine group schemes 
#[#set math.equation(numbering: n => "(6.2)")
 $ 1 arrow.r K_r = \( alpha_p \)^r arrow.r G_r arrow.r^F Q_r arrow.r 1 \, #h(2em) O \( Q_r \) = bb(F)_p \[ t_1^p \, dots.h \, t_r^p \] . $ <frob:exact-sequence>]

 Its derived invariants give a first-quadrant spectral sequence 
#[#set math.equation(numbering: n => "(6.3)")
 $ zws^(upright(F)) E_2^(a \, v) = H^a #scale(x: 120%, y: 120%)[\(] Q_r \; H^v \( K_r \; bb(F)_p \) #scale(x: 120%, y: 120%)[\)] arrow.r.double H^(a + v) \( G_r \; bb(F)_p \) . $ <frob:lhss>]

 It preserves weight and converges in every weight and total cohomological degree.]
] <frob:extension>

#proof[
  The inclusion of the Frobenius subring makes $P_r$ free of rank $p^r$, with basis $t_1^(e_1) dots.h.c t_r^(e_r)$, $0 lt.eq e_i < p$. It is therefore faithfully flat. Its kernel has coordinate algebra
  $ O \( K_r \) = bb(F)_p \[ e_1 \, dots.h \, e_r \] \/ \( e_1^p \, dots.h \, e_r^p \) . $
  All the mixed terms in its coproduct vanish, so each $e_i$ is primitive. This proves the description of the kernel and the exactness of (6.2).
  Here is the acyclicity calculation needed to derive invariants. Right multiplication by a kernel point is, by (6.1), simply $t_i mapsto t_i + e_i$: every mixed term contains a positive $p$-power of a kernel coordinate. Hence multiplication gives an isomorphism of $K_r$-comodules
  #[#set math.equation(numbering: n => "(6.4)")
   $ O \( Q_r \) ⊗ O \( K_r \) arrow.r^(med tilde.equiv med) O \( G_r \) \, #h(2em) f ⊗ e_1^(j_1) dots.h.c e_r^(j_r) mapsto f t_1^(j_1) dots.h.c t_r^(j_r) \, quad 0 lt.eq j_i < p . $ <frob:regular-decomposition>]
  The first tensor factor has trivial $K_r$-coaction. The second is the regular comodule. In particular, $O \( G_r \)^(K_r) = O \( Q_r \)$, with its regular quotient coaction.
  A cofree comodule is injective: its cofree functor is right adjoint to the exact forgetful functor to vector spaces. Equation (6.4) shows that every cofree $G_r$-comodule is $K_r$-acyclic and that its $K_r$-invariants are cofree over $Q_r$. Every injective is a summand of a cofree comodule, so these assertions also hold for injectives. Finally, $M^(G_r) = \( M^(K_r) \)^(Q_r)$. Resolving these two invariants functors successively, using the indicated cofree resolutions, gives (6.3). This argument derives $K_r$-invariants; it does not assert their exactness on arbitrary modules. The spectral sequence is first quadrant, so each fixed total cohomological degree has a finite diagonal. All coordinate weights are positive and each weight component is finite dimensional. These observations give the asserted convergence, also weight by weight. ◻
]

#thm([Lemma 6.2.])[
  (Conjugation on kernel cohomology).  #emph[For $r = 3$ there is an isomorphism of bigraded algebras 
#[#set math.equation(numbering: n => "(6.5)")
 $ H^(*) \( K_3 \; bb(F)_p \) = Lambda \( x \, a \, c \) ⊗ bb(F)_p \[ A \, B \, E \] . $ <frob:kernel-cohomology>]

 The exterior generators have cohomological degree one and weights $1 \, u_2 \, u_3$, and the polynomial generators have cohomological degree two and weights $p \, p u_2 \, p u_3$, respectively. Write $xi = t_1^p$, $eta = t_2^p$ for quotient coordinates. With the right-conjugation convention, the quotient coaction is 
#[#set math.equation(numbering: n => "(6.6)")
 $ x & mapsto x \, & a & mapsto a + x xi \, & c & mapsto c + x eta + a xi^p \,\
A & mapsto A \, & B & mapsto B + A xi^p \, & E & mapsto E + A eta^p + B xi^(p^2) . $ <frob:exterior-action>]

 Products in these formulas mean coefficient times quotient coordinate. In particular, $x a c$ and $A$ are invariant. Exterior degree and polynomial degree are separately preserved. The corresponding statements for $r = 2$ omit $c$ and $E$.]
] <frob:action>

#proof[
  The dual algebra of a primitive truncated coordinate $bb(F)_p \[ e \] \/ \( e^p \)$ is a truncated polynomial algebra after rescaling the dual basis by the invertible factorials $j !$, $j < p$. Its resolution alternates multiplication by its generator and by the $\( p - 1 \)$st power of that generator. Applying the augmentation gives one class in each cohomological degree. Its algebra of extensions is an exterior degree-one generator and a polynomial degree-two generator. The shift by two of the periodic resolution represents the latter, and its iterates are nonzero in every even degree. The former has square $\[ e divides e \] = 1 / 2 d \[ e^2 \]$, which is zero at this odd prime. Tensoring these resolutions gives (6.5), including the indicated weights.
  For completeness, the naturality of the polynomial generators is Frobenius semilinear. A primitive coordinate $T$ has degree-two cocycle
  $ beta \( T \) = sum_(j = 1)^(p - 1) 1 / p binom(p, j) \[ T^j divides T^(p - j) \] \, $
  where the displayed coefficients are integers reduced modulo $p$. For a linear coordinate $T = sum_i lambda_i e_i$, the integral polynomial
  $ frac(\( sum_i lambda_i e_i \)^p - sum_i lambda_i^p e_i^p, p) $
  has reduced coproduct $beta \( sum_i lambda_i e_i \) - sum_i lambda_i^p beta \( e_i \)$. Thus a matrix $\( lambda_(i j) \)$ on degree-one coordinates induces $\( lambda_(i j)^p \)$ on these degree-two cohomology classes. This is a polynomial identity in the $lambda_(i j)$, so it also applies when they are quotient coordinate functions.
  If $e$ is a kernel point, direct use of (6.1) gives
  $ \( g^(- 1) e g \)_1 = e_1 \, #h(2em) \( g^(- 1) e g \)_2 = e_2 + e_1 g_1^p \, #h(2em) \( g^(- 1) e g \)_3 = e_3 + e_1 g_2^p + e_2 g_1^(p^2) . $
  These coefficients belong to $O \( Q_r \)$, so the action descends to the quotient. The degree-one and degree-two naturality just proved gives (6.6) and (6.6). The exterior matrix is triangular with diagonal entries one, so its top exterior power $x a c$ is fixed. The formulas also prove separate preservation of the two degrees. ◻
]

=== 6.2 Coefficient filtration and quotient cohomology <coefficient-filtration-and-quotient-cohomology>

#thm([Lemma 6.3.])[
  (The coefficient-weight filtration).  #emph[Fix an exterior degree and a polynomial degree in (6.5), obtaining an invariant $Q_r$-submodule $M$. At each total weight $w$, increasing coefficient weight filters the normalized quotient cobar complex $C^(*) \( Q_r \; M \)_w$ by a finite filtration. Its initial cohomology page is 
#[#set math.equation(numbering: n => "(6.7)")
 $ zws^(upright(C)) E_1^(a \, lambda) = M_lambda ⊗ H^a \( Q_r \; bb(F)_p \)_(w - lambda) \, $ <frob:coefficient-page>]

 where $M_lambda$ is viewed with trivial quotient action. The coefficient differential with drop $d$ has the form $zws^(upright(C)) d_d : \( a \, lambda \) mapsto \( a + 1 \, lambda - d \)$. If the nonidentity coefficient action has no weight drop smaller than $d$, all earlier coefficient differentials vanish, and the differential with drop $d$ is induced by that part of the coaction.]
  #emph[For the module $"Sym"^n \( A \, B \)$ we may write 
#[#set math.equation(numbering: n => "(6.8)")
 $ A^n chevron.l 1 \, D \, dots.h \, D^n chevron.r \, #h(2em) A^n D^j := A^(n - j) B^j quad \( 0 lt.eq j lt.eq n \) . $ <frob:finite-D>]

 This is notation for a finite-dimensional module, with action $D mapsto D + xi^p$; no inverse of $A$ is introduced.]
] <frob:coefficients>

#proof[
  In (6.6) and (6.6), every nonidentity term has lower coefficient weight, its difference being the positive weight of its quotient coordinate. The cobar differential therefore preserves the increasing coefficient filtration. In the associated graded complex only the trivial coefficient action remains, giving (6.7). At fixed total weight the coefficient weights lie between zero and $w$, so the filtration is finite. The stated description of its first possible differential follows by taking the leading nonzero weight-lowering component of the cobar differential. Finally, expanding
  $ \( B + A xi^p \)^j A^(n - j) = sum_(l = 0)^j binom(j, l) A^(n - l) B^l xi^(p \( j - l \)) $
  proves the stated action on (6.8). ◻
]

For either obstruction bidegree $\( s \, w \)$, our aim is to make every group $H^a \( Q_r \; H^(s - a) \( K_r \; bb(F)_p \) \)_w$ zero. This makes the entire total-degree-$s$ diagonal of (6.3) zero, and hence proves $H^(s \, w) \( G_r \; bb(F)_p \) = 0$. We compute these groups by the coefficient filtration (6.7), using May only to bound or identify its trivial-coefficient quotient groups.

The resulting vector-space upper bound has exactly the exterior-polynomial letters used for $G_r$: kernel cohomology supplies the digit-zero letters, and the quotient’s initial May page supplies all higher digits. This description retains the kernel degree $v$. Thus Table 3 bounds every coefficient summand on the relevant Frobenius diagonal. Lemma 20 reduces $k = 2$ to $G_3$ and $k = p - 1$ to $G_2$. Grouping the candidates by their invariant kernel modules gives the four computations in Table 4.

For each module $M$ in that table, let $lambda_0$ be its least coefficient weight and put

#[#set math.equation(numbering: n => "(6.9)")
 $ cal(R) = frac(w - lambda_0, p) . $ <frob:residual-weight>]

We call this the residual weight, and henceforth express quotient weights after division by $p$. Recall that $N_0 = \( p - 1 \)^2$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$r$
], table.cell(rowspan: 1, colspan: 1)[Kernel module $M$
], table.cell(rowspan: 1, colspan: 1)[Quotient degree $a$
], table.cell(rowspan: 1, colspan: 1)[$cal(R)$
]),
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$x a c "Sym"^(p - 1) \( A \, B \, E \)$
], table.cell(rowspan: 1, colspan: 1)[$2 p - 4$
], table.cell(rowspan: 1, colspan: 1)[$p \( p - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$x a c "Sym"^(p - 2) \( A \, B \, E \)$
], table.cell(rowspan: 1, colspan: 1)[$2 p - 2$
], table.cell(rowspan: 1, colspan: 1)[$p^2 - p + 1$
],
  table.cell(rowspan: 1, colspan: 1)[$p - 1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$"Sym"^(N_0) \( A \, B \)$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$3 p + 1$
],
  table.cell(rowspan: 1, colspan: 1)[$p - 1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$"Sym"^(N_0 - 1) \( A \, B \)$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$3 p + 2$
],
)
]],
  caption: [Table 4: The coefficient-cohomology groups that must vanish. Each row means $H^a \( Q_r \; M \)_w$, with $w = u_4 + k$ in original weights. ],
)

For the first two rows, the least weights are respectively $"wt" \( x a c A^(p - 1) \) = 3 + p + 2 p^2$ and $"wt" \( x a c A^(p - 2) \) = 3 + 2 p^2$; for the last two they are $n p$, where $n$ is the indicated polynomial degree. These give the displayed residual weights. Replacing an $A$ by $E$ increases the coefficient weight, after division by $p$, by $p^2 + p$. This exceeds both residual weights in the $k = 2$ rows, so no coefficient involving $E$ occurs in either fixed-weight complex, in any quotient degree. All four rows therefore use the finite $D$-modules of (6.8), multiplied by $x a c$ in the first two rows. Suppressing the common invariant factor $A^n$ or $x a c A^n$, a term $D^j zeta$ requires

#[#set math.equation(numbering: n => "(6.10)")
 $ "wt"_Q \( zeta \) = cal(R) - j p . $ <frob:D-weight>]

Their first possible coefficient differential lowers $j$ by one and raises the quotient degree by one: its weight drop is $p^2$ in original weights, or $p$ in these rescaled weights.

We now calculate the trivial-coefficient quotient groups needed for these four computations and their adjacent degrees. The coordinates $xi \, eta$ have rescaled weights $1 \, p + 1$ and

#[#set math.equation(numbering: n => "(6.11)")
 $ overline(Delta) xi = 0 \, #h(2em) overline(Delta) eta = xi ⊗ xi^p . $ <frob:quotient-coproduct>]

In these rescaled weights, the letters

$ y = h_(1 \, 0)^Q \, quad b = h_(2 \, 0)^Q \, quad z = h_(1 \, 1)^Q \, quad C = b_(1 \, 0)^Q $

have weights $1 \, p + 1 \, p \, p$, respectively; these are exactly the letters $y \, b \, z \, C$ used in Table 3.

#thm([Lemma 6.4.])[
  (The small quotient groups).  #emph[For $Q_2$ or $Q_3$, at any positive rescaled weight $w < p^2$ all available May letters are $y \, b \, z \, C$. Their monomials and bidegrees are 
#[#set math.equation(numbering: n => "(6.12)")
 $ C^j y^e z^f b^g \, quad j gt.eq 0 \, quad e \, f \, g in { 0 \, 1 } \, #h(2em) a = 2 j + e + f + g \, quad w = p \( j + f + g \) + e + g . $ <frob:small-monomials>]

 The following lists are exhaustive, with a dash denoting the empty list:]
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#emph[Rescaled weight]
], table.cell(rowspan: 1, colspan: 1)[#emph[Cohomological degree]
], table.cell(rowspan: 1, colspan: 1)[#emph[May monomials]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[$p \( p - 1 \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2 p - 4$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p \( p - 1 \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2 p - 3$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$z C^(p - 2)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p \( p - 2 \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2 p - 4$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$C^(p - 2)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p \( p - 3 \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2 p - 5$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p + 2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \, 3$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$p + 2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$y b$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$2 p + 2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$2 p + 2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$3$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$y b z$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$3 p + 2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$3$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1 \, 3$]
], table.cell(rowspan: 1, colspan: 1)[#emph[—]
],
)
]
  #emph[The classes $C^(p - 2)$ and $z C^(p - 2)$ in the table are nonzero in actual quotient cohomology. There is also a nonzero class $upsilon$ of degree two and weight $p + 2$, detected by $y b$, and $upsilon z$ is nonzero in degree three and weight $2 p + 2$.]
] <frob:quotient-groups>

#proof[
  The next exterior weights are $p^2$ and $p^2 + p$; the third-coordinate weight, if present, is $p^2 + p + 1$. The next polynomial weight is $p^2$. All are outside the asserted range. Lemma 10 therefore gives exactly (6.12). To verify the table, first reduce its weight equation modulo $p$: its remainder is $e + g in { 0 \, 1 \, 2 }$. For weights divisible by $p$ it forces $e = g = 0$, after which the degree equation fixes $j$ and $f$. For the listed weights congruent to two it forces $e = g = 1$; substitution into both equations gives the entries shown. The weight-two entries follow in the same way, since $j = f = g = 0$ at that weight. All weights in the table are within the asserted range, because $3 p + 2 < p \( p - 1 \)$ at $p = 1009$.
  The cocycles $z = \[ xi^p \]$ and $C = beta \( xi \)$ come from the primitive coordinate $xi$. Their product $z C^(p - 2)$ is an actual cocycle with the indicated nonzero leading May monomial. The preceding cohomological degree at its weight has no May monomial in any filtration. It consequently cannot become a boundary on any May page. An actual cocycle has no outgoing May differential, proving its nonvanishing. The factor $C^(p - 2)$ is therefore nonzero as well.
  For the other two classes, use the cobar convention $d \[ u divides v \] = d \[ u \] divides v - u divides d \[ v \]$ with $d \[ eta \] = \[ xi divides xi^p \]$. The corrected cocycle
  #[#set math.equation(numbering: n => "(6.13)")
   $ U = \[ xi divides eta \] + 1 / 2 \[ xi^2 divides xi^p \] $ <frob:corrected-cocycle>]
  is closed: its two differentials are $- \[ xi divides xi divides xi^p \]$ and $\[ xi divides xi divides xi^p \]$, respectively. In the ordinary May filtration its first summand has degree four and the correction has degree three. Its leading detector is thus $y b$. The table excludes both an incoming and an outgoing May differential, so $upsilon = \[ U \] eq.not 0$. Similarly
  $ U divides xi^p = \[ xi divides eta divides xi^p \] + 1 / 2 \[ xi^2 divides xi^p divides xi^p \] $
  is a closed representative with leading detector $y b z$. Its correction has smaller May filtration. The absence of a degree-two May monomial at weight $2 p + 2$ excludes every possible incoming differential, and the explicit cocycle excludes outgoing differentials. Hence $upsilon z eq.not 0$. ◻
]

=== 6.3 The row $k = 2$ <the-row-k2>

#thm([Proposition 6.5.])[
  (The row $k = 2$).  #emph[At $s = 4 p - 3$ and $w = u_4 + 2$, the cobar cohomology group in Table 3 is zero.]
] <frob:k2>

#proof[
  We prove vanishing for $G_3$ by treating the first two rows of Table 4. Their kernel degrees are $2 p + 1$ and $2 p - 1$, so their coefficient differentials cannot mix.
  For $M = x a c "Sym"^(p - 1) \( A \, B \, E \)$, we have $cal(R) = p \( p - 1 \)$ and quotient degree $a = 2 p - 4$. After the weight exclusion of $E$, the finite module is $x a c A^(p - 1) chevron.l 1 \, D \, dots.h \, D^(p - 1) chevron.r$. The sole candidate from Table 3 is $D C^(p - 2)$, suppressing the invariant factor $x a c A^(p - 1)$. Its quotient weight is $p \( p - 2 \)$ by (6.10). The translation of $D$ gives, on the first possible coefficient page,
  #[#set math.equation(numbering: n => "(6.14)")
   $ D \[ C^(p - 2) \] mapsto plus.minus \[ z C^(p - 2) \] . $ <frob:k2-differential>]
  The target has quotient degree $2 p - 3$ and weight $p \( p - 1 \)$. Both source and target are nonzero actual quotient-cohomology classes by Lemma 24; they are present on this page because all earlier coefficient differentials vanish. Thus (6.14) removes the candidate.
  We record the adjacent-degree checks. A differential on this page entering its source would have $D$-degree two, quotient degree $2 p - 5$, and quotient weight $p \( p - 3 \)$; this group is zero by Lemma 24. The target, having $D$-degree zero, has no outgoing coefficient differential. Its first-page incoming source can only have $D$-degree one, and (6.12) in degree $2 p - 4$, weight $p \( p - 2 \)$, gives only $C^(p - 2)$. Thus no other source can cancel the nonzero map in (6.14). In the original total degree, the same equation, or the exhaustive candidate table, leaves no other coefficient-leading term in this vertical summand. Hence a change of representative cannot replace the removed class.
  Now take the full second summand $M = x a c "Sym"^(p - 2) \( A \, B \, E \)$, with $cal(R) = p^2 - p + 1$ and quotient degree $2 p - 2$. Table 3 leaves only its $D$-degree-zero candidate, whose coefficient $x a c A^(p - 2)$ is invariant. Its quotient detector $y z C^(p - 2)$ is already a splitting boundary, since $d b = y z$ and $d C = 0$ on the May page. This also has a direct cobar realization: $y z = d \[ eta \]$ and $C$ is an actual cocycle, so $y z C^(p - 2)$ is exact. It is the only May monomial in this quotient bidegree, as follows by putting $a = 2 p - 2$, $w = p^2 - p + 1$ in (6.12). It therefore contributes no actual quotient cohomology in (6.7). These are all initial candidates of total degree $4 p - 3$ and weight $u_4 + 2$. The coefficient spectral sequences consequently vanish there, so all corresponding terms of (6.3) are zero. Its convergence proves the result. ◻
]

=== 6.4 The row $k = p - 1$ <the-row-kp-1>

#thm([Proposition 6.6.])[
  (The row $k = p - 1$).  #emph[Put $N_0 = \( p - 1 \)^2$. At $s = 2 N_0 + 1$ and $w = u_4 + p - 1$, the cobar cohomology group in Table 3 is zero.]
] <frob:kpminus1>

#proof[
  We treat the last two rows of Table 4 for $G_2$, using the finite module (6.8) in each case. For $n = N_0$, the residual weight is $cal(R) = 3 p + 1$ and the quotient degree is one. We show directly that every one-cocycle vanishes. The leading candidates could survive only if lower powers of $D$ supplied corrections. The crossed-cocycle equation will rule these out: it requires unequal mixed coefficients where every available correction has equal ones.
  Write $xi \( g \) = r$, $eta \( g \) = u$, $xi \( h \) = s$, $eta \( h \) = v$, so that
  $ xi \( g h \) = r + s \, #h(2em) eta \( g h \) = u + v + r s^p . $
  A normalized one-cocycle is a polynomial $f \( D \; g \)$ satisfying
  #[#set math.equation(numbering: n => "(6.15)")
   $ f \( D \; g h \) = f \( D \; g \) + f \( D + r^p \; h \) . $ <frob:crossed-equation>]
  Since $D$ has weight $p$ and $4 p > 3 p + 1$, it must have the form
  $ f \( D \; g \) = D^3 f_3 \( g \) + D^2 f_2 \( g \) + D f_1 \( g \) + f_0 \( g \) . $
  All these powers are in the finite module, since $N_0 gt.eq 3$. For a polynomial function $phi$ write $delta phi \( g \, h \) = phi \( g h \) - phi \( g \) - phi \( h \)$. Comparing the four coefficients in (6.15) gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ delta f_3 & = 0 \,\
delta f_2 & = 3 r^p f_3 \( h \) \,\
delta f_1 & = 2 r^p f_2 \( h \) + 3 r^(2 p) f_3 \( h \) \,\
delta f_0 & = r^p f_1 \( h \) + r^(2 p) f_2 \( h \) + r^(3 p) f_3 \( h \) . $ <frob:crossed-coefficients>]
  Homogeneity forces
  $ f_3 & = a_3 xi \,\
f_2 & = b_2 eta + c_2 xi^(p + 1) \,\
f_1 & = d_1 eta xi^p + e_1 xi^(2 p + 1) \,\
f_0 & = r_0 xi^(3 p + 1) + s_0 eta xi^(2 p) + t_0 eta^2 xi^(p - 1) . $
  Here the coefficients $a_3 \, b_2 \, c_2 \, d_1 \, e_1 \, r_0 \, s_0 \, t_0$ lie in $bb(F)_p$. The second equation of (6.16), together with
  $ delta eta = r s^p \, #h(2em) delta \( xi^(p + 1) \) = r^p s + r s^p \, $
  forces $c_2 = 3 a_3$ and $b_2 = - 3 a_3$. The next equation has coefficient $2 b_2$ on $r^p v$ and zero on $u s^p$. On the other hand,
  #[#set math.equation(numbering: n => "(6.17)")
   $ delta \( eta xi^p \) = u s^p + v r^p + r^(p + 1) s^p + r s^(2 p) \, $ <frob:asymmetric-pair>]
  and $delta \( xi^(2 p + 1) \)$ contains neither $u$ nor $v$. Its left side must therefore have equal coefficients on $r^p v$ and $u s^p$. Since $2 b_2 = - 6 a_3$ and $6 eq.not 0$ in $bb(F)_1009$, we obtain $a_3 = 0$, and then $b_2 = c_2 = 0$. No term in $f_0$ can alter this coefficient-of-$D$ equation.
  Now $f_1$ is primitive. Equation (6.17) first forces $d_1 = 0$, and the coefficient of $r^(2 p) s$ in $delta \( xi^(2 p + 1) \)$ then forces $e_1 = 0$. Finally $f_0$ is primitive. In its reduced coproduct the monomial $u^2 s^(p - 1)$ has coefficient $t_0$, so $t_0 = 0$. The monomial $u s^(2 p)$ then has coefficient $s_0$, so $s_0 = 0$. The coefficient of $r^(3 p) s$ in $delta \( xi^(3 p + 1) \)$ is one, giving $r_0 = 0$. Every normalized cocycle is thus zero, proving the required $H^1$ vanishing, including all lower-$D$ corrections.
  For $n = N_0 - 1$, the residual weight is $cal(R) = 3 p + 2$ and the desired quotient degree is three. The first coefficient differential comes from the term $2 D xi^p$ in
  $ \( D + xi^p \)^2 - D^2 = 2 D xi^p + xi^(2 p) . $
  Using the actual class $upsilon$ of Lemma 24, it is
  #[#set math.equation(numbering: n => "(6.18)")
   $ D^2 upsilon mapsto plus.minus 2 D upsilon z . $ <frob:h3-differential>]
  The coefficient differential first prepends $z$. Its product $z upsilon$ agrees with $upsilon z$: both are actual cocycles with the same leading May monomial $y b z$, with coefficient $+ 1$ after two exterior interchanges, and the list in Equation (6.12) leaves no other initial May monomial or lower-filtration cohomology in this bidegree. Thus the product order in Equation (6.18) is justified directly. Both powers of $D$ lie in the finite module, since $n gt.eq 3$. Equation (6.10) gives quotient degree and weight $\( 2 \, p + 2 \)$ for the source and $\( 3 \, 2 p + 2 \)$ for the target. Both therefore have the required residual weight $3 p + 2$. All earlier coefficient differentials vanish, so source and target are still their actual quotient-cohomology classes on this first possible page. They are both nonzero by Lemma 24.
  A same-page incoming differential to the source would require $D$-degree three and quotient $H^1$ of weight two, which is zero. The only same-page incoming source for the target is $D^2 H^2 \( Q_2 \)_(p + 2)$, the one-dimensional span displayed in (6.18). A same-page outgoing differential from the target is proportional to $upsilon z^2 = 0$. Indeed $\[ xi^p divides xi^p \] = 1 / 2 d \[ xi^(2 p) \]$, so this last vanishing also follows directly in the cobar complex. The term $xi^(2 p)$ in the expansion of $D^2$ lowers two $D$-levels and cannot cancel its first differential. Since $2 eq.not 0$ in $bb(F)_p$, (6.18) removes the target.
  There is no other degree-three coefficient-leading term. In fact, the possibilities for $D$-degrees $0 \, 1 \, 2 \, 3$ require quotient degree three at respective weights $3 p + 2 \, 2 p + 2 \, p + 2 \, 2$; by Lemma 24, only the second has a candidate, namely $y b z$. Larger $D$-degrees exceed the residual weight. Thus there is no replacement in a lower coefficient filtration. The initial candidate table excludes every other kernel degree or exterior summand at this total bidegree. Both possible terms of (6.3) consequently vanish, and the proposition follows. ◻
]

#thm([Corollary 6.7.])[
  #emph[The obstruction groups in bidegrees 
$ \( s \, w \) = \( 2 q + 1 \, u_4 + 2 \) \, #h(2em) \( s \, w \) = \( q \( p - 1 \) + 1 \, u_4 + p - 1 \) $

 vanish in the additive cobar calculation of Table 3. Among its rows with $k gt.eq 2$, only the row $k = p$ remains to be addressed.]
] <frob:vanishing>

#proof[
  Apply Propositions 25 and 26, and the exhaustive list in Table 3. ◻
]

== 7 The final obstruction and the finite cofiber <top:section>

We retain the prime $p = 1009$ and put

#[#set math.equation(numbering: n => "(7.1)")
 $ N = p \( p - 1 \) - 2 \, #h(2em) K = p \( p - 2 \) + 1 = \( p - 1 \)^2 \, #h(2em) W = 2 p^2 + 4 p + 1 . $ <top:constants>]

The spectrum $Y$ of Proposition 13 has $B P_(*) Y = R \/ I_4$ and a binary two-sided unital multiplication $mu : Y and Y arrow.r Y$ with unit $eta : S_(\( p \))^0 arrow.r Y$. All spheres and smash products in this section are $p$-local. We shall use the product and convergence assertions of Proposition 7 and Proposition 6. In this section the second superscript of $E_r^(s \, w)$ is weight: it denotes the group of internal degree $q w$ in the earlier notation.

The May comparison and the remaining-target calculation, Lemma 20 and Table 3, give a surjection

#[#set math.equation(numbering: n => "(7.2)")
 $ A^N : E_2^(5 \, W) \( Y \) arrow.r E_2^(q p + 1 \, u_4 + p) \( Y \) . $ <top:An-surjection>]

Indeed, every initial May monomial in the target is divisible by $A^N$, and the two degree identities are

$ 5 + 2 N = q p + 1 \, #h(2em) W + p N = u_4 + p . $

For the source, $W < u_4$, so specialization to the additive Hopf algebra identifies the normalized cobar groups in all three degrees $4 \, 5 \, 6$. For the target, $u_4 + p < u_5$; a positive $v_4$ coefficient would leave weight $p$, less than the shortest adjacent tensor length $q p = \( q p + 1 \) - 1$. Thus the target groups in degrees $q p \, q p + 1 \, q p + 2$ also agree with their additive specializations, by Lemma 4. The two triples differ by $2 N$. Cup multiplication by the actual carry cocycle representing $A^N$ commutes with specialization, so the filtered surjection of Lemma 20 transports through this commuting square to the displayed surjection for $Y$.

Let $alpha in pi_(q - 1) S^0$ and $beta in pi_(p q - 2) S^0$ be the sphere classes constructed in Lemma 29, detected by $\[ t_1 \]$ and $A$, respectively, and write $d = \| beta \| = p q - 2$. The two-cell spectrum that we use for lifts is

#[#set math.equation(numbering: n => "(7.3)")
 $ J = Sigma^(- q) C \( alpha \) \, #h(2em) epsilon : J arrow.r S^0 \, $ <top:J-definition>]

where $C \( alpha \)$ is the cofiber of $alpha : S^(q - 1) arrow.r S^0$ and $epsilon$ is its desuspended top quotient. Thus $J$ has cells in degrees $- q$ and zero. Its connecting map is the corresponding suspension of $alpha$, so the cofiber exact sequence gives

#[#set math.equation(numbering: n => "(7.4)")
 $ x in pi_g Y upright(" lifts to ") pi_g \( J and Y \) quad arrow.l.r.double quad alpha x = 0 in pi_(g + q - 1) Y . $ <top:lift-criterion>]

Put $n = p - 1$. Since $n !$ is a $p$-local unit, the averaging idempotent

$ e = frac(1, n !) sum_(sigma in Sigma_n) sigma quad upright("on ") J^(and n) $

has a finite retract $T = "Sym"^n J$. Choose splitting maps $i : T arrow.r J^(and n)$ and $"pr" : J^(and n) arrow.r T$, with $i "pr" = e$, and put $epsilon_T = epsilon^(and n) i : T arrow.r S^0$. The key map will be

$ f = \( eta beta \) compose Sigma^d epsilon_T : Sigma^d T arrow.r Y . $

The choice of $p - 1$ factors has a concrete algebraic purpose: writing $D T$ for the Spanier–Whitehead dual of $T$, we will identify $B P_(*) \( D T and Y \)$ as a free $R \/ I_4$-module with basis $1 \, r \, dots.h \, r^(p - 1)$ of weights $0 \, dots.h \, p - 1$. These supply exactly the coefficient powers in the integral polynomial $\( \( r + x \)^p - r^p - x^p \) \/ p$. Lemma 32 determines the translated coaction, and Proposition 33 shows that substituting $x = t_1$ gives a cochain whose cobar differential is the constant cocycle $A$. A filtration bound then proves that $f$ is an actual null map.

We first show that every source class is represented by $gamma in pi_(q W - 5) Y$ and that $alpha gamma = 0$ and $alpha dot.op \( eta beta^p \) = 0$ in $pi_(*) Y$. One lift of $gamma$ and $p - 2$ lifts of $eta beta^p$ give, after multiplying the $Y$ factors and averaging the $J$ factors, a map to $T and Y$ with top value $beta^(p \( p - 2 \)) gamma$. The null map $f$ then gives $beta^K gamma = 0$. The strict inequality $5 + 2 K < q p + 1$, together with $K < N$, converts this homotopy relation into disappearance of the whole target before $d_(q p + 1) \( v_4 \)$.

=== 7.1 The small stems used for the lifts <the-small-stems-used-for-the-lifts>

#thm([Lemma 7.1.])[
  (Small-stem lifts).  #emph[Every class of $E_2^(5 \, W) \( Y \)$ survives to homotopy. Moreover, 
#[#set math.equation(numbering: n => "(7.5)")
 $ pi_(q \( W + 1 \) - 6) Y = 0 . $ <top:alpha-gamma-vanishing>]

]
] <top:small-stems>

#proof[
  By $q$-sparsity, a positive differential out of $\( 5 \, W \)$ has target
  $ \( s \, w \) = \( 6 + q j \, W + j \) \, #h(2em) j gt.eq 1 . $
  All possible Adams–Novikov terms in the stem in (7.5) have
  $ \( s \, w \) = \( 6 + q j \, W + 1 + j \) \, #h(2em) j gt.eq 0 . $
  We treat both by writing
  #[#set math.equation(numbering: n => "(7.6)")
   $ \( s \, w \) = \( 6 + q j \, W + delta + j \) \, #h(2em) cases(delim: "{", delta = 0 \, & j gt.eq 1 \,, delta = 1 \, & j gt.eq 0 .) $ <top:small-stem-degrees>]
  First we give explicit bounds permitting the additive calculation. The normalized-cobar inequality of Lemma 4 implies
  $ \( q - 1 \) j lt.eq W + delta - 6 . $
  At the specified prime,
  $ q - 1 = 2015 \, quad W = 2 \, 040 \, 199 \, quad 2015 dot.op 1013 = 2 \, 041 \, 195 > W + 1 - 6 . $
  Consequently $j lt.eq 1012$ and
  #[#set math.equation(numbering: n => "(7.7)")
   $ w lt.eq 2 \, 041 \, 212 < p^3 = 1 \, 027 \, 243 \, 729 < u_4 = 1 \, 028 \, 262 \, 820 . $ <top:small-stem-cutoff>]
  Thus no nonconstant coefficient of $R \/ I_4$ occurs, in any cobar degree at these weights. The only possible digit positions are $0 \, 1 \, 2$, and the cooperation formulas are additive. Lemma 5 therefore identifies the relevant cobar calculation with the indicated range of $P$.
  Use the six exterior letters $x \, a \, c \, y \, b \, z$ and the three polynomial letters $A \, B \, C$ of Equation (3.4). If $m$ is the number of exterior letters and $L = \( s - m \) \/ 2$ the number of polynomial letters, then $m lt.eq 6$ and
  $ L gt.eq \( p - 1 \) j \, #h(2em) w gt.eq p L . $
  It follows that
  $ #scale(x: 120%, y: 120%)[\(] p \( p - 1 \) - 1 #scale(x: 120%, y: 120%)[\)] j lt.eq W + delta . $
  Since $p \( p - 1 \) - 1 = 1 \, 017 \, 071$ and $3 dot.op 1 \, 017 \, 071 > W + 1$, this improves the bound to $j lt.eq 2$.
  For completeness, we enumerate this remaining finite calculation. Let $H_i$ count the exterior letters covering position $i$, and let $n_A \, n_B \, n_C$ be the polynomial exponents. The weight equation is
  #[#set math.equation(numbering: n => "(7.8)")
   $ w = H_0 + p \( H_1 + L - n_C \) + p^2 \( H_2 + n_B + n_C \) . $ <top:weight-equation>]
  In (7.6), $m$ is even and reduction modulo $p$ gives $H_0 = 1 + delta + j$, whenever a solution exists. Put $kappa_2 = H_2 + n_B + n_C$. All position contributions are nonnegative; (7.7) also gives $w < 3 p^2$, so $kappa_2 lt.eq 2$ and $n_C lt.eq 2$. Substituting $L = 3 + \( p - 1 \) j - m \/ 2$ into (7.8) yields
  $ p \( kappa_2 + j - 2 \) = 1 + j + m \/ 2 + n_C - H_1 . $
  For $0 lt.eq j lt.eq 2$, its right side lies between $- 3$ and $8$. Its only multiple of $p = 1009$ is zero. Hence
  #[#set math.equation(numbering: n => "(7.9)")
   $ H_0 = 1 + delta + j \, #h(2em) kappa_2 = 2 - j \, #h(2em) H_1 = 1 + j + m \/ 2 + n_C . $ <top:small-stem-coverage>]
  For $j = 2$, either $H_0 = 4$, which is impossible, or $H_0 = 3$ forces $c$ to occur whereas $kappa_2 = 0$. For $j = 1 \, delta = 1$, all of $x \, a \, c$ occur and $kappa_2 = 1$ excludes $b \, z$. Thus $H_1 lt.eq 3$, but the last equation of (7.9), with even $m gt.eq 4$, requires $H_1 gt.eq 4$. For $j = 1 \, delta = 0$, one has $H_0 = 2$. If $m = 2$, the required inequality $H_1 gt.eq 3$ is impossible. If $m = 4$, one must have $H_1 = 4$ and $n_C = 0$; the four letters covering position one are exactly $a \, c \, y \, b$, which have $H_2 = 2$, contrary to $kappa_2 = 1$. Finally $m = 6$ would give $H_0 = 3$. All positive-$j$ groups in (7.6) therefore have empty initial May pages.
  It remains to examine $j = 0 \, delta = 1$, where $H_0 = 2$ and $m$ is $2$ or $4$. For $m = 2$ both letters start at zero, and (7.9) permits only $a c$, followed by $n_B = 1 \, n_C = 0 \, n_A = 1$. For $m = 4$ choose two of $x \, a \, c$ and two of $y \, b \, z$. The equations become
  $ n_C = H_1 - 3 \, #h(2em) n_B = 2 - H_2 - n_C \, #h(2em) n_A = 1 - n_B - n_C . $
  The following table lists all nine choices; a dash means that at least one exponent is negative.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Start-zero pair
], table.cell(rowspan: 1, colspan: 1)[$y b$
], table.cell(rowspan: 1, colspan: 1)[$y z$
], table.cell(rowspan: 1, colspan: 1)[$b z$
]),
  table.cell(rowspan: 1, colspan: 1)[$x a$
], table.cell(rowspan: 1, colspan: 1)[$x a y b B$
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[$x c$
], table.cell(rowspan: 1, colspan: 1)[$x c y b A$
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[$a c$
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[$a c y z A$
], table.cell(rowspan: 1, colspan: 1)[—
],
)
]
  Thus the complete initial-page list at $\( 6 \, W + 1 \)$ is
  #[#set math.equation(numbering: n => "(7.10)")
   $ a c A B \, #h(2em) x a y b B \, #h(2em) x c y b A \, #h(2em) a c y z A . $ <top:four-terms>]
  With exterior order $x \, a \, c \, y \, b \, z$ and $d a = x y$, $d b = y z$, $d c = x b + a z$, their splitting differentials are
  $ d \( a c A B \) & = \( x a b - x c y \) A B \, & d \( x a y b B \) & = 0 \,\
d \( x c y b A \) & = - x a y b z A \, & d \( a c y z A \) & = - x a y b z A . $
  The first image has polynomial factor $A B$ and cannot cancel either of the other images. The two remaining cycle directions are boundaries, since
  $ d \( a c y B \) = - x a y b B \, #h(2em) d \( a c b A \) = - x c y b A + a c y z A . $
  The splitting cohomology of (7.10) is zero. The May spectral sequence, finite in each of these weights, proves all the claimed $E_2$ vanishings.
  For orientation, the same equations also enumerate the source $\( 5 \, W \)$. Here $H_0 = 1$, $m$ is odd, and $L = \( 5 - m \) \/ 2$. They force $H_2 + n_B + n_C = 2$ and $H_1 + L - n_C = 4$. If $m = 1$, then $H_1 + L lt.eq 1 + 2 < 4$; if $m = 5$, then at least two of $x \, a \, c$ occur, contrary to $H_0 = 1$. Thus $m = 3$, which forces $n_C = 0$ and $H_1 = 3$. The only monomials are $a y b B$ and $c y b A$. We need no assertion that either one survives the May spectral sequence.
  No topological Adams–Novikov differential can hit filtration five: its length would have to be at least $q + 1 > 5$. The outgoing target groups have just been proved zero. Thus every actual class of $E_2^(5 \, W) \( Y \)$ survives and is represented by a class $gamma in pi_(q W - 5) Y$. The vanishings for $delta = 1$ exhaust all filtrations in the stem $q \( W + 1 \) - 6$; strong convergence proves (7.5). ◻
]

=== 7.2 Two sphere classes and an extended-power relation <two-sphere-classes-and-an-extended-power-relation>

#thm([Lemma 7.2.])[
  (The sphere classes).  #emph[There are sphere classes 
$ alpha in pi_(q - 1) S_(\( p \))^0 \, #h(2em) beta in pi_(p q - 2) S_(\( p \))^0 $

 detected respectively by $\[ t_1 \]$ and the divided coproduct $b_(1 \, 0)$. The former generates a cyclic group of order $p$, and 
$ pi_i S_(\( p \))^0 = 0 #h(2em) \( 0 < i < q - 1 \) . $

 Multiplication by $beta$ on the Adams–Novikov spectral sequence of $Y$ induces multiplication by the actual cobar class $A$ used in (7.2).]
] <top:sphere-classes>

#proof[
  The cooperation $t_1$ is primitive. In weight one the normalized sphere cobar is
  $ bb(Z)_(\( p \)) { v_1 } arrow.r^(med p med) bb(Z)_(\( p \)) { t_1 } \, $
  because $eta_R \( v_1 \) - v_1 = p t_1$. Hence its degree-one cohomology is $bb(Z) \/ p$ on $\[ t_1 \]$.
  The integral polynomial
  #[#set math.equation(numbering: n => "(7.11)")
   $ b \( x \, y \) = frac(\( x + y \)^p - x^p - y^p, p) = sum_(i = 1)^(p - 1) binom(p, i) / p x^i y^(p - i) $ <top:beta-cocycle>]
  defines the two-cobar cocycle $b_(1 \, 0)$ by substituting the two primitive copies of $t_1$. Its differential is zero: the two-cocycle identity follows by expanding $\( x + y + z \)^p$, or by dividing the identity $d^2 \( t_1^p \) = 0$ in the torsion-free integral cobar. Its image in the additive specialization is nonzero in cohomology. At weight $p$ the only coordinate available is $t_1$; the only one-cochain of that weight is $t_1^p$, whose differential is zero in characteristic $p$, whereas (7.11) is a nonzero two-cochain. Thus it is not a boundary.
  The first positive topological differential length permitted by sparsity is $q + 1$. From $\( 2 \, p \)$ an outgoing differential has target $\( q j + 3 \, p + j \)$ for $j gt.eq 1$, violating $w gt.eq s$; no incoming differential can reach filtration two. The same argument applies to $\( 1 \, 1 \)$. Therefore these cocycles survive to the stated sphere classes.
  For any positive stem $i$ with a nonzero normalized-cobar term, either $s = 0$ and $i = q w gt.eq q$, or $s gt.eq 1$ and
  $ i = q w - s gt.eq \( q - 1 \) s gt.eq q - 1 . $
  This proves the lower sphere vanishing. In stem $q - 1$ the same inequality permits only $\( s \, w \) = \( 1 \, 1 \)$, so there is no extension ambiguity and $pi_(q - 1) S_(\( p \))^0 = bb(Z) \/ p { alpha }$. Finally, the sphere action and its cobar pairing in Proposition 7 identify the detector of multiplication by $beta$ with $b_(1 \, 0) = A$. ◻
]

We next prove that $alpha beta^p$ has zero image in $pi_(*) Y$. We use the odd-primary reduced powers, including the Cartan formula and $cal(P)^k \( x \) = x^p$ for a space class of degree $2 k$, in #cite(label("SteenrodEpstein1962"), form: "prose") Chapter VI, Section 1, and Chapter VIII, Theorem 2.2. Their compatibility with suspension gives operations on spectra; the instability normalization below is applied to a Thom space before desuspension. Toda proved the corresponding sphere relation #cite(label("Toda1967")) p. 839, Corollary and subsequently treated such relations using cyclic extended powers #cite(label("Toda1968")) Sections 1–3, especially Theorem 3. We give the image relation needed in $Y$ through the following finite-cell construction.

#thm([Lemma 7.3.])[
  (A finite three-cell model).  #emph[Let $U_0$ be a connective $p$-local spectrum with 
$ H_0 \( U_0 \; bb(Z)_(\( p \)) \) = bb(Z)_(\( p \)) \, #h(2em) H_(q - 1) \( U_0 \; bb(Z)_(\( p \)) \) = bb(Z) \/ p \, $

 and with all other positive integral homology through degree $q$ zero. Let $b_0 : S^0 arrow.r U_0$ induce an isomorphism on $H_0$, and suppose the reduced power $cal(P)^1$ of the bottom mod-$p$ cohomology class is nonzero. Then there is a three-cell spectrum 
$ Q = #scale(x: 120%, y: 120%)[\(] S^0 or S^(q - 1) #scale(x: 120%, y: 120%)[\)] union_(\( a alpha \, thin u p \)) e^q $

 and a map $Q arrow.r U_0$ whose restriction to $S^0$ is $b_0$. Here $u in bb(Z)_(\( p \))^times$ and $a in bb(F)_p^times$.]
] <top:three-cell-model>

#proof[
  Let $C$ be the cofiber of $b_0 : S^0 arrow.r U_0$. The assumed integral homology groups and successive applications of connective Hurewicz show that $C$ is $\( q - 2 \)$-connected and
  $ pi_(q - 1) C = H_(q - 1) \( C \; bb(Z)_(\( p \)) \) = bb(Z) \/ p . $
  Choose a generator $S^(q - 1) arrow.r C$. Its obstruction to lifting to $U_0$ lies in $pi_(q - 2) S^0$, which is zero by Lemma 29. A lift, together with $b_0$, gives $S^0 or S^(q - 1) arrow.r U_0$. Its cofiber $D$ is $\( q - 1 \)$-connected. The integral homology exact sequence gives
  $ H_q \( D \; bb(Z)_(\( p \)) \) = ker #scale(x: 120%, y: 120%)[\(] bb(Z)_(\( p \)) arrow.r bb(Z) \/ p #scale(x: 120%, y: 120%)[\)] = p bb(Z)_(\( p \)) . $
  In particular this is a free rank-one module. Use Hurewicz to choose a generator of $pi_q D$ and take its boundary in $pi_(q - 1) \( S^0 or S^(q - 1) \)$. Attaching the corresponding cell gives a map $Q arrow.r U_0$ extending the two lower cells. Its component on $S^(q - 1)$ is multiplication by a unit times $p$, since its homology image is exactly $p bb(Z)_(\( p \))$. Its component on the bottom belongs to $pi_(q - 1) S^0 = bb(Z) \/ p { alpha }$, so it is $a alpha$ for some $a in bb(F)_p$.
  The map $Q arrow.r U_0$ induces isomorphisms on integral homology in degrees zero and $q - 1$. The universal coefficient sequence then gives isomorphisms on mod-$p$ cohomology in degrees zero and $q$; the latter is the class arising from the torsion in degree $q - 1$. The assumed nonzero reduced power therefore pulls back to a nonzero reduced power of the bottom class of $Q$. If $a = 0$, the actual attaching map would give a wedge
  $ Q tilde.eq S^0 or "cofib" #scale(x: 120%, y: 120%)[\(] u p : S^(q - 1) arrow.r S^(q - 1) #scale(x: 120%, y: 120%)[\)] . $
  The degree-zero class in this wedge is pulled back from $S^0$, so its positive reduced powers vanish by naturality. This is a contradiction. Hence $a eq.not 0$. The construction used an integral homology gap and relative Hurewicz in a finite range; no assertion that $U_0$ itself is finite is involved. ◻
]

#thm([Proposition 7.4.])[
  (The extended-power relation).  #emph[The image of $alpha beta^p$ in $pi_(*) Y$ is zero.]
] <top:extended-power-relation>

#proof[
  Write $d = p q - 2 = 2 m$, where
  $ m = p \( p - 1 \) - 1 equiv - 1 med \( mod med p \) . $
  Let $rho_(bb(C))$ be the complex regular representation of $C_p$. The cyclic extended power of the even sphere $S^(2 m)$ is the Thom spectrum of $m rho_(bb(C))$ over $B C_p$:
  $ \( E C_p \)_(+) and_(C_p) \( S^(2 m) \)^(and p) tilde.eq "Th" \( m rho_(bb(C)) \) . $
  Applying this functor to a sphere map representing $beta$, then collapsing $B C_p$ in the extended power of $S^0$, gives a map
  #[#set math.equation(numbering: n => "(7.12)")
   $ Phi : "Th" \( m rho_(bb(C)) \) arrow.r S^0 $ <top:extended-beta-map>]
  whose restriction to a fiber sphere $S^(p d)$ is $beta^p$. Only the symmetric multiplication of the sphere spectrum is used in constructing this map.
  The group $bb(F)_p^times$ acts by permutations of the cyclically labelled smash coordinates and by the corresponding automorphisms of $C_p$. This normalizer action is compatible with (7.12), on whose target it is trivial. Normalize the bottom degree by setting
  $ U = Sigma^(- p d) "Th" \( m rho_(bb(C)) \) \, #h(2em) e_0 = frac(1, p - 1) sum_(a in bb(F)_p^times) a : U arrow.r U . $
  The idempotent $e_0$ splits in spectra. Denote its image by $U_0$, with maps $i_0 : U_0 arrow.r U$, $r_0 : U arrow.r U_0$ satisfying $i_0 r_0 = e_0$ and $r_0 i_0 = 1$. The projected Thom fiber $b_0 : S^0 arrow.r U_0$ induces an isomorphism on $H_0 \( - \; bb(Z)_(\( p \)) \)$: the complex orientation makes every normalizer permutation act as one on the bottom class. Moreover, normalizer invariance of $Phi$ gives a map
  $ Phi_0 : Sigma^(p d) U_0 arrow.r S^0 \, #h(2em) Phi_0 Sigma^(p d) b_0 = beta^p . $
  We describe the homology and the reduced power of this summand. The complex bundle is integrally oriented, so the integral Thom isomorphism identifies $H_(*) \( U \; bb(Z)_(\( p \)) \)$ with $H_(*) \( B C_p \; bb(Z)_(\( p \)) \)$. The periodic cyclic-group resolution, with maps $g - 1$ and $1 + g + dots.h.c + g^(p - 1)$, gives
  $ H_0 \( B C_p \; bb(Z)_(\( p \)) \) = bb(Z)_(\( p \)) \, quad H_(2 j - 1) \( B C_p \; bb(Z)_(\( p \)) \) = bb(Z) \/ p med \( j gt.eq 1 \) \, quad H_(2 j) \( B C_p \; bb(Z)_(\( p \)) \) = 0 med \( j gt.eq 1 \) . $
  These groups are finitely generated degreewise, as are their direct summands for $U_0$. The same resolution, or the circle bundle of Chern class $p$ over infinite complex projective space, gives
  $ H^(*) \( B C_p \; bb(F)_p \) = Lambda \( s \) ⊗ bb(F)_p \[ t \] \, #h(2em) \| s \| = 1 \, quad \| t \| = 2 \, quad t = "Bockstein" \( s \) . $
  An automorphism $a in bb(F)_p^times$ multiplies both $s$ and $t$ by $a$. Equivalently it acts by $a^j$ on integral homology in degree $2 j - 1$. Averaging consequently retains, through degree $q$, exactly the mod-$p$ classes in degrees $0 \, q - 1 \, q$ and the integral groups
  #[#set math.equation(numbering: n => "(7.13)")
   $ H_0 \( U_0 \; bb(Z)_(\( p \)) \) = bb(Z)_(\( p \)) \, quad H_(q - 1) \( U_0 \; bb(Z)_(\( p \)) \) = bb(Z) \/ p \, quad H_j \( U_0 \; bb(Z)_(\( p \)) \) = 0 med \( 0 < j lt.eq q \, med j eq.not q - 1 \) . $ <top:U0-homology>]
  Let $u$ be the normalized Thom class. We claim
  #[#set math.equation(numbering: n => "(7.14)")
   $ cal(P)^1 u = - m thin t^(p - 1) u eq.not 0 . $ <top:Thom-P1>]
  For a universal complex line bundle with first Chern class $l$ and Thom class $u_l$, write $cal(P)^1 u_l = c thin l^(p - 1) u_l$ by the Thom isomorphism. Pullback along the zero section and the identity $cal(P)^1 \( l \) = l^p$ imply $c = 1$ in the polynomial cohomology of infinite complex projective space. Naturality gives the formula for every line bundle. The Cartan formula for a direct sum of lines therefore gives the sum of their $\( p - 1 \)$st Chern powers as the multiplier of $cal(P)^1$ on its Thom class. The regular representation splits into the characters with first Chern classes $i t$, $i in bb(F)_p$. Thus the multiplier here is
  $ m sum_(i in bb(F)_p) \( i t \)^(p - 1) = - m thin t^(p - 1) . $
  Both this class and $u$ are normalizer-invariant. The reduced power commutes with the idempotent, so the same nonzero formula holds in $U_0$.
  Apply Lemma 30 to (7.13) and (7.14). It supplies a three-cell spectrum
  $ Q = \( S^0 or S^(q - 1) \) union_(\( a alpha \, thin u p \)) e^q arrow.r U_0 $
  with $a$ nonzero modulo $p$ and $u$ a $p$-local unit.
  Restrict $Phi_0$ to $Sigma^(p d) Q$. Its bottom value is $beta^p$; let its value on the other lower cell be $zeta$. The top cell gives the relation
  $ a alpha beta^p + u p zeta = 0 quad upright("in ") pi_(p d + q - 1) S^0 . $
  The action of $p$ on $Y$ is null by Corollary 14. Apply the unit to this relation and use $a eq.not 0$ modulo $p$ to obtain $alpha beta^p = 0$ in $pi_(*) Y$. ◻
]

=== 7.3 The symmetric comodule and the null map <the-symmetric-comodule-and-the-null-map>

We now prove that the map $f : Sigma^d T arrow.r Y$ defined above is null. Finite duality turns it into the bottom image of $beta$ in $pi_d \( D T and Y \)$. The next lemma identifies the coefficient comodule in which we will make this image a cobar boundary.

#thm([Lemma 7.5.])[
  (The symmetric coefficient comodule).  #emph[For $T = "Sym"^(p - 1) \( Sigma^(- q) C \( alpha \) \)$, the module $B P_(*) \( D T and Y \)$ is free over $R \/ I_4$ with basis $1 \, r \, dots.h \, r^(p - 1)$, where $r^k$ has weight $k$. Its coaction is 
#[#set math.equation(numbering: n => "(7.15)")
 $ r^k mapsto sum_(j = 0)^k binom(k, j) r^j t_1^(k - j) . $ <top:translated-comodule>]

 The induced homology map of $D epsilon_T and 1_Y : Y arrow.r D T and Y$ is the inclusion of constants. The powers of $r$ denote basis elements; no multiplication on $D T$ is asserted.]
] <top:symmetric-comodule>

#proof[
  #emph[The two-cell coaction.] We first compute the coefficient comodule needed for duality. The dual $D J$ is the cofiber of $alpha' : S^(q - 1) arrow.r S^0$, where $alpha' = plus.minus alpha$ after fixing cell orientations, and its bottom inclusion is $D epsilon$. Put $cal(F) = "fib" \( S^0 arrow.r^(eta_(B P)) B P \)$. A chosen $B P$-nullhomotopy of $alpha'$ gives a lift $tilde(alpha) : S^(q - 1) arrow.r cal(F)$ and a map $H : D J arrow.r B P$ extending the unit, in the following map of cofiber sequences:
  $ S^(q - 1) & arrow.r^(alpha') & S^0 & arrow.r & D J & arrow.r & S^q\
arrow.b thin tilde(alpha) &  & bar.v.double &  & arrow.b thin H &  & arrow.b thin Sigma tilde(alpha)\
cal(F) & arrow.r & S^0 & arrow.r^(eta_(B P)) & B P & arrow.r & Sigma cal(F) . $
  The $B P$-module $B P and D J$ splits because $B P_(q - 1) = 0$. Let $e_0$ be its bottom generator and choose an upper generator $z in B P_q D J$ whose top quotient is $1$ and for which $rho_(*) z = 0$, where $rho = mu_(B P) \( B P and H \) : B P and D J arrow.r B P$ retracts the bottom inclusion. With $epsilon.alt : Gamma arrow.r R$ the counit, the element $g = \( B P and H \)_(*) z$ satisfies
  $ epsilon.alt \( g \) = 0 \, #h(2em) Gamma_q = eta_L \( R_q \) xor bb(Z)_(\( p \)) { t_1 } \, #h(2em) g = c t_1 . $
  Here $eta_L$ is induced by the bottom map $B P and eta_(B P) : B P arrow.r B P and B P$. After smashing the cofiber diagram with $B P$, its connecting map $partial : Gamma_q arrow.r pi_(q - 1) \( B P and cal(F) \)$ has kernel $eta_L \( R_q \)$ and gives
  $ partial g = \( B P and tilde(alpha) \)_(*) \( 1 \) . $
  Thus $g$ represents the first Adams–Novikov detector of $alpha'$. It is also the actual off-diagonal coaction: writing $psi \( z \) = 1 ⊗ z + omega ⊗ e_0$, naturality under $H$ gives $Delta g = 1 ⊗ g + omega ⊗ 1$. Apply $"id" ⊗ epsilon.alt$ and use $epsilon.alt \( g \) = 0$ to obtain $omega = g$. By Lemma 29 this detector is $plus.minus \[ t_1 \]$, so $c equiv.not 0 med \( mod med p \)$.
  For completeness, fix the left-comodule convention $psi \( a m \) = eta_L \( a \) psi \( m \)$ with tensor product using $eta_R$, so $eta_R \( v_1 \) - eta_L \( v_1 \) = p t_1$. Replacing $z$ by $z + a v_1 e_0$ changes its off-diagonal term to $g + a \( eta_L - eta_R \) \( v_1 \) = g - p a thin t_1$. Changing $H$ by the composite $D J arrow.r S^q arrow.r^(a v_1) B P$ instead changes $g$ by $eta_R \( a v_1 \)$; renormalizing the upper generator to $z - a v_1 e_0$ subtracts $eta_L \( a v_1 \)$, giving $g + p a thin t_1$. Opposite conventions reverse these signs, and dual cell orientations change the detector by a sign; none changes its nonzero residue modulo $p$. The underlying $B P$-module splitting therefore need not split the comodule. Replacing $z$ by $c^(- 1) z$ now makes the off-diagonal term exactly $t_1$. Its top quotient is then $c^(- 1)$ rather than $1$; we no longer need the earlier top normalization. This change fixes $e_0$ and the bottom inclusion $D epsilon$, which are the data used in the following symmetric-power calculation.
  #emph[The symmetric coefficient module.] Duality changes each permutation into its inverse, and hence preserves the average. Consequently
  $ D T tilde.eq "Sym"^n \( D J \) . $
  Under this identification $D epsilon_T$ is the pure bottom tensor $e_0^(⊗ n)$. All the cell degrees of $D J$ are even. If $z_S$ is the tensor with upper generator in positions $S$ and bottom generator elsewhere, define its normalized symmetric basis by
  #[#set math.equation(numbering: n => "(7.16)")
   $ r_k = binom(n, k)^(- 1) sum_(\| S \| = k) z_S \, #h(2em) 0 lt.eq k lt.eq n . $ <top:symmetric-basis>]
  Every denominator is a $p$-local unit. Expanding the translation of each tensor gives the coefficient
  $ frac(binom(n - j, k - j) binom(n, j), binom(n, k)) = binom(k, j) $
  on $r_j t_1^(k - j)$ in the coaction of $r_k$. Thus we can denote this basis by $1 \, r \, dots.h \, r^(p - 1)$, with coaction (7.15). Each $r^k$ has weight $k$ because it is represented by tensors with $k$ upper generators of degree $q$.
  The module $B P_(*) D T$ is free. Smashing its free $B P$-module splitting with $Y$ gives
  $ B P_(*) \( D T and Y \) = B P_(*) D T ⊗_R \( R \/ I_4 \) \, $
  with the same translated basis and with $D epsilon_T$ identified with constants. This argument uses a free factor, so it requires no flatness of $R \/ I_4$. ◻
]

#thm([Proposition 7.6.])[
  (The symmetric null map).  #emph[For $d = \| beta \| = p q - 2$, the actual stable map 
#[#set math.equation(numbering: n => "(7.17)")
 $ f : Sigma^d T arrow.r^(med Sigma^d epsilon_T med) S^d arrow.r^(med beta med) S^0 arrow.r^(med eta med) Y $ <top:null-composite>]

 is nullhomotopic.]
] <top:symmetric-null-map>

#proof[
  Finite duality identifies
  $ \[ Sigma^d T \, Y \] tilde.equiv \[ S^d \, D T and Y \] $
  and carries $f$ to $\( D epsilon_T and 1_Y \) \( eta beta \)$. By Lemma 32, its induced $E_2$ class is represented by the constant-valued beta cocycle. We first show that this cocycle is a boundary in the translated coefficient module. Consider the integral polynomial
  #[#set math.equation(numbering: n => "(7.18)")
   $ F \( r \, x \) = frac(\( r + x \)^p - r^p - x^p, p) = sum_(i = 1)^(p - 1) binom(p, i) / p r^(p - i) x^i . $ <top:carry-polynomial>]
  The displayed sum defines it before reduction modulo $p$; it uses only the allowed coefficient powers $r \, dots.h \, r^(p - 1)$. The exact integral identity
  #[#set math.equation(numbering: n => "(7.19)")
   $ F \( r \, x \) + F \( r + x \, y \) - F \( r \, x + y \) = frac(\( x + y \)^p - x^p - y^p, p) $ <top:carry-boundary>]
  follows by cancellation of the four $p$th powers. After reduction, the coefficient coaction (7.15) and primitivity of $t_1$ make the left side the cobar differential of $F \( r \, t_1 \)$, with the common overall sign determined by the cobar convention. The right side is the constant cocycle (7.11). Thus the bottom image of $beta$ has zero image on $E_2$.
  There is no possible higher-filtration homotopy value hidden by this boundary. The spectrum $D T and Y$ is connective and its coefficient weights are nonnegative. In stem $p q - 2$, its $q$-sparse terms have
  $ \( s \, w \) = \( 2 + q j \, p + j \) . $
  For $j gt.eq 1$ the inequality $w gt.eq s$ would give $p - 2 gt.eq \( q - 1 \) j$, which is impossible. Naturality places the image of $beta$ in filtration at least two, and the boundary just found raises it to filtration at least three. All later associated-graded groups are zero, so convergence with finite filtration makes the actual image zero.
  The bottom beta image is therefore zero, and finite duality makes $f$ itself nullhomotopic. ◻
]

=== 7.4 The averaged lift and the page on which it vanishes <the-averaged-lift-and-the-page-on-which-it-vanishes>

#thm([Proposition 7.7.])[
  (Averaging and annihilation).  #emph[If $gamma in pi_(q W - 5) Y$ represents a class of $E_2^(5 \, W) \( Y \)$, then 
#[#set math.equation(numbering: n => "(7.20)")
 $ beta^K gamma = 0 \, #h(2em) K = p \( p - 2 \) + 1 . $ <top:beta-annihilation>]

 Only the binary two-sided unit identities for $mu$ are needed.]
] <top:annihilation>

#proof[
  Lemma 28 gives $alpha gamma = 0$ in precisely the stem $q \( W + 1 \) - 6$. Proposition 31 gives $alpha beta^p = 0$ after applying the unit to $Y$. By (7.4), choose lifts
  $ tilde(gamma) : S^(q W - 5) arrow.r J and Y \, #h(2em) tilde(b) : S^(p d) arrow.r J and Y $
  of $gamma$ and $eta beta^p$, respectively. Fix any parenthesization of the $n$-fold iteration of $mu$. Smash one copy of $tilde(gamma)$ with $p - 2$ copies of $tilde(b)$, collect the $J$ factors, and apply that chosen iteration to the $Y$ factors. This gives
  $ L : S^(q W - 5 + \( p - 2 \) p d) arrow.r J^(and n) and Y . $
  Its top projection is $beta^(p \( p - 2 \)) gamma$. To verify this without an associativity assumption, for any sphere scalar $a$ use the two unit homotopies to identify
  $ mu \( eta a \, x \) = a x \, #h(2em) mu \( x \, eta a \) = \( - 1 \)^(\| a \| \| x \|) a x . $
  The scalar $beta^p$ is even. In the chosen binary tree, every subtree without $gamma$ is a scalar times the unit, and the unique subtree containing $gamma$ is the product of its scalars times $gamma$. This proves the asserted top value by induction on the tree.
  Now project to the symmetric retract after those $Y$ factors have already been multiplied:
  $ L_T = \( "pr" and 1_Y \) L : S^(q W - 5 + \( p - 2 \) p d) arrow.r T and Y . $
  For every permutation $sigma$ of the $J$ factors, naturality of the symmetry and the zero-dimensional top sphere give an equality of stable maps
  $ epsilon^(and n) sigma = epsilon^(and n) . $
  Consequently
  #[#set math.equation(numbering: n => "(7.21)")
   $ \( epsilon_T and 1_Y \) L_T = \( epsilon^(and n) e and 1_Y \) L = \( epsilon^(and n) and 1_Y \) L = beta^(p \( p - 2 \)) gamma . $ <top:averaged-top-map>]
  No permutation of the multiplied $Y$ factors occurs in this identity.
  The actual null map $f$ of Proposition 33 now gives the following homotopy-commutative diagram:
  #[#set math.equation(numbering: n => "(7.22)")
   $ Sigma^d \( T and Y \) & arrow.r^(med f and 1_Y med) & Y and Y\
Sigma^d \( epsilon_T and 1_Y \) thin arrow.b &  & arrow.b thin mu\
Sigma^d Y & arrow.r^(med beta and 1_Y med) & Y . $ <top:null-map-diagram>]
  Commutativity is the left unit identity for $mu$ and the definition of $f$. Its top arrow is null, so composing the diagram with $Sigma^d L_T$ and using (7.21) proves $beta^(p \( p - 2 \) + 1) gamma = 0$. ◻
]

#thm([Proposition 7.8.])[
  (Disappearance before the last differential).  #emph[Every class in $E_2^(q p + 1 \, u_4 + p) \( Y \)$ is zero on the Adams–Novikov page $E_(q p + 1)$.]
] <top:early-disappearance>

#proof[
  Let $theta in E_2^(5 \, W) \( Y \)$. By Lemma 28, it is a permanent cycle represented by a homotopy class $gamma$. The sphere class $beta$ is also permanent. The pagewise product $A^K theta$ therefore supports no nonzero outgoing differential; if either factor has zero image on a page, the product is already zero. By Proposition 34 its filtered homotopy product is zero. Product compatibility and finite convergence then imply that $A^K theta$ is zero at $E_oo$.
  If it is nonzero at $E_2$, it must consequently be hit by an incoming differential. Its cohomological filtration is
  $ S = 5 + 2 K = 2 p^2 - 4 p + 7 . $
  An incoming differential of length $r$ has source filtration $S - r gt.eq 0$, so $r lt.eq S$. This bounds the page of disappearance, rather than merely its eventual abutment. The exact comparisons are
  #[#set math.equation(numbering: n => "(7.23)")
   $ q p + 1 - S = 2 p - 6 > 0 \, #h(2em) N - K = p - 3 > 0 . $ <top:strict-page-bound>]
  Numerically,
  $ K = 1 \, 016 \, 064 \, quad N = 1 \, 017 \, 070 \, quad S = 2 \, 032 \, 133 < q p + 1 = 2 \, 034 \, 145 . $
  Thus $A^K theta$ is zero before the page of the prospective $d_(q p + 1) \( v_4 \)$. Multiplication by the further power $A^(N - K)$ is defined on every page by the sphere permanent cycle $beta$; it shows that $A^N theta$ is zero there as well. The surjection (7.2) accounts for every $E_2$ class of the target, proving the assertion. ◻
]

=== 7.5 The realizing cofiber <top:main-construction>

All possible targets of a differential from $v_4$ have now been eliminated on the required pages. We finish by producing the ordinary finite spectrum and identifying its homology as a comodule.

#proof[
  The only possible positive differentials from $v_4$ have target $\( s \, w \) = \( q k + 1 \, u_4 + k \)$. Proposition 18 rules out $k = 1$. Lemma 15 and Table 3 leave, for $k gt.eq 2$, only $k = 2 \, p - 1 \, p$. Corollary 27 eliminates the first two target groups already at $E_2$, and Proposition 35 makes the last target zero before its possible differential. No differential can hit filtration zero. Hence $v_4 in E_2^(0 \, u_4) \( Y \)$ is permanent.
  The edge homomorphism of the convergent Adams–Novikov spectral sequence supplies a map $a : S^(q u_4) arrow.r Y$ whose $B P$-Hurewicz image is exactly $v_4$. Extend it by the existing binary multiplication to
  $ tilde(v)_4 : Sigma^(q u_4) Y arrow.r^(med a and 1_Y med) Y and Y arrow.r^(med mu med) Y \, $
  and take its cofiber $X$. The right unit identity shows that the bottom generator is sent to $v_4$. Since $B P_(*) Y = R \/ I_4$ is cyclic as an $R$-module, this determines the entire induced map as multiplication by $v_4$. That element is a nonzerodivisor in $R \/ I_4 = bb(F)_p \[ v_4 \, v_5 \, dots.h \]$. The homology exact sequence of the cofiber therefore gives the short exact sequence
  $ 0 arrow.r Sigma^(q u_4) R \/ I_4 arrow.r^(med v_4 med) R \/ I_4 arrow.r B P_(*) X arrow.r 0 . $
  The composite bottom map $S^0 arrow.r Y arrow.r X$ induces the quotient map $R arrow.r R \/ \( I_4 \, v_4 \)$. It is a comodule map and is surjective, so it identifies the induced coaction with the canonical quotient coaction, and identifies its generator in degree zero.
  Finally, $X$ is the cofiber of a map between finite $p$-local spectra. It is finite $p$-local in the sense defined in the introduction; equivalently, the finite cell construction can be realized by a finite spectrum before localization by clearing prime-to-$p$ denominators in its attaching maps, as in Lemma 12. More explicitly, the mapping cone adds to the cells of $Y$ their translates by $q u_4 + 1$. Together with Equation (4.6), this gives a finite $p$-local CW model for $X$ with one cell in each dimension
  $ sum_(i in S) \( q u_i + 1 \) = sum_(i in S) \( 2 p^i - 1 \) \, #h(2em) S subset.eq { 0 \, 1 \, 2 \, 3 \, 4 } . $
  In particular, this model has $32$ cells. ◻
]

== 8 The ordinary resolution and its filtered pairing <app:resolution>

We use a symmetric monoidal stable model of spectra with the usual pushout-product axiom and tensors over based spaces. Such a model is provided by topological symmetric spectra: #cite(label("HoveyShipleySmith1998v2"), form: "prose") Section 6.2, Theorems 6.3.8 and 6.4.1, and Corollary 6.4.2; its comparison with ordinary spectra follows from Theorems 6.3.8 and 4.3.2 there, in the cited preprint version. All smash products are derived; when point-set maps are used, their inputs are cofibrant. Rectify the coherent associative structure on $B P$ as an $S$-algebra by #cite(label("ElmendorfKrizMandellMay1997"), form: "prose") Part II, Corollary 3.6 and the associative convention comparison in Section 4. The equivalence for associative algebras in #cite(label("Schwede2001"), form: "prose") Main Theorem and Theorem 5.1(ii) then places it in this same category of topological symmetric spectra. Choose a cofibrant associative symmetric ring representative using #cite(label("MandellMaySchwedeShipley2001"), form: "prose") Theorem 12.1(iv)–(v); its underlying spectrum is then stably cofibrant. Smash with such a spectrum preserves stable equivalences by Proposition 12.3 there, so the following point-set smash powers compute derived smash powers. The comparison uses the positive stable model structure, whose weak equivalences agree with the ordinary stable ones; we use the ordinary stable structure here. With this strictly unital associative model, write

$ T^n \( Z \) = B P^(and \( n + 1 \)) and Z . $

The cofaces insert units and the codegeneracies multiply adjacent $B P$ factors. Associativity and the unit identities give a cosimplicial spectrum. Write $K_n \( Z \) = "Tot"_n T^bullet \( Z \)$ for its derived ordinary partial totalization, set $K_(- 1) \( Z \) = *$, and put $K \( Z \) = "Tot" T^bullet \( Z \)$. Ordinary totalization here uses all ordinal maps, including codegeneracies.

=== 8.1 Convergence and the edge <app:convergence>

#proof[
  We first identify the ordinary totalization tower exactly. Let $cal(P)_0 \( \[ n \] \)$ be the poset of nonempty subsets of ${ 0 \, dots.h \, n }$. The functor
  $ u_n : cal(P)_0 \( \[ n \] \) arrow.r Delta_(lt.eq n) \, #h(2em) S mapsto \[ \| S \| - 1 \] \, $
  sends an inclusion to the corresponding order-preserving injection. It is homotopy-initial. To prove this, for $m lt.eq n$ identify $\( u_n arrow.b \[ m \] \)$ with the nonempty face poset of the simplicial complex $L_(n \, m)$ whose vertices are $\( i \, j \)$, $0 lt.eq i lt.eq n$, $0 lt.eq j lt.eq m$, and whose simplices have strictly increasing first coordinates and weakly increasing second coordinates. Its nerve is the barycentric subdivision of $L_(n \, m)$.
  The complex $L_(n \, m)$ is contractible for $n gt.eq m$, by induction on $n$. The case $n = m = 0$ is a point. For the inductive step start with the cone with vertex $\( n \, m \)$ on the entire subcomplex $L_(n - 1 \, m)$. Adjoin the cones with vertices $\( n \, j \)$, $0 lt.eq j < m$, on their bases $L_(n - 1 \, j)$. Two distinct vertices with first coordinate $n$ cannot belong to a simplex. Each new cone therefore intersects the preceding union in exactly its base. That base is contractible by induction, since $n - 1 gt.eq j$. Attachment along this simplicial subcomplex is a homotopy pushout and preserves contractibility. This proves the claim.
  Homotopy-initiality, applied to the cosimplicial unit resolution, now gives, naturally in $n$ and $Z$,
  #[#set math.equation(numbering: n => "(8.1)")
   $ K_n \( Z \) tilde.eq "holim"_(diameter eq.not S subset.eq { 0 \, dots.h \, n }) B P^(and \| S \|) and Z . $ <fw:finite-cube-comparison>]
  This is the standard cubical description of the partial Amitsur totalizations; compare #cite(label("MathewNaumannNoel2017"), form: "prose") Propositions 2.11 and 2.14. Indeed derived partial totalization is the homotopy limit over $Delta_(lt.eq n)$: the restricted standard simplex is a Reedy-cofibrant resolution of the constant point diagram. Adjoining the empty vertex $Z$ on the right of Equation (8.1) gives the $\( n + 1 \)$-fold cube formed by smashing copies of the unit $S_(\( p \)) arrow.r B P$. If $cal(F)$ is its fiber, iterated fibers and exactness of smash identify its total fiber with $cal(F)^(and \( n + 1 \)) and Z$. Thus
  #[#set math.equation(numbering: n => "(8.2)")
   $ "fib" \( Z arrow.r K_n \( Z \) \) tilde.eq cal(F)^(and \( n + 1 \)) and Z . $ <fw:tot-fiber-index>]
  The comparisons commute with restriction from $n + 1$ to $n$: on the fibers this is the map induced by the last factor $cal(F) arrow.r S_(\( p \))$. There is no suspension in Equation (8.2).
  The unit induces an isomorphism on $pi_0$, and $pi_1 B P = 0$, so $cal(F)$ has no homotopy in degrees at most zero. If $Z$ is $c$-connective, $cal(F)^(and s) and Z$ is at least $\( c + s \)$-connective. Equation (8.2) therefore identifies the coaugmentation $Z arrow.r K \( Z \)$ as an equivalence, and identifies the relative totalization tower as
  #[#set math.equation(numbering: n => "(8.3)")
   $ G^s \( Z \) := "fib" \( K \( Z \) arrow.r K_(s - 1) \( Z \) \) tilde.eq cal(F)^(and s) and Z quad \( s gt.eq 0 \) . $ <fw:relative-tower>]
  Its homotopy groups vanish in each fixed stem for sufficiently large $s$. The exact couple consequently has the asserted abutment, no inverse-limit ambiguity, and finite filtration in each stem.
  For completeness, the successive layer is
  #[#set math.equation(numbering: n => "(8.4)")
   $ "cofib" \( G^(s + 1) \( Z \) arrow.r G^s \( Z \) \) tilde.eq B P and cal(F)^(and s) and Z tilde.eq Sigma^(- s) B P and overline(B P)^(and s) and Z \, $ <fw:tot-layer-index>]
  where $overline(B P) = "cofib" \( S_(\( p \)) arrow.r B P \)$. This is also $"fib" \( K_s \( Z \) arrow.r K_(s - 1) \( Z \) \)$, with the usual normalization and the displayed $s$ desuspensions.
  The iterated extended terms compute the cobar complex. Indeed $B P and B P$, as a $B P$-module, is a wedge of suspended free $B P$-modules with basis the polynomial monomials in the $t_i$. Iteration identifies their homotopy with the iterated tensors of $Gamma$ over $R$. There are no derived tensor corrections, whether or not $B P_(*) Z$ is flat over $R$. Cofaces give the cobar differential; the codegeneracy splittings give its normalized form. The exact-couple grading gives the displayed differential shift. Finally the first map is $Z arrow.r B P and Z$. Its image is exactly the permanent filtration-zero part by the finite-filtration convergence just proved. ◻
]

=== 8.2 The filtered binary pairing <app:pairing>

#proof[
  We construct maps
  $ G^s \( Z_1 \) and G^t \( Z_2 \) arrow.r G^(s + t) \( Z_3 \) $
  which induce the stated cobar pairing and recover the actual map $f$.
  #emph[The box pairing.] We use Batanin’s cosimplicial box product in the form of #cite(label("McClureSmith2004"), form: "prose") Definition 2.1, Proposition 2.3, and Remark 2.4; they attribute its Kan-extension description to Cordier and Porter. We construct the pairing before any fibrant replacement and then transport the entire pairing. For cosimplicial spectra define $A square.stroked.tiny B$ as the left Kan extension of $\( a \, b \) mapsto A^a and B^b$ along ordinal concatenation
  $ Delta times Delta arrow.r Delta \, #h(2em) \( \[ a \] \, \[ b \] \) mapsto \[ a + b + 1 \] . $
  Equivalently, in degree $n$ it is the zigzag pushout of the terms $A^a and B^b$ with $a + b = n$, with neighboring terms identified by the maps
  $ A^a and B^b arrow.r^(d^(a + 1) and 1) A^(a + 1) and B^b \, #h(2em) A^a and B^b arrow.r^(1 and d^0) A^a and B^(b + 1) \, #h(2em) a + b = n - 1 . $
  The same definition applies to cosimplicial based spaces. For the original unit resolutions, concatenating the two $B P$ blocks and applying $f$ once gives maps
  $ T^a \( Z_1 \) and T^b \( Z_2 \) arrow.r T^(a + b + 1) \( Z_3 \) . $
  They are natural in both ordinals: cofaces and codegeneracies within a block insert a unit or multiply adjacent factors within that block. Kan-extension adjunction therefore gives an actual cosimplicial map
  #[#set math.equation(numbering: n => "(8.5)")
   $ m : T \( Z_1 \) square.stroked.tiny T \( Z_2 \) arrow.r T \( Z_3 \) . $ <fw:original-box-pairing>]
  On the degree-$n$ summand $a + b = n$ in the pushout description, this map multiplies the last factor of the first $B P$ block with the first factor of the second block. This is the single overlapping slot. The two descriptions agree by applying the codegeneracy that identifies the two junction vertices of $\[ a + b + 1 \]$.
  #emph[Deriving the pairing.] We record the model-category check that permits us to derive this construction. The box product is a Quillen bifunctor for the Reedy model structures. Let $h_a \( \[ n \] \) = Delta \( \[ a \] \, \[ n \] \)_(+)$, and let $partial h_a$ be the subdiagram of noninjective maps. These are the representables and boundaries defining the generating Reedy cells. Indeed, the boundary of the covariant representable consists of maps factoring through a nonidentity inverse map out of $\[ a \]$, hence of noninjective maps by the unique surjection–injection factorization in $Delta$. This representable boundary is distinct from the latching subobject in target degree $n$, which consists of maps factoring through a proper injection into $\[ n \]$. Kan extension gives $h_a square.stroked.tiny h_b = h_(a + b + 1)$. In the relative box boundary
  $ frac(h_(a + b + 1), "im" \( partial h_a square.stroked.tiny h_b \) union "im" \( h_a square.stroked.tiny partial h_b \)) \, $
  the remaining maps are exactly the monotone maps injective on each of the two blocks. Such a map is either globally injective or identifies only the two junction vertices. A map that is not surjective onto its target lies in that target degree’s latching subobject. The only remaining surjections are the junction identification onto $\[ a + b \]$ and the identity of $\[ a + b + 1 \]$. Thus the junction-identifying and globally injective non-latching cells occur in degrees $a + b$ and $a + b + 1$, respectively. Attach the junction cell first; every further collapse of it is already in the boundary, since it collapses two vertices within one block. Attach the globally injective cell second: its junction codegeneracy lands in the first cell, and its other codegeneracies land in the boundary. This gives a two-cell Reedy filtration of the relative box boundary. For two generating Reedy cofibrations, each of these attachments is tensored with the ordinary spectral pushout-product of their underlying generating cofibrations. The spectral pushout-product axiom therefore makes both attachments cofibrations, and makes them trivial cofibrations if either input is trivial. This proves the Reedy pushout-product axiom, including the acyclic case, for generating cofibrations. Closure under pushouts, composition, and retracts proves the assertion for all cofibrations.
  Choose Reedy-cofibrant replacements $A_i arrow.r T \( Z_i \)$, $i = 1 \, 2$, that are trivial fibrations, and trivial cofibrations $A_i arrow.r R_i$ with $R_i$ Reedy fibrant. For the target choose a Reedy fibrant replacement $T \( Z_3 \) arrow.r R_3$ directly. Equation (8.5) gives $A_1 square.stroked.tiny A_2 arrow.r R_3$. By the preceding Quillen check, $A_1 square.stroked.tiny A_2 arrow.r R_1 square.stroked.tiny R_2$ is a trivial Reedy cofibration. The lifting axiom extends the map to
  #[#set math.equation(numbering: n => "(8.6)")
   $ m_R : R_1 square.stroked.tiny R_2 arrow.r R_3 . $ <fw:derived-box-pairing>]
  The space of such extensions is contractible up to the usual relative homotopy. This transports the original pairing; it places no condition on the literal $B P$ slots of the fibrant replacements. All resulting tower and spectral-sequence pairings are transported along the equivalences with the original diagrams. In particular, when some $Z_i$ coincide, their source and target replacements need not be identical.
  #emph[The filtered diagonal.] We use the simplex subdivision map given in #cite(label("McClureSmith2004"), form: "prose") Lemma 3.6, credited to Grayson in their Remark 3.7. We record its formula to verify the relative filtration. For $t = \( t_0 \, dots.h \, t_n \) in Delta^n$, put
  $ I_i = [sum_(j < i) t_j \, sum_(j lt.eq i) t_j] \, #h(2em) x_i = 2 thin "length" \( I_i ∩ \[ 0 \, 1 \/ 2 \] \) \, #h(2em) y_i = 2 t_i - x_i . $
  For a cut index $k$, $x$ is supported in $0 \, dots.h \, k$ and $y$ in $k \, dots.h \, n$. The cut region is a copy of $Delta^k times Delta^(n - k)$, with inverse $t = \( x + y \) \/ 2$. Its boundary seams identify the last face of the first factor with the first face of the second factor, precisely as in the box pushout. Thus the cut defines
  $ delta : Delta_(+)^bullet arrow.r Delta_(+)^bullet square.stroked.tiny Delta_(+)^bullet . $
  It is natural under all monotone maps: they aggregate consecutive intervals, and aggregation commutes with the cut. In particular this is a map of ordinary cosimplicial objects, including codegeneracies.
  Define the relative simplex object
  $ P_s^bullet = Delta_(+)^bullet \/ "sk"_(s - 1) Delta_(+)^bullet #h(2em) \( s gt.eq 0 \) \, $
  where the skeleton for $s = 0$ is the basepoint. The simplex, its skeleta, and these quotients are Reedy cofibrant: their latching maps are the corresponding boundary inclusions or identities. Consequently
  #[#set math.equation(numbering: n => "(8.7)")
   $ G^s \( Z_i \) = "Map"_Delta \( P_s \, R_i \) $ <fw:relative-end-model>]
  is a derived relative end and the actual fiber of the fibration $"Tot" R_i arrow.r "Tot"_(s - 1) R_i$. The degree-$n$ box summands have dimensions $k$ and $n - k$. If $n < s + t$, at least one is below its respective skeleton cutoff. Naturality applies the same observation to every face of a larger simplex, including faces with missing ambient vertices. Hence the cut descends to maps
  #[#set math.equation(numbering: n => "(8.8)")
   $ delta_(s \, t) : P_(s + t) arrow.r P_s square.stroked.tiny P_t . $ <fw:relative-cut>]
  Enriched evaluation, followed by $m_R$ and precomposition with $delta_(s \, t)$, gives the actual relative pairing
  $ "Map"_Delta \( P_s \, R_1 \) and "Map"_Delta \( P_t \, R_2 \) & arrow.r "Map"_Delta \( P_s square.stroked.tiny P_t \, R_1 square.stroked.tiny R_2 \)\
 & arrow.r "Map"_Delta \( P_(s + t) \, R_3 \) . $
  It commutes with the tower inclusions in both inputs. By Equation (8.3), these are the exact relative fibers of the unit-resolution filtration, with filtration indices $s \, t \, s + t$.
  #emph[The cobar and homotopy pairings.] Put $L_s = "cofib" \( G^(s + 1) arrow.r G^s \)$. The relative pairing induces $L_s \( Z_1 \) and L_t \( Z_2 \) arrow.r L_(s + t) \( Z_3 \)$: raising either input filtration by one raises the output filtration by one. The boundary formula for the product of relative cells is $partial \( a dot.op b \) = partial a dot.op b + \( - 1 \)^(\| a \|) a dot.op partial b$. It gives a pairing of the exact couples and the Leibniz rule on every derived page. On the layer of dimension $s + t$, the only contributing cut cell has front and back dimensions $s \, t$. The inverse $t = \( x + y \) \/ 2$ gives its usual oriented front-face/back-face cup map, with coefficient one. The normalized cobar identification therefore gives exactly the asserted $E_2$ cup pairing.
  We finally verify the homotopy target without assuming that a replacement preserves units. For cofibrant $Z_i$, the diagram $Delta_(+)^bullet and Z_i$ is Reedy cofibrant and maps levelwise equivalently to the constant diagram $Z_i$. Its original all-unit map to $T \( Z_i \)$ lifts to a map $alpha_i : Delta_(+)^bullet and Z_i arrow.r A_i$ along the trivial fibration $A_i arrow.r T \( Z_i \)$. The composite of $alpha_i$ with $A_i arrow.r R_i$ represents the coaugmentation. The box product of the $alpha_i$, precomposed with $delta$, lands in $A_1 square.stroked.tiny A_2$. Since $m_R$ extends the original map on that object, the composite is exactly the target coaugmentation composed with $f$, transported through $T \( Z_3 \) arrow.r R_3$. On totalizations the pairing therefore satisfies
  $ m_(upright("Tot")) compose \( e_1 and e_2 \) = e_3 compose f . $
  The coaugmentations $e_i : Z_i arrow.r K \( Z_i \)$ are the equivalences proved above. Thus the limit pairing is the actual homotopy map $f$, and the $E_oo$ pairing is its associated-graded pairing for the filtration by the images of $pi_(*) G^s arrow.r pi_(*) K$.
  For the final assertion, the coefficient pairing is $R$-bilinear and sends the two units to the unit. Every element of $R \/ I$ is a scalar multiple of that unit. The pairing is consequently $\( r med mod med I \, r' med mod med I \) mapsto r r' med mod med I$. This uses neither flatness of the quotient nor associativity of the target map. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
