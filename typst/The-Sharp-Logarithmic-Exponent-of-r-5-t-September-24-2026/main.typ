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

#align(center)[#text(size: 16pt, weight: "bold")[The sharp logarithmic exponent of $r \( 5 \, t \)$]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For integers $s \, t gt.eq 2$, the Ramsey number $r \( s \, t \)$ is the least integer $n$ such that every simple graph on $n$ vertices contains either a complete graph $K_s$ or an independent set of size $t$. We determine the logarithmic exponent in the off-diagonal case $s = 5$. We write $alpha \( G \)$ for the largest size of an independent set in $G$. All logarithms are natural.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C > 0$ such that, for every $epsilon > 0$, all sufficiently large integers $t$ satisfy 
$ frac(t^4, \( log t \)^(3 + epsilon)) med lt.eq med r \( 5 \, t \) med lt.eq med C frac(t^4, \( log t \)^3) . $

 The threshold for $t$ may depend on $epsilon$. Consequently, 
$ lim_(t arrow.r oo) frac(4 log t - log r \( 5 \, t \), log log t) = 3 . $

]
] <thm:main>

The theorem resolves the sharp logarithmic-exponent question for $r \( 5 \, t \)$. It leaves open a constant-factor asymptotic for $t^4 \/ \( log t \)^3$.

=== 1.1 History and contribution <history-and-contribution>

Erdős and Szekeres proved the classical bound $r \( s \, t \) lt.eq binom(s + t - 2, s - 1)$ #cite(label("ErdosSzekeres1935")). Ajtai, Komlós and Szemerédi improved its fixed-$s$ order to $O \( t^(s - 1) \/ \( log t \)^(s - 2) \)$ #cite(label("AKS1980")). Li, Rousseau and Zang subsequently obtained leading upper constant $1 + o \( 1 \)$ for fixed $s$ #cite(label("LiRousseauZang2001")). We include an elementary proof of the upper bound with an absolute constant for $s = 5$, using uniform independent sets and random sampling.

The lower-bound problem has followed a different course. Kim proved that $r \( 3 \, t \)$ has order $t^2 \/ log t$, matching the classical upper bound in order #cite(label("Kim1995")). For $s = 5$, Spencer’s local-lemma method gave a lower bound of order $\( t \/ log t \)^3$ #cite(label("Spencer1977")); the analysis of the random clique-free process by Bohman and Keevash improved this to $t^3 \/ \( log t \)^(8 \/ 3)$, up to a constant factor #cite(label("BohmanKeevash2010")) Theorem 1.2. Thus even the power of $t$ in the upper bound remained out of reach by these methods. Finite geometry supplied a different route: Mattheus and Verstraëte proved $r \( 4 \, t \) gt.eq c t^3 \/ \( log t \)^4$ using a construction based on Hermitian unitals #cite(label("MattheusVerstraete2024")).

Bradač’s projective construction gives

$ r \( s \, t \) gt.eq c_s frac(t^(s - 1), \( log t \)^(2 s - 4)) #h(2em) \( s gt.eq 3 \, med t gt.eq 2 \) $

#cite(label("Bradac2026")) Theorem 1.1. For $s = 5$, its logarithmic exponent is $6$. We use the ordered projective-flag graph and adapt the marking argument from Section 2.5 of that paper. The improvement here is in the analysis of long independent sequences, closing the remaining gap from exponent $6$ to exponent $3 + o \( 1 \)$. Earlier graphs on ordered incidence pairs appear in the work of Codenotti, Pudlák and Resta and of Kostochka, Pudlák and Rödl #cite(label("CodenottiPudlakResta2000")) #cite(label("KostochkaPudlakRodl2010")). The distinction between steps with few choices and steps which substantially reduce the remaining choices is also central to Alon and Rödl’s independent-set counting method #cite(label("AlonRodl2005")). Our compression must account for the extra bias created by choosing an independent sequence from a random stream.

The principal additional ingredient is a description theorem for sparse point–hyperplane pairs. If two large sets have much fewer incidences than the ambient density $1 \/ q$, a short message describes a moderately larger set containing a constant fraction of the smaller set. The message consists of samples selected from public random tables, together with geometric data. A score formed from several independent Poisson samples distinguishes most training points from most ambient points. Polynomial bounds for rich lines and planes control the dependencies in its high moments.

This description theorem is used inside an entropy argument. The consistent sequence selected from a random stream has a possibly highly biased law. We retain that law throughout, using conditional entropy to choose representatives and to pay for every message. A balanced tree of incidence tests successively reduces the sets available to the decoder. This separates the geometric description problem from the question of how to use its output under adaptive conditioning.

=== 1.2 Proof overview <proof-overview>

Fix a small $eta > 0$ and a large prime $q$. We construct a $K_5$-free graph on roughly $q^4 log q$ positions whose independent sets have fewer than $q \( log q \)^(1 + eta)$ positions. A position receives a random incident pair $\( a \, b \)$, where $a$ is a point of $"PG" \( 4 \, q \)$ and $b$ is a hyperplane containing it. For positions $i < j$, place an edge when $a_i$ lies on $b_j$ but $a_j$ does not lie on $b_i$. A five-clique would give five linearly independent points in one hyperplane.

Suppose every stream contained a long independent sequence, and select one. We call its ordered flag tuple #emph[consistent]. Even after auxiliary choices and conditioning on an event of probability bounded below, each possible selected tuple is unlikely: it must occur at some set of positions in the original stream. This gives an entropy lower bound exceeding $4 log q$ per flag by a term of order $eta log log q$.

Two marking scans give almost every flag a set of at most $C q^4$ joint possibilities. They also give separate bounds for its two endpoints. Revealing a small number of representative flags lowers the remaining mutual information. Consistency then has a geometric consequence: most nearly independent pairs of endpoint laws have very few incidences, except for collisions inside specific subspace rectangles. A uniform occupancy bound on the original stream controls those collisions.

The sparse-pair description theorem now applies to suitable nearly uniform parts of the endpoint laws. Its output supplies samples for fresh incidence tests. A balanced tree arranges these tests so that the total description length is small. The tests retain a constant fraction of the sequence while reducing the decoder’s available domains. A bounded number of repetitions makes the marking description shorter than the entropy lower bound, a contradiction.

Sections 2 and 3 establish the upper bound and the flag-stream framework. The sparse-pair theorem is stated in Section 4; the following compression argument proves the stream construction from it. Its proof is then given in Sections 7–10, including the finite-field geometry and the score estimates. Section 11 converts the stream parameters to Theorem 1.

== 2 The classical upper bound <sec:upper>

We first prove the upper bound, independently of the construction used for the lower bound. The estimate is classical #cite(label("AKS1980")). Our proof uses the uniform-independent-set method of Alon #cite(label("Alon1996")); see also Shearer #cite(label("Shearer1983")) for the triangle-free independence bound and Davies, Jenssen, Perkins, and Roberts #cite(label("DJPR2018")) for sharp occupancy estimates.

#thm([Theorem 2.1.])[
  #emph[There is an absolute constant $C$ such that, for every integer $t gt.eq 2$, 
$ r \( 5 \, t \) lt.eq C frac(t^4, \( log t \)^3) . $

]
] <thm:upper>

The proof has two ingredients. A triangle-free graph has an independent set larger than the greedy bound by a logarithmic factor. A graph whose adjacent pairs have few common neighbors contains a sufficiently large triangle-free subgraph after random sampling. Applying these facts successively to $K_4$-free and $K_5$-free graphs gives the three powers of $log t$.

#thm([Lemma 2.2.])[
  #emph[Let $H$ be a finite triangle-free graph on $n$ vertices, and let $D gt.eq 1$ be a real upper bound on its maximum degree. Then 
$ alpha \( H \) gt.eq frac(n log \( D + 1 \), 8 \( D + 1 \)) . $

]
] <lem:occupancy>

#proof[
  We may assume $n > 0$. Choose an independent set $I$ uniformly from all independent sets of $H$, including the empty set, and put $mu = bb(E) \| I \| \/ n$. Fix a vertex $x$ and condition on $I$ outside the closed neighborhood $N \[ x \] = N \( x \) union { x }$. Let $Z_x$ be the number of neighbors of $x$ having no neighbor in this fixed outside set. These $Z_x$ vertices are pairwise nonadjacent. The possible completions inside $N \[ x \]$ are therefore ${ x }$ and the $2^(Z_x)$ subsets of those neighbors. It follows that
  $ Pr \( x in I divides I \\ N \[ x \] \) = frac(1, 1 + 2^(Z_x)) gt.eq 1 / 2 thin 2^(- Z_x) \, #h(2em) bb(E) \( \| I ∩ N \( x \) \| divides I \\ N \[ x \] \) gt.eq Z_x / 4 . $
  The second inequality follows by summing over the subsets; its left side is $Z_x 2^(Z_x - 1) \/ \( 1 + 2^(Z_x) \)$, with value zero when $Z_x = 0$.
  Now choose $X$ uniformly from the vertices, independently of $I$. Double counting gives
  $ bb(E) Z_X lt.eq 4 / n sum_v deg \( v \) Pr \( v in I \) lt.eq 4 D mu . $
  Jensen’s inequality for the convex function $z mapsto 2^(- z)$ yields
  #[#set math.equation(numbering: n => "(1)")
   $ mu gt.eq 1 / 2 bb(E) 2^(- Z_X) gt.eq 1 / 2 thin 2^(- 4 D mu) . $ <eq:occupancy-fixed-point>]
  Write $u = D + 1$. If $mu < log u \/ \( 8 u \)$, then $4 D mu log 2 < 1 / 2 log u$, so (1) gives $mu > 1 \/ \( 2 sqrt(u) \)$. But $log u lt.eq sqrt(u)$ for $u gt.eq 1$, and the assumed inequality gives $mu < 1 \/ \( 8 sqrt(u) \)$, a contradiction. Finally, $alpha \( H \) gt.eq bb(E) \| I \| = n mu$. ◻
]

The degree parameter in Lemma 3 need not equal the actual maximum degree. In particular, the lemma also applies to edgeless graphs by taking any $D gt.eq 1$.

#thm([Lemma 2.3.])[
  #emph[Let $G$ be a finite graph on $n$ vertices with maximum degree $d > 0$. Suppose every adjacent pair has at most $m$ common neighbors, where $m > 0$, $d m gt.eq 1$, and $p = \( d m \)^(- 1 \/ 2)$ satisfies $p d gt.eq 1$. Then $G$ has an induced triangle-free subgraph $H$ with 
$ \| V \( H \) \| gt.eq 3 / 4 p n \, #h(2em) Delta \( H \) lt.eq 12 p d . $

]
] <lem:sample-triangle-free>

#proof[
  Write $e \( G \)$ and $T \( G \)$ for the numbers of edges and triangles. Each triangle is counted at its three edges, so
  $ 3 T \( G \) = sum_(x y in E \( G \)) \| N \( x \) ∩ N \( y \) \| lt.eq m e \( G \) lt.eq frac(n d m, 2) . $
  Retain each vertex independently with probability $p$, obtaining a set $S$. By linearity of expectation,
  $ bb(E) [\| S \| - T \( G \[ S \] \) - frac(2 e \( G \[ S \] \), 12 p d)] & gt.eq p n - frac(p^3 n d m, 6) - frac(p^2 n d, 12 p d)\
 & = 3 / 4 p n . $
  Choose a realization at least as large as this expectation. Delete all vertices having degree greater than $12 p d$ in the original graph $G \[ S \]$; there are at most $2 e \( G \[ S \] \) \/ \( 12 p d \)$ such vertices. Then delete one vertex from each remaining triangle until no triangle remains. The latter procedure uses at most $T \( G \[ S \] \)$ further vertices. The remaining induced graph has the required order and maximum degree. ◻
]

#proof[
  We prove the estimates for sufficiently large $t$; increasing the final constant covers the finitely many smaller values. First, if $G$ is triangle-free and $alpha \( G \) < t$, every neighborhood is independent, so its maximum degree is at most $t - 1$. Lemma 3, with $D = t - 1$, gives $\| V \( G \) \| < 8 t^2 \/ log t$. Consequently
  #[#set math.equation(numbering: n => "(2)")
   $ r \( 3 \, t \) lt.eq C_3 frac(t^2, log t) $ <eq:ramsey-three-upper>]
  for an absolute constant $C_3$.
  Next let $s in { 4 \, 5 }$, and suppose $G$ is $K_s$-free with $alpha \( G \) < t$. Put $n = \| V \( G \) \|$ and $d = Delta \( G \)$. Every neighborhood is $K_(s - 1)$-free and has independence number below $t$, whence $d < r \( s - 1 \, t \)$. The common neighborhood of an edge is $K_(s - 2)$-free. Thus an upper bound on every adjacent codegree is
  $ m = cases(delim: "{", t \, & s = 4 \,, r \( 3 \, t \) \, & s = 5 .) $
  Here the first case uses the fact that this common neighborhood is independent, and the second uses that it is triangle-free.
  If $d lt.eq t^(s - 5 \/ 2)$, greedy selection gives $n < t \( d + 1 \)$: repeatedly choose a vertex for an independent set and remove its closed neighborhood, which has at most $d + 1$ vertices. Hence
  $ n lt.eq 2 t^(s - 3 \/ 2) = o #h(-0.16667em) (frac(t^(s - 1), \( log t \)^(s - 2))) . $
  Otherwise set $p = \( d m \)^(- 1 \/ 2)$. For $s = 4$ we have $p d > t^(1 \/ 4)$. For $s = 5$, (2) gives
  $ p d = sqrt(d \/ m) gt.eq C_3^(- 1 \/ 2) t^(1 \/ 4) sqrt(log t) gt.eq t^(1 \/ 5) $
  for all sufficiently large $t$. The hypotheses of Lemma 4 therefore hold. Its subgraph $H$ still satisfies $alpha \( H \) < t$. Applying Lemma 3 with $D = 12 p d$ gives
  $ t > alpha \( H \) gt.eq frac(\( 3 \/ 4 \) p n log \( 12 p d + 1 \), 8 \( 12 p d + 1 \)) gt.eq c frac(n log t, d) $
  for an absolute $c > 0$. We conclude that
  #[#set math.equation(numbering: n => "(3)")
   $ n lt.eq C frac(t d, log t) lt.eq C frac(t thin r \( s - 1 \, t \), log t) $ <eq:ramsey-upper-step>]
  in the large-degree case.
  Apply this argument first with $s = 4$, using (2). Together with the small-degree case it gives $r \( 4 \, t \) lt.eq C_4 t^3 \/ \( log t \)^2$. Apply it next with $s = 5$, using this established bound for $r \( 4 \, t \)$ in (3). This gives $r \( 5 \, t \) lt.eq C t^4 \/ \( log t \)^3$ as required. In each passage from an avoiding graph to a Ramsey number, the additive one is absorbed into the absolute constant. ◻
]

== 3 Projective flags and selected-stream entropy <sec:flags>

We first construct the graph and record the entropy that every long consistent tuple extracted from its random stream must retain. This lower bound will be compared with descriptions produced later.

=== 3.1 Incidence estimates <incidence-estimates>

For a prime power $q$, let $cal(P)_d = "PG" \( d \, q \)$ be the one-dimensional subspaces of $bb(F)_q^(d + 1)$, and let $cal(P)_d^(*)$ be its dual point space. A dual point $b$ represents the hyperplane $b^perp$. We write $a perp b$ for incidence. In both spaces, a projective $j$-flat corresponds to a vector subspace of dimension $j + 1$. Put $Q_j = 1 + q + dots.h.c + q^j$.

#thm([Lemma 3.1.])[
  (Incidence and variance).  #emph[Let $d gt.eq 2$, and put $p_d = Q_(d - 1) \/ Q_d = \( 1 - 1 \/ Q_d \) \/ q$. For real weights $w_a$ on $cal(P)_d$, set $W \( b \) = sum_(a perp b) w_a$ and $w = sum_a w_a$. Then 
$ 1 / Q_d sum_b W \( b \) = p_d w \, #h(2em) sum_b #scale(x: 120%, y: 120%)[\(] W \( b \) - p_d w #scale(x: 120%, y: 120%)[\)]^2 lt.eq q^(d - 1) sum_a w_a^2 . $

 The same assertions hold with the two spaces interchanged. In particular, for $A subset.eq cal(P)_d$ and $B subset.eq cal(P)_d^(*)$, 
$ lr(|e \( A \, B \) - p_d \| A \| \| B \||) lt.eq q^(\( d - 1 \) \/ 2) sqrt(\| A \| \| B \|) \, #h(2em) e \( A \, B \) = \| { \( a \, b \) in A times B : a perp b } \| . $

 If $A \, B eq.not diameter$ and their incidence density is $o \( 1 \/ q \)$, then $\| A \| \| B \| lt.eq C q^(d + 1)$ for all sufficiently large $q$.]
] <lem:incidence>

#proof[
  Every point lies on $Q_(d - 1)$ hyperplanes and every two distinct points lie on $Q_(d - 2)$ hyperplanes. Thus the incidence matrix $M_d$ satisfies
  $ M_d M_d^(sans(T)) = q^(d - 1) I + Q_(d - 2) upright(bold(1)) upright(bold(1))^(sans(T)) . $
  Both row and column sums equal $Q_(d - 1)$. Subtracting the constant part of a weight vector therefore gives the variance estimate. Applying this operator bound to the centered indicator vectors of $A$ and $B$ gives the displayed mixing estimate. Finally, $p_d gt.eq 1 \/ \( 2 q \)$, so a density $o \( 1 \/ q \)$ forces $sqrt(\| A \| \| B \|) lt.eq C q^(\( d + 1 \) \/ 2)$. ◻
]

This projective incidence calculation is the bipartite form of the orthogonality-graph spectral calculation of Alon and Krivelevich #cite(label("AlonKrivelevich1997")) Section 2; it also underlies Bradač’s polarity-graph estimates #cite(label("Bradac2026")) Lemma 2.1. We shall use both its unweighted and weighted forms.

=== 3.2 The ordered graph <the-ordered-graph>

Fix $0 < eta < 1 \/ 10$. Throughout the lower-bound proof let $q$ be a sufficiently large prime, and put

$ beta = eta \/ 10^7 \, #h(2em) sigma = log q \, #h(2em) N = floor.l q^4 sigma floor.r \, #h(2em) k = floor.l q sigma^(1 + eta) floor.r . $

