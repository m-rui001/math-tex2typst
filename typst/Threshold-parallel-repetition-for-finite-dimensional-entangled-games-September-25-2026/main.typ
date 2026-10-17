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

#align(center)[#text(size: 16pt, weight: "bold")[Threshold parallel repetition for finite-dimensional entangled games]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

A repeated game allows two players to coordinate their answers across many independently sampled question pairs. Even when their success in a single game is bounded away from one, the wins in a joint strategy need not be independent. Threshold parallel repetition asks whether the probability that the fraction of wins exceeds the single-game value by any fixed positive amount is exponentially small. Such a bound permits error amplification even when an intended strategy sometimes loses individual games.

=== 1.1 Games and the main theorem <games-and-the-main-theorem>

A finite two-player one-round game consists of nonempty finite question sets $cal(X) \, cal(Y)$, nonempty finite answer sets $cal(A) \, cal(B)$, a probability distribution $mu$ on $cal(X) times cal(Y)$, and a predicate

$ V : cal(X) times cal(Y) times cal(A) times cal(B) arrow.r { 0 \, 1 } . $

The referee samples $\( x \, y \)$ from $mu$, sends $x$ to Alice and $y$ to Bob, and accepts answers $\( a \, b \)$ when $V \( x \, y \, a \, b \) = 1$. The players do not communicate. A finite-dimensional entangled strategy consists of a unit vector $psi in cal(H)_A ⊗ cal(H)_B$ and, for each local question, a positive operator-valued measurement (POVM): positive operators $M_x^a \, N_y^b$ satisfying $sum_a M_x^a = I$ and $sum_b N_y^b = I$. Its success probability is

$ sum_(x \, y \, a \, b) mu \( x \, y \) V \( x \, y \, a \, b \) chevron.l psi \, M_x^a ⊗ N_y^b psi chevron.r . $

Using pure states causes no loss, since a finite-dimensional mixed state can be purified by adding a finite local register. The entangled value $omega^(*) \( G \)$ is the supremum of this expression over all finite dimensions and all such strategies; the supremum need not be attained.

In $k$ repetitions the referee samples $\( X_1 \, Y_1 \) \, dots.h \, \( X_k \, Y_k \)$ independently from $mu$ and sends each player the entire local question string. A strategy may use arbitrary joint POVMs $M_(upright(bold(x)))^(upright(bold(a)))$ and $N_(upright(bold(y)))^(upright(bold(b)))$, with answer strings in $cal(A)^k$ and $cal(B)^k$. Write

$ I_i = V \( X_i \, Y_i \, A_i \, B_i \) \, #h(2em) W_k = sum_(i = 1)^k I_i \, #h(2em) d = \| cal(A) \| \| cal(B) \| . $

All logarithms below are natural.

#thm([Theorem 1.1.])[
  (Threshold parallel repetition).  #emph[There is a universal constant $kappa_0 > 0$ such that the following holds. Let $G$ be any finite two-player one-round game with Boolean acceptance predicate and entangled value $v = omega^(*) \( G \) < 1$. For every $0 < delta < 1 - v$, every integer $k gt.eq 1$, and every finite-dimensional joint strategy for $k$ repetitions, 
#[#set math.equation(numbering: n => "(1)")
 $ Pr #h(-0.16667em) [W_k gt.eq ceil.l \( v + delta \) k ceil.r] lt.eq exp #h(-0.16667em) (- frac(kappa_0 delta^5, 1 + log d) thin k) . $ <eq:main>]

 The same inequality holds for the supremum over those strategies.]
] <thm:main>

The distribution $mu$ may be correlated and may have zero entries or disconnected support. Neither the question alphabet sizes nor the strategy dimension enter the displayed rate. We obtain this theorem by combining a transfer from conditioning bounds to threshold bounds with Song’s conditioning estimate #cite(label("song2026")) Lemma 4.4. The transfer is proved in Section 2; its tested-set selection uses only the joint law of the binary win indicators.

A second bound records the geometry of a fixed question distribution. Form the graph whose vertices are the positive-probability pairs $H = { \( x \, y \) : mu \( x \, y \) > 0 }$, joining two pairs when they share either question. For its connected components $H_j$, let $mu_j = mu \( thin dot.op divides H_j \)$ and $mu_(j \, min) = min_(z in H_j) mu_j \( z \)$, and set

$ kappa_mu = 8 max_j frac(\| H_j \| - 1, mu_(j \, min)) . $

In particular, a singleton component contributes zero. Corollary 11 proves, under the same hypotheses and for every $k gt.eq 1$, the complementary estimate

$ Pr #h(-0.16667em) [W_k gt.eq ceil.l \( v + delta \) k ceil.r] lt.eq exp #h(-0.16667em) (- frac(delta^3, 16384 \( 1 + kappa_mu \) \( 1 + log d \)) thin k) . $

Both estimates apply to the same strategy, so one may use the larger exponential rate. The cubic bound is proved in Section 5 by constructing one reference state per support component. Its constant depends on the fixed distribution through $kappa_mu$, whereas the fifth-power constant is universal. Both bounds hold at every repetition length, including when rounding the threshold to an integer matters. When $v = 0$, Lemma 2 gives the sharper probability zero.

=== 1.2 Related work <related-work>

The classical value of a game is its largest success probability using only shared randomness and local response functions. Raz proved that, when this value is less than one, the probability of winning every coordinate decays exponentially under repetition #cite(label("raz1998")). Holenstein’s information-theoretic proof introduced correlated sampling into this argument and improved its quantitative dependence on the gap from one #cite(label("holenstein2009")). Rao then proved exponential concentration above the classical value for general games #cite(label("rao2011")) Theorem 7. This threshold conclusion is stronger than an all-wins bound: the event that every coordinate is won is only a subset of the event that a specified fraction is won.

For entangled strategies, early repetition results used structure in the acceptance predicate or in the question distribution. Cleve, Slofstra, Unger, and Upadhyay proved perfect repetition for XOR games, whose answers are bits and whose acceptance depends on their parity: the all-wins value of a product is the product of the individual values #cite(label("csuu2008")). Kempe, Regev, and Toner proved exponential repetition for unique games, whose constraints are permutations between the answer sets #cite(label("krt2010")). Dinur, Steurer, and Vidick extended exponential repetition to projection games, in which one player’s answer determines the other player’s required answer, and developed quantum correlated sampling #cite(label("dsv2015")). Jain, Pereszlényi, and Yao treated free games, where the players’ questions are independently distributed #cite(label("jpy2014")); Chailloux and Scarpa subsequently improved the rate #cite(label("cs2015")). These results require restrictions on either the predicate or the question distribution. For complete-support question distributions, which may be correlated, Chailloux and Scarpa also proved exponential all-wins decay with a rate depending on the distribution #cite(label("cs2014")) Corollary 1, corrected version. That result does not cover arbitrary zero entries in the question law.

Yuen proved polynomial all-wins decay for arbitrary finite two-player entangled games #cite(label("yuen2016")) Theorem 1. His proof combines conditioning with classical and quantum correlated sampling; its tested-coordinate selection already samples indices with replacement #cite(label("yuen2016")) Proposition 9, full version. Bavarian, Vidick, and Yuen obtained exponential amplification by anchoring, a transformation that adds questions to the game #cite(label("bvy2022")). Their threshold theorem concerns these anchored games #cite(label("bvy2017")) Section 5.4, Theorem 5.6. Rao’s and their concentration arguments are precedents for extracting a threshold bound from control after conditioning on tested coordinates. Unlike the anchoring transformation, the present bounds retain the given question distribution throughout.

Chapter 6 of #emph[Ten Advances in Mathematics and Theoretical Computer Science] obtains exponential all-wins repetition for arbitrary finite entangled games #cite(label("tenadvances2026")). Its operator entropy estimate and conditioning construction are the analytic antecedents of the argument below. We reproduce that chapter’s resolvent purification and its estimate from Definition 4.2 and Lemma 4.3, and adapt its Section 4 weighted reveal argument to a fixed ordering of the untested coordinates. Song replaces the quantum sampler in that framework by a smooth construction and improves the all-wins gap dependence to a cubic power #cite(label("song2026")). His generic conditioning lemma supplies our fifth-power threshold theorem. The cubic all-wins result uses an additional estimate for near-perfect conditional success; it does not by itself imply a cubic threshold rate above an arbitrary value.

Our contribution is a quantitative transfer from tested-set conditioning to threshold decay, together with its universal fifth-power application and the explicit cubic bound for each fixed question distribution. The universal application uses Song’s sampler independently of the Dinur–Steurer–Vidick sampling theorem, while retaining the conditioning machinery of Chapter 6. Since $0 < delta < 1$, the weaker rate $kappa_0 delta^13 \/ \( 1 + log d \)$ already follows from Theorem 1.

