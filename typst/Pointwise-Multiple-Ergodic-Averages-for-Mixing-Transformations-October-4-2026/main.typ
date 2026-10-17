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

#align(center)[#text(size: 16pt, weight: "bold")[Pointwise Multiple Ergodic Averages \
for Mixing Transformations]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $\( X \, cal(F) \, mu \)$ be a probability space and let $T : X arrow.r X$ be invertible, bimeasurable, and measure preserving. We say that $T$ is #emph[mixing] if

#[#set math.equation(numbering: n => "(1.1)")
 $ mu \( A ∩ T^(- r) B \) arrow.r mu \( A \) mu \( B \) #h(2em) \( \| r \| arrow.r oo \) $ <eq:mixing>]

for every $A \, B in cal(F)$. For a fixed tuple of bounded measurable functions, the consecutive multiple ergodic averages are

$ A_N \( f_1 \, dots.h \, f_n \) \( x \) = 1 / N sum_(k = 1)^N product_(j = 1)^n f_j \( T^(j k) x \) . $

The problem is to determine their almost-everywhere behavior, not merely their limit in norm. We prove the following result.

#thm([Theorem 1.1.])[
  #emph[Suppose that $T$ satisfies (1.1). For every integer $n gt.eq 2$ and every fixed $f_1 \, dots.h \, f_n in L^oo \( mu \)$, 
$ A_N \( f_1 \, dots.h \, f_n \) \( x \) arrow.r product_(j = 1)^n integral_X f_j thin d mu #h(2em) upright("for ") mu upright("-almost every ") x \, $

 as $N$ tends to infinity through all positive integers. The probability space need not be standard, and no rate of mixing is required.]
] <thm:main>

The exceptional null set may depend on the system and the fixed tuple. The theorem concerns the times $k \, 2 k \, dots.h \, n k$ and does not require a common exceptional set for all bounded functions.

=== 1.1 Context and prior work <context-and-prior-work>

Arithmetic-progression averages became central to ergodic Ramsey theory through Furstenberg’s proof of Szemerédi’s theorem #cite(label("Furstenberg1977")). The distinction between norm and pointwise convergence is substantial. Host and Kra proved $L^2$ convergence of these averages for every finite length on arbitrary probability-preserving systems #cite(label("HostKra2005")) Theorem 1.1. Ziegler obtained another proof through universal characteristic factors #cite(label("Ziegler2007")) Corollary 1.8. For pointwise convergence, Bourgain’s double recurrence theorem treats two factors #cite(label("Bourgain1990")). Higher-length results have been obtained under additional structural assumptions: K-systems #cite(label("DerrienLesigne1996")) Theorem 4.2, weakly mixing systems with singular spectrum on their Pinsker factor #cite(label("Assani1998")), and weakly mixing systems whose pairwise independent self-joinings are independent #cite(label("GutmanHuangShaoYe2018")) Theorem 3.4. Huang, Shao, and Ye proved pointwise convergence for every finite length on ergodic measure-distal systems #cite(label("HuangShaoYe2019")) Theorem C.

The present proof extends the fourfold mixing theorem of #cite(label("FourfoldCompanion")) Theorem 1.1. It uses two substantial companion results. The first proves that ordinary mixing implies mixing of every finite order, the assertion of Rokhlin’s multiple-mixing problem #cite(label("MixingCompanion")) Theorem 1.1. The second gives an oscillation estimate for triple averages at distinct integer slopes on arbitrary invertible probability-preserving systems #cite(label("SlopesCompanion")) Proposition 3.5; together with its profile approximation, this yields pointwise triple convergence at distinct positive integer slopes without a mixing assumption. Section 2 states their exact forms and derives the required triple pointwise theorem along all lengths. These companion proofs are not reproduced here. The selected-law construction, arbitrary-length extension argument, and tensor estimate used below are proved in full.

=== 1.2 The arbitrary-length step <the-arbitrary-length-step>

We briefly describe what must change when the number of factors increases. A failure of pointwise convergence allows an averaging length to be chosen measurably at each starting point so that a centered average stays positive. After passing to a suspension flow, these choices define a probability law on $n$ output coordinates. The law has the correct individual marginals and is invariant under different speeds in the different coordinates. The same construction works on extensions of the flow.

The method of #cite(label("FourfoldCompanion")) Sections 3–6 organizes additional outputs into three groups. Their spatial coordinates are independent, and the original spatial coordinate is independent of any two groups; independence from all three groups is not imposed. We retain this three-group structure even when there are $n$ slots. Higher-order mixing and a tensor-packing estimate show that these independence properties survive the selected joining construction.

Two changes make this approach work for arbitrary $n$. First, we minimize the number of slots supporting a nonzero centered correlation. This gives independence for every smaller collection of the specific spatial lists being tested. A slot may read both the original spatial coordinate and the outputs in any proper subset of the three groups. That flexibility permits the outputs to be regrouped without imposing independence on arbitrary collections of whole states.

Second, an extension is chosen so that conditioning on all distal parameters together with a single state cannot improve under any further extension. This is a conditional-expectation energy construction, related to the sated-extension method #cite(label("Austin2015")) and adapted from #cite(label("FourfoldCompanion")) Section 6. Applying the joining construction again gives a square array. The single-state conditioning identity controls its distinguished row and column. Their parameter laws and a Hilbert-space argument then produce a new nonzero correlation with the same number of slots but one more output-only slot. Maximizing that number gives the contradiction. Only the pointwise theorem for at most three slots on arbitrary systems is used.

Section 2 records the dynamical inputs. Section 3 constructs the selected laws and their conditional marginals. Section 4 proves preservation of the three-group structure. Sections 5 and 6 carry out the minimal-correlation and square arguments. Appendix 7 proves the tensor estimate.

== 2 Dynamical inputs and standard models <sec:inputs>

Fix an integer $n gt.eq 2$ and put $I = { 1 \, dots.h \, n }$. We first state the dynamical results used below. The distinction between norm and pointwise convergence matters: norm convergence is available for any finite number of slots, whereas the pointwise input on arbitrary systems will be used only for at most three slots.

=== 2.1 Standard models and the two companion inputs <standard-models-and-the-two-companion-inputs>

For the fixed tuple in Theorem 1, record all integer translates of bounded measurable representatives of the functions. This gives a measurable map into a countable product of compact scalar discs, intertwining $T$ with the invertible shift. The pushforward measure defines a standard Borel probability system, and mixing passes to this factor. The original functions are its coordinate functions. Changing representatives affects at most a countable union of translated null sets, so almost-everywhere convergence on the factor pulls back. We may therefore work on standard probability spaces.

Throughout the proof, factors and conditional laws are understood modulo null sets. We use Borel versions of measurable functions. Sub-$sigma$-algebras on a standard probability space have standard models modulo null sets. A flow is a jointly Borel action $\( S_Y^t \)_(t in bb(R))$ on a standard Borel probability space $\( Y \, m_Y \)$, preserving $m_Y$. Factor maps commute with every fixed time modulo null sets. Joint measurability permits Fubini in all time integrals. For a preserved factor, induced transformations at fixed times can be modeled as invertible maps; we take time integrals on the original flow.

We use the following statement from #cite(label("MixingCompanion")) Theorem 1.1.

#thm([Theorem 2.1.])[
  (Higher-order mixing, companion input).  #emph[Let $T$ be an invertible mixing probability-preserving transformation. For any fixed $s gt.eq 2$, $g_1 \, dots.h \, g_s in L^oo \( mu \)$, and integer times $t_1 \, dots.h \, t_s$, 
$ integral_X product_(j = 1)^s g_j \( T^(t_j) x \) thin d mu \( x \) arrow.r product_(j = 1)^s integral_X g_j thin d mu quad upright("as") quad min_(i eq.not j) \| t_i - t_j \| arrow.r oo . $

 For $s = 1$ the equality holds for every time.]
] <thm:multiple-mixing>

The cited theorem is stated for sets and ordered times. Simple-function approximation, invariance, and the finitely many orderings of the times give this formulation. No quantitative mixing rate is asserted or used.

Our second companion input is the smooth-average convergence consequence of #cite(label("SlopesCompanion")) Proposition 3.5 and Lemma 3.6. An #emph[averaging profile] there is a real compactly supported smooth function $phi$ of mass one with moments of orders $1 \, 2 \, 3$ equal to zero, and, for some $G gt.eq 1$,

$ lr(bar.v.double phi^(\( r \)) bar.v.double)_oo lt.eq #scale(x: 120%, y: 120%)[\(] G \( r + 2 \) #scale(x: 120%, y: 120%)[\)]^(G \( r + 2 \)) #h(2em) \( r gt.eq 0 \) . $

The constant $G$ may depend on the profile. We need the following two precise conclusions.

#thm([Proposition 2.2.])[
  (Smooth triple averages, companion input).  #emph[Let $R$ be any invertible probability-preserving transformation, and let $b_1 \, b_2 \, b_3$ be distinct nonzero integers with greatest common divisor one. For bounded $g_1 \, g_2 \, g_3$ and every averaging profile, 
$ V_k^phi \( y \) = sum_(l in bb(Z)) 2^(- k) phi \( l \/ 2^k \) product_(j = 1)^3 g_j \( R^(b_j l) y \) $

 converges almost everywhere as $k arrow.r oo$. Moreover, for each $c in \[ 1 \, 2 \]$ and $epsilon.alt > 0$ there is such a profile with 
$ lr(bar.v.double phi - c^(- 1) upright(bold(1))_(\( 0 \, c \]) bar.v.double)_(L^1 \( bb(R) \)) < epsilon.alt . $

]
] <prop:smooth-input>

The approximation is #cite(label("SlopesCompanion")) Lemma 3.9. Neither part requires mixing or ergodicity. We will not assume pointwise convergence of longer averages on arbitrary systems.

=== 2.2 Relative weak mixing and distal factors <relative-weak-mixing-and-distal-factors>

We recall the structure facts in the form needed for the auxiliary systems. An extension of an invertible system $R$ over a factor $B$ is #emph[relatively weakly mixing] if, for bounded $f \, g$ with $bb(E) \[ f divides B \] = 0$,

#[#set math.equation(numbering: n => "(2.1)")
 $ 1 / H sum_(h = 1)^H lr(bar.v.double bb(E) \[ overline(f) \( g compose R^h \) divides B \] bar.v.double)_2^2 arrow.r 0 . $ <eq:rwm>]

An extension is #emph[relatively compact] if the invariant finitely generated $L^oo \( B \)$-modules span a dense subspace of its $L^2$ space. A module consists of finite sums $sum_j a_j F_j$, with $a_j in L^oo \( B \)$ and fixed $F_j in L^2$; invariance is under composition with both $R$ and $R^(- 1)$. Individual modules need not be closed; see the corrected module characterization in #cite(label("JamneshanCorrigendum2026")) Theorem 2.5(ii)$'$. A #emph[relatively distal] extension is a tower of relatively compact extensions and inverse limits. A system is #emph[distal] if it is distal over the trivial factor. A joining is an invariant probability law on a product with the prescribed marginals.