The small parameter $beta$ is unrelated to the independence number $alpha \( G \)$. Constants may depend on $eta$; they never depend on $q$. Each $o \( 1 \)$ is uniform in the stated parameter ranges. Only a bounded number of stages, depending on $eta$, will be used.

A #emph[flag] is a pair $\( a \, b \) in cal(P)_4 times cal(P)_4^(*)$ with $a perp b$. There are $M = Q_4 Q_3$ flags. Choose a stream $X_1 \, dots.h \, X_N$ of independent uniform flags. Its graph has vertex set ${ 1 \, dots.h \, N }$; writing $X_i = \( a_i \, b_i \)$, its edge rule for $i < j$ is

$ i tilde.op j quad arrow.l.r.double quad a_i perp b_j med upright(" and ") med a_j ⟂̸ b_i . $

Repeated flags are permitted: the vertices are stream positions. This is the ordered version of Bradač’s $D^(*)$ construction #cite(label("Bradac2026")) Section 2.5. Related earlier constructions use ordered edges of a bipartite incidence graph #cite(label("CodenottiPudlakResta2000")) #cite(label("KostochkaPudlakRodl2010")); the reverse nonincidence in our displayed edge rule is part of the specific construction used here.

#thm([Lemma 3.2.])[
  #emph[Every stream graph is $K_5$-free.]
] <lem:clique-free>

#proof[
  In a clique with increasing positions $i_1 < dots.h.c < i_5$, the hyperplane $b_(i_j)^perp$ contains $a_(i_1) \, dots.h \, a_(i_j)$ but not $a_(i_(j + 1))$, for $j = 1 \, dots.h \, 4$. Thus these five points span the full five-dimensional vector space. They are all annihilated by $b_(i_5)$, a contradiction. ◻
]

An ordered tuple of flags is #emph[consistent] if

$ i < j \, med a_i perp b_j quad arrow.r.double quad a_j perp b_i . $

Independent vertex sets give consistent tuples in stream order. Reversing the tuple and interchanging its two endpoint systems preserves consistency.

#thm([Lemma 3.3.])[
  (Rectangle occupancy).  #emph[With probability $1 - o \( 1 \)$, the following holds simultaneously for every vector subspace $V subset.eq \( bb(F)_q^5 \)^(*)$ in the dual space: 
$ \# { i : X_i in cal(R) \( V \) } lt.eq C sigma \, #h(2em) cal(R) \( V \) = { \( a \, b \) : b subset.eq V \, med a subset.eq V^perp } . $

 The same bound holds for the reverse-swapped stream.]
] <lem:rectangles>

#proof[
  For $1 lt.eq r = dim V lt.eq 4$, the rectangle contains $Q_(r - 1) Q_(4 - r) lt.eq 4 q^3$ flags; for $r = 0 \, 5$ it is empty. Its stream count is binomial with mean at most $C_0 sigma$. The number of vector subspaces is at most $6 q^25$, for example by counting ordered spanning lists. A Chernoff bound and a sufficiently large fixed $C$ give the simultaneous claim. After swapping, $cal(R) \( V \)$ becomes $cal(R) \( V^perp \)$, so the same event suffices. ◻
]

=== 3.3 Laws of selected tuples <laws-of-selected-tuples>

Entropy always means Shannon entropy with natural logarithms. For a finite-valued variable $Y$ with masses $p_y$, write $H \( Y \) = - sum_y p_y log p_y$, with $0 log 0 = 0$. Conditional entropy $H \( Y divides Z \)$ averages this quantity over $Z$; $H_theta \( Y \)$ denotes the entropy of the particular conditional law given $Z = theta$. Mutual information and total correlation are

$ I \( Y \; Z \) = H \( Y \) + H \( Z \) - H \( Y \, Z \) \, #h(2em) "TC" \( Y_1 \, dots.h \, Y_m \) = sum_i H \( Y_i \) - H \( Y_1 \, dots.h \, Y_m \) . $

We use their conditional versions with the same convention.

For probability masses $P \, Q$ on a finite set, their relative entropy is

$ "D" \( P bar.v.double Q \) = sum_x P \( x \) log frac(P \( x \), Q \( x \)) \, $

with value infinity if $P$ charges a zero of $Q$. Direct expansion gives

$ I \( Y \; Z \) = "D" \( P_(Y \, Z) bar.v.double P_Y ⊗ P_Z \) . $

For every real function $f$, Jensen’s inequality gives

#[#set math.equation(numbering: n => "(4)")
 $ "D" \( P bar.v.double Q \) gt.eq bb(E)_P f - log bb(E)_Q e^f . $ <eq:entropy-variational>]

Indeed, apply concavity of the logarithm under $P$ to $e^f Q \/ P$; its expectation is at most $bb(E)_Q e^f$. In particular relative entropy is nonnegative. If $P \( E \) = 0$, use $f = - s 1_E$ and let $s arrow.r oo$ to obtain $"D" \( P bar.v.double Q \) gt.eq - log \( 1 - Q \( E \) \) gt.eq Q \( E \)$.

We also use the following elementary concentration estimates. For a binomial or Poisson variable of mean $mu$, halving or doubling its mean has tail probability at most $e^(- c mu)$; more generally, its upper tail at $h gt.eq e mu$ is at most $\( e mu \/ h \)^h$. For independent centered variables bounded in absolute value by one and with total variance $V$, the two-sided tail of their sum at $z$ is at most

$ 2 exp { - c min \( z \, z^2 \/ V \) } . $

These follow from the exponential Markov inequality. For the first two bounds use $log bb(E) e^(t \( X - mu \)) lt.eq mu \( e^t - 1 - t \)$. For the last, the Taylor expansion gives $bb(E) e^(t X) lt.eq exp \( C t^2 bb(E) X^2 \)$ for centered $\| X \| lt.eq 1$ and $\| t \| lt.eq 1$; multiply these bounds and choose $\| t \| = min \( c z \/ V \, c \)$. The zero-variance case is deterministic.

Say a stream law has #emph[density at most $C_0$] if its probability of every stream event is at most $C_0$ times the iid uniform stream probability. Auxiliary random choices can have arbitrary dependence on the stream; only this marginal bound is required.

#thm([Lemma 3.4.])[
  (Entropy of an extracted tuple).  #emph[Suppose the stream law has density at most $C_0$, where $C_0$ is independent of $q$. By any rule, possibly using auxiliary randomness, extract a tuple $F$ of deterministic length $ell$ in stream order or in reverse-swapped order. If $c_0 k lt.eq ell lt.eq C_1 k$ for fixed positive constants, then 
$ max_f bb(P) \( F = f \) lt.eq frac(2 C_0 binom(N, ell), M^ell) \, #h(2em) H \( F \) gt.eq 4 sigma ell + eta ell log sigma - O \( k \) . $

]
] <lem:stream-entropy>

#proof[
  The event $F = f$ requires $f$, or its reverse-swap, to occur at some $ell$ positions of the stream. For any specified positions the iid probability is $M^(- ell)$, even when flag values repeat. A union bound proves the atom bound without any independence assumption on the selected tuple. Entropy is at least minus the logarithm of its largest atom. Since $binom(N, ell) lt.eq \( e N \/ ell \)^ell$, $log M = 7 sigma + O \( 1 \/ q \)$, and $log ell = sigma + \( 1 + eta \) log sigma + O \( 1 \)$, this gives the result. ◻
]

Conditioning on an event of probability at least a fixed positive constant preserves stream domination, with a different constant. Fixing independent public random tables by averaging will be done before such conditioning. A fixed finite number of these operations therefore leaves Lemma 8 applicable.

To prove the lower bound, suppose every stream has a consistent $k$-tuple, select one deterministically, and condition on the event of Lemma 7. The compression argument starts from this law. Every subsequent retained tuple will have deterministic length $Theta \( k \)$, satisfy the same rectangle bound, and have a stream law with bounded density. Its entropy must consequently retain the excess $eta ell log sigma$.

== 4 Describing a sparse incidence pair <sec:predictor-statement>

The following theorem supplies the geometric input to compression. An encoder knows two hidden sets. A decoder knows larger sets containing them and a collection of independent public random tables. A message describes a set the decoder can reconstruct. No bound on the time needed to search or decode is asserted.

For precision, a public table is a sequence of independent proposed sample rows, with its distribution specified by the decoder’s current information. Uniform samples in any finite known set may be generated by independent uniforms and a fixed ordering of that set. Distinct calls use independent tables. The encoder sends a row index and any specified additional data; the decoder reproduces that row without knowing either hidden set.

#thm([Theorem 4.1.])[
  (Sparse-pair description).  #emph[Fix $0 < eta < 1 \/ 10$, set $beta = eta \/ 10^7$, and let $q$ be a sufficiently large prime. Write $sigma = log q$, and suppose 
$ sigma^beta lt.eq D lt.eq sigma^(1 - eta \/ 2) \, #h(2em) L = D sigma^(8 beta) \, #h(2em) R in \[ sigma^beta \, 2 sigma^beta + 2 \] ∩ 2 bb(N) \, #h(2em) P = L R . $

 Let $2 lt.eq d lt.eq 4$, and let $S subset.eq U_S subset.eq cal(P)_d$ and $T subset.eq U_T subset.eq cal(P)_d^(*)$ be nonempty. Assume 
$ \| S \| \| T \| gt.eq q^(d + 1) e^(- b) \, #h(2em) 0 lt.eq b lt.eq C_b D sigma^(6 beta) \, #h(2em) frac(e \( S \, T \), \| S \| \| T \|) lt.eq tau / q \, #h(2em) 0 < tau lt.eq sigma^(- 200 dot.op 2^(d - 2) beta) \, $

 where $C_b$ is a fixed constant. Put $d_S = log \( \| U_S \| \/ \| S \| \)$ and $d_T = log \( \| U_T \| \/ \| T \| \)$. Orient the pair so that $\| S \| lt.eq \| T \|$. There is a public-table scheme for which, except with probability $O \( e^(- c q) \)$, the encoder can send a message of length at most 
$ C q P \( d_S + d_T + P \) $

 bits describing a set $W subset.eq U_S$ such that 
$ \| W \| lt.eq \| S \| e^(C P) \, #h(2em) \| W ∩ S \| gt.eq c \| S \| . $

 The constants may depend on $eta \, C_b$, but not on the hidden sets, $D$, or $q$. The decoder uses only $U_S \, U_T$, the public parameters and tables, and the message. There is no uniformity assertion for the captured subset $W ∩ S$.]
] <thm:predictor>

The orientation requires one bit and may be reversed during the proof. Message lengths are measured in bits, whereas entropies are in natural units; this only changes constants. Integers can be sent with a self-delimiting code of length $O \( 1 + log \( m + 1 \) \)$. All searches below have explicit finite cutoffs.

We first use Theorem 9 to obtain a contradiction to the selected-tuple entropy bound. Its independent proof starts in Section 7.

== 5 Preparing a consistent tuple for compression <sec:compression-local>

Our aim is to encode a long consistent tuple using almost $4 log q$ units of information per flag. Lemma 8 says that a tuple selected from the stream requires an additional $eta log log q$ per flag. The present section prepares one compression step: two scans give small joint domains, a short exposure makes representative flags nearly independent of most targets, and the geometry of low-conflict pairs reduces the problem to two endpoint supports.

Throughout this section and the next, fix $0 < eta < 1 \/ 10$ and put

$ beta = eta \/ 10^7 \, #h(2em) sigma = log q \, #h(2em) k = floor.l q sigma^(1 + eta) floor.r . $

All assertions are for sufficiently large primes $q$, with the threshold allowed to depend on $eta$. A stage starts with a consistent tuple $F = \( F_i \)_(i = 1)^ell$ of deterministic length $ell = Theta \( k \)$, in stream order or in the globally reversed and swapped order. Its underlying stream marginal has density bounded by a constant relative to the iid stream law, and the rectangle-occupancy event of Lemma 7 holds almost surely. Constants may depend on the stage, but the number of stages will depend only on $eta$.

A discrete context $sans(C)$ specifies, for each tuple position, a decoder-known set of flags containing its actual value. The deterministic parameters $Lambda \, Delta gt.eq 0$ satisfy

#[#set math.equation(numbering: n => "(5)")
 $ H \( sans(C) \) lt.eq Lambda \, #h(2em) \| upright("each slot domain") \| lt.eq C q^4 e^Delta . $ <eq:stage-input>]

Set

#[#set math.equation(numbering: n => "(6)")
 $ D = sigma^beta \( 1 + Lambda \/ k + Delta sigma^(- eta) \) \, #h(2em) K = D sigma^(3 beta) \, #h(2em) K_(*) = D sigma^(6 beta) . $ <eq:stage-parameters>]

For now assume

#[#set math.equation(numbering: n => "(7)")
 $ sigma^beta lt.eq D lt.eq sigma^(1 - eta \/ 2) . $ <eq:stage-range>]

In particular $K_(*) = o \( sigma \)$ and $K = o \( K_(*) \)$. We use the parameters $L \, R \, P$ of Theorem 9, so that $L = D sigma^(8 beta)$, $R$ is even and belongs to $\[ sigma^beta \, 2 sigma^beta + 2 \]$, and $P = L R$. The step will retain a fixed positive fraction of the tuple and give it a new context with controlled entropy and slot-domain sizes. Proposition 18 states the quantitative output.

=== 5.1 Two marking scans <two-marking-scans>

Counting ordered independent sets by steps with few options or a large reduction in the remaining domain goes back to Alon and Rödl #cite(label("AlonRodl2005")) Theorem 2.1 and Lemma 2.2. The following scan adapts the marking argument of Bradač #cite(label("Bradac2026")) Claim 2.13, freezing its state between expensive steps and recording its joint option counts for later entropy estimates.

#thm([Lemma 5.1.])[
  (Marking).  #emph[There is a message $Omega$, consisting of constant-alphabet masks and $O \( q sigma \)$ full flags, with the following properties. Given $\( sans(C) \, Omega \)$, every unspecified flag belongs to a known set of at most $C_1 q^4$ flags, where $C_1$ is an absolute constant. Moreover, 
#[#set math.equation(numbering: n => "(8)")
 $ H \( Omega divides sans(C) \) lt.eq O \( k \) + \( 4 sigma + Delta + O \( 1 \) \) bb(E) h \, $ <eq:marking-cost>]

 where $h lt.eq C q sigma$ is the number of specified flags. Put $theta_0 = \( sans(C) \, Omega \)$ and $J_0 = log \( C_1 q^4 \)$, and let $F_(upright("cheap"))$ be the tuple of unspecified flags. Its expected joint entropy deficit satisfies 
#[#set math.equation(numbering: n => "(9)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \( ell - h \) J_0 - H_(theta_0) \( F_(upright("cheap")) \) #scale(x: 120%, y: 120%)[\]] lt.eq cal(B) := C \( Lambda + k + Delta q sigma \) . $ <eq:deficit-budget>]

 The same bound holds for any subset of unspecified positions determined by $\( sans(C) \, Omega \)$.]
] <lem:marking>

#proof[
  Scan forward, updating the state only at flags declared expensive. For a point $y$ in the second point system, let
  $ V \( y \) = "span" { b_i : a_i perp y \, i upright(" an earlier expensive position") } . $
  Let $U_j^0 = { y : dim V \( y \) lt.eq j }$ and $Z_j = { y : dim V \( y \) = j }$, where dimensions are vector dimensions. At an actual extension $\( a \, b \)$, consistency implies $a perp V \( b \)$. Thus $r = dim V \( b \) lt.eq 4$, and there are at most $2 q^(4 - r)$ choices for $a$ once $b$ and $r$ are known.
  Choose $l lt.eq r$ maximizing $\| Z_l \|$, with a fixed rule for ties. Declare the flag popular-cheap if
  $ \| { y in Z_l : b subset.eq V \( y \) } \| gt.eq \| Z_l \| \/ \( 16 q \) . $
  Counting point memberships in the $l$-dimensional vector subspaces $V \( y \)$ shows that there are at most $32 q^l$ such $b$. Hence their joint flag count is at most $64 q^4$. If this condition fails, declare the flag poor-cheap when
  $ \| { y in Z_l : a perp y } \| lt.eq \| Z_l \| \/ \( 8 q \) . $
  Lemma 5 bounds the number of these $a$ by $C q^5 \/ \| Z_l \|$. The available $b$ belong to $U_r^0$, whose size is at most $5 \| Z_l \|$. Applying incidence mixing to these two sets gives at most $C q^4$ flags: their product is $O \( q^5 \)$, and both the main term and the mixing error are $O \( q^4 \)$.
  Otherwise declare the flag expensive and perform the update. At least $\| Z_l \| \/ \( 8 q \)$ points of $Z_l$ are hit by $a$, and fewer than $\| Z_l \| \/ \( 16 q \)$ already have $b subset.eq V \( y \)$. At least $\| Z_l \| \/ \( 16 q \) gt.eq \| U_l^0 \| \/ \( 80 q \)$ therefore leave $U_l^0$. Each of the five nonempty sets $U_l^0$ can undergo only $O \( q sigma \)$ such multiplicative reductions. This bounds the number of updates.
  Run the same scan after reversing the tuple and swapping the two point systems. Transmit rank/type masks for both scans and every flag expensive in either scan. These data reconstruct both states at every position, and every remaining position passes both cheap scans. The masks cost $O \( k \)$; the specified flags can be encoded using their old context domains. This proves (8).
  The unspecified positions and their number are known from $theta_0$, and the specified flags have been revealed. Thus
  $ bb(E) H_(theta_0) \( F_(upright("cheap")) \) = H \( F divides sans(C) \, Omega \) gt.eq H \( F \) - H \( sans(C) \, Omega \) . $
  Using Lemma 8 and (8) gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( ell - h \) J_0 - H_(theta_0) \( F_(upright("cheap")) \) #scale(x: 120%, y: 120%)[\]] lt.eq C \( Lambda + k + Delta q sigma \) . $
  The $4 sigma bb(E) h$ cost cancels the expected cap of the specified positions. The deficit is nonnegative because the remaining domains have size at most $e^(J_0)$. Finally, omitted coordinates contribute entropy at most their cap sum, proving the assertion about subsets. ◻
]

The masks also give useful separate endpoint bounds. At a slot that is poor-cheap in at least one orientation, fix such an orientation by a priority rule and put $u = max \( sigma \, min \( 4 sigma \, log \| Z_l \| \) \)$. Its endpoint supports have sizes at most

