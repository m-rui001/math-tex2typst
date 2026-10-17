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

#align(center)[#text(size: 16pt, weight: "bold")[Three fixed points on the symplectic quadric threefold]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Arnold’s fixed-point conjecture compares Hamiltonian dynamics with the critical-point theory of smooth functions. For a sufficiently short autonomous Hamiltonian flow on a closed symplectic manifold, its fixed points are exactly the critical points of its Hamiltonian. The conjecture asks whether an arbitrary Hamiltonian diffeomorphism must retain the minimum number of critical points forced by the topology of the manifold. Arnold’s formulation explicitly includes the count of geometrically distinct points [1] Section 2. We construct a smooth counterexample on the complex quadric threefold, which also violates the weaker rational cup-length bound.

===== 1.1 The two degenerate bounds. <the-two-degenerate-bounds.>

For a closed smooth manifold $M$, write

$ "crit" \( h \) = { q in M : d h_q = 0 } \, #h(2em) "Crit" \( M \) = min_(h in C^oo \( M \, bb(R) \)) \# "crit" \( h \) . $

The minimum here permits degenerate critical points, whereas the #emph[Morse number] minimizes only over Morse functions. Let $"cuplength" \( M \; bb(Q) \)$ be one plus the maximum number of positive-degree rational cohomology classes with nonzero cup product. Thus our cup-length convention includes the unit. The Lusternik–Schnirelmann inequality gives

$ "cuplength" \( M \; bb(Q) \) lt.eq "Crit" \( M \) \; $

Section 5 recalls the cup-product argument in a form that applies to arbitrary smooth functions.

A Hamiltonian diffeomorphism of a symplectic manifold $\( M \, omega \)$ is the time-one map of a smooth time-dependent Hamiltonian flow. We write $"Ham" \( M \, omega \)$ for these maps, use the convention $iota_(X_(H_t)) omega = d H_t$, and set $"Fix" \( phi.alt \) = { q in M : phi.alt \( q \) = q }$. The #emph[critical-number Arnold bound] asserts that

#[#set math.equation(numbering: n => "(1.1)")
 $ \# "Fix" \( phi.alt \) gt.eq "Crit" \( M \) $ <eq:arnold-bound>]

for every $phi.alt in "Ham" \( M \, omega \)$ on every closed connected symplectic manifold. Its weaker #emph[rational cup-length] form replaces $"Crit" \( M \)$ by $"cuplength" \( M \; bb(Q) \)$. Neither formulation assumes nondegeneracy; see Golovko [7] Conjectures 1.4 and 1.6. A fixed point $q$ is nondegenerate when $1$ is not an eigenvalue of $d phi.alt_q$.

Let

#[#set math.equation(numbering: n => "(1.2)")
 $ Q^3 = { \[ z_0 : z_1 : z_2 : z_3 : z_4 \] in bb(C) upright(P)^4 : z_0^2 + z_1^2 + z_2^2 + z_3^2 + z_4^2 = 0 #scale(x: 120%, y: 120%)[}] \, $ <eq:quadric>]

with the restricted Fubini–Study symplectic form, normalized in Section 3.

#thm([Theorem 1.1.])[
  #emph[There is a smooth Hamiltonian diffeomorphism $phi.alt$ of the closed connected symplectic six-manifold $Q^3$ such that 
#[#set math.equation(numbering: n => "(1.3)")
 $ \# "Fix" \( phi.alt \) = 3 < 4 = "Crit" \( Q^3 \) = "cuplength" \( Q^3 \; bb(Q) \) . $ <eq:counterexample>]

 At least one fixed point of $phi.alt$ is degenerate.]
] <thm:counterexample>

This disproves both unrestricted smooth bounds. The count includes all fixed points, so imposing a contractibility condition on their Hamiltonian trajectories cannot restore either inequality. The nondegenerate homological Arnold inequalities concern a different hypothesis and remain compatible with this example.

The count of three is sharp. Gong [8] Section 1.1.1 obtains at least $n$ fixed points for every Hamiltonian diffeomorphism of the standard complex quadric of complex dimension $n gt.eq 2$. His normalization of the Fubini–Study form differs from ours by a positive scalar, which does not change the Hamiltonian group: rescaling the form and a generating Hamiltonian by the same scalar preserves its vector field. Thus our example attains his bound for $n = 3$.

===== 1.2 Historical context and related work. <historical-context-and-related-work.>

The positive cases explain why the unrestricted comparison is natural. Conley and Zehnder proved that every Hamiltonian diffeomorphism of the standard symplectic torus $T^(2 n)$ has at least $2 n + 1$ fixed points [3], and Fortune obtained the bound $n + 1$ on standard $bb(C) upright(P)^n$ [5]. Hofer obtained cup-length bounds without nondegeneracy when $pi_2 \( M \) = 0$ [9] Theorem 4. Rudyak and Oprea proved the full critical-number bound when both the symplectic class and the first Chern class vanish on $pi_2 \( M \)$ [17] Corollary 4.3. The quadric has spheres of positive symplectic area and lies outside these latter hypotheses.

Floer’s pseudoholomorphic-curve methods established homological Morse inequalities for nondegenerate Hamiltonian fixed points, including the monotone setting [4]. The lower bound by the sum of rational Betti numbers was subsequently established for nondegenerate Hamiltonian diffeomorphisms on every closed symplectic manifold by Fukaya and Ono, Liu and Tian, and Ruan [6,11,16]. The distinction between these bounds and the degenerate formulations above is essential; see [7] Theorem 1.3 and Conjectures 1.4 and 1.6. Ma [13] Theorem 1.5 asserted that the minimum number of fixed points over all Hamiltonian diffeomorphisms always equals $"Crit" \( M \)$. Theorem 1 contradicts that assertion.

