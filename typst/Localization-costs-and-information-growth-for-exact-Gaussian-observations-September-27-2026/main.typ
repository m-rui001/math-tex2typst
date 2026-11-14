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

#align(center)[#text(size: 16pt, weight: "bold")[Localization costs and information growth for exact Gaussian observations]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <l:introduction>

An exact linear observation can convey arbitrarily many bits about a real-valued signal.
  A finite message computed from several observations need not convey that much,
  but its information is not controlled by the number of observations alone: the prior distribution matters.
  If earlier messages have concentrated the signal in a small region,
  the next message may exploit that concentration. This paper studies how to restore a useful geometric spread
  condition while accounting for the information revealed in doing so.

The observation model is noiseless Gaussian regression. The unknown signal is a unit vector $S in S^(d - 1)$.
  A row $x tilde.op N \( 0 \, I_d \)$, independent of the signal and previous rows,
  arrives together with its exact label $chevron.l x \, S chevron.r$. A learner processes these pairs in order.
  Between observations it retains one of at most $2^M$ states;
  arbitrary computation and fresh randomness are allowed during a transition.
  It stops by a deterministic finite horizon $T$, and its unit-vector output uses its terminal state,
  stopping index, and fresh randomness. The precise measurable model,
  including data-independent shared randomness, is given in Section 2.
  Angular accuracy $epsilon.alt$ means $arccos chevron.l S \, hat(S) chevron.r lt.eq epsilon.alt$.

Our first information theorem concerns a prior for which the localization cost can be seen directly.
  Put $n = d - 1$, take $Z$ uniformly in the cube

$ \[ - 1 \/ \( 2 sqrt(n) \) \, 1 \/ \( 2 sqrt(n) \) \)^n \, wide S =
  phi.alt \( Z \) = \( Z \, sqrt(1 - parallel Z parallel^2) \) \, $

and group observations into blocks of $k = floor.l n \/ 16 floor.r$ rows.
  A message from a block may depend on all its rows and labels and on preceding messages.
  If each message has at most $exp \( A d^2 \)$ possible values, with $A$ fixed,
  then the first $t$ messages contain at most $C_A d t$ nats of mutual information about $Z$.
  Theorem 5 proves a stronger statement: the same bound holds after each message is supplemented with a nested
  dyadic cell containing $Z$ that restores the required spread condition.
  The constant depends on $A$, and the theorem gives the exact alphabet condition.
  The prior is the image of uniform cube volume, rather than uniform area on the spherical patch.
  This theorem serves as a complete first example; each later route establishes its own information estimate from
  its stated assumptions.

=== 1.1 Why localization can pay for itself <why-localization-can-pay-for-itself>

Suppose the current posterior is supported in a dyadic parent cell.
  It is sufficiently spread for our projection estimate when each descendant at relative depth $j$ has probability
  at most $B 2^(- n j \/ 2)$. A fresh block then carries at most $C d +
  log B + \( 2 \/ m + e^(- c k) \) log N$ information in a message with $N$ possible values, where $m =
  floor.l n \/ 8 floor.r$. The proof first inserts arbitrary $L^2$ weights into the posterior,
  bounds the exact projected density in $L^m$, and then uses duality to control the message likelihoods.

After the message, we reveal the deepest cell on the sampled point’s dyadic chain whose posterior mass is at least
  $2^(- n j \/ 2)$. At depth $j$ there are at most $2^(n j \/ 2)$ such cells.
  Naming the selected cell therefore costs about $n j \/ 2$ bits, plus the entropy of its depth.
  In contrast, confinement to any depth-$j$ cell certifies $n j$ bits relative to the initial uniform cube.
  This difference pays for the extra revelations. The normalization is by the probability of selecting the cell,
  not merely the probability of lying in it. Controlling that selection probability is what also pays for the next
  value of $log B$.

Section 3 completes this argument and its finite-state application.
  The next eight arguments change the localization or geometric input, with the distinct estimates in Table 1.
  The final two routes instead correct the information itself. Each route has its own hypotheses and parameters.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Construction
], table.cell(rowspan: 1, colspan: 1)[Estimate or information retained
]),
  table.cell(rowspan: 1, colspan: 2, align: left)[#emph[The cube-chart prior]
],
  table.cell(rowspan: 1, colspan: 1)[Maximum score (Section 4)
], table.cell(rowspan: 1, colspan: 1)[A finite maximizing-cell selection,
  with a one-block information bound charging half the concentration slack.
],
  table.cell(rowspan: 1, colspan: 1)[Finite entropy (Section 5)
], table.cell(rowspan: 1, colspan: 1)[Regularization of a possibly unbounded density of finite relative entropy,
  with finite expected termination and the complete stopping transcript retained.
],
  table.cell(rowspan: 1, colspan: 1)[Bounded-density split (Section 6)
], table.cell(rowspan: 1, colspan: 1)[A finite partition and a depth–entropy balance;
  two independent block copies at the same signal control a squared state likelihood.
],
  table.cell(rowspan: 1, colspan: 1)[Likelihood truncation (Section 7)
], table.cell(rowspan: 1, colspan: 1)[A finite-horizon success bound from explicitly bounded exceptional mass and
  a pointwise density bound on the surviving histories.
],
  table.cell(rowspan: 1, colspan: 2, align: left)[#emph[The uniform spherical prior]
],
  table.cell(rowspan: 1, colspan: 1)[Grid refinement (Section 8)
], table.cell(rowspan: 1, colspan: 1)[Unconditional information in the full history,
  including the entire selected grid-cell label after each block.
],
  table.cell(rowspan: 1, colspan: 1)[Side projection (Section 9)
], table.cell(rowspan: 1, colspan: 1)[Information in the full state history conditional on one fixed Gaussian side
  observation; predicting adaptive cells bounds the conditional entropy of their labels.
],
  table.cell(rowspan: 1, colspan: 1)[Separated tuples (Section 10)
], table.cell(rowspan: 1, colspan: 1)[A terminating radius refinement and an equal-label tuple of controlled
  affine volume; a sliced-entropy recurrence for at most $d$ blocks.
],
  table.cell(rowspan: 1, colspan: 1)[Predecessor spans (Section 11)
], table.cell(rowspan: 1, colspan: 1)[A selected posterior draw and a discrete smaller-ball code,
  paid by radius reduction, for possibly unbounded finite-entropy posteriors.
],
)
]],
  caption: [Table 1: Eight localization estimates following the dyadic proof. The group labels indicate the priors in the learner applications; the local estimates apply to the conditional laws specified in each section. The side-observation matrix is drawn independently of the learner’s observations and the signal. All auxiliary cells, projections, and posterior draws belong to the analysis; the learner retains only its prescribed finite state. ],
)

For the first information correction, let $nu$ be a bounded-density probability on the sphere and put $p =
  2 floor.l d \/ 16 floor.r$. Define

$ J_nu \( s \) = integral parallel u - s parallel^(- p) thin d nu \( u \) \, wide Phi \( nu \) =
  D \( nu parallel sigma \) - integral log J_nu \( s \) thin d nu \( s \) \, $

where $sigma$ is uniform spherical probability and $D$ denotes relative entropy.
  Section 12 proves that $Phi$ is convex, controls a fixed fraction of relative entropy up to $O \( d \)$,
  and grows by at most $O \( d \)$ per block in its stated width range.
  Convexity permits averaging away the entering state, so the iteration follows the current padded state,
  including its terminal label and stopping index. Section 13 instead keeps the complete boundary-state history
  and subtracts a correction built from the largest cell mass weighted by scale.
  Its geometric input bounds an inverse simplex volume under local ball bounds with no support restriction.
  The two corrections use different conditioning variables;
  neither is identified with the entropy cost of the dyadic revelations.

For $M \( d \) = o \( d^2 \)$, the learner applications give

$ T \( d \) gt.eq c d log \( 1 \/ epsilon.alt \( d \) \) \, wide 0 < epsilon.alt \( d \) lt.eq 1 \/ 10 \, $

with an absolute $c > 0$ and a dimension threshold that may depend on the memory sequence.
  The cube arguments assume success at least $2 \/ 3$ for every signal,
  which supplies both their cube prior and the full-sphere prior used at constant accuracy.
  The spherical arguments assume average success at least $2 \/ 3$ for a uniform signal.
  Each application accounts for the stopping index and the constant-accuracy endpoint.
  For the controlled-horizon estimate, output counting first puts any putative shorter run within the required range.

=== 1.2 Context and companion inputs <context-and-companion-inputs>

Memory constraints distinguish what a learner can extract from a sample from what it can retain for later samples.
  Steinhardt and Duchi #cite(label("SteinhardtDuchi2015")) established memory–sample tradeoffs for noisy sparse
  regression. Steinhardt, Valiant, and Wager #cite(label("SteinhardtValiantWager2016")) formulated a
  parity-learning conjecture; Raz #cite(label("Raz2016")) proved a quadratic-memory versus exponential-sample
  separation and subsequently extended the method to broader finite learning problems #cite(label("Raz2017")).
  For real-valued linear prediction, Dagan, Kur, and Shamir #cite(label("DaganKurShamir2019")) Section 3.3,
  Theorem 10 proved a quadratic-memory lower bound for approximately solving a consistent linear system whose rows
  arrive once in random order. Their guarantee concerns residual error on that fixed system,
  whereas here the signal is fixed before independent Gaussian samples are drawn.

Sharan, Sidford, and Valiant #cite(label("SSV2019")) studied the statistical Gaussian-regression problem with
  small positive observation noise. Their Theorem 1 gives a sample lower bound of $Omega \( d log r \)$ for
  Euclidean error $epsilon.alt = d^(- r)$, memory at most $d^2 \/ 4$ bits, and $r lt.eq O \( d \/ log d \)$.
  Their Section 7, Lemma 12 expands projection moments into independent signal copies and controls them by
  successive orthogonalization. This is a close methodological predecessor of the projection arguments below.
  We prove the exact multirow density estimates, their limiting passages,
  and the costs of restoring geometric spread locally. The separate condition-number conjecture in their
  Section 1.1 concerns exact labels and ill-conditioned Gaussian covariance at constant error;
  the covariance here is the identity and the lower bound tracks the required accuracy.

The information layer uses relative entropy on standard Borel spaces.
  Austin #cite(label("Austin2020")) gives the conditional chain rules and product decompositions that make these
  identities meaningful without a finite signal alphabet. The variational inequality used to charge selected laws
  is recorded in #cite(label("DupuisMao2022")); at each use we prove the necessary integrability or truncation
  step for the unbounded logarithm. The tuple arguments use total correlation in Watanabe’s terminology
  #cite(label("Watanabe1960")). Spherical slicing is related to Federer’s coarea formula
  #cite(label("Federer1959")), and Section 10 gives the specific surface-area calculation.
  Its subset-entropy comparison credits the entropy covering argument of Chung, Graham, Frankl,
  and Shearer #cite(label("ChungGrahamFranklShearer1986"));
  the conditional differential-entropy argument is proved here.
  The predecessor-span code uses Kraft’s inequality #cite(label("Kraft1949")),
  with the countable form in #cite(label("Duchi2023")) Theorem 2.4.2,
  followed by a local conditional entropy calculation.

Only two long analytic inputs are taken from companion articles.
  The finite-measure identity of #cite(label("OpenAIReplica2026")) Theorem 3.3 supplies the exact equal-label
  reference in Section 11. We apply its uniform spherical case at two separate row counts and prove the
  finite-entropy extension locally. The mixed projection moment of #cite(label("OpenAIRow2026")) Theorem 3.1
  supplies the positive-scale estimate in Section 12. We verify its two local-mass bounds after reweighting,
  change the actual-row law while the scale is positive, and then take the exact-label limit under the actual law.
  The remaining localization arguments are proved in this paper.

=== 1.3 Reading the arguments <reading-the-arguments>

Sections 2 and 3 give a complete first proof: the model, measurable-rule reduction, information conventions,
  and endpoint, followed by dyadic localization and its learner application.
  The four other cube routes require this common model and the cube geometry of Lemma 4,
  but not the preceding cube proofs. The spherical routes can be read after the common model.
  In particular, the side-projection argument uses the statement of Corollary 34, not the grid proof,
  and the two tuple arguments are independent of each other.

Only the predecessor-span and kernel routes use the companion inputs described above,
  stated locally in Proposition 43 and Theorem 53. The other geometric and localization estimates are proved here.
  Each route fixes its parameters at its outset, and its final application states the prior and stopping
  conventions used for the sample bound.

== 2 Finite memory, priors, and information <l:model>

We specify the observation model once, before applying the different localization estimates.
  A signal $s in S^(d - 1)$ is fixed before sampling. At index $j$ the learner receives

$ x_j tilde.op N \( 0 \, I_d \) \, wide y_j = chevron.l x_j \, s chevron.r \, $

with independent rows $x_j$. It cannot choose a row or revisit an earlier observation.
  Its persistent state at each index lies in a finite set of cardinality at most $2^M$.
  Given that state and the entire current pair $\( x_j \, y_j \)$,
  a transition may use unrestricted computation and fresh randomness.
  All information retained for later indices must be represented by the new state.

The learner stops by a prescribed deterministic horizon $T < oo$, possibly before taking a sample.
  Its unit-vector output uses only the terminal state, the stopping index, and fresh randomness.
  The rules and output laws may also depend on data-independent shared randomness chosen before sampling,
  as well as on $d$, the prescribed accuracy, and the index; they cannot depend on the unknown signal.
  The shared rule randomness and the initial finite state are jointly independent of the signal and all sample
  rows. The initial state may depend on the shared randomness,
  but conditional on that randomness it carries no signal or sample information.
  In particular, the last observation affects the output only through the terminal state.
  This is a bit-state model, not a model with persistent real registers.

For a unit-vector estimate $hat(S)$, angular success at accuracy $epsilon.alt$ is the event $arccos chevron.l S \,
  hat(S) chevron.r lt.eq epsilon.alt$. It implies $parallel S - hat(S) parallel lt.eq epsilon.alt$,
  since the chord length at angle $theta$ is $2 sin \( theta \/ 2 \) lt.eq theta$.
  Each application states whether success is averaged under a specified prior or required for every fixed signal.

As part of the randomized-learner model, the initial variables, sequential finite choices,
  and output form a jointly measurable experiment in the signal, the sample rows, and the randomness.
  Consequently prior mixing and conditioning on the shared randomness refer to measurable joint laws.
  The next regularity allowance concerns the coordinate kernels of that experiment at a fixed shared seed.

For each fixed realization of the shared rule randomness,
  the transition and stopping probabilities may be measurable in the completion of the Borel sigma field under

$ lambda \( d x \, d y \) = gamma_d \( d x \) thin d y \, $

where $gamma_d$ is standard Gaussian probability on $bb(R)^d$.
  The terminal output laws are Borel probability measures on the sphere.
  The next lemma explains why reference experiments may nevertheless evaluate state rules at every matrix and label.

#thm([Lemma 2.1.])[
  (Borel rules under an absolutely continuous prior).  #emph[Let $P$ be a probability measure on $S^(d - 1)$ such
    that, for independent $S tilde.op P$ and $x tilde.op gamma_d$,
    the pair $\( x \, chevron.l x \, S chevron.r \)$ has law absolutely continuous with respect to $lambda$.
    Fix a realization of the shared rule randomness and a finite horizon.
    Every completed-measurable finite-state learner has everywhere-defined Borel transition and stopping kernels
    with the same state sets and output laws and the same $P$-prior joint law of the signal, state path,
    stopping index, and output.]
] <l:borel>

#proof[
  At a fixed state and index, combine continuation and stopping choices into one finite set of tagged
    destinations. Choose Borel versions of their completed-measurable coordinate probabilities.
    Such versions exist: measurable simple approximations may have each of their countably many level sets
    replaced by a Borel set modulo a null set. Outside a Borel $lambda$-null set the versions agree with the
    original coordinates and form a probability vector. On the exceptional set use a fixed point mass.
    This gives nonnegative Borel coordinates whose sum is one everywhere.
  There are finitely many states and indices, so a single Borel $lambda$-null set contains every modification.
    Pregenerate all sample pairs through the horizon, including pairs ignored after stopping.
    Each of their unconditional marginals avoids this null set by the hypothesis on $P$.
    A finite union over indices therefore shows that no modified pair occurs almost surely.
    This argument uses the unconditional pair law; it does not require a positive density after conditioning on a
    state selected from past samples.
  Couple the old and new finite kernels by the same fresh uniforms.
    Induction gives identical state paths and stopping decisions almost surely.
    At an identical terminal state and index the output laws are unchanged and can be coupled identically.
    This proves the joint-law claim. ◻
]

#thm([Lemma 2.2.])[
  (Sphere and regular cube-chart priors).  #emph[The hypothesis of Lemma 1 holds for uniform probability $sigma$
    on $S^(d - 1)$, $d gt.eq 2$. It also holds for $S = phi.alt \( Z \)$ when $Z$ has a density relative to
    Lebesgue measure on a bounded $q$-dimensional cube, $q gt.eq 1$,
    and $phi.alt$ is $C^1$ on a neighborhood of its interior with $"rank" D phi.alt \( z \) gt.eq
    1$ for almost every $z$.]
] <l:prior-ac>

#proof[
  For fixed $x eq.not 0$, rotational invariance makes $chevron.l x \,
    S chevron.r \/ parallel x parallel$ the first coordinate of a uniform spherical point.
    Its density on $\( - 1 \, 1 \)$ is proportional to $\( 1 - t^2 \)^(\( d - 3 \) \/ 2)$;
    this also is integrable for $d = 2$. For example the formula follows by writing the point as a normalized
    standard Gaussian and separating its first coordinate from the remaining squared length.
    Thus the conditional label law has a Lebesgue density for every nonzero $x$.
    Fubini, discarding $x = 0$, proves the first assertion.
  For a chart put $f_x \( z \) = chevron.l x \, phi.alt \( z \) chevron.r$.
    At every regular $z$, the set of $x$ with $nabla f_x \( z \) = D phi.alt \( z \)^(sans(T)) x =
    0$ is a proper linear subspace and has Gaussian measure zero.
    Fubini shows that for Gaussian-almost every $x$, the critical set of $f_x$ has Lebesgue measure zero in the
    cube. Around every other interior point, choose a coordinate in which a partial derivative is nonzero.
    The inverse function theorem makes $f_x$, together with the remaining coordinates,
    a $C^1$ local coordinate system. In each such neighborhood the preimage of a Lebesgue-null subset of $bb(R)$
    has zero $q$-dimensional volume, by Fubini and change of variables.
    A countable cover of the regular set proves absolute continuity of the label pushforward.
    The critical set and cube boundary are null. Integrating over $x$ proves the second assertion. ◻
]

When a proof fixes randomness under a chosen prior, the order matters.
  If the original success is at least $p$ and $q < p$, first fix the shared rule randomness with prior success
  greater than $q$. Apply Lemma 1 for that fixed rule and that prior.
  Then, the conditional initial-state law remains independent of the signal and rows.
  If a deterministic program is useful, sample that initial state,
  sample the finite choices by uniforms indexed by state and index,
  and sample the output law for each terminal state and index. These variables are independent of the inputs.
  Averaging fixes them with prior success at least $q$.

Alternatively, when the same numerical success bound is proved at each fixed shared seed,
  apply the Borel replacement separately there and transfer the bound back to the original conditional prior law.
  The original jointly measurable experiment makes those conditional success probabilities measurable,
  so their bound may be integrated over the seed. Neither argument requires a jointly chosen family of Borel
  replacements. A replacement for one prior preserves that prior experiment, rather than every individual signal.

===== 2.1 Blocks and the stopping index. <blocks-and-the-stopping-index.>

Starting from a known state, composition of the everywhere Borel kernels gives a Borel probability kernel on the
  complete data of a block. A block of $b$ rows can report its continuing state,
  or its terminal state and a stopping offset in ${ 0 \, dots.h \, b }$,
  or a dummy value if it was already inactive. Thus

$ N_b lt.eq \( b + 2 \) 2^M + 1 $

is a valid local alphabet bound. A proof may retain a larger displayed bound from its own convention.
  The sequence of block indices and local offsets determines the global stopping index.
  Pregenerating unused suffixes keeps every new block independent of the past.
  Auxiliary locations or projections introduced below are part of the analysis; they are not supplied to the learner.

===== 2.2 Information conventions. <information-conventions.>

All logarithms are natural unless a dyadic scale is explicitly written with $log_2$.
  For probabilities $P lt.double Q$ on a standard Borel space,

$ D \( P parallel Q \) = integral log \( d P \/ d Q \) thin d P \, $

with value $+ oo$ without absolute continuity. For a discrete variable $W$, $H \( W \) = -
  sum_w P \( W = w \) log P \( W = w \)$, where $0 log 0 = 0$.
  Mutual information is $I \( U \; W \) = D \( P_(U \, W) parallel P_U ⊗ P_W \)$;
  conditional quantities average the corresponding conditional relative entropies.
  We use the chain rule and data processing on standard Borel spaces in the conditional-relative-entropy
  formulation of #cite(label("Austin2020")) Lemma 3.6 and Sections 3.3–3.4.

Two elementary consequences will be used repeatedly. If an event has probability $b$ under $P$ and $b_0$ under $Q$, then

#[#set math.equation(numbering: n => "(1)")
 $ D \( P parallel Q \) gt.eq b log \( 1 \/ b_0 \) - log 2 . $ <l:binary>]

Indeed data processing gives binary relative entropy, and the sum of $b log b + \( 1 - b \)
  log \( 1 - b \)$ is at least $- log 2$, while the remaining term $- \( 1 - b \)
  log \( 1 - b_0 \)$ is nonnegative. If $P lt.double Q$, $a > 0$, and $F > 0$, then

#[#set math.equation(numbering: n => "(2)")
 $ bb(E)_P log F lt.eq frac(D \( P parallel Q \) + log bb(E)_Q F^a, a) $ <l:tilt>]

whenever the left side is defined and the right side is finite.
  For a bounded logarithm, normalize $F^a Q$ and use nonnegativity of relative entropy.
  Apply this argument to clipped logarithms and use monotone truncation of the positive part and integrability of
  the negative part for the displayed form. This is the entropy variational inequality;
  the bounded-measurable probability version is recorded in #cite(label("DupuisMao2022")) Equations (1.1)–(1.2).

Relative entropy to a finite nonzero measure $eta$ means $integral log \( d P \/ d eta \) thin d P$.
  If $c = eta \( Omega \)$, it equals $D \( P parallel eta \/ c \) - log c$.
  Therefore it contracts under a measurable map: normalization adds the same constant before and after the map.
  This observation is used only where the comparison measure and all relevant logarithmic integrals are specified.

#thm([Lemma 2.3.])[
  (Spherical caps and a full-data endpoint).  #emph[Write $n = d - 1$. Uniform spherical probability satisfies
$ sigma \( B \( u \, r \) \) lt.eq r^n quad \( u in S^(d - 1) \, med r > 0 \) \, wide
  sigma \( B \( z \, r \) \) lt.eq \( 2 r \)^n quad \( z in bb(R)^d \, med r > 0 \) . $

 If $S tilde.op sigma$, $0 lt.eq T < d$ independent Gaussian rows and all their exact labels are revealed,
   and an estimate uses these data and independent randomness, then for every $0 < epsilon.alt < r_0 < 1$,
#[#set math.equation(numbering: n => "(3)")
 $ bb(P) { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 1 / 2 + 1 /
   2 thin bb(P) #h(-0.16667em) {parallel P_(ker X) S parallel lt.eq r_0} lt.eq 1 / 2 +
   frac(T, 2 d \( 1 - r_0^2 \)) . $ <l:raw-success>]

]
] <l:caps-endpoint>

#proof[
  For $0 < r lt.eq 1$, a chordal cap about $u$ has angular radius $theta lt.eq pi \/ 3$, $sin theta lt.eq r$,
    and $cos theta gt.eq 1 \/ 2$. Its normalized area is
  $ frac(integral_0^theta sin^(n - 1) v thin d v, integral_0^pi sin^(n - 1) v thin d v) . $
  The numerator is at most $2 r^n \/ n$ after substituting $w = sin v$; the denominator is at least $2 \/ n$,
    since $integral_0^(pi \/ 2) sin^(n - 1) v thin d v gt.eq integral_0^(pi \/ 2) sin^(n - 1) v cos v thin d v =
    1 \/ n$. For $r gt.eq 1$ the same bound is trivial. An ambient ball meeting the sphere is contained,
    on the sphere, in a radius-$2 r$ ball about any point of its intersection, proving the second bound.
  The row span of $X$ has dimension $T$ almost surely. Its labels specify the row-space projection of $S$.
    Conditional on the rows and labels, the remaining component is uniform on its sphere in $ker X$,
    with radius $R = parallel P_(ker X) S parallel$. To see this,
    write $S$ as a normalized standard Gaussian and separate its independent row-space and nullspace components;
    the direction of the latter is independent of both lengths and of the former component.
  When $R > r_0 > epsilon.alt$, the set of residual directions that place the signal within $epsilon.alt$ of a
    fixed estimate cannot contain both members of any antipodal pair.
    Its conditional mass is at most $1 \/ 2$, including after averaging the estimate’s independent randomness.
    Finally, $bb(E) parallel P_("row" X) S parallel^2 = T \/ d$ by rotational invariance.
    Markov’s inequality applied to $parallel P_("row" X) S parallel^2 = 1 - R^2$ proves (3). ◻
]

The constants used later follow directly from this proof.
  For success at least $2 \/ 3$ and $epsilon.alt lt.eq 1 \/ 10$,
  the same calculation with the strict event $R < 1 \/ 2$ gives $T > d \/ 4$:
  if $T lt.eq d \/ 4$, then $bb(P) \( R < 1 \/ 2 \) < 1 \/ 3$ and success is less than $2 \/ 3$.
  The weaker $T > d \/ 8$ follows by taking $r_0 = 1 \/ sqrt(2)$,
  which gives success at most $5 \/ 8$ when $T lt.eq d \/ 8$.
  For a fixed program with success at least $3 \/ 5$, take the event $R lt.eq epsilon.alt$ directly.
  Its probability is at most $T \/ \[ d \( 1 - epsilon.alt^2 \) \]$, so $T lt.eq
  d \/ 20$ would give success strictly below $3 \/ 5$. These statements grant the entire stream and therefore
  include early stopping.

== 3 Dyadic localization and its information cost <l:dyadic>

We first prove the repeated-localization estimate that motivates the paper.
  The prior is the image of a uniform cube under a spherical coordinate map, not uniform surface measure on the patch.

Put

$ n = d - 1 \, wide k = floor.l n \/ 16 floor.r \, wide m = floor.l n \/ 8 floor.r \, $

and assume $d$ is sufficiently large. Let $mu_0$ be normalized Lebesgue measure on the half-open cube

$ Q_0 = \[ - 1 \/ \( 2 sqrt(n) \) \, 1 \/ \( 2 sqrt(n) \) \)^n \, wide
  phi.alt \( z \) = \( z \, sqrt(1 - parallel z parallel^2) \) . $

Thus $phi.alt \( Q_0 \) subset S^(d - 1)$. Half-open cells give each point a unique cell at every level.

#thm([Lemma 3.1.])[
  (Geometry of the cube chart).  #emph[The map $phi.alt$ is $2$-Lipschitz,
    and a level-$J$ dyadic cell has side $2^(- J) \/ sqrt(n)$ and $mu_0$-mass $2^(- n J)$.
    For every fixed $v in S^(d - 1)$ and $epsilon.alt > 0$,
$ mu_0 { z : arccos chevron.l phi.alt \( z \) \, v chevron.r lt.eq epsilon.alt } lt.eq
  #scale(x: 120%, y: 120%)[\(] sqrt(2 pi e) thin epsilon.alt #scale(x: 120%, y: 120%)[\)]^n
  lt.eq \( 5 epsilon.alt \)^n . $

]
] <ld:cube-geometry>

#proof[
  On $Q_0$, $parallel z parallel lt.eq 1 \/ 2$, so the gradient of $sqrt(1 - parallel z parallel^2)$ has norm at
    most $1 \/ sqrt(3)$. This proves the Lipschitz bound; the cell formulas follow from the side length and
    normalized cube volume. Angular error at most $epsilon.alt$ implies chordal error at most $epsilon.alt$,
    so the first $n$ coordinates lie in the radius-$epsilon.alt$ ball about the projection of $v$.
    Its normalized cube volume is at most $n^(n \/ 2) v_n epsilon.alt^n$.
    The Gaussian integral on the radius-$sqrt(n)$ ball gives $v_n lt.eq \( 2 pi e \/ n \)^(n \/ 2)$,
    proving the claim. ◻
]

Draw $Z tilde.op mu_0$. In block $i$, independently draw a standard Gaussian $k times
  d$ matrix $X_i$ and observe $\( X_i \, X_i phi.alt \( Z \) \)$. A message $W_i$ takes at most $N$ values.
  Its conditional law may be any measurable function of that exact block and the preceding messages;
  independent randomization is allowed. More precisely, for each fixed preceding message history the rule is an
  everywhere-defined Borel probability kernel on $bb(R)^(k times d) times bb(R)^k$:
  its coordinates are nonnegative and sum to one at every $\( X \, y \)$.
  Euclidean spaces and the sphere carry their Borel sigma fields.
  Neither the matrices nor their labels are automatically retained in the message history.

Information and relative entropy use the conventions of Section 2.

#thm([Theorem 3.2.])[
  (Repeated localization).  #emph[There is an absolute constant $c > 0$ with the following property.
    For any fixed $C_0 > 0$, consider the experiment above with $t gt.eq 0$ blocks and $N gt.eq
    1$ possible message values, and suppose
#[#set math.equation(numbering: n => "(4)")
 $ #scale(x: 120%, y: 120%)[\(] 2 \/ m + e^(- c k) #scale(x: 120%, y: 120%)[\)] log N lt.eq C_0 d . $ <ld:eq:alphabet>]

 One can reveal nested dyadic cells $Q_0 supset Q_1 supset dots.h.c supset Q_t$ containing $Z$,
   where $Q_i$ is a finite-valued measurable function of $Z$, the preceding revelations, and $W_1 \, dots.h \,
   W_i$, so that the augmented transcript
$ Pi_t = \( W_1 \, Q_1 \, dots.h \, W_t \, Q_t \) $

 satisfies
#[#set math.equation(numbering: n => "(5)")
 $ I \( Z \; Pi_t \) lt.eq C d t . $ <ld:eq:main>]

 Here $C$ is a constant depending only on $C_0$. If $J_t$ is the level of $Q_t$,
   the construction also gives $bb(E) J_t lt.eq C t$.]
] <ld:thm:main>

For fixed $A$, an alphabet of size at most $exp \( A d^2 \)$ satisfies (4) with a constant depending only on $A$.
  The theorem allows arbitrary rules inside a block; it restricts only what a block passes to the next one.
  Since the original message history is a function of $Pi_t$, it inherits the same information bound.

The proof has three steps. Section 3.1 shows that if a posterior assigns little mass to every small dyadic cell,
  exact Gaussian projection has controlled density even after an $L^2$ weight is inserted.
  Section 3.2 turns that estimate into a bound on the information in one finite message.
  Section 3.3 selects a deepest cell whose posterior mass is large relative to its scale and bounds the entropy of
  that selection. The information chain rule then closes the iteration in Section 3.4.
  Section 3.5 gives a complete application to finite-state learners, including bounded stopping.

=== 3.1 A weighted density for exact projections <ld:sec:projection>

We first work inside one dyadic cell and put $alpha = 1 \/ 2$.
  The hypothesis below measures concentration at every smaller scale.
  Its role is to prevent independent points from accumulating near a low-dimensional affine subspace.

The weight in the coming estimate has a specific information-theoretic purpose.
  A message’s probability, after restricting labels to a bounded ball, is a function of the signal.
  Testing that function against every $L^2$ weight of norm at most one bounds its $L^2$ norm by duality.
  Jensen’s inequality then controls the message’s relative-entropy contribution using this likelihood norm.
  Section 3.2 will carry out these two steps. We therefore need a projection-density bound that is uniform over
  the weights, not just a density bound for the unweighted posterior.

Let $Q$ be a level-$J$ cell and let $mu$ be a probability measure supported in $Q$. For $B gt.eq 1$, assume

#[#set math.equation(numbering: n => "(6)")
 $ mu \( R \) lt.eq B 2^(- alpha n l) quad upright("for every level-") \( J + l \) upright(" descendant ") R
   upright(" of ") Q upright(" and ") l gt.eq 0 . $ <ld:eq:spread>]

Write $r = 2^(- J)$, $c_Q = phi.alt \( "center" Q \)$, and

$ a \( z \) = frac(phi.alt \( z \) - c_Q, r) . $

Then $parallel a \( z \) parallel lt.eq 2$. Let $P_X$ denote the law of a standard Gaussian $k times d$ matrix.

#thm([Lemma 3.3.])[
  (Weighted exact projection).  #emph[Under (6), for every measurable $h$ with $parallel h parallel_(L^2 \( mu \))
    lt.eq 1$, put $nu = \| h \| mu$. The image of $P_X \( d X \) nu \( d z \)$ under $\( X \, z \)
    mapsto \( X \, X a \( z \) \)$ has a density $f_nu$ relative to $P_X \( d X \) thin d u$,
    where $d u$ is Lebesgue measure on $bb(R)^k$, and
#[#set math.equation(numbering: n => "(7)")
 $ parallel f_nu parallel_(L^m \( P_X d u \)) lt.eq C^d B^(1 \/ 2) $ <ld:eq:density>]

 for an absolute constant $C$.]
] <ld:lem:density>

#proof[
  We first derive a tube bound from (6), then estimate a smoothed projection by expanding its $m$th moment.
    Finally we pass to the exact measure. The replica expansion and Gaussian orthogonalization have a close
    predecessor in #cite(label("SSV2019")) Section 7, Lemma 12;
    the weighted multirow estimate and the exact-measure passage are proved here.
  For every affine $q$-plane $V subset bb(R)^d$ with $q lt.eq m - 2$, we claim
  #[#set math.equation(numbering: n => "(8)")
   $ mu { z : "dist" \( a \( z \) \, V \) lt.eq delta } lt.eq
     B C^d delta^(alpha n - q) wide \( 0 < delta lt.eq 1 \) . $ <ld:eq:tube>]
  Projection onto the first $n$ coordinates shows that every such $z$ lies within $delta
    r$ of the projection of $c_Q + r V$. Only the part of that projected plane within $2
    r$ of the center of $Q$ is needed. A maximal $delta r$-separated subset of that part has at most
    $\( C \/ delta \)^q$ points, by volume comparison in the plane.
    Balls of radius $2 delta r$ about these points cover all relevant $z$.
  Choose $l gt.eq 0$ so that $2^(- l) lt.eq delta < 2^(- l + 1)$.
    Each covering ball meets at most $C^n$ level-$\( J + l \)$ cells.
    Indeed those cells are disjoint, have side greater than $delta r \/ \( 2 sqrt(n) \)$,
    and lie inside a ball of radius $3 delta r$. If $v_n$ is the volume of the unit ball in $bb(R)^n$,
    the estimate $v_n lt.eq \( 2 pi e \/ n \)^(n \/ 2)$ gives the claimed count; the powers of $sqrt(n)$ cancel.
    Each such cell has mass at most $B 2^(- alpha n l) lt.eq B delta^(alpha n)$, proving (8).
  By Cauchy–Schwarz, $nu$ has mass at most one. For $eta > 0$ define
  $ F_eta \( X \, u \) =
    integral \( 2 eta \)^(- k) upright(bold(1))_({ parallel u - X a \( z \) parallel_oo lt.eq eta }) thin d
    nu \( z \) . $
  This is smoothing in the label variable only. Expanding its $m$th power introduces points $z_1 \, dots.h \,
    z_m$. Put $a_i = a \( z_i \)$, define $D_i$ for $2 lt.eq i lt.eq m$, and set
  $ D_i = "dist" #scale(x: 120%, y: 120%)[\(] a_i \, "aff" \( a_1 \, dots.h \, a_(i - 1) \)
    #scale(x: 120%, y: 120%)[\)] \, wide sans(D) = \[ a_2 - a_1 \, dots.h \, a_m - a_1 \] \, wide V_(*)^2 =
    det \( sans(D)^(sans(T)) sans(D) \) . $
  The exponent in (8) is positive. Thus each affine span in this display has zero $mu$-mass and zero $nu$-mass.
    Almost every tuple is affinely independent, and Gram–Schmidt gives $V_(*) = product_(i = 2)^m D_i$.
  The intersection of the $m$ smoothing boxes has volume at most $\( 2 eta \)^k$ and is empty unless $parallel
    X \( a_i - a_1 \) parallel_oo lt.eq 2 eta$ for every $i gt.eq 2$.
    For a fixed affinely independent tuple, one row of these differences is Gaussian with covariance
    $sans(D)^(sans(T)) sans(D)$ and maximum density $\( 2 pi \)^(- \( m - 1 \) \/ 2) V_(*)^(- 1)$.
    The $k$ rows are independent. Bounding the probability of the difference box by its volume times this maximum
    density, and using Tonelli’s theorem, yields
  #[#set math.equation(numbering: n => "(9)")
   $ integral F_eta^m thin d P_X thin d u lt.eq C^(k \( m - 1 \)) integral V_(*)^(- k) thin d nu^(⊗ m) .
     $ <ld:eq:moment>]
  All powers of $eta$ have canceled. We now bound the right-hand side uniformly over the preceding points in each
    affine span.
  Put $gamma = alpha n - \( m - 2 \)$. Cauchy–Schwarz and (8) give, for each fixed preceding tuple,
  $ nu { D_i lt.eq delta } lt.eq \( B C^d \)^(1 \/ 2) delta^(gamma \/ 2) wide \( 0 < delta lt.eq 1 \) . $
  The chosen $k \, m$ satisfy $gamma \/ 2 - k gt.eq n \/ 8$. Integrating the tail of $D_i^(- k)$ therefore gives
  $ integral D_i^(- k) thin d nu & lt.eq 1 + k integral_0^1 nu { D_i lt.eq delta } delta^(- k - 1) thin d delta\
 & lt.eq 1 + frac(k \( B C^d \)^(1 \/ 2), gamma \/ 2 - k) lt.eq C^d B^(1 \/ 2) . $
  Integrate $z_m \, z_(m - 1) \, dots.h \, z_2$ in this order in (9);
    the remaining $z_1$ integral has mass at most one. Taking the $m$th root gives
  $ parallel F_eta parallel_m lt.eq #scale(x: 120%, y: 120%)[\[] C^(k \( m - 1 \)) \( C^d B^(1 \/ 2) \)^(m - 1)
    #scale(x: 120%, y: 120%)[\]]^(1 \/ m) lt.eq C^d B^(1 \/ 2) . $
  To recover exact labels, let $psi$ be continuous and compactly supported in the variables $\( X \, u \)$.
    Averaging $psi$ over a shrinking box and applying bounded convergence shows
  $ integral psi F_eta thin d P_X thin d u arrow.r integral psi \( X \, X a \( z \) \) thin d P_X thin d nu \( z \) . $
  Hölder’s inequality bounds this limiting functional by $C^d B^(1 \/ 2) parallel psi
    parallel_(m \/ \( m - 1 \))$. Continuous compactly supported functions are dense in
    $L^(m \/ \( m - 1 \)) \( P_X d u \)$. Duality supplies an $L^m$ density with that bound.
    Agreement on continuous compactly supported tests identifies the two locally finite Borel measures.
    This proves (7) for the exact joint law, so it can be tested against arbitrary measurable message rules. ◻
]

=== 3.2 The information in one message <ld:sec:message>

The weighted estimate allows us to control the probability of each message as a function of the signal.
  That is the link between the geometric hypothesis and information.

#thm([Lemma 3.4.])[
  (One block).  #emph[Let $mu \, Q \, B$ satisfy (6). Draw $Z tilde.op mu$ and a standard Gaussian $k times
    d$ matrix $X$ independently. Suppose $W$ has at most $N$ values and conditional probabilities
    $pi_w \( X \, X phi.alt \( Z \) \)$. Assume each $pi_w$ is Borel on $bb(R)^(k times d) times bb(R)^k$,
    with $pi_w gt.eq 0$ and $sum_w pi_w \( X \, y \) = 1$ for every $\( X \, y \)$. Then
#[#set math.equation(numbering: n => "(10)")
 $ I_mu \( Z \; W \) lt.eq C d + log B + #scale(x: 120%, y: 120%)[\(] 2 \/ m +
   e^(- c k) #scale(x: 120%, y: 120%)[\)] log N $ <ld:eq:block>]

 for absolute constants $C \, c > 0$.]
] <ld:lem:block>

#proof[
  Keep the normalization $X phi.alt \( z \) = X c_Q + r X a \( z \)$ from Section 3.1.
    Let $L = { u in bb(R)^k : parallel u parallel lt.eq 4 sqrt(k) }$. Since $parallel a \( z \) parallel lt.eq 2$,
  #[#set math.equation(numbering: n => "(11)")
   $ bb(P)_X { X a \( z \) in.not L } lt.eq e^(- c k) $ <ld:eq:tail>]
  uniformly in $z$. For example, if $G$ is standard Gaussian in $bb(R)^k$,
    then $bb(E) e^(parallel G parallel^2 \/ 4) = 2^(k \/ 2)$,
    and Markov’s inequality at $parallel G parallel > 2 sqrt(k)$ proves this with $c = 1 - 1 / 2 log 2$.
    Also $\| L \| = v_k \( 4 sqrt(k) \)^k lt.eq C^k$.
  Define the subprobabilities
  $ p_w \( z \) = bb(E)_X #scale(x: 120%, y: 120%)[\[] pi_w \( X \, X phi.alt \( z \) \)
    upright(bold(1))_({ X a \( z \) in L }) #scale(x: 120%, y: 120%)[\]] $
  For a reference experiment, keep $X$ Gaussian and replace the normalized exact label $X
    a \( z \)$ by an independent uniform point in $L$. Its message probabilities are
  $ b_w = \| L \|^(- 1) integral_L bb(E)_X pi_w \( X \, X c_Q + r u \) thin d u . $
  They satisfy $sum_w b_w = 1$. This uses the probability-kernel identity at every label,
    including labels outside the support of the observation law.
    Test Lemma 6 with $pi_w \( X \, X c_Q + r u \) upright(bold(1))_L \( u \)$.
    Because $0 lt.eq pi_w lt.eq 1$, Hölder’s inequality gives, for every $parallel h parallel_2 lt.eq 1$,
  $ integral \| h \| p_w thin d mu lt.eq C^d B^(1 \/ 2) \( \| L \| b_w \)^(1 - 1 \/ m) . $
  Duality in $L^2 \( mu \)$ consequently gives
  #[#set math.equation(numbering: n => "(12)")
   $ parallel p_w parallel_2 lt.eq A b_w^(1 - 1 \/ m) \, wide A = C^d B^(1 \/ 2) gt.eq 1 . $ <ld:eq:message-norm>]
  We next turn this into information without assuming that the posterior is uniform.
    Adjoin the bit $G = upright(bold(1))_({ X a \( Z \) in L })$ to $W$,
    which can only increase mutual information. Put $P_w = integral p_w thin d mu$ and $P_g = sum_w P_w$.
    For $P_w > 0$, Jensen’s inequality under the probability measure $p_w mu \/ P_w$ gives
  $ integral p_w log \( p_w \/ P_w \) thin d mu lt.eq 2 P_w log \( parallel p_w parallel_2 \/ P_w \) . $
  Thus the contribution from $G = 1$ to $I \( Z \; W \, G \)$ is at most
  $ 2 log A - \( 2 - 2 \/ m \) sum_w P_w log \( P_w \/ b_w \)\
 + \( 2 \/ m \) sum_w P_w log \( 1 \/ P_w \) . $
  If $b_w = 0$, then (12) gives $P_w = 0$, and the corresponding terms vanish.
    The log-sum inequality and the entropy bound for $N$ outcomes give
  $ sum_w P_w log \( P_w \/ b_w \) gt.eq P_g log P_g \, wide sum_w P_w log \( 1 \/ P_w \) lt.eq log N - P_g log P_g . $
  The good contribution is therefore at most $2 log A + \( 2 \/ m \) log N - 2 P_g log P_g$.
  For $G = 0$, let $q_w \( z \)$ be the corresponding conditional subprobability and $Q_w =
    integral q_w thin d mu$. Since $q_w lt.eq 1$,
  $ sum_w integral q_w log \( q_w \/ Q_w \) thin d mu lt.eq sum_w Q_w log \( 1 \/ Q_w \) lt.eq P_b log N -
    P_b log P_b \, $
  where $P_b = 1 - P_g lt.eq e^(- c k)$ by (11). The functions $- P_g log P_g$ and $-
    P_b log P_b$ are bounded by absolute constants. Finally $2 log A lt.eq C d + log B$, proving (10). ◻
]

=== 3.3 Selecting a cell and paying for its entropy <ld:sec:localization>

After a message, (6) may fail with a useful value of $B$.
  We restore it by selecting a cell using the current posterior.
  The selection must be based on the event of choosing that cell,
  rather than on the larger event that the signal merely lies in it.

Fix a finite-valued history $H$ and a value $h$ of probability $p > 0$.
  Suppose the posterior $lambda = cal(L) \( Z divides H = h \)$ is supported in a level-$J$ dyadic cell $Q$.
  A descendant $R$ at relative depth $j$ is called #emph[heavy] when

$ lambda \( R \) gt.eq 2^(- alpha n j) . $

For $Z$ drawn from $lambda$, let $U$ be its deepest heavy ancestor inside $Q$,
  and write $j \( U \)$ for its relative depth.

#thm([Lemma 3.5.])[
  (Deepest heavy cell).  #emph[The selection $U$ is measurable and finite-valued.
    Put $p_R = bb(P) \( U = R divides H = h \)$ for each selected cell of positive probability, and define
$ B_R = max { 1 \, 2^(- alpha n j \( R \)) \/ p_R } . $

 The conditional law $cal(L) \( Z divides H = h \, U = R \)$ satisfies (6) with parent $R$ and constant $B_R$. Moreover,
#[#set math.equation(numbering: n => "(13)")
 $ H \( U \) & lt.eq H \( j \( U \) \) + alpha n log 2 thin bb(E) j \( U \) \,\
H \( j \( U \) \) & lt.eq log 2 thin \( bb(E) j \( U \) + 1 \) \,\
bb(E) log B_U & lt.eq H \( j \( U \) \) + 1 . $ <ld:eq:cell-entropy>]

 Here every probability, entropy, and expectation is conditional on $H = h$.]
] <ld:lem:heavy>

#proof[
  For every measurable set $A$, the posterior satisfies $lambda \( A \) lt.eq mu_0 \( A \) \/ p$.
    A heavy cell at relative depth $j$ therefore satisfies
  $ 2^(- alpha n j) lt.eq p^(- 1) 2^(- n \( J + j \)) . $
  Since $1 - alpha > 0$, this bounds $j$. The parent cell is heavy, so each path has a deepest heavy cell.
    There are only finitely many cells at the relevant levels, and all selection events are measurable.
  Fix a selected cell $R$ at relative depth $j$, and let $R'$ be a strict descendant at further depth $l$.
    If $R'$ is heavy, the event ${ U = R } ∩ R'$ is empty: any point of $R'$ has a deeper heavy ancestor.
    If $R'$ is not heavy, then $lambda \( R' \) < 2^(- alpha n \( j + l \))$. In either case,
  $ bb(P) \( Z in R' divides H = h \, U = R \) lt.eq 2^(- alpha n j) / p_R 2^(- alpha n l) lt.eq B_R 2^(- alpha n l) . $
  At depth zero the bound follows from $B_R gt.eq 1$. Notice that this uses the probability $p_R$ of
    #emph[selection]; replacing $p_R$ by $lambda \( R \)$ would condition on a different event.
  At depth $j$, there are at most $K_j = 2^(alpha n j)$ heavy cells,
    because their posterior masses sum to at most one. The entropy chain rule and the bound on the number of
    choices at each depth prove (13). Comparing the depth distribution with the geometric distribution
    $2^(- \( j + 1 \))$, nonnegativity of relative entropy gives (13).
  For the remaining estimate, write $log^(+) x = max { 0 \, log x }$ for $x > 0$.
    Let $P_j = bb(P) \( j \( U \) = j \)$ and, on a level of positive mass, set $rho_R = p_R \/ P_j$.
    There are at most $K_j$ possible cells on that level. Consequently, for $u gt.eq 0$,
  $ bb(P) #h(-0.16667em) {log^(+) frac(1, K_j rho_U) > u thin mid(bar.v) thin j \( U \) = j} lt.eq e^(- u) . $
  Indeed every cell in this event has conditional mass less than $e^(- u) \/ K_j$,
    and there are at most $K_j$ of them. Integrating the tail shows that this positive logarithm has conditional
    expectation at most one. Since
  $ log B_R = log^(+) frac(1, K_j P_j rho_R) lt.eq log \( 1 \/ P_j \) + log^(+) frac(1, K_j rho_R) \, $
  averaging over the levels proves (13). ◻
]

The three estimates serve different purposes. The first pays for the cell itself.
  The second pays for the scale used to name it. The third bounds the extra concentration factor that enters the
  next application of Lemma 7. All three costs are governed by the same expected increase in depth.

=== 3.4 Closing the information bound <ld:sec:iteration>

We can now construct the cells in Theorem 5. The proof compares two bounds for information:
  an upper bound that charges the messages and revelations, and a lower bound supplied by the volume of the final cell.

#proof[
  Start with $Pi_0$ empty, $Q_0$ as above, $J_0 = 0$, and $B_0 = 1$.
    After observing $W_i$, put $Pi_i^(-) = \( Pi_(i - 1) \, W_i \)$.
    Apply Lemma 8 to this history and the parent $Q_(i - 1)$.
    Let $Q_i$ be the selected cell, $j_i$ its relative depth, and $J_i = J_(i - 1) + j_i$.
    Set $Pi_i = \( Pi_i^(-) \, Q_i \)$, and let $B_i$ be the constant supplied by that lemma.
  Only positive-probability histories matter. Each history has a finite range by induction:
    the message range is finite, and each intermediate history permits finitely many selected cells by Lemma 8.
    Thus every entropy below is finite. Fresh rows remain independent of $Z$ conditional on the past,
    because all past messages and revelations depend only on $Z$, past data, and independent past randomization.
    The rule for $W_i$, conditional on this enlarged history, is an admissible kernel for Lemma 7;
    the extra cells are analysis variables and do not change the original rule.
  Let $h_i = H \( j_i divides Pi_i^(-) \)$, including the average over intermediate histories.
    The alphabet hypothesis and Lemmas 7 and 8 give
  $ I \( Z \; W_i divides Pi_(i - 1) \) lt.eq C d + bb(E) log B_(i - 1) \, wide bb(E) log B_i lt.eq h_i + 1 . $
  The selection is deterministic from $\( Z \, Pi_i^(-) \)$, so
  $ I \( Z \; Q_i divides Pi_i^(-) \) & = H \( Q_i divides Pi_i^(-) \)\
 & lt.eq h_i + alpha n log 2 thin bb(E) j_i \, wide h_i lt.eq log 2 thin \( bb(E) j_i + 1 \) . $
  Summing the information chain rule, using $B_0 = 1$ and $sum_i j_i = J_t$, yields
  #[#set math.equation(numbering: n => "(14)")
   $ I \( Z \; Pi_t \) lt.eq C d t + \( alpha n + 2 \) log 2 thin bb(E) J_t . $ <ld:eq:depth-upper>]
  The $2$ in the depth coefficient accounts for the depth entropy at selection and for its use in the next block’s
    concentration factor.
  For a fixed terminal history, its posterior $lambda$ is supported in its level-$J_t$ cell $Q_t$.
    Writing $mu_0 \( thin dot.op divides Q_t \)$ for normalized restriction to this cell gives the exact identity
  $ D \( lambda parallel mu_0 \) = n J_t log 2 + D #scale(x: 120%, y: 120%)[\(] lambda parallel
    mu_0 \( thin dot.op divides Q_t \) #scale(x: 120%, y: 120%)[\)] . $
  Nonnegativity and averaging imply
  #[#set math.equation(numbering: n => "(15)")
   $ I \( Z \; Pi_t \) gt.eq n log 2 thin bb(E) J_t . $ <ld:eq:depth-lower>]
  Combining (14) and (15), and using $\( 1 - alpha \) n - 2 gt.eq n \/ 4$ for large $n$, proves $bb(E) J_t lt.eq
    C t$. Substitution into (14) proves (5). ◻
]

The strict inequality $alpha < 1$ is what makes this comparison close.
  Revealing depth $J_t$ certifies $n J_t log 2$ information,
  while the heavy-cell count charges only $alpha n J_t log 2$, apart from the two scale-entropy terms.
  No uniformity assumption on the posteriors is used.

=== 3.5 Application to finite-state Gaussian regression <ld:sec:learners>

The information theorem applies to the finite-state model of Section 2.
  This application uses the original every-signal success premise to obtain success under the cube prior.

#thm([Corollary 3.6.])[
  #emph[Suppose $M \( d \) = o \( d^2 \)$ and $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    If a family of learners in the model of Section 2 satisfies
$ bb(P) { arccos chevron.l hat(s) \, s chevron.r lt.eq epsilon.alt \( d \) } gt.eq 2 \/ 3 wide
  upright("for every ") s in S^(d - 1) \, $

 then $T \( d \) gt.eq c d log \( 1 \/ epsilon.alt \( d \) \)$ for an absolute $c >
   0$ and all sufficiently large $d$. The dimension threshold may depend on the memory sequence.]
] <ld:cor:streaming>

#proof[
  First average the success guarantee over $s = phi.alt \( Z \)$, $Z tilde.op mu_0$.
    Fix the shared rule-selection randomness, if present, with cube-prior average success greater than $3 \/ 5$;
    such a choice exists because the original average is at least $2 \/ 3$.
    The chart has full-rank derivative because its first $n$ coordinates are $z$, so Lemma 2 applies.
    Apply Lemma 1 to these fixed rules. Now expose all remaining independent randomness and fix a realization with
    prior-average success at least $3 \/ 5$. Finite transition and stopping kernels can be sampled using
    independent uniforms indexed by state and sample index. Output laws can likewise be sampled in advance for
    each terminal state and stopping index. The resulting deterministic learner has the same state bound,
    and its output is a function of its terminal state and stopping index.
  Divide its horizon into $t = ceil.l T \/ k ceil.r$ blocks.
    Pregenerate all $k$ rows in every block, including an unused final suffix.
    A block message records one of the following: the continuing state;
    a terminal state together with the local stopping offset;
    or a dummy value if the learner was already inactive. Allowing offsets at the block endpoints and immediate
    stopping, it suffices to use
  #[#set math.equation(numbering: n => "(16)")
   $ N lt.eq \( k + 3 \) 2^M + 1 . $ <ld:eq:stop-alphabet>]
  The transcript determines the global stopping index from the block index and local offset.
    Conditional on its past, the starting state is known, and composing the transitions gives a measurable rule of
    the whole exact block. Thus Theorem 5 applies. Eventually $M lt.eq d^2$, so (16) gives $log N lt.eq
    C d^2$ and hence (4) with an absolute $C_0$.
  We next lower-bound the information needed for accurate estimation.
    For a fixed unit vector $v$, angular error at most $epsilon.alt$ implies $parallel phi.alt \( Z \) -
    v parallel lt.eq epsilon.alt$, and hence $parallel Z - P_(bb(R)^n) v parallel lt.eq epsilon.alt$.
    The normalized cube volume of this event is at most
  #[#set math.equation(numbering: n => "(17)")
   $ n^(n \/ 2) v_n epsilon.alt^n lt.eq \( 5 epsilon.alt \)^n . $ <ld:eq:cap>]
  Let $p gt.eq 3 \/ 5$ be the success probability for the fixed learner and the cube prior.
    Under the product of the marginal laws of $\( Z \, hat(s) \)$,
    the same success event has probability $p_0 lt.eq \( 5 epsilon.alt \)^n$.
    Relative-entropy data processing to its binary indicator gives
  $ I \( Z \; hat(s) \) & gt.eq p log \( p \/ p_0 \) + \( 1 - p \) log \( \( 1 - p \) \/ \( 1 - p_0 \) \)\
 & gt.eq p log \( 1 \/ p_0 \) - log 2\
 & gt.eq p n log \( 1 \/ \( 5 epsilon.alt \) \) - log 2 . $
  For $epsilon.alt lt.eq 1 \/ 10$,
  $ log \( 1 \/ \( 5 epsilon.alt \) \) gt.eq (1 - frac(log 5, log 10)) log \( 1 \/ epsilon.alt \) . $
  Since the output is determined by the messages, data processing and Theorem 5 imply $t gt.eq
    c log \( 1 \/ epsilon.alt \)$ for large $d$.
  It remains to remove the ceiling in $t = ceil.l T \/ k ceil.r$.
    Return to the original randomized learner and average its every-signal success over a uniform spherical
    signal. The $T > d \/ 8$ instance of Lemma 3 applies to this same learner and prior;
    it grants the entire stream and therefore includes early stopping.
    This step does not infer cube-prior success from a sphere-average premise.
    Thus $T \/ k gt.eq 1$, $ceil.l T \/ k ceil.r lt.eq 2 T \/ k$, and $k gt.eq c' d$ for large $d$.
    The block lower bound gives $T gt.eq c'' d log \( 1 \/ epsilon.alt \)$, as required. ◻
]

== 4 Maximum-score localization <l:maxscore:section>

We now select a cell by maximizing its posterior mass weighted by depth.
  The selected posterior again satisfies a dyadic mass bound,
  with a slack that accounts for conditioning on the selection event.
  We first construct the selection and estimate its entropy.
  We then prove a block-information estimate that charges one half of the incoming slack.
  The iteration closes because the cell volume certifies more information per level than the leading cost of
  naming the cell; the depth entropy controls the remaining slack.

Put $n = d - 1$, let $tau$ be uniform probability on

$ Q = \[ - 1 \/ \( 2 sqrt(n) \) \, 1 \/ \( 2 sqrt(n) \) \]^n \, wide
  s \( z \) = \( z \, sqrt(1 - parallel z parallel^2) \) . $

Assign dyadic boundaries consistently to obtain a nested Borel partition.
  The proof of Lemma 4 applies on this closure: a depth-$i$ cell has side $2^(- i) \/
  sqrt(n)$ and $tau$-mass $2^(- n i)$, the graph map is $2$-Lipschitz, and its first $n$ coordinates recover $z$. Set

$ k = ell = floor.l n \/ 8 floor.r \, wide beta = n \/ 2 \, $

and take $n$ sufficiently large that $k = ell gt.eq 2$. For a probability $mu$ supported on a depth-$i$ cell $C$,
  the mass bound with slack $a gt.eq 0$ is

#[#set math.equation(numbering: n => "(18)")
 $ mu \( B \) lt.eq e^a 2^(- beta j) quad upright("for every depth-") \( i + j \) upright(" subcell ") B subset.eq
   C \, quad j gt.eq 0 . $ <l:maxscore:spread>]

=== 4.1 Selecting a scale and paying for its label <selecting-a-scale-and-paying-for-its-label>

After a block, we restore this bound by examining all depths on the cell chain of the sampled point.
  We reveal the first maximizing depth and its cell. The resulting law is conditioned on the selection event
  inside that cell, which is generally a proper subset.

#thm([Lemma 4.1.])[
  (Maximum-score refinement).  #emph[Let a positive-probability discrete history, of probability $P > 0$,
    have posterior $pi$ for $Z tilde.op tau$, supported on a depth-$i$ cell $C$. Thus $pi lt.eq tau \/ P$.
    For $z in C$, let $C_(i + j) \( z \)$ be its depth-$\( i + j \)$ cell. Choose the first maximizer $J gt.eq 0$ of
$ 2^(beta j) pi \( C_(i + j) \( Z \) \) \, wide j gt.eq 0 \, $

 and reveal $\( J \, B \)$, where $B = C_(i + J) \( Z \)$. This is a measurable finite selection and
$ J lt.eq frac(log \( 1 \/ P \), \( n - beta \) log 2) . $

 For an outcome $\( j \, B \)$ of conditional probability $p > 0$,
   the resulting posterior satisfies (18) in $B$ with slack $a' = log \( pi \( B \) \/ p \) gt.eq 0$.
   Conditionally on the original history,
#[#set math.equation(numbering: n => "(19)")
 $ bb(E) a' & lt.eq H \( J \) lt.eq \( 1 + bb(E) J \) log 2 \,\
H \( J \, B \) & lt.eq \( beta + 1 \) \( log 2 \) bb(E) J + log 2 . $ <l:maxscore:slack-charge>]

]
] <l:maxscore:refinement>

#proof[
  The score at depth zero is one. Every score at depth $j$ is at most
  $ P^(- 1) 2^(- n \( i + j \)) 2^(beta j) = P^(- 1) 2^(- n i) 2^(- \( n - beta \) j) \, $
  which tends to zero uniformly in $z$. Hence a maximum is attained among finitely many depths.
    The first such depth is measurable because each score is constant on Borel cells and there are countably many
    score comparisons. Comparing its score with one proves the stated bound on $J$.
  Let $E_(j \, B) subset.eq B$ be the actual selection event, of $pi$-mass $p$.
    Comparison with the depth-zero score gives $pi \( B \) gt.eq 2^(- beta j)$.
    If a further subcell $B' subset.eq B$ of relative depth $m$ has positive posterior mass after selection,
    it meets $E_(j \, B)$. The maximizing inequality at such a point implies $pi \( B' \) lt.eq
    2^(- beta m) pi \( B \)$. Its new posterior mass is therefore at most $p^(- 1) pi \( B' \) lt.eq
    e^(a') 2^(- beta m)$; if it has zero selected mass, the same bound holds.
    Since $p lt.eq pi \( B \)$, the slack is nonnegative.
  For fixed $j$, let $p_B$ be the probabilities of its cell outcomes and $p_j = sum_B p_B$.
    These $B$’s are disjoint at one grid level, so $sum_B pi \( B \) lt.eq 1$. The log-sum inequality then gives
  $ sum_B p_B log frac(pi \( B \), p_B) lt.eq p_j log \( 1 \/ p_j \) . $
  Summing over $j$ proves $bb(E) a' lt.eq H \( J \)$. Comparison of the law of $J$ with the probability vector
    $\( 2^(- j - 1) \)_(j gt.eq 0)$, by nonnegativity of relative entropy,
    gives $H \( J \) lt.eq \( 1 + bb(E) J \) log 2$. These quantities are finite because $J$ has the displayed
    finite bound. Finally
  $ log \( 1 \/ p \) = log \( 1 \/ pi \( B \) \) + a' lt.eq beta j log 2 + a' . $
  Averaging proves (19). ◻
]

The refinement has two costs: the entropy of its label and the slack in the selected posterior.
  The lemma bounds both in terms of the expected depth increase.
  It remains to control the information in a fresh block under (18).
  The next estimate retains the mass of a restricted event,
  so that it can subsequently be applied to sets where a message creates a large posterior density.

=== 4.2 Projection moments of a restricted measure <projection-moments-of-a-restricted-measure>

The inverse-distance calculation is related to the Gaussian projection method of Sharan, Sidford,
  and Valiant #cite(label("SSV2019")). We give the full estimate for exact block observations and arbitrary
  measurable state rules. Restrictions are left unnormalized throughout.

#thm([Lemma 4.2.])[
  (Restricted projection moment).  #emph[Let $mu$ be a probability measure supported on a depth-$i$ cell $C
    subset.eq Q$ satisfying (18) with slack $a gt.eq 0$. Set $r = 2^(- i)$.
    There are absolute constants $C_2 \, C_3 gt.eq 1$ such that, with $K = C_2^n e^a$,
    the following assertions hold. For every $mu$-measurable $F subset.eq C$ of mass $f =
    mu \( F \)$ and every affine subspace $P subset.eq bb(R)^d$ of dimension at most $ell$,
#[#set math.equation(numbering: n => "(20)")
 $ integral_F "dist" \( s \( z \) \, P \)^(- k) thin d mu \( z \) lt.eq
   2 r^(- k) K^(1 \/ 3) f^(2 \/ 3) . $ <l:maxscore:fractional>]

 Let $gamma_(k \, d)$ be the law of a $k$-by-$d$ standard Gaussian matrix $A$.
   The joint image of $gamma_(k \, d) \( d A \) thin mu \|_F \( d z \)$ under $\( A \, z \)
   mapsto \( A \, A s \( z \) \)$ has a nonnegative density $v_F \( A \, b \)$ relative to
   $gamma_(k \, d) \( d A \) thin d b$, and
#[#set math.equation(numbering: n => "(21)")
 $ integral v_F \( A \, b \)^ell thin d gamma_(k \, d) \( A \) thin d b lt.eq
   f [C_3^k r^(- k) K^(1 \/ 3) f^(2 \/ 3)]^(ell - 1) . $ <l:maxscore:moment>]

 In particular, for almost every $A$, $v_F \( A \, dot.op \)$ is a density of the image of the unnormalized
   measure $mu \|_F$ under $A s$. When $f = 0$, all these measures and integrals are zero.]
] <l:maxscore:projection>

#proof[
  Let $z_c$ be the center of $C$ and $s_c = s \( z_c \)$. The radius of $C$ is $r \/ 2$,
    so its graph image lies in $B \( s_c \, r \)$. For $0 < h lt.eq r$, choose $j gt.eq 0$ with $r 2^(- j) lt.eq
    h < 2 r 2^(- j)$. A depth-$\( i + j \)$ cell meeting the first-coordinate projection of an ambient ball of
    radius $h$ lies in the concentric $n$-ball of radius $3 r 2^(- j)$.
    These cells have disjoint interiors and volume $\( r 2^(- j) \/ sqrt(n) \)^n$.
    The unit-ball volume estimate $v_n lt.eq \( 2 pi e \/ n \)^(n \/ 2)$ therefore bounds their number by $C^n$,
    for an absolute $C$, by the Gaussian-integral proof in Lemma 4. By (18),
  #[#set math.equation(numbering: n => "(22)")
   $ mu { z : parallel s \( z \) - x parallel lt.eq h } lt.eq C^n e^a \( h \/ r \)^beta . $ <l:maxscore:ball>]
  After increasing $C$, this bound also holds trivially when $h > r$.
  If $P$ has dimension $m lt.eq ell$, the projection of $B \( s_c \, r \)$ onto $P$ is contained in an $m$-ball of
    radius $r$. A maximal $h$-separated set in that ball has at most $\( 1 + 2 r \/ h \)^m$ points:
    its disjoint radius-$h \/ 2$ balls fit inside the concentric ball of radius $r + h \/ 2$.
    Ambient balls of radius $2 h$ about these centers cover points of $B \( s_c \, r \)$ at distance at most $h$
    from $P$. Applying the ball bound and absorbing the covering constants gives, for $C_2$ absolute,
  #[#set math.equation(numbering: n => "(23)")
   $ mu { z : "dist" \( s \( z \) \, P \) lt.eq h } lt.eq K \( h \/ r \)^(beta - m) wide \( 0 < h lt.eq r \) .
     $ <l:maxscore:tube>]
  The estimate also shows that $P$ has zero $mu$-mass.
  Suppose $f > 0$, and put $theta = k \/ \( beta - m \)$. Since $m lt.eq ell = k lt.eq n \/ 8$,
    we have $theta lt.eq 1 \/ 3$. For $t gt.eq 1$, the $mu$-mass within $F$ where
    $\( r \/ "dist" \( s \( z \) \, P \) \)^k > t$ is at most $min { f \, K t^(- 1 \/ theta) }$.
    Integrating this tail and splitting at $t = \( K \/ f \)^theta gt.eq 1$ gives
  $ integral_F (frac(r, "dist" \( s \( z \) \, P \)))^k thin d mu lt.eq
    frac(K^theta f^(1 - theta), 1 - theta) lt.eq 2 K^(1 \/ 3) f^(2 \/ 3) . $
  Here $K gt.eq 1$, $0 < f lt.eq 1$, and $theta lt.eq 1 \/ 3$ justify the last inequality. This proves (20).
  Let $nu_A$ be the image of $mu \|_F$ under $z mapsto A s \( z \)$.
    If $F$ is measurable only in the completion, replace it by a Borel representative modulo $mu$,
    which leaves the restricted measure unchanged. For $h > 0$,
    write $v_k$ for the volume of the unit ball in $bb(R)^k$ and define its ball-average density
  $ v_(F \, h) \( A \, b \) = frac(nu_A \( B \( b \, h \) \), v_k h^k) . $
  Expand the $ell$th power using $z_1 \, dots.h \, z_ell$ integrated against $\( mu \|_F \)^(⊗ ell)$,
    and put $s_j = s \( z_j \)$. The intersection of the balls $B \( A s_j \, h \)$ has volume at most $v_k h^k$,
    and is empty unless $parallel A \( s_j - s_1 \) parallel lt.eq 2 h$ for all $2 lt.eq j lt.eq ell$.
    For a fixed tuple, condition successively on the preceding difference images.
    Orthogonal decomposition of each Gaussian row shows that the conditional image at step $j$ has an independent
    centered residual with covariance $"dist" \( s_j \, P_j \)^2 I_k$, where
  $ P_j = s_1 + "span" { s_t - s_1 : 2 lt.eq t < j } . $
  The subspace bound makes all zero-distance tuples null. On every remaining tuple,
    the conditional probability of a radius-$2 h$ ball is at most
  $ v_k \( 2 h \)^k \( 2 pi \)^(- k \/ 2) "dist" \( s_j \, P_j \)^(- k) . $
  Multiplying these bounds, dividing by $\( v_k h^k \)^ell$,
    and including the intersection volume cancels every $h$ and $v_k$ factor.
    Integrating $z_ell \, dots.h \, z_2$ in this order and applying (20) at each step leaves the factor
    $mu \( F \) = f$ for $z_1$. Absorbing the numerical Gaussian and radius factors into $C_3^k$ proves
  $ integral v_(F \, h)^ell thin d gamma_(k \, d) thin d b lt.eq f \[ C_3^k r^(- k) K^(1 \/ 3) f^(2 \/ 3) \]^(ell - 1) $
  uniformly for $h > 0$.
  For every continuous compactly supported test function on the matrix and label space,
    integrals against these ball averages converge as $h arrow.b
    0$ to its integral against the exact joint image measure.
    This follows by averaging translations of the test function over a shrinking ball and then using bounded
    convergence. Hölder’s inequality bounds the limiting functional on
    $L^(ell \/ \( ell - 1 \)) \( gamma_(k \, d) \( d A \) thin d b \)$ by the $ell$th root of the last display.
    Continuous compactly supported tests are dense for this locally finite reference measure.
    Extension and $L^p$ duality therefore give a jointly measurable representing density with (21);
    equality on these tests identifies it with the exact image measure and makes it nonnegative.
    Finally, testing the joint identity on a countable algebra of rational label boxes and arbitrary measurable
    matrix sets identifies the conditional density for almost every $A$.
    The averaging operation has only proved a statement about exact labels; it is absent from the observation rule. ◻
]

=== 4.3 The one-half cost of slack <the-one-half-cost-of-slack>

#thm([Lemma 4.3.])[
  (Information from one block).  #emph[In the setting of Lemma 11, let $Z tilde.op mu$ be independent of $A$.
    Suppose a variable $U$, taking at most $W lt.eq \( k + 2 \) 2^(d^2)$ values,
    is generated from the exact data $\( A \, A s \( Z \) \)$ by a measurable probability kernel.
    There is an absolute $C_0$ such that, for all sufficiently large $d$,
#[#set math.equation(numbering: n => "(24)")
 $ I \( Z \; U \) lt.eq C_0 d + a / 2 . $ <l:maxscore:block-information>]

]
] <l:maxscore:block>

#proof[
  Write $q_u \( A \, b \)$ for the kernel probabilities, so that $q_u gt.eq 0$ and $sum_u q_u = 1$.
    With the center $s_c$ used above, define
  $ E = { parallel A s \( Z \) - A s_c parallel lt.eq 3 r sqrt(k) } \, wide V =
    v_k \( 3 r sqrt(k) \)^k lt.eq \( 3 sqrt(2 pi e) thin r \)^k . $
  For each fixed $Z$, the vector $A \( s \( Z \) - s_c \)$ is Gaussian with covariance at most $r^2 I_k$. Hence
  $ Pr \( E^c divides Z \) lt.eq e^(- 9 k \/ 4) 2^(k \/ 2) lt.eq e^(- k) \, $
  by Markov’s inequality and $bb(E) exp \( parallel G parallel^2 \/ 4 \) =
    2^(k \/ 2)$ for standard Gaussian $G in bb(R)^k$. Define comparison probabilities
  $ lambda_u = bb(E)_A 1 / V integral_(B \( A s_c \, 3 r sqrt(k) \)) q_u \( A \, b \) thin d b \, wide
    sum_u lambda_u = 1 . $
  These probabilities use an auxiliary label uniform on the displayed ball, independently conditional on $A$.
  For a measurable $F$ of mass $f$, apply Hölder to its exact joint density $v_F$ and the function
    $q_u \( A \, b \) upright(bold(1))_({ parallel b - A s_c parallel lt.eq 3 r sqrt(k) })$.
    Since $0 lt.eq q_u lt.eq 1$, its conjugate norm is at most $\( V lambda_u \)^(1 - 1 \/ ell)$.
    Lemma 11 therefore gives
  $ Pr \( Z in F \, U = u \, E \) lt.eq \( V lambda_u \)^(1 - 1 \/ ell) {
    f \[ C_3^k r^(- k) K^(1 \/ 3) f^(2 \/ 3) \]^(ell - 1) }^(1 \/ ell) . $
  The $r$ powers cancel. The exact exponent of $f$ is
  $ frac(1 + \( 2 \/ 3 \) \( ell - 1 \), ell) = 2 / 3 + frac(1, 3 ell) . $
  Because $f lt.eq 1$, it may be weakened to $2 \/ 3$. The exponent of $K$ is $\( ell - 1 \) \/ \( 3 ell \) lt.eq
    1 \/ 3$. Thus, for an absolute $C_4 gt.eq 1$,
  #[#set math.equation(numbering: n => "(25)")
   $ Pr \( Z in F \, U = u \, E \) lt.eq L_0 lambda_u^(1 - 1 \/ ell) f^(2 \/ 3) \, wide L_0 =
     C_4^n e^(a \/ 3) . $ <l:maxscore:event>]
  Put $p_u = Pr \( U = u \, E \)$. For $p_u > 0$, let $nu_u = cal(L) \( Z divides U = u \, E \)$ and $f_u =
    d nu_u \/ d mu$. Applying (25) with $F = C$ shows that
  $ D_u^(*) = frac(L_0 lambda_u^(1 - 1 \/ ell), p_u) gt.eq 1 \; $
  in particular $lambda_u > 0$. Since $mu { f_u > e^t } lt.eq e^(- t)$, a second application to that set gives
  $ nu_u { log f_u > t } lt.eq min { 1 \, D_u^(*) e^(- 2 t \/ 3) } wide \( t gt.eq 0 \) . $
  Integrating this upper bound gives $3 / 2 \( log D_u^(*) + 1 \)$.
    Relative entropy is no greater than the expected positive part of the log density, so
  #[#set math.equation(numbering: n => "(26)")
   $ D \( nu_u bar.v.double mu \) lt.eq 3 / 2 \( log D_u^(*) + 1 \) . $ <l:maxscore:posterior-kl>]
  This calculation is why the $a \/ 3$ in $L_0$ becomes $a \/ 2$.
  Let $p_E = sum_u p_u$. The log-sum inequality and the entropy bound for at most $W$ letters give
  $ sum_u p_u log lambda_u / p_u lt.eq p_E log \( 1 \/ p_E \) \, wide sum_u p_u log \( 1 \/ p_u \) lt.eq
    p_E log \( 1 \/ p_E \) + p_E log W . $
  The identity
  $ log lambda_u^(1 - 1 \/ ell) / p_u = (1 - 1 / ell) log lambda_u / p_u + 1 / ell log \( 1 \/ p_u \) $
  therefore bounds the weighted sum of these log ratios by $1 + \( log W \) \/ ell$. All zero terms are omitted.
    For the outcomes $\( U \, E^c \)$, their weighted divergences to $mu$ sum to at most
  $ p_(E^c) log \( 1 \/ p_(E^c) \) + p_(E^c) log W . $
  Indeed, conditioning first on $E^c$ multiplies the density by at most $1 \/ p_(E^c)$,
    and revealing $U$ afterwards adds at most its conditional entropy. This bound is zero when $p_(E^c) = 0$.
  The mutual information of the finite pair $\( U \, upright(bold(1))_E \)$ is the sum of these good and bad
    weighted divergences. Combining the last bounds with (26) gives
  $ I \( Z \; U \) lt.eq I \( Z \; U \, upright(bold(1))_E \) lt.eq C n + a / 2 + C frac(log W, ell) +
    e^(- k) log W + C . $
  Here $\( log W \) \/ ell = O \( d \)$ and $e^(- k) log W = O \( 1 \)$ in the stated width range.
    Absorbing the absolute terms proves (24). ◻
]

=== 4.4 Iteration and the accuracy bound <iteration-and-the-accuracy-bound>

Use the finite-state observation model of Section 2, with an integer horizon $T gt.eq 0$.

#thm([Proposition 4.4.])[
  (Maximum-score information bound).  #emph[Suppose $M lt.eq d^2$.
    For $N = ceil.l T \/ k ceil.r$, the learner under $Z tilde.op
    tau$ has an augmented discrete history $cal(H)_N$ satisfying
#[#set math.equation(numbering: n => "(27)")
 $ I \( Z \; cal(H)_N \) lt.eq C_6 d N \, wide I \( Z \; hat(S) \) lt.eq C_6 d N $ <l:maxscore:total-information>]

 for an absolute $C_6$ and all sufficiently large $d$. If a data-independent shared seed selects the rules,
   the first inequality holds conditional on that seed with the same constant;
   the displayed output bound holds after averaging over it. The statement holds for every finite $T$.]
] <l:maxscore:iteration>

#proof[
  First fix a realization of a data-independent shared seed, if present.
    The graph derivative contains the identity in its first $n$ rows, so Lemma 2 applies to the cube prior.
    For this fixed seed, Lemma 1 supplies everywhere-defined Borel rules with the same prior law.
    We do this separately for each seed value under consideration;
    no jointly chosen family of Borel versions is needed. Use the initial finite state as $cal(H)_0$.
    By the joint independence of the shared seed and initial state from the signal and all rows in Section 2,
    conditional on the fixed seed this state has zero information about $Z$,
    and the future rows remain independent of both. At an active block end record the continuing state or the
    terminal state and its stopping position within the block, including immediate stopping.
    Given the preceding history there are at most $\( k + 2 \) 2^M$ such destinations.
    After a stop, later messages may be dummy messages because the earlier history already records the terminal
    state and index. Padding the last block by ignored Gaussian rows is harmless.
    This count depends only on the block length, not the total horizon.
  Start at depth $i_0 = 0$ with slack $a_0 = 0$. At step $t$, apply Lemma 12 to its outgoing message $U_t$.
    Then apply Lemma 10 to the posterior given $cal(H)_t^(-) = \( cal(H)_(t - 1) \, U_t \)$,
    and append its selection $\( J_t \, B_t \)$ to form $cal(H)_t$.
    The new depth is $i_t = i_(t - 1) + J_t$, and its slack is $a_t$.
    The added labels use only $Z$ and the history already observed.
    Future Gaussian rows remain independent of that joint collection.
    Given the starting state, the message is a kernel of the fresh block data,
    so the block lemma applies on every positive-probability history.
  Every such history of probability $P$ has posterior at most $tau \/ P$. All entropies used below are finite.
    Indeed a block message has a finite alphabet, and the depth bound in Lemma 10 is integrable after averaging
    over the preceding history because it is bounded by a constant times $log \( 1 \/ P \)$.
    The label-charge inequality then preserves finite history entropy by induction.
  The information chain rule, followed by (19) and (19), gives
  $ I \( Z \; cal(H)_N \) & lt.eq
    sum_(t = 1)^N (C_0 d + 1 / 2 bb(E) a_(t - 1) + H \( J_t \, B_t divides cal(H)_t^(-) \))\
 & lt.eq C_5 d N + \( beta + 3 / 2 \) \( log 2 \) sum_(t = 1)^N bb(E) J_t $
  for an absolute $C_5$. On the other hand the final posterior is supported on a depth-$i_N$ cell,
    of prior mass $2^(- n i_N)$. Relative entropy to $tau$ is therefore at least $n i_N log 2$,
    since the conditional divergence to the uniform law of that cell is nonnegative. Averaging yields
  $ I \( Z \; cal(H)_N \) gt.eq n \( log 2 \) bb(E) i_N = n \( log 2 \) sum_(t = 1)^N bb(E) J_t . $
  The ratio $\( beta + 3 \/ 2 \) \/ n = 1 \/ 2 + 3 \/ \( 2 n \)$ is bounded away from one for large $n$.
    Substituting the last bound into the preceding upper bound and moving that term to the left proves
    $I \( Z \; cal(H)_N \) lt.eq C_6 d N$.
  The history records the terminal state and stopping index.
    Conditional on those data, the output uses only fresh randomness,
    so data processing gives $I \( Z \; hat(S) \) lt.eq I \( Z \; cal(H)_N \)$.
    For each fixed seed, Lemma 1 preserved the original conditional prior law,
    so the output-information bound just proved holds for that original law.
    Integrating the original measurable conditional information values over a shared seed $R$,
    whose law is independent of $Z$, gives
  $ I \( Z \; hat(S) \) lt.eq I \( Z \; hat(S) \, R \) = bb(E)_R I \( Z \; hat(S) divides R \) lt.eq C_6 d N . $
  When $T = 0$, the same argument has no blocks and the output is independent of $Z$.
    This proves the stated zero upper bound as well. ◻
]

For a fixed unit output, angular success implies that $Z$ lies within $epsilon.alt$ of its first $n$ coordinates.
  The ball-volume estimate used above and the cube volume $n^(- n \/ 2)$ bound this prior mass by
  $\( sqrt(2 pi e) thin epsilon.alt \)^n lt.eq \( 5 epsilon.alt \)^n$.
  If the learner succeeds with probability at least $2 \/ 3$ for every unit signal,
  its cube success has the same lower bound. Applying (1) to the success event under the joint and product laws,
  and then using (27), gives

#[#set math.equation(numbering: n => "(28)")
 $ 2 / 3 n log frac(1, 5 epsilon.alt) - log 2 lt.eq C_6 d ceil.l T \/ k ceil.r . $ <l:maxscore:accuracy>]

For $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$,

$ L - log 5 gt.eq (1 - frac(log 5, log 10)) L . $

Thus $L lt.eq C \( T \/ k + 1 \)$ for large $d$, uniformly in $0 < epsilon.alt lt.eq 1 \/ 10$.
  If $L gt.eq 2 C$, then $T gt.eq k \( L \/ C - 1 \) gt.eq k L \/ \( 2 C \) gt.eq c d L$.

For the remaining values $L < 2 C$, the original learner needs $T > d \/ 10$ samples.
  Average its every-signal guarantee over a uniform signal $S$ on the full sphere,
  and grant it all $T$ pregenerated rows, including unused rows.
  If $T lt.eq d \/ 10$, Lemma 3 applies to this original randomized learner.
  Writing $V$ for the row span and letting $r_0$ decrease to $epsilon.alt$ in (3) gives

#[#set math.equation(numbering: n => "(29)")
 $ Pr \( upright("success") \) lt.eq 1 / 2 + 1 / 2 Pr { parallel P_(V^perp) S parallel lt.eq epsilon.alt } lt.eq
   1 / 2 + frac(T, 2 d \( 1 - epsilon.alt^2 \)) . $ <l:maxscore:reflection>]

For $T lt.eq d \/ 10$ and $epsilon.alt lt.eq 1 \/ 10$, the right side is less than $2 \/ 3$.
  Combining this linear bound with the large-$L$ bound proves $T = Omega \( d log \( 1 \/ epsilon.alt \) \)$.
  The constant is absolute, and $M \( d \) = o \( d^2 \)$ ensures $M lt.eq d^2$ eventually.
  No restriction on $T$ or on the rate of growth of $L$ was used.

== 5 Regularization from finite relative entropy <l:finite-entropy:section>

This argument restores a dyadic mass bound after every block.
  The input to its refinement procedure is any posterior of finite relative entropy in its current cell.
  The procedure may take an unbounded number of steps, but its expected number of attempts and expected increase
  in depth are finite. These bounds pay for the complete refinement label,
  including every decision to remain outside the selected descendants.
  Finite relative entropy supplies this expected termination bound even when no uniform bound on the posterior
  density is available.

Use the half-open cube $Q_0$, uniform probability $mu_0$, and graph map $phi.alt$ of Section 3.
  In this section write $Q_(upright("ho")) = Q_0$, $mu = mu_0$, $s = phi.alt$, and $n = d - 1$.
  The dyadic cells remain half-open. For a cell $C$, let $mu_C$ be uniform probability on $C$.
  A descendant of relative depth $h$ has $mu_C$-mass $2^(- n h)$.

For a probability $P lt.double mu_C$ of finite relative entropy in a depth-$j$ cell,
  the change of reference measure gives

#[#set math.equation(numbering: n => "(30)")
 $ D \( P bar.v.double mu \) = D \( P bar.v.double mu_C \) + n j log 2 \, $ <l:finite-entropy:cell-divergence>]

because $d mu_C \/ d mu = 2^(n j)$ on $C$. The depth term is the information certified by confinement to the cell;
  the remaining divergence measures concentration within it.
  This identity holds even when $P$ is supported on a proper subset of $C$,
  so complement decisions remain represented in the current-cell divergence.
  The refinement below bounds the expected remaining divergence and expected depth increase by a single budget:
  the incoming divergence plus an absolute constant. That budget also includes decisions that keep the current cell.

#prodef([Definition 5.1.])[
  Put $alpha = 1 \/ 2$. A probability $P$ supported on a cell $C$ is regular on $C$ if every descendant $E$ of
    relative depth $h gt.eq 1$ satisfies
  $ P \( E \) lt.eq 2 thin 2^(- alpha n h) . $
] <l:finite-entropy:regular>

=== 5.1 The refinement and its termination <the-refinement-and-its-termination>

#thm([Lemma 5.2.])[
  (Finite expected regularization).  #emph[Suppose $P lt.double mu_C$ and $K_0 =
    D \( P bar.v.double mu_C \) < oo$. For all sufficiently large $n$,
    a countable label determined by $W tilde.op P$ specifies a descendant $C'$ and a conditional law $P'$ regular
    on $C'$. The label is the whole terminating history in the construction below,
    including every complement decision; $P'$ is conditioned on this label and need not be
    $P \( thin dot.op divides C' \)$.]
  #emph[Let $H$ be the increase in cell depth and $A_(*)$ the number of attempts. Then
$ bb(E) H < oo \, wide bb(E) A_(*) lt.eq 2 \( 1 + bb(E) H \) < oo \, $

 and, with $b = \( 1 - alpha \) \( log 2 \) \/ 2$,
#[#set math.equation(numbering: n => "(31)")
 $ bb(E) D \( P' bar.v.double mu_(C') \) + b n thin bb(E) H lt.eq K_0 + 2 \/ e . $ <l:finite-entropy:budget>]

 The hypothesis imposes no boundedness on $d P \/ d mu_C$.]
] <l:finite-entropy:regularization>

#proof[
  At an attempt, consider the current conditional law in its current cell.
    A strict descendant $E$ of relative depth $h gt.eq 1$ is heavy if its current mass $m_E$ exceeds
    $2^(- alpha n h)$. Select the heavy descendants with no heavy strict ancestor of positive relative depth.
    Every heavy cell has such a first heavy ancestor, because its chain of ancestors back to the current cell is
    finite. The selected cells are a countable disjoint family.
  If $W$ is in one of these cells, reveal which cell, condition on it, replace the current cell by it,
    and begin another attempt. Otherwise reveal that $W$ is in the complement, whose current probability is $q$,
    condition on that complement, and keep the current cell. Stop if $q gt.eq 1 \/ 2$; if $0 < q < 1 \/ 2$,
    begin another attempt. Zero-probability branches are omitted.
    These operations are Borel and the label records their finite sequence if the procedure stops.
  At a stop, a descendant that was heavy immediately before the last complement decision lies in a selected cell,
    so it has zero posterior mass. Every other descendant of depth $h$ had mass at most $2^(- alpha n h)$,
    and conditioning on a complement of probability at least $1 \/ 2$ increases this by at most two.
    The resulting law is therefore regular.
  It remains to prove that a stop occurs and that its cost satisfies (31).
    Let $f$ be the density of the current law relative to the uniform probability on the current cell.
    On a heavy transition of depth $h$, its value at the sampled point changes to
  $ f \( W \) 2^(- n h) / m_E . $
  Its logarithm therefore decreases by at least $\( 1 - alpha \) n h log 2$.
    On a complement transition it increases by $log \( 1 \/ q \)$.
    These are exact density updates on every positive-probability branch,
    with all previous complement exclusions retained in the conditional law.
  Truncate after $N gt.eq 1$ attempts, freezing a path once it has stopped.
    Let $H_N$ be accumulated heavy depth, $J_N$ the sum of complement logarithmic increases,
    and $A_N$ the number of attempts actually made. If $f_N$ is the resulting conditional density,
    the pathwise updates give
  #[#set math.equation(numbering: n => "(32)")
   $ log f_N \( W \) + \( 1 - alpha \) n \( log 2 \) H_N lt.eq log f_0 \( W \) + J_N . $ <l:finite-entropy:path>]
  For an active attempt the conditional expected complement increase, counted as zero on a heavy branch,
    is $q log \( 1 \/ q \) lt.eq 1 \/ e$. Thus
  $ bb(E) J_N lt.eq bb(E) A_N \/ e lt.eq N \/ e . $
  We justify taking expectations of the logarithms before using (32).
    For any density $f$ relative to a probability measure $lambda$,
  $ integral_({ f < 1 }) f log \( 1 \/ f \) thin d lambda lt.eq 1 \/ e \, $
  because $x log \( 1 \/ x \) lt.eq 1 \/ e$ for $0 < x < 1$.
    This bounds the expected negative log part at the sampled point,
    conditionally on each positive-probability history. Finite $K_0$ then makes the positive part of $log
    f_0 \( W \)$ integrable. The path inequality bounds the positive part of $log
    f_N \( W \)$ by $\( log f_0 \( W \) \)^(+) + J_N$. Consequently $bb(E) log
    f_N \( W \)$ is well defined and is the expected conditional relative entropy, hence is nonnegative.
    Taking expectations in (32) first shows $bb(E) H_N < oo$.
  An attempt after the first follows a heavy transition or a continuing complement.
    The number of heavy transitions is at most $H_N$, because each adds at least one unit of depth.
    At each active attempt, the conditional probability of a continuing complement is at most $1 \/ 2$.
    Counting such predecessors and taking expectations gives
  #[#set math.equation(numbering: n => "(33)")
   $ bb(E) A_N lt.eq 1 + bb(E) H_N + 1 / 2 bb(E) A_N \, wide bb(E) A_N lt.eq
     2 \( 1 + bb(E) H_N \) . $ <l:finite-entropy:attempts>]
  Substituting $bb(E) J_N lt.eq bb(E) A_N \/ e$ into the expected path inequality now yields
  #[#set math.equation(numbering: n => "(34)")
   $ bb(E) log f_N \( W \) + #scale(x: 120%, y: 120%)[\(] \( 1 - alpha \) n log 2 -
     2 \/ e #scale(x: 120%, y: 120%)[\)] bb(E) H_N lt.eq K_0 + 2 \/ e . $ <l:finite-entropy:truncated>]
  For sufficiently large $n$, the coefficient is at least $b n = \( 1 - alpha \) n \( log 2 \) \/ 2$.
    Hence the expectations of $H_N$ and, by (33), $A_N$, are bounded uniformly in $N$.
  Both sequences increase on every path. Monotone convergence gives finite expectations for their limits $H \,
    A_(*)$, and preserves $bb(E) A_(*) lt.eq 2 \( 1 + bb(E) H \)$.
    A path that never stops has $A_N arrow.r oo$, so nontermination has probability zero.
    The possible terminating histories form a countable set of finite sequences.
  The limiting complement sum $J$ also satisfies, by monotone convergence,
  $ bb(E) J lt.eq bb(E) A_(*) \/ e lt.eq \( 2 \/ e \) \( 1 + bb(E) H \) < oo . $
  At termination the positive log part of the final density is integrable by the path inequality,
    and its negative log part is integrable by the conditional bound above.
    We may therefore take expectations directly in the terminating path inequality. This gives
  $ bb(E) D \( P' bar.v.double mu_(C') \) + \( 1 - alpha \) n \( log 2 \) bb(E) H lt.eq
    K_0 + \( 2 \/ e \) \( 1 + bb(E) H \) \, $
  which implies (31). In particular, no passage of a signed logarithm through a limit is being used. ◻
]

=== 5.2 Local mass and exact projection densities <local-mass-and-exact-projection-densities>

We next bound the information from a block that starts with a regular law.
  The projection estimate is related to the independent-draw Gaussian projection method of Sharan, Sidford,
  and Valiant #cite(label("SSV2019")) Section 7, Lemma 12. The estimate below is proved for exact multirow
  observations and for finite restrictions with their density multiplier visible.

#thm([Lemma 5.3.])[
  (Ambient ball bound).  #emph[Suppose $d gt.eq 3$ and $P$ is regular on a depth-$j$ cell.
    Let $z$ be the graph image of its center and set $R = 2 thin 2^(- j)$.
    Then the image of $P$ is supported in $B \( z \, R \)$. With $beta = 1 \/ 3$, there is an absolute $C_0 gt.eq
    1$ such that
#[#set math.equation(numbering: n => "(35)")
 $ P { w : parallel s \( w \) - x parallel lt.eq r } lt.eq
   C_0^d \( r \/ R \)^(beta d) quad \( x in bb(R)^d \, med 0 < r lt.eq R \) . $ <l:finite-entropy:ball-bound>]

]
] <l:finite-entropy:ball>

#proof[
  The cell diameter is $2^(- j)$; the $2$-Lipschitz property gives the stated support radius.
    For $r lt.eq R \/ 2$, choose $h gt.eq 1$ with $r lt.eq R 2^(- h) < 2 r$.
    The depth-$\( j + h \)$ cells have side between $r \/ \( 2 sqrt(n) \)$ and $r \/ sqrt(n)$,
    and diameter at most $r$. A ball test for the graph image restricts $w$ to a ball of radius $r$ in its first
    $n$ coordinates. Every cell meeting that ball lies in the concentric ball of radius $2 r$.
    Comparing disjoint cell volumes and using the unit-ball estimate from Lemma 4 gives at most
  $ v_n \( 2 r \)^n \( 2 sqrt(n) \/ r \)^n lt.eq \( 4 sqrt(2 pi e) \)^n $
  such cells. Each has $P$-mass at most $2 thin 2^(- alpha n h)$.
    Since $2^(- h) < 2 r \/ R$ and $alpha n = \( d - 1 \) \/ 2 gt.eq d \/ 3 = beta d$,
    all factors are bounded by $C_0^d \( r \/ R \)^(beta d)$ for an absolute $C_0$.
    For $R \/ 2 < r lt.eq R$, enlarge $C_0$ and use total mass one. ◻
]

#thm([Lemma 5.4.])[
  (Projection with a density multiplier).  #emph[Fix $beta = 1 \/ 3$, put $gamma = beta \/ 2 = 1 \/ 6$,
    and let $p = floor.l beta d \/ 2 floor.r gt.eq 2$. Let $1 lt.eq k lt.eq gamma d \/ 2$,
    and let $rho$ be the law of a $k$-by-$d$ standard Gaussian matrix.
    Suppose that $nu$ is a finite positive Borel measure of mass at most one,
    supported in $B \( z \, R \)$ for $R > 0$, and that for some $a gt.eq 0$,
$ nu \( B \( x \, r \) \) lt.eq e^(a d) C_0^d \( r \/ R \)^(beta d) quad \( x in bb(R)^d \, med 0 < r lt.eq R \) . $

 The image of $rho \( d A \) nu \( d s \)$ under $\( A \, s \)
   mapsto \( A \, A s \)$ has a nonnegative density $g$ relative to $rho \( d A \) thin d y$ with
#[#set math.equation(numbering: n => "(36)")
 $ integral g \( A \, y \)^p thin d rho \( A \) thin d y lt.eq
   [2 R^(- k) e^(\( a + C_1 \) k \/ gamma)]^(p - 1) . $ <l:finite-entropy:projection-moment>]

 Here $C_1 gt.eq 0$ depends only on $C_0$, uniformly over all the other parameters in the stated ranges.]
] <l:finite-entropy:projection>

#proof[
  Let $F$ be an affine subspace of dimension $m lt.eq p - 2$.
    For $0 < r lt.eq R$, a maximal $r$-separated set in the projection of $B \( z \, R \)$ onto $F$ has at most
    $\( 5 R \/ r \)^m$ points, by packing disjoint radius-$r \/ 2$ balls.
    Ambient balls of radius $2 r$ at these centers cover the part of $B \( z \, R \)$ at distance at most $r$ from
    $F$. If $2 r > R$, the trivial mass bound can replace the local bound at that radius,
    whose right side would already be at least one. Since $beta d - m gt.eq gamma d$,
    absorbing the covering constants gives
  #[#set math.equation(numbering: n => "(37)")
   $ nu { s : "dist" \( s \, F \) lt.eq r } lt.eq min { 1 \,
     e^(\( a + C_1 \) d) \( r \/ R \)^(gamma d) } . $ <l:finite-entropy:tube>]
  In particular $F$ has zero $nu$-mass. Set $r_0 = R e^(- \( a + C_1 \) \/ gamma)$.
    Layer-cake integration, using total mass at most one above the cutoff $r_0$, gives
  #[#set math.equation(numbering: n => "(38)")
   $ integral "dist" \( s \, F \)^(- k) thin d nu \( s \) & lt.eq r_0^(- k) +
     k r_0^(- gamma d) integral_0^(r_0) r^(gamma d - k - 1) thin d r\
 & = r_0^(- k) (1 + frac(k, gamma d - k)) lt.eq 2 R^(- k) e^(\( a + C_1 \) k \/ gamma) = :
   B . $ <l:finite-entropy:inverse>]
  The last inequality uses $k lt.eq gamma d \/ 2$.
  Choose a continuous nonnegative probability density $phi_eta$ supported in $B \( 0 \, eta \) subset.eq bb(R)^k$,
    and define
  $ g_eta \( A \, y \) = integral phi_eta \( y - A s \) thin d nu \( s \) . $
  For $nu^(⊗ p)$-almost every tuple $s_1 \, dots.h \, s_p$, the differences $s_i - s_1$, $2 lt.eq i lt.eq p$,
    are linearly independent: at the $i$th step, the preceding affine span has dimension at most $i - 2 lt.eq p -
    2$, so it is null by (37). For such a tuple put $D = \[ s_2 - s_1 \, dots.h \, s_p - s_1 \]$.
    The joint Gaussian vector of its images under $A$ has density at most
  $ \( 2 pi \)^(- k \( p - 1 \) \/ 2) det \( D^(sans(T)) D \)^(- k \/ 2) lt.eq
    product_(i = 2)^p "dist" \( s_i \, "aff" \( s_1 \, dots.h \, s_(i - 1) \) \)^(- k) . $
  The determinant factorization is Gram–Schmidt.
  Expand $g_eta^p$, shift the label integration variable by $A s_1$,
    and integrate over the Gaussian difference images. Bounding their density by the displayed supremum leaves a
    product of $p$ probability kernels. Its integral over the $p -
    1$ difference variables and then the shifted label variable is one.
    Tonelli’s theorem and successive integration of $s_p \, dots.h \, s_2$, using (38), therefore give
  $ integral g_eta^p thin d rho thin d y lt.eq B^(p - 1) \; $
  the last variable contributes $nu \( bb(R)^d \) lt.eq 1$.
  For a continuous compactly supported test function $v \( A \, y \)$,
    integration against $g_eta$ converges to $integral v \( A \, A s \) thin d rho \( A \) d nu \( s \)$ as $eta
    arrow.b 0$. Shrinking support and bounded convergence prove this for the finite measure $nu$.
    Hölder bounds the limiting functional on $L^(p \/ \( p - 1 \)) \( rho \( d A \) thin d y \)$ by
    $B^(\( p - 1 \) \/ p)$. Density of continuous compactly supported tests and $L^p$ duality give a representing
    density with that norm. Equality on those tests identifies it with the exact image measure,
    so a nonnegative version may be used. This proves (36). The auxiliary kernels have been removed before any
    message is formed. ◻
]

=== 5.3 Information in one finite message <information-in-one-finite-message>

#thm([Lemma 5.5.])[
  (Regular block information).  #emph[There is an absolute $c_(*) > 0$ such that the following holds for $k =
    floor.l c_(*) d floor.r$. Let $W$ have any law $P$ regular on one cell of $Q_(upright("ho"))$,
    let $A$ be an independent $k$-by-$d$ standard Gaussian matrix, and put $Y = A s \( W \)$.
    Suppose $U$ takes at most $m_d$ values and is conditionally independent of $W$ given $\( A \, Y \)$.
    If $log m_d = o \( d^2 \)$, then
#[#set math.equation(numbering: n => "(39)")
 $ I \( W \; U \) lt.eq 2 d $ <l:finite-entropy:block-information>]

 for all sufficiently large $d$, uniformly over these laws and channels.
   The threshold may depend on the alphabet sequence, while $c_(*)$ and the coefficient $2$ are absolute.]
] <l:finite-entropy:block>

#proof[
  For each positive-probability letter let $p_u = Pr \( U = u \)$ and $ell_u \( w \) =
    Pr \( U = u divides W = w \)$. Its posterior density relative to $P$ is $ell_u \/ p_u$. Set
  $ B_u = { w : ell_u \( w \) \/ p_u > e^d } \, wide lambda = e^(- d) . $
  Since this density integrates to one, $P \( B_u \) lt.eq lambda$.
    Outside $W in B_U$, the log posterior density is at most $d$.
    We will show that $Pr \( W in B_U \)$ is exponentially small in $d$,
    and then bound its contribution using the finite alphabet.
  Use $z \, R$ from Lemma 16. The exact joint law of $\( A \, Y \)$ has a density $D \( A \, y \)$ by Lemma 17
    with $a = 0$. The graph image of $lambda^(- 1) P \|_(B_u)$ has mass at most one and satisfies the ball
    hypothesis with multiplier $e^d$, namely with $a = 1$. Let $g_u \( A \, y \)$ be its exact projection density
    from Lemma 17. Under the original experiment,
  $ b_u \( A \, Y \) := Pr \( W in B_u divides A \, Y \) = frac(lambda g_u \( A \, Y \), D \( A \, Y \)) $
  almost surely. This is the Radon–Nikodym ratio of the restricted joint measure to the original one;
    points where $D = 0$ have zero original probability.
  To control this ratio, choose an absolute $C_2 > 2 sqrt(2 pi e)$ and define
  $ G = { D \( A \, Y \) gt.eq \( C_2 R \)^(- k) } . $
  For every fixed $s$ in the support, $A \( s - z \)$ is centered Gaussian with covariance at most $R^2 I_k$.
    Markov’s inequality with exponential parameter $1 \/ 4$ gives
  $ Pr { parallel Y - A z parallel > 2 sqrt(k) R } lt.eq e^(- k) 2^(k \/ 2) . $
  The label ball of radius $2 sqrt(k) R$ has volume at most $\( 2 sqrt(2 pi e) R \)^k$.
    The probability of points inside it where $D < \( C_2 R \)^(- k)$, after integrating over $A$,
    is at most $\( 2 sqrt(2 pi e) \/ C_2 \)^k$. Thus
  #[#set math.equation(numbering: n => "(40)")
   $ Pr \( G^c \) lt.eq 2 e^(- c_2 k) $ <l:finite-entropy:good-probability>]
  for some absolute $c_2 > 0$.
  Let $p = floor.l beta d \/ 2 floor.r$. On $G$, the density denominator is bounded below, so
  #[#set math.equation(numbering: n => "(41)")
   $ bb(E) \[ upright(bold(1))_G b_u \( A \, Y \)^p \] & lt.eq
     lambda^p \( C_2 R \)^(k \( p - 1 \)) integral g_u \( A \, y \)^p thin d rho \( A \) thin d y\
 & lt.eq exp { - d p + C_3 k \( p - 1 \) } \, $ <l:finite-entropy:restricted-moment>]
  where
  $ C_3 = log C_2 + \( 1 + C_1 \) \/ gamma + log 2 $
  is valid because $k gt.eq 1$. Choose the fixed $c_(*) > 0$ so that
  $ c_(*) lt.eq gamma \/ 2 \, wide C_3 c_(*) lt.eq 1 \/ 4 . $
  Then the projection lemma applies and the last moment is at most $e^(- 3 d p \/ 4)$ for all sufficiently large $d$.
  Given $\( A \, Y \)$, the conditional independence assumption lets us average the choice of $U$ separately from
    the event $W in B_u$. Consequently
  $ Pr \( W in B_U \, G \) lt.eq bb(E) \[ upright(bold(1))_G max_u b_u \( A \, Y \) \] . $
  The $p$th power of the maximum is at most the sum of the $p$th powers.
    Since $log m_d lt.eq d p \/ 4$ eventually, Hölder and (41) bound this probability by $e^(- d \/ 2)$.
    Also $k gt.eq c_(*) d \/ 2$ eventually, so (40) yields
  $ q_0 := Pr \( W in B_U \) lt.eq e^(- c_3 d) $
  after decreasing an absolute $c_3 > 0$ and increasing the dimension threshold.
  For $q_u = Pr \( U = u \, W in B_u \) lt.eq p_u$, the contribution of the event $W in B_U$ to $bb(E)
    log \( ell_U \( W \) \/ p_U \)$ is at most
  $ sum_u q_u log \( 1 \/ p_u \) lt.eq sum_u q_u log \( 1 \/ q_u \) lt.eq q_0 log \( m_d \/ q_0 \) . $
  The last bound is the entropy bound for at most $m_d$ letters after normalization by $q_0$;
    its value is zero if $q_0 = 0$. The exponential bound on $q_0$ and $log m_d =
    o \( d^2 \)$ make this $o \( 1 \)$. Outside the event, the log posterior density is at most $d$.
    Hence $I \( W \; U \) lt.eq d + o \( 1 \) lt.eq 2 d$, as claimed. ◻
]

=== 5.4 Iteration in the finite-state model <iteration-in-the-finite-state-model>

Use the finite-state model of Section 2, now with $M \( d \) = o \( d^2 \)$.
  Suppose the original learner has angular success at least $2 \/ 3$ for every signal at $0 < epsilon.alt lt.eq
  1 \/ 10$. For the cube experiment, first fix the data-independent shared choice of rules with average success
  greater than $3 \/ 5$, which is possible by averaging the original success $2 \/ 3$.
  The derivative of the graph map contains the identity in its first $n$ rows,
  so Lemma 2 and then Lemma 1 supply Borel representatives for this fixed choice without changing its cube law.
  Now implement the finite-output transition kernels by independent uniforms indexed by state and layer,
  and sample the output law independently for each terminal state and index.
  Include the initial state among these remaining choices; its conditional law given the fixed shared seed is
  independent of the signal and rows by the joint independence in Section 2.
  Averaging these choices fixes a deterministic program with cube success at least $3 \/ 5$.
  This reduction is only for the cube prior.

Use $L_(*) = ceil.l T \/ k ceil.r$ blocks, padding the final block with ignored independent rows.
  Pregenerate rows after any early stop. An active block message records its continuing state,
  or its terminal state and within-block stopping offset, including immediate stopping.
  Use a dummy message on all later blocks. Thus the alphabet per block has size at most

#[#set math.equation(numbering: n => "(42)")
 $ m_d = \( k + 2 \) 2^M + 1 \, wide log m_d = o \( d^2 \) . $ <l:finite-entropy:alphabet>]

The block number is already known, so no factor depending on $T$ is needed.
  The messages determine the terminal state, global stopping index, and fixed output.

Retain the messages in an analysis history. Immediately after each message,
  append the entire regularization label from Lemma 15. Initially the law is $mu$, which is regular.
  On every positive-probability history the current law is regular on its indicated cell.
  That history uses only $W$, past rows, and the fixed rules;
  future independent rows remain independent of it and of $W$.
  Given the entering state, the next message is a channel of the fresh block data.
  Hence Lemma 18 applies conditionally; a dummy message has zero information.

Let $K_i$ be the expected conditional divergence to the uniform law on the current cell after $i$ messages and
  regularizations, and let $j_i$ be the expected current depth. Both start at zero.
  Conditioning a current density $f$ on a message $u$ multiplies it by $ell_u \/ p_u$, where $0 lt.eq ell_u lt.eq
  1$ and $p_u > 0$ on that branch. Taking logarithms and averaging shows that the expected divergence to the old
  cell grows by exactly the conditional mutual information of the message.
  Finite entropy is preserved on each branch: its positive log part grows by at most $log \( 1 \/ p_u \)$,
  and its expectation under the new law is finite because that law has density at most $1 \/
  p_u$ relative to the old one. Its negative part has the universal integrable bound used above.
  The average increase is at most $2 d$ by the block lemma. Applying the regularization budget conditionally then gives

#[#set math.equation(numbering: n => "(43)")
 $ K_(i + 1) + b n j_(i + 1) lt.eq K_i + b n j_i + 2 d + 2 \/ e . $ <l:finite-entropy:iteration>]

This also proves inductively that the next finite-entropy hypothesis holds.

Let $cal(H)$ be the full history, including every complement decision.
  The bound just proved ensures finite expected divergence and depth.
  Histories are countable, so averaging (30) for their conditional laws and using the defining Radon–Nikodym
  identity for mutual information gives

#[#set math.equation(numbering: n => "(44)")
 $ I \( W \; cal(H) \) & = K_(L_(*)) + n \( log 2 \) j_(L_(*))\
 & lt.eq max { 1 \, log 2 \/ b } \( 2 d + 2 \/ e \) L_(*) lt.eq C_4 d L_(*) $ <l:finite-entropy:history-information>]

for an absolute $C_4$. This calculation includes the information in all auxiliary labels;
  it does not assume a bound on their individual Shannon entropies.

The deterministic output is known from $cal(H)$. Lemma 4 bounds the angular success probability of any fixed
  output by $\( sqrt(2 pi e) thin epsilon.alt \)^n$. Under the product law of $W$ and $cal(H)$,
  the same bound holds; under the joint law success is at least $3 \/ 5$. Equation (1) gives the exact endpoint

#[#set math.equation(numbering: n => "(45)")
 $ I \( W \; cal(H) \) gt.eq 3 / 5 n log frac(1, sqrt(2 pi e) thin epsilon.alt) - log 2 . $ <l:finite-entropy:accuracy>]

For $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$,

$ L - log sqrt(2 pi e) gt.eq (1 - frac(log sqrt(2 pi e), log 10)) L \, $

with a positive absolute coefficient. Thus, for sufficiently large $d$, (45) is at least $c d L$,
  uniformly in the accuracy. Combining it with (44) gives $ceil.l T \/ k ceil.r gt.eq c' L$.
  When $L gt.eq 2 \/ c'$, $T gt.eq k \( c' L - 1 \) gt.eq c'' d L$, because $k gt.eq c_(*) d \/ 2$ eventually.
  When $T = 0$, the zero upper bound and positive lower bound already contradict success.

For the bounded remaining range of $L$, the original learner satisfies $T > d \/ 100$.
  Take a uniform full-sphere signal $S$ and grant the learner all $T lt.eq d \/ 100$ pregenerated rows.
  Let $V$ be their span and $p_V = P_V S$. Conditional on the rows and $p_V$,
  the residual is uniform on the sphere of radius $sqrt(1 - parallel p_V parallel^2)$ in $V^perp$.
  This follows by writing $S$ as a normalized Gaussian: the direction of its orthogonal Gaussian component is
  independent of both component lengths and of the component in $V$,
  hence also of the row-space projection after normalization. Isotropy gives

$ bb(E) parallel p_V parallel^2 lt.eq T \/ d \, wide Pr { parallel p_V parallel > 1 \/ 2 } lt.eq 4 T \/ d . $

Conditional also on the learner’s independent randomness, its unit output is fixed.
  The inner product of that output with the residual has mean zero and variance at most $1 \/ \( d - T \)$.
  On $parallel p_V parallel lt.eq 1 \/ 2$, angular success requires this inner product to be at least $0.4$,
  since $cos \( epsilon.alt \) gt.eq 0.9$. Chebyshev’s inequality therefore bounds success by

#[#set math.equation(numbering: n => "(46)")
 $ frac(4 T, d) + frac(1, 0.4^2 \( d - T \)) < 2 / 3 $ <l:finite-entropy:linear>]

for sufficiently large $d$, a contradiction. Hence the bounded range also has $T = Omega \( d L \)$.
  All lower-bound constants are absolute; the eventual dimension threshold may depend on the rate $M \( d \) \/
  d^2 arrow.r 0$.

== 6 A finite split for bounded posterior densities <l:bounded-split:section>

We partition a bounded-density posterior into finitely many components,
  each supported in a dyadic cell and satisfying a bound on mass at every smaller scale.
  Revealing the component has an entropy cost. An exact change of reference from the parent cell to the selected
  cell compares this cost with the information supplied by the cell’s depth.
  We first construct the partition, then prove the block estimate,
  and finally combine them into a finite-block information bound and a learner lower bound.

Put $n = d - 1$, and use the closed cube

$ Q = \[ - 1 \/ \( 2 sqrt(n) \) \, 1 \/ \( 2 sqrt(n) \) \]^n \, wide
  s \( z \) = \( z \, sqrt(1 - parallel z parallel^2) \) . $

Let $tau$ be its uniform probability and assign dyadic boundaries consistently.
  The geometric proof of Lemma 4 applies on this closure: $s$ is $2$-Lipschitz,
  a depth-$h$ cell has side $2^(- h) \/ sqrt(n)$ and mass $2^(- n h)$,
  and the first $n$ graph coordinates recover $z$. For a cell $A$, let $tau_A$ be uniform probability on it.
  Throughout this section set

$ k = floor.l n \/ 64 floor.r \, wide J = 2 k \, wide p = floor.l n \/ 8 floor.r \, $

and take $n$ sufficiently large that $k gt.eq 1$ and $p gt.eq 2$.
  Here $k$ is the block length, $J$ is the number of rows in two stacked blocks,
  and $p$ is the projection moment order. Constants denoted by $C \,
  c$ are positive and absolute and may change between estimates.
  The independent-draw, span-distance projection calculation is related to that of Sharan, Sidford,
  and Valiant #cite(label("SSV2019")); the exact-label density and block estimates are proved below.

=== 6.1 A finite partition and its entropy identity <a-finite-partition-and-its-entropy-identity>

#thm([Lemma 6.1.])[
  (Bounded-density split).  #emph[Let $mu$ be a probability supported on a dyadic cell $A$,
    with bounded density relative to $tau_A$. There is a finite measurable partition into positive-probability
    labels $i$, with probabilities $p_i$, descendant cells $A_i$ of relative depths $j_i$,
    and numbers $q_i in \( 0 \, 1 \]$. Writing $mu_i = mu \( thin dot.op divides i \)$ and $Q_i =
    log \( 1 \/ q_i \)$, each $mu_i$ is supported on $A_i$ and satisfies
#[#set math.equation(numbering: n => "(47)")
 $ mu_i \( D \) lt.eq q_i^(- 1) 2^(- n ell \/ 2) $ <l:bounded-split:spread>]

 for every relative-depth-$ell$ descendant $D$ of $A_i$, and
#[#set math.equation(numbering: n => "(48)")
 $ - log p_i & lt.eq 1 / 2 n \( log 2 \) j_i + Q_i \, & bb(E)_i Q_i & lt.eq 1 +
   bb(E)_i j_i . $ <l:bounded-split:label-cost>]

#[#set math.equation(numbering: n => "(49)")
 $ bb(E)_i D \( mu_i bar.v.double tau_(A_i) \) = D \( mu bar.v.double tau_A \) + H \( i \) -
   n \( log 2 \) bb(E)_i j_i . $ <l:bounded-split:entropy-identity>]

 The descendant bound includes $ell = 0$, and $bb(E)_i$ means expectation with weights $p_i$.]
] <l:bounded-split:decomposition>

#proof[
  At a node cell $C$, use the original law $mu$ conditioned on $C$.
    Select all inclusion-maximal strict dyadic descendants $D$ whose conditional mass exceeds $2^(- n ell \/ 2)$,
    where $ell$ is depth relative to $C$. They are disjoint: two dyadic cells are disjoint or nested,
    and nesting would contradict maximality. A point in a selected cell moves to that cell.
    Every other point stops in the remainder of the current cell. Repeat at the selected cells.
    The label records the terminal node and its remainder.
  Let $K = parallel d mu \/ d tau_A parallel_oo < oo$; necessarily $K gt.eq 1$.
    Along a nontrivial path reaching relative depth $j$, the product of the selected conditional masses exceeds
    $2^(- n j \/ 2)$. No complement decision occurs before stopping,
    so reaching the path cell is exactly membership in it. The same product is its original $mu$-mass,
    which is at most $K 2^(- n j)$. Hence
  $ j < frac(2 log K, n log 2) . $
  This uniformly bounds every nontrivial path depth and leaves finitely many grid cells.
    At an individual node, its bounded conditional density likewise rules out heavy descendants at unbounded
    depth, so each selected inclusion-maximal descendant exists.
    The construction is therefore a finite tree and defines a finite partition.
  Let $q_i$ be the conditional probability of the terminal remainder at its node,
    omitting zero-probability remainders. A strict descendant that exceeded its threshold before the remainder
    decision is contained in a selected cell and has zero remainder mass.
    Every other descendant has its conditional mass increased by at most $q_i^(- 1)$.
    This proves (47); the case $ell = 0$ is immediate. The product of masses on the path, multiplied by $q_i$,
    is $p_i$, so its lower bound proves $- log p_i lt.eq 1 / 2 n \( log 2 \) j_i + Q_i$.
  For the expected remainder cost, a node reached with probability $r$ and having remainder probability $q$
    contributes $r q log \( 1 \/ q \)$ to $bb(E)_i Q_i$. This is at most $r$, since $q log \( 1 \/ q \) lt.eq 1$,
    with value zero at $q = 0$. Summing over the finite tree bounds $bb(E)_i
    Q_i$ by the expected number of visited nodes. Each move increases depth by at least one,
    so this number is at most $1 + bb(E)_i j_i$.
  On the part with label $i$, the density relative to $tau_(A_i)$ is the original density relative to $tau_A$,
    multiplied by $p_i^(- 1) 2^(- n j_i)$. Taking its logarithm, integrating on that part,
    and averaging over $i$ proves (49). All terms are finite because the partition is finite and each conditional
    density is bounded. ◻
]

The entropy identity credits $n \( log 2 \) bb(E)_i j_i$ for the change of cell.
  Naming the component uses at most half of this credit, plus $bb(E)_i Q_i$.
  The remaining task is to bound the next block’s information in component $i$ by $C n + C Q_i$;
  the bound $bb(E)_i Q_i lt.eq 1 + bb(E)_i j_i$ will then pay for its dependence on the remainder probability.

=== 6.2 A centered exact projection density <a-centered-exact-projection-density>

Squaring a state likelihood introduces two independent $k$-row matrices at the same signal.
  We will therefore need a density estimate for their $J = 2 k$ stacked rows.
  The $p$ independent signal draws in the proof below serve a different purpose:
  they expand the $p$th moment of that density.

Consider any probability $mu$ on a depth-$h$ cell $A$ that satisfies (47) with $q in \( 0 \, 1 \]$.
  Put $Q_(*) = log \( 1 \/ q \)$, $R = 2^(- h)$, and let $s_0$ be the graph image of the cell center.
  The cell has radius $R \/ 2$, so $parallel s \( z \) - s_0 parallel lt.eq R$.
  The following estimates use only this dyadic mass hypothesis;
  the bounded-density premise was used to construct the finite split.

#thm([Lemma 6.2.])[
  (Local density for exact labels).  #emph[Let $mu$ be a probability on a depth-$h$ dyadic cell $A$ such that,
    for some $q in \( 0 \, 1 \]$, every relative-depth-$ell$ descendant $D$ satisfies $mu \( D \) lt.eq
    q^(- 1) 2^(- n ell \/ 2)$. Put $Q_(*) = log \( 1 \/ q \)$, $R = 2^(- h)$, and $s_0 = s \( "center" A \)$,
    with $J \, p$ as fixed above. Let $X'$ have $J$ independent standard Gaussian rows,
    independently of $z tilde.op mu$, and put $b = X' \( s \( z \) - s_0 \)$.
    On the open region $Omega = { b in bb(R)^J : parallel b parallel < 3 sqrt(J) R }$,
    the joint law of $\( X' \, b \)$ has a density $f$ relative to $d P_(X') thin d b$.
    If $h_R$ is the density of $N \( 0 \, R^2 I_J \)$, then
#[#set math.equation(numbering: n => "(50)")
 $ ∥upright(bold(1))_Omega f \/ h_R∥_(L^p \( d P_(X') h_R \( b \) thin d b \)) lt.eq
   C^J e^(C \( J \/ n \) Q_(*)) \, $ <l:bounded-split:reference-norm>]

 where $upright(bold(1))_Omega f \/ h_R$ is extended by zero outside $Omega$.]
] <l:bounded-split:density>

#proof[
  We first use the dyadic mass bound to control inverse Gram determinants of independent centered signal vectors.
    These determinants bound the moment of a smoothed projection density.
    We then remove the smoothing and compare the exact density with the Gaussian reference.
  For every $y in bb(R)^d$ and $0 < r lt.eq 1$,
  #[#set math.equation(numbering: n => "(51)")
   $ Pr_mu { parallel s \( z \) - y parallel lt.eq r R } lt.eq C^n e^(Q_(*)) r^(n \/ 2) . $ <l:bounded-split:ball>]
  Indeed, choose $ell gt.eq 0$ with $2^(- ell - 1) < r lt.eq 2^(- ell)$.
    A relative-depth-$ell$ cell meeting the projection of this ball onto the first $n$ coordinates lies in the
    concentric ball of radius $2 thin 2^(- ell) R$. Its side is $2^(- ell) R \/ sqrt(n)$.
    The unit-ball volume estimate in Lemma 4 therefore bounds the number of such disjoint cells by $C^n$.
    Multiply by their mass bound $e^(Q_(*)) 2^(- n ell \/ 2)$ and use $2^(- ell) < 2 r$.
  If $U subset.eq bb(R)^d$ is a linear subspace of dimension $m lt.eq n \/ 8$,
    a maximal $r R$-separated set in its radius-$R$ ball has at most $\( 1 + 2 \/ r \)^m$ points.
    Its radius-$r R$ balls cover that ball, by maximality. Because $parallel s - s_0 parallel lt.eq R$,
    ambient balls of radius $2 r R$ about the translated centers cover the event $"dist" \( s - s_0 \, U \) lt.eq
    r R$. Using (51), and the trivial mass bound for $r > 1 \/ 2$, gives
  #[#set math.equation(numbering: n => "(52)")
   $ Pr_mu { "dist" \( s - s_0 \, U \) lt.eq r R } lt.eq C^n e^(Q_(*)) r^(n \/ 2 - m) wide \( 0 < r lt.eq 1 \) .
     $ <l:bounded-split:tube>]
  For $m lt.eq p - 1$, put $a = n \/ 2 - m gt.eq 3 n \/ 8$ and $D_U = R^(- 1) "dist" \( s - s_0 \, U \)$.
    Then $0 < D_U lt.eq 1$ almost surely. Let $cal(A) = C^n e^(Q_(*)) gt.eq 1$.
    Since $J lt.eq a \/ 2$, layer-cake integration of $Pr \( D_U < r \) lt.eq min { 1 \, cal(A) r^a }$,
    split at $cal(A)^(- 1 \/ a)$, gives
  #[#set math.equation(numbering: n => "(53)")
   $ bb(E)_mu D_U^(- J) & = 1 + J integral_0^1 r^(- J - 1) Pr \( D_U < r \) thin d r\
 & lt.eq frac(a, a - J) cal(A)^(J \/ a) lt.eq 2 cal(A)^(J \/ a) lt.eq \( C e^(C Q_(*) \/ n) \)^J .
   $ <l:bounded-split:inverse>]
  For independent $z_1 \, dots.h \, z_p tilde.op mu$, put $s_i =
    s \( z_i \)$ and let $G$ be the Gram matrix of $e_i = s_i - s_0$.
    Conditional on its predecessors, each $e_i$ has positive distance from their span almost surely by (52).
    Gram–Schmidt and successive conditioning in (53) yield
  #[#set math.equation(numbering: n => "(54)")
   $ bb(E) \( det G \)^(- J \/ 2) lt.eq \( C e^(C Q_(*) \/ n) \/ R \)^(J p) . $ <l:bounded-split:gram>]
  Add an independent uniform vector in $\[ - t \, t \]^J$, $t > 0$, to the exact label $b$. Its joint density is
  $ f_t \( X' \, b \) = \( 2 t \)^(- J) bb(E)_mu
    upright(bold(1))_({ parallel X' \( s - s_0 \) - b parallel_oo lt.eq t }) . $
  Expand its integer $p$th power using independent $e_1 \, dots.h \, e_p$.
    For fixed $b$, Tonelli’s theorem and independence of the $J$ rows give
  $ integral f_t \( X' \, b \)^p thin d P_(X') = \( 2 t \)^(- J p) bb(E)_(e_1 \, dots.h \, e_p) product_(j = 1)^J
    Pr_x { \| chevron.l x \, e_i chevron.r - b_j \| lt.eq t upright(" for all ") i lt.eq p } . $
  For almost every tuple the inner-product vector for one row is Gaussian with nonsingular covariance $G$.
    Its density is bounded by $\( 2 pi \)^(- p \/ 2) \( det G \)^(- 1 \/ 2)$.
    Each box probability is at most $\( 2 t \)^p$ times this supremum.
    The $2 t$ powers cancel, and (54) gives, uniformly in $t \, b$,
  $ integral f_t \( X' \, b \)^p thin d P_(X') lt.eq \( C e^(C Q_(*) \/ n) \/ R \)^(J p) . $
  Integrating on $Omega$ therefore bounds the local $p$th power integral by $\|
    Omega \| \( C e^(C Q_(*) \/ n) \/ R \)^(J p)$.
  For a continuous compactly supported test function on the product of the matrix space and $Omega$,
    its integral against the jittered law converges to its integral against the exact law as $t arrow.b 0$.
    Extend the test by zero outside a compact subset of $Omega$ and use bounded convergence.
    Hölder bounds these limiting integrals by the local $L^p$ bound times the test’s
    $L^(p \/ \( p - 1 \)) \( d P_(X') thin d b \)$ norm. Density of such tests and $L^p$ duality give a density
    for the exact law on this open region, with
  #[#set math.equation(numbering: n => "(55)")
   $ integral_Omega integral f \( X' \, b \)^p thin d P_(X') thin d b lt.eq \|
     Omega \| \( C e^(C Q_(*) \/ n) \/ R \)^(J p) . $ <l:bounded-split:local-lp>]
  Equality on the tests identifies the represented measure with the restricted exact law.
    This asserts a density on $Omega$, which is the only region used below.
  On $Omega$, the Gaussian reference satisfies $h_R \( b \) gt.eq \( C R \)^(- J)$.
    Also the ball-volume estimate gives $\| Omega \| lt.eq \( C R \)^J$.
    In the integral of $f^p h_R^(1 - p)$, the powers of $R$ from (55) are
  $ R^(- J p) R^J R^(J \( p - 1 \)) = 1 . $
  Taking the $p$th root gives (50). The auxiliary jitter has been removed before the exact observation rule is
    applied. ◻
]

=== 6.3 Two copies of the block and the state information <two-copies-of-the-block-and-the-state-information>

#thm([Lemma 6.3.])[
  (Diffuse block information).  #emph[Let $mu$ be a probability on a depth-$h$ dyadic cell $A$ such that,
    for some $q in \( 0 \, 1 \]$, every relative-depth-$ell$ descendant $D$ satisfies $mu \( D \) lt.eq
    q^(- 1) 2^(- n ell \/ 2)$, and put $Q_(*) = log \( 1 \/ q \)$.
    Suppose $log W lt.eq n^2$, with $k = floor.l n \/ 64 floor.r$ as above.
    From a fixed entering state, let $u$ be any variable with at most $W$ values obtained by a measurable
    probability kernel from a $k$-row standard Gaussian matrix $X$ and exact labels $X s \( z \)$,
    where $X$ is independent of $z tilde.op mu$. Then
#[#set math.equation(numbering: n => "(56)")
 $ I_mu \( z \; u \) lt.eq C n + C Q_(*) . $ <l:bounded-split:block-information>]

]
] <l:bounded-split:block>

#proof[
  Put $R = 2^(- h)$ and $s_0 = s \( "center" A \)$. Write the kernel probabilities as $g_u \( X \, Y \)
    in \[ 0 \, 1 \]$, with $sum_u g_u \( X \, Y \) = 1$ for every matrix-label pair $\( X \, Y \)$. Define
  $ cal(G) = { parallel X \( s - s_0 \) parallel lt.eq 2 sqrt(k) R } \, wide K_u \( s \) =
    bb(E)_X \[ upright(bold(1))_(cal(G)) g_u \( X \, X s \) \] \, $
  and define a comparison probability vector by
  $ rho_u = bb(E)_(X \, Z) g_u \( X \, X s_0 + R Z \) \, wide Z tilde.op N \( 0 \, I_k \) upright(" independently") . $
  In $bb(E)_mu K_u \( s \)^2$, use two independent block matrices at the same signal $s$.
    Their stack has $J = 2 k$ rows. When both blocks satisfy $cal(G)$,
    the stacked residual norm is at most $2 sqrt(J) R < 3 sqrt(J) R$, inside $Omega$.
    Apply Lemma 20 and Hölder’s inequality to this exact joint law.
    Under the Gaussian reference, the two matrices and the two residual vectors are independent between blocks.
    The product of the two $g_u$’s lies in $\[ 0 \, 1 \]$ and has reference expectation $rho_u^2$.
    Dropping the good indicators in its conjugate norm gives
  #[#set math.equation(numbering: n => "(57)")
   $ bb(E)_mu K_u \( s \)^2 lt.eq C^J e^(C \( J \/ n \) Q_(*)) rho_u^(2 \( 1 - 1 \/ p \)) . $ <l:bounded-split:square>]
  Thus $rho_u = 0$ implies $K_u = 0$ almost surely.
  For every fixed $s$, the probability of $cal(G)^c$ is at most
  $ e^(- k) 2^(k \/ 2) = e^(- c k) = : delta < 1 $
  for an absolute $c > 0$, by the Gaussian exponential moment at $1 \/ 4$.
    Put $g_0 \( s \) = sum_u K_u \( s \) gt.eq 1 - delta$ and $P_g = bb(E)_mu g_0 \( s \)$.
    Including the good indicator with $u$ can only increase information.
    The indicator costs at most $log 2$, and the weighted bad conditional information costs at most $delta log W$.
  The weighted good conditional information is at most
  #[#set math.equation(numbering: n => "(58)")
   $ bb(E)_mu sum_u K_u \( s \) log frac(K_u \( s \), g_0 \( s \) rho_u) . $ <l:bounded-split:good-kl>]
  Indeed, replacing the actual conditional marginal $Pr \( u divides cal(G) \)$ by $rho$ adds $P_g
    D \( Pr \( u divides cal(G) \) bar.v.double rho \) gt.eq 0$. Zero states cause no issue by (57).
    The contribution of $- log g_0 \( s \)$ is at most $log \( 1 \/ \( 1 - delta \) \)$.
    For the remaining term, Jensen’s inequality under the probability measure with weights $mu \( d s \)
    K_u \( s \) \/ P_g$ gives
  $ bb(E)_mu sum_u K_u \( s \) log frac(K_u \( s \), rho_u) & lt.eq
    P_g log (1 / P_g sum_(u : rho_u > 0) frac(bb(E)_mu K_u \( s \)^2, rho_u))\
 & lt.eq P_g log (frac(C^J e^(C \( J \/ n \) Q_(*)) W^(2 \/ p), P_g)) . $
  The last inequality uses (57) and $sum_u rho_u^(1 - 2 \/ p) lt.eq W^(2 \/ p)$, by concavity for $p gt.eq 2$.
    All sums are finite. Combining the terms gives
  $ I_mu \( z \; u \) lt.eq C n + C Q_(*) + 2 / p log W + e^(- c k) log W . $
  Since $k \, p$ are proportional to $n$ and $log W lt.eq n^2$, the last two terms are $O \( n \)$.
    This proves the lemma. ◻
]

=== 6.4 The finite-block information bound <the-finite-block-information-bound>

The split identity and the block estimate can now be combined without an accuracy or stopping assumption.
  We keep every split label in the analysis history, so its entropy must be included in the bound.

#thm([Proposition 6.4.])[
  (Information after finite splitting).  #emph[Let $z tilde.op tau$, and let $B gt.eq 0$ and $W gt.eq
    1$ be integers with $log W lt.eq n^2$. Independently of $z$, draw independent standard Gaussian $k times
    d$ matrices $X_1 \, dots.h \, X_B$, with $k$ as fixed above.
    Consider a computation with a fixed initial state $u_0$ and at most $W$ states at each block boundary.
    At block $b$, the outgoing state $u_b$ is an everywhere-defined Borel function of
    $\( u_(b - 1) \, X_b \, X_b s \( z \) \)$.]
  #emph[Before each block one can reveal a finite partition label $i_b$,
    determined by $z$ and the preceding analysis history, such that the complete history
$ cal(H) = \( i_1 \, u_1 \, dots.h \, i_B \, u_B \) $

 has finite range and satisfies $I \( z \; cal(H) \) lt.eq
   4 C' n B$ for an absolute constant $C' > 0$ and all sufficiently large $n$.
   The labels indicate nested dyadic cells containing $z$; they do not alter the computation’s state rules.]
] <l:bounded-split:iteration>

#proof[
  Before each block, apply Lemma 19 to the law conditional on the analysis transcript, and record its label.
    Also record the outgoing boundary state after the block. Initially the cell is the whole cube and the law is
    $tau$. Every positive-probability posterior has bounded density relative to its current cell’s uniform law:
    splitting preserves this property, and conditioning on a state multiplies the density by a likelihood in
    $\[ 0 \, 1 \]$ and divides by a positive state probability.
    Every split is finite, so each stage has finitely many histories.
    Future Gaussian rows remain independent of the signal and these histories,
    which depend only on the signal and past blocks. The block from a known entering state is a measurable kernel
    of its exact data. Lemma 21 therefore applies in each selected component.
  For a current cell of depth $h$ and conditional law $mu$, define
  #[#set math.equation(numbering: n => "(59)")
   $ Phi = 1 / 4 n \( log 2 \) h + D \( mu bar.v.double tau_A \) . $ <l:bounded-split:potential>]
  It is nonnegative. By (49), the expected change under a split is
  $ H \( i \) - 3 / 4 n \( log 2 \) bb(E)_i j_i lt.eq - 1 / 4 n \( log 2 \) bb(E)_i j_i + bb(E)_i Q_i . $
  Within component $i$, conditioning on its outgoing state keeps the cell fixed and increases the expected
    relative entropy by exactly $I_(mu_i) \( z \; u \)$. This follows by multiplying the density by
    $Pr \( u divides z \, i \) \/ Pr \( u divides i \)$, taking logarithms, and averaging.
    The block lemma bounds this increase by $C n + C Q_i$. Thus the combined conditional drift is at most
  #[#set math.equation(numbering: n => "(60)")
   $ C n - 1 / 4 n \( log 2 \) bb(E)_i j_i + \( C + 1 \) bb(E)_i Q_i & lt.eq
     C n + \( C + 1 \) + \( C + 1 - 1 / 4 n log 2 \) bb(E)_i j_i\
 & lt.eq C' n $ <l:bounded-split:drift>]
  for large $n$, using $bb(E)_i Q_i lt.eq 1 + bb(E)_i j_i$. Only this expected bound on $Q_i$ is used.
  The initial potential is zero, so after $B$ blocks $bb(E) Phi lt.eq C' n B$.
    For the final transcript $cal(H)$, its posterior in a depth-$h$ cell satisfies
  $ D \( P \( z divides cal(H) \) bar.v.double tau \) = n \( log 2 \) h +
    D \( P \( z divides cal(H) \) bar.v.double tau_A \) lt.eq 4 Phi . $
  Averaging over the finite history gives
  #[#set math.equation(numbering: n => "(61)")
   $ I \( z \; cal(H) \) lt.eq 4 C' n B . $ <l:bounded-split:total-information>]
  ◻
]

=== 6.5 Application to the learner <application-to-the-learner>

Use the finite-state model of Section 2, with $M \( d \) = o \( d^2 \)$, integer horizon $T$,
  and every-signal angular success at least $2 \/ 3$ at $0 < epsilon.alt lt.eq 1 \/ 10$.
  We will prove $T gt.eq c d log \( 1 \/ epsilon.alt \)$, with an absolute constant and a dimension threshold that
  may depend on the memory sequence. First record the route’s separate sample bound for the original randomized learner:

#[#set math.equation(numbering: n => "(62)")
 $ T gt.eq d \/ 16 . $ <l:bounded-split:linear>]

Take a uniform full-sphere signal and pregenerate all $T$ rows, including unused rows. Let $V$ be their span.
  Conditional on the rows and $P_V S$, the residual has mean zero;
  this remains true after conditioning on the learner’s independent random tape.
  All labels and the output are functions of the conditioned variables. Consequently

$ bb(E) chevron.l S \, hat(S) chevron.r lt.eq bb(E) parallel P_V S parallel lt.eq
  sqrt(bb(E) parallel P_V S parallel^2) lt.eq sqrt(T \/ d) . $

The last inequality uses isotropy and independence of the rows and signal. Success gives

$ bb(E) chevron.l S \, hat(S) chevron.r gt.eq \( 2 \/ 3 \) cos \( 1 \/ 10 \) - 1 \/ 3 > 1 \/ 4 \, $

which proves (62).

Put $L = log \( 1 \/ epsilon.alt \)$. In the cube experiment,
  first fix shared rule randomness with success greater than $1 \/ 2$.
  The graph derivative has full rank, so Lemmas 2 and 1 give Borel representatives for that fixed choice.
  Then fix the remaining transition and output randomness, together with the initial state, by averaging.
  Conditional on the shared seed these choices are independent of the signal and rows,
  by the joint independence in Section 2. This gives a deterministic program of cube success at least $1 \/ 2$.
  Its terminal state and stopping index determine its output, giving at most $\( T + 1 \) 2^M$ possible outputs.
  Lemma 4 bounds the cube success mass of each fixed output by $\( 5 epsilon.alt \)^n$. Hence

#[#set math.equation(numbering: n => "(63)")
 $ n \( L - log 5 \) lt.eq M log 2 + log \( 2 \( T + 1 \) \) . $ <l:bounded-split:output-count>]

We may restrict to $T < d L$, since the complementary case already has the required lower bound.
  For $L gt.eq log 10$, put $a_0 = log 2 \/ log 10 > 0$; then $L - log 5 gt.eq a_0 L$.
  Also $log \( 2 \( T + 1 \) \) lt.eq C + log d + log L lt.eq C + log d + L$. Thus

$ \( a_0 n - 1 \) L lt.eq M log 2 + C + log d \, $

so $L = o \( d \)$. Pad the deterministic program after an early stop,
  retaining its terminal state and stopping index and ignoring later samples. The width

#[#set math.equation(numbering: n => "(64)")
 $ W = \( T + 2 \) 2^M $ <l:bounded-split:width>]

is enough for this padded program. Since $T < d L$, $L = o \( d \)$, and $M = o \( d^2 \)$, it satisfies $log W =
  o \( n^2 \)$, hence $log W lt.eq n^2$ eventually. Use $B = ceil.l T \/ k ceil.r$ blocks,
  adding ignored fresh rows to complete the last block.

The fixed initial state, independent blocks, and Borel transition rules now satisfy Proposition 22.
  Let $cal(H)$ be its augmented history. The padded state retains the terminal state and stopping index,
  so the output is a function of $cal(H)$.

Under the joint law, the output’s first $n$ coordinates are within $epsilon.alt$ of $z$ with probability at least
  $1 \/ 2$; under the product law the probability is at most $\( 5 epsilon.alt \)^n$ by the coordinate-ball volume
  calculation in Lemma 4. Equation (1) yields

#[#set math.equation(numbering: n => "(65)")
 $ I \( z \; cal(H) \) gt.eq 1 / 2 n \( L - log 5 \) - log 2 gt.eq c n L $ <l:bounded-split:accuracy>]

for sufficiently large $n$, uniformly for $L gt.eq log 10$. Combining (61) and (65) gives $B gt.eq c_1 L$.
  Since $B lt.eq T \/ k + 1$,

$ T gt.eq k \( c_1 L - 1 \) . $

For $L gt.eq 2 \/ c_1$, this is $Omega \( d L \)$. For $log 10 lt.eq L < 2 \/ c_1$,
  the separate bound (62) gives the same order. The previously excluded case $T gt.eq d L$ is immediate.
  This proves the worst-signal precision lower bound for every stated accuracy sequence,
  with absolute constants and a dimension threshold that may depend on the memory sequence.

== 7 Likelihood truncation and selected dyadic cells <sec:l-likelihood-truncation>

This section gives a forward proof of the precision lower bound using a cube chart of the sphere.
  At a fixed incoming state, the likelihood of a block-ending state at a signal is the probability that the fresh
  block ends in that state when the signal is fixed. A block may concentrate the conditional signal law,
  but a Gaussian projection estimate limits the increase in a typical state likelihood.
  We then select a dyadic cell for analysis and condition on the event that this cell was selected.
  The cost of that conditioning and the depth of the cell enter one density bound.
  Iterating the bound prevents a small number of blocks from localizing the signal to the accuracy required by the
  output.

The use of high Gaussian projection moments has a methodological precedent in Sharan, Sidford,
  and Valiant #cite(label("SSV2019")) Section 7, Lemma 12. We prove the exact-label estimate used here,
  including its dependence on the mass of a restricted set.
  The lower bound in this section starts from success for every signal:
  that hypothesis supplies both the cube-prior average used by the forward argument and the uniform-sphere average
  used at constant accuracy.

=== 7.1 The learner, the cube prior, and measurable rules <subsec:l-lt-model>

We use the finite-state learner of Section 2, including its jointly measurable experiment,
  joint independence of the shared rule seed and initialization from the signal and rows,
  and permitted per-seed completed-measurability. The deterministic horizon is $T gt.eq 0$,
  and the output uses the terminal state, stopping index, and fresh randomness.

#thm([Theorem 7.1.])[
  (Precision lower bound from likelihood truncation).  #emph[Let $M \( d \) =
    o \( d^2 \)$ be a nonnegative integer-valued memory bound, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    Suppose a family of learners in the model above satisfies
$ bb(P) #h(-0.16667em) {arccos chevron.l hat(s) \, s chevron.r lt.eq epsilon.alt \( d \)} gt.eq 2 / 3 wide
  upright("for every ") s in S^(d - 1) . $

 There is an absolute $c > 0$ such that, for all sufficiently large $d$,
$ T \( d \) gt.eq c thin d log_2 frac(1, epsilon.alt \( d \)) . $

 The eventual dimension threshold may depend on the memory sequence.]
] <thm:l-lt-precision>

Put $p = d - 1$ and consider the normalized cube law

#[#set math.equation(numbering: n => "(66)")
 $ Q_(*) = lr([- frac(1, 2 sqrt(p)) \, frac(1, 2 sqrt(p))))^p \, wide mu = "Unif" \( Q_(*) \) \, wide s \( z \) =
   #scale(x: 120%, y: 120%)[\(] z \, sqrt(1 - parallel z parallel^2) #scale(x: 120%, y: 120%)[\)] . $ <l:lt:chart>]

The parameter law has density $p^(p \/ 2)$ on the cube. This is the cube chart of Lemma 4, with $n$ renamed $p$.
  That lemma proves that $s$ is $2$-Lipschitz and, for every fixed unit output $v$,

#[#set math.equation(numbering: n => "(67)")
 $ mu { z : arccos chevron.l v \, s \( z \) chevron.r lt.eq epsilon.alt } lt.eq
   #scale(x: 120%, y: 120%)[\(] sqrt(2 pi e) thin epsilon.alt #scale(x: 120%, y: 120%)[\)]^p
   lt.eq \( 5 epsilon.alt \)^p . $ <l:lt:output-mass>]

Write $V_h$ for the volume of the unit ball in $bb(R)^h$.
  The same Gaussian-integral proof gives $V_h lt.eq \( sqrt(2 pi e) \/ sqrt(h) \)^h < \( 5 \/ sqrt(h) \)^h$,
  which will also be used below.

The following reduction puts the learner in the form required by the block argument.
  It makes the order of the two operations explicit: first fix the shared rule-selection randomness,
  then choose Borel versions for the resulting cube-prior experiment.

#thm([Lemma 7.2.])[
  (A deterministic Borel learner for the cube experiment).  #emph[Fix $d gt.eq 2$, $M$, and a finite horizon $T$.
    If a learner in the stated model has average success at least $2 \/ 3$ under (66),
    then there is a deterministic learner with Borel transition and stopping rules,
    the same state and horizon bounds, and a fixed unit output at each terminal state/index label,
    whose average success under that prior is at least $3 \/ 5$.]
] <lem:l-lt-borel>

#proof[
  Choose a shared-seed value with conditional cube-prior success greater than $3 \/ 5$.
    The joint experiment in Section 2 makes this conditioning meaningful,
    and the conditional initial-state law remains independent of the signal and rows.
    The derivative of the chart has the identity in its first $p$ rows,
    so Lemma 2 proves absolute continuity of its one-pair law.
    Lemma 1 therefore provides everywhere Borel finite kernels preserving this fixed-seed cube-prior joint law of
    the signal, path, stopping index, and output.
  Use the finite-randomness reduction following that lemma.
    Sample the conditional initial state, independent uniforms for all finite choices indexed by state and index
    (including an input-free index-zero stopping choice), and one output from each terminal state/index law.
    These finitely many choices are independent of the inputs.
    Fixing a realization by averaging retains cube-prior success at least $3 \/ 5$.
    The resulting state rules are Borel, and the state and horizon bounds are unchanged. ◻
]

=== 7.2 The projection estimate inside a regular cell <subsec:l-lt-projection>

We next control one block, starting from a parameter law with a bound on concentration at every smaller dyadic
  scale. For sufficiently large $d$, set

#[#set math.equation(numbering: n => "(68)")
 $ n = floor.l d \/ 32 floor.r \, wide k = floor.l d \/ 8 floor.r \, wide lambda = p \/ 2 \, wide Q = lambda -
   k \, wide alpha = n / Q . $ <l:lt:parameters>]

Here $n$ is the number of rows in a block and $k$ is the moment order.
  For example, $d gt.eq 64$ ensures $n gt.eq 1$, $k gt.eq 2$, $Q gt.eq d \/ 3$, and $alpha lt.eq 1 \/ 4$.

Subdivide $Q_(*)$ dyadically in every coordinate, using half-open cells so that every parameter belongs to one
  cell at each depth. A cell $C$ at depth $l$ has side length $R \/ sqrt(p)$, where $R = 2^(- l)$.
  A descendant at relative depth $j$ is a depth-$l + j$ cell inside $C$.
  Call a Borel probability measure $P$ supported in $C$ regular when

#[#set math.equation(numbering: n => "(69)")
 $ P \( V \) lt.eq 2^d 2^(- lambda j) quad upright("for every descendant ") V upright(" at relative depth ") j
   gt.eq 0 . $ <l:lt:regular>]

We need a projection estimate that retains the probability of a restricted parameter set.
  In the likelihood cutoff, this set will consist of signals for which a particular state is unusually likely.
  The factor $rho^(1 - alpha)$ below lets the small mass $rho$ of that set survive both the projection and the
  choice of a state.

#thm([Lemma 7.3.])[
  (Restricted mass and exact projection moments).  #emph[There are absolute constants $C_0 \, C_1 \, C_2 gt.eq
    1$ such that the following holds with (68) for all sufficiently large $d$.
    Let $P$ be regular in a cell $C$ of scale $R$. For every $x in bb(R)^d$, $u > 0$,
    and affine subspace $H subset.eq bb(R)^d$ of dimension at most $k$,
#[#set math.equation(numbering: n => "(70)")
 $ P { z : s \( z \) in B \( x \, u \) } & lt.eq C_0^d \( u \/ R \)^lambda \,\
P { z : "dist" \( s \( z \) \, H \) lt.eq u } & lt.eq \( C_1 u \/ R \)^Q . $ <l:lt:ball>]

 For a Borel set $E subset.eq C$ of mass $rho = P \( E \) > 0$,
#[#set math.equation(numbering: n => "(71)")
 $ integral_E "dist" \( s \( z \) \, H \)^(- n) thin d P \( z \) lt.eq C_2^d R^(- n) rho^(1 - alpha) . $ <l:lt:inverse>]

]
  #emph[Let $gamma_(n \, d)$ denote standard Gaussian probability on $bb(R)^(n times d)$ and put
    $beta \( d A \, d y \) = gamma_(n \, d) \( d A \) thin d y$.
    For $eta > 0$, let $phi_eta$ be the centered Gaussian density on $bb(R)^n$ with covariance $eta^2 I_n$, and define
$ J_eta \( A \, y \) = integral_E phi_eta \( y - A s \( z \) \) thin d P \( z \) . $

 Then
#[#set math.equation(numbering: n => "(72)")
 $ integral J_eta^k thin d beta lt.eq #scale(x: 120%, y: 120%)[\(] C_2^d R^(- n)
   #scale(x: 120%, y: 120%)[\)]^(k - 1) rho^(thin 1 + \( k - 1 \) \( 1 - alpha \)) . $ <l:lt:moment>]

 For every Borel joint set $B subset.eq bb(R)^(n times d) times bb(R)^n$ with $beta \( B \) < oo$,
   the exact observations satisfy
#[#set math.equation(numbering: n => "(73)")
 $ bb(P)_(z tilde.op P \, thin A tilde.op gamma_(n \, d)) { z in E \, med \( A \, A s \( z \) \) in B } lt.eq
   beta \( B \)^(1 - 1 \/ k) #scale(x: 120%, y: 120%)[\(] C_2^d R^(- n) #scale(x: 120%, y: 120%)[\)]^(1 - 1 \/ k)
   rho^(1 - alpha) . $ <l:lt:exact-set>]

 The same assertions involving $E$ are trivial when $rho = 0$.]
] <lem:l-lt-projection>

#proof[
  For $0 < u < R$, choose an integer $j gt.eq 1$ with $R 2^(- j) lt.eq u < 2 R 2^(- j)$, and write $delta =
    R 2^(- j)$. Project $B \( x \, u \)$ onto the first $p$ coordinates.
    Each relative-depth $j$ cell meeting the projected ball has diameter $delta$,
    so the union of those cells lies in a ball of radius $u + delta < 3 delta$.
    The cells have disjoint interiors and volume $\( delta \/ sqrt(p) \)^p$.
    The unit-ball estimate used in (67) bounds their number by
  $ frac(V_p \( 3 delta \)^p, \( delta \/ sqrt(p) \)^p) lt.eq 15^p . $
  Using (69) for each cell gives $P { s \( z \) in B \( x \, u \) } lt.eq 15^p 2^d 2^(- lambda j)$.
    Since $2^(- j) lt.eq u \/ R$, this proves (70) after choosing $C_0$ absolutely.
    For $u gt.eq R$ the bound follows from $P \( C \) = 1$.
  Let $s_0$ be the lift of the center of $C$. The cell has Euclidean radius $R \/ 2$ in parameter space,
    so the Lipschitz bound implies $parallel s \( z \) - s_0 parallel lt.eq R lt.eq 2 R$ for $z in C$.
    Orthogonal projection onto $H$ is nonexpansive. Thus the projections of all these lifted points lie in the
    radius-$2 R$ ball in $H$ about the projection of $s_0$. Disjoint ball packing covers that ball by at most
    $\( 1 + 4 R \/ u \)^k$ balls of radius $u$. A point at distance at most $u$ from $H$ whose projection lies in
    one of these balls is within $2 u$ of its center. For $u lt.eq R$, applying (70) to the cover gives
  $ P { "dist" \( s \( z \) \, H \) lt.eq u } lt.eq \( 1 + 4 R \/ u \)^k C_0^d \( 2 u \/ R \)^lambda lt.eq
    C^d \( u \/ R \)^(lambda - k) . $
  Here and below $C$ denotes an absolute constant that may increase.
    The identity $Q = \( d - 1 \) \/ 2 - floor.l d \/ 8 floor.r gt.eq
    d \/ 3$ for large $d$ lets us absorb $C^d$ into $C_1^Q$. For $u > R$,
    enlarge $C_1$ so that the right side is at least one. This proves (70).
    In particular every affine subspace of the stated dimension has $P$-mass zero, by letting $u$ decrease to zero.
  To prove (71), apply the layer-cake formula to $\( "dist" \( s \( z \) \, H \) \/ R \)^(- n)
    upright(bold(1))_E$. At height $t > 0$ its tail has mass at most $min { rho \, C_1^Q t^(- Q \/ n) }$.
    With $t_0 = C_1^n rho^(- n \/ Q)$,
  $ integral_0^oo min { rho \, C_1^Q t^(- Q \/ n) } thin d t & lt.eq rho t_0 +
    C_1^Q integral_(t_0)^oo t^(- Q \/ n) thin d t\
 & = frac(C_1^n, 1 - alpha) rho^(1 - alpha) . $
  Because $alpha lt.eq 1 \/ 4$ and $n lt.eq d$, an absolute $C_2$ bounds the prefactor by $C_2^d$.
    Restoring $R^(- n)$ proves the assertion.
  We turn from affine distances to the projection moment. Tonelli’s theorem expands $integral J_eta^k thin d
    beta$ over $z_1 \, dots.h \, z_k in E$. Write $s_i = s \( z_i \)$.
    For fixed $A$ and this tuple, integration of $product_(i = 1)^k
    phi_eta \( y - A s_i \)$ over the common label $y$ is the density at zero of the $k -
    1$ differences from the first of the independently mollified labels $A s_i + eta Z_i$.
    After averaging over $A$, the differences are centered Gaussian, independently across rows, with per-row covariance
  #[#set math.equation(numbering: n => "(74)")
   $ G + eta^2 \( I + upright(bold(1)) upright(bold(1))^(sans(T)) \) \, wide G =
     #scale(x: 120%, y: 120%)[\(] chevron.l s_i - s_1 \, s_j -
     s_1 chevron.r #scale(x: 120%, y: 120%)[\)]_(i \, j = 2)^k . $ <l:lt:covariance>]
  Their density at zero is
  $ \( 2 pi \)^(- n \( k - 1 \) \/ 2) det #h(-0.16667em)
    (G + eta^2 \( I + upright(bold(1)) upright(bold(1))^(sans(T)) \))^(- n \/ 2) lt.eq det \( G \)^(- n \/ 2) \, $
  where the upper bound is interpreted as infinity when $G$ is singular.
    For nonsingular $G$, the inequality follows by factoring $G^(1 \/ 2)$ and observing that all eigenvalues of
    $I + eta^2 G^(- 1 \/ 2) \( I + upright(bold(1)) upright(bold(1))^(sans(T)) \) G^(- 1 \/ 2)$ are at least one.
    Gram–Schmidt gives
  $ det \( G \)^(- n \/ 2) = product_(i = 2)^k "dist" #scale(x: 120%, y: 120%)[\(] s_i \,
    "aff" \( s_1 \, dots.h \, s_(i - 1) \) #scale(x: 120%, y: 120%)[\)]^(- n) . $
  The affine spaces here have dimension at most $k - 2$. The null-mass consequence of (70), applied successively,
    shows that degenerate tuples have product $P$-measure zero.
    Integrate the last display from $z_k$ down to $z_2$ using (71), then integrate $z_1$ with mass $rho$. The result is
  $ rho #scale(x: 120%, y: 120%)[\(] C_2^d R^(- n) rho^(1 - alpha) #scale(x: 120%, y: 120%)[\)]^(k - 1) \, $
  which is (72).
  Hölder’s inequality now bounds the mollified measure of $B$ by
  $ beta \( B \)^(1 - 1 \/ k) #scale(x: 120%, y: 120%)[\(] C_2^d R^(- n) #scale(x: 120%, y: 120%)[\)]^(1 - 1 \/ k)
    rho^(thin 1 - alpha + alpha \/ k) . $
  Since $rho lt.eq 1$, this implies the weaker power of $rho$ in (73).
    For an open $B$, couple the mollified labels as $A s \( z \) +
    eta Z$ using one independent standard Gaussian $Z$. As $eta$ decreases to zero,
    membership of $\( A \, A s \( z \) \)$ in $B$ implies eventual membership of the approximants.
    Fatou’s lemma therefore passes the same bound to the exact observation measure.
    The Gaussian–Lebesgue measure $beta$ is a locally finite regular Borel measure on the Euclidean joint space.
    Its outer regularity extends the bound from open sets to every Borel $B$ of finite measure.
    In particular the exact measure vanishes on $beta$-null sets,
    so the same bound extends to the completion of $beta$ as well.
    The mollifier was used only in this calculation; the observation in (73) is the exact label. ◻
]

We now apply the exact-set estimate to the signals for which one state’s likelihood exceeds a multiple of its
  marginal probability. The proof restricts labels to a ball about the projected cell center.
  The resulting sets of observations producing different states are disjoint,
  and their total reference volume will control the sum over states.

#thm([Lemma 7.4.])[
  (A regular-cell likelihood cutoff).  #emph[There are absolute $a \,
    c_1 > 0$ and a dimension threshold such that the following holds.
    Let $P$ be regular in a cell $C$, let $A tilde.op gamma_(n \, d)$ be independent of $z tilde.op P$, and let
$ W = f \( A \, A s \( z \) \) $

 for a Borel map $f$ with at most $N$ values. Suppose $N^(1 \/ k) lt.eq 2^d$, and set
$ q_w \( z \) = bb(P)_A { f \( A \, A s \( z \) \) = w } \, wide b_w = integral q_w thin d P . $

 Then
#[#set math.equation(numbering: n => "(75)")
 $ bb(P) { q_W \( z \) > 2^(a d) b_W } lt.eq 2^(- c_1 d) . $ <l:lt:likelihood-tail>]

]
] <lem:l-lt-likelihood>

#proof[
  The functions $q_w$ are Borel by integration of the Borel routing indicators.
    For $b_w > 0$ define $E_w = { z : q_w \( z \) > 2^(a d) b_w }$.
    Markov’s inequality gives $P \( E_w \) lt.eq 2^(- a d)$. A state with $b_w =
    0$ is reached with probability zero and contributes nothing.
  Retain the lift $s_0$ of the center of $C$ used in the preceding proof.
    Conditional on $z$, the vector $A \( s \( z \) - s_0 \)$ is distributed as $parallel s \( z \) -
    s_0 parallel Z$ for a standard Gaussian $Z in bb(R)^n$. Because $parallel s \( z \) - s_0 parallel lt.eq 2 R$,
  #[#set math.equation(numbering: n => "(76)")
   $ bb(P) { parallel A s \( z \) - A s_0 parallel > 4 R sqrt(n) } lt.eq
     bb(P) { parallel Z parallel^2 > 4 n } lt.eq 2^(n \/ 2) e^(- n) . $ <l:lt:label-tail>]
  The last inequality uses $bb(E) e^(parallel Z parallel^2 \/ 4) = 2^(n \/ 2)$.
    Since $n gt.eq d \/ 64$ for large $d$, the right side is exponentially small in $d$.
  Define the joint domain
  $ cal(D) = { \( A \, y \) : parallel y - A s_0 parallel lt.eq 4 R sqrt(n) } $
  and let $B_w = cal(D) ∩ f^(- 1) \( { w } \)$. These Borel sets are disjoint, and the volume bound gives
  $ sum_w beta \( B_w \) lt.eq beta \( cal(D) \) = V_n \( 4 R sqrt(n) \)^n lt.eq \( 20 R \)^n . $
  Apply (73) to $E_w$ and $B_w$, and sum over $w$. Hölder’s inequality on the finite state set yields
  #[#set math.equation(numbering: n => "(77)")
   $ sum_w bb(P) { z in E_w \, \( A \, A s \( z \) \) in B_w } & lt.eq
     #scale(x: 120%, y: 120%)[\(] C_2^d R^(- n) #scale(x: 120%, y: 120%)[\)]^(1 - 1 \/ k)
     2^(- a d \( 1 - alpha \)) N^(1 \/ k) (sum_w beta \( B_w \))^(1 - 1 \/ k)\
 & lt.eq C_4^d N^(1 \/ k) 2^(- a d \( 1 - alpha \)) $ <l:lt:width-tail>]
  for an absolute $C_4 gt.eq 1$. The powers of $R$ cancel exactly.
    Since $1 - alpha gt.eq 3 \/ 4$ and $N^(1 \/ k) lt.eq 2^d$, choose $a$ so that $3 a \/ 4 gt.eq log_2 C_4 + 3$.
    The last display is then at most $2^(- 2 d)$. Adding (76) and reducing an absolute $c_1 >
    0$ if necessary proves (75) for large $d$. ◻
]

#prodef([Remark 7.5.])[
  The projection estimate also verifies the cube-prior absolute continuity used in Lemma 24.
    At the root, $mu \( V \) = 2^(- p j)$ for a depth-$j$ cell, so $mu$ is regular.
    Taking $P = mu$ and $E = Q_(*)$ in (73) shows that the exact joint block law is absolutely continuous with
    respect to $beta$. For the one-pair reference measure $lambda_d \( d x \, d y \) =
    gamma_d \( d x \) thin d y$ from Section 2, the inverse image of a $lambda_d$-null set under one-row
    projection is $beta$-null by the product structure and $sigma$-finiteness.
    The one-pair marginal is therefore absolutely continuous as well.
]

=== 7.3 Restoring regularity by a selection event <subsec:l-lt-selection>

Fix a deterministic Borel learner, padded to $m$ blocks of $n$ rows.
  At each block boundary let its state alphabet have size at most $N$, with $N^(1 \/ k) lt.eq 2^d$.
  A halted path keeps a tag recording its terminal state and index;
  the quantitative application below supplies this padding.
  For a fixed starting state, the next boundary state is a Borel function of the whole exact block
  $\( A \, A s \( z \) \)$. Trailing rows after a halt are generated and ignored.

For the proof only, a history records the boundary states, selected dyadic cells,
  and survival of the deletions defined below. At time $t$ it is an event determined by the parameter and the
  first $t$ blocks. We condition only on histories of positive probability.
  Future rows remain independent standard Gaussian rows conditional on such a history and the parameter,
  since those rows are independent of the parameter and all preceding blocks.

Let $mu_C$ be uniform probability on a cell $C$, and put $D = a + 2$, with $a$ from Lemma 26.
  We will keep the following two properties after $t$ blocks:
  the history fixes a cell $C$ of depth $l$, its parameter law $P$ is regular in $C$, and

#[#set math.equation(numbering: n => "(78)")
 $ P lt.eq K mu_C \, wide K = 2^(D d t - \( p - lambda \) l) . $ <l:lt:density-depth>]

The measure inequality means that it holds on every Borel set.
  Initially $C = Q_(*)$, $P = mu$, $t = l = 0$, so both properties hold.

#thm([Lemma 7.6.])[
  (One block and one selected cell).  #emph[Suppose a positive-probability history after $t$ blocks has a fixed
    state and a conditional law satisfying (69) and (78) in a cell $C$ of depth $l$.
    One can discard conditional probability at most
#[#set math.equation(numbering: n => "(79)")
 $ 3 dot.op 2^(- c_1 d) + \( floor.l J_t floor.r + 1 \) 2^(- d) \, wide J_t = frac(a d + 1 + D d t, p - lambda) \,
   $ <l:lt:one-step-deletion>]

 and partition the remaining outcomes into finitely many positive-probability histories satisfying both properties
   at time $t + 1$.]
] <lem:l-lt-selection-step>

#proof[
  Run the fresh next block, and let $cal(E) = { q_W \( z \) > 2^(a d) b_W }$ be the event in (75).
    Write $delta = bb(P) \( cal(E) \) lt.eq 2^(- c_1 d)$. Discard $cal(E)$.
    For $b_w > 0$, let $r_w = bb(P) \( cal(E)^c divides W = w \)$,
    and also discard every state with $r_w < 1 \/ 2$. The mass of these states is at most $2 delta$:
  $ sum_(w : r_w < 1 \/ 2) b_w lt.eq 2 sum_(w : r_w < 1 \/ 2) bb(P) \( cal(E) ∩ { W = w } \) lt.eq 2 delta . $
  The two deletions therefore cost at most $3 delta$.
  For a remaining state $w$, condition on $W = w$ and $cal(E)^c$. Its parameter law $P'$ is given by
  $ P' \( B \) = frac(1, b_w r_w) integral_B upright(bold(1))_({ q_w \( z \) lt.eq 2^(a d) b_w }) q_w \( z \) thin
    d P \( z \) $
  for Borel $B$. Since $r_w gt.eq 1 \/ 2$,
  #[#set math.equation(numbering: n => "(80)")
   $ P' lt.eq 2^(a d + 1) P lt.eq 2^(a d + 1) K mu_C . $ <l:lt:posterior-inflation>]
  For $z in C$, let $U_j \( z \)$ be the cell containing $z$ at relative depth $j$.
    Select the least $j gt.eq 0$ maximizing the score
  #[#set math.equation(numbering: n => "(81)")
   $ 2^(lambda j) P' \( U_j \( z \) \) . $ <l:lt:score>]
  The score at $j = 0$ is one. Since $mu_C \( U_j \( z \) \) = 2^(- p j)$, (80) gives
  $ 2^(lambda j) P' \( U_j \( z \) \) lt.eq 2^(a d + 1) K 2^(- \( p - lambda \) j) lt.eq
    2^(a d + 1 + D d t - \( p - lambda \) j) . $
  This upper bound tends to zero. Thus the maximum is attained, and every selected depth is at most $J_t$,
    since a selected score is at least one. The least-maximizer rule is unambiguous. It is Borel:
    there are finitely many possible depths, the cell at each depth is a Borel function of $z$,
    and each score is a fixed number on that cell.
  For each possible selected cell $U$, define the actual selection event
  #[#set math.equation(numbering: n => "(82)")
   $ F_U = { z : upright("the rule in ") upright("(81)") upright(" selects ") U } subset.eq U .
     $ <l:lt:selection-event>]
  These Borel events form a finite partition of $C$. Discard those for which $P' \( F_U \) < 2^(- d) P' \( U \)$.
    At a fixed depth the cells partition $C$, so their $P'$-masses sum to one.
    Summing over the at most $floor.l J_t floor.r + 1$ depths bounds this deletion by the second term of (79).
    Events of zero mass need no conditional law.
  Fix a remaining event $F_U$ of positive mass, and let $j$ be the relative depth of $U$.
    Put $P'' = P' \( thin dot.op divides F_U \)$. If a descendant $V$ of $U$ at further depth $i$ meets $F_U$,
    choose $z in V ∩ F_U$. Maximality on this parameter’s cell chain gives
  $ 2^(lambda j) P' \( U \) gt.eq 2^(lambda \( j + i \)) P' \( V \) . $
  Consequently
  $ P'' \( V \) lt.eq frac(P' \( V \), P' \( F_U \)) lt.eq 2^d 2^(- lambda i) \, $
  using $P' \( F_U \) gt.eq 2^(- d) P' \( U \)$. If $V ∩ F_U$ is empty, its $P''$-mass is zero.
    This proves regularity in $U$.
  The selected score is at least one, so $P' \( U \) gt.eq 2^(- lambda j)$ and $P' \( F_U \) gt.eq
    2^(- d - lambda j)$. The cell reference measures satisfy $mu_C \|_U = 2^(- p j) mu_U$. Therefore
  #[#set math.equation(numbering: n => "(83)")
   $ P'' & lt.eq 2^(a d + 1) K frac(2^(- p j), P' \( F_U \)) thin mu_U\
 & lt.eq 2^(\( a + 1 \) d + 1) K 2^(- \( p - lambda \) j) mu_U lt.eq
   2^(D d) K 2^(- \( p - lambda \) j) mu_U . $ <l:lt:depth-update>]
  The last inequality uses $\( a + 1 \) d + 1 lt.eq \( a + 2 \) d = D d$ for $d gt.eq 1$.
    Substituting the value of $K$ yields
  $ P'' lt.eq 2^(D d \( t + 1 \) - \( p - lambda \) \( l + j \)) mu_U \, $
  which is (78) at the new time and total depth. The normalization throughout is by $P' \( F_U \)$,
    including when $F_U$ is a proper subset of $U$. ◻
]

#thm([Proposition 7.7.])[
  (The finite-horizon cube success bound).  #emph[For sufficiently large $d$,
    consider a deterministic Borel computation padded to $m gt.eq 0$ blocks of $n$ rows as above.
    Suppose its boundary alphabet has size at most $N$, where $N^(1 \/ k) lt.eq 2^d$,
    and its final boundary state fixes its unit output. Its average success under (66) is at most
#[#set math.equation(numbering: n => "(84)")
 $ Delta_m + 2^(2 D d m) \( 5 epsilon.alt \)^p \, wide Delta_m = 3 m 2^(- c_1 d) +
   2^(- d) sum_(t = 0)^(m - 1) \( floor.l J_t floor.r + 1 \) . $ <l:lt:forward-bound>]

 The sum is empty when $m = 0$. In particular, $Delta_m = o \( 1 \)$ for any sequence $m = o \( d \)$.]
] <prop:l-lt-forward>

#proof[
  Apply Lemma 28 at each surviving history and at each block. There are finitely many histories at every time.
    The conditional deletion bounds are uniform, so their unconditional sum is at most $Delta_m$:
    at each time, the probabilities of the surviving histories sum to at most one.
    Also $p - lambda = \( d - 1 \) \/ 2$, and hence $J_t = O \( t + 1 \)$ with an absolute constant depending only
    on the already fixed $a$. Thus
  $ Delta_m lt.eq 3 m 2^(- c_1 d) + C \( m^2 + m \) 2^(- d) \, $
  which tends to zero when $m = o \( d \)$.
  At a surviving terminal history, integrating (78) forces $K gt.eq 1$. Hence $\( p - lambda \) l lt.eq D d m$.
    Since $mu \( C \) = 2^(- p l)$, the bound relative to the original cube probability becomes
  #[#set math.equation(numbering: n => "(85)")
   $ P lt.eq 2^(D d m + lambda l) mu lt.eq 2^(2 D d m) mu . $ <l:lt:terminal-density>]
  The last inequality uses $lambda = p - lambda$. The history fixes the final boundary state and therefore its
    output. Equation (67) bounds conditional success by $2^(2 D d m) \( 5 epsilon.alt \)^p$.
    Average over surviving histories and add the deleted mass to obtain (84).
    For $m = 0$, the same argument is the fixed-output bound at the root. ◻
]

The finite-horizon estimate (84) holds for every $m$. We will obtain $m =
  o \( d \)$ only on the hypothetical short-run sequence in the proof of Theorem 23.

=== 7.4 The constant-accuracy endpoint and the precision contradiction <subsec:l-lt-endgame>

The forward estimate pays a fixed amount at the first block.
  A separate full-data argument supplies the sample bound at constant accuracy.
  Even after all labels are revealed, the signal has an undetermined direction on a residual sphere.
  Its directional second moment will bound the success probability.

#thm([Lemma 7.8.])[
  (A residual-sphere sample bound).  #emph[For $0 < epsilon.alt lt.eq 1 \/ 10$ and all sufficiently large $d$,
    any learner with success at least $2 \/ 3$ for every unit signal must have $T > d \/ 4$.
    This holds even if the learner is given all $T$ observations before producing its output.]
] <lem:l-lt-residual>

#proof[
  Let $S$ be uniform on $S^(d - 1)$, independently of the $T$ pregenerated Gaussian rows.
    The original jointly measurable experiment has prior success equal to the integral of its fixed-signal
    successes. For each admissible fixed shared seed, Lemmas 2 and 1 give Borel rules with the same uniform-prior
    law. The bound below is uniform over these rules, so it bounds the original conditional success before
    averaging over the seed. This returns to the original learner; it does not reuse the cube-selected program.
  If $T lt.eq d \/ 4$, the span $U$ of the rows has dimension $T$ almost surely.
    Given the rows, the labels determine $P_U S$, since the row map is injective on $U$.
    Conditional on the rows and $P_U S$, the residual $\( I - P_U \)
    S$ is uniform on the sphere in $U^perp$ of radius $r = \( 1 - parallel P_U S parallel^2 \)^(1 \/ 2)$.
    This follows, for example, by representing $S$ as a normalized standard Gaussian and using rotational
    invariance of its component in $U^perp$.
  Spherical symmetry gives $bb(E) parallel P_U S parallel^2 = T \/ d$, so Markov’s inequality yields
  $ bb(P) { r < 1 \/ 2 } = bb(P) { parallel P_U S parallel^2 > 3 \/ 4 } lt.eq frac(4 T, 3 d) lt.eq 1 / 3 . $
  Suppose $r gt.eq 1 \/ 2$ and condition on the rows and labels.
    Fix any possible output, and let $w$ be its projection onto $U^perp$.
    If $w = 0$, its residual error is $r > 1 \/ 10$. If $w eq.not 0$,
    write $Theta$ for the unit residual direction and $e = w \/ parallel w parallel$.
    When $\| chevron.l Theta \, e chevron.r \| < 1 \/ 2$, the component of $r
    Theta$ orthogonal to $e$ has length greater than $sqrt(3) thin r \/ 2 > 1 \/ 10$,
    so the output cannot succeed. The second moment of $chevron.l Theta \,
    e chevron.r$ for the uniform direction in the $\( d - T \)$-dimensional space $U^perp$ is $1 \/ \( d - T \)$.
    Markov’s inequality therefore bounds success for the fixed output by $4 \/ \( d - T \)$.
    The learner’s conditional output law uses only the revealed data and independent randomness,
    so averaging over that law preserves the bound. Angular success implies the Euclidean error bound used here.
  The uniform-prior success is consequently at most $1 \/ 3 + 4 \/ \( d - T \)$,
    which is below $2 \/ 3$ for large $d$ when $T lt.eq d \/ 4$.
    The every-signal premise gives uniform-prior average at least $2 \/ 3$, a contradiction. ◻
]

#proof[
  Write $L = log_2 \( 1 \/ epsilon.alt \)$ and keep the absolute constants $a \, c_1 \, D$ already fixed. Choose
  #[#set math.equation(numbering: n => "(86)")
   $ L_0 gt.eq max { 32 D \, thin 2 log_2 5 } \, wide 0 < c lt.eq min {1 \, frac(1, 4 L_0) \,
     frac(1, 2048 D)} . $ <l:lt:endgame-constants>]
  Suppose for contradiction that there are infinitely many dimensions with successful learners satisfying
  #[#set math.equation(numbering: n => "(87)")
   $ T < c thin d L . $ <l:lt:short-run>]
  All asymptotic reductions below concern these dimensions only.
  We first obtain the precision range forced by the finite set of terminal labels.
    For fixed shared rules, there are at most $\( T + 1 \) 2^M$ terminal state/index labels.
    Let $cal(O)_(t \, u)$ be the output law at one such label.
    For each parameter, its success probability is at most the sum, over all terminal labels,
    of the success probabilities under their output laws: this drops the probability of reaching each label,
    which is at most one. Integrating over $z$ and then over each $cal(O)_(t \, u)$, using (67),
    bounds cube-prior success by $\( T + 1 \) 2^M \( 5 epsilon.alt \)^p$.
    This bound is uniform in the fixed shared rules, so it also bounds the original randomized learner.
    Its every-signal guarantee gives cube-prior average at least $2 \/ 3$. Thus
  #[#set math.equation(numbering: n => "(88)")
   $ p \( L - log_2 5 \) lt.eq M + log_2 \( T + 1 \) + log_2 \( 3 \/ 2 \) . $ <l:lt:output-count>]
  Because $L gt.eq log_2 10$, the absolute number $c_0 = 1 - log_2 5 \/ log_2 10$ is positive and $L -
    log_2 5 gt.eq c_0 L$. Under (87) and $c lt.eq 1$,
  $ log_2 \( T + 1 \) lt.eq 1 + log_2 d + log_2 L lt.eq 1 + log_2 d + L . $
  For large $d$, absorb the last $L$ into $c_0 p L$ on the left of (88). It follows that
  #[#set math.equation(numbering: n => "(89)")
   $ L = O #h(-0.16667em) (frac(M + log d, d)) = o \( d \) \, wide T = o \( d^2 \) . $ <l:lt:precision-reduction>]
  The constants in this bound are absolute. In particular, for a fixed memory sequence it bounds every $L$ arising
    in (87) by the same sequence $o \( d \)$.
  At each such dimension, Lemma 24 supplies a deterministic Borel learner with cube-prior success at least $3 \/
    5$. Pad a halted path by retaining its terminal state and its terminal index.
    At any later layer, the continuing states together with all terminal tags have total width at most
  #[#set math.equation(numbering: n => "(90)")
   $ N = \( T + 2 \) 2^M . $ <l:lt:global-width>]
  Pad the last block with ignored rows and put $m = ceil.l T \/ n ceil.r$.
    By (89), $log_2 N = o \( d^2 \)$ and $m = o \( d \)$. Since $k = Theta \( d \)$, $N^(1 \/ k) lt.eq
    2^d$ for all sufficiently large dimensions under consideration. Proposition 29 applies and gives
  #[#set math.equation(numbering: n => "(91)")
   $ 3 / 5 lt.eq Delta_m + 2^(2 D d m) \( 5 epsilon.alt \)^p = o \( 1 \) +
     2^(2 D d m) \( 5 epsilon.alt \)^p . $ <l:lt:asymptotic-bound>]
  The $o \( 1 \)$ is uniform over the short-run precisions for a fixed memory sequence,
    by the uniform bound on $L$ just obtained.
  If $L lt.eq L_0$, then (87) and $c lt.eq 1 \/ \( 4 L_0 \)$ give $T < d \/ 4$.
    Apply Lemma 30 to the original learner and its uniform-sphere average,
    obtaining a contradiction for large $d$. This use of the original learner preserves the prior of that lemma.
  It remains to consider $L > L_0$. For large $d$, $n gt.eq d \/ 64$, so
  $ m lt.eq 64 c L + 1 \, wide 2 D d m lt.eq 128 D c thin d L + 2 D d lt.eq d L \/ 8 . $
  The last inequality follows from $c lt.eq 1 \/ \( 2048 D \)$ and $L gt.eq 32 D$.
    Also $p = d - 1 gt.eq d \/ 2$ and $L gt.eq 2 log_2 5$, whence
  $ p \( L - log_2 5 \) gt.eq d L \/ 4 . $
  Therefore the second term in (91) is at most $2^(- d L \/ 8)$.
    It tends to zero, as does $Delta_m$, contradicting the fixed lower bound $3 \/ 5$.
    No infinite subsequence (87) exists. This proves the asserted sample bound with the absolute $c$ in (86). ◻
]

== 8 A spherical grid with an entropy balance <l:grid:section>

This argument records a cell containing the signal after each block of samples.
  The outgoing memory state can make the posterior concentrate inside that cell.
  We therefore choose a finer cell from the new posterior and include its entire label in the analysis history.
  The decrease in cell size pays for that additional information.
  A projection estimate then bounds the remaining information acquired in one block.

The use of independent points and inverse distances to their successive affine spans is related to the projection
  method of Sharan, Sidford, and Valiant #cite(label("SSV2019")) Section 7, Lemma 12.
  We prove the estimates used here for exact Gaussian labels.
  The choice of cell below is a global maximum over all finer levels; it need not be a stopping time along the grid.

We use the information conventions of Section 2, and write $h$ for differential entropy when it is finite.
  Let $sigma$ be uniform probability on $S^(d - 1)$, and take $d$ larger than an absolute constant. Set

#[#set math.equation(numbering: n => "(92)")
 $ k = p = floor.l d \/ 8 floor.r \, wide q = d \/ 2 \, wide macron(q) = q + 2 . $ <l:grid:parameters>]

In particular, $q < d - 1$ and $q - \( p - 1 \) - k$ is a positive multiple of $d$.
  Constants denoted by $C$ are positive and absolute and may increase.

The cap estimate in Lemma 3 gives, for $z in S^(d - 1)$ and $r > 0$,

#[#set math.equation(numbering: n => "(93)")
 $ sigma \( B \( z \, r \) \) lt.eq r^(d - 1) \, $ <l:grid:cap>]

where $B \( z \, r \)$ is the closed Euclidean ball.

For every integer $j gt.eq 0$, let $delta_j = 2^(- j)$ and partition $bb(R)^d$ into half-open cubes of side
  $delta_j \/ sqrt(d)$, using the same origin at every level. These partitions are nested.
  Write $Q_j \( s \)$ for the unique cube containing $s$. Its diameter is $delta_j$, so (93),
  centered at any point of its intersection with the sphere, gives

#[#set math.equation(numbering: n => "(94)")
 $ sigma \( Q_j \( s \) \) lt.eq 2^(- \( d - 1 \) j) . $ <l:grid:cell-mass>]

At most $\( C 2^j \)^d$ level-$j$ cubes meet the sphere. Indeed, their union lies in the ball of radius $1 +
  delta_j lt.eq 2$, and their interiors are disjoint. The volume $v_d$ of the unit ball satisfies $v_d
  lt.eq \( 2 pi e \/ d \)^(d \/ 2)$: integrate $e^(- parallel x parallel^2 \/ 2)$ over the ball of radius
  $sqrt(d)$ and compare with its full Gaussian integral. Dividing the volume of the radius-two ball by the cube
  volume now gives the asserted count.

#thm([Lemma 8.1.])[
  (A refinement whose label is charged).  #emph[Let $S tilde.op sigma$, and let $G \,
    W$ be countable discrete variables with $H \( G \, W \) < oo$.
    Suppose $G$ determines an integer $a gt.eq 0$ and a level-$a$ cube containing $S$ almost surely,
    and that $bb(E) a < oo$. For every pair $\( g \, w \)$ of positive probability, put $mu =
    cal(L) \( S divides G = g \, W = w \)$. For $mu$-almost every $s$, define
$ J \( s \) = max_(j gt.eq a) { log mu \( Q_j \( s \) \) + q \( j - a \) log 2 #scale(x: 120%, y: 120%)[}] \, $

 and let $b \( s \)$ be the least level attaining this maximum. In the joint law define
$ N = floor.l J \( S \) \/ d floor.r \, wide Z = \( b \( S \) \, Q_(b \( S \)) \( S \) \) . $

 The choices are measurable and finite almost surely. They satisfy $bb(E) b < oo$, $H \( G \, W \, Z \) < oo$, and
#[#set math.equation(numbering: n => "(95)")
 $ 0 lt.eq N & lt.eq b - a \,\
bb(E) J & lt.eq - H \( Z divides G \, W \) + H \( b divides G \, W \) + q \( log 2 \) bb(E) \( b - a \) \,\
H \( b divides G \, W \) + H \( N divides G \, W \) & lt.eq 2 #scale(x: 120%, y: 120%)[\(] 1 +
  bb(E) \( b - a \) #scale(x: 120%, y: 120%)[\)] log 2 . $ <l:grid:level-bound>]

]
] <l:grid:refinement>

#proof[
  Fix $\( g \, w \)$ with probability $P_(g \, w) > 0$. Conditioning gives $mu lt.eq sigma \/ P_(g \, w)$.
    Outside one $mu$-null set, all the cells $Q_j \( s \)$ have positive $mu$-mass:
    at each level there are only countably many cells, and a countable union over levels still has zero mass.
    We make arbitrary choices on that null set. On the remaining points, the score at level $a$ is zero,
    whereas (94) bounds the score at level $j$ by
  $ log \( 1 \/ P_(g \, w) \) - \( d - 1 - q \) j log 2 - q a log 2 . $
  This upper bound tends to $- oo$ uniformly in $s$. Hence a maximum is attained,
    and the least maximizing index is measurable because the scores are measurable and indexed by the integers.
    The nonnegative score at the maximizer also gives
  $ \( d - 1 - q \) b log 2 lt.eq log \( 1 \/ P_(g \, w) \) . $
  Averaging proves $bb(E) b < oo$. Since $log mu \( Q_b \( S \) \) lt.eq 0$, we have $J lt.eq
    q \( b - a \) log 2 lt.eq d \( b - a \)$, proving (95).
  For a nonnegative integer variable $V$ of finite mean, relative entropy to the probability masses $2^(- i - 1)$ gives
  $ H \( V \) lt.eq \( 1 + bb(E) V \) log 2 . $
  Apply this conditionally to $b - a$ and to $N$. The value of $a$ is known from $G$,
    so $H \( b divides G \, W \) = H \( b - a divides G \, W \)$; moreover $bb(E) N lt.eq bb(E) \( b - a \)$.
    This proves (95). Given $b = j$, the cell label has at most $\( C 2^j \)^d$ possibilities.
    Hence $H \( Q_b \( S \) divides G \, W \, b \) lt.eq d log C + d \( log 2 \) bb(E) b$,
    and $H \( G \, W \, Z \)$ is finite.
  It remains to account for the selected cell label. Fix $g \, w$ and a value $b =
    j$ of positive conditional probability. Compare the conditional distribution of $Q_j \( S \)$ under this
    selection with the level-$j$ cell probabilities of $mu$. Nonnegative relative entropy gives
  $ bb(E) \[ log mu \( Q_j \( S \) \) divides g \, w \, b = j \] lt.eq - H \( Q_j \( S \) divides g \, w \, b = j \) . $
  Averaging this inequality and using the defining formula for $J$ gives (95).
    This argument conditions on the selected level; it uses no stopping-time property of that level. ◻
]

The next lemma measures the information gained from one block.
  Its posterior may be irregular before the classes indexed by $N$ are formed.
  The factor $1 \/ p$ in the state-alphabet cost comes from a $p$th projection moment.

#thm([Lemma 8.2.])[
  (Information acquired inside a grid cell).  #emph[Let $S tilde.op sigma$.
    Let $G$ be countable with $H \( G \) < oo$, and suppose that it determines an integer $a gt.eq
    0$ and a level-$a$ cube containing $S$, with $bb(E) a < oo$.
    Independently of $\( S \, G \)$, draw a standard Gaussian $k$-by-$d$ matrix $A$.
    Given $\( A \, A S \, G \)$, let a measurable probability kernel produce $W$,
    with at most $e^m$ possible values for each $G = g$, where $m gt.eq 0$.
    Form $J \, N$ from $\( G \, W \)$ as in Lemma 31. Then
#[#set math.equation(numbering: n => "(96)")
 $ I \( S \; W divides G \) lt.eq C d + m / p + bb(E) J + H \( N divides G \, W \) . $ <l:grid:block-bound>]

]
] <l:grid:block>

#proof[
  Here $H \( G \, W \) lt.eq H \( G \) + m < oo$, so the refinement lemma applies.
    We first bound projection densities for each class, using a fresh Gaussian matrix.
    We then compare the actual matrix, selected through $W$, with that fresh law.
  Fix $g \, w \, n$ of positive probability. Put
  $ alpha = bb(P) \( N = n divides g \, w \) \, wide mu_n = cal(L) \( S divides g \, w \, n \) \, wide delta =
    2^(- a) . $
  A level-$j$ cube of positive $mu_n$-mass contains a class point with $J < \( n + 1 \) d$.
    Since the score at that level is at most $J$, and $mu_n lt.eq mu \/ alpha$, it follows that
  #[#set math.equation(numbering: n => "(97)")
   $ mu_n \( Q_j \) lt.eq alpha^(- 1) e^(\( n + 1 \) d) \( 2^(a - j) \)^q wide \( j gt.eq a \) . $ <l:grid:class-cell>]
  For $0 < t lt.eq 1$, choose $j gt.eq a$ with $t delta \/ 2 lt.eq delta_j lt.eq t delta$.
    A ball of radius $t delta$ meets at most $C^d$ such cubes:
    their union lies in a ball of radius $2 t delta$, and the volume estimate used above cancels the factor
    $d^(d \/ 2)$ in the inverse cube volume. Thus (97) bounds the mass of this ball by $C^d e^(\( n + 1 \) d)
    alpha^(- 1) t^q$.
  Let $V$ be any affine plane of dimension $r lt.eq p - 1$.
    The projection of the current level-$a$ cube onto $V$ lies in a plane-ball of radius $delta$.
    A maximal separated set covers that ball by at most $\( 1 + 2 \/ t \)^r$ balls of radius $t delta$.
    Points of the current cube within distance $t delta$ of $V$ then lie in the corresponding ambient balls of
    radius $2 t delta$. For $t lt.eq 1 \/ 2$ apply the ball estimate;
    for $t > 1 \/ 2$ enlarge $C$ and use total mass one. We obtain
  #[#set math.equation(numbering: n => "(98)")
   $ mu_n { u : "dist" \( u \, V \) lt.eq t delta } lt.eq C^d e^(\( n + 1 \) d) alpha^(- 1) t^(q - r)
     wide \( 0 < t lt.eq 1 \) . $ <l:grid:tube>]
  In particular every such plane has zero mass. The layer-cake formula,
    applied to $\( delta \/ "dist" \( u \, V \) \)^k$, gives
  #[#set math.equation(numbering: n => "(99)")
   $ integral "dist" \( u \, V \)^(- k) thin d mu_n \( u \) lt.eq
     delta^(- k) C^d e^(\( n + 1 \) d) alpha^(- 1) . $ <l:grid:negative-moment>]
  Indeed the integral after multiplication by $delta^k$ is at most $1 + K k \/ \( q - r - k \)$ with $K =
    C^d e^(\( n + 1 \) d) \/ alpha$, and $q - r - k$ is a positive multiple of $d$.
  Fix any $s in S^(d - 1)$ and draw $U_1 \, dots.h \, U_p$ independently from $mu_n$.
    Let $Gamma_s$ be the Gram matrix of the vectors $U_i - s$.
    Gram–Schmidt expresses its determinant as the product of the squared distances from $U_i$ to $s +
    "span" { U_h - s : h < i }$. These planes have dimension at most $p - 1$,
    and (98) shows that the distances are positive almost surely. Successive integration using (99) yields
  #[#set math.equation(numbering: n => "(100)")
   $ integral \( det Gamma_s \)^(- k \/ 2) thin d mu_n^(⊗ p) lt.eq
     #scale(x: 120%, y: 120%)[\(] delta^(- k) C^d e^(\( n + 1 \) d) alpha^(- 1) #scale(x: 120%, y: 120%)[\)]^p .
     $ <l:grid:gram-moment>]
  The center $s$ is fixed in this estimate and need not have law $mu_n$.
  We turn this inverse-volume bound into a $p$th moment of the class projection density.
    That moment will control its average logarithm under the actual matrix law;
    the relative-entropy comparison will charge at most $m \/ p$ for selection through $W$.
  Let $phi.alt_eta$ be the $N \( 0 \, eta^2 I_k \)$ density and define
  $ rho_eta \( A \, y \) = integral phi.alt_eta \( y - A u \) thin d mu_n \( u \) . $
  Write $gamma_k$ for standard Gaussian $k$-by-$d$ matrix law.
    For a fresh $tilde(A) tilde.op gamma_k$, expansion of the $p$th power gives
  #[#set math.equation(numbering: n => "(101)")
   $ bb(E)_(tilde(A)) rho_eta \( tilde(A) \, tilde(A) s \)^p = \( 2 pi \)^(- k p \/ 2) integral
     det \( Gamma_s + eta^2 I_p \)^(- k \/ 2) thin d mu_n^(⊗ p) . $ <l:grid:mollified-moment>]
  For each row, the vector of projected differences has covariance $Gamma_s$;
    adding the $p$ independent mollifying Gaussians adds $eta^2 I_p$.
    Evaluating its density at zero and multiplying across independent rows proves the identity.
    The right side is bounded by (100).
  We next select one density version that is valid on the true-label diagonal as well as under the actual selected
    rows. The projection of uniform sphere measure onto $k < d$ coordinates has density
  $
    frac(Gamma \( d \/ 2 \), pi^(k \/ 2) Gamma \( \( d - k \) \/ 2 \)) \( 1 - parallel y parallel^2 \)^(\( d - k -
    2 \) \/ 2) upright(bold(1))_({ parallel y parallel < 1 }) . $
  For completeness, write a uniform sphere point as a normalized standard Gaussian.
    The squared length of its first $k$ coordinates is the ratio $X \/ \( X + X' \)$ for independent chi-square
    variables of $k$ and $d - k$ degrees of freedom. Changing variables in their gamma densities gives the beta
    density with parameters $k \/ 2 \, \( d - k \) \/ 2$; its direction is uniform and independent.
    Polar coordinates give the displayed density. Rotations and an invertible range map prove absolute continuity
    for every rank-$k$ linear map, and the property passes from $sigma$ to $mu_n lt.double sigma$.
  Consequently the law of $\( tilde(A) \, tilde(A) U \)$, with $U tilde.op mu_n$ independent of $tilde(A)$,
    has a density $rho_0$ relative to $gamma_k \( d A \) thin d y$.
    The functions $rho_eta$ converge to $rho_0$ in this joint $L^1$ space.
    To see this, for almost every $A$ use continuity of translations in $L^1 \( d y \)$ for its conditional
    density and average the Gaussian translations; the error is at most two,
    so dominated convergence permits averaging over $A$. Choose a sequence $eta_j arrow.b
    0$ along which convergence also holds almost everywhere, and define everywhere
  $ rho \( A \, y \) = liminf_(j arrow.r oo) rho_(eta_j) \( A \, y \) . $
  This is a version of $rho_0$. The sequence was chosen without a value of $s$.
    Since (101) was bounded for every fixed $s$, Fatou’s lemma now gives, for this same version and for each fixed $s$,
  #[#set math.equation(numbering: n => "(102)")
   $ (bb(E)_(tilde(A)) rho \( tilde(A) \, tilde(A) s \)^p)^(1 \/ p) lt.eq
     delta^(- k) C^d e^(\( n + 1 \) d) alpha^(- 1) . $ <l:grid:diagonal-moment>]
  There are only countably many triples $\( g \, w \, n \)$,
    so this construction can be made for every occurring triple.
    Conditional on such a triple, the actual matrix law is absolutely continuous with respect to $gamma_k$.
    Also, for almost every such matrix, the conditional signal law is absolutely continuous with respect to
    $sigma$: conditioning the pre-block law by the discrete events $W = w \, N = n$ only reweights it.
    Its image under a full-rank matrix therefore has a Lebesgue density.
    Thus the actual joint law of the matrix and its label is absolutely continuous with respect to
    $gamma_k \( d A \) thin d y$. In particular the chosen version $rho$ is valid in expectations under that actual law.
  We have obtained the fresh projection estimate. To convert it into information, set $Y = A S$.
    Fresh independence and the conditional Markov property $S arrow.r Y arrow.r W$ given $\( A \, G \)$ imply
  #[#set math.equation(numbering: n => "(103)")
   $ I \( S \; W divides G \) & = I \( Y \; W divides A \, G \) - I \( A \; S divides G \, W \)\
 & = h \( Y divides A \, G \) - h \( Y divides A \, G \, W \) -
   I \( A \; S divides G \, W \) . $ <l:grid:information-identity>]
  The first line follows by expanding $I \( S \; A \, W divides G \)$ in two orders.
    It also gives $I \( A \; S divides G \, W \) lt.eq I \( S \; W divides A \, G \) lt.eq m$.
  All the differential entropies in this argument, including after conditioning on $N$, are finite.
    Here are the needed integrability details. Because $d - k gt.eq 2$,
    the coordinate density displayed above is bounded by a finite constant depending on $d \, k$.
    For a rank-$k$ matrix the corresponding bound is multiplied by $\( det A A^(sans(T)) \)^(- 1 \/ 2)$.
    Gram–Schmidt on Gaussian rows writes this determinant as a product of squared residual lengths,
    each with a chi-square law; the absolute logarithm is integrable from its gamma density.
    Thus $bb(E) \| log det A A^(sans(T)) \| < oo$. Given $G = g$,
    the signal density is bounded by $1 \/ bb(P) \( G = g \)$ relative to $sigma$,
    whose expected logarithm is $H \( G \)$. Conditioning further on $\( W \, N \)$ can multiply a conditional
    label density by at most $1 \/ bb(P) \( W = w \, N = n divides A \, G \)$;
    its expected logarithm is $H \( W \, N divides A \, G \) lt.eq H \( W \, N divides G \) < oo$.
    These facts control the positive parts of the log label densities.
    To control their negative parts, compare with a fixed standard Gaussian label density. For two densities $f \, g$,
  $ integral_({ f < g }) f log \( g \/ f \) lt.eq 1 \/ e \, $
  because $t log \( 1 \/ t \) lt.eq 1 \/ e$ for $0 lt.eq t lt.eq 1$.
    The remaining Gaussian logarithm is integrable since $bb(E) parallel Y parallel^2 = k$.
    This proves the claimed finiteness and justifies the entropy identity.
  Let $c_G$ be a specified corner of the current cube, so $parallel S - c_G parallel lt.eq delta = 2^(- a)$.
    Comparing the conditional label density with $N \( A c_G \, delta^2 I_k \)$,
    and using independence of $A$ to obtain $bb(E) \[ parallel A \( S - c_G \) parallel^2 divides G \] lt.eq
    k delta^2$, gives
  #[#set math.equation(numbering: n => "(104)")
   $ h \( Y divides A \, G \) lt.eq k bb(E) log delta + C k . $ <l:grid:upper-entropy>]
  For the other two terms in (103), first condition on $N$.
    Differential entropy decreases under this conditioning, and, since $N$ is determined by $\( S \, G \, W \)$,
  $ I \( A \; S divides G \, W \) = I \( A \; N divides G \, W \) + I \( A \; S divides G \, W \, N \) . $
  The latter conditional mutual information is the average divergence from
    $cal(L) \( S divides A \, G \, W \, N \)$ to its marginal $mu_N$.
    Data processing under $s mapsto A s$, followed by the definition of relative entropy for the two label
    densities, gives
  $ & h \( Y divides A \, G \, W \, N \) + I \( A \; S divides G \, W \, N \)\
 & quad gt.eq h \( Y divides A \, G \, W \, N \) + bb(E) D #h(-0.16667em)
   (cal(L) \( Y divides A \, G \, W \, N \) thin mid(parallel) thin rho_(G \, W \, N) \( A \, y \) thin d y)\
 & quad = - bb(E) log rho_(G \, W \, N) \( A \, A S \) . $
  Together with the preceding conditioning and chain-rule inequalities, this proves
  #[#set math.equation(numbering: n => "(105)")
   $ h \( Y divides A \, G \, W \) + I \( A \; S divides G \, W \) gt.eq -
     bb(E) log rho_(G \, W \, N) \( A \, A S \) . $ <l:grid:lower-bracket>]
  This comparison is between finite quantities: the conditional mutual information is at most $m$,
    and the true log density was shown integrable. The projected log density ratio has integrable negative part by
    the same $1 \/ e$ bound and finite positive part by data processing.
  If $P lt.double P_0$ and $f gt.eq 0$, relative entropy to the probability law with density proportional to $f^p$ gives
  #[#set math.equation(numbering: n => "(106)")
   $ bb(E)_P log f lt.eq 1 / p (D \( P parallel P_0 \) + log bb(E)_(P_0) f^p) . $ <l:grid:entropy-tilt>]
  Truncating $log f$ proves this form whenever the left side is defined and the right side is finite.
    In the present application the preceding paragraph gives integrability.
    Apply (106) conditionally on $\( s \, g \, w \, n \)$ to the actual matrix law, taking $P_0 =
    gamma_k$ and $f \( A \) = rho_(g \, w \, n) \( A \, A s \)$.
    The value of $n$ is already determined by $\( s \, g \, w \)$,
    and before $W$ the matrix is independent of $\( S \, G \)$. The average divergence in this comparison is therefore
  $ I \( A \; W divides S \, G \) lt.eq H \( W divides G \) lt.eq m . $
  The average of $- log alpha$ is $H \( N divides G \, W \)$. Using (102) in (106) and then averaging gives
  $ bb(E) log rho_(G \, W \, N) \( A \, A S \) lt.eq - k bb(E) log delta + C d + bb(E) \[ \( N + 1 \) d \] +
    H \( N divides G \, W \) + m \/ p . $
  Finally $\( N + 1 \) d lt.eq J + d$. Substitute this bound and (104)–(105) into (103) to obtain (96). ◻
]

#thm([Proposition 8.3.])[
  (Iteration of the grid information balance).  #emph[Let $S tilde.op sigma$, and start from a fixed state.
    Let $B gt.eq 0$ be an integer. Consider $B$ blocks, each consisting of $k$ fresh standard Gaussian rows and
    their exact labels. In each block, the outgoing state is a measurable kernel of the incoming state and that
    block’s data, and its alphabet has logarithm at most $m gt.eq 0$.
    There is a countable analysis history $G_B$ of finite entropy that contains the final state and satisfies
#[#set math.equation(numbering: n => "(107)")
 $ I \( S \; G_B \) lt.eq C { d + B \( d + m \/ p \) } . $ <l:grid:final-information>]

]
] <l:grid:iteration>

#proof[
  Start with $G_0 = Q_0 \( S \)$ and depth $a_0 = 0$. Its entropy is at most $C d$ by the grid count.
    After every outgoing state $W$, append the pair $Z = \( b \, Q_b \( S \) \)$ from Lemma 31.
    The enlarged history contains the outgoing state and a cell containing $S$ at depth $b$.
    Its entropy and expected depth remain finite. Since this refinement uses only $S$ and completed blocks,
    the next Gaussian rows remain independent of $\( S \, G \)$.
  For a current history of depth $a$, define
  $ F \( G \) = I \( S \; G \) - macron(q) \( log 2 \) bb(E) a . $
  Because $Z$ is a function of $\( S \, G \, W \)$,
  $ I \( S \; G \, W \, Z \) - I \( S \; G \) = I \( S \; W divides G \) + H \( Z divides G \, W \) . $
  The block estimate, (95), and (95) give
  $ F \( G \, W \, Z \) lt.eq F \( G \) + C d + m \/ p . $
  Here the term $q log 2$ pays the selected cell mass, and the remaining $2 log
    2$ per unit of depth pays both the depth and class entropies.
    Thus the entire label $Z$ has been included in the balance.
  For each history value $g$, its conditional signal law is supported on the specified level-$a$ cube.
    Relative entropy to $sigma$ is at least the negative logarithm of the $sigma$-mass of that cube:
    this follows by writing it as relative entropy to normalized $sigma$ on the cube minus the logarithm of the
    cube mass. By (94),
  $ I \( S \; G \) gt.eq \( d - 1 \) \( log 2 \) bb(E) a . $
  It follows that $F \( G \) gt.eq \( 1 - macron(q) \/ \( d - 1 \) \) I \( S \; G \)$,
    with a positive coefficient bounded away from zero for large $d$.
    Iterating the upper bound from $F \( G_0 \) lt.eq C d$ proves (107). ◻
]

===== 8.1 Application to precision and bounded stopping. <application-to-precision-and-bounded-stopping.>

#thm([Corollary 8.4.])[
  (Precision under the uniform spherical prior).  #emph[Let $M \( d \) =
    o \( d^2 \)$ and $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    For learners in the finite-state model of Section 2, uniform-sphere average angular success at least $2 \/
    3$ requires
$ T \( d \) gt.eq c thin d log frac(1, epsilon.alt \( d \)) $

 for an absolute $c > 0$ and all sufficiently large $d$. The dimension threshold may depend on the memory sequence.]
] <l:grid:precision>

#proof[
  Use the reductions following Lemma 2 under the uniform prior.
    First fix the shared rule randomness with success greater than $3 \/ 5$, and apply Lemma 1.
    Then fix the independent initial state, the finite transition choices,
    and the outputs assigned to terminal state/index pairs by averaging.
    The resulting deterministic Borel learner has uniform-prior success at least $3 \/
    5$ and the same state and horizon bounds.
  Put $L = log \( 1 \/ epsilon.alt \)$, with $0 < epsilon.alt lt.eq 1 \/ 10$.
    The case $T gt.eq d L$ already has the required order. In the other case the fixed learner has at most
    $\( T + 1 \) 2^M$ terminal outputs, counting every possible stopping index.
    Angular error at most $epsilon.alt$ implies Euclidean error at most $epsilon.alt$,
    because $2 sin \( theta \/ 2 \) lt.eq theta$. Applying (93) to each output gives
  #[#set math.equation(numbering: n => "(108)")
   $ 3 / 5 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) \, wide \( d - 2 \) L lt.eq M log 2 +
     O \( log d \) . $ <l:grid:output-count>]
  For the second inequality, take logarithms in the first and use $T < d L$ and $log \( d L + 1 \) lt.eq
    log \( d + 1 \) + L$. Thus $M = o \( d^2 \)$ implies $L = o \( d \)$ along these putative short runs,
    and eventually $T lt.eq d^2$. This is a consequence of the short-run assumption,
    not an added restriction on the accuracy sequence.
  Preserve a stopped state together with its terminal index, and use ignored fresh samples after stopping.
    At any later index there are at most $2^M$ active states and $\( T + 1 \) 2^M$ tagged terminal states.
    Padding the last block as well therefore uses width at most
  #[#set math.equation(numbering: n => "(109)")
   $ \( T + 2 \) 2^M \, wide m = M log 2 + log \( T + 2 \) = o \( d^2 \) . $ <l:grid:padded-width>]
  Take $B = ceil.l T \/ k ceil.r$ blocks, padding with fewer than $k$ ignored samples if necessary.
    The final augmented history recovers the output. Under the product of the signal and output marginals,
    angular success has probability at most $epsilon.alt^(d - 1)$ by (93).
    For an event with probabilities $u$ and $v$ under two laws,
    data processing to the event gives relative entropy at least $u log \( 1 \/ v \) - log 2$:
    expand binary relative entropy and use binary entropy at most $log 2$. Hence
  #[#set math.equation(numbering: n => "(110)")
   $ I \( S \; G_B \) gt.eq I \( S \; hat(S) \) gt.eq 3 / 5 \( d - 1 \) L - log 2 . $ <l:grid:precision-information>]
  Since $m \/ p = o \( d \)$, (107) and (110) imply $L lt.eq C \( 1 + B \)$.
    With $B lt.eq T \/ k + 1$, this gives $T gt.eq c d L$ whenever $L$ exceeds a fixed absolute constant.
  We finish the bounded range of $L$ with the route’s linear sample bound.
    Grant the learner all $T < d$ pre-generated rows and exact labels, including any it did not use.
    Their row space $V$ has dimension $T$ almost surely. The data determine $P_V S$,
    and conditional on the data the residual $S - P_V S$ has uniform direction in $V^perp$,
    with radius $sqrt(1 - parallel P_V S parallel^2)$. This follows by splitting a normalized standard Gaussian
    into its independent row-space and nullspace components. Its conditional mean is zero and its covariance is
    $\( 1 - parallel P_V S parallel^2 \) P_(V^perp) \/ \( d - T \)$.
    For every unit estimate determined by the data, also after averaging independent output randomness,
  #[#set math.equation(numbering: n => "(111)")
   $ bb(E) chevron.l S \, hat(S) chevron.r^2 lt.eq bb(E) parallel P_V S parallel^2 + frac(1, d - T) = T / d +
     frac(1, d - T) . $ <l:grid:linear-endpoint>]
  On angular success the squared inner product is at least $cos^2 \( 1 \/ 10 \)$.
    Since $\( 3 \/ 5 \) cos^2 \( 1 \/ 10 \) > 1 \/ 2$, average success $3 \/ 5$ excludes $T lt.eq
    d \/ 2$ for large $d$. This linear bound absorbs the bounded range of $L$ and completes the proof. ◻
]

== 9 Adaptive scales with one Gaussian side projection <l:side:section>

We now use a different information balance. A finite message carries little information when the prior has
  sufficiently small mass near lower-dimensional affine planes.
  For a general bounded-density prior, a maximizing radius splits it into cells with that property.
  An independent Gaussian projection lets us bound the conditional entropy of the cell label.
  We charge this revelation cost in each block’s information estimate,
  keeping the same projection throughout the transcript argument.
  It is an analysis variable; the learner still receives only its prescribed exact samples.

All logarithms and entropies in this section use natural units. Let $mu$ be uniform probability on $S^(d - 1)$.
  For sufficiently large $d$, fix

#[#set math.equation(numbering: n => "(112)")
 $ k_(*) = p = floor.l d \/ 32 floor.r \, wide q = p - 1 \, wide a = d \/ 8 \, wide alpha = d \/ 4 \, wide ell =
   floor.l d \/ 3 floor.r . $ <l:side:parameters>]

Every constant denoted by $C$ is positive and absolute.

We will use Lemma 3 also in lower ambient dimensions. If $mu_n$ is uniform probability on $S^(n - 1)$, $n gt.eq
  2$, that lemma gives, for $s in S^(n - 1)$,

#[#set math.equation(numbering: n => "(113)")
 $ mu_n \( B \( s \, r \) \) lt.eq r^(n - 1) quad \( 0 < r lt.eq 1 \/ 2 \) \, wide
   mu_n \( B \( s \, r \) \) lt.eq \( 2 r \)^(n - 1) quad \( r > 0 \) . $ <l:side:caps>]

#thm([Lemma 9.1.])[
  (A finite message from a locally diffuse prior).  #emph[Let $nu lt.double
    mu$ be a probability measure supported in $B \( c \, R \)$, where $c in bb(R)^d$ and $R > 0$.
    Suppose that for $nu$-almost every $s$, simultaneously for all $r > 0$,
#[#set math.equation(numbering: n => "(114)")
 $ nu \( B \( s \, r \) \) lt.eq K \( r \/ R \)^alpha \, wide K gt.eq 1 . $ <l:side:local-mass>]

 Draw $S tilde.op nu$ and an independent standard Gaussian $k$-by-$d$ matrix $A$, where $1 lt.eq k lt.eq k_(*)$.
   A measurable probability kernel of $\( A \, A S \)$ produces a message $Z$ in an alphabet of cardinality $w
   gt.eq 1$. Then
#[#set math.equation(numbering: n => "(115)")
 $ I \( S \; Z \) lt.eq C \( d + log K \) + frac(log w, p) . $ <l:side:local-bound>]

]
] <l:side:local-information>

#proof[
  We first control the volume of the simplex spanned by independent points from $nu$.
    The use of Gaussian replicas and Gram–Schmidt factors is related to the projection argument of Sharan,
    Sidford, and Valiant #cite(label("SSV2019")) Section 7, Lemma 12.
    The geometric moment and the exact-message information estimate needed here are proved below.
  Let $V$ be an affine subspace of dimension $m lt.eq p - 2$, and let $0 < u lt.eq 1$.
    Points of $B \( c \, R \)$ within distance $u R$ of $V$ project into $V ∩ B \( c \, 2 R \)$.
    A maximal separated set covers this set by at most $\( C \/ u \)^m$ balls in $V$ of radius $u R$; when $m =
    0$, one ball suffices. The corresponding points in the original tube lie in ambient balls of radius $2 u R$.
    Such a ball of positive $nu$-mass contains a point where (114) holds, and it is contained,
    on the support of $nu$, in a radius-$4 u R$ ball about that point. Hence
  #[#set math.equation(numbering: n => "(116)")
   $ nu { s : "dist" \( s \, V \) lt.eq u R } lt.eq K C^d u^(alpha - m) . $ <l:side:tube>]
  The parameters give $alpha - m - a gt.eq 3 d \/ 32$. Integrating the tail of $\( R \/ "dist" \( S \, V \) \)^a$,
    and using (116) for values of this variable above one, gives
  #[#set math.equation(numbering: n => "(117)")
   $ bb(E)_nu \( R \/ "dist" \( S \, V \) \)^a lt.eq K C^d . $ <l:side:height-moment>]
  Indeed the tail integral is bounded by $1 + K C^d a \/ \( alpha - m - a \)$.
    The tube bound also proves that $V$ has zero $nu$-mass.
  Draw $\( S_1 \, dots.h \, S_p \) tilde.op nu^(⊗ p)$. Let $F$ be the matrix with columns $S_i - S_1$, $2 lt.eq
    i lt.eq p$, and set $v = sqrt(det \( F^(sans(T)) F \))$. Gram–Schmidt writes $v$ as the product of the
    distances from $S_i$ to $"aff" \( S_1 \, dots.h \, S_(i - 1) \)$.
    The preceding zero-mass statement shows successively that these distances are positive almost surely.
    Integrating the last point first and repeating (117) proves
  #[#set math.equation(numbering: n => "(118)")
   $ bb(E)_(nu^(⊗ p)) \( R^q \/ v \)^a lt.eq \( K C^d \)^q . $ <l:side:gram-moment>]
  We use this moment in a normalized comparison of posterior replicas.
    Temporarily add an independent $N \( 0 \, sigma^2 I_k \)$ vector $eta$ to the labels, where $0 < sigma lt.eq
    R$, and set $b = A S + eta$. Apply the given message kernel to $\( A \, b \)$ and call its output $Z_sigma$.
    Write $P_A$ for the Gaussian matrix law. With $phi_sigma$ denoting the noise density, write
  $ f_sigma \( b divides A \) = integral phi_sigma \( b - A s \) thin d nu \( s \) . $
  Sample $\( A \, b \, Z_sigma \)$ from this experiment. Conditional on these variables,
    sample $p$ independent points from the posterior of $S$ given $\( A \, b \)$;
    their conditional law does not depend further on $Z_sigma$.
    Let $P_sigma$ be the resulting marginal on $\( S_1 \, dots.h \, S_p \, A \, b \)$ and $Q_sigma$ its
    point-tuple marginal. Each pair $\( S_i \, Z_sigma \)$ has the experiment’s original marginal.
    Put $D_Q = D \( Q_sigma parallel nu^(⊗ p) \)$, initially allowing the value $+ oo$.
    Once $D_Q$ is finite, relative entropy to a product bounds the sum of the marginal relative entropies:
    their difference is the relative entropy of the joint law to the product of its own marginals.
    Apply this after conditioning on the common message and use the matching single-point marginals.
    The conditional chain rule then gives
  #[#set math.equation(numbering: n => "(119)")
   $ p I \( S \; Z_sigma \) & lt.eq
     bb(E)_(Z_sigma) D \( Q_(sigma \, S_1 \, dots.h \, S_p divides Z_sigma) parallel nu^(⊗ p) \)\
 & = D_Q + I \( \( S_1 \, dots.h \, S_p \) \; Z_sigma \) lt.eq D_Q + log w . $ <l:side:replica-message>]
  It therefore suffices to prove $D_Q \/ p lt.eq C \( d + log K \)$, uniformly in $sigma$.
    We will prove finiteness and this bound by comparing the posterior tuple law with a normalized reference whose
    tuple marginal is exactly $nu^(⊗ p)$.
  Relative to $nu^(⊗ p) ⊗ P_A ⊗ d b$, the density of $P_sigma$ is
  #[#set math.equation(numbering: n => "(120)")
   $ frac(product_(i = 1)^p phi_sigma \( b - A S_i \), f_sigma \( b divides A \)^q) . $ <l:side:auxiliary-density>]
  For a fixed tuple, the integral of the numerator over $\( A \, b \)$ is
  #[#set math.equation(numbering: n => "(121)")
   $ c_sigma \( F \) = \( 2 pi \)^(- k q \/ 2) det #h(-0.16667em)
     (F^(sans(T)) F + sigma^2 \( I_q + upright(bold(1)) upright(bold(1))^(sans(T)) \))^(- k \/ 2) .
     $ <l:side:normalizer>]
  Here $upright(bold(1)) in bb(R)^q$ is the all-ones column.
    To verify this formula, take $p$ independent noisy labels with the same matrix $A$.
    Integrating their product density over their common value $b$ evaluates at zero the density of the $q$
    differences from the first label. In one row, the projected signal differences have covariance $F^(sans(T))
    F$,
    and the noise differences have covariance $sigma^2 \( I_q + upright(bold(1)) upright(bold(1))^(sans(T)) \)$.
    The rows are independent, which proves (121). On full-rank tuples,
  #[#set math.equation(numbering: n => "(122)")
   $ c_sigma \( F \) lt.eq \( 2 pi \)^(- k q \/ 2) v^(- k) . $ <l:side:normalizer-volume>]
  Define a reference probability law $R_sigma$ by the density
  #[#set math.equation(numbering: n => "(123)")
   $ frac(product_(i = 1)^p phi_sigma \( b - A S_i \), c_sigma \( F \)) quad
     upright("relative to ") nu^(⊗ p) ⊗ P_A ⊗ d b . $ <l:side:reference-density>]
  The denominator is exactly the integral for each fixed tuple.
    Thus the tuple marginal of this reference law is $nu^(⊗ p)$, rather than an unnormalized multiple of that law.
  All logarithms in this comparison are integrable at fixed $sigma > 0$.
    The tuple is supported in $B \( c \, R \)^p$, and
  $ sigma^2 I_q prec.curly.eq F^(sans(T)) F + sigma^2 \( I_q + upright(bold(1)) upright(bold(1))^(sans(T)) \)
    prec.curly.eq \( 4 q R^2 + p sigma^2 \) I_q . $
  Hence $log c_sigma$ is bounded as the tuple varies. Also $log f_sigma$ is at most $- k /
    2 log \( 2 pi sigma^2 \)$ and at least this value minus
  $ frac(\( parallel b - A c parallel + parallel A parallel_(upright("op")) R \)^2, 2 sigma^2) . $
  The latter term is integrable under the noisy experiment. Data processing therefore proves $D_Q < oo$ and gives
  #[#set math.equation(numbering: n => "(124)")
   $ D_Q lt.eq D \( P_sigma parallel R_sigma \) = bb(E)_(P_sigma) log c_sigma \( F \) -
     q bb(E)_(P_sigma) log f_sigma \( b divides A \) . $ <l:side:kl-comparison>]
  To bound the second term, compare $f_sigma \( dot.op divides A \)$ with the $N \( A c \, 2 R^2 I_k \)$ density.
    Since $bb(E) parallel b - A c parallel^2 lt.eq k R^2 + k sigma^2 lt.eq 2 k R^2$, nonnegative relative entropy yields
  $ - bb(E) log f_sigma \( b divides A \) lt.eq k log R + k / 2 log \( 4 pi e \) . $
  Together with (122), this gives, initially allowing the expectation on the right to be extended,
  #[#set math.equation(numbering: n => "(125)")
   $ D_Q lt.eq k bb(E)_(Q_sigma) log \( R^q \/ v \) + C k q . $ <l:side:kl-volume>]
  Here the needed expectation is in fact finite. Put $X = a log \( R^q \/ v \)$.
    Hadamard’s inequality gives $v lt.eq \( 2 R \)^q$, so $X gt.eq - a q log 2$.
    For bounded $X'$ the probability law proportional to $e^(X') nu^(⊗ p)$ and nonnegative relative entropy give
  $ bb(E)_(Q_sigma) X' lt.eq D_Q + log bb(E)_(nu^(⊗ p)) e^(X') . $
  Apply this to $X' = min \( X \, n \)$ and let $n arrow.r oo$.
    Monotone convergence after adding the fixed lower bound, together with (118), proves both finiteness and
  $ a bb(E)_(Q_sigma) log \( R^q \/ v \) lt.eq D_Q + q \( log K + C d \) . $
  Because $k \/ a lt.eq 1 \/ 4$, substitution into (125) and absorption of $\( k \/ a \) D_Q$ give
  #[#set math.equation(numbering: n => "(126)")
   $ D_Q \/ p lt.eq C \( d + log K \) . $ <l:side:kl-absorption>]
  Combining (126) with (119) proves (115) for the noisy experiment, uniformly over $0 < sigma lt.eq R$.
  It remains to pass this inequality to the given exact-label rule.
    This step uses the rule itself, rather than a comparison of the statistical difficulties of noisy and
    noiseless experiments. For every rank-$k$ matrix with $k < d$, the image of $mu$ has a Lebesgue density.
    One direct proof uses a normalized standard Gaussian: the squared length of the first $k$ coordinates is a
    beta variable with parameters $k \/ 2 \, \( d - k \) \/ 2$,
    obtained from the ratio of independent chi-square variables, and its direction is uniform.
    This gives a density on the unit $k$-ball. Orthogonal changes of coordinates and an invertible range map give
    the claim for any rank-$k$ matrix. Absolute continuity $nu lt.double mu$ preserves it.
    Since a Gaussian matrix has full row rank almost surely and itself has a Lebesgue density,
    $\( A \, A S \)$ has a joint Lebesgue density.
  Let $g_z \( A \, b \)$ be the output probability of message $z$.
    For any bounded measurable function $g$ and a random vector $X$ with a Lebesgue density,
  #[#set math.equation(numbering: n => "(127)")
   $ bb(E) \| g \( X + h \) - g \( X \) \| arrow.r 0 quad \( h arrow.r 0 \) . $ <l:side:weighted-translation>]
  To see this, restrict the input density to a bounded cube and to values below a fixed bound,
    losing arbitrarily little probability. For small $h$, cut $g$ off on a larger cube.
    The remaining integral is bounded by a constant times the Lebesgue $L^1$ distance between this cutoff and its
    translate. That distance tends to zero, since continuous compactly supported functions are dense in $L^1$ and
    their translates converge uniformly on a common compact set. This proves (127).
    Apply it to shifts in the label coordinates, then to $h = \( 0 \, sigma G \)$ with $G$ standard Gaussian by
    bounded convergence. The finite alphabet gives
  #[#set math.equation(numbering: n => "(128)")
   $ sum_z bb(E) \| g_z \( A \, A S + eta \) - g_z \( A \, A S \) \| arrow.r 0 . $ <l:side:kernel-limit>]
  Couple the two message probability vectors at each $\( S \, A \, eta \)$ by their common masses,
    so that their disagreement probability $delta$ is half the expected sum in (128).
    This is a measurable coupling because the alphabet is finite.
    Write $h_2 \( t \) = - t log t - \( 1 - t \) log \( 1 - t \)$, with $0 log 0 = 0$, for binary entropy.
    The disagreement indicator bounds each of the marginal and conditional entropy differences by
    $h_2 \( delta \) + delta log w$: on disagreement there are at most $w$ possible values,
    and binary entropy is concave when conditional disagreement probabilities are averaged. Consequently
  $ \| I \( S \; Z_sigma \) - I \( S \; Z \) \| lt.eq 2 { h_2 \( delta \) + delta log w } arrow.r 0 . $
  For $w = 1$ both messages are constant and the assertion is immediate.
    The uniform noisy bound therefore proves (115) for the exact labels $A S$. ◻
]

#thm([Lemma 9.2.])[
  (Adaptive cells predicted by independent side data).  #emph[Let $nu$ be a probability measure with $d nu \/ d mu
    lt.eq B < oo$. Draw $S tilde.op nu$, an independent standard Gaussian $k$-by-$d$ matrix $A$ with $1 lt.eq
    k lt.eq k_(*)$, and a message $Z$ in an alphabet of size $w gt.eq
    1$ from a measurable kernel of $\( A \, A S \)$. Independently of the signal, the matrix,
    and the message randomness, draw a standard Gaussian $ell$-by-$d$ matrix $W$, and put $D_(*) = \( W \, W S \)$. Then
#[#set math.equation(numbering: n => "(129)")
 $ I \( S \; Z divides D_(*) \) lt.eq C [d + log (C (2 + frac(log B, d)))] + frac(log w, p) . $ <l:side:adaptive-bound>]

]
] <l:side:adaptive>

#proof[
  Since $nu$ is a probability, $B gt.eq 1$. Put $m_s \( r \) = nu \( B \( s \, r \) \)$ and $R_j =
    2^(1 - j)$ for integers $j gt.eq 0$. Choose $J \( s \)$ to be the least index maximizing $2^(alpha j)
    m_s \( R_j \)$, and write $J = J \( S \)$. The score at $j = 0$ is one because $R_0 = 2$ covers the sphere.
    The second cap bound in (113) gives
  $ 2^(alpha j) m_s \( R_j \) lt.eq B thin 2^(2 \( d - 1 \) - j \( d - 1 - alpha \)) arrow.r 0 . $
  The ball masses are measurable in $s$, by integrating the Borel indicator of $parallel s - u parallel lt.eq
    R_j$. Thus the least maximizer is measurable and
  #[#set math.equation(numbering: n => "(130)")
   $ 0 lt.eq J \( s \) lt.eq frac(log_2 B + 2 \( d - 1 \), d - 1 - alpha) \, wide H \( J \) lt.eq
     log (C (2 + frac(log B, d))) . $ <l:side:scale-entropy>]
  The entropy bound follows from the displayed finite range.
    For $R = R_(J \( s \))$, compare the maximum with the least dyadic radius at least $r$ when $r lt.eq 2$,
    and with $R_0 = 2$ when $r > 2$. This proves
  #[#set math.equation(numbering: n => "(131)")
   $ m_s \( r \) lt.eq 2^alpha m_s \( R \) \( r \/ R \)^alpha wide \( r > 0 \) . $ <l:side:adaptive-growth>]
  At each scale choose a finite maximal $R_j$-separated set of centers on the sphere.
    Its $R_j$-balls cover the sphere. Enumerate the centers and assign a point to the first center within distance
    $R_j$; this is a measurable rule. Let $U = \( J \, i \)$ record the scale and assigned center.
    Its range is finite by (130) and the finiteness of each net.
    For each cell $u = \( j \, i \)$ of positive probability, write $c_u$ for its center, $b_u =
    bb(P) \( U = u \)$, and $m_u^(+) = nu \( B \( c_u \, 2 R_j \) \)$.
  At one scale, a point lies in at most $5^d$ of the enlarged balls $B \( c_u \, 2 R_j \)$.
    Indeed the disjoint interiors of the radius-$R_j \/ 2$ balls about those centers lie in a ball of radius $5
    R_j \/ 2$ about the point. Volume comparison proves the count,
    and integration gives $sum_(u = \( j \, i \)) m_u^(+) lt.eq 5^d$. Write $p_j = bb(P) \( J = j \)$.
    Concavity of the logarithm with weights $b_u \/ p_j$ at each positive-mass scale yields
  #[#set math.equation(numbering: n => "(132)")
   $ sum_u b_u log m_u^(+) / b_u lt.eq sum_(j : p_j > 0) p_j log 5^d / p_j = d log 5 +
     H \( J \) . $ <l:side:overlap-entropy>]
  The conditional prior $nu_u$ is supported in $B \( c_u \, R_j \)$ and remains absolutely continuous with respect
    to $mu$. If $s$ is in that cell, then $m_s \( R_j \) lt.eq m_u^(+)$.
    Dividing (131) by $b_u$ gives, for $nu_u$-almost every $s$ and all $r > 0$,
  $ nu_u \( B \( s \, r \) \) lt.eq frac(2^alpha m_u^(+), b_u) \( r \/ R_j \)^alpha . $
  Here $m_u^(+) gt.eq b_u$, so the factor is at least one. The matrix $A$ remains independent of $\( S \, U \)$,
    and the same message kernel is used. Apply Lemma 35 for each $u$, average, and use (132). We obtain
  #[#set math.equation(numbering: n => "(133)")
   $ I \( S \; Z divides U \) lt.eq C \( d + H \( J \) \) + frac(log w, p) . $ <l:side:information-in-cell>]
  We have bounded the information inside each cell. We now pay for its label in the presence of the side data.
    For a known scale $j$, predict the center index from $\( W \, y \)$ by the normalized probabilities
  #[#set math.equation(numbering: n => "(134)")
   $ pi_(j \, i) \( W \, y \) =
     frac(b_(\( j \, i \)) exp \( - parallel W c_(\( j \, i \)) - y parallel^2 \/ \( 2 R_j^2 \) \), sum_(i') b_(\(
     j \, i' \)) exp \( - parallel W c_(\( j \, i' \)) - y parallel^2 \/ \( 2 R_j^2 \) \)) . $ <l:side:predictor>]
  Discard zero-probability cells. At an occurring scale the denominator is positive and the set of indices is
    finite. Nonnegative relative entropy between the conditional center distribution and these probabilities
    bounds $H \( i divides D_(*) \, J \)$ by the expected negative logarithm of the true cell’s prediction.
  Fix a true point $s$ with $J \( s \) = j$ and put $R = R_j$. For its center,
  $ bb(E)_W frac(parallel W \( c_U - s \) parallel^2, 2 R^2) lt.eq ell \/ 2 . $
  For any candidate center $c$, direct Gaussian integration gives
  $ bb(E)_W exp \( - parallel W \( c - s \) parallel^2 \/ \( 2 R^2 \) \) =
    (1 + frac(parallel c - s parallel^2, R^2))^(- ell \/ 2) . $
  Centers within distance $2 R$ of $s$ have total cell probability at most $m_s \( 3 R \)$,
    since their cells are within an additional distance $R$. Centers at distances in $\( 2^t R \, 2^(t + 1) R \]$,
    $t gt.eq 1$, have total cell probability at most $m_s \( 2^(t + 2) R \)$ and expected kernel at most
    $2^(- t ell)$ per unit cell probability. The expected denominator in (134), evaluated at $y = W s$,
    is therefore at most
  #[#set math.equation(numbering: n => "(135)")
   $ m_s \( 3 R \) + sum_(t gt.eq 1) 2^(- t ell) m_s \( 2^(t + 2) R \) & lt.eq
     m_s \( R \) (6^alpha + 2^(3 alpha) sum_(t gt.eq 1) 2^(- t \( ell - alpha \)))\
 & lt.eq e^(C d) m_s \( R \) . $ <l:side:shells>]
  The first inequality uses (131); the series converges because $ell - alpha gt.eq 1$ for large $d$.
  Jensen’s inequality for the logarithm of this denominator, together with the true-center squared term,
    bounds the expected prediction loss at $s$ by $C d + log \( m_s \( R \) \/ b_U \)$.
    The logarithms are integrable: the denominator is at least the true term,
    and its negative logarithm is bounded by $- log b_U$ plus a Gaussian squared term.
    Averaging and using $m_S \( R_J \) lt.eq m_U^(+)$ in (132) gives
  #[#set math.equation(numbering: n => "(136)")
   $ H \( U divides D_(*) \) lt.eq H \( J \) + C d + bb(E) log frac(m_S \( R_J \), b_U) lt.eq C d +
     2 H \( J \) . $ <l:side:cell-given-side>]
  Finally $U$ is a function of $S$, and $Z$ is conditionally independent of $D_(*)$ given $\( S \, U \)$.
    Since $Z$ is finite,
  $ I \( S \; Z divides D_(*) \, U \) & = H \( Z divides D_(*) \, U \) - H \( Z divides S \, U \)\
 & lt.eq H \( Z divides U \) - H \( Z divides S \, U \) = I \( S \; Z divides U \) . $
  The chain rule then gives $I \( S \; Z divides D_(*) \) lt.eq H \( U divides D_(*) \) +
    I \( S \; Z divides U \)$. Combining (130), (133), and (136) proves (129).
    The cell has been revealed only inside this calculation, with its full conditional entropy charged;
    no local regularity of the original state posterior was assumed. ◻
]

=== 9.1 The full state transcript and the precision endpoint <l:side:endpoint>

We now give a second proof of Corollary 34. The information bound will be conditional on the same side data
  $D_(*)$ at every block, and its endpoint will account for the residual sphere left by those data.

#proof[
  Take $S tilde.op mu$ and use the reductions following Lemma 2.
    First fix the shared rule randomness with uniform-prior success greater than $3 \/ 5$, apply Lemma 1,
    and then fix the independent initial state with success at least $3 \/ 5$.
    Fresh transition and terminal output randomness may remain:
    the two lemmas permit finite message kernels, and the calculation below integrates the terminal output law.
  Put $L = log \( 1 \/ epsilon.alt \)$ with $0 < epsilon.alt lt.eq 1 \/ 10$.
    If $T = 0$, the fixed initial state and terminal rule give an output independent of $S$,
    whose success is at most $epsilon.alt^(d - 1) < 3 \/ 5$ by (113).
    Thus the successful runs considered below have $T gt.eq 1$.
  It suffices to consider $T < d L$. There are at most $\( T + 1 \)
    2^M$ terminal pairs consisting of the stopping index and state.
    For a fixed pair $h$, the joint subprobability law $lambda_h$ of $S$ and the event of reaching $h$ satisfies
    $lambda_h lt.eq mu$. The unit output conditional on $h$ uses only its terminal law and fresh randomness,
    so is independent of $S$. Angular success implies Euclidean error at most $epsilon.alt$,
    and (113) applies since $epsilon.alt lt.eq 1 \/ 10$. Integrating the terminal output law and summing over
    pairs gives
  #[#set math.equation(numbering: n => "(137)")
   $ 3 / 5 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) \, wide \( d - 1 \) L lt.eq M log 2 + log \( T + 1 \) +
     O \( 1 \) . $ <l:side:output-count>]
  Using $T < d L$ and $log \( d L + 1 \) lt.eq log \( d + 1 \) + L$ yields $\( d - 2 \) L lt.eq M log 2 +
    O \( log d \)$. Along a sequence $M = o \( d^2 \)$ this implies $L =
    o \( d \)$ in the present short-run case and eventually $T lt.eq d^2$.
  After an early stop, preserve its state together with its terminal index and ignore the remaining fresh samples.
    The active states and all terminal tags together give the global width bound
  #[#set math.equation(numbering: n => "(138)")
   $ w = \( T + 2 \) 2^M \, wide log w = M log 2 + log \( T + 2 \) = o \( d^2 \) . $ <l:side:padded-width>]
  The output law at a terminal tag is the original terminal law.
    Split the $T$ padded samples into $N = ceil.l T \/ k_(*) ceil.r$ consecutive blocks of length at most $k_(*)$.
    Let $Pi_i$ record every state at the first $i$ block ends, with $Pi_0$ empty.
    This is the full state transcript, not just its final state.
  Independently draw one matrix $W$ with $ell$ Gaussian rows and retain the same $D_(*) = \( W \, W S \)$ for all
    blocks. For every positive-mass history $h$ of $Pi_(i - 1)$, its conditional signal law satisfies
  #[#set math.equation(numbering: n => "(139)")
   $ frac(d nu_h, d mu) \( s \) = frac(bb(P) \( Pi_(i - 1) = h divides S = s \), bb(P) \( Pi_(i - 1) = h \)) lt.eq
     B_h := frac(1, bb(P) \( Pi_(i - 1) = h \)) . $ <l:side:history-density>]
  Given $h$, the next block matrix is still fresh Gaussian and independent of $S$,
    and $W$ remains independent of both. The incoming state is known from $h$.
    The persistent-memory restriction makes the successor state a kernel of that state and the block’s complete
    exact data, with alphabet size at most $w$. It has no access to $D_(*)$.
    Lemma 36 therefore applies conditionally on each history.
  The posterior-density cost is small after averaging. Since $Pi_(i - 1)$ is a tuple of at most $N$ states from an
    alphabet of size $w$,
  $ bb(E)_h log B_h = H \( Pi_(i - 1) \) lt.eq N log w . $
  Jensen’s inequality gives
  $ bb(E)_h log (C (2 + frac(log B_h, d))) & lt.eq log (C (2 + frac(N log w, d))) = O \( log d \) . $
  Here $N = O \( d \)$ follows from $T lt.eq d^2$ and $k_(*) gt.eq d \/ 64$ for large $d$;
    also $\( log w \) \/ p = o \( d \)$ by (138). Summing the conditional information bounds for successive states
    by the chain rule gives an absolute $C_1$ such that
  #[#set math.equation(numbering: n => "(140)")
   $ I \( S \; Pi_N divides D_(*) \) lt.eq C_1 d N . $ <l:side:transcript-upper>]
  The local cell $U$ used in each application is not an uncharged part of $Pi_N$:
    its revelation was paid by (136) inside that block’s conditional bound.
  For a lower bound on the same information, condition on $D_(*)$. Almost surely $W$ has rank $ell$.
    Its labels specify $P_W S$, where $P_W$ is the orthogonal projector onto its row space.
    The remaining component has uniform direction in the nullspace, of dimension $d - ell$, and radius
  $ rho = sqrt(1 - parallel P_W S parallel^2) . $
  This conditional law follows by writing $S$ as a normalized standard Gaussian:
    the nullspace direction is independent of its length and of the row-space component.
    The event $cal(G) = { rho gt.eq 1 \/ 2 }$ is determined by $D_(*)$, and Markov’s inequality gives
  #[#set math.equation(numbering: n => "(141)")
   $ bb(P) \( cal(G)^c \) lt.eq 4 / 3 bb(E) parallel P_W S parallel^2 = frac(4 ell, 3 d) lt.eq 4 /
     9 . $ <l:side:good-radius>]
  On $cal(G)$, the mass of the conditional sphere within Euclidean distance $epsilon.alt$ of any fixed estimate is
    at most $\( 4 epsilon.alt \)^(d - ell - 1)$. If the ball meets that sphere, choose a point of intersection.
    The rest of the intersection lies within $2 epsilon.alt$ of it.
    After rescaling the residual sphere by $rho gt.eq 1 \/ 2$, the radius is at most $4 epsilon.alt lt.eq
    2 \/ 5 < 1 \/ 2$, so the first bound in (113) applies in ambient dimension $d - ell$.
  The final output $hat(S)$ is conditionally independent of $S$ given $\( Pi_N \, D_(*) \)$,
    because the transcript contains its terminal tag. For each value of $D_(*)$,
    compare the actual joint law of $\( S \, Pi_N \, hat(S) \)$ with the product of its conditional $S$ marginal
    and conditional $\( Pi_N \, hat(S) \)$ marginal. On $cal(G)$ the success probability under this product is at
    most $\( 4 epsilon.alt \)^(d - ell - 1)$. Binary relative entropy is at least the true event probability times
    the negative logarithm of its product-law probability, minus $log 2$.
    Integrating over $cal(G)$, and using nonnegativity elsewhere, gives
  #[#set math.equation(numbering: n => "(142)")
   $ I \( S \; Pi_N divides D_(*) \) & = I \( S \; Pi_N \, hat(S) divides D_(*) \)\
 & gt.eq (3 / 5 - 4 / 9) \( d - ell - 1 \) log frac(1, 4 epsilon.alt) - log 2 gt.eq c_0 d L $ <l:side:transcript-lower>]
  for an absolute $c_0 > 0$ and sufficiently large $d$. The coefficient $3 \/ 5 -
    4 \/ 9$ accounts for the success mass outside the failed-radius event.
    For the last inequality, $d - ell - 1$ is a positive multiple of $d$ and $L -
    log 4 gt.eq \( 1 - log 4 \/ log 10 \) L$.
  Combining (140) and (142), and using $N = ceil.l T \/ k_(*) ceil.r lt.eq T \/ k_(*) + 1$,
    gives the exact intermediate bound
  #[#set math.equation(numbering: n => "(143)")
   $ T gt.eq k_(*) (c_0 / C_1 L - 1) . $ <l:side:precision-time>]
  We retain a separate linear endpoint to absorb its additive constant.
    If $T < d \/ 3$, reveal all $T$ pre-generated rows and exact labels, even after an early stop.
    The same normalized-Gaussian argument gives a uniform conditional sphere of ambient dimension $d - T$.
    Its radius is at least $1 \/ 2$ except on an event of probability at most $4 T \/ \( 3 d \) < 4 \/ 9$.
    The preceding conditional cap argument therefore bounds the success of even a full-data estimator by
  $ 4 / 9 + \( 4 epsilon.alt \)^(d - T - 1) < 3 / 5 $
  for sufficiently large $d$, a contradiction. Thus $T gt.eq d \/ 3$.
    When $L gt.eq 2 C_1 \/ c_0$, (143) implies $T gt.eq c d L$; for smaller $L$,
    the linear bound gives the same conclusion after reducing the absolute constant.
    The case $T gt.eq d L$ needed no reduction. Every learner observation throughout this argument is the exact
    inner product; the auxiliary noise appeared only in the proved passage to the exact-message inequality. ◻
]

== 10 Localization by separated tuples <l:sep:section>

This argument measures concentration after an additional fresh block of exact observations.
  On an actual block, an auxiliary revelation has one of two effects:
  it places the signal in a smaller ball, or it produces several well-separated signals compatible with the same
  data. In the second case an exact comparison on the equal-label constraints divides the cost of the learner’s
  finite message by the number of signals. The radius decrease pays for the revelations needed to reach that case.

Let $S$ be uniform on $S^(d - 1)$. In this section $sigma$ denotes unnormalized surface area, and

$ k = ell = floor.l d \/ 16 floor.r \, wide q = ell - 1 \, wide n = d - 1 - k . $

We take $d$ sufficiently large that $ell gt.eq 2$. A block is $B = \( X_B \, Y_B \)$,
  where $X_B$ has $k$ independent standard Gaussian rows and $Y_B = X_B S$.
  A block is fresh relative to a variable $U$ when its matrix is independent of the pair $\( S \, U \)$.
  We use $h_j$ for entropy relative to unnormalized area on a $j$-dimensional sphere,
  including spheres in affine subspaces, and $h$ for Lebesgue entropy. Conditional entropies are averaged.
  All logarithms are natural.

=== 10.1 Spherical slicing and a concentration potential <spherical-slicing-and-a-concentration-potential>

For a full-row-rank matrix $X$, let $V = "row" \( X \)$ and define

$ R_X \( s \) = sqrt(1 - parallel P_V s parallel^2) \, wide j_X \( s \) =
  sqrt(det \( X X^(sans(T)) \)) thin R_X \( s \) . $

At $R_X \( s \) > 0$, the fiber ${ z in S^(d - 1) : X z = X s }$ is an $n$-sphere of radius $R_X \( s \)$.
  Write $sigma_(X \, y)$ for its unnormalized area measure.

The normal Jacobian in the coarea formula is $j_X \( s \)$;
  compare Federer’s Definition 2.10 and Theorem 3.1 #cite(label("Federer1959")) pp. 423 and 426–427.
  We give the coordinate calculation, including the normalization needed here.
  Choose orthonormal coordinates in $V$ and $V^perp$, and write $s = \( u \, R theta \)$ with $R =
  sqrt(1 - parallel u parallel^2)$ and $theta in S^n$. The $theta$-directions scale area by $R^n$.
  The Gram matrix in the $u$-directions is $I + u u^(sans(T)) \/ R^2$, of determinant $1 \/ R^2$,
  and these two tangent groups are orthogonal. The surface element is consequently $R^(n - 1) thin d u thin d
  sigma_n \( theta \)$. The map from $u$ to $y = X s$ has absolute determinant $sqrt(det \( X X^(sans(T)) \))$,
  whereas the area element on the fiber is $R^n thin d sigma_n \( theta \)$.
  Let $cal(E)_X = { y : y^(sans(T)) \( X X^(sans(T)) \)^(- 1) y < 1 }$. Thus for every nonnegative Borel $g$,

#[#set math.equation(numbering: n => "(144)")
 $ integral_(S^(d - 1)) g \( s \) thin sigma \( d s \) = integral_(cal(E)_X) integral_({ X s = y })
   frac(g \( s \), j_X \( s \)) thin sigma_(X \, y) \( d s \) thin d y . $ <l:sep:area-disintegration>]

The right side uses only positive-radius fibers. The omitted critical set $R_X = 0$ has zero full-sphere area.
  The nonnegative formula follows directly from the coordinates and Tonelli,
  including by exhaustion when an integral is infinite.

Suppose the relevant conditional log densities are integrable and put $Y = X S$.
  If $p \( s divides X \, U \)$ is the full-sphere density and $p_Y \( y divides X \, U \)$ the label density,
  then the conditional slice density is

$ frac(p \( s divides X \, U \), j_X \( s \) thin p_Y \( X s divides X \, U \)) . $

Taking its logarithm gives the separate entropy identity

#[#set math.equation(numbering: n => "(145)")
 $ h_n \( S divides X \, Y \, U \) = h_(d - 1) \( S divides X \, U \) - h \( Y divides X \, U \) +
   bb(E) log j_X \( S \) . $ <l:sep:entropy-slicing>]

The area identity (144) and the entropy identity (145) will be used at different points below.

Here is a finiteness check for every later use. For a fresh Gaussian matrix,
  $R_X \( S \)^2$ has the law $U \/ \( U + V \)$, where $U tilde.op chi_(d - k)^2$ and $V tilde.op
  chi_k^2$ are independent. The chi-square density at zero and its exponential tail imply $bb(E) \| log
  R_X \( S \) \| < oo$. If $Z_j = sum_(i = 1)^j g_i^2$ with standard Gaussians $g_i$,
  then arithmetic–geometric mean and Jensen give

$ log j + bb(E) log g_1^2 lt.eq bb(E) log Z_j lt.eq log j . $

It follows that $bb(E) log R_X \( S \) gt.eq - C$. Gram–Schmidt on the rows of $X$ expresses
  $det \( X X^(sans(T)) \)$ as a product of chi-squares in dimensions $d \, d - 1 \, dots.h \, d - k + 1$. Hence

$ bb(E) \| log det \( X X^(sans(T)) \) \| < oo \, wide bb(E) log det \( X X^(sans(T)) \) gt.eq k log d - C d . $

Given an unconditioned block, $S$ is uniform on its fiber.
  Its slice area is $\| S^n \| R_X \( S \)^n$, and its label density is that area divided by $j_X \( S \) \|
  S^(d - 1) \|$. The sampled log densities are therefore integrable by the preceding estimates.

Adding a countable variable $U$ with finite Shannon entropy preserves this property.
  Indeed, the average divergence of a law conditioned further on $U$ from the preceding conditional law is at most
  $H \( U \)$. For a likelihood ratio $v$, its negative log part has numerator expectation at most $integral
  v \( log v \)_(-) thin d Q lt.eq 1 \/ e$. The likelihood log is consequently integrable,
  and so are the new log densities. This reasoning also works after conditioning on $X$,
  even if $U$ depends on $X$. We establish finite Shannon entropy for every auxiliary string before using (145)
  with that string.

Let $K$ be a countable transcript with $H \( K \) < oo$. Suppose $K$ specifies a closed ball $B \( z \, r \)$
  containing $S$, where $0 < r lt.eq 1$, and put

$ Lambda = bb(E) \[ - log r \] < oo . $

For an absolute $C_v$, every affine $n$-sphere $Sigma$ obeys

#[#set math.equation(numbering: n => "(146)")
 $ "area"_n \( Sigma ∩ B \( z \, r \) \) lt.eq \| S^n \| \( C_v r \)^n . $ <l:sep:area-bound>]

If the radius $R$ of $Sigma$ is at most $4 r$, use its entire area. Otherwise, choose a point of the intersection.
  The intersection lies in its chordal cap of radius $2 r$, whose polar angle is at most $C r \/ R$.
  Polar integration bounds that area by $\| S^(n - 1) \| R^n \( C r \/ R \)^n \/ n$.
  The sphere-area formula, or the same polar integral, gives $\| S^(n - 1) \| \/ n lt.eq C \| S^n \|$;
  increasing $C_v$ proves (146).

For a fresh block $B$, define

#[#set math.equation(numbering: n => "(147)")
 $ b_n = log \| S^n \| + n log C_v \, wide P = b_n - n Lambda - h_n \( S divides K \, B \) . $ <l:sep:potential>]

The block $B$ is an auxiliary probe used only to evaluate this potential.
  After the transcript changes, the updated potential is evaluated using a new independent fresh block.
  The entropy of a probability density supported on a set of area $v$ is at most $log v$.
  Applying this fact on each fiber and using (146) gives $P gt.eq 0$.
  The same conclusion holds with a nonfresh slicing block if the conditioning still specifies the containing ball.
  With $r = 1$ and a transcript independent of the signal and block,

$ P_0 = n log C_v - n bb(E) log R_X \( S \) = O \( d \) . $

#thm([Lemma 10.1.])[
  (Information controlled by the sliced potential).  #emph[For the preceding $K \, r$ and a fresh block,
#[#set math.equation(numbering: n => "(148)")
 $ I \( Y_B \; K divides X_B \) & lt.eq frac(k, d - 1) I \( S \; K \) + C d \, & h \( Y_B divides X_B \) & gt.eq -
   C d \,\
I \( S \; K \) & lt.eq C \( P + d Lambda + d \) \, & - h \( Y_B divides X_B \, K \) & lt.eq
  C \( P + d Lambda + d \) . $ <l:sep:subset-bounds>]

]
] <l:sep:information>

#proof[
  The subset averaging below is the entropy-cover mechanism used in the Product Theorem of Chung, Graham, Frankl,
    and Shearer #cite(label("ChungGrahamFranklShearer1986")) Section V, Equation (22), pp. 33–34.
    We give the conditional differential-entropy form required here.
    Let $Q$ be an independent Haar orthogonal frame and set $Z_i = chevron.l Q_i \, S chevron.r$. Put $N = d - 1$.
    For a $k$-subset $E subset { 1 \, dots.h \, N }$, the entropy chain rule and conditioning give
  $ h \( Z_E divides Q \, K \) gt.eq sum_(i in E) h \( Z_i divides Q \, K \, Z_1 \, dots.h \, Z_(i - 1) \) . $
  Every index occurs in the same number of $k$-subsets. Averaging over the subsets and over $Q$,
    whose law is unchanged by column permutations, yields
  #[#set math.equation(numbering: n => "(149)")
   $ h \( Z_1 \, dots.h \, Z_k divides Q \, K \) gt.eq k / N h \( Z_1 \, dots.h \, Z_N divides Q \, K \) .
     $ <l:sep:subset-entropy>]
  This uses no rotation invariance of the conditional law given $K$. All projected entropies are finite:
    the uniform projection density has an integrable logarithm for every number of coordinates at most $d - 1$,
    and finite-entropy conditioning preserves this as above.
  Let $h_j^0$ be the entropy of $j$ fixed orthogonal coordinates of a uniform sphere point.
    The Gaussian maximum-entropy bound and the covariance $I_j \/ d$ give
  $ h_k^0 lt.eq k / 2 log \( 2 pi e \/ d \) . $
  For $j = N$, the two hemispherical graphs give
  $ h_N^0 = log \( \| S^(d - 1) \| \/ 2 \) + bb(E) log \| S_d \| gt.eq - N / 2 log d - C d . $
  For the last inequality, use the sphere-area formula and Stirling’s bound, and write $S =
    g \/ parallel g parallel$; Jensen bounds $bb(E) log parallel g parallel$ above by $1 / 2 log d$,
    whereas $bb(E) log \| g_d \|$ is a finite absolute constant. Data processing gives
  $ h \( Z_1 \, dots.h \, Z_N divides Q \, K \) gt.eq h_N^0 - I \( S \; K \) . $
  Thus (149) bounds the information in $k$ frame coordinates by $k / N I \( S \; K \) + C d$.
  Given $X_B$, its label is an invertible linear transform of the orthogonal coordinates in its row space.
    That row space is uniform, independent of $\( S \, K \)$;
    extending an orthonormal row frame gives the $Q$ experiment above.
    Hence the same information bound holds for $I \( Y_B \; K divides X_B \)$.
    Without $K$, (149) gives $h_k^0 gt.eq \( k \/ N \) h_N^0$.
    Passing from orthogonal coordinates to $Y_B$ adds $1 / 2 bb(E) log det \( X_B X_B^(sans(T)) \)$,
    which cancels the leading $- k / 2 log d$ term. This proves both inequalities in (148).
  By the definition of $P$,
  $ I \( S \; K divides B \) = P - P_0 + n Lambda . $
  Freshness and $Y_B = X_B S$ give the chain-rule identity
  $ I \( S \; K \) = I \( S \; K divides B \) + I \( Y_B \; K divides X_B \) . $
  Since $k \/ \( d - 1 \) lt.eq 1 \/ 4$, the first inequality of (148) can be absorbed on the left.
    This proves the information estimate in (148). Finally $h \( Y_B divides X_B \, K \) =
    h \( Y_B divides X_B \) - I \( Y_B \; K divides X_B \)$; the two bounds just proved give the negative-entropy
    estimate. ◻
]

=== 10.2 A terminating revelation and a separated tuple <a-terminating-revelation-and-a-separated-tuple>

Let $A = \( X_A \, Y_A \)$ be the actual next block, fresh relative to $K$.
  Let $W$ be its outgoing message, with at most $e^b$ values.
  The transcript includes the incoming learner state, so the law of $W$ is a kernel of $\( K \, A \)$.
  The next construction uses its own auxiliary randomness. It does not change the learner’s rule.

For a tuple $upright(bold(s)) = \( s_1 \, dots.h \, s_ell \)$, define

$ D_(upright(bold(s))) = \[ s_2 - s_1 \, dots.h \, s_ell - s_1 \] \, wide sans(V) \( upright(bold(s)) \) =
  sqrt(det \( D_(upright(bold(s)))^(sans(T)) D_(upright(bold(s))) \)) . $

This is $q !$ times the simplex volume and is symmetric in its points.
  Gram–Schmidt expresses it as the product of successive distances to predecessor affine spans.

#thm([Lemma 10.2.])[
  (Entropy cost of obtaining a separated tuple).  #emph[There are fixed absolute constants $a gt.eq 1$,
    $delta > 0$, and $b_0 > 0$ with the following property. Put $eta = e^(- a)$, $p_0 = 1 \/ \( 4 ell \)$,
    and $u_d = log \( 1 \/ p_0 \) + 1$. There is a countable string $C_(*)$,
    generated from $\( K \, A \, S \)$ and separate randomness, and an integrable integer $N gt.eq 0$,
    such that $K \, C_(*)$ specifies a ball of radius $r_(*) = r e^(- a N)$ containing $S$.
    The string is conditionally independent of $W$ given $\( K \, A \, S \)$,
    and in fact $W$ is independent of $\( S \, C_(*) \)$ given $\( K \, A \)$. Moreover,
#[#set math.equation(numbering: n => "(150)")
 $ H \( C_(*) divides K \, A \) & lt.eq \( b_0 d + ell a + u_d \) bb(E) N + u_d \,\
H \( C_(*) divides K \) & lt.eq C_a d \( 1 + bb(E) N \) \,\
0 lt.eq P_(upright("mid")) & := b_n + n bb(E) log r_(*) - h_n \( S divides K \, A \, C_(*) \)\
 & lt.eq P - delta d a thin bb(E) N + u_d . $ <l:sep:conditional-code>]

 Conditional on $\( K \, A \, C_(*) \)$, there is a symmetric law $Q$ of $ell$ points,
   each with the conditional signal marginal, such that
#[#set math.equation(numbering: n => "(151)")
 $ sans(V) \( upright(bold(s)) \) gt.eq \( eta r_(*) \)^q \, wide
   D #h(-0.16667em) (Q mid(parallel) cal(L) \( S divides K \, A \, C_(*) \)^(⊗ ell)) lt.eq
   log 2 . $ <l:sep:passing-tuple>]

]
] <l:sep:localization>

#proof[
  We describe a decision tree conditional on $K \, A$. At a node let $nu$ be the signal law after the recorded
    prefix, supported in the current ball $B \( z_0 \, r_0 \)$.
    Enumerate once and for all a countable dense family of affine subspaces of dimensions at most $ell - 2$,
    for example those generated by rational points. If the first subspace $E$ with
  $ nu { s : "dist" \( s \, E \) < 2 eta r_0 } > p_0 $
  exists, record whether the signal belongs to this tube. On a negative answer,
    continue with the conditional law and the same ball. On a positive answer,
    cover the current ball by a fixed ordered maximal $eta r_0$-separated net,
    choose the first center within $eta r_0$ of $S$, record its index,
    and replace the ball by the radius-$eta r_0$ ball about that center. Then continue.
  The full ambient net has at most $\( 1 + 2 \/ eta \)^d$ points.
    Given the selected subspace, only $exp \( b_0 d + ell a \)$ indices can occur,
    where $b_0$ is independent of $a gt.eq 1$. To see this, an eligible center lies within $3 eta r_0$ of $E$.
    Its projection to $E$ lies in a radius-$r_0$ ball, coverable by $\( 1 + 2 \/ eta \)^v$ radius-$eta
    r_0$ balls when $v = dim E$. Over each covering ball, the eligible centers lie in an ambient radius-$4 eta
    r_0$ ball. Their disjoint radius-$eta r_0 \/ 2$ balls fit in its radius-$9 eta r_0 \/ 2$ enlargement,
    giving at most $9^d$ centers. Since $v lt.eq ell - 2$, the claimed exponential bound follows after enlarging $b_0$.
  If no selected subspace exists, every affine subspace of dimension at most $ell -
    2$ has mass at most $p_0$ in its open $eta r_0$-tube. Indeed its distance function on the bounded current ball
    can be approximated uniformly within $eta r_0$ by that of a subspace from the countable family.
    Mass greater than $p_0$ in the smaller open tube would therefore trigger the larger tube test for a member of
    the family.
  In this case, draw $ell - 1$ additional independent points from $nu$, using $S$ as the first point, and record whether
  $ sans(V) \( s_1 \, dots.h \, s_ell \) gt.eq \( eta r_0 \)^q . $
  On failure continue at the same scale with the updated signal law; on success stop.
    Before the outcome, the tuple is i.i.d. from $nu$. If the volume is smaller than $\( eta r_0 \)^q$,
    one of the $q$ successive distances is smaller than $eta r_0$.
    Conditionally on its predecessors, each such event has probability at most $p_0$.
    The pass probability is therefore at least $1 - q p_0 gt.eq 1 \/ 2$.
  Record the decision type, its outcome, and any ambient net index, but not the extra test points.
    Given $\( K \, A \)$ and the prefix, the type and selected subspace are already determined.
    The first successful subspace is a measurable choice because the family is countable and its tube
    probabilities are kernel integrals of Borel indicators. Fixed scaled nets and ordered ties give measurable
    centers. Regular conditional laws at nodes, with arbitrary defaults at null nodes,
    complete a recursion by probability kernels on standard Borel spaces.
    Independent auxiliary draws make $W$ independent of $\( S \, C_(*) \)$ given $\( K \, A \)$.
  First truncate the tree after $u$ decisions, and write $C_u \, N_u$ for its string and number of refinements.
    At every active node the progress outcome, meaning refinement or a successful test,
    has conditional probability $p gt.eq p_0$. Its binary entropy is at most
  $ p { log \( 1 \/ p_0 \) + 1 } = p u_d \, $
  because $- p log p lt.eq p log \( 1 \/ p_0 \)$ and $- \( 1 - p \) log \( 1 - p \) lt.eq p$.
    The expected number of progress outcomes is at most $bb(E) N_u + 1$.
    Summing the node entropies and the eligible index costs gives
  #[#set math.equation(numbering: n => "(152)")
   $ H \( C_u divides K \, A \) lt.eq \( b_0 d + ell a + u_d \) bb(E) N_u + u_d . $ <l:sep:truncated-code>]
  The expected number of active decisions is at most $p_0^(- 1) \( bb(E) N_u + 1 \)$.
    For an encoding that is decoded given $K$ alone, use two bits for the type and outcome at each active node and
    a fixed-length full ambient net index at a refinement. The decoder knows the truncation depth $u$;
    the recorded type and outcome determine any earlier stop.
    The ambient index recovers the next center without knowing the selected subspace.
    This prefix encoding has expected length at most $C_a d \( 1 + bb(E) N_u \)$ nats, so
  #[#set math.equation(numbering: n => "(153)")
   $ H \( C_u divides K \) lt.eq C_a d \( 1 + bb(E) N_u \) . $ <l:sep:truncated-ambient>]
  At finite depth all strings have finite entropy. The area bound and the conditional mutual-information identity give
  $ 0 lt.eq P_(upright("mid") \, u) & = P - n a bb(E) N_u + I \( S \; C_u divides K \, A \)\
 & lt.eq P - { \( n - ell \) a - b_0 d - u_d } bb(E) N_u + u_d . $
  For large $d$, $n - ell > d \/ 2$ and $u_d = O \( log d \)$.
    Choose $a$ once and for all large enough that the coefficient in braces is at least $delta d
    a$ with an absolute $delta > 0$. It follows that $sup_u bb(E) N_u < oo$,
    and then that the expected number of active decisions is bounded uniformly in $u$.
    By monotone convergence the full number of decisions is integrable, so the tree terminates almost surely.
    Denote its string and refinement count by $C_(*) \, N$.
  The same prefix encoding at termination has finite expected length, so $H \( C_(*) divides K \) < oo$.
    The truncated prefixes increase to the full string and $N_u arrow.t N$.
    Conditional information in the prefixes increases to the information in the full countable string;
    this also follows from the chain rule and $H \( C_(*) divides C_u \, K \, A \) arrow.r 0$,
    using its finite entropy. Passing to the limit in the preceding bounds proves (150)–(150).
    Thus the stopping argument did not presume entropy finiteness for an infinite procedure.
  Finally condition on a terminal prefix just before its successful test, with signal law $nu$.
    Let $E_(upright("pass"))$ be its symmetric volume event and set $Q =
    nu^(⊗ ell) \( thin dot.op divides E_(upright("pass")) \)$.
    The symmetry makes all marginals equal, and the first marginal is exactly the signal law after recording the
    pass. Call it $mu_(*)$. If $p = nu^(⊗ ell) \( E_(upright("pass")) \) gt.eq 1 \/ 2$,
    then the product-reference decomposition gives
  $ D \( Q parallel mu_(*)^(⊗ ell) \) = D \( Q parallel nu^(⊗ ell) \) - ell D \( mu_(*) parallel nu \) lt.eq
    log \( 1 \/ p \) lt.eq log 2 . $
  All terms are finite because $d Q \/ d nu^(⊗ ell) = upright(bold(1))_(E_(upright("pass"))) \/ p$.
    The volume bound holds throughout the conditioned law. This proves (151). ◻
]

=== 10.3 An exact comparison on the equal-label constraints <an-exact-comparison-on-the-equal-label-constraints>

Use the coupling of Lemma 38 conditional on $\( K \, A \, C_(*) \)$,
  and draw a common $W$ from the learner’s kernel given $\( K \, A \)$.
  Every $\( S_i \, K \, A \, C_(*) \, W \)$ has the true signal marginal. Write

$ h_f = h_(d - 1) \( S divides K \, C_(*) \) \, wide h_(upright("mid")) = h_n \( S divides K \, A \, C_(*) \) \, $

and let $D_(upright("coup")) lt.eq log 2$ be the averaged divergence in (151).
  We call divergence of a tuple law from the product of its marginals total correlation,
  following Watanabe #cite(label("Watanabe1960")); the probability-law formulation and product decompositions are
  given by #cite(label("Austin2020")) Section 5, Equation (26) and Proposition 5.1.

Conditional on $\( K \, C_(*) \)$, form a reference law by drawing $ell$ independent points from
  $cal(L) \( S divides K \, C_(*) \)$, then drawing each row of $X$ as a standard Gaussian in
  $\( "col" D_(upright(bold(s))) \)^perp$. Let $cal(E)$ be the averaged relative entropy of the actual coupled
  tuple and matrix $X_A$ from this reference.

#thm([Lemma 10.3.])[
  (The tuple comparison).  #emph[The divergence $cal(E)$ is finite and
#[#set math.equation(numbering: n => "(154)")
 $ cal(E) & = I \( X_A \; C_(*) divides S \, K \) + q { h_f - h_(upright("mid")) + bb(E) log j_(X_A) \( S \) }\
 & quad - frac(k q, 2) log \( 2 pi \) - k bb(E) log sans(V) \( upright(bold(S)) \) +
   D_(upright("coup")) . $ <l:sep:comparison-identity>]

 Furthermore,
#[#set math.equation(numbering: n => "(155)")
 $ ell I \( S \; W divides K \, C_(*) \) lt.eq b + cal(E) . $ <l:sep:message-sharing>]

]
] <l:sep:comparison>

#proof[
  We first identify a common measure for the two singular laws.
    Let $cal(R)$ be the open region in the ambient tuple–matrix space where $D_(upright(bold(s)))$ has rank $q$,
    $X$ has rank $k$, and $j_X \( s_i \) > 0$ for every $i$. On the incidence constraint $X D_(upright(bold(s))) =
    0$, let $gamma_(upright(bold(s)))$ be the Gaussian matrix law conditioned on that constraint.
    The ambient Gaussian density of $X D_(upright(bold(s)))$ at zero is
  $ phi.alt_(upright(bold(s))) = \( 2 pi \)^(- k q \/ 2) sans(V) \( upright(bold(s)) \)^(- k) . $
  Indeed each row has covariance $D_(upright(bold(s)))^(sans(T)) D_(upright(bold(s)))$.
    Write $p_X$ for ambient Gaussian matrix density. On the regular incidence set the locally finite measure
  #[#set math.equation(numbering: n => "(156)")
   $ sigma^(⊗ ell) \( d upright(bold(s)) \) thin phi.alt_(upright(bold(s))) thin
     gamma_(upright(bold(s))) \( d X \) $ <l:sep:common-tuple-first>]
  also has the integration description
  #[#set math.equation(numbering: n => "(157)")
   $ p_X \( X \) thin d X thin sigma \( d s_1 \) product_(i = 2)^ell
     frac(sigma_(X \, X s_1) \( d s_i \), j_X \( s_i \)) . $ <l:sep:common-matrix-first>]
  To verify this equality, take a continuous test $G \( upright(bold(s)) \, X \)$ compactly supported in $cal(R)$.
    In its integral under $sigma^(⊗ ell) \( d upright(bold(s)) \) p_X \( X \) d X$,
    insert the normalized indicator of a radius-$epsilon$ ball in $bb(R)^(k q)$,
    evaluated at $X D_(upright(bold(s)))$. Fixing the tuple first,
    the conditional law given $X D_(upright(bold(s))) = Z$ is $gamma_(upright(bold(s)))$ translated by
    $Z \( D_(upright(bold(s)))^(sans(T)) D_(upright(bold(s))) \)^(- 1) D_(upright(bold(s)))^(sans(T))$.
    This translation and the Gaussian image density vary continuously at $Z = 0$.
    On the tuple projection of the compact support, the smallest singular value of $D_(upright(bold(s)))$ is
    bounded away from zero, so the image densities are uniformly bounded. Dominated convergence gives (156).
  In the other order, fix $X \, s_1$ and apply the area identity (144) separately to $s_2 \, dots.h \, s_ell$,
    using labels $X \( s_i - s_1 \)$. The affine fibers near the zero label are continuous translations and
    scalings of unit spheres. On the compact regular support their radii and $j_X \( s_i \)$ are bounded away from
    zero, so the fiber integrals of $G$ are continuous at zero and uniformly bounded.
    Dominated convergence in the label vector gives (157). Equality on all continuous compactly supported tests
    identifies the locally finite Borel measures on the regular set.
    Thus it also holds for nonnegative measurable integration there.
    This is a regular-region identity; no global finite mass for the unweighted incidence measure has been assumed.
  Both probability laws in the comparison give this region full mass.
    For the reference, the one-point law has a density relative to sphere area,
    so its independent tuple is affinely independent almost surely.
    Its constrained rows live in dimension $d - q > k$ and have full row rank almost surely.
    On the constraint, all points have the same row-space projection.
    That projection has norm strictly less than one: if $s_1$ were in the row space, then $chevron.l s_1 \, s_i -
    s_1 chevron.r = 0$ would give $chevron.l s_1 \, s_i chevron.r = 1$, forcing $s_i =
    s_1$ and contradicting full affine rank. For the actual law, the volume lower bound gives full affine rank,
    and the true $\( S_1 \, X_A \)$ marginal gives full row rank and positive residual radius almost surely.
    The quantities $j_X \( s_i \)$ agree on the constraint because their row-space projections agree.
  Condition now on $\( K \, C_(*) \)$. Jointly measurable density versions can be obtained by taking Radon–Nikodym
    derivatives of the joint laws with their conditioning variables and then disintegrating;
    absolute continuity follows from the finite-entropy conditioning above and from the coupling bound.
    Let $p_c$ be the full-sphere marginal density, $p_(1 \, X)$ the density of the true $\( S_1 \, X_A \)$ law
    relative to $sigma ⊗ d X$, and $p_(upright("sl")) \( thin dot.op divides A \)$ the conditional slice density.
    Let $t \( upright(bold(s)) divides A \)$ be the coupling density relative to the product of these slice
    marginals. The reference density relative to (156) is
  $ frac(product_(i = 1)^ell p_c \( s_i \), phi.alt_(upright(bold(s)))) . $
  The actual density relative to the same measure, using (157), is
  $ frac(p_(1 \, X) \( s_1 \, X \), p_X \( X \)) product_(i = 2)^ell { p_(upright("sl")) \( s_i divides A \)
    j_X \( s_i \) } thin t \( upright(bold(s)) divides A \) . $
  Here $A = \( X \, X s_1 \)$ is determined by $X \, s_1$. Each $p_c \( S_i \)$ is finite and positive almost
    surely under the actual law, since each coordinate has that marginal after averaging $A$.
    These densities therefore establish absolute continuity of the actual law with respect to the reference,
    rather than transferring arbitrary null sets between the singular laws.
  The first-coordinate contribution to the expected log ratio is
  $ bb(E) log frac(p_(1 \, X) \( S_1 \, X_A \), p_X \( X_A \) p_c \( S_1 \)) & =
    I \( S \; X_A divides K \, C_(*) \) + I \( X_A \; C_(*) divides K \)\
 & = I \( X_A \; C_(*) divides S \, K \) . $
  The last equality uses independence of $X_A$ from $\( S \, K \)$ at block entry.
    Each of the other $q$ coordinates contributes $h_f - h_(upright("mid")) + bb(E) log j_(X_A) \( S \)$.
    The term $log phi.alt_(upright(bold(S)))$ contributes $- frac(k q, 2) log \( 2 pi \) - k bb(E) log sans(V)$,
    and $log t$ contributes $D_(upright("coup"))$. These are finite log integrals.
    The signal and slice log densities are integrable because $H \( K \, C_(*) \) < oo$;
    the first-coordinate divergence is at most $H \( C_(*) divides K \)$;
    the Jacobian has its original true marginal; and
  $ q \( log eta + log r_(*) \) lt.eq log sans(V) \( upright(bold(S)) \) lt.eq q log 2 $
  with $bb(E) \[ - log r_(*) \] < oo$. The coupling log likelihood is integrable by its finite divergence and the
    usual $1 \/ e$ negative-part bound. Taking the log ratio now proves (154).
  Discard $X_A$ by data processing. The divergence of the tuple from the product of its
    $\( K \, C_(*) \)$-conditional marginals is at most $cal(E)$.
    Adding $W$ and using an independent $\( K \, C_(*) \)$-conditional copy of $W$ in that reference adds at most
    $H \( W divides K \, C_(*) \) lt.eq b$. Decomposing the same finite divergence after conditioning on $W$ gives
  $ ell I \( S \; W divides K \, C_(*) \) + bb(E) D #h(-0.16667em)
    (cal(L) \( upright(bold(S)) divides K \, C_(*) \, W \) mid(parallel) cal(L) \( S divides K \, C_(*) \, W \)^(⊗
    ell)) . $
  The equality of every signal–message marginal, established before the lemma,
    is what makes the first term $ell$ times the same information. The second term is nonnegative. This proves (155). ◻
]

=== 10.4 Cancellation and iteration <cancellation-and-iteration>

Set $K_(+) = \( K \, C_(*) \, W \)$, and let $B$ now be fresh relative to $K_(+)$. Write

$ h_(+) = h_n \( S divides K_(+) \, B \) \, wide Lambda_(+) = Lambda + a bb(E) N . $

The entropy identity (145) gives

$ h_(+) & = h_f - I \( S \; W divides K \, C_(*) \) - h \( Y_B divides X_B \, K_(+) \) + bb(E) log j_(X_B) \( S \) \,\
h_(upright("mid")) - h_f - bb(E) log j_(X_A) \( S \) & = - h \( Y_A divides X_A \, K \, C_(*) \) -
  I \( S \; X_A divides K \, C_(*) \) . $

The expected Jacobians agree because, before conditioning,
  each matrix has the standard Gaussian law independent of the uniform signal.
  Subtract the first identity from $h_(upright("mid"))$, then use (154) and (155).
  The coefficient of the mid-versus-full entropy difference is $1 - q \/ ell = 1 \/ ell$.
  The chain rule and entry independence give

$ I \( X_A \; C_(*) divides S \, K \) - I \( S \; X_A divides K \, C_(*) \) = I \( X_A \; C_(*) divides K \) . $

The resulting inequality is

#[#set math.equation(numbering: n => "(158)")
 $ h_(upright("mid")) - h_(+) & lt.eq h \( Y_B divides X_B \, K_(+) \) -
   frac(h \( Y_A divides X_A \, K \, C_(*) \), ell) - frac(k q, 2 ell) log \( 2 pi \)\
 & quad - k / ell bb(E) log sans(V) \( upright(bold(S)) \) +
   frac(I \( X_A \; C_(*) divides K \) + b + D_(upright("coup")), ell) . $ <l:sep:entropy-comparison>]

In particular, the selection of the actual rows has left the explicit cost $I \( X_A \; C_(*) divides K \)$;
  those rows have not been treated as fresh after selection.

Let $z_(*)$ be the decoded final center. Compare the fresh label law to $N \( X_B z_(*) \, r_(*)^2 I_k \)$.
  Since $X_B$ is independent of $\( S \, K_(+) \)$ and $parallel S - z_(*) parallel lt.eq r_(*)$,

$ h \( Y_B divides X_B \, K_(+) \) lt.eq k bb(E) log r_(*) + k / 2 log \( 2 pi e \) . $

Together with $log sans(V) gt.eq q \( log eta + log r_(*) \)$, the scale-dependent terms in (158) are at most

$ k bb(E) log r_(*) - frac(k q, ell) bb(E) log r_(*) + O_a \( k \) = k / ell bb(E) log r_(*) + O_a \( k \) lt.eq
  O_a \( k \) . $

The residual coefficient is positive and $log r_(*) lt.eq 0$. For the actual labels,

$ - h \( Y_A divides X_A \, K \, C_(*) \) lt.eq - h \( Y_A divides X_A \, K \) + H \( C_(*) divides K \) \, wide
  I \( X_A \; C_(*) divides K \) lt.eq H \( C_(*) divides K \) . $

Apply Lemma 37 and (150). Since $ell gt.eq d \/ 32$ for large $d$, when $b lt.eq d^2$ we obtain

#[#set math.equation(numbering: n => "(159)")
 $ h_(upright("mid")) - h_(+) lt.eq C_a d + C' / d \( P + d Lambda \) + C_a bb(E) N . $ <l:sep:one-block>]

#thm([Proposition 10.4.])[
  (The controlled-horizon recurrence).  #emph[Suppose the outgoing message has at most $e^b$ values, with $b lt.eq
    d^2$. For the localization update above, there are absolute $gamma \, C_1 \, C_2 > 0$ such that
#[#set math.equation(numbering: n => "(160)")
 $ P_(+) + gamma d Lambda_(+) lt.eq \( 1 + C_1 \/ d \) \( P + gamma d Lambda \) + C_2 d . $ <l:sep:recurrence-formula>]

 Starting with radius one and signal-independent initial information, after $m lt.eq
   d$ blocks whose messages have at most $e^(d^2)$ values,
#[#set math.equation(numbering: n => "(161)")
 $ P_m + gamma d Lambda_m lt.eq C d \( m + 1 \) \, wide I \( S \; K_m \) lt.eq C d \( m + 1 \) . $ <l:sep:horizon>]

]
] <l:sep:recurrence>

#proof[
  By definition, $P_(+) = P_(upright("mid")) + h_(upright("mid")) - h_(+)$.
    Combine (150) and (159), and take $gamma = delta \/ 2$. For sufficiently large $d$, the coefficient $-
    delta d a + C_a + gamma d a$ of $bb(E) N$ is nonpositive.
    The term $u_d = O \( log d \)$ is absorbed in $C_2 d$. Since $P \, Lambda gt.eq 0$,
    the remaining $C' \( P + d Lambda \) \/ d$ is bounded by $\( C_1 \/ d \) \( P + gamma d Lambda \)$.
    This proves (160).
  Every new transcript is countable with finite entropy, specifies the new containing ball,
    and has $Lambda_(+) < oo$. Fresh future matrices can therefore be generated and the construction repeated.
    Starting from $P_0 = O \( d \)$ and $Lambda_0 = 0$, iteration through $m lt.eq
    d$ steps has multiplier $\( 1 + C_1 \/ d \)^m lt.eq e^(C_1)$, which proves the potential bound in (161).
    Lemma 37 then gives the information bound. No linear-growth claim for unrestricted numbers of blocks is made. ◻
]

=== 10.5 The full accuracy range <the-full-accuracy-range>

#thm([Theorem 10.5.])[
  (The sample bound by separated-tuple localization).  #emph[Let $M \( d \) =
    o \( d^2 \)$ be integer-valued and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    Every learner of Section 2 with uniform-sphere angular success probability at least $2 \/ 3$ must satisfy
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for all sufficiently large $d$, with an absolute $c > 0$.
   The eventual dimension threshold may depend on the memory sequence.
   Success at least $2 \/ 3$ for every fixed signal implies the same conclusion by averaging.]
] <l:sep:theorem>

#proof[
  Set $L = log \( 1 \/ epsilon.alt \)$. For almost every realization of shared rule randomness,
    Lemmas 1 and 2 give Borel rules with the same uniform-prior experiment.
    All bounds below are numerical bounds on that conditional success probability,
    with constants independent of the realization, so they may be averaged.
    No jointly selected family of Borel versions is needed. The joint independence of the shared randomness and
    initial state from the signal and rows ensures the required signal-independent initial transcript for almost
    every value of the shared randomness.
  We first explain why the restriction $m lt.eq d$ suffices.
    An angular cap of radius $epsilon.alt$ has uniform mass at most $\( 2 epsilon.alt \)^(d - 1)$.
    For example, its polar-area numerator is at most $epsilon.alt^(d - 1) \/ \( d - 1 \)$,
    while its denominator is at least $\( pi \/ 3 \) \( sqrt(3) \/ 2 \)^(d - 2)$;
    the displayed bound follows for large $d$. There are at most $\( T + 1 \) 2^M$ terminal time–state pairs.
    For each pair, integration over its fixed fresh output law contributes at most one cap mass,
    even before multiplying by its reach probability. Summing and averaging over shared randomness gives
  #[#set math.equation(numbering: n => "(162)")
   $ \( d - 1 \) L lt.eq M log 2 + log \( T + 1 \) + \( d - 1 \) log 2 + log \( 3 \/ 2 \) . $ <l:sep:output-count>]
  At indices with $T < d L$, $log \( T + 1 \) lt.eq log \( d + 1 \) + L$.
    Since $M = o \( d^2 \)$, (162) implies $L = o \( d \)$ along those indices. Also
  $ b = log \( \( T + 2 \) 2^M \) lt.eq d^2 $
  eventually, and after padding to a multiple of $k$,
  $ m = ceil.l T \/ k ceil.r lt.eq 32 L + 1 = o \( d \) lt.eq d $
  eventually. Thus every potentially short run lies within the proved horizon.
  At indices with $T gt.eq d L$, the claimed conclusion holds with constant one.
    At all remaining indices, the horizon and width bounds just established apply eventually.
    Pad an early-stopping program by retaining its terminal state and stopping index,
    then ignore later observations and any suffix added to complete the last block.
    At boundaries its state is a message with at most $e^b$ values.
    The augmented transcript retains all earlier auxiliary strings, but the learner uses only its state.
    Future matrices remain fresh, so Proposition 40 applies with $m = ceil.l T \/ k ceil.r lt.eq d$.
    For each shared seed, $I \( S \; K_m \) lt.eq C_0 d \( m + 1 \)$, with an absolute $C_0$.
  Let $pi$ be the success probability for that seed. The output uses information contained in $K_m$ and fresh
    randomness. Under the product of its marginal and the uniform signal law,
    success has probability at most $\( 2 epsilon.alt \)^(d - 1)$. By data processing and (1),
  $ I \( S \; K_m \) gt.eq pi \( d - 1 \) log frac(1, 2 epsilon.alt) - log 2 . $
  Combining the two bounds gives a numerical inequality in $pi$;
    averaging it over the shared seed replaces $pi$ by the original success probability, at least $2 \/ 3$.
    Thus, for absolute $L_0 \, c_0 > 0$, whenever $L gt.eq L_0$,
  $ c_0 d L lt.eq C_0 d \( m + 1 \) lt.eq C_0 d \( T \/ k + 2 \) \, $
  so $T gt.eq k \( c_0 L \/ C_0 - 2 \)$. Choose $L_1 = max { L_0 \, 4 C_0 \/ c_0 }$. Since $k gt.eq d \/ 32$, this gives
  $ T gt.eq frac(c_0, 64 C_0) thin d L wide \( L gt.eq L_1 \) . $
  For $L < L_1$, the local full-data endpoint in Lemma 3 gives $T > d \/ 4$, hence $T gt.eq d L \/ \( 4 L_1 \)$.
    The minimum of these absolute constants and one works for every allowed accuracy sequence,
    including nonmonotone ones. ◻
]

#prodef([Remark 10.6.])[
  (Vanishing success with sublinear samples).  The full-data calculation also gives a stronger small-sample
    conclusion. For $0 lt.eq T lt.eq d - 3$, reveal all $T$ rows and labels.
    As in Lemma 3, the conditional signal is uniform on a residual sphere of radius $R$,
    with $Pr { R < 1 \/ 2 } lt.eq 4 T \/ \( 3 d \)$. On $R gt.eq 1 \/ 2$,
    a radius-$epsilon.alt$ error ball meeting that sphere is contained in a chordal cap of radius $2
    epsilon.alt$ about a point of the intersection. For $epsilon.alt lt.eq 1 \/ 10$,
    its polar angle is at most $theta_0 = 2 arcsin \( 1 \/ 5 \)$.
    Since $sin theta_0 < 2 \/ 5$, polar integration bounds its conditional mass by
  $
    frac(integral_0^(theta_0) sin^(d - T - 2) theta thin d theta, integral_0^pi sin^(d - T - 2) theta thin d
    theta) lt.eq C (frac(4, 5 sqrt(3)))^(d - T - 2) . $
  Consequently every estimate based on these data and independent randomness has success probability at most
  $ frac(4 T, 3 d) + C (frac(4, 5 sqrt(3)))^(d - T - 2) . $
  This tends to zero when $T = o \( d \)$, uniformly for $0 < epsilon.alt lt.eq 1 \/ 10$,
    and therefore also applies to early-stopping finite-state learners.
]

== 11 Localization near a predecessor span <l:span:section>

Several signals drawn from the posterior of one exact block satisfy the same linear equations.
  Their affine volume records how close each new signal is to the span of its predecessors.
  We use this volume in two steps. First, a relative-entropy calculation divides the information cost of the
  block’s finite message by the number of posterior draws. A draw close to the span of its predecessors incurs an
  additional cost. Second, a short discrete description locates that draw in a smaller ball,
  and the decrease in radius pays for the additional cost.

Throughout this section, $mu$ is uniform probability on $S^(d - 1)$, and all logarithms are natural.
  The signal and all auxiliary variables live in standard Borel spaces.
  If the conditional signal law given $A$ is $f_A mu$, write

$ cal(D) \( A \) = bb(E) D \( f_A mu parallel mu \) . $

The variable $A$ is part of the analysis and may contain continuous information.
  The learner retains only the finite state specified in Section 2.

=== 11.1 The exact equal-label input and an additional moment <the-exact-equal-label-input-and-an-additional-moment>

For an integer $1 lt.eq r lt.eq d - 2$, let $gamma_r$ be the law of an $r$-by-$d$ standard Gaussian matrix.
  If $X$ has full row rank, write $rho_(0 \, r) \( X \, y \)$ for the density of $X s$, $s tilde.op mu$,
  and $mu_(X \, y)$ for its conditional law. Put

$ X^dagger = X^(sans(T)) \( X X^(sans(T)) \)^(- 1) . $

On the open ellipsoid $parallel X^dagger y parallel < 1$,
  the conditional law is uniform on the sphere centered at $X^dagger y$,
  of radius $sqrt(1 - parallel X^dagger y parallel^2)$, in the affine space parallel to $ker X$. Its label density is

#[#set math.equation(numbering: n => "(163)")
 $ rho_(0 \, r) \( X \, y \) =
   cases(delim: "{", frac(Gamma \( d \/ 2 \), pi^(r \/ 2) Gamma \( \( d - r \) \/ 2 \)) frac(\( 1 - parallel
   X^dagger y parallel^2 \)^(\( d - r - 2 \) \/ 2), sqrt(det \( X X^(sans(T)) \))) \, & parallel X^dagger y
   parallel < 1 \,, 0 \, & upright("otherwise") .) $ <l:span:base-density>]

One way to verify the exponent is to parameterize the unit sphere in orthogonal row and null coordinates by
  $\( u \, sqrt(1 - parallel u parallel^2) thin theta \)$. Scaling the null-space sphere contributes
  $\( 1 - parallel u parallel^2 \)^(\( d - r - 1 \) \/ 2)$,
  and the Gram determinant of the $u$-derivatives contributes $\( 1 - parallel u parallel^2 \)^(- 1 \/ 2)$.
  The two tangent groups are orthogonal. Normalizing this density and changing row coordinates to $y$ gives (163).
  A jointly measurable fiber kernel can be obtained by projecting an extra Gaussian onto $ker
  X$ and normalizing it; fixed values are assigned on unused fibers.
  On rank-deficient matrices set the density to zero and use a fixed fiber probability.

For $p gt.eq 2$ and $upright(bold(s)) = \( s_1 \, dots.h \, s_p \)$, set

$ B_(upright(bold(s))) = \[ s_2 - s_1 \, dots.h \, s_p - s_1 \] \, wide F_(upright(bold(s))) =
  "col" \( B_(upright(bold(s))) \) \, wide J \( upright(bold(s)) \) =
  sqrt(det \( B_(upright(bold(s)))^(sans(T)) B_(upright(bold(s))) \)) . $

When $B_(upright(bold(s)))$ has full column rank, let $gamma_(r \, B_(upright(bold(s))))$ denote the probability
  law of a matrix whose rows are independent standard Gaussians in $F_(upright(bold(s)))^perp$.

The geometric input is the finite-measure theorem for equal labels in #cite(label("OpenAIReplica2026"))
  Theorem 3.3. We use its density-one spherical instance, stated here in our notation.

#thm([Proposition 11.1.])[
  (Finite measure for equal labels).  #emph[Let $r gt.eq 1$, $p gt.eq 2$, and $r + p - 1 lt.eq d - 2$.
    For every nonnegative Borel $H$,
#[#set math.equation(numbering: n => "(164)")
 $ & integral gamma_r \( d X \) integral_(bb(R)^r) rho_(0 \, r) \( X \, y \)^p integral
   H \( X \, y \, upright(bold(s)) \) thin mu_(X \, y)^(⊗ p) \( d upright(bold(s)) \) thin d y\
 & quad = \( 2 pi \)^(- r \( p - 1 \) \/ 2) integral J \( upright(bold(s)) \)^(- r) thin
   mu^(⊗ p) \( d upright(bold(s)) \) integral H \( X \, X s_1 \, upright(bold(s)) \) thin
   gamma_(r \, B_(upright(bold(s)))) \( d X \) . $ <l:span:equal-label-input>]

 These are finite measures before inserting $H$. They are supported on $X s_1 = dots.h.c = X s_p = y$,
   full ranks of $X$ and $B_(upright(bold(s)))$, and positive-radius spherical fibers.
   The input uses the exact density and fiber versions above;
   its ball-average and Gaussian approximation versions agree at the constrained label outside a null set for the
   finite measure. The more general theorem permits bounded nonnegative densities over spherical or Gaussian base
   probability. Only the density-one spherical instance is used below.]
] <l:span:equal-label-assumption>

#proof[
  Apply #cite(label("OpenAIReplica2026")) Theorem 3.3 with row count $r$, difference count $p - 1$,
    tuple size $p$, and base and reweighted measure both equal to $mu$.
    Its dimension condition is exactly $r + p - 1 lt.eq d - 2$,
    and its determinant and constrained Gaussian law are $J$ and $gamma_(r \, B_(upright(bold(s))))$ above. ◻
]

We shall need one more inverse power than appears in the $r = k$ identity.
  The strict margin in the next lemma makes that use explicit.

#thm([Lemma 11.2.])[
  (The additional inverse-volume moment).  #emph[Let $k gt.eq 1$, $p gt.eq 2$, and $k + p + 1 < d$. Then
$ integral J^(- \( k + 1 \)) thin d mu^(⊗ p) < oo . $

]
] <l:span:extra-moment>

#proof[
  A new sphere point avoids the proper affine span of its predecessors almost surely,
    so $J > 0$ for $mu^(⊗ p)$-almost every tuple. Apply (164) separately with $r = k + 1$. Its dimension condition is
  $ r + \( p - 1 \) = k + p lt.eq d - 2 \, $
  which follows from the integer inequality $k + p + 1 < d$.
    We check directly that the total mass on the label side is finite.
    The exponent in (163) is $\( d - k - 3 \) \/ 2 gt.eq 0$, and hence
  $ integral rho_(0 \, k + 1) \( X \, y \)^p thin d y lt.eq
    c_(d \, k + 1)^(thin p - 1) det \( X X^(sans(T)) \)^(- \( p - 1 \) \/ 2) . $
  Here $c_(d \, k + 1)$ is the positive normalizing constant in (163).
    Gram–Schmidt on the Gaussian rows expresses $sqrt(det \( X X^(sans(T)) \))$ as the product of their successive
    perpendicular lengths. Conditional on the preceding rows, these lengths have chi laws in dimensions $d \, d -
    1 \, dots.h \, d - k$. A chi variable in dimension $v$ has a finite inverse moment of order $p -
    1$ whenever $v > p - 1$, as is seen by integrating its density $c_v t^(v - 1)
    e^(- t^2 \/ 2)$ at zero and infinity. The smallest dimension here is $d - k > p - 1$,
    so iterated conditioning makes the displayed determinant bound integrable.
  Set $H = 1$ in the $r = k + 1$ instance. Its right side is the positive constant
    $\( 2 pi \)^(- \( k + 1 \) \( p - 1 \) \/ 2)$ times $integral J^(- \( k + 1 \)) d mu^(⊗ p)$,
    because the constrained matrix law is a probability. The finite label-side mass proves the claim.
    This argument is separate from the later logarithmic estimates. ◻
]

=== 11.2 An unbounded finite-entropy prior <an-unbounded-finite-entropy-prior>

Suppose $A$ contains the state at the beginning of a block.
  Assume that the conditional signal law $f_A mu$ is supported in an $A$-measurable closed ball
  $B \( c_A \, r_A \)$, where $0 < r_A lt.eq 1$, and

#[#set math.equation(numbering: n => "(165)")
 $ cal(D) \( A \) < oo \, wide bb(E) \| log r_A \| < oo . $ <l:span:incoming>]

There is no boundedness assumption on $f_A$. To obtain a jointly measurable version,
  take the Radon–Nikodym derivative of the joint law of $\( A \, S \)$ with respect to $cal(L) \( A \) ⊗ mu$;
  the required absolute continuity follows by integrating the assumed conditional absolute continuity over $A$.
  Disintegration shows that this derivative is $f_A$ for almost every $A$.
  Replacing the derivative by zero on its infinite-value set gives a finite-valued Borel version without changing
  those conditional laws. All conditional formulas below are asserted only for this full-measure set of values of
  $A$; arbitrary values may be used elsewhere.

Fix $1 lt.eq k$ with $k + p + 1 < d$. Draw $X tilde.op gamma_k$ independently of $\( A \, S \)$, put $Y = X S$,
  and draw the block destination $w$ by the learner’s kernel of the incoming state and $\( X \, Y \)$.
  Assume that $w$ has at most $W$ values. Given $\( A \, X \, Y \, w \)$, draw $s_1 \, dots.h \,
  s_p$ independently from the conditional law of $S$ given $\( A \, X \, Y \)$.
  The destination provides no further information once these data are known.
  Thus every $\( s_i \, A \, X \, Y \, w \)$ has the original $\( S \, A \, X \, Y \, w \)$ law.

We will replace $S$ by a signal having the same joint law with $\( A \, w \)$,
  and enlarge $\( A \, w \)$ to an analysis variable $A'$ that determines a supporting ball $B \( c' \, r' \)$,
  with $0 < r' lt.eq r_A$. For any fixed coefficient $a gt.eq k + p$, our one-block objective is

$ cal(D) \( A' \) + a bb(E) log r' lt.eq cal(D) \( A \) + a bb(E) log r_A + frac(log W, p) + k / 2 + C p +
  2 a log 2 \, $

where $C$ is absolute. We obtain this bound by retaining a uniformly selected posterior draw and its predecessors,
  then discretely locating that draw near their affine span.
  First we derive the exact likelihood of the tuple and prove its logarithms integrable,
  so that the entropy chain rule can be applied.

For fixed $A$ and full-row-rank $X$, define

$ rho_A \( X \, y \) =
  cases(delim: "{", rho_(0 \, k) \( X \, y \) integral f_A \( s \) thin mu_(X \, y) \( d s \) \, & rho_(0 \, k) \(
  X \, y \) > 0 med upright("and ") integral f_A thin d mu_(X \, y) < oo \,, 0 \, & upright("otherwise") .) $

Set $rho_A = 0$ on rank failures. Kernel integration gives a jointly measurable function of $\( A \, X \, y \)$.
  Disintegration shows that it is a conditional label density;
  the zero assignment on infinite fiber means changes it only on a Lebesgue-null set for almost every
  $\( A \, X \)$. The piecewise definition also avoids a product $0 dot.op oo$ on unused fibers.
  The actual label has $0 < rho_A \( X \, Y \) < oo$ almost surely, and on that set its posterior is

$ frac(rho_(0 \, k) \( X \, Y \), rho_A \( X \, Y \)) f_A thin mu_(X \, Y) . $

This definition fixes the version used below.

Let $pi_A$ be the law of $\( upright(bold(s)) \, X \)$ in this experiment, with $w$ discarded.
  Define the probability measure

$ lambda \( d upright(bold(s)) \, d X \) = mu^(⊗ p) \( d upright(bold(s)) \) thin
  gamma_(k \, B_(upright(bold(s)))) \( d X \) \, $

with an arbitrary definition on the $mu^(⊗ p)$-null set where $J = 0$.

#thm([Lemma 11.3.])[
  (Replica likelihood with finite logarithms).  #emph[Under (165),
#[#set math.equation(numbering: n => "(166)")
 $ frac(d pi_A, d lambda) \( upright(bold(s)) \, X \) = \( 2 pi \)^(- k \( p - 1 \) \/ 2)
   J \( upright(bold(s)) \)^(- k) frac(product_(i = 1)^p f_A \( s_i \), rho_A \( X \, X s_1 \)^(p - 1)) .
   $ <l:span:likelihood-formula>]

 The multiplier is defined as zero unless $J > 0$ and its denominator is finite and positive.
   Under the replica experiment, each $log f_A \( s_i \)$, $log rho_A \( X \, Y \)$,
   and $log J$ is absolutely integrable after averaging over $A$.]
] <l:span:likelihood>

#proof[
  For each such value of $A$, on the label side of (164) with $r = k$,
    insert the everywhere-defined nonnegative Borel multiplier
  $
    cases(delim: "{", frac(product_i f_A \( s_i \), rho_A \( X \, y \)^(p - 1)) \, & 0 < rho_A \( X \, y \) <
    oo \,, 0 \, & upright("otherwise") .) $
  The identity applies first to bounded truncations and then to this multiplier by monotone convergence.
    The label-side measure becomes the actual label law $rho_A \( X \, y \) thin d
    y$ followed by $p$ normalized posterior draws. The other side is the right side of (166) relative to $lambda$.
    This proves the likelihood formula. In particular, no bounded posterior theorem has been applied to $f_A$;
    the only geometric input was the identity for $mu$. Values on invalid label fibers are handled by the
    multiplier itself, so no unproved transfer of a Lebesgue-null set to the singular reference is being used.
  We justify logarithmic integrability before taking any entropy difference. Since $s_i divides A$ has density $f_A$,
  $ integral f_A \( log f_A \)_(-) thin d mu lt.eq 1 \/ e . $
  Together with $cal(D) \( A \) < oo$, this gives averaged absolute integrability of $log f_A \( s_i \)$.
    Let $g$ be standard Gaussian density on $bb(R)^k$. For almost every $\( A \, X \)$,
  $ integral rho_A \( X \, y \) (log frac(g \( y \), rho_A \( X \, y \)))_(+) d y lt.eq 1 /
    e integral g \( y \) thin d y = 1 / e . $
  Moreover $bb(E) parallel Y parallel^2 = k$, because $X$ is fresh and $parallel S parallel = 1$.
    Since $- log g \( Y \) = k / 2 log \( 2 pi \) + 1 / 2 parallel Y parallel^2$,
    the negative part of $log rho_A \( X \, Y \)$ is integrable.
  Put $c = \( 2 pi \)^(- k \( p - 1 \) \/ 2)$ and
  $ Z = c integral J^(- k) thin d mu^(⊗ p) . $
  The $r = k$ input shows $0 < Z < oo$. Let $Q$ be the probability with density $c J^(- k) \/
    Z$ relative to $lambda$. The likelihood formula gives $pi_A lt.double lambda$.
    Since $0 < J < oo$ $lambda$-almost surely, the density of $Q$ is finite and strictly positive there;
    thus $Q$ and $lambda$ have the same null sets, and $pi_A lt.double Q$. We may therefore write
  #[#set math.equation(numbering: n => "(167)")
   $ log frac(d pi_A, d Q) = log Z + sum_(i = 1)^p log f_A \( s_i \) - \( p - 1 \) log rho_A \( X \, Y \) .
     $ <l:span:tilted-log>]
  Its positive part satisfies
  $ (log frac(d pi_A, d Q))_(+) lt.eq \| log Z \| +
    sum_i \( log f_A \( s_i \) \)_(+) + \( p - 1 \) \( log rho_A \( X \, Y \) \)_(-) \, $
  so it is integrable by the two bounds just proved, without using $log J$.
    Its negative part has integral at most $1 \/ e$: if $v = d pi_A \/ d Q$,
    then $integral v \( log v \)_(-) thin d Q lt.eq 1 \/ e$. Hence $bb(E) D \( pi_A parallel Q \) < oo$,
    and the log likelihood in (167) is absolutely integrable on average.
    Rearranging that identity now proves full integrability of $log rho_A \( X \, Y \)$. This step has not used $log J$.
  By Lemma 44,
  $ integral e^(\( log J \)_(-)) thin d Q lt.eq c /
    Z (integral J^(- k) thin d mu^(⊗ p) + integral J^(- \( k + 1 \)) thin d mu^(⊗ p)) < oo . $
  For probabilities $P \, Q$ and nonnegative $F$, exponential tilting gives
  $ bb(E)_P F lt.eq D \( P parallel Q \) + log bb(E)_Q e^F $
  first for bounded $F$, and then for nonnegative $F$ by truncation.
    This is the bounded variational inequality of #cite(label("DupuisMao2022")) Equations (1.1)–(1.2),
    with the limiting step given here. Apply it to $F = \( log J \)_(-)$ conditionally on $A$ and average.
    Its right side is finite. The positive part of $log J$ is at most $\( p - 1 \) log
    2$ by Hadamard’s inequality, since every chord has length at most two. This completes the integrability proof. ◻
]

=== 11.3 Information in one selected draw <information-in-one-selected-draw>

For $i gt.eq 2$, let

$ delta_i = "dist" #h(-0.16667em) (s_i \, "aff" \( s_1 \, dots.h \, s_(i - 1) \)) \, wide Delta_i = max { 0 \,
  log \( r_A \/ delta_i \) } \, wide Delta_1 = 0 . $

Gram–Schmidt gives $J = product_(i = 2)^p delta_i$. The likelihood formula implies absolute continuity of the
  tuple marginal with respect to $mu^(⊗ p)$, so every $delta_i > 0$ almost surely.
  Also $delta_i lt.eq 2$ and $Delta_i lt.eq \( - log delta_i \)_(+)$. Thus

$ \( - log delta_i \)_(+) lt.eq \( - log J \)_(+) + \( p - 2 \) log 2 \, $

and Lemma 45 implies $bb(E) Delta_i < oo$.

Choose an independent uniform $I in { 1 \, dots.h \, p }$, use $s_I$ as the signal for the next block, and set

$ A_(*) = \( A \, w \, I \, s_1 \, dots.h \, s_(I - 1) \) . $

The triple $\( s_I \, A \, w \)$ has the original $\( S \, A \, w \)$ law,
  since each draw has that marginal and $I$ is independent.
  Uniform selection turns the entropy-chain average into information about the selected draw;
  the following bound is not asserted for every fixed draw.

#thm([Lemma 11.4.])[
  (Information of a selected draw).  #emph[The conditional signal law given $A_(*)$ is absolutely continuous with
    respect to $mu$, and
#[#set math.equation(numbering: n => "(168)")
 $ cal(D) \( A_(*) \) lt.eq cal(D) \( A \) + frac(log W, p) + k / 2 + k thin bb(E) Delta_I . $ <l:span:selected-bound>]

]
] <l:span:selected>

#proof[
  Taking logarithms in (166) is legitimate by Lemma 45. Discard $X$ by data processing, then condition on $w$.
    The latter step adds the conditional mutual information of the tuple and $w$, at most $log W$.
    The product-reference chain rule, in the finite form discussed in #cite(label("Austin2020")) Section 3.3,
    Equations (13)–(18), therefore yields
  #[#set math.equation(numbering: n => "(169)")
   $ bb(E) D \( cal(L) \( upright(bold(s)) divides A \, w \) parallel mu^(⊗ p) \) & lt.eq log W +
     p cal(D) \( A \) + \( p - 1 \) bb(E) \[ - log rho_A \( X \, Y \) \]\
 & quad - frac(k \( p - 1 \), 2) log \( 2 pi \) - k bb(E) log J . $ <l:span:tuple-kl>]
  The label entropy is bounded by its cross entropy with $N \( X c_A \, r_A^2 I_k \)$.
    Freshness and the containing ball give $bb(E) \( parallel Y - X c_A parallel^2 \/ r_A^2 divides A \) lt.eq k$,
    whence
  $ bb(E) \[ - log rho_A \( X \, Y \) \] lt.eq k / 2 log \( 2 pi \) + k bb(E) log r_A + k / 2 . $
  All terms are finite by (165) and the preceding lemma. Substitute this estimate and $log J =
    sum_(i = 2)^p log delta_i$ into (169). Since $log \( r_A \/ delta_i \) lt.eq Delta_i$, the result is
  $ bb(E) D \( cal(L) \( upright(bold(s)) divides A \, w \) parallel mu^(⊗ p) \) lt.eq log W + p cal(D) \( A \) +
    frac(k \( p - 1 \), 2) + k bb(E) sum_(i = 1)^p Delta_i . $
  This finite relative entropy also implies that, almost surely,
    each conditional coordinate law given its predecessors is absolutely continuous with respect to $mu$.
    The product-reference chain rule and the uniform choice of $I$ give the exact identity
  $ cal(D) \( A_(*) \) = 1 /
    p thin bb(E) D #h(-0.16667em) (cal(L) \( upright(bold(s)) divides A \, w \) mid(parallel) mu^(⊗ p)) . $
  Dividing the preceding bound by $p$ and using $\( p - 1 \) \/ p lt.eq 1$ gives (168). ◻
]

=== 11.4 A radius credit from the predecessor span <a-radius-credit-from-the-predecessor-span>

We next encode a smaller ball when the selected draw is close to its predecessor span.
  The code is discrete even though the predecessor coordinates, already in $A_(*)$, are continuous.

#thm([Lemma 11.5.])[
  (A discrete description of a smaller ball).  #emph[There is a discrete code $C$,
    determined by $\( A_(*) \, s_I \)$, and an $A' = \( A_(*) \, C \)$-measurable ball $B \( c' \, r' \)$
    supporting the conditional signal law, for which
#[#set math.equation(numbering: n => "(170)")
 $ 0 < r' & lt.eq r_A \, & log r' & lt.eq log r_A - Delta_I + 2 log 2 \,\
H \( C divides A_(*) \) & lt.eq p thin bb(E) Delta_I + C_1 p \, & cal(D) \( A' \) & lt.eq cal(D) \( A_(*) \) +
  H \( C divides A_(*) \) . $ <l:span:radius>]

 Here $C_1$ is absolute. Both $cal(D) \( A' \)$ and $bb(E) \| log r' \|$ are finite.]
] <l:span:localization>

#proof[
  If $I = 1$, set $j = 0$. For $I gt.eq 2$, set
  $ j = max { 0 \, floor.l log_2 \( r_A \/ delta_I \) floor.r } . $
  When $j = 0$, keep the old ball. When $j gt.eq 1$, the predecessor span has dimension $v = I - 2$ almost surely.
    Use orthonormal coordinates in that affine span based at $s_1$.
    The projection of $s_I - s_1$ has norm at most $2 r_A$, because both points lie in the old ball.
  For every integer pair $\( j \, v \)$, fix an ordered $2^(- j)$-net of the radius-two ball in $bb(R)^v$ with at
    most $\( 1 + 4 dot.op 2^j \)^v$ points. A maximal $2^(- j)$-separated set has this size by comparing the
    volumes of its disjoint radius-$2^(- j - 1)$ balls with the containing ball. In dimension zero use one point.
    Record the first net point within $2^(- j)$ of the projection coordinates divided by $r_A$.
    After scaling and translating back, let $c'$ be that point of the predecessor span.
    The in-span error and perpendicular error are both at most $r_A 2^(- j)$.
    Hence $B \( c' \, 2 r_A 2^(- j) \)$ contains $s_I$; set $r' = 2 r_A 2^(- j)$. It is at most $r_A$ for $j gt.eq 1$.
  Figure 1 depicts this step, writing $eta = r_A 2^(- j)$ and $F =
    "aff" \( s_1 \, dots.h \, s_(I - 1) \)$ within the illustration.
    Only the $v$-dimensional projection must be encoded; the perpendicular error is absorbed by the decoded
    radius. The radius does not increase, but the balls need not be nested.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((1.792, -0.448), radius: 1.456, fill: rgb("#f5f5ff"), stroke: none)
  circle((-0.56, 0.224), radius: 2.912, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((1.792, -0.448), radius: 1.456, stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((-3.696, -0.448), (3.472, -0.448), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((3.494, -0.448), [#text(size: 9pt)[$F$]], anchor: "west", padding: 0.1176cm)
  content((4.144, 1.008), [#text(size: 9pt)[$F= "aff" (s_1, dots.h ,s_(I-1))$#linebreak()$dim F=v=I-2$]], anchor: "west", padding: 0.1176cm)
  circle((-2.352, -0.448), radius: 0.0392, fill: black, stroke: none)
  content((-2.352, -0.5891), [#text(size: 9pt)[$s_1$]], anchor: "north", padding: 0.1176cm)
  circle((-0.784, -0.448), radius: 0.0392, fill: black, stroke: none)
  content((-0.784, -0.5891), [#text(size: 9pt)[$s_2$]], anchor: "north", padding: 0.1176cm)
  circle((1.232, 0.1344), radius: 0.0504, fill: black, stroke: none)
  content((1.182, 0.1843), [#text(size: 9pt)[$s_I$]], anchor: "south-east", padding: 0.1176cm)
  line((1.232, 0.1344), (1.232, -0.448), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.232, -0.3248), (1.355, -0.3248), (1.355, -0.448), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.232, -0.448), radius: 0.0336, fill: black, stroke: none)
  content((1.157, -0.5228), [#text(size: 9pt)[$P$]], anchor: "north-east", padding: 0.1176cm)
  line((0.952, 0.1344), (0.952, -0.448), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0.8624, -0.1344), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$delta_I lt.eq eta$]]])], anchor: "east")
  circle((1.792, -0.448), radius: 0.056, fill: rgb("#0000b2"), stroke: none)
  content((1.867, -0.5228), [#text(fill: rgb("#0000b2"))[#text(size: 9pt)[$c'$]]], anchor: "north-west", padding: 0.1176cm)
  line((1.232, -1.053), (1.792, -1.053), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((1.512, -1.123), [#text(size: 9pt)[$lt.eq eta$]], anchor: "north", padding: 0.1176cm)
  line((1.792, -0.448), (2.845, 0.56), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  content((2.52, 0.056), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#0000b2"))[#text(size: 9pt)[$r'=2 eta$]]]])], anchor: "west")
  line((-0.56, 0.224), (-2.229, 2.598), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  circle((-0.56, 0.224), radius: 0.0336, fill: rgb("#808080"), stroke: none)
  content((-0.6099, 0.2739), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#808080"))[#text(size: 9pt)[$c_A$]]]])], anchor: "south-east")
  content((-1.523, 1.523), [#text(fill: rgb("#808080"))[#text(size: 9pt)[$r_A$]]], anchor: "east", padding: 0.1176cm)
  content((4.144, 0.224), [#text(size: 9pt)[$eta =r_A 2^(-j)$, $j gt.eq 1$]], anchor: "west", padding: 0.1176cm)
  line((4.256, -1.008), (7.388, -1.008), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((3.966, -1.008), (4.256, -1.008), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((7.388, -1.008), (7.678, -1.008), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((4.256, -0.95), (5.271, -0.95), stroke: (paint: rgb("#7373ff"), thickness: 0.8pt, miter-limit: 10))
  line((4.79, -0.9036), (5.95, -0.9036), stroke: (paint: rgb("#7373ff"), thickness: 0.8pt, miter-limit: 10))
  line((5.718, -0.95), (6.878, -0.95), stroke: (paint: rgb("#7373ff"), thickness: 0.8pt, miter-limit: 10))
  line((6.559, -0.9036), (7.388, -0.9036), stroke: (paint: rgb("#7373ff"), thickness: 0.8pt, miter-limit: 10))
  circle((4.691, -1.008), radius: 0.0377, fill: rgb("#0000b2"), stroke: none)
  circle((5.37, -1.008), radius: 0.0377, fill: rgb("#0000b2"), stroke: none)
  circle((6.298, -1.008), radius: 0.0377, fill: rgb("#0000b2"), stroke: none)
  circle((7.139, -1.008), radius: 0.0377, fill: rgb("#0000b2"), stroke: none)
  circle((5.08, -1.008), radius: 0.029, fill: black, stroke: none)
  content((5.08, -1.114), [#text(size: 9pt)[$P$]], anchor: "north", padding: 0.1176cm)
  content((5.444, -1.083), [#text(fill: rgb("#0000b2"))[#text(size: 9pt)[$c'$]]], anchor: "north-west", padding: 0.1176cm)
  line((5.37, -0.6368), (5.95, -0.6368), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((5.66, -0.6015), [#text(size: 9pt)[$eta$]], anchor: "south", padding: 0.1176cm)
  content((4.144, -1.624), [#text(size: 9pt)[One-dimensional covering net#linebreak() $\# "net" lt.eq (1+4 dot.op 2^j)^v$#linebreak() Scale and index: $(v+1)j+O(v+1)$ bits]], anchor: "north-west", padding: 0.1176cm)
})],
    caption: [Figure 1: Predecessor-span localization, shown schematically in two dimensions. Only the projection of $s_I$ onto $F$ is quantized: the projected point $P$ lies in the radius-$2 r_A$ ball about $s_1$ in the $v$-dimensional span. A fixed $eta$-cover supplies the first qualifying ordered net point $c'$; the inset illustrates part of such a cover in one dimension, with omitted stretches dotted. Both errors are at most $eta$, so $B \( c' \, 2 eta \)$ contains $s_I$. The scale and net index have the displayed code-length bound, with dimension $v$. The new radius does not increase, but the new ball need not lie inside the old one. ],
  ) <l:span:net-figure>
  For $j gt.eq 1$, $j log 2 lt.eq Delta_I < \( j + 1 \) log 2$. Thus
  $ log r_A - Delta_I lt.eq log r' lt.eq log r_A - Delta_I + 2 log 2 . $
  For $j = 0$, either $Delta_I = 0$ or $Delta_I < log 2$, and the same upper bound holds with $r' = r_A$.
    These inequalities give (170) and, using the finite expectations already proved, $bb(E) \| log r' \| < oo$.
  Encode $j$ by the unary prefix code of length $j + 1$ bits.
    For $j gt.eq 1$, append a fixed-length net index of $ceil.l v log_2 \( 1 + 4 dot.op 2^j \) ceil.r$ bits.
    Given $A_(*)$, the dimension $v$ is known, so the combined code is prefix-free.
    Since $1 + 4 dot.op 2^j lt.eq 5 dot.op 2^j$, its length is at most $\( 1 + v \) j + C v + 2$.
    Now $1 + v lt.eq p$ and $j log 2 lt.eq Delta_I$, so its expected length in nats is at most $p bb(E) Delta_I +
    C_1 p$. We give the countable conditional entropy step explicitly.
    For a conditioning value $a_(*)$ with finite conditional expected length,
    let $ell_(a_(*)) \( c \)$ be the bit length and let $p_(a_(*)) \( c \)$ be the conditional code distribution.
    Kraft’s inequality #cite(label("Kraft1949")), in the finite or countable form stated in
    #cite(label("Duchi2023")) Section 2.4.2, Theorem 2.4.2, gives
  $ 0 < K_(a_(*)) := sum_c 2^(- ell_(a_(*)) \( c \)) lt.eq 1 . $
  Normalize $q_(a_(*)) \( c \) = 2^(- ell_(a_(*)) \( c \)) \/ K_(a_(*))$. Its cross entropy is
  $ sum_c p_(a_(*)) \( c \) log frac(1, q_(a_(*)) \( c \)) = \( log 2 \)
    bb(E) \[ ell_(a_(*)) \( C \) divides a_(*) \] + log K_(a_(*)) lt.eq \( log 2 \)
    bb(E) \[ ell_(a_(*)) \( C \) divides a_(*) \] < oo . $
  For a finite partition of the code alphabet with one remaining tail atom,
    nonnegative relative entropy bounds the partition entropy by its $q_(a_(*))$ cross entropy,
    and that cross entropy is at most the displayed full cross entropy.
    Refining such partitions gives the countable entropy by monotone convergence.
    Hence $H \( C divides a_(*) \) lt.eq \( log 2 \) bb(E) \[ ell_(a_(*)) \( C \) divides a_(*) \]$.
    Finite conditional expected length holds for almost every $a_(*)$ because its average is finite.
    Averaging proves the first inequality in (170).
  Gram–Schmidt with fixed conventions supplies measurable orthonormal coordinates from the predecessor
    differences, and the fixed ordering resolves net ties. Define the code arbitrarily on the null degeneracy set.
    The decoded ball is therefore measurable. The pointwise construction puts $s_I$ in that decoded ball outside
    the null degeneracy set. The event ${ parallel s_I - c' \( A' \) parallel lt.eq
    r' \( A' \) }$ is Borel and has probability one. Disintegrating it over $A'$ shows that its conditional
    probability is one for almost every $A'$. Thus the decoded ball supports the conditional signal law.
    Conditioning an absolutely continuous law on a discrete code keeps absolute continuity almost surely.
    The conditional entropy chain rule gives the second inequality in (170),
    and its finite right side proves the remaining finiteness claim. ◻
]

=== 11.5 The sample bound <the-sample-bound>

The preceding two lemmas now give a complete potential argument.
  The result uses the local model and the local cap and full-data calculation of Section 2;
  the only companion input remains (164).

#thm([Proposition 11.6.])[
  (A predecessor-span block bound).  #emph[For sufficiently large $d$, put $K = p = floor.l d \/ 8 floor.r$.
    Consider a learner of Section 2 with horizon $T$ and $M$ persistent bits, and set $W = \( T + 2 \) 2^M$.
    If $log W lt.eq 2 d^2$, then its uniform-sphere angular success probability $pi$ at $0 < epsilon.alt lt.eq
    1 \/ 10$ satisfies
#[#set math.equation(numbering: n => "(171)")
 $ pi \( d - 1 \) log \( 1 \/ epsilon.alt \) lt.eq C d (⌈T \/ K⌉ + 1) $ <l:span:success-bound>]

 for an absolute $C$. In particular, success at least $2 \/ 3$ implies
$ ⌈T \/ K⌉ gt.eq c log \( 1 \/ epsilon.alt \) - C' $

 with absolute $c > 0 \, C' > 0$.]
] <l:span:block-bound>

#proof[
  Condition on the shared rule randomness. For almost every value,
    the joint initialization independence in Section 2 leaves the initial state independent of the signal and all
    sample rows. By Lemmas 1 and 2, the conditional uniform-prior experiment has Borel rule versions.
    We prove the displayed numerical bound for each such value, with its conditional success probability.
    Averaging that bound at the end handles shared randomness without requiring jointly selected Borel versions.
  Pad an early-stopping program to $T$ observations by retaining its terminal state and stopping index,
    and then ignoring the remaining pairs. At each index the padded state has at most $W$ values,
    and the final output law uses only that state. Divide the observations into blocks of length $K$,
    allowing a shorter final block. Set
  $ a = K + p \, wide Phi \( A \, r_A \) = cal(D) \( A \) + a bb(E) log r_A . $
  For every nonempty block length $1 lt.eq k lt.eq K$, the inequalities $k + p +
    1 < d$ and $a lt.eq \( d - 1 \) \/ 2$ hold once $d$ is sufficiently large.
    Initially $A$ is the signal-independent initial state and the containing ball is $B \( 0 \, 1 \)$, so $Phi = 0$.
  At a block, select a replica and encode its new ball as above. Combining (168)–(170) gives
  #[#set math.equation(numbering: n => "(172)")
   $ Phi \( A' \, r' \) & lt.eq Phi \( A \, r_A \) + frac(log W, p) + k / 2 + C_1 p +
     2 a log 2 + \( k + p - a \) bb(E) Delta_I\
 & lt.eq Phi \( A \, r_A \) + C_2 d . $ <l:span:drift>]
  Indeed $k + p - a lt.eq 0$, while $p gt.eq d \/ 16$ and $log W lt.eq 2 d^2$ make the width charge $O \( d \)$.
    The cancellation has a direct explanation: the likelihood charges $k Delta_I$,
    the code charges at most $p Delta_I$, and the radius credit is $a Delta_I = \( K + p \) Delta_I$.
  Every posterior draw has the correct joint marginal with the block destination.
    Uniformly selecting one draw therefore preserves the learner’s state–signal marginal,
    and recording its code changes no marginal law. Generate the next Gaussian block independently of the pair
    consisting of the current signal and augmented analysis variables.
    Since the learner’s transition uses the past only through its state,
    induction preserves the actual state–signal marginal at every boundary.
    The predecessor points and codes are never given to the learner.
    All required finiteness properties propagate by Lemma 47. Thus after $b = ceil.l T \/ K ceil.r$ blocks,
  $ Phi lt.eq C_2 d b . $
  For $T = 0$ this holds directly with $b = 0$.
  Write $n = d - 1$. Lemma 3 gives $mu \( B \( c_A \, r_A \) \) lt.eq \( 2 r_A \)^n$.
    A density supported in a set $E$ has relative entropy at least $- log mu \( E \)$,
    by comparison with $mu \( thin dot.op divides E \)$. Therefore
  $ D \( f_A mu parallel mu \) gt.eq - n log \( 2 r_A \) $
  almost surely, and
  #[#set math.equation(numbering: n => "(173)")
   $ Phi gt.eq (1 - a / n) cal(D) \( A \) - a log 2 gt.eq 1 / 2 cal(D) \( A \) - a log 2 . $ <l:span:coercivity>]
  The unconditional signal law remains $mu$, so $cal(D) \( A \) = I \( S \; A \)$.
    The final $A$ includes the padded state $w$, and hence $cal(D) \( A \) gt.eq I \( S \; w \)$.
  Under the product of $mu$ and the output marginal, angular success has probability at most $epsilon.alt^n$,
    by Lemma 3. Data processing through the terminal output and then through the success event gives
  $ I \( S \; w \) gt.eq I \( S \; hat(S) \) gt.eq pi n log \( 1 \/ epsilon.alt \) - log 2 $
  by (1). This holds with the success probability for the fixed shared seed.
    Combining it with the potential upper bound and (173) proves (171) with constants independent of that seed.
    Averaging proves the asserted bound for the original shared randomness as well. ◻
]

#thm([Theorem 11.7.])[
  (The full accuracy range by predecessor-span localization).  #emph[Let $M \( d \) =
    o \( d^2 \)$ be integer-valued and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    A family of learners in Section 2 whose angular success probability is at least $2 \/
    3$ for a uniform spherical signal must use
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for all sufficiently large $d$, where $c > 0$ is absolute.
   The eventual threshold may depend on the memory sequence.
   The same conclusion follows from success at least $2 \/ 3$ for every fixed signal.]
] <l:span:theorem>

#proof[
  Put $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$. The last statement follows by averaging over the uniform
    signal, so it suffices to prove the average statement. There are at most $\( T + 1 \)
    2^M$ terminal time–state pairs. For each fixed pair its fresh output law succeeds on uniform mass at most
    $epsilon.alt^(d - 1)$, by the cap bound and integration over that output law.
    More explicitly, for a terminal pair $h$ let $a_h \( s \)$ be that fixed output law’s success probability at
    signal $s$, and let $t_h \( s \) = Pr \( h upright(" is reached") divides S = s \)$. The pair’s contribution is
  $ integral t_h \( s \) a_h \( s \) thin mu \( d s \) lt.eq integral a_h \( s \) thin mu \( d s \) lt.eq
    epsilon.alt^(d - 1) \, $
  because $0 lt.eq t_h \( s \) lt.eq 1$. Summing over all pairs,
    for almost every shared seed and hence after averaging, yields
  $ 2 / 3 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) . $
  Equivalently,
  #[#set math.equation(numbering: n => "(174)")
   $ \( d - 1 \) L lt.eq M log 2 + log \( T + 1 \) + log \( 3 \/ 2 \) . $ <l:span:output-count>]
  At indices where $T gt.eq d L$ the conclusion is immediate. At the other indices, (174) gives
  $ \( d - 1 \) L lt.eq M log 2 + log \( d L + 1 \) + log \( 3 \/ 2 \) . $
  For all sufficiently large $d$, uniformly for $L gt.eq log 10$, $log \( d L + 1 \) lt.eq d L \/ 6$,
    while $\( d - 1 \) L gt.eq d L \/ 2$. Consequently $d L lt.eq 3 M log 2 + 3 log \( 3 \/ 2 \) =
    o \( d^2 \)$ along such short indices. In particular $log \( \( T + 2 \) 2^M \) lt.eq 2 d^2$ eventually,
    so Proposition 48 applies. It gives
  $ T gt.eq K { c_0 L - C_0 - 1 } $
  with absolute $c_0 > 0 \, C_0$. Above a sufficiently large absolute threshold for $L$, use $K gt.eq
    d \/ 16$ and absorb the constants to obtain $T gt.eq c_1 d L$.
  For completeness, the local full-data argument supplies the remaining constant-accuracy range with explicit
    constants. If $T lt.eq d \/ 8$, reveal every row and label.
    The conditional unknown component is uniform on a residual sphere of radius $R$.
    By isotropy and Markov’s inequality,
  $ Pr { R < 1 \/ 2 } lt.eq frac(4 T, 3 d) lt.eq 1 / 6 . $
  On $R gt.eq 1 \/ 2$, antipodal residual points correspond to signals separated by at least one,
    so a radius-$epsilon.alt$ error ball with $epsilon.alt lt.eq 1 \/ 10$ contains at most one point of each pair.
    Conditional success is at most $1 \/ 2$, also for a randomized estimate. Total success is at most
  $ 1 / 6 + 5 / 6 dot.op 1 / 2 = 7 / 12 < 2 / 3 . $
  Thus $T > d \/ 8$. This proves $T gt.eq c_2 d L$ throughout the bounded range of $L$ left above.
    Taking the minimum of the absolute constants completes the proof,
    including nonmonotone accuracy sequences and early stopping. ◻
]

== 12 A convex potential from inverse-distance kernels <lk:section>

Explicit revelations are one way to pay for a concentrated posterior.
  This section uses a different accounting method. From the relative entropy of a posterior we subtract the
  logarithm of an inverse-distance average. The resulting functional is convex,
  so after a block we may forget the entering state without increasing it.
  A mixed projection estimate then charges only the rows that the learner actually saw.

Throughout this section, $sigma$ is uniform probability on $S^(d - 1)$, $n = d - 1$, $k =
  floor.l d \/ 16 floor.r$, and $p = 2 k$. We work in sufficiently large dimension that $k gt.eq 1$ and $2 p < n$.
  For a probability measure $nu lt.eq H sigma$, $H < oo$, put

#[#set math.equation(numbering: n => "(175)")
 $ J_nu \( s \) = integral parallel u - s parallel^(- p) thin d nu \( u \) \, wide B \( nu \) =
   integral log J_nu \( s \) thin d nu \( s \) \, wide Phi \( nu \) = D \( nu parallel sigma \) -
   B \( nu \) . $ <lk:definition>]

The sphere has diameter two, so $J_nu gt.eq 2^(- p)$. The centered ball bound of Lemma 3, summed on dyadic annuli,
  bounds $J_nu$ above uniformly in $s$ because $p < n$. Thus every term in (175) is finite.

#thm([Lemma 12.1.])[
  (Convexity and coercivity).  #emph[The functional $Phi$ is convex under finite mixtures of bounded-density
    probability measures and
$ Phi \( nu \) gt.eq 1 / 2 D \( nu parallel sigma \) - C d \, wide Phi \( sigma \) lt.eq p log 2 $

 for an absolute $C$.]
] <lk:coercive>

#proof[
  Writing $f = d nu \/ d sigma$, we have $Phi \( nu \) = integral f log \( f \/ J_nu \) thin d sigma$,
    with value zero where $f = 0$. Both $f$ and $J_nu$ are linear in $nu$.
    For $x > 0 \, y > 0$, the Hessian of $x log \( x \/ y \)$ has quadratic form $\( a - b x \/ y \)^2 \/ x$;
    continuity at $x = 0$ gives joint convexity on $x gt.eq 0 \, y > 0$. Integration proves the mixture assertion.
  By Jensen and rotational invariance,
  $ integral J_nu \( s \)^2 thin d sigma \( s \) lt.eq integral #h(-0.16667em) integral parallel u -
    s parallel^(- 2 p) thin d sigma \( s \) d nu \( u \) lt.eq e^(C d) . $
  For the last bound, distances greater than one contribute at most one.
    On $2^(- i - 1) < parallel u - s parallel lt.eq 2^(- i)$,
    the contribution is at most $2^(2 p) 2^(- i \( n - 2 p \))$; its sum converges since $n - 2 p > 0$.
    Apply the entropy inequality (2), equivalently $bb(E)_nu F lt.eq D \( nu parallel sigma \) +
    log bb(E)_sigma e^F$, to $F = 2 log J_nu$. This logarithm is bounded for fixed $nu$.
    It gives $2 B \( nu \) lt.eq D \( nu parallel sigma \) + C d$.
    Finally, $D \( sigma parallel sigma \) = 0$ and $J_sigma gt.eq 2^(- p)$. ◻
]

=== 12.1 Exact projection densities and the kernel entropy <exact-projection-densities-and-the-kernel-entropy>

We will use differential entropy of exact labels. The following elementary density statement fixes both its
  version and its integrability before the information identity is used.

#thm([Lemma 12.2.])[
  (Projection versions and logarithms).  #emph[Let $1 lt.eq ell < d - 1$,
    let $G$ have $ell$ independent standard Gaussian rows, and let $nu lt.eq H sigma$ be a probability measure.
    For each full-row-rank $g$, the image $g_(\#) nu$ has a Lebesgue density. The limit, where finite and existent, of
$ p_(nu \, a) \( g \, y \) = \( 2 a \)^(- ell) nu { u : parallel g u - y parallel_oo lt.eq a } \, wide a = 1 \,
  1 \/ 2 \, 1 \/ 3 \, dots.h \, $

 and zero elsewhere is a jointly Borel density version $p_nu \( g \, y \)$.
   Under the independent law of $G$ and $S tilde.op nu$, $log p_nu \( G \, G S \)$ is integrable.]
  #emph[If instead $G$ and $S tilde.op sigma$ are marginally independent and $W$ is finite with any joint law with
    them, the actual conditional law of $G S$ given $\( G \, W \)$ has a Lebesgue density.
    Its logarithm and $log p_(nu_W) \( G \, G S \)$, where $nu_w = P_(S divides W = w)$,
    are integrable under the actual law. The same assertion holds after first conditioning on a finite entering
    variable $V$, provided the fresh $G$ is jointly independent of $\( S \, V \)$.
    Equivalently, conditional on each positive-probability value of $V$,
    the joint law of $\( G \, S \)$ must be the product of the original Gaussian row law and the conditional law
    of $S$.]
] <lk:density>

#proof[
  Writing $H_g = \( g g^(sans(T)) \)^(1 \/ 2)$, an orthogonal change of coordinates and a nonsingular change of
    label coordinates give
  $ p_sigma \( g \, y \) = frac(c_(d \, ell), det \( g g^(sans(T)) \)^(1 \/ 2))
    (1 - parallel H_g^(- 1) y parallel^2)^(\( d - ell - 2 \) \/ 2)
    upright(bold(1))_({ parallel H_g^(- 1) y parallel < 1 }) . $
  The spherical coordinate formula follows by splitting a normalized standard Gaussian into its $ell$ row-space
    coordinates and the remaining coordinates: the squared projected length is
    $"Beta" \( ell \/ 2 \, \( d - ell \) \/ 2 \)$. Domination proves absolute continuity for $nu$.
    Lebesgue differentiation proves the claim about cube limits, and their defining integrals are jointly Borel.
  Under $G ⊗ sigma$, the logarithm in the displayed formula is integrable.
    The beta density has integrable logarithms at its two endpoints.
    Gram–Schmidt expresses $det \( G G^(sans(T)) \)$ as a product of chi-square variables of positive degrees,
    each with integrable logarithm. Domination by $H$ preserves this baseline integrability for $S tilde.op nu$.
    The projected likelihood ratio $p_nu \/ p_sigma$ has relative entropy at most $D \( nu parallel sigma \) lt.eq
    log H$ by data processing. Its negative logarithmic part has expectation at most $1 \/ e$,
    since $t log^(-) \( t \) lt.eq 1 \/ e$ under the probability reference.
    Its positive part is then finite as well. This proves the first integrability assertion.
  For a positive-probability $w$, the actual law of $\( G \, S \)$ given $w$ is dominated by $P \( W = w \)^(- 1)$
    times $G ⊗ sigma$. Its image therefore has a density, and the baseline logarithm is integrable;
    averaging over $w$ restores its original finite expectation.
    The log ratio of the actual image density to $p_sigma$ has relative entropy $I \( W \; G S divides G \) lt.eq
    H \( W \)$ and negative part at most $1 \/ e$. Thus the actual log density is integrable. Moreover,
  $ bb(E) D \( P_(S divides G \, W) parallel nu_W \) = I \( S \; G divides W \) lt.eq H \( W \) \, $
  where the last inequality uses $I \( S \; G \) = 0$ and the chain rule.
    Data processing under $s mapsto G s$ gives integrability of the log ratio between the actual image density and
    $p_(nu_W)$; subtracting it proves the remaining claim. If a finite entering variable is first fixed,
    its signal law is bounded relative to $sigma$, and the same argument applies to each positive-probability case
    and then to their finite average. ◻
]

#thm([Lemma 12.3.])[
  (The kernel controls projection entropy).  #emph[Let $X$ have $p$ independent standard Gaussian rows and be
    independent of $S tilde.op nu lt.eq H sigma$, $H gt.eq 1$.
    For a sufficiently large absolute $C_0$, put $b_H = ceil.l C_0 \( d + log \( 2 H \) \) ceil.r$. Then
$ h \( X S divides X \) lt.eq - B \( nu \) + C d + 2 log \( b_H + 2 \) . $

]
] <lk:entropy>

#proof[
  For $r_i = 2^(1 - i)$, let $m_i \( s \) = nu \( B \( s \, r_i \) \)$. Dyadic shells give
  $ J_nu \( s \) lt.eq 2^p sum_(i gt.eq 0) r_i^(- p) m_i \( s \) . $
  Since $m_i \( s \) lt.eq H \( 2 r_i \)^n$ and $n - p gt.eq 1$,
    choosing $C_0$ large makes the sum over $i > b_H$ at most $2^(- p)$. The term $i = 0$ is itself $2^(- p)$.
    Choose the first maximizer $j = j \( s \) lt.eq b_H$. This is measurable and satisfies
  $ log \( r_j^(- p) m_j \( s \) \) gt.eq log J_nu \( s \) - C d - log \( b_H + 2 \) . $
  For fixed $X$, compare the actual projected density to
  $ Q_X \( y \) = frac(1, b_H + 1) sum_(i = 0)^(b_H) integral gamma_(r_i) \( y - X u \) thin d nu \( u \) \, $
  where $gamma_r$ is the $N \( 0 \, r^2 I_p \)$ density. At $y = X s$,
    retain the $j$-summand and restrict it to $B \( s \, r_j \)$.
    Jensen’s inequality for the logarithm on that normalized restriction and $bb(E)_X parallel X \( s - u \)
    parallel^2 = p parallel s - u parallel^2 lt.eq p r_j^2$ give
  $ bb(E)_X log Q_X \( X s \) gt.eq log \( r_j^(- p) m_j \( s \) \) - log \( b_H + 1 \) - p / 2 log \( 2 pi \) -
    p / 2 . $
  Integrate over $s$. The comparison density has finite cross entropy by this bound and its finite
    Gaussian-mixture upper bound. The actual differential entropy is finite by Lemma 51.
    Nonnegativity of relative entropy to $Q_X \( y \) thin d y$ proves the result. ◻
]

=== 12.2 The mixed estimate and the actual-row charge <the-mixed-estimate-and-the-actual-row-charge>

The following is the positive-scale assertion of #cite(label("OpenAIRow2026")) Theorem 3.1.
  We state its parameters explicitly because its application has only one unit of angular slack.
  Its proof is in that companion; the reweighting and change of row law below are proved here.

#thm([Theorem 12.4.])[
  (Mixed projection estimate).  #emph[Let $m \, r \, q gt.eq 1$ be integers, $ell = m + r < n = d - 1$, and $ell -
    m - \( q - 1 \) gt.eq 1$. Let $rho$ be a finite measure on the sphere such that,
    for every ambient $z$ and $t > 0$, $rho \( B \( z \, t \) \) lt.eq
    B t^ell$ and $rho \( B \( z \, t \) \) lt.eq D t^n$, with $B \, D > 0$.
    For independent Gaussian matrices $X \, Z$ with $m \, r$ rows, put $G = \( X \; Z \)$ and
$ p_(rho \, delta) \( G \, y \) = \( 2 delta \)^(- ell) integral
  upright(bold(1))_({ parallel G u - y parallel_oo lt.eq delta }) thin d rho \( u \) . $

 For every fixed $s in S^(d - 1)$ and every $delta > 0$,
$ [bb(E)_X (bb(E)_Z p_(rho \, delta) \( G \, G s \))^q]^(1 \/ q) lt.eq e^(C d) B #scale(x: 120%, y: 120%)[\(] 1 +
  log^(+) \( D \/ B \) #scale(x: 120%, y: 120%)[\)] . $

]
] <lk:mixed-input>

The estimate is for positive cube averages and every fixed signal.
  In its use below, we first change the law of the actual rows while $delta > 0$,
  and only then pass to exact labels under their actual law.
  No assertion about a fixed-signal value of an arbitrary density version is used.

#thm([Lemma 12.5.])[
  (Reweighting by the potential).  #emph[For $nu lt.eq H sigma$, define $d rho = d nu \/ J_nu$. Then
$ rho \( B \( z \, r \) \) lt.eq \( 2 r \)^p \, wide rho lt.eq 2^p H sigma . $

 By Theorem 53, for independent $k$-row Gaussian matrices $A \, A'$, $X = \( A \; A' \)$, every $s in S^(d - 1)$,
   and every $delta > 0$,
#[#set math.equation(numbering: n => "(176)")
 $ [bb(E)_A (bb(E)_(A') p_(rho \, delta) \( X \, X s \))^k]^(1 \/ k) lt.eq e^(C d) \( b_H + 2 \) . $ <lk:moment>]

]
] <lk:reweight>

#proof[
  For $s in B \( z \, r \)$, $J_nu \( s \) gt.eq \( 2 r \)^(- p) nu \( B \( z \, r \) \)$.
    Integrating its reciprocal over the ball proves the first inequality;
    if the ball has zero $nu$-mass there is nothing to prove. The second uses $J_nu gt.eq 2^(- p)$.
  Apply Theorem 53 with $m = r = q = k$, $ell = p = 2 k$, $B = 2^p$, and $D = 2^(p + n) H$,
    using the ambient-center cap bound of Lemma 3. The angular margin is exactly $p - k - \( k - 1 \) = 1$,
    and the radial margin is $n - p > 0$. Moreover $1 + log^(+) \( D \/ B \) lt.eq C \( d + 1 + log H \) lt.eq
    C \( b_H + 2 \)$; the factor $2^p$ is absorbed in $e^(C d)$. This proves (176).
    The local inverse factor behind this substitution is $parallel u -
    s parallel^(- k) "dist" \( u - s \, E \)^(- k)$, where $E$ is a linear subspace with $dim E lt.eq k - 1$. ◻
]

#thm([Proposition 12.6.])[
  (Drift of the kernel functional).  #emph[Let $S tilde.op sigma$, let $V$ have at most $N$ values,
    and let a $k$-row Gaussian matrix $A$ be independent of $\( S \, V \)$.
    Suppose $W$ has at most $N$ values and is generated by a Borel probability kernel of $\( V \, A \, A S \)$ and
    independent randomness. If $log N lt.eq d^2$, then, for sufficiently large $d$,
$ bb(E) Phi \( P_(S divides W) \) lt.eq bb(E) Phi \( P_(S divides V) \) + C d . $

]
] <lk:drift>

#proof[
  Condition first on $V = v$ with positive probability. Put $nu = P_(S divides v)$ and $H_v =
    P \( V = v \)^(- 1)$. In this conditional experiment $w$ always ranges over values with
    $P \( V = v \, W = w \) > 0$; for these values put $nu_w = P_(S divides v \, w)$ and $H_(v w) =
    P \( V = v \, W = w \)^(- 1)$. The two posteriors are bounded by $H_v sigma$ and $H_(v w) sigma$.
    Introduce a $k$-row Gaussian matrix $A'$ independent of $\( S \, V \, A \, W \)$, and put $X = \( A \; A' \)$,
    $Y = X S$. Within the conditional experiment $X$ is independent of $S$,
    and $W$ depends on $S$ only through $\( X \, Y \)$. The chain rule gives
  #[#set math.equation(numbering: n => "(177)")
   $ I \( S \; W \) = h \( Y divides X \) - h \( Y divides X \, W \) - I \( X \; S divides W \) . $ <lk:identity>]
  For example, $I \( S \; W \) = I \( X \, Y \; W \) - I \( X \; W divides S \)$, and $I \( X \; S \) =
    0$ converts the difference of the two row-information terms into $- I \( X \; S divides W \)$.
    All displayed differential entropies are finite by Lemma 51, and $I \( X \; S divides W \) lt.eq H \( W \)$.
  For fixed $w$, use the finite nonzero measure $rho_w = nu_w \/ J_(nu_w)$ as a reference, and write $a_w =
    rho_w \( S^(d - 1) \)$. First normalize this reference. The relative entropy of the actual conditional law of
    $\( X \, S \)$ with respect to $P_(X divides w) ⊗ \( rho_w \/ a_w \)$ is
  $ I \( X \; S divides w \) + B \( nu_w \) + log a_w < oo . $
  Indeed, $log J_(nu_w)$ is bounded for this $v \, w$, and $I \( X \; S divides w \) < oo$.
    Probability data processing under $\( X \, s \) mapsto \( X \, X s \)$ makes the corresponding post-map
    relative entropy finite. For probability laws $P lt.double Q$, the elementary bound
  $ integral_({ d P \/ d Q < 1 }) - log \( d P \/ d Q \) thin d P lt.eq 1 \/ e $
  shows that a finite relative entropy has an integrable log density ratio.
    The post-map ratio is the actual conditional label density divided by $p_(rho_w) \( X \, Y \) \/ a_w$.
    Its logarithm is therefore integrable. Lemma 51 makes the logarithm of the actual conditional label density
    integrable as well, so $log p_(rho_w) \( X \, Y \)$ is integrable under the actual conditional law.
    Here $p_(rho_w)$ is the cube-limit density version; the same construction applies to a finite measure.
  We may now expand both finite-reference divergences and subtract $log a_w$ from probability data processing.
    Before the map the divergence is $I \( X \; S divides w \) + B \( nu_w \)$, while after the map it is $-
    h \( Y divides X \, w \) - bb(E) \[ log p_(rho_w) \( X \, Y \) divides w \]$. Consequently,
  #[#set math.equation(numbering: n => "(178)")
   $ - h \( Y divides X \, w \) - I \( X \; S divides w \) lt.eq B \( nu_w \) +
     bb(E) \[ log p_(rho_w) \( X \, Y \) divides w \] . $ <lk:finite-reference>]
  This is precisely the finite-reference data-processing statement proved in Section 2,
    including when $rho_w$ has mass greater than one.
  We now bound the last logarithm under the selected actual rows.
    Let $Q$ be the original Gaussian law of $A$, still conditional on $v$,
    and write $kappa_w \( a \, a s \)$ for the Borel block probability of message $w$.
    For $r_w \( s \) = integral kappa_w \( a \, a s \) thin Q \( d a \) > 0$, choose the conditional row law
  $ Q_(s \, w) \( d a \) = frac(kappa_w \( a \, a s \), r_w \( s \)) thin Q \( d a \) \; $
  when $r_w \( s \) = 0$, assign $Q_(s \, w) = Q$. The normalizer is positive for almost every $\( s \, w \)$
    under the actual law, and this is a conditional version of the row law there.
    In particular $Q_(s \, w) lt.double Q$. Also
  $ bb(E)_(s \, w) D \( Q_(s \, w) parallel Q \) = I \( A \; W divides S \) lt.eq H \( W \) lt.eq log N \, $
  so the divergence is finite for almost every $\( s \, w \)$ under that law.
    The fresh $A'$ retains its independent Gaussian law after conditioning on $\( A \, s \, w \)$.
    For almost every such pair and for $delta > 0$, Jensen in $A'$, followed by (2) with exponent $k$, gives
  #[#set math.equation(numbering: n => "(179)")
   $ & bb(E) \[ log \( 1 + p_(rho_w \, delta) \( X \, X s \) \) divides s \, w \]\
 & quad lt.eq frac(D \( Q_(s \, w) parallel Q \), k) + 1 /
   k log bb(E)_(A tilde.op Q) (1 + bb(E)_(A') p_(rho_w \, delta) \( X \, X s \))^k\
 & quad lt.eq frac(D \( Q_(s \, w) parallel Q \), k) + C d + log \( b_(H_(v w)) + 2 \) . $ <lk:row-charge>]
  The last step uses the $L^k$ triangle inequality and (176),
    whose fresh moment holds for every fixed $s in S^(d - 1)$.
    The displayed row-charge inequality is used only for almost every $\( s \, w \)$ under the actual law,
    while $delta$ is positive.
  Here is the exact null-set transfer in that passage. For each full-rank $X$,
    Lebesgue differentiation makes $p_(rho_w \, 1 \/ a) \( X \, y \)$ converge to $p_(rho_w) \( X \, y \)$ for
    Lebesgue-almost every $y$. The failure set is jointly Borel by the cube definitions.
    Under the actual conditional law given $\( v \, w \)$, $\( X \, S \)$ is dominated by a finite multiple of
    $gamma_p ⊗ sigma$; pushing forward shows that $\( X \, Y \)$ is absolutely continuous with respect to
    $gamma_p \( d X \) thin d y$. Consequently it avoids this failure set,
    including after the actual rows have been tilted by $w$. Fatou applied to the nonnegative
    $log \( 1 + p_(rho_w \, 1 \/ a) \( X \, Y \) \)$, after integrating (179) over $s \, w$,
    proves the same integrated upper bound for $log \( 1 + p_(rho_w) \( X \, Y \) \)$,
    and hence for $log p_(rho_w)$. This argument does not invoke an unsmoothed moment at $rho_w$-almost every
    fixed signal.
  The preceding estimate supplies the quantitative positive-log bound;
    integrability of both signs was established before (178).
    Substituting Lemma 52 and (178)–(179) into (177), and using $I \( S \; W \) =
    bb(E)_w D \( nu_w parallel sigma \) - D \( nu parallel sigma \)$, yields
  $ bb(E)_w Phi \( nu_w \) lt.eq Phi \( nu \) + C d + 2 log \( b_(H_v) + 2 \) +
    bb(E)_w log \( b_(H_(v w)) + 2 \) + frac(log N, k) . $
  Restore the average over $v$. $bb(E) log H_V = H \( V \) lt.eq log N$ and $bb(E) log H_(V W) =
    H \( V \, W \) lt.eq 2 log N$. Jensen bounds the averaged cutoff terms by $C log \( d + 1 + 2 log N \)$,
    while $log N \/ k lt.eq C d$. For fixed $w$, $P_(S divides W = w)$ is the finite mixture of $nu_w =
    P_(S divides v \, w)$ over $v$. Lemma 50 permits forgetting $v$, proving the drift. ◻
]

=== 12.3 Precision and the global stopping index <precision-and-the-global-stopping-index>

#thm([Corollary 12.7.])[
  #emph[Let $M \( d \) = o \( d^2 \)$ and $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$.
    A learner in the model of Section 2 with uniform-sphere average angular success at least $2 \/
    3$ requires $T \( d \) gt.eq c d log \( 1 \/ epsilon.alt \( d \) \)$ for an absolute $c >
    0$ in sufficiently large dimension. The threshold may depend on the memory sequence.]
] <lk:regression>

#proof[
  Fix the shared rule randomness with uniform-prior success at least $2 \/ 3$, and apply Lemmas 2 and 1.
    Keep the internal transition and output randomness. Put $L = log \( 1 \/ epsilon.alt \)$.
    Under the product of the marginal laws of $\( S \, hat(S) \)$,
    angular success has probability at most $epsilon.alt^(d - 1)$, by Lemma 3. Equation (1) therefore gives
  #[#set math.equation(numbering: n => "(180)")
   $ I \( S \; hat(S) \) gt.eq 2 / 3 \( d - 1 \) L - log 2 . $ <lk:output>]
  Assume $T < d L$. The other case is already sufficient. The terminal state and stopping index have at most
    $\( T + 1 \) 2^M$ values, so the left side of (180) is at most $M log 2 + log \( T + 1 \)$.
    Since $log \( T + 2 \) lt.eq C + log d + log \( L + 1 \) lt.eq C + log d + L$, absorption gives
  $ L lt.eq C frac(M + 1 + log d, d) \, wide T = O \( d + M \) . $
  For $M = o \( d^2 \)$, pad stopped states with their original terminal labels and indices and add unused rows to
    complete the last block. Every padded layer has at most $N = \( T + 2 \) 2^M$ states and $log N = o \( d^2 \)$.
  The initial conditional signal law is $sigma$, because the model makes initialization independent of the signal
    conditional on the fixed shared rule randomness. Iterate Proposition 55 for $ceil.l T \/ k
    ceil.r$ blocks and apply Lemma 50. For the final padded state $F$,
  $ I \( S \; F \) = bb(E) D \( P_(S divides F) parallel sigma \) lt.eq C d #scale(x: 120%, y: 120%)[\(] 1 +
    ceil.l T \/ k ceil.r #scale(x: 120%, y: 120%)[\)] . $
  The output is generated from $F$ and fresh randomness. Data processing with (180) gives $L lt.eq
    C \( 1 + T \/ d \)$. The $2 \/ 3$ instance of Lemma 3 gives $T > d \/
    4$ for this same prior and exact observation model. Thus $1 + T \/ d lt.eq 5 T \/ d$,
    proving the claimed sample bound. The global-clock calculation controls only the padded width;
    the precision-dependent conclusion comes from the block drift. ◻
]

== 13 Maximum cell mass and inverse volumes at all scales <lc:cell>

This section gives an independent proof of the uniform-sphere sample lower bound in Corollary 56.
  We track what the complete boundary-state history reveals about the signal,
  subtracting a correction built from local cell masses. The correction accounts for concentration already present
  in the conditional signal law. Its geometric input controls inverse simplex volumes without any bounded-support
  assumption.

After the model and stopping reductions below, Section 13.1 establishes coercivity of the correction,
  Section 13.2 proves the inverse-volume bound without a support restriction,
  Section 13.3 compares incoming and outgoing exact-observation fibers,
  and Section 13.4 completes the information-growth and decoding estimates.

The information identities below are the conditional relative-entropy chain rule;
  see #cite(label("Austin2020")) Section 3.3 for its standard Borel formulation.
  All fiber comparisons needed here are proved explicitly.

We use uniform probability $sigma$ on $S^(d - 1)$ for the signal, written $U$ when random.
  All logarithms are natural except in dyadic scale definitions.
  Set $L = log \( 1 \/ epsilon.alt \)$, and suppose $M = M \( d \) = o \( d^2 \)$ and $0 < epsilon.alt lt.eq
  1 \/ 10$. Work in sufficiently large dimension that $M lt.eq d^2$.

Assume uniform-prior angular success at least $2 \/ 3$ in the model of Section 2.
  Fix the shared rule randomness with success strictly greater than $3 \/ 5$.
  Lemmas 2 and 1 replace those fixed rules by everywhere Borel rules for this prior.
  Then fix the initial state and the independent transition and output seeds with success at least $3 \/ 5$.
  The resulting deterministic program has the same state bound.
  Its output is determined by its terminal state and index.

We may assume $T < d L$. Otherwise the desired lower bound is immediate.
  There are at most $\( T + 1 \) 2^M$ possible output labels.
  By the cap bound of Lemma 3, the union of their successful signals has mass at most $\( T + 1 \) 2^M
  epsilon.alt^(d - 1)$. Hence

$ 3 / 5 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) . $

Since $L gt.eq log 10$ and $T < d L$, $log \( T + 1 \) lt.eq log \( 2 d \) + L$.
  Taking logarithms gives $\( d - 2 \) L lt.eq M log 2 + log \( 2 d \) + log \( 5 \/ 3 \)$.
  Thus $L = O \( d \)$ and $T = O \( d^2 \)$ in the case under consideration.
  The $3 \/ 5$ endpoint in Lemma 3 also gives $T > d \/ 20$.
  These reductions will bound the entropy of the complete boundary history;
  they do not supply the precision-dependent block estimate.

=== 13.1 Selected cells and their entropy cost <lc:cell-selection>

Use the parameters

$ n = k = floor.l d \/ 100 floor.r \, wide alpha = \( d - 1 \) \/ 2 . $

Group sample layers into blocks of size $n$, completing the last block with independent unused samples.
  In each block denote by $A$ the $n$-by-$d$ matrix of sample rows and by $b = A U$ the responses.
  We keep, for the analysis, a history consisting of the messages at all the block boundaries so far,
  starting with an empty history. Write $V$ for the incoming history and $W = \( V \, Z \)$ for the history after
  the next message.

The message records the ending program state or, if the program halted within the block,
  the layer of that block and final state; it can be a dummy message in subsequent blocks.
  An initial state is fixed. This scheme also permits recording if halted at the start.
  Thus conditional on $V$ there are at most $\( n + 2 \) 2^M + 1$ messages.
  Given $V \, A \, b$ the next message can be formed, and $A$ is fresh and independent of $V \, U$.
  The final history determines the output.

There are $O \( d \)$ blocks by the preceding reduction. The message alphabet therefore bounds the entropy of
  every history by $O \( d^3 \)$. This bound will control the scale selectors below.
  The complete history need not be available in program memory.

For a history $V$, let $p_v = Pr \( V = v \)$, and write $mu_v$ for the conditional law of $U$ given $v$,
  with density $f_v$ with respect to $sigma$. Throughout we ignore conditioning states of probability zero.
  These densities exist and can be taken bounded by $1 \/ p_v$, since the marginal law is $sigma$.
  Write $I_V = I \( U \; V \) = bb(E) log f_V \( U \)$; use the analogous notations for $W$.
  We will track information with a correction for local concentration:
  a log cell-mass quantity $J_V$ below will be subtracted from $I_V$ in bounding its growth per block.

Define levels $j gt.eq 0$ of cells of scale $r_j = 2^(1 - j)$. Level 0 consists of the whole sphere.
  For $j gt.eq 1$ use the sphere intersected with a partition into half-open grid cubes of side $r_j \/ sqrt(d)$.
  Denote the cell containing $u$ by $C_j \( u \)$; each cell has diameter at most $r_j$ and $sigma$-measure at
  most $\( 2 r_j \)^(d - 1)$. For any of our probability laws $mu = mu_v$ define

$ m_mu \( u \) = max_(j gt.eq 0) frac(mu \( C_j \( u \) \), r_j^alpha) . $

In fact $m_mu gt.eq 2^(- alpha)$ and the terms for large $j$ are bounded by $2^(d - 1) r_j^(d - 1 - alpha) \/
  p_v$. Let $j_v \( u \)$ choose the first level giving the maximum. It is bounded for each $v$ by

$ 1 + frac(log_2 \( 1 \/ p_v \) + d - 1 + alpha, d - 1 - alpha) . $

Together the selector and the selected cell define a partition for each $v$,
  with parts $D$ consisting of points having the same selector and selected cell.
  When speaking of the random part $D$ we include its identification by this choice (given $v$).
  Denote by $p_D = mu_v \( D \)$ its probability, by $j = j_v \( U \)$ the chosen level, and by $p_C =
  mu_v \( C_j \( U \) \)$ the original cell probability. Then

#[#set math.equation(numbering: n => "(181)")
 $ bb(E) log \( p_C \/ p_D \) lt.eq H \( j divides V \) . $ <lc:cell-eq1>]

Indeed conditional on $v \, j$, $p_D$ is the selector probability given $v$ times the probability of the cell
  given $v \, j$. The expected log of its ratio with $p_C$, in the order in (181),
  equals the surprisal of the selector given $v$ minus a nonnegative relative entropy for the cell distributions
  (at level $j$).

We record some finiteness and entropy bounds. By the bound on the selector and $bb(E) log \( 1 \/ p_V \) =
  H \( V \)$, Jensen’s inequality gives $H \( j divides V \) = O \( log d \)$.
  Also $H \( D divides V \) < oo$; the log of the number of cells at level $j$ meeting the sphere is
  $O \( d \( 1 + j \) \)$. For this count, the disjoint cubes are within the ambient ball of radius $1 + r_j$;
  the ambient unit ball has volume $lt.eq \( C \/ sqrt(d) \)^d$,
  as seen for example by integrating $e^(- parallel x parallel^2 \/ 2)$ on the ball of radius $sqrt(d)$.
  The same entropy bounds apply with $W$ in place of $V$. In addition, the bin

$ t = floor.l log_2 m_(mu_W) \( U \) floor.r $

has $H \( t divides W \) = O \( log d \)$: the range for each $w$ has size $O \( d + log \( 1 \/ p_w \) \)$,
  by the selector bound, the lower bound $2^(- alpha)$ and $mu_w \( C_j \) lt.eq 1$.
  The use of $O \( log d \)$ here and above uses $H \( V \) \, H \( W \) lt.eq O \( d^3 \)$.

Set $J_V = bb(E) log m_(mu_V) \( U \)$. All such expectations are finite by the preceding bounds.
  Our objective on each block is

$ \( I_W - J_W \) - \( I_V - J_V \) lt.eq C d . $

We first show that the correction removes at most half the information, up to $O \( d \)$.
  Once the block estimate is proved, this coercivity will turn its iteration into a bound on the information in
  the final history.

#thm([Lemma 13.1.])[
  (Coercivity of the cell correction).  #emph[For the conditional laws and selected-cell partition just defined,
#[#set math.equation(numbering: n => "(182)")
 $ J_V lt.eq frac(alpha, d - 1) I_V + O \( d \) . $ <lc:cell-eq2>]

]
] <lc:cell-coercivity>

#proof[
  For the selected cell $C$,
  $ log m_(mu_v) \( U \) lt.eq frac(alpha, d - 1) log frac(p_C, sigma \( C \)) + alpha log 2 \, $
  using $sigma \( C \) lt.eq \( 2 r_j \)^(d - 1)$ and $log p_C lt.eq 0$.
    The log ratio here is at most $log \( p_D \/ sigma \( D \) \) + log \( p_C \/ p_D \)$.
    The expected first term is at most $I_V$ by relative entropy under the partition for each $v$;
    (181) bounds the other term. Since $alpha \/ \( d - 1 \) = 1 \/ 2$,
    the correction removes at most half the information, up to an additive $O \( d \)$. ◻
]

We will group points according to bounds on $m_mu$ when taking projections.
  For any restriction of $mu$ to a set with $m_mu lt.eq m_0$, the resulting subprobability $eta$ satisfies

#[#set math.equation(numbering: n => "(183)")
 $ eta \( B \( x \, r \) \) lt.eq C^d m_0 r^alpha wide \( x in bb(R)^d \, med r > 0 \) \, $ <lc:cell-eq3>]

where here $B \( x \, r \)$ is an ambient ball. For $r lt.eq 1$, take a level $j gt.eq 1$ with $r lt.eq r_j lt.eq
  2 r$; a ball of radius $r$ meets at most $C^d$ cubes, by their side length and the volume bound applied to
  radius $r + r_j$. Each cube contributing mass has $mu$-mass at most $m_0 r_j^alpha$.
  For $r > 1$ use the mass bound 1 and $m_0 gt.eq 2^(- alpha)$ if the set is nonempty.

=== 13.2 Inverse volumes at arbitrary length scales <lc:cell-inverse-section>

#thm([Lemma 13.2.])[
  (Inverse volume without a support restriction).  #emph[Let $n = k =
    floor.l d \/ 100 floor.r$ and $alpha = \( d - 1 \) \/ 2$, with $d$ sufficiently large.
    Suppose a Borel probability $nu$ on $bb(R)^d$ satisfies $nu \( B \( x \, r \) \) lt.eq r^alpha$ for all $x \,
    r$. Fix any $u$, draw $z_1 \, dots.h \, z_k$ independently from $nu$,
    and denote by $S$ the $k$-volume of the parallelepiped of $z_1 - u \, dots.h \, z_k -
    u$ (the square root of the Gram determinant). There is an absolute constant $C$ such that
#[#set math.equation(numbering: n => "(184)")
 $ bb(E) S^(- n) lt.eq exp \( C d k \) . $ <lc:cell-eq4>]

]
] <lc:cell-inverse>

#proof[
  The volume is positive almost surely, since $nu$ gives zero mass to affine spaces of dimension $i < alpha$.
    This last fact follows by covering any bounded portion by $O \( r^(- i) \)$ balls of radius $r$ as $r arrow.b
    0$, and suffices by conditioning successively on the previous draws.
  We order the vectors $z_i - u$ greedily, taking at each step one of largest distance to the span of those
    preceding. Every tuple admits such an ordering. By exchangeability,
    it suffices to bound the expectation restricted to the original order being greedy and multiply by $k !$;
    this also allows ties. In this order let $delta_i$ be the distance to the preceding span,
    with the norm used for the first vector. Then $S = product_i delta_i$, and the distances are nonincreasing.
    Fix their length bins
  $ 2^(- ell_i - 1) < delta_i lt.eq 2^(- ell_i) \, wide ell_1 lt.eq dots.h.c lt.eq ell_k \, quad ell_i in bb(Z) . $
  We will first bound the probability of these bins and the greedy conditions,
    then sum their contributions to the inverse volume.
  Given the first $i - 1$ draws, let $e_j$, $j < i$, be their translated vectors’ successive Gram–Schmidt axes.
    Group these axes according to $h = ell_j$. Greediness forces the projection of $z_i -
    u$ onto each group to have norm at most $2^(- h)$: before the first axis in that group was chosen,
    the residual norm of $z_i - u$ was no greater than the distance chosen at that step.
    Its residual norm after all preceding axes is at most $2^(- ell_i)$.
  In a group of dimension $a_h$, cover the ball of radius $2^(- h)$ by a net of radius $2^(- ell_i)
    2^(- \( ell_i - h \))$. Euclidean ball packing bounds its cardinality by
    $\( 3 dot.op 2^(2 \( ell_i - h \)) \)^(a_h)$. The distinct group indices are integers $h lt.eq ell_i$,
    so their squared net errors sum to at most
  $ 2^(- 2 ell_i) sum_(h lt.eq ell_i) 2^(- 2 \( ell_i - h \)) = 4 / 3 thin 2^(- 2 ell_i) . $
  Including the orthogonal residual, all allowed points $z_i$ therefore lie in at most $3^(i - 1)
    2^(2 sum_(j < i) \( ell_i - ell_j \))$ ambient balls of radius $2 dot.op 2^(- ell_i)$.
    These necessary constraints involve only the preceding draws and the fixed bins.
    The local ball bound gives their conditional probability at most
  $ 3^(i - 1) 2^alpha thin 2^(2 sum_(j < i) \( ell_i - ell_j \) - alpha ell_i) . $
  We may multiply these bounds sequentially, imposing only the necessary constraints just described and never
    conditioning preceding draws on future greedy choices. Use the local estimate when $ell_i gt.eq
    0$ and probability one otherwise. Put
  $ P = sum_i max \( ell_i \, 0 \) \, wide N = sum_i max \( - ell_i \, 0 \) . $
  The double sum in the product exponent satisfies
  $ sum_(i : ell_i gt.eq 0) sum_(j < i) \( ell_i - ell_j \) lt.eq
    sum_(i : ell_i gt.eq 0) (k ell_i + sum_(j : ell_j < 0) \( - ell_j \)) lt.eq k \( P + N \) . $
  Indeed, each inner sum is $\( i - 1 \) ell_i - sum_(j < i) ell_j$.
    Its first term is at most $k ell_i$, subtracting nonnegative $ell_j$ can only decrease it,
    and each negative index contributes at most $k$ times. The probability of the greedy and length conditions is
    consequently at most
  $ exp \( C d k \) thin 2^(- \( alpha - 2 k \) P + 2 k N) . $
  On these bins, $S^(- n) lt.eq 2^(n k) 2^(n \( P - N \))$.
    When negative bins dominate, the large distances already make this inverse volume small;
    otherwise the local probability bound supplies the needed decay.
    For $N lt.eq 2 P$, combining the two bounds gives the exponent
  $ - \( alpha - 2 k - n \) P + \( 2 k - n \) N lt.eq - \( alpha - 6 k - n \) P - n N lt.eq - \( P + N \) \, $
  since $alpha - 6 k - n gt.eq 3$ and $n gt.eq 3$ for large $d$. For $N > 2 P$, use probability at most one:
    then $n \( P - N \) lt.eq - \( P + N \)$, because $\( n + 1 \) P lt.eq \( n - 1 \) N$ for $n gt.eq 3$.
    Thus either region contributes at most $exp \( C d k \) 2^(- \( P + N \))$.
    The sum of $2^(- \( P + N \))$, even over all integer tuples, is $3^k$.
    This factor and $k !$ are absorbed by $exp \( C d k \)$, proving (184) at arbitrary length scales. ◻
]

The inverse-volume estimate now controls a projection density at a prescribed target,
  even when that target lies outside the support of the projected measure.

#thm([Lemma 13.3.])[
  (A fixed-target Gaussian moment).  #emph[For a subprobability $eta lt.double
    sigma$ on the sphere satisfying (183), let $q = eta \( S^(d - 1) \) > 0$.
    For Gaussian $A$ write $g_(eta \, A)$ for the Lebesgue density of $A z$ under $eta$.
    Such densities exist almost surely since $A$ has rank $n < d - 1$ and they exist for $sigma$.
    We may evaluate a version by the liminf of mass densities on shrinking cubes (say radii $1 \/ l \, med
    l arrow.r oo$), which gives the Lebesgue density almost everywhere by differentiation.
    With this latter evaluation, for every fixed $u$ we have
#[#set math.equation(numbering: n => "(185)")
 $ bb(E)_A g_(eta \, A) \( A u \)^k lt.eq [exp \( C d \) q^(1 - n \/ alpha) m_0^(n \/ alpha)]^k . $ <lc:cell-eq5>]

]
] <lc:cell-moment>

#proof[
  Take $k$ independent draws from $eta \/ q$. By (183), scaling the space (also scaling $u$) by
    $\( C^d m_0 \/ q \)^(1 \/ alpha)$ makes (184) applicable.
    In the original space the bound for $bb(E) S^(- n)$ is multiplied by $\( C^d m_0 \/ q \)^(k n \/ alpha)$.
    For fixed draws, the probability that all $parallel A \( z_i - u \) parallel_oo lt.eq
    a$ is bounded by $\( 2 a \)^(n k) \( 2 pi \)^(- n k \/ 2) S^(- n)$,
    by the maximum Gaussian density in $k$ coordinates for each row.
    The $A$-expectation of the cube mass to the power $k$ is $q^k$ times the draws’ average of this event
    probability. Thus we get (185) for the mass divided by $\( 2 a \)^n$ in place of the density.
    Fatou’s lemma proves it for the liminf. Constants use that $n \/ alpha$ is bounded. ◻
]

=== 13.3 Comparing incoming and outgoing fibers <lc:cell-fibers>

We return to $V \, W \, A \, b$ on the block and write $beta = n \/ alpha$.
  We use the same incoming selected part in both conditional signal laws.
  Its change in probability can then be charged to the information gained by the block, as we spell out below.
  Thus all parts $D$ in this comparison use the partition from $V$; let $r = r_j$ be the selected scale.
  Use these two densities evaluated at $b$:

- $g_(v \, D \, A)$ for the projection by $A$ of $mu_v$ restricted to $D$;
- $g_(w \, D \, t \, A)$ for the projection of $mu_w$ restricted to $D ∩ { z :
  floor.l log_2 m_(mu_w) \( z \) floor.r = t }$.

As random quantities the indices here take their actual values.
  Put $q_D = mu_w \( D \)$, and denote by $q_(D t)$ this last restriction’s mass.
  They are positive almost surely for the actual indices. Because $D$ is determined by $\( V \, U \)$ and $V$ is
  retained in $W = \( V \, Z \)$, its probability change satisfies

#[#set math.equation(numbering: n => "(186)")
 $ bb(E) log \( q_D \/ p_D \) = I \( D \; Z divides V \) lt.eq I \( U \; Z divides V \) = I_W -
   I_V . $ <lc:cell-mass-change>]

The projection bounds will attach the coefficient $1 - beta$ to this term,
  leaving a positive fraction of the information gain to control.

At fixed full rank $A$, let $g_(0 \, A)$ be the projected density from $sigma$,
  and let $lambda_(A \, b)$ be the corresponding conditional probability on the fiber at $b$.
  In orthonormal row-space coordinates the $sigma$-projection has density
  $c_(d \, n) \( 1 - parallel x parallel^2 \)^(\( d - n - 2 \) \/ 2)$ in the unit ball,
  and the remaining component is conditionally uniform on its sphere.
  These facts follow, for example, by normalizing a standard Gaussian to generate $sigma$ and splitting it into
  the two orthogonal spaces; the squared lengths before normalization are independent chi-squares.
  Transforming the row-space coordinates to $b$ multiplies the density by $det \( A A^top \)^(- 1 \/ 2)$.
  The fiber probabilities can be taken measurably by adding to the fixed row-space component a suitably scaled,
  normalized Gaussian projection in the null space.

For a restricted density $f upright(bold(1))_E$ relative to $sigma$, a projected density version is

$ g_(0 \, A) \( b \) integral f upright(bold(1))_E thin d lambda_(A \, b) $

where $g_(0 \, A) > 0$, and zero outside. We use this version for conditional probability formulas.
  It agrees with the differentiation version almost everywhere for Lebesgue $b$ at almost every $A$.
  The versions also agree when needed in the actual variables:
  the law of $\( A \, b \)$ is absolutely continuous with respect to Gaussian $A$ times Lebesgue measure,
  and there are finitely many history choices and countably many sets used here.

We first lower bound the expected log of the incoming restricted projection density:

#[#set math.equation(numbering: n => "(187)")
 $ bb(E) log g_(v \, D \, A) \( b \) med gt.eq med \( 1 - beta \) bb(E) log p_D + beta J_V -
   beta H \( j divides V \) - O \( n \) . $ <lc:cell-eq6>]

Given $V \, D \, A$, the density of $b$ is $g_(v \, D \, A) \/ p_D$, since $A$ is independent of $U \, V$.
  Take $c$ to be the grid cube center (0 at level 0), so $parallel U - c parallel lt.eq r$.
  Compare this conditional density with a Gaussian of center $A c$ and covariance $r^2 I_n$.
  Nonnegativity of relative entropy gives

$ bb(E) log g_(v \, D \, A) \( b \) med gt.eq med bb(E) \[ log p_D - n log r \] - O \( n \) . $

Here $bb(E) \[ parallel A \( U - c \) parallel^2 \/ r^2 divides V \, D \] lt.eq n$. The identity

$ log p_D - n log r = \( 1 - beta \) log p_D + beta log m_(mu_v) \( U \) - beta log \( p_C \/ p_D \) $

and the selector entropy bound (181) give (187).

#thm([Lemma 13.4.])[
  (Comparison on the exact observation fiber).  #emph[With the incoming selected part $D$, outgoing mass bin $t$,
    and density versions specified above,
#[#set math.equation(numbering: n => "(188)")
 $ I_W - I_V med lt.eq med bb(E) log g_(w \, D \, t \, A) \( b \) - bb(E) log g_(v \, D \, A) \( b \) +
   H \( t divides W \, D \) . $ <lc:cell-eq7>]

]
] <lc:cell-fiber-comparison>

#proof[
  Conditional on $V \, D \, A \, b \, W$, the density of $U$ relative to $lambda_(A \, b)$ is
  $ f_v upright(bold(1))_D thin g_(0 \, A) \( b \) \/ g_(v \, D \, A) \( b \) \, $
  since the message given $V \, A \, b$ no longer depends on $U$. Compare on this fiber with the subprobability density
  $ sum_(t') q_(D t') / q_D thin f_w upright(bold(1))_(D \, med t') thin g_(0 \, A) \( b \) \/
    g_(w \, D \, t' \, A) \( b \) $
  where zero-denominator terms are omitted, and the indicator restricts to the specified bin of $m_(mu_w)$ as well
    as to $D$. Each included fiber density before its mixing weight has integral one.
    Omitting bins can only reduce the total mass, so the displayed mixture is a subprobability.
  On the actual draw, the term of its bin has positive denominator almost surely.
    Indeed, a zero denominator with $g_(0 \, A) \( b \) > 0$ makes $f_w
    upright(bold(1))_(D \, med t')$ zero $lambda_(A \, b)$-almost everywhere.
    The actual conditional law is absolutely continuous on the fiber, and $f_w \( U \) > 0$ almost surely.
    The log ratio of the true density to the comparison density is therefore
  $ log frac(f_v \( U \), f_w \( U \)) + log frac(g_(w \, D \, t \, A) \( b \), g_(v \, D \, A) \( b \)) -
    log q_(D t) / q_D . $
  The last term averages to $H \( t divides W \, D \)$. Once integrability is verified,
    the nonnegative expectation of this log ratio gives (188), by Jensen on each fiber against the subprobability.
  We verify the logarithmic integrability needed here and in (187).
    The log densities $log f_V \( U \)$ and $log f_W \( U \)$ are integrable by the state probability bounds and
    $x log^(-) x lt.eq 1 \/ e$ for densities relative to a probability.
    Both projection densities have integrable positive log parts:
    they are bounded above by $g_(0 \, A) \/ p_v$ or $g_(0 \, A) \/ p_w$, and
  $ g_(0 \, A) lt.eq c_(d \, n) det \( A A^top \)^(- 1 \/ 2) $
  has integrable positive log part. For this last assertion,
    Gram–Schmidt on Gaussian rows gives squared successive distances with conditional chi-square laws and
    integrable logarithms.
  For the incoming density $g_(v \, D \, A)$, the Gaussian comparison also bounds the negative log part.
    A log density ratio under its numerator law has expected negative part at most $1 \/
    e$ when compared to a probability. The Gaussian comparison density has integrable negative log part by $r
    lt.eq 2$ and the squared norm estimate, while $- log p_D$ has finite expectation.
    Thus $log g_(v \, D \, A) \( b \)$ is integrable.
  The displayed fiber log ratio now has integrable positive part, using the outgoing positive log bound,
    the incoming integrability, and the finite expected surprisal for $t divides W \, D$.
    Its expected negative part is at most $1 \/ e$, which remains true for comparison with a subprobability.
    The log ratio is therefore integrable, and its displayed decomposition also gives integrability of $log
    g_(w \, D \, t \, A) \( b \)$. This justifies (188). ◻
]

We have compared the two fiber laws. The remaining step is to charge the correlation between the outgoing history
  and this fresh Gaussian block; the earlier blocks will carry no additional charge here.

To upper bound the target projection term, change the joint law $Q$ of $U \, W \,
  A$ to a reference $R$ that keeps the joint $U \, W$ but makes $A$ independent Gaussian.
  The relative entropy cost satisfies

$ D_(upright("KL")) \( Q parallel R \) = I \( A \; U \, W \) = I \( A \; Z divides U \, V \) lt.eq M log 2 +
  O \( log d \) \, $

by freshness and the message alphabet. Under $R$, condition on $U \, W$ to fix all indices.
  Apply (185) to the indicated restriction of $mu_w$, using (183) with $m_0 = 2^(t + 1) lt.eq
  2 m_(mu_w) \( U \)$ and mass $q_(D t) lt.eq q_D$. Thus the variable

$ X = frac(g_(w \, D \, t \, A) \( A U \), q_D^(1 - beta) m_(mu_w) \( U \)^beta) $

has $bb(E)_R X^k lt.eq exp \( C d k \)$. Here one can use the differentiation version in (185),
  which suffices also by version agreement under $Q$; $log X$ is integrable under $Q$ by the bounds above (also
  $H \( D divides W \) lt.eq H \( D divides V \)$). The entropy bound $k bb(E)_Q log X lt.eq
  D_(upright("KL")) \( Q parallel R \) + log bb(E)_R X^k$ follows from Jensen’s inequality with the likelihood
  ratio. This is the locally justified entropy variational inequality (2);
  its unbounded logarithm is integrable by the preceding fiber calculation.
  Since $k$ is proportional to $d$ and $M lt.eq d^2$, we have proved

#[#set math.equation(numbering: n => "(189)")
 $ bb(E) log g_(w \, D \, t \, A) \( b \) med lt.eq med \( 1 - beta \) bb(E) log q_D + beta J_W +
   O \( d \) . $ <lc:cell-eq8>]

Combining (187)–(189) and the selector and bin entropy bounds gives

$ I_W - I_V med lt.eq med \( 1 - beta \) bb(E) log \( q_D \/ p_D \) + beta \( J_W - J_V \) + O \( d \) . $

Since $0 < beta < 1$, the shared-part bound (186) can be absorbed on the left:

$ beta \( I_W - I_V \) lt.eq beta \( J_W - J_V \) + O \( d \) . $

The ratio $beta = n \/ alpha$ tends to $1 \/ 50$, so it is bounded away from zero.
  Dividing by it proves the block estimate

#[#set math.equation(numbering: n => "(190)")
 $ \( I_W - J_W \) - \( I_V - J_V \) lt.eq O \( d \) . $ <lc:cell-eq9>]

Using incoming cells both in the incoming projection bound and in restricting the target is useful here:
  their probability change costs only a fraction of the information gain itself.
  Binning the target by local cell mass allows the random projection estimate without assuming an isotropic or
  single-scale conditional law.

=== 13.4 Information growth and decoding <lc:cell-endgame>

Initially $I_V = 0$ and $- J_V lt.eq alpha log 2$. By (190), and (182) with $alpha \/ \( d - 1 \) = 1 \/ 2$,
  the final history has information at most

$ C d \( 1 + ceil.l T \/ n ceil.r \) lt.eq C' \( d + T \) . $

On the other hand compare its joint law with $U$ to the product of their marginals on the event of chord error at
  most $epsilon.alt$ for its output. The joint probability is at least $3 \/ 5$,
  while the product probability is at most $epsilon.alt^(d - 1)$ by the cap bound.
  Information, by relative entropy on this binary event, is at least $\( 3 \/ 5 \) \( d - 1 \) L - log 2$.
  It follows that $T gt.eq c d L - C'' d$ for absolute constants with $c > 0$.
  For large $L$ this yields the desired bound directly, and for the remaining bounded $L$ it follows by $T > d \/
  20$ shown earlier.

All block projections and fiber laws used here are for the exact, noiseless data.
  The cost constraint used on a block message follows from the bit-state bound even when computation on the data
  within transitions is unrestricted. This completes this independent information proof of the sample lower bound.

#bibliography("refs.bib", style: "ieee", title: [References])
