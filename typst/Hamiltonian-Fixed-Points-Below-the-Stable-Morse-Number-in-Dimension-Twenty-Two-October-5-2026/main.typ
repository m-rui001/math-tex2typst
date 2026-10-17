#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Hamiltonian-Fixed-Points-Below-the-Stable-Morse-Number-in-Dimension-Twenty-Two-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Arnold fixed-point problem asks how much of the critical-point theory of a small autonomous Hamiltonian persists for an arbitrary Hamiltonian path. One proposed lower bound is the stable Morse number: the least number of critical points after allowing auxiliary quadratic variables. We construct a family for which this bound fails by a fixed proportion, while the ambient manifolds remain simply connected and Kähler of real dimension twenty-two.

Let $W$ be a connected closed smooth manifold. Its #emph[stable Morse number] $"SM" \( W \)$ is the minimum of $\# "Crit" \( F \)$ over integers $k gt.eq 0$ and smooth Morse functions $F : W times upright(bold(R))^k arrow.r upright(bold(R))$ such that, for $k > 0$,

$ F \( x \, z \) = Q \( z \) #h(2em) upright("for all sufficiently large ") \| z \| \, $

where $Q$ is a nondegenerate quadratic form of arbitrary signature. The radius is uniform in $x$. For $k = 0$ there is no condition at infinity; the minimum over this subclass is the ordinary Morse number $"Morse" \( W \)$. In particular, $"SM" \( W \) lt.eq "Morse" \( W \)$.

For a connected closed symplectic manifold $\( M \, omega \)$ and $H in C^oo \( \( upright(bold(R)) \/ upright(bold(Z)) \) times M \, upright(bold(R)) \)$, write $phi.alt_H^t$ for the Hamiltonian flow, with convention $omega \( X_(H_t) \, dot.op \) = d H_t$. A fixed point of $phi.alt_H^1$ is #emph[nondegenerate] if its derivative has no eigenvalue $1$. We write

$ "Fix"_0 \( phi.alt_H^1 \; H \) = { x in "Fix" \( phi.alt_H^1 \) : t mapsto phi.alt_H^t \( x \) upright(" is contractible in ") M } . $

This is a set of initial points; choices of capping disks do not change its cardinality. The unrestricted stable Morse formulation asks whether $\# "Fix"_0 \( phi.alt_H^1 \; H \) gt.eq "SM" \( M \)$ whenever all fixed points are nondegenerate.

#thm([Theorem 1.1.])[
  #emph[For every integer $m gt.eq 1$, there exist a simply connected closed Kähler manifold $\( M_m \, omega_m \)$ of real dimension $22$ and a smooth one-periodic Hamiltonian $H_m$ such that all fixed points of $phi.alt_(H_m)^1$ are nondegenerate and 
$ "SM" \( M_m \) & = 80 + 1968 m \,\
\# "Fix" \( phi.alt_(H_m)^1 \) & = \# "Fix"_0 \( phi.alt_(H_m)^1 \; H_m \) = 80 + 1952 m . $

 Consequently, with $delta = 1 \/ 128$, for every $R > 0$ some member of this family satisfies 
$ "SM" \( M_m \) gt.eq R \, #h(2em) \# "Fix" \( phi.alt_(H_m)^1 \) lt.eq \( 1 - delta \) "SM" \( M_m \) . $

]
] <thm:main>

=== Context and earlier work <context-and-earlier-work>

Arnold’s questions connect Hamiltonian dynamics to the topology of smooth functions [2]. Conley and Zehnder established the torus case by variational methods [6]. Floer’s construction of a chain complex from pseudoholomorphic curves established a new approach to homological fixed-point bounds [10]. Later extensions include the weakly monotone theory of Hofer–Salamon and Ono and the virtual-moduli methods of Fukaya–Ono, Liu–Tian, and Ruan [14,18,11,15,21]. The resulting rational homological lower bound and the geometric Morse bounds are different assertions: integral torsion can force more critical points than the total rational Betti number.

More recent work gives lower bounds over arbitrary fields and over the integers [1,3,4]. The integral Floer bound uses homology with a cyclic grading determined by the first Chern class. The stable Morse number retains the integer grading, and these yield different bounds for the examples below; the comparison is computed in Remark 15.

The stable Morse formulation is stated explicitly in [12] Conjecture 1.2. Damian showed that ordinary and stable Morse numbers need not agree [7]. Positive results for the stable bound include the theorem of Dimitroglou Rizell and Golovko for generic Hamiltonians when both the symplectic area class and the first Chern class vanish on $pi_2 \( M \)$ [8] Corollary 1.4; Pöder Balkeståhl obtained an independent proof using the simple homotopy type of the Hamiltonian Floer complex [20] Corollary 1.2. These hypotheses do not hold for the projective blow-ups used here. The almost-quadratic convention used in these comparisons gives the same stable Morse number as our exact condition at infinity; see Remark 4.

The companion manuscript [19] gives a simply connected Kähler counterexample using mixed-prime torsion and a Hamiltonian involution. The present construction develops that mechanism in a fixed dimension and produces an arbitrarily large stable Morse number with a uniform relative deficit. We reproduce the geometric and dynamical arguments needed for the construction. The principal extra step is to embed arbitrarily many disjoint copies of suitable centers in $upright(bold(C P))^9$: the number of centers may grow without increasing their dimensions or the dimension of the ambient projective space.

=== Mechanism and proof structure <mechanism-and-proof-structure>

All homology groups below have integral coefficients unless another ring is displayed. For a finite abelian group $T$, let $d \( T \)$ denote its minimum number of generators. Put

#[#set math.equation(numbering: n => "(1.1)")
 $ b \( W \) = sum_i "rank" H_i \( W \; upright(bold(Z)) \) \, #h(2em) t_i \( W \) = d \( "Tor" H_i \( W \; upright(bold(Z)) \) \) \,\
lambda \( W \) = b \( W \) + 2 sum_i t_i \( W \) . $ <intro:lambda>]

The geometric Morse inequalities give $"SM" \( W \) gt.eq lambda \( W \)$ even with auxiliary quadratic variables. For simply connected manifolds in the dimensions used here, Smale’s handle theorem supplies an ordinary Morse function attaining this bound [23] Theorem 2.4 and the following paragraph. Section 2 proves the stable lower bound and states the equality; Appendix Section 6 recalls its handle-theoretic proof.

The generator count combines different primes by a maximum rather than a sum. For example,

$ d #scale(x: 120%, y: 120%)[\(] \( upright(bold(Z)) \/ 2 \)^a xor \( upright(bold(Z)) \/ 3 \)^q #scale(x: 120%, y: 120%)[\)] = max \( a \, q \) . $

We will arrange that the prime contributing the larger multiplicity changes with the homological degree. Redistributing those degrees by taking products can then change the generator count in a way that the free ranks do not detect.

To arrange the needed homology, take two projective surfaces whose torsion groups are respectively $\( upright(bold(Z)) \/ 2 \)^2$ and $upright(bold(Z)) \/ 3$ in degrees $1$ and $2$. The blow-up centers are the first surface and the product of the second with $upright(bold(C P))^1 times upright(bold(C P))^1$, of complex dimensions $2$ and $4$. Section 3 embeds $m$ copies of each disjointly into $upright(bold(C P))^9$ and blows them up to obtain a simply connected Kähler manifold $X_m$. The projection argument applies more generally to every finite collection of smooth projective varieties of dimension at most $d$, using one ambient $upright(bold(C P))^(2 d + 1)$.

The dynamical construction uses the Kähler surface $Y$ obtained by blowing up the four coordinate corners of $upright(bold(C P))^1 times upright(bold(C P))^1$. The half-turn of the diagonal circle action fixes exactly the four exceptional projective lines. Thus its product with the identity on $X_m$ has four fixed components on $M_m = X_m times Y$, each diffeomorphic to $C_m = X_m times upright(bold(C P))^1$. Section 4 perturbs this involution so that each component contributes precisely the critical points of a chosen Morse function on $C_m$. A short-period argument excludes every other fixed point. The construction therefore realizes $4 lambda \( C_m \)$ nondegenerate fixed points.

Products with $upright(bold(C P))^1$ and $Y$ combine the torsion in nearby degrees with different multiplicities. Taking the maximum of the two primary multiplicities in each degree then gives different savings in the number of generators. Section 5 computes

$ lambda \( X_m times Y \) - 4 lambda \( X_m times upright(bold(C P))^1 \) = 16 m $

and completes the proof. This separates the stable Morse count from the Hamiltonian count without any distinction between ordinary and stable Morse theory on the simply connected manifolds in the construction.

== 2 Integral homology and Morse numbers <morse:section>

The construction requires two facts about Morse numbers: integral torsion survives stabilization, and its resulting lower bound is attained by an ordinary Morse function on the simply connected manifolds used here. We prove the first fact directly for the precise condition at infinity in the definition of $"SM"$. The second is the classical theorem of Smale; a handle proof is included in Appendix 6. The presentation follows the corresponding arguments in [19] Section 2 and Appendix A.

Recall that $t_i \( W \)$ is the minimum number of generators of $"Tor" H_i \( W \; upright(bold(Z)) \)$. Put $r_i \( W \) = "rank" H_i \( W \; upright(bold(Z)) \)$, so that

$ lambda \( W \) = sum_i r_i \( W \) + 2 sum_i t_i \( W \) . $

All homological indices are integers, and these quantities are zero outside the homological range of $W$.

#thm([Lemma 2.1.])[
  #emph[Let $C_(*)$ be a finite chain complex of finitely generated free abelian groups. If $rho_i$ is the rank of $H_i \( C_(*) \)$ and $tau_i$ is the minimum number of generators of its torsion subgroup, then 
$ "rank" C_i gt.eq rho_i + tau_i + tau_(i - 1) \, #h(2em) sum_i "rank" C_i gt.eq sum_i rho_i + 2 sum_i tau_i . $

]
] <morse:chain-bound>