Regularity also matters. Buhovsky, Humilière, and Seyfaddini constructed Hamiltonian #emph[homeomorphisms] with a single fixed point on every closed connected symplectic manifold of real dimension at least four [2]. Our construction stays in the smooth Hamiltonian group. In a preprint posted September 27, 2026, Jiao [10] Theorem 1.1 reports a smooth Hamiltonian diffeomorphism of the equal-area product $S^2 times S^2$ with two fixed points, using local saddle merging and mixed generating functions. The construction here instead uses a finite-order map on a six-dimensional quadric. None of these fixed-point results is an input to our construction.

===== 1.3 Proof mechanism. <proof-mechanism.>

The key is to transfer a critical-point count from a fixed submanifold to the fixed-point count of a nearby Hamiltonian map. Let $A$ be a finite-order Hamiltonian map with fixed submanifold $F$, whose fixed tangent vectors are exactly those tangent to $F$. Extend a function $f$ on $F$ to an $A$-invariant function $K$ on the ambient manifold, and let $B_s$ be its Hamiltonian flow. If $A^m = upright("id")$, invariance gives

$ \( A compose B_epsilon \)^m = B_(m epsilon) . $

For sufficiently small $epsilon > 0$, the right side has only stationary fixed points. Any fixed point of $A compose B_epsilon$ is therefore a critical point of $K$ fixed by $A$. Finite-group averaging makes ambient criticality on $F$ equivalent to criticality of $f$, giving

$ "Fix" \( A compose B_epsilon \) = "crit" \( f \) . $

This criticality step is the finite-group case of Palais’s principle of symmetric criticality [15] Section 5; the power identity excludes additional fixed points away from $F$.

For the quadric, take the Hamiltonian involution

$ A \[ z_0 : z_1 : z_2 : z_3 : z_4 \] = \[ z_0 : - z_1 : - z_2 : - z_3 : - z_4 \] . $

Its fixed locus is the quadric surface $Q^2 tilde.equiv S^2 times S^2$. This product admits functions with only three critical points, as recorded by Mare [14] Proposition 3.2.5 through an extension of Takens’s sphere-product construction [18]. We give an explicit formula and compute its entire critical set. The isolated degenerate critical point becomes a degenerate Hamiltonian fixed point. In contrast, symplectic volume forces every smooth function on the ambient $Q^3$ to have at least four critical points, and a Hamiltonian rotation realizes that minimum.

Section 2 proves the finite-order transfer, including the short-period estimate and invariant extension. Section 3 constructs the Hamiltonian involution and its tangent splitting. Section 4 gives the three-critical-point function. Section 5 proves the critical-number and rational cup-length equalities on $Q^3$, and Section 6 assembles the construction and verifies degeneracy.

== 2 Perturbing a finite-order Hamiltonian map <sec:reduction>

A short Hamiltonian perturbation of a finite-order map can replace its fixed submanifold by the critical set of a function on that submanifold. The tangent-space hypothesis below is the usual #emph[clean fixed-set] condition; we state it explicitly to identify the geometric input.

#thm([Proposition 2.1.])[
  #emph[Let $\( M \, omega \)$ be a closed symplectic manifold, and let $A in "Ham" \( M \, omega \)$ satisfy $A^m = upright("id")$ for some positive integer $m$. Suppose that $F = "Fix" \( A \)$ is a closed embedded submanifold and that 
$ T_q F = ker \( d A_q - upright("id") \) #h(2em) upright("for every ") q in F . $

 For every smooth function $f : F arrow.r bb(R)$, there is a smooth $A$-invariant extension $K : M arrow.r bb(R)$ such that, if $B_s$ is its Hamiltonian flow, then for every sufficiently small $epsilon > 0$ the map 
$ phi.alt_epsilon = A compose B_epsilon $

 is Hamiltonian and satisfies 
$ "Fix" \( phi.alt_epsilon \) = "crit" \( f \) \, $

 where the critical set on the right is viewed as a subset of $M$.]
] <prop:reduction>

The proof combines finite-group averaging with the exclusion of short nonconstant periodic trajectories. We establish the latter fact first. Lipschitz control of a vector field gives a lower bound for its nonconstant periods, a classical principle for which Yorke proved the sharp Euclidean estimate [20]. The following elementary local argument suffices here.

#thm([Lemma 2.2.])[
  #emph[Let $X$ be a smooth vector field on a closed manifold $M$, and let $Psi_t$ be its flow. There is a number $delta > 0$ such that 
$ "Fix" \( Psi_t \) = { q in M : X \( q \) = 0 } #h(2em) upright("for every ") 0 < t < delta . $

]
] <lem:short-periods>

