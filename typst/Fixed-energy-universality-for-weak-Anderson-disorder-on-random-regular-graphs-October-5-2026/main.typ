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

#align(center)[#text(size: 16pt, weight: "bold")[Fixed-energy universality for weak Anderson disorder \
on random regular graphs]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Independent diagonal disorder changes both the spectrum of a graph and the spatial distribution of its eigenvectors. Anderson introduced this model to describe how randomness in a medium can prevent electronic transport [6]. On the infinite regular tree, or Bethe lattice, removing an edge separates independent branches. The resulting recursive distributional equations for Green functions underlie the self-consistent theory of Abou-Chacra, Thouless, and Anderson [1] and make the tree a basic setting for studying the transition between localized and extended states.

The weak-disorder regime on the tree has a rigorous foundation. Klein [23,24] proved purely absolutely continuous spectrum on compact subintervals of the clean spectral band for sufficiently small disorder, for every regular-tree degree at least three. He also proved that the integrated density of states is continuously differentiable there, so the density of states is continuous. Aizenman, Sims, and Warzel [2] developed a fluctuation approach to the stability of absolutely continuous spectral weight as disorder tends to zero. Froese, Hasler, and Spitzer [19] gave a geometric proof for the degree-three tree, using the hyperbolic geometry of the Green-function recursion. We establish within the paper the quantitative recursion stability and boundary regularity required for the finite-graph argument.

A random regular graph of fixed degree is locally a tree, while its finite spectrum raises a further question: do eigenvalues in a window of length comparable to the inverse graph size have the statistics of a real symmetric Gaussian matrix? The present paper answers this question in the clean bulk for sufficiently weak positive disorder that remains fixed as the graph grows. The conclusion holds at each fixed energy and identifies the entire microscopic point-process law.

For the clean model, the tree spectral measure and the limiting empirical density are the Kesten–McKay law [22,27]. Local laws and eigenvector delocalization were established for growing degrees by Bauerschmidt, Knowles, and Yau [10], and for sufficiently large fixed degrees by Bauerschmidt, Huang, and Yau [9]. Huang and Yau [21] extended the fixed-degree theory to every degree at least three, including the spectral edges. Microscopic statistics require further input: Bauerschmidt, Huang, Knowles, and Yau [8] proved bulk GOE gap statistics and energy-averaged correlation statistics for a range of polynomially growing degrees. Huang, McKenzie, and Yau [20] established optimal rigidity and edge universality at every fixed degree at least three. The companion [28] proves fixed-energy bulk universality for the clean fixed-degree model. We adapt its combinatorial entropy and Gaussian insertion arguments below.

For positive disorder, Anantharaman and Sabri [4] proved quantum ergodicity for the Anderson model on expanding regular graphs converging locally to the regular tree, at weak disorder in compact subsets of the clean band. Their general framework [5] relates spatial equidistribution to quantitative regularity of tree Green functions. These conclusions concern averaged spatial equidistribution. The present theorem concerns joint eigenvalue statistics in a microscopic window around a fixed energy.

The eigenvector part of our proof follows the entropy method of Backhausz and Szegedy [7]. They connect almost eigenvectors of finite random regular graphs to Gaussian waves on the tree through local type counts, Gaussian smoothing, weighted Fisher-information inequalities, and their equality cases. Their limiting Gaussian law allows loss of variance under weak convergence. Here we separately preserve second moments in the microscopic limit and adapt the entropy argument to laws conditioned on the random potential. The conditional covariance is determined by the random tree Green function.

The final identification uses the dynamics introduced by Dyson [16]. The local relaxation method of Erdős, Schlein, and Yau [17] and the homogenization argument of Bourgade, Erdős, Yau, and Yin [12] established key links between short-time Dyson Brownian motion and universal local statistics. For deterministic initial data with a regular local density, Landon and Yau [26] proved short-time gap and energy-averaged universality, and Landon, Sosoe, and Yau [25] proved the fixed-energy version. We apply the latter theorem after comparing the effect of measure-preserving potential changes with a Gaussian perturbation and verifying the required regularity and density normalization.

=== 1.1 Model and main result <model-and-main-result>

Fix an integer $d gt.eq 3$. For $n > d$ with $n d$ even, let $cal(G)_(n \, d)$ be uniform among all simple labelled $d$-regular graphs on ${ 1 \, dots.h \, n }$, and let $A_(n \, d)$ be its adjacency matrix. Let $\( omega_v \)_(v = 1)^n$ be independent uniform random variables on $\[ - 1 \, 1 \]$, independent of the graph. For $w > 0$, put

$ H_(n \, d \, w) = A_(n \, d) + w "diag" \( omega_1 \, dots.h \, omega_n \) . $

We use ordinary adjacency, without dividing by $sqrt(d - 1)$, and count all eigenvalues $lambda_1 \, dots.h \, lambda_n$ with multiplicity. The graph law has no further conditioning.

Let $bb(T)_d$ be the infinite $d$-regular tree with root $o$, equipped with independent uniform potentials $omega_v in \[ - 1 \, 1 \]$. Its density-of-states measure is the deterministic probability measure

#[#set math.equation(numbering: n => "(1)")
 $ nu_(d \, w) \( B \) = bb(E) ⟨delta_o \, upright(bold(1))_B #scale(x: 120%, y: 120%)[\(] A_(bb(T)_d) + w "diag" \( omega_v \) #scale(x: 120%, y: 120%)[\)] delta_o⟩ \, #h(2em) B subset bb(R) med upright("Borel") . $ <eq:tree-dos-definition>]

This definition fixes the unfolding density directly from the tree operator. Write $M_n$ for normalized GOE: its entries on and above the diagonal are independent centered real Gaussians, with variance $1 \/ n$ off the diagonal and $2 \/ n$ on the diagonal. If its eigenvalues are $mu_1 \, dots.h \, mu_n$, the unit-intensity bulk reference at zero is

$ Xi_n^(upright("GOE")) = sum_(i = 1)^n delta_(\( n \/ pi \) mu_i) . $

#thm([Theorem 1.1.])[
  (Fixed-energy universality).  #emph[For every $d gt.eq 3$ and every $0 < kappa < 2 sqrt(d - 1)$, there is $w_0 = w_0 \( d \, kappa \) > 0$ with the following property. For each fixed $0 < w < w_0$, the restriction of $nu_(d \, w)$ to an open neighborhood of 
$ I_(d \, kappa) = \[ - 2 sqrt(d - 1) + kappa \, thin 2 sqrt(d - 1) - kappa \] $

 has a continuous density $rho_(d \, w)$, strictly positive on $I_(d \, kappa)$. For every fixed $E in I_(d \, kappa)$, set 
$ Xi_(n \, E) = sum_(i = 1)^n delta_(n rho_(d \, w) \( E \) \( lambda_i - E \)) . $

 Then, for every nonnegative $f in C_c \( bb(R) \)$, 
#[#set math.equation(numbering: n => "(2)")
 $ lr(|bb(E) exp (- integral f thin d Xi_(n \, E)) - bb(E) exp (- integral f thin d Xi_n^(upright("GOE")))|) arrow.r 0 $ <eq:main-laplace>]

 as $n arrow.r oo$ through all sizes $n > d$ with $n d$ even.]
] <thm:main>

The disorder strength, degree, energy, and test function are fixed before the graph size tends to infinity. The conclusion identifies the full microscopic point-process law. The tree density in (1) also determines the variance profile of the eigenvector marks used in the proof.

=== 1.2 Proof strategy and the role of the environment <proof-strategy-and-the-role-of-the-environment>

The first task is to compare finite-graph resolvents with random tree resolvents. A branch Green function satisfies a scalar recursion whose inputs come from independent child branches. Section 2 proves stability of this recursion near the clean bulk solution, including control of values close to the boundary of the upper half-plane. Section 3 then derives an approximate recursion for the empirical law of finite-graph cavity resolvents. It uses switches of a bounded number of edges, spectral averaging in the potentials, and the Ward identity. The result is a distributional local law: the random environment remains visible in the limiting resolvent.

The second task is to identify eigenvector marks at sampled vertices. Normalize an eigenvector $u_i$ by $parallel u_i parallel^2 = n$ and consider a fixed finite list of eigenvalues within distance $O \( n^(- 1) \)$ of $E$. In a subsequential local limit, the corresponding coordinates at a sampled root satisfy the tree eigen-equation. Microscopic uniform integrability preserves their exact second moments. A small simultaneous change of all potentials, combined with spectral averaging, eliminates conditional means. Section 4 establishes an entropy inequality for these marks conditional on the entire tree environment.

The Gaussian comparison field has covariance given by the imaginary part of the tree Green function at $E + i 0$. Like the eigenvector marks, it satisfies the tree eigen-equation, which imposes one linear constraint for each eigenvector coordinate on a star. On that constraint space, its precision splits into contributions from the incident edges; the two contributions at either end of an edge add to the edge precision. Section 5 uses this identity and re-rooting invariance in a Fisher-information comparison. After removing the directions normal to the constraint space and subtracting the Gaussian entropy constants, the counting inequality makes the entropy difference nonnegative, while the comparison makes it increase to zero as Gaussian noise is added. Equality is therefore forced, and its equality case gives independent Gaussian coordinates at the root, conditional on the environment, with variance

$ frac(Im m_o \( E + i 0 \), pi rho_(d \, w) \( E \)) \, #h(2em) m_o \( zeta \) = ⟨delta_o \, \( A_(bb(T)_d) + w "diag" \( omega_v \) - zeta \)^(- 1) delta_o⟩ . $

This conditional statement retains information that would be lost by replacing the random variance by its average.

The final task is to determine the microscopic eigenvalue process. Section 6 represents sampled resolvents by Gaussian marks on that process, with the real additive constants fixed by the joint local law. Resampling one potential gives an exact rank-one identity. Together with Gaussian concentration, it improves the initial slow estimates to uniform regularity of the limiting Stieltjes transform. Measure-preserving exchanges of short intervals in the potential law then provide many small perturbations. Their number increases inside the already constructed limiting law. After truncating distant microscopic positions, the switch identity represents their effect by a sum of small signed rank-one matrices formed from the Gaussian marks. Section 7 replaces the centered sum by GOE noise. Because the potential exchanges preserve the ensemble, this construction approximates each subsequential point-process law by the eigenvalues of a finite diagonal matrix of the retained positions, plus a scalar shift and GOE noise. This comparison is made after averaging over the sampled environments. Section 8 then applies fixed-energy Dyson Brownian motion to these matrices, checking their regularity and density normalization. The resulting unfolding is exactly the one in Theorem 1.

The distributional local law, the environment-conditioned entropy argument, and the use of potential resampling to improve microscopic regularity are the principal intermediate constructions. Their proofs keep the random tree response explicit until the final Gaussian comparison.

=== 1.3 Conventions <conventions>

We write $V_v = w omega_v$, so that potentials denoted by $V$ include the coupling constant and are uniform on $\[ - w \, w \]$. We suppress $n \, d \, w$ in $H$ when they are fixed, and use $G \( zeta \) = \( H - zeta \)^(- 1)$ for $zeta in bb(H)$; imaginary parts of diagonal resolvents are positive. Set $b = d - 1$. Choose once and for all a compact interval $J$ in $\( - 2 sqrt(b) \, 2 sqrt(b) \)$ whose interior contains $I_(d \, kappa)$. All small-coupling choices will be uniform for energies in $J$. Constants in finite-graph estimates may depend on the fixed positive $w$.

The notation $W_2$ denotes quadratic Wasserstein distance for the specified Euclidean metric. Conditional laws of colors in the entropy argument refer to the finitely many eigenvector coordinates; these colors are independent Gaussian coordinates only after that conclusion is proved. An environment consists of the potentials, including their coupling constant. Probability and expectation also include auxiliary uniform vertex or edge samples when these have been introduced.

== 2 Boundary Green functions and stability on the tree <sec:tree>

The local law will compare a random empirical distribution of Green functions with the cavity Green function on the infinite tree. We first prove the distributional stability needed for that comparison. The same argument constructs boundary values in the common potential environment and supplies the integrability needed when we later take entropies of Gaussian fields on an edge or a star.

Weak-disorder absolute continuity on regular trees was established by Klein [24]; the stability of absolutely continuous spectral weight was studied by Aizenman, Sims, and Warzel [2]. The geometric Green-function argument of Froese, Hasler, and Spitzer [19], for the tree of degree three, is a precedent for using the half-plane geometry of the recursion. We give the quantitative estimates used here, including their proofs, for every fixed $d gt.eq 3$.

Fix a compact interval $J subset \( - 2 sqrt(b) \, 2 sqrt(b) \)$, where $b = d - 1$. A forward tree is the component left after removing the edge from its root towards its parent. Its root has $b$ children. Write $g \( zeta \)$ for its diagonal Green function, with $zeta = e + i eta$ and $eta > 0$. Schur complementation gives

#[#set math.equation(numbering: n => "(3)")
 $ g \( zeta \) = (V - zeta - sum_(i = 1)^b g_i \( zeta \))^(- 1) \, $ <eq:tree-recursion>]

where the $g_i$ are the cavity Green functions of the child branches. For independent potentials these branches are independent and have the same law as $g$, independently of $V$. The clean boundary solution is

$ q = q \( e \) = frac(- e + i sqrt(4 b - e^2), 2 b) \, #h(2em) q = \( - e - b q \)^(- 1) \, #h(2em) \| q \| = b^(- 1 \/ 2) . $

We use the disk coordinates

#[#set math.equation(numbering: n => "(4)")
 $ X_e \( g \) = frac(g - q \( e \), g - overline(q \( e \))) \, #h(2em) T_e \( x \) = frac(q \( e \) - x overline(q \( e \)), 1 - x) \, #h(2em) D \( x \) = frac(1, 1 - \| x \|) . $ <eq:tree-disk>]

Thus $X_e : bb(H) arrow.r bb(D)$ and $T_e = X_e^(- 1)$. When the real part is understood we write $X = X_e$. Put $Y \( e \, eta \) = Y \( e + i eta \) = X_e \( g \( e + i eta \) \)$. For $j gt.eq 1$, let $F_j$ be the map from the $b^j$ disk-valued leaves to the root obtained by applying (3) through $j$ levels and then using $X_e$. Its other arguments are the $1 + b + dots.h.c + b^(j - 1)$ internal potentials. Whenever $F_j$ is used as a map on probability laws, these potentials are independent and uniform on $\[ - w \, w \]$, independently of the leaves. The notation $parallel Z parallel_2$ means $\( bb(E) \| Z \|^2 \)^(1 \/ 2)$, and $W_2$ is the Euclidean Wasserstein distance on $bb(D)$.

#thm([Proposition 2.1.])[
  (Tree stability).  #emph[There is an integer $ell gt.eq 1$, depending only on $b \, J$, with the following properties. Given any finite order $p_(*) > 0$ and a sufficiently small prescribed number $delta_(upright("tree")) > 0$, one can choose $h \, w_0 > 0$ so that, uniformly for $e in J$, $0 < w lt.eq w_0$, and $0 < eta lt.eq h$, 
#[#set math.equation(numbering: n => "(5)")
 $ parallel Y \( e \, eta \) parallel_2 lt.eq delta_(upright("tree")) \, #h(2em) bb(E) D \( Y \( e \, eta \) \)^p lt.eq K_p quad \( 0 < p lt.eq p_(*) \) . $ <eq:tree-small-moments>]

 The choices also include the additional fixed finite moment orders required by the stability assertion that follows. There are constants $delta_(*) > 0$ and $C < oo$ such that, if a probability law $P$ on $bb(D)$ satisfies $integral \| x \|^2 thin d P \( x \) lt.eq delta_(*)^2$ and 
$ W_2 #scale(x: 120%, y: 120%)[\(] P \, "Law" \( F_j \( X_1 \, dots.h \, X_(b^j) \) \) #scale(x: 120%, y: 120%)[\)] lt.eq u \, #h(2em) j = 1 \, ell \, $

 where the $X_i$ are independent with law $P$, then 
#[#set math.equation(numbering: n => "(6)")
 $ W_2 \( P \, "Law" \( Y \( e \, eta \) \) \) lt.eq C u . $ <eq:tree-law-stability>]

 The constants $K_p \, delta_(*) \, C$ can be fixed before decreasing the parameters further to make $delta_(upright("tree"))$ much smaller than $delta_(*)$. On a fixed tree with its fixed potential variables, $\( e \, eta \) mapsto Y \( e \, eta \)$ extends continuously in $L^2$ to $J times \[ 0 \, h \]$. The boundary values belong to $bb(D)$ almost surely, obey (5), and are measurable functions of the potentials.]
] <prop:tree-stability>

The proof separates the deterministic geometry from the probabilistic contraction. A single level need not contract the mean, and arbitrary disk inputs need not have uniformly bounded Euclidean derivatives. The useful facts are that the mean multiplier is separated from $1$, and that many levels strongly damp a perturbation arriving through one leaf. Independence lets us combine these two facts.

=== 2.1 Deterministic estimates for the recursion <deterministic-estimates-for-the-recursion>

All constants in this subsection are uniform for $e in J$ and for sufficiently small bounded $\| V \| \, eta$. At $V = eta = 0$, with all but one child equal to $0$ in disk coordinates, the one-level map is

$ H \( x \) = frac(a x, b - \( b - 1 \) x) \, #h(2em) a = b q^2 . $

Here $\| a \| = 1$ and $inf_(e in J) \| 1 - a \( e \) \| > 0$. Along a path through $j$ levels, all other leaves being zero, the map is $H^(compose j)$. Direct composition gives

$ H^(compose j) \( x \) = frac(\( a \/ b \)^j x, 1 - c_j x) \, #h(2em) c_j = (1 - 1 / b) sum_(k = 0)^(j - 1) \( a \/ b \)^k . $

The limiting coefficient is $\( b - 1 \) \/ \( b - a \)$ and has modulus strictly less than one, uniformly on $J$. Consequently, for all sufficiently large $j$,

#[#set math.equation(numbering: n => "(7)")
 $ sup_(\| x \| lt.eq 1) \| H^(compose j) \( x \) \| lt.eq C b^(- j) \, #h(2em) sup_(\| x \| lt.eq 1) \| \( H^(compose j) \)' \( x \) \| lt.eq C b^(- j) . $ <eq:tree-one-leaf>]

Fix $ell$ large enough that the first bound is less than $1 \/ 2$ and $2 C b^(- ell) b^(ell \/ 2) < 1 \/ 10$. The maps and their derivatives remain bounded on a neighborhood of each set with one unrestricted input $\| x_i \| lt.eq 1$ and all other inputs zero. Indeed, siblings whose disk coordinates are close to zero have Green functions close to $q$, so the one-variable fractional-linear map has no pole on the closed disk; the apparent singularity at $x_i = 1$ cancels after multiplication by $1 - x_i$. At successive vertices on the path the same statement applies, while off-path branches remain close to their clean values. Compactness and (7) therefore give, after decreasing $h \, w_0$,

#[#set math.equation(numbering: n => "(8)")
 $ "Lip" #scale(x: 120%, y: 120%)[\(] x mapsto F_ell \( 0 \, dots.h \, x \, dots.h \, 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 C b^(- ell) \, $ <eq:tree-one-leaf-perturbed>]

and a strictly positive output margin whenever all but at most one leaf have modulus at most a fixed sufficiently small $r > 0$. The derivatives needed in such neighborhoods are uniformly bounded.

Two estimates handle the remaining inputs. For $g in bb(H)$,

#[#set math.equation(numbering: n => "(9)")
 $ D \( X_e \( g \) \) asymp frac(1 + \| g \|^2, Im g) . $ <eq:tree-hyperbolic-comparison>]

To verify this, use $1 - \| X_e \( g \) \|^2 = 4 Im q Im g \/ \| g - macron(q) \|^2$ and $\| g - macron(q) \|^2 asymp 1 + \| g \|^2$, uniformly in $e in J$. If $A = V - e - i eta - sum_i g_i$, then $- Im A = eta + sum_i Im g_i$, and

$ frac(1 + \| A^(- 1) \|^2, Im \( A^(- 1) \)) = frac(1 + \| A \|^2, eta + sum_i Im g_i) lt.eq C sum_i frac(1 + \| g_i \|^2, Im g_i) . $

The last inequality uses boundedness of $V - e - i eta$ and $\| sum g_i \|^2 lt.eq b sum \| g_i \|^2$. Thus

#[#set math.equation(numbering: n => "(10)")
 $ D \( F_1 \( y_1 \, dots.h \, y_b \) \) lt.eq C sum_i D \( y_i \) . $ <eq:tree-margin-bound>]

Its iteration bounds the output inverse margin by $C_j sum_i D \( y_i \)$. The same one-level estimate holds with $d$ children at a full root.

For each fixed $j$, there is a finite exponent $A_j$ such that

#[#set math.equation(numbering: n => "(11)")
 $ \| F_j \( x \) - F_j \( y \) \| lt.eq C_j sum_(i = 1)^(b^j) \| x_i - y_i \| product_(k eq.not i) D \( y_k \)^(A_j) . $ <eq:tree-sibling-bound>]

The exclusion of $i$ from its coefficient is essential: the first input law in Proposition 2 has no inverse-margin assumption. Here is a proof. For one level choose an index $r$ with smallest reference margin $1 - \| y_r \|$, and let $t$ be the smallest margin among the other reference inputs. If $\| x_k - y_k \| gt.eq t \/ 2$ for some $k eq.not r$, the $k$th summand on the right, already with exponent one, is at least $1 \/ 2$, since it contains $D \( y_r \) gt.eq 1 \/ t$. Increasing the constant bounds the left side by its trivial upper bound $2$.

Otherwise every input other than $r$, along the straight segments from $y$ to $x$, has margin at least $t \/ 2$. We claim that all partial derivatives of $F_1$ there are bounded by a fixed power of $t^(- 1)$, even when the $r$th input is anywhere in the closed disk. Holding the siblings fixed, put

$ S_0 = V - e - i eta - sum_(k eq.not r) T_e \( x_k \) \, #h(2em) p = S_0 - 1 \/ macron(q) . $

The pole in the unrestricted Green variable is $p$, with $Im p lt.eq - Im \( 1 \/ macron(q) \) lt.eq - c$ and $\| p \| lt.eq C \/ t$. After substituting $T_e \( x_r \)$ and clearing $1 - x_r$, the denominator is, up to a nonzero uniformly bounded factor, $\( q - p \) - x_r \( macron(q) - p \)$. Its modulus is at least

$ \| q - p \| - \| macron(q) - p \| = frac(- 4 Im q Im p, \| q - p \| + \| macron(q) - p \|) gt.eq c t . $

Numerator coefficients are polynomially bounded in $t^(- 1)$; sibling derivatives have the same property because $\| T'_e \( x_k \) \| lt.eq C t^(- 2)$. This proves the claim, including the removable value $x_r = 1$. Integration along the segments proves (11) for $j = 1$: for $i = r$ its product contains an input with margin $t$, and for $i eq.not r$ it contains $r$. For the induction, apply the one-level estimate to the outputs of the child subtrees and then apply it inside the subtree containing the varied leaf. By (10), each inverse margin arising in another subtree is bounded by a sum of its leaf inverse margins. Since $D gt.eq 1$ and the number of leaves is fixed, these sums and their powers are bounded by a constant times a product of sufficiently high powers. None contains the varied leaf. This proves (11) for every fixed $j$. The one-level proof is unchanged for $d$ inputs at a full root, and hence also for a fixed-depth recursion with that root degree.

=== 2.2 Mean and fluctuation contraction <mean-and-fluctuation-contraction>

We next convert these deterministic estimates into a coupling bound. Let $\( X \, Z \)$ be a coupled pair of disk variables, let $B = parallel X - Z parallel_2$ and $M = bb(E) \( X - Z \)$, and suppose both marginal $L^2$ norms are small. Only $Z$ is assumed to satisfy an inverse-margin bound $bb(E) D \( Z \)^p lt.eq K$ for a sufficiently large fixed $p$. Take independent copies $\( X_i \, Z_i \)$ at the leaves, independent of the internal potentials, and use identical internal potentials in the two evaluations. We claim that, for any prescribed $epsilon > 0$, sufficiently small marginal norms and sufficiently small $h \, w_0$ imply

#[#set math.equation(numbering: n => "(12)")
 $ lr(|bb(E) { F_1 \( X_dot.op \) - F_1 \( Z_dot.op \) } - a M|) & lt.eq epsilon B \,\
parallel F_ell \( X_dot.op \) - F_ell \( Z_dot.op \) parallel_2 & lt.eq 1 / 10 B + C_ell \| M \| + epsilon B . $ <eq:tree-mean-contraction>]

The smallness threshold may depend on $K \, p \, epsilon \, b \, J \, ell$, but not on the coupling.

We supply the decomposition behind this claim. Fix $j = 1$ or $ell$, write $N = b^j$, and, conditional on the internal potentials, set $f_i \( x \) = F_j \( 0 \, dots.h \, x \, dots.h \, 0 \)$. Then

#[#set math.equation(numbering: n => "(13)")
 $ F_j \( X_dot.op \) - F_j \( Z_dot.op \) = sum_(i = 1)^N #scale(x: 120%, y: 120%)[\(] f_i \( X_i \) - f_i \( Z_i \) #scale(x: 120%, y: 120%)[\)] + R \, #h(2em) parallel R parallel_2 lt.eq epsilon B \, $ <eq:tree-single-decomposition>]

with any prescribed error after adjusting the thresholds. Choose a small number $r > 0$ and call pair $i$ bad when $max \( \| X_i \| \, \| Z_i \| \) > r$. If no pair is bad, telescoping over coordinates and comparing each derivative with the corresponding one-variable derivative gives $\| R \| lt.eq omega \( r \) sum_i \| X_i - Z_i \|$, where $omega \( r \) arrow.r 0$. If only pair $k$ is bad, the smoothness on the one-unrestricted-input neighborhoods proved above gives

$ \| R \| lt.eq omega \( r \) \| X_k - Z_k \| + C sum_(i eq.not k) \| X_i - Z_i \| . $

For the latter terms we retain the indicator that pair $k$ is bad; it is independent of $\( X_i \, Z_i \)$. Their $L^2$ norms are therefore at most $C B sqrt(bb(P) \( k upright(" is bad") \))$.

On the event of at least two bad pairs, use (11), together with the bounded derivatives of the $f_i$. Each summand has the form

$ C \| X_i - Z_i \| product_(k eq.not i) D \( Z_k \)^(A_j) upright(bold(1))_({ upright("some ") k eq.not i upright(" is bad") }) . $

Its $L^2$ norm is $B$ times the $L^2$ norm of the remaining factor. For example, if $p gt.eq 4 A_j$, Hölder’s inequality and independence bound that norm by

$ C_(N \, K) bb(P) \( upright("some ") k eq.not i upright(" is bad") \)^(1 \/ 4) . $

The bad-pair probability tends to zero with $parallel X parallel_2 + parallel Z parallel_2$, by Markov’s inequality. First choose $r$ so that $omega \( r \)$ is small; then choose the marginal norms small. Summing the finitely many estimates proves (13). This also explains why no inverse-margin bound for $X$ is required.

The one-variable means satisfy, uniformly conditional on internal potentials,

#[#set math.equation(numbering: n => "(14)")
 $ lr(|bb(E) #scale(x: 120%, y: 120%)[\[] f_i \( X_i \) - f_i \( Z_i \) divides upright("internal potentials") #scale(x: 120%, y: 120%)[\]] - f'_i \( 0 \) M|) lt.eq epsilon B . $ <eq:tree-single-mean>]

On $\| X_i \| \, \| Z_i \| lt.eq r$ this follows from derivative continuity. Off that event, the global bounded derivative of $f_i$ and Cauchy–Schwarz give an error at most $C B sqrt(bb(P) \( i upright(" is bad") \))$. At one level the clean sum of derivatives is $b \( a \/ b \) = a$; its perturbed value differs by $O \( h + w_0 \)$. Equations (13) and (14) prove (12). At level $ell$, the centered single-input differences are independent conditional on the internal potentials. By (8), their sum has conditional centered $L^2$ norm at most $b^(ell \/ 2) 2 C b^(- ell) B < B \/ 10$. The sum of their conditional means is bounded by $C_ell \| M \| + epsilon B$, after making the individual errors smaller by the fixed factor $N$. Together with (13), this proves (12).

=== 2.3 Smallness, inverse margins, and boundary continuity <smallness-inverse-margins-and-boundary-continuity>

We can now prove Proposition 2. First compare the actual tree input with $Z = 0$. This comparison has inverse-margin bound one and thus uses no unproved moment estimate for the tree. As long as $B = parallel Y parallel_2$ is below the smallness threshold, stationarity of the recursion and $parallel F_j \( 0 \) parallel_2 lt.eq C_j \( h + w_0 \)$ give

$ \| \( 1 - a \) bb(E) Y \| lt.eq epsilon B + C \( h + w_0 \) \, #h(2em) B lt.eq 1 / 10 B + C_ell \| bb(E) Y \| + epsilon B + C_ell \( h + w_0 \) . $

Since $\| 1 - a \| gt.eq c > 0$, choose $epsilon$ small enough to absorb the terms proportional to $B$. It follows that

#[#set math.equation(numbering: n => "(15)")
 $ parallel Y \( e \, eta \) parallel_2 lt.eq C \( h + w_0 \) $ <eq:tree-small-bootstrap>]