#proof[
  Write $Z_i = ker partial_i$ and $B_i = "im" partial_(i + 1)$. These groups are free, and the two defining short exact sequences give
  #[#set math.equation(numbering: n => "(2.1)")
   $ "rank" C_i = rho_i + "rank" B_i + "rank" B_(i - 1) . $ <morse:chain-rank>]
  Smith normal form for $B_i subset Z_i$ expresses $Z_i \/ B_i = H_i \( C_(*) \)$ as a direct sum of a free group and cyclic groups, one for each nonunit invariant factor of this inclusion. Consequently $"rank" B_i gt.eq tau_i$. Substitution in (2.1) proves both inequalities. ◻
]

#thm([Proposition 2.2.])[
  #emph[For every connected closed smooth manifold $W$, 
$ "SM" \( W \) gt.eq lambda \( W \) . $

]
] <morse:stable-lower>

#proof[
  Let $F : W times upright(bold(R))^k arrow.r upright(bold(R))$ be an admissible Morse function. We will construct a finite free integral chain complex with one generator per critical point and with homology equal to that of $W$, up to a degree shift. For $k = 0$, the ordinary Morse complex has these properties. Suppose $k > 0$.
  After a linear change of the auxiliary coordinates, the quadratic form at infinity is
  $ Q \( u \, v \) = - \| u \|^2 + \| v \|^2 \, #h(2em) \( u \, v \) in upright(bold(R))^d times upright(bold(R))^(k - d) . $
  Choose $R_0 > 0$ such that $F = Q$ for $\| \( u \, v \) \| gt.eq R_0$ and every critical point lies in $W times B_(R_0)$. Choose constants $A \, T > 0$ with
  $ A > max_(W times overline(B)_(R_0)) { \| F \| \, \| Q \| } \, #h(2em) T > R_0 \, #h(2em) T^2 > A . $
  Set
  $ K = W times overline(B)_T \, #h(2em) K_(-) = K ∩ { F lt.eq - A } \, #h(2em) K_(+) = K ∩ { F lt.eq A } . $
  The endpoint sublevels of $F$ and $Q$ agree:
  #[#set math.equation(numbering: n => "(2.2)")
   $ K_plus.minus = K ∩ { Q lt.eq plus.minus A } . $ <morse:endpoint-pair>]
  Indeed, outside the core the functions agree, while inside it both sublevels at $- A$ are empty and both sublevels at $A$ contain the entire core.
  We next check that the truncation by $K$ introduces no extra cells. On the side boundary $W times partial B_T$, the function is $Q$. Its differential restricted to that boundary can vanish only at $u = 0$ or $v = 0$, with respective values $T^2$ and $- T^2$ when those loci exist. There are therefore no side-boundary critical points in the level band $\[ - A \, A \]$. A gradient-like vector field for $F$ on that band can be chosen tangent to the side boundary: choose such a field on the boundary using the nonvanishing restricted differential, extend it to a collar, and combine it with an interior gradient-like field by a partition of unity. The condition $d F \( V \) > 0$ away from critical points is preserved by this combination.
  The Morse attachment theorem now applies on this compact manifold with corners. Between critical values the tangent field gives the usual deformation of sublevels, including at the side boundary; at each critical point the change occurs in an interior Morse chart. Thus, up to homotopy relative to $K_(-)$, the space $K_(+)$ is obtained from $K_(-)$ by attaching one $j$-cell for each index-$j$ critical point of $F$; see [16] Section 3 for the local attachment argument. Coincident critical values can be separated by an arbitrarily small perturbation supported in their Morse charts, without changing the endpoint pair or the critical points and their indices. Both endpoint sublevels have finite CW type. Taking a finite CW model for $K_(-)$ and cellular approximations of the attachments gives a finite free relative cellular complex $C_(*)$ satisfying
  #[#set math.equation(numbering: n => "(2.3)")
   $ sum_j "rank" C_j = \# "Crit" \( F \) \, #h(2em) H_j \( C_(*) \) tilde.equiv H_j \( K_(+) \, K_(-) \; upright(bold(Z)) \) . $ <morse:critical-complex>]
  It remains to identify this homology. The homotopy $\( u \, v \) mapsto \( u \, \( 1 - s \) v \)$, $0 lt.eq s lt.eq 1$, decreases both $Q$ and the Euclidean norm. By (2.2), it is a deformation retraction of the pair onto
  $ W times #scale(x: 120%, y: 120%)[\(] D_T^d \, { u in D_T^d : \| u \| gt.eq sqrt(A) } #scale(x: 120%, y: 120%)[\)] . $
  The disk–annulus pair has relative integral homology $upright(bold(Z))$ in degree $d$ and zero in every other degree. When $d = 0$ it is the pair $\( { 0 } \, diameter \)$, with the same assertion. The relative Künneth theorem therefore gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ H_j \( C_(*) \) tilde.equiv H_(j - d) \( W \; upright(bold(Z)) \) . $ <morse:shifted-homology>]
  This calculation includes both definite signatures of $Q$. Applying Lemma 2 to (2.3)–(2.4) gives $\# "Crit" \( F \) gt.eq lambda \( W \)$. Taking the minimum over $F$ proves the proposition. ◻
]

#prodef([Remark 2.3.])[
  Some formulations of the stable Morse number allow $parallel d F - d Q parallel$ to be uniformly bounded in the product of a metric on $W$ and the Euclidean metric on $upright(bold(R))^k$. This gives the same minimum as exact equality at infinity. Indeed, write $h = F - Q$ and assume $parallel d h parallel lt.eq L$. Compactness of $W$ gives $\| h \( x \, z \) \| lt.eq K_0 + L \| z \|$, while nondegeneracy gives $parallel d Q \( z \) parallel gt.eq c \| z \|$ for some $c > 0$. Thus all critical points lie in $\| z \| lt.eq L \/ c$. Choose a radial cutoff $chi_R$ equal to one for $\| z \| lt.eq R$ and zero for $\| z \| gt.eq 2 R$, with $parallel d chi_R parallel lt.eq C \/ R$. On the transition annulus,
  $ parallel d \( chi_R h \) parallel lt.eq L + C \( K_0 \/ R + 2 L \) \, #h(2em) parallel d Q parallel gt.eq c R . $
  For sufficiently large $R$, the function $Q + chi_R h$ therefore has exactly the original critical points, agrees with $F$ near them, and equals $Q$ outside a compact set. The converse inclusion is immediate. This also covers functions equal to $f \( x \) + Q \( z \)$ near infinity, since $d f$ is bounded on the closed manifold $W$.
] <morse:infinity-conventions>

#thm([Theorem 2.4.])[
  (Smale).  #emph[Let $W$ be a simply connected closed smooth manifold of dimension $D gt.eq 9$. There is an ordinary Morse function on $W$ with exactly 
$ r_i \( W \) + t_i \( W \) + t_(i - 1) \( W \) $

 critical points of index $i$ for every $i$. Consequently 
#[#set math.equation(numbering: n => "(2.5)")
 $ "SM" \( W \) = "Morse" \( W \) = lambda \( W \) . $ <morse:three-equal>]

]
] <morse:equality>

#proof[
  The existence statement is the torsion-inclusive form of Smale’s Morse theorem [23] Theorem 2.4 and the following paragraph, pp. 134–135. Appendix 6 gives the handle-cancellation proof in the stated dimension range, including the case of handles of indices $2$ and $3$. Summing the prescribed index counts gives $lambda \( W \)$ critical points. Since ordinary Morse functions are admissible in the definition of $"SM"$, Proposition 3 yields
  $ lambda \( W \) lt.eq "SM" \( W \) lt.eq "Morse" \( W \) lt.eq lambda \( W \) . $
  ◻
]

The torsion count in these formulas combines different primes in the same degree. In particular, for distinct primes $p \, q$,

#[#set math.equation(numbering: n => "(2.6)")
 $ d #scale(x: 120%, y: 120%)[\(] \( upright(bold(Z)) \/ p \)^a xor \( upright(bold(Z)) \/ q \)^b #scale(x: 120%, y: 120%)[\)] = max \( a \, b \) \, $ <morse:primary-maximum>]

where $d$ denotes the minimum number of generators. Projection to each primary subgroup gives the lower bound, and pairing cyclic summands by the Chinese remainder theorem gives the upper bound. The degreewise maximum in (2.6) is the source of the strict numerical comparison in our construction.

== 3 Torsion in a fixed complex dimension <geo:section>

For every integer $m gt.eq 1$, we will construct a simply connected closed Kähler manifold $X_m$ of complex dimension nine by blowing up $upright(bold(C P))^9$ along $2 m$ disjoint centers. Two quotient surfaces supply torsion at primes two and three. A simultaneous projection places arbitrarily many copies of the centers in $upright(bold(C P))^9$, and the integral blow-up formula then records their contributions to homology. The surface construction and blow-up argument also appear in [19] Section 3; the projection step is what keeps the dimension independent of $m$.

=== 3.1 Two projective quotient surfaces <two-projective-quotient-surfaces>

Let

$ E = upright(bold(C)) \/ \( upright(bold(Z)) + i upright(bold(Z)) \) \, #h(2em) zeta_p = exp \( 2 pi i \/ p \) \, #h(2em) Lambda_2 = upright(bold(Z)) + i upright(bold(Z)) \, #h(2em) Lambda_3 = upright(bold(Z)) + zeta_3 upright(bold(Z)) \, $

and set $E_p = upright(bold(C)) \/ Lambda_p$ for $p in { 2 \, 3 }$. The automorphism

$ sigma_p : E times E_p arrow.r E times E_p \, #h(2em) sigma_p \( z \, w \) = \( z + 1 \/ p \, zeta_p w \) $

is well-defined because multiplication by $zeta_p$ preserves $Lambda_p$. It has order $p$. Every nonidentity power translates the first factor by $k \/ p$ for some $0 < k < p$, and hence has no fixed point. Thus

$ S_p = \( E times E_p \) \/ chevron.l sigma_p chevron.r $

is a smooth compact connected complex surface. These are examples of bielliptic surfaces, whose integral topology is studied in [22] Theorem 4.3. The quotient presentations and homology groups used here are recorded in [5] Sections 2.2–2.3. We give the projectivity and homology calculations needed for the construction.

