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

#align(center)[#text(size: 16pt, weight: "bold")[Exponential decay in two-dimensional classical $O \( n \)$ models]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For the two-dimensional nearest-neighbor model, continuous symmetry prevents spontaneous magnetization, but it does not determine the rate at which distant spins decorrelate. The central question for the classical $O \( n \)$ model is whether that rate is exponential at every positive temperature when $n gt.eq 3$. We establish a finite-volume estimate that is uniform under deleting vertices and edges and under weakening ferromagnetic couplings.

Let $G = \( V \, E \)$ be a finite subgraph of the nearest-neighbor square lattice, and let $b = \( b_e \)_(e in E)$ satisfy $0 lt.eq b_e lt.eq beta < oo$. At each vertex put a spin $sigma_x in S^(n - 1)$. Write

#[#set math.equation(numbering: n => "(1.1)")
 $ upright(d) mu_(G \, b)^(\( n \)) \( sigma \) = 1 / Z_(G \, b)^(\( n \)) exp #h(-0.16667em) (sum_({ x \, y } in E) b_(x y) sigma_x dot.op sigma_y) product_(x in V) upright(d) omega_(n - 1) \( sigma_x \) \, $ <eq:model>]

where $omega_(n - 1)$ is uniform probability measure on the unit sphere. There are no fixed boundary spins in (1.1), and no external field or additional interaction. Expectations are denoted by $chevron.l thin dot.op thin chevron.r_(G \, b)^(\( n \))$.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 3$ and every finite $beta > 0$, there are constants $A = A \( n \, beta \) < oo$ and $m = m \( n \, beta \) > 0$ such that, for every finite nearest-neighbor square-lattice subgraph $G$, every strength array $b in \[ 0 \, beta \]^E$, and all $x \, y in V$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ 0 lt.eq chevron.l sigma_x dot.op sigma_y chevron.r_(G \, b)^(\( n \)) lt.eq A exp \( - m parallel x - y parallel_2 \) . $ <eq:main-bound>]

]
] <thm:main>

#thm([Corollary 1.2.])[
  (Free-boundary limits).  #emph[Let $Lambda_L = \[ - L \, L \]^2 ∩ bb(Z)^2$, with all its nearest-neighbor edges, free boundary conditions, and constant strength $beta > 0$. For every $n gt.eq 3$ and $x in bb(Z)^2$, 
#[#set math.equation(numbering: n => "(1.3)")
 $ limsup_(L arrow.r oo) lr(|chevron.l sigma_0 dot.op sigma_x chevron.r_(Lambda_L \, beta)^(\( n \))|) lt.eq A e^(- m parallel x parallel_2) \, $ <eq:limsup>]

 with the constants of Theorem 1. Every subsequential local weak limit of these laws satisfies the same two-point bound.]
] <cor:limits>

The volume-uniform estimate also gives finite spin susceptibility in each limit from Corollary 2: the sum $sum_(x in bb(Z)^2) chevron.l sigma_0 dot.op sigma_x chevron.r$ is bounded by $A sum_(x in bb(Z)^2) e^(- m parallel x parallel_2) < oo$. The result concerns the spin two-point function. A full transfer gap would additionally control covariances of all local observables, including rotation-invariant bond energies, and requires a separate argument. We do not identify the low-temperature correlation-length asymptotic or prove uniqueness of infinite-volume Gibbs states. The constants may deteriorate as $beta arrow.r oo$.

=== 1.1 Historical context and the problem <historical-context-and-the-problem>

Mermin and Wagner proved the foundational no-order theorem for quantum Heisenberg systems #cite(label("MW")); Mermin then gave a direct classical argument #cite(label("Mermin1967")). McBryan and Spencer used complex spin rotations to obtain algebraic upper bounds on two-dimensional correlations #cite(label("McBryanSpencer")). Gagnebin and Velenik extended this approach to continuous interactions with much weaker regularity and suitable long-range couplings #cite(label("GagnebinVelenik")). Such bounds quantify the loss of order but allow a zero exponential decay rate.

For two-component spins, this distinction is essential. The Berezinskii–Kosterlitz–Thouless picture #cite(label("Berezinskii")) #cite(label("KosterlitzThouless")) includes a low-temperature phase with slow decay. Fröhlich and Spencer proved a polynomial lower bound for the ordinary plane rotator at sufficiently low temperature #cite(label("FS")) Theorem C. Their theorem rules out an exponential upper bound in that regime, so Theorem 1 cannot extend to $n = 2$.

For three or more components, Polyakov’s non-Abelian renormalization argument predicts mass generation at every positive temperature #cite(label("Polyakov")). Rigorous results have covered important parts of this picture. Aizenman and Simon derived exponential decay at high temperature from local Ward identities #cite(label("AizenmanSimonWard")) Section 3. Kupiainen established an asymptotic $1 \/ n$ expansion and proved a mass gap in the corresponding large-component regime #cite(label("Kupiainen")). These regimes leave the question at a prescribed small spin dimension and arbitrarily low positive temperature. Aru, Garban, and Sepúlveda record the all-temperature lattice assertion as an open conjecture in their 2025 study #cite(label("AGS")) Introduction, pp. 2–3. Theorem 1 resolves its spin-correlation formulation positively for the free-boundary laws (1.1) and their limits in Corollary 2.

Geometric approaches illuminate a difficulty with reducing the number of spin components. Conditioning one coordinate of a three-component spin field gives a plane-rotator model with dependent random couplings. Patrascioiu and Seiler investigated percolation of spin regions as a route to a possible massless phase, with numerical and conditional arguments for a constrained version of the model #cite(label("PatrascioiuSeiler")). Aru, Garban, and Sepúlveda constructed random environments with predominantly strong couplings for which the plane-rotator two-point function nevertheless decays exponentially after averaging over the environment #cite(label("AGS")) Theorem 1.5. Percolation of the strongly coupled region therefore does not by itself force slow decay of these averaged correlations. In our argument the three-component estimate is uniform over every strength array in $\[ 0 \, beta \]^E$; this uniformity permits the final conditional reduction without assumptions on the distribution of the projected couplings.

=== 1.2 Methods and their ancestry <methods-and-their-ancestry>

Local rotation identities convert continuous symmetry into relations among partition-function derivatives and correlations. Driessler, Landau, and Perez used local Ward identities in estimates of critical lengths and temperatures #cite(label("DriesslerLandauPerez")). Aizenman and Simon also obtained a finite-size criterion that turns sufficiently fast algebraic decay into exponential decay for two, three, and four components #cite(label("AizenmanSimonWard")) Section 4. Such criteria separate the large-distance argument from the task of proving adequate decay at one finite scale. Here that task is carried out by a fourth variation in two noncommuting rotation directions. The resulting family inequality, combined with a range of spatial frequencies, controls a boundary twist on an annulus. The required small quantity is the probability that a sign cluster crosses that annulus.

The sign-cluster representation builds on several earlier constructions. Ginibre’s inequalities apply to the Ising and plane-rotator systems that arise after conditioning spin amplitudes #cite(label("Ginibre")). The Fortuin–Kasteleyn representation and Edwards–Sokal coupling relate ferromagnetic correlations to bond connectivity #cite(label("FortuinKasteleyn")) #cite(label("EdwardsSokal")); Wolff’s reflection construction embeds such an Ising sign system in a continuous-spin model #cite(label("Wolff")). For three components, Campbell and Chayes proved amplitude association, bond association, and boundary comparison, and expressed a spin correlation as amplitude-weighted connectivity #cite(label("CC")) Lemma 2 and Corollaries 1, 3, and 4. We prove the finite-graph forms needed here and implement the boundary comparison by pinning an arbitrary set of vertices simultaneously. The reduction from $n$ components to three uses the same spherical disintegration as the one-coordinate projection of Aru–Garban–Sepúlveda #cite(label("AGS")) Proposition 2.4.

=== 1.3 Proof strategy and organization <proof-strategy-and-organization>

We first work with three-component spins. On a finite graph, rotating spins by a spatially varying angle gives exact differentiation identities for the partition function. Two different rotation axes produce a response along their commutator axis. In Proposition 4, summing the fourth derivative over a family of test functions produces a nonnegative square plus controlled local terms. The error bounds account for interactions among the test functions; a suitable family will make those errors smaller than the collective rotation response. The bounds permit arbitrary prescribed boundary spins.

Section 3 tests this inequality on a square annulus whose boundary layers are pinned to two directions separated by an angle $t$. Signed frequency families produce a factor $log N$ in the commutator field when the annulus has inner radius $N$. Its quadratic response therefore gains $\( log N \)^2$, while the total error is only $O \( log N \)$. This yields a one-sided curvature bound for the positive, periodic boundary partition function $Z \( t \)$. Integrating from a maximum proves that $Z \( pi \) \/ Z \( 0 \) gt.eq 1 - O_beta \( 1 \/ log N \)$, uniformly over all retained vertices, edges, and strengths.

Section 4 converts this analytic estimate into exponential decay. The signs of one spin component form a ferromagnetic Ising system when its absolute values are fixed. Open bonds join equal signs, and their connected components carry independent signs. Pinning both annular layers to the same pole increases crossing probabilities; in the pinned system the crossing probability is exactly $1 - Z \( pi \) \/ Z \( 0 \)$. Pinning the boundaries of several disjoint annuli simultaneously makes their interiors independent. Thus the probability that all are crossed is bounded by a product of small probabilities. At one sufficiently large finite scale, a sum over coarse paths gives a positive exponential rate.

