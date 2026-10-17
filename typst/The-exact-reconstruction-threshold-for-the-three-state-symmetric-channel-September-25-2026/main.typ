#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The exact reconstruction threshold \
for the three-state symmetric channel]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The reconstruction problem asks whether many distant, noisy descendants retain information about their common ancestor. On a tree, the growth in the number of descendants competes with the loss of information across each edge. For a symmetric channel with nontrivial eigenvalue $lambda$ and mean offspring number $d$, the Kesten–Stigum condition $d lambda^2 > 1$ gives reconstruction. Whether this condition is also necessary depends on the channel. We determine the answer for three states at every branching parameter in two basic tree families. Through existing tree-to-graph and algorithmic results, the Poisson theorem also determines the weak-recovery threshold for the symmetric three-community sparse stochastic block model with positive connectivity parameters and mean degree greater than one.

=== 1.1 Model and result <model-and-result>

Let the root spin $sigma_rho$ be uniform on ${ 1 \, 2 \, 3 }$. Along each edge, independently conditional on its parent spin, transmit through

#[#set math.equation(numbering: n => "(1.1)")
 $ K_lambda \( i \, j \) = cases(delim: "{", \( 1 + 2 lambda \) \/ 3 \, & i = j \,, \( 1 - lambda \) \/ 3 \, & i eq.not j \,) #h(2em) - 1 / 2 lt.eq lambda lt.eq 1 . $ <eq:channel>]

The tree is either the rooted $b$-ary tree, with an integer $b gt.eq 2$ children at every vertex, or a Galton–Watson tree with independent $"Pois" \( d \)$ offspring counts, where $d > 1$. For the regular model set $d = b$. The tree is independent of the root spin. The observation at depth $ell$ consists of the unlabelled tree $T_(lt.eq ell)$ through that depth together with the spins attached to its vertices $partial T_ell$ at depth $ell$; neither interior spins nor an ordering of siblings are observed. Define

#[#set math.equation(numbering: n => "(1.2)")
 $ a_ell = bb(E) ∥bb(P) \( sigma_rho = dot.op divides T_(lt.eq ell) \, sigma_(partial T_ell) \) - "Unif" { 1 \, 2 \, 3 }∥_(upright("TV")) . $ <eq:advantage>]

In the Poisson case this expectation includes both the tree and the spins, #emph[without conditioning on survival]. Reconstruction means $lim_(ell arrow.r oo) a_ell > 0$; non-reconstruction means that this limit is zero. The limit exists by information degradation.

#thm([Theorem 1.1.])[
  (Exact threshold).  #emph[For every integer $b gt.eq 2$ in the regular model and every real $d > 1$ in the Poisson model, reconstruction occurs if and only if 
$ d lambda^2 > 1 \, $

 with $d = b$ in the regular case. At every admissible equality $d lambda^2 = 1$, there is non-reconstruction.]
] <thm:threshold>

Thus the positive threshold is $lambda = d^(- 1 \/ 2)$. On the negative side reconstruction occurs precisely when $d > 4$ and $- 1 \/ 2 lt.eq lambda < - d^(- 1 \/ 2)$. In particular, the three-coloring channel $lambda = - 1 \/ 2$ is non-reconstructible at branching parameter four in both models.

=== 1.2 History and significance <history-and-significance>

The branching-process work of Kesten and Stigum #cite(label("KestenStigum1966")) underlies the classical second-moment reconstruction bound. Broadcasting and its relation to the Ising model were developed by Evans, Kenyon, Peres, and Schulman #cite(label("EvansEtAl2000")). For more than two states, nonlinear information in the boundary can change the threshold. This possibility occurs for symmetric channels with five or more states #cite(label("Sly2011")) Theorem 1.2; the three-state assertion therefore needs more than the second-moment bound.

Mézard and Montanari #cite(label("MezardMontanari2006")) Conjecture 2 and the following paragraph predicted sharpness of the Kesten–Stigum bound for three-state symmetric channels of either sign up to a branching cutoff, and proposed the extension to all branching parameters. See also Conjecture 1 of Sly #cite(label("Sly2011")) for the all-degree regular-tree formulation. Sly proved this for all sufficiently large regular branching parameters, including non-reconstruction at equality #cite(label("Sly2011")) Theorem 1.1. Mossel, Sly, and Sohn established the corresponding large-mean Poisson-tree result, for both signs and including equality #cite(label("MosselSlySohn2025")) Theorem 1.12. At small degrees, Bhatnagar and Maneva developed finite representations of posterior laws and proved, among other bounds, non-reconstruction for three-colorings on the regular ternary tree #cite(label("BhatnagarManeva2011")) Theorem 12. Theorem 1 removes the large-branching restriction in these two tree families. It resolves the three-state regular-tree prediction in its all-degree form and includes the low-branching and coloring endpoints for the observed Poisson tree.

For the symmetric stochastic block model, the cavity-method analysis of Decelle, Krzakala, Moore, and Zdeborová predicted the Kesten–Stigum transition in the assortative three-community case #cite(label("DecelleEtAl2011")) Section IV.A. Ricci-Tersenghi, Semerjian, and Zdeborová gave further evidence for the three-state prediction for either sign, through local analysis of the posterior recursion and numerical cavity solutions #cite(label("RicciTersenghiEtAl2019")) Sections III.D.1 and IV.H. Mossel, Sly, and Sohn proved information-theoretic impossibility at and below the Kesten–Stigum bound for three or four communities when the mean degree is sufficiently large #cite(label("MosselSlySohn2025")) Theorem 1.5. Their tree-to-graph transfer has no large-degree restriction #cite(label("MosselSlySohn2025")) Theorem 2.1. Together with the above-threshold algorithm of Abbe and Sandon #cite(label("AbbeSandon2018")) Corollary 1 and Lemma 1, the Poisson part of our theorem therefore gives the exact three-community weak-recovery threshold stated in Corollary 2 below.

A related three-state model with branch-dependent couplings on a binary Cayley tree is studied by Mukhamedov and Akın #cite(label("MukhamedovAkin2026")). Their work concerns disordered translation-invariant Gibbs measures and their extremality; our theorem concerns the same homogeneous symmetric channel on every edge of the regular or observed Poisson tree.

=== 1.3 Proof strategy and its precedents <proof-strategy-and-its-precedents>

For a root posterior $p = \( p_1 \, p_2 \, p_3 \)$, write $m_i = 3 p_i$ and identify the three spin labels with $1 \, omega \, omega^2$, where $omega = e^(2 pi upright(i) \/ 3)$. The complex posterior mean and its two basic invariants are

$ zeta = p_1 + omega p_2 + omega^2 p_3 \, #h(2em) x = \| zeta \|^2 \, #h(2em) y = Re \( zeta^3 \) . $

The posterior recursion passes each child experiment through one edge and combines the resulting conditionally independent branch observations. Section 2 gives this recursion and proves that the limiting posterior law is a fixed point, including at the coloring endpoint. Non-reconstruction is equivalent to $bb(E) x = 0$ under that law. A linear estimator proves reconstruction above the threshold. Channel and offspring degradation reduce the converse to critical equality and the coloring case at branching parameter four.

At positive equality, Section 3 compares two expressions for the change of an entropy functional across the recursion. The expected symmetrized-entropy identity goes back to Formentin and Külske #cite(label("FormentinKulske2009Entropy")) Proposition 3.3 and equation (15). Our functional combines entropy and symmetrized entropy with a quadratic centered-logarithm term. The fixed-point identities express its change through the correlation generated by combining branches, while a radial inequality bounds it below by a positive multiple of $bb(E) x^2$. Moment estimates make these two bounds incompatible at a nonuniform limiting fixed point. Appendix 8 proves the radial inequality analytically. Related entropy methods include the sharp nonlinear information-contraction inequalities for the Potts channel and non-reconstruction criteria of Gu and Polyanskiy #cite(label("GuPolyanskiy2023")).

The negative argument separates small and large posterior moments. Sly’s large-branching proof already combines a moment estimate near the uniform posterior with a global Gaussian contraction, including a rigorous numerical verification #cite(label("Sly2011")) Section 1.5, Lemmas 4.7–4.8, and Appendix A. Here Section 4 proves a uniform quantitative gap: at every negative equality, any nonuniform symmetric fixed point satisfies $bb(E) x > 1 \/ 20$. Pair inequalities for $x$, $y$, and $x^2$ yield this gap through a moment bootstrap. Section 5 then uses weighted logarithm identities to exclude the remaining fixed points away from the coloring channel.

Near coloring, Section 6 constructs finite experiments that are more informative than the true boundary observation. It suffices for one such upper experiment to have $bb(E) x < 1 \/ 20$: the true limiting fixed point then falls below the gap and must be uniform. The upper recursion need not itself converge to the uniform experiment. Bhatnagar and Maneva introduced finite surveys of posterior laws and combined certified finite recursion with local contraction #cite(label("BhatnagarManeva2011")) Sections 3.1–3.3 and Theorem 12. Their construction includes completion by perfectly informative messages for omitted offspring tails and downward-rounded masses #cite(label("BhatnagarManeva2011")) Section 3.3, implementation remarks 1 and 4. We use this finite-experiment approach with the gap above and explicit three-state refinement kernels. Gu’s recent binary-hypertree work proves a related rigorous population-dynamics procedure and proposes a Potts extension based on degradation and local non-reconstruction #cite(label("Gu2026Hypertrees")) Sections 4 and 7.

The quantitative radial bound, uniform fixed-point gap, and exact certificates supply the estimates needed throughout the parameter range. The negative argument is computer-assisted: the polynomial, interval, and finite-experiment programs are printed in Appendix 11. Their mathematical interpretation and arithmetic bounds are proved in the text. All decimal constants denote exact terminating rationals, and no simulation estimate enters a certification decision. Section 7 assembles the tree classification; Table 1 there records the parameter ranges of its analytic and finite arguments.

=== 1.4 A consequence for community detection <sec:sbm>

We now use $a$ and $b$ for within- and between-community connectivity parameters, independently of the notation for regular branching above. Fix $a \, b > 0$ with $d = \( a + 2 b \) \/ 3 > 1$. For all sufficiently large $n$, choose $sigma_1 \, dots.h \, sigma_n$ independently and uniformly from ${ 1 \, 2 \, 3 }$. Conditional on these labels, form a graph $G_n$ on ${ 1 \, dots.h \, n }$ by including each unordered pair independently, with probability $a \/ n$ if its endpoints have the same label and $b \/ n$ otherwise. For two labelings $sigma \, hat(sigma) in { 1 \, 2 \, 3 }^n$, define their overlap by

$ "ov" \( sigma \, hat(sigma) \) = max_(pi in S_3) 1 / n sum_(v = 1)^n upright(bold(1))_({ hat(sigma)_v = pi \( sigma_v \) }) . $

The permutation accounts for the fact that the names of the communities cannot be recovered from the graph.

#thm([Corollary 1.2.])[
  (Exact weak-recovery threshold for three communities).  #emph[In the model above, the following statements hold.]
  + #emph[If $\( a - b \)^2 lt.eq 3 \( a + 2 b \)$, then every sequence of estimators $hat(sigma)_n$ using only $G_n$ and independent randomization satisfies 
$ lim_(n arrow.r oo) bb(E) "ov" \( sigma \, hat(sigma)_n \) = 1 / 3 . $

]
  + #emph[If $\( a - b \)^2 > 3 \( a + 2 b \)$, there are $epsilon > 0$ and an algorithm, allowed to depend on the fixed parameters $a \, b$, which runs in $O \( n log n \)$ time and satisfies 
$ bb(P) #h(-0.16667em) ("ov" \( sigma \, hat(sigma)_n \) gt.eq 1 / 3 + epsilon) arrow.r 1 . $

]
  #emph[Thus weak recovery is possible exactly under the strict inequality, and is information-theoretically impossible at equality.]
] <cor:sbm>

The proof of Corollary 2, including the passage from averaged tree non-reconstruction to the fixed-tree hypothesis of the transfer theorem, is given in Section 7.

== 2 Posterior experiments and reductions <fnd:section>

We represent the spin set by $cal(S) = { 1 \, omega \, omega^2 }$, where $omega = exp \( 2 pi upright(i) \/ 3 \)$, and write $S_v$ for the complex spin at a vertex $v$. In the probabilistic recursions, $D$ denotes an offspring count, and

#[#set math.equation(numbering: n => "(2.1)")
 $ d = bb(E) D \, #h(2em) alpha = frac(bb(E) \[ D \( D - 1 \) \], d^2) = cases(delim: "{", 1 - 1 \/ d \, & D equiv d = b \,, 1 \, & D tilde.op "Pois" \( d \) .) $ <fnd:offspring>]

All probabilities in the Poisson model are unconditional: the observed tree is part of the data, and extinction is not removed from the sample space.

=== 2.1 Observations, likelihoods, and posterior coordinates <observations-likelihoods-and-posterior-coordinates>

For calculations we construct the tree with ordered children. At each vertex, independently, we draw its offspring count and then the spins of its children through $K_lambda$. The root spin is uniform and is independent of all offspring counts. The resulting tree is locally finite almost surely. Let

$ O_ell = \( T_(lt.eq ell) \, \( S_v \)_(\| v \| = ell) \) $

denote its depth-$ell$ observation, initially with this auxiliary ordering retained. The unlabelled observation retains the rooted tree and its boundary-spin decoration, but forgets all sibling orders.

#thm([Lemma 2.1.])[
  (Removing sibling orders).  #emph[The ordered and unlabelled depth observations are equivalent for inference of the root spin. In particular, they have the same reconstruction advantage and the same distribution of the root posterior.]
] <fnd:ordered>

#proof[
  Fix a finite unlabelled boundary-decorated tree. Conditional on any specified root spin, the probabilities of all its distinct ordered representatives are equal. Indeed, a permutation of siblings permutes independent, identically distributed descendant constructions; summing over unobserved internal spins preserves this invariance. The group of such sibling permutations is transitive on the distinct representatives. Repeated representatives caused by identical subtrees have equal stabilizer multiplicities, so they do not alter the equality of these probabilities.
  Consequently, conditional on the unlabelled observation, the law of the ordering is independent of the root spin. Forgetting the ordering is a deterministic operation, and sampling an ordering from this conditional law is an operation that does not use the root spin. These two operations establish the claimed equivalence, including when the boundary is empty. ◻
]

An #emph[experiment] consists of a uniform spin $S in cal(S)$ and an observed datum $Y$. Write

#[#set math.equation(numbering: n => "(2.2)")
 $ p_i = bb(P) \( S = i divides Y \) \, #h(2em) m_i = 3 p_i \, #h(2em) v_i = m_i - 1 \, #h(2em) i in cal(S) . $ <fnd:posterior>]

Thus the likelihood vector $m$ takes values in the compact simplex

$ cal(M) = { \( m_i \)_(i in cal(S)) : m_i gt.eq 0 \, med sum_i m_i = 3 } . $

For coordinatewise expressions we use $chevron.l h chevron.r = 1 / 3 sum_(i in cal(S)) h_i$. When coordinates are written as numerical triples indexed by $0 \, 1 \, 2$, coordinate $i in { 0 \, 1 \, 2 }$ corresponds to the spin label $omega^i$. The complex posterior and its two basic invariants are

#[#set math.equation(numbering: n => "(2.3)")
 $ zeta = bb(E) \[ S divides Y \] = chevron.l i m_i chevron.r \, #h(2em) x = \| zeta \|^2 \, #h(2em) y = "Re" \( zeta^3 \) . $ <fnd:complex>]

Here the $i$ inside the coordinate average is the spin label, not the imaginary unit. Fourier inversion on the three-element group gives

#[#set math.equation(numbering: n => "(2.4)")
 $ v_i = zeta overline(i) + overline(zeta) i = 2 "Re" \( zeta overline(i) \) \, #h(2em) chevron.l v^2 chevron.r = 2 x \, #h(2em) chevron.l v^3 chevron.r = 2 y . $ <fnd:fourier>]

More precisely, each of the three coordinates satisfies

#[#set math.equation(numbering: n => "(2.5)")
 $ v_i^3 = 3 x v_i + 2 y \, #h(2em) product_(i in cal(S)) \( 1 + t v_i \) = 1 - 3 t^2 x + 2 t^3 y . $ <fnd:cubic>]

To verify the first identity, expand $\( zeta overline(i) + overline(zeta) i \)^3$ and use $i^3 = 1$. The second follows from $sum_i v_i = 0$, $sum_i v_i^2 = 6 x$, and $product_i v_i = 2 y$. The convex-hull constraint on $zeta$, together with $product_i m_i gt.eq 0$, gives

#[#set math.equation(numbering: n => "(2.6)")
 $ 0 lt.eq x lt.eq 1 \, #h(2em) \| y \| lt.eq x^(3 \/ 2) \, #h(2em) 1 - 3 x + 2 y gt.eq 0 . $ <fnd:invariant-bounds>]

For later use these also imply, when $x > 0$,

#[#set math.equation(numbering: n => "(2.7)")
 $ - 1 / 2 lt.eq r := y / x lt.eq 1 \, #h(2em) r^2 lt.eq x lt.eq frac(1, 3 - 2 r) . $ <fnd:ratio-domain>]

Indeed $\| r \| lt.eq sqrt(x) lt.eq 1$, and the last inequality in Equation (2.6) gives the upper bound on $x$. Combining the two bounds on $x$ gives $0 lt.eq 1 - 3 r^2 + 2 r^3 = \( 1 - r \)^2 \( 1 + 2 r \)$, and hence $r gt.eq - 1 \/ 2$.

The marginal law of a posterior likelihood vector is always balanced: $bb(E) m_i = 1$. Bayes’ formula states that its conditional law under input $i$ is tilted by $m_i$. More generally, for a bounded measurable function $g$ of the original datum,

#[#set math.equation(numbering: n => "(2.8)")
 $ bb(E) \[ g \( Y \) divides S = i \] = bb(E) \[ m_i \( Y \) g \( Y \) \] . $ <fnd:bayes-tilt>]

Conversely, every probability law $Q$ on $cal(M)$ satisfying $integral m_i thin Q \( d m \) = 1$ defines an experiment by taking $Q \( d m divides S = i \) = m_i Q \( d m \)$. Its posterior likelihood vector is precisely the observed $m$. Thus balanced laws on $cal(M)$ are sufficient to describe the experiments used below.

The posterior vector also loses no inferential information from an existing experiment. In fact $bb(P) \( S = i divides Y \, m \) = m_i \/ 3 = bb(P) \( S = i divides m \)$, so $S$ and $Y$ are conditionally independent given $m$. The original datum can therefore be conditionally simulated from $m$ without knowing $S$. All observation spaces here are standard Borel, so the required conditional kernels exist.

Our experiments are invariant under every permutation of the three spin labels. In complex coordinates these permutations are generated by $zeta mapsto omega zeta$ and $zeta mapsto overline(zeta)$. This invariance is retained by all the tree recursions and limits below.

#thm([Lemma 2.2.])[
  (Total variation and the posterior second moment).  #emph[For every posterior vector, 
#[#set math.equation(numbering: n => "(2.9)")
 $ frac(\| zeta \|, sqrt(3)) lt.eq ∥p - "Unif" \( cal(S) \)∥_(upright("TV")) lt.eq 2 / 3 \| zeta \| . $ <fnd:tv-pointwise>]

 Consequently, writing $mu_ell = bb(E) x_ell$ for the depth experiment and $a_ell$ for its mean total variation advantage, 
#[#set math.equation(numbering: n => "(2.10)")
 $ mu_ell / sqrt(3) lt.eq a_ell lt.eq 2 / 3 sqrt(mu_ell) . $ <fnd:tv-moment>]

 In particular, vanishing advantage is equivalent to vanishing posterior second moment.]
] <fnd:norms>

#proof[
  For any three real numbers with zero sum, half the sum of their absolute values equals their largest absolute value. Applying this to $v$ gives $parallel p - "Unif" \( cal(S) \) parallel_(upright("TV")) = max_i \| v_i \| \/ 3$. If $M = max_i \| v_i \|$, their squared sum is at most $2 M^2$: after choosing the coordinate of absolute value $M$, the other two have the opposite sign and their absolute values sum to $M$. Equation (2.4) therefore yields $6 x lt.eq 2 M^2$. The same equation gives $M lt.eq 2 \| zeta \|$, proving Equation (2.9). Now use $\| zeta \|^2 lt.eq \| zeta \|$ and Cauchy–Schwarz to obtain Equation (2.10). ◻
]

=== 2.2 The exact posterior recursion <the-exact-posterior-recursion>

Suppose $Y$ is a child experiment with likelihood vector $m$. The child spin has a uniform marginal, and the conditional law of $Y$ given parent spin $i$, relative to the child marginal law, has density

#[#set math.equation(numbering: n => "(2.11)")
 $ m_(e \, i) = sum_(k in cal(S)) K_lambda \( i \, k \) m_k = 1 + lambda \( m_i - 1 \) = 1 + lambda v_i . $ <fnd:edge>]

Thus the datum retains its original marginal law under the uniform parent prior. The edge operation sends

#[#set math.equation(numbering: n => "(2.12)")
 $ zeta mapsto lambda zeta \, #h(2em) x mapsto lambda^2 x \, #h(2em) y mapsto lambda^3 y . $ <fnd:edge-moments>]

To combine $n$ experiments that are independent conditional on a common input, let $Q_1 \, dots.h \, Q_n$ be their marginal likelihood laws. Under the #emph[product marginal law] $Q_1 ⊗ dots.h.c ⊗ Q_n$, set

#[#set math.equation(numbering: n => "(2.13)")
 $ W_i = product_(j = 1)^n m_(i \, j) \, #h(2em) Z = chevron.l W chevron.r = 1 / 3 sum_(i in cal(S)) W_i \, #h(2em) m_i^(upright("out")) = W_i / Z quad \( Z > 0 \) . $ <fnd:product>]

Conditional on input $i$, the joint datum has density $W_i$ relative to that product law. Averaging over the input gives the marginal density $Z$, and Bayes’ formula gives the last expression in Equation (2.13). In particular, $integral Z thin d \( Q_1 ⊗ dots.h.c ⊗ Q_n \) = 1$. The value of $m^(upright("out"))$ on ${ Z = 0 }$ may be set equal to $\( 1 \, 1 \, 1 \)$; this set has zero probability after the tilt. When $n = 0$, empty products are one, $Z = 1$, and the output is the uninformative vector $\( 1 \, 1 \, 1 \)$.

#thm([Proposition 2.3.])[
  (Density evolution).  #emph[Let $Q_ell$ be the marginal likelihood law of the depth-$ell$ root experiment. Then 
#[#set math.equation(numbering: n => "(2.14)")
 $ Q_(ell + 1) = cal(R)_(lambda \, D) \( Q_ell \) \, #h(2em) Q_0 = 1 / 3 sum_(i in cal(S)) delta_(3 upright(bold(e))_i) \, $ <fnd:law-recursion>]

 where $upright(bold(e))_i$ is the coordinate unit vector and, for every bounded measurable $f$, 
#[#set math.equation(numbering: n => "(2.15)")
 $ integral f thin d cal(R)_(lambda \, D) \( Q \) = sum_(n gt.eq 0) bb(P) \( D = n \) integral Z f \( m^(upright("out")) \) thin d Q^(⊗ n) . $ <fnd:operator>]

 In this formula Equation (2.13) is applied to $m_(i \, j) = 1 + lambda \( tilde(m)_(i \, j) - 1 \)$, where $tilde(m)_(dot.op \, j)$ are the independent vectors sampled from $Q$. Each conditional integral has total mass one. The operator preserves balanced laws and permutation symmetry.]
] <fnd:recursion>