#thm([Lemma 3.1.])[
  #emph[The surfaces $S_2$ and $S_3$ are projective. With 
$ T_2 = \( upright(bold(Z)) \/ 2 \)^2 \, #h(2em) T_3 = upright(bold(Z)) \/ 3 \, $

 their integral homology groups are 
#[#set math.equation(numbering: n => "(3.1)")
 $ H_i \( S_p \; upright(bold(Z)) \) tilde.equiv cases(delim: "{", upright(bold(Z)) \, & i = 0 \, 4 \,, upright(bold(Z))^2 xor T_p \, & i = 1 \, 2 \,, upright(bold(Z))^2 \, & i = 3 \,, 0 \, & upright("otherwise") .) $ <geo:surface-homology>]

 In particular, each surface has total Betti number eight.]
] <geo:surfaces>

#proof[
  We first realize the quotient as a projective submanifold. A line bundle of degree three on an elliptic curve has three independent sections. Riemann–Roch applied after subtracting one or two points, allowing multiplicity, shows that its complete linear system has no base points and separates points and tangent directions. It therefore embeds the curve in $upright(bold(C P))^2$. Taking the two curve embeddings and their Segre product gives an embedding
  $ iota_p : E times E_p arrow.r.hook upright(bold(C P))^8 . $
  A point of $upright(bold(C P))^8$ represents a linear polynomial on $\( upright(bold(C))^9 \)^(*)$, up to a nonzero scalar. Associate to an orbit the product of the $p$ linear polynomials representing
  $ iota_p \( x \) \, med iota_p \( sigma_p x \) \, med dots.h \, med iota_p \( sigma_p^(p - 1) x \) . $
  This gives a well-defined holomorphic map
  $ S_p arrow.r bb(P) \( "Sym"^p upright(bold(C))^9 \) . $
  Unique factorization shows that equal projective products have the same unordered factors. Thus the map separates the orbits.
  To check immersion, choose local representatives $L_0 \, dots.h \, L_(p - 1)$ of the orbit points. A tangent vector in the kernel of the derivative would give
  $ sum_(j = 0)^(p - 1) dot(L)_j product_(k eq.not j) L_k = a product_(k = 0)^(p - 1) L_k $
  for a scalar $a$. The factors are pairwise nonproportional because the action is free. Restricting this identity to the hyperplane $L_j = 0$ forces $dot(L)_j$ to vanish there: the product of the remaining factors is a nonzero polynomial on that hyperplane. Consequently $dot(L)_j$ is a scalar multiple of $L_j$ for every $j$. In particular, the projective derivative of $iota_p \( x \)$ is zero, so the original tangent vector is zero. The quotient map is a local biholomorphism, and therefore the induced map on $S_p$ is an injective holomorphic immersion. Compactness makes it an embedding. This proves projectivity.
  For the homology, the universal cover $upright(bold(C))^2 arrow.r S_p$ has deck group generated by
  $ a \( z \, w \) = \( z + 1 \/ p \, zeta_p w \) \, quad d \( z \, w \) = \( z + i \, w \) \, quad t_lambda \( z \, w \) = \( z \, w + lambda \) quad \( lambda in Lambda_p \) . $
  Here $a^p$ is translation by $1$ in the first coordinate. The elements $a \, d$ commute and generate a free abelian group of rank two. Their conjugation actions on $Lambda_p$ are multiplication by $zeta_p$ and the identity, respectively. The deck group is therefore $Lambda_p times.r upright(bold(Z))^2$, and its abelianization is
  #[#set math.equation(numbering: n => "(3.2)")
   $ H_1 \( S_p \; upright(bold(Z)) \) tilde.equiv upright(bold(Z))^2 xor Lambda_p \/ \( zeta_p - 1 \) Lambda_p . $ <geo:abelianization>]
  For $p = 2$, multiplication by $zeta_p - 1$ is $- 2 I$. For $p = 3$, its matrix in the basis $\( 1 \, zeta_3 \)$ is
  $ mat(delim: "(", - 1, - 1; 1, - 2) . $
  This matrix has determinant three and relatively prime entries, so its Smith normal form has diagonal $\( 1 \, 3 \)$. The finite summands in (3.2) are exactly $T_2$ and $T_3$.
  The complex orientation makes $S_p$ a closed oriented real four-manifold. Integral Poincaré duality and the universal coefficient theorem imply
  $ "Tor" H_2 \( S_p \; upright(bold(Z)) \) tilde.equiv "Tor" H^2 \( S_p \; upright(bold(Z)) \) tilde.equiv "Tor" H_1 \( S_p \; upright(bold(Z)) \) = T_p \, #h(2em) H_3 \( S_p \; upright(bold(Z)) \) tilde.equiv upright(bold(Z))^2 . $
  Finally, the degree-$p$ covering gives $p chi \( S_p \) = chi \( E times E_p \) = 0$. The ranks already computed in degrees $0 \, 1 \, 3 \, 4$ are $1 \, 2 \, 2 \, 1$, so the rank in degree two is two. This proves (3.1). ◻
]

Define the two types of blow-up center by

#[#set math.equation(numbering: n => "(3.3)")
 $ Z_2 = S_2 \, #h(2em) Z_3 = S_3 times upright(bold(C P))^1 times upright(bold(C P))^1 . $ <geo:centers>]

They are smooth connected projective varieties of complex dimensions two and four; projectivity of $Z_3$ follows from the Segre embedding. The projective-line factors distribute the $3$-primary torsion among shifts by $0 \, 2 \, 4$, with multiplicities $1 \, 2 \, 1$. Together with the different blow-up codimensions, this will make which prime has the larger multiplicity depend on the degree; Section 5 computes the resulting generator counts.

=== 3.2 Simultaneous projection of the centers <simultaneous-projection-of-the-centers>

The next lemma shows that the number of centers does not force the ambient dimension to increase. We use the classical secant-and-tangent projection argument; compare [13] Chapter IV, Exercise 3.11(a). For a disjoint union, secants joining different components must be avoided as well as secants within one component.

#thm([Lemma 3.2.])[
  (Simultaneous projective embedding).  #emph[Let $d gt.eq 0$ be an integer, and let $V_1 \, dots.h \, V_s$ be a finite family of smooth complex projective varieties of complex dimension at most $d$. Their disjoint union admits a holomorphic embedding into $upright(bold(C P))^(2 d + 1)$.]
] <geo:projection>

#proof[
  Splitting disconnected varieties into their finitely many connected components, we may assume each $V_alpha$ is connected. Choose projective embeddings $V_alpha arrow.r.hook bb(P) \( W_alpha \)$ and place their images in the pairwise disjoint linear subspaces $bb(P) \( W_alpha \) subset bb(P) \( xor.big_alpha W_alpha \)$. Adding unused coordinates if necessary, we obtain a disjoint embedded union $U subset upright(bold(C P))^D$ with $D > 2 d + 1$. We prove that projection from a suitable point of $upright(bold(C P))^D$ embeds this entire union in $upright(bold(C P))^(D - 1)$. Iteration will give the assertion.
  For each ordered pair of components, consider pairs of distinct points $\( x \, y \) in V_alpha times V_beta$, deleting the diagonal when $alpha = beta$. The two tautological lines representing $x$ and $y$ span a rank-two vector bundle over this pair space. Its projectivization is a $upright(bold(C P))^1$-bundle whose evaluation map to $upright(bold(C P))^D$ sweeps out exactly the secant lines joining those pairs. Its complex dimension is
  $ dim_(upright(bold(C))) V_alpha + dim_(upright(bold(C))) V_beta + 1 lt.eq 2 d + 1 < D . $
  The image has measure zero by Sard’s theorem. The pair space need not be compact; applying Sard in its countably many coordinate charts still gives the same conclusion.
  We also exclude every embedded projective tangent space. For a component of complex dimension $e$, a local homogeneous lift and its first derivatives span an $\( e + 1 \)$-dimensional vector space at each point. These spaces are independent of the lift and coordinates and form a vector bundle over that component. The evaluation map from its projectivization sweeps out the embedded projective tangent spaces. Its domain has complex dimension $2 e lt.eq 2 d < D$, so this image too has measure zero. The union $U$ itself has measure zero.
  There are only finitely many components and component pairs. We may therefore choose a point $q in upright(bold(C P))^D$ outside $U$, all the secant lines just described, and all the projective tangent spaces. Projection from $q$ is holomorphic on $upright(bold(C P))^D \\ { q }$. Two distinct points of $U$ could have the same projection only if their secant line contained $q$; hence the restricted projection is injective. The linear quotient by the line representing $q$ is injective on each of the $\( e + 1 \)$-dimensional tangent spans described above. Its projectivization therefore has injective derivative on each component. The union is compact, so this injective holomorphic immersion is an embedding, with disjoint component images. The same argument applies at each subsequent projection step, down to $upright(bold(C P))^(2 d + 1)$. ◻
]

=== 3.3 The integral blow-up formula <the-integral-blow-up-formula>

We now explain how the torsion of the centers passes to the ambient manifold. An integral direct-sum formula is essential here: rational cohomology alone would discard the information used in the final comparison. The following classical formula holds without any freeness assumption on the homology of the center; see [9] Theorem 4.1.

#thm([Proposition 3.3.])[
  #emph[Let $A$ be a compact connected Kähler manifold and $Z subset A$ a nonempty closed connected complex submanifold of complex codimension $c gt.eq 2$. The complex blow-up $pi : hat(A) arrow.r A$ is compact, connected, and Kähler. If $A$ is simply connected, then $hat(A)$ is simply connected. For every integer $i$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ H_i \( hat(A) \; upright(bold(Z)) \) tilde.equiv H_i \( A \; upright(bold(Z)) \) xor xor.big_(j = 1)^(c - 1) H_(i - 2 j) \( Z \; upright(bold(Z)) \) \, $ <geo:blowup-homology>]

 where homology in negative degrees is zero.]
] <geo:blowup>