#proof[
  The flow is defined for all time because $M$ is compact. Suppose that there were points $q_j$ and times $t_j > 0$ with
  $ t_j arrow.r 0 \, #h(2em) Psi_(t_j) \( q_j \) = q_j \, #h(2em) X \( q_j \) eq.not 0 . $
  After passing to a subsequence, assume that $q_j arrow.r q$. Choose coordinates near $q$, and a Euclidean ball about its coordinate image whose closure lies inside the coordinate domain. By continuity of the flow, all sufficiently late trajectory segments ${ Psi_s \( q_j \) : 0 lt.eq s lt.eq t_j }$ lie in this ball. The coordinate vector field $V$ is Lipschitz there with a constant $L gt.eq 0$, since its derivative is bounded on the closed ball.
  Write $u_j \( s \)$ for the coordinate trajectory and set
  $ C_j = max_(0 lt.eq s lt.eq t_j) \| dot(u)_j \( s \) \| > 0 . $
  For any $s \, r in \[ 0 \, t_j \]$, convexity of the ball and the Lipschitz estimate give
  $ \| dot(u)_j \( s \) - dot(u)_j \( r \) \| & = \| V \( u_j \( s \) \) - V \( u_j \( r \) \) \|\
 & lt.eq L \| u_j \( s \) - u_j \( r \) \| lt.eq L C_j \| s - r \| lt.eq L C_j t_j . $
  The closed trajectory has zero mean coordinate velocity: $integral_0^(t_j) dot(u)_j \( r \) thin d r = 0$. At a time $s_j$ of maximum speed, it follows that
  $ C_j = lr(|1 / t_j integral_0^(t_j) #scale(x: 120%, y: 120%)[\(] dot(u)_j \( s_j \) - dot(u)_j \( r \) #scale(x: 120%, y: 120%)[\)] thin d r|) lt.eq L C_j t_j . $
  Dividing by $C_j$ contradicts $t_j arrow.r 0$. Thus all fixed points of a sufficiently short positive-time map are zeros of $X$. Conversely, every zero of $X$ is stationary and hence fixed by every $Psi_t$. ◻
]

#proof[
  The first step is to extend $f$ so that criticality along $F$ is equivalent to ambient criticality at points of $F$. This is the finite-group case of symmetric criticality [15], which we verify directly. Extend $f$ smoothly to a function $tilde(f)$ on $M$: in submanifold charts, extend independently of the normal coordinates, and combine these local extensions using a partition of unity. Define
  $ K = 1 / m sum_(j = 0)^(m - 1) tilde(f) compose A^j . $
  Then $K compose A = K$ and $K \|_F = f$.
  Fix $q in F$, put $D = d A_q$, and consider
  $ P_q = 1 / m sum_(j = 0)^(m - 1) D^j . $
  Since $D^m = upright("id")$, we have $D P_q = P_q$. Moreover, $P_q v = v$ whenever $D v = v$. Thus $P_q$ is a projection onto $ker \( D - upright("id") \) = T_q F$. Differentiating the averaged extension gives, for every $v in T_q M$,
  $ d K_q \( v \) = d tilde(f)_q \( P_q v \) = d f_q \( P_q v \) . $
  Consequently,
  #[#set math.equation(numbering: n => "(2.1)")
   $ "crit" \( K \) ∩ F = "crit" \( f \) . $ <eq:critical-restriction>]
  Because $A$ is symplectic and $K compose A = K$, its differential carries the Hamiltonian vector field $X_K$ to itself. Uniqueness of solutions therefore gives $A compose B_s = B_s compose A$ for every $s$. Apply Lemma 3 to $X_K$, and choose $0 < epsilon < delta \/ m$. We then have
  $ phi.alt_epsilon^m = B_(m epsilon) \, #h(2em) "Fix" \( B_(m epsilon) \) = "crit" \( K \) . $
  If $phi.alt_epsilon \( q \) = q$, then $q$ is fixed by $B_(m epsilon)$, so $d K_q = 0$. It follows that $B_epsilon \( q \) = q$, and hence $A \( q \) = q$. Conversely, every point of $"crit" \( K \) ∩ F$ is fixed by $phi.alt_epsilon$. Equation (2.1) proves the asserted equality of fixed and critical sets.
  For completeness, the composition is generated by a smooth Hamiltonian on the unit time interval. Choose a Hamiltonian path $A_t$ from $upright("id")$ to $A$, generated by $H_t$, and a smooth nondecreasing function $a : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ equal to $0$ near $0$ and to $1$ near $1$. The time-dependent Hamiltonian
  $ L_t \( x \) = cases(delim: "{", 2 epsilon a' \( 2 t \) K \( x \) \, & 0 lt.eq t lt.eq 1 / 2 \,, 2 a' \( 2 t - 1 \) H_(a \( 2 t - 1 \)) \( x \) \, & 1 / 2 lt.eq t lt.eq 1) $
  is smooth, since both pieces vanish near the joining time. Its flow first follows $B_(epsilon a \( 2 t \))$, and then $A_(a \( 2 t - 1 \)) compose B_epsilon$, so its time-one map is $phi.alt_epsilon$. ◻
]

The proposition imposes no bound on the total number of critical points of $K$, and requires invariance under $A$, not under an isotopy from $upright("id")$ to $A$. A critical point $q in.not F$ satisfies $phi.alt_epsilon \( q \) = A \( q \) eq.not q$, so it contributes no fixed point.

== 3 A Hamiltonian involution of a quadric <sec:quadric>

We now construct the manifold and involution to which Proposition 2 will apply. Let $M subset bb(C) upright(P)^4$ be the quadric defined in (1.2).

#thm([Proposition 3.1.])[
  #emph[The manifold $M$ is closed, connected, and of real dimension six. For the restricted Fubini–Study form $omega$, normalized below, the map 
$ A \[ z_0 : z_1 : z_2 : z_3 : z_4 \] = \[ z_0 : - z_1 : - z_2 : - z_3 : - z_4 \] $

 is a Hamiltonian involution. Its fixed set is the smooth submanifold 
