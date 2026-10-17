#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Sharp Threshold Bound for \
Monotone Graph Properties]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For an integer $n gt.eq 2$, write $\[ n \] = { 1 \, dots.h \, n }$ and let $E_n = binom(\[ n \], 2)$ be the edge set of the complete simple graph on $n$ vertices. We identify a graph with an element of ${ 0 \, 1 }^(E_n)$. A #emph[graph property] is a family $cal(P) subset.eq { 0 \, 1 }^(E_n)$ invariant under every permutation of $\[ n \]$. It is #emph[increasing], or #emph[monotone], if adding edges preserves membership, and #emph[nontrivial] if it is neither empty nor the whole space.

Write $mu_p \( cal(P) \)$ for the probability that a graph whose edges are present independently with probability $p$ belongs to $cal(P)$. For $0 < a < 1$, define

$ p_a \( cal(P) \) = inf { p in \[ 0 \, 1 \] : mu_p \( cal(P) \) gt.eq a } . $

All logarithms in this paper are natural. In particular, $n$ always counts vertices, not edge coordinates.

#thm([Theorem 1.1.])[
  (Friedgut–Kalai sharp-threshold conjecture).  #emph[For every integer $n gt.eq 2$, every nontrivial increasing family $cal(P)$ of graphs on $n$ vertices invariant under all vertex permutations, and every $0 < epsilon < 1 \/ 2$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ p_(1 - epsilon) \( cal(P) \) - p_epsilon \( cal(P) \) lt.eq frac(2^19, \( log n \)^2) log frac(1, 2 epsilon) . $ <eq:threshold>]

]
] <thm:threshold>

The influence theorem of Kahn, Kalai, and Linial [6] connected Fourier analysis with the sensitivity of Boolean functions to individual coordinates. Bourgain, Kahn, Kalai, Katznelson, and Linial extended the influence theorem to product spaces [2]. Friedgut and Kalai combined that extension with the Margulis–Russo probability-derivative identity to show that every increasing family invariant under a transitive coordinate group has a narrow transition [5] Section 2. For graph properties, vertex permutations act transitively on the edge coordinates, and their theorem gives the universal width bound $C log \( 1 \/ \( 2 epsilon \) \) \/ log n$ [5] Theorem 1.1. They conjectured the denominator $\( log n \)^2$ with the same dependence on $epsilon$ [5] Conjecture 1.2. Theorem 1 resolves that conjecture positively; its numerical constant is only a convenient explicit choice.

The squared logarithm is the optimal order in $n$ when $epsilon$ is fixed. Friedgut and Kalai already pointed to the property of containing a clique with order proportional to $log n$: its transition width can be of order $\( log n \)^(- 2)$ [5] p. 2994. Bourgain and Kalai went beyond coordinate transitivity by using the action of the symmetry group on sets of coordinates [3]. For every fixed $eta > 0$ and $0 < epsilon < 1 \/ 2$, their graph-property bound is

$ p_(1 - epsilon) \( cal(P) \) - p_epsilon \( cal(P) \) lt.eq C_(eta \, epsilon) \( log n \)^(- 2 + eta) . $

Thus their result approached the conjectured exponent arbitrarily closely. Further progress through Fourier estimates is described below; Friedgut gives a broader account of the influence method in [4].

Two companion papers address complementary threshold-location questions: comparison of integral and fractional covers of increasing families [8] Theorem 1.1, and comparison of graph-containment thresholds with expected subgraph counts [9] Theorem 1.1. The present theorem controls the width of a transition for arbitrary increasing graph properties. Its proof does not use either comparison.

Here is the stronger estimate that drives the proof. For a Boolean function $f : { 0 \, 1 }^(E_n) arrow.r { 0 \, 1 }$, define its #emph[pivotal influence] at edge $e$ and its #emph[total influence] as follows. Here $x_(e arrow.l b)$ denotes $x$ with coordinate $e$ set to $b in { 0 \, 1 }$, and the probability is over all coordinates other than $e$.

$ I_(e \, p) \( f \) = Pr_p #scale(x: 120%, y: 120%)[\(] f \( x_(e arrow.l 1) \) eq.not f \( x_(e arrow.l 0) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) I_p \( f \) = sum_(e in E_n) I_(e \, p) \( f \) . $

#thm([Theorem 1.2.])[
  (Variance and influence).  #emph[For every integer $n gt.eq 2$, every Boolean function $f$ on $E_n$ invariant under vertex permutations, and every $0 < p < 1$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ "Var"_p \( f \) lt.eq frac(2^17, \( log n \)^2) I_p \( f \) . $ <eq:variance>]

 No monotonicity assumption is needed.]
] <thm:variance>