#thm([Proposition 2.3.])[
  (Relative structure).  #emph[The following statements hold for standard probability-preserving systems, without an ergodicity assumption.]
  + #emph[Every system $Y$ has a maximal measure-distal factor $W_Y$, and $Y arrow.r W_Y$ is relatively weakly mixing. Every distal factor pulls into the maximal distal factor of an extension. Automorphisms commuting with the transformation preserve $W_Y$.]
  + #emph[Factors and joinings of distal systems are distal. A distal system is relatively distal over each of its factors. Distality is equivalent for a transformation and any of its nonzero integer powers.]
  + #emph[Relative weak mixing passes to nonzero integer powers. The conditional product of relatively weakly mixing fibre laws over an invariant joining of their base laws is relatively weakly mixing over that joining.]
  + #emph[A relatively weakly mixing extension and a relatively distal extension of the same base are relatively disjoint: every invariant joining identifying their bases is the conditional product over that base.]
  + #emph[For a distal transformation $R$, every $d gt.eq 1$, and bounded $g_1 \, dots.h \, g_d$, the averages 
$ 1 / N sum_(l = 1)^N product_(i = 1)^d g_i compose R^(i l) $

 converge almost everywhere.]
  #emph[For a flow, the maximal distal factor of time one is preserved by the flow, and its action at every nonzero rational time is distal.]
] <prop:structure>

These are the conclusions of #cite(label("FourfoldCompanion")) Proposition 2.2. They include the nonergodic form of the Furstenberg–Zimmer structure theorem #cite(label("Zimmer1976")) #cite(label("Jamneshan2023")) and the pointwise theorem for distal systems #cite(label("HuangShaoYe2019")) Theorem C. The cited proposition gives the component-disintegration argument needed for the latter in the nonergodic setting. In the flow assertion, invariance of $W_Y$ follows because each time commutes with time one. If $r = p \/ q eq.not 0$ is rational, the $q$th power of its action is the distal action at integer time $p$, so the power assertion applies.

The following short argument, from #cite(label("FourfoldCompanion")) Lemma 2.3, will also fix the norm-convergence input explicitly.

#thm([Lemma 2.4.])[
  (Relative norm convergence).  #emph[Suppose $Y arrow.r B$ is relatively weakly mixing for $R$. For distinct nonzero integers $a_1 \, dots.h \, a_d$ and bounded $G_1 \, dots.h \, G_d$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ ∥1 / N sum_(l = 1)^N (product_(i = 1)^d G_i compose R^(a_i l) - product_(i = 1)^d bb(E) \[ G_i divides B \] compose R^(a_i l))∥_2 arrow.r 0 . $ <eq:relative-norm>]

]
] <lem:relative-norm>

#proof[
  By telescoping and scaling, it suffices to show that the average of $v_l = product_i G_i compose R^(a_i l)$ tends to zero when all functions are bounded by one and one of them, $G_s$, is centered over $B$. Induct on $d$. For fixed $h gt.eq 1$ put $F_(i \, h) = overline(G_i) \( G_i compose R^(a_i h) \)$. Invariance gives
  $ chevron.l v_l \, v_(l + h) chevron.r = integral_Y F_(s \, h) product_(i eq.not s) F_(i \, h) compose R^(\( a_i - a_s \) l) thin d m_Y . $
  The induction hypothesis replaces the factors indexed by $i eq.not s$ in their average by their conditional expectations over $B$. The remaining product is $B$-measurable and bounded by one; hence
  $ limsup_(N arrow.r oo) lr(|1 / N sum_(l = 1)^N chevron.l v_l \, v_(l + h) chevron.r|) lt.eq lr(bar.v.double bb(E) \[ F_(s \, h) divides B \] bar.v.double)_1 . $
  For $d = 1$ this bound holds directly. The Hilbert-space van der Corput inequality now bounds the limiting squared norm by a constant times
  $ 1 / H + 1 / H sum_(h = 1)^H lr(bar.v.double bb(E) \[ F_(s \, h) divides B \] bar.v.double)_1 . $
  Relative weak mixing for $R^(a_s)$ and Cauchy–Schwarz make this expression tend to zero as $H arrow.r oo$. ◻
]

For positive slopes, inserting functions $1$ in omitted positions and using Proposition 4(5) shows that the distal-factor averages have an $L^2$ limit. Thus Lemma 5 gives an $L^2$ limit for arbitrary bounded tuples with distinct positive slopes on every standard system. On the original mixing system, the trivial factor already satisfies (2.1); the limit is the product of the means.

=== 2.3 Triple convergence along all lengths <triple-convergence-along-all-lengths>

#thm([Lemma 2.5.])[
  (Triple pointwise convergence).  #emph[On any standard invertible probability-preserving system, averages of at most three bounded functions at distinct positive integer slopes converge almost everywhere along all positive integer lengths.]
] <lem:triple-convergence>

#proof[
  Add constant-one functions if necessary to have three distinct positive slopes, write them as $g b_1 \, g b_2 \, g b_3$ with $gcd \( b_1 \, b_2 \, b_3 \) = 1$, and apply Proposition 3 to $S = R^g$. By scaling, suppose the three functions are bounded by one, and put $F_l = product_(j = 1)^3 g_j compose S^(b_j l)$.
  For each rational $c in \[ 1 \, 2 \]$, choose a sequence of profiles tending in $L^1$ to $h_c = c^(- 1) upright(bold(1))_(\( 0 \, c \])$. On a common conull set all the corresponding smooth dyadic averages converge. For $N_k = floor.l c 2^k floor.r$, the difference between the ordinary average at $N_k$ and $V_k^phi$ is at most
  $ frac(1, c 2^k) + 2^(- k) sum_(l in bb(Z)) \| h_c \( l \/ 2^k \) - phi \( l \/ 2^k \) \| . $
  The last sum tends to $lr(bar.v.double h_c - phi bar.v.double)_1$ by Riemann sums. Arbitrarily close profiles therefore give the Cauchy property on each of these scales. The $L^2$ limit established above identifies all their almost-everywhere limits with the same function.
  For any bounded sequence $\| F_l \| lt.eq 1$, changing the averaging length from $N$ to $M$ changes the average by at most
  #[#set math.equation(numbering: n => "(2.3)")
   $ frac(2 \| M - N \|, max \( M \, N \)) . $ <eq:length-change>]
  For $2^k lt.eq N < 2^(k + 1)$, compare $N$ with $floor.l c 2^k floor.r$ on a finite rational grid in $\[ 1 \, 2 \]$. Equation (2.3) makes the limiting error arbitrarily small as the grid mesh tends to zero. This proves convergence along all integer lengths. ◻
]

== 3 Selected lengths and their joining laws <sec:selected>

We assume that the asserted pointwise convergence fails for the fixed set of slopes $I = { 1 \, dots.h \, n }$. This section records that failure in a probability law and constructs compatible laws on all flow extensions. The construction retains a positive correlation while forcing every one-, two-, or three-slot marginal to have its ordinary conditional law. We follow the selector and joining construction in #cite(label("FourfoldCompanion")) Sections 3–6, keeping the extension and conditioning properties explicit for the arbitrary number of slots.

=== 3.1 A positive witness at selected lengths <a-positive-witness-at-selected-lengths>

Expanding each function into its mean and centered part, and then into real and imaginary parts, gives a nonempty $J_0 subset.eq I$ and real functions $f_i$, $i in J_0$, such that

$ integral_X f_i thin thin d mu = 0 \, #h(2em) lr(bar.v.double f_i bar.v.double)_oo lt.eq 1 \, #h(2em) B_L \( x \) = 1 / L sum_(l = 1)^L product_(i in J_0) f_i \( T^(i l) x \) $

does not tend to zero on a set of positive measure. Here and below $B_L$ has an integer subscript. Lemma 5, applied over the trivial factor, gives $B_L arrow.r 0$ in $L^2 \( mu \)$. After changing the sign of one $f_i$, there are $delta > 0$ and a measurable set $E_(*) subset.eq X$ of positive measure such that

#[#set math.equation(numbering: n => "(3.1)")
 $ B_L \( x \) > 2 delta quad upright("for arbitrarily large integers ") L \, #h(2em) x in E_(*) . $ <eq:failure-witness>]

We use the roof-one suspension

#[#set math.equation(numbering: n => "(3.2)")
 $ C = X times \[ 0 \, 1 \) \, #h(2em) m_C = mu ⊗ thin d u \, #h(2em) S_C^t \( x \, u \) = #scale(x: 120%, y: 120%)[\(] T^(floor.l u + t floor.r) x \, { u + t } #scale(x: 120%, y: 120%)[\)] . $ <eq:suspension>]

Write $xi \( x \, u \) = x$ and $upsilon \( x \, u \) = u$, regarding $upsilon$ also as a coordinate in the circle $bb(R) \/ bb(Z)$.

#thm([Lemma 3.1.])[
  (Selected positive witness).  #emph[There are a finite set $F subset.eq \[ 1 \, 2 \]$ containing $1$ and measurable functions $N_a : C arrow.r \[ 2^a \, oo \)$, $a in bb(N)$, independent of the phase, with 
#[#set math.equation(numbering: n => "(3.3)")
 $ N_a \( x \, u \) in { c 2^k : c in F \, med k gt.eq a } \, #h(2em) N_a \( x \, u \) = 2^a quad \( x in.not E_(*) \) \, $ <eq:selector-grid>]

 such that $B_(floor.l N_a \( x \, u \) floor.r) \( x \) > delta$ on $E_(*)$. Moreover, there is a continuous nonnegative function $Psi$ on $\( bb(R) \/ bb(Z) \)^I$ for which 
#[#set math.equation(numbering: n => "(3.4)")
 $ liminf_(a arrow.r oo) integral_C frac(1, N_a \( z \)) integral_0^(N_a \( z \)) Psi #scale(x: 120%, y: 120%)[\(] \( upsilon \( S_C^(i t) z \) \)_(i in I) #scale(x: 120%, y: 120%)[\)] product_(i in J_0) f_i #scale(x: 120%, y: 120%)[\(] xi \( S_C^(i t) z \) #scale(x: 120%, y: 120%)[\)] thin thin d t thin thin d m_C \( z \) > 0 . $ <eq:selected-positive-limit>]

]
] <lem:selected-witness>

