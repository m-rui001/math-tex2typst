#set page(paper: "us-letter", margin: (x: 1in, y: 1in), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Hamiltonian Fixed Points Below the Stable Morse Number]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Arnold fixed-point problem compares periodic orbits of Hamiltonian systems with critical points of smooth functions. We consider the proposed lower bound given by the stable Morse number, with stabilization understood geometrically.

#prodef([Definition 1.1.])[
  Let $W$ be a connected closed smooth manifold. Its #emph[stable Morse number] $"SM" \( W \)$ is the minimum of $\# "Crit" \( F \)$ over all integers $k gt.eq 0$ and smooth Morse functions
  $ F : W times bb(R)^k arrow.r bb(R) $
  such that, when $k > 0$, there are a nondegenerate quadratic form $Q$ on $bb(R)^k$ and $R > 0$ with $F \( x \, z \) = Q \( z \)$ for every $x in W$ and $\| z \| gt.eq R$. The signature of $Q$ is unrestricted. For $k = 0$, there is no condition at infinity. The ordinary Morse number $"Morse" \( W \)$ is the same minimum restricted to $k = 0$.
]

These functions have finitely many critical points, and $"SM" \( W \) lt.eq "Morse" \( W \)$. The definition is a minimum over actual smooth functions; an algebraic complex of small rank alone does not provide an upper bound.

Let $\( M \, omega \)$ be a connected closed symplectic manifold, and let $H in C^oo \( \( bb(R) \/ bb(Z) \) times M \, bb(R) \)$. We use the convention $omega \( X_(H_t) \, dot.op \) = d H_t$ and denote its flow by $phi.alt_H^t$. A fixed point $x$ of $phi.alt_H^1$ is #emph[nondegenerate] if $1$ is not an eigenvalue of $d_x phi.alt_H^1$. Write

$ "Fix"_0 \( phi.alt_H^1 \; H \) = { x in "Fix" \( phi.alt_H^1 \) : t mapsto phi.alt_H^t \( x \) upright(" is contractible in ") M } . $

This counts distinct initial points, with no multiplicity from choices of capping disks. The stable Morse version of the fixed-point bound asks whether

#[#set math.equation(numbering: n => "(1.1)")
 $ \# "Fix"_0 \( phi.alt_H^1 \; H \) gt.eq "SM" \( M \) $ <eq:proposed-bound>]

holds whenever every fixed point is nondegenerate. The following theorem disproves this unrestricted assertion.

#thm([Theorem 1.2.])[
  #emph[There exist a simply connected closed Kähler manifold $\( M \, omega \)$ and a smooth one-periodic Hamiltonian $H$ such that every fixed point of $phi.alt_H^1$ is nondegenerate and 
$ \# "Fix"_0 \( phi.alt_H^1 \; H \) = \# "Fix" \( phi.alt_H^1 \) = "SM" \( M \) - 16 . $

 One may take $dim_(bb(R)) M = 1412$, with $"SM" \( M \) = 318968$ and $\# "Fix" \( phi.alt_H^1 \) = 318952$.]
] <thm:main>

=== Context and prior work <context-and-prior-work>

Arnold’s fixed-point questions ask how much of the critical-point theory of a small autonomous Hamiltonian persists for a general Hamiltonian path [2]. Conley and Zehnder established the torus case by variational methods [6]. Floer’s use of pseudoholomorphic curves turned the problem into a comparison between a Hamiltonian chain complex and the topology of the ambient manifold [10]. Hofer–Salamon and Ono extended the theory in the weakly monotone setting [13,18]; virtual-moduli methods subsequently yielded the general rational homological bound through work of Fukaya–Ono, Liu–Tian, and Ruan [11,14,21]. The general rational bound counts Betti numbers. The Morse and stable Morse formulations ask for a geometric critical-point minimum, which can be larger.

The stable formulation is recorded explicitly in [12] Conjecture 1.2. Its distinction from the ordinary Morse formulation is essential: Damian exhibited closed manifolds with different ordinary and stable Morse numbers [7]. In the positive direction, Dimitroglou Rizell and Golovko proved the stable Morse lower bound for generic Hamiltonians when both the symplectic area class and the first Chern class vanish on $pi_2 \( M \)$ [8] Corollary 1.4. Their argument controls the simple homotopy type of the Floer complex. An independent proof was obtained by Pöder Balkeståhl [20] Corollary 1.2. The almost-quadratic convention for stable Morse functions used by Dimitroglou Rizell and Golovko agrees with ours by Lemma 3. Theorem 2 disproves the unrestricted stable formulation, including its version that counts all fixed points.

Recent integral refinements explain why torsion alone does not force the bound in (1.1). Abouzaid and Blumberg proved homological lower bounds over fields of arbitrary positive characteristic [1]. Bai and Xu obtained an integral bound incorporating torsion at all primes [3] Theorem A, and their subsequent foundations give the same bound in [4] Corollary 1.2. Its homology is graded modulo twice the minimal Chern number, so classes in different integer degrees may enter the same group. The geometric stable Morse number retains the integer degrees. For our examples the two bounds differ: Remark 15 computes the cyclically graded integral bound and shows that our fixed-point count exceeds it.

A separate construction gives nondegenerate Hamiltonian counterexamples to the ordinary Morse bound in real dimension twelve, with arbitrarily large deficit [19] Theorem 1.1 and Corollary 1.2. Those examples use a nontrivial fundamental group and the distinction between ordinary and stable Morse theory. In the construction below, the ambient manifold and the four fixed components of an auxiliary involution are simply connected, and Smale’s theorem identifies both Morse numbers with the minimum allowed by integral homology [23] Theorem 2.4. The separation instead comes from distributing torsion at two primes across different integer degrees and realizing the smaller Morse counts on the fixed components of an involution. The proof below is independent of that companion construction.

=== The construction and its mechanism <the-construction-and-its-mechanism>

For a closed manifold $W$, let $b \( W \)$ be its total integral homology rank, and let $t_i \( W \)$ be the minimum number of generators of $"Tor" H_i \( W \; bb(Z) \)$. The quantity

$ lambda \( W \) = b \( W \) + 2 sum_i t_i \( W \) $

is a lower bound for $"SM" \( W \)$. For simply connected manifolds of the dimensions used here, Smale’s theorem gives an ordinary Morse function attaining this bound. We prove the geometric lower bound in Section 2 and recall a handle proof of attainment in Appendix 7.

The dynamical ingredient is a Kähler surface $Y$, obtained by blowing up the four points ${ 0 \, oo } times { 0 \, oo }$ of $bb(C P)^1 times bb(C P)^1$. A half-turn of the diagonal circle action lifts to a Hamiltonian involution whose fixed set consists of four exceptional projective lines. For the high-dimensional simply connected Kähler manifold $X$ constructed below, the product involution $g$ on $M = X times Y$ has four fixed components, each diffeomorphic to $C = X times bb(C P)^1$. Smale’s theorem supplies a Morse function on $C$ with $lambda \( C \)$ critical points.

Extend copies of this function to a $g$-invariant Hamiltonian on $M$, and let $psi^s$ denote its flow. The flow commutes with $g$, so $\( psi^epsilon.alt compose g \)^2 = psi^(2 epsilon.alt)$. For small $epsilon.alt$, the absence of short nonconstant periodic trajectories on the compact manifold $M$ forces every fixed point of $psi^epsilon.alt compose g$ to be an equilibrium on a fixed component of $g$. Section 4 proves that these are precisely the $4 lambda \( C \)$ chosen critical points and that they are all nondegenerate.

It remains to arrange $4 lambda \( C \) < lambda \( M \)$. Section 3 constructs $X$ by blowing up projective space along two disjoint centers with $2$-primary and $3$-primary torsion. The relevant elementary fact is

$ d #scale(x: 120%, y: 120%)[\(] \( bb(Z) \/ 2 \)^a xor \( bb(Z) \/ 3 \)^q #scale(x: 120%, y: 120%)[\)] = max \( a \, q \) \, $

where $d$ denotes the minimum number of generators. Multiplication by $bb(C P)^1$ and by $Y$ combines the torsion groups in nearby degrees with different multiplicities. When the two primes are combined into cyclic summands, these products permit different savings in the number of generators. Section 5 shows that only the ends of the degree range contribute to the resulting difference

$ lambda \( X times Y \) - 4 lambda \( X times bb(C P)^1 \) = 16 . $

The final assembly appears in Section 6. This use of mixed-prime torsion, together with the explicit involution, is the mechanism that puts the Hamiltonian count below the geometric stable Morse number. The proof does not require Floer theory.

== 2 Integral homology and geometric Morse counts <sec:morse>

We first establish the topological comparison used in the construction. Integral homology gives a lower bound for every Morse function that is exactly quadratic outside a compact set. On the simply connected manifolds of high dimension used below, this bound is attained by an ordinary Morse function. Both statements concern actual smooth functions.

For a closed smooth manifold $W$, write

$ r_i \( W \) = "rank" H_i \( W \; bb(Z) \) \, #h(2em) t_i \( W \) = upright("the minimum number of generators of ") "Tor" H_i \( W \; bb(Z) \) \, $

and define

#[#set math.equation(numbering: n => "(2.1)")
 $ b \( W \) = sum_i r_i \( W \) \, #h(2em) lambda \( W \) = b \( W \) + 2 sum_i t_i \( W \) . $ <eq:lambda-definition>]

All homological degrees in this section are integers. We take $r_i \( W \)$ and $t_i \( W \)$ to be zero outside the homological range of $W$.

Another convention allows a uniformly bounded differential perturbation of a quadratic form at infinity. It gives the same geometric minimum.

#thm([Lemma 2.1.])[
  #emph[Fix a Riemannian metric on a closed smooth manifold $W$ and the Euclidean metric on $bb(R)^k$, where $k > 0$. Suppose $Q$ is a nondegenerate quadratic form on $bb(R)^k$ and $F : W times bb(R)^k arrow.r bb(R)$ is a smooth function with nondegenerate critical points such that 
