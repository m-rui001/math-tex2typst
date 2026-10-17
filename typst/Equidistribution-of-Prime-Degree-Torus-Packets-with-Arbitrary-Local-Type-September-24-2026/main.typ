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

#align(center)[#text(size: 16pt, weight: "bold")[Equidistribution of Prime-Degree Torus Packets \
with Arbitrary Local Type]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

Compact diagonal orbits in the space of unimodular lattices encode ideal classes and units of totally real number fields. The higher-dimensional Duke equidistribution problem asks whether arithmetically complete families of these orbits become uniformly distributed as their discriminants grow. The grouping matters: one local homothety type specifies a complete packet, whereas a multiplier order alone can combine several packets. We prove the prime-degree packet statement for every such local type.

Fix a prime $n gt.eq 5$, and write

$ X_n = "SL"_n \( bb(Z) \) without "SL"_n \( bb(R) \) \, #h(2em) A_n = { "diag" \( e^(u_1) \, dots.h \, e^(u_n) \) : sum_j u_j = 0 } . $

We regard $X_n$ as the space of covolume-one row lattices, with the right action of $A_n$, and let $m_n$ be its $"SL"_n \( bb(R) \)$-invariant probability measure. Haar measure on $A_n$ is $d u_1 dots.h.c d u_(n - 1)$ in the displayed logarithmic coordinates.

Let $K$ be a totally real field of degree $n$, let $sigma = \( sigma_1 \, dots.h \, sigma_n \)$ order its real embeddings, and let $M subset K$ be a free rank-$n$ $bb(Z)$-submodule spanning $K$ over $bb(Q)$. We call such an $M$ a full lattice. Its multiplier order and discriminant are

$ cal(O) \( M \) = { alpha in K : alpha M subset M } \, #h(2em) D \( M \) = \| "Disc" \( K \) \| \[ cal(O)_K : cal(O) \( M \) \]^2 . $

Two such lattices are #emph[locally homothetic] if $M'_ell = c_ell M_ell$ for every rational prime $ell$, where $c_ell in \( K ⊗_(bb(Q)) bb(Q)_ell \)^times$ and subscripts denote completion. Choose representatives $M'$ for their $K^times$-homothety classes within the local type of $M$, and normalize

$ Lambda_(M' \, sigma) = "covol" \( sigma \( M' \) \)^(- 1 \/ n) sigma \( M' \) . $

The packet $cal(P)_(K \, M \, sigma)$ consists of the distinct orbits $Lambda_(M' \, sigma) w A_n$, with

$ w in W_n = { "diag" \( epsilon.alt_1 \, dots.h \, epsilon.alt_n \) : epsilon.alt_j in { plus.minus 1 } \, med product_j epsilon.alt_j = 1 } . $

These orbits are compact and their number is finite; the parametrization in Section 2 also proves these facts. For an orbit $O$, let $nu_O$ be its invariant probability and $"vol" \( O \)$ its volume for the specified Haar measure. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ mu_(K \, M \, sigma) = frac(sum_(O in cal(P)_(K \, M \, sigma)) "vol" \( O \) nu_O, sum_(O in cal(P)_(K \, M \, sigma)) "vol" \( O \)) . $ <eq:packet-probability>]

#thm([Theorem 1.1.])[
  #emph[For every fixed prime $n gt.eq 5$ and every sequence $\( K_i \, M_i \, sigma_i \)$ as above with $D \( M_i \) arrow.r oo$, 
$ mu_(K_i \, M_i \, sigma_i) arrow.r m_n . $

 The convergence is weak convergence of probability measures. In particular, it holds against every continuous compactly supported function, and no mass escapes into the cusp.]
] <thm:main>

Theorem 1 permits nonmaximal orders of unbounded index and arbitrary local module types. The field discriminants may remain bounded or grow independently of those indices. The statement is separate for each local homothety type; it makes no assertion about an individual orbit, a convergence rate, or composite degrees.

=== The maximal-order specialization <the-maximal-order-specialization>

Take $M = cal(O)_K$. Every lattice in its local type is a fractional $cal(O)_K$-ideal, and its homothety class is an ordinary ideal class. Thus the packet is obtained by embedding one representative of each ideal class, normalizing its covolume to one, and taking the distinct sign translates of its positive diagonal orbit. For every sequence of totally real fields of degree $n$ with $\| "Disc" \( K \) \| arrow.r oo$, the volume-weighted measures of these packets converge to $m_n$ by Theorem 1. This construction also explains why an individual ideal class is not the object being averaged.

For general $M$, the same maximal-order ideal classes remain the global parameters, but each carries a finite set of local module choices. Proposition 11 in Appendix 7 identifies this construction with the pushforward of adelic torus Haar probability, independently of the rational basis and finite-lattice presentation. The theorem therefore includes all these presentations of the maximal-order specialization, as well as arbitrary noninvertible modules over nonmaximal orders.

=== Context and prior work <context-and-prior-work>

Linnik’s ergodic approach connected arithmetic distribution problems with dynamics #cite(label("Linnik1968")). Duke proved equidistribution of the length-weighted closed geodesics associated with fundamental real-quadratic discriminants on the modular surface #cite(label("Duke1988")) Theorem 1. In higher rank, Einsiedler, Lindenstrauss, Michel, and Venkatesh developed the relationship between arithmetic separation and entropy for periodic torus orbits #cite(label("ELMV2009")). Their cubic equidistribution theorem combines subconvexity, local analysis, and measure classification #cite(label("ELMV2011")) Theorem 1.4. Their packet construction already distinguishes local homothety from the coarser condition of having the same multiplier order #cite(label("ELMV2011")) Section 5.5.

The higher-prime-degree extension described in #cite(label("ELMV2011")) Section 1.6.3 is conditional on subconvexity. Khayutin subsequently obtained entropy bounds using arithmetic separation and Galois invariants, under maximal-order and two-transitivity hypotheses #cite(label("Khayutin2019")) Theorem 1.1. Lemke Oliver, Thorner, and Zaman proved equidistribution for sequences of orders in totally real fields of each fixed prime degree at least five, outside a small exceptional family of fields #cite(label("LOTZ2024")) Theorem 2.3. Their result allows nonmaximal orders; the exceptional family has at most $O_(n \, epsilon) \( X^epsilon \)$ fields of discriminant at most $X$. Theorem 1 treats every field and every full-lattice local type in the stated prime degrees. It gives an unconditional affirmative answer to this packet form of the higher-dimensional Duke problem, including sequences in a fixed field with increasing order index.

=== The arithmetic ingredient <the-arithmetic-ingredient>

The proof follows the counting-to-rigidity strategy of Einsiedler–Lindenstrauss–Michel–Venkatesh #cite(label("ELMV2011")) Section 2.7.1: packet averages of lattice-vector counts control the cusp and small ordinary balls, and these bounds feed into positive-entropy rigidity. Their cubic argument obtains asymptotics for these averages using global and local subconvexity #cite(label("ELMV2011")) Sections 2.7.2–2.7.3. For the same rigidity step, we obtain the needed upper bounds by retaining the Dedekind-zeta residue in the unfolded ideal count. Stark’s exceptional-zero descent #cite(label("Stark1974")), together with Shiu’s theorem in Pollack’s uniform formulation #cite(label("Shiu1980")) #cite(label("Pollack2020")), supplies the required bounds without a subconvexity hypothesis. Odd degree excludes the quadratic subfields that occur in Stark’s exceptional-zero alternative.

