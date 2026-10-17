#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A directional zero--one law \
under strict ellipticity]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A walk in a fixed environment is a Markov chain. Averaging over an independent environment at every lattice site creates a different process: revisiting a site also revisits information about its transition probabilities. The directional zero–one problem asks whether the annealed probability of escape in one prescribed direction can lie strictly between zero and one. We resolve this problem positively in every dimension $d gt.eq 3$ for iid nearest-neighbor environments with strictly positive transition probabilities. No common positive lower bound on those probabilities is assumed.

=== 1.1 The model and the theorem <the-model-and-the-theorem>

Let $d gt.eq 3$ be an integer, let $e_1 \, dots.h \, e_d$ be the coordinate basis, and set

$ U = { plus.minus e_1 \, dots.h \, plus.minus e_d } \, #h(2em) cal(P)_U = {p in \[ 0 \, 1 \]^U : sum_(e in U) p \( e \) = 1} \, #h(2em) Omega = cal(P)_U^(bb(Z)^d) . $

Equip $Omega$ with its product Borel $sigma$-field. An environment $omega in Omega$ assigns a transition vector $omega \( x \, dot.op \)$ to each site $x$. We call this vector the #emph[row] at $x$. Let $mu$ be a probability measure on $cal(P)_U$, and let $bb(P) = mu^(⊗ bb(Z)^d)$. Thus the rows are independent and identically distributed; entries within one row need not be independent. Assume only

#[#set math.equation(numbering: n => "(1)")
 $ mu #scale(x: 120%, y: 120%)[\(] { p in cal(P)_U : p \( e \) > 0 upright(" for every ") e in U } #scale(x: 120%, y: 120%)[\)] = 1 . $ <eq:ellipticity>]

We call this #emph[strict ellipticity]. By countability, it gives $omega \( x \, e \) > 0$ simultaneously for all sites and steps, almost surely. Unlike uniform ellipticity, it permits the smallest row entry to be arbitrarily close to zero.

The path space is $cal(X) = \( bb(Z)^d \)^(bb(N)_0)$ with coordinate maps $X_n$ and the $sigma$-field $sigma \( X_n : n gt.eq 0 \)$. For $x in bb(Z)^d$ and a fixed environment, the #emph[quenched law] $P_(x \, omega)$ is the Markov-chain law specified by

$ P_(x \, omega) \( X_0 = x \) = 1 \, #h(2em) P_(x \, omega) \( X_(n + 1) = X_n + e divides X_0 \, dots.h \, X_n \) = omega \( X_n \, e \) . $

The #emph[annealed law] and its expectation are

$ P_x \( B \) = integral P_(x \, omega) \( B \) thin bb(P) \( d omega \) \, #h(2em) E_x . $

When both environment and path are needed, we use the joint law $sans(P)_x \( d omega \, d X \) = bb(P) \( d omega \) P_(x \, omega) \( d X \)$. The path filtration is $cal(F)_n = sigma \( X_0 \, dots.h \, X_n \)$; on the joint space the larger filtration $cal(G)_n = sigma \( omega \, X_0 \, dots.h \, X_n \)$ also reveals the entire environment. Quenched Markov arguments use $cal(G)_n$. The endpoint-posterior martingales later in the proof use $cal(F)_n$, with the environment integrated out. An unconditioned annealed path law will also be called the #emph[raw law].

For a nonzero vector $ell in bb(R)^d$, define

$ A_ell = { X_n dot.op ell arrow.r + oo } . $

#thm([Theorem 1.1.])[
  #emph[Let $d gt.eq 3$, let $bb(P)$ be an independent and identically distributed law of nearest-neighbor transition rows on $bb(Z)^d$ satisfying (1), and let $ell in bb(R)^d \\ { 0 }$. Then 
$ P_0 \( A_ell \) in { 0 \, 1 } . $

]
] <thm:main>

The direction is any fixed real vector; no rationality assumption is made, and no assertion of one exceptional null set uniform over all directions is needed. No inverse-transition or logarithmic moment, drift, balance, reversibility, or speed condition supplements (1). In the proof, a finite first moment for a #emph[spatial radius] is derived under the hypothesis that both signs have positive probability. No first moment for a regeneration duration, positive speed or ballisticity assertion is used or obtained from that estimate.

=== 1.2 Prior work <prior-work>

The directional question goes back to Kalikow #cite(label("Kalikow1981")); see also the historical discussion in #cite(label("Zerner2007")). The classical sign-union zero–one law concerns $P_0 \( A_ell union A_(- ell) \)$, not $P_0 \( A_ell \)$. It originates in the uniformly elliptic theory of Kalikow #cite(label("Kalikow1981")); its strict-ellipticity extension is #cite(label("ZernerMerkl2001")) Proposition 3, as recalled in #cite(label("Zerner2007")) Equation (1). Zerner and Merkl proved the one-sign directional law in dimension two for iid strictly elliptic environments #cite(label("ZernerMerkl2001")) Theorem 1, and Zerner gave a shorter proof #cite(label("Zerner2007")). Slonim extended the planar iid law to bounded jumps when almost surely there is a unique infinite communicating class reachable from every site #cite(label("Slonim2024")) Theorem 2.1. Theorem 1 establishes the directional zero–one conjecture for nearest-neighbor walks in every higher dimension under strict ellipticity.

The difficulty in higher dimensions is that the planar arguments force oppositely directed paths to meet by geometry; their quantitative counterpart must be supplied differently here. Berger proved that in dimensions $d gt.eq 5$ an iid uniformly elliptic walk has at most one nonzero limiting velocity #cite(label("Berger2008")) Theorem 1.1. This allows a second velocity equal to zero and leaves open the possibility of opposite directional escape at zero speed. Independence is also substantive: Bramson, Zeitouni, and Zerner constructed stationary, polynomially mixing, uniformly elliptic environments in $d gt.eq 3$ with positive probabilities of linear escape in opposite directions #cite(label("BramsonZeitouniZerner2006")) Theorem 3. Their Open Problem 3 formulates the higher-dimensional question for iid uniformly elliptic environments.

A non-uniformly elliptic special case is provided by Dirichlet-distributed rows. Sabot and Tournier obtained positive-probability transience in coordinate directions with positive corresponding mean drift, using reversal identities specific to that distribution #cite(label("SabotTournier2011")) Theorem 1. Bouchet proved the fixed-direction zero–one law in this class for $d gt.eq 3$ by studying an accelerated walk and an invariant law for the environment viewed from the particle #cite(label("Bouchet2013")) Corollary 4. Tournier identified the asymptotic direction as that of the initial drift when this drift is nonzero #cite(label("Tournier2015")) Corollary 1. The argument below applies to arbitrary iid strictly positive rows and uses only translations of its path pieces.

The regeneration structure of Sznitman and Zerner #cite(label("SznitmanZerner1999")) is a central tool. We give the factorization and width arguments needed below, including the distinction between real projected heights and integer record indices. Simenhaus proved that distinct deterministic asymptotic directions occurring with positive probability must be opposite #cite(label("Simenhaus2007")) Proposition 1. His existence theorem for an asymptotic direction assumes transience on a nonempty open set of directions. Drewitz and Ramírez obtained a corresponding two-ray description under sign-union transience on an open set, equivalently in $d$ linearly independent directions #cite(label("DrewitzRamirez2010")) Theorem 1.8. Those hypotheses do not follow here from the initial assumption in one direction. In our contradiction argument, the spatial radius estimate supplies the two rays first; a self-contained argument then proves their antipodality. The remaining estimates concern contacts between two arrangements of regeneration pieces.

=== 1.3 Proof strategy <proof-strategy>

Two fresh-row arguments make the proof work without a common positive lower bound on the transition probabilities. First, finite-width slab escape (Lemma 3) is proved using recurrent-site trials and first visits to new columns, in the spirit of #cite(label("ZernerMerkl2001")) Lemma 4. Second, scripts launched from a tilted record use pairwise distinct, previously unused rows. Their annealed cost is a product of positive row averages, rather than a product of uniform quenched lower bounds.

Suppose, toward a contradiction, that $0 < P_0 \( A_ell \) < 1$. A slab-exit argument and fresh-half-space regeneration first show that the path escapes in one of the two signs almost surely. At a strict record from which the path never falls below its new height, the future factors from the past. The path between successive such records is a finite #emph[regeneration piece]. Under conditioning never to backtrack, these pieces are independent and identically distributed. Their mean height width is finite, even for an irrational direction.

The first main step, Proposition 8, proves that coexistence of the two signs also forces finite mean spatial radius of a piece. A very large lateral excursion would create a record in a tilted direction. From that record, a fresh continuation escaping in the opposite sign has a probability bounded below independently of the excursion scale. This would give a fixed positive probability to arbitrarily large finite height maxima, contradicting the tail of their distribution. The radius bound gives deterministic limiting rays on the two escape events; the rays must be opposite. We may therefore reduce to coexistence in one coordinate direction.

We then sample two independent sequences of coordinate regeneration pieces. Place positive pieces downward by successively anchoring their #emph[terminal] points, and place negative pieces downward in their ordinary chronological order. Individual path words retain their original orientation. Heights at which both sequences have a piece boundary divide the arrangement into independent common blocks. A #emph[contact] is a site from which both arranged paths depart. For each dyadic interval of common-block indices, consider whether a contact occurs. Let $m \( J \)$ be the sum of these probabilities over the first $J$ such intervals, as defined precisely in (23).

The two final steps give

$ m \( J \) = O #h(-0.16667em) (frac(J, log J)) \, #h(2em) m \( J \) gt.eq c thin frac(J, log log J) quad upright("for large ") J \, $

with $c > 0$, which are incompatible. For the upper bound, Proposition 14 compares the arrangement with independent bridges of prescribed heights. Randomizing the number of blocks keeps the cost of replacing each chunk by bridges of its realized height bounded. An independent stretch of blocks before the comparison interval turns the lateral alignment cost into an increment of displacement entropy. These increments telescope over dyadic scales, while finite mean widths make the bridge contact probabilities summable on those scales. A relative-entropy bound converts these two estimates into the stated bound for the expected number of contact intervals.

For the lower bound, view a positive bridge in chronological order and start the negative path just below its random endpoint. A union bound over all possible endpoints would be too expensive. Instead, the conditional probabilities of the possible endpoints form a vector of annealed martingales. Lemma 17 bounds the sum of their running maxima by an exponential tail on a logarithmic scale. In Proposition 18, first-contact prefixes are transferred to one shared environment before they are classified by quenched exit probabilities; the posterior functions remain in the unrevealed annealed path filtration. This separation controls the endpoint-dependent alignment without imposing a martingale property after the environment is revealed. A range of dyadic height intervals without a contact forces a late first contact near the top. Applying the estimate at the many regeneration boundaries in that range yields many contact height scales. The finite mean common-block width then converts the height count into the block-index count $m \( J \)$.

Section 2 proves the path-weight and regeneration facts. Section 3 establishes the spatial moment bound. Section 4 reduces to coordinate heights and defines the common arrangement. Sections 5 and 6 prove the entropy and endpoint-posterior estimates. Section 7 gives the lower contact count and completes the theorem.

== 2 Regeneration in a real direction <sec:regeneration>

Following the regeneration approach of Sznitman and Zerner #cite(label("SznitmanZerner1999")), we construct finite path pieces whose successive translates are independent. Their terminal times are selected using the entire future, so the usual stopping-time Markov property does not establish this independence. An exact factorization of finite path weights will do so. Counting ordinary records then gives a finite mean projected width, even when the projected heights do not lie in a discrete subgroup of $bb(R)$.

=== 2.1 Departure rows and path weights <departure-rows-and-path-weights>

A finite nearest-neighbor word is a sequence $gamma = \( x_0 \, dots.h \, x_m \)$ with $x_(j + 1) - x_j in U$. Its departure set and annealed weight are

$ "Dep" \( gamma \) = { x_0 \, dots.h \, x_(m - 1) } \, #h(2em) W \( gamma \) = bb(E) #h(-0.16667em) [product_(j = 0)^(m - 1) omega \( x_j \, x_(j + 1) - x_j \)] \, $

where the expectation in this display is over the environment. Thus $W \( gamma \) = P_(x_0) \( X_j = x_j \, med 0 lt.eq j lt.eq m \)$. A row visited repeatedly contributes repeatedly to the same product inside the expectation. The terminal site contributes no row unless the word departed from it earlier. Translation invariance gives $W \( gamma + z \) = W \( gamma \)$.

#thm([Lemma 2.1.])[
  (Transfer through unused departure rows).  #emph[Let $gamma = \( x_0 \, dots.h \, x_m \)$ be a finite nearest-neighbor word and let $f \( omega \)$ be a nonnegative measurable function of the rows outside $"Dep" \( gamma \)$. Then 
#[#set math.equation(numbering: n => "(2)")
 $ bb(E) #h(-0.16667em) [product_(j = 0)^(m - 1) omega \( x_j \, x_(j + 1) - x_j \) f \( omega \)] = W \( gamma \) bb(E) \[ f \] . $ <eq:departure-transfer>]

 In particular, two prescribed words with disjoint departure sets have the same joint weight when sampled under independent annealed laws as when sampled independently conditional on one shared environment.]
  #emph[The identity also applies when $f \( omega \)$ is the quenched probability of an event for another walk stopped on its first arrival in $"Dep" \( gamma \)$. Events that require this other walk to avoid that set forever are allowed.]
] <lem:departure-transfer>

#proof[
  The product in (2) depends only on rows in $"Dep" \( gamma \)$, which are independent of all the rows defining $f$. This proves the identity. For two words, conditional independence in the shared environment gives the product of their quenched weights, and (2) factors its environment expectation.
  A trajectory stopped on arrival in a set does not use the row at that arrival site. Its finite stopped-prefix probabilities therefore depend only on rows outside the set. The same is true of every measurable event of the stopped trajectory, by the monotone class theorem. This includes events on which the stopping time is infinite. ◻
]

The transfer is made for unclassified path weights. A condition involving a quenched exit probability can depend on rows on both sides of the separation and cannot simply be inserted into the independent side of (2). Later we will first apply this identity and then classify sites in the shared environment.

=== 2.2 Fresh records and true cuts <fresh-records-and-true-cuts>

Fix $v in bb(R)^d \\ { 0 }$, normalized by $parallel v parallel_oo = 1$, and write $h \( x \) = x dot.op v$. Define

$ D_v = { h \( X_n \) gt.eq 0 upright(" for all ") n gt.eq 0 } \, #h(2em) p_v = P_0 \( D_v \) \, #h(2em) hat(P)_v = P_0 \( thin dot.op divides D_v \) $

when $p_v > 0$. All statements in Section 2 concern this fixed real direction. We write $hat(E)_v$ for expectation under $hat(P)_v$. No arithmetic assumption on the coordinates of $v$ is imposed.

The next lemma follows the repeated-trial approach of Zerner and Merkl #cite(label("ZernerMerkl2001")) Lemma 4. We give the argument to specify which transition rows remain unused at each trial.

#thm([Lemma 2.2.])[
  (Finite height supremum).  #emph[For this fixed real direction, almost surely under $P_0$, 
$ sup_(n gt.eq 0) h \( X_n \) < oo quad arrow.r.double quad h \( X_n \) arrow.r - oo . $

 In particular, a finite height interval cannot contain the path forever. The corresponding statements hold from every translated starting site, and hold quenched for almost every environment, simultaneously for all such starting sites.]
] <lem:finite-supremum>