Finally, conditioning on all coordinates after the third leaves independent spherical reference directions in three dimensions and weakens each coupling by a factor in $\[ 0 \, 1 \]$. The already uniform three-component estimate survives this conditioning. This proves Theorem 1 for every integer $n gt.eq 3$ and then Corollary 2.

== 2 A fourth-order rotation estimate <sec:rotation>

The analytic input is a finite-graph inequality. Rotations about two different axes produce a second-order effective rotation about a third axis. A fourth variation of the partition function detects this effect; after summing a family of test functions, its potentially large terms form a nonnegative square. We establish the inequality with arbitrary fixed boundary spins, as needed for the annuli below.

=== 2.1 Gauge invariance and second variations <gauge-invariance-and-second-variations>

Local changes of spin variables underlie the Ward identities used in #cite(label("DriesslerLandauPerez")) #cite(label("AizenmanSimonWard")); we begin with the second-variation identity on a finite graph with prescribed spins.

Let $G = \( V \, E \)$ be a finite graph, with one orientation $e = \( x \, y \)$ chosen for each edge, and let $0 lt.eq b_e lt.eq beta$. Fix a set $P subset.eq V$ of vertices and arbitrary spins $s_x in S^2$ for $x in P$. At the remaining vertices, integrate against uniform probability measure on $S^2$, with normalized density proportional to $exp \( sum_(e = \( x \, y \)) b_e s_x^T s_y \)$. Write $chevron.l dot.op chevron.r$ for this expectation.

Let $a \, b \, c in frak(s o) \( 3 \)$ denote cross product with the first, second, and third coordinate vectors, respectively. Thus $\[ a \, b \] = c$, and their operator norms are one. For an edge field $A = \( A_e \)_(e in E)$ of skew matrices, put

#[#set math.equation(numbering: n => "(2.1)")
 $ H \( A \) & = sum_(e = \( x \, y \)) b_e s_x^T #scale(x: 120%, y: 120%)[\(] exp \( A_e \) - I #scale(x: 120%, y: 120%)[\)] s_y \,\
W \( A \) & = chevron.l exp H \( A \) #scale(x: 120%, y: 120%)[chevron.r] . $ <eq:rotation-partition>]

Thus $W$ is the ratio of the twisted partition function to the untwisted one. All derivatives below are evaluated at $A = 0$. Set $X = D H$ and $H_k = D^k H$ for $k = 2 \, 3 \, 4$. Compactness of the finite spin space permits differentiation under the integral. We extend all multilinear derivatives complex linearly in their arguments; changes of spin variables themselves will always use real rotations.

For a scalar function on vertices, define $d f \( e \) = f_y - f_x$. All scalar norms use counting measure on the indicated vertices or edges. For a matrix indexed by edges, $parallel T parallel_(upright("HS"))^2 = sum_(e \, l in E) \| T_(e l) \|^2$. For later use, the local derivative coefficients are

#[#set math.equation(numbering: n => "(2.2)")
 $ J_e \( g_1 \, dots.h \, g_k \) = b_e s_x^T (frac(1, k !) sum_(pi in frak(S)_k) g_(pi \( 1 \)) dots.h.c g_(pi \( k \))) s_y \, #h(2em) \| J_e \( g_1 \, dots.h \, g_k \) \| lt.eq beta \, $ <eq:rotation-local-coefficients>]

where each $g_r$ is one of $a \, b \, c$. Indeed, every matrix product in this average has operator norm at most one. Consequently

#[#set math.equation(numbering: n => "(2.3)")
 $ H_k \( v_1 g_1 \, dots.h \, v_k g_k \) = sum_e J_e \( g_1 \, dots.h \, g_k \) product_(r = 1)^k v_r \( e \) . $ <eq:rotation-local-expansion>]

The coefficients depend on the spins and the generators, but not on the scalar test functions. The same formula with $k = 1$ describes $X$.

Define the complex bilinear form

#[#set math.equation(numbering: n => "(2.4)")
 $ R \( h \, k \) = - D^2 W \( h c \, k c \) $ <eq:rotation-R-definition>]

on scalar edge forms. It is symmetric, but is not assumed to be positive semidefinite.

#thm([Lemma 2.1.])[
  (Gradient estimates).  #emph[If $f : V arrow.r bb(C)$ vanishes on $P$, then, for $g in { a \, b \, c }$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ chevron.l \| X \( \( d f \) g \) \|^2 #scale(x: 120%, y: 120%)[chevron.r] lt.eq beta parallel d f parallel_2^2 . $ <eq:rotation-gradient-bound>]

 For every complex edge form $h$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ R \( h \, macron(h) \) = - chevron.l H_2 \( h c \, macron(h) c \) + \| X \( h c \) \|^2 #scale(x: 120%, y: 120%)[chevron.r] lt.eq beta parallel h parallel_2^2 . $ <eq:rotation-R-bound>]

 Moreover, adding $d f$ in either argument of $R$ does not change its value whenever $f$ vanishes on $P$.]
] <lem:gradient>

#proof[
  For real $f$, make the change of variables $s_x^(upright("old")) = exp \( - t f_x g \) s_x^(upright("new"))$ at every integrated vertex. The fixed spins are unchanged because $f \|_P = 0$. Commutation of rotations about the same axis gives $W \( t \( d f \) g \) = 1$. Its second derivative at zero is
  $ 0 = chevron.l H_2 \( \( d f \) g \, \( d f \) g \) + X \( \( d f \) g \)^2 #scale(x: 120%, y: 120%)[chevron.r] . $
  The coefficient bound in (2.2) proves (2.5) for real $f$. For $f = f_1 + i f_2$, with $f_1 \, f_2$ real, the squared modulus of $X \( \( d f \) g \)$ is the sum of the squares for $f_1$ and $f_2$. Adding their bounds proves the complex case with the same constant.
  Differentiating (2.1) twice gives the equality in (2.6). The local term is bounded in absolute value by $beta parallel h parallel_2^2$, and the other term is nonnegative before its minus sign, proving the inequality. Finally, the same change of variables gives $W \( \( h + d f \) c \) = W \( h c \)$ for real $h \, f$. Differentiation in independent scalar multiples of $h$ and $d f$, followed by complex linear extension, gives $R \( h \, d f \) = R \( d f \, h \) = 0$. This proves the last assertion. ◻
]

=== 2.2 The family inequality <the-family-inequality>

For vertex functions $f \, g$, write

#[#set math.equation(numbering: n => "(2.7)")
 $ S \( f \, g \)_e = 1 / 2 \( f_x g_y - g_x f_y \) \, #h(2em) e = \( x \, y \) . $ <eq:rotation-S-definition>]

This form is bilinear and antisymmetric in $f \, g$.

#thm([Proposition 2.2.])[
  (Fourth-order rotation inequality).  #emph[Let $\( f_i \)_(i in I)$ be a finite family of complex vertex functions vanishing on $P$, and put 
$ u_i = d f_i \, #h(2em) T_(e l) = sum_(i in I) u_i \( e \) overline(u_i \( l \)) \, #h(2em) Q = sum_(i in I) S \( f_i \, macron(f)_i \) . $

 Then 
#[#set math.equation(numbering: n => "(2.8)")
 $ R \( Q \, macron(Q) \) & lt.eq K_(upright("rot")) \( beta \) parallel T parallel_(upright("HS"))^2\
 & quad + beta sum_(i \, j in I) min { parallel f_i parallel_oo^2 parallel d f_j parallel_2^2 \, parallel f_j parallel_oo^2 parallel d f_i parallel_2^2 #scale(x: 120%, y: 120%)[}] \, $ <eq:rotation-family-bound>]

 where 
#[#set math.equation(numbering: n => "(2.9)")
 $ K_(upright("rot")) \( beta \) = 6 beta^2 + 4 beta^(3 \/ 2) + beta . $ <eq:rotation-explicit-constant>]

 In particular, the constants are independent of the graph, the family size, and the values of the fixed spins.]
] <prop:fourth>