$ F = M ∩ { z_0 = 0 } tilde.equiv S^2 times S^2 . $

 For every $q in F$, the differential $d A_q$ acts as $+ upright("id")$ on $T_q F$ and as $- upright("id")$ on a complementary real two-dimensional subspace of $T_q M$.]
] <prop:quadric>

#proof[
  In any standard affine chart of $bb(C) upright(P)^4$, the equation defining $M$ takes the form $1 + sum_j w_j^2 = 0$. Its differential cannot vanish on its zero set: that would force all the $w_j$ to be zero. Thus $M$ is a smooth complex hypersurface, of complex dimension three. As a closed subset of projective space it is compact, and it has no boundary.
  To see connectedness, write a nonzero isotropic vector as $z = x + i y$ with $x \, y in bb(R)^5$. Its real and imaginary parts satisfy
  $ \| x \| = \| y \| > 0 \, #h(2em) x dot.op y = 0 . $
  After rescaling, they form an ordered orthonormal pair. Every such pair extends to a positively oriented orthonormal basis, so these pairs form one orbit of the connected group $upright("SO") \( 5 \)$. Their map $\( x \, y \) mapsto \[ x + i y \]$ onto $M$ proves that $M$ is connected.
  We construct the symplectic form with its normalization explicit. On the unit sphere $S^9 subset bb(C)^5$, put
  $ alpha = sum_(j = 0)^4 \( x_j thin d y_j - y_j thin d x_j \) . $
  The form $d alpha$ is invariant under scalar phase rotations. If $v in T_z S^9$, then
  $ d alpha \( i z \, v \) = - 2 "Re" sum_(j = 0)^4 overline(z_j) v_j = 0 . $
  Consequently it descends under the quotient map $p : S^9 arrow.r bb(C) upright(P)^4$ to a two-form $sigma$, characterized by $p^(*) sigma = d alpha$. Local sections show that $sigma$ is smooth and closed. A projective tangent vector has a horizontal lift $v in bb(C)^5$ satisfying $sum_j overline(z_j) v_j = 0$; multiplication by $i$ on these lifts induces the complex structure. Since
  $ d alpha \( v \, i v \) = 2 \| v \|^2 \, $
  $sigma$ is positive on every complex tangent line. Its restriction $omega = sigma \|_M$ is therefore closed and nondegenerate.
  We use a family of Hamiltonian rotations: equal speeds will give the involution, and unequal speeds will later give a function with four critical points on $M$. For $a \, b \, t in bb(R)$, let $Phi_t^(a \, b)$ keep $z_0$ fixed and act on $\( z_1 \, z_2 \)^(sans(T))$ and $\( z_3 \, z_4 \)^(sans(T))$ by $R_(a t)$ and $R_(b t)$, respectively, where
  $ R_theta = mat(delim: "(", cos theta, - sin theta; sin theta, cos theta) . $
  These real orthogonal, complex unitary transformations preserve the quadric and $alpha$. If $Z_(a \, b)$ is their generating vector field on $S^9$, Cartan’s formula gives
  $ iota_(Z_(a \, b)) d alpha = - d #scale(x: 120%, y: 120%)[\(] alpha \( Z_(a \, b) \) #scale(x: 120%, y: 120%)[\)] . $
  The function $alpha \( Z_(a \, b) \)$ is phase invariant, because the rotations commute with scalar multiplication. It thus descends to a smooth function $g_(a \, b)$ on projective space. The displayed identity descends as well, so $G_(a \, b) = - g_(a \, b) \|_M$ generates the projected rotations on $M$ with our convention $iota_(X_(G_(a \, b))) omega = d G_(a \, b)$. Explicitly,
  #[#set math.equation(numbering: n => "(3.1)")
   $ G_(a \, b) \( \[ z \] \) = frac(2 a thin "Im" \( overline(z_1) z_2 \) + 2 b thin "Im" \( overline(z_3) z_4 \), sum_(j = 0)^4 \| z_j \|^2) . $ <eq:rotation-hamiltonian>]
  In particular, $A = Phi_1^(pi \, pi)$ is Hamiltonian and preserves $omega$.
  A projective line fixed by $A$ lies in one of the two eigenspaces of $"diag" \( 1 \, - 1 \, - 1 \, - 1 \, - 1 \)$. The positive eigenspace gives the single point $\[ 1 : 0 : 0 : 0 : 0 \]$, which does not lie in $M$. The negative eigenspace gives precisely $F = M ∩ { z_0 = 0 }$. To identify $F$, use the invertible complex-linear map
  $ \( z_1 \, z_2 \, z_3 \, z_4 \) mapsto mat(delim: "(", z_1 + i z_2, z_3 + i z_4; - z_3 + i z_4, z_1 - i z_2) . $
  Its determinant is $z_1^2 + z_2^2 + z_3^2 + z_4^2$. It therefore identifies $F$ with the projectivized nonzero rank-one matrices. The map
  $ bb(C) upright(P)^1 times bb(C) upright(P)^1 arrow.r F \, #h(2em) \( \[ u \] \, \[ v \] \) mapsto \[ u v^(sans(T)) \] $
  is a diffeomorphism: a nonzero column and row recover the two projective factors, smoothly on the corresponding matrix charts. Finally, stereographic coordinates identify each $bb(C) upright(P)^1$ with $S^2$. Only this smooth identification is needed below.
  For the tangent-space assertion, fix $q in F$ and choose an affine chart $z_j = 1$ with $j > 0$. In its normalized coordinates, $A$ sends $w_0$ to $- w_0$ and leaves all other coordinates fixed. The equation of $M$ is
  $ w_0^2 + 1 + sum_(k > 0\
k eq.not j) w_k^2 = 0 . $
  At $q$, where $w_0 = 0$, its linearization places no constraint on the $w_0$ direction. The remaining differential is nonzero, so its kernel in the other coordinates is exactly $T_q F$. Thus
  $ T_q M = T_q F xor bb(C) frac(partial, partial w_0) \, $
  with the asserted $+ 1$ and $- 1$ actions. This also verifies directly that $F$ is a smooth complex surface. The positivity established above therefore makes $omega \|_F$ symplectic. ◻
]