#proof[
  Conditional on the offspring count and the parent spin, the child subtree observations are independent copies of the depth-$ell$ experiment passed through one edge. Equations (2.11) and (2.13) give their combination. The count is observed and independent of the parent spin, so it is mixed with its original law in Equation (2.15). For each $i$, the expectation of the output coordinate is $integral W_i thin d Q^(⊗ n) = 1$, proving balance. Relabelling the input coordinates commutes with every operation. At depth zero the root itself is observed, giving $Q_0$. Random subtree shapes are already included in each child datum; no additional conditioning or averaging convention is required. ◻
]

We say that one experiment is #emph[degraded] from another when its datum is obtained from the latter by a random kernel independent of the input spin. If $Y'$ is degraded from $Y$, their posterior likelihoods satisfy

#[#set math.equation(numbering: n => "(2.16)")
 $ m \( Y' \) = bb(E) \[ m \( Y \) divides Y' \] \, #h(2em) bb(E) Phi \( m \( Y' \) \) lt.eq bb(E) Phi \( m \( Y \) \) $ <fnd:conditional-jensen>]

for every integrable convex function $Phi$ of the posterior vector. This is the tower property followed by conditional Jensen. In particular it applies to total variation, $x$, and $x^2$: total variation is the convex function $max_i \| m_i - 1 \| \/ 3$, while $zeta$ is linear in $m$ and its squared and fourth powers of the modulus are convex. Applying degradation kernels separately to conditionally independent branches shows that edge transmission and branch composition preserve this order.

=== 2.3 Convergence, fixed points, and extinction <convergence-fixed-points-and-extinction>

#thm([Proposition 2.4.])[
  (The limiting posterior).  #emph[On a common realization of the tree and spins, the root posterior likelihood vectors $m^(\( ell \))$ converge almost surely to a vector $m^(\( oo \))$. Their laws converge weakly to a symmetric balanced law $Q_oo$ satisfying 
#[#set math.equation(numbering: n => "(2.17)")
 $ Q_oo = cal(R)_(lambda \, D) \( Q_oo \) . $ <fnd:fixed-point>]

 The advantages $a_ell$ and moments $mu_ell = bb(E) x_ell$ are nonincreasing and converge to their corresponding expectations under $Q_oo$. This holds throughout $- 1 \/ 2 lt.eq lambda lt.eq 1$, including parameters for which edge probabilities vanish.]
] <fnd:limit>

#proof[
  The observations $O_ell$ themselves do not generate a decreasing sequence of sigma-fields. Instead put
  $ cal(F)_ell = sigma \( O_k : k gt.eq ell \) . $
  Given $O_ell$, the shapes and spins below its boundary are generated independently of the root spin. This statement includes every finite collection of subsequent depth observations, and hence their generated sigma-field. Therefore
  $ bb(E) \[ upright(bold(1))_({ S_rho = i }) divides cal(F)_ell \] = bb(P) \( S_rho = i divides O_ell \) = 1 / 3 m_i^(\( ell \)) . $
  The reverse martingale convergence theorem, applied to these bounded indicators and the decreasing fields $cal(F)_ell$, gives almost-sure and $L^1$ convergence. The limit is the root posterior given $⋂_ell cal(F)_ell$. Every continuous function of the posterior converges in expectation by bounded convergence on the compact simplex. Moreover $m^(\( ell + 1 \)) = bb(E) \[ m^(\( ell \)) divides cal(F)_(ell + 1) \]$, so conditional Jensen proves the stated monotonicity. Lemma 3 transfers these conclusions to the required unlabelled observations.
  It remains to pass Equation (2.14) to the limit. For a fixed count $n$ and a bounded continuous $f$, the integrand $Z f \( m^(upright("out")) \)$ in Equation (2.15) is continuous where $Z > 0$. Give it the value zero where $Z = 0$. This extension is continuous, since
  $ \| Z f \( m^(upright("out")) \) \| lt.eq parallel f parallel_oo Z $
  and $Z$ is continuous and nonnegative. Weak convergence of the finite product laws therefore gives convergence of the integral for each fixed $n$, even at the coloring endpoint. The tail of the count mixture is uniformly bounded by
  #[#set math.equation(numbering: n => "(2.18)")
   $ lr(|sum_(n > M) bb(P) \( D = n \) integral Z f \( m^(upright("out")) \) thin d Q^(⊗ n)|) lt.eq parallel f parallel_oo bb(P) \( D > M \) \, $ <fnd:count-tail>]
  because each conditional tilted law has mass one. First truncate the count, then pass to the weak limit, and finally let $M arrow.r oo$. Thus $cal(R)_(lambda \, D)$ is weakly continuous on balanced laws. Since both $Q_ell$ and $Q_(ell + 1)$ converge to $Q_oo$, Equation (2.17) follows. ◻
]

Unless a different experiment is specified, we henceforth use

#[#set math.equation(numbering: n => "(2.19)")
 $ mu = bb(E) x \, #h(2em) nu = bb(E) x^2 \, #h(2em) eta = bb(E) y $ <fnd:limit-moments>]

for the limiting experiment. Its law is trivial precisely when $mu = 0$, since $x = 0$ is equivalent to $m = \( 1 \, 1 \, 1 \)$. By Lemma 4 and Proposition 6, non-reconstruction is equivalent to $mu = 0$.

#thm([Lemma 2.5.])[
  (Logarithms at interior channel parameters).  #emph[If $- 1 \/ 2 < lambda < 1$, every fixed point of $cal(R)_(lambda \, D)$ has strictly positive coordinates almost surely. Every polynomial in its coordinates and their logarithms is integrable under either offspring law in Equation (2.1).]
] <fnd:log-integrability>

#proof[
  For every $m in cal(M)$, its edge coordinates lie in $\[ c_(-) \, c_(+) \]$, where
  $ c_(-) = min \( 1 - lambda \, 1 + 2 lambda \) > 0 \, #h(2em) c_(+) = max \( 1 - lambda \, 1 + 2 lambda \) . $
  At count $n$, both $W_i$ and $Z$ lie in $\[ c_(-)^n \, c_(+)^n \]$. Hence
  #[#set math.equation(numbering: n => "(2.20)")
   $ \| log m_i^(upright("out")) \| lt.eq n log \( c_(+) \/ c_(-) \) . $ <fnd:log-bound>]
  The count has its original law in the tilted output construction, and either specified law has finite moments of every order. The coordinates themselves lie in $\[ 0 \, 3 \]$. The bound proves the assertion, and also bounds each centered log coordinate $log m_i - chevron.l log m chevron.r$ by $2 n log \( c_(+) \/ c_(-) \)$. At count zero all these logarithms are zero. No claim of this kind is needed at $lambda = - 1 \/ 2$. ◻
]

#thm([Lemma 2.6.])[
  (The extinction factor).  #emph[Let $s = 1$ in the regular model and let $s$ be the survival probability in the Poisson model. For the limiting experiment, 
#[#set math.equation(numbering: n => "(2.21)")
 $ mu^2 lt.eq s nu \, #h(2em) \| eta \| lt.eq sqrt(mu nu) . $ <fnd:survival-moments>]

 In the Poisson model with $d > 1$, $0 < s < 1$ and 
#[#set math.equation(numbering: n => "(2.22)")
 $ - log \( 1 - s \) = d s \, #h(2em) s lt.eq 2 \( 1 - 1 \/ d \) . $ <fnd:survival-equation>]

 In particular, at $d lambda^2 = 1$, $s lt.eq 2 \( 1 - lambda^2 \)$.]
] <fnd:survival>

#proof[
  On extinction the boundary is empty at all sufficiently large depths. An observation with empty boundary consists only of a tree shape, which is independent of the root spin; its posterior is uniform. Thus $x_oo = 0$ on extinction. Cauchy–Schwarz gives $mu = bb(E) \[ x_oo upright(bold(1))_({ upright("survival") }) \] lt.eq sqrt(s nu)$. Also $\| eta \| lt.eq bb(E) x^(3 \/ 2) lt.eq sqrt(mu nu)$ by Equation (2.6).
  For completeness, the extinction probability is the increasing limit of the probabilities of an empty generation. The offspring generating function gives it as the smallest solution $q in \[ 0 \, 1 \]$ of $q = exp \( d \( q - 1 \) \)$. Strict convexity and the derivative $d > 1$ at $q = 1$ show that this smallest solution belongs to $\( 0 \, 1 \)$. Setting $q = 1 - s$ proves the first identity in Equation (2.22). For $0 < s < 1$,
  $ - log \( 1 - s \) = sum_(k gt.eq 1) s^k / k gt.eq sum_(k gt.eq 1) s^k / 2^(k - 1) = frac(s, 1 - s \/ 2) \, $
  where $2^(k - 1) gt.eq k$. Dividing by $s$ and using the survival equation gives $d gt.eq \( 1 - s \/ 2 \)^(- 1)$, equivalently the second inequality in Equation (2.22). ◻
]

=== 2.4 Reconstruction above the second-moment threshold <reconstruction-above-the-second-moment-threshold>

#thm([Proposition 2.7.])[
  (A linear estimator).  #emph[In either model, $d lambda^2 > 1$ implies reconstruction, for either sign of $lambda$.]
] <fnd:supercritical>

#proof[
  The hypothesis implies $lambda eq.not 0$. Define the observable, order-independent estimator
  #[#set math.equation(numbering: n => "(2.23)")
   $ L_ell = \( d lambda \)^(- ell) sum_(\| u \| = ell) S_u \, #h(2em) L_0 = S_rho . $ <fnd:linear-estimator>]
  The sum is zero on an empty boundary. Since $bb(E) \[ S_(upright("child")) divides S_(upright("parent")) \] = lambda S_(upright("parent"))$, induction gives $bb(E) \[ L_ell divides S_rho \] = S_rho$.
  Let $L_ell^(\( j \))$ denote the corresponding estimator in the subtree rooted at child $j$. Then $L_(ell + 1) = \( d lambda \)^(- 1) sum_(j = 1)^D L_ell^(\( j \))$. Conditional on $S_rho$ and $D$, these variables are independent, and each has mean $lambda S_rho$. The diagonal terms in the squared modulus sum to $d bb(E) \| L_ell \|^2$; each ordered off-diagonal pair has expectation $lambda^2$. Consequently, with $q = \( d lambda^2 \)^(- 1) < 1$,
  #[#set math.equation(numbering: n => "(2.24)")
   $ bb(E) \| L_(ell + 1) \|^2 = q bb(E) \| L_ell \|^2 + alpha \, #h(2em) bb(E) \| L_ell \|^2 = q^ell + alpha frac(1 - q^ell, 1 - q) lt.eq 1 + frac(alpha, 1 - q) = : C . $ <fnd:estimator-recurrence>]
  The factor $alpha$ is the normalized factorial moment, rather than the normalized second moment, because it counts distinct branches.
  The correlation with the root equals one. Conditioning on the observed experiment and applying Cauchy–Schwarz gives
  $ 1 = bb(E) \[ L_ell overline(S_rho) \] = bb(E) \[ L_ell overline(zeta_ell) \] \, #h(2em) 1 lt.eq bb(E) \| L_ell \|^2 thin bb(E) \| zeta_ell \|^2 . $
  Thus $mu_ell gt.eq C^(- 1)$ at every depth, and Equation (2.10) gives $a_ell gt.eq \( sqrt(3) C \)^(- 1) > 0$. The limiting advantage exists by Proposition 6, so it is positive. In particular, this argument uses the original Poisson experiment, without conditioning on survival. ◻
]

=== 2.5 Decreasing the channel strength or the offspring mean <decreasing-the-channel-strength-or-the-offspring-mean>

#thm([Proposition 2.8.])[
  (Channel and offspring degradation).  #emph[At every finite depth, each of the following changes produces a degraded root experiment:]
  + #emph[replacing $lambda$ by $c lambda$, where $0 lt.eq c lt.eq 1$;]
  + #emph[replacing a regular offspring count $b_(+)$ by an integer $2 lt.eq b_(-) lt.eq b_(+)$;]
  + #emph[replacing a Poisson offspring mean $d_(+)$ by $0 < d_(-) lt.eq d_(+)$.]
  #emph[Consequently each change can only decrease the expected total variation advantage and the moments $bb(E) x$ and $bb(E) x^2$, both at finite depth and in their limits.]
] <fnd:degradation>

#proof[
  The channel admits a group-increment construction. On each edge $e$ take an independent $G_e in cal(S)$ with
  $ bb(P) \( G_e = 1 \) = frac(1 + 2 lambda, 3) \, #h(2em) bb(P) \( G_e = omega \) = bb(P) \( G_e = omega^2 \) = frac(1 - lambda, 3) \, $
  and set $S_v = S_rho product_(e in \[ rho \, v \]) G_e$. The increment law is invariant under conjugation and has mean $bb(E) G_e = lambda$. Independently generate increments $H_e$ with the same form of law at parameter $c$. A conjugation-invariant probability law on $cal(S)$ is uniquely determined by its real mean: if its mass at 1 is $p$, that mean is $\( 3 p - 1 \) \/ 2$. The independent products $G_e H_e$ are conjugation-invariant and have mean $c lambda$, so they have exactly the channel increment law for $c lambda$.
  Given only the observed tree through depth $ell$ and its boundary spins, generate the $H_e$’s on its edges and replace each boundary spin by
  $ S'_v = S_v product_(e in \[ rho \, v \]) H_e . $
  This kernel requires neither the root spin nor any unobserved internal spins, and the output has exactly the depth experiment for parameter $c lambda$. Shared path increments give the required joint law of the transformed boundary, not merely its individual marginals.
  For regular trees, in the ordered representation retain the first $b_(-)$ children at each retained vertex and discard the rest of their subtrees. The retained boundary and tree have the smaller regular experiment. For Poisson trees, independently keep each child of a retained vertex with probability $p = d_(-) \/ d_(+)$. If $D_(+)$ is its original count and $D_(-)$ its retained count, then
  $ bb(E) z^(D_(-)) = bb(E) \( 1 - p + p z \)^(D_(+)) = exp \( d_(-) \( z - 1 \) \) . $
  Independence across vertices and independence from the edge increments show that the retained observation has the Poisson broadcast law with mean $d_(-)$. These operations are performed only on the known tree and observed boundary; neither requires a survival event.
  By Lemma 3, an unlabelled observation can first be randomly ordered without accessing the root, and the final ordering can then be forgotten. All the preceding kernels are therefore valid for the unlabelled model as well. Their comparison of the stated quantities follows from Equation (2.16), and passes to the limits by Proposition 6. ◻
]

At $lambda = 0$, every positive-depth boundary is independent of the root conditional on the tree, so the advantage is zero. For each fixed $d$, Proposition 10 reduces the remaining subcritical channel parameters of either sign to their admissible equality parameters. Negative equality is admissible exactly when $d gt.eq 4$; for smaller branching parameters, non-reconstruction at the coloring channel $lambda = - 1 \/ 2$ and branching parameter four will imply all the needed negative-channel statements by the same proposition.

== 3 Positive channels at equality <sec:positive>

We prove that the limiting posterior is uniform when $0 < lambda < 1$ and $d lambda^2 = 1$. Throughout this section, $m$ has the limiting fixed-point law supplied by Proposition 6, $v = m - 1$, and

$ mu = bb(E) x \, #h(2em) nu = bb(E) x^2 \, #h(2em) eta = bb(E) y \, #h(2em) alpha = frac(bb(E) \[ D \( D - 1 \) \], d^2) . $

Thus $alpha = 1 - 1 \/ d$ for the regular model and $alpha = 1$ for the Poisson model. A subscript $e$ means evaluation at the edge message $m_e = 1 + lambda v$. We argue by contradiction, assuming $mu > 0$.

=== 3.1 An entropy identity with an additive correction <an-entropy-identity-with-an-additive-correction>

For a positive message of coordinate average one, define

#[#set math.equation(numbering: n => "(3.1)")
 $ I & = chevron.l m log m chevron.r \, & J & = 1 / 2 chevron.l v log m chevron.r \,\
u_i & = log m_i - chevron.l log m chevron.r \, & B & = 1 / 2 chevron.l m u^2 chevron.r . $ <pos:functionals>]

Here and below logarithms are natural. The expected additivity of $J$ below is the symmetric-channel form of the symmetrized-entropy recursion of Formentin and Külske #cite(label("FormentinKulske2009Entropy")) Proposition 3.3, equation (15): their functional equals $2 J$ in our normalization. We prove the identities needed here, including the centered-log correction $B$. Lemma 7 gives strictly positive fixed-point coordinates and integrability of these functions: their coordinate factors are bounded, and their logarithmic factors have degree at most two.

Under a fixed input spin $i$, tilting and permutation symmetry give

$ bb(E) \[ u_(e \, i) divides S = i \] = bb(E) chevron.l m_e u_e chevron.r = 2 bb(E) J_e \, #h(2em) bb(E) \[ u_(e \, i)^2 divides S = i \] = bb(E) chevron.l m_e u_e^2 chevron.r = 2 bb(E) B_e . $

Centered log coordinates add under products: the common normalizing constant disappears on centering. Conditional independence of the branches therefore gives

#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) J = d bb(E) J_e \, #h(2em) bb(E) B = d bb(E) B_e + 2 alpha \( bb(E) J \)^2 . $ <pos:additive>]

For clarity, the off-diagonal term in the second formula, before division by two, is $4 bb(E) \[ D \( D - 1 \) \] \( bb(E) J_e \)^2$.

For a product of $n$ edge experiments write $Z_n$ for its likelihood normalizer relative to their independent marginal laws, and set

$ H_n = bb(E)_(upright("prod")) \[ Z_n log Z_n \] \, #h(2em) H = bb(E) H_D . $

This is a relative entropy and is nonnegative. Expanding the logarithm of the normalized output likelihood gives

$ bb(E) I = d bb(E) I_e - H . $

Each branch retains its original marginal distribution after the joint likelihood tilt, which justifies the individual terms in this expansion. The combination

#[#set math.equation(numbering: n => "(3.3)")
 $ F = 3 I - 2 J + 4 / 5 B $ <pos:functional-F>]

therefore satisfies the exact identity

#[#set math.equation(numbering: n => "(3.4)")
 $ bb(E) \( F - d F_e \) = - 3 H + 8 / 5 alpha \( bb(E) J \)^2 . $ <pos:entropy>]

The useful feature of this combination is its positive radial defect: for every positive message of coordinate average one,

#[#set math.equation(numbering: n => "(3.5)")
 $ F \( m \) - lambda^(- 2) F \( 1 + lambda v \) gt.eq frac(1 - lambda^2, 2) x^2 #h(2em) \( 0 < lambda < 1 \) . $ <pos:radial>]

Lemma 23 proves this pointwise inequality by radial differentiation and explicit polynomial sign decompositions. Since $d = lambda^(- 2)$, its expectation and Equation (3.4) imply

#[#set math.equation(numbering: n => "(3.6)")
 $ frac(1 - lambda^2, 2) nu + 3 H lt.eq 8 / 5 alpha \( bb(E) J \)^2 . $ <pos:comparison>]

We will contradict this inequality by bounding $bb(E) J$ above and $H$ below. The additive identity for $J$ also restricts the possible values of $mu \, nu \, eta$; we establish those restrictions first.

=== 3.2 Moment information from the additive identity <moment-information-from-the-additive-identity>

The cubic identity in Equation (2.5), together with $chevron.l v chevron.r = 0$ and $chevron.l v^2 chevron.r = 2 x$, gives the additional moment relation

#[#set math.equation(numbering: n => "(3.7)")
 $ chevron.l v^4 chevron.r = 3 x chevron.l v^2 chevron.r + 2 y chevron.l v chevron.r = 6 x^2 . $ <pos:coordinate-identities>]

We also use $\| y \| lt.eq x^(3 \/ 2)$ from Equation (2.6).

#thm([Lemma 3.1.])[
  #emph[Put 
$ c_0 = 37 / 27 \, #h(2em) q = frac(c_0, 2 + lambda) \, #h(2em) c = c_0 + 2 lambda q . $

 Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ 0 lt.eq bb(E) J lt.eq mu - lambda q nu \, #h(2em) c nu lt.eq eta lt.eq sqrt(mu nu) . $ <pos:moment-estimates>]

 If $s = 1$ in the regular model and $s$ is the survival probability in the Poisson model, then 
#[#set math.equation(numbering: n => "(3.9)")
 $ mu^2 / s lt.eq nu lt.eq mu / c^2 \, #h(2em) mu lt.eq s / c^2 . $ <pos:moment-region>]

]
] <pos:moment-bounds>

#proof[
  The integral expression
  $ J = 1 / 2 chevron.l v^2 integral_0^1 frac(d t, 1 + t v) chevron.r $
  and $bb(E) J = lambda^(- 2) bb(E) J_e$ imply
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E) integral_0^1 t chevron.l frac(v^3, \( 1 + t v \) \( 1 + t lambda v \)) chevron.r thin d t = 0 . $ <pos:vanishing>]
  Indeed, the difference of the two integral expressions for $J$ and $lambda^(- 2) J_e$ is $- \( 1 - lambda \) \/ 2$ times this integrand. Define
  $ A = bb(E) integral_0^1 t^2 chevron.l frac(v^4, 1 + t v) chevron.r thin d t \, #h(2em) Q = 1 / 2 bb(E) integral_0^1 t^2 chevron.l frac(v^4, \( 1 + t v \) \( 1 + t lambda v \)) chevron.r thin d t . $
  Subtracting (3.10) from the corresponding integral expressions gives the exact formulas
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E) J = mu - lambda Q \, #h(2em) eta = A + 2 lambda Q . $ <pos:Q-identities>]
  For the first, use $mu - lambda^(- 2) bb(E) J_e = lambda / 2 bb(E) integral_0^1 t chevron.l v^3 \/ \( 1 + t lambda v \) chevron.r thin d t$. For the second, use $eta = bb(E) integral_0^1 t chevron.l v^3 chevron.r thin d t$. Both subtractions reduce to multiplication by the two positive denominators. All these integrals are absolutely integrable: the powers of $v$ are bounded, $1 + t lambda v gt.eq 1 - lambda$, and integration of the only possibly small denominator $1 + t v$ is controlled by $1 + \| log m_i \|$. Thus the previous logarithmic bounds justify the interchanges of expectations and integrals.
  For $x > 0$, put $r = sqrt(x) < 1$ and $k = y \/ r^3 in \[ - 1 \, 1 \]$. Using Equations (2.5) and (3.7),
  #[#set math.equation(numbering: n => "(3.12)")
   $ h \( t \) & = x^(- 2) chevron.l frac(v^4, 1 + t v) chevron.r = frac(6 - 10 t r k + 4 t^2 r^2 k^2, 1 - 3 t^2 r^2 + 2 t^3 r^3 k)\
 & gt.eq frac(6 - 4 t r, 1 + t r - 2 t^2 r^2) gt.eq 4 + 64 / 9 \( t r - 1 / 2 \)^2 . $ <pos:h-bound>]
  To verify the first inequality, write $z = t r < 1$. The numerator is positive and decreases as $k$ increases to $1$, while the denominator increases and remains positive. Evaluation at $k = 1$ gives the displayed fraction. For the second inequality use
  $ frac(6 - 4 z, 1 + z - 2 z^2) = 4 + frac(8 \( z - 1 \/ 2 \)^2, 1 + z - 2 z^2) \, #h(2em) 0 < 1 + z - 2 z^2 lt.eq 9 / 8 . $
  Since
  $ integral_0^1 t^2 \( t r - 1 / 2 \)^2 thin d t = frac(\( r - 5 \/ 8 \)^2, 5) + 1 / 192 \, $
  integration gives $integral_0^1 t^2 h \( t \) thin d t gt.eq 37 \/ 27 = c_0$. Consequently $A gt.eq c_0 nu$.
  At each $t$, assign the three coordinates weights proportional to $v_i^4 \/ \( 1 + t v_i \)$. Their weighted mean of $t v_i$ is
  $ frac(chevron.l v^4 chevron.r - chevron.l v^4 \/ \( 1 + t v \) chevron.r, chevron.l v^4 \/ \( 1 + t v \) chevron.r) = frac(6, h \( t \)) - 1 lt.eq 1 / 2 . $
  The function $z mapsto \( 1 + lambda z \)^(- 1)$ is convex and decreasing on the relevant interval. Jensen’s inequality therefore yields
  $ chevron.l frac(v^4, \( 1 + t v \) \( 1 + t lambda v \)) chevron.r gt.eq frac(2, 2 + lambda) chevron.l frac(v^4, 1 + t v) chevron.r . $
  Messages with $x = 0$ contribute zero throughout. Integrating proves $Q gt.eq A \/ \( 2 + lambda \) gt.eq q nu$. Now $J gt.eq 0$ pointwise, because $v_i log \( 1 + v_i \) gt.eq 0$. Equations (3.11), followed by Cauchy–Schwarz, prove
  $ 0 lt.eq bb(E) J lt.eq mu - lambda q nu \, #h(2em) c nu lt.eq eta lt.eq bb(E) x^(3 \/ 2) lt.eq sqrt(mu nu) . $
  Finally, Lemma 8 gives $mu^2 lt.eq s nu$. Squaring $c nu lt.eq sqrt(mu nu)$ gives $nu lt.eq mu \/ c^2$, and combining the two bounds gives the remaining assertion. ◻
]

