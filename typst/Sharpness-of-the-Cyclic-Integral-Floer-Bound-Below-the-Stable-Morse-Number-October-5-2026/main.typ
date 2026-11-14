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

#align(center)[#text(size: 16pt, weight: "bold")[Sharpness of the Cyclic Integral Floer Bound \
Below the Stable Morse Number]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The fixed-point problem for Hamiltonian diffeomorphisms compares symplectic dynamics with the topology measured by
  Morse functions. Here we distinguish two integral homological counts:
  one retains every integer degree, while the other retains only parity.
  Torsion at different primes makes these counts genuinely different.
  We construct a Hamiltonian diffeomorphism attaining the parity count on a manifold whose geometric stable Morse
  number is strictly larger.

For a closed smooth manifold $W$, put

$ b \( W \) = sum_i "rank" H_i \( W \; bb(Z) \) . $

For a finite abelian group $G$, let $d \( G \)$ be its minimum number of generators, with $d \( 0 \) = 0$. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ lambda \( W \) & = b \( W \) + 2 sum_i d #scale(x: 120%, y: 120%)[\(] "Tor" H_i \( W \; bb(Z) \)
   #scale(x: 120%, y: 120%)[\)] \,\
overline(H)_(macron(i)) \( W \; bb(Z) \) & = xor.big_(k equiv i med \( mod med 2 \)) H_k \( W \; bb(Z) \) \,\
beta_(bb(Z))^(upright("cyc")) \( W \) & = b \( W \) + 2 sum_(macron(i) in bb(Z) \/ 2) d
  #scale(x: 120%, y: 120%)[\(] "Tor" overline(H)_(macron(i)) \( W \; bb(Z) \) #scale(x: 120%, y: 120%)[\)] .
  $ <eq:lambda>]

The first expression is degreewise; in the second, torsion summands may be combined across all degrees of the same
  parity. For example, $d \( bb(Z) \/ 2 xor bb(Z) \/ 3 \) = 1$,
  whereas placing these two groups in distinct degrees of the same parity contributes $2$ to the degreewise sum
  but only $1$ to the paritywise sum. Consequently $beta_(bb(Z))^(upright("cyc")) \( W \) lt.eq lambda \( W \)$,
  and strictness is possible.

We use the geometric convention for the stable Morse number:
  $"SM" \( W \)$ is the minimum number of critical points of a Morse function on $W times bb(R)^k$,
  for some integer $k gt.eq 0$, which equals a nondegenerate quadratic form in the auxiliary variables outside a
  compact set. For $k = 0$ this includes ordinary Morse functions on $W$.
  Write $"Morse" \( W \)$ for the minimum number of critical points of an ordinary Morse function on $W$.

For a smooth Hamiltonian $H : \( bb(R) \/ bb(Z) \) times M arrow.r
  bb(R)$ on a closed symplectic manifold $\( M \, omega \)$,
  we use the convention $omega \( X_(H_t) \, dot.op \) = d H_t$ and write $phi.alt_H^t$ for its flow starting at
  the identity. A fixed point $x$ of $phi.alt_H^1$ is nondegenerate if $D
  phi.alt_H^1 \( x \)$ has no eigenvalue $1$. Let $"Fix"_0 \( phi.alt_H^1 \; H \)$ denote the fixed points for
  which $t mapsto phi.alt_H^t \( x \)$ is contractible in $M$.

#thm([Theorem 1.1.])[
  #emph[There exist a simply connected closed Kähler manifold $\( M \, omega \)$ of complex dimension $1666$ and a
    smooth one-periodic Hamiltonian $H$ such that
$ c_1 \( T M \) \( pi_2 \( M \) \) = bb(Z) \, $

 every fixed point of $phi.alt_H^1$ is nondegenerate, and
$ \# "Fix" \( phi.alt_H^1 \) & = \# "Fix"_0 \( phi.alt_H^1 \; H \) = beta_(bb(Z))^(upright("cyc")) \( M \) =
  1 thin 872 thin 232 \,\
"SM" \( M \) & = beta_(bb(Z))^(upright("cyc")) \( M \) + 32 = 1 thin 872 thin 264 . $

]
] <thm:main>

A stable Morse lower bound therefore cannot hold for all nondegenerate Hamiltonian diffeomorphisms of closed
  symplectic manifolds, even in the simply connected Kähler class.

=== Context and proof strategy <context-and-proof-strategy>

The Arnold fixed-point problem asks how the critical-point constraints of Morse theory persist for Hamiltonian
  diffeomorphisms #cite(label("Arnold1986")). Conley and Zehnder established the torus case by variational methods
  #cite(label("ConleyZehnder1983")), and Floer’s homology theory related periodic Hamiltonian orbits to the
  topology of the ambient manifold #cite(label("Floer1989")).
  Integral refinements retain torsion as well as rational Betti numbers.
  In particular, Bai and Xu prove a lower bound using integral homology with degrees reduced modulo twice the
  minimal Chern number #cite(label("BaiXu2022")) Theorem A; see also #cite(label("BaiXu2026")) Corollary 1.2.
  When the minimal Chern number is one, their expression is precisely $beta_(bb(Z))^(upright("cyc"))$.
  Thus Theorem 1 attains this integral Floer bound.

The stable Morse number is a stronger proposed benchmark for the Arnold problem;
  see #cite(label("Golovko2020")) Conjecture 1.2. Dimitroglou Rizell and Golovko prove a stable Morse lower bound
  for generic Hamiltonian diffeomorphisms when both the symplectic area class and the first Chern class vanish on
  $pi_2$ #cite(label("DRG2017")) Corollary 1.4. The exceptional sphere of Chern number one in our construction
  excludes these hypotheses. The classical theorem of Smale identifies $lambda \( W \)$ with the minimum number of
  critical points of an ordinary Morse function on a simply connected closed manifold of sufficiently high
  dimension #cite(label("Smale1963")) #cite(label("Cerf1962")).
  The same number is a lower bound for the geometric stable Morse number,
  so these two geometric minima agree in the present setting.
  In contrast, a two-periodic free integral chain complex sees the smaller count $beta_(bb(Z))^(upright("cyc"))$.
  Our construction and its fixed-point calculation are finite-dimensional; they do not use Floer theory.

The mixed-prime torsion and Hamiltonian involution construction of #cite(label("OpenAI2026Stable")) already gives
  a fixed-point count below the stable Morse number. Here we change the blow-up centers to make the count attain
  $beta_(bb(Z))^(upright("cyc"))$ exactly. We reproduce the needed geometric arguments.
  A rational surface $Y$ admits a Hamiltonian involution whose fixed set is the disjoint union of four projective
  lines. For a simply connected Kähler manifold $X$, the product $M = X times
  Y$ therefore has an involution with four fixed components $C = X times bb(C P)^1$.
  A small invariant Hamiltonian perturbation replaces each component by the critical points of a Morse function on
  $C$. In the dimensions used below, Smale’s theorem supplies such a function with $lambda \( C \)$ critical
  points. The dynamical construction therefore gives $4 lambda \( C \)$ nondegenerate fixed points.

It remains to arrange

$ 4 lambda \( C \) = beta_(bb(Z))^(upright("cyc")) \( M \) < lambda \( M \) . $

The free even homology of $bb(C P)^1$ and $Y$ has ranks $\( 1 \, 1 \)$ and $\( 1 \, 6 \, 1 \)$, respectively.
  Multiplication by these spaces convolves the torsion multiplicities of $X$ with these two sequences.
  We choose $X$ so that the $3$-primary multiplicities dominate the $2$-primary multiplicities after convolution
  with $\( 1 \, 1 \)$, but not after convolution with $\( 1 \, 6 \, 1 \)$.
  Blow-ups along seven disjoint products of elliptic-curve quotients and projective spaces realize the required
  multiplicities. This degree-sensitive choice is the mechanism that makes the cyclic count sharp while preserving
  a positive degreewise gap. It is expressed entirely in finite sequences and can be separated from the geometric
  realization.