For an arbitrary prescribed local type, we keep maximal-order ideal counting but insert local containment probabilities: at each prime, the weight records the probability that a vector belongs to a randomly chosen unit translate of the prescribed module. The essential estimate is a small positive moment of the local norm, uniform over full local modules whose maximal-order span is the full ring. Its proof uses a unit in each component projection, not independence of the components or invertibility of the module. The unit-mass argument in #cite(label("ELMV2011")) Lemma 9.7 is an antecedent; here we prove the exact shell normalization and the positive moment for arbitrary local modules with this full-span condition.

The exact unfolding belongs to the classical Hecke method, presented in the packet setting in #cite(label("ELMV2011")) Section 10. The dynamical conclusion uses the two-sided tube criterion of #cite(label("ELMV2009")) Corollary 3.3 and the prime-degree measure classification of Einsiedler, Katok, and Lindenstrauss #cite(label("EKL2006")) Corollary 1.4. We give the residue estimate, local-module bounds, and the passage to entropy in almost every ergodic component below.

=== Proof outline <proof-outline>

Put $R = cal(O)_K$, $D = \| "Disc" \( K \) \|$, and $q = \[ R M : M \]$. The natural counting scale is $Q = q sqrt(D)$, and $D \( M \) lt.eq Q^(2 n)$. Section 2 expresses the packet mean of a lattice-vector count as a maximal-order ideal sum with local weights. Section 3 proves an exact total-mass identity and a power-saving tail for these weights. Section 4 combines them with a residue-relative zeta estimate and Shiu’s theorem. Removing the Euler factors at primes dividing $q$ produces precisely the factor needed to cancel the local normalization.

The resulting count controls both short lattice vectors and small boxes about vectors with nonzero coordinates. Section 5 deduces tightness and an $O \( r^n \)$ bound for the mass of ordinary balls in any limit measure. Since $A_n$ has dimension $n - 1$, this bound forces positive entropy in almost every $A_n$-ergodic component. Section 6 gives this implication and applies the prime-degree measure-classification theorem. In that step it is essential to prove positive entropy for every invariant probability dominated by a finite multiple of the limit, not only for the limit itself: this rules out a positive-weight family of zero-entropy components.

== 2 The packet as a weighted ideal sum <sec:packets>

We first identify the packet measure exactly, including its signs and orbit volumes. Throughout the proof, $K$ is totally real of the fixed prime degree $n$, and

$ R = cal(O)_K \, quad E = R^times \, quad D = \| "Disc" \( K \) \| \, quad kappa_K = "Res"_(s = 1) zeta_K \( s \) . $

The absolute norm $"N" I$ of a nonzero fractional $R$-ideal is extended multiplicatively from integral ideals. Thus $"covol" \( sigma \( I \) \) = sqrt(D) thin "N" I$. We use standard ideal theory and the unit theorem #cite(label("Milne2020")) Chapters 3–5, together with the analytic class-number formula #cite(label("Sutherland2021")) Theorem 19.12. The classical packet interpretation is discussed in #cite(label("ELMV2011")) Sections 2 and 5.

=== 2.1 Saturation and local choices <saturation-and-local-choices>

Let $J_0 = R M$, $q = \[ J_0 : M \]$, and $Q = q sqrt(D)$. For a rational prime $ell$, write $\( J_0 \)_ell = j_ell R_ell$, and put $L_ell = j_ell^(- 1) M_ell$. Then

#[#set math.equation(numbering: n => "(2.1)")
 $ L_ell subset R_ell \, #h(2em) R_ell L_ell = R_ell \, #h(2em) \[ R_ell : L_ell \] = q_ell \, #h(2em) q = product_ell q_ell . $ <eq:local-normalization>]

Set $S = { ell : ell divides q }$; off $S$, $L_ell = R_ell$. Since $q J_0 subset M$, one has $q R subset cal(O) \( M \)$. Conversely, a multiplier of $M$ has an integral endomorphism matrix on $M$ and hence is an algebraic integer. It follows that

#[#set math.equation(numbering: n => "(2.2)")
 $ q R subset cal(O) \( M \) subset R \, #h(2em) D \( M \) lt.eq D q^(2 n) lt.eq Q^(2 n) . $ <eq:discriminant-scale>]

Only the last implication, $D \( M \) arrow.r oo arrow.r.double Q arrow.r oo$, will be needed.

These quantities are constant within the prescribed local type. Indeed, if $M'_ell = c_ell M_ell$, multiplication by $c_ell$ identifies $\( R M \)_ell \/ M_ell$ with $\( R M' \)_ell \/ M'_ell$. It also identifies the local multiplier orders, since multiplication in $K ⊗_(bb(Q)) bb(Q)_ell$ is commutative. The multiplier order commutes with completion: in a $bb(Z)$-basis of $M$, its defining condition is that the matrix of multiplication have integral entries, and the same condition over $bb(Z)_ell$ defines the local order. Thus $q$, $Q$, $cal(O) \( M \)$, and $D \( M \)$ are unchanged by local homothety. Different local types can nevertheless have the same multiplier order.

Choose one fractional ideal $I$ in each ordinary ideal class of $R$. Let $cal(N) \( I \)$ be the set of lattices $N$ locally homothetic to $M$ with $R N = I$. If $I_ell = i_ell R_ell$, its possible completions are exactly

#[#set math.equation(numbering: n => "(2.3)")
 $ N_ell = i_ell z_ell L_ell \, #h(2em) z_ell in R_ell^times . $ <eq:local-choices>]

Indeed, taking maximal-order spans in a local homothety forces the remaining multiplier to be a unit. Conversely, these local lattices lie between $q I_ell$ and $I_ell$ and patch uniquely by the primary decomposition of $I \/ q I$. Thus $cal(N) \( I \)$ is finite, $\[ I : N \] = q$ for all its members, and its cardinality $T = \| cal(N) \( I \) \|$ is independent of $I$. The label count $T$ need not equal the saturation index $q$. Local unit Haar probability induces uniform probability on each finite set of local choices, so the choices at different primes are independent. Every global homothety class in the packet occurs in these sets, by moving its maximal-order span to the chosen ideal-class representative.

=== 2.2 Real parameters and measure <real-parameters-and-measure>

Let

$ C = { t in \( bb(R)^times \)^n : product_j \| t_j \| = 1 } . $

Give $C$ counting measure on its $2^n$ sign components and measure $d u_1 dots.h.c d u_(n - 1)$ on the coordinates $u_j = log \| t_j \|$. The embedding of $E$ is a discrete cocompact subgroup of $C$. If $F$ is a measurable fundamental domain, the unit theorem and the totally real case of the analytic class-number formula #cite(label("Sutherland2021")) Theorem 19.12 give

#[#set math.equation(numbering: n => "(2.4)")
 $ "vol" \( F \) = 2^(n - 1) R_K \, #h(2em) h_K "vol" \( F \) = sqrt(D) thin kappa_K \, $ <eq:unit-volume>]

where $h_K$ is the ordinary class number and $R_K$ the regulator in deleted logarithmic coordinates. The factor $2^(n - 1)$ comes from the $2^n$ signs and the logarithmic kernel ${ 1 \, - 1 }$. In the class-number formula this is the factor $2^n \/ w_K$, since the roots of unity in a totally real field are exactly ${ 1 \, - 1 }$.

#thm([Lemma 2.1.])[
  #emph[The maps 
$ \( N \, t \) mapsto \( Q "N" I \)^(- 1 \/ n) sigma \( N \) t #h(2em) \( N in cal(N) \( I \) \, med t in C \) $

 induce a bijection from the disjoint union of the quotients by 