#[#set math.equation(numbering: n => "(10)")
 $ A_max = C e^(5 sigma - u) \, #h(2em) B_max = C e^u . $ <eq:reciprocal-caps>]

The clamping uses the trivial ambient bound $Q_4 = O \( q^4 \)$ at the two endpoints. If the slot is popular-cheap in both scans, with forward and reversed ranks $r \, r'$, its endpoint caps and partner caps are as follows. Here $\| B divides A \|$ is the largest number of permitted second endpoints for a fixed first endpoint, and $\| A divides B \|$ is defined symmetrically:

#[#set math.equation(numbering: n => "(11)")
 $ \| A \| lt.eq C q^(r') \, quad \| B \| lt.eq C q^r \, #h(2em) \| B divides A \| lt.eq 2 q^(4 - r') \, quad \| A divides B \| lt.eq 2 q^(4 - r) . $ <eq:high-caps>]

In a high class we use $A_max = C q^(r')$ and $B_max = C q^r$. For $r + r' lt.eq 5$, these imply (10) with $u = r sigma$. Rank zero cannot be popular.

We divide the remaining positions into a fixed number of classes. Reciprocal classes specify their orientation and either an integer band $\| u - r sigma \| lt.eq K_(*)$, with $r in { 1 \, 2 \, 3 \, 4 }$, or an open band

$ \( r - 1 \) sigma + K_(*) < u < r sigma - K_(*) . $

For open bands $r in { 2 \, 3 \, 4 }$. The remaining, high classes specify $\( r \, r' \)$ with $r + r' > 5$; whenever a rank is four, orient the class so that $r = 4$. By pigeonholing, an event determined by $theta_0$ and of probability bounded below has a fixed class containing at least $c k$ positions. Condition on that event and retain the first $floor.l c k floor.r$ positions. Conditional laws at a fixed $theta_0$ have not changed, and (9) changes only by a constant factor. The deterministic parameters $D \, K \, K_(*)$ remain those chosen at the start of the stage. Conditioning here multiplies the expected deficit bound by at most the reciprocal of a fixed positive probability, which is absorbed in its stage constant. It does not redefine $D$ from the entropy of the conditioned old context. The next stage will instead use the deterministic message-length bound for its newly constructed context. If the orientation is swapped, reverse the retained order as well. All subsequent lengths are deterministic.

Split this class into equal windows, discarding the final remainder. Let $w$ be the resulting deterministic number of complete windows, before any subsequent deletions. Take window length, rounded to a multiple of four, of order

#[#set math.equation(numbering: n => "(12)")
 $ m asymp cases(delim: "{", q D sigma^(eta \/ 2) \, & upright("open bands") \,, q sigma^(1 + eta \/ 2) \, & upright("integer bands") .) $ <eq:window-lengths>]

A high class uses one window of length $Theta \( k \)$. The early and late quarters of each window are representative blocks; the middle half consists of targets. In every case $Theta \( k \)$ positions remain.

=== 5.2 Choosing a round before exposing its values <choosing-a-round-before-exposing-its-values>

Conditioning to reduce correlations is a standard entropy method; compare #cite(label("RaghavendraTan2011")) Lemma 4.5. We need the following version with one representative per block.

In the following estimates, conditional entropies and mutual information are evaluated at the indicated history. The outer expectation averages over that history and all fresh representative indices.

#thm([Lemma 5.2.])[
  (Pre-round decoupling).  #emph[After exposing a deterministic number of rounds of older representatives, one can draw one fresh uniform unused position from each representative block, without exposing their values, with the following properties. Let $theta$ consist of $theta_0$ and all older indices and values. For an unexposed position $i$, write 
$ delta_i = J_0 - H_theta \( F_i \) \, #h(2em) I_(i j) = I_theta \( F_i \; F_j \) . $

 Then 
#[#set math.equation(numbering: n => "(13)")
 $ bb(E) sum_i delta_i lt.eq cal(B) \, #h(2em) bb(E) sum_i max_(j in cal(J)_i) I_(i j) lt.eq frac(C cal(B), q D sigma^(3000 beta)) \, $ <eq:decoupling-bounds>]

 where $cal(J)_i$ consists of fresh representatives outside $i$’s own representative block, and contains all representatives for a middle target. The expected sums over fresh representative targets themselves are at most $C \/ m$ times the corresponding all-target sums. The fresh indices do not change the conditional flag marginals.]
] <lem:decoupling>

#proof[
  Draw one new unused position per block for each of $T = floor.l q D sigma^(3000 beta) floor.r$ rounds, exposing values after each round. The parameter choices give $T = o \( m \)$, so all unused block sizes remain comparable to $m$. For any conditional law of coordinates and any set $E$ of coordinates, the chain rule gives
  #[#set math.equation(numbering: n => "(14)")
   $ "TC" \( F \) - bb(E) \[ "TC" \( F_(E^c) divides F_E \) \] = "TC" \( F_E \) + sum_(i in.not E) I \( F_i \; F_E \) . $ <eq:tc-drop>]
  Here the new indices are independent of the values given past history. The initial expected total correlation is at most $cal(B)$, because it is bounded by the joint deficit in $J_0$-sized domains.
  For an unselected target, its maximum mutual information with a new representative is bounded by $I \( F_i \; F_E \)$. For a target in a representative block, the maximum over the other blocks is independent of the draw in its own block. Thus the selected targets’ expected contribution is at most $C \/ m$ times the all-target contribution. Absorbing this $o \( 1 \)$ fraction and summing (14) over rounds proves that some deterministic pre-round satisfies the second bound in (13).
  Revealing and removing $r$ coordinates cannot increase the expected deficit of those remaining: the removed coordinates have entropy at most $r J_0$. This proves the first bound. Uniformity gives the same $C \/ m$ estimate for selected deficits. Choose the indicated pre-round and stop before revealing its fresh values. Its fresh indices are independent of the remaining values given $theta$, proving the final assertion. ◻
]

=== 5.3 Low-conflict pairs and collision rectangles <low-conflict-pairs-and-collision-rectangles>

All conditional probabilities in this subsection are given a fixed pre-round history $theta$. For a flag $\( a \, b \)$ at slot $i$, denote its joint and endpoint marginal probabilities by $p_i \( a \, b \)$, $p_i^A \( a \)$, and $p_i^B \( b \)$. Call a first endpoint $a$ good if

$ p_i^A \( a \) gt.eq e^(- K) \/ A_max quad upright("and") quad Pr #scale(x: 120%, y: 120%)[\(] p_i \( a \, b \) > q^(- 4) e^K divides a #scale(x: 120%, y: 120%)[\)] lt.eq .02 \; $

define good second endpoints symmetrically. In a high class impose also the upper cutoffs

$ p_i^A \( a \) lt.eq e^K q^(- r') \, #h(2em) p_i^B \( b \) lt.eq e^K q^(- r) . $

The mass of bad endpoints at slot $i$ is

#[#set math.equation(numbering: n => "(15)")
 $ O #scale(x: 120%, y: 120%)[\(] e^(- K) + \( delta_i + 1 \) \/ K #scale(x: 120%, y: 120%)[\)] . $ <eq:bad-endpoint-mass>]

Indeed, the negative part of $log \( p_i \( F_i \) q^4 \)$ has bounded expectation by the support cap $C_1 q^4$, so its positive part has expectation at most $delta_i + O \( 1 \)$. Markov’s inequality proves the light-atom condition. The lower cutoff loses at most $e^(- K)$. For the high upper cutoff, the partner cap gives $H_theta \( A_i \) gt.eq r' sigma - delta_i - O \( 1 \)$, and the same negative-part argument with the marginal cap $C q^(r')$ applies; similarly for $B_i$.

Fix $rho = .005$. For a first endpoint $a$ define a vector subspace in the second system by

$ cal(K)_i \( a \) = ⋂_(Pr \( b ⟂̸ z divides a \) lt.eq rho) z^perp . $

Define $cal(L)_j \( y \)$ in the first system by the analogous construction from the conditional first endpoint at second endpoint $y$. A basis of the span of the tests has at most five members; hence

#[#set math.equation(numbering: n => "(16)")
 $ Pr \( b in cal(K)_i \( a \) divides a \) gt.eq 1 - 5 rho \, #h(2em) a perp cal(K)_i \( a \) \, $ <eq:core-capture>]

with the analogous assertions for $cal(L)_j \( y \)$. At a good $a$, a captured light conditional atom is at most $q^(- 4) e^(2 K) A_max$, and these atoms have total mass at least $.955$. Counting points in a vector subspace therefore gives

#[#set math.equation(numbering: n => "(17)")
 $ dim cal(K)_i \( a \) gt.eq ⌈5 - frac(log A_max + 3 K, sigma)⌉ \, $ <eq:core-dimension>]

and the corresponding bound using $B_max$ for $cal(L)_j \( y \)$.

#thm([Lemma 5.3.])[
  (Low-conflict geometry).  #emph[For $i < j$, write the two flags as $\( a \, b \) \, \( c \, y \)$ and compare their actual joint law with the independent product of their conditional marginals. In a reciprocal class, or the high class $\( 3 \, 3 \)$, there are nonnegative numbers $c_(i j)$ such that 
#[#set math.equation(numbering: n => "(18)")
 $ Pr_(upright("prod")) \( a \, y upright(" good") \, med a perp y \) lt.eq C \( I_(i j) + c_(i j) \) \, #h(2em) sum_(i < j) c_(i j) lt.eq C sigma k . $ <eq:low-conflict>]

 In open reciprocal bands one can take $c_(i j) = 0$.]
] <lem:low-conflict>

#proof[
  The conflict event $a perp y$, $c ⟂̸ b$ has probability zero under the actual joint law. Coarsening relative entropy to that event shows that its product probability is at most $I_(i j)$. Except for hit mass at most $I_(i j) \/ rho^2$, its reverse-miss probability conditional on $\( a \, y \)$ is at most $rho^2$. Markov’s inequality then shows that at least $1 - rho$ of $c divides y$ are tests defining $cal(K)_i \( a \)$. Every point of $cal(K)_i \( a \)$ is consequently a test defining $cal(L)_j \( y \)$, so
  #[#set math.equation(numbering: n => "(19)")
   $ cal(L)_j \( y \) subset.eq cal(K)_i \( a \)^perp . $ <eq:core-containment>]
  On such endpoints, both memberships $b in cal(K)_i \( a \)$ and $c in cal(L)_j \( y \)$ hold under the product law with probability at least $1 - 10 rho$.
  In an open band, (17) gives dimensions at least $r$ and $6 - r$, contradicting (19). In an integer band the bounds are $r$ and $5 - r$, so equality holds in the orthogonal complement. Let $E_(i j)$ require good endpoint incidence, the containment, and both core memberships. Both flags then belong to $cal(R) \( cal(K)_i \( a \) \)$.
  For $\( 3 \, 3 \)$, both core dimensions are at least two. Put $V = cal(L)_j \( y \)^perp$. Then $cal(K)_i \( a \) subset.eq V$ with dimension difference at most one. If $y in cal(K)_i \( a \)$, both flags belong to $cal(R) \( cal(K)_i \( a \) \)$. Otherwise $V = "span" \( cal(K)_i \( a \) \, y \)$, and $a perp y$ shows that both flags belong to $cal(R) \( V \)$. The first rectangle is determined by the earlier slot, the second by the later slot. Lemma 7 thus bounds the number of charged partners of any slot by $C sigma$, pointwise for every actual tuple. Set $c_(i j) = Pr_(upright("joint")) \( E_(i j) divides theta \)$ and take conditional expectations to obtain its sum bound.
  For any pair event $E$, the entropy variational inequality with test $- 1_E$ gives
  $ I_(i j) gt.eq - Pr_(upright("joint")) \( E \) - log #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - e^(- 1) \) Pr_(upright("prod")) \( E \) #scale(x: 120%, y: 120%)[\)] . $
  Therefore $Pr_(upright("prod")) \( E \) lt.eq C \( I_(i j) + Pr_(upright("joint")) \( E \) \)$. Apply this to $E_(i j)$ and use the product core-capture bound to prove (18). ◻
]

Extend $c_(i j)$ symmetrically, setting it to zero in the other high classes. For a fresh target $i$, put

$ g_i = max_(j in cal(J)_i) \( I_(i j) + c_(i j) \) . $

Call the index good if

#[#set math.equation(numbering: n => "(20)")
 $ delta_i lt.eq D sigma^beta \, #h(2em) g_i lt.eq sigma^(- 2000 beta) \/ q . $ <eq:good-index>]

The expected fractions of bad indices and bad representatives are $o \( 1 \)$. For mutual information use Lemma 11 and $cal(B) \/ k = O \( D sigma^(- beta) \)$. For collisions, uniform block sampling and (18) give expected total at most $C sigma k \/ m$; collision windows have $m gt.eq c q sigma^(1 + eta \/ 2)$, so Markov loses at most $C sigma^(2000 beta - eta \/ 2) = o \( 1 \)$. Selection in a target’s own block is independent of its other-block sum, giving the representative estimate as before. At every good index, (15) is $o \( 1 \)$.

=== 5.4 Eliminating high classes <eliminating-high-classes>

#thm([Lemma 5.4.])[
  (High ranks).  #emph[The retained class cannot be high. In the rank-four case, the stated assumptions instead directly produce an encoding contradicting Lemma 8.]
] <lem:high-ranks>

#proof[
  First suppose the class is $\( 3 \, 3 \)$. Choose a good early representative and a good middle target, which exist for some histories and fresh draws by the preceding estimates. Restrict the representative’s first marginal to good endpoints. Its total mass is $1 - o \( 1 \)$ and its atoms are at most $e^K \/ q^3$. Weighted incidence variance shows that all but $C q^2 e^K$ second endpoints have incident mass at least $.3 \/ q$. The exceptional set has mass at most $C q^(- 1) e^(2 K) = o \( 1 \)$ in the good target’s second marginal. This contradicts (18) and (20).
  Now orient so that $r = 4$ and $r' gt.eq 2$. Draw $h = ceil.l q sigma^beta ceil.r$ independent full flags from a good early representative’s marginal conditioned on both endpoints being good. These draws are independent of the actual targets given history. Weighted variance shows that all but $o \( 1 \)$ of a good middle target’s second-endpoint mass has sample first-endpoint hit probability at least $.3 \/ q$: the exceptional set has size $C q^(5 - r') e^K$, while its good atoms are at most $e^K \/ q^4$.
  For such a target endpoint $y$, start with its span and add the second endpoints of hit samples. While the span has vector dimension below four, it contains at most $C q^2$ points, whose sample mass is at most $C q^(- 2) e^K = o \( 1 \/ q \)$. Each trial therefore has conditional probability at least $.2 \/ q$ of increasing the dimension. Binomial domination shows that the span reaches dimension four with failure probability $o \( 1 \)$. The probability of any conflict with the actual target is at most $C h I_(i j) = o \( 1 \)$; conditioning the representative on good endpoints changes its density only by a bounded factor.
  In expectation only $o \( k \)$ middle targets are lost, also counting a bad representative and bad target indices as losses. With probability bounded below retain a deterministic $Theta \( k \)$ covered middle targets in their original order. Transmit the sample list, at cost $O \( h sigma \) = o \( k \)$. For each possible $y$, the decoder forms the span of $y$ and the second endpoints of its hit samples. If its dimension is at least four, at most one first endpoint annihilates it. Every covered actual target belongs to this common domain, of size at most $Q_4$. No old context is needed. The resulting tuple has entropy at most $4 sigma ell + O \( k \)$, contradicting Lemma 8 after the constant-probability conditioning. ◻
]

=== 5.5 Nearly uniform endpoint supports <nearly-uniform-endpoint-supports>

Only reciprocal classes remain. Their endpoint caps are (10), with a history-known number $u_i$ at each slot.

#thm([Lemma 5.5.])[
  (Endpoint levels).  #emph[At every good index there are independent auxiliary choices of first and second endpoint supports, each consisting of good endpoints, such that a chosen support $A$ satisfies 
$ 1 / 2 A_max e^(- K) lt.eq \| A \| lt.eq A_max \, #h(2em) bb(E) frac(1_({ a in A }), \| A \|) lt.eq C p_i^A \( a \) \, $

 and similarly for $B$. For any two ordered good representatives in distinct blocks, 
#[#set math.equation(numbering: n => "(21)")
 $ u_j lt.eq u_i + C K #h(2em) \( i < j \) . $ <eq:u-monotonicity>]

]
] <lem:flat-levels>

#proof[
  Partition each endpoint marginal into levels of $floor.l - log p floor.r$. The entropy of this integer-valued level is $O \( log sigma \)$: its mean is $O \( sigma \)$, and comparison with a geometric distribution of that mean gives entropy at most $log \( e \( 1 + O \( sigma \) \) \)$. For a first level set $A$, put $"loss"_A = log \( A_max \/ \| A \| \)$, and define the second loss similarly. Conditional on both levels, incidence mixing gives
  $ log \| { \( a \, b \) in A times B : a perp b } \| lt.eq 4 sigma + O \( 1 \) - 1 / 2 \( "loss"_A + "loss"_B \) . $
  The chain rule consequently bounds the expected total loss by $O \( delta_i + log sigma + 1 \)$. A level is permissible when its loss is at most $K$ and at least half its members are good. Since probabilities within a level differ by at most $e$, the total probability of permissible levels is $1 - o \( 1 \)$ by (15) and Markov. Choose a permissible level by its marginal probability, normalized over permissible levels, and take its good subset. This proves both the size and averaged pointwise bounds.
  For $i < j$, independent choices of a first support at $i$ and second support at $j$ have expected incidence density at most $C sigma^(- 2000 beta) \/ q$ by (18) and averaged pointwise domination. If $u_j - u_i > C K$ with a sufficiently large $C$, every such pair has product at least $c q^5 exp \( u_j - u_i - 2 K \)$; mixing forces density at least $c \/ q$. This contradiction proves (21). ◻
]

Discard windows with a bad representative. In an open band discard also windows with $u_(upright("early")) - u_(upright("late")) > K_(*)$. Along the remaining ordered representative list before this last deletion, the sum of downward changes is at most $C sigma + C K w$, by (21). Thus these extra deletions cost at most $C \( sigma + K w \) \/ K_(*) = o \( w \)$ windows, since $w asymp sigma^(1 + eta \/ 2) \/ D$. In an integer band the variation is already at most $2 K_(*)$.