Section 2 establishes the geometric Morse comparison. Section 3 proves the perturbation principle and constructs
  $Y$. Section 4 supplies the quotient surfaces and the integral blow-up formula.
  Section 5 chooses the centers, evaluates both counts, and proves Theorem 1.

== 2 Integral homology and geometric Morse counts <sec:morse>

We first separate two facts used in the construction: integral homology gives a lower bound for every admissible
  stabilized Morse function, and Smale’s theorem realizes that bound by an ordinary Morse function on a simply
  connected manifold of sufficiently large dimension. Throughout this section, put

$ r_i \( W \) = "rank" H_i \( W \; bb(Z) \) \, wide t_i \( W \) =
  d #scale(x: 120%, y: 120%)[\(] "Tor" H_i \( W \; bb(Z) \) #scale(x: 120%, y: 120%)[\)] . $

Thus $lambda \( W \) = sum_i r_i \( W \) + 2 sum_i t_i \( W \)$,
  with both sequences understood to vanish outside the homological range.

#thm([Lemma 2.1.])[
  (Ranks of free integral complexes).  #emph[Let $C_(*)$ be a finite chain complex of finitely generated free
    abelian groups. If $b_i = "rank" H_i \( C_(*) \)$ and $t_i = d \( "Tor" H_i \( C_(*) \) \)$, then
$ "rank" C_i gt.eq b_i + t_i + t_(i - 1) \, wide sum_i "rank" C_i gt.eq sum_i b_i + 2 sum_i t_i . $

 The same statements hold for a $bb(Z) \/ 2$-graded complex, with indices interpreted modulo two.
   In either grading, the lower bound on total rank is attained by a free complex with any prescribed finite
   collection of finitely generated homology groups.]
] <morse:rank>

#proof[
  Write $Z_i = ker partial_i$ and $B_i = "im" partial_(i + 1)$, which are free abelian.
    The exact sequences defining cycles, boundaries, and homology give
  $ "rank" C_i = b_i + "rank" B_i + "rank" B_(i - 1) . $
  Smith normal form for the inclusion $B_i subset Z_i$ shows that $"Tor" \( Z_i \/ B_i \)$ has at most $"rank"
    B_i$ nontrivial cyclic invariant factors. Hence $t_i lt.eq "rank" B_i$, proving both inequalities.
    This argument also applies verbatim with cyclic indices.
  For attainment, decompose each prescribed homology group into its free part and nontrivial cyclic invariant
    factors. A free generator in degree $i$ is represented by an isolated copy of $bb(Z)$ in that degree.
    A cyclic factor $bb(Z) \/ n$, $n > 1$, in degree $i$ is represented by
  $ bb(Z) arrow.r^(med n med) bb(Z) $
  in degrees $i + 1$ and $i$, with all other differentials zero. Take the direct sum of these complexes.
    In the cyclic grading the source and target lie in the two opposite parities,
    with the reverse differential zero. Each cyclic factor therefore costs exactly two free generators in either
    grading. ◻
]

In particular, $beta_(bb(Z))^(upright("cyc")) \( W \)$ is the minimum total rank of a free $bb(Z) \/
  2$-graded integral complex whose homology is $overline(H)_(macron(*)) \( W \; bb(Z) \)$.
  This interpretation concerns algebraic complexes; it does not assert geometric realization by Morse functions.
  The distinction between this minimum and $lambda \( W \)$ is that cyclic grading permits torsion at different
  integer degrees of the same parity to share invariant factors.

#thm([Proposition 2.2.])[
  #emph[For every closed smooth manifold $W$, with the exact quadratic condition at infinity and all
    stabilizations $k gt.eq 0$ allowed,
$ "SM" \( W \) gt.eq lambda \( W \) . $

]
] <morse:stable>

#proof[
  Let $F : W times bb(R)^k arrow.r bb(R)$ be Morse and equal to a fixed nondegenerate quadratic form $Q$ outside a
    compact subset of the product. We construct a finite free integral complex with one generator per critical
    point and homology equal to that of $W$, up to a uniform grading shift.
    For $k = 0$ the ordinary Morse complex suffices. Suppose $k > 0$.
  After a linear change of auxiliary coordinates, write
  $ Q \( u \, v \) = - \| u \|^2 + \| v \|^2 \, wide \( u \, v \) in bb(R)^nu times bb(R)^(k - nu) . $
  Choose $R_0 > 0$ such that $F = Q$ for $\| \( u \, v \) \| gt.eq R_0$ and all critical points lie in $W times
    B_(R_0)$. This is possible because $d Q$ vanishes only at the origin. Choose
  $ A > max_(W times overline(B)_(R_0)) { \| F \| \, \| Q \| } \, wide T > R_0 \, quad T^2 > A \, $
  and set
  $ K = W times overline(B)_T \, wide K_plus.minus = K ∩ { F lt.eq plus.minus A } . $
  The core $W times overline(B)_(R_0)$ is excluded at level $- A$ and included at level $A$, for both $F$ and $Q$.
    Outside that core the two functions agree. Consequently
  #[#set math.equation(numbering: n => "(2.1)")
   $ K_plus.minus = K ∩ { Q lt.eq plus.minus A } . $ <morse:endpoints>]
  We explain why this compact truncation introduces no extra cells in the level band $\[ - A \, A \]$.
    On the side boundary $W times partial B_T$, the restriction of $F$ is $Q$.
    Its restricted differential can vanish only when $u = 0$ or $v = 0$,
    so its only possible critical values are $T^2$ and $- T^2$. Neither is in the band.
    Thus a gradient-like vector field for $F$ on the band can be chosen tangent to the side boundary:
    take a tangential gradient there, extend across a collar,
    and combine it with interior gradient-like fields by a partition of unity.
    Away from the critical points all these fields increase $F$ strictly.
  The usual Morse attachment argument now applies to this compact manifold with boundary.
    Between critical levels its deformation flow preserves the side boundary,
    and each interior critical point attaches exactly one cell of its Morse index.
    This is the standard attachment theorem #cite(label("Milnor1963")) Section 3,
    with the tangential field supplying the boundary-preserving deformation.
    The endpoint level hypersurfaces meet the side boundary transversely.
    Hence the endpoint sublevels are compact manifolds with corners, or empty, and have finite CW type.
    Replacing $K_(-)$ by a finite CW model and using cellular approximation on the finitely many attaching maps
    gives a finite free relative cellular complex $C_(*)$ satisfying
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_i "rank" C_i = \# "Crit" \( F \) \, wide H_i \( C_(*) \) tilde.equiv H_i \( K_(+) \, K_(-) \; bb(Z) \) .
     $ <morse:relative-complex>]
  Critical values may first be separated by a small perturbation supported near the critical points;
    this leaves the endpoint pair and all critical-point counts unchanged.
  By (2.1), shrinking $v$ to zero preserves both members of the pair: it decreases $Q$ and the Euclidean norm.
    The resulting deformation retraction identifies its relative homology with that of
  $ W times #scale(x: 120%, y: 120%)[\(] D_T^nu \, { u in D_T^nu : \| u \| gt.eq
    sqrt(A) } #scale(x: 120%, y: 120%)[\)] . $
  The disk–annulus pair has integral relative homology $bb(Z)$ in degree $nu$ and zero otherwise.
    When $nu = 0$ it is the pair $\( { 0 } \, diameter \)$, with the same assertion in degree zero.
    The relative Künneth theorem therefore gives
  $ H_i \( C_(*) \) tilde.equiv H_(i - nu) \( W \; bb(Z) \) . $
  This includes positive definite, negative definite, and indefinite quadratic forms.
    Applying Lemma 2 to (2.2) proves $\# "Crit" \( F \) gt.eq lambda \( W \)$.
    Taking the minimum over all admissible functions proves the claim. ◻
]

