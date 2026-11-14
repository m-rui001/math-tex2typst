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

#align(center)[#text(size: 16pt, weight: "bold")[GOE bulk universality for fixed-degree random regular graphs]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A random regular graph is sparse even when its order tends to infinity:
  each row of its adjacency matrix has exactly $d$ nonzero entries.
  Nevertheless, its bulk eigenvalues are expected to exhibit the local statistics of a real symmetric Gaussian
  matrix. We prove this prediction for every fixed degree $d gt.eq 3$,
  at each fixed energy in the interior of the limiting spectrum.

=== 1.1 Main result <main-result>

For an admissible integer $n$, let $G_(n \, d)$ be uniform among the simple labelled $d$-regular graphs on ${ 1 \,
  dots.h \, n }$. Here admissible means that this set is nonempty.
  Let $A_(n \, d)$ be its unweighted adjacency matrix, with eigenvalues $lambda_1 \, dots.h \, lambda_n$,
  counted with multiplicity. No conditioning on connectedness, bipartiteness, or another graph property is imposed.

The limiting density is the Kesten–McKay density

$ rho_d \( t \) = frac(d sqrt(4 \( d - 1 \) - t^2), 2 pi \( d^2 - t^2 \)) wide
  #scale(x: 120%, y: 120%)[\(] \| t \| < 2 sqrt(d - 1) #scale(x: 120%, y: 120%)[\)] . $

For a fixed energy $E$ in this interval, define the unfolded point measure

$ Xi_(n \, d \, E) = sum_(i = 1)^n delta_(thin n rho_d \( E \) \( lambda_i - E \)) . $

For comparison, let $H_n$ be a normalized GOE matrix: its entries on and above the diagonal are independent
  centered Gaussians, with variance $1 \/ n$ off the diagonal and $2 \/ n$ on the diagonal.
  If $mu_1 \, dots.h \, mu_n$ are its eigenvalues, put

$ Xi_n^(upright("GOE")) = sum_(i = 1)^n delta_(\( n \/ pi \) mu_i) . $

#thm([Theorem 1.1.])[
  #emph[For every fixed integer $d gt.eq 3$, every fixed $E in \( - 2 sqrt(d - 1) \, 2 sqrt(d - 1) \)$,
    and every nonnegative continuous compactly supported $h : bb(R) arrow.r bb(R)$,
$ lr(|bb(E) exp #h(-0.16667em) (- integral h thin upright(d) Xi_(n \, d \, E)) -
  bb(E) exp #h(-0.16667em) (- integral h thin upright(d) Xi_n^(upright("GOE")))|) arrow.r 0 $

 as $n arrow.r oo$ through all admissible sizes.]
] <thm:main>

The GOE reference point measures converge in law for the vague topology #cite(label("ValkoVirag")).
  Thus Theorem 1 identifies the full local point-process limit,
  not only its one-point density or an energy-averaged statistic.
  It proves the fixed-degree bulk-universality conjecture stated in #cite(label("BourgadeHuang")) Conjecture 2.11,
  in a fixed-energy Laplace-functional formulation.

=== 1.2 Background and significance <background-and-significance>

The density above originates in the spectral measure of the regular tree and the limiting spectrum of random
  regular graphs #cite(label("Kesten")) #cite(label("McKay")).
  It describes eigenvalue counts on macroscopic intervals, but does not determine the spacings between consecutive
  eigenvalues. Jakobson, Miller, Rivin, and Rudnick #cite(label("JakobsonEtAl")) Sections 1 and 5 formulated the
  GOE prediction for fixed-degree regular graphs and gave numerical evidence for it.
  Their empirical nearest-neighbor spacing formulation precedes the fixed-energy point-process formulation studied
  here. The prediction is particularly striking at fixed degree:
  local tree geometry persists, whereas the proposed eigenvalue statistics agree with those of a dense Gaussian matrix.

The development of local laws separated spectral control from the identification of microscopic statistics.
  Bauerschmidt, Knowles, and Yau #cite(label("BauerschmidtKnowlesYauLocal")) established a local semicircle law
  for growing degrees using local resampling. Bauerschmidt, Huang, Knowles,
  and Yau #cite(label("BauerschmidtEtAl")) Theorems 1.1 and 1.2 proved bulk gap universality and energy-averaged
  correlation universality in a polynomial degree range. More recently,
  Bourgade and Huang #cite(label("BourgadeHuang")) Proposition 2.10 obtained fixed-energy point-process
  universality for $\( log n \)^24 lt.double d lt.eq n^(1 \/ 2)$ by loop equations,
  and stated the remaining fixed-degree problem in their Conjecture 2.11.

For fixed degree the local reference law is Kesten–McKay.
  Bauerschmidt, Huang, and Yau #cite(label("BauerschmidtHuangYauLocal")) established the local law and
  delocalization for sufficiently large fixed degrees. Huang and Yau #cite(label("HuangYau")) subsequently proved
  rigidity, complete delocalization, and local resolvent estimates for every fixed $d gt.eq 3$.
  Their estimates supply the spectral input for this paper.
  They control smoothed eigenvalue counts and typical tree neighborhoods,
  while the conclusion sought here concerns unsmoothed statistics at one fixed energy on the scale of an
  individual spacing.

For every fixed $d gt.eq 3$, Huang, McKenzie, and Yau #cite(label("HuangMcKenzieYau")) Theorems 1.1 and 1.2 proved
  optimal eigenvalue rigidity, up to subpolynomial factors, and GOE edge universality.
  Their edge result identifies the joint fluctuations of any fixed number of extreme nontrivial eigenvalues at
  either spectral edge.

Eigenvector Gaussianity provides the link we need from spectral control to microscopic bulk statistics.
  The Gaussian-wave model on a regular tree appears in #cite(label("ElonEigenvectors")) #cite(label("CsokaEtAl")).
  Backhausz and Szegedy #cite(label("BackhauszSzegedy")) Theorems 2.1 and 2.2 proved qualitative Gaussian-wave
  limits for almost eigenvectors of random regular graphs, allowing a variance factor between zero and one in the
  weak limit. Their argument uses entropy inequalities for local observations;
  the underlying colored-star counting framework was developed in #cite(label("BackhauszSzegedyTrees")) and
  further studied in #cite(label("BackhauszBordenaveSzegedy")).
  Recent developments include variance-one Gaussian waves for spectral-edge eigenvectors
  #cite(label("HeHuangYauWaves")) and an extension of the entropy framework to graphs of finite cone type
  #cite(label("DemboMcKenzie")). Our argument develops this entropy method into a different input:
  polynomially accurate, variance-one joint moments at sampled graph edges.
  The estimates hold conditional on each graph in an event of probability tending to one,
  uniformly over finitely many chosen bulk eigenvectors. Weak convergence alone does not provide these high-moment
  estimates. The proof below supplies them through a strict tensor estimate and a quantitative Hermite expansion.

Reversible edge switches are also established tools in local laws and universality;
  see #cite(label("BauerschmidtEtAl")) Section 3 and #cite(label("BauerschmidtHuangYauLocal")) Section 7.2.
  We use Gaussian endpoint marks to extend the discrete symmetry to an orthogonal action on an exact microscopic
  limiting law. Increasing the number of sampled edge pairs within that limit then inserts a Gaussian matrix
  perturbation. The last step uses the local relaxation of Dyson’s matrix evolution #cite(label("DysonBrownian"))
  #cite(label("LandonYau")), in the fixed-energy form proved by Landon, Sosoe,
  and Yau #cite(label("LandonSosoeYau")). To obtain the full point-process conclusion from fixed-order
  correlations, we also give a compact-count bound using the Gaussian superposition and decimation identity of
  Forrester and Rains #cite(label("ForresterRains")).

=== 1.3 Proof strategy <proof-strategy>

We first work in the coordinates $x_i = n \( lambda_i - E \)$,
  before the last density factor $rho_d \( E \)$ is applied.
  For a real eigenvector normalized to have squared norm $n$,
  sampling its values at the two ends of a uniform oriented edge produces a pair of random real numbers.
  We call each sampled edge and its two endpoint coordinates a channel.
  The first part of the proof shows that, for any fixed number of eigenvectors near $E$,
  every fixed joint moment of these sampled values is polynomially close to the corresponding Gaussian moment,
  with probability tending to one over the graph. The comparison consists of centered,
  unit-variance Gaussian pairs, independent across the eigenvectors, with covariance $E \/ d$ within each pair.

The following steps then identify every subsequential microscopic point-process limit.

+ #emph[Quantitative Gaussian marks.] Section 3 proves the endpoint moment statement.
  A colored-star counting inequality becomes an entropy inequality after the eigenvectors are smoothed by a
  Gaussian field. The tree logarithmic potential evaluates the entropy cost.
  A strict tensor inequality turns the resulting entropy deficit into Gaussian moment matching by induction over
  Hermite degree.
+ #emph[Microscopic limits with controlled tails.] Section 4 uses a two-edge switch and the moment statement to
  control resolvents at large fixed microscopic heights. It then extracts the point process together with its
  Gaussian endpoint marks. The limiting resolvent has a symmetric principal-value representation,
  and the point counts have a power-saving discrepancy from constant density.
+ #emph[Continuous switching and Gaussian insertion.] Section 5 combines the discrete switch symmetry with
  orthogonal invariance of the Gaussian marks. This produces exact continuous switching identities for the
  microscopic limiting law. After two controlled truncations,
  many weak switches give finite diagonal matrices with additive GOE noise whose eigenvalue point processes
  converge to that same limiting law.
+ #emph[Identification at one energy.] Section 6 verifies the hypotheses of fixed-energy Dyson Brownian motion
  universality for these diagonal matrices. An exact adjustment of the free-convolution density matches the
  normalizations of the two ensembles. A uniform exponential bound for compact GOE counts and finite
  inclusion-exclusion then upgrade correlation comparisons to the Laplace functionals in Theorem 1.

Two parts of this argument are useful beyond the final identification.
  The entropy calculation gives Gaussian moment approximation with polynomially small errors on common graph
  events of probability tending to one, including graph-dependent choices of eigenvectors;
  its strictness is a finite-dimensional tensor fact tied to the open bulk and to $d gt.eq 3$.
  The continuous switching argument converts a discrete finite-rank symmetry into Gaussian perturbations of an
  exact limiting marked process. The latter mechanism requires only fixed-dimensional Gaussian information before
  the limit.

The passage from finitely many Gaussian marks to many weak switches takes place after the graph-size limit.
  We first let $n arrow.r oo$ with fixed numbers of sampled edges and fixed spectral windows,
  then control the tails to construct the principal-value marked law in Section 4.
  Its switching identities are exact for every fixed number of channels.
  Only within this law do we let the channel number $k = 2 r$ tend to infinity,
  with the two spectral cutoffs prescribed in Section 5. Finally we increase the order of the inclusion-exclusion
  brackets in Section 6. Thus the finite-graph argument requires Gaussian approximation only in fixed dimensions
  and at fixed moment orders.

== 2 Spectral input and tree identities <sec:preliminaries>

Throughout the proof, $d gt.eq 3$ and $\| E \| < 2 sqrt(d - 1)$ are fixed.
  All constants may depend on these two parameters. This section records the spectral information used below and
  the tree identities that determine the covariance of the eigenvector entries.
  The spectral estimates are established results; the subsequent entropy and switching arguments are proved in
  this paper.

=== 2.1 Conventions and microscopic coordinates <conventions-and-microscopic-coordinates>

Let

$ rho_d \( t \) = frac(d sqrt(4 \( d - 1 \) - t^2), 2 pi \( d^2 - t^2 \))
  upright(bold(1))_({ \| t \| < 2 sqrt(d - 1) }) \, wide m_d \( zeta \) =
  integral_(bb(R)) frac(rho_d \( t \), t - zeta) thin upright(d) t quad \( Im zeta > 0 \) . $

Set

$ rho = rho_d \( E \) \, wide p = E / d \, wide a = frac(d, d - 1) \( 1 - p^2 \) \, wide m_(*) =
  m_d \( E + upright(i) 0 \) = m_(upright(r)) + upright(i) pi rho . $

In particular, $rho > 0$, $a > 0$, and $\| p \| < 1$. For the adjacency eigenvalues and a graph-determined real
  orthogonal eigenbasis, use the normalization

$ A u_i = lambda_i u_i \, wide chevron.l u_i \, u_j chevron.r = n delta_(i j) . $

An arbitrary measurable choice inside each eigenspace suffices. Define

#[#set math.equation(numbering: n => "(2.1)")
 $ x_i = n \( lambda_i - E \) \, wide nu_n = sum_(i = 1)^n delta_(x_i) \, wide m_n \( z \) =
   sum_(i = 1)^n frac(1, x_i - z) = 1 / n "Tr" R_n \( z \) \, quad
   R_n \( z \) = \( A - E - z \/ n \)^(- 1) . $ <eq:micro-coordinates>]

The remaining density factor for unfolding is $rho$; the final point coordinates are obtained by multiplying the
  $x_i$ by $rho$. We write $bb(C)_(+) = { z in bb(C) : Im z > 0 }$ for the upper half-plane.

For $k gt.eq 1$, let

#[#set math.equation(numbering: n => "(2.2)")
 $ J_k = mat(delim: "(", 0, I_k; I_k, 0) \, wide C_k = I_(2 k) + p J_k \, wide K_k \( m \) = m C_k +
   d^(- 1) J_k . $ <eq:channel-matrices>]

The order of the $2 k$ coordinates will always be the starting endpoints of $k$ oriented edges,
  followed by their ending endpoints. The matrix $C_k$ is positive definite.

Unsubscripted finite-dimensional matrix norms are operator norms;
  $parallel dot.op parallel_(upright("HS"))$ denotes the Hilbert–Schmidt norm.
  The imaginary part of a matrix is its Hermitian imaginary part.
  For the complex symmetric matrices occurring here it also agrees with entrywise imaginary part.
  All tensor norms are induced by the stated Euclidean inner products.
  The notation $n^(o \( 1 \))$, when used on high-probability events,
  denotes a deterministic subpolynomial upper bound. We write $O_(bb(P)) \( b_r \)$ for a random quantity whose
  ratio to $b_r$ is bounded in probability; $o_(bb(P)) \( b_r \)$ means that the ratio tends to zero in probability.

=== 2.2 The simple regular-graph model <the-simple-regular-graph-model>

We use the classical pairing model for regular graphs #cite(label("BollobasPairing")).
  The special counting facts needed here have the following direct proof.

#thm([Lemma 2.1.])[
  #emph[In the configuration model with $d$ stubs at each of $n$ labelled vertices,
    conditioning the matching to give a simple graph produces the uniform simple labelled $d$-regular graph. Moreover,
$ bb(P) \( upright("the matching gives a simple graph") \) arrow.r exp #h(-0.16667em) (- frac(d^2 - 1, 4)) > 0 $

 along all admissible sizes. In the simple model, a specified vertex belongs to a triangle with probability
   $O \( n^(- 1) \)$. For any fixed $k$, independently sampled uniform oriented edges have distinct endpoints and
   induce exactly a matching with probability $1 - O_k \( n^(- 1) \)$.]
] <lem:model>

#proof[
  Every simple graph has the same number $\( d ! \)^n$ of stub realizations,
    which proves the conditional uniformity. A prescribed loop is one pair of stubs at a vertex.
    A prescribed double edge is an unordered pair of pairs between two distinct vertices, using distinct stubs.
    Let $Z$ count all occurring prescribed defects of these two kinds. The expected counts tend to
  $ frac(d - 1, 2) quad upright("and") quad frac(\( d - 1 \)^2, 4) \, $
  respectively. Indeed, a prescribed family of $e$ disjoint pairs occurs with probability
  $ frac(1, \( n d - 1 \) \( n d - 3 \) dots.h.c \( n d - 2 e + 1 \)) tilde.op \( n d \)^(- e) $
  for fixed $e$.
  For each fixed $j$, ordered $j$-tuples of defects on disjoint vertex sets give the leading contribution to
    $bb(E) \( Z \)_j$. Compatible overlapping tuples contribute $o \( 1 \)$.
    To see this, regard their prescribed pairs as a multigraph with $v$ vertices and $e$ edges.
    Every vertex has degree at least two. A connected component all of whose degrees equal two can only be a
    single prescribed loop or a single prescribed double edge. Thus a genuinely overlapping component has $v < e$.
    There are $O \( n^v \)$ choices and each has probability $O \( n^(- e) \)$.
    There are only finitely many overlap patterns for fixed $d \, j$. Consequently
  $ bb(E) \( Z \)_j arrow.r (frac(d - 1, 2) + frac(\( d - 1 \)^2, 4))^j . $
  The finite inclusion-exclusion bounds for $bb(P) \( Z = 0 \)$, followed by increasing their order,
    give the asserted limit. Absence of these defects is exactly simplicity.
  For a triangle through a fixed vertex, summing over the other two vertices and their stub choices gives
    $O \( n^2 \) thin O \( n^(- 3) \) = O \( n^(- 1) \)$ in the matching model.
    Conditioning on simplicity changes this bound by a bounded factor.
    Finally, in any simple $d$-regular graph a uniform endpoint is a uniform vertex.
    Each previously chosen endpoint has only $O_d \( 1 \)$ vertices equal or adjacent to it.
    A union bound over the fixed number of sampled endpoints proves the last assertion. ◻
]

=== 2.3 The imported spectral estimates <the-imported-spectral-estimates>

Put

$ S = exp \( sqrt(log n) \) . $

The following deliberately weak formulation is sufficient for our argument.

#thm([Proposition 2.2.])[
  (Spectral input).  #emph[There are constants $c_0 \, c_1 > 0$, $B < oo$,
    and a fixed open interval $I_E$ containing $E$, with closure contained in
    $\( - 2 sqrt(d - 1) \, 2 sqrt(d - 1) \)$, such that the following hold with probability tending to one.]
  + #emph[After omitting the eigenvalue associated with the constant vector,
    the ordered eigenvalues are within $n^(- c_0)$ of their Kesten–McKay classical locations.
    In the normalization above, every eigenvector entry is bounded by a deterministic $n^(o \( 1 \))$.]
  + #emph[Uniformly for $Re zeta in I_E$ and $S \/ n lt.eq Im zeta lt.eq 1$,
$ lr(|1 / n "Tr" \( A - zeta \)^(- 1) - m_d \( zeta \)|) lt.eq \( log n \)^B #scale(x: 120%, y: 120%)[\(]
  n^(- c_1) + \( n Im zeta \)^(- c_1) #scale(x: 120%, y: 120%)[\)] . $

 Except at at most $n^(1 - c_1)$ centers, the resolvent entries on a center and its $d$ neighbors satisfy the same
   error bound relative to the corresponding infinite $d$-regular tree entries.]
  #emph[These conclusions hold along all admissible $n$. In particular,
$ \# { i : \| x_i \| lt.eq S^2 } = O \( S^2 \) $

 on an event of probability tending to one.]
] <prop:spectral-input>

#proof[
  We use the fixed-degree results of Huang and Yau #cite(label("HuangYau")) Theorems 1.2, 1.4, and 4.2,
    in the precise version arXiv:2102.00963v3. Their matrix is $A \/ sqrt(d - 1)$;
    hence their bulk coordinate is $E \/ sqrt(d - 1) in \( - 2 \, 2 \)$.
    Rescaling the spectral parameter and the resolvent by this fixed factor gives our normalization.
  For clarity, the relevant error and geometry can be checked directly in their Definition 4.1 and Equations
    (4.6)–(4.7). Choose fixed parameters
  $ 0 < c < 1 \, wide a_(upright("HY")) gt.eq 12 \, wide b_(upright("HY")) gt.eq 25 a_(upright("HY")) \, wide
    0 < frak(r) < c \/ 32 \, $
  and neighborhood radius $r_(upright("HY")) = frak(r) log_(d - 1) n$, rounded to an integer.
    Their Definition 1.1 and Proposition 2.1 give a tree-like event with probability tending to one,
    on which all but a polynomially small fraction of vertices have a tree neighborhood of radius $\( c \/ 4 \)
    log_(d - 1) n$. This is more than enough to contain every neighborhood needed for the resolvent approximation
    between two vertices of the same star. The tree extension with the semicircle weight in their Equation (2.12)
    is then the ordinary regular-tree Green function.
  In a fixed bulk interval, their error is bounded by a logarithmic factor times
  $ \( d - 1 \)^(- r_(upright("HY"))) + \( n Im zeta \)^(- 1 \/ 2) + \( n Im zeta \)^(- 2 \/ 3) . $
  The factor $S$ dominates every fixed power of $log n$. After decreasing $c_1$ and increasing $B$,
    this gives the stated bounds and exceptional-set size. The same source provides polynomial rigidity and
    polylogarithmic complete delocalization. Its model and the quoted statements have no even-size restriction.
  For the final assertion, apply the trace estimate at $zeta = E + upright(i) S^2 \/ n$.
    Each eigenvalue with $\| lambda_i - E \| lt.eq S^2 \/ n$ contributes at least $n \/ \( 2 S^2 \)$ to
    $Im \( lambda_i - zeta \)^(- 1)$. The normalized imaginary trace is bounded, so the count is $O \( S^2 \)$. ◻
]

