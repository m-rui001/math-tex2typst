#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A single-lattice covering bound \
of order $n log n$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a convex body $K subset bb(R)^n$, its lattice covering density is

$ theta_L \( K \) = inf {frac("vol"_n \( K \), det Lambda) : Lambda upright(" is a full-rank lattice and ") K +
  Lambda = bb(R)^n} . $

Here a convex body is compact with nonempty interior, and $det Lambda$ denotes lattice covolume.
  The density is the average number of translates covering a point in a fundamental cell:
  integrating the covering multiplicity over that cell gives $"vol"_n \( K \)$.
  Thus density measures the overlap needed to cover space when the centers must form one lattice.
  We prove the following bound.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C > 0$ such that, for every integer $n gt.eq
    2$ and every convex body $K subset bb(R)^n$, one full-rank lattice $Lambda$ satisfies
$ K + Lambda = bb(R)^n \, wide frac("vol"_n \( K \), det Lambda) lt.eq C n log n . $

 No symmetry or boundary regularity is assumed.]
] <thm:main>

===== 1.1 History and significance. <history-and-significance.>

Rogers proved that every convex body in dimension $n gt.eq
  3$ admits a translative covering of density at most $n log n + n log log n + 5 n$ [6].
  The centers in that construction may be a finite union of lattice cosets.
  Fejes Tóth later obtained the same leading density using only $O \( log n \)$ cosets of one lattice [2].
  Requiring the centers to form one lattice is a stronger constraint,
  and a translative bound does not establish Theorem 1. For general lattice coverings,
  Rogers obtained the bound $n^(log_2 log n + O \( 1 \))$ [8].
  Ordentlich, Regev, and Weiss replaced it by the universal quadratic bound $theta_L \( K \) =
  O \( n^2 \)$ [5] Theorem 1.1. Li and Liu subsequently proved

$ theta_L \( K \) lt.eq C n log n thin \( log log n \)^(10 \/ 3 + o \( 1 \)) $

uniformly over convex bodies [3] Theorem 1.2. Their binary-correction companion improves the exponent of $log log
  n$ to $2 / 3 log_2 \( 2 pi e \) + o \( 1 \)$ [4] Theorem 1.1.
  Theorem 1 removes this remaining iterated-logarithmic loss and gives the constant-factor $n log n$ bound.
  In every sufficiently large dimension, Li and Liu also give centrally symmetric bodies with lattice covering
  density at least $c n log n$ [3] Theorem 1.3. Together these results determine the supremum of lattice covering
  density over bodies in dimension $n$, up to absolute constant factors, as $n log n$.
  This statement concerns the supremum over bodies, rather than the covering density of every individual body.
  A translative lower bound must exclude all center configurations and is a separate question;
  the present theorem and its proof concern the single-lattice upper bound.

===== 1.2 The new mechanism. <the-new-mechanism.>

The proof develops the horizontal–vertical framework and binary-correction ideas of Li and Liu [3,4].
  Write a point as $\( x \, y \)$, where $x$ is the horizontal coordinate and the vertical coordinate $y$ has much
  smaller dimension. Translating vertically lets several horizontal sections of the same body contribute to
  covering a given height. The pointwise Gaussian marginal theorem of Eldan and Klartag [1] controls the volumes
  of these sections after an affine normalization. The lattice mean-hole method of Rogers and Schmidt [7,9],
  in the form of Ordentlich–Regev–Weiss [5] Theorem 2.3, then provides one horizontal lattice with an
  exponentially small uncovered fraction for every section on a finite list.

The remaining task is to distribute these horizontal contributions by one linear shear of a vertical lattice.
  A binary correction offers two adjacent integer choices in each vertical coordinate.
  In Li and Liu’s two-stage construction, one auxiliary correction is chosen for an entire weighted Boolean
  cube [4] Theorem 6.2. Here the corrections themselves form a hierarchy:
  we retain their weighted branches through all intermediate blocks.

The total Gaussian mass of the retained family, multiplied by the vertical lattice covolume,
  stays above an absolute constant, while every individual atom becomes very small.
  These two properties play different roles: the total mass supplies enough horizontal load,
  and the atom bound keeps every section within the range of the mean-hole estimate.
  The corrections are arranged in successively smaller blocks, with sizes approximately $b \, b^0.9 \,
  b^(0.9^2) \, dots.h$, stopped at a fixed absolute cutoff.
  Each block loses only $O \( b^(- 1 \/ 100) \)$ of the mass.
  The resulting losses are summable even when the number of blocks grows.

Two auxiliary statements isolate features of potential independent use.
  The finite-group sampler in Lemma 4 converts an almost-everywhere average into a uniform lower average using
  random subset sums; its cost depends on $log \| H \|$, rather than $\| H \|$.
  Lemma 11 extends the simultaneous Boolean-shift argument of Li and Liu [3] Theorem 4.3 to finitely many
  binary-suffix patterns with one linear shear. The values of the branch bases can depend on later choices;
  only the unit separation of two siblings is needed. This preserves the single-lattice structure throughout.

===== 1.3 Organization. <organization.>

Section 2 derives the precise section and horizontal lattice estimates from two established results,
  stating their hypotheses explicitly. Section 3 proves the uniform finite-group sampler.
  Sections 4 and 5 construct the folded Gaussian blocks and their weighted branching hierarchy.
  Section 6 chooses the common shear and removes the final holes by a dilation of factor $1 + 1 \/ n$.
  All new probabilistic and geometric arguments are proved below;
  no estimate on a single successful branch substitutes for a bound on their total weight.

===== 1.4 Notation and constants. <notation-and-constants.>

Euclidean volume is written $"vol"_d$. Expectations over finite groups use uniform probability;
  $\| A \|$ denotes cardinality for a finite set. On a lattice torus,
  $\| A \|$ instead denotes normalized Haar measure. The standard Gaussian density is

$ gamma_d \( y \) = \( 2 pi \)^(- d \/ 2) exp \( - parallel y parallel^2 \/ 2 \) . $

All logarithms are natural except $log_2$. The constants $c \, C$ may change from line to line and are absolute.
  Asymptotic statements concern sufficiently large dimensions or block sizes;
  their thresholds never depend on the convex body. The particular decimal exponents below are chosen for strict
  inequalities, not optimization. A fixed cutoff may be large,
  but it is chosen before the dimension and remains absolute.

== 2 Geometric and horizontal preparations <sec:preliminaries>

We use two established results: the pointwise Gaussian marginal theorem of Eldan and Klartag,
  and the Rogers–Schmidt mean-hole estimate. From the first we derive a finite list of bodies contained in nearby
  horizontal sections; from the second we obtain one horizontal lattice that works for the whole list.
  Neither result requires symmetry. This section develops the finite-section and common-lattice preparation of Li
  and Liu [3] Proposition 4.1 and Lemma 4.2, with the precise bounds used in our construction.

=== 2.1 A finite list of horizontal sections <a-finite-list-of-horizontal-sections>

Theorem 1 of Eldan and Klartag [1] has the following consequence.
  There are absolute constants $alpha \, beta \, gamma \, C_0 > 0$ such that, for all sufficiently large $n$,
  every isotropic random vector $X in bb(R)^n$ with a log-concave density has the following property:
  for each integer $1 lt.eq D lt.eq n^alpha$, there is a $D$-dimensional subspace $E$ whose orthogonal marginal
  has density $f_E$ satisfying

#[#set math.equation(numbering: n => "(2.1)")
 $ lr(|frac(f_E \( y \), gamma_D \( y \)) - 1|) lt.eq C_0 n^(- gamma)
   wide \( y in E \, med parallel y parallel lt.eq n^beta \) . $ <eq:gaussian-marginal-input>]

Here isotropic means $bb(E) X = 0$ and $bb(E) X X^(sans(T)) = I_n$;
  orthonormal coordinates identify $E$ with $bb(R)^D$. For a uniform law on a convex body,
  we use the canonical marginal density given by the section integral. We only use the lower bound in Equation (2.1).

#thm([Lemma 2.1.])[
  (Section labels).  #emph[There are absolute constants $c \, C > 0$ with the following property. Fix $M gt.eq 1$.
    For all sufficiently large $n$, with threshold depending only on $M$, suppose that $D$ is a positive integer and
$ 1 lt.eq D \, R lt.eq M \( 1 + log log n \)^M \, wide m = n - D . $

 Every convex body in $bb(R)^n$ has an invertible affine image $K subset bb(R)^m times
   bb(R)^D$ and a list of at most $\( C m^2 \)^D$ convex bodies $J_a subset bb(R)^m$ such that, writing $K_y =
   { x : \( x \, y \) in K }$, for every $parallel y parallel lt.eq R$ some label $a$ satisfies
#[#set math.equation(numbering: n => "(2.2)")
 $ J_a subset K_y \, wide c thin "vol"_n \( K \) gamma_D \( y \) lt.eq "vol"_m \( J_a \) lt.eq
   C thin "vol"_n \( K \) gamma_D \( y \) . $ <eq:section-labels>]

]
] <lem:sections>

#proof[
  An affine transformation makes the uniform law on the given body isotropic:
    its covariance matrix is positive definite because the body has nonempty interior.
    The uniform density is log-concave. Put $S = 2 D R + 2$. Uniformly over the displayed range of $D \, R$,
    for sufficiently large $n$ we have
  $ D lt.eq n^alpha \, wide S < n^beta \, wide C_0 n^(- gamma) lt.eq 1 / 2 . $
  Choose $E$ from Equation (2.1) and use orthonormal coordinates $E^perp times E$.
    Write $K$ for the resulting body. By Fubini’s theorem, $"vol"_m \( K_y \) \/
    "vol"_n \( K \)$ is a version of the marginal density. The lower bound holds at every required height,
    independently of density versions: compactness implies that, as $y' arrow.r y$,
    the fiber $K_(y')$ is eventually contained in $K_y + epsilon B_m$ for each $epsilon > 0$,
    where $B_m$ is the unit ball. Continuity of volume under decreasing compact neighborhoods shows that $y mapsto
    "vol"_m \( K_y \)$ is upper semicontinuous. Its almost-everywhere Gaussian lower bound therefore extends to
    every $parallel y parallel lt.eq S < n^beta$ by approaching from the full-measure set. Consequently
  #[#set math.equation(numbering: n => "(2.3)")
   $ "vol"_m \( K_y \) gt.eq 1 / 2 "vol"_n \( K \) gamma_D \( y \) wide \( parallel y parallel lt.eq S \) .
     $ <eq:section-lower-bound>]
  We first arrange that $0 in K_y$ whenever $parallel y parallel lt.eq 2 R$.
    Take a centered regular simplex in $bb(R)^D$ of inradius $2 R$; its vertices $v_0 \, dots.h \,
    v_D$ have norm $2 D R < S$. Each section at a vertex is nonempty by Equation (2.3),
    so choose $x_i in K_(v_i)$. There is an affine map $T : bb(R)^D arrow.r bb(R)^m$ with $T \( v_i \) =
    x_i$ for all $i$. Replace the body by its image under $\( x \, y \) mapsto \( x - T \( y \) \, y \)$.
    This map has determinant one and translates each horizontal section;
    thus it preserves both its volume and Equation (2.3). The new body contains $\( 0 \, v_i \)$ for every vertex.
    By convexity it contains $\( 0 \, y \)$ for every $y$ in the simplex, which includes the ball of radius $2 R$.
  Let ${ y_a }$ be a maximal $R \/ m^2$-separated set in the closed ball of radius $R$. It is an $R \/ m^2$-net.
    Comparing the disjoint balls of radius $R \/ \( 2 m^2 \)$ about its points with the ball of radius $R +
    R \/ \( 2 m^2 \)$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ \# { y_a } lt.eq \( 1 + 2 m^2 \)^D lt.eq \( 3 m^2 \)^D . $ <eq:section-net-size>]
  If $parallel y - y_a parallel lt.eq R \/ m^2$, set $z = y_a + m^2 \( y - y_a \)$.
    Then $parallel z parallel lt.eq 2 R$ and $y = \( 1 - m^(- 2) \) y_a + m^(- 2) z$.
    Since $\( 0 \, z \) in K$, convexity yields
  #[#set math.equation(numbering: n => "(2.5)")
   $ \( 1 - m^(- 2) \) K_(y_a) subset K_y . $ <eq:section-net-inclusion>]
  For $m gt.eq 2$, Bernoulli’s inequality gives $\( 1 - m^(- 2) \)^m gt.eq 1 - m^(- 1) gt.eq 1 \/ 2$.
    By Equation (2.3), the body $\( 1 - m^(- 2) \) K_(y_a)$ therefore has volume at least $1 /
    4 "vol"_n \( K \) gamma_D \( y_a \)$. It contains zero, so a further homothety about zero gives a convex body
    $J_a$ contained in it with exactly
  #[#set math.equation(numbering: n => "(2.6)")
   $ "vol"_m \( J_a \) = 1 / 8 "vol"_n \( K \) gamma_D \( y_a \) . $ <eq:label-prescribed-volume>]
  For a chosen nearby $y_a$,
  $ lr(|log frac(gamma_D \( y_a \), gamma_D \( y \))|) lt.eq
    frac(parallel y_a - y parallel \( parallel y_a parallel + parallel y parallel \), 2) lt.eq R^2 \/ m^2 =
    o \( 1 \) . $
  Equations (2.5) and (2.6) prove Equation (2.2), and Equation (2.4) bounds the list size.
    All thresholds used above depend only on $M$, not on the body. ◻
]