At every surviving window independently choose a permissible first support $A$ from its early representative and a permissible second support $B$ from its late representative. Then

#[#set math.equation(numbering: n => "(22)")
 $ \| A \| \| B \| gt.eq q^5 e^(- C K_(*)) . $ <eq:pivot-support-input>]

For the same window and every ordered cross pair, expected incidence density is at most $C sigma^(- 2000 beta) \/ q$. The same bound holds against the corresponding good endpoint mass of every good middle target on the appropriate temporal side. These are averaged statements over the independent support choices; no pointwise sparsity of every chosen pair is being assumed. They are precisely the inputs for the tree construction in the next section.

== 6 Compression along a tree of windows <sec:compression-tree>

We now use Theorem 9 to replace the old slot domains by smaller ones. The main issue is that a test at one window changes the domains available at later steps. We control each fresh test before asking which descendants survive. This order permits an unconditional sum of losses and keeps the decoder independent of the old context.

=== 6.1 A fresh incidence test <a-fresh-incidence-test>

For points $x \, y$ in opposite systems write $x in N \( y \)$ when $x perp y$. Given a row $x_1 \, dots.h \, x_h$ in one system, its fresh ambient test is

#[#set math.equation(numbering: n => "(23)")
 $ cal(T) \( x_1 \, dots.h \, x_h \) = {y : sum_(j = 1)^h 1_({ x_j perp y }) < frac(.2 h, q)} . $ <eq:fresh-test-set>]

The word “ambient” means that this set is defined on the entire opposite point system, before intersection with an inherited domain.

#thm([Lemma 6.1.])[
  (Validation and its conditional law).  #emph[Suppose nonempty supports $A subset.eq U_A$ and $B subset.eq U_B$ satisfy 
$ \| A \| \| B \| gt.eq q^5 e^(- b) \, #h(2em) frac(\| { \( a \, b' \) in A times B : a perp b' } \|, \| A \| \| B \|) lt.eq epsilon / q \, $

 where $b = O \( K_(*) \)$ and $epsilon lt.eq C sigma^(- 1000 beta)$. Put $n_A = \| A \|$, $n_B = \| B \|$ and $d_A = log \( \| U_A \| \/ n_A \)$, $d_B = log \( \| U_B \| \/ n_B \)$. Suppose a decoder-known $W$ captures at least $c n_A$ points of $A$ and has size at most $n_A e^(C P)$.]
  #emph[Using independent public proposal tables, one can describe two caps $U'_A subset.eq U_A$, $U'_B subset.eq U_B$ such that 
#[#set math.equation(numbering: n => "(24)")
 $ \| U'_B \| lt.eq C' q^5 \/ n_A \, quad \| U'_A \| lt.eq C' q^5 \/ n_B \, #h(2em) \| B ∩ U'_B \| gt.eq .9 n_B \, quad \| A ∩ U'_A \| gt.eq .9 n_A . $ <eq:validated-caps>]

 The failure probability is $O \( e^(- q) \)$, and the metadata cost is $O \( q P \( d_A + d_B + 1 \) \)$. Each successful row, conditional on its past and on finding that row before its cutoff, has density bounded by an absolute constant relative to the true iid law of its stated hidden source. This conditional law does not include success of any later test or descendant.]
  #emph[More generally, if such a test is produced from a hidden source contained in an original support $X$ and of size at least $c \| X \|$, then for every fixed opposite point $y$, 
#[#set math.equation(numbering: n => "(25)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] 1_({ upright("test is produced") }) 1_({ y in.not cal(T) }) divides upright("prior data") #scale(x: 120%, y: 120%)[\]] lt.eq C q frac(\| X ∩ N \( y \) \|, \| X \|) . $ <eq:fresh-test-domination>]

 The prior data may include all original support choices and tables used earlier, but not the current fresh table.]
] <lem:fresh-test>

#proof[
  First consider $h_B = ceil.l C q \( d_B + 1 \) ceil.r$ genuine iid draws from $A ∩ W$. Weighted incidence variance shows that at most $C q^5 \/ n_A$ points have incidence proportion less than $.5 \/ q$ into this source. Each other point passes (23) with probability at most $exp \( - c h_B \/ q \)$ by Chernoff. Since $\| U_B \| = e^(d_B) n_B$ and sparsity with incidence mixing gives $n_A n_B lt.eq C q^5$, Markov’s inequality makes the size of $U_B ∩ cal(T)$ at most $C' q^5 \/ n_A$ with probability at least $.99$ after choosing the constants. The average hit proportion from this source into $B$ is at most $C epsilon \/ q$. Markov applied first to hit counts and then to the fraction of $B$ rejected by the test shows that at least $.9 n_B$ points survive with probability $1 - O \( epsilon \)$. Both requirements thus hold with probability at least $.9$.
  The first cap is regarded as produced immediately after this first acceptance, even if a later test fails. After this first success, draw $h_A = ceil.l C q \( d_A + 1 \) ceil.r$ iid points from $B ∩ U'_B$. This is at least $.9$ of $B$, so the same argument produces $U'_A = U_A ∩ cal(T)$ with the other two requirements. In particular the second cap is not intersected with $W$.
  Implement the first row by proposals uniform in $W$, accepting precisely when every entry lies in $A ∩ W$ and both requirements hold. Implement the second by proposals uniform in $U'_B$, accepting when every entry lies in $B ∩ U'_B$ and both requirements hold. The domain/source ratios are at most $e^(C P)$: for the second use $\| U'_B \| \/ \| B ∩ U'_B \| lt.eq C q^5 \/ \( n_A n_B \) lt.eq e^(C P)$. A row of length $h$ therefore succeeds with probability at least $.9 e^(- C h P)$. Stop after $ceil.l e^(C' h P) ceil.r$ proposals, for a sufficiently large $C'$. The failure probability is $O \( e^(- q) \)$ and the successful index costs $O \( h P \)$.
  Conditioning an all-in-source row gives exactly iid draws from that source. Its further acceptance property has probability at least $.9$ under this iid law. The first successful row, conditional on finding one before the cutoff, has the same acceptance-conditioned law; its density relative to iid is at most $1 \/ .9$. This proves the law assertion and the metadata bound, including row sizes and the finite diagnostics.
  Finally, conditional on being ready to produce a test, its hidden source has at least $c \| X \|$ points inside $X$. The successful-row law just proved and the count threshold imply
  $ Pr \( y in.not cal(T) divides upright("ready") \) lt.eq C q frac(\| X ∩ N \( y \) \|, \| X \|) . $
  Multiply by the readiness indicator and bound its probability by one. This proves (25). No assertion about a descendant’s later survival is used. ◻
]

=== 6.2 The tree construction and loss accounting <the-tree-construction-and-loss-accounting>

The surviving window list is determined by the pre-round history and the fresh representative indices: all its deletions use only the numbers $delta_i \, g_i \, u_i$. Fix this list before making the independent level choices. Build a balanced binary tree on it from Section 5: its root is the middle window, and recurse on the earlier and later halves. Each node has its original supports $A \, B$ from Lemma 14. Its inherited sets $U_A \, U_B$ initially equal the two full point systems. At a successful node, the left child inherits the new first-endpoint cap and the old second-endpoint cap; the right child inherits the old first-endpoint cap and the new second-endpoint cap. Middle targets of the pivot window use both new caps. Figure 1 records these different roles.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Pivot window#linebreak()inherited $(U_A,U_B)$#linebreak()construct $U_A',U_B'$]]])])
  content((-3.7, -2), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Earlier windows#linebreak()inherit $(U_A',U_B)$]]])])
  content((3.7, -2), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Later windows#linebreak()inherit $(U_A,U_B')$]]])])
  content((0, 1.5), [#text(size: 9pt)[Pivot middle targets#linebreak()must lie in $U_A' times U_B'$]])
  line((-1.357, -0.7337), (-2.672, -1.444), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.357, -0.7337), (2.672, -1.444), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0.7337), (0, 1.047), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: Only the endpoint facing a pivot’s representative is restricted in each descendant half. All tests are constructed before checking which actual middle targets they retain. ],
) <fig:pivot-tree>

At a node, trim $A$ and $B$ to their inherited sets. Drop its entire subtree if either trim keeps fewer than $.9$ of its original support, or if the untrimmed same-node density exceeds $sigma^(- 1000 beta) \/ q$. Otherwise, the trimmed supports satisfy Theorem 9 in dimension four, with $b = O \( K_(*) \)$. Apply the predictor in the orientation of the smaller support and then Lemma 15, exchanging the two systems if necessary. Drop the subtree on failure. Use independent tables for each tree address, stage, predictor call and validation test.

#thm([Lemma 6.2.])[
  (Tree retention).  #emph[The expected number of windows lost by this construction and the preceding deletions is $o \( w \)$, where $w$ is the deterministic window count before deletions. Among the middle targets, the expected number lost beyond their fixed non-middle complement is $o \( k \)$. Consequently, with probability bounded below, a deterministic $Theta \( k \)$ middle targets can be retained, in order, in the two caps of their successful pivots.]
] <lem:pivot-retention>

#proof[
  Do not inspect actual middle-target coverage while constructing the tree. Conditional on history, fresh representative indices and all original support choices, apply (25) to each produced ancestor test. Its hidden source is always a constant fraction of the original support $X$: the node trim keeps $.9$, the predictor captures a constant fraction, and the first validation keeps $.9$ of the opposite trimmed support. Predictor bias therefore does not affect this bound. The readiness indicator has already been removed on the right-hand side of (25). We may therefore sum that bound over a descendant’s original support before averaging its level choice; we never replace that support by its law conditional on reaching the descendant.
  Average the bound over the independently chosen levels. For every descendant’s original support, the expected fraction evicted by a relevant ancestor fresh test is $O \( sigma^(- 2000 beta) \)$ by (18) and Lemma 14. Inherited sets are intersections of precisely these ambient tests. The probability of reaching a node but failing its $.9$ trim is thus at most a constant times the sum of these loss bounds along its path. The same-node density rejection probability, even ignoring reach, is $O \( sigma^(- 1000 beta) \)$ by Markov. Predictor and validation failures contribute $O \( e^(- c q) \)$ per attempted node.
  The tree depth is $O \( log \( w + 1 \) \) = O \( log sigma \)$. For each fixed node, summing failure bounds over its ancestor path therefore gives $o \( 1 \)$ probability of being lost through a dropped subtree. Summing over nodes gives $o \( w \)$ expected loss. This adds to the $o \( w \)$ representative and open-band deletions already proved.
  The identical fresh-test estimate applies to actual good middle targets after integration against their endpoint marginals. Given history and fresh indices, these targets are independent of the auxiliary level choices and public tables. An earlier target faces a pivot’s second support, and a later target faces its first support, so all relevant incidence bounds have the required temporal orientation. At its own pivot, the target faces both representatives. Count bad target indices and bad endpoints as losses. Their total is $o \( k \)$ in expectation, and the path sum bounds the remaining evictions by $o \( k \)$ as well.
  In this argument the first pivot test is counted whenever it is produced, without conditioning on success of the second test. Likewise no ancestor test is conditioned on descendant survival. Thus all the conditional-law estimates used above have the form actually supplied by Lemma 15. Markov now gives a positive constant probability of retaining at least $c k$ middle targets. Keep exactly $floor.l c k floor.r$ in their original order. ◻
]

=== 6.3 The new decoder and its message length <the-new-decoder-and-its-message-length>

The encoder transmits the tree size and node statuses, successful node constructions, and the retained slot count at each node in tree order. The parameters $q \, eta \, D \, L \, R \, P$ and the deterministic stage budgets are part of the common protocol. At each successful node the message also specifies its orientation, trimmed support sizes, row lengths and row indices, together with the predictor’s diagnostics. These integers cost $O \( sigma \)$ per node apart from the already charged row indices. No failed construction is transmitted. Starting with the two ambient point systems, the decoder reconstructs every successful ancestor’s caps and therefore the inherited sets for each successful child. The predictor’s message supplies its set $W$; row sizes and row indices supply the two validation tests. A proposal row is regenerated using public uniforms ranked in the decoder’s reconstructed finite domain. The hidden supports determine acceptance, but are not needed to regenerate an accepted row. Concatenating the prescribed number of copies of the pivot domains in the windows’ original order specifies all new slot domains. The decoder never needs the old context, the old slot labels, or the identities of the omitted targets.

#thm([Lemma 6.3.])[
  (Cost of the new context).  #emph[The output of Lemma 16 has a new context satisfying 
#[#set math.equation(numbering: n => "(26)")
 $ Lambda' lt.eq C q P log \( w + 2 \) \( sigma + w P \) + C w sigma \, #h(2em) Delta' lt.eq C K_(*) . $ <eq:stage-output>]

 These are deterministic bounds. After fixing public tables and conditioning on retention of the prescribed length, the stream marginal still has density bounded by a stage constant.]
] <lem:pivot-compression>

#proof[
  At a successful pivot let the trimmed sizes be $n_A \, n_B$. Its two caps have sizes at most $C q^5 \/ n_B$ and $C q^5 \/ n_A$. Their product is at most $C q^5 e^(C K_(*))$ by (22). Incidence mixing bounds the number of flags in their product by $C q^4 e^(C K_(*))$, proving the domain bound.
  To sum metadata, define at a node
  $ G = log \( \| U_A \| \| U_B \| \/ q^5 \) \, quad b_v = log \( q^5 \/ \( n_A n_B \) \) \, quad d_A = log \( \| U_A \| \/ n_A \) \, quad d_B = log \( \| U_B \| \/ n_B \) . $
  Then $d_A + d_B = G + b_v$, with $b_v lt.eq C K_(*)$. The left child’s positive part $G^(+)$ is at most $d_B + C$, and the right child’s at most $d_A + C$, by the cap size bounds. Thus the sum of their positive potentials is at most $G^(+) + C K_(*) + C$. The initial potential is $3 sigma + O \( 1 \)$. At every depth the sum of positive potentials over successful nodes is therefore at most $3 sigma + C w K_(*) + O \( 1 \)$, by accumulating the costs over their ancestors. Dropped children only reduce this sum.
  The predictor and validations at a successful node cost $O \( q P \( d_A + d_B + P \) \)$ by Theorem 9 and Lemma 15. Since $K_(*) = o \( P \)$, summing the last bound over the $O \( log \( w + 2 \) \)$ depths gives the first term in (26). Tree statuses cost $O \( w \)$; support sizes, row lengths and retained counts cost $O \( w sigma \)$. Self-delimiting integer encodings multiply these bounds by at most an absolute constant. The maximum message length therefore bounds its entropy by $Lambda'$.
  By Lemma 16, the joint probability of successful extraction, over the prior law and the independent public tables, is bounded below. Average first over the tables and fix a realization with extraction probability bounded below under the prior law and the remaining auxiliary choices. Only then condition on extraction. The stream marginal density increases by at most the reciprocal of this constant. This proves the final assertion without requiring any uniform capture distribution from the predictor. ◻
]

We can now state the full compression step established by the two sections.

#thm([Proposition 6.4.])[
  (One compression stage).  #emph[Suppose a selected consistent tuple and context satisfy (5)–(7), with deterministic $ell = Theta \( k \)$ and bounded stream-marginal density, and suppose the rectangle-occupancy event of Lemma 7 holds almost surely. Then either the high-rank argument contradicts Lemma 8, or a constant-probability extraction produces another such tuple, of deterministic length $Theta \( k \)$, and a new context satisfying (26), where 
#[#set math.equation(numbering: n => "(27)")
 $ w lt.eq C sigma^(1 + eta \/ 2) \/ D . $ <eq:window-count>]

 Its decoder is independent of the old context.]
] <prop:compression-stage>

#proof[
  Apply Lemma 10, select a deterministic class and window length by constant-probability conditioning, and use Lemma 11. Lemma 13 eliminates the high classes. In reciprocal classes, Lemma 14 and the open-band deletion supply (22) and its averaged incidence bounds. Lemmas 16 and 17 finish the construction. For open bands, (27) follows from $k \/ m asymp sigma^(1 + eta \/ 2) \/ D$. For integer bands, $w = O \( sigma^(eta \/ 2) \)$, which is smaller because $D lt.eq sigma$. All losses and density changes are by stage constants. ◻
]

=== 6.4 The finite iteration <the-finite-iteration>

#thm([Theorem 6.5.])[
  (A stream with no long consistent subsequence).  #emph[For every fixed $0 < eta < 1 \/ 10$ and every sufficiently large prime $q$, there is a stream of $N = floor.l q^4 log q floor.r$ flags whose ordered flag graph is $K_5$-free and has independence number less than $k = floor.l q \( log q \)^(1 + eta) floor.r$.]
] <thm:stream>

#proof[
  Suppose instead that every stream has a consistent subsequence of length $k$. Choose one and condition the stream on the rectangle occupancy event of Lemma 7, whose probability tends to one. Lemma 8 applies to it and to every constant-density extraction considered above. Initially the context is empty and every domain is the full flag set, so $Lambda = 0$ and $Delta = 3 sigma + O \( 1 \)$. Thus
  $ D = O \( sigma^(1 - eta + beta) \) lt.eq sigma^(1 - eta \/ 2) . $
  We show that the admissible range is preserved while the context shrinks.
  For sufficiently large $q$, $P lt.eq 3 D sigma^(9 beta)$. Substituting this and (27) into (26) gives
  $ Lambda' / k & lt.eq C D log sigma #scale(x: 120%, y: 120%)[\(] sigma^(9 beta - eta) + sigma^(18 beta - eta \/ 2) #scale(x: 120%, y: 120%)[\)] + o \( 1 \)\
 & lt.eq D sigma^(- eta \/ 3) \, #h(2em) Delta' lt.eq C D sigma^(6 beta) . $
  Here the term $C w sigma \/ k$ is exponentially small in $sigma$; all other inequalities use $beta = eta \/ 10^7$. The next stage parameter consequently satisfies
  #[#set math.equation(numbering: n => "(28)")
   $ D_(upright("new")) = sigma^beta \( 1 + Lambda' \/ k + Delta' sigma^(- eta) \) lt.eq sigma^(2 beta) + D sigma^(- eta \/ 4) . $ <eq:D-recurrence>]
  This remains in (7). After $O \( 1 \/ eta \)$ applications it gives $D lt.eq 2 sigma^(2 beta)$. One more compression therefore yields
  $ Lambda' \/ k = o \( 1 \) \, #h(2em) Delta' q sigma \/ k = O \( sigma^(8 beta - eta) \) = o \( 1 \) . $
  At this point run just the marking scans. Encoding the context, the masks, the expensive flags and then the remaining cheap flags gives
  $ H \( F \) lt.eq 4 sigma ell + O \( k \) + Lambda' + O \( Delta' q sigma \) = 4 sigma ell + O \( k \) . $
  But Lemma 8 gives $H \( F \) gt.eq 4 sigma ell + eta ell log sigma - O \( k \)$. Since the deterministic retained length is still $ell = Theta \( k \)$, these estimates contradict each other for sufficiently large $q$. Only a fixed number of stages, depending on $eta$, was used, so all retention fractions and density bounds remain constants. The original assumption is false. The flag graph of the resulting stream is $K_5$-free by the ordered-flag construction, completing the proof. ◻
]