#proof[
  We first derive an exact identity relating the response $R$ to a fourth derivative of $W$, and sum it over the family. Gradient invariance will control the resulting cross terms; a nonnegative square will supply the remaining fourth-derivative lower bound.
  #emph[The noncommuting gauge identity.] Let $F_x$ be a real matrix potential in the span of $a \, b$, zero on $P$. The substitution $s_x^(upright("old")) = exp \( - F_x \) s_x^(upright("new"))$ gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ W \( d F \) = W \( B \) \, #h(2em) B_e = log #scale(x: 120%, y: 120%)[\(] exp \( F_x \) exp \( F_y - F_x \) exp \( - F_y \) #scale(x: 120%, y: 120%)[\)] $ <eq:rotation-nonabelian-gauge>]
  for $F$ sufficiently small. The product inside the logarithm is orthogonal and near the identity; hence its local logarithm is skew symmetric. The logarithm also commutes with conjugation. Multiplying the exponential series to degree two, and then taking the logarithm, gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ B_e = 1 / 2 \[ F_x \, F_y \] + O \( F^3 \) \, #h(2em) D B_e \( 0 \) = 0 . $ <eq:rotation-B-quadratic>]
  For directions $f a$ and $g b$, the mixed second derivative of $B_e$ is therefore $S \( f \, g \)_e c$; it is zero for two directions using the same generator.
  We also need a fourth-order cancellation. Take four independent parameters whose matrix directions have generator pattern $\( a \, b \, a \, b \)$, with arbitrary spatial potentials. The corresponding mixed fourth derivative of $B_e$ is zero. To see this, conjugate by the half-turn about the first axis. This fixes $a$ and negates $b$, so the coefficient involving all four parameters is fixed by conjugation: its two $b$-directions contribute two minus signs. Conjugation by the half-turn about the second axis likewise fixes this coefficient. On $frak(s o) \( 3 \)$, the fixed spaces of these two conjugations are respectively $bb(R) a$ and $bb(R) b$, with zero intersection. Thus
  #[#set math.equation(numbering: n => "(2.12)")
   $ D_1234 B_e = 0 quad upright("for the generator pattern ") \( a \, b \, a \, b \) . $ <eq:rotation-B-fourth>]
  Both (2.11) and (2.12) extend complex multilinearly. No complex change of spin variables is involved in this extension.
  For fixed $i \, j$, take the four edge directions
  #[#set math.equation(numbering: n => "(2.13)")
   $ A_1 = u_i a \, #h(2em) A_2 = macron(u)_i b \, #h(2em) A_3 = macron(u)_j a \, #h(2em) A_4 = u_j b . $ <eq:rotation-four-directions>]
  The fourth derivative of the composition in (2.10) has no term containing $D B$, by (2.11). Its term $D W \[ D_1234 B \]$ also vanishes, by (2.12). Only pairings of two second derivatives remain. The pairing $13 \| 24$ is zero because both pairs have the same generator. For the other two pairings, put $S_i = S \( f_i \, macron(f)_i \)$ and $S_(i j) = S \( f_i \, f_j \)$. Their arguments are
  $ 12 \| 34 : quad \( S_i c \, overline(S_j) c \) \, #h(2em) 14 \| 23 : quad \( S_(i j) c \, - overline(S_(i j)) c \) . $
  Here $S \( macron(f)_j \, f_j \) = overline(S_j)$ and $S \( macron(f)_j \, macron(f)_i \) = - overline(S_(i j))$. Each labeled pairing occurs once in the composition rule, so
  #[#set math.equation(numbering: n => "(2.14)")
   $ D^4 W \( A_1 \, A_2 \, A_3 \, A_4 \) = - R \( S_i \, overline(S_j) \) + R \( S_(i j) \, overline(S_(i j)) \) . $ <eq:rotation-fourth-identity>]
  This also holds when some spatial functions coincide: the derivative identity is multilinear in the four labeled directions.
  Summing over $i \, j$ and rearranging gives the identity to be estimated:
  #[#set math.equation(numbering: n => "(2.15)")
   $ R \( Q \, macron(Q) \) = sum_(i \, j) R \( S_(i j) \, overline(S_(i j)) \) - sum_(i \, j) D^4 W \( u_i a \, macron(u)_i b \, macron(u)_j a \, u_j b \) . $ <eq:rotation-response-balance>]
  We bound the first sum from above using gradient invariance, and the second from below by retaining a nonnegative square.
  #emph[The cross terms.] For functions $f \, g$ vanishing on $P$, the product $f g$ also vanishes there, and the edge identities
  #[#set math.equation(numbering: n => "(2.16)")
   $ S \( f \, g \) + 1 / 2 d \( f g \) & = 1 / 2 \( f_x + f_y \) thin d g \,\
S \( f \, g \) - 1 / 2 d \( f g \) & = - 1 / 2 \( g_x + g_y \) thin d f $ <eq:rotation-gradient-adjustment>]
  hold on $e = \( x \, y \)$. Applying gradient invariance in both arguments of $R$, followed by (2.6), gives
  #[#set math.equation(numbering: n => "(2.17)")
   $ R \( S \( f \, g \) \, overline(S \( f \, g \)) \) lt.eq beta min { parallel f parallel_oo^2 parallel d g parallel_2^2 \, parallel g parallel_oo^2 parallel d f parallel_2^2 } . $ <eq:rotation-cross-bound>]
  #emph[The fourth-derivative lower bound.] We claim that
  #[#set math.equation(numbering: n => "(2.18)")
   $ sum_(i \, j) D^4 W \( u_i a \, macron(u)_i b \, macron(u)_j a \, u_j b \) gt.eq - K_(upright("rot")) \( beta \) parallel T parallel_(upright("HS"))^2 . $ <eq:rotation-fourth-lower>]
  To enumerate its terms, set $X_r = X \( A_r \)$, and write $H_(r_1 dots.h.c r_k) = H_k \( A_(r_1) \, dots.h \, A_(r_k) \)$. Direct differentiation of $exp H$ gives all fifteen set partitions:
  #[#set math.equation(numbering: n => "(2.19)")
   $ D^4 W \( A_1 \, A_2 \, A_3 \, A_4 \) = chevron.l & X_1 X_2 X_3 X_4\
 & + H_12 X_3 X_4 + H_13 X_2 X_4 + H_14 X_2 X_3\
 & + H_23 X_1 X_4 + H_24 X_1 X_3 + H_34 X_1 X_2\
 & + H_12 H_34 + H_13 H_24 + H_14 H_23\
 & + H_123 X_4 + H_124 X_3 + H_134 X_2 + H_234 X_1\
 & + H_1234 #scale(x: 120%, y: 120%)[chevron.r] . $ <eq:rotation-fifteen-terms>]
  The four terms comprising $\( X_1 X_2 + H_12 \) \( X_3 X_4 + H_34 \)$, after summation over $i \, j$, have expectation
  #[#set math.equation(numbering: n => "(2.20)")
   $ ⟨lr(|sum_i #scale(x: 120%, y: 120%)[\[] X \( u_i a \) X \( macron(u)_i b \) + H_2 \( u_i a \, macron(u)_i b \) #scale(x: 120%, y: 120%)[\]]|)^2⟩ gt.eq 0 . $ <eq:rotation-positive-square>]
  We bound the other eleven terms in absolute value.
  For an edge $e$, let $t_e \( l \) = T_(e l)$ and $rho_e = \( sum_l \| T_(e l) \|^2 \)^(1 \/ 2)$, and abbreviate $X_g \( v \) = X \( v g \)$. Crucially,
  #[#set math.equation(numbering: n => "(2.21)")
   $ t_e = d (sum_i u_i \( e \) overline(f_i)) . $ <eq:rotation-row-gradient>]
  The potential on the right, and its conjugate, vanish on $P$. Lemma 3 therefore gives
  #[#set math.equation(numbering: n => "(2.22)")
   $ chevron.l \| X_g \( t_e \) \|^2 chevron.r lt.eq beta rho_e^2 \, #h(2em) chevron.l \| X_g \( macron(t)_e \) \|^2 chevron.r lt.eq beta rho_e^2 . $ <eq:rotation-row-bound>]
  The following table records every remaining contraction. Expand each $H_k$ using (2.3), sum over $i \, j$, and multiply the last two columns. One then sums over $e$, except in the two $H_2 H_2$ rows, where one sums over $e \, l$.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Term
], table.cell(rowspan: 1, colspan: 1)[Local coefficient
], table.cell(rowspan: 1, colspan: 1)[Contracted expression
]),
  table.cell(rowspan: 1, colspan: 1)[$H_13 X_2 X_4$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, a \)$
], table.cell(rowspan: 1, colspan: 1)[$X_b \( t_e \) X_b \( macron(t)_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_14 X_2 X_3$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$X_b \( t_e \) X_a \( t_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_23 X_1 X_4$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( b \, a \)$
], table.cell(rowspan: 1, colspan: 1)[$X_a \( macron(t)_e \) X_b \( macron(t)_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_24 X_1 X_3$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( b \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$X_a \( macron(t)_e \) X_a \( t_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_13 H_24$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, a \) J_l \( b \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e l) overline(T_(e l))$
],
  table.cell(rowspan: 1, colspan: 1)[$H_14 H_23$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, b \) J_l \( b \, a \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e l)^(thin 2)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_123 X_4$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, b \, a \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e e) X_b \( macron(t)_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_124 X_3$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, b \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e e) X_a \( t_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_134 X_2$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, a \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e e) X_b \( t_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_234 X_1$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( b \, a \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e e) X_a \( macron(t)_e \)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_1234$
], table.cell(rowspan: 1, colspan: 1)[$J_e \( a \, b \, a \, b \)$
], table.cell(rowspan: 1, colspan: 1)[$T_(e e)^(thin 2)$
],
)
]
  For example, the first row follows from
  $ & sum_(i \, j) u_i \( e \) macron(u)_j \( e \) X_b \( macron(u)_i \) X_b \( u_j \)\
 & #h(2em) = X_b (sum_i u_i \( e \) macron(u)_i) X_b (sum_j macron(u)_j \( e \) u_j) = X_b \( t_e \) X_b \( macron(t)_e \) . $
  The other rows follow by the same finite summation; their explicit expressions distinguish the conjugated and unconjugated contractions.
  For each of the first four rows, the pointwise coefficient bound and Cauchy–Schwarz, followed by (2.22), give an absolute expectation at edge $e$ of at most $beta^2 rho_e^2$. The coefficient may depend on the spins; its pointwise absolute value is bounded before applying Cauchy–Schwarz. These four rows contribute at most $4 beta^2 parallel T parallel_(upright("HS"))^2$. The next two rows contribute at most $2 beta^2 parallel T parallel_(upright("HS"))^2$, since both contractions have absolute value $\| T_(e l) \|^2$.
  For each of the four $H_3 X$ rows, (2.22) bounds the total absolute expectation by
  $ beta^(3 \/ 2) sum_e T_(e e) rho_e lt.eq beta^(3 \/ 2) (sum_e T_(e e)^2)^(1 \/ 2) (sum_e rho_e^2)^(1 \/ 2) lt.eq beta^(3 \/ 2) parallel T parallel_(upright("HS"))^2 . $
  Here $T_(e e) = sum_i \| u_i \( e \) \|^2 gt.eq 0$, and the squared diagonal entries form part of the Hilbert–Schmidt sum. The last row is bounded by $beta sum_e T_(e e)^2 lt.eq beta parallel T parallel_(upright("HS"))^2$.
  Finally, the sum on the left of (2.18) is real: complex conjugation interchanges $i \, j$ and permutes the arguments of the symmetric fourth derivative. Keeping the nonnegative square (2.20), and subtracting the bounds for the remaining terms, proves (2.18) with exactly $K_(upright("rot")) \( beta \)$ from (2.9).
  Combining (2.17) and (2.18) in (2.15) proves (2.8). Only the upper bound and gradient invariance of $R$ were used; no positivity property of $R$ is required. ◻
]