#proof[
  Fix nonnegative integers $b \, k$, a signed coordinate step $a in U$ with $h \( a \) = 1$, and an integer $m > b + k$. It suffices to rule out
  $ E_(b \, k) = { h \( X_n \) lt.eq b upright(" for every ") n \, med h \( X_n \) gt.eq - k upright(" infinitely often") } . $
  Partition the lattice into columns, the cosets of $bb(Z) a$. Every column has only finitely many sites with height in $\[ - k \, b \]$: its successive heights differ by exactly one, regardless of the other coordinates of $v$.
  First suppose that only finitely many columns are visited at heights at least $- k$. On $E_(b \, k)$, some fixed site $x$ of height in $\[ - k \, b \]$ is then visited infinitely often. Fix an environment whose transition entries are all positive. At every visit to this particular site the quenched probability of the script consisting of $m$ steps $a$ is
  $ q_x \( omega \) = product_(j = 0)^(m - 1) omega \( x + j a \, a \) > 0 . $
  Choose the first visit as a trial start, and subsequently choose the first visit at least $m$ steps after the preceding start. These are stopping times. By the quenched strong Markov property, the probability that $r$ such trials are finite and all fail is at most $\( 1 - q_x \( omega \) \)^r$. Infinitely many visits provide infinitely many trials, while a successful script would cross above $b$. Thus the specified event has quenched probability zero. A countable union over $x$ and integration over the environment handle this first case. There is no need to bound $q_x \( omega \)$ uniformly in $x$ or $omega$.
  For the other case, consider the first visit, for each column, to its portion of height at least $- k$. These eligibility decisions are determined by the observed path prefix. Select the first eligible time as a trial start, and thereafter the first eligible time at least $m$ steps after the preceding trial start. If infinitely many columns have such visits, infinitely many trial starts remain after these finite exclusions. At an eligible time, every earlier visit in the same column had height below $- k$. Consequently the $m$ scripted departure sites, all at height at least $- k$, are distinct and have not appeared earlier. Conditional on any fixed eligible prefix, their rows retain their original independent laws. The annealed conditional probability of the script is therefore exactly
  $ q_a^m \, #h(2em) q_a := bb(E) \[ omega \( 0 \, a \) \] > 0 . $
  The probability that $r$ selected trials are finite and all fail is at most $\( 1 - q_a^m \)^r$. On $E_(b \, k)$ every one fails, so the second case is also null. This argument uses no conditioning on the future event $E_(b \, k)$ when evaluating a trial probability.
  Taking the countable union over $b \, k$ proves the implication: a path from zero with finite height supremum that does not tend to minus infinity belongs to some $E_(b \, k)$. Translation gives the same annealed conclusion from every lattice site. Integrating the quenched probabilities of these null events, and taking a countable intersection over starting sites and integer bounds, gives the last assertion. ◻
]

#thm([Lemma 2.3.])[
  #emph[If $P_0 \( A_v \) > 0$, then $p_v > 0$.]
] <lem:positive-nonbacktracking>

#proof[
  On $A_v$, the sequence $h \( X_n \)$ tends to $+ oo$ and therefore attains a global minimum. Thus $A_v$ is contained in the countable union, over $n gt.eq 0$ and $x in bb(Z)^d$, of the events
  $ { X_n = x \, med h \( X_(n + k) \) gt.eq h \( x \) upright(" for every ") k gt.eq 0 } . $
  At least one such event has positive probability. Put $q_v \( x \, omega \) = P_(x \, omega) \( h \( X_k \) gt.eq h \( x \) upright(" for all ") k gt.eq 0 \)$. The quenched Markov property at the deterministic time $n$ gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] P_(0 \, omega) \( X_n = x \) q_v \( x \, omega \) #scale(x: 120%, y: 120%)[\]] > 0 . $
  Consequently $bb(E) \[ q_v \( x \, omega \) \] > 0$, and translation invariance identifies this expectation with $p_v$. This argument does not use a Markov property at the time of the global minimum. ◻
]

The ordinary strict-record times are the stopping times

$ rho_0 = 0 \, #h(2em) rho_(i + 1) = inf { n > rho_i : h \( X_n \) > h \( X_(rho_i) \) } \, $

with all subsequent times set to infinity if one is infinite. A finite $rho_i$, $i gt.eq 1$, is a #emph[true cut] if

$ h \( X_n \) gt.eq h \( X_(rho_i) \) quad upright("for every ") n gt.eq rho_i . $

Truth of a cut is not measurable at its arrival time. Whenever true cuts exist, $tau_1 \, tau_2 \, dots.h$ enumerate them in time order.

At an ordinary strict record, every earlier departure has height strictly below the current height. The closed upper half-space is therefore unused. Applying Lemma 2 to each finite record prefix and translating its endpoint gives

#[#set math.equation(numbering: n => "(3)")
 $ P_0 #scale(x: 120%, y: 120%)[\(] h \( X_(rho_i + k) \) gt.eq h \( X_(rho_i) \) upright(" for all ") k gt.eq 0 divides cal(F)_(rho_i) #scale(x: 120%, y: 120%)[\)] = p_v quad upright("on ") { rho_i < oo } . $ <eq:fresh-record>]

This is an identity in the annealed path filtration. Conditional on the whole environment, the corresponding probability would instead be $q_v \( X_(rho_i) \, omega \)$.

For a word $gamma = \( 0 = x_0 \, dots.h \, x_m = z \)$, say that it is a #emph[regeneration word in direction $v$] if $m gt.eq 1$ and the following two conditions hold:

+ $0 lt.eq h \( x_j \) < h \( z \)$ for every $0 lt.eq j < m$;
+ whenever $1 lt.eq j < m$ is a strict record within the word, there is a $k$ with $j < k < m$ and $h \( x_k \) < h \( x_j \)$.

The second condition says that every intermediate record has already failed before the final arrival. Define the width and radius of such a word by

$ L \( gamma \) = h \( z \) > 0 \, #h(2em) R \( gamma \) = max_(0 lt.eq j lt.eq m) parallel x_j parallel_2 . $

Both are finite, but the width need not be an integer.

#thm([Lemma 2.4.])[
  (Regeneration words).  #emph[Suppose $p_v > 0$. Under $hat(P)_v$, there are almost surely infinitely many true cuts $0 = tau_0 < tau_1 < tau_2 < dots.h.c$, with time zero included as an initial boundary. The relative words between consecutive cuts are independent and identically distributed, with probability law $nu_v$ given by 
$ nu_v \( gamma \) = W \( gamma \) $

 on the regeneration words in direction $v$. The departure heights within each word belong to $\[ 0 \, L \)$ relative to its starting height.]
  #emph[Under the unconditioned law, on ${ sup_n h \( X_n \) = oo }$ a first true strict record exists almost surely. Conditional on its finite prefix, the translated future has law $hat(P)_v$.]
] <lem:slabs>

#proof[
  We first establish existence using stopping-time trials. Test the first ordinary strict record. If the path later falls below its height, wait until the first strict record above the entire path seen at that failure time, and test again. The candidates and the times at which failures are detected are stopping times. By (3), the probability that the first $k$ tested candidates are finite and fail is at most $\( 1 - p_v \)^k$. On ${ sup_n h \( X_n \) = oo }$, a new candidate is available after every detected failure. Hence a true cut exists there almost surely.
  Under $hat(P)_v$, the height supremum is infinite almost surely by Lemma 3: its alternative conclusion of escape to minus infinity is incompatible with $D_v$. In particular the first true cut is finite under $hat(P)_v$. This application of Lemma 3 is valid before any independence or integrability of slabs has been proved.
  We now compute its law. Fix a regeneration word $gamma = \( 0 \, dots.h \, z \)$ of length $m$ and a measurable event $B$ for the translated infinite suffix. The first true-cut word is $gamma$ exactly when this prefix occurs and the suffix from $z$ belongs to $D_v$. For necessity, an earlier record not invalidated by time $m$ could never be invalidated by a future remaining above $h \( z \)$, so it would be an earlier true cut. For sufficiency, the word’s intermediate records have all failed, while its terminal record is true.
  The finite prefix uses only rows below $h \( z \)$, whereas its suffix constrained by $D_v$ uses only rows at or above $h \( z \)$. Thus
  $ P_0 #scale(x: 120%, y: 120%)[\(] \( X_0 \, dots.h \, X_m \) = gamma \, med tau_1 = m \, med \( X_(m + k) - z \)_(k gt.eq 0) in B #scale(x: 120%, y: 120%)[\)] = W \( gamma \) P_0 \( B ∩ D_v \) . $
  The event on the left implies the original $D_v$. Division by $p_v$ therefore gives
  #[#set math.equation(numbering: n => "(4)")
   $ hat(P)_v #scale(x: 120%, y: 120%)[\(] Gamma_1 = gamma \, med \( X_(tau_1 + k) - X_(tau_1) \)_(k gt.eq 0) in B #scale(x: 120%, y: 120%)[\)] = W \( gamma \) hat(P)_v \( B \) . $ <eq:slab-factorization>]
  Here $Gamma_1$ denotes the first relative word. Since $tau_1$ is almost surely finite, summing over all such words proves that their weights sum to one. Equation (4) gives an independent suffix with the original conditioned law, and iteration proves the iid assertion. The departure-height claim is part of the word definition.
  For the unconditioned first true cut, the same word enumeration allows a prefix that goes below zero. Its endpoint is still a strict global record, and each earlier strict record must have failed before that endpoint. The fresh-suffix factor is again $P_0 \( B ∩ D_v \)$, so its conditional translated law is $hat(P)_v$. No Markov property at a future-dependent cut has been used. ◻
]

We call these relative words #emph[slabs]. The preceding proof gives their complete law, not just independence of their displacements. This will allow us to arrange whole slabs in different spatial positions.

=== 2.3 Mean width and the two signs <mean-width-and-the-two-signs>

The record heights can have arbitrarily small positive increments in a real direction. The next argument instead renews in the integer index of an ordinary record.

#thm([Lemma 2.5.])[
  (Finite mean width).  #emph[Suppose $p_v > 0$ and $parallel v parallel_oo = 1$. If $S$ is the number of ordinary strict records after the initial boundary of a slab with law $nu_v$, including its terminal record, then 
$ 0 < bb(E)_(nu_v) L lt.eq bb(E)_(nu_v) S lt.eq p_v^(- 1) < oo . $

]
] <lem:mean-width>

#proof[
  For $i gt.eq 1$, let
  $ B_i = { rho_i < oo \, med h \( X_n \) gt.eq 0 upright(" for ") 0 lt.eq n lt.eq rho_i } . $
  Freshness at $rho_i$ and cancellation of the conditioning probability give
  #[#set math.equation(numbering: n => "(5)")
   $ hat(P)_v \( i upright(" is a true-record index") \) = frac(P_0 \( B_i \, med rho_i upright(" is true") \), p_v) = P_0 \( B_i \) gt.eq p_v . $ <eq:record-renewal-mass>]
  The last inequality follows because $D_v$ forces an infinite supremum and hence reaches every ordinary record index before dropping below zero.
  At a cut, its height is the maximum of the entire past. The subsequent ordinary records are therefore exactly the records of the translated suffix. By Lemma 5, the successive true-record indices are sums of iid positive integers $S_1 \, S_2 \, dots.h$ with the law of $S$. Let
  $ N \( n \) = \# { k gt.eq 1 : S_1 + dots.h.c + S_k lt.eq n } . $
  Summing (5) yields $hat(E)_v \[ N \( n \) \/ n \] gt.eq p_v$. If $bb(E)_(nu_v) S = oo$, the strong law applied to every bounded truncation $S_j and a$ gives $\( S_1 + dots.h.c + S_k \) \/ k arrow.r oo$. Inverting these sums gives $N \( n \) \/ n arrow.r 0$ almost surely. Since $0 lt.eq N \( n \) \/ n lt.eq 1$, dominated convergence contradicts the preceding lower bound. Thus the mean of $S$ is finite. The ordinary strong law and the same inversion now give $N \( n \) \/ n arrow.r 1 \/ bb(E)_(nu_v) S$; dominated convergence proves $bb(E)_(nu_v) S lt.eq 1 \/ p_v$.
  Each ordinary record height gain is at most one: its final step has height increment at most $parallel v parallel_oo = 1$, and starts no higher than the preceding maximum. Adding the gains within one slab gives $L lt.eq S$. Finally, $L > 0$ almost surely, so its mean is strictly positive. ◻
]

Lemma 6 controls record count and projected width, not the number of time steps in a slab.

#thm([Lemma 2.6.])[
  (The two directional signs).  #emph[For every fixed nonzero real direction $v$, if $P_0 \( A_v \) > 0$, then 
$ P_0 \( A_v union A_(- v) \) = 1 . $

 More precisely, up to null sets, infinite height supremum implies $A_v$ and finite height supremum implies $A_(- v)$.]
] <lem:sign-union>

#proof[
  Normalize $v$ as above. Lemma 4 gives $p_v > 0$. On infinite height supremum, Lemma 5 provides a first true cut followed by iid slabs. Their positive widths have finite, strictly positive mean by Lemma 6, so the successive base heights tend to infinity. Every later slab stays at or above its base, and consequently $h \( X_n \) arrow.r + oo$.
  The finite-supremum implication is exactly Lemma 3. These two alternatives exhaust all paths and prove the sign union. ◻
]

Thus a probability strictly between zero and one for $A_v$ supplies positive probabilities for both signs. In Section 3, that coexistence assumption will give the stronger spatial estimate $bb(E)_(nu_v) R + bb(E)_(nu_(- v)) R < oo$.

== 3 Finite spatial radii under coexistence <sec:radius>

The regeneration construction controls the advance of a slab in its chosen direction. We now control its full spatial extent, assuming that escape in both directions has positive probability. The idea is to turn a very large slab into a new record for a slightly tilted linear functional. From that record a fresh path escaping in the opposite direction can preserve the current height maximum forever. If mean spatial radii were infinite, this would give a fixed positive probability that the final maximum is finite but arbitrarily large, which is impossible.

#thm([Proposition 3.1.])[
  (Spatial radius under coexistence).  #emph[Let the environment consist of iid strictly positive transition rows, and let $v in bb(R)^d \\ { 0 }$. Suppose $P_0 \( A_v \) > 0$ and $P_0 \( A_(- v) \) > 0$. For each sign $sigma in { + \, - }$, let $nu_(sigma v)$ be the slab law from Lemma 5. If $R$ is the maximum Euclidean distance from a slab’s initial site, including its terminal site, then 
$ integral R thin d nu_v + integral R thin d nu_(- v) < oo . $

]
] <prop:radius>

This is a spatial moment statement. It asserts no moment bound on the number of steps in a slab.

We first record a maximal inequality that will control all initial portions of a sequence of slabs at once. It is a consequence of Hopf’s maximal ergodic theorem; see Garsia’s proof #cite(label("Garsia1965")). The interval argument below gives the precise stationary-sequence form that we use.

#thm([Lemma 3.2.])[
  (Initial averages).  #emph[Let $\( Z_j \)_(j gt.eq 1)$ be a stationary sequence of nonnegative integrable random variables. For every $a > 0$ and positive integer $n$, 
$ P (max_(1 lt.eq k lt.eq n) 1 / k sum_(j = 1)^k Z_j > a) lt.eq frac(E Z_1, a) . $

]
] <lem:initial-averages>

