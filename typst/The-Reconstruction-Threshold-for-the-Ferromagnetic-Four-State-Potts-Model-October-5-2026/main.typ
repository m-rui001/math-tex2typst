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

#align(center)[#text(size: 16pt, weight: "bold")[The Reconstruction Threshold for the \
Ferromagnetic Four-State Potts Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

In a broadcast process on a tree, each vertex transmits a noisy copy of its spin to its children.
  The reconstruction problem asks whether the spins far from the root retain information about its initial spin.
  For the symmetric four-state channel, the linear second-moment threshold has long been expected to be the exact
  reconstruction threshold in the ferromagnetic regime. We prove the nonreconstruction direction at and below this
  threshold for all regular and Poisson branching parameters.

=== 1.1 Model and main result <model-and-main-result>

Write $\[ 4 \] = { 1 \, 2 \, 3 \, 4 }$. The root spin $sigma_rho$ is uniform on $\[ 4 \]$.
  For a parameter $lambda in \[ 0 \, 1 \]$, each edge independently transmits the parent spin through the channel

#[#set math.equation(numbering: n => "(1.1)")
 $ P_lambda \( j divides i \) = lambda upright(bold(1))_({ i = j }) + frac(1 - lambda, 4) \, wide i \,
   j in \[ 4 \] . $ <eq:broadcast-channel>]

The parameter $lambda$ is the nontrivial eigenvalue of the channel;
  its nonnegativity specifies the ferromagnetic regime.

We consider the rooted $d$-ary tree, where every vertex has exactly $d$ children,
  and a Galton–Watson tree with independent Poisson$\( d \)$ offspring counts.
  In the latter case the tree is sampled independently of the root spin and the randomness used by the edge
  channels. The observer is given the entire rooted tree $T$ and the spins $sigma_(L_n)$ at level $L_n = { v :
  "dist" \( v \, rho \) = n }$. Let

#[#set math.equation(numbering: n => "(1.2)")
 $ a_n \( d \, lambda \) =
   bb(E) [1 / 2 sum_(i = 1)^4 lr(|Pr \( sigma_rho = i divides T \, sigma_(L_n) \) - 1 / 4|)] . $ <eq:advantage>]

The tree observation in the Galton–Watson model is unlabelled, the level observation is empty when $L_n$ is empty,
  and the expectation is not conditioned on survival. Nonreconstruction means that $a_n \( d \, lambda \)$ tends
  to zero.

#thm([Theorem 1.1.])[
  #emph[For the channel (1.1), if $d lambda^2 lt.eq 1$, then
$ lim_(n arrow.r oo) a_n \( d \, lambda \) = 0 $

 in each of the following models:]
  + #emph[the rooted $d$-ary tree, for every integer $d gt.eq 2$;]
  + #emph[the Poisson$\( d \)$ Galton–Watson tree, for every real $d > 0$.]
  #emph[In particular, the assertion includes $d lambda^2 = 1$.]
] <thm:main>

Here $d$ denotes the number of children or its mean, not the total undirected degree.
  The known Kesten–Stigum reconstruction direction for $d lambda^2 >
  1$ makes Theorem 1 an exact threshold statement [6,11,8].
  For Poisson trees, the branching-number reconstruction criterion applies on survival,
  where the branching number equals $d$; survival has positive probability when $d lambda^2 > 1$.
  The theorem is computer assisted: all probabilistic arguments are proved below,
  and the remaining polynomial inequalities are verified by the complete exact-arithmetic programs in Appendix 7.

=== 1.2 History and significance <history-and-significance>

The Kesten–Stigum criterion originates in the second-moment analysis of multitype branching processes [6].
  In tree broadcasting it gives the reconstruction direction above $d lambda^2 = 1$,
  but the corresponding nonreconstruction assertion depends on the channel.
  For binary symmetric channels, Bleher, Ruiz, and Zagrebnov established sharpness on regular trees [2]; Evans,
  Kenyon, Peres, and Schulman developed the general-tree theory [3].
  Mossel showed that the spectral criterion need not be necessary for other channels [10].
  For Potts channels, this distinction becomes decisive as the number of states increases.
  Mézard and Montanari proposed threshold coincidence for small alphabets and discussed its extension to all
  regular degrees [9] Section 8. Sly proved sharpness for the three-state model on regular trees of sufficiently
  large degree and established failure of sharpness for $q gt.eq 5$ [14].
  The four-state case lies at the boundary between these behaviors.

Mossel, Sly, and Sohn proved nonreconstruction, including the critical point,
  for the three- and four-state models on Galton–Watson trees of sufficiently large mean degree under hypotheses
  that cover both regular and Poisson offspring [12]. Theorem 1 removes the large-degree restriction for the
  ferromagnetic four-state model in these two families. Cavity expansions and numerical investigations by
  Ricci-Tersenghi, Semerjian, and Zdeborová also support the four-state ferromagnetic threshold [13];
  those predictions are distinct from a rigorous all-degree nonreconstruction theorem.
  The restriction $lambda gt.eq 0$ matters: the four-state antiferromagnetic model can reconstruct below the
  Kesten–Stigum threshold [12].

=== 1.3 The proof mechanism <the-proof-mechanism>

The key object is the distribution of a posterior probability vector $p = \( p_1 \, p_2 \, p_3 \, p_4 \)$,
  not an individual vector. Define its quadratic information by

$ A \( p \) = 4 sum_(i = 1)^4 p_i^2 - 1 . $

A channel step multiplies $bb(E) A$ by $lambda^2$. The problem is to control the nonlinear combination of the
  observations arriving from different children. We construct a degree-six polynomial $H$ for which the additional
  constraint $bb(E) H \( p \) gt.eq 0$ is preserved by both channel steps and the combination of observations.
  Two explicit polynomial inequalities then make $bb(E) A$ subadditive under combination,
  with a strictly positive cubic saving when two informative branches are present.

Writing $m_n$ for the expected quadratic information at depth $n$, this gives, for $lambda > 0$, a recursion of the form

$ m_(n + 1) lt.eq d lambda^2 m_n - c m_n^3 \, wide c = c \( d \, lambda \) > 0 . $

The cubic term is essential at equality: it forces $m_n arrow.r 0$ even when the linear coefficient equals one.
  The constraint on the posterior law is linear, so it also survives mixtures over the observed offspring count.
  This is what allows the same pairwise inequalities to treat the Poisson and regular models.

Expected functionals of posterior distributions are central to earlier entropy and stochastic Lyapunov methods,
  including the work of Formentin and Külske [4]. Rigorous computational methods for nonreconstruction include
  Bhatnagar and Maneva’s survey method [1] and Gu’s population-dynamics method for binary Poisson hypertrees [5].
  The additional ingredient here is the explicit polynomial constraint that remains valid during each pairwise
  combination of observations. Its pairing with the two combination inequalities gives a strict moment saving for
  every parameter in the two branching families when $lambda > 0$.

The required inequalities are certified on products of probability simplices by nonnegative homogeneous
  coefficients, using Taylor lower bounds and interpolation with explicitly certified remainders.
  The interpolation itself is never assumed to approximate the target accurately.
  Thus the computation verifies fixed polynomial inequalities on all posterior vectors;
  the preserved constraint on their laws then supplies the tree argument.

Section 2 gives the posterior operations, and Section 3 states the explicit polynomial inequalities and derives
  their consequences for posterior laws. Section 4 completes the probabilistic argument.
  Sections 5 and 6 prove the inequalities through a finite exact-arithmetic calculation.

== 2 Symmetric posterior experiments <sec:experiments>

The observations below are experiments about an input that is uniform on $\[ 4 \]$.
  A tree combines such experiments in two ways: an observation passes through one broadcast edge,
  and observations from different branches are combined. We record the exact posterior laws for these operations,
  keeping separate the independent laws used in a calculation and the actual law of a combined observation.
  The normalized posterior update and its change of observation law are standard in broadcasting recursions;
  see [9] Sections 2.2–2.4.

Write

$ Delta_4 = {p in \[ 0 \, 1 \]^4 : sum_(i = 1)^4 p_i = 1} \, wide
  bold(u) = \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \) \, $

and let $frak(S)_4$ be the group of permutations of $\[ 4 \]$.
  An experiment consists of a uniform input $I in \[ 4 \]$ and an observation $Y$.
  Write $kappa_i$ for the conditional law of $Y$ given $I = i$, and $kappa = 1 /
  4 sum_i kappa_i$ for its marginal law. Since each $kappa_i$ is absolutely continuous with respect to $kappa$,
  its posterior vector $p \( Y \) in Delta_4$ satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ p_i \( y \) = 1 / 4 frac(upright(d) kappa_i, upright(d) kappa) \( y \) \, wide
   frac(upright(d) kappa_i, upright(d) kappa) \( y \) = 4 p_i \( y \) . $ <eq:posterior-likelihood>]

