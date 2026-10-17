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

#align(center)[#text(size: 16pt, weight: "bold")[Equidistribution of primitive quartic torus packets \
for arbitrary orders]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Ideal classes in a totally real number field give compact orbits of a diagonal group on a space of lattices. A natural arithmetic question is whether the finite collections of orbits obtained in this way become uniformly distributed as their discriminants grow. We prove this for the complete packets attached to invertible ideals of every order in a primitive totally real quartic field. The order may have arbitrarily large index in the ring of integers.

Let

$ X_4 = upright("SL")_4 \( bb(Z) \) without upright("SL")_4 \( bb(R) \) $

be the space of covolume-one row lattices in $bb(R)^4$, and let $m_4$ be its invariant probability measure. Put

$ H_4 = { u in bb(R)^4 : u_1 + u_2 + u_3 + u_4 = 0 } \, #h(2em) A_4 = { "diag" \( e^(u_1) \, e^(u_2) \, e^(u_3) \, e^(u_4) \) : u in H_4 } . $

The group $A_4$ acts on $X_4$ by right multiplication. Its Haar measure is $d u_1 thin d u_2 thin d u_3$, with $u_4 = - u_1 - u_2 - u_3$.

A quartic field $K$ is #emph[primitive] if it has no field strictly between $bb(Q)$ and $K$. Let $K$ be primitive and totally real, let $cal(O) subset.eq cal(O)_K$ be an order, and fix an ordering $sigma = \( sigma_1 \, dots.h \, sigma_4 \)$ of its real embeddings. Here an order is a full-rank subring containing $1$. A fractional $cal(O)$-ideal $I$ is #emph[proper] if its multiplier order ${ a in K : a I subset.eq I }$ is $cal(O)$, and it is #emph[invertible] if $I J = cal(O)$ for some fractional $cal(O)$-ideal $J$. The ordinary ideal class group $"Pic" \( cal(O) \)$ consists of proper invertible fractional $cal(O)$-ideals modulo $I tilde.op a I$ for $a in K^times$.

For such an ideal put

#[#set math.equation(numbering: n => "(1.1)")
 $ Lambda_(I \, sigma) = "covol" \( sigma \( I \) \)^(- 1 \/ 4) sigma \( I \) in X_4 . $ <eq:intro-lattice>]

A covolume-one lattice is represented here by any positively oriented basis; two such bases differ by an element of $upright("SL")_4 \( bb(Z) \)$. Let $W_(upright("all"))$ be the sixteen diagonal matrices with entries in ${ 1 \, - 1 }$. Choose one ideal in each ordinary class and form the finite set of distinct orbits

$ cal(P)_(cal(O) \, sigma) = { Lambda_(I \, sigma) w A_4 : I upright(" a class representative") \, med w in W_(upright("all")) } . $

A matrix in $W_(upright("all"))$ acts on the underlying lattice, so a sign matrix of determinant $- 1$ also gives a point of $X_4$. Using all signs makes the set independent of the chosen ordinary ideal representatives. Every orbit is compact by the unit theorem; Section 2 proves these assertions and describes the associated measure.

For an orbit $cal(Y) in cal(P)_(cal(O) \, sigma)$, let $nu_(cal(Y))$ be its invariant probability and let $"vol" \( cal(Y) \)$ be its volume for the specified Haar measure. Define

#[#set math.equation(numbering: n => "(1.2)")
 $ mu_(cal(O) \, sigma) = frac(sum_(cal(Y) in cal(P)_(cal(O) \, sigma)) "vol" \( cal(Y) \) nu_(cal(Y)), sum_(cal(Y) in cal(P)_(cal(O) \, sigma)) "vol" \( cal(Y) \)) . $ <eq:intro-measure>]

Each distinct orbit occurs once in these sums.

#thm([Theorem 1.1.])[
  #emph[Let $\( K_i \, cal(O)_i \, sigma_i \)$ be any sequence in which $K_i$ is a primitive totally real quartic field, $cal(O)_i$ is an order in $K_i$, and $sigma_i$ is an ordering of its real embeddings. If $\| "Disc" \( cal(O)_i \) \| arrow.r oo$, then 
$ integral_(X_4) f thin d mu_(cal(O)_i \, sigma_i) arrow.r integral_(X_4) f thin d m_4 #h(2em) upright("for every ") f in C_c \( X_4 \) . $

 There is no escape of mass: for every $epsilon > 0$ there is a compact $cal(K) subset X_4$ such that $mu_(cal(O)_i \, sigma_i) \( cal(K) \) gt.eq 1 - epsilon$ for all sufficiently large $i$.]
] <thm:main>

In particular, the field may remain fixed while the order index tends to infinity. The packet in Theorem 1 uses every class in $"Pic" \( cal(O) \)$, so its ideals are locally free of rank one over the specified order. The proof uses this complete class average in both of its counting arguments.

=== 1.1 History and context <history-and-context>

For real quadratic fields, compact diagonal orbits are closed geodesics on the modular surface. Linnik’s ergodic method and Skubenko’s theorem for positive discriminants established arithmetic distribution under the condition $(d / p) = 1$ for the discriminant $d$ at a fixed odd prime $p$ #cite(label("Linnik1968")) #cite(label("Skubenko1962")). Using Iwaniec’s estimates for half-integral weight forms #cite(label("Iwaniec1987")), Duke removed that restriction for the geodesic collections associated with positive fundamental discriminants #cite(label("Duke1988")) Theorem 1. Chelluri extended the corresponding statement to the unit tangent bundle, as recorded in #cite(label("ELMV2012")) Section 1.2, p. 253. Einsiedler, Lindenstrauss, Michel, and Venkatesh later gave a proof using entropy for all positive nonsquare order discriminants #cite(label("ELMV2012")) Theorem 2.3.

In higher degree the diagonal group has higher rank, and the arithmetic packets lie in spaces of higher-dimensional lattices. Einsiedler, Lindenstrauss, Michel, and Venkatesh developed the discriminant and volume framework connecting separation of periodic torus orbits to entropy #cite(label("ELMV2009")). Their cubic theorem proves equidistribution of packets that include those arising from nonmaximal totally real cubic orders #cite(label("ELMV2011")) Theorem 1.4. The local homothety class of a lattice is part of their packet data; a multiplier order alone need not specify it #cite(label("ELMV2011")) Section 5.5. Their higher-dimensional discussion also identifies the possibility of proper intermediate homogeneous limits #cite(label("ELMV2011")) Section 1.6.3. The theorem of Einsiedler, Katok, and Lindenstrauss makes a diagonal-ergodic probability with positive entropy homogeneous #cite(label("EKL2006")) Theorem 1.3; in prime dimension at least three its homogeneous conclusion is already Haar #cite(label("EKL2006")) Corollary 1.4.

For each fixed prime $p gt.eq 5$, Lemke Oliver, Thorner, and Zaman proved equidistribution for the orbit collections attached to orders in totally real degree-$p$ fields as the order discriminant grows, outside an exceptional set containing $O_(p \, epsilon) \( Q^epsilon \)$ fields of field discriminant at most $Q$ #cite(label("LOTZ2024")) Theorem 2.3. The separate preprint #cite(label("PrimeDegreePackets")) Theorem 1.1 treats every packet in each fixed prime degree at least five and permits arbitrary local module types. We adapt its ordinary-vector method in the argument below. For quartic packets, Khayutin obtained entropy bounds for probability weak-$*$ limits of maximal-order packet measures with two-transitive Galois groups, including the primitive quartic types $frak(A)_4$ and $S_4$ #cite(label("Khayutin2019Tori")) Theorem 1.1. Wieser and Yang obtain entropy bounds for certain maximal-order quartic packets whose fields have a quadratic subfield, under further hypotheses #cite(label("WieserYang2026")). The present argument must establish tightness and positive entropy in almost every diagonal-ergodic component for arbitrary orders, and then exclude the proper homogeneous limits allowed in degree four.

The arithmetic use of a sieve to rule out intermediate algebraic limits has a precedent in Khayutin’s work on joint distributions of CM points #cite(label("Khayutin2019CM")). Local Fourier analysis for nonmaximal orders already appears in the cubic work of Einsiedler, Lindenstrauss, Michel, and Venkatesh #cite(label("ELMV2011")) Proposition 9.9. Here the object being transformed is a specific quadratic product map on an exterior lattice. The resulting estimate controls arbitrary conductor depth in a cubic-resolvent count, before the remaining multiplicative weights are inserted by a sieve.

=== 1.2 The two counts and the conductor estimate <the-two-counts-and-the-conductor-estimate>

Write

$ R = cal(O)_K \, #h(2em) D = \| "Disc" \( K \) \| \, #h(2em) q = \[ R : cal(O) \] \,\
X = q sqrt(D) = sqrt(\| "Disc" \( cal(O) \) \|) \, #h(2em) kappa = "Res"_(s = 1) zeta_K \( s \) . $

We also write $a_K \( n \)$ for the number of nonzero integral $R$-ideals of norm $n$. Both counting arguments preserve the factor $sqrt(D) thin kappa$ that normalizes the packet after its finite local labels are averaged.

Sections 2 and 3 treat ordinary lattice vectors. An invertible $cal(O)$-ideal is locally a unit translate of $cal(O)$ inside a maximal-order ideal. Averaging those translates gives an exact unfolding into a weighted sum over integral $R$-ideals. A local moment bound controls the order index, while Stark’s exceptional-zero result and the absence of a quadratic subfield retain the residue $kappa$ in the ideal count. Counting short vectors proves tightness. Counting vectors in boxes away from the coordinate hyperplanes gives an $O \( r^4 \)$ bound for radius-$r$ neighborhoods in $X_4$, uniformly on each compact set of centers in every probability limit. For a diagonal flow with distinct weights, a two-sided tube is covered by $O \( r^(- 3) \)$ such neighborhoods with centers in a fixed compact enlargement, where $r$ decreases exponentially with the tube length. The resulting exponential decay also holds for normalized averages over sets of $A_4$-ergodic components with positive measure, because they are dominated by a multiple of the limit measure. This forces positive entropy in almost every component.

Section 4 applies measure classification and identifies the remaining obstruction. A proper positive-entropy component has two coordinate blocks of dimension two. Each lattice in its supporting orbit then has a vector in its exterior square supported on the two opposite coordinates $i j$ and $k l$, with both coefficients nonzero. There are three choices of the partition $i j \| k l$.

For an exterior vector $v = \( v_(i j) \)_(i < j)$, the positive diagonal action preserves the three signed products

$ \( v_12 v_34 \, thin - v_13 v_24 \, thin v_14 v_23 \) . $

Their sum is an integer on the exterior square of a unimodular lattice. For the arithmetic lattices in our packets, Section 5 places the products in the three embeddings of a cubic resolvent field $F$. Fixing their sum at a nonzero integer $m$ puts them on a trace-$m$ plane. If the four exterior coordinates outside $i j \, k l$ have size at most $r$, two product coordinates have size at most $r^2$. Thus the geometric obstruction is tested by a rectangle of area $O \( r^4 \)$ on that plane. Theorem 19 supplies the corresponding arithmetic rectangle bound, with the multiplicity of every product and the packet normalization included.

The main new work lies in proving that bound uniformly in $cal(O)$. At primes dividing $D q$, the difficult local factors in the multiplicity are given by the density of the pushforward of Haar measure on the exterior square of the order lattice, with a unit scalar, under the quadratic product map. Its exact fiber measure accounts for ramification and for the order index. An element of $F$ acts on each opposite-coordinate plane by the value of the corresponding real embedding; the resulting action descends to the rational exterior space $and.big_(bb(Q))^2 K$. The elements preserving $and.big_(bb(Z))^2 cal(O)$ form an order $C_F$. Its discriminant is bounded below by a fixed positive power of $X$ and above by a fixed power of $X$, even if the field $F$ remains fixed.

Section 6 analyzes these densities through their quadratic Fourier transforms. Denominator ideals organize the frequencies; the stabilizer order controls the decay of the Fourier coefficients and the support and size of the corresponding inverse transforms. The local proof is expressed in terms of the quadratic lattice, its action by a cubic étale algebra, and its stabilizer order, a formulation suitable for analogous cubic-resolvent counts. In Section 7, Poisson summation gives the trace density from scalar frequencies. Complementary estimates control the total nonscalar contribution using discriminant separation, bounds for the Fourier and inverse transforms, and congruences supplied by inverse quadratic forms. The estimate is uniform for small residue moduli and for shrinking rectangles.

At the remaining primes, elementary valuation records give a local factor with mean $1 + \( a_K \( p \) - 1 \) \/ p + O \( p^(- 2) \)$. Section 8 averages these factors by a weighted Selberg sieve. The subtraction of $1$ in the local mean removes the logarithm in the prime-sum bound, leaving $kappa$. Finally, Section 9 unfolds exterior vectors along the diagonal group. The fiber lengths are logarithmic and summable over the rectangles above. The resulting $O \( r^4 \)$ bound excludes every proper homogeneous component and proves Theorem 1.

=== 1.3 Conventions <conventions>

The notation $"N"_(E \/ k)$ denotes the algebraic field norm. Ideal norms $"N" \( frak(a) \)$ are positive absolute norms, extended multiplicatively to fractional ideals; absolute values are written explicitly for field norms when needed. For a rational prime $p$, a subscript $p$ denotes tensoring a field with $bb(Q)_p$ or a lattice with $bb(Z)_p$. For a prime $frak(p)$ or $frak(q)$ of a local field we use the integer valuation with value $1$ on a uniformizer, and write $e$ and $f$ for its ramification index and residue degree. A normalized extension of $v_p$ has $v_p \( p \) = 1$, and $\| p \|_p = p^(- 1)$. Ideal norms include the residue degrees. We use $frak(p)$ for primes of $K$ and $frak(q)$ for primes of $F$ when the two occur together.

All logarithms are natural, and $log_(+) t = max \( 0 \, log t \)$ for $t > 0$. An upper bound $X^(o \( 1 \))$ means $O_eta \( X^eta \)$ for every fixed $eta > 0$. Unless stated otherwise, constants are uniform in $K$, $cal(O)$, and the ordering of the embeddings. In the exterior estimates a nonzero trace $m$ and a bounded real region are fixed before $X$ tends to infinity; permitted dependence on them is stated in the relevant results.

== 2 Packets from arbitrary orders <sec:packets>

Fix a primitive totally real quartic field $K$, an order $cal(O) subset K$, and an ordering $sigma = \( sigma_1 \, dots.h \, sigma_4 \)$ of its real embeddings, as in Theorem 1. We describe the packet using finitely many local lattice choices above each ideal class of the maximal order. This description lets us average a containment condition at each finite prime before performing an integral at the real place. The construction is adapted from the packet model in #cite(label("PrimeDegreePackets")) Section 2, Lemma 2.1; we give the argument with all sixteen sign patterns in degree four.

Throughout the paper put

#[#set math.equation(numbering: n => "(2.1)")
 $ R = cal(O)_K \, #h(2em) D = \| "Disc" \( K \) \| \, #h(2em) q = \[ R : cal(O) \] \, #h(2em) X = q sqrt(D) \, #h(2em) kappa = "Res"_(s = 1) zeta_K \( s \) . $ <eq:pkt-scale>]

In particular, $\| "Disc" \( cal(O) \) \| = q^2 D = X^2$. Absolute ideal norms are extended multiplicatively to fractional $R$-ideals. Thus

#[#set math.equation(numbering: n => "(2.2)")
 $ "covol" \( sigma \( I \) \) = sqrt(D) thin "N" I $ <eq:pkt-covolume>]

for every nonzero fractional $R$-ideal $I$: this is the defining discriminant identity for $I = R$, follows by index for integral $I$, and then follows for fractional $I$ after multiplication by an integer. For a full $bb(Z)$-lattice $J subset K$, write $J_p = J ⊗_(bb(Z)) bb(Z)_p$, and put

$ K_p = K ⊗_(bb(Q)) bb(Q)_p \, #h(2em) R_p = R ⊗_(bb(Z)) bb(Z)_p \, #h(2em) cal(O)_p = cal(O) ⊗_(bb(Z)) bb(Z)_p . $

Here $K_p$ is a product of finite extensions of $bb(Q)_p$, and $R_p$ is the product of their integer rings. We use the usual arithmetic of fractional ideals in the Dedekind domain $R$; see #cite(label("MilneANT")) Theorems 3.7, 3.20, and 3.29.

=== 2.1 The finite local choices <the-finite-local-choices>

Choose one fractional $R$-ideal $I$ in each ordinary ideal class of $R$. Write $h_K$ for the number of these classes. At every prime choose a generator

$ I_p = xi_p R_p \, #h(2em) xi_p in K_p^times . $

Such a generator exists because each component of $R_p$ is a discrete valuation ring. Let $cal(L)_(cal(O)) \( I \)$ be the set of full lattices $L subset I$ whose completions have the form

#[#set math.equation(numbering: n => "(2.3)")
 $ L_p = xi_p t_p cal(O)_p \, #h(2em) t_p in R_p^times quad upright("for every ") p . $ <eq:pkt-local-choices>]

Replacing $xi_p$ by another generator merely changes $t_p$ by a unit, so this set does not depend on the chosen generators.

#thm([Lemma 2.1.])[
  #emph[The set $cal(L)_(cal(O)) \( I \)$ is finite, and its cardinality is 
#[#set math.equation(numbering: n => "(2.4)")
 $ N_(cal(O)) = product_(p divides q) \[ R_p^times : cal(O)_p^times \] \, $ <eq:pkt-label-count>]

 independently of $I$. Its members satisfy 
$ \[ I : L \] = q \, #h(2em) R L = I \, $

 and are proper invertible fractional $cal(O)$-ideals. Every ordinary class of proper invertible fractional $cal(O)$-ideals is represented, up to multiplication by $K^times$, by a member of one of the sets $cal(L)_(cal(O)) \( I \)$. Uniform probability on $cal(L)_(cal(O)) \( I \)$ is induced by independent normalized Haar probabilities for $t_p in R_p^times$.]
] <lem:pkt-local-labels>

#proof[
  The additive group $R \/ cal(O)$ has order $q$, so $q R subset cal(O)$. For every $p$ and every unit $t_p$, it follows that
  $ q I_p = xi_p t_p q R_p subset xi_p t_p cal(O)_p subset I_p . $
  At $p divides.not q$ the middle lattice is $I_p$. At the remaining primes its image is a submodule of the finite module $I_p \/ q I_p$. The primary decomposition of $I \/ q I$ identifies its $p$-primary part with $I_p \/ q I_p$. Thus a choice of these local submodules patches to a unique subgroup of $I \/ q I$, and its inverse image in $I$ is the unique lattice with the prescribed completions.
  The stabilizer of $cal(O)_p$ under multiplication by $R_p^times$ is exactly $cal(O)_p^times$. Indeed, $t_p cal(O)_p = cal(O)_p$ implies that both $t_p$ and $t_p^(- 1)$ belong to $cal(O)_p$, by applying the equality and its inverse to $1$. The converse is immediate. The local choices therefore form the finite homogeneous space $R_p^times \/ cal(O)_p^times$. Its invariant probability is uniform and is the image of normalized unit Haar measure. Patching over the finitely many primes dividing $q$ proves Equation (2.4) and the assertion about probabilities. The index of the lattice in Equation (2.3) is $\[ R_p : cal(O)_p \]$, and its $R_p$-span is $I_p$ because $1 in cal(O)_p$. Taking products of the indices and comparing all completions gives $\[ I : L \] = q$ and $R L = I$.
  We record why the local condition describes exactly invertible ideals of the order. A full fractional $cal(O)$-ideal $J$ is invertible if and only if
  #[#set math.equation(numbering: n => "(2.5)")
   $ J_p = eta_p cal(O)_p quad upright("for some ") eta_p in K_p^times quad upright("at every ") p . $ <eq:pkt-local-principality>]
  For the forward implication, complete an equality $J J^(- 1) = cal(O)$. The resulting equality over $cal(O)_p$ expresses $1$ as a finite sum $sum_i a_i b_i$, with $a_i in J_p$ and $b_i in J_p^(- 1)$. At each maximal ideal $frak(m)$ of the semilocal ring $cal(O)_p$, some $a_i b_i$ is a unit after localization, and that $a_i$ generates $\( J_p \)_(frak(m))$. To obtain one generator for all the maximal ideals, choose such an $a_(frak(m))$ for each $frak(m)$, and use the Chinese remainder theorem #cite(label("MilneANT")) Theorem 1.14 to choose $c_(frak(m)) in cal(O)_p$ congruent to $1$ at $frak(m)$ and to $0$ at every other maximal ideal. Then $eta_p = sum_(frak(m)) c_(frak(m)) a_(frak(m))$ generates $\( J_p \)_(frak(m))$ modulo $frak(m)$ at each $frak(m)$; Nakayama’s lemma #cite(label("MilneANT")) Lemma 1.9 shows that it generates each localization. Hence it generates $J_p$. Since $J_p$ spans $K_p$ over $bb(Q)_p$, $eta_p$ has no zero component and lies in $K_p^times$.
  Conversely, define
  $ J^(- 1) = { a in K : a J subset cal(O) } . $
  This definition commutes with completion: after choosing $bb(Z)$-bases of $J$ and $cal(O)$, the containment is a finite collection of integrality conditions on the coordinates of multiplication by $a$, and the same conditions over $bb(Z)_p$ describe the completed lattice. Under Equation (2.5) we therefore have $\( J^(- 1) \)_p = eta_p^(- 1) cal(O)_p$. Consequently $\( J J^(- 1) \)_p = cal(O)_p$ for every $p$, which implies $J J^(- 1) = cal(O)$. This proves the equivalence. It also proves properness: if $a J subset J$ for an invertible $J$, multiplication by $J^(- 1)$ gives $a cal(O) subset cal(O)$, and hence $a in cal(O)$. Thus its multiplier order is $cal(O)$.
  The lattices in Equation (2.3) are stable under $cal(O)_p$ at every prime, so comparison of completions shows that $cal(O) L subset L$. They are therefore fractional $cal(O)$-ideals satisfying Equation (2.5). In the other direction, let $J$ be an invertible fractional $cal(O)$-ideal. Its $R$-span $R J$ is a fractional $R$-ideal. Multiplying $J$ by an element of $K^times$, we may arrange $R J = I$ for the chosen representative of this maximal-order class. If $J_p = eta_p cal(O)_p$, then $eta_p R_p = I_p = xi_p R_p$, so $eta_p = xi_p t_p$ for a unit $t_p in R_p^times$. Thus the resulting $J$ belongs to $cal(L)_(cal(O)) \( I \)$, as required. ◻
]

=== 2.2 Real parameters, identifications, and volume <real-parameters-identifications-and-volume>

Let $U = R^times$, and let $U^(+)$ be its totally positive subgroup. Put

$ T_oo = { v = \( v_1 \, dots.h \, v_4 \) in \( bb(R)^times \)^4 : product_i \| v_i \| = 1 } . $

We give $T_oo$ counting measure on its sixteen sign components and measure $d u_1 thin d u_2 thin d u_3$ on the logarithms $u_i = log \| v_i \|$, with $u_4 = - u_1 - u_2 - u_3$. Denote this measure by $d v$. The unit theorem #cite(label("MilneANT")) Theorems 5.1 and 5.9 says that

$ ell \( U \) = { \( log \| sigma_i \( epsilon.alt \) \| \)_(i = 1)^4 : epsilon.alt in U } $

is a full lattice in the hyperplane $sum_i u_i = 0$. Its covolume for the deleted-coordinate measure is the ordinary regulator $R_K$. Its kernel on $U$ consists of $1$ and $- 1$, since these are the roots of unity in a totally real field.

Let $cal(F)_U$ be a measurable fundamental domain for the embedded group $sigma \( U \)$ in $T_oo$. Reducing logarithms modulo $ell \( U \)$ leaves sixteen sign choices, on which the remaining kernel ${ 1 \, - 1 }$ identifies pairs of opposite signs. It follows that $"vol" \( cal(F)_U \) = 8 R_K$. The analytic class-number formula in signature $\( 4 \, 0 \)$, with two roots of unity, gives

#[#set math.equation(numbering: n => "(2.6)")
 $ h_K "vol" \( cal(F)_U \) = 8 h_K R_K = sqrt(D) thin kappa \; $ <eq:pkt-unit-volume>]

see #cite(label("MilneCFT")) Chapter V, Theorem 2.4(a).

For $L in cal(L)_(cal(O)) \( I \)$, set

$ c_I = \( X "N" I \)^(- 1 \/ 4) . $

Equations (2.2) and $\[ I : L \] = q$ show that $c_I sigma \( L \) v$ has covolume one for every $v in T_oo$. This notation denotes the corresponding row lattice, and thus a point of $X_4$, after choosing a basis of determinant one. This convention also applies when the diagonal $v$ has negative determinant.

#thm([Proposition 2.2.])[
  (Packet model and volume).  #emph[The maps 
$ \( L \, v \) mapsto c_I sigma \( L \) v #h(2em) \( L in cal(L)_(cal(O)) \( I \) \, med v in T_oo \) $

 give a bijection from the disjoint union over the chosen $I$ of the quotients by 
#[#set math.equation(numbering: n => "(2.7)")
 $ epsilon.alt : \( L \, v \) mapsto \( epsilon.alt L \, sigma \( epsilon.alt \)^(- 1) v \) \, #h(2em) epsilon.alt in U \, $ <eq:pkt-unit-action>]

 onto $union.big_(cal(Y) in cal(P)_(cal(O) \, sigma)) cal(Y) subset X_4$. Counting measure on the $L$’s times $d v$ descends to the sum of the Haar measures of those orbits. In particular, 
#[#set math.equation(numbering: n => "(2.8)")
 $ sum_(cal(Y) in cal(P)_(cal(O) \, sigma)) "vol" \( cal(Y) \) = N_(cal(O)) sqrt(D) thin kappa . $ <eq:pkt-total-volume>]

 Writing $mu_(*) = mu_(cal(O) \, sigma)$, for every nonnegative Borel function $Phi$ on $X_4$ one has 
#[#set math.equation(numbering: n => "(2.9)")
 $ integral_(X_4) Phi thin d mu_(*) = frac(1, h_K N_(cal(O)) "vol" \( cal(F)_U \)) sum_I sum_(L in cal(L)_(cal(O)) \( I \)) integral_(cal(F)_U) Phi \( c_I sigma \( L \) v \) thin d v . $ <eq:pkt-integration>]

 The identity permits infinite values on both sides.]
] <prop:pkt-model>

#proof[
  The action in Equation (2.7) preserves the parameter set, since $epsilon.alt I = I$ for $epsilon.alt in U$, and preserves its image lattice. Lemma 2 shows that every ordinary invertible $cal(O)$-ideal class occurs. If two ideals differ by multiplication by $alpha in K^times$, their normalized embedded lattices differ by the diagonal with coordinates $sigma_i \( alpha \) \/ \| "N"_(K \/ bb(Q)) \( alpha \) \|^(1 \/ 4)$, an element of $T_oo$. Finally $T_oo$ is the union of all sixteen sign translates of $A_4$. These facts prove surjectivity.
  Suppose two displayed normalized lattices coincide. After absorbing the ratio of their positive scalars, this equality gives a diagonal map carrying $sigma \( L \)$ onto $sigma \( L' \)$. Choose $0 eq.not b in L$ and let $b' in L'$ be its image. None of the four coordinates of $sigma \( b \)$ is zero. The diagonal entries must therefore be $sigma_i \( b' \) \/ sigma_i \( b \) = sigma_i \( b' \/ b \)$. The map is multiplication by $alpha = b' \/ b$, and $L' = alpha L$. Taking $R$-spans gives $I' = alpha I$. The chosen representatives then force $I' = I$ and $alpha I = I$, so $alpha in U$. The scalar normalizations are now equal, and the two parameters differ by exactly Equation (2.7). This proves injectivity, including all identifications involving signs. Equality of covolume-one row lattices is the same as equality in $X_4$: any two positively oriented bases of the same lattice differ by an element of $upright("SL")_4 \( bb(Z) \)$.
  It remains to check that this identification gives the stipulated orbit weights. Write $cal(O)^(times \, +) = cal(O)^times ∩ U^(+)$. The $U$-stabilizer of a label $L$ is $cal(O)^times$, by its multiplier order. The stabilizer of $L$ together with a sign pattern is therefore $cal(O)^(times \, +)$. This subgroup has finite index in $U$. For $q = 1$ this follows directly from $cal(O) = R$. For $q > 1$, the kernel of $U arrow.r \( R \/ q R \)^times$ lies in $cal(O)^times$, since both a unit congruent to $1$ modulo $q R$ and its inverse belong to $cal(O)$, and imposing positive signs costs at most a further factor of sixteen. The same diagonal-identification argument shows that all periods of the corresponding $A_4$-orbit are precisely $ell \( cal(O)^(times \, +) \)$. They form a full lattice, so the orbit is compact.
  Combining a label with a sign produces $16 N_(cal(O))$ finite choices above each $I$. Each $U$-orbit of these choices has $\[ U : cal(O)^(times \, +) \]$ elements and parametrizes one $A_4$-orbit. On that orbit the quotient of logarithmic Lebesgue measure is its Haar measure, with volume
  $ "covol" #scale(x: 120%, y: 120%)[\(] ell \( cal(O)^(times \, +) \) #scale(x: 120%, y: 120%)[\)] = \[ ell \( U \) : ell \( cal(O)^(times \, +) \) \] R_K = frac(\[ U : cal(O)^(times \, +) \], 2) R_K . $
  The last equality uses $ker \( ell \|_U \) = { 1 \, - 1 }$ and $- 1 in.not cal(O)^(times \, +)$. Consequently the number of distinct orbits times their common volume is
  $ frac(16 h_K N_(cal(O)), \[ U : cal(O)^(times \, +) \]) dot.op frac(\[ U : cal(O)^(times \, +) \], 2) R_K = 8 h_K N_(cal(O)) R_K . $
  This proves both the assertion about the descended measure and Equation (2.8), by Equation (2.6).
  One can also take $cal(L)_(cal(O)) \( I \) times cal(F)_U$ as a fundamental domain for the diagonal action in Equation (2.7): reducing $v$ into $cal(F)_U$ transports $L$ by the same unique unit, outside the usual null boundary set. Counting measure times $d v$ is invariant under this action. These domains have total measure $h_K N_(cal(O)) "vol" \( cal(F)_U \)$, equal to the total volume just computed. Dividing their integral by that quantity proves Equation (2.9). ◻
]

== 3 Ordinary vectors and probability limits <sec:ordinary>

We first control vectors in the lattices themselves. A count near the origin will prevent escape into the cusp, and a count near a vector with no zero coordinate will bound the mass of small neighborhoods in $X_4$. The latter bound is the input to the entropy argument in Section 4. We follow the method of #cite(label("PrimeDegreePackets")) Sections 2–5, proving the estimates with constants uniform over primitive totally real quartic fields, their orders, and the orderings of their embeddings. The absence of a quadratic subfield supplies the residue estimate needed in this degree.

=== 3.1 Containment probabilities and unfolding <containment-probabilities-and-unfolding>

For a rational prime $p$, write

$ R_p = product_(frak(p) divides p) R_(frak(p)) . $

Here $R_(frak(p))$ is the integer ring of the completion $K_(frak(p))$. Let $v_(frak(p))$ be its integer valuation, normalized to be $1$ on a uniformizer, and put

$ e_(frak(p)) = v_(frak(p)) \( p \) \, #h(2em) f_(frak(p)) = \[ R \/ frak(p) : bb(Z) \/ p bb(Z) \] . $

Thus $"N" frak(p) = p^(f_(frak(p)))$ and $sum_(frak(p) divides p) e_(frak(p)) f_(frak(p)) = 4$; see #cite(label("MilneANT")) Theorem 3.34. For $p divides q$ and a tuple $bold(l)_p = \( l_(frak(p)) \)_(frak(p) divides p)$ of nonnegative integers, call the set of $x in R_p$ with $v_(frak(p)) \( x_(frak(p)) \) = l_(frak(p))$ in every component the valuation shell $bold(l)_p$. Choose $x$ in this shell and define

#[#set math.equation(numbering: n => "(3.1)")
 $ P_p \( bold(l)_p \) = bb(P)_(t_p in R_p^times) { x in t_p cal(O)_p } \, $ <eq:ord-local-probability>]

where the probability is normalized unit Haar measure. The definition is independent of $x$: the unit group acts transitively on each set with specified component valuations.

For a nonzero integral $R$-ideal $frak(a)$, set

#[#set math.equation(numbering: n => "(3.2)")
 $ P \( frak(a) \) = product_(p divides q) P_p #scale(x: 120%, y: 120%)[\(] \( v_(frak(p)) \( frak(a) \) \)_(frak(p) divides p) #scale(x: 120%, y: 120%)[\)] . $ <eq:ord-ideal-weight>]

An empty product, including the case $q = 1$, is $1$. If $0 eq.not b in I$, its image has no zero local component and $\( b \) I^(- 1)$ is integral. In the coordinates $I_p = xi_p R_p$, the valuations of $xi_p^(- 1) b$ are those of $\( b \) I^(- 1)$. Lemma 2 and the independence of the local choices therefore give

#[#set math.equation(numbering: n => "(3.3)")
 $ bb(P)_(L in cal(L)_(cal(O)) \( I \)) { b in L } = P \( \( b \) I^(- 1) \) . $ <eq:ord-membership>]

For a nonnegative Borel function $f$ on $bb(R)^4$, write

$ E_f \( Lambda \) = sum_(0 eq.not x in Lambda) f \( x \) . $

This is a Borel function on $X_4$: in a local basis chart it is a countable sum of the Borel functions obtained by evaluating $f$ at the integer linear combinations of that basis. For $z > 0$, define the integral over the surface with absolute coordinate product $z$ by

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(V)_f \( z \) = sum_(omega in { plus.minus 1 }^4) integral_(bb(R)^3) f #scale(x: 120%, y: 120%)[\(] omega_1 e^(u_1) \, omega_2 e^(u_2) \, omega_3 e^(u_3) \, omega_4 z e^(- u_1 - u_2 - u_3) #scale(x: 120%, y: 120%)[\)] thin d u_1 thin d u_2 thin d u_3 . $ <eq:ord-fiber>]

The signs and logarithmic measure are exactly those of $T_oo$.

#thm([Proposition 3.1.])[
  (Ordinary vector unfolding).  #emph[For every nonnegative Borel $f$ on $bb(R)^4$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ integral_(X_4) E_f thin d mu_(*) = frac(1, sqrt(D) thin kappa) sum_(frak(a) subset R\
frak(a) eq.not 0) P \( frak(a) \) thin cal(V)_f #scale(x: 120%, y: 120%)[\(] "N" frak(a) \/ X #scale(x: 120%, y: 120%)[\)] . $ <eq:ord-unfolding>]

 Both sides are allowed to be infinite.]
] <prop:ord-unfolding>