#prodef([Remark 2.3.])[
  The common convention allowing $parallel d F - d Q parallel$ to be uniformly bounded gives the same stable Morse
    number. Indeed, write $F = Q + h$ and $parallel d h parallel lt.eq K$ in a product metric.
    Compactness of $W$ gives $\| h \( x \, z \) \| lt.eq K_0 + K \| z \|$,
    whereas nondegeneracy gives $parallel d Q \( z \) parallel gt.eq c \| z \|$ for some $c > 0$.
    If a radial cutoff $chi_R$ equals one on $B_R$, vanishes outside $B_(2 R)$,
    and has $parallel d chi_R parallel lt.eq C \/ R$, then on the intervening annulus
  $ parallel d \( chi_R h \) parallel lt.eq K + C \( K_0 \/ R + 2 K \) . $
  For sufficiently large $R$ this is less than $c R$. Thus $Q + chi_R h$ equals $F$ near every critical point,
    has no new critical points, and equals $Q$ outside a compact set. The converse inclusion is immediate.
    This identifies our convention with the one used in the stable Morse comparisons cited in the introduction.
] <morse:conventions>

#thm([Theorem 2.4.])[
  (Smale).  #emph[Let $W$ be a simply connected closed smooth manifold of real dimension at least six.
    There is an ordinary Morse function $h : W arrow.r bb(R)$ having exactly
$ r_i \( W \) + t_i \( W \) + t_(i - 1) \( W \) $

 critical points of index $i$, simultaneously for every $i$. Consequently
$ "SM" \( W \) = "Morse" \( W \) = lambda \( W \) . $

]
] <morse:smale>

#proof[
  The existence assertion is the torsion-inclusive form of the classical geometric Morse theorem of Smale
    #cite(label("Smale1963")) Theorem 2.4 and the following paragraph;
    see also #cite(label("Cerf1962")) Theorem 2 and Section 6 for its statement and handle proof.
    In these statements the torsion count is the number of cyclic invariant factors,
    equivalently the minimum number of generators of the torsion subgroup.
    Thus summing the prescribed index counts gives $"Morse" \( W \) lt.eq lambda \( W \)$.
    An ordinary Morse function is admissible in the definition of $"SM"$ by choosing $k = 0$;
    on the compact space $W$ the exterior condition is then vacuous. Proposition 3 yields
  $ lambda \( W \) lt.eq "SM" \( W \) lt.eq "Morse" \( W \) lt.eq lambda \( W \) \, $
  which proves both equalities. ◻
]

== 3 An involution with a prescribed perturbation <inv:section>

The construction uses a Hamiltonian involution whose fixed components are smaller than the ambient manifold.
  A small invariant perturbation turns a chosen Morse function on each component into an exact list of
  nondegenerate Hamiltonian fixed points. The following elementary estimate excludes additional fixed points.
  We give the involution argument of #cite(label("OpenAI2026Stable")) Proposition 4.2 in a general form;
  the period estimate is a compact-manifold version of the classical Lipschitz period bound #cite(label("Yorke1969")).

#thm([Lemma 3.1.])[
  #emph[Let $V$ be a smooth vector field on a closed manifold $P$, with flow $psi^s$. There exists $tau > 0$ such that
$ 0 < T < tau \, wide psi^T \( x \) = x quad arrow.r.double quad V \( x \) = 0 . $

]
] <inv:short-period>

#proof[
  Choose finitely many coordinate balls, each relatively compact in a larger coordinate chart,
    and smaller balls that cover $P$. Uniform speed bounds give $delta >
    0$ such that a trajectory starting in a smaller ball stays in its corresponding coordinate ball for time
    $delta$. Choose a common Lipschitz constant $L > 0$ for the coordinate vector fields on these balls.
  Suppose $psi^T \( x \) = x$ with $T < delta$. Write the trajectory in one of these charts as $y : \[ 0 \, T \]
    arrow.r bb(R)^d$, with $dot(y) = v \( y \)$. Set
  $ m = max_(0 lt.eq t lt.eq T) \| v \( y \( t \) \) \| $
  and choose $t_0$ realizing the maximum. Since $y \( T \) = y \( 0 \)$,
    $integral_0^T v \( y \( t \) \) thin d t = 0$. Moreover, $\| y \( t \) - y \( t_0 \) \| lt.eq T m$. Consequently
  $ m & =
    lr(|1 / T integral_0^T #scale(x: 120%, y: 120%)[\(] v \( y \( t_0 \) \) - v \( y \( t \) \)
    #scale(x: 120%, y: 120%)[\)] thin d t|)\
 & lt.eq L / T integral_0^T \| y \( t_0 \) - y \( t \) \| thin d t lt.eq L T m . $
  For $T < min { delta \, L^(- 1) }$ this forces $m = 0$. ◻
]

We use the convention $omega \( X_f \, dot.op \) = d f$ for Hamiltonian vector fields.
  A fixed point of a diffeomorphism $Phi$ is nondegenerate if $d Phi - I$ is invertible there.

#thm([Proposition 3.2.])[
  #emph[Let $\( P \, omega \)$ be a closed symplectic manifold and let $g$ be a Hamiltonian diffeomorphism with
    $g^2 = upright("id")$. Its fixed locus is a finite disjoint union of closed symplectic submanifolds,
$ "Fix" \( g \) = F_1 union.sq dots.h.c union.sq F_r . $

 For each $j$, prescribe a smooth Morse function $h_j : F_j arrow.r bb(R)$.
   There is a smooth $g$-invariant function $f : P arrow.r bb(R)$ restricting to $h_j$ on $F_j$ such that,
   for every sufficiently small $epsilon.alt > 0$,
$ "Fix" \( psi^epsilon.alt compose g \) = union.sq.big_(j = 1)^r "Crit" \( h_j \) \, $

 where $psi^s$ is the Hamiltonian flow of $f$. Every fixed point in this list is nondegenerate.
   The map $psi^epsilon.alt compose g$ is the time-one map of a smooth one-periodic Hamiltonian.
   If $P$ is simply connected, all fixed-point loops for that Hamiltonian are contractible.]
] <inv:perturb>

