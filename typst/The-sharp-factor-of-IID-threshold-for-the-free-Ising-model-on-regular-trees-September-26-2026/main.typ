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

#align(center)[#text(size: 16pt, weight: "bold")[The sharp factor-of-IID threshold \
for the free Ising model on regular trees]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Can the free Ising state on a regular tree be generated from independent vertex labels without choosing a root?
  The broadcast description of the state begins at a vertex and propagates a random spin along the edges.
  Its law does not depend on that vertex. A factor construction must also remove the distinguished vertex from the
  rule that generates the spins.

Let $T_d = \( cal(V) \, cal(E) \)$ be the infinite $d$-regular tree, $d gt.eq 3$, and put $b = d - 1$ and $theta =
  tanh beta$ for $beta gt.eq 0$. The free zero-field Ising law $mu_(d \, beta)$ is obtained by choosing a fair
  spin at one vertex and, independently along edges directed away from it,
  letting a child agree with its parent with probability $\( 1 + theta \) \/ 2$.
  Its marginal on any finite connected subtree $D$ is

$ mu_(d \, beta) \( sigma \|_D = eta \) = 1 / 2 product_({ u \, v } in cal(E) \( D \))
  frac(1 + theta eta_u eta_v, 2) . $

This expression also verifies that the law is invariant under all tree automorphisms and independent of the chosen
  broadcast root.

We call a spin law a #emph[factor of IID] if it is the law of $Phi \( U \)$ for independent uniform labels
  $\( U_v \)_(v in cal(V))$ and a measurable map $Phi : \[ 0 \, 1 \]^(cal(V)) arrow.r { - 1 \, 1 }^(cal(V))$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ Phi \( g U \) = g Phi \( U \) quad upright("almost surely for each fixed ") g in "Aut" \( T_d \) \,
   wide \( g x \)_v = x_(g^(- 1) v) . $ <eq:equivariance>]

The exceptional null set may depend on $g$. For spin laws this convention is equivalent to requiring a Borel
  factor equivariant on every input: Lemma 25 constructs such a version.
  The input contains no distinguished root or end. Measurability does not require a spin to be determined by
  finitely many labels; no finitary coding or coding-radius estimate is asserted.

#thm([Theorem 1.1.])[
  #emph[ For every integer $d gt.eq 3$ and every $beta gt.eq 0$,
    the free zero-field Ising law $mu_(d \, beta)$ is a factor of IID in the sense of (1.1) if and only if
$ tanh beta lt.eq \( d - 1 \)^(- 1 \/ 2) . $

 In this range the factor can be chosen to commute with every automorphism on every label input.]
] <thm:main>

The construction proves the positive implication, including equality. The strict converse is known:
  the obstruction beyond the reconstruction threshold is due to Sly,
  as recorded and proved in Lyons #cite(label("Lyons")) Section 3 and Corollary 3.2.
  We use the quantitative correlation bound of Backhausz, Szegedy and Virág #cite(label("BSV")) Theorem 3.1 in
  arXiv:1305.6784v1 to give that implication below. The map is obtained for each fixed $d$ and $beta$ in the
  permitted range; no parameter-uniform or computational bound is asserted.

For the free state on $T_d$, reconstruction from distant levels is possible exactly when $b theta^2 > 1$;
  equivalently, the free Gibbs state is extremal exactly when $b theta^2 lt.eq 1$.
  For the regular-tree result, including equality, see the Bethe-lattice work of Bleher, Ruiz,
  and Zagrebnov #cite(label("BleherRuizZagrebnov1995")) and Ioffe #cite(label("Ioffe1996Bethe")).
  Ioffe #cite(label("Ioffe1996GeneralTrees")) and Evans, Kenyon, Peres,
  and Schulman #cite(label("EvansKenyonPeresSchulman2000")) developed branching-number criteria on general trees
  away from equality. Pemantle and Peres #cite(label("PemantlePeres")) Theorem 2.1 later gave an
  electrical-capacity criterion for free-state extremality for couplings bounded above and away from zero,
  which also covers critical cases.

Reconstruction asks whether distant spins retain information about a fixed spin.
  The factor question asks for a rule that generates the entire law from independent labels.
  Nonreconstruction supplies no such rule, and a weak limit of factor laws need not itself be a factor
  #cite(label("Lyons")) Corollary 3.3. Thus equality requires a construction that retains measurable dependence on
  its independent input.

In the uniqueness range $theta lt.eq b^(- 1)$, including equality, a finite-cluster construction gives the factor;
  see Lyons #cite(label("Lyons")) Section 3. Nam, Sly and Zhang #cite(label("NSZ")) Theorem 1 and Section 2.2 in
  arXiv:2012.09484v2 used posterior-drift stochastic differential equations driven by IID Brownian motions to
  construct the free Ising law as a factor for $d gt.eq d_0$ and $theta lt.eq c \/ sqrt(d - 1)$,
  for unspecified absolute constants $c \, d_0 > 0$. Their construction takes root-independent limits of
  finite-volume solutions. Theorem 1 proves their conjecture for every $d gt.eq 3$,
  including equality and their pointwise convention for equivariance.

===== 1.1 The known converse. <the-known-converse.>

For a centered variance-one real vertex factor, the BSV bound is

$ \| bb(E) \[ Z_o Z_v \] \| lt.eq (1 + frac(d - 2, d) n) b^(- n \/ 2) \, wide "dist" \( o \, v \) = n . $

It applies also under (1.1). To check this, condition the observable at $o$ on the labels in its radius-$R$ ball
  and average a Borel version over the finite automorphism group of that rooted ball.
  Every such permutation extends to a tree automorphism fixing $o$,
  so uniqueness of conditional expectation leaves this average unchanged almost surely.
  It now defines an exactly invariant local rule. Apply the same rule at every vertex.
  These local factors converge in $L^2$ at each vertex to the original factor,
  because the balls exhaust the label coordinates. For all sufficiently large $R$ their variances are positive.
  Center and normalize them, apply BSV, and pass to the limit in variances and covariances on this same IID
  probability space. Since the Ising spins have mean zero, variance one and correlation $theta^n$,
  the bound would require $\( theta sqrt(b) \)^n lt.eq 1 + \( d - 2 \) n \/ d$.
  This is impossible when $theta > b^(- 1 \/ 2)$.

=== 1.1 Why independent innovations determine the spins <why-independent-innovations-determine-the-spins>

We follow the observation framework of Nam–Sly–Zhang. On an auxiliary probability space,
  sample the desired spin configuration $sigma$ and independent standard Brownian motions $B_v$, and observe

$ X_v \( t \) = t sigma_v + B_v \( t \) \, wide m_v \( t \) =
  bb(E) \[ sigma_v divides X_u \( s \) : u in cal(V) \, med 0 lt.eq s lt.eq t \] . $

The finite-dimensional posterior evolution also belongs to stochastic localization.
  Eldan #cite(label("Eldan2013")) developed the underlying localization scheme,
  and El Alaoui and Montanari #cite(label("ElAlaouiMontanari2022")) Section 3,
  Theorem 2 give the fixed-covariance Gaussian-observation formulation used here.
  Subtracting the conditional drift gives

$ W_v \( t \) = X_v \( t \) - integral_0^t m_v \( s \) thin d s . $

These innovations are independent Brownian motions in the observation filtration.
  This property alone does not make $X$ a function of $W$: the original construction still used the spins.
  Classical innovations theory separates the Brownian property from generation of the observation
  filtration #cite(label("FujisakiKallianpurKunita1972")) Lemma 2.2 and Remark 2.2.
  Proving that the innovations determine $X$ is the central step here.

A companion construction for the free uniform spanning forest uses a uniform Lipschitz response bound in the
  coordinate supremum norm to invert the innovations causally for every continuous input
  #cite(label("OpenAIFUSF2026")) Section 4. Here recovery instead follows from equality of conditional copies
  under the observation law.

Take two observations $X \, X'$ independently conditional on the entire innovation array $W$.
  They have the same marginal law and share the same innovations.
  Conditioning on the full paths could in principle expose their future increments through an observation past.
  We prove that it does not: the conditional law of either observation past given all of $W$ depends only on the
  past of $W$. Hence $W$ remains Brownian in the joined filtration,
  and the equations for both observations use the same driving Brownian motions.
  This is the compatibility principle for conditional copies #cite(label("Kurtz2014")) Lemmas 2.11–2.12 in
  arXiv:1305.6747v2; we prove the required statement and the transport of the stochastic integrals directly.

We then show that these particular copies agree. For each coordinate, conditional independence gives

$ bb(E) \[ \( X_v \( t \) - X'_v \( t \) \)^2 divides W \] = 2 "Var" \( X_v \( t \) divides W \) . $

Equality therefore forces the conditional law of $X$ given $W$ to be a point mass. Finally

$ frac(X_v \( n \), n) arrow.r sigma_v quad upright("almost surely") $

recovers the spins from $W$. A common measurable sampler converts one uniform label at each vertex into its
  Brownian path. This gives a spin factor satisfying (1.1);
  finite-ball averaging then selects an everywhere equivariant version with the same law.

=== 1.2 What changes at the critical point <what-changes-at-the-critical-point>

The tree gives a concrete equation for comparing the copies. Set $h_v = "atanh" m_v$.
  If $T_(j arrow.r i)$ is the component containing $j$ after deleting $i j$, define its field by

$ h_(j arrow.r i) \( t \) =
  "atanh" bb(E) \[ sigma_j divides X_u \( s \) : u in T_(j arrow.r i) \, med 0 lt.eq s lt.eq t \] \, $

using the unconditional prior on that component. For a path $v = v_0 \, dots.h \, v_r = u$,
  the field-response coefficient is

$ c_(v u) = theta^r product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \) \, wide a \( z \) =
  frac(1 - tanh^2 z, 1 - theta^2 tanh^2 z) \, wide c_(v v) = 1 . $

The innovation equation is

$ d h_v = sum_u c_(v u) thin d W_u + m_v A_v thin d t \, wide A_v = sum_u c_(v u)^2 . $

Its infinite sum requires proof. At criticality we obtain $bb(E) A_v \( t \) lt.eq
  C \/ min \( sqrt(t) \, 1 \)$ for $t > 0$, so the row is integrable down to time zero.
  An exact covariance-energy identity and a testing argument establish the equation without a residual martingale.

For the conditional copies, let $V \( t \) = bb(E) \[ \( h_o \( t \) - h'_o \( t \) \)^2 \]$;
  invariance makes the choice of $o$ irrelevant. It starts at zero.
  Below the threshold, the squared factor $theta^(2 r)$ and the shell size $d
  b^(r - 1)$ give a summable geometric series, yielding $V' lt.eq C V$ and thus equality of the copies.
  At $b theta^2 = 1$ those two factors cancel exactly.

Three estimates replace the lost geometric decay. First, an intact side branch attenuates a path product on the
  length scale $t^(- 1 \/ 2)$ at small times. Second, spatial cancellation bounds the variance of a sum of
  differences between the two copies’ $log a \( h_(j arrow.r i) \)$ factors by the path length times the variance
  at one edge. The spectral bound is proved for differences $f \( X \) - f \( X' \)$,
  with the same square-integrable equivariant vertex observable $f$ applied to each copy,
  and their closed linear span. No spectral bound for every function of the pair is assumed.
  The operator argument is related to the correlation methods of Backhausz–Szegedy–Virág #cite(label("BSV")) and
  Backhausz–Gerencsér–Harangi–Vizer #cite(label("BGHV")). Third,
  concentration of path averages makes the attenuation usable with discrepancy weights that depend on the same
  observations. Both path orientations are needed in this averaging argument.

These estimates leave one small-time difficulty: the leading noise term is of order $S \( t \) \/ t$, where

$ S \( t \) = bb(E) #scale(x: 180%, y: 180%)[\[] #scale(x: 120%, y: 120%)[\(] log
  a \( h_(j arrow.r i) \( t \) \) - log a \( h'_(j arrow.r i) \( t \) \) #scale(x: 120%, y: 120%)[\)]^2
  #scale(x: 180%, y: 180%)[\]] . $

The elementary bound $S lt.eq C V$ would leave a nonintegrable coefficient.
  We prove instead a small-field tail estimate and use the vanishing derivative of $log
  a$ at zero to improve that comparison. The complete noise and drift calculation then gives an integrable
  Osgood-type inequality for $V$, forcing $V = 0$. The moment estimate is proved beside this final comparison,
  where its purpose becomes explicit.

===== 1.2.1 Notation and organization. <notation-and-organization.>

The case $theta = 0$ is already IID, so the proof below assumes $0 < theta lt.eq b^(- 1 \/ 2)$.
  Constants $c \, C > 0$ may depend on the fixed $d \, theta$ and may change between occurrences;
  a subscript $T$ permits additional dependence on a fixed finite time horizon.
  Every path is simple unless specified otherwise, and all logarithms are natural.
  Roots used to describe subtrees or compute norms are auxiliary choices in the proof, not inputs to the factor.

Sections 2–4 develop the posterior identities, critical information bounds, and infinite innovation equation.
  Section 5 constructs the conditional copies and proves their equality below the threshold.
  Sections 6 and 7 establish spatial cancellation and concentration of path averages.
  Section 8 proves the small-field tail estimate, completes the critical comparison,
  and recovers the factor from the innovations.

== 2 Posterior fields along the tree <sec:observations>

The observation construction reduces the factor problem to a question about conditional spin laws.
  We first describe those laws on a finite subtree, where the Gaussian likelihood is explicit.
  The tree structure then expresses each covariance as a product along the connecting path.
  Passing these formulas to the whole tree will identify the response coefficients whose squared rows must be
  integrable in time.

For the affirmative implication, write $b = d - 1$ and assume $0 < theta = tanh beta lt.eq b^(- 1 \/ 2)$;
  the case $theta = 0$ is already IID. On an auxiliary probability space sample the free Ising configuration
  $sigma$, and independently sample standard Brownian motions $\( B_v \)_(v in cal(V))$,
  independent across vertices. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ X_v \( t \) = t sigma_v + B_v \( t \) \, wide cal(F)_t^0 = sigma { X_v \( s \) : v in cal(V) \, med 0 lt.eq
   s lt.eq t } . $ <eq:observations>]

The $B_v$’s are the noise used to plant these observations.
  The innovations $W_v$, obtained later by subtracting the conditional drift from $X_v$, are different processes.
  In this section $cal(F)_t^0$ is the raw observation filtration;
  we reserve $cal(F)_t$ for its usual augmentation. For any $D subset.eq cal(V)$, write

$ cal(F)_t^D = sigma { X_u \( s \) : u in D \, med 0 lt.eq s lt.eq t } . $

The Gaussian observation framework follows Nam–Sly–Zhang #cite(label("NSZ")).
  In finite volume it is the observation form of stochastic localization described by El Alaoui–Montanari
  #cite(label("ElAlaouiMontanari2022")) Section 3. We derive the finite posterior directly,
  since its derivative and its tree factorization will both be needed.

=== 2.1 The finite posterior and its branch messages <the-finite-posterior-and-its-branch-messages>

Let $D$ be a finite connected subtree. Its broadcast marginal is

$ bb(P) \( sigma_D = eta \) = 2^(- \| D \|) product_({ i \, j } in cal(E) \( D \)) \( 1 + theta eta_i eta_j \) med
  prop med exp (beta sum_({ i \, j } in cal(E) \( D \)) eta_i eta_j) \, wide eta in { - 1 \, 1 }^D . $

Indeed, choose any vertex of $D$ as the broadcast root and multiply its probability $1 \/
  2$ by the transition probabilities on the $\| D \| - 1$ edges; also $1 + theta s =
  e^(beta s) \/ cosh beta$ for $s in { - 1 \, 1 }$. Conditional on $sigma_D = eta$,
  the likelihood of the observation paths through time $t$, relative to product Wiener measure, is

$ exp (sum_(u in D) eta_u X_u \( t \) - frac(t \| D \|, 2)) . $

The last term is independent of $eta$. Bayes’ formula gives, for every finite terminal vector $x in bb(R)^D$,

#[#set math.equation(numbering: n => "(2.2)")
 $ pi_x^D \( eta \) =
   frac(1, Z_D \( x \)) exp (beta sum_({ i \, j } in cal(E) \( D \)) eta_i eta_j + sum_(u in D) x_u eta_u) \, wide
   x = X_D \( t \) . $ <eq:finite-posterior>]

Here $Z_D \( x \)$ is the positive finite partition function.
  This calculation shows that the terminal vector is sufficient for the spin posterior;
  it does not identify the terminal-vector sigma-field with the entire observation history.

Let

$ M_v^D \( x \) = sum_eta eta_v pi_x^D \( eta \) \, wide m_v^D \( t \) = M_v^D \( X_D \( t \) \) \, wide
  h_v^D \( t \) = "atanh" m_v^D \( t \) . $

By Bayes’ formula, $m_v^D \( t \)$ is a version of $bb(E) \[ sigma_v divides cal(F)_t^D \]$.
  All posterior masses are positive, so $\| M_v^D \( x \) \| < 1$ and the field is finite.
  The functions $M_v^D$ are smooth. If $u \, v in D$, then differentiating the finite sum in (2.2) gives

#[#set math.equation(numbering: n => "(2.3)")
 $ frac(partial M_v^D, partial x_u) \( x \) = "Cov"_(pi_x^D) \( eta_v \, eta_u \) . $ <eq:finite-posterior-derivative>]

At $x = X_D \( t \)$ we denote this conditional covariance by $C_(v u)^D \( t \)$.

For an oriented edge $v arrow.r w$, let $T_(v arrow.r w)$ be the component containing $v$ after deletion of ${
  v \, w }$. If both vertices belong to $D$, define

$ h_(v arrow.r w)^D \( t \) = h_v^(D ∩ T_(v arrow.r w)) \( t \) . $

Thus a component field uses only its own component’s observations and the unconditional free prior on that
  component. It is not the field at $v$ after observing the opposite side or specifying the spin at $w$.
  The same distinction will be essential on the infinite tree.

#thm([Lemma 2.1.])[
  (Posterior identities).  #emph[For a fixed deterministic time $t gt.eq 0$, set
$ m_v \( t \) = bb(E) \[ sigma_v divides cal(F)_t^0 \] \, wide m_(v arrow.r w) \( t \) =
  bb(E) \[ sigma_v divides cal(F)_t^(T_(v arrow.r w)) \] . $

 These means lie in $\( - 1 \, 1 \)$ almost surely. Write $h_v = "atanh" m_v$ and $h_(v arrow.r w) =
   "atanh" m_(v arrow.r w)$, and define
$ psi \( z \) = "atanh" \( theta tanh z \) \, wide a \( z \) = frac(1 - tanh^2 z, 1 - theta^2 tanh^2 z) . $

 At each fixed time, almost surely,
#[#set math.equation(numbering: n => "(2.4)")
 $ h_(v arrow.r w) \( t \) & = X_v \( t \) + sum_(u tilde.op v\
u eq.not w) psi \( h_(u arrow.r v) \( t \) \) \,\
h_v \( t \) & = X_v \( t \) + sum_(u tilde.op v) psi \( h_(u arrow.r v) \( t \) \) = h_(v arrow.r w) \( t \) +
  psi \( h_(w arrow.r v) \( t \) \) . $ <eq:cavity>]

 The fields have causal, progressively measurable Borel versions as functions of the observation paths.
   The component version uses only paths in $T_(v arrow.r w)$.
   These versions require no distinguished root and satisfy, at every input and time,
#[#set math.equation(numbering: n => "(2.5)")
 $ \| h_v \( t \) - X_v \( t \) \| lt.eq d beta \, wide \| h_(v arrow.r w) \( t \) - X_v \( t \) \| lt.eq
   b beta . $ <eq:site-field-bound>]

 In the process formulas below, use these chosen field versions and set $m_v \( t \) =
   tanh h_v \( t \)$ and $m_(v arrow.r w) \( t \) = tanh h_(v arrow.r w) \( t \)$.
   For the simple path $v = v_0 \, v_1 \, dots.h \, v_r = u$, define
#[#set math.equation(numbering: n => "(2.6)")
 $ c_(v u) \( t \) & = theta^r product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \( t \) \) \, &
   c_(v v) \( t \) & = 1 \,\
C_(v u) \( t \) & = \( 1 - m_v \( t \)^2 \) c_(v u) \( t \) . $ <eq:covariance>]

 The last expression is a progressively measurable version of $"Cov" \( sigma_v \, sigma_u divides cal(F)_t^0 \)$
   at each fixed time. The cavity and covariance formulas also hold in every finite connected subtree,
   with branches restricted to that subtree. For all real $z$,
$ 0 < a \( z \) lt.eq 1 \, wide \| psi \( z \) \| lt.eq beta \, wide psi' \( z \) =
  theta a \( z \) in \( 0 \, theta \] \, $

 and $0 lt.eq C_(v u) \( t \) lt.eq theta^("dist" \( v \, u \))$ at each fixed time.]
] <lem:posterior>

#proof[
  We first establish the identities in a finite connected subtree $D$.
    A branch whose root has field $z$ assigns that root probabilities proportional to $e^z$ and $e^(- z)$.
    Summing its root spin against the edge interaction gives a factor proportional to $cosh \( z + beta s \)$ when
    its parent spin is $s$. Its contribution to the parent’s half log-odds is therefore
  $ 1 / 2 log frac(cosh \( z + beta \), cosh \( z - beta \)) = "atanh" \( theta tanh z \) = psi \( z \) . $
  The branch likelihoods multiply because the components are disjoint conditional on the parent spin.
    Adding their half log-odds and the own observation $X_v \( t \)$ proves the finite cavity formulas.
    Since $\| psi \| lt.eq beta$, the site field differs from $X_v \( t \)$ by at most $d beta$,
    and a component field by at most $b beta$.
  We next follow a path $v_0 \, dots.h \, v_r$ in $D$. With the observations fixed,
    sum the posterior in (2.2) over all spins off the path. Given the preceding path spins,
    the conditional mean of the spin at $v_i$ uses only $sigma_(v_(i - 1))$ and the field on the side excluding
    that predecessor:
  $ bb(E) \[ sigma_(v_i) divides sigma_(v_0) \, dots.h \, sigma_(v_(i - 1)) \, cal(F)_t^D \] =
    tanh \( z + beta sigma_(v_(i - 1)) \) = p_i + q_i sigma_(v_(i - 1)) \, wide z =
    h_(v_i arrow.r v_(i - 1))^D \( t \) . $
  Here $p_i$ is an intercept depending on the observations, and
  $ q_i = frac(tanh \( z + beta \) - tanh \( z - beta \), 2) =
    theta thin frac(1 - tanh^2 z, 1 - theta^2 tanh^2 z) = theta a \( z \) . $
  Iterating these affine conditional means makes the slope of the conditional mean at $v_r$,
    as a function of $sigma_(v_0)$, equal to $product_(i = 1)^r q_i$. Taking covariance with the first spin gives
  $ C_(v_0 v_r)^D \( t \) = \( 1 - \( m_(v_0)^D \( t \) \)^2 \) product_(i = 1)^r q_i . $
  This proves the finite path formula, including the empty product at $r = 0$.
    The coefficient $c_(v u)^D$ is directed even though the covariance is symmetric:
    its normalization uses the variance at $v$. In fact, (2.3) gives
  $ frac(partial, partial x_u) "atanh" M_v^D \( x \) =
    frac("Cov"_(pi_x^D) \( eta_v \, eta_u \), 1 - M_v^D \( x \)^2) \, $
  which is the path product just obtained. Thus $c_(v u)^D$ is the finite field’s response to the observation at $u$.
  Now fix $t$ and exhaust the tree by increasing finite balls.
    The conditional expectations of a fixed spin, or a product of two fixed spins,
    converge almost surely and in $L^2$ to conditioning on $cal(F)_t^0$.
    This is increasing-sigma-field convergence for bounded random variables.
    Intersecting the balls with $T_(v arrow.r w)$ gives the corresponding convergence for the component posterior.
    The finite field bounds place each mean in the random compact interval
  $ \[ tanh \( X_v \( t \) - k beta \) \, thin tanh \( X_v \( t \) + k beta \) \] med subset med \( - 1 \, 1 \) \,
    wide k = d med upright("or") med b . $
  Thus the limiting means remain strictly inside $\( - 1 \, 1 \)$,
    and their inverse hyperbolic tangents converge to finite fields.
    For a fixed path, take balls large enough to contain it. Their intersections with the finitely many directed
    components on the path exhaust those components. The finite cavity sums and path product therefore pass to the
    limit; convergence of the two-spin moments identifies the limit as the conditional covariance.
    Any other centered exhaustion gives the same conditional expectations,
    since its histories generate the same sigma-fields.
  It remains to choose process versions without presupposing a continuous infinite-dimensional filter.
    On the canonical space of continuous observation paths, evaluate the finite field formulas on $B_R \( v \)$
    for a site and on $B_R \( v \) ∩ T_(v arrow.r w)$ for a component, with $R = 0 \, 1 \, dots.h$.
    Define each raw field to be the pointwise $limsup_(R arrow.r oo)$ of these finite fields.
    Each finite expression is a continuous adapted terminal-array function.
    Its upper limit is Borel and progressively measurable, for the whole observation filtration or for the
    specified component filtration respectively. The finite bounds make the upper limits finite and preserve (2.5)
    at every input and time. At each fixed time they agree almost surely with the conditional fields proved above.
    Their hyperbolic tangents and the finite products in (2.6) give the claimed mean and covariance versions.
  These formulas use only the terminal array at the evaluated time,
    and in particular only the histories up to that time. Centering every ball at its indexed vertex makes the
    formulas commute with graph relabeling. Joint measurability and Fubini’s theorem turn the fixed-time algebraic
    identities into identities for almost every time, almost surely.
    Countability of the vertices, oriented edges, finite paths,
    and integer time horizons permits all these time-probability statements to hold simultaneously.
    Continuity and identities simultaneous at every time are not needed here;
    they will be obtained after the filtering argument in Section 4.
  Finally, direct differentiation gives $psi' \( z \) = theta \( 1 - tanh^2 z \) \/ \( 1 - theta^2 tanh^2 z \)$.
    Since $0 < theta < 1$, its bounds and $0 < a lt.eq 1$ follow.
    The covariance bound follows from the finite product and $1 - m_v^2 lt.eq 1$. ◻
]