=== 2.2 One lattice for all labels <one-lattice-for-all-labels>

For a lattice $Lambda subset bb(R)^m$, write

$ h_Lambda \( J \) = 1 - \| pi_Lambda \( J \) \| \, $

where the measure on $bb(R)^m \/ Lambda$ is normalized to be a probability measure.
  Let $mu_m$ be the invariant probability measure on the space of unimodular lattices in $bb(R)^m$, and put

$ eta_m = m / 4 log 27 / 16 - 3 log m . $

The estimate of Rogers and Schmidt [7,9], in the form of Ordentlich–Regev–Weiss [5] Theorem 2.3,
  states that there is an absolute constant $C_(upright(R)) > 0$ such that every Borel set $J subset
  bb(R)^m$ of volume $u lt.eq eta_m$ satisfies

#[#set math.equation(numbering: n => "(2.7)")
 $ lr(|integral h_Lambda \( J \) thin d mu_m \( Lambda \) - e^(- u)|) lt.eq
   C_(upright(R)) e^(- eta_m) . $ <eq:mean-hole-input>]

#thm([Lemma 2.2.])[
  (Common horizontal lattice).  #emph[Let $J_1 \, dots.h \, J_N$ be convex bodies in $bb(R)^m$, let $D_h > 0$,
    and set $u_a = "vol"_m \( J_a \) \/ D_h$. If
#[#set math.equation(numbering: n => "(2.8)")
 $ max_a u_a lt.eq eta_m \, wide \( 1 + C_(upright(R)) \) sum_(a = 1)^N e^(- u_a \/ 2) < 1 \,
   $ <eq:horizontal-criterion>]

 there is a lattice $Lambda_h$ of determinant $D_h$ satisfying
#[#set math.equation(numbering: n => "(2.9)")
 $ h_(Lambda_h) \( J_a \) lt.eq e^(- u_a \/ 2) wide \( 1 lt.eq a lt.eq N \) . $ <eq:horizontal-holes>]

 In particular, this conclusion holds for all sufficiently large $m$ if
$ min_a u_a gt.eq sqrt(m) \, wide max_a u_a = o \( m \) \, wide log N = o \( sqrt(m) \) . $

 The dimension threshold in this last formulation depends only on the three numerical bounds,
   not on the shapes of the bodies.]
] <lem:horizontal>

#proof[
  Replace every $J_a$ by $J'_a = D_h^(- 1 \/ m) J_a$, so that $"vol"_m \( J'_a \) = u_a$. Equation (2.7) gives
  $ bb(E)_(Lambda tilde.op mu_m) h_Lambda \( J'_a \) lt.eq e^(- u_a) +
    C_(upright(R)) e^(- eta_m) lt.eq \( 1 + C_(upright(R)) \) e^(- u_a) . $
  Markov’s inequality bounds the probability that $h_Lambda \( J'_a \) >
    e^(- u_a \/ 2)$ by $\( 1 + C_(upright(R)) \) e^(- u_a \/ 2)$.
    The sum of these probabilities is less than one by Equation (2.8).
    Thus a single unimodular lattice $Lambda$ satisfies all the desired inequalities.
    Set $Lambda_h = D_h^(1 \/ m) Lambda$; scaling identifies the normalized tori, preserves the hole proportions,
    and gives determinant $D_h$.
  Finally, $eta_m \/ m arrow.r 1 / 4 log \( 27 \/ 16 \) > 0$, so $max_a u_a =
    o \( m \)$ ensures the first condition in Equation (2.8). The other two numerical bounds give
  $ \( 1 + C_(upright(R)) \) sum_(a = 1)^N e^(- u_a \/ 2) lt.eq \( 1 + C_(upright(R)) \) exp { log N - 1 /
    2 sqrt(m) } = o \( 1 \) \, $
  which ensures the second. ◻
]

== 3 A uniform Boolean sampler <sec:sampler>

We next construct an averaging operator from random subset sums.
  The exponential-potential argument develops the finite-group binary correction of Li and Liu [4] Theorem 4.1;
  we prove the weighted estimate with random shifts used below, including all required quantitative bounds.
  A second moment estimate alone gives a good approximation at most base points.
  A second group of random shifts upgrades this to a lower bound at #emph[every] base point.
  This distinction will allow a later block to sample an earlier one even when its base point depends on other
  lattice choices.

#thm([Lemma 3.1.])[
  (Uniform Boolean sampling).  #emph[There is an absolute constant $b_0$ with the following property.
    Let $b gt.eq b_0$, let $H$ be a finite abelian group written additively, and suppose that
$ log \| H \| lt.eq b^4 \, wide 0 lt.eq g lt.eq exp \( b^0.65 \) \, wide macron(g) :=
  bb(E)_(x in H) g \( x \) in \[ 1 \/ 2 \, 2 \] . $

 Let $s$ be an integer satisfying $b^0.69 lt.eq s lt.eq b$, and choose $w_1 \, dots.h \,
   w_s$ independently and uniformly in $H$. With $c_(*) = \( log 2 \) \/ 8$, the probability that
#[#set math.equation(numbering: n => "(3.1)")
 $ 2^(- s) sum_(epsilon in { 0 \, 1 }^s) g (x - sum_(i = 1)^s epsilon_i w_i) gt.eq \( 1 - 3 b^(- 1 \/ 10) \)
   macron(g) wide upright("for every ") x in H $ <eq:sampler-conclusion>]

 is at least
#[#set math.equation(numbering: n => "(3.2)")
 $ 1 - exp \( - c_(*) b^0.69 \) - b exp (- c_(*) / 2 b^0.59) . $ <eq:sampler-probability>]

 In particular, the failure probability is at most $b^(- 1 \/ 2)$ after increasing $b_0$.]
] <lem:sampler>

#proof[
  Put $delta = b^(- 1 \/ 10)$, $k = floor.l s \/ 2 floor.r$, and $j_(*) = s - k$. We use the first $k$ shifts to define
  $ A \( x \) = 2^(- k) sum_(epsilon in { 0 \, 1 }^k) g (x - sum_(i = 1)^k epsilon_i w_i) . $
  Temporarily take $x$ independently uniform in $H$. For two distinct bit vectors $epsilon \, epsilon'$,
    their arguments in this average are independent uniform points.
    To see this, choose an index at which the bits differ and condition on all other shifts.
    The map from $x$ and that remaining shift to the two arguments is a bijection of $H times H$:
    subtracting the arguments determines the shift with coefficient $1$ or $- 1$, and then determines $x$.
    This works in every finite abelian group, with no restriction on its order. Consequently,
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E)_(w_1 \, dots.h \, w_k \, x) \( A \( x \) - macron(g) \)^2 =
     2^(- k) (bb(E)_x g \( x \)^2 - macron(g)^2) lt.eq 2^(- k) exp \( 2 b^0.65 \) . $ <eq:sampler-second-moment>]
  For fixed first-stage shifts, let
  $ cal(G) = { x in H : A \( x \) gt.eq \( 1 - delta \) macron(g) } \, wide beta = 1 - frac(\| cal(G) \|, \| H \|) . $
  Chebyshev’s inequality, $macron(g) gt.eq 1 \/ 2$, and Equation (3.3) give
  $ bb(E)_(w_1 \, dots.h \, w_k) beta lt.eq 4 b^(1 \/ 5) 2^(- k) exp \( 2 b^0.65 \) lt.eq exp \( - 2 c_(*) s \) . $
  The last inequality holds for all sufficiently large $b$, uniformly in $s gt.eq b^0.69$.
    Indeed, its logarithm is at most
  $ log 8 + 1 / 5 log b + 2 b^0.65 - 1 / 2 s log 2 \, $
  and the first three terms are at most $s log 2 \/ 4$ once $b$ is large. Markov’s inequality therefore yields
  #[#set math.equation(numbering: n => "(3.4)")
   $ bb(P) { beta > exp \( - c_(*) s \) } lt.eq exp \( - c_(*) s \) . $ <eq:sampler-small-bad-set>]
  Fix any first-stage shifts for which $beta lt.eq exp \( - c_(*) s \)$.
  For $0 lt.eq j lt.eq j_(*)$, let
  $ N_j \( x \) = sum_(eta in { 0 \, 1 }^j) upright(bold(1))_(cal(G)) (x - sum_(i = 1)^j eta_i w_(k + i)) . $
  Here we count bit labels with multiplicity, even if their subset sums coincide.
    Thus, for a fresh shift $w = w_(k + j + 1)$,
  $ N_(j + 1) \( x \) = N_j \( x \) + N_j \( x - w \) . $
  Set $theta = c_(*) s \/ 2$ and introduce the potential
  $ Phi_j = bb(E)_(x in H) exp \( - theta N_j \( x \) \) . $
  Since $N_0 = upright(bold(1))_(cal(G))$, the bound on $beta$ gives
  $ Phi_0 = beta + \( 1 - beta \) e^(- theta) lt.eq e^(- 2 theta) + e^(- theta) \, wide log Phi_0 lt.eq - theta + 1 . $
  Most importantly, conditional on every shift chosen so far,
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(E)_w Phi_(j + 1) = bb(E)_(x \, w) e^(- theta N_j \( x \)) e^(- theta N_j \( x - w \)) =
     Phi_j^2 . $ <eq:sampler-potential-square>]
  The last equality uses the bijection $\( x \, w \) mapsto \( x \, x - w \)$ of $H times H$.
    It makes no independence assumption about the subset-sum labels themselves.
  Conditional Markov’s inequality applied to Equation (3.5) shows that
  $ bb(P) {log Phi_(j + 1) > 2 log Phi_j + theta delta thin mid(bar.v) thin upright("previous shifts")} lt.eq
    e^(- theta delta) . $
  There are $j_(*) lt.eq b$ steps. Except on an event of conditional probability at most $b e^(- theta delta)$,
    the recursion holds at every step and gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ log Phi_j lt.eq 2^j \( - theta + 1 \) + \( 2^j - 1 \) theta delta wide \( 0 lt.eq j lt.eq j_(*) \) .
     $ <eq:sampler-potential-iterate>]
  For each $x$, its single summand in the potential implies
  $ Phi_j gt.eq \| H \|^(- 1) e^(- theta N_j \( x \)) . $
  Combining this with Equation (3.6) yields
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(N_(j_(*)) \( x \), 2^(j_(*))) gt.eq 1 - delta - 1 / theta - frac(log \| H \|, theta 2^(j_(*))) gt.eq 1 -
     2 delta wide \( x in H \) . $ <eq:sampler-uniform-good-fraction>]
  For the last inequality, use $theta gt.eq \( c_(*) \/ 2 \) b^0.69$, $j_(*) gt.eq b^0.69 \/ 2$,
    and $log \| H \| lt.eq b^4$. Uniformly under these bounds, $1 \/ theta lt.eq
    delta \/ 2$ and $log \| H \| \/ \( theta 2^(j_(*)) \) lt.eq delta \/ 2$ once $b_0$ is sufficiently large.
  Finally, the full average factors as
  $ 2^(- s) sum_(epsilon in { 0 \, 1 }^s) g (x - sum_(i = 1)^s epsilon_i w_i) =
    2^(- j_(*)) sum_(eta in { 0 \, 1 }^(j_(*))) A (x - sum_(i = 1)^(j_(*)) eta_i w_(k + i)) . $
  On labels counted by $N_(j_(*)) \( x \)$, the summand is at least $\( 1 - delta \) macron(g)$;
    all other summands are nonnegative. Thus Equation (3.7) bounds this expression below by
  $ \( 1 - 2 delta \) \( 1 - delta \) macron(g) gt.eq \( 1 - 3 delta \) macron(g) \, $
  simultaneously for every $x$. By Equation (3.4), the total failure probability is at most
  $ e^(- c_(*) s) + b e^(- theta delta) lt.eq e^(- c_(*) b^0.69) + b e^(- \( c_(*) \/ 2 \) b^0.59) \, $
  as asserted. All thresholds used above are absolute. ◻
]