#proof[
  This is the unfolding of #cite(label("PrimeDegreePackets")) Proposition 2.2 with the packet normalization of Proposition 3. Average the vector sum over $L$ in Equation (2.9), and use Equation (3.3). The factor $N_(cal(O))$ cancels, and the left side becomes
  $ frac(1, h_K "vol" \( cal(F)_U \)) sum_I integral_(cal(F)_U) sum_(0 eq.not b in I) P \( \( b \) I^(- 1) \) f \( c_I sigma \( b \) v \) thin d v . $
  For fixed $I$, the map $b mapsto \( b \) I^(- 1)$ takes $I \\ { 0 }$ onto the integral ideals in the inverse class of $I$. Each fiber is one free $U$-orbit. Indeed, two generators of the same principal ideal differ by a unique unit. The coefficient $P \( \( b \) I^(- 1) \)$ is constant on that orbit. Summing its unit translates and integrating over $cal(F)_U$ gives
  $ integral_(cal(F)_U) sum_(epsilon.alt in U) f \( c_I sigma \( epsilon.alt b \) v \) thin d v = integral_(T_oo) f \( c_I sigma \( b \) v \) thin d v . $
  The translates tile $T_oo$, including its sign components. All changes in the order of integration and summation are justified by Tonelli’s theorem.
  The absolute product of the coordinates of $c_I sigma \( b \)$ is
  $ c_I^4 \| "N"_(K \/ bb(Q)) \( b \) \| = frac("N" \( \( b \) I^(- 1) \), X) . $
  Translation of the first three logarithmic coordinates and relabeling of the signs therefore identify the last integral with $cal(V)_f \( "N" \( \( b \) I^(- 1) \) \/ X \)$, with Jacobian one. Each integral ideal belongs to the inverse class of exactly one chosen $I$. Equation (2.6) now gives the coefficient in Equation (3.5). ◻
]

=== 3.2 The mass and tail of the local weights <the-mass-and-tail-of-the-local-weights>

The ideal sum in Equation (3.5) need not have simple coefficients at primes dividing $q$. We will use its exact total mass over valuation shells and a positive moment of their norms. Both statements are the order case of #cite(label("PrimeDegreePackets")) Lemma 3.1; the argument below explains why they are uniform even when the local order has large index.

For $p divides q$, put

$ q_p = \[ R_p : cal(O)_p \] \, #h(2em) N_p \( bold(l)_p \) = p^(sum_(frak(p) divides p) f_(frak(p)) l_(frak(p))) \, #h(2em) Z_p = product_(frak(p) divides p) \( 1 - p^(- f_(frak(p))) \)^(- 1) . $

For a collection $bold(l) = \( bold(l)_p \)_(p divides q)$, write

$ d \( bold(l) \) = product_(p divides q) N_p \( bold(l)_p \) \, #h(2em) P \( bold(l) \) = product_(p divides q) P_p \( bold(l)_p \) \, #h(2em) Z_q = product_(p divides q) Z_p . $

Thus $d \( bold(l) \)$ is the norm of the part of an integral ideal supported above primes dividing $q$, and $product_(p divides q) q_p = q$.

#thm([Lemma 3.2.])[
  (Local mass and moment).  #emph[With the preceding notation, 
#[#set math.equation(numbering: n => "(3.6)")
 $ sum_(bold(l)) frac(P \( bold(l) \), d \( bold(l) \)) = Z_q / q . $ <eq:ord-shell-mass>]

 For every $eta > 0$ there is a constant $C_eta$, independent of $K \, cal(O)$, such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ sum_(bold(l)) P \( bold(l) \) d \( bold(l) \)^(- 1 + 1 \/ 8) lt.eq C_eta thin q^eta / q . $ <eq:ord-shell-moment>]

 In particular there is an absolute constant $C$ for which 
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_(d \( bold(l) \) > X^(1 \/ 8)) frac(P \( bold(l) \), d \( bold(l) \)) lt.eq C / q X^(- 1 \/ 128) . $ <eq:ord-shell-tail>]

]
] <lem:ord-shells>

#proof[
  Normalize additive Haar measure $m_p$ on $R_p$ by $m_p \( R_p \) = 1$. In a component $R_(frak(p))$, the set of elements of valuation $l_(frak(p))$ has measure $\( 1 - p^(- f_(frak(p))) \) p^(- f_(frak(p)) l_(frak(p)))$. Consequently the shell $bold(l)_p$ in $R_p$ has measure
  #[#set math.equation(numbering: n => "(3.9)")
   $ m_p \( upright("shell ") bold(l)_p \) = frac(1, Z_p thin N_p \( bold(l)_p \)) . $ <eq:ord-shell-measure>]
  Its conditional additive measure is invariant under the transitive unit action. It is therefore the image of unit Haar probability. By Equation (3.1), $P_p \( bold(l)_p \)$ is exactly the fraction of this shell lying in $cal(O)_p$. The elements with a zero component have measure zero, and $m_p \( cal(O)_p \) = q_p^(- 1)$. Summing Equation (3.9) over the intersections with $cal(O)_p$ gives
  $ sum_(bold(l)_p) frac(P_p \( bold(l)_p \), N_p \( bold(l)_p \)) = Z_p / q_p . $
  Multiplication over $p divides q$ proves Equation (3.6).
  For the moment, choose $x$ with normalized additive Haar probability on $cal(O)_p$, and let $v_(frak(p)) = v_(frak(p)) \( x_(frak(p)) \)$. The projection $H_(frak(p))$ of $cal(O)_p$ into $R_(frak(p))$ contains the embedded copy of $bb(Z)_p$, because $1 in cal(O)_p$. Its induced probability is normalized Haar on $H_(frak(p))$. For an integer $k gt.eq 1$, the image of this copy of $bb(Z)_p$ modulo the ideal of valuation $k$ has $p^(ceil.l k \/ e_(frak(p)) ceil.r)$ elements. Hence the image of $H_(frak(p))$ has at least that many elements, and
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(P)_(cal(O)_p) { v_(frak(p)) gt.eq k } lt.eq p^(- ceil.l k \/ e_(frak(p)) ceil.r) . $ <eq:ord-valuation-tail>]
  This uses only the size of the additive image of the projection; it does not require the projections to be independent.
  Set
  $ j = max_(frak(p) divides p) ⌈v_(frak(p)) / e_(frak(p))⌉ . $
  If $j gt.eq a gt.eq 1$, then some $v_(frak(p))$ is at least $e_(frak(p)) \( a - 1 \) + 1$. Equation (3.10) and a union bound over at most four components give $bb(P)_(cal(O)_p) { j gt.eq a } lt.eq 4 p^(- a)$. On the other hand,
  $ N_p \( x \) = p^(sum_(frak(p) divides p) f_(frak(p)) v_(frak(p))) lt.eq p^(j sum_(frak(p) divides p) e_(frak(p)) f_(frak(p))) = p^(4 j) . $
  These assertions hold outside the null sets where a component vanishes. The tail formula for the expectation of $p^(j \/ 2)$ now yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E)_(cal(O)_p) N_p \( x \)^(1 \/ 8) & lt.eq bb(E)_(cal(O)_p) p^(j \/ 2)\
 & = 1 + sum_(a gt.eq 1) \( p^(a \/ 2) - p^(\( a - 1 \) \/ 2) \) bb(P)_(cal(O)_p) { j gt.eq a } lt.eq 1 + 4 p^(- 1 \/ 2) . $ <eq:ord-local-moment>]
  Applying Equation (3.9) once more gives the exact factorization
  $ sum_(bold(l)) P \( bold(l) \) d \( bold(l) \)^(- 1 + 1 \/ 8) = 1 / q product_(p divides q) (Z_p thin bb(E)_(cal(O)_p) N_p \( x \)^(1 \/ 8)) . $
  Each factor is at most $\( 1 - p^(- 1) \)^(- 4) \( 1 + 4 p^(- 1 \/ 2) \)$. For any fixed $eta > 0$, this is at most $p^eta$ at all sufficiently large primes. The product of the factors at the finitely many remaining primes is bounded by a constant depending only on $eta$. Since $product_(p divides q) p lt.eq q$, this proves Equation (3.7). Finally, take $eta = 1 \/ 128$ there and use $q lt.eq X$:
  $ sum_(d \( bold(l) \) > X^(1 \/ 8)) frac(P \( bold(l) \), d \( bold(l) \)) lt.eq X^(- 1 \/ 64) sum_(bold(l)) P \( bold(l) \) d \( bold(l) \)^(- 1 + 1 \/ 8) lt.eq C / q X^(- 1 \/ 128) . $
  This proves Equation (3.8). ◻
]

=== 3.3 Ideal counts relative to the residue <ideal-counts-relative-to-the-residue>

The shell identity supplies the factor $q^(- 1)$. To use it in Equation (3.5), the count of the remaining ideal part must retain the factor $kappa$. Recall

$ a_K \( n \) = \# { frak(a) subset R : frak(a) eq.not 0 \, med "N" frak(a) = n } \, #h(2em) n gt.eq 1 \, $

and let $d_4$ be the fourfold divisor function. Unique factorization of ideals makes $a_K$ multiplicative. At every rational prime, including a ramified one, its local generating series is

$ sum_(j gt.eq 0) a_K \( p^j \) T^j = product_(frak(p) divides p) \( 1 - T^(f_(frak(p))) \)^(- 1) . $

Each factor is coefficientwise at most $\( 1 - T \)^(- 1)$, and there are at most four factors. Hence $a_K \( n \) lt.eq d_4 \( n \)$ for every $n$; in particular $a_K \( p \) lt.eq 4$.

#thm([Lemma 3.3.])[
  (Residue and prime sums).  #emph[There are absolute constants $D_0 > 1$, $h_0 > 0$, $Y_0 > 1$, and $C gt.eq 1$ with the following properties for every primitive totally real quartic field $K$.]
  + #emph[If $D gt.eq D_0$, then 
#[#set math.equation(numbering: n => "(3.12)")
 $ C^(- 1) kappa lt.eq h zeta_K \( 1 + h \) lt.eq C kappa #h(2em) \( 0 < h lt.eq 4 \/ log D \) . $ <eq:ord-residue-comparison>]

 If $D < D_0$, the same inequalities hold for $0 < h lt.eq h_0$.]
  + #emph[One has 
#[#set math.equation(numbering: n => "(3.13)")
 $ kappa^(- 1) lt.eq C log \( 3 D \) . $ <eq:ord-residue-lower>]

]
  + #emph[Whenever $Y gt.eq max { Y_0 \, D^(1 \/ 4) }$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ exp (sum_(p lt.eq Y) frac(a_K \( p \), p)) lt.eq C kappa log Y . $ <eq:ord-prime-sum>]

]
  #emph[The sum in Equation (3.14) is over rational primes.]
] <lem:ord-residue>

#proof[
  We first treat large $D$, and put $L = log D$. Stark’s zero theorem #cite(label("Stark1974")) Lemma 3 gives at most one nontrivial zero of $zeta_K$ in
  $ Re s gt.eq 1 - frac(1, 4 L) \, #h(2em) \| Im s \| lt.eq frac(1, 4 L) \; $
  any such zero is real and simple. His Lemma 8 #cite(label("Stark1974")) Lemma 8, valid also for nonnormal fields, states in degree four that a real zero $beta gt.eq 1 - \( 96 L \)^(- 1)$ would force a quadratic subfield of $K$. Primitivity excludes that subfield. It follows that every nontrivial zero $rho$ satisfies
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| 1 - rho \| gt.eq c_0 / L \, #h(2em) c_0 = 1 / 192 . $ <eq:ord-zero-disk>]
  Indeed, a zero in the smaller open disk would lie in Stark’s rectangle, would be real, and would be in the forbidden real interval.
  For real $s > 1$, the logarithmic derivative of the completed zeta function gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ S_K \( s \) := sum_rho Re frac(1, s - rho) & = 1 / s + frac(1, s - 1) + L / 2 + zeta'_K / zeta_K \( s \) + G \( s \) \,\
G \( s \) & = 2 (frac(Gamma' \( s \/ 2 \), Gamma \( s \/ 2 \)) - log pi) \; $ <eq:ord-zero-sum>]
  see #cite(label("Stark1974")) Equation (9). The real zero sum converges and has nonnegative terms, since $Re rho lt.eq 1$. At $s_0 = 1 + L^(- 1)$, the Euler product gives $zeta'_K \/ zeta_K \( s_0 \) lt.eq 0$. The function $G$ is bounded on $\[ 1 \, 2 \]$, so for sufficiently large $D$,
  $ 0 lt.eq S_K \( s_0 \) lt.double L . $
  This estimate persists for all $1 < s lt.eq 1 + 4 \/ L$. To see this term by term, write $rho = beta + i gamma$. Since $beta lt.eq 1$,
  $ s - beta lt.eq 4 \( s_0 - beta \) \, #h(2em) \| s - rho \| gt.eq \| 1 - rho \| . $
  Equation (3.15) consequently gives
  $ \| s_0 - rho \| lt.eq \| s - rho \| + 3 / L lt.eq \( 1 + 3 \/ c_0 \) \| s - rho \| . $
  Using $Re \( s - rho \)^(- 1) = \( s - beta \) \/ \| s - rho \|^2$, we obtain
  $ Re frac(1, s - rho) lt.eq 4 \( 1 + 3 \/ c_0 \)^2 Re frac(1, s_0 - rho) . $
  Thus $S_K \( s \) lt.double L$ on the entire interval.
  Let $cal(Z)_K \( s \) = \( s - 1 \) zeta_K \( s \)$. Rearranging Equation (3.16) shows that
  $ cal(Z)'_K / cal(Z)_K \( s \) = S_K \( s \) - 1 / s - L / 2 - G \( s \) = O \( L \) #h(2em) \( 1 < s lt.eq 1 + 4 \/ L \) . $
  The function $cal(Z)_K$ extends to $s = 1$ with value $kappa > 0$. Integrating its logarithmic derivative across an interval of length at most $4 \/ L$ proves Equation (3.12), with an absolute constant. At $s_0$, the inequality $zeta_K \( s_0 \) gt.eq 1$ then gives $kappa gt.double L^(- 1)$.
  There are only finitely many fields with $D < D_0$, by Hermite’s finiteness theorem #cite(label("MilneANT")) Theorem 8.43. For each of them, $h zeta_K \( 1 + h \)$ tends to the positive residue $kappa$ as $h arrow.b 0$. Taking a common sufficiently small $h_0$ over this finite set proves the remaining comparison, and their positive residues have a common positive lower bound. Enlarging $C$ proves Equation (3.13) for every field.
  Choose $Y_0$ sufficiently large that $1 \/ log Y_0 lt.eq h_0$, and let $Y gt.eq max { Y_0 \, D^(1 \/ 4) }$. For $h = 1 \/ log Y$, the comparison just proved applies: in the large $D$ case $h lt.eq 4 \/ log D$, and in the bounded $D$ case $h lt.eq h_0$. Positivity in the Euler logarithm gives
  $ sum_(p lt.eq Y) a_K \( p \) p^(- 1 - h) lt.eq log zeta_K \( 1 + h \) . $
  Moreover, $a_K \( p \) lt.eq 4$, $1 - p^(- h) lt.eq h log p$, and the elementary Chebyshev bound followed by partial summation imply
  $ sum_(p lt.eq Y) a_K \( p \) \( p^(- 1) - p^(- 1 - h) \) lt.eq 4 h sum_(p lt.eq Y) frac(log p, p) lt.double h log Y = 1 . $
  It follows that
  $ sum_(p lt.eq Y) frac(a_K \( p \), p) lt.eq log zeta_K \( 1 + h \) + O \( 1 \) lt.eq log \( kappa log Y \) + O \( 1 \) \, $
  which proves Equation (3.14). There is no upper restriction on $Y$. This observation is what permits $D$ to stay bounded while the order index, and hence $X$, grows. ◻
]

We also need an estimate for ideals in an interval. The following uniform form of Shiu’s bound #cite(label("Shiu1980")) is the one recorded in #cite(label("PrimeDegreePackets")) Equation (4.2).

#thm([Lemma 3.4.])[
  #emph[There are absolute constants $C \, u_0$ such that, for every nonnegative multiplicative function $b$ with $b \( n \) lt.eq d_4 \( n \)$, every real $u gt.eq u_0$, and every $u^(1 \/ 2) lt.eq v lt.eq u$, 
#[#set math.equation(numbering: n => "(3.17)")
 $ sum_(u - v < n lt.eq u) b \( n \) lt.eq C frac(v, log u) exp (sum_(p lt.eq u) frac(b \( p \), p)) . $ <eq:ord-shiu>]

]
] <lem:ord-shiu>

#proof[
  Apply #cite(label("Pollack2020")) Theorem 1.1 with no excluded residue classes and with its parameter $beta = 1 \/ 4$. Its two growth conditions hold with bounds independent of $b$:
  $ b \( p^j \) lt.eq d_4 \( p^j \) = binom(j + 3, 3) lt.eq 4^j \, #h(2em) b \( n \) lt.eq d_4 \( n \) lt.double_epsilon.alt n^epsilon.alt quad \( epsilon.alt > 0 \) . $
  The theorem’s constant and threshold depend only on these growth bounds and on the fixed parameter. Its strict length condition $u^beta < v$ is satisfied even at $v = u^(1 \/ 2)$ once $u > 1$. This gives Equation (3.17), including both endpoints. ◻
]

#thm([Proposition 3.5.])[
  (Weighted ideal intervals).  #emph[There is an absolute constant $C$ such that, for each fixed $A gt.eq 1$ and $c > 0$, there is a threshold $X_0 \( A \, c \)$ with the following property. For every $K \, cal(O) \, sigma$ under consideration with $X gt.eq X_0 \( A \, c \)$, and all real $x \, y$ satisfying 
$ X^(3 \/ 4) lt.eq x lt.eq A X \, #h(2em) c x lt.eq y lt.eq x \, $

 one has 
#[#set math.equation(numbering: n => "(3.18)")
 $ sum_(frak(a) subset R \, med frak(a) eq.not 0\
x - y < "N" frak(a) lt.eq x) P \( frak(a) \) lt.eq C thin frac(kappa y, q) . $ <eq:ord-weighted-interval>]

 The constant $C$ is independent of $A \, c$; the threshold may depend on them.]
] <prop:ord-weighted-intervals>

#proof[
  The range is empty for $c > 1$, so suppose $0 < c lt.eq 1$. We adapt the separation of the local norm from the remaining ideal in #cite(label("PrimeDegreePackets")) Proposition 4.2. Put
  $ b \( n \) = a_K \( n \) upright(bold(1))_(\( n \, q \) = 1) . $
  This is nonnegative and multiplicative, and it is at most $d_4$. Every integral ideal splits uniquely into its part above the primes dividing $q$, described by one tuple $bold(l)$, and a part coprime to $q R$. The left side of Equation (3.18) is therefore
  #[#set math.equation(numbering: n => "(3.19)")
   $ sum_(bold(l)) P \( bold(l) \) sum_(\( x - y \) \/ d \( bold(l) \) < n lt.eq x \/ d \( bold(l) \)) b \( n \) . $ <eq:ord-ideal-split>]
  First take $d = d \( bold(l) \) lt.eq X^(1 \/ 8)$, and put $u = x \/ d$, $v = y \/ d$. Then
  $ u gt.eq X^(5 \/ 8) gt.eq D^(1 \/ 4) \, #h(2em) v gt.eq c u . $
  The second inequality implies $v gt.eq u^(1 \/ 2)$ when $X$ is large in terms of $c$. The first inequality puts $u$ in the range of Equation (3.14), once $X$ is above an absolute threshold. To remove the primes dividing $q$ from that Euler bound, observe that
  #[#set math.equation(numbering: n => "(3.20)")
   $ log Z_q = sum_(p divides q) frac(a_K \( p \), p) + O \( 1 \) \, #h(2em) sum_(p divides q\
p > u) frac(a_K \( p \), p) lt.double frac(log \( 2 q \), u) lt.double 1 . $ <eq:ord-euler-removal>]
  For the first identity, expand $log Z_p = sum_(frak(p) divides p) sum_(j gt.eq 1) p^(- j f_(frak(p))) \/ j$. The terms of order $p^(- 1)$ count exactly the primes of residue degree one, and the remaining terms are $O \( p^(- 2) \)$, uniformly in the splitting type. Their sum over rational primes is bounded. For the second estimate, use $a_K \( p \) lt.eq 4$, at most $log \( 2 q \) \/ log 2$ primes dividing $q$, and $u gt.eq X^(5 \/ 8)$, $q lt.eq X$. Consequently Equations (3.14) and (3.20) give
  $ exp (sum_(p lt.eq u) frac(b \( p \), p)) lt.double frac(kappa log u, Z_q) . $
  Lemma 7 and Equation (3.6) now bound the contribution of these tuples to Equation (3.19) by
  $ C frac(kappa y, Z_q) sum_(d \( bold(l) \) lt.eq X^(1 \/ 8)) frac(P \( bold(l) \), d \( bold(l) \)) lt.eq C frac(kappa y, q) . $
  It remains to control tuples with $d > X^(1 \/ 8)$. Those with $d > x$ contribute nothing. For $z gt.eq 1$, summing the first three factors of the divisor convolution gives
  $ sum_(n lt.eq z) d_4 \( n \) = sum_(a_1 a_2 a_3 a_4 lt.eq z) 1 lt.eq z (sum_(a lt.eq z) 1 / a)^3 lt.eq z \( 1 + log z \)^3 . $
  Use this with $z = x \/ d$, and then Equation (3.8). The remaining contribution is at most
  $ C x \( 1 + log x \)^3 sum_(d \( bold(l) \) > X^(1 \/ 8)) frac(P \( bold(l) \), d \( bold(l) \)) lt.eq C x / q X^(- 1 \/ 128) \( 1 + log x \)^3 . $
  For fixed $A$, once $X gt.eq A$ the condition $x lt.eq A X$ gives $log x lt.eq 2 log X$. By Equation (3.13) and $D lt.eq X^2$, the ratio of this last bound to $kappa x \/ q$ is at most
  $ C X^(- 1 \/ 128) \( log \( 3 X \) \)^4 = o \( 1 \) . $
  This bound is independent of the field and the order. Increase the threshold in terms of $A \, c$ until the ratio is at most $c$. The tail is then at most $kappa c x \/ q lt.eq kappa y \/ q$. The constant in the resulting bound has not changed with $A$ or $c$, proving the proposition. ◻
]

=== 3.4 Short vectors and small neighborhoods <short-vectors-and-small-neighborhoods>

We now apply the weighted interval bound to the two vector counts announced at the start of the section. If $f_r = upright(bold(1))_(\[ - r \, r \]^4)$, direct integration in Equation (3.4) gives

#[#set math.equation(numbering: n => "(3.21)")
 $ cal(V)_(f_r) \( z \) = 16 / 6 #scale(x: 120%, y: 120%)[\(] log_(+) \( r^4 \/ z \) #scale(x: 120%, y: 120%)[\)]^3 . $ <eq:ord-cube-fiber>]

Indeed, in a fixed sign component put $s_i = log r - u_i$ for $1 lt.eq i lt.eq 3$. The cube conditions become $s_i gt.eq 0$ and $sum_(i = 1)^3 s_i lt.eq log \( r^4 \/ z \)$, a simplex of the displayed volume divided by sixteen.

#thm([Proposition 3.6.])[
  (Tightness).  #emph[There is an absolute constant $C$ such that, for every fixed $0 < r < 1$, 
#[#set math.equation(numbering: n => "(3.22)")
 $ limsup_(X arrow.r oo) mu_(*) { Lambda : upright("some ") 0 eq.not v in Lambda upright(" satisfies ") parallel v parallel_oo < r } lt.eq C r^4 . $ <eq:ord-cusp>]

 The limit superior ranges over all primitive totally real quartic fields, all their orders, and all orderings of their real embeddings. Consequently, for every sequence of these packet measures $mu_i = mu_(cal(O)_i \, sigma_i)$ with $X_i arrow.r oo$ and every $epsilon.alt > 0$, there is a compact $cal(K)_epsilon.alt subset X_4$ with $mu_i \( cal(K)_epsilon.alt \) gt.eq 1 - epsilon.alt$ for all sufficiently large $i$. Such a sequence is tight, and every weak subsequential limit is an $A_4$-invariant probability on $X_4$.]
] <prop:ord-tightness>

#proof[
  The count $E_(f_r)$ dominates the indicator in Equation (3.22). Put $T = r^4 X$ and $T_0 = X^(3 \/ 4)$. By Equations (3.5) and (3.21), it suffices to bound
  #[#set math.equation(numbering: n => "(3.23)")
   $ frac(1, sqrt(D) thin kappa) sum_("N" frak(a) lt.eq T) P \( frak(a) \) #scale(x: 120%, y: 120%)[\(] log \( T \/ "N" frak(a) \) #scale(x: 120%, y: 120%)[\)]^3 . $ <eq:ord-cube-sum>]
  The sum is empty when $T < 1$. Otherwise its logarithmic factor is at most $\( log X \)^3$, since $"N" frak(a) gt.eq 1$ and $r < 1$. Apply Proposition 8 at $x = y = T_0$, with $A = c = 1$. The part with $"N" frak(a) lt.eq min { T \, T_0 }$ is at most
  $ C frac(kappa T_0, q) \( log X \)^3 . $
  After division by $sqrt(D) thin kappa = X kappa \/ q$, this contributes $O \( X^(- 1 \/ 4) \( log X \)^3 \) = o \( 1 \)$.
  If $T > T_0$, put
  $ A_(T_0) \( t \) = sum_(T_0 < "N" frak(a) lt.eq t) P \( frak(a) \) #h(2em) \( T_0 lt.eq t lt.eq T \) . $
  The same interval estimate at $x = y = t$ gives $A_(T_0) \( t \) lt.eq C kappa t \/ q$, since $T lt.eq X$. Writing each logarithmic cube as an integral and using Tonelli yields
  $ sum_(T_0 < "N" frak(a) lt.eq T) P \( frak(a) \) #scale(x: 120%, y: 120%)[\(] log \( T \/ "N" frak(a) \) #scale(x: 120%, y: 120%)[\)]^3 & = 3 integral_(T_0)^T A_(T_0) \( t \) #scale(x: 120%, y: 120%)[\(] log \( T \/ t \) #scale(x: 120%, y: 120%)[\)]^2 frac(d t, t)\
 & lt.eq C kappa / q integral_0^T #scale(x: 120%, y: 120%)[\(] log \( T \/ t \) #scale(x: 120%, y: 120%)[\)]^2 thin d t lt.eq C frac(kappa T, q) . $
  The last integral is finite after the substitution $t = T s$. This part of Equation (3.23) is therefore $O \( r^4 \)$. If $T lt.eq T_0$, it is absent. The constants used at $A = c = 1$ are absolute, so the resulting estimate proves Equation (3.22). This is the compactness argument of #cite(label("PrimeDegreePackets")) Proposition 5.1, now using the quartic weighted interval bound.
  Mahler’s compactness criterion #cite(label("Mahler1946")) Section 3, Theorem 2 says that
  $ cal(K)_r = { Lambda in X_4 : parallel v parallel_oo gt.eq r upright(" for all ") 0 eq.not v in Lambda } $
  is compact. Choose $r$ so that $C r^4 < epsilon.alt \/ 2$. Equation (3.22) then gives $mu_i \( cal(K)_r \) gt.eq 1 - epsilon.alt$ for all sufficiently large $i$. Each of the finitely many preceding packet measures is supported on a finite union of compact orbits, by Proposition 3. Enlarging the compact set to include those supports proves tightness of the entire sequence. The space $X_4$ is locally compact, second countable, and metrizable; the weak compactness theorem for tight probabilities therefore gives probability subsequential limits. For $a in A_4$ and $f in C_c \( X_4 \)$, the equality
  $ integral f \( x a \) thin d mu_i \( x \) = integral f \( x \) thin d mu_i \( x \) $
  passes to a weak limit, since both test functions are continuous with compact support. This proves $A_4$-invariance. ◻
]

#thm([Lemma 3.7.])[
  (Boxes away from the coordinate hyperplanes).  #emph[Let $V_0 subset \( bb(R)^times \)^4$ be compact, and let $b > 0$. There are constants $C \, r_0 > 0$, depending only on $V_0 \, b$, such that for every fixed $0 < r < r_0$ there is a threshold $X_0 \( V_0 \, b \, r \)$ for which 
#[#set math.equation(numbering: n => "(3.24)")
 $ integral_(X_4) E_(upright(bold(1))_(v + \[ - b r \, b r \]^4)) thin d mu_(*) lt.eq C r^4 #h(2em) \( v in V_0 \, med X gt.eq X_0 \( V_0 \, b \, r \) \) . $ <eq:ord-vector-box>]

 The threshold and constants are uniform over $K \, cal(O) \, sigma$ and over the centers $v in V_0$.]
] <lem:ord-boxes>

#proof[
  The assertion is immediate if $V_0$ is empty. Otherwise choose $0 < epsilon.alt lt.eq M$ such that $epsilon.alt lt.eq \| v_i \| lt.eq M$ for every $v in V_0$ and $i$. For $r_0 < epsilon.alt \/ \( 2 b \)$, each box in the statement lies in one coordinate sign component. Its first three logarithmic widths satisfy
  $ log frac(\| v_i \| + b r, \| v_i \| - b r) lt.double_(V_0 \, b) r . $
  The product map $x mapsto product_i \| x_i \|$ has uniformly bounded first derivatives on these boxes. If $t_v = product_i \| v_i \|$, it follows from Equation (3.4) that, for one $C_1 gt.eq 1$,
  #[#set math.equation(numbering: n => "(3.25)")
   $ cal(V)_(upright(bold(1))_(v + \[ - b r \, b r \]^4)) \( z \) lt.eq C_1 r^3 thin upright(bold(1))_(\[ t_v - C_1 r \, t_v + C_1 r \]) \( z \) #h(2em) \( v in V_0 \, med 0 < r < r_0 \) . $ <eq:ord-box-fiber>]
  Let $t_(-) > 0$ and $t_(+) < oo$ be the minimum and maximum of $t_v$ on $V_0$, and shrink $r_0$ so that $6 C_1 r_0 < t_(-)$. For a fixed $r$ in this range set
  $ x = \( t_v + 2 C_1 r \) X \, #h(2em) y = 4 C_1 r X . $
  The possible ideal norms in Equation (3.25) lie strictly inside $\( x - y \, x \)$. The enlargement avoids any issue with integer endpoints. There is a fixed $A gt.eq 1$, depending only on $V_0 \, b$, such that $x lt.eq A X$ for all centers and radii under consideration. For sufficiently large $X$, uniformly in the centers, $x gt.eq X^(3 \/ 4)$. Also $y lt.eq x$ by the choice of $r_0$, and $y gt.eq c x$ with $c = 4 C_1 r \/ A > 0$, after decreasing $r_0$ if necessary so that $c lt.eq 1$.
  Proposition 8 applies for every fixed $r$, with this $c$ and the fixed $A$. Its constant is independent of $c$, so the sum of the relevant ideal weights is at most $C kappa r X \/ q$, with a constant independent of $r$. Combining this with Equations (3.5) and (3.25), and using $sqrt(D) = X \/ q$, proves Equation (3.24). Only the threshold for $X$ depends on the fixed radius. ◻
]

For $r > 0$, define the open identity neighborhood

#[#set math.equation(numbering: n => "(3.26)")
 $ B \( r \) = { h in upright("SL")_4 \( bb(R) \) : max_(i \, j) \| h_(i j) - delta_(i j) \| < r } . $ <eq:ord-ball-neighborhood>]

#thm([Proposition 3.8.])[
  (Local bounds in probability limits).  #emph[Let $mu$ be a weak probability limit of packet measures along $X_i arrow.r oo$. For every compact $Omega subset X_4$, there are constants $C_Omega \, r_Omega > 0$ such that 
#[#set math.equation(numbering: n => "(3.27)")
 $ mu \( x B \( r \) \) lt.eq C_Omega r^4 #h(2em) \( x in Omega \, med 0 < r < r_Omega \) . $ <eq:ord-balls>]

]
] <prop:ord-balls>

#proof[
  The assertion is immediate if $Omega$ is empty, so assume otherwise. We use the passage from vector boxes to ordinary neighborhoods in #cite(label("PrimeDegreePackets")) Proposition 5.2. First, every full lattice has a vector with no zero coordinate. If $Lambda = bb(Z)^4 g$, each coordinate of $\( 1 \, N \, N^2 \, N^3 \) g$ is a nonzero polynomial in $N$: its coefficients are a column of the invertible matrix $g$. An integer $N$ outside their finitely many roots gives the required vector.
  For each $x_0 in Omega$, choose a continuous local lift $g \( x \)$ of nearby lattices to $upright("SL")_4 \( bb(R) \)$, and an integer row $z$ for which $z g \( x_0 \)$ has no zero coordinate. On a sufficiently small neighborhood with compact closure in this chart, $z g \( x \)$ stays bounded and its coordinates stay bounded away from zero. A finite collection of these neighborhoods covers $Omega$. Consequently we may select, for every $x in Omega$, a vector $v_x in Lambda_x$ so that all selected vectors lie in one compact set $V_0 subset \( bb(R)^times \)^4$. The selection is used pointwise and need not be measurable.
  Choose $M$ with $\| \( v_x \)_i \| lt.eq M$ for all selected vectors, and fix $b > 4 M$. If $y = x h$ with $h in B \( r \)$, then $v_x h in Lambda_y$, and
  $ \| \( v_x h - v_x \)_j \| lt.eq sum_i \| \( v_x \)_i \| thin \| h_(i j) - delta_(i j) \| < b r . $
  Thus every lattice in $x B \( r \)$ has a nonzero vector in $v_x + \[ - b r \, b r \]^4$. Lemma 10 gives, for each fixed small $r > 0$ and all sufficiently large $i$,
  $ mu_i \( x B \( r \) \) lt.eq integral E_(upright(bold(1))_(v_x + \[ - b r \, b r \]^4)) thin d mu_i lt.eq C_Omega r^4 #h(2em) \( x in Omega \) . $
  The constants are common to all $x$ and $r$ in the stated ranges; the index after which this estimate holds may depend on $r$. The set $x B \( r \)$ is open in $X_4$. For each fixed $x \, r$, Portmanteau’s inequality therefore yields
  $ mu \( x B \( r \) \) lt.eq liminf_(i arrow.r oo) mu_i \( x B \( r \) \) lt.eq C_Omega r^4 . $
  This proves the bound for every $r$ with the same constant. It uses no interchange between a shrinking radius and the packet limit. ◻
]

== 4 The homogeneous obstruction in degree four <sec:rigidity>

For a sequence with $X arrow.r oo$, Proposition 9 shows that every weak subsequential limit of the packet measures is an $A_4$-invariant probability. Proposition 11 supplies the compact ball estimate in Equation (3.27). We first turn that estimate into positive entropy in almost every $A_4$-ergodic component. Measure classification then makes those components homogeneous. In degree four, the proper homogeneous components that remain have two coordinate blocks of dimension two. We will show that each of them carries an exterior-square lattice vector in one of three fixed planes. The arithmetic part of the proof will exclude these three events.

=== 4.1 Entropy from the compact ball estimate <entropy-from-the-compact-ball-estimate>

Fix distinct real numbers $lambda_1 \, dots.h \, lambda_4$ with sum zero, and set

$ a \( t \) = "diag" \( e^(lambda_1 t) \, dots.h \, e^(lambda_4 t) \) \, #h(2em) lambda_a = min_(i eq.not j) \| lambda_i - lambda_j \| > 0 . $

For an $a \( bb(R) \)$-invariant probability $xi$, let $h_xi \( a \( 1 \) \)$ denote the measure-theoretic entropy of right multiplication by $a \( 1 \)$. The argument below is the degree-four specialization of the ordinary-ball argument in #cite(label("PrimeDegreePackets")) Proposition 6.1 and Lemma 6.2, which in turn follows the strategy of #cite(label("ELMV2011")) Section 2.7.1. We include the argument because its statement for every dominated invariant probability is needed when passing to ergodic components.