These identities also define the posterior on a general observation space, up to a $kappa$-null set.
  Denote by $mu$ the law of $p \( Y \)$ under $kappa$. In particular,

$ integral_(Delta_4) p_i thin upright(d) mu \( p \) = 1 / 4 wide \( i in \[ 4 \] \) . $

Conversely, any probability law $mu$ with this barycenter is realized by taking the observation space to be
  $Delta_4$ and its conditional laws to be $4 p_i thin upright(d) mu \( p \)$.
  We call the experiment symmetric if $mu$ is invariant under all permutations of its four coordinates.
  This is a condition on the law of the posterior, not on an individual posterior vector.

The following coordinates remove the constant direction:

#[#set math.equation(numbering: n => "(2.2)")
 $ L = mat(delim: "(", 1, 1, - 1, - 1; 1, - 1, 1, - 1; 1, - 1, - 1, 1) \, wide x = L p \, wide
   A \( p \) = \| L p \|^2 . $ <eq:posterior-coordinates>]

Since $L^(sans(T)) L = 4 "Id" - bold(1) bold(1)^(sans(T))$, where $bold(1) = \( 1 \, 1 \, 1 \, 1 \)^(sans(T))$,

#[#set math.equation(numbering: n => "(2.3)")
 $ A \( p \) = 4 sum_(i = 1)^4 \( p_i - 1 \/ 4 \)^2 \, wide 0 lt.eq A \( p \) lt.eq 3 \, wide 1 /
   2 sum_(i = 1)^4 \| p_i - 1 \/ 4 \| lt.eq 1 / 2 sqrt(A \( p \)) . $ <eq:quadratic-tv>]

Thus decay of the mean of $A$ will imply nonreconstruction.

#thm([Lemma 2.1.])[
  (Bayes product).  #emph[Let two experiments have the same uniform input and observations that are independent
    conditional on that input. Let $mu$ and $nu$ be their individual posterior laws. For $p \, q in Delta_4$, define
$ U_i \( p \, q \) = 4 p_i q_i \, wide z \( p \, q \) = sum_(i = 1)^4 U_i \( p \, q \) \, wide P_i \( p \, q \) =
  frac(U_i \( p \, q \), z \( p \, q \)) quad upright("when ") z \( p \, q \) > 0 . $

 Set $P \( p \, q \) = bold(u)$ when $z \( p \, q \) = 0$.
   The posterior law of the combined experiment, denoted by $mu star.op nu$, is characterized by
#[#set math.equation(numbering: n => "(2.4)")
 $ integral_(Delta_4) f \( r \) thin upright(d) \( mu star.op nu \) \( r \) =
   integral_(Delta_4 times Delta_4) z \( p \, q \) f \( P \( p \, q \) \) thin upright(d) mu \( p \) thin
   upright(d) nu \( q \) $ <eq:product-law>]

 for every bounded measurable $f$. The measure on the right has total mass one.
   If both experiments are symmetric, their combined experiment is symmetric.]
] <lem:bayes-product>

#proof[
  Let $kappa \, eta$ be the marginal observation laws, with posterior vectors $p \( y \) \, q \( w \)$.
    Conditional independence and (2.1) show that the joint observation law has density
  $ 1 / 4 sum_(i = 1)^4 \( 4 p_i \( y \) \) \( 4 q_i \( w \) \) = z \( p \( y \) \, q \( w \) \) $
  with respect to $kappa ⊗ eta$. Bayes’ formula then gives the combined posterior $P$.
    Pushing this identity forward to the two posterior vectors proves (2.4).
    Its normalization can also be checked directly:
  $ integral z \( p \, q \) thin upright(d) mu \( p \) thin upright(d) nu \( q \) =
    4 sum_(i = 1)^4 (integral p_i thin upright(d) mu) (integral q_i thin upright(d) nu) = 1 . $
  Finally, simultaneous coordinate permutation leaves $z$ unchanged and permutes $P$ by the same permutation.
    Invariance of $mu$ and $nu$ therefore implies invariance of $mu star.op nu$. ◻
]

In (2.4), $p$ and $q$ are independent under $mu ⊗ nu$. They generally are not independent under the actual
  observation law $z thin upright(d) mu thin upright(d) nu$.
  All factorizations of expectations below use the former measure, before the factor $z$ is applied.
  The choice of $P$ at $z = 0$ never affects a combined expectation.

#thm([Lemma 2.2.])[
  (Passage through one edge).  #emph[Let $I$ be uniform on $\[ 4 \]$,
    let $J$ be obtained from $I$ through the channel $P_lambda$, and let $Y$ be an experiment about $J$,
    independent of $I$ conditional on $J$. If $mu$ is the posterior law for $J$ given $Y$,
    then the posterior law for $I$ given $Y$ is the pushforward of $mu$ by
#[#set math.equation(numbering: n => "(2.5)")
 $ C_lambda \( p \) = bold(u) + lambda \( p - bold(u) \) \, wide L C_lambda \( p \) = lambda L p \, wide
   A \( C_lambda \( p \) \) = lambda^2 A \( p \) . $ <eq:channel-scaling>]

 In particular, this operation preserves symmetry.]
] <lem:channel>

#proof[
  The channel is symmetric and doubly stochastic, so $J$ is uniform and $Pr \( I = i divides J = j \) =
    P_lambda \( i divides j \)$. If $p$ is the posterior of $J$ given $Y$, the posterior of $I$ is consequently
  $ sum_(j = 1)^4 P_lambda \( i divides j \) p_j = lambda p_i + frac(1 - lambda, 4) . $
  The marginal law of $Y$ is the same whether it is regarded as an experiment about $I$ or about $J$.
    This proves the pushforward statement. The remaining identities follow from $L bold(u) = 0$,
    and symmetry follows because $C_lambda$ commutes with coordinate permutations. ◻
]

We will also use observed mixtures of experiments. Suppose an index $S$ is independent of the input and,
  conditional on $S = s$, the observation has posterior law $mu_s$.
  If $S$ itself is observed, the resulting posterior law is $integral mu_s thin upright(d) Pr_S \( s \)$.
  Hence symmetry and any linear inequality on posterior laws are preserved under such mixtures.
  In the tree application, $S$ will be the offspring count.
  The uninformative experiment has posterior law concentrated at $bold(u)$;
  the experiment that reveals the input has posterior law assigning mass $1 \/
  4$ to each of the four coordinate vectors.

== 3 A preserved constraint on posterior laws <sec:cone>

The second moment $bb(E) A \( p \)$ measures information about the input,
  but the estimate we need for products also involves one higher-order statistic.
  We now give this statistic explicitly. Its expectation will remain nonnegative throughout the recursion,
  allowing a strict improvement on second-moment subadditivity.

For $x = L p$, with $L$ as in Section 2, set

$ B \( p \) = x_1 x_2 x_3 \, wide C \( p \) = x_1^2 x_2^2 + x_1^2 x_3^2 + x_2^2 x_3^2 . $

Together with $A \( p \) = x_1^2 + x_2^2 + x_3^2$, these polynomials are invariant under permuting the four
  entries of $p$. Indeed, such a permutation acts on $x$ by a permutation of its coordinates and an even number of
  sign changes. Define $H \, F \, G$ by the following coefficient table, whose entries are divided by $1000$:

#[#set math.equation(numbering: n => "(3.1)")
 $ & 1 & A & B & A^2 & C & A B & A^3 & A C & B^2\
H & 0 & 0 & 1000 & - 100 & - 150 & 300 & - 20 & 70 & - 510\
F & 0 & 4000 & - 3000 & 700 & - 4000 & - 800 & 0 & 0 & 0\
G & 1000 & - 1610 & - 3100 & 773 & 4000 & - 3980 & 0 & 0 & 0 $ <eq:polynomial-table>]

Thus, for example, $H = B - A^2 \/ 10 - 3 C \/ 20 + 3 A B \/ 10 - A^3 \/ 50 + 7 A C \/ 100 - 51 B^2 \/ 100$.
  We also write $H \( x \)$ when its three coordinate arguments, rather than the probability vector, are supplied.

For $p \, q in Delta_4$ and $pi in frak(S)_4$, put