#proof[
  By (2.3), changing the length from $L$ to $M$ changes an average of a sequence bounded by one by at most $2 \| M - L \| \/ max \( M \, L \)$. Choose $F$ to be a sufficiently fine finite grid in $\[ 1 \, 2 \]$. For every sufficiently large integer $L$, some $c in F$ and $k = floor.l log_2 L floor.r$ satisfy
  $ \| B_L \( x \) - B_(floor.l c 2^k floor.r) \( x \) \| < delta #h(2em) upright("for every ") x . $
  Equation (3.1) therefore supplies, for each $x in E_(*)$ and $a$, a pair $\( c \, k \)$ with $k gt.eq a$ at which the latter average exceeds $delta$. Choose the first such pair in a fixed enumeration. This is a measurable choice from a countable set and defines $N_a$ on $E_(*)$; use $2^a$ elsewhere.
  Choose continuous nonnegative circle functions $alpha \, beta$, neither identically zero, supported respectively inside $\( 1 \/ 4 \, 1 \/ 2 \)$ and $\( 0 \, 1 \/ \( 4 n \) \)$. Set
  #[#set math.equation(numbering: n => "(3.5)")
   $ Psi \( v \) = alpha \( 2 v_1 - v_2 \) beta \( v_2 - v_1 \) \, #h(2em) v = \( v_i \)_(i in I) in \( bb(R) \/ bb(Z) \)^I . $ <eq:phase-witness>]
  For $z = \( x \, u \)$ and $t = l + s$, where $l in bb(Z)$ and $0 lt.eq s < 1$, the phase factor is $alpha \( u \) beta \( s \)$. If it is nonzero, then $0 < u + i s < 1$ for every $i in I$, so $xi \( S_C^(i t) z \) = T^(i l) x$. Summing complete unit intervals gives, uniformly in $z$ and real $L gt.eq 2$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ & 1 / L integral_0^L Psi #scale(x: 120%, y: 120%)[\(] \( upsilon \( S_C^(i t) z \) \)_i #scale(x: 120%, y: 120%)[\)] product_(i in J_0) f_i #scale(x: 120%, y: 120%)[\(] xi \( S_C^(i t) z \) #scale(x: 120%, y: 120%)[\)] thin thin d t\
 & #h(18mm)  = alpha \( u \) (integral_0^1 beta \( s \) thin thin d s) B_(floor.l L floor.r) \( x \) + O \( L^(- 1) \) . $ <eq:suspension-witness>]
  The error includes the incomplete last interval, the change from indices $0 \, dots.h \, floor.l L floor.r - 1$ to $1 \, dots.h \, floor.l L floor.r$, and the normalization. On $E_(*)$ the main term at $L = N_a \( z \)$ has integral at least
  $ delta mu \( E_(*) \) (integral_0^1 alpha \( u \) thin thin d u) (integral_0^1 beta \( s \) thin thin d s) > 0 . $
  On $X \\ E_(*)$ its integral tends to zero because $N_a = 2^a$ there and $B_(2^a) arrow.r 0$ in $L^2 \( mu \)$. The uniform error is $O \( 2^(- a) \)$, proving (3.4). ◻
]

=== 3.2 Selected laws on all extensions <selected-laws-on-all-extensions>

Fix these selectors and a free ultrafilter $cal(U)$ on $bb(N)$. A #emph[flow over $C$] is a standard probability space $\( Y \, m_Y \)$ with a jointly Borel probability-preserving action $S_Y^t$, $t in bb(R)$, and a probability-preserving factor map $pi_Y : Y arrow.r C$ satisfying $pi_Y S_Y^t = S_C^t pi_Y$ modulo null sets for each fixed $t$. An extension $rho : Y' arrow.r Y$ of such flows is a probability-preserving factor map, equivariant in the same sense, with $pi_(Y') = pi_Y rho$ modulo null sets. We do not require a common conull set on which every real-time factor identity holds. Joint measurability and Fubini justify their uses inside time integrals.

#thm([Proposition 3.2.])[
  (Selected joining laws).  #emph[Every flow $Y$ over $C$ has a unique probability law $lambda_Y$ on $Y^I$ satisfying, for all bounded measurable functions $G_i$ on $Y$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ integral_(Y^I) product_(i in I) G_i \( y_i \) thin thin d lambda_Y = lim_(a arrow.r cal(U)) integral_Y frac(1, N_a \( pi_Y y \)) integral_0^(N_a \( pi_Y y \)) product_(i in I) G_i \( S_Y^(i t) y \) thin thin d t thin thin d m_Y \( y \) . $ <eq:selected-law>]

 Its marginals are $m_Y$, and it is invariant under $\( y_i \)_i mapsto \( S_Y^(i t) y_i \)_i$, $t in bb(R)$. If $rho : Y' arrow.r Y$ is an extension over $C$, then $\( rho^I \)_(*) lambda_(Y') = lambda_Y$.]
  #emph[Countable inverse limits of extensions over $C$ exist in this category. The selected law at such a limit projects to the selected law at every stage. Pullbacks of the stage selected-law spaces have dense union in $L^2$ of the limit selected law.]
] <prop:selected-law>

#proof[
  For each $a$ the expression before the ultralimit defines a genuine probability measure $lambda_(Y \, a)$ on $Y^I$, by integrating the measurable orbit map over the indicated finite time interval. We first show that each of its marginals converges against every bounded measurable test $G$ to $m_Y$. The one-slot continuous-time averages
  $ 1 / L integral_0^L G \( S_Y^(i t) y \) thin thin d t $
  converge almost surely as $L arrow.r oo$. For example, apply Birkhoff’s theorem for $S_Y^i$ to the function $y mapsto integral_0^1 G \( S_Y^(i s) y \) thin thin d s$ and discard the incomplete unit interval. Their almost-sure limit has integral $integral G thin thin d m_Y$, since every deterministic average has that integral. As $N_a \( pi_Y y \) gt.eq 2^a$, bounded convergence gives the same integral limit at the selected lengths.
  Embed $Y$ as a Borel subset of a compact metrizable space $K$. Ultralimits of the $lambda_(Y \, a)$ against continuous functions on $K^I$ give a positive normalized functional, hence a probability measure on $K^I$. Its marginals are $m_Y$, by the preceding paragraph, so it is concentrated on $Y^I$. Call the resulting law $lambda_Y$. To obtain (3.7) for arbitrary bounded slot functions, normalize their bounds to one and approximate each in $L^1 \( m_Y \)$ by continuous functions on $K$ with the same bound. The difference between the two product integrals is bounded by the sum of the single-slot errors. Under $lambda_Y$ these errors are the $L^1 \( m_Y \)$ errors, while under $lambda_(Y \, a)$ they converge to those errors by the marginal convergence already proved. Letting the errors tend to zero proves the formula. Product tests determine a probability measure on $Y^I$, giving uniqueness. In particular, all these identities depend only on the almost-everywhere classes of their slot functions.
  Applying the product action at a fixed time $t_0$ shifts the time interval in (3.7) by $t_0$ without changing its length or its initial-point selector. For slot functions bounded by one the error is at most $2 \| t_0 \| 2^(- a)$, proving invariance. For an extension $rho$, substitute $G_i compose rho$ in the formula. Equivariance, the equality of the selectors, and Fubini identify its right-hand side with that for $Y$, proving functoriality.
  For a tower $Y_0 arrow.l Y_1 arrow.l dots.h.c$, take the full countable product of the underlying standard spaces, with the consistent inverse-limit probability measure and coordinatewise flow. This is a jointly Borel action. A cylinder through stage $r$ has probability computed from $m_(Y_r)$ by the finitely many bonding maps. At any fixed time their equivariance and preservation of $m_(Y_r)$ leave that probability unchanged. Cylinders determine the measure, so every fixed time preserves it. The measure is concentrated on compatible sequences; using the full product avoids any need for one compatibility set invariant at all real times. The stage projections are factor maps modulo null sets, and projection through $Y_0$ gives the factor onto $C$. Functoriality now gives the asserted selected-law projections. Finally, the stage coordinates generate the inverse-limit sigma-algebra. The compatibility relations hold under the selected law slot by slot because its marginals are the inverse-limit probability measure. Thus the pulled-back stage sigma-algebras on the selected-law space are increasing and generate it modulo null sets. The usual $L^2$ approximation by an increasing sequence of sigma-algebras proves density. ◻
]

=== 3.3 Distal parameters and small marginals <distal-parameters-and-small-marginals>

For a flow $Y$ over $C$, let $omega_Y : Y arrow.r W_Y$ be its maximal measure-distal factor for time one, and let $nu_Y = \( omega_Y \)_(*) m_Y$. Write $m_(Y \, w)$ for its conditional probability measures, so that

$ m_Y = integral_(W_Y) m_(Y \, w) thin thin d nu_Y \( w \) . $

Under $lambda_Y$ put

#[#set math.equation(numbering: n => "(3.8)")
 $ P_i = omega_Y \( y_i \) \, #h(2em) P = \( P_i \)_(i in I) . $ <eq:distal-parameters>]

Proposition 4 ensures that $W_Y$ is preserved by every flow time. Such statements about factor sigma-algebras are understood modulo null sets; all time integrals below are evaluated on the original jointly Borel flow. If $rho : Y' arrow.r Y$ is an extension, the pullback of $W_Y$ is distal for time one and hence is contained in $W_(Y')$. Consequently the old parameter array is a measurable function of the new parameter array on selected-law spaces.

#thm([Proposition 3.3.])[
  (Parameter and small-marginal laws).  #emph[For every flow $Y$ over $C$ and bounded measurable $H_i$ on $W_Y$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ bb(E)_(lambda_Y) product_(i in I) H_i \( P_i \) = lim_(L arrow.r oo) integral_Y 1 / L integral_0^L product_(i in I) H_i #scale(x: 120%, y: 120%)[\(] omega_Y \( S_Y^(i t) y \) #scale(x: 120%, y: 120%)[\)] thin thin d t thin thin d m_Y \( y \) . $ <eq:deterministic-parameters>]

 For every nonempty $J subset.eq I$ with $\| J \| lt.eq 3$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ cal(L)_(lambda_Y) #scale(x: 120%, y: 120%)[\(] \( y_i \)_(i in J) divides P #scale(x: 120%, y: 120%)[\)] = ⨂_(i in J) m_(Y \, P_i) . $ <eq:small-conditional-law>]

]
] <prop:selected-parameters>

#proof[
  We first explain the passage from discrete to continuous time used in both assertions. Write $t = l + s$, with $l gt.eq 0$ an integer and $0 lt.eq s < 1$. For each fixed $s$, a continuous-time product becomes the discrete product at slopes $i$ for the shifted slot functions $G_i compose S_Y^(i s)$. Whenever the corresponding discrete averages converge almost surely, Fubini and bounded convergence show that their integrals in $s$ converge almost surely. Starting the discrete average at $l = 0$ rather than $l = 1$, and dropping an incomplete final unit interval, each has an error tending to zero. The resulting continuous-time convergence holds along all real lengths $L$.
  Apply this observation to functions from $W_Y$. Their shifts still belong to $W_Y$, and pointwise convergence on the distal factor is part of Proposition 4. Thus the time averages in (3.9) converge almost surely along all lengths, and therefore at the selected lengths as well. Bounded convergence and (3.7) prove that equation.
  For $\| J \| lt.eq 3$, Lemma 6 and the same continuous-time argument show that the selected $J$-marginal equals its deterministic-length integrated law. The extension $Y arrow.r W_Y$ is relatively weakly mixing. Apply Lemma 5 to the distinct integer slopes $i in J$ and the shifted functions $G_i compose S_Y^(i s)$, for each fixed $s$. Conditional expectation commutes with these shifts because $W_Y$ is preserved. Integration in $s$, using the uniform norm bound and bounded convergence, gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E)_(lambda_Y) product_(i in J) G_i \( y_i \) = bb(E)_(lambda_Y) product_(i in J) bb(E)_(m_Y) \[ G_i divides W_Y \] \( y_i \) . $ <eq:small-replacement>]
  Indeed the difference of the deterministic averages tends to zero in $L^2 \( m_Y \)$, so also in their integrated values. Applying this identity to $G_i$ multiplied by arbitrary bounded functions of $P_i$ yields
  #[#set math.equation(numbering: n => "(3.12)")
   $ cal(L)_(lambda_Y) #scale(x: 120%, y: 120%)[\(] \( y_i \)_(i in J) divides \( P_i \)_(i in J) #scale(x: 120%, y: 120%)[\)] = ⨂_(i in J) m_(Y \, P_i) . $ <eq:small-own-parameters>]
  Conditioning on the full parameter array requires one more step; it does not follow from (3.12) alone. Use the invariant transformation with speed $i$ in slot $i$. By the stability under nonzero powers and conditional products in Proposition 4, the $J$-marginal system in (3.12) is relatively weakly mixing over its parameter law. The full $P$-system is a joining of the distal systems $W_Y$ at these integer powers. It is distal, and is therefore relatively distal over the subarray $\( P_i \)_(i in J)$. Their joint law under $lambda_Y$ is an invariant joining identifying that common subarray. Relative disjointness in Proposition 4 makes this joining conditionally independent over the subarray, which is precisely (3.10). ◻
]