=== 1.3 The proof in outline <the-proof-in-outline>

Fix a repeated strategy. For a tested set $C subset.neq \[ k \]$, let $E_C$ be the event that all coordinates in $C$ are won, and suppose $p = Pr \( E_C \) > 0$. Put $m = k - \| C \|$ and

$ tau = frac(log \( 1 \/ p \) + \| C \| log d, m) . $

The numerator records the rarity of the conditioning event and the logarithm of the number of possible tested answer strings. Song’s estimate, stated in Proposition 5, bounds the average success on the remaining coordinates by

#[#set math.equation(numbering: n => "(2)")
 $ 1 / m sum_(i in.not C) Pr \( I_i = 1 divides E_C \) lt.eq v + B_4 tau^(1 \/ 4) #h(2em) \( 0 lt.eq tau lt.eq 1 \) \, $ <eq:outline-conditioning>]

where $B_4$ is universal. Thus a small conditioning budget cannot raise the average win probability far above $v$.

Section 2 first proves the generic transfer. If the upper tail has too much probability, sampling a short list of coordinate indices with replacement identifies a fixed tested set $C$ whose success probability is large and whose conditional win rate outside $C$ exceeds $v$ by a fixed fraction of $delta$. Its budget is small enough to contradict (2). This binary sampling argument gives the exponential bound for sufficiently large repetition lengths. Taking independent tensor copies of any shorter strategy then gives the same rate for every length. The generic transfer turns a conditioning error of order $tau^(1 \/ 4)$ into the fifth-power rate in the main theorem.

The fixed-distribution cubic bound uses a different construction of a single-game strategy. Sections 3 and 4 represent the conditional answers by measurements on vectors in common finite-dimensional spaces. Resolvent purifications preserve the answer probabilities. To compare the vectors, order the untested coordinates and expose Alice’s questions before a chosen coordinate and Bob’s questions after it. Moving this dividing point gives two entropy telescopes, with total cost at most $p \( log \( 1 \/ p \) + \| C \| log d \)$ on each side. The resulting vector has two nearby approximations, each determined by one player’s question and a transcript of exposed questions and tested answers.

Section 5 compares these vectors along paths in each connected component of the question support. The resulting strategies for the component games can be combined in one fixed tensor-product state, since each player identifies the component from the local question. The loss is $O_mu \( sqrt(tau) + tau \)$, and the same transfer therefore gives cubic dependence on $delta$. Corollary 12 applies the threshold theorem to amplify both completeness and soundness.

== 2 From conditioning to a threshold bound <sec:threshold>

Fix a repeated strategy and write $v = omega^(*) \( G \)$ and $d = \| cal(A) \| \| cal(B) \|$. For a set $C subset.eq \[ k \]$, put

$ E_C = { I_i = 1 upright(" for every ") i in C } \, #h(2em) p_C = Pr \( E_C \) \, #h(2em) W = sum_(i = 1)^k I_i . $

For $C subset.neq \[ k \]$ with $p_C > 0$, define its conditioning cost by

$ tau \( C \) = frac(log \( 1 \/ p_C \) + \| C \| log d, k - \| C \|) . $

For a target excess $0 < delta < 1 - v$, the analytic task is to find a budget $T > 0$ such that $tau \( C \) lt.eq T$ forces the average win rate outside $C$, conditioned on $E_C$, to be at most $v + delta \/ 4$. We prove that this implication, uniformly over repetition lengths and strategies, yields exponential rate $delta T \/ \( 16 \( 1 + log d \) \)$ whenever $T lt.eq delta \/ 4$. Thus the quantitative role of a conditioning estimate is entirely determined by the budget it permits.

The proof has two steps. If a large upper tail persists, sampling a short list of indices selects a tested set of sufficiently large probability whose conditional win rate is too high. This gives the bound for all sufficiently large repetition lengths. Independent tensor copies then extend the same rate to every length. The selection itself uses only the joint law of the binary win indicators.

The passage from tested-coordinate conditioning to concentration has precedents in Rao’s classical proof #cite(label("rao2011")) Section 8 and in the anchored entangled-game theorem #cite(label("bvy2017")) Section 5.4. Sampling tested indices with replacement also appears in Yuen’s proof of Proposition 9 in the full version of #cite(label("yuen2016")). The transfer below separates this probabilistic step from the choice of a conditioning bound.

=== 2.1 Marginal success probabilities <subsec:marginal-success>

We first record a bound that also settles the zero-value case.

#thm([Lemma 2.1.])[
  #emph[Let $G$ be a finite two-prover game with entangled value $v$, and let $I_1 \, dots.h \, I_k$ be the coordinate win indicators of any finite-dimensional strategy for its $k$-fold repetition. Then 
$ bb(E) I_i lt.eq v quad \( 1 lt.eq i lt.eq k \) \, #h(2em) bb(E) sum_(i = 1)^k I_i lt.eq k v . $

 In particular, if $v = 0$, then every coordinate is lost almost surely.]
] <lem:mean-bound>

#proof[
  Fix $i$ and fix the question pairs at all other coordinates. On input $\( x \, y \)$ to one copy of $G$, insert $x$ and $y$ at coordinate $i$, use the fixed questions elsewhere, run the repeated strategy, and retain only the answers at $i$. These are local measurements on the original finite shared state, so their success probability is at most $v$. Averaging over the fixed question pairs with distribution $mu^(⊗ \( k - 1 \))$ proves the first claim. Summing proves the second; when $v = 0$, each nonnegative indicator has expectation zero. ◻
]

=== 2.2 Selecting the tested coordinates <selecting-the-tested-coordinates>

The next lemma identifies one fixed tested set. Its hypotheses impose no independence on the win indicators.

#thm([Lemma 2.2.])[
  (Sampling the upper tail).  #emph[Let $I_1 \, dots.h \, I_k$ be arbitrary jointly distributed ${ 0 \, 1 }$-valued random variables. Suppose $0 < q_0 < q < 1$, $0 < epsilon < 1$, and $p_H = Pr \( W gt.eq ceil.l q k ceil.r \) > 0$. Put 
$ ell = ⌈frac(log \( 4 \/ \( epsilon p_H \) \), log \( q \/ q_0 \))⌉ . $

 There is a set $C subset.eq \[ k \]$, with $\| C \| lt.eq ell$, such that 
#[#set math.equation(numbering: n => "(3)")
 $ p_C gt.eq 1 / 2 p_H q^ell \, #h(2em) Pr \( W < q_0 k divides E_C \) lt.eq epsilon . $ <eq:sampled-set-guarantees>]

]
] <lem:tail-sampling>

#proof[
  Draw $ell$ indices independently and uniformly from $\[ k \]$, and let $C$ be their distinct set. The draw is independent of the indicators. For each draw define
  $ a_C = Pr \( E_C \) \, #h(2em) b_C = Pr \( E_C \, med W < q_0 k \) \, #h(2em) A = p_H q^ell . $
  Expectations over the draw satisfy
  $ bb(E)_C a_C = bb(E) \( W \/ k \)^ell gt.eq A \, #h(2em) bb(E)_C b_C lt.eq q_0^ell lt.eq epsilon A \/ 4 . $
  The draws with $a_C < A \/ 2$ contribute at most $A \/ 2$ to $bb(E)_C a_C$. Those with $b_C > epsilon a_C$ contribute at most $epsilon^(- 1) bb(E)_C b_C lt.eq A \/ 4$. Thus the remaining draws have positive total $a_C$-weight. Any such draw satisfies (3). ◻
]

=== 2.3 An exponential rate for every repetition length <an-exponential-rate-for-every-repetition-length>

The next statement isolates the quantitative use of a conditioning estimate. All logarithms are natural.

#thm([Proposition 2.3.])[
  (Conditioning-to-threshold transfer).  #emph[Let $G$ be a finite two-prover game with nonempty answer alphabets, $d = \| cal(A) \| \| cal(B) \|$, and $v = omega^(*) \( G \) < 1$. Fix $0 < delta < 1 - v$ and $0 < T lt.eq delta \/ 4$. Suppose the following holds for every $k gt.eq 1$, every finite-dimensional strategy for $k$ repetitions, and every $C subset.neq \[ k \]$ with $p_C > 0$: 
#[#set math.equation(numbering: n => "(4)")
 $ frac(log \( 1 \/ p_C \) + \| C \| log d, k - \| C \|) lt.eq T quad arrow.r.double quad frac(1, k - \| C \|) sum_(i in.not C) Pr \( I_i = 1 divides E_C \) lt.eq v + delta \/ 4 . $ <eq:threshold-input>]

 Then, for every $k gt.eq 1$ and every finite-dimensional strategy, 