Here is the entropy input. For an open identity neighborhood $B$ in $upright("SL")_4 \( bb(R) \)$, write

$ B^(\( s \, t \)) = a \( - s \) B a \( s \) ∩ a \( - t \) B a \( t \) . $

The following is the specialization to $X_4$ of the Einsiedler–Lindenstrauss–Michel–Venkatesh tube criterion #cite(label("ELMV2009")) Corollary 3.3 and Equation (3.4). The flow $a \( t \)$ is $bb(R)$-diagonalizable, as required there.

#thm([Theorem 4.1.])[
  (Entropy criterion for two-sided tubes).  #emph[Let $xi_i$ and $xi$ be $a \( bb(R) \)$-invariant Borel probabilities on $X_4$, with $xi_i$ converging weak-\* to $xi$. Suppose that $t_i > 0$ tend to infinity and that $eta > 0$. Assume that for every compact $Omega subset X_4$ there are an open identity neighborhood $B subset upright("SL")_4 \( bb(R) \)$ and a constant $C_Omega$ such that 
$ xi_i #scale(x: 120%, y: 120%)[\(] x B^(\( - t_i \, t_i \)) #scale(x: 120%, y: 120%)[\)] lt.eq C_Omega e^(- 2 eta t_i) #h(2em) \( x in Omega \, med i gt.eq 1 \) . $

 Then $h_xi \( a \( 1 \) \) gt.eq eta$.]
] <thm:rig-tube-criterion>

In this criterion $B$ may depend on $Omega$, and the probabilities need not be ergodic under the flow. The requirement that the weak-\* limit is a probability is part of the theorem.

#thm([Proposition 4.2.])[
  (Entropy for dominated probabilities).  #emph[Let $mu$ be an $A_4$-invariant probability on $X_4$ satisfying the compact ball bound in Equation (3.27) for every compact set of centers. If $xi$ is an $A_4$-invariant probability with $xi lt.eq c mu$ for some finite $c$, then 
$ h_xi \( a \( 1 \) \) gt.eq lambda_a \/ 3 . $

]
] <prop:rig-dominated-entropy>

#proof[
  Use the entrywise neighborhoods $B \( r \)$ defined in Equation (3.26). Fix $0 < b < 1 \/ 4$ and put
  $ T_t = a \( t \) B \( b \) a \( - t \) ∩ a \( - t \) B \( b \) a \( t \) \, #h(2em) r = e^(- lambda_a t) quad \( t gt.eq 0 \) . $
  For $h in T_t$, the two conjugations give
  #[#set math.equation(numbering: n => "(4.1)")
   $ \| h_(i i) - 1 \| < b \, #h(2em) \| h_(i j) \| < b e^(- \| lambda_i - lambda_j \| t) lt.eq b r quad \( i eq.not j \) . $ <eq:rig-tube-entries>]
  In the determinant expansion, every term except the product of the diagonal entries contains at least two off-diagonal entries. Since $det h = 1$, Equation (4.1) implies $product_i h_(i i) = 1 + O \( r^2 \)$. The diagonal matrix
  $ d \( h \) = "diag" #scale(x: 120%, y: 120%)[\(] h_11 \, h_22 \, h_33 \, \( h_11 h_22 h_33 \)^(- 1) #scale(x: 120%, y: 120%)[\)] $
  therefore belongs to a fixed compact subset $cal(D)_oo subset A_4$, and $d \( h \)^(- 1) h in B \( C r \)$. The constant $C$ here and below may depend on $b$ and the fixed flow. Indeed, the first three diagonal entries of $d \( h \)^(- 1) h$ are one, the fourth differs from one by $O \( r^2 \)$, and all its off-diagonal entries are $O \( r \)$.
  The logarithmic coordinates on $A_4$ identify $cal(D)_oo$ with a bounded subset of $bb(R)^3$. A mesh of spacing comparable to $r$, followed by a fixed enlargement to account for matrix multiplication, gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ T_t subset union.big_(j = 1)^(N_t) d_j B \( C r \) \, #h(2em) d_j in cal(D)_oo \, #h(2em) N_t lt.eq C r^(- 3) . $ <eq:rig-tube-cover>]
  For a compact $Omega subset X_4$, the centers $x d_j$ lie in the compact set $Omega cal(D)_oo$. Domination and Equation (3.27) now imply
  #[#set math.equation(numbering: n => "(4.3)")
   $ xi \( x T_t \) lt.eq C_(Omega \, c) r^(- 3) r^4 = C_(Omega \, c) e^(- lambda_a t) #h(2em) \( x in Omega \) $ <eq:rig-tube-mass>]
  for all sufficiently large $t$. Apply Theorem 12 to the constant sequence $xi_i = xi$, with $t_i = i$, $B = B \( b \)$, and $eta = lambda_a \/ 3$. The identity $B \( b \)^(\( - t \, t \)) = T_t$ and $2 lambda_a \/ 3 < lambda_a$ verify its estimate for large $i$. For the finitely many earlier $i$, enlarge $C_(Omega \, c)$, using that $xi$ is a probability. The criterion gives the assertion. ◻
]

#thm([Corollary 4.3.])[
  (Positive entropy in the ergodic components).  #emph[Let $mu$ be an $A_4$-invariant probability on $X_4$ satisfying Equation (3.27) on every compact set of centers. Almost every component in its $A_4$-ergodic decomposition has positive $a \( 1 \)$-entropy. In particular, this holds for every probability limit in Proposition 11.]
] <cor:rig-positive-components>

#proof[
  The group $A_4 tilde.eq bb(R)^3$ is locally compact and second countable, and acts continuously on the standard Borel space $X_4$. The ergodic decomposition theorem #cite(label("GreschonigSchmidt2000")) Theorem 5.2, specialized to invariant probabilities, gives a measurable decomposition
  $ mu = integral_Z nu_z thin d tau \( z \) $
  into $A_4$-invariant, $A_4$-ergodic probabilities over a factor fixed by $A_4$. Put $T \( x \) = x a \( 1 \)$.
  We record why a restriction to the zero-entropy components is measurable. Choose increasing finite Borel partitions $cal(P)_k$ generating the Borel $sigma$-algebra of $X_4$. For any $T$-invariant probability $nu$, the Kolmogorov–Sinai approximation theorem and subadditivity give
  $ h_nu \( T \) = sup_k inf_(N gt.eq 1) 1 / N H_nu (or.big_(j = 0)^(N - 1) T^(- j) cal(P)_k) \, $
  where $H_nu$ is the Shannon entropy of a finite partition. Each finite-partition entropy is a Borel function of $nu$, so $z mapsto h_(nu_z) \( T \)$ is measurable. For each probability under consideration, complete the standard Borel probability space; it is then a normalized Lebesgue space. The entropy integral formula for an invariant component factor #cite(label("Rokhlin1967")) Theorem 9.8 gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ h_mu \( T \) = integral_Z h_(nu_z) \( T \) thin d tau \( z \) \, $ <eq:rig-entropy-decomposition>]
  and the same formula after restricting and normalizing $tau$ on any measurable subset of positive measure. This formula applies because the component factor is fixed by $T$. It does not require the individual $nu_z$ to be $T$-ergodic.
  If $Z_0 = { z : h_(nu_z) \( T \) = 0 }$ had measure $w > 0$, then
  $ xi = 1 / w integral_(Z_0) nu_z thin d tau \( z \) $
  would be an $A_4$-invariant probability with $xi lt.eq w^(- 1) mu$. The restricted form of Equation (4.4) would give $h_xi \( T \) = 0$, contrary to Proposition 13. ◻
]

=== 4.2 Finite-volume subgroups containing the diagonal group <finite-volume-subgroups-containing-the-diagonal-group>

We next use the measure-classification theorem of Einsiedler–Katok–Lindenstrauss #cite(label("EKL2006")) Theorem 1.3; definition in Conjecture 1.1. We state the exact specialization that supplies the homogeneous measures needed here.

#thm([Theorem 4.4.])[
  (Positive-entropy measure classification).  #emph[For $n gt.eq 3$, let $A_n$ be the group of positive diagonal matrices in $upright("SL")_n \( bb(R) \)$. Let $nu$ be an $A_n$-invariant and $A_n$-ergodic probability on $upright("SL")_n \( bb(R) \) \/ upright("SL")_n \( bb(Z) \)$, with the left action. If $h_nu \( a_0 \( 1 \) \) > 0$ for some one-parameter subgroup $a_0 : bb(R) arrow.r A_n$, then there are a closed connected subgroup $L subset upright("SL")_n \( bb(R) \)$ containing $A_n$ and a point $x$ such that $L x$ is closed and $nu$ is the $L$-invariant probability on $L x$.]
] <thm:rig-ekl-classification>

No ergodicity for the chosen one-parameter subgroup is assumed. For $n = 4$, inversion $upright("SL")_4 \( bb(Z) \) g mapsto g^(- 1) upright("SL")_4 \( bb(Z) \)$ turns right multiplication by $a \( t \)$ into left multiplication by $a \( - t \)$, and entropy is unchanged upon inverting an invertible transformation. Thus, on our right quotient, the theorem says that a positive-entropy $A_4$-ergodic probability is invariant probability on an orbit $Lambda J$, where $J$ is closed and connected, contains $A_4$, and the stabilizer of $Lambda$ is a lattice in $J$.

For a partition $cal(I) = { I_1 \, dots.h \, I_s }$ of ${ 1 \, 2 \, 3 \, 4 }$ into nonempty subsets, define

#[#set math.equation(numbering: n => "(4.5)")
 $ J_(cal(I)) = {g in upright("SL")_4 \( bb(R) \) : g_(i j) = 0 upright(" if ") i \, j upright(" belong to different ") I_v \,\
det \( g \|_(bb(R)^(I_v)) \) > 0 upright(" for every ") v} . $ <eq:rig-block-group>]

This is the identity component of the corresponding block-diagonal group. Lindenstrauss and Weiss identified the equal-block phenomenon for orbit closures containing a compact diagonal orbit #cite(label("LindenstraussWeiss2001")) Theorem 1.3; their result also enters the proof of #cite(label("EKL2006")) Corollary 1.4. The next lemma gives a direct finite-volume argument and records the rational structure of the blocks.

#thm([Lemma 4.5.])[
  (Equal blocks and a rational commutant).  #emph[Let $J$ be a closed connected subgroup of $upright("SL")_4 \( bb(R) \)$ containing $A_4$, and let $Lambda in X_4$. Suppose that the stabilizer $Gamma_Lambda = { j in J : Lambda j = Lambda }$ is a lattice in $J$. Then $J = J_(cal(I))$ for a partition $cal(I)$ whose blocks all have the same size.]
  #emph[More precisely, put $W_(bb(Q)) = bb(Q) Lambda$ and $W_(bb(R)) = W_(bb(Q)) ⊗_(bb(Q)) bb(R) = bb(R)^4$. There is a totally real number field $E subset "End"_(bb(Q)) \( W_(bb(Q)) \)$, of degree $s = \| cal(I) \|$, whose scalar extension to $bb(R)$ is exactly the commutant of $J$ in $"End"_(bb(R)) \( W_(bb(R)) \)$. The coordinate blocks $bb(R)^(I_v)$ are the real eigenspaces of $E$ on $W_(bb(R))$.]
] <lem:rig-equal-blocks>

#proof[
  Let $frak(j)$ be the Lie algebra of $J$. It contains the trace-zero diagonal algebra and is invariant under diagonal conjugation. The other weight spaces in $frak(s l)_4 \( bb(R) \)$ are the distinct one-dimensional spaces $bb(R) E_(i j)$, $i eq.not j$, where $E_(i j)$ is a matrix unit. An invariant subspace is a sum of these weight spaces, so $frak(j)$ consists of the diagonal algebra and a selection of the root spaces.
  The group $J$ is unimodular. One way to see this standard fact is to use the quotient criterion for Haar measures: existence of an invariant quotient measure and triviality of the modular character of the discrete group $Gamma_Lambda$ imply that the modular character of $J$ is trivial on $Gamma_Lambda$. It therefore descends to $Gamma_Lambda without J$. Its pushforward of invariant probability would be invariant under translations by its image. A nontrivial positive dilation admits no invariant probability on $bb(R)_(> 0)$, as its disjoint dilates of a fundamental interval all have the same mass. Hence the modular character is trivial on $J$.
  Draw a directed edge $i arrow.r j$ when $E_(i j) in frak(j)$. The trace of the adjoint action of $"diag" \( u_1 \, dots.h \, u_4 \)$, with $sum_i u_i = 0$, on $frak(j)$ is the sum of the selected roots $u_i - u_j$. Unimodularity makes this sum zero. Its coefficient at $u_i$ is the outgoing degree of $i$ minus its incoming degree. These coefficients sum to zero, and a linear form vanishing on $sum_i u_i = 0$ has all coefficients equal. Thus every vertex has equal outgoing and incoming degrees.
  Every edge now lies within a strongly connected component. Otherwise the finite directed acyclic graph of components would have a source with an outgoing edge; summing degree balance over that source would give a positive outgoing degree and zero incoming degree. For distinct indices, the bracket identity $\[ E_(i j) \, E_(j k) \] = E_(i k)$ makes the edge relation transitive. Each strongly connected component is consequently a complete directed graph. These components form a partition $cal(I)$, and $frak(j)$ is the Lie algebra of $J_(cal(I))$. Connected Lie subgroups with the same Lie algebra agree, giving $J = J_(cal(I))$.
  We use $Gamma_Lambda$ to recover a rational structure on the block scalars. Its elements preserve $Lambda$, hence act rationally on $W_(bb(Q))$. Let
  $ cal(C)_(bb(Q)) = { M in "End"_(bb(Q)) \( W_(bb(Q)) \) : M gamma = gamma M upright(" for every ") gamma in Gamma_Lambda } . $
  In a lattice basis the commutation equations have integer coefficients. A finite subcollection of these linear equations defines the same solution space, by finite dimensionality. It follows that $cal(C)_(bb(Q)) ⊗_(bb(Q)) bb(R)$ is the real commutant of $Gamma_Lambda$.
  We claim that this is also the real commutant of $J$. Let $M$ be a real endomorphism commuting with $Gamma_Lambda$. The continuous map
  $ Gamma_Lambda without J arrow.r "End"_(bb(R)) \( W_(bb(R)) \) \, #h(2em) Gamma_Lambda j mapsto j^(- 1) M j $
  is well-defined. Its pushforward of invariant probability is invariant under conjugation by $A_4$. Each off-diagonal coordinate is multiplied by a nontrivial positive dilation under some element of $A_4$. A probability on $bb(R)$ invariant under such a dilation is supported at zero: the annuli ${ x : r^k lt.eq \| x \| < r^(k + 1) }$, $k in bb(Z)$, for a fixed $r > 1$, are disjoint dilates covering $bb(R) \\ { 0 }$. Thus every off-diagonal coordinate of $j^(- 1) M j$ is zero almost everywhere. Invariant probability on the transitive space $Gamma_Lambda without J$ has full support; continuity makes $j^(- 1) M j$ diagonal for every $j in J$. In particular $M$ is diagonal. Conjugating by $1 + t E_(i j)$ for $i \, j$ in the same block forces its $i$-th and $j$-th diagonal entries to agree. Therefore $M$ is scalar on each block, which is exactly the condition that it commute with $J$. The reverse inclusion is immediate, proving the claim.
  It follows that $cal(C)_(bb(Q)) ⊗_(bb(Q)) bb(R) tilde.eq bb(R)^s$. In particular, $cal(C)_(bb(Q))$ is commutative and has no nonzero nilpotents. The structure theorem for finite reduced commutative algebras over $bb(Q)$ expresses it as a product of number fields, all totally real because its real scalar extension has no complex factor.
  This product has only one factor. If $e in cal(C)_(bb(Q))$ were an idempotent other than $0$ and $1$, then $W = e \( W_(bb(R)) \)$ would be a nonempty proper union of coordinate blocks, rational relative to $Lambda$. Every $gamma in Gamma_Lambda$ preserves the full lattice $Lambda ∩ W$ in $W$, so $\| det \( gamma \|_W \) \| = 1$. The continuous character
  $ chi : J arrow.r bb(R)_(> 0) \, #h(2em) chi \( j \) = \| det \( j \|_W \) \| $
  is therefore trivial on $Gamma_Lambda$. It is surjective: if $k = dim W$, a diagonal matrix may scale the coordinates in $W$ by $e^(\( 4 - k \) t)$ and those in its complement by $e^(- k t)$. Its total determinant is one and its determinant on $W$ is $e^(k \( 4 - k \) t)$. The character $chi$ would consequently push the invariant probability on $Gamma_Lambda without J$ to a probability on $bb(R)_(> 0)$ invariant under all multiplicative translations. The disjoint-interval argument above rules this out. Thus $cal(C)_(bb(Q))$ is a field, which we denote by $E$.
  Since $E ⊗_(bb(Q)) bb(R) tilde.eq bb(R)^s$, its degree is $s$. The space $W_(bb(Q))$ is a vector space over $E$, and
  $ W_(bb(Q)) ⊗_(bb(Q)) bb(R) tilde.eq xor.big_(tau : E arrow.r.hook bb(R)) W_(bb(Q)) ⊗_(E \, tau) bb(R) . $
  Each summand has dimension $dim_E W_(bb(Q)) = 4 \/ s$. These summands are the eigenspaces of the block-scalar algebra, namely the coordinate blocks. The blocks therefore have equal size. ◻
]

For a positive-entropy homogeneous probability the lemma leaves $J = upright("SL")_4 \( bb(R) \)$ or two blocks of size two. Indeed, the only other equal-block possibility is four singleton blocks, giving $J = A_4$. A lattice in $A_4 tilde.eq bb(R)^3$ has compact quotient, and translations on this torus have zero entropy: for a flat metric they are isometries, so the iterated Bowen metrics equal the original metric and the topological entropy is zero; the variational principle bounds measure entropy by topological entropy.

For a possible two-block limit orbit $Lambda J$, the quadratic field $E subset "End"_(bb(Q)) \( bb(Q) Lambda \)$ has real scalar extension equal to the commutant of $J$ in $"End"_(bb(R)) \( bb(R)^4 \)$. The construction supplies no embedding of $E$ into the packet fields $K_i$, so their primitivity does not by itself exclude this orbit. We will exclude it by proving that packet limits give zero mass to the exterior obstruction below.

=== 4.3 The three exterior obstruction events <the-three-exterior-obstruction-events>

Let $e_1 \, dots.h \, e_4$ be the coordinate basis of $bb(R)^4$. For $w in and.big^2 bb(R)^4$, write $w_(i j)$, $i < j$, for its coefficients in the basis $e_i and e_j$, and define

#[#set math.equation(numbering: n => "(4.6)")
 $ Q \( w \) = w_12 w_34 - w_13 w_24 + w_14 w_23 . $ <eq:rig-Q>]

The identity

$ w and w = 2 Q \( w \) thin e_1 and e_2 and e_3 and e_4 $

shows that $Q \( \( and.big^2 g \) w \) = det \( g \) Q \( w \)$ for $g in upright("GL")_4 \( bb(R) \)$. Expressing a unimodular lattice in a determinant-one basis gives

#[#set math.equation(numbering: n => "(4.7)")
 $ Q #scale(x: 120%, y: 120%)[\(] and.big^2 Lambda #scale(x: 120%, y: 120%)[\)] subset bb(Z) #h(2em) \( Lambda in X_4 \) . $ <eq:rig-Q-integral>]

This also covers the sign translates in the packet definition: a coordinate reflection of determinant $- 1$ changes only the sign of $Q$.

Let

$ cal(B) = { 12 \| 34 \, med 13 \| 24 \, med 14 \| 23 } . $

For $b = i j \| k l in cal(B)$, with the indices within each pair increasing, put

#[#set math.equation(numbering: n => "(4.8)")
 $ V_b = "span"_(bb(R)) { e_i and e_j \, e_k and e_l } . $ <eq:rig-planes>]

The restriction of $Q$ to $V_b$ is, up to sign, the product of its two displayed coordinates. Define

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(E)_b = {Lambda in X_4 : upright("there exists ") w in and.big^2 Lambda ∩ V_b upright(" with ") Q \( w \) eq.not 0} . $ <eq:rig-events>]

Each $cal(E)_b$ is $A_4$-invariant and Borel. For Borel measurability, take a countable cover of $X_4$ by local charts admitting continuous lattice bases. In a chart, the six integer coefficients of an exterior vector label it continuously. For each label, membership in $V_b$ is a set of continuous coordinate equalities, and $Q \( w \) eq.not 0$ is an open condition. Taking the countable union over labels and charts proves the claim. Invariance follows because $A_4$ preserves $V_b$ and $Q$.

#thm([Proposition 4.6.])[
  (The quartic homogeneous obstruction).  #emph[Let $nu$ be an $A_4$-invariant, $A_4$-ergodic probability on $X_4$. Suppose that $h_nu \( a_0 \( 1 \) \) > 0$ for some one-parameter subgroup $a_0 : bb(R) arrow.r A_4$. Then either $nu = m_4$, or there exists $b in cal(B)$ such that $nu \( cal(E)_b \) = 1$. In the latter case every lattice $Lambda'$ in the homogeneous orbit carrying $nu$ has a vector in $and.big^2 Lambda' ∩ V_b$ with both coordinates nonzero and with nonzero integer $Q$-value.]
] <prop:rig-obstruction>

#proof[
  Theorem 15, in the right-quotient form explained above, represents $nu$ as invariant probability on $Lambda J$ for a connected closed subgroup $J$ containing $A_4$. By Lemma 16 and the positive-entropy assumption, either $J = upright("SL")_4 \( bb(R) \)$, which gives $nu = m_4$, or $J$ has two coordinate blocks of size two.
  In the second case write the blocks as ${ i \, j }$ and ${ k \, l }$, and put $b = i j \| k l$. The commutant field $E$ in Lemma 16 is quadratic. Choose a nonzero $alpha in E$ with $"Tr"_(E \/ bb(Q)) \( alpha \) = 0$. Its two scalar values on the blocks are $c$ and $- c$, with $c eq.not 0$. The rational endomorphism $alpha$ of $W_(bb(Q)) = bb(Q) Lambda$ induces a rational endomorphism
  $ D_alpha : and.big^2 W_(bb(Q)) arrow.r and.big^2 W_(bb(Q)) \, #h(2em) D_alpha \( v and w \) = alpha \( v \) and w + v and alpha \( w \) . $
  On the exterior square of the first block it acts by $2 c$, and on that of the second by $- 2 c$. It vanishes on the cross-block summand. Its real image is therefore exactly
  $ and.big^2 bb(R)^({ i \, j }) xor and.big^2 bb(R)^({ k \, l }) = V_b . $
  Because $D_alpha$ is rational, $V_b$ is a rational subspace relative to $and.big^2 W_(bb(Q))$.
  It follows that $V_b ∩ and.big^2 Lambda$ is a rank-two lattice in $V_b$. It contains a vector off both coordinate axes: take two independent lattice vectors; if neither is already off the axes, their sum is. For this vector $Q \( w \) eq.not 0$, and Equation (4.7) makes its value a nonzero integer. Every element of $J$ preserves each of the two exterior lines, multiplying its coefficient by the nonzero determinant of the corresponding block. The translated vector therefore has both coordinates nonzero at every lattice of $Lambda J$. This proves $nu \( cal(E)_b \) = 1$. ◻
]

Corollary 14 and Proposition 17 reduce identification of a packet probability limit $mu$ to proving $mu \( cal(E)_b \) = 0$ for all three $b in cal(B)$. Equation (4.7) lets us test those events one nonzero integer $Q$-value at a time. The next sections establish the exterior-vector estimate used for this exclusion.

== 5 The cubic resolvent and exterior multiplicities <sec:exterior>

The obstruction in Section 4 is detected by an exterior vector concentrated in one pair of opposite coordinates. We shall count such vectors through their three signed opposite products. After packet normalization these products form a triple in a cubic field, and concentration near one exterior plane confines two of them to a small rectangle. Our goal is a uniform count in that rectangle. We first define the count and reduce its multiplicities to local densities. We then construct the integral quadratic structure that will control those densities in the next two sections.

=== 5.1 The three products and the counting problem <the-three-products-and-the-counting-problem>

Let $tilde(K) subset bb(R)$ be the normal closure of $K$, and let $G = "Gal" \( tilde(K) \/ bb(Q) \)$ act on the four ordered embeddings of $K$. This permutation action is primitive: a nontrivial block would give a field strictly between $bb(Q)$ and $K$. A transitive subgroup of $S_4$ has order $4 \, 8 \, 12$, or $24$. A subgroup of order $4$ or $8$ is contained in a Sylow $2$-subgroup, which preserves a partition into two pairs. It follows that

$ G = frak(A)_4 quad upright("or") quad G = S_4 . $

Both groups act transitively on the six two-element subsets of ${ 1 \, 2 \, 3 \, 4 }$ and on the set of pair partitions

$ cal(B) = { 12 \| 34 \, med 13 \| 24 \, med 14 \| 23 } . $

Define

#[#set math.equation(numbering: n => "(5.1)")
 $ F = {\( z_b \)_(b in cal(B)) in tilde(K)^(cal(B)) : g \( z_b \) = z_(g b) med upright("for all ") g in G \, med b in cal(B)} . $ <eq:ext-resolvent>]

Evaluation at any partition identifies this algebra with the fixed field of its stabilizer. Thus $F$ is a totally real cubic field, and its three real embeddings are the coordinates in Equation (5.1). In particular, $"Tr"_(F \/ bb(Q)) z = sum_b z_b$. This is the classical cubic resolvent from the action on pair partitions; for its relation to cubic resolvent rings, see #cite(label("Bhargava2004III")) Section 2.3. We write $R_F = cal(O)_F$ and $D_F = \| "Disc" \( F \) \|$.

Put

$ V = and.big_(bb(Q))^2 K \, #h(2em) L_V = and.big_(bb(Z))^2 cal(O) . $

For $w = sum_r x_r and y_r in V$, its embedding coordinates are

$ w_(i j) = sum_r #scale(x: 120%, y: 120%)[\(] sigma_i \( x_r \) sigma_j \( y_r \) - sigma_j \( x_r \) sigma_i \( y_r \) #scale(x: 120%, y: 120%)[\)] quad \( i < j \) \, #h(2em) w_(j i) = - w_(i j) . $

Choose a basis $beta_1 \, dots.h \, beta_4$ of $cal(O)$ whose real embedding matrix $A_(cal(O)) = \( sigma_i \( beta_j \) \)$ has positive determinant. Write $delta_(cal(O)) = det A_(cal(O)) in tilde(K)$. Its selected real value is $X = q sqrt(D)$, and

#[#set math.equation(numbering: n => "(5.2)")
 $ delta_(cal(O))^(thin 2) = "Disc" \( cal(O) \) = X^2 . $ <eq:ext-embedding-determinant>]

Define the quadratic expression

#[#set math.equation(numbering: n => "(5.3)")
 $ Psi \( w \) = delta_(cal(O))^(- 1) \( w_12 w_34 \, - w_13 w_24 \, w_14 w_23 \) . $ <eq:ext-product-map>]

#thm([Lemma 5.1.])[
  (The product map).  #emph[The expression in Equation (5.3) defines a rational quadratic map $Psi : V arrow.r F$. In the exterior basis of $L_V$ induced by $\( beta_i \)$, write $w = sum_(i < j) t_(i j) beta_i and beta_j$. Then 
#[#set math.equation(numbering: n => "(5.4)")
 $ Q_V \( w \) := "Tr"_(F \/ bb(Q)) Psi \( w \) = t_12 t_34 - t_13 t_24 + t_14 t_23 . $ <eq:ext-integral-form>]

 If $w in V$ is nonzero, all six $w_(i j)$, and hence all three components of $Psi \( w \)$, are nonzero. For every extension $k \/ bb(Q)$, $a in \( K ⊗_(bb(Q)) k \)^times$, $c in k$, and $w in V ⊗_(bb(Q)) k$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ Psi #scale(x: 120%, y: 120%)[\(] c \( and.big^2 a \) w #scale(x: 120%, y: 120%)[\)] = c^2 "N"_(K ⊗ k \/ k) \( a \) Psi \( w \) \, $ <eq:ext-covariance>]

 where $and.big^2 a$ is the exterior square of multiplication by $a$.]
] <lem:ext-products>

#proof[
  An element $g in G$ permutes the rows of $A_(cal(O))$, so it multiplies $delta_(cal(O))$ by the sign of that permutation. Permuting the four indices in the three signed products in Equation (5.3) permutes the partitions and introduces the same common sign. Division by $delta_(cal(O))$ gives precisely the equivariance in Equation (5.1). This is an identity of quadratic polynomials in the rational coordinates of $w$, and therefore defines a rational quadratic map to $F$.
  The Pfaffian identity for the exterior square of a four-dimensional linear map is
  $ Q #scale(x: 120%, y: 120%)[\(] \( and.big^2 A_(cal(O)) \) t #scale(x: 120%, y: 120%)[\)] = det \( A_(cal(O)) \) Q \( t \) \, #h(2em) Q \( t \) = t_12 t_34 - t_13 t_24 + t_14 t_23 . $
  It follows either by expanding the six minors or by evaluating $1 / 2 t and t$ in the top exterior power. This proves Equation (5.4). If a coordinate of a rational $w$ vanishes, Galois transitivity on the unordered pairs makes all six coordinates vanish. The exterior embedding map is injective, so $w = 0$. Finally, multiplication by $a$ multiplies $w_(i j)$ by $a_i a_j$ after splitting, where $a_i$ are its four embeddings. Each opposite product is multiplied by $product_i a_i = "N" \( a \)$, and the scalar $c$ contributes $c^2$. This proves Equation (5.5) after splitting and hence over $k$. ◻
]

We relate these products to the packet model of Section 2. Let $I$ be one of its maximal-order ideal-class representatives, let $L subset I$ be one of its local labels, and let $v = \( v_i \) in T_oo$. If $w in and.big_(bb(Z))^2 L$, the corresponding exterior vector in the normalized lattice has coordinates

$ hat(w)_(i j) = \( X "N" I \)^(- 1 \/ 2) w_(i j) v_i v_j . $

Since $product_i \| v_i \| = 1$, the number $epsilon.alt \( v \) = product_i v_i$ is $1$ or $- 1$. Thus

#[#set math.equation(numbering: n => "(5.6)")
 $ \( hat(w)_12 hat(w)_34 \, - hat(w)_13 hat(w)_24 \, hat(w)_14 hat(w)_23 \) = epsilon.alt \( v \) thin z \( I \, w \) \, #h(2em) z \( I \, w \) := frac(Psi \( w \), "N" I) . $ <eq:ext-signed-products>]

In particular $Q \( hat(w) \) = epsilon.alt \( v \) "Tr" z \( I \, w \)$. This records exactly how the diagonal signs act on the products.

Lemma 18 and the normalization above show that every lattice in a packet lies outside each $cal(E)_b$. To prove that weak limits give these events zero mass, we need quantitative control of exterior vectors near $V_b$; the count below supplies the arithmetic input for that control.

For a rational prime $p$, fix a generator $I_p = xi_p R_p$ as in the packet model, and give $R_p^times$ its Haar probability. For $0 eq.not w in and.big_(bb(Z))^2 I$, define

#[#set math.equation(numbering: n => "(5.7)")
 $ P_p \( I \, w \) = integral_(R_p^times) upright(bold(1))_(and.big_(bb(Z)_p)^2 \( xi_p t cal(O)_p \)) \( w \) thin d^times t . $ <eq:ext-label-probability>]

Changing $xi_p$ by an $R_p$-unit leaves this probability unchanged. For $p divides.not q$, it is $1$. Hence $product_p P_p \( I \, w \)$ is a finite product. Multiplication by $U^(+)$ preserves these probabilities by translation of the local unit variables. For $e in U^(+)$, the algebraic norm $"N"_(K \/ bb(Q)) \( e \) = 1$, so Equation (5.5) also shows that $z \( I \, w \)$ is unchanged. We use $U^(+)$ to unfold the positive real parameters on each choice of signs. Its action on nonzero exterior vectors is free: if a totally positive unit $e$ fixes $w$, then $e_i e_j = 1$ for every pair by Lemma 18; the four positive $e_i$ must all be $1$.

For $z in F$, define the nonnegative weighted multiplicity

#[#set math.equation(numbering: n => "(5.8)")
 $ M \( z \) = sum_(I \, #h(0.27778em) w in \( and.big_(bb(Z))^2 I \\ { 0 } \) \/ U^(+)\
z \( I \, w \) = z) product_p P_p \( I \, w \) . $ <eq:ext-multiplicity>]

The sum is initially allowed to have value $+ oo$; the local bounds below prove its finiteness on the nonzero trace slices used here. It depends on $K \, cal(O)$, the ordering of the embeddings, and the chosen system of maximal-order ideal representatives, which we suppress from the notation. In fact replacing $I$ by $a I$ and transporting $w$ by $and.big^2 a$ multiplies that class’s products by $"sgn" \( "N"_(K \/ bb(Q)) a \)$, since $"N" \( a I \) = \| "N"_(K \/ bb(Q)) a \| "N" I$. We keep the representative system fixed. A term of positive weight admits a local label at every prime. These labels patch to a global $L$, and local membership implies $w in and.big_(bb(Z))^2 L$. Equation (5.6), with positive signs, then shows that $"Tr" z \( I \, w \)$ is the integral value of $Q$ on a unimodular exterior lattice. Thus

#[#set math.equation(numbering: n => "(5.9)")
 $ M \( z \) > 0 quad arrow.r.double quad z in F^times \, #h(2em) "Tr"_(F \/ bb(Q)) z in bb(Z) . $ <eq:ext-trace-support>]

For $m in bb(Z) \\ { 0 }$, put

$ cal(H)_m = { \( y_b \)_(b in cal(B)) in bb(R)^(cal(B)) : sum_b y_b = m } . $

A rectangle in $cal(H)_m$ means the inverse image of a product of two intervals under any two distinct partition coordinates. Its area is the product of those interval lengths. The following estimate is the arithmetic input needed to exclude the obstruction.

#thm([Theorem 5.2.])[
  (Planar exterior count).  #emph[There is an absolute $tau > 0$ with the following property. Fix $m in bb(Z) \\ { 0 }$ and a bounded set $Omega subset cal(H)_m$. For every primitive totally real quartic field $K$, every order $cal(O) subset K$, every ordering of its real embeddings, and every chosen system of fractional $R$-ideal representatives for the ordinary classes, let $M$ be defined by Equation (5.8). For all sufficiently large $X$, every rectangle $cal(R) subset Omega$ whose two side lengths are at least $X^(- tau)$ satisfies 
#[#set math.equation(numbering: n => "(5.10)")
 $ sum_(z in F \, med "Tr" z = m\
z in cal(R)) M \( z \) lt.double_(m \, Omega) kappa sqrt(D) thin "area" \( cal(R) \) . $ <eq:ext-planar-count>]

 The implied constant and the threshold for $X$ are uniform in the field, the order, the embedding ordering, the ideal representative system, the position of the rectangle, and its side lengths and aspect ratio.]
] <thm:exterior-count>