The normalized response $c_(v u)$, rather than the covariance alone,
  is the coefficient that will occur in the field equation. At distance $r$, its deterministic bound is $theta^r$.
  Below the threshold this already gives a summable squared row.
  At equality, the size of a distance shell cancels $theta^(2 r)$;
  the next section obtains the additional decay from the observations in side branches.

== 3 Critical information controls the response row <sec:critical-information>

At the critical parameter, the squared edge factor in (2.6) is exactly balanced by the number of vertices at that
  distance. To sum a response row, we must therefore obtain decay from the factors
  $a \( h_(v_i arrow.r v_(i - 1)) \)$. We will show that the observations in one intact infinite side branch
  supply a loss of order $sqrt(t)$ at each path step for small $t$.
  The resulting expected squared row is of order at most $t^(- 1 \/ 2)$, which is integrable at the initial time.

Until the final row estimate, assume $b = d - 1 gt.eq 2$ and $theta = b^(- 1 \/ 2)$.
  Constants in the critical estimates depend only on the fixed degree $d$.
  We work at a fixed deterministic time $t > 0$ with the raw posterior versions from Lemma 2;
  their continuity is not needed. For an oriented edge $v arrow.r w$, put

$ Y = h_(v arrow.r w) \( t \) \, wide M \( t \) = bb(E) tanh^2 Y \, wide omega \( t \) = min { sqrt(t) \, 1 } . $

The law of $Y$ is independent of the oriented edge. It is symmetric:
  reversing all spins and all observations preserves their joint law and negates the conditional field almost
  surely at this fixed time. We first determine the scale of $M \( t \)$.
  Its lower bound gives path decay, while the whole-site upper bound will control the early-time energy in the
  filtering limit.

=== 3.1 Combining symmetric binary signals <combining-symmetric-binary-signals>

Combining two branches loses a definite amount of second-moment information compared with adding their separate
  contributions. This quadratic loss is related to Ioffe’s recursive second-moment estimates for Ising trees
  #cite(label("Ioffe1996GeneralTrees")) Proposition 4. The following elementary formulation will allow us to keep
  the loss explicit.

#thm([Lemma 3.1.])[
  (Symmetric binary-signal fusion).  #emph[Let $epsilon$ be a uniform sign and let two random elements of standard
    Borel spaces be independent conditional on $epsilon$. Let $U \,
    V$ be the posterior means of $epsilon$ from the respective signals.
    Suppose that their marginal laws are symmetric and $\| U \| \, \| V \| < 1$ almost surely.
    If $bb(E)_(upright("prod"))$ denotes expectation under the product of these two marginal laws,
    then the posterior mean from both signals is $\( U + V \) \/ \( 1 + U V \)$, and its second moment is
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) U^2 + bb(E) V^2 - bb(E)_(upright("prod")) frac(U^2 V^2 \( 2 - U^2 - V^2 \), 1 - U^2 V^2) .
   $ <eq:binary-fusion>]

 In particular this second moment is at most $bb(E) U^2 + bb(E) V^2$.
   If $\| U \| \, \| V \| lt.eq theta$, the subtracted term is at least $2 \( 1 - theta^2 \) bb(E) U^2 thin bb(E) V^2$.]
] <lem:binary-fusion>

#proof[
  For a signal with marginal law $nu$ and posterior mean $u$, the conditional signal law given $epsilon =
    eta$ has density $1 + eta u$ with respect to $nu$, for $eta in { - 1 \, 1 }$.
    Indeed, condition the indicator of ${ epsilon = eta }$ on the signal and use its posterior probability
    $\( 1 + eta u \) \/ 2$. Conditional independence then gives joint marginal density $1 +
    U V$ relative to the product of the two signal laws. The signed difference of the two conditional densities
    gives the combined posterior mean $\( U + V \) \/ \( 1 + U V \)$.
    Pushing the product signal law forward to the product of the marginal laws of $U \, V$, its second moment is
  $ bb(E)_(upright("prod")) frac(\( U + V \)^2, 1 + U V) . $
  The integrand is at most $2$, so it is legitimate to average it under the symmetry $V mapsto - V$. The result is
  $ frac(U^2 + V^2 - 2 U^2 V^2, 1 - U^2 V^2) = U^2 + V^2 - frac(U^2 V^2 \( 2 - U^2 - V^2 \), 1 - U^2 V^2) \, $
  which proves (3.1). The loss is nonnegative. Under the additional bound by $theta$, its numerator factor $2 -
    U^2 - V^2$ is at least $2 \( 1 - theta^2 \)$ and its denominator is at most one.
    The expectation of $U^2 V^2$ under the product law is $bb(E) U^2 thin bb(E) V^2$, proving the final assertion. ◻
]

The subadditivity in this lemma can be iterated over the branches of a vertex.
  A collection of already combined signals remains independent of every unused signal conditional on the spin.
  Its posterior mean remains symmetric, and remains strictly inside $\( - 1 \, 1 \)$, since

$ 1 - (frac(u + v, 1 + u v))^2 = frac(\( 1 - u^2 \) \( 1 - v^2 \), \( 1 + u v \)^2) > 0
  wide \( \| u \| \, \| v \| < 1 \) . $

Only the first two child signals below will require the sharper loss for means bounded by $theta$.

=== 3.2 The amount of information in one component <the-amount-of-information-in-one-component>

For a lower bound, we use a weighted linear estimator in the tradition of second-moment reconstruction estimates
  on trees #cite(label("EvansKenyonPeresSchulman2000")); see also Mossel–Peres #cite(label("MosselPeres2003"))
  Section 5, Lemma 5.3. Here it uses the Gaussian observations at all depths up to a cutoff.
  The cutoff balances the independent noise against the correlations among the spins.
  For the upper bound, the fusion loss gives the complementary estimate.

#thm([Lemma 3.2.])[
  (Critical posterior information).  #emph[There are constants $c \, C > 0$, depending only on $d$,
    such that for every $t > 0$ and every vertex $v$,
#[#set math.equation(numbering: n => "(3.2)")
 $ c omega \( t \) lt.eq M \( t \) lt.eq C omega \( t \) \, wide bb(E) m_v \( t \)^2 lt.eq
   C omega \( t \) . $ <eq:critical-information>]

 One may take $c = 1 \/ 5$. In particular both upper bounds are $C sqrt(t)$ for $0 < t lt.eq 1$.]
] <lem:critical-information>

#proof[
  Root $T_(v arrow.r w)$ at $v$. It is a rooted $b$-ary tree; write $\| u \|$ for the depth of $u$ in it.
    For an integer $n gt.eq 0$, form the component-observable statistic
  $ Z_n = sum_(\| u \| lt.eq n) theta^(\| u \|) X_u \( t \) . $
  The broadcast covariance is $bb(E) \[ sigma_u sigma_z \] = theta^("dist" \( u \, z \))$. Since $b theta^2 = 1$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E) \[ sigma_v Z_n \] = t sum_(k = 0)^n b^k theta^(2 k) = t \( n + 1 \) . $ <eq:linear-signal-correlation>]
  The Brownian part of $Z_n$ has variance $t \( n + 1 \)$ and is independent of its spin part.
  We count the latter part’s second moment. If an ordered pair $\( u \, z \)$ has depths $k \,
    ell$ and its last common ancestor has depth $j$, its weighted spin covariance, before the factor $t^2$, is
  $ theta^(k + ell + "dist" \( u \, z \)) = theta^(2 \( k + ell - j \)) = b^(- \( k + ell - j \)) . $
  When $j < min \( k \, ell \)$, choose the common ancestor,
    the two distinct first children in their ordered roles, and then the remaining descendants. The exact count is
  $ b^j thin b \( b - 1 \) thin b^(k - j - 1) b^(ell - j - 1) = \( b - 1 \) b^(k + ell - j - 1) . $
  When $j = min \( k \, ell \)$, the shallower vertex is an ancestor of the deeper one.
    There are $b^(max \( k \, ell \))$ such ordered pairs; this includes the $b^k$ diagonal pairs when $k = ell =
    j$. Each count is at most $b^(k + ell - j)$. Thus the weighted contribution for each triple
    $\( k \, ell \, j \)$ is at most one, and
  #[#set math.equation(numbering: n => "(3.4)")
   $ bb(E) Z_n^2 & lt.eq t \( n + 1 \) + t^2 sum_(k \, ell = 0)^n #scale(x: 120%, y: 120%)[\(]
     min \( k \, ell \) + 1 #scale(x: 120%, y: 120%)[\)]\
 & = t \( n + 1 \) + t^2 sum_(j = 0)^n \( n - j + 1 \)^2 lt.eq t \( n + 1 \) +
   t^2 \( n + 1 \)^3 . $ <eq:linear-signal-second-moment>]
  Because $Z_n$ is measurable from the component observations, $bb(E) \[ sigma_v Z_n \] =
    bb(E) \[ \( tanh Y \) Z_n \]$. Cauchy–Schwarz and (3.3)–(3.4) therefore give
  #[#set math.equation(numbering: n => "(3.5)")
   $ M \( t \) gt.eq frac(t \( n + 1 \), 1 + t \( n + 1 \)^2) . $ <eq:critical-information-lower>]
  For $0 < t lt.eq 1$, take $n = floor.l t^(- 1 \/ 2) floor.r$.
    Then $t^(- 1 \/ 2) lt.eq n + 1 lt.eq 2 t^(- 1 \/ 2)$, so the last bound is at least $sqrt(t) \/ 5$.
    For $t gt.eq 1$, take $n = 0$ to obtain $M \( t \) gt.eq t \/ \( 1 + t \) gt.eq 1 \/ 2$.
    This proves the lower bound with $c = 1 \/ 5$.
  For the upper bound, condition on the component root spin.
    Its own observation history and the $b$ child-component histories are conditionally independent.
    The own signal has posterior mean $tanh X_v \( t \)$, by the one-spin version of (2.2), and
  $ q_0 \( t \) := bb(E) tanh^2 X_v \( t \) lt.eq bb(E) X_v \( t \)^2 = t + t^2 . $
  One child’s entire observation history has posterior mean $theta tanh Y$ about the root spin:
    conditional on the child spin, the root has mean $theta$ times that spin.
    Its second moment is $theta^2 M \( t \)$, and its magnitude is at most $theta$.
    These statements concern full infinite component histories;
    their conditional independence follows from the broadcast construction and the independent Brownian noises,
    first for cylinder events and then for the sigma-fields they generate.
  There are at least two child signals because $b gt.eq 2$. Combine two of them first.
    Lemma 3 subtracts at least $2 \( 1 - theta^2 \) theta^4 M \( t \)^2$.
    Add the other $b - 2$ child signals and the own signal by subadditivity.
    The combined signal is the full component history, and hence
  $ M \( t \) lt.eq b theta^2 M \( t \) - 2 \( 1 - theta^2 \) theta^4 M \( t \)^2 + q_0 \( t \) . $
  The linear terms cancel at $b theta^2 = 1$. Since $q_0 \( t \) lt.eq 2 t$ for $t lt.eq 1$,
    this yields $M \( t \) lt.eq C sqrt(t)$. At a whole vertex there are $d$ child components,
    so subadditivity alone gives
  $ bb(E) m_v \( t \)^2 lt.eq q_0 \( t \) + d theta^2 M \( t \) lt.eq C sqrt(t) wide \( 0 < t lt.eq 1 \) . $
  Both second moments are at most one for $t gt.eq 1$, completing (3.2). ◻
]

We have now identified the critical information scale. To turn its lower bound into decay along a path,
  we need the conditional variation of a side branch’s outgoing message,
  even when the attaching spin has been specified.

#thm([Lemma 3.3.])[
  (Conditioning a component on a neighboring spin).  #emph[For every integrable function $f \( Y \)$ and $eta in
    { - 1 \, 1 }$,
#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E) \[ f \( Y \) divides sigma_v = eta \] & = bb(E) \[ f \( Y \) \( 1 + eta tanh Y \) \] \,\
bb(E) \[ f \( Y \) divides sigma_w = eta \] & = bb(E) \[ f \( Y \) \( 1 + eta theta tanh Y \) \] .
  $ <eq:component-field-tilts>]

 In particular either conditioning leaves the expectation of every integrable even function of $Y$ unchanged.]
] <lem:component-spin-tilts>

#proof[
  Let $cal(G) = cal(F)_t^(T_(v arrow.r w))$. Since $sigma_v$ is a uniform sign and
    $bb(E) \[ sigma_v divides cal(G) \] = tanh Y$, conditioning the indicator of ${ sigma_v =
    eta }$ on $cal(G)$ proves the first identity. The component observations are independent of $sigma_w$
    conditional on $sigma_v$, and $bb(E) \[ sigma_w divides sigma_v \] = theta sigma_v$.
    It follows that $bb(E) \[ sigma_w divides cal(G) \] = theta tanh Y$;
    the same indicator calculation proves the second identity.
    The multiplying densities are bounded, so the formulas apply to every marginally integrable $f \( Y \)$.
    If $f$ is even, its product with $tanh Y$ is odd. Symmetry of the marginal law of $Y$ makes that correction
    vanish. ◻
]

=== 3.3 Attenuation from an intact side branch <attenuation-from-an-intact-side-branch>

The next argument uses the full infinite component beyond one side edge.
  Its conditioning specifies the spins on a deterministic path,
  while leaving the selected side branches unobserved. This is the setting in which the information lower bound
  supplies a loss uniformly over the contribution from the rest of the tree.

#thm([Lemma 3.4.])[
  (Conditional path attenuation).  #emph[There is $c_0 > 0$, depending only on $d$, such that for every $t > 0$,
    every $z in bb(R)$, and $eta in { - 1 \, 1 }$,
#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E)
   [a #scale(x: 120%, y: 120%)[\(] z + psi \( h_(v arrow.r w) \( t \) \) #scale(x: 120%, y: 120%)[\)]^2 thin
   mid(bar.v) thin sigma_w = eta] lt.eq 1 - c_0 omega \( t \) . $ <eq:shifted-attenuation>]

 For every deterministic simple path $v_0 \, dots.h \, v_r$, $r gt.eq 1$,
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E)
   [product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \( t \) \)^2 thin mid(bar.v) thin sigma_(v_0) \, dots.h \,
   sigma_(v_r)] lt.eq e^(- c_0 omega \( t \) r) . $ <eq:conditional-path-attenuation>]

 The same bound holds for the reverse product $product_(i = 1)^r a \( h_(v_(i - 1) arrow.r v_i) \( t \) \)^2$,
   and both bounds also hold without conditioning on the path spins.]
] <lem:path-attenuation>

#proof[
  Set $G = psi \( Y \)$ and condition on the attaching spin $sigma_w = eta$. We have $\| G \| lt.eq beta$.
    The second identity in (3.6), symmetry, and Cauchy–Schwarz give
  $ bb(E) \[ G^2 divides sigma_w = eta \] = bb(E) G^2 \, wide \| bb(E) \[ G divides sigma_w = eta \] \|^2 =
    theta^2 \| bb(E) \[ G tanh Y \] \|^2 lt.eq theta^2 bb(E) G^2 . $
  Moreover $\| psi \( y \) \| gt.eq theta \| tanh y \|$, since $\| "atanh" u \| gt.eq \| u \|$. Consequently
  #[#set math.equation(numbering: n => "(3.9)")
   $ "Var" \( G divides sigma_w = eta \) gt.eq \( 1 - theta^2 \) bb(E) G^2 gt.eq \( 1 - theta^2 \) theta^2
     M \( t \) . $ <eq:side-message-variance>]
  The conditional variance is the useful quantity here: unlike an uncentered second moment,
    it cannot be eliminated by adding a shift.
  For any random variable $G$ supported on $\[ - beta \, beta \]$, there is a constant $c_beta > 0$ such that
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E) tanh^2 \( z + G \) gt.eq c_beta "Var" \( G \) wide
     upright("for every ") z in bb(R) . $ <eq:shifted-tanh-variance>]
  To see this, first suppose $\| z \| lt.eq beta + 1$. Then $\| z + G \| lt.eq 2 beta + 1$.
    The ratio $tanh^2 u \/ u^2$, extended continuously to be one at $u = 0$,
    has a positive minimum on that compact interval. Hence $bb(E) tanh^2 \( z + G \) gt.eq
    c_beta bb(E) \( z + G \)^2 gt.eq c_beta "Var" \( G \)$. If $\| z \| > beta + 1$, then $\| z + G \| > 1$,
    so the left side is at least $tanh^2 \( 1 \)$; use $"Var" \( G \) lt.eq
    beta^2$ and decrease $c_beta$ if needed. This proves (3.10) for the conditional laws in (3.9) as well.
  For $u = tanh^2 h$, the elementary bounds on $a$ give
  $ a \( h \)^2 lt.eq a \( h \) = 1 - frac(\( 1 - theta^2 \) u, 1 - theta^2 u) lt.eq 1 - \( 1 - theta^2 \) u . $
  Apply this with $h = z + G$. Equations (3.10) and (3.9), followed by $M \( t \) gt.eq omega \( t \) \/ 5$,
    prove (3.7), for example with
  $ c_0 = min {1 / 2 \, thin frac(c_beta \( 1 - theta^2 \)^2 theta^2, 5)} . $
  The same estimate may be used with a random shift after conditioning on data that fix the shift and are
    independent of the selected branch given its attaching spin.
  For the path estimate, choose at each target $v_i$, using only the path geometry,
    one neighbor $s_i$ that is not on the path. There are $d - 2 gt.eq 1$ choices at an internal target and $d -
    1$ at the last target. The components $R_i = T_(s_i arrow.r v_i)$ are disjoint and infinite.
    In particular, when $d = 3$ an internal target still has one full infinite side component.
  Let
  $ cal(H) = sigma #scale(x: 120%, y: 120%)[\(] sigma_(v_0) \, dots.h \, sigma_(v_r) \, med X_u \( s \) :
    u in.not union.big_i R_i \, med 0 lt.eq s lt.eq t #scale(x: 120%, y: 120%)[\)] . $
  Conditional on $cal(H)$, the selected component observation arrays are independent,
    and the law in $R_i$ depends only on its attaching spin $sigma_(v_i)$.
    This follows directly by rooting the broadcast at $v_0$: the multiplier on each attaching edge,
    the multipliers inside its selected component, and its Brownian motions form one independent group.
    The outside observations use none of these groups once the path spins are specified.
    The assertion for the full observation arrays follows from the corresponding assertion on finite cylinder events.
  At this fixed time, the cavity identity gives, almost surely,
  $ h_(v_i arrow.r v_(i - 1)) = psi \( h_(s_i arrow.r v_i) \) + (X_(v_i) + sum_(u tilde.op v_i\
u eq.not v_(i - 1) \, thin s_i) psi \( h_(u arrow.r v_i) \)) . $
  When all other selected arrays are held fixed, the parenthesized quantity is a fixed shift independent of the
    array in $R_i$ conditional on $sigma_(v_i)$. Integrate $R_1$ first.
    Every factor at a later target $v_j$, $j > 1$, uses its component on the side excluding $v_(j - 1)$,
    and hence does not use $R_1$. Thus (3.7) removes the first squared factor at a cost at most $1 -
    c_0 omega \( t \)$. Repeating in the order $R_2 \, dots.h \, R_r$ gives
  $ bb(E) [product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \)^2 thin mid(bar.v) thin cal(H)]
    lt.eq \( 1 - c_0 omega \( t \) \)^r lt.eq e^(- c_0 omega \( t \) r) . $
  Taking a conditional expectation given only the path spins proves (3.8).
    Reversing the deterministic path gives the stated reverse product. Finally average over its spins. ◻
]

The loss above comes from the posterior information in an intact infinite branch.
  It is not a claim about arbitrarily truncated branches: a finite boundary will require a separate estimate using
  the target’s own Gaussian observation. For the present response row,
  the infinite-branch estimate is exactly what is needed.

=== 3.4 Time-integrable response rows <time-integrable-response-rows>

Return to the full range $0 < theta lt.eq b^(- 1 \/ 2)$. For the progressive coefficients in (2.6),
  define the extended nonnegative sum

$ A_v \( t \) = sum_(u in cal(V)) c_(v u) \( t \)^2 . $

It is measurable as a countable sum. The following estimate is the input that permits division by the posterior
  variance when the filtering equation is converted to a field equation.

#thm([Proposition 3.5.])[
  (Time-integrable response rows).  #emph[For every vertex $v$, there is $C < oo$,
    depending only on $d$ at the critical parameter, such that
#[#set math.equation(numbering: n => "(3.11)")
 $ A_v \( t \) & lt.eq 1 + frac(d theta^2, 1 - b theta^2) &  & upright("if ") b theta^2 < 1 \, quad t gt.eq 0 \,\
bb(E) A_v \( t \) & lt.eq frac(C, omega \( t \)) &  & upright("if ") b theta^2 = 1 \, quad t > 0 \,\
bb(E) integral_0^T A_v \( t \) thin upright(d) t & < oo &  & upright("for every ") T < oo
  upright(" in either case") . $ <eq:row-energy>]

 The same fixed-time and integrated upper bounds hold with $sum_u C_(v u) \( t \)^2$ in place of $A_v \( t \)$.]
] <prop:row-energy>

#proof[
  There are $d b^(r - 1)$ vertices at distance $r gt.eq 1$ from $v$.
    If $b theta^2 < 1$, the pointwise bound $a lt.eq 1$ gives
  $ A_v \( t \) lt.eq 1 + sum_(r gt.eq 1) d b^(r - 1) theta^(2 r) = 1 + frac(d theta^2, 1 - b theta^2) . $
  At equality, $d b^(r - 1) theta^(2 r) = d \/ b$. Tonelli’s theorem and Lemma 6 give, for $t > 0$,
  $ bb(E) A_v \( t \) lt.eq 1 + d / b sum_(r gt.eq 1) e^(- c_0 omega \( t \) r) = 1 +
    frac(d \/ b, e^(c_0 omega \( t \)) - 1) lt.eq 1 + frac(d, b c_0 omega \( t \)) lt.eq frac(C, omega \( t \)) . $
  Here $e^x - 1 gt.eq x$ and $omega \( t \) lt.eq 1$. Since
  $ integral_0^T frac(thin upright(d) t, omega \( t \)) =
    cases(delim: "{", 2 sqrt(T) \, & 0 lt.eq T lt.eq 1 \,, T + 1 \, & T gt.eq 1 \,) $
  another application of Tonelli proves the integrated bound.
    Finally $sum_u C_(v u)^2 = \( 1 - m_v^2 \)^2 A_v lt.eq A_v$ by (2.6). ◻
]

In particular, $A_v \( t \)$ is finite almost surely at each fixed positive time and is finite for almost every
  time almost surely on each compact horizon. At criticality the raw sum at $t = 0$ is infinite:
  all fields vanish, $a \( 0 \) = 1$, and every positive-distance shell contributes $d \/ b$.
  That single time has zero Lebesgue measure. The integrated estimate, rather than a bound at time zero,
  is the conclusion used in the construction of the infinite innovation equation.

== 4 Constructing the infinite innovation equation <sec:innovations>

The posterior fields describe how the observations affect the spins.
  We now turn that description into a stochastic equation driven by independent Brownian motions.
  This is the equation that will allow us to compare two observation processes driven by the same noise.
  Throughout the section,

$ b = d - 1 \, wide 0 < theta = tanh beta lt.eq b^(- 1 \/ 2) . $

We use the raw observation versions from Lemma 2. In particular,
  at this stage a posterior identity holds almost surely at each fixed time,
  and therefore outside a $thin upright(d) t thin thin upright(d) bb(P)$-null set;
  continuity of the infinite filter has not yet been established.

For each vertex define its #emph[innovation] by

#[#set math.equation(numbering: n => "(4.1)")
 $ W_v \( t \) = X_v \( t \) - integral_0^t m_v \( s \) thin upright(d) s . $ <eq:innovations-definition>]