whenever the initial smallness assumption holds.

Here is a starting point and continuation argument for that assumption. At height $h$, the clean cavity function, obtained from its quadratic equation, differs from $q \( e \)$ by $O \( h \)$ uniformly on $J$. The resolvent identity for adding the bounded potential changes a cavity entry by at most $w_0 \/ h^2$. The map $X_e$ has uniformly bounded derivative on $bb(H)$, so the starting disk norm is at most $C \( h + w_0 \/ h^2 \)$. Choose $h$ small and then $w_0 \/ h^2$ small enough to start strictly inside the threshold and to make the right side of (15) less than half that threshold. For each fixed $e \, w$, the tree resolvent, and hence its disk-valued $L^2$ norm, is continuous for $eta > 0$. A first crossing of the threshold on decreasing $eta$ would contradict the improved bound. This proves (15) throughout $\( 0 \, h \]$, uniformly in $e \, w$. Decreasing the parameters makes the resulting norm as small as any prescribed fixed number.

Next fix a finite moment order $p$. At every strictly positive height all inverse margins have finite deterministic bounds: for the bounded tree operator, $\| g \| lt.eq eta^(- 1)$ and $Im g gt.eq eta \/ \( C^2 + eta^2 \)$ on our bounded energy range. It is therefore legitimate to absorb an as yet nonuniform moment. Let $N = b^ell$ and use the radius $r$ for which (8) has a uniformly interior image when at most one leaf is outside $\| x \| lt.eq r$. On that event $D \( F_ell \( Y_dot.op \) \)^p lt.eq C_p$. On its complement, (10) iterated through $ell$ levels gives $D \( F_ell \( Y_dot.op \) \)^p lt.eq C_p sum_i D \( Y_i \)^p$. For each summand the complement implies that some other leaf is outside $\| x \| lt.eq r$. Independence and recursion stationarity yield

$ bb(E) D \( Y \)^p lt.eq C_p + C_p N \( N - 1 \) bb(P) \( \| Y \| > r \) thin bb(E) D \( Y \)^p . $

By (15), the probability coefficient can be made less than $1 \/ \( 2 C_p N \( N - 1 \) \)$. Absorption gives a uniform bound $2 C_p$. Taking the largest of finitely many required orders handles all of them, with constants that remain bounded as the parameters decrease further.

We have now obtained smallness without moments and then obtained moments from smallness. Fix those moment constants and apply the coupling estimates with $Z$ having the tree law. Choose an optimal coupling of $P$ and that law, so $B = W_2 \( P \, "Law" \( Y \) \)$ and $M = bb(E) \( X - Y \)$. The first approximate recursion and (12) imply $\| \( 1 - a \) M \| lt.eq u + epsilon B$, hence $\| M \| lt.eq C \( u + epsilon B \)$. The second approximate recursion, the coupling through identical internal potentials, and (12) give

$ B lt.eq u + 1 / 10 B + C_ell \| M \| + epsilon B . $

Absorbing again proves (6). The coupling smallness threshold $delta_(*)$ is now fixed. Decreasing $h \, w_0$ once more makes the actual tree size arbitrarily smaller than $delta_(*)$ without enlarging its moment bounds. This is the parameter order asserted in the proposition.

Finally compare the two actual tree variables on the same potentials at parameters $\( e \, eta \)$ and $\( e' \, eta' \)$, both at positive height. Use their own coordinates $X_e \, X_(e')$, and write the coupled variables as $Y \, Y'$. Their leaf pairs are independent across branches, and recursing preserves this particular coupling. When the second evaluation is temporarily made using the first parameters, the coupling estimates apply with $B = parallel Y - Y' parallel_2$, rather than merely with a transportation distance. The parameter replacement error in either $F_1$ or $F_ell$ has $L^2$ norm at most a modulus $r_0 \( \| e - e' \| + \| eta - eta' \| \)$ tending to zero uniformly. To see this, restrict all finitely many leaves to $D \( Y'_i \) lt.eq R$; on that compact subset the recursion maps are uniformly continuous in their parameters, including at height zero. The complementary probability is at most $N K_p R^(- p)$, and the disk-valued difference is bounded by $2$. First choose $R$ large, and then make the parameter distance small. Thus the preceding mean and norm inequalities now have $r_0$ in place of $u$, and imply

$ parallel Y \( e \, eta \) - Y \( e' \, eta' \) parallel_2 lt.eq C r_0 \( \| e - e' \| + \| eta - eta' \| \) . $

Completeness of $L^2$ gives the asserted continuous extension. Fatou’s lemma along almost surely convergent subsequences preserves all inverse-margin bounds, so the limit lies in the open disk. Each boundary variable is a limit in probability of measurable functions of the potentials and is therefore measurable in that environment. Since the finitely many child limits lie in the open disk, continuity of the recursion also passes (3) to height zero. These identities hold simultaneously at all vertices for each fixed energy, by taking the intersection of countably many probability-one events. This finishes the proof of Proposition 2.

=== 2.4 Spatial covariances and the density of states <spatial-covariances-and-the-density-of-states>

At the full root, let $g_1 \, dots.h \, g_d$ denote the incoming cavity functions, and put

$ m_o \( zeta \) = (V_o - zeta - sum_(i = 1)^d g_i \( zeta \))^(- 1) . $

The next lemma makes explicit which spatial estimates are required later. A star consists of the root and its $d$ neighbors. By a retained star we mean the coordinate set obtained by omitting one neighbor, while keeping the root and the other $d - 1$ neighbors.

#thm([Lemma 2.2.])[
  (Tree covariance and logarithmic integrability).  #emph[Fix a finite exponent $p_0 gt.eq 1$ before choosing the disorder threshold. Taking the finite order $p_(*)$ in Proposition 2 sufficiently large, the full-root Green function and every entry of the star Green matrix extend continuously in $L^(p_0)$ to $J times \[ 0 \, h \]$ on the common environment. Their boundary values have strictly positive root imaginary part. If $K \( zeta \)$ is the imaginary part of the Green matrix compressed to an edge or a retained star, then $K \( e + i 0 \)$ is positive definite almost surely. Uniformly for $e in J$ and $0 lt.eq eta lt.eq h$, the variables $log det K \( e + i eta \)$ are uniformly integrable, and they converge in $L^1$ when $\( e \, eta \)$ converges. These assertions require only a finite collection of inverse-margin moments of spatial cavity variables, independent of the number of colors in a Gaussian field.]
] <lem:tree-log>

#proof[
  Put $M_0 = 2 + sum_(i = 1)^d D \( Y_i \)$. The comparison (9) gives polynomial bounds in $M_0$ for $\| g_i \|$, $\| g_i \|^(- 1)$, and $\( Im g_i \)^(- 1)$. For $A = V_o - zeta - sum_i g_i$, we have $\| A \| lt.eq C M_0$ and $- Im A gt.eq c M_0^(- 1)$. Hence $\| m_o \|$, $\| m_o \|^(- 1)$, and $\( Im m_o \)^(- 1)$ are also bounded by fixed powers of $M_0$. In particular $Im m_o \( e + i 0 \) > 0$ almost surely.
  The inverse star Green matrix and its inverse have the explicit forms
  #[#set math.equation(numbering: n => "(16)")
   $ S = mat(delim: "(", V_o - zeta, 1, dots.h.c, 1; 1, 1 \/ g_1, , 0; dots.v, , dots.down, ; 1, 0, , 1 \/ g_d) \, #h(2em) S^(- 1) = mat(delim: "(", m_o, \( - m_o g_i \)_i; \( - m_o g_i \)_i^(sans(T)), \( delta_(i j) g_i + g_i m_o g_j \)_(i j)) . $ <eq:tree-star-matrix>]
  Thus $parallel S parallel + parallel S^(- 1) parallel lt.eq C M_0^C$. Also
  $ - Im S = "diag" (eta \, frac(Im g_1, \| g_1 \|^2) \, dots.h \, frac(Im g_d, \| g_d \|^2)) \, #h(2em) Im S^(- 1) = \( S^(- 1) \)^(*) \( - Im S \) S^(- 1) . $
  Each neighbor diagonal in $- Im S$ is at least $c M_0^(- C)$. For a vector $x$ supported on a retained star, let the omitted neighbor be $r$ and put $y = S^(- 1) x$. The unused row says $0 = y_o + y_r \/ g_r$, so $\| y_o \| lt.eq C M_0^C \| y_r \|$. Consequently
  $ \| x \| = \| S y \| lt.eq C M_0^C \| \( y_1 \, dots.h \, y_d \) \| \, #h(2em) x^(*) \( Im S^(- 1) \) x gt.eq c M_0^(- C) \| x \|^2 . $
  Together with the upper bound for $S^(- 1)$, this bounds every eigenvalue of the retained covariance between $c M_0^(- C)$ and $C M_0^C$. The same bounds hold for an edge covariance: choose a retained star that contains the edge and restrict its quadratic form. This is possible since $d gt.eq 3$. The bounds hold equally at height zero by the displayed formulas and the almost sure positivity of all incoming imaginary parts.
  All formulas are continuous when their inputs lie in $bb(D)$. Proposition 2 therefore gives convergence in probability. The polynomial bounds and sufficiently high, but finitely many, inverse-margin moments give the claimed $L^(p_0)$ convergence by uniform integrability. Moreover
  $ \| log det K \| lt.eq C \( 1 + log M_0 \) . $
  Any fixed positive moment of $M_0$ bounds, for example, the second moment of this logarithm. The logarithms are consequently uniformly integrable and converge in $L^1$. Tensoring $K$ with the identity on $m$ colors multiplies $log det K$ by $m$; it does not require any larger spatial moment order. ◻
]

#thm([Corollary 2.3.])[
  (Continuous positive density of states).  #emph[For the above smallness choices, the restriction of $nu_(d \, w)$ to the interior of $J$ has the continuous strictly positive density 
#[#set math.equation(numbering: n => "(17)")
 $ rho_(d \, w) \( e \) = 1 / pi bb(E) Im m_o \( e + i 0 \) . $ <eq:tree-density>]

 In particular this holds on an open neighborhood of $I_(d \, kappa)$ when that interval lies in the interior of $J$.]
] <cor:tree-density>

#proof[
  By the definition of the density-of-states measure, $bb(E) m_o \( zeta \) = integral \( t - zeta \)^(- 1) thin d nu_(d \, w) \( t \)$. Lemma 3 gives $L^1$ continuity of $m_o$ on $J times \[ 0 \, h \]$, uniformly on this compact parameter set. Thus $pi^(- 1) bb(E) Im m_o \( e + i eta \)$ converges uniformly on $J$ to the continuous function in (17). For every continuous compactly supported $f$ in the interior of $J$, Poisson kernel approximation and Fubini’s theorem give
  $ integral f thin d nu_(d \, w) = lim_(eta arrow.b 0) 1 / pi integral f \( e \) bb(E) Im m_o \( e + i eta \) thin d e = integral f \( e \) rho_(d \, w) \( e \) thin d e . $
  This identifies the entire restricted measure, including the absence of a singular component. Since the root imaginary part is strictly positive almost surely, its finite expectation is strictly positive at every $e in J$. ◻
]

== 3 A distributional local law on the finite graph <sec:local-law>

We now transfer the tree recursion to the finite random graph. The quantity to be approximated is an empirical distribution of Green functions: the diagonal at a typical vertex retains randomness from its nearby potentials even when the graph is large. The main step is to show that the empirical distribution nearly satisfies the independent branch recursion. Independence will be obtained by sampling and switching edges, rather than imposed on the branches of the finite graph. Throughout this section, $w > 0$ is fixed below the threshold in Proposition 2; constants may depend on $w$. We write

$ zeta = e + i eta \, #h(2em) e in J \, #h(2em) 0 < eta lt.eq h \, #h(2em) y = n eta . $

A positive exponent denoted by $c$ may be decreased in successive estimates. All such exponents are independent of $n \, e \, eta$ in this range.

For an oriented edge $\( v \, v' \)$, let $H^(\[ v v' \])$ be the Hamiltonian obtained by deleting that edge, keeping every potential, and let $G^(\[ v v' \]) \( zeta \) = \( H^(\[ v v' \]) - zeta \)^(- 1)$. Define the random probability measures on $bb(D)$ by

#[#set math.equation(numbering: n => "(18)")
 $ P_H = frac(1, n d) sum_(\( v \, v' \)) delta_(X \( G_(v v)^(\[ v v' \]) \( zeta \) \)) \, #h(2em) P_H^0 = 1 / n sum_v delta_(X \( G_(v v) \( zeta \) \)) . $ <eq:empirical-cavity-laws>]

The first sum is over all oriented edges, and $X$ uses $q \( e \)$ as in Section 2. Let $Q_zeta = "Law" \( Y \( zeta \) \)$ be the tree cavity law in disk coordinates, and let $Q_zeta^0 = "Law" \( X \( m_o \( zeta \) \) \)$ be the full-root law.

#thm([Proposition 3.1.])[
  (Distributional local law).  #emph[There are $c \, C > 0$ and $y_0 < oo$ such that, for $y = n eta gt.eq y_0$, 
#[#set math.equation(numbering: n => "(19)")
 $ bb(P) {W_2 \( P_H \, Q_zeta \) + W_2 \( P_H^0 \, Q_zeta^0 \) > y^(- c)} lt.eq C y^(- c) . $ <eq:distributional-local-law>]

 Here $W_2$ is transportation distance for the Euclidean metric on the disk. The estimate is uniform in $e in J$ and $0 < eta lt.eq h$.]
] <prop:local-law>

We prove this proposition after developing the sampling estimates and the empirical recursion. The estimates are intentionally only powers of $n eta$; later we will first pass to a microscopic limit and then let its imaginary argument grow.

=== 3.1 Averaging potentials and sampling resolvent entries <averaging-potentials-and-sampling-resolvent-entries>

The following bounds hold without a local law. Their uniformity under bounded graph modifications is what permits their use during switching.

#thm([Lemma 3.2.])[
  (Spectral averaging and compression tails).  #emph[Let $H = A + "diag" \( V_v \)$, where $A$ is a real symmetric matrix independent of the iid uniform potentials $V_v in \[ - w \, w \]$. For $Im zeta > 0$, 
#[#set math.equation(numbering: n => "(20)")
 $ bb(E) thin Im G_(v v) \( zeta \) lt.eq C_w \, #h(2em) bb(E) thin "Tr" upright(bold(1))_I \( H \) lt.eq C_w n \| I \| $ <eq:site-averaging>]

 for every interval $I subset bb(R)$. If $S$ consists of at most $k$ vertices chosen without reference to the potentials, then 
#[#set math.equation(numbering: n => "(21)")
 $ bb(P) { parallel G_(S S) \( zeta \) parallel > D } lt.eq C_(w \, k) D^(- 1 \/ 2) \, #h(2em) D gt.eq 1 . $ <eq:compression-tail>]

 The same conclusions hold after any graph modifications chosen independently of the potentials. The compression estimate also holds for the inverse of a fixed strictly dissipative $k times k$ matrix plus an iid uniform real diagonal; its constant is independent of that matrix.]
] <lem:spectral-averaging>

#proof[
  Condition on $A$ and all potentials other than $V_v$. Schur complementation gives
  #[#set math.equation(numbering: n => "(22)")
   $ G_(v v) \( zeta \) = \( V_v - A_v \( zeta \) - i B_v \( zeta \) \)^(- 1) \, #h(2em) B_v \( zeta \) > 0 \, $ <eq:intercept>]
  where $A_v \, B_v$ do not depend on $V_v$. Integration of the Poisson kernel over the allowed interval gives $bb(E)_(V_v) Im G_(v v) lt.eq pi \/ \( 2 w \)$. Integrating in the real spectral parameter, followed by Stieltjes inversion, gives the second inequality in (20). This is the usual rank-one spectral-averaging proof of the Wegner estimate [32]; the arbitrary finite-matrix scope is also recorded in [3] Lemma 3.2.
  For the last assertion, write the inverse as $\( T + "diag" \( v_1 \, dots.h \, v_k \) \)^(- 1)$ with $Im T < 0$. Use $v_1$ and the differences $v_j - v_1$ as coordinates. The joint density is bounded, all the differences range over a fixed compact set, and the remaining variable adds a scalar multiple of the identity on a bounded interval. For any unit vector $a$, the function
  $ f \( z \) = chevron.l a \, \( T_0 - z \)^(- 1) a chevron.r \, #h(2em) z in bb(H) \, $
  where $Im T_0 < 0$, takes values in $bb(H)$ and satisfies $\| f \( i \) \| lt.eq 1$. The function $u \( z \) = Re \( e^(- i pi \/ 4) sqrt(f \( z \)) \)$ is positive harmonic and satisfies $u \( z \) gt.eq 2^(- 1 \/ 2) \| f \( z \) \|^(1 \/ 2)$. The Poisson inequality at $i$, whose kernel is bounded below on each fixed bounded real interval, therefore bounds the integral of $\| f \( t \) \|^(1 \/ 2)$ on that interval. This remains valid by boundary limits if necessary. Polarization, a fixed basis, and equivalence of norms in dimension $k$ give a uniform bound on the integral of the half power of the inverse norm. Markov’s inequality proves (21). To apply this to $G_(S S)$, condition also on the potentials outside $S$ and take its Schur complement. Its effective matrix has strictly negative imaginary part. All conditioning and integration arguments remain valid for graph-selected sets and for graph modifications independent of the potentials. ◻
]

#thm([Lemma 3.3.])[
  (Ward estimate for independently sampled locations).  #emph[Let $v \, v'$ be independent uniform vertices, conditionally on $H$. Then 
#[#set math.equation(numbering: n => "(23)")
 $ bb(E)_(H \, v \, v') \| G_(v v') \( zeta \) \|^2 = frac(1, n eta) bb(E) thin Im (1 / n "Tr" G \( zeta \)) lt.eq C_w / y . $ <eq:sampled-ward>]

 The same estimate applies to vertices read at prescribed positions of two independently sampled oriented edges or finite ordered nonbacktracking tree explorations.]
] <lem:ward>

#proof[
  The identity $G^(*) G = eta^(- 1) Im G$, followed by averaging its diagonal, gives the equality. Lemma 6 gives the inequality. For the final assertion, begin each exploration at a uniform vertex or uniform oriented edge. At each occurrence of a vertex in the nonbacktracking lift, independently order the allowed outgoing stubs, excluding the incoming stub. In an edge-rooted exploration, exclude the marked base edge at its initial vertex as well. Every fixed position then has uniform vertex marginal, because the graph is regular. Different explorations are independent conditional on the graph. This remains true when their images intersect or fail to form trees; no claim of independence among positions within one exploration is used. ◻
]

In a bounded collection of these samples, a collision or a failure of any prescribed fixed-radius tree neighborhood has probability $O \( n^(- 1) \)$. One can expose the configuration matching one pair at a time: each exposure has probability $O \( n^(- 1) \)$ of hitting the bounded set already seen. Conditioning on simplicity multiplies the bound by a fixed constant, since its positive limiting probability for fixed $d$ follows from Bollobás’s enumeration formula [11]; see also [28] Lemma 2.1. Ordering seeds may be retained as marks in this exploration.

=== 3.2 Switching the boundary of a finite tree <switching-the-boundary-of-a-finite-tree>

Local edge switchings are also used to recover probabilistic averaging in local laws for random regular graphs [10,9]. Here they will compare a random empirical cavity law with its own independent-input recursion; the potential-dependent target is the distributional tree law.

For a probability measure $P$ on $bb(D)$, let $Phi_j \( P \)$ be the law obtained from a forward tree with $j$ levels: assign iid potentials to its internal vertices, assign iid $P$-distributed disk values at its $b^j$ leaves independently of those potentials, and apply $F_j$. Thus internal vertices are at distances $0 \, dots.h \, j - 1$ from the root and the input leaves are at distance $j$. Define $Phi_j^0 \( P \)$ with $d$ children at the root and $b$ at all later internal vertices. We also use the augmented laws which record, in their prescribed order, the potentials at all internal vertices together with the output disk value. Empirical observations record the same coordinates from the ordered finite-graph exploration; on failure to form a tree they are assigned a fixed default value. These added coordinates have their ordinary Euclidean metric.

#thm([Proposition 3.4.])[
  (Empirical recursion).  #emph[For each fixed $j gt.eq 1$ there are $c \, C \, y_0 > 0$ such that, when $y gt.eq y_0$, 
#[#set math.equation(numbering: n => "(24)")
 $ bb(P) { W_2 \( P_H \, Phi_j \( P_H \) \) > y^(- c) } lt.eq C y^(- c) . $ <eq:empirical-recursion>]

 The same assertion holds with $P_H^0$ on the left and $Phi_j^0 \( P_H \)$ on the right. Both assertions also hold for the augmented observations just defined. Probabilities in these estimates average over the graph and potentials; the measures being compared are conditional laws obtained by sampling on the realized $H$.]
] <prop:empirical-recursion>

Fix one of the cavity, full-root, or augmented observations in the proposition. For a real test $f$ on its coordinate space, bounded by one and with Lipschitz constant at most one, write $a_H$ for its expectation under that empirical observation law and $d_H$ for its expectation under the corresponding recursion law. Our immediate objective is

$ bb(E) \| a_H - d_H \|^2 lt.eq C y^(- c) . $

This compares the two laws on the same realized graph; comparison of their ensemble averages would not suffice for tree stability.

The marked switch below preserves the joint law of the graph and its sampled observations. It couples one or two observations in a common switched graph $hat(H)$ with recursion outputs that are independent conditional on the original graph $H$. Two observations will therefore compare $bb(E) a_H^2$ with $bb(E) d_H^2$. For the mixed moment $bb(E) \( a_H d_H \)$ we also need to control $d_(hat(H)) - d_H$: the prediction on the original graph must be compared with the prediction on the switched graph.

===== 3.2.1 The marked switch. <the-marked-switch.>

Represent the simple graph by a configuration matching conditioned on simplicity, with $d$ distinguishable stubs at every vertex. Choose a base vertex, or an outgoing base stub whose matched edge will be deleted for the cavity observation. Explore its internal tree of $j$ levels, using the independent ordering seeds from Lemma 7. Each pending downward edge can be written $p - t$, where $p$ is internal and $t$ is at the input level. For each pending stub independently choose a uniform outgoing far stub, with matched edge denoted $u - v$, and replace

#[#set math.equation(numbering: n => "(25)")
 $ \( p - t \, med u - v \) quad mapsto quad \( p - u \, med t - v \) . $ <eq:boundary-switch>]