The full parameter law is thus unaffected by the selectors, although the full state law need not be. We now turn that state law into a new flow while preserving one chosen slot as the original system.

#thm([Lemma 3.4.])[
  (Normalized joining flow).  #emph[For $b in I$, define 
#[#set math.equation(numbering: n => "(3.13)")
 $ sans(M)_b \( Y \) = (Y^I \, lambda_Y \, S_(sans(M)_b \( Y \))^t \( y_i \)_i = \( S_Y^(i t \/ b) y_i \)_i) . $ <eq:normalized-joining>]

 This is a standard probability-preserving flow over $C$ via $\( y_i \)_i mapsto pi_Y \( y_b \)$, and projection onto slot $b$ is an extension onto $Y$. The array $P$ belongs to the maximal measure-distal factor of $sans(M)_b \( Y \)$ for time one.]
] <lem:normalized-joining>

#proof[
  Invariance follows from Proposition 8, after rescaling the time parameter by $1 \/ b$. Slot $b$ has speed one and marginal $m_Y$, giving the stated factor maps. In slot $i$ the $W_Y$-factor is distal for time $i \/ b$, by Proposition 4. The law of $P$ is an invariant joining of these rational-time distal systems, hence is distal. Maximality of the distal factor gives the last assertion. ◻
]

#thm([Lemma 3.5.])[
  (The retained positive correlation).  #emph[With the functions and phase test of Lemma 7, 
#[#set math.equation(numbering: n => "(3.14)")
 $ integral_(C^I) Psi #scale(x: 120%, y: 120%)[\(] \( upsilon \( z_i \) \)_i #scale(x: 120%, y: 120%)[\)] product_(i in J_0) f_i #scale(x: 120%, y: 120%)[\(] xi \( z_i \) #scale(x: 120%, y: 120%)[\)] thin thin d lambda_C > 0 . $ <eq:positive-witness>]

 The phase array in this integral is measurable in the distal parameter array of $C^I$.]
] <lem:positive-witness>

#proof[
  Continuous functions on the compact product of circles are uniformly approximable by finite sums of products of continuous one-coordinate functions. Apply this to $Psi$, use (3.7) for each resulting product, and then use the strictly positive lower limit in (3.4). Finally, time one fixes the phase on $C$, so the phase factor is distal and lies in $W_C$. ◻
]

== 4 Channels and closure under selected laws <sec:channels>

The selected length is determined by the original point in the suspension. It can therefore change the joint law of other coordinates, even when their unconditioned law is a product. We organize those coordinates in three groups. Independence of the original point from any two groups will control the effect of selecting a length on all three groups. This channel construction and its closure argument adapt #cite(label("FourfoldCompanion")) Section 5; the proof below permits every fixed finite set of slots $I = { 1 \, dots.h \, n }$.

#prodef([Definition 4.1.])[
  (Channel).  A #emph[channel] is a flow $Y$ over the suspension $C$, with factor map $pi_Y : Y arrow.r C$, together with a finite list of probability-preserving maps $D_gamma : Y arrow.r C$, called #emph[outputs], and positive rational numbers $q_gamma$, such that
  $ D_gamma \( S_Y^t y \) = S_C^(q_gamma t) D_gamma \( y \) $
  for each fixed $t$, modulo null sets. Partition the output indices into three groups, numbered $1 \, 2 \, 3$; empty groups are allowed. Set
  $ x_0 = xi compose pi_Y \, #h(2em) x_gamma = xi compose D_gamma \, #h(2em) d_Y = \( x_gamma \)_gamma \, $
  and let $d_(Y \, H)$ be the sublist from groups in $H subset.eq { 1 \, 2 \, 3 }$. Let $V$ collect the phase coordinates of $pi_Y$ and all the $D_gamma$. Under the measure $m_Y$ require
  #[#set math.equation(numbering: n => "(4.1)")
   $ cal(L) \( d_Y divides V \) & = ⨂_gamma mu \,\
cal(L) \( x_0 \, d_(Y \, H) divides V \) & = mu ⊗ ⨂_(gamma upright(" in groups ") H) mu \, #h(2em) H subset.neq { 1 \, 2 \, 3 } . $ <eq:channel-laws>]
  An empty spatial list has the one-point law.
] <def:channel>

Thus the spatial outputs have a product law independent of the phases. The original spatial coordinate has a product law with the outputs in any proper collection of groups, but no independence from the complete output list is required. The suspension $C$, with no outputs, is a channel.

#thm([Lemma 4.2.])[
  (Conditioning and extensions).  #emph[For a channel $Y$, both identities in (4.1) hold with conditioning on its maximal measure-distal factor $W_Y$ in place of $V$. Every flow extension of $Y$ over $C$ is a channel with the pulled back output data, and the same strengthening holds there.]
] <lem:channel-conditioning>

#proof[
  Choose a positive integer $h$ such that $h q_gamma$ is an integer for each output. The phase vector $V$ is a factor fixed by time $h$, and its time-one action is distal, so $V$ belongs to $W_Y$. For any spatial tuple appearing in (4.1), its joint factor with $V$ has product law over $V$. At time $h$ the spatial coordinates evolve by a product of positive integer powers of $T$. This product is mixing: the assertion follows first for product tests from mixing of each power, and then for all bounded tests by approximation. Consequently this factor is relatively weakly mixing over $V$ for time $h$.
  On the other hand, $W_Y$ is distal for time $h$ and relatively distal over $V$. Relative disjointness, in the form of #cite(label("FourfoldCompanion")) Proposition 2.2, makes the spatial factor and $W_Y$ relatively independent over $V$. Its conditional spatial law given $W_Y$ is therefore the product law in (4.1). Pullback to an extension preserves the joint laws of the original data, proving the channel identities there; the same argument gives their stronger conditioning. ◻
]

We now prove the closure property that will permit repeated extensions. Recall from Lemma 10 that $sans(M)_b \( Y \)$ has state space $Y^I$, measure $lambda_Y$, and flow $\( y_i \)_i mapsto \( S_Y^(i t \/ b) y_i \)_i$.

#thm([Proposition 4.3.])[
  (Channel closure).  #emph[Let $Y$ be a channel and $b in I$. On $sans(M)_b \( Y \)$ take $pi_Y \( y_b \)$ as original factor and take every $D_gamma \( y_i \)$, $i in I$, as an output, in the old group of $gamma$. These data make $sans(M)_b \( Y \)$ a channel.]
] <prop:channel-closure>