== 3 A uniform estimate for an annular twist <sec:annulus>

We apply the fourth-variation estimate to an annulus with two prescribed boundary directions. The aim is to bound uniformly how much its partition function changes when one boundary direction rotates. The spatial tests will be defined on the full annulus and then restricted to the retained graph. In this section, $C$ denotes a finite constant depending only on the fixed smooth profiles, and $C_beta$ may also depend on $beta$; these constants may increase from one estimate to the next.

For an integer $N gt.eq 2$, let

$ D_N = { x in bb(Z)^2 : N lt.eq parallel x parallel_oo lt.eq 2 N } . $

Let $G = \( V \, E \)$ be any subgraph of the nearest-neighbor graph on $D_N$, and orient each edge in a positive coordinate direction. Give its edges strengths $0 lt.eq b_e lt.eq beta$. Put $s_(*) = \( 1 \, 0 \, 0 \)$ and prescribe

$ s_x = exp \( t c \) s_(*) quad \( parallel x parallel_oo = N \) \, #h(2em) s_x = s_(*) quad \( parallel x parallel_oo = 2 N \) quad \( x in V \) . $

All other spins are integrated against uniform probability measure on $S^2$. Write $Z \( t \)$ for the resulting partition integral, including the interactions between any prescribed spins. Missing vertices on either boundary require no additional convention: only vertices of $V$ are pinned.

#thm([Proposition 3.1.])[
  (Vanishing annular twist cost).  #emph[For every finite $beta > 0$ there is a finite constant $C_beta$ such that, for all $N gt.eq 2$ and all graphs and strengths just described, 
#[#set math.equation(numbering: n => "(3.1)")
 $ frac(min_(t in bb(R)) Z \( t \), max_(t in bb(R)) Z \( t \)) gt.eq 1 - frac(C_beta, log N) . $ <eq:annulus-minmax>]

 In particular, 
#[#set math.equation(numbering: n => "(3.2)")
 $ frac(Z \( pi \), Z \( 0 \)) gt.eq 1 - frac(C_beta, log N) . $ <eq:annulus-ratio>]

 The constant is independent of the subgraph, the strength array, and the twist parameter.]
] <prop:annulus>

=== 3.1 Boundary gauge and multiscale tests <boundary-gauge-and-multiscale-tests>

Fix once and for all a real smooth function $Theta$ equal to one in a neighborhood of $\[ - 1 \, 1 \]^2$ and compactly supported in $\( - 2 \, 2 \)^2$. Define the real edge form

#[#set math.equation(numbering: n => "(3.3)")
 $ h_e = Theta \( y \/ N \) - Theta \( x \/ N \) \, #h(2em) e = \( x \, y \) . $ <eq:annulus-h>]

Use a subscript $t$ on $W \, X \, H_k \, R$ for the quantities from the preceding section evaluated with these boundary values, and write $chevron.l thin dot.op thin chevron.r_t$ for the corresponding expectation. Although $Theta$ does not vanish on the inner pinned layer, its gauge action is still explicit:

#[#set math.equation(numbering: n => "(3.4)")
 $ W_t \( s h c \) = frac(Z \( t + s \), Z \( t \)) \, #h(2em) R_t \( h \, h \) = - frac(Z'' \( t \), Z \( t \)) . $ <eq:annulus-boundary-gauge>]

Indeed, substituting $s_x^(upright("old")) = exp \( - s Theta \( x \/ N \) c \) s_x^(upright("new"))$ cancels every edge matrix. It changes the inner boundary value to $exp \( \( t + s \) c \) s_(*)$ and leaves the outer value unchanged. Thus the gauge changes the prescribed boundary values, rather than treating them as integrated variables.

The analytic target is now an upper bound of order $1 \/ log N$ for $R_t \( h \, h \)$. We will construct functions whose collective form $sum_i S \( f_i \, overline(f_i) \)$ equals $- i lambda_N tilde(h)$, where $lambda_N gt.eq 1 / 2 log N$ and $tilde(h)$ approximates $h$. The two family costs in Proposition 4 will total $O \( log N \)$, whereas bilinearity multiplies $R_t \( tilde(h) \, tilde(h) \)$ by $lambda_N^2$. This yields the required logarithmic gain; after constructing the family, we will transfer the bound from $tilde(h)$ to $h$ without assuming that $R_t$ is positive.

For $m = 1 \, 2$, put $g_m = partial_m Theta$. Choose a real smooth cutoff $chi_m$ compactly supported in

$ cal(A) = { z in bb(R)^2 : 1 < parallel z parallel_oo < 2 } $

and equal to one on $"supp" g_m$. Such a cutoff exists because $g_m$ vanishes near both boundary squares. The real profiles

#[#set math.equation(numbering: n => "(3.5)")
 $ phi.alt_(m \, +) = frac(chi_m + g_m, 2) \, #h(2em) phi.alt_(m \, -) = frac(chi_m - g_m, 2) quad upright("satisfy") quad phi.alt_(m \, +)^2 - phi.alt_(m \, -)^2 = g_m . $ <eq:annulus-profiles>]

This construction uses no square root of a signed smooth function. All four profiles have compact support in $cal(A)$. Figure 1 shows how these supports lie between the two pinned layers.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({rect((-1.691, -1.691), (1.691, 1.691), fill: rgb("#ececec"), stroke: none); line((1.691, 1.691), (-1.159, -1.159)); rect((-1.159, -1.159), (1.159, 1.159), fill: rgb("#ececec"), stroke: none)}, fill: rgb("#ececec"), fill-rule: "even-odd", stroke: none)
  rect((-1.9, -1.9), (1.9, 1.9), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.95, -0.95), (0.95, 0.95), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$\|x\|_ infinity <N$]])
  content((0, 1.976), [outer layer: $s_x=s_*$], anchor: "south", padding: 0.1176cm)
  line((0.95, -0.3325), (2.565, -0.3325), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.641, -0.3325), [inner layer:#linebreak()$s_x= exp ("tc")s_*$], anchor: "west", padding: 0.1176cm)
  line((1.425, 1.406), (2.565, 1.406), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.641, 1.406), [compact support#linebreak()of the test profiles], anchor: "west", padding: 0.1176cm)
  line((-1.9, -2.232), (1.9, -2.232), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((0, -2.232), [#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$4N$]])])
})],
  caption: [Figure 1: The boundary twist is tested using profiles supported strictly between the pinned squares. The shaded region is schematic: one fixed compact subannulus contains all four profile supports. The estimates remain valid when arbitrary vertices and edges are deleted. ],
) <fig:annulus-tests>

For $p in bb(Z)^2$ let $r_p = parallel p parallel_oo$. Introduce four groups of vertex functions, restricted to $V$:

#[#set math.equation(numbering: n => "(3.6)")
 $ f_(m \, plus.minus \, p) \( x \) = r_p^(- 3 \/ 2) phi.alt_(m \, plus.minus) \( x \/ N \) exp (frac(2 pi i thin p dot.op x, 16 N)) \, #h(2em) 1 lt.eq r_p lt.eq N \, quad plus.minus p_m > 0 . $ <eq:annulus-modes>]

They vanish at every pinned vertex. The power $r_p^(- 3 \/ 2)$ is chosen to produce a harmonic sum: the shell face $p_m = plus.minus r$ contains $2 r + 1$ modes, each with squared normalization $r^(- 3)$ and coordinate-$m$ phase increment of order $r \/ N$. Its summed frequency factor in the commutator is therefore of order $1 \/ \( N r \)$. The opposite frequency signs give the adjacent-point products of $phi.alt_(m \, +)$ and $phi.alt_(m \, -)$ opposite coefficients. Index this finite family by $i$, write $u_i = d f_i$, and, as in Proposition 4, put

$ T_(e ell) = sum_i u_i \( e \) overline(u_i \( ell \)) \, #h(2em) S \( f \, g \)_e = 1 / 2 \( f_x g_y - g_x f_y \) . $

For an edge $e = \( x \, x + e_m \)$ define

#[#set math.equation(numbering: n => "(3.7)")
 $ tilde(h)_e = 1 / N [phi.alt_(m \, +) \( x \/ N \) phi.alt_(m \, +) \( \( x + e_m \) \/ N \) - phi.alt_(m \, -) \( x \/ N \) phi.alt_(m \, -) \( \( x + e_m \) \/ N \)] . $ <eq:annulus-htilde>]

