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

#align(center)[#text(size: 16pt, weight: "bold")[From partial permutation information to Fourier bounds]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 What partial observations can determine <l:introduction>

A permutation can look uniform on many labels while retaining information about the whole deck. Parity gives the simplest example: the uniform law on the alternating group has uniform images on any set of at most $n - 2$ labels. Thus partial observations require an additional argument before they can establish convergence on $S_n$. This paper develops that argument. Its input is quantitative information about partial permutations; its output is a bound on every nontrivial Fourier matrix, with the sign representation treated separately.

Let $X$ be a set of $n$ labels and $G = "Sym" \( X \)$. We regard $g in G$ as the map from initial labels to final positions. For $M subset.eq X$, let $H_M = "Sym" \( M \)$ fix $X \\ M$ pointwise. Two permutations have the same images on $X \\ M$ precisely when they lie in the same left coset $g H_M$. Consequently an upper bound on the distribution of those images is exactly an upper bound on the masses of these cosets. The elements of $g H_M$ are obtained by multiplication on the right; this convention matters when image observations are compared with inverse-image observations.

For a nonnegative measure $f$ on $G$ and an irreducible unitary representation $rho : G arrow.r U \( V_rho \)$, write

$ hat(f) \( rho \) = sum_(g in G) f \( g \) rho \( g \) \, #h(2em) D_rho = dim V_rho . $

Our Hilbert–Schmidt norm is unnormalized: $parallel A parallel_(upright("HS"))^2 = "tr" \( A^(*) A \)$. Let $D_lambda$ denote the degree of the irreducible of $S_m$ indexed by a partition $lambda tack.r m$, and set

$ C_u = sup_(m gt.eq 1) sum_(lambda tack.r m) D_lambda^(- u) quad \( u > 0 \) . $

These constants are finite, and the sums with the row and column partitions removed tend to zero. A short proof is given in Lemma 2; Section 6 retains the distinct counting proofs that give more detailed information.

#thm([Theorem 1.1.])[
  (Complementary cosets control Fourier matrices).  #emph[Partition $X$ into $b$ nonempty sets $M_1 \, dots.h \, M_b$. Put $H_i = H_(M_i)$. Suppose $f$ is a nonnegative measure on $G$ of mass at most one and, for every $g in G$ and $i$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ f \( g H_i \) lt.eq frac(B, \[ G : H_i \]) . $ <l:main-cap>]

 For every $u > 0$ and every irreducible $rho$ of degree $D$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq b B C_u D^(- 1 + \( u + 2 \) \/ b) . $ <l:main-hs>]

 There is also an independent orbit-span proof of the bound 
#[#set math.equation(numbering: n => "(1.3)")
 $ parallel hat(f) \( rho \) parallel_(upright("op"))^2 lt.eq b B C_u D^(- 1 + \( u + 2 \) \/ b) . $ <l:main-orbit>]

 No restriction is imposed on block sizes or on the multiplicities in $rho \|_(H_1 times dots.h.c times H_b)$.]
] <l:main>

The Hilbert–Schmidt conclusion implies the operator-norm conclusion, but the two proofs use different information. The orbit proof follows one vector and controls the dimension of its orbit under a small subgroup type. The isotypic proof instead bounds the entire Fourier matrix by cosetwise Plancherel. We give the orbit proof first because it isolates the multiplicity issue in a concrete linear map, and then prove the stronger norm conclusion independently.

The principal consequence is a transfer from observations of $7 n \/ 8$ labels to the product of just two independent permutations. Suppose $8$ divides $n$, the average total-variation error of these observations tends to zero, and the sign mean is $o \( 1 \)$. One can choose eight complementary blocks whose errors sum to $o \( 1 \)$, then retain a common subprobability of mass $1 - o \( 1 \)$ with coset cap one. With $b = 8$ and $u = 1$, Theorem 1 gives squared Hilbert–Schmidt norm at most $8 C_1 D^(- 5 \/ 8)$. Two convolutions have nonsign Plancherel contribution at most $\( 8 C_1 \)^2 sum D^(- 1 \/ 4)$, which tends to zero. The discarded mass and sign coefficient also vanish. Corollary 12 gives the precise conclusion. The orbit proof alone gives four convolutions, as recorded in Corollary 9. The distinction is the dimension factor saved by controlling the whole matrix, not a change in the observed marginals.

=== 1.1 The first proof and its extensions <the-first-proof-and-its-extensions>

Restriction to $H_1 times dots.h.c times H_b$ decomposes an irreducible space into tensor-product types, each tensored with its multiplicity space. The product of the factor degrees is at most $D$. Hence some factor has degree at most $D^(1 \/ b)$. Assign the whole type to one such factor. This produces an orthogonal decomposition of any test vector into $b$ pieces. The orbit of one piece under its assigned subgroup has dimension at most the sum of the squares of the small factor degrees. Multiplicity causes no extra factor: on all copies of one type the group acts by the same matrix tensored with identity. The bound $C_u$ now controls that sum. Averaging the projections onto translates of the orbit span, Schur’s lemma turns its dimension into a factor $1 \/ D$. This proves (1.3).

The next proof retains more of the Fourier matrix. The central idempotent of a subgroup type projects onto all its copies. Cosetwise convolution bounds the squared Hilbert–Schmidt norm of the projected transform, summed over every ambient irreducible. The small subgroup types cover the original representation; taking a trace against a positive operator completes (1.2). This also explains why one must count types once rather than count their multiplicities.

The complete fixed-coset route is proved in Sections 2–3. Sections 4 and 5 compare alternative coefficient arguments and retained measures for the same marginal information. Section 6 develops the shape-sensitive degree estimates needed later, and Section 7 constructs one-dimensional characters in subgroups of controlled index. Supplementary tableau and hook proofs are grouped in Appendix 16. Appendix 18 retains the projection-averaging and longest-line peeling methods, together with explicit parameter substitutions. These independent routes remain available without interrupting the main transfers.

The remaining results distinguish three kinds of additional information. First, image and inverse-image caps control opposite sides of a Fourier matrix. Section 8 places those sides together in a product of two laws. Section 9 instead works with transition kernels: the sign contribution is then an operator on a multiplicity space, not merely the scalar sign mean of a group law.

Second, the quantifiers on an information bound determine which changes of law it permits. Section 10 constructs retained laws by selecting good omitted sets separately for each permutation, under the same averaged marginal hypothesis as the fixed-partition route. Section 11 assumes an entropy comparison for every law on one common event; it can therefore condition on a rare representation-coefficient event. Section 12 obtains analogous rare-event control from a pointwise bound on accumulated reveal errors. In contrast, the single-law entropy bounds of Section 13 give a growing coset cap by clipping. They control only sufficiently large dimensions; Section 14 supplies a precise hybrid conclusion when a separate law handles the remaining diagrams by long-row decay and exact vanishing on diagrams with more than $n \/ 2$ rows.

Finally, Section 15 uses a conditional product structure: after fixing an environment, the two half-permutations are independent. A signed tabloid basis turns their image caps into matrix bounds, while a preceding law’s inverse-image caps average positive operators. Appendix 17 gives an independent arm–leg construction of the signed representation used there. These different hypotheses are kept explicit; no mixing conclusion is inferred by substituting one kind of partial information for another.

=== 1.2 Relation to earlier methods <relation-to-earlier-methods>

Fourier analysis of random walks on finite groups converts distributional convergence into estimates of matrix transforms. Diaconis and Shahshahani’s analysis of random transpositions is a fundamental example [3]; the Plancherel and total-variation steps used here belong to that framework. We keep matrix norms throughout because the laws considered here need not be central and their transforms need not be normal.

The representation-theoretic ingredients are classical. Specht modules, Young branching, induced representations from Young subgroups, and the Littlewood–Richardson rule supply the restriction and signed-tabloid constructions; see James [6] and Sagan [13]. The hook formula of Frame, Robinson, and Thrall [5] and elementary standard-tableau constructions supply degree lower bounds. The reciprocal-degree limits are part of the symmetric-group Witten-zeta theory; see Liebeck and Shalev [7] Proposition 2.5 and Theorem 2.6. We give elementary proofs suited to the different transfer arguments and retain their more detailed tableau bounds. The orbit-span and coset estimates are proved explicitly. Relative entropy enters through its chain rule and its variational behavior under conditioning; the rare-event arguments specify the changed law explicitly.

One motivation is the Thorp shuffle, introduced in [14]. Entropy methods yielded an $O \( \( log n \)^4 \)$ mixing bound for even decks and an $O \( \( log n \)^3 \)$ bound for power-of-two decks [8,9]. These bounds count elementary cut-and-interleave shuffles; on $n = 2^d$ cards, a complete coordinate sweep consists of $d$ such steps. The entropy arguments reveal and compare card trajectories, providing a methodological antecedent to the partial-information hypotheses considered here.

More directly, Czumaj and Vöcking studied the joint randomization of a fixed fraction of labeled cards under the Thorp shuffle [2]. Czumaj subsequently obtained full-permutation sampling by recursively applying partial-permutation randomizers on successively smaller sets [1]. The present transfer has a different form: complementary quotient estimates for a single law control its noncentral Fourier matrices and, with separate sign control, imply mixing after a fixed number of independent compositions of that same law. No shuffle construction or physical-time bound is assumed in the abstract proofs.

Three companion papers construct inputs for the later transfers. The coordinate-frame paper proves the all-tilt entropy estimate in Lemma 12.13 and establishes the quotient and retained sign-multiplicity estimates within the proof of Theorem 14.2 [12]. The conditional-information paper supplies the fixed-list estimate in Proposition 3.3; the palette estimate and common-event construction in Proposition 13.2 and equations (13.2)–(13.3); the random-domain estimate in Theorem 12.2; the weak-entropy and sparse-Fourier inputs in Propositions 15.1 and 15.4; and the entropy assertion (16.1) of Theorem 16.1 [10]. The conditional-permutation paper constructs the two-half environment and its independent internal permutations in the proof of Theorem 7.1 and Lemma 7.2 [11]. These estimates are established before the cited papers apply the transfer results here. Their full-deck mixing conclusions are applications, not hypotheses of the present proofs; their discarded-mass, parity, and physical-time checks remain part of those applications.

== 2 Degree sums, common trimming, and normalization <l:foundations>

We first supply the three ingredients needed to complete a transfer: a uniform count of small representation degrees, one measure satisfying all coset bounds at once, and the precise Fourier conversion to total variation. For a finite set, $U$ denotes uniform probability. For a subgroup $H lt.eq G$, the pushforward of $mu$ to $G \/ H$ is denoted by $mu_H$, so $mu_H \( g H \) = mu \( g H \)$. Our convention is $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_x \| mu \( x \) - nu \( x \) \|$ for probabilities.

#thm([Lemma 2.1.])[
  (A short reciprocal-degree proof).  #emph[For every $u > 0$, $C_u < oo$ and 
$ Z_u \( n \) := sum_(lambda tack.r n \, med lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(- u) arrow.r 0 . $

 The excluded partitions form a set, so the unique partition of one is removed only once.]
] <l:degree-basic>

#proof[
  We use the classical tableau dimension and hook formulas: $D_lambda$ is the number of fillings of the diagram of $lambda$ by $1 \, dots.h \, n$ increasing along each row and column, and
  $ D_lambda = frac(n !, product_(x in lambda) h \( x \)) \, $
  where $h \( x \)$ counts the box $x$ and the boxes strictly right of it or strictly below it [5,6]. Write $p \( k \)$ for the number of partitions of $k$, with $p \( 0 \) = 1$. Euler’s product at $x = e^(- 1 \/ sqrt(k))$ gives, for $k gt.eq 1$,
  $ log p \( k \) lt.eq sqrt(k) + sum_(j gt.eq 1) frac(1, j \( e^(j \/ sqrt(k)) - 1 \)) lt.eq sqrt(k) (1 + sum_(j gt.eq 1) j^(- 2)) lt.eq 3 sqrt(k) . $
  If a Young diagram has a top row of length $a$ and $j lt.eq a$ lower boxes, its number of standard tableaux is at least $binom(a, j)$. Put the first $j$ labels in the first $j$ top-row positions, choose the $j$ lower labels from the remaining $a$ labels, and fill the lower diagram in one fixed standard relative order. Its width is at most $j$, so every top-row predecessor is smaller. Fill the rest of the row increasingly. A tableau of any Young subdiagram extends to the full diagram by adding larger labels in an order respecting row and column predecessors.
  Orient a longest row or column as the first row and let its length be $n - j$. When $1 lt.eq j lt.eq n \/ 3$, at most $2 p \( j \)$ diagrams have this value and
  $ D_lambda gt.eq binom(n - j, j) gt.eq 2^j . $
  For each fixed $j > 0$ the binomial coefficient diverges, and $2 p \( j \) 2^(- u j)$ is summable. Dominated convergence handles this range.
  In the remaining range put $a = max \( lambda_1 \, lambda'_1 \) < 2 n \/ 3$. If $a gt.eq n \/ 10$, retain the first row and a lower Young order ideal of $floor.l a \/ 2 floor.r$ boxes; there are enough lower boxes. Extension and the preceding construction give $D_lambda gt.eq 2^a \/ \( a + 1 \)$, exponential in $n$. If $a < n \/ 10$, every hook has length at most $2 a$, and the hook formula gives $D_lambda gt.eq n ! \/ \( 2 a \)^n gt.eq \( 5 \/ e \)^n$. Both bounds beat $p \( n \) lt.eq e^(3 sqrt(n))$. Thus $Z_u \( n \) arrow.r 0$. Adding the row and column shows that the full sum tends to two; finitely many smaller values are finite. ◻
]

#thm([Lemma 2.2.])[
  (Selecting one partition).  #emph[If $n$ is divisible by $b$ and a law $mu$ on $S_n$ satisfies 
$ bb(E)_(\| M \| = n \/ b) parallel mu_(H_M) - U_(G \/ H_M) parallel_(upright("TV")) lt.eq delta \, $

 there is a partition into $b$ equal blocks for which the sum of the complementary coset errors is at most $b delta$.]
] <l:partition-selection>

#proof[
  Every block of a uniformly chosen ordered equal partition is itself a uniform $n \/ b$-subset. The expected sum of the errors is at most $b delta$, so one partition has sum no larger than that expectation. ◻
]

#thm([Lemma 2.3.])[
  (Two common trimming operations).  #emph[Let $H_1 \, dots.h \, H_b$ be subgroups of a finite group $G$, let $mu$ be a probability, and put $delta_i = parallel mu_(H_i) - U_(G \/ H_i) parallel_(upright("TV"))$ and $delta = sum_i delta_i$. There is a subprobability $f lt.eq mu$ with 
$ f \( G \) gt.eq 1 - delta \, #h(2em) f \( g H_i \) lt.eq \[ G : H_i \]^(- 1) quad \( g in G \, i lt.eq b \) . $

 For any $c > 1$, deleting the union of all cosets with original density greater than $c$ loses mass at most $c delta \/ \( c - 1 \)$. If that loss is $eta < 1$, the conditional law $nu$ has 
$ parallel nu - mu parallel_(upright("TV")) = eta \, #h(2em) nu \( g H_i \) lt.eq frac(c, 1 - eta) \[ G : H_i \]^(- 1) . $

 In particular $c = 2$ loses at most $2 delta$.]
] <l:trim>

#proof[
  Process the subgroup coset systems successively. Within each coset whose current mass exceeds its uniform mass, multiply all current point masses by the ratio of the cap to the current mass. The loss at stage $i$ is at most the original positive excess on the $i$th quotient, namely $delta_i$, because all current masses are below $mu$. Later decreases preserve earlier caps.
  There is also a simultaneous construction with the same guarantee. For each $i$, trim $mu$ separately to a measure $f_i$, and set $f \( g \) = min_i f_i \( g \)$. Then $f lt.eq f_i$ ensures every cap, while $mu - f lt.eq sum_i \( mu - f_i \)$ bounds the loss by $delta$. Thus these two constructions need not produce the same measure, but prove exactly the same assertion.
  If a coset $Q$ has $mu \( Q \) > c U \( Q \)$, then $mu \( Q \) lt.eq c \( mu \( Q \) - U \( Q \) \) \/ \( c - 1 \)$. Summing over its heavy cosets and then over subgroup systems bounds the removed mass. A surviving coset has original mass at most $c U \( Q \)$; division by $1 - eta$ gives the displayed cap. Conditioning deletes mass $eta$ and adds that same mass on the retained set, proving the variation equality. ◻
]

#thm([Lemma 2.4.])[
  (Plancherel with a mass deficit).  #emph[For every complex mass function $a$ on a finite group $G$, 
$ \| G \| sum_g \| a \( g \) \|^2 = sum_(rho in "Irr" \( G \)) D_rho parallel hat(a) \( rho \) parallel_(upright("HS"))^2 . $

 If $f gt.eq 0$ has mass $z lt.eq 1$, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ \| G \| sum_g \| f \( g \) - z U \( g \) \|^2 & = sum_(rho eq.not upright(bold(1))) D_rho parallel hat(f) \( rho \) parallel_(upright("HS"))^2 \,\
(sum_g \| f \( g \) - U \( g \) \|)^2 & lt.eq \( 1 - z \)^2 + sum_(rho eq.not upright(bold(1))) D_rho parallel hat(f) \( rho \) parallel_(upright("HS"))^2 . $ <l:centered-plancherel>]

 If $f lt.eq mu$ for a probability $mu$, its normalization, when $z > 0$, is at variation distance at most $1 - z$ from $mu$.]
] <l:plancherel>

#proof[
  Expand the squared Hilbert–Schmidt norms. The regular-character identity
  $ sum_rho D_rho chi_rho \( h^(- 1) g \) = \| G \| upright(bold(1))_(g = h) $
  proves Plancherel. Apply it to $f - z U$, whose trivial coefficient is zero, and to $f - U$, whose trivial coefficient is $z - 1$. Cauchy–Schwarz gives (2.1). Finally, $sum \| f \/ z - f \| = 1 - z = sum \| mu - f \|$, so the triangle inequality proves the normalization claim. ◻
]

With convolution $\( f * k \) \( g \) = sum_x f \( x \) k \( x^(- 1) g \)$, transforms multiply in the displayed order. If $f lt.eq mu$, positivity implies $f^(* r) lt.eq mu^(* r)$ and the missing mass is $1 - z^r lt.eq r \( 1 - z \)$. If $mu$ has sign mean $s$, then $\| hat(f) \( "sgn" \) \| lt.eq \| s \| + 1 - z$. For nearby probabilities, the corresponding sign perturbation is at most twice their total-variation distance.

#thm([Proposition 2.5.])[
  (Fourier amplification).  #emph[Let $mu_n$ be probabilities on $S_n$ with $hat(mu)_n \( "sgn" \) = o \( 1 \)$. Suppose either $f_n$ is a nonnegative subprobability with $f_n lt.eq mu_n$ and mass tending to one, or $f_n$ is a probability with $parallel f_n - mu_n parallel_(upright("TV")) = o \( 1 \)$. If, uniformly for every irreducible of degree $D > 1$, 
$ parallel hat(f)_n parallel_(upright("op")) lt.eq A D^(- beta) \, $

 where $A \, beta > 0$ are fixed, then $parallel mu_n^(* r) - U parallel_(upright("TV")) arrow.r 0$ for every fixed integer $r$ with $2 - 2 r beta < 0$. If instead $parallel hat(f)_n parallel_(upright("HS"))^2 lt.eq A D^(- gamma)$, the sufficient condition is $1 - r gamma < 0$.]
] <l:amplification>

#proof[
  The sign term tends to zero by the preceding mass bounds. In the operator case,
  $ D parallel hat(f)_n^(thin r) parallel_(upright("HS"))^2 lt.eq D^2 parallel hat(f)_n parallel_(upright("op"))^(2 r) lt.eq A^(2 r) D^(2 - 2 r beta) . $
  In the Hilbert–Schmidt case submultiplicativity gives $D parallel hat(f)_n^(thin r) parallel_(upright("HS"))^2 lt.eq A^r D^(1 - r gamma)$. The sums tend to zero by Lemma 2. The trivial coefficient tends to one. Lemma 5 gives convergence for $f_n^(* r)$; the missing mass or a telescoping replacement of the $r$ probability factors gives convergence for $mu_n^(* r)$. No normality or diagonalization is used. ◻
]

== 3 The complete transfer from disjoint coset systems <l:core-section>

The coset bounds are now available on one common measure. We first turn them into an operator estimate by following the orbit of one vector. For eight complementary coset systems, this gives convergence after four convolutions. Central projections then retain the whole Fourier matrix and reduce that count to two. Both arguments keep every restriction multiplicity; they differ in what they average.

#thm([Lemma 3.1.])[
  (The orbit of a single vector).  #emph[Let $H$ act unitarily on $V$, and suppose a vector $v$ has components only in $H$-types belonging to a set $Lambda subset.eq "Irr" \( H \)$. Then 
$ dim "span" { rho \( h \) v : h in H } lt.eq sum_(tau in Lambda) \( dim tau \)^2 . $

 All copies of a type are included in this estimate.]
] <l:single-orbit>

#proof[
  Regroup the entire $tau$-isotypic space as $V_tau ⊗ cal(A)_tau$, where $H$ acts as $tau ⊗ I$. If $v_tau$ is the component of $v$ there, its orbit lies in the image of
  $ "End" \( V_tau \) arrow.r V_tau ⊗ cal(A)_tau \, #h(2em) Q mapsto \( Q ⊗ I \) v_tau . $
  The image has dimension at most $\( dim tau \)^2$, independently of $dim cal(A)_tau$. Equivalently, writing $v_tau = sum_(j = 1)^(dim tau) e_j ⊗ a_j$, the orbit lies in $V_tau ⊗ "span" \( a_j \)$. Sum over inequivalent types. ◻
]

Write $a = dim tau$, $W_tau = "span" { rho \( h \) v_tau : h in H }$, and $T \( Q \) = \( Q ⊗ I \) v_tau$. The key point is the map in Figure 1: multiplicity enlarges the ambient space, but not the matrix space that moves a fixed vector.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$"End" (V_ tau )$#linebreak()dimension $a^2$]])])
  content((5.146, 0), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$"im" T supset.eq W_ tau$#linebreak()dimension at most $a^2$]])])
  content((5.146, -2.122), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$V_ tau ⊗ cal(A)_ tau$#linebreak()arbitrary multiplicity]])])
  line((1.182, 0), (3.382, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.573, 0), [#text(size: 9pt)[$T$]], anchor: "south", padding: 0.1176cm)
  line((5.146, -0.5438), (5.146, -1.544), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.146, -1.061), [#text(size: 9pt)[inclusion]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The orbit of one vector in all copies of a subgroup type of degree $a$. The restriction of the group action factors through a matrix space of dimension $a^2$. ],
) <l:orbit-figure>

#thm([Proposition 3.2.])[
  (Orbit-span transfer).  #emph[Under the assumptions of Theorem 1, for every $u > 0$, 
$ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq sqrt(b B C_u) thin D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 b \)) . $

]
] <l:orbit-span>

#proof[
  The disjoint subgroups form a direct product $H = H_1 times dots.h.c times H_b$. Its isotypic decomposition in $V_rho$ is an orthogonal sum of spaces
  $ \( V_(tau_1) ⊗ dots.h.c ⊗ V_(tau_b) \) ⊗ cal(A)_(bold(tau)) . $
  Every occurring tensor product has dimension $product_i dim tau_i lt.eq D$. Assign its whole isotypic space to the least index $i$ for which $dim tau_i lt.eq D^(1 \/ b)$. Group the assigned spaces to obtain $V_rho = E_1 xor dots.h.c xor E_b$. Equivalently, let $P_i$ select the small $H_i$-types. These projections commute and $product_i \( I - P_i \) = 0$. The projections $Q_i = P_i product_(j < i) \( I - P_j \)$ are orthogonal and sum to identity: on each product type $Q_i$ is identity exactly when $i$ is its first small factor. Thus the explicit splitting $v_i = Q_i v$ is precisely the least-index assignment above.
  Fix $v_i in E_i$ and put $W_i = "span" rho \( H_i \) v_i$. Lemma 7 and the definition of $C_u$ give
  #[#set math.equation(numbering: n => "(3.1)")
   $ dim W_i lt.eq sum_(tau in "Irr" \( H_i \) : thin dim tau lt.eq D^(1 \/ b)) \( dim tau \)^2 lt.eq C_u D^(\( u + 2 \) \/ b) . $ <l:orbit-dimension>]
  The second inequality follows term by term from $\( dim tau \)^2 lt.eq D^(\( u + 2 \) \/ b) \( dim tau \)^(- u)$. It is uniform in the block size.
  The remaining task is to use this dimension bound on a coefficient. Let $Pi_i$ be the orthogonal projection onto $W_i$. Since $W_i$ is $H_i$-invariant, the projection onto $rho \( g \) W_i$ depends only on $g H_i$. The coset cap therefore gives, for every $w$,
  $ sum_g f \( g \) parallel Pi_(rho \( g \) W_i) w parallel^2 & lt.eq B bb(E)_(g tilde.op U_G) parallel Pi_(rho \( g \) W_i) w parallel^2\
 & = B frac(dim W_i, D) parallel w parallel^2 . $
  Indeed $bb(E)_U rho \( g \) Pi_i rho \( g \)^(*)$ commutes with $rho \( G \)$ and has trace $dim W_i$, so Schur’s lemma identifies it as $\( dim W_i \/ D \) I$.
  Since $rho \( g \) v_i in rho \( g \) W_i$ and $f$ has mass at most one, Cauchy–Schwarz yields
  $ \| chevron.l w \, hat(f) \( rho \) v_i chevron.r \| lt.eq parallel v_i parallel (sum_g f \( g \) parallel Pi_(rho \( g \) W_i) w parallel^2)^(1 \/ 2) lt.eq sqrt(B C_u) D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 b \)) parallel w parallel parallel v_i parallel . $
  For $v = sum_i v_i$, orthogonality gives $sum_i parallel v_i parallel lt.eq sqrt(b) parallel v parallel$. Summing proves the claim. In particular no dimension of a multiplicity space has been discarded. ◻
]

#thm([Corollary 3.3.])[
  (Four convolutions by the orbit argument).  #emph[ Let $n arrow.r oo$ through multiples of eight. Suppose probabilities $mu_n$ on $S_n$ have sign mean $o \( 1 \)$ and 
$ bb(E)_(\| M \| = n \/ 8) parallel mu_(n \, H_M) - U_(G \/ H_M) parallel_(upright("TV")) = o \( 1 \) . $

 Then $parallel mu_n^(* 4) - U_G parallel_(upright("TV")) arrow.r 0$.]
] <l:orbit-completion>

#proof[
  Lemma 3 selects an eight-block partition with summed marginal error $o \( 1 \)$. Lemma 4 supplies a common subprobability $f_n lt.eq mu_n$ of mass $1 - o \( 1 \)$ and coset cap one. Proposition 8 at $u = 1$ gives $parallel hat(f)_n \( rho \) parallel_(upright("op")) lt.eq sqrt(8 C_1) D^(- 5 \/ 16)$. The nonsign Plancherel contribution after four factors is at most $\( 8 C_1 \)^4 Z_(1 \/ 2) \( n \)$, because $2 - 8 \( 5 \/ 16 \) = - 1 \/ 2$. Sign and missing mass tend to zero by Proposition 6. This completes a route from averaged observations to the full law. ◻
]

=== 3.1 Central projections retain the whole Fourier matrix <central-projections-retain-the-whole-fourier-matrix>

The orbit argument controls one vector at a time. To estimate the Hilbert–Schmidt norm without paying an extra ambient dimension, we instead convolve with a central idempotent of the subgroup. Its cosetwise squared norm controls all Fourier matrix entries at once.

For an irreducible $H$-type $tau$ of degree $a$, define the mass function

$ e_(H \, tau) \( h \) = frac(a, \| H \|) overline(chi_tau \( h \)) quad \( h in H \) \, #h(2em) e_(H \, tau) = 0 upright(" off ") H . $

Character orthogonality shows that $hat(e)_(H \, tau) \( rho \)$ is the orthogonal projection $P_(rho \, H \, tau)$ onto the full $tau$-isotypic subspace in $rho \|_H$. Thus every copy is included.

#thm([Lemma 3.4.])[
  (Cosetwise isotypic estimate).  #emph[Let $H lt.eq G$ and let $f gt.eq 0$ have mass $z lt.eq 1$ and satisfy $f \( g H \) lt.eq B \/ \[ G : H \]$. For an irreducible $H$-type $tau$ of degree $a$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(rho in "Irr" \( G \)) D_rho parallel hat(f) \( rho \) P_(rho \, H \, tau) parallel_(upright("HS"))^2 lt.eq B z a^2 . $ <l:central-global>]

]
] <l:central-isotypic>

#proof[
  Convolution with $e = e_(H \, tau)$ acts separately in each left coset $Q = x H$. Since $sum_(h in H) \| e \( h \) \|^2 = a^2 \/ \| H \|$, the triangle inequality for a positive weighted sum of translates gives
  $ sum_(h in H) \| \( f * e \) \( x h \) \|^2 lt.eq f \( Q \)^2 frac(a^2, \| H \|) . $
  One may equivalently normalize the weights by $f \( Q \)$ and use Jensen; the zero-mass coset contributes zero. Also $sum_Q f \( Q \)^2 lt.eq B z \/ \[ G : H \]$. Plancherel on $G$ proves (3.2).
  There is a second exact expression for the same calculation. Let $f_Q \( h \) = f \( x h \)$ and $hat(f)_Q \( tau \) = sum_h f_Q \( h \) tau \( h \)$. Subgroup Plancherel yields
  $ sum_rho D_rho parallel hat(f) \( rho \) P_(rho \, H \, tau) parallel_(upright("HS"))^2 = \[ G : H \] sum_Q a parallel hat(f)_Q \( tau \) parallel_(upright("HS"))^2 . $
  Unitarity gives $parallel hat(f)_Q \( tau \) parallel_(upright("HS")) lt.eq sqrt(a) thin f \( Q \)$ and recovers the same bound. This identity makes the normalization of the Hilbert–Schmidt norm explicit.
  There is also a positive-projection proof of the same bound. Right convolution by $e$ is an orthogonal projection, since $e * e = e$ and $e^(*) \( h \) = overline(e \( h^(- 1) \)) = e \( h \)$. With the counting inner product,
  #[#set math.equation(numbering: n => "(3.3)")
   $ \| G \| parallel f * e parallel_2^2 & = \| G \| chevron.l f \, f * e chevron.r\
 & lt.eq a^2 \| G \| chevron.l f \, f * U_H chevron.r lt.eq B z a^2 . $ <l:isotypic-positive-projection>]
  Indeed $\| e \( h \) \| lt.eq a^2 U_H \( h \)$, so positivity of $f$ bounds the absolute convolution pointwise; and $\( f * U_H \) \( g \) = f \( g H \) \/ \| H \| lt.eq B \/ \| G \|$. This proves the estimate from idempotence and positivity, independently of the cosetwise norm calculation. ◻
]

#thm([Proposition 3.5.])[
  (Isotypic transfer).  #emph[Under the assumptions of Theorem 1, 
$ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq b B C_u D^(- 1 + \( u + 2 \) \/ b) . $

 In fact the right side can be multiplied by $f \( G \)$.]
] <l:isotypic>

#proof[
  For each $i$, take all $H_i$-isotypic projections with degree at most $D^(1 \/ b)$. On every product type in the restriction to $product_i H_i$, at least one such projection is identity. The projections commute and include all multiplicities, so
  #[#set math.equation(numbering: n => "(3.4)")
   $ I prec.curly.eq sum_(i = 1)^b sum_(tau : dim tau lt.eq D^(1 \/ b)) P_(rho \, H_i \, tau) . $ <l:projection-cover>]
  Trace this inequality against the positive operator $hat(f) \( rho \)^(*) hat(f) \( rho \)$, apply Lemma 10 after discarding other ambient irreducibles, and use (3.1). The resulting inequality is $D parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq B f \( G \) b C_u D^(\( u + 2 \) \/ b)$. ◻
]

This proves Theorem 1. The improvement from operator to Hilbert–Schmidt norm changes the convolution count because the regular-representation weight is then $D$, rather than the $D^2$ obtained by bounding $parallel A parallel_(upright("HS"))^2$ by $D parallel A parallel_(upright("op"))^2$.

#thm([Corollary 3.6.])[
  (Two convolutions from eight complements).  #emph[ Under the hypotheses of Corollary 9, $parallel mu_n^(* 2) - U_G parallel_(upright("TV")) arrow.r 0$.]
] <l:isotypic-completion>

#proof[
  Use the same partition and subprobability as in that corollary. Proposition 11 with $u = 1$ gives HS squared at most $8 C_1 D^(- 5 \/ 8)$. Two powers have nonsign contribution at most $\( 8 C_1 \)^2 Z_(1 \/ 4) \( n \)$, since $1 - 2 \( 5 \/ 8 \) = - 1 \/ 4$. Proposition 6 handles sign and mass. ◻
]

The last corollary is an abstract consequence of the stated marginal hypotheses. A shuffle application must supply those hypotheses at its own time and preserve its own time convention; a numerical mixing statement is not part of this abstract deduction.