#prodef([Remark 2.3.])[
  The estimates in Proposition 3 are statements about events in the unconditioned simple-graph ensemble.
    We never condition the conclusion of Theorem 1 on connectedness, nonbipartiteness,
    or a tree-neighborhood property. The bounded Laplace observables are unaffected in the limit by discarding
    events of vanishing probability.
]

=== 2.4 Covariance and logarithmic potential on the tree <covariance-and-logarithmic-potential-on-the-tree>

The covariance below is the Gaussian-wave covariance on the regular tree;
  see #cite(label("ElonEigenvectors")) #cite(label("CsokaEtAl")).
  We derive it together with the logarithmic potential, so that the entropy normalization is explicit.

#thm([Lemma 2.4.])[
  #emph[Let $q \( zeta \)$ be the solution of
$ zeta = q^(- 1) + \( d - 1 \) q $

 which tends to zero at infinity in the upper half-plane. Then
$ - m_d \( zeta \) = frac(1, zeta - d q \( zeta \)) . $

 The regular-tree resolvent has diagonal entry $m_d \( zeta \)$ and adjacent entry
   $\( 1 + zeta m_d \( zeta \) \) \/ d$. At $zeta = E + upright(i) eta$, its imaginary-part matrix on a star,
   divided by $pi rho$, tends at a polynomial rate in $eta$ to the covariance matrix with variances one,
   center-neighbor covariance $p$, and distinct-neighbor covariance
$ frac(E^2 - d, d \( d - 1 \)) . $

 Furthermore,
$ k_0 = frac(1 + E m_(*), d) quad arrow.r.double quad k_0^2 - k_0 - m_(*)^2 = 0 . $

 For $U \( E \) = integral log \| t - E \| rho_d \( t \) thin upright(d) t$,
#[#set math.equation(numbering: n => "(2.3)")
 $ - U \( E \) = - 1 / 2 log d + frac(d - 1, 2) log a - d / 4 log \( 1 - p^2 \) . $ <eq:tree-potential>]

 Replacing $E$ by $E + upright(i) eta$ in the logarithmic potential changes its real part by $O \( eta \)$.]
] <lem:tree-identities>

#proof[
  A Schur complement at the root of a forward tree gives $q = \( zeta - \( d - 1 \) q \)^(- 1)$ in the convention
    $\( zeta - A \)^(- 1)$. Attaching $d$ forward branches yields the displayed formula for $- m_d$.
    The boundary value $pi^(- 1) Im m_d \( t + upright(i) 0 \)$ is the Kesten–McKay density above;
    the branch has the required mass at infinity and no additional pole.
  The resolvent equation at the center and symmetry among its neighbors give the adjacent entry.
    Applying the same equation to a neighbor column gives, for the common distinct-neighbor entry $g_2$,
  $ m_d \( zeta \) + \( d - 1 \) g_2 = zeta thin frac(1 + zeta m_d \( zeta \), d) . $
  Taking boundary imaginary parts proves the covariance formulas.
    The tree formula is analytic across each side of a sufficiently small bulk neighborhood,
    so these limits have a polynomial rate. Substituting its boundary value into $k_0 = \( 1 + E m_(*) \) \/
    d$ gives the quadratic identity.
  To compute the potential, integrate its analytic derivative $- m_d \( zeta \) =
    q \/ \( 1 - q^2 \)$ after changing from $zeta$ to $q$. Matching at infinity gives
  $ Re integral log \( zeta - t \) rho_d \( t \) thin upright(d) t = - log \| q \| - frac(d - 2, 2) log \| 1 -
    q^2 \| . $
  At the bulk boundary,
  $ \| q \| = \( d - 1 \)^(- 1 \/ 2) \, wide \| 1 - q^2 \| = frac(sqrt(d^2 - E^2), d - 1) . $
  These identities give (2.3) after substituting $a = d \( 1 - p^2 \) \/ \( d - 1 \)$.
    The boundary logarithmic integral exists because $rho_d$ is bounded near $E$. Finally,
  $ integral (log \| t - E - upright(i) eta \| - log \| t - E \|) rho_d \( t \) thin upright(d) t = 1 /
    2 integral log #h(-0.16667em) (1 + frac(eta^2, \( t - E \)^2)) rho_d \( t \) thin upright(d) t = O \( eta \) \, $
  by boundedness of the density near $E$, the substitution $t - E = eta u$,
    and the integrable tail of $log \( 1 + u^(- 2) \)$. ◻
]

== 3 Gaussian moments at sampled edges <sec:entropy>

We use the spectral estimates of Proposition 3 to identify the empirical distribution of finitely many eigenvector
  coordinates at an edge. The estimate must be quantitative:
  a fixed moment will later be summed over a subpolynomial number of eigenindices.
  We develop the entropy framework of #cite(label("BackhauszSzegedy"), form: "prose") quantitatively to obtain the
  conditional moment accuracy required here.

#thm([Proposition 3.1.])[
  (Uniform endpoint moments).  #emph[Fix positive integers $k \, ell$ and a nonnegative integer $q$.
    There are constants $c \, C > 0$ and events of graphs of probability tending to one with the following
    property. Choose distinct indices $i \( 1 \) \, dots.h \, i \( ell \)$ satisfying $\| x_(i \( j \)) \| lt.eq
    S^2$, by any rule depending only on the graph. Independently sample $k$ uniform oriented edges
    $\( v_alpha \, v'_alpha \)$, conditionally on the graph, and set
$ b_j = #scale(x: 120%, y: 120%)[\(] u_(i \( j \)) \( v_1 \) \, dots.h \, u_(i \( j \)) \( v_k \) \,
  u_(i \( j \)) \( v'_1 \) \, dots.h \, u_(i \( j \)) \( v'_k \) #scale(x: 120%, y: 120%)[\)]^top . $

 For every coordinate monomial $P$ of total degree at most $q$,
$
  lr(|bb(E) #scale(x: 120%, y: 120%)[\[] P \( b_1 \, dots.h \, b_ell \) divides A #scale(x: 120%, y: 120%)[\]] -
  bb(E) P \( Z_1 \, dots.h \, Z_ell \)|) lt.eq C n^(- c) \, wide Z_1 \, dots.h \, Z_ell med
  upright("independent ") N \( 0 \, C_k \) . $

 The constants and graph events are uniform over the indicated choices of eigenindices.
   They may depend on $d \, E \, k \, ell \, q$; no assertion is made for dimensions or moment orders growing with $n$.]
] <prop:edge-moments>

We first prove the assertion for one sampled edge. Write

$ V \( v \) = #scale(x: 120%, y: 120%)[\(] u_(i \( 1 \)) \( v \) \, dots.h \,
  u_(i \( ell \)) \( v \) #scale(x: 120%, y: 120%)[\)] in bb(R)^ell . $

A star observation consists of the value at a uniform vertex followed by its $d$ neighbor values in uniform random
  order. An edge observation uses a uniform oriented edge. Throughout this section the graph is conditioned on,
  and randomness in an observation includes its location. Write $H$ for discrete entropy and $cal(H)$ for
  differential entropy, both with natural logarithms. Positive polynomial error exponents may decrease from one
  occurrence to the next.

The proof passes from colored-label counts to an entropy inequality for Gaussian-smoothed stars and edges.
  We remove the nearly deterministic eigenvector relation, then use tensor coercivity to turn the resulting
  entropy bound into Gaussian moment estimates.

=== 3.1 Counting colored stars <counting-colored-stars>

We begin with a counting statement independent of eigenvectors.
  For a labeling of the vertices by an alphabet of size $M$,
  let $T$ be the probability distribution of the ordered star observation,
  symmetrized over all permutations of the neighbor positions. Let $Q$ be the oriented edge distribution.
  The counting argument follows the colored-star configuration-model framework of
  #cite(label("BackhauszSzegedyTrees"), form: "prose") Section 4;
  see also the asymptotic expected-coloring formula of #cite(label("BackhauszBordenaveSzegedy"), form: "prose")
  Theorem 2.3. We retain explicit errors for an alphabet growing with $n$.

#thm([Lemma 3.2.])[
  (Uniform type count).  #emph[Suppose $M = M_n$ and, for some fixed $kappa > 0$, $M^(d + 1) log n lt.eq
    n^(1 - kappa)$. With probability tending to one, simultaneously for every pair of histograms $T \, Q$,
    the number of vertex labelings with these histograms is at most
#[#set math.equation(numbering: n => "(3.1)")
 $ exp {n H \( T \) - frac(n d, 2) H \( Q \) + O \( n^(1 - c) \)} \, $ <eq:ent-type-count>]

 where $c > 0$ and the error constant depend only on $d \, kappa$.]
] <ent:type-count>

#proof[
  Work first in the configuration model, with an ordering of the $d$ half-edges at each vertex.
    Prescribe the vertex labels and the ordered list of desired neighbor labels at every vertex.
    For a fixed ordered tuple type $T_0$, there are at most $exp \( n H \( T_0 \) \)$ such arrays,
    by the multinomial bound.
  Let $m_(j k) = n d Q_(j k)$ be the number of half-edges whose vertex has color $j$ and whose prescribed neighbor
    has color $k$. Compatibility requires $m_(j k) = m_(k j)$, and $m_(j j)$ must be even.
    The probability that a uniform matching respects all these prescriptions is
  $ frac(product_(j < k) m_(j k) ! product_j \( m_(j j) - 1 \) ! !, \( n d - 1 \) ! !) \, $
  with zero-size factors omitted. Stirling’s bounds give its logarithm as
  $ - frac(n d, 2) H \( Q \) + O \( M^2 log n \) . $
  Thus the expected number of labelings of ordered type $T_0$ has the claimed exponential bound with $H \( T_0 \)$
    in place of $H \( T \)$.
  Symmetrization increases entropy, so $H \( T_0 \) lt.eq H \( T \)$; it leaves $Q$ unchanged.
    There are at most $exp \( O \( M^(d + 1) log n \) \)$ possible ordered tuple types.
    Summing over those with a given symmetrization therefore changes only the sublinear error.
    Markov’s inequality, followed by a union bound over all types,
    gives (3.1) with a slightly larger sublinear allowance. The simplicity probability is bounded away from zero
    by Lemma 2, so the statement transfers to uniform simple graphs.
    The symmetrized histograms no longer depend on the half-edge ordering. ◻
]

=== 3.2 A quantitative differential-entropy inequality <a-quantitative-differential-entropy-inequality>

Choose small fixed parameters $gamma \, alpha > 0$ satisfying

#[#set math.equation(numbering: n => "(3.2)")
 $ 2 ell \( d + 1 \) gamma < 1 \, wide 4 ell gamma + alpha < 1 / 4 \, wide 0 < alpha < gamma \, $ <eq:ent-parameters>]

and take $alpha$ smaller than the rigidity exponent in Proposition 3. Put $eta = n^(- alpha)$.
  Given the graph, let $Y$ have $ell$ independent Gaussian colors, each with covariance

#[#set math.equation(numbering: n => "(3.3)")
 $ Gamma = frac(1, pi rho) thin frac(eta, \( A - E \)^2 + eta^2) . $ <eq:ent-noise>]

For $0 lt.eq epsilon.alt lt.eq 1$, set $F = epsilon.alt V + Y$.
  The parameter $eta$ regularizes the eigenvector constraint;
  the independent parameter $epsilon.alt$ controls the size of the eigenvector signal.
  We retain the entropy inequality for every $epsilon.alt$,
  then choose a small power of $n^(- 1)$ when extracting each fixed moment.
  All eigenvectors used here satisfy the uniform subpolynomial coordinate bound from Proposition 3.

#thm([Lemma 3.3.])[
  (Star–edge entropy).  #emph[On events of graphs of probability tending to one,
    uniformly over the choices of $V$ and $0 lt.eq epsilon.alt lt.eq 1$,
#[#set math.equation(numbering: n => "(3.4)")
 $ cal(H) \( F_(upright("star")) \) - d / 2 cal(H) \( F_(upright("edge")) \) gt.eq 1 /
   n cal(H) \( Y_(upright("global")) \) - O \( n^(- c) \) \, $ <eq:ent-star-edge>]

 where $Y_(upright("global"))$ is the complete $n ell$-dimensional array. Moreover,
#[#set math.equation(numbering: n => "(3.5)")
 $ 1 / n cal(H) \( Y_(upright("global")) \) = ell (1 / 2 log frac(2 pi upright(e) eta, pi rho) - U \( E \)) +
   O \( n^(- c) \) \, wide U \( E \) = integral log \| t - E \| rho_d \( t \) thin thin upright(d) t .
   $ <eq:ent-global-entropy>]

]
] <ent:star-edge>

#proof[
  Quantize each coordinate into intervals of width $b = n^(- gamma)$,
    clipping all values outside a range of order $\[ - n^gamma \, n^gamma \]$ into its two end bins.
    The resulting vertex alphabet has $M = n^(2 ell gamma + o \( 1 \))$ elements, so Lemma 7 applies.
    Let $cal(L)$ be the random quantized labeling of $F$, and let $T \, Q$ be its random histograms.
    Entropy of the type index, followed by entropy bounded by logarithmic type size, gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ 1 / n H \( cal(L) \) lt.eq H \( bb(E) T \) - d / 2 bb(E) H \( Q \) + O \( n^(- c) \) . $ <eq:ent-quantized>]
  Here concavity was used only for the positive star term.
  We next replace $bb(E) H \( Q \)$ by $H \( bb(E) Q \)$. Two independent edge locations have Gaussian
    observations whose off-diagonal covariance block has average Frobenius norm at most
  $ C (frac("Tr" Gamma^2, n^2))^(1 \/ 2) lt.eq frac(C, sqrt(n) thin eta) . $
  Indeed endpoints from different sampled edges are independent uniform vertices, and $"Tr" Gamma^2 lt.eq
    C n \/ eta^2$. Each individual edge covariance has smallest eigenvalue at least $c_1 eta$,
    since $parallel A parallel lt.eq d$. After whitening the two marginal blocks,
    Gaussian total variation from the product law is bounded by the off-block norm when that norm is small,
    and by one otherwise. The small-norm bound follows, for example,
    by differentiating the Gaussian density along the straight line joining the two covariance matrices.
    Averaging yields
  $ bb(E)_(upright("locations")) thin "dist"_(upright("TV")) #scale(x: 120%, y: 120%)[\(]
    "Law" \( Y_(upright("edge")) \, Y'_(upright("edge")) \) \,
    "Law" \( Y_(upright("edge")) \) ⊗ "Law" \( Y'_(upright("edge")) \) #scale(x: 120%, y: 120%)[\)] lt.eq
    frac(C, sqrt(n) thin eta^2) \, $
  where the marginal laws on the right are at the fixed sampled locations.
    Deterministic shifts and subsequent quantization do not increase this distance.
  Consequently each cell frequency of $Q$ has variance $O \( n^(- 1 \/ 2) eta^(- 2) \)$. There are $M^2$ edge cells, so
  $ bb(E) parallel Q - bb(E) Q parallel_1 lt.eq n^(4 ell gamma - 1 \/ 4 + alpha + o \( 1 \)) = O \( n^(- c) \) . $
  The finite-alphabet entropy continuity bound $H_(upright("bin")) \( h \) +
    h log \( M^2 \)$ at total variation distance $h$ now proves
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(E) H \( Q \) = H \( bb(E) Q \) + O \( n^(- c) \) . $ <eq:ent-edge-concentration>]
  We record the differential-entropy passage carefully. Every fixed location covariance,
    including the complete array covariance, has spectrum in $\[ c_1 eta \, C \/ eta \]$;
    every coordinate of the deterministic shift is $n^(o \( 1 \))$.
    Unbounded binning and the entropy bound on a cube give
  $ 1 / n H \( cal(L) \) gt.eq 1 / n cal(H) \( Y_(upright("global")) \) - ell log b - O \( n^(- c) \) . $
  The displayed error accounts for clipping. It is in fact superpolynomially small:
    one-coordinate Gaussian tails beyond $n^gamma$, together with their quantized entropy contributions,
    are superpolynomially small uniformly in the shifts, because $alpha < gamma$.
    The loss for the full array is at most the sum of the coordinate losses.
    Translation by the deterministic array $epsilon.alt V$ does not change its differential entropy.
  For either fixed-dimensional local observation $X = F_(upright("star"))$ or $F_(upright("edge"))$, we also have
  #[#set math.equation(numbering: n => "(3.8)")
   $ H \( upright("binned ") X \) = cal(H) \( X \) - \( dim X \) log b + O \( n^(- c) \) . $ <eq:ent-binning>]
  To justify the two-sided estimate, fill each bin uniformly.
    Bin averaging a Gaussian density changes it in total variation by at most $C b eta^(- 1 \/ 2)$,
    by integrating its absolute first derivatives; the same bound holds for a mixture.
    Clipping adds only a superpolynomial tail error. Both resulting densities have polynomial supremum and
    second-moment bounds. Such bounds convert polynomial total variation into polynomial entropy error:
    subtract the common minimum of the two densities. The remaining densities have equal mass $h$;
    after division by $h$, their supremum and second moment are bounded by a polynomial divided by $h$,
    so their entropies have absolute value $O \( 1 + log \( n \/ h \) \)$.
    The entropy errors in mixing them with the common part are at most the binary entropy.
    This proves (3.8), and will also apply to fixed-dimensional projections below.
  The laws $bb(E) T \, bb(E) Q$ are exactly the binned local laws. Substitute (3.7) and (3.8) into (3.6).
    The mesh terms cancel, since $\( d + 1 \) ell - \( d \/ 2 \) \( 2 ell \) = ell$. This proves (3.4).
  Finally the Gaussian determinant formula gives
  $ 1 / n cal(H) \( Y_(upright("global")) \) = ell / 2 log frac(2 pi upright(e) eta, pi rho) - ell /
    n sum_i log \| lambda_i - E - i eta \| . $
  The test function in this sum has Lipschitz constant $O \( eta^(- 1) \)$.
    Rigidity therefore gives polynomial error in replacing the eigenvalues by Kesten–McKay quantiles.
    The quantile sum differs from its integral by $O \( \( n eta \)^(- 1) \)$,
    by summing the lengths of the quantile intervals. An omitted or extra bounded eigenvalue costs
    $O \( log n \/ n \)$. Lemma 5 gives the remaining regularization error $O \( eta \)$. This proves (3.5). ◻
]

=== 3.3 Removing the approximate eigenvector constraint <removing-the-approximate-eigenvector-constraint>

The entropy inequality contains one nearly deterministic direction:
  the sum of the neighbor values is nearly $E$ times the center.
  We remove that direction so that the limiting Gaussian has identity covariance.
  Write a star as $\( Z \, X \)$, with $Z in bb(R)^ell$ and $X in bb(R)^d ⊗ bb(R)^ell$,
  and let $P$ be orthogonal projection of $bb(R)^d$ onto $upright(bold(1))^perp$. Define

$ cal(B) \( Z \, X \) = \( Z \, P X \/ sqrt(a) \) \, wide R_(upright("res")) \( Z \, X \) = sum_(i = 1)^d X_i -
  E Z \, wide D = \( bb(R) xor upright(bold(1))^perp \) ⊗ bb(R)^ell . $

Here and below projections on spatial coordinates are tensored with the color identity.
  Let $w$ denote the unit central direction in $bb(R) xor upright(bold(1))^perp$, and set

$ v_i = p w + sqrt(a) thin P e_i \, wide U_i = "span" \( w \, v_i \) ⊗ bb(R)^ell . $