Here and below we identify $z in F$ with its real triple. To see the scale of this statement, suppose $Q \( hat(w) \) = m$ and the four coordinates outside $12 \| 34$ have absolute value less than $r$. The signed products of $hat(w)$ then have the form $\( m - y_2 - y_3 \, y_2 \, y_3 \)$ with $\| y_2 \| \, \| y_3 \| < r^2$. Their region has area $O \( r^4 \)$. Equation (5.6) allows either trace $m$ or $- m$ for $z \( I \, w \)$, so the theorem is used at both fixed traces. Sections 6–8 prove Theorem 19; the remainder of this section supplies its local and algebraic inputs.

=== 5.2 The local product fibers <the-local-product-fibers>

Fix $m eq.not 0$ for the rest of the section. Choose once a sufficiently large absolute $p_0$, and put

#[#set math.equation(numbering: n => "(5.11)")
 $ S = { p : p divides D q m } med union med { p : p lt.eq p_0 } . $ <eq:ext-prime-set>]

For fixed $m$, $product_(p in S) p lt.double_m D q lt.eq X^2$. At primes in $S$ we shall keep the exact additive density of the products. Outside $S$, integral valuations give a simpler bound.

The following comparison explains what a fiber remembers about an exterior vector. For $k = bb(Q)$ or $k = bb(Q)_p$, put $K_k = K ⊗_(bb(Q)) k$ and $V_k = V ⊗_(bb(Q)) k$, and take embedding coordinates over a splitting field of the etale algebra $K_k$.

#thm([Lemma 5.3.])[
  (Comparison of two product fibers).  #emph[Let $w \, w' in V_k$ have all six embedding coordinates nonzero. Suppose that their coordinate ratios $r_(i j) = w'_(i j) \/ w_(i j)$ satisfy 
$ r_12 r_34 = r_13 r_24 = r_14 r_23 = s in k^times . $

 There exist $a in K_k^times$ and $c in k^times$ such that 
$ w' = c \( and.big^2 a \) w \, #h(2em) c^2 "N"_(K_k \/ k) \( a \) = s . $

 The pair $\( a \, c \)$ is unique up to $\( a \, c \) mapsto \( d a \, d^(- 2) c \)$, $d in k^times$.]
] <lem:ext-comparison>

#proof[
  Over the splitting field set
  $ c_0 = frac(r_12 r_13, r_23) \, #h(2em) \( a_1 \, a_2 \, a_3 \, a_4 \) = (1 \, r_23 / r_13 \, r_23 / r_12 \, frac(r_14 r_23, r_12 r_13)) . $
  The three equal opposite products give $r_(i j) = c_0 a_i a_j$ for every pair. If two such factorizations are divided, all products of two of the four coordinatewise quotients are equal. Comparing pairs that share one index shows that the four quotients are equal. Hence the projective tuple $\[ a_1 : a_2 : a_3 : a_4 \]$ is uniquely determined.
  The ratios $r_(i j)$ are Galois-equivariant without alternating signs. Uniqueness makes the projective tuple equivariant for the permutation action on the four embeddings. Express it in a $k$-basis of $K_k$. The resulting projective coefficient vector is fixed by the usual Galois action. Dividing by one nonzero coefficient makes every coefficient fixed, hence in $k$. It gives $a in K_k^times$, since all four embedding components are nonzero. The remaining coefficient $c$ in $r_(i j) = c a_i a_j$ is Galois-fixed as well. This proves existence over $k$, including when $K_k$ is a product of nonsplit fields. The projective uniqueness proves the stated ambiguity. Multiplying two opposite equalities gives $c^2 "N" \( a \) = s$. ◻
]

For a prime $p$, $F_p^times$ denotes the elements nonzero in every field factor of $F_p$. In the local formulas below, $"N" \( a \)$ denotes the algebraic norm $"N"_(K_p \/ bb(Q)_p) \( a \)$. For a global pair in Equation (5.8), choose a representative $0 eq.not w in and.big_(bb(Z))^2 I$ of its $U^(+)$-orbit and put

$ x = \( and.big^2 xi_p \)^(- 1) w \, #h(2em) u = frac("N"_(K_p \/ bb(Q)_p) \( xi_p \), "N" I) . $

The valuations of the numerator and denominator in $u$ are equal: both are the norm valuation of $I_p$. Thus $u in bb(Z)_p^times$, and Equation (5.5) gives $u Psi \( x \) = z \( I \, w \)$. Inverting the unit variable in Equation (5.7) gives

#[#set math.equation(numbering: n => "(5.12)")
 $ P_p \( I \, w \) = Pr_(a in R_p^times) #scale(x: 120%, y: 120%)[\[] \( and.big^2 a \) x in L_(V \, p) #scale(x: 120%, y: 120%)[\]] . $ <eq:ext-unit-membership>]

These representatives lead us to consider, for arbitrary $z in F_p^times$, the full local fiber

$ cal(F)_p \( z \) = { \( x \, u \) in V_p times bb(Z)_p^times : u Psi \( x \) = z } . $

Define the abelian local group and its unit subgroup by

#[#set math.equation(numbering: n => "(5.13)")
 $ cal(G)_p & = { \( a \, c \) in K_p^times times bb(Q)_p^times : c^2 "N" \( a \) in bb(Z)_p^times } \/ { \( d \, d^(- 2) \) : d in bb(Q)_p^times } \,\
cal(U)_p & = "image" \( R_p^times times bb(Z)_p^times \) med subset cal(G)_p . $ <eq:ext-local-group>]

The quotient in the first line means that $d$ acts by $\( a \, c \) mapsto \( d a \, d^(- 2) c \)$. The action on the fiber is

#[#set math.equation(numbering: n => "(5.14)")
 $ \( a \, c \) dot.op \( x \, u \) = (c \( and.big^2 a \) x \, thin frac(u, c^2 "N" \( a \))) . $ <eq:ext-fiber-action>]

Lemma 20, with $s = u \/ u'$, shows that this action is free and transitive when the fiber is nonempty. The explicit ratios in its proof also give analytic local inverses, so this is an analytic identification of the fiber with $cal(G)_p$. The group $cal(U)_p$ is compact and open. The kernel of its unit parametrization is exactly $d in bb(Z)_p^times$: if both $a$ and $d a$ are $R_p$-units, then $v_p \( d \) = 0$. In particular this assertion holds at ramified primes.

Choose a reference in a nonempty fiber and use it to identify the fiber with $cal(G)_p$. For a coset $frak(c) in cal(G)_p \/ cal(U)_p$, let $alpha_p \( frak(c) \; z \)$ be the fraction of that coset for which $x in L_(V \, p)$, using Haar probability on $cal(U)_p$. We call the coset accepted when $alpha_p \( frak(c) \; z \) > 0$. The fraction is independent of the representative of the coset. The sum of these fractions is independent of the reference. For an empty fiber we declare this sum to be zero.

A scalar $c in bb(Z)_p^times$ preserves $L_(V \, p)$. The pushforward of the product Haar probability on $R_p^times times bb(Z)_p^times$ is Haar probability on $cal(U)_p$. Hence the representative constructed from $\( I \, w \)$ occupies a coset $frak(c)$ for which $P_p \( I \, w \) = alpha_p \( frak(c) \; z \( I \, w \) \)$.

We now measure the sum over all local cosets. Fix an additive character $psi_p$ of $bb(Q)_p$ with conductor $bb(Z)_p$, and let $d z$ be the self-dual Haar measure on $F_p$ for the trace pairing. Thus

#[#set math.equation(numbering: n => "(5.15)")
 $ "vol"_(d z) \( R_(F \, p) \) = \| D_F \|_p^(1 \/ 2) . $ <eq:ext-self-dual-measure>]

For every $p$, consider the law of the random variable

#[#set math.equation(numbering: n => "(5.16)")
 $ u Psi \( x \) \, #h(2em) x med upright("uniform additive in ") L_(V \, p) \, #h(2em) u med upright("uniform in ") bb(Z)_p^times \, $ <eq:ext-density-law>]

with the two choices independent. The next lemma proves that this law has a density with respect to $d z$; we denote its locally constant version on $F_p^times$ by $f_p^(*) \( z \)$. Only the densities for $p in S$ will enter the multiplicity bound.

#thm([Lemma 5.4.])[
  (Local density and disintegration).  #emph[The law in Equation (5.16) has a density, with a locally constant version on $F_p^times$. For every $z in F_p^times$, only finitely many cosets are accepted, and their fractions satisfy the exact identity 
#[#set math.equation(numbering: n => "(5.17)")
 $ sum_(frak(c) in cal(G)_p \/ cal(U)_p) alpha_p \( frak(c) \; z \) = \| D \|_p^(- 1 \/ 2) frac(1 - p^(- 1), product_(frak(p) divides p \, med frak(p) subset R) \( 1 - "N" \( frak(p) \)^(- 1) \)) f_p^(*) \( z \) . $ <eq:ext-density-disintegration>]

 The sum and the density are both zero if $cal(F)_p \( z \)$ is empty. The identity holds at every prime, including primes dividing $q$ and the small ramified primes.]
] <lem:ext-density>

#proof[
  Let $Phi_p \( x \, u \) = u Psi \( x \)$. If $Phi_p \( x \, u \) in F_p^times$, all six split coordinates of $x$ are nonzero. After splitting, the derivative in $x$ is the derivative of three products on three disjoint two-dimensional planes. It has rank three, and therefore has rank three over $bb(Q)_p$. The map is a submersion there. The remaining input set is a finite union of proper algebraic zero loci and has additive measure zero. Local change of variables gives an absolutely continuous pushforward on the submersion locus, hence a density for the full law. To obtain a locally constant version at a fixed $z in F_p^times$, cover its inverse image in the compact set $L_(V \, p) times bb(Z)_p^times$ by finitely many submersion charts, refined to disjoint compact open pieces. The compact complement has image avoiding a sufficiently small neighborhood of $z$. On that neighborhood each chart contributes a locally constant density. This also treats an empty inverse image.
  Give $V_p$ its additive measure for which $L_(V \, p)$ has mass one, before restricting to that lattice. We first compute the fiber form for the product input measure after disintegration against $d z$, and then the mass of $cal(U)_p$ for that form. In a $bb(Q)_p$ submersion chart, the relative absolute four-form is obtained by evaluating the input top form on four fiber basis vectors and three lifts of a target basis, then dividing by the $d z$-form on that target basis. We may compute this identity after extension to a splitting field, still evaluating on $bb(Q)_p$ tangent vectors and using the fixed extension of $\| p \|_p = p^(- 1)$. We use the same interpretation for the scalar quotient below.
  Over a splitting field, the exterior embedding matrix has determinant $delta_(cal(O))^(thin 3)$. Consequently its measure form in the six embedding coordinates is
  $ \| delta_(cal(O)) \|_p^(- 3) lr(|and.big_(i < j) d x_(i j)|) . $
  Likewise $d z$ is the absolute embedding-coordinate form $lr(|and.big_(b in cal(B)) d z_b|)$. To verify the latter normalization, evaluate this form on an $R_(F \, p)$-basis. The square of its embedding determinant is the discriminant, so its absolute value is $\| D_F \|_p^(1 \/ 2)$, as in Equation (5.15).
  After splitting, compute the relative form by retaining $x_12 \, x_13 \, x_14 \, u$ and substituting the three product equations for $x_34 \, x_24 \, x_23$. The three change-of-variable factors are $\| delta_(cal(O)) \/ \( u x_12 \) \|_p$, $\| delta_(cal(O)) \/ \( u x_13 \) \|_p$, and $\| delta_(cal(O)) \/ \( u x_14 \) \|_p$. They cancel $\| delta_(cal(O)) \|_p^(- 3)$, since $u$ is a unit. Haar probability on $bb(Z)_p^times$ is $\( 1 - p^(- 1) \)^(- 1) \| d u \/ u \|$. The resulting fiber form is
  #[#set math.equation(numbering: n => "(5.18)")
   $ frac(1, 1 - p^(- 1)) lr(|frac(d x_12, x_12) and frac(d x_13, x_13) and frac(d x_14, x_14) and frac(d u, u)|) . $ <eq:ext-fiber-form>]
  The fiber action preserves this measure. Indeed its determinant on $V_p$ is $c^6 "N" \( a \)^3 = \( c^2 "N" \( a \) \)^3$, of absolute value one, and it multiplies $u$ by a unit while fixing $z$.
  It remains to compute the mass of $cal(U)_p$ in Equation (5.18). Put $ell_i = d a_i \/ a_i$ and $s = d c \/ c$ over the splitting field. The pullbacks of its four logarithmic differentials under Equation (5.14) are
  $ ell_1 + ell_2 + s \, quad ell_1 + ell_3 + s \, quad ell_1 + ell_4 + s \, quad - ell_1 - ell_2 - ell_3 - ell_4 - 2 s . $
  The vertical scalar direction $d$ has vector $\( 1 \, 1 \, 1 \, 1 \, - 2 \)$. Taking the first $ell_i$ as its coordinate and using the slice $ell_1 = 0$, the matrix on the four remaining differentials is
  $ mat(delim: "(", 1, 0, 0, 1; 0, 1, 0, 1; 0, 0, 1, 1; - 1, - 1, - 1, - 2) \, #h(2em) det = 1 . $
  The vertical coordinate has coefficient $1$. Equivalently, the wedge of the four displayed pullbacks is the contraction of $\( and.big_i ell_i \) and s$ by the vertical vector, up to sign. Evaluating this identity on four $bb(Q)_p$ tangent lifts of a quotient basis gives the same absolute quotient form for nonsplit $K_p$. On a patch where a $bb(Q)_p$-linear coefficient $lambda \( a \)$ is nonzero, normalizing it to its value at a reference point gives a genuine $bb(Q)_p$ section; after shrinking a unit-group patch, the normalizing scalar is a unit. Since $lambda \( d a \) = d lambda \( a \)$, the vertical logarithmic derivative is $1$. Thus the contraction is the quotient of the parameter form by $\| d d \/ d \|$, with quotient Jacobian $1$, including at $p = 2$.
  For an $R_p$-basis, the multiplicative embedding form on $K_p^times$ is the additive basis form multiplied by its embedding determinant and divided by $"N" \( a \)$. On $R_p^times$ the latter is a unit. The mass of this unit set is consequently
  $ \| D \|_p^(1 \/ 2) product_(frak(p) divides p \, med frak(p) subset R) \( 1 - "N" \( frak(p) \)^(- 1) \) . $
  The $c$-unit mass and the scalar-kernel $d$-unit mass are both $1 - p^(- 1)$, and cancel when taking the quotient. Haar integration on the compact unit groups assembles the local sections. Including the factor $\( 1 - p^(- 1) \)^(- 1)$ in Equation (5.18), the mass of each $cal(U)_p$-coset is
  #[#set math.equation(numbering: n => "(5.19)")
   $ frac(\| D \|_p^(1 \/ 2), 1 - p^(- 1)) product_(frak(p) divides p \, med frak(p) subset R) \( 1 - "N" \( frak(p) \)^(- 1) \) . $ <eq:ext-unit-coset-mass>]
  This calculation uses the actual image of the unit group, so it requires no surjectivity assertion about the norm on units.
  The accepted part of the fiber is the inverse image of $z$ in the compact set $L_(V \, p) times bb(Z)_p^times$. Since $cal(U)_p$ is open, this compact set meets only finitely many of its cosets. Integrating its indicator in the fiber multiplies the mass in Equation (5.19) by $sum_(frak(c)) alpha_p \( frak(c) \; z \)$. The result is the density $f_p^(*) \( z \)$. Solving for the sum proves Equation (5.17). ◻
]

In particular the order index has disappeared from the prefactor in Equation (5.17): its contribution through $delta_(cal(O))$ cancels in the three products. Its effect remains inside the density of the lattice $L_(V \, p)$. The discriminant in the prefactor is $D$ because the translating parameters are the maximal-order units $R_p^times$.

=== 5.3 Global multiplicity and the unramified factors <global-multiplicity-and-the-unramified-factors>

The local identity counts every local coset. We next bound how many global pairs can occupy one assignment of those cosets.

#thm([Lemma 5.5.])[
  (Global pairs in one assignment of cosets).  #emph[Fix $z in F^times$. Choose a reference in each nonempty local fiber $cal(F)_p \( z \)$. For any assignment $frak(c)_p in cal(G)_p \/ cal(U)_p$, at most $32$ pairs 
$ I \, #h(2em) w in \( and.big_(bb(Z))^2 I \\ { 0 } \) \/ U^(+) \, #h(2em) z \( I \, w \) = z $

 occupy the assigned coset at every prime.]
] <lem:ext-global-cosets>

#proof[
  For two such pairs, Lemma 20 over $bb(Q)$ gives $w' = c \( and.big^2 a \) w$ with $a in K^times$, $c in bb(Q)^times$, since the common opposite ratio is $"N" \( I' \) \/ "N" \( I \)$. Relative to the local generators $xi_p \, xi'_p$, their local comparison is represented by $\( a xi_p \/ xi'_p \, c \)$. Equality of the local cosets means that some $d_p in bb(Q)_p^times$ satisfies
  $ d_p a xi_p \/ xi'_p in R_p^times \, #h(2em) d_p^(- 2) c in bb(Z)_p^times . $
  In particular $v_p \( c \) = 2 v_p \( d_p \)$ is even at every finite prime. Therefore $c = epsilon.alt s^2$ with $s in bb(Q)^times$ and $epsilon.alt in { 1 \, - 1 }$. Absorbing $s$ into $a$ makes $a xi_p \/ xi'_p$ a unit for every $p$. Hence $I' = a I$ as fractional maximal-order ideals. The chosen representatives of the ordinary ideal classes then give $I' = I$ and $a in R^times = U$.
  There are at most $\[ U : U^(+) \] lt.eq 16$ possibilities for the unit action modulo $U^(+)$, distinguished by the four real signs, and two possibilities for $epsilon.alt$. This proves the bound $32$. ◻
]

At $p in.not S$, both local algebras are unramified, $cal(O)_p = R_p$, and $delta_(cal(O))$ is a unit in a splitting field. Let $phi_p$ be Frobenius acting on the four embeddings and on $cal(B)$. Its orbits on $cal(B)$ correspond to primes $frak(q) divides p$ of $F$, of residue degrees $f_(frak(q))$. The map from two-element subsets to partitions sends $i j$ to $i j \| k l$. Above a Frobenius orbit of partitions its pair labels form either two orbits or one. Define

$ epsilon.alt_(frak(q)) = cases(delim: "{", 1 \, & upright("if the pair labels form two orbits") \,, - 1 \, & upright("if they form one orbit") \,) #h(2em) b_(frak(q)) \( j \) = cases(delim: "{", j + 1 \, & epsilon.alt_(frak(q)) = 1 \,, upright(bold(1))_({ 2 divides j }) \, & epsilon.alt_(frak(q)) = - 1) = sum_(r = 0)^j epsilon.alt_(frak(q))^(thin r) . $

For $z in R_(F \, p) ∩ F_p^times$, put

#[#set math.equation(numbering: n => "(5.20)")
 $ j_(frak(q)) = v_(frak(q)) \( z \) \, #h(2em) b_p \( z \) = product_(frak(q) divides p) b_(frak(q)) \( j_(frak(q)) \) \, #h(2em) n_p \( z \) = max_(frak(q) divides p) j_(frak(q)) . $ <eq:ext-unramified-factor>]

Here $v_(frak(q))$ is the integral uniformizer valuation; it has $v_(frak(q)) \( p \) = 1$ at these primes. For probability statements one may set $n_p = oo$, $b_p = 0$ when a component vanishes, a set of Haar measure zero.

#thm([Lemma 5.6.])[
  (Unramified local data).  #emph[Let $p in.not S$. A local fiber with an accepted coset has $z in R_(F \, p)$, and for $z in R_(F \, p) ∩ F_p^times$, 
#[#set math.equation(numbering: n => "(5.21)")
 $ sum_(frak(c) in cal(G)_p \/ cal(U)_p) alpha_p \( frak(c) \; z \) lt.eq b_p \( z \) . $ <eq:ext-unramified-cosets>]

 One has $b_p = 1$ when $n_p = 0$, and $0 lt.eq b_p lt.eq \( 1 + n_p \)^3$.]
  #emph[Give the affine lattice 
$ { z in R_(F \, p) : "Tr"_(F_p \/ bb(Q)_p) z = m } $

 its Haar probability. With $t = p^(- 1)$ and $f_(frak(p))$ the residue degrees of the primes of $K$ above $p$, 
#[#set math.equation(numbering: n => "(5.22)")
 $ bb(E)_p b_p & = \( 1 - t \) \( 1 - t^3 \) product_(frak(p) divides p) \( 1 - t^(f_(frak(p))) \)^(- 1) = 1 + frac(a_K \( p \) - 1, p) + O \( p^(- 2) \) \,\
bb(P)_p \( n_p gt.eq k \) & lt.eq 3 p^(- k) #h(2em) \( k gt.eq 1 \) . $ <eq:ext-unramified-mean>]

 The error constant is absolute. In any integral affine coordinates on the trace lattice, ${ n_p gt.eq k }$ is determined modulo $p^k$, and $b_p upright(bold(1))_({ n_p = k })$ is determined modulo $p^(k + 1)$ for every finite $k gt.eq 0$.]
] <lem:ext-unramified-data>

#proof[
  An accepted coset has a representative $x in L_(V \, p) = and.big^2 R_p$. Use the extended valuation with $v_p \( p \) = 1$ on a splitting field. Its six valuations $k_(i j) = v_p \( x_(i j) \)$ are nonnegative integers, invariant under Frobenius. Since $u$ and $delta_(cal(O))$ are units,
  $ k_(i j) + k_(k l) = j_(frak(q)) quad upright("for the partition ") i j \| k l upright(" over ") frak(q) . $
  This proves integrality of $z$. If the pair labels over $frak(q)$ have two Frobenius orbits, one of their two valuations can be chosen from $0 \, dots.h \, j_(frak(q))$. If there is one orbit, the two valuations are equal, which requires even $j_(frak(q))$. The number of records is therefore at most $b_p \( z \)$.
  Two representatives with the same six valuations have comparison $\( a \, c \)$ satisfying
  $ v_p \( c \) + v_p \( a_i \) + v_p \( a_j \) = 0 #h(2em) \( i < j \) . $
  Subtraction makes all four $v_p \( a_i \)$ equal to a common $r$, and $v_p \( c \) = - 2 r$. Because $K_p$ is unramified, $r in bb(Z)$. Replacing $a$ by $p^(- r) a$ and $c$ by $p^(2 r) c$ puts both in the unit subgroup. Thus a record specifies at most one coset, also for nonsplit unramified factors. The subgroup $cal(U)_p$ preserves $and.big^2 R_p$, so its coset fraction is either $0$ or $1$. This proves Equation (5.21). The bounds at depth zero and at general depth follow immediately from the definition and the at most three factors.
  The trace from an unramified integer ring to $bb(Z)_p$ is onto, as is seen after reduction from the nonzero finite-field trace. If $F_p$ has more than one factor, the trace-$m$ coset therefore projects uniformly onto each chosen factor: the other factors can supply any required trace. More generally, for integers $r_(frak(q)) gt.eq 0$, the probability that $v_(frak(q)) \( z \) gt.eq r_(frak(q))$ for all $frak(q)$ is
  $ cases(delim: "{", t^(sum_(frak(q)) f_(frak(q)) r_(frak(q))) \, & min_(frak(q)) r_(frak(q)) = 0 \,, 0 \, & min_(frak(q)) r_(frak(q)) > 0 .) $
  The first line follows by projecting onto the constrained factors while a factor with $r_(frak(q)) = 0$ supplies the trace. The second uses $p divides.not m$. It also covers the case that $F_p$ is a field.
  Expanding $b_(frak(q)) \( j \) = sum_(r = 0)^j epsilon.alt_(frak(q))^r$ and summing the absolutely convergent geometric series gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ bb(E)_p b_p = frac(1 - \( product_(frak(q)) epsilon.alt_(frak(q)) \) t^3, product_(frak(q)) \( 1 - epsilon.alt_(frak(q)) t^(f_(frak(q))) \)) . $ <eq:ext-geometric-mean>]
  The five Frobenius types give the following data. A pair $\( f \, epsilon.alt \)$ in the second column is attached to one prime of $F$.
  $ upright("cycle type on four labels") & \( f_(frak(q)) \, epsilon.alt_(frak(q)) \) & product_(frak(p) divides p) \( 1 - t^(f_(frak(p))) \) & a_K \( p \) - 1\
1^4 & \( 1 \, + \) \, \( 1 \, + \) \, \( 1 \, + \) & \( 1 - t \)^4 & 3\
2 thin 1^2 & \( 1 \, + \) \, \( 2 \, + \) & \( 1 - t \)^2 \( 1 - t^2 \) & 1\
2^2 & \( 1 \, + \) \, \( 1 \, - \) \, \( 1 \, - \) & \( 1 - t^2 \)^2 & - 1\
3 thin 1 & \( 3 \, + \) & \( 1 - t \) \( 1 - t^3 \) & 0\
4 & \( 1 \, - \) \, \( 2 \, - \) & 1 - t^4 & - 1 $
  In every row $product_(frak(q)) epsilon.alt_(frak(q)) = 1$ and
  $ product_(frak(q)) \( 1 - epsilon.alt_(frak(q)) t^(f_(frak(q))) \) = frac(product_(frak(p) divides p) \( 1 - t^(f_(frak(p))) \), 1 - t) . $
  Substitution in Equation (5.23) proves the exact mean. Its linear term is the number of degree-one primes of $K$ minus one, which is $a_K \( p \) - 1$; the five fixed rows give the uniform error term.
  If $F_p$ is a field, $n_p gt.eq 1$ would make its trace divisible by $p$, and is impossible. Otherwise the uniform projection above gives $bb(P)_p \( v_(frak(q)) \( z \) gt.eq k \) = p^(- f_(frak(q)) k)$. Taking the union over at most three factors proves Equation (5.22). Finally, the trace map is onto, so the affine trace lattice has two integral coordinates. Projection to each unramified factor modulo $p^(k + 1)$ is determined by these coordinates modulo $p^(k + 1)$. The valuations truncated at $k + 1$, and hence the asserted threshold and finite-depth functions, have the stated congruence dependence. This remains true on the component-vanishing set with the convention above. ◻
]

#thm([Proposition 5.7.])[
  (Multiplicities from local densities).  #emph[For $z in F$ with $"Tr" z = m eq.not 0$, a positive value of $M \( z \)$ requires $z$ to be integral outside $S$. For such integral $z$, 
#[#set math.equation(numbering: n => "(5.24)")
 $ M \( z \) lt.eq 32 product_(p in S) (\| D \|_p^(- 1 \/ 2) frac(1 - p^(- 1), product_(frak(p) divides p \, med frak(p) subset R) \( 1 - "N" \( frak(p) \)^(- 1) \)) f_p^(*) \( z \)) product_(p in.not S) b_p \( z \) . $ <eq:ext-local-majorant>]

 All products in this assertion are finite at every contributing $z$.]
] <prop:ext-multiplicity-majorant>

#proof[
  The field $F$ and the condition $"Tr" z = m eq.not 0$ imply $z in F^times$. At every prime the set of accepted cosets is finite by Lemma 21. At $p in.not S$, Lemma 23 proves the integrality requirement and bounds the local sum by $b_p \( z \)$. The set
  $ E_z = S union { p : z in.not R_(F \, p)^times } $
  is finite, since a nonzero global $z$ is a unit at all but finitely many primes. At $p in.not E_z$, $b_p = 1$, and each coset fraction is $0$ or $1$, so there is at most one accepted coset, of fraction $1$. If some prime has no accepted coset, then $M \( z \) = 0$ and the claimed inequality is immediate. Otherwise the accepted coset is unique with fraction $1$ outside $E_z$, and each prime inside the finite set $E_z$ has finitely many accepted cosets. Thus there are only finitely many assignments of accepted cosets, and all local sums outside $E_z$ equal $1$.
  Choose local references. Equation (5.12) identifies the weight of a global pair at each prime with its coset fraction $alpha_p$. By Lemma 22, at most $32$ global pairs occupy any assignment of accepted cosets. Summing over the finite set of assignments, including ones not realized globally, bounds $M \( z \)$ by $32$ times the product of the local sums of $alpha_p$. Use Equation (5.17) at $p in S$ and Equation (5.21) outside $S$. This proves Equation (5.24) and finiteness. ◻
]

The unramified mean in Equation (5.22) has the Euler factor needed for the residue $kappa$. The remaining problem in Theorem 19 is to average the densities $f_p^(*)$ for $p in S$ before inserting these unramified factors. For a frequency $alpha in F_p$, testing the law $u Psi \( x \)$ against the character $z mapsto psi_p \( "Tr"_(F_p \/ bb(Q)_p) \( alpha z \) \)$ produces the quadratic phase $u "Tr"_(F_p \/ bb(Q)_p) \( alpha Psi \( x \) \)$. We express these forms through a single unimodular bilinear form and an action of $F$. The elements of $F$ whose operators preserve $L_V$ will then form the order that controls the local Fourier analysis.

=== 5.4 The integral quadratic structure and its order <the-integral-quadratic-structure-and-its-order>

Let $B_V$ be the polarization of $Q_V$ without division by two:

$ B_V \( x \, y \) = Q_V \( x + y \) - Q_V \( x \) - Q_V \( y \) . $

Over a splitting field, write $V_b$ for the plane spanned by the two coordinate axes belonging to the partition $b$, the same coordinate planes used over $bb(R)$ in Section 4. For an equivariant triple $alpha = \( alpha_b \) in F$, let $alpha_b$ scale both coordinate axes of $V_b$.

#thm([Lemma 5.8.])[
  (Self-adjoint quadratic structure).  #emph[The plane-scalar action descends to a rational action $rho : F arrow.r "End"_(bb(Q)) \( V \)$ for which $V$ has rank two over $F$. The form $Q_V$ in an exterior $bb(Z)$-basis of $L_V$ is the three split pairs in Equation (5.4); in particular $B_V$ is unimodular on $L_V$. The action $rho$ is self-adjoint for $B_V$, and for $alpha in F$, 
#[#set math.equation(numbering: n => "(5.25)")
 $ Q_alpha \( x \) := "Tr"_(F \/ bb(Q)) \( alpha Psi \( x \) \) & = 1 / 2 B_V \( rho \( alpha \) x \, x \) \,\
B_alpha \( x \, y \) & = B_V \( rho \( alpha \) x \, y \) \,\
det_(bb(Q)) rho \( alpha \) & = "N"_(F \/ bb(Q)) \( alpha \)^2 \, #h(2em) Psi \( rho \( alpha \) x \) = alpha^2 Psi \( x \) . $ <eq:ext-polar-operator>]

 Here $B_alpha$ is the polarization of $Q_alpha$. The same assertions hold after base change to every $bb(Q)_p$.]
] <lem:ext-quadratic-structure>

#proof[
  Galois permutes the planes $V_b$, including possible alternating signs on their coordinate axes, and permutes the scalars $alpha_b$ in the same way. The plane-scalar action therefore commutes with Galois and descends. After splitting there are three planes of dimension two, proving the rank assertion. Equation (5.4) shows that the matrix of $B_V$ pairs the three opposite pairs by unit off-diagonal entries, with the displayed signs, so it is unimodular. On each plane, multiplying both coordinates by $alpha_b$ is self-adjoint for its split pairing. The contribution of that plane to $1 / 2 B_V \( rho \( alpha \) x \, x \)$ is $alpha_b Psi_b \( x \)$, which proves Equation (5.25). Polarization gives the next identity. The determinant and the last quadratic identity follow by multiplying, respectively, the two equal eigenvalues and the two coordinate scalars on each plane. All these are rational identities, hence persist under base change. ◻
]

Define the stabilizer order and its discriminant by

#[#set math.equation(numbering: n => "(5.26)")
 $ C_F = { alpha in F : rho \( alpha \) L_V subset L_V } \, #h(2em) Delta_F = "Disc" \( C_F \) . $ <eq:ext-stabilizer-order>]

It is a ring containing $1$ and a full $bb(Z)$-lattice: this follows from the rationality of $rho$ by clearing denominators on a basis of $F$. It is contained in $R_F$, since an $alpha$ whose matrix on $L_V$ is integral is a root of that integral monic characteristic polynomial. Thus it is an order. The stabilizer condition is a finite list of matrix-entry integrality conditions in a lattice basis, so it commutes with completion:

#[#set math.equation(numbering: n => "(5.27)")
 $ C_(F \, p) = C_F ⊗_(bb(Z)) bb(Z)_p = { alpha in F_p : rho \( alpha \) L_(V \, p) subset L_(V \, p) } . $ <eq:ext-local-stabilizer>]

The following comparison ensures that its discriminant tends to infinity with the discriminant of $cal(O)$, even when the field $K$ stays fixed.

#thm([Lemma 5.9.])[
  (Scale of the stabilizer order).  #emph[There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(5.28)")
 $ 1 / 2 X^(1 \/ 2) lt.eq Delta_F = D_F \[ R_F : C_F \]^2 lt.eq C X^28 . $ <eq:ext-order-scale>]

 More precisely, with $d = "Disc" \( cal(O) \) = X^2$, 
$ d^2 R_F subset C_F subset R_F \, #h(2em) D_F lt.double D^2 . $

 In particular $C_(F \, p) = R_(F \, p)$ for $p divides.not D q$.]
] <lem:ext-order-scale>