=== 3.3 Correlation generated by successive branches <correlation-generated-by-successive-branches>

#thm([Lemma 3.2.])[
  #emph[In either offspring model, 
#[#set math.equation(numbering: n => "(3.13)")
 $ frac(3 H, alpha) gt.eq frac(3 mu^2, 2 \( 1 + 2 mu \/ 3 \)) - lambda / sqrt(2) mu nu . $ <pos:H-bound>]

]
] <pos:correlation-bound>

#proof[
  First consider two independent marginal experiments with posterior means $zeta_0$ and $zeta_e$, the latter an edge experiment. Their product normalizer is $1 + z$, where
  $ z = zeta_0 overline(zeta_e) + overline(zeta_0) zeta_e . $
  Writing $mu_0 = bb(E) \| zeta_0 \|^2$ and $eta_0 = bb(E) Re \( zeta_0^3 \)$, rotation and reflection symmetry give
  $ bb(E) z = 0 \, #h(2em) bb(E) z^2 = 2 mu_0 lambda^2 mu \, #h(2em) bb(E) z^3 = 2 eta_0 lambda^3 eta . $
  For $z > - 1$, Taylor’s theorem, with fourth derivative $2 \/ \( 1 + z \)^3 > 0$, gives
  $ \( 1 + z \) log \( 1 + z \) gt.eq z + z^2 / 2 - z^3 / 6 . $
  The inequality extends continuously to $z = - 1$. Thus the correlation increment $C_0$, itself a nonnegative relative entropy, satisfies
  #[#set math.equation(numbering: n => "(3.14)")
   $ 3 C_0 gt.eq 3 lambda^2 mu mu_0 - lambda^3 eta eta_0 . $ <pos:increment>]
  The increments telescope to total correlation by the identity for $I$.
  For the regular model, the partial experiment with a fixed number $j lt.eq d$ of branches is degraded from the full fixed-point experiment by discarding branches. For the Poisson model, the partial experiment is the whole mixture with observed count $N_t tilde.op "Pois" \( t \)$, $0 lt.eq t lt.eq d$; thinning the full experiment produces this mixture. The degradation comparison in the Poisson case is applied to this observed-count mixture. Conditional Jensen for the convex function $\| zeta \|^4$ consequently gives $bb(E) \| zeta_0 \|^4 lt.eq nu$, and hence
  $ eta_0 lt.eq sqrt(mu_0 nu) . $
  There is also a useful lower bound on $mu_0$. Put $beta = lambda^2 mu$. Each edge posterior mean $zeta_e$ has
  $ bb(E) \[ zeta_e divides S = i \] = i beta \, #h(2em) bb(E) \[ zeta_e overline(S) \] = bb(E) \| zeta_e \|^2 = beta . $
  The first identity follows by tilting by the edge likelihood and using rotation symmetry. For the sum $T_j$ of $j$ edge posterior means, conditional independence therefore gives
  $ bb(E) \[ T_j overline(S) \] = j beta \, #h(2em) bb(E) \| T_j \|^2 = j beta + j \( j - 1 \) beta^2 . $
  Conditioning on the entire partial observation and applying Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ mu_j gt.eq L_j := frac(j beta, 1 + \( j - 1 \) beta) #h(2em) \( j gt.eq 1 \) . $ <pos:projection>]
  Here $mu_j$ denotes its posterior second moment.
  We explain carefully how to substitute this lower bound into (3.14). Since $0 lt.eq eta lt.eq sqrt(mu nu)$, any partial product with $mu_0 gt.eq L > 0$ satisfies
  $ 3 C_0 gt.eq 3 lambda^2 mu mu_0 (1 - frac(lambda nu, 3 sqrt(mu mu_0))) . $
  The factor in parentheses is increasing in $mu_0$. If it is nonnegative at $L$, both factors can be bounded below at $L$. If it is negative there, the same resulting lower bound follows from $C_0 gt.eq 0$. In either case,
  #[#set math.equation(numbering: n => "(3.16)")
   $ 3 C_0 gt.eq 3 lambda^2 mu L - lambda^3 sqrt(mu) thin nu sqrt(L) . $ <pos:truncated-bound>]
  In the regular case use $L = L_j$, and note $sqrt(L_j) lt.eq lambda sqrt(j mu)$. Summing the increments yields
  $ 3 H gt.eq 3 lambda^4 mu^2 sum_(j = 1)^(d - 1) frac(j, 1 + \( j - 1 \) lambda^2 mu) - lambda^4 mu nu sum_(j = 1)^(d - 1) sqrt(j) . $
  Weighted Jensen, with weights proportional to $j$, uses
  $ lambda^2 frac(sum_(j = 1)^(d - 1) j \( j - 1 \), sum_(j = 1)^(d - 1) j) = frac(2 \( d - 2 \), 3 d) lt.eq 2 / 3 \, #h(2em) lambda^4 sum_(j = 1)^(d - 1) j = alpha / 2 . $
  Cauchy–Schwarz gives
  $ lambda^4 / alpha sum_(j = 1)^(d - 1) sqrt(j) lt.eq lambda^4 / alpha sqrt(\( d - 1 \) frac(d \( d - 1 \), 2)) = lambda / sqrt(2) . $
  These are precisely (3.13).
  For the Poisson model, let $N_t tilde.op upright("Pois") \( t \)$, $0 lt.eq t lt.eq d$, and let $h \( t \) = bb(E) H_(N_t)$. Because $H_n = n bb(E) I_e - bb(E) I_n$ and $0 lt.eq I_n \, I_e lt.eq log 3$ in expectation, $0 lt.eq H_n lt.eq n log 3$. The Poisson series can therefore be differentiated termwise on bounded intervals, giving
  $ h' \( t \) = bb(E) \( H_(N_t + 1) - H_(N_t) \) . $
  Thus $h' \( t \)$ is the expected correlation increment on adding one edge to the partial experiment of intensity $t$. Indeed, if $Z_n$ is the normalizer of the first $n$ branches and $Z_(n \, e)$ is the normalizer for their posterior experiment paired with the new edge, then $Z_(n + 1) = Z_n Z_(n \, e)$. Integrating the logarithm of this identity under the full likelihood tilt gives $H_(n + 1) - H_n = bb(E) \[ Z_(n \, e) log Z_(n \, e) \]$, where the expectation on the right is under the independent partial and edge marginals. Averaging over the observed Poisson count gives the asserted increment. The same projection proof, now using $bb(E) N_t = t$ and $bb(E) N_t \( N_t - 1 \) = t^2$, gives
  $ mu_t gt.eq L_t := frac(t beta, 1 + t beta) . $
  Thinning proves the required degradation and fourth-moment bound. Applying (3.16) for $t > 0$, integrating from $0$ to $d$, and using $h \( 0 \) = 0$, gives
  $ 3 H gt.eq 3 lambda^4 mu^2 integral_0^d frac(t thin d t, 1 + t lambda^2 mu) - lambda^4 mu nu integral_0^d sqrt(t) thin d t . $
  Weighted Jensen with weights $t thin d t$ uses $lambda^2 integral_0^d t^2 thin d t \/ integral_0^d t thin d t = 2 \/ 3$, while $lambda^4 integral_0^d t thin d t = 1 \/ 2$. The loss equals $\( 2 \/ 3 \) lambda mu nu$, which is at most $lambda mu nu \/ sqrt(2)$. As $alpha = 1$, this proves the claim. ◻
]

=== 3.4 The strict contradiction <the-strict-contradiction>

#thm([Proposition 3.3.])[
  #emph[At every positive equality parameter $d lambda^2 = 1$, the limiting posterior is uniform in both tree models. Consequently reconstruction is impossible for $0 lt.eq lambda lt.eq d^(- 1 \/ 2)$.]
] <pos:nonreconstruction>

#proof[
  Suppose $mu > 0$. Since $0 lt.eq bb(E) J lt.eq mu - lambda q nu$ and $nu lt.eq mu \/ c^2$,
  $ \( bb(E) J \)^2 lt.eq mu^2 - lambda q mu nu (2 - frac(lambda q, c^2)) . $
  Substituting this estimate and Equation (3.13) into Equation (3.6) gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ (frac(1 - lambda^2, 2 alpha) + g lambda mu) nu + frac(3 mu^2, 2 \( 1 + 2 mu \/ 3 \)) lt.eq 8 / 5 mu^2 \, #h(2em) g = 8 / 5 q (2 - frac(lambda q, c^2)) - 1 / sqrt(2) . $ <pos:before-scalar>]
  Here
  $ q gt.eq c_0 / 3 \, #h(2em) frac(lambda q, \( c_0 + 2 lambda q \)^2) lt.eq frac(1, 8 c_0) \, $
  and the second inequality is equivalent to $\( c_0 - 2 lambda q \)^2 gt.eq 0$. Consequently
  $ g gt.eq 113 / 81 - 1 / sqrt(2) > 17 / 25 . $
  For the strict comparison, both sides of $113 \/ 81 - 17 \/ 25 > 1 \/ sqrt(2)$ are positive, and their squares compare as $1448^2 \/ 2025^2 > 1 \/ 2$. Since $alpha lt.eq 1$ and $nu gt.eq mu^2 \/ s$, (3.17) implies
  #[#set math.equation(numbering: n => "(3.18)")
   $ T := frac(1 - lambda^2, 2 s) + frac(3, 2 \( 1 + 2 mu \/ 3 \)) + frac(17 lambda mu, 25 s) lt.eq 8 / 5 . $ <pos:scalar-necessary>]
  We show that this is impossible using $0 < s lt.eq 1$, $mu lt.eq s \/ c^2$, and
  #[#set math.equation(numbering: n => "(3.19)")
   $ c gt.eq underline(c) \( lambda \) := c_0 \( 1 + 2 lambda \/ 3 \) . $ <pos:c-lower>]
  First suppose $0 < lambda lt.eq 3 \/ 10$. Dropping the last term of $T$ and using $mu lt.eq 1 \/ c^2$, it suffices that
  #[#set math.equation(numbering: n => "(3.20)")
   $ (2 / 5 - lambda^2 / 2) c^2 > 2 / 3 (11 / 10 + lambda^2 / 2) . $ <pos:small-sufficient>]
  Indeed, this is exactly the inequality obtained by requiring $\( 1 - lambda^2 \) \/ 2 + \( 3 \/ 2 \) \/ \( 1 + 2 \/ \( 3 c^2 \) \) > 8 \/ 5$. By (3.19), the left side of (3.20) is at least
  $ c_0^2 [2 / 5 + (8 / 15 - 3 / 20 (6 / 5)^2) lambda] = 2738 / 3645 + 162911 / 273375 lambda . $
  Here we used $lambda^2 lt.eq \( 3 \/ 10 \) lambda$ and $1 + 2 lambda \/ 3 lt.eq 6 \/ 5$, and discarded a nonnegative quadratic term. The right side is at most $11 \/ 15 + lambda \/ 10$. The constant terms have difference $13 \/ 729 > 0$, and $162911 \/ 273375 > 1 \/ 10$, proving (3.20).
  Next suppose $3 \/ 10 lt.eq lambda lt.eq 1 \/ sqrt(2)$. Since
  $ frac(3, 2 \( 1 + 2 mu \/ 3 \)) gt.eq 3 / 2 - mu \, $
  we have
  $ T - 8 / 5 gt.eq 2 / 5 - lambda^2 / 2 - (1 - frac(17 lambda, 25)) mu gt.eq 2 / 5 - lambda^2 / 2 - frac(1 - 17 lambda \/ 25, c^2) . $
  Thus it suffices to prove
  $ f \( lambda \) := (2 / 5 - lambda^2 / 2) underline(c) \( lambda \)^2 > 1 - frac(17 lambda, 25) . $
  The difference of these two functions is concave, because
  $ f'' \( lambda \) = - 1369 / 32805 \( 120 lambda^2 + 180 lambda + 29 \) < 0 . $
  At the first endpoint, $f \( 3 \/ 10 \) = 194398 \/ 202500 > 19 \/ 20$, whereas $1 - \( 17 \/ 25 \) \( 3 \/ 10 \) = 199 \/ 250 < 4 \/ 5$. At the other endpoint,
  $ f \( 1 \/ sqrt(2) \) = 1369 / 729 (11 / 60 + sqrt(2) / 10) > 3 / 5 \, #h(2em) 1 - frac(17, 25 sqrt(2)) < 13 / 25 . $
  The first comparison follows already from $sqrt(2) > 7 \/ 5$; the second from $1 \/ sqrt(2) > 707 \/ 1000$. Concavity now proves the strict inequality on the entire interval.
  Finally suppose $1 \/ sqrt(2) < lambda < 1$, which can occur at equality only in the Poisson model. Lemma 8, with $d = lambda^(- 2)$, gives $s lt.eq 2 \( 1 - lambda^2 \)$. Hence
  $ T - 8 / 5 gt.eq 3 / 20 - frac(1 - 17 lambda \/ 25, c^2) . $
  It remains to check $\( 3 \/ 20 \) underline(c) \( lambda \)^2 > 1 - 17 lambda \/ 25$. At $lambda = 1 \/ sqrt(2)$ this is precisely the strict endpoint inequality just proved. Its left side increases with $lambda$, while its right side decreases, so it holds throughout the remaining interval.
  All cases contradict (3.18). Thus $mu = 0$, which makes the limiting posterior uniform. Same-sign degradation extends the conclusion to smaller positive parameters, and $lambda = 0$ is the independent channel. ◻
]

== 4 Negative equality: exclusion of small fixed points <sec:local>

Throughout this section $lambda = - a$, $0 < a lt.eq 1 \/ 2$, and $d = a^(- 2) gt.eq 4$. The offspring count is either the constant integer $d$ or $"Pois" \( d \)$. We consider a permutation-invariant fixed point of the posterior recursion and use

$ x = \| zeta \|^2 \, #h(2em) y = Re \( zeta^3 \) \, #h(2em) mu = bb(E) x \, quad nu = bb(E) x^2 \, quad eta = bb(E) y . $

All finite decimals in this section and the next denote exact rational numbers. In particular, none of the strict comparisons below is a floating-point comparison.

#thm([Proposition 4.1.])[
  (Local gap at negative equality).  #emph[ Every nontrivial permutation-invariant fixed point at $d a^2 = 1$ satisfies $mu > 1 \/ 20$. This includes $a = 1 \/ 2$ in both offspring models.]
] <loc:criterion>

We first establish the pair inequalities used in the proof. If a current message has invariants $\( X \, y_0 \)$ and an edge message has invariants $\( z \, B_0 \)$, define $d_x \, d_e \, d_n$ to be the output means of $x \, y \, x^2$ minus $X + z \, y_0 + B_0 \, X^2 + z^2$, respectively. The output mean here averages the six relative label permutations with their likelihood tilt. Conditional on the permutation orbits of two independent symmetric marginal messages, these are exactly the relative orientations of their product experiment. If the child before the edge has invariants $\( w \, Y \)$, then

$ z = a^2 w \, #h(2em) B_0 = - a^3 Y . $

Set

$ S_A = X^2 z \, quad S_B = X z^2 \, quad S = S_A + S_B \, quad W = y_0 z + X B_0 \, quad C = 5 / 2 . $

(The letter $W$ in this section denotes only this pair expression.)

#thm([Lemma 4.2.])[
  (Certified pair inequalities).  #emph[For any current and child posterior vectors, including vectors on the boundary of the simplex, and any $0 lt.eq a lt.eq 1 \/ 2$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ d_n & lt.eq 13 / 2 X z \, #h(2em) - 79 / 250 X z lt.eq d_e lt.eq 11 X z \,\
d_x & lt.eq - X z - 2 W + 2 y_0 B_0 + 51 / 20 S \,\
6 X z - 6 W + y_0 B_0 - 19 / 2 S & lt.eq d_e lt.eq 6 X z - 6 W + y_0 B_0 + S \,\
C d_n - 2 d_e & lt.eq - 2 X z + 22 W - 7 y_0 B_0 + 26 S_A + 111 / 2 S_B . $ <loc:coarsepair>]

]
] <loc:pair>

#proof[
  For $a = 1 \/ 2$ and strictly positive input vectors, Section 11.1 proves the inequalities by coefficientwise nonnegativity of fourteen integer polynomials. That derivation identifies each cleared polynomial with a pair inequality, including the likelihood tilt and the cancellation between the two reflection classes. We now extend those inequalities to all the inputs in the statement.
  For general $a in \[ 0 \, 1 \/ 2 \]$, replace the child vector $m = 1 + v$ by $1 + 2 a v$, a valid convex mixture with the uniform likelihood vector. Its coloring edge is $1 - a v$, so the same certificate gives the desired edge invariants $z = a^2 w$ and $B_0 = - a^3 Y$.
  Finally approximate boundary vectors by positive mixtures with the uniform vector. For each relative permutation, write $Z$ and $m^(upright("out"))$ for the normalizer and output likelihood vector in Equation (2.13). Its contribution to a tilted moment is $Z f \( m^(upright("out")) \) \/ 6$, where $f = x \, y \, x^2$ is bounded and continuous on the simplex. This contribution is continuous when $Z > 0$ and tends to zero as $Z arrow.r 0$. Thus the tilted expectations extend continuously over every zero-normalizer orientation, as do the polynomial right-hand sides. Taking limits proves the full closed simplex statement, including $a = 1 \/ 2$. ◻
]

#proof[
  Suppose $0 < mu lt.eq m_0 := 1 \/ 20$. We introduce a common notation for summing partial-product increments. In the regular model let $\( mu_j \, nu_j \, eta_j \)$ be the moments from $j$ edge branches, $s = j \/ d$, $0 lt.eq j lt.eq d$, and set
  $ "av" f_j = 1 / d sum_(j = 0)^(d - 1) f_j \, #h(2em) alpha = 1 - 1 / d . $
  A normalized increment is $d$ times the increment from $j$ to $j + 1$. In the Poisson model the partial product has $"Pois" \( s d \)$ branches, $0 lt.eq s lt.eq 1$; the subscript $j$ below denotes this partial product, $"av"$ means integration in $s$ over $\[ 0 \, 1 \]$, and $alpha = 1$. Its normalized increment is the derivative in $s$. Differentiating the Poisson series for the bounded functions $x \, y \, x^2$ gives $d$ times the expected single-branch increment; absolute convergence justifies this differentiation. In both models the endpoint is the fixed-point law, the initial moments vanish, and
  #[#set math.equation(numbering: n => "(4.2)")
   $ "av" s = alpha / 2 \, #h(2em) "av" s^2 lt.eq alpha / 3 . $ <loc:averages>]
  For regular counts the second average is $\( d - 1 \) \( 2 d - 1 \) \/ \( 6 d^2 \)$; for Poisson it is $1 \/ 3$.
  At equality the standalone edge contributions to $x$ sum to $d a^2 mu = mu$, which is already the fixed-point endpoint moment. The average of the actual normalized pair excess in $x$ is therefore zero. We will contradict this identity by showing that the pair upper bound has negative average when $mu lt.eq m_0$. To control its higher moments, we first bound the partial-product moments and then determine the sign of $eta$.
  The projection bound gives, respectively,
  $ mu_j gt.eq frac(j a^2 mu, 1 + \( j - 1 \) a^2 mu) \, #h(2em) mu_j gt.eq frac(s mu, 1 + s mu) . $
  For completeness, one edge posterior complex mean has correlation $a^2 mu$ with the spin, conditional mean $a^2 mu$ times that spin, and second moment $a^2 mu$. The sum of $j$ independent branches conditional on the spin consequently has second moment $j a^2 mu + j \( j - 1 \) \( a^2 mu \)^2$ and correlation $j a^2 mu$. Conditional expectation followed by Cauchy–Schwarz proves the first bound. Poisson factorial moments $s d$ and $\( s d \)^2$ prove the second. It follows that
  #[#set math.equation(numbering: n => "(4.3)")
   $ \( s - m_0 s^2 \) mu lt.eq mu_j lt.eq 1.14 s mu . $ <loc:partialmu>]
  Here is a derivation of the upper bound. Every simplex message satisfies
  #[#set math.equation(numbering: n => "(4.4)")
   $ - x / 2 lt.eq y lt.eq x . $ <loc:ratio>]
  For $x > 0$ this is Equation (2.7), and at $x = 0$ both sides vanish by Equation (2.6). Thus, when $X z > 0$,
  $ - 1 / 2 lt.eq y_0 \/ X lt.eq 1 \, #h(2em) - 1 / 2 lt.eq B_0 \/ z = - a Y \/ w lt.eq 1 / 4 \, #h(2em) z lt.eq 1 / 4 . $
  Checking the four corners of this ratio rectangle gives $- 2 \( r + t \) + 2 r t lt.eq 5 \/ 2$. Equation (4.1) therefore gives
  $ frac(d_x, X z) lt.eq - 1 + 5 / 2 + 51 / 20 \( 1 + 1 \/ 4 \) = 75 / 16 < 5 . $
  If $X z = 0$, one input is uniform and the excess vanishes. Hence the pair gain of $x$ is at most $z \( 1 + 5 X \)$. Iterating, or solving the corresponding differential inequality, gives $mu_j lt.eq \( e^(5 s mu) - 1 \) \/ 5$. The function $\( e^t - 1 \) \/ t$ increases for $t gt.eq 0$, and
  $ e^(1 \/ 4) lt.eq 1 + 1 / 4 + 1 / 32 + frac(\( 1 \/ 4 \)^3 \/ 6, 1 - 1 \/ 16) = 1849 / 1440 < 1.285 . $
  This proves the upper bound in (4.3).
  The standalone normalized increments in $x \, y \, x^2$ are $mu \, - a eta \, a^2 nu$, respectively. The partial product and the next edge branch are independent under the product marginal law, and each has a symmetric law. Conditional on their two permutation orbits, Lemma 15 therefore applies; averaging its bounds factors every mixed invariant moment. In particular, Equation (4.1) gives
  $ \( 1 - a^2 \) nu lt.eq 6.5 mu "av" mu_j \, #h(2em) - .316 mu "av" mu_j lt.eq \( 1 + a \) eta lt.eq 11 mu "av" mu_j . $
  Using Equations (4.3) and (4.2), $1 - a^2 gt.eq 3 \/ 4$, $a \/ \( 1 + a \) lt.eq 1 \/ 3$, and $alpha lt.eq 1$, we obtain
  #[#set math.equation(numbering: n => "(4.5)")
   $ nu / mu^2 lt.eq 4.94 \, quad frac(a^2 nu, mu^2) lt.eq 1.235 \, quad - .061 lt.eq frac(a eta, mu^2) lt.eq 2.09 . $ <loc:coarse>]
  The endpoint bound for $nu \/ mu^2$ before rounding is $6.5 \( 1.14 \) alpha \/ \[ 2 \( 1 - a^2 \) \]$. The upper bound for $eta \/ mu^2$ is $11 \( 1.14 \) alpha \/ \[ 2 \( 1 + a \) \]$, and the bound on its negative magnitude is $.316 \( 1.14 \) alpha \/ \[ 2 \( 1 + a \) \]$. Summing to a partial endpoint also yields
  #[#set math.equation(numbering: n => "(4.6)")
   $ nu_j / mu^2 & lt.eq 1.235 s + 3.705 s^2 \,\