$ epsilon.alt : \( N \, t \) mapsto \( epsilon.alt N \, sigma \( epsilon.alt \)^(- 1) t \) \, #h(2em) epsilon.alt in E \, $

 onto the union of the packet orbits. Counting measure on the $N$ labels times the stated measure on $C$ descends to the sum of the orbit Haar measures. In particular, the packet probability is obtained by averaging uniformly over $I$ and $cal(N) \( I \)$ and integrating over $F$ with measure $d t \/ "vol" \( F \)$.]
] <lem:packet-model>

#proof[
  Surjectivity follows from (2.3). A global homothety changes a normalized embedded lattice by an element of $C$. Since $n$ is odd, each pair of opposite sign patterns has exactly one representative in $W_n$; a common negative sign does not change a lattice.
  For injectivity, suppose two displayed normalized lattices coincide. Absorb the ratio of the normalizing scalars into the real diagonal map carrying $sigma \( N \)$ onto $sigma \( N' \)$. Applying this map to one nonzero $alpha in N$ gives $sigma \( beta \)$ for some $beta in N'$. None of the coordinates of $sigma \( alpha \)$ vanishes, so the map is multiplication by $sigma \( beta \/ alpha \)$. Thus $N' = b N$ for $b in K^times$. Their maximal-order spans represent the same ideal class and therefore equal the same chosen $I$. Hence $b I = I$, so $b in E$, and the parameters differ by exactly the stated action.
  Combine an $N$ label with a sign component of $C$. Its stabilizer in $E$ is the totally positive subgroup of ${ epsilon.alt in E : epsilon.alt N = N }$, and has finite index in $E$. It acts faithfully by logarithmic translations. By injectivity, these are all periods of the corresponding $A_n$-orbit. Each orbit of labels therefore contributes exactly one compact $A_n$-orbit, with precisely its prescribed Haar volume. This proves both finiteness and the measure assertion. One may equally use $cal(N) \( I \) times F$ as a fundamental domain, since the $E$-action preserves counting measure times $d t$. The total measure of these fundamental domains is $h_K T "vol" \( F \)$. Dividing by this quantity gives precisely the uniform averages over ideal classes and finite labels, followed by integration against $d t \/ "vol" \( F \)$. ◻
]

=== 2.3 Containment probabilities and unfolding <containment-probabilities-and-unfolding>

Write $frak(p) divides ell$ for the primes of $R$ over $ell$, with ramification indices $e_(frak(p))$ and residue degrees $f_(frak(p))$. Normalize $v_(frak(p))$ by a uniformizer, so $v_(frak(p)) \( ell \) = e_(frak(p))$ and $sum_(frak(p) divides ell) e_(frak(p)) f_(frak(p)) = n$. For a tuple $upright(bold(k))_ell = \( k_(frak(p)) \)_(frak(p) divides ell)$ of nonnegative integers, define

$ P_ell \( upright(bold(k))_ell \) = Pr_(z in R_ell^times) { x in z L_ell } \, $

where $x$ has those component valuations and the probability is normalized unit Haar measure. The definition is independent of $x$ because the units act transitively on each valuation shell. For an integral nonzero $R$-ideal $frak(a)$, set

$ P \( frak(a) \) = product_(ell in S) P_ell \( \( v_(frak(p)) \( frak(a) \) \)_(frak(p) divides ell) \) . $

For $alpha in I \\ { 0 }$, the probability that a uniform $N in cal(N) \( I \)$ contains $alpha$ is $P \( \( alpha \) I^(- 1) \)$.

For a nonnegative Borel function $f$ on $bb(R)^n$, put $E_f \( Lambda \) = sum_(0 eq.not v in Lambda) f \( v \)$. The product-fiber integral below integrates $f$ over the $C$-orbit with absolute coordinate product $z$, using logarithmic Haar measure and summing over all sign components:

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(V)_f \( z \) = sum_(omega in { plus.minus 1 }^n) integral_(bb(R)^(n - 1)) f (omega_1 e^(u_1) \, dots.h \, omega_(n - 1) e^(u_(n - 1)) \, omega_n z e^(- sum_(j < n) u_j)) thin d u_1 dots.h.c thin d u_(n - 1) \, #h(2em) z > 0 . $ <eq:product-fiber>]

#thm([Proposition 2.2.])[
  #emph[Writing $mu_(*) = mu_(K \, M \, sigma)$, one has 
#[#set math.equation(numbering: n => "(2.6)")
 $ integral_(X_n) E_f thin d mu_(*) = frac(1, sqrt(D) thin kappa_K) sum_(frak(a) subset R \, med frak(a) eq.not 0) P \( frak(a) \) cal(V)_f \( "N" frak(a) \/ Q \) . $ <eq:unfolding>]

 The identity holds for nonnegative extended integrals.]
] <prop:unfolding>

#proof[
  Lemma 2 expresses the left side as
  $ frac(1, h_K "vol" \( F \)) sum_I integral_F sum_(alpha in I \\ { 0 }) P \( \( alpha \) I^(- 1) \) f \( \( Q "N" I \)^(- 1 \/ n) sigma \( alpha \) t \) thin d t . $
  The map $alpha mapsto \( alpha \) I^(- 1)$ runs over the integral ideals in the inverse class of $I$, each fiber being one free $E$-orbit. Summing that orbit and integrating over $F$ unfolds to an integral over $C$, by Tonelli. The absolute coordinate product of the normalized vector is $"N" \( \( alpha \) I^(- 1) \) \/ Q$. Translating the first $n - 1$ logarithms and relabeling the signs identifies the $C$-integral with (2.5), with Jacobian one. Every integral ideal occurs in exactly one inverse class. Equation (2.4) supplies the coefficient in (2.6). ◻
]

When $M$ is an $R$-ideal, $q = 1$ and $P \( frak(a) \) = 1$. Thus (2.6) recovers the maximal-order formula.

== 3 Uniform control of the local weights <sec:local>

The ideal sum in Proposition 3 involves arbitrary local modules. We now isolate two estimates that are uniform in those modules and in their indices. The first gives the total normalization; the second makes large local norm contributions negligible.

Let $upright(bold(k)) = \( upright(bold(k))_ell \)_(ell in S)$ range over nonnegative valuation tuples, and write

$ d_ell \( upright(bold(k))_ell \) = ell^(sum_(frak(p) divides ell) f_(frak(p)) k_(frak(p))) \, #h(2em) d \( upright(bold(k)) \) = product_(ell in S) d_ell \( upright(bold(k))_ell \) \, #h(2em) P \( upright(bold(k)) \) = product_(ell in S) P_ell \( upright(bold(k))_ell \) . $

Thus $d$ is the norm of the $S$-supported part of an ideal. Also set

$ Z_ell = product_(frak(p) divides ell) \( 1 - ell^(- f_(frak(p))) \)^(- 1) \, #h(2em) Z_S = product_(ell in S) Z_ell . $

Empty products are one.

#thm([Lemma 3.1.])[
  #emph[For the weights just defined, 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(upright(bold(k))) frac(P \( upright(bold(k)) \), d \( upright(bold(k)) \)) = Z_S / q . $ <eq:shell-sum>]

 If $s = 1 \/ \( 2 n \)$, then, for every $epsilon > 0$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(upright(bold(k))) P \( upright(bold(k)) \) d \( upright(bold(k)) \)^(s - 1) lt.double_(n \, epsilon) q^epsilon / q . $ <eq:weight-moment>]

 In particular, 
#[#set math.equation(numbering: n => "(3.3)")
 $ sum_(d \( upright(bold(k)) \) > Q^(1 \/ 8)) frac(P \( upright(bold(k)) \), d \( upright(bold(k)) \)) lt.double_n 1 / q Q^(- s \/ 16) . $ <eq:weight-tail>]

]
] <lem:local-moment>