#proof[
  Average a Riemannian metric over the involution. At a fixed point $x$,
    the exponential map for this metric intertwines $g$ with $d_x g$.
    Thus the fixed locus is a smooth closed submanifold whose tangent space at $x$ is
  $ E_x^(+) = ker \( d_x g - I \) . $
  The local description and compactness give finitely many connected components.
    Since $\( d_x g \)^2 = I$, there is a direct-sum decomposition
  $ T_x P = E_x^(+) xor E_x^(-) \, wide E_x^(-) = ker \( d_x g + I \) . $
  For $u in E_x^(+)$ and $v in E_x^(-)$, symplectic invariance gives $omega_x \( u \, v \) =
    omega_x \( d_x g \( u \) \, d_x g \( v \) \) = - omega_x \( u \, v \)$.
    The summands are therefore symplectically orthogonal, and the restriction of $omega_x$ to each is
    nondegenerate. In particular, each $F_j$ is symplectic and $E_x^(-)$ is its symplectic normal space.
  Extend the $h_j$ simultaneously to a smooth function $tilde(f)$ on $P$,
    using disjoint tubular neighborhoods of the components and cutoff functions. Set
  $ f = 1 / 2 \( tilde(f) + tilde(f) compose g \) . $
  Then $f compose g = f$ and $f \|_(F_j) = h_j$. Because $g$ is symplectic, invariance implies $g_(*) X_f = X_f$,
    so $g$ commutes with $psi^s$. At $x in F_j$, invariance also gives $d_x f \( v \) = 0$ for $v in E_x^(-)$.
    It follows that $X_f \( x \) in T_x F_j$ and that $X_f \|_(F_j)$ is the Hamiltonian vector field of $h_j$ for
    $omega \|_(F_j)$. In particular,
  #[#set math.equation(numbering: n => "(3.1)")
   $ x in F_j \, quad X_f \( x \) = 0 quad arrow.l.r.double quad d_x h_j = 0 . $ <inv:equilibria>]
  Write $Phi_epsilon.alt = psi^epsilon.alt compose g$. Commutation gives
  $ Phi_epsilon.alt^2 = psi^(2 epsilon.alt) . $
  Choose $2 epsilon.alt < tau$, where $tau$ is supplied by Lemma 6 for $X_f$.
    If $Phi_epsilon.alt \( x \) = x$, then $psi^(2 epsilon.alt) \( x \) = x$, so $X_f \( x \) = 0$.
    Thus $psi^epsilon.alt \( x \) = x$, and the original fixed-point equation implies $g \( x \) = x$.
    Equation (3.1) identifies $x$ as a critical point of one of the $h_j$.
    Conversely, every such critical point is fixed by both $g$ and $psi^epsilon.alt$.
    This proves the asserted equality of fixed sets.
  We next check nondegeneracy in the entire tangent space. At one of these equilibria let $A_x$ be the
    linearization of $X_f$. Then $d_x psi^epsilon.alt = exp \( epsilon.alt A_x \)$.
    Equivariance implies that $A_x$ preserves $E_x^(+)$ and $E_x^(-)$;
    denote its restrictions by $A_x^(+)$ and $A_x^(-)$. On $E_x^(+) = T_x F_j$, the defining identity for $X_f$ gives
  $ omega_x \( A_x^(+) u \, v \) = "Hess"_x \( h_j \) \( u \, v \) . $
  Thus $A_x^(+)$ is invertible. The limits
  $ frac(exp \( epsilon.alt A_x^(+) \) - I, epsilon.alt) arrow.r A_x^(+) \, wide - exp \( epsilon.alt A_x^(-) \) -
    I arrow.r - 2 I $
  show that both blocks of $d_x Phi_epsilon.alt - I$ are invertible for all sufficiently small positive
    $epsilon.alt$. A single choice of $epsilon.alt$ works at the finite set of critical points.
  Finally, let $K_s$, $0 lt.eq s lt.eq 1$, be a smooth Hamiltonian whose time-one map is $g$.
    Choose nonnegative smooth functions $a \, b$, each of integral one,
    supported in successive disjoint subintervals of $\( 0 \, 1 \)$, and put
  $ A \( t \) = integral_0^t a \( u \) thin d u \, wide H_epsilon.alt \( t \, x \) =
    a \( t \) K_(A \( t \)) \( x \) + epsilon.alt b \( t \) f \( x \) . $
  The first interval traverses the Hamiltonian path of $K_s$, and the second traverses $psi^s$ from $s =
    0$ to $s = epsilon.alt$. Hence the time-one map is $psi^epsilon.alt compose g$.
    Since $H_epsilon.alt$ vanishes near $t = 0$ and $t = 1$, its periodic extension is smooth.
    On a simply connected $P$, every loop traced by a fixed point along this path is contractible. ◻
]

The surface below supplies four fixed components and an exceptional sphere on which the first Chern class
  evaluates to one. It is the surface of #cite(label("OpenAI2026Stable")) Proposition 4.3.

#thm([Proposition 3.3.])[
  #emph[Let $Y$ be the complex blow-up of $bb(C P)^1 times bb(C P)^1$ at ${ 0 \, oo } times { 0 \, oo }$.
    There is a Kähler form $omega_Y$ for which the lifted diagonal circle action is Hamiltonian.
    Its half-turn $g_Y$ fixes exactly the four exceptional curves $E_1 \, dots.h \, E_4$,
    each isomorphic to $bb(C P)^1$. Along each curve its derivative is the identity tangentially and minus the
    identity on the symplectic normal bundle. The surface is simply connected, with
$ H_i \( Y \; bb(Z) \) tilde.equiv
  cases(delim: "{", bb(Z) \, & i = 0 \, 4 \,, bb(Z)^6 \, & i = 2 \,, 0 \, & upright("otherwise") \,) wide
  chevron.l c_1 \( T Y \) \, \[ E_j \] chevron.r = 1 . $

]
] <inv:surface>

#proof[
  The blow-up is a smooth projective surface and therefore admits a Kähler form.
    On affine coordinates the diagonal action is
  $ t dot.op \( z \, w \) = \( e^(2 pi i t) z \, e^(2 pi i t) w \) \, wide t in bb(R) \/ bb(Z) . $
  It preserves the four centers and lifts holomorphically to $Y$.
    Averaging a Kähler form over this action gives an invariant Kähler form $omega_Y$.
  Removing four points from the simply connected real four-manifold $bb(C P)^1 times
    bb(C P)^1$ preserves simple connectivity: paths and their contracting disks can be moved off the points by
    general position. Every loop in $Y$ can similarly be moved off the exceptional curves,
    which have real codimension two. The complement is identified by blow-down with the punctured original
    surface, so the loop contracts. Hence $Y$ is simply connected.
    If $V$ is the infinitesimal generator of the lifted circle action, Cartan’s formula yields
  $ d #scale(x: 120%, y: 120%)[\(] omega_Y \( V \, dot.op \) #scale(x: 120%, y: 120%)[\)] = cal(L)_V omega_Y = 0 . $
  Since $H^1 \( Y \; bb(R) \) = 0$, there is a smooth $k : Y arrow.r bb(R)$ with $d k =
    omega_Y \( V \, dot.op \)$. The circle action is therefore Hamiltonian,
    and the autonomous Hamiltonian $k \/ 2$ generates its half-turn at time one.
  Downstairs, the half-turn fixes exactly the four centers.
    At any center the circle weights are $\( alpha \, beta \)$ with $alpha \, beta in { 1 \, - 1 }$,
    so the half-turn is $\( z_1 \, z_2 \) mapsto \( - z_1 \, - z_2 \)$.
    The local blow-up consists of pairs $\( ell \, v \)$ with $ell subset bb(C)^2$ a complex line and $v in ell$.
    The lifted half-turn is
  $ \( ell \, v \) mapsto \( ell \, - v \) . $
  It fixes exactly the exceptional zero section, acts identically on its tangent bundle, and acts by $-
    1$ on its normal line. Equivariant blow-down excludes any further fixed points.
    The symplectic normal description follows from the eigenspace calculation in Proposition 7.
  Each point blow-up replaces a four-ball by a disk bundle over $bb(C P)^1$ with common boundary $S^3$.
    Mayer–Vietoris therefore adds one free generator to $H_2$ and leaves $H_1$ unchanged.
    Together with simple connectivity and integral Poincaré duality,
    this gives the displayed homology groups from the ranks $\( 1 \, 2 \, 1 \)$ of $bb(C P)^1 times bb(C P)^1$.
    Finally, the normal bundle of an exceptional curve is $cal(O)_(bb(C P)^1) \( - 1 \)$.
    The tangent-normal exact sequence gives
  $ chevron.l c_1 \( T Y \) \, \[ E_j \] chevron.r = deg \( T bb(C P)^1 \) + deg cal(O)_(bb(C P)^1) \( - 1 \) =
    2 - 1 = 1 . $
  ◻
]