At the unbiased measure, Kelman, Kindler, Lifshitz, Minzer, and Safra proved the graph-symmetric estimate

$ I_(1 \/ 2) \( f \) gt.eq c thin frac(\( log n \)^2, \( log log n \)^2) "Var"_(1 \/ 2) \( f \) $

for all sufficiently large $n$ and an absolute $c > 0$ [7] arXiv version 2, Section 7.4. This is an influence estimate at $p = 1 \/ 2$; a threshold-width bound requires control throughout the transition interval. Theorem 2 removes the iterated-logarithm loss and holds uniformly for every $0 < p < 1$, including for nonmonotone properties.

Random restrictions and symmetry of Fourier coefficients are central to the arguments of Bourgain–Kalai and Kelman–Kindler–Lifshitz–Minzer–Safra [3,7]. Here the restriction is chosen through the vertices: leave free all edges touching a random block $B$ of about $sqrt(n)$ vertices, while conditioning on every other edge. Permutations inside $B$ survive every such conditioning. Their edge orbits bound each conditional influence, to which an elementary Fourier estimate applies. The resulting estimate is linear in total influence, so it can be averaged over the conditioned coordinates. Section 2 proves this estimate directly, including its dependence on the bias.

The second ingredient regards each edge set indexing a Fourier coefficient as a graph. Any nonempty such graph with at most $k^2 \/ 2$ edges has a nonisolated vertex of degree at most $k$. With sufficient probability, $B$ meets its nonisolated vertices only at that vertex. The restriction then leaves between one and $k$ edges of this graph free. This turns control of conditional Fourier degrees up to $k$ into control of original degrees up to $k^2 \/ 2$. Taking $k$ proportional to $sqrt(p \( 1 - p \)) log n$ yields (1.2); the bias factor cancels in the estimate for the remaining Fourier degrees. Section 4 then integrates the probability derivative to obtain the full quantile bound.

== 2 A low-degree estimate on biased products <sec:fourier>

We bound the mass of low-degree Fourier coefficients for Boolean functions whose individual influences are small compared with their total influence. The bound is linear in total influence, so it can be averaged over the conditioned coordinates in Section 3.

Let $J$ be a finite coordinate set, let $0 < p < 1$, and put $sigma = sqrt(p \( 1 - p \))$. Expectations and norms in this section are with respect to the product Bernoulli-$p$ measure on the indicated coordinates; in particular, $parallel g parallel_q = \( bb(E) \| g \|^q \)^(1 \/ q)$. Define

$ chi_i \( x \) = frac(x_i - p, sigma) \, #h(2em) chi_S \( x \) = product_(i in S) chi_i \( x \) \, #h(2em) chi_diameter = 1 . $

Each $chi_i$ has mean zero and second moment one. Independence therefore makes the $2^(\| J \|)$ functions $chi_S$, $S subset.eq J$, orthonormal. They form a basis of the $2^(\| J \|)$-dimensional space of real functions on ${ 0 \, 1 }^J$. Thus, with $hat(g) \( S \) = bb(E) \[ g chi_S \]$,

#[#set math.equation(numbering: n => "(2.1)")
 $ g = sum_(S subset.eq J) hat(g) \( S \) chi_S \, #h(2em) bb(E) g^2 = sum_(S subset.eq J) hat(g) \( S \)^2 \, #h(2em) "Var" \( g \) = sum_(diameter eq.not S subset.eq J) hat(g) \( S \)^2 . $ <eq:parseval>]

For $i in J$, write $Delta_i g \( x \) = g \( x_(J \\ { i }) \, 1 \) - g \( x_(J \\ { i }) \, 0 \)$, a function on the remaining coordinates. Integrating just coordinate $i$ gives

$ bb(E)_i \[ g chi_i \] = frac(p \( 1 - p \), sigma) #scale(x: 120%, y: 120%)[\(] g \( x_(J \\ { i }) \, 1 \) - g \( x_(J \\ { i }) \, 0 \) #scale(x: 120%, y: 120%)[\)] = sigma Delta_i g . $

Consequently, for $A subset.eq J \\ { i }$, $hat(g) \( A union { i } \) = sigma accent(Delta_i g, ̂) \( A \)$, where the latter Fourier coefficient is taken on $J \\ { i }$. For Boolean $h : { 0 \, 1 }^J arrow.r { 0 \, 1 }$, set

$ I_i \( h \) = Pr \( Delta_i h eq.not 0 \) \, #h(2em) I \( h \) = sum_(i in J) I_i \( h \) . $