#thm([Lemma 3.2.])[
  (The multiscale family).  #emph[There is a constant $C$, depending only on the fixed profiles, with the following properties for every $N gt.eq 2$ and every such subgraph. First, 
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_i S \( f_i \, overline(f_i) \) = - i lambda_N tilde(h) \, #h(2em) lambda_N = N #h(-0.16667em) #h(-0.16667em) sum_(1 lt.eq r_p lt.eq N\
p_1 > 0) r_p^(- 3) sin (frac(2 pi p_1, 16 N)) gt.eq 1 / 2 sum_(r = 1)^N 1 / r . $ <eq:annulus-commutator>]

 Second, 
#[#set math.equation(numbering: n => "(3.9)")
 $ parallel h parallel_2 lt.eq C \, #h(2em) parallel h + tilde(h) parallel_oo lt.eq C / N \, #h(2em) parallel h - tilde(h) parallel_1 lt.eq C / N . $ <eq:annulus-midpoint>]

 Finally, 
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel T parallel_(upright("HS"))^2 + sum_(i \, j) min {parallel f_i parallel_oo^2 parallel d f_j parallel_2^2 \, parallel f_j parallel_oo^2 parallel d f_i parallel_2^2} lt.eq C \( 1 + log N \) . $ <eq:annulus-test-cost>]

 All edge norms use counting measure on $E$.]
] <lem:modes>

#proof[
  For a real profile $phi.alt$ and one mode on shell $r_p$, direct substitution on a positive coordinate-$j$ edge gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ S \( f_p \, overline(f_p) \)_e = - i r_p^(- 3) phi.alt \( x \/ N \) phi.alt \( \( x + e_j \) \/ N \) sin (frac(2 pi p_j, 16 N)) . $ <eq:annulus-one-mode>]
  If the group is indexed by $m eq.not j$, its frequency set is invariant under $p_j mapsto - p_j$, so its sum vanishes. For $m = j$, the negative half-plane gives the negative of the positive-half-plane sine sum. Interchanging coordinates identifies the positive sums for $j = 1 \, 2$. This proves the identity in (3.8).
  On shell $r$, retain only the $2 r + 1$ frequencies with $p_1 = r$ and $\| p_2 \| lt.eq r$. Since
  $ sin (frac(pi r, 8 N)) gt.eq frac(r, 4 N) #h(2em) \( 1 lt.eq r lt.eq N \) \, $
  their contribution to $lambda_N$ is at least $\( 2 r + 1 \) \/ \( 4 r^2 \) gt.eq 1 \/ \( 2 r \)$. This gives its asserted lower bound.
  For an edge in direction $m$, let $z = \( x + y \) \/ \( 2 N \)$. Centered Taylor expansion, with uniform bounds on the fixed smooth functions, gives
  $ h_e = N^(- 1) partial_m Theta \( z \) + O \( N^(- 3) \) \, #h(2em) phi.alt \( x \/ N \) phi.alt \( y \/ N \) = phi.alt \( z \)^2 + O \( N^(- 2) \) . $
  Using (3.5) yields $\| h_e - tilde(h)_e \| lt.eq C N^(- 3)$. There are $O \( N^2 \)$ annulus edges, and $\| h_e \| + \| tilde(h)_e \| lt.eq C \/ N$. The three estimates in (3.9) follow, also after restriction to $E$.
  For a mode on shell $r$, the product rule for a discrete difference and $\| e^(i v) - 1 \| lt.eq \| v \|$ give
  #[#set math.equation(numbering: n => "(3.12)")
   $ parallel f_i parallel_oo lt.eq C r^(- 3 \/ 2) \, #h(2em) parallel d f_i parallel_2 lt.eq C r^(- 3 \/ 2) \( 1 + r \) lt.eq C' r^(- 1 \/ 2) . $ <eq:annulus-mode-norms>]
  There are $O \( r \)$ modes on shell $r$, including all four groups. For shells $s lt.eq r$, choose the bound in the minimum that uses the supremum norm of the shell-$r$ mode. The cost of a pair is at most $C r^(- 3) s^(- 1)$; all $O \( r s \)$ pairs therefore cost at most $C r^(- 2)$. Summing both shell orderings gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ sum_(i \, j) min {parallel f_i parallel_oo^2 parallel d f_j parallel_2^2 \, parallel f_j parallel_oo^2 parallel d f_i parallel_2^2} lt.eq C sum_(r = 1)^N sum_(s = 1)^r r^(- 2) lt.eq C' \( 1 + log N \) . $ <eq:annulus-minimum-sum>]
  It remains to bound $T$. Applying the triangle inequality mode by mode would give only $parallel T parallel_(upright("HS")) lt.eq sum_i parallel d f_i parallel_2^2 = O \( N \)$; we use Fourier orthogonality for the sharper bound. Work first in a single profile group and let $U$ be the matrix whose $p$-th column is $r_p^(1 \/ 2) d f_p$. Embed the annulus in the discrete torus $Q_N = \( bb(Z) \/ \( 16 N \) bb(Z) \)^2$. Its representatives may be chosen in $\[ - 8 N \, 8 N - 1 \]^2$; all profiles vanish near the boundary of this square, so they also define torus functions. Let $F$ have columns
  $ F_(x \, p) = exp (frac(2 pi i thin p dot.op x, 16 N)) \, #h(2em) x in Q_N \, $
  using the frequencies of this group. They are distinct modulo $16 N$, and orthogonality of these unnormalized waves gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ F^(*) F = \( 16 N \)^2 I \, #h(2em) parallel F parallel_(upright("op")) = 16 N . $ <eq:annulus-fourier-norm>]
  For direction $j$, let $P_j$ restrict functions on $Q_N$ to the origins of the coordinate-$j$ edges in $E$. Let $M_v$ denote multiplication by $v$ on $Q_N$, and set
  $ Delta_j phi.alt \( x \) = phi.alt \( \( x + e_j \) \/ N \) - phi.alt \( x \/ N \) \, #h(2em) phi.alt^(\( j \)) \( x \) = phi.alt \( \( x + e_j \) \/ N \) . $
  The directional block of $U$ has the exact factorization
  #[#set math.equation(numbering: n => "(3.15)")
   $ U_j =  & P_j M_(Delta_j phi.alt) F "diag" \( r_p^(- 1) \)\
 & + P_j M_(phi.alt^(\( j \))) F "diag" (frac(exp \( 2 pi i p_j \/ \( 16 N \) \) - 1, r_p)) . $ <eq:annulus-operator-factorization>]
  Here $parallel P_j parallel_(upright("op")) lt.eq 1$, $parallel Delta_j phi.alt parallel_oo lt.eq C \/ N$, and the last diagonal factor has operator norm at most $C \/ N$, since $\| p_j \| lt.eq r_p$. Equation (3.14) now gives $parallel U_j parallel_(upright("op")) lt.eq C$ and hence $parallel U parallel_(upright("op")) lt.eq C$ after combining the two directions.
  The contribution of this group is
  $ T_(upright("group")) = U "diag" \( r_p^(- 1) \) U^(*) . $
  The finite-matrix inequality $parallel A D B parallel_(upright("HS")) lt.eq parallel A parallel_(upright("op")) parallel D parallel_(upright("HS")) parallel B parallel_(upright("op"))$ therefore implies
  $ parallel T_(upright("group")) parallel_(upright("HS"))^2 lt.eq C sum_p r_p^(- 2) lt.eq C' sum_(r = 1)^N r thin r^(- 2) lt.eq C'' \( 1 + log N \) . $
  The triangle inequality over the four groups gives the same order for $parallel T parallel_(upright("HS"))^2$. Together with (3.13), this proves (3.10). ◻
]

=== 3.2 From the test form to the boundary twist <from-the-test-form-to-the-boundary-twist>