The operation is performed on the indicated stubs, so several pending edges at one vertex are distinguished. Keep the base mark, internal connecting stubs, and ordering seeds. Replace the far outgoing mark at $u$ by the stub at $t$ that was formerly paired with $p$. On reversal, this new far mark specifies $t - v$, and the pending stub at $p$ now specifies $p - u$; a second application restores the old pairs and marks. Figure 1 distinguishes this switch from a further re-pairing used below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.288, 1.564), [#text(size: 9pt)[boundary switch]])
  circle((0, 0.92), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 0.92), [$p$], anchor: "east")
  circle((1.84, 0.92), radius: 0.07484, fill: black, stroke: none)
  content((1.875, 0.92), [$t$], anchor: "west")
  circle((0, 0), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 0), [$u$], anchor: "east")
  circle((1.84, 0), radius: 0.07484, fill: black, stroke: none)
  content((1.875, 0), [$v$], anchor: "west")
  line((0, 0.92), (1.84, 0.92), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.84, 0.92), (0, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 0), (1.84, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0.368, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (paint: rgb("#b200b2"), thickness: 1.0pt, miter-limit: 10))
  line((2.3, 0.46), (3.036, 0.46), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((3.496, 0.92), radius: 0.07484, fill: black, stroke: none)
  content((3.461, 0.92), [$p$], anchor: "east")
  circle((5.336, 0.92), radius: 0.07484, fill: black, stroke: none)
  content((5.371, 0.92), [$t$], anchor: "west")
  circle((3.496, 0), radius: 0.07484, fill: black, stroke: none)
  content((3.461, 0), [$u$], anchor: "east")
  circle((5.336, 0), radius: 0.07484, fill: black, stroke: none)
  content((5.371, 0), [$v$], anchor: "west")
  line((3.496, 0.92), (3.496, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((3.496, 0), (5.336, 0.92), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((5.336, 0.92), (5.336, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((5.336, 0.69), radius: 0.09978, fill: rgb("#ffffff"), stroke: (paint: rgb("#b200b2"), thickness: 1.0pt, miter-limit: 10))
  content((4.416, -0.598), [#text(size: 9pt)[far mark moves from $u$ to $t$]])
  content((1.288, -1.472), [#text(size: 9pt)[re-pairing before two cuts]])
  circle((0, -2.116), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, -2.116), [$u$], anchor: "east")
  circle((1.84, -2.116), radius: 0.07484, fill: black, stroke: none)
  content((1.875, -2.116), [$v$], anchor: "west")
  circle((0, -3.036), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, -3.036), [$a$], anchor: "east")
  circle((1.84, -3.036), radius: 0.07484, fill: black, stroke: none)
  content((1.875, -3.036), [$b$], anchor: "west")
  line((0, -2.116), (1.84, -2.116), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((1.84, -2.116), (0, -3.036), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, -3.036), (1.84, -3.036), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((2.3, -2.576), (3.036, -2.576), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((3.496, -2.116), radius: 0.07484, fill: black, stroke: none)
  content((3.461, -2.116), [$u$], anchor: "east")
  circle((5.336, -2.116), radius: 0.07484, fill: black, stroke: none)
  content((5.371, -2.116), [$v$], anchor: "west")
  circle((3.496, -3.036), radius: 0.07484, fill: black, stroke: none)
  content((3.461, -3.036), [$a$], anchor: "east")
  circle((5.336, -3.036), radius: 0.07484, fill: black, stroke: none)
  content((5.371, -3.036), [$b$], anchor: "west")
  line((3.496, -2.116), (5.336, -3.036), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((5.336, -3.036), (3.496, -3.036), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((3.496, -3.036), (5.336, -2.116), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((4.416, -3.634), [#text(size: 9pt)[delete both dashed edges: the remaining graph is identical]])
})],
  caption: [Figure 1: The upper switch attaches a sampled cavity at $u$ to the internal vertex $p$, retaining a reversible stub mark. The open circles mark the selected outgoing stubs at $u$ before the switch and $t$ after it. The lower re-pairing is used only to estimate Green entries between the two endpoints of a cut edge. After both displayed edges are removed the graph is unchanged, while $u$ and $v$ belong to different sampled edge groups. The drawings specify stub pairings; they assert no independence of neighboring Green functions. ],
) <fig:local-switch>

Apply the switch only when the internal exploration has no collisions, the required parent and pending stub data are distinct except for shared internal vertices, the far pairs have distinct data disjoint from the explored data, all replacements are simple, and the inverse instructions are applicable and restore the input. On the complementary set define the transformation to be the identity. This definition makes it an involution of the marked sample space. Its nontrivial part preserves weights: the underlying matching, each base mark, each far outgoing stub, and each ordering seed have the same weight before and after the operation. A bounded collection of initially separated tree neighborhoods satisfies all the requirements. In such neighborhoods no new edge duplicates an old edge, and reversal reads the same pending positions and distinct far data. Consequently the excluded set has probability $O \( n^(- 1) \)$.

This also applies to two independently sampled bases, whose internal trees are disjoint outside an $O \( n^(- 1) \)$ event. The two observations use one common switched graph; a cavity observation deletes only its own marked base edge from that graph, not the other observation’s edge. We do not require additional acyclicity among exterior vertices as a condition of reversal. Thus bounded switch averages may ignore failures at cost $O \( n^(- 1) \)$ and otherwise use the original joint law of the graph and its marks. Potentials are attached to vertices and are never used in choosing a switch, so their iid law is preserved.

===== 3.2.2 Resolvent comparison after switching. <resolvent-comparison-after-switching.>

For the next argument, say that a scalar or fixed-dimensional matrix error is small if it has norm at most $y^(- a)$ outside an event of probability at most $C y^(- a)$, for some $a > 0$. There are only boundedly many entries and operations, with bounds depending on $j \, d$. Lemma 6 permits multiplication of a small error by every fixed number of Green entries that occurs below. Indeed, if the original exponent is $a$ and at most $N$ factors occur, restrict each factor to at most $y^epsilon.alt$ with $epsilon.alt < a \/ \( 2 N \)$. The product still has a negative-power bound, and the union of tail exceptions has a negative-power probability. Also $n^(- a)$ is small in this sense since $y lt.eq h n$.

Partition the selected coordinates according to their independent samplings: one group for each base and its internal vertices, original boundary endpoints, and designated parent if present; one group for each far pair. Lemma 7 and Markov’s inequality show that in the unmodified Green matrix all entries joining different groups are small. First sever every pending edge and every far edge, and also sever the base edge for a cavity observation. We claim that the cross-group entries stay small and that each far-pair block stays close to its block with only its own edge deleted.

Here is the finite-rank calculation behind this claim. Suppose a bounded update $B$ is supported in a single group $S$, let $Q = G_(S S)$, and let $Q' = G'_(S S)$ be its updated compression. The identities

#[#set math.equation(numbering: n => "(26)")
 $ \( I + B Q \)^(- 1) & = I - B Q' \,\
G'_(U W) - G_(U W) & = - G_(U S) \( I + B Q \)^(- 1) B G_(S W) $ <eq:group-update>]

hold for any two coordinate sets $U \, W$. Both $Q$ and $Q'$ have the bounds allowed above, since the updates and coordinate choices are independent of the potentials. If $U$ and $W$ are distinct groups, at least one factor crossing to $S$ is small; if both belong to a different group, both crossing factors are small. Formula (26) also applies when one of $U \, W$ is $S$. Severing one group at a time proves the claim. To compare a given far block with its individual single-cut block, perform that group’s cut first.

We still need smallness between the two ends of a severed far edge. This does not follow from the Ward estimate for independent locations, since the endpoints of an uncut edge were sampled together. Introduce another independently sampled far pair, if one is not already available, and write the two pairs as $\( u \, v \)$ and $\( a \, b \)$. Re-pair them as $\( u \, b \)$ and $\( a \, v \)$, and then sever both pairs. The resulting double-cut graph is exactly the same as when $\( u \, v \)$ and $\( a \, b \)$ were severed. The re-pairing is an equal-weight marked switch with $O \( n^(- 1) \)$ failure probability, by the preceding construction. In its new marked representation, $u$ and $v$ belong to different edge groups. The cross-group estimate already proved therefore makes their entry in the double-cut graph small. If the second pair was introduced solely for this argument, restore its original edge: the cross entries between the original groups ${ u \, v }$ and ${ a \, b }$ are small, so (26) preserves the conclusion. This proves the required estimate without any assumption about a cut edge’s two endpoints.

At this point the internal tree to be observed is isolated. Restore all exterior replacement edges $t - v$, postponing attachment of this internal tree until the end. For two bases, also perform the other base’s updates; its parent edge is restored to its ordinary uncut status because the present cavity observation deletes only its own base edge from the common switched graph. Every cross entry from a new leaf $u$ to these update coordinates is small, including the entry to its former partner $v$ just treated by re-pairing. Here take $S$ to be exactly the coordinates changed in this exterior step: the relevant $t$’s and $v$’s and, when present, the other base’s update coordinates. This set excludes the present input leaves and need not be a union of original groups. Formula (26) applies to this support as well: every entry from a present leaf to $S$ is small, and the inverse factor on $S$ still has the fixed-dimensional compression bound. Therefore the boundary Green matrix on the new leaves differs by a small error from the diagonal matrix whose entries are

$ G_(u u)^(\[ u v \]) \( zeta \) $

in the original graph with the individual far edge deleted.

Finally add the $p - u$ edges. On the internal tree the exact Schur matrix uses this boundary compression. The inverse of that Schur matrix is the internal compression of the final graph resolvent, so its norm is at most any fixed small positive power of $y$ outside a negative-power exception, by Lemma 6. Replacing the boundary matrix by its diagonal approximation changes the Schur matrix by a small error. The inverse identity, or its Neumann expansion once the product of inverse norm and error is less than $1 \/ 2$, shows that its inverse changes by a small error as well. With the diagonal substitution, successive leaf elimination is exactly the recursion $F_j$, or its full-root version, with the original internal potentials. The map $X$ has bounded derivative on $bb(H)$, uniformly for $e in J$, and so conversion to disk coordinates preserves the error estimate. This establishes the claimed recursion comparison for each of one or two switched observations on the same switched data.

===== 3.2.3 Replacing empirical internal potentials by iid potentials. <replacing-empirical-internal-potentials-by-iid-potentials.>

The preceding comparison still uses potentials at an empirically sampled base. We next replace their empirical law by the deterministic iid law while keeping independence from the sampled cavity inputs. Let $k_j$ be the number of internal vertices. Bin each potential coordinate on a mesh $n^(- alpha)$, with $alpha > 0$ sufficiently small for this fixed $k_j$. Let $mu_H$ be the empirical law of the internal potential vector, including the ordering randomness and a default on tree failures, and let $mu$ be the iid potential law. For each product bin $B$, one- and two-base explorations give

$ \| bb(E) mu_H \( B \) - mu \( B \) \| = O \( n^(- 1) \) \, #h(2em) \| bb(E) mu_H \( B \)^2 - mu \( B \)^2 \| = O \( n^(- 1) \) . $

Indeed disjoint valid neighborhoods have independent potential vectors, and all failures cost $O \( n^(- 1) \)$. Hence $bb(E) \| mu_H \( B \) - mu \( B \) \| = O \( n^(- 1 \/ 2) \)$. There are $O \( n^(alpha k_j) \)$ bins, so choosing $alpha k_j < 1 \/ 4$, for example, bounds the expected total variation of the binned laws by a negative power of $n$.

Couple the bins maximally and, on a matched bin, fill in an iid vector with its conditional distribution inside that bin. Thus internal potential vectors can be coupled with coordinate error $O \( n^(- alpha) \)$ outside an event of negative-power probability. Given $H$, this coupling uses only the base sampling and additional randomness. It is consequently independent of all far-edge samples, which give iid single-cut values with law $P_H$ conditional on $H$. For two bases use independent such couplings conditional on $H$; their target potential vectors are iid and independent of both collections of inputs. Dependence of $P_H$ on the potentials creates no difficulty in this conditional assertion.

Changing the finitely many internal potentials by the coupled error changes the finite-tree recursion by a small error. This follows from the same Schur inverse perturbation just used. Alternatively, with iid internal potentials the effective finite-tree inverse satisfies the final assertion of Lemma 6, uniformly in its dissipative leaf data. The comparison also records the internal potential coordinates themselves, which proves the augmented version of the approximation.

We have thus constructed the coupling announced above. For one or two bases, $hat(O)_i$ is the observation at base $i$ in the common switched graph, and $R_i$ is the recursion output formed from its original far-edge samples and the coupled iid internal potentials. The bounded test $f$ turns the comparison errors into

#[#set math.equation(numbering: n => "(27)")
 $ bb(E) \| f \( hat(O)_i \) - f \( R_i \) \| lt.eq C y^(- c) . $ <eq:switched-observation-comparison>]

Conditional on $H$, the $R_i$ are independent and $bb(E) \[ f \( R_i \) divides H \] = d_H$. Marked-switch invariance preserves the joint law of $hat(H)$ and its sampled observations $hat(O)_i$, while their comparison partners $R_i$ use the original $H$.

===== 3.2.4 Stability of the recursion prediction under a switch. <stability-of-the-recursion-prediction-under-a-switch.>

For the mixed-moment comparison, we need

#[#set math.equation(numbering: n => "(28)")
 $ bb(E) \| d_(hat(H)) - d_H \| lt.eq C y^(- c) . $ <eq:multiplier-stability>]

To prove it, use fresh independent far-edge samples for the inputs defining $d_H$. Couple the samples in $H$ and $hat(H)$ by their outgoing stubs; they agree away from the bounded set of modified stubs, and overlap with update data has probability $O \( n^(- 1) \)$. The old Green entries between each fresh sample group and the update groups are small by Lemma 7. Sever its own edge first and apply (26) through the remaining cuts and updates, using the union of their coordinates as the support $S$ when an update joins different original groups. These cross entries stay small, and its single-cut diagonal changes by a small error, in half-plane as well as disk coordinates. Use the same fresh iid internal potentials for the two predictions. The dissipative finite-tree compression bound in Lemma 6 and inverse perturbation compare the two outputs. Boundedness of $f$ turns the exceptional probabilities and the good-event errors into (28).

===== 3.2.5 Two observations and transportation distance. <two-observations-and-transportation-distance.>

We can now complete the proof of Proposition 8. With two bases, switch invariance and conditional independence give

$ bb(E) \[ f \( hat(O)_1 \) f \( hat(O)_2 \) \] = bb(E) a_H^2 \, #h(2em) bb(E) \[ f \( R_1 \) f \( R_2 \) \] = bb(E) d_H^2 . $

The coupling bound (27) and $\| f \| lt.eq 1$ therefore imply $\| bb(E) a_H^2 - bb(E) d_H^2 \| lt.eq C y^(- c)$. With one base, switch invariance gives $bb(E) \[ f \( hat(O)_1 \) d_(hat(H)) \] = bb(E) \( a_H d_H \)$. Replacing the multiplier by $d_H$ costs $C y^(- c)$ by (28); replacing $f \( hat(O)_1 \)$ by $f \( R_1 \)$ costs the same by (27). Finally, $bb(E) \[ f \( R_1 \) d_H \] = bb(E) d_H^2$, by conditioning on $H$. Thus

$ \| bb(E) \( a_H d_H \) - bb(E) d_H^2 \| lt.eq C y^(- c) . $

Combining these two comparisons yields

#[#set math.equation(numbering: n => "(29)")
 $ bb(E) \| a_H - d_H \|^2 lt.eq C y^(- c) . $ <eq:empirical-test-variance>]

In particular the comparison is within each random empirical law, not just after ensemble averaging.

For completeness, pass from tests to transportation as follows. Embed the compact coordinate space in a fixed Euclidean cube and use a tent partition of unity on a mesh $delta = y^(- epsilon.alt)$. There are $O \( delta^(- k) \)$ functions for a fixed dimension $k$, each bounded by one and with Lipschitz constant $O \( delta^(- 1) \)$. Applying (29) to rescaled functions bounds the expected sum of their mass discrepancies by $C delta^(- k - 1) y^(- c \/ 2)$. Match the common mass in each tent and couple the unmatched mass arbitrarily. Since each tent has diameter $O \( delta \)$ and the whole space has bounded diameter, the resulting squared transportation cost is at most a constant times $delta^2$ plus that sum of discrepancies. Choose $epsilon.alt$ small and apply Markov’s inequality. This gives (24), with a smaller positive exponent, for the cavity, full-root, and augmented laws. The proof of Proposition 8 is complete.

=== 3.3 Descending the imaginary part <descending-the-imaginary-part>

The empirical recursion now supplies the hypotheses of the tree stability theorem, except for its smallness condition. We establish that condition at a fixed positive height and retain it while descending.

#proof[
  At $eta = h$, the cavity resolvent at a vertex with a sufficiently large fixed tree neighborhood is close to the clean-tree cavity value, first by polynomial approximation of the resolvent and then by the norm perturbation bound $C w \/ h^2$. Equivalently one may approximate the disordered resolvent locally and use its bounded potential perturbation. The polynomial degree is fixed after $h$ and the desired accuracy are chosen; the Hamiltonians have uniformly bounded spectra. The fraction of vertices failing this fixed tree test has expectation $O \( n^(- 1) \)$. Write $delta_(*)$ for the fixed $L^2$ smallness threshold in Proposition 2. As permitted by its parameter order, take $h$ small and then $w_0 \/ h^2$ small enough that the starting disk norm is below $delta_(*) \/ 2$, and take the target tree norm below $delta_(*) \/ 4$. Polynomial approximation with a sufficiently small fixed error then places $P_H$ inside the threshold with failure probability $O \( n^(- 1) \)$.
  Fix $r in \( 0 \, 1 \)$ sufficiently close to one. For any diagonal Green function of a fixed graph or cut graph, Schwarz–Pick applied to its map from $bb(H)$ to $bb(D)$ implies a uniform bound on its change between $e + i eta$ and $e + i r eta$ tending to zero as $r arrow.t 1$. Choose $r$ so that this change is smaller than the gap between the improved smallness bound and the threshold. Starting at $h$, descend through $h \, r h \, r^2 h \, dots.h$, shortening the last step to reach the prescribed $eta$. At each height apply Proposition 8 for $j = 1 \, ell$ and then Proposition 2. Its conclusion places $P_H$ within $C \( n eta \)^(- c)$ of $Q_zeta$, hence back well inside the threshold when $y_0$ is large. This closes the induction.
  The failure probabilities sum geometrically from the smallest height: if $eta_(*)$ is the terminal height, then
  $ sum_(upright("heights ") eta_k gt.eq eta_(*)) C \( n eta_k \)^(- c) lt.eq C' \( n eta_(*) \)^(- c) . $
  The initial $O \( n^(- 1) \)$ failure fits this bound after decreasing $c$. We obtain (19) for $P_H$. For the full-root law, use the full-root version of Proposition 8 with one internal level. Couple the cavity inputs to iid tree inputs optimally and apply the sibling estimate (11), with $d$ children. Its coefficients involve inverse margins of the other tree inputs, whose required fixed moments are bounded. Independence of the coupled input pairs therefore bounds the output $L^2$ error by a constant times the input $W_2$ error. This proves the full statement. ◻
]

=== 3.4 Environment, trace, and microscopic integrability <environment-trace-and-microscopic-integrability>

The disk metric was convenient for stability because it is bounded. For later spectral and eigenvector arguments we need consequences in half-plane coordinates, where large values must be controlled. The intercept $B_v$ in (22) provides that control because it is independent of the potential at the observed site.

#thm([Corollary 3.5.])[
  (Consequences of the local law).  #emph[Fix $E$ in the interior of $J$ and $s in bb(R)$. The following statements hold.]
  + #emph[At $zeta = E + \( s + i y \) \/ n$, in the order $n arrow.r oo$ and then $y arrow.r oo$, the diagonal $G_(v v) \( zeta \)$ at a uniform vertex, jointly with every fixed ordered neighborhood of potentials around $v$, converges to the tree diagonal $m_o \( E + i 0 \)$ with the corresponding tree environment. For any fixed number of independently sampled vertices the joint assertion holds with independent tree environments, and their off-diagonal Green entries tend to zero in probability. The diagonal assertion also holds along every sequence $n eta arrow.r oo$, $\( e \, eta \) arrow.r \( E \, 0 \)$.]
  + #emph[There are $c \, C > 0$ such that, for every sufficiently large fixed $y$, 
#[#set math.equation(numbering: n => "(30)")
 $ limsup_(n arrow.r oo) bb(P) {lr(|Im 1 / n "Tr" G (E + frac(s + i y, n)) - pi rho_(d \, w) \( E \)|) > y^(- c)} lt.eq C y^(- c) . $ <eq:trace-slow-power>]

 The constants are independent of the fixed real number $s$.]
  + #emph[For each fixed $s in bb(R)$ and $y > 0$, the sampled diagonal imaginary parts are uniformly integrable in the following limiting sense: 
#[#set math.equation(numbering: n => "(31)")
 $ lim_(T arrow.r oo) limsup_(n arrow.r oo) bb(E)_(H \, v) [Im G_(v v) (E + frac(s + i y, n)) upright(bold(1))_({ Im G_(v v) \( E + \( s + i y \) \/ n \) > T })] = 0 . $ <eq:microscopic-ui>]

]
  #emph[The double-limit assertion in the first item means that, for bounded continuous tests, the limsup of the discrepancy as $n arrow.r oo$ tends to zero as $y arrow.r oo$.]
] <cor:local-consequences>

#proof[
  For the first item, take the augmented recursion of Proposition 8 with internal levels covering the prescribed neighborhood. By Proposition 5, its input law tends to the tree cavity law. Its internal iid potential coordinates are independent of these inputs by construction. The tree recursion with these data is exactly the joint tree law of the diagonal and the observed neighborhood. For any fixed additional depth this passage only needs weak convergence: all limiting input values lie in the open disk almost surely, where the finite recursion is continuous. Thus no higher inverse-margin order is required as the observed radius grows. Proposition 2 supplies the common-environment boundary continuity. Conversion back to the half-plane is valid since the limiting tree value is finite almost surely. The empirical-law conclusion gives product limits for independently sampled vertices, and their mutual Green entries vanish by (23). These arguments apply along every parameter sequence stated in the corollary. A diagonal choice of sequences gives the stated double-limit formulation. Letting the finite radius increase identifies the limit with the measurable function $m_o \( E + i 0 \)$ of its complete tree environment.
  We next obtain a useful quantitative bound on small intercepts. For a half-plane value $g$ and $x = X \( g \)$, the comparison used in (9) gives
  $ frac(Im g, \| g \|^2) gt.eq c_J \( 1 - \| x \| \) . $
  Couple $P_H^0$ with the tree law using (19). The bounded diameter of the disk also bounds the expectation of its squared transportation error by a negative power of $y$. Markov’s inequality for this coupling and the tree inverse-margin moments show, for a sufficiently small $epsilon.alt > 0$, that
  #[#set math.equation(numbering: n => "(32)")
   $ bb(P)_(H \, v) { B_v \( zeta \) < y^(- epsilon.alt) } lt.eq C y^(- c) . $ <eq:small-intercept-large-height>]
  For example, if the tree disk margin is at least $2 delta$ and the coupling distance is below $delta$, the finite margin is at least $delta$; take $delta$ to be a sufficiently small power of $y^(- 1)$. This proves the bound directly from the two respective tail estimates.
  The intercept formula gives $Im G_(v v) lt.eq B_v^(- 1)$. Since $B_v$ is independent of $V_v$, conditional spectral averaging implies, for every $T > 0$,
  #[#set math.equation(numbering: n => "(33)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] Im G_(v v) upright(bold(1))_({ Im G_(v v) > T }) #scale(x: 120%, y: 120%)[\]] lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] Im G_(v v) upright(bold(1))_({ B_v < T^(- 1) }) #scale(x: 120%, y: 120%)[\]] lt.eq C_w bb(P) { B_v < T^(- 1) } . $ <eq:intercept-tail-mean>]
  This estimate applies after averaging over the uniform vertex as well. Thus truncating the imaginary part at $T = y^epsilon.alt$ loses only a negative-power amount in expectation, by (32). Tree tails have the same property by their moment bounds.
  To compare truncated imaginary parts through the disk local law, first introduce a disk cutoff with margin $y^(- epsilon.alt')$. On the remaining compact subdisk, the function $x mapsto Im X^(- 1) \( x \)$ has a Lipschitz constant bounded by a fixed power of $y^(epsilon.alt')$. Choose $epsilon.alt'$ small enough for the transportation estimate to absorb this factor. The mass removed by the cutoff has a negative-power bound by the same coupling argument. Choose the clipping exponent $epsilon.alt$ still smaller, so that multiplying this mass by $y^epsilon.alt$ retains a negative-power bound. Combining the comparisons and then using Markov’s inequality gives a negative-power bound for the difference between the empirical imaginary trace and $bb(E) Im m_o \( e + i eta \)$. In the microscopic substitution with fixed $s \, y$, continuity of the tree expectation gives $bb(E) Im m_o arrow.r pi rho_(d \, w) \( E \)$ by Corollary 4. This proves (30), after decreasing $c$. All finite-graph constants were uniform in $e in J$, hence are independent of fixed $s$.
  Finally fix a possibly small microscopic height $y > 0$. The quantity $B_v \( zeta \)$ is the imaginary part of the Herglotz function
  $ zeta + chevron.l a_v \, \( H^(\( v \)) - zeta \)^(- 1) a_v chevron.r \, $
  where $H^(\( v \))$ deletes the vertex and $a_v$ is its adjacency column. For $Y gt.eq y$, Harnack’s inequality at the same real part yields
  $ B_v (E + frac(s + i y, n)) gt.eq y / Y B_v (E + frac(s + i Y, n)) . $
  Choose a sufficiently large fixed $Y$. Once $delta < \( y \/ Y \) Y^(- epsilon.alt)$, the probability that the left intercept is below $delta$ is at most the small-intercept probability at height $Y$. Consequently
  $ lim_(delta arrow.b 0) limsup_n bb(P) {B_v (E + frac(s + i y, n)) < delta} lt.eq C Y^(- c) . $
  Let $Y arrow.r oo$ and apply (33) to obtain (31). This last conclusion will retain the normalization of eigenvector marks when taking microscopic limits. ◻
]

== 4 Empirical eigenvector laws and conditional entropy <sec:entropy>

Fix $E in I_(d \, kappa)$, and abbreviate $rho = rho_(d \, w) \( E \) > 0$. The local law describes the environment seen by a typical vertex. We now retain eigenvector coordinates at that vertex as well. The objective of this section is an entropy inequality for their law conditional on the entire potential environment. In Section 5, equality in a complementary entropy bound will identify this conditional law as Gaussian.

Choose a measurable real orthogonal eigenbasis $u_1 \, dots.h \, u_n$, ordered by eigenvalue and normalized by $chevron.l u_i \, u_j chevron.r = n delta_(i j)$. Write

#[#set math.equation(numbering: n => "(34)")
 $ x_i = n \( lambda_i - E \) \, #h(2em) nu_n = sum_(i = 1)^n delta_(x_i) . $ <eq:microscopic-positions>]

A finite list of eigenvectors gives each vertex an $bb(R)^m$-valued mark, one coordinate for each member of the list. We call these coordinates colors. All lists below are finite, but their length is arbitrary and imposes no additional smallness condition on $w$.

=== 4.1 Keeping the empirical law in the limit <keeping-the-empirical-law-in-the-limit>

For a fixed finite list, sample a uniform vertex and read its marked neighborhood. On a tree neighborhood use a uniformly ordered rooted tree isomorphism; outside it use the nonbacktracking lift, recording a failure flag. Conditional on the graph, potentials, and eigenvectors, this procedure defines an empirical probability law. It is important to retain this law, rather than just its average: independent vertex samples are independent conditional on the empirical law.

#thm([Proposition 4.1.])[
  (Marked subsequential limits).  #emph[Every sequence of admissible sizes tending to infinity has a subsequence on which $nu_n$ converges in law to a locally finite point measure $nu$. On a further subsequence one can retain jointly the positions and the empirical marked-neighborhood laws for the eigenvalue-ordered lists in an exhaustion by bounded intervals, together with all their finite truncations and restrictions. Repeated limiting positions retain separate marks.]
  #emph[Almost every resulting empirical law $cal(L)$, with $m$ colors, is an automorphism-invariant law on the $d$-regular tree, whose potential marginal is the deterministic iid uniform law on $\[ - w \, w \]$. If $U_v in bb(R)^m$ is its mark at $v$, then 
#[#set math.equation(numbering: n => "(35)")
 $ bb(E)_(cal(L)) U_o U_o^(sans(T)) = upright(I)_m \, #h(2em) \( V_v - E \) U_v + sum_(u tilde.op v) U_u = 0 quad upright("at every ") v . $ <eq:mark-normalization-equation>]

 The empirical laws and their restrictions to smaller lists can be chosen consistently.]
] <prop:marked-limits>

#proof[
  The Wegner bound of Lemma 6 gives tightness of the point measures on each compact interval. Choose interval endpoints uncharged almost surely by a subsequential limit; such an exhaustion exists, since the expected limiting counts are bounded by the same constant times interval length. Truncate each list length and then stratify by that length. At a uniformly sampled vertex the sum of squared coordinates of a list of length $m$ has mean $m$. This proves tightness of all finite-radius observations. A diagonal extraction retains all radii, list truncations, and interval restrictions, as well as their positions.
  For each fixed radius the fraction of vertices with a non-tree neighborhood tends to zero. Uniform rooted orderings give invariance under root-preserving automorphisms. Sampling an oriented edge and reversing it gives invariance under re-rooting across an edge; together these give full tree-automorphism invariance. The empirical law of the potential labels alone converges in probability to their iid tree law: one and two sampled bounded neighborhoods have this law asymptotically, and two disjoint neighborhoods use independent potentials. Thus this marginal is deterministic inside each limiting $cal(L)$.
  The second-moment assertion needs more than tightness. If the list comes from $\[ - L \, L \]$, spectral decomposition gives
  #[#set math.equation(numbering: n => "(36)")
   $ sum_(i upright(" in list")) u_i \( v \)^2 lt.eq \( 1 + L^2 \) Im G_(v v) \( E + i \/ n \) . $ <eq:marks-dominated-by-resolvent>]
  The right side is uniformly integrable at a sampled vertex by Corollary 9. Consequently the limiting empirical second moments lose no mass. More explicitly, represent the joint convergence almost surely, first pass bounded second-moment truncations, and then remove the truncation using the tail bound in expectation. The empirical moments before taking the limit are exactly $delta_(i j)$, so their limits are the same almost surely; polarization handles the mixed moments. The eigenvalue equations pass to the limit on every finite neighborhood because $lambda_i = E + O_L \( n^(- 1) \)$. Countable consistency gives the assertions simultaneously at all vertices and for all retained lists. ◻
]

We henceforth fix one such $cal(L)$ when making assertions about a conditional law. We write $omega = \( V_v \)_(v in T_d)$ for its full potential environment; thus $omega$ here records the coupled potentials themselves. Expectations with respect to its deterministic iid marginal are denoted $bb(E)_omega$.

=== 4.2 Eliminating a conditional mean <eliminating-a-conditional-mean>

Orthogonality alone does not show that $bb(E)_(cal(L)) \[ U_o divides omega \]$ vanishes. A coherent component depending on the potential environment would survive it. The following perturbation averages such a component over a physical energy interval longer than the microscopic window, while changing the ensemble by a vanishing total variation distance.

#thm([Lemma 4.2.])[
  (Conditional centering).  #emph[For almost every empirical law in Proposition 10, 
#[#set math.equation(numbering: n => "(37)")
 $ bb(E)_(cal(L)) \[ U_v divides omega \] = 0 #h(2em) upright("at every vertex ") v . $ <eq:conditional-zero-mean>]

]
] <lem:conditional-mean>