== 4 Coefficient spaces and finer fixed-partition estimates <l:comparisons-section>

The central-isotypic estimate already controls the whole Fourier matrix. This section compares three features of alternative fixed-coset arguments: evaluation in a coefficient space, pointwise character control, and the number of restriction types allowed by the ambient diagram. The first two give weaker bounds but require different intermediate estimates; the branching refinement retains information that the uniform constant $C_u$ suppresses. Throughout this section $X = M_1 union.sq dots.h.c union.sq M_b$, $H_i = "Sym" \( M_i \)$ fixes the complement, and $f gt.eq 0$ has mass at most one and satisfies $f \( g H_i \) lt.eq B \/ \[ G : H_i \]$. The constants $C_u$ have the meaning fixed in the introduction.

=== 4.1 Comparison of the information and the conclusions <comparison-of-the-information-and-the-conclusions>

The first three rows of Table 1 compare methods under the same fixed-coset hypothesis; the remaining rows locate transfers with different orientations, quantifiers, or conditional structure. A fixed family of coset bounds controls one common measure. An estimate averaged over omitted sets first needs a choice of partition or a permutation-dependent modification. An entropy inequality valid for every change of law can be applied to a rare coefficient event; an entropy estimate for the reference law alone cannot justify that step. For kernels, small quotient error must be supplemented by control of the full sign multiplicity operators.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Input or method
], table.cell(rowspan: 1, colspan: 1)[Orientation and quantifier
], table.cell(rowspan: 1, colspan: 1)[Mass treatment
], table.cell(rowspan: 1, colspan: 1)[Fourier conclusion
]),
  table.cell(rowspan: 1, colspan: 1)[Central isotypic projection
], table.cell(rowspan: 1, colspan: 1)[$g H_i$, every coset of one law
], table.cell(rowspan: 1, colspan: 1)[Subprobability allowed
], table.cell(rowspan: 1, colspan: 1)[HS squared $b B C_u D^(- 1 + \( u + 2 \) \/ b)$
],
  table.cell(rowspan: 1, colspan: 1)[Coefficient-space projection
], table.cell(rowspan: 1, colspan: 1)[Same fixed cosets
], table.cell(rowspan: 1, colspan: 1)[Same retained law
], table.cell(rowspan: 1, colspan: 1)[HS squared $b B^2 C_u D^(- 1 + \( u + 2 \) \/ b)$
],
  table.cell(rowspan: 1, colspan: 1)[Pointwise character bound
], table.cell(rowspan: 1, colspan: 1)[Same fixed cosets
], table.cell(rowspan: 1, colspan: 1)[Same retained law
], table.cell(rowspan: 1, colspan: 1)[HS squared $b B^2 C_u D^(- 1 + \( u + 4 \) \/ b)$
],
  table.cell(rowspan: 1, colspan: 1)[Two-sided observations
], table.cell(rowspan: 1, colspan: 1)[Image and inverse-image cosets
], table.cell(rowspan: 1, colspan: 1)[Two retained factors
], table.cell(rowspan: 1, colspan: 1)[Joint-type bound, Section 8
],
  table.cell(rowspan: 1, colspan: 1)[Uniform random omitted set
], table.cell(rowspan: 1, colspan: 1)[Average marginal TV error
], table.cell(rowspan: 1, colspan: 1)[Nearby conditional law
], table.cell(rowspan: 1, colspan: 1)[Alternative retained laws; Sections 5 and 10
],
  table.cell(rowspan: 1, colspan: 1)[Entropy on a common event
], table.cell(rowspan: 1, colspan: 1)[Every law supported on that event
], table.cell(rowspan: 1, colspan: 1)[Condition on the event
], table.cell(rowspan: 1, colspan: 1)[Tail $C D^(- 1 \/ 256)$; Theorem 40
],
  table.cell(rowspan: 1, colspan: 1)[Equivariant quotient kernels
], table.cell(rowspan: 1, colspan: 1)[Mean rows, or both rows and columns
], table.cell(rowspan: 1, colspan: 1)[Subkernels with explicit loss
], table.cell(rowspan: 1, colspan: 1)[Product-type HS bounds; Theorems 34 and 35
],
  table.cell(rowspan: 1, colspan: 1)[Conditional half-products
], table.cell(rowspan: 1, colspan: 1)[Inverse-image cap followed by conditional image caps
], table.cell(rowspan: 1, colspan: 1)[Product subprobabilities
], table.cell(rowspan: 1, colspan: 1)[Operator $sqrt(22) D^(- 1 \/ 40)$; Theorem 52
],
)
]],
  caption: [Table 1: Inputs that lead to different Fourier transfers. The dimension is that of the ambient irreducible except in the kernel product-type estimates. All Hilbert–Schmidt norms are unnormalized. ],
)

=== 4.2 Evaluation of coefficient functions <evaluation-of-coefficient-functions>

#thm([Lemma 4.1.])[
  (Evaluation in a coefficient space).  #emph[Let $H$ be a finite group and let $Lambda subset.eq "Irr" \( H \)$. If $F$ is a linear combination of matrix coefficients of the types in $Lambda$, then 
$ max_(h in H) \| F \( h \) \|^2 lt.eq (sum_(tau in Lambda) \( dim tau \)^2) bb(E)_(h tilde.op U_H) \| F \( h \) \|^2 . $

]
] <l:coefficient-evaluation>

#proof[
  Schur orthogonality makes the functions $sqrt(dim tau) thin tau \( h \)_(j k)$ an orthonormal basis of this coefficient space. At every $h$, the sum of their squared absolute values is $sum_(tau in Lambda) \( dim tau \)^2$, because each $tau \( h \)$ is unitary. Cauchy–Schwarz for expansion in this basis proves the assertion. Multiple copies of a representation give the same coefficient functions and do not enlarge the space. ◻
]

#thm([Proposition 4.2.])[
  (Coefficient-evaluation transfer).  #emph[For every $u > 0$ and irreducible $rho$ of degree $D$, 
$ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq sqrt(b B C_u) thin D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 b \)) . $

]
] <l:coefficient-operator>

#proof[
  Let $P_i$ project onto all $H_i$-types of degree at most $D^(1 \/ b)$. The $P_i$ commute, and $product_i \( I - P_i \) = 0$ by the product-degree bound. Thus $Q_i = P_i product_(j < i) \( I - P_j \)$ are pairwise orthogonal projections summing to identity. Write $v_i = Q_i v$.
  For fixed $g \, w$, the function $h mapsto chevron.l w \, rho \( g h \) v_i chevron.r$ on $H_i$ uses only the selected types. Lemma 13 gives
  $ \| chevron.l w \, rho \( g \) v_i chevron.r \|^2 lt.eq C_u D^(\( u + 2 \) \/ b) bb(E)_(h tilde.op U_(H_i)) \| chevron.l w \, rho \( g h \) v_i chevron.r \|^2 . $
  Average over $g$ with mass $f \( g \)$. Right averaging replaces $f$ by $f * U_(H_i)$, whose density relative to $U_G$ is at most $B$. Schur orthogonality on $G$ gives
  $ sum_g f \( g \) \| chevron.l w \, rho \( g \) v_i chevron.r \|^2 lt.eq B C_u D^(- 1 + \( u + 2 \) \/ b) parallel w parallel^2 parallel v_i parallel^2 . $
  Jensen for a measure of mass at most one and $sum_i parallel v_i parallel lt.eq sqrt(b) parallel v parallel$ finish the proof. This argument proves the same numerical inequality as Proposition 8, using evaluation of functions instead of dimensions of orbit subspaces. ◻
]

=== 4.3 Two more isotypic estimates <two-more-isotypic-estimates>

#thm([Lemma 4.3.])[
  (Coefficient and pointwise character estimates).  #emph[Let $H lt.eq G$, let $f gt.eq 0$ have mass at most one and coset cap $B \/ \[ G : H \]$, and let $tau in "Irr" \( H \)$ have degree $a$. For every $rho in "Irr" \( G \)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ D_rho parallel hat(f) \( rho \) P_(rho \, H \, tau) parallel_(upright("HS"))^2 & lt.eq B^2 a^2 \,\
D_rho parallel hat(f) \( rho \) P_(rho \, H \, tau) parallel_(upright("HS"))^2 & lt.eq B^2 a^4 . $ <l:coefficient-isotypic>]

 The first bound comes from coefficient projection on each coset; the second comes from a pointwise bound on the character idempotent.]
] <l:isotypic-alternatives>

#proof[
  Put $F = \| G \| f$. On $x H$, project $h mapsto F \( x h \)$ onto the conjugates of the matrix coefficients of $tau$. Its uniform squared norm is
  $ a ∥bb(E)_(h in H) F \( x h \) tau \( h \)∥_(upright("HS"))^2 lt.eq B^2 a^2 \, $
  because the matrix in the norm has operator norm at most the nonnegative function’s mean, which is at most $B$. The entries of $rho \( x h \) P_(rho \, H \, tau)$ belong to the $tau$ coefficient space. Replacing $F$ by this projection therefore preserves the tested Fourier matrix. Averaging the bound over cosets and applying full-group Plancherel proves (4.1).
  For the second proof, the character bound $\| chi_tau \( h \) \| lt.eq a$ gives
  $ \| \( f * e_(H \, tau) \) \( g \) \| lt.eq frac(a^2, \| H \|) f \( g H \) lt.eq frac(B a^2, \| G \|) . $
  The density of this convolution has squared $L^2 \( U_G \)$ norm at most $B^2 a^4$. Plancherel gives (4.1). No bound on the conditional law inside a coset was required in either proof. ◻
]

#thm([Proposition 4.4.])[
  (Coefficient and character Hilbert–Schmidt transfers).  #emph[ For the disjoint-block data of this section and every $u > 0$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 & lt.eq B^2 b C_u D^(- 1 + \( u + 2 \) \/ b) \,\
parallel hat(f) \( rho \) parallel_(upright("HS"))^2 & lt.eq B^2 b C_u D^(- 1 + \( u + 4 \) \/ b) . $ <l:coefficient-hs>]

]
] <l:coefficient-lift>

#proof[
  Trace the covering inequality (3.4) against $hat(f)^(*) hat(f)$. Sum the corresponding estimate of Lemma 15 over all selected subgroup types. For $j = 2 \, 4$,
  $ sum_(dim tau lt.eq D^(1 \/ b)) \( dim tau \)^j lt.eq C_u D^(\( u + j \) \/ b) . $
  This proves both bounds, including every multiplicity. ◻
]

Although (3.2) gives a stronger bound, (4.2) records the method that uses only pointwise character control. For $u = 2$, large block size makes the complete subgroup reciprocal sum at most three, so cap $B = 4$ gives the concrete bound $48 b D^(- 1 + 6 \/ b)$.

#thm([Proposition 4.5.])[
  (Low-type central-projector estimates).  #emph[Let $eta$ be a probability satisfying the coset caps of this section. Let $P_i$ select its $H_i$-types of degree at most $D^(1 \/ b)$ and put $R_i = sum_(dim tau lt.eq D^(1 \/ b)) \( dim tau \)^2$. Then 
$ parallel hat(eta) \( rho \) P_i parallel_(upright("op")) lt.eq B D^(- 1 \/ 2) R_i \, #h(2em) D parallel hat(eta) \( rho \) P_i parallel_(upright("HS"))^2 lt.eq B^2 R_i . $

 Consequently 
$ parallel hat(eta) \( rho \) parallel_(upright("op")) & lt.eq B C_u sqrt(b) thin D^(- 1 \/ 2 + \( u + 2 \) \/ b) \,\
parallel hat(eta) \( rho \) parallel_(upright("op")) & lt.eq B sqrt(b C_u) thin D^(- 1 \/ 2 + \( u + 2 \) \/ \( 2 b \)) . $

]
] <l:central-projector-operator>

#proof[
  On $H_i$ take the central projector density $k_i \( h \) = sum_(dim tau lt.eq D^(1 \/ b)) \( dim tau \) overline(chi_tau \( h \))$, relative to uniform subgroup measure. Its transform is $P_i$. Pointwise $\| k_i \| lt.eq R_i$, so convolution of the density $\| G \| eta$ with $k_i$ is bounded in absolute value by $B R_i$. Plancherel yields the first displayed bound. Alternatively project onto all selected coefficient spaces on each coset. They are orthogonal; their squared mean sums to at most $B^2 R_i$ by the first proof of Lemma 15. This gives the second bound.
  Use the orthogonal $Q_i = P_i product_(j < i) \( I - P_j \)$, apply either bound to $Q_i v$, and sum their norms. The inequalities $sum_i parallel Q_i v parallel lt.eq sqrt(b) parallel v parallel$ and $R_i lt.eq C_u D^(\( u + 2 \) \/ b)$ give the conclusions. ◻
]

=== 4.4 Counting only types allowed by branching <counting-only-types-allowed-by-branching>

Let $p \( j \)$ again denote the partition number, and define $M \( k \) = sum_(j = 0)^k p \( j \)$. For $lambda tack.r n$ put $k_lambda = n - max \( lambda_1 \, lambda'_1 \)$.

#thm([Proposition 4.6.])[
  (Branching refinement).  #emph[For an irreducible $rho_lambda$ of degree $D$, the disjoint-block caps give 
$ parallel hat(f) \( rho_lambda \) parallel_(upright("HS"))^2 lt.eq B b M \( k_lambda \) D^(- 1 + 2 \/ b) . $

 The blocks may have unequal sizes.]
] <l:branching-hs>

#proof[
  Young branching says that each diagram $tau$ occurring under restriction to a block symmetric group is contained in $lambda$; conjugating a block to the standard subgroup does not change the set of occurring types [6] Theorem 9.2. Orient a longest row or column of $lambda$ horizontally, transposing the restricted diagrams too if necessary. Each $tau$ then has at most $k_lambda$ boxes below its first row. Given those lower boxes and the block size, its first row is determined. Thus at most $M \( k_lambda \)$ types occur, regardless of multiplicity. Apply (3.2) to each selected small type and bound its squared degree by $D^(2 \/ b)$ in (3.4). ◻
]

Appendix 18 develops two averages of low-type projections, a four-factor coefficient decomposition, and explicit parameter substitutions. Those alternative estimates retain their proofs, while the tools above suffice for the transfers that follow.

== 5 Keeping the partition random <l:random-partition-section>

Selecting one partition and imposing common coset caps already handles the averaged marginal hypothesis. Here we construct a different retained law: each retained permutation is good for many partitions, without choosing one partition on which the law must satisfy every cap. The partition therefore varies inside the coefficient estimate. Its event of simultaneous goodness must be inserted before decomposing a test vector.

#thm([Proposition 5.1.])[
  (Random-partition lift).  #emph[Let $n$ tend to infinity through multiples of a fixed integer $q > 3$, and let $mu$ be probability laws on $S_n$. For a uniform $n \/ q$-subset $C$, put $H_C = "Sym" \( C \)$, fixing its complement pointwise. Suppose 
$ bb(E)_C parallel mu_(H_C) - \( U_G \)_(H_C) parallel_(upright("TV")) = o \( 1 \) \, #h(2em) hat(mu) \( "sgn" \) = 0 . $

 There is a conditional probability law $nu$ with $parallel nu - mu parallel_(upright("TV")) = o \( 1 \)$ such that, for every irreducible $rho$ of degree $D$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel hat(nu) \( rho \) parallel_(upright("op")) lt.eq 2 / M sqrt(2 q C_1) thin D^(- \( 1 - 3 \/ q \) \/ 2) \, $ <l:random-op>]

 where $M = 1 - o \( 1 \)$ is the retained mass and $C_1$ is from Lemma 2. In particular for $q = 8$, $parallel mu^(* 8) - U_G parallel_(upright("TV")) = o \( 1 \)$.]
] <l:random-partition>

#proof[
  Put $h_0 = \| H_C \| \/ \| G \|$. Say $g$ is good for $C$ if $mu \( g H_C \) lt.eq 2 h_0$. The total $mu$-mass of bad cosets is at most twice their marginal total-variation distance. Thus the set
  $ R = { g : bb(P)_C \( g upright(" is bad for ") C \) lt.eq 1 \/ \( 2 q \) } $
  has mass $M = 1 - o \( 1 \)$ by Markov’s inequality. For every $g in R$ a uniform ordered equal partition $\( C'_1 \, dots.h \, C'_q \)$ has probability at least $1 \/ 2$ that $g$ is good for all blocks. Define $nu = mu \( dot.op divides R \)$.
  We use Lemma 13: if a function $F$ on a finite group is in the span of matrix coefficients of a collection $Lambda$ of irreducibles, then
  #[#set math.equation(numbering: n => "(5.2)")
   $ max \| F \|^2 lt.eq (sum_(tau in Lambda) \( dim tau \)^2) bb(E)_U \| F \|^2 . $ <l:random-evaluation>]
  The sum counts distinct types, since equivalent copies have the same space of coefficient functions.
  Fix a partition and restrict $rho$ to its direct product of block subgroups. Decompose orthogonally into tensor-product constituents, including all multiplicity spaces. Every constituent has product of factor degrees at most $D$. Assign it to one factor with degree at most $D^(1 \/ q)$. This splits a vector $v = sum_i v_i$ orthogonally, with $v_i$ using only $H_(C'_i)$-types of degrees at most $D^(1 \/ q)$. Fix a test vector $w$ and set $F_i \( g \) = chevron.l w \, rho \( g \) v_i chevron.r$. On a coset $g H_(C'_i)$ it belongs to the coefficient space in (5.2), whose dimension is at most
  $ sum_(b lt.eq D^(1 \/ q)) b^2 lt.eq C_1 D^(3 \/ q) . $
  The sum counts each irreducible type once; multiplicities do not increase the function space of matrix coefficients. Summing the coset maximum bound only over good cosets, and using Schur orthogonality on $G$, yields
  #[#set math.equation(numbering: n => "(5.3)")
   $ sum_(g upright(" good for ") C'_i) mu \( g \) \| F_i \( g \) \|^2 lt.eq 2 C_1 D^(3 \/ q - 1) parallel w parallel^2 parallel v_i parallel^2 . $ <l:good-coset-square>]
  Only a bound on total coset mass was used here.
  For $g in R$ insert the all-good partition event, whose probability is at least $1 \/ 2$, before splitting the coefficient. It follows that
  $ \| chevron.l w \, hat(nu) \( rho \) v chevron.r \| lt.eq 2 / M bb(E)_(\( C'_i \)) sum_i sum_(g upright(" good for ") C'_i) mu \( g \) \| F_i \( g \) \| . $
  Cauchy–Schwarz and (5.3), followed by $sum_i parallel v_i parallel lt.eq sqrt(q) parallel v parallel$, prove (5.1). The dependence of $v_i$ on the partition is harmless because the estimate holds for each fixed partition.
  The sign coefficient obeys $\| hat(nu) \( "sgn" \) \| lt.eq \( 1 - M \) \/ M = o \( 1 \)$, since the original sign coefficient is zero. The same argument works when that coefficient is $o \( 1 \)$. Fourier Plancherel in the normalization of Lemma 5 gives
  $ 4 parallel nu^(* r) - U_G parallel_(upright("TV"))^2 lt.eq sum_(rho eq.not upright(bold(1))) D_rho parallel hat(nu) \( rho \)^r parallel_(upright("HS"))^2 . $
  For $q = r = 8$, the nonsign sum is at most an absolute constant times
  $ sum_(rho eq.not upright(bold(1)) \, "sgn") D_rho^(2 - r \( 1 - 3 \/ q \)) = sum_(rho eq.not upright(bold(1)) \, "sgn") D_rho^(- 3) = o \( 1 \) $
  by Lemma 2. The sign term also vanishes, and $parallel mu^(* 8) - nu^(* 8) parallel_(upright("TV")) lt.eq 8 \( 1 - M \) = o \( 1 \)$. ◻
]

== 6 Symmetric-group degrees: the quantitative toolkit <l:degrees>

The lifting estimates involve sums of negative powers of dimensions. The short proof in Lemma 2 already supplies every positive inverse power. Here we develop the quantitative estimates used by the later transfers: tableau and hook constructions, exponential growth in the deficit from a longest line, and sharper bounds near a row or column.

Theorem 22 combines summability with the uniform deficit bound. Lemmas 23 and 24 then control near-row dimensions and the number of restriction types. Appendix 16 retains the independent fixed-power proofs, including routes that use only coarse partition counts or avoid the hook formula.

For a partition $lambda tack.r n$, write $D_lambda = f^lambda$ for the dimension of its complex irreducible representation and $lambda'$ for its transpose. We use the classical standard-tableau dimension theorem and hook-length formula [13,4]:

$ D_lambda = \# { upright("standard tableaux of shape ") lambda } = frac(n !, product_(x in lambda) h \( x \)) . $

We set $D_diameter = 1$ and $binom(a, - 1) = 0$. A standard tableau increases along rows and columns; $h \( x \)$ is one plus the number of boxes strictly to the right of or below $x$. Transposition preserves dimension. Put

$ L \( lambda \) = max \( lambda_1 \, lambda'_1 \) \, #h(2em) k \( lambda \) = n - L \( lambda \) \, #h(2em) Z_u \( n \) = sum_(lambda tack.r n \, med lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(- u) . $

The excluded diagrams are a set, so coincide when $n = 1$. They are exactly the one-dimensional types: transpositions are conjugate and generate $S_n$, so a one-dimensional character takes the same value $1$ or $- 1$ on all transpositions.

=== 6.1 Counting constructions <counting-constructions>

Let $p \( j \)$ be the number of partitions of $j$, with $p \( 0 \) = 1$. We will use each of the elementary bounds

#[#set math.equation(numbering: n => "(6.1)")
 $ p \( j \) lt.eq 2^(j - 1) lt.eq 2^j \, #h(2em) p \( j \) lt.eq \( j + 1 \)^(2 ceil.l sqrt(j) ceil.r) \, #h(2em) p \( j \) lt.eq e^(3 sqrt(j)) quad \( j gt.eq 1 \) . $ <l:partition-counts>]

The first follows by counting compositions. For the second, record the multiplicities of parts at most $ceil.l sqrt(j) ceil.r$ and a zero-padded list of the at most $sqrt(j)$ larger parts. Each entry has at most $j + 1$ possibilities. For the third, evaluate the partition generating product at $x = e^(- 1 \/ sqrt(j))$. Its logarithm is

$ sum_(r gt.eq 1) frac(1, r \( e^(r \/ sqrt(j)) - 1 \)) lt.eq sqrt(j) sum_(r gt.eq 1) r^(- 2) lt.eq 2 sqrt(j) \, $

and extracting the coefficient of $x^j$ costs $e^(sqrt(j))$. At a fixed positive value of $k \( lambda \)$ there are at most $2 p \( k \)$ shapes, since deleting a longest row or column leaves a partition of $k$. Also $L \( lambda \) gt.eq sqrt(n)$, because the diagram is contained in a square of side $L \( lambda \)$.

#thm([Lemma 6.1.])[
  (Tableau constructions).  #emph[Suppose a diagram has first row of length $a$, lower diagram $gamma$ of size $k$, and second row of length $c$ (put $c = 0$ if $k = 0$).]
  + #emph[Every tableau on a Young subdiagram extends to the whole diagram. For $0 lt.eq b lt.eq min \( a \, k \)$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ D_lambda gt.eq binom(a, b) \, #h(2em) D_lambda gt.eq binom(a + k - c, k) . $ <l:tableau-interleave>]

]
  + #emph[If $k lt.eq a$, ballot interleavings give 
#[#set math.equation(numbering: n => "(6.3)")
 $ D_lambda gt.eq binom(a + k, k) - binom(a + k, k - 1) = binom(a + k, k) frac(a - k + 1, a + 1) gt.eq frac(1, k + 1) binom(2 k, k) . $ <l:tableau-ballot>]

 In particular a two-row rectangle of width $b$ has $binom(2 b, b) \/ \( b + 1 \)$ tableaux.]
  + #emph[If the nonempty diagonals of constant row-plus-column index have sizes $t_1 \, dots.h \, t_q$, then 
#[#set math.equation(numbering: n => "(6.4)")
 $ D_lambda gt.eq product_(j = 1)^q t_j ! gt.eq 2^(n - q) \, #h(2em) D_lambda gt.eq (frac(n, q e))^n . $ <l:tableau-diagonal>]

 Thus width and height at most $r$ give $q lt.eq 2 r - 1$ and $D_lambda gt.eq 2^(n - 2 r + 1)$.]
] <l:tableau-constructions>

#proof[
  A Young subdiagram is closed under moving up and left. Add its remaining boxes in row-major order with successive larger labels; every predecessor is already present. To prove the first bound, retain the whole first row and a Young subdiagram of $b$ lower boxes. Such a subdiagram is obtained by removing lower corners. Fill the first $b$ top boxes with $1 \, dots.h \, b$; choose the $b$ lower labels from the remaining $a$ labels and fill them in the relative order of one fixed standard tableau. All lower boxes lie in the first $b$ columns, so filling the rest of the top row increasingly is valid. For the second bound, reserve only the first $c$ top labels and choose all $k$ lower labels from the remaining $a + k - c$ labels.
  For the ballot bound, fix a standard order of the lower boxes and interleave their additions with those of the top row. Require each prefix to have at least as many top-row additions as lower additions. The $j$th lower box lies in a column at most $j$, so its top predecessor has been inserted. Reflection at the first violating prefix counts the valid words by the displayed binomial difference. A valid balanced word with $k$ additions of each kind, followed by $a - k$ top additions, gives the last bound. For an actual two-row rectangle the word condition is also necessary, proving the exact count.
  Finally, put successive batches of labels on increasing diagonals, in arbitrary order within each diagonal. Every row or column predecessor lies on an earlier diagonal. This gives the product of factorials. The first estimate uses $t ! gt.eq 2^(t - 1)$; the second uses $t ! gt.eq \( t \/ e \)^t$ and convexity of $t log t$ to obtain $sum_j t_j log t_j gt.eq n log \( n \/ q \)$. ◻
]

#thm([Lemma 6.2.])[
  (Separating the first-row hooks).  #emph[With the notation of Lemma 20, let $b_j$ be the number of lower boxes in column $j$. Then 
#[#set math.equation(numbering: n => "(6.5)")
 $ D_lambda & = binom(a + k, k) D_gamma product_(j = 1)^a (1 + frac(b_j, a - j + 1))^(- 1)\
 & gt.eq binom(a + k, k) D_gamma exp (- frac(k \( 1 + log a \), a)) . $ <l:hook-exact>]

 If $k lt.eq a$, a second lower bound is 
#[#set math.equation(numbering: n => "(6.6)")
 $ D_lambda gt.eq binom(a + k, k) D_gamma exp (- frac(k, a - k + 1)) . $ <l:hook-short-tail>]

]
] <l:degree-hook-ratio>

#proof[
  The lower hooks are unchanged, and the top hooks are $a - j + 1 + b_j$, which proves the identity. The sequence $b_j$ decreases while $\( a - j + 1 \)^(- 1)$ increases. The opposite-order rearrangement inequality therefore gives
  $ sum_(j = 1)^a frac(b_j, a - j + 1) lt.eq k / a sum_(j = 1)^a 1 / j lt.eq frac(k \( 1 + log a \), a) . $
  For completeness, the rearrangement inequality follows by expanding $sum_(i \, j) \( b_i - b_j \) \( c_i - c_j \) lt.eq 0$ for oppositely ordered sequences $b_i \, c_i$. Apply $log \( 1 + x \) lt.eq x$ to the product. For the last estimate, $b_j = 0$ for $j > k$, so every relevant denominator is at least $a - k + 1$, and $sum_j b_j = k$. ◻
]

=== 6.2 All positive powers and the first-row deficit <all-positive-powers-and-the-first-row-deficit>

#thm([Theorem 6.3.])[
  (Every positive inverse power).  #emph[For every fixed real $u > 0$, 
#[#set math.equation(numbering: n => "(6.7)")
 $ C_u := sup_(n gt.eq 1) sum_(lambda tack.r n) D_lambda^(- u) < oo \, #h(2em) Z_u \( n \) arrow.r 0 . $ <l:degree-all-powers-equation>]

 Moreover there are absolute constants $c_1 \, c_2 > 0$ such that, for all sufficiently large $n$ and every $lambda tack.r n$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ D_lambda gt.eq c_1 e^(c_2 k \( lambda \)) . $ <l:degree-tail-exponential>]

 For each fixed positive $k$, these dimensions tend uniformly to infinity among shapes with $k \( lambda \) = k$.]
] <l:degree-all-powers>

#proof[
  Put $L = L \( lambda \)$ and $k = n - L$. If $L lt.eq n \/ 16$, every hook is at most $2 L$, so $D_lambda gt.eq \( n \/ \( 2 e L \) \)^n gt.eq 2^n$. Otherwise orient the diagram with first row $L$, and for $k gt.eq 1$ retain $b = min \( k \, floor.l L \/ 3 floor.r \)$ lower boxes. For sufficiently large $n$, $b gt.eq 1$, and Lemma 20 gives
  $ D_lambda gt.eq binom(L, b) gt.eq \( L \/ b \)^b gt.eq 3^b \, #h(2em) b gt.eq k \/ 48 - 1 . $
  Indeed $L > n \/ 16$ implies $floor.l L \/ 3 floor.r > n \/ 48 - 1 gt.eq k \/ 48 - 1$. Thus one may take $c_1 = 1 \/ 3$ and $c_2 = \( log 3 \) \/ 48$ after enlarging the size threshold. For a fixed positive $k$, eventually $b = k$, and $D_lambda gt.eq binom(n - k, k) arrow.r oo$ uniformly.
  There are at most $2 p \( k \)$ shapes at deficit $k$. By (6.1) and (6.8), their total inverse $u$th powers are bounded by a constant depending on $u$ times $e^(3 sqrt(k) - u c_2 k)$. This is summable in $k$, and each fixed positive-$k$ contribution tends to zero. Dominated convergence proves $Z_u \( n \) arrow.r 0$. The full sum tends to two; its finitely many initial values are finite, including the value one at $n = 1$. ◻
]

There are two other ways to obtain the full positive-power range. The next proof uses ballot words; the short proof from Lemma 2 uses a central-binomial subdiagram.

#proof[
  #emph[A ballot proof of the summability assertions.] For $k gt.eq 1$ and $L = n - k gt.eq n \/ 2$, (6.3) gives
  $ D_lambda gt.eq binom(n, k) frac(n - 2 k + 1, n - k + 1) gt.eq frac(2^k, k + 1) . $
  For the second inequality, the ballot fraction is at least $1 \/ \( k + 1 \)$ and $binom(n, k) gt.eq \( n \/ k \)^k gt.eq 2^k$. The majorant $2 p \( k \) \( k + 1 \)^u 2^(- u k)$ is summable, and the first binomial expression diverges for each fixed $k gt.eq 1$. If $L < n \/ 2$ but $L gt.eq n \/ 10$, retain a row of length $L$ and $L$ lower boxes. The ballot count $binom(2 L, L) \/ \( L + 1 \)$ is exponential in $n$. If $L < n \/ 10$, the hook formula gives $\( 5 \/ e \)^n$. The subexponential bound for $p \( n \)$ handles both remaining ranges. Adding the one-dimensional terms proves the uniform bound. ◻
]

The third all-positive-power route is the one already proved in Lemma 2. Its three ranges are $1 lt.eq k lt.eq n \/ 3$, $k > n \/ 3$ with $L gt.eq n \/ 10$, and $L < n \/ 10$. The respective bounds are $binom(n - k, k) gt.eq 2^k$, $2^L \/ \( L + 1 \)$, and $\( 5 \/ e \)^n$. Thus it uses the same initial-row construction with a central-binomial subdiagram, rather than the deficit-exponential or ballot estimates.

#thm([Lemma 6.4.])[
  (Near-row dimensions and inverse-first summability).  #emph[For $1 lt.eq k = k \( lambda \) lt.eq n \/ 4$, with $gamma$ the lower diagram after orienting a longest line as the first row, 
#[#set math.equation(numbering: n => "(6.9)")
 $ D_lambda gt.eq e^(- 1 \/ 2) binom(n, k) D_gamma gt.eq 1 / 2 binom(n, k) . $ <l:degree-first-row-bound>]

 For $k > n \/ 4$ and all sufficiently large $n$, $D_lambda gt.eq e^(n \/ 100)$. These estimates independently give $Z_1 \( n \) arrow.r 0$ and $C_1 < oo$.]
] <l:degree-inverse-first>

#proof[
  Equation (6.6) has exponent $k \/ \( n - 2 k + 1 \) lt.eq 1 \/ 2$, proving (6.9). If $k > n \/ 4$ and $L gt.eq n \/ 8$, keep the first row and $b = floor.l n \/ 32 floor.r$ lower boxes. For large $n$, $1 lt.eq b lt.eq L \/ 4$. The same hook bound gives dimension at least $1 / 2 binom(L + b, b) gt.eq 4^b \/ 2$. If $L < n \/ 8$, every hook is shorter than $n \/ 4$, giving $\( 4 \/ e \)^n$. Both exceed $e^(n \/ 100)$ for sufficiently large $n$. The near-row inverse sum is bounded by $4 sum_(1 lt.eq k lt.eq n \/ 4) p \( k \) \/ binom(n, k)$. Each term vanishes at fixed $k$ and is bounded by $4 p \( k \) 4^(- k)$; the remaining contribution is at most $p \( n \) e^(- n \/ 100) = o \( 1 \)$. This proves both assertions about inverse-first sums. ◻
]