#proof[
  Normalize additive Haar measure on $R_ell$ to have mass one. The valuation shell $upright(bold(k))_ell$ has mass $Z_ell^(- 1) \/ d_ell \( upright(bold(k))_ell \)$. Its conditional law is invariant under the transitive unit action, so $P_ell$ is exactly the fraction of this shell lying in $L_ell$. Since $L_ell$ has mass $1 \/ q_ell$, summing over shells and then multiplying over $S$ proves (3.1). Elements with a zero component have additive measure zero.
  Choose an additive-Haar uniform element of $L_ell$, and denote its component valuations by $v_(frak(p))$. The condition $R_ell L_ell = R_ell$ implies that the projection to every component contains a unit. Modulo the $k$th power of its maximal ideal, the projection therefore contains all $bb(Z)_ell$ multiples of that unit, at least $ell^(ceil.l k \/ e_(frak(p)) ceil.r)$ elements. Uniform measure on $L_ell$ induces uniform measure on this finite additive image. Consequently
  #[#set math.equation(numbering: n => "(3.4)")
   $ Pr \( v_(frak(p)) gt.eq k \) lt.eq ell^(- ceil.l k \/ e_(frak(p)) ceil.r) #h(2em) \( k gt.eq 1 \) . $ <eq:valuation-tail>]
  This argument does not require the component projections to be independent, or even to equal their full integer rings.
  Put $j = max_(frak(p) divides ell) ceil.l v_(frak(p)) \/ e_(frak(p)) ceil.r$. Then $d_ell \( upright(bold(v))_ell \) lt.eq ell^(n j)$. If $j gt.eq a gt.eq 1$, some $v_(frak(p))$ is at least $e_(frak(p)) \( a - 1 \) + 1$. Equation (3.4) and a union bound give $Pr \( j gt.eq a \) lt.eq n ell^(- a)$. Hence
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(E)_(L_ell) d_ell \( upright(bold(v))_ell \)^s lt.eq 1 + n sum_(a gt.eq 1) ell^(\( n s - 1 \) a) lt.eq 1 + C_n ell^(- 1 \/ 2) . $ <eq:local-moment>]
  Using the shell masses once more yields the exact factorization
  $ sum_(upright(bold(k))) P \( upright(bold(k)) \) d \( upright(bold(k)) \)^(s - 1) = 1 / q product_(ell in S) (Z_ell thin bb(E)_(L_ell) d_ell \( upright(bold(v))_ell \)^s) . $
  Each factor is at most $\( 1 - ell^(- 1) \)^(- n) \( 1 + C_n ell^(- 1 \/ 2) \)$. For fixed $epsilon > 0$ this is at most $ell^epsilon$ at all sufficiently large primes; the finitely many remaining primes contribute a constant depending only on $n \, epsilon$. As $product_(ell in S) ell lt.eq q$, this proves (3.2). Finally, take $epsilon = s \/ 16$ and use $q lt.eq Q$ to obtain
  $ sum_(d > Q^(1 \/ 8)) frac(P \( upright(bold(k)) \), d) lt.eq Q^(- s \/ 8) sum_(upright(bold(k))) P \( upright(bold(k)) \) d^(s - 1) lt.double_n q^(- 1) Q^(- s \/ 16) . $
  ◻
]

== 4 Residue-relative weighted ideal counts <sec:analytic>

Write

$ a_K \( m \) = \# { frak(a) subset.eq R : "N" frak(a) = m } \, #h(2em) kappa_K = "Res"_(s = 1) zeta_K \( s \) > 0 . $

We first retain the residue in the analytic estimates. All constants subscripted by $n$ are uniform over the fields under consideration.

#thm([Lemma 4.1.])[
  #emph[For $D$ sufficiently large in terms of $n$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ h zeta_K \( 1 + h \) asymp_n kappa_K quad (0 < h lt.eq frac(4, log D)) \, #h(2em) kappa_K^(- 1) lt.double_n log D . $ <eq:residue>]

 For the remaining fields, the first comparison holds uniformly for sufficiently small positive $h$, and $kappa_K^(- 1) lt.double_n 1$.]
] <lem:residue>

#proof[
  Put $L = log D$. Stark’s Lemma 3 gives at most one zero in $"Re" s gt.eq 1 - \( 4 L \)^(- 1)$, $\| "Im" s \| lt.eq \( 4 L \)^(- 1)$; such a zero is real and simple. His Lemma 8, which also applies to nonnormal fields, says that a real zero $beta gt.eq 1 - \( 4 n ! L \)^(- 1)$ forces a quadratic subfield of $K$ #cite(label("Stark1974")) Lemmas 3 and 8. Since $n$ is odd, there is no such subfield. Consequently, for a constant $c_n > 0$, every nontrivial zero $rho$ satisfies $\| 1 - rho \| gt.eq c_n \/ L$.
  The real logarithmic derivative of the completed zeta function gives
  $ S_K \( sigma \) := sum_rho "Re" frac(1, sigma - rho) = 1 / sigma + frac(1, sigma - 1) + L / 2 + zeta'_K / zeta_K \( sigma \) + G_n \( sigma \) \, #h(2em) sigma > 1 \, $
  where zeros are counted with multiplicity and
  $ G_n \( sigma \) = n / 2 (frac(Gamma' \( sigma \/ 2 \), Gamma \( sigma \/ 2 \)) - log pi) . $
  This is the Hadamard identity in #cite(label("Stark1974")) Equation (9). The zero terms are nonnegative, $G_n$ is bounded on $\[ 1 \, 2 \]$, and the Euler product gives $zeta'_K \/ zeta_K lt.eq 0$ there. Thus, at $sigma_0 = 1 + L^(- 1)$, $S_K \( sigma_0 \) lt.double_n L$.
  This bound persists uniformly for $1 < sigma lt.eq 1 + 4 \/ L$. Indeed, for $rho = beta + i gamma$, set $X = L \( 1 - beta \)$, $Y = L gamma$, and $U = L \( sigma - 1 \)$. Then $X gt.eq 0$, $0 < U lt.eq 4$, and $\| X + i Y \| gt.eq c_n$. Hence
  $ frac("Re" \( sigma - rho \)^(- 1), "Re" \( sigma_0 - rho \)^(- 1)) = frac(X + U, X + 1) frac(\( X + 1 \)^2 + Y^2, \( X + U \)^2 + Y^2) lt.eq 4 \( 1 + 3 \/ c_n \)^2 . $
  Summing gives $0 lt.eq S_K \( sigma \) lt.double_n L$. For $F_K \( sigma \) = \( sigma - 1 \) zeta_K \( sigma \)$, it follows that
  $ F'_K / F_K \( sigma \) = S_K \( sigma \) - 1 / sigma - L / 2 - G_n \( sigma \) = O_n \( L \) . $
  Since $F_K$ extends analytically to $1$ with $F_K \( 1 \) = kappa_K > 0$, integration over an interval of length at most $4 \/ L$ proves the comparison in (4.1). At $sigma_0$, the inequality $zeta_K \( sigma_0 \) gt.eq 1$ also gives $kappa_K gt.double_n L^(- 1)$.
  For completeness, only finitely many fields of this fixed degree have discriminant below the cutoff. One can see this directly here: nonzero vectors of $D^(- 1 \/ \( 2 n \)) sigma \( R \)$ have absolute coordinate product at least $D^(- 1 \/ 2)$, so Mahler’s criterion puts these lattices in a fixed compact set. Local basis lifts and a finite cover give bases of $R$ with uniformly bounded conjugates. A basis element outside $bb(Q)$ generates $K$, since $n$ is prime; its monic integral minimal polynomial therefore has bounded coefficients. There are only finitely many such polynomials. The simple pole of each of these finitely many zeta functions now gives the remaining claims uniformly for sufficiently small $h > 0$. ◻
]

We also use the following uniform form of Shiu’s theorem #cite(label("Shiu1980")) #cite(label("Pollack2020")): if $b$ is nonnegative and multiplicative and $b \( m \) lt.eq d_n \( m \)$, where $d_n$ is the $n$-fold divisor function, then

#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(u - v < m lt.eq u) b \( m \) lt.double_n frac(v, log u) exp (sum_(ell lt.eq u) frac(b \( ell \), ell)) #h(2em) \( u^(1 \/ 2) lt.eq v lt.eq u \) . $ <eq:shiu>]

Here $ell$ denotes a rational prime, and the threshold for $u$ depends only on $n$. To check uniformity, the growth conditions in #cite(label("Pollack2020")) Theorem 1.1, with all excluded residue sets empty, are supplied by $d_n \( ell^j \) = binom(j + n - 1, n - 1) lt.eq n^j$ and $d_n \( m \) lt.double_(n \, epsilon) m^epsilon$. Its strict interval condition $u^beta < v lt.eq u$ is satisfied by taking $beta = 1 \/ 4$; thus (4.2) includes both endpoints of the displayed range.

#thm([Proposition 4.2.])[
  #emph[Fix $A_0 gt.eq 1$ and $0 < eta lt.eq 1$. For $Q$ sufficiently large in terms of $n \, A_0 \, eta$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(x - y < "N" frak(a) lt.eq x) P \( frak(a) \) lt.double_n frac(kappa_K y, q) #h(2em) \( Q^(3 \/ 4) lt.eq x lt.eq A_0 Q \, quad eta x lt.eq y lt.eq x \) . $ <eq:weighted-count>]

 The implied constant is independent of $A_0$ and $eta$.]
] <prop:weighted-count>