#proof[
  Let $f$ be a bounded Lipschitz function of the potentials in a fixed rooted ball. Average over its branch orderings and put the corresponding finite-graph value $f \( v \)$ equal to zero at tree failures. First require that $f$ vanish unless the central potential belongs to a compact subinterval of $\( - w \, w \)$. Choose $b_0 in C_c^oo \( \( - w \, w \) \)$, nonnegative and bounded below by a positive constant on that subinterval. For $0 lt.eq t lt.eq a_n := n^(- 2 \/ 3)$, change every potential by
  $ V_v mapsto V_v + t b_0 \( V_v \) . $
  For large $n$ this is a diffeomorphism of $\[ - w \, w \]$, identical near its endpoints. The one-site density ratio is $1 + O \( t \)$, has integral one, and has second moment $1 + O \( t^2 \)$. Independence therefore bounds the total variation distance of the product laws by $O \( sqrt(n) thin t \) = o \( 1 \)$, uniformly over this range. The normalized test vector $f \/ sqrt(n)$ changes by $O_f \( t \)$ in Euclidean norm.
  For the original configuration set $B = "diag" \( b_0 \( V_v \) \)$. The support condition writes $f \/ sqrt(n) = B^(1 \/ 2) q_f$, with $parallel q_f parallel lt.eq C_f$. Scalar spectral averaging gives, for every interval $I$,
  #[#set math.equation(numbering: n => "(38)")
   $ integral_0^(a_n) ⟨f \/ sqrt(n) \, upright(bold(1))_I \( H + t B \) f \/ sqrt(n)⟩ thin d t lt.eq C_f \| I \| . $ <eq:bump-spectral-averaging>]
  For completeness, compress the resolvent by Schur complement to the indices where $B > 0$, and conjugate by $B^(1 \/ 2)$. It becomes $\( t upright(I) - T \)^(- 1)$ with $Im T > 0$ at positive spectral height. The integral of its imaginary part in a vector, over the real $t$-axis, is at most $pi$ times that vector’s squared norm. The Herglotz representation, followed by spectral inversion, proves (38); restricting the nonnegative integrand to $\[ 0 \, a_n \]$ preserves the bound.
  Take $I = E + \[ - L \, L \] \/ n$, divide by $a_n$, and average over the original data. Total variation comparison and the change in the test vector show that
  $ bb(E) ⟨f \/ sqrt(n) \, upright(bold(1))_I \( H \) f \/ sqrt(n)⟩ lt.eq O_f \( n^(- 1 \/ 3) \) + o \( 1 \) . $
  The left side is $bb(E) sum_(x_i in \[ - L \, L \]) \( n^(- 1) sum_v f \( v \) u_i \( v \) \)^2$. Hence every empirical root average against $f$ vanishes in the limit. Passing these first moments is justified by the uniform second-moment bounds. A countable dense collection of tests on all finite balls, followed by an exhaustion of $\( - w \, w \)$ in the central coordinate, determines the full conditional mean. Averaging tests over branch orderings loses no information, since the rooted joint law is invariant under those permutations. Re-rooting proves the claim at every vertex. ◻
]

=== 4.3 Counting labels while retaining the environment <counting-labels-while-retaining-the-environment>

We use natural logarithms, write $H$ for discrete entropy, and write $cal(H)$ for differential entropy. Conditional differential entropy means the integral of the entropy of the conditional law. Our entropy argument follows the colored-tree and Gaussian-smoothing framework of Backhausz and Szegedy [7] Theorems 6.1 and 8.1. The extra issue is that the conditioning environments attached to adjacent vertices overlap. We keep these labels in the count, and later compute their entropy contribution explicitly.

Fix a radius $R gt.eq 0$ and divide $\[ - w \, w \]$ into $Q$ equal intervals. The environment label at a vertex records the rooted isomorphism type of its radius-$R$ neighborhood with these binned potentials, including its central bin. Adjoin a label from any fixed finite alphabet for its mark. Tree failures may use a separate label, which still records the central potential bin. The resulting alphabet has fixed finite size $M$. For any vertex labeling let $T$ be its ordered star histogram, symmetrized over neighbor permutations, and let $S$ be its oriented-edge histogram.

With probability tending to one over the graph and potentials, simultaneously for all such histograms, the number of labelings whose prescribed central bins are correct is at most

#[#set math.equation(numbering: n => "(39)")
 $ exp {n [H \( T \) - d / 2 H \( S \) - log Q + o \( 1 \)]} . $ <eq:environment-type-count>]

The requirement that an entire environment label be correct can only decrease this number. Here is the first-moment count, including the normalization of the potential term. In the configuration model, prescribe each vertex label and the labels desired at its ordered half-edges. If $m_(a b) = n d S \( a \, b \)$, the probability of a compatible matching is

$ frac(product_(a < b) m_(a b) ! thin product_a \( m_(a a) - 1 \) ! !, \( n d - 1 \) ! !) \, $

and is zero unless $m_(a b) = m_(b a)$ and all $m_(a a)$ are even. Its logarithm is $- n d H \( S \) \/ 2 + O_M \( log n \)$. The arrays of each ordered star type $T_0$ number at most $exp \( n H \( T_0 \) \)$, with $H \( T_0 \) lt.eq H \( T \)$. There are only polynomially many types for fixed $M$. Independently, the prescribed central bins agree with the iid potentials with probability exactly $Q^(- n)$. Stirling’s formula, Markov’s inequality with a sublinear exponential allowance, and a union bound prove (39). Conditioning on simplicity changes the estimates by a bounded factor. This is the fixed-alphabet form of the count in [28] Section 3.1, Lemma 3.2; its argument is independent of the eigenvectors and remains valid with the added labels.

=== 4.4 From the count to full conditional entropy <from-the-count-to-full-conditional-entropy>

Fix $eta > 0$ before taking the graph-size limit. Add to the mark array a centered Gaussian field, with independent colors and covariance in each color

#[#set math.equation(numbering: n => "(40)")
 $ Gamma_eta = Im \( H - E - i eta \)^(- 1) = frac(eta, \( H - E \)^2 + eta^2) . $ <eq:entropy-smoothing>]

Let $F^eta$ be the limiting sum of marks and noise. At this fixed height polynomial approximation on the uniformly bounded spectra identifies the local noise covariance with the infinite-tree covariance $Im \( H_(T_d) - E - i eta \)^(- 1)$. Given $omega$, the noise is independent of the marks. Fix neighbor indices $1 \, dots.h \, d$ on the rooted tree used for $cal(L)$. A star observation consists of the root followed by these neighbors; an edge observation consists of the root and neighbor $1$. Their ordering is inherited from the uniformly ordered finite lift, and is the same ordering used in $omega$.

#thm([Proposition 4.3.])[
  (Entropy conditional on the tree environment).  #emph[For almost every empirical law $cal(L)$ with $m gt.eq 1$ colors, and for every fixed height in any prescribed countable set of positive heights, 
#[#set math.equation(numbering: n => "(41)")
 $ & cal(H) \( F_(upright("star"))^eta divides omega \) - d / 2 cal(H) \( F_(upright("edge"))^eta divides omega \)\
 & #h(1cm)  gt.eq m [1 / 2 log \( 2 pi upright(e) thin eta \) - integral log \| t - E - i eta \| thin d nu_(d \, w) \( t \)] . $ <eq:conditional-star-edge-entropy>]

]
] <prop:conditional-entropy>

#proof[
  For fixed environment radius $R$ and number of bins $Q$, let $A_(R \, Q)$ and $B_(R \, Q)$ be the tuples of environment labels seen by the ordered star and edge, respectively. The count first gives an inequality with these finite conditioning data:
  #[#set math.equation(numbering: n => "(42)")
   $ & m [1 / 2 log \( 2 pi upright(e) thin eta \) - integral log \| t - E - i eta \| thin d nu_(d \, w) \( t \)]\
 & quad lt.eq cal(H) \( F_(upright("star"))^eta divides A_(R \, Q) \) - d / 2 cal(H) \( F_(upright("edge"))^eta divides B_(R \, Q) \) + H \( A_(R \, Q) \) - d / 2 H \( B_(R \, Q) \) - log Q . $ <eq:finite-environment-entropy>]
  We shall derive this inequality by removing the mark bins at fixed $R \, Q$. The remaining environment contribution is
  #[#set math.equation(numbering: n => "(43)")
   $ H \( A_(R \, Q) \) - d / 2 H \( B_(R \, Q) \) - log Q . $ <eq:environment-entropy-remainder>]
  Its limit is zero as $Q arrow.r oo$ at fixed $R$; after that cancellation, increasing $R$ gives conditioning on $omega$.
  We first keep the environment radius, its bins, and the noisy-mark bins fixed. Conditional on the finite graph, potentials, and list, only the Gaussian noise is random. The entropy of its binned labeling is at most the entropy of its histogram type plus the logarithm of the number of labelings of that type. The first term is $O \( log n \)$. Using (39) for the second term therefore bounds the entropy per vertex by
  $ bb(E)_(upright("noise")) H \( T \) - d / 2 bb(E)_(upright("noise")) H \( S \) - log Q + o \( 1 \) . $
  We may replace the random histograms by their conditional means in this expression. Indeed their individual cell frequencies have variance tending to zero. To see this, $"Tr" Gamma_eta^2 = O_eta \( n \)$ implies that the average squared cross-covariance between two independently sampled bounded local blocks is $o \( 1 \)$. Their marginal covariances have deterministic upper and positive lower bounds at fixed $eta$. Gaussian continuity consequently makes the average total variation distance to the product of the two marginals tend to zero. This remains true after arbitrary shifts by the fixed eigenvectors and after binning. Overlapping blocks have vanishing probability. Thus all histogram entropies converge to those of the corresponding limiting observations. Gaussian smoothing removes mark-bin boundary atoms, and the potential bins have null boundaries as well.
  We next remove the mark binning, while retaining the finite environment labels. Use cubes of side $Delta$ in $bb(R)^m$, clipped outside a large box. Before clipping, the entropy of the global quantization is at least the global Gaussian differential entropy minus $n m log Delta$: the entropy within any cube is at most its log volume. Clipping changes the entropy per vertex by an amount tending to zero with the box size, at fixed $Delta$. For this last assertion it suffices to bound the average second moment, which is bounded by normalization of the marks and the fixed-height Gaussian covariance bound. For example, compare the tail-bin distribution with summable lattice weights proportional to $\( 1 + \| j \| \)^(- C)$; its entropy is bounded by its tail probability times a logarithmic moment bound. The same argument applies to each finite-dimensional limiting observation.
  After removing the clipping, send $Delta arrow.b 0$. The smoothed densities are bounded and continuous, and have finite second moments. Replacing a density by its uniform filling in each bin gives $L^1$ convergence; the density bound and the preceding tail estimate give entropy convergence. The log-volume terms cancel because $m \( d + 1 \) - \( d \/ 2 \) \( 2 m \) = m$. The lower bound furnished by the full Gaussian array is
  $ 1 / n cal(H) \( upright("global Gaussian noise") \) & = m / 2 log \( 2 pi upright(e) \) + frac(m, 2 n) log det Gamma_eta\
 & = m [1 / 2 log \( 2 pi upright(e) thin eta \) - 1 / n sum_(i = 1)^n log \| lambda_i - E - i eta \|] . $
  The empirical spectral measure converges to $nu_(d \, w)$, by polynomial approximation and convergence of bounded-neighborhood observations. Splitting each limiting joint entropy into the entropy of its environment labels and its conditional mark entropy gives (42).
  We now compute the environment contribution (43) before increasing the radius. Set
  $ s_R = sum_(k = 0)^R b^k \, #h(2em) p_R = sum_(k = 0)^(R - 1) b^k \, #h(2em) p_0 = 0 . $
  The star’s collection of labels reads $1 + d s_R$ potential bins: the ball of radius $R + 1$, with its first neighbor positions ordered and its remaining branches unordered. The edge reads $2 s_R$ bins in its two outward half-balls. When all these bins are distinct the overlaps identify the vertices uniquely. There are $d p_R$ independent outward permutations of $b$ branches in the star reading and $2 p_R$ in the edge reading. Thus
  $ H \( A_(R \, Q) \) & = \( 1 + d s_R \) log Q - d p_R log \( b ! \) + o_Q \( 1 \) \,\
H \( B_(R \, Q) \) & = 2 s_R log Q - 2 p_R log \( b ! \) + o_Q \( 1 \) . $
  For fixed $R$, bin collisions have probability $O_R \( Q^(- 1) \)$; their entropy cost is $O_R \( Q^(- 1) log Q \)$, which justifies the errors. Both the bin counts and the permutation losses cancel in (43), leaving $o_Q \( 1 \)$.
  Take nested potential partitions as $Q arrow.r oo$. Almost surely all finitely many potentials in a reading are distinct, so its limiting information is exactly the corresponding continuous potential configuration modulo the indicated permutations. Conditioning instead on fully ordered potentials in that union does not change the observation entropy: each omitted permutation fixes the observed star or edge, and invariance of $cal(L)$ makes its conditional observation law identical under that permutation. Finally let $R arrow.r oo$; these ordered configurations exhaust $omega$.
  Here the conditioning limits can be justified without subtracting infinite entropies of continuous environments. Use relative entropy with respect to a fixed product Gaussian reference on the observation coordinates and apply monotone convergence on the increasing conditioning sigma-fields. The conditional relative entropy is finite: fixed-height smoothing bounds conditional entropy below by noise entropy, while second moments bound it above. This proves convergence of the conditional entropies and hence (41).
  All passages have been made for fixed finite choices before refinement. To make them hold inside almost every empirical law, include the countably many bin choices and heights in the joint subsequence construction, and take a further subsequence on which the high-probability count bounds hold eventually at every fixed precision. An almost sure representation of the empirical data can retain the original finite data by sampling their conditional law. Their deterministic relations, including the entropy counts and eigenvector normalization, are then preserved. The preceding limits apply to each represented realization and give the stated almost sure assertion. ◻
]

The right side of (41) diverges as $eta arrow.b 0$. This divergence has a specific source: the eigenvalue equation confines the unsmoothed star marks to one hyperplane per color. The next section removes precisely those normal directions, computes the remaining Gaussian constants, and uses the resulting finite entropy inequality to identify the marks.

== 5 Conditional Gaussian rigidity <sec:rigidity>

The entropy inequality of Section 4 contains the covariance of a Gaussian tree resolvent. At height zero that covariance is singular on a star, because it satisfies the same eigenvalue equation as the marks. We first compute its precision on the constraint space. The computation has two uses: it fixes the entropy constants when the height tends to zero, and it splits each edge precision into positive contributions from its two endpoints. Re-rooting will combine these contributions in a Fisher-information comparison.

This follows the Gaussian-comparison and heat-flow architecture of Backhausz and Szegedy [7] Theorem 10.3, Proposition 11.1, Theorem 11.2, and Lemmas 11.3–11.4. Here the covariances depend on the entire random environment. Accordingly, the precision shares are operators depending on that environment, and their cancellation takes place after expectation and re-rooting.

=== 5.1 The Gaussian geometry of a star <the-gaussian-geometry-of-a-star>

All Green functions in this subsection are boundary values at $E + i 0$. At a root $o$, label the neighbors $1 \, dots.h \, d$ and write the incoming cavity messages as

$ g_i = c_i + i b_i \, #h(2em) b_i > 0 \, #h(2em) B_(*) = sum_(i = 1)^d b_i \, #h(2em) t_0 = V_o - E - sum_(i = 1)^d c_i . $

Thus $m_o = \( t_0 - i B_(*) \)^(- 1)$. The unsubscripted $b$ continues to mean $d - 1$. Let $K_o$ be the imaginary part of the tree Green function compressed to the star, and let $K_(o i)$ be its two-coordinate compression to $\( o \, i \)$. These are spatial covariances for one color.

#thm([Lemma 5.1.])[
  (Star and edge precision).  #emph[The centered Gaussian with covariance $K_o$ is supported on the $d$-dimensional hyperplane 
#[#set math.equation(numbering: n => "(44)")
 $ C := \( V_o - E \) Z + sum_(i = 1)^d X_i = 0 . $ <eq:star-constraint>]

 In the coordinate volume $delta \( C \) thin d Z product_i d X_i$, equivalently the volume obtained by forgetting any one neighbor, its precision quadratic form is 
#[#set math.equation(numbering: n => "(45)")
 $ sum_(i = 1)^d frac(\| X_i + g_i Z \|^2, b_i) . $ <eq:star-precision>]

 Write $K_o^(upright("ret"))$ for its covariance in coordinates forgetting neighbor $d$. Then 
#[#set math.equation(numbering: n => "(46)")
 $ det K_o^(upright("ret")) = \| m_o \|^2 product_(i = 1)^d b_i \, #h(2em) h_o^(upright(G)) := cal(H) \( N \( 0 \, K_o^(upright("ret")) \) \) = d / 2 log \( 2 pi upright(e) \) + 1 / 2 sum_i log b_i + log \| m_o \| . $ <eq:star-determinant>]

 If $g'$ is the cavity message from the $o$-side of the edge $\( o \, i \)$, its edge precision and determinant are 
#[#set math.equation(numbering: n => "(47)")
 $ \( Z \, X_i \) K_(o i)^(- 1) \( Z \, X_i \)^(sans(T)) & = frac(\| X_i + g_i Z \|^2, b_i) + frac(\| Z + g' X_i \|^2, Im g') \,\
det K_(o i) & = frac(b_i Im g', \| 1 - g_i g' \|^2) . $ <eq:edge-precision>]

 In particular each edge covariance is positive definite.]
] <lem:tree-precision>

#proof[
  The inverse star Green matrix has central diagonal $V_o - E$, root-neighbor entries $1$, and neighbor diagonals $1 \/ g_i$. Its negative imaginary part is diagonal on the neighbors, with entries $b_i \/ \| g_i \|^2$. The real central row implies that the imaginary covariance annihilates the constraint functional in (44).
  To verify its law and its volume normalization directly, start with independent real Gaussians
  $ Y_i tilde.op N \( 0 \, b_i \) \, #h(2em) Z tilde.op N \( 0 \, B_(*)^(- 1) \) \, $
  and condition on $t_0 Z + sum_i Y_i = 0$. Put $X_i = Y_i - c_i Z$. The quadratic form of the resulting density is exactly (45). Gaussian conditioning gives the imaginary parts of the Green entries
  $ m_o \, #h(2em) - m_o g_i \, #h(2em) delta_(i j) g_i + g_i m_o g_j \, $
  in the root, root-neighbor, and neighbor-neighbor positions, respectively. Hence this conditioned Gaussian has covariance $K_o$. Integrating its density against $delta \( C \)$ gives the normalization
  $ \( 2 pi \)^(d \/ 2) #scale(x: 180%, y: 180%)[\(] product_i b_i #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \| m_o \| \, $
  because $"Var" \( t_0 Z + sum_i Y_i \) = \( t_0^2 + B_(*)^2 \) \/ B_(*)$. The coefficient of the forgotten neighbor in $C$ is one, so this is precisely the normalization in retained-coordinate volume, not Euclidean surface volume. It proves (46).
  On an edge the inverse Green matrix has diagonal entries $1 \/ g'$ and $1 \/ g_i$, and off-diagonal entries $1$. Using its diagonal negative imaginary part, or multiplying the two-by-two matrices, gives (47) and (47). Each of the two precision summands is positive definite: for $g = c + i beta$, its matrix is
  #[#set math.equation(numbering: n => "(48)")
   $ Q \( g \) = 1 / beta mat(delim: "(", \| g \|^2, c; c, 1) \, #h(2em) det Q \( g \) = 1 . $ <eq:one-sided-precision>]
  This also proves edge nondegeneracy. ◻
]

We now put the Gaussian reference laws in common Euclidean coordinates. Let $B_i : bb(R)^d arrow.r bb(R)^2$ read the edge $\( Z \, X_i \)$ from the retained star coordinates, reconstructing $X_d$ from (44) when necessary. Write $U_o^(upright("ret")) = \( U_o \, U_1 \, dots.h \, U_(d - 1) \) in bb(R)^(d m)$ for the retained $m$-color star marks, and define

#[#set math.equation(numbering: n => "(49)")
 $ L_o = \( \( K_o^(upright("ret")) \)^(- 1 \/ 2) ⊗ upright(I)_m \) U_o^(upright("ret")) \, #h(2em) R_i = #scale(x: 120%, y: 120%)[\(] K_(o i)^(- 1 \/ 2) B_i \( K_o^(upright("ret")) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] ⊗ upright(I)_m . $ <eq:whitened-star-edge>]

Then $R_i R_i^(sans(T)) = upright(I)_(2 m)$, so $R_i L_o$ is the whitened edge mark and $P_i = R_i^(sans(T)) R_i$ is the orthogonal projection onto its reading subspace.

The two precision formulas produce positive matrices

$ A_(o i) = #scale(x: 120%, y: 120%)[\(] K_(o i)^(1 \/ 2) Q \( g_i \) K_(o i)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] ⊗ upright(I)_m $

on the whitened edge coordinates. The opposite endpoint defines $A_(i o)$ using its summand of (47); read both in the same oriented edge coordinates. Equations (45) and (47) give the pointwise identities

#[#set math.equation(numbering: n => "(50)")
 $ sum_(i = 1)^d R_i^(sans(T)) A_(o i) R_i = upright(I)_(d m) \, #h(2em) A_(o i) + A_(i o) = upright(I)_(2 m) \, #h(2em) 0 < A_(o i) < upright(I)_(2 m) . $ <eq:precision-split>]

Thus every star’s precision is the sum of its incident contributions, and the two contributions on an edge give its whole precision. These identities are valid in each environment; no averaging of the covariance has been used. Other orthogonal choices of whitened coordinates merely conjugate these formulas.

=== 5.2 The constant in the entropy comparison <the-constant-in-the-entropy-comparison>

Define the logarithmic potential of the tree density of states by

$ U \( zeta \) = integral log \| t - zeta \| thin d nu_(d \, w) \( t \) \, #h(2em) Im zeta > 0 . $

The following identity relates it to the local Gaussian volumes.

#thm([Lemma 5.2.])[
  (Tree logarithmic potential).  #emph[At positive height, with all tree Green functions evaluated at $zeta$, 
#[#set math.equation(numbering: n => "(51)")
 $ - U \( zeta \) = bb(E)_omega log \| m_o \| + d / 2 bb(E)_omega log \| 1 - g_i g' \| . $ <eq:tree-log-potential>]

 Both sides have finite limits as $zeta = E + i eta$, $eta arrow.b 0$. Denote the limit of $U$ by $U \( E \)$. With $h_(o i)^(upright(G)) = cal(H) \( N \( 0 \, K_(o i) \) \)$, 
#[#set math.equation(numbering: n => "(52)")
 $ bb(E)_omega [h_o^(upright(G)) - 1 / 2 sum_(i = 1)^d h_(o i)^(upright(G))] = - U \( E \) . $ <eq:gaussian-entropy-constant>]

]
] <lem:tree-log-potential>

#proof[
  Use real parts of analytic logarithms in the upper half-plane. The edge factor is nonzero, as follows also from its invertible Schur matrix. Differentiating the full-root recursion yields
  $ partial_zeta log m_o = m_o (1 + sum_i partial_zeta g_i) . $
  In the expected derivative of the edge term, edge reversal pairs the two differentiated cavity messages. Its contribution is
  $ - d thin bb(E)_omega frac(\( partial_zeta g_i \) g', 1 - g_i g') = - bb(E)_omega m_o sum_i partial_zeta g_i \, $
  where $m_o = g' \/ \( 1 - g_i g' \)$. The indirect derivatives therefore cancel, leaving $bb(E)_omega m_o$, the analytic derivative whose real part differentiates $- U$. At fixed positive height the resolvent bounds justify differentiation and expectation. Both sides of (51) are asymptotic to $- log \| zeta \|$ at imaginary infinity, which fixes the constant.
  The boundary continuity and logarithmic integrability in Lemma 3, together with the Schur identities, pass the right side to the boundary in expectation. They apply also to the two incoming messages in an edge factor, and prove finiteness of the limit. Finally insert (46) and (47) into the Gaussian entropy formula. The $log \( 2 pi upright(e) \)$ terms cancel by dimension. The $log b_i$ terms cancel in expectation because the two cavity messages on an edge have the same marginal law. The remaining expression is precisely the boundary value of (51), proving (52). ◻
]

Return to the smoothed field $F^eta$ of Proposition 12. At each fixed environment, change star coordinates to the retained coordinates and to the residual $C$ in each color. This linear change has absolute Jacobian one. The marks have zero residual by (35). The noise residual has covariance at most $eta upright(I)_m$, since spectral calculus on the tree gives

$ \( H_(T_d) - E \) Gamma_eta \( H_(T_d) - E \) lt.eq eta upright(I) . $

The entropy chain rule and the Gaussian maximum-entropy bound therefore show that

#[#set math.equation(numbering: n => "(53)")
 $ cal(H) \( F_(upright("star"))^eta divides omega \) lt.eq cal(H) \( F_(upright("ret"))^eta divides omega \) + m / 2 log \( 2 pi upright(e) thin eta \) . $ <eq:residual-entropy-bound>]

Using this upper bound on the left side of (41) cancels exactly its divergent term. What remains has a finite limit.

We give the entropy-continuity details because the full-star covariance itself becomes singular. Take a sequence $eta arrow.b 0$ along which the spatial covariances converge almost surely. In the retained star and edge coordinates their limits are positive definite. At a fixed environment, the convolved densities consequently converge in $L^1$, are uniformly bounded, and have uniformly bounded second moments; the bin-filling and tail argument from Section 4 gives entropy convergence. Conditional mark second moments are finite almost surely. For expectation over environments, positive entropy parts are uniformly integrable by the Gaussian entropy upper bound, the integrable conditional mark second moments, and the spatial tree moment bounds. Negative parts are controlled by the entropy of the independent Gaussian noise and the uniformly integrable log-determinants in Lemma 3. Thus these entropy limits hold also after conditioning and integration.

Subtract $m$ times the pure-Gaussian identity (52) and use the whitenings (49). Write $gamma$ for a standard Gaussian of the dimension appropriate to each occurrence, independent of the marks. With $cal(H)_omega$ denoting entropy under the conditional law at a fixed environment, the result is

#[#set math.equation(numbering: n => "(54)")
 $ cal(D) \( 1 \) := bb(E)_omega [cal(H)_omega \( L_o + gamma \) - 1 / 2 sum_(i = 1)^d cal(H)_omega \( R_i L_o + gamma \)] gt.eq 0 . $ <eq:whitened-entropy-inequality>]

Indeed entropy differences from the corresponding pure noise are unchanged by whitening. The standard Gaussian constants then cancel because $d m = \( 1 \/ 2 \) d \( 2 m \)$. Branch invariance replaces the single-edge average by the displayed sum.

=== 5.3 Heat flow and its equality case <heat-flow-and-its-equality-case>

The precision split now gives a bound in the opposite direction to (54). Adding more Gaussian noise makes its left side increase to zero. Equality forces each edge projection to retain all the corresponding score information, which will determine the conditional density.

#thm([Proposition 5.3.])[
  (Gaussian marks at sampled roots).  #emph[Within almost every empirical law $cal(L)$ of Proposition 10, the conditional root marks have law 
#[#set math.equation(numbering: n => "(55)")
 $ "Law"_(cal(L)) \( U_o divides omega \) = N (0 \, frac(Im m_o \( E + i 0 \), pi rho) upright(I)_m) . $ <eq:conditional-gaussian-marks>]

 In particular the colors are conditionally independent. For any finite collection of independently sampled roots and any retained finite position list, their environments are iid and independent of the limiting point process $nu$. Conditional on these environments and $nu$, all their marks are independent centered Gaussians with the variances in (55). Positions of multiplicity greater than one have one separate color per occurrence.]
] <prop:gaussian-marks>

#proof[
  Fix $cal(L)$, and replace the noise in (54) by $sqrt(s) thin gamma$, defining $cal(D) \( s \)$ for $s > 0$. We first prove $cal(D)' \( s \) gt.eq 0$, keeping the environment dependence explicit.
  For a smooth positive density $p$, its score is $nabla log p$, and its Fisher information is $integral \| nabla log p \|^2 p$. At fixed $omega$, let $X$ have the conditional law of $L_o + sqrt(s) thin gamma$, let $rho_o$ be its score, and let $rho_i$ be the score of $R_i X$. Differentiating a marginal density gives
  $ bb(E) \[ R_i rho_o \( X \) divides R_i X \] = rho_i \( R_i X \) . $
  Thus conditional Jensen and (50) give
  #[#set math.equation(numbering: n => "(56)")
   $ I_o \( s \) & := bb(E) \| rho_o \( X \) \|^2 = sum_i bb(E) \| A_(o i)^(1 \/ 2) R_i rho_o \( X \) #scale(x: 120%, y: 120%)[\|]^2 \,\