== 4 Three critical points on the fixed submanifold <sec:three-points>

We next construct a function on the fixed submanifold with three critical points. The comparison with functions on the ambient quadric will follow in Section 5. Three-critical-point functions on products of spheres belong to the classical study of critical-point minima and category by Takens [18]; the $S^2 times S^2$ case is recorded by Mare [14] Proposition 3.2.5. We use the explicit formula below and determine its entire critical set directly, without importing an existence theorem or assuming that its critical points are Morse.

#thm([Proposition 4.1.])[
  #emph[Let $p = \( 0 \, 0 \, 1 \)$ and $e = \( 1 \, 0 \, 0 \)$ in $bb(R)^3$. The smooth function 
#[#set math.equation(numbering: n => "(4.1)")
 $ f : S^2 times S^2 arrow.r bb(R) \, #h(2em) f \( x \, y \) = e dot.op x + \( x - p \) dot.op y \, $ <eq:three-point-function>]

 has exactly three critical points.]
] <prop:three-points>

#proof[
  For a fixed $x eq.not p$, the $y$-dependence is a height function on the second sphere, with critical points $y = plus.minus \( x - p \) \/ \| x - p \|$. At $x = p$ that height function is constant, but criticality of the full function still requires its derivative in the $x$ directions to vanish. We therefore separate this exceptional fiber from the two height branches.
  The constrained critical-point equations are
  #[#set math.equation(numbering: n => "(4.2)")
   $ e + y = lambda x \, #h(2em) x - p = mu y \, #h(2em) \| x \| = \| y \| = 1 \, $ <eq:critical-multipliers>]
  for real multipliers $lambda \, mu$. If $x = p$, the first equation gives $y = - e + lambda p$. Its unit norm forces $lambda = 0$, yielding the unique point
  $ q_0 = \( p \, - e \) \, #h(2em) f \( q_0 \) = 0 . $
  Suppose now that $x eq.not p$ and set $t = \| x - p \| > 0$. The second equation in (4.2) gives $y = s \( x - p \) \/ t$ for a sign $s in { 1 \, - 1 }$. The first then becomes
  $ t e - s p = \( lambda t - s \) x . $
  Since the left side is nonzero, $lambda t - s eq.not 0$ and $x$ lies in the plane spanned by $e$ and $p$. Write $x = \( u \, 0 \, w \)$. The definition of $t$ gives $w = 1 - t^2 \/ 2$. Taking the first equation in (4.2) against the tangent vector $\( w \, 0 \, - u \)$ gives
  $ w + frac(s u, t) = 0 \, #h(2em) upright("so") #h(2em) u = - s t w . $
  Consequently the unit-norm condition reduces to
  #[#set math.equation(numbering: n => "(4.3)")
   $ 0 = \( 1 - t^2 \/ 2 \)^2 \( 1 + t^2 \) - 1 = frac(t^4 \( t^2 - 3 \), 4) . $ <eq:critical-factorization>]
  Because $t > 0$, this forces $t = sqrt(3)$, $w = - 1 \/ 2$, and $u = s sqrt(3) \/ 2$. In particular, the other pole $x = - p$, for which $t = 2$, is excluded. The two resulting candidates are
  #[#set math.equation(numbering: n => "(4.4)")
   $ q_s = ((frac(s sqrt(3), 2) \, 0 \, - 1 / 2) \, (1 / 2 \, 0 \, - frac(s sqrt(3), 2))) \, #h(2em) s in { 1 \, - 1 } . $ <eq:other-critical-points>]
  Both satisfy (4.2) with $lambda = mu = s sqrt(3)$, and
  $ f \( q_s \) = s thin frac(3 sqrt(3), 2) . $
  The cases $x = p$ and $x eq.not p$ exhaust the domain, proving the count. ◻
]

#prodef([Remark 4.2.])[
  The critical point $q_0$ is degenerate. Indeed, in local coordinates
  $ x = \( u \, v \, sqrt(1 - u^2 - v^2) \) \, #h(2em) y = \( - sqrt(1 - a^2 - b^2) \, a \, b \) \, $
  the function has expansion
  $ f = v a + O #scale(x: 120%, y: 120%)[\(] lr(bar.v.double \( u \, v \, a \, b \) bar.v.double)^3 #scale(x: 120%, y: 120%)[\)] . $
  Its Hessian therefore has eigenvalues $1 \, - 1 \, 0 \, 0$, so its rank is two. The complete critical-point calculation proves that this degenerate point is isolated. This is why a count restricted to Morse functions would not capture the example.
] <rem:degenerate-critical-point>

== 5 The critical number and cup length of the quadric <sec:critical-bound>

We now show that four is both the critical number and the rational cup length of the ambient quadric. The lower bound is the classical cup-product obstruction from Lusternik–Schnirelmann theory [12]; see Weber [19] Theorems 3.5 and 3.6 for a modern treatment valid without a Morse assumption. We give the differential-form proof, then obtain the matching upper bound from the unequal-speed rotations of Section 3.