== 7 Preparing the sparse-pair description <sec:predictor-setup>

We now prove Theorem 9. The proof is by induction on the projective dimension $d$. A large concentration on a proper flat reduces the dimension. Otherwise, a small collection of flats records all relevant concentrations, and the score in Section 9 gives the required description.

The following consequences of the parameter choices will be used throughout:

#[#set math.equation(numbering: n => "(29)")
 $ P = o \( sigma \) \, quad log sigma = o \( P \) \, quad R log L = o \( P \) \, quad b + P tau = o \( L \) \, quad L = o \( P \) . $ <eq:parameter-orders>]

For example, $P lt.eq 3 D sigma^(9 beta)$, whereas $D lt.eq sigma^(1 - eta \/ 2)$; also $b \/ L = O \( sigma^(- 2 beta) \)$ and $P tau \/ L = R tau = o \( 1 \)$. In particular, all fixed numerical constants used below are eventually smaller than $R$.

=== 7.1 Small sets and greedy removal of flats <small-sets-and-greedy-removal-of-flats>

Orient the input so that $n = \| S \| lt.eq \| T \|$, and put $n = q^(1 + v)$. Lemma 5 gives $n lt.eq C q^(\( d + 1 \) \/ 2)$. If $n lt.eq 100 q P$, send $n$ and the rank of $S$ among the $n$-element subsets of the known set $U_S$. The elementary inequality $binom(\| U_S \|, n) lt.eq \( e \| U_S \| \/ n \)^n$ bounds the message length by

$ O #scale(x: 120%, y: 120%)[\(] sigma + n \( d_S + 1 \) #scale(x: 120%, y: 120%)[\)] lt.eq C q P \( d_S + P \) . $

The decoder takes $W = S$. Henceforth $n > 100 q P$, so $v > 0$.

Define

$ g_0 = \( v - 1 / 2 \) sigma \, #h(2em) g_1 = \( v - 1 \) sigma \, #h(2em) xi = L \/ 100 \, #h(2em) chi = P \/ 100 \, #h(2em) chi_0 = P \/ 10000 . $

The following two greedy procedures refer to the original value of $n$, including in their thresholds.

+ If $d = 4$ and $g_1 > chi_0$, repeatedly choose a hyperplane containing the largest number of remaining points of $S$. Remove its remaining points whenever this number is at least $q^2$. Stop as soon as at least $n \/ 2$ points have been removed, or when the maximum is below $q^2$. In the first case retain the removed points and their ordered list of hyperplanes. In the second retain the residual and no list. If the procedure is not used, retain all of $S$. Call the retained set $S_1$.
+ If $d gt.eq 3$ and $g_0 > chi_0$, apply the same rule to planes and the points of $S_1$, now with threshold
  $ K_p = n^(4 \/ 3) q^(- 1) exp \( - g_0 \/ 5 \) . $
  Stop on removing at least $\| S_1 \| \/ 2$, or when the largest remaining plane count is below $K_p$. Retain the removed points and the ordered plane list in the first case, and the residual with no plane list in the second. If this procedure is not used, retain $S_1$. Write $S'$ for the final training set and $n' = \| S' \|$.

Ties are resolved by a fixed ordering of flats. Each retained list partitions the training points by #emph[earliest membership]: a point belongs to the first listed flat containing it. The hyperplane partition, if present, is restricted to $S'$ after the second procedure. The sizes of the original hyperplane cells, before that restriction, will also be used in the geometric analysis; they are not needed by the decoder.

#thm([Lemma 7.1.])[
  (Training data).  #emph[The construction has $n \/ 4 lt.eq n' lt.eq n$. If the hyperplane list or plane list is present, its length satisfies 
$ J_h lt.eq n \/ q^2 \, #h(2em) J_p lt.eq n \/ K_p = q^(1 \/ 2) exp \( - 2 g_0 \/ 15 \) \, $

 respectively. If both lists are present, then $J_h J_p lt.eq q^(13 \/ 15 + o \( 1 \))$. If a performed procedure retained a residual, that residual has the corresponding flat cap.]
  #emph[If every training cell in both partitions has size less than $.04 n'$, then for each query point $x$ define $O_x$ as the union of the following cells: the cell of the earliest listed hyperplane containing $x$, and the cell of the earliest listed plane containing $x$. Omit a cell when no such flat exists. Then $\| O_x \| \/ n' < .08$. We call this the #emph[small-cell case].]
  #emph[The ordered lists, $n'$, all training cell sizes, and the table of intersections between the two partitions can be communicated in $O \( q \)$ bits. From these data the decoder determines $\| O_x \| \/ n'$ for every $x$, and determines which samples belong to $O_x$ from their flat memberships.]
] <lem:training>

#proof[
  Every retention keeps at least half the previous set. Each listed flat removes at least its threshold, and its assigned points are disjoint from those of earlier flats, proving the length bounds. In dimension four,
  $ J_h J_p lt.eq q^(v - 1) q^(1 \/ 2 - \( 2 \/ 15 \) \( v - 1 \/ 2 \)) = q^(13 v \/ 15 - 13 \/ 30) lt.eq q^(13 \/ 15 + o \( 1 \)) \, $
  because $v lt.eq 3 \/ 2 + O \( 1 \/ sigma \)$. Each single list has length at most $q^(1 \/ 2 + o \( 1 \))$. A flat is described by a basis in a fixed coordinate system, using $O \( sigma \)$ bits; every cell or intersection size uses $O \( sigma \)$ bits as well. These bounds give $O \( q \)$ in total. The union formula and the intersection table give $\| O_x \|$. For a sampled point, earliest membership in a known list determines its cell. Finally the union involves at most two cells of size less than $.04 n'$. ◻
]

=== 7.2 A large cell reduces the dimension <a-large-cell-reduces-the-dimension>

Suppose a training cell has at least $.04 n'$ points. Its listed flat $K_0$, of projective dimension $2 lt.eq j < d$, satisfies

$ S_0 = S ∩ K_0 \, #h(2em) \| S_0 \| gt.eq .01 n . $

The encoder sends $K_0$, with a canonical coordinate system. The average incidence proportion from $T$ into $S_0$ is at most $100 tau \/ q$. Delete members whose proportion exceeds $sqrt(tau) \/ q$. This loses at most $100 sqrt(tau) thin \| T \|$ members, so leaves at least $\| T \| \/ 2$ for large $q$. Each remaining covector restricts nontrivially to $K_0$.

Normalize each nonzero projective restriction. Each restriction has at most $q^(d - j)$ projective lifts: after fixing one nonzero restricted coordinate to be $1$, the remaining $d - j$ coordinates are free. Among the dyads $\[ l \, 2 l \)$ of lift multiplicity, choose one carrying at least $\| T \| \/ \( C sigma \)$ of the retained lift mass. Let $T_0$ be its set of distinct restrictions. Then

#[#set math.equation(numbering: n => "(30)")
 $ \| S_0 \| \| T_0 \| gt.eq q^(j + 1) exp { - b - O \( log sigma \) } \, #h(2em) frac(e \( S_0 \, T_0 \), \| S_0 \| \| T_0 \|) lt.eq sqrt(tau) / q . $ <eq:reduced-pair>]

Indeed, the number of restrictions is at least the retained mass divided by $2 l$, and $l lt.eq q^(d - j)$. The density assertion holds for each restriction separately, so forgetting its multiplicity causes no problem.

The decoder’s enclosures are

$ U_(S_0) = U_S ∩ K_0 \, #h(2em) U_(T_0) = { upright("nonzero projective restrictions with at least ") l upright(" lifts in ") U_T } . $

Their logarithmic gaps are bounded by $d_S + O \( 1 \)$ and $d_T + O \( log sigma \)$. The extra term in $b$ in (30) is absorbed in $O \( D sigma^(6 beta) \)$. Moreover,

$ sqrt(tau) lt.eq sigma^(- 200 dot.op 2^(j - 2) beta) #h(2em) \( j < d \) . $

Thus the induction hypothesis applies after orienting the reduced pair so that its smaller side is first. The dimension decreases, and its initial value is at most four.

If the recursive output captures $S_0$, it already captures a constant fraction of $S$ in a set of size at most $n e^(C P)$. Intersect it with $U_S$, if necessary. If instead it captures $T_0$, let $W_0$ be the decoded set and $C_0 = W_0 ∩ T_0$ its hidden capture, with $\| C_0 \| gt.eq c \| T_0 \|$ and $\| W_0 \| \/ \| C_0 \| lt.eq e^(C P)$. We convert this to a capture on the original side.

Take $h = ceil.l C q \( d_S + 1 \) ceil.r$ independent uniform samples from $C_0$, temporarily using the true hidden-set law. On $U_S ∩ K_0$ define the cap

$ W = { x : upright("fewer than ") .2 h \/ q upright(" of the sampled restrictions annihilate ") x } . $

By Lemma 5, at most $C' q^(j + 1) \/ \| T_0 \|$ points in the whole $j$-space have incidence proportion less than $.5 \/ q$ into $C_0$. Every other point belongs to $W$ with probability at most $exp \( - c h \/ q \)$. The bounds

$ \| U_S ∩ K_0 \| lt.eq e^(d_S) n \, #h(2em) n lt.eq C q^(j + 1) \/ \| T_0 \| $

therefore imply, by increasing $C$ and applying Markov’s inequality, that

$ \| W \| lt.eq C'' q^(j + 1) \/ \| T_0 \| lt.eq n exp { O \( b + log sigma + 1 \) } $

with probability at least $.9$. The second displayed inequality for $n$ follows by applying mixing to $S_0 \, T_0$ and using $\| S_0 \| gt.eq .01 n$.

Every member of $T_0$ has incidence proportion at most $sqrt(tau) \/ q$ into $S_0$. Consequently every all-in-$C_0$ sample row, regardless of its bias, loses at most $5 sqrt(tau) thin \| S_0 \|$ points of $S_0$ under this test: sum the hit counts and divide by the rejection threshold. Thus a row satisfying the size test also captures at least $.9 \| S_0 \|$ for large $q$.

To implement this sampling with a message, send the integer $h$ and use a fresh table indexed by this row length. Its $O \( sigma \)$-bit cost is absorbed in the bounds below. Propose independent rows uniform in the known $W_0$. A row falls entirely in $C_0$ and passes the size test with probability at least $.9 e^(- C h P)$. Searching at most $exp \( C' h P \)$ rows gives failure probability $O \( e^(- c q) \)$, and its row index takes $O \( h P \)$ bits. Conditional on being all in $C_0$, a proposed row is exactly iid uniform in $C_0$; the comparison is made before searching. After search, no unbiased-sampling assertion is used.

The flat, dyad, recursive message, row length and optional conversion have total length $O \( q P \( d_S + d_T + P \) \)$. Here the recursive increases of $O \( log sigma \)$ in the gaps are absorbed because $log sigma = o \( P \)$. There are at most two dimension reductions, and each uses fresh tables. The constants and failure probabilities can therefore be absorbed in those of Theorem 9.

We have reduced the proof to training data satisfying the small-cell case of Lemma 20. The next section bounds the rich radial configurations that can correlate incidence tests at one query point. Those bounds will be applied separately to validation on $S'$ and to output size in the ambient space.

== 8 Rich lines and overlapping hyperplanes <sec:geometry>

The score used by the predictor is a sum over hyperplanes through a query point. Its terms can depend strongly on one another when two hyperplanes contain many common training points. We now bound these overlaps. The training-set construction in Lemma 20 removes large flat concentrations from each query’s samples; the remaining concentrations are controlled by a polynomial argument for lines and a counting argument for planes.

Low-degree polynomials vanishing on point sets play a central role in Dvir’s finite-field Kakeya argument #cite(label("Dvir2009")). The rich-line proof here uses the polynomial interpolation and tangent-plane methods of Guth and Katz #cite(label("GuthKatz2010")) and Elekes, Kaplan, and Sharir #cite(label("ElekesKaplanSharir2011")). The positive-characteristic obstruction to these methods is treated by Ellenberg and Hablicsek #cite(label("EllenbergHablicsek2016")). Here the defining polynomial has degree below the prime characteristic, and we give the required algebraic argument in full. Kollár’s positive-characteristic incidence estimate #cite(label("Kollar")) Theorem 2 also motivated the rich-line framework. The plane-capped estimate below is proved directly and does not invoke that theorem as a premise.

Throughout this section, $q$ is a sufficiently large prime, $sigma = log q$, $log sigma = o \( P \)$ and $P = o \( sigma \)$. Write

$ n = q^(1 + v) \, #h(2em) n / 4 lt.eq n' lt.eq n \, #h(2em) g_0 = \( v - 1 / 2 \) sigma \, #h(2em) g_1 = \( v - 1 \) sigma \,\
chi = P / 100 \, #h(2em) chi_0 = P / 10000 . $

All constants below are absolute. Bounds denoted by $o \( n \)$ are uniform under the parameter assumptions just stated and those of the relevant lemma.

=== 8.1 A polynomial bound for rich lines <a-polynomial-bound-for-rich-lines>

We first prove the only algebraic ingredient. Its characteristic restriction will enter through a polynomial whose degree is less than $q$.

#thm([Lemma 8.1.])[
  (Rich lines with a plane cap).  #emph[Suppose $n = q^(1 + v)$, $v lt.eq 3 \/ 2 + O \( 1 \/ sigma \)$, $n \/ 4 lt.eq n' lt.eq n$, $g_0 > chi_0$, and $e^(- g_0 \/ 20) < a lt.eq 2$. Put 
$ M = frac(n' a, q) \, #h(2em) K = n^(4 \/ 3) q^(- 1) e^(- g_0 \/ 5) . $

 Let $X$ be a set of at most $n$ points of $upright("PG") \( d \, q \)$, where $3 lt.eq d lt.eq 4$, such that every projective plane contains at most $K$ points of $X$. The number of lines containing at least $M$ points of $X$ is at most $C n \/ M$.]
] <lem:rich-lines>

#proof[
  The inequalities that make the argument work are
  #[#set math.equation(numbering: n => "(31)")
   $ M / n^(1 \/ 3) gt.eq c e^(37 g_0 \/ 60) \, #h(2em) M^2 / K gt.eq c e^(23 g_0 \/ 30) \, #h(2em) c q lt.eq n / M lt.eq C q e^(g_0 \/ 20) . $ <eq:rich-line-parameters>]
  They follow by substituting $v = 1 \/ 2 + g_0 \/ sigma$ and using $a > e^(- g_0 \/ 20)$ and $n' gt.eq n \/ 4$. In particular, their first two ratios tend to infinity.
  Work temporarily over an algebraic closure of $bb(F)_q$. A generic linear map to a four-dimensional vector space preserves the independence of every independent subset of at most four points of $X$. Indeed, each of these finitely many requirements defines a nonempty open condition on the map, and the field is infinite. The resulting projection to projective three-space preserves distinct points and distinct rich lines. It also preserves the plane cap: four projected points in a plane cannot have come from four independent points. Choose an affine chart containing all projected points.
  Sample these points independently with probability
  $ f = A sqrt(n) / M^(3 \/ 2) \, $
  where $A$ is a sufficiently large fixed constant. By (31), $f = o \( 1 \)$ and $f M = A sqrt(n \/ M) gt.eq c A sqrt(q)$. There are at most $n^2$ lines containing at least two points of $X$. Chernoff’s inequality and a union bound imply that, with probability $1 - o \( 1 \)$, every rich line contains more than $f M \/ 2$ sampled points. Markov’s inequality gives probability at least $1 \/ 2$ that the total sample size is at most $2 f n$. Choose a sample satisfying both conditions.
  Counting monomials in three variables produces a nonzero polynomial vanishing on that sample, of degree
  $ D_0 lt.eq C A^(1 \/ 3) sqrt(n \/ M) . $
  For sufficiently large fixed $A$, this degree is less than $f M \/ 2$, so the polynomial vanishes identically on every rich line. Replacing it by its squarefree part does not increase the degree or lose any such line. Also
  #[#set math.equation(numbering: n => "(32)")
   $ D_0 = o \( M \) \, #h(2em) D_0 = O \( q^(21 \/ 40) \) < q \, $ <eq:degree-characteristic>]
  because $g_0 lt.eq sigma + O \( 1 \)$.
  First consider its plane factors. At most $D_0^2$ lines lie in two different factor planes. Fix one factor plane containing $r$ of the remaining lines, and choose $M' = floor.l M floor.r$ points on each line. If $d_z$ is their multiplicity at a selected point, the plane cap and the fact that two lines meet at most once give
  $ \( r M' \)^2 lt.eq K sum_z d_z^2 lt.eq K #scale(x: 120%, y: 120%)[\(] r M' + r \( r - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Consequently $r lt.eq K M' \/ \( \( M' \)^2 - K \) = o \( M' \)$. Delete from each line its intersections with all other factor planes, removing at most $D_0$ points. The remaining union in this plane has size at least
  $ r \( M' - D_0 \) - binom(r, 2) gt.eq frac(r M', 2) . $
  These unions are disjoint for different factor planes. They account for at most $C n \/ M$ lines in total.
  Let $F_0$ be the squarefree product of the nonplane factors, and consider the remaining rich lines. Call a point of $X$ busy if it lies on at least three of these lines. At a busy point where $nabla F_0 eq.not 0$, the three distinct line directions lie in the tangent plane, and the Hessian quadratic form vanishes on them. A quadratic form on a two-dimensional space with three distinct projective zeros is identically zero. Since the characteristic is odd, polarization shows that the Hessian bilinear form vanishes on that tangent plane. Thus every busy point is a zero of all the polynomials
  #[#set math.equation(numbering: n => "(33)")
   $ Q_(i j) = \( e_i times nabla F_0 \)^t "Hess" \( F_0 \) \( e_j times nabla F_0 \) \, #h(2em) 1 lt.eq i \, j lt.eq 3 . $ <eq:hessian-polynomials>]
  This is also true at a point with zero gradient. There are at most $2 n$ nonbusy point–line incidences. Except for $C n \/ M$ lines, every remaining line therefore has at least $M' \/ 2$ busy points. As $deg Q_(i j) < 3 D_0$ and $M' \/ 2 > 3 D_0$ for large $q$, each such line lies in every $Q_(i j)$.
  We claim that no irreducible factor $F$ of $F_0$ divides all the $Q_(i j)$. Since $deg F < q$, some derivative of $F$, say $F_z$, is nonzero. Squarefreeness implies that $F$ and $\( F_0 \)_z$ are coprime in $overline(bb(F))_q \( x \, y \) \[ z \]$. Clearing a Bézout identity in that field and specializing $x \, y$ away from its denominators and the leading coefficient of $F$ produces a point on $F$ where $\( F_0 \)_z eq.not 0$. After translation, the formal implicit-function theorem writes the surface locally as $z = h \( x \, y \)$.
  If every $Q_(i j)$ vanished on this surface, the Hessian bilinear form of $F_0$ would vanish on its tangent space: the vectors $e_i times nabla F_0$ span that space. Differentiating $F_0 \( x \, y \, h \( x \, y \) \) = 0$ twice would then give
  $ h_(x x) = h_(x y) = h_(y y) = 0 . $
  For a nonzero monomial $x^u y^w$ of $h$, these identities force $\( u \, w \)$ modulo the prime $q$ to be one of $\( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 0 \, 1 \)$. Thus $h$ agrees with its affine-linear part $h_1$ through total degree $q - 1$. The polynomial $F_0 \( x \, y \, h_1 \( x \, y \) \)$ has degree less than $q$ and vanishes to order at least $q$, so it is zero. This would give a plane factor of $F_0$, a contradiction.
  Over the algebraic closure, a constant linear combination $Q$ of the $Q_(i j)$ can therefore be chosen coprime to $F_0$: avoid the finitely many proper linear subspaces of coefficients corresponding to its irreducible factors. We use the following elementary consequence of resultants.
  #quote(block: true)[
    Two coprime polynomials in affine three-space, of degrees $D_1 \, D_2$, contain at most $2 D_1 D_2$ common lines.
  ]
  Here is a proof sufficient for this application. Choose a linear coordinate $z$ nonconstant on every line in any fixed finite collection of common lines. For a generic value $s$, the restrictions to $z = s$ remain nonzero and coprime. To see this, use the nonzero resultants eliminating $y$ and eliminating $x$, viewed over the respective fraction fields; preserve a nonzero coefficient of each applicable resultant under specialization. A common factor of positive degree in either variable would make the corresponding resultant vanish. If both polynomials are independent of an elimination variable, omit that resultant. Nonvanishing of the specialized polynomials is a further open condition. This argument remains valid when degrees drop: a common factor supplies a kernel vector for the Sylvester map within the original degree bounds.
  Avoid also the finitely many values $s$ at intersections of selected lines. Their slice points are distinct. Choose coordinates in the slice so their first coordinates are distinct. The resultant eliminating the second coordinate is nonzero, has degree at most $2 D_1 D_2$, and vanishes at each of those first coordinates. If both polynomials are independent of the second coordinate, coprimality gives no common point instead. This proves the assertion. Applied to $F_0 \, Q$, it bounds the remaining lines by $O \( D_0^2 \) = O \( n \/ M \)$, completing the proof. ◻
]