#thm([Lemma 6.5.])[
  (Absorbing the number of tail types).  #emph[Let $M \( k \) = sum_(j = 0)^k p \( j \)$. For every fixed $B gt.eq 1$ and all sufficiently large $n$, uniformly over $lambda tack.r n$ with $k \( lambda \) gt.eq 1$, 
#[#set math.equation(numbering: n => "(6.10)")
 $ 4 B M \( k \( lambda \) \) lt.eq D_lambda^(1 \/ 4) . $ <l:degree-type-absorption-equation>]

]
] <l:degree-type-absorption>

#proof[
  The partition bounds give $log M \( k \) = O \( sqrt(k) log \( k + 1 \) \) = o \( k \)$. For $k > n \/ 4$, Lemma 23 gives $log D_lambda gt.eq n \/ 100$, whereas $log M \( k \) = o \( n \)$ uniformly for $k lt.eq n$. For $k lt.eq n \/ 4$, use $D_lambda gt.eq 1 / 2 binom(n, k) gt.eq 1 / 2 4^k$ once $k$ exceeds a fixed sufficiently large cutoff. The finitely many positive $k$ below that cutoff are handled by the uniform divergence of $binom(n, k)$. One size threshold works for all shapes. ◻
]

== 7 One-dimensional characters in subgroups of controlled index <l:characters-section>

A coset cap also controls a Fourier projection obtained from a one-dimensional subgroup character. This gives a different route to the full isotypic estimates: first find one nonzero character space, then average it over conjugates. The construction here assigns boxes to rows or columns. Appendix 18 gives an independent construction by successively removing longest lines, together with its reciprocal-degree proof and transfer.

#thm([Lemma 7.1.])[
  (A character from a row–column assignment).  #emph[For every irreducible complex representation of $S_n$, of degree $D$, there are a subgroup $J lt.eq S_n$ and a character $chi : J arrow.r { 1 \, - 1 }$ occurring in its restriction such that 
$ \[ S_n : J \] lt.eq D^1024 . $

]
] <l:small-index-character>

#proof[
  We use the polytabloid realization of the Specht module of shape $lambda$; see [13,4]. Fix a labeling of its boxes. A row tabloid remembers which labels lie in each row while forgetting their order within that row; its polytabloid is the signed sum of its translates under the column stabilizer. Assign every box either to its row or to its column. Let $R$ permute the assigned set in each row and let $C$ permute the assigned set in each column. These sets are disjoint, so $J = R times C$. Give $R$ the trivial character and each factor of $C$ the sign character.
  Let $e$ be the polytabloid of the labeled diagram. It transforms by sign under the full column stabilizer, hence under $C$. The average $v = \| R \|^(- 1) sum_(r in R) r e$ is fixed by $R$ and still transforms by sign under $C$. It is nonzero. Indeed the original row tabloid has coefficient one in $e$, since the full row and column stabilizers intersect trivially. Every element of $R$ fixes that tabloid, so its coefficient is also one in $v$. This proves character occurrence for every assignment.
  It remains to choose the assignment with controlled index. The arm and leg of a box count boxes strictly to its right and strictly below it. Assign a box to its row when its arm is at least its leg, and to its column otherwise. Its hook length is at most twice the length $l$ of the line receiving it. If that line receives $a$ boxes, then $a ! gt.eq \( a \/ e \)^a$; we give a line with $a = 0$ zero contribution below. Consequently
  $ log frac(product_(x in lambda) h \( x \), product_(upright("assigned lines")) a !) lt.eq n log 2 + sum_(upright("lines")) { a + a log \( l \/ a \) } lt.eq \( log 2 + 1 + 2 \/ e \) n lt.eq 3 n . $
  Here $a log \( l \/ a \) lt.eq l \/ e$ and the total length of all rows and columns is $2 n$. The hook-length formula therefore gives an assignment with index
  #[#set math.equation(numbering: n => "(7.1)")
   $ I = \[ S_n : J \] lt.eq D e^(3 n) . $ <l:assignment-rough-index>]
  We convert the exponential factor into a power of $D$. Put $L = max \( lambda_1 \, lambda'_1 \)$. Suppose first that $n gt.eq 64$ and $L lt.eq 3 n \/ 4$. If $L lt.eq n \/ 8$, all hooks are at most $2 L$, and $D gt.eq \( n \/ \( 2 e L \) \)^n gt.eq \( 4 \/ e \)^n gt.eq e^(n \/ 64)$. Otherwise transpose so that the first row has length $L$, and retain a Young order ideal of $s = floor.l L \/ 4 floor.r$ boxes below it. Such an ideal exists because $n - L gt.eq L \/ 3$; moreover $s gt.eq n \/ 64$. For the retained diagram, let $c_j$ count its lower boxes in column $j$. Dividing its hook formula by the lower diagram’s formula gives
  $ D gt.eq binom(L + s, s) product_(j = 1)^L (1 + frac(c_j, L - j + 1))^(- 1) gt.eq binom(L + s, s) exp (- frac(s, L - s + 1)) . $
  The first inequality also uses extension of tableaux from a subdiagram. For the second, $c_j = 0$ for $j > s$ and $sum_j c_j = s$. Since $s lt.eq L \/ 4$, the logarithm of the last expression is at least $s log 5 - s \/ \( L - s + 1 \) gt.eq s$. Thus $log D gt.eq n \/ 64$ throughout this case. Equation (7.1) now gives $I lt.eq D^193$.
  Suppose instead that $L > 3 n \/ 4$. Orient a longest line as the top row, of length $L$, and write $zeta$ for the lower diagram of size $s = n - L$. Assign the entire top row to its row and use the preceding arm–leg assignment on $zeta$. Hook comparison and (7.1) applied to the tail give
  $ I lt.eq binom(n, s) D_zeta e^(3 s) \, #h(2em) D gt.eq binom(n, s) D_zeta exp (- frac(s, L - s + 1)) . $
  If $s gt.eq 1$, then $binom(n, s) gt.eq \( n \/ s \)^s gt.eq 4^s$ and $L - s + 1 gt.eq 2$. Hence
  $ log D gt.eq s \( log 4 - 1 \/ 2 \) \, #h(2em) log \( I \/ D \) lt.eq 7 / 2 s . $
  These bounds imply $I lt.eq D^1024$. Transposing the assignment back preserves the subgroup index and interchanges trivial and sign factors. If $s = 0$, take the full group and its trivial or sign character. Finally, for $n < 64$ and $D > 1$, the trivial subgroup has index $n ! lt.eq 64^64 < 2^1024 lt.eq D^1024$. Degree-one representations again use the full group. This covers every case. ◻
]

=== 7.1 From a character space to an isotypic space <from-a-character-space-to-an-isotypic-space>

The index bound is useful because a subgroup character gives an orthogonal projection through a signed average. Positivity of the original mass function controls that signed average. The next lemma also explains why repeated copies of a subgroup representation cause no loss.

#thm([Lemma 7.2.])[
  (Averaging character projections).  #emph[Let $G$ be a finite group, $H lt.eq G$, and let $f gt.eq 0$ have mass $z lt.eq 1$ and satisfy $f \( g H \) lt.eq B \/ \[ G : H \]$ for every $g in G$. Let $tau in "Irr" \( H \)$ have degree $d_tau$. Suppose $J lt.eq H$ has a one-dimensional unitary character $chi$ occurring in $tau \|_J$, and put $I = \[ H : J \]$. For $rho in "Irr" \( G \)$ of degree $D$, let $Q_tau$ be the full $tau$-isotypic projection in $rho \|_H$. Then 
#[#set math.equation(numbering: n => "(7.2)")
 $ D parallel hat(f) \( rho \) Q_tau parallel_(upright("HS"))^2 lt.eq B z I d_tau . $ <l:subcharacter-isotypic-bound>]

 All copies of $tau$ are included in $Q_tau$.]
] <l:subcharacter-isotypic>

#proof[
  Define the complex mass function $e_(J \, chi)$ to be $overline(chi \( j \)) \/ \| J \|$ on $J$ and zero elsewhere. Its Fourier transform is the orthogonal projection $P$ onto vectors satisfying $rho \( j \) v = chi \( j \) v$ for all $j in J$. With $U_H \, U_J$ denoting uniform probability masses on the subgroups, positivity gives
  $ \| f * e_(J \, chi) \| lt.eq f * U_J lt.eq I \( f * U_H \) lt.eq frac(I B, \| G \|) \, #h(2em) sum_g \| \( f * e_(J \, chi) \) \( g \) \| lt.eq z . $
  Plancherel therefore implies $D parallel hat(f) \( rho \) P parallel_(upright("HS"))^2 lt.eq I B z$. Every conjugate of $\( J \, chi \)$ inside $H$ satisfies the same bound.
  Average the corresponding projections, writing $overline(P) = \| H \|^(- 1) sum_(h in H) rho \( h \) P rho \( h \)^(*)$. On the full $H$-isotypic space $V_eta ⊗ cal(A)_eta$, a group-algebra element acts on $V_eta$ tensored with the identity on the multiplicity space $cal(A)_eta$. Schur’s lemma thus gives
  $ overline(P) \|_(V_eta ⊗ cal(A)_eta) = frac("rank" \( P \|_(V_eta) \), d_eta) I . $
  These scalars are nonnegative and the scalar for $eta = tau$ is at least $1 \/ d_tau$. Hence $overline(P) gt.eq d_tau^(- 1) Q_tau$. Test this positive-operator inequality against $hat(f) \( rho \)^(*) hat(f) \( rho \)$, and average the preceding Plancherel bounds. The result is (7.2). ◻
]

#thm([Theorem 7.3.])[
  (Character-projection transfer).  #emph[Let $H_i = "Sym" \( M_i \) lt.eq S_n$, $1 lt.eq i lt.eq b$, for disjoint nonempty sets $M_i$. Let $f gt.eq 0$ have mass $z lt.eq 1$ and suppose 
$ f \( g H_i \) lt.eq frac(B, \[ S_n : H_i \]) quad \( g in S_n \, med 1 lt.eq i lt.eq b \) . $

 For every irreducible $rho$ of degree $D$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq B z b C_1 D^(- 1 + 1026 \/ b) \, $ <l:character-lift-bound>]

 where $C_1 = sup_(m gt.eq 1) sum_(tau in "Irr" \( S_m \)) d_tau^(- 1)$. More generally, if $a gt.eq 0$ and every type of every $H_i$ has a one-dimensional subcharacter of index at most $d_tau^a$, the exponent $1026 \/ b$ in (7.3) may be replaced by $\( a + 2 \) \/ b$.]
] <l:character-lift>

#proof[
  For each type $tau$ of $H_i$, Lemma 26 and the assumed subcharacter give
  $ D parallel hat(f) \( rho \) Q_(i \, tau) parallel_(upright("HS"))^2 lt.eq B z d_tau^(a + 1) . $
  Restrict $rho$ to the product of the $H_i$. In any occurring joint type, the product of the factor dimensions is at most $D$, including when that type has multiplicity greater than one. Some factor therefore has dimension at most $R = D^(1 \/ b)$. The sum of the commuting projections $Q_(i \, tau)$ with $d_tau lt.eq R$ dominates the identity. Taking its trace against $hat(f) \( rho \)^(*) hat(f) \( rho \)$ gives
  $ D parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq B z sum_(i = 1)^b sum_(d_tau lt.eq R) d_tau^(a + 1) lt.eq B z b C_1 R^(a + 2) . $
  The last inequality uses $d_tau^(a + 1) lt.eq R^(a + 2) d_tau^(- 1)$. Lemma 25 supplies $a = 1024$. ◻
]

For example, take $b = 8192$ and $B = 2$. If $f_n lt.eq mu_n$ has mass tending to one and $hat(mu)_n \( "sgn" \) = o \( 1 \)$, then (7.3) and Proposition 6 give $parallel mu_n^(* 4) - U_(S_n) parallel_(upright("TV")) arrow.r 0$. Indeed $epsilon = 1026 \/ 8192 < 1 \/ 4$, and the nonlinear Plancherel sum for four factors is bounded by $\( 2 b C_1 \)^4 sum_(D_lambda > 1) D_lambda^(1 - 4 \( 1 - epsilon \))$, which tends to zero even using only the inverse-first-degree sum. This statement requires only the displayed caps, mass and sign input.

== 8 Joint restriction types and multiplication on two sides <l:two-sided-section>

For a fixed collection of disjoint block subgroups, we can retain the number of distinct joint restriction types rather than summing all small factor degrees. This gives an operator estimate by orbit spans. It also gives a product estimate when one measure is capped on left cosets and another is capped on right cosets. These two conclusions use the same type count, but different Fourier estimates.

Let $M_1 \, dots.h \, M_b$ be disjoint nonempty subsets of ${ 1 \, dots.h \, n }$, and put $H_i = "Sym" \( M_i \)$, acting trivially on the complement. On an irreducible $V_lambda$ of $S_n$, restriction to $H = H_1 times dots.h.c times H_b$ has the form

#[#set math.equation(numbering: n => "(8.1)")
 $ V_lambda \|_H = xor.big_(bold(tau)) \( V_(tau_1) ⊗ dots.h.c ⊗ V_(tau_b) \) ⊗ cal(A)_(bold(tau)) . $ <l:joint-decomposition>]

The sum ranges over distinct occurring joint types; the nonzero space $cal(A)_(bold(tau))$ records their arbitrary multiplicities. Write $K_lambda$ for the number of terms in this sum and $Q_(bold(tau))$ for their orthogonal projections.

#thm([Lemma 8.1.])[
  (Counting joint types).  #emph[Put $k = n - max \( lambda_1 \, lambda'_1 \)$ and $M \( k \) = sum_(j = 0)^k p \( j \)$, where $p \( 0 \) = 1$ and $p \( j \)$ is the partition number. Then 
#[#set math.equation(numbering: n => "(8.2)")
 $ K_lambda lt.eq M \( k \)^b . $ <l:joint-types-bound>]

 For every fixed $b$ and every fixed $eta > 0$, 
#[#set math.equation(numbering: n => "(8.3)")
 $ sum_(lambda tack.r n : thin D_lambda > 1) K_lambda^2 D_lambda^(- eta) arrow.r 0 . $ <l:joint-types-summability>]

 The statement is uniform over the disjoint sets $M_i$ and does not require them to have equal sizes.]
] <l:joint-types>

#proof[
  By branching, a type of $H_i$ has shape $nu subset.eq lambda$ and size $\| M_i \|$. Orient $lambda$ so that a longest line is a row. Every such $nu$ has at most $k$ boxes below its first row. For a fixed lower size $j$, the lower partition determines the first row because $\| nu \| = \| M_i \|$ is fixed. There are therefore at most $M \( k \)$ possibilities for each factor. If the longest line was a column, transpose all diagrams. This proves (8.2); absent tuples only reduce the count.
  There are at most $2 p \( k \)$ ambient diagrams with this deficit. The partition bound $p \( j \) lt.eq e^(3 sqrt(j))$ gives, for a constant $C_b$,
  $ 2 p \( k \) M \( k \)^(2 b) lt.eq e^(C_b sqrt(k)) #h(2em) \( k gt.eq 1 \) . $
  By Theorem 22, $D_lambda gt.eq c_1 e^(c_2 k)$ and, at each fixed positive $k$, the dimensions tend uniformly to infinity. Thus the contribution at deficit $k$ is bounded by $c_1^(- eta) e^(C_b sqrt(k) - eta c_2 k)$, a summable sequence, and tends to zero for fixed $k$. Dominated convergence proves (8.3). Multiplicities do not affect either counting step. ◻
]

=== 8.1 An operator estimate retaining the joint-type count <an-operator-estimate-retaining-the-joint-type-count>

#thm([Theorem 8.2.])[
  (Joint-type orbit transfer).  #emph[Let $f gt.eq 0$ be a mass function on $S_n$, of total mass $z lt.eq 1$, such that $f \( g H_i \) lt.eq B \/ \[ S_n : H_i \]$ for every $g \, i$. With $K_lambda$ as in (8.1), 
#[#set math.equation(numbering: n => "(8.4)")
 $ parallel hat(f) \( lambda \) parallel_(upright("op")) lt.eq sqrt(B z K_lambda) thin D_lambda^(- 1 \/ 2 + 1 \/ b) . $ <l:joint-type-operator-bound>]

]
] <l:joint-type-operator>

#proof[
  First let $v$ lie in a single $H_i$-isotypic space of type $tau_i$. The orbit span $W = "span" { rho_lambda \( h \) v : h in H_i }$ has dimension at most $d_(tau_i)^2$. To see this in the presence of multiplicity, write the full $H_i$-isotypic space as $V_(tau_i) ⊗ cal(A)$; the orbit lies in the image of the linear map $A mapsto \( A ⊗ I \) v$ from $"End" \( V_(tau_i) \)$.
  For a test vector $w$,
  $ \| chevron.l w \, rho_lambda \( g \) v chevron.r \| lt.eq parallel v parallel thin parallel P_(rho_lambda \( g \) W) w parallel . $
  The squared projected norm is constant on each $g H_i$, and its uniform mean is $\( dim W \/ D_lambda \) parallel w parallel^2$: the average of the conjugate projections is scalar by Schur’s lemma, and its trace is $dim W$. Cauchy–Schwarz for the mass function $f$, followed by its coset cap, gives
  $ \| chevron.l w \, hat(f) \( lambda \) v chevron.r \|^2 lt.eq z B frac(dim W, D_lambda) parallel v parallel^2 parallel w parallel^2 lt.eq frac(z B d_(tau_i)^2, D_lambda) parallel v parallel^2 parallel w parallel^2 . $
  Thus this single-type bound holds before any joint decomposition. In a joint type of (8.1), the factor degrees satisfy $product_i d_(tau_i) lt.eq D_lambda$, since the entire tensor representation occurs at least once. Choose $i$ with $d_(tau_i) lt.eq D_lambda^(1 \/ b)$ and apply the preceding bound. For an arbitrary $v$, decompose it into its $K_lambda$ orthogonal joint components and sum their bounds. Their norms have sum at most $sqrt(K_lambda) parallel v parallel$, proving (8.4). ◻
]

The following two specializations keep two useful ways of comparing the joint-type count with the ambient dimension. The four-block argument uses a uniform linear lower bound in the broad-diagram range. The eight-block argument uses a different cutoff for the longest line and a direct hook estimate below that cutoff.

#thm([Corollary 8.3.])[
  (Four-block transfer).  #emph[Partition $n$ points into four sets of size $n \/ 4$, and let $H_i$ permute those sets. For all sufficiently large such $n$, every subprobability $f$ with $f \( g H_i \) lt.eq 2 \/ \[ S_n : H_i \]$ satisfies 
$ parallel hat(f) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 8) #h(2em) \( D_lambda > 1 \) . $

]
] <l:four-block-reservoir>

#proof[
  Theorem 29 gives $parallel hat(f) \( lambda \) parallel_(upright("op")) lt.eq sqrt(2 K_lambda) D_lambda^(- 1 \/ 4)$, and Lemma 28 gives $log \( 2 K_lambda \) = O \( sqrt(k) \)$. We verify directly that $log D_lambda \/ sqrt(k) arrow.r oo$ uniformly over $k gt.eq 1$.
  Orient a longest line as the first row, of length $a = n - k$. For $1 lt.eq k lt.eq n \/ 3$, the tableau construction of Lemma 20 gives
  $ D_lambda gt.eq binom(n - k, k) gt.eq \( \( n - k \) \/ k \)^k . $
  For $k$ above a fixed cutoff, divide the logarithm by $sqrt(k)$ and use $\( n - k \) \/ k gt.eq 2$; for the finitely many smaller positive $k$, the same expression tends to infinity with $n$. For $k > n \/ 3$ and $a lt.eq n \/ 10$, the hook formula gives $D_lambda gt.eq \( n \/ \( 2 e a \) \)^n gt.eq \( 5 \/ e \)^n$. If instead $a > n \/ 10$, retain the first row and $r = floor.l a \/ 2 floor.r$ lower boxes; there are enough lower boxes because $k > n \/ 3 > a \/ 2$. Their tableaux extend to the full diagram, and the same construction gives $D_lambda gt.eq binom(a, r) gt.eq 2^r gt.eq e^(c n)$ for an absolute $c > 0$ and all large $n$. This proves the asserted uniform divergence. Consequently $2 K_lambda lt.eq D_lambda^(1 \/ 4)$ eventually, which yields the displayed operator bound. ◻
]

#thm([Corollary 8.4.])[
  (Eight-block transfer).  #emph[Partition $n$ points into eight sets of size $n \/ 8$, and let $H_i$ permute those sets. For all sufficiently large such $n$, every subprobability $f$ with $f \( g H_i \) lt.eq 2 \/ \[ S_n : H_i \]$ satisfies 
$ parallel hat(f) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 4) #h(2em) \( D_lambda > 1 \) . $

]
] <l:eight-block-probe>

#proof[
  Here the joint-type estimate is $sqrt(2 K_lambda) D_lambda^(- 3 \/ 8)$. For $k lt.eq n \/ 3$, use $K_lambda lt.eq M \( k \)^8$ and $D_lambda gt.eq binom(n - k, k)$ exactly as above to get $log \( 2 K_lambda \) \/ log D_lambda arrow.r 0$ uniformly. For $k > n \/ 3$, the equal block sizes give the coarser count $K_lambda lt.eq p \( n \/ 8 \)^8$, whose logarithm is $O \( sqrt(n) \)$. Let $a$ again be the longest line. If $a gt.eq n^(3 \/ 4)$, retain that line and $r = floor.l a \/ 3 floor.r$ lower boxes, possible because $k > n \/ 3 > a \/ 3$. Tableau extension gives $D_lambda gt.eq binom(a, r) gt.eq 3^r$, so $log D_lambda gt.eq c n^(3 \/ 4)$. If $a < n^(3 \/ 4)$, all hooks are at most $2 n^(3 \/ 4)$, and
  $ D_lambda gt.eq frac(n !, \( 2 n^(3 \/ 4) \)^n) gt.eq (frac(n^(1 \/ 4), 2 e))^n . $
  Thus $2 K_lambda lt.eq D_lambda^(1 \/ 4)$ uniformly for all large $n$, and the result follows. ◻
]

These are exact specializations of the joint-type orbit argument, including its multiplicity treatment. For reference, the four-block proof also gives $sum_(D_lambda > 1) D_lambda^(- 4) = o \( 1 \)$ directly: at $k lt.eq n \/ 3$ use the summable majorant $2 e^(3 sqrt(k)) 2^(- 4 k)$ and fixed-$k$ divergence; at $k > n \/ 3$ use the linear-in-$n$ logarithmic dimension bound against $p \( n \)$. The eight-block proof gives the inverse-third-power statement by the same summation, with majorant $2 e^(3 sqrt(k)) 2^(- 3 k)$ and its $n^(3 \/ 4)$ lower bound in the remaining range. With mass and sign input, these reproduce respectively the 24-factor and 10-factor Fourier completions through Proposition 6: the nonlinear Plancherel exponents are respectively $- 4$ and $- 3$. Alternatively, a final independent probability law with zero sign mean removes the sign coefficient exactly. Its Fourier matrices have operator norm at most one, so this extra convolution preserves both nonlinear estimates. This alternative does not require small sign mean in the law supplying the coset caps.

=== 8.2 A product with caps in opposite orientations <a-product-with-caps-in-opposite-orientations>

For a mass function $alpha$, a cap on $H_i g$ controls left multiplication of its Fourier matrix by an $H_i$-isotypic projector. A cap on $g H_i$ controls right multiplication. The product below places these two controlled sides together. There is no assertion that either cap implies the other.

#thm([Theorem 8.5.])[
  (Two-sided Fourier multiplication).  #emph[Let $H_1 \, dots.h \, H_b$ be the disjoint symmetric block subgroups above. Let $alpha \, beta gt.eq 0$ have masses $a \, c lt.eq 1$ and satisfy 
#[#set math.equation(numbering: n => "(8.5)")
 $ alpha \( H_i g \) lt.eq frac(B_L, \[ S_n : H_i \]) \, #h(2em) beta \( g H_i \) lt.eq frac(B_R, \[ S_n : H_i \]) quad \( g in S_n \, med 1 lt.eq i lt.eq b \) . $ <l:two-sided-caps>]

 Then every irreducible $lambda tack.r n$ satisfies 
#[#set math.equation(numbering: n => "(8.6)")
 $ D_lambda parallel hat(beta) \( lambda \) hat(alpha) \( lambda \) parallel_(upright("HS"))^2 lt.eq B_L B_R a c thin K_lambda^2 D_lambda^(- 1 + 4 \/ b) . $ <l:two-sided-bound>]

 In particular, for eight blocks and $B_L = B_R = 2$, the bound is $4 K_lambda^2 D_lambda^(- 1 \/ 2)$.]
] <l:two-sided>

#proof[
  Use densities $A = \| S_n \| alpha$ and $B = \| S_n \| beta$ with respect to uniform probability on $G = S_n$. Write $integral_G$ and $integral_(H_i)$ for normalized counting averages. The two caps read
  #[#set math.equation(numbering: n => "(8.7)")
   $ integral_(H_i) A \( h^(- 1) g \) thin d h lt.eq B_L \, #h(2em) integral_(H_i) B \( g h^(- 1) \) thin d h lt.eq B_R . $ <l:two-sided-density-caps>]
  Indeed these averages are respectively $\[ G : H_i \] alpha \( H_i g \)$ and $\[ G : H_i \] beta \( g H_i \)$. The density transform $integral_G A \( g \) rho_lambda \( g \) thin d g$ equals the mass transform $hat(alpha) \( lambda \)$, and similarly for $B$. These conventions give $accent(beta * alpha, ̂) = hat(beta) hat(alpha)$.
  For a type $tau$ of $H_i$ of degree $d_tau$ and character $chi_tau$, its full isotypic projector is
  $ P_(i \, tau) = d_tau integral_(H_i) overline(chi_tau \( h \)) rho_lambda \( h \) thin d h . $
  Centrality makes this scalar on each irreducible carrier, and character orthogonality identifies the scalar as one on type $tau$ and zero otherwise. It acts as the identity on all multiplicity copies of $tau$. Consider the density
  $ C \( g \) = d_tau integral_(H_i) overline(chi_tau \( h \)) A \( h^(- 1) g \) thin d h . $
  Weighted Cauchy–Schwarz and nonnegativity give
  $ \| C \( g \) \|^2 lt.eq d_tau^2 (integral_(H_i) A \( h^(- 1) g \) thin d h) (integral_(H_i) \| chi_tau \( h \) \|^2 A \( h^(- 1) g \) thin d h) . $
  The first factor is at most $B_L$. The average over $G$ of the second factor is $a integral_(H_i) \| chi_tau \|^2 = a$. The Fourier matrix of $C$ is $P_(i \, tau) hat(alpha) \( lambda \)$. Plancherel, retaining the $lambda$ term, therefore yields
  #[#set math.equation(numbering: n => "(8.8)")
   $ D_lambda parallel P_(i \, tau) hat(alpha) \( lambda \) parallel_(upright("HS"))^2 lt.eq B_L a d_tau^2 \, #h(2em) D_lambda parallel hat(beta) \( lambda \) P_(i \, tau) parallel_(upright("HS"))^2 lt.eq B_R c d_tau^2 . $ <l:two-sided-isotypic>]
  For the second inequality use $d_tau integral_(H_i) overline(chi_tau \( h \)) B \( g h^(- 1) \) thin d h$, whose transform is $hat(beta) \( lambda \) P_(i \, tau)$, and the second cap in (8.7).
  The projectors for the different disjoint factors commute, and $Q_(bold(tau)) = product_i P_(i \, tau_i)$ are the orthogonal joint projections in (8.1). On a nonzero joint space, $product_i d_(tau_i) lt.eq D_lambda$, so some $d_(tau_i) lt.eq D_lambda^(1 \/ b)$. Since $Q_(bold(tau)) lt.eq P_(i \, tau_i)$, the two bounds in (8.8) imply
  $ parallel accent(beta Q, ̂)_(bold(tau)) hat(alpha) parallel_(upright("HS")) & lt.eq parallel accent(beta Q, ̂)_(bold(tau)) parallel_(upright("HS")) parallel Q_(bold(tau)) hat(alpha) parallel_(upright("HS"))\
 & lt.eq sqrt(B_L B_R a c) thin D_lambda^(- 1 + 2 \/ b) . $
  Sum over the $K_lambda$ joint types before squaring, and then multiply by $D_lambda$. This gives (8.6). The factor $K_lambda^2$ is retained; no multiplicity-free restriction has been assumed. ◻
]

#thm([Corollary 8.6.])[
  (Two-factor completion).  #emph[Fix $b > 4$ and finite constants $B_L \, B_R$. Suppose probabilities $mu_n \, nu_n$ on $S_n$ dominate subprobabilities $alpha_n \, beta_n$, respectively, whose masses tend to one and which satisfy (8.5) for $b$ disjoint nonempty blocks. If $hat(nu)_n \( "sgn" \) hat(mu)_n \( "sgn" \) arrow.r 0$, then 
$ parallel nu_n * mu_n - U_(S_n) parallel_(upright("TV")) arrow.r 0 . $

 In particular this applies to a single law with small sign mean when separate subprobabilities supply its two cap orientations.]
] <l:two-sided-completion>

#proof[
  Use Lemma 28 with $eta = 1 - 4 \/ b > 0$ in Theorem 32. It makes the sum of the nonlinear Plancherel terms for $beta_n * alpha_n$ tend to zero. Its trivial coefficient is the product of the two masses, tending to one. Domination bounds the error in each sign coefficient by the corresponding lost mass, so its sign coefficient also tends to zero. Lemma 5 now gives convergence to uniform in $ell^1$. Finally, $beta_n * alpha_n lt.eq nu_n * mu_n$ and the difference has mass one minus the product of the retained masses. Adding that mass proves the conclusion. ◻
]

== 9 Equivariant kernels and their multiplicity spaces <l:equivariant-section>

Partial-permutation information can be imposed on a transition kernel without first selecting a starting permutation. This preserves a group action on the entire state space. The resulting Fourier decomposition has two parts: an irreducible carrier, on which the kernel acts as the identity, and a multiplicity space, on which it may act nontrivially. The latter space can be large even when the carrier is one-dimensional. We prove two amplification results that retain these multiplicities.

Throughout this section kernels act on functions by

$ \( A f \) \( x \) = sum_y A \( x \, y \) f \( y \) . $

All Hilbert–Schmidt norms use counting measure and the ordinary trace. For a finite state space $Omega$, let $U_Omega$ be the matrix with every entry $1 \/ \| Omega \|$. Thus $U_Omega$ is the orthogonal projection onto the normalized constant vector. A nonnegative matrix with row and column sums at most one is a contraction on $ell^2 \( Omega \)$: indeed,

$ sum_x lr(|sum_y A \( x \, y \) f \( y \)|)^2 lt.eq sum_(x \, y) A \( x \, y \) \| f \( y \) \|^2 lt.eq sum_y \| f \( y \) \|^2 . $

We will use this fact for kernels obtained by deleting entries of a doubly stochastic kernel.

=== 9.1 Sixteen separately truncated factors <sixteen-separately-truncated-factors>

Let $A$ and $V$ be two sets of size $n$, and let $Omega = "Bij" \( A \, V \)$ be the set of bijections from labels to positions. Partition $A$ into sixteen blocks $A_1 \, dots.h \, A_16$, of sizes $m_i$, and write

$ H_i = S_(A_i) \, #h(2em) H = product_(i = 1)^16 H_i . $

These groups act on $Omega$ on the right by composition: $x dot.op h = x compose h$. The quotient $X_i = Omega \/ H_i$ records the positions of every label outside $A_i$. Its size is $L_i = n ! \/ m_i !$, and each of its fibers has $m_i !$ elements.

If a kernel $K$ obeys $K \( x h \, y h \) = K \( x \, y \)$ for $h in H$, its quotient kernel on $X_i$ is well defined by

$ q_i \( a \, b \) = sum_(y : thin pi_i \( y \) = b) K \( x \, y \) \, #h(2em) pi_i \( x \) = a \, $

where $pi_i : Omega arrow.r X_i$ is the quotient map. Equivariance under $H_i$ makes the right side independent of the representative $x$. Fix a number $epsilon > 0$ and define a retained kernel by

#[#set math.equation(numbering: n => "(9.1)")
 $ T_i \( x \, y \) = K \( x \, y \) thin upright(bold(1)) {q_i \( pi_i \( x \) \, pi_i \( y \) \) lt.eq frac(1 + epsilon, L_i)} . $ <l:sixteen-cutoff>]

Since $H_i$ is normal in $H$, the quotient has a right $H$-action. Equivariance of $K$ gives $q_i \( a h \, b h \) = q_i \( a \, b \)$ for $h in H$. The cutoff therefore preserves the action of all of $H$.

We specify one further hypothesis on $T_i$. In the orthogonal $H_i$-isotypic decomposition

$ ell^2 \( Omega \) = xor.big_(alpha in hat(H)_i) V_alpha ⊗ cal(M)_(i \, alpha) \, #h(2em) T_i = xor.big_alpha I_(V_alpha) ⊗ T_i^alpha \, $