#thm([Lemma 5.1.])[
  #emph[Let $M$ be a closed smooth manifold and $r gt.eq 1$ an integer. Suppose there are classes $a_j in H^(d_j) \( M \; bb(R) \)$, with $d_j > 0$ for $1 lt.eq j lt.eq r$, such that $a_1 smile dots.h.c smile a_r eq.not 0$. Then every smooth function on $M$ has at least $r + 1$ critical points.]
] <lem:critical-bound>

#proof[
  Suppose that $h : M arrow.r bb(R)$ has at most $r$ critical points. List its distinct critical values as $c_1 < dots.h.c < c_k$, where $1 lt.eq k lt.eq r$; the absolute minimum and maximum are among them. For a fixed Riemannian metric let $g_t$ be the negative-gradient flow of $h$, which is complete by compactness, and put $P_b = { h lt.eq b }$. We first cover $M$ by $k$ open sets, each diffeomorphic to a finite disjoint union of coordinate balls. Every closed positive-degree form will be exact on each of these sets; the cover will therefore force every product of $k$ positive-degree cohomology classes to vanish.
  Around the critical points at $c_i$, choose an open set $U_i$ that is a union of disjoint coordinate balls, and a smaller neighborhood $V_i$ with $overline(V)_i subset U_i$. A bound on the speed of the flow and the positive distance between $M \\ U_i$ and $overline(V)_i$ give $T_i > 0$ such that trajectories starting outside $U_i$ stay outside $V_i$ for $0 lt.eq t lt.eq T_i$.
  Choose a closed level band ${ \| h - c_i \| lt.eq delta_i }$ narrow enough that it contains no critical points outside $V_i$. On the part outside $V_i$, compactness gives a positive lower bound $b_i$ for $\| nabla h \|^2$; if that set is empty, any positive $b_i$ will do. Choose $0 < epsilon.alt_i < delta_i$ so that the intervals $\[ c_i - epsilon.alt_i \, c_i + epsilon.alt_i \]$ are separated and $2 epsilon.alt_i < T_i b_i$. Along the negative-gradient flow,
  $ frac(d, d t) h \( g_t \( q \) \) = - \| nabla h \( g_t \( q \) \) \|^2 . $
  A point of $P_(c_i + epsilon.alt_i) \\ U_i$ either already lies below $c_i - epsilon.alt_i$ or decreases at rate at least $b_i$ until it reaches that level. It follows that
  #[#set math.equation(numbering: n => "(5.1)")
   $ g_(T_i) \( P_(c_i + epsilon.alt_i) \\ U_i \) subset P_(c_i - epsilon.alt_i) . $ <eq:sublevel-drop>]
  For $i > 1$, a further fixed flow time $S_i > 0$ carries $P_(c_i - epsilon.alt_i)$ into $P_(c_(i - 1) + epsilon.alt_(i - 1))$: the compact band between these levels contains no critical points and has a positive gradient-norm lower bound.
  Since $c_1$ is the absolute minimum, $P_(c_1 - epsilon.alt_1)$ is empty, and (5.1) shows that $P_(c_1 + epsilon.alt_1) subset U_1$. Inductively, cover $P_(c_i + epsilon.alt_i)$ by $U_i$ and the preimages under $g_(T_i + S_i)$ of the $i - 1$ sets covering the preceding upper sublevel. Equation (5.1) proves that these sets cover. Each $g_t$ is a diffeomorphism of $M$, so every member remains diffeomorphic to a finite disjoint union of coordinate balls. The last upper sublevel is all of $M$, since $c_k$ is the absolute maximum.
  Write the resulting cover as $O_1 \, dots.h \, O_k$. Choose closed forms $alpha_j$ representing $a_j$ for $1 lt.eq j lt.eq k$. Since these forms have positive degree, the Poincaré lemma on each ball gives $alpha_j = d lambda_j$ on $O_j$. Choose a smooth partition of unity $psi_1 \, dots.h \, psi_k$ subordinate to the cover. Let $chi : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ be smooth, zero on $\[ 0 \, 1 \/ \( 4 k \) \]$ and one on $\[ 1 \/ \( 2 k \) \, 1 \]$, and put $rho_j = chi \( psi_j \)$. At every point some $psi_j gt.eq 1 \/ k$, so some $rho_j$ is identically one nearby. Each $rho_j lambda_j$ extends smoothly by zero outside $O_j$.
  The closed forms
  $ alpha'_j = alpha_j - d \( rho_j lambda_j \) $
  represent the same classes as $alpha_j$. Near every point, at least one of these forms vanishes, and hence $alpha'_1 and dots.h.c and alpha'_k = 0$. Thus $a_1 smile dots.h.c smile a_k = 0$, contradicting the nonvanishing of $a_1 smile dots.h.c smile a_r$ because $k lt.eq r$. ◻
]

Extension of coefficients $H^(*) \( M \; bb(Q) \) arrow.r H^(*) \( M \; bb(R) \)$ is injective for a closed manifold and respects cup products. The lemma therefore also gives

#[#set math.equation(numbering: n => "(5.2)")
 $ "cuplength" \( M \; bb(Q) \) lt.eq "Crit" \( M \) \, $ <eq:cup-critical>]

with the unit-inclusive convention of Section 1. It also recovers the symplectic-volume obstruction used in our example.

#thm([Corollary 5.2.])[
  #emph[Every smooth function on a closed connected symplectic manifold of real dimension $2 n$, with $n gt.eq 1$, has at least $n + 1$ critical points.]
] <cor:symplectic-critical>