- 2.09 s - .181 s^2 & lt.eq eta_j / mu^2 lt.eq .061 s + 6.27 s^2 . $ <loc:partialnu>]
  For example the quadratic coefficients come from $6.5 \( 1.14 \) \/ 2 = 3.705$, $.316 \( 1.14 \) \/ 2 = .18012 < .181$, and $11 \( 1.14 \) \/ 2 = 6.27$. In the discrete case we used $d^(- 1) sum_(i = 0)^(j - 1) \( i \/ d \)^k lt.eq s^(k + 1) \/ \( k + 1 \)$; in the Poisson case this is the exact integral of the monomial.
  The sharper $y$ inequality improves the sign information. Independence gives
  $ d bb(E) W = mu eta_j - a eta mu_j \, #h(2em) d bb(E) \( y_0 B_0 \) = - a eta eta_j \, #h(2em) d bb(E) S = mu nu_j + a^2 nu mu_j . $
  Thus the normalized $y$ excess is bounded below and above by
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( 6 mu + 6 a eta + c a^2 nu \) mu_j + \( - 6 mu - a eta \) eta_j + c mu nu_j \, #h(2em) c = - 9.5 \, med 1 \, $ <loc:refinedincrement>]
  respectively. The coefficient of $eta_j$ is negative, since $6 mu + a eta gt.eq \( 6 - .061 m_0 \) mu > 0$. For the lower estimate the coefficient of $mu_j$ is positive, since
  $ 6 mu + 6 a eta - 9.5 a^2 nu gt.eq \[ 6 - \( 6 \( .061 \) + 9.5 \( 1.235 \) \) \( .05 \) \] mu = 5.395075 mu > 0 . $
  These observations determine the valid directions of all substitutions. Adding the standalone increment and averaging, define $R = \( 1 + a \) eta \/ \( alpha mu^2 \)$. Equations (4.3)–(4.6) give
  $ R & lt.eq 6.689 \( .57 \) + \( 6 + .105 \) \( .05 \) \( 2.09 \/ 2 + .181 \/ 3 \) + .05 \( 1.235 \/ 2 + 3.705 \/ 3 \)\
 & = 2121379 / 500000 < 4.25 \,\
R & gt.eq \[ 6 - \( 6 \( .061 \) + 9.5 \( 1.235 \) \) \( .05 \) \] \( 1 \/ 2 - .05 \/ 3 \)\
 & #h(1em)  - \( 6 + .105 \) \( .05 \) \( .061 \/ 2 + 6.27 \/ 3 \) - 9.5 \( .05 \) \( 1.235 \/ 2 + 3.705 \/ 3 \)\
 & = 25929587 / 24000000 > 0 . $
  Here $6 + \( 6 \( 2.09 \) + 1.235 \) \( .05 \) = 6.68875 < 6.689$, $2.09 \( .05 \) = .1045 < .105$, and $1.14 \/ 2 = .57$. Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ eta gt.eq 0 \, #h(2em) 0 lt.eq frac(a eta, mu^2) lt.eq 4.25 / 3 < 1.417 . $ <loc:etapositive>]
  The standalone $y$ increment is now nonpositive. Keeping the preceding coarse partial bounds in the upper expression of (4.7), its coefficients of $s$ and $s^2$ after division by $mu^2$ are at most
  $ 6.689 \( 1.14 \) + \( 6 + .105 \) \( .05 \) \( 2.09 \) + .05 \( 1.235 \) = 8.3251825 < 8.34 \, $
  $ \( 6 + .105 \) \( .05 \) \( .181 \) + .05 \( 3.705 \) = .24050025 < .242 . $
  Summation or integration therefore improves the partial bound to
  #[#set math.equation(numbering: n => "(4.9)")
   $ eta_j \/ mu^2 lt.eq 4.17 s^2 + .081 s^3 \, $ <loc:etaimproved>]
  since $8.34 \/ 2 = 4.17$ and $.242 \/ 3 < .081$.
  The sign information now lets us estimate the average pair excess in $x$. Taking the marginal expectation in Equation (4.1) and multiplying by $d$ gives the upper bound
  $ - mu mu_j - 2 \( mu eta_j - a eta mu_j \) - 2 a eta eta_j + 2.55 \( mu nu_j + a^2 nu mu_j \) . $
  The terms $- 2 mu eta_j + C mu nu_j$ suggest keeping their combination together. Define
  $ K_j = C nu_j - 2 eta_j \, #h(2em) G = 2 a eta + C a^2 nu . $
  Using $2.55 = C + .05$, an exact rearrangement of the bound gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( - mu + G \) mu_j + \( mu + a eta \) K_j - C a eta nu_j + .05 \( mu nu_j + a^2 nu mu_j \) . $ <loc:finalincrement>]
  The term $- C a eta nu_j$ is nonpositive. The remaining new quantity is the average of $K_j$, which we estimate before returning to the $x$ excess.
  The standalone normalized $K$ increment is $G$, with
  #[#set math.equation(numbering: n => "(4.11)")
   $ 0 lt.eq G lt.eq \[ 2 \( 1.417 \) + 2.5 \( 1.235 \) \] mu^2 = 5.9215 mu^2 < 5.922 mu^2 . $ <loc:G>]
  Equation (4.1) bounds its normalized excess by
  $ \( - 2 mu - 22 a eta + 55.5 a^2 nu \) mu_j + \( 22 mu + 7 a eta \) eta_j + 26 mu nu_j . $
  After discarding $- 22 a eta lt.eq 0$, the coefficient of $mu_j$ divided by $mu$ is at most $- 2 + 55.5 \( 1.235 \) \( .05 \) = 1.427125 < 1.43$. The coefficient of $eta_j$ is positive, allowing use of (4.9).
  The average of a partial sum equals the weighted average of its increments. More precisely, in the regular case, for $w_j = \( d - 1 - j \) \/ d$,
  $ "av" K_j = "av" { w_j d \( K_(j + 1) - K_j \) } . $
  In the Poisson case Fubini gives the same identity with weight $1 - s$ and derivative in $s$. Direct finite sums, or the corresponding integrals, give
  #[#set math.equation(numbering: n => "(4.12)")
   $ "av" w = alpha / 2 \, quad "av" \( w s \) lt.eq alpha / 6 \, quad "av" \( w s^2 \) lt.eq alpha / 12 . $ <loc:weightedaverages>]
  The latter two discrete values are $\( d - 2 \) \( d - 1 \) \/ \( 6 d^2 \)$ and $\( d - 2 \) \( d - 1 \)^2 \/ \( 12 d^3 \)$, respectively. Since $s^3 lt.eq s^2$, applying (4.3), (4.6), (4.9), and (4.11) gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ frac("av" K_j, alpha mu^2) & lt.eq 5.922 \/ 2 + 1.43 \( 1.14 \) \/ 6\
 & quad + \( 22 + 7 \( 1.417 \) \( .05 \) \) \( .05 \) \( 4.17 + .081 \) \/ 12\
 & quad + 26 \( .05 \) \( 1.235 \/ 6 + 3.705 \/ 12 \)\
 & = 20640565669 / 4800000000 < 4.31 . $ <loc:Kaverage>]
  No nonnegativity of $K_j$ has been assumed.
  We can now average Equation (4.10). The third term is nonpositive. Use the lower bound on $mu_j$ for $- mu mu_j$ and the upper bound for $G mu_j$, where $G gt.eq 0$. For the $K_j$ term first use (4.13), since $mu + a eta > 0$, and then bound its positive coefficient. After division by $alpha mu^2 > 0$, the average of (4.10) is at most
  $ & - \( 1 \/ 2 - .05 \/ 3 \) + 5.922 \( .05 \) \( .57 \) + \( 1 + 1.417 \( .05 \) \) \( .05 \) \( 4.31 \)\
 & #h(2em)  + .05 \( .05 \) \( 1.235 \/ 2 + 3.705 \/ 3 + 1.235 \( .57 \) \) = - 2321911 / 30000000 < 0 . $
  This contradicts the zero actual excess average and proves the proposition. The omitted case $mu = 0$ is exactly the uniform posterior experiment. ◻
]

== 5 Negative equality: a global weighted logarithm inequality <sec:weighted>

The local result leaves only fixed points with $mu > 1 \/ 20$. We now exclude these except in a short interval near the coloring channel. The scalar inequality in this section is certified by the integer interval calculation in Appendix Section 9, with its complete source in Section 11.2.

#thm([Proposition 5.1.])[
  (Global exclusion away from coloring).  #emph[ At $lambda = - a$, $d = a^(- 2)$, the uniform posterior law is the only permutation-invariant fixed point in either of the following ranges:]
  + #emph[regular offspring, with integer $d$ and $0 < a lt.eq .448$;]
  + #emph[Poisson offspring, with $0 < a lt.eq .477$.]
  #emph[In particular the regular assertion covers every integer $d gt.eq 5$.]
] <wei:theorem>

For a positive likelihood vector $m = 1 + v$ define

#[#set math.equation(numbering: n => "(5.1)")
 $ G = \( m_0 m_1 m_2 \)^(1 \/ 3) \, quad T = 1 - G \, quad u_i = log m_i - chevron.l log m chevron.r \, quad W = G chevron.l u^2 chevron.r \, quad Y = G chevron.l u^3 chevron.r . $ <wei:functions>]

Here $chevron.l dot.op chevron.r$ is the average of the three coordinates. Edge subscripts mean evaluation on $1 - a v$, and we use

$ hat(T) = d T_e \, #h(2em) hat(W) = d W_e \, #h(2em) hat(Y) = d Y_e . $

The functions $T \, W \, Y$ extend continuously to the closed simplex, with $T = 1$ and $W = Y = 0$ whenever any coordinate vanishes. Indeed $G$ times any fixed power of the logarithms tends to zero as a coordinate vanishes: for example the product $product_i m_i^(1 \/ 3)$ times $sum_i \| log m_i \|^3$ is bounded by a sum of terms having a factor $m_i^(1 \/ 3) \| log m_i \|^3 arrow.r 0$ and the other coordinates are bounded by three. This observation also proves boundedness of these extensions.

#thm([Lemma 5.2.])[
  (Weighted fixed-point identities).  #emph[Let $0 < a < 1 \/ 2$, $d = a^(- 2)$, and let the fixed point be nontrivial. Set 
#[#set math.equation(numbering: n => "(5.2)")
 $ Phi \( t \) = bb(E) t^D \, #h(2em) A = bb(E) G_e \, #h(2em) z = d \( 1 - A \) \, #h(2em) h = frac(1 - Phi \( A \), d \( 1 - A \)) \, #h(2em) 1 - xi = frac(Phi' \( A \), d) . $ <wei:scalars>]

 Then $0 < A < 1$, $0 < xi < 1$, and 
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E) T = h bb(E) hat(T) \, #h(2em) bb(E) W = \( 1 - xi \) bb(E) hat(W) \, #h(2em) bb(E) Y = \( 1 - xi \) bb(E) hat(Y) \, #h(2em) bb(E) hat(T) = z . $ <wei:exact>]

]
] <wei:identities>

#proof[
  Edge likelihood coordinates lie in $\[ 1 - 2 a \, 1 + a \]$, so $G_e > 0$. Their coordinate average is one, hence $G_e lt.eq 1$, with strict inequality on nonuniform messages. Nontriviality and $a > 0$ thus give $0 < A < 1$. The assertions about $xi$ follow from $Phi' \( A \) \/ d = A^(d - 1)$ in the regular case and $Phi' \( A \) \/ d = e^(d \( A - 1 \))$ in the Poisson case.
  For $n$ branches let $Z = chevron.l product_(j = 1)^n m_(e \, j) chevron.r$ be the product likelihood normalizer, and let $g_j = G_(e \, j)$. Under the independent marginal branch law the actual output law is tilted by $Z$, whereas its geometric mean equals $product_j g_j \/ Z$. Their product is $product_j g_j$. Centered log coordinates add, $u_(upright("out") \, i) = sum_j u_(e \, j \, i)$, because normalization changes all three logs by the same constant. For each fixed coordinate $i$, permutation invariance and centering give
  $ bb(E) \( G_e u_(e \, i) \) = 0 : $
  the three expectations are equal and their sum is zero. Consequently every cross term in the square or cube of $sum_j u_(e \, j \, i)$ has a vanishing first-moment factor. Independence therefore proves, for $n gt.eq 1$,
  $ bb(E) \( G_(upright("out")) divides n \) = A^n \, quad bb(E) \( W_(upright("out")) divides n \) = n A^(n - 1) bb(E) W_e \, quad bb(E) \( Y_(upright("out")) divides n \) = n A^(n - 1) bb(E) Y_e . $
  At $n = 0$ the output is uniform, so the contributions to $T \, W \, Y$ are zero. Mixing over $D$ gives (5.3). All terms are integrable: the edge logs are uniformly bounded and the output centered logs grow at most linearly in $n$, while both offspring laws have finite moments of every fixed order. No conditioning on survival enters these identities. ◻
]

#thm([Lemma 5.3.])[
  (Scalar bounds).  #emph[In the regular range of Proposition 5.1, or in its Poisson range, one can use constants 
$ \( H \, U \) = (1 / 16 \, 15 / 32) $

 to obtain 
#[#set math.equation(numbering: n => "(5.4)")
 $ h lt.eq overline(h) := 1 - xi / 2 - H xi^2 - H / 2 xi^3 \, #h(2em) z gt.eq underline(z) := xi + U xi^2 . $ <wei:hz>]

 For Poisson offspring the stronger values $\( H \, U \) = \( 1 \/ 12 \, 1 \/ 2 \)$ also hold. Every nontrivial fixed point in the claimed ranges satisfies $.03 < xi < 1$.]
] <wei:scalarbounds>

#proof[
  Regular offspring in the stated range have integer $d gt.eq 5$. Since $1 - xi = A^(d - 1)$, the finite geometric sum gives
  $ h = 1 / d sum_(i = 0)^(d - 1) \( 1 - xi \)^(i \/ \( d - 1 \)) . $
  For Poisson offspring $1 - xi = e^(- z)$ and
  $ h = frac(1 - e^(- z), z) = integral_0^1 \( 1 - xi \)^t thin d t . $
  In either expression the averaging law of $t$ is symmetric under $t mapsto 1 - t$, so $bb(E)_t t = 1 \/ 2$. For $0 lt.eq t lt.eq 1$ all nonconstant coefficients in the binomial expansion of $\( 1 - xi \)^t$ are nonpositive. The first three negative coefficients, after averaging, are
  $ 1 / 2 \, #h(2em) frac(bb(E)_t \[ t \( 1 - t \) \], 2) \, #h(2em) frac(bb(E)_t \[ t \( 1 - t \) \( 2 - t \) \], 6) = frac(bb(E)_t \[ t \( 1 - t \) \], 4) . $
  The last equality uses symmetry, since the $t \( 1 - t \)$-weighted mean of $t$ is $1 \/ 2$. In the regular case
  $ bb(E)_t \[ t \( 1 - t \) \] = frac(d - 2, 6 \( d - 1 \)) gt.eq 1 / 8 \; $
  in the Poisson case it is $1 \/ 6$. Truncating after degree three gives the bound for $h$. It holds at $xi = 1$ as well by continuity.
  For regular offspring,
  $ z = d { 1 - \( 1 - xi \)^(1 \/ \( d - 1 \)) } . $
  All coefficients of this series are nonnegative. Its linear coefficient is $d \/ \( d - 1 \) gt.eq 1$, and its quadratic coefficient obeys
  $ frac(d \( d - 2 \), 2 \( d - 1 \)^2) - 15 / 32 = frac(\( d - 5 \) \( d + 3 \), 32 \( d - 1 \)^2) gt.eq 0 . $
  This proves the claimed lower bound. For Poisson offspring $z = - log \( 1 - xi \) gt.eq xi + xi^2 \/ 2$; the weaker values of $H \, U$ are consequently valid there too.
  Finally $G_e^3 = 1 - 3 a^2 x - 2 a^3 y$, so, since $d = a^(- 2)$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ hat(T) = frac(3 x + 2 a y, 1 + G_e + G_e^2) gt.eq \( 1 - a \/ 3 \) x . $ <wei:That>]
  For this inequality use $G_e lt.eq 1$ and $y gt.eq - x \/ 2$ from (4.4); the numerator is nonnegative. By Proposition 4.1 and $a lt.eq .477$,
  $ z = bb(E) hat(T) > \( 1 - .477 \/ 3 \) \/ 20 = .04205 > .042 . $
  For regular $d gt.eq 5$,
  $ log \( 1 - xi \) = \( d - 1 \) log \( 1 - z \/ d \) lt.eq - \( 1 - 1 \/ d \) z lt.eq - .8 z \; $
  for Poisson, $1 - xi = e^(- z) lt.eq e^(- .8 z)$. Since $1 - e^(- t) gt.eq t \/ \( 1 + t \)$ for $t gt.eq 0$, in either case
  $ xi > frac(.0336, 1 + .0336) = 21 / 646 > .0325 > .03 . $
  This verifies the complete $xi$ domain required below. ◻
]

=== 5.1 A pointwise inequality from exact identities <a-pointwise-inequality-from-exact-identities>

The identities above give several functions with expectation zero. We combine them so that the scalar bounds on $h$ and $z$ produce a function that is strictly positive at every message. For a nontrivial fixed point, choose signed rational constants $c_0 \, c_1 \, s_1$ and a positive rational $delta$, and put

$ s_0 = c_0 + 1 \/ 3 \, #h(2em) c \( xi \) = c_0 + c_1 xi \, #h(2em) s \( xi \) = s_0 + s_1 xi . $

The relation defining $s_0$ removes the cubic term of $T + c_0 W + s_0 Y$ near the uniform message. Indeed, expansion at $v = 0$ gives

$ T = x - 2 / 3 y + O \( parallel v parallel^4 \) \, #h(2em) W = 2 x - 2 y + O \( parallel v parallel^4 \) \, #h(2em) Y = 2 y + O \( parallel v parallel^4 \) . $

Its quadratic term also cancels on subtracting $d$ times its edge evaluation, since $d a^2 = 1$. By Lemma 17, the random expression

#[#set math.equation(numbering: n => "(5.6)")
 $ E_0 =  & T - h hat(T) + c \( xi \) \[ W - \( 1 - xi \) hat(W) \] + s \( xi \) \[ Y - \( 1 - xi \) hat(Y) \]\
 & + delta xi \( z - hat(T) \) $ <wei:zero-mean>]

has expectation zero. In particular, the final term changes the pointwise expression without changing its expectation, since $bb(E) hat(T) = z$.

Fix an applicable pair $\( H \, U \)$ from Lemma 18. Replace $h$ in (5.6) by $overline(h) = 1 - xi \/ 2 - H xi^2 - \( H \/ 2 \) xi^3$ and $z$ by $underline(z) = xi + U xi^2$, and call the resulting expression $P$. The only changes are in terms whose signs are controlled:

#[#set math.equation(numbering: n => "(5.7)")
 $ P - E_0 = \( h - overline(h) \) hat(T) + delta xi \( underline(z) - z \) lt.eq 0 . $ <wei:comparison>]

Here $hat(T) gt.eq 0$, $delta > 0$, and $xi gt.eq 0$. The possibly negative coefficients $c \( xi \)$ and $s \( xi \)$ multiply identities that remain exact. Thus $bb(E) P lt.eq 0$ for any nontrivial fixed point; it remains to choose the constants so that $P > 0$ pointwise.

Expanding the relaxed expression gives

#[#set math.equation(numbering: n => "(5.8)")
 $ P = D_0 + D_1 xi + D_2 xi^2 + D_3 xi^3 \, $ <wei:polynomial>]

where

#[#set math.equation(numbering: n => "(5.9)")
 $ D_0 =  & T - hat(T) + c_0 \( W - hat(W) \) + s_0 \( Y - hat(Y) \) \,\
D_1 =  & c_1 \( W - hat(W) \) + s_1 \( Y - hat(Y) \) + c_0 hat(W) + s_0 hat(Y) + \( 1 \/ 2 - delta \) hat(T) \,\
D_2 =  & c_1 hat(W) + s_1 hat(Y) + H hat(T) + delta \,\
D_3 =  & U delta + \( H \/ 2 \) hat(T) . $ <wei:coefficients>]

We use the following rational choices on three closed $a$ bands:

#[#set math.equation(numbering: n => "(5.10)")
 $ a upright(" band") & 1000 c_0 & 1000 c_1 & 1000 s_1 & 1000 delta & H & U\
#scale(x: 120%, y: 120%)[\[] 0 \, .190 #scale(x: 120%, y: 120%)[\]] & - 268 & - 60 & - 55 & 130 & 1 \/ 16 & 15 \/ 32\
#scale(x: 120%, y: 120%)[\[] .190 \, .448 #scale(x: 120%, y: 120%)[\]] & - 269 & 67 & 47 & 55 & 1 \/ 16 & 15 \/ 32\
#scale(x: 120%, y: 120%)[\[] .448 \, .477 #scale(x: 120%, y: 120%)[\]] & - 271 & 58 & 49 & 50 & 1 \/ 12 & 1 \/ 2 $ <wei:parameters>]

The final row uses the stronger scalar bounds for Poisson offspring. Overlapping endpoints can use either applicable row. For purposes of the pointwise inequality, extend the hatted functions to $a = 0$ by

$ hat(T) = x \, #h(2em) hat(W) = 2 x \, #h(2em) hat(Y) = 0 . $

These are their continuous limits: use $G_e^3 = 1 - 3 a^2 x - 2 a^3 y$ for $hat(T)$ and $log \( 1 - a v_i \) = - a v_i + O \( a^2 \)$ for the centered edge logarithms.

#thm([Lemma 5.4.])[
  (Certified global inequality).  #emph[For each row of (5.10), every posterior probability vector, every $a$ in that row’s closed band, and every $.03 lt.eq xi lt.eq 1$, the polynomial (5.8) satisfies $P > 0$.]
] <wei:positive>