#proof[
  Call an integer $s$ a bad start if an interval beginning at $s$, of length at most $n$, has sum greater than $a$ times its length. Among starts $1 \, dots.h \, M$, take the leftmost bad start, choose a witness interval, skip all its indices, and repeat. The chosen intervals are disjoint, cover every bad start, and lie in ${ 1 \, dots.h \, M + n }$. Their total length is at least the number of bad starts. Therefore
  $ a thin \# { s lt.eq M : s upright(" is bad") } lt.eq sum_(j = 1)^(M + n) Z_j . $
  Taking expectations, using stationarity, and letting $M arrow.r oo$ proves the assertion. ◻
]

#proof[
  The construction has two parts. A displacement allowance $a$ and a number $N$ of slabs will be chosen so that most initial portions have total radius at most $a$ times their length, but some slab has a much larger excursion with probability bounded below. That excursion supplies a record for a small tilt of the opposite height direction. The continuation then avoids the old prefix in two successive regions: it stays beyond the tilted record for a fixed multiple of $N$ slabs, and after their final true cut it stays at negative height. The estimates below arrange these two separations with a continuation probability independent of $a$ and $N$.
  Rescale $v$ so that $parallel v parallel_oo = 1$. For either sign, under $hat(P)_(sigma v)$ let $\( L_i \, R_i \)_(i gt.eq 1)$ denote the widths and radii of its iid slabs, and put $H_k = sum_(i = 1)^k L_i$, with $H_0 = 0$. Write $E_sigma$ for expectation in this slab sequence. Lemma 6 gives $0 < E_sigma L < oo$. A point in slab $k + 1$ has signed height at least $H_k$, and the displacement of any point through slab $k$ has norm at most $sum_(j = 1)^k R_j$.
  ===== 3.1 Scales with controlled initial portions. <scales-with-controlled-initial-portions.>
  Suppose, to obtain a contradiction, that
  $ I \( t \) := sum_(sigma in { + \, - }) E_sigma min \( R \, t \) arrow.r oo . $
  The function $I$ is increasing and concave, $I \( 0 \) = 0$, and $I \( t \) = o \( t \)$. The last assertion follows by bounded convergence from $R < oo$ almost surely.
  By the two width strong laws we may fix $c > 0$ and finite $C \, C_0 gt.eq 0$ such that, in each sign,
  #[#set math.equation(numbering: n => "(6)")
   $ hat(P)_(sigma v) #scale(x: 120%, y: 120%)[\(] c k - C_0 lt.eq H_k lt.eq C k + C_0 upright(" for every ") k gt.eq 0 #scale(x: 120%, y: 120%)[\)] > .95 . $ <eq:radius-height-bounds>]
  Indeed choose $c$ below both means and $C$ above both means, then choose $C_0$ to bound the almost surely finite maximal deviations with the displayed probability. Fix, in this order, an integer $C_1$, numbers $b \, B$, and $eta > 0$, so that
  #[#set math.equation(numbering: n => "(7)")
   $ C_1 c > C + 4 \, #h(2em) b > 1 \/ c \, #h(2em) frac(B - 1, sqrt(d)) - b \( C + 2 \) > 2 \, #h(2em) 4 C_1 eta < .15 . $ <eq:radius-constants>]
  The multiplier $C_1$ gives the opposite continuation enough slabs to descend below height zero. The coefficient $b$ makes its height descent dominate its lateral displacement in the tilted functional; $B$ ensures that a large excursion creates a new tilted record. Finally, $eta$ controls the probability that an initial portion exceeds its displacement allowance. These constants remain fixed throughout the proof.
  For large $a$, let $N = N \( a \)$ be the smallest positive integer such that $I \( a N \) gt.eq eta a$. Such an integer exists. Since $I \( a m \) \/ a arrow.r 0$ for every fixed $m$, we have $N \( a \) arrow.r oo$. For sufficiently large $a$, minimality and concavity give
  #[#set math.equation(numbering: n => "(8)")
   $ eta a lt.eq I \( a N \) lt.eq frac(N, N - 1) I \( a \( N - 1 \) \) < 2 eta a . $ <eq:radius-scale>]
  In either sign and for $m gt.eq 0$, define $cal(R)_m$ to be the event that, for every $k lt.eq m$,
  $ c k - C_0 lt.eq H_k lt.eq C k + C_0 \, #h(2em) sum_(j = 1)^k R_j lt.eq a k . $
  We claim that
  #[#set math.equation(numbering: n => "(9)")
   $ hat(P)_(sigma v) \( cal(R)_(C_1 N) \) > .8 . $ <eq:radius-good-prefix>]
  To see this, put $n = C_1 N$, $A = a n$, and truncate each radius to $hat(R)_j = min \( R_j \, A \)$. Concavity and (8) give
  $ E_sigma hat(R) lt.eq I \( A \) lt.eq C_1 I \( a N \) < 2 C_1 eta a . $
  Lemma 9 bounds by $2 C_1 eta$ the probability that any of the first $n$ averages of the truncated radii exceeds $a$. Also
  $ hat(P)_(sigma v) \( exists j lt.eq n : R_j > A \) lt.eq n hat(P)_(sigma v) \( R > A \) lt.eq frac(n E_sigma min \( R \, A \), A) lt.eq 2 C_1 eta . $
  Intersecting these estimates with (6) proves (9). In particular, $hat(P)_(sigma v) \( cal(R)_(i - 1) \) > .8$ for $i lt.eq N$, and $cal(R)_(i - 1)$ depends only on the first $i - 1$ slabs.
  ===== 3.2 A large slab after a controlled initial portion. <a-large-slab-after-a-controlled-initial-portion.>
  Choose a lower index $i_0$ so large that
  #[#set math.equation(numbering: n => "(10)")
   $ sum_sigma sum_(i gt.eq i_0) hat(P)_(sigma v) \( L > i \) < frac(eta, 4 B) . $ <eq:radius-width-tail>]
  This is possible by integrability of the widths. Increase $i_0$ if necessary so that, for every $i gt.eq i_0$,
  #[#set math.equation(numbering: n => "(11)")
   $ c \( i - 1 \) - C_0 gt.eq c i \/ 2 \, #h(2em) C \( i - 1 \) + C_0 + i lt.eq \( C + 2 \) i . $ <eq:radius-index-margins>]
  After fixing $i_0$, take $a$ sufficiently large that $N gt.eq i_0$ and $I \( B a i_0 \) < eta a \/ 4$.
  For $i_0 lt.eq i lt.eq N$, call
  $ G_i = { R_i > B a i \, med L_i lt.eq i } $
  the large-slab event, and put $lambda_sigma = sum_(i = i_0)^N hat(P)_(sigma v) \( G_i \)$. Integrating the decreasing radius tails gives
  $ sum_sigma sum_(i = i_0)^N hat(P)_(sigma v) \( R > B a i \) & gt.eq frac(I \( B a \( N + 1 \) \) - I \( B a i_0 \), B a) \,\
sum_sigma sum_(i = 1)^N hat(P)_(sigma v) \( R > B a i \) & lt.eq frac(I \( B a N \), B a) lt.eq 2 eta . $
  For the last bound, use $I \( B a N \) lt.eq B I \( a N \)$. For the lower bound, use $I \( B a \( N + 1 \) \) gt.eq I \( a N \) gt.eq eta a$, then subtract (10). The result is
  $ frac(eta, 2 B) lt.eq lambda_(+) + lambda_(-) lt.eq 2 eta . $
  Thus one sign, which may depend on the scale, satisfies $lambda_sigma gt.eq eta \/ \( 4 B \)$.
  In this sign consider
  $ Z = sum_(i = i_0)^N upright(bold(1))_(cal(R)_(i - 1)) upright(bold(1))_(G_i) . $
  Independence of the $i$-th slab from its preceding slabs gives $E_sigma Z gt.eq .8 lambda_sigma$. The summands of $Z$ need not be independent, but $Z lt.eq sum_i upright(bold(1))_(G_i)$, whose summands are independent. Hence
  $ E_sigma Z^2 lt.eq lambda_sigma + lambda_sigma^2 \, #h(2em) hat(P)_(sigma v) \( Z > 0 \) gt.eq frac(.64 lambda_sigma, 1 + lambda_sigma) gt.eq frac(.64 eta, 4 B \( 1 + 2 eta \)) = : delta > 0 . $
  The constant $delta$ is independent of $i_0$ and $a$.
  We have therefore found, with a probability independent of the scale, a slab whose spatial excursion is much larger than the accumulated displacement before it, while its height width is at most its index. The next step converts that excursion into a stopping time from which an opposite-going path can use fresh environment rows.
  ===== 3.3 A tilted record. <a-tilted-record.>
  Write $h \( x \) = sigma v dot.op x$ for the sign just selected. On $cal(R)_(i - 1) ∩ G_i$, the initial site of slab $i$ has norm at most $a \( i - 1 \)$. Some point of the slab consequently has norm greater than $\( B - 1 \) a i$. At that point some signed coordinate $u in { plus.minus e_1 \, dots.h \, plus.minus e_d }$ satisfies
  $ u dot.op X > frac(B - 1, sqrt(d)) a i . $
  Throughout this slab its running $h$-maximum is at least $H_(i - 1) gt.eq c i \/ 2$, and at most $H_i lt.eq \( C + 2 \) i$, by (11).
  Define the linear functional
  $ Y \( x \) = u dot.op x - b a h \( x \) . $
  Before slab $i$, nonnegative height and $cal(R)_(i - 1)$ give $Y \( X \) lt.eq a \( i - 1 \)$. At the selected point,
  $ Y \( X \) > (frac(B - 1, sqrt(d)) - b \( C + 2 \)) a i > 2 a i . $
  There is thus a strict $Y$-record while the running $h$-maximum lies in the deterministic window
  #[#set math.equation(numbering: n => "(12)")
   $ W = \[ c i_0 \/ 2 \, \( C + 2 \) N \] . $ <eq:radius-window>]
  For each fixed choice of $sigma \, u \, i_0 \, a$, let $T$ be the first positive integer time such that the following three conditions hold: the entire prefix has nonnegative $h$-height; $Y \( X_T \)$ is a strict record; and the running $h$-maximum belongs to $W$. These are conditions on the observed prefix, so $T$ is a stopping time for $\( cal(F)_n \)$. It need not be a true regeneration time. The preceding construction and a union over the $2 d$ signed coordinates show that some $u$ satisfies
  $ hat(P)_(sigma v) \( T < oo \) gt.eq frac(delta, 2 d) . $
  Set $p_(*) := min \( p_v \, p_(- v) \) > 0$. Removing the conditioning yields
  #[#set math.equation(numbering: n => "(13)")
   $ P_0 \( T < oo \) gt.eq frac(p_(*) delta, 2 d) . $ <eq:radius-launch-probability>]
  The site $X_T$ has not appeared in its earlier prefix, since it is a strict $Y$-record.
  ===== 3.4 Preserving the maximum with a fresh continuation. <preserving-the-maximum-with-a-fresh-continuation.>
  Since $parallel v parallel_oo = 1$, there is a nearest-neighbor step $e$ with $h \( e \) = - 1$. From $X_T$ force $M$ repetitions of this step, where the fixed integer $M$ will be chosen shortly. Each step increases $Y$ by at least $b a - 1$. For all sufficiently large $a$, its successive sites have strictly increasing $Y$-coordinates, starting at the strict record $X_T$. Consequently every scripted departure site is distinct and unused by the prefix. Conditional on any fixed prefix realizing $T$, the script has the exact raw probability
  $ #scale(x: 120%, y: 120%)[\(] bb(E) \[ omega \( 0 \, e \) \] #scale(x: 120%, y: 120%)[\)]^M gt.eq alpha^M \, #h(2em) alpha := min_(e' in U) bb(E) \[ omega \( 0 \, e' \) \] > 0 . $
  Here independence is across departure rows, not across the entries in a single row. The constant $alpha$ is positive because $U$ is finite and every transition entry is positive almost surely. It is not a lower bound on the transition entries in individual environments.
  At the script endpoint consider a translated opposite-going template with law $hat(P)_(- sigma v)$, and require $cal(R)_(C_1 N)$ for its first $C_1 N$ true-cut slabs. This requirement includes existence of those cuts and concerns the entire template; they are not declared to be stopping times. It has conditional-template probability greater than $.8$. At any point of its slab $k + 1$, where $0 lt.eq k < C_1 N$, the coordinate displacement in direction $u$ is at least $- a \( k + 1 \)$, while the displacement in the original height $h$ is at most $- c k + C_0$. Its total $Y$-increment from the launching record is consequently at least
  #[#set math.equation(numbering: n => "(14)")
   $ M \( b a - 1 \) - a \( k + 1 \) + b a \( c k - C_0 \) & = a #scale(x: 120%, y: 120%)[\(] M b - 1 - b C_0 + \( b c - 1 \) k #scale(x: 120%, y: 120%)[\)] - M . $ <eq:radius-template-separation>]
  Choose $M$ once and for all so that $M b > 1 + b C_0 + 1$. Since $b c > 1$, the expression in (14) is strictly positive for all $k$ in question and all sufficiently large $a$. Thus these template sites avoid the entire original prefix, whose $Y$-values are at most the launching record.
  There are two additional separations to check. First, the whole opposite template stays at or below its own initial $h$-height, whereas every script departure lies strictly above that height. It therefore avoids all script departures, including in its infinite tail. Second, after $C_1 N$ template slabs its absolute $h$-height is at most
  $ \( C + 2 \) N - M - c C_1 N + C_0 < 0 $
  for large $N$. This endpoint is a true opposite cut, so its remaining tail stays below zero. That tail avoids the original prefix, all of whose heights are nonnegative. No assumption that the script itself stays above zero is needed.
  These inequalities make the use of fresh rows exact. Condition on a fixed finite prefix realizing $T$, and then on the forced script. The conditional environment differs from the original iid law only at departure sites of these two finite words. Under an independent raw law, the probability of $D_(- sigma v) ∩ cal(R)_(C_1 N)$ is at least $.8 p_(- sigma v)$. Every path in that event avoids all the old departure sites after translation to the script endpoint, by the preceding separations. Lemma 2 therefore identifies its probability with the corresponding fresh-row probability after the prefix and script. More explicitly, kill both the continuation and an independent raw chain on arrival at the same set of old departure sites. The finite-word identity gives equality of their cylinder probabilities, hence of their killed path laws. Now restrict to $D_(- sigma v) ∩ cal(R)_(C_1 N)$, whose paths never hit that set. Repeated sites within the template are retained in its raw path weights.
  It follows that, from every qualifying prefix, the script followed by the required continuation has conditional probability at least $.8 p_(*) alpha^M$. This argument uses finite-prefix conditioning and departure-row factorization, not a Markov property at a future-dependent true cut. The script decreases $h$, and the template never exceeds its own starting height. Hence the final supremum of $h$ on this continuation is its running supremum at $T$, which belongs to $W$.
  ===== 3.5 The finite final maximum. <the-finite-final-maximum.>
  Together with (13), this proves that for every sufficiently large $i_0$, after choosing $a$ large enough, some sign $sigma$ satisfies
  #[#set math.equation(numbering: n => "(15)")
   $ P_0 (sup_(n gt.eq 0) sigma v dot.op X_n in \[ c i_0 \/ 2 \, \( C + 2 \) N \( a \) \]) gt.eq rho \, #h(2em) rho := frac(.8 p_(*)^2 alpha^M delta, 2 d) > 0 . $ <eq:radius-final-maximum>]
  The constant $rho$ does not depend on the scale. For each sign let $M_sigma = sup_(n gt.eq 0) sigma v dot.op X_n$, allowing the value $+ oo$. Equation (15) implies
  $ sum_(sigma in { + \, - }) P_0 #scale(x: 120%, y: 120%)[\(] c i_0 \/ 2 lt.eq M_sigma < oo #scale(x: 120%, y: 120%)[\)] gt.eq rho $
  for every sufficiently large $i_0$. Both terms on the left tend to zero as $i_0 arrow.r oo$, a contradiction. Thus $I \( t \)$ is bounded, and monotone convergence proves Proposition 8. ◻
]