#[#set math.equation(numbering: n => "(5)")
 $ Pr #scale(x: 120%, y: 120%)[\(] W gt.eq ceil.l \( v + delta \) k ceil.r #scale(x: 120%, y: 120%)[\)] lt.eq exp (- frac(delta T, 16 \( 1 + log d \)) thin k) . $ <eq:generic-threshold-rate>]

 The same bound holds for the supremum over those strategies.]
] <prop:conditioning-to-tail>

#proof[
  We first derive a bound for large repetition lengths and then use tensor copies to remove that restriction. Set
  $ q = v + delta \, quad q_0 = v + delta \/ 2 \, quad eta = delta \/ 16 \, quad r = log \( q \/ q_0 \) \, quad R = log \( d \/ q \) \, quad c = frac(delta T, 16 \( 1 + log d \)) . $
  Here $0 < q_0 < q < 1$, $r > 0$, and $R > 0$. The elementary inequalities $r gt.eq delta \/ \( 2 q \)$ and $q log \( 1 \/ q \) lt.eq 1 \/ e$ give
  #[#set math.equation(numbering: n => "(6)")
   $ c / r lt.eq T / 8 lt.eq eta / 2 \, #h(2em) c (1 + R / r) lt.eq frac(3 T, 16) . $ <eq:rate-arithmetic>]
  For the second inequality, multiply by $delta$ and use
  $ delta (1 + R / r) lt.eq delta + 2 q log d + 2 q log \( 1 \/ q \) lt.eq 3 \( 1 + log d \) . $
  #emph[Large repetition lengths.] We prove (5) for all sufficiently large $k$, with the lower bound on $k$ independent of the strategy. Suppose, to the contrary, that $p_H = Pr \( W gt.eq ceil.l q k ceil.r \) gt.eq e^(- c k)$. Apply Lemma 3 with $epsilon = eta$. With
  $ t = 1 + frac(log \( 4 \/ eta \), r) \, #h(2em) B = log 2 + R t \, $
  the number of draws satisfies $ell lt.eq c k \/ r + t$. Choose $k_0$ large enough that
  $ t / k_0 lt.eq eta / 2 \, #h(2em) B / k_0 lt.eq T / 16 . $
  For $k gt.eq k_0$, (6) implies $\| C \| lt.eq ell lt.eq eta k$, so $C subset.neq \[ k \]$. On $E_C$ precisely $\| C \|$ tested wins are already known. The second conclusion of the sampling lemma therefore gives
  #[#set math.equation(numbering: n => "(7)")
   $ frac(bb(E) \[ W - \| C \| divides E_C \], k - \| C \|) & gt.eq \( 1 - eta \) frac(q_0 - eta, 1 - eta) = v + frac(7 delta, 16) . $ <eq:conditional-high-rate>]
  Indeed, the function $\( q_0 - u \) \/ \( 1 - u \)$ decreases for $0 lt.eq u < 1$, and $\| C \| \/ k lt.eq eta < q_0$; outside ${ W gt.eq q_0 k }$ the remaining number of wins is still nonnegative.
  On the other hand, the first conclusion of the sampling lemma yields
  $ log \( 1 \/ p_C \) + \| C \| log d lt.eq log \( 1 \/ p_H \) + log 2 + ell R . $
  Using (6) once more, we obtain
  $ frac(log \( 1 \/ p_C \) + \| C \| log d, k - \| C \|) lt.eq frac(c \( 1 + R \/ r \) + B \/ k, 1 - eta) lt.eq frac(T, 4 \( 1 - eta \)) < T . $
  The hypothesis (4) now contradicts (7). This establishes the claimed exponential rate for every $k gt.eq k_0$.
  #emph[All repetition lengths.] To retain the same rate for smaller $k$, fix any $k$-coordinate strategy and take $N$ independent tensor copies of it. This is a finite-dimensional strategy for $N k$ coordinates. The event that every block has at least $ceil.l q k ceil.r$ wins has probability $p_H^N$, and it implies the global threshold event because
  $ N ceil.l q k ceil.r gt.eq ceil.l q N k ceil.r . $
  Choose $N$ with $N k gt.eq k_0$. The bound already proved gives $p_H^N lt.eq e^(- c N k)$, hence $p_H lt.eq e^(- c k)$. This proves (5) for every $k$. All constants are independent of the strategy and its dimension, so taking suprema preserves the inequality without any attainment assumption. ◻
]

=== 2.4 Proof of the universal threshold bound <proof-of-the-universal-threshold-bound>

We use the following conditioning estimate as an external theorem. It supplies a budget uniform in the question distribution and the strategy dimension.

#thm([Proposition 2.4.])[
  (Song’s conditioning estimate, #cite(label("song2026")) Definition 4.3 and Lemma 4.4).  #emph[There is a universal constant $B_4 gt.eq 1$ with the following property. Let $G$ be a finite two-player game with entangled value $v < 1$, and fix a finite-dimensional strategy for $k gt.eq 1$ repetitions. For $C subset.neq \[ k \]$ with $p_C = Pr \( E_C \) > 0$, put $m = k - \| C \|$ and 
$ tau = frac(log \( 1 \/ p_C \) + \| C \| log \( \| cal(A) \| \| cal(B) \| \), m) . $

 If $tau lt.eq 1$, then 
#[#set math.equation(numbering: n => "(8)")
 $ 1 / m sum_(i in.not C) Pr \( I_i = 1 divides E_C \) lt.eq v + B_4 tau^(1 \/ 4) . $ <eq:song-conditioning>]

]
] <prop:song-conditioning>

Song proves this estimate using a smooth sampler and the analytic conditioning machinery of Chapter 6 of #cite(label("tenadvances2026")); the proof does not use the Dinur–Steurer–Vidick sampling theorem.

#proof[
  For $0 < delta < 1 - v$, take
  $ T = (frac(delta, 4 B_4))^4 . $
  Since $B_4 gt.eq 1$ and $0 < delta < 1$, we have $T lt.eq delta \/ 4 < 1$. Whenever the conditioning cost is at most $T$, Proposition 5 bounds the excess conditional win rate by $B_4 T^(1 \/ 4) = delta \/ 4$. Set $kappa_0 = 1 \/ \( 16 \( 4 B_4 \)^4 \)$. Proposition 4 therefore gives
  #[#set math.equation(numbering: n => "(9)")
   $ Pr #scale(x: 120%, y: 120%)[\(] W gt.eq ceil.l \( v + delta \) k ceil.r #scale(x: 120%, y: 120%)[\)] lt.eq exp (- frac(kappa_0 delta^5, 1 + log d) thin k) . $ <eq:universal-threshold-rate>]
  This holds for every $k gt.eq 1$ and every finite-dimensional strategy, and hence also for their supremum. ◻
]

The next sections develop the common purification and exposure construction needed for the fixed-distribution cubic bound. That argument does not use Song’s sampler.

== 3 A common purification of effects <sec:operators>

Conditioning on answers replaces the shared state by local positive operators applied to that state. We need purifications of these operators that are close whenever an operator entropy gap is small. For positive definite operators, this gap is an average of Petz’s operator Bregman divergence #cite(label("petz2007")); related resolvent estimates appear in Kim #cite(label("kim2014")). The following construction provides all purifications in a common space and will let us retain the original answer measurements. The purification formulation and its Jensen estimate are given in #cite(label("tenadvances2026")) Chapter 6, Definition 4.2, Lemma 4.3, and Appendix A.4; we include the proof, including its finite-dimensional reduction.

For a finite-dimensional complex Hilbert space $cal(H)$, an #emph[effect] is a self-adjoint operator $T$ with $0 prec.curly.eq T prec.curly.eq I$. Put $f \( t \) = t log t$ for $t > 0$ and $f \( 0 \) = 0$, and define

$ cal(F)_T : cal(H) arrow.r L^2 \( \( 0 \, oo \) \, d s \; cal(H) \) \, #h(2em) \( cal(F)_T h \) \( s \) = T \( T + s I \)^(- 1) h . $

The inverse in this expression exists for every $s > 0$, including when $T$ has a kernel.

#thm([Lemma 3.1.])[
  (Resolvent purification).  #emph[For every effect $T$ on $cal(H)$, $cal(F)_T^(*) cal(F)_T = T$. If $A_1 \, dots.h \, A_N$ are effects, $q_1 \, dots.h \, q_N > 0$ sum to $1$, and $B = sum_j q_j A_j$, then 
#[#set math.equation(numbering: n => "(10)")
 $ sum_j q_j \( cal(F)_(A_j) - cal(F)_B \)^(*) \( cal(F)_(A_j) - cal(F)_B \) prec.curly.eq sum_j q_j f \( A_j \) - f \( B \) . $ <eq:resolvent-jensen>]

 For any finite collection $cal(T)$ of effects, all maps $cal(F)_T$, $T in cal(T)$, can instead take values in one finite-dimensional space, preserving every product $cal(F)_S^(*) cal(F)_T$, $S \, T in cal(T)$.]
] <lem:resolvent>