#proof[
  Set $b \( m \) = a_K \( m \) upright(bold(1))_(\( m \, q \) = 1)$. This function is nonnegative, multiplicative, and bounded by $d_n$. Indeed, at every prime $ell$, including the ramified primes, the local generating series for $a_K$ is $product_(frak(p) divides ell) \( 1 - T^(f_(frak(p))) \)^(- 1)$; it is coefficientwise bounded by $\( 1 - T \)^(- n)$. Decomposing an ideal into its part over $S$ and its coprime part, the sum in (4.3) becomes
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_(upright(bold(k))) P \( upright(bold(k)) \) sum_(\( x - y \) \/ d \( upright(bold(k)) \) < m lt.eq x \/ d \( upright(bold(k)) \)) b \( m \) . $ <eq:weighted-split>]
  First suppose $d = d \( upright(bold(k)) \) lt.eq Q^(1 \/ 8)$, and put $u = x \/ d$. Then $u gt.eq Q^(5 \/ 8) gt.eq D^(1 \/ 4)$. For $h = 1 \/ log u$, Lemma 5 gives $zeta_K \( 1 + h \) lt.double_n kappa_K log u$. There is no upper restriction on $u$: increasing $u$ only decreases $h$, so the lemma applies even when $D$ stays bounded and $q$ grows. Positivity of the Euler logarithm yields
  $ sum_(ell lt.eq u) a_K \( ell \) ell^(- 1 - h) lt.eq log zeta_K \( 1 + h \) . $
  Since $a_K \( ell \) lt.eq n$ and $sum_(ell lt.eq u) \( log ell \) \/ ell lt.double log u$, replacing $ell^(- 1 - h)$ by $ell^(- 1)$ costs only $O_n \( 1 \)$. The latter prime-sum bound follows, for example, by comparing $sum_(ell lt.eq u) floor.l u \/ ell floor.r log ell$ with $log \( floor.l u floor.r ! \)$. Therefore
  $ exp (sum_(ell lt.eq u) frac(a_K \( ell \), ell)) lt.double_n kappa_K log u . $
  Furthermore,
  $ log Z_S = sum_(ell in S) frac(a_K \( ell \), ell) + O_n \( 1 \) \, #h(2em) sum_(ell in S\
ell > u) frac(a_K \( ell \), ell) lt.double_n frac(log \( 2 q \), Q^(5 \/ 8)) lt.double_n 1 . $
  The first error is bounded by a constant times $sum_ell ell^(- 2)$. Removing the primes of $S$ thus gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ exp (sum_(ell lt.eq u) frac(b \( ell \), ell)) lt.double_n frac(kappa_K log u, Z_S) . $ <eq:coprime-euler>]
  For $Q$ sufficiently large at fixed $eta$, the length $v = y \/ d gt.eq eta u$ is at least $u^(1 \/ 2)$. Applying (4.2), then (4.5) and (3.1), bounds the contribution of these $d$ by
  $ C_n frac(kappa_K y, Z_S) sum_(d \( upright(bold(k)) \) lt.eq Q^(1 \/ 8)) frac(P \( upright(bold(k)) \), d \( upright(bold(k)) \)) lt.eq C_n frac(kappa_K y, q) . $
  For $d > Q^(1 \/ 8)$, terms with $d > x$ vanish because the inner sum in (4.4) then contains no positive integer. For the remaining terms, $x \/ d gt.eq 1$, and the elementary bound $sum_(m lt.eq z) d_n \( m \) lt.eq z \( 1 + log z \)^(n - 1)$ for $z gt.eq 1$ follows by summing reciprocals in the first $n - 1$ factors. Using (3.3), with $s = 1 \/ \( 2 n \)$, the remaining contribution to (4.4) is at most
  $ C_n x / q Q^(- s \/ 16) \( 1 + log x \)^(n - 1) = o (frac(kappa_K x, q)) . $
  This is uniform in the stated range: Lemma 5 gives $kappa_K^(- 1) lt.double_n log \( 3 D \)$, and $D lt.eq Q^2$. At fixed $A_0 \, eta$, increase the threshold until this term is at most $kappa_K eta x \/ q lt.eq kappa_K y \/ q$. The implied constant has not changed with $eta$, proving the proposition. ◻
]

== 5 Nonescape and ordinary ball bounds <sec:geometry>

We apply the weighted count in two ways. Cubes about zero control the cusp; small boxes away from the coordinate hyperplanes control ordinary neighborhoods in the lattice space.

#thm([Proposition 5.1.])[
  #emph[Every sequence of the packet probabilities with $Q arrow.r oo$ is tight. More precisely, for $0 < theta < 1$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ limsup_(Q arrow.r oo) mu_(*) { Lambda : exists thin 0 eq.not v in Lambda \, med parallel v parallel_oo < theta } lt.eq C_n theta^n . $ <eq:cusp>]

 Every subsequential probability limit is $A_n$-invariant.]
] <prop:tightness>