Proposition 8 supplies integrable slab displacements as well as integrable errors between slab endpoints. Section 4 uses these spatial facts to compare the two limiting directions and then to arrange the paths along a common coordinate height.

== 4 Rays and a common renewal arrangement <sec:arrangement>

The radius estimate first reduces a mixed real direction to a mixed coordinate direction. Integer heights then let us place two independent slab sequences in a common system of layers. We will compare two bounds for contacts between these sequences.

=== 4.1 Reduction to a coordinate direction <reduction-to-a-coordinate-direction>

#thm([Proposition 4.1.])[
  #emph[Suppose that the annealed walk satisfies $0 < P_0 \( A_v \) < 1$ for some $v in bb(R)^d \\ { 0 }$. There is a coordinate $i$ for which 
$ P_0 \( A_(e_i) \) > 0 #h(2em) upright("and") #h(2em) P_0 \( A_(- e_i) \) > 0 . $

]
] <prop:coordinate-reduction>

#proof[
  By Lemma 7, both signs of $v$ have positive probability and $P_0 \( A_v union A_(- v) \) = 1$. Normalize $parallel v parallel_oo = 1$. For $sigma in { + \, - }$, let $D_j^sigma$ be the displacement of the $j$th slab of the $sigma v$ sequence, and let $R_j^sigma$ be its radius. Proposition 8 and the bound $\| D_j^sigma \| lt.eq R_j^sigma$ give the mean vector
  $ b_sigma = E_sigma D_1^sigma \, #h(2em) b_sigma dot.op \( sigma v \) = E_sigma L > 0 . $
  In particular $b_sigma eq.not 0$. The strong law gives convergence of the $k$th slab endpoint divided by $k$ to $b_sigma$. Moreover, for each $epsilon > 0$,
  $ sum_(k gt.eq 1) hat(P)_(sigma v) \( R_k^sigma > epsilon k \) < oo \, $
  so $R_k^sigma \/ k arrow.r 0$ almost surely. Between the $k$th and $\( k + 1 \)$st endpoints, the displacement from the former is at most $R_(k + 1)^sigma$. The number of completed slabs tends to infinity. Thus the entire trajectory, after its first true cut, has limiting unit direction
  $ r_sigma = frac(b_sigma, \| b_sigma \|) . $
  Lemma 5 transfers this conclusion to the raw law on $A_(sigma v)$. This argument uses slab count rather than elapsed time and requires no moment of a slab’s duration.
  The two rays are distinct, since their projections on $v$ have opposite signs. The following argument proves the special case of Simenhaus’s antipodality principle needed here #cite(label("Simenhaus2007")) Proposition 1. We claim that $r_(-) = - r_(+)$. Otherwise $w = r_(+) + r_(-)$ satisfies
  $ w dot.op r_(+) = w dot.op r_(-) = 1 + r_(+) dot.op r_(-) > 0 . $
  The preceding endpoint and radius estimates then imply $A_w$ on both original directional events, so $P_0 \( A_w \) = 1$. Under $hat(P)_w$, the limiting ray therefore exists almost surely. By Lemma 5, this law is represented by an iid sequence of finite relative slab words. Deleting finitely many words removes a finite time prefix and translates all remaining positions by a fixed vector. Since $A_w$ holds, positions tend to infinity in norm, and these operations preserve the limiting ray. The ray is consequently a tail variable of the iid word sequence. The tail zero–one law, applied to a countable determining family of Borel subsets of the unit sphere, makes it deterministic. No displacement moment in direction $w$ is needed here.
  The raw walk has a first true $w$ cut almost surely, and its conditional future there has law $hat(P)_w$ by Lemma 5. Its raw limiting ray must therefore be that same deterministic ray. This contradicts the positive probabilities of the two distinct rays $r_(+)$ and $r_(-)$. The claim follows. Choose a coordinate with nonzero projection on $r_(+)$; on $A_v$ and $A_(- v)$ the corresponding coordinate tends to opposite infinities, proving Proposition 10. ◻
]

It now suffices to rule out a mixed coordinate direction. Relabel coordinates so that it is $e_1$, and write $p_plus.minus = p_(plus.minus e_1) > 0$. Write $D_sigma = D_(sigma e_1)$ and $hat(P)_sigma = hat(P)_(sigma e_1)$ for either sign. The slab laws $nu_plus.minus = nu_(plus.minus e_1)$ have positive integer widths; $E_plus.minus$ will now denote expectation for these coordinate slab laws. Lemma 6 and Proposition 8, applied to this coordinate, give

#[#set math.equation(numbering: n => "(16)")
 $ E_plus.minus L < oo \, #h(2em) E_plus.minus R < oo . $ <eq:coordinate-moments>]

All heights in the remaining proof are integer coordinate heights. In particular, a walk started inside a finite coordinate-height interval exits it almost surely: a path confined to that interval would have finite height supremum without tending to negative infinity, contrary to Lemma 3. Translation invariance and integration give this exit property quenched for almost every environment, simultaneously for all integer barriers and starting sites. Only a countable intersection is needed. This property does not require uniform ellipticity.

=== 4.2 Exact-cut bridges and renewal tails <exact-cut-bridges-and-renewal-tails>

For a sign $sigma in { + \, - }$ define, with starting point zero,

$ T_j^sigma = inf { n gt.eq 0 : sigma X_n dot.op e_1 = j } \, #h(2em) u_j^sigma = P_0 \( T_j^sigma < T_(- 1)^sigma \) \, #h(2em) F_sigma \( j \) = nu_sigma \( L > j \) \, quad j gt.eq 0 . $

When only one sign is being discussed we omit $sigma$. A relative slab word starts at zero; its raw weight is the function $W$ defined in Section 2.

#thm([Lemma 4.2.])[
  (Exact-cut bridges).  #emph[For either sign, the probability under $hat(P)_sigma$ of a slab cut at height $H gt.eq 0$ is $u_H$. The numbers $u_H$ satisfy 
$ u_0 = 1 \, #h(2em) 1 gt.eq u_H gt.eq u_(H + 1) gt.eq p_sigma . $

 Conditional on a cut at $H$, the list of slabs through that cut has law $cal(B)_H^sigma$ given by 
#[#set math.equation(numbering: n => "(17)")
 $ cal(B)_H^sigma \( gamma_1 \, dots.h \, gamma_m \) = 1 / u_H^sigma product_(i = 1)^m W \( gamma_i \) \, #h(2em) sum_(i = 1)^m L \( gamma_i \) = H . $ <eq:exact-bridge-list>]

 Concatenation gives the raw path stopped on its first hit of $H$, conditional on reaching $H$ before $- 1$, in the signed height. Reversing the order of the list preserves $cal(B)_H^sigma$; every word is still traversed in its original chronological order.]
] <lem:exact-bridge>

#proof[
  On ${ T_H < T_(- 1) }$, all departures before $T_H$ have height less than $H$. The future non-backtracking event from the fresh endpoint has probability $p_sigma$. Its factor cancels the denominator in conditioning on $D_sigma$, giving the cut probability $u_H$. The hitting events are nested in $H$, and a non-backtracking walk reaches every height, proving the inequalities.
  A finite path first hitting $H$ before $- 1$ has a unique slab decomposition. Its cuts are the strict record times whose heights are never undercut before the terminal time, together with the initial boundary. Between two successive cuts all intermediate strict records are invalidated before the second cut. These are exactly the qualifying words of Lemma 5. Conversely, concatenating any such list of total width $H$ gives one of these bridges. Distinct words have disjoint departure-height intervals, so their raw weights multiply. Their total mass is $u_H$, which proves (17) and the bridge identification. Reversing the list preserves its total width and the product of its word weights. It is a bijection on admissible lists, proving the last assertion. At $H = 0$ the list is empty. ◻
]

#thm([Lemma 4.3.])[
  (Renewal-tail comparison).  #emph[For either sign and all integers $n' gt.eq n gt.eq 0$, 
#[#set math.equation(numbering: n => "(18)")
 $ 0 lt.eq u_n - u_(n') lt.eq \( n' - n \) F \( n \) . $ <eq:renewal-tail>]

 Moreover, 
#[#set math.equation(numbering: n => "(19)")
 $ sum_(l gt.eq 0) 2^l F \( 2^l \) < oo . $ <eq:dyadic-width-tail>]

]
] <lem:renewal-tail>

#proof[
  The slab cut heights form a renewal process with increments $L$. Partitioning according to its last cut at or before $n$ gives
  $ sum_(k = 0)^n F \( k \) u_(n - k) = 1 . $
  Subtracting this identity at $n + 1$ from the identity at $n$ yields
  $ sum_(k = 0)^n F \( k \) \( u_(n - k) - u_(n + 1 - k) \) = F \( n + 1 \) . $
  Every term on the left is nonnegative, and $F \( 0 \) = 1$. Thus $u_n - u_(n + 1) lt.eq F \( n + 1 \) lt.eq F \( n \)$; telescoping proves (18). Finally $sum_(k gt.eq 0) F \( k \) = E L < oo$, and monotonicity of $F$ gives (19) by grouping this sum into dyadic intervals. ◻
]

=== 4.3 Two tapes placed from a common top <two-tapes-placed-from-a-common-top>

Berger’s backward-path construction also assembles regeneration slabs from a terminal reference point #cite(label("Berger2008")) Sections 2–3. In the arrangement below, placement proceeds downwards on both tapes, while each word retains its chronological orientation.

Take independent iid tapes $\( A_i \)_(i gt.eq 1)$ and $\( B_i \)_(i gt.eq 1)$ with respective word laws $nu_(+)$ and $nu_(-)$. Their joint law and expectation will be denoted by $upright(bold(P))$ and $upright(bold(E))$. For a relative word $gamma$ let $d \( gamma \)$ be its terminal displacement, and let $a \( gamma \) in bb(Z)^(d - 1)$ be the last $d - 1$ coordinates of that displacement.

Set the positive top endpoint at zero. Place $A_1$ with its terminal there, then place $A_2$ with its terminal at the start of $A_1$, and continue downwards. Thus the placed copy of $A_i$ is translated by $- sum_(r lt.eq i) d \( A_r \)$. Place the negative tape chronologically starting from $- e_1$, so the placed copy of $B_i$ is translated by $- e_1 + sum_(r < i) d \( B_r \)$. Only translations are used; the steps inside each word retain their chronological orientation.

For a site $x$, call $- x_1$ its #emph[progress below the top], or #emph[depth]. A word of width $L$ preceded by total tape width $s$ has all its departures in the progress interval

#[#set math.equation(numbering: n => "(20)")
 $ \( s \, s + L \] ∩ bb(Z) $ <eq:departure-progress>]

on either tape. The one-level offset of the negative starting point is what makes these intervals agree. A #emph[contact] is a site that is a departure of both placed tapes. The last positive step into the top is axial, so its departure is $- e_1$, the first negative departure. There is always a contact at progress one.

Write $H_i^(+) = sum_(r lt.eq i) L \( A_r \)$ and $H_j^(-) = sum_(r lt.eq j) L \( B_r \)$, with $H_0^(+) = H_0^(-) = 0$. Successive positive common values of these two increasing sequences divide both tapes into #emph[common blocks]. This is the intersection of two independent renewal processes, a standard construction discussed, for example, in #cite(label("AlexanderBerger2016")). Lemma 13 proves that all such blocks exist and provides the moments needed for the entropy comparison.

#thm([Lemma 4.4.])[
  (Common blocks).  #emph[The paired lists in successive common blocks are iid. If $K$ is the total width of one block, then 
#[#set math.equation(numbering: n => "(21)")
 $ upright(bold(E)) K lt.eq frac(1, p_(+) p_(-)) < oo . $ <eq:common-width-moment>]

 Let $V_(+)$ and $V_(-)$ be the sums of the actual chronological lateral displacements of the positive and negative words in that block. Then 
#[#set math.equation(numbering: n => "(22)")
 $ upright(bold(E)) \( \| V_(+) \| + \| V_(-) \| \) < oo . $ <eq:common-lateral-moment>]

 When passing down through this block, the negative-minus-positive lateral gap increases by 
$ S = V_(+) + V_(-) in bb(Z)^(d - 1) \, #h(2em) upright(bold(E)) \| S \| < oo . $

]
] <lem:common-blocks>

#proof[
  Initially allow the first positive common width $K$ to be infinite. If it is reached after $i$ positive and $j$ negative words, that event is determined by those two finite prefixes: their widths agree, and no earlier positive partial sums agree. The unused tails are therefore independent tapes with their original laws, independent of the completed block. To see this without any stopping-time convention, condition separately on each pair $\( i \, j \)$, factor the law of the unused tails, and sum over $\( i \, j \)$. Repeating the argument gives the renewal property at every common cut that exists.
  Let $c_n = u_n^(+) u_n^(-)$ be the probability that $n$ is a common cut, including $c_0 = 1$. Partitioning according to the last common cut at or before $n$ gives the elementary identity
  $ sum_(i = 0)^n c_(n - i) upright(bold(P)) \( K > i \) = 1 . $
  Indeed, after a common cut at $n - i$, the unused pair of tapes has its original law, and $K > i$ says precisely that there is no further common cut through $n$. The identity remains valid if the next gap is infinite. Since $c_j gt.eq p_(+) p_(-) > 0$, it follows that
  $ \( p_(+) p_(-) \) sum_(i = 0)^n upright(bold(P)) \( K > i \) lt.eq 1 . $
  Letting $n$ tend to infinity proves (21). In particular $K$ is finite almost surely. Restarting at each successive common cut now justifies the infinite iid common-block sequence.
  Let $N_(+)$ be the number of positive words in the first common block. The event ${ N_(+) gt.eq i }$ says that none of $H_1^(+) \, dots.h \, H_(i - 1)^(+)$ belongs to the negative renewal set. It depends only on the preceding positive words and the negative tape, and is independent of the whole next word $A_i$. Tonelli’s Theorem therefore gives
  $ upright(bold(E)) sum_(i = 1)^(N_(+)) R \( A_i \) = sum_(i gt.eq 1) upright(bold(P)) \( N_(+) gt.eq i \) E_(+) R = upright(bold(E)) N_(+) thin E_(+) R lt.eq upright(bold(E)) K thin E_(+) R . $
  The last inequality uses the integer bound $L gt.eq 1$. The same argument applies to the negative tape. Since $\| a \( gamma \) \| lt.eq R \( gamma \)$, this proves (22) and the moment bound for $S$.
  Finally, across the block the positive lower anchor is its old anchor minus $V_(+)$ in lateral coordinates, whereas the negative anchor moves by $V_(-)$. Their negative-minus-positive difference increases by $V_(+) + V_(-)$, as asserted. ◻
]