#proof[
  Appendix Section 9 proves the exact interval certificate for this inequality, with the complete source in Section 11.2. It parametrizes sorted probability vectors as $\( 1 \, q^18 \, r^18 \) \/ \( 1 + q^18 + r^18 \)$, where $0 lt.eq r lt.eq q lt.eq 1$. In these coordinates the weighted logarithmic functions have continuous first derivatives at zero coordinates. The appendix derives formulas for the hatted functions without division by $a$, so their values and first derivatives are enclosed also at $a = 0$. It then identifies the four expressions computed by the program with $D_0 \, D_1 \, D_2 \, D_3$ above.
  The certificate covers the full $\( q \, r \, a \)$ domain by closed boxes and partitions $xi in \[ .03 \, 1 \]$ at
  $ .03 \, .05 \, .075 \, .10 \, .15 \, .20 \, .30 \, .40 \, .50 \, .65 \, .80 \, .90 \, 1 . $
  On every resulting interval it certifies strictly positive lower bounds for the four cubic Bernstein coefficients. All enclosures, including the derivative bounds used for midpoint acceptance and subdivision, follow from integer arithmetic and explicit analytic remainder bounds. The appendix proves coverage of every simplex boundary and band endpoint and records normal completion of all three prescribed runs with assertions enabled. Positive Bernstein coefficients imply $P > 0$ throughout each closed $xi$ interval. At the uniform message this also follows directly from $P = delta xi^2 + U delta xi^3 > 0$. ◻
]

#proof[
  Suppose a nontrivial fixed point exists. Lemmas 17 and 18 place its scalar $xi$ in the certified interval. Choose the applicable row of (5.10). Equation (5.6) has expectation zero, so (5.7) gives $bb(E) P lt.eq 0$. On the other hand, Lemma 19 gives $P > 0$ pointwise. The functions in $P$ are bounded on the closed simplex for the fixed $a < 1 \/ 2$, so $bb(E) P > 0$, a contradiction.
  For the final assertion, $a = 1 \/ sqrt(d) lt.eq 1 \/ sqrt(5) < .448$ whenever $d gt.eq 5$: the strict comparison follows from $5 \( .448 \)^2 = 1.00352 > 1$. ◻
]

== 6 A finite certificate at the coloring boundary <grid:section>

We now prove non-reconstruction at the remaining negative equalities, including the channel $lambda = - 1 \/ 2$. Throughout this section $a = - lambda > 0$, $p = \( p_0 \, p_1 \, p_2 \)$ is a posterior probability vector, and $zeta = sum_(i = 0)^2 p_i omega^i$, where $omega = e^(2 pi upright(i) \/ 3)$. In this section the input spin $S$ denotes its index in ${ 0 \, 1 \, 2 }$; its complex representative is $omega^S$. Write $mu = bb(E) \| zeta \|^2$. Proposition 4.1 says that a symmetric fixed point at $d a^2 = 1$ with $mu lt.eq 1 \/ 20$ is the uniform posterior. It will therefore suffice to dominate one finite-depth experiment by an explicit experiment with $mu < 1 \/ 20$. The dominating process need not itself be at equality or converge to the uniform posterior.

=== 6.1 Explicit refinements of posterior experiments <explicit-refinements-of-posterior-experiments>

The finite representation follows the survey method of Bhatnagar and Maneva #cite(label("BhatnagarManeva2011")) Sections 3.1–3.3 and Theorems 5–8: posterior vectors are replaced by barycentric mixtures on a finite grid, and rounding deficits and omitted offspring tails are completed by perfectly informative messages. We give explicit refinement kernels for every operation and exact arithmetic certificates for the three-state parameter ranges used here.

For experiments with the same input spin $S$, write $cal(E) prec.curly.eq cal(F)$ if a Markov kernel, independent of $S$, transforms the data of $cal(F)$ into data with the conditional laws of $cal(E)$. Such a kernel is called a garbling. Under the uniform prior, an experiment with datum $Y$, marginal law $rho$, and posterior $p \( Y \)$ satisfies

#[#set math.equation(numbering: n => "(6.1)")
 $ bb(P) \( S = i \, Y in d y \) = p_i \( y \) rho \( d y \) \, #h(2em) bb(P) \( Y in d y divides S = i \) = 3 p_i \( y \) rho \( d y \) . $ <grid:canonical>]

Its full labeled posterior is an equivalent experiment: the reverse kernel from $p$ to $Y$ is the conditional marginal law $rho \( d y divides p \( Y \) = p \)$. Equation (6.1) proves that this kernel also works under every input spin. All conditional distributions used here exist on the finite or standard Borel spaces in question.

We compress a permutation-invariant posterior law by storing one mass for each orbit under the six coordinate permutations. The represented datum is always the #emph[full labeled posterior]. Under its marginal law, draw an orbit, uniformly permute its representative, and retain the resulting vector. Repeated coordinates cause no difficulty, since each distinct orientation has the same multiplicity among the six permutations. Observing only the orbit index would be a different experiment and is not used below.

#thm([Lemma 6.1.])[
  (Barycentric refinement).  #emph[Suppose that for every old datum $y$ there are probabilities $alpha_y \( z \)$ on a finite set of posterior vectors such that $sum_z alpha_y \( z \) z = p \( y \)$. Then the posterior law $nu \( z \) = integral alpha_y \( z \) rho \( d y \)$ defines an experiment that dominates the old one.]
] <grid:spread>

#proof[
  Here is an explicit refinement conditional on the input spin. Given $S = i$ and $Y = y$ with $p_i \( y \) > 0$, choose $z$ with probability
  #[#set math.equation(numbering: n => "(6.2)")
   $ R_i \( y \, z \) = frac(alpha_y \( z \) z_i, p_i \( y \)) . $ <grid:spread-forward>]
  Choose any distribution on the null event $p_i \( y \) = 0$. The barycenter identity makes this a probability kernel. Its joint law is $bb(P) \( S = i \, Y in d y \, Z = z \) = rho \( d y \) alpha_y \( z \) z_i$, so that the posterior given $\( Y \, Z \)$ is $Z$. After retaining just $Z$, the reverse garbling is
  #[#set math.equation(numbering: n => "(6.3)")
   $ G \( z \, d y \) = frac(rho \( d y \) alpha_y \( z \), nu \( z \)) quad upright("if ") nu \( z \) > 0 . $ <grid:spread-reverse>]
  It is independent of $i$ and recovers the old conditional law, since $sum_z 3 z_i nu \( z \) G \( z \, d y \) = 3 p_i \( y \) rho \( d y \)$. Arbitrary kernels at $nu \( z \) = 0$ are harmless. In particular $alpha_y$ specifies #emph[marginal] spreading probabilities; the actual refinement conditional on the spin is (6.2). ◻
]

#thm([Lemma 6.2.])[
  (Symmetric completion by pure posteriors).  #emph[Let a finite symmetric posterior law have orbit masses $W_o$, and suppose $0 lt.eq L_o lt.eq W_o$ for each orbit. The law retaining masses $L_o$ and putting the remaining mass $1 - sum_o L_o$ at the uniformly permuted pure orbit dominates the original experiment.]
] <grid:completion>

#proof[
  On a datum $p$ in orbit $o$, retain $p$ with probability $t \( p \) = L_o \/ W_o$ (put $t = 0$ when $W_o = 0$). Otherwise reveal the input spin. More precisely, conditional on $\( S = i \, p \)$ the refined datum is $\( p \, 0 \)$ with probability $t \( p \)$ and $\( p \, 1 \, i \)$ otherwise. Forgetting the flag and the revealed spin recovers $p$, so this is a refinement. The respective posteriors are $p$ and $e_i$, and their full posterior is sufficient by (6.1). Removal is constant across each orbit, whence
  $ bb(P) \( S = i \, upright("removed from ") o \) = \( W_o - L_o \) 1 / 6 sum_(pi in frak(S)_3) \( pi p \)_i = frac(W_o - L_o, 3) . $
  Thus the revealed part is exactly the stated pure orbit, with no change to the uniform input prior. This also covers removal from the pure orbit: retaining a pure posterior and revealing the already known spin are disjoint flagged outcomes that compress to the same posterior, so their masses add. For completeness, if $rho \( p \)$ denotes an old labeled posterior mass and $nu \( z \)$ the resulting mass, the reverse kernel after posterior compression is explicitly
  $ G \( z \, p \) = frac(rho \( p \), nu \( z \)) [t \( p \) upright(bold(1))_({ z = p }) + \( 1 - t \( p \) \) sum_(i = 0)^2 p_i upright(bold(1))_({ z = e_i })] quad \( nu \( z \) > 0 \) . $
  ◻
]

Both independent composition and edge transmission preserve $prec.curly.eq$. In detail, if $G_j$ garbles the $j$th upper branch into the $j$th lower branch, instantiate the upper branch data independently #emph[conditional on their common input spin], and use the product kernel $product_j G_j$ with independent auxiliary randomness. Under each input this recovers the product of the lower conditional laws. For an edge, averaging these same conditional identities against the channel $K_lambda \( i \, j \)$ proves the claim. Mixing over an input-independent count also preserves the order: retain the count and apply the appropriate product garbling conditional on it. These facts justify each induction below; no monotonicity of the numerical rounding map is assumed.

=== 6.2 Grid spreading and exact product tables <grid-spreading-and-exact-product-tables>

Fix

$ H = 72 \, #h(2em) N = 10^12 \, #h(2em) cal(H) = { \( h_0 \, h_1 \, h_2 \) in bb(Z)_(gt.eq 0)^3 : h_0 gt.eq h_1 gt.eq h_2 \, med h_0 + h_1 + h_2 = H } . $

There are $469$ representatives in $cal(H)$. An integer vector of nonnegative masses $\( m_h \)_(h in cal(H))$ summing to $N$ represents the symmetric posterior law with orbit probabilities $m_h \/ N$ and posteriors $h \/ H$. Denote the pure and uniform orbit laws by $sans(P)$ and $sans(U)$.

For an integer vector $r gt.eq 0$ of positive total $T$, set

$ n_i = ⌊frac(H r_i, T)⌋ \, #h(2em) b_i = H r_i - n_i T \, #h(2em) k = H - sum_i n_i = frac(sum_i b_i, T) in { 0 \, 1 \, 2 } . $

If $k = 0$, choose $n \/ H$. If $k = 1$, choose $\( n + e_i \) \/ H$ with probability $b_i \/ T$. If $k = 2$, choose $\( n + upright(bold(1)) - e_i \) \/ H$ with probability $\( T - b_i \) \/ T$. These are valid grid vectors and probabilities. For $k = 2$ the expected increment in coordinate $j$ is $sum_(i eq.not j) \( 1 - b_i \/ T \) = b_j \/ T$; the other two cases are immediate. The chosen vector therefore has mean $r \/ T$, and Lemma 20 proves refinement. The construction commutes with label permutations.

For rational edge magnitude $a = A \/ B lt.eq 1 \/ 2$, first reduce $A \/ B$ to lowest terms. A child grid posterior $q \/ H$ gives parent likelihood entries

$ frac(e_i \( q \), B H) \, #h(2em) e_i \( q \) = \( B + A \) H - 3 A q_i \, $

whereas its plain likelihood entries are $3 q_i \/ H$. To combine two orbit representatives $p \, q$, fix the orientation of $p$ and average the six relative permutations $pi$ of $q$. This is sufficient because a simultaneous permutation changes only the output orientation, which remains uniform within its orbit. The following table specifies the three operations used by the verifier:

#[#set math.equation(numbering: n => "(6.4)")
 $ upright("mode") & upright("operation") & r_i & D_(upright("tab"))\
0 & upright("plain–plain") & p_i thin 3 q_(pi \( i \)) & 6 H^2\
1 & upright("plain–edge") & p_i thin e_(pi \( i \)) \( q \) & 6 B H^2\
2 & upright("edge–edge") & e_i \( p \) e_(pi \( i \)) \( q \) & 18 B^2 H^2 $ <grid:modes>]

In each case, with $T = sum_i r_i$, the posterior is $r \/ T$ and the relative permutation’s probability after the likelihood tilt is $T \/ D_(upright("tab"))$. For example the mode 1 tilt is $1 / 3 sum_i \( 3 p_i \/ H \) \( e_(pi \( i \)) \( q \) \/ \( B H \) \) = T \/ \( B H^2 \)$; the additional permutation factor is $1 \/ 6$. The other rows follow in the same way. A permutation with $T = 0$ has zero probability and contributes nothing, including at $a = 1 \/ 2$.

Multiply these probabilities by the grid spread. The resulting table numerators are respectively $T$ when $k = 0$, $b_i$ when $k = 1$, and $T - b_i$ when $k = 2$, all over the row’s common denominator $D_(upright("tab"))$. Aggregate contributions reaching the same output orbit. Write the integer result as $w_(p \, q) \( h \)$. For every pair,

#[#set math.equation(numbering: n => "(6.5)")
 $ w_(p \, q) \( h \) gt.eq 0 \, #h(2em) sum_h w_(p \, q) \( h \) = D_(upright("tab")) . $ <grid:table-mass>]

Indeed the spread has mass one, and averaging either input likelihood over uniform label permutations gives one in each coordinate. The verifier additionally asserts (6.5) for every entry.

For input integer mass laws $m \, n$, keep output units

#[#set math.equation(numbering: n => "(6.6)")
 $ ell_h = ⌊frac(sum_(p \, q) m_p n_q w_(p \, q) \( h \), N D_(upright("tab")))⌋ \, $ <grid:combine>]

and add $N - sum_h ell_h$ units to the pure orbit. The unfloored quantity divided by $N$ is the exact orbit mass of the spread product, so Lemma 21 proves that this operation dominates the indicated exact product. Denote it by $cal(C)_0 \, cal(C)_1$ or $cal(C)_2$. Modes 0 and 2 have symmetric tables in $p \, q$: exchange the inputs, invert the relative permutation, and relabel the output. Thus their code uses pairs $p lt.eq q$ with diagonal coefficient $m_p n_p$ and off-diagonal coefficient $m_p n_q + m_q n_p$. Mode 1 uses all ordered pairs.

=== 6.3 Regular and Poisson upper recursions <regular-and-poisson-upper-recursions>

For the regular tree with four children at each vertex at $a = 1 \/ 2$, start at $m^(\( 0 \)) = sans(P)$ and set

#[#set math.equation(numbering: n => "(6.7)")
 $ h^(\( t \)) = cal(C)_2 \( m^(\( t \)) \, m^(\( t \)) \) \, #h(2em) m^(\( t + 1 \)) = cal(C)_0 \( h^(\( t \)) \, h^(\( t \)) \) . $ <grid:regular-recursion>]

The two copies of $h^(\( t \))$ are independent conditional on the root; each dominates the product of two edge-transformed upper child experiments. The refinement and composition arguments give, by induction, domination of the exact four-branch depth-$t$ experiment.

For a Poisson tree of chosen mean $d_(+)$ and rational magnitude $a_(+)$, fix an upper child law $m$. Its count-specific upper laws are

#[#set math.equation(numbering: n => "(6.8)")
 $ Q_0 = sans(U) \, #h(2em) Q_n = cal(C)_1 \( Q_(n - 1) \, m \) . $ <grid:counts>]

Each $Q_n$ dominates the exact $n$-branch experiment, with the child law $m$ held fixed throughout this count recursion. Write $q_n \( h \)$ for its integer units. If $p_n = e^(- d_(+)) d_(+)^n \/ n !$ and $w_n$ are integer lower weights satisfying $0 lt.eq w_n \/ N lt.eq p_n$, form

#[#set math.equation(numbering: n => "(6.9)")
 $ ell_h = sum_(n upright(" retained")) ⌊frac(w_n q_n \( h \), N)⌋ $ <grid:mixture>]

and complete the mass to $N$ at the pure orbit.

To justify the count and tail operations, first draw the count with its #emph[exact] probabilities $p_n$, then the upper experiment $Q_n$ conditional on that count and the common input spin. For omitted counts one may take $Q_n = sans(P)$, which dominates every experiment: given a revealed spin, simulate the required conditional data. With count included as data the resulting mixture dominates the exact Poisson experiment. For each count $n$, the upper law is a calibrated posterior experiment: if $rho_n$ is its labeled marginal law, then its conditional law under input $i$ is $3 p_i rho_n \( d p \)$, as in (6.1). The product tilt, barycentric refinement, and pure completion all preserve this identity, including the chosen pure law at omitted counts. Since the count has input-independent probabilities $p_n$, its joint law with the input and posterior is $bb(P) \( S = i \, n \, p in d p \) = p_n p_i rho_n \( d p \)$. Consequently the posterior given $\( n \, p \)$ is $p$. Posterior sufficiency therefore allows count to be forgotten while preserving equivalence. Its orbit masses are $W_h = sum_n p_n q_n \( h \) \/ N$, interpreting $q_n$ as the chosen pure law on omitted counts. Equation (6.9) satisfies $ell_h \/ N lt.eq W_h$ for every orbit. Lemma 21 applies to this one exact mixture, including the tail and all rounding losses. Thus iterating this completed Poisson operation from $sans(P)$ gives upper laws at every depth.

Here the weights are constructed entirely with integers. Put $S_0 = 10^15$ and $d_(+) = d_max \/ 200 lt.eq 881 \/ 200$. Beginning with $l_0 = u_0 = S_0$, compute for $1 lt.eq n lt.eq 41$

$ l_n = ⌊frac(l_(n - 1) d_max, 200 n)⌋ \, #h(2em) u_n = ⌈frac(u_(n - 1) d_max, 200 n)⌉ . $

These enclose $S_0 d_(+)^n \/ n !$. The degree-41 Taylor polynomial of $e^(- d_(+))$ is a lower bound, since its degree-42 Lagrange remainder is positive. Hence, with

#[#set math.equation(numbering: n => "(6.10)")
 $ L = S_0 + sum_(1 lt.eq n lt.eq 41\
n upright(" even")) l_n - sum_(1 lt.eq n lt.eq 41\
n upright(" odd")) u_n \, #h(2em) w_0 = ⌊frac(N L, S_0)⌋ \, $ <grid:taylor>]

we have $w_0 \/ N lt.eq e^(- d_(+))$. Positivity of $L$, and all arithmetic bounds, are proved in Appendix 10. Continue with $w_n = floor.l w_(n - 1) d_max \/ \( 200 n \) floor.r$ until the first zero. Induction gives $w_n \/ N lt.eq p_n$. For $n gt.eq 9$ one has $d_(+) \/ n < 1 \/ 2$, so the positive integer weights eventually vanish.

=== 6.4 Closed parameter coverage and certificate outputs <closed-parameter-coverage-and-certificate-outputs>

For $j = 0 \, dots.h \, 26$ set

#[#set math.equation(numbering: n => "(6.11)")
 $ d_min = 800 + 3 j \, quad d_max = 803 + 3 j \, quad I_j = \[ d_min \/ 200 \, d_max \/ 200 \] \, quad d_(+) = d_max \/ 200 . $ <grid:bins>]

Choose $a_(+) = A \/ 10^6$, where $A$ is the least positive integer such that

#[#set math.equation(numbering: n => "(6.12)")
 $ A^2 d_min gt.eq 200 dot.op 10^12 . $ <grid:magnitude>]

The integer binary search in the verifier finds this $A$ without square roots. Its upper endpoint $500000$ is valid since $d_min gt.eq 800$, so $a_(+) lt.eq 1 \/ 2$ is admissible. Minimality also gives $\( A - 1 \)^2 d_min < 200 dot.op 10^12$. For every equality point $d in I_j$, $a = d^(- 1 \/ 2)$, we have $d lt.eq d_(+)$ and $a lt.eq a_(+)$.

By Proposition 10, these coordinatewise bounds imply that, at every finite depth, the equality experiment with parameters $\( d \, - a \)$ is degraded from the single corner experiment $\( d_(+) \, - a_(+) \)$. The two kernels use thinning probability $d \/ d_(+)$ and channel factor $c = a \/ a_(+) in \[ 0 \, 1 \]$, respectively. They require only the observed tree, its boundary spins, and independent randomness, and remain valid at the closed bin endpoints, including $a_(+) = 1 \/ 2$.

The intervals (6.11) share endpoints and have union $\[ 4 \, 881 \/ 200 \]$. There is overlap with the analytic Poisson range in Proposition 5.1, because

#[#set math.equation(numbering: n => "(6.13)")
 $ 881 / 200 - frac(1, \( 477 \/ 1000 \)^2) = 453049 / 45505800 > 0 . $ <grid:overlap>]