#proof[
  Each new output is probability-preserving and has positive rational speed $i q_gamma \/ b$. It remains to prove the two conditional laws. Test them with products of bounded spatial functions and products of bounded phase functions. Such tests determine the laws. Expanding each spatial function into its mean and centered part, and scaling, reduces the proof to real spatial functions that are either $1$ or centered and bounded in absolute value by $1$. We may also bound every phase function by $1$. Whenever at least one spatial factor is centered, the tested integral must be zero. A test using the new original coordinate uses outputs from only a proper set of groups.
  ===== 4.1 Time intervals and offsets. <time-intervals-and-offsets.>
  Use the selected-law formula (3.7) and condition on the old phase vector $V$ under $m_Y$. Fix an integer $h > 0$ clearing all output-speed denominators and write $t = h l + s$, where $l gt.eq 0$ is an integer and $0 lt.eq s < h$. For fixed $V \, s$, all phase weights in the test are independent of $l$. The spatial function for output $gamma$ at slot $i$ is evaluated at
  #[#set math.equation(numbering: n => "(4.2)")
   $ T^(e_gamma i l + a_(gamma \, i)) x_gamma \, #h(2em) e_gamma = h q_gamma in bb(N) . $ <eq:channel-times>]
  The offsets $a_(gamma \, i)$ depend on $V \, s$ and range over a fixed finite set, by the suspension formula. If the original-factor test is present, its argument is $T^(h b l + a_0) x_0$, with the same finite-offset property. Equivariance and Fubini justify these formulas in the time integrals.
  On an event where the selected length is $N = c 2^k$, $c in F$ and $k gt.eq a$, put $m = floor.l c 2^k \/ h floor.r$. Replacing the normalized time integral by the average over the $m$ complete intervals, followed by integration against $d s \/ h$, has error at most $2 h 2^(- a)$. For all sufficiently large $a$ we have $m gt.eq 1$.
  ===== 4.2 Tests using a proper set of groups. <tests-using-a-proper-set-of-groups.>
  Given $V$, the relevant old output coordinates have product law and are independent of $x_0$, by (4.1). The selector is determined by $V \, x_0$. Suppose first that some output occurrence is centered. For fixed $V \, s \, x_0$, integrate the spatial output product at index $l$. The expectation factors over the old output indices $gamma$. For an index having a centered occurrence, the times (4.2) in distinct slots separate as $l arrow.r oo$. Mixing of all orders makes its integral tend to the product of the means, hence to zero. A single centered occurrence already has zero integral. The convergence is uniform over the finitely many offset patterns. All other factors have absolute value at most $1$. The Cesàro averages of these absolute expectations consequently tend to zero uniformly over all sufficiently large lengths. This applies to the selected lengths as well.
  If every output test is $1$, the centered factor must be the original one. Birkhoff’s theorem for the ergodic power $T^(h b)$ gives convergence to zero for $mu$-almost every $x_0$, simultaneously for all the finitely many offsets $a_0$. Since the selected lengths tend to infinity pointwise, they have the same limit. The conditional law of $x_0$ given $V$ is $mu$, so bounded convergence completes this case.
  ===== 4.3 Three groups and almost orthogonal vectors. <three-groups-and-almost-orthogonal-vectors.>
  It remains to treat the full output list, with no original-factor spatial test. If one group has no centered occurrence, every spatial test in that group is $1$, and the preceding argument applies; the phase tests of that group were allowed throughout. Thus suppose each group contains a centered occurrence. For fixed $V \, s$, write its spatial product at index $l$ as
  $ u_l in L^2 \( Omega_1 \) \, #h(2em) v_l in L^2 \( Omega_2 \) \, #h(2em) w_l in L^2 \( Omega_3 \) \, $
  where $Omega_j$ carries the product measure with one copy of $mu$ for every old output in group $j$. These are real unit-ball vectors, indeed functions bounded by $1$. Given $V$, the old spatial output law is the product of these three spaces. The vectors depend on $V \, s$ only through the finite offset patterns.
  For every $eta > 0$, after omitting finitely many initial indices, the families $\( u_l \)$ and $\( v_l \)$ each have absolute pair inner products at most $eta$ outside a graph of bounded maximum degree $L_0$. All these bounds are uniform in the offset patterns. To verify this, in each of the two groups choose a centered occurrence at some output index $gamma$. Its coordinate integral in a pair inner product is small by mixing of all orders whenever the times in the two copies of (4.2) are sufficiently separated. The times within each copy separate once $l \, l'$ exceed a fixed threshold. Failure of separation between copies then requires one of finitely many inequalities
  $ \| e_gamma i l - e_gamma i' l' + a' \| lt.eq R . $
  For fixed $l$, each inequality permits only a bounded number of integers $l'$, because $e_gamma \, i' > 0$; the same holds with $l \, l'$ interchanged. Their union is the required bounded-degree graph. The coordinate integrals for other output indices are bounded by $1$. The separation threshold and $L_0$ may depend on $eta$, but no rate of mixing is needed.
  ===== 4.4 Conditioning on a selected length. <conditioning-on-a-selected-length.>
  For fixed selector index $a$, partition into the events $N_a = c 2^k$, $c in F$, $k gt.eq a$, choosing one representation when a length has more than one. Given $V$, write their probabilities as $p_(k \, c) \( V \)$. On one such event of probability $p > 0$, the conditional spatial law of any two groups, and of each single group, is unchanged. Indeed the event is determined by $V \, x_0$, which is independent of any proper set of groups by (4.1). The full three-group law may change. Its density $rho$ relative to the product law satisfies
  #[#set math.equation(numbering: n => "(4.3)")
   $ 0 lt.eq p rho lt.eq 1 \, #h(2em) integral p rho = p \, #h(2em) lr(bar.v.double p rho bar.v.double)_2 lt.eq sqrt(p) . $ <eq:channel-density>]
  The reason is that the joint measure of the outputs and the event is dominated by the unconditioned product measure. These statements hold for almost every $V$; the length events are countable.
  We choose the rank bound to meet two requirements: the packing bound must be $o \( m \)$, and the reciprocal bounds must be summable over dyadic length scales. For $m = floor.l c 2^k \/ h floor.r$ set
  #[#set math.equation(numbering: n => "(4.4)")
   $ d_m = ⌈\( 1 + log m \)^(3 \/ 2)⌉ \, #h(2em) z_l = u_l ⊗ v_l quad \( 0 lt.eq l < m \) . $ <eq:channel-dimension>]
  Let $Pi_m$ be the orthogonal projection onto up to $d_m$ leading eigenvectors of the positive covariance operator $sum_(l < m) z_l z_l^(*)$, taking its full range if its rank is smaller. Fix $0 < epsilon lt.eq 1$ and then fix $0 < eta lt.eq epsilon^2 \/ 10^4$ in the preceding graph bound. Theorem 21, proved in Appendix 7 from #cite(label("FourfoldCompanion")) Theorem 4.1, gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ 1 / m sum_(l < m) lr(bar.v.double Pi_m z_l bar.v.double) lt.eq epsilon + o \( 1 \) . $ <eq:channel-projected-average>]
  Here the error tends to zero uniformly over the offset patterns. Indeed, after the fixed initial indices are removed, the number of projection norms at least $epsilon$ is at most
  $ C \( 1 + L_0 \) epsilon^(- 2) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C epsilon^(- 2) sqrt(d_m) log \( 2 + d_m \) #scale(x: 120%, y: 120%)[\)] = o \( m \) . $
  The removed indices contribute $o \( 1 \)$ to the average. Importantly, $epsilon \, eta$, and the resulting exceptional degree are fixed before $m$ tends to infinity.
  For the projected terms, Cauchy–Schwarz under the conditional event law uses its unchanged two-group and one-group marginals. Term by term, including the event probability, it gives
  $ lr(|p integral \( Pi_m z_l \) \( omega_1 \, omega_2 \) w_l \( omega_3 \) rho \( omega \) thin d omega|) lt.eq p lr(bar.v.double Pi_m z_l bar.v.double)_2 lr(bar.v.double w_l bar.v.double)_2 lt.eq p lr(bar.v.double Pi_m z_l bar.v.double)_2 . $
  Thus their average contributes at most $p \( epsilon + o \( 1 \) \)$.
  For the residual vectors $z'_l = \( 1 - Pi_m \) z_l$, let $A = \( chevron.l z'_l \, z'_(l') chevron.r \)_(l \, l' < m)$ and $B = \( chevron.l w_l \, w_(l') chevron.r \)_(l \, l' < m)$. The covariance trace is at most $m$, so its remaining eigenvalues, and hence the nonzero eigenvalues of $A$, are at most $m \/ d_m$. If its rank was at most $d_m$, the residual is zero. Also $B$ is positive semidefinite with trace at most $m$. Consequently
  $ ∥1 / m sum_(l < m) z'_l ⊗ w_l∥^2 = frac("tr" \( A B \), m^2) lt.eq 1 / d_m . $
  By (4.3), the residual contribution, including the event probability, is at most $sqrt(p \/ d_m)$. Multiplication by the fixed phase weight does not increase either bound.
  ===== 4.5 Summing over lengths. <summing-over-lengths.>
  Write $m \( k \, c \) = floor.l c 2^k \/ h floor.r$. For fixed $h$ this is comparable to $2^k$ for all sufficiently large $k$, uniformly in the finite set $F$. Since $sum_(k \, c) p_(k \, c) \( V \) = 1$, Cauchy–Schwarz yields
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(k gt.eq a \, med c in F) sqrt(frac(p_(k \, c) \( V \), d_(m \( k \, c \)))) lt.eq (sum_(k gt.eq a \, med c in F) 1 / d_(m \( k \, c \)))^(1 \/ 2) arrow.r 0 . $ <eq:channel-residual-sum>]
  The series converges because its summands are $O \( k^(- 3 \/ 2) \)$. The projected contributions have total limit superior at most $epsilon$, by (4.5) and the same probability identity. These estimates are uniform in $V \, s$ and may be integrated. There is no measurable-choice issue for the projections: choose one for each of the countably many sizes and finitely many offset patterns. Letting $a$ tend to infinity in the selected-law formula and then letting $epsilon$ tend to zero proves the required vanishing. Both laws in (4.1) follow. ◻
]

#thm([Corollary 4.4.])[
  #emph[For every channel $Y$, the copied spatial list $\( d_Y \( y_i \) \)_(i in I)$ under $lambda_Y$ has its full product law conditional on $P = \( omega_Y \( y_i \) \)_(i in I)$.]
] <cor:channel-copied-law>

#proof[
  Apply Proposition 14 and Lemma 13 to $sans(M)_b \( Y \)$. By Lemma 10, the old parameter array $P$ belongs to its maximal distal factor. Conditioning the resulting constant product law down to $P$ proves the assertion. ◻
]

== 5 Minimal correlations and saturated extensions <sec:correlations>

The positive correlation in (3.14) records the assumed pointwise failure. We continue the channel-and-saturation argument of #cite(label("FourfoldCompanion")) Sections 5–6, with an additional minimum-support choice. We choose such a correlation with the fewest possible spatial slots. This choice supplies the product laws for proper subcollections that a pointwise theorem of greater length would otherwise have to provide. Among correlations of this minimum size, we maximize the number of slots that use only outputs. The final section will increase that number and obtain a contradiction.

=== 5.1 Spatial roles and minimum support <spatial-roles-and-minimum-support>

Let $Y$ be any channel. At a slot $i in I$, we allow either of the following spatial lists:

$ L_i \( y_i \) & = d_Y \( y_i \) &  & upright("(an output role)") \,\
L_i \( y_i \) & = \( x_0 \( y_i \) \, d_(Y \, H_i) \( y_i \) \) \, #h(2em) H_i subset.neq { 1 \, 2 \, 3 } &  & upright("(an input role)") . $

An input role may therefore read the original coordinate jointly with outputs from any proper subset of the three groups. This allowance is important: later, regrouping outputs will produce precisely these joint lists. A test may ignore some entries of its designated list.

For a nonempty set $J subset.eq I$, designate one role at each $i in J$. Choose bounded real functions $h_i$ of the corresponding lists, centered for their product spatial laws. By Lemma 13, $h_i \( L_i \)$ also has conditional mean zero over $W_Y$. We consider correlations

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E)_(lambda_Y) [Phi \( P \) product_(i in J) h_i \( L_i \( y_i \) \)] \, $ <eq:role-correlation>]

where $Phi$ is any bounded real function of the full distal parameter array $P = \( omega_Y \( y_i \) \)_(i in I)$. The channel $C$, with no outputs, has a nonzero correlation of this form by Lemma 11.

Let $k$ be the minimum of $\| J \|$ among all nonzero correlations (5.1), over all channels and all such data. The small-slot law (3.10) gives $k gt.eq 4$: when $\| J \| lt.eq 3$, the conditional expectation of the product given $P$ is the product of the conditional means, all zero. Thus $n < 4$ already contradicts the assumed failure. In what follows $4 lt.eq k lt.eq n$.

#thm([Lemma 5.1.])[
  (Product laws below the minimum support).  #emph[On any channel, choose fewer than $k$ distinct slots and designate one allowed spatial list at each. Under its selected law, these lists, jointly, have their product spatial law conditional on the full distal parameter array.]
] <lem:minimum-product>

#proof[
  Test the conditional law by a product of bounded real functions, one for each designated list, and by a bounded real function of the full parameter array. Write each spatial test as its product-law mean plus a centered function. Every nonconstant term in the expansion is a correlation of the form (5.1) with fewer than $k$ slots, and hence vanishes. Only the product of the means remains. Product tests determine the asserted conditional law on these finite products of standard spaces. ◻
]

Among the nonzero correlations with support size $k$, let $r$ be the largest number of output roles. Corollary 15 implies $r < k$, because the full copied output collection has product spatial law given $P$. Choose a channel and a correlation attaining these two extremal values. We next pass to an extension on which conditioning on the parameters, or on the parameters and one slot, cannot be improved by any further extension.

=== 5.2 Saturating the parameter and single-slot data <saturating-the-parameter-and-single-slot-data>

For any flow $Y$ over $C$, define sub-$sigma$-algebras of the selected law space $\( Y^I \, lambda_Y \)$ by

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(D)_0 \( Y \) = sigma \( P \) \, #h(2em) cal(D)_i \( Y \) = sigma \( P \, y_i \) quad \( i in I \) . $ <eq:data-algebras>]