#proof[
  The scalar identity
  $ integral_0^oo frac(t^2, \( t + s \)^2) thin d s = t #h(2em) \( t gt.eq 0 \) $
  and the spectral theorem give the first assertion.
  To prove (10), write $D_j = A_j - B$. If $h in ker B$, positivity and $q_j > 0$ imply $A_j h = 0$ for all $j$. This common kernel reduces every operator in question, and both sides of (10) vanish there. We may therefore restrict to $"supp" B$, where $B > 0$. The scalar integral
  $ f \( t \) = integral_0^oo (frac(t, 1 + s) - frac(t, t + s)) d s #h(2em) \( t gt.eq 0 \) $
  is convergent also at $t = 0$, with the integrand then zero. Functional calculus and $sum_j q_j D_j = 0$ give
  #[#set math.equation(numbering: n => "(11)")
   $ sum_j q_j f \( A_j \) - f \( B \) & = integral_0^oo s sum_j q_j #scale(x: 120%, y: 120%)[\(] \( A_j + s I \)^(- 1) - \( B + s I \)^(- 1) #scale(x: 120%, y: 120%)[\)] thin d s\
 & = integral_0^oo s sum_j q_j \( B + s I \)^(- 1) D_j \( A_j + s I \)^(- 1) D_j \( B + s I \)^(- 1) thin d s . $ <eq:resolvent-gap>]
  For the second equality use the exact identity
  $ \( A_j + s I \)^(- 1) =  & \( B + s I \)^(- 1) - \( B + s I \)^(- 1) D_j \( B + s I \)^(- 1)\
 & + \( B + s I \)^(- 1) D_j \( A_j + s I \)^(- 1) D_j \( B + s I \)^(- 1) \, $
  then average over $j$. The final integrand in (11) is bounded near $s = 0$, since $B > 0$ and $s \( A_j + s I \)^(- 1) prec.curly.eq I$, and is $O \( s^(- 2) \)$ as $s arrow.r oo$. Thus these are norm-convergent operator integrals.
  The resolvent identity also gives
  $ A_j \( A_j + s I \)^(- 1) - B \( B + s I \)^(- 1) = s \( A_j + s I \)^(- 1) D_j \( B + s I \)^(- 1) . $
  Consequently the left side of (10) has integrand
  $ s^2 sum_j q_j \( B + s I \)^(- 1) D_j \( A_j + s I \)^(- 2) D_j \( B + s I \)^(- 1) . $
  Since $s \( A_j + s I \)^(- 2) prec.curly.eq \( A_j + s I \)^(- 1)$, congruence by $D_j \( B + s I \)^(- 1)$ bounds this integrand by the final integrand in (11). Integration proves the inequality.
  Finally, the span
  $ cal(K) = "span" { cal(F)_T h : T in cal(T) \, med h in cal(H) } $
  has dimension at most $\| cal(T) \| dim cal(H)$. Viewing every map as taking values in this same subspace preserves all inner products of their images, hence all the stated products. An unused one-dimensional summand may be added if a nonzero codomain is needed. ◻
]

The common codomain is essential: compressing different operators separately would not in general preserve their distances. In our application the number of effects is finite, although their number and the resulting dimension need not have a uniform bound.

The transport of answer effects below follows the ideal-state extraction in #cite(label("tenadvances2026")) Chapter 6, Lemma 3.2 and Appendix A.1.

#thm([Lemma 3.2.])[
  (Transporting answer measurements).  #emph[Let $cal(H) \, cal(K)$ be finite-dimensional complex Hilbert spaces, let $T$ be an effect on $cal(H)$, and let $F : cal(H) arrow.r cal(K)$ satisfy $F^(*) F = T$. Suppose that $cal(A)$ is a nonempty finite set and that positive operators $\( G_a \)_(a in cal(A))$ satisfy $sum_a G_a = T$. There is a POVM $\( tilde(G)_a \)_(a in cal(A))$ on $cal(K)$ with 
#[#set math.equation(numbering: n => "(12)")
 $ F^(*) tilde(G)_a F = G_a #h(2em) \( a in cal(A) \) . $ <eq:measurement-pullback>]

 The POVM depends only on $F$ and the operators $G_a$.]
] <lem:measurement-transport>

#proof[
  All inverses below act on the support of $T$ and are zero on its kernel. Define $V_T = F T^(- 1 \/ 2)$. Then $V_T^(*) V_T = Pi_T$, the orthogonal projection onto $"supp" T$, so $V_T V_T^(*)$ is an orthogonal projection on $cal(K)$. Each $G_a$ is supported on $"supp" T$, because $0 prec.curly.eq G_a prec.curly.eq T$. Fix $a_(*) in cal(A)$ and put
  $ tilde(G)_a = V_T T^(- 1 \/ 2) G_a T^(- 1 \/ 2) V_T^(*) + upright(bold(1))_({ a = a_(*) }) \( I_(cal(K)) - V_T V_T^(*) \) . $
  These operators are positive and sum to $I_(cal(K))$. Since $F = V_T T^(1 \/ 2)$, their pullbacks are $G_a$, as claimed. The same formula applies when $T = 0$: all $G_a$ and $V_T$ then vanish, and the POVM always outputs $a_(*)$. ◻
]

In particular, if $Psi = \( cal(F)_T ⊗ cal(F)_S \) psi$ and $sum_a G_a = T$, $sum_b H_b = S$, the transported measurements satisfy

#[#set math.equation(numbering: n => "(13)")
 $ chevron.l Psi \| tilde(G)_a ⊗ tilde(H)_b \| Psi chevron.r = chevron.l psi \| G_a ⊗ H_b \| psi chevron.r . $ <eq:joint-measurement-pullback>]

Thus the common purification preserves the exact answer probabilities, not just the norms of the conditioned vectors.

== 4 Conditioning on a tested set <sec:exposure>

Fix a finite-dimensional strategy for the $k$-fold game, with state $psi$ and POVMs ${ M_(upright(bold(x)))^(upright(bold(a))) }$ and ${ N_(upright(bold(y)))^(upright(bold(b))) }$. Let $C subset.eq \[ k \]$ be a set of tested coordinates and let

$ E_C = { V \( X_j \, Y_j \, A_j \, B_j \) = 1 upright(" for every ") j in C } \, #h(2em) p = Pr \( E_C \) > 0 . $

Assume that $m = k - \| C \| gt.eq 1$, and put

#[#set math.equation(numbering: n => "(14)")
 $ d_C = \( \| cal(A) \| \| cal(B) \| \)^(\| C \|) \, #h(2em) L = log \( d_C \/ p \) \, #h(2em) tau = L \/ m . $ <eq:conditioning-budget>]

We construct a vector and local measurements that reproduce the conditional answers at an untested coordinate. Two approximating vectors, one determined by each player’s question and a transcript, will have total squared error at most $2 p tau$ on average. These comparisons let Section 5 replace the conditional vector by a fixed state on each support component. Throughout this section, conditional expectations of operators use the original, unconditioned question distribution $mu^(⊗ k)$. We adapt the weighted reveal argument of #cite(label("tenadvances2026")) Chapter 6, Section 4, using the fixed ordering below.

=== 4.1 Exposing one question at each coordinate <exposing-one-question-at-each-coordinate>

Fix any ordering of the untested coordinates, and abbreviate their questions as $X_1 \, dots.h \, X_m$ and $Y_1 \, dots.h \, Y_m$, with answers $A_1 \, dots.h \, A_m$ and $B_1 \, dots.h \, B_m$. The tested questions retain the notation $X_C \, Y_C$. Position-indexed win indicators refer to these same untested coordinates; sums over $i in.not C$ in the result statements use the original coordinate labels. For $0 lt.eq j lt.eq m$ define the flag

$ Omega_j = \( X_C \, Y_C \, X_(lt.eq j) \, Y_(> j) \) . $

Conditioned on a flag of positive probability, the full question vectors $upright(bold(X))$ and $upright(bold(Y))$ are independent. Indeed, at a tested coordinate both questions are fixed. At each untested coordinate one question is fixed and the other has its conditional law under $mu$; these remaining choices are independent across coordinates. This argument uses no independence between the two questions within a coordinate.

For tested answer strings $alpha in cal(A)^C$ and $gamma in cal(B)^C$, define the coarse-grained effects

$ M_(upright(bold(x)))^alpha = sum_(upright(bold(a)) : thin a_C = alpha) M_(upright(bold(x)))^(upright(bold(a))) \, #h(2em) N_(upright(bold(y)))^gamma = sum_(upright(bold(b)) : thin b_C = gamma) N_(upright(bold(y)))^(upright(bold(b))) \, $