#proof[
  Let $E = and.big^2 A_(cal(O))$ be the exterior embedding matrix. Its entries are integral in every local splitting ring, and $det E = delta_(cal(O))^(thin 3)$. Since $d = delta_(cal(O))^(thin 2)$,
  $ d^2 E^(- 1) = delta_(cal(O)) "adj" \( E \) $
  also has integral entries. For $alpha in R_(F \, p)$, its plane-scalar matrix over the splitting ring is integral. Consequently $d^2 rho \( alpha \) = d^2 E^(- 1) "diag" \( alpha_b \, alpha_b \) E$ is integral over the splitting ring. Its entries are in $bb(Q)_p$, so they lie in $bb(Z)_p$. This proves $d^2 R_F subset C_F$ and $\[ R_F : C_F \] lt.eq d^6$.
  If $p divides.not D$, the etale algebra $R_p$ splits over an unramified extension of $bb(Z)_p$; its splitting field and cubic resolvent are unramified. Hence every prime dividing $D_F$ divides $D$. For $p > 3$, a cubic algebra is tamely ramified and its discriminant exponent is at most $2$. At $2$ and $3$, the finitely many local extensions of degree at most three have bounded discriminant exponents #cite(label("MilneANT")) Proposition 7.64 and Remark 7.65. It follows that $D_F lt.double D^2$. The discriminant-index formula now gives
  $ Delta_F = D_F \[ R_F : C_F \]^2 lt.double D^2 d^12 lt.eq X^28 . $
  The containment $d^2 R_F subset C_F$ also proves equality of the local orders away from $D q$.
  For the reverse inequality, we first explain why a projection denominator controls $"Disc" \( cal(O) \)$. Write $"tr"$ for matrix trace, put $cal(E) = "End"_(bb(Z)) \( cal(O) \)$, and let $cal(W)_K subset "End"_(bb(Q)) \( K \)$ be the rational subspace of multiplication matrices. Its intersection $cal(L) = cal(W)_K ∩ cal(E)$ is saturated. It is multiplication by $cal(O)$: if $alpha cal(O) subset cal(O)$, then $alpha = alpha dot.op 1 in cal(O)$, and the converse follows because $cal(O)$ is a ring. The pairing $\( T \, S \) mapsto "tr" \( T S \)$ is unimodular on $cal(E)$, since its matrix units are dual. Its restriction to $cal(W)_K$ is the nondegenerate field trace pairing. Let $cal(E)_K$ be the orthogonal projection onto $cal(W)_K$.
  For the restricted pairing one has
  #[#set math.equation(numbering: n => "(5.29)")
   $ cal(E)_K \( cal(E) \) = cal(L)^or . $ <eq:ext-projected-dual>]
  One inclusion follows by pairing a projected integral matrix with $cal(L)$. Conversely, an integer functional on the primitive sublattice $cal(L)$ extends to one on $cal(E)$. Unimodularity represents the extension by an element of $cal(E)$; its orthogonal projection represents the original functional on $cal(L)$. Nondegeneracy identifies that projection with the prescribed element of $cal(L)^or$. Consequently, if a positive integer $N$ satisfies $N cal(E)_K \( cal(E) \) subset cal(E)$, then
  $ cal(L)^or subset N^(- 1) cal(L) \, #h(2em) X^2 = "Disc" \( cal(O) \) = \[ cal(L)^or : cal(L) \] lt.eq N^4 . $
  It remains to produce the denominator $N = 2 Delta_F$.
  Choose trace-dual bases $a_i$ of $C_F$ and $b_i$ of $C_F^or$, where
  $ C_F^or = { beta in F : "Tr"_(F \/ bb(Q)) \( beta C_F \) subset bb(Z) } . $
  The adjugate of the trace Gram matrix gives $Delta_F b_i in C_F$. Define on $"End"_(bb(Q)) \( V \)$
  #[#set math.equation(numbering: n => "(5.30)")
   $ cal(E)_F \( T \) = sum_(i = 1)^3 rho \( a_i \) T rho \( b_i \) . $ <eq:ext-centralizer-projection>]
  For two embeddings $sigma \, tau$ of $F$, the dual-basis identity is
  $ sum_i sigma \( a_i \) tau \( b_i \) = cases(delim: "{", 1 \, & sigma = tau \,, 0 \, & sigma eq.not tau .) $
  Thus, after splitting, $cal(E)_F$ extracts exactly the three diagonal blocks $"End" \( V_b \)$. It is the orthogonal projection for the matrix trace pairing, and
  #[#set math.equation(numbering: n => "(5.31)")
   $ Delta_F cal(E)_F \( "End"_(bb(Z)) \( L_V \) \) subset "End"_(bb(Z)) \( L_V \) . $ <eq:ext-centralizer-denominator>]
  This denominator conclusion uses the trace-dual lattice only; it does not require that lattice to be an invertible $C_F$-ideal.
  We transfer this projection to matrices on $K$ explicitly. Let
  $ j \( T \) \( v and w \) = T v and w + v and T w #h(2em) \( T in "End"_(bb(Q)) \( K \) \) . $
  There is a natural contraction $frak(c) : "End"_(bb(Q)) \( and.big^2 K \) arrow.r "End"_(bb(Q)) \( K \)$. For clarity, in a basis $e_1 \, dots.h \, e_4$ write
  $ S \( e_j and e_l \) = sum_(i < k) S_(j l)^(i k) e_i and e_k #h(2em) \( j < l \) \, $
  and extend these coefficients antisymmetrically in $i \, k$ and in $j \, l$, with zero coefficients when either pair repeats. Then
  $ frak(c) \( S \)_j^i = sum_(k = 1)^4 S_(j k)^(i k) . $
  This is the contraction of $and.big^2 K ⊗ and.big^2 K^or$ in one covariant and one contravariant index, so it is independent of the basis. Both $j$ and $frak(c)$ are integral in the $cal(O)$ and exterior $cal(O)$-bases. Expanding their coefficients gives
  #[#set math.equation(numbering: n => "(5.32)")
   $ frak(c) \( j \( T \) \) = 2 T + "tr" \( T \) "id"_K . $ <eq:ext-contraction>]
  Indeed an off-diagonal coefficient of $T$ occurs for the two remaining indices $k$; a diagonal coefficient gives $sum_(k eq.not i) \( T_i^i + T_k^k \) = 2 T_i^i + "tr" \( T \)$.
  In embedding coordinates, an off-diagonal entry of $j \( T \)$ changes one index of a two-element subset. Such subsets belong to distinct opposite-pair planes. It follows that $cal(E)_F \( j \( T \) \) = j \( "diag" T \)$ over the splitting field. Equation (5.32) now proves the formula
  #[#set math.equation(numbering: n => "(5.33)")
   $ cal(E)_K \( T \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] frak(c) \( cal(E)_F \( j \( T \) \) \) - "tr" \( T \) "id"_K #scale(x: 120%, y: 120%)[\)] $ <eq:ext-multiplication-projection>]
  for the projection defined above: its right side is $"diag" T$ over the splitting field. A Galois-equivariant diagonal tuple is the tuple of embeddings of an element of $K$, so these diagonal matrices are precisely $cal(W)_K$. Diagonal extraction is orthogonal for matrix trace. Finally, Equation (5.31) and integrality of $j$ and $frak(c)$ give
  $ 2 Delta_F cal(E)_K \( "End"_(bb(Z)) \( cal(O) \) \) subset "End"_(bb(Z)) \( cal(O) \) . $
  Taking $N = 2 Delta_F$ in the preceding lattice bound gives
  $ X^2 lt.eq \( 2 Delta_F \)^4 . $
  This is the lower inequality in Equation (5.28). ◻
]

For $x in L_(V \, p)$ and $alpha in C_(F \, p)$, Equation (5.25) gives two integral pairings:

$ "Tr" Psi \( x \) = Q_V \( x \) in bb(Z)_p \, #h(2em) 2 "Tr" \( alpha Psi \( x \) \) = B_V \( rho \( alpha \) x \, x \) in bb(Z)_p . $

They remain integral after multiplying $Psi \( x \)$ by a $bb(Z)_p$-unit. Thus the products pair integrally with the scalar $1$ and with $2 C_(F \, p)$. Define the order and its trace dual

$ C_F^sharp = bb(Z) + 2 C_F \, #h(2em) \( C_F^sharp \)^or = { z in F : "Tr"_(F \/ bb(Q)) \( z C_F^sharp \) subset bb(Z) } . $

This trace dual gives the integral support for the additive count. The same support will bound the total depth of the unramified factors and prevent a nonzero real product coordinate from being too small.

#thm([Lemma 5.10.])[
  (Trace-dual support and product size).  #emph[One has 
#[#set math.equation(numbering: n => "(5.34)")
 $ \[ C_F : C_F^sharp \] = 4 \, #h(2em) Delta_F^sharp := "Disc" \( C_F^sharp \) = 16 Delta_F lt.double X^28 \, $ <eq:ext-sharp-discriminant>]

 and $"Tr" : \( C_F^sharp \)^or arrow.r bb(Z)$ is onto. For $p in.not S$, $C_(F \, p)^sharp = \( C_(F \, p)^sharp \)^or = R_(F \, p)$. For every prime $p$, the density $f_p^(*)$ on $F_p^times$ is supported on $\( C_(F \, p)^sharp \)^or$. Consequently 
$ M \( z \) > 0 med arrow.r.double med z in \( C_F^sharp \)^or . $

 The following stronger containment is used to average the majorant in Proposition 24: if $z in F^times$ is integral outside $S$ and $product_(p in S) f_p^(*) \( z \) > 0$, then $z in \( C_F^sharp \)^or$.]
  #emph[Fix $m eq.not 0$ and a bounded $Omega subset cal(H)_m$. Every $z in \( C_F^sharp \)^or ∩ Omega$ satisfies 
#[#set math.equation(numbering: n => "(5.35)")
 $ & Delta_F^sharp z in R_F \, #h(2em) 1 lt.eq \| "N"_(F \/ bb(Q)) \( Delta_F^sharp z \) \| lt.double_Omega X^84 \,\
 & product_(p in.not S) p^(n_p \( z \)) lt.eq \| "N"_(F \/ bb(Q)) \( Delta_F^sharp z \) \| \, #h(2em) \| z_b \| gt.double_Omega X^(- 84) quad \( b in cal(B) \) . $ <eq:ext-norm-bound>]

 The constants are uniform in all arithmetic data and in the point of $Omega$.]
] <lem:ext-support>

#proof[
  Since $C_F$ is an order, $C_F ∩ bb(Q) = bb(Z)$, so $1$ is primitive in its lattice. A basis $1 \, a_2 \, a_3$ of $C_F$ gives the basis $1 \, 2 a_2 \, 2 a_3$ of $C_F^sharp$. This proves the index and discriminant assertions in Equation (5.34). The functional taking $1$ to $1$ and the other two basis vectors to $0$ is represented in the trace dual. Hence trace from that dual is onto $bb(Z)$. Lemma 26, and $2 in S$, give $C_(F \, p)^sharp = R_(F \, p)$ outside $S$.
  The two integrality identities preceding the lemma show that the law in Equation (5.16) is supported on $\( C_(F \, p)^sharp \)^or$. For a contributing global pair, use its local representation $z = u Psi \( x \)$ and Equation (5.14) to translate $x$ into $L_(V \, p)$, adjusting $u$ by the inverse norm of that unit. This proves local trace-dual membership at every prime. Intersecting the local lattices proves the stated global support. For the second support assertion, the density factors give this membership at $p in S$. At $p in.not S$, the order is $R_(F \, p)$, whose trace pairing is unimodular because $F_p$ is unramified; thus $R_(F \, p)^or = R_(F \, p)$, and the assumed integrality gives membership there as well.
  The adjugate of the trace Gram matrix of $C_F^sharp$ gives $Delta_F^sharp \( C_F^sharp \)^or subset C_F^sharp subset R_F$. If $z in Omega$, then $"Tr" z = m eq.not 0$, so $z eq.not 0$; since $F$ is a field, all its embeddings are nonzero. The norm $"N" \( Delta_F^sharp z \)$ is consequently a nonzero integer. The boundedness of $Omega$ and $Delta_F^sharp lt.double X^28$ give
  $ 1 lt.eq \| "N" \( Delta_F^sharp z \) \| = \( Delta_F^sharp \)^3 product_(b in cal(B)) \| z_b \| lt.double_Omega X^84 . $
  At $p in.not S$, $z$ is integral and the local algebra is unramified. Hence
  $ n_p \( z \) lt.eq sum_(frak(q) divides p) f_(frak(q)) v_(frak(q)) \( z \) lt.eq v_p #scale(x: 120%, y: 120%)[\(] "N" \( Delta_F^sharp z \) #scale(x: 120%, y: 120%)[\)] . $
  The product of these inequalities gives the depth bound because $"N" \( Delta_F^sharp z \)$ is an integer. Finally, if the coordinates of $Omega$ have absolute value at most $B$, with $B gt.eq 1$, then for each $b$
  $ \| z_b \| = frac(\| "N" \( Delta_F^sharp z \) \|, \( Delta_F^sharp \)^3 product_(b' eq.not b) \| z_(b') \|) gt.eq frac(1, \( Delta_F^sharp \)^3 B^2) gt.double_Omega X^(- 84) . $
  This proves Equation (5.35). ◻
]

== 6 Local Fourier estimates <sec:local-fourier>

The exterior multiplicity bound in Section 5 uses an additive density at each prime in $S$. We now estimate its Fourier transform. Scalar frequencies detect only the trace and have an exact, order-independent value. For the remaining frequencies we record both decay and the support of the inverse transform on a fixed denominator shell. The support is needed because the denominator at a prime dividing the order index can be arbitrarily large.

=== 6.1 Quadratic data and the trace marginal <quadratic-data-and-the-trace-marginal>

Fix a rational prime $p$. We first specify the local hypotheses used in the argument. Let

$ E = product_(nu = 1)^r E_nu \, #h(2em) R_E = product_(nu = 1)^r R_nu $

be a cubic étale $bb(Q)_p$-algebra and its maximal order. Here $E_nu$ is a field, $R_nu$ is its integer ring, and $r lt.eq 3$. Write $frak(q)_nu = \( pi_nu \)$ for the maximal ideal of $R_nu$, $v_nu \( pi_nu \) = 1$, $e_nu = v_nu \( p \)$, and $q_nu = \| R_nu \/ frak(q)_nu \| = p^(f_nu)$. Thus

$ sum_nu e_nu f_nu = 3 \, #h(2em) \| "N"_(E_nu \/ bb(Q)_p) a \|_p = q_nu^(- v_nu \( a \)) . $

Let $frak(d)_nu = frak(q)_nu^(d_nu)$ be the different of $E_nu \/ bb(Q)_p$, and put $frak(d)_E = product_nu frak(d)_nu$.

Let $W$ be a free $E$-module of rank two, with its unital action denoted by $rho : E arrow.r "End"_(bb(Q)_p) \( W \)$. Suppose that $B$ is a nondegenerate symmetric $bb(Q)_p$-bilinear form satisfying

$ B \( rho \( a \) x \, y \) = B \( x \, rho \( a \) y \) #h(2em) \( a in E \, med x \, y in W \) . $

Let $L$ be a full $bb(Z)_p$-lattice in $W$ which is self-dual for $B$:

$ L = { y in W : B \( y \, L \) subset bb(Z)_p } . $

Assume also that $Q_1 \( x \) = B \( x \, x \) \/ 2$ is integral on $L$. For the scalar calculation we shall use the stronger property that in some integral coordinates on $L$,

#[#set math.equation(numbering: n => "(6.1)")
 $ Q_1 \( x_1 \, y_1 \, x_2 \, y_2 \, x_3 \, y_3 \) = x_1 y_1 - x_2 y_2 + x_3 y_3 . $ <eq:fourier-split-form>]

The division by $2$ takes place in $bb(Q)_p$. Equation (6.1) asserts the required integrality also when $p = 2$. The shell estimates below use only $Q_1 \( L \) subset bb(Z)_p$; the exact split expression is used for the scalar marginal.

For $a in E$, set $Q_a \( x \) = B \( rho \( a \) x \, x \) \/ 2$. The nondegenerate trace pairing on $E$ determines a unique quadratic map $Psi_E : W arrow.r E$ by

#[#set math.equation(numbering: n => "(6.2)")
 $ "Tr"_(E \/ bb(Q)_p) \( a Psi_E \( x \) \) = Q_a \( x \) = 1 / 2 B \( rho \( a \) x \, x \) #h(2em) \( a in E \) . $ <eq:fourier-polar-identity>]

Define the stabilizer order and the auxiliary order

$ cal(C)_L = { a in E : rho \( a \) L subset L } \, #h(2em) cal(C)_L^sharp = bb(Z)_p + 2 cal(C)_L . $

Indeed $cal(C)_L$ is an order in $R_E$. It is a subring containing $1$, and a sufficiently large power of $p$ times $R_E$ preserves $L$. Conversely, an element preserving $L$ satisfies the monic characteristic polynomial of its integral matrix on $L$. The action is faithful, so the element is integral over $bb(Z)_p$ and belongs to $R_E$.

In the application, $E = F_p$, $W = V_p$, $L = L_(V \, p)$, $B = B_V$, and $cal(C)_L = C_(F \, p)$. Lemma 25 supplies all the stated hypotheses and identifies $Psi_E$ with the base change of $Psi$. We use the abstract notation temporarily to include every product algebra and every ramification type in one argument.

Choose an additive character $psi_p$ of $bb(Q)_p$ with conductor $bb(Z)_p$. We give $W$ the self-dual Haar measure for $\( x \, y \) mapsto psi_p \( B \( x \, y \) \)$; it gives $L$ mass $1$. On $E$ use the self-dual measure for $\( A \, z \) mapsto psi_p \( "Tr"_(E \/ bb(Q)_p) \( A z \) \)$, denoted by $d z$ or $d A$ according to the variable. If $frak(a)$ is a fractional $R_E$-ideal, its annihilator for this pairing is $frak(a)^perp = frak(a)^(- 1) frak(d)_E^(- 1)$. In particular

#[#set math.equation(numbering: n => "(6.3)")
 $ "vol" \( R_E \) = product_nu q_nu^(- d_nu \/ 2) lt.eq 1 . $ <eq:fourier-self-dual-volume>]

To see the normalization, $R_E^perp = frak(d)_E^(- 1)$ and $"vol" \( R_E \) "vol" \( R_E^perp \) = 1$, whereas $\[ frak(d)_E^(- 1) : R_E \] = product_nu q_nu^(d_nu)$. For $E = F_p$, Equation (6.3) reads $"vol" \( R_(F \, p) \) = \| D_F \|_p^(1 \/ 2)$.

Let $mu_p$ be the law of

#[#set math.equation(numbering: n => "(6.4)")
 $ u Psi_E \( x \) \, #h(2em) x in L upright(" with additive probability") \, #h(2em) u in bb(Z)_p^times upright(" with Haar probability") \, $ <eq:fourier-density-law>]

with $x$ and $u$ independent. This is the law defining $f_p^(*)$ in Lemma 21. The following regularity fact specifies the version of that density which we shall invert pointwise.

#thm([Lemma 6.1.])[
  #emph[The measure $mu_p$ has a density $f_p^(*)$ with respect to $d z$. It has a finite locally constant version at every $z = \( z_nu \) in E$ with $z_nu eq.not 0$ for all $nu$. This version vanishes outside 
$ \( cal(C)_L^sharp \)^or = { z in E : "Tr"_(E \/ bb(Q)_p) \( z cal(C)_L^sharp \) subset bb(Z)_p } . $

 In particular $"Tr"_(E \/ bb(Q)_p) \( u Psi_E \( x \) \) in bb(Z)_p$ on the domain of Equation (6.4).]
] <lem:fourier-density>

#proof[
  Define an $E$-valued bilinear form $b_E$ by
  $ "Tr"_(E \/ bb(Q)_p) \( a b_E \( x \, y \) \) = B \( rho \( a \) x \, y \) #h(2em) \( a in E \) . $
  Self-adjointness of the action makes $b_E$ symmetric and $E$-bilinear. It is nondegenerate because $B$ is nondegenerate. Equation (6.2) then gives $Psi_E \( x \) = b_E \( x \, x \) \/ 2$ and $d Psi_(E \, x) \( h \) = b_E \( x \, h \)$. On the $nu$-th field factor, a nonzero component of $Psi_E \( x \)$ implies that the component $x_nu$ of $x$ is nonzero. The nondegenerate form on the rank-two $E_nu$-space makes $h_nu mapsto b_E \( x_nu \, h_nu \)$ a nonzero, hence onto, $E_nu$-linear functional. It follows that $Psi_E$ is a $bb(Q)_p$-submersion at every preimage of an output with nonzero components. Multiplication by a unit $u$ is invertible on $E$, so the map $\( x \, u \) mapsto u Psi_E \( x \)$ is a submersion at the same points.
  For each $nu$ the polynomial $Psi_(E \, nu)$ is nonzero: a nondegenerate symmetric form in characteristic zero has a nonzero quadratic form. Choose a nonzero $bb(Q)_p$-coordinate polynomial of this component. Its zero set in the open lattice $L$ has Haar measure zero, by the usual one-variable root bound followed by induction and Fubini. Off the union of these null sets, the local submersion theorem gives absolute continuity of the pushforward. For a fixed output with nonzero components, its preimage in the compact set $L times bb(Z)_p^times$ is compact. Cover this preimage by finitely many compact-open submersion charts, refined to disjoint compact-open pieces within those charts. The image of the remaining compact set avoids a sufficiently small neighborhood of the output. After shrinking that neighborhood, integration in the fiber coordinates of the pieces gives a finite constant density on it. This proves the asserted pointwise version, including value zero when the neighborhood misses the image.
  Finally, for $c in cal(C)_L$ and $r in bb(Z)_p$,
  $ "Tr"_(E \/ bb(Q)_p) \( \( r + 2 c \) Psi_E \( x \) \) = r Q_1 \( x \) + B \( rho \( c \) x \, x \) in bb(Z)_p #h(2em) \( x in L \) . $
  Multiplication by $u in bb(Z)_p^times$ preserves this inclusion. The image of the compact domain is therefore contained in the displayed trace dual, which proves the support and trace assertions. ◻
]

We use the Fourier convention

$ hat(f) \( A \) = integral_E f \( z \) psi_p \( "Tr"_(E \/ bb(Q)_p) \( A z \) \) thin d z \, #h(2em) caron(g) \( z \) = integral_E g \( A \) psi_p \( - "Tr"_(E \/ bb(Q)_p) \( A z \) \) thin d A . $

The transform of the measure in Equation (6.4) is

#[#set math.equation(numbering: n => "(6.5)")
 $ gamma_p \( A \) = hat(f_p^(*)) \( A \) = bb(E)_(u in bb(Z)_p^times) integral_L psi_p \( u Q_A \( x \) \) thin d x . $ <eq:fourier-gamma>]

#thm([Lemma 6.2.])[
  (The scalar trace density).  #emph[Suppose that the integral scalar form is exactly $Q_1 = x_1 y_1 - x_2 y_2 + x_3 y_3$ as in Equation (6.1). Regard $a in bb(Q)_p$ as a scalar in $E$. In the quartic application this scalar form is $Q_1 = Q_V$. Then, for every prime $p$, including $p = 2$, 
#[#set math.equation(numbering: n => "(6.6)")
 $ gamma_p \( a \) = cases(delim: "{", 1 \, & a in bb(Z)_p \,, p^(- 3 k) \, & v_p \( a \) = - k < 0 .) $ <eq:fourier-scalar-coefficients>]

 The trace of the law in Equation (6.4) has density $d_p \( t \) upright(bold(1))_(bb(Z)_p) \( t \)$ for additive measure giving $bb(Z)_p$ mass $1$. This density is continuous on $bb(Z)_p$ and satisfies 
#[#set math.equation(numbering: n => "(6.7)")
 $ \| d_p \( t \) - 1 \| lt.eq frac(1, p \( p + 1 \)) #h(2em) \( t in bb(Z)_p \) . $ <eq:fourier-scalar-density-bound>]

 In particular $5 \/ 6 lt.eq d_p \( t \) lt.eq 7 \/ 6$, and for every finite set of primes $S$ and every choice $t_p in bb(Z)_p$, 
$ product_(p in S) d_p \( t_p \) asymp 1 $

 with absolute upper and lower constants.]
] <lem:fourier-scalar-density>

#proof[
  For fixed $u in bb(Z)_p^times$ and $v_p \( a \) = - k < 0$, integration in the second coordinate gives
  $ integral_(bb(Z)_p^2) psi_p \( u a x y \) thin d x thin d y = integral_(bb(Z)_p) upright(bold(1))_({ u a x in bb(Z)_p }) thin d x = p^(- k) . $
  For $a in bb(Z)_p$ the integral is $1$. The sign of $a$ has no effect, so the three independent pairs in Equation (6.1) give Equation (6.6), even before averaging $u$. This calculation uses the integral split expression and does not divide by $2$ in $bb(Z)_p$.
  The scalar coefficient is the Fourier coefficient of the trace law, since $"Tr" \( a z \) = a "Tr" \( z \)$. That law is supported on $bb(Z)_p$ by Lemma 28. The character group of $bb(Z)_p$ is $bb(Q)_p \/ bb(Z)_p$, and it has $p^k - p^(k - 1)$ characters of exact denominator $p^k$. Hence its nonconstant Fourier coefficients have total absolute sum
  $ sum_(k gt.eq 1) \( p^k - p^(k - 1) \) p^(- 3 k) = frac(1 - p^(- 1), p^2 - 1) = frac(1, p \( p + 1 \)) . $
  Fourier inversion on the compact group $bb(Z)_p$ is therefore uniformly convergent and gives the continuous density and Equation (6.7). The lower bound is positive at every prime, and $sum_p 1 \/ \( p \( p + 1 \) \) < oo$. Taking logarithms of the upper and lower bounds proves the last assertion. ◻
]

=== 6.2 Denominator shells and quadratic transformation <denominator-shells-and-quadratic-transformation>

For $A = \( A_nu \) in E$, its denominator ideal is

$ frak(h)_p \( A \) = product_nu frak(q)_nu^(h_nu \( A \)) \, #h(2em) h_nu \( A \) = max { 0 \, - v_nu \( A_nu \) } \, $

where $v_nu \( 0 \) = + oo$. For an integral $R_E$-ideal $frak(h)_p = product_nu frak(q)_nu^(h_nu)$, its shell is thus

$ cal(S)_(frak(h)_p) = product_(h_nu = 0) R_nu med times #h(-0.16667em) product_(h_nu > 0) pi_nu^(- h_nu) R_nu^times . $

The integral components of a shell may be zero. Define

#[#set math.equation(numbering: n => "(6.8)")
 $ H_p = "N" \( frak(h)_p \) = product_nu q_nu^(h_nu) \, #h(2em) p^(g_p) = \[ frak(h)_p : frak(h)_p ∩ cal(C)_L \] . $ <eq:fourier-shell-indices>]

The shell is a compact open subset of $frak(h)_p^(- 1)$. We shall shift its frequencies by integral scalars so that the quadratic form is nondegenerate, without changing the integral in Equation (6.5).

#thm([Lemma 6.3.])[
  (A scalar shift on a shell).  #emph[Put $iota_p = 1$ for $p lt.eq 5$ and $iota_p = 0$ for $p > 5$. For every $A in cal(S)_(frak(h)_p)$ there is an $s in { 0 \, 1 \, 2 \, 3 }$ such that $alpha = A + s in E^times$ and 
$ v_nu \( alpha_nu \) = - h_nu quad \( h_nu > 0 \) \, #h(2em) 0 lt.eq v_nu \( alpha_nu \) lt.eq e_nu iota_p quad \( h_nu = 0 \) . $

 Writing $beta = alpha^(- 1)$, one has 
#[#set math.equation(numbering: n => "(6.9)")
 $ beta in p^(- iota_p) frak(h)_p \, #h(2em) p^(- 3 iota_p) H_p lt.eq \| "N"_(E \/ bb(Q)_p) alpha \|_p lt.eq H_p . $ <eq:fourier-shift-bounds>]

 In particular the norm is exactly $H_p$ when $p > 5$. If 
#[#set math.equation(numbering: n => "(6.10)")
 $ j_p = j_p \( A \, s \) = min { j gt.eq 0 : p^j beta in cal(C)_L } \, $ <eq:fourier-j-definition>]

 then $j_p$ is finite and $j_p lt.eq g_p + iota_p$. Finally, for any generator $i in E^times$ of the ideal $frak(h)_p$, the element $x = i \( A + s \)$ is in $R_E$, is a unit of $R_E$ if $p > 5$, and satisfies $x^(- 1) in p^(- iota_p) R_E$.]
] <lem:fourier-shift>

#proof[
  An integral scalar shift leaves every pole valuation $- h_nu < 0$ unchanged. For an integral component and $p > 5$, the condition that $A_nu + s$ fail to be a unit forbids at most one residue $s in upright(bold(F))_p$: it forbids none if the residue of $- A_nu$ does not belong to the scalar subfield. There are at most three components, and $0 \, 1 \, 2 \, 3$ are distinct modulo $p$. Some choice therefore makes all integral components units.
  For $p lt.eq 5$, normalize the extension of $v_p$ by $v_p \( p \) = 1$, so that on $E_nu$ it is $v_nu \/ e_nu$. Distinct elements $s \, s'$ of the list satisfy $v_p \( s - s' \) lt.eq 1$. The ultrametric inequality shows that for a fixed integral component at most one candidate can satisfy $v_p \( A_nu + s \) > 1$. Again there are at most three components, so a candidate remains for which all their valuations are at most $1$. Thus $A_nu + s$ is nonzero in every integral component.
  The bounds on $beta$ follow componentwise. In the norm, the possible loss from the integral components is at most $p^(- iota_p sum_nu e_nu f_nu) = p^(- 3 iota_p)$, proving Equation (6.9). The group $frak(h)_p \/ \( frak(h)_p ∩ cal(C)_L \)$ has order $p^(g_p)$ and is killed by $p^(g_p)$. Thus
  #[#set math.equation(numbering: n => "(6.11)")
   $ p^(g_p) frak(h)_p subset cal(C)_L . $ <eq:fourier-order-containment>]
  Multiplying the containment for $beta$ by $p^(g_p + iota_p)$ proves the claim about $j_p$. Finally $v_nu \( i_nu \) = h_nu$. The components of $i alpha$ consequently have valuation zero on the pole factors and valuation between zero and $e_nu iota_p$ on the others. This proves the assertions about $x$ and $x^(- 1)$. ◻
]

For the shift in Lemma 30, $Q_(A + s) = Q_A + s Q_1$ and $Q_1 \( L \) subset bb(Z)_p$. Thus for every fixed unit $u$

#[#set math.equation(numbering: n => "(6.12)")
 $ integral_L psi_p \( u Q_(A + s) \( x \) \) thin d x = integral_L psi_p \( u Q_A \( x \) \) thin d x . $ <eq:fourier-scalar-shift-invariance>]

The following quadratic transformation turns the norm of $A + s$ into decay, and leaves an integral involving its inverse.

#thm([Lemma 6.4.])[
  (Quadratic Fourier transformation).  #emph[Let $W_0$ be a finite-dimensional $bb(Q)_p$-space with a nondegenerate symmetric form $B_0$, and let $L_0 subset W_0$ be a full $bb(Z)_p$-lattice self-dual for $B_0$. Use the self-dual Haar measure, which gives $L_0$ mass $1$. For an invertible $B_0$-self-adjoint operator $P$, put $q_P \( x \) = B_0 \( P x \, x \) \/ 2$. There is a phase $omega \( P \)$ with $\| omega \( P \) \| = 1$ such that 
#[#set math.equation(numbering: n => "(6.13)")
 $ integral_(L_0) psi_p \( q_P \( x \) \) thin d x = omega \( P \) \| det P \|_p^(- 1 \/ 2) integral_(L_0) psi_p \( - q_(P^(- 1)) \( x \) \) thin d x . $ <eq:fourier-general-quadratic>]

 The normalized phase is invariant under linear isometry of the quadratic form: $omega \( T^(*) P T \) = omega \( P \)$ for every invertible $T$, where $T^(*)$ is the $B_0$-adjoint.]
  #emph[For the local data above, $alpha in E^times$, $beta = alpha^(- 1)$ and $u in bb(Z)_p^times$, this gives 
#[#set math.equation(numbering: n => "(6.14)")
 $ integral_L psi_p \( u Q_alpha \( x \) \) thin d x = omega_p \( u \, alpha \) \| "N"_(E \/ bb(Q)_p) alpha \|_p^(- 1) integral_L psi_p \( - u^(- 1) Q_beta \( x \) \) thin d x \, #h(2em) \| omega_p \( u \, alpha \) \| = 1 . $ <eq:fourier-quadratic-transform>]

 For every $r in E^times$ one has $omega_p \( u \, alpha r^2 \) = omega_p \( u \, alpha \)$. All assertions hold at $p = 2$.]
] <lem:fourier-quadratic-transform>

#proof[
  We use Weil’s Fourier formula for a quadratic character #cite(label("Weil1964")) Chapter I, §14, Theorem 2, p. 161. We record its normalization for the transform
  $ cal(F)_(B_0) h \( y \) = integral h \( x \) psi_p \( B_0 \( x \, y \) \) thin d x . $
  Completing the square gives
  $ q_P \( x \) + B_0 \( x \, y \) = q_P \( x + P^(- 1) y \) - q_(P^(- 1)) \( y \) . $
  Let $B_N = p^(- N) L_0$ and $c_N = integral_(B_N) psi_p \( q_P \( x \) \) thin d x$. On any fixed compact set of $y$, translation by $P^(- 1) y$ preserves $B_N$ for all sufficiently large $N$. The transform of $upright(bold(1))_(B_N) psi_p \( q_P \)$ on that set is therefore $c_N psi_p \( - q_(P^(- 1)) \)$. If this identity is paired with a Schwartz–Bruhat function, its left side stabilizes with $N$, since the Fourier transform of the test function has compact support. Choosing a test function whose integral against $psi_p \( - q_(P^(- 1)) \)$ is nonzero shows that $c_N$ stabilizes as well. This proves the distributional shape of the formula.
  Differencing the absolute square of $c_N$ and integrating in one variable gives
  $ \| c_N \|^2 = "vol" \( B_N \) integral_(B_N ∩ P^(- 1) B_N^perp) psi_p \( q_P \( h \) \) thin d h . $
  For sufficiently large $N$, the intersection is $P^(- 1) p^N L_0$ and $q_P$ is integral on it. The right side then equals $"vol" \( p^(- N) L_0 \) "vol" \( P^(- 1) p^N L_0 \) = \| det P \|_p^(- 1)$. Hence the stabilized constant is $omega \( P \) \| det P \|_p^(- 1 \/ 2)$ with unit phase. The transform of $upright(bold(1))_(L_0)$ is $upright(bold(1))_(L_0)$, so pairing the distribution identity with this function gives Equation (6.13).
  Under $q_(T^(*) P T) = q_P compose T$, changing variables multiplies the Gaussian constant by $\| det T \|_p^(- 1)$ and its normalizing determinant square root by $\| det T \|_p$. Their product, the phase, is unchanged; this is also the isometry invariance in Weil #cite(label("Weil1964")) Chapter II, §25, p. 173. For $P = u rho \( alpha \)$ its inverse is $u^(- 1) rho \( beta \)$. Rank two over $E$ gives $det rho \( alpha \) = "N"_(E \/ bb(Q)_p) \( alpha \)^2$, and $\| u \|_p = 1$. This proves Equation (6.14). Taking $T = rho \( r \)$ proves the last phase identity. The polar operator of $q_P$ is $P$, because its polarization is $B_0 \( P x \, y \)$. In particular this proof never assumes that $2$ is a unit of $bb(Z)_p$. ◻
]

=== 6.3 The inverse transform on a shell <the-inverse-transform-on-a-shell>

Extend the restriction of $gamma_p$ to a shell by zero, and denote its inverse transform by

#[#set math.equation(numbering: n => "(6.15)")
 $ gamma_(p \, frak(h)_p) \( A \) = upright(bold(1))_(cal(S)_(frak(h)_p)) \( A \) gamma_p \( A \) \, #h(2em) K_(p \, frak(h)_p) \( z \) = integral_E gamma_(p \, frak(h)_p) \( A \) psi_p \( - "Tr"_(E \/ bb(Q)_p) \( A z \) \) thin d A . $ <eq:fourier-shell-transform>]

The next lemma gives the estimates for these functions which will be used in Poisson summation. Its quantitative support assertions separate the case where the denominator ideal is contained in the stabilizer order.

#thm([Lemma 6.5.])[
  (Intrinsic shell estimates).  #emph[Let $E$ be the cubic algebra above, let $W$ have rank two over $E$ with self-adjoint action for a nondegenerate symmetric form $B$, and let $L$ be self-dual for $B$, with $Q_1 \( L \) subset bb(Z)_p$. Use the stabilizer order $cal(C)_L = { a in E : rho \( a \) L subset L }$ and $Psi_E \, gamma_p$ from Equations (6.2) and (6.5). Fix an integral ideal $frak(h)_p = product_nu frak(q)_nu^(h_nu)$, and use $H_p \, g_p$ from Equation (6.8). The zero-extended function $gamma_(p \, frak(h)_p)$ and its inverse $K_(p \, frak(h)_p)$ are Schwartz–Bruhat functions. Moreover, 