$ U_i^pi = 4 p_i q_(pi \( i \)) \, wide z_pi = sum_(i = 1)^4 U_i^pi \, wide P^pi = U^pi \/ z_pi quad \( z_pi > 0 \) . $

For a continuous function $phi.alt$ on $Delta_4$, use the notation

#[#set math.equation(numbering: n => "(3.2)")
 $ \[ z phi.alt \( P \) \] \( p \, q \) = 1 / 24 sum_(pi in frak(S)_4) z_pi phi.alt \( P^pi \) \,
   $ <eq:permutation-average>]

with each summand set to zero when $z_pi = 0$. Finally, define

#[#set math.equation(numbering: n => "(3.3)")
 $ D_0 \( p \, q \) =
   frac(A \( p \) A \( q \) #scale(x: 120%, y: 120%)[\(] A \( p \) + A \( q \) #scale(x: 120%, y: 120%)[\)],
   1000) . $ <eq:cubic-saving>]

#thm([Proposition 3.1.])[
  (Polynomial inequalities).  #emph[For every $p \, q in Delta_4$,
    the polynomials in (3.1) satisfy $F \( p \) gt.eq 0$, $G \( p \) gt.eq 0$, and $H \( p \) gt.eq - 1 \/ 2$.
    For $x = L p$ and $0 lt.eq t lt.eq 1$,
#[#set math.equation(numbering: n => "(3.4)")
 $ H \( t x \) gt.eq t^3 H \( x \) . $ <eq:H-scaling>]

 Moreover,
#[#set math.equation(numbering: n => "(3.5)")
 $ \[ z A \( P \) \] \( p \, q \) & lt.eq A \( p \) + A \( q \) - H \( p \) F \( q \) - F \( p \) H \( q \) -
   D_0 \( p \, q \) \,\
\( p \, q \) & gt.eq H \( p \) G \( q \) + G \( p \) H \( q \) . $ <eq:A-product>]

]
] <prop:polynomial-inequalities>

Sections 5 and 6 prove this proposition using exact polynomial sign certificates.
  We first show how it controls posterior laws; this identifies the purpose of each inequality before the
  coefficient calculation begins.

Let $cal(C)$ be the class of symmetric posterior laws $mu$ for which

#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E)_mu H \( p \) gt.eq 0 . $ <eq:cone-condition>]

The condition is linear in the law. It does not require $H \( p \) gt.eq 0$ at every posterior:
  for example, $p = \( 1 \/ 2 \, 1 \/ 2 \, 0 \, 0 \)$ has $H \( p \) = - 3 \/ 25$.
  The completely informative experiment and the uninformative experiment belong to $cal(C)$, because

#[#set math.equation(numbering: n => "(3.7)")
 $ H \( e_i \) = 13 / 100 quad \( 1 lt.eq i lt.eq 4 \) \, wide H \( bold(u) \) = 0 . $ <eq:initial-H>]

Here the informative experiment has posterior law uniform on the four point masses $e_i$.

#thm([Proposition 3.2.])[
  (Closure and moment saving).  #emph[The class $cal(C)$ is preserved by a channel step with $lambda
    in \[ 0 \, 1 \]$, by conditionally independent products of experiments,
    and by mixtures whose mixing label is observed and independent of the input.
    If $mu \, nu in cal(C)$ are the marginal posterior laws of two experiments,
    then their product posterior law $mu star.op nu$ satisfies
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E)_(mu star.op nu) A lt.eq  & bb(E)_mu A + bb(E)_nu A\
 & - frac(bb(E)_mu A^2 thin bb(E)_nu A + bb(E)_mu A thin bb(E)_nu A^2, 1000) . $ <eq:moment-saving>]

 In particular, when $bb(E)_mu A = bb(E)_nu A = b$, the subtracted term is at least $2 b^3 \/ 1000$.]
] <prop:cone-closure>

#proof[
  By Lemma 3, a channel step scales $x = L p$ by $lambda$ without changing the marginal law of the observation.
    Consequently (3.4) gives
  $ bb(E) H \( lambda x \) gt.eq lambda^3 bb(E) H \( x \) gt.eq 0 . $
  The resulting law remains symmetric.
  For a product, Lemma 2 expresses its posterior expectations as $bb(E)_(mu ⊗ nu) \[ z phi.alt \( P \) \]$.
    The expectation here is over independent marginal posterior laws, before multiplication by the density $z$.
    Since $nu$ is symmetric, it is unchanged by permuting its four coordinates.
    We may therefore replace $z phi.alt \( P \)$ by its permutation average whenever $phi.alt$ is $A$ or $H$.
    Integrating (3.5) and using independence gives
  $ bb(E)_(mu star.op nu) H gt.eq bb(E)_mu H thin bb(E)_nu G + bb(E)_mu G thin bb(E)_nu H gt.eq 0 . $
  Here $G gt.eq 0$ pointwise, whereas the two expectations of $H$ are nonnegative by membership in $cal(C)$.
    Symmetry is preserved by Lemma 2.
  Similarly, integration of (3.5) yields
  $ bb(E)_(mu star.op nu) A lt.eq bb(E)_mu A + bb(E)_nu A - bb(E)_mu H thin bb(E)_nu F -
    bb(E)_mu F thin bb(E)_nu H - bb(E)_(mu ⊗ nu) D_0 \( p \, q \) . $
  The two terms involving $F$ can be discarded because $F gt.eq 0$ and $mu \, nu in cal(C)$.
    Expanding (3.3) gives (3.8). Since $A gt.eq 0$, Jensen’s inequality gives $bb(E)_mu A^2
    gt.eq \( bb(E)_mu A \)^2$ and the analogous bound for $nu$, which proves the last assertion.
  Finally, conditioning on an observed mixing label independent of the input leaves the uniform prior unchanged.
    The posterior law of the mixed experiment is the corresponding mixture of posterior laws.
    Symmetry and (3.6) are both preserved by this mixture. ◻
]

== 4 Decay on the tree <sec:tree-decay>

We now apply Proposition 5 to the observations in successive generations.
  The saving from just two branches will suffice; the remaining branches need only satisfy subadditivity.

For the calculation, supply an ordering of the children at every vertex.
  In the Galton–Watson model, one may construct this ordered tree by giving each vertex an independent offspring
  count and numbering its children from $1$ to that count. Erasing the numbering gives the unlabelled tree in the
  theorem. Write $hat(T)$ for the ordered tree and $hat(T)_(lt.eq n)$ for its truncation at depth $n$. Define

$ Y_n = #scale(x: 120%, y: 120%)[\(] hat(T)_(lt.eq n) \, \( sigma_v \)_(v in L_n) #scale(x: 120%, y: 120%)[\)] \,
  wide p_i^(\( n \)) = Pr \( sigma_rho = i divides Y_n \) . $

Every finite-depth truncation is finite almost surely. Let $mu_n$ be the law of $p^(\( n \))$, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ m_n = integral_(Delta_4) A \( p \) thin upright(d) mu_n \( p \) . $ <eq:tree-moment>]

In the random-tree case this integral averages over the tree as well as the spins, without conditioning on survival.

There are two information comparisons to check. First, conditional on $hat(T)_(lt.eq n)$,
  the part of $hat(T)$ below depth $n$ is independent of the root and all spins used in $Y_n$.
  This follows from the independence of the tree construction and the channel randomness.
  Consequently, supplying the entire ordered tree leaves the posterior unchanged:

#[#set math.equation(numbering: n => "(4.2)")
 $ Pr #scale(x: 120%, y: 120%)[\(] sigma_rho = i divides hat(T) \, \( sigma_v \)_(v in L_n)
   #scale(x: 120%, y: 120%)[\)] = p_i^(\( n \)) quad upright("almost surely") . $ <eq:whole-tree-posterior>]

Second, forgetting the ordering cannot increase expected total variation from the prior.
  Indeed, for observation sigma-fields $cal(F) subset.eq cal(G)$,
  the posterior given $cal(F)$ is the conditional expectation of the posterior given $cal(G)$;
  convexity of the total-variation norm gives the assertion.
  Combining this observation with (2.3) and Jensen’s inequality, the advantage defined in Theorem 1 satisfies

#[#set math.equation(numbering: n => "(4.3)")
 $ a_n \( d \, lambda \) lt.eq 1 / 2 bb(E) sqrt(A \( p^(\( n \)) \)) lt.eq 1 / 2 sqrt(m_n) . $ <eq:tree-tv-bound>]

It therefore remains to prove that $m_n$ tends to zero.