Since $Delta_i h in { - 1 \, 0 \, 1 }$, Parseval on the remaining coordinates and then summation over $i$ give

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(S in.rev i) hat(h) \( S \)^2 = sigma^2 I_i \( h \) \, #h(2em) sum_(S subset.eq J) \| S \| hat(h) \( S \)^2 = sigma^2 I \( h \) . $ <eq:dirichlet>]

These identities do not require monotonicity.

The next estimate follows the hypercontractive influence method of Kahn, Kalai, and Linial [6]. We prove the biased two-point inequality directly and use the standard product argument of Bonami [1] Chapter III, Lemma 1, keeping the dependence on the edge probability explicit.

#thm([Lemma 2.1.])[
  #emph[Let $m gt.eq 2$ be real and let $h : { 0 \, 1 }^J arrow.r { 0 \, 1 }$ satisfy $I_i \( h \) lt.eq I \( h \) \/ m$ for every $i in J$. If 
$ k = frac(sigma log m, 64) \, $

 then 
#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(1 lt.eq \| S \| lt.eq k) hat(h) \( S \)^2 lt.eq m^(- 1 \/ 4) I \( h \) . $ <eq:low-degree>]

 Every degree cutoff is interpreted literally for integer degrees $\| S \|$; in particular, the sum is empty when $k < 1$.]
] <lem:low-degree>

#proof[
  We first prove a product norm bound. Put $rho = sigma \/ 4$, so $0 < rho lt.eq 1 \/ 8$, and define the linear operator $T_rho$ by $T_rho chi_S = rho^(\| S \|) chi_S$. For one coordinate, the bound $\| chi_i \| lt.eq sigma^(- 1)$ and the second moment identity imply
  $ \| bb(E) chi_i^3 \| lt.eq sigma^(- 1) \, #h(2em) bb(E) chi_i^4 lt.eq sigma^(- 2) . $
  For real $a \, b$, expansion and $2 \| a b^3 \| lt.eq a^2 b^2 + b^4$ yield
  $ bb(E) \( a + rho b chi_i \)^4 & lt.eq a^4 + 6 rho^2 a^2 b^2 + frac(4 rho^3, sigma) \| a b^3 \| + rho^4 / sigma^2 b^4\
 & lt.eq a^4 + frac(13 sigma^2, 32) a^2 b^2 + frac(9 sigma^2, 256) b^4 lt.eq \( a^2 + b^2 \)^2 \, $
  where the last inequality uses $sigma^2 lt.eq 1 \/ 4$.
  To tensorize this inequality, induct on $\| J \|$, the empty product being immediate. Write $g = a + b chi_i$ with $a \, b$ functions of the other coordinates, and set $A = T_rho a$, $B = T_rho b$, using the operator on those coordinates. Apply the scalar inequality pointwise and then the triangle inequality in $L^2$ to obtain
  $ parallel T_rho g parallel_4^2 lt.eq parallel A^2 + B^2 parallel_2 lt.eq parallel A parallel_4^2 + parallel B parallel_4^2 lt.eq parallel a parallel_2^2 + parallel b parallel_2^2 = parallel g parallel_2^2 . $
  The penultimate inequality is the induction hypothesis. We have proved
  #[#set math.equation(numbering: n => "(2.4)")
   $ parallel T_rho g parallel_4 lt.eq parallel g parallel_2 $ <eq:noise-norm>]
  on every finite product.
  For any real $d gt.eq 0$, let $P_(lt.eq d)$ be the orthogonal projection onto the span of the characters of degree at most $d$. If $u = P_(lt.eq d) u$, the operator $T_rho$ is invertible and Parseval gives
  $ parallel T_rho^(- 1) u parallel_2^2 = sum_(\| S \| lt.eq d) rho^(- 2 \| S \|) hat(u) \( S \)^2 lt.eq rho^(- 2 d) parallel u parallel_2^2 . $
  Applying (2.4) to $T_rho^(- 1) u$ proves $parallel u parallel_4 lt.eq rho^(- d) parallel u parallel_2$. Duality in this finite-dimensional subspace, followed by Hölder’s inequality, now gives for every real function $v$
  #[#set math.equation(numbering: n => "(2.5)")
   $ parallel P_(lt.eq d) v parallel_2 = sup_(u = P_(lt.eq d) u\
parallel u parallel_2 = 1) \| bb(E) \[ v u \] \| lt.eq rho^(- d) parallel v parallel_(4 \/ 3) . $ <eq:projection-norm>]
  If $k < 1$, (2.3) is immediate, so assume $k gt.eq 1$. Since $\| Delta_i h \|$ is the indicator of a pivotal event, $parallel Delta_i h parallel_(4 \/ 3) = I_i \( h \)^(3 \/ 4)$. Every nonempty Fourier set is counted at least once when summing over its coordinates. The derivative coefficient identity and (2.5), applied on $J \\ { i }$ with $d = k$, therefore show
  $ sum_(1 lt.eq \| S \| lt.eq k) hat(h) \( S \)^2 & lt.eq sum_(i in J) sum_(S in.rev i\
\| S \| lt.eq k) hat(h) \( S \)^2\
 & = sigma^2 sum_(i in J) sum_(A subset.eq J \\ { i }\
\| A \| lt.eq k - 1) accent(Delta_i h, ̂) \( A \)^2\
 & lt.eq sigma^2 rho^(- 2 k) sum_(i in J) I_i \( h \)^(3 \/ 2) . $
  The function $s mapsto s log \( 4 \/ s \)$ is increasing on $\( 0 \, 1 \/ 2 \]$, since its derivative is $log \( 4 \/ s \) - 1 > 0$. Hence $sigma log \( 4 \/ sigma \) lt.eq 1 / 2 log 8 < 2$, and
  $ rho^(- 2 k) = m^(sigma log \( 4 \/ sigma \) \/ 32) lt.eq m^(1 \/ 16) . $
  If $I \( h \) lt.eq m^(1 \/ 4)$, the hypothesis implies
  $ sum_i I_i \( h \)^(3 \/ 2) lt.eq sqrt(frac(I \( h \), m)) thin I \( h \) lt.eq m^(- 3 \/ 8) I \( h \) . $
  The preceding estimates bound the desired sum by $sigma^2 m^(- 5 \/ 16) I \( h \) lt.eq m^(- 1 \/ 4) I \( h \)$, including when $I \( h \) = 0$. If $I \( h \) > m^(1 \/ 4)$, Parseval and Booleanity instead give
  $ sum_(1 lt.eq \| S \| lt.eq k) hat(h) \( S \)^2 lt.eq bb(E) h^2 lt.eq 1 < m^(- 1 \/ 4) I \( h \) . $
  This proves the estimate for every $0 < p < 1$, without a lower bound on $sigma$. ◻
]