Consequently these rectangles cover every Poisson equality not already covered there. No continuity assertion about the rounded recursion, or sampling of intermediate parameters, is involved. Figure 1 illustrates the domination in the first bin.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.62, -0.532), (7.44, -0.532), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.44, -0.532), [#text(size: 9pt)[$d$]], anchor: "west", padding: 0.1176cm)
  line((-0.62, -0.532), (-0.62, 3.752), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.62, 3.752), [#text(size: 9pt)[$a=| lambda |$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.532), (0, 2.8), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((6.2, -0.532), (6.2, 2.8), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.62, 2.8), (6.2, 2.8), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0, -0.532), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  content((6.2, -0.532), [#text(size: 9pt)[$803"/"200$]], anchor: "north", padding: 0.1176cm)
  content((-0.62, 2.8), [#text(size: 9pt)[$1"/"2$]], anchor: "east", padding: 0.1176cm)
  line((0, 2.8), (0.1033, 2.756), (0.2067, 2.713), (0.31, 2.669), (0.4133, 2.625), (0.5167, 2.581), (0.62, 2.538), (0.7233, 2.494), (0.8267, 2.45), (0.93, 2.406), (1.033, 2.363), (1.137, 2.319), (1.24, 2.275), (1.343, 2.232), (1.447, 2.188), (1.55, 2.144), (1.653, 2.101), (1.757, 2.057), (1.86, 2.013), (1.963, 1.969), (2.067, 1.926), (2.17, 1.882), (2.273, 1.838), (2.377, 1.795), (2.48, 1.751), (2.583, 1.708), (2.687, 1.664), (2.79, 1.62), (2.893, 1.577), (2.997, 1.533), (3.1, 1.489), (3.203, 1.446), (3.307, 1.402), (3.41, 1.358), (3.513, 1.315), (3.617, 1.271), (3.72, 1.228), (3.823, 1.184), (3.927, 1.14), (4.03, 1.097), (4.133, 1.053), (4.237, 1.01), (4.34, 0.9661), (4.443, 0.9225), (4.547, 0.879), (4.65, 0.8354), (4.753, 0.7918), (4.857, 0.7483), (4.96, 0.7047), (5.063, 0.6612), (5.167, 0.6176), (5.27, 0.5741), (5.373, 0.5305), (5.477, 0.487), (5.58, 0.4435), (5.683, 0.3999), (5.787, 0.3564), (5.89, 0.3129), (5.993, 0.2694), (6.097, 0.2259), (6.2, 0.1824), stroke: (paint: rgb("#000080"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 2.8), radius: 0.04939, fill: black, stroke: none)
  circle((6.2, 0.1824), radius: 0.04939, fill: black, stroke: none)
  circle((6.2, 2.8), radius: 0.07056, fill: black, stroke: none)
  content((6.2, 2.8), [#text(size: 9pt)[$(d_+,a_+)$]], anchor: "south-west", padding: 0.1176cm)
  line((6.014, 2.8), (3.1, 2.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.557, 2.8), [#text(size: 9pt)[thin offspring]], anchor: "south", padding: 0.1176cm)
  line((3.1, 2.716), (3.1, 1.587), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.224, 2.212), [#text(size: 9pt)[reduce magnitude]], anchor: "west", padding: 0.1176cm)
  circle((3.1, 1.489), radius: 0.07056, fill: black, stroke: none)
  content((3.1, 1.405), [#text(size: 9pt)[$(d,d^(-1"/"2))$]], anchor: "north-east", padding: 0.1176cm)
  content((4.092, 0.56), [#text(fill: rgb("#000080"))[#text(size: 9pt)[$a=d^(-1"/"2)$]]], anchor: "north-west", padding: 0.1176cm)
})],
  caption: [Figure 1: Domination in the first closed Poisson bin $\[ 4 \, 803 \/ 200 \]$; the two axes use different enlarged scales. The upper corner has $a_(+) = 1 \/ 2$ and $d_(+) = 803 \/ 200$, so it dominates every equality experiment in the bin by thinning offspring and reducing the channel magnitude. It lies above the equality curve. The certificate only brings its finite-depth upper law below $mu = 1 \/ 20$; the local fixed-point gap is applied to the target equality experiment. ],
) <fig:dominating-bin>

For each grid representative,

$ lr(|sum_i h_i / H omega^i|)^2 = 1 - frac(3 \( h_0 h_1 + h_1 h_2 + h_2 h_0 \), H^2) . $

Define the integer

#[#set math.equation(numbering: n => "(6.14)")
 $ M \( m \) = sum_h m_h #scale(x: 120%, y: 120%)[\[] H^2 - 3 \( h_0 h_1 + h_1 h_2 + h_2 h_0 \) #scale(x: 120%, y: 120%)[\]] . $ <grid:moment>]

The certificate stops exactly when $20 M \( m \) < N H^2$, equivalently $mu \( m \) < 1 \/ 20$. The exact code is included in Section 11.3. With assertions enabled it returns iteration $162$ for argument $- 1$, the regular coloring recursion with four children at each vertex. For arguments $j = 0 \, dots.h \, 26$, the Poisson recursions return, in order,

#[#set math.equation(numbering: n => "(6.15)")
 $ 104 \, 103 \, 103 \, 103 \, 102 \, 102 \, 102 \, 102 \, 102 \,\
101 \, 101 \, 101 \, 101 \, 101 \, 101 \,\
100 \, 100 \, 100 \, 100 \, 100 \, 100 \, 100 \,\
99 \, 99 \, 99 \, 99 \, 99 . $ <grid:outputs>]

All comparisons determining these integers use exact integer arithmetic. Appendix 10 gives the bounds preventing overflow and the correspondence between each code operation and the constructions proved above.

#thm([Proposition 6.3.])[
  (Completion of the negative threshold).  #emph[For both tree models, every admissible negative parameter with $d a^2 lt.eq 1$ is non-reconstructible (with $d = b$ for a regular tree).]
] <grid:negative-completion>

#proof[
  Consider first negative equality. For the regular tree with $b = 4$, the upper law at depth $162$ has $mu < 1 \/ 20$. For every Poisson equality $d in \[ 4 \, 881 \/ 200 \]$, choose a bin containing $d$ and its stopping depth from (6.15). The corresponding upper law dominates the exact equality depth experiment by the recursion and the two garblings above. Conditional Jensen gives $mu_(upright("true")) lt.eq mu_(upright("upper")) < 1 \/ 20$ at that depth. By Proposition 6, the actual depth laws have a symmetric fixed-point limit and their moments decrease to its moment. The limit therefore has $mu < 1 \/ 20$ and is uniform by Proposition 4.1. This proves non-reconstruction in the certified range.
  Proposition 6 includes the coloring endpoint: its proof extends the tilted recursion continuously across zero likelihood normalizers and controls the Poisson count tail. Thus the preceding fixed-point inference also applies at $a = 1 \/ 2$.
  Every remaining admissible regular equality has integer $b gt.eq 5$ and $a lt.eq 1 \/ sqrt(5) < 448 \/ 1000$. Every remaining Poisson equality beyond $881 \/ 200$ has $a < 477 \/ 1000$ by (6.13). Proposition 5.1 excludes nonuniform fixed points in these ranges, completing all negative equalities.
  For $d gt.eq 4$, every parameter $- d^(- 1 \/ 2) lt.eq lambda < 0$ is obtained by the independent increment garbling from the equality parameter $- 1 \/ sqrt(d)$; hence its advantage also tends to zero. For the remaining parameters, first compare the coloring experiment with branching parameter four to a smaller-branching coloring experiment. For a regular tree keep a fixed $b$ children at each vertex, and for a Poisson tree retain each child with probability $d \/ 4$, using the tree observation and independent randomness. This gives the smaller-tree observation without the root. Finally apply the increment garbling from $- 1 \/ 2$ to the desired negative parameter. Thus all admissible negative channels with branching parameter below four are non-reconstructible as well. These are statements about the unconditional Poisson experiments, so the conclusion uses exactly the averaging convention of the problem. ◻
]

== 7 Completion and the stochastic block model <sec:completion>

Table 1 collects the arguments for the equality cases. In the table, $a = \| lambda \|$ denotes the negative channel magnitude.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Equality case
], table.cell(rowspan: 1, colspan: 1)[Parameter range
], table.cell(rowspan: 1, colspan: 1)[Argument
]),
  table.cell(rowspan: 1, colspan: 1)[Positive channel
], table.cell(rowspan: 1, colspan: 1)[All admissible $d > 1$
], table.cell(rowspan: 1, colspan: 1)[Analytic exclusion, Section 3
],
  table.cell(rowspan: 1, colspan: 1)[Negative, regular
], table.cell(rowspan: 1, colspan: 1)[$b gt.eq 5$, so $a = b^(- 1 \/ 2) < .448$
], table.cell(rowspan: 1, colspan: 1)[Weighted identities, Section 5
],
  table.cell(rowspan: 1, colspan: 1)[Negative, regular
], table.cell(rowspan: 1, colspan: 1)[$b = 4$, $a = 1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[Finite domination, Section 6
],
  table.cell(rowspan: 1, colspan: 1)[Negative, Poisson
], table.cell(rowspan: 1, colspan: 1)[$a = d^(- 1 \/ 2) lt.eq .477$
], table.cell(rowspan: 1, colspan: 1)[Weighted identities, Section 5
],
  table.cell(rowspan: 1, colspan: 1)[Negative, Poisson
], table.cell(rowspan: 1, colspan: 1)[$4 lt.eq d lt.eq 881 \/ 200$
], table.cell(rowspan: 1, colspan: 1)[Finite domination, Section 6
],
)
]],
  caption: [Table 1: Coverage of $d lambda^2 = 1$, with $a = \| lambda \|$ on the negative side. The two Poisson ranges overlap since $881 \/ 200 > \( 1000 \/ 477 \)^2$. Below branching parameter four, negative channels follow by degradation from the coloring case. ],
)

#proof[
  Proposition 9 proves reconstruction whenever $d lambda^2 > 1$. Conversely, Proposition 13 proves non-reconstruction for $0 lt.eq lambda lt.eq d^(- 1 \/ 2)$, and Proposition 22 proves it for every admissible negative parameter with $d lambda^2 lt.eq 1$. These conclusions include all equality cases and exhaust the channel domain. The Poisson statements use the original tree law, without conditioning on survival. ◻
]

We return to the stochastic block model of Section 1.4, where $a \, b > 0$ are the within- and between-community connectivity parameters and $d = \( a + 2 b \) \/ 3 > 1$. The remaining step is to apply the external tree-to-graph and algorithmic results to the tree theorem.

#proof[
  Set
  $ lambda = frac(a - b, a + 2 b) in \( - 1 \/ 2 \, 1 \) \, #h(2em) d lambda^2 = frac(\( a - b \)^2, 3 \( a + 2 b \)) . $
  The corresponding Poisson broadcast process has exactly the transition matrix (1.1). Suppose first that $d lambda^2 lt.eq 1$. Theorem 1 gives $a_ell arrow.r 0$ for this process.
  To match the fixed-tree formulation of non-reconstruction, let $T$ be the entire Poisson tree and put
  $ A_ell \( T \) = bb(E) #h(-0.16667em) [∥bb(P) \( sigma_rho = dot.op divides T \, sigma_(partial T_ell) \) - "Unif" { 1 \, 2 \, 3 }∥_(upright("TV")) \| T] . $
  For almost every fixed $T$, the boundary experiment is degraded as $ell$ increases, so $A_ell \( T \)$ decreases to a nonnegative limit $A_oo \( T \)$. The offspring beyond depth $ell$ are independent of the root and depth-$ell$ spins conditional on $T_(lt.eq ell)$, and hence $bb(E) A_ell \( T \) = a_ell$. Bounded convergence therefore gives $bb(E) A_oo \( T \) = 0$, so $A_oo \( T \) = 0$ for almost every $T$. If $mu_(ell \, i)^T$ is the boundary law conditional on root state $i$ and $overline(mu)_ell^T = 1 / 3 sum_i mu_(ell \, i)^T$, Bayes’ formula gives
  $ A_ell \( T \) = 1 / 3 sum_(i = 1)^3 d_(upright("TV")) \( mu_(ell \, i)^T \, overline(mu)_ell^T \) \, $
  where $d_(upright("TV"))$ denotes total-variation distance. The triangle inequality now shows that the pairwise total-variation distances between the $mu_(ell \, i)^T$ tend to zero for almost every $T$. This is the non-reconstruction hypothesis of the tree-to-graph transfer of Mossel, Sly, and Sohn #cite(label("MosselSlySohn2025")) Theorem 2.1. Their conclusion, with the overlap of their Definition 1.4, gives
  $ limsup_(n arrow.r oo) bb(E) "ov" \( sigma \, hat(sigma)_n \) lt.eq 1 / 3 $
  for deterministic estimators. Any violation by randomized estimators would, for each $n$, admit a deterministic choice of the independent seed with expected overlap at least the randomized expectation minus $1 \/ n$, contradicting the same bound. For every pair of labelings, the average agreement over all six permutations is $1 \/ 3$, so its maximum is at least $1 \/ 3$. This proves (i).
  If $d lambda^2 > 1$, Corollary 1 of Abbe and Sandon #cite(label("AbbeSandon2018")), with three communities, gives an $O \( n log n \)$ algorithm for detection. Their Lemma 1 converts their two-set detection criterion, for uniform community probabilities, into overlap exceeding $1 \/ 3$ by a fixed positive amount with probability tending to one. This proves (ii). ◻
]

The corollary covers both $a > b$ and $a < b$. Its positive-parameter hypothesis is part of the statement: the boundary cases $a = 0$ or $b = 0$ are not included. In particular, the negative equality has $d > 4$ here; the coloring equality $a = 0$, $b = 6$, $d = 4$ is excluded.

== 8 The radial inequality <rad:section>

This appendix proves the pointwise inequality used for positive channel parameters. Its algebraic certificates are given explicitly, so the proof requires no numerical or computer-assisted verification.

#thm([Lemma 8.1.])[
  (Radial inequality).  #emph[Let $m = \( m_1 \, m_2 \, m_3 \)$ have positive coordinates and $chevron.l m chevron.r = 1$, where $chevron.l w chevron.r = 1 / 3 sum_(i = 1)^3 w_i$. Put 
$ v = m - 1 \, #h(2em) x = 1 / 2 chevron.l v^2 chevron.r \, #h(2em) g = chevron.l log m chevron.r \, #h(2em) u_i = log m_i - g \, $

 
$ J = 1 / 2 chevron.l v log m chevron.r \, #h(2em) B = 1 / 2 chevron.l m u^2 chevron.r \, #h(2em) F \( m \) = 3 g + 4 J + 4 / 5 B . $

 Since $I = g + 2 J$, this is the functional $F$ in Equation (3.3). Then, for every $0 < lambda < 1$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ F \( m \) - lambda^(- 2) F \( 1 + lambda v \) gt.eq frac(1 - lambda^2, 2) thin x^2 . $ <rad:inequality>]

]
] <rad:lemma>

#proof[
  Fix the message in the statement and write
  $ m \( tau \) = 1 + tau v^(\( 0 \)) \, #h(2em) x \( tau \) = tau^2 x_0 \, #h(2em) cal(F) \( tau \) = F \( m \( tau \) \) \, #h(2em) 0 lt.eq tau lt.eq 1 \, $
  where $v^(\( 0 \)) = m - 1$ and $x_0 = 1 / 2 chevron.l \( v^(\( 0 \)) \)^2 chevron.r$. Every coordinate of $m \( tau \)$ is positive on this interval. The functions are analytic near $tau = 0$. Since $chevron.l v^(\( 0 \)) chevron.r = 0$, we have $g \( tau \) = O \( tau^2 \)$, $J \( tau \) = O \( tau^2 \)$ and $B \( tau \) = O \( tau^2 \)$, so $cal(F) \( tau \) = O \( tau^2 \)$. Let $partial = tau frac(d, d tau)$. We claim that it suffices to prove
  #[#set math.equation(numbering: n => "(8.2)")
   $ partial \( partial - 1 \) \( partial - 2 \) cal(F) \( tau \) gt.eq 12 x \( tau \)^2 #h(2em) \( 0 < tau lt.eq 1 \) . $ <rad:differential-bound>]
  To see this, suppose the bound holds along the ray. Define
  $ Y = \( partial - 2 \) cal(F) - x \( tau \)^2 \, #h(2em) Z = \( partial - 1 \) Y . $
  The operator $partial - 2$ annihilates the quadratic Taylor term, giving $Y = O \( tau^3 \)$ and $Z = O \( tau^3 \)$ as $tau arrow.b 0$. Since $partial \( partial - 1 \) x \( tau \)^2 = 12 x \( tau \)^2$, Equation (8.2) gives $partial Z gt.eq 0$. For $tau > 0$ this means $Z' \( tau \) gt.eq 0$, and $Z \( 0 \) = 0$ therefore gives $Z gt.eq 0$. Next,
  $ (frac(Y \( tau \), tau))' = frac(Z \( tau \), tau^2) gt.eq 0 . $
  The limit of $Y \( tau \) \/ tau$ at zero is zero, so $Y gt.eq 0$. Finally,
  $ frac(d, d tau) [frac(cal(F) \( tau \) - 1 / 2 tau^4 x_0^2, tau^2)] = frac(Y \( tau \), tau^3) gt.eq 0 . $
  Evaluating the resulting monotonicity between $tau = lambda$ and $tau = 1$ gives
  $ F \( m \) - 1 / 2 x_0^2 gt.eq lambda^(- 2) F \( 1 + lambda v^(\( 0 \)) \) - 1 / 2 lambda^2 x_0^2 \, $
  which is Equation (8.1).
  It remains to establish Equation (8.2) for every positive message. All quantities in the following calculation refer to the current message on the ray. Set
  $ y = 1 / 2 chevron.l v^3 chevron.r . $
  Thus $partial v = v$, $partial x = 2 x$, and $partial y = 3 y$. Introduce
  $ U_j = chevron.l m^(- j) chevron.r \, #h(2em) S_j = chevron.l u m^(- j) chevron.r \, #h(2em) U = U_1 \, quad S = S_1 \, quad M = 2 J \, quad V = 2 B \, quad W = chevron.l u^2 chevron.r . $
  In particular $M = chevron.l m u chevron.r$, since $chevron.l u chevron.r = 0$, and $F = 3 g + 2 M + 2 / 5 V$. The identities
  $ partial log m_i = 1 - m_i^(- 1) \, #h(2em) partial u_i = U - m_i^(- 1) $
  give
  #[#set math.equation(numbering: n => "(8.3)")
   $ partial g & = 1 - U \, & partial M & = M + U - 1 \,\
partial V & = V - W + 2 U M \, & partial W & = - 2 S \,\
partial S & = U^2 - U_2 - S + S_2 \, & partial U_j & = j \( U_(j + 1) - U_j \) . $ <rad:differentiation>]
  For example, differentiating $V = chevron.l m u^2 chevron.r$ gives $chevron.l v u^2 chevron.r + 2 chevron.l m u \( U - m^(- 1) \) chevron.r = V - W + 2 U M$; differentiating $S$ gives the next-to-last identity in (8.3). Applying these identities to $F$ yields
  #[#set math.equation(numbering: n => "(8.4)")
   $ G & := partial \( partial - 1 \) \( partial - 2 \) F\
 & = 6 - 12 U + 8 U_2 - 2 U_3\
 & quad + 4 / 5 #scale(x: 120%, y: 120%)[\[] S_2 - 3 S + \( 2 U_3 - 3 U_2 \) M + 3 \( U - 1 \) \( U_2 - U \) #scale(x: 120%, y: 120%)[\]] . $ <rad:G>]
  Our remaining goal is $G gt.eq 12 x^2$.
  The elementary symmetric identities for the three zero-sum coordinates $v_i$ are
  #[#set math.equation(numbering: n => "(8.5)")
   $ v_i^3 = 3 x v_i + 2 y \, #h(2em) D_t := product_(i = 1)^3 \( 1 + t v_i \) = 1 - 3 t^2 x + 2 t^3 y . $ <rad:cubic>]
  Write $D = D_1$. For $0 lt.eq t lt.eq 1$ all the factors in $D_t$ are positive and have arithmetic mean one, so
  #[#set math.equation(numbering: n => "(8.6)")
   $ 0 < D_t lt.eq 1 . $ <rad:denominator-range>]
  Define the coordinate polynomials
  $ h_i = 1 - v_i + v_i^2 - 3 x \, #h(2em) k_i \( t \) = v_i - t \( v_i^2 - 2 x \) . $
  The product of the two factors $1 + v_j$ with $j eq.not i$ is $h_i$, hence $m_i^(- 1) = h_i \/ D$. Similarly, centering the logarithmic integral gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ frac(v_i, 1 + t v_i) - chevron.l frac(v, 1 + t v) chevron.r = frac(k_i \( t \), D_t) \, #h(2em) u_i = integral_0^1 frac(k_i \( t \), D_t) thin d t . $ <rad:log-integral>]
  The first identity follows by multiplying by $D_t$ and using (8.5); the second follows by integration. All denominators here are bounded away from zero for the fixed positive message under consideration.
  Put $H_j = chevron.l h^j chevron.r$. Substitution of these formulas into (8.4) separates its polynomial and logarithmic terms:
  #[#set math.equation(numbering: n => "(8.8)")
   $ D^3 \( G - 12 x^2 \) = R + integral_0^1 frac(N \( t \), D_t) thin d t \, $ <rad:RN-representation>]
  where
  #[#set math.equation(numbering: n => "(8.9)")
   $ R =  & \( 6 - 12 x^2 \) D^3 - 12 H_1 D^2 + 8 H_2 D - 2 H_3 + 12 / 5 \( H_1 - D \) \( H_2 - H_1 D \) \,\
N \( t \) =  & 4 / 5 chevron.l k \( t \) #scale(x: 120%, y: 120%)[\[] h^2 D - 3 h D^2 + \( 2 H_3 - 3 H_2 D \) v #scale(x: 120%, y: 120%)[\]] chevron.r . $ <rad:RN-definition>]
  In particular $N \( t \)$ is affine in $t$. Let
  #[#set math.equation(numbering: n => "(8.10)")
   $ L = R + integral_0^1 N \( t \) \( 2 - D_t \) thin d t . $ <rad:L-definition>]
  Since
  $ 1 / D_t - \( 2 - D_t \) = frac(\( 1 - D_t \)^2, D_t) gt.eq 0 \, $
  it suffices for (8.2) to prove
  #[#set math.equation(numbering: n => "(8.11)")
   $ N \( 0 \) gt.eq 0 \, #h(2em) N \( 1 \) gt.eq 0 \, #h(2em) L gt.eq 0 . $ <rad:polynomial-goal>]
  Indeed, the first two inequalities imply $N \( t \) gt.eq 0$ on $\[ 0 \, 1 \]$, and then (8.8) is at least $L$.
  We give the polynomial computations and their sign certificates in full. For their verification one only needs the recurrence
  $ P_0 = 1 \, quad P_1 = 0 \, quad P_2 = 2 x \, #h(2em) P_j = 3 x P_(j - 2) + 2 y P_(j - 3) quad \( j gt.eq 3 \) \, #h(2em) P_j = chevron.l v^j chevron.r . $
  The remaining moments that occur in (8.9) are
  $ P_3 = 2 y \, quad P_4 = 6 x^2 \, quad P_5 = 10 x y \, quad P_6 = 18 x^3 + 4 y^2 . $
  Expanding $h^j$ and using these moments gives
  #[#set math.equation(numbering: n => "(8.12)")
   $ H_1 & = 1 - x \,\
H_2 & = 3 x^2 - 4 y + 1 \,\
H_3 & = - 9 x^3 + 9 x^2 + 6 x y + 3 x + 4 y^2 - 14 y + 1 . $ <rad:H-expansions>]
  The two coefficients of the affine polynomial $N \( t \)$ are explicitly
  #[#set math.equation(numbering: n => "(8.13)")
   $ 5 / 24 N \( t \) =  & A \( x \, y \) + t C \( x \, y \) \,\
A \( x \, y \) =  & 3 x^4 + 12 x^3 + x^2 + \( - 6 x^3 - 28 x^2 - 2 x \) y + \( 26 x - 2 \) y^2 - 4 y^3 \,\
C \( x \, y \) =  & 6 x^4 - 2 x^3 + \( - 13 x^3 - 10 x^2 - x \) y + \( 10 x^2 + 22 x + 4 \) y^2 - 16 y^3 . $ <rad:N-expansion>]
  In particular their sum factors as
  #[#set math.equation(numbering: n => "(8.14)")
   $ 5 / 24 N \( 1 \) = \( x - y \) \( 9 x - 10 y + 1 \) \( x^2 + x - 2 y \) . $ <rad:N1>]
  Integrating (8.13) against $2 - D_t$ in (8.10), and using (8.12), gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ 25 / 6 L =  & 1500 x^5 - 1020 x^4 + 240 x^3 + 168 y^4\
 & + \( - 480 x^2 - 756 x - 52 \) y^3\
 & + \( 2114 x^3 + 710 x^2 + 48 x - 80 \) y^2\
 & + \( - 3093 x^4 + 736 x^3 - 35 x^2 \) y . $ <rad:L-expansion>]
  These are finite polynomial identities: the displayed moment recurrence provides a direct way to check every coefficient.
  We next describe the domain on which their signs are required. Positivity and $sum_i m_i = 3$ imply $sum_i m_i^2 < 9$, and therefore $0 lt.eq x < 1$. The discriminant identity for (8.5) is
  $ product_(1 lt.eq i < j lt.eq 3) \( v_i - v_j \)^2 = 108 \( x^3 - y^2 \) \, $
  so $\| y \| lt.eq x^(3 \/ 2)$. Consequently each factor in (8.14) is nonnegative, as is seen from
  $ x - y & gt.eq x \( 1 - sqrt(x) \) \,\
9 x - 10 y + 1 & gt.eq \( 1 - sqrt(x) \) \( 10 x + sqrt(x) + 1 \) \,\
x^2 + x - 2 y & gt.eq x \( 1 - sqrt(x) \)^2 . $
  This proves $N \( 1 \) gt.eq 0$.
  If $x = 0$, then $v = 0$ and the lemma is immediate, so henceforth take $x > 0$. Set $r = y \/ x$. Then $r^2 lt.eq x$ and $r lt.eq sqrt(x) < 1$, while $D > 0$ gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ r^2 lt.eq x < frac(1, 3 - 2 r) . $ <rad:domain>]
  The denominator is positive. Combining these inequalities yields
  $ 0 < 1 - r^2 \( 3 - 2 r \) = \( 1 - r \)^2 \( 2 r + 1 \) \, $
  and hence $- 1 / 2 < r < 1$. Every point of (8.16) is represented by
  #[#set math.equation(numbering: n => "(8.17)")
   $ x = frac(r^2 + z \/ \( 3 - 2 r \), 1 + z) \, #h(2em) y = r x \, #h(2em) z = frac(x - r^2, 1 \/ \( 3 - 2 r \) - x) gt.eq 0 . $ <rad:z-substitution>]
  Thus the parametrization includes $x = r^2$ without a limiting argument; the excluded upper endpoint corresponds to a zero coordinate of $m$.
  For clarity write $tilde(N)_0 \( r \, z \)$ and $tilde(L) \( r \, z \)$ for $N \( 0 \)$ and $L$ after the substitution (8.17), and keep $x$ on the left sides below as the expression in that substitution. The exact coefficient identity for $N \( 0 \)$ is
  #[#set math.equation(numbering: n => "(8.18)")
   $ \( 1 + z \)^2 \( 3 - 2 r \)^2 frac(5 tilde(N)_0, 24 x^2) = a_0 \( r \) + a_1 \( r \) z + a_2 \( r \) z^2 \, $ <rad:N0-certificate>]
  where
  $ a_0 \( r \) & = \( 1 - r \)^3 \( 3 - 2 r \)^2 \( 10 r^2 + r + 1 \) \,\