$cal(M)_(i \, alpha)$ is the full multiplicity space, including all quotient fibers. In particular $T_i^(upright("sgn"))$ denotes the operator on the sign multiplicity space, not a single scalar Fourier coefficient.

#thm([Theorem 9.1.])[
  (Sixteen equivariant subkernels).  #emph[Consider a sequence of the preceding state spaces and partitions with $min_i m_i arrow.r oo$. Let $K$ be a doubly stochastic, $H$-equivariant kernel. Suppose that, for every $i$, 
#[#set math.equation(numbering: n => "(9.2)")
 $ 1 / L_i sum_(a in X_i) 1 / 2 sum_(b in X_i) \| q_i \( a \, b \) - L_i^(- 1) \| lt.eq delta \, $ <l:sixteen-marginal-input>]

 where $delta arrow.r 0$. Choose $epsilon arrow.r 0$ with $delta \/ epsilon arrow.r 0$, form the kernels (9.1), and assume also that 
#[#set math.equation(numbering: n => "(9.3)")
 $ beta_i := parallel T_i^(upright("sgn")) parallel_(upright("HS"))^2 arrow.r 0 #h(2em) \( 1 lt.eq i lt.eq 16 \) . $ <l:sixteen-sign-input>]

 Then 
$ frac(1, \| Omega \|) sum_(x in Omega) parallel K^16 \( x \, dot.op \) - U_Omega \( x \, dot.op \) parallel_(upright("TV")) arrow.r 0 . $

 If $K$ is equivariant under a transitive group of permutations of $Omega$, the same conclusion holds for the maximum over starting states.]
  #emph[More precisely, put $T = T_1 dots.h.c T_16$. For a product type $bold(alpha) = \( alpha_1 \, dots.h \, alpha_16 \)$, set $f_i = dim alpha_i$ and $D = product_i f_i$. If $T_(i \, bold(alpha))$ is the operator on its full $H$-multiplicity space, then 
#[#set math.equation(numbering: n => "(9.4)")
 $ parallel T_(i \, bold(alpha)) parallel_(upright("HS"))^2 lt.eq \( 1 + epsilon \) f_i^2 / D \, #h(2em) D parallel T_(1 \, bold(alpha)) dots.h.c T_(16 \, bold(alpha)) parallel_(upright("HS"))^2 lt.eq \( 1 + epsilon \)^16 D^(- 13) . $ <l:sixteen-type-bounds>]

]
] <l:equivariant-sixteen>

#proof[
  We first bound the deleted mass, then use each of the sixteen quotient caps on its corresponding factor. Write
  $ gamma_i = frac(1, \| Omega \|) sum_(x \, y) \( K \( x \, y \) - T_i \( x \, y \) \) . $
  On an atom with $q_i \( a \, b \) > \( 1 + epsilon \) \/ L_i$, its positive excess over uniform is at least $epsilon q_i \( a \, b \) \/ \( 1 + epsilon \)$. Summing over such atoms and then averaging over $a$ gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ gamma_i lt.eq frac(1 + epsilon, epsilon) delta = o \( 1 \) . $ <l:sixteen-loss>]
  Every $T_i$ is row- and column-substochastic. A uniform starting distribution remains dominated by uniform after any product of these kernels. The average mass lost in $T$ is consequently at most $Gamma = sum_i gamma_i$. Also $0 lt.eq T lt.eq K^16$ entrywise. The triangle inequality followed by Cauchy–Schwarz over all $\| Omega \|^2$ entries gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ frac(1, \| Omega \|) sum_x parallel K^16 \( x \, dot.op \) - U_Omega \( x \, dot.op \) parallel_(upright("TV")) lt.eq Gamma / 2 + 1 / 2 parallel T - U_Omega parallel_(upright("HS")) . $ <l:sixteen-average-tv>]
  Fix $i$ and first decompose only under $H_i$. Each quotient fiber is a regular $H_i$-set. After choosing one representative per fiber, the block of $T_i$ between fibers $a \, b$ is convolution by nonnegative weights of total mass
  $ t_i \( a \, b \) = q_i \( a \, b \) upright(bold(1)) { q_i \( a \, b \) lt.eq \( 1 + epsilon \) \/ L_i } . $
  On the multiplicity space of a regular-fiber type $alpha$, of degree $f_alpha$, this block is a weighted sum of unitary $f_alpha$ by $f_alpha$ matrices. Its Hilbert–Schmidt norm is at most $sqrt(f_alpha) thin t_i \( a \, b \)$. Since each row of $t_i$ has mass at most one, the cap gives
  #[#set math.equation(numbering: n => "(9.7)")
   $ parallel T_i^alpha parallel_(upright("HS"))^2 lt.eq f_alpha sum_(a \, b) t_i \( a \, b \)^2 lt.eq \( 1 + epsilon \) f_alpha . $ <l:sixteen-single-hs>]
  Now decompose under the whole product $H$. Its $bold(alpha)$-isotype is
  $ (⨂_(j = 1)^16 V_(alpha_j)) ⊗ cal(M)_(bold(alpha)) . $
  Viewed only as an $H_i$-space, it contributes $D \/ f_i$ copies of $cal(M)_(bold(alpha))$ to the multiplicity of $alpha_i$. Thus (9.7) implies
  $ D / f_i parallel T_(i \, bold(alpha)) parallel_(upright("HS"))^2 lt.eq \( 1 + epsilon \) f_i . $
  Multiplying these inequalities and using Hilbert–Schmidt submultiplicativity proves (9.4).
  For $u > 0$, write $cal(Z)_u \( m \) = sum_(alpha in hat(S)_m) \( dim alpha \)^(- u)$. The degree estimate of Theorem 22 gives $cal(Z)_13 \( m \) arrow.r 2$. The total squared Hilbert–Schmidt contribution of all product types with $D > 1$ is therefore at most
  #[#set math.equation(numbering: n => "(9.8)")
   $ \( 1 + epsilon \)^16 (product_(i = 1)^16 cal(Z)_13 \( m_i \) - 2^16) = o \( 1 \) . $ <l:sixteen-nonscalar-sum>]
  The subtracted types are precisely the products of trivial and sign representations, since eventually every $m_i gt.eq 2$.
  It remains to handle these $2^16$ scalar carrier types; their multiplicity spaces have not been discarded. If a product type has a sign coordinate $i$, its $T_i$ block has squared Hilbert–Schmidt norm at most $beta_i$ by (9.3). All the other factors are operator contractions. Hence its product block has squared Hilbert–Schmidt norm at most $beta_i$. The sum over these finitely many types tends to zero.
  For the all-trivial type, let $T_(i \, 0)$ be its multiplicity operator and let $u = \| Omega \|^(- 1 \/ 2) upright(bold(1))$ be the constant vector in that space. The restriction of $U_Omega$ is $P_u = u u^(*)$. Equation (9.7) for the trivial $H_i$ type gives $parallel T_(i \, 0) parallel_(upright("HS"))^2 lt.eq 1 + epsilon$, whereas
  $ chevron.l u \, T_(i \, 0) u chevron.r = 1 - gamma_i . $
  Consequently
  #[#set math.equation(numbering: n => "(9.9)")
   $ parallel T_(i \, 0) - P_u parallel_(upright("HS"))^2 = parallel T_(i \, 0) parallel_(upright("HS"))^2 + 1 - 2 chevron.l u \, T_(i \, 0) u chevron.r lt.eq epsilon + 2 gamma_i . $ <l:sixteen-trivial-rank-one>]
  Telescoping the product against $P_u^16 = P_u$, with operator contractions on either side of each difference, gives
  $ parallel T_(1 \, 0) dots.h.c T_(16 \, 0) - P_u parallel_(upright("HS")) lt.eq sum_(i = 1)^16 sqrt(epsilon + 2 gamma_i) = o \( 1 \) . $
  This is a bound on the entire all-trivial multiplicity space.
  The three estimates prove $parallel T - U_Omega parallel_(upright("HS")) arrow.r 0$, so (9.6) proves average mixing. Finally, equivariance under a transitive group makes all row distances of $K^16$ from uniform equal. That additional symmetry gives the worst-start conclusion. ◻
]

The sign hypothesis concerns the retained factors themselves. A probabilistic construction can verify it by cancellation inside each retained fiber block. The quotient total-variation estimate alone supplies the mass loss and the general type bound, but does not control the sign multiplicity operator.

=== 9.2 Three groups and two-sided quotient control <three-groups-and-two-sided-quotient-control>

The next result uses only three label groups, at the cost of controlling every quotient row and column. All three cutoffs are imposed on one kernel. Fourier analysis then gives one matrix for each product type, and fifteen powers of that matrix supply the summable dimension saving.

Let $cal(S)$ be a nonempty finite set of size $M$, let $H_i = S_(m_i)$ for $1 lt.eq i lt.eq 3$, and put $H = H_1 times H_2 times H_3$ and $Omega = cal(S) times H$. The right $H$-action is $\( s \, g \) h = \( s \, g h \)$. Its equivariant kernels have the form

#[#set math.equation(numbering: n => "(9.10)")
 $ K \( \( s \, g \) \, \( s' \, g' \) \) = p_(s \, s') \( g' g^(- 1) \) . $ <l:three-convolution-kernel>]

Indeed simultaneous right multiplication reduces the source group coordinate to the identity. We always take the functions $p_(s \, s') : H arrow.r \[ 0 \, oo \)$ to satisfy

#[#set math.equation(numbering: n => "(9.11)")
 $ sum_(s' \, h) p_(s \, s') \( h \) = 1 quad \( s in cal(S) \) \, #h(2em) sum_(s \, h) p_(s \, s') \( h \) = 1 quad \( s' in cal(S) \) . $ <l:three-bistochastic>]

These are exactly the row and column normalizations of $K$. For $H_(- i) = product_(j eq.not i) H_j$, define

$ q_i \( s \, s' \, h_(- i) \) = sum_(h_i in H_i) p_(s \, s') \( h \) \, #h(2em) M_i = M \| H_(- i) \| . $

The associated quotient state consists of $s$ and the two retained group coordinates. Its uniform transition probability is $1 \/ M_i$. Transposition of $K$ replaces the fibers by $macron(p)_(s' \, s) \( h \) = p_(s \, s') \( h^(- 1) \)$. Thus a quotient row estimate for the transpose is exactly the quotient column estimate below, after inversion of $h_(- i)$.

#thm([Theorem 9.2.])[
  (Three-group two-sided truncation).  #emph[Consider a sequence of kernels (9.10) satisfying (9.11), with $min_i m_i arrow.r oo$. Suppose $delta arrow.r 0$ and, for every $i$, 
#[#set math.equation(numbering: n => "(9.12)")
 $ sum_(s' \, h_(- i)) \| q_i \( s \, s' \, h_(- i) \) - M_i^(- 1) \| & lt.eq 2 delta &  & \( s in cal(S) \) \,\
sum_(s \, h_(- i)) \| q_i \( s \, s' \, h_(- i) \) - M_i^(- 1) \| & lt.eq 2 delta &  & \( s' in cal(S) \) . $ <l:three-row-input>]

 Let $chi \( h \) = product_(i = 1)^3 upright("sgn") \( h_i \)$, and assume that the untrimmed all-sign matrix 
$ A_chi \( s \, s' \) = sum_(h in H) p_(s \, s') \( h \) chi \( h^(- 1) \) $

 has absolute row and column sums at most $a$, where $a arrow.r 0$. Then $K^15$ mixes in average row total variation: 
$ frac(1, \| Omega \|) sum_x parallel K^15 \( x \, dot.op \) - U_Omega \( x \, dot.op \) parallel_(upright("TV")) arrow.r 0 . $

 The maximum row distance also tends to zero if $K$ is equivariant under a transitive group of permutations of $Omega$.]
  #emph[Specifically, retain the fibers 
#[#set math.equation(numbering: n => "(9.13)")
 $ tilde(p)_(s \, s') \( h \) = p_(s \, s') \( h \) product_(i = 1)^3 upright(bold(1)) { q_i \( s \, s' \, h_(- i) \) lt.eq 2 \/ M_i } \, $ <l:three-cutoff>]

 and let $tilde(K)$ be the corresponding kernel. At most $6 delta$ mass is removed from every row and column. For an irreducible product type $rho = rho_1 ⊗ rho_2 ⊗ rho_3$, put $D_i = dim rho_i$ and $D = product_i D_i$. Its multiplicity matrix is the $M$ by $M$ block matrix 
#[#set math.equation(numbering: n => "(9.14)")
 $ B_rho \( s \, s' \) = sum_(h in H) tilde(p)_(s \, s') \( h \) rho \( h^(- 1) \) \, $ <l:three-fourier-block>]

 with blocks of size $D$ by $D$, and it satisfies 
#[#set math.equation(numbering: n => "(9.15)")
 $ parallel B_rho parallel_(upright("HS"))^2 lt.eq 4 frac(D_i, product_(j eq.not i) D_j) quad \( 1 lt.eq i lt.eq 3 \) \, #h(2em) D parallel B_rho^15 parallel_(upright("HS"))^2 lt.eq 2^30 D^(- 4) . $ <l:three-type-bounds>]

]
] <l:three-group>

#proof[
  For fixed $s$, the entries of each $q_i$ sum to one. The same is true for fixed $s'$ by (9.11). Therefore the positive excess over uniform in either a quotient row or a quotient column is at most $delta$. On an atom exceeding twice uniform, its mass is at most twice its positive excess. Each cutoff loses at most $2 delta$ in every row and column. Taking the union of the three deleted sets proves the loss bound $6 delta$. The retained kernel is row- and column-substochastic, so its blocks are operator contractions. Also its $i$th quotient marginal is everywhere bounded by $2 \/ M_i$: an original atom above that value has been entirely deleted.
  We check the Fourier orientation before estimating the blocks. The unitary regular decomposition of the right $H$-action has carrier $V_rho$ and multiplicity $D$ on each fiber $s$. In the matrix-coefficient basis $rho \( g^(- 1) \)_(a b)$, left multiplication $g mapsto h g$ replaces
  $ rho \( g^(- 1) \) quad upright("by") quad rho \( g^(- 1) h^(- 1) \) = rho \( g^(- 1) \) rho \( h^(- 1) \) . $
  For each fixed carrier index $a$, the index $b$, together with $s$, is therefore acted on by (9.14). Each such matrix occurs $D$ times. In particular composition of the deck kernels gives powers of $B_rho$, with no adjoint or reversal of the factors.
  Fix $s \, s'$ and an index $i$. First sum over its group coordinate:
  $ F \( h_(- i) \) = sum_(h_i) tilde(p)_(s \, s') \( h \) rho_i \( h_i^(- 1) \) . $
  The quotient cap and unitarity give $parallel F \( h_(- i) \) parallel_(upright("HS")) lt.eq 2 sqrt(D_i) \/ M_i$. Applying Plancherel entry by entry on $H_(- i)$ yields
  $ & sum_(sigma in hat(H)_(- i)) \( dim sigma \) ∥sum_(h_(- i)) sigma \( h_(- i)^(- 1) \) ⊗ F \( h_(- i) \)∥_(upright("HS"))^2\
 & #h(25mm)  = \| H_(- i) \| sum_(h_(- i)) parallel F \( h_(- i) \) parallel_(upright("HS"))^2 lt.eq frac(4 D_i, M^2) . $
  Keep the term $sigma = ⨂_(j eq.not i) rho_j$ and sum over the $M^2$ pairs $\( s \, s' \)$. A unitary permutation of tensor factors identifies the resulting matrix with $B_rho$, proving the first bound in (9.15). Choose an index with $D_i lt.eq D^(1 \/ 3)$. Then
  $ parallel B_rho parallel_(upright("HS"))^2 lt.eq 4 D^(- 1 \/ 3) \, #h(2em) D parallel B_rho^15 parallel_(upright("HS"))^2 lt.eq D \( 4 D^(- 1 \/ 3) \)^15 = 2^30 D^(- 4) . $
  Hilbert–Schmidt submultiplicativity suffices here; no normality is assumed. By Theorem 22, the sum over $D > 1$ is at most
  $ 2^30 (product_(i = 1)^3 cal(Z)_4 \( m_i \) - 8) = o \( 1 \) . $
  We have controlled every carrier of dimension greater than one. The eight scalar carriers remain: one is all-trivial, six contain both a trivial and a sign factor, and one is all-sign. In every case the corresponding $M$ by $M$ matrix has Hilbert–Schmidt norm at most two, by (9.15).
  Consider first one of the six mixed types. Choose an index $i$ where $rho_i$ is trivial, so that its matrix entries are the signed sums of the retained marginal $tilde(q)_i$. Replacing that marginal by $1 \/ M_i$ gives zero, since at least one of the other two factors is sign and its group sum vanishes. In each row and column,
  $ sum \| tilde(q)_i - M_i^(- 1) \| lt.eq sum \| q_i - M_i^(- 1) \| + sum \( q_i - tilde(q)_i \) lt.eq 8 delta . $
  Thus $B_rho$ has absolute row and column sums at most $8 delta$, and the same Cauchy–Schwarz argument used for nonnegative kernels, applied to absolute entries, gives $parallel B_rho parallel_(upright("op")) lt.eq 8 delta$. Hence
  $ parallel B_rho^15 parallel_(upright("HS")) lt.eq 2 \( 8 delta \)^14 = o \( 1 \) . $
  For the all-trivial type, uniform replacement instead gives the matrix $J$ with every entry $1 \/ M$. Write $B_0 = J + E$. The preceding row and column estimate gives $parallel E parallel_(upright("op")) lt.eq 8 delta$, while $parallel E parallel_(upright("HS")) lt.eq parallel B_0 parallel_(upright("HS")) + parallel J parallel_(upright("HS")) lt.eq 3$. Expand $\( J + E \)^15$ into ordered words. The word containing only $J$ equals $J$, because $J$ is an orthogonal projection. Every word containing both letters has a factor $J$ of Hilbert–Schmidt norm one and at least one factor $E$ of operator norm at most $8 delta$, so its Hilbert–Schmidt norm tends to zero. The word $E^15$ has norm at most $3 \( 8 delta \)^14$. There are only $2^15$ words. This proves
  $ parallel B_0^15 - J parallel_(upright("HS")) = o \( 1 \) $
  without bounding the size $M$ of the trivial multiplicity space.
  Finally consider the all-sign type. Its untrimmed matrix is $A_chi$. Deleting at most $6 delta$ mass from each row and column changes each corresponding absolute sum by at most $6 delta$. Consequently
  $ parallel B_chi parallel_(upright("op")) lt.eq a + 6 delta \, #h(2em) parallel B_chi^15 parallel_(upright("HS")) lt.eq 2 \( a + 6 delta \)^14 = o \( 1 \) . $
  This is precisely where the separate all-sign hypothesis is used.
  The uniform kernel has only the all-trivial block $J$. Summing all blocks with their carrier multiplicities $D$ now gives $parallel tilde(K)^15 - U_Omega parallel_(upright("HS")) = o \( 1 \)$. For all sufficiently large members of the sequence $6 delta < 1$. Every row of $tilde(K)^15$ has mass at least $\( 1 - 6 delta \)^15$ and is dominated by the corresponding row of $K^15$. Thus, as in (9.6),
  $ frac(1, \| Omega \|) sum_x parallel K^15 \( x \, dot.op \) - U_Omega \( x \, dot.op \) parallel_(upright("TV")) lt.eq 45 delta + 1 / 2 parallel tilde(K)^15 - U_Omega parallel_(upright("HS")) = o \( 1 \) . $
  The final transitive-equivariance assertion follows because the untrimmed kernel then has the same row distance at every state. ◻
]

The two-sided assumptions have distinct roles. Quotient rows bound the forward mass removed; quotient columns bound the reverse mass removed and the operator norms of the scalar error matrices. The all-sign estimate is additional data. In applications where it is proved by cancellation at the end of a time block, the distribution just before that canceling step must also be controlled in both orientations.

== 10 Selecting coefficient tests and omitted sets <l:domains-section>

The common coset truncation of Section 3 already applies to the marginal hypotheses considered here. This section gives two different constructions of a retained measure. With a fixed partition, we delete points detected by large coefficient tests and control the union of all those tests. With an average over omitted sets, we instead retain permutations for which most restrictions have bounded density. The good omitted sets then depend on the permutation; we do not select a fixed partition on which the retained law has all its coset caps. Recovering a vector from their subgroup projections is the new step, because projections for overlapping sets need not commute.

Write $\[ n \] = { 1 \, dots.h \, n }$ and let $U_n$ be uniform on $S_n$. For $R subset.eq \[ n \]$, put $H_R = "Sym" \( R \)$, acting trivially outside $R$, and write $g_(- R) = g \|_(\[ n \] \\ R)$. Its fibers are the left cosets $g H_R$: two permutations have the same restriction precisely when they differ by right composition with an element of $H_R$. For a probability $mu$ on $S_n$, let $mu_(- R)$ and $U_(- R)$ be the restriction laws under $mu$ and $U_n$, respectively. Every average over $R$ below is uniform over subsets of its stated size.

=== 10.1 Pruning coefficient tests for a fixed partition <pruning-coefficient-tests-for-a-fixed-partition>

The first argument uses each marginal estimate once, on a union of tests chosen during a finite deletion procedure. Applying the marginal estimate separately at each deletion would multiply its error by the number of tests and lose the conclusion.

#thm([Theorem 10.1.])[
  (Spectral pruning).  #emph[Let $n arrow.r oo$ through multiples of $16$. For each $n$, partition $\[ n \]$ into $b = 16$ equal blocks $R_i$, and let $mu_n$ be a probability on $S_n$ satisfying 
$ parallel \( mu_n \)_(- R_i) - U_(- R_i) parallel_(upright("TV")) lt.eq delta_n quad \( 1 lt.eq i lt.eq 16 \) \, #h(2em) delta_n arrow.r 0 . $

 There is a nonnegative measure $0 lt.eq nu_n lt.eq mu_n$ of mass $1 - gamma_n$, with $gamma_n arrow.r 0$, such that 
$ parallel hat(nu)_n \( rho \) parallel_(upright("op")) lt.eq D^(- 1 \/ 8) quad upright("for every irreducible ") rho upright(" of degree ") D > 1 . $

 The operator bound has constant one, and $nu_n$ is not normalized.]
] <l:spectral-pruning>

#proof[
  Put $a = 1 \/ 8$ and $K_i = H_(R_i)$. Fix an irreducible $rho$ of degree $D > 1$. Every tensor type in its restriction to $product_i K_i$ has product of factor degrees at most $D$. Assign each entire isotypic space to one factor whose degree is at most $D^(1 \/ b)$. This yields an orthogonal decomposition of any unit vector $v$ as $v = sum_i v_i$, where $v_i$ contains only these small $K_i$-types. For $W_i = "span" rho \( K_i \) v_i$, Lemma 7 counts each type once, including all its multiplicities. Together with Lemma 23, it gives
  $ dim W_i lt.eq C_1 D^(3 \/ b) \, #h(2em) C_1 = sup_(m gt.eq 1) sum_(tau in hat(S_m)) \( dim tau \)^(- 1) . $
  For fixed unit $u \, v$, the score
  $ H_(rho \, u \, v \, i) \( g \) = parallel "Proj"_(rho \( g \) W_i) u parallel $
  depends only on $g_(- R_i)$. Its uniform second moment is $dim W_i \/ D$ by Schur averaging [4] Proposition 3.14. Consequently
  #[#set math.equation(numbering: n => "(10.1)")
   $ U_n { H_(rho \, u \, v \, i) > D^(- a) \/ \( 2 b \) } lt.eq 4 b^2 C_1 D^(- 1 + 2 a + 3 \/ b) . $ <l:pruning-test-bound>]
  If $\| chevron.l u \, rho \( g \) v chevron.r \| > D^(- a) \/ 2$, at least one score exceeds $D^(- a) \/ \( 2 b \)$, because $parallel v_i parallel lt.eq 1$ and $\| chevron.l u \, rho \( g \) v_i chevron.r \| lt.eq H_(rho \, u \, v \, i) \( g \)$.
  Start with the measure $nu = mu_n$. Whenever its claimed operator bound fails, choose $rho \, u \, v$ with $\| chevron.l u \, hat(nu) \( rho \) v chevron.r \| > D^(- a)$, record this test, and delete all remaining mass on
  $ { g : \| chevron.l u \, rho \( g \) v chevron.r \| > D^(- a) \/ 2 } . $
  The mass deleted is greater than $D^(- a) \/ 2$: outside this event the coefficient has absolute value at most $D^(- a) \/ 2$, everywhere it has absolute value at most one, and the current measure has mass at most one. Since all deleted pieces are disjoint, any one representation of degree $D$ can be selected at most $2 D^a$ times. There are finitely many irreducibles, so the procedure terminates with all the required bounds. The choices are made from deterministic current measures; thus the eventual finite list of tests is fixed, not selected anew for a sampled permutation.
  For each $i$, let $E_i$ be the union of its score events in (10.1) over the complete list of recorded tests. It is a single event determined by $g_(- R_i)$. Counting tests for each representation gives
  $ U_n \( E_i \) lt.eq 8 b^2 C_1 sum_(rho : dim rho > 1) D^(- 1 + 3 a + 3 \/ b) = 8 b^2 C_1 sum_(rho : dim rho > 1) D^(- 7 \/ 16) = o \( 1 \) \, $
  by Theorem 22. Apply the marginal hypothesis to this entire union to get $mu_n \( E_i \) lt.eq U_n \( E_i \) + delta_n$. Every deleted point belongs to some $E_i$, so the total mass loss is at most $sum_i mu_n \( E_i \) = o \( 1 \)$. This proves the theorem. ◻
]

=== 10.2 A common truncation and its low-dimensional types <a-common-truncation-and-its-low-dimensional-types>

We first give the truncation and the projection estimates with a variable number of omitted blocks. This identifies exactly which part of the two transfers below is shared.

#thm([Lemma 10.2.])[
  (Good domains and averaged projections).  #emph[Let $q gt.eq 2$ divide $n$, put $r = n \/ q$, and let $mu$ be a probability on $S_n$. Define 
$ delta = bb(E)_(\| R \| = r) parallel mu_(- R) - U_(- R) parallel_(upright("TV")) \, #h(2em) e_R \( g \) = upright(bold(1)) { mu \( g H_R \) lt.eq 2 \/ \[ S_n : H_R \] } \, $

 and 
$ E = { g : bb(E)_R e_R \( g \) gt.eq 7 \/ 8 } . $

 Then $mu \( E \) gt.eq 1 - 16 delta$. If $mu \( E \) gt.eq 1 \/ 2$, the probability $nu = mu \( thin dot.op divides E \)$ satisfies $parallel nu - mu parallel_(upright("TV")) = 1 - mu \( E \) lt.eq 16 delta$.]
  #emph[Fix an irreducible unitary representation $rho$ of $S_n$ on $V$, with $D = dim V > 1$, and fix $xi > 0$. Let $P_R$ project onto the sum of the $H_R$-isotypic spaces whose irreducible type has degree at most $D^xi$. Then 
#[#set math.equation(numbering: n => "(10.2)")
 $ bb(E)_R P_R = c I \, #h(2em) c gt.eq 1 - frac(1, q xi) . $ <l:adaptive-scalar-projection>]

 For $z in V$ with $parallel z parallel lt.eq 1$, put $W_R \( z \) = "span" { rho \( h \) P_R z : h in H_R }$. With the absolute constant 
$ C_2 = sup_(m gt.eq 1) sum_(tau in hat(S_m)) \( dim tau \)^(- 2) $

 from Lemma 58, one has 
#[#set math.equation(numbering: n => "(10.3)")
 $ dim W_R \( z \) lt.eq C_2 D^(4 xi) . $ <l:adaptive-small-orbit>]

 If $mu \( E \) gt.eq 1 \/ 2$, then for every unit $u in V$, 
#[#set math.equation(numbering: n => "(10.4)")
 $ bb(E)_(g tilde.op nu) e_R \( g \) \| chevron.l u \, rho \( g \) P_R z chevron.r \| lt.eq 2 sqrt(C_2) thin D^(- 1 \/ 2 + 2 xi) . $ <l:adaptive-good-coefficient>]

]
] <l:adaptive-domain-preparation>

#proof[
  For any probability $a$ and uniform probability $b$ on a finite set,
  $ sum_(x : a \( x \) > 2 b \( x \)) a \( x \) lt.eq 2 sum_(x : a \( x \) > b \( x \)) \( a \( x \) - b \( x \) \) = 2 parallel a - b parallel_(upright("TV")) . $
  Apply this to each restriction law. Under $g tilde.op mu$, the expected fraction of sets with $e_R \( g \) = 0$ is at most $2 delta$. Markov’s inequality gives $mu \( E^c \) lt.eq 16 delta$. Conditioning on $E$ changes the law in total variation by exactly $mu \( E^c \)$.
  Conjugating $H_R$ by $a in S_n$ replaces it by $H_(a R)$ and conjugates $P_R$ by $rho \( a \)$. Hence the average projection commutes with $rho \( S_n \)$ and is scalar. To estimate its trace, choose one partition $\( R_1 \, dots.h \, R_q \)$ into equal blocks. The restriction of $V$ to $product_i H_(R_i)$ is an orthogonal sum of tensor types, with arbitrary multiplicities. If a type has factor degrees $d_1 \, dots.h \, d_q$, then $product_i d_i lt.eq D$, since at least one copy of that type occurs in $V$. Consequently at most $1 \/ xi$ factors have degree greater than $D^xi$. On this tensor type, $I - P_(R_i)$ is either the identity or zero according to that inequality. Summing traces, including multiplicities, gives
  $ sum_(i = 1)^q "rank" \( I - P_(R_i) \) lt.eq D \/ xi . $
  All these ranks agree by conjugacy. This proves (10.2). Commutation was used only for the disjoint subgroups in this rank calculation.
  For the orbit bound, Lemma 7 gives, with all multiplicities included,
  $ dim W_R \( z \) lt.eq sum_(dim tau lt.eq D^xi) \( dim tau \)^2 lt.eq D^(4 xi) sum_tau \( dim tau \)^(- 2) \, $
  which is (10.3).
  It remains to turn the orbit estimate into a coefficient estimate. The space $W = W_R \( z \)$ is $H_R$-invariant, so $rho \( g \) W$ depends only on $g H_R$. For unit $u$, Schur averaging and the trace give
  $ bb(E)_(g tilde.op U_n) parallel "Proj"_(rho \( g \) W) u parallel^2 = frac(dim W, D) . $
  On a coset with $e_R = 1$, the $nu$-mass is at most four times its uniform mass: the original cap is two and normalization costs at most two. Since $\| chevron.l u \, rho \( g \) P_R z chevron.r \| lt.eq parallel "Proj"_(rho \( g \) W) u parallel$, Cauchy–Schwarz gives
  $ bb(E)_nu e_R \( g \) \| chevron.l u \, rho \( g \) P_R z chevron.r \| lt.eq (4 frac(dim W, D))^(1 \/ 2) . $
  This proves (10.4). ◻
]

=== 10.3 A normalized expansion for 1024 omitted blocks <a-normalized-expansion-for-1024-omitted-blocks>

Both transfers below use the event $E$ and conditional law $nu$ constructed in the preceding lemma, with their respective values of $q$. The first uses the small lost rank in (10.2) to normalize the average of the retained projections. Its complement is then the average of only the discarded projections. This gives a rapidly decreasing remainder.

#thm([Theorem 10.3.])[
  (Omitted-set transfer).  #emph[Let $n arrow.r oo$ through multiples of $1024$, and let $mu_n$ be probabilities on $S_n$ such that 
$ delta_n = bb(E)_(\| R \| = n \/ 1024) parallel \( mu_n \)_(- R) - U_(- R) parallel_(upright("TV")) arrow.r 0 . $

 For all sufficiently large $n$, condition $mu_n$ on the event $E$ of Lemma 37, obtaining $nu_n$. Then $parallel nu_n - mu_n parallel_(upright("TV")) lt.eq 16 delta_n$, and there is an absolute $C$ such that every irreducible representation $rho$ of degree $D > 1$ satisfies 
$ parallel hat(nu)_n \( rho \) parallel_(upright("op")) lt.eq C D^(- 1 \/ 4) . $

 If in addition $bb(E)_(mu_n) "sgn" \( g \) = o \( 1 \)$, then $parallel mu_n^(* 8) - U_n parallel_(upright("TV")) arrow.r 0$.]
] <l:omitted-set-transfer>