I_o \( s \) - sum_i bb(E) \| A_(o i)^(1 \/ 2) rho_i \( R_i X \) #scale(x: 120%, y: 120%)[\|]^2 & = sum_i bb(E) \| A_(o i)^(1 \/ 2) \( R_i rho_o \( X \) - rho_i \( R_i X \) \) #scale(x: 120%, y: 120%)[\|]^2 = : Delta_o \( s \) gt.eq 0 . $ <eq:score-deficit>]
  All expectations on these lines are conditional on $omega$.
  The conditional edge law, read in common whitened coordinates, is the same from its two endpoints. Invariance under re-rooting therefore pairs the $A_(o i)$ term with its $A_(i o)$ term after $bb(E)_omega$. Their sum is the identity. Consequently
  #[#set math.equation(numbering: n => "(57)")
   $ bb(E)_omega sum_i bb(E) \| A_(o i)^(1 \/ 2) rho_i \( R_i X \) \|^2 = 1 / 2 bb(E)_omega sum_i I_(o i) \( s \) \, $ <eq:rerooted-fisher>]
  where $I_(o i) \( s \)$ is the ordinary Fisher information of the edge marginal. De Bruijn’s heat identity now yields
  #[#set math.equation(numbering: n => "(58)")
   $ cal(D)' \( s \) = 1 / 2 bb(E)_omega Delta_o \( s \) gt.eq 0 quad upright("for almost every ") s > 0 . $ <eq:heat-deficit>]
  The comparison of joint and marginal scores belongs to the Fisher-information approach to entropy subadditivity [13]; for fixed projection families, see [14] Proposition 3.3 and Equation (3.15). Combining this comparison with the heat identity [29] follows the tree entropy argument of [7] Lemma 11.4 and Proposition 11.1.
  Here are the analytic justifications for this use of the heat identity. Gaussian smoothing of a finite-second-moment law has finite entropy, and its Fisher information in dimension $q$ is at most $q \/ s$, by conditioning the Gaussian score. On a compact positive-time interval, a fixed positive mass of the input in a bounded ball bounds the absolute logarithm of the convolved density by $C \( 1 + \| x \|^2 \)$. Gaussian-kernel derivative bounds and the input second moment then justify integration of the heat equation against the log density, first with spatial cutoffs and then without them. This gives $d cal(H) \( X \) \/ d s = I \( X \) \/ 2$ in integrated form. Since $0 < A_(o i) < upright(I)$, no inverse-weight moments enter (56); Fisher information is bounded by dimension over $s$, also after environment integration. The entropy bounds used in the preceding subsection justify that integration on compact $s$-intervals. These are also the finite-second-moment hypotheses in [7] Appendix A, Equation (A.1) and Lemmas A.2–A.3.
  As $s arrow.r oo$, $cal(D) \( s \) arrow.r 0$. Indeed, divide each observation by $sqrt(s)$; the dimensional logarithms cancel, and at each environment its entropy tends to standard Gaussian entropy. The noise entropy is a lower bound, and the Gaussian entropy upper bound gives domination by a constant times a logarithmic second moment. Such a bound is integrable even if the whitened second moments themselves are not: with $M \( omega \) = bb(E)_(cal(L)) \[ parallel U_o^(upright("ret")) parallel^2 divides omega \]$,
  $ log #scale(x: 120%, y: 120%)[\(] 1 + bb(E) \[ parallel L_o parallel^2 divides omega \] #scale(x: 120%, y: 120%)[\)] lt.eq log \( 1 + parallel \( K_o^(upright("ret")) \)^(- 1) parallel \) + log \( 1 + M \( omega \) \) . $
  The first term is integrable by the spatial tree estimates, and the second by (35) and invariance. Edge moments obey the same bound. Dominated convergence proves the claim.
  Together with $cal(D) \( 1 \) gt.eq 0$, monotonicity and the zero limit imply $cal(D) \( s \) = 0$ for all $s gt.eq 1$. Equation (58) makes every summand of (56) vanish for almost every such $s$, almost surely in $omega$. Choose one $s$ for which this holds simultaneously at all the countably many re-rootings. Positive definiteness of every $A_(o i)$ gives
  $ R_i rho_o \( X \) = rho_i \( R_i X \) . $
  The densities are positive and smooth, so this identity holds everywhere. Differentiating shows that the symmetric log-density Hessian commutes with every $P_i$.
  We next determine what these commuting projections permit. At one star, they leave the central law free but force the complementary spatial directions to be Gaussian with a common color covariance. We will then read one edge from both endpoints to determine the central law as well.
  For one spatial color, let $w_c$ be the unit direction reading the central coordinate, standardized with its noise variance. The edge-reading space is $"span" { w_c \, a_i }$, where $a_i$ is the unit neighbor reading after its central component is removed. In the Gaussian reference field, conditional on its central value, the residual neighbor covariance is
  #[#set math.equation(numbering: n => "(59)")
   $ "diag" \( b_i \) - frac(\( b_i \)_i \( b_i \)_i^(sans(T)), B_(*)) . $ <eq:residual-neighbor-covariance>]
  It follows that the $a_i$ span the $\( d - 1 \)$-dimensional orthogonal complement of $w_c$, and, for $i eq.not j$,
  #[#set math.equation(numbering: n => "(60)")
   $ chevron.l a_i \, a_j chevron.r = - sqrt(frac(b_i b_j, \( B_(*) - b_i \) \( B_(*) - b_j \))) in \( - 1 \, 0 \) . $ <eq:residual-directions>]
  Here strict inequality in magnitude uses $d gt.eq 3$. In particular these lines are pairwise distinct and nonorthogonal. For $m$ colors all these spaces are tensored with $bb(R)^m$.
  The intersection of the edge-reading spaces is exactly the central color space $"span" \( w_c \) ⊗ bb(R)^m$. A Hessian commuting with all their projections preserves this intersection and its orthogonal complement. On the complement it preserves each $"span" \( a_i \) ⊗ bb(R)^m$, so its restriction there has the form $a_i ⊗ v mapsto a_i ⊗ D_i v$. Self-adjointness and $chevron.l a_i \, a_j chevron.r eq.not 0$ imply $D_i = D_j$. Since the $a_i$ span, the complementary Hessian is spatial identity tensored with one color matrix.
  Vanishing mixed derivatives first split the log density into a central function and a complementary function. In any orthonormal spatial basis of the complement, the latter has zero mixed blocks and identical diagonal color Hessians. It therefore splits into a sum of $d - 1$ functions, each of its own color variable. Since $d - 1 gt.eq 2$, equality of their Hessians for all independent choices of these variables forces the common matrix to be constant. Integrability of the density makes it negative definite. The complementary law is consequently Gaussian, with covariance equal to spatial identity tensored with a positive color matrix, and is independent of the central law.
  It remains to constrain that central law. Read a common edge from its two incident stars. In the whitened two-dimensional spatial edge, their standardized endpoint directions are distinct by (47). They are also nonorthogonal almost surely. Indeed the unstandardized endpoint covariance is
  $ Im \( - m_o g_i \) = - frac(t_0 b_i + B_(*) c_i, t_0^2 + B_(*)^2) . $
  Condition on the incoming branches and vary the independent continuously distributed $V_o$. Its numerator is affine in $V_o$, with nonzero slope $b_i$, so it vanishes with probability zero. A countable union handles all edges.
  In coordinates given by the first endpoint direction and its perpendicular, the edge log-density Hessian has block form $"diag" \( D_c \( z \) \, D \)$, with $D$ the constant Gaussian color block already obtained. The other endpoint direction has coordinates $\( cos theta \, sin theta \)$, with both entries nonzero. Commutation with its projection forces
  $ cos theta sin theta thin \( D_c \( z \) - D \) = 0 . $
  Thus the central block too is the same constant $D$. The entire smoothed star is Gaussian with covariance spatial identity tensored with a color covariance, and the color covariance agrees across every edge.
  Dividing characteristic functions by that of the smoothing Gaussian now proves the same assertion for the unsmoothed marks, with a possibly singular positive semidefinite color covariance $C_(cal(L)) \( omega \)$. Their means vanish by Lemma 11. Edge agreement makes $C_(cal(L)) \( omega \)$ invariant under re-rooting, and the covariance is a measurable function of $omega$ by disintegration of the fixed law $cal(L)$.
  The iid environment is ergodic under tree automorphisms. One direct proof approximates an invariant event by an event depending on a finite ball, moves that ball disjointly far away by an automorphism, and uses independence; approximation then makes the invariant event independent of itself. Root-preserving invariance and re-rooting invariance therefore make $C_(cal(L))$ a deterministic matrix within this fixed empirical law. In original coordinates the root covariance is $\( Im m_o \) C_(cal(L))$. Its expectation is $upright(I)_m$ by Proposition 10, so
  $ \( bb(E)_omega Im m_o \) C_(cal(L)) = upright(I)_m \, #h(2em) C_(cal(L)) = frac(1, pi rho) upright(I)_m . $
  This proves (55) and fixes the same answer for every admissible empirical law.
  Finally, finite vertex samples were conditionally independent samples from their empirical law before taking limits. Their limiting joint law is therefore the corresponding product conditional on $cal(L)$ and the retained positions. The one-root marked-environment marginal has just been shown to be deterministic, with iid environment and the Gaussian conditional kernel (55). Its product has no remaining dependence on $cal(L)$ or on $nu$. This proves the sampled-root assertion, including the conditional formulation and multiplicities. ◻
]

Only the root assertion of Proposition 15 will be used below. The finite-dimensional arguments above require only the fixed spatial covariance and logarithmic estimates from Section 2. Tensoring with $upright(I)_m$ changes dimensions and multiplies log-determinants by $m$; it does not require higher tree moments as the finite list length varies. Thus the disorder threshold chosen there applies to all the lists retained in the subsequence construction.

== 6 Limiting resolvents and potential resampling <sec:resolvents>

Fix the energy $E$ and write $rho = rho_(d \, w) \( E \) > 0$. We continue along the subsequence on which the microscopic point process and marked empirical laws of Proposition 10 converge. Proposition 15 identifies the spectral weights at independently sampled vertices. Our first task is to reconstruct the resolvents from these weights, including their real additive constants. We then use potential resampling to obtain a uniform estimate for the scalar transform and an invariance identity for finitely many potential changes. These are the inputs to Gaussian insertion in the next section.

The passage from Gaussian spectral weights to resolvent control, and the use of a finite-rank change to obtain a scalar equation, follow the methods of [28] Section 4. Here the weights depend on the sampled tree environments. We establish the corresponding statements below using the disordered local law and Gaussian-mark result already proved.

=== 6.1 Analytic limits and the tails of spectral sums <analytic-limits-and-the-tails-of-spectral-sums>

Conditionally on the finite graph and its potentials, sample vertices $v_1 \, v_2 \, dots.h$ independently and uniformly. For fixed $k$ let $W_(n \, k)$ have columns $e_(v_1) \, dots.h \, e_(v_k)$, and define

#[#set math.equation(numbering: n => "(61)")
 $ M_(n \, k) \( z \) = W_(n \, k)^(sans(T)) G \( E + z \/ n \) W_(n \, k) = sum_i frac(b_i b_i^(sans(T)), x_i - z) \, #h(2em) b_i = \( u_i \( v_1 \) \, dots.h \, u_i \( v_k \) \)^(sans(T)) \, quad z in bb(H) . $ <eq:sampled-compression>]

The normalization $parallel u_i parallel^2 = n$ cancels the factor $n$ arising from $lambda_i - E - z \/ n = \( x_i - z \) \/ n$.

These matrix-valued analytic functions are tight for uniform convergence on compact subsets of $bb(H)$. Indeed, Lemma 6 makes $parallel M_(n \, k) \( i \) parallel$ tight. If $f \( z \) = sum_j q_j \/ \( t_j - z \)$ with $q_j gt.eq 0$, then on any fixed compact $cal(K) subset bb(H)$ scalar kernel comparison gives

$ Im f \( z \) lt.eq C_(cal(K)) Im f \( i \) \, #h(2em) \| f \( z \) - f \( i \) \| lt.eq C_(cal(K)) Im f \( i \) . $

Apply these inequalities to real quadratic forms of $M_(n \, k)$ and use polarization. They give compact bounds, and Cauchy’s estimates give equicontinuity on smaller compact sets. Diagonal extraction therefore allows us to retain limits $M_k$, consistently for all $k$, jointly with the positions, all bounded spectral lists, and all fixed-radius sampled environments. Write

$ nu = sum_j delta_(x_j) $

for the limiting microscopic point measure. This notation is distinct from the infinite-tree density-of-states measure $nu_(d \, w)$. An occurrence of a repeated position has its own mark throughout.

We next remove the tails in the imaginary parts and in differences of resolvents. For $z \, z_0$ in a fixed compact subset of $bb(H)$, and $\| x \| > L$ with $L$ large,

#[#set math.equation(numbering: n => "(62)")
 $ Im frac(1, x - z) + lr(|frac(1, x - z) - frac(1, x - z_0)|) lt.eq frac(C, 1 + x^2) . $ <eq:resolvent-tail-kernels>]

The microscopic Wegner estimate gives $bb(E) nu_n \( B \) lt.eq C_w \| B \|$ for every bounded Borel set $B$. Consequently, the expected scalar tail in (62) is $O \( L^(- 1) \)$, uniformly in $n$. For the marked sum, use positive semidefinite residues and the identity

$ bb(E)_(v_1 \, dots.h \, v_k) "Tr" \( b_i b_i^(sans(T)) \) = k . $

Its expected norm tail is also $O_k \( L^(- 1) \)$. Truncation, followed by convergence of bounded marked lists, proves

#[#set math.equation(numbering: n => "(63)")
 $ I \( s \, y \) & := sum_j frac(y, \( x_j - s \)^2 + y^2) \,\
Im M_k \( z \) & = sum_j b_j b_j^(sans(T)) Im frac(1, x_j - z) \,\
M_k \( z \) - M_k \( z_0 \) & = sum_j b_j b_j^(sans(T)) (frac(1, x_j - z) - frac(1, x_j - z_0)) . $ <eq:limiting-poisson>]

The positive sums and the sums of absolute norms in the difference formula are finite almost surely. The scalar imaginary trace converges to $I \( s \, y \)$ as well. Establishing these assertions first on countable dense argument sets and then using the same kernel bounds makes them simultaneous throughout $bb(H)$. They leave open a real constant matrix in $M_k$; determining it requires the large-height behavior.

=== 6.2 Count discrepancy and scalar principal values <count-discrepancy-and-scalar-principal-values>

The slow trace estimate in Corollary 9 passes to the limiting Poisson transform. Thus, for some $c > 0$ and all sufficiently large $y$,

#[#set math.equation(numbering: n => "(64)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \| I \( s \, y \) - pi rho \| > y^(- c) #scale(x: 120%, y: 120%)[\)] lt.eq C y^(- c) . $ <eq:slow-limiting-trace>]

The constants are independent of the fixed real argument $s$. The following elementary consequence will also fix the principal-value normalization of the transform.

#thm([Lemma 6.1.])[
  (Count discrepancy).  #emph[There is a deterministic $chi > 0$ such that, almost surely, 
#[#set math.equation(numbering: n => "(65)")
 $ nu \( \[ v \, u \] \) = rho \( u - v \) + O \( R^(1 - chi) \) \, #h(2em) - R lt.eq v lt.eq u lt.eq R \, #h(2em) R arrow.r oo \, $ <eq:discrepancy>]

 uniformly in $v \, u$. The implicit constant may depend on the realization. The same conclusion holds with any endpoint convention. In particular, 
#[#set math.equation(numbering: n => "(66)")
 $ "PV" sum_(\| x_j \| > R) 1 / x_j = O \( R^(- chi) \) \, #h(2em) sum_(\| x_j \| > R) 1 / x_j^2 = O \( R^(- 1) \) . $ <eq:position-tail-bounds>]

 Here and below $"PV"$ means symmetric truncation in the position: $lim_(L arrow.r oo) sum_(\| x_j \| lt.eq L)$.]
] <lem:discrepancy>

#proof[
  Choose $epsilon > 0$ sufficiently small that $2 epsilon < c \( 1 - epsilon \)$, and consider dyadic $R$. Set $Y = R^(1 - epsilon)$ and use a real grid of mesh $R^(1 - 2 epsilon)$ in $\[ - 3 R \, 3 R \]$. There are $O \( R^(2 epsilon) \)$ grid points. By (64), the sum over dyadic $R$ of their failure probabilities is finite. Moreover, changing the center of a Poisson kernel by at most $R^(1 - 2 epsilon)$ changes its ratio by $1 + O \( R^(- epsilon) \)$, uniformly in the position variable. Borel–Cantelli and positivity therefore give, for some $c_1 > 0$,
  #[#set math.equation(numbering: n => "(67)")
   $ I \( s \, Y \) = pi rho + O \( R^(- c_1) \) \, #h(2em) \| s \| lt.eq 3 R \, $ <eq:poisson-grid-counts>]
  almost surely for all sufficiently large dyadic $R$.
  Every interval of length at most $Y$ in this range has $O \( Y \)$ points: evaluate $I$ at its midpoint and note that each point of the interval contributes at least a constant times $Y^(- 1)$. Covering by such intervals gives $nu \( \[ - R \, R \] \) = O \( R \)$, first dyadically and then at all large radii. It also bounds the number of points in a strip of width $W gt.eq Y$, lying in $\[ - 2 R \, 2 R \]$, by $O \( W \)$.
  For $- R lt.eq v lt.eq u lt.eq R$, integrate $pi^(- 1) I \( s \, Y \)$ over $\[ v \, u \]$. By (67), this gives
  $ integral P_(v \, u \, Y) \( x \) thin d nu \( x \) = rho \( u - v \) + O \( R^(1 - c_1) \) \, #h(2em) P_(v \, u \, Y) \( x \) = 1 / pi integral_v^u frac(Y thin d s, \( x - s \)^2 + Y^2) . $
  Take $W = R^(1 - epsilon \/ 2)$. The strips of width $W$ around the two endpoints contain $O \( W \)$ points. Outside these strips, within $\[ - 2 R \, 2 R \]$, the difference between $P_(v \, u \, Y)$ and the interval indicator is $O \( Y \/ W \)$; the linear count bound makes its total contribution $O \( R Y \/ W \)$. For $\| x \| > 2 R$, $P_(v \, u \, Y) \( x \) lt.eq C R Y \/ x^2$, so dyadic summation using linear counts bounds the remaining contribution by $O \( Y \)$. Hence the sharp and smoothed counts differ by $O \( R^(1 - epsilon \/ 2) \)$, uniformly in the endpoints. This also handles atoms at the endpoints. Taking $0 < chi lt.eq min \( c_1 \, epsilon \/ 2 \)$ proves (65), with a neighboring dyadic radius covering an arbitrary $R$.
  Apply (65) separately to the positive and negative half-lines. Their counting errors are $O \( 1 + t^(1 - chi) \)$ up to distance $t$. In the symmetric sum of $1 \/ x_j$, the two constant-density contributions cancel. Partial summation bounds the remaining tail by $O \( R^(- chi) \)$, since the integrated error is bounded by a constant times $integral_R^oo t^(- 1 - chi) thin d t$. The inverse-square bound follows directly from linear counts. Possible points at zero play no role in these tail statements. ◻
]

We may decrease $chi$ whenever needed. Define

#[#set math.equation(numbering: n => "(68)")
 $ m \( z \) = "PV" sum_j frac(1, x_j - z) . $ <eq:scalar-principal-value>]

Lemma 16 and $1 \/ \( x - z \) = 1 \/ x + O_(cal(K)) \( x^(- 2) \)$ show that this limit exists locally uniformly on $bb(H)$. It is analytic, has imaginary part $I \( Re z \, Im z \)$, and obeys

#[#set math.equation(numbering: n => "(69)")
 $ m \( i y \) = i pi rho + o \( 1 \) \, #h(2em) y arrow.r oo . $ <eq:pv-initial-height>]

For clarity, comparison with the transform of $rho thin d x$ on each half-line bounds the error by

$ C integral_0^oo frac(1 + t^(1 - chi), t^2 + y^2) thin d t = O \( y^(- chi) + y^(- 1) \) \, $

after taking $chi < 1$. The same estimate, up to constants, holds at $e + i y$ when $\| e \| lt.eq y \/ 2$. We will use this uniform variant to start the height descent below. No real centering of finite scalar traces is required: $m$ is defined directly by (68).

=== 6.3 The real constants in the marked resolvent <the-real-constants-in-the-marked-resolvent>

Let $cal(E)_alpha$ be the full potential environment of the $alpha$th sampled tree, including its root potential. Write

#[#set math.equation(numbering: n => "(70)")
 $ m_alpha^(*) = m_o \( E + i 0 \; cal(E)_alpha \) \, #h(2em) & a_alpha = Re m_alpha^(*) \, #h(2em) c_alpha = frac(Im m_alpha^(*), pi rho) \,\
 & A_k = "diag" \( a_1 \, dots.h \, a_k \) \, quad C_k = "diag" \( c_1 \, dots.h \, c_k \) . $ <eq:environment-resolvent-coefficients>]

These variables are finite, and $c_alpha > 0$ almost surely by Proposition 2. The sampled environments are iid and independent of $nu$. Proposition 15 states, jointly with these data, that

#[#set math.equation(numbering: n => "(71)")
 $ b_j = C_k^(1 \/ 2) g_j \, #h(2em) \( g_j \)_j upright(" independent standard Gaussian vectors in ") bb(R)^k \, $ <eq:independent-gaussian-residues>]

conditionally on $nu$ and the environments. Finite spectral lists, including their multiplicities, give a consistent version of this description on an extension of the probability space.

#thm([Proposition 6.2.])[
  (Marked resolvent representation).  #emph[Almost surely, for every finite $k$ and every $z in bb(H)$, 
#[#set math.equation(numbering: n => "(72)")
 $ M_k \( z \) = A_k + "PV" sum_j frac(b_j b_j^(sans(T)), x_j - z) . $ <eq:marked-resolvent>]

 The principal values converge locally uniformly. Moreover, $Im M_k \( z \)$ is positive definite, simultaneously for all these $k \, z$.]
] <prop:marked-resolvent>

#proof[
  Condition on $nu$ and the sampled environments, and put $Z_j = b_j b_j^(sans(T)) - C_k$. Its entries are independent across $j$, centered, and have bounded second moments, with bounds depending on the fixed conditioning data. By (66), $sum_j Z_j \/ \( x_j - i \)$ converges almost surely entrywise when ordered by increasing $\| x_j \|$. Also
  $ sum_(\| x_j \| > 1) frac(parallel Z_j parallel, x_j^2) < oo $
  conditionally almost surely, because its conditional expectation is finite. Thus the difference series between $z$ and $i$ converges absolutely and locally uniformly. Combining it with $C_k m \( z \)$ proves local uniform convergence of the marked principal value, say $S_k \( z \)$. Equations (63) and (63) show that $M_k - S_k$ is a real symmetric matrix constant in $z$.
  Linear counts imply $sum_j \| x_j - i y \|^(- 2) = O \( y^(- 1) \)$. Each entry of the centered marked sum at $i y$ consequently has conditional second moment $O \( y^(- 1) \)$. Together with (69), this yields
  #[#set math.equation(numbering: n => "(73)")
   $ S_k \( i y \) arrow.r i pi rho C_k quad upright("in probability") . $ <eq:marked-pv-height>]
  The convergence remains true without conditioning, by bounded convergence applied to the conditional probabilities.
  We must compare this limit with $M_k \( i y \)$ on the same space as its sampled environments. Corollary 9 gives the large-microscopic-height limit jointly with every fixed-radius environment. Its limiting tree diagonal is the measurable function $cal(E)_alpha mapsto m_alpha^(*)$ of the entire environment. It follows that
  #[#set math.equation(numbering: n => "(74)")
   $ M_k \( i y \) arrow.r "diag" \( m_1^(*) \, dots.h \, m_k^(*) \) quad upright("in probability") . $ <eq:joint-environment-height>]
  Here is the measurable-function point in this inference. Approximate $m_alpha^(*)$ in probability, under the fixed iid environment law, by a bounded continuous function of finitely many potential coordinates. Joint convergence with those coordinates controls the distance to this approximation. The two approximation errors have the same environment law before and after the limit; letting their probabilities tend to zero proves convergence to $m_alpha^(*)$ itself. The off-diagonal entries in (74) tend to zero by the sampled Ward estimate in Lemma 7. Thus this is a statement about the existing environments, rather than only about the marginal distributions of the diagonals.
  Subtract (73) from (74). The constant $M_k - S_k$ equals $"diag" \( m_alpha^(*) \) - i pi rho C_k = A_k$ almost surely, proving (72). Finally, (65) gives infinitely many positions. Conditional on positions and environments, the first $k$ Gaussian columns are linearly independent almost surely. Since all $c_alpha$ are positive, their positive weighted outer products already make $Im M_k \( z \)$ positive definite for every $z in bb(H)$. ◻
]

We have now identified the full analytic compression, including the real part that imaginary-tail estimates could not determine. The next argument uses this formula twice, before and after changing one potential, to improve the scalar transform itself.

=== 6.4 One-site resampling and uniform transform regularity <one-site-resampling-and-uniform-transform-regularity>

At the first sampled vertex, replace its potential $V_1$ by an independent $hat(V)_1$ uniform on $\[ - w \, w \]$, and put $D_1 = hat(V)_1 - V_1$. Both finite ensembles have the original law. We may retain a joint subsequential limit of the old and new data; a hat denotes the latter. Their sampled tree environments differ only at the indicated root, and the finite-rank resolvent identity gives

#[#set math.equation(numbering: n => "(75)")
 $ \( 1 + D_1 M_1 \( z \) \) hat(M)_1 \( z \) = M_1 \( z \) . $ <eq:rank-one-resampling>]

We also need a scalar comparison for this coupling. A rank-one perturbation changes an interval count by at most two. This inequality passes to the limiting point measures on continuity intervals, then to arbitrary endpoint limits. Applying it to intervals between a fixed reference point and $t$ bounds a signed cumulative count by a constant. Partial summation against $\( t - z \)^(- 1)$ on symmetric truncations, with vanishing boundary terms, gives

#[#set math.equation(numbering: n => "(76)")
 $ \| hat(m) \( s + i y \) - m \( s + i y \) \| lt.eq C / y . $ <eq:rank-one-scalar-difference>]

Indeed the integral of $\| \( t - z \)^(- 2) \|$ over the real line is $pi \/ y$. Both principal values exist by Lemma 16. The same argument gives $C_k \/ y$ for a change at any fixed number $k$ of sites.

#thm([Proposition 6.3.])[
  (Uniform transform regularity).  #emph[There is a deterministic $xi > 0$ such that, almost surely, for every fixed $0 < delta < 1$, 
#[#set math.equation(numbering: n => "(77)")
 $ m \( e + i y \) = i pi rho + O \( y^(- xi) \) \, #h(2em) \| e \| lt.eq R \, quad R^delta lt.eq y lt.eq R^2 \, #h(2em) R arrow.r oo . $ <eq:transform-regularity>]

 The implicit constant may depend on $delta$ and the realization.]
] <prop:transform-regularity>

#proof[
  We first prove a pointwise implication under a fixed bound on $m$. For one sampled site, write
  $ M_1 \( z \) = a_1 + c_1 #scale(x: 120%, y: 120%)[\(] m \( z \) + Q \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Q \( z \) = "PV" sum_j frac(g_j^2 - 1, x_j - z) . $
  For every integer $p gt.eq 1$, conditionally on $nu$ and the environment,
  #[#set math.equation(numbering: n => "(78)")
   $ bb(E) #scale(x: 120%, y: 120%)[\(] \| Q \( s + i y \) \|^(2 p) divides nu \, cal(E)_1 #scale(x: 120%, y: 120%)[\)] lt.eq C_p (sum_j \| x_j - s - i y \|^(- 2))^p = C_p (frac(Im m \( s + i y \), y))^p . $ <eq:gaussian-mark-moments>]
  To verify the inequality, first use a finite sum and expand the $2 p$th absolute moment. Every surviving spectral index occurs at least twice because $g_j^2 - 1$ is centered. Each partition of these indices is bounded by the appropriate Gaussian moments and by the $p$th power of the sum of squared weights; for a block of size $q gt.eq 2$, use $sum \| w_j \|^q lt.eq \( sum \| w_j \|^2 \)^(q \/ 2)$. There are only finitely many partitions for fixed $p$. Convergence in these moments then proves the assertion for the series.
  In particular, for every fixed $C_0 \, A < oo$, at any fixed $s \, y$,
  #[#set math.equation(numbering: n => "(79)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| m \( s + i y \) \| lt.eq C_0 \, med \| Q \( s + i y \) \| > y^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] lt.eq C_(A \, C_0) y^(- A) . $ <eq:marked-concentration-implication>]
  Choose $p gt.eq 2 A$ in (78). The identical assertion holds for the hatted ensemble, with any fixed enlarged bound on $\| hat(m) \|$.
  Choose an event $cal(F)$, of probability $p_0 > 0$, on the old environment and the independent new potential such that
  #[#set math.equation(numbering: n => "(80)")
   $ \| m_1^(*) \| + \| hat(m)_1^(*) \| lt.eq C_1 \, #h(2em) Im m_1^(*) \, Im hat(m)_1^(*) gt.eq c_(*) > 0 \, #h(2em) \| D_1 \| gt.eq c_(*) . $ <eq:resampling-environment-event>]
  Here all constants are deterministic for the fixed positive $w$. Such an event exists directly from the cavity formula. The branch sum has finite entries and strictly positive imaginary part almost surely, so with positive probability its modulus is bounded and its imaginary part is bounded below. On that event the root Green function is bounded, with imaginary part bounded below, uniformly for every root potential in $\[ - w \, w \]$. Impose additionally $\| hat(V)_1 - V_1 \| gt.eq w \/ 2$, an event of positive probability. The old environment is independent of $nu$, and the new potential is independent of all old data; hence $cal(F)$ is independent of the old point process.
  Suppose $\| m \( z \) \| lt.eq C_0$. By (76), $\| hat(m) \( z \) \|$ lies in a fixed slightly larger range for $y gt.eq 1$. On $cal(F)$, outside the two exceptions in (79), insert the two marked approximations into (75). Replacing $hat(m)$ by $m$ costs $O \( y^(- 1) \)$ and gives
  #[#set math.equation(numbering: n => "(81)")
   $ P \( m \) & = O \( y^(- 1 \/ 4) \) \,\