a_1 \( r \) & = 2 \( 1 - r \)^3 \( 3 - 2 r \) \( 9 + 5 r + 20 r^2 - 4 r^3 \) \,\
a_2 \( r \) & = 48 \( 1 - r \)^3 . $
  All three coefficients are nonnegative for $- 1 / 2 lt.eq r lt.eq 1$. For the first, the quadratic $10 r^2 + r + 1$ has positive leading coefficient and discriminant $1 - 40 = - 39 < 0$. For the second,
  $ 9 + 5 r + 20 r^2 - 4 r^3 = 9 + 5 r + r^2 \( 20 - 4 r \) gt.eq 13 / 2 . $
  The remaining factors in these expressions are visibly nonnegative. Since the multiplier on the left of (8.18) is positive on our domain, $N \( 0 \) gt.eq 0$ follows.
  The corresponding identity for $L$ is
  #[#set math.equation(numbering: n => "(8.19)")
   $ \( 1 + z \)^3 \( 3 - 2 r \)^3 frac(25 tilde(L), 6 x^2) = b_0 \( r \) + b_1 \( r \) z + b_2 \( r \) z^2 + b_3 \( r \) z^3 \, $ <rad:L-certificate>]
  where
  $ b_0 \( r \) & = r^2 \( 1 - r \)^3 \( 3 - 2 r \)^3 f_0 \( r \) \,\
b_1 \( r \) & = \( 1 - r \)^3 \( 3 - 2 r \)^2 f_1 \( r \) \,\
b_2 \( r \) & = 2 \( 1 - r \)^3 \( 3 - 2 r \) f_2 \( r \) \,\
b_3 \( r \) & = 24 \( 1 - r \)^3 \( 25 - 4 r^2 - 10 r \) \, $
  and every coefficient of the three remaining polynomials is as follows:
  #[#set math.equation(numbering: n => "(8.20)")
   $ f_0 \( r \) & = 480 r^4 - 842 r^3 - 117 r^2 + 445 r + 160 \,\
f_1 \( r \) & = 336 r^6 - 1008 r^5 + 1096 r^4 - 896 r^3 + 63 r^2 + 685 r + 240 \,\
f_2 \( r \) & = 440 r^4 - 1104 r^3 + 368 r^2 + 413 r + 210 . $ <rad:f-polynomials>]
  Identities (8.18) and (8.19) follow by substituting (8.17) into (8.13) and (8.15), respectively, and clearing the displayed denominators. The factor $25 - 4 r^2 - 10 r$ is at least $11$ on $\[ - 1 / 2 \, 1 \]$: its derivative is $- 8 r - 10 < 0$ throughout that interval. It remains to establish the signs of $f_0 \, f_1 \, f_2$.
  Use the bijective change of variable
  $ r = frac(p - 1 \/ 2, 1 + p) \, #h(2em) p = frac(r + 1 \/ 2, 1 - r) gt.eq 0 quad (- 1 / 2 lt.eq r < 1) . $
  The resulting polynomial identities, with all coefficients displayed, are
  #[#set math.equation(numbering: n => "(8.21)")
   $ 4 \( 1 + p \)^4 f_0 #h(-0.16667em) (frac(p - 1 \/ 2, 1 + p)) & = 504 p^4 + 4386 p^3 + 12267 p^2 - 1161 p + 174 \,\
4 \( 1 + p \)^6 f_1 #h(-0.16667em) (frac(p - 1 \/ 2, 1 + p)) & = 2064 p^6 + 15486 p^5 + 36669 p^4 + 31368 p^3\
 & #h(2em) + 20184 p^2 - 2724 p + 522 \,\
4 \( 1 + p \)^4 f_2 #h(-0.16667em) (frac(p - 1 \/ 2, 1 + p)) & = 1308 p^4 + 7650 p^3 + 12366 p^2 - 1842 p + 1044 . $ <rad:p-certificates>]
  Each right side is a polynomial with nonnegative coefficients in degrees at least three, plus a strictly positive quadratic. The exact discriminants of those quadratic tails are
  $ \( - 1161 \)^2 - 4 dot.op 12267 dot.op 174 & = - 7 thin 189 thin 911 < 0 \,\
\( - 2724 \)^2 - 4 dot.op 20184 dot.op 522 & = - 34 thin 724 thin 016 < 0 \,\
\( - 1842 \)^2 - 4 dot.op 12366 dot.op 1044 & = - 48 thin 247 thin 452 < 0 . $
  Their leading coefficients are positive, so all three tails are strictly positive on the real line. Thus $f_i \( r \) > 0$ for $- 1 / 2 lt.eq r < 1$; their values at $r = 1$ are, respectively, $126 \, 516 \, 327$, also positive. Every $b_j \( r \)$ is consequently nonnegative on $\[ - 1 / 2 \, 1 \]$. Equation (8.19) proves $L gt.eq 0$, finishing (8.11) and hence (8.2). The initial reduction now proves the lemma. ◻
]

== 9 Correctness of the interval certificate <int:certificate>

This appendix explains the integer interval certificate for the strict positivity of the polynomial (5.8). The coefficients are those in (5.9), with the matching parameter choices in (5.10). The certified domain consists of every probability vector on three states, every $xi in \[ 3 \/ 100 \, 1 \]$, and each of the three closed $a$ intervals

$ \[ 0 \, 190 \/ 1000 \] \, #h(2em) \[ 190 \/ 1000 \, 448 \/ 1000 \] \, #h(2em) \[ 448 \/ 1000 \, 477 \/ 1000 \] . $

The third interval uses the Poisson values $H = 1 \/ 12$, $U = 1 \/ 2$; the first two use $H = 1 \/ 16$, $U = 15 \/ 32$. The source is supplied unchanged as #raw("verification/interval.cpp"); see also Section 11.2. Assertions and signed 128-bit integer arithmetic are part of the certificate. We first explain what its arithmetic computes and then why normal completion proves the claimed inequality over the entire domain.

=== 9.1 Coordinates, formulas, and boundary extensions <int:parametrization>

The quantities being checked are invariant under permutation of the three coordinates. After sorting a probability vector in decreasing order, it has the representation

#[#set math.equation(numbering: n => "(9.1)")
 $ p = frac(\( 1 \, q^18 \, r^18 \), Z) \, #h(2em) Z = 1 + q^18 + r^18 \, #h(2em) 0 lt.eq r lt.eq q lt.eq 1 . $ <int:coordinates>]

Indeed, the largest probability is positive; take the eighteenth roots of the other two probabilities divided by it. The formulas below are valid on the larger square $0 lt.eq q \, r lt.eq 1$, which will allow rectangular intervals that cross the diagonal $r = q$.

Set $m_i = 3 p_i$ and $v_i = m_i - 1$. Then

$ v = (3 / Z - 1 \, frac(3 q^18, Z) - 1 \, frac(3 r^18, Z) - 1) \, #h(2em) x = 1 / 6 sum_(i = 1)^3 v_i^2 \, #h(2em) y = 1 / 2 v_1 v_2 v_3 . $

In particular, $- 1 lt.eq v_i lt.eq 2$ everywhere on the square. For positive $q \, r$, write $L_q = log q$ and $L_r = log r$. The centered logarithms $u_i = log m_i - 1 / 3 sum_j log m_j$ are

$ \( - 6 \( L_q + L_r \) \, med 12 L_q - 6 L_r \, med 12 L_r - 6 L_q \) . $

Consequently the functions used in the weighted argument are exactly

#[#set math.equation(numbering: n => "(9.2)")
 $ G & = frac(3 q^6 r^6, Z) \, & T & = 1 - G \,\
W & = 216 / Z q^6 r^6 \( L_q^2 + L_r^2 - L_q L_r \) \,\
Y & = 648 / Z q^6 r^6 \( 2 L_q^3 + 2 L_r^3 - 3 L_q^2 L_r - 3 L_q L_r^2 \) . $ <int:weighted-functions>]

These expressions explain the constants $216$ and $648$ in #raw("coeff"). The entries returned by #raw("qt") are enclosures of $q^18$ and $q^6 \( log q \)^j$, $0 lt.eq j lt.eq 3$, together with their derivatives; the analogous entries are used for $r$.

For the edge functions put

$ e_i = 1 - a v_i \, #h(2em) G_e = \( e_1 e_2 e_3 \)^(1 \/ 3) \, #h(2em) cal(L) \( t \) = cases(delim: "{", - log \( 1 - t \) \/ t \, & t eq.not 0 \,, 1 \, & t = 0 .) $

Define

$ b_i = - v_i cal(L) \( a v_i \) \, #h(2em) w_i = b_i - 1 / 3 sum_j b_j . $

For $a > 0$, $b_i = log \( e_i \) \/ a$, so the centered edge logarithms are $a w_i$. Since $sum_i v_i = 0$,

$ G_e^3 = 1 - 3 a^2 x - 2 a^3 y . $

Factoring $1 - G_e^3$ gives the formulas used in the code:

#[#set math.equation(numbering: n => "(9.3)")
 $ hat(T) = frac(3 x + 2 a y, 1 + G_e + G_e^2) \, #h(2em) hat(W) = G_e / 3 sum_i w_i^2 \, #h(2em) hat(Y) = a G_e w_1 w_2 w_3 . $ <int:edge-functions>]

Here $hat(T) = T_e \/ a^2$, $hat(W) = W_e \/ a^2$, and $hat(Y) = Y_e \/ a^2$ when $a > 0$. The last identity uses $1 / 3 sum_i w_i^3 = w_1 w_2 w_3$ for three centered coordinates. Thus the code variables #raw("Te"), #raw("We"), and #raw("Ye") are the hatted quantities. At $a = 0$, the formulas give continuously

$ G_e = 1 \, #h(2em) hat(T) = x \, #h(2em) hat(W) = 2 x \, #h(2em) hat(Y) = 0 . $

There is no division by $a$ in the implemented expressions. Substituting (9.2) and (9.3) into the four entries returned by #raw("coeff") gives, term by term, $\( D_0 \, D_1 \, D_2 \, D_3 \)$ in (5.9). In the parameter structure, #raw("del"), #raw("ch"), and #raw("cu") mean $delta \, H \, U$, and the code forms $s_0 = c_0 + 1 \/ 3$.

All boundary probability vectors are included. Each function $q^6 \( log q \)^j$, $0 lt.eq j lt.eq 3$, is assigned value zero at $q = 0$. Its derivative for $q > 0$ is

#[#set math.equation(numbering: n => "(9.4)")
 $ 6 q^5 \( log q \)^j + j q^5 \( log q \)^(j - 1) \, $ <int:log-product-derivative>]

where the second term is omitted when $j = 0$. Both the function and its derivative tend to zero at zero. Thus the expressions have continuous first derivatives up to the boundary; when $q r = 0$ they give $T = 1$ and $W = Y = 0$. Since $Z gt.eq 1$ and $e_i > 0$ throughout the domain, all four $D_i$ have the same regularity, including at $a = 0$.

=== 9.2 Integer intervals and machine safety <int:arithmetic>

Let $S = 2^40$. An object #raw("I") with integer endpoints $\( l \, h \)$ represents $\[ l \/ S \, h \/ S \]$. The functions #raw("unit") and #raw("integer") represent a grid point and a small integer, respectively. With positive denominator, #raw("rat")$\( b \, c \)$ represents

$ [frac(floor.l S b \/ c floor.r, S) \, frac(ceil.l S b \/ c ceil.r, S)] . $

The helpers #raw("mf")$\( b \, c \)$ and #raw("floor_div")$\( b \, c \)$ compute the mathematical floors of $b c \/ S$ and $b \/ c$, also for negative numerators: the negative branch uses the negative of the corresponding positive ceiling. Upper endpoints are obtained by negating a floor of a negated expression. Addition and subtraction are exact on the grid. Multiplication chooses the appropriate endpoint extrema in each sign case; when both intervals cross zero it takes the minimum of the two potentially negative products and the maximum of the two potentially positive products. The square operation assigns lower endpoint zero when its input crosses zero.

For a positive interval $\[ l \/ S \, h \/ S \]$, the reciprocal is enclosed by

$ [frac(floor.l S^2 \/ h floor.r, S) \, frac(ceil.l S^2 \/ l ceil.r, S)] . $

Negative reciprocals use odd symmetry. An assertion excludes intervals containing zero. Consequently all elementary interval operations contain their exact real counterparts. Intersecting a value interval with a separately established range is also sound. The two uses of this operation, #raw("clip"), are the range $\[ - 1 \, 2 \]$ for $v_i$ and the logarithmic-product bounds proved below.

These statements concern exact integer operations, so absence of overflow must be established before using their outputs. Every potentially growing endpoint calculation is passed through #raw("safe"), which asserts

$ - 2^62 < b < 2^62 $

before converting the signed 128-bit integer $b$ to a signed 64-bit endpoint. Inductively, two input endpoints have product of magnitude less than $2^124$. The product is formed after promoting to signed 128 bits, and the rounding offset $S - 1$ still leaves its magnitude below $2^127$. Endpoint addition is also promoted before checking. Reciprocal numerators are $S^2 = 2^80$; adding the denominator minus one for upward rounding is safe. Rational-construction numerators and denominators in the prescribed runs are small fixed integers. No unchecked negation or absolute value can encounter the minimum signed 64-bit integer, because endpoints have magnitude below $2^62$.

The remaining raw integer expressions have separate small bounds. All box coordinates lie in $\[ 0 \, S \]$ in grid units, so midpoint sums are at most $2 S$. Cube-root search candidates are below $2 S$, their endpoint sums are at most $4 S$, and the two cube-comparison operands are below $8 S^3 = 2^123$. The fixed multiples of $S$, loop indices, and initial-grid numerators fit signed 64 bits. The unchecked visit counter is treated separately by the concrete sanitized executions recorded below; the depth bound alone does not keep its total number of increments within the signed 64-bit range. Logarithm scaling uses at most forty doublings on the actual arguments. Thus a range assertion is never being asked to detect an overflow that has already occurred: oversized derivative or value enclosures stop at #raw("safe") before narrowing. All floating-point casts in this source occur in failure diagnostics, not in acceptance tests.

=== 9.3 Logarithms, divided logarithms, and cube roots <int:logs>

The function #raw("atanh2") evaluates the fifteen terms

$ 2 sum_(n = 0)^14 frac(w^(2 n + 1), 2 n + 1) $

by Horner’s rule with outward interval operations. For $\| w \| lt.eq u < 1$ the absolute remainder is at most

$ frac(2 u^31, 31 \( 1 - u^2 \)) . $

The code asserts $\| w \| lt.eq 1 \/ 3 + 4 \/ S < 3 \/ 8$. With $u = 3 \/ 8$, the remainder bound, in grid units, is the exact rational number

#[#set math.equation(numbering: n => "(9.5)")
 $ S frac(2 \( 3 \/ 8 \)^31, 31 \( 1 - \( 3 \/ 8 \)^2 \)) = 617673396283947 / 119978708822917120 < 1 / 100 < 2 . $ <int:atanh-tail>]

The padding $\[ - 2 \/ S \, 2 \/ S \]$ therefore covers the omitted tail; all polynomial-evaluation errors are already covered by interval rounding.

To enclose $log \( x \/ S \)$ for a positive integer endpoint $x$, #raw("ln") scales an interval containing $x \/ S$ by powers of two. If $m$ is the resulting interval and $k$ the accumulated exponent, then $x \/ S in 2^k m$. Multiplication by two is exact on this grid; halving, when used, rounds outwards. The identities

$ log t = 2 "atanh" frac(t - 1, t + 1) \, #h(2em) log 2 = 2 "atanh" 1 / 3 $

give the enclosure after adding $k log 2$. The domain assertion in #raw("atanh2") checks the needed range even after rounding. All positive arguments actually passed to #raw("ln") are either coordinate endpoints in $\[ 1 \/ S \, 1 \]$, or endpoints of $1 - a v_i$ bounded away from zero, so the scaling loops terminate within the stated bounds.

The divided logarithm has the integral and power-series representations

#[#set math.equation(numbering: n => "(9.6)")
 $ cal(L) \( t \) = integral_0^1 frac(d s, 1 - s t) = sum_(n = 0)^oo frac(t^n, n + 1) quad \( \| t \| < 1 \) . $ <int:L-representation>]

For $\| t \| lt.eq 1 \/ 4$, #raw("L_endpoint") evaluates $sum_(n = 0)^22 t^n \/ \( n + 1 \)$ and its derivative $sum_(n = 1)^22 n t^(n - 1) \/ \( n + 1 \)$ independently. Bounding both coefficient sequences by one bounds their absolute tails by

#[#set math.equation(numbering: n => "(9.7)")
 $ frac(\( 1 \/ 4 \)^23, 1 - 1 \/ 4) = frac(1, 48 S) \, #h(2em) frac(\( 1 \/ 4 \)^22, 1 - 1 \/ 4) = frac(1, 12 S) \, $ <int:L-tails>]

respectively. Each receives padding $\[ - 1 \/ S \, 1 \/ S \]$. Outside this small interval the exact identities

$ cal(L) \( t \) = - frac(log \( 1 - t \), t) \, #h(2em) cal(L)' \( t \) = frac(\( 1 - t \)^(- 1) - cal(L) \( t \), t) $

use only nonzero denominators. On the entire real domain $t < 1$, differentiation of the integral representation gives

$ cal(L)' \( t \) = integral_0^1 frac(s thin d s, \( 1 - s t \)^2) > 0 \, #h(2em) cal(L)'' \( t \) = 2 integral_0^1 frac(s^2 thin d s, \( 1 - s t \)^3) > 0 . $

Thus both $cal(L)$ and $cal(L)'$ increase, including at negative arguments. The lower enclosure at the left endpoint and upper enclosure at the right endpoint suffice to enclose each function on an interval. This is precisely the rule used by #raw("L").

For a nonnegative integer $x < 8 S$, #raw("cb_floor") uses binary search and the exact comparison

$ m^3 lt.eq x S^2 $

to return $floor.l S \( x \/ S \)^(1 \/ 3) floor.r$. Its initial search bracket $\[ 0 \, 2 S \]$ is valid by $x < 8 S$. Applying this function to the two input endpoints, then increasing the upper result by one grid unit, encloses the cube root. The derivative enclosure is obtained from $1 \/ \( 3 t^(2 \/ 3) \)$ using the already enclosed positive root.

The outward rounding of an $a$ endpoint enlarges the prescribed bands by less than $1 \/ S$, and never introduces negative $a$. Hence throughout the actual boxes $a lt.eq 477 \/ 1000 + 1 \/ S$. Even the interval enclosures of $1 - a v_i$, after multiplication rounding and clipping $v_i$ to $\[ - 1 \, 2 \]$, have lower endpoint greater than $45 \/ 1000$ and upper endpoint less than $1478 \/ 1000$. The successive product of the three factors has lower endpoint at least $\( 45 \/ 1000 \)^3 - 3 \/ S > 0$ and upper endpoint at most $\( 1478 \/ 1000 \)^3 + 3 \/ S < 8$. These bounds justify the logarithm, divided-logarithm, reciprocal, and cube-root domains on every initial box and descendant. The cube-root lower enclosure is positive as well, so its derivative reciprocal is valid.

=== 9.4 Logarithmic products and derivative propagation <int:derivatives>

The zero endpoints in (9.1) are treated without evaluating their logarithms. For $0 < q lt.eq 1$, set $t = - log q gt.eq 0$. For integers $0 lt.eq j lt.eq 3$ and real $h gt.eq 5$,

$ q^(h \/ 2) \| log q \|^j = e^(- h t \/ 2) t^j lt.eq 1 . $

For $j = 0$ this is immediate. For $j > 0$ its maximum is $\( 2 j \/ \( h e \) \)^j lt.eq 1$, since $2 j \/ h lt.eq 6 \/ 5 < e$. It follows that

#[#set math.equation(numbering: n => "(9.8)")
 $ \| q^5 \( log q \)^j \| lt.eq q^(5 \/ 2) lt.eq q^2 \, #h(2em) \| q^6 \( log q \)^j \| lt.eq q^3 . $ <int:qt-bound>]

For even $j$ the products are nonnegative, and for odd $j$ they are nonpositive. These are the exact external ranges used by #raw("qt_direct") to intersect the power-and-logarithm enclosures. When the lower endpoint is zero, the same ranges directly supply an enclosure, with no logarithm call. When the lower endpoint is positive, monotonicity of $log$ supplies its interval, and intersecting its upper bound with $0$ is valid because $q lt.eq 1$. The derivative returned for every logarithmic product is exactly the interval version of (9.4). The derivative of $q^18$ is $18 q^17$. Cached enclosures depend only on the interval endpoints; #raw("qt") puts their derivatives in the appropriate $q$ or $r$ gradient coordinate.

An object #raw("J") consists of a value interval and three derivative intervals, corresponding to $\( q \, r \, a \)$. Constants have zero gradients and variables have the appropriate unit gradient. Addition, multiplication, squares, and reciprocals apply the identities

$ partial_i \( f g \) = f thin partial_i g + g thin partial_i f \, #h(2em) partial_i \( f^2 \) = 2 f thin partial_i f \, #h(2em) partial_i \( f^(- 1) \) = - f^(- 2) partial_i f . $

Cube roots and $cal(L)$ use the derivative enclosures just proved and the chain rule. Induction over these operations proves that the value and every first partial derivative of the actual formula are enclosed throughout the box. Tightening a value enclosure by an external range does not replace the underlying function by a clipped function: its previously enclosed derivatives remain valid, and the tighter values can be used in subsequent product and chain rules. All these statements extend to zero coordinate endpoints by the continuous derivative extensions already established.

=== 9.5 Bernstein coefficients and the acceptance test <int:bernstein>

For fixed $\( q \, r \, a \)$ write the polynomial as $P \( xi \) = D_0 + D_1 xi + D_2 xi^2 + D_3 xi^3$. On a subinterval $\[ l \, h \]$, substitute $xi = l + \( h - l \) t$, $0 lt.eq t lt.eq 1$, and express $P$ in the basis $binom(3, j) t^j \( 1 - t \)^(3 - j)$. The multipliers of $D_1 \, D_2 \, D_3$ in the four coefficients are

#[#set math.equation(numbering: n => "(9.9)")
 $ j & D_1 & D_2 & D_3\
0 & l & l^2 & l^3\
1 & \( 2 l + h \) \/ 3 & l \( l + 2 h \) \/ 3 & l^2 h\
2 & \( l + 2 h \) \/ 3 & h \( h + 2 l \) \/ 3 & l h^2\
3 & h & h^2 & h^3 $ <int:bernstein-rows>]