#proof[
  Suppress $n$, fix $rho$, and use Lemma 37 with $q = 1024$ and $xi = 1 \/ 16$. Thus $c gt.eq 63 \/ 64$, and the right side of (10.4) is $A D^(- 3 \/ 8)$, where $A = 2 sqrt(C_2)$. For $g in E$ define
  $ Q_g = bb(E)_R e_R \( g \) P_R \, #h(2em) F_g = I - Q_g \/ c = c^(- 1) bb(E)_R \( 1 - e_R \( g \) \) P_R . $
  The equality for $F_g$ uses the scalar identity $bb(E)_R P_R = c I$; it does not require the individual projections to commute. These are positive operators, and $parallel F_g parallel_(upright("op")) lt.eq 1 \/ \( 8 c \)$. Put $s = ceil.l log D ceil.r$, with natural logarithms. The finite identity
  #[#set math.equation(numbering: n => "(10.5)")
   $ I = sum_(j = 0)^(s - 1) \( Q_g \/ c \) F_g^j + F_g^s $ <l:omitted-finite-expansion>]
  holds because $Q_g \/ c = I - F_g$.
  We now bound the expected coefficient of each term while preserving its projection order. For fixed unit vectors $u \, w$, the $j$th summand in (10.5) expands as an average over independently chosen $R_0 \, dots.h \, R_j$, with scalar factor $c^(- \( j + 1 \))$, indicator
  $ e_(R_0) \( g \) product_(i = 1)^j \( 1 - e_(R_i) \( g \) \) \, $
  and vector $P_(R_0) P_(R_1) dots.h.c P_(R_j) w$. Fix the sets before integrating over $g$. The vector $z = P_(R_1) dots.h.c P_(R_j) w$ is then deterministic with norm at most one. Take absolute values and discard the failure indicators for $i gt.eq 1$. Equation (10.4) now bounds the expected coefficient by $c^(- \( j + 1 \)) A D^(- 3 \/ 8)$. In particular the argument never exchanges two projections.
  The remainder has norm at most $\( 8 c \)^(- s)$. Summing gives
  $ bb(E)_nu \| chevron.l u \, rho \( g \) w chevron.r \| lt.eq A s c^(- s) D^(- 3 \/ 8) + \( 8 c \)^(- s) lt.eq C D^(- 1 \/ 4) . $
  For the last inequality, $c^(- s) lt.eq c^(- 1) D^(log \( 1 \/ c \))$ and $log \( 1 \/ c \) lt.eq log \( 64 \/ 63 \) < 1 \/ 32$; the remaining logarithmic factor is absorbed by $D^(3 \/ 32)$. Also $log \( 8 c \) > 1 \/ 4$. Taking the supremum over the unit vectors proves the operator bound.
  To obtain the convolution conclusion, the sign coefficient of $nu_n$ is $o \( 1 \)$, since the original sign coefficient is $o \( 1 \)$ and $parallel nu_n - mu_n parallel_(upright("TV")) = o \( 1 \)$. Plancherel and $parallel B parallel_(upright("HS")) lt.eq sqrt(D) parallel B parallel_(upright("op"))$ yield
  $ 4 parallel nu_n^(* 8) - U_n parallel_(upright("TV"))^2 lt.eq o \( 1 \) + C^16 sum_(rho : dim rho > 1) D^(2 - 16 \/ 4) = o \( 1 \) + C^16 sum_(rho : dim rho > 1) D^(- 2) arrow.r 0 $
  by Lemma 58. Replacing the eight independent factors $nu_n$ by $mu_n$ costs at most $8 parallel nu_n - mu_n parallel_(upright("TV")) = o \( 1 \)$. ◻
]

=== 10.4 A power expansion for 256 omitted blocks <a-power-expansion-for-256-omitted-blocks>

The second transfer uses the unnormalized average of good projections. The preceding lemma supplies its input with $q = 256$ and the same threshold $D^(1 \/ 16)$. Here a lower operator bound on that average controls the remainder, while expanding its complement costs the sum of the absolute polynomial coefficients. This gives the stated, weaker exponent without the scalar normalization used above.

For probabilities $p \, q$ on a finite set, write $D \( p bar.v.double q \) = sum_x p \( x \) log \( p \( x \) \/ q \( x \) \)$ for relative entropy, using natural logarithms, $0 log \( 0 \/ q \) = 0$, and value $+ oo$ if $p$ gives positive mass where $q$ vanishes.

#thm([Theorem 10.4.])[
  (Random-domain transfer).  #emph[Let $n arrow.r oo$ through multiples of $256$, and let $mu_n$ be probabilities on $S_n$ satisfying 
$ delta_n = bb(E)_(\| R \| = n \/ 256) parallel \( mu_n \)_(- R) - U_(- R) parallel_(upright("TV")) arrow.r 0 . $

 Condition on the event that at least $7 \/ 8$ of the sets $R$ satisfy $mu_n \( g H_R \) lt.eq 2 \/ \[ S_n : H_R \]$, and call the resulting law $nu_n$. For all sufficiently large $n$ it is defined, satisfies $parallel nu_n - mu_n parallel_(upright("TV")) lt.eq 16 delta_n$, and obeys 
$ parallel hat(nu)_n \( rho \) parallel_(upright("op")) lt.eq C D^(- 1 \/ 8) #h(2em) \( D = dim rho > 1 \) $

 with an absolute $C$. If $bb(E)_(mu_n) "sgn" \( g \) = o \( 1 \)$, then $parallel mu_n^(* 32) - U_n parallel_(upright("TV")) arrow.r 0$. The averaged relative-entropy hypothesis 
$ bb(E)_(\| R \| = n \/ 256) D \( \( mu_n \)_(- R) parallel U_(- R) \) = o \( 1 \) $

 is sufficient for these conclusions.]
] <l:domain-transfer>

#proof[
  Use Lemma 37 with $q = 256$ and $xi = 1 \/ 16$. In particular $c gt.eq 15 \/ 16$. For a retained permutation put
  $ M_g = bb(E)_R e_R \( g \) P_R . $
  Removing at most $1 \/ 8$ of the projections from their scalar average gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ 1 / 2 I lt.eq 13 / 16 I lt.eq M_g lt.eq I . $ <l:domain-positive-average>]
  For fixed unit vectors $u \, v$ and every integer $p gt.eq 1$,
  #[#set math.equation(numbering: n => "(10.7)")
   $ bb(E)_nu \| chevron.l u \, rho \( g \) M_g^p v chevron.r \| lt.eq A D^(- 3 \/ 8) \, #h(2em) A = 2 sqrt(C_2) . $ <l:domain-power-coefficient>]
  Indeed, expand $M_g^p$ over $R_1 \, dots.h \, R_p$ in that order. After taking absolute values, retain only the indicator $e_(R_1) \( g \)$. For the fixed sets, apply (10.4) to the deterministic vector $z = P_(R_2) dots.h.c P_(R_p) v$, of norm at most one. This proves (10.7), even when the omitted sets overlap.
  The estimates for positive powers must now recover the original vector. Put $L = floor.l \( log_2 D \) \/ 8 floor.r$. The identity
  $ v = sum_(j = 0)^(L - 1) M_g \( I - M_g \)^j v + \( I - M_g \)^L v $
  holds also when $L = 0$, with an empty sum. Its remainder has norm at most $2^(- L)$ by (10.6). Expand each $M_g \( I - M_g \)^j$ as a polynomial in $M_g$. The absolute values of its coefficients sum to $2^j$, so (10.7) gives
  $ bb(E)_nu \| chevron.l u \, rho \( g \) v chevron.r \| lt.eq 2^(- L) + A sum_(j = 0)^(L - 1) 2^j D^(- 3 \/ 8) lt.eq 2^(- L) + A 2^L D^(- 3 \/ 8) lt.eq C D^(- 1 \/ 8) . $
  Here $2^(- L) lt.eq 2 D^(- 1 \/ 8)$ and $2^L lt.eq D^(1 \/ 8)$, including $L = 0$. This proves the asserted operator bound.
  The sign coefficient is again $o \( 1 \)$. For $32$ factors the remaining Plancherel sum is at most
  $ C^64 sum_(rho : dim rho > 1) D^(2 - 64 \/ 8) = C^64 sum_(rho : dim rho > 1) D^(- 6) arrow.r 0 \, $
  because $D^(- 6) lt.eq D^(- 2)$ and Lemma 58 applies. The total-variation cost of replacing the $32$ factors is at most $32 parallel nu_n - mu_n parallel_(upright("TV")) = o \( 1 \)$. Finally Pinsker’s inequality and Jensen’s inequality give
  $ delta_n lt.eq (1 / 2 bb(E)_R D \( \( mu_n \)_(- R) parallel U_(- R) \))^(1 \/ 2) \, $
  which proves the entropy version. In this normalization Pinsker’s inequality reads $parallel p - u parallel_(upright("TV"))^2 lt.eq D \( p parallel u \) \/ 2$. To check the factor, take $A = { p gt.eq u }$, set $a = p \( A \)$ and $b = u \( A \)$, and group the entropy sum over $A$ and its complement. The log-sum inequality gives $D \( p parallel u \) gt.eq D \( "Ber" \( a \) parallel "Ber" \( b \) \)$. As a function of $a$, the binary relative entropy on the right vanishes with zero derivative at $a = b$ and has second derivative $1 \/ \[ a \( 1 - a \) \] gt.eq 4$. It is therefore at least $2 \( a - b \)^2 = 2 parallel p - u parallel_(upright("TV"))^2$, with boundary cases obtained by limits. ◻
]

== 11 Entropy comparisons for every change of measure <l:tilts-section>

The domain transfers use marginal information about one fixed law. Here the hypothesis instead compares entropy under every change of measure supported on one common event. We condition on a large representation coefficient and show that the resulting law puts mass on complementary-restriction events that are rare under uniform measure. The entropy comparison then bounds the probability of that coefficient event. The common event must be chosen before the representation and its two test vectors; an estimate only for the original law would not suffice after this conditioning.

Let $\( Omega \, cal(F) \, bb(P) \)$ be a probability space, and let $g : Omega arrow.r S_n$ be a measurable endpoint map. For a law $sigma$ on this space and $X subset.eq \[ n \]$, denote the law of $g \|_X$ by $sigma_X$ and its uniform injection reference by $U_X$. Relative entropy uses natural logarithms:

$ D \( sigma parallel bb(P) \) = integral log #h(-0.16667em) (frac(d sigma, d bb(P))) d sigma $

when $sigma lt.double bb(P)$, and is $+ oo$ otherwise.

#thm([Theorem 11.1.])[
  (Arbitrary-tilt entropy transfer).  #emph[Let $128$ divide $n$, let $cal(G) in cal(F)$, and suppose $a = bb(P) \( cal(G) \) > 0$. Assume that #emph[every] probability law $sigma$ on $\( Omega \, cal(F) \)$ supported on $cal(G)$ ($sigma \( cal(G) \) = 1$) satisfies 
#[#set math.equation(numbering: n => "(11.1)")
 $ D \( sigma parallel bb(P) \) gt.eq bb(E)_(X : thin \| X \| = n - n \/ 128) D \( sigma_X parallel U_X \) - n^(- 2) . $ <l:all-tilts-entropy-input>]

 There is an absolute $C$ such that, for every irreducible unitary representation $rho$ of $S_n$ of degree $D$ and all unit vectors $u \, z$, 
#[#set math.equation(numbering: n => "(11.2)")
 $ bb(P) { cal(G) \, \| chevron.l z \, rho \( g \) u chevron.r \| gt.eq D^(- 1 \/ 8) } lt.eq C D^(- 1 \/ 256) . $ <l:tilted-coefficient-tail>]

 If $eta$ is the endpoint law conditioned on $cal(G)$, then 
#[#set math.equation(numbering: n => "(11.3)")
 $ parallel hat(eta) \( rho \) parallel_(upright("op")) lt.eq D^(- 1 \/ 8) + C / a D^(- 1 \/ 256) . $ <l:tilted-operator-bound>]

 In particular, when $a gt.eq 1 \/ 2$, this is at most $C' D^(- 1 \/ 256)$ for an absolute $C'$. The statement therefore applies uniformly to a sequence with $bb(P) \( cal(G) \) = 1 - o \( 1 \)$.]
] <l:tilted-entropy>

#proof[
  Put $b = 128$. The claim for $D = 1$ follows by increasing $C$, so assume $D > 1$. Fix $u \, z$ and let $A$ be the event on the left side of (11.2). There is nothing to prove if $bb(P) \( A \) = 0$. Otherwise set $sigma = bb(P) \( thin dot.op divides A \)$. Then $sigma$ is supported on the same $cal(G)$ as in the hypothesis, and
  #[#set math.equation(numbering: n => "(11.4)")
   $ D \( sigma parallel bb(P) \) = log frac(1, bb(P) \( A \)) . $ <l:tilted-conditioning-entropy>]
  The reference law here remains $bb(P)$, not $bb(P) \( thin dot.op divides cal(G) \)$. Thus this identity controls the unconditioned probability of $A$; the factor $a^(- 1)$ enters only when we pass to the endpoint law $eta$ at the end. Our goal is to lower-bound this entropy by a positive multiple of $log D$. We do so using tests visible from complementary restrictions.
  Fix an ordered partition $\( C_1 \, dots.h \, C_b \)$ of $\[ n \]$ into equal blocks. Let $X_i = \[ n \] \\ C_i$ and $K_i = "Sym" \( C_i \)$. On $V_rho$, let $S_i$ project onto the sum of the $K_i$-isotypic spaces with type degree at most $D^(1 \/ b)$. The subgroups $K_i$ commute, as do their isotypic projections. On each tensor type in the product-group restriction, the product of its factor degrees is at most $D$. At least one factor is therefore at most $D^(1 \/ b)$, giving
  $ product_(i = 1)^b \( I - S_i \) = 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(11.5)")
   $ u = sum_(i = 1)^b u_i \, #h(2em) u_i = S_i product_(j < i) \( I - S_j \) u \, #h(2em) parallel u_i parallel lt.eq 1 . $ <l:tilted-vector-split>]
  Let $W_i = "span" { rho \( h \) u_i : h in K_i }$. Lemma 7 bounds its dimension by the sum of the squared type degrees, independently of their multiplicities. Lemma 57 supplies the finite constant
  $ C_20 = sup_(m gt.eq 1) sum_(tau in hat(S_m)) \( dim tau \)^(- 20) . $
  It follows that
  #[#set math.equation(numbering: n => "(11.6)")
   $ dim W_i lt.eq sum_(f lt.eq D^(1 \/ b)) f^2 lt.eq C_20 D^(22 \/ b) \, $ <l:tilted-orbit-rank>]
  where the sum counts irreducible types once, not their multiplicities.
  Because $W_i$ is $K_i$-invariant, $rho \( g \) W_i$ depends only on $g \|_(X_i)$. Let $E_i$ be the subset of injections on $X_i$ for which
  $ parallel "Proj"_(rho \( g \) W_i) z parallel gt.eq D^(- 1 \/ 8) \/ b . $
  Schur averaging gives uniform mean square projection length $dim W_i \/ D$. Markov’s inequality and (11.6) imply
  #[#set math.equation(numbering: n => "(11.7)")
   $ U_(X_i) \( E_i \) lt.eq C_20 b^2 D^(- 1 + 22 \/ b + 1 \/ 4) = C_20 b^2 D^(- 37 \/ 64) lt.eq C_20 b^2 D^(- 1 \/ 2) . $ <l:tilted-uniform-test>]
  For each endpoint on $A$, the coefficient threshold and (11.5) force at least one of these tests:
  $ D^(- 1 \/ 8) lt.eq \| chevron.l z \, rho \( g \) u chevron.r \| lt.eq sum_i parallel "Proj"_(rho \( g \) W_i) z parallel . $
  Thus, for this partition,
  #[#set math.equation(numbering: n => "(11.8)")
   $ sum_(i = 1)^b sigma_(X_i) \( E_i \) gt.eq 1 . $ <l:tilted-test-mass>]
  We have found complementary restrictions on which $sigma$ assigns substantial mass to events that are rare under the uniform law. To convert that fact to entropy, put $p_i = sigma_(X_i) \( E_i \)$ and $q_i = U_(X_i) \( E_i \)$. Data processing for the binary test gives
  $ D \( sigma_(X_i) parallel U_(X_i) \) gt.eq p_i log 1 / q_i - log 2 gt.eq 1 / 2 p_i log D - log \( 2 C_20 b^2 \) . $
  The first inequality follows by expanding binary relative entropy and using that binary Shannon entropy is at most $log 2$; its term $\( 1 - p_i \) log \( 1 \/ \( 1 - q_i \) \)$ is nonnegative. Empty tests have $p_i = q_i = 0$ and satisfy the displayed bound as well. The second inequality uses (11.7) and $0 lt.eq p_i lt.eq 1$.
  Average over $i$, using (11.8), and then over uniform ordered equal-block partitions. Each $X_i$ is uniform of size $n - n \/ b$, so
  $ bb(E)_(\| X \| = n - n \/ b) D \( sigma_X parallel U_X \) gt.eq frac(log D, 2 b) - log \( 2 C_20 b^2 \) . $
  Now apply (11.1) to this particular $sigma$. Together with (11.4), it gives
  $ log frac(1, bb(P) \( A \)) gt.eq frac(log D, 256) - log \( 2 C_20 b^2 \) - n^(- 2) . $
  This proves (11.2), for example with $C = 2 e C_20 b^2$.
  Finally the absolute coefficient is at most one. Split its expectation under $bb(P) \( thin dot.op divides cal(G) \)$ at $D^(- 1 \/ 8)$, and use (11.2) for the upper part. This proves (11.3) after taking the supremum over the unit vectors. All partitions and tests in the proof were chosen after $u \, z$ were fixed; the hypothesis covering every law on the common event is what permits the rare-event conditioning at the first step. ◻
]

== 12 Rare events and signed palettes <l:palettes>

An estimate for a typical partial permutation need not remain useful after conditioning on a very rare mapping event. The first result below explains how a single retained event resolves this difficulty. It converts a bound on the accumulated conditional errors, valid at every retained setting, into simultaneous bounds on many coset probabilities. We then choose the cosets by the representation being tested. Both steps are statements about finite probability spaces and permutation groups; no dynamics enter their proofs.

Let $n = 2 h$ and partition $\[ n \] = A union.sq B$, with $\| A \| = \| B \| = h$. A #emph[palette on $B$] is a partition $B = B_1 union.sq dots.h.c union.sq B_u$ into nonempty color classes. Its subgroup is

$ H = product_(i = 1)^u S_(B_i) lt.eq S_n \, $

acting identically on $A$. Put $l_i = \| B_i \|$, $p_i = l_i \/ h$, and $cal(H) \( p \) = - sum_i p_i log p_i$. We use the analogous definitions for palettes on $A$. A left coset $x H$ prescribes each image in $A$ separately and prescribes the image set of every color class in $B$.

=== 12.1 An information bound valid under rare conditioning <an-information-bound-valid-under-rare-conditioning>

Here is the precise reveal experiment. Let $\( Omega \, P \)$ be a finite probability space and $g : Omega arrow.r S_n$ an endpoint map. For each fixed ordering $o = \( c_1 \, dots.h \, c_n \)$ of the labels, let $Y_1^o \, dots.h \, Y_n^o$ be observations on $Omega$ such that $Y_j^o$ determines $g \( c_j \)$. These observations may contain more information than the endpoint. Write $cal(F)_r^o = sigma \( Y_1^o \, dots.h \, Y_r^o \)$. At a feasible history the previously observed endpoints leave exactly $m = n - r$ available sites. Suppose $Delta_r^o gt.eq 0$ is $cal(F)_r^o$-measurable and, for every subset $Q$ of these sites,

#[#set math.equation(numbering: n => "(12.1)")
 $ P { g \( c_(r + 1) \) in Q divides cal(F)_r^o } lt.eq frac(\| Q \|, n - r) + n Delta_r^o . $ <l:palette-reference-cap>]

All conditional statements concern histories of positive reference probability. Let $bb(E)_(A B)$ denote averaging over independent uniform orders within $A$ and $B$, with all labels of $A$ first; define $bb(E)_(B A)$ by reversing the two halves.

#thm([Lemma 12.1.])[
  (Information from a retained reveal experiment).  #emph[In the experiment just described, fix an integer $0 lt.eq v < h$ and an event $cal(G) subset.eq Omega$ of reference probability $z > 0$. Assume that (12.1) holds for both half-first order conventions and every $0 lt.eq r < n - v$. Suppose that every $omega in cal(G)$ satisfies 
#[#set math.equation(numbering: n => "(12.2)")
 $ bb(E)_(A B) sum_(r = 0)^(n - v - 1) Delta_r^o \( omega \) + bb(E)_(B A) sum_(r = 0)^(n - v - 1) Delta_r^o \( omega \) lt.eq a_n . $ <l:palette-retained-cap>]

 Let $mu$ be the law of $g$ under $P \( thin dot.op divides cal(G) \)$. For every palette on either half, its subgroup $H$, and every $x in S_n$, 
#[#set math.equation(numbering: n => "(12.3)")
 $ mu \( x H \) lt.eq frac(1, \[ S_n : H \]) exp { v cal(H) \( p \) + n^2 a_n - log z } . $ <l:palette-information-cap>]

 In particular, if $a_n lt.eq n^(- 6)$ and $z = 1 - o \( 1 \)$, the last two terms in the exponent are $o \( 1 \)$, uniformly over all palettes and cosets.]
] <l:palette-information>

#proof[
  The event $cal(G)$ and the retained endpoint law $mu$ are fixed before choosing the palette. Fix now a palette on $B$ and a coset $x H$, and put $E = cal(G) ∩ { g in x H }$. If $P \( E \) = 0$ the conclusion is immediate. Otherwise write $Q = P \( thin dot.op divides E \)$. The three laws are related by
  $ P \( E \) = z mu \( x H \) \, #h(2em) D \( Q bar.v.double P \) = - log P \( E \) . $
  Choose the reveal order independently of the setting, using the $A B$ convention under both $P$ and $Q$. Since $E$ does not involve the order, conditioning the setting on $E$ leaves this order uniformly distributed. For a fixed order, data processing followed by the entropy chain rule gives
  $ - log P \( E \) gt.eq sum_(r = 0)^(n - v - 1) bb(E)_Q D #scale(x: 120%, y: 120%)[\(] cal(L)_Q \( Y_(r + 1)^o divides cal(F)_r^o \) bar.v.double cal(L)_P \( Y_(r + 1)^o divides cal(F)_r^o \) #scale(x: 120%, y: 120%)[\)] . $
  For labels in $A$, membership in $x H$ prescribes a singleton target; for a label in $B_i$ it prescribes the target set $x B_i$. At a history that occurs under $Q$, let $a_r gt.eq 1$ be the number of unoccupied sites in this target. The next endpoint lies in that target with $Q$-probability one. For any probability $R$ supported on an event $F$ of positive reference probability, the identity $D \( R bar.v.double P' \) = D \( R bar.v.double P' \( thin dot.op divides F \) \) - log P' \( F \)$ shows that its entropy is at least $- log P' \( F \)$. Apply this observation to the next observation and then use (12.1). Since $m = n - r lt.eq n$,
  $ - log (a_r / m + n Delta_r^o) & = log \( m \/ a_r \) - log (1 + frac(n m Delta_r^o, a_r))\
 & gt.eq log \( m \/ a_r \) - n^2 Delta_r^o . $
  This lower bound is valid even when the displayed upper bound on the reference probability exceeds one. Averaging the chain rule over orders therefore yields
  #[#set math.equation(numbering: n => "(12.4)")
   $ - log P \( E \) gt.eq bb(E)_(A B) bb(E)_Q sum_(r = 0)^(n - v - 1) log \( \( n - r \) \/ a_r \) - n^2 a_n . $ <l:palette-rare-chain>]
  The error bound uses (12.2) pointwise on $E$. It does not use an average error estimate under $P$ after the change of law to $Q$.
  It remains to count the information lost by omitting the last $v$ labels. If all $n$ labels were revealed, the numerator counts would multiply to $n !$, while the target counts would multiply to $product_i l_i !$. The full logarithmic sum is consequently $log \[ S_n : H \]$, independently of the compatible observations. The last $v$ labels are in $B$. For $v = 0$ the missing contribution is zero. For $v > 0$, if their color counts are $t_1 \, dots.h \, t_u$, it is
  $ log frac(v !, product_i t_i !) lt.eq v cal(H) \( \( t_i \/ v \)_i \) . $
  The inequality follows because the multinomial probability of these counts under probabilities $t_i \/ v$ is at most one. The last $v$ labels form a uniform subset of $B$ under the order average, so $bb(E)_(A B) \( t_i \/ v \) = p_i$. Concavity of entropy gives expected missing contribution at most $v cal(H) \( p \)$. Insert this bound in (12.4), exponentiate, and use $mu \( x H \) = P \( E \) \/ z$. The $B A$ order gives the same result for palettes on $A$. Every error term is independent of the chosen palette and coset, which proves simultaneous uniformity. ◻
]

=== 12.2 Choosing a palette for a representation <choosing-a-palette-for-a-representation>

We next relate the entropy of a suitable palette to the dimension of a representation. We use the characteristic-zero branching rule [6] Theorem 9.2 and the hook-length formula [4] Theorem 4.53. The horizontal Pieri rule is the one-row case of the induction rule in [6] Section 16; its vertical form follows by transposition and sign twist [6] Theorem 6.7. Write $D_gamma$ for the dimension of the irreducible representation indexed by a partition $gamma$.

#thm([Lemma 12.2.])[
  (A dimension estimate in terms of the longest row or column).  #emph[There is an absolute $c_0 > 0$ such that, for all sufficiently large $b$, if $gamma tack.r b$, $L = max \( gamma_1 \, gamma'_1 \)$, and $k = b - L > 0$, then 
#[#set math.equation(numbering: n => "(12.5)")
 $ log D_gamma gt.eq cases(delim: "{", c_0 k log \( b \/ k \) \, & k lt.eq b \/ 2 \,, c_0 b \, & k > b \/ 2 .) $ <l:palette-degree-bound>]

 In particular $log D_gamma gt.eq c_1 k$ for an absolute $c_1 > 0$.]
] <l:palette-degree>

#proof[
  Transpose the diagram if necessary, so its first row has length $L$. Apply the first-row hook bound (6.5) with row length $L$, $k$ lower boxes, and total size $b$. The dimension of the lower diagram is at least one, so
  $ log D_gamma gt.eq log binom(b, L) - frac(k \( 1 + log L \), L) . $
  If $k lt.eq b \/ 2$, the correction is $O \( k log b \/ b \)$ and $binom(b, k) gt.eq \( b \/ k \)^k$, proving the first case. If $b \/ 10 lt.eq L < b \/ 2$, the binomial coefficient has logarithm at least $L log \( b \/ L \) gt.eq \( b \/ 10 \) log 2$, and the correction is $O \( log b \)$. If $L < b \/ 10$, every hook is at most $2 L < b \/ 5$, so $D_gamma gt.eq \( b \/ e \)^b \/ \( b \/ 5 \)^b = \( 5 \/ e \)^b$. These bounds prove the second case and the stated consequence. ◻
]

#thm([Lemma 12.3.])[
  (Signed palettes with controlled entropy).  #emph[There is an absolute $C_0 < oo$ such that, for every sufficiently large $h$ and every $beta tack.r h$, there are positive integers $l_1 \, dots.h \, l_u$ summing to $h$ and a product character $theta = theta_1 ⊗ dots.h.c ⊗ theta_u$ of $H = S_(l_1) times dots.h.c times S_(l_u)$, each $theta_i$ either trivial or sign, for which 
#[#set math.equation(numbering: n => "(12.6)")
 $ "Hom"_H \( theta \, V_beta \) eq.not 0 \, #h(2em) h cal(H) \( \( l_i \/ h \)_i \) lt.eq C_0 log D_beta . $ <l:signed-palette-bound>]

 The same character occurrence holds for every placement of the classes of these sizes on an $h$-element set.]
] <l:signed-palette>

#proof[
  Starting with $beta$, remove a first row or a first column of maximal length, and repeat on the remaining partition until it is empty. The successive lengths are the $l_i$. Assign a trivial character to a row removal and a sign character to a column removal. If a first row is removed, the remaining partition interlaces the original one: putting back its size is a horizontal-strip addition in the Pieri rule. Transposing gives a vertical-strip addition for a first column. Iterated Pieri, transitivity of induction, and Frobenius reciprocity give the character occurrence. Conjugation supplies every placement.
  Let $L = l_1$ and $k = h - L$. Every hook in a strip of length $l$ at the time of its removal is at most $2 l$, because $l$ is the longer of the current first row and first column. Its hook product is at most $\( 2 l \)^l lt.eq \( 2 e \)^l l !$. For the first strip use the sharper bound $L ! e^k$, obtained from $log \( 1 + x \) lt.eq x$ and the fact that the sum of the numbers of boxes below the strip is $k$. Remaining hooks are unchanged by each removal. Thus, if $M = h ! \/ product_i l_i !$, the hook formula yields
  $ log M lt.eq log D_beta + \( 1 + log \( 2 e \) \) k . $
  To compare this multinomial count with entropy, set $f \( j \) = j log j - log j !$, with $f \( 0 \) = 0$. Then $f \( j \) gt.eq 0$ and $0 lt.eq f \( j \) - f \( j - 1 \) lt.eq 1$. Consequently
  $ h cal(H) \( \( l_i \/ h \)_i \) - log M = f \( h \) - sum_i f \( l_i \) lt.eq f \( h \) - f \( L \) lt.eq k . $
  If $k > 0$, Lemma 42 absorbs this total $O \( k \)$ error into $C_0 log D_beta$. If $k = 0$, the representation is trivial or sign, and the one-color palette has entropy zero. ◻
]

=== 12.3 The transfer from both halves <the-transfer-from-both-halves>

Fix once and for all

#[#set math.equation(numbering: n => "(12.7)")
 $ 0 < delta < 1 / 4 \, #h(2em) 2 delta C_0 lt.eq 1 / 10 \, #h(2em) v = floor.l delta n floor.r . $ <l:palette-delta>]

The next theorem receives only coset caps. In particular, it can be applied to the output of Lemma 41 without referring again to its reveal experiment.

#thm([Theorem 12.4.])[
  (Signed-palette transfer).  #emph[Let $n$ tend to infinity through even integers. For each $n$, partition $\[ n \] = A union.sq B$ into equal halves and let $mu$ be a probability on $S_n$. Suppose that $epsilon_n arrow.r 0$ and that, for every palette on either half, every placement of its classes, its subgroup $H$, and every $x in S_n$, 
#[#set math.equation(numbering: n => "(12.8)")
 $ mu \( x H \) lt.eq \[ S_n : H \]^(- 1) exp { v cal(H) \( p \) + epsilon_n } . $ <l:palette-transfer-hyp>]

 Here $delta$ and $v$ satisfy (12.7). For all sufficiently large $n$, uniformly over $lambda in.not { \( n \) \, \( 1^n \) }$, 
#[#set math.equation(numbering: n => "(12.9)")
 $ parallel hat(mu) \( lambda \) parallel_(upright("HS"))^2 & lt.eq D_lambda^(- 1 \/ 3) \,\
parallel hat(mu) \( lambda \) parallel_(upright("op")) & lt.eq D_lambda^(- 1 \/ 6) . $ <l:palette-fourier-hs>]

 If in addition $\| hat(mu) \( upright("sgn") \) \| = o \( 1 \)$, then $parallel mu^(* 4) - U_(S_n) parallel_(upright("TV")) = o \( 1 \)$, and consequently $parallel mu^(* 30) - U_(S_n) parallel_(upright("TV")) = o \( 1 \)$ as well. Both conclusions also hold with $mu$ replaced in every factor by a probability $mu_0$ satisfying $parallel mu_0 - mu parallel_(upright("TV")) = o \( 1 \)$.]
] <l:palette-transfer>