#proof[
  Write $nu$ for the complex normal bundle of $Z$ in $A$. Locally the blow-up replaces a normal vector by a line together with a vector on that line. It is a smooth complex manifold, and $pi$ is a proper holomorphic map that is an isomorphism away from $Z$. The exceptional divisor is $E_Z = bb(P) \( nu \)$, with projection $rho : E_Z arrow.r Z$; its normal line bundle is the tautological bundle $cal(O)_(E_Z) \( - 1 \)$. The local description gives connectedness, and properness over compact $A$ gives compactness.
  For Kählerness, let $omega_A$ be a Kähler form on $A$. A Hermitian metric on $nu$ induces a metric on $cal(O)_(E_Z) \( 1 \)$ whose Chern curvature is positive on each projective fiber. Extend this metric to $cal(O) \( - E_Z \)$, whose restriction to $E_Z$ is $cal(O)_(E_Z) \( 1 \)$, and let $eta$ be its real Chern curvature form. The form $pi^(*) omega_A$ is semipositive. It is positive away from $E_Z$, and its kernel at a point of $E_Z$ consists precisely of the tangent directions to the projective fiber. The form $eta$ is positive on those directions. On the unit tangent bundle for any auxiliary metric, it remains positive in a neighborhood of the kernel directions; on the compact complement, $pi^(*) omega_A$ has a positive lower bound and $eta$ is bounded. It follows that
  $ pi^(*) omega_A + epsilon eta $
  is positive for all sufficiently small $epsilon > 0$. It is closed and of type $\( 1 \, 1 \)$, so it is a Kähler form.
  If $A$ is simply connected, general position in real codimension $2 c gt.eq 4$ shows that $A \\ Z$ is simply connected: paths and contracting disks can be perturbed to avoid $Z$. Every loop in $hat(A)$ can be perturbed off the real codimension two submanifold $E_Z$, and then contracts in $hat(A) \\ E_Z tilde.equiv A \\ Z$. Thus $hat(A)$ is simply connected. No assumption on the fundamental group of the center is needed.
  We prove the splitting first in integral cohomology. Let $iota : E_Z arrow.r.hook hat(A)$ be the inclusion and put $h = c_1 \( cal(O)_(E_Z) \( 1 \) \)$. The integral Leray–Hirsch theorem gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ H^k \( E_Z \; upright(bold(Z)) \) = xor.big_(j = 0)^(c - 1) h^j rho^(*) H^(k - 2 j) \( Z \; upright(bold(Z)) \) . $ <geo:exceptional-cohomology>]
  The classes $1 \, h \, dots.h \, h^(c - 1)$ restrict to an integral basis on each fiber; thus this statement does not require the base cohomology to be free. The Gysin map $iota_(*)$ raises degree by two and satisfies the self-intersection identity
  $ iota^(*) iota_(*) \( v \) = c_1 \( cal(O)_(E_Z) \( - 1 \) \) v = - h v . $
  Consequently the maps
  $ s_j : H^(k - 2 j) \( Z \; upright(bold(Z)) \) arrow.r H^k \( hat(A) \; upright(bold(Z)) \) \, #h(2em) s_j \( u \) = - iota_(*) \( h^(j - 1) rho^(*) u \) \, #h(2em) 1 lt.eq j lt.eq c - 1 \, $
  lift all the positive powers of $h$ in (3.5).
  It remains to identify the classes whose restriction to $E_Z$ has only an $h^0$ term. The map of pairs $\( hat(A) \, E_Z \) arrow.r \( A \, Z \)$ induces an isomorphism on relative cohomology: collapsing the indicated subspaces gives a homeomorphism $hat(A) \/ E_Z tilde.equiv A \/ Z$. Denote this relative cohomology isomorphism by $pi_(upright("rel"))^(*)$, and let $delta_A$ and $delta_(hat(A))$ be the connecting maps of the two pairs. If $v in H^k \( hat(A) \; upright(bold(Z)) \)$ satisfies $iota^(*) v = rho^(*) z$ for $z in H^k \( Z \; upright(bold(Z)) \)$, naturality and exactness give
  $ pi_(upright("rel"))^(*) delta_A z = delta_(hat(A)) rho^(*) z = delta_(hat(A)) iota^(*) v = 0 . $
  The relative isomorphism implies $delta_A z = 0$, so $z$ extends to $u in H^k \( A \; upright(bold(Z)) \)$. The difference $v - pi^(*) u$ restricts to zero on $E_Z$, and hence comes from $H^k \( hat(A) \, E_Z \; upright(bold(Z)) \)$. Its relative preimage corresponds under $pi_(upright("rel"))^(*)$ to a class in $H^k \( A \, Z \; upright(bold(Z)) \)$. The absolute image of that class, added to $u$, pulls back to $v$. Thus $v$ belongs to $pi^(*) H^k \( A \; upright(bold(Z)) \)$.
  Subtracting the lifts $s_j$ from an arbitrary cohomology class now shows that
  $ pi^(*) + sum_(j = 1)^(c - 1) s_j : H^k \( A \; upright(bold(Z)) \) xor xor.big_(j = 1)^(c - 1) H^(k - 2 j) \( Z \; upright(bold(Z)) \) arrow.r H^k \( hat(A) \; upright(bold(Z)) \) $
  is surjective. It is injective as well. Restriction to $E_Z$ and (3.5) first force all coefficients of the positive powers of $h$ to vanish. The remaining summand is detected by $pi^(*)$, which is injective over $upright(bold(Z))$: the map $pi$ has degree one, and the pushforward defined using integral Poincaré duality is a left inverse to $pi^(*)$. We have proved
  #[#set math.equation(numbering: n => "(3.6)")
   $ H^k \( hat(A) \; upright(bold(Z)) \) tilde.equiv H^k \( A \; upright(bold(Z)) \) xor xor.big_(j = 1)^(c - 1) H^(k - 2 j) \( Z \; upright(bold(Z)) \) . $ <geo:blowup-cohomology>]
  If $dim_(upright(bold(C))) A = n$, duality in degree $2 n - i$ turns the center summands into $H_(i - 2 c + 2 j) \( Z \; upright(bold(Z)) \)$. Replacing $j$ by $c - j$ gives (3.4). All maps and splittings were integral, so the formula includes torsion as direct summands. ◻
]

=== 3.4 The family of ninefolds <the-family-of-ninefolds>

We apply the preceding results to the centers $Z_2$ and $Z_3$ from (3.3).

#thm([Proposition 3.4.])[
  #emph[For every integer $m gt.eq 1$ there is a simply connected closed Kähler manifold $X_m$ of complex dimension nine, obtained by blowing up $upright(bold(C P))^9$ along $m$ disjoint copies of each of $Z_2$ and $Z_3$. Its integral homology is 
#[#set math.equation(numbering: n => "(3.7)")
 $ H_i \( X_m \; upright(bold(Z)) \) tilde.equiv  & H_i \( upright(bold(C P))^9 \; upright(bold(Z)) \)\
 & xor (xor.big_(r = 1)^6 H_(i - 2 r) \( Z_2 \; upright(bold(Z)) \))^(xor m)\
 & xor (xor.big_(r = 1)^4 H_(i - 2 r) \( Z_3 \; upright(bold(Z)) \))^(xor m) . $ <geo:family-homology>]

]
] <geo:family>

#proof[
  Apply Lemma 7 with $d = 4$ to the disjoint union of $m$ copies of $Z_2$ and $m$ copies of $Z_3$. It embeds all $2 m$ centers simultaneously in $upright(bold(C P))^9$. Blow up the centers successively. Because they are disjoint, each remaining center and a neighborhood of it are unchanged by the preceding blow-ups. Their complex codimensions are always seven and five. Proposition 8 preserves compactness, connectedness, Kählerness, and simple connectivity at every step, starting from $upright(bold(C P))^9$; the complex dimension remains nine. Applying (3.4) once for each center gives (3.7). ◻
]

== 4 From Morse functions to Hamiltonian fixed points <dyn:section>

The dynamical construction turns a Morse function on $X times upright(bold(C P))^1$ into a Hamiltonian diffeomorphism of $X times Y$ with four times as many fixed points. Here $Y$ will be a Kähler surface with a Hamiltonian involution whose fixed locus consists of four projective lines. We give the construction of [19] Section 4, including the argument that counts all fixed points and checks their nondegeneracy in the ambient manifold.

We use the convention

$ omega \( X_f \, thin dot.op thin \) = d f $

for the Hamiltonian vector field of a smooth function $f$. A fixed point $x$ of a diffeomorphism $Phi$ is nondegenerate when $d_x Phi - I$ is invertible. The following elementary estimate will exclude additional fixed points after a small autonomous perturbation. It is of the same type as Yorke’s lower bound on periods for Lipschitz vector fields [24]; only a positive lower bound is needed here.

#thm([Lemma 4.1.])[
  (A lower bound on nonconstant periods).  #emph[Let $V$ be a smooth vector field on a closed smooth manifold $P$, with flow $psi^s$. There is a number $tau > 0$ such that 
$ 0 < T < tau \, #h(2em) psi^T \( x \) = x quad arrow.r.double quad V \( x \) = 0 . $

]
] <dyn:short-period>

#proof[
  Choose finitely many coordinate balls covering $P$, each with closure contained in a larger coordinate ball in the same chart. Bounds on the coordinate speeds, together with the positive distances from the smaller closed balls to the boundaries of the larger balls, give $eta > 0$ such that a trajectory starting in a smaller ball stays in its larger ball for time $eta$. Choose a common positive Lipschitz constant $L$ for the coordinate expressions of $V$ on the larger balls; their coordinate images are convex and their closures may be taken compact in the charts.
  Suppose $psi^T \( x \) = x$ with $0 < T < eta$. In a chart containing the whole trajectory, write its coordinates as $y : \[ 0 \, T \] arrow.r upright(bold(R))^d$, and write $v$ for the coordinate vector field. Put
  $ m = max_(0 lt.eq t lt.eq T) \| v \( y \( t \) \) \| \, $
  and choose $t_0$ where the maximum is attained. Since $y \( T \) = y \( 0 \)$,
  $ integral_0^T v \( y \( t \) \) thin d t = 0 \, #h(2em) \| y \( t \) - y \( t_0 \) \| lt.eq T m . $
  Consequently
  $ m & = lr(|1 / T integral_0^T #scale(x: 120%, y: 120%)[\(] v \( y \( t_0 \) \) - v \( y \( t \) \) #scale(x: 120%, y: 120%)[\)] thin d t|)\
 & lt.eq L / T integral_0^T \| y \( t_0 \) - y \( t \) \| thin d t lt.eq L T m . $
  For $T < tau := min { eta \, 1 \/ L }$ this forces $m = 0$, proving the claim. ◻
]