#thm([Corollary 3.4.])[
  #emph[Let $\( X \, omega_X \)$ be a simply connected closed Kähler manifold.
    Set $M = X times Y$, with the product form, and $C = X times bb(C P)^1$.
    For every smooth Morse function $h : C arrow.r bb(R)$, there is a smooth one-periodic Hamiltonian $H$ on $M$
    whose fixed points are all nondegenerate and satisfy
$ \# "Fix" \( phi.alt_H^1 \) = \# "Fix"_0 \( phi.alt_H^1 \; H \) = 4 thin \# "Crit" \( h \) . $

 Moreover, $M$ is simply connected and Kähler, and its minimal Chern number is one.]
] <inv:realization>

#proof[
  The Hamiltonian involution $g = upright("id")_X times g_Y$ has precisely the four fixed components $X times
    E_j$, each diffeomorphic to $C$. Transport $h$ to these components and apply Proposition 7.
    The product $M$ is simply connected, so all fixed-point loops are contractible.
    On the sphere ${ x } times E_j$, the $X$-directions form a trivial bundle and Proposition 8 gives
  $ chevron.l c_1 \( T M \) \, \[ { x } times E_j \] chevron.r = 1 . $
  Thus $c_1 \( T M \) \( pi_2 \( M \) \) = bb(Z)$. ◻
]

== 4 Projective surfaces and integral blow-ups <sec:geometry>

We need two projective surfaces whose integral homology distinguishes the primes $2$ and $3$.
  Their products with projective spaces will serve as blow-up centers.
  The integral blow-up formula will then place their torsion in a simply connected Kähler manifold without
  introducing any extension ambiguity.

=== 4.1 The two surfaces <the-two-surfaces>

Let

$ E = bb(C) \/ \( bb(Z) + i bb(Z) \) \, wide zeta_p = exp \( 2 pi i \/ p \) \, wide Lambda_2 = bb(Z) + i bb(Z) \,
  wide Lambda_3 = bb(Z) + zeta_3 bb(Z) \, $

and put $E_p = bb(C) \/ Lambda_p$ for $p = 2 \, 3$. The automorphism

$ sigma_p : E times E_p arrow.r E times E_p \, wide \( z \, w \) mapsto \( z + 1 \/ p \, zeta_p w \) $

has order $p$. Every nonidentity power acts freely, because its translation on the first factor is nontrivial.
  Thus the quotient

$ S_p = \( E times E_p \) \/ chevron.l sigma_p chevron.r $

is a smooth compact connected complex surface. These are bielliptic surfaces;
  see #cite(label("Blomme2025")) Section 2 for their place in the classification.
  The explicit embeddings and computations below are those of #cite(label("OpenAI2026Stable")) Lemma 3.1.

#thm([Lemma 4.1.])[
  #emph[The surfaces $S_2$ and $S_3$ admit holomorphic embeddings into $bb(C P)^44$ and $bb(C P)^164$,
    respectively. If $T_2 = \( bb(Z) \/ 2 \)^2$ and $T_3 = bb(Z) \/ 3$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ H_i \( S_p \; bb(Z) \) tilde.equiv
   cases(delim: "{", bb(Z) \, & i = 0 \, 4 \,, bb(Z)^2 xor T_p \, & i = 1 \, 2 \,, bb(Z)^2 \, & i = 3 \,, 0 \, &
   upright("otherwise") .) $ <geo:surface-homology>]

 In particular, $b \( S_p \) = 8$.]
] <geo:surfaces>

#proof[
  We first give an embedding with an explicit ambient dimension.
    A degree-three line bundle on an elliptic curve has a three-dimensional space of sections.
    Riemann–Roch gives dimension two or one after subtracting an effective divisor of degree one or two.
    Its complete linear system consequently has no base points and separates points and tangent vectors.
    It embeds the curve into $bb(C P)^2$. Applying this to both factors and taking the Segre embedding yields
  $ iota_p : E times E_p arrow.r.hook bb(C P)^8 . $
  Regard a nonzero vector in $bb(C)^9$ as a linear polynomial on its dual. Multiplying representatives of the $p$ points
  $ iota_p \( x \) \, med iota_p \( sigma_p x \) \, med dots.h \, iota_p \( sigma_p^(p - 1) x \) $
  defines a projective degree-$p$ polynomial. This construction is holomorphic and independent of the
    representatives. It is unchanged by $sigma_p$, so it descends to a holomorphic map
  $ F_p : S_p arrow.r bb(P) \( "Sym"^p bb(C)^9 \) . $
  Unique factorization recovers the unordered orbit from its product of linear factors; hence $F_p$ is injective.
  To check immersion, choose local nonzero representatives $L_j$ of the orbit points.
    If a tangent vector has zero image under the projective differential of $F_p$, its derivatives satisfy
  $ sum_(j = 0)^(p - 1) dot(L)_j product_(k eq.not j) L_k = a product_(k = 0)^(p - 1) L_k $
  for a scalar $a$. Freeness makes the $L_j$ pairwise nonproportional.
    Restricting this identity to ${ L_j = 0 }$ gives $dot(L)_j = 0$ there:
    the other factors have nonzero product in the polynomial ring of that hyperplane, which is an integral domain.
    Thus each $dot(L)_j$ is proportional to $L_j$. Since $iota_p$ is immersive and the quotient map is a local
    biholomorphism, the original tangent vector vanishes. Compactness now makes $F_p$ a holomorphic embedding.
    The dimensions
  $ dim "Sym"^2 bb(C)^9 = 45 \, wide dim "Sym"^3 bb(C)^9 = 165 $
  give the stated projective spaces.
  For the integral homology, use the universal covering $bb(C)^2 arrow.r S_p$. Its deck group is generated by
  $ a \( z \, w \) & = \( z + 1 \/ p \, zeta_p w \) \, & d \( z \, w \) & = \( z + i \, w \) \,\
t_lambda \( z \, w \) & = \( z \, w + lambda \) \, &  & lambda in Lambda_p . $
  Indeed, $a^p$ is translation by $1$ in the first coordinate,
    and these generators therefore include the full lattice of $E times E_p$ and a lift of $sigma_p$.
    The commuting transformations $a \, d$ generate $bb(Z)^2$, act on $Lambda_p$ by $zeta_p$ and the identity,
    and have trivial intersection with its translation subgroup. Consequently
  $ pi_1 \( S_p \) & tilde.equiv Lambda_p times.r bb(Z)^2 \,\
H_1 \( S_p \; bb(Z) \) & tilde.equiv bb(Z)^2 xor Lambda_p \/ \( zeta_p - 1 \) Lambda_p . $
  The lattice endomorphism $zeta_p - 1$ is $- 2 I$ for $p = 2$.
    For $p = 3$, its matrix in the basis $\( 1 \, zeta_3 \)$ is
  $ mat(delim: "(", - 1, - 1; 1, - 2) \, $
  whose Smith normal form is $"diag" \( 1 \, 3 \)$. This proves the asserted description of $H_1$.
  The complex orientation gives integral Poincaré duality. In particular,
    $H_3 \( S_p \; bb(Z) \) tilde.equiv H^1 \( S_p \; bb(Z) \) tilde.equiv bb(Z)^2$,
    while the universal coefficient theorem gives
  $ "Tor" H_2 \( S_p \; bb(Z) \) tilde.equiv "Tor" H^2 \( S_p \; bb(Z) \) tilde.equiv "Tor" H_1 \( S_p \; bb(Z) \)
    tilde.equiv T_p . $
  Finally, the degree-$p$ covering by $E times E_p$ implies $p chi \( S_p \) = chi \( E times E_p \) = 0$.
    The ranks already computed force $"rank" H_2 \( S_p \; bb(Z) \) = 2$, completing (4.1). ◻
]