Then $parallel v_i parallel = 1$ and $chevron.l w \, v_i chevron.r = p$.
  Let $P_i$ be orthogonal projection onto $U_i$, put $B_V = cal(B) \( V_(upright("star")) \)$,
  and let $G$ be an independent standard Gaussian in $D$. Entropies on these spaces use their Euclidean volume.

#thm([Lemma 3.4.])[
  (Projected-star entropy).  #emph[On the graph events above, uniformly for $0 lt.eq epsilon.alt lt.eq 1$ and each $i$,
#[#set math.equation(numbering: n => "(3.9)")
 $ cal(H) \( epsilon.alt B_V + G \) - d / 2 cal(H) \( P_i \( epsilon.alt B_V + G \) \) gt.eq -
   O \( n^(- c) \) . $ <eq:ent-projected-entropy>]

 Moreover $B_V$ has mean zero and second-moment matrix $I_D + O \( n^(- 1 + o \( 1 \)) \)$.
   Every fixed moment of $P_i B_V$ is invariant up to $O \( n^(- 1 + o \( 1 \)) \)$ under the orthogonal map
   interchanging $w$ and $v_i$, acting trivially on the colors.]
] <ent:projected-entropy>

#proof[
  The absolute Jacobian determinant of $\( Z \, X \)
    mapsto \( cal(B) \( Z \, X \) \, R_(upright("res")) \( Z \, X \) \)$ is
    $\( sqrt(d) thin a^(- \( d - 1 \) \/ 2) \)^ell$. For each color, the residual variance of $Y$,
    averaged over centers, is at most $eta \/ \( pi rho \)$, since
  $ \( A - E \) Gamma \( A - E \) = frac(eta, pi rho) frac(\( A - E \)^2, \( A - E \)^2 + eta^2) lt.eq
    frac(eta, pi rho) I . $
  The eigenvector equations give a residual $O \( n^(- 1 + o \( 1 \)) \)$ for $V$,
    uniformly over locations and choices: $\| lambda_(i \( j \)) - E \| lt.eq S^2 \/ n$.
    More precisely, put $Delta = "diag" \( lambda_(i \( j \)) - E : 1 lt.eq j lt.eq ell \)$.
    At a uniform center $v$, the deterministic residual is $epsilon.alt Delta V \( v \)$,
    whose second-moment matrix is $epsilon.alt^2 Delta^2$ by eigenvector orthogonality.
    The Gaussian colors are independent and centered conditionally on the location, so cross terms vanish and
  #[#set math.equation(numbering: n => "(3.10)")
   $ "Cov" #scale(x: 120%, y: 120%)[\(] R_(upright("res")) \( F_(upright("star")) \) #scale(x: 120%, y: 120%)[\)]
     lt.eq frac(eta, pi rho) I_ell + epsilon.alt^2 Delta^2 lt.eq
     (frac(eta, pi rho) + S^4 / n^2) I_ell . $ <eq:ent-residual-covariance>]
  The relative correction inside the logarithmic entropy bound satisfies
  $ log (1 + frac(pi rho S^4, n^2 eta)) = O #scale(x: 120%, y: 120%)[\(] n^(- 2 + alpha + o \( 1 \))
    #scale(x: 120%, y: 120%)[\)] . $
  The maximum-entropy bound by covariance and the fact that conditioning lowers entropy thus give
  $ cal(H) \( R_(upright("res")) \( F_(upright("star")) \) divides cal(B) \( F_(upright("star")) \) \) lt.eq ell /
    2 log frac(2 pi upright(e) eta, pi rho) + O \( n^(- c) \) . $
  By the typical-star estimate at $E + i eta$ and the tree covariance in Lemma 5,
    the covariance of the noise $cal(B) \( Y_(upright("star")) \)$ differs from $I_D$ by a polynomially small
    error outside a polynomially small fraction of centers. Gaussian total variation after translation,
    followed by the entropy-continuity argument in Lemma 8, allows this noise to be replaced by $G$ at polynomial
    entropy cost.
  Similarly, the edge coordinates have the same entropy, up to polynomial error,
    as the observations of $epsilon.alt B_V + G$ in directions $w \, v_i$.
    The deterministic discrepancy in the neighbor coordinate is $O \( n^(- 1 + o \( 1 \)) \)$,
    because the neighbor average is $p$ times the center up to that error.
    The map from orthonormal coordinates on $U_i$ to these two edge coordinates has absolute determinant
    $\( 1 - p^2 \)^(ell \/ 2)$. It follows that the left side of (3.4) is at most the left side of (3.9) plus
  $ ell
    (1 / 2 log frac(2 pi upright(e) eta, pi rho) - 1 / 2 log d + frac(d - 1, 2) log a - d / 4 log \( 1 - p^2 \)) +
    O \( n^(- c) \) . $
  Combine (3.4), (3.5), and the potential identity (2.3). Their constants agree exactly, proving (3.9).
  For the remaining assertions, put $Lambda = "diag" \( lambda_(i \( 1 \)) \, dots.h \, lambda_(i \( ell \)) \)$.
    Orthogonality of the normalized eigenvectors, the eigenvector equations,
    and uniform permutation of neighbors give the exact second-moment identities
  $ bb(E) Z Z^top = bb(E) X_i X_i^top = I_ell \, wide bb(E) Z X_i^top = Lambda \/ d \, wide bb(E) X_i X_j^top =
    frac(Lambda^2 - d I_ell, d \( d - 1 \)) quad \( i eq.not j \) . $
  The mean is zero because these eigenvectors are orthogonal to constants.
    These identities imply $bb(E) B_V B_V^top = I_D + O \( n^(- 1 + o \( 1 \)) \)$, using $Lambda = E I_ell +
    O \( n^(- 1 + o \( 1 \)) \)$. Finally an actual uniform oriented edge is invariant under reversal.
    Its two coordinates differ from the $w \, v_i$ observations of $B_V$ by $O \( n^(- 1 + o \( 1 \)) \)$.
    This error remains of that order in every fixed moment because all coordinates are $n^(o \( 1 \))$.
    The coordinate map is invertible since $\| p \| < 1$, so reversal is precisely the asserted orthogonal swap on
    $U_i$. ◻
]

We have obtained the entropy inequality, the approximate reversal symmetries,
  and the second moments needed to identify the edge law. The exact eigenvector normalization has supplied
  variance one; it is now the higher moments that remain to be controlled.

To see the role of the next lemma, write $phi_L$ for the standard Gaussian density on a Euclidean space $L$,
  and define relative entropy by

$ "Ent" \( "Law" \( Z \) divides phi_L \) = integral_L f log \( f \/ phi_L \) \, $

when $Z$ has density $f$. For a centered vector $Z$ in $D$ with identity covariance and finite differential
  entropies for itself and its projections, the Gaussian entropy formula gives

#[#set math.equation(numbering: n => "(3.11)")
 $ cal(H) \( Z \) - 1 / 2 sum_(i = 1)^d cal(H) \( P_i Z \) = - "Ent" \( "Law" \( Z \) divides phi_D \) + 1 /
   2 sum_(i = 1)^d "Ent" \( "Law" \( P_i Z \) divides phi_(U_i) \) . $ <eq:ent-deficit-sign>]

The constants cancel because $dim D = 1 / 2 sum_i dim U_i = d ell$.
  The same identity holds up to the second-moment error for the normalized smoothing of $B_V$.
  Thus the entropy bound limits the full relative entropy by half the sum of its projected relative entropies.
  The next lemma shows that the first nonzero Hermite coefficient would violate this bound.
  Its strictness is where $d gt.eq 3$ and the open bulk condition enter the argument.

=== 3.4 A strict tensor inequality <a-strict-tensor-inequality>

For an integer $j$, use the Euclidean norm on symmetric tensors in $D^(⊗ j)$.
  Let $sigma_i$ denote the orthogonal swap of $w \, v_i$ on $U_i$, with the identity on colors.

#thm([Lemma 3.5.])[
  (Tensor coercivity).  #emph[For every fixed $j gt.eq 3$, there exists $c_j >
    0$ such that every symmetric $j$-tensor $H$ on $D$ satisfying $sigma_i^(⊗ j) P_i^(⊗ j) H =
    P_i^(⊗ j) H$ for all $i$ obeys
#[#set math.equation(numbering: n => "(3.12)")
 $ parallel H parallel^2 - 1 / 2 sum_(i = 1)^d parallel P_i^(⊗ j) H parallel^2 gt.eq
   c_j parallel H parallel^2 . $ <eq:ent-tensor>]

]
] <ent:tensor>

#proof[
  We use the weighted-frame geometry of #cite(label("BackhauszSzegedy"), form: "prose") Lemma 11.3,
    with the numbering of the published version, and then prove the tensor strictness needed here.
    In the spatial plane spanned by $w \, v_i$, define the orthonormal bisecting directions
  $ e_i^(+) = frac(w + v_i, sqrt(2 \( 1 + p \))) \, wide e_i^(-) = frac(w - v_i, sqrt(2 \( 1 - p \))) \, wide
    s_i = frac(e_i^(+) + e_i^(-), sqrt(2)) \, wide t_i = frac(e_i^(+) - e_i^(-), sqrt(2)) . $
  The swap fixes $e_i^(+)$, negates $e_i^(-)$, and hence interchanges the orthonormal directions $s_i \, t_i$.
    Their squared central components are
  $ frac(1 + sqrt(1 - p^2), 2) \, wide frac(1 - sqrt(1 - p^2), 2) . $
  Writing $q_0 = sqrt(1 - p^2)$, the strict bulk condition is
  $ p^2 < frac(4 \( d - 1 \), d^2) quad arrow.l.r.double quad q_0 > frac(d - 2, d) . $
  For $d gt.eq 3$, the two squared central components therefore strictly bracket $1 \/ d$. The weights
  $ b_s = frac(q_0 - \( d - 2 \) \/ d, 2 q_0) \, wide b_t = frac(q_0 + \( d - 2 \) \/ d, 2 q_0) $
  are positive, sum to one, and satisfy
  #[#set math.equation(numbering: n => "(3.13)")
   $ sum_(i = 1)^d #scale(x: 120%, y: 120%)[\(] b_s s_i s_i^top + b_t t_i t_i^top #scale(x: 120%, y: 120%)[\)] =
     I_(bb(R) xor upright(bold(1))^perp) . $ <eq:ent-frame>]
  Indeed its central component is one by the choice of weights.
    Its mixed block vanishes because $sum_i P e_i = 0$. The remaining block is a scalar identity on
    $upright(bold(1))^perp$; its trace determines that scalar to be one.
  Tensor (3.13) with the color identity, and use it in the first slot of $parallel H parallel^2$.
    In each summand project the other $j - 1$ slots onto $U_i$. This can only decrease the value.
    After projection, swap invariance makes the squared norms associated with $s_i$ and $t_i$ equal.
    Since their weights sum to one, the resulting value is $1 / 2 sum_i parallel P_i^(⊗ j) H parallel^2$.
    This proves nonnegativity of the left side of (3.12).
  Suppose equality holds. Positivity of both weights implies that every discarded squared norm vanishes.
    If $R_(i \, s)$ and $R_(i \, t)$ are the projections onto $s_i ⊗ bb(R)^ell$ and $t_i ⊗ bb(R)^ell$, then
  $ R_(i \, s)^(\( 1 \)) H = R_(i \, s)^(\( 1 \)) P_i^(\( 2 \)) dots.h.c P_i^(\( j \)) H \, $
  and likewise for $t$; superscripts specify tensor slots. Adding the two identities and using symmetry gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ P_i^(\( a \)) H = P_i^(⊗ j) H quad upright("for every slot ") a . $ <eq:ent-slot-transfer>]
  In particular each projection may be moved from one slot to another when acting on $H$.
    For $i eq.not k$, the availability of three slots now gives
  $ P_i^(\( 1 \)) P_k^(\( 1 \)) H & = P_i^(\( 1 \)) P_k^(\( 2 \)) H = P_k^(\( 2 \)) P_i^(\( 3 \)) H\
 & = P_i^(\( 3 \)) P_k^(\( 1 \)) H = P_k^(\( 1 \)) P_i^(\( 1 \)) H . $
  Thus $\[ P_i \, P_k \]$ annihilates the first slot of $H$.
  Let $a'_i$ be the unit vector proportional to $P e_i$. The spatial part of this commutator is
  $ chevron.l a'_i \, a'_k chevron.r #scale(x: 120%, y: 120%)[\(] a'_i \( a'_k \)^top -
    a'_k \( a'_i \)^top #scale(x: 120%, y: 120%)[\)] \, wide chevron.l a'_i \, a'_k chevron.r = - frac(1, d - 1) . $
  For $d gt.eq 3$, it is invertible on $"span" \( P e_i \, P e_k \)$ and vanishes on its orthogonal complement.
    The simultaneous kernel of all these commutators is therefore the central direction,
    tensored with the color space. Symmetry leaves $H$ supported in $\( w ⊗ bb(R)^ell \)^(⊗ j)$.
    But its projected swap invariance would also support it in $\( v_i ⊗ bb(R)^ell \)^(⊗ j)$;
    the two spatial lines are distinct, so $H = 0$. The continuous quadratic form is consequently strictly
    positive on the unit sphere of the finite-dimensional constraint space. Compactness proves (3.12). ◻
]

=== 3.5 A finite-dimensional Gaussian criterion <a-finite-dimensional-gaussian-criterion>

We isolate the remaining inference from the graph argument.
  The spaces $D \, U_i$, projections $P_i$, and swaps $sigma_i$ retain the fixed geometry defined above.

#thm([Lemma 3.6.])[
  (Entropy criterion for Gaussian moments).  #emph[Fix an integer $q gt.eq 2$.
    Let $B_n$ be random vectors in $D$ with $parallel B_n parallel lt.eq K_n$ almost surely, where $K_n =
    n^(o \( 1 \))$ is deterministic. Suppose that for some $c_(*) > 0$,
$ parallel bb(E) B_n parallel + parallel bb(E) B_n B_n^(sans(T)) - I_D parallel = O \( n^(- c_(*)) \) \, $

 and, for every $1 lt.eq j lt.eq q$ and every $i$,
$ ∥\( sigma_i^(⊗ j) - I \) bb(E) \( P_i B_n \)^(⊗ j)∥ = O \( n^(- c_(*)) \) . $

 Let $G$ be an independent standard Gaussian in $D$. Suppose also that, uniformly for $0 lt.eq epsilon.alt lt.eq 1$,
$ cal(H) \( epsilon.alt B_n + G \) - 1 / 2 sum_(i = 1)^d cal(H) \( P_i \( epsilon.alt B_n + G \) \) gt.eq -
  O \( n^(- c_(*)) \) . $

 Then every fixed polynomial moment of $B_n$ of degree at most $q$ differs from its standard Gaussian value by
   $O \( n^(- c) \)$, for some $c > 0$. The conclusion is uniform over families satisfying these hypotheses with
   the same $c_(*)$, error constants, and bound $K_n$.]
] <ent:gaussian-criterion>