The next proposition applies the estimate to an involution. Its fixed components are symplectic submanifolds. An invariant extension of Morse functions on those components supplies the perturbation; squaring the perturbed map will identify every one of its fixed points.

#thm([Proposition 4.2.])[
  (Perturbing a Hamiltonian involution).  #emph[Let $\( P \, omega \)$ be a closed symplectic manifold and let $g : P arrow.r P$ be a Hamiltonian diffeomorphism with $g^2 = upright("id")_P$. Write $"Fix" \( g \) = F_1 union.sq dots.h.c union.sq F_r$ for its connected fixed components. For each $j$, let $h_j : F_j arrow.r upright(bold(R))$ be a smooth Morse function. There is a smooth $g$-invariant function $f : P arrow.r upright(bold(R))$ restricting to $h_j$ on $F_j$ such that, for all sufficiently small $epsilon.alt > 0$, its Hamiltonian flow $psi^s$ satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ "Fix" \( psi^epsilon.alt compose g \) = union.sq.big_(j = 1)^r "Crit" \( h_j \) . $ <dyn:fixed-set>]

 Every fixed point in this equality is nondegenerate. Moreover, $psi^epsilon.alt compose g$ is the time-one map of a smooth one-periodic Hamiltonian. If $P$ is simply connected, all fixed-point loops along the resulting Hamiltonian path are contractible.]
] <dyn:involution>

#proof[
  Average a Riemannian metric over ${ upright("id")_P \, g }$. At a fixed point $x$, the resulting exponential chart intertwines $g$ with $d_x g$. Thus the fixed locus is locally a smooth submanifold, whose tangent space at $x$ is
  $ E_x^(+) = ker \( d_x g - I \) . $
  This local description and compactness imply that it has finitely many connected components, each a smooth closed submanifold. The involution gives the decomposition
  $ T_x P = E_x^(+) xor E_x^(-) \, #h(2em) E_x^(-) = ker \( d_x g + I \) . $
  For $u in E_x^(+)$ and $v in E_x^(-)$, symplecticity gives
  $ omega_x \( u \, v \) = omega_x \( d_x g \( u \) \, d_x g \( v \) \) = - omega_x \( u \, v \) . $
  Thus the summands are symplectically orthogonal. Since $omega_x$ is nondegenerate, its restriction to each summand is nondegenerate as well. In particular, $F_j$ is symplectic and $E_x^(-)$ is its symplectic normal space.
  Using disjoint tubular neighborhoods of the $F_j$ and smooth cutoff functions, extend the $h_j$ to a smooth function $tilde(f)$ on $P$. Set
  $ f = 1 / 2 \( tilde(f) + tilde(f) compose g \) . $
  This function is $g$-invariant and restricts to $h_j$ on $F_j$. Invariance and symplecticity imply $g_(*) X_f = X_f$, so $g$ commutes with $psi^s$. At a point $x in F_j$, invariance also implies $d_x f \( v \) = 0$ for $v in E_x^(-)$. Orthogonality of the two summands then shows that $X_f$ is tangent to $F_j$, where it is the Hamiltonian vector field of $h_j$ for $omega \|_(F_j)$. Hence
  #[#set math.equation(numbering: n => "(4.2)")
   $ x in F_j : #h(2em) X_f \( x \) = 0 quad arrow.l.r.double quad d_x h_j = 0 . $ <dyn:equilibria>]
  Put $Phi_epsilon.alt = psi^epsilon.alt compose g$. The commutation relation and $g^2 = upright("id")_P$ give
  $ Phi_epsilon.alt^2 = psi^(2 epsilon.alt) . $
  Let $tau$ be given by Lemma 10 for $X_f$, and take $2 epsilon.alt < tau$. Any fixed point $x$ of $Phi_epsilon.alt$ satisfies $psi^(2 epsilon.alt) \( x \) = x$, so the lemma gives $X_f \( x \) = 0$. The flow therefore fixes $x$ at every time, and $psi^epsilon.alt \( g \( x \) \) = x$ implies $g \( x \) = x$. Equation (4.2) now places $x$ among the prescribed critical points. Conversely, each prescribed critical point is fixed by both $g$ and $psi^epsilon.alt$. This proves (4.1).
  We next check nondegeneracy in both the tangent and the normal directions. At a point $x$ in the finite set (4.1), let $A_x = d_x X_f$ be the linearization at the equilibrium. Then
  $ d_x psi^epsilon.alt = exp \( epsilon.alt A_x \) . $
  Equivariance implies that $A_x$ commutes with $d_x g$, so it preserves $E_x^(+)$ and $E_x^(-)$. Denote its restrictions by $A_x^(+)$ and $A_x^(-)$. On $E_x^(+) = T_x F_j$, differentiating the Hamiltonian equation at the critical point gives
  $ omega_x \( A_x^(+) u \, v \) = "Hess"_x h_j \( u \, v \) . $
  The Morse condition therefore makes $A_x^(+)$ invertible. Since
  $ frac(exp \( epsilon.alt A_x^(+) \) - I, epsilon.alt) arrow.r A_x^(+) quad upright("as ") epsilon.alt arrow.r 0 \, $
  the tangent block of $d_x Phi_epsilon.alt - I$ is invertible for all sufficiently small positive $epsilon.alt$. The normal block is
  $ - exp \( epsilon.alt A_x^(-) \) - I arrow.r - 2 I \, $
  and is likewise invertible. There are finitely many prescribed critical points, so a single positive upper bound for $epsilon.alt$ ensures nondegeneracy at all of them as well as the fixed-set equality.
  Finally, choose a smooth Hamiltonian $K_s$, $0 lt.eq s lt.eq 1$, whose time-one map is $g$. Choose nonnegative smooth functions $a \, b$ with integral one and supports contained in two successive disjoint subintervals of $\( 0 \, 1 \)$. Define
  $ A \( t \) = integral_0^t a \( u \) thin d u \, #h(2em) H_epsilon.alt \( t \, x \) = a \( t \) K_(A \( t \)) \( x \) + epsilon.alt b \( t \) f \( x \) \, #h(2em) 0 lt.eq t lt.eq 1 . $
  During the support of $a$, the flow traverses the path of $K_s$ from the identity to $g$. During the later support of $b$, it follows the flow of $f$ for total time $epsilon.alt$. Thus its time-one map is $psi^epsilon.alt compose g$. Since $H_epsilon.alt$ vanishes near both endpoints of $\[ 0 \, 1 \]$, its periodic extension is smooth. If $P$ is simply connected, every fixed-point loop of this specified path is contractible. ◻
]

We now construct the surface that gives four copies of the Morse problem. Blowing up each isolated fixed point of a half-turn replaces it by a fixed projective line.

#thm([Proposition 4.3.])[
  (The surface with four fixed curves).  #emph[Let $Y$ be the complex blow-up of $upright(bold(C P))^1 times upright(bold(C P))^1$ at 
$ { 0 \, oo } times { 0 \, oo } . $

 There is a circle-invariant Kähler form $omega_Y$ for which the lifted diagonal circle action is Hamiltonian. Its half-turn $g_Y$ has fixed locus precisely the four exceptional curves $E_1 \, dots.h \, E_4$, each isomorphic to $upright(bold(C P))^1$. Along these curves, $d g_Y$ is the identity on the tangent bundle and minus the identity on the symplectic normal bundle. Moreover, $Y$ is simply connected and its integral homology is 
#[#set math.equation(numbering: n => "(4.3)")
 $ H_i \( Y \; upright(bold(Z)) \) tilde.equiv cases(delim: "{", upright(bold(Z)) \, & i = 0 \, 4 \,, upright(bold(Z))^6 \, & i = 2 \,, 0 \, & upright("otherwise") .) $ <dyn:Y-homology>]

]
] <dyn:surface>

#proof[
  In affine coordinates, the diagonal circle action on $upright(bold(C P))^1 times upright(bold(C P))^1$ is
  $ t dot.op \( z \, w \) = \( e^(2 pi i t) z \, e^(2 pi i t) w \) \, #h(2em) t in upright(bold(R)) \/ upright(bold(Z)) . $
  It preserves the four centers and therefore lifts holomorphically to $Y$. Proposition 8 shows that $Y$ is Kähler and simply connected. Average a Kähler form over the lifted circle action to obtain an invariant Kähler form $omega_Y$. If $V$ is the infinitesimal generator, Cartan’s formula gives
  $ d #scale(x: 120%, y: 120%)[\(] omega_Y \( V \, thin dot.op thin \) #scale(x: 120%, y: 120%)[\)] = cal(L)_V omega_Y = 0 . $
  As $H^1 \( Y \; upright(bold(R)) \) = 0$, there is a smooth function $k : Y arrow.r upright(bold(R))$ with $d k = omega_Y \( V \, thin dot.op thin \)$. Thus $V = X_k$, and the autonomous Hamiltonian $k \/ 2$ has time-one map $g_Y$.
  The downstairs half-turn fixes exactly the four centers. Using the coordinate $z$ near $0$ and $1 \/ z$ near $oo$ in each factor, the circle weights at the centers are
  $ \( 1 \, 1 \) \, quad \( 1 \, - 1 \) \, quad \( - 1 \, 1 \) \, quad \( - 1 \, - 1 \) . $
  For weights $\( alpha \, beta \)$ the induced action on the exceptional line is
  $ \[ z_1 : z_2 \] mapsto \[ e^(2 pi i alpha t) z_1 : e^(2 pi i beta t) z_2 \] . $
  When the signs differ this action has nonzero relative weight $beta - alpha = plus.minus 2$; in all four cases its value at $t = 1 \/ 2$ is the identity. To see the action also in the normal direction, use the local blow-up model
  $ { \( ell \, v \) : ell in upright(bold(C P))^1 \, med v in ell subset upright(bold(C))^2 } . $
  The downstairs half-turn is $v mapsto - v$, so its lift is
  $ \( ell \, v \) mapsto \( ell \, - v \) . $
  It fixes exactly the zero section, with derivative $+ I$ on its tangent space and $- I$ on its normal line. The symplectic normal space is the negative eigenspace by the orthogonality argument in Proposition 11. Away from the exceptional curves, the blow-down is an equivariant isomorphism. There are therefore no additional fixed points.
  Finally, each point blown up has complex codimension two, so (3.4) adds one free generator in degree two. The integral homology of $upright(bold(C P))^1 times upright(bold(C P))^1$ is free with ranks $\( 1 \, 2 \, 1 \)$ in degrees $\( 0 \, 2 \, 4 \)$, respectively. Four blow-ups give (4.3). ◻
]