=== 4.2 The integral blow-up formula <the-integral-blow-up-formula>

The following standard formula is integral, not merely rational; see #cite(label("DuanLi2009")) Theorem 4.1.
  We include the splitting argument to make explicit why the torsion in Lemma 10 survives.

#thm([Proposition 4.2.])[
  #emph[Let $A$ be a closed connected Kähler manifold and let $Z subset
    A$ be a closed connected complex submanifold of complex codimension $c gt.eq 2$.
    The complex blow-up $pi : hat(A) arrow.r A$ is a closed connected Kähler manifold,
    and it is simply connected if $A$ is. For every integer $i$,
#[#set math.equation(numbering: n => "(4.2)")
 $ H_i \( hat(A) \; bb(Z) \) tilde.equiv H_i \( A \; bb(Z) \) xor xor.big_(j = 1)^(c - 1)
   H_(i - 2 j) \( Z \; bb(Z) \) . $ <geo:blowup-homology>]

]
] <geo:blowup>

#proof[
  Write $nu$ for the complex normal bundle of $Z$ in $A$. The local blow-up model replaces $v in
    bb(C)^c$ by pairs $\( ell \, v \)$ with $v in ell$. It gives a smooth complex manifold,
    a proper map $pi$ that is an isomorphism off $Z$, and an exceptional divisor
  $ E = bb(P) \( nu \) \, wide rho : E arrow.r Z . $
  The normal line bundle of $E$ is $cal(O)_E \( - 1 \)$. Properness and the local model give compactness and
    connectedness.
  Choose a Kähler form $omega_A$ and a Hermitian metric on $nu$.
    The induced metric on $cal(O)_E \( 1 \)$ has curvature positive along the projective fibers.
    Since $cal(O) \( - E \) \|_E tilde.equiv cal(O)_E \( 1 \)$,
    extend this metric to $cal(O) \( - E \)$ and let $eta$ be its real Chern curvature form.
    Such an extension is obtained by extending the logarithm of the ratio with any ambient metric.
    Curvature commutes with restriction to the complex submanifold $E$, so $eta$ retains fiberwise positivity.
    The form $pi^(*) omega_A$ is semipositive, with kernel along $E$ equal to the tangent space of the fiber of
    $rho$, and is positive off $E$. On these kernel directions $eta$ is positive.
    Compactness of the unit tangent bundle therefore implies that
  $ pi^(*) omega_A + epsilon eta $
  is positive for all sufficiently small $epsilon > 0$: near the kernel directions $eta$ is positive,
    and on their complement $pi^(*) omega_A$ has a positive lower bound whereas $eta$ is bounded.
    This closed real $\( 1 \, 1 \)$-form is Kähler.
  If $A$ is simply connected, then so is $A \\ Z$. Indeed, general position allows a contracting disk for any loop
    in that complement to avoid $Z$, whose real codimension is at least four.
    A loop in $hat(A)$ can similarly be perturbed off the real codimension-two divisor $E$.
    It then contracts in $hat(A) \\ E tilde.equiv A \\ Z$.
  For the remaining assertion, all cohomology groups have coefficients in $bb(Z)$.
    Let $iota : E arrow.r.hook hat(A)$ and $h = c_1 \( cal(O)_E \( 1 \) \)$. The integral Leray–Hirsch theorem gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ H^k \( E \) = xor.big_(j = 0)^(c - 1) h^j rho^(*) H^(k - 2 j) \( Z \) . $ <geo:projective-bundle>]
  This uses the integral fiber basis $1 \, h \, dots.h \, h^(c - 1)$ and does not require torsion-free cohomology
    of $Z$. The integral Gysin push-forward $iota_(*) : H^k \( E \) arrow.r
    H^(k + 2) \( hat(A) \)$ satisfies $iota^(*) iota_(*) \( v \) = - h v$,
    because the normal bundle of $E$ is $cal(O)_E \( - 1 \)$. Thus the classes
  $ s_j \( u \) = - iota_(*) \( h^(j - 1) rho^(*) u \) \, wide u in H^(k - 2 j) \( Z \) \, quad 1 lt.eq j lt.eq
    c - 1 \, $
  restrict to $h^j rho^(*) u$ on $E$.
  We first show that a class $v in H^k \( hat(A) \)$ whose restriction to $E$ is $rho^(*) z$ lies in $pi^(*)
    H^k \( A \)$. Collapsing the exceptional divisor and the center gives a homeomorphism $hat(A) \/ E tilde.equiv
    A \/ Z$, so $pi$ induces an isomorphism $H^(*) \( A \, Z \) tilde.equiv H^(*) \( hat(A) \, E \)$.
    In the long exact sequences of these pairs, the connecting image of $rho^(*) z = iota^(*) v$ is zero.
    Naturality and this relative isomorphism show that the connecting image of $z$ is zero as well.
    Hence $z$ is the restriction of some $u in H^k \( A \)$. The class $v - pi^(*) u$ vanishes on $E$,
    so it comes from relative cohomology; the same relative isomorphism expresses it as the pullback of a class on
    $A$. This proves the claim.
  Given an arbitrary $v$, subtracting suitable $s_j \( u_j \)$ removes the positive powers of $h$ in (4.3).
    The claim then proves surjectivity of
  #[#set math.equation(numbering: n => "(4.4)")
   $ pi^(*) + sum_(j = 1)^(c - 1) s_j : H^k \( A \) xor xor.big_(j = 1)^(c - 1) H^(k - 2 j) \( Z \) arrow.r
     H^k \( hat(A) \) . $ <geo:blowup-cohomology-map>]
  For injectivity, restriction to $E$ first forces every positive-power coefficient $u_j$ to vanish by (4.3).
    Moreover, $pi^(*)$ is injective over $bb(Z)$. The map $pi$ has degree one, so cap-product naturality gives,
    for $alpha in H^k \( A \; bb(Z) \)$,
  $ pi_(*) #scale(x: 120%, y: 120%)[\(] pi^(*) alpha frown \[ hat(A) \] #scale(x: 120%, y: 120%)[\)] =
    alpha frown pi_(*) \[ hat(A) \] = alpha frown \[ A \] . $
  Integral Poincaré duality is an isomorphism on all classes, including torsion, so $pi^(*) alpha =
    0$ implies $alpha = 0$. Thus (4.4) is an isomorphism.
  If $dim_(bb(C)) A = m$, apply integral Poincaré duality in degree $2 m - i$.
    The center summands become $H_(i - 2 c + 2 j) \( Z \; bb(Z) \)$; replacing $j$ by $c - j$ gives (4.2). ◻
]

== 5 Balancing the torsion profiles <sec:construction>

We now construct $X$ so that the four fixed components of the involution on $X times
  Y$ have exactly the Morse count needed in Theorem 1. The construction is explicit,
  and all homology in this section has integral coefficients.

=== 5.1 Seven disjoint centers <seven-disjoint-centers>

Set

$ N = 1664 \, wide L = N - 3 = 1661 . $