and the testing mask

$ theta \( x_C \, y_C \, alpha \, gamma \) = product_(j in C) V \( x_j \, y_j \, alpha_j \, gamma_j \) . $

For $C = diameter$ there is one pair of empty answer strings and the empty product is $1$. Write

$ F_j^alpha = bb(E) \[ M_(upright(bold(X)))^alpha divides Omega_j \] \, #h(2em) H_j^gamma = bb(E) \[ N_(upright(bold(Y)))^gamma divides Omega_j \] \, #h(2em) chi \( A \, B \) = chevron.l psi \| A ⊗ B \| psi chevron.r . $

The answer strings here are fixed indices of the effects, not additional conditions on the question distribution. These are positive contractions. Conditional independence and linearity give, for every $j$,

#[#set math.equation(numbering: n => "(15)")
 $ bb(E)_(Omega_j) sum_(alpha \, gamma) theta thin chi \( F_j^alpha \, H_j^gamma \) = p . $ <eq:exposure-mass>]

A mode is an index $i in \[ m \]$. Delete its question from the flag and set

$ r_0 = \( X_C \, Y_C \, X_(< i) \, Y_(> i) \) \, #h(2em) nu_i = "law" \( r_0 \) . $

Figure 1 records which questions are retained.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[Before $i$
], table.cell(rowspan: 1, colspan: 1)[Coordinate $i$
], table.cell(rowspan: 1, colspan: 1)[After $i$
]),
  table.cell(rowspan: 1, colspan: 1)[Alice
], table.cell(rowspan: 1, colspan: 1)[$X_(< i)$ revealed
], table.cell(rowspan: 1, colspan: 1)[$X_i$ fresh
], table.cell(rowspan: 1, colspan: 1)[$X_(> i)$ unrevealed
],
  table.cell(rowspan: 1, colspan: 1)[Bob
], table.cell(rowspan: 1, colspan: 1)[$Y_(< i)$ unrevealed
], table.cell(rowspan: 1, colspan: 1)[$Y_i$ fresh
], table.cell(rowspan: 1, colspan: 1)[$Y_(> i)$ revealed
],
)
]],
  caption: [Figure 1: The questions exposed in $r_0$, in addition to $X_C \, Y_C$; $i$ indexes the fixed ordering of the untested coordinates. Under the original product question law, before conditioning on $E_C$, fixing $r_0$ and $\( X_i \, Y_i \)$ makes the remaining Alice and Bob question strings independent. Replacing $Y_i$ by $X_i$ in successive flags produces the two entropy telescopes. ],
) <fig:exposure>

The variable $r_0$ is independent of $\( X_i \, Y_i \) tilde.op mu$. For each value of $r_0$ of positive probability, put

$ F_x^alpha & = bb(E) \[ M_(upright(bold(X)))^alpha divides r_0 \, X_i = x \] \, & H_y^gamma & = bb(E) \[ N_(upright(bold(Y)))^gamma divides r_0 \, Y_i = y \] \,\
F_y^alpha & = sum_x mu \( x divides y \) F_x^alpha \, & H_x^gamma & = sum_y mu \( y divides x \) H_y^gamma . $

We use these formulas only on positive marginal probabilities. In each conditional ensemble, zero weights are omitted before applying Lemma 6. Questions of zero marginal probability may be assigned arbitrary complete local POVMs with answers in the original alphabets. All four effects also depend on $i \, r_0$, which are suppressed in the notation. The subscripts in $F_y^alpha \, H_x^gamma$ indicate the question on which the conditional average depends. In particular,

$ \( F_(i - 1)^alpha \, H_(i - 1)^gamma \) = \( F_y^alpha \, H_y^gamma \) \, #h(2em) \( F_i^alpha \, H_i^gamma \) = \( F_x^alpha \, H_x^gamma \) . $

Here the first identity is evaluated at $Y_i = y$, and the second at $X_i = x$. The mask depends only on $r_0 \, alpha \, gamma$, not on $x \, y$.

=== 4.2 The conditional vector and its measurements <the-conditional-vector-and-its-measurements>

Apply the common finite-dimensional compression in Lemma 6 to all four families $F_x^alpha \, F_y^alpha \, H_x^gamma \, H_y^gamma$, over every mode, flag and positive-marginal question. This gives fixed finite-dimensional target spaces $cal(K)_A \, cal(K)_B$ for the maps $cal(F)_T$, including the maps used later for the approximations.

Let $R_i$ be the finite set of transcripts $r = \( r_0 \, alpha \, gamma \)$, where $r_0$ ranges over its positive-probability values and $\( alpha \, gamma \) in cal(A)^C times cal(B)^C$. Put

$ w_i \( r \) = nu_i \( r_0 \) theta \( r \) \, #h(2em) Psi_(x y)^r = \( cal(F)_(F_x^alpha) ⊗ cal(F)_(H_y^gamma) \) psi \,\
p_(x y)^r = parallel Psi_(x y)^r parallel^2 = chi \( F_x^alpha \, H_y^gamma \) . $

The last identity follows from $cal(F)_T^(*) cal(F)_T = T$. The weights $w_i \( r \)$ use counting measure on the answer strings; they are independent of $\( x \, y \)$ and need not sum to one. Their sum is at most $d_C$. The vector’s squared norm supplies the remaining probability of the tested answers.

We next exhibit measurements on $Psi_(x y)^r$ reproducing the conditional answers. Define the finer effects

$ G_x^(alpha \, a) = bb(E) \[ M_(upright(bold(X)))^(alpha \, a_i = a) divides r_0 \, X_i = x \] \, #h(2em) K_y^(gamma \, b) = bb(E) \[ N_(upright(bold(Y)))^(gamma \, b_i = b) divides r_0 \, Y_i = y \] \, $

where an unmentioned answer is summed out. They are positive and satisfy $sum_a G_x^(alpha \, a) = F_x^alpha$ and $sum_b K_y^(gamma \, b) = H_y^gamma$. Lemma 7 provides POVMs ${ tilde(M)_(r \, x)^a }$ on $cal(K)_A$ and ${ tilde(N)_(r \, y)^b }$ on $cal(K)_B$ such that

$ cal(F)_(F_x^alpha)^(*) tilde(M)_(r \, x)^a cal(F)_(F_x^alpha) = G_x^(alpha \, a) \, #h(2em) cal(F)_(H_y^gamma)^(*) tilde(N)_(r \, y)^b cal(F)_(H_y^gamma) = K_y^(gamma \, b) . $

If $p_(x y)^r > 0$, write $phi_(x y)^r = Psi_(x y)^r \/ sqrt(p_(x y)^r)$. Then

#[#set math.equation(numbering: n => "(16)")
 $ chevron.l phi_(x y)^r \| tilde(M)_(r \, x)^a ⊗ tilde(N)_(r \, y)^b \| phi_(x y)^r chevron.r = frac(chi \( G_x^(alpha \, a) \, K_y^(gamma \, b) \), p_(x y)^r) . $ <eq:exposure-fine-law>]

To identify this probability, condition the original experiment on $r_0 \, X_i = x \, Y_i = y$. The unfixed Alice questions $X_(> i)$ and Bob questions $Y_(< i)$ are independent, with conditional laws determined by $Y_(> i)$ and $X_(< i)$ respectively. More explicitly, for positive-mass conditioning data their joint law is

$ Pr \( X_(> i) = upright(bold(u)) \, Y_(< i) = upright(bold(z)) divides r_0 \, X_i = x \, Y_i = y \) = product_(j > i) mu \( u_j divides y_j \) product_(j < i) mu \( z_j divides x_j \) . $

This is a statement about the original question law, before conditioning on tested answers. Neither product depends on the fresh pair $\( x \, y \)$. Since Alice’s effect depends only on $upright(bold(X))$, dropping the condition $Y_i = y$ leaves its average unchanged; the analogous assertion holds for Bob after dropping $X_i = x$. Hence averaging the joint effect $M_(upright(bold(X)))^(alpha \, a_i = a) ⊗ N_(upright(bold(Y)))^(gamma \, b_i = b)$ gives exactly $G_x^(alpha \, a) ⊗ K_y^(gamma \, b)$. Its coarse-grained probability is $p_(x y)^r$. When $theta \( r \) = 1$, conditioning further on the tested answers $\( alpha \, gamma \)$ already implies $E_C$. Thus (16) is the conditional distribution of the untested answers $\( A_i \, B_i \)$ given $E_C \, r \, X_i = x \, Y_i = y$. Values with $theta \( r \) p_(x y)^r = 0$ have no mass in that conditional experiment.

In particular, the joint law of the transcript and fresh questions conditioned on $E_C$ is