#proof[
  The class $\[ omega \]^n$ is nonzero, since $integral_M omega^n > 0$ in the symplectic orientation. Apply Lemma 7 with each $a_j = \[ omega \]$. ◻
]

#thm([Corollary 5.3.])[
  #emph[For the quadric threefold in (1.2), 
$ "Crit" \( Q^3 \) = "cuplength" \( Q^3 \; bb(Q) \) = 4 . $

]
] <cor:quadric-critical>

#proof[
  Let $h = c_1 \( cal(O)_(Q^3) \( 1 \) \) in H^2 \( Q^3 \; bb(Z) \)$ be the hyperplane class. Since $Q^3$ has degree two in $bb(C) upright(P)^4$,
  $ h^3 = 2 \[ upright("pt") \] \, $
  where $\[ upright("pt") \]$ evaluates to one on the fundamental class. This product remains nonzero over $bb(Q)$, giving $"cuplength" \( Q^3 \; bb(Q) \) gt.eq 4$.
  For the matching upper bound, take the Hamiltonian $G_(1 \, 2)$ of (3.1). Its critical points are precisely the zeros of its Hamiltonian vector field. That field is induced on $Q^3$ by the complex-linear generator
  $ T = "diag" \( 0 \, J \, 2 J \) \, #h(2em) J = mat(delim: "(", 0, - 1; 1, 0) . $
  The induced projective vector field vanishes at $\[ z \]$ exactly when $T z in bb(C) z$. The eigenvalues $0 \, plus.minus i \, plus.minus 2 i$ of $T$ are distinct, so its projective zeros are its five eigenlines. The zero eigenline $\[ 1 : 0 : 0 : 0 : 0 \]$ misses $Q^3$, whereas the other four lines
  $ \[ 0 : 1 : plus.minus i : 0 : 0 \] \, #h(2em) \[ 0 : 0 : 0 : 1 : plus.minus i \] $
  all satisfy the quadric equation. Thus $G_(1 \, 2)$ has exactly four critical points on $Q^3$. Together with (5.2), this gives
  $ 4 lt.eq "cuplength" \( Q^3 \; bb(Q) \) lt.eq "Crit" \( Q^3 \) lt.eq 4 . $
  ◻
]

== 6 The Hamiltonian counterexample <sec:conclusion>

We now apply the finite-order reduction to the function on the fixed surface and compare the resulting fixed-point count with the ambient critical number and cup length.

#proof[
  Take the symplectic quadric $\( M \, omega \)$ and Hamiltonian involution $A$ from Proposition 4. Its fixed submanifold $F$ is diffeomorphic to $S^2 times S^2$. Transport the function of Proposition 5 to $F$; it has exactly three critical points.
  Proposition 2 provides a smooth $A$-invariant extension $K : M arrow.r bb(R)$ with $K \|_F = f$. Let $B_s$ denote its Hamiltonian flow. For all sufficiently small $epsilon > 0$, the map
  $ phi.alt = A compose B_epsilon $
  is a Hamiltonian diffeomorphism and satisfies $"Fix" \( phi.alt \) = "crit" \( f \)$, with the critical points viewed as points of $F$. The exact comparison in Corollary 9 now gives
  $ \# "Fix" \( phi.alt \) = 3 < 4 = "Crit" \( M \) = "cuplength" \( M \; bb(Q) \) . $
  It remains to verify the asserted degeneracy. Write $omega_F = omega \|_F$, which is symplectic, and let $X_f$ be the Hamiltonian vector field of $f$ on $\( F \, omega_F \)$. Invariance of $K$ makes $X_K$ tangent to $F$, and restricting its defining equation to $T F$ gives $X_K \|_F = X_f$. Indeed, at $q in F$ invariance gives $d A_q X_K \( q \) = X_K \( q \)$, and the fixed tangent space is $T_q F$. Thus $B_s$ preserves $F$, and its restriction is the Hamiltonian flow of $f$ on $F$. At the critical point $q_0$ of Remark 6, differentiating $iota_(X_f) omega_F = d f$ gives
  $ omega_F #scale(x: 120%, y: 120%)[\(] D X_f \( q_0 \) v \, w #scale(x: 120%, y: 120%)[\)] = "Hess"_(q_0) f \( v \, w \) . $
  Thus any nonzero vector $v$ in the Hessian kernel satisfies $D X_f \( q_0 \) v = 0$. Since $A \|_F = upright("id")$ and $q_0$ is an equilibrium,
  $ d phi.alt_(q_0) v = exp #scale(x: 120%, y: 120%)[\(] epsilon D X_f \( q_0 \) #scale(x: 120%, y: 120%)[\)] v = v . $
  The fixed point $q_0$ therefore has eigenvalue $1$ in its linearization. This argument takes place entirely in the invariant subspace $T_(q_0) F$; no assumption on the normal Hessian of the extension $K$ is needed. ◻
]