The centers are chosen so that, in each of the degree lists $1 + 2 j$ and $2 + 2 j$,
  the difference between the $2$- and $3$-primary torsion multiplicities is $- 1$ for $1 lt.eq j lt.eq L$,
  except for $+ 1$ at $j = 2 \, L - 1$. Each positive entry is canceled by either adjacent negative entry under
  convolution with $\( 1 \, 1 \)$, whereas the middle weight $6$ in $\( 1 \, 6 \, 1 \)$ leaves a positive excess.
  We first realize this pattern and then compute the two counts.

Inside $bb(C P)^N$, choose the following centers, with $S_2 \, S_3$ as in Lemma 10:

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Center
], table.cell(rowspan: 1, colspan: 1)[Number
], table.cell(rowspan: 1, colspan: 1)[Vector dimension
], table.cell(rowspan: 1, colspan: 1)[Codimension
], table.cell(rowspan: 1, colspan: 1)[Total Betti rank
]),
  table.cell(rowspan: 1, colspan: 1)[$S_2 times bb(C P)^1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$90$
], table.cell(rowspan: 1, colspan: 1)[$N - 3$
], table.cell(rowspan: 1, colspan: 1)[$16$
],
  table.cell(rowspan: 1, colspan: 1)[$S_3$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$165$
], table.cell(rowspan: 1, colspan: 1)[$N - 2$
], table.cell(rowspan: 1, colspan: 1)[$8$
],
  table.cell(rowspan: 1, colspan: 1)[$S_3 times bb(C P)^2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$495$
], table.cell(rowspan: 1, colspan: 1)[$N - 4$
], table.cell(rowspan: 1, colspan: 1)[$24$
],
)
]

Here the vector dimension is one more than the dimension of the receiving projective space.
  The embeddings of Lemma 10, followed by the Segre embeddings in the product cases, give these dimensions. Since

$ 2 dot.op 90 + 3 dot.op 165 + 2 dot.op 495 = 1665 = N + 1 \, $

we can place the seven centers in the projectivizations of distinct summands of a direct-sum decomposition of
  $bb(C)^(N + 1)$. These projective linear subspaces, and hence the centers, are pairwise disjoint.

Let $X$ be the successive complex blow-up along the seven centers.
  The centers not yet blown up have unchanged neighborhoods because they are disjoint.
  Their complex codimensions are at least two, so Proposition 11 shows that $X$ is simply connected, closed,
  and Kähler. Its complex dimension is $N$. For a center $S_p times bb(C P)^r$, the extra summands in $H_i \( X \)$ are

#[#set math.equation(numbering: n => "(5.1)")
 $ xor.big_(k = 1)^(L - r) H_(i - 2 k) \( S_p times bb(C P)^r \) . $ <eq:center-shifts>]

Summing their free ranks gives

#[#set math.equation(numbering: n => "(5.2)")
 $ b \( X \) & = \( N + 1 \) + 2 dot.op 16 \( L - 1 \) + 3 dot.op 8 L + 2 dot.op 24 \( L - 2 \)\
 & = 174281 . $ <eq:rank-X-new>]

=== 5.2 The two prime multiplicities <the-two-prime-multiplicities>

The torsion of $S_p$ occurs in degrees $1$ and $2$, with the same group in each degree.
  Accordingly, list the torsion degrees of $X$ as $1 + 2 j$ and $2 + 2 j$, with $j in bb(Z)$;
  all multiplicities are zero outside their stated ranges. For $r = 0 \, 1 \, 2$ define

#[#set math.equation(numbering: n => "(5.3)")
 $ f_r \( j \) = \# { \( k \, l \) in bb(Z)^2 : 1 lt.eq k lt.eq L - r \, med 0 lt.eq l lt.eq r \, med k + l =
   j } . $ <eq:f-r>]

Künneth has no additional torsion terms here, since $H_(*) \( bb(C P)^r \; bb(Z) \)$ is free.
  Formula (5.1) therefore gives, in either degree list,

#[#set math.equation(numbering: n => "(5.4)")
 $ "Tor" H_(1 + 2 j) \( X \) tilde.equiv "Tor" H_(2 + 2 j) \( X \) tilde.equiv \( bb(Z) \/ 2 \)^(a_j)
   xor \( bb(Z) \/ 3 \)^(q_j) \, wide a_j = 4 f_1 \( j \) \, quad q_j = 3 f_0 \( j \) +
   2 f_2 \( j \) . $ <eq:new-profiles>]

The factor $4$ counts two centers, each contributing two copies of $bb(Z) \/ 2$.
  Both sequences are supported on $1 lt.eq j lt.eq L$. Their values are

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Indices
], table.cell(rowspan: 1, colspan: 1)[$1 \, L$
], table.cell(rowspan: 1, colspan: 1)[$2 \, L - 1$
], table.cell(rowspan: 1, colspan: 1)[$3 \, dots.h \, L - 2$
]),
  table.cell(rowspan: 1, colspan: 1)[$f_0 \( j \)$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[$f_1 \( j \)$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
],
  table.cell(rowspan: 1, colspan: 1)[$f_2 \( j \)$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3$
],
  table.cell(rowspan: 1, colspan: 1)[$a_j$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$8$
],
  table.cell(rowspan: 1, colspan: 1)[$q_j$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$9$
],
  table.cell(rowspan: 1, colspan: 1)[$delta_j = a_j - q_j$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
],
)
]

Thus $delta$ is $- 1$ throughout its support except at $2 \, L - 1$, where it is $1$.
  Writing $A = sum_j a_j$ and $Q = sum_j q_j$, we obtain

#[#set math.equation(numbering: n => "(5.5)")
 $ A = 8 \( L - 1 \) = 13280 \, wide Q = 3 L + 6 \( L - 2 \) = 14937 \, wide A - Q = 4 - L < 0 . $ <eq:totals>]

=== 5.3 Products and the exact gap <products-and-the-exact-gap>

Choose any Kähler form $omega_X$ on $X$. With the surface and form of Proposition 8, set

$ \( M \, omega \) = \( X times Y \, omega_X xor omega_Y \) \, wide C = X times bb(C P)^1 . $

Both manifolds are simply connected, closed, and Kähler. Their real dimensions are $3332$ and $3330$,
  respectively. The involution $g = "id"_X times g_Y$ is Hamiltonian and has four fixed components diffeomorphic to $C$.

For a finitely supported sequence $v = \( v_j \)_(j in bb(Z))$ and a finite sequence
  $e = \( e_0 \, dots.h \, e_s \)$, write

$ \( e * v \)_j = sum_(t = 0)^s e_t v_(j - t) . $

The homology of the factors $bb(C P)^1$ and $Y$ is free and concentrated in even degrees.
  Künneth shows that the $2$- and $3$-primary torsion multiplicities in either degree list of $C$ and $M$ are $e *
  a$ and $e * q$, respectively, with

#[#set math.equation(numbering: n => "(5.6)")
 $ e_C = \( 1 \, 1 \) \, wide e_M = \( 1 \, 6 \, 1 \) . $ <eq:kernels>]

The free ranks are $b \( C \) = 2 b \( X \)$ and $b \( M \) = 8 b \( X \)$.

For nonnegative integers $v \, w$ one has

#[#set math.equation(numbering: n => "(5.7)")
 $ d #scale(x: 120%, y: 120%)[\(] \( bb(Z) \/ 2 \)^v xor \( bb(Z) \/ 3 \)^w #scale(x: 120%, y: 120%)[\)] =
   max \( v \, w \) . $ <eq:prime-generators>]

Reduction modulo $2$ and modulo $3$ gives the lower bound;
  pairing $min \( v \, w \)$ factors by the Chinese remainder theorem gives the upper bound.
  After summing all degrees of either parity in $M$, the prime multiplicities are $8 A$ and $8 Q$. Since $Q > A$,