The integrand is a bounded, progressively measurable observation function.
  Thus this formula defines continuous paths for every observation input.
  Their values through time $t$ use only the observation history through $t$.
  The time integrals are Borel functions of that history, so $X mapsto
  W$ is a causal Borel map on the countable product of continuous path spaces.
  The centered-ball definitions of the posterior means also show that this map commutes with graph relabeling.

The innovation construction is classical in nonlinear filtering #cite(label("FujisakiKallianpurKunita1972")) and
  is the starting point of the Brownian Ising construction of Nam, Sly, and Zhang #cite(label("NSZ")).
  Here we must justify its equation for countably many observations.
  We will first prove that $W$ is Brownian, then identify the entire posterior martingale using an exact energy
  limit. Neither step assumes that $W$ determines $X$.

#thm([Proposition 4.1.])[
  (Infinite innovation equations).  #emph[In the planted observation law $X_v \( t \) = t sigma_v + B_v \( t \)$,
    every finite subvector of $\( W_v \)_(v in cal(V))$ is a standard vector Brownian motion in both the raw
    observation filtration $\( cal(F)_t^0 \)$ and its usual augmentation $\( cal(F)_t \)$.
    In particular $W$ has product Wiener law.]
  #emph[The posterior means have continuous versions, starting at zero, and
#[#set math.equation(numbering: n => "(4.2)")
 $ m_v \( t \) = sum_(u in cal(V)) integral_0^t C_(v u) \( s \) thin upright(d) W_u \( s \) . $ <eq:magnetization-sde>]

 At each fixed time these versions are $bb(E) \[ sigma_v divides cal(F)_t \]$,
   and $C_(v u)$ is the covariance conditional on $cal(F)_t$.
   The site fields and the component fields can be chosen as jointly Borel,
   progressively measurable functions of time and observation history that are continuous in time almost surely.
   For every input, the chosen function $h_(v arrow.r w) \( t \)$ uses only observations in $T_(v arrow.r w)$
   through time $t$. Almost surely the cavity identities and the bounds (2.5) then hold simultaneously at all
   times and all their indices.]
  #emph[With the response coefficients $c_(v u)$ from (2.6) and $A_v = sum_u c_(v u)^2$ from (3.11),
    the continuous site field satisfies the equation below. In every integral,
    $A_v$ is assigned value zero wherever this sum is infinite.
#[#set math.equation(numbering: n => "(4.3)")
 $ h_v \( t \) = sum_(u in cal(V)) integral_0^t c_(v u) \( s \) thin upright(d) W_u \( s \) +
   integral_0^t m_v \( s \) A_v \( s \) thin upright(d) s . $ <eq:field-sde>]

 Each Brownian sum in this proposition converges, along any exhaustion by finite vertex sets, in the norm
$ parallel Z parallel_(cal(M)_T^2) = (bb(E) sup_(0 lt.eq t lt.eq T) \| Z \( t \) \|^2)^(1 \/ 2) wide \( T < oo \) . $

 The drift in (4.3) is absolutely integrable on each such horizon almost surely and in expectation.]
] <prop:innovations>

The raw and augmented filtrations both occur in the proof. We record the elementary passage between them once.
  If $\( cal(G)_t^0 \)$ is a raw filtration, write $cal(G)_t = ⋂_(r > t)
  overline(cal(G)_r^0)$ for its usual augmentation, where the bar includes the null sets of the ambient
  probability space.

#thm([Lemma 4.2.])[
  (Passage to the usual augmentation).  #emph[If $Y$ is a continuous square-integrable martingale in
    $\( cal(G)_t^0 \)$ and is continuous in $L^2$ at each time, then it is also a martingale in $\( cal(G)_t \)$.
    More generally, if $Z$ is integrable and a version $M \( t \) =
    bb(E) \[ Z divides cal(G)_t^0 \]$ is continuous in $L^1$, then $M \( t \) =
    bb(E) \[ Z divides cal(G)_t \]$ at every fixed time.]
] <lem:continuous-augmentation>

#proof[
  For $s < t$, choose $s_n arrow.b s$ with $s_n < t$. The completed sigma-fields $overline(cal(G)_(s_n)^0)$
    decrease to $cal(G)_s$. Reverse conditional expectation convergence gives
  $ bb(E) \[ Y \( t \) divides cal(G)_s \] = lim_n bb(E) \[ Y \( t \) divides overline(cal(G)_(s_n)^0) \] =
    lim_n Y \( s_n \) = Y \( s \) $
  in $L^1$; the last limit even holds in $L^2$. Completion does not change conditional expectations up to null
    sets. The same argument, with $Z$ in place of $Y \( t \)$, proves the second assertion.
    A continuous bounded process is continuous in every finite $L^p$, by dominated convergence,
    so the second assertion applies to the bounded posterior versions constructed below. ◻
]

=== 4.1 Brownian innovations and finite posterior energy <brownian-innovations-and-finite-posterior-energy>

We first prove the asserted Brownian property. For $0 lt.eq s < t$,
  the future increments of the planted Brownian motions are independent of all spins and of their Brownian pasts.
  Conditioning on the smaller raw observation history therefore gives

$ bb(E) \[ X_v \( t \) - X_v \( s \) divides cal(F)_s^0 \] = \( t - s \) m_v \( s \) . $

For every deterministic $r gt.eq s$, the tower property for the bounded raw posteriors also gives
  $bb(E) \[ m_v \( r \) divides cal(F)_s^0 \] = m_v \( s \)$.
  Conditional Fubini is applicable because $\| m_v \| lt.eq 1$.
  Subtracting the conditional means of the two increments in (4.1) shows that $W_v$ is a continuous
  square-integrable martingale in $\( cal(F)_t^0 \)$.

This conclusion concerns the innovations, not the planted noises.
  In the filtration containing all spins at time zero and all Brownian histories, their relation is

$ W_v \( t \) = B_v \( t \) + integral_0^t \( sigma_v - m_v \( s \) \) thin upright(d) s . $

The added path has finite variation. Hence the pathwise quadratic covariations are

$ \[ W_v \, W_u \]_t = upright(bold(1))_({ v = u }) t . $

The bounded drift and $L^2$ continuity of $B_v$ give $L^2$ continuity of $W_v$.
  Lemma 9 makes each coordinate a martingale in $\( cal(F)_t \)$.
  Lévy’s characterization applied to each finite vector, with the displayed covariations,
  proves that vector is standard Brownian motion in $\( cal(F)_t \)$ and hence also in the smaller raw filtration.
  Its future increments are independent of the observation past.
  By a monotone-class argument over finite vertex sets and rational future times,
  the entire future increment field $\( W_v \( t + s \) - W_v \( t \) \)_(v in cal(V) \, s gt.eq 0)$ is
  independent of $cal(F)_t$ for every fixed $t$.

Finite observation sets have their own innovations. They will provide an exact scalar energy identity,
  but we will never identify their Brownian paths with the infinite innovations.

#thm([Lemma 4.3.])[
  (Finite posterior energy).  #emph[Let $D$ be a finite connected subtree. For $u in D$ put
$ W_u^D \( t \) = X_u \( t \) - integral_0^t m_u^D \( s \) thin upright(d) s . $

 The vector $W^D$ is standard Brownian motion in the usual augmentation of $\( cal(F)_t^D \)$, and, for $v in D$,
#[#set math.equation(numbering: n => "(4.4)")
 $ m_v^D \( t \) & = sum_(u in D) integral_0^t C_(v u)^D \( s \) thin upright(d) W_u^D \( s \) \,\
bb(E) \[ m_v^D \( t \)^2 \] & = bb(E) integral_0^t sum_(u in D) C_(v u)^D \( s \)^2 thin upright(d) s .
  $ <eq:finite-energy>]

]
] <lem:finite-energy>

#proof[
  The preceding conditional-increment and covariation calculation works with the observations restricted to $D$,
    and proves the Brownian assertion. The finite posterior formula (2.2) gives $m_v^D \( t \) =
    M_v^D \( X_D \( t \) \)$ for a smooth function $M_v^D$. It is a bounded continuous martingale in the raw
    filtration, since it is a version of $bb(E) \[ sigma_v divides cal(F)_t^D \]$.
    It is continuous in $L^2$, so Lemma 9 also makes it a martingale in the augmented finite observation filtration.
  Apply finite-dimensional Itô’s formula to $M_v^D \( X_D \)$ using $thin upright(d) X_u =
    m_u^D thin upright(d) t + thin upright(d) W_u^D$. By (2.3),
    its continuous local martingale part is $sum_(u in D) integral C_(v u)^D thin upright(d) W_u^D$.
    The remaining part is continuous and has finite variation locally.
    Since $m_v^D$ is itself a martingale, that part is also a local martingale and must vanish.
    The covariance coefficients are bounded, so the finite Brownian sum is square integrable on every finite
    horizon. The free prior has mean zero. This proves the first identity in (4.4),
    and orthogonality of the Brownian coordinates and Itô’s isometry prove the second. ◻
]

=== 4.2 No covariance energy escapes to the boundary <no-covariance-energy-escapes-to-the-boundary>

The finite energy identity does not yet imply its infinite analogue:
  coordinatewise convergence could leave a positive amount of energy at ever more distant vertices.
  We control that possibility in two intervals. Away from time zero,
  each vertex’s own Gaussian noise attenuates its path factor, including at a finite-tree leaf.
  Near time zero, the whole-site information estimate bounds the entire finite energy at once.

#thm([Lemma 4.4.])[
  (Gaussian attenuation away from time zero).  #emph[For every $delta > 0$ there is $kappa_delta
    in \( 0 \, 1 \)$ such that, for every finite connected subtree $D$, every $v \, u in D$, and every $s gt.eq delta$,
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) \[ C_(v u)^D \( s \)^2 \] lt.eq theta^(2 r) \( 1 - kappa_delta \)^r \, wide r =
   "dist" \( v \, u \) . $ <eq:gaussian-path-tail>]

 The same inequality holds for the whole-tree covariance $C_(v u) \( s \)$.]
] <lem:gaussian-path-tail>

#proof[
  Choose $epsilon_delta > 0$ with $2 epsilon_delta \/ sqrt(2 pi delta) lt.eq 1 \/ 2$.
    A Gaussian random variable $Z$ of variance $s gt.eq delta$, with any mean,
    has $bb(P) \( \| Z \| lt.eq epsilon_delta \) lt.eq 1 \/ 2$ by its density bound. Since
  $ a \( z \)^2 lt.eq a \( z \) lt.eq 1 - \( 1 - theta^2 \) tanh^2 z \, $
  it follows that
  $ bb(E) \[ a \( Z \)^2 \] lt.eq 1 - kappa_delta \, wide kappa_delta =
    frac(1 - theta^2, 2) tanh^2 epsilon_delta in \( 0 \, 1 \) . $
  The estimate is uniform in the mean.
  Let $v = v_0 \, dots.h \, v_r = u$ be the path in $D$. In the squared covariance formula,
    discard the initial factor $\( 1 - \( m_v^D \)^2 \)^2 lt.eq 1$.
    At the fixed time $s$ the remaining factors depend only on terminal observations.
    Conditional on all spins and all terminal Brownian coordinates other than $B_(v_1) \( s \)$,
    the cavity recursion has the form
  $ h_(v_1 arrow.r v_0)^D \( s \) = B_(v_1) \( s \) + z \, $
  where the shift $z$ is fixed: all branch fields in this recursion exclude $v_1$.
    The later fields $h_(v_i arrow.r v_(i - 1))^D$, $i > 1$, also exclude $v_1$.
    Conditional on the spins, the terminal Brownian coordinates are independent Gaussians of variance $s$.
    Integrating $B_(v_1) \( s \)$ first therefore removes the first squared factor at a cost at most $1 -
    kappa_delta$, without changing the later ones. Integrate $B_(v_2) \( s \) \, dots.h \,
    B_(v_r) \( s \)$ in that order. Iteration proves (4.5), even conditional on the spins.
    At a leaf the shift is simply its planted spin drift; the argument still applies.
    No infinite side branch is used here.
  For fixed $v \, u \, s$, exhaust the tree by finite connected subtrees containing the path.
    Bounded conditional-expectation convergence from Lemma 2 gives $C_(v u)^D \( s \) arrow.r
    C_(v u) \( s \)$ in $L^2$. Passing to the limit proves the whole-tree inequality. ◻
]

Fix $v$ and let $D_R$ be its radius-$R$ ball. Extend $C_(v u)^(D_R)$ by zero for $u in.not D_R$.
  For each fixed $u$ and $T < oo$,

#[#set math.equation(numbering: n => "(4.6)")
 $ C_(v u)^(D_R) arrow.r C_(v u) quad
   upright("in ") L^2 \( \[ 0 \, T \] times Omega \, thin upright(d) s thin thin upright(d) bb(P) \) .
   $ <eq:coordinate-covariance-convergence>]

Indeed, at each deterministic $s$, increasing-sigma-field convergence applies to the bounded variables $sigma_v$,
  $sigma_u$, and $sigma_v sigma_u$. Their conditional means determine the covariance.
  The covariances are uniformly bounded, so dominated convergence also integrates the resulting $L^2$ convergence
  in time.

When $b theta^2 < 1$, the pointwise bound $C_(v u)^(D_R) \( s \)^2 lt.eq
  theta^(2 "dist" \( v \, u \))$ controls all spatial tails:
  there are $n_r = d b^(r - 1)$ vertices at distance $r gt.eq 1$, and

$ sup_R bb(E) integral_0^T sum_("dist" \( v \, u \) > L) C_(v u)^(D_R) \( s \)^2 thin upright(d) s lt.eq d /
  b T sum_(r > L) \( b theta^2 \)^r arrow.r 0 . $

The same deterministic estimate holds for the infinite coefficients.

At equality, fix $0 < delta lt.eq min { T \, 1 }$. The tower property gives $m_v^(D_R) \( delta \) =
  bb(E) \[ m_v \( delta \) divides cal(F)_delta^(D_R) \]$. Conditional Jensen, the finite energy identity,
  and the whole-site estimate in (3.2) yield

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) integral_0^delta sum_u C_(v u)^(D_R) \( s \)^2 thin upright(d) s =
   bb(E) \[ m_v^(D_R) \( delta \)^2 \] lt.eq bb(E) \[ m_v \( delta \)^2 \] lt.eq C sqrt(delta) . $ <eq:early-energy>]

On $\[ delta \, T \]$, Lemma 11 applies uniformly in $R$, and now $n_r theta^(2 r) = d \/ b$. Thus

#[#set math.equation(numbering: n => "(4.8)")
 $ sup_R bb(E) integral_0^T sum_("dist" \( v \, u \) > L) C_(v u)^(D_R) \( s \)^2 thin upright(d) s lt.eq
   C sqrt(delta) + d / b T sum_(r > L) \( 1 - kappa_delta \)^r . $ <eq:uniform-energy-tail>]

This also bounds the infinite tail. To see this without assuming its finiteness,
  first restrict that tail to a finite annulus, pass $R arrow.r oo$ using (4.6),
  and then increase the outer radius using monotone convergence.
  First send $L arrow.r oo$ with $delta$ fixed, so that the geometric term vanishes. Then send $delta arrow.b 0$.
  The order matters: $kappa_delta$ may shrink as $delta$ tends to zero.
  We have proved that the integrated spatial tails of both the finite and the infinite rows vanish uniformly.

For a fixed $L$, the sum over $"dist" \( v \, u \) lt.eq L$ is finite.
  Equation (4.6) passes its squared energy to the limit in $L^1$.
  The uniform tail estimates then pass the complete energy to the limit.
  At each fixed $t$ we also have $m_v^(D_R) \( t \) arrow.r m_v \( t \)$ in $L^2$.
  Consequently (4.4) gives the exact infinite identity

#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E) \[ m_v \( t \)^2 \] = bb(E) integral_0^t sum_(u in cal(V)) C_(v u) \( s \)^2 thin upright(d) s
   wide \( t gt.eq 0 \) . $ <eq:covariance-energy>]

At $t = 0$ both sides are zero. Only the scalar energies have been passed to the limit;
  the distinct processes $W^(D_R)$ have played no part in this limiting operation.

=== 4.3 Identifying the entire posterior martingale <identifying-the-entire-posterior-martingale>

The energy identity gives the norm that a Brownian representation must have.
  A second identity identifies its inner product with the posterior.
  Together they determine the posterior itself and exclude any additional martingale orthogonal to the innovations.

We first record the approximation that permits coefficients to be used in this test.
  It will also let the subsequent conditional-copy construction transport individual stochastic integrals.

#thm([Lemma 4.5.])[
  (Observation-adapted step approximation).  #emph[For fixed $v \, u$ and $T < oo$,
    each of $C_(v u)$ and $c_(v u)$ is the
    $L^2 \( \[ 0 \, T \] times Omega \, thin upright(d) s thin thin upright(d) bb(P) \)$ limit of bounded
    elementary processes
$ G \( s \) = sum_(j = 0)^(N - 1) xi_j upright(bold(1))_(\( t_j \, t_(j + 1) \]) \( s \) \, wide 0 =
  t_0 < dots.h.c < t_N = T \, $

 where $xi_j$ is a bounded Borel function of finitely many observations at time $t_j$.
   In particular each coefficient has a predictable representative for stochastic integration.]
] <lem:observation-step-approximation>

#proof[
  For $R$ large enough to contain the path from $v$ to $u$,
    the finite coefficient $C_(v u)^(D_R)$ is a bounded continuous function of the terminal observations in $D_R$,
    and is therefore a continuous raw adapted process. It converges to $C_(v u)$ in the required space by (4.6).
    For the response coefficient use
  $ c_(v u)^(D_R) = theta^("dist" \( v \, u \)) product_(i = 1)^("dist" \( v \, u \))
    a \( h_(v_i arrow.r v_(i - 1))^(D_R) \) . $
  The component convergence in Lemma 2 gives fixed-time convergence to $c_(v u)$;
    the common bound $\| c_(v u)^(D_R) \| lt.eq theta^("dist" \( v \, u \)) lt.eq
    1$ again gives convergence in the stated $L^2$ space. This finite coefficient is also a continuous raw adapted
    function of finitely many terminal observations.
  For either finite coefficient, sample its values at the left endpoints of a deterministic mesh.
    As the mesh tends to zero, continuity and the common bound imply convergence in
    $L^2 \( thin upright(d) s thin thin upright(d) bb(P) \)$ by dominated convergence.
    Choose a diagonal sequence of radii and meshes. These are the asserted elementary processes.
    A subsequence converges $thin upright(d) s thin thin upright(d) bb(P)$-almost everywhere;
    its pointwise limit where finite, with value zero elsewhere,
    is predictable because each elementary process is predictable.
    This representative agrees with the original coefficient in the required product-measure sense. ◻
]

Fix $v \, u$ and $t < oo$. For any bounded elementary process of the same form whose $xi_j$ is merely
  $cal(F)_(t_j)^0$-measurable, we claim

#[#set math.equation(numbering: n => "(4.10)")
 $ bb(E) [m_v \( t \) integral_0^t G \( s \) thin upright(d) W_u \( s \)] =
   bb(E) integral_0^t G \( s \) C_(v u) \( s \) thin upright(d) s . $ <eq:innovation-test>]

For an elementary process, the integral is the finite sum of $xi_j \( W_u \( t_(j + 1) \) - W_u \( t_j \) \)$,
  hence is measurable in $cal(F)_t^0$. In its expectation against $m_v \( t \)$ we may therefore replace
  $m_v \( t \)$ by $sigma_v$. In the planted filtration,

$ thin upright(d) W_u \( s \) = thin upright(d) B_u \( s \) + \( sigma_u - m_u \( s \) \) thin upright(d) s . $

Here $sigma_v G$ is a bounded predictable integrand: $sigma_v$ is known at time zero and every raw observation
  past is contained in the planted past. Thus $bb(E) \[ sigma_v integral_0^t G thin upright(d) B_u \] = 0$.
  For the finite-variation part, condition at time $s$ on the raw observation history:

$ bb(E) \[ sigma_v \( sigma_u - m_u \( s \) \) divides cal(F)_s^0 \] =
  bb(E) \[ sigma_v sigma_u divides cal(F)_s^0 \] - m_v \( s \) m_u \( s \) = C_(v u) \( s \) . $

Boundedness permits Fubini, proving (4.10). This argument has used only the fact that $W$ is a function of the
  observation past, not any converse measurability.

Apply Lemma 12 to $C_(v u)$. Itô’s isometry for $W_u$ and Cauchy–Schwarz on the two sides of (4.10) pass to the
  limit, so the identity also holds with $G = C_(v u)$. For a finite vertex set $F$ let

$ S_(v \, F) \( t \) = sum_(u in F) integral_0^t C_(v u) \( s \) thin upright(d) W_u \( s \) . $

The integrals for different $u$ are orthogonal, even though their integrands may depend on every observation:
  their driving Brownian coordinates have zero mutual quadratic covariation. The isometry and the testing identity give

$ bb(E) \[ S_(v \, F) \( t \)^2 \] = sum_(u in F) bb(E) integral_0^t C_(v u) \( s \)^2 thin upright(d) s =
  bb(E) \[ m_v \( t \) S_(v \, F) \( t \) \] . $

Combining this with the exact energy (4.9) yields the useful squared-error identity

#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) \[ \( m_v \( t \) - S_(v \, F) \( t \) \)^2 \] = sum_(u in.not F) bb(E) integral_0^t C_(v u) \( s \)^2
   thin upright(d) s . $ <eq:innovation-residual>]

The right side tends to zero as $F$ exhausts the vertices.
  This is precisely the step that eliminates a possible residual martingale.

There is also convergence of the processes, rather than just their values at a fixed time.
  For $F subset.eq F'$, Doob’s maximal $L^2$ inequality gives