=== 8.2 The overlap estimate <the-overlap-estimate>

We now return to the training set. To keep the geometric statement independent of the score, the hyperplanes below can be any family of bounded training density.

#thm([Lemma 8.2.])[
  (Geometry of the training set).  #emph[Let $3 lt.eq d lt.eq 4$, $100 q P < n = q^(1 + v) lt.eq C q^(\( d + 1 \) \/ 2)$, and let $S' subset upright("PG") \( d \, q \)$ be the training set in the small-cell case of Lemma 20, with $n' = \| S' \| in \[ n \/ 4 \, n \]$. For each query point $x$, let $O_x$ be the union of its earliest containing assignment cells in the captured hyperplane and plane lists; an absent list contributes the empty set. Put 
$ X_x = S' \\ \( O_x union { x } \) \, #h(2em) B = q^d / n' \, #h(2em) a_ell = frac(q \| X_x ∩ ell \|, n') $

 for lines $ell$ through $x$. For each $x$, let $cal(H)_x$ be any family of hyperplanes through $x$ such that $q \| X_x ∩ H \| \/ n' lt.eq 2$ for every $H in cal(H)_x$. For distinct members set 
$ theta_(H H') = frac(q \| X_x ∩ H ∩ H' \|, n') \, $

 and let $E_x \( a \)$ count ordered distinct pairs with $theta_(H H') gt.eq a$. Let $Delta_x \( a \)$ be the maximum degree of this relation.]
  #emph[There is a set of $o \( n \)$ query points outside which, simultaneously for all dyadic $a in \[ q^(- 10) \, 2 \]$, 
#[#set math.equation(numbering: n => "(34)")
 $ \# { ell in.rev x : a_ell gt.eq a } & lt.eq q^(2 - 2 v) e^chi a^(- 100) \,\
E_x \( a \) & lt.eq B^2 e^(2 chi) a^(- 200) \,\
Delta_x \( a \) & lt.eq B e^(2 chi) a^(- 200) . $ <eq:local-rich-lines>]

 The exceptional set is independent of the choice of the families $cal(H)_x$.]
  #emph[Let $p$ be an even integer in $\[ 10000 sigma \/ P \, 10000 sigma \/ P + 2 \]$ and put $t = 1 \/ \( 100 p \)$. After excluding at most $n exp \( C P \)$ additional points, 
#[#set math.equation(numbering: n => "(35)")
 $ Delta_x \( t \) lt.eq B e^(- 3 P) . $ <eq:ambient-overlap-degree>]

 These additional points are needed only for the ambient bound, and are not included in the $o \( n \)$ validation exception.]
  #emph[Two further estimates hold without point exclusions. Every line strength is at most $C e^(- g_1)$. If $g_0 > chi_0$ and $e^(- g_0 \/ 20) < a lt.eq 2$, the number of pairs $\( x \, ell \)$ with $x in ell$ and $a_ell gt.eq a$ is at most $C q^2 \/ a^2$. For all strengths, the number of possible point–line pairs is at most $C q^7$.]
] <lem:overlap-geometry>

#proof[
  We first prove the line estimates. Since the radial lines partition $X_x$, their number of strength at least $a$ is at most $q \/ a$. This implies (34) if $g_0 lt.eq chi_0$ or $a lt.eq e^(- g_0 \/ 20)$, because the ratio of the former bound to the latter is
  $ e^(2 g_0 - chi) a^99 = o \( 1 \) . $
  Suppose otherwise, and put $M = n' a \/ q$. The plane-peeling step was then performed, with threshold $K_p = n^(4 \/ 3) q^(- 1) e^(- g_0 \/ 5)$ and list length $J_p lt.eq n \/ K_p$. In addition to (31), we have
  #[#set math.equation(numbering: n => "(36)")
   $ J_p lt.eq q^(1 \/ 2) e^(- 2 g_0 \/ 15) \, #h(2em) J_p \/ M lt.eq C e^(- 13 g_0 \/ 12) = o \( 1 \) . $ <eq:plane-list-length>]
  If the capped residual was retained, Lemma 21 gives $C n \/ M lt.eq C q \/ a$ rich lines. Each has $q + 1$ rational centers, so there are at most $C q^2 \/ a^2$ relevant center–line pairs.
  If a captured prefix of planes was retained, a line not contained in any listed plane has at most $J_p = o \( M \)$ training points. On a line first contained in plane $j$, earlier planes contribute at most $J_p$ points, and later assignment cells contribute none. Cell $j$ must therefore contribute at least $M \/ 2$ points. For these points to survive the removal of $O_x$, the center $x$ must belong to an earlier listed plane. None of those earlier planes contains the line, so at most $j$ centers qualify. Write $f_j$ for the fraction of $S'$ in cell $j$.
  If $a > C f_j$, the incidence variance in that projective plane gives at most $C q^(2 - v) f_j \/ a^2$ rich lines in it. Multiplying by $j$ and summing uses $sum_j f_j lt.eq 1$ and $J_p q^(2 - v) lt.eq q^2$, giving $C q^2 \/ a^2$ center–line pairs. If $a lt.eq C f_j$, the nonincreasing cell sizes from the greedy plane peel imply $j lt.eq C \/ a$. There are at most $C q^2$ lines in each such plane, and summing the center multiplicities $j$ again gives $C q^2 \/ a^2$. Additional removal of a hyperplane cell can only decrease these counts.
  We have proved the asserted global center–line bound. Markov’s inequality at the threshold in (34) leaves a fraction at most
  #[#set math.equation(numbering: n => "(37)")
   $ C e^(g_1 - chi) a^98 $ <eq:line-exception-fraction>]
  of $n$ exceptional centers. If $g_1 lt.eq chi_0$, this tends to zero even after summing over $O \( sigma \)$ dyads. Otherwise every line has strength at most $q \( q + 1 \) \/ n' lt.eq C e^(- g_1)$, so the same sum is still smaller. The crude $C q^7$ bound counts all points and all lines through them in projective four-space; it also covers dimension three.
  This proves the radial-line bounds. We next estimate the overlap edge count $E_x \( a \)$ and maximum degree $Delta_x \( a \)$. Set $M = n' a \/ q$ for every strength threshold $a$, including those covered by the trivial line bound. In dimension three the intersection of two distinct hyperplanes through $x$ is a radial line. Each such line gives at most $C q^2$ ordered pairs. A fixed $H in cal(H)_x$ contains at most $2 \/ a$ radial lines of strength at least $a$, and each lies in at most $C q$ other hyperplanes. Hence
  $ E_x \( a \) lt.eq C q^2 \# { ell in.rev x : a_ell gt.eq a } \, #h(2em) Delta_x \( a \) lt.eq C q \/ a . $
  Because $B asymp q^(2 - v)$ and $v lt.eq 1 + O \( 1 \/ sigma \)$, these prove (34) and (34) in dimension three.
  It remains to analyze dimension four. Intersections are now planes through $x$. Call an overlap plane dominant if one radial line carries at least half its outside-own points, and nondominant otherwise. A dominant overlap of strength at least $a$ contains a line of strength at least $a \/ 2$. Each such line gives at most $C q^4$ ordered hyperplane pairs. For a fixed $H in cal(H)_x$, the corresponding degree is at most $C q^2 \/ a$. Dividing this degree by $B asymp q^(3 - v)$ gives $C e^(g_1) \/ a$. If $g_1 lt.eq chi_0$, this meets (34); if $g_1 > chi_0$, a dominant overlap requires $a lt.eq C e^(- g_1)$, and the same ratio is at most $C \/ a^2$. Equation (34) also gives the required pair count.
  In a nondominant plane of strength at least $a$, there are at least $c M^2$ pairs of training points on distinct radial lines. Each pair together with $x$ determines the plane. Thus the number of these planes through $x$ is at most $C q^2 \/ a^2$. Within a fixed $H in cal(H)_x$, it is at most $C \/ a^2$, since $\| X_x ∩ H \| lt.eq 2 n' \/ q$. Every plane lies in at most $C q$ hyperplanes, so
  #[#set math.equation(numbering: n => "(38)")
   $ E_x \( a \) lt.eq C q^4 \/ a^2 \, #h(2em) Delta_x \( a \) lt.eq C q \/ a^2 . $ <eq:nondominant-crude>]
  The degree bound is always sufficient. The pair bound is sufficient if $g_1 lt.eq chi_0$ or $a lt.eq e^(- g_1 \/ 10)$: after dividing by $B^2$, its extra factor is $C e^(2 g_1) \/ a^2$, which is then absorbed by $e^(2 chi) a^(- 200)$.
  ===== 8.2.1 Rich planes in the remaining range. <rich-planes-in-the-remaining-range.>
  Suppose $g_1 > chi_0$ and $a > e^(- g_1 \/ 10)$. Here
  #[#set math.equation(numbering: n => "(39)")
   $ M gt.double q \, #h(2em) M^2 gt.double n . $ <eq:rich-plane-parameters>]
  If a captured hyperplane list was retained, take as its head the prefix whose original cell sizes, before plane peeling, exceed $C_0 q^2 \/ a$, where $C_0$ is a sufficiently large absolute constant. Its length is at most $n a \/ \( C_0 q^2 \)$. The remaining training tail has hyperplane cap $C_0 q^2 \/ a$, by the maximal choice at every greedy step. If instead the hyperplane-capped residual was retained, use an empty head and the whole training set as tail.
  A plane not contained in a head hyperplane receives fewer than $M \/ 4$ head points: each intersection is a line of at most $q + 1$ points, and the displayed head-length bound applies. Let $cal(F)$ be the global family of planes containing at least $M \/ 2$ tail points, and let
  $ r = \| cal(F) \| \, #h(2em) u = q^(4 - 2 v) a^(- 3) . $
  A line is contained in at most $C n \/ M = O \( u \)$ members of $cal(F)$, since they are disjoint off that line and $M gt.double q$. A hyperplane is a projective three-space and has at most $C_0 q^2 \/ a$ tail points. The incidence variance there bounds the number of its planes in $cal(F)$ by
  $ frac(C q^2 \( C_0 q^2 \/ a \), M^2) = O \( u \) . $
  The use of variance is valid because the mean is $O \( q \/ a \) = o \( M \)$.
  For a query $x$, write $d_x$ for the number of members of $cal(F)$ through $x$. In the quotient by $x$ these become lines of a projective three-space, with at most $C u$ in any point or plane. If $d_x > C' u$, a constant fraction of pairs of these quotient lines are skew. Indeed, if no line meets half the others, this is immediate. Otherwise fix a line meeting at least half. Among its neighbors, a given line has only $O \( u \)$ companions with the same intersection point or the same spanning plane with the fixed line. All remaining pairs of neighbors are skew. Two corresponding original planes intersect exactly in $x$. Therefore
  #[#set math.equation(numbering: n => "(40)")
   $ sum_(d_x > C' u) d_x^2 lt.eq C r^2 . $ <eq:rich-plane-second-moment>]
  Count incidences at the tail points, splitting according to this threshold and applying Cauchy–Schwarz:
  $ r M \/ 2 lt.eq C n u + C sqrt(n) thin r . $
  By (39), $r lt.eq C n u \/ M$. Equation (40) now implies that
  #[#set math.equation(numbering: n => "(41)")
   $ d_x lt.eq q^(4 - 2 v) e^chi a^(- 4) $ <eq:rich-plane-local>]
  outside at most $C q^2 e^(- 2 chi)$ centers.
  Next consider a rich plane contained in a head hyperplane, and take the earliest such hyperplane, with index $j$. Earlier noncontaining cells contribute fewer than $M \/ 4$ points, and later cells contribute none. Richness therefore requires at least $M \/ 2$ points of cell $j$. For these to remain outside $O_x$, the center must lie in an earlier hyperplane. This allows at most $C j q$ centers on the plane. Let $f_j$ be the original cell size divided by $n$. If $a > C f_j$, variance within hyperplane $j$ bounds these planes by $C B f_j \/ a^2$. Summing their center multiplicities gives at most $C q^3 \/ a$, because
  $ sum_j j f_j lt.eq frac(n a, C_0 q^2) sum_j f_j lt.eq frac(n a, C_0 q^2) . $
  Markov’s inequality at the threshold in (41) makes the exceptional fraction at most $C q^(v - 2) e^(- chi) a^3 = o \( 1 \)$.
  If $a lt.eq C f_j$, then $x$ belongs to two original hyperplanes whose cell fractions are at least $c a$, by the nonincreasing order. There are at most $C \/ a$ such hyperplanes; the union of their pairwise intersections has at most $C q^2 \/ a^2$ points. Relative to $n$, this is at most $C e^(- .8 g_1) = o \( 1 \)$ in the present range. All exceptions remain $o \( n \)$ after summing over the dyads.
  We have bounded the number of rich overlap planes through every remaining $x$ by $C q^(4 - 2 v) e^chi a^(- 4)$. Each gives at most $C q^2$ ordered hyperplane pairs. This proves (34) in the remaining case. The degree estimate continues to follow from (38). The fixed powers of two from neighboring dyads and all constant factors are absorbed by the exponential slack. This completes the bounds outside $o \( n \)$ points.
  ===== 8.2.2 The stronger bound used only for ambient points. <the-stronger-bound-used-only-for-ambient-points.>
  If $g_1 < - 4 P$, the dominant-line degree divided by $B$ is at most $C e^(g_1) \/ t lt.eq e^(- 3 P)$. If $g_1 > chi_0$, which can occur only in dimension four, the maximum line strength $C e^(- g_1)$ is smaller than $t \/ 2$; there is no dominant strong overlap.
  In the remaining range $- 4 P lt.eq g_1 lt.eq chi_0$, exclude every center with an outside-own radial line of strength greater than $t \/ 2$. Here $g_0 = sigma \/ 2 + g_1 > chi_0$ and $t \/ 2 gt.double e^(- g_0 \/ 20)$, so the global center–line bound already proved costs at most
  $ C q^2 \/ t^2 lt.eq n e^(C P) $
  centers. There are now no strong pairs in dimension three. In dimension four only nondominant strong pairs remain, and
  $ Delta_x \( t \) \/ B lt.eq C q^(v - 2) t^(- 2) lt.eq C q^(- 1 \/ 2 + o \( 1 \)) < e^(- 3 P) . $
  Here $P = o \( sigma \)$ and $log \( 1 \/ t \) = O \( log sigma \) = o \( P \)$. These exclusions give (35). They have not been charged to the $o \( n \)$ exceptional set, as required. ◻
]

#prodef([Remark 8.3.])[
  The distinction between the two exceptional sets is essential. The second-moment validation argument can lose only $o \( n \)$ training points, so it uses (34)–(34). The stronger degree estimate (35) is used only to bound the size of the predictor’s ambient output, where an additional $n exp \( C P \)$ points are permitted.
] <rem:geometry-validation>

== 9 The Poisson score <sec:predictor-score>