#proof[
  Apply Proposition 4 in the law with twist $t$, using the family (3.6). The left side is
  $ R_t \( - i lambda_N tilde(h) \, i lambda_N tilde(h) \) = lambda_N^2 R_t \( tilde(h) \, tilde(h) \) \, $
  because $R_t$ is bilinear and $tilde(h)$ is real. Lemma 6 gives, uniformly in $t$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ R_t \( tilde(h) \, tilde(h) \) lt.eq frac(C_beta \( 1 + log N \), \( log N \)^2) lt.eq frac(C'_beta, log N) . $ <eq:annulus-tested-response>]
  We must transfer this upper bound to $h$ without treating $R_t$ as a positive form. If $R_t \( h \, h \) lt.eq 0$, the desired positive upper bound already holds. Otherwise, the defining second-derivative identity and the pointwise bound on $H_(2 \, t)$ give
  #[#set math.equation(numbering: n => "(3.17)")
   $ chevron.l X_t \( h c \)^2 chevron.r_t < - chevron.l H_(2 \, t) \( h c \, h c \) chevron.r_t lt.eq beta parallel h parallel_2^2 lt.eq C beta . $ <eq:annulus-current-control>]
  Put $d = h - tilde(h)$. The current is a real random variable on real edge forms, and
  $ \| X_t \( d c \) \| lt.eq beta parallel d parallel_1 lt.eq frac(C beta, N) . $
  Consequently ordinary Cauchy–Schwarz for random variables, followed by (3.17), yields
  #[#set math.equation(numbering: n => "(3.18)")
   $ lr(|chevron.l X_t \( h c \)^2 - X_t \( tilde(h) c \)^2 chevron.r_t|) & lt.eq 2 chevron.l X_t \( h c \)^2 chevron.r_t^(1 \/ 2) parallel X_t \( d c \) parallel_oo + parallel X_t \( d c \) parallel_oo^2\
 & lt.eq C_beta / N . $ <eq:annulus-current-error>]
  The local quadratic term satisfies the stronger pointwise bound
  #[#set math.equation(numbering: n => "(3.19)")
   $ \| H_(2 \, t) \( h c \, h c \) - H_(2 \, t) \( tilde(h) c \, tilde(h) c \) \| & lt.eq beta sum_(e in E) \| d_e \| thin \| h_e + tilde(h)_e \|\
 & lt.eq frac(C beta, N^2) . $ <eq:annulus-local-error>]
  Equations (3.16)–(3.19) and the formula for $R_t$ imply in both cases that
  #[#set math.equation(numbering: n => "(3.20)")
   $ - frac(Z'' \( t \), Z \( t \)) = R_t \( h \, h \) lt.eq frac(C_beta, log N) + C_beta / N lt.eq delta_N \, #h(2em) delta_N = frac(C'_beta, log N) . $ <eq:annulus-ode>]
  All constants are independent of the boundary twist, the retained vertices and edges, and the admissible strengths.
  Finally, $Z$ is positive, smooth, and $2 pi$-periodic. Set $M = max_t Z \( t \)$ and choose $t_0$ with $Z \( t_0 \) = M$. Then $Z' \( t_0 \) = 0$, and (3.20) implies $Z'' \( t \) gt.eq - delta_N Z \( t \) gt.eq - delta_N M$. For any $t$, choose an orientation $epsilon.alt in { - 1 \, 1 }$ and $0 lt.eq ell lt.eq pi$ with $t = t_0 + epsilon.alt ell$ modulo $2 pi$. Twice integrating the second-derivative bound for $v mapsto Z \( t_0 + epsilon.alt v \)$ gives
  $ Z \( t \) gt.eq M - frac(delta_N M ell^2, 2) gt.eq M (1 - frac(pi^2 delta_N, 2)) . $
  Taking the minimum and enlarging $C_beta$ proves (3.1). Since $Z \( pi \) \/ Z \( 0 \) gt.eq min Z \/ max Z$, it also proves (3.2). ◻
]

== 4 Sign clusters and exponential decay <sec:clusters>

We now turn the uniform annulus estimate into a bound on connections. The argument uses sign clusters, of the type studied for continuous-spin systems in #cite(label("CC")). We prove the finite-volume comparison statements needed here, including the comparison with pinned spins.

We return to the free spin law (1.1) and its expectation $chevron.l dot.op chevron.r_(G \, b)^(\( n \))$, now on an arbitrary finite graph $G = \( V \, E \)$ with strengths $b_e in \[ 0 \, beta \]$. Until the final subsection, $n = 3$ and we write the spins as $s_x$.

=== 4.1 An associated amplitude and bond law <an-associated-amplitude-and-bond-law>

Write

#[#set math.equation(numbering: n => "(4.1)")
 $ s_x = \( r_x tau_x \, q_x cos theta_x \, q_x sin theta_x \) \, #h(2em) q_x = \( 1 - r_x^2 \)^(1 \/ 2) . $ <eq:spin-disintegration>]

Under the reference measure, the variables $r_x$, $tau_x$, and $theta_x$ are independent and uniform on $\[ 0 \, 1 \]$, ${ - 1 \, 1 }$, and $bb(R) \/ \( 2 pi bb(Z) \)$, respectively. Indeed, the first coordinate of a uniform point on $S^2$ is uniform on $\[ - 1 \, 1 \]$, independently of its azimuthal angle. Conditional on all the amplitudes $r = \( r_x \)_(x in V)$, the signs and angles are independent Gibbs systems with respective couplings

#[#set math.equation(numbering: n => "(4.2)")
 $ K_(x y) = b_(x y) r_x r_y \, #h(2em) L_(x y) = b_(x y) q_x q_y . $ <eq:amplitude-couplings>]

Their edge energies are $tau_x tau_y$ and $cos \( theta_x - theta_y \)$. Let $Z_I \( K \)$ and $Z_P \( L \)$ denote their partition functions, using uniform probability reference measures. The amplitude density is therefore proportional to

#[#set math.equation(numbering: n => "(4.3)")
 $ rho \( r \) = Z_I \( K \( r \) \) Z_P \( L \( r \) \) . $ <eq:amplitude-density>]

We now use the embedded Ising representation underlying Wolff’s reflection clusters #cite(label("Wolff")), coupled to bonds as in Edwards–Sokal #cite(label("EdwardsSokal")). Given the spins, sample bonds $eta_e in { 0 \, 1 }$ independently. For $e = { x \, y }$, set

#[#set math.equation(numbering: n => "(4.4)")
 $ p_e = 1 - e^(- 2 K_e) \, #h(2em) bb(P) \( eta_e = 1 divides s \) = p_e upright(bold(1))_({ tau_x = tau_y }) . $ <eq:bond-parameter>]

The elementary identity

#[#set math.equation(numbering: n => "(4.5)")
 $ e^(K_e tau_x tau_y) = e^(K_e) #scale(x: 120%, y: 120%)[\[] \( 1 - p_e \) + p_e upright(bold(1))_({ tau_x = tau_y }) #scale(x: 120%, y: 120%)[\]] $ <eq:ising-bond-expansion>]

shows that, conditional on $r \, eta$, the signs are independent fair signs on the open connected components. In particular, we obtain the weighted connection identity of Campbell and Chayes #cite(label("CC")) Corollary 4, Equation (7):

#[#set math.equation(numbering: n => "(4.6)")
 $ chevron.l s_x^1 s_y^1 chevron.r_(G \, b)^(\( 3 \)) = bb(E) #scale(x: 120%, y: 120%)[\[] r_x r_y upright(bold(1))_({ x arrow.l.r y }) #scale(x: 120%, y: 120%)[\]] \, $ <eq:spin-connection>]

where the connection uses only open edges of $G$.

To bound these connections, we will show that fixing any set of spins at $\( 1 \, 0 \, 0 \)$ cannot decrease the probability of an increasing bond event. We will apply this comparison to simultaneous annulus crossings. Its proof uses association jointly in amplitudes and bonds, because the pinning condition constrains amplitudes as well as cluster signs.

We use a finite-product version of the Fortuin–Kasteleyn–Ginibre association criterion #cite(label("FKG")), allowing both discrete and continuous coordinates, and include its proof. A probability law on a coordinatewise ordered product is #emph[associated] if the covariance of any two bounded increasing functions is nonnegative. A positive function $w$ is #emph[log-supermodular] if

$ w \( u or v \) w \( u and v \) gt.eq w \( u \) w \( v \) \, $

where join and meet are taken coordinatewise.

#thm([Lemma 4.1.])[
  #emph[Let $w$ be a positive log-supermodular density on a finite product of compact intervals or finite chains, with respect to the product of Lebesgue or counting measures. In the interval case, suppose $w$ is continuous. The probability law proportional to $w$ is associated. Moreover, its conditional law on all but one coordinate increases stochastically as the remaining coordinate increases.]
] <lem:association>

#proof[
  For one coordinate, association follows by taking independent copies $X \, X'$ and writing
  $ 2 "Cov" \( F \( X \) \, H \( X \) \) = bb(E) #scale(x: 120%, y: 120%)[\[] \( F \( X \) - F \( X' \) \) \( H \( X \) - H \( X' \) \) #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $
  Proceed by induction on the number of coordinates. Write a point as $\( u \, t \)$, with $t$ the final coordinate. Each conditional density $w \( u \, t \)$ is log-supermodular in $u$, and its law is associated by induction. For $t' gt.eq t$, log-supermodularity implies that $w \( u \, t' \) \/ w \( u \, t \)$ is increasing in $u$: apply the defining inequality to $\( u \, t' \)$ and $\( v \, t \)$ when $u lt.eq v$. Tilting the conditional law at $t$ by this increasing likelihood ratio, and applying its association, shows that the conditional law at $t'$ stochastically dominates it. The ratios are bounded in the continuous case by positivity and compactness.
  If $F \( u \, t \)$ and $H \( u \, t \)$ are increasing, their conditional expectations are consequently increasing functions of $t$. The decomposition
  $ "Cov" \( F \, H \) = bb(E) #scale(x: 120%, y: 120%)[\[] "Cov" \( F \, H divides t \) #scale(x: 120%, y: 120%)[\]] + "Cov" #scale(x: 120%, y: 120%)[\(] bb(E) \[ F divides t \] \, bb(E) \[ H divides t \] #scale(x: 120%, y: 120%)[\)] $
  has nonnegative terms by induction and the one-coordinate case. This proves both assertions. ◻
]

The following restricted correlation inequalities are the Ising and plane-rotator cases of the method of Ginibre #cite(label("Ginibre")). Their scope is important: no such inequality for the full vector-spin law is assumed.