$ bb(E) sup_(0 lt.eq s lt.eq T) \| S_(v \, F') \( s \) - S_(v \, F) \( s \) \|^2 lt.eq
  4 sum_(u in F' \\ F) bb(E) integral_0^T C_(v u) \( s \)^2 thin upright(d) s . $

The total energy is finite by (4.9). The partial sums therefore converge in $cal(M)_T^2$ to a continuous
  square-integrable martingale. The limits agree on overlapping horizons,
  and (4.11) identifies each fixed-time value with the raw posterior $m_v \( t \)$.
  Countability of the vertices lets us choose these continuous versions simultaneously. This proves (4.2).

=== 4.4 Continuous versions that retain component locality <sec:continuous-causal-versions>

The Brownian representation has supplied a continuous version of each site mean.
  We now select Borel observation functions realizing this version and continuous component fields.
  Constructing component fields from site fields could apparently use information from the opposite side of an
  edge. We first establish continuous component modifications,
  then choose them by explicit past-observation formulas that retain the required component restriction.

Write $M_v$ for the continuous mean version temporarily. At every rational time it agrees almost surely with the
  raw mean from Lemma 2. Intersect these events over all vertices and rational times.
  The raw field bound and continuity of $M_v$ and $X_v$ imply, on this one event,

$ \| M_v \( t \) \| lt.eq tanh \( \| X_v \( t \) \| + d beta \) < 1 wide \( t gt.eq 0 \) . $

Indeed the inequality holds first at rational times and then passes to every time by continuity.
  On each compact interval,

$ sup_(0 lt.eq t lt.eq T) \| M_v \( t \) \| lt.eq tanh (sup_(0 lt.eq t lt.eq T) \| X_v \( t \) \| + d beta) < 1 . $

Thus $H_v = "atanh" M_v$ is continuous. The stronger inequality $\| H_v - X_v \| lt.eq
  d beta$ also passes from rational times to all times.

For adjacent vertices, consider for arbitrary real $H \, K$ the equations

$ x + psi \( y \) = H \, wide y + psi \( x \) = K . $

They have a unique solution. In fact $x$ is the unique fixed point of

$ x mapsto H - psi \( K - psi \( x \) \) \, $

a contraction of the complete space $bb(R)$ with constant at most $theta^2 < 1$, and $y = K - psi \( x \)$.
  Comparing two solutions gives

$ \| x - tilde(x) \| lt.eq frac(\| H - tilde(H) \| + theta \| K - tilde(K) \|, 1 - theta^2) \, $

and the analogous bound for $y$. The solution therefore depends continuously on $\( H \, K \)$.

Apply this construction to $\( H_v \( t \) \, H_w \( t \) \)$ and denote the resulting continuous processes by
  $\( H_(v arrow.r w)^c \, H_(w arrow.r v)^c \)$. At every fixed time the raw cavity identities identify this
  solution almost surely with the raw component fields, by uniqueness.
  After intersecting over rational times and oriented edges,
  continuity therefore extends both cavity identities and the component bound to all times.
  This proves existence of continuous component modifications.
  The construction by adjacent site fields is used only for that existence assertion.

We now specify the observation functions actually used in the rest of the proof.
  Let $m_v^0 \( t \, x \)$ and $h_(v arrow.r w)^0 \( t \, x \)$ be the original raw functions obtained from the
  centered finite-ball limits in Lemma 2. For $q_n \( t \) = 2^(- n) floor.l 2^n t floor.r$, set

$ hat(m)_v \( t \, x \) =
  cases(delim: "{", lim_(n arrow.r oo) m_v^0 \( q_n \( t \) \, x \) \, & upright("if the limit exists in ") \( -
  1 \, 1 \) \,, 0 \, & upright("otherwise") \,) $

and set $hat(h)_v = "atanh" hat(m)_v$. For every oriented edge, set

$ hat(h)_(v arrow.r w) \( t \, x \) =
  cases(delim: "{", lim_(n arrow.r oo) h_(v arrow.r w)^0 \( q_n \( t \) \, x \) \, &
  upright("if the limit exists in ") bb(R) \,, 0 \, & upright("otherwise") .) $

For each $n$ the sampled process is constant on the half-open dyadic time intervals,
  and its value there is a Borel function of the appropriate observation history at the left endpoint.
  It is therefore progressively measurable. Real convergence is a countable Cauchy condition.
  For the site selector, membership of the resulting limit in $\( - 1 \, 1 \)$ is an additional Borel condition.
  Taking these limits with the displayed defaults therefore preserves Borel and progressive measurability.
  For the component expression both the entire sequence and its default decision use only observations in
  $T_(v arrow.r w)$ through time $t$. In particular, two inputs agreeing on that component history have the same
  sequence and the same chosen value. This is pointwise component locality, including on inputs where the limit fails.

At every dyadic time the raw site mean agrees almost surely with $M_v$,
  and the raw component field agrees almost surely with $H_(v arrow.r w)^c$.
  Intersecting over the countable dyadic times and indices gives one event of probability one.
  On that event, for every real $t$ the sampled values above are values of the respective continuous modifications
  at $q_n \( t \)$. Since $q_n \( t \) arrow.r t$, continuity makes their limits agree simultaneously for every
  $t$. Thus the chosen functions are indistinguishable from the continuous modifications.
  They retain all the all-time cavity identities and bounds just proved.
  The same dyadic rule and the same defaults at every index also preserve the graph-relabeling covariance of the
  raw functions.

We henceforth use these chosen versions and omit the hats.
  Define $c_(v u)$ again by its finite path product and $C_(v u) = \( 1 - m_v^2 \) c_(v u)$.
  These are continuous in time almost surely, and they agree at each fixed time with their former raw versions.
  Consequently every changed coefficient agrees with its former version outside a $thin upright(d) t thin thin
  upright(d) bb(P)$-null set. Likewise, Fubini and boundedness give equality of the old and new mean integrals on
  each integer horizon, and hence, after a countable intersection,

$ integral_0^t m_v^0 \( s \, X \) thin upright(d) s = integral_0^t m_v \( s \, X \) thin upright(d) s quad
  upright("simultaneously for all ") t gt.eq 0 quad upright("almost surely") . $

Thus the innovation paths have not changed.

These versions are also the posteriors for the usual filtrations.
  For a fixed time $t$, apply the second part of Lemma 9 to the bounded continuous version of
  $bb(E) \[ sigma_v divides cal(F)_t^0 \]$. It gives $m_v \( t \) = bb(E) \[ sigma_v divides cal(F)_t \]$.
  The process $C_(v u) + m_v m_u$ is a bounded continuous version of the raw conditional mean of $sigma_v
  sigma_u$; applying the same argument identifies it with that conditional mean in $cal(F)_t$.
  This identifies $C_(v u)$ as the augmented conditional covariance.
  Applied instead to $tanh h_(v arrow.r w)$ and the raw component filtration,
  the argument gives the corresponding assertion for its usual augmentation. These statements include time zero.
  The one-spin site and component means start at zero. The two-spin posterior starts at its prior value
  $bb(E) \[ sigma_v sigma_u \] = theta^("dist" \( v \, u \))$, including value one when $u = v$.

=== 4.5 The field equation <the-field-equation>

It remains to pass from the posterior mean to its field. This requires the response row $A_v = sum_u c_(v u)^2$,
  rather than merely the covariance row: the transformation divides by $1 - m_v^2$.
  The estimate (3.11), proved before this section, gives

$ bb(E) integral_0^T A_v \( s \) thin upright(d) s < oo wide \( T < oo \) . $

Its strict case follows from a deterministic geometric sum.
  At criticality it follows from the intact infinite-side-branch estimate $bb(E) A_v \( s \) lt.eq
  C \/ min { sqrt(s) \, 1 }$ for $s > 0$. This is a different use of attenuation from the finite-boundary Gaussian
  estimate above. The inputs here are the second-moment information and forward infinite-branch attenuation
  already proved.

For clarity, define the version used in the drift directly from the chosen observation functions:

$ A_v \( s \, x \) =
  cases(delim: "{", sum_(u in cal(V)) c_(v u) \( s \, x \)^2 \, & upright("if this sum is finite") \,, 0 \, &
  upright("if this sum is infinite") .) $

The extended nonnegative sum is a countable sum of Borel progressive functions,
  so this finite-or-zero version is again a causal Borel progressive observation function.
  Permuting the summation index and using the same default preserve graph relabeling.
  The integrated row estimate shows that this version agrees with the extended sum outside a $thin upright(d) s
  thin thin upright(d) bb(P)$-null set. The predictable representatives used for Brownian integration agree with
  the chosen path functions outside one such null set for all $u$, by countability.
  Their squared sum therefore agrees with this $A_v$ there.
  At criticality the unmodified row is infinite at time zero, as noted after (3.11);
  the displayed convention supplies the value used in the drift.

The Brownian representation and the covariance formula now imply,
  as an equality of densities up to $thin upright(d) s thin thin upright(d) bb(P)$-null sets,

$ thin upright(d) chevron.l m_v chevron.r_s = sum_u C_(v u) \( s \)^2 thin upright(d)
  s = \( 1 - m_v \( s \)^2 \)^2 A_v \( s \) thin upright(d) s . $

One may obtain the first equality from finite Brownian sums:
  their brackets converge in $L^1$ total variation on every finite horizon, by (4.9),
  while their martingales converge in $cal(M)_T^2$. The defining bracket identity then passes to the limit.

For $n gt.eq 2$ let

$ tau_n = n and inf { t gt.eq 0 : \| m_v \( t \) \| gt.eq 1 - 1 \/ n } . $

On the stopped interval the derivatives

$ \( "atanh" \)' \( x \) = frac(1, 1 - x^2) \, wide \( "atanh" \)'' \( x \) = frac(2 x, \( 1 - x^2 \)^2) $

are bounded. Itô’s formula for the stopped continuous martingale therefore gives

$ h_v \( t and tau_n \) = sum_u integral_0^(t and tau_n) frac(C_(v u) \( s \), 1 - m_v \( s \)^2) thin upright(d)
  W_u \( s \) + integral_0^(t and tau_n) m_v \( s \) A_v \( s \) thin upright(d) s . $

The Brownian coefficient is exactly $c_(v u)$. The equality of this countable Brownian sum with the transformed
  mean integral follows first for finite sums and then by the isometry;
  on the stopped interval the derivative is bounded.

The global Brownian sum with coefficients $c_(v u)$ exists in $cal(M)_T^2$.
  Indeed, for finite $F subset.eq F'$, Doob’s inequality gives

$ bb(E) sup_(0 lt.eq t lt.eq T)
  lr(|sum_(u in F' \\ F) integral_0^t c_(v u) \( s \) thin upright(d) W_u \( s \)|)^2 lt.eq
  4 sum_(u in F' \\ F) bb(E) integral_0^T c_(v u) \( s \)^2 thin upright(d) s . $

The right side tends to zero along an exhaustion by the integrated row estimate.
  Also $bb(E) integral_0^T \| m_v \| A_v thin upright(d) s lt.eq bb(E) integral_0^T A_v thin upright(d) s < oo$.
  Finally $tau_n arrow.t oo$ almost surely: the continuous mean stays strictly inside $\( - 1 \, 1 \)$ on every
  compact interval. The stopped identities hold simultaneously in time by continuity.
  On any fixed compact interval, almost every path therefore agrees with one of these identities for all
  sufficiently large $n$. Removing the stopping yields (4.3).

We now have the full innovation-driven field equation in the observation filtration,
  with both Brownian and drift terms integrable. The next comparison must prove that the same innovations remain
  Brownian when two conditional observation histories are put together;
  that compatibility is the next step of the argument.

== 5 Comparing observations with the same innovations <sec:coupling>

The innovations constructed in the preceding section are independent Brownian motions,
  but that fact alone does not show that they determine the observations.
  We now turn this question into a comparison of two observation processes.
  We sample them independently conditional on the same #emph[entire] innovation array,
  prove that they can still be driven by the same Brownian motions in their joint filtration,
  and derive an equation for their discrepancy. This is the conditional-copy compatibility method developed by
  Kurtz #cite(label("Kurtz2014")); we prove the specific compatibility and transport statements needed here.

Throughout this section, $d gt.eq 3$, $b = d - 1$, and $0 < theta = tanh beta lt.eq b^(- 1 \/ 2)$.
  We use the continuous causal observation functions selected in Proposition 8.
  With the selected means, the innovation map

$ W_v \( t \) = X_v \( t \) - integral_0^t m_v \( s \) thin upright(d) s $

is a Borel function of $X$ whose restriction to $\[ 0 \, t \]$ uses only observations up to $t$.
  By Section 4 and a countable intersection over vertices, this selected-mean innovation map agrees with the
  original raw innovation map as a whole-path map almost surely under the observation law.
  We use this selected version throughout. The field equation (4.3) and the integrated row bound (3.11) have
  already been proved in the observation filtration. No inverse map from $W$ to $X$ is assumed in what follows.
  For drift integrals involving $A_v$, we use the finite-or-zero drift convention fixed in Section 4.

=== 5.1 Conditioning on the complete innovations <conditioning-on-the-complete-innovations>

Write

$ C_0 \( \[ 0 \, oo \) \, bb(R) \) = { x in C \( \[ 0 \, oo \) \, bb(R) \) : x \( 0 \) = 0 } \,\
sans(X) = sans(W) = C_0 \( \[ 0 \, oo \) \, bb(R) \)^(cal(V)) . $

Give the path space its locally uniform Polish topology and the arrays the countable product topology.
  The subscript $0$ specifies the value at time zero and imposes no condition at infinity.
  Let $sans(Q)$ be the joint law of $\( X \, W \)$ from the planted observation construction.
  Its $W$-marginal is product Wiener measure, denoted by $sans(w)$.
  These are standard Borel spaces, so there is a regular conditional probability
  $sans(K) \( w \, thin upright(d) x \)$ for $X$ given $W = w$. Define a probability law on the three path arrays by

#[#set math.equation(numbering: n => "(5.1)")
 $ hat(sans(Q)) \( thin upright(d) w \, thin upright(d) x \, thin upright(d) x' \) =
   sans(w) \( thin upright(d) w \) thin sans(K) \( w \, thin upright(d) x \) thin
   sans(K) \( w \, thin upright(d) x' \) . $ <eq:copy-law>]

Write $X^1 \, X^2 \, W$ for its coordinates. Each pair $\( X^j \, W \)$ has law $sans(Q)$,
  while $X^1$ and $X^2$ are independent conditional on $W$.
  The conditioning in (5.1) uses every coordinate of $W$ at every time, not only the portion already observed.

For $t gt.eq 0$, let $cal(H)_t^0$ be the raw sigma field generated by $X_v^1 \( s \) \, X_v^2 \( s \) \,
  W_v \( s \)$ for $v in cal(V)$ and $0 lt.eq s lt.eq t$, and let $\( cal(H)_t \)$ be its usual augmentation.
  All posterior fields and coefficients attached to copy $j$ below are obtained by applying the same causal
  observation functions to $X^j$.

#thm([Proposition 5.1.])[
  (Compatible conditional copies).  #emph[The law (5.1) is invariant under the simultaneous action of each fixed
    automorphism of $T_d$. Every finite subvector of $W$ is standard vector Brownian motion in $\( cal(H)_t \)$.
    For each copy $j$, both equations (4.2) and (4.3) hold in this filtration,
    with the coefficients of that copy and the common Brownian motions $W$.
    Their infinite Brownian sums converge in the maximal $L^2$ norm on every finite time interval.]
] <prop:compatible-copies>

#proof[
  We first prove that the future of $W$ is not exposed by either observation past.
    Fix a deterministic $t gt.eq 0$, write $W_(lt.eq t)$ for the restriction of $W$ to $\[ 0 \, t \]$,
    and define its future increment array by
  $ Z_v^t \( s \) = W_v \( t + s \) - W_v \( t \) \, wide s gt.eq 0 . $
  In the original law $sans(Q)$, $Z^t$ is independent of the raw observation past $cal(F)_t^0$.
    Indeed, the Brownian property in Proposition 8 gives the assertion for every finite set of sites and future
    times. Rational times generate the Borel sigma field of a continuous path;
    a monotone-class argument over the countably many sites and rational times gives the assertion for the whole
    increment array. Causality also makes $W_(lt.eq t)$ $cal(F)_t^0$-measurable.
  It follows that, for every bounded Borel function $F$ of the observation past,
  #[#set math.equation(numbering: n => "(5.2)")
   $ bb(E)_(sans(Q)) \[ F \( X_(lt.eq t) \) divides W \] =
     bb(E)_(sans(Q)) \[ F \( X_(lt.eq t) \) divides W_(lt.eq t) \] quad
     upright("almost surely") . $ <eq:past-compatibility>]
  To verify the identity, denote the right side by $J \( W_(lt.eq t) \)$ and test against $u \( W_(lt.eq t) \)
    v \( Z^t \)$, with bounded Borel $u \, v$. Independence of $Z^t$ from $cal(F)_t^0$ factors $bb(E)
    v \( Z^t \)$ out of the expectation containing $F u$. It does the same for $J u$,
    and the remaining expectations agree by the definition of $J$. These products generate $sigma \( W \)$:
    its past together with $Z^t$ reconstructs every path value of $W$. This proves (5.2).
  Conditional independence in (5.1) gives, for bounded past functions $F \, G$,
  $ bb(E)_(hat(sans(Q))) \[ F \( X_(lt.eq t)^1 \) G \( X_(lt.eq t)^2 \) divides W \] =
    bb(E)_(sans(Q)) \[ F \( X_(lt.eq t) \) divides W \] bb(E)_(sans(Q)) \[ G \( X_(lt.eq t) \) divides W \] . $
  Both factors on the right depend only on $W_(lt.eq t)$ by (5.2).
    Product Wiener measure makes $Z^t$ independent of $W_(lt.eq t)$, and hence
  $ & bb(E)_(hat(sans(Q))) \[ u \( W_(lt.eq t) \) F \( X_(lt.eq t)^1 \) G \( X_(lt.eq t)^2 \) v \( Z^t \) \]\
 & wide = bb(E)_(hat(sans(Q))) \[ u \( W_(lt.eq t) \) F \( X_(lt.eq t)^1 \) G \( X_(lt.eq t)^2 \) \]
   bb(E)_(sans(w)) \[ v \( Z^t \) \] . $
  Another monotone-class argument shows that $Z^t$ is independent of the full sigma field $cal(H)_t^0$.
    Thus every finite subvector of $W$ is Brownian in the raw joined filtration.
  Each $W_v$ is a continuous square-integrable martingale in the raw joined filtration and is $L^2$-continuous
    because its marginal law is Wiener measure. Lemma 9 therefore makes it a martingale in $\( cal(H)_t \)$.
    The quadratic covariations, determined by the Brownian paths, remain $\[ W_u \, W_v \]_t =
    upright(bold(1))_({ u = v }) t$. Lévy’s martingale characterization applied to each finite subvector proves
    the claimed Brownian property in $\( cal(H)_t \)$.
  We next check invariance. The selected field functions commute with graph relabeling,
    so the innovation map does too. Since the observation law is invariant,
    $sans(Q)$ is invariant under $\( X \, W \) mapsto \( g X \, g W \)$.
    For one fixed automorphism $g$, uniqueness of regular conditional probabilities now gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ sans(K) \( g w \, dot.op \) = g_(*) sans(K) \( w \, dot.op \) quad
     upright("for ") sans(w) upright("-almost every ") w . $ <eq:kernel-equivariance>]
  To obtain equality as probability measures, first check it for a countable determining algebra generating the
    Borel sets of $sans(X)$ and intersect the resulting full-measure sets.
    Applying this identity to both factors in (5.1) proves invariance of the joined law.
    This argument is made separately for each fixed $g$.
  It remains to justify the stochastic equations in the enlarged filtration.
    We give the approximation argument because an Itô integral cannot simply be identified across filtrations from
    a formal equality of pair laws. For either coefficient $k_(v u) = c_(v u)$ or $k_(v u) = C_(v u)$, fix $v \,
    u$ and a finite horizon $T$. Lemma 12, applied to the $X$-marginal of $sans(Q)$,
    supplies bounded causal Borel elementary processes
  $ G_n \( t \, X \) = sum_i gamma_(n \, i) \( X_(lt.eq t_(n \, i)) \)
    upright(bold(1))_(\( t_(n \, i) \, t_(n \, i + 1) \]) \( t \) \, wide integral_0^T bb(E)_(sans(Q)) \| G_n -
    k_(v u) \|^2 thin upright(d) t arrow.r 0 \, $
  where each $gamma_(n \, i)$ is a bounded Borel function of finitely many observations at time $t_(n \, i)$,
    viewed as a function of the indicated past.
  The elementary integral against $W_u$ is the Borel path functional
  $ I_n \( t \; X \, W \) = sum_i gamma_(n \, i) \( X_(lt.eq t_(n \, i)) \) #scale(x: 120%, y: 120%)[\(]
    W_u \( t and t_(n \, i + 1) \) - W_u \( t and t_(n \, i) \) #scale(x: 120%, y: 120%)[\)] . $
  The Brownian isometry and Doob’s maximal inequality show that these integrals converge in
    $L^2 \( C \( \[ 0 \, T \] \) \)$ to the original Itô integral.
    A deterministic subsequence converges uniformly almost surely;
    its limit on the Borel set of uniformly Cauchy inputs, with the zero path as default,
    is a Borel version of that integral as a function of $\( X \, W \)$.
    The same subsequence has that pathwise limit in each joined pair, since $\( X^j \, W \)$ has law $sans(Q)$.
    On the other hand the same isometry and maximal inequality in $\( cal(H)_t \)$ show that
    $I_n \( dot.op \; X^j \, W \)$ converges to the joined Itô integral of $k_(v u) \( dot.op \, X^j \)$.
    The two limits agree. This proves transport of each individual integral, including its continuous path version.
  For either coefficient family the integrated squared row is finite:
    this is (3.11) for $c$, and follows for $C$ also from $C_(v u) = \( 1 - m_v^2 \) c_(v u)$.
    If $F subset F'$ are finite vertex sets, the joined integral tails satisfy
  $ bb(E)_(hat(sans(Q))) sup_(t lt.eq T)
    lr(|sum_(u in F' \\ F) integral_0^t k_(v u) \( s \, X^j \) thin upright(d) W_u \( s \)|)^2 lt.eq
    4 sum_(u in F' \\ F) bb(E)_(sans(Q)) integral_0^T k_(v u) \( s \, X \)^2 thin upright(d) s . $
  The right side tends to zero along an exhaustion. The drift at any fixed time is a Borel observation functional,
    obtained by time integration; its absolute integral is finite almost surely because $\| m_v \| lt.eq
    1$ and $bb(E) integral_0^T A_v thin upright(d) t < oo$. Assigning zero to exceptional nonfinite integral
    values supplies a Borel scalar version if needed. Transport the original equations with finite partial
    Brownian sums at rational times and let the partial sums increase:
    their residuals converge in probability under $sans(Q)$, hence under each identical joined pair law,
    while their joined integral limits have just been identified.
    The equations therefore hold at all rational times in the joining.
    Continuity of the fields and Brownian sums, and absolute continuity of the drift integrals,
    extend them to all times. Taking countable intersections over vertices and integer horizons finishes the
    transport assertion. ◻
]

The purpose of this construction can already be stated precisely.
  For each vertex $v$ and nonnegative rational $q$, $bb(E)_(sans(Q)) X_v \( q \)^2 = q + q^2 < oo$.
  Conditional independence gives

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E)_(hat(sans(Q))) \[ \( X_v^1 \( q \) - X_v^2 \( q \) \)^2 divides W \] =
   2 "Var"_(sans(Q)) \( X_v \( q \) divides W \) quad upright("almost surely") . $ <eq:copy-coordinate-variance>]

Thus equality of the two observation paths would make every rational coordinate have zero conditional variance.
  These countably many coordinates determine a continuous path configuration.
  The final section will turn that implication into a Borel recovery map after the comparison has proved equality;
  no equality has been assumed here.

=== 5.2 The field discrepancy and its variance <the-field-discrepancy-and-its-variance>

From now on unprimed quantities refer to the first copy, primed quantities to the second,
  and $Delta$ means their difference. All expectations in the comparison are under $hat(sans(Q))$.
  Every one-copy estimate proved earlier remains valid because the marginals have not changed.

Fix $T > 0$. In each pair the defining innovation identity holds as an identity of continuous paths.
  Subtracting the two identities gives

$ Delta X_v \( t \) = integral_0^t Delta m_v \( s \) thin upright(d) s \, wide \| Delta X_v \( t \) \| lt.eq 2 t . $

Together with $\| h_v - X_v \| \, \| h'_v - X'_v \| lt.eq d beta$, this gives

#[#set math.equation(numbering: n => "(5.5)")
 $ \| Delta h_v \( t \) \| lt.eq H_T := 2 T + 2 d beta wide \( v in cal(V) \, 0 lt.eq t lt.eq T \)
   $ <eq:bounded-discrepancy>]

on one full-probability event. The field bounds and identities hold simultaneously because the chosen fields are
  continuous and the vertices are countable.

Choose a vertex $o$ only for taking expectations, and put

$ V \( t \) = bb(E) \[ \( Delta h_o \( t \) \)^2 \] . $

Invariance of the joined law makes the value independent of the choice of $o$.
  It is nonnegative, bounded by $H_T^2$ on $\[ 0 \, T \]$, and $V \( 0 \) = 0$.
  We need the full variance equation, including its drift.

#thm([Lemma 5.2.])[
  (Variance of the discrepancy).  #emph[The function $V$ is absolutely continuous on every finite interval.
    For almost every $t$,
#[#set math.equation(numbering: n => "(5.6)")
 $ V' \( t \) = sum_(u in cal(V)) bb(E) \[ \( Delta c_(o u) \( t \) \)^2 \] +
   2 bb(E) \[ Delta h_o \( t \) \( m_o \( t \) A_o \( t \) - m'_o \( t \) A'_o \( t \) \) \] . $ <eq:variance>]

]
] <lem:copy-variance>

#proof[
  Subtract the two field equations in the common filtration.
    The martingale part is $M_o = sum_u integral Delta c_(o u) thin upright(d) W_u$, and,
    outside the $thin upright(d) t thin thin upright(d) hat(sans(Q))$-null set where a row diverges,
  $ sum_u \( Delta c_(o u) \)^2 lt.eq 2 \( A_o + A'_o \) . $
  The integrated expectation of the right side is finite. Thus the sum defining $M_o$ converges in maximal $L^2$,
    and its bracket is
  $ chevron.l M_o chevron.r_t = integral_0^t sum_u \( Delta c_(o u) \( s \) \)^2 thin upright(d) s . $
  This follows first for finite sums from the zero cross-covariations of distinct Brownian coordinates,
    then for the limit by the $L^1$ convergence of the integrated squared row tails.
    Itô’s formula for $\( Delta h_o \)^2$ gives
  $ \( Delta h_o \( t \) \)^2 =  & 2 integral_0^t Delta h_o \( s \) thin upright(d) M_o \( s \) +
    integral_0^t sum_u \( Delta c_(o u) \( s \) \)^2 thin upright(d) s\
 & + 2 integral_0^t Delta h_o \( s \) \( m_o \( s \) A_o \( s \) - m'_o \( s \) A'_o \( s \) \) thin upright(d) s . $
  The first integral is a square-integrable martingale: by (5.5),
    its expected bracket is at most $8 H_T^2 bb(E) integral_0^T \( A_o + A'_o \) thin upright(d) s$.
    The absolute values of the other two integrands have expectations bounded respectively by $2
    bb(E) \( A_o + A'_o \)$ and $2 H_T bb(E) \( A_o + A'_o \)$, which are integrable in time.
    Taking expectations therefore gives an integral of an $L^1 \( \[ 0 \, T \] \)$ function.
    This proves absolute continuity and its almost-everywhere derivative (5.6). ◻
]

The coefficients in this equation are products along directed paths.
  We first control the difference of one factor. For a directed edge $e = \( i \, j \)$ define

#[#set math.equation(numbering: n => "(5.7)")
 $ D_e \( t \) = log a \( h_(j arrow.r i) \( t \) \) - log a \( h'_(j arrow.r i) \( t \) \) \, wide S \( t \) =
   bb(E) \[ D_e \( t \)^2 \] . $ <eq:log-discrepancy-def>]

Transitivity on directed edges makes $S$ independent of $e$. The two cavity identities at the ends of $i j$ give

$ \| Delta h_(j arrow.r i) \| lt.eq \| Delta h_j \| + theta \| Delta h_(i arrow.r j) \| \,
  wide \| Delta h_(i arrow.r j) \| lt.eq \| Delta h_i \| + theta \| Delta h_(j arrow.r i) \| . $

Substituting the second inequality into the first yields

#[#set math.equation(numbering: n => "(5.8)")
 $ \| Delta h_(j arrow.r i) \| lt.eq frac(\| Delta h_j \| + theta \| Delta h_i \|, 1 - theta^2) .
   $ <eq:component-difference>]