Let $K_j$ be the successive common widths and put $W_0 = 0$, $W_j = sum_(i = 1)^j K_i$. By (20), both tapes’ departures in block $j$ have progress in $\( W_(j - 1) \, W_j \]$. Consequently a contact always belongs to the same unique common block on both tapes. Figure 1 summarizes the two orientations.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.85), [#text(size: 9pt)[\(a\) Common departure bands]], anchor: "west", padding: 0.1176cm)
  content((2, 0.35), [#text(size: 9pt)[positive#linebreak()tape]])
  content((3.9, 0.35), [#text(size: 9pt)[negative#linebreak()tape]])
  rect((0.9, -1.3), (5.1, -2.6), fill: rgb("#f5f5f5"), stroke: none)
  line((0.9, 0), (5.1, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.75, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  line((0.9, -1.3), (5.1, -1.3), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.75, -1.3), [#text(size: 9pt)[$W_1$]], anchor: "east", padding: 0.1176cm)
  line((0.9, -2.6), (5.1, -2.6), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.75, -2.6), [#text(size: 9pt)[$W_2$]], anchor: "east", padding: 0.1176cm)
  line((0.9, -3.9), (5.1, -3.9), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.75, -3.9), [#text(size: 9pt)[$W_3$]], anchor: "east", padding: 0.1176cm)
  line((2, -1.12), (2, -0.18), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((3.9, -0.18), (3.9, -1.12), stroke: (paint: rgb("#a60000"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((5.45, -0.65), [#text(size: 9pt)[$K_1$]])
  line((2, -2.42), (2, -1.48), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((3.9, -1.48), (3.9, -2.42), stroke: (paint: rgb("#a60000"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((5.45, -1.95), [#text(size: 9pt)[$K_2$]])
  line((2, -3.72), (2, -2.78), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((3.9, -2.78), (3.9, -3.72), stroke: (paint: rgb("#a60000"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((5.45, -3.25), [#text(size: 9pt)[$K_3$]])
  line((-0.15, -0.3), (-0.15, -3.6), stroke: (paint: rgb("#4d4d4d"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#4d4d4d"))))
  content((-0.45, -1.95), [#text(size: 9pt)[progress $-x_1$]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  content((2.95, -4.35), [#text(size: 8pt)[Arrows indicate orientation, not paths.#linebreak()Both tapes are placed downwards.]])
  content((6.85, 0.85), [#text(size: 9pt)[\(b\) The one-level offset]], anchor: "west", padding: 0.1176cm)
  content((8.4, 0.3), [#text(size: 9pt)[$+$]])
  content((10.2, 0.3), [#text(size: 9pt)[$-$]])
  rect((7.7, 0), (10.85, -2.7), fill: rgb("#f0f0f0"), stroke: none)
  line((7.7, 0), (10.85, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((7.55, 0), [#text(size: 9pt)[$s$]], anchor: "east", padding: 0.1176cm)
  line((7.7, -0.8), (10.85, -0.8), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((7.55, -0.8), [#text(size: 9pt)[$s+1$]], anchor: "east", padding: 0.1176cm)
  line((7.7, -2.7), (10.85, -2.7), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((7.55, -2.7), [#text(size: 9pt)[$s+L$]], anchor: "east", padding: 0.1176cm)
  line((7.7, -3.5), (10.85, -3.5), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((7.55, -3.5), [#text(size: 9pt)[$s+L+1$]], anchor: "east", padding: 0.1176cm)
  line((8.4, -2.7), (8.4, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((10.2, -0.8), (10.2, -3.5), stroke: (paint: rgb("#a60000"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  circle((8.4, -2.7), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((8.4, 0), radius: 0.07408, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  circle((10.2, -0.8), radius: 0.07408, fill: rgb("#a60000"), stroke: none)
  circle((10.2, -3.5), radius: 0.07408, fill: rgb("#ffffff"), stroke: (paint: rgb("#a60000"), thickness: 1.0pt, miter-limit: 10))
  content((9.28, -1.72), [#text(size: 8pt)[departure#linebreak()heights]])
  content((9.1, -4.1), [#text(size: 8pt)[Both words depart only at integer progress#linebreak()in $(s,s+L]$; terminal arrivals are excluded.]])
})],
  caption: [Figure 1: The opposed arrangement, schematically and not to scale. (a) Common departure bands; arrows indicate chronological orientation, while placement proceeds downwards on both tapes. (b) Endpoint progress for a word of width $L$ preceded by total width $s$, with the one-level offset restored. Filled points are starts and open points are terminal arrivals. Word interiors and lateral positions are not depicted; the arrows do not assert monotonicity of the words. ],
) <fig:arrangement>

For integers $0 lt.eq a < b$, denote by $cal(C) \( a \, b \]$ the event of a contact in at least one block with index $a < j lt.eq b$. The quantity to be estimated is

#[#set math.equation(numbering: n => "(23)")
 $ m \( J \) = sum_(j = 1)^J upright(bold(P)) #scale(x: 120%, y: 120%)[\(] cal(C) \( 2^j \, 2^(j + 1) \] #scale(x: 120%, y: 120%)[\)] \, #h(2em) J gt.eq 1 . $ <eq:contact-count>]

It is the expected number of dyadic block-index intervals containing a contact. Section 5 bounds it above using the finite first moment of the lateral increment $S$; the remaining sections obtain an incompatible lower bound from the forced contact near the top and the renewal-tail estimate.

== 5 An entropy upper bound for contacts <sec:entropy>

We continue under the assumption that both coordinate signs have positive probability. The opposed arrangement and its common blocks are those of Section 4. We will prove

#thm([Proposition 5.1.])[
  #emph[Suppose that both coordinate signs have positive directional-transience probability. In the opposed arrangement of Section 4, let $m \( J \)$ be the expected number of dyadic common-block index intervals $\( 2^j \, 2^(j + 1) \]$, $1 lt.eq j lt.eq J$, containing a departure-site contact, as in (23). Then 
$ m \( J \) = O #h(-0.16667em) (frac(J, log J)) #h(2em) \( J arrow.r oo \) . $

]
] <prop:entropy-upper>

The argument compares a piece of the opposed arrangement with independent bridges of prescribed heights. Contacts are rare under the bridge law. The cost of this comparison is controlled by the entropy gained when more independent common-block displacements are added.

=== 5.1 A randomized comparison with independent bridges <a-randomized-comparison-with-independent-bridges>

Fix an integer $n gt.eq 1$. We want to cover the common blocks with indices in $\( 4 n \, 8 n \]$ by a middle portion of the arrangement. We will surround it by two outer portions, each of height at least $n$, so that any middle contact occurs well inside a finite slab. A buffer above all three portions supplies an independent lateral gap.

We randomize the number of blocks in each portion as well as in the buffer. Choosing a chunk count uniformly from $n$ possibilities will offset the cost of specifying its random height. Randomizing the buffer count will let us compare its entropy with that of the whole experiment without paying an additional $log n$. Independently of the common-block tape, choose four independent integer counts

#[#set math.equation(numbering: n => "(24)")
 $ U \, I_1 \, I_3 & med upright("uniform on ") { n \, dots.h \, 2 n - 1 } \,\
I_2 & med upright("uniform on ") { 7 n \, dots.h \, 8 n - 1 } . $ <eq:entropy-count-windows>]

Read a buffer of $U$ common blocks, followed by three chunks of $I_1 \, I_2 \, I_3$ common blocks. Let $d_0$ be the lateral gap after the buffer, namely the sum of its gap increments. For chunk $i$, let $A_i$ and $B_i$ be the positive and negative slab lists in their downward tape order, and let $H_i$ be their common total width. Write

$ H = \( H_1 \, H_2 \, H_3 \) \, #h(2em) cal(A) = \( A_1 \, A_2 \, A_3 \) \, #h(2em) cal(B) = \( B_1 \, B_2 \, B_3 \) . $

The three chunks are independent, and $\( U \, d_0 \)$ is independent of all their data. To see this despite their random boundaries, condition on the four external counts and use the product law of the common blocks; the distribution of a chunk depends only on its own count. The first and third count windows ensure the required outer heights. The longer middle window ensures that the middle chunk starts before block $4 n$ and ends after block $8 n$.

Set $q = d - 1$, and let $X_(A \, i) \, X_(B \, i) in bb(Z)^q$ be the sums of the lateral displacements of the words in $A_i \, B_i$, measured in the words’ actual chronological directions. The total positive displacement determines where its bottom lies relative to its top. Accordingly, define

#[#set math.equation(numbering: n => "(25)")
 $ X_A = sum_(i = 1)^3 X_(A \, i) \, quad X_B = sum_(i = 1)^3 X_(B \, i) \, quad Z = d_0 + X_A \, quad T = U + I_1 + I_2 + I_3 . $ <eq:entropy-alignment-variables>]

Here is the placement that explains the alignment variable $Z$ and will define the same contact event under the actual and reference laws. Set $N_(*) = H_1 + H_2 + H_3$. Place the positive chunks from height $0$ and lateral position $0$, in chronological order $3 \, 2 \, 1$, reversing the list order within each chunk. Each word is still traversed in its original direction. Place the negative chunks in chronological order $1 \, 2 \, 3$ from height $N_(*) - 1$ and lateral position $Z$. Let $E_(upright("mid"))$ be a departure contact between the two middle chunks.

For these actual chunk data, this placement reproduces the infinite opposed arrangement after its buffer, up to translation. For example, at the top of the middle chunk the lateral gap, negative minus positive, is

$ Z + X_(B \, 1) - \( X_(A \, 3) + X_(A \, 2) \) = d_0 + X_(A \, 1) + X_(B \, 1) \, $

as in the original arrangement; the subsequent list placements also agree. From (24), the middle chunk starts after at most $4 n - 2$ common blocks and ends after at least $9 n$ blocks. It therefore contains the deterministic common-block interval $\( 4 n \, 8 n \]$.

Denote the actual law of $\( H \, Z \, cal(A) \, cal(B) \)$ by $P_n$. Define a reference law $Q_n$ as follows. First sample $\( H \, Z \)$ with its actual joint marginal. Given these values, sample the six lists independently, with respective exact-cut bridge laws $cal(B)_(H_i)^(+)$ and $cal(B)_(H_i)^(-)$ from Lemma 11. The reference retains the dependence between $H$ and $Z$; it changes only the conditional law of the lists. Apply the same placement rule to its newly sampled lists. Thus $E_(upright("mid"))$ is one fixed measurable event in both experiments, and its actual probability bounds the original contact probability in $\( 4 n \, 8 n \]$.

=== 5.2 The entropy cost of the comparison <the-entropy-cost-of-the-comparison>

We use entropy and relative entropy in their classical information-theoretic sense #cite(label("Shannon1948")) #cite(label("KullbackLeibler1951")), recalling the identities and bounds needed for the countable path spaces below.

For a countable random variable $V$, write

$ cal(H) \( V \) = - sum_v P \( V = v \) log P \( V = v \) \, $

with $0 log 0 = 0$. Conditional entropy is the average of the corresponding conditional entropies. For probability measures $P \, Q$ on a countable set, their relative entropy is

$ D \( P bar.v.double Q \) = sum_x P \( x \) log frac(P \( x \), Q \( x \)) \, $

with value $+ oo$ if $P$ is not absolutely continuous with respect to $Q$. Conditional mutual information $I \( V \; W divides H \)$ is the average, over $H$, of the relative entropy between the joint conditional law and the product of its two marginals.

We use the chain rule for relative entropy, obtained by factoring joint probabilities into marginal and conditional probabilities. In particular, if a reference law for $\( V \, W \)$ conditional on $H$ factors between $V$ and $W$, the averaged conditional relative entropy is at least $I \( V \; W divides H \)$. Nonnegativity of relative entropy follows from Jensen’s inequality applied to $- log$. The same factorization, followed by nonnegativity, shows that applying a measurable map cannot increase relative entropy. These facts apply to countable path lists without assuming that the lists themselves have finite entropy; equivalently one may first use finite partitions and pass to their increasing limit.

Let $S_1 \, S_2 \, dots.h$ be the iid lateral gap increments of the common blocks, and set

$ h_k = cal(H) \( S_1 + dots.h.c + S_k \) \, #h(2em) k gt.eq 1 . $

Lemma 13 gives $upright(bold(E)) \| S_1 \| < oo$. For a $bb(Z)^q$-valued variable with finite first moment, comparison with the probability weights proportional to $exp \( - \| x \| \/ \( k + 1 \) \)$ gives

#[#set math.equation(numbering: n => "(26)")
 $ h_k lt.eq C + q log \( k + 1 \) . $ <eq:gap-entropy-growth>]

Indeed the normalizing sum is at most $C_q \( k + 1 \)^q$, and the expected comparison energy is at most $k upright(bold(E)) \| S_1 \| \/ \( k + 1 \)$. Also $h_k$ is nondecreasing: condition on the last independent summand, use translation invariance of entropy, and then remove the conditioning.

By Lemma 13, the sum of the slab radii in a common block has finite expectation. Thus each tape’s block displacement, and not only their sum $S$, has a finite first absolute moment. In addition the common width has finite mean. All count, height, and displacement variables used below therefore have first moments of order $n$, and their joint and conditional entropies are finite. No entropy bound for the full path lists is needed.

#thm([Lemma 5.2.])[
  #emph[There is a constant $C$, independent of $n$, such that 
$ D \( P_n bar.v.double Q_n \) lt.eq C + h_(14 n) - h_n . $

]
] <lem:entropy-comparison>

#proof[
  There are two costs to control: imposing the random chunk heights, and then retaining the aligned starting displacement $Z$. We first condition on $H$ alone. For a specified pair of slab lists of common total width $h$, let $r$ be the number of their common positive cumulative widths, including $h$. The pair is uniquely parsed into its first $r$ common blocks. If $r$ belongs to the count window for chunk $i$, its actual unconditioned mass is
  $ 1 / n product_(a in A_i) W \( a \) product_(b in B_i) W \( b \) . $
  It has zero mass otherwise. The independent exact-cut bridge pair at height $h$ has mass given by the same product divided by $u_h^(+) u_h^(-)$. Thus the conditional density of the actual pair, on its support, is
  #[#set math.equation(numbering: n => "(27)")
   $ frac(u_h^(+) u_h^(-), n P_n \( H_i = h \)) . $ <eq:count-window-density>]
  Common cuts here are counted in the original downward list order, before any list is reversed for chronological placement.
  Let $D_0$ be the averaged conditional relative entropy of $\( cal(A) \, cal(B) \)$ given $H$ with respect to these independent bridges. The chunks are independent, so (27) and $u_h^plus.minus lt.eq 1$ give
  $ D_0 lt.eq sum_(i = 1)^3 #scale(x: 120%, y: 120%)[\(] cal(H) \( H_i \) - log n #scale(x: 120%, y: 120%)[\)] lt.eq C . $
  For the last bound, $upright(bold(E)) H_i lt.eq 8 n upright(bold(E)) K$, and a positive integer variable with mean $a$ has entropy at most $1 + log \( a + 1 \)$, by comparison with a geometric distribution. Since the reference conditional on $H$ factors between the tapes,
  #[#set math.equation(numbering: n => "(28)")
   $ I \( cal(A) \; cal(B) divides H \) lt.eq D_0 . $ <eq:conditional-tape-information>]
  Introducing $Z$ while retaining its actual marginal costs precisely its conditional mutual information with the lists. The chain rule and the independence of the buffer give
  #[#set math.equation(numbering: n => "(29)")
   $ D \( P_n bar.v.double Q_n \) & = D_0 + I \( Z \; cal(A) \, cal(B) divides H \)\
 & = D_0 + cal(H) \( Z divides H \) - cal(H) \( d_0 \) . $ <eq:endpoint-information-cost>]
  Conditional on $cal(A) \, H$, the variable $Z$ is obtained by adding the independent $d_0$. Data processing in (28) therefore yields $I \( Z \; cal(B) divides H \) lt.eq D_0$.
  The direct bound $cal(H) \( Z divides H \) = O \( log n \)$ would be too large after summing over scales. Instead, add the negative tape’s displacement to $Z$. Their sum is the total common-block gap, whose entropy can be compared with that of the buffer. Conditioning on the negative tape costs at most $D_0$, as just proved:
  #[#set math.equation(numbering: n => "(30)")
   $ cal(H) \( T \, Z + X_B \) & gt.eq cal(H) \( T \, Z + X_B divides cal(B) \, H \) = cal(H) \( T \, Z divides cal(B) \, H \)\
 & gt.eq cal(H) \( Z divides H \) - D_0 + cal(H) \( T divides Z \, cal(A) \, cal(B) \, H \)\
 & = cal(H) \( Z divides H \) - D_0 + cal(H) \( U divides d_0 \) . $ <eq:buffer-entropy-chain>]
  For the last equality, the two lists in each chunk determine its common count. Knowing these lists and $Z$ therefore fixes both $T - U$ and $d_0 = Z - X_A$. The buffer pair is independent of the chunks.
  The vector $Z + X_B$ is the sum of the first $T$ common gap increments. The count $T$, like $U$, is independent of the underlying iid tape; we are not conditioning on the observed chunks in the following identities. Consequently
  $ cal(H) \( T \, Z + X_B \) = cal(H) \( T \) + upright(bold(E)) h_T \, #h(2em) cal(H) \( U \, d_0 \) = log n + upright(bold(E)) h_U . $
  Here $n lt.eq U < 2 n$ and $10 n lt.eq T lt.eq 14 n - 4$, so $T$ takes at most $4 n$ values. Monotonicity of $h_k$ gives
  #[#set math.equation(numbering: n => "(31)")
   $ cal(H) \( T \, Z + X_B \) - cal(H) \( U \, d_0 \) lt.eq log 4 + h_(14 n) - h_n . $ <eq:random-count-entropy-difference>]
  Subtract $cal(H) \( d_0 \)$ in (30) and use $cal(H) \( U \, d_0 \) = cal(H) \( d_0 \) + cal(H) \( U divides d_0 \)$. Together with (29) and (31), this gives explicitly
  $ D \( P_n bar.v.double Q_n \) lt.eq 2 D_0 + log 4 + h_(14 n) - h_n . $
  The bound for $D_0$ is uniform in $n$, so its doubled contribution is absorbed into $C$. This proves Lemma 15. ◻
]

=== 5.3 Rare contacts under the reference law <rare-contacts-under-the-reference-law>

Comparing opposed paths in one environment and classifying intersection sites by quenched escape probabilities already appears in the planar argument of Zerner #cite(label("Zerner2007")) Section 2. We prove the finite-barrier estimate needed here.

#thm([Lemma 5.3.])[
  #emph[For the reference experiment just defined, 
$ Q_n \( E_(upright("mid")) \) lt.eq delta_n := min { 1 \, C n \( F_(+) \( n \) + F_(-) \( n \) \) } . $

]
] <lem:reference-contact>

#proof[
  Fix $\( H \, Z \)$ in its retained support; in particular $H_1 \, H_3 gt.eq n$. Write $N = N_(*)$. By list-reversal invariance in Lemma 11, the placed chronological chunks have their corresponding raw bridge laws.
  Retain the complete positive lower and middle chunks, concatenated into a path $alpha$ from height $0$ to its first hit of $N - H_1$. Retain the negative upper and middle chunks only up to their first arrival at a departure site of $alpha$. A middle contact ensures that this arrival occurs before the negative middle endpoint at height $H_3 - 1$. The contact site $y$ must therefore satisfy
  #[#set math.equation(numbering: n => "(32)")
   $ H_3 lt.eq y_1 lt.eq N - H_1 - 1 . $ <eq:reference-contact-height>]
  Thus each path has made at least $n$ progress in its own signed height before reaching the contact, and neither has crossed the global barriers $- 1 \, N$.
  We explain the comparison with two paths in one environment before using any quenched exit probabilities. The unused positive upper chunk and negative lower chunk integrate to one. The remaining four bridge normalizations are bounded by $p_(+)^(- 2) p_(-)^(- 2)$. Consecutive bridges within a sign have disjoint departure layers, so their raw weights multiply to the raw weight of their concatenation. Summing over the negative completion after its retained prefix, and dropping its remaining bridge requirements, costs at most that prefix’s raw weight: in each fixed environment the total conditional completion probability is at most one, and this inequality can then be averaged. This argument allows the completion to revisit its prefix’s departure rows and does not factor their weights independently. The first-hit chunk boundaries determine the splits, so no extra multiplicity is introduced.
  The retained negative prefix has no departure site in $"Dep" \( alpha \)$: its terminal point is the first arrival there. Repeated sites within either path cause no difficulty. Lemma 2 therefore identifies the product of their raw weights with the weight of the two paths sampled independently conditional on a common iid environment. For each $alpha$ the first contact fixes the negative prefix uniquely, and $alpha$ itself is stopped at a fixed first-hit height. We may thus sum these joint prefix weights without overcounting, and extend the paths as raw trajectories in the common environment.
  Only now, in that shared environment, define for interior sites
  $ Q_y^omega = P_(y \, omega) \( T_(- 1) < T_N \) \, $
  where the barriers are absolute first-coordinate heights. If $Q_y^omega gt.eq 1 \/ 2$ at the contact, the positive raw path has visited such a site after hitting $n$ and before exiting the global slab. Conditional on the environment, stop it at its first such visit. The probability of a subsequent exit at $- 1$ is at least $1 \/ 2$. Consequently the annealed probability of this visit event is at most
  $ 2 P_0 \( T_n < T_(- 1) < T_N \) = 2 \( u_n^(+) - u_N^(+) \) . $
  If $Q_y^omega < 1 \/ 2$, the negative marginal gives the analogous bound $2 \( u_n^(-) - u_N^(-) \)$. Indeed the almost-sure finite-height-interval exit property established in Section 4 holds quenched for all these starting sites and barriers outside one null set. The probability of the other exit is therefore greater than $1 \/ 2$, with no common lower bound on the transition rows. Measured from the negative start $N - 1$, the global barriers $N$ and $- 1$ have signed relative heights $- 1$ and $N$, respectively. Lateral translation by $Z$ does not change its annealed law.
  Combining these alternatives with the bounded normalizations gives, uniformly in $\( H \, Z \)$,
  $ Q_n \( E_(upright("mid")) divides H \, Z \) lt.eq C sum_(sigma in { + \, - }) \( u_n^sigma - u_N^sigma \) lt.eq C N #scale(x: 120%, y: 120%)[\(] F_(+) \( n \) + F_(-) \( n \) #scale(x: 120%, y: 120%)[\)] \, $
  where the last step is Lemma 12. Finally $upright(bold(E)) N lt.eq 12 n upright(bold(E)) K$. Average over the retained joint marginal of $\( H \, Z \)$ and take the minimum with $1$. ◻
]

=== 5.4 Summing over scales <summing-over-scales>

#proof[
  For $l gt.eq 2$, take $n = 2^(l - 2)$ and abbreviate $delta_l = delta_n$. The event $E_(upright("mid"))$ contains the original contact event in common blocks $\( 2^l \, 2^(l + 1) \]$. If $delta_l = 0$, absolute continuity from Lemma 15 makes its actual probability zero. Otherwise the binary relative-entropy inequality gives
  #[#set math.equation(numbering: n => "(33)")
   $ P_n \( E_(upright("mid")) \) log \( 1 \/ delta_l \) lt.eq C + h_(14 n) - h_n . $ <eq:binary-contact-entropy>]
  For completeness, applying data processing to an event with actual and reference probabilities $a \, b$ gives binary divergence $a log \( a \/ b \) + \( 1 - a \) log \( \( 1 - a \) \/ \( 1 - b \) \)$. It is at least $a log \( 1 \/ b \) - log 2$. Use $b lt.eq delta_l$ and absorb $log 2$ into $C$.
  Width integrability gives
  $ sum_(l gt.eq 2) delta_l < oo . $
  Among $2 lt.eq l lt.eq J$, at most $C sqrt(J)$ indices have $delta_l > J^(- 1 \/ 2)$. They contribute at most $C sqrt(J)$ to $m \( J \)$. For every other index with positive $delta_l$, the logarithm in (33) is at least $1 / 2 log J$. Since $14 n lt.eq 16 n$, monotonicity and bounded overlap give
  $ sum_(l = 2)^J #scale(x: 120%, y: 120%)[\(] h_(14 dot.op 2^(l - 2)) - h_(2^(l - 2)) #scale(x: 120%, y: 120%)[\)] lt.eq sum_(l = 2)^J #scale(x: 120%, y: 120%)[\(] h_(2^(l + 2)) - h_(2^(l - 2)) #scale(x: 120%, y: 120%)[\)] lt.eq 4 h_(2^(J + 2)) = O \( J \) \, $
  using (26). Summing (33), and adding the initial scale, proves
  $ m \( J \) lt.eq 1 + C sqrt(J) + frac(C J, log J) = O \( J \/ log J \) . $
  ◻
]

The estimate uses the same departure contacts as the original arrangement. The next section bounds the chance of a first contact far above a true cut; that bound will force more contact scales than Proposition 14 permits.

== 6 Contacts with a path anchored at a random endpoint <sec:posterior>

The lower contact bound requires a different comparison from the one used in Section 5. A positive bridge now determines the starting point of the negative path. We control this dependence by retaining the conditional probabilities of the bridge’s possible endpoints. The needed estimate for these probabilities is a finite-vector martingale inequality.

=== 6.1 The sum of posterior maxima <the-sum-of-posterior-maxima>

The first-moment calculation integrates the nonnegative-martingale maximal inequality, whose classical form appears in #cite(label("Ville1939")) Chapter V, Première section, §2, Theorem 1. The same coordinatewise calculation for posterior vectors appears in Kesselheim, Molinaro, Patton, and Singla #cite(label("KesselheimMolinaroPattonSingla2026")) Section 1.1. To obtain an exponential moment, we also control conditional future increases and the size of each jump. This is the increasing-process energy mechanism of #cite(label("Kikuchi1992")) Theorem 4 and its corollary; we give an elementary threshold proof with the required filtration explicit.

#thm([Lemma 6.1.])[
  (Posterior maxima).  #emph[Let $m gt.eq 1$, and let $\( w_i \( e \) \)_(i gt.eq 0)$, $1 lt.eq e lt.eq m$, be nonnegative martingales for a filtration $\( cal(F)_i \)$, with $sum_(e = 1)^m w_i \( e \) lt.eq 1$ almost surely. Define 
$ A_i \( e \) = max_(0 lt.eq j lt.eq i) w_j \( e \) \, #h(2em) A_i = sum_(e = 1)^m A_i \( e \) . $

 Write $A_oo \( e \) = lim_(i arrow.r oo) A_i \( e \)$ and $A_oo = sum_e A_oo \( e \) = lim_(i arrow.r oo) A_i$. There are absolute constants $c \, C > 0$ such that 
#[#set math.equation(numbering: n => "(34)")
 $ bb(E) exp (frac(c A_oo, log \( m + 1 \))) lt.eq C . $ <eq:posterior-exponential>]

 Moreover, if $V$ is any event on a joint probability space with this martingale-path marginal and $p = P \( V \)$, then 
#[#set math.equation(numbering: n => "(35)")
 $ bb(E) \[ A_oo upright(bold(1))_V \] lt.eq C log \( m + 1 \) thin p log \( e \/ p \) \, $ <eq:posterior-event-weight>]

 where the right side is zero when $p = 0$. The event $V$ need not belong to any $cal(F)_i$.]
] <lem:posterior-maxima>

#proof[
  Write $B = log \( m + 1 \)$. We first show that, at every almost surely finite stopping time $rho$,
  #[#set math.equation(numbering: n => "(36)")
   $ bb(E) \[ A_oo - A_rho divides cal(F)_rho \] lt.eq B . $ <eq:posterior-future-increase>]
  For a fixed coordinate put $a = A_rho \( e \)$ and $p_e = w_rho \( e \)$, so that $0 lt.eq p_e lt.eq a lt.eq 1$. Conditional maximal inequality and integration over levels give, when $a > 0$,
  $ bb(E) \[ A_oo \( e \) - a divides cal(F)_rho \] lt.eq integral_a^1 p_e / u thin d u = p_e log \( 1 \/ a \) lt.eq p_e log \( 1 \/ p_e \) . $
  If $a = 0$, the martingale has conditional expectation zero at every later time and contributes zero. The conditional maximal inequality follows first for bounded stopping times and finite horizons; localization and monotone convergence give the displayed version. Summing over $e$ and adding the missing mass $1 - sum_e p_e$ bounds the resulting sum by the entropy of a probability vector on $m + 1$ elements, hence by $B$. This proves (36).
  At each time the increase of a coordinate maximum is at most its current value. Consequently
  $ A_0 lt.eq 1 \, #h(2em) 0 lt.eq A_i - A_(i - 1) lt.eq sum_e w_i \( e \) lt.eq 1 . $
  Set $b = 2 B + 1$ and consider the successive thresholds $1 + k b$, $k gt.eq 1$. At their first strict crossings, the overshoot is at most one. After a crossing, reaching the next threshold requires a further increase greater than $b - 1 = 2 B$. Conditional Markov inequality and (36) therefore bound the conditional probability of this next crossing by $1 \/ 2$. The first crossing has the same bound since $A_0 lt.eq 1$. Applying this argument at finite horizons and then letting the horizon increase yields
  $ P \( A_oo > 1 + k b \) lt.eq 2^(- k) . $
  Because $B gt.eq log 2$, this is an exponential tail on scale $B$, and its integral proves (34).
  Finally, for $p > 0$, conditional Jensen inequality gives
  $ exp (frac(c thin bb(E) \[ A_oo divides V \], B)) lt.eq bb(E) \[ exp \( c A_oo \/ B \) divides V \] lt.eq C \/ p . $
  Multiplication by $p$ and an adjustment of the absolute constant give (35). This last argument uses only a marginal exponential moment, so it applies to events in a larger joint space without any assertion that the martingales remain martingales in an enlarged filtration. ◻
]

=== 6.2 A first-contact estimate <a-first-contact-estimate>

The comparison of opposing paths through unvisited rows and the use of quenched exit probabilities are related to Zerner’s planar argument #cite(label("Zerner2007")) Section 2. Here the negative path starts at a random endpoint of the positive bridge; the posterior estimate controls the dependence created by that alignment.

We continue to use integer height $x_1$, and write $pi x in bb(Z)^(d - 1)$ for the lateral coordinates of $x in bb(Z)^d$. Recall that $u_n^(+) = P_0 \( T_n < T_(- 1) \)$ and $p_plus.minus > 0$ are the non-backtracking probabilities. The constants below may depend on the environment law and the dimension. We assume only strict positivity of the transition rows; no common ellipticity bound is imposed.

Fix an integer $N gt.eq 3$. Let $Y$ have the annealed bridge law from $0$ to its first arrival at height $N$, conditioned on $T_N < T_(- 1)$, and put $E = pi Y_(T_N)$. Independently sample a negative path $B$ with law $hat(P)_(- e_1)$. Translate it to the random starting site $\( N - 1 \, E \)$:

$ beta_j = \( N - 1 \, E \) + B_j \, #h(2em) j gt.eq 0 . $

Thus the relative negative path is independent of the positive bridge; its absolute position depends on the bridge endpoint. A departure of $Y$ means an index $i < T_N$. Every site of the infinite path $beta$ is a departure site. For a negative path started at height $N - 1$, write $D^(-)$ for the event that it never rises above $N - 1$.

#thm([Proposition 6.2.])[
  (First contact after a prescribed height).  #emph[In the preceding experiment, let $0 < k < r < N$ be integers and define 
$ tau = inf { i gt.eq T_k : i < T_N \, med Y_i in { beta_j : j gt.eq 0 } } \, #h(2em) Delta = u_(r - k)^(+) - u_(N - k)^(+) . $

 An empty infimum is $+ oo$. Then 
#[#set math.equation(numbering: n => "(37)")
 $ P (T_r lt.eq tau < T_N \, med min_(T_k lt.eq i lt.eq tau) \( Y_i \)_1 gt.eq k \, med parallel E parallel lt.eq N^2)\
lt.eq C log \( 2 N \) thin Delta log^2 \( e \/ Delta \) \, $ <eq:first-contact-bound>]

 with right side zero when $Delta = 0$.]
] <prop:contact-bound>

The estimate is useful when the remaining gap $N - r$ is small relative to the height $r - k$ already crossed. Lemma 12 gives $Delta lt.eq \( N - r \) F_(+) \( r - k \)$; Section 7 arranges precisely this separation of scales.

The time $tau$ refers to the entire negative trajectory and is not asserted to be a stopping time for the positive path. We will enumerate finite prefixes to use its first-contact property. Martingale estimates will instead be stopped at deterministic height barriers.

#proof[
  Let $cal(E)_N = { e in bb(Z)^(d - 1) : parallel e parallel lt.eq N^2 }$. Its cardinality satisfies
  #[#set math.equation(numbering: n => "(38)")
   $ log \( \| cal(E)_N \| + 1 \) lt.eq C_d log \( 2 N \) . $ <eq:endpoint-cardinality>]
  We first express the event in (37) by raw path weights, then transfer those weights to a shared environment, and only afterward introduce quenched exit probabilities.
  ===== 6.2.1 The lower prefix and the endpoint likelihood. <the-lower-prefix-and-the-endpoint-likelihood.>
  Enumerate a word $a_0$ from $0$ to its first arrival at height $k$, before height $- 1$. Its departure sites all have height less than $k$; write $z$ for its terminal site. For each $e in cal(E)_N$, enumerate a word $a$ from $z$ to the first contact arrival. The required words stay in heights $k \, dots.h \, N - 1$ and reach height $r$ before or at their terminal time. Let $"Dep" \( a \)$ denote the departure sites of $a$, excluding its terminal site unless that site occurred earlier as a departure.
  For any such positive prefix define
  $ w \( a_0 a \; e \) = P_0 #scale(x: 120%, y: 120%)[\(] T_N < T_(- 1) \, med pi X_(T_N) = e divides X upright(" begins with ") a_0 a #scale(x: 120%, y: 120%)[\)] . $
  This is a deterministic function of the two words and $e$. The two departure sets of $a_0$ and $a$ are disjoint, so the positive prefix and completion have raw probability
  #[#set math.equation(numbering: n => "(39)")
   $ W \( a_0 \) W \( a \) w \( a_0 a \; e \) . $ <eq:prefix-completion-weight>]
  For a raw negative walk started at $\( N - 1 \, e \)$, let $cal(B) \( a \)$ be the event that it never rises above $N - 1$, avoids $"Dep" \( a \)$ at every time, and visits the terminal site of $a$. The first-contact condition is exactly this avoidance and visit condition. In particular, if the terminal site of $a$ occurred earlier as a departure, the event $cal(B) \( a \)$ is empty. Summing (39) times the raw probability of $cal(B) \( a \)$, over these words and endpoints, and dividing by $u_N^(+) p_(-)$ gives the probability on the left of (37).
  ===== 6.2.2 Transfer and unique prefix counting. <transfer-and-unique-prefix-counting.>
  For a fixed word $a$, the quenched probability of $cal(B) \( a \)$ uses no rows at $"Dep" \( a \)$. Indeed the walk can be killed on first arrival at this set, before any row there is used. This remains valid for the infinite avoidance event by passage from finite paths. The departure-row identity of Lemma 2 therefore gives
  #[#set math.equation(numbering: n => "(40)")
   $ W \( a \) P_(\( N - 1 \, e \)) \( cal(B) \( a \) \) = bb(E) [p_omega \( a \) P_(\( N - 1 \, e \) \, omega) \( cal(B) \( a \) \)] \, $ <eq:unclassified-lower-transfer>]
  where $p_omega \( a \)$ is the quenched product of transition probabilities along the word. This identity has not been restricted by any environment-dependent exit-probability condition.
  Keep $W \( a_0 \)$ as a scalar outside the new experiment. In a fresh i.i.d. environment sample a raw walk $Z$ from $z$ and a raw negative walk from $\( N - 1 \, e \)$, independently conditional on the environment. We call $Z$ the comparison path. Formula (40) expresses the sum over $a$ as an integral over these two full paths. For each realized pair, at most one prefix $a$ of $Z$ satisfies the avoidance and visit conditions: its terminal is the first point of $Z$ in the range of the entire negative path. This proves uniqueness pathwise, without using an optional-stopping assertion at contact. The restrictions that $a$ stays above $k - 1$ and reaches $r$ are retained at this stage.
  ===== 6.2.3 Stopped posteriors on the comparison path. <stopped-posteriors-on-the-comparison-path.>
  Fix $a_0$ and consider the original raw positive law conditional on this lower prefix. In its natural continuation filtration, with no environment revealed, the coordinates
  $ w_i \( e \) = P_0 #scale(x: 120%, y: 120%)[\(] T_N < T_(- 1) \, med pi X_(T_N) = e divides a_0 \, upright(" continuation through time ") i #scale(x: 120%, y: 120%)[\)] \, #h(2em) e in cal(E)_N \, $
  are nonnegative martingales whose sum is at most one. Stop them on first arrival at height $k - 1$ or $N$. All departures up to this stop have height at least $k$. These rows are fresh under conditioning on $a_0$, so the stopped continuation has precisely the same path law as $Z$ stopped at
  $ sigma = T_(k - 1) \( Z \) and T_N \( Z \) . $
  Arrival at the lower boundary uses a row at height $k$, not a departure row at $k - 1$. Thus the equality includes the terminal arrival, as illustrated in Figure 2. The stopping time is almost surely finite by Lemma 3: a path that never leaves this finite height interval would have finite height supremum without tending to negative height infinity. The corresponding quenched assertion holds for almost every environment, simultaneously for all lattice starting sites and integer height intervals.
  Use these same posterior functions on the observed prefixes of $Z$, and freeze them at $sigma$. At arrival at $k - 1$ their values need not be zero: they still describe success before the original lower barrier $- 1$, and that completion may use rows affected by $a_0$. We neither recompute them in the fresh environment nor continue them through a departure below $k$. Put
  $ M \( e \) = sup_(0 lt.eq i lt.eq sigma) w_i \( e \) \, #h(2em) S_(*) = sum_(e in cal(E)_N) M \( e \) . $
  Lemma 17 and (38), applied in the path filtration of the stopped comparison walk, imply uniformly in $a_0$ that
  #[#set math.equation(numbering: n => "(41)")
   $ bb(E) \[ S_(*) upright(bold(1))_V \] lt.eq C log \( 2 N \) thin P \( V \) log \( e \/ P \( V \) \) $ <eq:comparison-event-weight>]
  for every event $V$ on the joint space of the fresh environment and $Z$. In particular, $bb(E) S_(*) lt.eq C log \( 2 N \)$. The event-weight inequality, rather than a martingale assertion after revealing the environment, permits the next step.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (11.4, 1.1), fill: rgb("#f2f2f2"), stroke: none)
  rect((0, 1.1), (11.4, 4.6), fill: rgb("#f5f5ff"), stroke: none)
  line((0, 0), (11.4, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.15, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  line((0, 0.7), (11.4, 0.7), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.15, 0.7), [#text(size: 9pt)[$k-1$]], anchor: "east", padding: 0.1176cm)
  line((0, 1.1), (11.4, 1.1), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.15, 1.1), [#text(size: 9pt)[$k$]], anchor: "east", padding: 0.1176cm)
  line((0, 4.6), (11.4, 4.6), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.15, 4.6), [#text(size: 9pt)[$N$]], anchor: "east", padding: 0.1176cm)
  line((-0.8, 0.15), (-0.8, 4.45), stroke: (paint: rgb("#4d4d4d"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#4d4d4d"))))
  content((-1, 2.3), [#text(size: 9pt)[height $x_1$]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  line((0.65, 0), (0.65, 0.32), (1.05, 0.32), (1.05, 0.58), (1.45, 0.58), (1.45, 0.88), (1.75, 0.88), (1.75, 1.1), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  circle((1.75, 1.1), radius: 0.07056, fill: black, stroke: none)
  content((1.85, 1.04), [#text(size: 9pt)[$z$]], anchor: "north-west", padding: 0.1176cm)
  content((2.65, -0.35), [#text(size: 8pt)[lower prefix $a_0$: departures below $k$]], anchor: "west", padding: 0.1176cm)
  line((1.75, 1.1), (1.75, 1.55), (2.2, 1.55), (2.2, 2.1), (2.65, 2.1), (2.65, 1.85), (3.2, 1.85), (3.2, 2.55), (3.65, 2.55), (3.65, 3.25), (4.05, 3.25), (4.05, 3.9), (4.45, 3.9), (4.45, 4.6), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  circle((4.45, 4.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  content((4.45, 4.77), [#text(size: 9pt)[upper exit: stop at arrival]], anchor: "south", padding: 0.1176cm)
  line((3.2, 2.55), (4.6, 2.55), (4.6, 2.15), (5, 2.15), (5, 1.75), (5.45, 1.75), (5.45, 1.1), (5.9, 1.1), (5.9, 0.7), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  circle((5.9, 0.7), radius: 0.08467, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  content((6.35, 0.76), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 8pt)[lower exit: stop at arrival;#linebreak()no departure from height $k-1$]])], anchor: "west")
  content((6.3, 3.6), [#text(size: 9pt)[Rows at heights $k, dots.h ,N-1$#linebreak()are fresh relative to $a_0$.]], anchor: "west", padding: 0.1176cm)
  content((6.3, 2.25), [#text(size: 8pt)[The two exit alternatives are schematic.#linebreak()The stopped path laws agree;#linebreak()the original posteriors are retained.]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: Fresh rows for the stopped comparison path. The lower prefix first reaches height $k$ at $z$, and all its departure rows lie below $k$. The continuation, shown with two schematic exit alternatives, stops on arrival at height $k - 1$ or $N$. It has used only rows with heights $k \, dots.h \, N - 1$, so its stopped path law agrees with the fresh comparison law. The original endpoint posteriors are frozen at this stop, not recomputed under a new completion law. Lateral positions are schematic. ],
  ) <fig:fresh-strip>
  ===== 6.2.4 Quenched exit-probability bins. <quenched-exit-probability-bins.>
  For $k lt.eq y_1 < N$ define
  $ Q_y^omega = P_(y \, omega) \( T_(k - 1) < T_N \) . $
  Almost surely every transition at every site is strictly positive. For each interior site $y$, a finite sequence of downward axial steps reaches $k - 1$ before $N$ with positive quenched probability; a finite sequence of upward axial steps reaches $N$ before $k - 1$ with positive quenched probability. Thus $0 < Q_y^omega < 1$, without a common bound away from either endpoint. Partition these values into dyadic bins $\[ a \, 2 a \)$, where $a = 2^(- j)$ and $j gt.eq 1$, and write $cal(D)_a^omega = { y : k lt.eq y_1 < N \, med a lt.eq Q_y^omega < 2 a }$ for the sites in one bin. Let $V_a$ be the event that, at or after its first arrival at height $r$ and before $sigma$, the comparison path visits an interior site with $Q_y^omega gt.eq a$. With the environment fixed, stop at the first such visit. The quenched Markov property gives
  #[#set math.equation(numbering: n => "(42)")
   $ a P \( V_a \) & lt.eq P_z \( T_r < T_(k - 1) < T_N \)\
 & = u_(r - k)^(+) - u_(N - k)^(+) = Delta . $ <eq:comparison-bin-probability>]
  The equality follows from nested first-hit events and almost sure exit from the height interval, again by Lemma 3. These events use the fresh comparison law, not the law conditioned on the lower prefix.
  For almost every environment, the raw negative walk has probability at most $2 a$ of both satisfying $D^(-)$ and hitting $cal(D)_a^omega$. To see this, take its first visit to that set. On $D^(-)$ the negative walk has finite first-coordinate supremum, so Lemma 3 implies that its first coordinate tends to $- oo$. The quenched form of that lemma holds outside a single environment-null set for all lattice starting sites. Consequently, after that first bin visit it must hit $k - 1$ before $N$, even if it had previously visited $k - 1$. Its conditional probability is at most $Q_y^omega < 2 a$ by the quenched Markov property.
  We now use the unique prefix established above. In the transferred integral, classify its contact site by its $Q^omega$ bin and bound its endpoint factor $w \( a_0 a \; e \)$ by $M \( e \)$. Dropping the exact-contact condition leaves $V_a$ for the comparison path and $D^(-) ∩ { upright("the negative path hits ") cal(D)_a^omega }$ for the negative path. There is no sum over competing prefixes. After integrating the negative path, every endpoint $e$ leaves the same fresh joint marginal $bb(P) \( d omega \) P_(z \, omega) \( d Z \)$. Thus the bin’s total contribution, summed over endpoints, is at most
  #[#set math.equation(numbering: n => "(43)")
   $ & sum_(e in cal(E)_N) bb(E) [M \( e \) upright(bold(1))_(V_a) P_(\( N - 1 \, e \) \, omega) \( D^(-) ∩ { upright("the path hits ") cal(D)_a^omega } \)]\
 & #h(35mm)  lt.eq 2 a thin bb(E) [upright(bold(1))_(V_a) sum_(e in cal(E)_N) M \( e \)] = 2 a thin bb(E) \[ S_(*) upright(bold(1))_(V_a) \] . $ <eq:bin-contribution>]
  If $Delta = 0$, every $V_a$ is null by (42), proving the required zero bound. Suppose $Delta > 0$. For $a < Delta$, sum (43) using $bb(E) S_(*) lt.eq C log \( 2 N \)$ and $sum_(a < Delta) a lt.eq 2 Delta$. For $a gt.eq Delta$, use (41) and $P \( V_a \) lt.eq Delta \/ a$ to bound the contribution by
  $ C log \( 2 N \) thin Delta log \( e a \/ Delta \) . $
  There are $O \( log \( e \/ Delta \) \)$ such dyadic bins, and their logarithms sum to $O \( log^2 \( e \/ Delta \) \)$. Thus, for each fixed $a_0$, all endpoint and upper-prefix contributions together are at most
  $ C log \( 2 N \) thin Delta log^2 \( e \/ Delta \) . $
  Finally $sum_(a_0) W \( a_0 \) = u_k^(+) lt.eq 1$, and $1 \/ \( u_N^(+) p_(-) \) lt.eq 1 \/ \( p_(+) p_(-) \)$. Restoring these factors proves (37). The constants lose only these fixed non-backtracking probabilities and the endpoint-cardinality factor. In particular, the argument has not required a lower bound for $Q_y^omega$ or an inverse-transition moment. ◻
]

The estimate controls a contact anywhere after the prescribed height $r$. It therefore applies to a long interval without subdividing the positive path by its successive record heights. In the next section a missing interval of contact depths forces exactly such a late first contact.

== 7 Many contact scales and the contradiction <sec:contradiction>

We now apply Proposition 18 to the opposed arrangement. An interval of depths containing no contact forces the first contact above each positive cut in that interval to occur close to the top. The first-contact estimate makes this unlikely on average over the cuts. We first count scales of #emph[depth]; the finite mean common-block width will then convert this count into the block-index count used in Proposition 14.

#thm([Proposition 7.1.])[
  #emph[Suppose that both coordinate signs have positive directional-transience probability. In the opposed arrangement of Section 4, let $m \( J \)$ be the expected number of dyadic common-block index intervals $\( 2^j \, 2^(j + 1) \]$, $1 lt.eq j lt.eq J$, containing a departure-site contact, as in (23). There are constants $c > 0$ and $J_0 < oo$ such that 
$ m \( J \) gt.eq frac(c J, log log \( 3 + J \)) #h(2em) \( J gt.eq J_0 \) . $

]
] <prop:contact-lower>

#proof[
  All constants below may depend on the two slab laws. Choose a large integer $J$ and put
  #[#set math.equation(numbering: n => "(44)")
   $ N = 2^(2 J) \, #h(2em) G = ⌈4 log_2 log \( 2 + J \)⌉ + 3 . $ <eq:lower-parameters>]
  For sufficiently large $J$, we have $3 lt.eq G < J$. Depth means distance below the initial top of the arrangement. The choice $2^(- G) = O \( \( log J \)^(- 4) \)$ compensates for the logarithmic losses below, while $G = O \( log log J \)$ leaves enough contact scales.
  ===== 7.1 A bridge ending at a prescribed depth. <a-bridge-ending-at-a-prescribed-depth.>
  Let $cal(C)_N$ be the event that the positive tape has a cut at depth $N$, and write
  $ upright(bold(Q))_N = upright(bold(P)) \( thin dot.op divides cal(C)_N \) . $
  The renewal identity gives $upright(bold(P)) \( cal(C)_N \) = u_N^(+) gt.eq p_(+) > 0$. Under $upright(bold(Q))_N$, reverse the list of positive slabs through this cut and translate its bottom to the origin. Call the resulting chronological path $Y$, and let $T_a$ denote its first hit of height $a$. Lemma 11 says that $Y$ has law $P_0 \( thin dot.op divides T_N < T_(- 1) \)$, stopped at $T_N$. The steps within each slab retain their original order. Denote the lateral endpoint by $E$, so that the endpoint is $\( N \, E \)$. The negative trajectory starts at $\( N - 1 \, E \)$ and, relative to that starting point, has the independent law $hat(P)_(- e_1)$.
  The endpoint has a useful elementary tail bound. On $cal(C)_N$ there are at most $N$ positive slabs before depth $N$, since their widths are positive integers. The norm of their total lateral displacement is at most the sum of their radii, hence at most the sum of the first $N$ positive tape radii. Proposition 8 and Markov’s inequality give
  #[#set math.equation(numbering: n => "(45)")
   $ bb(E)_(upright(bold(Q))_N) \| E \| lt.eq frac(N E_(+) R, p_(+)) \, #h(2em) upright(bold(Q))_N { \| E \| > N^2 } lt.eq C / N . $ <eq:lower-endpoint-tail>]
  This uses a spatial radius moment only.
  ===== 7.2 An uncovered scale forces a late first contact. <an-uncovered-scale-forces-a-late-first-contact.>
  Call $l gt.eq 0$ a contact depth label if a contact occurs at some integer depth in $\[ 2^l \, 2^(l + 1) \)$. For $G < l lt.eq J$, let $U_l$ be the event that none of the labels $l - G \, l - G + 1 \, dots.h \, l$ is a contact depth label. Equivalently, there is no contact at depths in $\[ 2^(l - G) \, 2^(l + 1) \)$.
  Fix a positive cut depth
  $ s in I_l := #scale(x: 120%, y: 120%)[\[] 2^l \, 3 / 2 thin 2^l #scale(x: 120%, y: 120%)[\]] ∩ bb(Z) \, #h(2em) k = N - s . $
  After the list reversal, this cut occurs at the bridge’s first hit $T_k$, and the remaining bridge stays at or above height $k$. Indeed, every earlier slab has departure heights below $k$, while every later slab has departure heights at least $k$. This is a property of the words, without a stopping-time assertion about the cut.
  There is a contact after $T_k$ and before $T_N$: the last positive departure is $\( N - 1 \, E \)$, the starting departure site of the negative trajectory. Let $tau$ be the first contact since $T_k$, defined pathwise against the entire negative trajectory. Its depth is at most $s < 2^(l + 1)$. On $U_l$, it must therefore be strictly less than $2^(l - G)$. With
  $ r = N - 2^(l - G) \, $
  the nearest-neighbor path must have reached height $r$ before this contact. Thus
  #[#set math.equation(numbering: n => "(46)")
   $ T_r lt.eq tau < T_N \, #h(2em) Y_n dot.op e_1 gt.eq k quad \( T_k lt.eq n lt.eq tau \) . $ <eq:uncovered-first-contact>]
  No restriction on drawdowns from the running maximum is needed.
  For each #emph[deterministic] $s in I_l$, let $cal(A)_(l \, s)$ be the event in (46), together with $\| E \| lt.eq N^2$, whether or not $s$ is a cut. Proposition  18, with upper stopping height $N$, applies to this event. Its width-probability difference satisfies
  #[#set math.equation(numbering: n => "(47)")
   $ Delta_(l \, s) & = u_(s - 2^(l - G))^(+) - u_s^(+)\
 & lt.eq 2^(l - G) F_(+) \( s - 2^(l - G) \) lt.eq 2^(- G) a_l \, #h(2em) a_l := 2^l F_(+) \( 2^(l - 1) \) \, $ <eq:lower-delta>]
  because $s - 2^(l - G) gt.eq 2^(l - 1)$ and Lemma 12 applies. The same Lemma gives
  #[#set math.equation(numbering: n => "(48)")
   $ A := sum_(l gt.eq 1) a_l < oo . $ <eq:lower-summable-tail>]
  Writing $phi.alt \( x \) = x log^2 \( e \/ x \)$ for $0 < x lt.eq 1$ and $phi.alt \( 0 \) = 0$, the first-contact estimate is
  #[#set math.equation(numbering: n => "(49)")
   $ upright(bold(Q))_N \( cal(A)_(l \, s) \) lt.eq C log \( 2 N \) thin phi.alt \( Delta_(l \, s) \) . $ <eq:lower-fixed-cut-bound>]
  ===== 7.3 Averaging over the cuts. <averaging-over-the-cuts.>
  Let $mu_(+) = E_(+) L$. The renewal-count strong law yields, almost surely under the positive tape law,
  $ \# { upright("positive cuts in ") I_l } = 2^(l - 1) / mu_(+) + o \( 2^l \) #h(2em) \( l arrow.r oo \) . $
  Fix $c_0 = 1 \/ \( 4 mu_(+) \)$, and let $cal(B)_J$ be the event that each interval $I_l$, $G < l lt.eq J$, contains at least $c_0 2^l$ positive cuts. Since $G = G \( J \) arrow.r oo$, the eventual almost-sure estimate implies $upright(bold(P)) \( cal(B)_J^c \) = o \( 1 \)$. Moreover,
  #[#set math.equation(numbering: n => "(50)")
   $ upright(bold(Q))_N \( cal(B)_J^c \) lt.eq frac(upright(bold(P)) \( cal(B)_J^c \), p_(+)) = o \( 1 \) . $ <eq:cut-density-conditioning>]
  In particular, no independence between the cut at $N$ and the density event is required.
  On $cal(B)_J ∩ { \| E \| lt.eq N^2 }$, every uncovered label $l$ produces $cal(A)_(l \, s)$ for each actual cut $s in I_l$. Consequently,
  #[#set math.equation(numbering: n => "(51)")
   $ upright(bold(1))_(U_l) upright(bold(1))_(cal(B)_J) upright(bold(1))_({ \| E \| lt.eq N^2 }) lt.eq frac(1, c_0 2^l) sum_(s in I_l) upright(bold(1))_(cal(A)_(l \, s)) . $ <eq:cut-averaging>]
  The right side has dropped the cut requirement on $s$. This permits the deterministic-barrier estimate (49); the number of summands is $O \( 2^l \)$ and cancels the averaging factor.
  We next check that the logarithms in this estimate do not require a quantitative tail rate. For $J gt.eq 3$, put
  $ B_J = sum_(l = 1)^J a_l log_(+)^2 \( 1 \/ a_l \) \, #h(2em) log_(+) x := max { log x \, 0 } \, $
  where a zero summand is interpreted as zero. Terms with $a_l gt.eq J^(- 2)$ contribute at most $4 A log^2 J$. On $\( 0 \, J^(- 2) \)$, the function $x log^2 \( 1 \/ x \)$ is increasing, so the remaining at most $J$ terms contribute at most $4 J^(- 1) log^2 J$. Therefore
  #[#set math.equation(numbering: n => "(52)")
   $ B_J lt.eq 4 \( A + J^(- 1) \) log^2 J . $ <eq:weighted-tail-log>]
  For sufficiently large $J$, $2^(- G) a_l lt.eq e^(- 1)$ uniformly in $l$, since $a_l lt.eq A$. The function $phi.alt$ is increasing on $\[ 0 \, e^(- 1) \]$. Thus (47) gives, uniformly over $s in I_l$,
  $ phi.alt \( Delta_(l \, s) \) lt.eq C 2^(- G) a_l #scale(x: 120%, y: 120%)[\(] G + 1 + log_(+) \( 1 \/ a_l \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Taking expectations in (51), then using (45), (49), and (50), gives
  #[#set math.equation(numbering: n => "(53)")
   $ sum_(l = G + 1)^J upright(bold(Q))_N \( U_l \) & lt.eq J upright(bold(Q))_N \( cal(B)_J^c \) + frac(C J, N) + C log \( 2 N \) thin 2^(- G) #scale(x: 120%, y: 120%)[\[] A \( G + 1 \)^2 + B_J #scale(x: 120%, y: 120%)[\]]\
 & = o \( J \) . $ <eq:few-uncovered>]
  Indeed, $log \( 2 N \) = O \( J \)$, while the choice  (44) gives $2^(- G) = O \( log^(- 4) \( 2 + J \) \)$. By (52), the last term is $O \( J \/ log^2 \( 2 + J \) \)$.
  ===== 7.4 Removing the conditioning. <removing-the-conditioning.>
  Let $H_J$ count contact depth labels in ${ 1 \, dots.h \, J }$. Equation (53) and Markov’s inequality imply that with $upright(bold(Q))_N$-probability tending to one, at most $J \/ 4$ of the tested labels are uncovered. Since $G = o \( J \)$, at least $J \/ 2$ are then covered. A single contact depth label $h$ can cover only the labels $h \, h + 1 \, dots.h \, h + G$. Hence
  #[#set math.equation(numbering: n => "(54)")
   $ upright(bold(Q))_N {H_J gt.eq frac(J, 2 \( G + 1 \))} arrow.r 1 . $ <eq:height-count-conditioned>]
  For large $J$, all depths counted here are less than $2^(J + 1) < N$. On $cal(C)_N$ they are therefore fully represented in the positive list ending at depth $N$. Undoing the translation and list reversal leaves exactly the contacts in the original opposed arrangement. Thus (54) implies
  #[#set math.equation(numbering: n => "(55)")
   $ upright(bold(P)) {H_J gt.eq frac(J, 2 \( G + 1 \))} gt.eq p_(+) - o \( 1 \) . $ <eq:height-count-unconditioned>]
  Only a probability bounded away from zero is asserted after removing the conditioning. This is enough for an expectation lower bound.
  ===== 7.5 From depths to common-block indices. <from-depths-to-common-block-indices.>
  Write $K_1 \, K_2 \, dots.h$ for the common-block widths and $W_i = K_1 + dots.h.c + K_i$, with $W_0 = 0$. By Lemma 13, $mu := upright(bold(E)) K_1 < oo$ and $W_i \/ i arrow.r mu$ almost surely. In particular, eventually
  $ mu / 2 i lt.eq W_i lt.eq 2 mu i . $
  An integer depth $z gt.eq 1$ belongs to the unique block
  $ i \( z \) = min { i gt.eq 1 : W_i gt.eq z } \, #h(2em) W_(i \( z \) - 1) < z lt.eq W_(i \( z \)) . $
  The departure-height convention makes this true even at a common cut depth. For every sufficiently large $z$, the strong-law bounds give
  #[#set math.equation(numbering: n => "(56)")
   $ frac(z, 2 mu) lt.eq i \( z \) < frac(2 z, mu) + 1 . $ <eq:depth-index-comparison>]
  The finite initial blocks, however large their widths, disappear once $z$ exceeds their cumulative width.
  Define the dyadic index label of a block $i > 1$ by $j \( i \) = ceil.l log_2 i ceil.r - 1$, so that $2^(j \( i \)) < i lt.eq 2^(j \( i \) + 1)$. It follows from (56) that there is a deterministic integer $c_1$, depending only on $mu$, such that eventually
  #[#set math.equation(numbering: n => "(57)")
   $ \| j \( i \( z \) \) - l \| lt.eq c_1 quad upright("whenever ") 2^l lt.eq z < 2^(l + 1) . $ <eq:bounded-label-shift>]
  Almost surely this holds above a finite random depth. Therefore the probability that it holds for every contact with $ceil.l sqrt(J) ceil.r lt.eq l lt.eq J$ tends to one.
  Intersect this event with the event in (55). The intersection still has probability at least $p_(+) - o \( 1 \)$. Discarding the first $ceil.l sqrt(J) ceil.r$ depth labels loses $o \( J \/ \( G + 1 \) \)$ labels. Each remaining contact depth label supplies a contact block whose index label lies within $c_1$ of it. Conversely, one index label can account for at most $2 c_1 + 1$ depth labels. Thus, on the intersection, at least $c_2 J \/ \( G + 1 \)$ of the index labels $1 \, dots.h \, J + c_1$ contain a contact, for a fixed $c_2 > 0$ and large $J$. Taking expectations yields
  $ m \( J + c_1 \) gt.eq frac(c_3 J, G + 1) . $
  Since $G + 1 = O \( log log \( 3 + J \) \)$, replacing $J + c_1$ by the argument of $m$ proves the proposition. ◻
]

#proof[
  Fix any nonzero real direction $ell$. Suppose that $0 < P_0 \( A_ell \) < 1$. Lemma 7 implies that $P_0 \( A_(- ell) \) > 0$. The spatial-radius estimate and Proposition 10 then supply a coordinate direction in which both signs have positive probability. Reflecting and relabeling that coordinate gives the setting of Propositions 14 and 19. They imply simultaneously
  $ m \( J \) = O #h(-0.16667em) (frac(J, log J)) quad upright("and") quad m \( J \) gt.eq frac(c J, log log \( 3 + J \)) $
  for all sufficiently large $J$, which is impossible. Thus $P_0 \( A_ell \) in { 0 \, 1 }$.
  The reduction applies to every fixed real $ell$ without rational approximation. Strict ellipticity supplied the fresh-row probabilities; the spatial-radius moment was derived under coexistence. Neither a moment of a slab’s duration nor a speed assumption entered the argument. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