#[#set math.equation(numbering: n => "(17)")
 $ lambda_i \( r \, x \, y \) = frac(w_i \( r \) mu \( x \, y \) parallel Psi_(x y)^r parallel^2, p) . $ <eq:exposure-law>]

Thus $lambda_i$ is a probability law even though the weights $w_i$ alone are not. The measurements in (16) are local: Alice’s depends only on $\( i \, r \, x \)$ and Bob’s only on $\( i \, r \, y \)$. The transcript is an analysis variable, not information given to the players. A legal one-game strategy must start with a shared resource independent of the fresh questions and obtain any transcript information using only that resource and the player’s own question.

=== 4.3 Local descriptions and their approximation error <local-descriptions-and-their-approximation-error>

The conditional vector $Psi_(x y)^r$ depends on both fresh questions. Replace the effect on the opposite player’s space by its conditional average to obtain two vectors with one-question descriptions:

$ Psi_x^r = \( cal(F)_(F_x^alpha) ⊗ cal(F)_(H_x^gamma) \) psi \, #h(2em) Psi_y^r = \( cal(F)_(F_y^alpha) ⊗ cal(F)_(H_y^gamma) \) psi . $

The first is determined by $\( i \, r \, x \)$ and the second by $\( i \, r \, y \)$. Both lie in the same fixed space $cal(K)_A ⊗ cal(K)_B$ as $Psi_(x y)^r$. Put $p_x^r = parallel Psi_x^r parallel^2$ and $p_y^r = parallel Psi_y^r parallel^2$. The identity $cal(F)_T^(*) cal(F)_T = T$ and linearity of $chi$ give

#[#set math.equation(numbering: n => "(18)")
 $ p_(x y)^r = chi \( F_x^alpha \, H_y^gamma \) \, #h(2em) p_x^r = sum_y mu \( y divides x \) p_(x y)^r \, #h(2em) p_y^r = sum_x mu \( x divides y \) p_(x y)^r \,\
bb(E)_(nu_i mu) sum_(alpha \, gamma) theta p_(x y)^r = bb(E)_(nu_i mu) sum_(alpha \, gamma) theta p_x^r = bb(E)_(nu_i mu) sum_(alpha \, gamma) theta p_y^r = p . $ <eq:exposure-norms>]

Here the total mass is $p$ by (17); the two averaging identities give the same mass for the local descriptions.

Define the errors at mode $i$ by

#[#set math.equation(numbering: n => "(19)")
 $ e_A \( i \) = bb(E)_(nu_i mu) sum_(alpha \, gamma) theta parallel Psi_(x y)^r - Psi_y^r parallel^2 \, #h(2em) e_B \( i \) = bb(E)_(nu_i mu) sum_(alpha \, gamma) theta parallel Psi_(x y)^r - Psi_x^r parallel^2 . $ <eq:mode-error-definitions>]

The subscript names the tensor factor that changes: $e_A$ replaces Alice’s effect and compares with $Psi_y$, which Bob can describe from $\( i \, r \, y \)$; $e_B$ replaces Bob’s effect and compares with $Psi_x$, which Alice can describe from $\( i \, r \, x \)$. We will bound their averages by an entropy telescope.

#thm([Lemma 4.1.])[
  (Mixed exposure).  #emph[For any finite-dimensional repeated-game strategy, proper tested set $C$ with $p = Pr \( E_C \) > 0$, and fixed ordering of the $m = k - \| C \|$ untested coordinates, the preceding construction gives finite-dimensional vectors and local POVMs satisfying the exact conditional answer law (16), transcript law (17), and norm identities (18). With $tau = \( \| C \| log \( \| cal(A) \| \| cal(B) \| \) + log \( 1 \/ p \) \) \/ m$, 
#[#set math.equation(numbering: n => "(20)")
 $ bb(E)_i e_A \( i \) lt.eq p tau \, #h(2em) bb(E)_i e_B \( i \) lt.eq p tau \, #h(2em) bb(E)_i #scale(x: 120%, y: 120%)[\(] e_A \( i \) + e_B \( i \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 p tau \, $ <eq:exposure-errors>]

 where $i$ is uniform on $\[ m \]$ and the errors are defined in (19). The question distribution may have zero entries and disconnected support.]
] <lem:exposure>

#proof[
  The construction and exact laws have been verified above. To prove the error bounds, let $f \( t \) = t log t$, with $f \( 0 \) = 0$, as in Lemma 6. Use the flags $Omega_j$ to define
  $ U_j = bb(E)_(Omega_j) sum_(alpha \, gamma) theta thin chi \( f \( F_j^alpha \) \, H_j^gamma \) \, #h(2em) Z_j = bb(E)_(Omega_j) sum_(alpha \, gamma) theta thin chi \( F_j^alpha \, f \( H_j^gamma \) \) . $
  We will show that moving from $Omega_(i - 1)$ to $Omega_i$ increases $U$ by at least $e_A \( i \)$ and decreases $Z$ by at least $e_B \( i \)$. The common range bound
  #[#set math.equation(numbering: n => "(21)")
   $ - p L lt.eq U_j \, Z_j lt.eq 0 #h(2em) \( 0 lt.eq j lt.eq m \) $ <eq:exposure-potential-range>]
  will then bound each sum of errors by $p L$.
  For the lower bound on $U_j$, fix a flag and a pair of tested answer strings. Set $F = F_j^alpha$, $H = H_j^gamma$, $g = chi \( I \, H \) lt.eq 1$, and $h = chi \( F \, H \)$. The positive functional $A mapsto chi \( A \, H \)$ has mass $g$. Applying scalar concavity of $h_0 \( t \) = - t log t$ to a spectral decomposition of $F$ gives
  $ - chi \( f \( F \) \, H \) lt.eq g h_0 \( h \/ g \) = h log \( g \/ h \) lt.eq h_0 \( h \) . $
  The formula has value $0$ when $g = 0$, since then $h = 0$. Because $theta in { 0 \, 1 }$ and $h_0 \( 0 \) = 0$, Jensen’s inequality over the flag and the $d_C$ answer pairs, together with (15), gives
  $ - U_j lt.eq bb(E) sum_(alpha \, gamma) h_0 \( theta h \) lt.eq d_C h_0 \( p \/ d_C \) = p L . $
  The proof for $Z_j$ interchanges the two players. The upper bounds in (21) follow from $f \( T \) prec.curly.eq 0$ for positive contractions $T$.
  The changes when replacing $Y_i$ by $X_i$ in the flag are
  #[#set math.equation(numbering: n => "(22)")
   $ J_A \( i \) := U_i - U_(i - 1) & = bb(E)_(nu_i mu_Y) sum_(alpha \, gamma) theta thin chi (sum_x mu \( x divides y \) f \( F_x^alpha \) - f \( F_y^alpha \) \, H_y^gamma) \,\
J_B \( i \) := Z_(i - 1) - Z_i & = bb(E)_(nu_i mu_X) sum_(alpha \, gamma) theta thin chi (F_x^alpha \, sum_y mu \( y divides x \) f \( H_y^gamma \) - f \( H_x^gamma \)) . $ <eq:exposure-jensen-A>]
  For example, linearity in the second argument rewrites $U_i$ as $bb(E)_(nu_i mu) sum_(alpha \, gamma) theta chi \( f \( F_x^alpha \) \, H_y^gamma \)$; subtracting $U_(i - 1)$ gives (22). The other identity uses linearity in the first argument.
  For fixed $r_0 \, y \, alpha \, gamma$, apply the Jensen estimate of Lemma 6 to the ensemble $F_x^alpha$ with probabilities $mu \( x divides y \)$ and then evaluate its operator inequality against $H_y^gamma$ in the state $psi$. This bounds the corresponding squared distance between $Psi_(x y)^r$ and $Psi_y^r$, and hence $e_A \( i \) lt.eq J_A \( i \)$. Applying the same argument to the ensemble $H_y^gamma$ with probabilities $mu \( y divides x \)$ gives $e_B \( i \) lt.eq J_B \( i \)$. In particular, both potential changes are nonnegative. Telescoping along the fixed ordering now yields
  #[#set math.equation(numbering: n => "(23)")
   $ 1 / m sum_(i = 1)^m J_A \( i \) lt.eq p tau \, #h(2em) 1 / m sum_(i = 1)^m J_B \( i \) lt.eq p tau \, $ <eq:exposure-telescope>]
  by (21) and $L = m tau$. These inequalities prove (20). The ordering was arbitrary and fixed throughout; no averaging over orderings is required. ◻
]

=== 4.4 The change in the sampled question distribution <the-change-in-the-sampled-question-distribution>

The vectors describe the experiment after conditioning on $E_C$. A one-game strategy, however, receives questions with the original law $mu$. The following estimate bounds the resulting discrepancy. We use $parallel dot.op parallel_1$ for the full $ell_1$ distance of probability distributions.