#proof[
  For $f = upright(bold(1))_(\[ - theta \, theta \]^n)$, the first $n - 1$ logarithms in (2.5) are at most $log theta$. The last coordinate bounds the sum of their gaps from $log theta$ by $log \( theta^n \/ z \)$. Thus
  $ cal(V)_f \( z \) = frac(2^n, \( n - 1 \) !) #scale(x: 120%, y: 120%)[\(] max { 0 \, log \( theta^n \/ z \) } #scale(x: 120%, y: 120%)[\)]^(n - 1) . $
  Put $X = theta^n Q$ and $U = Q^(3 \/ 4)$. Up to an $n$-dependent constant, Proposition 3 reduces the first moment to
  $ frac(1, sqrt(D) thin kappa_K) sum_("N" frak(a) lt.eq X) P \( frak(a) \) (log frac(X, "N" frak(a)))^(n - 1) . $
  If $X < 1$, the sum is empty. Otherwise its logarithmic factor is at most $\( log Q \)^(n - 1)$, since $theta < 1$. The terms with $"N" frak(a) lt.eq min \( U \, X \)$ contribute at most $C_n Q^(- 1 \/ 4) \( log Q \)^(n - 1)$, by applying Proposition 6 at $x = y = U$. When $X > U$, define the truncated cumulative sum
  $ A_U \( t \) = sum_(U < "N" frak(a) lt.eq t) P \( frak(a) \) \, #h(2em) U lt.eq t lt.eq X . $
  Writing each logarithmic power as an integral and applying Tonelli gives
  $ sum_(U < "N" frak(a) lt.eq X) P \( frak(a) \) (log frac(X, "N" frak(a)))^(n - 1) & = \( n - 1 \) integral_U^X A_U \( t \) (log X / t)^(n - 2) frac(d t, t)\
 & lt.double_n kappa_K / q integral_U^X (log X / t)^(n - 2) thin d t lt.double_n kappa_K / q X . $
  Here the same proposition at $x = y = t$ bounds $A_U \( t \)$, and the last inequality follows from $integral_0^1 \( log \( 1 \/ v \) \)^(n - 2) thin d v < oo$. There is no lower boundary term, since $A_U \( U \) = 0$, and the logarithmic weight vanishes at $X$. If $X lt.eq U$, this part is absent. Dividing by $sqrt(D) thin kappa_K$ gives $O_n \( theta^n \)$. Since $E_f gt.eq 1$ whenever the displayed cusp event occurs, this proves (5.1).
  Mahler’s compactness criterion #cite(label("Mahler1946")) Section 3, Theorem 2 says that the complement of this cusp event is compact. Given a desired mass error, choose $theta$ first and then $Q$ sufficiently large. The finitely many earlier packet supports are compact by Lemma 2, so the whole sequence is tight. The lattice space is locally compact and second countable; weak compactness for tight probabilities gives probability subsequential limits. Invariance passes to them by testing against continuous compactly supported functions. ◻
]

For $r > 0$, let

$ B \( r \) = { h in "SL"_n \( bb(R) \) : max_(i \, j) \| h_(i j) - delta_(i j) \| < r } . $

#thm([Proposition 5.2.])[
  #emph[Let $mu$ be a weak limit of packet probabilities along $Q arrow.r oo$. For every compact $Omega subset X_n$ there are $C_Omega \, r_Omega > 0$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ mu \( x B \( r \) \) lt.eq C_Omega r^n #h(2em) \( x in Omega \, med 0 < r < r_Omega \) . $ <eq:ball-bound>]

]
] <prop:ball-bound>

#proof[
  First fix a compact $V subset \( bb(R)^times \)^n$ and $b_0 gt.eq 1$. For $w in V$ and small $r$, take $f = upright(bold(1))_(w + \[ - b_0 r \, b_0 r \]^n)$. Each coordinate has a fixed sign, is uniformly separated from zero, and has logarithmic width $O_(V \, b_0) \( r \)$. Its absolute product lies within $C r$ of $z_w = product_j \| w_j \|$, so
  $ cal(V)_f \( z \) lt.eq C r^(n - 1) upright(bold(1))_(\[ z_w - C r \, z_w + C r \]) \( z \) $
  for some $C gt.eq 1$ depending only on $V \, b_0 \, n$. Choose $r_0$ small enough that $z_w > 4 C r_0$ on $V$. Use Proposition 6 with
  $ x = \( z_w + 2 C r \) Q \, #h(2em) y = 4 C r Q . $
  This slightly enlarged interval contains every contributing ideal norm. Uniformly in $w$, for sufficiently large $Q$ it has $Q^(3 \/ 4) lt.eq x lt.eq A_0 Q$ with a fixed $A_0 gt.eq 1$, and $eta x lt.eq y lt.eq x$ with $eta = 4 C r \/ A_0 lt.eq 1$, after decreasing $r_0$ if necessary. For every fixed $r in \( 0 \, r_0 \)$, Proposition 3 therefore gives, eventually,
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral E_(upright(bold(1))_(w + \[ - b_0 r \, b_0 r \]^n)) thin d mu_(*) lt.double_(V \, b_0 \, n) frac(r^(n - 1), sqrt(D) thin kappa_K) frac(kappa_K r Q, q) = r^n . $ <eq:vector-box>]
  Here $Q = q sqrt(D)$. The implicit constant is independent of $r$. The threshold for $Q$ may depend on $r$, which is all that will be needed.
  We next choose a suitable lattice vector at each $x in Omega$. Every full lattice has a vector with no zero coordinate: for any basis, its combination with coefficients $\( 1 \, N \, dots.h \, N^(n - 1) \)$ has coordinates that are nonzero polynomials in $N$, so an integer $N$ can avoid their finitely many roots. Near each center choose a continuous local lift to basis matrices, and continue the chosen vector using its fixed integer basis coefficients. On a sufficiently small neighborhood with compact closure in that chart, its coordinates remain bounded and bounded away from zero. A finite cover of $Omega$ by such neighborhoods therefore gives choices $w_x$ lying in one compact $V subset \( bb(R)^times \)^n$. This pointwise selection need not be continuous or measurable.
  For $h$ in $B \( r \)$, each coordinate of $w_x h - w_x$ has absolute value at most $r sum_i \| \( w_x \)_i \|$. Thus one fixed $b_0$ makes every lattice in $x B \( r \)$ contain a nonzero vector in $w_x + \[ - b_0 r \, b_0 r \]^n$. Equation (5.3) bounds the packet mass of $x B \( r \)$ by $C_Omega r^n$. This set is open, so Portmanteau gives
  $ mu \( x B \( r \) \) lt.eq liminf_i mu_i \( x B \( r \) \) lt.eq C_Omega r^n . $
  The argument holds for every fixed $x$ and $r$ with the same constant on $Omega$. It proves (5.2) for all $0 < r < r_Omega$, without any exchange of shrinking-radius and packet limits. ◻
]

== 6 Entropy and identification of the limit <sec:entropy>

The ball estimate has exponent $n$, whereas $A_n$ has dimension $n - 1$. We follow the ordinary-ball strategy of #cite(label("ELMV2011")) Section 2.7.1. We retain the estimate for every invariant probability dominated by a finite multiple of the limit, so it forces positive entropy after restriction to any positive-weight collection of ergodic components. Measure classification then identifies the limit.

For an invariant probability $nu$, write $h_nu \( a \)$ for the measure-theoretic entropy of the map $x mapsto x a$. Fix distinct real numbers $lambda_1 \, dots.h \, lambda_n$ with sum zero and put

$ a \( t \) = "diag" \( e^(lambda_1 t) \, dots.h \, e^(lambda_n t) \) \, #h(2em) lambda = min_(i eq.not j) \| lambda_i - lambda_j \| > 0 . $

#thm([Proposition 6.1.])[
  (Entropy from ordinary balls).  #emph[Let $n gt.eq 3$ and let $mu$ be an $A_n$-invariant probability on $X_n$. Suppose that for every compact $Omega subset X_n$ there are $C_Omega \, r_Omega > 0$ such that 
$ mu \( x B \( r \) \) lt.eq C_Omega r^n #h(2em) \( x in Omega \, med 0 < r < r_Omega \) . $

 Then every $A_n$-invariant probability $xi$ satisfying $xi lt.eq c mu$ for some finite $c$ has $h_xi \( a \( 1 \) \) gt.eq lambda \/ 3$.]
] <prop:entropy-from-balls>