#prodef([Remark 3.2.])[
  (Uniformity and offsets).  The first stage controls only the proportion of bad base points.
    A direct union bound over $H$ would be insufficient under the allowed bound $log \| H \| lt.eq b^4$.
    The second-stage potential instead pays $log \| H \|$ in Equation (3.7),
    divided by an exponentially large number of labels. Once its conclusion holds,
    the base point can be replaced by any element of $H$, including an offset determined by other random columns.
    In particular, suppose a subset is chosen independently of the column values and its size lies in the range of
    Lemma 4. One may condition on that subset, apply the lemma to its columns,
    and then insert arbitrary offsets formed from the complementary columns.
    This observation will justify the biased-bit mixtures below.
]

== 4 Folded Gaussian blocks <sec:blocks>

We next turn the uniform Boolean sampler into a distribution adapted to Gaussian weights.
  The folded Gaussian and biased-bit description follow the setup of Li and Liu [3] Section 3 and [4] Section 2;
  all estimates required for the hierarchy are proved here.
  Throughout this section all constants, including the lower threshold on the integer block size $b$,
  are absolute. For a finite set or group, an expectation with an unqualified subscript denotes the uniform average.

Each point of a unit cube has two adjacent integer corrections in each coordinate, zero and one.
  We attach a Gaussian weight to every resulting bit vector.
  Summing these weights folds the Gaussian onto the cube; their normalized values form a product law on the bits.
  We retain cube locations where this sum has its typical size and no single bit vector carries too much weight.
  After discretizing the cube, a line subgroup lets us choose at most one usable location in each coset while
  retaining almost all of the mean weight. The preimage of that subgroup is one lattice.
  The next section will use these block lattices together.

=== 4.1 The folded distribution and its grid <the-folded-distribution-and-its-grid>

Set

#[#set math.equation(numbering: n => "(4.1)")
 $ h_b = sqrt(9 / 4 log b) \, wide f_b \( t \) = h_b gamma_1 \( h_b t \) + h_b gamma_1 \( h_b \( t - 1 \) \) \,
   wide F_b \( t \) = product_(j = 1)^b f_b \( t_j \) \, $ <eq:folded-density>]

where $0 lt.eq t lt.eq 1$ in the definition of $f_b$ and $t in \[ 0 \, 1 \]^b$ in that of $F_b$.
  At $t in \[ 0 \, 1 \]^b$, let $P_(b \, t)$ be the product probability distribution on ${ 0 \,
  1 }^b$ whose $j$th coordinate has probabilities

$ P_(b \, t) \( epsilon_j = e \) = frac(h_b gamma_1 \( h_b \( t_j - e \) \), f_b \( t_j \)) \, wide e in { 0 \, 1 } . $

Thus the following identity holds for every bit vector:

#[#set math.equation(numbering: n => "(4.2)")
 $ h_b^b gamma_b #scale(x: 120%, y: 120%)[\(] h_b \( t - epsilon \) #scale(x: 120%, y: 120%)[\)] =
   F_b \( t \) P_(b \, t) \( epsilon \) . $ <eq:folded-identity>]

Write

$ a_b = integral_0^1 f_b \( t \) thin d t \, wide mu_b = 1 / a_b integral_0^1 f_b \( t \) log f_b \( t \) thin d t . $

#thm([Lemma 4.1.])[
  (Folded Gaussian grid).  #emph[For every sufficiently large $b$, there is a prime $p_b$ satisfying
#[#set math.equation(numbering: n => "(4.3)")
 $ b mu_b - 4 b^0.56 lt.eq log p_b lt.eq b mu_b - 3 b^0.56 . $ <eq:block-prime>]

 Let $G_b = bb(F)_(p_b)^b$, and associate with $z in G_b$ the anchor $t_z = z \/ p_b in \[ 0 \, 1 \)^b$,
   using the representatives $0 \, dots.h \, p_b - 1$ in every coordinate.
   Define the eligible set $E_b subset G_b$ by the two conditions
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|log F_b \( t_z \) - b mu_b|) lt.eq b^0.56 \, wide \# {j : lr(|t_(z \, j) - 1 / 2|) lt.eq h_b^(- 2)} gt.eq
   b^0.70 . $ <eq:block-eligible>]

 Then
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E)_(z in G_b) F_b \( t_z \) = 1 + O \( b^(- 1 \/ 20) \) \, wide
   bb(E)_(z in G_b) F_b \( t_z \) upright(bold(1))_(E_b) \( z \) = 1 + O \( b^(- 1 \/ 20) \) . $ <eq:block-mass>]

 Moreover, $mu_b = log h_b + O \( 1 \)$. Put $eta_b = b h_b^2 \/ p_b$.
   If $t$ belongs to the grid cell $Q_z = t_z + \[ 0 \, p_b^(- 1) \)^b$, then, for every $epsilon in { 0 \, 1 }^b$,
#[#set math.equation(numbering: n => "(4.6)")
 $ e^(- eta_b) F_b \( t_z \) & lt.eq F_b \( t \) lt.eq e^(eta_b) F_b \( t_z \) \,\
e^(- eta_b) frac(F_b \( t_z \), p_b) P_(b \, t_z) \( epsilon \) & lt.eq h_b^b /
  p_b gamma_b #scale(x: 120%, y: 120%)[\(] h_b \( t - epsilon \) #scale(x: 120%, y: 120%)[\)] lt.eq
  e^(eta_b) frac(F_b \( t_z \), p_b) P_(b \, t_z) \( epsilon \) . $ <eq:block-rounding>]

 There is an absolute $c > 0$ such that, for every eligible $z$, every $t in Q_z$, and every $epsilon in { 0 \, 1 }^b$,
#[#set math.equation(numbering: n => "(4.7)")
 $ frac(F_b \( t_z \), p_b) P_(b \, t_z) \( epsilon \) lt.eq e^(- c b^0.70) \, wide h_b^b /
   p_b gamma_b #scale(x: 120%, y: 120%)[\(] h_b \( t - epsilon \) #scale(x: 120%, y: 120%)[\)] lt.eq
   e^(- c b^0.70) . $ <eq:block-atom>]

]
] <lem:folded-grid>