$ sup_(W times bb(R)^k) parallel d F - d Q parallel < oo $

 in the product metric. Then there is a smooth function $tilde(F)$ equal to $F$ near all its critical points, with no additional critical points, and equal to $Q$ outside a compact set. Consequently allowing these bounded differential perturbations in the definition of the stable Morse number does not change its value.]
] <lem:infinity-conventions>

#proof[
  Write $h = F - Q$ and choose $K$ with $parallel d h parallel lt.eq K$. Compactness of $W$ and integration along radial segments give
  $ \| h \( x \, z \) \| lt.eq K_0 + K \| z \| \, #h(2em) K_0 = max_(x in W) \| h \( x \, 0 \) \| . $
  Nondegeneracy of $Q$ gives a constant $c > 0$ with $parallel d Q \( z \) parallel gt.eq c \| z \|$, so $F$ has no critical point for $\| z \| > K \/ c$. Choose a smooth cutoff $chi_R$ equal to one for $\| z \| lt.eq R$ and zero for $\| z \| gt.eq 2 R$, with $0 lt.eq chi_R lt.eq 1$ and $parallel d chi_R parallel lt.eq C \/ R$, where $C$ is independent of $R$. For $R gt.eq 1$, the differential of $chi_R h$ on the intervening annulus has norm at most
  $ K + C \( K_0 + 2 K \) . $
  This bound is independent of $R$, whereas $parallel d Q parallel gt.eq c R$ there. For sufficiently large $R$, the function $tilde(F) = Q + chi_R h$ therefore has no critical point in the annulus. It agrees with $F$ on a ball containing all the critical points and with $Q$ outside the larger ball. Conversely, equality with $Q$ outside a compact set implies the displayed boundedness condition. These two constructions preserve the number of critical points; for $k = 0$ both conventions allow the same ordinary Morse functions. ◻
]

#thm([Proposition 2.2.])[
  #emph[For every connected closed smooth manifold $W$, 
$ "SM" \( W \) gt.eq lambda \( W \) . $

]
] <prop:stable-lower>

#proof[
  Let $F : W times bb(R)^k arrow.r bb(R)$ be an admissible function in the definition of $"SM" \( W \)$. We construct a finite free integral chain complex with one generator for each critical point of $F$ and with homology equal to that of $W$, shifted by a fixed integer. When $k = 0$, the ordinary Morse complex has these properties. Suppose $k > 0$.
  After a linear change of the auxiliary coordinates, the quadratic form is
  $ Q \( u \, v \) = - \| u \|^2 + \| v \|^2 \, #h(2em) \( u \, v \) in bb(R)^d times bb(R)^(k - d) . $
  The equality $F = Q$ still holds outside a sufficiently large Euclidean ball. Choose a radius $R_0$ such that this equality holds for $\| \( u \, v \) \| gt.eq R_0$ and all critical points lie in $W times B_(R_0)$. Choose $A > 0$ satisfying
  $ A > max_(W times overline(B)_(R_0)) { \| F \| \, \| Q \| } \, $
  and then choose $T > R_0$ with $T^2 > A$. At the two levels $- A$ and $A$, the sublevel sets of $F$ and $Q$ agree, including inside the core $W times overline(B)_(R_0)$: at $- A$ the core is excluded, and at $A$ it is included. Thus, with
  $ K = W times overline(B)_T \, #h(2em) K_(-) = K ∩ { F lt.eq - A } \, #h(2em) K_(+) = K ∩ { F lt.eq A } \, $
  we have $K_plus.minus = K ∩ { Q lt.eq plus.minus A }$.
  This truncation introduces no boundary critical point in the level band $\[ - A \, A \]$. Indeed, on the side boundary $W times partial B_T$ the function is $Q$, and its restricted differential can vanish only when $u = 0$ or $v = 0$. Its possible critical values there are therefore $T^2$ and $- T^2$. In the band, a gradient-like vector field can consequently be chosen tangent to the side boundary. The usual Morse attachment argument on this compact manifold with corners gives $K_(+)$ the relative homotopy type, over $K_(-)$, of a space obtained by attaching one cell of the appropriate Morse index for each critical point of $F$; see [16] Section 3 for the attachment theorem. The tangent field gives the same deformation argument at the side boundary as in the interior. If necessary, separate the critical values by a small perturbation supported near the critical points. The endpoint sublevels are compact manifolds with corners, or empty, and have finite CW type. Taking a finite CW model for $K_(-)$ and using cellular approximation for the attachments yields a finite free relative cellular complex $C_(*)$ with
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_i "rank" C_i = \# "Crit" \( F \) \, #h(2em) H_(*) \( C_(*) \) tilde.equiv H_(*) \( K_(+) \, K_(-) \; bb(Z) \) . $ <eq:critical-chain-rank>]
  The endpoint pair has a simple geometric description. The homotopy $\( u \, v \) mapsto \( u \, \( 1 - s \) v \)$, $0 lt.eq s lt.eq 1$, decreases both $Q$ and the Euclidean norm. It therefore preserves both members of the pair and deformation retracts $\( K_(+) \, K_(-) \)$ onto
  $ W times #scale(x: 120%, y: 120%)[\(] D_T^d \, { u in D_T^d : \| u \| gt.eq sqrt(A) } #scale(x: 120%, y: 120%)[\)] . $
  For $d = 0$ the second factor is the pair $\( { 0 } \, diameter \)$. The relative integral homology of the displayed disk–annulus pair is $bb(Z)$ in degree $d$ and zero otherwise. The relative Künneth formula therefore gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ H_i \( C_(*) \) tilde.equiv H_(i - d) \( W \; bb(Z) \) . $ <eq:quadratic-pair-homology>]
  This also covers positive or negative definite quadratic forms.
  It remains to count the ranks in $C_(*)$. For any finite free integral chain complex, put $Z_i = ker partial_i$ and $B_i = "im" partial_(i + 1)$. Since subgroups of free abelian groups are free,
  #[#set math.equation(numbering: n => "(2.4)")
   $ "rank" C_i = "rank" H_i \( C_(*) \) + "rank" B_i + "rank" B_(i - 1) . $ <eq:chain-rank>]
  Smith normal form for $B_i subset Z_i$ shows that $"rank" B_i$ is at least the minimum number of generators of $"Tor" H_i \( C_(*) \)$. Summing (2.4) and applying (2.2)–(2.3) gives $\# "Crit" \( F \) gt.eq lambda \( W \)$. Taking the minimum over admissible $F$ proves the proposition. ◻
]

For the upper bound we use the following form of Smale’s Morse theorem. We state the dimension range for which the handle proof in Appendix 7 is given.

#thm([Theorem 2.3.])[
  (Smale).  #emph[Let $W$ be a simply connected closed smooth manifold of dimension $D gt.eq 9$. There is an ordinary Morse function on $W$ with 
$ r_i \( W \) + t_i \( W \) + t_(i - 1) \( W \) $

 critical points of index $i$ for every $i$. In particular, 
#[#set math.equation(numbering: n => "(2.5)")
 $ "SM" \( W \) = "Morse" \( W \) = lambda \( W \) . $ <eq:simply-connected-morse>]

]
] <thm:smale>

#proof[
  The existence statement is the torsion-inclusive form of Smale’s theorem; see [23] Theorem 2.4 and the following paragraph. Appendix 7 supplies a handle proof in the stated range, including the cancellation of excess handles in degrees $2$ and $3$. Summing the prescribed index counts gives an ordinary Morse function with $lambda \( W \)$ critical points. Proposition 4 and the inclusion of ordinary Morse functions among the admissible functions then give
  $ lambda \( W \) lt.eq "SM" \( W \) lt.eq "Morse" \( W \) lt.eq lambda \( W \) . $
  ◻
]

#prodef([Remark 2.4.])[
  The number $t_i \( W \)$ counts cyclic invariant factors, so it can combine torsion at different primes. For example, for distinct primes $p \, q$, the minimum number of generators of $\( bb(Z) \/ p \)^a xor \( bb(Z) \/ q \)^b$ is $max \( a \, b \)$. Reduction modulo $p$ and modulo $q$ gives the lower bound; pairing $min \( a \, b \)$ summands by the Chinese remainder theorem gives the upper bound. This dependence on the degreewise distribution of primes is the feature of $lambda$ used below.
] <rem:torsion-generators>

== 3 A simply connected Kähler manifold with two torsion primes <sec:geometry>

Fix an integer $N gt.eq 704$. We construct a simply connected compact Kähler manifold $X$ of complex dimension $N$ whose integral homology has prescribed $2$-primary and $3$-primary torsion. The construction has two steps. First, quotients of products of elliptic curves provide surfaces with the required torsion groups. Blowing up projective space along these surfaces, with two projective-line factors added to one center, then places that torsion in the required degrees.

=== 3.1 Two quotient surfaces <two-quotient-surfaces>

Write

$ E = bb(C) \/ \( bb(Z) + i bb(Z) \) \, #h(2em) zeta_p = exp \( 2 pi i \/ p \) \, #h(2em) Lambda_2 = bb(Z) + i bb(Z) \, #h(2em) Lambda_3 = bb(Z) + zeta_3 bb(Z) . $

For $p in { 2 \, 3 }$, let $E_p = bb(C) \/ Lambda_p$ and define

$ sigma_p : E times E_p arrow.r E times E_p \, #h(2em) sigma_p \( z \, w \) = \( z + 1 \/ p \, zeta_p w \) . $

Multiplication by $zeta_p$ preserves $Lambda_p$, so this map is well-defined and holomorphic. It has order $p$, and its nonidentity powers have no fixed points: translation by $k \/ p$ on $E$ is nontrivial for $0 < k < p$. Thus

$ S_p = \( E times E_p \) \/ chevron.l sigma_p chevron.r $

is a smooth compact connected complex surface. These are classical bielliptic surfaces; see [22,5] for their quotient descriptions and integral topology. We give the specific computations needed here.