#proof[
  For $y in D$, define the Hermite tensors $"He"_j \( y \)$ by the generating identity
  $ exp #scale(x: 120%, y: 120%)[\(] chevron.l y \, t chevron.r -
    parallel t parallel^2 \/ 2 #scale(x: 120%, y: 120%)[\)] =
    sum_(j = 0)^oo frac(chevron.l "He"_j \( y \) \, t^(⊗ j) chevron.r, j !) \, wide t in D . $
  Set $H_j = bb(E) "He"_j \( B_n \)$. We prove by induction that
  #[#set math.equation(numbering: n => "(3.15)")
   $ parallel H_j parallel = O \( n^(- c_j) \) quad \( 1 lt.eq j lt.eq q \) . $ <eq:ent-hermite-small>]
  This suffices because Hermite polynomials form a basis of the ordinary polynomials.
    The first- and second-moment hypotheses give the cases $j = 1 \, 2$.
  Fix $j gt.eq 3$, assuming the preceding orders have been proved.
    Choose $epsilon.alt = n^(- tau)$, where $tau > 0$ satisfies
  $ 2 j tau < c_(*) \/ 2 \, wide \( j - k \) tau < c_k \/ 2 quad \( 1 lt.eq k < j \) . $
  This choice may depend on $j$. Put $u = epsilon.alt \/ sqrt(1 + epsilon.alt^2)$.
    Dividing every entropy argument in the hypothesis by $sqrt(1 + epsilon.alt^2)$ leaves that inequality
    unchanged, because the dimensions cancel. The normalized random vector is
  $ Z_u = u B_n + sqrt(1 - u^2) thin G . $
  Its second-moment matrix is $I_D + u^2 O \( n^(- c_(*)) \)$.
    Consequently (3.11), with this second-moment error included, turns the hypothesis into
  #[#set math.equation(numbering: n => "(3.16)")
   $ "Ent" \( "Law" \( Z_u \) divides phi_D \) - 1 / 2 sum_(i = 1)^d
     "Ent" \( "Law" \( P_i Z_u \) divides phi_(U_i) \) lt.eq O \( n^(- c_(*)) \) . $ <eq:ent-relative-deficit>]
  We claim that
  #[#set math.equation(numbering: n => "(3.17)")
   $ "Ent" \( "Law" \( Z_u \) divides phi_D \) =
     u^(2 j) (frac(parallel H_j parallel^2, 2 j !) + O \( n^(- c') \)) \, $ <eq:ent-relative-expansion>]
  and that the analogous formula for $P_i Z_u$ has $P_i^(⊗ j) H_j$ in place of $H_j$.
    Let $f_u$ denote the density ratio of $Z_u$ to $phi_D$. The coefficient of $u^k$ in its Taylor expansion is
  $ frac(1, k !) chevron.l H_k \, "He"_k \( y \) chevron.r . $
  This follows by integrating against the generating exponential:
    the resulting transform is $bb(E) exp \( u chevron.l B_n \, t chevron.r - u^2 parallel t parallel^2 \/ 2 \)$.
    Pairing two generating exponentials under Gaussian measure gives Hermite orthogonality and the identity
  $ ∥frac(chevron.l H_k \, "He"_k chevron.r, k !)∥_(L^2 \( phi_D \))^2 = frac(parallel H_k parallel^2, k !) . $
  The Taylor remainder through degree $j$ is $O \( u^(j + 1) n^(o \( 1 \)) \)$ in $L^3 \( phi_D \)$.
    Indeed, at a fixed source value $b_0$, the ratio at parameter $s$ is
  $ \( 1 - s^2 \)^(- dim D \/ 2) exp
    (frac(parallel y parallel^2, 2) - frac(parallel y - s b_0 parallel^2, 2 \( 1 - s^2 \))) . $
  For $0 lt.eq s lt.eq u$ its required derivatives are bounded by polynomials in $parallel y parallel \,
    parallel b_0 parallel$ times $C exp \( C s parallel b_0 parallel parallel y parallel \)$.
    Since $parallel b_0 parallel lt.eq n^(o \( 1 \))$ and $u = n^(- tau + o \( 1 \))$,
    their $L^3 \( phi_D \)$ norms are $n^(o \( 1 \))$, uniformly over the source values.
    Taylor’s theorem and averaging prove the bound.
  For a density ratio $1 + h$, the pointwise remainder after subtracting $h +
    h^2 \/ 2$ from $\( 1 + h \) log \( 1 + h \)$ is bounded by $C \| h \|^3$ for the entire range $h gt.eq - 1$.
    As $integral h thin thin upright(d) phi_D = 0$,
  $ "Ent" \( \( 1 + h \) phi_D divides phi_D \) = 1 / 2 integral h^2 thin thin upright(d) phi_D +
    O (integral \| h \|^3 thin thin upright(d) phi_D) . $
  All lower $H_k$, $1 lt.eq k < j$, are polynomially small by induction,
    whereas every fixed $H_k$ is at most $n^(o \( 1 \))$. The inequalities defining $tau$ make the lower-degree
    part, together with the Taylor remainder, of size $u^j O \( n^(- delta) \)$ in $L^3$ for some $delta > 0$.
    In particular $parallel f_u - 1 parallel_(L^3) = u^j n^(o \( 1 \))$,
    so the cubic entropy error divided by $u^(2 j)$ is $O \( u^j n^(o \( 1 \)) \)$, again polynomially small.
    Orthogonality now proves (3.17). The same reasoning applies to each projection.
  Substitute these expansions into (3.16) and divide by $u^(2 j) \/ \( 2 j ! \)$. The choice of $tau$ gives
  #[#set math.equation(numbering: n => "(3.18)")
   $ parallel H_j parallel^2 - 1 / 2 sum_(i = 1)^d parallel P_i^(⊗ j) H_j parallel^2 lt.eq
     O \( n^(- c'') \) . $ <eq:ent-hermite-deficit>]
  Hermite tensors commute with orthogonal projections and are equivariant under orthogonal maps, so
  $ P_i^(⊗ j) H_j = bb(E) "He"_j \( P_i B_n \) $
  in the Gaussian space $U_i$. Since $"He"_j$ is a fixed polynomial,
    the assumed moment symmetries give the swap constraints of Lemma 10 with polynomially small errors.
    In fixed finite dimensions the distance to the common kernel of a collection of linear maps is bounded by a
    constant times the sizes of their images. Project $H_j$ onto that kernel.
    This changes it by a polynomially small amount, and changes the quadratic expression in (3.18) by a
    polynomially small amount, since $parallel H_j parallel = n^(o \( 1 \))$.
    Lemma 10 therefore proves (3.15) and closes the induction.
    Each step uses only the common constants in the hypotheses, proving uniformity. ◻
]

#proof[
  Condition on a graph in the common events of Lemmas 7 and 9 and Proposition 3.
    Apply Lemma 11, with $q$ replaced by $max \( q \, 2 \)$, to $B_n = B_V$.
    Complete delocalization gives its deterministic subpolynomial bound.
    Lemma 9 supplies its first two moments and all fixed-order projected moment symmetries.
    Averaging (3.9) over $i$ gives the criterion’s entropy hypothesis.
    All these inputs are uniform over the selected eigenindices.
    Hence every moment of $B_V$ of degree at most $q$ differs polynomially little from the corresponding standard
    Gaussian moment in $D$.
  The observations of that Gaussian in directions $w \, v_i$ have covariance $C_ell$.
    The uniformly $O \( n^(- 1 + o \( 1 \)) \)$ eigenvector residual transfers the moment estimate to the actual
    edge values $\( V \( v \) \, V \( v' \) \)$. For $k$ conditionally independent edge locations,
    a coordinate monomial factors across those locations. The one-edge estimates give the asserted joint moment
    estimate, with independent edge samples and, equivalently,
    independent $N \( 0 \, C_k \)$ vectors across the $ell$ eigenindices.
  The common graph events do not depend on the selected eigenindices:
    Lemma 7 applies simultaneously to every quantized labeling,
    and the spectral and eigenvector residual bounds are uniform throughout the band.
    The Gaussian criterion preserves this uniformity at every fixed moment order. This proves the proposition. ◻
]

== 4 Endpoint resolvents and microscopic limits <sec:limits>

Proposition 6 describes finitely many eigenvectors sampled at edges.
  We first turn this information into a resolvent estimate at large fixed microscopic heights.
  A two-edge switch supplies the self-consistency equation needed to descend from the height at which the local
  law applies. We then construct microscopic subsequential limits and identify both their Gaussian spectral
  weights and the real constants in their resolvent representations.

=== 4.1 Resolvents at sampled endpoints <resolvents-at-sampled-endpoints>

Conditionally on the graph, sample an infinite sequence of independent uniform oriented edges.
  For fixed $k$, let $W_(n \, k)$ be the $n$-by-$2 k$ matrix whose columns are the coordinate vectors of the first
  $k$ starting vertices, followed by those of the corresponding ending vertices. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ M_(n \, k) \( z \) = W_(n \, k)^(sans(T)) \( A - E - z \/ n \)^(- 1) W_(n \, k) =
   sum_i frac(b_i b_i^(sans(T)), x_i - z) \, wide b_i = W_(n \, k)^(sans(T)) u_i \, wide
   Im z > 0 . $ <eq:lim-endpoint-resolvent>]

The normalization $parallel u_i parallel = sqrt(n)$ accounts for the absence of a factor of $n$ in the last
  expression. Both $m_n$ and every real quadratic form of $M_(n \, k)$ have nonnegative imaginary part.

For every fixed total degree, the joint moments of the $b_i$ with $\| x_i \| lt.eq S^2$ agree,
  to polynomial precision, with those of independent centered Gaussian vectors of covariance $C_k$.
  Indeed, take the distinct eigenvector indices occurring in a monomial as the colors in Proposition 6,
  and then use the conditional independence of the sampled edges.
  Only finitely many colors are needed for a fixed monomial.
  All errors are uniform in the selected band indices on events of graph probability tending to one.

#thm([Proposition 4.1.])[
  (Endpoint control).  #emph[There is a deterministic $xi > 0$, depending only on $d \, E$,
    with the following property. For every fixed $k gt.eq 1$ and $D > 0$,
    there are constants $C_(k \, D) < oo$ and $y_(k \, D) < oo$ such that,
    for every fixed $s in bb(R)$ and every fixed $y gt.eq y_(k \, D)$,
#[#set math.equation(numbering: n => "(4.2)")
 $ limsup_(n arrow.r oo) bb(P)
   (\| m_n \( s + upright(i) y \) - m_(*) \| + parallel M_(n \, k) \( s + upright(i) y \) - K_k \( m_(*) \)
   parallel > y^(- xi)) lt.eq C_(k \, D) y^(- D) . $ <eq:lim-endpoint-control>]

 The limit is through admissible graph sizes. The constants and the height threshold are independent of $s$;
   the argument $s + upright(i) y$ is fixed before taking the limit.]
] <prop:endpoint-control>

#proof[
  It suffices to prove the statement for $k gt.eq 2$, since the smaller matrices are compressions.
    Throughout this proof $k \, s \, y$ are fixed. The exponents in polynomial errors may depend on fixed moment orders.
  ===== 4.1.1 Initial estimates. <initial-estimates.>
  Put $z_0 = s + upright(i) S$. Proposition 3 and Lemma 5 give, for some $c > 0$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ m_n \( z_0 \) & = m_(*) + O \( S^(- c) \) \,\
M_(n \, k) \( z_0 \) & = K_k \( m_(*) \) + O \( S^(- c) \) \,\
Im m_n \( upright(i) S^2 \) + parallel Im M_(n \, k) \( upright(i) S^2 \) parallel & =
  O \( 1 \) $ <eq:lim-initial-estimates>]
  with probability tending to one. To justify the off-block entries in the second assertion,
    write $R = \( A - E - z_0 \/ n \)^(- 1)$. For independent uniform vertices $v \, w$, the resolvent identity gives
  $ bb(E)_(v \, w) \| R_(v w) \|^2 = 1 / n^2 "Tr" R^(*) R = frac(Im m_n \( z_0 \), S) . $
  Endpoints from distinct edge samples have this independent uniform distribution.
    Markov’s inequality makes their resolvent entries $O \( S^(- c) \)$, after decreasing $c$.
    Within a single sampled edge the typical-star estimate applies, with adjacent entry $\( 1 + E m_(*) \) \/ d$.
    The same reasoning gives the last assertion of (4.3). These estimates also imply that the number of indices in
    $\| x_i \| lt.eq S^2$ is $O \( S^2 \) = n^(o \( 1 \))$.
  ===== 4.1.2 Concentration under a trace bound. <concentration-under-a-trace-bound.>
  Descend from $S$ to $y$ by halving the height, shortening the last step if necessary, and keep real part $s$.
    Let $cal(Z)_n$ denote these $O \( log S \)$ arguments. For every fixed $C < oo$, we claim that,
    outside an event with limiting upper probability $O_(k \, D \, C) \( y^(- D) \)$,
    simultaneously for $z in cal(Z)_n$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| m_n \( z \) \| lt.eq C quad arrow.r.double quad M_(n \, k) \( z \) = K_k \( m_n \( z \) \) +
     O \( \( Im z \)^(- c_2) \) . $ <eq:lim-concentration-implication>]
  Here $c_2 > 0$ can be chosen independently of $D \, k \, s \, C$,
    with constants in the error allowed to depend on the fixed parameters.
  We compare $z$ with $z_0$. Once $S$ exceeds a fixed multiple of $\| s \| + y + 1$, for $\| x \| > S^2$ we have
  #[#set math.equation(numbering: n => "(4.5)")
   $ lr(|frac(1, x - z) - frac(1, x - z_0)|) lt.eq frac(C S, x^2) lt.eq C /
     S thin Im frac(1, x - upright(i) S^2) . $ <eq:lim-band-tail>]
  Thus the scalar and matrix contributions outside the band are $O \( S^(- 1) \)$ on the event in (4.3).
    For the matrix bound, use that each residue $b_i b_i^(sans(T))$ is positive semidefinite.
  Inside the band, let
  $ w_i \( z \) = frac(1, x_i - z) - frac(1, x_i - z_0) . $
  If the scalar trace at $z$ is bounded, then
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(\| x_i \| lt.eq S^2) \| w_i \( z \) \|^2 lt.eq 2 frac(Im m_n \( z \), Im z) +
     2 frac(Im m_n \( z_0 \), S) lt.eq frac(C', Im z) . $ <eq:lim-weight-squares>]
  Replace the marks for this calculation by independent Gaussians of covariance $C_k$.
    For every fixed integer $j$, each entry of
  $ sum_(\| x_i \| lt.eq S^2) \( b_i b_i^(sans(T)) - C_k \) w_i \( z \) $
  then has $2 j$-th absolute moment at most $C_(j \, k \, C) \( Im z \)^(- j)$.
    In the moment expansion a spectral index occurring only once has zero expectation.
    For every remaining partition of the indices, bounded Gaussian moments and (4.6) give the stated bound.
  The same estimate, with an additional polynomially small error,
    holds conditionally on each graph satisfying the required fixed-order moment estimates.
    There are only $n^(o \( 1 \))$ terms in the expansion, and the weights are bounded because $Im z gt.eq y gt.eq
    1$. The event $\| m_n \( z \) \| lt.eq C$ depends only on the graph,
    so it causes no difficulty in this conditional calculation. Choose
  $ 0 < c_2 < min \( c \, 1 \/ 4 \) . $
  Markov’s inequality at threshold $\( Im z \)^(- c_2)$ gives a failure probability bounded by a constant times
    $\( Im z \)^(- j \( 1 - 2 c_2 \))$, plus a polynomially small error in $n$.
    Summing over the geometric sequence of heights is bounded by $C_(j \, k \, C) y^(- j \/ 2) + o \( 1 \)$.
    Taking $j$ sufficiently large proves (4.4). The graph exceptional events and the failure of (4.3) have
    probability tending to zero. Factors from $S$ and the number of steps are $n^(o \( 1 \))$,
    so the polynomial moment errors remain negligible.
  ===== 4.1.3 A switch gives the scalar equation. <a-switch-gives-the-scalar-equation.>
  The graph/list bijection below uses the measure-preserving switching mechanism of
    #cite(label("BauerschmidtHuangYauLocal"), form: "prose") Section 7.2, Propositions 7.3–7.4.
    Figure 1 illustrates the two-edge operation.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.6), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 1.6), [$v_1$], anchor: "east")
  circle((0, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0), [$v_2$], anchor: "east")
  circle((2, 1.6), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((2.035, 1.6), [$w_1$], anchor: "west")
  circle((2, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((2.035, 0), [$w_2$], anchor: "west")
  circle((5.1, 1.6), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((5.065, 1.6), [$v_1$], anchor: "east")
  circle((5.1, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((5.065, 0), [$v_2$], anchor: "east")
  circle((7.1, 1.6), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((7.135, 1.6), [$w_1$], anchor: "west")
  circle((7.1, 0), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((7.135, 0), [$w_2$], anchor: "west")
  line((0, 1.6), (2, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2, 1.6), (0, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 0), (2, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.1, 1.6), (7.1, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.1, 0), (5.1, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.1, 0), (7.1, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.6, 0.8), (4.5, 0.8), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.25cm, fill: black)))
  content((3.55, 0.8), [#text(size: 9pt)[switch]], anchor: "south", padding: 0.1176cm)
  content((1, -0.65), [#text(size: 9pt)[original pairs]])
  content((6.1, -0.65), [#text(size: 9pt)[new pairs]])
})],
    caption: [Figure 1: A two-edge switch on an induced matching. The marked pairs $\( v_1 \, w_1 \)$ and $\( v_2 \, w_2 \)$ are replaced by $\( v_1 \, w_2 \)$ and $\( v_2 \, w_1 \)$. Each endpoint loses one edge and gains one edge, so its degree is preserved. All other graph edges remain in place, and the marked list records the new pairs. The same exchange reverses the operation. ],
  ) <fig:two-edge-switch>
  With probability $1 - O_k \( n^(- 1) \)$, the $2 k$ sampled endpoints are distinct and the only graph edges
    among them are the sampled pairs. This follows directly from fixed degree and conditional independence of the
    edge samples. Restrict temporarily to this event. Exchange the ending vertices of the first two pairs and
    update their entries in the edge list. The operation is a bijection of the restricted graph/list space,
    and all its elements have the same probability. In particular the switched data, denoted by hats,
    satisfy (4.4) with the same failure bound. The restriction itself is preserved by the switch.
  The adjacency update has bounded rank. The eigenvalue counting functions before and after the update
    consequently differ by a bounded amount. Integrating their difference against the derivative of
    $\( t - z \)^(- 1)$ gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| hat(m)_n \( z \) - m_n \( z \) \| lt.eq frac(C, Im z) . $ <eq:lim-rank-trace>]
  This calculation is in the microscopic spectral variable; equivalently, $m_n \( z \) =
    "Tr" \( n \( A - E \) - z \)^(- 1)$.
  Write the first two oriented pairs as $\( v_1 \, w_1 \) \, \( v_2 \, w_2 \)$, and put
  $ f_1 = frac(e_(v_1) - e_(v_2), sqrt(2)) \, wide f_2 = frac(e_(w_1) - e_(w_2), sqrt(2)) \, wide
    F = \( f_1 \, f_2 \) . $
  The switch adds $F B F^(sans(T))$, where
  $ B = mat(delim: "(", 0, - 2; - 2, 0) . $
  Let $U = F^(sans(T)) \( A - E - z \/ n \)^(- 1) F$, and define $hat(U)$ using the switched graph but the same
    old columns $F$. The resolvent identity yields
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( I + U B \) hat(U) = U . $ <eq:lim-switch-identity>]
  Suppose now that $m = m_n \( z \)$ lies in a fixed bounded range.
    Equations (4.4) and (4.7), applied to both data sets with a sufficiently large trace threshold, give
  #[#set math.equation(numbering: n => "(4.9)")
   $ U = mat(delim: "(", m, q; q, m) + O \( \( Im z \)^(- c_2) \) \, wide hat(U) =
     mat(delim: "(", m, - q; - q, m) + O \( \( Im z \)^(- c_2) \) \, wide q =
     frac(1 + E m, d) . $ <eq:lim-switch-compressions>]
  The sign in the second matrix comes from expressing the updated edge list in the old columns:
    the right difference column is negated. The off-diagonal entries of (4.8) now imply
  #[#set math.equation(numbering: n => "(4.10)")
   $ q^2 - q - m^2 = O \( \( Im z \)^(- c_2) \) . $ <eq:lim-scalar-equation>]
  As a quadratic in $m$, its exact left side has simple conjugate roots in the strict bulk.
    By Lemma 5, the upper root is $m_(*)$. The lower root stays a fixed distance from every $m$ with $Im m gt.eq
    0$. Hence, throughout the bounded range,
  #[#set math.equation(numbering: n => "(4.11)")
   $ m_n \( z \) = m_(*) + O \( \( Im z \)^(- c_2) \) . $ <eq:lim-scalar-stability>]
  ===== 4.1.4 Closing the descent. <closing-the-descent.>
  There is no a priori trace assumption at a lower step. Instead, if $eta \/ 2 lt.eq eta' lt.eq eta$,
    the resolvent sum gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| m_n \( s + upright(i) eta' \) - m_n \( s + upright(i) eta \) \| & lt.eq
     frac(eta - eta', eta') Im m_n \( s + upright(i) eta \)\
 & lt.eq Im m_n \( s + upright(i) eta \) . $ <eq:lim-halving-bound>]
  Indeed $\| x - s - upright(i) eta' \| gt.eq \( eta' \/ eta \) \| x - s - upright(i) eta \|$ term by term.
    Choose a fixed trace range containing the initial value and every possible next-step value in (4.12) when the
    preceding value is within $1$ of $m_(*)$. Enlarge it once more for the switched trace using (4.7).
    Finally take the terminal height $y$ sufficiently large that (4.11) returns a value within $1$ of $m_(*)$.
    Induction down the heights proves the required trace bounds and the endpoint estimates at every step.
  Combining the two concentration failure bounds, and decreasing the final exponent from $c_2$ to a smaller $xi >
    0$, absorbs the fixed constants into the threshold $y^(- xi)$. This proves (4.2).
    All constants are independent of $s$: the only additional restriction was that $S$ eventually exceed a fixed
    multiple of $\| s \| + y + 1$, which holds before the limit for every fixed $s \, y$. ◻
]

=== 4.2 The limiting marked process <the-limiting-marked-process>

We now take subsequential limits in $n$. The probability estimates above will be used again only after this limit
  has been taken. For a locally finite point measure $nu = sum_j delta_(x_j)$,
  a principal value below always means the symmetric position truncation $lim_(R arrow.r oo) sum_(\| x_j \| lt.eq R)$.

#thm([Proposition 4.2.])[
  (Microscopic limits).  #emph[From every sequence of admissible sizes tending to infinity one can extract a
    subsequence along which
$ #scale(x: 120%, y: 120%)[\(] nu_n \, m_n \, \( M_(n \, k) \)_(k gt.eq 1) #scale(x: 120%, y: 120%)[\)] med
  arrow.r.double med #scale(x: 120%, y: 120%)[\(] nu \, m \, \( M_k \)_(k gt.eq 1) #scale(x: 120%, y: 120%)[\)] $

 jointly, in the local vague topology for the point measures and the compact-open topology on the upper half-plane
   for the analytic functions. The limiting point measure $nu = sum_j delta_(x_j)$ is locally finite,
   with multiplicities permitted. There are deterministic $xi \, chi > 0$, depending only on $d \, E$,
   such that the following properties hold.]
  #emph[For every fixed $0 < delta < 1$, almost surely for all sufficiently large $R$,
#[#set math.equation(numbering: n => "(4.13)")
 $ m \( e + upright(i) u \) = m_(*) + O \( u^(- xi) \) \, wide \| e \| lt.eq R \, quad R^delta lt.eq u lt.eq
   R^2 \, $ <eq:mesoscopic-limit>]

 and, almost surely,
#[#set math.equation(numbering: n => "(4.14)")
 $ nu \( \[ v \, w \] \) = rho \( w - v \) + O \( R^(1 - chi) \) \, wide - R lt.eq v lt.eq w lt.eq R \, quad
   R arrow.r oo . $ <eq:discrepancy>]

 The constants and starting values of $R$ in these almost sure statements may depend on the sample and on $delta$,
   but the exponents are deterministic.]
  #emph[On a possible extension of the probability space, for every fixed $k$ there are standard Gaussian vectors
    $g_j in bb(R)^(2 k)$, independent over $j$ conditionally on $nu$, such that
#[#set math.equation(numbering: n => "(4.15)")
 $ m \( z \) & = m_(upright(r)) + "PV" sum_j frac(1, x_j - z) \,\
M_k \( z \) & = K_k \( m_(upright(r)) \) + "PV" sum_j frac(C_k^(1 \/ 2) g_j g_j^(sans(T)) C_k^(1 \/ 2), x_j - z) .
  $ <eq:marked-representation>]

 These representations are consistent as $k$ increases by retaining the first $k$ edge channels.
   A separate Gaussian mark is assigned to each occurrence of a repeated point.
   The principal values converge locally uniformly on the upper half-plane,
   and $Im M_k \( z \)$ is positive definite there, almost surely simultaneously for every finite $k$ and every
   $z$ with $Im z > 0$.]
] <prop:microscopic-limit>