== 3 Restricting to the edges incident with a vertex block <sec:graph>

Let $E_n = binom(\[ n \], 2)$ be the edge set of the complete graph on $\[ n \]$, and let $f : { 0 \, 1 }^(E_n) arrow.r { 0 \, 1 }$ be invariant under vertex permutations. Fix $p in \( 0 \, 1 \)$ and put $sigma = sqrt(p \( 1 - p \))$. All Fourier coefficients, variances, and influences in this section use this bias. Monotonicity is not needed.

The purpose of a vertex block is to connect two different notions of degree. A restriction to the edges incident with the block retains enough symmetry to apply Lemma 3. If the block meets the nonisolated vertices of a Fourier support at just one vertex $u$, then the surviving Fourier degree is the graph degree of $u$. An $s$-edge graph with $s gt.eq 1$ has a nonisolated vertex of degree at most $sqrt(2 s)$. Thus a bound for conditional Fourier degrees up to $k$ will control original degrees up to $k^2 \/ 2$.

The restriction identity is the biased-product form of the standard Fourier restriction identity; compare [7] arXiv version 2, Lemma 2.7. We include its short proof. The next identities hold for every Boolean $f$, without a symmetry assumption.

#thm([Lemma 3.1.])[
  (Exact averaging over a restriction).  #emph[Let $F subset.eq E_n$, put $H = E_n \\ F$, and, for $y in { 0 \, 1 }^H$, let $f_y \( x \) = f \( x \, y \)$ for $x in { 0 \, 1 }^F$. If $y$ has the Bernoulli-$p$ product law, then, for every real $k > 0$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E)_y sum_(A subset.eq F\
1 lt.eq \| A \| lt.eq k) hat(f_y) \( A \)^2 & = sum_(S subset.eq E_n\
1 lt.eq \| S ∩ F \| lt.eq k) hat(f) \( S \)^2 \,\
bb(E)_y I \( f_y \) & = sum_(e in F) I_e \( f \) . $ <eq:restriction-mass>]

]
] <lem:restriction>