#thm([Lemma 3.1.])[
  #emph[The surfaces $S_2$ and $S_3$ admit holomorphic embeddings into $bb(C P)^44$ and $bb(C P)^164$, respectively. Set 
$ T_2 = \( bb(Z) \/ 2 \)^2 \, #h(2em) T_3 = bb(Z) \/ 3 . $

 Their integral homology is 
#[#set math.equation(numbering: n => "(3.1)")
 $ H_i \( S_p \; bb(Z) \) tilde.equiv cases(delim: "{", bb(Z) \, & i = 0 \, 4 \,, bb(Z)^2 xor T_p \, & i = 1 \, 2 \,, bb(Z)^2 \, & i = 3 \,, 0 \, & upright("otherwise") .) $ <eq:surface-homology>]

 In particular, $b \( S_p \) = 8$.]
] <lem:torsion-surfaces>

#proof[
  We first construct the projective embeddings. On an elliptic curve, a line bundle of degree three has three independent sections. Riemann–Roch shows that imposing one or two zeros, with multiplicities allowed, lowers this dimension by one or two. Its complete linear system is therefore base-point-free and separates points and tangent directions, giving an embedding in $bb(C P)^2$. Applying this to both curves and then using the Segre embedding gives a holomorphic embedding
  $ iota_p : E times E_p arrow.r bb(C P)^8 . $
  View a point of $bb(C P)^8$ as the projective class of a nonzero linear polynomial on $\( bb(C)^9 \)^(*)$. To the orbit of $x in E times E_p$ associate the degree-$p$ polynomial obtained by multiplying representatives of the points $iota_p \( x \) \, iota_p \( sigma_p x \) \, dots.h \, iota_p \( sigma_p^(p - 1) x \)$. Changing representatives changes the product by a nonzero scalar. Multiplication of linear polynomials is a holomorphic map
  $ \( bb(C P)^8 \)^p arrow.r bb(P) #scale(x: 120%, y: 120%)[\(] "Sym"^p bb(C)^9 #scale(x: 120%, y: 120%)[\)] \, $
  and the product is invariant under cyclically permuting its factors. Consequently it defines a holomorphic map from $S_p$ to the projective space on the right. Unique factorization of polynomials shows that this map separates orbits.
  It is also immersive. Indeed, choose local representatives $L_0 \, dots.h \, L_(p - 1)$ of the orbit points and suppose that a tangent vector makes their product stationary as a projective point. Its derivatives then satisfy
  $ sum_(j = 0)^(p - 1) dot(L)_j product_(k eq.not j) L_k = a product_(k = 0)^(p - 1) L_k $
  for some scalar $a$. The orbit points are distinct, so the linear polynomials $L_j$ are pairwise nonproportional. Restricting the identity to the hyperplane $L_j = 0$ shows that $dot(L)_j$ vanishes on that hyperplane: the product of the remaining factors is a nonzero polynomial there. Hence $dot(L)_j$ is a scalar multiple of $L_j$. Every projective orbit point is stationary, and the immersion $iota_p$ forces the original tangent vector to vanish. The quotient map is a local biholomorphism, so the induced map on $S_p$ is immersive. A compact injective holomorphic immersion is an embedding. Finally,
  $ dim "Sym"^2 bb(C)^9 = 45 \, #h(2em) dim "Sym"^3 bb(C)^9 = 165 \, $
  which gives the stated ambient dimensions.
  For the homology computation, the universal covering $bb(C)^2 arrow.r S_p$ has deck group generated by
  $ a \( z \, w \) = \( z + 1 \/ p \, zeta_p w \) \, #h(2em) d \( z \, w \) = \( z + i \, w \) \, #h(2em) t_lambda \( z \, w \) = \( z \, w + lambda \) quad \( lambda in Lambda_p \) . $
  Here $a^p$ is translation by $1$ in the first coordinate. The elements $a \, d$ commute and generate a copy of $bb(Z)^2$; conjugation by $a$ on $Lambda_p$ is multiplication by $zeta_p$, while conjugation by $d$ is trivial. Thus the deck group is $Lambda_p times.r bb(Z)^2$, and abelianization gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ H_1 \( S_p \; bb(Z) \) tilde.equiv bb(Z)^2 xor Lambda_p \/ \( zeta_p - 1 \) Lambda_p . $ <eq:surface-abelianization>]
  For $p = 2$, multiplication by $zeta_p - 1$ is $- 2 I$ on the lattice. For $p = 3$, its matrix in the basis $\( 1 \, zeta_3 \)$ is
  $ mat(delim: "(", - 1, - 1; 1, - 2) . $
  The latter has determinant $3$ and an entry equal to $1$, so its Smith normal form has diagonal $\( 1 \, 3 \)$. These computations identify the torsion groups in (3.2) as $T_p$.
  The complex orientation makes $S_p$ an oriented closed real four-manifold. Integral Poincaré duality and the universal coefficient theorem give
  $ "Tor" H_2 \( S_p \; bb(Z) \) tilde.equiv "Tor" H^2 \( S_p \; bb(Z) \) tilde.equiv "Tor" H_1 \( S_p \; bb(Z) \) = T_p \, $
  whereas $H_3 \( S_p \; bb(Z) \) tilde.equiv H^1 \( S_p \; bb(Z) \)$ is free of rank two. The degree-$p$ covering $E times E_p arrow.r S_p$ gives $p chi \( S_p \) = chi \( E times E_p \) = 0$. Since the ranks in degrees $0 \, 1 \, 3 \, 4$ are $1 \, 2 \, 2 \, 1$, respectively, the rank in degree two is also two. This proves (3.1). ◻
]

=== 3.2 Integral homology under blow-up <integral-homology-under-blow-up>

We next recall the blow-up formula with integral coefficients. The coefficient ring matters here: the centers just constructed have torsion, and we need that torsion to survive as direct summands. The following standard formula is recorded, in this integral generality, in [9] Theorem 4.1; we include its proof.

#thm([Proposition 3.2.])[
  #emph[Let $A$ be a compact connected Kähler manifold, and let $Z subset A$ be a closed connected complex submanifold of complex codimension $c gt.eq 2$. Its complex blow-up $pi : hat(A) arrow.r A$ is compact, connected, and Kähler. If $A$ is simply connected, then so is $hat(A)$. For every integer $i$ there is an isomorphism of abelian groups 
#[#set math.equation(numbering: n => "(3.3)")
 $ H_i \( hat(A) \; bb(Z) \) tilde.equiv H_i \( A \; bb(Z) \) xor xor.big_(j = 1)^(c - 1) H_(i - 2 j) \( Z \; bb(Z) \) . $ <eq:blowup-homology>]

]
] <prop:blowup>

#proof[
  Let $nu$ denote the complex normal bundle of $Z$ in $A$. In local coordinates transverse to $Z$, the blow-up replaces a vector in $bb(C)^c$ by a pair consisting of a line and a vector on that line. These local models give a smooth complex manifold and a proper holomorphic map $pi$, which is an isomorphism away from $Z$. The exceptional divisor is $E = bb(P) \( nu \)$, with projection $rho : E arrow.r Z$, and its normal line bundle in $hat(A)$ is the tautological bundle $cal(O)_E \( - 1 \)$. The model also shows that $hat(A)$ is connected; properness over compact $A$ gives compactness.
  To obtain a Kähler form, let $omega_A$ be one on $A$. Choose a Hermitian metric on $nu$ and its induced metric on $cal(O)_E \( 1 \)$, whose curvature is positive on each projective fiber. Since $cal(O) \( - E \) \|_E tilde.equiv cal(O)_E \( 1 \)$, this metric extends to a Hermitian metric on $cal(O) \( - E \)$. Let $eta$ be its real Chern curvature form. The form $pi^(*) omega_A$ is semipositive; along $E$ its kernel is precisely the tangent space to the projective fiber, and it is positive away from $E$. On those kernel directions $eta$ is positive. Compactness of the unit tangent bundle now shows that
  $ pi^(*) omega_A + epsilon eta $
  is positive for every sufficiently small $epsilon > 0$. More explicitly, $eta$ is positive in a neighborhood of the kernel directions, while on the complement $pi^(*) omega_A$ has a positive lower bound and $eta$ is bounded. The displayed form is closed and of type $\( 1 \, 1 \)$, hence Kähler.
  Suppose that $A$ is simply connected. Since $Z$ has real codimension at least four, general position allows paths and contracting disks to avoid $Z$; consequently $A \\ Z$ is simply connected. Every loop in $hat(A)$ can be perturbed off the real codimension two submanifold $E$. It then lies in $hat(A) \\ E tilde.equiv A \\ Z$ and contracts there. This proves simple connectivity of $hat(A)$.
  It remains to establish the integral homology formula. We first work in cohomology, always with coefficients in $bb(Z)$. Write $iota : E arrow.r.hook hat(A)$ for the inclusion and put $h = c_1 \( cal(O)_E \( 1 \) \)$. By Leray–Hirsch, the map
  $ xor.big_(j = 0)^(c - 1) H^(k - 2 j) \( Z \; bb(Z) \) arrow.r H^k \( E \; bb(Z) \) \, #h(2em) \( u_0 \, dots.h \, u_(c - 1) \) mapsto sum_(j = 0)^(c - 1) h^j rho^(*) u_j $
  is an isomorphism. It uses an integral basis on every fiber and requires no restriction on torsion in $H^(*) \( Z \; bb(Z) \)$.
  The Gysin map for the oriented normal line of $E$ satisfies
  $ iota^(*) iota_(*) \( v \) = c_1 \( cal(O)_E \( - 1 \) \) v = - h v . $
  For $1 lt.eq j lt.eq c - 1$ define
  $ s_j : H^(k - 2 j) \( Z \; bb(Z) \) arrow.r H^k \( hat(A) \; bb(Z) \) \, #h(2em) s_j \( u \) = - iota_(*) #scale(x: 120%, y: 120%)[\(] h^(j - 1) rho^(*) u #scale(x: 120%, y: 120%)[\)] . $
  Then $iota^(*) s_j \( u \) = h^j rho^(*) u$, so these maps lift all the positive powers of $h$ in the preceding decomposition.
  We claim that every class $v in H^k \( hat(A) \; bb(Z) \)$ with $iota^(*) v in rho^(*) H^k \( Z \; bb(Z) \)$ lies in the image of $pi^(*)$. The map of pairs
  $ \( hat(A) \, E \) arrow.r \( A \, Z \) $
  induces an isomorphism on relative cohomology: after collapsing the subspaces, it induces a homeomorphism $hat(A) \/ E tilde.equiv A \/ Z$. Write $iota^(*) v = rho^(*) z$. Naturality of the connecting homomorphisms of the two pairs implies that the connecting image of $z$ vanishes, because its pullback is the connecting image of $iota^(*) v$, which is zero. Hence $z$ extends to a class $u in H^k \( A \; bb(Z) \)$. The difference $v - pi^(*) u$ restricts to zero on $E$ and therefore comes from $H^k \( hat(A) \, E \; bb(Z) \)$. Pulling that relative class back from $H^k \( A \, Z \; bb(Z) \)$ proves the claim.
  Subtracting suitable classes $s_j \( u_j \)$ from an arbitrary $v$ leaves a class covered by this claim. Thus
  $ pi^(*) + sum_(j = 1)^(c - 1) s_j : H^k \( A \; bb(Z) \) xor xor.big_(j = 1)^(c - 1) H^(k - 2 j) \( Z \; bb(Z) \) arrow.r H^k \( hat(A) \; bb(Z) \) $
  is surjective. It is injective as well. First, $pi^(*)$ is injective over $bb(Z)$: the map $pi$ has degree one, so the pushforward defined using integral Poincaré duality is a left inverse to $pi^(*)$. If a sum in the displayed map is zero, restriction to $E$ and Leray–Hirsch force all its $u_j$ for $j gt.eq 1$ to vanish; injectivity of $pi^(*)$ then forces the remaining class to vanish. We have proved
  #[#set math.equation(numbering: n => "(3.4)")
   $ H^k \( hat(A) \; bb(Z) \) tilde.equiv H^k \( A \; bb(Z) \) xor xor.big_(j = 1)^(c - 1) H^(k - 2 j) \( Z \; bb(Z) \) . $ <eq:blowup-cohomology>]
  If $dim_(bb(C)) A = m$, integral Poincaré duality applied to (3.4) in degree $2 m - i$ gives center summands $H_(i - 2 c + 2 j) \( Z \; bb(Z) \)$. Replacing $j$ by $c - j$ yields (3.3). ◻
]