P \( t \) & = \( 1 + D_1 \( a_1 + c_1 t \) \) \( hat(a)_1 + hat(c)_1 t \) - \( a_1 + c_1 t \) . $ <eq:resampling-quadratic>]
  The tree branches are unchanged by resampling, so $\( 1 + D_1 m_1^(*) \) hat(m)_1^(*) = m_1^(*)$. Thus the real-coefficient polynomial $P$ vanishes at $i pi rho$ and at its conjugate. Its leading coefficient is $D_1 c_1 hat(c)_1$, whose modulus is bounded below on $cal(F)$. Consequently
  $ P \( t \) = D_1 c_1 hat(c)_1 \( t - i pi rho \) \( t + i pi rho \) . $
  Since $Im m \( z \) > 0$, we have $\| m \( z \) + i pi rho \| gt.eq pi rho$. Equation (81) therefore implies $\| m \( z \) - i pi rho \| lt.eq C_2 y^(- 1 \/ 4)$.
  This conclusion gives an arbitrary-power failure estimate for the old point process alone. More precisely, if
  $ cal(B)_z = { \| m \( z \) \| lt.eq C_0 \, med \| m \( z \) - i pi rho \| > C_2 y^(- 1 \/ 4) } \, $
  then independence gives $bb(P) \( cal(B)_z ∩ cal(F) \) = p_0 bb(P) \( cal(B)_z \)$. But this intersection is contained in the union of the old and new marked-sum exceptions, each of which has unconditional probability at most $C_A y^(- A)$. We have proved
  #[#set math.equation(numbering: n => "(82)")
   $ bb(P) \( cal(B)_(s + i y) \) lt.eq C_(A \, C_0) y^(- A) quad upright("for every ") A > 0 \, $ <eq:scalar-bootstrap-implication>]
  uniformly in the fixed real part $s$. In particular, this reasoning does not require the switched process to have its original law conditionally on the old positions or environments.
  It remains to establish the bound on $m$ needed to use this implication across an expanding region. Fix $0 < delta < 1$ and use, for dyadic $R$, a unit grid in the padded region
  $ \| e \| lt.eq 2 R \, #h(2em) 1 / 2 R^delta lt.eq y lt.eq 2 R^2 . $
  There are $O \( R^3 \)$ grid points. At its top height, the uniform variant of (69) gives $m \( e + i y \) = i pi rho + o \( 1 \)$ uniformly for $\| e \| lt.eq 2 R$. For two heights with $y \/ 2 lt.eq y' lt.eq y$, the absolutely convergent difference series gives
  #[#set math.equation(numbering: n => "(83)")
   $ \| m \( e + i y' \) - m \( e + i y \) \| lt.eq frac(y - y', y') Im m \( e + i y \) lt.eq Im m \( e + i y \) . $ <eq:height-descent-bound>]
  Choose $C_0$ large enough that this inequality places the next height inside $\| m \| lt.eq C_0$ whenever the preceding value is within $1$ of $i pi rho$. Decrease heights by one unit, shortening the last step if necessary; for large $R$ all successive ratios are within the range in (83). At each step (82) then returns the value to within $C_2 y^(- 1 \/ 4)$ of $i pi rho$.
  Choose $A$ so large that $R^(3 - delta A)$ is summable over dyadic $R$. The union bound and Borel–Cantelli exclude all implication failures on these grids for sufficiently large $R$, almost surely. The preceding descent proves the estimate on the grids without any additional trace-bound assumption. Finally,
  #[#set math.equation(numbering: n => "(84)")
   $ \| m' \( z \) \| lt.eq sum_j \| x_j - z \|^(- 2) = frac(Im m \( z \), Im z) . $ <eq:principal-value-derivative>]
  Nearby positive Poisson kernels are comparable. Thus the grid bounds on $Im m$ and (84) fill unit grid gaps at cost $O \( y^(- 1) \)$. Padding permits arbitrary large radii. Taking, for example, any fixed $0 < xi < 1 \/ 4$ absorbs constants. Apply the argument to a countable collection of positive $delta$ tending to zero; for any prescribed $delta$, a smaller one in that collection implies the asserted estimate. ◻
]

=== 6.5 Environment-selected potential changes <environment-selected-potential-changes>

We finally record the invariance identity needed for Gaussian insertion. Each sampled tree has a distinguished root; the #emph[root-excluded environment] means all its potential coordinates other than that root coordinate. A single-site map below preserves the uniform probability measure on $\[ - w \, w \]$. The choice to apply it may depend on the root-excluded environment, which retains the conditional uniform law of the root potential.

#thm([Proposition 6.4.])[
  (Potential-switch identity).  #emph[Fix $k$. At site $alpha lt.eq k$, fix a measure-preserving map $T_alpha : \[ - w \, w \] arrow.r \[ - w \, w \]$ and an event $B_alpha$ measurable in its root-excluded tree environment. Set 
$ D_alpha = bold(1)_(B_alpha) #scale(x: 120%, y: 120%)[\(] T_alpha \( V_alpha \) - V_alpha #scale(x: 120%, y: 120%)[\)] \, #h(2em) D = "diag" \( D_1 \, dots.h \, D_k \) . $

 Then, for every finite set of arguments in $bb(H)$, the imaginary parts of 
#[#set math.equation(numbering: n => "(85)")
 $ m \( z \) - partial_z log det \( upright(I) + D M_k \( z \) \) $ <eq:potential-switch-transform>]

 have jointly the same law as the corresponding imaginary parts of $m \( z \)$. The identity is unconditional. In particular it applies to piecewise translations and to arbitrary measurable root-excluded selections of whether to perform them.]
] <prop:potential-switch>

#proof[
  First suppose the selections depend on fixed-radius potential balls through continuity sets, and the maps are piecewise translations with only null sets of discontinuities. At finite $n$, use these same selections and maps when the $k$ sampled balls are disjoint trees; otherwise make no change. Conditional on the graph, the sampling data, and all potentials except the $k$ central ones, every selection is fixed and every central potential remains independent and uniform. Applying the selected maps therefore preserves the joint finite-graph law. The probability of ball or separation failure is $O_k \( n^(- 1) \)$ for the fixed radii.
  Write $H' = H + W_(n \, k) D W_(n \, k)^(sans(T))$ on this event, and let $x'_i$ be its microscopic eigenvalues. The determinant identity and differentiation in the microscopic variable give exactly
  #[#set math.equation(numbering: n => "(86)")
   $ sum_i frac(1, x'_i - z) = sum_i frac(1, x_i - z) - partial_z log det \( upright(I) + D M_(n \, k) \( z \) \) . $ <eq:finite-potential-trace-identity>]
  Indeed the determinant ratio is $det \( H' - E - z \/ n \) \/ det \( H - E - z \/ n \)$; its logarithmic derivative is $- n^(- 1) "Tr" G' \( E + z \/ n \) + n^(- 1) "Tr" G \( E + z \/ n \)$. This also verifies the sign and the absence of any further factor of $n$ in (86).
  Take imaginary parts. The scalar sums converge by the tail argument preceding (63); the compression functions and their derivatives converge locally uniformly. On the coordinates where $D_alpha eq.not 0$, write the logarithmic derivative as
  #[#set math.equation(numbering: n => "(87)")
   $ "Tr" #scale(x: 120%, y: 120%)[\(] \( D^(- 1) + M_k \( z \) \)^(- 1) M'_k \( z \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:switch-log-derivative>]
  using the corresponding compression. Positive definiteness of $Im M_k \( z \)$ makes $D^(- 1) + M_k \( z \)$ invertible. Zero coordinates can simply be removed. Equivalently, the determinant of $upright(I) + D M_k$ is nonzero, and its logarithmic derivative has no choice-of-branch ambiguity. The continuous mapping theorem now passes (86) to the limit, jointly in any finite list of arguments, and law preservation gives the claimed identity for these selections and maps.
  For completeness, no continuity assumption on a fixed measure-preserving map is needed in the stated result. A bounded measurable $T_alpha$ can, for convergence purposes, be approximated in probability under the uniform root law by continuous functions (or by functions with finitely many interval discontinuities). This follows from approximation of measurable sets in Lebesgue measure by finite unions of intervals, applied to a finite binning of its range. The approximants need not preserve measure: the finite-graph law-preservation identity always uses $T_alpha$ itself. They only establish joint convergence of $T_alpha \( V_alpha \)$ with the resolvents and environment data. The approximation probabilities are the same at every $n$ and in the limit because the root marginals are uniform. This proves the fixed-radius assertion for every measurable measure-preserving map.
  Finally, approximate each general $B_alpha$ in probability by events in finitely many root-excluded coordinates. Such approximation follows from conditional expectations on increasing finite-radius sigma-fields. Each finite-coordinate event can in turn be approximated by a continuity set for its finite product uniform law. All these approximations exclude the root potential. For fixed $k$, the probability that any of the selected maps differs from its approximation tends to zero. On their agreement event, (85) is exactly unchanged; therefore its finite-dimensional law converges in the approximation. The preceding identity passes to the limit. Independent branch orderings can be included among the sampling data when an event uses ordered coordinates. ◻
]

All limits in this section use a fixed number of sampled sites. The next section increases that number inside the already constructed limiting law, using Proposition 19 at each finite value.

== 7 Gaussian insertion by potential permutations <sec:insertion>

Fix a microscopic subsequential law $nu = sum_j delta_(x_j)$ from Sections 4–6. We shall approximate its law by eigenvalues of a finite diagonal matrix plus Gaussian noise. The number of potential changes will grow only inside this already constructed limiting probability space. Thus the finite-list Gaussian mark theorem is sufficient; no assertion about a growing list of finite-graph vertices is needed.

The mechanism is to make many small, measure-preserving potential changes. The potential-switch identity will represent their effect, after truncating the spectral sum, by signed rank-one perturbations of a diagonal matrix of microscopic positions. Conditional on those positions and the sampled environments, the Gaussian marks make the perturbation’s mean scalar and its covariance that of a GOE matrix. We will compare it with Gaussian noise after controlling its spectral tails. The scalar mean need not vanish, so it will remain in the comparison matrix.

The matrix estimates below adapt the Gaussian insertion argument of [28] Sections 5.3–5.5. We give their proofs because the coefficients here come from potential permutations, and their size and cancellation must be established for the disordered model.

=== 7.1 Potential permutations and their coefficients <potential-permutations-and-their-coefficients>

We use $r$ sampled roots and potential increments of size comparable to $theta$, chosen so that their total variance has scale $T = r theta^2$. Two spectral cutoffs serve different purposes. A large outer cutoff $L$ makes the switch determinant a finite matrix expression, with a negligible tail even though the determinant has up to $r$ coordinates. We will then remove the positions outside the much smaller window $\[ - K \, K \]$. The remaining matrix has order $K$, small enough for the Gaussian replacement error to vanish.

Decrease the deterministic discrepancy exponent in Lemma 16 if necessary so that $0 < chi < 1 \/ 4$, and fix the following scales:

#[#set math.equation(numbering: n => "(88)")
 $ 0 < tau < chi \/ 100000 \, #h(2em) T = r^tau \, quad K = r^(1 \/ 100) \, quad L = r^(100 \/ chi) \, #h(2em) theta = \( T \/ r \)^(1 \/ 2) . $ <eq:sw-parameters>]

All limits in this section have $r arrow.r oo$. For clarity, the almost-sure consequences used later will be taken along the deterministic sequence $r = 2^j$; any faster increasing integer sequence would also do.

At each independently sampled tree root $alpha$, write

$ m_alpha^(*) \( v \) = \( v - E - sum_(i = 1)^d g_(alpha i) \)^(- 1) \, #h(2em) a_alpha \( v \) = Re m_alpha^(*) \( v \) \, #h(2em) c_alpha \( v \) = frac(Im m_alpha^(*) \( v \), pi rho) . $

Here $v in \[ - w \, w \]$ is the root potential and the incoming cavity values depend only on the environment away from that root. They are finite with positive imaginary parts almost surely. We can therefore choose a fixed event $cal(A)$, measurable without the root potential, of positive probability, on which

$ \| E + sum_i Re g_(alpha i) \| lt.eq C_0 \, #h(2em) c_0 lt.eq sum_i Im g_(alpha i) lt.eq C_0 $

for fixed $c_0 \, C_0 > 0$. On $cal(A)$, the functions $a_alpha \, c_alpha$ are uniformly bounded and Lipschitz on $\[ - w \, w \]$, and $c_alpha$ is bounded below by a positive constant. These statements follow directly by differentiating $\( v - A - i B \)^(- 1)$ on the displayed compact range of $A \, B \, v$.

Choose an integer $N_r$ such that $ell_r = w \/ N_r asymp theta$, and partition $\[ - w \, w \]$ into $N_r$ intervals of length $2 ell_r$. On $cal(A)$, interchange the two halves of each interval by translation. Off $cal(A)$, leave the potential unchanged. This is a measure-preserving involution conditionally on the root-excluded information. Denote its increment at the first $r$ sampled roots by $D_alpha$; at an active root, $D_alpha = plus.minus ell_r$. Proposition 19 applies to these choices.

Evaluate $a_alpha \, c_alpha$ at the original root potential, and define

#[#set math.equation(numbering: n => "(89)")
 $ beta_alpha = frac(c_alpha D_alpha, 1 + a_alpha D_alpha) \, #h(2em) beta = "diag" \( beta_1 \, dots.h \, beta_r \) \, #h(2em) s_1 = "Tr" beta \, quad s_2 = "Tr" beta^2 . $ <eq:sw-coefficient-bounds>]

Inactive coordinates have $beta_alpha = 0$. For all large $r$, the denominators are bounded away from zero, and

#[#set math.equation(numbering: n => "(90)")
 $ parallel beta parallel lt.eq C theta \, #h(2em) c T lt.eq s_2 lt.eq C T \, #h(2em) \| s_1 \| lt.eq C T $ <eq:insertion-coefficients>]

with probability tending to one. The first and upper second bounds are deterministic. The lower second bound follows from the positive proportion of active roots, since $\| beta_alpha \| asymp ell_r$ there. For the last bound, pairing the two halves of each interval gives

$ \| bb(E) beta_alpha \| lt.eq C ell_r^2 \, #h(2em) "Var" \( beta_alpha \) lt.eq C ell_r^2 . $

Indeed the contributions $ell_r c \( v \)$ and $- ell_r c \( v + ell_r \)$ cancel to order $ell_r^2$, and the factor $\( 1 + a D \)^(- 1)$ differs from one by $O \( ell_r \)$. Independence of the root environments now gives $\| bb(E) s_1 \| lt.eq C T$ and $"Var" s_1 lt.eq C T$. Chebyshev’s inequality makes the failure probability $O \( T^(- 1) \)$; the active-site count has exponentially small failure probability. Along $r = 2^j$ these failures are summable, so (90) holds eventually almost surely.

Let $cal(E)$ be the sigma field generated by $nu$ and all sampled tree environments, including their root potentials. We shall condition on almost every realization of $cal(E)$ for which (90), Lemma 16, and Proposition 18 hold eventually. After this conditioning, all coefficients and positions are deterministic; the standardized Gaussian marks remain independent standard Gaussian variables.

Put $I = { j : \| x_j \| lt.eq K }$, $m_I = \| I \|$, and $D_I = "diag" \( x_j : j in I \)$. In this section a #emph[raw GOE] matrix has independent upper-triangular entries of variance one off the diagonal and two on the diagonal, and centered Gaussian entries throughout.

#thm([Proposition 7.1.])[
  (Gaussian insertion).  #emph[On the preceding extension of any microscopic subsequential law, let $cal(W)_r$ be the upper-left $m_I$-dimensional block of an infinite raw GOE array independent of $cal(E)$, and set 
#[#set math.equation(numbering: n => "(91)")
 $ H_r = D_I + s_1 upright(I)_(m_I) + sqrt(s_2) thin cal(W)_r . $ <eq:insertion-matrix>]

 Then, along $r = 2^j$, the raw eigenvalue counting measures 
$ nu^(\( r \)) = sum_(j = 1)^(m_I) delta_(lambda_j \( H_r \)) quad arrow.r.double quad nu $

 converge in law for the local vague topology, without conditioning. Moreover $m_I = 2 rho K + O \( K^(1 - chi) \)$ almost surely, and the coefficient bounds (90) hold eventually almost surely.]
] <prop:gaussian-insertion>

The proof follows the two cutoffs just described. First, truncation at $L$ turns the potential-switch determinant into the resolvent trace of $D_x + cal(G) beta cal(G)^(sans(T))$, where $D_x$ lists the retained positions and $cal(G)$ has independent standard Gaussian entries. Weighted resolvent estimates then remove the positions outside $\[ - K \, K \]$. Finally, a second-order replacement of the independent rank-one summands gives the scalar shift $s_1$ and GOE variance $s_2$ in (91).

=== 7.2 The first cutoff and the finite matrix <the-first-cutoff-and-the-finite-matrix>

The discrepancy estimate and partial summation give

#[#set math.equation(numbering: n => "(92)")
 $ nu \( \[ - R \, R \] \) = O \( R \) \, #h(2em) lr(|"PV" sum_(\| x_j \| > R) 1 / x_j|) = O \( R^(- chi) \) \, #h(2em) sum_(\| x_j \| > R) 1 / x_j^2 = O \( R^(- 1) \) . $ <eq:sw-tail-sums>]

These bounds hold for all sufficiently large $R$, with constants depending on $nu$. Write

$ M_r \( z \) = A_r + C_r^(1 \/ 2) ("PV" sum_j frac(g_j g_j^top, x_j - z)) C_r^(1 \/ 2) \, quad A_r = "diag" \( a_alpha \) \, quad C_r = "diag" \( c_alpha \) \, $

using Proposition 17; the $g_j$’s are independent standard Gaussian vectors of dimension $r$. We restrict inverse matrices below to active coordinates, whose number is at most $r$. All norm estimates through the first-cut comparison concern these active compressions. On them $C_r$ is bounded above and below uniformly; inactive coordinates contribute the identity to the switch determinant.

For a fixed finite list of $z$’s in $bb(H)$, let $M_(r \, L)$ be the same expression restricted to $\| x_j \| lt.eq L$. Conditional on $cal(E)$,

#[#set math.equation(numbering: n => "(93)")
 $ parallel M_r - M_(r \, L) parallel + parallel M'_r - M'_(r \, L) parallel = O_(bb(P)) \( r^2 L^(- chi) \) \, #h(2em) parallel M'_r parallel = O_(bb(P)) \( r^2 \) . $ <eq:insertion-first-tail>]

For the means use (92). Each centered entry of the tail has variance $O \( L^(- 1) \)$, and summing squared entries proves the bound in Hilbert–Schmidt norm; the derivative has an even smaller tail. The derivative bound for the full matrix follows from $sum_j \| x_j - z \|^(- 2) < oo$, first moments of Gaussian squares, and the Hilbert–Schmidt or trace bound for its absolute summands.

With probability tending to one, both $Im M_r \( z \)$ and $Im M_(r \, L) \( z \)$ are at least $r^(- 5) upright(I)$ on active coordinates. To see this, retain only points $\| x_j \| lt.eq r^4$. There are $2 rho r^4 + O \( r^(4 \( 1 - chi \)) \)$ such points; each Poisson weight is at least $c_z r^(- 8)$. Their empirical Gaussian covariance tends in operator norm to the identity: the expected squared Hilbert–Schmidt error is $O \( r^2 \/ r^4 \) = O \( r^(- 2) \)$. The uniform lower bound on $C_r$ then gives a lower bound of order $r^(- 4)$, and hence the claimed weaker bound. The same retained points occur in the cutoff because $L > r^4$.

The potential increment matrix $D = "diag" \( D_alpha \)$ is real and invertible on active coordinates. Thus

$ parallel \( D^(- 1) + M_r \)^(- 1) parallel + parallel \( D^(- 1) + M_(r \, L) \)^(- 1) parallel lt.eq 2 r^5 $

on the preceding event. The inverse identity and (93) therefore show that replacing $M_r$ by $M_(r \, L)$ in $"Tr" \( \( D^(- 1) + M_r \)^(- 1) M'_r \)$ costs $o_(bb(P)) \( 1 \)$. Explicitly, after the trace and derivative are bounded, the inverse difference multiplies the tail error by at most $O_(bb(P)) \( r^13 \)$, and $r^15 L^(- chi) = r^(- 85) arrow.r 0$. The scalar principal-value transform $m$ may also be cut at $L$ with an error tending to zero by (92).

Let $D_x = "diag" \( x_j : \| x_j \| lt.eq L \)$, and let $cal(G)$ have rows indexed by these points and $r$ independent standard Gaussian columns. Determinant interchange gives

$ det \( upright(I) + D M_(r \, L) \( z \) \) & = det \( upright(I) + D A_r \) thin det #scale(x: 120%, y: 120%)[\(] upright(I) + beta cal(G)^top \( D_x - z \)^(- 1) cal(G) #scale(x: 120%, y: 120%)[\)]\
 & = det \( upright(I) + D A_r \) thin frac(det \( D_x + cal(G) beta cal(G)^top - z \), det \( D_x - z \)) . $

In particular, if

$ cal(S)_r \( z \) = m \( z \) - partial_z log det \( upright(I) + D M_r \( z \) \) \, #h(2em) A' = cal(G) beta cal(G)^top \, $

then

#[#set math.equation(numbering: n => "(94)")
 $ cal(S)_r \( z \) = "Tr" \( D_x + A' - z \)^(- 1) + o_(bb(P)) \( 1 \) . $ <eq:sw-finite-matrix>]

Only the logarithmic derivative is used, so no choice of a logarithm branch is required. For every fixed $r$, the joint unconditional law of the imaginary parts of $cal(S)_r$ is that of $m$, by Proposition 19.

=== 7.3 Removing the outer positions <removing-the-outer-positions>

The finite matrix in (94) still has order $L$. We next compare its resolvent trace with that of the inner block indexed by $I$. This will leave a matrix of order $K$, small enough for the Gaussian replacement.

Let $F = { j : K < \| x_j \| lt.eq L }$, so that the indices of $D_x$ split into $I \, F$. For a fixed $z in bb(H)$, define the separate block resolvents

$ G_F = \( D_F + A'_(F F) - z \)^(- 1) \, #h(2em) G_I = \( D_I + A'_(I I) - z \)^(- 1) . $

The upper-left block of the full resolvent is $\( G_I^(- 1) - Sigma \)^(- 1)$, where

$ Sigma = A'_(I F) G_F A'_(F I) . $

Thus we must control both the direct far-block trace and the effect of this Schur correction on the inner resolvent.

The diagonal positions give a natural weight on the far block, where $\| x_j \| > K$. On the inner block we regularize the same weight at the larger height $h_1 = T^2$, where the perturbation tends to zero in the weighted norm used below. Set

#[#set math.equation(numbering: n => "(95)")
 $ h_1 = T^2 \, #h(2em) U_I = \( \| D_I \| + h_1 \)^(- 1 \/ 2) \, #h(2em) U_F = \| D_F \|^(- 1 \/ 2) . $ <eq:sw-weights>]

Partial summation using (92) gives

#[#set math.equation(numbering: n => "(96)")
 $ "Tr" U_I^2 + "Tr" U_F^2 = O \( log r \) \, #h(2em) parallel U_I^2 parallel lt.eq h_1^(- 1) \, quad parallel U_F^2 parallel lt.eq K^(- 1) . $ <eq:sw-weight-bounds>]

For example, the inner sum is bounded by integrating the linear count bound against $\( \| x \| + h_1 \)^(- 1)$; the far sum is treated in the same way between $K$ and $L$. Both endpoints are fixed powers of $r$. In the following estimates, $"polylog" \( r \)$ denotes a fixed power of $log r$, whose exponent may increase from one occurrence to the next.

We will show that $G_F$ is close to $D_F^(- 1)$ in these weights, that $parallel U_I Sigma U_I parallel = o_(bb(P)) \( T^(- 5) \)$, and that $parallel U_I^(- 1) G_I \( z \) U_I^(- 1) parallel = O_(bb(P)) \( T^2 \)$. The last two estimates make the inner resolvent change small even after the two inverse factors in the resolvent identity. The logarithmic trace bounds above then turn weighted norm control into trace control. We begin with the Gaussian block estimates that supply these bounds.

#thm([Lemma 7.2.])[
  (Weighted block estimates).  #emph[For $cal(A) = I \, F$, put $a_I = h_1$, $a_F = K$. With probability tending to one, 
#[#set math.equation(numbering: n => "(97)")
 $ ∥U_(cal(A)) \( A'_(cal(A) cal(A)) - s_1 upright(I) \) U_(cal(A))∥ lt.eq "polylog" \( r \) (sqrt(T \/ a_(cal(A))) + theta) . $ <eq:sw-bernstein>]

 Moreover, for $P_0 = U_I A'_(I F) U_F$, 
#[#set math.equation(numbering: n => "(98)")
 $ parallel P_0 parallel_(upright("HS"))^2 lt.eq T "polylog" \( r \) $ <eq:sw-cross-block>]

 with probability tending to one.]
] <sw:weighted-blocks>

#proof[
  The centered matrix in (97) is a sum of independent self-adjoint matrices
  $ sum_(alpha = 1)^r beta_(alpha alpha) \( v_alpha v_alpha^top - P \) \, #h(2em) P = U_(cal(A))^2 \, $
  where $v_alpha$ is Gaussian of covariance $P$. Its coefficients may have either sign. Gaussian fourth moments give
  #[#set math.equation(numbering: n => "(99)")
   $ bb(E) \[ \( v_alpha v_alpha^top \)^2 \] = \( "Tr" P \) P + 2 P^2 . $ <eq:sw-fourth-moment>]
  Truncate each original Gaussian column on the event that all its entries have absolute value at most $log r$, and center the truncated summand. There are only polynomially many entries, so this alters the matrices with superpolynomially small probability. Gaussian tails also make the resulting centering correction superpolynomially small.
  Each truncated summand has norm at most
  $ C parallel beta parallel \( log r \)^2 "Tr" P lt.eq theta "polylog" \( r \) . $
  If $X$ is a self-adjoint random matrix, then $bb(E) \[ \( X - bb(E) X \)^2 \] = bb(E) \[ X^2 \] - \( bb(E) X \)^2 lt.eq bb(E) \[ X^2 \]$. Also truncating $v_alpha v_alpha^top$ by an event can only decrease the expectation of its square in positive semidefinite order. Thus (99), including for negative $beta_(alpha alpha)$, bounds the matrix variance parameter by
  $ C s_2 \( "Tr" P \) parallel P parallel lt.eq T / a_(cal(A)) "polylog" \( r \) . $
  The bounded self-adjoint matrix Bernstein inequality [30] Theorem 1.4, applied to both signs, gives, for a sum of independent centered self-adjoint matrices of norm at most $b$ and variance parameter $sigma_(upright("mat"))^2$, a two-sided tail bounded by
  $ 2 \| cal(A) \| exp (- frac(c t^2, sigma_(upright("mat"))^2 + b t)) . $
  Its dimension factor is polynomial in $r$. Taking a sufficiently large power of $log r$ in $t$ proves (97).
  For the cross block, independence of distinct Gaussian rows and direct second-moment calculation give
  $ bb(E) parallel P_0 parallel_(upright("HS"))^2 = s_2 \( "Tr" U_I^2 \) \( "Tr" U_F^2 \) . $
  Equation (98) follows from (96) and Markov’s inequality, with one additional logarithmic factor. ◻
]