In particular, on $\[ 0 \, T \]$ it is bounded by $H_T \/ \( 1 - theta \)$;
  Minkowski’s inequality and invariance also give $parallel Delta h_(j arrow.r i) parallel_2 lt.eq
  sqrt(V) \/ \( 1 - theta \)$.

Direct differentiation gives

#[#set math.equation(numbering: n => "(5.9)")
 $ \( log a \)' \( z \) = - frac(2 \( 1 - theta^2 \) tanh z, 1 - theta^2 tanh^2 z) \,
   wide \| \( log a \)' \( z \) \| lt.eq 2 \| tanh z \| lt.eq 2 . $ <eq:log-derivative>]

Here the first inequality uses $1 - theta^2 tanh^2 z gt.eq 1 - theta^2$. We conclude that

#[#set math.equation(numbering: n => "(5.10)")
 $ \| D_e \( t \) \| lt.eq frac(2 H_T, 1 - theta) \, wide S \( t \) lt.eq
   frac(4, \( 1 - theta \)^2) V \( t \) quad \( 0 lt.eq t lt.eq T \) . $ <eq:basic-log-loss>]

Also $\( log a \) \( 0 \) = 0$, so $\| log a \( h_(j arrow.r i) \( t \) \) \| lt.eq
  2 \| h_(j arrow.r i) \( t \) \| lt.eq 2 \( \| X_j \( t \) \| + b beta \)$.
  Since $bb(E) X_j \( t \)^2 = t + t^2$, each one-copy log factor is square integrable.
  Equality of the marginal laws then gives $bb(E) D_e \( t \) = 0$.
  These facts will permit the later spatial cancellation estimate to be applied to this particular edge observable.

=== 5.3 Reducing the comparison to path estimates <reducing-the-comparison-to-path-estimates>

For a directed simple path $v_0 \, dots.h \, v_r$, $r gt.eq 1$, let $e_i = \( v_(i - 1) \, v_i \)$.
  At a common time $t$, set

#[#set math.equation(numbering: n => "(5.11)")
 $ P_r & = product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \) \, & Z_r & = sum_(i = 1)^r D_(e_i) \,\
Q_r & = bb(E) \[ \( P_r^2 + \( P'_r \)^2 \) Z_r^2 \] \, & L_r & =
  bb(E) \[ \( Delta h_(v_0) \)^2 P_r^2 \] . $ <eq:weighted-path-definitions>]

The orientation matters: every factor uses the component at the next vertex excluding the preceding one.
  Invariance makes these expectations depend only on $r$ and $t$, so we suppress the particular path.
  Both $P_r$ and $P'_r$ lie in $\( 0 \, 1 \]$, and $log P_r - log P'_r = Z_r$.
  The mean-value theorem, first for $e^x$ and then for $e^(2 x)$, gives

#[#set math.equation(numbering: n => "(5.12)")
 $ bb(E) \[ \( P_r - P'_r \)^2 \] lt.eq 2 Q_r \, wide \| P_r^2 - \( P'_r \)^2 \| lt.eq
   2 \( P_r^2 + \( P'_r \)^2 \) \| Z_r \| . $ <eq:product-difference>]

For example, the derivative of $e^x$ on the segment joining $log P_r$ and $log P'_r$ is at most $P_r + P'_r$;
  squaring and using $\( P_r + P'_r \)^2 lt.eq 2 \( P_r^2 + \( P'_r \)^2 \)$ proves the first bound.
  The derivative of $e^(2 x)$ on the same segment is at most $2 \( P_r^2 + \( P'_r \)^2 \)$, proving the second.

There are $n_r = d b^(r - 1)$ vertices at distance $r gt.eq 1$ from $o$.
  The diagonal coefficients are $c_(o o) = c'_(o o) = 1$, and the coefficient along any positive-length path is
  $theta^r P_r$. Tonelli’s theorem and (5.12) therefore bound the noise term in (5.6) by

#[#set math.equation(numbering: n => "(5.13)")
 $ sum_u bb(E) \[ \( Delta c_(o u) \)^2 \] lt.eq 2 sum_(r gt.eq 1) n_r theta^(2 r) Q_r . $ <eq:noise-bound>]

The drift contributes a second, different path sum:

#[#set math.equation(numbering: n => "(5.14)")
 $ lr(|bb(E) \[ Delta h_o \( m_o A_o - m'_o A'_o \) \]|) lt.eq V +
   sum_(r gt.eq 1) n_r theta^(2 r) (L_r + 2 sqrt(2 V) sqrt(Q_r)) . $ <eq:drift-bound>]

To prove this, write $m_o A_o - m'_o A'_o = \( m_o - m'_o \) A_o + m'_o \( A_o - A'_o \)$.
  Since $tanh$ is $1$-Lipschitz, the first part is bounded by

$ bb(E) \[ \( Delta h_o \)^2 A_o \] = V + sum_(r gt.eq 1) n_r theta^(2 r) L_r . $

For the second, use $\| m'_o \| lt.eq 1$. The diagonal terms of $A_o - A'_o$ cancel.
  For each remaining path, put $w_r = P_r^2 + \( P'_r \)^2 lt.eq 2$.
  The second inequality in (5.12) and weighted Cauchy–Schwarz give

$ bb(E) \[ \| Delta h_o \| thin \| P_r^2 - \( P'_r \)^2 \| \] & lt.eq
  2 sqrt(bb(E) \[ \( Delta h_o \)^2 w_r \]) sqrt(bb(E) \[ w_r Z_r^2 \])\
 & lt.eq 2 sqrt(2 V) sqrt(Q_r) . $

Summing proves (5.14). These inequalities may first be read for finite spatial sums and then with nonnegative
  extended right sides; the estimates at their subsequent uses make those right sides finite.
  In particular no independence between a path product and its discrepancy is used.
  The square-root sum in the drift must be controlled along with the noise sum.

#thm([Proposition 5.3.])[
  (Uniqueness below the threshold).  #emph[If $b theta^2 < 1$, then $V \( t \) = 0$ for every $t gt.eq 0$.]
] <prop:strict-uniqueness>

#proof[
  Since the products in (5.11) are at most one, $L_r lt.eq V$. Cauchy–Schwarz in the sum $Z_r$ gives
  $ Q_r lt.eq 2 bb(E) Z_r^2 lt.eq 2 r sum_(i = 1)^r bb(E) D_(e_i)^2 = 2 r^2 S . $
  Use this with (5.10) in the noise and drift bounds. The contributions are bounded by $V$ times sums of $r^2$,
    $1$, and $r$, respectively, against
  $ n_r theta^(2 r) = d / b \( b theta^2 \)^r . $
  All three series converge when $b theta^2 < 1$. Equation (5.6) therefore gives $V' lt.eq
    C V$ almost everywhere on $\[ 0 \, T \]$, for a finite constant depending on the fixed parameters.
    Absolute continuity and $V \( 0 \) = 0$ imply $V = 0$ there by Gronwall’s inequality.
    The horizon $T$ was arbitrary. ◻
]

At equality, $n_r theta^(2 r) = d \/ b$, so the geometric decay in this proof disappears.
  The next two sections will replace the elementary $r^2 S$ loss by spatial cancellation of order $r
  S$ and attenuation on the length scale $omega \( t \)^(- 1)$.
  Their leading noise estimate has the form $Q_r lt.tilde r S \( t \) e^(- c omega \( t \) r)$.
  Near time zero, where $omega \( t \) = sqrt(t)$, its sum has size

$ S \( t \) sum_(r gt.eq 1) r e^(- c sqrt(t) thin r) = S \( t \)
  frac(e^(- c sqrt(t)), \( 1 - e^(- c sqrt(t)) \)^2) asymp frac(S \( t \), t) . $

Thus even those two estimates, combined only with $S lt.eq C V$,
  would leave a nonintegrable coefficient at time zero. The final comparison will improve the relation between $S$
  and $V$ using small component fields, while also retaining the square-root drift sum.
  This is the remaining obstruction at the critical parameter.

== 6 Cancellation along a path <sec:spectrum>

The comparison of the two observation copies led to sums of the edge differences $D_e \( t \)$.
  Cauchy–Schwarz bounds the second moment of a sum over $r$ edges by $r^2 S \( t \)$, where $S \( t \) =
  bb(E) D_e \( t \)^2$. We now improve the factor $r^2$ to $r$ by proving that the correlations of these
  differences are summable along a path. The proof begins with local correlations under one observation law and
  passes to the joining through the closed space generated by differences of marginal functions.
  Although only equality remains in the comparison, this path estimate holds throughout $0 < theta lt.eq b^(- 1 \/ 2)$.

Here and below $nu$ is the observation marginal of the original joint law $sans(Q)$, namely the law of the entire array

$ X = \( X_v \)_(v in cal(V)) quad upright("in") quad sans(X) = C_0 \( \[ 0 \, oo \) \, bb(R) \)^(cal(V)) . $

Here $C_0$ again means continuous paths starting at zero,
  with the topology of uniform convergence on compact time intervals.
  The vertex and nonbacktracking operator geometry used in this argument is related to the correlation arguments
  of Backhausz, Szegedy, and Virág #cite(label("BSV")) Theorem 2.2 in arXiv:1305.6784v1 and Backhausz, Gerencsér,
  Harangi, and Vizer #cite(label("BGHV")) Theorems 4.1–4.2 in arXiv:1603.08423v2.
  The proof below supplies the precise transfer to differences of marginal observation functions.

#thm([Proposition 6.1.])[
  (Path variance).  #emph[Let $d gt.eq 3$, $b = d - 1$, and $0 < theta lt.eq b^(- 1 \/ 2)$.
    Let $pi$ be a probability law on $sans(X)^2$ with both marginals equal to $nu$,
    invariant under the simultaneous action of $"Aut" \( T_d \)$.
    Suppose that $g = \( g_e \)$ assigns a measurable real function of $sans(X)$ to every directed edge,
    with $bb(E)_nu g_e^2 < oo$, and that for each fixed $gamma in "Aut" \( T_d \)$ and directed edge $e$,
$ g_(gamma e) \( gamma x \) = g_e \( x \) quad upright("for ") nu upright("-almost every ") x . $

 Here $gamma \( i \, j \) = \( gamma i \, gamma j \)$. For the two coordinate arrays $X \, X'$ under $pi$, set
$ D_e = g_e \( X \) - g_e \( X' \) \, wide S = bb(E)_pi D_e^2 . $

 The value of $S$ is independent of the directed edge. There is a constant $C_d < oo$, depending only on $d$,
   such that for every integer $r gt.eq 1$ and every simple path $v_0 \, dots.h \, v_r$,
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E)_pi [(sum_(i = 1)^r D_(\( v_(i - 1) \, v_i \)))^2] & lt.eq C_d r S \,\
bb(E)_pi [(sum_(i = 1)^r D_(\( v_i \, v_(i - 1) \)))^2] & lt.eq C_d r S . $ <eq:path-variance>]

 In particular, take $pi$ to be the $\( X \, X' \)$-marginal of the joining in Proposition 13.
   Then this holds for the differences $D_e \( t \)$ in (5.7) at each fixed finite time, with $S = S \( t \)$.]
] <prop:path-variance>

We prove the proposition in three steps. First, local observation functions have exponentially small correlations
  across a long connecting path. This bounds the self-adjoint neighbor average on centered vertex functions.
  Second, the bound transfers to a closed space of differences inside the joining.
  Finally, head and tail lifts of that vertex space control the nonbacktracking edge average.
  Its powers are summable, which gives the linear variance in (6.1).
  All equivariance identities in this section are understood separately for each fixed automorphism,
  as in the proposition.

=== 6.1 The vertex bound for one observation law <the-vertex-bound-for-one-observation-law>

We shall use the same Hilbert-space notation for several invariant configuration laws.
  For such a law $eta$, a #emph[vertex assignment] is a family $f = \( f_v \)_(v in cal(V))$ of measurable real
  functions satisfying

$ f_(gamma v) \( gamma x \) = f_v \( x \) quad eta upright("-almost surely, for each fixed ") gamma \, v . $

Let $cal(H)_(upright(v)) \( eta \)$ be the space of square-integrable vertex assignments,
  modulo almost sure equality at each vertex, with

$ chevron.l f \, k chevron.r_(upright(v) \, eta) = bb(E)_eta \[ f_o k_o \] . $

Transitivity and invariance make this independent of the vertex $o$.
  The analogous space $cal(H)_(upright(e)) \( eta \)$ consists of assignments to directed edges,
  with inner product at any one directed edge. These spaces are Hilbert spaces:
  a Cauchy sequence has an $L^2$ limit at each index, and the equivariance identity for any fixed automorphism
  passes to the limits because that automorphism preserves $eta$.
  There are countably many indices, so equality in the indicated norm is equality of assignments.
  We use real spaces; the usual spectral theorem applies after complexification if needed.

On $cal(H)_(upright(v)) \( eta \)$ define the neighbor average

$ \( sans(A)_eta f \)_v = 1 / d sum_(u tilde.op v) f_u . $

Jensen’s inequality and invariance give $parallel sans(A)_eta parallel lt.eq 1$.
  For adjacent $o \, u$, an automorphism interchanging them gives $bb(E)_eta \[ f_o k_u \] =
  bb(E)_eta \[ f_u k_o \]$. Averaging this identity over the neighbors of $o$ proves that $sans(A)_eta$ is
  self-adjoint. It preserves the closed subspace of centered assignments $bb(E)_eta f_o = 0$.
  This subspace is reducing: if $y$ is orthogonal to it, then $chevron.l sans(A)_eta y \, f chevron.r =
  chevron.l y \, sans(A)_eta f chevron.r = 0$ for every centered $f$.
  Thus the restriction to that subspace is again self-adjoint.

#thm([Lemma 6.2.])[
  (Marginal vertex spectrum).  #emph[For the full observation law $nu$,
    the spectrum of $sans(A)_nu$ on centered vertex assignments is contained in $\[ - rho \, rho \]$, where
#[#set math.equation(numbering: n => "(6.2)")
 $ rho = frac(2 sqrt(b), d) < 1 . $ <eq:spectrum-rho>]

]
] <lem:marginal-spectrum>

#proof[
  We first prove a correlation bound for an assignment $f$ that is centered and measurable, at vertex $v$,
    from the entire observation paths at the vertices in a fixed ball $B_R \( v \)$.
    Square integrability is enough; write $parallel f parallel^2 = bb(E)_nu f_o^2$.
    Write $bb(E)_(upright("pl"))$ for expectation in the planted spin-and-Brownian construction,
    whose observation marginal is $nu$.
  Suppose that $"dist" \( u \, v \) = k > 2 R$, and let $a$ and $c$ be the respective endpoints of the path
    joining $B_R \( u \)$ to $B_R \( v \)$. Then $"dist" \( a \, c \) = k - 2 R$.
    In the planted broadcast construction, conditional on $\( sigma_a \, sigma_c \)$,
    the observation arrays in these two balls are independent.
    The conditional law in the first ball depends only on $sigma_a$, and the law in the second only on $sigma_c$.
    To see this, root the broadcast at $a$. Once the endpoint spins are fixed,
    the edge multipliers inside the two balls are taken from disjoint branches off the connecting path.
    They are independent of that path and of one another, and the Brownian paths at the two disjoint sets of
    vertices are independent as well. The assertion for products of square-integrable functions follows from its
    bounded version by truncation.
  The endpoint spins are uniform signs. Since $f_u \, f_v$ are centered, their conditional expectations have the form
  $ bb(E)_(upright("pl")) \[ f_u divides sigma_a \] = alpha_u sigma_a \, wide
    bb(E)_(upright("pl")) \[ f_v divides sigma_c \] = alpha_v sigma_c . $
  $L^2$-contraction of conditional expectation gives $\| alpha_u \| \, \| alpha_v \| lt.eq parallel f parallel$.
    The broadcast correlation along the connecting path is $bb(E)_(upright("pl")) \[ sigma_a sigma_c \] =
    theta^(k - 2 R)$. It follows that
  $ \| bb(E)_nu \[ f_u f_v \] \| = \| alpha_u alpha_v \| theta^(k - 2 R) lt.eq
    parallel f parallel^2 b^R b^(- k \/ 2) . $
  For $k lt.eq 2 R$ the same bound follows from Cauchy–Schwarz, since $b^R b^(- k \/ 2) gt.eq 1$.
    We have therefore proved
  #[#set math.equation(numbering: n => "(6.3)")
   $ \| bb(E)_nu \[ f_u f_v \] \| lt.eq C_f b^(- "dist" \( u \, v \) \/ 2) quad upright("for all ") u \, v \, wide
     C_f = b^R parallel f parallel^2 . $ <eq:local-correlation>]
  This calculation uses the planted spins to describe the law,
    while the assignment itself remains a function of the observations alone.
  We now turn spatial decay into an operator bound. Let $p_n \( o \, v \)$ be the $n$-step transition
    probabilities of simple random walk on the tree and put $q \( v \) = b^(- "dist" \( o \, v \) \/ 2)$.
    For the deterministic neighbor average $P$ on functions of vertices,
  $ \( P q \) \( v \) = rho q \( v \) quad \( v eq.not o \) \, wide \( P q \) \( o \) = b^(- 1 \/ 2) lt.eq
    rho q \( o \) . $
  The first identity uses one neighbor closer to $o$ and $b$ farther away.
    Positivity of $P$ gives $P^n q lt.eq rho^n q$ by induction, and hence
  $ sum_v p_n \( o \, v \) q \( v \) lt.eq rho^n . $
  Only finite-step random-walk averages are used here; $q$ need not belong to $ell^2 \( cal(V) \)$.
    Self-adjointness of $sans(A)_nu$, its finite-walk expansion, and (6.3) now give, for every $n gt.eq 0$,
  #[#set math.equation(numbering: n => "(6.4)")
   $ parallel sans(A)_nu^n f parallel^2 = chevron.l f \, sans(A)_nu^(2 n) f chevron.r =
     sum_v p_(2 n) \( o \, v \) bb(E)_nu \[ f_o f_v \] lt.eq C_f rho^(2 n) . $ <eq:marginal-even-moments>]
  Let $mu_f$ be the spectral measure of $f$ for the self-adjoint restriction of $sans(A)_nu$ to centered
    assignments. For $epsilon > 0$, (6.4) implies
  $ mu_f { \| lambda \| gt.eq rho + epsilon } lt.eq C_f (frac(rho, rho + epsilon))^(2 n) . $
  Letting $n arrow.r oo$ proves that $mu_f$ is supported on $\[ - rho \, rho \]$.
  It remains to pass from local assignments to all centered ones. For $f in cal(H)_(upright(v)) \( nu \)$ centered, let
  $ f_v^(\( R \)) =
    bb(E)_nu #h(-0.16667em) [f_v med mid(bar.v) med sigma { X_z \( s \) : z in B_R \( v \) \, med s gt.eq 0 }] . $
  These are centered square-integrable local assignments. To verify their equivariance,
    pull the conditional expectation at $gamma v$ back by a fixed automorphism $gamma$.
    Invariance of $nu$ pulls its conditioning sigma-field back to that for $B_R \( v \)$,
    and equivariance pulls its integrand back to $f_v$. Uniqueness of conditional expectation gives the required
    identity almost surely for that $gamma \, v$. As $R arrow.r oo$,
    the conditioning sigma-fields generate the complete observation array, so $f_o^(\( R \)) arrow.r
    f_o$ in $L^2$. This proves density of the local assignments just used.
    Equally, truncating and recentering $f$ first gives a bounded local dense family.
    The range of the corresponding spectral projection $upright(bold(1))_(\[ - rho \, rho \]) \( sans(A)_nu \)$ on
    the centered space is closed and contains every such local assignment.
    It is consequently the entire centered space, proving the lemma.
    Finally, $rho < 1$ follows from $d = b + 1$ and $\( b + 1 \)^2 - 4 b = \( b - 1 \)^2 > 0$. ◻
]

=== 6.2 Passing the bound to marginal differences <passing-the-bound-to-marginal-differences>

Fix the joining $pi$ in Proposition 16. For a marginal vertex or edge assignment define

$ \( delta f \) \( X \, X' \) = f \( X \) - f \( X' \) . $

This is well defined on the marginal $L^2$ equivalence classes: each coordinate under $pi$ has law $nu$.
  The same observation and the triangle inequality give $parallel delta f parallel_pi lt.eq
  2 parallel f parallel_nu$. In the joined assignment spaces put

$ cal(K) = overline(delta cal(H)_(upright(v)) \( nu \)) subset.eq cal(H)_(upright(v)) \( pi \) \, wide cal(D) =
  overline(delta cal(H)_(upright(e)) \( nu \)) subset.eq cal(H)_(upright(e)) \( pi \) \, $

where the closures use the respective $L^2 \( pi \)$ norms. These are closed linear spaces.

The vertex neighbor averages for $nu$ and $pi$ commute with $delta$,
  since they use the same finite sums over neighboring vertex indices. Thus $sans(A)_pi cal(K) subset.eq cal(K)$.
  The joined $sans(A)_pi$ is self-adjoint, so the same orthogonality argument as above shows that $cal(K)$ is
  reducing and its restriction $sans(A)_(cal(K)) := sans(A)_pi \|_(cal(K))$ is self-adjoint.

Subtracting the constant $bb(E)_nu f_o$ from a marginal vertex assignment does not change its difference.
  Lemma 17 therefore gives

#[#set math.equation(numbering: n => "(6.5)")
 $ parallel sans(A)_pi^n delta f parallel_pi = parallel delta \( sans(A)_nu^n \( f - bb(E)_nu f_o \) \)
   parallel_pi lt.eq 2 rho^n parallel f - bb(E)_nu f_o parallel_nu wide \( n gt.eq 0 \) . $ <eq:difference-powers>]

Applying the spectral-measure argument from (6.4) to the joined self-adjoint operator $sans(A)_pi$ shows that the
  spectral measure of $delta f$ is supported on $\[ - rho \, rho \]$.
  The constant on the right of (6.5) may depend on the chosen preimage $f$;
  only its exponential rate matters as $n arrow.r oo$. In particular,
  no lower comparison between $parallel delta f parallel_pi$ and $parallel f - bb(E)_nu f_o parallel_nu$ is used.
  The closed range of the joined spectral projection $upright(bold(1))_(\[ - rho \, rho \]) \( sans(A)_pi \)$
  contains the closure of all these differences. Hence

#[#set math.equation(numbering: n => "(6.6)")
 $ parallel sans(A)_(cal(K)) parallel lt.eq rho . $ <eq:difference-spectrum>]

This is the vertex estimate needed below. Its domain is $cal(K)$, the closed space generated by marginal differences.

=== 6.3 From vertices to nonbacktracking edge averages <from-vertices-to-nonbacktracking-edge-averages>

A vertex assignment can be read at either endpoint of a directed edge.
  We compare these two lifts and then isolate the part of an edge assignment orthogonal to both.
  On the joined assignment spaces define the tail and head lifts $sans(F) \, sans(H) :
  cal(H)_(upright(v)) \( pi \) arrow.r cal(H)_(upright(e)) \( pi \)$, the reversal $sans(J)$,
  and the forward nonbacktracking average $sans(N)$ by

$ \( sans(F) f \)_(\( i \, j \)) & = f_i \, & \( sans(H) f \)_(\( i \, j \)) & =
  f_j \, & \( sans(J) g \)_(\( i \, j \)) & = g_(\( j \, i \)) \,\
\( sans(N) g \)_(\( i \, j \)) & = 1 / b sum_(k tilde.op j\
k eq.not i) g_(\( j \, k \)) . $

Invariance makes the two lifts isometries and makes $sans(J)$ a self-adjoint isometry with $sans(J)^2 = I$.
  Jensen’s inequality makes $sans(N)$ a contraction. The adjoints of the lifts are

#[#set math.equation(numbering: n => "(6.7)")
 $ \( sans(F)^(*) g \)_v = 1 / d sum_(u tilde.op v) g_(\( v \, u \)) \, wide \( sans(H)^(*) g \)_v = 1 /
   d sum_(u tilde.op v) g_(\( u \, v \)) . $ <eq:lift-adjoints>]

Indeed, in the edge inner product we may average the fixed outgoing edge over all neighbors of its tail,
  because the tail stabilizer is transitive on those neighbors. This proves the first formula.
  Interchanging the endpoints first proves the second. In particular,

$ sans(F)^(*) sans(H) = sans(H)^(*) sans(F) = sans(A)_pi \, wide sans(J) sans(F) = sans(H) \, wide
  sans(J) sans(H) = sans(F) . $

Direct substitution in the definitions gives

#[#set math.equation(numbering: n => "(6.8)")
 $ sans(N) & = d / b thin sans(H) sans(F)^(*) - 1 / b thin sans(J) \, & sans(N)^(*) & = d /
   b thin sans(F) sans(H)^(*) - 1 / b thin sans(J) \,\