=== 3.3 The manifold $X$ <the-manifold-x>

The blow-up formula now allows us to place both torsion primes in one simply connected manifold. The different dimensions of the two centers will give their torsion contributions different behavior near the ends of the degree range.

#thm([Proposition 3.3.])[
  #emph[For the fixed integer $N gt.eq 704$, there is a simply connected compact Kähler manifold $X$ of complex dimension $N$ obtained by blowing up $bb(C P)^N$ along disjoint copies of 
$ Z_2 = S_2 \, #h(2em) Z_3 = S_3 times bb(C P)^1 times bb(C P)^1 . $

 Set $L = N - 3$. Its only nonzero integral homology torsion groups occur in degrees $1 + 2 j$ and $2 + 2 j$, where $1 lt.eq j lt.eq L$, and are 
#[#set math.equation(numbering: n => "(3.5)")
 $ "Tor" H_(1 + 2 j) \( X \; bb(Z) \) tilde.equiv "Tor" H_(2 + 2 j) \( X \; bb(Z) \) tilde.equiv \( bb(Z) \/ 2 \)^(a_j) xor \( bb(Z) \/ 3 \)^(q_j) \, $ <eq:X-torsion>]

 where 
#[#set math.equation(numbering: n => "(3.6)")
 $ a_j = 2 \, #h(2em) q_j = cases(delim: "{", 1 \, & j = 1 \, L \,, 3 \, & j = 2 \, L - 1 \,, 4 \, & 3 lt.eq j lt.eq L - 2 .) $ <eq:torsion-profiles>]

 Moreover, 
#[#set math.equation(numbering: n => "(3.7)")
 $ b \( X \) = 41 N - 183 . $ <eq:rank-X>]

]
] <prop:torsion-space>

#proof[
  By Lemma 7, $Z_2$ embeds in $bb(C P)^44$. The embedding $S_3 arrow.r.hook bb(C P)^164$ and the Segre embedding give
  $ Z_3 arrow.r.hook bb(C P)^164 times bb(C P)^1 times bb(C P)^1 arrow.r.hook bb(C P)^659 \, $
  since $165 dot.op 2 dot.op 2 = 660$. The direct-sum decomposition $bb(C)^705 = bb(C)^45 xor bb(C)^660$ places $bb(C P)^44$ and $bb(C P)^659$ in disjoint linear subspaces of $bb(C P)^704$. Including that space linearly in $bb(C P)^N$ gives the required disjoint centers. Define $X$ by blowing up $Z_2$ and then $Z_3$; the latter center is unchanged by the first blow-up because they are disjoint. Both centers have complex codimension at least two, so Proposition 8 shows that $X$ is compact, connected, simply connected, and Kähler.
  The complex codimensions of $Z_2$ and $Z_3$ are $N - 2$ and $N - 4$, respectively. The integral blow-up formula therefore gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ H_i \( X \; bb(Z) \) tilde.equiv  & H_i \( bb(C P)^N \; bb(Z) \) xor xor.big_(r = 1)^(N - 3) H_(i - 2 r) \( S_2 \; bb(Z) \)\
 & xor xor.big_(r = 1)^(N - 5) H_(i - 2 r) \( S_3 times bb(C P)^1 times bb(C P)^1 \; bb(Z) \) . $ <eq:X-homology>]
  The first center contributes $\( bb(Z) \/ 2 \)^2$ in each of degrees $1 + 2 j$ and $2 + 2 j$, for $1 lt.eq j lt.eq L$. For the second center, the homology of $bb(C P)^1 times bb(C P)^1$ is free, with ranks $\( 1 \, 2 \, 1 \)$ in degrees $\( 0 \, 2 \, 4 \)$. Künneth therefore has no additional $"Tor"$ terms. In either of the two degree lists, its $3$-primary multiplicity is
  $ q_j = sum_(r = 1)^(L - 2) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(j = r) + 2 upright(bold(1))_(j = r + 1) + upright(bold(1))_(j = r + 2) #scale(x: 120%, y: 120%)[\)] \, $
  where $upright(bold(1))$ denotes the indicator of the stated equality. At the endpoints this gives $q_1 = q_L = 1$, next to them it gives $q_2 = q_(L - 1) = 3$, and at every remaining index it gives $q_j = 4$. There is no torsion outside these lists by (3.1) and (3.8). Thus the profiles are
  $ \( a_1 \, dots.h \, a_L \) = \( 2 \, dots.h \, 2 \) \, #h(2em) \( q_1 \, dots.h \, q_L \) = \( 1 \, 3 \, 4 \, dots.h \, 4 \, 3 \, 1 \) . $
  The projective-line factors in the second center produce the multiplicities $\( 1 \, 2 \, 1 \)$: the resulting $3$-primary multiplicity is smaller than the $2$-primary multiplicity at the two endpoints and larger at every interior index. This reversal is what the product comparison in Section 5 will exploit. Finally, $b \( S_2 \) = b \( S_3 \) = 8$ and $b \( S_3 times bb(C P)^1 times bb(C P)^1 \) = 32$. Summing ranks in (3.8) yields
  $ b \( X \) = \( N + 1 \) + 8 \( N - 3 \) + 32 \( N - 5 \) = 41 N - 183 . $
  ◻
]

== 4 Perturbing a Hamiltonian involution <sec:involution>

We construct Hamiltonian maps whose fixed points are prescribed by Morse functions on the fixed components of an involution. The involution used in our example acts on a Kähler surface and fixes four projective lines. Its product with the identity on another manifold will therefore replace one Morse problem on the product by four Morse problems on smaller manifolds.

We use the basic Hamiltonian constructions recalled in [15]. Throughout this section the Hamiltonian vector field of a function $f$ on a symplectic manifold $\( P \, omega \)$ is defined by

$ omega \( X_f \, thin dot.op thin \) = d f . $

We first record the elementary period estimate that makes the perturbation count exact. This is a short-period estimate of the same kind as Yorke’s Lipschitz bound [24]; the weaker estimate below suffices.

#thm([Lemma 4.1.])[
  #emph[Let $V$ be a smooth vector field on a closed smooth manifold $P$, and let $psi^s$ denote its flow. There is a number $tau > 0$ such that, for every $0 < T < tau$, 
$ psi^T \( x \) = x quad arrow.r.double quad V \( x \) = 0 . $

]
] <lem:short-period>

#proof[
  Choose finitely many coordinate balls with compact closures inside their charts, together with smaller balls whose closures lie in the corresponding coordinate balls and whose union covers $P$. Bounds on the coordinate speeds give a time $delta > 0$ such that a trajectory starting in any smaller ball stays in its larger ball for time $delta$. In these finitely many balls choose a common positive Lipschitz bound $L$ for the coordinate representatives of $V$.
  Suppose a trajectory of period $T < delta$ starts in one of the smaller balls. Write its coordinate representation as $y : \[ 0 \, T \] arrow.r bb(R)^d$ and the coordinate vector field as $v$. Set
  $ m = max_(0 lt.eq t lt.eq T) \| v \( y \( t \) \) \| \, $
  and choose $t_0$ at which this maximum is attained. Since $y \( T \) = y \( 0 \)$,
  $ integral_0^T v \( y \( t \) \) thin d t = 0 . $
  Moreover, $\| y \( t \) - y \( t_0 \) \| lt.eq T m$ for every $t$. It follows that
  $ m & = lr(|1 / T integral_0^T #scale(x: 120%, y: 120%)[\(] v \( y \( t_0 \) \) - v \( y \( t \) \) #scale(x: 120%, y: 120%)[\)] thin d t|)\
 & lt.eq L / T integral_0^T \| y \( t_0 \) - y \( t \) \| thin d t lt.eq L T m . $
  Taking $tau = min { delta \, 1 \/ L }$ forces $m = 0$ whenever $0 < T < tau$. ◻
]