We first apply the weighted block estimates to the far resolvent $G_F$ and the Schur correction $Sigma$, keeping $z in bb(H)$ fixed.

#thm([Lemma 7.3.])[
  (Far block and Schur correction).  #emph[Let 
$ delta_F = "polylog" \( r \) (frac(1 + T, K) + sqrt(T / K) + theta) . $

 Then 
#[#set math.equation(numbering: n => "(100)")
 $ parallel U_F^(- 1) \( G_F - D_F^(- 1) \) U_F^(- 1) parallel lt.eq delta_F = o \( 1 \) $ <eq:sw-far-resolvent>]

 with probability tending to one, and $"Tr" G_F = o_(bb(P)) \( 1 \)$. For the Schur correction $Sigma$, 
#[#set math.equation(numbering: n => "(101)")
 $ parallel U_I Sigma U_I parallel = o_(bb(P)) \( T^(- 5) \) . $ <eq:sw-schur-small>]

]
] <sw:schur>

#proof[
  Conjugating the matrix to be inverted by $U_F$ gives
  $ U_F \( D_F + A'_(F F) - z \) U_F = "sign" \( D_F \) + U_F \( A'_(F F) - z \) U_F . $
  The second term has norm at most $delta_F$, by Lemma 21, the bound $\| s_1 \| = O \( T \)$, and (96). Since $delta_F = o \( 1 \)$, a Neumann expansion proves (100). In particular, $Q_F = U_F^(- 1) G_F U_F^(- 1)$ has bounded norm. By (92),
  $ lr(|sum_(j in F) 1 / x_j|) = O \( K^(- chi) \) \, #h(2em) \| "Tr" \( G_F - D_F^(- 1) \) \| lt.eq delta_F "Tr" U_F^2 = o \( 1 \) . $
  This proves the assertion about the far trace.
  For the Schur correction, replacing $G_F$ by $D_F^(- 1)$ costs at most
  #[#set math.equation(numbering: n => "(102)")
   $ parallel P_0 parallel_(upright("HS"))^2 delta_F lt.eq T "polylog" \( r \) delta_F $ <eq:sw-schur-replacement>]
  in the norm weighted on both sides by $U_I$. It remains to estimate $A'_(I F) D_F^(- 1) A'_(F I)$. Condition further on the inner Gaussian row block $cal(G)_I$, and set
  $ Q = cal(G)_I beta^2 cal(G)_I^top . $
  The columns of $A'_(I F)$, indexed by $j in F$, are then independent centered Gaussian vectors $a_j$ with covariance $Q$. Consequently
  $ bb(E) [sum_(j in F) frac(a_j a_j^top, x_j) thin mid(bar.v) thin cal(G)_I \, cal(E)] & = Q sum_(j in F) 1 / x_j \,\
"Var" (sum_(j in F) frac(\( a_j \)_a \( a_j \)_b, x_j) thin mid(bar.v) thin cal(G)_I \, cal(E)) & = \( Q_(a a) Q_(b b) + Q_(a b)^2 \) sum_(j in F) 1 / x_j^2 . $
  Also $bb(E) \[ Q_(a a)^2 divides cal(E) \] = s_2^2 + 2 "Tr" beta^4 = O \( T^2 \)$. Since $Q$ is positive semidefinite, $\| Q_(a b) \|^2 lt.eq Q_(a a) Q_(b b)$; Cauchy–Schwarz bounds the remaining second moments by $O \( T^2 \)$. Multiplying entry $a \, b$ by $\( U_I \)_(a a) \( U_I \)_(b b)$, summing its second moment over $a \, b$, and using (92) and (96), we obtain
  $ bb(E) ∥U_I A'_(I F) D_F^(- 1) A'_(F I) U_I∥_(upright("HS"))^2 lt.eq C T^2 \( log r \)^2 \( K^(- 2 chi) + K^(- 1) \) . $
  Markov’s inequality therefore bounds this norm by $T "polylog" \( r \) \( K^(- chi) + K^(- 1 \/ 2) \)$ with probability tending to one.
  Combining this estimate with (102) gives
  $ parallel U_I Sigma U_I parallel lt.eq "polylog" \( r \) thin O (T K^(- chi) + T K^(- 1 \/ 2) + frac(T \( 1 + T \), K) + T sqrt(T \/ K) + T theta) $
  with probability tending to one. After multiplication by $T^5$, all terms tend to zero by a fixed power of $r$. For example, the three potentially slow terms have exponents
  $ 6 tau - chi / 100 \, #h(2em) 13 / 2 tau - 1 / 200 \, #h(2em) 13 / 2 tau - 1 / 2 \, $
  respectively. They are negative under (88); the terms $T^6 K^(- 1 \/ 2)$ and $T^6 \( 1 + T \) \/ K$ have still ample margins. This proves (101). ◻
]

We now convert the small weighted Schur correction into a small trace error. The fixed-height inner resolvent cannot be estimated directly from (97); instead we first work at the larger height $h_1 = T^2$.

#thm([Lemma 7.4.])[
  (Inner resolvent and trace cut).  #emph[For every fixed $z in bb(H)$, 
#[#set math.equation(numbering: n => "(103)")
 $ parallel U_I^(- 1) G_I \( z \) U_I^(- 1) parallel = O_(bb(P)) \( h_1 \) \, $ <eq:sw-inner-resolvent>]

 and 
#[#set math.equation(numbering: n => "(104)")
 $ "Tr" \( D_x + A' - z \)^(- 1) = "Tr" \( D_I + A'_(I I) - z \)^(- 1) + o_(bb(P)) \( 1 \) . $ <eq:sw-second-cut>]

 The same estimates hold jointly for a fixed finite list of $z$’s.]
] <sw:trace-cut>

#proof[
  Every diagonal entry of $U_I \( D_I - i h_1 \) U_I$ has modulus at least $1 \/ sqrt(2)$. The added term has norm at most
  $ parallel U_I A'_(I I) U_I parallel lt.eq C T \/ h_1 + "polylog" \( r \) (sqrt(T \/ h_1) + theta) = o \( 1 \) $
  with probability tending to one. Hence
  $ parallel U_I^(- 1) G_I \( i h_1 \) U_I^(- 1) parallel lt.eq C . $
  The identity $G_I \( i h_1 \)^(*) G_I \( i h_1 \) = h_1^(- 1) Im G_I \( i h_1 \)$ now gives
  $ parallel G_I \( i h_1 \) U_I^(- 1) parallel + parallel U_I^(- 1) G_I \( i h_1 \) parallel lt.eq C h_1^(- 1 \/ 2) . $
  Alternatively the same mixed-weight estimates follow from the preceding weighted inverse and $parallel U_I parallel lt.eq h_1^(- 1 \/ 2)$. Use the exact twice-iterated resolvent identity
  $ G_I \( z \) =  & G_I \( i h_1 \) + \( z - i h_1 \) G_I \( i h_1 \)^2\
 & + \( z - i h_1 \)^2 G_I \( i h_1 \) G_I \( z \) G_I \( i h_1 \) . $
  The unweighted middle resolvent in the last term has norm at most $\( Im z \)^(- 1)$. Conjugating the identity by $U_I^(- 1)$, the three terms are bounded by
  $ C \, #h(2em) C \| z - i h_1 \| \/ h_1 \, #h(2em) C \| z - i h_1 \|^2 \/ \( h_1 Im z \) \, $
  respectively. This proves (103).
  The Schur complement formula for the full inverse has upper-left block $tilde(G)_I = \( G_I^(- 1) - Sigma \)^(- 1)$. Set $R_I = U_I^(- 1) G_I U_I^(- 1)$ and $S_I = U_I Sigma U_I$. Then
  $ U_I^(- 1) tilde(G)_I U_I^(- 1) = \( R_I^(- 1) - S_I \)^(- 1) . $
  By (103) and (101), a Neumann expansion gives
  $ parallel U_I^(- 1) tilde(G)_I U_I^(- 1) parallel = O_(bb(P)) \( h_1 \) \, #h(2em) parallel U_I^(- 1) \( tilde(G)_I - G_I \) U_I^(- 1) parallel lt.eq O_(bb(P)) \( h_1^2 \) o_(bb(P)) \( T^(- 5) \) = o_(bb(P)) \( T^(- 1) \) . $
  Multiplying the last bound by $"Tr" U_I^2 = O \( log r \)$ shows that their traces differ by $o_(bb(P)) \( 1 \)$.
  The full block-inverse trace is
  $ "Tr" tilde(G)_I + "Tr" G_F + "Tr" #scale(x: 120%, y: 120%)[\(] tilde(G)_I A'_(I F) G_F^2 A'_(F I) #scale(x: 120%, y: 120%)[\)] . $
  The far trace is $o_(bb(P)) \( 1 \)$ by Lemma 22. For the last term recall $Q_F = U_F^(- 1) G_F U_F^(- 1)$. It has bounded norm, and
  $ U_F^(- 1) G_F^2 U_F^(- 1) = Q_F U_F^2 Q_F \, #h(2em) parallel Q_F U_F^2 Q_F parallel = O_(bb(P)) \( K^(- 1) \) . $
  No positivity is asserted for this complex square. The ordinary operator-norm and Hilbert–Schmidt trace inequality instead gives
  $ lr(|"Tr" #scale(x: 120%, y: 120%)[\(] tilde(G)_I A'_(I F) G_F^2 A'_(F I) #scale(x: 120%, y: 120%)[\)]|) & lt.eq parallel U_I^(- 1) tilde(G)_I U_I^(- 1) parallel thin parallel P_0 parallel_(upright("HS"))^2 thin parallel Q_F U_F^2 Q_F parallel\
 & lt.eq "polylog" \( r \) thin O_(bb(P)) \( T^3 \/ K \) = o_(bb(P)) \( 1 \) . $
  This proves (104). All estimates used the same Gaussian matrices, so taking a finite union gives the joint assertion. ◻
]

=== 7.4 Gaussian replacement and convergence of point measures <gaussian-replacement-and-convergence-of-point-measures>

We have reduced the switched trace to an inner matrix of size

$ m_I = 2 rho K + O \( K^(1 - chi) \) asymp K . $

Its perturbation is a sum of $r$ independent small rank-one matrices. Only at this reduced size do we replace that sum by GOE noise.

#thm([Lemma 7.5.])[
  (Gaussian replacement).  #emph[Conditional on almost every realization of $cal(E)$, bounded smooth tests with bounded derivatives of finitely many trace values have expectation difference $o \( 1 \)$ between 
$ D_I + A'_(I I) quad upright("and") quad H_r = D_I + s_1 upright(I)_(m_I) + sqrt(s_2) thin cal(W) . $

]
] <sw:lindeberg>

#proof[
  Write
  $ A'_(I I) - s_1 upright(I)_(m_I) = sum_(alpha = 1)^r beta_(alpha alpha) \( g_alpha g_alpha^top - upright(I)_(m_I) \) \, $
  where the $g_alpha$ are independent standard $m_I$-dimensional Gaussian vectors. The covariance identity
  $ "Cov" \( g_a g_b \, g_c g_d \) = delta_(a c) delta_(b d) + delta_(a d) delta_(b c) $
  shows that $g g^top - upright(I)$ and a raw GOE matrix have the same entry covariances. Their means are both zero. Thus replace the summands one at a time by $beta_(alpha alpha) cal(W)_alpha$, with independent raw GOE matrices $cal(W)_alpha$. Negative coefficients are allowed: both covariances are multiplied by $beta_(alpha alpha)^2$.
  For either kind of summand $X$,
  $ bb(E) parallel X parallel^3 lt.eq C theta^3 m_I^3 . $
  For the rank-one term this follows from Gaussian moments of $parallel g parallel^2$; for the GOE term the Hilbert–Schmidt norm gives a sufficient bound. Fix spectral parameters $z_1 \, dots.h \, z_b in bb(H)$, and a bounded smooth test $Phi$ on the corresponding real and imaginary trace coordinates, with bounded derivatives. For any real symmetric matrix $A$, its resolvents satisfy $parallel \( A - z_ell \)^(- 1) parallel lt.eq \( Im z_ell \)^(- 1)$. Differentiating the resolvent in a real symmetric direction $Delta$ gives, for $j = 1 \, 2 \, 3$, a trace derivative bounded by $C_(z \, j) m_I parallel Delta parallel^j$. The chain rule therefore bounds the third directional derivative of the composed test by
  $ C_(z \, Phi) m_I^3 parallel Delta parallel^3 . $
  This estimate holds at every intermediate real symmetric matrix, independently of eigenvalue gaps.
  The Lindeberg replacement argument (see [15]) uses Taylor expansion to second order, which cancels the means and covariances in each replacement. Summing the third-order remainders gives total error
  $ C_(z \, Phi) m_I^6 r theta^3 = O #scale(x: 120%, y: 120%)[\(] r^(- 0.44 + \( 3 \/ 2 \) tau) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Finally $sum_alpha beta_(alpha alpha) cal(W)_alpha$ has exactly the law $sqrt(s_2) thin cal(W)$, proving the lemma. ◻
]

#proof[
  #emph[Completion of Proposition 20.] The coefficient bounds were proved in (90). Combine (94) with the trace cut in Lemma 23 and the Gaussian replacement in Lemma 24. They give a conditional comparison of bounded smooth tests of finitely many trace values with $cal(S)_r$. Its error tends to zero for almost every $cal(E)$, and is bounded, so bounded convergence removes the conditioning. The unconditional potential-switch identity from Proposition 19 therefore gives
  #[#set math.equation(numbering: n => "(105)")
   $ #scale(x: 120%, y: 120%)[\(] Im "Tr" \( H_r - z_ell \)^(- 1) #scale(x: 120%, y: 120%)[\)]_(ell = 1)^b med arrow.r.double med #scale(x: 120%, y: 120%)[\(] Im m \( z_ell \) #scale(x: 120%, y: 120%)[\)]_(ell = 1)^b #h(2em) \( z_1 \, dots.h \, z_b in bb(H) \) . $ <eq:sw-trace-limit>]
  Bounded smooth tests determine finite-dimensional weak convergence. In particular, switching invariance has only been used after averaging out the conditioning data.
  We finish by explaining why these trace limits imply convergence of point measures, without assuming a uniform bound on their total number of points. Let $nu^(\( r \))$ be the eigenvalue counting measure of $H_r$, and define
  $ sigma_r \( thin d x \) = frac(nu^(\( r \)) \( thin d x \), 1 + x^2) . $
  Its total mass is $Im "Tr" \( H_r - i \)^(- 1)$, whose laws are tight by (105). Regarding $sigma_r$ as a finite positive measure on the one-point compactification $overline(bb(R)) = bb(R) union { oo }$, its laws are therefore tight. For $z = e + i eta in bb(H)$, the kernel
  $ k_z \( x \) = \( 1 + x^2 \) frac(eta, \( x - e \)^2 + eta^2) $
  extends continuously to $overline(bb(R))$, with $k_z \( oo \) = eta$. Its integral against $sigma_r$ is $Im "Tr" \( H_r - z \)^(- 1)$. It follows that in any subsequential limit $sigma$, the joint law of these integrals at a countable dense set of $z$’s is that of $Im m \( z \)$. Continuity extends this conclusion to all $z$.
  These integrals determine the de-weighted restriction of $sigma$ to $bb(R)$. Indeed, for $f in C_c \( bb(R) \)$, integrate the kernel against $pi^(- 1) f \( e \) thin d e$ and let $eta arrow.b 0$. On $bb(R)$ the resulting kernel tends to $\( 1 + x^2 \) f \( x \)$, by the Poisson approximate identity. The integrated kernels are bounded uniformly over $x in overline(bb(R))$ and $0 < eta lt.eq 1$: near the compact support this is the Poisson mass bound, and away from it the factor $1 + x^2$ cancels the quadratic denominator. At infinity their value is $eta pi^(- 1) integral f \( e \) thin d e$, which tends to zero. Dominated convergence is thus applicable to each finite measure $sigma$, including any mass at infinity.
  By Proposition 17, applying the same inversion to $Im m \( z \)$ gives $integral f thin thin d nu$. Taking a countable determining family of compactly supported tests, the joint distribution of these integrals is therefore exactly the law of $nu$. The map from $sigma$ to its de-weighted restriction is continuous for local vague convergence: for a compactly supported $f$, the function $\( 1 + x^2 \) f \( x \)$, extended by zero at infinity, is continuous on $overline(bb(R))$. Every subsequential local vague limit of $nu^(\( r \))$ consequently has the law of $nu$. This proves the point-process assertion. ◻
]

== 8 Identification by finite-matrix Dyson Brownian motion <sec:dbm>

Proposition 20 approximates every microscopic subsequential law by the eigenvalues of a finite diagonal matrix plus GOE noise. We now apply the fixed-energy theorem of Landon, Sosoe, and Yau [25] to these finite matrices. Two details require attention: their limiting density must be normalized correctly, and the correlation-function conclusion must be converted into the Laplace-functional statement of Theorem 1.

=== 8.1 The fixed-energy input <the-fixed-energy-input>

For a real diagonal matrix $V = "diag" \( v_1 \, dots.h \, v_m \)$, write

$ m_V \( zeta \) = 1 / m sum_(j = 1)^m frac(1, v_j - zeta) . $

For positive parameters $g \, G$, we call $V$ $\( g \, G \)$-regular if, for fixed positive constants $c \, C \, C_V$,

#[#set math.equation(numbering: n => "(106)")
 $ c lt.eq Im m_V \( e + i eta \) lt.eq C quad \( \| e \| lt.eq G \, med g lt.eq eta lt.eq 10 \) \, #h(2em) parallel V parallel lt.eq m^(C_V) . $ <eq:dbm-regularity>]

The parameters may depend on $m$, and satisfy, for a fixed $delta > 0$,

#[#set math.equation(numbering: n => "(107)")
 $ m^(delta - 1) lt.eq g lt.eq m^(- delta) \, #h(2em) G lt.eq m^(- delta) . $ <eq:dbm-parameter-domain>]

Let $W_m$ be standard normalized GOE, with entry variances $1 \/ m$ off the diagonal and $2 \/ m$ on the diagonal. The deterministic comparison density for $V + sqrt(t) thin W_m$ is defined by the free-convolution transform

#[#set math.equation(numbering: n => "(108)")
 $ m_(upright("fc") \, t) \( zeta \) = m_V #scale(x: 120%, y: 120%)[\(] zeta + t thin m_(upright("fc") \, t) \( zeta \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) rho_(upright("fc") \, t) \( e \) = 1 / pi lim_(eta arrow.b 0) Im m_(upright("fc") \, t) \( e + i eta \) . $ <eq:dbm-free-convolution>]

Here the solution with positive imaginary part is used in the upper half-plane.

We state the specialization of the fixed-energy theorem that we need. Its density convention is important. If $p_H^(\( m \))$ denotes the symmetrized joint eigenvalue density of a random matrix $H$, normalized to have integral one, then

$ p_H^(\( a \)) \( y_1 \, dots.h \, y_a \) = integral_(bb(R)^(m - a)) p_H^(\( m \)) \( y_1 \, dots.h \, y_m \) thin d y_(a + 1) dots.h.c thin d y_m $

also has integral one. It is not the factorial moment density.

#thm([Theorem 8.1.])[
  (Fixed-energy DBM input).  #emph[Suppose a sequence of deterministic diagonal matrices $V$ of dimension $m arrow.r oo$ satisfies (106) and (107), with fixed constants. Fix $sigma > 0$, and suppose 
#[#set math.equation(numbering: n => "(109)")
 $ g m^sigma lt.eq t lt.eq m^(- sigma) G^2 . $ <eq:dbm-time-window>]

 Assume also that $rho_(upright("fc") \, t) \( 0 \) = 1 \/ pi$. For every fixed positive integer $a$ and $O in C_c^oo \( bb(R)^a \)$, the difference 
#[#set math.equation(numbering: n => "(110)")
 $ & integral_(bb(R)^a) O \( bold(alpha) \) p_(V + sqrt(t) thin W_m)^(\( a \)) (frac(pi alpha_1, m) \, dots.h \, frac(pi alpha_a, m)) thin d bold(alpha)\
 & #h(12mm)  - integral_(bb(R)^a) O \( bold(alpha) \) p_(W_m)^(\( a \)) (frac(pi alpha_1, m) \, dots.h \, frac(pi alpha_a, m)) thin d bold(alpha) arrow.r 0 . $ <eq:dbm-marginal-test>]

 Consequently, the expected sums of $O$ over ordered tuples of distinct points of the two eigenvalue processes, both rescaled by $m \/ pi$, differ by $o \( 1 \)$.]
] <thm:dbm-input>

#proof[
  The marginal statement is [25] Theorem 2.2, with Definition 2.1 and Equations (2.5)–(2.9) there, specialized to energy zero and equal densities $rho_(upright("fc") \, t) \( 0 \) = rho_(upright("sc")) \( 0 \) = 1 \/ pi$. The energy lies in the required interior window for any fixed interior fraction. That theorem gives a power-decaying bound for (110). To pass to the last assertion, multiply each integral by
  $ frac(\( m \)_a, \( m \/ pi \)^a) \, #h(2em) \( m \)_a = m \( m - 1 \) dots.h.c \( m - a + 1 \) . $
  This is the Jacobian and ordered-tuple multiplicity for the unit-mass marginal convention, and it tends to $pi^a$ for fixed $a$. ◻
]

Theorem 25 applies to arbitrary deterministic real diagonal matrices satisfying its displayed hypotheses. The same specialization is recorded in [28] Theorem 6.1.

=== 8.2 Regularity and the density adjustment <regularity-and-the-density-adjustment>

Fix a microscopic subsequential law $nu$ supplied by Proposition 10. We use the parameters and conditional matrices of Proposition 20:

$ K = r^(1 \/ 100) \, #h(2em) T = r^tau \, #h(2em) 0 < tau < chi / 100000 \, #h(2em) I = { j : \| x_j \| lt.eq K } \, #h(2em) m_I = \| I \| \, $

and

#[#set math.equation(numbering: n => "(111)")
 $ H_r = D_I + s_1 upright(I) + sqrt(s_2) thin cal(W)_r \, #h(2em) \| s_1 \| lt.eq C T \, #h(2em) c T lt.eq s_2 lt.eq C T . $ <eq:dbm-raw-matrix>]

Conditional on $cal(E)$, $cal(W)_r$ is raw GOE of dimension $m_I$, with variances $1$ and $2$. All following almost-sure assertions concern the conditioning input $cal(E)$ defined in Section 7. In particular, the discrepancy bound of Lemma 16 gives

#[#set math.equation(numbering: n => "(112)")
 $ m_I = 2 rho K + O \( K^(1 - chi) \) \, #h(2em) T = m_I^(100 tau + o \( 1 \)) . $ <eq:dbm-dimension>]

Thus $m_I > 0$ eventually. We may decrease $chi$ so that $chi < 1 \/ 4$.

Put $alpha_(*) = pi rho$. Scaling (111) by $alpha_(*) \/ m_I$ gives the normalized GOE-addition model

#[#set math.equation(numbering: n => "(113)")
 $ alpha_(*) / m_I H_r med =^(upright("law")) med V_(*) + sqrt(t_(*)) thin W_(m_I) \, #h(2em) V_(*) = alpha_(*) / m_I \( D_I + s_1 upright(I) \) \, #h(2em) t_(*) = frac(alpha_(*)^2 s_2, m_I) . $ <eq:dbm-normalized-matrix>]

The following verification adapts the calculation in [28] Section 6.2. We give it in full for the random coefficients constructed here.

#thm([Lemma 8.2.])[
  #emph[For almost every realization of $cal(E)$, the matrices $V_(*)$ are eventually regular with 
$ g = T^(1 \/ 2) / m_I \, #h(2em) G = m_I^(- 1 \/ 8) . $

 They satisfy the hypotheses (107) and (109) with $m = m_I$ and $delta = sigma = tau$. Moreover, 
$ rho_(upright("fc") \, t_(*)) \( 0 \) arrow.r 1 / pi . $

 If $c_r = pi rho_(upright("fc") \, t_(*)) \( 0 \)$, then eventually $c_r > 0$, and the data $c_r V_(*)$ and time $c_r^2 t_(*)$ satisfy Theorem 25, including its exact density condition.]
] <lem:density-adjustment>

#proof[
  First, $parallel V_(*) parallel$ is bounded by (112), since $T = o \( K \)$. We verify a slightly enlarged regularity domain,
  $ \| Re zeta \| lt.eq 2 G \, #h(2em) g \/ 2 lt.eq Im zeta lt.eq 20 \, $
  so that subsequent dilation by $c_r = 1 + o \( 1 \)$ will be harmless. The normalized resolvent trace is
  $ m_(V_(*)) \( zeta \) = alpha_(*)^(- 1) sum_(j in I) frac(1, x_j - \( m_I zeta \/ alpha_(*) - s_1 \)) . $
  Writing $e = m_I Re zeta \/ alpha_(*) - s_1$ and $u = m_I Im zeta \/ alpha_(*)$, the enlarged domain has
  #[#set math.equation(numbering: n => "(114)")
   $ \| e \| = O \( K^(7 \/ 8) + T \) = o \( K \) \, #h(2em) c T^(1 \/ 2) lt.eq u lt.eq C K . $ <eq:dbm-original-domain>]
  The lower height exceeds a fixed positive power of $K$. Proposition 18, with a radius comparable to $K$ and any fixed exponent smaller than $50 tau$, therefore gives
  $ sum_j frac(u, \( x_j - e \)^2 + u^2) = pi rho + o \( 1 \) $
  uniformly in (114). For $u \/ K$ sufficiently small, the omitted terms with $\| x_j \| > K$ sum to $O \( u \/ K \)$, uniformly for $\| e \| = o \( K \)$, by the linear count bound from Lemma 16. Hence the retained sum has a positive lower bound. For $u \/ K$ bounded below, every retained point has $\| x_j - e \| lt.eq 2 K$ eventually, so
  $ sum_(j in I) frac(u, \( x_j - e \)^2 + u^2) gt.eq frac(m_I u, 4 K^2 + u^2) gt.eq c > 0 . $
  Its upper bound follows by positivity from the full sum. This proves regularity on the enlarged domain.
  With $m = m_I$, the relevant powers are
  $ g = m^(- 1 + 50 tau + o \( 1 \)) \, #h(2em) t_(*) = m^(- 1 + 100 tau + o \( 1 \)) \, #h(2em) G = m^(- 1 \/ 8) . $
  In particular,
  $ frac(t_(*), g m^tau) = m^(49 tau + o \( 1 \)) arrow.r oo \, #h(2em) frac(t_(*), m^(- tau) G^2) = m^(- 3 \/ 4 + 101 tau + o \( 1 \)) arrow.r 0 . $
  The inequalities $m^(tau - 1) lt.eq g lt.eq m^(- tau)$ and $G lt.eq m^(- tau)$ follow as well. Our bound on $tau$ makes all these exponent inequalities strict.
  It remains to determine the free-convolution density. At $zeta = 0$, Equation (108) becomes
  #[#set math.equation(numbering: n => "(115)")
   $ frak(m) = F_r \( frak(m) \) \, #h(2em) F_r \( frak(m) \) = alpha_(*)^(- 1) sum_(j in I) frac(1, x_j - \( alpha_(*) s_2 frak(m) - s_1 \)) . $ <eq:dbm-boundary-equation>]
  For $\| frak(m) - i \| lt.eq 1 \/ 4$, the argument $z = alpha_(*) s_2 frak(m) - s_1$ has $Im z asymp T$ and $\| z \| = O \( T \)$. Propositions 18 and 17 imply
  $ "PV" sum_j frac(1, x_j - z) = i pi rho + o \( 1 \) $
  uniformly in this disk, with the symmetric principal-value convention of Section 6. Furthermore,
  $ "PV" sum_(\| x_j \| > K) frac(1, x_j - z) = "PV" sum_(\| x_j \| > K) 1 / x_j + sum_(\| x_j \| > K) frac(z, x_j \( x_j - z \)) = O \( K^(- chi) + T \/ K \) . $
  The first estimate follows by partial summation in Lemma 16; the second uses its linear count bound and $\| z \| = o \( K \)$. Thus $F_r \( frak(m) \) = i + o \( 1 \)$ uniformly on $\| frak(m) - i \| lt.eq 1 \/ 4$.
  Rouché’s theorem applied to $frak(m) - F_r \( frak(m) \)$ and $frak(m) - i$ shows that (115) has exactly one zero, counted with multiplicity, in this disk for all large $r$. The zero $frak(m)_r$ is therefore simple, and $frak(m)_r arrow.r i$. The implicit function theorem continues it to a solution near $zeta = 0$ of the full fixed-point equation, still with positive imaginary part. This solution is the physical branch. Indeed, every upper-half-plane solution $frak(m)$, at $Im zeta > 0$, satisfies
  #[#set math.equation(numbering: n => "(116)")
   $ 1 / m_I sum_(j in I) \| \( V_(*) \)_(j j) - zeta - t_(*) frak(m) \|^(- 2) = frac(Im frak(m), Im zeta + t_(*) Im frak(m)) < 1 / t_(*) . $ <eq:dbm-uniqueness-identity>]
  If two distinct such solutions existed, subtracting their equations and dividing by their difference would give
  $ 1 = t_(*) / m_I sum_(j in I) frac(1, \( \( V_(*) \)_(j j) - zeta - t_(*) frak(m)_1 \) \( \( V_(*) \)_(j j) - zeta - t_(*) frak(m)_2 \)) . $
  Cauchy–Schwarz and (116) make the absolute value of the right-hand side strictly less than one. This contradiction proves uniqueness and identifies the analytic continuation. Its boundary value gives $rho_(upright("fc") \, t_(*)) \( 0 \) = Im frak(m)_r \/ pi arrow.r 1 \/ pi$.
  Finally, simultaneous replacement of $V_(*) \, t_(*)$ by $c_r V_(*) \, c_r^2 t_(*)$ dilates the free-convolution law by $c_r$. For example its transform is $c_r^(- 1) m_(upright("fc") \, t_(*)) \( zeta \/ c_r \)$, as follows directly from (108). Its density at zero is exactly
  $ c_r^(- 1) rho_(upright("fc") \, t_(*)) \( 0 \) = 1 / pi . $
  Since $c_r arrow.r 1$, the enlarged regularity domain proves (106) for $c_r V_(*)$ with the original $g \, G$. The strict power margins preserve (109) for $c_r^2 t_(*)$, completing the proof. ◻
]