#proof[
  Expand $f$ in the product Fourier basis and integrate over $x$. For each $A subset.eq F$ this gives the exact finite identity
  $ hat(f_y) \( A \) = sum_(D subset.eq H) hat(f) \( A union D \) chi_D \( y \) . $
  Orthonormality on the exterior coordinates therefore gives $bb(E)_y hat(f_y) \( A \)^2 = sum_(D subset.eq H) hat(f) \( A union D \)^2$. Summing over $A$ proves (3.1). In particular, there is no constraint on the exterior Fourier degree $\| D \|$.
  For $e in F$, the pivotal event for $f_y$ at $e$ is the pivotal event for $f$ at $e$ with the exterior coordinates fixed to $y$. Averaging over $y$ and the remaining free coordinates gives $bb(E)_y I_e \( f_y \) = I_e \( f \)$; summation proves (3.1). ◻
]

#thm([Proposition 3.2.])[
  (The block estimate).  #emph[Let $3 lt.eq m lt.eq n$ be an integer, let $B$ be uniform among the $m$-element subsets of $\[ n \]$, and set 
$ F_B = { e in E_n : e ∩ B eq.not diameter } \, #h(2em) k = frac(sigma log m, 64) . $

 Then 
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(S subset.eq E_n) Pr_B { 1 lt.eq \| S ∩ F_B \| lt.eq k } hat(f) \( S \)^2 lt.eq frac(2 m, n) thin m^(- 1 \/ 4) I \( f \) . $ <eq:block-average>]

]
] <prop:block>

#proof[
  Fix $B$, and fix an arbitrary assignment $y$ to $H_B = E_n \\ F_B$. The free set $F_B$ contains #emph[all] edges with at least one endpoint in $B$: both edges within $B$ and edges from $B$ to its complement. Every permutation supported on $B$ fixes each edge of $H_B$ individually, and hence fixes $y$. The restricted function $f_y$ is consequently invariant under this permutation group even if the graph encoded by $y$ has no symmetry.
  The free-edge orbits are precisely the $binom(m, 2)$ edges within $B$ and, for each #emph[fixed] $w in \[ n \] \\ B$, the $m$ edges ${ { u \, w } : u in B }$. Every orbit has size at least $m$, since $m gt.eq 3$. The product law and the pivotal events are preserved by these permutations, so influences agree within each orbit. It follows that
  $ I_e \( f_y \) lt.eq frac(I \( f_y \), m) #h(2em) \( e in F_B \) . $
  Lemma 3 applies separately to every $y$. Its right-hand side is linear in $I \( f_y \)$, so averaging and using Lemma 4 gives
  $ sum_(S subset.eq E_n\
1 lt.eq \| S ∩ F_B \| lt.eq k) hat(f) \( S \)^2 lt.eq m^(- 1 \/ 4) sum_(e in F_B) I_e \( f \) . $
  Finally average over $B$. Each endpoint of a fixed edge belongs to $B$ with probability $m \/ n$, whence $Pr_B \( e in F_B \) lt.eq 2 m \/ n$. This proves (3.2). ◻
]

#thm([Lemma 3.3.])[
  (Capturing low Fourier levels).  #emph[Suppose $t = log n gt.eq 16$, and put 
$ m = floor.l sqrt(n) floor.r \, #h(2em) k = frac(sigma log m, 64) . $

 Then 
#[#set math.equation(numbering: n => "(3.3)")
 $ sum_(S subset.eq E_n\
1 lt.eq \| S \| lt.eq k^2 \/ 2) hat(f) \( S \)^2 lt.eq 4 m^(- 1 \/ 4) I \( f \) . $ <eq:captured-mass>]

]
] <lem:block-capture>