#thm([Proposition 4.2.])[
  #emph[Let $\( P \, omega \)$ be a closed symplectic manifold, and let $g : P arrow.r P$ be a Hamiltonian diffeomorphism satisfying $g^2 = upright("id")_P$. Write 
$ "Fix" \( g \) = F_1 union.sq dots.h.c union.sq F_r $

 for its connected fixed components. For each $j$, choose a smooth Morse function $h_j : F_j arrow.r bb(R)$. There exists a $g$-invariant smooth function $f : P arrow.r bb(R)$ with $f \|_(F_j) = h_j$ such that, for all sufficiently small $epsilon.alt > 0$, the map 
$ Phi_epsilon.alt = psi^epsilon.alt compose g \, $

 where $psi^s$ is the Hamiltonian flow of $f$, satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ "Fix" \( Phi_epsilon.alt \) = union.sq.big_(j = 1)^r "Crit" \( h_j \) . $ <eq:involution-fixed-set>]

 Every fixed point of $Phi_epsilon.alt$ is nondegenerate. Moreover, $Phi_epsilon.alt$ is the time-one map of a smooth one-periodic Hamiltonian. If $P$ is simply connected, all its fixed-point loops for this Hamiltonian are contractible.]
] <prop:involution>

#proof[
  We first describe the geometry of the fixed locus and extend the component functions. We then identify every fixed point of the perturbation and check its derivative.
  Average a Riemannian metric over the group ${ upright("id")_P \, g }$. At a fixed point $x$, its exponential chart intertwines $g$ with $d_x g$. Thus the fixed locus is a smooth closed submanifold, with tangent space
  $ E_x^(+) = ker \( d_x g - I \) . $
  It has finitely many connected components by compactness and this local description. Since $g$ is symplectic, the eigenspace decomposition
  $ T_x P = E_x^(+) xor E_x^(-) \, #h(2em) E_x^(-) = ker \( d_x g + I \) \, $
  is symplectically orthogonal: for $u in E_x^(+)$ and $v in E_x^(-)$,
  $ omega_x \( u \, v \) = omega_x \( d_x g \( u \) \, d_x g \( v \) \) = - omega_x \( u \, v \) . $
  Nondegeneracy of $omega_x$ then implies that its restrictions to both summands are nondegenerate. Each $F_j$ is therefore symplectic, and $E_x^(-)$ is its symplectic normal space.
  Extend the functions $h_j$ to a smooth function $tilde(f)$ on $P$, using disjoint tubular neighborhoods of the closed components. Define
  $ f = 1 / 2 \( tilde(f) + tilde(f) compose g \) . $
  Then $f compose g = f$ and $f \|_(F_j) = h_j$. Invariance and the symplectic property of $g$ imply $g_(*) X_f = X_f$, so $g$ commutes with $psi^s$. At a point $x in F_j$, invariance also gives $d_x f \( v \) = 0$ for $v in E_x^(-)$. Consequently $X_f$ is tangent to $F_j$, and its restriction is the Hamiltonian vector field of $h_j$ for $omega \|_(F_j)$. In particular,
  #[#set math.equation(numbering: n => "(4.2)")
   $ x in F_j \, quad X_f \( x \) = 0 quad arrow.l.r.double quad d_x h_j = 0 . $ <eq:ambient-equilibria>]
  Indeed, at a critical point of $h_j$, the differential of $f$ vanishes on both summands $E_x^(+)$ and $E_x^(-)$.
  Let $tau$ be supplied by Lemma 10 for $X_f$. Commutation and $g^2 = upright("id")_P$ give
  $ Phi_epsilon.alt^2 = psi^(2 epsilon.alt) . $
  If $2 epsilon.alt < tau$ and $Phi_epsilon.alt \( x \) = x$, then $psi^(2 epsilon.alt) \( x \) = x$, so the lemma implies $X_f \( x \) = 0$. Hence $psi^epsilon.alt \( x \) = x$, and the original fixed-point equation gives $g \( x \) = x$. Equation (4.2) now shows that $x$ is one of the prescribed component critical points. Every such point is conversely fixed by both maps. This proves (4.1).
  It remains to check full nondegeneracy. At a point in this finite fixed set, let $A_x : T_x P arrow.r T_x P$ be the linearization of $X_f$. The point is an equilibrium, so
  $ d_x psi^epsilon.alt = exp \( epsilon.alt A_x \) . $
  Equivariance implies that $A_x$ commutes with $d_x g$ and preserves $E_x^(+)$ and $E_x^(-)$. Write its restrictions as $A_x^(+)$ and $A_x^(-)$. On $E_x^(+) = T_x F_j$, the map $A_x^(+)$ is the linearization of the Hamiltonian vector field of $h_j$. The nonsingular Hessian of $h_j$ and the nondegenerate form $omega \|_(F_j)$ make $A_x^(+)$ invertible. Therefore
  $ d_x Phi_epsilon.alt \|_(E_x^(+)) = exp \( epsilon.alt A_x^(+) \) $
  has no eigenvalue $1$ for all sufficiently small positive $epsilon.alt$: its eigenvalues are $e^(epsilon.alt lambda)$ with $lambda eq.not 0$. On the normal space,
  $ d_x Phi_epsilon.alt \|_(E_x^(-)) = - exp \( epsilon.alt A_x^(-) \) arrow.r - I #h(2em) upright("as ") epsilon.alt arrow.r 0 \, $
  so this block also has no eigenvalue $1$ for small $epsilon.alt$. One choice of $epsilon.alt$ works for the finite set of component critical points.
  Finally, choose a smooth Hamiltonian $K_s$, $0 lt.eq s lt.eq 1$, whose time-one map is $g$. Choose nonnegative smooth functions $a \, b$ supported in successive disjoint subintervals of $\( 0 \, 1 \)$, each with integral $1$, and put
  $ A \( t \) = integral_0^t a \( u \) thin d u \, #h(2em) H_epsilon.alt \( t \, x \) = a \( t \) K_(A \( t \)) \( x \) + epsilon.alt b \( t \) f \( x \) . $
  During the first interval, the flow traverses the path of $K_s$; during the second, it traverses $psi^s$ from $s = 0$ to $s = epsilon.alt$. Its time-one map is thus $psi^epsilon.alt compose g$. The function $H_epsilon.alt$ vanishes near $t = 0$ and $t = 1$, so its periodic extension is smooth. If $P$ is simply connected, every fixed-point loop along this specified path is contractible. ◻
]

We now construct a surface to which the proposition applies. The crucial feature is that its half-turn fixes entire exceptional curves, including those on which the full circle action is nontrivial.

#thm([Proposition 4.3.])[
  #emph[Let $Y$ be the complex blow-up of $bb(C P)^1 times bb(C P)^1$ at the four points 
$ { 0 \, oo } times { 0 \, oo } . $

 There is a circle-invariant Kähler form $omega_Y$ for which the lifted diagonal circle action is Hamiltonian. Its half-turn $g_Y$ has precisely four fixed components, the exceptional curves $E_1 \, dots.h \, E_4$, each isomorphic to $bb(C P)^1$. Along each $E_j$, the derivative of $g_Y$ is the identity on the tangent bundle and minus the identity on the symplectic normal bundle. The surface $Y$ is simply connected, and 
#[#set math.equation(numbering: n => "(4.3)")
 $ H_i \( Y \; bb(Z) \) tilde.equiv cases(delim: "{", bb(Z) \, & i = 0 \, 4 \,, bb(Z)^6 \, & i = 2 \,, 0 \, & upright("otherwise") .) $ <eq:Y-homology>]

]
] <prop:surface>

#proof[
  On the standard affine chart $bb(C)^2 subset bb(C P)^1 times bb(C P)^1$, let the circle act by
  $ t dot.op \( z \, w \) = \( e^(2 pi i t) z \, e^(2 pi i t) w \) \, #h(2em) t in bb(R) \/ bb(Z) . $
  The four centers are invariant, so the action lifts holomorphically to the blow-up. The surface $Y$ is Kähler and simply connected by Proposition 8. Averaging a Kähler form over the holomorphic circle action gives an invariant Kähler form $omega_Y$. If $V$ denotes the infinitesimal generator of the circle action, invariance gives
  $ d \( omega_Y \( V \, thin dot.op thin \) \) = cal(L)_V omega_Y = 0 . $
  Since $H^1 \( Y \; bb(R) \) = 0$, this closed one-form is $d k$ for a smooth function $k : Y arrow.r bb(R)$. Hence the circle action is Hamiltonian for our sign convention, and the autonomous Hamiltonian $k \/ 2$ has time-one map $g_Y$.
  The downstairs half-turn fixes exactly the four centers. At each center there are complex coordinates in which the circle has weights $\( alpha \, beta \)$ with $alpha \, beta in { 1 \, - 1 }$. Regardless of these signs, the half-turn is
  $ \( z_1 \, z_2 \) mapsto \( - z_1 \, - z_2 \) . $
  The local blow-up consists of pairs $\( ell \, v \)$, where $ell subset bb(C)^2$ is a complex line and $v in ell$. The lifted half-turn is
  $ \( ell \, v \) mapsto \( ell \, - v \) . $
  It fixes exactly the zero section, acts identically on its tangent, and acts by $- 1$ on its normal line. Off the exceptional curves the blow-down is an equivariant isomorphism, so no additional fixed points occur. The symplectic normal assertion follows also from the eigenspace decomposition in Proposition 11.
  The homology formula (3.3) adds one free generator in degree two for each point blown up. Since the homology of $bb(C P)^1 times bb(C P)^1$ is free with ranks $1 \, 2 \, 1$ in degrees $0 \, 2 \, 4$, respectively, it gives (4.3). ◻
]