sans(N) sans(F) & = sans(H) \, & sans(N) sans(H) & = d / b thin sans(H) sans(A)_pi - 1 /
  b thin sans(F) . $ <eq:edge-operator>]

Thus $\( sans(N)^(*) g \)_(\( i \, j \)) = b^(- 1) sum_(k tilde.op i \, med k eq.not j)
  g_(\( k \, i \))$ and $sans(N)^(*) = sans(J) sans(N) sans(J)$.

The same formulas act on the marginal assignment spaces. They use finite sums over neighboring indices,
  selections of endpoint values, and edge reversal, so they commute with taking marginal differences.
  Apply this first on the ranges of $delta$, and then use boundedness to pass to their closures. We obtain

$ sans(F) cal(K) \, sans(H) cal(K) subset.eq cal(D) \, wide sans(F)^(*) cal(D) \,
  sans(H)^(*) cal(D) subset.eq cal(K) \, wide sans(J) cal(D) = cal(D) . $

Equation (6.8) now shows that both $sans(N)$ and $sans(N)^(*)$ preserve $cal(D)$.
  Thus $cal(D)$ is a reducing subspace for the nonbacktracking operator.

Define

$ sans(R) : cal(K) xor cal(K) arrow.r cal(D) \, wide sans(R) \( f \, g \) = sans(F) f + sans(H) g . $

The adjoint identities and (6.6) give

#[#set math.equation(numbering: n => "(6.9)")
 $ parallel sans(R) \( f \, g \) parallel^2 & = parallel f parallel^2 + parallel g parallel^2 + 2 chevron.l f \,
   sans(A)_(cal(K)) g chevron.r \,\
\( 1 - rho \) \( parallel f parallel^2 + parallel g parallel^2 \) & lt.eq
  parallel sans(R) \( f \, g \) parallel^2
  lt.eq \( 1 + rho \) \( parallel f parallel^2 + parallel g parallel^2 \) . $ <eq:lift-gram>]

Here $2 \| chevron.l f \, sans(A)_(cal(K)) g chevron.r \| lt.eq
  rho \( parallel f parallel^2 + parallel g parallel^2 \)$. Because $rho < 1$, $sans(R)$ is injective with closed range

$ cal(L) = sans(F) cal(K) + sans(H) cal(K) . $

In fact, the lower bound makes the preimages of a convergent sequence in the range Cauchy.
  It also gives $parallel sans(R)^(- 1) parallel lt.eq \( 1 - rho \)^(- 1 \/ 2)$ on $cal(L)$,
  while the upper bound gives $parallel sans(R) parallel lt.eq \( 1 + rho \)^(1 \/ 2)$.

For $y in cal(D) ⊖ cal(L)$, the vectors $sans(F)^(*) y \,
  sans(H)^(*) y$ lie in $cal(K)$ and are orthogonal to every vector in $cal(K)$;
  for example $chevron.l sans(F)^(*) y \, f chevron.r = chevron.l y \, sans(F) f chevron.r = 0$.
  Both therefore vanish. Reversal preserves $cal(D)$ and interchanges the two lifts in $cal(L)$,
  so it preserves $cal(D) ⊖ cal(L)$ as well. On this complement, (6.8) reduces to

#[#set math.equation(numbering: n => "(6.10)")
 $ sans(N) y = - b^(- 1) sans(J) y \, wide parallel sans(N)^n y parallel =
   b^(- n) parallel y parallel quad \( n gt.eq 0 \) . $ <eq:edge-complement>]

The space $cal(L)$ is also invariant under $sans(N)$ by (6.8).
  We have split $cal(D)$ into two orthogonal invariant spaces.
  The complement already decays geometrically; it remains to bound powers on the head and tail range.

On $cal(K) xor cal(K)$, (6.8) reads

$ sans(R)^(- 1) sans(N) sans(R) = sans(T) = mat(delim: "(", 0, - b^(- 1) I; I, \( d \/ b \) sans(A)_(cal(K))) . $

This matrix need not be normal. We bound its powers by its second-order recurrence. Put

$ sans(Z) = sqrt(b) thin sans(T) \, wide sans(B) = frac(d, 2 sqrt(b))
  mat(delim: "(", sans(A)_(cal(K)), 0; 0, sans(A)_(cal(K))) . $

The operator $sans(B)$ is self-adjoint and $parallel sans(B) parallel lt.eq 1$. Matrix multiplication gives

#[#set math.equation(numbering: n => "(6.11)")
 $ sans(Z) sans(B) = sans(B) sans(Z) \, wide sans(Z)^2 - 2 sans(B) sans(Z) + I = 0 . $ <eq:chebyshev-identity>]

Let $U_(- 1) = 0$, $U_0 = 1$, and $U_(m + 1) \( x \) = 2 x U_m \( x \) -
  U_(m - 1) \( x \)$ be the Chebyshev polynomials of the second kind. Induction using (6.11) gives

$ sans(Z)^n = U_(n - 1) \( sans(B) \) sans(Z) - U_(n - 2) \( sans(B) \) wide \( n gt.eq 1 \) . $

For $m gt.eq 0$, the trigonometric identity

$ U_m \( cos s \) = sum_(j = 0)^m e^(thin upright(i) \( m - 2 j \) s) $

gives $sup_(\[ - 1 \, 1 \]) \| U_m \| lt.eq m + 1$, including the endpoints.
  The spectral theorem applied to the self-adjoint contraction $sans(B)$ therefore yields

$ parallel sans(Z)^n parallel lt.eq n parallel sans(Z) parallel + \( n - 1 \) wide \( n gt.eq 1 \) . $

For completeness, the off-diagonal part of $sans(Z)$ has norm $sqrt(b)$,
  while its only nonzero diagonal block is $\( d \/ sqrt(b) \) sans(A)_(cal(K))$, of norm at most $2$.
  Thus $parallel sans(Z) parallel lt.eq sqrt(b) + 2$. At the allowed scalar endpoints $plus.minus
  1$ for $sans(B)$, the characteristic polynomial in (6.11) has a double root.
  The linear factor in $n$ accounts for this endpoint behavior.

Using $sans(T)^n = b^(- n \/ 2) sans(Z)^n$ and the two bounds for $sans(R)$ and $sans(R)^(- 1)$,
  we conclude that $parallel sans(N)^n \|_(cal(L)) parallel lt.eq C_d \( n + 1 \) b^(- n \/ 2)$.
  Together with (6.10) and the orthogonal invariant decomposition, this gives

#[#set math.equation(numbering: n => "(6.12)")
 $ parallel sans(N)^n \|_(cal(D)) parallel lt.eq C_d \( n + 1 \) b^(- n \/ 2) wide \( n gt.eq 0 \) .
   $ <eq:edge-power-bound>]

The same estimate holds for $\( sans(N)^(*) \)^n$ on $cal(D)$, by reversal.
  The spectral theorem was used only for the self-adjoint vertex averages and $sans(B)$;
  the edge estimate follows from the displayed recurrence.

=== 6.4 Summing the edge correlations <summing-the-edge-correlations>

Let $D = delta g in cal(D)$ be the difference in the proposition.
  Its mean at every directed edge is zero, since the two marginals are equal, and $parallel D parallel^2 = S$.
  Fix a directed simple path and write $e_i = \( v_(i - 1) \, v_i \)$.
  If $i < j$, invariance and transitivity on directed simple paths give

#[#set math.equation(numbering: n => "(6.13)")
 $ bb(E)_pi \[ D_(e_i) D_(e_j) \] = chevron.l D \, sans(N)^(j - i) D chevron.r_(upright(e) \, pi) .
   $ <eq:edge-lag-correlation>]

Indeed, $sans(N)^(j - i)$ averages over the $b^(j - i)$ nonbacktracking continuations of a fixed directed edge.
  On a tree each such continuation is simple. An automorphism carries it to the corresponding fixed subpath,
  so every term has the expectation on the left. This is a finite average of identities for fixed automorphisms.

By (6.12), the absolute value of the lag-$n$ correlation is at most $C_d \( n + 1 \) b^(- n \/ 2) S$.
  Expanding the square of the sum and grouping equal lags therefore gives

$ bb(E)_pi [(sum_(i = 1)^r D_(e_i))^2] & = r S + 2 sum_(n = 1)^(r - 1) \( r - n \) chevron.l D \, sans(N)^n D chevron.r\
 & lt.eq r S (1 + 2 C_d sum_(n = 1)^oo \( n + 1 \) b^(- n \/ 2)) lt.eq C'_d r S . $

The series converges because $b gt.eq 2$. If all edges are reversed, order them as $\( v_r \, v_(r - 1) \) \,
  dots.h \, \( v_1 \, v_0 \)$. They are the forward edges of the reversed simple path,
  and their sum is unchanged by this reordering. The same argument proves the second inequality of (6.1).

Finally, take $pi$ to be the $\( X \, X' \)$-marginal of the joining in Proposition 13,
  forgetting its common innovation coordinate. At a fixed finite time $t$, use

$ g_(\( i \, j \)) \( X \) = log a \( h_(j arrow.r i) \( t \) \) . $

The component versions constructed earlier make this an equivariant marginal assignment.
  The cavity field bound and $\( log a \) \( 0 \) = 0$, $\| \( log a \)' \| lt.eq 2$, imply

$ \| g_(\( i \, j \)) \( X \) \| lt.eq 2 \| h_(j arrow.r i) \( t \) \| lt.eq
  2 #scale(x: 120%, y: 120%)[\(] \| X_j \( t \) \| + b beta #scale(x: 120%, y: 120%)[\)] . $

Since $bb(E)_nu X_j \( t \)^2 = t + t^2$, it is square integrable.
  Its difference is precisely $D_(\( i \, j \)) \( t \)$. Applying the general estimate completes the proof of
  Proposition 16. The bound is uniform in the time and in the joining because its constant depends only on $d$.

== 7 Attenuation with dependent path weights <sec:path-averages>

The path variance estimate controls sums of edge discrepancies,
  but the critical comparison also needs decay of the products multiplying those sums.
  Those products and differences depend on the same observations.
  We therefore average over paths before using the variance estimate.
  Keeping the first half of a path fixed gives an outward continuation;
  keeping the second half fixed requires enumerating the first half backward.
  This is why we need concentration in both directions.

Throughout this section, $b = d - 1 gt.eq 2$, $theta = b^(- 1 \/ 2)$, and $omega \( t \) = min { sqrt(t) \, 1 }$.
  We first fix $t > 0$ and work with the spins and observations in the planted realization of one marginal.
  All fields below are evaluated at this time, which we usually suppress.
  In particular, $h_(v arrow.r w)$ is the previously chosen measurable function of the observation history in
  $T_(v arrow.r w)$ alone. We use the shifted estimate from one branch (3.7):
  for an intact infinite component attached to a spin $sigma_w$, every real $z$, and either value $s$ of that spin,

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E)
   [a #scale(x: 120%, y: 120%)[\(] z + psi \( h_(v arrow.r w) \) #scale(x: 120%, y: 120%)[\)]^2 divides sigma_w =
   s] lt.eq 1 - c_0 omega \( t \) \, wide 0 < c_0 lt.eq 1 / 2 . $ <eq:path-shift-input>]

Here $c_0$ depends only on $d$. The shift may be fixed by conditioning on other variables as long as the selected
  component retains its law conditional on its attaching spin.
  This is the only quantitative information estimate used in the present section.

=== 7.1 Products in both directions <products-in-both-directions>

For a vertex $z$ and either the empty set or a singleton $F subset.eq { u : u tilde.op z }$,
  let $cal(P)_ell \( z \; F \)$ consist of the simple paths $gamma = \( z_0 \, dots.h \, z_ell \)$ that start at
  $z$ and, when $ell gt.eq 1$, have $z_1 in.not F$. Thus

$ \| cal(P)_ell \( z \; F \) \| = \( d - \| F \| \) b^(ell - 1) quad \( ell gt.eq 1 \) \, wide
  cal(P)_0 \( z \; F \) = { \( z \) } . $

Define the two squared products and their averages over paths by

$ R_gamma^(+) & = product_(i = 1)^ell a \( h_(z_i arrow.r z_(i - 1)) \)^2 \, & G_ell^(+) \( z \; F \) & =
  frac(1, \| cal(P)_ell \( z \; F \) \|) sum_(gamma in cal(P)_ell \( z \; F \)) R_gamma^(+) \,\
R_gamma^(-) & = product_(i = 1)^ell a \( h_(z_(i - 1) arrow.r z_i) \)^2 \, & G_ell^(-) \( z \; F \) & =
  frac(1, \| cal(P)_ell \( z \; F \) \|) sum_(gamma in cal(P)_ell \( z \; F \)) R_gamma^(-) . $

Empty products are one, so $G_0^(+) = G_0^(-) = 1$. We call the products outward and inward according to the
  coefficient traversal: $R^(+)$ is traversed from $z_0$ to $z_ell$, and $R^(-)$ from $z_ell$ to $z_0$.
  In each factor the field arrow names the component root and its excluded neighbor,
  and points opposite to that coefficient traversal.

We will split the path at an intermediate vertex and average its continuations inside disjoint descendant
  components. Outward continuation products already use only their descendant observations.
  An inward product can also see the observations above the split.
  The next lemma removes the one entering message that causes this dependence.

#thm([Lemma 7.1.])[
  (A continuation below a cut).  #emph[Let $y$ and $p$ be adjacent vertices, and root the component $cal(T)_y =
    T_(y arrow.r p)$ at $y$. Write $"Ch" \( w \)$ for the children of $w$ in this component.
    For a descendant path $y = w_0 \, w_1 \, dots.h \, w_L$ of length $L gt.eq 1$, set $H_i =
    h_(w_i arrow.r w_(i + 1))$ for $0 lt.eq i < L$ and define
#[#set math.equation(numbering: n => "(7.2)")
 $ tilde(H)_0 & = X_y + sum_(u in "Ch" \( y \) \\ { w_1 }) psi \( h_(u arrow.r y) \) \,\
tilde(H)_i & = X_(w_i) + psi \( tilde(H)_(i - 1) \) + sum_(u in "Ch" \( w_i \) \\ { w_(i + 1) })
  psi \( h_(u arrow.r w_i) \) \, wide 1 lt.eq i < L . $ <eq:inward-cut-recursion>]

 Each $tilde(H)_i$ is a function only of the observations in $cal(T)_y$. With
$ C_(upright("cut")) = exp #h(-0.16667em) (frac(4 beta, 1 - theta)) \, $

 the original and modified inward products obey, almost surely,
#[#set math.equation(numbering: n => "(7.3)")
 $ lr(|log frac(product_(i = 0)^(L - 1) a \( H_i \)^2, product_(i = 0)^(L - 1) a \( tilde(H)_i \)^2)|) lt.eq
   frac(4 beta, 1 - theta) . $ <eq:path-cut-cost>]

 Moreover, conditional on the true spins of this path, both the outward product and the modified inward product satisfy
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E)
   [product_(i = 1)^L a \( h_(w_i arrow.r w_(i - 1)) \)^2 thin mid(bar.v) thin sigma_(w_0) \, dots.h \,
   sigma_(w_L)] & lt.eq e^(- c_0 omega \( t \) L) \,\
bb(E) [product_(i = 0)^(L - 1) a \( tilde(H)_i \)^2 thin mid(bar.v) thin sigma_(w_0) \, dots.h \, sigma_(w_L)] &
  lt.eq e^(- c_0 omega \( t \) L) . $ <eq:cut-continuation-attenuation>]

 The constants are independent of $t$, $L$, and the choice of path.]
] <lem:cut-continuation>

#proof[
  The recurrence deletes only the contribution from $p$ at $y$ and propagates that change forward;
    every field from a side child is unchanged. All these fields use components contained in $cal(T)_y$,
    so the claimed locality follows by induction. The modified fields are used as functions of the descendant
    observations; no posterior interpretation for a truncated model is needed.
  The cavity identity gives $H_0 - tilde(H)_0 = psi \( h_(p arrow.r y) \)$.
    At each subsequent step, only the predecessor message differs.
    Since $\| psi \| lt.eq beta$ and $\| psi' \| lt.eq theta$, induction yields
  $ \| H_i - tilde(H)_i \| lt.eq beta theta^i wide \( 0 lt.eq i < L \) . $
  The bound $\| \( log a \)' \| lt.eq 2$ from (5.9) now gives
  $ lr(|log frac(product_(i = 0)^(L - 1) a \( H_i \)^2, product_(i = 0)^(L - 1) a \( tilde(H)_i \)^2)|) lt.eq
    4 sum_(i = 0)^(L - 1) \| H_i - tilde(H)_i \| lt.eq 4 beta sum_(i = 0)^(L - 1) theta^i lt.eq
    frac(4 beta, 1 - theta) . $
  This proves (7.3). In particular, obtaining component locality costs a multiplicative factor at most
    $C_(upright("cut"))$, independent of the length and time.
  The outward inequality in (7.4) is the conditional path estimate of Lemma 6, applied to $w_0 \, dots.h \, w_L$.
    We prove the modified inward inequality by integrating intact side components from the far end back toward the cut.
  At each target $w_i$, $0 lt.eq i < L$, choose one child off the path, using only the path geometry.
    There are $b - 1 = d - 2 gt.eq 1$ choices, including at $w_0$ after deleting its parent and excluding $w_1$.
    The selected child components are disjoint and infinite; this also covers $d = 3$ and $L = 1$.
  Condition on the true path spins. The selected component observation histories are independent of each other and
    of the remaining observation histories, and their laws depend only on the attaching path spins.
    Indeed, root the broadcast at $w_0$ and group each selected component’s attaching-edge transition,
    internal transitions, and Brownian noises. These groups are mutually independent;
    once the path spins are specified, the observations outside the selected components use none of them.
    This factorization passes from finite cylinder events to the sigma-fields of the full observation histories.
    Thus fixing the other observation histories leaves each selected component with exactly the conditional law
    used in (7.1).
  Integrate the selected components in the order $w_(L - 1) \, w_(L - 2) \, dots.h \, w_0$.
    In (7.2), $tilde(H)_i$ is its selected side message plus a shift fixed by the other observations.
    Every field still present after its factor is removed has index less than $i$ and does not use that message.
    Equation (7.1) therefore removes each squared factor at a cost at most $1 - c_0 omega \( t \)$.
    The resulting bound is $\( 1 - c_0 omega \( t \) \)^L lt.eq e^(- c_0 omega \( t \) L)$, as required. ◻
]

#thm([Proposition 7.2.])[
  (Concentration of path averages).  #emph[Set
$ eta = min {c_0 / 4 \, frac(log b, 8)} \, wide C_0 = max {2 \, frac(4 log 2, c_0)} \, wide
  ell_(*) \( t \) = ⌈frac(C_0, omega \( t \))⌉ . $

 For every $t > 0$, every vertex $z$, every allowed first-step restriction $F$,
   either orientation $epsilon in { + \, - }$, and every integer $ell gt.eq ell_(*) \( t \)$,
#[#set math.equation(numbering: n => "(7.5)")
 $ bb(P) (G_ell^epsilon \( z \; F \) > C_(upright("cut")) e^(- eta omega \( t \) ell)) lt.eq
   exp (- frac(b^(ell \/ 4), 2 b)) . $ <eq:double-exp>]

 The constants depend only on $d$ and are uniform in the time, vertex, first-step restriction, and orientation.]
] <prop:path-average>

#proof[
  Root the tree at $z$ and put $k = floor.l ell \/ 2 floor.r$ and $L = ell - k$.
    The threshold ensures $k gt.eq 1$. Let $cal(Y)_k$ be the vertices at depth $k$ whose path from $z$ obeys the
    restriction $F$. There are
  #[#set math.equation(numbering: n => "(7.6)")
   $ N := \| cal(Y)_k \| = \( d - \| F \| \) b^(k - 1) gt.eq b^k $ <eq:path-level-size>]
  such vertices, and each has exactly $b^L$ descendant continuations of length $L$.
    Since every squared factor lies in $\( 0 \, 1 \]$, deleting the first $k$ factors increases either product.
    The average of the remaining products is consequently an equal-weight average of $N$ continuation averages.
  For $y in cal(Y)_k$, let $p \( y \)$ be its parent and $cal(T)_y = T_(y arrow.r p \( y \))$.
    Let $Z_y^(+)$ be the average of
  $ product_(i = 1)^L a \( h_(w_i arrow.r w_(i - 1)) \)^2 $
  over its $b^L$ continuations $y = w_0 \, dots.h \, w_L$. Let $Z_y^(-)$ be the average of
    $product_(i = 0)^(L - 1) a \( tilde(H)_i \)^2$ for the same continuations,
    using (7.2) separately for each one. Both variables lie in $\[ 0 \, 1 \]$ and are functions only of the
    observation histories in $cal(T)_y$. Deleting the first $k$ factors and applying (7.3) gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ G_ell^epsilon \( z \; F \) lt.eq C_(upright("cut")) / N sum_(y in cal(Y)_k) Z_y^epsilon \, wide
     epsilon in { + \, - } . $ <eq:path-descendant-average>]
  For $+$ the multiplier can be replaced by one.
  Averaging (7.4) first over the continuation spins conditional on $sigma_y$,
    and then over the continuation choices, yields
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E) \[ Z_y^epsilon divides sigma_y \] lt.eq e^(- c_0 omega \( t \) L) \, wide
     epsilon in { + \, - } . $ <eq:path-component-mean>]
  Now condition on the sigma-field of true cut-level spins
  $ cal(H)_k = sigma \( sigma_y : y in cal(Y)_k \) . $
  The observations in the disjoint components $cal(T)_y$ are independent under this conditioning,
    with each component law depending only on its own root spin.
    Indeed, after specifying the cut-level spins, all broadcast transitions and Brownian noises strictly below the
    cut, together with the Brownian noise at each cut vertex,
    can be sampled independently across these components. The same statement holds when $F$ forbids one first
    neighbor, since that simply omits one collection of components.
    The cut-level spins themselves need not be independent. Thus the $Z_y^epsilon$ are conditionally independent
    variables in $\[ 0 \, 1 \]$, and their conditional means given $cal(H)_k$ satisfy (7.8).
  Write $tau_ell = e^(- eta omega \( t \) ell)$. Since $L gt.eq ell \/ 2$, $omega \( t \) ell gt.eq C_0$,
    and $eta lt.eq c_0 \/ 4$, the chosen constants give
  $ bb(E) \[ Z_y^epsilon divides cal(H)_k \] lt.eq e^(- c_0 omega \( t \) ell \/ 2) lt.eq 1 / 2 tau_ell . $
  Apply Hoeffding’s bounded-sum inequality #cite(label("Hoeffding1963")) Theorem 2 to each conditional product
    law. Because the distance from the conditional mean of the average to $tau_ell$ is at least $tau_ell \/ 2$, it gives
  $ bb(P) (1 / N sum_y Z_y^epsilon > tau_ell thin mid(bar.v) thin cal(H)_k) & lt.eq exp (- 2 N \( tau_ell \/ 2 \)^2)\
 & = exp (- 1 / 2 N e^(- 2 eta omega \( t \) ell)) lt.eq exp (- frac(b^(ell \/ 4), 2 b)) . $
  For the last inequality, $k gt.eq ell \/ 2 - 1$, $omega \( t \) lt.eq 1$, and $2 eta lt.eq \( log b \) \/ 4$ imply
  $ N e^(- 2 eta omega \( t \) ell) gt.eq b^(ell \/ 2 - 1) e^(- \( log b \) ell \/ 4) = b^(ell \/ 4) \/ b . $
  The conditional bound holds almost surely. Taking expectations and using (7.7) proves (7.5). ◻
]

Here is the consequence that makes concentration useful for dependent weights.
  Let $zeta$ be any bounded nonnegative random variable on a probability space carrying an observation array with
  the planted marginal law. It may also depend on further variables coupled to that array.
  For $ell gt.eq ell_(*) \( t \)$, split according to the event in (7.5);
  on its complement use the displayed bound for $G_ell^epsilon$, and on the event use $G_ell^epsilon lt.eq 1$. Then

#[#set math.equation(numbering: n => "(7.9)")
 $ bb(E) \[ zeta G_ell^epsilon \( z \; F \) \] lt.eq C_(upright("cut")) e^(- eta omega \( t \) ell) bb(E) zeta +
   parallel zeta parallel_oo epsilon_ell \, wide epsilon_ell :=
   exp (- frac(b^(ell \/ 4), 2 b)) . $ <eq:dependent-average-bound>]

Only the observation marginal enters the event probability.
  The principal term therefore pays the mean of the weight even when the weight depends on all those observations.

=== 7.2 Averaging with the discrepancy weights <averaging-with-the-discrepancy-weights>

Return to the invariant joined law of the two observation copies.
  Recall from (5.11) that, on a directed path $v_0 \, dots.h \, v_r$ with $e_i = \( v_(i - 1) \, v_i \)$,