#thm([Corollary 4.4.])[
  (Product realization).  #emph[Let $X$ be a connected closed simply connected Kähler manifold, let $omega_X$ be any Kähler form on $X$, and let $\( Y \, omega_Y \)$ be as in Proposition 12. Give $M = X times Y$ the product form $omega_X xor omega_Y$ and put $C = X times upright(bold(C P))^1$. For every smooth Morse function $h : C arrow.r upright(bold(R))$, there is a smooth one-periodic Hamiltonian $H$ on $M$ whose time-one map has only nondegenerate fixed points and satisfies 
#[#set math.equation(numbering: n => "(4.4)")
 $ \# "Fix" \( phi.alt_H^1 \) = \# "Fix"_0 \( phi.alt_H^1 \; H \) = 4 thin \# "Crit" \( h \) . $ <dyn:product-count>]

]
] <dyn:product>

#proof[
  The pullback to $M$ of $k \/ 2$ generates the Hamiltonian involution $g = upright("id")_X times g_Y$ for the given product form. Its fixed components are exactly $X times E_1 \, dots.h \, X times E_4$. Choose isomorphisms $E_j tilde.equiv upright(bold(C P))^1$ and use them to pull $h$ back to Morse functions $h_j$ on these four components. Each $h_j$ has $\# "Crit" \( h \)$ critical points. Proposition 11 applies to their induced symplectic forms and produces exactly the fixed points counted in (4.4), all nondegenerate. Finally, $M$ is simply connected, so every fixed-point loop for the constructed path is contractible. ◻
]

== 5 The integral counts and the relative deficit <sec:counts>

Let $X_m$ be the complex nine-dimensional manifold constructed in Proposition 9, and let $Y$ be the surface of Proposition 12. Set

$ C_m = X_m times upright(bold(C P))^1 \, #h(2em) M_m = X_m times Y . $

Both products are simply connected and Kähler, of real dimensions $20$ and $22$. Our task is to compare the ordinary Morse count on $C_m$ with the stable Morse count on $M_m$. By Theorem 5, this amounts to computing their quantities $lambda$.

=== 5.1 The two torsion profiles <the-two-torsion-profiles>

The ranks in Lemma 6 give $b \( S_2 \) = b \( S_3 \) = 8$. Since $upright(bold(C P))^1 times upright(bold(C P))^1$ has free homology of ranks $\( 1 \, 2 \, 1 \)$ in degrees $\( 0 \, 2 \, 4 \)$, the center $Z_3 = S_3 times upright(bold(C P))^1 times upright(bold(C P))^1$ has $b \( Z_3 \) = 32$. The integral blow-up decomposition in (3.7) therefore yields

#[#set math.equation(numbering: n => "(5.1)")
 $ b \( X_m \) = 10 + m \( 6 dot.op 8 + 4 dot.op 32 \) = 10 + 176 m . $ <counts:rank-X>]

All the homology shifts in that decomposition are even. Torsion in the surface degrees $1$ and $2$ consequently gives two separate lists, in degrees $1 + 2 j$ and $2 + 2 j$. For either list we have

#[#set math.equation(numbering: n => "(5.2)")
 $ "Tor" H_(1 + 2 j) \( X_m \; upright(bold(Z)) \) tilde.equiv "Tor" H_(2 + 2 j) \( X_m \; upright(bold(Z)) \) tilde.equiv \( upright(bold(Z)) \/ 2 \)^(m a_j) xor \( upright(bold(Z)) \/ 3 \)^(m q_j) \, $ <counts:base-profiles>]

where the finite sequences, indexed starting at $j = 1$, are

$ a = \( 2 \, 2 \, 2 \, 2 \, 2 \, 2 \) \, #h(2em) q = \( 1 \, 3 \, 4 \, 4 \, 3 \, 1 \) \, $

and all other entries are zero. To see the second sequence directly, let $u$ record a shift by two homological degrees. The product with $upright(bold(C P))^1 times upright(bold(C P))^1$ and the four blow-up shifts give

$ \( u + u^2 + u^3 + u^4 \) \( 1 + 2 u + u^2 \) = u + 3 u^2 + 4 u^3 + 4 u^4 + 3 u^5 + u^6 . $

The first sequence records six blow-up shifts of two copies of $upright(bold(Z)) \/ 2$. Equation (5.2) accounts for all torsion.

For nonnegative integers $a \, q$, the primary-generator identity (2.6) gives

#[#set math.equation(numbering: n => "(5.3)")
 $ d #scale(x: 120%, y: 120%)[\(] \( upright(bold(Z)) \/ 2 \)^a xor \( upright(bold(Z)) \/ 3 \)^q #scale(x: 120%, y: 120%)[\)] = max \( a \, q \) . $ <counts:generator-maximum>]

In particular, generator counts must be computed in each degree before summing over degrees.

If a factor $B$ has torsion-free homology concentrated in even degrees, put $e_k = "rank" H_(2 k) \( B \; upright(bold(Z)) \)$ for $k gt.eq 0$. The integral Künneth theorem replaces $a$ and $q$ by their convolutions with $e$:

$ \( e * a \)_j = sum_(k gt.eq 0) e_k a_(j - k) \, #h(2em) \( e * q \)_j = sum_(k gt.eq 0) e_k q_(j - k) . $

There are no additional Künneth torsion terms. For $C_m$ use $e = \( 1 \, 1 \)$; for $M_m$, (4.3) gives $e = \( 1 \, 6 \, 1 \)$. The resulting profiles in either degree list, divided by $m$, are shown in Table 1.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Product and primary part
], table.cell(rowspan: 1, colspan: 1)[Multiplicities in one degree list
], table.cell(rowspan: 1, colspan: 1)[Sum
]),
  table.cell(rowspan: 1, colspan: 1)[$C_m$, $2$-primary
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 4 \, 4 \, 4 \, 4 \, 4 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$24$
],
  table.cell(rowspan: 1, colspan: 1)[$C_m$, $3$-primary
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 4 \, 7 \, 8 \, 7 \, 4 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$32$
],
  table.cell(rowspan: 1, colspan: 1)[$C_m$, generators
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 4 \, 7 \, 8 \, 7 \, 4 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$34$
],
  table.cell(rowspan: 1, colspan: 1)[$M_m$, $2$-primary
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 14 \, 16 \, 16 \, 16 \, 16 \, 14 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$96$
],
  table.cell(rowspan: 1, colspan: 1)[$M_m$, $3$-primary
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 9 \, 23 \, 31 \, 31 \, 23 \, 9 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$128$
],
  table.cell(rowspan: 1, colspan: 1)[$M_m$, generators
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 14 \, 23 \, 31 \, 31 \, 23 \, 14 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$140$
],
)
]],
  caption: [Table 1: Primary torsion multiplicities and their entrywise maxima. Every displayed entry is multiplied by $m$, and the same list occurs once in odd degrees and once in even degrees. The generator row takes the maximum within each column, as in (5.3). ],
)

It follows that

#[#set math.equation(numbering: n => "(5.4)")
 $ sum_i t_i \( C_m \) & = 2 dot.op 34 m = 68 m \, & sum_i t_i \( M_m \) & = 2 dot.op 140 m = 280 m . $ <counts:torsion-totals>]

The free ranks are $b \( C_m \) = 2 b \( X_m \)$ and $b \( M_m \) = 8 b \( X_m \)$, so

#[#set math.equation(numbering: n => "(5.5)")
 $ lambda \( C_m \) = 20 + 488 m \, #h(2em) lambda \( M_m \) = 80 + 1968 m . $ <counts:lambda>]

The table also explains the sign of the gap. The total multiplicity at each individual prime is four times as large for $M_m$ as for $C_m$. However, relative to the $3$-primary row, taking the degreewise maximum adds $2 m$ generators per parity for $C_m$ and $12 m$ for $M_m$. Thus the generator count for $M_m$ exceeds four times that for $C_m$ by $\( 12 - 4 dot.op 2 \) m = 4 m$ per parity. The free-rank contributions cancel, and the two parities and the factor $2$ in $lambda$ give

#[#set math.equation(numbering: n => "(5.6)")
 $ lambda \( M_m \) - 4 lambda \( C_m \) = 2 \( 280 - 4 dot.op 68 \) m = 16 m . $ <counts:gap>]

=== 5.2 Completion of the construction <completion-of-the-construction>

#proof[
  Fix $m gt.eq 1$. Choose any Kähler form on $X_m$ and equip $M_m = X_m times Y$ with its product with the invariant form on $Y$ from Proposition 12. Theorem 5 applies to $C_m$ and $M_m$, since both are closed and simply connected and their real dimensions are at least $9$. It supplies an ordinary Morse function $h_m$ on $C_m$ with $20 + 488 m$ critical points, and it gives $"SM" \( M_m \) = 80 + 1968 m$.
  Corollary 13, applied to $X_m$ and $h_m$, produces a smooth one-periodic Hamiltonian $H_m$ on $M_m$ with precisely
  $ 4 \# "Crit" \( h_m \) = 80 + 1952 m $
  fixed points. They are all nondegenerate. Simple connectivity of $M_m$ makes every corresponding loop along $phi.alt_(H_m)^t$ contractible, so the two fixed-point counts agree.
  Finally,
  $ frac("SM" \( M_m \) - \# "Fix" \( phi.alt_(H_m)^1 \), "SM" \( M_m \)) = frac(16 m, 80 + 1968 m) = frac(m, 5 + 123 m) gt.eq 1 / 128 \, $
  where the inequality is equivalent to $m gt.eq 1$. For a given $R > 0$, take $m = max { 1 \, ceil.l \( R - 80 \) \/ 1968 ceil.r }$. Then $"SM" \( M_m \) gt.eq R$, while the dimension and $delta = 1 \/ 128$ remain fixed. ◻
]