We now construct the set promised by the predictor in the small-cell case. The training set and its assignment cells come from Lemma 20. The geometric estimates control dependence between tests through the same query point. Our immediate task is to turn those estimates into a score which accepts many training points and few ambient points.

Throughout this section write

$ n = \| S \| = q^(1 + v) \, #h(2em) n' = \| S' \| in \[ n \/ 4 \, n \] \, #h(2em) B = q^d \/ n' \,\
xi = L \/ 100 \, #h(2em) chi = P \/ 100 \, #h(2em) chi_0 = P \/ 10000 . $

We are in the case $n > 100 q P$; the enumeration case was treated earlier. For a query point $x$, let $O_x subset.eq S'$ be its own set: the union of the assignment cells of the earliest flats containing $x$ in the two captured lists. An absent list contributes the empty set. Its fraction $f = \| O_x \| \/ n'$ is at most $.08$. The cell table determines this fraction, including the intersection of the two cells. It also determines whether a sampled training point belongs to $O_x$.

Let $cal(C)$ contain the cells from each list and their cross intersections. These are three partition systems, so $sum_(C in cal(C)) \| C \| \/ n' lt.eq 3$. For a hyperplane $H$, put

$ lambda_H = frac(q \| S' ∩ H \|, n') \, #h(2em) f_C = frac(\| C \|, n') \, #h(2em) lambda_(H \, C) = frac(q \| C ∩ H \|, n') . $

The exceptional hyperplanes form the deterministic set

#[#set math.equation(numbering: n => "(42)")
 $ cal(E) = { H : \| lambda_H - 1 \| > .1 } med union #h(-0.16667em) union.big_(C in cal(C)) { H : \| lambda_(H \, C) - f_C \| > .02 } . $ <eq:exceptional-hyperplanes>]

A hyperplane is #emph[typical] if it does not belong to $cal(E)$. The encoder may use this set in analyzing a row; the decoder will not need it to compute the score.

A #emph[pencil] at $x$ is the family of all hyperplanes containing $x$. Take $R$ independent Poisson batches, each of mean $L q$, whose points are independent and uniform in $S'$. Let $Z subset.eq cal(E)$ be the hyperplanes empty in every batch, put $z = \| Z \|$, and let $z_x$ count the members of $Z$ containing $x$.

For each point $x$, set $b_0 = e^(- L \( 1 - f \))$. Its score is

#[#set math.equation(numbering: n => "(43)")
 $ A_x = sum_(H in.rev x) product_(r = 1)^R upright(bold(1)) { upright("batch ") r upright(" has no point of ") O_x ∩ H } #scale(x: 120%, y: 120%)[\(] upright(bold(1)) { upright("batch ") r upright(" has no point of ") \( S' \\ O_x \) ∩ H } - b_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:poisson-score>]

The procedure includes every sampled point. It includes an unsampled point exactly when $A_x < .5 z \/ q$. The samples and cell data determine (43); only the integer $z$ is additional information.

The score will approximate $z_x$: empty exceptional hyperplanes give its main contribution, and centering suppresses typical hyperplanes. We will show that $z_x$ is small for most training points and large for most ambient points.

#thm([Lemma 9.1.])[
  (Score procedure).  #emph[Assume the small-cell conclusions of Lemma 20 and, when $d gt.eq 3$, the estimates of Lemma 22 for outside-own radial lines and hyperplane pairs. Assume also 
$ \| S \| \| T \| gt.eq q^(d + 1) e^(- b) \, #h(2em) frac(e \( S \, T \), \| S \| \| T \|) lt.eq tau / q \, #h(2em) b = O \( D sigma^(6 beta) \) \, $

 with the predictor’s parameter ranges and $2 lt.eq d lt.eq 4$. Take $R$ independent Poisson batches, each of mean $L q$, sampled uniformly from $S'$. From the batches, the transmitted cell data and one additional integer $z$, this score procedure computes a set $W$ of points on the $S$-side. With probability at least $exp \[ - C \( P tau + 1 \) \]$, the row has at most $2 q P$ samples and satisfies 
$ \| W \| lt.eq n e^(C P) \, #h(2em) \| W ∩ S' \| gt.eq c n' . $

 These are simultaneous assertions under the original Poisson sampling law. The procedure does not condition on finding a successful row.]
] <lem:score-procedure>

Here are the geometric inputs used in dimensions three and four, stated explicitly to fix the interface. Apart from $o \( n \)$ centers, the number of radial lines of outside-own strength at least $a$ is at most $q^(2 - 2 v) e^chi a^(- 100)$. Among any pencil family whose outside-own mass is at most two, the overlap graph at level $a$ has ordered edge count and maximum degree at most

#[#set math.equation(numbering: n => "(44)")
 $ E_a lt.eq B^2 e^(2 chi) a^(- 200) \, #h(2em) Delta_a lt.eq B e^(2 chi) a^(- 200) . $ <eq:score-geometric-inputs>]

For the ambient analysis, after excluding an additional $n e^(O \( P \))$ centers, its degree at $t = 1 \/ \( 100 p \)$ is at most $B e^(- 3 P)$, where $p$ is an even integer in $\[ 10000 sigma \/ P \, 10000 sigma \/ P + 2 \]$. In the case $g_1 = \( v - 1 \) sigma > chi_0$, which occurs only in dimension four, outside-own strengths are at most $C e^(- g_1)$. The global number of center–line incidences of strength at least $a > e^(- .05 g_0)$, where $g_0 = \( v - .5 \) sigma$, is at most $C q^2 \/ a^2$. Lemma 22 proves these statements without sampling. All dyadic levels below range from $q^(- 10)$ to two. Every positive strength or overlap is at least $q \/ n'$, so this range includes all nonzero quantities which occur.

We shall repeatedly use the following consequences of the parameter hierarchy:

#[#set math.equation(numbering: n => "(45)")
 $ log sigma = o \( P \) \, quad R log L = o \( P \) \, quad b + P tau = o \( L \) \, quad L = o \( P \) \, quad P = o \( sigma \) . $ <eq:score-parameter-slack>]

They hold uniformly in the allowed range of $D$, for fixed $eta > 0$ and sufficiently large $q$. In particular $R \/ 2 > 200$ and $R > 5000$.

=== 9.1 Empty exceptional hyperplanes <subsec:score-exceptional>

The incidence variance identity gives

#[#set math.equation(numbering: n => "(46)")
 $ sum_H \( lambda_(H \, C) - f_C \)^2 lt.eq C q B f_C \, #h(2em) sum_H \( lambda_H - 1 \)^2 lt.eq C q B . $ <eq:cell-variance>]

Replacing the exact means by $f_C$ and one changes only a negligible term, since $q p_d = 1 - 1 \/ Q_d$. Summing the first estimate over the three partition systems, then using the thresholds in (42), gives

#[#set math.equation(numbering: n => "(47)")
 $ \| cal(E) \| lt.eq C q B \, #h(2em) sum_(H in cal(E)) lambda_H lt.eq C q B . $ <eq:exceptional-mass>]

For the second assertion, use Cauchy–Schwarz and the full-set variance in (46).

We call a pencil regular if it contains at most $B e^xi$ members of $cal(E)$, and if the pencil sum of each clipped squared deviation in (46) is at most $B e^xi$. Here clipping replaces a squared deviation $u^2$ by $min { 1 \, u^2 }$. Only $o \( n \)$ centers have an irregular pencil. Indeed, a clipped weight $w_H in \[ 0 \, 1 \]$ has $sum_H w_H lt.eq C q B f_C$ and $sum_H w_H^2 lt.eq sum_H w_H$. Applying incidence variance in the opposite direction gives a total pencil variance at most $C q^d B f_C$, with mean $O \( B f_C \)$. Chebyshev’s inequality bounds its exceptional centers by $C n' e^(- 2 xi) f_C$. Sum this bound using $sum_C f_C lt.eq 3$; the full-set and exceptional-set indicator estimates have the same proof. This argument pays for the number of cells through their total mass, not their cardinality.

Poisson splitting makes the sample counts at different point–batch pairs independent. The average of $lambda_H$ over $H in T$ is at most $4 tau$. Thus there is a fixed $T_0 subset.eq T$ with $\| T_0 \| gt.eq \| T \| \/ 2$ and $lambda_H lt.eq 8 tau$ for every $H in T_0$. For large $q$, these hyperplanes lie in $cal(E)$, and the product-size assumption gives $\| T_0 \| gt.eq c q B e^(- b)$. If $Y$ counts the members of $T_0$ empty in all batches, then

$ bb(E) Y gt.eq \| T_0 \| e^(- 8 P tau) \, #h(2em) 0 lt.eq Y lt.eq \| T_0 \| . $

The second bound, rather than independence of empty-hyperplane events, yields

#[#set math.equation(numbering: n => "(48)")
 $ bb(P) { z gt.eq z_min } gt.eq 1 / 2 e^(- 8 P tau) \, #h(2em) z_min = c q B e^(- b - 8 P tau) . $ <eq:z-event>]

Here and below decrease the absolute constant $c$ if necessary.

We may require at the same time

#[#set math.equation(numbering: n => "(49)")
 $ sum_(H in Z) lambda_H lt.eq .001 z . $ <eq:z-small-mass>]

The terms with $lambda_H lt.eq 10^(- 4)$ contribute at most $10^(- 4) z$. For the others, (47) gives expected contribution at most $C q B e^(- 10^(- 4) P)$. Markov’s inequality at $.0009 z_min$ fails with probability at most $C e^(b + 8 P tau - 10^(- 4) P) = o \( e^(- 8 P tau) \)$, by (45).

For each resulting $Z$, incidence variance shows that

#[#set math.equation(numbering: n => "(50)")
 $ z_x gt.eq .8 z \/ q quad upright("outside at most ") C q^(d + 1) \/ z upright(" ambient points") . $ <eq:z-ambient>]

On the training set,

$ sum_(x in S') z_x = n' / q sum_(H in Z) lambda_H lt.eq .001 n' z \/ q . $

Consequently at least $.99 n'$ training points satisfy $z_x lt.eq .1 z \/ q$.

The exceptional part of the score equals $\( 1 - b_0 \)^R z_x$, with error in absolute value at most $b_0 \| cal(E) ∩ { H : H in.rev x } \|$. For a member of $Z$ every factor is $1 - b_0$. For any other exceptional hyperplane, either an own hit makes its product zero or an outside-own hit supplies a factor $- b_0$; every other factor has magnitude at most one. At a regular pencil the error is at most $B e^(- .91 L) = o \( z_min \/ q \)$, and $\( 1 - b_0 \)^R = 1 - o \( 1 \)$. It remains to control the sum $T_x$ over the nonexceptional hyperplanes. This is the only probabilistic issue left in separating the two bounds on $z_x$.

=== 9.2 The second moment on training points <subsec:score-second-moment>

Fix $x$. The #emph[schedule] of a point or direction is the vector of its sample counts in the $R$ batches. Condition first on $x$ being unsampled and then on the schedules of all points of $O_x \\ { x }$. The own-empty multipliers in (43) are now fixed zeros or ones. All remaining point counts are still independent Poisson variables. Group them by their radial lines $ell$ through $x$, with strengths

$ a_ell = q / n' \| ell ∩ \( S' \\ \( O_x union { x } \) \) \| . $

A line has a hit in a specified batch with probability $1 - e^(- L a_ell)$. For a typical hyperplane put

$ lambda'_H = sum_(ell subset H) a_ell \, #h(2em) delta'_H = lambda'_H - \( 1 - f \) \, #h(2em) theta_(H H') = sum_(ell subset H ∩ H') a_ell . $

The union defining $O_x$ uses two cells minus their intersection. The exceptional thresholds therefore give

#[#set math.equation(numbering: n => "(51)")
 $ lambda'_H gt.eq .75 \, #h(2em) \| delta'_H \| lt.eq .17 \, #h(2em) D_x := sum_(H upright(" typical")) \( delta'_H \)^2 lt.eq C B e^xi $ <eq:typical-masses>]

at a regular pencil. The last bound follows by summing the relevant clipped squares. Removing $x$ contributes at most $O \( q^(d - 1) \( q \/ n' \)^2 \) = O \( B \)$, since $n' gt.eq n \/ 4 > 25 q P$. Also $lambda'_H lt.eq lambda_H lt.eq 1.1$, so the geometric input applies.

Temporarily omit the fixed own multiplier and write the one-batch term as

$ X_H = upright(bold(1)) { H upright(" is outside-own empty") } - b_0 . $

Then

$ u_H := bb(E) X_H = e^(- L lambda'_H) - b_0 \, #h(2em) \| u_H \| lt.eq L e^(- .75 L) \| delta'_H \| \, $

and for distinct $H \, H'$,

$ bb(E) X_H X_(H') = u_H u_(H') + e^(- L \( lambda'_H + lambda'_(H') \)) \( e^(L theta_(H H')) - 1 \) . $

Since $lambda'_H + lambda'_(H') - theta_(H H') gt.eq .75$,

#[#set math.equation(numbering: n => "(52)")
 $ \| bb(E) X_H X_(H') \| lt.eq L^2 e^(- .75 L) \( \| delta'_H delta'_(H') \| + theta_(H H') \) \, #h(2em) bb(E) X_H^2 lt.eq 2 e^(- .75 L) . $ <eq:one-batch-moments>]

The fixed multipliers can only reduce the absolute bounds. More precisely, after the own schedules are fixed, the full product for a hyperplane is either identically zero or has all its own-empty multipliers equal to one. Thus they do not alter the signed cancellation used below.

In dimension two the overlaps vanish. In higher dimensions, (44) and dyadic summation give

$ sum_(H eq.not H') theta_(H H')^R lt.eq B^2 exp \( 2 chi + O \( R + log sigma \) \) . $

For the deviation terms, $R gt.eq 2$ and $\| delta'_H \| < 1$ give $sum_(H \, H') \| delta'_H delta'_(H') \|^R lt.eq D_x^2$. Finally $Q_(d - 1) = O \( B^2 \)$, because $n' lt.eq n lt.eq C q^(\( d + 1 \) \/ 2)$. Summing (52) to the $R$-th power and using (45) proves

#[#set math.equation(numbering: n => "(53)")
 $ bb(E) T_x^2 lt.eq B^2 e^(- .6 P) . $ <eq:validation-second-moment>]

This estimate is uniform in the conditioned own schedules. It holds at all centers except the $o \( n \)$ pencil and geometric exceptions; it uses none of the additional ambient exclusions.

In dimension two, different pencil lines have disjoint outside-$x$ samples. Thus their score terms are independent under the same conditioning. Their variance sum is at most $C q e^(- .6 P)$, and their mean is at most $B e^(- c P)$, by the one-batch mean bound and $D_x$. Bernstein’s inequality gives

#[#set math.equation(numbering: n => "(54)")
 $ bb(P) { \| T_x \| > z_min \/ \( 10 q \) } lt.eq q^(- 50) . $ <eq:score-dimension-two>]

Indeed $B gt.eq c sqrt(q)$, $P = o \( sigma \)$, and $e^(c P) gt.double sigma$. This settles the ambient tail in dimension two. The next subsection treats dimensions three and four, where pencil tests share radial lines.

=== 9.3 An ambient moment bound <subsec:score-high-moment>

Choose the even moment order $p$ above, and put $K_c = 200$, $J = 5000$. If $g_1 > chi_0$, let $cal(G)_x$ be the event that every outside-own radial line hits in fewer than $J$ batches. Otherwise $cal(G)_x$ is the whole sample space. In the high case a line of strength $a$ violates the condition with probability at most $\( 2 P a \)^J$. The global geometric line bound and the maximum strength $C e^(- g_1)$ give, after summing the dyads above $e^(- .05 g_0)$,

$ sum_x bb(P) \( cal(G)_x^c \) lt.eq C q^2 P^J e^(- \( J - 2 \) g_1 + O \( J \) + O \( log sigma \)) + o \( n \) lt.eq n . $

For the lower dyads, the elementary bound of $C q^7$ center–line pairs in dimensions at most four contributes at most $C q^7 \( C P e^(- .05 g_0) \)^J = o \( n \)$; here $g_0 > .5 sigma$. These are probabilities under the fixed-point conditioning, uniformly in the own schedules.

We prove, at every remaining ambient center,

#[#set math.equation(numbering: n => "(55)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] T_x^p upright(bold(1))_(cal(G)_x) #scale(x: 120%, y: 120%)[\]] lt.eq B^p e^(- .1 p P) . $ <eq:ambient-high-moment>]

Expand the power into ordered $p$-tuples of typical hyperplanes. Join two distinct tuple hyperplanes when their overlap exceeds $t = 1 \/ \( 100 p \)$. A component is a connected component of this graph. A simple singleton is an isolated hyperplane occurring in exactly one tuple position. A positive-strength radial direction is #emph[external] if it is contained in hyperplanes from two different components. A batch #emph[touches] a hyperplane when it has a hit on an external direction contained in that hyperplane. Thus sharing a direction always means containing that radial line, not merely intersecting it at $x$. The total external mass in any tuple hyperplane is at most $\( p - 1 \) t < .01$: sum its overlap with tuple hyperplanes in other components.

Condition on all external schedules. Internal schedules belonging to different components are independent. Directions contained in no tuple hyperplane contribute an independent truncation probability at most one, which can be omitted from the absolute expectation bound. The remaining truncation condition splits into its external condition and one internal condition per component. The internal mass in every hyperplane is at least $.74$. In a batch with no external hit the expected absolute value of its factor is at most $2 e^(- .74 L)$. If there is an external hit the factor has magnitude $b_0 lt.eq e^(- .92 L)$. A component containing two distinct hyperplanes, or a singleton repeated in the tuple, consequently costs at most

#[#set math.equation(numbering: n => "(56)")
 $ e^(- .7 P) . $ <eq:nonsimple-attenuation>]

To see this, keep only the absolute factors of one of its hyperplanes; all other absolute factors are at most one. Drop its internal truncation and multiply the one-batch bounds. This bound is uniform in the external schedules.

For a simple singleton $H$, let $theta_max$ be its largest overlap with another tuple hyperplane, or zero if there is none. The external mass is at most $p theta_max lt.eq .01$. In an untouched batch its signed mean has magnitude at most $L e^(- .74 L) \( \| delta'_H \| + p theta_max \)$; a touched batch has factor $- b_0$. If fewer than half the batches are touched, the product of means is therefore bounded in absolute value by

#[#set math.equation(numbering: n => "(57)")
 $ e^(- .68 P) #scale(x: 120%, y: 120%)[\(] \| delta'_H \|^(R \/ 2) + \( p theta_max \)^(K_c) #scale(x: 120%, y: 120%)[\)] . $ <eq:simple-signed-attenuation>]

Here $\( C L \)^R = e^(o \( P \))$, and $R \/ 2 gt.eq K_c$. If at least half are touched, the bound is instead $e^(- .68 P) upright(bold(1))_(upright("BAD") \( H \))$, where $upright("BAD") \( H \)$ denotes this condition on the external schedules.

Internal truncation adds to (57) at most

#[#set math.equation(numbering: n => "(58)")
 $ e^(- .68 P) sum_(ell subset H) \( P a_ell \)^J . $ <eq:truncation-error>]

For a direct verification, union over a line with hits in $J$ specified batches. Each forced batch has score factor $- b_0$ and probability at most $L a_ell$. Every remaining batch has absolute expectation at most $2 e^(- .74 L)$. Summing the choices of forced batches gives $\( P a_ell \)^J$ while retaining the displayed attenuation. Thus no independence conditional on the truncation event is being asserted.

We can now designate each simple singleton as a deviation, shift, truncation-error or BAD term according to these bounds. The first three have respective weights

$ \| delta'_H \|^(R \/ 2) \, #h(2em) \( p theta_max \)^(K_c) \, #h(2em) sum_(ell subset H) \( P a_ell \)^J \; $

the last has its BAD indicator. The truncation-error designation is absent when $g_1 lt.eq chi_0$, since $cal(G)_x$ is then the whole space. Every simple position retains $e^(- .68 P)$, including positions whose additional weight will be dropped in the counting below.

===== 9.3.1 Counting components and the first three designations. <counting-components-and-the-first-three-designations.>

Normalize all counts by $B$ for each tuple position. Identifying repeated positions and choosing orders or component trees costs $p^(O \( p \))$. Begin each component with at least two distinct hyperplanes by an ordered edge. Its normalized count is at most $e^(2 chi) \( C \/ t \)^(K_c)$. Every subsequent distinct vertex along a tree costs at most $Delta_t \/ B lt.eq e^(- 3 P)$; a repeated position costs $1 \/ B$. A repeated singleton has normalized cost $O \( 1 \)$ for its first two positions, since $Q_(d - 1) = O \( B^2 \)$, and $1 \/ B$ thereafter.

Encode all deviation and truncation-error singletons next. The normalized sum of deviation weights is at most $D_x \/ B lt.eq C e^xi$. For the error weights, the number of pencil hyperplanes containing a fixed radial line is at most $C q^2$. In the high case their normalized sum is consequently bounded by

$ frac(C q^2, B) sum_ell \( P a_ell \)^J lt.eq e^(2 chi) . $

Indeed use the local line-count estimate dyadically, the identity $\( q^2 \/ B \) q^(2 - 2 v) = O \( e^(- g_1) \)$, and the maximum strength $C e^(- g_1)$. The resulting bound is $exp \( chi - \( J - 99 \) g_1 + J log P + O \( J + log sigma \) \)$, which suffices because $g_1 > chi_0 gt.double log P$.

For a positive shift weight choose a neighbor attaining the largest overlap, and its dyad $a lt.eq theta < 2 a$. If the neighbor is already encoded, the normalized weighted choice costs at most

$ \( Delta_a \/ B \) \( 2 p a \)^(K_c) lt.eq e^(2 chi) \( 2 p \)^(K_c) . $

Otherwise encode the ordered pair using $E_a \/ B^2$; the same cancellation holds. The neighbor is then a shift or BAD singleton, because the other types have already been encoded. Drop its extra weight, which is at most one, but retain its attenuation. Each operation encodes one or two new vertices, so this procedure terminates even when the chosen-neighbor relation contains cycles.

Only unencoded BAD singletons remain. We next give the complete certificate count for their schedule requirements.

===== 9.3.2 Certificates for the BAD singletons. <certificates-for-the-bad-singletons.>

For each external direction $ell$ and batch $r$, the hit indicator has probability $1 - e^(- L a_ell) lt.eq L a_ell$. These indicators are independent. We use a dictionary of directions, maintaining the following invariant: every dictionary direction belongs to an already encoded hyperplane and has at least one specified positive hit event. When a new direction is first specified, pay for its newly specified direction–batch events. Later references to this dictionary entry impose no new hit requirement. In particular they never pay for the same random event twice.

This is a union bound over static descriptions. For each fixed tuple and description, the retained positive requirements involve distinct direction–batch pairs and have probability at most the product of their $L a_ell$’s. Absence requirements may be dropped. The description chosen for an actual realization can depend on that realization; no conditional independence along this choice is needed.

===== 9.3.3 Stage 1: anchors. <stage-1-anchors.>

First consider $g_1 lt.eq chi_0$. If an unencoded vertex has a touched direction shared with an encoded hyperplane $H_0$, use it as an anchor. For a new direction, the weighted sum of its direction and batch choices inside $H_0$ is at most

#[#set math.equation(numbering: n => "(59)")
 $ sum_(r = 1)^R sum_(ell subset H_0) L a_ell lt.eq 2 P . $ <eq:anchor-weight>]

For an old direction use a dictionary reference and drop its hit requirement. The anchored hyperplane can be chosen in at most $C q^(d - 2)$ ways, giving normalized cost $C q^(d - 2) \/ B lt.eq C q^(v - 1) lt.eq C e^(chi_0)$. Encode it and add any new direction.

If $g_1 > chi_0$, apply this step only when there are two geometrically distinct touched directions shared with encoded hyperplanes. Choose the two anchors in succession using (59) or dictionary references. They span a projective plane, so the normalized number of possible hyperplanes is at most $C q^(d - 3) \/ B lt.eq C q^(v - 2)$. The two encoded neighbors need not be distinct, but the two directions must be. If this step is unavailable, there is at most one touched direction to the encoded set. On $cal(G)_x$ it accounts for fewer than $J$ batches.

===== 9.3.4 Stage 2: new pairs. <stage-2-new-pairs.>

Recheck the anchor steps after every operation. If no anchor step applies, and two unencoded vertices share hits in at least $K_c$ distinct batches on directions contained in no encoded hyperplane, encode that ordered pair. Choose an overlap dyad $a lt.eq theta < 2 a$ and exactly $K_c$ of those batches, with one witnessing direction in each. All these directions are outside the dictionary. Their specified direction–batch events are distinct even if a direction repeats. For the fixed pair the sum of their probability weights is at most $\( 2 P a \)^(K_c)$. Combined with the pair count this costs at most

#[#set math.equation(numbering: n => "(60)")
 $ \( E_a \/ B^2 \) \( 2 P a \)^(K_c) lt.eq e^(2 chi) \( 2 P \)^(K_c) . $ <eq:pair-certificate-cost>]