If $rho : Y' arrow.r Y$ is a flow extension over $C$, functoriality gives $\( rho^I \)_(*) lambda_(Y') = lambda_Y$. The pullback of $W_Y$ is a distal factor of $Y'$, so is contained in $W_(Y')$. Consequently the pullback of each $cal(D)_l \( Y \)$ is contained in $cal(D)_l \( Y' \)$.

#thm([Lemma 5.2.])[
  (Simultaneous saturation).  #emph[Every standard flow $Y$ over $C$ has a standard flow extension $Y_(*) arrow.r Y$ over $C$ with the following property. For every further standard flow extension $rho : Y' arrow.r Y_(*)$ over $C$, every $f in L^2 \( lambda_(Y_(*)) \)$, and every $l in { 0 } union I$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E)_(lambda_(Y')) \[ f compose rho^I divides cal(D)_l \( Y' \) \] = bb(E)_(lambda_(Y_(*))) \[ f divides cal(D)_l \( Y_(*) \) \] compose rho^I . $ <eq:saturation>]

]
] <lem:saturation>

#proof[
  We use a countable bounded-energy construction of the kind underlying Austin’s sated extensions #cite(label("Austin2015")) Theorem 3.11; the argument below proves the assertion for the particular data (5.2). In a tower of flow extensions, for a fixed test $f$ introduced at one stage, the quantity
  $ ∥bb(E) \[ f divides cal(D)_l \]∥_2^2 $
  at later stages is nondecreasing, by inclusion of the pulled-back data, and is bounded by $parallel f parallel_2^2$. At each stage introduce a countable dense set in the $L^2$ space of its selected law, retaining all previously introduced tests. Schedule all pairs consisting of a retained test and a datum index so that each pair is treated infinitely often, with positive tolerances tending to zero. A diagonal enumeration gives such a schedule even though new tests are introduced at every stage.
  At a scheduled step, extend the current flow so that the corresponding energy is within the prescribed tolerance of its supremum over all standard flow extensions of that stage over $C$. The supremum is finite. It can be taken over a set: standard Borel spaces, their probability laws, Borel actions, and factor maps admit codes on fixed standard spaces. The identity extension is among the competitors. Let $Y_(*)$ be the countable inverse limit of the resulting tower, which exists in our category by Proposition 8.
  Fix a retained test, an index $l$, and a further extension $Y' arrow.r Y_(*)$. At every scheduled optimization of this pair, $Y'$ is also an extension of the stage just before the optimization. Its energy is therefore at most the energy achieved immediately after that optimization plus its tolerance. The latter achieved energy is at most the energy at $Y_(*)$. As the tolerances tend to zero, the energy at $Y'$ is at most that at $Y_(*)$. The reverse inequality follows from monotonicity, so the two energies are equal.
  Identify $L^2 \( lambda_(Y_(*)) \)$ with its pullback in $L^2 \( lambda_(Y') \)$. The two conditional expectations are orthogonal projections onto nested closed subspaces. Equality of their squared norms forces equality of the projections, proving (5.3) for each retained test. Stage functions have dense span in $L^2 \( lambda_(Y_(*)) \)$ by Proposition 8; the retained dense sets and the contraction property of conditional expectation extend the identity to every $f$ in that space. ◻
]

Apply Lemma 17 to the chosen channel. Pulling back its data preserves the channel laws by Lemma 13, and preserves its nonzero correlation by functoriality. Its old parameter test is a function of the enlarged distal parameters. We henceforth call this saturated channel $Y$. Write $J$ for its support, $A subset J$ for its output roles, and choose

$ b in J \\ A \, #h(2em) \| J \| = k \, quad \| A \| = r . $

Thus the role at $b$ is an input role. The purpose of the remaining construction is to turn it into an output role while keeping a nonzero correlation on the same $k$ slots.

=== 5.3 Regrouping the other slots as outputs <regrouping-the-other-slots-as-outputs>

Set $Z = sans(M)_b \( Y \)$. Its state is $\( y_j \)_(j in I)$, its law is $m_Z = lambda_Y$, and projection to $y_b$ is a flow factor $Z arrow.r Y$. We give $Z$ a channel structure different from the full-copy structure of Proposition 14. Retain all old outputs from slot $b$ with their original group numbers. For each $j in J \\ { b }$, also include the $C$-valued factors whose spatial coordinates form

$ Q_j = L_j \( y_j \) . $

These are old output factors and, when the role at $j$ is an input role, the original factor $pi_Y \( y_j \)$. Choose a surjection

$ tau : J \\ { b } arrow.r { 1 \, 2 \, 3 } \, $

possible because $k gt.eq 4$, and put the entire list $Q_j$ in new group $tau \( j \)$. Every new output has the correct marginal and a positive rational speed: the old speed at slot $j$ is multiplied by $j \/ b$.

#thm([Lemma 5.3.])[
  (The regrouped channel).  #emph[The preceding output lists and groups make $Z$ a channel over its original factor $pi_Y \( y_b \)$.]
] <lem:regrouped-channel>

#proof[
  We prove both channel laws conditional on the old full parameter array $P$ on $\( Y^I \, lambda_Y \)$. Every phase in the new channel is a function of $P$, so conditioning down then proves (4.1) for $Z$.
  For the full output collection, its spatial lists are
  $ d_Y \( y_b \) \, #h(2em) Q_j quad \( j in J \\ { b } \) . $
  These are allowed lists at $k$ distinct old slots. Expand a product of tests on these lists into constant and centered parts. Every term with fewer than $k$ centered factors has the product-law value by Lemma 16. The all-centered term also vanishes against every bounded parameter test. Otherwise it would give a nonzero correlation with support $k$ and $r + 1$ output roles: slot $b$ now has an output role, and the other roles are unchanged. This contradicts the definition of $r$. If the output list at $b$ is empty, its centered test is identically zero, with the same conclusion. Thus the full output collection has product spatial law given $P$.
  For the second channel law, choose a proper subset $H subset.neq { 1 \, 2 \, 3 }$ of the new groups and include $x_0 \( y_b \)$. At slot $b$ the resulting list is $\( x_0 \( y_b \) \, d_(Y \, H) \( y_b \) \)$, an allowed input list. At any other retained slot $j$ it is exactly $Q_j$, and such a slot occurs only when $tau \( j \) in H$. Surjectivity of $tau$ omits at least one of the $k - 1$ other slots. Fewer than $k$ old slots therefore occur, so Lemma 16 gives the required product law conditional on $P$. This proves the second channel law as well. ◻
]

== 6 The square argument <sec:square>

We now use the saturated channel $Y$, its nonzero correlation (5.1), and the regrouped channel $Z = sans(M)_b \( Y \)$ from Section 5. The selected law $lambda_Z$ is a law on an ordered square of $Y$-states. Its $b$th row and $b$th column both have law $lambda_Y$, but for different reasons. Saturation will relate their correlations without requiring any symmetry of the square or any pointwise theorem for many slots on an arbitrary extension.

=== 6.1 A common corner and two conditional expectations <a-common-corner-and-two-conditional-expectations>

On $\( Y^I \, lambda_Y \)$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ q \( \( y_i \)_(i in I) \) = product_(j in J \\ { b }) h_j \( L_j \( y_j \) \) \, #h(2em) g \( P \, y_b \) = bb(E)_(lambda_Y) \[ q divides P \, y_b \] . $ <eq:q-and-g>]

The function $g$ is not zero in $L^2 \( lambda_Y \)$: otherwise the nonzero correlation would vanish after conditioning on $\( P \, y_b \)$. On the same state space regarded as $Z$, the function $q$ reads only the newly added outputs. Write $e = omega_Z \( z \)$ for the new distal parameter and define

#[#set math.equation(numbering: n => "(6.2)")
 $ u \( e \, y_b \) = bb(E)_(m_Z) \[ q divides e \, y_b \] . $ <eq:u>]

All these functions have bounded real Borel versions.

By Lemma 10, the old array $P$ is a factor of the new distal parameter. Write

$ R \( e \) = P \, #h(2em) kappa \( e \) = R \( e \)_b . $

Thus $kappa compose omega_Z$ is the old distal parameter of the slot-$b$ factor $Z arrow.r Y$.

A point of the selected law space $\( Z^I \, lambda_Z \)$ has the form

$ upright(bold(z))_i = \( y_(i j) \)_(j in I) \, #h(2em) E_i = omega_Z \( upright(bold(z))_i \) \, #h(2em) E = \( E_i \)_(i in I) . $

The first index specifies the row. Define the column states and their parameters by

#[#set math.equation(numbering: n => "(6.3)")
 $ y_i = y_(i b) \, #h(2em) p = \( kappa \( E_i \) \)_(i in I) \, #h(2em) w = kappa \( E_b \) . $ <eq:square-parameters>]

In particular $y_b = y_(b b)$ is the common corner. The column $\( y_i \)_(i in I)$ has law $lambda_Y$, by functoriality for $Z arrow.r Y$. The row $upright(bold(z))_b$ also has law $lambda_Y$, because the one-slot marginal of $lambda_Z$ is $m_Z = lambda_Y$. Figure 1 records these distinct identifications.

#figure(
  [
$ & 1 & dots.h.c & b & dots.h.c & n & upright("row parameter")\
1 & y_11 & dots.h.c & y_(1 b) & dots.h.c & y_(1 n) & E_1\
dots.v & dots.v &  & dots.v &  & dots.v & dots.v\
b & y_(b 1) & dots.h.c & y_(b b) & dots.h.c & y_(b n) & E_b\
dots.v & dots.v &  & dots.v &  & dots.v & dots.v\
n & y_(n 1) & dots.h.c & y_(n b) & dots.h.c & y_(n n) & E_n $

 
$ underbrace(upright(bold(z))_b = \( y_(b j) \)_(j in I), upright("row ") b : upright(" old parameters ") R \( E_b \)) #h(2em) underbrace(\( y_(i b) \)_(i in I), upright("column ") b : upright(" old parameters ") p) #h(2em) w = p_b = R \( E_b \)_b . $

],
  caption: [Figure 1: The ordered square under $lambda_Z$. The highlighted row and column meet at $y_(b b)$, whose old distal parameter is $w$. Both have law $lambda_Y$: the row by the single-slot marginal, the column by the factor map $Z arrow.r Y$. No invariance under transposition is asserted. ],
) <fig:square>

#thm([Lemma 6.1.])[
  (The row–column identity).  #emph[Under $lambda_Z$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] q \( \( y_i \)_i \) q \( upright(bold(z))_b \) divides E #scale(x: 120%, y: 120%)[\]] = integral_Y g \( p \, y \) u \( E_b \, y \) thin thin d m_(Y \, w) \( y \) . $ <eq:row-column>]

 Moreover, in a single $Z$-state with law $m_Z$, the conditional law of its slot-$b$ state given $e$ is $m_(Y \, kappa \( e \))$.]
] <lem:row-column>