For later use, we state explicitly the product construction. Its input is an ordinary Morse function; its critical points will become genuine Hamiltonian fixed points.

#thm([Corollary 4.4.])[
  #emph[Let $\( X \, omega_X \)$ be a connected closed simply connected Kähler manifold, let $\( Y \, omega_Y \)$ be the surface in Proposition 12, and give $M = X times Y$ the product symplectic form $omega_X xor omega_Y$. Put $C = X times bb(C P)^1$. For every smooth Morse function $h : C arrow.r bb(R)$, there is a smooth one-periodic Hamiltonian $H$ on $M$ such that every fixed point of its time-one map is nondegenerate and contractible for its Hamiltonian path, and 
$ \# "Fix" \( phi.alt_H^1 \) = \# "Fix"_0 \( phi.alt_H^1 \; H \) = 4 thin \# "Crit" \( h \) . $

]
] <cor:product-realization>

#proof[
  The Hamiltonian involution $g = upright("id")_X times g_Y$ fixes exactly the four symplectic submanifolds $X times E_j$, each diffeomorphic to $C$. Transport $h$ to each of them and apply Proposition 11. The product $M$ is simply connected, so all the fixed-point loops are contractible. More concretely, use the path generated by the pullback of $k \/ 2$ in the proof of Proposition 12. For a resulting fixed point $\( x \, y \) in X times E_j$, the circle part of the path lies in ${ x } times E_j$ and the perturbation part is stationary. The whole loop therefore contracts in that projective line. ◻
]

== 5 The difference in Morse counts <sec:counts>

The four fixed components of the involution on $X times Y$ are copies of $X times bb(C P)^1$. We now compare their combined Morse count with the stable Morse number of the ambient manifold. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ C = X times bb(C P)^1 \, #h(2em) M = X times Y . $ <eq:counts-products>]

The calculation rests on the fact that torsion at distinct primes can share a generator. For nonnegative integers $a \, q$,

#[#set math.equation(numbering: n => "(5.2)")
 $ upright("the minimum number of generators of ") \( bb(Z) \/ 2 \)^a xor \( bb(Z) \/ 3 \)^q upright(" is ") max \( a \, q \) . $ <eq:counts-generators>]

Reduction modulo $2$ and modulo $3$ gives the lower bound; pairing cyclic summands of different orders into copies of $bb(Z) \/ 6$ gives the upper bound.

#thm([Proposition 5.1.])[
  #emph[For the manifolds in (5.1), 
#[#set math.equation(numbering: n => "(5.3)")
 $ lambda \( C \) = 114 N - 518 \, #h(2em) lambda \( M \) = 456 N - 2056 . $ <eq:counts-values>]

 In particular, 
#[#set math.equation(numbering: n => "(5.4)")
 $ lambda \( M \) - 4 lambda \( C \) = 16 . $ <eq:counts-gap>]

]
] <prop:gap>

#proof[
  Recall from Section 3 that $L = N - 3$ and that, in each of the two lists of degrees $1 + 2 j$ and $2 + 2 j$, the torsion in $H_(*) \( X \; bb(Z) \)$ has multiplicities
  $ a_j = 2 \, #h(2em) \( q_1 \, dots.h \, q_L \) = \( 1 \, 3 \, 4 \, dots.h \, 4 \, 3 \, 1 \) \, #h(2em) 1 lt.eq j lt.eq L \, $
  at the primes $2$ and $3$, respectively. Extend both sequences by zero to all $j in bb(Z)$. Put $c_j = max \( a_j \, q_j \)$ and
  #[#set math.equation(numbering: n => "(5.5)")
   $ S = sum_j c_j = 2 + 3 + 4 \( L - 4 \) + 3 + 2 = 4 L - 6 = 4 N - 18 . $ <eq:counts-S>]
  The homology of $bb(C P)^1$ is free with ranks $\( 1 \, 1 \)$ in degrees $\( 0 \, 2 \)$, and that of $Y$ is free with ranks $\( 1 \, 6 \, 1 \)$ in degrees $\( 0 \, 2 \, 4 \)$. Thus the integral Künneth formula has no torsion-product terms in either product. It replaces the profiles $a \, q$ by their convolutions with
  $ e_C = \( 1 \, 1 \) \, #h(2em) e_M = \( 1 \, 6 \, 1 \) \, $
  where these sequences start at index $0$ and $\( e * a \)_j = sum_k e_k a_(j - k)$. By (5.2), the sum of torsion generator numbers in either one of the two degree lists is therefore
  $ sum_j max #scale(x: 120%, y: 120%)[\(] \( e * a \)_j \, \( e * q \)_j #scale(x: 120%, y: 120%)[\)] . $
  We compute how much this sum falls short of $sum_j \( e * c \)_j = \( sum_k e_k \) S$. Define the nonnegative sequences
  $ u_j = max \( a_j - q_j \, 0 \) \, #h(2em) v_j = max \( q_j - a_j \, 0 \) . $
  Since $c = a + v = q + u$, the loss at index $j$ is exactly
  #[#set math.equation(numbering: n => "(5.6)")
   $ \( e * c \)_j - max #scale(x: 120%, y: 120%)[\(] \( e * a \)_j \, \( e * q \)_j #scale(x: 120%, y: 120%)[\)] = min #scale(x: 120%, y: 120%)[\(] \( e * u \)_j \, \( e * v \)_j #scale(x: 120%, y: 120%)[\)] . $ <eq:counts-loss>]
  Here $u_1 = u_L = 1$ and $u_j = 0$ elsewhere, whereas $v_2 = v_(L - 1) = 1$, $v_j = 2$ for $3 lt.eq j lt.eq L - 2$, and $v_j = 0$ elsewhere. Consequently the loss can occur only near the two ends of the profiles. Table 1 gives every index at which $\( e * u \)_j$ is nonzero. The ends do not overlap, since $L gt.eq 7$.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Kernel $e$
], table.cell(rowspan: 1, colspan: 1)[Indices $j$
], table.cell(rowspan: 1, colspan: 1)[$\( e * u \)_j$
], table.cell(rowspan: 1, colspan: 1)[$\( e * v \)_j$
], table.cell(rowspan: 1, colspan: 1)[Loss
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1 \, med L + 1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$2 \, med L$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 6 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1 \, med L + 2$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$2 \, med L + 1$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$3 \, med L$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
)
]],
    caption: [Table 1: The loss in the torsion generator count under convolution. Both indices in each pair have the displayed values; every unlisted index has zero loss. ],
  )
  The total loss is $2$ for $e_C$ and $4$ for $e_M$. All degree shifts are even, so the two parity lists remain separate and give identical contributions. Hence
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_i t_i \( C \) = 2 \( 2 S - 2 \) \, #h(2em) sum_i t_i \( M \) = 2 \( 8 S - 4 \) . $ <eq:counts-total-torsion>]
  The free ranks satisfy $b \( C \) = 2 b \( X \)$ and $b \( M \) = 8 b \( X \)$. It follows that
  $ lambda \( C \) & = 2 b \( X \) + 8 S - 8 \,\
lambda \( M \) & = 8 b \( X \) + 32 S - 16 . $
  Subtracting four times the first identity from the second proves (5.4). Finally, substituting $b \( X \) = 41 N - 183$ and $S = 4 N - 18$ gives (5.3). ◻
]

It remains to realize $4 lambda \( C \)$ as a Hamiltonian fixed-point count on $M$.

== 6 Proof of the counterexample <sec:assembly>

We now combine the geometric Morse comparison, the two manifold constructions, and the perturbation of the involution.

#proof[
  Fix an integer $N gt.eq 704$ and take the simply connected Kähler manifold $X$ of Section 3. Let $Y$ be the Kähler surface of Proposition 12, and put
  $ M = X times Y \, #h(2em) C = X times bb(C P)^1 \, $
  with the product symplectic form on $M$. Both $M$ and $C$ are simply connected. Their real dimensions are $2 N + 4$ and $2 N + 2$, respectively, so Theorem 5 gives
  $ "SM" \( M \) = lambda \( M \) \, #h(2em) "Morse" \( C \) = lambda \( C \) . $
  Choose a Morse function on $C$ with exactly $lambda \( C \)$ critical points. Corollary 13, applied to the four fixed components of $"id"_X times g_Y$, provides a smooth one-periodic Hamiltonian $H$ whose time-one map has exactly these $4 lambda \( C \)$ fixed points, all nondegenerate. Every corresponding periodic orbit is contractible because $M$ is simply connected. Proposition 14 now gives
  $ \# "Fix"_0 \( phi.alt_H^1 \; H \) = 4 lambda \( C \) = lambda \( M \) - 16 = "SM" \( M \) - 16 . $
  More explicitly, the construction has
  $ "SM" \( M \) = 456 N - 2056 \, #h(2em) \# "Fix" \( phi.alt_H^1 \) = 456 N - 2072 . $
  Taking $N = 704$ gives the dimension and counts stated in the theorem. ◻
]

#prodef([Remark 6.1.])[
  (Comparison with the integral Floer bound).  The distinction between integer and cyclic gradings can be seen numerically in this family. The #emph[minimal Chern number] $nu$ is the positive generator of the subgroup $chevron.l c_1 \( T M \) \, pi_2 \( M \) chevron.r subset bb(Z)$ when that subgroup is nonzero. An exceptional line in $Y$, regarded as a sphere in $M$ with its $X$-coordinate fixed, has Chern number $2 - 1 = 1$: its tangent line has degree $2$ and its normal line has degree $- 1$. Hence $nu = 1$ for $M$.
  The integral bound of Bai–Xu [3] Theorem A, equivalently [4] Corollary 1.2, therefore uses the two groups
  $ overline(H)_(macron(i)) \( M \; bb(Z) \) = xor.big_(k equiv i med \( upright("mod") med 2 \)) H_k \( M \; bb(Z) \) \, #h(2em) macron(i) in bb(Z) \/ 2 . $
  In each parity the torsion is
  $ \( bb(Z) \/ 2 \)^(16 \( N - 3 \)) xor \( bb(Z) \/ 3 \)^(32 \( N - 5 \)) \, $
  by summing the profiles of Section 5. Its minimum number of generators is $32 \( N - 5 \)$. Thus their lower bound evaluates to
  $ b \( M \) + 2 sum_(macron(i) in bb(Z) \/ 2) d #scale(x: 120%, y: 120%)[\(] "Tor" overline(H)_(macron(i)) \( M \; bb(Z) \) #scale(x: 120%, y: 120%)[\)] = 8 \( 41 N - 183 \) + 128 \( N - 5 \) = 456 N - 2104 \, $
  where $d$ denotes the minimum number of generators. Our Hamiltonian has $456 N - 2072$ fixed points, thirty-two more than this bound. The counterexample therefore distinguishes the integer-graded geometric Morse count from the established cyclically graded integral count.
] <rem:periodic-bound>