#prodef([Remark 5.1.])[
  The total Betti numbers of $M_m$ over fields of characteristic $2$ and $3$ are respectively $80 + 1792 m$ and $80 + 1920 m$. Indeed, the universal coefficient theorem adds twice the total primary multiplicity to the integral free rank, and Table 1 gives those multiplicities. Both numbers are smaller than the fixed-point count $80 + 1952 m$. Over any field of characteristic different from $2$ and $3$, the total Betti number is $80 + 1408 m$. Thus taking a single coefficient field does not recover the integral generator count used here: the prime contributing the larger number of generators changes with the degree.
] <counts:field-bounds>

#prodef([Remark 5.2.])[
  The integral Floer bound of Bai–Xu uses homology graded modulo twice the minimal Chern number [3] Theorem A; see also [4] Corollary 1.2. The minimal Chern number $N$ is the positive generator of the nonzero subgroup $c_1 \( T M_m \) \( pi_2 \( M_m \) \) subset upright(bold(Z))$. For $M_m$ it is $1$: if $E subset Y$ is an exceptional line, then its tangent bundle has degree $2$ and its normal bundle has degree $- 1$. Thus $c_1 \( T M_m \)$ evaluates to $1$ on the sphere ${ x } times E subset M_m$. In the grading modulo $2$, all odd-degree groups are combined and all even-degree groups are combined. In either parity, Table 1 then gives primary torsion multiplicities $96 m$ and $128 m$. The minimum number of torsion generators is therefore $128 m$ in each parity. The cyclically graded integral bound is
  $ b \( M_m \) + 2 \( 128 m + 128 m \) = 80 + 1920 m \, $
  which is smaller than the fixed-point count by $32 m$. The strict gap in Theorem 1 relies on keeping the integer homological degrees separate when computing the stable Morse number.
] <counts:integral-Floer-bound>

== 6 Attaining the integral bound by handle cancellation <handle:appendix>

We prove the existence assertion in Theorem 5. Throughout, $W$ is a simply connected closed smooth $D$-manifold with $D gt.eq 9$. The argument is the classical handle proof of Smale’s theorem [23], presented here with the low-index cancellation made explicit, as in [19] Appendix A.

We use the correspondence between Morse functions and ordered handle decompositions, and the standard operations of handle slides, insertion of cancelling pairs, and cancellation. A handle of index $i$ is a copy of $D^i times D^(D - i)$ attached along $S^(i - 1) times D^(D - i)$; its belt sphere in the new boundary is ${ 0 } times S^(D - i - 1)$. A slide changes the integral basis of the handles of a fixed index by an elementary addition. Consecutive handles of indices $i$ and $i + 1$ cancel when the attaching sphere of the latter meets the belt sphere of the former transversely in one point. Attaching maps of subsequent handles are transported by these operations, so the represented manifold is unchanged. For the Morse correspondence, see [16]; for cancellation and integral basis changes, see [17] Theorems 5.4 and 7.6.

=== 6.1 Eliminating handles of index one and coindex one <eliminating-handles-of-index-one-and-coindex-one>

Start with an ordered handle decomposition. Connectedness permits the cancellation of all but one $0$-handle along a tree of $1$-handles. The dual operation leaves one $D$-handle. We now eliminate the remaining $1$-handles, allowing insertion of cancelling $2 \/ 3$ pairs, as in [17] Theorem 8.1.

Let $P$ be the union of the $0$- and $1$-handles. It retracts onto a graph, whose free generators correspond to the $1$-handles. The map $pi_1 \( partial P \) arrow.r pi_1 \( P \)$ is an isomorphism: the handles of $P$ relative to its boundary, read in reverse order, have indices $D - 1$ and $D$. Since $pi_1 \( W \) = 0$ and handles of index at least three do not change fundamental groups, the attaching words of the $2$-handles normally generate this free group.

Fix a generator. Insert a cancelling $2 \/ 3$ pair whose $2$-handle initially attaches along a trivial circle in a small ball in $partial P$. Express the chosen generator as a product of conjugates of the old attaching words and their inverses. Sliding the new $2$-handle over the old ones realizes this product: a slide is a band sum, the band path gives the conjugation, and its orientation gives the choice of word or inverse. General position allows the bands to avoid the other attaching circles; their tubular attaching regions may be shrunk.

The new attaching circle is now homotopic to a standard circle that runs once over the chosen $1$-handle and avoids the others. Choose the standard circle disjoint from the other attaching circles. In the $\( D - 1 \)$-dimensional boundary, a generic homotopy between these circles is an isotopy and avoids the other attaching circles: the expected dimensions for self-intersections or intersections with another circle in a one-parameter family are at most $3 - \( D - 1 \) < 0$. Transport the framing along this isotopy. The new $2$-handle now cancels the chosen $1$-handle, since its attaching circle meets that handle’s belt sphere once. Repetition removes all $1$-handles.

Apply the same construction to the reversed decomposition to eliminate the $\( D - 1 \)$-handles. Its inserted pairs have original indices $D - 3 \, D - 2$, so no $1$-handles are reintroduced. We have obtained one handle in each of indices $0 \, D$, none in indices $1 \, D - 1$, and all remaining handles in indices $2 \, dots.h \, D - 2$.

=== 6.2 Locating an algebraically cancellable pair <locating-an-algebraically-cancellable-pair>

The manifold $W$ is orientable. Choose orientations and let $C_(*)$ be the integral handle complex. Its boundary coefficients are algebraic intersection numbers between attaching spheres and belt spheres in the level between consecutive indices. With $B_i = "im" partial_(i + 1)$, equation (2.1) gives

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_i "rank" C_i - lambda \( W \) = 2 sum_i #scale(x: 120%, y: 120%)[\(] "rank" B_i - t_i \( W \) #scale(x: 120%, y: 120%)[\)] . $ <handle:excess>]

Each summand on the right is nonnegative. If the total number of handles exceeds $lambda \( W \)$, then $"rank" B_i > t_i \( W \)$ for some $2 lt.eq i lt.eq D - 3$; the vanishing chain groups in degrees $1 \, D - 1$ exclude other indices.

Because $C_i \/ Z_i tilde.equiv B_(i - 1)$ is free, $Z_i = ker partial_i$ is a direct summand of $C_i$. Thus the nonzero Smith invariant factors of $partial_(i + 1)$ are those of $B_i subset Z_i$. Exactly $t_i \( W \)$ of them are nonunits. The strict inequality above supplies a unit invariant factor. Row and column operations, realized by handle slides, relabeling, and orientation changes, therefore produce a boundary coefficient equal to $1$.

These slides occur in connected levels. Indeed, let $P_i$ be the union of handles of index at most $i$, and put $L = partial P_i$. The space $P_i$ is simply connected because it has no $1$-handles. Its reversed handles relative to $L$ have indices at least $D - i gt.eq 3$, so $L arrow.r P_i$ induces isomorphisms on components and fundamental groups. The same argument applies before the $i$-handles are attached. Slide paths can avoid other attaching spheres, since those spheres have codimension at least two; again their tubular regions may be shrunk.

We have found an attaching sphere $A tilde.equiv S^i$ and a belt sphere $B tilde.equiv S^(D - 1 - i)$ in the simply connected level $L$, with algebraic intersection number $1$. We next arrange that they have exactly one geometric intersection, which is the condition for handle cancellation.

=== 6.3 Removing opposite-sign intersections <removing-opposite-sign-intersections>

Suppose first that $i gt.eq 3$ and $D - 1 - i gt.eq 3$. Join two opposite-sign intersections of $A$ and $B$ by an arc in each sphere, avoiding the other intersection points. The resulting Whitney circle bounds a disk because $L$ is simply connected. The high-dimensional Whitney trick removes the pair [17] Theorem 6.6. Both sphere dimensions are at least three, so general position keeps the interior of the Whitney disk away from all attaching spheres of the $\( i + 1 \)$-handles and all belt spheres of the $i$-handles. The move preserves every other intersection at this level. Repeating leaves just one intersection of $A$ and $B$.

When one sphere has dimension two, reverse the decomposition if necessary so that $i = 2$. The level $L$ is then the boundary after attaching the $2$-handles to the single $0$-handle. Denote all their belt spheres by $B_1 \, dots.h \, B_h$, and set

$ V = L \\ union.big_(j = 1)^h B_j . $

We will remove a pair of intersections by moving a small disk in $A$ into $V$. The special geometry of this complement makes that possible.

The boundary $L$ is obtained from $S^(D - 1)$ by surgery on the attaching circles. Each surgery replaces $S^1 times D^(D - 2)$ by $D^2 times S^(D - 3)$; removing its belt sphere leaves $\( D^2 \\ { 0 } \) times S^(D - 3)$. This piece retracts onto its attaching boundary $S^1 times S^(D - 3)$. Therefore $V$ has the homotopy type of the exterior of the original attaching circles in $S^(D - 1)$. That exterior is simply connected: every loop bounds a disk in the sphere, and general position makes the disk disjoint from the circles. The complement of the circles retracts onto their exterior by radial retraction in tubular neighborhoods. We have proved

#[#set math.equation(numbering: n => "(6.2)")
 $ pi_1 \( V \) = pi_1 \( L \) = 0 . $ <handle:complement-pi1>]

Choose two opposite-sign intersections of the attaching sphere $A tilde.equiv S^2$ with one chosen belt sphere. A thin disk $Delta subset A$ surrounding an arc between them contains just these two intersections and misses all other belt spheres. Its boundary, and an exterior collar in $A$, lie in $V$. The oriented normal bundle of each belt sphere has rank two. Excision and the Thom isomorphism give