#proof[
  Apply saturation (5.3) with datum index $0$ to the extension $Z arrow.r Y$. It says that the conditional law of the entire column given $E$ is the law of $\( Y^I \, lambda_Y \)$ given $p$. This assertion follows first for $L^2$ tests, and then as an identity of conditional kernels by a countable determining class. By the singleton case of (3.10), the conditional law of $y_b$ given $E$ is consequently $m_(Y \, w)$. Conditioning down to $E_b$ gives the same law for the slot-$b$ state of row $b$ given $E_b$. Since row $b$ has marginal $m_Z$, this proves the last assertion of the lemma.
  Saturation with datum index $b$ gives the stronger identity
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(E)_(lambda_Z) \[ q \( \( y_i \)_i \) divides E \, upright(bold(z))_b \] = g \( p \, y_b \) . $ <eq:column-single-row>]
  Indeed the old datum is $\( P \, y_b \)$ and the new datum is $\( E \, upright(bold(z))_b \)$. Multiply (6.5) by $q \( upright(bold(z))_b \)$ and condition on $E$. The singleton case of (3.10), now for $Z$, states that the law of $upright(bold(z))_b$ given $E$ is the $m_Z$-fibre law over $E_b$. Within that fibre, (6.2) conditions $q \( upright(bold(z))_b \)$ on its slot-$b$ state, whose law is $m_(Y \, w)$ by the first part of the proof. This gives (6.4). ◻
]

=== 6.2 Independence of the two parameter descriptions <independence-of-the-two-parameter-descriptions>

The integral in (6.4) pairs a column function with a row function. Its nonvanishing will follow from the fact that, apart from the parameter at their common corner, the two parameter descriptions are independent.

#thm([Lemma 6.2.])[
  (Parameter independence).  #emph[Under $lambda_Z$, the random variables $p$ and $E_b$ are conditionally independent given $w$.]
] <lem:parameter-independence>

#proof[
  Let $F_0$ be a bounded real test on $W_Z$. In the single-state parameter law $\( omega_Z \)_(*) m_Z$, let $overline(F)_0$ satisfy
  $ overline(F)_0 \( kappa \( e \) \) = bb(E) \[ F_0 \( e \) divides kappa \( e \) \] . $
  We prove that $F_0 \( E_b \)$ can be replaced by $overline(F)_0 \( w \)$ when tested against any product $product_i H_i \( p_i \)$ of bounded real coordinate tests. All the variables are functions of $E$, so the deterministic parameter-law identity (3.9) on $Z$ computes their joint integral. At each fixed averaging time $t$, its state integral is
  $ integral_Z F_0 \( omega_Z \( S_Z^(b t) z \) \) product_(i in I) H_i #scale(x: 120%, y: 120%)[\(] kappa \( omega_Z \( S_Z^(i t) z \) \) #scale(x: 120%, y: 120%)[\)] thin thin d m_Z \( z \) . $
  Make the measure-preserving change of variable $z' = S_Z^(b t) z$. The product of the $H_i$ becomes
  $ product_(i in I) H_i #scale(x: 120%, y: 120%)[\(] kappa \( omega_Z \( S_Z^(\( i - b \) t) z' \) \) #scale(x: 120%, y: 120%)[\)] . $
  For each fixed $t$, this is measurable with respect to $kappa \( omega_Z \( z' \) \)$. To see this, the slot-$b$ map $Z arrow.r Y$ is a flow factor, and the old factor $W_Y$ is preserved by every flow time. Hence the old parameter at time $\( i - b \) t$ is a measurable function of the old parameter at time zero.
  Conditional expectation in this single-state integral therefore replaces the first factor by
  $ overline(F)_0 #scale(x: 120%, y: 120%)[\(] kappa \( omega_Z \( z' \) \) #scale(x: 120%, y: 120%)[\)] . $
  Reversing the change of variable and taking the deterministic averaging limit gives
  $ bb(E)_(lambda_Z) [F_0 \( E_b \) product_i H_i \( p_i \)] = bb(E)_(lambda_Z) [overline(F)_0 \( w \) product_i H_i \( p_i \)] . $
  The fixed-time identities suffice under the time integral by measurability and Fubini; no simultaneous pointwise model for the factor action is needed. The $E_b$-marginal is the single-state parameter law, so $overline(F)_0 \( w \) = bb(E) \[ F_0 \( E_b \) divides w \]$. Products of the $H_i$ determine the $p$-law, and $w = p_b$ is itself a coordinate of $p$. The displayed identity is exactly conditional independence given $w$. ◻
]

=== 6.3 Why the pairing cannot vanish <why-the-pairing-cannot-vanish>

Let $alpha_w$ be the conditional law of the column parameter array $p$ over its $b$th parameter $w$. Let $beta_w$ be the conditional law of $E_b$ over $w$. These are regular conditional laws on standard spaces. Lemma 20 gives

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(L) \( p \, E_b divides w \) = alpha_w ⊗ beta_w \, #h(2em) R_(*) beta_w = alpha_w . $ <eq:parameter-disintegrations>]

The second identity uses the row marginal $m_Z = lambda_Y$: its old full parameter array $R \( e \)$ has the same law as the column parameter array, with the same distinguished $b$th coordinate.

For almost every $w$, work in the separable real Hilbert space

$ cal(H)_w = L^2 \( m_(Y \, w) \; bb(R) \) . $

The bounded functions $g \( p \, dot.op \)$ and $u \( e \, dot.op \)$ define square-integrable random vectors in this space, with laws of their parameters respectively $alpha_w$ and $beta_w$. There is no measurability ambiguity in this fibrewise assertion. Bounded Borel versions of $g$ and $u$ are fixed; disintegration and Fubini yield their sections for almost every $w$. A countable generating algebra of the standard Borel space $Y$ has rational simple span dense in every $L^2 \( m_(Y \, w) \)$. Tests against that span give weak measurability of the sections, and separability gives strong measurability.

The conditional mean of the second random vector recovers the first:

#[#set math.equation(numbering: n => "(6.7)")
 $ bb(E)_(beta_w) \[ u \( e \, dot.op \) divides R \( e \) \] = g \( R \( e \) \, dot.op \) quad upright("in ") cal(H)_w . $ <eq:fibre-tower>]

Here is the conditional-law justification. In a single $Z$-state, write $y$ for its slot-$b$ state. Lemma 19 gives, conditional on $w$,

$ cal(L) \( e \, y divides w \) = beta_w \( thin d e \) m_(Y \, w) \( thin d y \) . $

Conditioning (6.2) down on $\( R \( e \) \, y \)$ gives $g \( R \( e \) \, y \)$ by (6.1), because $m_Z = lambda_Y$. Under the preceding product law, conditioning $e$ on $\( R \( e \) \, y \)$ is the same as conditioning it on $R \( e \)$. This proves (6.7). One can impose the scalar conditional identities first for countably many generating tests and then use Fubini and density to obtain the stated Hilbert-space identity for almost every $w$.

Suppose that the right side of (6.4) vanished almost surely. By (6.6), for almost every $w$ this would give

$ chevron.l g \( p \, dot.op \) \, u \( e \, dot.op \) chevron.r_(cal(H)_w) = 0 quad \( alpha_w ⊗ beta_w \) upright("-almost surely") . $

Condition on $R \( e \) = p'$ and use (6.7). We obtain

#[#set math.equation(numbering: n => "(6.8)")
 $ chevron.l g \( p \, dot.op \) \, g \( p' \, dot.op \) chevron.r_(cal(H)_w) = 0 quad \( alpha_w ⊗ alpha_w \) upright("-almost surely") . $ <eq:independent-orthogonality>]

A square-integrable random vector in a separable real Hilbert space cannot be orthogonal almost surely to an independent copy unless it vanishes almost surely. Indeed, otherwise its norm is at least some $epsilon.alt > 0$ with positive probability. By a countable cover with balls of radius $epsilon.alt \/ 4$, this event has positive probability in one such ball. Two independent copies then have positive probability of both lying in that ball and having norm at least $epsilon.alt$. Their distance is less than $epsilon.alt \/ 2$, so

$ chevron.l v \, v' chevron.r = 1 / 2 \( parallel v parallel^2 + parallel v' parallel^2 - parallel v - v' parallel^2 \) > 0 \, $

a contradiction. Apply this observation to (6.8). It forces $g \( p \, dot.op \) = 0$ for $alpha_w$-almost every $p$, for almost every $w$. The singleton conditional law for the column then implies $g \( P \, y_b \) = 0$ in $L^2 \( lambda_Y \)$, contrary to (6.1). Thus (6.4) does not vanish almost surely.

=== 6.4 Increasing the number of output roles <increasing-the-number-of-output-roles>

Choose a bounded real function $Theta \( E \)$ that detects the nonzero conditional expectation in (6.4); its sign is one such choice. Then

#[#set math.equation(numbering: n => "(6.9)")
 $ bb(E)_(lambda_Z) [Theta \( E \) q \( \( y_i \)_i \) q \( upright(bold(z))_b \)] eq.not 0 . $ <eq:improved-correlation>]

We interpret this as a correlation on the regrouped channel $Z$. For $i in J \\ { b }$, the factor $h_i \( L_i \( y_(i b) \) \)$ retains its old role. An old output role uses only the retained outputs from slot $b$. An old input role uses the new original coordinate and retained outputs from its old proper subset $H_i$ of group numbers. It may ignore the additional outputs in those groups. Each such test is centered for its new product spatial law, since its marginal on the coordinates it actually uses is the old product law.

At row $b$, the factor $q \( upright(bold(z))_b \)$ reads only the added outputs with spatial lists $Q_j$, $j in J \\ { b }$, and thus has an output role. It is centered: under the product spatial law of all new outputs these lists are independent product lists, so the mean of this product of centered tests is zero. Hence (6.9) is a nonzero correlation of support size $k$ with $r + 1$ output roles. This contradicts the maximal choice of $r$.

#proof[
  #emph[Completion of the proof of Theorem 1.] If the required pointwise limit failed for a fixed tuple and a fixed $n gt.eq 2$, the reduction and selectors of Section 3 would give the positive correlation (3.14). The minimum-support argument rules this out immediately when $n < 4$, and the saturated, regrouped square argument rules it out when $n gt.eq 4$. Therefore the averages converge almost everywhere to the product of the means, along all positive integer lengths. Finally, the countable-coordinate coding reduction pulls this conclusion back to the original, possibly nonstandard, probability space. The tuple and $n$ were fixed throughout, as allowed in the statement of the theorem. ◻
]

== 7 Tensor packing <sec:packing>

The closure proof uses a deterministic fact: a subspace of moderately growing dimension captures a substantial part of only a small fraction of an almost orthogonal tensor family. We reproduce the argument of #cite(label("FourfoldCompanion")) Theorem 4.1, with the same quantitative estimate. Throughout this appendix, Hilbert spaces are real, tensor products are Hilbert tensor products, and logarithms are natural.

#thm([Theorem 7.1.])[
  (Tensor packing).  #emph[There is a universal constant $C$ with the following property. Let $0 < epsilon lt.eq 1$, and let $d gt.eq 1$ and $L gt.eq 0$ be integers. Let $x_1 \, dots.h \, x_m$ and $y_1 \, dots.h \, y_m$ lie in the unit balls of real Hilbert spaces $H_1 \, H_2$. For each family suppose that a graph on ${ 1 \, dots.h \, m }$ of maximum degree at most $L$ contains every off-diagonal pair whose absolute inner product exceeds $eta$, where 