$ "supp" K_(p \, frak(h)_p) subset \( cal(C)_L^sharp \)^or subset { z in E : "Tr"_(E \/ bb(Q)_p) z in bb(Z)_p } . $

 For $A in cal(S)_(frak(h)_p)$ choose $s$ and $j_p = j_p \( A \, s \)$ as in Lemma 30. Then 
#[#set math.equation(numbering: n => "(6.16)")
 $ \| gamma_p \( A \) \| lt.eq p^(3 iota_p) H_p^(- 1) p^(- j_p \/ 2) \, #h(2em) parallel K_(p \, frak(h)_p) parallel_oo lt.eq p^(3 iota_p) "vol" \( R_E \) lt.eq p^(3 iota_p) . $ <eq:fourier-shell-decay>]

 Here $iota_p = upright(bold(1))_({ p lt.eq 5 })$, so the first constant is $1$ at every $p > 5$ and is at most $125$ at the three remaining primes.]
  #emph[If $g_p > 0$ or $p lt.eq 5$, then 
#[#set math.equation(numbering: n => "(6.17)")
 $ "supp" K_(p \, frak(h)_p) subset p^(- 4 \( g_p + 1 \)) frak(h)_p frak(d)_E^(- 1) . $ <eq:fourier-inverse-support>]

 If $g_p = 0$ and $p > 5$, then support instead requires, for each $nu$, 
#[#set math.equation(numbering: n => "(6.18)")
 $ z_nu in cases(delim: "{", frak(d)_nu^(- 1) \, & h_nu = 0 \,, frak(q)_nu^(h_nu - 1) frak(d)_nu^(- 1) \, & h_nu > 0 .) $ <eq:fourier-boundary-support>]

 For a $z$ satisfying these support conditions, define its set of boundary primes by 
$ partial_(frak(h)_p) \( z \) = { frak(q)_nu : h_nu > 0 \, med z_nu in.not frak(q)_nu^(h_nu) frak(d)_nu^(- 1) } . $

 In this case 
#[#set math.equation(numbering: n => "(6.19)")
 $ \| K_(p \, frak(h)_p) \( z \) \| lt.eq 8 "vol" \( R_E \) product_(frak(q)_nu in partial_(frak(h)_p) \( z \)) q_nu^(- 1 \/ 2) . $ <eq:fourier-boundary-decay>]

 Every constant is uniform in the lattice, the order $cal(C)_L$, the shell, and the field factors and their ramification.]
] <lem:fourier-shell-estimates>

#proof[
  For $c in cal(C)_L^sharp$, Equation (6.2) shows that $Q_c \( L \) subset bb(Z)_p$. Consequently $gamma_p \( A + c \) = gamma_p \( A \)$. Each denominator shell is invariant under translation by $R_E$: adding an integral element preserves every negative component valuation and preserves the set of integral components. Since $cal(C)_L^sharp subset R_E$, the zero-extended shell restriction retains this period. Its inverse is therefore supported in the annihilator $\( cal(C)_L^sharp \)^or$, whose elements have integral trace because $1 in cal(C)_L^sharp$. The order $cal(C)_L^sharp$ is an open lattice, and the shell is compact open. Thus the zero extension in Equation (6.15) is Schwartz–Bruhat, as is its Fourier inverse.
  For a fixed unit $u$ put $I_beta \( u \) = integral_L psi_p \( - u^(- 1) Q_beta \( x \) \) thin d x$. Polarization and additive orthogonality on the self-dual lattice give
  $ \| I_beta \( u \) \|^2 = integral_(h in L\
rho \( beta \) h in L) psi_p \( - u^(- 1) Q_beta \( h \) \) thin d h . $
  Indeed, in the difference $Q_beta \( y + h \) - Q_beta \( y \)$ the term linear in $y$ is $B \( rho \( beta \) h \, y \)$, whose integral is the indicator of $rho \( beta \) h in L$. The absolute value of the last display is at most the relative mass of $L ∩ rho \( beta \)^(- 1) L$. If $p^(a_1) \, dots.h \, p^(a_6)$ are the Smith elementary divisors of $rho \( beta \)$ on $L$, then
  $ j_p = max { 0 \, - min_i a_i } \, #h(2em) \[ L : L ∩ rho \( beta \)^(- 1) L \] = p^(sum_i max \( 0 \, - a_i \)) gt.eq p^(j_p) . $
  The equality for $j_p$ is exactly the definition of $cal(C)_L$. It follows that $\| I_beta \( u \) \| lt.eq p^(- j_p \/ 2)$. Apply Equations (6.12) and (6.14), then use Equation (6.9) and average over $u$. This proves the first bound in Equation (6.16). The shell is contained in $frak(h)_p^(- 1)$, which has volume $H_p "vol" \( R_E \)$. Integration of the first bound, with $p^(- j_p \/ 2) lt.eq 1$, proves the second.
  We next prove Equation (6.17). Put $N = 4 \( g_p + 1 \)$ and take $t in p^N frak(h)_p^(- 1)$. For $A$ in the shell choose $s$ as in Lemma 30, and write $alpha = A + s$, $beta = alpha^(- 1)$. The component valuations of $t$ are at least $- h_nu + e_nu N$. Translation by $t$ therefore preserves the shell, and the same $s$ still has the valuation properties of that lemma. Set $zeta = t beta$. Equation (6.9) gives
  $ zeta in p^(N - iota_p) R_E \, #h(2em) alpha + t = alpha \( 1 + zeta \) \, #h(2em) \( alpha + t \)^(- 1) - beta = - frac(t beta^2, 1 + zeta) in p^(N - 2 iota_p) frak(h)_p . $
  Here $1 + zeta$ is a unit. It is a square unit in each factor when $p$ is odd, by Hensel’s lemma on principal units. When $p = 2$, one has $zeta in 8 R_E$. In the $nu$-th field the Hensel inequality for $Y^2 - \( 1 + zeta_nu \)$ at $Y = 1$ is $v_nu \( zeta_nu \) gt.eq 3 e_nu > 2 e_nu = 2 v_nu \( 2 \)$, so it is a square unit there as well, including for ramified dyadic factors.
  Moreover $N - 2 iota_p gt.eq g_p + v_p \( 2 \)$. Equation (6.11) therefore places the inverse difference in $2 cal(C)_L$. Its $Q$-value on $L$ is integral by Equation (6.2). In Equation (6.14), the inverse integral is unchanged by this difference. The norm is unchanged by the unit $1 + zeta$, and the phase is unchanged because that unit is a square. The original integral, for each fixed $u$, is consequently unchanged under $A mapsto A + t$. So is its unit average. Translation by $p^N frak(h)_p^(- 1)$ preserves the shell as a set, hence preserves its zero-extended function. The inverse transform is supported on the annihilator of this group, namely $p^(- N) frak(h)_p frak(d)_E^(- 1)$. This proves Equation (6.17) with the absolute exponent $4$.
  It remains to prove the sharper assertions for $g_p = 0$ and $p > 5$. The equality $g_p = 0$ says $frak(h)_p subset cal(C)_L$. For each factor with $h_nu = 0$, its component idempotent $1_nu$ and its whole component ring $1_nu R_nu$ lie in $frak(h)_p$. The self-adjoint projections $rho \( 1_nu \)$ preserve $L$ and split off their lattices orthogonally. The complementary projection $1 - sum_(h_nu = 0) rho \( 1_nu \)$ also preserves $L$. Each resulting summand is self-dual, because the splitting is orthogonal and $L$ is self-dual.
  On an $h_nu = 0$ summand, an integral $A_nu$ preserves its lattice, so $Q_(A_nu)$ is integral there since $2$ is a unit. That factor of the integral in Equation (6.5) is $1$. On the combined summand of all $h_nu > 0$, the frequency $A_(+)$ is invertible. Its inverse, extended by zero on the other factors, lies in $frak(h)_p subset cal(C)_L$. Its inverse quadratic integral in Equation (6.13) is therefore also $1$. On that summand the square root of the polar determinant has absolute value $H_p$, because each positive factor still has rank two. Applying the formula therefore shows that the remaining frequency function is $H_p^(- 1)$ times a unit-average of Gaussian phases. Its absolute value is at most $H_p^(- 1)$. If there are no positive $h_nu$, this conclusion has $H_p = 1$ and the empty summand contributes $1$.
  Let $chi_nu$ be the quadratic character of $\( R_nu \/ frak(q)_nu \)^times$ for a factor with $h_nu > 0$. At odd residue characteristic every principal unit is a square, so unit square classes are exactly the two residue square classes. Phase invariance in Lemma 31 shows that the bounded unit-average just obtained depends only on the tuple of these classes. This use of phase invariance concerns the ambient quadratic form; a unit need not preserve the lattice. Fourier expansion on the product of the two-element square-class groups expresses the shell function as a sum of at most $2^(\| { nu : h_nu > 0 } \|) lt.eq 8$ terms of the form
  $ c_(bold(epsilon)) H_p^(- 1) product_(h_nu = 0) upright(bold(1))_(R_nu) \( A_nu \) product_(h_nu > 0) upright(bold(1))_(pi_nu^(- h_nu) R_nu^times) \( A_nu \) chi_nu \( overline(pi_nu^(h_nu) A_nu) \)^(epsilon_nu) \, #h(2em) \| c_(bold(epsilon)) \| lt.eq 1 \, $
  where $epsilon_nu in { 0 \, 1 }$. The bound for the coefficients follows from the normalized finite Fourier expansion of a function of absolute value at most $1$. It also covers any coupling of components caused by the common average over $u$.
  We compute the inverse of each factor. Put $psi_nu = psi_p compose "Tr"_(E_nu \/ bb(Q)_p)$ and use the component self-dual measure. For $h_nu = 0$, the integral over $R_nu$ is $"vol" \( R_nu \) upright(bold(1))_(frak(d)_nu^(- 1)) \( z_nu \)$. For $h = h_nu > 0$, the normalized inverse of the trivial unit character is
  $ q_nu^(- h) integral_(pi_nu^(- h) R_nu^times) psi_nu \( - A z \) thin d A = "vol" \( R_nu \) (upright(bold(1))_(frak(q)_nu^h frak(d)_nu^(- 1)) \( z \) - q_nu^(- 1) upright(bold(1))_(frak(q)_nu^(h - 1) frak(d)_nu^(- 1)) \( z \)) . $
  This follows by subtracting the integral over $pi_nu^(- h + 1) R_nu$ from that over $pi_nu^(- h) R_nu$ and using their annihilators. For the quadratic unit character, its function of $a = pi_nu^h A$ is invariant under addition by $frak(q)_nu$. This forces the normalized inverse to vanish outside $frak(q)_nu^(h - 1) frak(d)_nu^(- 1)$. It also vanishes on $frak(q)_nu^h frak(d)_nu^(- 1)$, where the additive character on $R_nu$ is trivial and the sum of $chi_nu$ is zero. At the intervening boundary the additive character descends to a nontrivial character $eta$ of the residue field $k_nu$, and the normalized integral is $"vol" \( R_nu \) q_nu^(- 1)$ times its quadratic Gauss sum.
  For completeness, if $chi$ is the quadratic character of a finite field $k$ of odd order $q$ and $eta$ is a nontrivial additive character, then
  $ lr(|sum_(a in k^times) chi \( a \) eta \( a \)|)^2 = sum_(t in k^times) chi \( t \) sum_(b in k^times) eta \( \( t - 1 \) b \) = \( q - 1 \) - sum_(t in k^times\
t eq.not 1) chi \( t \) = q . $
  Thus the quadratic factor has magnitude $"vol" \( R_nu \) q_nu^(- 1 \/ 2)$ at the boundary. The trivial factor there has the smaller magnitude $"vol" \( R_nu \) q_nu^(- 1)$. Multiplying these component estimates, using $H_p = product_(h_nu > 0) q_nu^(h_nu)$ and $product_nu "vol" \( R_nu \) = "vol" \( R_E \)$, and summing at most eight terms proves Equations (6.18) and (6.19). The annihilator computation retains the different in every ramified factor. ◻
]

The density need not be locally constant on the component-vanishing locus. For the nonvanishing outputs that occur in the global field, the shell inverses nevertheless give a finite pointwise expansion.

#thm([Lemma 6.6.])[
  (Pointwise inverse expansion).  #emph[If $z = \( z_nu \) in E$ has $z_nu eq.not 0$ for every $nu$, then 
#[#set math.equation(numbering: n => "(6.20)")
 $ f_p^(*) \( z \) = sum_(frak(h)_p) K_(p \, frak(h)_p) \( z \) \, $ <eq:fourier-inverse-expansion>]

 where the sum is over integral $R_E$-ideals and only finitely many summands are nonzero.]
] <lem:fourier-inverse-expansion>

#proof[
  Let $B_n = p^(- n) R_E$. Fubini and additive orthogonality give
  $ integral_(B_n) gamma_p \( A \) psi_p \( - "Tr"_(E \/ bb(Q)_p) \( A z \) \) thin d A = "vol" \( B_n \) thin mu_p \( z + p^n frak(d)_E^(- 1) \) . $
  The self-dual normalizations give
  $ B_n^perp = p^n frak(d)_E^(- 1) \, #h(2em) "vol" \( B_n \) "vol" \( B_n^perp \) = 1 . $
  Thus the right side is the average density on that neighborhood. By Lemma 28 it equals $f_p^(*) \( z \)$ for sufficiently large $n$. The ball $B_n$ is the disjoint union of the finitely many shells with $h_nu lt.eq n e_nu$.
  There can in fact be only finitely many nonzero shell inverses at this $z$. The injection $frak(h)_p \/ \( frak(h)_p ∩ cal(C)_L \) arrow.r.hook R_E \/ cal(C)_L$ gives $g_p lt.eq v_p \( \[ R_E : cal(C)_L \] \)$. In Equation (6.17), a nonzero value requires
  $ h_nu lt.eq v_nu \( z_nu \) + d_nu + 4 e_nu \( g_p + 1 \) . $
  In Equation (6.18), it requires $h_nu lt.eq v_nu \( z_nu \) + d_nu + 1$ whenever $h_nu > 0$. All right sides are bounded for this $z$, because its component valuations are finite. The shell sum therefore stabilizes, and the preceding ball inversion proves Equation (6.20). ◻
]

The exact scalar coefficients in Lemma 29 supply the trace marginal in the next section. The nonscalar estimate uses the pointwise decay in Equation (6.16), the inverse supports in Equations (6.17) and (6.18), and the boundary bound in Equation (6.19). In the case $g_p = 0$ and $p > 5$, the last upper bound contains a factor $q_nu^(- 1 \/ 2)$ for each actual boundary component where the support permits one fewer power of $frak(q)_nu$. Once the real boxes are specified, Section 7 combines the supports with the nonzero field norm to restrict the denominator profiles in Poisson summation.

== 7 Additive distribution of the conductor weights <sec:additive>

The factors $f_p^(*)$ introduced in Section 5 retain the local lattice condition of an order at the primes in $S$. We now average their product on the real trace plane. The estimate will also permit a residue class at a small modulus prime to $S$; this is the form needed to average the factors at the remaining primes in Section 8.

Fix a nonzero integer $m$. In the three real embeddings of $F$, write $z = \( z_1 \, z_2 \, z_3 \)$, so that $"Tr" z = z_1 + z_2 + z_3$. Choose two distinct indices $i \, j$, a fixed nonnegative function $Phi in C_c^oo \( bb(R)^2 \)$ which is at least one on $\[ - 1 \, 1 \]^2$, and a fixed nonnegative $chi in C_c^oo \( bb(R) \)$ with

$ chi \( m \) = 1 \, #h(2em) "supp" chi subset \( m - 1 / 3 \, m + 1 / 3 \) . $

For $c = \( c_i \, c_j \) in bb(R)^2$ and positive $r_i \, r_j$, put

#[#set math.equation(numbering: n => "(7.1)")
 $ phi.alt \( z \) = Phi (frac(z_i - c_i, r_i) \, frac(z_j - c_j, r_j)) chi \( "Tr" z \) \, #h(2em) A_phi.alt = r_i r_j integral_(bb(R)^2) Phi \( u \, v \) thin d u thin d v . $ <eq:add-box>]

Thus $A_phi.alt$ is the integral of $phi.alt$ on $"Tr" z = m$, using $z_i \, z_j$ as coordinates on that plane. Fix $r_(*) > 0$, keep $r_i \, r_j lt.eq r_(*)$, and require the supports of their planar factors to lie in a fixed bounded region. The supports of all the resulting $phi.alt$’s then lie in a fixed compact subset $Omega_oo$ of $bb(R)^3$ on which $"Tr" z$ stays away from zero. All constants below may depend on $m \, Phi \, chi$, the upper bound for the scales, and this bounded region. They do not depend on the locations $c$ or on the scales within their specified range.

For $p in.not S$, the algebra $F ⊗ bb(Q)_p$ is unramified and its integral trace map $R_(F \, p) arrow.r bb(Z)_p$ is onto. The affine set

$ cal(T)_(m \, p) = { z in R_(F \, p) : "Tr" z = m } $

is consequently a translate of a free rank-two direct summand of $R_(F \, p)$. A residue class on this set modulo $p^a$ means a translate of $p^a ker \( "Tr" : R_(F \, p) arrow.r bb(Z)_p \)$. Equivalently, if $z_p^0 in cal(T)_(m \, p)$ represents the class, its members satisfy $z - z_p^0 in p^a R_(F \, p)$. There are $p^(2 a)$ such classes.

#thm([Proposition 7.1.])[
  (Additive distribution).  #emph[There are absolute constants $tau \, theta > 0$ with the following property. Let $K \, cal(O) \, F$ be as in Section 5, put $X = \[ cal(O)_K : cal(O) \] sqrt(\| "Disc" \( K \) \|)$, and take $S$ as in that section for the fixed nonzero integer $m$. In Equation (7.1), choose any two real partition coordinates and scales 
$ X^(- tau) lt.eq r_i \, r_j lt.eq r_(*) $

 whose planar supports stay in the fixed bounded region above. Let $1 lt.eq l lt.eq X^theta$ be prime to every prime in $S$. For each $p divides l$ choose any $z_p^0 in cal(T)_(m \, p)$, specifying a class modulo $p^(v_p \( l \))$. Then 
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(z in F \, med "Tr" z = m\
z in R_(F \, p) med \( p in.not S \)\
z - z_p^0 in p^(v_p \( l \)) R_(F \, p) med \( p divides l \)) phi.alt \( z \) product_(p in S) f_p^(*) \( z \) = A_phi.alt thin l^(- 2) product_(p in S) d_p \( m \) #scale(x: 120%, y: 120%)[\(] 1 + O \( X^(- theta) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:add-equidistribution>]

 Here $d_p$ is the trace density of Lemma 29. The error is uniform over all the fields, orders, ordered real embeddings, permitted box locations and scales, moduli $l$, and chosen residue classes. The implied constant and the lower threshold for $X$ depend only on the fixed real data listed above and on $m$.]
] <prop:additive-equidistribution>

=== 7.1 Finite expansion and Poisson summation <finite-expansion-and-poisson-summation>

We first assemble the local inverse transforms into a finite global expansion. This is the point at which the fact that the cubic algebra is a field is essential. Let $frak(d)_F$ be the different of $F$, and write $frak(d)_p = frak(d)_F R_(F \, p)$ for its localization. For a choice of denominator shells at the primes of $S$, write

$ frak(h) = product_(p in S) frak(h)_p \, #h(2em) H = product_(p in S) H_p = "N" frak(h) \, #h(2em) G_0 = product_(p in S) p^(g_p) . $

Local ideals here and below are identified with global ideals supported at the corresponding primes. The functions $K_(p \, frak(h)_p)$ and their boundary sets $partial_(frak(h)_p) \( z \)$ are those of Lemma 32. Set

$ cal(L)_(frak(h)) = { p in S : g_p > 0 upright(" or ") p lt.eq 5 } . $

#thm([Lemma 7.2.])[
  (Global bounds for denominator profiles).  #emph[For every profile one has 
#[#set math.equation(numbering: n => "(7.3)")
 $ G_0 lt.eq \[ R_F : C_F \] lt.eq H G_0 . $ <eq:add-profile-indices>]

 Suppose that $z in F$ is integral outside $S$, its real image lies in $Omega_oo$, and $product_(p in S) K_(p \, frak(h)_p) \( z \) eq.not 0$. Define 
$ T_partial = T_partial \( frak(h) \, z \) = product_(p in S \\ cal(L)_(frak(h))\
frak(q) in partial_(frak(h)_p) \( z \)) "N" frak(q) \, $

 where an empty product is one. There is a constant depending only on $Omega_oo$ such that 
#[#set math.equation(numbering: n => "(7.4)")
 $ H & lt.double D_F G_0^24 T_partial \, & T_partial & lt.eq (product_(p in S) p)^3 \,\
lr(|product_(p in S) K_(p \, frak(h)_p) \( z \)|) & lt.double 8^(\| S \|) T_partial^(- 1 \/ 2) . $ <eq:add-profile-norm>]

 All such $z$ lie in a fractional $R_F$-ideal $frak(a)_(frak(h))$, independent of $z$, with 
#[#set math.equation(numbering: n => "(7.5)")
 $ "N" \( frak(a)_(frak(h)) \)^(- 1) lt.eq 30^12 D_F G_0^24 . $ <eq:add-profile-support>]

]
  #emph[Set $C_3 = 371$. For all sufficiently large $X$, depending only on the fixed real data and $m$, a profile contributing at any such $z$ has $H lt.eq X^(C_3)$. For these $X$ and every $z in F$ integral outside $S$ with real image in $Omega_oo$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ product_(p in S) f_p^(*) \( z \) = sum_(frak(h) = \( frak(h)_p \)_(p in S)\
H lt.eq X^(C_3)) product_(p in S) K_(p \, frak(h)_p) \( z \) . $ <eq:add-profile-expansion>]

 The number of profiles in this sum is $O_eta \( X^eta \)$ for every fixed $eta > 0$, uniformly in the arithmetic data.]
] <lem:add-profile-bounds>

#proof[
  Let $M_p = frak(h)_p ∩ C_(F \, p)$. The additive lattice identity
  $ \[ R_(F \, p) : C_(F \, p) \] = \[ R_(F \, p) : C_(F \, p) + frak(h)_p \] thin \[ frak(h)_p : M_p \] $
  has first factor between $1$ and $\[ R_(F \, p) : frak(h)_p \] = H_p$. The index of $C_F$ is supported on $S$ by Lemma 26; multiplying gives Equation (7.3).
  At $p in cal(L)_(frak(h))$, the local support is contained in $p^(- 4 \( g_p + 1 \)) frak(h)_p frak(d)_p^(- 1)$. At every other $p in S$, the support loses at most one power of each boundary prime $frak(q)$, and loses no power in the other components. It follows that a supporting $z$ belongs to
  $ frak(b)_(frak(h) \, z) = frak(h) frak(d)_F^(- 1) product_(p in cal(L)_(frak(h))) \( p R_F \)^(- 4 \( g_p + 1 \)) product_(p in S \\ cal(L)_(frak(h))\
frak(q) in partial_(frak(h)_p) \( z \)) frak(q)^(- 1) . $
  The real trace condition excludes $z = 0$. Since $F$ is a field, its norm is nonzero, and containment of the principal ideal $\( z \)$ in $frak(b)_(frak(h) \, z)$ gives
  $ \| "N"_(F \/ bb(Q)) z \| = "N" \( frak(b)_(frak(h) \, z) \) \[ frak(b)_(frak(h) \, z) : \( z \) \] gt.eq frac(H, D_F T_partial product_(p in cal(L)_(frak(h))) p^(12 \( g_p + 1 \))) . $
  The left side is bounded above on $Omega_oo$. For $g_p > 0$ we have $g_p + 1 lt.eq 2 g_p$; the only additional factors, for $g_p = 0$, are at $2 \, 3 \, 5$. Hence
  $ product_(p in cal(L)_(frak(h))) p^(12 \( g_p + 1 \)) lt.eq 30^12 G_0^24 . $
  This proves the first inequality of Equation (7.4). Each boundary prime occurs once, and $sum_(frak(q) divides p) f_(frak(q)) lt.eq sum_(frak(q) divides p) e_(frak(q)) f_(frak(q)) = 3$; this proves the bound for $T_partial$. Equation (7.4) is the product of the boundary bounds of Lemma 32; its absolute implied constant accounts for the three small primes.
  Dropping $frak(h)_p$ in the first support condition enlarges that support. In the second, the exponent $v_(frak(q)) \( frak(h)_p \) - 1$ at a boundary is nonnegative. Thus every supporting point belongs to the ideal
  $ frak(a)_(frak(h)) = frak(d)_F^(- 1) product_(p in cal(L)_(frak(h))) \( p R_F \)^(- 4 \( g_p + 1 \)) \, $
  which gives Equation (7.5).
  Lemma 26 gives $Delta_F lt.double X^28$, $D_F lt.eq Delta_F$, and $\[ R_F : C_F \] lt.eq Delta_F^(1 \/ 2)$. The definition of $S$ gives $product_(p in S) p lt.double_m X^2$. Equations $upright("(7.3)")$–$upright("(7.4)")$ therefore give $H lt.double X^(28 + 24 dot.op 14 + 6) = X^370$. The fixed implied constant is absorbed by $X^371$ for sufficiently large $X$.
  A nonzero field element has nonzero image in every component of $F ⊗ bb(Q)_p$. Lemma 33 therefore identifies the density $f_p^(*) \( z \)$ with its pointwise finite sum of inverse shells at all the present $z$. The norm bound just proved excludes every product with $H > X^371$, uniformly in $z$, and proves Equation (7.6). Finally, for any fixed $u > 0$, Rankin’s inequality bounds the number of profiles with $H lt.eq X^(C_3)$ by
  $ X^(C_3 u) product_(p in S) \( 1 - p^(- u) \)^(- 3) . $
  There are at most three prime-ideal components over each $p$. The radical bound on $S$ implies $\| S \| = O \( log X \/ log log X \)$, since the product of $k$ distinct primes is at least $k !$. The displayed Euler product is then $X^(o \( 1 \))$ for fixed $u$. Taking $u$ arbitrarily small proves the asserted bound for every $eta > 0$. ◻
]

We apply this expansion before imposing Poisson summation. For $p in.not S$ let

$ eta_(p \, l) \( z \) = cases(delim: "{", upright(bold(1))_(z_p^0 + p^(v_p \( l \)) R_(F \, p)) \( z \) \, & p divides l \,, upright(bold(1))_(R_(F \, p)) \( z \) \, & p divides.not l .) $

Let $eta_(frak(h) \, l)$ be the finite-adelic test function whose local factor is $K_(p \, frak(h)_p)$ at $p in S$ and $eta_(p \, l)$ elsewhere. By Lemma 32, every $K_(p \, frak(h)_p)$ is supported on elements of integral trace. The factors outside $S$ are supported in $R_(F \, p)$ and also have integral trace. Thus any $z in F$ with $eta_(frak(h) \, l) \( z \) eq.not 0$ has rational trace integral at every finite prime, hence an integer. Only $m$ meets $"supp" chi$. The finite profile expansion in Lemma 35 consequently shows that the left side of Equation (7.2), denoted by $Sigma$, equals

#[#set math.equation(numbering: n => "(7.7)")
 $ Sigma = sum_(frak(h)\
H lt.eq X^(C_3)) S_(frak(h)) \, #h(2em) S_(frak(h)) = sum_(z in F) phi.alt \( z \) eta_(frak(h) \, l) \( z \) . $ <eq:add-original-profiles>]

Here $C_3 = 371$ is fixed. The preceding lemma makes the profile interchange finite. Each inner sum also has finitely many terms, since its finite conditions place $z$ in a fractional ideal and its real support is compact.

In the local results of Section 6, choose the finite components of the standard character of $bb(A)_(bb(Q)) \/ bb(Q)$; they all have conductor $bb(Z)_p$. Compose this global character with the field trace. At a finite place the self-dual measure satisfies $"vol" \( R_(F \, p) \) = \| D_F \|_p^(1 \/ 2)$, while at infinity it is Lebesgue measure in the three embeddings. The real covolume of $R_F$ is $sqrt(D_F)$ and $product_p "vol" \( R_(F \, p) \) = D_F^(- 1 \/ 2)$. Thus the diagonal copy of $F$ has covolume one for these measures. Write

$ hat(phi.alt) \( A \) = integral_(bb(R)^3) phi.alt \( z \) psi_oo \( "Tr" \( A z \) \) thin d z $

for the real transform. Field Poisson summation in this normalization #cite(label("Tate1967")) Section 4.2, Lemma 4.2.4 gives

#[#set math.equation(numbering: n => "(7.8)")
 $ S_(frak(h)) = sum_(A in F) hat(phi.alt) \( A \) hat(eta)_(frak(h) \, l) \( A \) \, #h(2em) hat(eta)_(frak(h) \, l) \( A \) = product_(p in S) gamma_(p \, frak(h)_p) \( A \) product_(p in.not S) hat(eta)_(p \, l) \( A \) . $ <eq:add-poisson>]

Here $gamma_(p \, frak(h)_p)$ is the shell restriction of $gamma_p$, extended by zero, and hats use the chosen character. Each finite test is Schwartz–Bruhat, so the formula is also ordinary lattice Poisson summation with congruence classes. At $p in.not S$, trace duality is unimodular and

$ hat(eta)_(p \, l) \( A \) = p^(- 3 v_p \( l \)) psi_p \( "Tr" \( A z_p^0 \) \) upright(bold(1))_(p^(- v_p \( l \)) R_(F \, p)) \( A \) quad \( p divides l \) \; $

for $p divides.not l$ it is $upright(bold(1))_(R_(F \, p))$. In particular every such transform is bounded in absolute value by one. The finite Fourier factors in Equation (7.8) are supported on the fractional ideal

#[#set math.equation(numbering: n => "(7.9)")
 $ Gamma_(l \, frak(h)) = l^(- 1) frak(h)^(- 1) \, #h(2em) P = l^3 H \, #h(2em) "N" \( Gamma_(l \, frak(h)) \) = P^(- 1) . $ <eq:add-frequency-lattice>]

The following elementary geometry of this ideal will be used both to count frequencies and to express the local congruences in global integer coordinates.

#thm([Lemma 7.3.])[
  (Lattice bounds for a cubic ideal).  #emph[Let $frak(a)$ be a fractional ideal of a totally real cubic field of discriminant $D_F$, and write $"N" \( frak(a) \) = P^(- 1)$ with $P > 0$. Let $B_Y = { x in bb(R)^3 : parallel x parallel lt.eq Y }$. In embedding coordinates it has covolume $sqrt(D_F) \/ P$, first Euclidean minimum $gt.double P^(- 1 \/ 3)$, and, for $Y > 0$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ \# { A in frak(a) : parallel A parallel lt.eq Y } lt.double 1 + Y P^(1 \/ 3) + Y^2 P^(2 \/ 3) + frac(Y^3 P, sqrt(D_F)) . $ <eq:add-lattice-count>]

 There is a $bb(Z)$-basis $b_1 \, b_2 \, b_3$ of $frak(a)$ in which every $A = sum n_i b_i$ with $parallel A parallel lt.eq Y$ satisfies 
$ \| n_i \| lt.double Y P^(1 \/ 3) quad \( 1 lt.eq i lt.eq 3 \) . $

 All constants here are absolute.]
] <lem:add-ideal-lattice>

#proof[
  The covolume formula follows from the discriminant. For $0 eq.not A in frak(a)$, containment $\( A \) subset frak(a)$ implies $\| "N"_(F \/ bb(Q)) A \| gt.eq "N" frak(a) = P^(- 1)$. The product inequality in three real coordinates gives $\| "N" A \| lt.eq \( parallel A parallel \/ sqrt(3) \)^3$, proving the first-minimum bound.
  Let $lambda_1 lt.eq lambda_2 lt.eq lambda_3$ be the Euclidean successive minima. A lattice in fixed dimension has a basis of bounded orthogonality defect, by Mahler’s basis theorem #cite(label("Mahler1946")) Section 2, Theorem 1. For such a basis, order its lengths increasingly and write its defect as $omega = product_i parallel b_i parallel \/ "covol" \( frak(a) \) lt.double 1$. Cramer’s rule and Hadamard’s inequality bound the norm of the $i$-th coordinate functional by $omega \/ parallel b_i parallel$. Since $parallel b_i parallel gt.eq lambda_i$, counting its possible integer coordinates gives
  $ \# \( frak(a) ∩ B_Y \) lt.double product_(i = 1)^3 \( 1 + Y \/ lambda_i \) . $
  Minkowski’s second theorem for the Euclidean ball, in the formulation of #cite(label("Widmer2010")) Theorem 4.3, gives $lambda_1 lambda_2 lambda_3 asymp "covol" \( frak(a) \)$. Expanding the last product, using $lambda_2 gt.eq lambda_1$, and inserting the first-minimum and covolume bounds proves Equation (7.10). The same coordinate functional bound with $parallel b_i parallel gt.eq lambda_1$ proves the final assertion. ◻
]

=== 7.2 The nonscalar contribution <the-nonscalar-contribution>

Scalar frequencies $A in bb(Q) subset F$ in Equation (7.8) record only the trace. The main work is to show that the remaining frequencies contribute an absolute power saving. We prove that estimate before evaluating the scalar terms.

#thm([Lemma 7.4.])[
  (Nonscalar contribution).  #emph[There are absolute $tau \, theta \, epsilon.alt_F > 0$, with $epsilon.alt_F > 2 tau + 3 theta$, such that for $C_3 = 371$ and the data of Proposition 34 with these $tau \, theta$, 
#[#set math.equation(numbering: n => "(7.11)")
 $ sum_(frak(h)\
H lt.eq X^(C_3)) lr(|sum_(A in F \\ bb(Q)) hat(phi.alt) \( A \) hat(eta)_(frak(h) \, l) \( A \)|) lt.double X^(- epsilon.alt_F) . $ <eq:add-nonscalar>]

 The constants have the same uniformity as in that proposition.]
] <lem:add-nonscalar>