#thm([Proposition 4.1.])[
  (Moment recursion).  #emph[In either tree family of Theorem 1,
    the posterior law $mu_n$ is symmetric and satisfies $integral H thin upright(d) mu_n gt.eq
    0$ for every $n gt.eq 0$. Let $D$ denote the offspring count, so $D =
    d$ on the regular tree and $D$ has law $"Poisson" \( d \)$ on the Galton–Watson tree. Then
#[#set math.equation(numbering: n => "(4.4)")
 $ m_(n + 1) lt.eq d lambda^2 m_n - 2 / 1000 Pr \( D gt.eq 2 \) \( lambda^2 m_n \)^3 . $ <eq:tree-recursion>]

]
] <prop:tree-recursion>

#proof[
  At depth zero the root spin is revealed. Thus $mu_0$ assigns mass $1 \/ 4$ to each coordinate vector,
    is symmetric, and satisfies $integral H thin upright(d) mu_0 = 13 \/ 100 > 0$.
  Suppose $mu_n in cal(C)$. Conditional on $D = k$, each child contributes an experiment obtained by passing a
    depth-$n$ experiment through one broadcast edge. The branches are independent conditional on the root spin,
    and their individual posterior laws are all the pushforward $\( C_lambda \)_(*) mu_n$.
    For the Galton–Watson tree this uses the independence of the child subtrees from each other and from $D$;
    for the regular tree the subtrees are deterministic copies of the same rooted tree.
    By Lemma 3 and Proposition 5, each branch law belongs to $cal(C)$ and has mean $A$ equal to
  $ b = lambda^2 m_n . $
  Combining the branches successively by Lemma 2 and Proposition 5 preserves membership in $cal(C)$.
    If $k = 0$, the posterior is $bold(u)$ and has $H = A = 0$.
    Since $D$ is independent of the root and is observed, mixing these laws over $D$ also preserves membership in
    $cal(C)$. This proves the induction assertion for $mu_(n + 1)$.
  For $k gt.eq 2$, combine the first two branches before adding the others.
    Their individual posterior laws lie in $cal(C)$ and both have mean $A$ equal to $b$.
    The final assertion of Proposition 5 therefore bounds the mean of $A$ after their combination by $2 b -
    2 b^3 \/ 1000$. Each additional branch increases this upper bound by at most $b$,
    since the combined experiment still belongs to $cal(C)$. For $k = 0$ the mean is zero, and for $k =
    1$ it is $b$. In all cases,
  $ bb(E) #scale(x: 120%, y: 120%)[\[] A \( p^(\( n + 1 \)) \) divides D = k #scale(x: 120%, y: 120%)[\]] lt.eq
    k b - frac(2 b^3, 1000) bold(1)_({ k gt.eq 2 }) . $
  Taking expectation over $D$, whose mean is $d$, proves (4.4). ◻
]

#proof[
  If $lambda = 0$, each branch observation is independent of the root; equivalently, (4.4) gives $m_n =
    0$ for every $n gt.eq 1$. Assume henceforth that $lambda > 0$ and $d lambda^2 lt.eq 1$.
  On the regular tree, $d gt.eq 2$ and hence $Pr \( D gt.eq 2 \) = 1$. The recursion gives
  $ 0 lt.eq m_(n + 1) lt.eq m_n - frac(2 lambda^6, 1000) m_n^3 . $
  Thus $\( m_n \)$ is decreasing and has a limit $ell gt.eq 0$.
    Passing to the limit yields $ell lt.eq ell - 2 lambda^6 ell^3 \/ 1000$, so $ell = 0$.
  For Poisson offspring,
  $ Pr \( D gt.eq 2 \) = 1 - \( 1 + d \) e^(- d) > 0 wide \( d > 0 \) . $
  The same argument applies with the positive coefficient $2 lambda^6 \( 1 - \( 1 + d \) e^(- d) \) \/
    1000$ in place of $2 lambda^6 \/ 1000$. In particular, it covers $d lt.eq 1$,
    including the noiseless critical case $d = lambda = 1$, directly in the unconditioned tree law.
    No step requires an infinite tree or a nonempty observed generation:
    when $L_n$ is empty, the tree observation is independent of the root and the posterior is $bold(u)$.
  Both arguments allow $d lambda^2 = 1$; the strictly positive cubic term is what forces decay at that boundary.
    Finally, (4.3) gives $a_n \( d \, lambda \) arrow.r 0$ in each family. ◻
]

== 5 Exact polynomial certificates <sec:polynomial-certificates>

We now prove the polynomial inequalities in Proposition 4.
  The single-posterior inequalities follow from small homogeneous coefficient calculations.
  For the two-posterior inequalities, we give two sufficient tests on a product of simplices.
  Section 6 applies those tests to a finite subdivision and completes the proof.

=== 5.1 Ordered probabilities and homogeneous coefficients <ordered-probabilities-and-homogeneous-coefficients>

Let

$ cal(S) = { p in Delta_4 : p_1 gt.eq p_2 gt.eq p_3 gt.eq p_4 } \, wide S_i =
  frac(1, i + 1) sum_(v = 1)^(i + 1) e_v quad \( 0 lt.eq i lt.eq 3 \) \, $

where $e_v$ is the $v$th standard basis vector of $bb(R)^4$.
  The set $cal(S)$ is the simplex with vertices $S_0 \, S_1 \, S_2 \, S_3$.
  Indeed, on setting $p_5 = 0$, its barycentric coordinates are

#[#set math.equation(numbering: n => "(5.1)")
 $ X_i = \( i + 1 \) \( p_(i + 1) - p_(i + 2) \) \, wide p = sum_(i = 0)^3 X_i S_i \, wide sum_(i = 0)^3 X_i =
   1 . $ <eq:ordered-barycentric>]

All $X_i$ are nonnegative. Conversely, each such convex combination lies in $cal(S)$.

A permutation of the four probabilities acts on $x = L p$ by permuting its three coordinates and changing an even
  number of their signs. One way to check this is to note that, on the hyperplane $sum_v p_v = 1$, $p = bold(u) +
  L^(sans(T)) x \/ 4$. For a permutation matrix $Pi$, the induced matrix is $L Pi L^(sans(T)) \/ 4$;
  it is a signed permutation matrix whose three nonzero entries have product $1$.
  Consequently $A \, B \, C$, and hence $H \, F \, G$, are invariant.
  It is therefore enough to check the single-posterior inequalities on $cal(S)$.
  The permutation-averaged two-posterior expressions are invariant under separate permutations of $p$ and $q$:
  a permutation of $q$ reindexes the average, and a permutation of $p$ can be moved to $q$ by simultaneous
  permutation of the output coordinates. We may thus restrict both inputs to $cal(S)$.

We use ordinary monomial coefficients throughout. For $r gt.eq 0$, put

$ cal(I)_r = { I in bb(Z)_(gt.eq 0)^4 : \| I \| = r } \, wide X^I = product_(i = 0)^3 X_i^(I_i) \, wide
  W_r \( X \) = (sum_(i = 0)^3 X_i)^r . $

The coefficient of $X^I$ in $W_r$ is the multinomial coefficient $binom(r, I) = r ! \/ product_i I_i !$.
  A polynomial of degree at most $r$ can be homogenized to degree $r$ by multiplying each degree-$s$ monomial by
  $W_(r - s)$. This does not change its values when $sum_i X_i = 1$.
  If all coefficients of a homogeneous polynomial are nonnegative,
  then the polynomial is nonnegative on the simplex. No converse is required.
  The coefficients in the simplicial Bernstein basis differ from these ordinary homogeneous coefficients by
  positive multinomial factors, so their signs agree. This is the coefficient-positivity principle behind
  simplicial Bernstein bounds and their refinement by subdivision; see [7].

The calculations below use only coefficient addition and the product rule

#[#set math.equation(numbering: n => "(5.2)")
 $ \[ X^I \] \( R S \) = sum_(J + K = I) \[ X^J \] R thin \[ X^K \] S . $ <eq:coefficient-convolution>]

For two sets of variables, write $W_r \( X \, Y \) = W_r \( X \) W_r \( Y \)$.
  A bihomogeneous polynomial of bidegree $\( r \, r \)$, meaning homogeneous of degree $r$ in each set of
  variables, is stored as the matrix of its coefficients $\[ X^I Y^J \]$, with $I \, J in cal(I)_r$.
  Multiplication is convolution in both indices; multiplication by $W_s \( X \, Y \)$ raises both homogeneous
  degrees by $s$. A monomial of degree $s$ in $X$ and degree $t$ in $Y$ is homogenized to bidegree $\( r \, r \)$
  by multiplying it by $W_(r - s) \( X \) W_(r - t) \( Y \)$.