== 7 Morse attainment by handle cancellation <app:handles>

We prove the existence assertion of Theorem 5 for a simply connected closed smooth $D$-manifold $W$, with $D gt.eq 9$. The argument is the classical handle proof of Smale’s theorem [23] Theorem 2.4. Its purpose here is to keep the geometric attainment of the integral torsion bound explicit.

We use the standard correspondence between Morse functions and ordered handle decompositions, together with handle slides, insertion of cancelling pairs, and handle cancellation. A slide over a handle of the same index changes the corresponding integral handle basis by an elementary addition. Two consecutive handles of indices $i$ and $i + 1$ cancel when the attaching sphere of the latter meets the belt sphere of the former transversely in one point. Handle isotopies, slides, and reorderings carry the subsequent attaching maps along. Thus they preserve the represented smooth manifold. The Morse attachment correspondence is reviewed in [16]. We use the cancellation and basis-change theorems in [17] Theorems 5.4 and 7.6.

=== 7.1 Removing handles of index one and coindex one <removing-handles-of-index-one-and-coindex-one>

Choose an ordered handle decomposition of $W$. Connectedness allows us to combine the $0$-handles along a tree of $1$-handles, leaving one $0$-handle. The dual operation leaves one $D$-handle. We next remove all $1$-handles, allowing the insertion of cancelling $2 \/ 3$ pairs. This is the handle exchange underlying [17] Theorem 8.1; we describe it to specify the role of simple connectivity.

Let $P$ be the union of the $0$- and $1$-handles. It retracts onto a graph, and $pi_1 \( P \)$ is the free group generated by the $1$-handles. The boundary $partial P$ is connected, and its inclusion into $P$ induces an isomorphism on fundamental groups: viewed relative to $partial P$, the reversed handles have indices $D - 1$ and $D$. The attaching circles of the $2$-handles normally generate $pi_1 \( partial P \)$, because the higher-index handles do not affect fundamental groups and $pi_1 \( W \) = 0$.

Fix one free generator. Insert a cancelling $2 \/ 3$ pair whose $2$-handle initially attaches along a trivial circle in a small ball in $partial P$. The new $2$-handle can be placed with the other $2$-handles in the ordered decomposition. Slide it over those handles until its attaching circle represents the chosen generator. To justify this step, express the generator as a finite product of conjugates of the old attaching words and their inverses. A slide is a band sum with an attaching circle, and choosing the band path and its orientation realizes multiplication by the corresponding conjugate or inverse. The needed paths can be chosen away from the other attaching circles by general position; their tubular attaching regions can be made thinner.

The new circle is homotopic to a standard circle running once over the chosen $1$-handle and avoiding the other $1$-handles. Choose this standard circle disjoint from the other $2$-handle attaching circles. In the $\( D - 1 \)$-dimensional boundary, general position turns the homotopy into an isotopy through embedded circles avoiding those other circles. Indeed, both self-intersections in a one-parameter family and intersections with the other circles have expected dimension at most $3 - \( D - 1 \) < 0$. Transport the attaching framing along the isotopy. The new attaching circle now meets the chosen belt sphere once, so the $1$-handle and the new $2$-handle cancel. Repeating removes all $1$-handles.

Apply the same construction to the reversed decomposition to eliminate the $\( D - 1 \)$-handles. Its inserted $2 \/ 3$ pairs have original indices $D - 2 \, D - 3$, so this operation does not reintroduce $1$-handles. We obtain an ordered decomposition with one handle in each of indices $0$ and $D$, none in indices $1$ and $D - 1$, and all other handles in indices $2 \, dots.h \, D - 2$.

=== 7.2 An algebraic unit whenever the count is excessive <an-algebraic-unit-whenever-the-count-is-excessive>

The simply connected manifold $W$ is orientable. Fix an orientation, orient the handles, and let $C_(*)$ be their integral chain complex. The coefficient of an $i$-handle in the boundary of an $\( i + 1 \)$-handle is the algebraic intersection number of its belt sphere and the latter’s attaching sphere in the level between these indices. Write $Z_i = ker partial_i$ and $B_i = "im" partial_(i + 1)$ as in (2.4). That identity gives

#[#set math.equation(numbering: n => "(7.1)")
 $ sum_i "rank" C_i - lambda \( W \) = 2 sum_i #scale(x: 120%, y: 120%)[\(] "rank" B_i - t_i \( W \) #scale(x: 120%, y: 120%)[\)] . $ <eq:handle-excess>]

Each summand on the right is nonnegative. If the total handle count exceeds $lambda \( W \)$, some $B_i$ therefore has rank greater than $t_i \( W \)$. Since the chain groups in degrees $1$ and $D - 1$ vanish, such an index satisfies $2 lt.eq i lt.eq D - 3$.

The subgroup $Z_i$ is a direct summand of $C_i$, because $C_i \/ Z_i tilde.equiv B_(i - 1)$ is free. The nonzero Smith invariant factors of $partial_(i + 1)$ are consequently those for the inclusion $B_i subset Z_i$. Exactly $t_i \( W \)$ of them are nonunits: these are the cyclic invariant factors of $"Tor" H_i \( W \; bb(Z) \)$. The strict rank inequality thus gives at least one unit invariant factor. Row and column operations can place a $1$ in the boundary matrix. They are realized geometrically by handle slides, relabelings, and choices of orientation in indices $i$ and $i + 1$.

The relevant levels are connected, so the slide bands can be chosen. More precisely, the union $P_i$ of all handles of index at most $i$ is simply connected, since it has no $1$-handles. Its reversed handles relative to the boundary $L = partial P_i$ have indices at least $D - i gt.eq 3$. They induce isomorphisms on components and fundamental groups; hence $L$ is connected and simply connected. The same reasoning applies to the level before the $i$-handles. Attaching spheres of one index have codimension at least two in their attaching level, which allows slide paths to avoid their disjoint attaching regions after those regions have been made sufficiently thin.

We have produced an attaching sphere $A tilde.equiv S^i$ and a belt sphere $B tilde.equiv S^(D - 1 - i)$ in $L$, with algebraic intersection number $1$. To cancel their handles, we must make their geometric intersection a single point. This is the remaining geometric step.

=== 7.3 Converting the unit to a single intersection <converting-the-unit-to-a-single-intersection>

First suppose $i gt.eq 3$ and $D - 1 - i gt.eq 3$. Put all attaching and belt spheres at this level in transverse position. A pair of opposite-sign intersections of $A$ and $B$ determines a Whitney circle, using one arc in each sphere and choosing the arcs to avoid the other intersection points. Since $L$ is simply connected, the circle bounds a Whitney disk. The high-dimensional Whitney trick [17] Theorem 6.6 removes the pair. Its dimensional hypotheses are precisely available here: both sphere dimensions are at least three, and the interior of the two-dimensional Whitney disk can avoid every attaching and belt sphere. The Whitney move can thus be performed without disturbing their other intersections. Repeating leaves one intersection of $A$ and $B$.

The cases in which one sphere has dimension two require control of the complement of the other sphere, as in the low-index refinement of the Whitney theorem in [17] Theorem 6.6. Here this control can be seen directly. By reversing the decomposition if necessary, it is enough to treat $i = 2$. Here $L$ is the boundary after the $2$-handles have been attached to the unique $0$-handle. Let

$ B_1 \, dots.h \, B_h subset L $

be all their belt spheres, and put $V = L \\ union.big_(j = 1)^h B_j$. The plan is to move a disk in the chosen attaching sphere into $V$ by a relative homotopy, then use general position to turn the resulting sphere homotopy into an isotopy. We first determine the fundamental group of this complement.

The manifold $L$ is obtained from $S^(D - 1)$ by surgery on the attaching circles. Each surgery replaces $S^1 times D^(D - 2)$ by $D^2 times S^(D - 3)$, whose belt sphere is ${ 0 } times S^(D - 3)$. After removing this belt sphere, the replacement piece is

$ \( D^2 \\ { 0 } \) times S^(D - 3) . $

It retracts onto its attaching boundary $S^1 times S^(D - 3)$. Performing these retractions simultaneously shows that $V$ has the homotopy type of the exterior of the original attaching circles in $S^(D - 1)$. That exterior is simply connected: a loop can be filled in the sphere, and a filling disk can be put in general position away from the circles. Moving away from their cores and away from their small tubular neighborhoods gives the same fundamental group. Thus

#[#set math.equation(numbering: n => "(7.2)")
 $ pi_1 \( V \) = pi_1 \( L \) = 0 . $ <eq:belt-complement-pi1>]

Let $A tilde.equiv S^2$ be the chosen attaching sphere of a $3$-handle, and choose a pair of opposite-sign intersections with the chosen belt sphere. Join them by an arc in $A$ avoiding all other intersections with all the $B_j$. A small disk $Delta subset A$ around this arc contains exactly that pair; its boundary and a collar outside it lie in $V$. The oriented normal bundles of the belt spheres have rank two. Excision and the Thom isomorphism identify