#thm([Lemma 4.2.])[
  #emph[In either the free Ising or the free planar system on a finite graph with nonnegative couplings, every edge energy has nonnegative mean, and any two edge energies have nonnegative covariance.]
] <lem:edge-correlation-inequalities>

#proof[
  The mean inequality follows by expanding the Gibbs exponential. For Ising spins, every reference moment of a sign monomial is either zero or one. For planar spins, each cosine of an angle difference has nonnegative Fourier coefficients, so every product of such cosines has a nonnegative constant Fourier coefficient.
  For covariances, take two independent copies of the Gibbs system. If $T_e$ and $T_f$ are two edge energies and primes denote the second copy, then
  #[#set math.equation(numbering: n => "(4.7)")
   $ 2 "Cov" \( T_e \, T_f \) = bb(E) #scale(x: 120%, y: 120%)[\[] \( T_e - T'_e \) \( T_f - T'_f \) #scale(x: 120%, y: 120%)[\]] . $ <eq:doubled-covariance>]
  In the planar reference integral, make the substitution $theta = phi + psi$, $theta' = phi - psi$ modulo $2 pi$. Independent uniform $phi \, psi$ produce independent uniform $theta \, theta'$: this is a surjective homomorphism of compact tori, and therefore preserves Haar probability. For an oriented edge $g$, write $phi_g = phi_x - phi_y$, and similarly for $psi_g$. The doubled density numerator becomes
  $ exp (2 sum_(g in E) L_g cos phi_g cos psi_g) \, #h(2em) T_e - T'_e = - 2 sin phi_e sin psi_e . $
  Consequently the unnormalized numerator on the right of (4.7) is
  $ 4 sum_(a in bb(N)_0^E) (product_(g in E) frac(\( 2 L_g \)^(a_g), a_g !)) (integral sin phi_e sin phi_f product_(g in E) \( cos phi_g \)^(a_g) thin upright(d) phi)^2 gt.eq 0 \, $
  where the integral uses product Haar probability. Each integral is real; the possible multiplicity of the torus map introduces no factor because the measures are probabilities.
  For Ising reference signs $d \, d'$, set $u = \( d + d' \) \/ 2$ and $v = \( d - d' \) \/ 2$ at each site. Their sitewise values are $\( 1 \, 0 \) \, \( - 1 \, 0 \) \, \( 0 \, 1 \) \, \( 0 \, - 1 \)$, with equal probabilities. Every mixed monomial in $u \, v$ has nonnegative expectation: a monomial involving positive powers of both vanishes, an odd pure moment vanishes, and an even pure moment is nonnegative. The doubled density is
  $ exp (2 sum_(g = { x \, y }) K_g \( u_x u_y + v_x v_y \)) \, $
  and an edge-energy difference is $2 \( u_x v_y + v_x u_y \)$. Expanding the exponential and the product of two differences gives only nonnegative coefficients multiplying nonnegative reference moments. All expansions above are absolutely integrable on the finite products, proving the covariance assertion. ◻
]

The next result is the finite-graph amplitude association established by Campbell and Chayes #cite(label("CC")) Lemma 2. We include its proof because both its sign structure and its boundary-free hypothesis matter below.

#thm([Lemma 4.3.])[
  #emph[The amplitude law with density (4.3) is associated.]
] <lem:amplitude-association>

#proof[
  For either partition function, with couplings $J_e \( r \)$ and edge energies $T_e$, differentiation in distinct site variables $r_x \, r_y$ gives
  $ partial_x partial_y log Z \( J \( r \) \) & = sum_e chevron.l T_e chevron.r thin partial_x partial_y J_e\
 & quad + sum_(e \, f) "Cov" \( T_e \, T_f \) \( partial_x J_e \) \( partial_y J_f \) . $
  For $J = K$, the first derivatives are nonnegative. For $J = L$, they are nonpositive, so the products in the second sum are again nonnegative. The distinct-site mixed derivatives of individual couplings vanish unless $e = { x \, y }$, in which case
  $ partial_x partial_y K_(x y) = b_(x y) \, #h(2em) partial_x partial_y L_(x y) = b_(x y) frac(r_x r_y, q_x q_y) gt.eq 0 $
  in the open amplitude cube. Lemma 8 therefore shows that every distinct-site mixed derivative of $log rho$ is nonnegative there. An increment of $log rho$ in one coordinate is thus nondecreasing in every other coordinate. For two points $u \, v$, compare the successive increments from $u and v$ to $u$ with the same coordinate increments from $v$ to $u or v$. Their sum gives the log-supermodular inequality in the open cube, and continuity extends it to the closed cube. The possible singularity of derivatives at $r_x = 1$ is immaterial. The density itself is positive and continuous, so Lemma 7 applies. ◻
]

The conditioning argument used for bond association in Campbell–Chayes #cite(label("CC")) Corollary 1 also gives the following joint statement.

#thm([Lemma 4.4.])[
  #emph[The joint free law of $r$ and $eta$ is associated, with both amplitudes and bond indicators ordered coordinatewise.]
] <lem:joint-association>

#proof[
  Conditional on $r$, summing the signs in (4.5) gives a bond weight proportional to
  #[#set math.equation(numbering: n => "(4.8)")
   $ 2^(k \( eta \)) product_(e in E) p_e^(eta_e) \( 1 - p_e \)^(1 - eta_e) \, $ <eq:conditional-fk-weight>]
  where $k \( eta \)$ counts all open components, including singletons. The function $k$ is supermodular: the change on opening an edge is $- 1$ if its endpoints were disconnected and $0$ otherwise, and this change increases as other bonds are opened. Hence the weight is log-supermodular and its law is associated by Lemma 7. Increasing any nondegenerate parameter $p_e$ tilts the weight by an increasing likelihood ratio. Association therefore implies stochastic increase of the conditional bond law in each $p_e$, and consequently in $r$. A zero parameter forces its edge closed; restriction to the remaining edges, or continuity, handles these degenerate cases.
  For bounded increasing functions $F \( r \, eta \)$ and $H \( r \, eta \)$, conditional association makes $bb(E) \[ "Cov" \( F \, H divides r \) \]$ nonnegative. Their conditional means are increasing in $r$, by stochastic monotonicity of the bond law and their direct monotonicity in $r$. Their covariance is nonnegative by Lemma 9. The total covariance identity proves the claim. ◻
]

=== 4.2 Pinning and crossings <pinning-and-crossings>

Let $s_(*) = \( 1 \, 0 \, 0 \)$. For any set $B subset.eq V$, the pinned spin law means that $s_x = s_(*)$ for $x in B$, while all other spins retain uniform reference measures and the same edge interactions. Bonds are sampled by the same rule (4.4).

#thm([Proposition 4.5.])[
  (Pinning comparison).  #emph[For the three-component free spin law on any finite graph with nonnegative strengths, and bonds sampled by (4.4), pinning any set of spins to $s_(*)$ cannot decrease the probability of any increasing bond event $A$.]
] <prop:pinning>

#proof[
  For $0 < epsilon < 1$, condition the free system on $r_x gt.eq 1 - epsilon$ and $tau_x = 1$ for every $x in B$. Conditional on $r \, eta$, the probability of the sign requirement is $2^(- k_B \( eta \))$, where $k_B$ is the number of open components meeting $B$. Thus the induced law of $r \, eta$ is tilted by
  $ T_epsilon \( r \, eta \) = upright(bold(1))_({ r_x gt.eq 1 - epsilon med upright("for all ") x in B }) 2^(- k_B \( eta \)) . $
  Opening an edge cannot increase $k_B$; this also holds when it merges a component meeting $B$ with one not meeting $B$. Consequently $T_epsilon$ is increasing. Lemma 10 gives
  $ frac(bb(E) \[ upright(bold(1))_A T_epsilon \], bb(E) \[ T_epsilon \]) gt.eq bb(P) \( A \) . $
  As $epsilon arrow.b 0$, the conditioned reference measures on the positive caps converge to point masses at $s_(*)$. The finite-volume Gibbs weight is bounded, positive, and continuous. The spin-to-bond kernel is also continuous, since its edge-opening probability is
  $ 1 - exp #scale(x: 120%, y: 120%)[\(] - 2 b_(x y) max { s_x^1 s_y^1 \, 0 } #scale(x: 120%, y: 120%)[\)] . $
  In particular there is no discontinuity at a zero first coordinate. Integrating any event of the finitely many bonds and passing to the limit proves the asserted comparison for exact pinning. ◻
]

We now specialize to finite subgraphs of the nearest-neighbor graph on $bb(Z)^2$, with arbitrary strengths in $\[ 0 \, beta \]$. For $z in bb(Z)^2$ and an integer $N gt.eq 2$, put

$ D_N \( z \) = { v in bb(Z)^2 : N lt.eq parallel v - z parallel_oo lt.eq 2 N } . $

An #emph[annulus crossing] is an open path in the restriction of $G$ to $D_N \( z \)$, joining its layers of radii $N$ and $2 N$. Edges or vertices outside this annulus are not allowed in the path.

#thm([Proposition 4.6.])[
  (Uniform crossing suppression).  #emph[For each $beta < oo$ there are numbers $p_N = p_N \( beta \) > 0$ tending to zero as $N arrow.r oo$ with the following property. For every finite lattice subgraph, every strength array in $\[ 0 \, beta \]$, and every list of centers whose closed boxes of sup radius $2 N$ are pairwise disjoint, the free probability that all the corresponding annuli are crossed is at most $p_N$ to the number of annuli. The boxes need not lie inside the finite graph.]
] <prop:crossings>