#proof[
  Put $J = hat(mu) \( lambda \)$ and $D = D_lambda$, using a unitary model $rho_lambda$. We first bound $J$ on each half-isotypic component, including its multiplicities. Combining the halves will bound each joint component; we then absorb the number of joint types into a small power of $D$. For a type $beta$ of $S_B$, choose its signed palette from Lemma 43. Equations (12.7) and (12.8) give, for large $n$,
  #[#set math.equation(numbering: n => "(12.10)")
   $ mu \( x H \) lt.eq frac(2 D_beta^(1 \/ 10), \[ S_n : H \]) . $ <l:palette-selected-cap>]
  This holds for every conjugate of the chosen subgroup within $S_B$.
  Let $P_(H \, theta)$ be the orthogonal projection onto the $theta$-character space in the restriction to $H$. Define the signed mass $theta_H$ to equal $overline(theta \( h \)) \/ \| H \|$ on $H$ and zero elsewhere. Right convolution by $theta_H$ has Fourier matrix $J P_(H \, theta)$. On a coset $x H$ each resulting mass has absolute value at most $mu \( x H \) \/ \| H \|$. Hence
  $ \| S_n \| sum_(x in S_n) \| \( mu * theta_H \) \( x \) \|^2 lt.eq \[ S_n : H \] sum_(C in S_n \/ H) mu \( C \)^2 lt.eq 2 D_beta^(1 \/ 10) . $
  Plancherel, retaining the $lambda$ term, proves
  #[#set math.equation(numbering: n => "(12.11)")
   $ D parallel J P_(H \, theta) parallel_(upright("HS"))^2 lt.eq 2 D_beta^(1 \/ 10) . $ <l:palette-signed-hs>]
  Let $Pi_(B \, beta)$ denote the entire $beta$-isotypic projection. Average $P_(H \, theta)$ over conjugation by $S_B$. On the $beta$ carrier its rank is at least one, so Schur’s lemma makes this average at least $D_beta^(- 1) I$ on that carrier. The group algebra acts as the identity on its multiplicity space. The average is therefore at least $D_beta^(- 1) Pi_(B \, beta)$ in positive semidefinite order on the full representation. Tracing against $J^(*) J$ in (12.11) gives
  #[#set math.equation(numbering: n => "(12.12)")
   $ parallel J Pi_(B \, beta) parallel_(upright("HS"))^2 lt.eq frac(2 D_beta^(11 \/ 10), D) . $ <l:palette-isotype-hs>]
  The identical estimate holds for a type $alpha$ of $S_A$.
  Every constituent of the product of the two halves has a small carrier on at least one side. Indeed, the commuting projections $Pi_(A \, alpha) Pi_(B \, beta)$ decompose the identity orthogonally, and every nonzero such component has $D_alpha D_beta lt.eq D$. Use (12.12) for the smaller degree to obtain
  #[#set math.equation(numbering: n => "(12.13)")
   $ parallel J Pi_(A \, alpha) Pi_(B \, beta) parallel_(upright("HS"))^2 lt.eq 2 D^(- 9 \/ 20) . $ <l:palette-pair-hs>]
  We verify that the number of type pairs costs only a vanishing power of $D$. Let $L = max \( lambda_1 \, lambda'_1 \)$ and $k = n - L > 0$. Branching forces every half-type diagram to be contained in $lambda$. If the longest line is a column, transpose $lambda$ and every contained half-type diagram for this count. Containment and dimensions are preserved, and each resulting tail beyond the first row has at most $k$ boxes. The number of choices for either half-type is at most $B_k = sum_(j = 0)^k p \( j \)$, where $p \( j \)$ is the number of partitions of $j$. The partition bound (6.1) gives
  $ B_k lt.eq \( k + 1 \) e^(3 sqrt(k)) = e^(O \( sqrt(k) \)) . $
  Lemma 42 implies $log B_k \/ log D arrow.r 0$ uniformly: if $k lt.eq sqrt(n)$, its denominator is at least $\( c_0 \/ 2 \) k log n$, and if $k > sqrt(n)$, it is at least $c_1 k$. Thus $B_k^2 = D^(o \( 1 \))$ uniformly over the nontrivial, nonsign diagrams. Orthogonality of the domain projections in (12.13) now yields
  $ parallel J parallel_(upright("op"))^2 lt.eq parallel J parallel_(upright("HS"))^2 lt.eq 2 B_k^2 D^(- 9 \/ 20) lt.eq D^(- 1 \/ 3) $
  for sufficiently large $n$. This proves both (12.9) and (12.9).
  For four factors, Hilbert–Schmidt submultiplicativity, Plancherel and Cauchy–Schwarz give
  $ 4 parallel mu^(* 4) - U_(S_n) parallel_(upright("TV"))^2 lt.eq \| hat(mu) \( upright("sgn") \) \|^8 + sum_(lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(1 - 4 \/ 3) = o \( 1 \) \, $
  since the nonlinear sum is $Z_(1 \/ 3) \( n \) arrow.r 0$ by Theorem 22. Replacing the four factors by $mu_0$ costs at most $4 parallel mu_0 - mu parallel_(upright("TV")) = o \( 1 \)$. Convolution contracts total variation and preserves uniform measure, so each four-factor conclusion implies its thirty-factor counterpart.
  There is also a direct thirty-factor completion using only the operator bound (12.9). It gives
  $ 4 parallel mu^(* 30) - U_(S_n) parallel_(upright("TV"))^2 lt.eq \| hat(mu) \( upright("sgn") \) \|^60 + sum_(lambda in.not { \( n \) \, \( 1^n \) }) D_lambda^(- 8) . $
  The sum tends to zero. To see this directly, group the diagrams by $k = n - max \( lambda_1 \, lambda'_1 \)$. There are at most $2 p \( k \)$ diagrams in each group. Lemma 42 gives the summable majorant $2 e^(3 sqrt(k) - 8 c_1 k)$, while each fixed $k > 0$ has $D_lambda arrow.r oo$ as $n arrow.r oo$. Dominated convergence applies. Replacing the thirty factors one at a time changes total variation by at most $30 parallel mu_0 - mu parallel_(upright("TV"))$. ◻
]

The order of choices is now visible. First choose the absolute $C_0$ in Lemma 43, then $delta$ in (12.7). A reveal construction supplies the reference conditional bound (12.1), together with a common event of mass $1 - o \( 1 \)$ on which (12.2) holds with $a_n lt.eq n^(- 6)$ down to $v$ unrevealed labels. Lemma 41 supplies all the caps required by Theorem 44 with $epsilon_n = n^(- 4) - log z$. The sign expectation remains a separate scalar input.

== 13 Entropy clipping and large representation dimensions <l:replica-section>

Small total variation error is one way to obtain a useful coset cap. A weaker entropy estimate can also suffice when only representations above a prescribed dimension threshold need to be controlled. The cutoff below preserves the original, unnormalized retained measure. Its loss of mass is separated from its Fourier estimate.

For probabilities $p \, u$ on a finite set, with $u$ positive, write

$ D \( p bar.v.double u \) = sum_x p \( x \) log frac(p \( x \), u \( x \)) \; $

zero summands have value zero and logarithms are natural. For $G = S_n$ and $H lt.eq G$, write $w_H \( g H \)$ for the mass of the left coset $g H$ under a probability $w$ on $G$, and $U_(G \/ H)$ for the uniform law on left cosets. These are the cosets that record the images of a list whose pointwise stabilizer is $H$.

#thm([Theorem 13.1.])[
  (Entropy clipping and isotypic transfer).  #emph[Partition ${ 1 \, dots.h \, n }$ into $q gt.eq 1$ nonempty blocks, and let $H_i$ be the subgroup supported on block $i$. Suppose a probability $w$ on $S_n$ satisfies 
#[#set math.equation(numbering: n => "(13.1)")
 $ sum_(i = 1)^q D \( w_(H_i) bar.v.double U_(G \/ H_i) \) lt.eq K . $ <l:replica-entropy-assumption>]

 For every $t > 0$ there is a subprobability $v lt.eq w$, of mass $m$, such that 
#[#set math.equation(numbering: n => "(13.2)")
 $ 1 - m & lt.eq frac(K + q \/ e, t) \,\
v \( g H_i \) & lt.eq e^t frac(\| H_i \|, \| G \|) quad \( g in G \, med 1 lt.eq i lt.eq q \) \,\
sum_(h in H_i) \( caron(v) * v \) \( h \) & lt.eq e^t frac(\| H_i \|, \| G \|) \,\
parallel hat(v) \( lambda \) parallel_(upright("HS"))^2 & lt.eq q C_u e^t D_lambda^(- 1 + \( u + 2 \) \/ q) quad \( lambda tack.r n \, u > 0 \) . $ <l:replica-mass>]

 Here $caron(v) \( g \) = v \( g^(- 1) \)$, $C_u$ is the constant in Theorem 22, the Fourier transform is the mass transform $hat(v) \( lambda \) = sum_g v \( g \) rho_lambda \( g \)$, and the Hilbert–Schmidt norm is unnormalized.]
] <l:replica-clipping>

#proof[
  For a density $p$ relative to a probability $u$, the negative part of the logarithm has expectation at most $1 \/ e$ under $p u$, since $p max \( - log p \, 0 \) lt.eq 1 \/ e$. Consequently
  $ bb(E)_(p u) \( log p \)_(+) lt.eq D \( p u bar.v.double u \) + 1 \/ e . $
  For each $i$ let $p_i$ be the density of $w_(H_i)$ relative to $U_(G \/ H_i)$. Restrict $w$ to those $g$ for which $p_i \( g H_i \) lt.eq e^t$ for every $i$, and call the result $v$. Markov’s inequality and a union bound prove (13.2); the restriction proves (13.2). Zero-density cosets have zero $w$-mass and create no logarithmic exception.
  The convolution $caron(v) * v$ is the law, with its subprobability mass, of $g_1^(- 1) g_2$. Membership in $H_i$ means that $g_1 \, g_2$ belong to the same left coset. Thus
  $ sum_(h in H_i) \( caron(v) * v \) \( h \) = sum_(g H_i) v \( g H_i \)^2 lt.eq e^t frac(\| H_i \|, \| G \|) sum_(g H_i) v \( g H_i \) lt.eq e^t frac(\| H_i \|, \| G \|) . $
  We spell out the isotypic step to show exactly what the collision cap controls. Put $E_lambda = hat(v) \( lambda \)^(*) hat(v) \( lambda \)$. For an irreducible $tau$ of $H_i$ of dimension $d_tau$ and character $chi_tau$, let $P_(lambda \; tau)^(H_i)$ be the full $tau$-isotypic projection in $rho_lambda \|_(H_i)$, including all multiplicity copies. Fourier inversion and the central projection formula give
  #[#set math.equation(numbering: n => "(13.3)")
   $ sum_(h in H_i) \( caron(v) * v \) \( h \) chi_tau \( h \) = frac(\| H_i \|, \| G \| d_tau) sum_(lambda tack.r n) D_lambda "tr" \( E_lambda P_(lambda \; tau)^(H_i) \) . $ <l:replica-isotypic-identity>]
  Indeed $sum_(h in H_i) chi_tau \( h \) rho_lambda \( h^(- 1) \) = \( \| H_i \| \/ d_tau \) P_(lambda \; tau)^(H_i)$. Every trace on the right is nonnegative, since $E_lambda$ and $P_(lambda \; tau)^(H_i)$ are positive. Since $\| chi_tau \( h \) \| lt.eq d_tau$, (13.2) yields
  #[#set math.equation(numbering: n => "(13.4)")
   $ "tr" \( E_lambda P_(lambda \; tau)^(H_i) \) lt.eq e^t d_tau^2 / D_lambda . $ <l:replica-one-isotype>]
  This is the collision form of Lemma 10.
  The block subgroups form a direct product. Every irreducible constituent of its restriction has factor dimensions whose product is at most $D_lambda$. At least one factor dimension is therefore at most $D_lambda^(1 \/ q)$. The commuting isotypic projections satisfy
  $ I lt.eq sum_(i = 1)^q med sum_(tau : d_tau lt.eq D_lambda^(1 \/ q)) P_(lambda \; tau)^(H_i) . $
  There are at most $C_u D_lambda^(u \/ q)$ such types in each subgroup: each contributes at least $D_lambda^(- u \/ q)$ to its inverse-$u$ degree sum. Taking traces against $E_lambda$ and using (13.4) proves (13.2). ◻
]

#thm([Corollary 13.2.])[
  (Selecting complementary lists by averaging).  #emph[Let $q$ divide $n$, put $r = n \/ q$, and suppose the image law $w_I$ of a uniformly chosen ordered list $I$ of $n - r$ distinct inputs satisfies 
$ bb(E)_I D \( w_I bar.v.double U_I \) lt.eq K_0 \, $

 where $U_I$ is uniform on ordered distinct output lists of that length. There is a partition into $q$ blocks of size $r$ for which (13.1) holds with $K = q K_0$.]
] <l:replica-partition-selection>

#proof[
  Choose the equal partition uniformly. Each block complement is uniform among sets of size $n - r$. Entropy of an image list is unchanged by reordering its coordinates. Therefore the expected sum of the $q$ complement entropies is at most $q K_0$; one deterministic partition has sum no greater than that expectation. Agreement on the complement is exactly membership in the same left coset of its block subgroup. ◻
]

#thm([Corollary 13.3.])[
  (The logarithmic cutoff with 256 blocks).  #emph[Let $n = 2^d$ and suppose, for each sufficiently large integer $d$, that a probability $w$ has an equal partition into $q = 256$ blocks with total complement entropy $O \( d^4 \)$. There is $v lt.eq w$ of mass $1 - O \( d^(- 2) \)$ such that 
#[#set math.equation(numbering: n => "(13.5)")
 $ parallel hat(v) \( lambda \) parallel_(upright("HS"))^2 lt.eq 256 C_32 e^(d^6) D_lambda^(- 1 + 34 \/ 256) . $ <l:replica-34-exponent>]

 In particular, whenever $log D_lambda > d^8$, this is at most $D_lambda^(- 1 \/ 2)$ for all sufficiently large $d$, uniformly in $lambda$.]
] <l:replica-large-dimension>

#proof[
  Apply Theorem 45 with $t = d^6$ and $u = 32$. The loss bound is $O \( d^4 \) \/ d^6 = O \( d^(- 2) \)$. The logarithm of the prefactor is $d^6 + log \( 256 C_32 \)$, while
  $ (1 / 2 - 34 / 256) log D_lambda > (1 / 2 - 34 / 256) d^8 . $
  The latter eventually exceeds the former, proving the final bound. ◻
]

The hypotheses here concern only the entropy of a group law. Controlling dimensions below the cutoff requires an additional input on that law; the clipping theorem itself makes no assertion about those representations.

== 14 Weak entropy and an independent sparse estimate <l:forests>

A complementary marginal may have relative entropy from uniform of order $\( log n \)^4$ and still be far from uniform in total variation. Such information is nevertheless sufficient for representations whose dimensions are large enough to absorb a growing coset cap. This section proves that assertion and combines it with an independent Fourier estimate for representations with a long first row. The second law must also annihilate every representation whose diagram has more than $n \/ 2$ rows. These two Fourier properties are explicit hypotheses; the construction of the second law plays no role in the transfer.

Throughout this section, $16$ divides $n$ and $\[ n \] = B_1 union.sq dots.h.c union.sq B_16$ is a fixed partition into equal blocks. Let $H_j = S_(B_j)$, acting identically off $B_j$. For a probability $mu$ on $S_n$, let $mu_j$ be its pushforward to the cosets $S_n \/ H_j$, and let $U_j$ be uniform on this quotient. The coset $x H_j$ specifies exactly the images under $x$ of all labels outside $B_j$.

=== 14.1 Clipping a weak entropy bound <clipping-a-weak-entropy-bound>

#thm([Lemma 14.1.])[
  (One retained law for sixteen entropy bounds).  #emph[Suppose 
#[#set math.equation(numbering: n => "(14.1)")
 $ E_n := sum_(j = 1)^16 D \( mu_j bar.v.double U_j \) lt.eq C \( 1 + log n \)^4 $ <l:forest-entropy-hyp>]

 for a constant $C$ independent of $n$. Set $b_n = n^(1 \/ 50)$ and $eta_n = \( E_n + 16 \/ e \) \/ b_n$. For all sufficiently large $n$, there is an event $cal(G) subset.eq S_n$ with $z := mu \( cal(G) \) gt.eq 1 - eta_n > 0$ such that $nu = mu \( thin dot.op divides cal(G) \)$ satisfies 
#[#set math.equation(numbering: n => "(14.2)")
 $ parallel nu - mu parallel_(upright("TV")) = 1 - z lt.eq eta_n = o \( 1 \) \, #h(2em) nu \( x H_j \) lt.eq frac(M_n, \[ S_n : H_j \]) \, quad M_n = 2 exp \( n^(1 \/ 50) \) . $ <l:forest-caps>]

 The cap holds for every $x in S_n$ and every $j$ under this same law $nu$.]
] <l:forest-clipping>

#proof[
  Apply the clipping construction of Theorem 45 with $q = 16$, $w = mu$, $K = E_n$, and $t = b_n$. It restricts $mu$ to the event $cal(G)$ on which all sixteen original quotient densities are at most $e^(b_n)$. The retained subprobability has mass $z gt.eq 1 - eta_n$ and satisfies every coset cap with constant $e^(b_n)$. Here $eta_n = o \( 1 \)$ by (14.1), so eventually $z gt.eq 1 \/ 2$. Normalizing this one retained measure increases all caps by the same factor $z^(- 1) lt.eq 2$, giving (14.2). Since the construction is an event restriction, its normalization is exactly $mu \( thin dot.op divides cal(G) \)$, at total-variation distance $1 - z$ from $mu$. ◻
]

=== 14.2 The representation range controlled by these caps <the-representation-range-controlled-by-these-caps>

Write $D_lambda$ for the dimension of the irreducible representation $V_lambda$ of $S_n$, and put $k = n - lambda_1$. Here $k$ measures the number of boxes below the first row, without transposing the diagram. The restriction on the number of rows in the next lemma prevents a shape with a long first column from having small dimension while $k$ is large.

#thm([Lemma 14.2.])[
  (Dimension with at most $n \/ 2$ rows).  #emph[There is an absolute $c > 0$ such that, for all sufficiently large $n$, every $lambda tack.r n$ with $lambda'_1 lt.eq n \/ 2$ and $k > 0$ satisfies 
#[#set math.equation(numbering: n => "(14.3)")
 $ log D_lambda gt.eq c k . $ <l:forest-degree-bound>]

]
] <l:forest-degree>

#proof[
  If both the first row and the first column are shorter than $n \/ 8$, every hook has length less than $n \/ 4$. The hook formula then gives $D_lambda gt.eq \( 4 \/ e \)^n$, which suffices. Otherwise transpose if necessary so the first row has length $m = max \( lambda_1 \, lambda'_1 \) gt.eq n \/ 8$. The number $n - m$ of remaining boxes is at least $k \/ 2$: it is $k$ without transposition, and after transposition the assumed bound on the number of rows gives $n - m gt.eq n \/ 2 gt.eq k \/ 2$.
  Retain this first row and a Young subdiagram of $s = min \( n - m \, floor.l m \/ 2 floor.r \)$ boxes below it. For large $n$, $s gt.eq k \/ 17$. To construct standard tableaux of the retained diagram, put $1 \, dots.h \, s$ in the first $s$ boxes of its top row. Choose any $s$ of the remaining $m$ labels for the lower diagram, placed in a fixed standard order; fill the remaining top row in increasing order. Every column of the lower diagram is under one of the first $s$ top boxes, so these are valid tableaux. There are $binom(m, s) gt.eq \( m \/ s \)^s gt.eq 2^s$ choices, and each extends to the full diagram by successively adding the omitted boxes in a Young order. Thus $D_lambda gt.eq 2^s$, proving the lemma. ◻
]

#thm([Proposition 14.3.])[
  (Sixteen groups in the large-degree range).  #emph[Let $nu$ be any probability on $S_n$ satisfying the sixteen coset caps in (14.2). Uniformly over all partitions with 
$ k = n - lambda_1 > n^(1 \/ 20) \, #h(2em) lambda'_1 lt.eq n \/ 2 \, $

 one has, for sufficiently large $n$, 
#[#set math.equation(numbering: n => "(14.4)")
 $ parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 1 \/ 3) . $ <l:forest-bulk-bound>]

]
] <l:forest-bulk>

#proof[
  Put $D = D_lambda$ and restrict $V_lambda$ to $H_1 times dots.h.c times H_16$. Its irreducible types are tensor products of sixteen carriers, with arbitrary multiplicities. For an occurring tensor type, the product of its carrier dimensions is at most $D$, so at least one carrier has dimension at most $D^(1 \/ 16)$. Assign the whole isotypic component of that type to one such index $j$. This decomposes every unit vector $v$ into an orthogonal sum $v = sum_(j = 1)^16 v_j$, where $v_j$ is supported only on $H_j$-types of dimension at most $D^(1 \/ 16)$.
  Branching shows that each $H_j$-type diagram is a subdiagram of $lambda$; its tail below its first row has at most $k$ boxes. Let $p \( i \)$ count the partitions of $i$, with $p \( 0 \) = 1$. There are at most
  $ B_k = sum_(i = 0)^k p \( i \) \, #h(2em) log B_k = O \( sqrt(k) log \( k + 1 \) \) \, $
  such types, by the elementary multiplicity-and-list count in (6.1). Its sharper exponential bound also suffices.
  Let $W_j$ be the span of the $H_j$-orbit of $v_j$. For one type of degree $a$, collect all equivalent copies as $V_a ⊗ cal(M)_a$. The orbit of the component of $v_j$ lies in the image of
  $ "End" \( V_a \) arrow.r V_a ⊗ cal(M)_a \, #h(2em) T mapsto \( T ⊗ I \) v_j . $
  Its dimension is at most $a^2$, regardless of the multiplicity. Consequently
  #[#set math.equation(numbering: n => "(14.5)")
   $ dim W_j lt.eq B_k D^(1 \/ 8) . $ <l:forest-orbit-span>]
  This is the point at which grouping equivalent copies is essential: counting each copy separately would lose the degree saving.
  We now use the caps to average these small orbit spaces over the full group. Since $W_j$ is $H_j$-invariant, the space $rho_lambda \( x \) W_j$ depends only on $x H_j$. Its projection, averaged uniformly over the group, is $\( dim W_j \/ D \) I$ by Schur’s lemma and the trace. For a unit vector $w$, Cauchy–Schwarz and the coset cap therefore give
  $ \| chevron.l w \, hat(nu) \( lambda \) v_j chevron.r \| & lt.eq parallel v_j parallel (bb(E)_(x tilde.op nu) parallel P_(rho_lambda \( x \) W_j) w parallel^2)^(1 \/ 2)\
 & lt.eq parallel v_j parallel sqrt(M_n B_k D^(- 7 \/ 8)) . $
  Because $sum_j parallel v_j parallel lt.eq 4$, summing yields the quantitative bound
  #[#set math.equation(numbering: n => "(14.6)")
   $ parallel hat(nu) \( lambda \) parallel_(upright("op")) lt.eq 4 sqrt(M_n B_k) thin D^(- 7 \/ 16) . $ <l:forest-unabsorbed>]
  It remains to absorb the growing cap and the type count. Lemma 49 gives $log D gt.eq c k$, whereas $log M_n = O \( n^(1 \/ 50) \)$ and $log B_k = O \( sqrt(k) log \( k + 1 \) \)$. For $k > n^(1 \/ 20)$, both of the latter quantities are $o \( k \)$ uniformly. Thus, for large $n$, $log \( 16 M_n B_k \) lt.eq \( 5 \/ 24 \) log D$. Squaring (14.6) and using this inequality gives $16 M_n B_k D^(- 7 \/ 8) lt.eq D^(- 2 \/ 3)$, as required. ◻
]

=== 14.3 Combining the large and small degrees <combining-the-large-and-small-degrees>

The preceding proposition leaves two classes untreated: diagrams with more than $n \/ 2$ rows, and diagrams with at most $n^(1 \/ 20)$ boxes below the first row. The following theorem states exactly what a second law must provide on those classes.

#thm([Theorem 14.4.])[
  (Entropy and sparse-degree hybrid).  #emph[Let $n arrow.r oo$ through multiples of $16$. For each $n$, let $mu$ and $K$ be probabilities on $S_n$. Suppose a fixed equal sixteen-block partition satisfies (14.1) for $mu$. Suppose also that $K$ satisfies 
#[#set math.equation(numbering: n => "(14.7)")
 $ parallel hat(K) \( lambda \) parallel_(upright("op")) & lt.eq n^(- k \/ 10) &  & (1 lt.eq k = n - lambda_1 lt.eq n^(1 \/ 20)) \,\
hat(K) \( lambda \) & = 0 &  & (lambda'_1 > n \/ 2) . $ <l:forest-sparse-hyp>]

 Then the retained probability $nu$ from Lemma 48 satisfies 
#[#set math.equation(numbering: n => "(14.8)")
 $ parallel nu^(* 12) * K^(* 40) - U_(S_n) parallel_(upright("TV")) = o \( 1 \) \, #h(2em) parallel mu^(* 12) * K^(* 40) - U_(S_n) parallel_(upright("TV")) = o \( 1 \) . $ <l:forest-hybrid-conclusion>]

 All factors in these convolutions are independent. There is no assumed identity between $K$ and a convolution root or power of $mu$.]
] <l:forest-hybrid>

#proof[
  Put $sigma = nu^(* 12) * K^(* 40)$. The Fourier matrices multiply in this order. Each factor is a contraction, since it is an average of unitary matrices. For $lambda'_1 lt.eq n \/ 2$ and $k > n^(1 \/ 20)$, Proposition 50 gives $parallel hat(sigma) \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 4)$. For more than $n \/ 2$ rows, (14.7) gives zero. For $1 lt.eq k lt.eq n^(1 \/ 20)$, (14.7) gives $parallel hat(sigma) \( lambda \) parallel_(upright("op")) lt.eq n^(- 4 k)$. These statements use submultiplicativity and do not require normality of any Fourier matrix.
  Plancherel bounds four times the squared total-variation distance by $sum_(lambda eq.not \( n \)) D_lambda^2 parallel hat(sigma) \( lambda \) parallel_(upright("op"))^2$. For each fixed $k$, there are at most $p \( k \)$ diagrams with $n - lambda_1 = k$, since the boxes below the first row form a partition of $k$. By Lemma 49, the contribution from the large-degree range is at most
  $ sum_(k > n^(1 \/ 20)) p \( k \) e^(- 6 c k) = o \( 1 \) . $
  For the small-degree range, branching shows that $V_lambda$ occurs in the permutation representation on ordered distinct $k$-tuples: its restriction to $S_(n - k)$ contains the trivial representation because its first row has length $n - k$. Thus $D_lambda lt.eq \( n \)_k lt.eq n^k$, and that contribution is at most
  $ sum_(1 lt.eq k lt.eq n^(1 \/ 20)) p \( k \) n^(2 k) n^(- 8 k) lt.eq sum_(k gt.eq 1) e^(3 sqrt(k)) n^(- 6 k) = o \( 1 \) . $
  This also explains why no separate sign hypothesis is needed here: the sign diagram has more than $n \/ 2$ rows and is annihilated by $K$. The first assertion follows. Convolution contracts total variation, so replacing twelve factors changes the distance by at most $12 parallel mu - nu parallel_(upright("TV")) = o \( 1 \)$, proving the second. ◻
]

== 15 Signed tabloids and conditional products <l:sec:tabloid>

Information about the images of almost all positions can control a representation through a larger space with a particularly simple basis. In a signed tabloid representation, each permutation permutes the basis vectors and changes some signs. A cap on tuple probabilities therefore becomes a cap on matrix entries. We construct such a space containing each irreducible, with dimension bounded by a fixed power of the irreducible dimension. This gives a normalized Hilbert–Schmidt bound. For two half-permutations which are independent after conditioning on an environment, a second averaging step converts that bound into an operator-norm estimate on the full symmetric group.

For a finite set $E$, write $S_E$ for its permutation group and $U_E$ for uniform measure on that group. An ordering of any subset $I subset.eq E$ is fixed when we write $g \|_I$ or $g^(- 1) \|_I$ as a tuple. The uniform distribution on the possible tuples is independent of this choice of ordering. A subprobability is a nonnegative measure of total mass at most one. For a unitary representation $rho_lambda$ of dimension $D_lambda$, our Fourier convention is

$ hat(nu) \( lambda \) = sum_g nu \( g \) rho_lambda \( g \) \, #h(2em) parallel B parallel_(upright("HS"))^2 = "Tr" \( B^(*) B \) . $

Thus the Hilbert–Schmidt norm uses the ordinary, unnormalized trace. Composition $y x$ applies $x$ first, and convolution has this same order.

#thm([Theorem 15.1.])[
  (Conditional-product transfer).  #emph[Put $C_0 = 2 \, 000 \, 000$, and fix an integer $L gt.eq 2 C_0$. Let $V = A union.sq C$, where $\| A \| = \| C \| = h$ and $L$ divides $h$. Partition each half into $L$ buffers of size $h \/ L$, and put $H = S_A times S_C subset.eq S_V$. Let $xi$ be a subprobability on $S_V$ such that, for $J = A \, C$ and every ordered injection $upright(bold(v)) : J arrow.r V$, 
#[#set math.equation(numbering: n => "(15.1)")
 $ xi { x : x^(- 1) \|_J = upright(bold(v)) } lt.eq 2 U_V { x : x^(- 1) \|_J = upright(bold(v)) } . $ <l:tabloid-inverse-caps>]

 Let $Z$ have any probability distribution. Measurably in $z$, let $t_z in S_V$ and let $nu_A^z \, nu_C^z$ be subprobabilities on $S_A \, S_C$, respectively. Suppose that for almost every $z$, each $J = A \, C$, each of its buffers $B$, and every ordered injection $upright(bold(w)) : J \\ B arrow.r J$, 
#[#set math.equation(numbering: n => "(15.2)")
 $ nu_J^z { y : y \|_(J \\ B) = upright(bold(w)) } lt.eq 2 U_J { y : y \|_(J \\ B) = upright(bold(w)) } . $ <l:tabloid-factor-caps>]

 Regard the product $nu_A^z ⊗ nu_C^z$ as a measure on $H$ and set 
$ omega = bb(E)_Z #scale(x: 120%, y: 120%)[\[] delta_(t_Z) * \( nu_A^Z ⊗ nu_C^Z \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) theta = omega * xi . $

 Then, for all sufficiently large $h$, every irreducible representation of $S_V$ with $D_lambda > 1$ satisfies 
#[#set math.equation(numbering: n => "(15.3)")
 $ parallel hat(theta) \( lambda \) parallel_(upright("op")) lt.eq K_0 D_lambda^(- 1 \/ 40) \, #h(2em) K_0 = sqrt(22) . $ <l:tabloid-product-bound>]

 The threshold on $h$ and the constant $K_0$ are independent of the environment, the transporters and all the measures.]
] <l:tabloid-product>

The product in the definition of $omega$ is part of the hypothesis: after fixing $z$, the two factors are separate subprobabilities. The theorem allows their laws to depend arbitrarily on $z$, while the convolution with $xi$ uses the same measure for every environment. The first measure controls inverse images of whole halves; the conditional factors control images of buffer complements. The proof below uses these two orientations at different steps.

=== 15.1 A signed tabloid containing each irreducible <a-signed-tabloid-containing-each-irreducible>

For positive part sizes $s_1 \, dots.h \, s_r$ summing to $m$, choose on each factor of $S_(s_1) times dots.h.c times S_(s_r)$ either its trivial or its sign representation. Inducing their tensor product to $S_m$ gives a signed tabloid representation. It has an orthonormal basis indexed by ordered set partitions $\( T_1 \, dots.h \, T_r \)$ of ${ 1 \, dots.h \, m }$ with $\| T_i \| = s_i$, and each group element acts by a signed permutation matrix. Its dimension is

$ M = frac(m !, product_i s_i !) . $

Tensoring the whole representation with sign preserves this basis property and interchanges the trivial and sign choices on all factors. We use the usual tableau description of irreducibles, the hook-length formula and the Pieri rule; see [13,4].

#thm([Lemma 15.2.])[
  (Polynomial-size signed tabloid embedding).  #emph[For every $m gt.eq 1$ and every partition $lambda tack.r m$, the irreducible representation $V_lambda$ occurs in a signed tabloid representation of dimension $M$ with 
$ M lt.eq D_lambda^(C_0) \, #h(2em) C_0 = 2 \, 000 \, 000 . $

]
] <l:tabloid-embedding>

#proof[
  The subgroup constructed in Lemma 25 is a product of symmetric groups on disjoint assigned row or column sets. Those sets partition the $m$ labels, so after omitting empty sets it is conjugate to $J = S_(s_1) times dots.h.c times S_(s_r)$. The occurring character $chi$ is trivial or sign on each factor. The full-group and trivial-subgroup choices in that lemma have the same form.
  Frobenius reciprocity now places $V_lambda$ in $"Ind"_J^(S_m) chi$. Its coset basis is indexed by the ordered set partitions of sizes $s_1 \, dots.h \, s_r$, and each group element permutes this basis with signs because $chi$ takes values in ${ 1 \, - 1 }$. It is therefore a signed tabloid representation, with
  $ M = \[ S_m : J \] lt.eq D_lambda^1024 lt.eq D_lambda^(C_0) . $
  ◻
]

Appendix 17 gives an independent construction from diagonal arms and legs, together with a degree-sum proof using those same part sizes. The tuple estimate below needs only the signed basis and the polynomial dimension bound just proved.

=== 15.2 Tuple caps give a normalized Hilbert–Schmidt bound <tuple-caps-give-a-normalized-hilbertschmidt-bound>

#thm([Lemma 15.3.])[
  (Buffer-complement estimate).  #emph[Let $E$ have $m$ elements, partitioned into $L$ buffers, and let $nu$ be a subprobability on $S_E$. Suppose that for every buffer $B$, the marginal of $nu$ on the ordered image tuple of $E \\ B$ is pointwise at most twice its uniform marginal. If $L gt.eq 2 C_0$, then for every irreducible $gamma$ of $S_E$, 
#[#set math.equation(numbering: n => "(15.4)")
 $ frac(parallel hat(nu) \( gamma \) parallel_(upright("HS"))^2, D_gamma) lt.eq min { 1 \, 2 D_gamma^(- 1 \/ 2) } . $ <l:tabloid-normalized-hs>]

]
] <l:tabloid-hs>