#[#set math.equation(numbering: n => "(6.3)")
 $ H_2 \( L \, V \; upright(bold(Z)) \) tilde.equiv xor.big_(j = 1)^h upright(bold(Z)) \, $ <handle:intersection-group>]

with coordinates given by intersection numbers with the $B_j$. All coordinates of $\[ Delta \]$ vanish, so $\[ Delta \] = 0$.

This homological vanishing supplies a relative homotopy, without any assumption on $pi_2 \( L \)$. Indeed, (6.2) and the exact sequences of the pair identify

$ pi_2 \( L \, V \) & tilde.equiv "coker" #scale(x: 120%, y: 120%)[\(] pi_2 \( V \) arrow.r pi_2 \( L \) #scale(x: 120%, y: 120%)[\)] \,\
H_2 \( L \, V \; upright(bold(Z)) \) & tilde.equiv "coker" #scale(x: 120%, y: 120%)[\(] H_2 \( V \; upright(bold(Z)) \) arrow.r H_2 \( L \; upright(bold(Z)) \) #scale(x: 120%, y: 120%)[\)] . $

The degree-two Hurewicz isomorphisms for $V$ and $L$ identify these cokernels. Hence $Delta$ can be homotoped into $V$ through maps whose boundary stays in $V$. Extend this boundary motion across the exterior collar, fixing its outer edge. We obtain a homotopy of $A$ supported in the disk and collar; at the endpoint it removes the chosen pair and preserves all other intersections with the belt spheres.

Finally this homotopy may be chosen to be an isotopy of the attaching sphere. Smooth it relative to the initial sphere and its stationary part, and apply parametric general position. For a one-parameter family of maps of a $2$-sphere into the $\( D - 1 \)$-manifold $L$, the expected dimension of self-intersections, or intersections with another attaching $2$-sphere, is at most

$ 2 + 2 + 1 - \( D - 1 \) < 0 . $

The same general-position argument makes every map in the family an immersion. Since $D - 1 gt.eq 8$, the relative version applies with ample dimension to spare. At the endpoint, the altered disk and collar form a compact subset of the open set $V$, so a sufficiently small approximation preserves their avoidance of all belt spheres. Keep neighborhoods of the other transverse intersections stationary. Intermediate intersections with belt spheres impose no restriction on an isotopy of an attaching sphere. Isotopy extension transports the framing, while the other attaching tubes can be shrunk to remain disjoint. Repetition leaves exactly one intersection with the chosen belt sphere.

=== 6.4 Finishing the count <finishing-the-count>

The chosen $i$-handle may now be ordered last among the $i$-handles, and the chosen $\( i + 1 \)$-handle first among the $\( i + 1 \)$-handles. They are consecutive and cancel. Intersections with other handles do not obstruct this operation; their attaching maps are carried along by the cancellation diffeomorphism. No handles of indices $1 \, D - 1$ are introduced.

Each cancellation decreases the total count by two. Whenever that count exceeds $lambda \( W \)$, equation (6.1) supplies another pair to which the preceding argument applies. The process therefore ends with exactly $lambda \( W \)$ handles. Equality in (6.1) forces $"rank" B_i = t_i \( W \)$ for every $i$; substituting in (2.1) gives

$ "rank" C_i = r_i \( W \) + t_i \( W \) + t_(i - 1) \( W \) . $

The Morse function associated with this decomposition has precisely these index counts, proving Theorem 5.

#heading(level: 1)[References]
#bibitem([1])[M.~Abouzaid and A.~J. Blumberg, #emph[Arnold conjecture and Morava $K$-theory], preprint (2021), #link("https://arxiv.org/abs/2103.01507")[arXiv:2103.01507].]
#bibitem([2])[V.~I. Arnol'd, #emph[First steps in symplectic topology], Russian Math. Surveys #strong[41] (1986), no.~6, 1--21. #link("https://doi.org/10.1070/RM1986v041n06ABEH004221")[doi:10.1070/RM1986v041n06ABEH004221].]
#bibitem([3])[S.~Bai and G.~Xu, #emph[Arnold conjecture over integers], preprint (2022), #link("https://arxiv.org/abs/2209.08599")[arXiv:2209.08599].]
#bibitem([4])[S.~Bai and G.~Xu, #emph[Integral Hamiltonian Floer theory: Foundations], preprint (2026), #link("https://arxiv.org/abs/2606.15847")[arXiv:2606.15847].]
#bibitem([5])[T.~Blomme, #emph[Gromov--Witten invariants of bielliptic surfaces], J. London Math. Soc. (2) #strong[111] (2025), no.~2, e70081. #link("https://doi.org/10.1112/jlms.70081")[doi:10.1112/jlms.70081].]
#bibitem([6])[C.~C. Conley and E.~Zehnder, #emph[The Birkhoff--Lewis fixed point theorem and a conjecture of V.~I. Arnold], Invent. Math. #strong[73] (1983), no.~1, 33--49. #link("https://doi.org/10.1007/BF01393824")[doi:10.1007/BF01393824].]
#bibitem([7])[M.~Damian, #emph[On the stable Morse number of a closed manifold], Bull. London Math. Soc. #strong[34] (2002), no.~4, 420--430. #link("https://doi.org/10.1112/S0024609301008955")[doi:10.1112/S0024609301008955].]
#bibitem([8])[G.~Dimitroglou Rizell and R.~Golovko, #emph[The number of Hamiltonian fixed points on symplectically aspherical manifolds], in #emph[Proceedings of the Gökova Geometry-Topology Conference 2016], Gökova Geometry-Topology Conference (GGT), Gökova, 2017, pp.~138--150. #link("https://arxiv.org/abs/1609.04776v2")[arXiv:1609.04776v2].]
#bibitem([9])[H.~Duan and B.~Li, #emph[Topology of blow-ups and enumerative geometry], preprint (2009), revised 2016, #link("https://arxiv.org/abs/0906.4152v7")[arXiv:0906.4152v7].]
#bibitem([10])[A.~Floer, #emph[Symplectic fixed points and holomorphic spheres], Comm. Math. Phys. #strong[120] (1989), no.~4, 575--611. #link("https://doi.org/10.1007/BF01260388")[doi:10.1007/BF01260388].]
#bibitem([11])[K.~Fukaya and K.~Ono, #emph[Arnold conjecture and Gromov--Witten invariant], Topology #strong[38] (1999), no.~5, 933--1048. #link("https://doi.org/10.1016/S0040-9383(98)00042-1")[doi:10.1016/S0040-9383(98)00042-1].]
#bibitem([12])[R.~Golovko, #emph[On variants of Arnold conjecture], Arch. Math. (Brno) #strong[56] (2020), no.~5, 277--286. #link("https://doi.org/10.5817/AM2020-5-277")[doi:10.5817/AM2020-5-277].]
#bibitem([13])[R.~Hartshorne, #emph[Algebraic Geometry], Graduate Texts in Mathematics, vol.~52, Springer-Verlag, New York--Heidelberg, 1977. #link("https://doi.org/10.1007/978-1-4757-3849-0")[doi:10.1007/978-1-4757-3849-0].]
#bibitem([14])[H.~Hofer and D.~A. Salamon, #emph[Floer homology and Novikov rings], in #emph[The Floer Memorial Volume], H.~Hofer, C.~H. Taubes, A.~Weinstein, and E.~Zehnder (eds.), Progress in Mathematics, vol.~133, Birkhäuser, Basel, 1995, pp.~483--524. #link("https://doi.org/10.1007/978-3-0348-9217-9_20")[doi:10.1007/978-3-0348-9217-9\_20].]
#bibitem([15])[G.~Liu and G.~Tian, #emph[Floer homology and Arnold conjecture], J. Differential Geom. #strong[49] (1998), no.~1, 1--74. #link("https://doi.org/10.4310/jdg/1214460936")[doi:10.4310/jdg/1214460936].]
#bibitem([16])[J.~Milnor, #emph[Morse Theory], Annals of Mathematics Studies, vol.~51, Princeton University Press, Princeton, NJ, 1963.]
#bibitem([17])[J.~Milnor, #emph[Lectures on the $h$-Cobordism Theorem], notes by L.~Siebenmann and J.~Sondow, Princeton University Press, Princeton, NJ, 1965.]
#bibitem([18])[K.~Ono, #emph[On the Arnold conjecture for weakly monotone symplectic manifolds], Invent. Math. #strong[119] (1995), 519--537. #link("https://doi.org/10.1007/BF01245191")[doi:10.1007/BF01245191].]
#bibitem([19])[OpenAI, #emph[Hamiltonian Fixed Points Below the Stable Morse Number], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Hamiltonian-Fixed-Points-Below-the-Stable-Morse-Number-October-5-2026/paper.pdf")[OAI:Hamiltonian-Fixed-Points-Below-the-Stable-Morse-Number-October-5-2026], 2026.]
#bibitem([20])[S.~Pöder Balkeståhl, #emph[Simple homotopy type of the Hamiltonian Floer complex], preprint (2021), #link("https://arxiv.org/abs/2110.10592")[arXiv:2110.10592].]
#bibitem([21])[Y.~Ruan, #emph[Virtual neighborhoods and pseudo-holomorphic curves], Turkish J. Math. #strong[23] (1999), no.~1, 161--232.]
#bibitem([22])[F.~Serrano, #emph[The Picard group of a quasi-bundle], Manuscripta Math. #strong[73] (1991), no.~1, 63--82.]
#bibitem([23])[S.~Smale, #emph[A survey of some recent developments in differential topology], Bull. Amer. Math. Soc. #strong[69] (1963), 131--145. #link("https://doi.org/10.1090/S0002-9904-1963-10901-5")[doi:10.1090/S0002-9904-1963-10901-5].]
#bibitem([24])[J.~A. Yorke, #emph[Periods of periodic solutions and the Lipschitz constant], Proc. Amer. Math. Soc. #strong[22] (1969), no.~2, 509--512. #link("https://doi.org/10.1090/S0002-9939-1969-0245916-7")[doi:10.1090/S0002-9939-1969-0245916-7].]