#heading(level: 1)[References]
#bibitem([1])[V.~I.~Arnol'd, #emph[First steps in symplectic topology], Russian Mathematical Surveys #strong[41] (1986), no.~6, 1--21. #link("https://doi.org/10.1070/RM1986v041n06ABEH004221")[doi:10.1070/RM1986v041n06ABEH004221].]
#bibitem([2])[L.~Buhovsky, V.~Humilière, and S.~Seyfaddini, #emph[A $C^0$ counterexample to the Arnold conjecture], Inventiones Mathematicae #strong[213] (2018), no.~2, 759--809. #link("https://doi.org/10.1007/s00222-018-0797-x")[doi:10.1007/s00222-018-0797-x].]
#bibitem([3])[C.~C.~Conley and E.~Zehnder, #emph[The Birkhoff--Lewis fixed point theorem and a conjecture of V.~I.~Arnold], Inventiones Mathematicae #strong[73] (1983), 33--49. #link("https://doi.org/10.1007/BF01393824")[doi:10.1007/BF01393824].]
#bibitem([4])[A.~Floer, #emph[Symplectic fixed points and holomorphic spheres], Communications in Mathematical Physics #strong[120] (1989), no.~4, 575--611. #link("https://doi.org/10.1007/BF01260388")[doi:10.1007/BF01260388].]
#bibitem([5])[B.~Fortune, #emph[A symplectic fixed point theorem for $bb(C) upright(P)^n$], Inventiones Mathematicae #strong[81] (1985), no.~1, 29--46. #link("https://doi.org/10.1007/BF01388770")[doi:10.1007/BF01388770].]
#bibitem([6])[K.~Fukaya and K.~Ono, #emph[Arnold conjecture and Gromov--Witten invariant], Topology #strong[38] (1999), no.~5, 933--1048. #link("https://doi.org/10.1016/S0040-9383(98)00042-1")[doi:10.1016/S0040-9383(98)00042-1].]
#bibitem([7])[R.~Golovko, #emph[On variants of Arnold conjecture], Archivum Mathematicum #strong[56] (2020), no.~5, 277--286. #link("https://doi.org/10.5817/AM2020-5-277")[doi:10.5817/AM2020-5-277].]
#bibitem([8])[W.~Gong, #emph[Degenerate symplectic fixed points and Gromov--Witten invariants], #link("https://arxiv.org/abs/2507.04191v5")[arXiv:2507.04191v5], December 21, 2025.]
#bibitem([9])[H.~Hofer, #emph[Lusternik--Schnirelman-theory for Lagrangian intersections], Annales de l'Institut Henri Poincaré C, Analyse non linéaire #strong[5] (1988), no.~5, 465--499. #link("https://doi.org/10.1016/S0294-1449(16)30339-0")[doi:10.1016/S0294-1449(16)30339-0].]
#bibitem([10])[H.~Jiao, #emph[A smooth Hamiltonian diffeomorphism with two fixed points on $S^2 times S^2$], #link("https://arxiv.org/abs/2609.33626v1")[arXiv:2609.33626v1], September 27, 2026.]
#bibitem([11])[G.~Liu and G.~Tian, #emph[Floer homology and Arnold conjecture], Journal of Differential Geometry #strong[49] (1998), no.~1, 1--74. #link("https://doi.org/10.4310/jdg/1214460936")[doi:10.4310/jdg/1214460936].]
#bibitem([12])[L.~Lusternik and L.~Schnirelmann, #emph[Méthodes topologiques dans les problèmes variationnels. I. Espaces à un nombre fini de dimensions], Actualités scientifiques et industrielles 188, Hermann, Paris, 1934.]
#bibitem([13])[R.~Ma, #emph[Proofs on Arnold conjectures], #link("https://arxiv.org/abs/0808.0613v7")[arXiv:0808.0613v7], July 5, 2013.]
#bibitem([14])[A.-L.~Mare, #emph[Topology of isotropy orbits], doctoral dissertation, Universität Augsburg, 1997. #link("https://uregina.ca/~mareal/papers/Teza.pdf")[Author-hosted text].]
#bibitem([15])[R.~S.~Palais, #emph[The principle of symmetric criticality], Communications in Mathematical Physics #strong[69] (1979), no.~1, 19--30. #link("https://doi.org/10.1007/BF01941322")[doi:10.1007/BF01941322].]
#bibitem([16])[Y.~Ruan, #emph[Virtual neighborhoods and pseudo-holomorphic curves], Turkish Journal of Mathematics #strong[23] (1999), no.~1, 161--232. #link("https://journals.tubitak.gov.tr/math/vol23/iss1/10/")[Publisher record]\; #link("https://arxiv.org/abs/alg-geom/9611021v2")[arXiv:alg-geom/9611021v2].]
#bibitem([17])[Y.~B.~Rudyak and J.~Oprea, #emph[On the Lusternik--Schnirelmann category of symplectic manifolds and the Arnold conjecture], Mathematische Zeitschrift #strong[230] (1999), no.~4, 673--678. #link("https://doi.org/10.1007/PL00004709")[doi:10.1007/PL00004709].]
#bibitem([18])[F.~Takens, #emph[The minimal number of critical points of a function on a compact manifold and the Lusternik--Schnirelman category], Inventiones Mathematicae #strong[6] (1968), no.~3, 197--244. #link("https://doi.org/10.1007/BF01404825")[doi:10.1007/BF01404825].]
#bibitem([19])[J.~Weber, #emph[Conley pairs in geometry---Lusternik--Schnirelmann theory and more], Expositiones Mathematicae #strong[37] (2019), no.~1, 25--47. #link("https://doi.org/10.1016/j.exmath.2017.10.003")[doi:10.1016/j.exmath.2017.10.003].]
#bibitem([20])[J.~A.~Yorke, #emph[Periods of periodic solutions and the Lipschitz constant], Proceedings of the American Mathematical Society #strong[22] (1969), no.~2, 509--512. #link("https://doi.org/10.1090/S0002-9939-1969-0245916-7")[doi:10.1090/S0002-9939-1969-0245916-7].]