=== 5.2 The single-posterior checks <the-single-posterior-checks>

The coordinate forms on $cal(S)$ are particularly small:

#[#set math.equation(numbering: n => "(5.3)")
 $ L sum_(i = 0)^3 X_i S_i = (X_0 + X_1 + X_2 / 3 \, thin X_0 + X_2 / 3 \, thin X_0 - X_2 / 3) .
   $ <eq:ordered-coordinate-forms>]

Let $Phi_0 \, dots.h \, Phi_8$ be the polynomials $1 \, A \, B \, A^2 \, C \, A B \, A^3 \, A C \,
  B^2$ in the three coordinates, and let

$ \( e_0 \, dots.h \, e_8 \) = \( 0 \, 2 \, 3 \, 4 \, 4 \, 5 \, 6 \, 6 \, 6 \) $

be their degrees. If $R = sum_j c_j Phi_j$, its degree-$r$ homogeneous form on $cal(S)$ is

#[#set math.equation(numbering: n => "(5.4)")
 $ hat(R)_r \( X \) = sum_(j : c_j eq.not 0) c_j thin Phi_j (L sum_(i = 0)^3 X_i S_i) W_(r - e_j) \( X \) \, wide
   r gt.eq max_(c_j eq.not 0) e_j . $ <eq:scalar-homogenization>]

Together with (5.3) and (5.2), this formula specifies every coefficient in the following check.

#thm([Lemma 5.1.])[
  (Single-posterior certificate).  #emph[For every $p in Delta_4$,
$ H \( p \) gt.eq - 1 / 2 \, wide F \( p \) gt.eq 0 \, wide G \( p \) gt.eq 0 . $

 Moreover, if $x = L p$ and $0 lt.eq ell lt.eq 1$, then $H \( ell x \) gt.eq ell^3 H \( x \)$,
   where $H$ in this formula is regarded as a polynomial in the three coordinates.]
] <lem:scalar-checks>

#proof[
  Define the Euler operator on those coordinates by $cal(E) = sum_(j = 1)^3 x_j partial_(x_j)$.
    Thus $cal(E) Phi_j = e_j Phi_j$. The exact coefficient minima in Table 1 are obtained from (5.4).
    The first row adds $1 \/ 2$ to the constant coefficient of $H$;
    the last row replaces each coefficient $c_j$ of $H$ by $\( 3 - e_j \) c_j$.
    The full scalar verifier is included in Appendix 7.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Polynomial $R$
], table.cell(rowspan: 1, colspan: 1)[Degree $r$
], table.cell(rowspan: 1, colspan: 1)[Number of coefficients
], table.cell(rowspan: 1, colspan: 1)[Minimum
]),
  table.cell(rowspan: 1, colspan: 1)[$H + 1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[84
], table.cell(rowspan: 1, colspan: 1)[$19 \/ 50$
],
  table.cell(rowspan: 1, colspan: 1)[$F$
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[56
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[$G$
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[680
], table.cell(rowspan: 1, colspan: 1)[$87 \/ 1000$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 3 - cal(E) \) H$
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[84
], table.cell(rowspan: 1, colspan: 1)[$0$
],
)
]],
    caption: [Table 1: Minimum ordinary monomial coefficients of the homogeneous forms (5.4), computed exactly over $bb(Q)$. ],
  )
  Coefficient nonnegativity proves the first three assertions and $\( 3 - cal(E) \) H gt.eq 0$ on $L cal(S)$.
    Permutation invariance extends these statements to $L Delta_4$.
    For $x in L Delta_4$ and $0 < ell lt.eq 1$, the point $ell x$ also lies in $L Delta_4$,
    since it corresponds to $ell p + \( 1 - ell \) bold(u)$. Therefore
  $ frac(d, d ell) #scale(x: 120%, y: 120%)[\(] ell^(- 3) H \( ell x \) #scale(x: 120%, y: 120%)[\)] =
    ell^(- 4) \( cal(E) - 3 \) H \( ell x \) lt.eq 0 . $
  Comparing $ell$ with $1$ gives the asserted scaling inequality. At $ell = 0$ it follows from $H \( 0 \) = 0$. ◻
]

=== 5.3 The two rational inequalities <the-two-rational-inequalities>

It remains to prove the two-posterior inequalities. We express each as the nonnegativity of a rational function on
  $cal(S) times cal(S)$. For $pi in frak(S)_4$, let

$ U_v^pi = 4 p_v q_(pi \( v \)) \, wide z_pi = sum_(v = 1)^4 U_v^pi \, wide P^pi = U^pi \/ z_pi quad \( z_pi > 0 \) . $

Set

#[#set math.equation(numbering: n => "(5.5)")
 $ K_a & = 24 #scale(x: 120%, y: 120%)[\(] A \( p \) + A \( q \) - H \( p \) F \( q \) - F \( p \) H \( q \) -
   D_0 \( p \, q \) #scale(x: 120%, y: 120%)[\)] \,\
K_b & = - 24 #scale(x: 120%, y: 120%)[\(] H \( p \) G \( q \) +
  G \( p \) H \( q \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rational-K>]

The remaining data are

#[#set math.equation(numbering: n => "(5.6)")
 $ upright("row") & k & N_pi & m\
a & 1 & - sum_(j = 1)^3 \( L U^pi \)_j^2 & 3\
b & 5 & z_pi^6 H \( U^pi \/ z_pi \) & 1 \/ 2 $ <eq:rational-rows>]

In row $b$, the expression for $N_pi$ is a polynomial: each degree-$s$ term of $H$ becomes the corresponding term
  in $L U^pi$ multiplied by $z_pi^(6 - s)$. For either row define

#[#set math.equation(numbering: n => "(5.7)")
 $ cal(R) = K + sum_(pi in frak(S)_4) N_pi / z_pi^k . $ <eq:rational-target>]

In row $a$, the summand is $- z_pi A \( P^pi \)$; in row $b$, it is $z_pi H \( P^pi \)$.
  Thus $cal(R) gt.eq 0$ is exactly the corresponding inequality of Proposition 4, multiplied by $24$.

These rational functions have continuous extensions to their apparent singularities.
  All coordinates of $U^pi$ are nonnegative, so $z_pi = 0$ implies $U^pi = 0$.
  Since $P^pi in Delta_4$ whenever $z_pi > 0$, both $A \( P^pi \)$ and $H \( P^pi \)$ are bounded independently of
  $p \, q$. Hence the corresponding weighted summand tends to $0$ as $z_pi arrow.r 0$.
  We assign it that value on the boundary.

Now take any two nondegenerate subsimplices of $cal(S)$, with vertex lists $a = \( a_0 \, dots.h \, a_3 \)$ and
  $b = \( b_0 \, dots.h \, b_3 \)$, and write

$ p = sum_(i = 0)^3 X_i a_i \, wide q = sum_(j = 0)^3 Y_j b_j \, wide X_i \, Y_j gt.eq 0 \, quad sum_i X_i =
  sum_j Y_j = 1 . $

The ordinary bidegree-$\( 1 \, 1 \)$ coefficient of $U_v^pi$ at $X_i Y_j$ is $4 a_(i v) b_(j \, pi \( v \))$.
  In particular, the coefficients of $z_pi$ are nonnegative.
  Both $p$ and $q$ are strictly positive on the relative interior of their subsimplices:
  a full-dimensional simplex cannot lie in a coordinate face of $Delta_4$.
  Thus every $z_pi$ is strictly positive there. We represent $K$ homogeneously with bidegree $\( 6 \, 6 \)$ and
  $N_pi$ with bidegree $\( k + 1 \, k + 1 \)$.

The next two tests certify $cal(R) gt.eq 0$ on such a product of simplices.
  They establish lower bounds on the entire region, not just at the points used to construct the polynomials.

=== 5.4 A Taylor lower bound: Type T <a-taylor-lower-bound-type-t>

For a positive integer $k$, define

$ t_k \( z \) = sum_(i = 0)^5 binom(- k, i) \( z - 1 \)^i . $

For every $z > 0$, Taylor’s theorem gives

#[#set math.equation(numbering: n => "(5.8)")
 $ z^(- k) - t_k \( z \) = frac(k \( k + 1 \) dots.h.c \( k + 5 \), 6 !) thin xi^(- k - 6) \( z - 1 \)^6 gt.eq
   0 $ <eq:taylor-lower-bound>]

for some $xi$ between $1$ and $z$; at $z = 1$ the identity is immediate.
  The bound holds for the full positive half-line, with no restriction such as $\| z - 1 \| < 1$.