#proof[
  ===== 4.2.1 Tightness. <tightness.>
  For fixed $L \, y > 0$, positivity gives
  $ nu_n \( \[ - L \, L \] \) lt.eq frac(L^2 + y^2, y) Im m_n \( upright(i) y \) . $
  Proposition 12, with $y$ a sufficiently large fixed number, therefore proves tightness of the local counts.
    It also proves compact-open tightness of the analytic functions.
    The choice of $y$ is made separately for each probability tolerance:
    choose it so that the bound $C_(k \, D) y^(- D)$ is below that tolerance, and then take $n$ large.
    A single height is not required to handle all tolerances. Finitely many initial sizes do not affect tightness.
    Here is a direct way to see the needed compact bounds. For a scalar resolvent sum $f$ with nonnegative
    residues, and a compact set $cal(K)$ in the upper half-plane,
  $ Im f \( z \) lt.eq C_(cal(K) \, y) Im f \( upright(i) y \) \, wide \| f \( z \) -
    f \( upright(i) y \) \| lt.eq C_(cal(K) \, y) Im f \( upright(i) y \) \, wide z in cal(K) . $
  Both inequalities follow by comparing the corresponding kernels on the real line.
    Apply them to $m_n$, and to the real quadratic forms of $M_(n \, k)$;
    polarization controls the matrix entries. Thus bounded values at $upright(i)
    y$ give uniform bounds on each fixed compact, and Cauchy’s estimates give equicontinuity on smaller compacts.
  We may consequently extract the asserted joint limit by tightness,
    first on growing compact sets and finitely many channel dimensions, and then diagonally.
    Local vague limits with locally bounded counts are point measures with integer multiplicities.
    Limits of the analytic functions have nonnegative imaginary parts in the same scalar or matrix sense.
  ===== 4.2.2 Conditional Gaussian marks on compact intervals. <conditional-gaussian-marks-on-compact-intervals.>
  Choose nested compact position intervals exhausting $bb(R)$, with boundaries almost surely uncharged by $nu$.
    Such deterministic boundaries can be chosen because the set of points with positive probability of carrying an
    atom is countable. On each interval, truncate its point count at a fixed integer.
    Order the prelimit indices using graph data alone, resolving ties by the chosen eigenbasis ordering.
    The positions and the corresponding marks are tight: their number is bounded,
    and the conditional second-moment estimates of Proposition 6 control the marks.
    Extract these marked lists together with the preceding limit.
  For completeness, fixed-order moment matching suffices here even though the selected indices depend on the
    graph. For any fixed number of indices, the approximation is uniform over their choices.
    By a diagonal selection of the graph exceptional events, one may require that an increasing finite collection
    of moment orders match with errors tending to zero, on events of probability tending to one.
    More explicitly, for each fixed list length and $k$, choose integers $J_n arrow.r
    oo$ sufficiently slowly that all orders at most $J_n$ have errors at most $J_n^(- 1)$ on a common graph event
    of probability at least $1 - J_n^(- 1)$. This uses only finitely many fixed-order assertions at each stage,
    not a uniform growing-order estimate. If the conditional mark laws failed to approach their product Gaussian
    law in a metric for weak convergence, one could select a deterministic sequence of graphs and index lists with
    this failure while every fixed moment converged. Tightness and moment determinacy of the Gaussian law
    contradict that selection. Thus conditional weak convergence is uniform over these bounded lists.
  Bounded Lipschitz tests, first with the list length truncated,
    now show that the same joint limit is obtained by assigning independent Gaussian marks to the prelimit
    positions independently of the graph. Letting the truncation increase identifies the conditional marking law
    given the full unmarked process $nu$. The covariance in $2 k$ endpoint coordinates is $C_k$.
    At a repeated limiting position the list can be retained on an extension of the probability space,
    with a separate independent mark for each multiplicity; its summed outer product does not require an intrinsic
    ordering of the tied points. Diagonal extraction in the intervals and in $k$ gives consistent marks
  #[#set math.equation(numbering: n => "(4.16)")
   $ b_j = C_k^(1 \/ 2) g_j $ <eq:lim-gaussian-marks>]
  for all finite channel dimensions.
  ===== 4.2.3 Removing imaginary tails. <removing-imaginary-tails.>
  The convergence of compact marked sums alone does not yet identify the full resolvents.
    For fixed $z$ in the upper half-plane and large $L$, the scalar kernels satisfy, when $\| x \| > L$,
  #[#set math.equation(numbering: n => "(4.17)")
   $ Im frac(1, x - z) + lr(|frac(1, x - z) - frac(1, x - upright(i))|) lt.eq C_z /
     L Im frac(1, x - upright(i) L) . $ <eq:lim-tail-domination>]
  The constants can be uniform for $z$ in a fixed compact set.
    For matrix sums use positivity of the residues and bound the norm by the trace of the corresponding positive
    imaginary part. Proposition 12 shows that these traces at $upright(i) L$ are tight as $L$ tends to infinity,
    after taking the upper limit in $n$. The prefactor $L^(- 1)$ in (4.17) therefore removes the tails in
    probability. Compact marked sums already converge, so
  #[#set math.equation(numbering: n => "(4.18)")
   $ Im m \( z \) & = sum_j Im frac(1, x_j - z) \,\
m \( z \) - m \( upright(i) \) & = sum_j (frac(1, x_j - z) - frac(1, x_j - upright(i))) \,\
Im M_k \( z \) & = sum_j b_j b_j^(sans(T)) Im frac(1, x_j - z) \,\
M_k \( z \) - M_k \( upright(i) \) & = sum_j b_j b_j^(sans(T)) (frac(1, x_j - z) - frac(1, x_j - upright(i))) .
  $ <eq:lim-difference-identities>]
  One may establish these identities first at countably many arguments and then use positivity and continuity.
    The imaginary sums and the sums of absolute values of the difference kernels are finite.
    In particular no imaginary spectral mass, including a linear Herglotz term, is lost at infinity.
    Real additive constants are not excluded by this argument and will be identified below.
  ===== 4.2.4 Uniform bounds after the microscopic limit. <uniform-bounds-after-the-microscopic-limit.>
  At every fixed $s + upright(i) y$, Proposition 12 passes to the limit by the portmanteau inequality for the open
    event where its error exceeds the stated threshold. Its constants remain independent of the fixed real part
    $s$. Decrease $xi$ if necessary so that $xi < 1$.
  Fix $0 < delta < 1$. In a padded region
  $ \| e \| lt.eq 2 R \, wide 1 / 2 R^delta lt.eq u lt.eq 2 R^2 $
  take a unit grid. There are $O \( R^3 \)$ grid points. For each fixed dyadic $R$,
    this is a finite collection of arguments in the exact limiting law.
    The failure probability from (4.2) is at most $C R^(3 - delta D)$.
    Choose $D$ sufficiently large and apply Borel–Cantelli over dyadic $R$. The kernel identities in (4.18) give
  $ \| m' \( z \) \| lt.eq frac(Im m \( z \), Im z) . $
  Imaginary parts at arguments within bounded distance and comparable height are comparable by their positive
    kernels. The error in filling the unit grid is consequently $O \( 1 \/ u \)$.
    Padding allows all sufficiently large $R$, not just dyadic values. This proves (4.13).
    The limit in $n$ preceded the growing grid argument; no finite-$n$ uniform estimate on expanding real windows
    has been used. A countable set of $delta$’s implies all the stated fixed-$delta$ conclusions,
    by slightly decreasing $delta$ when necessary.
  ===== 4.2.5 From the Poisson transform to counts. <from-the-poisson-transform-to-counts.>
  Equation (4.13) first gives $nu \( \[ - R \, R \] \) = O \( R \)$, by evaluating $Im m \( upright(i) R \)$.
    For $- R lt.eq v lt.eq w lt.eq R$, integrate $pi^(- 1) Im m \( e + upright(i) sqrt(R) \)$ over $e
    in \[ v \, w \]$. The result is
  $ rho \( w - v \) + O \( R^(1 - xi \/ 2) \) . $
  To compare it with the sharp count, put
  $ P_(v \, w) \( x \) = 1 / pi integral_v^w frac(sqrt(R), \( x - e \)^2 + R) thin upright(d) e . $
  The number of points within distance $R^(3 \/ 4)$ of either endpoint is $O \( R^(3 \/ 4) \)$:
    use (4.13) at that endpoint and height $R^(3 \/ 4)$. For points of $\[ - 2 R \, 2 R \]$ outside these two strips,
  $ \| P_(v \, w) \( x \) - bold(1)_(\[ v \, w \]) \( x \) \| = O \( R^(- 1 \/ 4) \) . $
  Their total error is $O \( R^(3 \/ 4) \)$, since the number of points is $O \( R \)$.
    Finally, for $\| x \| > 2 R$, $P_(v \, w) \( x \) lt.eq C R^(3 \/ 2) \/ x^2$;
    the linear count bound and dyadic summation make this contribution $O \( sqrt(R) \)$.
    These estimates are uniform in $v \, w$, and prove (4.14) for any sufficiently small deterministic
  $ 0 < chi < min \( 1 \/ 4 \, xi \/ 2 \) . $
  The estimates also show that endpoint conventions have no effect on the stated error bound.
  At this point the limiting positions have a deterministic density with a power-saving count error,
    and all finite spectral residues have been identified. It remains to determine the real constants that the
    compact convergence did not see.
  ===== 4.2.6 Scalar principal values and their constant. <scalar-principal-values-and-their-constant.>
  Partial summation in (4.14) gives, almost surely,
  #[#set math.equation(numbering: n => "(4.19)")
   $ "PV" sum_(\| x_j \| > R) 1 / x_j = O \( R^(- chi) \) \, wide sum_(\| x_j \| > R) 1 / x_j^2 =
     O \( R^(- 1) \) . $ <eq:lim-position-tails>]
  Only large $R$ is involved, so possible points at zero do not enter these expressions.
    To see the first assertion, apply the count discrepancy separately on the positive and negative half-lines;
    their leading density terms cancel in the symmetric sum, and integration of $O \( t^(1 - chi) \) \/
    t^2$ leaves $O \( R^(- chi) \)$. The second assertion follows directly from the linear count bound.
  Thus
  $ S_nu \( z \) = "PV" sum_j frac(1, x_j - z) $
  exists locally uniformly and is analytic. Comparison with the constant-density measure gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ S_nu \( upright(i) R \) = upright(i) pi rho + o \( 1 \) . $ <eq:lim-pv-large-height>]
  Indeed, on each half-line the counting error is $O \( 1 + \| v \|^(1 - chi) \)$.
    Partial summation bounds its contribution by a constant times
  $ integral_0^oo frac(1 + v^(1 - chi), v^2 + R^2) thin upright(d) v = o \( 1 \) \, $
  whereas the symmetric transform of constant density is $upright(i) pi rho$.
    By (4.18), $m - S_nu$ is a constant function, and its imaginary part is zero.
    Equations (4.13) and (4.20) identify that real constant as $m_(upright(r))$.
  ===== 4.2.7 Marked principal values and their constant. <marked-principal-values-and-their-constant.>
  Fix $k$ and condition on $nu$. Set
  $ Z_j = b_j b_j^(sans(T)) - C_k . $
  These matrices are independent and centered, with bounded second moments depending only on $k \, d \, E$.
    The series $sum_j Z_j \/ \( x_j - upright(i) \)$, ordered by increasing $\| x_j \|$,
    converges almost surely entrywise by square summability and independence. Also, conditionally almost surely,
  $ sum_(\| x_j \| > 1) frac(parallel Z_j parallel, x_j^2) < oo \, $
  because its conditional expectation is finite by (4.19). Consequently the corresponding difference series
    between $z$ and $upright(i)$ converges absolutely and locally uniformly.
    Together with the scalar principal value this proves local uniform convergence of
  $ S_(k \, nu) \( z \) = "PV" sum_j frac(b_j b_j^(sans(T)), x_j - z) . $
  The linear count bound also gives
  $ sum_j \| x_j - upright(i) R \|^(- 2) = O \( R^(- 1) \) . $
  Thus every entry of the centered marked series at $upright(i)
    R$ has conditional second moment $O \( R^(- 1) \)$, with a sample-dependent constant. It follows that
  $ S_(k \, nu) \( upright(i) R \) arrow.r upright(i) pi rho thin C_k quad upright("in probability") . $
  The limiting version of Proposition 12 gives $M_k \( upright(i) R \) arrow.r K_k \( m_(*) \)$ in probability.
    On the other hand (4.18) shows that $M_k - S_(k \, nu)$ is almost surely constant in $z$.
    That constant must therefore equal
  $ K_k \( m_(*) \) - upright(i) pi rho thin C_k = K_k \( m_(upright(r)) \) $
  almost surely. This proves both identities in (4.15).
  Finally, (4.14) supplies infinitely many points, and $C_k$ is positive definite.
    Any $2 k$ independently Gaussian marks span $bb(R)^(2 k)$ almost surely.
    Their positive contributions to the imaginary-part sum in (4.18) make $Im
    M_k \( z \)$ positive definite for every $z$ in the upper half-plane on the same event.
    Countability of the channel dimensions completes the simultaneous assertion. ◻
]

== 5 Continuous switches and Gaussian insertion <sec:switching>

We work with a microscopic subsequential law supplied by Proposition 13.
  Its endpoint marks are Gaussian, whereas genuine graph switches preserve its law.
  Reversible switches underlie the random-regular-graph comparison framework of
  #cite(label("BauerschmidtEtAl"), form: "prose") Section 3.
  We combine this finite-graph symmetry with the Gaussian marks to obtain exact orthogonal switching symmetries.
  We then use many small orthogonal switches to represent the same point-process law as a limit of finite matrices
  with added GOE noise.

=== 5.1 From permutations to orthogonal switches <from-permutations-to-orthogonal-switches>

Fix $k gt.eq 2$, and write $M = M_k$. For $O in O \( k \)$, define the real matrices

#[#set math.equation(numbering: n => "(5.1)")
 $ D_O = mat(delim: "(", I_k, 0; 0, O) \, wide B_O = D_O J_k D_O^top - J_k . $ <eq:sw-definitions>]

In particular, $B_O$ is symmetric. For an analytic symmetric matrix function $M$ with positive definite imaginary
  part, put

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(T)_O \( m \, M \) =
   (m - partial_z log det \( I_(2 k) + B_O M \) \, med D_O^top \( M^(- 1) + B_O \)^(- 1) D_O) .
   $ <eq:sw-transformation>]

Only the logarithmic derivative is used, so no choice of logarithm is needed. These expressions are well defined:
  $M$ is invertible and

$ Im \( M^(- 1) \) = - M^(- *) \( Im M \) M^(- 1) < 0 . $

Thus $M^(- 1) + B_O$ is invertible, and its inverse again has positive definite imaginary part.

#thm([Proposition 5.1.])[
  (Continuous switching symmetry).  #emph[For every fixed $k gt.eq 2$ and every $O in O \( k \)$,
    the joint analytic-function law of $\( m \, M_k \)$ is invariant under $cal(T)_O$.]
] <prop:continuous-switching>

#proof[
  First suppose that $O$ is a permutation matrix. In a finite graph, let $W =
    W_(n \, k)$ contain the starting endpoint columns followed by the ending endpoint columns of the $k$ sampled
    oriented edges. Except with probability $O_k \( n^(- 1) \)$,
    all endpoints are distinct and their induced subgraph is exactly the marked matching. On this event,
  $ A mapsto A + W B_O W^top \, wide W mapsto W D_O $
  permutes the pairing between the two endpoint lists. The resulting graph is simple and $d$-regular.
    Its marked list has the same restriction, and the inverse permutation recovers the input.
    Every graph with its ordered list has the same joint weight, so this bijection preserves the restricted law.
  Write $R \( z \) = \( A - E - z \/ n \)^(- 1)$. The determinant and inverse identities for finite-rank
    perturbations give
  $ hat(m)_n \( z \) & = m_n \( z \) - partial_z log det \( I_(2 k) + B_O M_(n \, k) \( z \) \) \,\
hat(M)_(n \, k) \( z \) & = D_O^top \( M_(n \, k) \( z \)^(- 1) + B_O \)^(- 1) D_O . $
  Indeed $m_n = n^(- 1) "Tr" R$, and differentiation in $z$ supplies exactly this factor $n^(- 1)$.
    The formulas also follow without requiring invertibility of the prelimit compression by using
    $\( I + M_(n \, k) B_O \)^(- 1) M_(n \, k)$. In the limit,
    the positive definite imaginary part already established makes the inverse formula regular.
    Compact-open convergence of analytic functions also gives convergence of their derivatives.
    We may therefore pass to the limit, proving the proposition for permutation matrices.
  Next let $U in O \( k \)$, and set $Q_U = "diag" \( U \, U \)$.
    The matrices $C_k$ and $K_k \( m_(upright(r)) \)$ commute with $Q_U$.
    The Gaussian representation (4.15) consequently shows that
  $ cal(R)_U \( m \, M \) = \( m \, Q_U^top M Q_U \) $
  preserves the joint law. This assertion follows even conditionally on $nu$,
    but we will need switching invariance only unconditionally.
    Since $Q_U D_O Q_U^top = D_(U O U^top)$ and $Q_U B_O Q_U^top = B_(U O U^top)$,
    the inverse and determinant formulas give
  $ cal(R)_U^(- 1) compose cal(T)_O compose cal(R)_U = cal(T)_(U O U^top) . $
  Thus the law is invariant under every orthogonal conjugate of a permutation switch.
  Finally, the switching maps form an action: applying $cal(T)_O$ and then $cal(T)_(O')$ gives $cal(T)_(O O')$.
    To check this directly, observe that
  #[#set math.equation(numbering: n => "(5.3)")
   $ B_(O O') = B_O + D_O B_(O') D_O^top \, wide D_(O O') = D_O D_(O') . $ <eq:sw-composition>]
  Successive inverse updates therefore give the asserted second component.
    The determinant ratios for the two updates multiply, which gives the first component after logarithmic
    differentiation. A transposition is a hyperplane reflection.
    Its orthogonal conjugates are all hyperplane reflections, and their finite products generate $O \( k \)$.
    The proposition follows. ◻
]

=== 5.2 The finite Gaussian model <the-finite-gaussian-model>

Fix a discrepancy exponent $0 < chi < 1 \/ 4$ from (4.14).
  We use $r$ planar rotations, each through a small angle $theta$, with aggregate variance of order $T =
  r theta^2$. The position cutoff $K$ specifies the finite block that will receive GOE noise.
  A much larger temporary cutoff $L$ first turns the principal-value resolvent into a finite matrix.
  We let $T$ grow slowly relative to $K$, and $K$ slowly relative to $r$,
  so that deleting the outer positions and replacing the individual summands both have vanishing errors.
  Choose once and for all

#[#set math.equation(numbering: n => "(5.4)")
 $ 0 < tau < chi / 100000 \, wide k = 2 r \, quad K = r^(1 \/ 100) \, quad T = r^tau \, quad theta =
   sqrt(T \/ r) \, quad L = r^(100 \/ chi) \, wide r in bb(N) . $ <eq:sw-parameters>]

For each $r$, take $O = O_r$ to be the direct sum of $r$ planar rotations of angle $theta$.
  Write $B = B_(O_r)$ and $M^0 = K_k \( m_(upright(r)) \)$.
  The coefficient below absorbs the constant $M^0$ in the marked resolvent when the first-cut argument converts
  the update into an additive perturbation. For all sufficiently large $r$, the real symmetric matrix

#[#set math.equation(numbering: n => "(5.5)")
 $ Gamma_r = C_k^(1 \/ 2) \( B^(- 1) + M^0 \)^(- 1) C_k^(1 \/ 2) $ <eq:sw-coefficient>]

is well defined. In fact the singular values of $B$ are all $2 \| sin \( theta \/ 2 \) \|$,
  and $parallel M^0 parallel$ is bounded independently of $r$.
  Let $beta$ be a diagonal matrix of eigenvalues of $Gamma_r$, and define

#[#set math.equation(numbering: n => "(5.6)")
 $ s_1 = "Tr" beta \, wide s_2 = "Tr" beta^2 . $ <eq:sw-moments>]

These quantities are deterministic.

Index the limiting positions with multiplicity, and put

$ I = { j : \| x_j \| lt.eq K } \, wide q_(*) = \| I \| \, wide D_I = "diag" \( x_j : j in I \) . $

Conditional on $nu$, let $cal(W)$ be a raw GOE matrix of size $q_(*)$:
  its off-diagonal entries have variance $1$, and its diagonal entries have variance $2$.
  It is independent of $nu$, apart from its dimension. Define