#[#set math.equation(numbering: n => "(7.3)")
 $ H_2 \( L \, V \; bb(Z) \) tilde.equiv xor.big_(j = 1)^h bb(Z) \, $ <eq:relative-intersection-group>]

where the coordinates of $\[ Delta \]$ are its intersection numbers with the $B_j$. They all vanish, so $\[ Delta \] = 0$.

The same conclusion holds in relative homotopy. To see explicitly why no assumption on $pi_2 \( L \)$ is needed, (7.2) and the long exact sequences give

$ pi_2 \( L \, V \) & tilde.equiv "coker" #scale(x: 120%, y: 120%)[\(] pi_2 \( V \) arrow.r pi_2 \( L \) #scale(x: 120%, y: 120%)[\)] \,\
H_2 \( L \, V \; bb(Z) \) & tilde.equiv "coker" #scale(x: 120%, y: 120%)[\(] H_2 \( V \; bb(Z) \) arrow.r H_2 \( L \; bb(Z) \) #scale(x: 120%, y: 120%)[\)] . $

Absolute Hurewicz in degree two is an isomorphism for both simply connected spaces. It therefore induces an isomorphism between these cokernels. The disk $Delta$, regarded as a map of pairs into $\( L \, V \)$, can consequently be homotoped into $V$, with its boundary moving in $V$. The homotopy extension property extends this boundary motion through maps of the collar into $V$, fixing its outer edge. Together with the disk homotopy this gives a homotopy of $A$ stationary outside $Delta$ and the collar. At its endpoint the chosen pair has disappeared and every other intersection with the belt spheres is unchanged.

We can realize this homotopy by an isotopy of the attaching sphere. First smooth it relative to the initial sphere and the stationary region. General position for a one-parameter family of maps of a $2$-sphere eliminates self-intersections and intersections with the other attaching $2$-spheres: their expected dimensions are at most $2 + 2 + 1 - \( D - 1 \) < 0$. The immersion condition holds by the same parametric general-position argument. The level has dimension at least eight, so these perturbations can be made relative to the prescribed region. At the endpoint the altered disk and collar form a compact subset of the open set $V$; a sufficiently small approximation preserves their avoidance of the belt spheres. Keep neighborhoods of the remaining transverse intersections stationary. Intermediate crossings with belt spheres impose no restriction on this isotopy. Isotopy extension transports the attaching framing, and the other attaching tubes can be shrunk to remain disjoint. Repeating the operation leaves exactly one intersection with the chosen belt sphere.

=== 7.4 Completing the cancellation <completing-the-cancellation>

In every case, the unit coefficient has now been represented by one geometric intersection. Order the chosen $i$-handle last among the $i$-handles and the chosen $\( i + 1 \)$-handle first among the $\( i + 1 \)$-handles. They are consecutive and cancel. Intersections with other handles do not obstruct this cancellation; their attaching maps are transported by the cancellation diffeomorphism. The resulting decomposition still has no handles of indices $1$ or $D - 1$.

Every cancellation decreases the total number of handles by two. Whenever that count exceeds $lambda \( W \)$, Equation (7.1) produces another cancellable pair by the argument above. The process therefore terminates with exactly $lambda \( W \)$ handles. At this stage every nonnegative summand in (7.1) vanishes, so $"rank" B_i = t_i \( W \)$ for every $i$. Equation (2.4) then gives precisely

$ "rank" C_i = r_i \( W \) + t_i \( W \) + t_(i - 1) \( W \) . $

The Morse function associated with the final handle decomposition has these critical-point counts. This proves the existence assertion in Theorem 5.

#heading(level: 1)[References]
#bibitem([1])[M.~Abouzaid and A.~J. Blumberg, #emph[Arnold conjecture and Morava $K$-theory], preprint (2021), #link("https://arxiv.org/abs/2103.01507")[arXiv:2103.01507].]
#bibitem([2])[V.~I. Arnol'd, #emph[First steps in symplectic topology], Russian Math. Surveys #strong[41] (1986), no.~6, 1--21. #link("https://doi.org/10.1070/RM1986v041n06ABEH004221")[doi:10.1070/RM1986v041n06ABEH004221].]
#bibitem([3])[S.~Bai and G.~Xu, #emph[Arnold conjecture over integers], preprint (2022), #link("https://arxiv.org/abs/2209.08599")[arXiv:2209.08599].]
#bibitem([4])[S.~Bai and G.~Xu, #emph[Integral Hamiltonian Floer theory: Foundations], preprint (2026), #link("https://arxiv.org/abs/2606.15847")[arXiv:2606.15847].]
#bibitem([5])[T.~Blomme, #emph[Gromov--Witten invariants of bielliptic surfaces], J. London Math. Soc. (2) #strong[111] (2025), no.~2, e70081. #link("https://doi.org/10.1112/jlms.70081")[doi:10.1112/jlms.70081].]
#bibitem([6])[C.~C. Conley and E.~Zehnder, #emph[The Birkhoff--Lewis fixed point theorem and a conjecture of V.~I. Arnold], Invent. Math. #strong[73] (1983), no.~1, 33--49. #link("https://doi.org/10.1007/BF01393824")[doi:10.1007/BF01393824].]
#bibitem([7])[M.~Damian, #emph[On the stable Morse number of a closed manifold], Bull. London Math. Soc. #strong[34] (2002), no.~4, 420--430. #link("https://doi.org/10.1112/S0024609301008955")[doi:10.1112/S0024609301008955].]
#bibitem([8])[G.~Dimitroglou Rizell and R.~Golovko, #emph[The number of Hamiltonian fixed points on symplectically aspherical manifolds], in #emph[Proceedings of the Gökova Geometry-Topology Conference 2016], International Press, 2017, pp.~138--150. #link("https://arxiv.org/abs/1609.04776v2")[arXiv:1609.04776v2].]
#bibitem([9])[H.~Duan and B.~Li, #emph[Topology of blow-ups and enumerative geometry], preprint (2009), revised 2016, #link("https://arxiv.org/abs/0906.4152v7")[arXiv:0906.4152v7].]
#bibitem([10])[A.~Floer, #emph[Symplectic fixed points and holomorphic spheres], Comm. Math. Phys. #strong[120] (1989), no.~4, 575--611. #link("https://doi.org/10.1007/BF01260388")[doi:10.1007/BF01260388].]
#bibitem([11])[K.~Fukaya and K.~Ono, #emph[Arnold conjecture and Gromov--Witten invariant], Topology #strong[38] (1999), no.~5, 933--1048. #link("https://doi.org/10.1016/S0040-9383(98)00042-1")[doi:10.1016/S0040-9383(98)00042-1].]
#bibitem([12])[R.~Golovko, #emph[On variants of Arnold conjecture], Arch. Math. (Brno) #strong[56] (2020), no.~5, 277--286. #link("https://doi.org/10.5817/AM2020-5-277")[doi:10.5817/AM2020-5-277].]
#bibitem([13])[H.~Hofer and D.~A. Salamon, #emph[Floer homology and Novikov rings], in #emph[The Floer Memorial Volume], H.~Hofer, C.~H. Taubes, A.~Weinstein, and E.~Zehnder (eds.), Progress in Mathematics, vol.~133, Birkhäuser, Basel, 1995, pp.~483--524. #link("https://doi.org/10.1007/978-3-0348-9217-9_20")[doi:10.1007/978-3-0348-9217-9\_20].]
#bibitem([14])[G.~Liu and G.~Tian, #emph[Floer homology and Arnold conjecture], J. Differential Geom. #strong[49] (1998), no.~1, 1--74. #link("https://doi.org/10.4310/jdg/1214460936")[doi:10.4310/jdg/1214460936].]
#bibitem([15])[D.~McDuff and D.~Salamon, #emph[Introduction to Symplectic Topology], third edition, Oxford Graduate Texts in Mathematics, vol.~27, Oxford University Press, Oxford, 2017.]
#bibitem([16])[J.~Milnor, #emph[Morse Theory], Annals of Mathematics Studies, vol.~51, Princeton University Press, Princeton, NJ, 1963.]
#bibitem([17])[J.~Milnor, #emph[Lectures on the $h$-Cobordism Theorem], notes by L.~Siebenmann and J.~Sondow, Princeton University Press, Princeton, NJ, 1965.]
#bibitem([18])[K.~Ono, #emph[On the Arnold conjecture for weakly monotone symplectic manifolds], Invent. Math. #strong[119] (1995), 519--537. #link("https://doi.org/10.1007/BF01245191")[doi:10.1007/BF01245191].]
#bibitem([19])[OpenAI, #emph[A nondegenerate counterexample to the Morse-number Arnold bound], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-nondegenerate-counterexample-to-the-Morse-number-Arnold-bound-September-23-2026/paper.pdf")[OAI:A-nondegenerate-counterexample-to-the-Morse-number-Arnold-bound-September-23-2026], 2026.]
#bibitem([20])[S.~Pöder Balkeståhl, #emph[Simple homotopy type of the Hamiltonian Floer complex], preprint (2021), #link("https://arxiv.org/abs/2110.10592")[arXiv:2110.10592].]
#bibitem([21])[Y.~Ruan, #emph[Virtual neighborhoods and pseudo-holomorphic curves], Turkish J. Math. #strong[23] (1999), no.~1, 161--232.]
#bibitem([22])[F.~Serrano, #emph[The Picard group of a quasi-bundle], Manuscripta Math. #strong[73] (1991), no.~1, 63--82.]
#bibitem([23])[S.~Smale, #emph[A survey of some recent developments in differential topology], Bull. Amer. Math. Soc. #strong[69] (1963), 131--145. #link("https://doi.org/10.1090/S0002-9904-1963-10901-5")[doi:10.1090/S0002-9904-1963-10901-5].]
#bibitem([24])[J.~A. Yorke, #emph[Periods of periodic solutions and the Lipschitz constant], Proc. Amer. Math. Soc. #strong[22] (1969), no.~2, 509--512. #link("https://doi.org/10.1090/S0002-9939-1969-0245916-7")[doi:10.1090/S0002-9939-1969-0245916-7].]