For row $a$, $A \( P \) lt.eq 3$ on $Delta_4$, because each coordinate of $L P$ lies in $\[ - 1 \, 1 \]$.
  For row $b$, Lemma 7 gives $H \( P \) gt.eq - 1 \/ 2$. Consequently, in either row,

#[#set math.equation(numbering: n => "(5.9)")
 $ N_pi + m z_pi^(k + 1) gt.eq 0 . $ <eq:taylor-nonnegative-factor>]

#thm([Lemma 5.2.])[
  (Type T certificate).  #emph[For either row of (5.6), form the polynomial
#[#set math.equation(numbering: n => "(5.10)")
 $ T = K + sum_(pi in frak(S)_4) #scale(x: 120%, y: 120%)[\(] \( N_pi + m z_pi^(k + 1) \) t_k \( z_pi \) -
   m z_pi #scale(x: 120%, y: 120%)[\)] . $ <eq:type-t-polynomial>]

 If its homogeneous coefficient matrix in bidegree $\( k + 6 \, k + 6 \)$ has no negative entries,
   then $cal(R) gt.eq 0$ on the product of simplices.]
] <lem:type-t>

#proof[
  On the relative interior, multiply (5.8) by the nonnegative factor in (5.9) and subtract $m z_pi$. This yields
  $ N_pi / z_pi^k gt.eq \( N_pi + m z_pi^(k + 1) \) t_k \( z_pi \) - m z_pi . $
  Summing gives $cal(R) gt.eq T$. The coefficient hypothesis makes $T$ nonnegative on the product simplex.
    The continuous extension of $cal(R)$ then proves the boundary cases as well. ◻
]

=== 5.5 A polynomial lower bound with a certified remainder: Type P <a-polynomial-lower-bound-with-a-certified-remainder-type-p>

The second test constructs a lower bound for each rational summand separately.
  Start with any bihomogeneous polynomial $J_pi$ of bidegree $\( 3 \, 3 \)$.
  The way it is chosen affects the strength of the test, but not its validity.
  We seek a constant $c_pi gt.eq 0$ such that

$ N_pi / z_pi^k gt.eq J_pi - c_pi $

throughout the product simplex. On the relative interior,
  clearing the positive denominator reduces this to nonnegativity of $N_pi - z_pi^k J_pi + c_pi z_pi^k$.
  To test that remainder by homogeneous coefficients, form in bidegree $\( k + 3 \, k + 3 \)$ the arrays

#[#set math.equation(numbering: n => "(5.11)")
 $ O_pi = W_2 N_pi - z_pi^k J_pi \, wide Q_pi = z_pi^k W_3 \, $ <eq:type-p-remainder>]

where the arguments $\( X \, Y \)$ of $W_2 \, W_3$ are suppressed. Every coefficient of $Q_pi$ is nonnegative.

Fix $M = 2^32$. If an entry $\( O_pi \)_(I J)$ is negative and the corresponding entry $\( Q_pi \)_(I J)$ is zero,
  the test is not applicable. Otherwise define

#[#set math.equation(numbering: n => "(5.12)")
 $ c_pi = 1 / M max ({ 0 } union {⌈frac(- M \( O_pi \)_(I J), \( Q_pi \)_(I J))⌉ : \( O_pi \)_(I J) < 0}) .
   $ <eq:remainder-correction>]

By construction, $O_pi + c_pi Q_pi$ is coefficientwise nonnegative.

#thm([Lemma 5.3.])[
  (Type P certificate).  #emph[Suppose (5.12) is defined for every $pi in frak(S)_4$. If
#[#set math.equation(numbering: n => "(5.13)")
 $ K + sum_(pi in frak(S)_4) \( J_pi - c_pi W_3 \) $ <eq:type-p-polynomial>]

 has nonnegative homogeneous coefficients in bidegree $\( 6 \, 6 \)$, then $cal(R) gt.eq
   0$ on the product of simplices.]
] <lem:type-p>

#proof[
  On the product simplex, $W_2 = W_3 = 1$. On its relative interior, (5.11) gives the exact identity
  $ N_pi / z_pi^k = J_pi - c_pi + frac(O_pi + c_pi Q_pi, z_pi^k) gt.eq J_pi - c_pi . $
  Summing and using the coefficient hypothesis proves the claim on the relative interior.
    Continuity gives the boundary cases. ◻
]

For reproducibility, we specify the polynomials $J_pi$ used in the finite check.
  For $I in cal(I)_3$, define the cardinal polynomial

$ ell_I \( X \) = product_(i = 0)^3 binom(3 X_i, I_i) \, wide binom(t, j) =
  frac(t \( t - 1 \) dots.h.c \( t - j + 1 \), j !) \, wide binom(t, 0) = 1 . $

At a lattice point $J \/ 3$, with $J in cal(I)_3$, its value is $product_i binom(J_i, I_i) =
  upright(bold(1))_({ I = J })$. Indeed, if $I eq.not J$ then some $J_i < I_i$, since $\| I \| = \| J \| = 3$.
  These $20$ cardinal polynomials therefore give interpolation of degree at most three on the three-dimensional
  simplex. In coefficient arrays we use their homogeneous degree-three forms,
  obtained by replacing each factor $3 X_i - h$ by $3 X_i - h sum_j X_j$.

Let $"trunc"_M \( t \)$ denote truncation toward zero to a multiple of $1 \/ M$.
  Evaluate the continuous rational summand $N_pi \/ z_pi^k$ at the $20^2$ node pairs $\( I \/ 3 \, J \/ 3 \)$,
  assigning zero when $z_pi = 0$, and put

#[#set math.equation(numbering: n => "(5.14)")
 $ J_pi \( X \, Y \) = sum_(I \, J in cal(I)_3) "trunc"_M #h(-0.16667em)
   (frac(N_pi \( I \/ 3 \, J \/ 3 \), z_pi \( I \/ 3 \, J \/ 3 \)^k)) ell_I \( X \) ell_J \( Y \) .
   $ <eq:interpolation-polynomial>]

The convention at vanishing denominators is understood in this formula.
  For the rational vertex lists used in Section 6, all these node values are rational.
  Their evaluation, truncation, and interpolation can therefore be performed in exact rational arithmetic.
  Lemma 9 does not estimate interpolation error or truncation error:
  it certifies the remainder of the actual rational polynomial $J_pi$ chosen by (5.14).
  Thus the verification remains exact despite the finite interpolation grid and truncation.

The single-posterior inequalities are now proved. For the two remaining inequalities,
  the proof has been reduced to finding a finite cover of $cal(S) times
  cal(S)$ by products of simplices on each of which either Lemma 8 or Lemma 9 applies.
  We carry out that finite verification next.

== 6 Finite verification <sec:finite-verification>

The certificates in Section 5 reduce the two product inequalities to signs of rational coefficient arrays.
  We now specify a finite subdivision of $cal(S) times cal(S)$ on which those signs can be checked.
  The subdivision and all coefficient operations are exact. The complete verifier is printed in Appendix 7.

=== 6.1 Subdivision and coverage <subdivision-and-coverage>

A cell is specified by two affinely independent lists of four rational vertices
  $a = \( a_0 \, a_1 \, a_2 \, a_3 \)$ and $b = \( b_0 \, b_1 \, b_2 \, b_3 \)$ in $cal(S)$;
  its domain is $"conv" \( a \) times "conv" \( b \)$. Initially both lists are $\( S_0 \, S_1 \, S_2 \, S_3 \)$.
  On a cell we substitute

$ p = sum_(i = 0)^3 X_i a_i \, wide q = sum_(j = 0)^3 Y_j b_j \, wide X \, Y in Delta_4 \, $

into the arrays of Section 5.

#thm([Lemma 6.1.])[
  (Midpoint subdivision).  #emph[Let $epsilon_0 \, dots.h \,
    epsilon_3$ be the unit vectors in the barycentric coordinate space.
    Replace vertex $a_i$ by $\( a_i + a_j \) \/ 2$, where $i eq.not j$, leaving the other vertices unchanged.
    For an ordinary homogeneous coefficient indexed by $I in cal(I)_r$,
    its contributions to the new coefficients are indexed by
#[#set math.equation(numbering: n => "(6.1)")
 $ I + t epsilon_i - t epsilon_j \, wide 0 lt.eq t lt.eq I_j \, wide upright("with multiplier") quad
   2^(- I_i - t) binom(I_j, t) . $ <eq:midpoint-substitution>]

 The same formula holds in the $Y$ index when a vertex of $b$ is replaced.
   The two cells obtained by replacing vertex $i$, respectively vertex $j$, by their midpoint cover the original cell.]
] <lem:subdivision>