#proof[
  First, if $X$ is a standard normal random variable, then $a_b = bb(P) \( \| X \| lt.eq h_b \)$. The map
  $ X mapsto cases(delim: "{", X \/ h_b \, & X gt.eq 0 \,, 1 + X \/ h_b \, & X < 0) $
  pushes its conditional law on $\[ - h_b \, h_b \]$ to the probability density $f_b \/ a_b$ on $\[ 0 \, 1 \]$.
    At the resulting point $t$, one summand in $f_b \( t \)$ equals $h_b gamma_1 \( X \)$,
    whereas $f_b \( t \) lt.eq 2 h_b \/ sqrt(2 pi)$ everywhere. Consequently
  $ log h_b - 1 / 2 log \( 2 pi \) - 1 / 2 bb(E) \[ X^2 divides \| X \| lt.eq h_b \] lt.eq mu_b lt.eq log h_b +
    log 2 / sqrt(2 pi) . $
  The conditional second moment is bounded by an absolute constant, proving $mu_b = log h_b + O \( 1 \)$.
    The elementary Gaussian tail estimate also gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ 1 - a_b lt.eq C h_b^(- 1) e^(- h_b^2 \/ 2) = C h_b^(- 1) b^(- 9 \/ 8) \, wide
     integral_(\[ 0 \, 1 \]^b) F_b \( t \) thin d t = a_b^b = 1 - O \( b^(- 1 \/ 8) \) . $ <eq:folded-total-mass>]
  Here is an elementary way to choose the prime, avoiding any quantitative prime-gap input.
    Since $mu_b gt.eq log h_b - C arrow.r oo$, $T = b mu_b - 3 b^0.56$ is positive for large $b$.
    Set $l = floor.l e^T \/ 2 floor.r$. For a prime $q$, the factorial valuation formula gives
  $ v_q binom(2 l, l) = sum_(k gt.eq 1) (⌊frac(2 l, q^k)⌋ - 2 ⌊l / q^k⌋) lt.eq floor.l log_q \( 2 l \) floor.r . $
  Thus the power of each prime in the binomial coefficient is at most $2 l$.
    If all its prime divisors were at most $l \/ log \( 2 l \)$,
    their number would be at most $l \/ log \( 2 l \)$, and hence $log binom(2 l, l) lt.eq l$.
    This contradicts $binom(2 l, l) gt.eq 4^l \/ \( 2 l + 1 \) > e^l$ for large $l$.
    There is therefore a prime divisor $p_b$ with
  $ frac(l, log \( 2 l \)) < p_b lt.eq 2 l . $
  It follows that $T - O \( log T \) lt.eq log p_b lt.eq T$.
    Since $mu_b = O \( log log b \)$, we have $log T = O \( log b \) = o \( b^0.56 \)$;
    this proves Equation (4.3). In particular $p_b$ grows faster than every fixed power of $b$,
    and so does $1 \/ eta_b$.
  To prove the mass assertions, first work in the continuous cube with probability density $F_b \/ a_b^b$.
    Its coordinates are independent, and $log F_b$ has mean $b mu_b$.
    The function $log f_b$ takes values in an interval of length $O \( 1 + h_b^2 \)$:
    the upper bound was given above, and a nearest-endpoint summand gives $f_b \( t \) gt.eq
    h_b \( 2 pi \)^(- 1 \/ 2) e^(- h_b^2 \/ 8)$. Consequently
  $ "Var" \( log F_b \) lt.eq C b \( log b \)^2 \, wide bb(P) (lr(|log F_b - b mu_b|) > 1 / 2 b^0.56) lt.eq
    C b^(- 0.12) \( log b \)^2 = O \( b^(- 1 \/ 20) \) . $
  For one coordinate, on the interval $\| t - 1 \/ 2 \| lt.eq \( 2 h_b^2 \)^(- 1)$ we have $f_b \( t \) gt.eq
    c h_b e^(- h_b^2 \/ 8)$, with an absolute $c > 0$. Its probability under $f_b \/ a_b$ is therefore at least $c
    h_b^(- 1) b^(- 9 \/ 32)$. The number $N$ of coordinates in this interval is binomial with mean
  $ bb(E) N gt.eq c h_b^(- 1) b^(23 \/ 32) gt.eq 2 b^0.70 $
  for sufficiently large $b$, since $23 \/ 32 > 0.70$. Its variance is at most its mean, so
  $ bb(P) \( N < b^0.70 \) lt.eq frac(4, bb(E) N) lt.eq C h_b b^(- 23 \/ 32) = O \( b^(- 1 \/ 20) \) . $
  Thus a set of continuous $F_b$-mass $1 - O \( b^(- 1 \/ 20) \)$ satisfies the logarithmic eligibility condition
    with half its tolerance and the balanced-coordinate condition with half its interval width.
  For each $e in { 0 \, 1 }$ and $u in \[ 0 \, 1 \]$,
  $
    lr(|frac(d, d u) log #scale(x: 120%, y: 120%)[\(] h_b gamma_1 \( h_b \( u - e \) \)
    #scale(x: 120%, y: 120%)[\)]|) = h_b^2 \| u - e \| lt.eq h_b^2 . $
  The same bound holds for $\| \( log f_b \)' \|$, since its derivative is a weighted average of these two
    logarithmic derivatives. Integrating along the coordinates of a grid cell proves Equation (4.6).
    Rounding a continuous point down to its anchor changes $log
    F_b$ by at most $eta_b$ and every coordinate by less than $p_b^(- 1)$.
    Since $eta_b < 1 / 2 b^0.56$ and $p_b^(- 1) < \( 2 h_b^2 \)^(- 1)$ for large $b$,
    the stricter continuous event just considered rounds into $E_b$.
    In addition, summing the first bound in Equation (4.6) over all cells gives
  $ e^(- eta_b) bb(E)_z F_b \( t_z \) lt.eq integral_(\[ 0 \, 1 \]^b) F_b \( t \) thin d t lt.eq
    e^(eta_b) bb(E)_z F_b \( t_z \) . $
  Applying the corresponding comparison on cells whose anchors lie in $E_b$ gives the lower bound on their
    weighted grid mass. Its upper bound is the total grid mass.
    Equation (4.8) now proves both assertions in Equation (4.5).
  Finally, the odds of a coordinate bit at $t$ are
  #[#set math.equation(numbering: n => "(4.9)")
   $ frac(P_(b \, t) \( epsilon_j = 0 \), P_(b \, t) \( epsilon_j = 1 \)) =
     exp #scale(x: 120%, y: 120%)[\(] h_b^2 \( 1 \/ 2 - t_j \) #scale(x: 120%, y: 120%)[\)] . $ <eq:block-bit-odds>]
  On a balanced coordinate at an eligible anchor, each bit value has probability at least
    $alpha = \( 1 + e \)^(- 1)$. Therefore $P_(b \, t_z) \( epsilon \)
    lt.eq \( 1 - alpha \)^(b^0.70)$ for every $epsilon$. Equations (4.3) and (4.4) give $F_b \( t_z \) \/ p_b
    lt.eq e^(5 b^0.56)$. Since $0.56 < 0.70$, their product is at most $e^(- c b^0.70)$ after decreasing an
    absolute $c > 0$ and increasing the absolute threshold. Equation (4.6) proves the same assertion at all points
    of the cell, again decreasing $c$ if needed. ◻
]

The exponents are chosen to leave room between four different estimates:

$ 1 / 2 < 0.56 \, wide 0.56 / 0.9 < 0.65 < 0.69 < 0.70 < 23 / 32 . $

The information window exceeds the square-root fluctuation scale;
  the previous block’s weight cap fits the sampler; and the number of balanced coordinates exceeds the number of
  fair bits needed. The first block will have size about $\( log log n \)^2$,
  so $2 \( 0.70 \) > 1$ also makes its atom bound stronger than the final logarithmic loss.
  None of these values is intended to be optimal.

=== 4.2 Usable anchors and sparse line maxima <usable-anchors-and-sparse-line-maxima>

The next lemma has two roles. Most of the folded Gaussian mass is kept on anchors whose biased bits sample a
  prescribed preceding block uniformly in its base point. A suitable line in the new grid then permits this mass
  to be represented by one selected anchor in each coset.

#thm([Lemma 4.2.])[
  (Usable anchors).  #emph[There are absolute constants $A \, B > 0$ with the following property.
    Let $b gt.eq B$ be an integer, and use the objects in Lemma 6.
    Suppose that $H$ is a finite abelian group, $log \| H \| lt.eq b^4$, and $g_0 : H arrow.r \[ 0 \, oo \)$ satisfies
$ 1 / 2 lt.eq macron(g)_0 := bb(E)_(x in H) g_0 \( x \) lt.eq 2 \, wide g_0 \( x \) lt.eq
  exp \( 5 a^0.56 \) quad \( x in H \) $

 for some $1 lt.eq a lt.eq b^(1 \/ 0.9)$. Then one can choose shifts $w_1 \, dots.h \, w_b in H$,
   a usable set $U_b subset E_b$, and a one-dimensional linear subspace $C_b subset G_b$ such that,
   writing $W epsilon = sum_(j = 1)^b epsilon_j w_j$,
#[#set math.equation(numbering: n => "(4.10)")
 $ sum_(epsilon in { 0 \, 1 }^b) P_(b \, t_z) \( epsilon \) g_0 \( x - W epsilon \)
   gt.eq \( 1 - A b^(- 1 \/ 100) \) macron(g)_0 wide \( z in U_b \, med x in H \) . $ <eq:block-biased-sampler>]

 Define
#[#set math.equation(numbering: n => "(4.11)")
 $ v_b \( z \) = frac(F_b \( t_z \), p_b) upright(bold(1))_(U_b) \( z \) \, wide g_b \( x \) =
   max_(c in C_b) v_b \( x - c \) \, wide macron(g)_b = bb(E)_(x in G_b) g_b \( x \) . $ <eq:block-line-weight>]

 These choices satisfy
#[#set math.equation(numbering: n => "(4.12)")
 $ \| macron(g)_b - 1 \| lt.eq A b^(- 1 \/ 100) \, wide 0 lt.eq g_b \( x \) lt.eq
   exp \( 5 b^0.56 \) quad \( x in G_b \) \, wide lr(|bb(E)_z F_b \( t_z \) upright(bold(1))_(U_b) \( z \) - 1|)
   lt.eq A b^(- 1 \/ 20) . $ <eq:block-usable-bounds>]

 There is also a base version with no $H$, $g_0$, or $W$: take $U_b =
   E_b$ and choose $C_b$ so that the conclusions concerning $g_b$ in Equation (4.12) hold.]
] <lem:usable>

#proof[
  We first select $W$ and $U_b$ when preceding data are given. For large $b$, the bound on $a$ implies
  $ 5 a^0.56 lt.eq 5 b^(0.56 \/ 0.9) lt.eq b^0.65 \, $
  because $0.56 \/ 0.9 < 0.65$. Thus $g_0$ satisfies the cap in Lemma 4.
    Choose the columns $w_j$ independently and uniformly from $H$.
  Fix an eligible anchor $z$. A bit whose probability of being $1$ is $q$ has the following exact mixture
    representation: with probability $2 min \( q \, 1 - q \)$ use a fair bit,
    and otherwise use its more likely value. Make the mixture choices independently at the $b$ coordinates.
    Write $S subset { 1 \, dots.h \, b }$ for the coordinates chosen to be fair,
    and $d_j$ for the deterministic value at $j in.not S$. Conditional on these choices,
    the resulting vector has fair independent bits on $S$ and the values $d_j$ elsewhere;
    averaging these conditional laws recovers $P_(b \, t_z)$ exactly.
  By Equation (4.9), at least $b^0.70$ coordinates are selected into $S$ with probability at least $2 alpha$,
    where $alpha = \( 1 + e \)^(- 1)$. Apply Chebyshev’s inequality to the number selected among these
    coordinates. Its mean is at least $2 alpha b^0.70$, its variance is at most its mean,
    and $b^0.69$ is at most half its mean for sufficiently large $b$. Hence
  #[#set math.equation(numbering: n => "(4.13)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| S \| < b^0.69 #scale(x: 120%, y: 120%)[\)] = O \( b^(- 0.70) \) =
     O \( b^(- 1 \/ 2) \) . $ <eq:block-fair-count>]
  For any fixed $S$ with $b^0.69 lt.eq \| S \| lt.eq b$, its columns remain independent uniform elements of $H$.
    Lemma 4 therefore shows, with failure probability $O \( b^(- 1 \/ 2) \)$ over $W$, that
  $ 2^(- \| S \|) sum_(epsilon in { 0 \, 1 }^S) g_0 (y - sum_(j in S) epsilon_j w_j)
    gt.eq \( 1 - C b^(- 1 \/ 10) \) macron(g)_0 wide \( y in H \) . $
  The conclusion is simultaneous for every $y$. In particular it allows $y = x - sum_(j in.not S) d_j w_j$,
    even though that offset involves the other columns of $W$.
    There is no conditioning on those columns in applying the sampler to the selected ones.
  Let $q_W \( z \)$ be the mixture probability that either $\| S \| <
    b^0.69$ or the displayed uniform sampler conclusion fails for its selected columns.
    Equation (4.13) and Lemma 4 imply $bb(E)_W q_W \( z \) lt.eq C b^(- 1 \/ 2)$ for each eligible $z$.
    The weighted average is therefore bounded by
  $ bb(E)_W bb(E)_(z in G_b) F_b \( t_z \) upright(bold(1))_(E_b) \( z \) q_W \( z \) lt.eq
    C b^(- 1 \/ 2) bb(E)_z F_b \( t_z \) upright(bold(1))_(E_b) \( z \) lt.eq C' b^(- 1 \/ 2) . $
  Fix one $W$ for which the inner expectation is at most this last bound, and set
  $ U_b = { z in E_b : q_W \( z \) lt.eq b^(- 1 \/ 20) } . $
  Weighted Markov’s inequality gives the explicit discarded mass
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E)_z F_b \( t_z \) upright(bold(1))_(E_b \\ U_b) \( z \) lt.eq C' b^(- 1 \/ 2 + 1 \/ 20) =
     C' b^(- 9 \/ 20) . $ <eq:block-discarded-mass>]
  Together with Equation (4.5), this proves the last assertion of Equation (4.12).
    At every remaining anchor, average the uniform sampler conclusion over successful mixture components and use
    nonnegativity on the others. For all $x in H$ the result is at least
  $ \( 1 - b^(- 1 \/ 20) \) \( 1 - C b^(- 1 \/ 10) \) macron(g)_0 gt.eq \( 1 - A b^(- 1 \/ 100) \) macron(g)_0 \, $
  proving Equation (4.10).
  It remains to choose $C_b$. The following argument applies both to this $U_b$ and, in the base version,
    to $U_b = E_b$. Put
  $ M = bb(E)_z F_b \( t_z \) upright(bold(1))_(U_b) \( z \) = 1 + O \( b^(- 1 \/ 20) \) \, wide d =
    frac(\| U_b \|, p_b^b) . $
  The lower eligible weight gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ d lt.eq M e^(- b mu_b + b^0.56) lt.eq 2 e^(- b mu_b + b^0.56) . $ <eq:block-sparse-density>]
  Choose a line $C subset G_b$ uniformly among one-dimensional linear subspaces. For any fixed nonzero $u in G_b$,
  $ bb(P)_C \( u in C \) = frac(p_b - 1, p_b^b - 1) . $
  Consequently, for every $z in U_b$, the event $cal(C)_C \( z \)$ that $z +
    C$ contains another point of $U_b$ has probability at most
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(P)_C \( cal(C)_C \( z \) \) lt.eq \( \| U_b \| - 1 \) frac(p_b - 1, p_b^b - 1) lt.eq 2 p_b d lt.eq
     4 e^(- 2 b^0.56) . $ <eq:block-collision-probability>]
  The last inequality uses the upper bound in Equation (4.3).
  For a fixed line, write $S_C \( x \) = sum_(c in C) v_b \( x - c \)$ and $g_C \( x \) =
    max_(c in C) v_b \( x - c \)$. The normalization in Equation (4.11) ensures
  $ bb(E)_x S_C \( x \) = p_b bb(E)_z v_b \( z \) = M . $
  If a coset contains at most one usable anchor, its sum and maximum agree.
    Otherwise, charge their difference to all usable weights in that coset. This gives the pointwise bound
  $ 0 lt.eq S_C \( x \) - g_C \( x \) lt.eq sum_(c in C) v_b \( x - c \) upright(bold(1))_(cal(C)_C \( x - c \)) . $
  Averaging first over $x$ and then over $C$ yields
  #[#set math.equation(numbering: n => "(4.17)")
   $ bb(E)_C bb(E)_x \( S_C \( x \) - g_C \( x \) \) & lt.eq
     bb(E)_C [p_b bb(E)_z v_b \( z \) upright(bold(1))_(cal(C)_C \( z \))]\
 & = bb(E)_z F_b \( t_z \) upright(bold(1))_(U_b) \( z \) bb(P)_C \( cal(C)_C \( z \) \)\
 & lt.eq 4 M e^(- 2 b^0.56) . $ <eq:block-weighted-collision>]
  In particular the $p_b^(- 1)$ in $v_b$ cancels the $p_b$ translates in the coset sum;
    the estimate controls lost weight, not just the number of colliding cosets. Some line $C_b$ thus satisfies
  $ M - 4 M e^(- 2 b^0.56) lt.eq macron(g)_b lt.eq M . $
  This proves the mean assertion, in fact with the stronger error $O \( b^(- 1 \/ 20) \)$.
    Finally every usable anchor is eligible, so $v_b \( z \) lt.eq e^(5 b^0.56)$ by Equations (4.3) and (4.4);
    the same bound holds for its coset maximum. Enlarging the absolute constants $A \,
    B$ completes both versions of the lemma. ◻
]