$ P_r = product_(i = 1)^r a \( h_(v_i arrow.r v_(i - 1)) \) \, quad Q_r =
  bb(E) [\( P_r^2 + \( P'_r \)^2 \) (sum_(i = 1)^r D_(e_i))^2] \, quad L_r = bb(E) \[ \( Delta h_(v_0) \)^2 P_r^2 \] . $

Here $D_(\( i \, j \)) = log a \( h_(j arrow.r i) \) - log a \( h'_(j arrow.r i) \)$, $S = bb(E) D_e^2$, and $V =
  bb(E) \( Delta h_v \)^2$. Invariance makes $S \, V \, Q_r \, L_r$ independent of the chosen edge, vertex,
  or directed path of that length. The path averages below use that invariance and leave all observation fields
  unconditioned.

#thm([Proposition 7.3.])[
  (Weighted path bounds).  #emph[For every finite $T > 0$ there are $c \, C > 0$, depending only on $d$,
    and $C_T < oo$, depending also on $T$, such that for $0 < t lt.eq T$ and every integer $r gt.eq 2 ell_(*) \( t \)$,
#[#set math.equation(numbering: n => "(7.10)")
 $ Q_r \( t \) & lt.eq C e^(- c omega \( t \) r) thin r S \( t \) + C_T r^2 exp \( - c b^(c r) \) \,\
L_r \( t \) & lt.eq C e^(- c omega \( t \) r) thin V \( t \) + C_T exp \( - c b^(c r) \) . $ <eq:weighted-paths>]

 At every integer $r gt.eq 1$, without a lower length restriction,
#[#set math.equation(numbering: n => "(7.11)")
 $ Q_r \( t \) lt.eq 2 C_(upright("var")) r S \( t \) \, wide L_r \( t \) lt.eq V \( t \) \, $ <eq:unweighted-bounds>]

 where $C_(upright("var"))$ is the constant in Proposition 16.
   The hypothesis for (7.10) follows in particular from $r gt.eq 2 \( C_0 + 1 \) \/ omega \( t \)$.]
] <prop:weighted-paths>

#proof[
  Fix $T$ and put
  $ H_T = 2 T + 2 d beta \, wide D_(max \, T) = frac(2 H_T, 1 - theta) . $
  The site bound (5.5), the component comparison (5.8), and $\| \( log a \)' \| lt.eq 2$ imply
  #[#set math.equation(numbering: n => "(7.12)")
   $ \| Delta h_v \| lt.eq H_T \, wide \| Delta h_(j arrow.r i) \| lt.eq frac(H_T + theta H_T, 1 - theta^2) =
     frac(H_T, 1 - theta) \, wide \| D_e \| lt.eq D_(max \, T) . $ <eq:path-discrepancy-bound>]
  Dropping $P_r^2 \, \( P'_r \)^2 lt.eq 1$ and applying Proposition 16 gives the first bound in (7.11);
    dropping $P_r^2$ gives the second.
  For the longer paths, set
  $ p = floor.l r \/ 2 floor.r \, wide q = r - p \, wide U = sum_(i = 1)^p D_(\( v_(i - 1) \, v_i \)) \, wide Z =
    sum_(i = p + 1)^r D_(\( v_(i - 1) \, v_i \)) . $
  Since $\( U + Z \)^2 lt.eq 2 U^2 + 2 Z^2$,
  #[#set math.equation(numbering: n => "(7.13)")
   $ Q_r lt.eq 2 bb(E) \[ \( P_r^2 + \( P'_r \)^2 \) U^2 \] +
     2 bb(E) \[ \( P_r^2 + \( P'_r \)^2 \) Z^2 \] . $ <eq:path-half-split>]
  Figure 1 displays the two path averages that control these terms.
  First fix the prefix $\( v_0 \, dots.h \, v_p \)$ and vary all length-$q$ extensions from $v_p$ that avoid
    $v_(p - 1)$ on their first step. The pointwise stabilizer of the prefix is transitive on these extensions:
    map the successive descendant branches of one extension to those of the other,
    and extend independently to the remaining regular rooted subtrees.
    The invariance of the joined law consequently makes the expectation of the product for each complete path,
    multiplied by $U^2$, the same for every extension. In a fixed joined observation configuration,
    $U$ also denotes the same quantity in every term of this finite average:
    its indexed directed edges stay fixed. This statement places no locality restriction on their fields.
    Dropping the prefix factors from the product gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ bb(E) \[ P_r^2 U^2 \] lt.eq bb(E) \[ U^2 G_q^(+) \( v_p \; { v_(p - 1) } \) \] . $ <eq:prefix-extension-average>]
  For the other term, fix the suffix $\( v_p \, dots.h \, v_r \)$ and vary a reversed prefix $w_0 = v_p \, w_1 \,
    dots.h \, w_p$ with $w_1 eq.not v_(p + 1)$. The resulting complete directed path is
  $ \( w_p \, w_(p - 1) \, dots.h \, w_1 \, v_p \, v_(p + 1) \, dots.h \, v_r \) . $
  The pointwise stabilizer of the suffix is transitive on these choices;
    it may move the original starting vertex $v_0$, which invariance under the full automorphism group permits.
    The suffix sum $Z$ has the same indexed edges in every term.
    In the direction of the complete path, its prefix product is exactly
  $ product_(i = 1)^p a \( h_(w_(i - 1) arrow.r w_i) \)^2 \, $
  the inward product along the reversed geometric prefix. Dropping the suffix factors therefore yields
  #[#set math.equation(numbering: n => "(7.15)")
   $ bb(E) \[ P_r^2 Z^2 \] lt.eq bb(E) \[ Z^2 G_p^(-) \( v_p \; { v_(p + 1) } \) \] . $ <eq:suffix-extension-average>]
  Each path average is finite. Thus its use of equivariance requires only a finite intersection of almost-sure
    identities for fixed automorphisms, consistent with the theorem’s convention.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 0), [$v_0$], anchor: "east")
  circle((4.65, 0), radius: 0.07484, fill: black, stroke: none)
  content((4.65, -0.03528), [$v_p$], anchor: "north")
  circle((9.3, 0), radius: 0.07484, fill: black, stroke: none)
  content((9.335, 0), [$v_r$], anchor: "west")
  line((0, 0), (4.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.325, 0.1058), [#text(size: 9pt)[fixed prefix: $U$]], anchor: "south", padding: 0.1176cm)
  line((4.65, 0), (9.3, -0.35), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((4.65, 0), (9.3, 0), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((4.65, 0), (9.3, 0.35), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((5.425, 0.62), (8.525, 0.62), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.975, 0.98), [#text(size: 9pt)[average suffix: $G_q^+$]])
  circle((0, -2.1), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, -2.1), [$w_p$], anchor: "east")
  circle((4.65, -2.1), radius: 0.07484, fill: black, stroke: none)
  content((4.65, -2.135), [$v_p$], anchor: "north")
  circle((9.3, -2.1), radius: 0.07484, fill: black, stroke: none)
  content((9.335, -2.1), [$v_r$], anchor: "west")
  line((4.65, -2.1), (0, -2.45), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((4.65, -2.1), (0, -2.1), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((4.65, -2.1), (0, -1.75), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((4.65, -2.1), (9.3, -2.1), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((6.975, -1.994), [#text(size: 9pt)[fixed suffix: $Z$]], anchor: "south", padding: 0.1176cm)
  line((3.875, -1.48), (0.775, -1.48), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.325, -1.12), [#text(size: 9pt)[average reversed prefix: $G_p^-$]])
})],
    caption: [Figure 1: The two averages in the half-path argument. Solid halves are fixed and dashed halves are varied; each segment represents a half-path, with one representative pair of endpoints labeled. Arrows show the direction in which geometric extensions are enumerated. In the lower row, the prefix is enumerated from $v_p$ toward $w_p$, while its coefficients are traversed from $w_p$ to $v_p$, giving the inward average $G_p^(-)$. The observation fields remain unconditioned. ],
  ) <fig:half-path-averages>
  Suppose $r gt.eq 2 ell_(*) \( t \)$. Then $p \, q gt.eq ell_(*) \( t \)$.
    Apply (7.9) to the right side of (7.14) with $zeta = U^2$.
    The unconditional path variance bound and (7.12) give $bb(E) U^2 lt.eq
    C_(upright("var")) p S$ and $parallel U^2 parallel_oo lt.eq p^2 D_(max \, T)^2$. Hence
  #[#set math.equation(numbering: n => "(7.16)")
   $ bb(E) \[ P_r^2 U^2 \] lt.eq C_(upright("cut")) C_(upright("var")) e^(- eta omega \( t \) q) p S +
     D_(max \, T)^2 p^2 epsilon_q . $ <eq:weighted-prefix>]
  Applying the same bound to (7.15), now with $zeta = Z^2$, gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ bb(E) \[ P_r^2 Z^2 \] lt.eq C_(upright("cut")) C_(upright("var")) e^(- eta omega \( t \) p) q S +
     D_(max \, T)^2 q^2 epsilon_p . $ <eq:weighted-suffix>]
  These applications use the probability, under the joined law,
    of the corresponding event determined by one observation marginal.
    They do not require a conditional variance bound or independence of that event from the discrepancy.
    The identical reasoning applies to $\( P'_r \)^2$ using the second marginal’s path averages.
  For $r gt.eq 2$, both $p$ and $q$ are at least $r \/ 3$. Inserting the four estimates into (7.13),
    and using $p + q = r$ and $p^2 + q^2 lt.eq r^2$, proves the explicit inequality
  #[#set math.equation(numbering: n => "(7.18)")
   $ Q_r lt.eq 4 C_(upright("cut")) C_(upright("var")) e^(- eta omega \( t \) r \/ 3) r S +
     4 D_(max \, T)^2 r^2 exp (- frac(b^(r \/ 12), 2 b)) . $ <eq:weighted-path-explicit>]
  Finally fix $v_0$ and average the entire directed path over $cal(P)_r \( v_0 \; diameter \)$.
    The stabilizer of $v_0$ is transitive on these paths, and the vertex quantity $Delta
    h_(v_0)$ is fixed in every term. Invariance gives the exact identity
  $ L_r = bb(E) \[ \( Delta h_(v_0) \)^2 G_r^(+) \( v_0 \; diameter \) \] . $
  For $r gt.eq ell_(*) \( t \)$, use (7.9) with $zeta = \( Delta h_(v_0) \)^2$,
    whose mean is $V$ and whose essential supremum is at most $H_T^2$. This yields
  #[#set math.equation(numbering: n => "(7.19)")
   $ L_r lt.eq C_(upright("cut")) e^(- eta omega \( t \) r) V +
     H_T^2 exp (- frac(b^(r \/ 4), 2 b)) . $ <eq:weighted-root-explicit>]
  Choosing one sufficiently small positive $c$ in the two explicit bounds gives (7.10).
    Finally, $ell_(*) \( t \) lt.eq \( C_0 + 1 \) \/ omega \( t \)$ since $omega \( t \) lt.eq 1$,
    which proves the stated sufficient length condition. ◻
]

== 8 Critical comparison and recovery <sec:uniqueness-factor>

We now show that two conditional copies with the same innovations agree at the critical parameter $theta =
  b^(- 1 \/ 2)$, where $b = d - 1 gt.eq 2$. The weighted path estimates reduce the question to the variance
  $V \( t \) = bb(E) \[ \( Delta h_o \( t \) \)^2 \]$ of the site-field difference.
  Their principal noise term has the scale

$ S \( t \) sum_(r gt.eq 1) r e^(- c sqrt(t) thin r) asymp frac(S \( t \), t) wide \( t arrow.b 0 \) \, $

where $S \( t \) = bb(E) \[ D_e \( t \)^2 \]$ and $D_(\( i \, j \)) = log a \( h_(j arrow.r i) \) -
  log a \( h'_(j arrow.r i) \)$. The earlier estimate $S lt.eq C V$ would leave a coefficient $1 \/ t$,
  which is not integrable at zero. We improve it by using the fact that $\( log a \)'$ vanishes at the origin.
  A field is usually small at early times; the first result below makes the exceptional probability small enough
  to compare it with any positive value of $V$.

=== 8.1 All moments and a small-field tail <all-moments-and-a-small-field-tail>

We use the fixed-time posterior identities and critical information estimate already proved for one observation
  process. At a deterministic time $t > 0$, fix an oriented edge $v arrow.r w$ and write

$ Y = h_(v arrow.r w) \( t \) \, wide M \( t \) = bb(E) tanh^2 Y . $

The law of $Y$ is independent of the choice of edge and is symmetric.
  Recall that $M \( t \) lt.eq C sqrt(t)$ for $0 < t lt.eq 1$, that $\| Y - X_v \( t \) \| lt.eq b beta$,
  and that $X_v \( t \) = t sigma_v + sqrt(t) thin G$ with $G$ a standard normal variable independent of the spin.
  These are statements about the planted observation law. Each marginal of the conditional coupling has this same law.

The second moment is critical because $b theta^2 = 1$, whereas $b theta^p < 1$ for every integer $p gt.eq 3$;
  this strict contraction lets the recursion propagate the second-moment scale to every higher integer order.

#thm([Lemma 8.1.])[
  (Critical field moments and tail).  #emph[There are constants $0 < K < oo$ and $t_0 in \( 0 \, 1 \)$,
    depending only on $d$, such that for every integer $p gt.eq 1$ and every $0 < t lt.eq t_0$,
#[#set math.equation(numbering: n => "(8.1)")
 $ bb(E) \| h_(v arrow.r w) \( t \) \|^p lt.eq e^(K p^2) t^(p \/ 4) . $ <eq:critical-all-moments>]

 There are also $c > 0$ and $t_(upright("tail")) in \( 0 \, t_0 \]$ such that
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \| h_(v arrow.r w) \( t \) \| > t^(1 \/ 8) #scale(x: 120%, y: 120%)[\)]
   lt.eq exp #scale(x: 120%, y: 120%)[\(] - c log^2 \( 1 \/ t \) #scale(x: 120%, y: 120%)[\)] \, wide 0 < t lt.eq
   t_(upright("tail")) . $ <eq:critical-field-tail>]

 Both inequalities hold as well when conditioned on either value of the component-root spin $sigma_v$,
   or on either value of the deleted-neighbor spin $sigma_w$.]
] <lem:critical-tail>

#proof[
  We begin with the second moment. On ${ \| X_v \( t \) \| lt.eq 1 }$ the cavity bound gives $\| Y \| lt.eq 1 +
    b beta$. Comparison on this compact interval therefore gives $Y^2 lt.eq C tanh^2 Y$.
    On its complement we use $Y^2 lt.eq 2 X_v \( t \)^2 + 2 b^2 beta^2$.
    For $t lt.eq 1 \/ 2$, the event $\| t sigma_v + sqrt(t) thin G \| > 1$ requires $\| G \| >
    1 \/ \( 2 sqrt(t) \)$. Integration of the normal density,
    decreasing the positive exponent constant if necessary, yields
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( 1 + X_v \( t \)^2 \) upright(bold(1))_({ \| X_v \( t \) \| > 1 })
    #scale(x: 120%, y: 120%)[\]] lt.eq C e^(- c \/ t) . $
  Combining the two events with $M \( t \) lt.eq C sqrt(t)$ proves that, after fixing some $t_0 lt.eq 1 \/ 2$,
  #[#set math.equation(numbering: n => "(8.3)")
   $ A_2 \( t \) := bb(E) \| Y \|^2 lt.eq C sqrt(t) \, wide A_1 \( t \) := bb(E) \| Y \| lt.eq
     C^(1 \/ 2) t^(1 \/ 4) quad \( 0 < t lt.eq t_0 \) . $ <eq:critical-moment-base>]
  The second inequality is Cauchy–Schwarz. The cavity bound also shows that $A_p \( t \) :=
    bb(E) \| Y \|^p$ is finite for every integer $p gt.eq 1$.
  We next explain why the recursion can be expanded using independent terms without changing these absolute
    moments. For an integrable function $f$, the spin-tilt identities from the posterior calculation are
  $ bb(E) \[ f \( Y \) divides sigma_v = eta \] & = bb(E) \[ f \( Y \) \( 1 + eta tanh Y \) \] \,\
bb(E) \[ f \( Y \) divides sigma_w = eta \] & = bb(E) \[ f \( Y \) \( 1 + eta theta tanh Y \) \] \, wide
  eta in { - 1 \, 1 } . $
  These are the identities (3.6) from Lemma 5. Because $Y$ has a symmetric marginal law,
    the term containing $tanh Y$ integrates to zero against every even function of $Y$.
    In particular conditioning on either spin leaves each $A_p \( t \)$ unchanged.
  Condition now on $sigma_v = + 1$ in the cavity recursion at $v$.
    The own observation and the $b$ child-component observations are independent under this conditional law:
    their spin transitions and their planted noises lie in disjoint branches given the root spin.
    The own observation has law $t + sqrt(t) thin G$. A child field is conditioned through its deleted-neighbor
    spin, so the even-function consequence of the second tilt gives, for every integer $r gt.eq 1$,
  #[#set math.equation(numbering: n => "(8.4)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] \| psi \( h_(u arrow.r v) \( t \) \) \|^r divides sigma_v = +
     1 #scale(x: 120%, y: 120%)[\]] = bb(E) \| psi \( Y \) \|^r lt.eq
     theta^r A_r \( t \) . $ <eq:child-absolute-moments>]
  Here $psi \( 0 \) = 0$ and $0 < psi' \( z \) lt.eq theta$ imply $\| psi \( z \) \| lt.eq theta \| z \|$.
  There is an absolute constant $K_0$ such that
  #[#set math.equation(numbering: n => "(8.5)")
   $ bb(E) \| t + sqrt(t) thin G \|^r lt.eq e^(K_0 r^2) t^(r \/ 4)
     wide \( r gt.eq 1 upright(" an integer") \, med 0 < t lt.eq 1 \) . $ <eq:own-gaussian-moments>]
  Indeed, $\| t + sqrt(t) thin G \| lt.eq sqrt(t) \( 1 + \| G \| \)$ in this time range,
    and $bb(E) \| G \|^r lt.eq \( C sqrt(r) \)^r$. The inequality $\( x + y \)^r lt.eq
    2^(r - 1) \( x^r + y^r \)$ for nonnegative $x \, y$ bounds the remaining constant by $e^(K_0 r^2)$,
    uniformly over integer $r$. We also used $t^(r \/ 2) lt.eq t^(r \/ 4)$.
  Choose $K gt.eq 2 K_0$ large enough that (8.1) holds for $p = 1 \, 2$, using (8.3).
    Suppose it holds for all positive integers below $p$, where $p gt.eq 3$.
    The triangle inequality in the cavity recursion, followed by the multinomial expansion and the conditional
    independence just established, bounds $A_p \( t \)$ by the expectation of the $p$th power of the sum of the
    absolute values of the own term and the $b$ child terms. The terms with exponent $p$ on a single child
    contribute at most $b theta^p A_p \( t \)$. The term supported on the own observation is at most
    $e^(K p^2 \/ 2) t^(p \/ 4)$ by (8.5).
  Every other exponent vector $\( r_0 \, r_1 \, dots.h \, r_b \)$ has sum $p$ and at least two positive entries.
    Hence every positive entry is below $p$, and the induction hypothesis applies to its child factors.
    Using (8.5) for its own factor, if present, and discarding powers of $theta lt.eq 1$,
    its product of moments is at most
  $ e^(K sum_(i = 0)^b r_i^2) t^(p \/ 4) . $
  For such a vector, $sum_i r_i^2 lt.eq \( p - 1 \)^2 + 1 = p^2 - 2 \( p - 1 \)$:
    merging positive entries until only two remain, then moving units to the larger one,
    can only increase the sum of squares. The sum of all multinomial coefficients in $b +
    1$ slots is $\( b + 1 \)^p$. Thus
  #[#set math.equation(numbering: n => "(8.6)")
   $ \( 1 - b theta^p \) A_p \( t \) lt.eq e^(K p^2) t^(p \/ 4)
     [e^(- K p^2 \/ 2) + \( b + 1 \)^p e^(- 2 K \( p - 1 \))] . $ <eq:critical-moment-induction>]
  The coefficient on the left is positive uniformly over $p gt.eq 3$:
  $ 1 - b theta^p = 1 - b^(1 - p \/ 2) gt.eq kappa_b := 1 - b^(- 1 \/ 2) > 0 . $
  Enlarge the same constant $K$ once more so that
  $ 2 K > log \( b + 1 \) \, wide e^(- 9 K \/ 2) + \( b + 1 \)^3 e^(- 4 K) lt.eq kappa_b . $
  Both terms in brackets in (8.6) decrease as the integer $p$ increases from $3$.
    Their sum is therefore at most $kappa_b lt.eq 1 - b theta^p$ for every such $p$.
    Absorption proves (8.1) with this single $K$, for every integer order and all $t lt.eq t_0$.
  To obtain the tail, put $L = log \( 1 \/ t \)$ and choose the integer $p = floor.l L \/ \( 16 K \) floor.r$.
    If $L gt.eq 32 K$, then $L \/ \( 32 K \) lt.eq p lt.eq L \/ \( 16 K \)$. Markov’s inequality gives
  $ bb(P) \( \| Y \| > t^(1 \/ 8) \) lt.eq e^(K p^2 - p L \/ 8) lt.eq e^(- p L \/ 16) lt.eq e^(- L^2 \/ \( 512 K \)) . $
  Take $t_(upright("tail")) lt.eq min \( t_0 \, e^(- 32 K) \)$.
    Both $\| Y \|^p$ and the indicator of the tail event are even functions of $Y$,
    so the spin-tilt identities prove all the conditional assertions as well. ◻
]

=== 8.2 Comparing log-factor and site-field differences <comparing-log-factor-and-site-field-differences>

Fix a finite horizon $T > 0$. The conditional-copy construction gives

$ \| Delta h_v \( t \) \| lt.eq H_T := 2 T + 2 d beta \, wide 0 lt.eq V \( t \) lt.eq
  H_T^2 quad \( 0 lt.eq t lt.eq T \) \, $

and Lemma 14 makes $V$ absolutely continuous, with $V \( 0 \) = 0$. Choose a constant, fixed throughout this horizon,

#[#set math.equation(numbering: n => "(8.7)")
 $ K_T > max { 1 \, H_T^2 } \, wide I \( t \) = 1 + log frac(K_T, V \( t \)) quad
   upright("when ") V \( t \) > 0 . $ <eq:osgood-size>]

In particular $I \( t \) > 1$, including at times when $V \( t \) gt.eq 1$.

#thm([Lemma 8.2.])[
  (Small-time log-factor estimate).  #emph[There is a fixed $t_(*)
    in \( 0 \, min { t_(upright("tail")) \, e^(- 1) } \]$ such that, for $0 < t lt.eq min { t_(*) \,
    T }$ with $V \( t \) > 0$,
#[#set math.equation(numbering: n => "(8.8)")
 $ S \( t \) lt.eq C_T V \( t \) (t^(1 \/ 4) + frac(I \( t \), log^2 \( 1 \/ t \))) . $ <eq:small-log-loss>]

 At every time in $\[ 0 \, T \]$, the bound $S \( t \) lt.eq C V \( t \)$ remains valid.]
] <lem:small-log-loss>

#proof[
  Write $Y = h_(j arrow.r i) \( t \)$ and $Y' = h'_(j arrow.r i) \( t \)$ for the edge used to define $S \( t \)$.
    The two cavity equations on this edge and $\| psi' \| lt.eq theta$ give the earlier comparison
  $ \| Y - Y' \| lt.eq frac(\| Delta h_j \| + theta \| Delta h_i \|, 1 - theta^2) . $
  Invariance and Cauchy–Schwarz consequently give
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E) \| Y - Y' \|^2 lt.eq frac(V \( t \), \( 1 - theta \)^2) \, wide \| Y - Y' \| lt.eq
     frac(H_T, 1 - theta) . $ <eq:critical-component-comparison>]
  Also
  $ \| \( log a \)' \( z \) \| = frac(2 \( 1 - theta^2 \) \| tanh z \|, 1 - theta^2 tanh^2 z) lt.eq
    2 \| tanh z \| lt.eq 2 . $
  The global bound gives $S \( t \) lt.eq 4 V \( t \) \/ \( 1 - theta \)^2$ and $\| D_e \( t \) \| lt.eq
    2 H_T \/ \( 1 - theta \)$.
  On the event $\| Y \| \, \| Y' \| lt.eq t^(1 \/ 8)$ the segment between them also lies in that interval,
    and $\| \( log a \)' \( z \) \| lt.eq 2 t^(1 \/ 8)$ there. The mean-value theorem and (8.9) therefore give
  $ bb(E) \[ D_e \( t \)^2 \; med \| Y \| \, \| Y' \| lt.eq t^(1 \/ 8) \] lt.eq
    frac(4, \( 1 - theta \)^2) t^(1 \/ 4) V \( t \) . $
  For the complementary event the global square-integrable bound gives $C V \( t \)$,
    while the deterministic bound on $D_e$ and a union bound using (8.2) in the two marginals give $C_T
    e^(- c log^2 \( 1 \/ t \))$. Thus
  #[#set math.equation(numbering: n => "(8.10)")
   $ bb(E) \[ D_e \( t \)^2 \; med max \( \| Y \| \, \| Y' \| \) > t^(1 \/ 8) \] lt.eq min { C V \( t \) \,
     C_T e^(- c log^2 \( 1 \/ t \)) } . $ <eq:bad-field-minimum>]
  The argument uses only the two marginal probabilities; it requires no independence between the two fields.
  Set $u = V \( t \) > 0$ and $J = log^2 \( 1 \/ t \) gt.eq 1$.
    If $u lt.eq e^(- c J \/ 2)$, then $I \( t \) gt.eq c J \/ 2$,
    so the first member of the minimum in (8.10) is at most $C u I \( t \) \/ J$.
    If $u > e^(- c J \/ 2)$, the second member divided by $u$ is at most $C_T e^(- c J \/ 2)$.
    Since $J e^(- c J \/ 2)$ is bounded for $J gt.eq 1$ and $I \( t \) gt.eq 1$,
    this is at most $C_T I \( t \) \/ J$. Adding the small-field contribution proves (8.8). ◻
]