#proof[
  Write $X'$ for the new barycentric coordinates. The old coordinates satisfy $X_i = X'_i \/ 2$, $X_j = X'_j +
    X'_i \/ 2$, with the others unchanged. Expanding $X_i^(I_i) X_j^(I_j)$ gives (6.1).
    The first child contains precisely the barycentric points with $X_i lt.eq X_j$:
    one can take $X'_i = 2 X_i$ and $X'_j = X_j - X_i$. The second child contains the points with $X_j lt.eq X_i$.
    These two inequalities exhaust the original simplex. Each replacement preserves affine independence,
    since its barycentric change of coordinates has nonzero determinant. ◻
]

Here is the entire decision rule for one row of (5.6). Start at depth zero. At each cell:

+ Try the Type T coefficient test of Lemma 8. Accept the cell if every coefficient is nonnegative.
+ If neither vertex list contains $bold(u)$, try the Type P test of Lemma 9, with $M = 2^32$.
  If the correction (5.12) is undefined, report failure immediately.
  Otherwise accept the cell if its coefficient test succeeds.
+ If neither test has accepted the cell and its depth is 24, report failure. Otherwise select an edge as follows.
  For $y in { 0 \, 1 }$, put $c = a$ when $y = 0$ and $c = b$ when $y = 1$.
  Among all $i > j$, maximize lexicographically the tuple
  $ \( w \, y \, i \, j \) \, wide w = parallel c_i - c_j parallel_2^2
    cases(delim: "{", 16 \, & c_i = bold(u) upright(" or ") c_j = bold(u) \,, 1 \, & upright("otherwise") .) $
  Replace vertex $j$ by the midpoint and recursively check that child;
    then replace vertex $i$ by the midpoint and check the other child.
    Both children have depth one greater than their parent.

Skipping Type P on cells having a uniform vertex is part of this specified rule;
  no claim about the success or failure of that test on such cells is needed.
  Lemma 10 shows that successful termination proves the required sign on the entire initial domain.

=== 6.2 The completed verification <the-completed-verification>

The verifier represents every coefficient matrix by integer numerators and a common positive denominator,
  using arbitrary-precision integers for both. Its polynomial arithmetic consists of convolution,
  degree elevation, rational addition, and the exact substitutions of Lemma 10.
  The fixed-width quantities used for indices, counters, vertices,
  and small combinatorial factors remain within their integer ranges.
  Appendix 7 proves these bounds and identifies the implementation routines with the mathematical certificates.
  Thus a successful run verifies exact coefficient signs, without a numerical tolerance.

#thm([Proposition 6.2.])[
  (Finite sign verification).  #emph[For each row of (5.6), the decision rule above terminates without failure,
    with the counts in Table 2. Every terminal cell is accepted by Type T or Type P.
    Consequently both rational expressions (5.7) are nonnegative on $cal(S) times cal(S)$.]
] <prop:finite-verification>

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Row
], table.cell(rowspan: 1, colspan: 1)[Cells visited
], table.cell(rowspan: 1, colspan: 1)[Maximum depth
], table.cell(rowspan: 1, colspan: 1)[Type T leaves
], table.cell(rowspan: 1, colspan: 1)[Type P leaves
], table.cell(rowspan: 1, colspan: 1)[Unresolved
]),
  table.cell(rowspan: 1, colspan: 1)[(a)
], table.cell(rowspan: 1, colspan: 1)[4479
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[166
], table.cell(rowspan: 1, colspan: 1)[2074
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[(b)
], table.cell(rowspan: 1, colspan: 1)[1935
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[97
], table.cell(rowspan: 1, colspan: 1)[871
], table.cell(rowspan: 1, colspan: 1)[0
],
)
]],
  caption: [Table 2: Exact subdivision counts. The initial cell has depth zero; visited cells include both internal nodes and terminal cells. ],
)

#proof[
  Run the integer verifier in Appendix 7, once in each mode, with assertions enabled. It returns the two lines
  #raw(block: true, lang: "", "done 4479 19 lp=2074 lt=166\ndone 1935 20 lp=871 lt=97")
  Here #raw("lp") and #raw("lt") count the terminal cells accepted by Types P and T.
    The substitutions are those of Lemma 10, and Appendix 7.1 verifies their exact implementation and the
    coefficient arithmetic. Lemmas 8 and 9 certify the sign on each accepted cell, and Lemma 10 proves coverage.
    The continuous extension at zero denominators established in Section 5 includes the cell boundaries. ◻
]

For reproduction, the paper directory contains and , printed in full in Appendix 7.
  The first requires a C++17 compiler with GCC-compatible standard-library headers and the Boost multiprecision
  headers; the second uses only the Python 3 standard library. For example, from the paper’s directory run

#raw(block: true, lang: "", "mkdir -p artifacts\ng++ -std=c++17 -O3 -UNDEBUG checks/certificate.cpp \\\n    -o artifacts/certificate\n./artifacts/certificate\n./artifacts/certificate b\npython3 checks/small_polynomials.py")

The C++ program writes progress and its final result to standard error.
  Its no-argument mode checks row (a); any argument selects row (b).
  The Python program independently computes the four scalar coefficient minima of Lemma 7,
  using rational convolution, and checks all 24 coordinate actions.
  Assertions must remain enabled in both programs: do not define #raw("NDEBUG") or run Python with #raw("-O").
  Together with the scalar checks, Proposition 11 completes the proof of Proposition 4.

#heading(level: 1)[References]
#bibitem([1])[N.~Bhatnagar and E.~Maneva, #emph[A computational method for bounding the probability of
  reconstruction on trees], SIAM J. Discrete Math. #strong[25] (2011), no.~2, 854--871.
  #link("https://doi.org/10.1137/090751244")[doi:10.1137/090751244].]
#bibitem([2])[P.~M.~Bleher, J.~Ruiz, and V.~A.~Zagrebnov,
  #emph[On the purity of the limiting Gibbs state for the Ising model on the Bethe lattice], J. Stat. Phys.
  #strong[79] (1995), nos.~1--2, 473--482. #link("https://doi.org/10.1007/BF02179399")[doi:10.1007/BF02179399].]
#bibitem([3])[W.~Evans, C.~Kenyon, Y.~Peres, and L.~J.~Schulman, #emph[Broadcasting on trees and the Ising model],
  Ann. Appl. Probab. #strong[10] (2000), no.~2, 410--433.
  #link("https://doi.org/10.1214/aoap/1019487349")[doi:10.1214/aoap/1019487349].]
#bibitem([4])[M.~Formentin and C.~Külske, #emph[A symmetric entropy bound on the non-reconstruction regime of
  Markov chains on Galton--Watson trees], Electron. Commun. Probab. #strong[14] (2009), 587--596.
  #link("https://doi.org/10.1214/ECP.v14-1516")[doi:10.1214/ECP.v14-1516].]
#bibitem([5])[Y.~Gu, #emph[Exact reconstruction thresholds on hypertrees over a symmetric binary alphabet],
  preprint (2026). #link("https://arxiv.org/abs/2606.21699")[arXiv:2606.21699].]
#bibitem([6])[H.~Kesten and B.~P.~Stigum, #emph[Additional limit theorems for indecomposable multidimensional
  Galton--Watson processes], Ann. Math. Statist. #strong[37] (1966), no.~6, 1463--1481.
  #link("https://doi.org/10.1214/aoms/1177699139")[doi:10.1214/aoms/1177699139].]
#bibitem([7])[R.~Leroy, #emph[Convergence under subdivision and complexity of polynomial minimization in the
  simplicial Bernstein basis], Reliable Computing #strong[17] (2012), 11--21.]
#bibitem([8])[R.~Lyons, #emph[Random walks and percolation on trees], Ann. Probab.
  #strong[18] (1990), no.~3, 931--958. #link("https://doi.org/10.1214/aop/1176990730")[doi:10.1214/aop/1176990730].]
#bibitem([9])[M.~Mézard and A.~Montanari, #emph[Reconstruction on trees and spin glass transition], J. Stat. Phys.
  #strong[124] (2006), no.~6, 1317--1350.
  #link("https://doi.org/10.1007/s10955-006-9162-3")[doi:10.1007/s10955-006-9162-3].]
#bibitem([10])[E.~Mossel, #emph[Reconstruction on trees: Beating the second eigenvalue], Ann. Appl. Probab.
  #strong[11] (2001), no.~1, 285--300. #link("https://doi.org/10.1214/aoap/998926994")[doi:10.1214/aoap/998926994].]