#[#set math.equation(numbering: n => "(5.7)")
 $ H_r = D_I + s_1 I_(q_(*)) + sqrt(s_2) thin cal(W) . $ <eq:sw-inserted-matrix>]

An empty $I$ gives an empty matrix and zero trace; almost surely this case does not occur for large $r$, by (4.14).

#thm([Proposition 5.2.])[
  (Gaussian insertion).  #emph[The coefficients in (5.6) satisfy
#[#set math.equation(numbering: n => "(5.8)")
 $ parallel beta parallel lt.eq C theta \, wide c T lt.eq s_2 lt.eq C T \, wide \| s_1 \| lt.eq C T \,
   $ <eq:sw-coefficient-bounds>]

 with deterministic positive constants. Moreover, as $r arrow.r oo$,
#[#set math.equation(numbering: n => "(5.9)")
 $ m_(upright(r)) + "Tr" \( H_r - z \)^(- 1) med arrow.r.double med m \( z \) $ <eq:sw-trace-limit>]

 jointly at every finite list of points $z in bb(C)_(+)$, and the unscaled eigenvalue point measure of $H_r$
   converges locally vaguely in law to $nu$. Both convergences are unconditional.]
  #emph[More precisely, generate the Gaussian marks of $M_k$ conditionally on $nu$, separately for each $r$, and write
$ cal(S)_r \( z \) = m \( z \) - partial_z log det \( I_(2 k) + B M_k \( z \) \) . $

 For almost every $nu$, expectations of every bounded smooth function with bounded derivatives of finitely many
   real and imaginary trace values differ by $o \( 1 \)$ when $m_(upright(r)) +
   "Tr" \( H_r - z \)^(- 1)$ is replaced by $cal(S)_r \( z \)$.
   This is a conditional approximation assertion, not conditional switching invariance.]
] <prop:gaussian-insertion>

We prove the approximation in three steps. Cutting the principal-value sums at $L$ converts the switched trace
  into the trace of a finite diagonal matrix perturbed by $4 r$ rank-one terms built from Gaussian vectors.
  We then delete the positions between $K$ and $L$, using the signed principal-value tail cancellation to control
  the Schur complement. Finally, on the retained block of order $K$,
  a summand-by-summand replacement turns the perturbation into a scalar shift plus GOE noise with the same mean
  and entry covariances.

The graph size $n$ has already tended to infinity, and Proposition 14 is exact for every fixed $k$.
  We now let $r$, and hence $k = 2 r$, grow within that limiting law.
  No growing-dimensional version of the prelimit eigenvector moment estimates is needed.
  For the approximation estimates below, condition on any $nu$ in the probability-one event on which (4.13)–(4.15)
  hold. Constants may depend on this conditioning input and on a fixed finite list of spectral parameters.
  Probability notation in the intermediate estimates refers to the Gaussian marks.

=== 5.3 A first cut at a large distance <a-first-cut-at-a-large-distance>

We first convert a switched trace into the trace of a finite random matrix.
  The elementary consequences of (4.14) that we use are

#[#set math.equation(numbering: n => "(5.10)")
 $ nu \( \[ - R \, R \] \) = 2 rho R + O \( R^(1 - chi) \) \, wide lr(|"PV" sum_(\| x_j \| > R) 1 / x_j|) =
   O \( R^(- chi) \) \, wide sum_(\| x_j \| > R) 1 / x_j^2 = O \( R^(- 1) \) . $ <eq:sw-tail-sums>]

The last two follow by partial summation on the positive and negative half-lines,
  retaining their constant-density terms together in the principal-value sum.

Cut the representation of $M = M_k$ at $L$, keeping the constant $M^0$:

$ M_L \( z \) = M^0 + sum_(\| x_j \| lt.eq L) frac(C_k^(1 \/ 2) g_j g_j^top C_k^(1 \/ 2), x_j - z) . $

For fixed $z in bb(C)_(+)$,

#[#set math.equation(numbering: n => "(5.11)")
 $ parallel M - M_L parallel + parallel M' - M'_L parallel = O_(bb(P)) \( r^2 L^(- chi) \) \, wide
   parallel M' parallel = O_(bb(P)) \( r^2 \) . $ <eq:sw-first-tail>]

Here is the dimension dependence in these bounds. The deterministic mean tail is $O \( L^(- chi) \) C_k$ for $M$,
  and $O \( L^(- 1) \) C_k$ for its derivative. Each entry of the centered Gaussian tail has variance
  $O \( L^(- 1) \)$, using (5.10); the derivative has a smaller variance.
  There are $\( 4 r \)^2$ entries, so the Hilbert–Schmidt estimate gives $O_(bb(P)) \( r L^(- 1 \/ 2) \)$.
  This is smaller than the bound displayed in (5.11). For $M'$,
  the absolute scalar weights sum to a finite constant depending on $z \, nu$,
  and the expected sum of the norms of the positive rank-one matrices is $O \( r \)$.
  The stated $O_(bb(P)) \( r^2 \)$ bound is therefore sufficient and conservative.

We also need a lower bound on the imaginary parts in order to use inverse updates stably.
  Keep only the indices $\| x_j \| lt.eq r^4$. Their number is asymptotic to $2 rho r^4$,
  and their scalar weights in $Im M \( z \)$ are at least $c_z r^(- 8)$.
  If $b_j = C_k^(1 \/ 2) g_j$, Gaussian fourth moments give

$ bb(E) ∥frac(1, \| { j : \| x_j \| lt.eq r^4 } \|) sum_(\| x_j \| lt.eq r^4) b_j b_j^top -
  C_k∥_(upright("HS"))^2 = O \( r^(- 2) \) . $

Since the smallest eigenvalue of $C_k$ is bounded below independently of $k$, both $M$ and $M_L$ consequently satisfy

#[#set math.equation(numbering: n => "(5.12)")
 $ Im M \( z \) gt.eq r^(- 5) I_(4 r) \, wide Im M_L \( z \) gt.eq r^(- 5) I_(4 r) $ <eq:sw-imaginary-lower>]

with probability tending to one. We used $L gt.double r^4$ here.
  As $B^(- 1)$ is real symmetric, (5.12) bounds the norms of $\( B^(- 1) + M \)^(- 1)$ and
  $\( B^(- 1) + M_L \)^(- 1)$ by $r^5$.

It follows that cutting both scalar and marked sums in

$ cal(S)_r \( z \) = m \( z \) - "Tr" \( B^(- 1) + M \( z \) \)^(- 1) M' \( z \) $

costs $o_(bb(P)) \( 1 \)$. To make the margin explicit, the marked tail in (5.11) is $O_(bb(P)) \( r^(- 98) \)$.
  The inverse identity bounds the two trace errors by

$ O_(bb(P)) #scale(x: 120%, y: 120%)[\(] r dot.op r^5 dot.op r^(- 98) #scale(x: 120%, y: 120%)[\)] +
  O_(bb(P)) #scale(x: 120%, y: 120%)[\(] r dot.op r^10 dot.op r^(- 98) dot.op r^2 #scale(x: 120%, y: 120%)[\)] =
  O_(bb(P)) \( r^(- 92) + r^(- 85) \) . $

The scalar tail is $O \( L^(- chi) \)$.

Let $D = "diag" \( x_j : \| x_j \| lt.eq L \)$. Diagonalizing the real symmetric coefficient $Gamma_r$,
  and rotating the independent Gaussian row vectors in channel space,
  gives a matrix $cal(G)$ of independent standard real Gaussian entries with $4 r$ columns.
  The finite-rank inverse identity now yields

#[#set math.equation(numbering: n => "(5.13)")
 $ cal(S)_r \( z \) = m_(upright(r)) + "Tr" \( D + A' - z \)^(- 1) + o_(bb(P)) \( 1 \) \, wide A' =
   cal(G) beta cal(G)^top . $ <eq:sw-finite-matrix>]

Indeed $B^(- 1) + M_L$ is the sum of $B^(- 1) + M^0$ and the marked compression of $\( D - z \)^(- 1)$,
  while its derivative is the compression of $\( D - z \)^(- 2)$.
  Woodbury’s formula gives exactly the trace difference in (5.13).

For completeness, the coefficient estimates (5.8) follow directly from this construction. The identity

$ \( B^(- 1) + M^0 \)^(- 1) = \( I + B M^0 \)^(- 1) B = B + O \( theta^2 \) $

holds in operator norm uniformly in $r$. Every singular value of this matrix is comparable to $theta$;
  conjugation by $C_k^(1 \/ 2)$ preserves this comparison. Since the dimension is $4 r$,
  we obtain $parallel beta parallel = O \( theta \)$ and $s_2 asymp r theta^2 = T$. Finally,

$ s_1 = "Tr" \( C_k B \) + O \( r theta^2 \) \, wide "Tr" \( C_k B \) = 2 p thin "Tr" \( O - I_k \) =
  O \( r theta^2 \) . $

This proves all three bounds, including the cancellation needed for the mean $s_1$.

=== 5.4 Removing the outer positions <removing-the-outer-positions>

The finite matrix in (5.13) still has order $L$. We next show that its outer positions can be deleted at the level
  of resolvent traces. This is necessary before making a Gaussian replacement:
  the available small-summand estimate will be applied only to the much smaller block of order $K$.

Let $F = { j : K < \| x_j \| lt.eq L }$, so that the indices of $D$ split into $I \, F$. Put

#[#set math.equation(numbering: n => "(5.14)")
 $ h = T^2 \, wide U_I = \( \| D_I \| + h \)^(- 1 \/ 2) \, wide U_F = \| D_F \|^(- 1 \/ 2) . $ <eq:sw-weights>]

Partial summation using (5.10) gives

#[#set math.equation(numbering: n => "(5.15)")
 $ "Tr" U_I^2 + "Tr" U_F^2 = O \( log r \) \, wide parallel U_I^2 parallel lt.eq h^(- 1) \, quad
   parallel U_F^2 parallel lt.eq K^(- 1) . $ <eq:sw-weight-bounds>]

For example, the inner sum is bounded by integrating the linear count bound against $\( \| x \| + h \)^(- 1)$;
  the far sum is treated in the same way between $K$ and $L$. Both endpoints are fixed powers of $r$.
  In the following estimates, $"polylog" \( r \)$ denotes a fixed power of $log r$,
  whose exponent may increase from one occurrence to the next.

#thm([Lemma 5.3.])[
  (Weighted block estimates).  #emph[For $cal(A) = I \, F$, put $a_I = h$, $a_F = K$. With probability tending to one,
#[#set math.equation(numbering: n => "(5.16)")
 $ ∥U_(cal(A)) \( A'_(cal(A) cal(A)) - s_1 I \) U_(cal(A))∥ lt.eq
   "polylog" \( r \) (sqrt(T \/ a_(cal(A))) + theta) . $ <eq:sw-bernstein>]

 Moreover, for $P_0 = U_I A'_(I F) U_F$,
#[#set math.equation(numbering: n => "(5.17)")
 $ parallel P_0 parallel_(upright("HS"))^2 lt.eq T "polylog" \( r \) $ <eq:sw-cross-block>]

 with probability tending to one.]
] <sw:weighted-blocks>

#proof[
  The centered matrix in (5.16) is a sum of independent self-adjoint matrices
  $ sum_(alpha = 1)^(4 r) beta_(alpha alpha) \( v_alpha v_alpha^top - P \) \, wide P = U_(cal(A))^2 \, $
  where $v_alpha$ is Gaussian of covariance $P$. Its coefficients may have either sign. Gaussian fourth moments give
  #[#set math.equation(numbering: n => "(5.18)")
   $ bb(E) \[ \( v_alpha v_alpha^top \)^2 \] = \( "Tr" P \) P + 2 P^2 . $ <eq:sw-fourth-moment>]
  Truncate each original Gaussian column on the event that all its entries have absolute value at most $log r$,
    and center the truncated summand. There are only polynomially many entries,
    so this alters the matrices with superpolynomially small probability.
    Gaussian tails also make the resulting centering correction superpolynomially small.
  Each truncated summand has norm at most
  $ C parallel beta parallel \( log r \)^2 "Tr" P lt.eq theta "polylog" \( r \) . $
  If $X$ is a self-adjoint random matrix, then $bb(E) \[ \( X - bb(E) X \)^2 \] =
    bb(E) \[ X^2 \] - \( bb(E) X \)^2 lt.eq bb(E) \[ X^2 \]$.
    Also truncating $v_alpha v_alpha^top$ by an event can only decrease the expectation of its square in positive
    semidefinite order. Thus (5.18), including for negative $beta_(alpha alpha)$,
    bounds the matrix variance parameter by
  $ C s_2 \( "Tr" P \) parallel P parallel lt.eq T / a_(cal(A)) "polylog" \( r \) . $
  The bounded self-adjoint matrix Bernstein inequality #cite(label("Tropp")) Theorem 1.4 gives,
    for a sum of independent centered self-adjoint matrices of norm at most $b$ and variance parameter
    $sigma_(upright("mat"))^2$, a two-sided tail bounded by
  $ 2 \| cal(A) \| exp (- frac(c t^2, sigma_(upright("mat"))^2 + b t)) . $
  Its dimension factor is polynomial in $r$. Taking a sufficiently large power of $log r$ in $t$ proves (5.16).
  For the cross block, independence of distinct Gaussian rows and direct second-moment calculation give
  $ bb(E) parallel P_0 parallel_(upright("HS"))^2 = s_2 \( "Tr" U_I^2 \) \( "Tr" U_F^2 \) . $
  Equation (5.17) follows from (5.15) and Markov’s inequality, with one additional logarithmic factor. ◻
]

Fix $z in bb(C)_(+)$, and define

$ G_F = \( D_F + A'_(F F) - z \)^(- 1) \, wide G_I = \( D_I + A'_(I I) - z \)^(- 1) . $

The next estimates control the influence of the far block even at the fixed imaginary part $Im z$.

#thm([Lemma 5.4.])[
  (Far block and Schur correction).  #emph[Let
$ delta_F = "polylog" \( r \) (frac(1 + T, K) + sqrt(T / K) + theta) . $

 Then
#[#set math.equation(numbering: n => "(5.19)")
 $ parallel U_F^(- 1) \( G_F - D_F^(- 1) \) U_F^(- 1) parallel lt.eq delta_F = o \( 1 \) $ <eq:sw-far-resolvent>]

 with probability tending to one, and $"Tr" G_F = o_(bb(P)) \( 1 \)$. For $Sigma = A'_(I F) G_F A'_(F I)$,
#[#set math.equation(numbering: n => "(5.20)")
 $ parallel U_I Sigma U_I parallel = o_(bb(P)) \( T^(- 5) \) . $ <eq:sw-schur-small>]

]
] <sw:schur>

#proof[
  Conjugating the matrix to be inverted by $U_F$ gives
  $ U_F \( D_F + A'_(F F) - z \) U_F = "sign" \( D_F \) + U_F \( A'_(F F) - z \) U_F . $
  The second term has norm at most $delta_F$, by Lemma 16, the bound $\| s_1 \| = O \( T \)$, and (5.15).
    Since $delta_F = o \( 1 \)$, a Neumann expansion proves (5.19).
    In particular, $Q_F = U_F^(- 1) G_F U_F^(- 1)$ has bounded norm. By (5.10),
  $ lr(|sum_(j in F) 1 / x_j|) = O \( K^(- chi) \) \, wide \| "Tr" \( G_F - D_F^(- 1) \) \| lt.eq
    delta_F "Tr" U_F^2 = o \( 1 \) . $
  This proves the assertion about the far trace.
  For the Schur correction, replacing $G_F$ by $D_F^(- 1)$ costs at most
  #[#set math.equation(numbering: n => "(5.21)")
   $ parallel P_0 parallel_(upright("HS"))^2 delta_F lt.eq T "polylog" \( r \) delta_F $ <eq:sw-schur-replacement>]
  in the norm weighted on both sides by $U_I$. It remains to estimate $A'_(I F) D_F^(- 1) A'_(F I)$.
    Condition further on the inner Gaussian row block $cal(G)_I$, and set
  $ Q = cal(G)_I beta^2 cal(G)_I^top . $
  The columns of $A'_(I F)$, indexed by $j in F$, are then independent centered Gaussian vectors $a_j$ with
    covariance $Q$. Consequently
  $ bb(E) [sum_(j in F) frac(a_j a_j^top, x_j) thin mid(bar.v) thin cal(G)_I \, nu] & = Q sum_(j in F) 1 / x_j \,\
"Var"
  (sum_(j in F) frac(\( a_j \)_a \( a_j \)_b, x_j) thin mid(bar.v) thin cal(G)_I \, nu) & = \( Q_(a a) Q_(b b) +
  Q_(a b)^2 \) sum_(j in F) 1 / x_j^2 . $
  Also $bb(E) \[ Q_(a a)^2 divides nu \] = s_2^2 + 2 "Tr" beta^4 = O \( T^2 \)$.
    Since $Q$ is positive semidefinite, $\| Q_(a b) \|^2 lt.eq Q_(a a) Q_(b b)$;
    Cauchy–Schwarz bounds the remaining second moments by $O \( T^2 \)$.
    Multiplying entry $a \, b$ by $\( U_I \)_(a a) \( U_I \)_(b b)$, summing its second moment over $a \, b$,
    and using (5.10) and (5.15), we obtain
  $ bb(E) ∥U_I A'_(I F) D_F^(- 1) A'_(F I) U_I∥_(upright("HS"))^2 lt.eq
    C T^2 \( log r \)^2 \( K^(- 2 chi) + K^(- 1) \) . $
  Markov’s inequality therefore bounds this norm by $T "polylog" \( r \) \( K^(- chi) + K^(- 1 \/ 2) \)$ with
    probability tending to one.
  Combining this estimate with (5.21) gives
  $ parallel U_I Sigma U_I parallel lt.eq "polylog" \( r \) thin O
    (T K^(- chi) + T K^(- 1 \/ 2) + frac(T \( 1 + T \), K) + T sqrt(T \/ K) + T theta) $
  with probability tending to one. After multiplication by $T^5$, all terms tend to zero by a fixed power of $r$.
    For example, the three potentially slow terms have exponents
  $ 6 tau - chi / 100 \, wide 13 / 2 tau - 1 / 200 \, wide 13 / 2 tau - 1 / 2 \, $
  respectively. They are negative under (5.4); the terms $T^6 K^(- 1 \/ 2)$ and $T^6 \( 1 + T \) \/
    K$ have still ample margins. This proves (5.20). ◻
]

We now convert the small weighted Schur correction into a small trace error.
  The fixed-height inner resolvent cannot be estimated directly from (5.16);
  instead we first work at the larger height $h = T^2$.

#thm([Lemma 5.5.])[
  (Inner resolvent and trace cut).  #emph[For every fixed $z in bb(C)_(+)$,
#[#set math.equation(numbering: n => "(5.22)")
 $ parallel U_I^(- 1) G_I \( z \) U_I^(- 1) parallel = O_(bb(P)) \( h \) \, $ <eq:sw-inner-resolvent>]

 and
#[#set math.equation(numbering: n => "(5.23)")
 $ "Tr" \( D + A' - z \)^(- 1) = "Tr" \( D_I + A'_(I I) - z \)^(- 1) + o_(bb(P)) \( 1 \) . $ <eq:sw-second-cut>]

 The same estimates hold jointly for a fixed finite list of $z$’s.]
] <sw:trace-cut>