#prodef([Remark 4.3.])[
  The function $g_b$ need not have a positive lower bound at every point:
    many cosets can contain no usable anchor. Its mean is close to one,
    and Equation (4.10) is what recovers that mean uniformly at the next stage.
    This distinction is essential when the blocks are assembled.
]

For use in that assembly, the grid construction has the following exact interpretation in a lattice.
  We identify elements of $C_b$ with their integer representatives when writing $C_b \/ p_b$.

#thm([Lemma 4.4.])[
  (From a coset to a Gaussian cell).  #emph[Let $L_b = bb(Z)^b + C_b \/ p_b$.
    For $t in bb(R)^b$ put $k = floor.l p_b t floor.r in bb(Z)^b$ and $x = k med \( mod med p_b \) in G_b$.
    Floors and fractional parts are taken coordinatewise. If $g_b \( x \) > 0$,
    choose $c in C_b$ attaining its maximum and let $z = x - c in U_b$, again using standard representatives. Then
#[#set math.equation(numbering: n => "(4.18)")
 $ lambda = frac(k - z, p_b) in L_b \, wide tau = t - lambda = frac(z + { p_b t }, p_b) in Q_z \, wide
   g_b \( x \) = frac(F_b \( t_z \), p_b) . $ <eq:block-cell-identity>]

 For all $epsilon in { 0 \, 1 }^b$, the point $lambda + epsilon$ lies in $L_b$, its residual $t - lambda -
   epsilon = tau - epsilon$ has coordinates in $\[ - 1 \, 1 \]$, and
#[#set math.equation(numbering: n => "(4.19)")
 $ h_b^b / p_b gamma_b #scale(x: 120%, y: 120%)[\(] h_b \( t - lambda - epsilon \) #scale(x: 120%, y: 120%)[\)]
   gt.eq e^(- eta_b) g_b \( x \) P_(b \, t_z) \( epsilon \) . $ <eq:block-cell-lower>]

 The corresponding individual weight is at most $e^(- c b^0.70)$.]
] <lem:block-cell>

#proof[
  The integer vector $k - z$ reduces to $c$ modulo $p_b$, proving $lambda in L_b$.
    The remaining identities in Equation (4.18) follow from $p_b t = k +
    { p_b t }$ and the chosen maximizing anchor. Adding an integer bit vector preserves $L_b$.
    Since $tau in \[ 0 \, 1 \)^b$, the residual coordinate bound follows.
    Apply Equations (4.6) and (4.7) at $tau in Q_z$ to obtain the stated lower and upper estimates. ◻
]

In the hierarchy below, the preceding group is $H = G_a$ with $a lt.eq b^(1 \/ 0.9)$.
  Its size satisfies the remaining hypothesis of Lemma 7, because

$ log \| G_a \| = a log p_a = O \( a^2 log log a \) lt.eq O \( b^(2 \/ 0.9) log log b \) lt.eq b^4 $

for sufficiently large $b$. Both this bound and the cap comparison in the proof have strict exponent margins.
  Thus the same absolute cutoff works at every level, independently of the number of blocks.

== 5 A hierarchy of branching lattice points <sec:hierarchy>

The preceding block estimates produce a function whose mean is close to one,
  although the function may vanish at many targets. We now arrange blocks in decreasing sizes.
  The bits in one block sample the mean of the preceding block;
  a final block of bounded size supplies a starting point. Keeping all the intermediate branches is what preserves
  their total weight. The data are chosen from the largest block to the smallest:
  each new block samples the function already fixed in its predecessor.
  For a given target, the lattice points are selected in the reverse order,
  starting with the terminal block and then choosing the earlier blocks conditional on the suffix already selected.

=== 5.1 The block sizes and the lattice <the-block-sizes-and-the-lattice>

Fix a sufficiently large absolute integer $B$, whose requirements will be specified below.
  Starting with an integer $b_1 gt.eq B$, form a finite list by putting

$ b_(i + 1) = ceil.l b_i^0.9 ceil.r $

whenever this number is at least $B$, and otherwise stopping. Let $r$ be the last index. Increasing $B$ ensures that

#[#set math.equation(numbering: n => "(5.1)")
 $ b_(i + 1) lt.eq 1 / 2 b_i \, wide B lt.eq b_r < B^(1 \/ 0.9) \, wide sum_(i = 1)^r b_i lt.eq
   2 b_1 . $ <eq:hierarchy-sizes>]

Use the notation of the preceding section at size $b_i$: $h_i = h_(b_i)$, $p_i = p_(b_i)$, $G_i =
  bb(F)_(p_i)^(b_i)$, $F_i = F_(b_i)$, and $P_(i \, t) = P_(b_i \, t)$.
  The eligible and usable anchors are always represented by $t_z = z \/ p_i in \[ 0 \, 1 \)^(b_i)$.

Apply Lemma 7 successively. In the first block there is no preceding function.
  In each subsequent block apply it to $g_(i - 1)$ on $G_(i - 1)$. Its hypotheses hold for sufficiently large $B$:
  if $b = b_i$, then $b_(i - 1) lt.eq b^(1 \/ 0.9)$ and

$ 5 b_(i - 1)^0.56 lt.eq b^0.65 \, wide log \| G_(i - 1) \| = b_(i - 1) log p_(i - 1) =
  O \( b_(i - 1)^2 log b_(i - 1) \) lt.eq b^4 . $

The first inequality uses $0.56 \/ 0.9 < 0.65$, and the second has the slack $2 \/ 0.9 < 4$.
  The means belong to $\[ 1 \/ 2 \, 2 \]$ after another increase of $B$.
  We obtain usable sets $U_i subset G_i$, lines $C_i subset G_i$, and, for $i < r$,
  matrices $W_i$ of size $b_i$ by $b_(i + 1)$ with entries in $bb(F)_(p_i)$. Thus

#[#set math.equation(numbering: n => "(5.2)")
 $ g_i \( x \) & = max_(c in C_i) frac(F_i \( t_(x - c) \), p_i) upright(bold(1))_(U_i) \( x - c \) \,\
\| macron(g)_i - 1 \| & lt.eq A b_i^(- 1 \/ 100) \, wide 0 lt.eq g_i lt.eq exp \( 5 b_i^0.56 \) \,
  $ <eq:hierarchy-functions>]

where $macron(g)_i = bb(E)_(x in G_i) g_i \( x \)$ and $A$ is absolute.
  Moreover, every $z in U_i$ with $i > 1$ satisfies

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(epsilon.alt in { 0 \, 1 }^(b_i)) P_(i \, t_z) \( epsilon.alt \) g_(i - 1) \( x - W_(i - 1) epsilon.alt \)
   gt.eq \( 1 - A b_i^(- 1 \/ 100) \) macron(g)_(i - 1) quad \( x in G_(i - 1) \) . $ <eq:hierarchy-biased-sampler>]

All constants in these estimates are independent of the number of blocks.

For $i lt.eq r$, define the raw coordinate lattice

#[#set math.equation(numbering: n => "(5.4)")
 $ L_i = bb(Z)^(b_i) + p_i^(- 1) C_i . $ <eq:hierarchy-raw-lattice>]

Here the right side means the union of the integer translates of the standard representatives divided by $p_i$;
  it is independent of the choice of representatives. It is a lattice of determinant $p_i^(- 1)$.
  Indeed, choose a generator $c$ of $C_i$ with its $j$th coordinate equal to $1$.
  The vector $c \/ p_i$ and the vectors $e_k$ for $k eq.not j$ are a basis:
  they generate $e_j = p_i \( c \/ p_i \) - sum_(k eq.not j) c_k e_k$ and all of $L_i$,
  and their determinant has absolute value $1 \/ p_i$.

Adjoin a terminal block of size

$ T = b_(r + 1) = b_r ceil.l log_2 p_r ceil.r \, wide h_(r + 1) = 1 \, wide L_(r + 1) = bb(Z)^T . $

Its size is bounded by a constant depending only on the fixed cutoff $B$.
  Define $W_r$, of size $b_r$ by $T$, by using the columns $2^k e_j med \( mod med p_r \)$ for each $1 lt.eq
  j lt.eq b_r$ and $0 lt.eq k < ceil.l log_2 p_r ceil.r$. Consequently

#[#set math.equation(numbering: n => "(5.5)")
 $ { W_r epsilon.alt : epsilon.alt in { 0 \, 1 }^T } = G_r . $ <eq:hierarchy-terminal-exhaustion>]

Use standard integer representatives for every $W_i$, and put

$ A_i = p_i^(- 1) W_i quad \( 1 lt.eq i lt.eq r \) \, wide L = product_(i = 1)^(r + 1) L_i \, wide D =
  sum_(i = 1)^(r + 1) b_i . $