#proof[
  We use $lambda = 1 \/ 3$. Lemma 26, which gives $Delta_F gt.eq X^(1 \/ 2) \/ 2$, implies
  #[#set math.equation(numbering: n => "(7.12)")
   $ Delta_F gt.eq X^lambda $ <eq:add-order-lower>]
  for all sufficiently large $X$.
  After bounding the real Fourier tail, we split according to the field discriminant. If $D_F$ is large, comparing it with the discriminant of the order generated by a retained nonscalar frequency after clearing its denominators forces $H$ large. Otherwise the lower bound for $Delta_F$ makes the index $\[ R_F : C_F \]$ large. For profiles with small $G_0$, this forces $H$ large; inverse support and boundary decay then bound the possibly signed original sum $S_(frak(h))$. Poisson expresses its full nonscalar Fourier sum as $S_(frak(h))$ minus the separately estimated scalar series. For profiles with large $G_0$, the inverse depths attached to each frequency and its chosen shifts provide either sufficient pointwise decay or congruences; in the latter range a further discriminant comparison supplies the required denominator size.
  The positive exponents $d \, e \, e_1 \, e_2 \, w \, theta \, tau$ below will be fixed at the end of the proof; put $Y = X^w$ and $s = w + theta$.
  First the frequencies outside $parallel A parallel lt.eq Y$ can be discarded. For every fixed integer $r gt.eq 0$, integration by parts in the fixed real coordinates gives, uniformly over the box family,
  #[#set math.equation(numbering: n => "(7.13)")
   $ \| hat(phi.alt) \( A \) \| lt.double_r X^(r tau) \( 1 + parallel A parallel \)^(- r) . $ <eq:add-real-decay>]
  Indeed each derivative of order $r$ costs at most a constant times $X^(r tau)$, and all supports are in one compact set. Lemma 32 and the bounds for $p in.not S$ give $\| hat(eta)_(frak(h) \, l) \( A \) \| lt.double H^(- 1)$. The first-minimum bound also gives the rough count $\# \( Gamma_(l \, frak(h)) ∩ B_R \) lt.double \( 1 + R P^(1 \/ 3) \)^3$. For $R gt.eq Y gt.eq 1$ this is $O \( R^3 P \)$, since $P = l^3 H gt.eq 1$. Dyadic summation of Equation (7.13), for $r > 3$, yields
  #[#set math.equation(numbering: n => "(7.14)")
   $ sum_(A in F\
parallel A parallel > Y) \| hat(phi.alt) \( A \) hat(eta)_(frak(h) \, l) \( A \) \| lt.double_r X^(r tau) l^3 Y^(3 - r) lt.eq X^(r tau + 3 theta + w \( 3 - r \)) thin O_r \( 1 \) . $ <eq:add-real-tail>]
  This also proves absolute convergence in Equation (7.8). The profile count costs only $X^(o \( 1 \))$. When bounding Fourier terms directly, we may therefore restrict to the ball and use the uniform bound $\| hat(phi.alt) \| lt.double 1$ there.
  Suppose first that $D_F gt.eq X^d$. A nonscalar $A$ generates $F$, since the field has degree three. Moreover $H R_F subset frak(h)$: the integer $H = \| R_F \/ frak(h) \|$ annihilates this finite group. Thus $l H A in R_F$ for $A in Gamma_(l \, frak(h))$. The discriminant of the order $bb(Z) \[ l H A \]$ is a positive integer multiple of $D_F$, whereas the product of the squared differences of its three real conjugates is $O \( \( l H Y \)^6 \)$. Existence of a nonscalar frequency in the ball therefore implies
  $ D_F lt.double \( l H Y \)^6 \, #h(2em) H gt.double X^(d \/ 6 - s) . $
  Apply Equation (7.10) to $Gamma_(l \, frak(h))$ and multiply it by $H^(- 1)$. The four resulting terms are bounded by constants times
  #[#set math.equation(numbering: n => "(7.15)")
   $ X^(- d \/ 6 + s) + X^(- d \/ 9 + 5 s \/ 3) + X^(- d \/ 18 + 7 s \/ 3) + X^(- d \/ 2 + 3 s) . $ <eq:add-large-field>]
  All have a fixed power saving once $s < d \/ 100$. If the ball contains no nonscalar frequency there is nothing to count for that profile.
  We now assume $D_F < X^d$. When $d lt.eq lambda \/ 3$, Equation (7.12) gives
  $ \[ R_F : C_F \] = \( Delta_F \/ D_F \)^(1 \/ 2) gt.eq X^(lambda \/ 3) . $
  Profiles with $G_0 lt.eq X^e$ are best estimated in their original form $S_(frak(h))$. Equation (7.3) implies $H gt.eq X^(lambda \/ 3 - e)$. All supporting points lie in $frak(a)_(frak(h))$, whose reciprocal norm is $O \( D_F G_0^24 \)$ by Equation (7.5). The first-minimum bound of Lemma 36, applied in the fixed real region, gives $O \( D_F G_0^24 \)$ possible points. At each such point, Equations $upright("(7.4)")$–$upright("(7.4)")$ give
  $ lr(|product_(p in S) K_(p \, frak(h)_p) \( z \)|) lt.double X^(o \( 1 \)) (frac(D_F G_0^24, H))^(1 \/ 2) . $
  Here and below $X^(o \( 1 \))$ denotes $O_eta \( X^eta \)$ for every fixed $eta > 0$, uniformly in the arithmetic data; it includes factors $8^(\| S \|)$. It follows that
  #[#set math.equation(numbering: n => "(7.16)")
   $ \| S_(frak(h)) \| lt.double X^(- lambda \/ 6 + \( 3 \/ 2 \) d + \( 73 \/ 2 \) e + o \( 1 \)) . $ <eq:add-small-index-profile>]
  The use of the original sum has gained the boundary factor from the inverse transform. It remains to check that its scalar portion is small as well, so that this bounds the nonscalar portion.
  If a rational scalar has denominator $p^k$ at $p$, its denominator ideal in $R_(F \, p)$ is $p^k R_(F \, p)$; its component exponents are $e_(frak(q)) k$, so its norm is $p^(3 k)$, including at ramified primes. Thus a scalar in this profile has its $S$-part denominator $t = H^(1 \/ 3)$, or the profile contains no scalar. Its denominator away from $S$ divides $l$, so there are $O \( 1 + Y l H^(1 \/ 3) \)$ such rationals in the ball. Their absolute contribution is at most
  #[#set math.equation(numbering: n => "(7.17)")
   $ O #scale(x: 120%, y: 120%)[\(] H^(- 1) + Y l H^(- 2 \/ 3) #scale(x: 120%, y: 120%)[\)] . $ <eq:add-small-index-scalars>]
  By $H gt.eq X^(lambda \/ 3 - e)$ this also saves a power for the choices below. Equation (7.8) expresses the full dual sum as $S_(frak(h))$. Subtracting its scalar frequencies in the ball and using Equation (7.14) for the scalar tail therefore bounds the full nonscalar sum for these profiles by Equations (7.16)–(7.17) and the tail. No positivity of an individual inverse shell is needed.
  It remains to treat $D_F < X^d$ and $G_0 > X^e$. For each frequency in the denominator shell of the profile choose at each $p in S$ one of the shifts $s_p$ of Lemma 30, and write
  $ alpha_p = A + s_p \, #h(2em) beta_p = alpha_p^(- 1) \, #h(2em) J = product_(p in S) p^(j_p) \, $
  where $j_p$ is the least nonnegative integer with $p^(j_p) beta_p in C_(F \, p)$. All sums involving $J$ below are over frequencies in this profile. The pointwise local estimate now reads
  $ \| hat(eta)_(frak(h) \, l) \( A \) \| lt.double H^(- 1) J^(- 1 \/ 2) . $
  For frequencies with $J gt.eq X^(e_2)$, the rough lattice count immediately gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ sum_(parallel A parallel lt.eq Y\
J gt.eq X^(e_2)) \| hat(phi.alt) \( A \) hat(eta)_(frak(h) \, l) \( A \) \| lt.double frac(\( 1 + Y P^(1 \/ 3) \)^3, H) thin X^(- e_2 \/ 2) lt.double X^(3 s - e_2 \/ 2) . $ <eq:add-large-j>]
  We used $H \, l \, Y gt.eq 1$. This leaves $J < X^(e_2)$, where the extra factor in the Fourier bound may be too small. The order discriminant then forces a large denominator ideal, and the definition of $j_p$ supplies congruences among its possible frequencies.
  For a nonscalar $A$ let $"disc" \( A \) = "Disc" \( 1 \, A \, A^2 \) in bb(Q)^times$. The equality $F = bb(Q) \[ A \]$ remains $F ⊗ bb(Q)_p = bb(Q)_p \[ A \]$ after tensoring. Shifting by a scalar and inverting an element with nonzero components preserve the generated algebra, so $p^(j_p) beta_p$ generates $F ⊗ bb(Q)_p$. The full-rank order $bb(Z)_p \[ p^(j_p) beta_p \]$ is contained in $C_(F \, p)$. The identities
  $ "disc" \( beta_p \) = frac("disc" \( A \), "N"_(F_p \/ bb(Q)_p) \( alpha_p \)^4) \, #h(2em) "disc" \( p^(j_p) beta_p \) = p^(6 j_p) "disc" \( beta_p \) $
  follow by taking the three differences of conjugates and by scaling. Discriminant divisibility therefore gives
  $ v_p \( "disc" \( A \) \) - 4 v_p \( "N" alpha_p \) + 6 j_p gt.eq v_p \( Delta_F \) . $
  The shift lemma says $v_p \( "N" alpha_p \) = - log_p H_p$ for $p > 5$, and differs from this by at most three at $2 \, 3 \, 5$. For $p in.not S$, $l A$ is integral and $C_(F \, p) = R_(F \, p)$ is unramified, so $v_p \( "disc" \( A \) \) gt.eq - 6 v_p \( l \)$. Combining these valuation bounds for the nonzero rational $"disc" \( A \)$, with only an absolute factor from $2 \, 3 \, 5$, gives
  #[#set math.equation(numbering: n => "(7.19)")
   $ Y^6 gt.double \| "disc" \( A \) \| gt.double Delta_F thin J^(- 6) H^(- 4) l^(- 6) . $ <eq:add-frequency-discriminant>]
  The first inequality uses $parallel A parallel lt.eq Y$. Thus for $J < X^(e_2)$, Equations $upright("(7.12)")$ and $upright("(7.19)")$ imply
  #[#set math.equation(numbering: n => "(7.20)")
   $ H gt.double X^(lambda \/ 4 - \( 3 \/ 2 \) \( s + e_2 \)) . $ <eq:add-denominator-lower>]
  In particular, once $s + e_2 < lambda \/ 12$ with a margin, every nonscalar frequency under consideration has $H gt.eq X^(lambda \/ 8)$ for large $X$.
  For the remaining count, group frequencies according to their $j_p$’s and the chosen $s_p$’s. The number of exponent lists with $J < X^(e_2)$ is $X^(o \( 1 \))$, by the same Rankin argument as for profiles; the bounded lists of shifts cost $4^(\| S \|) = X^(o \( 1 \))$. Groups containing no nonscalar frequency contribute zero and are omitted. Fix one of the other groups. Apply the basis part of Lemma 36 to $Gamma_(l \, frak(h))$. All frequencies in the ball have integer coordinates in a cube $\[ - L \, L \]^3$, where we choose $L$ comparable to the upper bound $Y P^(1 \/ 3)$. This choice, together with Equation (7.20), gives
  #[#set math.equation(numbering: n => "(7.21)")
   $ L asymp Y P^(1 \/ 3) \, #h(2em) L gt.double X^(lambda \/ 24) \, #h(2em) L^3 \/ H lt.double X^(3 s) . $ <eq:add-coordinate-cube>]
  At $p in S$ choose a generator $i_p$ of the maximal-order ideal $frak(h)_p$, and set $x = i_p \( A + s_p \)$. Localizing the global basis of $Gamma_(l \, frak(h))$ at $p$, then multiplying it by $i_p$, gives a $bb(Z)_p$-basis of $R_(F \, p)$, because $p divides.not l$. Accordingly the map from the three integer coordinates to $x$ is an affine $"GL"_3 \( bb(Z)_p \)$ change of coordinates. This statement holds also for a product of ramified local fields.
  Smith normal form for $frak(h)_p ∩ C_(F \, p)$ inside $frak(h)_p$ gives a primitive linear form $ell_p : R_(F \, p) arrow.r bb(Z)_p$, meaning that its image is $bb(Z)_p$, and an integer $g'_p gt.eq g_p \/ 3$ such that
  $ ell_p #scale(x: 120%, y: 120%)[\(] i_p^(- 1) \( frak(h)_p ∩ C_(F \, p) \) #scale(x: 120%, y: 120%)[\)] subset p^(g'_p) bb(Z)_p . $
  Indeed the three elementary-divisor exponents sum to $g_p$, and we use the coordinate with largest exponent. If $p > 5$, the shift lemma makes $x$ a unit and $beta_p = i_p x^(- 1) in frak(h)_p$. The condition $p^(j_p) beta_p in C_(F \, p)$ implies
  #[#set math.equation(numbering: n => "(7.22)")
   $ ell_p \( x^(- 1) \) equiv 0 med \( mod med p^k \) quad upright("for every ") 1 lt.eq k lt.eq \( g'_p - j_p \)_(+) . $ <eq:add-inverse-congruence>]
  Inversion permutes the units in the finite algebra $R_(F \, p) \/ p^k R_(F \, p)$. A primitive linear form has $p^(2 k)$ zeros among the $p^(3 k)$ additive residues. Thus the unit condition and Equation (7.22) retain at most the fraction $p^(- k)$ of all residues modulo $p^k$. Nilpotents in the finite algebra do not affect this argument.
  For $p = 2 \, 3 \, 5$, the shift lemma gives $x in R_(F \, p)$ and $x^(- 1) in p^(- 1) R_(F \, p)$. Put $y = p x^(- 1)$. Then $p^(j_p) i_p y = p \( p^(j_p) beta_p \)$ still lies in $frak(h)_p ∩ C_(F \, p)$, and the congruence in Equation (7.22) holds for $y$ in place of $x^(- 1)$. On the permitted locus the inverse identities
  $ y \( x \) - y \( x' \) = p x^(- 1) \( x' - x \) \( x' \)^(- 1) \, #h(2em) x - x' = p^(- 1) x #scale(x: 120%, y: 120%)[\(] y \( x' \) - y \( x \) #scale(x: 120%, y: 120%)[\)] x' $
  show respectively that $x med mod med p^(k + 1)$ determines $y med mod med p^k$, and that a fixed residue of $y med mod med p^k$ confines $x$ to one residue modulo $p^(k - 1)$. The permitted locus has $v_(frak(q)) \( x \) = 0$ on the pole components and $0 lt.eq v_(frak(q)) \( x \) lt.eq e_(frak(q))$ on the other components. These conditions are determined modulo $p^2$, since a change in $p^2 R_(F \, p)$ has component valuation at least $2 e_(frak(q))$. At modulus $p^(k + 1)$, each of the at most $p^(2 k)$ residues in the linear kernel therefore allows at most $p^6$ residues of $x$. The retained fraction is at most $p^(3 - k)$, hence $O \( p^(- k) \)$ with an absolute constant at these three primes. This proves the required congruence fraction with only one extra power of a small prime in its modulus.
  Write $a_p = \( g'_p - j_p \)_(+)$. The available congruence powers satisfy
  #[#set math.equation(numbering: n => "(7.23)")
   $ product_(p in S) p^(a_p) gt.eq G_0^(1 \/ 3) \/ J > X^(e \/ 3 - e_2) . $ <eq:add-available-congruences>]
  We will choose $e \/ 3 - e_2 > 2 e_1$. If every prime with $a_p > 0$ is at most $X^(e_1)$, multiply available factors $p$, one at a time, until their product $M_1$ first reaches $X^(e_1 \/ 2)$. Equation $upright("(7.23)")$ ensures this is possible, and
  $ X^(e_1 \/ 2) lt.eq M_1 lt.eq X^(3 e_1 \/ 2) < X^(2 e_1) . $
  Impose just the corresponding congruences. The Chinese remainder theorem combines their retained fractions into $O \( M_1^(- 1) \)$. Their joint modulus is $M_1$ times at most $2 dot.op 3 dot.op 5$, because only the small-prime tests need one extra power. The affine integral coordinate changes above preserve these fractions in the global coordinates. If $2 e_1 < lambda \/ 24$, this joint modulus is $o \( L \)$ by Equation (7.21). Counting each admissible residue class in the cube then gives
  #[#set math.equation(numbering: n => "(7.24)")
   $ O \( L^3 \/ M_1 \) = O \( L^3 X^(- e_1 \/ 2) \) $ <eq:add-composite-congruence-count>]
  possible frequencies.
  Otherwise some available prime satisfies $p > X^(e_1)$; for large $X$ it exceeds $5$. Use its congruence modulo $p$. Set $B = R_(F \, p) \/ p R_(F \, p)$, a three-dimensional commutative $upright(bold(F))_p$-algebra, possibly with nilpotents, and reduce $ell_p$ modulo $p$. Choose an $upright(bold(F))_p$-basis of $B$ and let $x$ be the universal element of $B ⊗_(upright(bold(F))_p) upright(bold(F))_p \[ X_1 \, X_2 \, X_3 \]$ in this basis. Let $M_x$ be its multiplication matrix and put $cal(N)_B \( x \) = det M_x$. This is a nonzero polynomial of degree three, since $cal(N)_B \( 1 \) = 1$. On the unit open set $cal(N)_B eq.not 0$,
  $ ell_p \( x^(- 1) \) = frac(P_ell \( x \), cal(N)_B \( x \)) \, #h(2em) P_ell \( x \) = ell_p #scale(x: 120%, y: 120%)[\(] "adj" \( M_x \) 1_B #scale(x: 120%, y: 120%)[\)] \, $
  where $P_ell$ has degree at most two. This numerator is nonzero. Indeed the affine space parametrizing elements of the vector space $B$ has coordinate ring $upright(bold(F))_p \[ X_1 \, X_2 \, X_3 \]$, which is a domain even when multiplication in $B$ has nilpotents. The unit open set is dense, and inversion is an automorphism of that open set. The nonzero linear polynomial $ell_p$ stays nonzero on the open set and after composition with inversion. The displayed formula, or injectivity of localization at $cal(N)_B$, then forces $P_ell eq.not 0$. The affine $"GL"_3 \( upright(bold(F))_p \)$ change from global lattice coordinates preserves nonvanishing.
  Let $N_L = 2 floor.l L floor.r + 1 asymp L$ be the number of possible integers in one coordinate of the cube. A nonzero polynomial of bounded degree has $O \( N_L^2 \)$ zeros on a product of three residue intervals of length $N_L < p$; this follows by induction on the number of variables, viewing it as a polynomial in the last variable and bounding the slices on which all its coefficients vanish. If $N_L gt.eq p$, partition the cube into boxes of side at most $p$ and use the same bound there. The number of global integer coordinates satisfying $P_ell = 0 med mod med p$ is consequently
  #[#set math.equation(numbering: n => "(7.25)")
   $ O #scale(x: 120%, y: 120%)[\(] L^3 \/ p + L^2 #scale(x: 120%, y: 120%)[\)] = O #scale(x: 120%, y: 120%)[\(] L^3 \( X^(- e_1) + X^(- lambda \/ 24) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:add-prime-congruence-count>]
  This bounds the subset for which $x$ is a unit as well. Multiplying Equations $upright("(7.24)")$–$upright("(7.25)")$ by $H^(- 1)$, and using Equation (7.21), gives respectively the bounds
  $ O \( X^(3 s - e_1 \/ 2) \) \, #h(2em) O \( X^(3 s - e_1) + X^(3 s - lambda \/ 24) \) $
  for the fixed group of $j_p$’s and shifts. Their $X^(o \( 1 \))$ number is harmless once these exponents are negative with a margin. This completes the count of nonscalar frequencies in the ball.
  We finish by making the parameter choices and all margins explicit. Put $lambda_0 = min \( lambda \, 1 \)$ and take
  #[#set math.equation(numbering: n => "(7.26)")
   $ d = e & = lambda_0 / 1000 \, & e_1 & = e / 100 \, & e_2 & = e_1 / 100 \,\
w & = e_2 / 100 \, & theta = tau & = w / 100 \, & epsilon.alt_F & = e_2 / 4 . $ <eq:add-parameters>]
  Then $s = 101 e_2 \/ 10000$,
  $ s < d \/ 100 \, quad d < lambda \/ 3 \, quad e \/ 3 - e_2 > 2 e_1 \, quad 2 e_1 < lambda \/ 24 \, quad s + e_2 < lambda \/ 12 . $
  The saving in Equation (7.16) is at least
  $ lambda \/ 6 - \( 3 \/ 2 \) d - \( 73 \/ 2 \) e gt.eq \( 1 \/ 6 - 0.038 \) lambda_0 \, $
  and Equation (7.17) has a still larger margin than $epsilon.alt_F$, since $e lt.eq lambda \/ 1000$. All four exponents in Equation (7.15) also have margins at least $29 d \/ 900 > epsilon.alt_F$, by $s < d \/ 100$. Among the remaining ball estimates the smallest margin is in Equation (7.18), namely
  $ e_2 \/ 2 - 3 s = 4697 / 10000 e_2 > epsilon.alt_F \; $
  the congruence margins $e_1 \/ 2 - 3 s$, $e_1 - 3 s$, and $lambda \/ 24 - 3 s$ are larger. With $r = 100$, the exponent in Equation (7.14) is
  $ r tau + 3 theta + w \( 3 - r \) = - 9597 / 10000 e_2 . $
  All $X^(o \( 1 \))$ costs from profiles, shifts, and exponent lists can thus be absorbed while retaining $epsilon.alt_F = e_2 \/ 4$. This proves Equation (7.11). Finally $2 tau + 3 theta = e_2 \/ 2000 < epsilon.alt_F$, as asserted. ◻
]

=== 7.3 The scalar term and completion <the-scalar-term-and-completion>

#proof[
  Use the constants in Equation (7.26). Equations (7.7) and $upright("(7.8)")$, together with Lemma 37, leave the scalar frequencies with absolute error $O \( X^(- epsilon.alt_F) \)$. We first remove the profile cutoff from those frequencies.
  For $a in bb(Q)$, let $t = product_(p in S) p^(max \( 0 \, - v_p \( a \) \))$ be its $S$-part denominator, with $t = 1$ for $a = 0$. As noted above, its unique profile has $H = t^3$. Lemma 29 gives the exact product $product_(p in S) gamma_p \( a \) = t^(- 3)$, including at $2 \, 3 \, 5$. The other denominator divides $l$, so all such scalars with a given $t$ lie in $\( t l \)^(- 1) bb(Z)$. The change of real variables $\( z_i \, z_j \, z_k \) mapsto \( z_i \, z_j \, "Tr" z \)$ has absolute Jacobian one. Writing $upright(bold(1)) = \( 1 \, 1 \, 1 \)$, it gives the exact identity
  $ hat(phi.alt) \( a upright(bold(1)) \) = A_phi.alt thin hat(chi) \( a \) . $
  For any fixed $r > 1$, rapid decay of the fixed function $chi$ implies $sum_(n in bb(Z)) \| hat(chi) \( n \/ \( t l \) \) \| lt.double_r t l$. The scalars omitted by $H lt.eq X^(C_3)$ therefore contribute at most
  #[#set math.equation(numbering: n => "(7.27)")
   $ sum_(t > X^(C_3 \/ 3)) t^(- 3) sum_(n in bb(Z)) \| hat(phi.alt) \( \( n \/ \( t l \) \) upright(bold(1)) \) \| lt.double A_phi.alt thin l thin X^(- C_3 \/ 3) . $ <eq:add-scalar-tail>]
  We have enlarged the set of $t$’s to all positive integers, which is an upper bound. With $C_3 = 371$, this is $O \( X^(- epsilon.alt_F) \)$, since $A_phi.alt lt.double 1$, $l lt.eq X^theta$, and $371 \/ 3 - theta > epsilon.alt_F$. The same calculation without the cutoff proves absolute convergence of the unrestricted scalar series.
  That series is one-dimensional Poisson summation for the trace marginals. At infinity the marginal is $A_phi.alt chi \( t \)$. At $p in S$ it is $d_p \( t \) upright(bold(1))_(bb(Z)_p) \( t \)$. At $p divides l$, the onto integral trace map and two kernel coordinates show that the indicator $z_p^0 + p^(v_p \( l \)) R_(F \, p)$ has trace density
  $ p^(- 2 v_p \( l \)) upright(bold(1))_(m + p^(v_p \( l \)) bb(Z)_p) \( t \) $
  with respect to Haar measure of mass one on $bb(Z)_p$. At every other finite prime the marginal is $upright(bold(1))_(bb(Z)_p)$. Their Fourier transforms at a rational $a$ are exactly the finite factors in Equation (7.8) evaluated at the scalar $a$, because $"Tr" \( a z \) = a "Tr" z$.
  For completeness, this one-dimensional application of Poisson does not require a smoothness assumption on $d_p$. Its Fourier coefficients on $bb(Q)_p \/ bb(Z)_p$ of denominator $p^k$ are $p^(- 3 k)$, and there are $p^k - p^(k - 1)$ such characters. Their absolute sum is finite. Truncating each expansion gives a compactly supported locally constant density on $bb(Z)_p$, to which Poisson applies. The densities converge uniformly by Lemma 29, and the preceding absolute scalar bound permits passage to the limit on the Fourier side. On the original side, the finite marginals force the rational trace to be an integer. Only $m$ meets the real cutoff. Hence the unrestricted scalar contribution is precisely
  $ A_phi.alt thin l^(- 2) product_(p in S) d_p \( m \) . $
  Lemma 29 bounds the product of $d_p \( m \)$ above and below by positive absolute constants. Also $A_phi.alt gt.double X^(- 2 tau)$ by Equation (7.1), and $l^(- 2) gt.eq X^(- 2 theta)$. Dividing the combined absolute error $O \( X^(- epsilon.alt_F) \)$ by the main term therefore costs at most $O \( X^(2 tau + 2 theta) \)$. Since $epsilon.alt_F > 2 tau + 3 theta$, the relative error is $O \( X^(- theta) \)$. Every estimate used fixed real derivative and support bounds and constants independent of the fields, orders, residues, and box locations and scales. This proves Equation (7.2) with its stated uniformity. ◻
]

== 8 Averaging the unramified factors <sec:sieve>

Proposition 34 distributes the nonnegative mass $phi.alt \( z \) product_(p in S) f_p^(*) \( z \)$ among residue classes at primes outside $S$. To prove Theorem 19, we must insert the remaining factors $b_p \( z \)$ while retaining their local means. Some of those means are less than one, so the argument must also keep track of the probability that a prime does not divide any component of $z$. We first obtain a weighted sieve estimate with this feature and then combine its local means with the Euler factors in Proposition 24.

=== 8.1 Residue functions and the local bounds <residue-functions-and-the-local-bounds>

Fix $m in bb(Z) \\ { 0 }$ and a bounded region of the real trace-$m$ plane. Throughout the sieve argument, $phi.alt$ is one of the nonnegative smooth box functions in Proposition 34, with its planar support in this region. Its two scales lie between $X^(- tau)$ and fixed constants. Define a measure on $F$ by

#[#set math.equation(numbering: n => "(8.1)")
 $ nu_phi.alt = sum_(z in F \, med "Tr" z = m\
z upright(" integral outside ") S) phi.alt \( z \) product_(p in S) f_p^(*) \( z \) thin delta_z \, #h(2em) V_phi.alt = A_phi.alt product_(p in S) d_p \( m \) . $ <eq:sieve-measure>]

Here $delta_z$ is unit point mass at $z$. All its coefficients are nonnegative, and Proposition 34 with modulus one gives a finite total mass. Lemma 29 gives

#[#set math.equation(numbering: n => "(8.2)")
 $ V_phi.alt asymp A_phi.alt $ <eq:sieve-volume>]

uniformly in $S$: for large primes the logarithms of $d_p \( m \) = 1 + O \( p^(- 2) \)$ have an absolutely convergent sum, and the finitely many small-prime densities have uniform positive upper and lower bounds.

For a positive integer $l$ prime to every prime of $S$, the integral trace-$m$ coset has $l^2$ residue classes modulo $l$ in its two integral coordinates. Write $bb(E)_l W$ for the uniform mean of a function $W$ on these classes, and also write $W \( z \)$ for its pullback to points integral outside $S$.

#thm([Lemma 8.1.])[
  (Nonnegative residue functions).  #emph[With $phi.alt$ and $V_phi.alt$ as in Equation (8.1), let $1 lt.eq l lt.eq X^theta$ be an integer prime to every prime of $S$. For every nonnegative function $W$ on the residue classes of the integral trace-$m$ coset modulo $l$, 
#[#set math.equation(numbering: n => "(8.3)")
 $ integral W thin d nu_phi.alt = V_phi.alt bb(E)_l W + O #scale(x: 120%, y: 120%)[\(] V_phi.alt X^(- theta) bb(E)_l W #scale(x: 120%, y: 120%)[\)] . $ <eq:sieve-residue-function>]

 The implied constant is uniform in the fields, orders, embedding orderings, permitted box locations and scales, $l$, and $W$. It may depend on $m$, the fixed bounded region, and the fixed smooth box function.]
] <lem:sieve-residue-function>

#proof[
  For each residue class $a$, Equation (7.2) gives
  $ nu_phi.alt \( a \) = V_phi.alt l^(- 2) \( 1 + epsilon.alt_a \) \, #h(2em) \| epsilon.alt_a \| lt.eq C_(upright("add")) X^(- theta) \, $
  with the same $C_(upright("add"))$ for every $a$ and $l$ in the stated range. Multiply by $W \( a \)$ and sum. Since $W \( a \) gt.eq 0$, the absolute value of the summed error is at most $C_(upright("add")) V_phi.alt X^(- theta) l^(- 2) sum_a W \( a \) = C_(upright("add")) V_phi.alt X^(- theta) bb(E)_l W$. This also covers $bb(E)_l W = 0$. In particular the error retains the local mean even when that mean is very small. ◻
]

We recall the information about the functions to be inserted. For $p in.not S$, let $bb(E)_p$ and $bb(P)_p$ denote expectation and probability for normalized additive Haar measure on ${ z in R_(F \, p) : "Tr" z = m }$. On $R_(F \, p) ∩ F_p^times$, recall that $n_p \( z \) = max_(frak(q) divides p) v_(frak(q)) \( z \)$ is the largest component valuation, with $v_(frak(q)) \( p \) = 1$; see Equation (5.20). On the null set where a component vanishes, keep the convention $n_p = oo$, $b_p = 0$. Lemma 23 permits one fixed integer $C gt.eq 1$ such that, on the nonvanishing locus,

#[#set math.equation(numbering: n => "(8.4)")
 $ & b_p gt.eq 0 \, #h(2em) b_p = 1 med upright("if ") n_p = 0 \, #h(2em) b_p lt.eq C \( 1 + n_p \)^C \,\
 & bb(P)_p \( n_p gt.eq j \) lt.eq C p^(- j) quad \( j gt.eq 1 \) \, #h(2em) theta.alt_p := bb(P)_p \( n_p gt.eq 1 \) lt.eq C \/ p \, quad theta.alt_p lt.eq 1 / 2 . $ <eq:sieve-local-weight>]

The event ${ n_p gt.eq j }$ and the function $b_p upright(bold(1))_({ n_p = j })$ are determined by the two integral coordinates modulo $p^(C \( j + 1 \))$ for every integer $j gt.eq 1$. They have extensions defined by congruence classes on the whole local coset, agreeing with their values at every global point. A prime with $n_p \( z \) gt.eq 1$ will be called active at $z$. In particular,

#[#set math.equation(numbering: n => "(8.5)")
 $ bb(E)_p b_p gt.eq 1 - theta.alt_p gt.eq 1 / 2 . $ <eq:sieve-mean-lower>]

Lemma 27 places the support of $nu_phi.alt$ in the trace-$m$ coset of $\( C_F^sharp \)^or$. On this support all $n_p \( z \)$, $p in.not S$, are finite. The lemma’s norm and depth conclusions bound the product of the depth factors by $O \( X^84 \)$ in our fixed bounded real region. Thus, for a fixed $B > 84$ and all sufficiently large $X$,

#[#set math.equation(numbering: n => "(8.6)")
 $ product_(p in.not S) p^(n_p \( z \)) lt.eq X^B #h(2em) #scale(x: 120%, y: 120%)[\(] nu_phi.alt \( { z } \) > 0 #scale(x: 120%, y: 120%)[\)] . $ <eq:sieve-depth-product>]

Two consequences will be used repeatedly. There is a fixed $A_0 > 1$ such that $b_p \( z \) lt.eq A_0^(n_p \( z \))$. This follows from Equation (8.4) for $n_p gt.eq 1$, since $sup_(j gt.eq 1) \( C \( 1 + j \)^C \)^(1 \/ j) < oo$, and from $b_p = 1$ at depth zero. Also, with

$ cal(W) \( z \) = product_(p in.not S) b_p \( z \) \, $

the product is finite on the support of $nu_phi.alt$ and satisfies

#[#set math.equation(numbering: n => "(8.7)")
 $ cal(W) \( z \) lt.double_epsilon.alt X^epsilon.alt #h(2em) \( epsilon.alt > 0 \) . $ <eq:sieve-pointwise-weight>]

Indeed, for any $t > 0$, the inequality $C \( 1 + j \)^C lt.eq p^(t j)$ holds for all $j gt.eq 1$ once $p$ is sufficiently large. For each of the remaining finitely many primes it holds with a constant factor independent of $j$. Multiplying these inequalities and using Equation (8.6), with $t = epsilon.alt \/ B$, proves Equation (8.7). All constants here are uniform in the arithmetic data and in the permitted boxes.

#thm([Proposition 8.2.])[
  (Weighted averaging).  #emph[For the measure $nu_phi.alt$ in Equation (8.1), there is a fixed $delta > 0$ such that 
#[#set math.equation(numbering: n => "(8.8)")
 $ integral cal(W) \( z \) thin d nu_phi.alt \( z \) lt.double V_phi.alt product_(p lt.eq X^delta\
p in.not S) bb(E)_p b_p . $ <eq:sieve-average>]

 The choice of $delta$ and the implied constant are independent of the field, order, embedding ordering, and the permitted box location and scales. They may depend on $m$, the fixed bounded real region, and the fixed smooth box function.]
] <prop:sieve-averaging>

The proof first counts bounded products of prescribed positive depths, while requiring inactivity at any other chosen small primes. The inactivity condition preserves the factors in Equation (8.5). We then bound the contribution of two exceptional sets of points and truncate the remaining depth products within the modulus range of Lemma 38.

=== 8.2 Prescribed depths and inactive primes <prescribed-depths-and-inactive-primes>

Write $cal(P)_y = { p lt.eq y : p in.not S }$. Chebyshev’s estimate $sum_(p lt.eq y) \( log p \) \/ p lt.double log y$ and Equation (8.4) give a fixed $C_(*) gt.eq 1$ such that

$ sum_(p in cal(P)_y) theta.alt_p log p lt.eq C_(*) log y #h(2em) \( y gt.eq 2 \) . $

Choose fixed positive parameters satisfying

#[#set math.equation(numbering: n => "(8.9)")
 $ 20 \( C + 1 \) eta < theta \, #h(2em) 0 < delta < min { eta \/ 4 \, eta \/ \( 4 C_(*) \) } \, #h(2em) T_0 = X^eta \, quad Y = X^delta . $ <eq:sieve-parameters>]

Here $T_0$ truncates the squarefree Selberg divisors and is the stopping threshold for depth products, whose crossing prefixes may reach $T_0^2$; $Y$ bounds the small primes outside $S$ handled by the sieve. For every $cal(I) subset cal(P)_Y$, Mertens’ estimate and $- log \( 1 - theta.alt_p \) lt.eq 2 theta.alt_p lt.eq 2 C \/ p$ give, for a fixed $C_1$,

#[#set math.equation(numbering: n => "(8.10)")
 $ product_(p in cal(I)) \( 1 - theta.alt_p \) gt.double \( log X \)^(- C_1) . $ <eq:sieve-inactivity-lower>]

The bound is uniform in the subset $cal(I)$ and in $S$.

#thm([Lemma 8.3.])[
  (Prescribed depths and inactive primes).  #emph[Let $cal(A) \, cal(I)$ be disjoint subsets of $cal(P)_Y$, and assign an integer $j_p gt.eq 1$ to each $p in cal(A)$. Suppose that $product_(p in cal(A)) p^(j_p) lt.eq T_0^2$. Then 