#[#set math.equation(numbering: n => "(5.8)")
 $ beta_(bb(Z))^(upright("cyc")) \( M \) = 8 b \( X \) + 32 Q . $ <eq:beta-value>]

The degreewise calculation is different. For $C$,

$ \( e_C * delta \)_j = delta_j + delta_(j - 1) lt.eq 0 quad \( j in bb(Z) \) \, $

because each positive entry of $delta$ has a negative entry on either side.
  This also checks the boundary indices, where $delta$ is zero outside $\[ 1 \, L \]$.
  Thus the $3$-primary multiplicity attains the maximum in (5.7) in every degree of $C$.
  Its sum in each parity is $2 Q$, and hence

#[#set math.equation(numbering: n => "(5.9)")
 $ lambda \( C \) = 2 b \( X \) + 8 Q \, wide 4 lambda \( C \) =
   beta_(bb(Z))^(upright("cyc")) \( M \) . $ <eq:fixedcomponent-count>]

For $M$, the positive entries of $e_M * delta$ occur exactly at $j = 3 \, L$, and each has value $4$. Indeed,

$ \( e_M * delta \)_3 = delta_3 + 6 delta_2 + delta_1 = - 1 + 6 - 1 = 4 . $

Reflection gives the same positive value at $L$. At every other index with $delta_(j - 1) = - 1$,
  the three terms sum to at most $1 - 6 + 1 = - 4$. If $delta_(j - 1) = 0$,
  only nonpositive boundary entries can remain. This proves that there are no other positive entries.
  Figure 1 displays the local calculation at the left endpoint.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.305, 0), (3.477, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((0, -2.185), [#text(size: 7pt)[0]], anchor: "north", padding: 0.1176cm)
  content((0.61, -2.185), [#text(size: 7pt)[1]], anchor: "north", padding: 0.1176cm)
  content((1.22, -2.185), [#text(size: 7pt)[2]], anchor: "north", padding: 0.1176cm)
  content((1.83, -2.185), [#text(size: 7pt)[3]], anchor: "north", padding: 0.1176cm)
  content((2.44, -2.185), [#text(size: 7pt)[4]], anchor: "north", padding: 0.1176cm)
  content((3.05, -2.185), [#text(size: 7pt)[5]], anchor: "north", padding: 0.1176cm)
  content((1.525, 1.564), [$delta_j$])
  line((5.295, 0), (9.077, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((5.6, -2.185), [#text(size: 7pt)[0]], anchor: "north", padding: 0.1176cm)
  content((6.21, -2.185), [#text(size: 7pt)[1]], anchor: "north", padding: 0.1176cm)
  content((6.82, -2.185), [#text(size: 7pt)[2]], anchor: "north", padding: 0.1176cm)
  content((7.43, -2.185), [#text(size: 7pt)[3]], anchor: "north", padding: 0.1176cm)
  content((8.04, -2.185), [#text(size: 7pt)[4]], anchor: "north", padding: 0.1176cm)
  content((8.65, -2.185), [#text(size: 7pt)[5]], anchor: "north", padding: 0.1176cm)
  content((7.125, 1.564), [$(e_C* delta )_j$])
  line((10.89, 0), (14.68, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((11.2, -2.185), [#text(size: 7pt)[0]], anchor: "north", padding: 0.1176cm)
  content((11.81, -2.185), [#text(size: 7pt)[1]], anchor: "north", padding: 0.1176cm)
  content((12.42, -2.185), [#text(size: 7pt)[2]], anchor: "north", padding: 0.1176cm)
  content((13.03, -2.185), [#text(size: 7pt)[3]], anchor: "north", padding: 0.1176cm)
  content((13.64, -2.185), [#text(size: 7pt)[4]], anchor: "north", padding: 0.1176cm)
  content((14.25, -2.185), [#text(size: 7pt)[5]], anchor: "north", padding: 0.1176cm)
  content((12.72, 1.564), [$(e_M* delta )_j$])
  line((0, 0), (0, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((0.61, 0), (0.61, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((0.61, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((1.22, 0), (1.22, 0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((1.22, 0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((1.83, 0), (1.83, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((1.83, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((2.44, 0), (2.44, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((2.44, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((3.05, 0), (3.05, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((3.05, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((1.22, 0.299), [#text(size: 7pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((0.61, -0.299), [#text(size: 7pt)[$-1$]], anchor: "north", padding: 0.1176cm)
  line((5.6, 0), (5.6, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((5.6, 0), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((6.21, 0), (6.21, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((6.21, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((6.82, 0), (6.82, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((6.82, 0), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((7.43, 0), (7.43, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((7.43, 0), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((8.04, 0), (8.04, -0.46), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((8.04, -0.46), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((8.65, 0), (8.65, -0.46), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((8.65, -0.46), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((6.82, 0.069), [#text(size: 7pt)[$0$]], anchor: "south", padding: 0.1176cm)
  content((8.04, -0.529), [#text(size: 7pt)[$-2$]], anchor: "north", padding: 0.1176cm)
  line((11.2, 0), (11.2, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((11.2, 0), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((11.81, 0), (11.81, -0.23), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((11.81, -0.23), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((12.42, 0), (12.42, -1.15), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((12.42, -1.15), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((13.03, 0), (13.03, 0.92), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((13.03, 0.92), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((13.64, 0), (13.64, -1.38), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((13.64, -1.38), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((14.25, 0), (14.25, -1.84), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((14.25, -1.84), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((13.03, 0.92), [#text(size: 9pt)[$4$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The torsion difference near the left endpoint. Convolution with $\( 1 \, 1 \)$ removes its positive entry, whereas convolution with $\( 1 \, 6 \, 1 \)$ produces an excess of $4$ at index $3$. The right endpoint has the reflected pattern. Horizontal coordinates are the list indices $j$, not homological degrees; all panels use the same vertical scale. ],
) <fig:profiles>

Using $x_(+) = max \( x \, 0 \)$, the degreewise generator sum in each parity of $M$ is therefore

$ sum_j max { \( e_M * a \)_j \, \( e_M * q \)_j } = 8 Q + sum_j \( \( e_M * delta \)_j \)_(+) = 8 Q + 8 . $

There are two parity lists and a factor of two in $lambda$, giving

#[#set math.equation(numbering: n => "(5.10)")
 $ lambda \( M \) = 8 b \( X \) + 32 Q + 32 = beta_(bb(Z))^(upright("cyc")) \( M \) + 32 . $ <eq:exact-gap>]

=== 5.4 Completion of the construction <completion-of-the-construction>

#proof[
  Apply Theorem 5 to $M$ and $C$, whose simple connectivity and dimensions were verified above.
    It gives $"SM" \( M \) = lambda \( M \)$ and an ordinary Morse function $h : C arrow.r
    bb(R)$ with precisely $lambda \( C \)$ critical points. Corollary 9 gives a smooth one-periodic Hamiltonian on
    $M$ with exactly $4 lambda \( C \)$ fixed points, all nondegenerate and with contractible fixed-point loops.
    It also gives $c_1 \( T M \) \( pi_2 \( M \) \) = bb(Z)$.
  In the explicit formula of Proposition 7, the first-stage Hamiltonian can be taken autonomous:
    it is the pullback of $k \/ 2$, where $k$ generates the period-one circle action on $Y$.
  Finally, (5.2), (5.5), (5.9), and (5.10) give
  $ lambda \( C \) = 468058 \, wide beta_(bb(Z))^(upright("cyc")) \( M \) = 1872232 \, wide "SM" \( M \) = 1872264 . $
  Since $dim_(bb(C)) X = 1664$ and $dim_(bb(C)) Y = 2$, the dimension is also as asserted. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