Add both vertices to the encoded set and the new directions to the dictionary, and resume the checks. Restricting new-direction choices to entries outside the dictionary preserves independence. Enlarging their positive weighted sum to all directions is only an upper bound on that sum; it does not turn repeated events into independent ones.

===== 9.3.5 Stage 3: residual roots. <stage-3-residual-roots.>

Suppose none of these operations remains possible. At each residual vertex, discard its fewer than $J$ batches touching the encoded set in the high case; in the low case there are none. Choose a witnessing direction and another residual vertex for each remaining touched batch. No neighbor occurs in $K_c$ such batches, since that would allow the pair operation. No direction occurs in $K_c$ such batches either: fix any residual neighbor containing that direction to obtain the same contradiction. Greedily selecting a witness and deleting those with either its neighbor or its direction gives at least

$ h_0 = ⌊frac(R \/ 2 - J, 2 K_c)⌋ $

distinct neighbors on distinct directions for every residual vertex.

There is a root set containing at most one tenth of the residual vertices such that every nonroot has two of these witness neighbors among the roots. To prove this, select roots independently with probability $1 \/ 20$. A fixed witness list has fewer than two selected members with probability at most $\( 1 + h_0 \) e^(- c h_0)$. Its union bound over at most $p$ vertices tends to zero, since $R gt.double log p$. Markov’s inequality gives probability at most $1 \/ 2$ that more than one tenth are selected. Thus both desired properties hold for some choice. A nonempty residual set has at least $h_0 + 1$ vertices, so there is no small-set exception to this argument.

Encode the roots freely, dropping their BAD indicators. Encode every nonroot from two distinct directions to roots, as in the high-case anchor step, using dictionary references whenever possible. If there are $h$ residual vertices and $r lt.eq h \/ 10$ roots, the aggregate normalized geometric cost is at most

#[#set math.equation(numbering: n => "(61)")
 $ C^h q^(r v + \( h - r \) \( v - 2 \)) = C^h q^(h \( v - 2 \) + 2 r) lt.eq C' ""^h q^(- .3 h) \, $ <eq:root-cancellation>]

because $v lt.eq 1.5 + O \( 1 \/ sigma \)$. The geometric restrictions remain valid when a direction is already in the dictionary: reusing its name drops only a hit requirement, not the requirement that it lie in the new hyperplane. In particular, two reused but distinct directions still span a plane. Their previously paid hit events are not charged again, while the new hyperplane must still contain that plane.

At most $C K_c p$ dictionary entries and positive hit requirements have been recorded. Orders, statuses, vertex names, batches, dictionary references and dyads, together with the powers of $P$ in (59) and (60), cost at most

#[#set math.equation(numbering: n => "(62)")
 $ \( C p R sigma P \)^(C K_c p) = exp \( o \( p P \) \) . $ <eq:certificate-overhead>]

The non-overhead factors are at most $e^(2 chi + O \( 1 \))$ per operation; (61) is favorable. This completes the count of all residual BAD requirements.

Some counting bounds enlarge the sum over valid descriptions by dropping geometric constraints. The extra configurations need not have the original strong-component pattern: they are only positive summands in a numerical upper bound. Attenuation is applied to valid tuples before their description sums are enlarged, not to these extra configurations.

===== 9.3.6 Completing the moment estimate. <completing-the-moment-estimate.>

All component attenuations were uniform in the external schedules. They therefore remain valid for every static certificate. Only now integrate the external variables, dropping the external truncation indicator before using their product law. There is no assertion that these variables are independent conditional on $cal(G)_x$.

A nonsimple component pays for its first two positions by $e^(- .7 P + 2 chi)$, apart from the overhead. Each extra distinct position has factor $e^(- 3 P)$, and each repeat has factor $1 \/ B lt.eq e^(- P)$ for large $q$. Every simple position keeps $e^(- .68 P)$, with cost at most $e^(2 chi + o \( P \))$ per position. Deviation costs $e^xi$ are smaller. After the overhead (62), these bounds give (55), with room to spare. The moment order is even, so Markov’s inequality applies despite signed individual score terms. Since $z_min \/ \( 10 q \) = c B e^(- b - 8 P tau)$, it gives

#[#set math.equation(numbering: n => "(63)")
 $ bb(P) { \| T_x \| > z_min \/ \( 10 q \) \, med cal(G)_x } lt.eq exp \[ - .1 p P + p \( b + 8 P tau + O \( 1 \) \) \] lt.eq q^(- 50) . $ <eq:ambient-score-tail>]

=== 9.4 Simultaneous capture and size <subsec:score-assembly>

We finish the proof of Lemma 24 under the original sampling law. All fixed-point estimates above were conditional on the point being unsampled and uniform in its own schedules. Multiplying by the probability that it is unsampled and then averaging the own schedules makes them unconditional upper bounds for failures at unsampled points. Sampled points are included automatically.

The deterministic pencil and local geometry exceptions contain $o \( n \)$ points. On the training set, the second moment (53) gives expected typical-score failures at most $n' e^(- c P)$. Markov’s inequality shows that more than $.01 n'$ such failures has probability $e^(- c' P)$, which is negligible relative to $e^(- 8 P tau)$. This validation estimate does not discard the additional $n e^(O \( P \))$ ambient centers.

For the ambient size estimate, those additional centers may all be included. Beyond all static exceptions, (63), (54), and the bound on $sum_x bb(P) \( cal(G)_x^c \)$ show that the expected number of dynamic failures is $O \( n + 1 \)$. Markov’s inequality permits at most $n e^(C P)$ of them, except with probability $e^(- c P)$, again negligible relative to (48). The total Poisson sample count has mean $q P$ and exceeds $2 q P$ with probability $e^(- c q P)$.

Intersect these events with (48) and (49). Their probability is at least $c e^(- 8 P tau)$. At least $.99 n'$ training points have $z_x lt.eq .1 z \/ q$; after the $o \( n \)$ static exceptions and the validation failures, a fixed positive fraction have score below $.5 z \/ q$ or are sampled. They belong to $W$. Outside the ambient exceptions, $z_x gt.eq .8 z \/ q$, the exceptional-score error is $o \( z \/ q \)$, and the typical score has magnitude at most $z \/ \( 10 q \)$. Such unsampled points have score above $.5 z \/ q$ and are excluded.

Finally, the $Z$-dependent ambient exception in (50) has size

$ C q^(d + 1) \/ z lt.eq C n' e^(b + 8 P tau) lt.eq n e^(C P) . $

The at most $2 q P$ sampled points, all other ambient exceptions and dynamic failures satisfy the same size allowance. Thus $\| W \| lt.eq n e^(C P)$ and $\| W ∩ S' \| gt.eq c n'$ simultaneously on a set of rows of probability at least $exp \[ - C \( P tau + 1 \) \]$, proving the lemma.

== 10 Public descriptions and completion of the predictor <sec:predictor-completion>

The score construction supplies a successful description under true sampling from the hidden training set. We now pay for finding such samples in a table accessible to the decoder. This is the last step in the proof of Theorem 9.

In the small-cell case, send the lists and counts in Lemma 20. Propose independent rows with $R$ Poisson batch sizes of mean $L q$, and uniform entries in $U_S$. The proposal sizes have the same distribution as the true-law sizes. For any realization with $s lt.eq 2 q P$ entries, its probability of lying entirely in $S'$, conditional on those sizes, is

$ \( n' \/ \| U_S \| \)^s gt.eq exp { - 2 q P \( d_S + log 4 \) } . $

Conditional on this event and the sizes, its entries are iid uniform in $S'$.

Lemma 24 gives a collection of true-law rows of probability at least $exp { - C \( P tau + 1 \) }$ for which the sample count is at most $2 q P$, the output captures a constant fraction of $S'$, and its size is at most $n e^(C P)$. Therefore a proposed row has all these properties with probability at least

$ exp { - 2 q P \( d_S + log 4 \) - C \( P tau + 1 \) } . $

This comparison sums over successful realizations, including their sizes. It does not assume that the Poisson sizes retain their original distribution after a successful row is selected.

The encoder knows $S \, T$, so can compute the exceptional family, the number $z$ of empty exceptional hyperplanes, and all success conditions. Search at most $exp \( C' q P \( d_S + 1 \) \)$ independent rows, stopping at the first successful one. The failure probability is $O \( e^(- c q) \)$. Send its index, $z$, and the lists and counts already described. The decoder reconstructs the row and evaluates the score using the own-cell membership rule and $z$. It need not know the exceptional family, $S'$, or $T$.

Take the output inside $U_S$. This intersection preserves its capture of $S'$ and can only reduce its size. The list data cost $O \( q \)$, the integer $z$ costs $O \( sigma \)$, and the row index costs $O \( q P \( d_S + 1 \) \)$. Together with the bounded-depth reductions of Section 7, this proves the claimed $O \( q P \( d_S + d_T + P \) \)$ message bound and completes the induction on dimension.

In particular, every public-table use in the compression argument has now been justified. The selected samples may be biased by search and rejection; their likelihood and message cost were paid using the true law before that selection.

== 11 From the construction to all large integers <sec:conclusion>

We now pass from the prime parameter in the construction to the Ramsey parameter $t$. This last step gives the lower bound for every sufficiently large integer $t$, with arbitrarily small fixed slack in the logarithmic exponent.

#proof[
  #emph[Completion of the proof of Theorem 1.] Fix $0 < eta < 1 \/ 10$. By Theorem 19, for every sufficiently large prime $q$ there is a $K_5$-free graph on
  $ N = floor.l q^4 log q floor.r $
  vertices with independence number less than $k = floor.l q \( log q \)^(1 + eta) floor.r$. For a large integer $t$, put
  $ x = frac(t, 4 \( log t \)^(1 + eta)) . $
  Bertrand’s postulate, applied to $ceil.l x ceil.r$, supplies a prime with
  $ x < q < 2 ceil.l x ceil.r lt.eq 3 x $
  once $x gt.eq 2$. Since $x arrow.r oo$, this prime is large enough for Theorem 19 whenever $t$ is sufficiently large. Moreover, $q < t$ and
  $ k lt.eq q \( log q \)^(1 + eta) lt.eq 3 / 4 t < t . $
  The constructed graph therefore has no independent set of size $t$, so $r \( 5 \, t \) > N$. Since $r \( 5 \, t \)$ is an integer, this implies $r \( 5 \, t \) > q^4 log q$. Also
  $ log q gt.eq log t - log 4 - \( 1 + eta \) log log t gt.eq 1 / 2 log t $
  for all sufficiently large $t$. Consequently
  #[#set math.equation(numbering: n => "(64)")
   $ r \( 5 \, t \) > frac(t^4, 512 \( log t \)^(3 + 4 eta)) . $ <eq:lower-fixed-eta>]
  Given $epsilon > 0$, choose $eta = min { epsilon \/ 8 \, 1 \/ 20 }$, so that $4 eta < epsilon$. Increasing the threshold on $t$ until $\( log t \)^(epsilon - 4 eta) gt.eq 512$, we obtain from (64)
  $ r \( 5 \, t \) gt.eq frac(t^4, \( log t \)^(3 + epsilon)) $
  for every sufficiently large integer $t$. The parameter $eta$ is fixed before taking $t$ large, and the threshold is allowed to depend on $epsilon$.
  Theorem 2, with its absolute constant $C$, and the lower bound just proved give, for each $epsilon > 0$ and all sufficiently large integers $t$,
  $ 3 - frac(log C, log log t) lt.eq frac(4 log t - log r \( 5 \, t \), log log t) lt.eq 3 + epsilon . $
  Letting $t arrow.r oo$ and then $epsilon arrow.r 0$ proves the asserted limit and hence
  $ r \( 5 \, t \) = frac(t^4, \( log t \)^(3 + o \( 1 \))) . $
  ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