#thm([Lemma 4.2.])[
  (Question drift).  #emph[Under the preceding assumptions, put 
$ Delta_i = parallel "law" \( X_i \, Y_i divides E_C \) - mu parallel_1 . $

 For a uniformly chosen untested coordinate, 
$ bb(E)_i Delta_i lt.eq sqrt(frac(2 log \( 1 \/ p \), m)) lt.eq sqrt(2 tau) . $

]
] <lem:question-drift>

#proof[
  Let $Q = \( \( X_j \, Y_j \) \)_(j in \[ k \])$ be the full question vector and let $P = "law" \( Q divides E_C \)$. On the support of $mu^(⊗ k)$,
  $ frac(P \( Q \), mu^(⊗ k) \( Q \)) = frac(Pr \( E_C divides Q \), p) lt.eq 1 / p . $
  It follows that $D \( P parallel mu^(⊗ k) \) lt.eq log \( 1 \/ p \)$, where $D$ denotes relative entropy with natural logarithms. Relative entropy to a product measure is at least the sum of the relative entropies of its marginals: this follows by expanding the entropies and using subadditivity. Retaining only the $m$ untested coordinates, Pinsker’s inequality and Cauchy–Schwarz give
  $ 1 / m sum_(i = 1)^m Delta_i lt.eq 1 / m sum_(i = 1)^m sqrt(2 D \( P_i parallel mu \)) lt.eq sqrt(2 / m sum_(i = 1)^m D \( P_i parallel mu \)) lt.eq sqrt(frac(2 log \( 1 \/ p \), m)) . $
  ◻
]

== 5 A cubic bound for a fixed question distribution <app:root-rounding>

The exposure estimates also give a direct route to threshold repetition when constants may depend on the question distribution. Within each connected component of its support, we replace the conditional vector by one reference vector. Adjacent question pairs have a common local approximation, so the cost of this replacement is controlled along paths in the support. The resulting conditioning error is of square-root order, which gives a cubic threshold rate. The construction uses the exposure vectors and transported answer measurements of Section 4.

The connection-graph viewpoint of Dinur, Harsha, Venkat, and Yuen #cite(label("dhvy2017")) helped motivate this fixed-support approach. The quantum common-vector replacement by a component root and the explicit cubic coefficient are proved here, rather than imported from their classical parallel-repetition theorem.

For a finite question distribution $mu$, let

$ H = { \( x \, y \) : mu \( x \, y \) > 0 } . $

Join two vertices of $H$ when they share either question. Let $H_j$ be the connected components, and define

#[#set math.equation(numbering: n => "(24)")
 $ lambda_j = mu \( H_j \) \, #h(2em) mu_j = mu \( thin dot.op divides H_j \) \, #h(2em) mu_(j \, min) = min_(z in H_j) mu_j \( z \) \, #h(2em) kappa_mu = 8 max_j frac(\| H_j \| - 1, mu_(j \, min)) . $ <eq:root-support-constant>]

This constant depends on the positive masses of $mu$, as well as its support. In particular, $kappa_mu = 0$ when every component is a singleton.

#thm([Proposition 5.1.])[
  (Conditioning through support components).  #emph[Let $G$ be a finite two-prover game with question distribution $mu$ and $v = omega^(*) \( G \)$. For any finite-dimensional strategy for $k$ copies and $C subset.neq \[ k \]$, suppose that 
$ E_C = { I_j = 1 upright(" for every ") j in C } \, #h(2em) p = Pr \( E_C \) > 0 . $

 Put $m = k - \| C \|$ and $tau = \( \| C \| log \( \| cal(A) \| \| cal(B) \| \) + log \( 1 \/ p \) \) \/ m$. Then 
#[#set math.equation(numbering: n => "(25)")
 $ 1 / m sum_(i in.not C) Pr \( I_i = 1 divides E_C \) lt.eq v + sqrt(frac(log \( 1 \/ p \), 2 m)) + 4 sqrt(kappa_mu tau) + 2 kappa_mu tau . $ <eq:root-conditioning>]

 The constants are independent of the strategy dimension and of $k$.]
] <prop:root-conditioning>

#proof[
  Write $G_j$ for the game with distribution $mu_j$ and the original predicate, and put $v_j = omega^(*) \( G_j \)$. Every positive-probability question $x$ identifies a unique component, because all support pairs with first entry $x$ are adjacent. The same holds for each $y$. Thus
  #[#set math.equation(numbering: n => "(26)")
   $ sum_j lambda_j v_j lt.eq v . $ <eq:root-component-values>]
  Indeed, tensor together finite-dimensional strategies approaching the finitely many component suprema, and let each player use the factor identified by the local question. Their weighted success approaches the left side. No supremum need be attained.
  We must control two changes. Replacing the vectors within a component will produce a legal strategy for $G_j$. Conditioning on $E_C$ can also change the frequencies of the components; after constructing those strategies, we will compare the new component weights with $lambda_j$.
  Use Lemma 8 for the fixed set $C$. In this proof we restore the mode $i in \[ m \]$ in the notation for its vectors and measurements. For $r = \( r_0 \, alpha \, gamma \)$ put
  $ w_(i \, r) = 1 / m w_i \( r \) = 1 / m nu_i \( r_0 \) theta \( r \) \, #h(2em) Psi_(i \, z)^r = Psi_(x y)^r quad \( z = \( x \, y \) \) . $
  These finite nonnegative weights do not depend on the fresh pair $z$. They need not sum to one. Let $Psi_(i \, x)^r \, Psi_(i \, y)^r$ be the local vectors from the exposure lemma, and let
  $ W_(i \, r \, z) = sum_(a \, b) V \( x \, y \, a \, b \) tilde(M)_(r \, x)^a ⊗ tilde(N)_(r \, y)^b . $
  Here the measurements also have their mode-$i$ dependence, and $0 lt.eq W_(i \, r \, z) lt.eq I$. The norm, error and fine-answer identities give
  #[#set math.equation(numbering: n => "(27)")
   $ sum_(i \, r \, z) w_(i \, r) mu \( z \) parallel Psi_(i \, z)^r parallel^2 & = p \,\