#proof[
  First work in one restricted annulus graph. Pin both of its layers to $s_(*)$, and let $Z \( 0 \)$ be its partition function. Let $Z \( pi \)$ be the partition function with the inner layer changed to $- s_(*)$ and the outer layer left at $s_(*)$. Then
  #[#set math.equation(numbering: n => "(4.9)")
   $ bb(P)_(upright("pinned")) \( upright("crossing") \) = 1 - frac(Z \( pi \), Z \( 0 \)) . $ <eq:crossing-partition-ratio>]
  Indeed, in the expansion (4.5), every open component missing the pinned layers has two sign choices. A component meeting a pinned layer has one sign choice, provided all prescribed signs on it agree. Changing the inner signs therefore removes exactly the bond configurations joining the two layers and changes the weight of none of the remaining configurations. All other factors are unchanged: the boundary amplitudes are $r = 1 \, q = 0$, and the reference normalization for the unpinned signs is the same. This argument holds at every interior amplitude configuration and hence after integration. If a layer has no vertices, both sides of (4.9) are zero.
  By Proposition 5, the right side of (4.9) is bounded uniformly by a nonnegative sequence tending to zero. Enlarge it slightly to obtain a strictly positive sequence $p_N$ with the same limit.
  For several annuli, pin all their present boundary-layer sites to $s_(*)$ simultaneously. The intersection of their crossing events is increasing, so Proposition 11 bounds its free probability by its pinned probability. In the pinned system, each unpinned annulus region is separated from every vertex outside that annulus by the pinned layers: a nearest-neighbor path cannot jump across either layer. The unpinned annulus spins are therefore independent with precisely the required fixed boundary values. For each resulting annulus marginal, apply Equation (4.9) to the partition functions of that restricted annulus graph. Boundary-only interactions contribute constants, and the independent sampling of edge bonds preserves independence of the crossing events. Their probabilities multiply, proving the bound.
  This separation uses only edges present in $G$. Missing vertices or edges, including those beyond the finite volume, cannot create an unseparated nearest-neighbor interaction. Pinning the layer sites that are present and applying Proposition 5 to the restricted subgraph proves the assertion also for truncated boxes. ◻
]

=== 4.3 From crossings to exponential decay <from-crossings-to-exponential-decay>

#thm([Proposition 4.7.])[
  #emph[For every finite $beta > 0$ there are constants $A_0 < oo$ and $m_0 > 0$, depending only on $beta$, such that the three-component free bond law on every finite square-lattice subgraph with strengths in $\[ 0 \, beta \]$ satisfies 
$ bb(P) \( x arrow.l.r y \) lt.eq A_0 exp \( - m_0 parallel x - y parallel_2 \) #h(2em) \( x \, y in V \) . $

]
] <prop:connection>

#proof[
  Translate the lattice so that $x = 0$. Choose a finite integer $N gt.eq 2$ so large that, for the sequence in Proposition 12,
  #[#set math.equation(numbering: n => "(4.10)")
   $ 0 < p := p_N < 1 \, #h(2em) alpha := 4 p^(1 \/ 25) < 1 . $ <eq:coarse-path-alpha>]
  Partition $bb(Z)^2$ into boxes $z + { 0 \, dots.h \, N - 1 }^2$, with coarse vertices $z in N bb(Z)^2$. Suppose $0$ and $y$ are joined by an open path and $d := parallel y parallel_oo > 4 N$. Recording the visited boxes and erasing loops produces a simple nearest-neighbor coarse path from the origin’s box to the box containing $y$. If its length is $k$, then
  #[#set math.equation(numbering: n => "(4.11)")
   $ k gt.eq d \/ N - 1 . $ <eq:coarse-path-length>]
  Each vertex $z$ of this simple coarse path corresponds to a box visited by the original open path, at some vertex strictly within sup distance $N$ of $z$. At least one of the original endpoints is at distance greater than $2 N$ from $z$: otherwise their mutual distance would be at most $4 N$. A segment of the original path from the visited vertex to that endpoint thus contains a crossing of $D_N \( z \)$: take its first hit on the outer layer and its last preceding hit on the inner layer. The intervening segment stays in the annulus. It does not matter whether that segment survived coarse loop erasure; its edges are still open.
  Among the $k + 1$ distinct coarse vertices, one of the 25 residue classes modulo $5 N$ in the two coordinates contains at least $\( k + 1 \) \/ 25$ vertices. Their closed outer boxes of sup radius $2 N$ are disjoint, because distinct centers in the class differ by at least $5 N$ in some coordinate. Choose one maximizing class deterministically for each candidate coarse path. Proposition 12 bounds the probability that this path has all its required crossings by $p^(\( k + 1 \) \/ 25)$. There are at most $4^k$ coarse paths of length $k$ from the initial box. The union bound and (4.11) therefore give
  $ bb(P) \( 0 arrow.l.r y \) & lt.eq p^(1 \/ 25) sum_(k gt.eq ceil.l d \/ N - 1 ceil.r) alpha^k\
 & lt.eq frac(p^(1 \/ 25), alpha \( 1 - alpha \)) exp (- frac(- log alpha, N) thin d) . $
  Since $d gt.eq parallel y parallel_2 \/ sqrt(2)$, take
  $ m_0 = frac(- log alpha, sqrt(2) thin N) > 0 . $
  Increasing the finite prefactor to cover $d lt.eq 4 N$ proves the result. Every estimate was uniform in the finite subgraph and its strengths. ◻
]

=== 4.4 Conditioning to three components <conditioning-to-three-components>

We have proved the uniform connection estimate in three dimensions. To pass to higher-dimensional spheres, we need a statement about the conditional reference measure, not a new association theorem. The following is the block-coordinate version of the conditional projection in Aru–Garban–Sepúlveda #cite(label("AGS")) Proposition 2.4.

#thm([Lemma 4.8.])[
  (Three-component conditional law).  #emph[Let $n > 3$, and let $sigma_x in S^(n - 1)$ have the free Gibbs law (1.1) on a finite graph. Write $sigma_x = \( rho_x s_x \, v_x \)$, with $v_x in bb(R)^(n - 3)$, $rho_x = sqrt(1 - \| v_x \|^2)$, and $s_x in S^2$ whenever $rho_x > 0$. Conditional on $\( v_x \)_(x in V)$, the directions $\( s_x \)_(x in V)$ have exactly the free three-component Gibbs law with strengths $b_(x y) rho_x rho_y in \[ 0 \, beta \]$.]
] <lem:conditioning>

#proof[
  Represent a uniform sphere point by $\( U \, V \) \/ sqrt(\| U \|^2 + \| V \|^2)$, where $U in bb(R)^3$ and $V in bb(R)^(n - 3)$ have independent standard Gaussian coordinates. The direction $U \/ \| U \|$ is uniform on $S^2$ and is independent of $\( \| U \| \, V \)$. Since $v = V \/ sqrt(\| U \|^2 + \| V \|^2)$ depends only on these latter variables, the three-component direction is independent of $v$ under the reference law. Applying this representation independently at all sites proves that, conditional on all $v_x$, the reference directions remain independent and uniform on $S^2$.
  The conditioned interaction is
  $ sum_({ x \, y } in E) b_(x y) v_x dot.op v_y + sum_({ x \, y } in E) b_(x y) rho_x rho_y s_x dot.op s_y . $
  The first sum is constant under the conditional law and cancels from its normalization. The second gives the asserted couplings. The event $rho_x = 0$ has reference probability zero and still has Gibbs probability zero because the finite Gibbs density is positive and bounded. Alternatively, choosing any independent reference direction at such a site would decouple it and leave all spin products unchanged. ◻
]

#proof[
  For $n = 3$, Equation (4.6) and Proposition 13 give
  $ 0 lt.eq chevron.l s_x^1 s_y^1 chevron.r_(G \, b)^(\( 3 \)) lt.eq A_0 e^(- m_0 parallel x - y parallel_2) . $
  For $n > 3$, apply Lemma 14. Conditional on all $v_x$, the first-coordinate correlation is $rho_x rho_y$ times the corresponding three-component first-coordinate correlation. The latter is nonnegative and satisfies the same bound, uniformly in the conditional strength array. Since $0 lt.eq rho_x rho_y lt.eq 1$, averaging gives, for every $n gt.eq 3$,
  $ 0 lt.eq chevron.l sigma_x^1 sigma_y^1 chevron.r_(G \, b)^(\( n \)) lt.eq A_0 e^(- m_0 parallel x - y parallel_2) . $
  The original free spin law is invariant under coordinate permutations, so
  $ chevron.l sigma_x dot.op sigma_y chevron.r_(G \, b)^(\( n \)) = n chevron.l sigma_x^1 sigma_y^1 chevron.r_(G \, b)^(\( n \)) gt.eq 0 . $
  Taking $A = n A_0$ and $m = m_0$ proves Theorem 1.
  The constants are independent of the volume, so the same estimate passes to the limsup in (1.3). If a subsequence converges locally weakly, the expectation of the bounded continuous local function $sigma mapsto sigma_0 dot.op sigma_x$ converges along it. Its limit therefore satisfies the same bound. This proves Corollary 2 without a uniqueness assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