#proof[
  Fix two tabloids of part sizes $s_1 \, dots.h \, s_r$, and let $E_0$ be the event that a permutation takes the first to the second. For buffer $B_z$, let $s_i^z$ count the elements of the first tabloid’s part $i$ lying in $B_z$, and set
  $ M = frac(m !, product_i s_i !) \, #h(2em) M_z = frac(\| B_z \| !, product_i s_i^z !) . $
  Relax $E_0$ by requiring the correct target part only for positions outside $B_z$. This relaxed event is determined by the corresponding image tuple. Conditional on any successful outside assignment, the unassigned target parts have sizes $s_i^z$, so a uniform completion succeeds with probability $1 \/ M_z$. Since $U_E \( E_0 \) = 1 \/ M$, the relaxed event has uniform probability $M_z \/ M$. Its probability under $nu$, and hence $nu \( E_0 \)$, is at most $2 M_z \/ M$.
  The product $product_z M_z$ counts the ways to assign the part names inside the buffers with these fixed counts; all such assignments are among the $M$ unrestricted assignments with totals $s_i$. Thus $product_z M_z lt.eq M$, and some buffer has $M_z lt.eq M^(1 \/ L)$. We have proved the uniform entry bound
  $ nu \( E_0 \) lt.eq 2 M^(- 1 + 1 \/ L) . $
  In the signed tabloid representation, each absolute entry of the averaged matrix is bounded by this probability. Each column has absolute sum at most $nu \( S_E \) lt.eq 1$, since every group element acts by a signed permutation matrix. Its squared Hilbert–Schmidt norm is consequently at most $2 M^(1 \/ L)$.
  Choose the signed tabloid containing $gamma$ from Lemma 53. Orthogonal decomposition into irreducibles shows that its squared Hilbert–Schmidt norm bounds the contribution of any one copy of $gamma$. Hence
  $ frac(parallel hat(nu) \( gamma \) parallel_(upright("HS"))^2, D_gamma) lt.eq 2 D_gamma^(C_0 \/ L - 1) lt.eq 2 D_gamma^(- 1 \/ 2) . $
  The bound by one follows separately because the average of unitaries against a subprobability is a contraction. ◻
]

We also need to retain the multiplicity in restriction to two halves. The following elementary consequence of the Littlewood–Richardson rule is stronger than a count of the occurring types alone.

#thm([Lemma 15.4.])[
  (Two-factor multiplicity bound).  #emph[For $lambda tack.r 2 h$ and $alpha \, beta tack.r h$, let $c_(alpha beta)^lambda$ be the multiplicity of $V_alpha ⊗ V_beta$ in the restriction of $V_lambda$ to $S_h times S_h$. Then 
$ c_(alpha beta)^lambda lt.eq min \( D_alpha \, D_beta \) . $

]
] <l:tabloid-lr>

#proof[
  The Littlewood–Richardson rule counts certain tableaux of skew shape $lambda \/ alpha$ and content $beta$ whose reading words satisfy the lattice condition. The word determines the tableau. Every prefix of such a word has weakly decreasing counts of the successive letters. All words of content $beta$ with this prefix condition are in bijection with standard tableaux of shape $beta$: put the successive integers in the next available box of the row specified by the letter. The prefix condition makes each partial shape a partition. There are $D_beta$ such words, so the multiplicity is at most $D_beta$. Interchanging the two factors gives the bound by $D_alpha$. ◻
]

=== 15.3 Positive conjugation and the product transfer <positive-conjugation-and-the-product-transfer>

We now have the two ingredients needed for Theorem 52: a small normalized Hilbert–Schmidt norm for each conditional factor, and a bound on the multiplicity of each pair of factors. The remaining step is to use the first law’s inverse-image caps to average positive operators.

#proof[
  Fix an irreducible $rho = rho_lambda$ of $S_V$, and put $D = D_lambda > 1$. For almost every $z$, let
  $ B_z = sum_(y in H) \( nu_A^z ⊗ nu_C^z \) \( y \) rho \( y \) . $
  Then
  $ hat(theta) \( lambda \) = bb(E)_Z sum_x xi \( x \) rho \( t_Z \) B_Z rho \( x \) . $
  Jensen’s inequality remains valid for a subprobability by adding the zero vector with its missing mass. Since $rho \( t_Z \)$ is unitary, for every vector $u$ we obtain
  #[#set math.equation(numbering: n => "(15.5)")
   $ parallel hat(theta) \( lambda \) u parallel^2 lt.eq bb(E)_Z sum_x xi \( x \) parallel B_Z rho \( x \) u parallel^2 . $ <l:tabloid-jensen>]
  It is enough to bound the positive operator in the right side.
  Fix $z$ for the moment. The restriction to $H$ decomposes as
  $ V_lambda \|_H = xor.big_(alpha \, beta tack.r h) V_alpha ⊗ V_beta ⊗ bb(C)^(c_(alpha beta)^lambda) . $
  On one occurring block write $a = D_alpha$, $b = D_beta$ and $c = c_(alpha beta)^lambda$. Because the conditional measure is a product, the block of $B_z$ is exactly
  $ B_A \( alpha \) ⊗ B_C \( beta \) ⊗ I_c \, #h(2em) B_J \( gamma \) = hat(nu_J^z) \( gamma \) . $
  Both factor matrices are contractions. The contribution of this block to $B_z^(*) B_z$ is therefore bounded in positive-semidefinite order by the operator $Q_A$ whose block is
  $ B_A \( alpha \)^(*) B_A \( alpha \) ⊗ I_b ⊗ I_c $
  and which is zero on the other blocks. In particular $Q_A$ commutes with $rho \( S_C \)$.
  If $x$ and $x'$ have the same ordered inverse images on $A$, then $x' = k x$ for some $k in S_C$. Thus $rho \( x \)^(*) Q_A rho \( x \)$ depends only on $x^(- 1) \|_A$. It is positive, so the pointwise cap (15.1) gives an operator inequality:
  $ sum_x xi \( x \) rho \( x \)^(*) Q_A rho \( x \) & prec.curly.eq 2 bb(E)_(x tilde.op U_V) rho \( x \)^(*) Q_A rho \( x \)\
 & = 2 frac("Tr" Q_A, D) I = 2 frac(c a b, D) frac(parallel B_A \( alpha \) parallel_(upright("HS"))^2, a) I . $
  Here $P prec.curly.eq Q$ means that $Q - P$ is positive semidefinite; the uniform average is scalar by irreducibility, and its trace determines the scalar. Dropping the $A$ factor instead gives the same estimate with $parallel B_C \( beta \) parallel_(upright("HS"))^2 \/ b$, using the cap on $x^(- 1) \|_C$. Consequently the averaged contribution of this block is bounded by
  #[#set math.equation(numbering: n => "(15.6)")
   $ 2 frac(c a b, D) min {1 \, 2 a^(- 1 \/ 2) \, 2 b^(- 1 \/ 2)} I \, $ <l:tabloid-one-block>]
  where Lemma 54 supplies the two normalized norms.
  The weights $c a b \/ D$ sum to one. For blocks with $max \( a \, b \) gt.eq D^(1 \/ 10)$, summing (15.6) therefore costs at most $4 D^(- 1 \/ 20) I$. On each remaining block, Lemma 55 gives $c lt.eq D^(1 \/ 10)$, so $c a b \/ D lt.eq D^(- 7 \/ 10)$. By Theorem 22, for all sufficiently large $h$ the number of partitions of $h$ with degree less than $D^(1 \/ 10)$ is at most
  $ D^(1 \/ 10) sum_(alpha tack.r h) D_alpha^(- 1) lt.eq 3 D^(1 \/ 10) . $
  There are at most $9 D^(1 \/ 5)$ such pairs. Their total contribution to (15.6) is at most $18 D^(- 1 \/ 2) I$. Thus, uniformly in $z$,
  $ sum_x xi \( x \) rho \( x \)^(*) B_z^(*) B_z rho \( x \) prec.curly.eq \( 4 D^(- 1 \/ 20) + 18 D^(- 1 \/ 2) \) I prec.curly.eq 22 D^(- 1 \/ 20) I . $
  Insert this into (15.5) and take square roots. This proves (15.3). ◻
]

=== 15.4 Mass, sign and a fixed convolution power <mass-sign-and-a-fixed-convolution-power>

#thm([Corollary 15.5.])[
  (Completion of the conditional-product bound).  #emph[Identify $V$ with ${ 1 \, dots.h \, 2 h }$, and consider a sequence of the data of Theorem 52 with $h arrow.r oo$ and fixed $L$. Suppose that $mu$ is a probability on $S_(2 h)$ satisfying $theta lt.eq mu$ pointwise, 
$ theta \( S_(2 h) \) = 1 - o \( 1 \) \, #h(2em) lr(|hat(mu) \( upright("sgn") \)|) = o \( 1 \) . $

 Then 
$ parallel mu^(* 100) - U_({ 1 \, dots.h \, 2 h }) parallel_(upright("TV")) arrow.r 0 . $

 In particular the sign hypothesis holds if $mu$ has exactly zero expected sign.]
] <l:tabloid-completion>

#proof[
  Write $q = theta \( S_(2 h) \)$ and $j = 100$. Convolution preserves pointwise domination of nonnegative measures, so $theta^(* j) lt.eq mu^(* j)$, and the missing mass is $1 - q^j = o \( 1 \)$. Also
  $ \| hat(theta) \( upright("sgn") \) \| lt.eq \| hat(mu) \( upright("sgn") \) \| + \( 1 - q \) = o \( 1 \) . $
  The trivial coefficient of $theta^(* j) - U$ is $q^j - 1 = o \( 1 \)$, and its sign coefficient is $hat(theta) \( upright("sgn") \)^j = o \( 1 \)$. For all other irreducibles, operator-norm submultiplicativity and $parallel B parallel_(upright("HS")) lt.eq sqrt(D) parallel B parallel_(upright("op"))$ give
  $ sum_(D_lambda > 1) D_lambda parallel hat(theta) \( lambda \)^j parallel_(upright("HS"))^2 & lt.eq K_0^(2 j) sum_(D_lambda > 1) D_lambda^(2 - 2 j \/ 40)\
 & = K_0^200 sum_(D_lambda > 1) D_lambda^(- 3) = o \( 1 \) \, $
  by Theorem 22. No normality assumption on the Fourier matrices is used.
  Finite-group Plancherel, including the trivial and sign terms, now yields
  $ \( 2 h \) ! sum_g lr(|theta^(* j) \( g \) - frac(1, \( 2 h \) !)|)^2 = o \( 1 \) . $
  Cauchy–Schwarz gives vanishing absolute sum of this difference. Adding the nonnegative missing measure of mass $1 - q^j$ proves the asserted total-variation convergence for $mu^(* j)$. ◻
]

== 16 Independent degree-summation arguments <l:degree-supplement>

The quantitative toolkit in Section 6 proves every inverse-power limit needed by the transfers. The arguments below retain distinct ways to obtain those limits: some use only the composition bound on partitions, and some avoid the hook formula. We use the same notation $L \( lambda \)$, $k \( lambda \)$, $D_lambda$, $C_u$ and $Z_u \( n \)$ as in that section. The common tableau and hook estimates are Lemmas 20 and 21.

=== 16.1 A hook proof at the twentieth power <a-hook-proof-at-the-twentieth-power>

The following proof needs only the composition bound on the number of partitions. Its explicit exponent is useful when an argument counts small subgroup types without the sharper partition estimate.

#thm([Lemma 16.1.])[
  (Inverse-twentieth powers and type counts).  #emph[One has $Z_20 \( n \) arrow.r 0$. There is an absolute constant $K_0$ such that, for all $n gt.eq 1$ and $R gt.eq 1$, 
#[#set math.equation(numbering: n => "(16.1)")
 $ \# { lambda tack.r n : D_lambda lt.eq R } lt.eq K_0 R^20 . $ <l:degree-twenty-type-count>]

]
] <l:degree-reciprocal-twenty>

#proof[
  Orient the first row to have length $L = L \( lambda \)$ and put $k = n - L$. If $L < n \/ 8$, then $D_lambda gt.eq \( 4 \/ e \)^n$, so the contribution is at most $\[ 2 \( e \/ 4 \)^20 \]^n = o \( 1 \)$. For $L gt.eq n \/ 8$ and $k gt.eq 1$, (6.5) gives
  $ D_lambda gt.eq binom(n, k) exp (- frac(k \( 1 + log L \), L)) . $
  There are at most $2 dot.op 2^k$ shapes at each $k$. For $1 lt.eq k lt.eq sqrt(n)$, the exponent is uniformly $o \( 1 \)$ and $binom(n, k) gt.eq \( n \/ k \)^k gt.eq n^(k \/ 2)$. The contribution is at most
  $ 2 e^(o \( 1 \)) sum_(k = 1)^(floor.l sqrt(n) floor.r) \( 2 n^(- 10) \)^k = o \( 1 \) . $
  For $sqrt(n) < k lt.eq 7 n \/ 8$, use $binom(n, k) gt.eq \( 8 \/ 7 \)^k$ and $k \( 1 + log L \) \/ L lt.eq 7 \( 1 + log n \)$. This contribution is at most
  $ 2 e^140 n^140 sum_(k > sqrt(n)) \[ 2 \( 7 \/ 8 \)^20 \]^k = o \( 1 \) \, $
  since $2 \( 7 \/ 8 \)^20 < 1$. The full inverse-twentieth sum is uniformly bounded after adjoining the row and column and the finitely many small sizes. Each type of dimension at most $R$ contributes at least $R^(- 20)$ to that sum, proving (16.1). ◻
]

=== 16.2 Direct reciprocal and inverse-square proofs <l:degree-direct-routes>

These proofs share a summation step, not a dimension estimate. At deficit $k gt.eq 1$ there are at most $2 p \( k \)$ shapes. A lower bound that diverges at each fixed $k$ and has a summable inverse-power majorant therefore gives a vanishing near-row and near-column sum. In the remaining ranges, $D_lambda gt.eq e^(c n)$, or even $e^(c n^0.6)$, beats $p \( n \) lt.eq e^(3 sqrt(n))$. Adding the row and column and finitely many small sizes then gives the corresponding constant $C_u$. Each argument below specifies its dimension bounds and the partition count it uses.

#thm([Lemma 16.2.])[
  (Direct inverse-square summability).  #emph[ One has $C_2 < oo$ and $Z_2 \( n \) arrow.r 0$. This conclusion admits each of the tableau, hook-ratio, and second-row proofs below.]
] <l:degree-inverse-square>

#proof[
  #emph[Initial-row interleavings and diagonals.] Orient a longest line as the first row $L = n - k$. For $1 lt.eq k lt.eq n \/ 3$, the bound $D_lambda gt.eq binom(n - k, k) gt.eq 2^k$ and the composition count $2 p \( k \) lt.eq 2 dot.op 2^k$ give the majorant $2 dot.op 2^(- k)$, with fixed-$k$ divergence. If $k > n \/ 3$ and $L gt.eq n \/ 8$, retain $floor.l L \/ 2 floor.r$ lower boxes to obtain
  $ D_lambda gt.eq binom(L, floor.l L \/ 2 floor.r) gt.eq frac(2^L, L + 1) gt.eq frac(2^(n \/ 8), n + 1) . $
  If $L < n \/ 8$, diagonal filling gives $D_lambda gt.eq 2^(3 n \/ 4)$. The shared summation step completes this hook-free proof.
  The alternative diagonal cutoff $L < n \/ 4$ gives $D_lambda gt.eq 2^(n \/ 2)$. For $L gt.eq n \/ 4$, retain $b = min \( k \, floor.l L \/ 2 floor.r \)$: $k lt.eq L \/ 2$ gives the same $2^k$ majorant, while $k > L \/ 2$ gives the exponential central-binomial bound. ◻
]

#proof[
  #emph[Initial-row interleavings with factorial or hook tails.] At $k lt.eq n \/ 4$, use $binom(n - k, k) gt.eq 3^k$, with inverse-square majorant $2 \( 2 \/ 9 \)^k$; at $k lt.eq n \/ 3$, use $2^k$ and $2 dot.op 2^(- k)$. Either binomial diverges for fixed positive $k$. The following rows give alternative completions of these near-row bounds. In each middle range retain the first row and $b$ lower boxes:
  $ upright("middle range") & b & upright("lower bound for ") D_lambda\
k > n \/ 4 \, med L gt.eq n \/ 10 & floor.l L \/ 4 floor.r & 4^b\
k > n \/ 4 \, med L gt.eq n \/ 8 & floor.l L \/ 4 floor.r & 4^b\
k > n \/ 4 \, med L gt.eq n \/ 8 & floor.l n \/ 32 floor.r & 4^b\
k > n \/ 4 \, med L gt.eq n \/ 8 & floor.l n \/ 16 floor.r & 2^b\
k > n \/ 3 \, med L gt.eq n \/ 10 & floor.l L \/ 3 floor.r & 3^b\
k > n \/ 4 \, med L gt.eq n^0.6 & floor.l L \/ 4 floor.r & 4^b $
  Every row follows from $D_lambda gt.eq binom(L, b) gt.eq \( L \/ b \)^b$. There are enough lower boxes: $k > n \/ 4$ implies $k > L \/ 3$, and $k > n \/ 3$ implies $k > L \/ 2$; the stated cutoffs also ensure $b lt.eq L$. The fixed-cutoff rows are exponential in $n$. Below $L = n \/ 10$ or $n \/ 8$, the factorial form of diagonal filling gives, respectively, $\( 5 \/ e \)^n$ or $\( 4 \/ e \)^n$. These are hook-free completions; using the hook formula gives the same two bounds independently. For the moving cutoff, the middle bound is $e^(c n^0.6)$ and hooks below the cutoff give $n ! \/ \( 2 n^0.6 \)^n$. Thus every row completes the inverse-square sum. ◻
]

#proof[
  #emph[First-row hook ratios.] For $k lt.eq n \/ 4$, (6.6) gives $D_lambda gt.eq e^(- 1) binom(n, k)$, so the inverse-square sum is at most
  $ 2 e^2 sum_(1 lt.eq k lt.eq n \/ 4) 2^k \( k \/ n \)^(2 k) = o \( 1 \) . $
  The summands inside the sum are at most $8^(- k)$ and vanish at fixed $k$. In the remainder $L < 3 n \/ 4$, use $\( 5 \/ e \)^n$ for $L lt.eq n \/ 10$; otherwise retain $b = floor.l L \/ 4 floor.r$ lower boxes. The hook ratio gives $D_lambda gt.eq e^(- 1) binom(L + b, b) gt.eq e^(- 1) 4^b$, where $b gt.eq n \/ 50$ for large $n$.
  Two alternative hook cutoffs retain different quantitative losses. For $L gt.eq n \/ 2$, opposite rearrangement gives
  $ D_lambda gt.eq binom(n, k) e^(- k \( 1 + log L \) \/ L) gt.eq 2^k e^(- k \( 1 + log L \) \/ L) gt.eq \( sqrt(2) \)^k $
  for large $n$. Here use $2 p \( k \) = e^(O \( sqrt(k) \))$ for domination; the binomial gives fixed-$k$ divergence. For $n \/ 10 lt.eq L < n \/ 2$, $binom(n, L)$ is exponential in $n$ and the logarithmic correction is $O \( log n \)$; below $n \/ 10$ use $\( 5 \/ e \)^n$. Alternatively, split at $L = 3 n \/ 4$ and $n \/ 8$: the first range has short-tail loss $k \/ \( L - k + 1 \) lt.eq 1$, the middle uses the same $b = floor.l L \/ 4 floor.r$ hook subdiagram, and the last uses $\( 4 \/ e \)^n$. Each choice proves the limit by the shared summation argument. ◻
]

#proof[
  #emph[Second-row width and two-row rectangles.] Write $c = lambda_2$ after orientation. At $1 lt.eq k lt.eq n \/ 4$,
  $ D_lambda gt.eq binom(n - c, k) gt.eq binom(n - k, k) . $
  Its ratio base is at least $sqrt(n) \/ 2$ for $k lt.eq sqrt(n)$ and at least three for $sqrt(n) < k lt.eq n \/ 4$, so the composition count gives vanishing geometric sums. In the remainder, hooks handle $L < n \/ 10$. For $L gt.eq n \/ 10$ and $c lt.eq L \/ 2$,
  $ D_lambda gt.eq binom(k + L - c, k) gt.eq 2^(min \( k \, L - c \)) gt.eq 2^(n \/ 20) . $
  The middle inequality follows by retaining $min \( k \, L - c \)$ factors in the binomial product. If $c > L \/ 2$, the diagram contains a two-row rectangle of width $floor.l n \/ 20 floor.r$, whose Catalan number is exponential in $n$. The subexponential total count finishes. The alternative near-row cutoff $k lt.eq n \/ 3$ gives majorant $2 dot.op 2^(- k)$; in its remainder $n \/ 10 lt.eq L < 2 n \/ 3$, the same minimum is at least $n \/ 20$, and the rectangle may have width $c$. ◻
]

#proof[
  #emph[Direct reciprocal bounds by interleaving and ballot words.] Interleaving gives $D_lambda gt.eq binom(n - k, k) gt.eq 3^k$ on $1 lt.eq k lt.eq n \/ 4$. Use the sharper deficit count $2 p \( k \) lt.eq 2 e^(3 sqrt(k))$ to sum $2 p \( k \) 3^(- k)$. For $k > n \/ 4$, hooks give $2^n$ if $L < n \/ \( 4 e \)$; otherwise $b = min \( k \, floor.l L \/ 2 floor.r \)$ is a positive linear fraction of $n$ and $binom(L, b) gt.eq 2^b$. Equivalently, split at $L = n \/ 8$, using $b = floor.l n \/ 16 floor.r$ above and $\( 4 \/ e \)^n$ below. Both give $C_1 < oo$ and $Z_1 \( n \) arrow.r 0$ without a near-row hook ratio.
  Ballot words permit the coarser composition count near a long row. For $L gt.eq n \/ 2$, the binomial difference in (6.3) diverges at fixed $k$, while its Catalan bound is at least $4^k \/ \( \( k + 1 \) \( 2 k + 1 \) \)$. The reciprocal contribution is therefore dominated by a constant times $\( k + 1 \) \( 2 k + 1 \) 2^(- k)$. For $n \/ 10 lt.eq L < n \/ 2$, retain $L$ lower boxes and use their Catalan bound; below $n \/ 10$, hooks give $\( 5 \/ e \)^n$.
  A quarter-tail ballot completion instead splits at $L = n \/ 8$ and $3 n \/ 4$. The first range has hook bound $\( 4 \/ e \)^n$; in the middle, $b = floor.l L \/ 4 floor.r$ lower boxes give
  $ D_lambda gt.eq binom(L + b, b) frac(L - b + 1, L + 1) \, $
  exponential in $n$. For $L > 3 n \/ 4$, the ballot fraction is at least $1 \/ 2$, so $D_lambda gt.eq 1 / 2 binom(n, k) gt.eq 1 / 2 4^k$. The deficit count and fixed-$k$ divergence finish this version as well. ◻
]

#proof[
  #emph[A reciprocal hook proof.]  The hook estimates in Lemma 25 give $D_lambda gt.eq e^(n \/ 64)$ for $n gt.eq 64$ and $L lt.eq 3 n \/ 4$, which beats the subexponential total count. For $L > 3 n \/ 4$ and $k gt.eq 1$,
  $ D_lambda gt.eq e^(- 1) \( n \/ k \)^k gt.eq e^(- 1) 4^k . $
  The composition count gives the reciprocal majorant $2 e thin 2^(- k)$, and the first bound diverges at fixed $k$. Thus $Z_1 \( n \) arrow.r 0$ and $C_1 < oo$ follow independently from the hook comparisons used to control the subgroup index. ◻
]

=== 16.3 Coarse partition counts and square-root dimension bounds <l:degree-square-root-section>

#thm([Lemma 16.3.])[
  (Elementary sixteenth and thirteenth powers).  #emph[The conclusions $C_u < oo$ and $Z_u \( n \) arrow.r 0$ for $u = 13 \, 16$ follow from tableau counting and $p \( n \) lt.eq 2^n$ alone.]
] <l:degree-elementary-sixteen>

#proof[
  If $1 lt.eq k lt.eq n \/ 3$, the initial-row construction gives $D_lambda gt.eq binom(n - k, k) gt.eq 2^k$, with at most $2 dot.op 2^k$ shapes. The contribution is bounded by $2 dot.op 2^(- \( u - 1 \) k)$, and each fixed-$k$ contribution tends to zero. For $k > n \/ 3$ and $L gt.eq n \/ 8$, retain $floor.l L \/ 2 floor.r$ lower boxes to get $D_lambda gt.eq 2^(n \/ 8) \/ \( n + 1 \)$. The remaining contribution in this range is at most
  $ \( n + 1 \)^u 2^(\( 1 - u \/ 8 \) n) = o \( 1 \) . $
  For $L < n \/ 8$, diagonal filling gives $D_lambda gt.eq 2^(3 n \/ 4)$, and the contribution is at most $2^(\( 1 - 3 u \/ 4 \) n) = o \( 1 \)$. At $u = 16$ these two bounds are exactly $\( n + 1 \)^16 2^(- n)$ and $2^(- 11 n)$. At $u = 13$ they vanish because $13 \/ 8 > 1$ and $39 \/ 4 > 1$. The finitely many small-size sums give the uniform constants. ◻
]

#thm([Lemma 16.4.])[
  (A tail-adapted diagonal bound).  #emph[For all sufficiently large $n$ and every shape of deficit $k = k \( lambda \) gt.eq 1$, 
$ D_lambda gt.eq 2^(k \/ 2) \, #h(2em) D_lambda gt.eq L \( lambda \) gt.eq sqrt(n) . $

 These inequalities and $p \( k \) lt.eq 2^k$ prove $C_4 < oo$ and $Z_4 \( n \) arrow.r 0$.]
] <l:degree-diagonal-four>

#proof[
  Let $a$ be the largest value of $i + j - 1$ over cells $\( i \, j \)$. Diagonal filling gives $D_lambda gt.eq 2^(n - a)$. Every cell satisfies $i j lt.eq n$, so its smaller index is at most $sqrt(n)$ and $a lt.eq L + sqrt(n)$. If $k < n \/ 2$, orient the first row as $L$. A lower cell satisfies $\( i - 1 \) j lt.eq k$, whence $i + j - 1 lt.eq k + 1 lt.eq L$; thus $a = L$. If $k gt.eq n \/ 2$, then $n - a gt.eq k - sqrt(n) gt.eq k \/ 2$ for large $n$. This proves the first bound in both cases. A non-row, non-column shape contains $\( L \, 1 \)$ after orientation; that hook has $L$ tableaux, proving the second bound. For each $k$, at most $2 p \( k \) lt.eq 2 dot.op 2^k$ shapes occur, so their inverse fourth powers are bounded by $2 dot.op 2^(- k)$. At fixed positive $k$ they tend to zero by $D_lambda gt.eq sqrt(n)$. Dominated convergence and the finite-small-size argument finish. ◻
]

#thm([Lemma 16.5.])[
  (Inverse-tenth powers from a square-root first line).  #emph[One has $C_10 < oo$ and $Z_10 \( n \) arrow.r 0$, using only the first-row interleaving construction and the bound $p \( n \) lt.eq e^(3 sqrt(n))$.]
] <l:degree-inverse-ten>

#proof[
  Orient the longest line as the first row $L gt.eq sqrt(n)$. For $1 lt.eq k < L \/ 2$, use $D_lambda gt.eq binom(L, k) gt.eq 2^k$; the contribution at $k$ is at most $2 dot.op 2^(- 9 k)$ and tends to zero for fixed $k$. For $k gt.eq L \/ 2$, retain $floor.l L \/ 2 floor.r$ lower boxes. The bound $D_lambda gt.eq 2^L \/ \( L + 1 \)$ gives total contribution at most
  $ e^(3 sqrt(n)) \( n + 1 \)^10 2^(- 10 sqrt(n)) = o \( 1 \) . $
  This proves the limit and the uniform bound. ◻
]

===== 16.3.1 Central-binomial powers eight and twenty. <central-binomial-powers-eight-and-twenty.>

Divide at $k lt.eq n \/ 3$. Initial-row interleaving gives $D_lambda gt.eq binom(n - k, k) gt.eq 2^k$, with fixed-$k$ divergence and near-row majorants $2 dot.op 2^(- 7 k)$ and $2 dot.op 2^(- 19 k)$. For $k > n \/ 3$, one has $k > L \/ 2$ and $L gt.eq sqrt(n)$. Retaining $floor.l L \/ 2 floor.r$ lower boxes gives $D_lambda gt.eq 2^L \/ \( L + 1 \)$, so the remaining sums are at most

$ e^(3 sqrt(n)) \( n + 1 \)^u 2^(- u sqrt(n)) = o \( 1 \) #h(2em) \( u = 8 \, 20 \) \, $

because $8 log 2 > 3$. This proves both limits directly from central-binomial interleavings, without ballot words.

===== 16.3.2 Weaker central-binomial estimates. <weaker-central-binomial-estimates.>

For powers $16$ and $32$, the same near-row cutoff and $binom(L, floor.l L \/ 2 floor.r) gt.eq 2^(floor.l L \/ 2 floor.r)$ give

#[#set math.equation(numbering: n => "(16.2)")
 $ e^(3 sqrt(n)) 2^(- u floor.l sqrt(n) \/ 2 floor.r) = o \( 1 \) quad \( u = 16 \, 32 \) . $ <l:degree-sqrt-sixteen>]

Unlike Lemma 59, these proofs use only a square-root lower bound on $L$ and no diagonal filling. For power $12$, divide at $k lt.eq floor.l L \/ 2 floor.r$: the near-row bound $binom(L, k) gt.eq 2^k$ gives majorant $2 dot.op 2^(- 11 k)$ and fixed-$k$ divergence. In the remainder, $binom(L, floor.l L \/ 2 floor.r) gt.eq 2^(L \/ 2)$ for large $L$ gives $e^(3 sqrt(n) - 6 \( log 2 \) sqrt(n)) = o \( 1 \)$.

===== 16.3.3 The ballot inverse-eighth route. <the-ballot-inverse-eighth-route.>

For $1 lt.eq k lt.eq L$, the ballot fraction is at least $1 \/ \( k + 1 \)$. Thus $D_lambda gt.eq 2^k \/ \( k + 1 \)$ gives summable majorant $2^k \( k + 1 \)^8 2^(- 8 k)$, using $2 p \( k \) lt.eq 2^k$; the full binomial difference diverges at fixed $k$. For $k > L$, retain $L$ lower boxes to get $D_lambda gt.eq binom(2 L, L) \/ \( L + 1 \) gt.eq 2^L \/ \( L + 1 \)$. The remaining sum is at most $e^(3 sqrt(n)) \( n + 1 \)^8 2^(- 8 sqrt(n)) = o \( 1 \)$. For every route, adjoining the two linear types and finitely many small sizes gives the complete sum’s uniform boundedness.

#thm([Lemma 16.6.])[
  (A square-root lower bound in the deficit).  #emph[For every $n gt.eq 1$ and $lambda tack.r n$, 
#[#set math.equation(numbering: n => "(16.3)")
 $ log D_lambda gt.eq frac(log 2, 2) sqrt(k \( lambda \)) . $ <l:degree-sqrt-deficit-equation>]

 In particular $C_32 < oo$ follows from this bound alone and $p \( k \) lt.eq e^(3 sqrt(k))$.]
] <l:degree-sqrt-deficit>

#proof[
  Orient a longest line as the first row. Put $b = lambda_2$ and $h = lambda'_1$. For $k gt.eq 1$, $b \( h - 1 \) gt.eq k$. If $h - 1 gt.eq sqrt(k)$, the diagram contains a hook with row and column length $h$, because $L gt.eq h$. That hook has $binom(2 h - 2, h - 1) gt.eq 2^(h - 1)$ tableaux. Otherwise $b > sqrt(k)$ and the diagram contains a two-row rectangle of width $b$. Its Catalan number is at least $2^(b - 1)$: encode the $2^(b - 1)$ compositions of $b$ as distinct Dyck paths obtained by concatenating pyramids of those lengths. In this second case $b gt.eq 2$, so $b - 1 gt.eq b \/ 2 > sqrt(k) \/ 2$. Subdiagram extension proves (16.3); the case $k = 0$ is immediate. Finally sum over deficits using at most $2 p \( k \)$ shapes:
  $ sum_(lambda tack.r n) D_lambda^(- 32) lt.eq 2 + sum_(k gt.eq 1) 2 e^(3 sqrt(k)) e^(- 16 \( log 2 \) sqrt(k)) < oo . $
  ◻
]

=== 16.4 Further direct fixed-power constructions <l:degree-fixed-powers>

Two final counts retain the larger powers that arise when only especially rough estimates are used. They are independent specializations of the tableau constructions, not deductions from an already proved smaller inverse power.

For power $30$ and $1 lt.eq k lt.eq n \/ 4$, choose all $k$ lower labels from ${ 2 k + 1 \, dots.h \, n }$. Fill them in one fixed standard order and put the other labels increasingly in the first row. Since the first $2 k$ labels then lie in the top row, every lower predecessor condition holds. This gives

#[#set math.equation(numbering: n => "(16.4)")
 $ D_lambda gt.eq binom(n - 2 k, k) gt.eq \( n \/ \( 2 k \) \)^k gt.eq 2^k . $ <l:degree-thirty-prefill>]

The $2 dot.op 2^k$ shape count supplies the summable majorant $2 dot.op 2^(- 29 k)$ and fixed-$k$ convergence. For $k > n \/ 4$, put $b = floor.l sqrt(n) \/ 4 floor.r$ and retain the first row $L gt.eq sqrt(n)$ together with $b$ lower boxes. Applying the same over-reserving construction to this subdiagram gives $D_lambda gt.eq binom(L - b, b) gt.eq 3^b$. Since $30 log 3 \/ 4 > 3$, its inverse thirtieth power dominates $p \( n \) lt.eq e^(3 sqrt(n))$. Hence $Z_30 \( n \) arrow.r 0$ and $C_30 < oo$.