#[#set math.equation(numbering: n => "(8.11)")
 $ integral product_(p in cal(A)) b_p upright(bold(1))_({ n_p = j_p }) product_(p in cal(I)) upright(bold(1))_({ n_p = 0 }) thin d nu_phi.alt lt.double V_phi.alt product_(p in cal(A)) bb(E)_p #scale(x: 120%, y: 120%)[\(] b_p upright(bold(1))_({ n_p = j_p }) #scale(x: 120%, y: 120%)[\)] product_(p in cal(I)) \( 1 - theta.alt_p \) . $ <eq:sieve-assignment>]

 The constant is uniform in the two subsets and all their assigned depths.]
] <lem:sieve-assignment>

#proof[
  We use the Selberg upper-bound square #cite(label("Selberg1947")); see also #cite(label("Koukoulopoulos2019")) Chapter 21. Its calculation is included because the relative error in Lemma 38 must preserve the assigned means. If $theta.alt_p = 0$, the activity event at $p$ is a union of residue classes of Haar measure zero, hence is empty on global points. Such a prime can be removed from $cal(I)$. For the remaining primes put
  $ theta.alt \( d \) = product_(p divides d) theta.alt_p \, #h(2em) h \( d \) = product_(p divides d) frac(theta.alt_p, 1 - theta.alt_p) $
  for squarefree $d$ supported on $cal(I)$. Both functions take value one at $d = 1$. Let $cal(D)$ be the set of those integers with $d lt.eq T_0$, and put $cal(H) = sum_(d in cal(D)) h \( d \)$.
  For coefficients $lambda_d$ supported on $cal(D)$ with $lambda_1 = 1$, the square
  $ (sum_(d in cal(D)) lambda_d product_(p divides d) upright(bold(1))_({ n_p gt.eq 1 }))^2 $
  majorizes the indicator that every prime of $cal(I)$ is inactive. Its expectation in the independent product of the local probability spaces is
  #[#set math.equation(numbering: n => "(8.12)")
   $ sum_(d \, e in cal(D)) lambda_d lambda_e theta.alt \( \[ d \, e \] \) = sum_(l in cal(D)) frac(1, h \( l \)) (sum_(d in cal(D)\
l divides d) lambda_d theta.alt \( d \))^2 . $ <eq:sieve-quadratic>]
  Here $\[ d \, e \]$ denotes the least common multiple. The identity follows by expanding the right side and using $theta.alt \( \[ d \, e \] \) = theta.alt \( d \) theta.alt \( e \) sum_(l divides \( d \, e \)) h \( l \)^(- 1)$.
  The set $cal(D)$ is closed under divisors. Finite Möbius inversion therefore permits the choice
  $ sum_(d in cal(D)\
l divides d) lambda_d theta.alt \( d \) = frac(mu_(upright("Mob")) \( l \) h \( l \), cal(H)) \, #h(2em) l in cal(D) \, $
  where $mu_(upright("Mob"))$ is the Möbius function. Explicitly,
  $ lambda_d = frac(mu_(upright("Mob")) \( d \) h \( d \), theta.alt \( d \) cal(H)) sum_(r lt.eq T_0 \/ d\
\( r \, d \) = 1\
d r in cal(D)) h \( r \) . $
  Consequently $lambda_1 = 1$, the value of Equation (8.12) is $cal(H)^(- 1)$, and
  #[#set math.equation(numbering: n => "(8.13)")
   $ \| lambda_d \| lt.eq frac(h \( d \), theta.alt \( d \)) = product_(p divides d) \( 1 - theta.alt_p \)^(- 1) lt.eq 2^(omega \( d \)) lt.eq T_0 . $ <eq:sieve-coefficients>]
  To estimate $cal(H)$, give every squarefree integer supported on $cal(I)$ probability proportional to $h \( d \)$, without the bound $d lt.eq T_0$. In this finite product distribution, prime $p$ is selected with probability $theta.alt_p$. Thus
  $ bb(E) log d = sum_(p in cal(I)) theta.alt_p log p lt.eq C_(*) log Y < 1 / 4 log T_0 . $
  Markov’s inequality shows that at least half the mass lies at $d lt.eq T_0$. It follows that
  #[#set math.equation(numbering: n => "(8.14)")
   $ cal(H) gt.eq 1 / 2 product_(p in cal(I)) \( 1 + h \( p \) \) \, #h(2em) cal(H)^(- 1) lt.eq 2 product_(p in cal(I)) \( 1 - theta.alt_p \) . $ <eq:sieve-selberg-main>]
  It remains to average this square against $nu_phi.alt$ together with the assigned weights. Write
  $ A_(cal(A)) = product_(p in cal(A)) bb(E)_p #scale(x: 120%, y: 120%)[\(] b_p upright(bold(1))_({ n_p = j_p }) #scale(x: 120%, y: 120%)[\)] . $
  The assigned weight is defined modulo
  $ product_(p in cal(A)) p^(C \( j_p + 1 \)) lt.eq (product_(p in cal(A)) p^(j_p))^(2 C) lt.eq T_0^(4 C) . $
  For a pair $d \, e in cal(D)$, its activity indicators require only the additional modulus $\[ d \, e \]^(2 C) lt.eq T_0^(4 C)$. The two prime sets are disjoint, so the total modulus is at most
  #[#set math.equation(numbering: n => "(8.15)")
   $ T_0^(8 C) lt.eq X^theta $ <eq:sieve-modulus-budget>]
  and is prime to every prime of $S$. The function before multiplication by $lambda_d lambda_e$ is nonnegative, and its residue mean is $A_(cal(A)) theta.alt \( \[ d \, e \] \)$ by the Chinese remainder theorem. Lemma 38 therefore gives the corresponding main term $V_phi.alt A_(cal(A)) theta.alt \( \[ d \, e \] \)$ and an error of absolute value at most $C V_phi.alt X^(- theta) A_(cal(A)) theta.alt \( \[ d \, e \] \)$. There are at most $T_0^2$ pairs and, by Equation (8.13), each coefficient product has absolute value at most $T_0^2$. Summing the errors absolutely costs at most
  #[#set math.equation(numbering: n => "(8.16)")
   $ C V_phi.alt A_(cal(A)) X^(- theta) T_0^4 . $ <eq:sieve-square-error>]
  This estimate keeps $A_(cal(A))$ even if it is very small. The main term is $V_phi.alt A_(cal(A)) cal(H)^(- 1)$ by Equation (8.12). Finally, $X^(- theta) T_0^4 = o \( \( log X \)^(- C_1) \)$ by Equation (8.9). Equations (8.10) and (8.14) absorb Equation (8.16) and prove the lemma. ◻
]

=== 8.3 Truncating and summing the depths <truncating-and-summing-the-depths>

#proof[
  Put $P_Y = product_(p in cal(P)_Y) bb(E)_p b_p$. Equations (8.5) and (8.10) imply
  #[#set math.equation(numbering: n => "(8.17)")
   $ P_Y gt.double \( log X \)^(- C_1) . $ <eq:sieve-product-lower>]
  First observe that primes exceeding $Y$ cost only a fixed factor. Equations (8.6) and (8.7), together with $b_p lt.eq A_0^(n_p)$, give
  #[#set math.equation(numbering: n => "(8.18)")
   $ product_(p > Y\
p in.not S) b_p \( z \) lt.eq A_0^(sum_(p > Y \, med p in.not S) n_p \( z \)) lt.eq exp \( B log A_0 \/ delta \) . $ <eq:sieve-large-primes>]
  Consider the points for which $product_(p in cal(P)_Y) p^(n_p \( z \)) lt.eq T_0$. Assign all their active primes in $cal(P)_Y$ and require inactivity at the other primes in $cal(P)_Y$. These assignments satisfy Lemma 40. After applying it, we may enlarge the sum of its nonnegative upper bounds by allowing every subset and every positive depth. The resulting product is
  $ V_phi.alt product_(p in cal(P)_Y) (1 - theta.alt_p + sum_(j gt.eq 1) bb(E)_p \( b_p upright(bold(1))_({ n_p = j }) \)) = V_phi.alt P_Y . $
  Together with Equation (8.18), this bounds the contribution from these points.
  For a remaining point, the product through $cal(P)_Y$ exceeds $T_0$. Order its active primes in $cal(P)_Y$ increasingly and stop at the first prefix whose product exceeds $T_0$. If every individual factor $p^(n_p \( z \))$ for $p in cal(P)_Y$ is at most $T_0$, the prefix has product in $\( T_0 \, T_0^2 \]$, since its preceding product and its last factor are both at most $T_0$. If also $product_(p in cal(P)_(y_0)) p^(n_p \( z \)) lt.eq T_0$, for a fixed cutoff $y_0 > 4$ to be chosen below independently of $X$, its last prime exceeds $y_0$. The next two estimates allow these restrictions at negligible weighted cost.
  First, if $p^(n_p \( z \)) > T_0$ for $p in cal(P)_Y$, then $n_p \( z \) gt.eq J_p$, where $J_p = floor.l log T_0 \/ log p floor.r + 1$. The threshold is determined modulo
  $ p^(C \( J_p + 1 \)) lt.eq T_0^C Y^(2 C) lt.eq X^theta . $
  Lemma 38 and Equation (8.4) bound its $nu_phi.alt$-measure by $O \( V_phi.alt p^(- J_p) \) = O \( V_phi.alt \/ T_0 \)$. Summing over $p in cal(P)_Y$ gives $O \( V_phi.alt Y \/ T_0 \)$. By Equation (8.7), the contribution after multiplication by $cal(W)$ is $O_epsilon.alt \( V_phi.alt X^(epsilon.alt + delta - eta) \)$. Choose $epsilon.alt < eta - delta$. This is smaller than $V_phi.alt P_Y$ by a power of $X$, in view of Equation (8.17).
  We also need the analogous removal for a fixed nonempty finite set $cal(Q)$ of primes, even though some of them may belong to the varying set $S$. Put $N = \| cal(Q) \|$. If $product_(p in cal(Q) \\ S) p^(n_p \( z \)) > T_0$, some prime in $cal(Q) \\ S$ has $p^(n_p \( z \)) > T_0^(1 \/ N)$. Put $J_(p \, cal(Q)) = floor.l log T_0 \/ \( N log p \) floor.r + 1$. The event $n_p gt.eq J_(p \, cal(Q))$ is defined modulo at most $T_0^(C \/ N) p^(2 C) lt.eq X^theta$ for large $X$, and its local probability is at most $C p^(- J_(p \, cal(Q))) lt.eq C T_0^(- 1 \/ N)$. Lemma 38 therefore bounds the measure of the union by $O_(cal(Q)) \( V_phi.alt T_0^(- 1 \/ N) \)$. After multiplication by Equation (8.7) with $epsilon.alt < eta \/ N$, its weighted contribution again saves a power of $X$ relative to $V_phi.alt$. If $cal(Q) \\ S$ is empty the event is empty. Thus this removal is uniform in the possible intersections of $cal(Q)$ with $S$.
  Choose a fixed $M_0 > 0$ and then a fixed $y_0 > 4$ such that
  #[#set math.equation(numbering: n => "(8.19)")
   $ eta M_0 > 2 B log A_0 + 1 \, #h(2em) M_0 \/ log y_0 < 1 / 4 . $ <eq:sieve-crossing-parameters>]
  Apply the finite-set removal with $cal(Q) = { p : p lt.eq y_0 }$. These choices precede the choice of the small $epsilon.alt$ used in that removal, and all are independent of $X$.
  The retained first-crossing prefixes therefore have product in $\( T_0 \, T_0^2 \]$ and last prime greater than $y_0$. Group these assignments by the interval containing their last prime:
  #[#set math.equation(numbering: n => "(8.20)")
   $ sqrt(y) < p lt.eq y \, #h(2em) y = Y^(1 \/ 2^i) \, quad i = 0 \, 1 \, 2 \, dots.h . $ <eq:sieve-buckets>]
  Only groups with $y > y_0$ occur. Every unassigned active prime is greater than the last assigned prime and hence greater than $sqrt(y)$. The total weight of those primes, including primes beyond $Y$, is therefore at most
  #[#set math.equation(numbering: n => "(8.21)")
   $ exp (frac(2 B log A_0, log y) log X) . $ <eq:sieve-unassigned>]
  For each assignment in the group, require inactivity at its unassigned primes in $cal(P)_(sqrt(y))$ and apply Lemma 40. We use Rankin’s power majorant #cite(label("Rankin1938")): since the assigned product exceeds $T_0$, its upper bound can be multiplied by
  $ T_0^(- s) product_(upright("assigned ") p) p^(s j_p) gt.eq 1 \, #h(2em) s = M_0 \/ log y . $
  Now enlarge the sum of these nonnegative upper bounds to all subsets and all positive depths through $y$. This enlarges only a numerical sum after the lemma has been applied to the genuine prefixes; it invokes no residue estimate for the newly admitted products above $T_0^2$.
  For $p in cal(P)_(sqrt(y))$, the option of no assignment has weight $1 - theta.alt_p$ and the assigned options have total weight $sum_(j gt.eq 1) bb(E)_p \( b_p upright(bold(1))_({ n_p = j }) \) p^(s j)$. Their sum is $bb(E)_p \( b_p p^(s n_p) \)$. For $sqrt(y) < p lt.eq y$ outside $S$, inactivity was not imposed, so the option of no assignment has weight one. The total there is $bb(E)_p \( b_p p^(s n_p) \) + theta.alt_p$. Thus the group’s contribution is at most
  #[#set math.equation(numbering: n => "(8.22)")
   $ C V_phi.alt T_0^(- s) exp (frac(2 B log A_0, log y) log X) product_(p in cal(P)_(sqrt(y))) bb(E)_p \( b_p p^(s n_p) \) product_(sqrt(y) < p lt.eq y\
p in.not S) #scale(x: 120%, y: 120%)[\(] bb(E)_p \( b_p p^(s n_p) \) + theta.alt_p #scale(x: 120%, y: 120%)[\)] . $ <eq:sieve-bucket-bound>]
  We estimate these local moments uniformly for $y > y_0$. By Equation (8.19), $s < 1 \/ 4$. The total contribution of depths $j gt.eq 2$ to $bb(E)_p \( b_p p^(s n_p) \)$ is at most
  $ C^2 sum_(j gt.eq 2) \( 1 + j \)^C p^(- \( 1 - s \) j) lt.double_C p^(- 3 \/ 2) . $
  At depth one, the increase over $bb(E)_p b_p$ is bounded by
  $ C' / p \( p^s - 1 \) lt.double_(M_0) frac(log p, p log y) #h(2em) \( p lt.eq y \) \, $
  because $0 lt.eq s log p lt.eq M_0$. Chebyshev’s estimate shows that these increases have bounded sum over $p lt.eq y$. Mertens’ estimate also gives $sum_(sqrt(y) < p lt.eq y\
p in.not S) theta.alt_p lt.double 1$. Since $bb(E)_p b_p gt.eq 1 \/ 2$, comparison of the products in Equation (8.22) with their base means gives
  $ product_(p in cal(P)_(sqrt(y))) bb(E)_p \( b_p p^(s n_p) \) product_(sqrt(y) < p lt.eq y\
p in.not S) #scale(x: 120%, y: 120%)[\(] bb(E)_p \( b_p p^(s n_p) \) + theta.alt_p #scale(x: 120%, y: 120%)[\)] lt.double_(M_0) product_(p in cal(P)_y) bb(E)_p b_p . $
  For a fixed $C_2$, a final use of Equation (8.5) and Mertens’ estimate yields
  $ product_(p in cal(P)_y) bb(E)_p b_p lt.eq P_Y product_(y < p lt.eq Y\
p in.not S) \( 1 - theta.alt_p \)^(- 1) lt.double P_Y (frac(log Y, log y))^(C_2) . $
  By Equation (8.19), the bound for the group in Equation (8.22) is consequently at most
  $ C_(M_0) V_phi.alt P_Y exp (- frac(log X, log y)) (frac(log Y, log y))^(C_2) . $
  For the values of $y$ in Equation (8.20), its sum is bounded by
  $ C_(M_0) V_phi.alt P_Y sum_(i gt.eq 0) exp \( - 2^i \/ delta \) thin 2^(i C_2) lt.double V_phi.alt P_Y . $
  Together with the small-product part and the two discarded sets, this proves Equation (8.8). ◻
]

=== 8.4 The planar exterior count <the-planar-exterior-count>

#proof[
  Fix the nonzero trace and bounded region in that theorem. Let $cal(R)$ be any of its rectangles, in the specified two partition coordinates. Choose an allowed smooth function $phi.alt$ that majorizes $upright(bold(1))_(cal(R))$, with its two scales equal to the side lengths of $cal(R)$. Its support lies in a fixed enlargement of the bounded region and
  $ A_phi.alt asymp "area" \( cal(R) \) . $
  The constants are uniform over the positions, side lengths, and aspect ratios of the rectangles. Proposition 24 and Proposition 39 give
  #[#set math.equation(numbering: n => "(8.23)")
   $ sum_("Tr" z = m\
z in cal(R)) M \( z \) lt.double sqrt(D) thin A_phi.alt product_(p in S) \( 1 - p^(- 1) \) Z_p product_(p in cal(P)_Y) bb(E)_p b_p \, #h(2em) Z_p = product_(frak(p) divides p\
frak(p) subset R) \( 1 - "N" \( frak(p) \)^(- 1) \)^(- 1) . $ <eq:sieve-before-euler>]
  Here $product_(p in S) \| D \|_p^(- 1 \/ 2) = sqrt(D)$, because $S$ contains every prime divisor of $D$, and Equation (8.2) absorbed the trace densities. The restriction to integral points outside $S$ in the multiplicity proposition agrees with the support of $nu_phi.alt$.
  The exact unramified mean in Lemma 23 is
  $ bb(E)_p b_p = \( 1 - p^(- 1) \) \( 1 - p^(- 3) \) Z_p #h(2em) \( p in.not S \) . $
  Since $1 - p^(- 3) lt.eq 1$, the two Euler products on the right of Equation (8.23) are at most the product of $\( 1 - p^(- 1) \) Z_p$ over $p in S union cal(P)_Y$. Ideal factorization in the degree-four maximal order gives, uniformly also at ramified primes,
  $ log Z_p = frac(a_K \( p \), p) + O \( p^(- 2) \) . $
  Thus
  #[#set math.equation(numbering: n => "(8.24)")
   $ product_(p in S) \( 1 - p^(- 1) \) Z_p product_(p in cal(P)_Y) bb(E)_p b_p lt.double exp (sum_(p in S med upright("or") med p lt.eq Y) frac(a_K \( p \) - 1, p)) . $ <eq:sieve-euler>]
  For fixed $m$, the radical of $S$ is polynomial in $X$. Choose a fixed $c gt.eq 1 \/ 2$ large enough that, for all sufficiently large $X$, every prime in $S$ and every prime at most $Y$ is at most $Z = X^c$. Since $a_K \( p \) gt.eq 0$, the exponent in Equation (8.24) is at most
  $ sum_(p lt.eq Z) frac(a_K \( p \), p) - sum_(p lt.eq Y) 1 / p . $
  We have $Z gt.eq D^(1 \/ 4)$ because $X = q sqrt(D) gt.eq sqrt(D)$. Equation (3.14) and Mertens’ estimate now give
  $ exp (sum_(p in S med upright("or") med p lt.eq Y) frac(a_K \( p \) - 1, p)) lt.double frac(kappa log Z, log Y) = c / delta thin kappa . $
  This also applies when $D$ remains bounded and $q$ tends to infinity, by the stated uniform range of Lemma 6. Substitution in Equation (8.23) proves
  $ sum_("Tr" z = m\
z in cal(R)) M \( z \) lt.double kappa sqrt(D) thin "area" \( cal(R) \) . $
  The only box-dependent quantity in the proof is $A_phi.alt$, which is comparable to the area with a fixed constant. All other estimates are uniform over the box translations and the two scales between $X^(- tau)$ and the fixed upper bounds. The local multiplicity majorant has the same constant for every chosen ideal representative system, and its right side is independent of that choice. Thus the bound is uniform in the representative system as well. This proves the precise uniformity asserted in Theorem 19. ◻
]

== 9 Exclusion of the obstruction <sec:conclusion>

We apply Theorem 19 to the exterior planes in Proposition 17. Four small exterior coordinates give two small signed products, whose range in the trace plane has area of order $r^4$. The integral along a diagonal orbit contributes logarithmic factors; we will show that they are summable at this scale.

=== 9.1 The exterior vector integral <the-exterior-vector-integral>

Fix a partition $b_1 = i j \| k l$ of ${ 1 \, 2 \, 3 \, 4 }$, and denote the other two partitions by $b_2 \, b_3$. For $m in bb(Z) \\ { 0 }$, $L > 1$, and $0 < r < 1$, define $N_(m \, L \, r) \( Lambda \)$ to be the number of $v in and.big^2 Lambda$ satisfying

#[#set math.equation(numbering: n => "(9.1)")
 $ Q \( v \) = m \, #h(2em) \| v_(i j) \| \, \| v_(k l) \| < L \, #h(2em) \| v_(a b) \| < r quad \( a b eq.not i j \, k l \) . $ <eq:end-vector-box>]

This count is finite because $and.big^2 Lambda$ is a lattice in $and.big^2 bb(R)^4$ and the specified box is bounded. To see that it is Borel, choose a local continuous determinant-one basis around a lattice with $k$ witnesses and keep their distinct integer exterior labels fixed. They remain distinct, and their $Q$-values remain $m$ because $Q \( \( and.big^2 g \) w \) = det \( g \) Q \( w \)$. Their coordinates vary continuously, so the strict inequalities persist in a neighborhood. Thus ${ N_(m \, L \, r) gt.eq k }$ is open for every integer $k gt.eq 1$. Recall that the three real embeddings of $F$ are indexed by $cal(B)$. For a nonzero $z in F$, set

#[#set math.equation(numbering: n => "(9.2)")
 $ cal(L)_(L \, r) \( z \) = log_(+) frac(L^2, \| z_(b_1) \|) thin log_(+) frac(r^2, \| z_(b_2) \|) thin log_(+) frac(r^2, \| z_(b_3) \|) . $ <eq:end-logarithms>]

All three conjugates of a nonzero element of the field $F$ are nonzero, so the expression is defined.

In Equation (5.8), $M \( z \)$ sums over the fixed maximal-order ideal representatives $I$ and the $U^(+)$-orbits of nonzero raw $w in and.big_(bb(Z))^2 I$ with $Psi \( w \) \/ "N" I = z$. Each orbit has weight $product_p P_p \( I \, w \)$, the average membership of $w$ in $and.big_(bb(Z))^2 L'$ over the local labels $L' in cal(L)_(cal(O)) \( I \)$.

#thm([Lemma 9.1.])[
  (Exterior unfolding).  #emph[For every primitive totally real quartic field $K$, order $cal(O)$, and ordering of its real embeddings, let $d_U = \[ U : U^(+) \]$. With the preceding choices of $b_1 \, m \, L \, r$, use the same fixed system of maximal-order ideal representatives in the packet model and in the definition of $M$. Then 
#[#set math.equation(numbering: n => "(9.3)")
 $ integral_(X_4) N_(m \, L \, r) \( Lambda \) thin d mu_(cal(O) \, sigma) \( Lambda \) = frac(4, d_U sqrt(D) thin kappa) sum_(t in { m \, - m }) sum_(z in F\
"Tr" z = t) M \( z \) cal(L)_(L \, r) \( z \) . $ <eq:end-unfold>]

 The index satisfies $2 lt.eq d_U lt.eq 16$.]
] <lem:end-unfold>

#proof[
  We use the packet integral in Equation (2.9). For its maximal-order ideal representative $I$ and local label $L' in cal(L)_(cal(O)) \( I \)$, the normalized lattice at the sign vector $s = \( s_1 \, dots.h \, s_4 \) in { plus.minus 1 }^4$ and the logarithmic parameter $\( u_1 \, dots.h \, u_4 \) in bb(R)^4$ with $u_1 + dots.h.c + u_4 = 0$ is
  $ \( X "N" I \)^(- 1 \/ 4) sigma \( L' \) "diag" \( s_1 e^(u_1) \, dots.h \, s_4 e^(u_4) \) . $
  For a raw vector $w in and.big^2 I$, its normalized exterior coordinates are
  $ y_(a b) = \( X "N" I \)^(- 1 \/ 2) s_a s_b e^(u_a + u_b) w_(a b) . $
  If $z = Psi \( w \) \/ "N" I$ and $epsilon.alt \( s \) = product_a s_a$, then Equation (5.6) gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ \( y_12 y_34 \, - y_13 y_24 \, y_14 y_23 \) = epsilon.alt \( s \) z \, #h(2em) Q \( y \) = epsilon.alt \( s \) "Tr" z . $ <eq:end-signed-products>]
  There are eight sign vectors for each value of $epsilon.alt \( s \)$.
  The kernel of the signature map on $U$ is $U^(+)$, so $d_U = \| "sgn" U \| lt.eq 16$; the signature of $- 1$ gives $d_U gt.eq 2$. After averaging over $L'$, the vector-count integrand in Equation (2.9) is invariant under $v mapsto sigma \( e \) v$ for $e in U$, since $L' mapsto e L'$ permutes the labels and transports their exterior lattices. Replacing the fundamental domain for $U$ in $T_oo$ by one for $U^(+)$ therefore multiplies its integral by $d_U$, which we compensate by division by $d_U$. The latter domain consists of all sign components, with a fundamental domain for the positive unit logarithms in each component.
  For a given raw $w$, its average membership over the local labels is
  $ 1 / N_(cal(O)) sum_(L' in cal(L)_(cal(O)) \( I \)) upright(bold(1))_({ w in and.big^2 L' }) = product_p P_p \( I \, w \) \, $
  the weight in Equation (5.8). This weight is constant on its $U^(+)$-orbit. That action is free: every embedding coordinate of the nonzero raw vector $w in and.big_(bb(Z))^2 I subset and.big_(bb(Q))^2 K$ is nonzero by Lemma 18. A stabilizing positive unit $e$ would therefore satisfy $sigma_a \( e \) sigma_b \( e \) = 1$ for every pair $a b$, forcing $e = 1$. Summing the translates of each raw vector thus unfolds the positive-unit fundamental domain to all of the three-dimensional space $u_4 = - u_1 - u_2 - u_3$, with multiplicity one. The packet normalization remaining after the uniform label average is $h_K "vol" \( cal(F)_U \) = sqrt(D) thin kappa$ by Equation (2.6). Hence this unfolding has coefficient $1 \/ \( d_U sqrt(D) thin kappa \)$ before the sign sum and the integral in $u$. All the sums and integrals are nonnegative, so Tonelli’s theorem applies.
  Choose one coordinate from each opposite pair. The logarithms of the absolute values of these coordinates are affine functions of $\( u_1 \, u_2 \, u_3 \)$. For the choices $12 \, 13 \, 14$, their linear parts are
  $ u_1 + u_2 \, #h(2em) u_1 + u_3 \, #h(2em) - u_2 - u_3 . $
  Their matrix has determinant of absolute value two. Choosing the opposite member of a pair negates its row, and ordering the partitions only permutes rows, so the same absolute determinant holds for every choice. If the two entries in an opposite pair have product of absolute value $\| z_b \|$ and both must be less than $h > 0$ in absolute value, the logarithm of the chosen entry lies in an interval of length $log_(+) \( h^2 \/ \| z_b \| \)$. Therefore, for a raw vector with the required trace after the sign change, its integral over $\( u_1 \, u_2 \, u_3 \)$ is $1 / 2 cal(L)_(L \, r) \( z \)$.
  The $U^(+)$-orbit sum of the weights, including the sum over $I$, is exactly $M \( z \)$ by Equation (5.8). Equation (9.4) allows raw trace $m$ for the eight positive determinant signs and raw trace $- m$ for the other eight. Multiplying eight by the Jacobian factor $1 \/ 2$ gives the factor $4$ in Equation (9.3). The unit $- 1$, although it acts trivially on exterior vectors, has already been accounted for in the index $d_U$. ◻
]

#thm([Proposition 9.2.])[
  (Small exterior boxes).  #emph[For every fixed $m in bb(Z) \\ { 0 }$ and $L > 1$, there are constants $r_0 > 0$ and $C_(m \, L) > 0$ with the following property. For every sequence of the fields, orders, and embedding orderings in Theorem 1 with $X_i arrow.r oo$, and every fixed $0 < r < r_0$, 
#[#set math.equation(numbering: n => "(9.5)")
 $ limsup_(i arrow.r oo) integral_(X_4) N_(m \, L \, r) \( Lambda \) thin d mu_(cal(O)_i \, sigma_i) \( Lambda \) lt.eq C_(m \, L) r^4 . $ <eq:end-tube>]

 The constants are independent of the sequence, of $r$, and of the choice of partition $b_1$.]
] <prop:end-tube>

#proof[
  Take $r_0 < 1$ so small that $2 r_0^2 lt.eq \| m \| \/ 2$. For each $t in { m \, - m }$, fix the coordinate rectangle
  $ Omega_t = { z in cal(H)_t : \| z_(b_2) \| \, \| z_(b_3) \| lt.eq 1 } . $
  Now let $0 < r < r_0$. In the trace-$t$ sum in Equation (9.3), only points with $\| z_(b_2) \| \, \| z_(b_3) \| < r^2$ contribute, and these points lie in $Omega_t$. Since their three coordinates have sum $t$,
  $ \| z_(b_1) \| gt.eq \| m \| - 2 r^2 gt.eq \| m \| \/ 2 . $
  Thus the first logarithm in Equation (9.2) is bounded in terms of $m \, L$ on the contributing points, independently of $r$. For every $z in Omega_t$ with $M \( z \) > 0$, Lemma 27 gives $\| z_b \| gt.double_(Omega_t) X^(- 84)$ for each $b$. Hence the last two logarithms in Equation (9.2) are $O \( log X \)$, uniformly for $0 < r < 1$.
  We first remove the points in the two strips
  #[#set math.equation(numbering: n => "(9.6)")
   $ \| z_(b_2) \| lt.eq 4 X^(- tau) quad upright("or") quad \| z_(b_3) \| lt.eq 4 X^(- tau) . $ <eq:end-strips>]
  For large $X$, each strip within $Omega_t$ is covered by a rectangle of width $8 X^(- tau)$ and length $2$ in the coordinates $z_(b_2) \, z_(b_3)$, and these rectangles lie in $Omega_t$. Both sides meet the minimum length in Theorem 19 for large $X$. That theorem bounds the sum of $M \( z \)$ over their union, divided by $sqrt(D) thin kappa$, by $O \( X^(- tau) \)$. The logarithmic bounds just proved show that their contribution to Equation (9.3) is
  $ O_(m \, L) #scale(x: 120%, y: 120%)[\(] X^(- tau) \( log X \)^2 #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  The use of the rectangle estimate here controls the weighted mass directly; it does not require a pointwise bound for $M \( z \)$.
  For the remaining points, separate the signs of $z_(b_2) \, z_(b_3)$ and use the dyadic intervals
  $ r^2 2^(- a - 1) < \| z_(b_2) \| lt.eq r^2 2^(- a) \, #h(2em) r^2 2^(- b - 1) < \| z_(b_3) \| lt.eq r^2 2^(- b) \, #h(2em) a \, b gt.eq 0 . $
  Each signed dyadic rectangle lies in $Omega_t$. Each interval has width half its upper endpoint. If it meets $\| z_(b_j) \| > 4 X^(- tau)$, that width exceeds $2 X^(- tau)$. Hence every dyadic rectangle meeting the remaining region satisfies the minimum side lengths of Theorem 19; any boundary rectangle may be included in full. Its area is $O \( r^4 2^(- a - b) \)$, while the last two factors of Equation (9.2) are at most $\( a + 1 \) log 2$ and $\( b + 1 \) log 2$. Theorem 19 gives
  $ frac(1, sqrt(D) thin kappa) sum_(z upright(" in that rectangle")) M \( z \) lt.double_(m \, L) r^4 2^(- a - b) . $
  The sum over the four choices of signs and over all $a \, b$ is therefore at most
  $ C_(m \, L) r^4 sum_(a \, b gt.eq 0) \( a + 1 \) \( b + 1 \) 2^(- a - b) lt.double_(m \, L) r^4 . $
  All constants are independent of $r$: the rectangles $Omega_t$ and the uniform rectangle constant were fixed before choosing $r$. The two strips tend to zero for each fixed $r$, and $4 \/ d_U lt.eq 2$ in Equation (9.3). These observations prove Equation (9.5) for both traces and all three partitions. ◻
]

=== 9.2 Identification of every probability limit <identification-of-every-probability-limit>

#proof[
  For the sequence in that theorem, $X_i = sqrt(\| "Disc" \( cal(O)_i \) \|)$ tends to infinity. By Proposition 9, the packet probabilities are tight, and every subsequence has a further weakly convergent subsequence with an $A_4$-invariant probability limit $mu$. Proposition 11 gives the local ball bound required by Corollary 14. Hence almost every component in the $A_4$-ergodic decomposition of $mu$ has positive entropy for a diagonal flow. Proposition 17 reduces the identification of these components to the exclusion of its three exterior-plane events.
  Fix a partition $b_1$, a nonzero integer $m$, and $L > 1$. The event
  $ E_(m \, L \, r) = { Lambda in X_4 : N_(m \, L \, r) \( Lambda \) gt.eq 1 } $
  is open by the observation following Equation (9.1).
  The open-set inequality for weak convergence and Proposition 42 now give, along the convergent subsequence,
  $ mu \( E_(m \, L \, r) \) lt.eq liminf_i mu_(cal(O)_i \, sigma_i) \( E_(m \, L \, r) \) lt.eq limsup_i integral N_(m \, L \, r) thin d mu_(cal(O)_i \, sigma_i) lt.eq C_(m \, L) r^4 $
  for every sufficiently small fixed $r > 0$. In particular,
  $ mu (⋂_(n gt.eq 2) E_(m \, L \, 1 \/ n)) lt.eq inf_(n gt.eq 2\
1 \/ n < r_0) C_(m \, L) n^(- 4) = 0 . $
  Every vector in one of the obstruction planes with $Q eq.not 0$ has a nonzero integer $Q$-value by Equation (4.7), and its two entries are less than some integer $L gt.eq 2$ in absolute value. An exact witness belongs to $E_(m \, L \, 1 \/ n)$ for every $n gt.eq 2$. Thus the Borel event in Equation (4.9) satisfies
  $ cal(E)_(b_1) subset union.big_(m in bb(Z) \\ { 0 }) med union.big_(L in bb(Z)\
L gt.eq 2) ⋂_(n gt.eq 2) E_(m \, L \, 1 \/ n) . $
  The right side is a countable union of null sets, so $mu \( cal(E)_(b_1) \) = 0$. The same argument applies to all three partitions. Integrating these null events over the ergodic decomposition shows that the proper alternative in Proposition 17 has zero total component weight. Almost every component is therefore $m_4$, and hence $mu = m_4$.
  Every subsequential probability limit is now identified as $m_4$. Tightness implies that the entire sequence converges weakly to $m_4$, which gives the asserted convergence against every $f in C_c \( X_4 \)$. The same tightness statement supplies, for each $epsilon.alt > 0$, one compact set carrying at least $1 - epsilon.alt$ of every sufficiently late packet probability. This is the required no-escape assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