The conclusion holds for almost every realization of $cal(E)$, which is enough for applying Theorem 25 to a deterministic sequence. No assertion of switching invariance conditional on $nu$ is used. The rescaled eigenvalues supplied by that theorem are, by (113), precisely

#[#set math.equation(numbering: n => "(117)")
 $ m_I / pi frac(c_r alpha_(*), m_I) lambda_j \( H_r \) = c_r rho thin lambda_j \( H_r \) . $ <eq:dbm-final-coordinates>]

Define $c_r = 1$ at any exceptional initial values where the preceding construction is not defined; these values have no effect on the limit.

=== 8.3 The GOE limit and uniform count moments <the-goe-limit-and-uniform-count-moments>

Let

$ cal(G)_m = sum_(j = 1)^m delta_(\( m \/ pi \) lambda_j \( W_m \)) . $

These point processes converge vaguely in law, along all dimensions, to a common locally finite point process, which we denote by $cal(S)_(upright("GOE"))$. To check normalization directly, the eigenvalues of $sqrt(m) thin W_m$ have joint density proportional to

$ exp (- 1 / 4 sum_j y_j^2) product_(i < j) \| y_i - y_j \| . $

This follows from orthogonal diagonalization of the matrix density $exp \( - "Tr" H^2 \/ 4 \)$; the change in an off-diagonal coordinate under an infinitesimal basis rotation is the corresponding eigenvalue difference, yielding the Vandermonde Jacobian. Theorem 1 of Valkó and Virág [31], for $beta = 1$ and center zero, gives vague convergence after multiplying these eigenvalues by $2 sqrt(m)$. Its bulk condition $m^(1 \/ 6) \( 2 sqrt(m) - 0 \) arrow.r oo$ holds. Dividing the resulting coordinates by $2 pi$ gives $cal(G)_m$, as claimed.

Weak convergence alone does not justify termwise expectations of correlation expansions. The following bound makes the finite inclusion–exclusion brackets converge uniformly for the reference ensemble.

#thm([Lemma 8.3.])[
  #emph[For every compact interval $J subset bb(R)$ and every $b > 0$, 
$ sup_(m gt.eq 1) bb(E) exp #scale(x: 120%, y: 120%)[\(] b thin cal(G)_m \( J \) #scale(x: 120%, y: 120%)[\)] < oo . $

]
] <lem:goe-counts>

The proof is given in Appendix 9. It uses Gaussian decimation to compare the GOE count with a determinantal count, followed by a uniform bound on its projection kernel.

=== 8.4 From correlation functions to Laplace functionals <from-correlation-functions-to-laplace-functionals>

We use the finite Bonferroni comparison in [28] Section 6.4 to pass from conditional DBM convergence to the unconditional point-process law. Let $nu^(\( r \)) = sum_(j = 1)^(m_I) delta_(lambda_j \( H_r \))$ denote the raw eigenvalue measure in (111). Proposition 20 asserts

#[#set math.equation(numbering: n => "(118)")
 $ nu^(\( r \)) med arrow.r.double med nu $ <eq:dbm-insertion-limit>]

in local vague topology, unconditionally. We will identify the law of $rho$-dilated $nu$ by first applying DBM conditional on $cal(E)$.

Fix a nonnegative $h in C_c^oo \( bb(R) \)$, and put $f = 1 - e^(- h)$, so $0 lt.eq f lt.eq 1$. For a finite point measure $zeta = sum_i delta_(y_i)$, define

$ A_0 \( zeta \) = 1 \, #h(2em) A_a \( zeta \) = frac(1, a !) sum_(i_1 \, dots.h \, i_a med upright("distinct")) product_(j = 1)^a f \( y_(i_j) \) quad \( a gt.eq 1 \) \, #h(2em) B_ell \( zeta \) = sum_(a = 0)^ell \( - 1 \)^a A_a \( zeta \) . $

The finite inclusion-exclusion inequalities give

#[#set math.equation(numbering: n => "(119)")
 $ B_(2 ell + 1) \( zeta \) lt.eq exp (- integral h thin d zeta) lt.eq B_(2 ell) \( zeta \) . $ <eq:dbm-bonferroni>]

One can see these inequalities by taking independent Bernoulli variables of success probabilities $f \( y_i \)$: the middle quantity is their probability of no successes, and the displayed sums are the Bonferroni bounds for that event.

Conditional on almost every realization of $cal(E)$, let $zeta_r$ have the point coordinates $c_r rho thin lambda_j \( H_r \)$. Lemma 26 and Theorem 25, applied with the test $product_(j = 1)^a f \( alpha_j \)$, imply for each fixed $ell$ that

$ bb(E) \[ B_ell \( zeta_r \) divides cal(E) \] - bb(E) B_ell \( cal(G)_(m_I) \) arrow.r 0 . $

The expectation in the second term is over a reference GOE matrix of the now deterministic conditional dimension $m_I$. To close the brackets uniformly in that dimension, choose a compact interval $J$ containing $"supp" h$. Then

$ A_a \( cal(G)_m \) lt.eq binom(cal(G)_m \( J \), a) lt.eq 2^(- a) 3^(cal(G)_m \( J \)) . $

The last inequality follows from $sum_(a gt.eq 0) 2^a binom(N, a) = 3^N$. Lemma 27 consequently gives

#[#set math.equation(numbering: n => "(120)")
 $ sup_m bb(E) #scale(x: 120%, y: 120%)[\[] B_(2 ell) \( cal(G)_m \) - B_(2 ell + 1) \( cal(G)_m \) #scale(x: 120%, y: 120%)[\]] lt.eq C_J 2^(- \( 2 ell + 1 \)) . $ <eq:dbm-bracket-width>]

Using (119) for both models, first sending $r arrow.r oo$ at fixed $ell$, and then sending $ell arrow.r oo$, proves

#[#set math.equation(numbering: n => "(121)")
 $ bb(E) [exp (- integral h thin d zeta_r) thin mid(bar.v) thin cal(E)] arrow.r bb(E) exp (- integral h thin d cal(S)_(upright("GOE"))) . $ <eq:dbm-conditional-laplace>]

Here we also used the vague GOE limit and $m_I arrow.r oo$. Only the reference count moments were needed in (120); no uniform moment bound for the deformed model has been assumed. Since both sides of the conditional Laplace comparison lie in $\[ 0 \, 1 \]$, bounded convergence now removes the conditioning in (121).

For $c > 0$, let $cal(D)_c zeta$ denote the point measure obtained by multiplying all positions of $zeta$ by $c$. The map $\( c \, zeta \) mapsto cal(D)_c zeta$ is continuous when $c$ tends to a positive number and $zeta$ converges locally vaguely. Indeed, the inverse images of a fixed compact support remain in a common compact interval, and the corresponding test functions converge uniformly there; vague convergence also bounds the masses on a slightly larger compact interval. By Lemma 26, $c_r arrow.r 1$ almost surely. Combining this with (118) and the usual joint convergence with a constant yields

$ zeta_r = cal(D)_(c_r rho) nu^(\( r \)) med arrow.r.double med cal(D)_rho nu . $

The Laplace functional of a compactly supported continuous nonnegative test is bounded and continuous in local vague topology. Thus (121), after averaging, identifies

#[#set math.equation(numbering: n => "(122)")
 $ bb(E) exp (- integral h thin d cal(D)_rho nu) = bb(E) exp (- integral h thin d cal(S)_(upright("GOE"))) #h(2em) \( 0 lt.eq h in C_c^oo \( bb(R) \) \) . $ <eq:dbm-limit-identification>]

For any $0 lt.eq h in C_c \( bb(R) \)$, convolution with a nonnegative smooth approximate identity gives nonnegative smooth functions converging uniformly to $h$, all supported in one fixed compact interval. Both limiting point measures have finitely many points there almost surely. The corresponding Laplace variables converge pointwise and are bounded by one, so bounded convergence extends (122) to every such $h$.

#proof[
  Choose the fixed compact bulk interval $J$ with $I_(d \, kappa) subset "int" J$. The finitely many smallness choices in Proposition 2 and the subsequent arguments give one positive number $w_0 \( d \, kappa \)$. Fix any $0 < w < w_0 \( d \, kappa \)$ and $E in I_(d \, kappa)$. Corollary 4 gives a continuous density on an open neighborhood of $I_(d \, kappa)$, strictly positive there; write $rho = rho_(d \, w) \( E \) > 0$.
  Start with any sequence of admissible graph sizes tending to infinity. Proposition 10 supplies a further subsequence on which the unscaled microscopic measures $nu_n$ converge in law to a process $nu$ of the form used above. The graph point measure in the theorem is $cal(D)_rho nu_n$. Bounded continuity of its Laplace functional and (122) show that its Laplace expectation, along this further subsequence, tends to the Laplace expectation of $cal(S)_(upright("GOE"))$. The reference GOE expectations at dimension $n$ tend to the same value, along all sizes. Every original subsequence therefore has a further subsequence along which their difference tends to zero, which proves the required full-sequence limit. All spectral estimates and negligible exclusions used to construct the subsequential law were events in the original simple-graph model; no conditioning on connectedness, bipartiteness, or any additional graph property enters the conclusion. The constants in estimates that use spectral averaging may depend on this fixed positive $w$. The argument therefore proves the assertion for every fixed $w in \( 0 \, w_0 \( d \, kappa \) \)$, with the limit in graph size taken afterward. ◻
]

== 9 Exponential count moments for GOE <app:goe-counts>

We prove the dimension-uniform count bound used in Section 8 to pass from correlation functions to Laplace functionals. As there, $W_m$ is normalized GOE and

$ cal(G)_m = sum_(j = 1)^m delta_(\( m \/ pi \) lambda_j \( W_m \)) . $

The argument is independent of the Anderson model: Gaussian decimation compares GOE counts with those of a determinantal process, whose projection kernel gives the required exponential moments.

#proof[
  Fix a compact interval $J subset bb(R)$ and a number $b > 0$. We use the Gaussian decimation identity of Forrester and Rains [18] arXiv version 2, Theorem 5.2 and Equation (5.9) and the count estimate in [28] Lemma 6.3. We reproduce the identity in our normalization before proving the dimension-uniform bound. Write $upright(O)_m$ for the decreasingly ordered points with density proportional to
  $ Delta \( y \) product_(i = 1)^m b_0 \( y_i \) \, #h(2em) b_0 \( y \) = e^(- y^2 \/ 2) \, #h(2em) Delta \( y \) = product_(i < j) \( y_i - y_j \) . $
  They have the law of the eigenvalues of $sqrt(m) thin W_m \/ sqrt(2)$. Thus the count $cal(G)_m \( J \)$ is the $upright(O)_m$ count in
  $ J_m = pi / sqrt(2 m) J \, #h(2em) \| J_m \| = O \( m^(- 1 \/ 2) \) . $
  Superpose independent $upright(O)_m$ and $upright(O)_(m + 1)$, and order the resulting points as $z_1 > dots.h.c > z_(2 m + 1)$. Apart from a constant and the common Gaussian factor, their density is the polynomial
  $ P \( z \) = sum_(S subset { 1 \, dots.h \, 2 m + 1 }\
\| S \| = m) Delta \( z_S \) Delta \( z_(S^c) \) \, $
  where each sublist is in the inherited order. The parity–Vandermonde factorization of [18] arXiv version 2, Lemma 4.1 and Equation (4.2) is
  #[#set math.equation(numbering: n => "(123)")
   $ P \( z \) = c_m Delta \( z_1 \, z_3 \, dots.h \, z_(2 m + 1) \) Delta \( z_2 \, z_4 \, dots.h \, z_(2 m) \) \, #h(2em) c_m > 0 . $ <eq:dbm-decimation-polynomial>]
  If $z_i = z_j$ with $i \, j$ of the same parity, terms having both indices in one sublist vanish. The other terms cancel in pairs under exchanging membership of $i \, j$: the sign ratio is $\( - 1 \)^(j - i - 1) = - 1$, since each intervening index belongs to exactly one sublist. Hence every factor on the right divides $P$. Both sides have degree $m^2$, so the quotient is constant. It is positive on strictly decreasing $z$, proving (123).
  Fix the even points $y_i = z_(2 i)$. The odd points interlace them, one in each of
  $ \( y_1 \, oo \) \, med \( y_2 \, y_1 \) \, dots.h \, \( y_m \, y_(m - 1) \) \, med \( - oo \, y_m \) . $
  To integrate their Vandermonde times their Gaussian factors, use the monic polynomials
  $ p_j \( x \) = \( - 1 \)^j frac(b_0^(\( j \)) \( x \), b_0 \( x \)) \, #h(2em) 0 lt.eq j lt.eq m . $
  Writing the Vandermonde as the determinant of these polynomials reduces the integral, by multilinearity, to a determinant of integrals over the displayed intervals. Replace each row by the sum of it and all preceding rows. For column $j gt.eq 1$, the first $m$ rows become
  $ integral_(y_i)^oo p_j \( x \) b_0 \( x \) thin d x = p_(j - 1) \( y_i \) b_0 \( y_i \) \, $
  and the last row is zero. In column zero the last row is $integral_(bb(R)) b_0$. Expansion along that last row leaves a Vandermonde in the $y_i$ times $product_i b_0 \( y_i \)$. More explicitly, the ascending-degree polynomial columns give signs $\( - 1 \)^(m \( m + 1 \) \/ 2)$ for the odd-point Vandermonde and $\( - 1 \)^(m \( m - 1 \) \/ 2)$ for the even-point Vandermonde, while expansion along the last row contributes $\( - 1 \)^m$. Their product is one. Thus, if $x_0 > y_1 > x_1 > dots.h.c > y_m > x_m$, the integral just evaluated is exactly
  $ integral_(upright("interlacing")) Delta \( x_0 \, dots.h \, x_m \) product_(i = 0)^m b_0 \( x_i \) thin d x_0 dots.h.c thin d x_m = sqrt(2 pi) thin Delta \( y \) product_(i = 1)^m b_0 \( y_i \) . $
  Together with the even-point factors already present in (123), this proves that the even points have density proportional to
  #[#set math.equation(numbering: n => "(124)")
   $ Delta \( y \)^2 product_(i = 1)^m e^(- y_i^2) . $ <eq:dbm-even-density>]
  Let $psi_j \( x \)$ be the degree-$j$ orthonormal polynomial for the weight $e^(- x^2)$, multiplied by $e^(- x^2 \/ 2)$. The kernel
  $ K_m \( x \, y \) = sum_(j = 0)^(m - 1) psi_j \( x \) psi_j \( y \) $
  is the rank-$m$ orthogonal projection in $L^2 \( bb(R) \)$ onto their span. The symmetric density in (124) is $\( m ! \)^(- 1) det \( K_m \( y_i \, y_j \) \)_(i \, j = 1)^m$. Indeed the determinant is a squared weighted Vandermonde, and orthonormality gives its integral $m !$. More generally its order-$a$ factorial moment density is $det \( K_m \( y_i \, y_j \) \)_(i \, j = 1)^a$. For completeness, expand a size-$a$ determinant by Cauchy–Binet as the sum of squared minors indexed by $a$ basis functions. Integrating its last variable uses their orthogonality, and each minor of size $a - 1$ occurs $m - a + 1$ times. Iterating this identity proves the factorial density formula with its stated normalization.
  We need a bound uniform in both $m$ and location. The operator $- partial_x^2 + x^2$ has eigenvalue $2 j + 1$ on $psi_j$. This follows by conjugating it by $e^(- x^2 \/ 2)$: on the polynomial factor it acts as $- p'' + 2 x p' + p$, preserves successive degree spaces, is symmetric for the Gaussian inner product, and has leading coefficient multiplier $2 j + 1$. Consequently every $f$ in the range of $K_m$ satisfies
  $ parallel f' parallel_2^2 lt.eq \( 2 m - 1 \) parallel f parallel_2^2 . $
  The elementary bound $\| f \( x \) \|^2 lt.eq 2 parallel f' parallel_2 parallel f parallel_2$, obtained by integrating the derivative of $\| f \|^2$, gives
  $ K_m \( x \, x \) = sup_(f in "Ran" K_m\
parallel f parallel_2 = 1) \| f \( x \) \|^2 lt.eq 2 sqrt(2 m) . $
  If $N_m^(upright("even"))$ is the number of even points in $J_m$, the Gram determinant inequality yields, for every $a gt.eq 0$,
  $ bb(E) \( N_m^(upright("even")) \)_a lt.eq #scale(x: 120%, y: 120%)[\(] 2 sqrt(2 m) thin \| J_m \| #scale(x: 120%, y: 120%)[\)]^a lt.eq C_J^a . $
  For $a > m$ the left side is zero. Hence, for every $v > 0$,
  $ bb(E) e^(v N_m^(upright("even"))) = sum_(a = 0)^m frac(\( e^v - 1 \)^a, a !) bb(E) \( N_m^(upright("even")) \)_a lt.eq exp #scale(x: 120%, y: 120%)[\(] C_J \( e^v - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  In any interval the total superposition count is at most twice its even count plus one. The original $upright(O)_m$ count is no greater than the superposition count. Thus
  $ bb(E) e^(b cal(G)_m \( J \)) lt.eq e^b thin bb(E) e^(2 b N_m^(upright("even"))) \, $
  which proves the assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[R. Abou-Chacra, D.~J. Thouless, and P.~W. Anderson, #emph[A selfconsistent theory of localization], Journal of Physics C: Solid State Physics #strong[6] (1973), no.~10, 1734--1752. #link("https://doi.org/10.1088/0022-3719/6/10/009").]
#bibitem([2])[M. Aizenman, R. Sims, and S. Warzel, #emph[Stability of the absolutely continuous spectrum of random Schrödinger operators on tree graphs], Probability Theory and Related Fields #strong[136] (2006), no.~3, 363--394. #link("https://doi.org/10.1007/s00440-005-0486-8").]
#bibitem([3])[M. Aizenman and S. Warzel, #emph[On the joint distribution of energy levels of random Schrödinger operators], Journal of Physics A: Mathematical and Theoretical #strong[42] (2009), 045201. #link("https://doi.org/10.1088/1751-8113/42/4/045201").]
#bibitem([4])[N. Anantharaman and M. Sabri, #emph[Quantum ergodicity for the Anderson model on regular graphs], Journal of Mathematical Physics #strong[58] (2017), 091901. #link("https://doi.org/10.1063/1.5000962").]
#bibitem([5])[N. Anantharaman and M. Sabri, #emph[Quantum ergodicity on graphs: from spectral to spatial delocalization], Annals of Mathematics #strong[189] (2019), no.~3, 753--835. #link("https://doi.org/10.4007/annals.2019.189.3.3").]
#bibitem([6])[P.~W. Anderson, #emph[Absence of diffusion in certain random lattices], Physical Review #strong[109] (1958), no.~5, 1492--1505. #link("https://doi.org/10.1103/PhysRev.109.1492").]
#bibitem([7])[Á. Backhausz and B. Szegedy, #emph[On the almost eigenvectors of random regular graphs], Annals of Probability #strong[47] (2019), no.~3, 1677--1725. #link("https://doi.org/10.1214/18-AOP1294").]
#bibitem([8])[R. Bauerschmidt, J. Huang, A. Knowles, and H.-T. Yau, #emph[Bulk eigenvalue statistics for random regular graphs], Annals of Probability #strong[45] (2017), no.~6A, 3626--3663. #link("https://doi.org/10.1214/16-AOP1145").]
#bibitem([9])[R. Bauerschmidt, J. Huang, and H.-T. Yau, #emph[Local Kesten--McKay law for random regular graphs], Communications in Mathematical Physics #strong[369] (2019), no.~2, 523--636. #link("https://doi.org/10.1007/s00220-019-03345-3").]
#bibitem([10])[R. Bauerschmidt, A. Knowles, and H.-T. Yau, #emph[Local semicircle law for random regular graphs], Communications on Pure and Applied Mathematics #strong[70] (2017), no.~10, 1898--1960. #link("https://doi.org/10.1002/cpa.21709").]
#bibitem([11])[B. Bollobás, #emph[A probabilistic proof of an asymptotic formula for the number of labelled regular graphs], European Journal of Combinatorics #strong[1] (1980), no.~4, 311--316. #link("https://doi.org/10.1016/S0195-6698(80)80030-8").]
#bibitem([12])[P. Bourgade, L. Erdős, H.-T. Yau, and J. Yin, #emph[Fixed energy universality for generalized Wigner matrices], Communications on Pure and Applied Mathematics #strong[69] (2016), no.~10, 1815--1881. #link("https://doi.org/10.1002/cpa.21624").]
#bibitem([13])[E.~A. Carlen, #emph[Superadditivity of Fisher's information and logarithmic Sobolev inequalities], Journal of Functional Analysis #strong[101] (1991), no.~1, 194--211. #link("https://doi.org/10.1016/0022-1236(91)90155-X").]
#bibitem([14])[E.~A. Carlen and D. Cordero-Erausquin, #emph[Subadditivity of the entropy and its relation to Brascamp--Lieb type inequalities], Geometric and Functional Analysis #strong[19] (2009), no.~2, 373--405. #link("https://doi.org/10.1007/s00039-009-0001-y").]
#bibitem([15])[S. Chatterjee, #emph[A generalization of the Lindeberg principle], Annals of Probability #strong[34] (2006), no.~6, 2061--2076. #link("https://doi.org/10.1214/009117906000000575").]
#bibitem([16])[F.~J. Dyson, #emph[A Brownian-motion model for the eigenvalues of a random matrix], Journal of Mathematical Physics #strong[3] (1962), no.~6, 1191--1198. #link("https://doi.org/10.1063/1.1703862").]
#bibitem([17])[L. Erdős, B. Schlein, and H.-T. Yau, #emph[Universality of random matrices and local relaxation flow], Inventiones Mathematicae #strong[185] (2011), no.~1, 75--119. #link("https://doi.org/10.1007/s00222-010-0302-7").]
#bibitem([18])[P.~J. Forrester and E.~M. Rains, #emph[Interrelationships between orthogonal, unitary and symplectic matrix ensembles], in #emph[Random Matrix Models and Their Applications], P. Bleher and A. Its (eds.), Mathematical Sciences Research Institute Publications #strong[40], Cambridge University Press, 2001, 171--207. #link("https://arxiv.org/abs/solv-int/9907008v2").]
#bibitem([19])[R. Froese, D. Hasler, and W. Spitzer, #emph[Absolutely continuous spectrum for the Anderson model on a tree: a geometric proof of Klein's theorem], Communications in Mathematical Physics #strong[269] (2007), no.~1, 239--257. #link("https://doi.org/10.1007/s00220-006-0120-3").]
#bibitem([20])[J. Huang, T. McKenzie, and H.-T. Yau, #emph[Ramanujan property and edge universality of random regular graphs], preprint, arXiv:2412.20263 (2024), revised February 2025. #link("https://arxiv.org/abs/2412.20263").]
#bibitem([21])[J. Huang and H.-T. Yau, #emph[Spectrum of random $d$-regular graphs up to the edge], Communications on Pure and Applied Mathematics #strong[77] (2024), no.~3, 1635--1723. #link("https://doi.org/10.1002/cpa.22176").]
#bibitem([22])[H. Kesten, #emph[Symmetric random walks on groups], Transactions of the American Mathematical Society #strong[92] (1959), no.~2, 336--354. #link("https://doi.org/10.1090/S0002-9947-1959-0109367-6").]
#bibitem([23])[A. Klein, #emph[Absolutely continuous spectrum in the Anderson model on the Bethe lattice], Mathematical Research Letters #strong[1] (1994), no.~4, 399--407. #link("https://doi.org/10.4310/MRL.1994.v1.n4.a1").]
#bibitem([24])[A. Klein, #emph[Extended states in the Anderson model on the Bethe lattice], Advances in Mathematics #strong[133] (1998), no.~1, 163--184. #link("https://doi.org/10.1006/aima.1997.1688").]
#bibitem([25])[B. Landon, P. Sosoe, and H.-T. Yau, #emph[Fixed energy universality of Dyson Brownian motion], Advances in Mathematics #strong[346] (2019), 1137--1332. #link("https://doi.org/10.1016/j.aim.2019.02.010").]
#bibitem([26])[B. Landon and H.-T. Yau, #emph[Convergence of local statistics of Dyson Brownian motion], Communications in Mathematical Physics #strong[355] (2017), no.~3, 949--1000. #link("https://doi.org/10.1007/s00220-017-2955-1").]
#bibitem([27])[B.~D. McKay, #emph[The expected eigenvalue distribution of a large regular graph], Linear Algebra and its Applications #strong[40] (1981), 203--216. #link("https://doi.org/10.1016/0024-3795(81)90150-6").]
#bibitem([28])[OpenAI, #emph[GOE bulk universality for fixed-degree random regular graphs], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/GOE-bulk-universality-for-fixed-degree-random-regular-graphs-September-23-2026/paper.pdf")[OAI:GOE-bulk-universality-for-fixed-degree-random-regular-graphs-September-23-2026], 2026.]
#bibitem([29])[A.~J. Stam, #emph[Some inequalities satisfied by the quantities of information of Fisher and Shannon], Information and Control #strong[2] (1959), no.~2, 101--112. #link("https://doi.org/10.1016/S0019-9958(59)90348-1").]
#bibitem([30])[J.~A. Tropp, #emph[User-friendly tail bounds for sums of random matrices], Foundations of Computational Mathematics #strong[12] (2012), 389--434. #link("https://doi.org/10.1007/s10208-011-9099-z").]
#bibitem([31])[B. Valkó and B. Virág, #emph[Continuum limits of random matrices and the Brownian carousel], Inventiones Mathematicae #strong[177] (2009), no.~3, 463--508. #link("https://doi.org/10.1007/s00222-009-0180-z").]
#bibitem([32])[F. Wegner, #emph[Bounds on the density of states in disordered systems], Zeitschrift für Physik B #strong[44] (1981), 9--15. #link("https://doi.org/10.1007/BF01292646").]