$ 0 lt.eq eta lt.eq epsilon^2 \/ 10^4 . $

 The two exceptional graphs may differ. For every orthogonal projection $P$ on $H_1 ⊗ H_2$ of rank at most $d$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ \# { j : lr(bar.v.double P \( x_j ⊗ y_j \) bar.v.double) gt.eq epsilon } lt.eq C \( 1 + L \) epsilon^(- 2) exp #h(-0.16667em) (C epsilon^(- 2) sqrt(d) log \( 2 + d \)) . $ <eq:packing-quantitative>]

 For $d = d_m$ as defined in (4.4), this is $o_(epsilon \, L) \( m \)$, uniformly over the Hilbert spaces, vectors, projections, and allowed values of $eta$.]
] <thm:packing>

The proof separates directions on which the testing space has large variance and applies Gaussian comparison to the remaining directions. The comparison is the finite Sudakov–Fernique inequality; see #cite(label("Fernique1974")) Section 1, Equation (1.2) and #cite(label("Sudakov1971")). The following matrix estimate uses the Gaussian integration-by-parts moment argument behind matrix Khintchine inequalities; compare #cite(label("Tropp2018")) Lemma 6.1 and Proposition 7.3. We include its proof to retain dependence on the covariance trace, rather than on the ambient dimensions.

#thm([Lemma 7.2.])[
  (Gaussian matrix estimate).  #emph[Let $B_1 \, dots.h \, B_r$ be matrices between two finite-dimensional real Hilbert spaces, and put 
$ H_j = mat(delim: "(", 0, B_j; B_j^(*), 0) \, #h(2em) S = sum_(j = 1)^r H_j^2 . $

 If $lr(bar.v.double S bar.v.double)_(upright("op")) lt.eq sqrt(d)$ and $"tr" S lt.eq 2 d$ for some $d gt.eq 1$, then for independent standard normal variables $g_j$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E) ∥sum_(j = 1)^r g_j B_j∥_(upright("op")) lt.eq C d^(1 \/ 4) sqrt(log \( 2 + d \)) . $ <eq:packing-gaussian-bound>]

 The constant is independent of the dimensions of the two spaces.]
] <lem:packing-gaussian>

#proof[
  Write $H = sum_j g_j H_j$. Gaussian integration by parts, followed by differentiation of the matrix power, gives for every integer $q gt.eq 2$
  $ bb(E) "tr" H^(2 q) = sum_(j = 1)^r sum_(a = 0)^(2 q - 2) bb(E) "tr" \( H_j H^a H_j H^(2 q - 2 - a) \) . $
  For a fixed self-adjoint $H$ with eigenvalues $lambda_u$ and a self-adjoint matrix $K$, the absolute value of such a trace is at most
  $ sum_(u \, v) \| K_(u v) \|^2 \| lambda_v \|^a \| lambda_u \|^(2 q - 2 - a) lt.eq "tr" \( K^2 \| H \|^(2 q - 2) \) . $
  The inequality follows from weighted arithmetic–geometric mean and the symmetry $\| K_(u v) \| = \| K_(v u) \|$. Summing over $j$ gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ bb(E) "tr" H^(2 q) lt.eq \( 2 q - 1 \) lr(bar.v.double S bar.v.double)_(upright("op")) bb(E) "tr" \| H \|^(2 q - 2) . $ <eq:packing-moment-recursion>]
  Since $bb(E) "tr" H^2 = "tr" S$, iteration yields
  $ bb(E) "tr" H^(2 q) lt.eq \( 2 q - 1 \) ! ! thin lr(bar.v.double S bar.v.double)_(upright("op"))^(q - 1) "tr" S . $
  The operator norm of $H$ equals that of $sum_j g_j B_j$. Taking a $2 q$-th root and using the hypotheses bounds its expectation by
  $ C sqrt(q) thin d^(1 \/ 4) \( 2 sqrt(d) \)^(1 \/ \( 2 q \)) . $
  Choose an integer $q gt.eq 2$ comparable to $log \( 2 + d \)$ to obtain (7.2). ◻
]

#proof[
  We first record an elementary consequence of the exceptional-graph hypothesis. If unit-ball vectors $v_j$ have absolute inner products at most $eta$ outside a graph of degree $L$, then for every nonempty set $A$ of indices,
  #[#set math.equation(numbering: n => "(7.4)")
   $ ∥frac(1, \| A \|) sum_(j in A) v_j∥^2 lt.eq frac(1 + L, \| A \|) + eta . $ <eq:packing-cluster>]
  Indeed the expansion contains at most $\( 1 + L \) \| A \|$ ordered diagonal or exceptional pairs. A lower bound on the norm of an average therefore bounds the number of vectors in that average.
  It suffices to work in the finite spans of the $x_j$ and $y_j$. To see this, let $Q$ project onto their tensor product and replace the testing subspace $"Ran" P$ by $Q \( "Ran" P \)$. For any vector $z$ in that tensor product, the norm of its projection onto the new subspace is at least $lr(bar.v.double P z bar.v.double)$: in the supremum defining $lr(bar.v.double P z bar.v.double)$, replace each unit testing vector by its $Q$-image, whose norm is at most one and whose pairing with $z$ is unchanged. The dimension does not increase.
  Identify tensors with matrices from $H_2$ to $H_1$. Choose a Hilbert–Schmidt orthonormal basis $A_1 \, dots.h \, A_r$ of the testing space, where $r lt.eq d$. The matrices
  $ R_1 = sum_j A_j A_j^(*) \, #h(2em) R_2 = sum_j A_j^(*) A_j $
  have trace $r$. Let $E_1 \, E_2$ be their spectral subspaces for eigenvalues strictly greater than $sqrt(d)$; each has dimension at most $sqrt(d)$.
  Discard indices for which the projection of $x_j$ onto $E_1$ has norm greater than $epsilon \/ 10$, and do the same for $y_j \, E_2$. Cover either exceptional subspace’s unit ball by at most $\( 1 + 80 \/ epsilon \)^(sqrt(d))$ balls of radius $epsilon \/ 40$. If one ball contains $s$ of the discarded projections, their average has norm at least $epsilon \/ 20$. Applying (7.4) to the original vectors, with $eta lt.eq epsilon^2 \/ 10^4$, gives $s lt.eq C \( 1 + L \) epsilon^(- 2)$. The number of discarded indices is therefore at most
  #[#set math.equation(numbering: n => "(7.5)")
   $ C \( 1 + L \) epsilon^(- 2) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] sqrt(d) log \( 1 + 80 \/ epsilon \) #scale(x: 120%, y: 120%)[\)] . $ <eq:packing-discarded>]
  Let $Q_1 \, Q_2$ project onto $E_1^perp \, E_2^perp$, and put $B_j = Q_1 A_j Q_2$. The coefficient map $z mapsto \( chevron.l A_j \, z chevron.r_(upright("HS")) \)_(j = 1)^r$ is a contraction. For a remaining index,
  $ lr(bar.v.double x_j ⊗ y_j - Q_1 x_j ⊗ Q_2 y_j bar.v.double) lt.eq lr(bar.v.double \( 1 - Q_1 \) x_j bar.v.double) + lr(bar.v.double \( 1 - Q_2 \) y_j bar.v.double) lt.eq epsilon \/ 5 . $
  Thus each remaining index counted in (7.1) has coefficient vector
  $ v_j = \( chevron.l x_j \, B_a y_j chevron.r \)_(a = 1)^r \, #h(2em) lr(bar.v.double v_j bar.v.double) gt.eq epsilon \/ 2 . $
  The map from $x_j ⊗ y_j$ to $v_j$ remains contractive. Outside the union of the two exceptional graphs, the tensor inner products have absolute value at most $eta^2$, and that union has degree at most $2 L$. A collection of these coefficient vectors in a ball of radius $epsilon \/ 8$ centered at one of them has average norm at least $3 epsilon \/ 8$. Applying (7.4) to its preimage tensors bounds its size by $C \( 1 + L \) epsilon^(- 2)$. A maximal $epsilon \/ 8$-separated subset therefore has cardinality $l$ such that the number of indices still to be counted is at most $C \( 1 + L \) epsilon^(- 2) l$.
  We now bound this separated set. For $G = sum_a g_a B_a$, the centered Gaussian variables $Z_j = chevron.l x_j \, G y_j chevron.r$ satisfy
  $ bb(E) \| Z_j - Z_(j') \|^2 = lr(bar.v.double v_j - v_(j') bar.v.double)^2 . $
  Gaussian comparison gives, when $l gt.eq 2$,
  #[#set math.equation(numbering: n => "(7.6)")
   $ c epsilon sqrt(log l) lt.eq bb(E) max_j Z_j lt.eq bb(E) lr(bar.v.double G bar.v.double)_(upright("op")) . $ <eq:packing-comparison>]
  For completeness, the comparison of finite centered Gaussian families follows by applying Gaussian integration by parts to $beta^(- 1) log sum_j e^(beta z_j)$ along their independent Gaussian interpolation. Its derivative is
  $ beta / 4 bb(E) sum_(j \, j') p_j p_(j') (bb(E) \| Z_j - Z_(j') \|^2 - bb(E) \| Z'_j - Z'_(j') \|^2) \, #h(2em) p_j = frac(e^(beta z_j), sum_a e^(beta z_a)) . $
  It is nonnegative when the first increment variances dominate. Letting $beta arrow.r oo$ compares the expected maxima. For (7.6), take the $Z'_j$ to be independent normals of variance $epsilon^2 \/ 128$ and use $bb(E) max_(j lt.eq l) g_j gt.eq c sqrt(log l)$.
  Compression gives
  $ sum_j B_j B_j^(*) lt.eq Q_1 R_1 Q_1 \, #h(2em) sum_j B_j^(*) B_j lt.eq Q_2 R_2 Q_2 . $
  These operators have norms at most $sqrt(d)$ and traces at most $d$. Lemma 22 therefore applies. Together with (7.6) it yields
  $ log l lt.eq C epsilon^(- 2) sqrt(d) log \( 2 + d \) . $
  The resulting bound holds for $l lt.eq 1$ as well. Combine it with (7.5) and absorb $log \( 1 + 80 \/ epsilon \) lt.eq C epsilon^(- 2)$ to prove (7.1).
  For $d = d_m$, the exponent is $O_epsilon \( \( log m \)^(3 \/ 4) log log m \) = o \( log m \)$, which proves the asserted $o \( m \)$ bound. ◻
]

Since projection norms are at most one, the estimate also gives

#[#set math.equation(numbering: n => "(7.7)")
 $ 1 / m sum_(j = 1)^m lr(bar.v.double P \( x_j ⊗ y_j \) bar.v.double) lt.eq epsilon + frac(C \( 1 + L \), m epsilon^2) exp #h(-0.16667em) (C epsilon^(- 2) sqrt(d_m) log \( 2 + d_m \)) $ <eq:packing-average>]

when $"rank" P lt.eq d_m$. Here $epsilon$ and then $eta$ are fixed before $m$ increases; $L$ may depend on that chosen $eta$. This is exactly the order of quantifiers supplied by mixing in Proposition 14.


#bibliography("refs.bib", style: "ieee", title: [References])