and the multiplier of $D_0$ is always one. Expanding the four basis polynomials verifies these identities. All basis polynomials are nonnegative and their sum is one; strictly positive coefficients therefore imply $P \( xi \) > 0$ on the whole closed subinterval.

The function #raw("rows") uses successive intervals with endpoints

#[#set math.equation(numbering: n => "(9.10)")
 $ 1 / 1000 \( 30 \, 50 \, 75 \, 100 \, 150 \, 200 \, 300 \, 400 \, 500 \, 650 \, 800 \, 900 \, 1000 \) . $ <int:xi-grid>]

These twelve intervals cover $\[ 3 \/ 100 \, 1 \]$ without gaps. For each it stores the first three rows of (9.9); the fourth row equals the first row for the next interval. It finally adds $\( 1 \, 1 \, 1 \)$. Thus the $37$ stored rows account for all $48$ coefficients of the twelve cubic representations, including both extreme endpoints. The row multipliers are themselves evaluated by rational interval arithmetic and have zero gradients with respect to $\( q \, r \, a \)$.

Let $F$ denote one of these Bernstein coefficients on a box $B = product_(i = 1)^3 \[ l_i \/ S \, h_i \/ S \]$. The interval calculation in #raw("dot") encloses $F$ and all its first derivatives. A positive lower endpoint immediately accepts this coefficient. Otherwise define the grid midpoint and coordinate radii by

$ c_i = frac(floor.l \( l_i + h_i \) \/ 2 floor.r, S) \, #h(2em) rho_i = frac(h_i - floor.l \( l_i + h_i \) \/ 2 floor.r, S) . $

Nonnegative endpoints ensure that C++ integer division computes this floor; $rho_i$ is the larger of the two distances to the endpoints. If $M_i$ is the maximum absolute endpoint of the derivative enclosure, in real units, then for every $z in B$ the segment from $c$ to $z$ lies in $B$ and

#[#set math.equation(numbering: n => "(9.11)")
 $ F \( z \) gt.eq F \( c \) - sum_(i = 1)^3 M_i rho_i . $ <int:mean-value>]

This follows by integrating the gradient along that segment, also when a coordinate endpoint is zero. The code encloses $F \( c \)$ anew, rounds each product $M_i rho_i$ upwards, and adds their integer upper endpoints with overflow checks. Its strict comparison #raw("value.v.l > total") is therefore sufficient for $F > 0$ throughout $B$. A box is accepted only when every stored row passes one of these two tests.

=== 9.6 Subdivision, coverage, and observed completion <int:coverage>

For a band $\[ a_(-) \, a_(+) \]$, the initial exact boxes before outward rounding are

#[#set math.equation(numbering: n => "(9.12)")
 $ [i / 24 \, frac(i + 1, 24)] times [j / 24 \, frac(j + 1, 24)] times [a_(-) + k / 16 \( a_(+) - a_(-) \) \, a_(-) + frac(k + 1, 16) \( a_(+) - a_(-) \)] \, $ <int:initial-boxes>]

where $0 lt.eq i < 24$, $0 lt.eq j lt.eq i$, and $0 lt.eq k < 16$. Every $\( q \, r \)$ with $0 lt.eq r lt.eq q lt.eq 1$ belongs to one of the displayed $q \, r$ rectangles, including all grid boundaries. There are $16 sum_(i = 0)^23 \( i + 1 \) = 4800$ initial boxes per run. Their endpoints are rounded outwards, so none of the required domain is lost. The extra points included by rounding are harmless, as are portions of diagonal rectangles with $r > q$: the same functions and derivative bounds are valid there. The $a$ enlargement and all analytic domains were checked above. Adjacent bands may use different parameters, since each certifies its own entire closed band.

On entry, #raw("visit") skips a box only if its lower $r$ endpoint exceeds its upper $q$ endpoint. Such a box contains no point with $r lt.eq q$. If any coefficient fails both acceptance tests, the code chooses a coordinate with maximal recorded derivative-radius contribution and cuts at its grid midpoint. The choice affects efficiency only. The two closed children include the midpoint and their union is the parent. If the chosen contribution is zero, the depth exceeds $80$, or the chosen grid radius is at most one, an assertion fails rather than accepting an unresolved box.

Induction back up any normally completed recursion tree now proves that every required point in its root box has all Bernstein coefficients strictly positive. The leaves either pass the sound acceptance tests or contain no required point. Together with (9.12), (9.10), and the sorted parametrization, normal completion of all three runs proves the pointwise inequality on the full stated domain. This includes the uniform message, boundary probability vectors, $a = 0$, all band endpoints, and all $xi$ endpoints. In particular there is no exception at the uniform message: there $P \( xi \) = delta xi^2 + U delta xi^3 > 0$.

The unchanged source was replayed with GCC 13.3.0 on x86\_64 Linux, using assertions enabled. From the package root the reproduction commands are

#raw(block: true, lang: "", "g++ -std=c++17 -O3 -UNDEBUG verification/interval.cpp \\\n  -o /tmp/appendix_b\n/tmp/appendix_b 0\n/tmp/appendix_b 1\n/tmp/appendix_b 2")

Only the documented arguments $0 \, 1 \, 2$ are part of this protocol; the source does not validate other argument values. Compiling with assertions disabled is not this certificate. All three runs exited normally with status zero and the following visit counts:

$ upright("argument") & a upright(" interval") & upright("calls to ") mono("visit")\
0 & \[ 0 \, 190 \/ 1000 \] & 414080\
1 & \[ 190 \/ 1000 \, 448 \/ 1000 \] & 756096\
2 & \[ 448 \/ 1000 \, 477 \/ 1000 \] & 1004426 $

The counts include internal subdivision nodes and boxes skipped by the diagonal test. All three executions were also repeated on the unchanged source with #raw("-O2 -UNDEBUG -fsanitize=undefined") and #raw("-fno-sanitize-recover=undefined"). They completed with the same counts and no sanitizer diagnostics. This supplies the separate check of the unchecked #raw("visits++") counter for these prescribed executions. The counts identify the finite completed executions; their correctness implication is the enclosure and coverage argument above, not a sample-based inference. The source SHA-256 is

#raw(block: true, lang: "", "76d1443b1194597ee77749e8030c825f2b9aae46b5c172d9eccf0745078c28e3")

== 10 Exact arithmetic and reproduction of the grid certificate <grid:implementation>

The complete C++17 program in Section 11.3 implements the recursions of Section 6. Its parameters are fixed at $H = 72$, $N = 10^12$, and $mono(S C A L E) = 10^15$. It uses signed 64-bit integers for table coefficients and mass units, and signed 128-bit integers for products and accumulators. The compiler must also provide a plain #raw("int") type of at least 32 bits. Assertions must be enabled; in particular the build must not define #raw("NDEBUG"). For example, from the paper directory, the following commands compile and run all 28 cases:

#raw(block: true, lang: "", "g++ -std=c++17 -O3 -UNDEBUG -Wall -Wextra \\\n    verification/grid.cpp -o grid\nfor j in $(seq -1 26); do ./grid '$j'; done")

The program writes progress diagnostics to standard error and the case number followed by its stopping iteration to standard output. Only the diagnostics convert to floating point. Successful outputs are specified in (6.15), together with #raw("-1 162").

=== 10.1 Correspondence of code and probability operations <correspondence-of-code-and-probability-operations>

The routine #raw("init") enumerates all sorted nonnegative integer triples of sum $72$. It finds $469$ triples, identifies the pure representative $\( 72 \, 0 \, 0 \)$ and the uniform representative $\( 24 \, 24 \, 24 \)$, and stores an index for every representative. The routine #raw("indexof") sorts a candidate triple and verifies the resulting index. A #raw("Law") is a vector of orbit masses in units of $1 \/ N$. The routine #raw("complete") adds the missing units at the pure orbit, which is exactly Lemma 21.

The constructor #raw("Table(mode,A,AD)") first reduces the channel fraction. The variables #raw("lhs"), #raw("rhs"), #raw("raw"), #raw("T"), and #raw("den") are the entries and denominator of (6.4). For each of the six relative permutations, #raw("n"), #raw("rem"), and #raw("miss") are the floor vector, remainders, and deficit in the grid spread. The corner weights are #raw("T"), #raw("rem[c]"), or #raw("T-rem[c]"), as appropriate. After aggregating equal output indices, the constructor checks that their sum is #raw("den"). These checks include every grid pair, not only pairs visited by an iteration. Zero normalizers are omitted because they have zero tilted mass.

The routine #raw("combine") implements (6.6). Symmetric modes use the triangular pair table and the stated off-diagonal coefficient; mode 1 uses ordered pairs. Its row-skipping condition is safe: an ordered row contributes zero when its first mass is zero, while a triangular row contributes zero when both first-index masses are zero. The table position advances by the full skipped row length. After division by $N thin mono(d e n)$, each mass is rounded down and #raw("complete") is applied.

The functions #raw("down") and #raw("up") compute floor and ceiling of a nonnegative integer ratio. The latter uses $ceil.l x \/ y ceil.r = floor.l \( x + y - 1 \) \/ y floor.r$ for $x gt.eq 0$, $y > 0$. The function #raw("w_zero") implements (6.10). The routine #raw("poisson") fixes its incoming child law #raw("inc"), starts #raw("part") at the uniform zero-count law, and uses mode 1 once for each positive count weight. Its orbit sums are exactly (6.9); the final #raw("complete") handles all omitted mass. No count product is needed after the first zero weight. The regular branch of #raw("run") is (6.7). Finally, #raw("mu_num") is $M$ in (6.14), and the strict stopping test is $20 M < N H^2$. Each run allows $400$ iterations and asserts failure if none succeeds. All reported stopping iterations are below that bound.

=== 10.2 Bounds on every arithmetic class <bounds-on-every-arithmetic-class>

For all Poisson table calls, the reduced fraction satisfies $B lt.eq 10^6$ and $A lt.eq B \/ 2$. Thus

$ 0 lt.eq e_i lt.eq \( B + A \) H lt.eq 108000000 \, quad D_(upright("tab")) = 6 B H^2 lt.eq 31104000000 \, quad H r_i lt.eq 559872000000 . $

Each total $T$ is at most three times the bound on a raw coordinate; all of these quantities fit signed 64 bits. The only mode 2 call is at the reduced fraction $A \/ B = 1 \/ 2$, where $D_(upright("tab")) = 373248$ and $H r_i lt.eq 3359232$. Mode 0 has smaller bounds. Every nonnegative aggregated table weight and every partial sum of weights is bounded by its denominator, by (6.5).

Input masses are nonnegative and sum to $N$, so their ordered pair mass is $N^2$. The triangular implementation has the same total after the off-diagonal terms are combined. Consequently every nonnegative product accumulator and its partial sums are at most

$ D_(upright("tab")) N^2 lt.eq 31104000000000000000000000000000000 < 2^127 - 1 . $

The source casts an input factor to the 128-bit type #raw("Big") before multiplying. Dividing by $N D_(upright("tab"))$ yields a mass between zero and $N$, safely convertible back to 64 bits. The uncompleted masses sum to at most $N$; likewise the Poisson mixture masses sum to at most $N$, since they are lower bounds on a probability mixture. These facts bound all 64-bit partial sums in #raw("complete") and #raw("poisson").

Here are bounds for the Taylor calculation independent of machine floating point. If $t_n = S_0 d_(+)^n \/ n !$, the lower and upper endpoint errors satisfy

$ 0 lt.eq t_n - l_n < e^(d_(+)) \, #h(2em) 0 lt.eq u_n - t_n < e^(d_(+)) . $

Indeed an error satisfies $epsilon.alt_n lt.eq \( d_(+) \/ n \) epsilon.alt_(n - 1) + 1$; expanding this recurrence bounds it by $sum_(j gt.eq 0) d_(+)^j \/ j ! = e^(d_(+))$, since each product of $j$ successive denominators is at least $j !$. As $d_(+) < 5$ and $e < 3$, the endpoint errors are less than $243$. The sum of all endpoint magnitudes through degree $41$ is therefore bounded by

$ S_0 e^(d_(+)) + 42 dot.op 243 < 243 \( S_0 + 42 \) < 2^63 - 1 . $

This also bounds every signed partial sum in (6.10). The endpoint multiplication by $d_max lt.eq 881$ is carried out in 128 bits before division, and the same holds for multiplication by $N$ and for the Poisson weight recurrence. These products are all less than $2^127 - 1$ under the displayed bounds.

The lower sum $L$ is positive. In fact Taylor’s theorem gives

$ L / S_0 gt.eq e^(- d_(+)) - frac(d_(+)^42, 42 !) - frac(41 dot.op 243, S_0) > 1 / 243 - 10^(- 20) - 9963 / 10^15 > 0 . $

The middle inequality uses the elementary integer comparison $5^42 \/ 42 ! < 10^(- 20)$. Thus the nonnegative-argument conditions of #raw("down") hold at the final Taylor step as well as in its term recurrences. Since $w_n \/ N lt.eq p_n$, every Poisson weight is at most $N$. In particular $w_8 lt.eq N < 2^40$, and the recurrence gives $w_n lt.eq w_(n - 1) \/ 2$ for $n gt.eq 9$, since $d_(+) \/ n < 1 \/ 2$. Thus $w_48 < 1$, so the first zero occurs by $n = 48$. The count loop and its denominator therefore satisfy $n lt.eq 48$ and $200 n lt.eq 9600$, well within the plain integer type. Every product $w_n q_n \( h \)$ is at most $N^2$ and is evaluated in 128 bits.

For $h in cal(H)$, the bracket in (6.14) belongs to $\[ 0 \, H^2 \]$. Hence every partial sum in #raw("mu_num") is at most

$ N H^2 = 5184000000000000 < 2^63 - 1 . $

The factor $20$ in the stopping comparison is applied after converting to #raw("Big"). The binary-search comparisons for (6.12) likewise use 128 bits before taking integer squares and products.

There are at most $18$ unaggregated contributions per grid pair (six permutations, at most three corners). Thus even a full ordered table has at most $18 dot.op 469^2 = 3959298$ entries before aggregation. All table positions and vector indices fit an ordinary signed 32-bit integer, and the source also checks an explicit $100000000$ entry limit. Candidate grid coordinates belong to ${ 0 \, dots.h \, H }$, and all small grid sums and products fit these integer types. This accounts for the unguarded indexing arithmetic as well as the probabilistic accumulators.

The supplied source therefore implements a finite exact-arithmetic certificate: positivity, normalization, rounding direction, all parameter choices, and the final strict inequalities are independent of compiler floating-point behavior.

== 11 Exact verification programs <app:certificates>

The three programs below are part of the proof. They use integer or rational arithmetic for every certification decision. In the C++ programs, floating-point conversion is used only for diagnostic output. The mathematical meaning and arithmetic guarantees of the programs are proved in Sections 4–5, Section 6, and Appendices Section 9 and 10, and in the pair derivation below.

=== Reproduction protocol <reproduction-protocol>

The accompanying directory #raw("verification/") contains #raw("pair.py"), #raw("interval.cpp"), and #raw("grid.cpp"), exactly the sources printed below. Run Python with SymPy installed and with assertions enabled. Compile the C++ sources with a compiler supporting signed #raw("__int128") and a plain #raw("int") type of at least 32 bits, also with assertions enabled. For example, from the paper directory:

#raw(block: true, lang: "", "python verification/pair.py\ng++ -std=c++17 -O3 -UNDEBUG verification/interval.cpp -o interval\ng++ -std=c++17 -O3 -UNDEBUG verification/grid.cpp -o grid\nfor j in 0 1 2; do ./interval '$j'; done\nfor j in -1 $(seq 0 26); do ./grid '$j'; done")

Do not use Python’s #raw("-O") option, and do not define #raw("NDEBUG"). Only the displayed argument ranges are part of the protocol. The bundled runner #raw("verification/reproduce.py") verifies the source hashes, runs this suite, checks the expected outputs, and saves the commands, software versions, exit statuses, and logs in its designated output directory. Its usage is documented in the accompanying README.

Successful execution of the pair program produces no output. The interval runs finish with visited-box counts $414080$, $756096$, and $1004426$, respectively. The grid run with argument $- 1$ stops at iteration $162$. The other grid stopping iterations are recorded in Section 6. The certificate sources were replayed with Python 3.12.13, SymPy 1.14.0, and GCC 13.3.0 on x86\_64 Linux; all 32 mathematical executions and five environment/compiler checks passed. Separately, the three interval cases were replayed with #raw("-O2 -UNDEBUG"), #raw("-fsanitize=undefined"), and #raw("-fno-sanitize-recover=undefined"). All three exited successfully, with the same progress logs and no sanitizer diagnostics. This supplemental check is distinct from the ordinary runner protocol and supplies the execution check on the visit counter discussed in Appendix Section 9.

The SHA-256 digests of the three source files, in the above order, are

#quote(block: true)[
  #raw("ab775c3a63fb1d2713bfe058af2dece4ceda99627c17ce18f51f817b69410bba") #raw("76d1443b1194597ee77749e8030c825f2b9aae46b5c172d9eccf0745078c28e3") #raw("03c92321efedd0db53b1e91372918dfcd68d459db0223cb160c39df3bd645283")
]

These digests identify the exact files; the correctness arguments are provided in the text, and the successful runs establish the finite assertions required there.

=== 11.1 Pair coefficient certificate <cert:pair>

We prove the $a = 1 \/ 2$ case of Lemma 15 for strictly positive input vectors, using its notation for the input invariants and pair excesses. The main-text proof then extends these bounds to every $0 lt.eq a lt.eq 1 \/ 2$ and to the closed simplex. Parametrize sorted unnormalized vectors by

$ p = \( 6 s + 3 t + 2 \, 3 t + 2 \, 2 \) \, #h(2em) q = \( 6 u + 3 v + 2 \, 3 v + 2 \, 2 \) \, #h(2em) s \, t \, u \, v gt.eq 0 . $

This covers every strictly positive sorted vector up to scale: for $h_0 gt.eq h_1 gt.eq h_2 > 0$, take $s = \( h_0 - h_1 \) \/ \( 3 h_2 \)$ and $t = 2 \( h_1 - h_2 \) \/ \( 3 h_2 \)$ to obtain $p = 2 h \/ h_2$. Put $P = sum_i p_i$, $Q = sum_i q_i$, and $e_i = Q - q_i$, with $E = sum_i e_i = 2 Q$. Then $e_i \/ E = \( 1 - q_i \/ Q \) \/ 2$, as required for the coloring edge. For an unnormalized vector $r$ of total $R$, put

$ N_x \( r \) = frac(3 sum_i r_i^2 - R^2, 2) \, #h(2em) N_y \( r \) = frac(27 product_i r_i - R^3 + 3 R N_x \( r \), 2) . $

The identities for the posterior invariants give $N_x \( r \) = R^2 x \( r \/ R \)$ and $N_y \( r \) = R^3 y \( r \/ R \)$. These are the two numerators returned by #raw("xy") in the source.

For each of the two choices $tilde(e) = \( e_0 \, e_1 \, e_2 \)$ and $tilde(e) = \( e_0 \, e_2 \, e_1 \)$, let

$ r_i^(\( j \)) = p_i tilde(e)_(i + j) \, #h(2em) T_j = sum_i r_i^(\( j \)) \, #h(2em) j = 0 \, 1 \, 2 \, $

with indices modulo three. The likelihood normalizer is $3 T_j \/ \( P E \)$; multiplying by the cyclic probability $1 \/ 3$ gives weight $T_j \/ \( P E \)$. Since $sum_j T_j = P E$, these are probability weights. The two choices, each followed by the three rotations, enumerate all six relative permutations. Repeated representatives at a stabilizer remain valid uniform group averages.

For each reflection class separately, clear the positive denominator

#[#set math.equation(numbering: n => "(11.1)")
 $ D = P E \( T_0 T_1 T_2 \)^3 P^4 E^4 . $ <loc:denominator>]

The three expressions #raw("out[0]"), #raw("out[1]"), and #raw("out[2]") divided by $D$ are exactly

$ sum_(j = 0)^2 frac(N_x \( r^(\( j \)) \), P E T_j) \, #h(2em) sum_(j = 0)^2 frac(N_y \( r^(\( j \)) \), P E T_j^2) \, #h(2em) sum_(j = 0)^2 frac(N_x \( r^(\( j \)) \)^2, P E T_j^3) \, $

namely the tilted output means of $x \, y \, x^2$ within that class. For every call in the source,

$ frac(mono("mon") \( i \, j \, k \, l \), D) = X^i y_0^j z^k B_0^l . $

The powers $4 - 2 i - 3 j$ and $4 - 2 k - 3 l$ in these calls are nonnegative, so the cleared objects are polynomials. Hence #raw("dx"), #raw("de"), and #raw("dn") are $D$ times the class-specific excesses.

The correction #raw("im"), after division by $D$, is

#[#set math.equation(numbering: n => "(11.2)")
 $ I = frac(27 thin "odd" \( p \) "odd" \( tilde(e) \), 64 P^3 E^3) \, #h(2em) "odd" \( p \) = 4 \( p_1 - p_2 \) \( p_0 - p_1 \) \( p_0 - p_2 \) . $ <loc:reflection>]

Indeed this follows immediately by dividing $27 "odd" \( p \) "odd" \( tilde(e) \) \[ P E \( T_0 T_1 T_2 \)^3 \] P E \/ 64$ by (11.1). Swapping the last two edge coordinates negates $I$. Although $D$ itself depends on the reflection class, the normalized correction in (11.2) has exactly the indicated sign change.

To see explicitly what is certified, temporarily write $d_x \, d_e \, d_n$ for the excesses within one reflection class. The seven polynomials checked in that class are the following expressions multiplied by $D$:

$ & 13 X z - 2 d_n \,\
 & 11 X z - d_e \,\
 & 250 d_e + 79 X z \,\
 & - 20 X z - 40 W + 40 y_0 B_0 + 51 S - 20 \( d_x - 2 I \) \,\
 & 6 X z - 6 W + y_0 B_0 + S - \( d_e + I \) \,\
 & 2 \( d_e + I \) - 12 X z + 12 W - 2 y_0 B_0 + 19 S \,\
 & - 4 X z + 44 W - 14 y_0 B_0 + 52 S_A + 111 S_B - { 5 \( d_n + 10 I \) - 4 \( d_e + I \) } . $

The last line, divided by two, bounds $C d_n - 2 d_e + 23 I$. All arithmetic in this certificate consists of integer polynomial addition and convolution, and exact scalar division, in $bb(Z) \[ s \, t \, u \, v \]$. Each of the fourteen polynomials has total degree $28$ and all its coefficients are nonnegative. For either reflection the numbers of nonzero coefficients in the displayed order are

$ 13672 \, med 13672 \, med 13674 \, med 13625 \, med 13625 \, med 13625 \, med 13625 . $

The supplied executable certificate checks every coefficient by the assertion #raw("min(f.coeffs())>=0"); absent monomials have coefficient zero. Its unchanged-source execution, with Python assertions enabled, terminates successfully. Thus these are exact polynomial nonnegativity statements on the entire nonnegative quadrant, rather than evaluations on a set of test points.

Divide each class’s seven inequalities by its own positive $D$ and then average the two normalized classes. All right-hand invariant terms are unchanged by reflection, and the $I$ terms cancel by (11.2). This gives precisely (4.1)–(4.1) for $a = 1 \/ 2$.

The complete polynomial calculation is the following source.

#raw(block: true, lang: "Python", "")

=== 11.2 Interval positivity certificate <cert:interval>

#raw(block: true, lang: "C++", "")

=== 11.3 Finite experiment certificate <cert:grid>

#raw(block: true, lang: "C++", "")


#bibliography("refs.bib", style: "ieee", title: [References])