Each entry of $A_i$ belongs to $\[ 0 \, 1 \)$ and is an integer multiple of $1 \/ p_i$.
  On raw block coordinates $ell = \( ell_1 \, dots.h \, ell_(r + 1) \)$,
  define the invertible block upper triangular map $M$ by

#[#set math.equation(numbering: n => "(5.6)")
 $ \( M ell \)_i = h_i \( ell_i + A_i ell_(i + 1) \) quad \( i lt.eq r \) \, wide \( M ell \)_(r + 1) =
   ell_(r + 1) . $ <eq:hierarchy-map>]

In particular, $Lambda_v = M L$ is a single full-rank lattice, with

#[#set math.equation(numbering: n => "(5.7)")
 $ D_v = det Lambda_v = product_(i = 1)^r h_i^(b_i) / p_i . $ <eq:hierarchy-determinant>]

The fractional off-diagonal entries do not change this conclusion:
  $M$ is one invertible linear map applied to the product lattice $L$.

#thm([Proposition 5.1.])[
  (Weighted vertical patterns).  #emph[There are absolute constants $B \, C \, c \, kappa > 0$ such that,
    for every integer $b_1 gt.eq B$, the construction above has
#[#set math.equation(numbering: n => "(5.8)")
 $ D lt.eq C \( b_1 + 1 \) \, wide R^2 := sum_(i = 1)^(r + 1) b_i h_i^2 lt.eq
   C #scale(x: 120%, y: 120%)[\(] b_1 log \( b_1 + 1 \) + 1 #scale(x: 120%, y: 120%)[\)] .
   $ <eq:hierarchy-dimension-radius>]

 For every $y in bb(R)^D$ there is a finite nonempty pattern $cal(P)_y subset L$ such that
#[#set math.equation(numbering: n => "(5.9)")
 $ parallel \( y - M ell \)_i parallel_oo & lt.eq h_i wide \( ell in cal(P)_y \, med 1 lt.eq i lt.eq r + 1 \) \,\
sum_(ell in cal(P)_y) D_v gamma_D \( y - M ell \) & gt.eq kappa \,\
max_(ell in cal(P)_y) D_v gamma_D \( y - M ell \) & lt.eq exp \( - c b_1^0.70 \) . $ <eq:hierarchy-residual>]

 The terminal block is constant on the pattern. For each ordinary block $i$ and each fixed suffix
   $\( ell_(i + 1) \, dots.h \, ell_(r + 1) \)$, its retained values belong to $lambda_i + { 0 \,
   1 }^(b_i)$ for one $lambda_i in L_i$ depending on that suffix. In particular $\| cal(P)_y \| lt.eq 2^D$.]
  #emph[Order the scalar coordinates by increasing block index and denote them by $ell \[ 1 \] \, dots.h \,
    ell \[ D \]$. Conditional on any fixed scalar suffix $ell \[ j + 1 \] \, dots.h \, ell \[ D \]$,
    the possible next values $ell \[ j \]$ are at most two; if there are two, they differ by $1$.
    This property is preserved upon deleting any subset of the pattern.]
  #emph[If $y in M \[ 0 \, 1 \)^D$, all raw coordinates can in addition be restricted to the fixed finite alphabets
#[#set math.equation(numbering: n => "(5.10)")
 $ ell_i & in #scale(x: 120%, y: 120%)[\(] p_i^(- 1) bb(Z) ∩ \[ - Q_(upright("raw")) \, Q_(upright("raw")) \]
   #scale(x: 120%, y: 120%)[\)]^(b_i) &  & \( i lt.eq r \) \,\
ell_(r + 1) & in #scale(x: 120%, y: 120%)[\(] bb(Z) ∩ \[ - Q_(upright("raw")) \, Q_(upright("raw")) \]
  #scale(x: 120%, y: 120%)[\)]^T \, &  & Q_(upright("raw")) = 1 + \( D + 2 \)^D . $ <eq:hierarchy-alphabets>]

 For an ordinary block the logarithm of each scalar alphabet size is $O \( D log \( D + 2 \) + b_i log b_i \)$;
   the terminal version omits the second term. All implicit constants are absolute.]
] <prop:vertical>

#proof[
  The size and radius bounds follow from Equation (5.1), the formula $h_i^2 = \( 9 \/ 4 \) log b_i$,
    and the absolute bound on $T$. We prove the weight estimates by an induction that allows an empty intermediate
    pattern.
  ===== 5.1.1 Truncated patterns. <truncated-patterns.>
  Retain just the ordinary blocks $1 \, dots.h \, i$, omitting the interaction of block $i$ with its successor.
    Write $M^(\[ i \])$ for this truncated map, $d_i = sum_(j lt.eq i) b_j$, and $D_v^(\[ i \]) =
    product_(j lt.eq i) h_j^(b_j) \/ p_j$. We claim that for every $y = \( y_1 \, dots.h \, y_i \) in
    bb(R)^(d_i)$ there is a pattern with total weight at least
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(ell in cal(P)_y^(\[ i \])) D_v^(\[ i \]) gamma_(d_i) \( y - M^(\[ i \]) ell \) gt.eq
     a_i g_i \( x_i \) \, wide x_i = floor.l p_i y_i \/ h_i floor.r med \( mod med p_i \) \, $ <eq:hierarchy-induction>]
  where
  #[#set math.equation(numbering: n => "(5.12)")
   $ a_i gt.eq product_(j = 1)^i \( 1 - C_0 b_j^(- 1 \/ 100) \) $ <eq:hierarchy-product>]
  for an absolute $C_0$. The residual and block-branching properties in the proposition are part of this
    induction. Empty patterns are permitted when $g_i \( x_i \) = 0$.
  Fix the lexicographic order on the standard representatives of each finite group; when a maximum has ties,
    choose the least maximizing anchor. Suppose $g_i \( x_i \) > 0$.
    Choose a usable anchor $z in x_i - C_i$ realizing the maximum in Equation (5.2).
    By Lemma 9 there is $lambda_i in L_i$ such that
  $ t = y_i \/ h_i - lambda_i in t_z + \[ 0 \, 1 \/ p_i \)^(b_i) . $
  Consider all choices $ell_i = lambda_i + epsilon.alt$, with $epsilon.alt in { 0 \, 1 }^(b_i)$.
    Their individual block weights satisfy
  #[#set math.equation(numbering: n => "(5.13)")
   $ h_i^(b_i) / p_i gamma_(b_i) \( h_i \( t - epsilon.alt \) \) gt.eq
     e^(- delta_i) frac(F_i \( t_z \), p_i) P_(i \, t_z) \( epsilon.alt \) \, wide delta_i =
     frac(b_i h_i^2, p_i) \, $ <eq:hierarchy-rounded-weight>]
  by Equation (4.6). Since each coordinate of $t$ is in $\[ 0 \, 1 \)$,
    the corresponding residual has absolute value at most $h_i$.
    For $i = 1$, summing Equation (5.13) over all bits proves Equation (5.11) with $a_1 = e^(- delta_1)$.
  For $i > 1$, attach the preceding induction pattern to each bit choice, using the modified target whose last block is
  $ tilde(y)_(i - 1) = y_(i - 1) - h_(i - 1) A_(i - 1) \( lambda_i + epsilon.alt \) \, $
  and whose earlier blocks are unchanged. This is allowed even when its preceding pattern is empty.
    The new preceding grid index is exactly $x - W_(i - 1) epsilon.alt$, where
  #[#set math.equation(numbering: n => "(5.14)")
   $ x = ⌊p_(i - 1) y_(i - 1) \/ h_(i - 1) - W_(i - 1) lambda_i⌋ med \( mod med p_(i - 1) \) .
     $ <eq:hierarchy-grid-shift>]
  Indeed, the vector $W_(i - 1) epsilon.alt$ is integral and hence commutes with the coordinate floor as a
    translation. The fixed vector $W_(i - 1) lambda_i$ need not be integral; in particular,
    no compatibility between the adjacent primes is required.
  Patterns attached to different bit vectors are disjoint because their last blocks differ.
    Since $F_i \( t_z \) \/ p_i = g_i \( x_i \)$, multiplying their weights by Equation (5.13) and summing over
    every bit vector gives total weight at least
  $ a_(i - 1) e^(- delta_i) g_i \( x_i \) sum_(epsilon.alt in { 0 \, 1 }^(b_i)) P_(i \, t_z) \( epsilon.alt \)
    g_(i - 1) \( x - W_(i - 1) epsilon.alt \) . $
  Equation (5.3) recovers the preceding mean from this sum. Thus we may take
  $ a_i & = a_(i - 1) e^(- delta_i) \( 1 - A b_i^(- 1 \/ 100) \) macron(g)_(i - 1)\
 & gt.eq a_(i - 1) e^(- delta_i) \( 1 - A b_i^(- 1 \/ 100) \) \( 1 - A b_(i - 1)^(- 1 \/ 100) \) \, $
  where the second line uses the mean bound in Equation (5.2).
    The prime estimates imply that $delta_i$ decays faster than any fixed negative power of $b_i$.
    As $b_(i - 1) gt.eq b_i$, increasing one absolute constant $C_0$ bounds the new multiplier below by $1 -
    C_0 b_i^(- 1 \/ 100)$ and yields Equation (5.12), including its base case.
    This step uses the weighted sum over all bits, not a choice of one successful bit.
  ===== 5.1.2 Summable losses. <summable-losses.>
  Set $a = 1 \/ 100$. Equation (5.1) gives the explicit bound
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_(j = 1)^r b_j^(- a) lt.eq b_r^(- a) sum_(k = 0)^(r - 1) 2^(- a k) lt.eq
     frac(B^(- a), 1 - 2^(- a)) . $ <eq:hierarchy-summability>]
  Choose $B$ so that $C_0 B^(- a) lt.eq 1 \/ 2$. Using $log \( 1 - u \) gt.eq - 2 u$ for $0 lt.eq u lt.eq 1 \/ 2$,
    the products in Equation (5.12) are bounded below by the positive absolute constant
  $ a_(*) := exp (- frac(2 C_0 B^(- a), 1 - 2^(- a))) . $
  This lower bound is independent of $r$ and $b_1$.
  ===== 5.1.3 The terminal correction. <the-terminal-correction.>
  For the full target $y$, choose a terminal raw point of the form $ell_(r + 1) = floor.l y_(r + 1) floor.r +
    epsilon.alt$. After accounting for its integer part, varying $epsilon.alt$ shifts the last ordinary grid index
    by $- W_r epsilon.alt$. By Equation (5.5) we can place that index at any point of $G_r$.
    Since $macron(g)_r gt.eq 1 \/ 2$, choose it at a point with $g_r gt.eq 1 \/ 2$.
    Apply Equation (5.11) to the first $r$ blocks with this fixed terminal contribution subtracted from $y_r$.
    Every coordinate of the terminal residual has absolute value at most one,
    and therefore its Gaussian factor is at least $\( 2 pi e \)^(- T \/ 2)$.
    If $T_(*) \( B \)$ is an upper bound for all possible terminal dimensions,
    the resulting full pattern has total weight at least
  $ kappa := 1 / 2 a_(*) \( 2 pi e \)^(- T_(*) \( B \) \/ 2) > 0 . $
  The cutoff $B$ is now fixed, so $kappa$ is absolute. This proves Equation (5.9) and, in particular, nonemptiness.
  ===== 5.1.4 Individual weights and branching. <individual-weights-and-branching.>
  Every retained point comes from a usable anchor in every ordinary block.
    The atom estimate in Equation (4.7), followed by the upper rounding estimate in Equation (4.6),
    bounds its individual normalized block weight by
  $ e^(delta_i) exp \( - c_0 b_i^0.70 \) lt.eq exp \( - c b_i^0.70 \) \, $
  after increasing $B$ and decreasing the absolute constant $c > 0$.
    The terminal Gaussian factor is at most $\( 2 pi \)^(- T \/ 2) lt.eq 1$.
    Multiplication over all blocks proves Equation (5.9). The preceding construction already proves all residual bounds.
  Different bit vectors at a recursive step have different last blocks.
    Thus a fixed suffix of later blocks identifies a unique recursive branch.
    On that branch the construction chose one base $lambda_i$ before enumerating its bits and retained a subset of
    its Boolean translate. Distinct branches are distinct raw lattice points.
    Once a scalar suffix is fixed, the next coordinate can therefore only be the corresponding coordinate of
    $lambda_i$ or that coordinate plus one. Further deletion of points cannot destroy this assertion.
    This proves the stated scalar suffix rule and the cardinality bound.
  ===== 5.1.5 Finite alphabets. <finite-alphabets.>
  Finally suppose $y = M z$ with $z in \[ 0 \, 1 \)^D$, and put $e_i = z_i - ell_i$.
    Equation (5.9) and the entry bounds on $A_i$ imply
  $ parallel e_(r + 1) parallel_oo lt.eq 1 \, wide parallel e_i parallel_oo lt.eq 1 +
    b_(i + 1) parallel e_(i + 1) parallel_oo lt.eq 1 + D parallel e_(i + 1) parallel_oo . $
  Backward iteration bounds all coordinates of $ell$ by $1 + \( D + 2 \)^D$.
    Also $L_i subset p_i^(- 1) bb(Z)^(b_i)$ and the terminal lattice is integral.
    These facts give Equation (5.10). Each ordinary scalar alphabet has at most $2 Q_(upright("raw")) p_i +
    1$ elements; $log p_i = O \( b_i log b_i \)$ gives its asserted logarithmic bound. ◻
]