=== 8.3 A cutoff depending on the discrepancy <a-cutoff-depending-on-the-discrepancy>

We next sum the weighted estimates. Recall $omega \( t \) = min { sqrt(t) \, 1 }$,
  and suppress $t$ at a fixed time with $0 < t lt.eq T$ and $V \( t \) > 0$. The preceding path results give

$ Q_r & lt.eq C r S \, wide L_r lt.eq V &  & \( r gt.eq 1 \) \,\
Q_r & lt.eq C e^(- c omega r) r S + C_T r^2 e^(- alpha b^(gamma r)) &  & \( r gt.eq C'_0 \/ omega \) \,\
L_r & lt.eq C e^(- c omega r) V + C_T e^(- alpha b^(gamma r)) &  & \( r gt.eq C'_0 \/ omega \) \, $

for fixed positive constants $c \, alpha \, gamma \, C'_0$ depending only on $d$.
  The last two lines follow from Proposition 20, with constants decreased or enlarged so that both exceptional
  terms have the indicated common form. These estimates include weights and discrepancies formed from the same
  observations.

Choose $C_1$ sufficiently large that

$ C_1 gt.eq C'_0 \, wide gamma C_1 log b gt.eq 1 \, wide \( alpha \/ 2 \) b^(gamma C_1) gt.eq 2 \, $

and take the integer

#[#set math.equation(numbering: n => "(8.11)")
 $ R = ⌈C_1 #scale(x: 120%, y: 120%)[\(] omega^(- 1) + log I #scale(x: 120%, y: 120%)[\)]⌉ . $ <eq:variance-cutoff>]

The weighted estimates apply for $r > R$. Since $omega^(- 1) gt.eq 1$ and $I > 1$, the choices above also give

$ \( alpha \/ 2 \) b^(gamma r) gt.eq \( alpha \/ 2 \) b^(gamma C_1 omega^(- 1)) I^(gamma C_1 log b) gt.eq
  2 I wide \( r > R \) . $

Splitting the exceptional exponent into equal halves therefore gives

#[#set math.equation(numbering: n => "(8.12)")
 $ e^(- alpha b^(gamma r)) lt.eq e^(- 2 I) e^(- \( alpha \/ 2 \) b^(gamma r)) =
   e^(- 2) (V / K_T)^2 e^(- \( alpha \/ 2 \) b^(gamma r)) lt.eq
   V^2 e^(- \( alpha \/ 2 \) b^(gamma r)) quad \( r > R \) . $ <eq:exception-absorption>]

The last step uses $K_T > 1$, and so remains valid when $V gt.eq 1$.

#thm([Lemma 8.3.])[
  (The noise and drift path sums).  #emph[At each time $0 < t lt.eq T$ with $V \( t \) > 0$,
#[#set math.equation(numbering: n => "(8.13)")
 $ sum_(r gt.eq 1) Q_r & lt.eq
   C_T [S #scale(x: 120%, y: 120%)[\(] omega^(- 2) + \( log I \)^2 #scale(x: 120%, y: 120%)[\)] + V^2] \,\
sum_(r gt.eq 1) sqrt(Q_r) & lt.eq
  C_T
  [sqrt(S) #scale(x: 120%, y: 120%)[\(] omega^(- 3 \/ 2) + \( log I \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] + V] \,\
sum_(r gt.eq 1) L_r & lt.eq
  C_T [V #scale(x: 120%, y: 120%)[\(] omega^(- 1) + log I #scale(x: 120%, y: 120%)[\)] + V^2] . $ <eq:cutoff-sums>]

]
] <lem:cutoff-sums>

#proof[
  For $r lt.eq R$, the estimates $Q_r lt.eq C r S$ and $L_r lt.eq V$ give the respective bounds
  $ C S sum_(r lt.eq R) r lt.eq C S R^2 \, wide C sqrt(S) sum_(r lt.eq R) sqrt(r) lt.eq C sqrt(S) R^(3 \/ 2) \,
    wide sum_(r lt.eq R) L_r lt.eq V R . $
  For the ordinary exponential terms at $r > R$, use
  #[#set math.equation(numbering: n => "(8.14)")
   $ sum_(r gt.eq 1) r^p e^(- c omega r) lt.eq C_(p \, c) omega^(- p - 1) quad
     (p in {0 \, 1 / 2 \, 1} \, med 0 < omega lt.eq 1) . $ <eq:exponential-length-sums>]
  For example, compare the sum with $integral_0^oo \( x + 1 \)^p e^(- c omega x) thin upright(d) x$ and put $y =
    omega x$; since $omega lt.eq 1$, the resulting integral is bounded by $omega^(- p - 1)
    integral_0^oo \( y + 1 \)^p e^(- c y) thin upright(d) y$.
    This gives $C S omega^(- 2)$ for the first sum and $C V omega^(- 1)$ for the third.
    For the middle sum use $sqrt(x + y) lt.eq sqrt(x) + sqrt(y)$;
    the ordinary exponential contribution is bounded by $C sqrt(S) sum_(r gt.eq 1) r^(1 \/ 2) e^(- c omega r \/ 2)
    lt.eq C sqrt(S) omega^(- 3 \/ 2)$.
  For the exceptional terms, (8.12) bounds their three contributions by constants times
  $ V^2 sum_(r gt.eq 1) r^2 e^(- \( alpha \/ 2 \) b^(gamma r)) \, wide
    V sum_(r gt.eq 1) r e^(- \( alpha \/ 4 \) b^(gamma r)) \, wide
    V^2 sum_(r gt.eq 1) e^(- \( alpha \/ 2 \) b^(gamma r)) \, $
  respectively. Each series is finite because its exponential exponent grows exponentially in $r$.
    In the middle series the square root of the $V^2$ factor is $V$, which is why the drift sum has this order.
    Finally $omega^(- 1) + log I gt.eq 1$, so the ceiling in (8.11) gives $R
    lt.eq \( C_1 + 1 \) \( omega^(- 1) + log I \)$. Bounding each power of this sum by a constant times the sum of
    its corresponding powers proves (8.13). ◻
]

=== 8.4 An integrable comparison at time zero <an-integrable-comparison-at-time-zero>

#thm([Proposition 8.4.])[
  (Critical conditional-copy uniqueness).  #emph[For the invariant conditional coupling with common innovations at
    $theta = b^(- 1 \/ 2)$, the site-field discrepancy satisfies $V \( t \) = 0$ for every $t gt.eq 0$.]
] <prop:critical-uniqueness>

#proof[
  Work on the fixed horizon $\[ 0 \, T \]$ used above. Inserting the noise and drift bounds (5.13) and (5.14) into
    the variance identity (5.6), and using $n_r theta^(2 r) = d b^(r - 1) b^(- r) = d \/ b$ for $r gt.eq 1$, gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ V' \( t \) lt.eq
     C
     (V \( t \) + sum_(r gt.eq 1) Q_r \( t \) + sum_(r gt.eq 1) L_r \( t \) + sqrt(V \( t \)) sum_(r gt.eq 1)
     sqrt(Q_r \( t \))) $ <eq:variance-path-reduction>]
  for almost every $t$. The sums in Lemma 23 are finite at the positive times with $V \( t \) >
    0$ where we now use this inequality.
  Insert those three bounds into (8.15). Use $S lt.eq C V$, and hence $sqrt(V S) lt.eq C V$,
    for all terms except $S omega^(- 2)$. The bounds $V lt.eq H_T^2$ imply $V^(3 \/ 2) lt.eq H_T V$ and $V^2 lt.eq
    H_T^2 V$. Finally
  $ \( log I \)^p lt.eq C_p I wide \( I gt.eq 1 \, med 0 < p lt.eq 2 \) \, $
  since $x^p e^(- x)$ is bounded on $x gt.eq 0$. As $omega^(- 1) lt.eq omega^(- 3 \/ 2)$,
    all the terms just treated are at most
  $ C_T V #scale(x: 120%, y: 120%)[\(] I + omega^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  This identifies the worst drift contribution explicitly: $sqrt(V S) thin omega^(- 3 \/ 2) lt.eq C V omega^(- 3 \/ 2)$.
  For $0 < t lt.eq min { t_(*) \, T }$, we have $omega = sqrt(t)$. Lemma 22 gives the remaining estimate
  $ S omega^(- 2) lt.eq C_T V (t^(- 3 \/ 4) + frac(I, t log^2 \( 1 \/ t \))) . $
  Together with $I gt.eq 1$, the preceding bounds prove
  #[#set math.equation(numbering: n => "(8.16)")
   $ V' \( t \) lt.eq k_T \( t \) V \( t \) (1 + log frac(K_T, V \( t \))) quad
     upright("for almost every ") t in \( 0 \, T \] upright(" with ") V \( t \) > 0 \, $ <eq:integrable-osgood>]
  where, after increasing $C_T$, we may take
  #[#set math.equation(numbering: n => "(8.17)")
   $ k_T \( t \) =
     cases(delim: "{", C_T (1 + t^(- 3 \/ 4) + frac(1, t log^2 \( 1 \/ t \))) \, & 0 < t lt.eq min { t_(*) \,
     T } \,, C_T \, & t_(*) < t lt.eq T .) $ <eq:osgood-coefficient>]
  For the second branch, $omega \( t \) gt.eq sqrt(t_(*)) > 0$ because $t_(*) lt.eq 1$; there we use $S lt.eq
    C V$ also for $S omega^(- 2)$. Thus that branch is bounded on the whole later interval.
    If $T lt.eq t_(*)$ there is no later interval. The small-time expression is used only for $t lt.eq t_(*) lt.eq
    e^(- 1)$, and it is integrable there:
  $ integral_0^(t_(*)) t^(- 3 \/ 4) thin upright(d) t = 4 t_(*)^(1 \/ 4) \, wide
    integral_0^(t_(*)) frac(upright(d) t, t log^2 \( 1 \/ t \)) = frac(1, log \( 1 \/ t_(*) \)) . $
  In particular $k_T in L^1 \( 0 \, T \)$.
  We finish with an Osgood-type comparison #cite(label("Osgood1898")),
    proving the needed absolutely continuous form directly. Suppose that $V$ is positive somewhere on
    $\[ 0 \, T \]$. Choose such a time $t$, and let $a < t$ be the left endpoint of its component in the
    positivity set of $V$. Continuity and $V \( 0 \) = 0$ give $V \( a \) = 0$.
    On any closed interval $\[ u \, t \]$ with $a < u < t$, continuity bounds $V$ away from zero.
    The function $z mapsto log \( 1 + log \( K_T \/ z \) \)$ has bounded derivative on the range of $V$ on that
    interval. Its composition with the absolutely continuous function $V$ is therefore absolutely continuous,
    and the chain rule and (8.16) give
  $ \( log I \)' = - frac(V', V I) gt.eq - k_T quad upright("almost everywhere on ") \[ u \, t \] . $
  Integrating yields
  $ log I \( u \) lt.eq log I \( t \) + integral_u^t k_T \( s \) thin upright(d) s lt.eq log I \( t \) +
    integral_a^t k_T \( s \) thin upright(d) s < oo . $
  The last bound is independent of $u$. But $V \( u \) arrow.r V \( a \) = 0$ as $u arrow.b a$,
    so $I \( u \) arrow.r oo$ and $log I \( u \) arrow.r oo$, a contradiction.
    Hence $V$ vanishes on $\[ 0 \, T \]$. Since the horizon was arbitrary, it vanishes at every time. ◻
]

=== 8.5 Recovering the observations and the spin factor <sec:recovery>

The comparison has now proved $V \( t \) = 0$ for the particular copies sampled in (5.1):
  Proposition 15 handles $b theta^2 < 1$, and Proposition 24 handles $b theta^2 = 1$.
  We first deduce equality of their observation paths and turn it into a Borel map from innovations to
  observations. The spins will then be read from the integer-time slopes of those paths.

The final passage to a spin map equivariant on every input uses local conditional expectations.

#thm([Lemma 8.5.])[
  (Pointwise equivariance of spin factors).  #emph[Let $\( U_v \)_(v in cal(V))$ be independent uniform labels on
    $T_d$. Suppose a Borel map $Phi : \[ 0 \, 1 \]^(cal(V)) arrow.r { - 1 \,
    1 }^(cal(V))$ satisfies $Phi \( g U \) = g Phi \( U \)$ almost surely for each fixed $g in "Aut" \( T_d \)$.
    There is a Borel map $Psi : \[ 0 \, 1 \]^(cal(V)) arrow.r { - 1 \, 1 }^(cal(V))$ such that $Psi \( U \) =
    Phi \( U \)$ almost surely and
$ Psi \( g x \) = g Psi \( x \) wide upright("for every ") x in \[ 0 \, 1 \]^(cal(V)) upright(" and ") g in
  "Aut" \( T_d \) . $

]
] <lem:pointwise-spin-factor>

#proof[
  Fix an auxiliary vertex $o$. For each integer $R gt.eq 0$,
    choose a Borel function $h_R : \[ 0 \, 1 \]^(B_R \( o \)) arrow.r \[ - 1 \, 1 \]$ representing
  $ bb(E) \[ Phi \( U \)_o divides U \|_(B_R \( o \)) \] . $
  A Borel version exists, and clipping it to $\[ - 1 \, 1 \]$ preserves this conditional expectation.
    Let $G_R$ be the finite automorphism group of the rooted ball $B_R \( o \)$, and average:
  $ q_R \( y \) = frac(1, \| G_R \|) sum_(a in G_R) h_R \( a y \) . $
  Every $a in G_R$ extends to a tree automorphism fixing $o$:
    outside the ball, match the isomorphic rooted components attached to its boundary.
    Such an extension preserves the IID law and the ball’s label sigma-field.
    The assumed almost-sure equivariance therefore makes $h_R \( a \( U \|_(B_R \( o \)) \) \)$ another version of
    the same conditional expectation. Thus $q_R$ still represents that conditional expectation, and is Borel,
    bounded by one, and invariant under $G_R$ on every input.
  Apply this same local rule at every vertex. Explicitly, for a rooted isomorphism $iota : B_R \( o \) arrow.r
    B_R \( v \)$, put
  $ A_R \( x \)_v = q_R #scale(x: 120%, y: 120%)[\(] \( x_(iota \( u \)) \)_(u in B_R \( o \))
    #scale(x: 120%, y: 120%)[\)] . $
  Two choices of $iota$ differ by an element of $G_R$, so the value does not depend on this choice.
    The maps $A_R$ are consequently Borel and satisfy $A_R \( g x \) =
    g A_R \( x \)$ for every input and automorphism. Each $iota$ also extends to a tree automorphism taking $o$ to
    $v$. Transporting the conditional expectation by this fixed automorphism shows that
  $ A_R \( U \)_v = bb(E) \[ Phi \( U \)_v divides U \|_(B_R \( v \)) \] quad upright("almost surely") . $
  The ball sigma-fields increase to the full label sigma-field.
    Upward martingale convergence, together with a countable intersection over vertices and radii,
    gives $A_R \( U \)_v arrow.r Phi \( U \)_v$ simultaneously at every vertex almost surely.
  On every label input define
  $ Psi \( x \)_v =
    cases(delim: "{", 1 \, & limsup_(R arrow.r oo) A_R \( x \)_v gt.eq 0 \,, - 1 \, & limsup_(R arrow.r oo) A_R \(
    x \)_v < 0 .) $
  Boundedness makes each limsup finite, and this formula defines a Borel spin map.
    The pointwise equivariance of every $A_R$ passes through the limsup and the common threshold.
    On the simultaneous convergence event the limits belong to ${ - 1 \, 1 }$, so $Psi \( U \) =
    Phi \( U \)$ almost surely. ◻
]

#thm([Proposition 8.6.])[
  (Recovery of observations and spins).  #emph[Fix $d gt.eq 3$ and $0 < theta =
    tanh beta lt.eq \( d - 1 \)^(- 1 \/ 2)$, and retain the path spaces and laws $sans(Q) \, sans(w) \,
    sans(K)$ defined in Section 5. There is a Borel map $F : sans(W) arrow.r sans(X)$ such that
$ sans(K) \( w \, dot.op \) = delta_(F \( w \)) quad upright("for ") sans(w) upright("-almost every ") w \, wide
  X = F \( W \) quad sans(Q) upright("-almost surely") . $

 For each fixed $g in "Aut" \( T_d \)$, $F \( g W \) = g F \( W \)$ almost surely.
   The free Ising law is the law of a Borel map of vertex IID uniform labels which commutes with every
   automorphism on every label input. The same spin-factor conclusion holds at $theta = 0$.]
] <prop:factor-extraction>

#proof[
  First suppose $theta > 0$. The two uniqueness propositions give $V \( t \) =
    0$ for every deterministic time in their respective parameter ranges.
    Invariance permits any vertex in place of the auxiliary vertex $o$.
    Intersecting the full-probability events for all vertices and nonnegative rational times gives $h_v \( q \) =
    h'_v \( q \)$ simultaneously at those indices. Both field arrays are continuous,
    so they agree at every time and vertex. Hence their magnetizations agree, and the common innovation identity gives
  $ X_v \( t \) = W_v \( t \) + integral_0^t m_v \( s \) thin upright(d) s = W_v \( t \) +
    integral_0^t m'_v \( s \) thin upright(d) s = X'_v \( t \) . $
  Thus $hat(sans(Q)) { X = X' } = 1$ as an equality of full path configurations.
    The use of rational times avoided an uncountable intersection over time.
  For $v in cal(V)$ and $q in bb(Q)_(gt.eq 0)$ choose the finite Borel version
  $ f_(v \, q) \( w \) = integral x_v \( q \) thin sans(K) \( w \, thin upright(d) x \) $
  when the absolute integral is finite, and set it to zero otherwise.
    Kernel integration makes this Borel, and integrability of $X_v \( q \)$ ensures that the exceptional inputs
    have $sans(w)$-measure zero. Taking expectations in (5.4) and using $X = X'$ gives
  $ 0 = bb(E)_(hat(sans(Q))) \( X_v \( q \) - X'_v \( q \) \)^2 =
    2 bb(E)_(sans(Q)) "Var" \( X_v \( q \) divides W \) . $
  It follows that $X_v \( q \) = f_(v \, q) \( W \)$ almost surely.
    We may impose these identities simultaneously for all the countably many pairs $\( v \, q \)$.
    Disintegrating them shows that, for $sans(w)$-almost every $w$, $sans(K) \( w \, dot.op \)$ gives mass one to
  $ { x in sans(X) : x_v \( q \) = f_(v \, q) \( w \) upright(" for every ") v \, q } . $
  This set has at most one element, since continuous paths are determined by their rational-time values.
    Its conditional mass one also makes it nonempty. Thus $sans(K) \( w \, dot.op \)$ is a point mass for almost
    every $w$.
  The conditional point-mass principle for measurable recovery also appears in Kurtz #cite(label("Kurtz2014"))
    Lemma 1.3 in arXiv:1305.6747v2. We give a Borel choice of that path, including values on all other inputs.
    For each $v$ and integer $j gt.eq 1$, let $p_(v \, j) \( w \)$ be the piecewise linear path whose value at $k
    2^(- j)$ is $f_(v \, k 2^(- j)) \( w \)$ for every integer $k gt.eq 0$.
    These are Borel maps to $C \( \[ 0 \, oo \) \, bb(R) \)$ with its locally uniform topology.
    Let $cal(G)$ be the set of $w$ for which, at every vertex,
    these paths are Cauchy uniformly on every compact interval and $f_(v \, 0) \( w \) = 0$. This set is Borel.
    Indeed, the uniform Cauchy condition on $\[ 0 \, N \]$ can be tested by the supremum over rational times
    there, and the quantifiers over vertices, integers $N$, error levels,
    and pairs of sequence indices are all countable. On $cal(G)$ the limits are continuous paths starting at zero.
    Define $F_v \( w \)$ to be this limit for $w in cal(G)$, and let $F \( w \)$ be the all-zero path
    configuration for $w in.not cal(G)$. The limit map on the Cauchy set of a Polish space is Borel,
    so this defines a Borel map $F : sans(W) arrow.r sans(X)$.
  For almost every $w$, the rational coordinates just specified are those of the unique path configuration charged
    by $sans(K) \( w \, dot.op \)$. Uniform continuity of each such path on compact intervals shows that its
    dyadic linear interpolants converge uniformly there. Consequently $w in
    cal(G)$ and $F \( w \)$ is that configuration. This proves both $sans(K) \( w \, dot.op \) =
    delta_(F \( w \))$ almost everywhere and $X = F \( W \)$ in the original law.
  Fix now one automorphism $g$. Invariance of $sans(Q)$ and uniqueness of conditional expectations imply
  #[#set math.equation(numbering: n => "(8.18)")
   $ f_(v \, q) \( g w \) = f_(g^(- 1) v \, q) \( w \) quad upright("for ") sans(w) upright("-almost every ") w
     $ <eq:recovery-coordinate-equivariance>]
  for each $v \, q$. Intersecting over those countably many pairs gives all these identities simultaneously for
    this fixed $g$. The dyadic interpolants then obey $p_(v \, j) \( g w \) =
    p_(g^(- 1) v \, j) \( w \)$ for every $v \, j$. On this full-measure set,
    $w in cal(G)$ if and only if $g w in cal(G)$, because its defining Cauchy conditions are the same after
    permuting vertices. The all-zero default is invariant as well, so $F \( g w \) = g F \( w \)$ almost surely.
    The full-measure set in this argument is allowed to depend on $g$; none is asserted for all automorphisms at once.
  Define a spin map on every innovation input by
  #[#set math.equation(numbering: n => "(8.19)")
   $ H_v \( w \) =
     cases(delim: "{", lim_(n arrow.r oo) frac(F_v \( w \) \( n \), n) \, &
     upright("if this limit exists and belongs to ") { - 1 \, 1 } \,, 1 \, & upright("otherwise") .) $ <eq:spin-factor>]
  Existence of either indicated limit is a Borel condition expressed through countably many error bounds and
    integer indices. Thus each $H_v$ is Borel, and so is $H$ into the countable spin product.
    On the planted probability space,
  $ frac(F_v \( W \) \( n \), n) = frac(X_v \( n \), n) = sigma_v + frac(B_v \( n \), n) $
  simultaneously for the integer indices. For every $epsilon > 0$, the Gaussian tail bound gives
  $ sum_(n gt.eq 1) bb(P) \( \| B_v \( n \) \| > epsilon n \) lt.eq sum_(n gt.eq 1) 2 e^(- epsilon^2 n \/ 2) < oo . $
  Borel–Cantelli, first for positive rational $epsilon$ and then over the countable vertex set,
    gives $B_v \( n \) \/ n arrow.r 0$ simultaneously for every vertex.
    Therefore $H \( W \) = sigma$ almost surely. Under product Wiener input,
    $H$ has exactly the free zero-field Ising law. For the fixed $g$ above, the identity $F \( g w \) =
    g F \( w \)$ makes the sequences in (8.19) agree after the same permutation.
    Their limits and their failure cases consequently agree. The same default sign at every site gives
    $H \( g w \) = g H \( w \)$ almost surely.
  Finally, Wiener measure is a Borel probability measure on the Polish space $C_0 \( \[ 0 \, oo \) \, bb(R) \)$.
    The standard Borel sampling theorem therefore supplies a Borel map $xi : \[ 0 \, 1 \] arrow.r
    C_0 \( \[ 0 \, oo \) \, bb(R) \)$ which sends Lebesgue measure to Wiener measure.
    For independent uniform labels $\( U_v \)$, set
  $ Phi \( U \) = H #scale(x: 120%, y: 120%)[\(] \( xi \( U_v \) \)_(v in cal(V)) #scale(x: 120%, y: 120%)[\)] . $
  Applying the same $xi$ at every site gives product Wiener law and commutes pointwise with every vertex
    permutation. Thus $Phi$ is Borel, has law $mu_(d \, beta)$, and satisfies $Phi \( g U \) =
    g Phi \( U \)$ almost surely for each fixed $g$. Lemma 25 replaces $Phi$ by a Borel map with the same law that
    is equivariant on every label input.
  When $theta = 0$, the broadcast law is already a product of fair signs.
    The rule $Phi_v \( U \) = 1$ for $U_v lt.eq 1 \/ 2$ and $Phi_v \( U \) = -
    1$ otherwise gives that law and commutes with every permutation for every input.
    All choices above are for the fixed pair $\( d \, beta \)$.
    Together with the known converse in Section 1, this proves Theorem 1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