sum_(i \, r \, z) w_(i \, r) mu \( z \) c_(i \, r \, z) & lt.eq 2 p tau \,\
sum_(i \, r \, z) w_(i \, r) mu \( z \) chevron.l Psi_(i \, z)^r \, W_(i \, r \, z) Psi_(i \, z)^r chevron.r & = p macron(s) \, #h(2em) macron(s) = 1 / m sum_(i in.not C) Pr \( I_i = 1 divides E_C \) \, $ <eq:root-input-mass>]
  where
  $ c_(i \, r \, z) = parallel Psi_(i \, z)^r - Psi_(i \, x)^r parallel^2 + parallel Psi_(i \, z)^r - Psi_(i \, y)^r parallel^2 . $
  Choose a root $rho_j in H_j$. We first bound the error of replacing $Psi_(i \, z)^r$ by $Psi_(i \, rho_j)^r$ on its entire component. For fixed $i \, r$, abbreviate these vectors by $Psi_z$ and the costs by $c_z$. If $z \, z'$ share $y$, their common anchor $Psi_y$ gives $parallel Psi_z - Psi_(z') parallel^2 lt.eq 2 \( c_z + c_(z') \)$; the same assertion follows from $Psi_x$ when they share $x$. A simple path to the root has length at most $\| H_j \| - 1$. Cauchy–Schwarz along that path, and the fact that each vertex lies on at most two of its edges, give
  $ parallel Psi_z - Psi_(rho_j) parallel^2 lt.eq 4 \( \| H_j \| - 1 \) sum_(a in H_j) c_a lt.eq frac(4 \( \| H_j \| - 1 \), mu_(j \, min)) sum_(a in H_j) mu_j \( a \) c_a . $
  For a singleton component the left side is zero. Define
  $ E_j = sum_(i \, r \, z in H_j) w_(i \, r) mu_j \( z \) parallel Psi_(i \, z)^r - Psi_(i \, rho_j)^r parallel^2 \, #h(2em) E = sum_j lambda_j E_j . $
  Summing the path estimate and applying (27) shows
  #[#set math.equation(numbering: n => "(28)")
   $ E lt.eq kappa_mu p tau . $ <eq:root-path-error>]
  The root vectors now define legal component strategies. We compare their total squared norms and accepting masses with the corresponding masses before replacement. Define
  $ P_j & = sum_(i \, r \, z in H_j) w_(i \, r) mu_j \( z \) parallel Psi_(i \, z)^r parallel^2 \,\
hat(P)_j & = sum_(i \, r) w_(i \, r) parallel Psi_(i \, rho_j)^r parallel^2 \,\
T_j & = sum_(i \, r \, z in H_j) w_(i \, r) mu_j \( z \) chevron.l Psi_(i \, z)^r \, W_(i \, r \, z) Psi_(i \, z)^r chevron.r \,\
hat(T)_j & = sum_(i \, r \, z in H_j) w_(i \, r) mu_j \( z \) chevron.l Psi_(i \, rho_j)^r \, W_(i \, r \, z) Psi_(i \, rho_j)^r chevron.r . $
  If $hat(P)_j > 0$, the shared pure state
  $ \| Xi_j chevron.r = hat(P)_j^(- 1 \/ 2) sum_(i \, r) sqrt(w_(i \, r)) thin \| i \, r chevron.r_A \| i \, r chevron.r_B ⊗ Psi_(i \, rho_j)^r $
  is normalized and finite dimensional. Both players use the original transported POVMs, controlled by their shared flag $\( i \, r \)$. The state and the flag distribution are independent of the fresh questions: the vector arguments are fixed at $rho_j$, and the weights exclude the new pair. Each controlled measurement depends only on its own player’s input. The resulting success in $G_j$ is $hat(T)_j \/ hat(P)_j$. If $hat(P)_j = 0$, then $hat(T)_j = 0$. Therefore, in all cases,
  #[#set math.equation(numbering: n => "(29)")
   $ hat(T)_j lt.eq v_j hat(P)_j . $ <eq:root-legal-strategy>]
  For vectors $a \, b$ and an effect $0 lt.eq W lt.eq I$,
  $ \| chevron.l a \, W a chevron.r - chevron.l b \, W b chevron.r \| lt.eq \( parallel a parallel + parallel b parallel \) parallel a - b parallel . $
  Weighted Cauchy–Schwarz, with $W = I$ or $W = W_(i \, r \, z)$, consequently gives
  $ \| P_j - hat(P)_j \| \, med \| T_j - hat(T)_j \| lt.eq e_j := \( sqrt(P_j) + sqrt(hat(P)_j) \) sqrt(E_j) . $
  Write $hat(P) = sum_j lambda_j hat(P)_j$. The triangle inequality in the weighted direct sum of the vector spaces yields $sqrt(hat(P)) lt.eq sqrt(p) + sqrt(E)$. A further Cauchy–Schwarz inequality therefore gives
  $ sum_j lambda_j e_j lt.eq \( sqrt(p) + sqrt(hat(P)) \) sqrt(E) lt.eq 2 sqrt(p E) + E . $
  By (29) and $v_j lt.eq 1$, $T_j lt.eq v_j P_j + 2 e_j$. Since $sum_j lambda_j P_j = p$ and $sum_j lambda_j T_j = p macron(s)$, it follows that
  #[#set math.equation(numbering: n => "(30)")
   $ macron(s) lt.eq sum_j tilde(lambda)_j v_j + 4 sqrt(E \/ p) + 2 E \/ p \, #h(2em) tilde(lambda)_j = lambda_j P_j \/ p . $ <eq:root-conditional-components>]
  It remains to compare the conditional component weights with $lambda_j$. Let $J_i$ be the support component of the $i$-th untested question pair. The exact norm identity identifies $tilde(lambda)$ with the average of $"law" \( J_i divides E_C \)$ over $i in \[ m \]$. Unconditionally, $\( J_1 \, dots.h \, J_m \)$ has law $lambda^(⊗ m)$. After conditioning on $E_C$, its density relative to that law is at most $1 \/ p$, so
  $ D #scale(x: 120%, y: 120%)[\(] "law" \( J_1 \, dots.h \, J_m divides E_C \) thin parallel thin lambda^(⊗ m) #scale(x: 120%, y: 120%)[\)] lt.eq log \( 1 \/ p \) . $
  As in Lemma 9, product relative entropy bounds the sum of its marginal relative entropies. Pinsker’s inequality, convexity of total variation and Cauchy–Schwarz imply
  $ "TV" \( tilde(lambda) \, lambda \) lt.eq sqrt(frac(log \( 1 \/ p \), 2 m)) \, #h(2em) "TV" \( a \, b \) = 1 / 2 parallel a - b parallel_1 . $
  Because $0 lt.eq v_j lt.eq 1$, this bounds the increase of their weighted average. Substituting (26) and (28) into (30) proves (25). ◻
]

For a fixed $mu$, (25) is $O_mu \( sqrt(tau) + tau \)$. Song’s estimate in Proposition 5 has fourth-root error with a universal constant. Where both apply, one may use the smaller error. The proof above does not use Song’s sampler.

=== 5.1 The resulting threshold rate <the-resulting-threshold-rate>

#thm([Corollary 5.2.])[
  #emph[Let $G$ be a finite two-player game with Boolean acceptance predicate, question distribution $mu$, and entangled value $v < 1$. Put $d = \| cal(A) \| \| cal(B) \|$, and define $kappa_mu$ by (24). For every $0 < delta < 1 - v$, every $k gt.eq 1$, and every finite-dimensional joint strategy for $k$ repetitions, 
#[#set math.equation(numbering: n => "(31)")
 $ Pr #scale(x: 120%, y: 120%)[\(] W_k gt.eq ceil.l \( v + delta \) k ceil.r #scale(x: 120%, y: 120%)[\)] lt.eq exp (- frac(delta^3, 16384 \( 1 + kappa_mu \) \( 1 + log d \)) thin k) . $ <eq:support-threshold-rate>]

 The same bound holds for the supremum over those strategies.]
] <cor:support-threshold>

#proof[
  Proposition 10 bounds the conditioning error by
  $ sqrt(tau \/ 2) + 4 sqrt(kappa_mu tau) + 2 kappa_mu tau . $
  At $T = delta^2 \/ \( 1024 \( 1 + kappa_mu \) \)$, this is at most
  $ delta / 32 + delta / 8 + delta / 512 = frac(81 delta, 512) < delta / 4 . $
  Since also $T lt.eq delta \/ 4$, Proposition 4 gives (31). ◻
]

The larger of the exponents in (9) and (31) is valid. Lemma 2 gives the sharper probability zero when $v = 0$.

== 6 Two-sided error amplification <sec:amplification>

A threshold between completeness and soundness amplifies both guarantees without changing the number of players or rounds. Tensor copies of a single-game strategy give completeness; Theorem 1 controls soundness even for joint strategies across all repetitions.

#thm([Corollary 6.1.])[
  (Two-sided error amplification).  #emph[Let $G$ be a finite two-player one-round game in the model above, and fix $0 lt.eq s < c lt.eq 1$. Put $Delta = c - s$, $t = \( c + s \) \/ 2$, and $d = \| cal(A) \| \| cal(B) \|$. For an integer $k gt.eq 1$, let $H_k$ sample $k$ independent question pairs from $G$, send each player the entire local question string, and accept exactly when $W_k gt.eq ceil.l t k ceil.r$. Then 
$ omega^(*) \( G \) gt.eq c & quad arrow.r.double quad omega^(*) \( H_k \) gt.eq 1 - exp \( - Delta^2 k \/ 8 \) \,\
omega^(*) \( G \) lt.eq s & quad arrow.r.double quad omega^(*) \( H_k \) lt.eq exp #h(-0.16667em) (- frac(kappa_0 \( Delta \/ 2 \)^5, 1 + log d) thin k) \, $

 where $kappa_0$ is the universal constant in Theorem 1.]
] <cor:error-amplification>

#proof[
  For completeness, the supremum definition supplies a finite-dimensional strategy with success $p > c - Delta \/ 4 = t + Delta \/ 4$, whether or not the value is attained. Its $k$ tensor copies give independent Bernoulli win indicators of mean $p$. Since $W_k$ is integer valued, ${ W_k < ceil.l t k ceil.r } = { W_k < t k }$, so Hoeffding’s inequality #cite(label("hoeffding1963")) Theorem 2 bounds rejection by $exp \( - 2 \( p - t \)^2 k \) lt.eq exp \( - Delta^2 k \/ 8 \)$. For soundness, set $v = omega^(*) \( G \) lt.eq s$ and $delta = t - v$. Then $delta gt.eq Delta \/ 2 > 0$ and $delta < 1 - v$, since $t < 1$. Theorem 1 applies at exactly the threshold $ceil.l \( v + delta \) k ceil.r = ceil.l t k ceil.r$, uniformly over all finite-dimensional joint strategies; taking their supremum proves the claim. ◻
]

For polynomial-time verifier families with efficiently computable rational bounds $c \, s$, inverse-polynomial gap $c - s$, and polynomial answer bit-length, polynomially many repetitions therefore make both errors exponentially small in the input length, while preserving two provers, one round, and classical messages. Indeed, $1 + log d$ is polynomially bounded and the ceiling threshold is efficiently computable.


#bibliography("refs.bib", style: "ieee", title: [References])