For the covering construction we take $b_1 = ceil.l \( log log n \)^2 ceil.r$ once $n$ is sufficiently large.
  Proposition 10 then has $D = O \( \( log log n \)^2 + 1 \)$,
  and both $D$ and $R$ satisfy the polynomial bounds required in Lemma 2.

== 6 One shear and exact coverage <sec:final>

We extend the simultaneous Boolean-shift argument of Li and Liu [3] Theorem 4.3 to patterns whose branch bases may
  depend on later coordinates. Unit separation between siblings still allows one linear shear to treat every
  pattern in a finite family. Throughout this section all measures on a lattice torus are normalized Haar measures.

=== 6.1 A simultaneous shear for finitely many patterns <a-simultaneous-shear-for-finitely-many-patterns>

A labeled pattern in $bb(R)^q$ is a finite nonempty set of points, with one label assigned to each point.
  Call it #emph[binary by suffixes] if, after fixing any suffix of coordinates,
  the next coordinate has at most two possible values, and two such values always differ by $1$.
  For $q = 0$ a pattern is a single label. Such a pattern has at most $2^q$ points.
  Deleting points preserves the suffix rule; the result is again a pattern whenever it is nonempty.
  Taking a nonempty slice at the last coordinate and then deleting that coordinate also preserves the rule.

Figure 1 shows why a fixed global binary cube is not required.

#thm([Lemma 6.1.])[
  (Simultaneous shear).  #emph[Let $cal(T) = bb(R)^m \/ Lambda_h$,
    and let $U_a subset cal(T)$ be measurable sets with $\| U_a \| lt.eq eta_a$, where $eta_a > 0$.
    For $0 lt.eq q lt.eq D$, let $cal(P)_q$ be finite families of labeled patterns in $bb(R)^q$,
    binary by suffixes. Suppose they are closed under last-coordinate slicing. Write
$ Q = sum_(q = 0)^D \| cal(P)_q \| \, wide L_(*) > max \( 1 \, Q \) . $

 There are real vectors $Z_1 \, dots.h \, Z_D in bb(R)^m$ such that, for every $P in cal(P)_q$,
#[#set math.equation(numbering: n => "(6.1)")
 $ lr(|⋂_(l in P) (U_(a \( l \)) + pi_(Lambda_h) (sum_(j = 1)^q l \[ j \] Z_j))|) lt.eq
   L_(*)^(\| P \| - 1) product_(l in P) eta_(a \( l \)) . $ <eq:shear-bound>]

 Here $l \[ j \]$ denotes the $j$th scalar coordinate of $l$.]
] <lem:shear>