#proof[
  Every diagonal entry of $U_I \( D_I - i h \) U_I$ has modulus at least $1 \/ sqrt(2)$. The added term has norm at most
  $ parallel U_I A'_(I I) U_I parallel lt.eq C T \/ h + "polylog" \( r \) (sqrt(T \/ h) + theta) = o \( 1 \) $
  with probability tending to one. Hence
  $ parallel U_I^(- 1) G_I \( i h \) U_I^(- 1) parallel lt.eq C . $
  The identity $G_I \( i h \)^(*) G_I \( i h \) = h^(- 1) Im G_I \( i h \)$ now gives
  $ parallel G_I \( i h \) U_I^(- 1) parallel + parallel U_I^(- 1) G_I \( i h \) parallel lt.eq C h^(- 1 \/ 2) . $
  Alternatively the same mixed-weight estimates follow from the preceding weighted inverse and $parallel U_I
    parallel lt.eq h^(- 1 \/ 2)$. Use the exact twice-iterated resolvent identity
  $ G_I \( z \) =  & G_I \( i h \) + \( z - i h \) G_I \( i h \)^2\
 & + \( z - i h \)^2 G_I \( i h \) G_I \( z \) G_I \( i h \) . $
  The unweighted middle resolvent in the last term has norm at most $\( Im z \)^(- 1)$.
    Conjugating the identity by $U_I^(- 1)$, the three terms are bounded by
  $ C \, wide C \| z - i h \| \/ h \, wide C \| z - i h \|^2 \/ \( h Im z \) \, $
  respectively. This proves (5.22).
  The Schur complement formula for the full inverse has upper-left block
    $tilde(G)_I = \( G_I^(- 1) - Sigma \)^(- 1)$. Set $R_I = U_I^(- 1) G_I U_I^(- 1)$ and $S_I = U_I Sigma U_I$. Then
  $ U_I^(- 1) tilde(G)_I U_I^(- 1) = \( R_I^(- 1) - S_I \)^(- 1) . $
  By (5.22) and (5.20), a Neumann expansion gives
  $ parallel U_I^(- 1) tilde(G)_I U_I^(- 1) parallel = O_(bb(P)) \( h \) \, wide
    parallel U_I^(- 1) \( tilde(G)_I - G_I \) U_I^(- 1) parallel lt.eq
    O_(bb(P)) \( h^2 \) o_(bb(P)) \( T^(- 5) \) = o_(bb(P)) \( T^(- 1) \) . $
  Multiplying the last bound by $"Tr" U_I^2 = O \( log r \)$ shows that their traces differ by $o_(bb(P)) \( 1 \)$.
  The full block-inverse trace is
  $ "Tr" tilde(G)_I + "Tr" G_F + "Tr" #scale(x: 120%, y: 120%)[\(] tilde(G)_I A'_(I F) G_F^2 A'_(F I)
    #scale(x: 120%, y: 120%)[\)] . $
  The far trace is $o_(bb(P)) \( 1 \)$ by Lemma 17. For the last term recall $Q_F = U_F^(- 1) G_F U_F^(- 1)$.
    It has bounded norm, and
  $ U_F^(- 1) G_F^2 U_F^(- 1) = Q_F U_F^2 Q_F \, wide parallel Q_F U_F^2 Q_F parallel = O_(bb(P)) \( K^(- 1) \) . $
  No positivity is asserted for this complex square. The ordinary operator-norm and Hilbert–Schmidt trace
    inequality instead gives
  $
    lr(|"Tr" #scale(x: 120%, y: 120%)[\(] tilde(G)_I A'_(I F) G_F^2 A'_(F I) #scale(x: 120%, y: 120%)[\)]|) &
    lt.eq parallel U_I^(- 1) tilde(G)_I U_I^(- 1) parallel thin parallel P_0 parallel_(upright("HS"))^2 thin
    parallel Q_F U_F^2 Q_F parallel\
 & lt.eq "polylog" \( r \) thin O_(bb(P)) \( T^3 \/ K \) = o_(bb(P)) \( 1 \) . $
  This proves (5.23). All estimates used the same Gaussian matrices,
    so taking a finite union gives the joint assertion. ◻
]

=== 5.5 Gaussian replacement and convergence of point measures <gaussian-replacement-and-convergence-of-point-measures>

We have reduced the switched trace to an inner matrix of size

$ q_(*) = 2 rho K + O \( K^(1 - chi) \) asymp K . $

Its perturbation is a sum of $4 r$ independent small rank-one matrices.
  Only at this reduced size do we replace that sum by GOE noise.
  We use the one-summand replacement and Taylor-expansion method of the Lindeberg principle;
  see #cite(label("ChatterjeeLindeberg"), form: "prose") for a general formulation.
  The matrix estimate needed here is proved below.

#thm([Lemma 5.6.])[
  (Gaussian replacement).  #emph[Conditional on almost every $nu$,
    bounded smooth tests with bounded derivatives of finitely many trace values have expectation difference
    $o \( 1 \)$ between
$ D_I + A'_(I I) quad upright("and") quad H_r = D_I + s_1 I_(q_(*)) + sqrt(s_2) thin cal(W) . $

]
] <sw:lindeberg>

#proof[
  Write
  $ A'_(I I) - s_1 I_(q_(*)) = sum_(alpha = 1)^(4 r) beta_(alpha alpha) \( g_alpha g_alpha^top - I_(q_(*)) \) \, $
  where the $g_alpha$ are independent standard $q_(*)$-dimensional Gaussian vectors. The covariance identity
  $ "Cov" \( g_a g_b \, g_c g_d \) = delta_(a c) delta_(b d) + delta_(a d) delta_(b c) $
  shows that $g g^top - I$ and a raw GOE matrix have the same entry covariances. Their means are both zero.
    Thus replace the summands one at a time by $beta_(alpha alpha) cal(W)_alpha$,
    with independent raw GOE matrices $cal(W)_alpha$. Negative coefficients are allowed:
    both covariances are multiplied by $beta_(alpha alpha)^2$.
  For either kind of summand $X$,
  $ bb(E) parallel X parallel^3 lt.eq C theta^3 q_(*)^3 . $
  For the rank-one term this follows from Gaussian moments of $parallel g parallel^2$;
    for the GOE term the Hilbert–Schmidt norm gives a sufficient bound.
    Fix spectral parameters $z_1 \, dots.h \, z_b in bb(C)_(+)$,
    and a bounded smooth test $Phi$ on the corresponding real and imaginary trace coordinates,
    with bounded derivatives. For any real symmetric matrix $A$,
    its resolvents satisfy $parallel \( A - z_ell \)^(- 1) parallel lt.eq \( Im z_ell \)^(- 1)$.
    Differentiating the resolvent in a real symmetric direction $Delta$ gives, for $j = 1 \, 2 \, 3$,
    a trace derivative bounded by $C_(z \, j) q_(*) parallel Delta parallel^j$.
    The chain rule therefore bounds the third directional derivative of the composed test by
  $ C_(z \, Phi) q_(*)^3 parallel Delta parallel^3 . $
  This estimate holds at every intermediate real symmetric matrix, independently of eigenvalue gaps.
  Taylor expansion to second order cancels the means and covariances in each replacement.
    Summing the third-order remainders gives total error
  $ C_(z \, Phi) q_(*)^6 r theta^3 = O #scale(x: 120%, y: 120%)[\(] r^(- 0.44 + \( 3 \/ 2 \) tau)
    #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Finally $sum_alpha beta_(alpha alpha) cal(W)_alpha$ has exactly the law $sqrt(s_2) thin cal(W)$, proving the lemma. ◻
]

#proof[
  #emph[Completion of Proposition 15.] The coefficient bounds were proved after (5.13).
    That equation, Lemma 18, and Lemma 19 prove the conditional comparison with $cal(S)_r$ in the proposition.
    Each comparison concerns bounded tests, so its conditional error can be averaged by bounded convergence.
    By Proposition 14, the unconditional law of $cal(S)_r$ is the law of $m$ for every $r$.
    This proves (5.9); bounded smooth tests suffice to determine finite-dimensional weak convergence.
  We finish by explaining why these trace limits imply convergence of point measures,
    without assuming a uniform bound on their total number of points.
    Let $nu^(\( r \))$ be the eigenvalue counting measure of $H_r$, and define
  $ sigma_r \( thin upright(d) x \) = frac(nu^(\( r \)) \( thin upright(d) x \), 1 + x^2) . $
  Its total mass is $Im "Tr" \( H_r - i \)^(- 1)$, whose laws are tight by (5.9).
    Regarding $sigma_r$ as a finite positive measure on the one-point compactification $overline(bb(R)) =
    bb(R) union { oo }$, its laws are therefore tight. For $z = e + i eta in bb(C)_(+)$, the kernel
  $ k_z \( x \) = \( 1 + x^2 \) frac(eta, \( x - e \)^2 + eta^2) $
  extends continuously to $overline(bb(R))$, with $k_z \( oo \) = eta$.
    Its integral against $sigma_r$ is $Im "Tr" \( H_r - z \)^(- 1)$.
    It follows that in any subsequential limit $sigma$, the joint law of these integrals at a countable dense set
    of $z$’s is that of $Im m \( z \)$. Continuity extends this conclusion to all $z$.
  These integrals determine the de-weighted restriction of $sigma$ to $bb(R)$.
    Indeed, for $f in C_c \( bb(R) \)$, integrate the kernel against $pi^(- 1) f \( e \) thin upright(d)
    e$ and let $eta arrow.b 0$. On $bb(R)$ the resulting kernel tends to $\( 1 + x^2 \) f \( x \)$,
    by the Poisson approximate identity. The integrated kernels are bounded uniformly over $x in
    overline(bb(R))$ and $0 < eta lt.eq 1$: near the compact support this is the Poisson mass bound,
    and away from it the factor $1 + x^2$ cancels the quadratic denominator.
    At infinity their value is $eta pi^(- 1) integral f \( e \) thin upright(d) e$, which tends to zero.
    Dominated convergence is thus applicable to each finite measure $sigma$, including any mass at infinity.
  By (4.15), applying the same inversion to $Im m \( z \)$ gives $integral f thin thin upright(d) nu$.
    Taking a countable determining family of compactly supported tests,
    the joint distribution of these integrals is therefore exactly the law of $nu$.
    The map from $sigma$ to its de-weighted restriction is continuous for local vague convergence:
    for a compactly supported $f$, the function $\( 1 + x^2 \) f \( x \)$, extended by zero at infinity,
    is continuous on $overline(bb(R))$. Every subsequential local vague limit of $nu^(\( r \))$ consequently has
    the law of $nu$. This proves the point-process assertion. ◻
]

== 6 Identification by finite-matrix Dyson Brownian motion <sec:dbm>

Proposition 15 approximates every microscopic subsequential law by the eigenvalues of a finite diagonal matrix
  plus GOE noise. We now apply fixed-energy universality to these finite matrices. Two details require attention:
  their limiting density must be normalized correctly, and the correlation-function conclusion must be converted
  into the Laplace-functional statement of Theorem 1.

=== 6.1 The fixed-energy input <the-fixed-energy-input>

For a real diagonal matrix $V = "diag" \( v_1 \, dots.h \, v_m \)$, write

$ m_V \( zeta \) = 1 / m sum_(j = 1)^m frac(1, v_j - zeta) . $

For positive parameters $g \, G$, we call $V$ $\( g \, G \)$-regular if, for fixed positive constants $c \, C \, C_V$,

#[#set math.equation(numbering: n => "(6.1)")
 $ c lt.eq Im m_V \( e + i eta \) lt.eq C quad \( \| e \| lt.eq G \, med g lt.eq eta lt.eq 10 \) \, wide
   parallel V parallel lt.eq m^(C_V) . $ <eq:dbm-regularity>]

The parameters may depend on $m$, and satisfy, for a fixed $delta > 0$,

#[#set math.equation(numbering: n => "(6.2)")
 $ m^(delta - 1) lt.eq g lt.eq m^(- delta) \, wide G lt.eq m^(- delta) . $ <eq:dbm-parameter-domain>]

Let $W_m$ be standard normalized GOE, with entry variances $1 \/ m$ off the diagonal and $2 \/ m$ on the diagonal.
  The deterministic free-convolution comparison density associated with $V +
  sqrt(t) thin W_m$ is described by the transform

#[#set math.equation(numbering: n => "(6.3)")
 $ m_(upright("fc") \, t) \( zeta \) = m_V #scale(x: 120%, y: 120%)[\(] zeta +
   t thin m_(upright("fc") \, t) \( zeta \) #scale(x: 120%, y: 120%)[\)] \, wide
   rho_(upright("fc") \, t) \( e \) = 1 / pi lim_(eta arrow.b 0) Im m_(upright("fc") \, t) \( e + i eta \) .
   $ <eq:dbm-free-convolution>]

Here the solution with positive imaginary part is used in the upper half-plane.
  See #cite(label("Biane"), form: "prose") Lemma 4, Proposition 2,
  and Corollary 2 for this analytic description of semicircular free convolution.

We state the specialization of the fixed-energy theorem that we need. Its density convention is important.
  If $p_H^(\( m \))$ denotes the symmetrized joint eigenvalue density of a random matrix $H$,
  normalized to have integral one, then

$ p_H^(\( a \)) \( y_1 \, dots.h \, y_a \) = integral_(bb(R)^(m - a)) p_H^(\( m \)) \( y_1 \, dots.h \, y_m \)
  thin upright(d) y_(a + 1) dots.h.c thin upright(d) y_m $

also has integral one. It is not the factorial moment density.

#thm([Theorem 6.1.])[
  (Fixed-energy DBM input).  #emph[Suppose a sequence of deterministic diagonal matrices $V$ of dimension $m$
    satisfies (6.1) and (6.2), with fixed constants. Fix $sigma > 0$, and suppose
#[#set math.equation(numbering: n => "(6.4)")
 $ g m^sigma lt.eq t lt.eq m^(- sigma) G^2 . $ <eq:dbm-time-window>]

 Assume also that $rho_(upright("fc") \, t) \( 0 \) = 1 \/ pi$.
   For every fixed positive integer $a$ and $O in C_c^oo \( bb(R)^a \)$, the difference
#[#set math.equation(numbering: n => "(6.5)")
 $ & integral_(bb(R)^a) O \( bold(alpha) \) p_(V + sqrt(t) thin W_m)^(\( a \))
   (frac(pi alpha_1, m) \, dots.h \, frac(pi alpha_a, m)) thin upright(d) bold(alpha)\
 & #h(12mm)  - integral_(bb(R)^a) O \( bold(alpha) \) p_(W_m)^(\( a \))
   (frac(pi alpha_1, m) \, dots.h \, frac(pi alpha_a, m)) thin upright(d) bold(alpha) arrow.r
   0 . $ <eq:dbm-marginal-test>]

 Consequently, the expected sums of $O$ over ordered tuples of distinct points of the two eigenvalue processes,
   both rescaled by $m \/ pi$, differ by $o \( 1 \)$.]
] <thm:dbm-input>

#proof[
  The marginal statement is Theorem 2.2 of #cite(label("LandonSosoeYau"), form: "prose"),
    with Definition 2.1 and Equations (2.5)–(2.9) there, specialized to energy zero and equal densities
    $rho_(upright("fc") \, t) \( 0 \) = rho_(upright("sc")) \( 0 \) = 1 \/ pi$.
    The energy lies in the required interior window for any fixed interior fraction.
    That theorem gives a power-decaying bound for (6.5). To pass to the last assertion, multiply each integral by
  $ frac(\( m \)_a, \( m \/ pi \)^a) \, wide \( m \)_a = m \( m - 1 \) dots.h.c \( m - a + 1 \) . $
  This is the Jacobian and ordered-tuple multiplicity for the unit-mass marginal convention,
    and it tends to $pi^a$ for fixed $a$. ◻
]

=== 6.2 Regularity and the density adjustment <regularity-and-the-density-adjustment>

Fix a microscopic subsequential law $nu$ supplied by Proposition 13.
  We use the parameters and conditional matrices of Proposition 15:

$ K = r^(1 \/ 100) \, wide T = r^tau \, wide 0 < tau < chi / 100000 \, wide I = { j : \| x_j \| lt.eq K } \, wide
  q_(*) = \| I \| \, $

and

#[#set math.equation(numbering: n => "(6.6)")
 $ H_r = D_I + s_1 I + sqrt(s_2) thin cal(W)_r \, wide \| s_1 \| lt.eq C T \, wide c T lt.eq s_2 lt.eq
   C T . $ <eq:dbm-raw-matrix>]

Conditional on $nu$, $cal(W)_r$ is raw GOE of dimension $q_(*)$, with variances $1$ and $2$.
  All following almost-sure assertions concern the conditioning input $nu$. In particular, (4.14) gives

#[#set math.equation(numbering: n => "(6.7)")
 $ q_(*) = 2 rho K + O \( K^(1 - chi) \) \, wide T = q_(*)^(100 tau + o \( 1 \)) . $ <eq:dbm-dimension>]

Thus $q_(*) > 0$ eventually. We may decrease $chi$ so that $chi < 1 \/ 4$.

Put $alpha_(*) = pi rho$. Scaling (6.6) by $alpha_(*) \/ q_(*)$ gives the normalized GOE-addition model

#[#set math.equation(numbering: n => "(6.8)")
 $ alpha_(*) / q_(*) H_r med =^(upright("law")) med V_(*) + sqrt(t_(*)) thin W_(q_(*)) \, wide V_(*) = alpha_(*) /
   q_(*) \( D_I + s_1 I \) \, wide t_(*) = frac(alpha_(*)^2 s_2, q_(*)) . $ <eq:dbm-normalized-matrix>]

#thm([Lemma 6.2.])[
  #emph[For almost every $nu$, the matrices $V_(*)$ are eventually regular with
$ g = T^(1 \/ 2) / q_(*) \, wide G = q_(*)^(- 1 \/ 8) . $

 They satisfy the hypotheses (6.2) and (6.4) with $m = q_(*)$ and $delta = sigma = tau$. Moreover,
$ rho_(upright("fc") \, t_(*)) \( 0 \) arrow.r 1 / pi . $

 If $c_r = pi rho_(upright("fc") \, t_(*)) \( 0 \)$, then eventually $c_r > 0$,
   and the data $c_r V_(*)$ and time $c_r^2 t_(*)$ satisfy Theorem 20, including its exact density condition.]
] <dbm:regularity-density>