#proof[
  Fix a nonempty $S subset.eq E_n$ with $s = \| S \| lt.eq k^2 \/ 2$, viewed as the edge set of a simple graph. Let $V \( S \)$ be its set of nonisolated vertices and write $v = \| V \( S \) \|$. Since $s lt.eq binom(v, 2) < v^2 \/ 2$, its average degree over these vertices satisfies
  $ frac(2 s, v) < sqrt(2 s) . $
  Choose a vertex $u in V \( S \)$ whose degree $d_S \( u \)$ is at most this average. Then
  #[#set math.equation(numbering: n => "(3.4)")
   $ 1 lt.eq d_S \( u \) lt.eq sqrt(2 s) lt.eq k \, #h(2em) v lt.eq 2 s lt.eq k^2 . $ <eq:support-degree>]
  Choose $B$ uniformly among the $m$-element vertex sets. Conditioned on $u in B$, each other specified vertex belongs to $B$ with probability $\( m - 1 \) \/ \( n - 1 \)$. A union bound gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ Pr_B { B ∩ V \( S \) = { u } } gt.eq m / n (1 - \( v - 1 \) frac(m - 1, n - 1)) . $ <eq:one-vertex-event>]
  On this event, $S ∩ F_B$ consists of #emph[every] support edge incident with $u$, and contains no other support edge. Its size is therefore $d_S \( u \)$, between $1$ and $k$; it need not be $1$. Figure 1 illustrates this distinction.
  #figure(
    [(460,190) (12,176)(202,12)(a) The free coordinate set $F_B$ (246,176)(202,12)(b) One Fourier support $S$ (40,164)(1,0)52 (92,164)(108,164)(108,148) (108,56)(0,1)92 (108,56)(108,40)(92,40) (40,40)(1,0)52 (40,40)(24,40)(24,56) (24,56)(0,1)92 (24,148)(24,164)(40,164) (274,164)(1,0)52 (326,164)(342,164)(342,148) (342,56)(0,1)92 (342,56)(342,40)(326,40) (274,40)(1,0)52 (274,40)(258,40)(258,56) (258,56)(0,1)92 (258,148)(258,164)(274,164) (23,151)(15,10)$B$ (257,151)(15,10)$B$ (47,133)(65.5,117)(84,101) (84,101)(65.5,85)(47,69) (47,69)(0,1)64 (47,133)(110.5,142)(174,151) (47,133)(121,125)(195,117) (47,133)(121,103.5)(195,74) (47,133)(110.5,86.5)(174,40) (84,101)(129,126)(174,151) (84,101)(139.5,109)(195,117) (84,101)(139.5,87.5)(195,74) (84,101)(129,70.5)(174,40) (47,69)(110.5,110)(174,151) (47,69)(121,93)(195,117) (47,69)(121,71.5)(195,74) (47,69)(110.5,54.5)(174,40) (47,133) (84,101) (47,69) (174,151) (195,117) (195,74) (174,40) (24,9)(190,22)All displayed edges are free. Edges wholly outside $B$ are fixed. (318,101)(363,126)(408,151) (318,101)(373.5,109)(429,117) (408,151)(418.5,134)(429,117) (281,133) (318,101) (281,69) (408,151) (429,117) (429,74) (408,40) (302,88)(13,12)$u$ (410,156)(19,10)$v_1$ (435,115)(19,10)$v_2$ (435,72)(19,10)$v_3$ (410,26)(19,10)$v_4$ (327,143)(63,10)survives (430,146)(28,20)fixed by $y$ (440,142)(-1,-1)16 (257,9)(190,15)$\| S ∩ F_B \| = d_S \( u \) = 2$],
    caption: [Figure 1: The block restriction and the one-vertex event. In (a), $F_B$ contains every edge incident with $B$, including its internal edges; only edges with both endpoints outside $B$ are fixed. In (b), only support edges are drawn, and filled vertices are the nonisolated vertices $V \( S \)$. The event $B ∩ V \( S \) = { u }$ leaves both support edges incident with $u$ free. The exterior support edge is fixed, and its contribution is retained by the exact averaging identity (3.1). ],
  ) <fig:block>
  To bound the probability uniformly in $p$, note that $k lt.eq t$ and
  $ frac(m - 1, n - 1) lt.eq 1 / sqrt(n) \, #h(2em) \( v - 1 \) frac(m - 1, n - 1) lt.eq t^2 e^(- t \/ 2) lt.eq 256 e^(- 8) < 1 / 2 . $
  Here $t^2 e^(- t \/ 2)$ is decreasing for $t gt.eq 16$. Consequently, for every support under consideration,
  #[#set math.equation(numbering: n => "(3.6)")
   $ Pr_B { 1 lt.eq \| S ∩ F_B \| lt.eq k } gt.eq frac(m, 2 n) . $ <eq:support-detection>]
  The choice of $u$ may depend on $S$. The lower bound (3.6) is applied to each nonnegative summand $hat(f) \( S \)^2$ separately; no block must capture all supports simultaneously. Comparing with (3.2) and cancelling $m \/ \( 2 n \)$ proves (3.3). If $k^2 \/ 2 < 1$, the sum in (3.3) is empty and the conclusion holds without choosing a support. ◻
]