#proof[
  Fix $0 < b < 1 \/ 4$ and consider the two-sided neighborhoods
  $ T_t = a \( t \) B \( b \) a \( - t \) ∩ a \( - t \) B \( b \) a \( t \) \, #h(2em) t gt.eq 0 . $
  If $h in T_t$, then
  #[#set math.equation(numbering: n => "(6.1)")
   $ \| h_(i i) - 1 \| < b \, #h(2em) \| h_(i j) \| < b e^(- \| lambda_i - lambda_j \| t) quad \( i eq.not j \) . $ <eq:tube-entries>]
  Set $r = e^(- lambda t)$. Every term in the determinant expansion other than the product of the diagonal entries contains at least two off-diagonal entries. Since $det h = 1$, it follows that $product_i h_(i i) = 1 + O_(n \, b) \( r^2 \)$. Thus
  $ d \( h \) = "diag" (h_11 \, dots.h \, h_(n - 1 \, n - 1) \, #scale(x: 180%, y: 180%)[\(] product_(i < n) h_(i i) #scale(x: 180%, y: 180%)[\)]^(- 1)) $
  belongs to a fixed compact subset $cal(D) subset A_n$, and $d \( h \)^(- 1) h in B \( C r \)$ for a constant depending only on $n \, b$.
  In logarithmic coordinates, $cal(D)$ is a bounded subset of $bb(R)^(n - 1)$. Covering it by a mesh of size comparable to $r$, and enlarging $C$ to allow for matrix multiplication, gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ T_t subset union.big_(j = 1)^(N_t) d_j B \( C r \) \, #h(2em) d_j in cal(D) \, #h(2em) N_t lt.eq C r^(- \( n - 1 \)) . $ <eq:tube-cover>]
  For $x$ in a compact set $Omega$, all the centers $x d_j$ lie in the fixed compact set $Omega cal(D)$. The assumed ball estimate and domination therefore imply, for all sufficiently large $t$,
  #[#set math.equation(numbering: n => "(6.3)")
   $ xi \( x T_t \) lt.eq C_(Omega \, b \, c) thin r^(- \( n - 1 \)) r^n = C_(Omega \, b \, c) e^(- lambda t) #h(2em) \( x in Omega \) . $ <eq:tube-mass>]
  Since $xi$ is a probability, the constant can be enlarged to cover the finitely many integer times before this estimate holds.
  We use the entropy criterion of Einsiedler–Lindenstrauss–Michel–Venkatesh #cite(label("ELMV2009")) Corollary 3.3. In the notation
  $ B^(\( s \, t \)) = a \( - s \) B a \( s \) ∩ a \( - t \) B a \( t \) \, $
  the criterion states the following: if flow-invariant probabilities $xi_i$ converge weakly to a probability $xi$, and $t_i arrow.r oo$, then $h_xi \( a \( 1 \) \) gt.eq eta$ provided that, for every compact set $Omega$, there are an identity neighborhood $B$ and a constant $C_Omega$ such that
  $ xi_i #scale(x: 120%, y: 120%)[\(] x B^(\( - t_i \, t_i \)) #scale(x: 120%, y: 120%)[\)] lt.eq C_Omega e^(- 2 eta t_i) #h(2em) \( x in Omega \) . $
  This criterion applies on the noncompact lattice space; its requirement that the limit be a probability is essential. Here take the constant sequence $xi_i = xi$, the neighborhood $B \( b \)$, $t_i = i$, and $eta = lambda \/ 3$. Since $B \( b \)^(\( - t \, t \)) = T_t$, Equation (6.3) proves the required estimate. ◻
]

#thm([Lemma 6.2.])[
  (Entropy in the ergodic components).  #emph[Under the hypotheses of Proposition 9, almost every $A_n$-ergodic component of $mu$ has positive entropy for $a \( 1 \)$.]
] <lem:entropy-components>

#proof[
  The group $A_n tilde.eq bb(R)^(n - 1)$ is locally compact and second countable, and its action on the standard Borel space $X_n$ is continuous. The ergodic decomposition theorem #cite(label("GreschonigSchmidt2000")) Theorem 5.2, specialized to invariant probabilities, therefore supplies a measurable decomposition
  $ mu = integral_Z nu_z thin thin d tau \( z \) $
  into $A_n$-invariant, $A_n$-ergodic probabilities over a factor fixed by $A_n$. Set $T \( x \) = x a \( 1 \)$. The function $z mapsto h_(nu_z) \( T \)$ is measurable. Indeed, choose increasing finite Borel partitions $cal(P)_k$ generating the Borel $sigma$-algebra of $X_n$. For every $T$-invariant probability $nu$,
  $ h_nu \( T \) = sup_k inf_(N gt.eq 1) 1 / N H_nu (or.big_(j = 0)^(N - 1) T^(- j) cal(P)_k) \, $
  where $H_nu$ denotes the Shannon entropy of a finite partition. The right side is a countable combination of Borel functions of $nu$.
  The component partition is fixed by $T$, since $a \( 1 \) in A_n$. The entropy integral formula for a fixed invariant partition #cite(label("Rokhlin1967")) Theorem 9.8 consequently gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ h_mu \( T \) = integral_Z h_(nu_z) \( T \) thin thin d tau \( z \) . $ <eq:entropy-decomposition>]
  The same formula holds after restricting to any measurable collection of components. It does not require the $nu_z$ to be $T$-ergodic: the induced transformation on the component space is the identity and contributes zero entropy.
  If $Z_0 = { z : h_(nu_z) \( T \) = 0 }$ had weight $w = tau \( Z_0 \) > 0$, then
  $ xi = 1 / w integral_(Z_0) nu_z thin thin d tau \( z \) $
  would be an $A_n$-invariant probability with $xi lt.eq w^(- 1) mu$. Equation (6.4), applied to this restricted decomposition, would give $h_xi \( T \) = 0$, contradicting Proposition 9. ◻
]

===== 6.1 Measure classification. <measure-classification.>

Einsiedler–Katok–Lindenstrauss #cite(label("EKL2006")) Theorem 1.3 and Corollary 1.4 prove that, for prime $n gt.eq 3$, an $A_n$-invariant and $A_n$-ergodic probability on $"SL"_n \( bb(R) \) \/ "SL"_n \( bb(Z) \)$ is Haar whenever some diagonal one-parameter subgroup has positive entropy. Their action is on the left. The map $Gamma g mapsto g^(- 1) Gamma$, where $Gamma = "SL"_n \( bb(Z) \)$, changes our right action by $a \( t \)$ into the left action by $a \( - t \)$. Since entropy is unchanged by inversion of an invertible transformation, their result applies to our convention without any additional hypothesis.

#proof[
  Let $mu_i$ be the packet probabilities for a sequence in the theorem. Equation (2.2) gives $Q_i arrow.r oo$. By Proposition 7, this sequence is tight and every weak subsequential limit $mu$ is an $A_n$-invariant probability. Proposition 8 supplies the hypotheses of Proposition 9. Lemma 10 shows that almost every $A_n$-ergodic component of $mu$ has positive entropy for $a \( 1 \)$. As $n$ is prime, the classification just stated makes every such component equal to $m_n$. Integrating the components gives $mu = m_n$.
  Thus every convergent subsequence has the same probability limit. Together with tightness, this proves $mu_i arrow.r m_n$ and excludes loss of mass. All preceding estimates were for each prescribed local homothety packet separately, so no averaging over different local module types is used. ◻
]

== 7 Adelic formulation and choices <subsec:adelic-packet>

The model of Lemma 2 also identifies the measure obtained from adelic torus Haar probability. We give the identification for arbitrary local type, so the lattice formulation includes all finite lattice and real diagonalization choices in the usual adelic formulation.