For power $32$, a proof using the rough count $2^n$ separates three ranges. If $L lt.eq n \/ 8$, hooks give $\( 4 \/ e \)^n$, which is enough because $32 log \( 4 \/ e \) > log 2$. If $L > n \/ 8$ and $k > n \/ 3$, then $k > L \/ 2$ and retaining $floor.l L \/ 2 floor.r$ lower boxes gives $D_lambda gt.eq 2^(floor.l L \/ 2 floor.r)$; its inverse thirty-second power also dominates $2^n$. For $1 lt.eq k lt.eq n \/ 3$, use

$ D_lambda gt.eq binom(n - k, k) \, #h(2em) 2^(k + 1) (frac(k, n - k))^(32 k) lt.eq 2^(1 - 31 k) \, $

with fixed-$k$ convergence. This proves the same complete inverse-thirty-second assertion without using the square-root partition bound.

For power $6$, the hook ratio gives $D_lambda gt.eq e^(- 1) binom(n, k)$ for $1 lt.eq k lt.eq n \/ 3$. The near-row and near-column contribution is bounded by

#[#set math.equation(numbering: n => "(16.5)")
 $ 2 e^6 sum_(1 lt.eq k lt.eq n \/ 3) \[ 2 \( k \/ n \)^6 \]^k = o \( 1 \) . $ <l:degree-six-hook-sum>]

For $k lt.eq sqrt(n)$ compare with the geometric series of base $2 n^(- 3)$; for $k > sqrt(n)$ use $2 \( k \/ n \)^6 lt.eq 2 \/ 3^6 < 1$. In the remainder $L lt.eq 2 n \/ 3$. If $L gt.eq n \/ \( 4 e \)$, retain $b = floor.l L \/ 2 floor.r$ lower boxes and apply the hook ratio to the resulting diagram, obtaining $e^(- 1) binom(L + b, b) gt.eq e^(- 1) 3^b$. If $L < n \/ \( 4 e \)$, hooks give $\( n \/ \( 2 e L \) \)^n > 2^n$. These exponential bounds finish the sum with $p \( n \) = e^(O \( sqrt(n) \))$.

#proof[
  #emph[A direct fourth-power proof.]  For power $4$, one may also use the near-row majorant $2 dot.op 2^(- 3 k)$ on $k lt.eq n \/ 3$, the middle bound $2^L \/ \( L + 1 \)$ on $n \/ 8 lt.eq L < 2 n \/ 3$, and the hook bound $\( 4 \/ e \)^n$ on $L < n \/ 8$. This is a different use of the fourth power from the tail-adapted diagonal argument in Lemma 60. It uses the subexponential total partition count in its last two ranges. ◻
]

The sharper quantitative estimate

$ sum_(lambda tack.r n) D_lambda^(- u) = 2 + O \( n^(- u) \) #h(2em) \( u > 0 upright(" fixed") \) $

is due to Liebeck and Shalev [7] Theorem 2.6. The arguments above supply the boundedness and vanishing assertions used here without that rate.

The corresponding alternating-group statement is

#[#set math.equation(numbering: n => "(16.6)")
 $ sum_(chi in "Irr" \( A_n \)) chi \( 1 \)^(- u) = 1 + o \( 1 \) #h(2em) \( u > 0 upright(" fixed") \) . $ <l:alternating-degree-sum>]

Here $A_n$ is the subgroup of even permutations. For completeness, the index-two restriction rule makes the two vanishing assertions equivalent. If $V$ is irreducible for $S_n$, Frobenius reciprocity and $"Ind"_(A_n)^(S_n) "Res"_(A_n)^(S_n) V tilde.equiv V xor \( V ⊗ upright("sgn") \)$ show that the endomorphism algebra of its restriction has dimension one or two. Thus the restriction is irreducible or is a sum of two distinct irreducibles. In the latter case an odd permutation exchanges the two summands, since otherwise either would be an $S_n$-invariant proper subspace. Both therefore have dimension $dim V \/ 2$. Every irreducible of $A_n$ occurs in some restriction, by induction and Frobenius reciprocity; it occurs in restrictions of at most two $S_n$-types, since its induced representation has dimension twice its own and each such type has at least its dimension. For $n gt.eq 5$, write $Z_u^A \( n \)$ for the sum over the nontrivial $A_n$-types. The only $S_n$-types restricting to the trivial type are the trivial and sign representations, so the preceding counts give

$ Z_u \( n \) lt.eq 2 Z_u^A \( n \) \, #h(2em) Z_u^A \( n \) lt.eq 2^(u + 1) Z_u \( n \) . $

This proves the equivalence and (16.6), while retaining the sharper cited symmetric-group rate separately.

== 17 An independent signed-tabloid construction <l:tabloid-supplement>

The proof of Lemma 53 in the main text uses the row–column assignment from Lemma 25. Here we construct the signed tabloid directly from diagonal arms and legs and prove its dimension bound from the hook formula. The same part sizes then give an independent reciprocal-degree argument. Throughout, $C_0 = 2 \, 000 \, 000$ as in Theorem 52.

#proof[
  #emph[An arm–leg proof of Lemma 53.] Transposing $lambda$ tensors its representation with sign and does not change its dimension. We may therefore orient the diagram so that $lambda_1 gt.eq lambda'_1$, where the prime denotes transpose, and undo this orientation by a sign twist at the end. Let $k$ be its diagonal length, and define
  $ a_i = lambda_i - i + 1 \, #h(2em) b_i = lambda'_i - i quad \( 1 lt.eq i lt.eq k \) . $
  The $a_i$ count horizontal arms including their diagonal boxes; the $b_i$ count vertical legs below those boxes. They sum to $m$. Use the sizes $a_1 \, b_1 \, dots.h \, a_k \, b_k$, omitting zero parts, with trivial factors on the arms and sign factors on the legs.
  To check occurrence, add arm $1$, leg $1$, arm $2$, leg $2$, and so on. Immediately before arm $i$, rows above $i$ have their final lengths, while row $r gt.eq i$ has length $min \( i - 1 \, lambda_r \)$. Adding arm $i$ completes row $i$ and is a horizontal strip. Adding leg $i$ then extends column $i$ down to height $lambda'_i$ and is a vertical strip. Each intermediate shape is a partition. Repeated application of the horizontal and vertical Pieri rules therefore shows that the resulting induced representation contains $V_lambda$.
  It remains to compare its dimension with $D_lambda$. The hook-length formula gives
  #[#set math.equation(numbering: n => "(17.1)")
   $ M / D_lambda = frac(product_(1 lt.eq i \, j lt.eq k) \( a_i + b_j \), (product_(i = 1)^k a_i) product_(1 lt.eq i < j lt.eq k) \( a_i - a_j \) \( b_i - b_j \)) . $ <l:tabloid-hook-ratio>]
  Here is a direct verification of the identity. The hooks in the diagonal $k$ by $k$ square have lengths $a_i + b_j$. For any partition with $k$ rows of lengths $r_i$, allowing zero rows, the hook lengths in row $i$ are the integers from $1$ to $r_i + k - i$ with $r_i - r_j + j - i$ omitted for every $j > i$. Indeed its hook at column $t$ has length $r_i - t + 1 + \# { j > i : r_j gt.eq t }$; the gaps as $t$ increases are precisely those omitted values. Apply this observation to the diagram to the right of the square, whose row lengths are $lambda_i - k$, and to the transpose of the diagram below it, whose row lengths are $lambda'_i - k$. Their hook products are, respectively,
  $ frac(product_i \( a_i - 1 \) !, product_(i < j) \( a_i - a_j \)) \, #h(2em) frac(product_i b_i !, product_(i < j) \( b_i - b_j \)) . $
  Division by $product_i a_i ! b_i !$ proves (17.1).
  When $k = 1$, orientation gives $a_1 gt.eq b_1 + 1$, so the ratio in (17.1) is at most two. A one-row diagram has $M = D_lambda = 1$. Every other such hook has $D_lambda gt.eq 2$, since the entry $2$ can be placed either to the right of or below $1$ and the resulting partial tableaux can be completed. The claimed bound follows in this case.
  Assume now that $k gt.eq 2$. All logarithms in this proof are natural. Arithmetic–geometric mean bounds the numerator in (17.1) by $\( m \/ k \)^(k^2)$. The two sequences $a_i$ and $b_i$ are strictly decreasing integers, so their two Vandermonde products are at least $product_(j = 1)^k \( \( j - 1 \) ! \)^2$. For $1 lt.eq j lt.eq k$,
  $ log \( \( j - 1 \) ! \) gt.eq \( j - 1 \) log k - k . $
  To see this, sum $log \( r \/ k \)$ for $1 lt.eq r < j$, and bound that sum below by the sum for $1 lt.eq r lt.eq k$, which is at least $- k$ by $k ! gt.eq \( k \/ e \)^k$. Consequently
  #[#set math.equation(numbering: n => "(17.2)")
   $ log \( M \/ D_lambda \) lt.eq k^2 #scale(x: 120%, y: 120%)[\(] log \( m \/ k^2 \) + 3 #scale(x: 120%, y: 120%)[\)] . $ <l:tabloid-ratio-log>]
  We need two lower bounds on $D_lambda$ to pay for this ratio. Every standard tableau of a contained diagram extends to $lambda$ by adding the remaining boxes in a fixed order compatible with rows and columns. In particular the contained $k$ by $k$ square gives
  $ D_lambda gt.eq frac(\( k^2 \) !, \( 2 k \)^(k^2)) gt.eq (frac(k, 2 e))^(k^2) . $
  It follows that
  #[#set math.equation(numbering: n => "(17.3)")
   $ log D_lambda gt.eq c_0 k^2 log k \, #h(2em) c_0 = 10^(- 5) . $ <l:tabloid-square-degree>]
  For $k gt.eq 64$ the displayed factorial estimate proves this directly. For $2 lt.eq k < 64$, the contained two-square gives $D_lambda gt.eq 2$, and $10^(- 5) 63^2 log 63 < log 2$ suffices.
  Orientation also gives $a_1 gt.eq m \/ \( 2 k \)$, since every arm and leg has size at most $a_1$. The diagram contains $\( a_1 \, k \, dots.h \, k \)$ with $k$ rows. Fill its first $k$ top-row boxes with the smallest entries. Then interleave the rest of the top row with any fixed standard order of the $k \( k - 1 \)$ lower boxes. Each interleaving is a standard tableau, so
  $ D_lambda gt.eq binom(a_1 - k + k \( k - 1 \), k \( k - 1 \)) . $
  If $m gt.eq 16 k^3$, put $r = m \/ k^3$, $u = a_1 - k$ and $v = k \( k - 1 \)$. Then $u gt.eq m \/ \( 4 k \)$ and $k^2 \/ 2 lt.eq v lt.eq k^2$. Using $binom(u + v, v) gt.eq \( \( u + v \) \/ v \)^v$ gives
  #[#set math.equation(numbering: n => "(17.4)")
   $ log D_lambda gt.eq k^2 / 2 log \( r \/ 4 \) gt.eq k^2 / 4 log r . $ <l:tabloid-long-arm-degree>]
  If $m < 16 k^3$, then $log \( m \/ k^2 \) + 3 lt.eq 13 log k$, and (17.2)–(17.3) give $log M lt.eq \( 1 + 13 \/ c_0 \) log D_lambda$. If $m gt.eq 16 k^3$, write $log \( m \/ k^2 \) + 3 = log \( m \/ k^3 \) + log k + 3$ and use both degree bounds. This gives
  $ log M lt.eq (5 + frac(1 + 3 \/ log 2, c_0)) log D_lambda . $
  Both coefficients are less than $2 \, 000 \, 000$, completing the proof. ◻
]

This arm–leg construction also gives an independent way to sum reciprocal representation degrees. The same tabloid sizes therefore supply both the embedding and the degree estimates used for counting small restriction types and summing the final Fourier bounds.

#thm([Lemma 17.1.])[
  (Degree sums from the tabloid embedding).  #emph[For every fixed $s > 0$, 
$ sum_(lambda tack.r m\
D_lambda > 1) D_lambda^(- s) arrow.r 0 #h(2em) \( m arrow.r oo \) . $

 In particular $sum_(lambda tack.r m) D_lambda^(- 1) lt.eq 3$ for all sufficiently large $m$.]
] <l:tabloid-degree-sums>

#proof[
  Let $p \( u \)$ count partitions of $u$, with $p \( 0 \) = 1$. For $u gt.eq 1$, evaluating its generating product at $x = e^(- 1 \/ sqrt(u))$ gives
  $ p \( u \) x^u lt.eq product_(j gt.eq 1) \( 1 - x^j \)^(- 1) \, #h(2em) log product_(j gt.eq 1) \( 1 - x^j \)^(- 1) = sum_(i gt.eq 1) frac(1, i \( e^(i \/ sqrt(u)) - 1 \)) lt.eq sqrt(u) sum_(i gt.eq 1) i^(- 2) . $
  Thus $p \( u \) lt.eq e^(3 sqrt(u))$. Orient $lambda$ so that $lambda_1 gt.eq lambda'_1$, and use the preceding arm–leg construction with $a_1 = lambda_1$ and $j = m - a_1$. For $1 lt.eq j lt.eq m \/ 2$, at most $2 p \( j \)$ original diagrams have this value: delete the oriented first row, and remember whether a transpose was used. The tabloid dimension satisfies $M gt.eq binom(m, j)$, and that construction gives
  $ D_lambda^(- s) lt.eq M^(- s \/ C_0) lt.eq binom(m, j)^(- s \/ C_0) . $
  For each fixed $j gt.eq 1$ this tends to zero. Since $binom(m, j) gt.eq \( m \/ j \)^j gt.eq 2^j$ on this range, the summable sequence $2 p \( j \) 2^(- j s \/ C_0)$ dominates the contributions. They therefore sum to $o \( 1 \)$.
  If $j > m \/ 2$, every arm or leg used in the tabloid has size at most $a_1 < m \/ 2$. Add some of these parts until their total $w$ first reaches $m \/ 4$. Then $m \/ 4 lt.eq w lt.eq 3 m \/ 4$ and
  $ M gt.eq binom(m, w) gt.eq \( m \/ w \)^w gt.eq \( 4 \/ 3 \)^(m \/ 4) . $
  The total contribution of this range is at most $p \( m \) \( 4 \/ 3 \)^(- m s \/ \( 4 C_0 \)) = o \( 1 \)$. The omitted $j = 0$ diagrams are the row and column, whose representations are trivial and sign. They are the only one-dimensional representations for $m gt.eq 2$, and their contribution to the inverse-first-degree sum is two. ◻
]

== 18 Further fixed-coset transfer arguments <l:transfer-supplement>

The main transfer assigns each joint restriction type to one small factor, or covers the representation by small isotypic projections. The alternatives here retain different information. The first two arguments average many low-type projections before recovering a test vector; the third counts whole joint types. We also record parameter choices for these and the main estimates. Finally, a separate character construction removes whole longest lines instead of assigning individual boxes to rows or columns. Its dimension ratio, reciprocal-degree proof, and transfer are kept together.

For the projection arguments and substitutions below, use the fixed-coset data of Section 4. Namely, let $G = S_n$, partition $\[ n \] = M_1 union.sq dots.h.c union.sq M_b$ into nonempty blocks, and let $H_i = "Sym" \( M_i \)$ fix the complement. Let $f gt.eq 0$ have mass at most one and satisfy

$ f \( g H_i \) lt.eq frac(B, \[ G : H_i \]) #h(2em) \( g in G \, med 1 lt.eq i lt.eq b \) . $

Write $D = dim rho$ for the degree of the ambient irreducible and $C_u = sup_(m gt.eq 1) sum_(lambda tack.r m) D_lambda^(- u)$. The peeling construction concerns a single symmetric group first; its final transfer states its own equal-block data.

=== 18.1 Averages of many low-type projections <averages-of-many-low-type-projections>

#thm([Proposition 18.1.])[
  (Coefficient-space average).  #emph[For $b = 32$ and cap $B = 4$, 
$ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq 8 / 3 sqrt(C_1) thin D^(- 5 \/ 16) . $

]
] <l:coefficient-average>

#proof[
  Let $P_i$ now select factor degrees at most $D^(1 \/ 8)$. At most eight factors of any product type can exceed that threshold, so $macron(P) = 32^(- 1) sum_i P_i succ.curly.eq 3 I \/ 4$. Lemma 13, the coset cap, and full-group Schur orthogonality give
  $ \| chevron.l w \, hat(f) \( rho \) P_i v chevron.r \|^2 lt.eq 4 C_1 D^(- 5 \/ 8) parallel w parallel^2 parallel P_i v parallel^2 . $
  Here the selected coefficient space has dimension at most $C_1 D^(3 \/ 8)$. Thus $parallel hat(f) P_i parallel_(upright("op")) lt.eq 2 sqrt(C_1) D^(- 5 \/ 16)$. Average over $i$ and multiply by $macron(P)^(- 1)$, whose norm is at most $4 \/ 3$. ◻
]

#thm([Proposition 18.2.])[
  (Orbit-space average).  #emph[For $b = 256$ and cap $B = 4$, 
$ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq 4 sqrt(C_32) D^(- 1 \/ 4) . $

]
] <l:orbit-average>

#proof[
  Let $P_i$ select degrees at most $D^(2 \/ b)$. At least half the factors of every product type meet this condition, so $macron(P) = b^(- 1) sum_i P_i succ.curly.eq I \/ 2$. A vector in the range of $P_i$ has orbit span of dimension at most $C_32 D^(68 \/ b)$ by Lemma 7. The coset cap and Schur averaging, exactly as in Proposition 8, give
  $ parallel hat(f) P_i parallel_(upright("op")) lt.eq 2 sqrt(C_32) D^(- 1 \/ 2 + 34 \/ b) lt.eq 2 sqrt(C_32) D^(- 1 \/ 4) \, $
  since $68 \/ 256 lt.eq 1 \/ 2$. Average and use $parallel macron(P)^(- 1) parallel_(upright("op")) lt.eq 2$. This proof retains the geometric averaging mechanism and only uses the reciprocal power $32$. ◻
]

#thm([Proposition 18.3.])[
  (Four-factor coefficient decomposition).  #emph[If there are four blocks and the subprobability cap is $B = 2$, then 
$ parallel hat(f) \( rho \) parallel_(upright("op")) lt.eq 2 C_(1 \/ 4)^2 D^(- 1 \/ 8) . $

]
] <l:four-coefficient>

#proof[
  Decompose a vector orthogonally into full product types $v = sum_(bold(tau)) v_(bold(tau))$. If $d_i$ are the four factor degrees, their product is at most $D$. The sum of $\( product_i d_i \)^(- 1 \/ 4)$ over all possible product types is at most $C_(1 \/ 4)^4$. Thus the number $T$ of occurring types is at most $C_(1 \/ 4)^4 D^(1 \/ 4)$.
  For one type choose $i$ with $d_i lt.eq D^(1 \/ 4)$. The coefficient function on $g H_i$ belongs to a single type’s coefficient space, even when that type occurs repeatedly. Lemma 13 bounds its supremum by $d_i$ times its uniform root mean square. Sum over cosets with cap two, then apply Cauchy–Schwarz over the uniform cosets. Full-group Schur orthogonality yields
  $ sum_g f \( g \) \| chevron.l w \, rho \( g \) v_(bold(tau)) chevron.r \| lt.eq 2 d_i D^(- 1 \/ 2) parallel w parallel parallel v_(bold(tau)) parallel lt.eq 2 D^(- 1 \/ 4) parallel w parallel parallel v_(bold(tau)) parallel . $
  Finally $sum_(bold(tau)) parallel v_(bold(tau)) parallel lt.eq sqrt(T) parallel v parallel$, giving the claimed exponent and constant. The count here is of entire product types, unlike the blockwise assignment in Proposition 14. ◻
]

=== 18.2 Exact substitutions <l:exact-substitutions>

For applications using a prescribed block count or reciprocal-degree power, the following substitutions give explicit constants and exponents. They are convenient choices, not optimal convolution counts. In Proposition 8, $u = 16$ gives exponent $- \( 1 - 18 \/ b \) \/ 2$; $u = 2$ gives $- \( 1 - 4 \/ b \) \/ 2$; $u = 1$, $b = 8$ gives $- 5 \/ 16$. Each substitution changes only the inequality $sum_(a lt.eq D^(1 \/ b)) a^2 lt.eq C_u D^(\( u + 2 \) \/ b)$.

For Hilbert–Schmidt bounds, the coefficient proof with $u = 2$, $b = 16$, $B = 3$ gives $D parallel hat(f) parallel_(upright("HS"))^2 lt.eq 9 b C_2 D^(4 \/ b)$. The pointwise character proof with $u = 2$, $b = 8$, $B = 1$ gives $parallel hat(f) parallel_(upright("HS"))^2 lt.eq b C_2 D^(- 1 + 6 \/ b)$. The central-isotypic proof with $u = 16$, $b = 64$, $B = 4$ gives $4 b C_16 D^(- 1 + 18 \/ b)$. With respectively four, sixteen, and thirty-two convolutions, the nonsign exponents are $- 2$, $- 3$, and $- 22$. The coefficient proof with $u = 10$ gives $B^2 b C_10 D^(- 1 + 12 \/ b)$; its sharper branching alternative is Proposition 18. These substitutions preserve the distinct proofs of the estimates even when a stronger estimate is also available.

=== 18.3 A separate construction by peeling longest lines <a-separate-construction-by-peeling-longest-lines>

The next construction chooses whole lines successively, instead of assigning individual boxes. Its index estimate is weaker, but its stepwise dimension inequality gives another proof of inverse-degree summability. The occurrence argument uses the horizontal- and vertical-strip cases of the Pieri rule [13].

#thm([Lemma 18.4.])[
  (A subcharacter obtained by peeling).  #emph[Put $C_(upright("peel")) = 512^2$. Every irreducible representation of $S_m$ of degree $D$ has a one-dimensional character in its restriction to some subgroup $J$ with $\[ S_m : J \] lt.eq D^(C_(upright("peel")))$. At a step removing a longest first row or first column of length $r$, leaving size $s$ and degree $D'$, one has 
#[#set math.equation(numbering: n => "(18.1)")
 $ D / D' gt.eq binom(r + s, r)^(1 \/ C_(upright("peel"))) . $ <l:peeling-ratio>]

 The degree of the empty remainder is one.]
] <l:peeling-character>

#proof[
  Remove the longer of the first row and first column of the current diagram. In a row removal, the realigned lower diagram $mu$ is contained in the original diagram $lambda$, and $lambda \/ mu$ is a horizontal strip: every column loses exactly its bottom box. The Pieri rule and Frobenius reciprocity show that restriction to $S_s times S_r$ contains $V_mu$ tensored with the trivial representation of $S_r$. For a column removal use the sign representation and the transposed argument. Iteration supplies a product subgroup and a product of trivial and sign characters occurring in the original representation.
  To prove the index bound, it remains to compare dimensions at each step. Transpose so that a row is removed; then the diagram has height at most $r$. If $c_j$ counts its lower boxes in column $j$, the hook formula gives
  $ D / D' = binom(r + s, r) / R \, #h(2em) R = product_(j = 1)^r (1 + frac(c_j, r - j + 1)) \, #h(2em) sum_j c_j = s . $
  The case $s = 0$ is immediate. For $r gt.eq 512$ and $s gt.eq 16 r$, the bound $c_j lt.eq r$ gives
  $ R lt.eq binom(2 r, r) lt.eq 4^r \, #h(2em) binom(r + s, r) gt.eq \( 1 + s \/ r \)^r gt.eq 17^r . $
  Thus $R lt.eq binom(r + s, r)^(1 \/ 2)$. For $1 lt.eq s lt.eq 16 r$, the opposite ordering of $c_j$ and $\( r - j + 1 \)^(- 1)$ instead gives
  $ log R lt.eq s / r sum_(j = 1)^r 1 / j lt.eq frac(s \( 1 + log r \), r) \, #h(2em) log binom(r + s, r) gt.eq s log \( 1 + r \/ s \) . $
  Since $\( 1 + log r \) \/ r$ decreases for $r gt.eq 512$ and is at most $1 / 2 log \( 17 \/ 16 \)$ there, this also gives $D \/ D' gt.eq binom(r + s, r)^(1 \/ 2)$.
  If $r < 512$ and $s > 0$, then $r gt.eq 2$ and $r + s lt.eq r^2$. Each standard ordering of the lower diagram yields two distinct standard tableaux: fill the first row before that ordering, or fill its first $r - 1$ boxes, the first lower box, the last top-row box, and then the remaining lower boxes in that ordering. The first lower box is in column one, so the second filling is also valid. These two constructions are injective and have disjoint images. Hence $D \/ D' gt.eq 2$, while $binom(r + s, r) lt.eq 2^(r^2) lt.eq 2^(C_(upright("peel")))$. This proves (18.1) in every case. Multiplying it through the successive steps telescopes the dimension ratios. The product of the binomial coefficients is exactly the index of the product subgroup constructed above, proving the assertion. ◻
]

#thm([Lemma 18.5.])[
  (Inverse-first-degree summability from peeling).  #emph[The preceding stepwise estimate independently implies 
$ sum_(lambda tack.r m : thin D_lambda > 1) D_lambda^(- 1) arrow.r 0 . $

 Consequently, for all sufficiently large $m$ and every $Y gt.eq 1$, $S_m$ has at most $3 Y$ irreducible types of degree at most $Y$.]
] <l:peeling-inverse-one>

#proof[
  We use $p \( h \) lt.eq e^(3 sqrt(h))$, which follows by evaluating the partition generating function at $e^(- 1 \/ sqrt(h))$: the logarithm of the product is at most $sqrt(h) sum_(j gt.eq 1) j^(- 2) lt.eq 2 sqrt(h)$, and the coefficient bound adds $sqrt(h)$.
  The first removed length $r$ is at least $sqrt(m)$ because both width and height are at most $r$. If $r < m \/ 2$, (18.1) gives
  $ log D_lambda gt.eq frac(r log \( m \/ r \), C_(upright("peel"))) . $
  The concavity of $r log \( m \/ r \)$ bounds it below on $\[ sqrt(m) \, m \/ 2 \]$ by the smaller of $1 / 2 sqrt(m) log m$ and $1 / 2 m log 2$. After division by $sqrt(m)$, this lower bound tends to infinity. It therefore dominates the logarithm $3 sqrt(m)$ of the number of all diagrams, proving a vanishing inverse sum in this range.
  If $m \/ 2 lt.eq r < m$, put $h = m - r gt.eq 1$. At most $2 p \( h \)$ diagrams have this value, counting both orientations, and (18.1) gives $D_lambda gt.eq \( m \/ h \)^(h \/ C_(upright("peel")))$. For fixed $h$ their inverse-degree contribution tends to zero. It is bounded by $2 e^(3 sqrt(h)) 2^(- h \/ C_(upright("peel")))$, a summable sequence. Dominated convergence handles this range. The remaining diagrams are the row and column, of degree one. Once the nonlinear reciprocal sum is at most one, at most $Y$ nonlinear types have degree at most $Y$; adding the two linear types gives $Y + 2 lt.eq 3 Y$. ◻
]

#thm([Corollary 18.6.])[
  (The peeling character transfer).  #emph[Let $b = 2^22$ and partition $n = b m$ points into $b$ sets of size $m$. Let $H_i$ permute the $i$th set. If $f gt.eq 0$ has mass at most one and $f \( g H_i \) lt.eq 2 \/ \[ S_n : H_i \]$ for every $g \, i$, then for all sufficiently large $m$ and every irreducible of degree $D$, 
#[#set math.equation(numbering: n => "(18.2)")
 $ parallel hat(f) \( rho \) parallel_(upright("HS"))^2 lt.eq 6 b D^(- 1 + \( C_(upright("peel")) + 2 \) \/ b) . $ <l:peeling-lift-bound>]

]
] <l:peeling-lift>

#proof[
  Lemma 26, using Lemma 67, bounds a full $H_i$-isotypic projection of degree $d_tau$ by $2 d_tau^(C_(upright("peel")) + 1) \/ D$ in squared Hilbert–Schmidt norm. As in Theorem 27, the projections with $d_tau lt.eq Y = D^(1 \/ b)$ cover the identity. By Lemma 68 there are at most $3 Y$ such types for each factor. Summing gives $D^(- 1) dot.op 2 b dot.op 3 Y dot.op Y^(C_(upright("peel")) + 1)$, which is (18.2). ◻
]

Here $\( C_(upright("peel")) + 2 \) \/ b = \( 262144 + 2 \) \/ 4194304 < 1 \/ 8$. Thus four convolutions again tend to uniform whenever the retained mass tends to one and the original sign mean tends to zero, by Proposition 6. The peeling and box-assignment proofs supply the subcharacter hypothesis separately; neither uses the other’s subgroup construction.

#heading(level: 1)[References]
#bibitem([1])[A. Czumaj, Random permutations using switching networks, in #emph[Proceedings of the Forty-Seventh Annual ACM Symposium on Theory of Computing (STOC 2015)], ACM, 2015, 703--712. #link("https://doi.org/10.1145/2746539.2746629")[doi:10.1145/2746539.2746629].]
#bibitem([2])[A. Czumaj and B. Vöcking, Thorp shuffling, butterflies, and non-Markovian couplings, in #emph[Automata, Languages, and Programming (ICALP 2014)], Part~I, Lecture Notes in Computer Science, vol.~8572, Springer, 2014, 344--355. #link("https://doi.org/10.1007/978-3-662-43948-7_29")[doi:10.1007/978-3-662-43948-7\_29].]
#bibitem([3])[P. Diaconis and M. Shahshahani, Generating a random permutation with random transpositions, #emph[Zeitschrift für Wahrscheinlichkeitstheorie und verwandte Gebiete] #strong[57] (1981), 159--179. #link("https://doi.org/10.1007/BF00535487")[doi:10.1007/BF00535487].]
#bibitem([4])[P. Etingof, O. Golberg, S. Hensel, T. Liu, A. Schwendner, D. Vaintrob, and E. Yudovina, #emph[Introduction to Representation Theory], Student Mathematical Library, vol. 59, American Mathematical Society, 2011. Numbered references use the author's lecture notes of January 10, 2011: #link("https://math.mit.edu/~etingof/replect.pdf").]
#bibitem([5])[J. S. Frame, G. de B. Robinson, and R. M. Thrall, The hook graphs of the symmetric group, #emph[Canadian Journal of Mathematics] #strong[6] (1954), 316--324. #link("https://doi.org/10.4153/CJM-1954-030-1")[doi:10.4153/CJM-1954-030-1].]
#bibitem([6])[G. D. James, #emph[The Representation Theory of the Symmetric Groups], Lecture Notes in Mathematics, vol. 682, Springer-Verlag, 1978.]
#bibitem([7])[M. W. Liebeck and A. Shalev, Fuchsian groups, coverings of Riemann surfaces, subgroup growth, random quotients and random walks, #emph[Journal of Algebra] #strong[276] (2004), no. 2, 552--601. Proposition 2.5 and Theorem 2.6 appear on pages 15--16 of the #link("https://www.ma.imperial.ac.uk/~mwl/fuchs.pdf")[author's text].]
#bibitem([8])[B. Morris, Improved mixing time bounds for the Thorp shuffle and $L$-reversal chain, #emph[Annals of Probability] #strong[37] (2009), no.~2, 453--477. #link("https://doi.org/10.1214/08-AOP409")[doi:10.1214/08-AOP409].]
#bibitem([9])[B. Morris, Improved mixing time bounds for the Thorp shuffle, #emph[Combinatorics, Probability and Computing] #strong[22] (2013), no.~1, 118--132. #link("https://doi.org/10.1017/S0963548312000478")[doi:10.1017/S0963548312000478].]
#bibitem([10])[OpenAI, #emph[Conditional information under deterministic coordinate sweeps], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026/main.pdf")[OAI:Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026], 2026.]
#bibitem([11])[OpenAI, #emph[Conditional permutations in a revealed switching environment], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conditional-permutations-in-a-revealed-switching-environment-September-26-2026/paper.pdf")[OAI:Conditional-permutations-in-a-revealed-switching-environment-September-26-2026], 2026.]
#bibitem([12])[OpenAI, #emph[Random coordinate frames and partial permutation laws], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Random-coordinate-frames-and-partial-permutation-laws-September-26-2026/main.pdf")[OAI:Random-coordinate-frames-and-partial-permutation-laws-September-26-2026], 2026.]
#bibitem([13])[B. E. Sagan, #emph[The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions], second edition, Graduate Texts in Mathematics, vol. 203, Springer, 2001. #link("https://doi.org/10.1007/978-1-4757-6804-6")[doi:10.1007/978-1-4757-6804-6].]
#bibitem([14])[E. O. Thorp, Nonrandom shuffling with applications to the game of faro, #emph[Journal of the American Statistical Association] #strong[68] (1973), no.~344, 842--847. #link("https://doi.org/10.1080/01621459.1973.10481434")[doi:10.1080/01621459.1973.10481434].]