#proof[
  First suppose $t = log n gt.eq 16$, and choose $m$ and $k$ as in Lemma 6; in particular $m gt.eq 3$ and $k > 0$. For the remaining Fourier degrees, the Dirichlet identity (2.2) gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(\| S \| > k^2 \/ 2) hat(f) \( S \)^2 lt.eq 2 / k^2 sum_S \| S \| hat(f) \( S \)^2 = frac(2 sigma^2, k^2) I \( f \) . $ <eq:graph-tail>]
  This remains valid for $k^2 \/ 2 < 1$, when the left side includes all nonconstant coefficients. Combining (2.1), (3.3), and (3.7) yields
  #[#set math.equation(numbering: n => "(3.8)")
   $ "Var" \( f \) lt.eq (4 m^(- 1 \/ 4) + frac(2 sigma^2, k^2)) I \( f \) . $ <eq:graph-variance-preconstant>]
  For completeness, all constants can be bounded independently of $p$ and $n$. Since $m gt.eq sqrt(n) \/ 2$ and $t gt.eq 16$, $log m gt.eq t \/ 2 - log 2 gt.eq t \/ 3$. Thus
  $ frac(2 sigma^2, k^2) = frac(8192, \( log m \)^2) lt.eq 73728 / t^2 . $
  The cancellation of $sigma^2$ is exact, even when $p$ is arbitrarily close to $0$ or $1$. Also, $t^2 e^(- t \/ 8)$ is nonincreasing for $t gt.eq 16$, so
  $ 4 m^(- 1 \/ 4) t^2 lt.eq 4 thin 2^(1 \/ 4) t^2 e^(- t \/ 8) lt.eq 4 thin 2^(1 \/ 4) thin 256 e^(- 2) < 256 . $
  Thus the right-hand side of (3.8) is at most $\( 73728 + 256 \) I \( f \) \/ t^2$, which is at most $2^17 I \( f \) \/ t^2$.
  If instead $2 lt.eq n < e^16$, the same Fourier identities immediately give
  $ "Var" \( f \) lt.eq sigma^2 I \( f \) lt.eq 1 / 4 I \( f \) lt.eq frac(64, \( log n \)^2) I \( f \) . $
  Hence the single choice $C_0 = 2^17$ works for every integer $n gt.eq 2$ and every $p in \( 0 \, 1 \)$, as asserted. ◻
]

== 4 From influence to threshold width <sec:threshold>

We pass from influence to transition width using the Russo–Margulis probability-derivative formula; see Russo [10] Lemma 3 and Friedgut–Kalai [5] Lemma 2.2. We include the finite calculation with our pivotal-influence convention and then integrate the resulting differential inequality.

#proof[
  Put $f = upright(bold(1))_(cal(P))$, $mu \( p \) = bb(E)_p f$, and $C_0 = 2^17$. We first verify the probability-derivative identity with the influence convention used here. If the edge probabilities are allowed to vary separately, $bb(E) f$ is a multilinear polynomial in those probabilities. Its partial derivative in the probability at $e$ is the expectation of
  $ Delta_e f = f \( x_(e arrow.l 1) \) - f \( x_(e arrow.l 0) \) . $
  For increasing $f$, this difference takes values in ${ 0 \, 1 }$, so its expectation is $I_(e \, p) \( f \)$ when all other biases are $p$. Differentiating along the diagonal therefore gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ mu' \( p \) = I_p \( f \) . $ <eq:russo>]
  This is the usual probability-derivative formula underlying the sharp-threshold method; the calculation above proves it directly in the present finite setting.
  Since $f$ is Boolean, $"Var"_p \( f \) = mu \( p \) \( 1 - mu \( p \) \)$. Theorem 2 and (4.1) imply
  #[#set math.equation(numbering: n => "(4.2)")
   $ mu' \( p \) gt.eq frac(\( log n \)^2, C_0) mu \( p \) \( 1 - mu \( p \) \) #h(2em) \( 0 < p < 1 \) . $ <eq:differential>]
  Nontriviality and monotonicity give $f \( diameter \) = 0$ and $f \( E_n \) = 1$. Both configurations have positive probability for every interior bias, hence $0 < mu \( p \) < 1$ there, while $mu \( 0 \) = 0$ and $mu \( 1 \) = 1$. Equation (4.2) now gives $mu' \( p \) > 0$ throughout $\( 0 \, 1 \)$. Thus, by continuity, every quantile $p_a$ is the unique interior point satisfying $mu \( p_a \) = a$.
  On the interval $\[ p_epsilon \, p_(1 - epsilon) \]$, division in (4.2) is legitimate and gives
  $ frac(d, d p) log frac(mu \( p \), 1 - mu \( p \)) = frac(mu' \( p \), mu \( p \) \( 1 - mu \( p \) \)) gt.eq frac(\( log n \)^2, C_0) . $
  Integration yields
  $ p_(1 - epsilon) - p_epsilon lt.eq frac(2 C_0, \( log n \)^2) log frac(1 - epsilon, epsilon) . $
  Finally, $4 epsilon \( 1 - epsilon \) lt.eq 1$ implies
  $ log frac(1 - epsilon, epsilon) lt.eq 2 log frac(1, 2 epsilon) . $
  This proves (1.1) with $4 C_0 = 2^19$ for the entire range $0 < epsilon < 1 \/ 2$. ◻
]