Let $bb(A)_f$ be the finite adeles of $bb(Q)$, let $hat(bb(Z)) = product_ell bb(Z)_ell$, and put $bb(A)_(bb(Q)) = bb(R) times bb(A)_f$ and $bb(A)_K = K ⊗_(bb(Q)) bb(A)_(bb(Q))$. Write $hat(R) = R ⊗ hat(bb(Z))$. Choose a rational basis $b_1 \, dots.h \, b_n$ of $K$, and let $rho \( alpha \)$ denote multiplication by $alpha$ on row coefficient vectors. It embeds the torus

$ upright(bold(T))_K = \( "Res"_(K \/ bb(Q)) bb(G)_m \) \/ bb(G)_m quad upright("in") quad G = "PGL"_(n \/ bb(Q)) . $

The embedding matrix $B_sigma = \( sigma_j \( b_i \) \)_(i \, j)$ satisfies

#[#set math.equation(numbering: n => "(7.1)")
 $ rho \( alpha \) B_sigma = B_sigma "diag" \( sigma_1 \( alpha \) \, dots.h \, sigma_n \( alpha \) \) . $ <eq:regular-diagonalization>]

For $g_f in G \( bb(A)_f \)$, choose a lift to $"GL"_n \( bb(A)_f \)$ and set

$ hat(M) \( g_f \) = hat(bb(Z))^(thin n) g_f^(- 1) \, #h(2em) M \( g_f \) = K ∩ hat(M) \( g_f \) \, $

using the chosen rational basis to identify coefficient vectors with elements of $K$. This is a full lattice, and its completion is $hat(M) \( g_f \)$: choose an integer $d gt.eq 1$ with $d hat(bb(Z))^(thin n) subset hat(M) \( g_f \) subset d^(- 1) hat(bb(Z))^(thin n)$, and patch in the finite quotient $d^(- 1) bb(Z)^n \/ d bb(Z)^n$. Changing the projective lift multiplies it by a scalar finite idele. Every such idele is a rational scalar times an element of $hat(bb(Z))^times$; the latter preserves every completed full lattice. Consequently this change only rescales $M \( g_f \)$ by a rational number.

Choose $g_oo in G \( bb(R) \)$ with $g_oo^(- 1) upright(bold(T))_K \( bb(R) \)^compose g_oo = A_n$, using the odd-degree identification of $G \( bb(R) \)$ with $"SL"_n \( bb(R) \)$. For $g = \( g_oo \, g_f \)$, the adelic packet is the projection of $upright(bold(T))_K \( bb(Q) \) without upright(bold(T))_K \( bb(A)_(bb(Q)) \) g$ to $G \( bb(Q) \) without G \( bb(A)_(bb(Q)) \) \/ G \( hat(bb(Z)) \)$, equipped with the pushforward of torus Haar probability.

#thm([Proposition 7.1.])[
  #emph[The adelic torus quotient is compact. Its packet and canonical probability agree with $cal(P)_(K \, M \( g_f \) \, sigma')$ and $mu_(K \, M \( g_f \) \, sigma')$ for an ordering $sigma'$ of the real embeddings. Every prescribed local homothety type occurs this way. Changing the rational basis or the projective lifts does not change the packet; changing the allowed real diagonalizer only reorders the embeddings. Thus Theorem 1 includes every such adelic choice.]
] <prop:adelic-packet>

#proof[
  Write $M = M \( g_f \)$ and $hat(M) = hat(M) \( g_f \)$. First identify the ambient quotient with $X_n$. Given a finite matrix lift $g_f$, choose a basis matrix $c in "GL"_n \( bb(Q) \)$ for $bb(Q)^n ∩ hat(bb(Z))^(thin n) g_f^(- 1)$. Then $c g_f in "GL"_n \( hat(bb(Z)) \)$, and the corresponding real lattice is $bb(Z)^n c g_oo$, normalized to covolume one. Changing this basis or either matrix lift has no effect on that lattice. This constructs the usual quotient identification directly. For odd $n$, the signed real $n$th root gives $\[ h \] mapsto \( det h \)^(- 1 \/ n) h$, identifying $G \( bb(R) \)$ with $"SL"_n \( bb(R) \)$ and $G \( bb(Z) \)$ with $"SL"_n \( bb(Z) \)$.
  Multiplication matrices modulo scalars give
  #[#set math.equation(numbering: n => "(7.2)")
   $ upright(bold(T))_K \( bb(Q) \) without upright(bold(T))_K \( bb(A)_(bb(Q)) \) tilde.eq K^times without bb(A)_K^times \/ bb(A)_(bb(Q))^times . $ <eq:idelic-torus-quotient>]
  Here the pointwise lifts can also be seen by elementary linear algebra: over any ground field $F_0$ containing $bb(Q)$, a matrix whose projective class lies in $upright(bold(T))_K$ becomes a scalar multiple of a multiplication operator over an algebraic closure. It therefore commutes exactly with the regular representation already over $F_0$. The centralizer of that representation is the algebra of multiplication operators, so the matrix belongs to $\( K ⊗_(bb(Q)) F_0 \)^times$, with scalar ambiguity $F_0^times$. Finite lifts may be chosen integral at almost all primes.
  A finite idele $t_f$ acts on the completed lattice by $hat(M) mapsto t_f^(- 1) hat(M)$. Hence its translates are exactly the prescribed local homothety type. The stabilizer of $hat(M)$ among finite ideles is
  $ { z : z hat(M) = hat(M) } = \( cal(O) \( M \) ⊗ hat(bb(Z)) \)^times : $
  equality holds precisely when both $z$ and $z^(- 1)$ preserve $hat(M)$. In the projective torus the stabilizer is the image of this group, since a representative that preserves the lattice up to a scalar idele can be rescaled to preserve it exactly. The unit subgroup is compact open in the finite ideles and has finite index in $hat(R)^times$; at each prime not dividing $q$ it equals $R_ell^times$. Its projective image is compact open as well. No invertibility of $M$ over $cal(O) \( M \)$ is used.
  To describe the quotient and its measure, first divide (7.2) by the image of $hat(R)^times$. Fractional-ideal factorization and $bb(A)_(bb(Q))^times = bb(Q)^times bb(R)^times hat(bb(Z))^times$ give one real fiber $E without C$ for each ordinary ideal class. These fibers are compact by the unit theorem, and the omitted finite-unit group is compact. Thus the torus quotient is compact. At the stabilizer of $hat(M)$, the finite fibers instead retain the translates $cal(N) \( I \)$. The same decomposition becomes
  $ product.co_(\[ I \]) \( cal(N) \( I \) times C \) \/ E \, $
  with exactly the action in Lemma 2. Haar measure pushes to uniform counting measure on each finite unit orbit and to the stated logarithmic Haar measure on $C$. After normalization it is therefore precisely the probability in that lemma. For $g_oo = \[ B_sigma \]$, (7.1) identifies the resulting real lattices with its displayed map. This proves both the packet identification and the equality of measures, including the orbit volume weights.
  Finally, every full $M$ is obtained by choosing a basis matrix for its completed lattice and taking its inverse as $g_f$. Any other allowed real diagonalizer has the form $\[ B_sigma d P \]$, where $d$ is diagonal and $P$ is a permutation matrix, because it must permute the joint eigenspaces. The diagonal factor translates the real torus and permutes its sign components, preserving its Haar probability; the permutation reorders the embeddings. If a rational change of basis has matrix $c$, then $B'_sigma = c B_sigma$ and $rho' = c rho c^(- 1)$, while the same packet data have representatives $g'_oo = c g_oo$ and $g'_f = c g_f$. Thus the torus is conjugated and the translated packet is left-multiplied by $c$, which disappears in the ambient rational quotient. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