#proof[
  First, $parallel V_(*) parallel$ is bounded by (6.7), since $T = o \( K \)$.
    We verify a slightly enlarged regularity domain,
  $ \| Re zeta \| lt.eq 2 G \, wide g \/ 2 lt.eq Im zeta lt.eq 20 \, $
  so that subsequent dilation by $c_r = 1 + o \( 1 \)$ will be harmless. The normalized resolvent trace is
  $ m_(V_(*)) \( zeta \) = alpha_(*)^(- 1) sum_(j in I) frac(1, x_j - \( q_(*) zeta \/ alpha_(*) - s_1 \)) . $
  Writing $e = q_(*) Re zeta \/ alpha_(*) - s_1$ and $u = q_(*) Im zeta \/ alpha_(*)$, the enlarged domain has
  #[#set math.equation(numbering: n => "(6.9)")
   $ \| e \| = O \( K^(7 \/ 8) + T \) = o \( K \) \, wide c T^(1 \/ 2) lt.eq u lt.eq C K . $ <eq:dbm-original-domain>]
  The lower height exceeds a fixed positive power of $K$. The uniform complex resolvent estimate controls the
    Poisson sum down to heights of order $T^(1 \/ 2)$, while the count discrepancy controls truncation at $K$.
    Equation (4.13), with a radius comparable to $K$ and any fixed exponent smaller than $50 tau$, therefore gives
  $ sum_j frac(u, \( x_j - e \)^2 + u^2) = pi rho + o \( 1 \) $
  uniformly in (6.9); here we used the imaginary part of (4.15).
    For $u \/ K$ sufficiently small, the omitted terms with $\| x_j \| > K$ sum to $O \( u \/ K \)$,
    uniformly for $\| e \| = o \( K \)$, by the linear count bound following from (4.14).
    Hence the retained sum has a positive lower bound. For $u \/ K$ bounded below,
    every retained point has $\| x_j - e \| lt.eq 2 K$ eventually, so
  $ sum_(j in I) frac(u, \( x_j - e \)^2 + u^2) gt.eq frac(q_(*) u, 4 K^2 + u^2) gt.eq c > 0 . $
  Its upper bound follows by positivity from the full sum. This proves regularity on the enlarged domain.
  With $m = q_(*)$, the relevant powers are
  $ g = m^(- 1 + 50 tau + o \( 1 \)) \, wide t_(*) = m^(- 1 + 100 tau + o \( 1 \)) \, wide G = m^(- 1 \/ 8) . $
  In particular,
  $ frac(t_(*), g m^tau) = m^(49 tau + o \( 1 \)) arrow.r oo \, wide frac(t_(*), m^(- tau) G^2) =
    m^(- 3 \/ 4 + 101 tau + o \( 1 \)) arrow.r 0 . $
  The inequalities $m^(tau - 1) lt.eq g lt.eq m^(- tau)$ and $G lt.eq m^(- tau)$ follow as well.
    Our bound on $tau$ makes all these exponent inequalities strict.
  It remains to determine the free-convolution density. At $zeta = 0$, Equation (6.3) becomes
  #[#set math.equation(numbering: n => "(6.10)")
   $ w = F_r \( w \) \, wide F_r \( w \) = alpha_(*)^(- 1) sum_(j in I)
     frac(1, x_j - \( alpha_(*) s_2 w - s_1 \)) . $ <eq:dbm-boundary-equation>]
  For $\| w - i \| lt.eq 1 \/ 4$, the argument $z = alpha_(*) s_2 w - s_1$ has $Im z asymp T$ and $\| z \| =
    O \( T \)$. Equations (4.13) and (4.15) imply
  $ "PV" sum_j frac(1, x_j - z) = i pi rho + o \( 1 \) $
  uniformly in this disk. The real constant $m_(upright(r))$ has been subtracted in this formula. Furthermore,
  $ "PV" sum_(\| x_j \| > K) frac(1, x_j - z) = "PV" sum_(\| x_j \| > K) 1 / x_j +
    sum_(\| x_j \| > K) frac(z, x_j \( x_j - z \)) = O \( K^(- chi) + T \/ K \) . $
  The first bound is partial summation of (4.14); the second uses its linear count bound and $\| z \| =
    o \( K \)$. Thus $F_r \( w \) = i + o \( 1 \)$ uniformly on $\| w - i \| lt.eq 1 \/ 4$.
  Rouché’s theorem applied to $w - F_r \( w \)$ and $w - i$ shows that (6.10) has exactly one zero,
    counted with multiplicity, in this disk for all large $r$.
    The zero $w_r$ is therefore simple, and $w_r arrow.r i$. The implicit function theorem continues it to a
    solution near $zeta = 0$ of the full fixed-point equation, still with positive imaginary part.
    This solution is the physical branch. Indeed, every upper-half-plane solution $w$, at $Im zeta > 0$, satisfies
  #[#set math.equation(numbering: n => "(6.11)")
   $ 1 / q_(*) sum_(j in I) \| \( V_(*) \)_(j j) - zeta - t_(*) w \|^(- 2) =
     frac(Im w, Im zeta + t_(*) Im w) < 1 / t_(*) . $ <eq:dbm-uniqueness-identity>]
  If two distinct such solutions existed, subtracting their equations and dividing by their difference would give
  $ 1 = t_(*) /
    q_(*) sum_(j in I)
    frac(1, \( \( V_(*) \)_(j j) - zeta - t_(*) w_1 \) \( \( V_(*) \)_(j j) - zeta - t_(*) w_2 \)) . $
  Cauchy–Schwarz and (6.11) make the absolute value of the right-hand side strictly less than one.
    This contradiction proves uniqueness and identifies the analytic continuation.
    Its boundary value gives $rho_(upright("fc") \, t_(*)) \( 0 \) = Im w_r \/ pi arrow.r 1 \/ pi$.
  Finally, simultaneous replacement of $V_(*) \, t_(*)$ by $c_r V_(*) \,
    c_r^2 t_(*)$ dilates the free-convolution law by $c_r$. For example its transform is $c_r^(- 1)
    m_(upright("fc") \, t_(*)) \( zeta \/ c_r \)$, as follows directly from (6.3). Its density at zero is exactly
  $ c_r^(- 1) rho_(upright("fc") \, t_(*)) \( 0 \) = 1 / pi . $
  Since $c_r arrow.r 1$, the enlarged regularity domain proves (6.1) for $c_r V_(*)$ with the original $g \, G$.
    The strict power margins preserve (6.4) for $c_r^2 t_(*)$, completing the proof. ◻
]

The conclusion is conditional on almost every $nu$, which is enough for applying Theorem 20 to a deterministic
  sequence. No assertion of switching invariance conditional on $nu$ is used.
  The rescaled eigenvalues supplied by that theorem are, by (6.8), precisely

#[#set math.equation(numbering: n => "(6.12)")
 $ q_(*) / pi frac(c_r alpha_(*), q_(*)) lambda_j \( H_r \) =
   c_r rho thin lambda_j \( H_r \) . $ <eq:dbm-final-coordinates>]

Define $c_r = 1$ at any exceptional initial values where the preceding construction is not defined;
  these values have no effect on the limit.

=== 6.3 The GOE limit and uniform count moments <the-goe-limit-and-uniform-count-moments>

Let

$ cal(G)_m = sum_(j = 1)^m delta_(\( m \/ pi \) lambda_j \( W_m \)) . $

These point processes converge vaguely in law, along all dimensions, to a common locally finite point process,
  which we denote by $cal(S)_(upright("GOE"))$. To check normalization directly,
  the eigenvalues of $sqrt(m) thin W_m$ have joint density proportional to

$ exp (- 1 / 4 sum_j y_j^2) product_(i < j) \| y_i - y_j \| . $

This follows from orthogonal diagonalization of the matrix density $exp \( - "Tr" H^2 \/ 4 \)$;
  the change in an off-diagonal coordinate under an infinitesimal basis rotation is the corresponding eigenvalue
  difference, yielding the Vandermonde Jacobian. Theorem 1 of #cite(label("ValkoVirag"), form: "prose"),
  for $beta = 1$ and center zero, gives vague convergence after multiplying these eigenvalues by $2 sqrt(m)$.
  Its bulk condition $m^(1 \/ 6) \( 2 sqrt(m) - 0 \) arrow.r oo$ holds.
  Dividing the resulting coordinates by $2 pi$ gives $cal(G)_m$, as claimed.

The DBM input compares each fixed correlation order. To recover Laplace functionals,
  we will bracket them by finite alternating sums of those correlation observables.
  The following exponential bound on the reference GOE counts will make the gap between successive brackets tend
  to zero, uniformly in the matrix dimension.

#thm([Lemma 6.3.])[
  #emph[For every compact interval $J subset bb(R)$ and every $b > 0$,
$ sup_(m gt.eq 1) bb(E) exp #scale(x: 120%, y: 120%)[\(] b thin cal(G)_m \( J \) #scale(x: 120%, y: 120%)[\)] < oo . $

]
] <lem:goe-counts>

#proof[
  We bound the GOE count by twice a Gaussian unitary count plus one,
    using the Gaussian decimation identity of #cite(label("ForresterRains"), form: "prose") arXiv version 2,
    Theorem 5.2 and Equation (5.9). We derive that identity in our normalization,
    then use the unitary ensemble’s projection kernel to bound its count moments.
  ===== 6.3.1 Gaussian decimation. <gaussian-decimation.>
  Write $upright(O)_m$ for the decreasingly ordered points with density proportional to
  $ Delta \( y \) product_(i = 1)^m b_0 \( y_i \) \, wide b_0 \( y \) = e^(- y^2 \/ 2) \, wide Delta \( y \) =
    product_(i < j) \( y_i - y_j \) . $
  They have the law of the eigenvalues of $sqrt(m) thin W_m \/ sqrt(2)$.
    Thus the count $cal(G)_m \( J \)$ is the $upright(O)_m$ count in
  $ J_m = pi / sqrt(2 m) J \, wide \| J_m \| = O \( m^(- 1 \/ 2) \) . $
  Superpose independent $upright(O)_m$ and $upright(O)_(m + 1)$,
    and order the resulting points as $z_1 > dots.h.c > z_(2 m + 1)$.
    Apart from a constant and the common Gaussian factor, their density is the polynomial
  $ P \( z \) = sum_(S subset { 1 \, dots.h \, 2 m + 1 }\
\| S \| = m) Delta \( z_S \) Delta \( z_(S^c) \) \, $
  where each sublist is in the inherited order. The parity–Vandermonde factorization of
    #cite(label("ForresterRains"), form: "prose") arXiv version 2, Lemma 4.1 and Equation (4.2) is
  #[#set math.equation(numbering: n => "(6.13)")
   $ P \( z \) = c_m Delta \( z_1 \, z_3 \, dots.h \, z_(2 m + 1) \)
     Delta \( z_2 \, z_4 \, dots.h \, z_(2 m) \) \, wide c_m > 0 . $ <eq:dbm-decimation-polynomial>]
  If $z_i = z_j$ with $i \, j$ of the same parity, terms having both indices in one sublist vanish.
    The other terms cancel in pairs under exchanging membership of $i \, j$:
    the sign ratio is $\( - 1 \)^(j - i - 1) = - 1$, since each intervening index belongs to exactly one sublist.
    Hence every factor on the right divides $P$. Both sides have degree $m^2$, so the quotient is constant.
    It is positive on strictly decreasing $z$, proving (6.13).
  Fix the even points $y_i = z_(2 i)$. The odd points interlace them, one in each of
  $ \( y_1 \, oo \) \, med \( y_2 \, y_1 \) \, dots.h \, \( y_m \, y_(m - 1) \) \, med \( - oo \, y_m \) . $
  To integrate their Vandermonde times their Gaussian factors, use the monic polynomials
  $ p_j \( x \) = \( - 1 \)^j frac(b_0^(\( j \)) \( x \), b_0 \( x \)) \, wide 0 lt.eq j lt.eq m . $
  Writing the Vandermonde as the determinant of these polynomials reduces the integral, by multilinearity,
    to a determinant of integrals over the displayed intervals.
    Replace each row by the sum of it and all preceding rows. For column $j gt.eq 1$, the first $m$ rows become
  $ integral_(y_i)^oo p_j \( x \) b_0 \( x \) thin upright(d) x = p_(j - 1) \( y_i \) b_0 \( y_i \) \, $
  and the last row is zero. In column zero the last row is $integral_(bb(R)) b_0$.
    Expansion along that last row leaves a Vandermonde in the $y_i$ times $product_i b_0 \( y_i \)$.
    More explicitly, the ascending-degree polynomial columns give signs $\( - 1 \)^(m \( m + 1 \) \/ 2)$ for the
    odd-point Vandermonde and $\( - 1 \)^(m \( m - 1 \) \/ 2)$ for the even-point Vandermonde,
    while expansion along the last row contributes $\( - 1 \)^m$. Their product is one.
    Thus, if $x_0 > y_1 > x_1 > dots.h.c > y_m > x_m$, the integral just evaluated is exactly
  $ integral_(upright("interlacing")) Delta \( x_0 \, dots.h \, x_m \) product_(i = 0)^m b_0 \( x_i \) thin
    upright(d) x_0 dots.h.c thin upright(d) x_m = sqrt(2 pi) thin Delta \( y \) product_(i = 1)^m b_0 \( y_i \) . $
  Together with the even-point factors already present in (6.13),
    this proves that the even points have density proportional to
  #[#set math.equation(numbering: n => "(6.14)")
   $ Delta \( y \)^2 product_(i = 1)^m e^(- y_i^2) . $ <eq:dbm-even-density>]
  ===== 6.3.2 Projection kernel and count moments. <projection-kernel-and-count-moments.>
  The even-point density now gives a direct bound on count moments.
    Let $psi_j \( x \)$ be the degree-$j$ orthonormal polynomial for the weight $e^(- x^2)$,
    multiplied by $e^(- x^2 \/ 2)$. The kernel
  $ K_m \( x \, y \) = sum_(j = 0)^(m - 1) psi_j \( x \) psi_j \( y \) $
  is the rank-$m$ orthogonal projection in $L^2 \( bb(R) \)$ onto their span.
    The symmetric density in (6.14) is $\( m ! \)^(- 1) det \( K_m \( y_i \, y_j \) \)_(i \, j = 1)^m$.
    Indeed the determinant is a squared weighted Vandermonde, and orthonormality gives its integral $m !$.
    More generally its order-$a$ factorial moment density is $det \( K_m \( y_i \, y_j \) \)_(i \, j = 1)^a$.
    For completeness, expand a size-$a$ determinant by Cauchy–Binet as the sum of squared minors indexed by $a$
    basis functions. Integrating its last variable uses their orthogonality, and each minor of size $a -
    1$ occurs $m - a + 1$ times. Iterating this identity proves the factorial density formula with its stated
    normalization.
  We need a bound uniform in both $m$ and location. The operator $- partial_x^2 + x^2$ has eigenvalue $2 j +
    1$ on $psi_j$. This follows by conjugating it by $e^(- x^2 \/ 2)$:
    on the polynomial factor it acts as $- p'' + 2 x p' + p$, preserves successive degree spaces,
    is symmetric for the Gaussian inner product, and has leading coefficient multiplier $2 j + 1$.
    Consequently every $f$ in the range of $K_m$ satisfies
  $ parallel f' parallel_2^2 lt.eq \( 2 m - 1 \) parallel f parallel_2^2 . $
  The elementary bound $\| f \( x \) \|^2 lt.eq 2 parallel f' parallel_2 parallel f parallel_2$,
    obtained by integrating the derivative of $\| f \|^2$, gives
  $ K_m \( x \, x \) = sup_(f in "Ran" K_m\
parallel f parallel_2 = 1) \| f \( x \) \|^2 lt.eq 2 sqrt(2 m) . $
  If $N_m^(upright("even"))$ is the number of even points in $J_m$, the Gram determinant inequality yields,
    for every $a gt.eq 0$,
  $ bb(E) \( N_m^(upright("even")) \)_a lt.eq #scale(x: 120%, y: 120%)[\(] 2 sqrt(2 m) thin \| J_m \|
    #scale(x: 120%, y: 120%)[\)]^a lt.eq C_J^a . $
  For $a > m$ the left side is zero. Hence, for every $v > 0$,
  $ bb(E) e^(v N_m^(upright("even"))) = sum_(a = 0)^m frac(\( e^v - 1 \)^a, a !)
    bb(E) \( N_m^(upright("even")) \)_a lt.eq exp #scale(x: 120%, y: 120%)[\(] C_J \( e^v - 1 \)
    #scale(x: 120%, y: 120%)[\)] . $
  In any interval the total superposition count is at most twice its even count plus one.
    The original $upright(O)_m$ count is no greater than the superposition count. Thus
  $ bb(E) e^(b cal(G)_m \( J \)) lt.eq e^b thin bb(E) e^(2 b N_m^(upright("even"))) \, $
  which proves the assertion. ◻
]

=== 6.4 From correlation functions to Laplace functionals <from-correlation-functions-to-laplace-functionals>

Let $nu^(\( r \)) = sum_(j = 1)^(q_(*)) delta_(lambda_j \( H_r \))$ denote the raw eigenvalue measure in (6.6).
  Proposition 15 asserts

#[#set math.equation(numbering: n => "(6.15)")
 $ nu^(\( r \)) med arrow.r.double med nu $ <eq:dbm-insertion-limit>]

in local vague topology, unconditionally. We will identify the law of $rho$-dilated $nu$ by first applying DBM
  conditional on $nu$.

Fix a nonnegative $h in C_c^oo \( bb(R) \)$, and put $f = 1 - e^(- h)$, so $0 lt.eq f lt.eq 1$.
  For a finite point measure $zeta = sum_i delta_(y_i)$, define

$ A_0 \( zeta \) = 1 \, wide A_a \( zeta \) = frac(1, a !) sum_(i_1 \, dots.h \, i_a med upright("distinct"))
  product_(j = 1)^a f \( y_(i_j) \) quad \( a gt.eq 1 \) \, wide B_ell \( zeta \) =
  sum_(a = 0)^ell \( - 1 \)^a A_a \( zeta \) . $

The finite inclusion-exclusion inequalities give

#[#set math.equation(numbering: n => "(6.16)")
 $ B_(2 ell + 1) \( zeta \) lt.eq exp (- integral h thin upright(d) zeta) lt.eq
   B_(2 ell) \( zeta \) . $ <eq:dbm-bonferroni>]

One can see these inequalities by taking independent Bernoulli variables of success probabilities $f \( y_i \)$:
  the middle quantity is their probability of no successes,
  and the displayed sums are the Bonferroni bounds for that event.

Conditional on almost every $nu$, let $zeta_r$ have the point coordinates $c_r rho thin lambda_j \( H_r \)$.
  Lemma 21 and Theorem 20, applied with the test $product_(j = 1)^a f \( alpha_j \)$, imply for each fixed $ell$ that

$ bb(E) \[ B_ell \( zeta_r \) divides nu \] - bb(E) B_ell \( cal(G)_(q_(*)) \) arrow.r 0 . $

The expectation in the second term is over a reference GOE matrix of the now deterministic conditional dimension
  $q_(*)$. To close the brackets uniformly in that dimension, choose a compact interval $J$ containing $"supp" h$. Then

$ A_a \( cal(G)_m \) lt.eq binom(cal(G)_m \( J \), a) lt.eq 2^(- a) 3^(cal(G)_m \( J \)) . $

The last inequality follows from $sum_(a gt.eq 0) 2^a binom(N, a) = 3^N$. Lemma 22 consequently gives

#[#set math.equation(numbering: n => "(6.17)")
 $ sup_m bb(E) #scale(x: 120%, y: 120%)[\[] B_(2 ell) \( cal(G)_m \) -
   B_(2 ell + 1) \( cal(G)_m \) #scale(x: 120%, y: 120%)[\]] lt.eq C_J 2^(- \( 2 ell + 1 \)) . $ <eq:dbm-bracket-width>]

Using (6.16) for both models, first sending $r arrow.r oo$ at fixed $ell$, and then sending $ell arrow.r oo$, proves

#[#set math.equation(numbering: n => "(6.18)")
 $ bb(E) [exp (- integral h thin upright(d) zeta_r) thin mid(bar.v) thin nu] arrow.r
   bb(E) exp (- integral h thin upright(d) cal(S)_(upright("GOE"))) . $ <eq:dbm-conditional-laplace>]

Here we also used the vague GOE limit and $q_(*) arrow.r oo$.
  Only the reference count moments were needed in (6.17); no uniform moment bound for the deformed model has been
  assumed. Since both sides of the conditional Laplace comparison lie in $\[ 0 \, 1 \]$,
  bounded convergence now removes the conditioning in (6.18).

For $c > 0$, let $cal(D)_c zeta$ denote the point measure obtained by multiplying all positions of $zeta$ by $c$.
  The map $\( c \, zeta \) mapsto cal(D)_c zeta$ is continuous when $c$ tends to a positive number and $zeta$
  converges locally vaguely. Indeed, the inverse images of a fixed compact support remain in a common compact
  interval, and the corresponding test functions converge uniformly there;
  vague convergence also bounds the masses on a slightly larger compact interval.
  By Lemma 21, $c_r arrow.r 1$ almost surely. Combining this with (6.15) and the usual joint convergence with a
  constant yields

$ zeta_r = cal(D)_(c_r rho) nu^(\( r \)) med arrow.r.double med cal(D)_rho nu . $

The Laplace functional of a compactly supported continuous nonnegative test is bounded and continuous in local
  vague topology. Thus (6.18), after averaging, identifies

#[#set math.equation(numbering: n => "(6.19)")
 $ bb(E) exp (- integral h thin upright(d) cal(D)_rho nu) =
   bb(E) exp (- integral h thin upright(d) cal(S)_(upright("GOE"))) wide \( 0 lt.eq h in C_c^oo \( bb(R) \) \) .
   $ <eq:dbm-limit-identification>]

For any $0 lt.eq h in C_c \( bb(R) \)$, convolution with a nonnegative smooth approximate identity gives
  nonnegative smooth functions converging uniformly to $h$, all supported in one fixed compact interval.
  Both limiting point measures have finitely many points there almost surely.
  The corresponding Laplace variables converge pointwise and are bounded by one,
  so bounded convergence extends (6.19) to every such $h$.

#proof[
  Start with any sequence of admissible graph sizes tending to infinity.
    Proposition 13 supplies a further subsequence on which the unscaled microscopic measures $nu_n$ converge in
    law to a process $nu$ of the form used above. The graph point measure in the theorem is $cal(D)_rho nu_n$.
    Bounded continuity of its Laplace functional and (6.19) show that its Laplace expectation,
    along this further subsequence, tends to the Laplace expectation of $cal(S)_(upright("GOE"))$.
    The reference GOE expectations at dimension $n$ tend to the same value, along all sizes.
    Every original subsequence therefore has a further subsequence along which their difference tends to zero,
    which proves the required full-sequence limit. All spectral estimates and negligible exclusions used to
    construct the subsequential law were events in the original simple-graph model;
    no conditioning on connectedness, bipartiteness, or any additional graph property enters the conclusion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