To recover the additive formulation of [5] Conjecture 1.2, set

$ delta = frac(2^19, \( log n \)^2) log frac(1, 2 epsilon) \, $

and suppose $mu \( p \) > epsilon$. Then $p > p_epsilon$, so Theorem 1 gives $p + delta > p_(1 - epsilon)$. Hence $mu \( p + delta \) > 1 - epsilon$ whenever $p + delta lt.eq 1$; for larger increments, the endpoint $1$ already has probability one. Conversely, when $p_epsilon + delta < 1$, apply this strict formulation at $p > p_epsilon$ and let $p arrow.b p_epsilon$. Continuity gives $mu \( p_epsilon + delta \) gt.eq 1 - epsilon$, which is the quantile bound. When $p_epsilon + delta gt.eq 1$, that bound is automatic.

The same log-odds estimate describes the transition around its median $p_(*) = p_(1 \/ 2)$. The log odds vanish at $p_(*)$, so integration from the median gives, with $C_0 = 2^17$,

$ mu \( p_(*) - s \) & lt.eq frac(1, 1 + exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] s \( log n \)^2 \/ C_0 #scale(x: 120%, y: 120%)[\)]) &  & \( 0 lt.eq s lt.eq p_(*) \) \,\
1 - mu \( p_(*) + s \) & lt.eq frac(1, 1 + exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] s \( log n \)^2 \/ C_0 #scale(x: 120%, y: 120%)[\)]) &  & \( 0 lt.eq s lt.eq 1 - p_(*) \) . $

The endpoint cases follow by continuity.

#heading(level: 1)[References]
#bibitem([1])[Aline Bonami, #link("https://doi.org/10.5802/aif.357")[Étude des coefficients de Fourier des fonctions de $L^p \( G \)$], #emph[Annales de l'Institut Fourier] #strong[20] (1970), no.~2, 335--402.]
#bibitem([2])[Jean Bourgain, Jeff Kahn, Gil Kalai, Yitzhak Katznelson, and Nathan Linial, #link("https://doi.org/10.1007/BF02808010")[The influence of variables in product spaces], #emph[Israel Journal of Mathematics] #strong[77] (1992), 55--64.]
#bibitem([3])[Jean Bourgain and Gil Kalai, #link("https://doi.org/10.1007/s000390050015")[Influences of variables and threshold intervals under group symmetries], #emph[Geometric and Functional Analysis] #strong[7] (1997), no.~3, 438--461.]
#bibitem([4])[Ehud Friedgut, #link("https://doi.org/10.4171/ICM2022/78")[KKL's influence on me], in #emph[Proceedings of the International Congress of Mathematicians 2022], Vol.~6, Dmitry Beliaev and Stanislav Smirnov (eds.), EMS Press, 2023, pp.~4568--4581.]
#bibitem([5])[Ehud Friedgut and Gil Kalai, #link("https://doi.org/10.1090/S0002-9939-96-03732-X")[Every monotone graph property has a sharp threshold], #emph[Proceedings of the American Mathematical Society] #strong[124] (1996), no.~10, 2993--3002.]
#bibitem([6])[Jeff Kahn, Gil Kalai, and Nathan Linial, #link("https://doi.org/10.1109/SFCS.1988.21923")[The influence of variables on Boolean functions], in #emph[Proceedings of the 29th Annual Symposium on Foundations of Computer Science], IEEE Computer Society, 1988, pp.~68--80.]
#bibitem([7])[Esty Kelman, Guy Kindler, Noam Lifshitz, Dor Minzer, and Muli Safra, #link("https://doi.org/10.1007/s00039-020-00544-2")[Towards a proof of the Fourier--entropy conjecture?], #emph[Geometric and Functional Analysis] #strong[30] (2020), no.~4, 1097--1138. Accessible preprint: #link("https://arxiv.org/abs/1911.10579v2")[arXiv:1911.10579v2], 7 May 2020.]
#bibitem([8])[OpenAI, Integral and fractional expectation thresholds are equivalent, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026/paper.pdf")[OAI:Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026], 2026.]
#bibitem([9])[OpenAI, The second Kahn--Kalai conjecture, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-second-Kahn-Kalai-conjecture-September-24-2026/paper.pdf")[OAI:The-second-Kahn-Kalai-conjecture-September-24-2026], 2026.]
#bibitem([10])[Lucio Russo, #link("https://doi.org/10.1007/BF00535742")[On the critical percolation probabilities], #emph[Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete] #strong[56] (1981), no.~2, 229--237.]