#bibitem([11])[E.~Mossel and Y.~Peres, #emph[Information flow on trees], Ann. Appl. Probab.
  #strong[13] (2003), no.~3, 817--844. #link("https://doi.org/10.1214/aoap/1060202828")[doi:10.1214/aoap/1060202828].]
#bibitem([12])[E.~Mossel, A.~Sly, and Y.~Sohn, #emph[Exact phase transitions for stochastic block models and
  reconstruction on trees], Ann. Probab. #strong[53] (2025), no.~3, 967--1018.
  #link("https://doi.org/10.1214/24-AOP1723")[doi:10.1214/24-AOP1723]. Author preprint:
  #link("https://arxiv.org/abs/2212.03362")[arXiv:2212.03362].]
#bibitem([13])[F.~Ricci-Tersenghi, G.~Semerjian, and L.~Zdeborová,
  #emph[Typology of phase transitions in Bayesian inference problems], Phys. Rev.
  E #strong[99] (2019), no.~4, 042109.
  #link("https://doi.org/10.1103/PhysRevE.99.042109")[doi:10.1103/PhysRevE.99.042109].]
#bibitem([14])[A.~Sly, #emph[Reconstruction for the Potts model], Ann. Probab.
  #strong[39] (2011), no.~4, 1365--1406. #link("https://doi.org/10.1214/10-AOP584")[doi:10.1214/10-AOP584].]

== 7 Exact implementation and complete verifiers <app:verifiers>

This appendix identifies the array operations with the certificates of Section 5 and bounds the auxiliary
  fixed-width arithmetic. The complete source listings follow these implementation details.
  The command lines and expected C++ output are given in Section 6.

=== 7.1 Exact coefficient arithmetic <app:implementation>

The C++ type #raw("P") represents a rational coefficient matrix of bidegree $\( r \, r \)$ by an integer array and
  a common positive denominator. Its entries are indexed by $cal(I)_r$ in descending lexicographic order.
  Integer numerators and denominators use #raw("boost::multiprecision::cpp_int").
  The routine #raw("ones(r)") constructs $W_r$; multiplication is ordinary coefficient convolution,
  and #raw("lift") raises both degrees by multiplying by $W_1$.
  Addition first lifts to a common degree and then uses a common denominator.
  Thus signs are tested on integer numerators, without a floating-point tolerance.

We explain the correspondence between the remaining routines and the mathematical certificates;
  this also fixes the normalizations in the listing. Initially the coordinates of every vertex are stored as
  integers at scale

#[#set math.equation(numbering: n => "(7.1)")
 $ kappa = 12 dot.op 2^24 . $ <eq:vertex-scale>]

Removing the factor $2^24$ leaves the denominator 12 for the individual coordinates.
  The coefficients of $U_v$ are $4 \( a_i \)_v \( b_j \)_(pi \( v \))$;
  their initialization removes $2^48$ and uses denominator 144.
  The routine #raw("inv") forms the nine invariant polynomials in their stated order.
  The routine #raw("dot") forms a linear combination divided by 1000 and homogenizes lower-degree terms with its
  third argument. With that argument equal to the homogeneous one it gives $H \( p \)$, $F \( p \)$,
  or $G \( p \)$; with that argument equal to $z$ it gives $z^6 H \( U \/ z \)$.

There is one useful economy in constructing $K$. A polynomial depending only on $X$ is nevertheless stored with
  both degrees equal, so it has the form $f \( X \) \( sum_j Y_j \)^r$.
  Its column indexed by $\( r \, 0 \, 0 \, 0 \)$ contains exactly the coefficients of $f$.
  Taking this column and the analogous row of a polynomial depending only on $Y$ gives the outer product used by
  #raw("tensor"). The factor 24 in #raw("make") then gives exactly the $K$ of (5.5).
  The array #raw("t") is the Type T polynomial; it is constructed once and thereafter restricted by midpoint
  substitution. The arrays #raw("N") and #raw("D") store $N_pi$ and $z_pi$, respectively,
  for the 24 permutations in lexicographic order.

The Type P interpolation uses ordinary matrix multiplication.
  The matrix #raw("ev(r,3)") has entries $I^J$, where $I in cal(I)_3$ indexes a node and $J in
  cal(I)_r$ indexes a monomial. Consequently the two-sided evaluation #raw("act") must be divided by $3^(2 r)$.
  The listing includes this factor explicitly, using 9 when $r = 1$.
  The routine #raw("inverse") constructs, rather than numerically inverts, the cardinal polynomials in (5.14).
  It expands their homogeneous linear factors $3 X_h - m sum_i X_i$, stores their coefficients multiplied by 960,
  and divides by the factorial denominators. Two-sided interpolation therefore requires division by $960^2$.

After the node values of $N_pi \/ z_pi^k$ have been truncated toward zero in multiples of $M^(- 1)$,
  #raw("testP") constructs the interpolant $J_pi$. Its subtraction #raw("o=b-o") implicitly lifts $N_pi$ by $W_2$,
  and hence constructs precisely $O_pi = W_2 N_pi - z_pi^k J_pi$. The array #raw("w") is $Q_pi = z_pi^k W_3$.
  For each negative coefficient of $O_pi$, the program asserts that the corresponding coefficient of $Q_pi$ is
  positive. A violation aborts the verification rather than merely rejecting that cell;
  no such violation occurs in the completed runs. It then computes the integer ceiling in (5.12),
  by positive integer division, and retains the largest value.
  The final test is exactly the coefficient test of Lemma 9.

Finally, #raw("sub") implements (6.1) with $2^r$ cleared. Its integer multiplier is

#[#set math.equation(numbering: n => "(7.2)")
 $ C_t = 2^(r - I_i - t) binom(I_j, t) \, wide C_(t + 1) =
   frac(C_t \( I_j - t \), 2 \( t + 1 \)) . $ <eq:cleared-substitution>]

Here $r - I_i - t gt.eq 0$ for every used term, so the indicated division is exact.
  The resulting matrix denominator is multiplied by $2^r$.

=== 7.2 Bounds for fixed-width arithmetic <bounds-for-fixed-width-arithmetic>

Only indices, counters, vertex coordinates, and small combinatorial factors use fixed-width integer types.
  Take #raw("int") to have at least 32 bits and #raw("long long") to have at least 64 bits.
  The following bounds cover every such operation in the listing.

All polynomial matrices in the C++ verifier have bidegree at most 11.
  Thus there are at most $binom(14, 3) = 364$ indices in one dimension and $132 thin 496$ entries in a matrix.
  The depth limit 24 allows at most $2^25 - 1$ visited cells,
  so the counters for visited cells and terminal cells also fit a 32-bit signed integer.
  The largest factorial initialized is $19 ! = 121 thin 645 thin 100 thin 408 thin 832 thin 000 < 2^63$,
  and products of factorials appearing in a multinomial denominator do not exceed this bound.
  The largest multinomial coefficient through degree 11 is $92 thin 400$,
  whose square is $8 thin 537 thin 760 thin 000 < 2^63$.

Each scaled vertex coordinate belongs to $\[ 0 \, kappa \]$.
  Initial products are bounded by $4 kappa^2$, and even the conservative bound

$ 64 kappa^2 = 2 thin 594 thin 073 thin 385 thin 365 thin 405 thin 696 < 2^63 $

covers the weighted squared edge distances. The initial coordinates are multiples of $2^24$,
  so all midpoint coordinates are integers through depth 24.
  A point of $cal(S)$ has fourth coordinate at most $1 \/ 4$, with equality only at $bold(u)$.
  Thus the test that a stored fourth coordinate is $kappa \/ 4$ detects a uniform vertex exactly.

The multipliers in (7.2), including the intermediate numerator of the recurrence,
  are bounded by $11 dot.op 2^11 binom(11, 5) < 2^24$. The evaluation matrices contain integers at most $3^6$,
  and the cardinal-polynomial construction uses only three linear factors starting from 960.
  Even bounding the sum of absolute coefficients at each multiplication by a factor 8 gives $960 dot.op 8^3 <
  2^19$. All products with polynomial coefficients are already operations on unlimited integers.
  These bounds exclude fixed-width overflow; in particular,
  the exact sign tests do not rely on floating-point arithmetic or machine rounding.

=== 7.3 Rational sign certificates <rational-sign-certificates>

#raw(block: true, lang: "C++", "")

=== 7.4 Scalar coefficients and symmetry <scalar-coefficients-and-symmetry>

#raw(block: true, lang: "Python", "")