#proof[
  The assertion in dimension zero is the assumed bound on each $U_a$.
    Suppose $Z_1 \, dots.h \, Z_(q - 1)$ have been fixed so that all preceding estimates hold.
    A pattern with just one value of $l \[ q \]$ preserves its bound under the resulting common translation.
  Otherwise the two last-coordinate values are $v$ and $v + 1$.
    Let the two slices have cardinalities $k_1$ and $k_2$, and let $A$ and $B$ be their intersection sets.
    Choose $Z_q$ uniformly in a fixed fundamental parallelepiped of $Lambda_h$. Translation invariance gives
  $ \| \( A + pi \( v Z_q \) \) ∩ \( B + pi \( \( v + 1 \) Z_q \) \) \| = \| A ∩ \( B + pi \( Z_q \) \) \| . $
  This identity is valid even when $v$ is not an integer: the products $v Z_q$ and $\( v + 1 \)
    Z_q$ are formed in $bb(R)^m$ before projection. Only the relative shift must be Haar uniform. By Fubini,
  $ bb(E)_(Z_q) \| A ∩ \( B + pi \( Z_q \) \) \| = \| A \| \| B \| lt.eq
    L_(*)^(k_1 + k_2 - 2) product_(l in P) eta_(a \( l \)) . $
  Markov’s inequality bounds the probability of violating Equation (6.1) by $1 \/ L_(*)$.
    If either slice has measure zero the intersection has measure zero almost surely,
    which gives the same conclusion. A union bound over $cal(P)_q$ has total probability less than one,
    so one choice of $Z_q$ works for all its patterns. Induction proves the result. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$P$]])
  content((-2.7, -1.2), [#text(size: 9pt)[$P_v$]])
  content((2.7, -1.2), [#text(size: 9pt)[$P_(v+1)$]])
  line((-0.2516, -0.1118), (-2.393, -1.063), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((-1.35, -0.6), [#text(size: 9pt)[$l[q]=v$]], anchor: "south-east", padding: 0.1176cm)
  line((0.2516, -0.1118), (2.282, -1.014), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((1.35, -0.6), [#text(size: 9pt)[$l[q]=v+1$]], anchor: "south-west", padding: 0.1176cm)
  content((-4, -2.5), [#text(size: 9pt)[$P_(v,a)$]])
  content((-1.4, -2.5), [#text(size: 9pt)[$P_(v,a+1)$]])
  content((1.4, -2.5), [#text(size: 9pt)[$P_(v+1,b)$]])
  content((4, -2.5), [#text(size: 9pt)[$P_(v+1,b+1)$]])
  line((-2.957, -1.457), (-3.734, -2.234), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((-3.35, -1.85), [#text(size: 9pt)[$l[q-1]=a$]], anchor: "south-east", padding: 0.1176cm)
  line((-2.443, -1.457), (-1.666, -2.234), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((-2.05, -1.85), [#text(size: 9pt)[$a+1$]], anchor: "south-west", padding: 0.1176cm)
  line((2.434, -1.466), (1.666, -2.234), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((2.05, -1.85), [#text(size: 9pt)[$b$]], anchor: "south-east", padding: 0.1176cm)
  line((2.966, -1.466), (3.734, -2.234), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.16cm, fill: black)))
  content((3.35, -1.85), [#text(size: 9pt)[$b+1$]], anchor: "south-west", padding: 0.1176cm)
  line((-4, -2.766), (-4, -3.216), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1.4, -2.766), (-1.4, -3.216), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((1.4, -2.766), (1.4, -3.216), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((4, -2.766), (4, -3.216), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0, -3.4), [#text(size: 9pt)[Continue through the earlier coordinates.]])
})],
  caption: [Figure 1: The suffix rule used by the shear induction. The bases $a$ and $b$ may differ because the later coordinate has already been fixed. Only the separation of siblings is prescribed. Removing leaves, or an entire subtree, preserves the rule. ],
) <fig:suffix-tree>

=== 6.2 Removing a small hole <removing-a-small-hole>

The next argument is the classical completion-by-dilation method of Rogers [8].
  We use the small-dilation form also given by Fejes Tóth [2] Lemma 2,
  and include its proof for the single-lattice setting.

#thm([Lemma 6.2.])[
  (Completion).  #emph[Let $K subset bb(R)^n$ be a convex body and $Gamma$ a full-rank lattice.
    If its hole proportion $delta = 1 - \| pi_Gamma \( K \) \|$ satisfies
$ delta < \( 1 - delta \) k^(- n) $

 for a positive integer $k$, then $\( 1 + 1 \/ k \) K + Gamma = bb(R)^n$.]
] <lem:completion>

#proof[
  Multiplication by $k$ on $bb(R)^n \/ Gamma$ maps $pi_Gamma \( K \/ k \)$ onto $pi_Gamma \( K \)$.
    Its image has measure at most $k^n$ times the measure of the original set:
    partition a fundamental parallelepiped into $k^n$ cells on which the map is injective. Consequently
  $ \| pi_Gamma \( K \/ k \) \| gt.eq k^(- n) \( 1 - delta \) > delta . $
  For every point $x$ of the torus, the sets $pi_Gamma \( K \)$ and $x -
    pi_Gamma \( K \/ k \)$ have measures summing to more than one and therefore intersect.
    Thus $pi_Gamma \( K \) + pi_Gamma \( K \/ k \)$ is the whole torus.
    Finally, convexity gives $K + K \/ k = \( 1 + 1 \/ k \) K$.
    Neither symmetry nor the inclusion $0 in K$ is required. ◻
]

=== 6.3 Proof of the covering theorem <proof-of-the-covering-theorem>

#proof[
  All constants in the vertical construction, including its cutoff $B$, are fixed first.
    For sufficiently large $n$, put $s = log log n$ and use Proposition 10 with $b_1 = ceil.l s^2 ceil.r$.
    Retain its notation $L \, M \, D \, D_v \, b_i \, h_i$, and set
  $ R^2 = sum_(i = 1)^(r + 1) b_i h_i^2 \, wide m = n - D . $
  Here $D = O \( s^2 + 1 \)$ and $R$ is bounded by a fixed polynomial in $s$.
    After passing to the affine coordinates of Lemma 2, there are at most $\( C m^2 \)^D$ horizontal bodies $J_a$
    such that every $v$ with $parallel v parallel lt.eq R$ has a label satisfying
  #[#set math.equation(numbering: n => "(6.2)")
   $ J_a subset K_v \, wide c_(upright("sec")) "vol"_n \( K \) gamma_D \( v \) lt.eq "vol"_m \( J_a \) lt.eq
     C_(upright("sec")) "vol"_n \( K \) gamma_D \( v \) . $ <eq:final-sections>]
  Choose an absolute constant $C_(*)$ later and put
  #[#set math.equation(numbering: n => "(6.3)")
   $ rho = C_(*) n log n \, wide D_h = frac("vol"_n \( K \), rho D_v) \, wide u_a =
     frac("vol"_m \( J_a \), D_h) . $ <eq:target-density>]
  For any vertical target $y$, use its pattern from Proposition 10 and label each raw point $l$ by a body
    contained in the section at $y - M l$. The residual bound permits Equation (6.2).
    With the chosen horizontal covolume, the normalized section volume is comparable to the corresponding
    normalized Gaussian weight multiplied by $rho$:
  $ c_(upright("sec")) rho D_v gamma_D \( y - M l \) lt.eq u_(a \( l \)) lt.eq
    C_(upright("sec")) rho D_v gamma_D \( y - M l \) . $
  Thus the total weight supplies the sum of the horizontal loads,
    while the atom bound controls each load separately. These estimates give
  #[#set math.equation(numbering: n => "(6.4)")
   $ sum_l u_(a \( l \)) gt.eq c_3 rho \, wide max_l u_(a \( l \)) lt.eq U_n := C rho exp \( - c b_1^0.70 \) \,
     $ <eq:final-loads>]
  where $c_3 = c_(upright("sec")) kappa > 0$ is absolute.
  Three scale comparisons are needed. First,
  #[#set math.equation(numbering: n => "(6.5)")
   $ U_n / m lt.eq C' exp #scale(x: 120%, y: 120%)[\(] s - c' s^1.4 #scale(x: 120%, y: 120%)[\)] arrow.r
     0 . $ <eq:load-upper-check>]
  Second, every pattern has at most $2^D$ points, so deleting those with $u_(a \( l \)) < sqrt(m)$ loses at most
  #[#set math.equation(numbering: n => "(6.6)")
   $ 2^D sqrt(m) = n^(1 \/ 2 + o \( 1 \)) = o \( rho \) . $ <eq:load-discard-check>]
  Third, the logarithm of the number of labels is $O \( D log m \) = o \( sqrt(m) \)$.
    These statements follow from $D = O \( s^2 + 1 \)$ and $log n = e^s$;
    all their constants are independent of $K$. In particular the retained pattern is nonempty and has load at
    least $c_3 rho \/ 2$ for large $n$.
  Restrict the label list to $sqrt(m) lt.eq u_a lt.eq U_n$.
    Lemma 3 gives one lattice $Lambda_h$ of covolume $D_h$ for which the hole sets
  $ U_a = \( bb(R)^m \/ Lambda_h \) \\ pi_(Lambda_h) \( J_a \) $
  satisfy $\| U_a \| lt.eq e^(- u_a \/ 2)$ simultaneously. We next select one shear that works for every retained
    pattern, not a separate shear for each target.
  ===== 6.3.1 A finite family for all targets. <a-finite-family-for-all-targets.>
  Initially restrict to $y = M z$ with $z in \[ 0 \, 1 \)^D$.
    This is enough because $L$ contains $bb(Z)^D$; after the final lattice is defined,
    integer raw translations will reduce any target to this region.
    The finite-alphabet conclusion of Proposition 10 places each scalar raw coordinate in
    $\[ - Q_(upright("raw")) \, Q_(upright("raw")) \]$, where $Q_(upright("raw")) = 1 + \( D + 2 \)^D$.
    In block $i lt.eq r$ it is a multiple of $1 \/ p_i$; in the terminal block it is an integer.
    The logarithmic alphabet size is therefore at most
  $ O \( D log \( D + 2 \) + max_i log p_i \) = O \( s^(c_0) \) $
  for some fixed absolute exponent $c_0$.
  Order scalar coordinates by increasing block index, and take $cal(P)_q$ to be #emph[all] labeled patterns on the
    first $q$ coordinate alphabets that are binary by suffixes, for $0 lt.eq q lt.eq D$.
    This includes every retained full pattern: the base in a block depends only on later blocks,
    and deleting points cannot introduce a third value at any suffix. The families are closed under slicing.
  Let $cal(A)_j$ be the alphabet of scalar coordinate $j$, and let $N_(upright("lab"))$ be the number of retained
    section labels. A labeled point consists of a coordinate tuple and one such label, so $N =
    N_(upright("lab")) product_(j = 1)^D \| cal(A)_j \|$ bounds their number in each of these coordinate spaces.
    Consequently
  $ log \( N + 1 \) = O \( D log n + s^(c_1) \) \, wide Q :=
    sum_(q = 0)^D \| cal(P)_q \| lt.eq \( D + 1 \) \( N + 1 \)^(2^D) . $
  For example, the last bound follows by encoding a set of at most $2^D$ points as a list of that length,
    padded with a dummy symbol. Take $L_(*) = 2 \( Q + 1 \)$. Then
  #[#set math.equation(numbering: n => "(6.7)")
   $ 2^D log L_(*) lt.eq C 4^D \( D log n + s^(c_1) \) + C 2^D log \( D + 2 \) = o \( n log n \) . $ <eq:pattern-cost>]
  Indeed $4^D$ times any fixed polynomial in $s$ is $exp \( O \( s^2 \) \) = o \( n \)$.
  ===== 6.3.2 The covering lattice. <the-covering-lattice.>
  Apply Lemma 11 with $eta_a = e^(- u_a \/ 2)$ and set $Z l = sum_(j = 1)^D l \[ j \] Z_j$. Define
  #[#set math.equation(numbering: n => "(6.8)")
   $ Gamma = { \( h + Z l \, M l \) : h in Lambda_h \, med l in L } . $ <eq:full-lattice>]
  It is a full-rank lattice, being the image of the product lattice $Lambda_h times
    L$ under an invertible block triangular linear map. Its covolume is exactly $D_h D_v$,
    so $"vol"_n \( K \) \/ det Gamma = rho$.
  For a fixed $y$ and a retained labeled pattern, each $J_(a \( l \))$ lies in the section $K_(y - M l)$.
    The uncovered horizontal points of $K + Gamma$, viewed in $cal(T) = bb(R)^m \/ Lambda_h$, therefore lie in
  $ ⋂_l #scale(x: 120%, y: 120%)[\(] U_(a \( l \)) + pi_(Lambda_h) \( Z l \) #scale(x: 120%, y: 120%)[\)] . $
  For $y in M \[ 0 \, 1 \)^D$, Lemma 11 and the retained load give the uniform bound
  #[#set math.equation(numbering: n => "(6.9)")
   $ upright("horizontal hole fraction at ") y lt.eq exp (2^D log L_(*) - frac(c_3 rho, 4)) . $ <eq:uniform-holes>]
  For other $y$, reduce $M^(- 1) y$ modulo $bb(Z)^D$ and translate by the corresponding point $\( Z k \, M k \) in
    Gamma$. This only translates the horizontal section on its torus, so the same bound holds.
  Let $F_h \, F_v$ be fundamental parallelepipeds of $Lambda_h$ and $M L$.
    Their product is a measurable fundamental domain for $Gamma$:
    first reduce the vertical coordinate using a point $\( Z l \, M l \)$,
    and then reduce the horizontal coordinate using $Lambda_h$.
    The union $K + Gamma$ is closed, since translates of the compact set $K$ by a lattice are locally finite.
    Its complement is therefore measurable, and Fubini integrates Equation (6.9) over $F_v$.
    No measurable selection of auxiliary patterns is needed. Equations (6.3) and (6.7) yield
  $ delta := 1 - \| pi_Gamma \( K \) \| lt.eq exp (o \( n log n \) - frac(c_3 C_(*), 4) n log n) lt.eq n^(- 2 n) $
  once $C_(*)$ is a sufficiently large absolute constant and then $n$ is sufficiently large.
    Since $n^(- 2 n) < \( 1 - n^(- 2 n) \) n^(- n)$ for $n gt.eq 2$, Lemma 12 with $k =
    n$ gives $\( 1 + 1 \/ n \) K + Gamma = bb(R)^n$. Thus
  $ Lambda = \( 1 + 1 \/ n \)^(- 1) Gamma $
  is a single covering lattice for $K$, of density
  $ frac("vol"_n \( K \), det Lambda) = \( 1 + 1 \/ n \)^n rho lt.eq e C_(*) n log n . $
  ===== 6.3.3 Affine invariance and the remaining dimensions. <affine-invariance-and-the-remaining-dimensions.>
  Translations of a body do not change the covering property,
    and invertible linear maps applied to both body and lattice preserve density.
    Hence the affine normalization can be undone.
  There remains only a fixed finite set of dimensions. In each such dimension choose a maximum-volume simplex with
    vertices in $K$, which exists by compactness and has positive volume.
    Put its vertices at $0 \, e_1 \, dots.h \, e_n$ by an affine map.
    Replacing the $j$th nonzero vertex by any $x in K$ changes the determinant to $x_j$,
    so maximality gives $\| x_j \| lt.eq 1$. Thus
  $ \[ 0 \, 1 \/ n \]^n subset K subset \[ - 1 \, 1 \]^n . $
  The lattice $n^(- 1) bb(Z)^n$ covers by translates of the smaller cube and therefore of $K$,
    with density at most $\( 2 n \)^n$. The maximum of $\( 2 n \)^n \/ \( n log n \)$ over the remaining finite
    set can be absorbed in one absolute constant. This proves the theorem for every $n gt.eq 2$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Ronen Eldan and Bo'az Klartag, #emph[Pointwise estimates for marginals of convex bodies],
  Journal of Functional Analysis #strong[254] (2008), no.~8, 2275--2293.
  #link("https://doi.org/10.1016/j.jfa.2007.08.014")[doi:10.1016/j.jfa.2007.08.014].
  #link("https://arxiv.org/abs/0708.2513v1")[arXiv:0708.2513v1].]
#bibitem([2])[Gábor Fejes Tóth, #emph[A note on covering by convex bodies],
  Canadian Mathematical Bulletin #strong[52] (2009), no.~3, 361--365.
  #link("https://doi.org/10.4153/CMB-2009-039-x")[doi:10.4153/CMB-2009-039-x].]
#bibitem([3])[Heng Li and Xizhi Liu, #emph[Nearly sharp bounds for lattice coverings by convex bodies], preprint,
  version~2, 10~August 2026. #link("https://arxiv.org/abs/2607.28429v2")[arXiv:2607.28429v2].]
#bibitem([4])[Heng Li and Xizhi Liu, #emph[Two-stage binary correction for nearly linear lattice coverings],
  unpolished manuscript, 2026.
  #link("https://github.com/xliu2022/xliu2022.github.io/blob/4b360838cb034784293bb6ba2128483fcec6e3ce/Unpolished_Manuscripts/Two-Stage%20Binary%20Correction%20for%20Nearly%20Linear%20Lattice%20Coverings.pdf")[Author-hosted
  manuscript], accessed 23~September 2026.]
#bibitem([5])[Or Ordentlich, Oded Regev, and Barak Weiss, #emph[New bounds on the density of lattice coverings],
  Journal of the American Mathematical Society #strong[35] (2022), no.~1, 295--308.
  #link("https://doi.org/10.1090/jams/984")[doi:10.1090/jams/984].
  #link("https://arxiv.org/abs/2006.00340v1")[arXiv:2006.00340v1].]
#bibitem([6])[C.~A. Rogers, #emph[A note on coverings], Mathematika #strong[4] (1957), no.~1, 1--6.
  #link("https://doi.org/10.1112/S0025579300001030")[doi:10.1112/S0025579300001030].]
#bibitem([7])[C.~A. Rogers, #emph[Lattice coverings of space:
  The Minkowski--Hlawka theorem], Proceedings of the London Mathematical Society (3) #strong[8] (1958), 447--465.
  #link("https://doi.org/10.1112/plms/s3-8.3.447")[doi:10.1112/plms/s3-8.3.447].]
#bibitem([8])[C.~A. Rogers, #emph[Lattice coverings of space], Mathematika #strong[6] (1959), no.~1, 33--39.
  #link("https://doi.org/10.1112/S002557930000190X")[doi:10.1112/S002557930000190X].]
#bibitem([9])[Wolfgang M. Schmidt, #emph[The measure of the set of admissible lattices],
  Proceedings of the American Mathematical Society #strong[9] (1958), 390--403.
  #link("https://doi.org/10.2307/2032994")[doi:10.2307/2032994].]
