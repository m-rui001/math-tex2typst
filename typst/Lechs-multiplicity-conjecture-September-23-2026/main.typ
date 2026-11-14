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

#align(center)[#text(size: 16pt, weight: "bold")[Lech's multiplicity conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

For a nonzero Noetherian local ring $\( A \, frak(a) \)$ of dimension $d$, its Hilbert–Samuel multiplicity is

$ e \( A \) = lim_(N arrow.r oo) frac(d ! thin "ℓ"_A \( A \/ frak(a)^N \), N^d) . $

In dimension zero this is simply the length of $A$. Multiplicity measures the leading-order growth of the
  infinitesimal neighborhoods of the closed point. Lech asked whether this invariant can decrease under a flat
  local homomorphism [18,19]. We prove that it cannot.

#thm([Theorem 1.1.])[
  (Lech’s conjecture).  #emph[Let $\( R \, frak(m) \) arrow.r \( S \, frak(n) \)$ be a flat local homomorphism of
    nonzero Noetherian local rings. Then
$ e \( R \) lt.eq e \( S \) . $

 There is no restriction on the dimensions, the residue fields, or the characteristics of the rings.]
] <thm:main>

Flatness compares the quotients by $frak(m)^N S$, whereas $e \( S \)$ is defined by the powers of $frak(n)$.
  Even when the closed fiber is zero-dimensional, so that both filtrations have finite colength,
  this difference prevents a direct comparison of their leading terms from giving the asserted lower bound for
  $e \( S \)$.

===== 1.1 Previous work. <previous-work.>

Lech’s original work established the inequality when the source has dimension at most two and in important cases
  with complete-intersection closed fiber [18,19]. His original equal-dimensional formulation leads to the general
  one by the reductions recalled in Section 4. Ma proved the conjecture for equal-characteristic sources of
  dimension three and established the general bound

$ e \( R \) lt.eq max { 1 \, d ! \/ 2^d } thin e \( S \) \, wide d = dim R \, $

in equal characteristic [20] Theorems 1.2 and 1.3. His use of Cohen factorizations and Hilbert–Kunz multiplicity
  is also central to the characteristic-$p$ argument here.

===== 1.2 Ulrich methods and their limits. <ulrich-methods-and-their-limits.>

An Ulrich module is a nonzero finitely generated maximal Cohen–Macaulay module whose multiplicity equals its
  minimal number of generators. Such modules turn multiplicity into a generator count that can be compared across
  a flat map. Hanes developed this approach, including its asymptotic form:
  maximal Cohen–Macaulay modules of positive rank whose generator-to-multiplicity ratios tend to one also suffice.
  He obtained graded special cases by this method [10] Chapter IV, especially Proposition 4.1.5.
  Ma’s weakly lim Ulrich sequences allow the modules themselves to fail to be Cohen–Macaulay:
  their multiplicity-to-generator ratios tend to one, while their first higher parameter Koszul Euler
  characteristics are negligible relative to the generator counts [21] Definitions 2.2 and 2.9.
  For a local domain, existence of such a sequence implies the multiplicity inequality for every flat local target
  [21] Theorem 2.11.

In arbitrary dimension, Ma proved the conjecture when the source is a standard graded algebra over a perfect
  field, localized at its homogeneous maximal ideal; the flat local target need not be graded [21] Theorem 3.8.
  The proof constructs weakly lim Ulrich sequences in positive characteristic and uses specialization in
  characteristic zero. Passing to associated graded rings does not extend this result to every flat map,
  because the induced map of associated graded rings need not remain flat [21] Remark 3.9.
  A complementary graded case was proved by Meng: for an equal-dimensional flat local map,
  the inequality holds when, up to completion, the target is standard graded over a field and the extended source
  maximal ideal is homogeneous [22] Theorem 5.13.

Nor can one require weakly lim Ulrich sequences over every domain:
  Yhee constructed complete two-dimensional local domains admitting no such sequence [29] Theorem 6.2.
  These examples are nonnormal. A different obstruction, within normal domains,
  is supplied by a companion construction of a complete three-dimensional Noetherian normal local $bb(C)$-domain,
  with residue field $bb(C)$, admitting no nonzero finitely generated maximal Cohen–Macaulay module [24]
  Theorem 1.1. Thus approaches requiring such a module over every source ring itself cannot be universal;
  this finite-module obstruction does not rule out weakly lim Ulrich sequences.

===== 1.3 From modules to complexes. <from-modules-to-complexes.>

Over a $d$-dimensional local ring, a short complex is a finite free complex in degrees $0 \, dots.h \,
  d$ with finite-length homology and nonzero zeroth homology.
  Iyengar, Ma, and Walker developed multiplicity and Betti-number inequalities for short free complexes using lim
  Ulrich methods [14]. Their approach to Lech’s conjecture in [14] Proposition 8.3 uses a Cohen factorization and
  the tensor product of a finite free resolution with a parameter Koszul complex.
  This is the predecessor of the construction used here. They also used lim Ulrich sequences to compare cones of
  Betti tables with those over linear Noether normalizations [15].
  More recently, they related Ulrich modules to extensions of sheaves from the exceptional fiber of a blowup [16]
  Theorem 1.1, obtaining in dimension two short-complex inequalities under geometric hypotheses [16] Theorems 5.2
  and 6.9. These results motivate seeking positivity directly for complexes,
  without requiring Ulrich modules or sequences over every source.

Two difficulties remain in passing from such results to the unrestricted theorem:
  retaining coefficient $1$ in every dimension, and obtaining the required length estimates in mixed
  characteristic. Our argument uses a single estimate for free complexes in both settings.
  Its constants depend only on the number of parameters and the ranks,
  even when the auxiliary ring or its length function changes.

===== 1.4 A uniform estimate for complexes. <a-uniform-estimate-for-complexes.>

The main technical ingredient is Theorem 2. Let $I = \( z_1 \, dots.h \, z_h \)
  C$ in a possibly non-Noetherian ring $C$, and suppose an additive length $lambda$,
  satisfying the stability hypotheses stated there, makes the powers of $z$ behave as a parameter system:
  their positive Koszul homology has length zero and their quotient lengths scale as $a^h$.
  A finite free complex $F$ of length at most $h$ and alternating rank zero, contractible off $V \( I \)$,
  whose matrices have entries in $I^s$, satisfies

$ lambda \( H_0 F \) med gt.eq med lambda \( C \/ I \) s^h ("rank" F_0 - frac(A_h sum_i "rank" F_i, s)) $

for sufficiently large $s$. The constant does not depend on the ring, the length theory,
  or any auxiliary finite extension.

Here $H_0 F$ denotes the zeroth homology of $F$. The hypotheses on $lambda$ are part of the estimate:
  additivity alone does not suffice. In particular, sums and filtered colimits of modules of length zero must
  still have length zero when one power of $I$ annihilates all the modules.
  Positive Koszul homology is required to have length zero, and need not itself vanish.

The proof combines a blowup comparison with the characteristic-free vector-bundle construction of
  Eisenbud–Schreyer [8], which gives cohomology in a single degree.
  The relationship between free complexes, cohomology tables,
  and positivity has also been developed in the categorified duality of Eisenbud–Erman [7].
  Here the needed comparison of Euler characteristics is proved using finite filtrations and stabilized images of
  truncation maps. This comparison is needed because the ring $C$ need not be Noetherian.
  On the blowup, the differential entries can be divided by appropriate powers of the invertible ideal $I cal(O)$.
  Tensoring the resulting complex with a suitable vector bundle places its global hyperhomology in degree zero,
  modulo length zero, and hence gives a nonnegative Euler characteristic.
  The bundle’s cohomological roots are the integer twists at which all its cohomology vanishes.
  These roots, after division by $s$, are chosen near the roots of the derivative of
  $product_(i = 1)^h \( x + i \)$; this choice makes all the relevant layer sums have the same leading term.
  Here the layers are successive quotients for powers of the invertible ideal $I cal(O)$ on the blowup.
  The alternating rank identity then leaves precisely the contribution of $F_0$.

The estimate applies to length theories beyond ordinary module length.
  For the present problem we use perfection in characteristic $p$ and the perfectoid normalized lengths of
  Cai–Lee–Ma–Schwede–Tucker in mixed characteristic [5].

===== 1.5 A Dutta-multiplicity consequence. <a-dutta-multiplicity-consequence.>

In characteristic $p$, the same estimate also applies to arbitrary short complexes.
  For such a complex over a $d$-dimensional ring of characteristic $p > 0$,
  its Dutta multiplicity [6] is the Frobenius-normalized Euler characteristic

$ chi_oo^R \( F \) = lim_(n arrow.r oo) p^(- n d) sum_i \( - 1 \)^i "ℓ"_R H_i \( Phi_R^n F \) \, $

where $Phi_R^n F$ is obtained by raising the differential entries to their $p^n$th powers.
  Corollary 19 proves $chi_oo \( F \) gt.eq e \( R \)$ for every short complex over a complete Noetherian local
  domain of characteristic $p > 0$. This is the case of complete local domains of positive characteristic in the
  conjecture of Iyengar–Ma–Walker [14] Conjecture 8.1. Their full conjecture, for all complete local rings,
  would imply Lech’s conjecture [14] Proposition 8.3. Here the stated domain case is a consequence of the uniform
  estimate, not an assumption in the proof of Lech’s conjecture.

===== 1.6 How the estimate proves the conjecture. <how-the-estimate-proves-the-conjecture.>

After reductions that preserve multiplicity or use its additivity, we work with a complete domain source,
  equal source and target dimensions, and an algebraically closed target residue field.
  In positive residue characteristic, a Cohen factorization supplies a complete local ring $T$ and a perfect ideal
  $J$ such that $S = T \/ J$ and $e \( T \) = e \( R \)$. If $d = dim S$ and $h = dim T$,
  a finite free resolution $P$ of $S$ over $T$ has length $h - d$.
  Choose parameters $x_1 \, dots.h \, x_d$ in $S$ whose ideal is a reduction of its maximal ideal,
  so its multiplicity is $e \( S \)$, and lift them to $T$. The complex

$ F = P ⊗_T K \( x_1 \, dots.h \, x_d \; T \) $

has length $h$, has degree-zero rank one, and is contractible away from the closed point.
  Here $K \( x \; T \)$ is the Koszul complex. This is the complex to which the uniform estimate is applied.

The two positive-residue-characteristic arguments turn this complex into a multiplicity comparison in different
  ways. In characteristic $p$, Frobenius raises the differential entries to arbitrarily high order without
  changing their ranks. On each irreducible component of $T$,
  normalized length on the perfection identifies the length of the resulting zeroth homology with a Hilbert–Kunz
  multiplicity. The complex estimate gives a lower bound by the Hilbert–Samuel multiplicity of that component.
  Associativity and Ma’s perfect-ideal identity then identify the sum with $e \( S \)$.

In mixed characteristic, roots of parameters and Heitmann’s integral-extension Briançon–Skoda theorem [11],
  in the form recalled in [12] Proposition 2.8, replace Frobenius.
  The extension has a rank that may grow as the entries become deeper.
  Dividing normalized lengths by that rank cancels it from the lower bound.
  For each fixed extension we obtain an upper bound by replacing $x_i$ with $x_i^N$ and taking $N$ to infinity in
  a prime filtration of $S$. Only after this limit do we let the depth of the differential entries tend to
  infinity. The upper bound is independent of the chosen extension.
  Moreover, each top-dimensional filtration prime lies on exactly one component of $T$,
  which is the reason this summation retains coefficient one.

In residue characteristic zero, we first replace the given map by a finite free map with a common coefficient
  field. A finite set of polynomial identities records algebra structures, freeness, locality,
  a lower bound on the source multiplicity, and an upper bound on the target multiplicity.
  The last two conditions use presentation minors and a reduction relation on the source,
  and monic initial relations for the target’s associated graded ring.
  Artin approximation [1] and specialization preserve these identities in positive characteristic.
  A strict counterexample would therefore contradict the characteristic-$p$ case.

===== 1.7 Organization. <organization.>

Section 2 proves the uniform estimate. Section 3 constructs its length inputs in positive and mixed
  characteristic. Section 4 makes the flat-local reductions and constructs $T$ and $F$.
  Sections 5 and 6 prove the two cases of positive residue characteristic;
  Section 5 also proves the Dutta-multiplicity corollary. Section 7 gives the finite encoding and specialization
  in residue characteristic zero, and Section 8 assembles the theorem.

===== 1.8 Conventions and background. <conventions-and-background.>

Rings are commutative with identity. Local rings are Noetherian unless explicitly introduced as auxiliary rings
  for an additive length; those auxiliary rings remain exempt from this convention when used in later sections.
  For an ideal of definition $H$ of a local ring $A$, write $e \( H \, A \)$ for its Hilbert–Samuel multiplicity.
  A system of parameters has length $dim A$. A #emph[reduction] of an ideal $I$ is a subideal $Q$ such that
  $I^(n + 1) = Q I^n$ for all sufficiently large $n$; it is #emph[minimal] if it is inclusion-minimal among
  reductions of $I$. For an ideal of definition, $e \( Q \, A \) = e \( I \, A \)$.
  Indeed, the reduction relation gives $I^(n + c) subset.eq Q^n subset.eq I^n$ for one fixed $c$ and all $n$,
  so their leading length coefficients agree. We use homological indexing:
  a sheaf-cohomology degree $v$ contributes total homological degree $i - v$ to a term of complex degree $i$.
  The shift $F \[ t \]$ has $H_i \( F \[ t \] \) = H_(i - t) \( F \)$.
  We use the standard additivity and associativity formulas for multiplicity,
  and state the deeper literature inputs where they enter. In particular,
  the perfectoid length theorems are inputs, not claims that the auxiliary algebras are flat or Noetherian.

== 2 A complex estimate with an additive length <sec:complex>

The goal of this section is to bound the zeroth homology of a short free complex from below using only the order
  of its differential entries and the ranks of its terms. We first isolate the length hypotheses,
  then prove the comparison between the complex and its pullback to a blowup.
  A vector bundle with prescribed cohomological roots will turn that comparison into the required inequality.

=== 2.1 Length hypotheses and the estimate <length-hypotheses-and-the-estimate>

All complexes in this section are indexed homologically. Thus a sheaf cohomology group in degree $v$,
  arising from the term of a complex in degree $i$, contributes to total degree $i - v$.

Let $C$ be a commutative ring, let $h gt.eq 1$, and put $I = \( z_1 \, dots.h \, z_h \) C$.
  Write $cal(T)_I$ for the abelian category of $C$-modules annihilated by some power of $I$. Suppose that

$ lambda : cal(T)_I arrow.r \[ 0 \, oo \] $

is additive on short exact sequences and satisfies $lambda \( 0 \) = 0$.
  We assume, in addition, that direct sums and filtered colimits of length-zero modules annihilated by a common
  power of $I$ have length zero. The standing numerical and homological assumptions are

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 < mu & := lambda \( C \/ I \) < oo \,\
lambda #scale(x: 120%, y: 120%)[\(] C \/ \( z_1^a \, dots.h \, z_h^a \) C #scale(x: 120%, y: 120%)[\)] & =
  a^h mu wide \( a gt.eq 1 \) \,\
lambda H_i \( z_1^a \, dots.h \, z_h^a \; C \) & = 0 wide \( a gt.eq 1 \, med i > 0 \) .
  $ <eq:complex-length-hypotheses>]

No Noetherian hypothesis is imposed on $C$.

We say that a map between objects of $cal(T)_I$ is an #emph[isomorphism modulo length zero] if its kernel and
  cokernel have length zero. The length-zero objects form a Serre subcategory.
  Consequently one may work in the quotient by this subcategory when taking kernels, images, cokernels,
  or finite spectral sequences. In particular, a commutative square whose two vertical maps are isomorphisms
  modulo length zero induces such an isomorphism between the images of its horizontal maps.
  All uses of this convention below involve finite filtrations.

We will also use the following elementary observation about complexes with finite exhaustive filtrations in a
  common index range. If a filtration-preserving map induces zero on the first page of its spectral sequence,
  it induces zero on the associated graded of homology and hence lowers the filtration on homology by one.
  A composition of as many such maps as there are filtration steps is therefore zero on homology.
  The same statement holds modulo length zero whenever the pages under consideration belong to $cal(T)_I$.

#thm([Theorem 2.1.])[
  #emph[Let $C$, $I$, and $lambda$ be as above. Assume that $lambda$ is additive on short exact sequences,
    that $lambda \( 0 \) = 0$, and that direct sums and filtered colimits of length-zero modules killed by a
    common power of $I$ have length zero. Assume also (2.1). Let $F$ be a complex of finite free $C$-modules,
    concentrated in degrees $0 \, dots.h \, h$, which is contractible locally on $"Spec" C \\ V \( I \)$.
    Set $b_i = "rank"_C F_i$. Then $H_i \( F \)$ is annihilated by a power of $I$,
$ lambda H_i \( F \) = 0 quad \( i > 0 \) \, wide lambda H_0 \( F \) < oo . $

 Suppose further that
$ sum_(i = 0)^h \( - 1 \)^i b_i = 0 quad upright("and that all differential entries belong to ") I^s \, wide
  s gt.eq 1 . $

 There is a constant $A_h$, depending only on $h$, such that
#[#set math.equation(numbering: n => "(2.2)")
 $ lambda H_0 \( F \) med gt.eq med mu s^h (b_0 - A_h / s sum_(i = 0)^h b_i) . $ <eq:complex-estimate>]

 In particular, for fixed $h$ and fixed ranks the error is $O_h \( 1 \/ s \)$, uniformly in $C$, $I$, $lambda$,
   and $F$.]
] <thm:complex>

=== 2.2 Koszul acyclicity modulo length zero <koszul-acyclicity-modulo-length-zero>

We first prove the homology assertion, which does not require the conditions on ranks or differential entries.

#thm([Lemma 2.2.])[
  #emph[Under the standing length hypotheses, let $F$ be a finite free complex in degrees $0 \, dots.h \, h$,
    contractible locally off $V \( I \)$. Each $H_i \( F \)$ is annihilated by a fixed power of $I$,
    all its lengths are finite, and its positive homology has length zero.]
] <lem:acyclicity>

#proof[
  For each $j$, the complex $F \[ 1 \/ z_j \]$ is exact. A bounded exact complex of projective modules is
    contractible, so clearing the finitely many denominators in a contracting homotopy shows that some power of
    $z_j$ acts nullhomotopically on $F$. Choose a common exponent $a_0$.
    It follows that $\( z_1^(a_0) \, dots.h \, z_h^(a_0) \)$ annihilates every $H_i \( F \)$,
    and therefore so does $I^(h \( a_0 - 1 \) + 1)$.
  Put $K_a = K \( z_1^a \, dots.h \, z_h^a \; C \)$. If $a gt.eq a_0$,
    each multiplication by $z_j^a$ is nullhomotopic on $F$ and also on its tensor product with any of the other
    Koszul factors. Splitting the resulting mapping cones gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ F ⊗_C K_a tilde.eq xor.big_(T subset.eq { 1 \, dots.h \, h }) F \[ \| T \| \] . $ <eq:complex-koszul-splitting>]
  The splittings can be chosen to preserve the inclusion of the copy of $F$ in Koszul degree zero.
  The homology of $F ⊗ K_a$ is annihilated by $\( z_1^a \, dots.h \, z_h^a \)$,
    since these multiplications are nullhomotopic on $K_a$. In the bounded double-complex spectral sequence
    obtained by taking Koszul homology first, all positive Koszul rows have length zero by (2.1).
    The remaining row has terms
  $ F_i ⊗_C C \/ \( z_1^a \, dots.h \, z_h^a \) \, wide 0 lt.eq i lt.eq h \, $
  of finite length. Hence every $H_n \( F ⊗ K_a \)$ has finite length, and its length is zero when $n > h$.
    The summand $F \[ h \]$ in (2.3) proves the assertions: $H_0 \( F \)$ is a summand of $H_h \( F ⊗ K_a \)$,
    and $H_i \( F \)$ for $i > 0$ is a summand of $H_(h + i) \( F ⊗ K_a \)$. ◻
]

=== 2.3 The blowup and its exceptional divisor <the-blowup-and-its-exceptional-divisor>

The homology lengths are now finite. To estimate them, we pass to a space on which $I$ becomes invertible,
  while keeping track of the Euler characteristic of the original complex. Let

$ Y = "Proj"_C #scale(x: 180%, y: 180%)[\(] xor.big_(n gt.eq 0) I^n #scale(x: 180%, y: 180%)[\)] \, wide L =
  I cal(O)_Y = cal(O)_Y \( 1 \) \, wide E = V \( L \) . $

Here $cal(O)_Y \( 1 \)$ is the Rees-algebra twist. Indeed,
  the standard chart corresponding to $z_i$ has ring $C \[ I \/ z_i \] subset.eq C \[ 1 \/ z_i \]$.
  On this chart $I$ becomes $\( z_i \)$ and $z_i$ is a nonzerodivisor.
  Thus $L$ is an invertible ideal, and $E$ is an effective Cartier divisor, even when $C$ is not Noetherian.
  Empty charts may simply be omitted. The generators of $I$ give a closed immersion $Y arrow.r bb(P)_C^(h - 1)$, and

$ E = "Proj" \( "gr"_I C \) arrow.r bb(P)_(C \/ I)^(h - 1) . $

For a vector bundle $V$ on $bb(P)_(bb(Z))^(h - 1)$ we use the same symbol for its pullbacks to these schemes,
  and write $V \( t \) = V ⊗ cal(O) \( t \)$.

#thm([Lemma 2.3.])[
  #emph[The graded surjection
#[#set math.equation(numbering: n => "(2.4)")
 $ \( C \/ I \) \[ Z_1 \, dots.h \, Z_h \] arrow.r "gr"_I C $ <eq:complex-graded-map>]

 has length-zero kernel in every degree. For every vector bundle $V$ on $bb(P)_(bb(Z))^(h - 1)$ and every integer
   $t$, restriction induces isomorphisms modulo length zero
$ H^v \( bb(P)_(C \/ I)^(h - 1) \, V \( t \) \) arrow.r H^v \( E \, V \( t \) \) . $

 All of these cohomology modules have finite length. Moreover, for $t gt.eq 0$ the natural map
$ "gr"_I^t C arrow.r H^0 \( E \, cal(O)_E \( t \) \) $

 is an isomorphism modulo length zero, and $H^v \( E \, cal(O)_E \( t \) \)$ has length zero for $v > 0$.]
] <lem:complex-graded-comparison>

#proof[
  Set $J_a = \( z_1^a \, dots.h \, z_h^a \)$. Since $I^(h \( a - 1 \) + 1) subset.eq J_a$,
    the $I$-adic filtration of $C \/ J_a$ is finite. There is a graded surjection
  $ \( C \/ I \) \[ Z_1 \, dots.h \, Z_h \] \/ \( Z_1^a \, dots.h \, Z_h^a \) arrow.r "gr"_I \( C \/ J_a \) . $
  The sum of the lengths of the homogeneous pieces on each side is $a^h mu$.
    Additivity and nonnegativity imply that every homogeneous piece of its kernel has length zero.
    For a given degree $n$, choose $a > n$. The relations $Z_i^a$ have no effect in degree $n$,
    and $J_a subset.eq I^(n + 1)$, so the degree-$n$ map is precisely (2.4). This proves the first assertion.
    It also gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ lambda \( C \/ I^M \) = mu binom(M + h - 1, h) wide \( M gt.eq 1 \) . $ <eq:complex-power-colength>]
  Write $P = \( C \/ I \) \[ Z_1 \, dots.h \, Z_h \]$ and let $N$ be the kernel in (2.4).
    The degree-zero component of a homogeneous localization of $N$,
    as used on any standard projective chart or its intersections,
    is a filtered colimit of homogeneous pieces of $N$. All these pieces are annihilated by $I$ and have length
    zero. The assumed colimit property therefore gives length zero for every such localized component.
    Tensoring with the restriction of $V \( t \)$ preserves this property,
    since that restriction is finite projective over the chart ring.
    The finite standard affine Cech complexes for projective space and $E$ consequently have termwise length-zero
    kernels, and restriction is an isomorphism modulo length zero on their cohomology.
  To check finiteness without a hypothesis on $C \/ I$, resolve $V \( t \)$ on $bb(P)_(bb(Z))^(h - 1)$ by finitely
    many finite sums of twists of the structure sheaf. Such a resolution exists by taking a finite graded free
    resolution of a finitely generated graded module representing $V \( t \)$ over
    $bb(Z) \[ Z_1 \, dots.h \, Z_h \]$. This polynomial ring is regular of finite dimension and therefore has
    finite global dimension [28] Tags 07NF and 00OE; its finitely generated graded projectives are graded free,
    as follows by lifting a homogeneous basis modulo $\( Z_1 \, dots.h \, Z_h \)$ and applying graded Nakayama.
    The sheaf resolution is locally split because its final cokernel is a vector bundle,
    so it remains exact after arbitrary base change. The cohomology of every twist on $bb(P)_(C \/ I)^(h - 1)$ is
    finite free over $C \/ I$. A finite spectral sequence for the resolution proves the required finiteness.
    Finally, for $t gt.eq 0$ the polynomial degree-$t$ piece is the space of global sections of $cal(O) \( t \)$
    and its higher cohomology vanishes. Combining these facts with (2.4) proves the last assertions. ◻
]

=== 2.4 Euler characteristics on the blowup <euler-characteristics-on-the-blowup>

We now compare the homology lengths of $F$ with those of its pullback to $Y$.
  We will also show that, when the alternating rank is zero,
  tensoring the pullback with a vector bundle multiplies its Euler characteristic by the bundle’s rank.

For a bounded complex $D$ of quasi-coherent sheaves on $Y$, write

$ bb(H)_k \( Y \, D \) = H_k upright(bold(R)) Gamma \( Y \, D \) . $

These groups can be calculated using the finite standard affine Cech cover, whose intersections are affine.
  Whenever they are $I$-power torsion of finite length, put

$ chi_lambda \( D \) = sum_k \( - 1 \)^k lambda bb(H)_k \( Y \, D \) . $

Only finitely many degrees occur in our applications.

Pull $F$ back to $Y$ and denote the resulting complex by $F_Y$.
  If the differential entries belong to $I^s$, define a complex $G$ by

#[#set math.equation(numbering: n => "(2.6)")
 $ G_i = L^(- i s) ⊗_C F_i = cal(O)_Y \( - i s \)^(b_i) . $ <eq:complex-G>]

Its differential is induced by that of $F_Y$ after inverting $L$.
  On a chart where $L = \( z_j \)$, the matrix in the bases $z_j^(- i s) F_i$ is $z_j^(- s) d_i$,
  where $d_i$ is the matrix for $F$. It is regular because the entries of $d_i$ belong to $L^s$.
  The natural inclusions $F_i arrow.r L^(- i s) ⊗_C F_i$ give an inclusion of complexes $F_Y subset.eq G$.

In degree $i$, the quotient $G \/ F_Y$ has successive layers $cal(O)_E \( l \)^(b_i)$ for $l = - i s \,
  dots.h \, - 1$. When the alternating rank is zero, these finite layer ranges will account,
  after the Euler comparison, for the entire difference between $chi_lambda \( G ⊗ V \)$ and $\( "rank" V \)
  lambda H_0 \( F \)$. We first justify the comparison for an arbitrary bundle $V$;
  the choice of $V$ that gives a nonnegative Euler characteristic will follow.

#thm([Lemma 2.4.])[
  #emph[Let $D$ be either $F_Y ⊗ V$ or $G ⊗ V$, with $V$ a vector bundle pulled back from $bb(P)_(bb(Z))^(h - 1)$.
    There is an integer $M_D$ such that, for every integer $j$ and every $M gt.eq M_D$, the inclusion
$ D \( j + M \) arrow.r D \( j \) $

 induces zero on hyperhomology. All hyperhomology modules of $D \( j \)$ are annihilated by a power of $I$ and
   have finite length.]
] <lem:complex-twist-maps>

#proof[
  On a standard affine chart $U_i$, $L$ is generated by the nonzerodivisor $z_i$.
    The chart complex of $D$ consists of finite projective modules and becomes contractible after inverting $z_i$:
    away from $E$, both $F_Y$ and $G$ identify with the pullback of $F$.
    Clearing denominators in a contracting homotopy gives an exponent $m_i$ for which multiplication by
    $z_i^(m_i)$ is nullhomotopic on this chart. Trivializing $L$ shows that the same exponent works for every
    twist. It also works on all intersections contained in this chart. Choose $m$ at least as large as every $m_i$.
  The map $D \( j + m \) arrow.r D \( j \)$ is zero on the internal-homology page of the Cech double complex,
    since on each intersection it is identified with a nullhomotopic multiplication by a local equation to the
    power $m$. The Cech filtration has at most $h$ steps. The filtered-complex observation above therefore shows
    that $D \( j + h m \) arrow.r D \( j \)$ is zero on hyperhomology.
    Every larger twist map factors through one of these, so $M_D = h m$ works.
  For $a in I^(M_D)$, multiplication by $a$ on $D \( j \)$ factors as
  $ D \( j \) arrow.r^a D \( j + M_D \) arrow.r D \( j \) . $
  Thus $I^(M_D)$ annihilates its hyperhomology. If $M gt.eq M_D$, the long exact sequence for
  $ 0 arrow.r D \( j + M \) arrow.r D \( j \) arrow.r D \( j \) \/ D \( j + M \) arrow.r 0 $
  injects $bb(H)_k \( Y \, D \( j \) \)$ into the hyperhomology of the quotient.
    That quotient has a finite filtration by $E$-layers, each of whose terms is a finite sum of bundles
    $V \( t \) \|_E$. Their sheaf cohomology has finite length by Lemma 4.
    The two finite spectral sequences, first for each layer and then for the filtration,
    give finite length for the quotient’s hyperhomology and hence for that of $D \( j \)$. ◻
]

The Euler characteristics of finite thickenings need not recover that of $F$.
  For example, in the alternating-rank-zero case needed for the estimate,

$ sum_k \( - 1 \)^k lambda H_k \( F \/ I^M F \) = lambda \( C \/ I^M \) sum_i \( - 1 \)^i b_i = 0 . $

Instead, we compare the images of homology maps from a sufficiently large thickening to a fixed smaller one.
  These images will recover the homology of $F$ and of $F_Y$, modulo length zero.
  This argument gives the first assertion below without the alternating-rank hypothesis;
  that hypothesis is used only afterward to prove invariance under twists and the vector-bundle formula.

#thm([Lemma 2.5.])[
  #emph[One has
#[#set math.equation(numbering: n => "(2.7)")
 $ chi_lambda \( F_Y \) = sum_i \( - 1 \)^i lambda H_i \( F \) = lambda H_0 \( F \) . $ <eq:complex-euler-comparison>]

 If $sum_i \( - 1 \)^i b_i = 0$, then for every vector bundle $V$ pulled back from $bb(P)_(bb(Z))^(h - 1)$,
#[#set math.equation(numbering: n => "(2.8)")
 $ chi_lambda \( F_Y ⊗ V \) = \( "rank" V \) chi_lambda \( F_Y \) . $ <eq:complex-bundle-rank>]

]
] <lem:complex-euler-comparison>

#proof[
  #emph[Comparison on finite thickenings.] For each $M gt.eq 1$ there is a natural comparison
  #[#set math.equation(numbering: n => "(2.9)")
   $ F \/ I^M F arrow.r upright(bold(R)) Gamma \( Y \, F_Y \/ L^M F_Y \) . $ <eq:complex-thick-comparison>]
  Filter its two sides by powers of $I$ and $L$, respectively.
    At the $l$th layer, $0 lt.eq l < M$, comparison for each free summand is
  $ "gr"_I^l C arrow.r upright(bold(R)) Gamma \( E \, cal(O)_E \( l \) \) . $
  Lemma 4 says that this is an isomorphism on homology modulo length zero.
    The finite filtration, together with the finite complex $F$, proves the same assertion for (2.9).
    These comparisons commute with all transition maps as $M$ increases.
  #emph[The geometric tower.] We identify the eventual images of these two towers. On the geometric side put
  $ A = upright(bold(R)) Gamma \( Y \, F_Y \) \, wide B_M = upright(bold(R)) Gamma \( Y \, F_Y \/ L^M F_Y \) . $
  The triangles
  #[#set math.equation(numbering: n => "(2.10)")
   $ A arrow.r B_M arrow.r upright(bold(R)) Gamma \( Y \, F_Y ⊗ L^M \) \[ 1 \] arrow.r
     A \[ 1 \] $ <eq:complex-thick-triangle>]
  are compatible with the transition $N arrow.r M$ for $N gt.eq M$.
    Lemma 5 implies that $H_k \( A \) arrow.r H_k \( B_M \)$ is injective once $M$ is sufficiently large.
    It also says that the transition on the third terms of (2.10) is zero on homology once $N -
    M$ is sufficiently large. Exactness then gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ "im" #scale(x: 120%, y: 120%)[\(] H_k \( B_N \) arrow.r H_k \( B_M \) #scale(x: 120%, y: 120%)[\)] =
     "im" #scale(x: 120%, y: 120%)[\(] H_k \( A \) arrow.r H_k \( B_M \) #scale(x: 120%, y: 120%)[\)] tilde.equiv
     H_k \( A \) . $ <eq:complex-geometric-image>]
  The reverse inclusion in this equality uses only the compatible maps from $A$ to all $B_N$.
  #emph[The Koszul tower.] For the algebraic side first use $J_a = \( z_1^a \, dots.h \, z_h^a \)$ and $A_a =
    F ⊗ K_a$. The Koszul augmentation gives a compatible map
  $ A_a arrow.r F \/ J_a F $
  which is an isomorphism on homology modulo length zero. Indeed its cone is obtained by tensoring the bounded
    free complex $F$ with the cone of $K_a arrow.r C \/ J_a$; all homology of the latter cone has length zero by (2.1).
  The inclusion $F subset.eq A_a$ is the subcomplex in Koszul degree zero.
    For $a gt.eq a_0$ it is split on homology by (2.3). Let $Q_a = A_a \/ F$.
    The standard transition $K_b arrow.r K_a$, for $b gt.eq a$,
    is the identity in degree zero and multiplies the basis vector indexed by $T$ by $product_(j in T)
    z_j^(b - a)$. Filter $Q_a$ increasingly by Koszul degrees $1 \, dots.h \, p$, for $p = 1 \, dots.h \, h$.
    Its associated graded complexes are copies of shifts of $F$,
    and the transition on each such piece has a nonempty index set $T$.
    Choose $t$ with $I^t H \( F \) = 0$, as in Lemma 3. For $b - a gt.eq
    t$ every transition is zero on the homology of these graded pieces.
    A composition of $h$ such transitions is therefore zero on $H \( Q_a \)$.
    For example, $H \( Q_b \) arrow.r H \( Q_a \)$ is zero when $b - a gt.eq h t$.
    The long exact sequences for $0 arrow.r F arrow.r A_a arrow.r Q_a arrow.r 0$ now give,
    for $a$ sufficiently large and then $b$ sufficiently large,
  $ "im" #scale(x: 120%, y: 120%)[\(] H_k \( A_b \) arrow.r H_k \( A_a \) #scale(x: 120%, y: 120%)[\)] =
    "im" #scale(x: 120%, y: 120%)[\(] H_k \( F \) arrow.r H_k \( A_a \) #scale(x: 120%, y: 120%)[\)] tilde.equiv
    H_k \( F \) . $
  Passing through the Koszul augmentations proves this assertion modulo length zero for the tower $F \/ J_a F$.
  #emph[From Koszul powers to ordinary powers.] Here is explicitly why it passes to the ordinary-power tower
    $P_M = F \/ I^M F$. The containments
  #[#set math.equation(numbering: n => "(2.12)")
   $ I^(h \( a - 1 \) + 1) subset.eq J_a subset.eq I^a $ <eq:complex-cofinality>]
  give all the required quotient maps. Choose one sufficiently large $a$.
    For $M gt.eq h \( a - 1 \) + 1$, the composite $H_k \( F \) arrow.r H_k \( P_M \) arrow.r
    H_k \( F \/ J_a F \)$ proves injectivity of the first map modulo length zero.
    Next fix such an $M$, choose $a gt.eq M$ large, and choose $b gt.eq
    a$ so that the image from level $b$ to level $a$ in the $J$-tower is the image of $H_k \( F \)$.
    For $N gt.eq h \( b - 1 \) + 1$, the transition factors through
  $ P_N arrow.r F \/ J_b F arrow.r F \/ J_a F arrow.r P_M . $
  Its homology image is consequently contained in the image of $H_k \( F \)$ modulo length zero;
    compatibility gives the opposite containment. Thus the eventual image in the $P$-tower identifies with
    $H_k \( F \)$ modulo length zero.
  Choose $M$ and then $N$ large enough for both this description and (2.11).
    The compatible comparisons $P_N arrow.r B_N$ and $P_M arrow.r
    B_M$ in (2.9) identify the homology images of $P_N arrow.r P_M$ and $B_N arrow.r B_M$ modulo length zero.
    These images identify with $H_k \( F \)$ and $H_k \( A \)$, respectively, modulo length zero.
    All their lengths are finite by Lemma 3, (2.5), and Lemma 5. Therefore
  $ lambda bb(H)_k \( Y \, F_Y \) = lambda H_k \( F \) $
  for every $k$, which proves (2.7).
  #emph[Tensoring by a vector bundle.] The homology comparison is established.
    To prove (2.8), first compare consecutive twists of $F_Y$.
    The quotient of $F_Y \( j \)$ by $F_Y \( j + 1 \)$ has term $cal(O)_E \( j \)^(b_i)$ in degree $i$,
    so its Euler characteristic is
  $ (sum_i \( - 1 \)^i b_i) sum_v \( - 1 \)^v lambda H^v \( E \, cal(O)_E \( j \) \) = 0 . $
  Euler additivity shows that $chi_lambda \( F_Y \( j \) \)$ is independent of $j in bb(Z)$.
    Finally resolve $V$ on $bb(P)_(bb(Z))^(h - 1)$ by a finite complex of finite sums of twists, as in Lemma 4.
    The resolution remains exact on $Y$. Tensoring with $F_Y$ and taking Euler characteristics expresses
    $chi_lambda \( F_Y ⊗ V \)$ as the alternating sum of the corresponding twist characteristics.
    The alternating sum of the ranks of the resolution is $"rank" V$, giving (2.8). ◻
]

=== 2.5 Bundles with prescribed cohomological roots <bundles-with-prescribed-cohomological-roots>

We next construct the bundle that determines the signs of the needed Euler characteristic.
  We use the product-of-projective-lines construction of Eisenbud–Schreyer [8] Theorem 6.1,
  verifying its integral and base-change properties so that it applies over our auxiliary ring.

#thm([Lemma 2.6.])[
  #emph[Given integers $r_1 > dots.h.c > r_(h - 1)$, there is a vector bundle $V$ of rank $\( h - 1 \) !$ on
    $bb(P)_(bb(Z))^(h - 1)$ with the following property. For every ring $A$ and every integer $a$,
    $V \( a \)$ on $bb(P)_A^(h - 1)$ is acyclic if $a = r_j$ for some $j$.
    Otherwise its cohomology is a finite free $A$-module in the single degree
$ v \( a \) = \# { j : r_j > a } \, $

 and its Euler characteristic in ranks is
$ product_(j = 1)^(h - 1) \( a - r_j \) . $

 For $A = C \/ I$, the Euler characteristic with respect to $lambda$ is $mu product_j \( a - r_j \)$,
   and the same Euler characteristic and cohomology vanishing statements hold on $E$, modulo length zero.]
] <lem:complex-root-bundle>

#proof[
  Put $n = h - 1$. If $n = 0$, use the rank-one bundle on $bb(P)_(bb(Z))^0$.
    For $n > 0$, multiplication of binary linear forms defines
  $ f : \( bb(P)_(bb(Z))^1 \)^n arrow.r bb(P)_(bb(Z))^n \, wide f^(*) cal(O) \( 1 \) = cal(O) \( 1 \, dots.h \, 1 \) . $
  The map is proper and has finite geometric fibers, since a binary form has only finitely many ordered
    factorizations into linear factors, up to the scalars already removed by the projective coordinates.
    Hence $f$ is finite. On every field fiber, source and target are smooth of dimension $n$.
    Corresponding local rings have equal dimensions, since the residue field extension is finite and the
    dimensions are $n$ minus the respective residue-field transcendence degrees.
    Thus the source is Cohen–Macaulay and satisfies the dimension criterion for flatness over the regular
    target [28] Tag 00R4. This gives flatness on each field fiber.
    Since both schemes are flat over $bb(Z)$, the fiberwise flatness criterion [28] Tag 039D gives flatness of
    $f$. Over $bb(Q)$ the finite extension of function fields is separable.
    A geometric generic form has $n$ distinct factors and exactly $n !$ ordered factorizations.
    Its reduced geometric generic fiber therefore has $n !$ points, so the generic degree,
    and hence the constant rank of $f$, is $n !$.
  Define
  $ V = f_(*) cal(O) \( - 1 - r_1 \, dots.h \, - 1 - r_n \) . $
  Finite flatness makes this a vector bundle of rank $n !$, and its formation commutes with arbitrary base change.
    The projection formula reduces the cohomology of $V \( a \)$ to that of
    $cal(O) \( a - 1 - r_1 \, dots.h \, a - 1 - r_n \)$ on $\( bb(P)_A^1 \)^n$.
    On $bb(P)_A^1$, the bundle $cal(O) \( m \)$ has free cohomology only in degree zero for $m gt.eq 0$,
    only in degree one for $m lt.eq - 2$, and none for $m = - 1$; its Euler characteristic is $m + 1$.
    These computations commute with any base change and their complexes split over $bb(Z)$.
    Tensoring the complexes for the $n$ factors proves the asserted cohomological degree and product formula over
    every $A$. For $A = C \/ I$, a free module of rank $q$ has length $q mu$.
    The statements on $E$ follow from Lemma 4. ◻
]

=== 2.6 The sign and the leading coefficient <the-sign-and-the-leading-coefficient>

#proof[
  The homology assertions are Lemma 3. It remains to prove the estimate.
    We choose the bundle roots to serve two purposes: their positions force the hyperhomology of $G ⊗
    V$ into degree zero, modulo length zero, while their limiting values make every layer sum with $1 lt.eq
    i lt.eq h$ have the same leading term $\( h - 1 \) ! s^h$.
    The alternating-rank identity will then isolate $b_0$. The derivative of the following polynomial provides
    exactly these roots:
  $ H \( x \) = product_(i = 1)^h \( x + i \) \, $
  and write $rho_1 > dots.h.c > rho_(h - 1)$ for the roots of $H' \( x \)$. Rolle’s Theorem gives
  $ - \( j + 1 \) < rho_j < - j . $
  For all sufficiently large $s$, depending only on $h$, round $s rho_j$ to integers $r_j$ so that
  #[#set math.equation(numbering: n => "(2.13)")
   $ - \( j + 1 \) s < r_j < - j s \, wide \| r_j - s rho_j \| lt.eq 1 . $ <eq:complex-root-positions>]
  Let $V$ be the bundle of Lemma 7, and put $D = G ⊗ V$ with $G$ as in (2.6).
  We claim that
  #[#set math.equation(numbering: n => "(2.14)")
   $ chi_lambda \( D \) gt.eq 0 . $ <eq:complex-positive-chi>]
  In the $l$th $E$-layer of a twist of $D$, the term in homological degree $i$ is $V \( l - i s \) \|_E^(b_i)$.
    If $l gt.eq 0$, then (2.13) implies
  $ \# { j : r_j > l - i s } lt.eq i . $
  Indeed a root with index $j gt.eq i$ is strictly less than $- i s$, and for $i = 0$ all roots are negative.
    Thus the layer’s sheaf cohomology in degree $v > i$ has length zero.
    In the finite hyperhomology spectral sequence no term of negative total degree $i -
    v$ survives modulo length zero. Filtering by the layers $l = 0 \, dots.h \, M - 1$ shows that
  $ lambda bb(H)_k \( Y \, D \/ D \( M \) \) = 0 wide \( k < 0 \) . $
  For $M$ large, Lemma 5 makes the map on hyperhomology from $D \( M \)$ to $D$ zero.
    The quotient long exact sequence therefore injects $bb(H)_k \( Y \, D \)$ into
    $bb(H)_k \( Y \, D \/ D \( M \) \)$, proving length zero for $k < 0$.
  If $l < 0$, then
  $ \# { j : r_j > l - i s } gt.eq i - 1 . $
  For $i gt.eq 1$ this follows because every $j lt.eq i - 1$ has $r_j > - \( j + 1 \) s gt.eq - i s > l - i s$;
    for $i = 0$ the assertion is vacuous. Consequently the corresponding layer has hyperhomology of length zero in
    total degrees greater than $1$. Filtering the quotient with layers $l = - M \, dots.h \, - 1$ gives
  $ lambda bb(H)_k \( Y \, D \( - M \) \/ D \) = 0 wide \( k > 1 \) . $
  For large $M$ the map from $D$ to $D \( - M \)$ is zero on hyperhomology. The long exact sequence gives a surjection
  $ bb(H)_(k + 1) \( Y \, D \( - M \) \/ D \) arrow.r bb(H)_k \( Y \, D \) \, $
  and hence length zero for $k > 0$. Lemma 5 supplies finite length in all degrees.
    We have proved $chi_lambda \( D \) = lambda bb(H)_0 \( Y \, D \) gt.eq 0$, as claimed.
  The inclusion $F_Y ⊗ V subset.eq G ⊗ V$ has, in degree $i$, quotient $\( L^(- i s) \/ cal(O)_Y \) ⊗ V^(b_i)$,
    with successive layers $V \( l \) \|_E^(b_i)$ for $l = - i s \, dots.h \, - 1$.
    All Euler characteristics here are finite. Additivity, Lemma 6, and Lemma 7 give
  #[#set math.equation(numbering: n => "(2.15)")
   $ 0 lt.eq \( h - 1 \) ! lambda H_0 \( F \) + mu sum_(i = 0)^h \( - 1 \)^i b_i sum_(l = - i s)^(- 1)
     product_(j = 1)^(h - 1) \( l - r_j \) . $ <eq:complex-sum-estimate>]
  The sum for $i = 0$ is empty.
  We make the error in these sums explicit. Set
  $ P_s \( x \) = product_(j = 1)^(h - 1) \( x - r_j \/ s \) \, wide P \( x \) =
    product_(j = 1)^(h - 1) \( x - rho_j \) = frac(H' \( x \), h) . $
  On the fixed interval $\[ - h \, 0 \]$, (2.13) implies $parallel P_s - P parallel_oo = O_h \( s^(- 1) \)$,
    while $P$ and its derivative are bounded in terms of $h$ alone.
    The elementary error estimate for left-endpoint Riemann sums consequently gives, uniformly for $i = 1 \,
    dots.h \, h$,
  $ s^(- h) sum_(l = - i s)^(- 1) product_j \( l - r_j \) & = 1 / s sum_(l = - i s)^(- 1) P_s \( l \/ s \)\
 & = integral_(- i)^0 P \( x \) thin d x + O_h \( s^(- 1) \)\
 & = frac(H \( 0 \) - H \( - i \), h) + O_h \( s^(- 1) \) = \( h - 1 \) ! + O_h \( s^(- 1) \) . $
  Since $sum_(i = 1)^h \( - 1 \)^i b_i = - b_0$, substitution into (2.15) yields
  $ lambda H_0 \( F \) gt.eq mu s^h (b_0 - O_h (frac(sum_i b_i, s))) . $
  The error bound and the threshold for $s$ depend only on $h$.
    The homotopy exponents and truncation levels used earlier may depend on $C$, $F$, and $V$;
    they establish exact comparisons and vanishing modulo length zero and do not enter this numerical error.
    This proves (2.2) for all sufficiently large $s$. Increase $A_h$, if necessary,
    to be at least the threshold for $s$. For the remaining positive integers $s$,
    its right side is nonpositive because $b_0 lt.eq sum_i b_i$,
    so nonnegativity of length proves the same inequality. For $h =
    1$ the empty-product conventions give the argument directly, with exact sums and no error. The proof is complete. ◻
]

== 3 Normalized length algebras <sec:lengths>

We establish the length inputs for Theorem 2 and Lemma 3.
  The mixed-characteristic input uses the perfectoid results of Cai–Lee–Ma–Schwede–Tucker.
  We give the characteristic-$p$ argument in detail, including the passage to the non-Noetherian perfection.

For a Noetherian local ring $D$ of characteristic $p$ and a primary ideal of definition $H$,
  write $H^(\[ q \])$ for the ideal generated by the $q$th powers of elements of $H$, where $q = p^n$.
  Its Hilbert–Kunz multiplicity is

$ e_(upright("HK")) \( H \, D \) = lim_(q = p^n arrow.r oo) frac("ℓ"_D \( D \/ H^(\[ q \]) \), q^(dim D)) . $

The existence of this limit is Monsky’s theorem [23]; see also [20] Section 2.2.

#thm([Theorem 3.1.])[
  #emph[Let $\( D \, frak(d) \, k \)$ be a complete Noetherian local domain of dimension $h > 0$,
    with perfect residue field $k$ of characteristic $p > 0$.
    There exist a $D$-algebra $C$ and a function $lambda$, with values in $\[ 0 \, oo \]$,
    on $C$-modules annihilated by some power of $frak(d)$, with the following properties.]
  + #emph[The function is additive on short exact sequences and vanishes on the zero module.
    Direct sums, sums, and directed colimits of modules of length zero have length zero whenever a fixed power of
    $frak(d)$ annihilates all modules under consideration.]
  + #emph[For every system of parameters $z_1 \, dots.h \, z_h$ of $D$ and every integer $a gt.eq 1$,
$ lambda #scale(x: 120%, y: 120%)[\(] C \/ \( z_1^a \, dots.h \, z_h^a \) C #scale(x: 120%, y: 120%)[\)] =
  a^h e \( \( z_1 \, dots.h \, z_h \) \, D \) \, wide lambda H_i \( z_1^a \, dots.h \, z_h^a \; C \) =
  0 quad \( i > 0 \) . $

 In particular, the number $mu = lambda \( C \/ \( z_1 \, dots.h \, z_h \) C \)$ is positive and finite.]
  + #emph[If $H$ is $frak(d)$-primary, then
$
  cases(delim: "{", lambda \( C \/ H C \) = e_(H K) \( H \, D \) \, & "char" D = p \,, lambda \( C \/ H C \) lt.eq
  e \( H \, D \) \, & "char" D = 0 .) $

]
  #emph[The same zero-length stability applies to modules killed by a fixed power of an ideal extended from any
    $frak(d)$-primary ideal of $D$.]
] <thm:length-inputs>

For $I = \( z_1 \, dots.h \, z_h \) C$, assertions (1) and (2) supply the stability, parameter-length,
  and Koszul hypotheses of Theorem 2, with $mu = e \( \( z \) \, D \)$.
  Assertion (3) then connects the resulting zeroth-homology bound to ordinary multiplicities:
  it identifies the quotient length with Hilbert–Kunz multiplicity in characteristic $p$,
  and bounds it by Hilbert–Samuel multiplicity in mixed characteristic.

=== 3.1 The normalized length formalism <the-normalized-length-formalism>

We use Faltings’ normalized length [9] Appendix 2, developed further by Shimomoto [27] Section 2,
  in the formulation of [5] Section 2.2. Let $\( A \, frak(m)_A \, k \)$ be one of the complete regular local rings

$ A = k \[ \[ t_1 \, dots.h \, t_h \] \] quad upright("or") quad A = W \( k \) \[ \[ t_2 \, dots.h \, t_h \] \] \, $

and in the second case put $t_1 = p$. Choose compatible $p$-power roots and set

$ A_n = A \[ t_1^(1 \/ p^n) \, dots.h \, t_h^(1 \/ p^n) \] \, wide Lambda = "inj lim"_n A_n . $

Thus $Lambda = A_(upright("perf"))$ in characteristic $p$.
  In mixed characteristic $Lambda$ denotes the uncompleted tower; its $p$-adic completion is denoted by $A_oo$.

We consider the abelian category of $Lambda$-modules annihilated by $frak(m)_A^N$ for some integer $N$ depending
  on the module. The annihilation here is uniform over the whole module.
  In both constructions below we choose $A subset.eq D$ with $frak(m)_A subset.eq
  frak(d)$ and evaluate lengths by restriction of scalars. Thus every $C$-module killed by a power of $frak(d)$
  belongs to this category. A finitely presented module in this category descends to a finite-length $A_n$-module
  $M_n$, and its normalized length is

#[#set math.equation(numbering: n => "(3.1)")
 $ lambda_oo \( M_n ⊗_(A_n) Lambda \) = p^(- n h) "ℓ"_(A_n) \( M_n \) . $ <eq:normalized-finite-stage>]

The use of $A_n$-length instead of $A$-length makes no difference,
  because the two rings have the same residue field. For a finitely generated module the length is the infimum of
  the lengths of finitely presented modules surjecting onto it. For an arbitrary module it is then defined by

#[#set math.equation(numbering: n => "(3.2)")
 $ lambda_oo \( M \) = sup { lambda_oo \( N \) : N subset.eq M upright(" is finitely generated over ") Lambda } .
   $ <eq:normalized-supremum>]

These definitions are compatible and give an additive function on short exact sequences in this category [5]
  Definition 2.2.1 and Propositions 2.2.3, 2.2.6(a). In particular, length is monotone under submodules and quotients.

We record explicitly the consequences for infinite modules that we will need.

#thm([Lemma 3.2.])[
  #emph[Suppose that all the modules in the following assertions are annihilated by a fixed power of $frak(m)_A$.]
  + #emph[Direct sums, sums, and directed colimits of zero-length modules have length zero.]
  + #emph[If $M = union.big_n M_n$ is an increasing union of submodules, then $lambda_oo \( M \) =
    sup_n lambda_oo \( M_n \)$.]
  + #emph[If $M = "inj lim"_n M_n$ and $lambda_oo \( M_n \) arrow.r 0$, then $lambda_oo \( M \) = 0$.
    No injectivity assumption on the transition maps is required in this assertion.]
] <lem:normalized-limit>

#proof[
  A finitely generated submodule of a direct sum is contained in a finite subsum.
    If the summands have length zero, additivity gives length zero for each finite subsum,
    and (3.2) gives length zero for the direct sum. Both a sum of submodules and a directed colimit are quotients
    of direct sums, proving the first assertion. The common annihilating power ensures that those direct sums
    belong to the length category.
  For the second assertion, each finitely generated submodule of $M$ is contained in some $M_n$.
    Apply (3.2) and monotonicity.
  For the third assertion, let $N subset.eq M$ be finitely generated over $Lambda$.
    Representatives of a finite generating set lie in a common stage $M_(n_0)$.
    Consequently $N$ is contained in the image of $M_n$ in $M$ for every $n gt.eq n_0$.
    Monotonicity for submodules and quotients gives
  $ 0 lt.eq lambda_oo \( N \) lt.eq lambda_oo \( M_n \) wide \( n gt.eq n_0 \) . $
  The right side tends to zero. Now take the supremum over $N$. ◻
]

=== 3.2 Characteristic $p$ <characteristic-p>

Assume first that $D$ has characteristic $p$. The Cohen–Gabber normalization theorem [17] Theorem 1.1 provides a
  coefficient field $k subset.eq D$ and a system of parameters $t_1 \, dots.h \, t_h$ such that

$ A = k \[ \[ t_1 \, dots.h \, t_h \] \] subset.eq D $

is module-finite and generically separable; this is also the setup of [5] Section 3.
  Work inside a fixed algebraic closure of $"Frac" \( D \)$ and put

$ A' = A_(upright("perf")) \, wide C = D_(upright("perf")) \, wide K = "Frac" \( A \) \, quad L =
  "Frac" \( D \) \, quad K' = K_(upright("perf")) = "Frac" \( A' \) . $

We apply $lambda_oo$ to $C$-modules by restriction of scalars to $A'$.
  To compute these lengths, we approximate $C$ by algebras obtained from finite root stages of $D$.

For every $q = p^n$, define

$ B_q = A' ⊗_(A^(1 \/ q)) D^(1 \/ q) . $

The natural map from this tensor product to $C$ is injective.
  Indeed, $D^(1 \/ q)$ is torsion-free over $A^(1 \/ q)$, and $A'$ is flat over $A^(1 \/ q)$:
  the intervening extensions of regular power-series rings are free. Thus $B_q$ injects into

$ K' ⊗_(K^(1 \/ q)) L^(1 \/ q) . $

The latter ring is a field, because the finite separable extension $L^(1 \/ q) \/
  K^(1 \/ q)$ is linearly disjoint from the purely inseparable extension $K' \/ K^(1 \/ q)$.
  This identifies $B_q$ with the subring $A' D^(1 \/ q)$ of $C$. These subrings increase with $q$ and exhaust $C$:
  each contains $D^(1 \/ q)$, and every finite collection of their coefficients lies in a sufficiently high root
  extension of $D$.

We give a self-contained form of the finite-stage comparison in [5] Section 3 and Theorem 3.0.7,
  beginning with a trace-dual proof of the conductor bound from [25] Lemma 2.3.
  Although $B_q$ injects into $C$, passing to a primary quotient can create a kernel.
  The conductor bound below controls this kernel by giving elements that multiply $C$ into $B_q$.

#thm([Lemma 3.3.])[
  #emph[There is an element $0 eq.not g in A$ such that
$ g C subset.eq B_1 \, wide g^(1 \/ q) C subset.eq B_q quad \( q = p^n \) . $

]
] <lem:perfection-conductor>

#proof[
  The field $E = L K'$ is a finite separable extension of the perfect field $K'$, and is therefore perfect.
    Since it contains $L$ and is contained in $L_(upright("perf"))$, it equals $L_(upright("perf"))$.
    The ring $A'$ is normal: any integral equation and the finitely many fractions involved in an element of
    $"Frac" \( A' \)$ descend to some normal ring $A^(1 \/ q)$.
  Choose a $K$-basis $b_1 \, dots.h \, b_r$ of $L$ with $b_j in D$.
    Its trace-dual basis $beta_1 \, dots.h \, beta_r$ exists by separability.
    Since $\( A \\ { 0 } \)^(- 1) D = L$, there is $0 eq.not g in A$ with $g beta_j in D$ for every $j$.
    The same two bases are trace-dual after extending scalars to $K'$.
  Every $c in C$ is integral over $A'$, as is $g beta_j$. The trace $"Tr"_(E \/ K') \( g beta_j c \)$ is therefore
    integral over $A'$ and lies in $K'$, so normality puts it in $A'$. The trace-dual expansion now reads
  $ g c = sum_(j = 1)^r "Tr"_(E \/ K') \( g beta_j c \) b_j in A' D = B_1 . $
  Taking $q$-th roots inside the perfect ring $C$ gives the second inclusion, because $\( A' D \)^(1 \/ q) =
    A' D^(1 \/ q) = B_q$. ◻
]

We next calculate quotient lengths. Let $H$ be $frak(d)$-primary and put

$ M_q = B_q \/ H B_q \, wide N_q = "im" \( M_q arrow.r C \/ H C \) . $

Finite-stage normalization gives

#[#set math.equation(numbering: n => "(3.3)")
 $ lambda_oo \( M_q \) = q^(- h) "ℓ"_D \( D \/ H^(\[ q \]) \) . $ <eq:perfection-stage-quotient>]

To see this directly, $M_q$ is the flat base extension of $D^(1 \/ q) \/ H D^(1 \/ q)$ from $A^(1 \/ q)$ to $A'$.
  The $q$-th power isomorphism $D^(1 \/ q) arrow.r D$ identifies that quotient with $D \/ H^(\[ q \])$,
  preserving module length. Length over $A^(1 \/ q)$ equals length over $D^(1 \/ q)$ because their residue fields agree.

The kernel of $M_q arrow.r N_q$ is annihilated by $g^(1 \/ q)$.
  In fact, an element in $B_q ∩ H C$ is a finite sum of elements of $H$ times elements of $C$,
  and Lemma 10 puts its product with $g^(1 \/ q)$ in $H B_q$.
  For an endomorphism of a module of finite normalized length,
  additivity shows that kernel and cokernel have the same normalized length.
  Apply this to multiplication by $g^(1 \/ q)$ on $M_q$ to obtain

#[#set math.equation(numbering: n => "(3.4)")
 $ lambda_oo ker \( M_q arrow.r N_q \) & lt.eq lambda_oo \( 0 :_(M_q) g^(1 \/ q) \)\
 & = lambda_oo \( M_q \/ g^(1 \/ q) M_q \)\
 & = q^(- h) "ℓ"_D D \/ \( H^(\[ q \]) \, g \) . $ <eq:perfection-kernel-bound>]

This last quantity is $O \( q^(- 1) \)$. Indeed, choose $frak(d)^a subset.eq H$,
  and let $t$ be a number of generators of $H$. The pigeonhole containment

$ H^(t \( q - 1 \) + 1) subset.eq H^(\[ q \]) $

shows that $H^(\[ q \])$ contains an ordinary power of $frak(d)$ whose exponent is $O \( q \)$.
  If $g$ is a nonunit, the domain hypothesis gives $dim D \/ \( g \) lt.eq h - 1$,
  so Hilbert–Samuel growth on $D \/ \( g \)$ gives $"ℓ"_D D \/ \( H^(\[ q \]) \, g \) = O \( q^(h - 1) \)$.
  If $g$ is a unit, this length is zero.

Combining (3.3) and (3.4), we obtain

$ q^(- h) "ℓ"_D D \/ H^(\[ q \]) - O \( q^(- 1) \) lt.eq lambda_oo \( N_q \) lt.eq q^(- h) "ℓ"_D D \/ H^(\[ q \]) . $

The submodules $N_q$ increase and exhaust $C \/ H C$. They are all killed by $H$ and hence by one fixed power of
  $frak(m)_A$. The Hilbert–Kunz limit and Lemma 9 therefore give

#[#set math.equation(numbering: n => "(3.5)")
 $ lambda_oo \( C \/ H C \) = e_(H K) \( H \, D \) . $ <eq:perfection-hk>]

The quotient lengths are now identified. To obtain the remaining parameter assertions of Theorem 8,
  we first show that positive parameter Koszul homology has length zero;
  the Koszul Euler characteristic will then identify the parameter quotient length with Hilbert–Samuel
  multiplicity. Fix a system of parameters $z_1 \, dots.h \, z_h$ of $D$.
  Flatness at each stage and the $q$-th power isomorphism give

#[#set math.equation(numbering: n => "(3.6)")
 $ lambda_oo H_i \( z_1 \, dots.h \, z_h \; B_q \) = q^(- h) "ℓ"_D H_i \( z_1^q \, dots.h \, z_h^q \; D \) .
   $ <eq:perfection-koszul-stage>]

These are finite lengths: the finite-stage Koszul homology is a finitely generated module annihilated by a primary
  parameter ideal. The complex $K \( z_1 \, dots.h \, z_h \; D \)$ consists of finite free modules in degrees
  $0 \, dots.h \, h$, and its homology has finite length. The Frobenius homology estimate of Roberts [26],
  in the form [20] Theorem 2.4, thus gives

$ lim_(q = p^n arrow.r oo) q^(- h) "ℓ"_D H_i \( z_1^q \, dots.h \, z_h^q \; D \) = 0 wide \( i > 0 \) . $

This theorem requires a complete characteristic-$p$ local ring and a finite-free complex of length equal to its
  dimension with finite-length homology, all of which have just been checked.

Filtered colimits are exact for modules, so

$ H_i \( z_1 \, dots.h \, z_h \; C \) = "inj lim"_q H_i \( z_1 \, dots.h \, z_h \; B_q \) . $

Each module here is annihilated by $\( z_1 \, dots.h \, z_h \)$ and therefore by a fixed power of $frak(m)_A$.
  The third assertion of Lemma 9, applied to (3.6), proves

#[#set math.equation(numbering: n => "(3.7)")
 $ lambda_oo H_i \( z_1 \, dots.h \, z_h \; C \) = 0 wide \( i > 0 \) . $ <eq:perfection-koszul-zero>]

The same argument applies to every fixed parameter list $z_1^a \, dots.h \, z_h^a$.

Finally, the Koszul Euler characteristic formula for parameter ideals [28] Tag 0AZZ gives

$ sum_(i = 0)^h \( - 1 \)^i "ℓ"_D H_i \( z_1^q \, dots.h \, z_h^q \; D \) =
  e \( \( z_1^q \, dots.h \, z_h^q \) \, D \) = q^h e \( \( z_1 \, dots.h \, z_h \) \, D \) . $

Divide by $q^h$ and use the positive-homology limits. The degree-zero term tends to the Hilbert–Kunz multiplicity
  of the parameter ideal. Consequently

$ e_(H K) \( \( z_1 \, dots.h \, z_h \) \, D \) = e \( \( z_1 \, dots.h \, z_h \) \, D \) . $

Together with (3.5) and the parameter multiplicity power rule,
  it gives the quotient formulas in Theorem 8 in characteristic $p$.

===== 3.2.1 Finite-length modules. <finite-length-modules.>

For the Dutta-multiplicity consequence in Section 5, we also need the same comparison for a finite-length module,
  since zeroth homology need not be cyclic. For a $D$-module $M$, write

$ Phi_D^n \( M \) = D ⊗_(D \, phi_D^n) M $

for scalar extension along the $n$th Frobenius endomorphism $phi_D^n : D arrow.r D$.

#thm([Lemma 3.4.])[
  #emph[In the characteristic-$p$ setup above, let $M$ be a finite-length $D$-module.
    If the limit on the right exists, then
$ lambda_oo \( C ⊗_D M \) = lim_(q = p^n arrow.r oo) q^(- h) "ℓ"_D #scale(x: 120%, y: 120%)[\(] Phi_D^n \( M \)
  #scale(x: 120%, y: 120%)[\)] . $

]
] <lem:perfection-finite-length>

#proof[
  The assertion is immediate when $M = 0$. Otherwise put $J = "Ann"_D M$, a $frak(d)$-primary ideal,
    and let $b$ be a number of generators of $M$. Define
  $ M_q = B_q ⊗_D M \, wide N_q = "im" \( M_q arrow.r C ⊗_D M \) . $
  The module $M_q$ is obtained by flat scalar extension from $A^(1 \/ q)$ to $A'$ of $D^(1 \/ q) ⊗_D M$.
    Under the $q$th power isomorphism $D^(1 \/ q) tilde.equiv D$,
    the latter module corresponds to $Phi_D^n \( M \)$. It is a finite-length module over the Noetherian ring
    $A^(1 \/ q)$, so finite-stage normalization gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ lambda_oo \( M_q \) = q^(- h) "ℓ"_D #scale(x: 120%, y: 120%)[\(] Phi_D^n \( M \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:perfection-module-stage>]
  Here the lengths over $A^(1 \/ q)$ and $D^(1 \/ q)$ agree because their residue fields agree.
  By Lemma 10, multiplication by $g^(1 \/ q)$ defines a $D$-linear map $C arrow.r
    B_q$ whose composite $B_q arrow.r.hook C arrow.r B_q$ is multiplication by $g^(1 \/ q)$.
    After tensoring with $M$, this shows that $K_q = ker \( M_q arrow.r N_q \)$ is killed by $g^(1 \/ q)$.
    The finite normalized length in (3.8) permits the same kernel–cokernel calculation as in (3.4).
    Since $M$ is a quotient of $\( D \/ J \)^b$, it gives
  $ lambda_oo \( K_q \) & lt.eq lambda_oo \( M_q \/ g^(1 \/ q) M_q \)\
 & lt.eq b thin lambda_oo #scale(x: 120%, y: 120%)[\(] B_q \/ \( J \, g^(1 \/ q) \) B_q #scale(x: 120%, y: 120%)[\)]\
 & = b q^(- h) "ℓ"_D D \/ \( J^(\[ q \]) \, g \) = O \( q^(- 1) \) . $
  The last estimate is the Hilbert–Samuel growth argument from (3.4), with $J$ in place of $H$:
    $J^(\[ q \])$ contains a power of $frak(d)$ with exponent $O \( q \)$, and $dim D \/ \( g \) lt.eq h -
    1$ if $g$ is a nonunit. If $g$ is a unit, the error is zero.
  The submodules $N_q$ increase to $C ⊗_D M$ and are all killed by $J$, hence by one fixed power of $frak(m)_A$.
    Additivity, (3.8), and Lemma 9 now give the assertion by taking the limit. ◻
]

=== 3.3 Mixed characteristic <mixed-characteristic>

Assume now that $D$ has characteristic zero. Complete $p$ to a system of parameters $p \, t_2 \, dots.h \,
  t_h$ of $D$. Cohen structure gives a module-finite inclusion, with the same residue field,

$ A = W \( k \) \[ \[ t_2 \, dots.h \, t_h \] \] subset.eq D . $

It is generically separable because the fraction fields have characteristic zero.
  Let $A_oo$ be the $p$-adic completion of the tower above, and set

$ C = D_(upright("perfd"))^(A_oo) := \( D ⊗_A A_oo \)_(upright("perfd")) . $

The construction uses the perfectoidization of Bhatt–Scholze [4] Section 8 and Theorem 10.11;
  $C$ is the perfectoid algebra in [5] Notation 4.0.1. Use its normalized length $lambda_oo$,
  or equivalently restrict scalars to the uncompleted tower $Lambda$ when evaluating bounded
  $frak(m)_A$-power-torsion modules. Indeed, $Lambda$ is $p$-torsion-free,
  so $Lambda \/ p^N tilde.equiv A_oo \/ p^N$ for every $N$.
  A module annihilated by $frak(m)_A^N$ is annihilated by $p^N$;
  its submodules and finite generating sets are therefore the same over the two length bases.

For clarity, the exact perfectoid consequences used here are as follows.
  Choose $0 eq.not g in A$ such that $A \[ 1 \/ g \] arrow.r D \[ 1 \/ g \]$ is finite etale,
  and write $\( g \)_(upright("perfd"))$ for the almost ideal in [5] Notation 4.0.1.
  Corollary 4.0.4 of that paper says that the positive Koszul homology on $C$ of every system of parameters of
  $A_n ⊗_A D$ is annihilated by $\( g \)_(upright("perfd"))$.
  Taking $n = 0$ covers every system of parameters of $D$, not just the chosen parameters of $A$.
  Proposition 4.0.10 identifies the normalized lengths of $\( g \)_(upright("perfd"))$-almost-isomorphic
  $frak(m)_A$-power-torsion modules. In particular the Koszul homology just described has length zero.

Definition 4.0.8 and Corollary 4.0.18 of [5] give, for every $frak(d)$-primary ideal $H$,

$ lambda_oo \( C \/ H C \) = e_(upright("perfd")) \( H \, D \) lt.eq e \( H \, D \) \, $

with equality when $H$ is a parameter ideal. The equality for arbitrary parameter ideals is also the $n =
  0$ case of Proposition 4.0.14 there. Applying it to $\( z_1^a \, dots.h \, z_h^a \)$ and using the ordinary
  parameter multiplicity power rule yields

$ lambda_oo #scale(x: 120%, y: 120%)[\(] C \/ \( z_1^a \, dots.h \, z_h^a \) C #scale(x: 120%, y: 120%)[\)] =
  a^h e \( \( z_1 \, dots.h \, z_h \) \, D \) . $

All these statements apply to the same algebra $C$ and the same normalized length,
  while $z$ ranges over the systems of parameters of $D$.

We finish by checking the category and stability assertions in both characteristics.
  A module killed by a power of $frak(d)$ is killed by a power of $frak(m)_A$,
  so the length above is defined on it and is additive there.
  If $H$ is $frak(d)$-primary and $H^N M = 0$, choose $r$ with $frak(d)^r subset.eq H$; then $frak(m)_A^(r N) M =
  0$. Thus a common power of $H$ supplies the common annihilating power required by Lemma 9.
  The value $e \( \( z \) \, D \)$ is positive and finite. These observations prove all the remaining assertions
  of Theorem 8.

== 4 Reductions and a finite free complex <sec:reductions>

For maps of positive residue characteristic, our aim is to obtain a factorization $R arrow.r
  T arrow.r.twohead S$ with $e \( T \) = e \( R \)$ and a short free complex over $T$ supported at its closed
  point. The first reduction applies in every characteristic and handles arbitrary dimensions and residue fields.
  The construction that follows also controls the generic local rings of $T$;
  these will determine the coefficients in the final multiplicity sums.

=== 4.1 Completion, components, and residue fields <completion-components-and-residue-fields>

We first make reductions which do not impose any restriction on the characteristic or on the original residue
  fields. We use the following localization theorem for Hilbert–Samuel multiplicity:
  if $\( B \, frak(b) \)$ is an excellent local ring and $frak(q) in "Spec" B$ satisfies

$ dim \( B \/ frak(q) \) + dim B_(frak(q)) = dim B \, $

then $e \( B_(frak(q)) \) lt.eq e \( B \)$. This is Nagata’s localization theorem;
  the stated form is recalled in [20] Theorem 2.1. It does not require $B$ to be equidimensional.

#thm([Lemma 4.1.])[
  #emph[For every complete Noetherian local ring $\( B \, frak(b) \, k \)$ and every algebraic closure
    $overline(k)$ of $k$, there is a complete Noetherian local ring $B'$ and a flat local map $B arrow.r B'$ such that
$ frak(b) B' = frak(b)_(B') \, wide B' \/ frak(b)_(B') tilde.equiv overline(k) \, wide e \( B' \) = e \( B \) . $

]
] <lem:residue-extension>

#proof[
  In equal characteristic, choose a coefficient field and a presentation $B =
    k \[ \[ X_1 \, dots.h \, X_t \] \] \/ I$, and set
  $ B' = overline(k) \[ \[ X_1 \, dots.h \, X_t \] \] \/ I overline(k) \[ \[ X_1 \, dots.h \, X_t \] \] . $
  The map between the power series rings is flat. For example,
    this follows from the local flatness criterion modulo $\( X_1 \, dots.h \, X_t \)$:
    the variables form regular sequences in both rings, and the resulting map of coefficient fields is flat.
    The quotient map is therefore flat as well and has the asserted maximal ideal and residue field.
  In the remaining case the residue characteristic is $p > 0$,
    and the Cohen Structure Theorem [28] Tag 032A gives a presentation $B =
    V \[ \[ X_1 \, dots.h \, X_t \] \] \/ I$, where $V$ is a complete discrete valuation ring with uniformizer $p$
    and residue field $k$. We explain why $V$ admits a complete discrete valuation extension $V'$ with the same
    uniformizer and residue field $overline(k)$, even when $k$ is imperfect.
    Given a simple algebraic residue extension with irreducible minimal polynomial $overline(f)$,
    lift $overline(f)$ to a monic polynomial $f in V \[ X \]$.
    The algebra $V \[ X \] \/ \( f \)$ is finite free over $V$,
    and its quotient by $p$ is the desired residue field. Every maximal ideal lies over $\( p \)$,
    so this algebra is local with maximal ideal generated by $p$.
    The element $p$ is a nonzerodivisor, and the algebra has dimension one.
    It is consequently a discrete valuation ring. This argument does not require $overline(f)$ to be separable.
  Repeat this construction along a tower of simple algebraic extensions whose union is $overline(k)$.
    At limit stages take unions. Every nonzero element of such a union is $p^a$ times a unit for an integer $a
    gt.eq 0$; hence every nonzero ideal is generated by an element of least valuation.
    The union is again a discrete valuation ring with uniformizer $p$.
    Completing the final union gives the required $V'$. The extension $V arrow.r
    V'$ is flat because $V'$ is torsion-free over $V$. Now use
  $ B' = V' \[ \[ X_1 \, dots.h \, X_t \] \] \/ I V' \[ \[ X_1 \, dots.h \, X_t \] \] . $
  Flatness of the power series extension follows from the same local flatness criterion,
    this time with coefficient map $V arrow.r V'$.
  Finally, for any flat local map with extended maximal ideal,
    a composition series of a finite-length module remains a composition series after tensoring:
    each residue-field factor becomes the target residue field. In particular
  $ "ℓ"_(B') \( B' \/ frak(b)^N B' \) = "ℓ"_B \( B \/ frak(b)^N \) quad \( N gt.eq 1 \) . $
  The two Hilbert–Samuel functions, and therefore their degrees and multiplicities, agree. ◻
]

#thm([Lemma 4.2.])[
  #emph[To prove $e \( R \) lt.eq e \( S \)$ for all flat local maps of nonzero Noetherian local rings,
    it suffices to prove it when $R$ and $S$ are complete, $R$ is a domain, $dim R = dim S > 0$,
    and the residue field of $S$ is algebraically closed. The reduction preserves equal characteristic $p$ when
    both original rings have characteristic $p$.]
] <lem:reduction>

#proof[
  Completion preserves dimension and Hilbert–Samuel multiplicity,
    and a flat local map induces a flat map on completions. We can thus first assume that $R$ and $S$ are
    complete. Put $d = dim R$ and $f = dim \( S \/ frak(m) S \)$.
    The dimension formula for a flat local map gives $dim S = d + f$.
    Choose $Q$ minimal over $frak(m) S$ with $dim \( S \/ Q \) = f$. Going-down gives $dim S_Q gt.eq d$, whereas
  $ dim S gt.eq dim \( S \/ Q \) + dim S_Q gt.eq f + d = dim S . $
  All these inequalities are equalities. Since $S$ is excellent, Nagata’s theorem gives $e \( S_Q \) lt.eq
    e \( S \)$. The map $R arrow.r S_Q$ is flat local, its closed fiber has dimension zero, and $dim S_Q = d$.
    Replacing $S_Q$ by its completion preserves these properties.
    Thus a proof for this new target proves the original inequality.
  Choose a finite prime filtration of the $R$-module $R$, with factors $R \/ frak(p)_j$, allowing repetitions.
    Flatness gives a filtration of $S$ with factors $S \/ frak(p)_j S$. The flat local map
  $ R \/ frak(p)_j arrow.r S \/ frak(p)_j S $
  has the same zero-dimensional closed fiber, so its source and target have equal dimension.
    The additivity formula for multiplicity yields
  $ e \( R \) = sum_(dim \( R \/ frak(p)_j \) = d) e \( R \/ frak(p)_j \) \, wide e \( S \) =
    sum_(dim \( R \/ frak(p)_j \) = d) e \( S \/ frak(p)_j S \) . $
  It therefore suffices to prove the inequality for the indicated domain sources.
    Their quotients and the corresponding targets remain complete.
    If $d = 0$, each such source is a field and has multiplicity one,
    while a nonzero zero-dimensional local target has multiplicity equal to its positive length. This case is settled.
  For $d > 0$, apply Lemma 12 to the target. The resulting composite remains flat local and has the same target
    dimension and multiplicity. This proves the reduction. The argument also appears in [20] Lemma 2.2. ◻
]

=== 4.2 A factorization with a perfect kernel <a-factorization-with-a-perfect-kernel>

The passage from a flat local map to a short free complex follows the construction used by Iyengar–Ma–Walker [14]
  Proposition 8.3. We construct one auxiliary ring and one complex for both cases of positive residue
  characteristic, while also controlling the local rings needed to sum the component estimates.
  A #emph[perfect ideal] $J$ of a Noetherian local ring $T$ means an ideal for which $T \/
  J$ has finite projective dimension and

$ "pd"_T \( T \/ J \) = "grade"_T J . $

#thm([Proposition 4.3.])[
  #emph[Let $\( R \, frak(m) \) arrow.r \( S \, frak(n) \)$ be a flat local map of complete Noetherian local
    rings. Suppose $R$ is a domain, $dim R = dim S = d > 0$, the residue characteristic is $p > 0$,
    and the residue field $L$ of $S$ is algebraically closed. There is a factorization
$ R arrow.r \( T \, frak(t) \) arrow.r S = T \/ J $

 with the following properties. Write $b = dim \( T \/ frak(m) T \)$ and $h = d + b$.]
  + #emph[The ring $T$ is complete, its residue field is $L$, and $R arrow.r T$ is flat with regular closed fiber.
    Moreover $dim T = h$ and $e \( T \) = e \( R \)$.]
  + #emph[Every irreducible component of $T$ has dimension $h$.
    The ideal $J$ is perfect of grade $b$, and $S$ has a minimal finite free $T$-resolution $P_bullet$ in degrees
    $0 \, dots.h \, b$ with $P_0 = T$.]
  + #emph[Choose lifts $x_1 \, dots.h \, x_d in frak(t)$ of a minimal reduction of $frak(n)$. Then
$ F_bullet = P_bullet ⊗_T K_bullet \( x_1 \, dots.h \, x_d \; T \) $

 is a finite free complex in degrees $0 \, dots.h \, h$, has $F_0 = T$,
   and is contractible locally on $"Spec" T \\ { frak(t) }$.
   Its differential entries lie in $frak(t)$, and its ranks have alternating sum zero.]
  + #emph[If $Q in "Spec" T$ contracts to zero in $R$, then $T_Q$ is a complete intersection.
    In mixed characteristic, $T_Q$ is regular. Every prime of $T$ which is minimal over $J$ contracts to zero in
    $R$. In mixed characteristic $T$ is generically reduced; a prime $Q$ minimal over $J$ contains a unique
    minimal prime of $T$.]
] <prop:setup>

Parts (i)–(iii) preserve the source multiplicity and produce the complex to which Theorem 2 will apply.
  Part (iv) supplies the characteristic-dependent comparisons at primes $Q$ minimal over $J$.
  In characteristic $p$, its complete-intersection assertion will identify $e_(upright("HK")) \( J T_Q \, T_Q \)$
  with $"ℓ"_(T_Q) \( T_Q \/ J T_Q \)$ in Lemma 16. In mixed characteristic,
  regularity puts each such prime on exactly one component of $T$, so the later summation counts it only once.

#proof[
  #emph[Constructing $T$.] Let $k$ be the residue field of $R$.
    Choose a complete regular normalization $A subset R$ with residue field $k$, such that $R$ is finite over $A$.
    In equal characteristic, take a coefficient field $k subset R$ and a system of parameters $a_1 \, dots.h \,
    a_d$, giving $A = k \[ \[ a_1 \, dots.h \, a_d \] \]$. In mixed characteristic,
    choose a coefficient Cohen ring $V subset R$ and a system of parameters $p \, a_2 \, dots.h \, a_d$,
    giving $A = V \[ \[ a_2 \, dots.h \, a_d \] \]$. The Cohen Structure Theorem and completeness give finiteness
    in both cases; the maps from these power series rings are injective by dimension.
    No generic separability is required here.
  Apply the Cohen Factorization Theorem of Avramov–Foxby–Herzog [2] to $A arrow.r S$:
  $ A arrow.r \( U \, frak(u) \) arrow.r.twohead S \, $
  where $U$ is complete, $A arrow.r U$ is flat local, and its closed fiber is regular; see [20] Theorem 3.1.
    Regularity ascends along this map because both $A$ and the closed fiber are regular [28] Tag 031E.
    Thus $U$ is a regular local ring, with residue field $L$.
  Set $T = R ⊗_A U$. This is finite over $U$, and multiplication of the two given maps to $S$ induces a surjection
    $T arrow.r S$. Its closed fiber over $U$ is
  $ T \/ frak(u) T = \( R \/ frak(m)_A R \) ⊗_k L . $
  The ring $R \/ frak(m)_A R$ is local Artinian with residue field $k$.
    Its radical is nilpotent, so the displayed fiber is local Artinian with residue field $L$.
    A finite algebra over a complete local ring is a product of complete local rings;
    this fiber shows that there is only one factor. Hence $T$ is complete local with residue field $L$.
    Base change shows that $R arrow.r T$ is flat and
  $ T \/ frak(m) T tilde.equiv U \/ frak(m)_A U . $
  Its closed fiber is therefore regular of dimension $b$, and the flat dimension formula gives $dim T = d + b =
    h = dim U$.
  #figure(
    [
$ A & arrow.r & U &  & \
arrow.b &  & arrow.b &  & \
R & arrow.r & T = R ⊗_A U & arrow.r.twohead & S . $

],
    caption: [Figure 1: The construction of the auxiliary factorization. The square is a tensor-product square; $R$ is finite over $A$, and $A arrow.r U$ is flat local with regular closed fiber. The surjection to $S$ comes from its given $R$- and $U$-algebra structures. ],
  ) <fig:factorization>
  Figure 1 records the two operations in the construction: the finite normalization $A subset
    R$ and the Cohen factorization of $A arrow.r S$.
  #emph[Preserving multiplicity.] To check the multiplicity assertion,
    lift a regular system of parameters of $T \/ frak(m) T$ to $w_1 \, dots.h \, w_b in frak(t)$.
    Lifting regular sequences under a flat local map [28] Tag 00MG shows that $w$ is a $T$-regular sequence and
    $T \/ \( w \)$ is flat over $R$. Completeness defines the evaluation map
  $ R \[ \[ W_1 \, dots.h \, W_b \] \] arrow.r T \, wide W_i mapsto w_i . $
  The local flatness criterion modulo the variables [28] Tag 00ML makes this map flat.
    Its extended maximal ideal is $frak(t)$, because the images of $w$ generate the maximal ideal of the closed
    fiber. As in the last paragraph of Lemma 12, the Hilbert–Samuel functions are unchanged under a flat local map
    with extended maximal ideal. Adjoining formal variables preserves multiplicity,
    as follows also from the associated graded polynomial extension. Therefore
  $ e \( T \) = e \( R \[ \[ W_1 \, dots.h \, W_b \] \] \) = e \( R \) . $
  #emph[The resolution and the perfect kernel.] Start with a minimal free $T$-resolution of $S$,
    possibly infinite. Each syzygy is flat over $R$: inductively,
    the kernel of a surjection between $R$-flat modules with flat quotient is flat.
    Tensoring with $k$ over $R$ consequently preserves exactness and yields a minimal free resolution of $S \/
    frak(m) S$ over the regular local ring $T \/ frak(m) T$. That ring has global dimension $b$.
    Minimality, or Nakayama’s Lemma, therefore forces the original resolution to vanish in degrees greater than
    $b$. Thus $"pd"_T S lt.eq b$.
  The closed fiber $S \/ frak(m) S$ is zero-dimensional, so the image of $J$ in $T \/ frak(m)
    T$ is primary for its maximal ideal. Choose in this image a system of $b$ parameters and lift them to elements
    of $J$. Since the fiber is regular, this is a regular sequence on the fiber;
    flat regular-sequence lifting makes its lifts a $T$-regular sequence. Consequently
  $ b lt.eq "grade"_T J lt.eq "pd"_T S lt.eq b . $
  This proves perfection and identifies the length of the minimal resolution.
    The assertions include $b = 0$, when the regular sequence is empty and the resolution has only its degree-zero term.
  #emph[Components and the supported complex.] Because $R$ is a finite torsion-free $A$-module,
    it embeds in a finite free $A$-module. Flatness gives an embedding of $T$ in a finite free $U$-module.
    The contractions to $U$ of the associated primes of $T$ are thus zero.
    In particular every minimal prime $P$ of $T$ contracts to zero, and $T \/ P$ is finite integral over $U$.
    It follows that $dim \( T \/ P \) = dim U = h$.
  The field $L$ is infinite, so a minimal reduction of $frak(n)$ generated by $d$ elements exists.
    Lift its generators to $x$ in $T$. The ideal $J + \( x \)$ is $frak(t)$-primary.
    At a prime outside its vanishing set, either the localized resolution resolves zero and is split exact,
    or one of the $x_i$ is a unit and its Koszul complex is contractible.
    Hence $F_bullet$ is contractible off $frak(t)$. Minimality of the resolution and $x_i in
    frak(t)$ put all its differential entries in $frak(t)$. Its degree-zero term is $T$, and
  $ sum_i \( - 1 \)^i "rank" F_i = (sum_i \( - 1 \)^i "rank" P_i) \( 1 - 1 \)^d = 0 \, $
  where $d > 0$ is used.
  #emph[Local rings over the generic point of $R$.] Finally put $K = "Frac" \( A \)$ and $K_R = "Frac" \( R \)$.
    Localizing at $A \\ { 0 }$ gives
  $ T ⊗_A K tilde.equiv \( U ⊗_A K \) ⊗_K K_R . $
  Here $U ⊗_A K$ is regular, and $K_R \/ K$ is a finite field extension.
    Express this field extension as a finite tower of simple algebraic extensions.
    After base change each step is defined by a monic polynomial,
    which is a nonzerodivisor even if the intermediate ring is not reduced.
    The resulting local rings are quotients of regular local rings by regular sequences,
    hence complete intersections. Every $Q$ contracting to zero in $R$ belongs to this localization,
    proving the first assertion of (iv). In mixed characteristic the fields have characteristic zero,
    so $K_R \/ K$ is separable. The displayed extension is then finite etale, and its local rings are regular.
  Every minimal prime of $S$ contracts to a minimal prime of $R$ by flat going-down; that prime is zero.
    This applies to the primes of $T$ minimal over $J$. Moreover every minimal prime of $T$ avoids $A \\ {
    0 }$ by the preceding torsion-freeness argument, so in mixed characteristic its localization is a
    zero-dimensional regular local ring, namely a field. Thus $T$ is generically reduced.
    At a prime $Q$ minimal over $J$, the regular local ring $T_Q$ is a domain,
    which also shows that $Q$ contains exactly one minimal prime of $T$. ◻
]

#prodef([Remark 4.4.])[
  Since $T$ is complete and equidimensional, it is catenary and
  $ dim T_Q + dim \( T \/ Q \) = h wide \( Q in "Spec" T \) . $
  In particular a prime $Q$ containing $J$ with $dim \( T \/ Q \) = d$ is minimal over $J$ and has $dim T_Q = b$.
    In mixed characteristic its localization is regular by Proposition 14.
] <rem:setup-dimensions>

== 5 The characteristic-$p$ argument <sec:charp>

In characteristic $p$, Frobenius makes the differential entries of the complex from Proposition 14 arbitrarily
  deep. We apply Theorem 2 separately to each component of $T$ and add the resulting inequalities.
  The following Hilbert–Kunz identity identifies that sum with $e \( S \)$.

#thm([Lemma 5.1.])[
  (Ma’s Hilbert–Kunz identity).  #emph[Let $\( T \, frak(t) \)$ be a complete local ring of characteristic $p >
    0$ with perfect residue field, let $J$ be a perfect ideal, and put $S = T \/ J$.
    For any system of parameters $x_1 \, dots.h \, x_d$ of $S$,
$ e_(upright("HK")) \( J + \( x \) \, T \) = sum_(Q upright(" minimal over ") J\
dim \( T \/ Q \) = d) e \( \( x \) \, T \/ Q \) thin e_(upright("HK")) \( J T_Q \, T_Q \) . $

 If each $T_Q$ occurring in this sum is a complete intersection, then
$ e_(upright("HK")) \( J + \( x \) \, T \) = e \( \( x \) \, S \) . $

]
] <lem:ma-hk>

#proof[
  The first assertion is [20] Lemma 4.2. For the second, we use the following complete-intersection consequence
    from [20] Section 2.3 and Lemma 4.2: a primary ideal of finite projective dimension in a local complete
    intersection of characteristic $p$ has Hilbert–Kunz multiplicity equal to its colength.
    Since $J$ is perfect, $J T_Q$ is such an ideal in $T_Q$. Consequently
  $ e_(upright("HK")) \( J T_Q \, T_Q \) = "ℓ"_(T_Q) \( T_Q \/ J T_Q \) . $
  The Hilbert–Samuel associativity formula gives the conclusion.
    No assumption that $x$ extend to a parameter system of $T$ is involved. ◻
]

#thm([Theorem 5.2.])[
  #emph[For every flat local map $\( R \, frak(m) \) arrow.r \( S \, frak(n) \)$ of nonzero Noetherian local rings
    of characteristic $p > 0$, one has $e \( R \) lt.eq e \( S \)$.]
] <thm:positive-characteristic>

#proof[
  Lemma 13 reduces the problem to complete rings of the same positive dimension,
    with $R$ a domain and the residue field of $S$ algebraically closed.
    Use Proposition 14 to obtain $T \, J \, P_bullet \, F_bullet$ and the integers $d \, b \, h = d + b$. Set
  $ H = J + \( x_1 \, dots.h \, x_d \) T . $
  This is a $frak(t)$-primary ideal.
  Fix a minimal prime $P$ of $T$ and put $D = T \/ P$, with maximal ideal $frak(d)$.
    This is a complete local domain of dimension $h$ and has the same algebraically closed residue field.
    Choose a minimal reduction $\( z_1 \, dots.h \, z_h \)$ of $frak(d)$. There is an integer $c gt.eq 0$ such that
  $ frak(d)^n = \( z \)^(n - c) frak(d)^c subset.eq \( z \)^(n - c) wide \( n gt.eq c \) . $
  Take the $D$-algebra $C$ and its normalized length $lambda$ from Theorem 8.
    For $I = \( z \) C$ the length hypotheses of Theorem 2 hold with
  $ mu = e \( \( z \) \, D \) = e \( D \) . $
  For a power $q = p^n$, let $F_bullet \( q \)$ be the complex obtained by raising every matrix entry of the
    differentials of $F_bullet$ to its $q$th power. This is scalar extension by the $n$th Frobenius endomorphism
    of $T$ and has the same ranks as $F_bullet$. Its differential entries lie in $frak(t)^(\[ q \])$.
    Their images in $C$ therefore lie in
  $ frak(d)^(\[ q \]) C subset.eq frak(d)^q C subset.eq I^(q - c) . $
  Frobenius preserves the identities defining a contracting homotopy on each localization where $F_bullet$ is
    contractible. Subsequent scalar extension preserves those identities as well.
    Since $\( z \)$ is $frak(d)$-primary, the ideals $I$ and $frak(t) C$ have the same radical.
    Consequently $F_bullet \( q \) ⊗_T C$ is contractible locally off $V \( I \)$.
  The first differential of the resolution $P_bullet$ has entries generating $J$, and $P_0 = T$. Thus
  $ H_0 \( F_bullet \( q \) ⊗_T C \) = C \/ H^(\[ q \]) C . $
  Apply Theorem 2 with $s = q - c$, for $q > c$. Its degree-zero rank is one,
    and the ranks of all its terms are fixed as $q$ varies. The Hilbert–Kunz quotient formula from Theorem 8 and
    Frobenius scaling give
  $ q^h e_(upright("HK")) \( H D \, D \) & = e_(upright("HK")) \( \( H D \)^(\[ q \]) \, D \)\
 & = lambda \( C \/ H^(\[ q \]) C \)\
 & gt.eq e \( D \) \( q - c \)^h \( 1 - o \( 1 \) \) . $
  Dividing by $q^h$ and letting $q$ tend to infinity proves
  $ e_(upright("HK")) \( H D \, D \) gt.eq e \( D \) . $
  Every component of $T$ has dimension $h$ by Proposition 14.
    The associativity formulas for Hilbert–Kunz [13] Theorem 3.14 and Hilbert–Samuel multiplicities have the same
    generic length coefficients, so
  $ e_(upright("HK")) \( H \, T \) & = sum_(P in "Min" \( T \)) "ℓ"_(T_P) \( T_P \) thin
    e_(upright("HK")) \( H \( T \/ P \) \, T \/ P \)\
 & gt.eq sum_(P in "Min" \( T \)) "ℓ"_(T_P) \( T_P \) thin e \( T \/ P \) = e \( T \) . $
  In particular this summation does not assume that $T$ is reduced.
  We now verify the hypotheses of Lemma 16. The ring $T$ is complete of characteristic $p$,
    its residue field is algebraically closed and therefore perfect, and $J$ is perfect.
    For every minimal prime $Q$ of $J$ with $dim \( T \/ Q \) = d$,
    Proposition 14 shows that $T_Q$ is a complete intersection.
    The chosen $x$ is a system of parameters of $S = T \/ J$, and its ideal is a reduction of $frak(n)$. Hence
  $ e \( S \) = e \( \( x \) \, S \) = e_(upright("HK")) \( H \, T \) gt.eq e \( T \) = e \( R \) \, $
  as required. ◻
]

=== 5.1 Dutta multiplicity of short complexes <dutta-multiplicity-of-short-complexes>

The zeroth homology in the following consequence need not be cyclic.
  The finite-length-module comparison in Lemma 11 therefore takes the place of the Hilbert–Kunz quotient formula
  used above. We use the following terminology of Iyengar–Ma–Walker [14] Sections 2.5–2.6.

#prodef([Definition 5.3.])[
  Let $\( R \, frak(m) \)$ be a Noetherian local ring of characteristic $p > 0$ and dimension $d$.
    A #emph[short complex] over $R$ is a complex of finite free modules
  $ F = \( 0 arrow.r F_d arrow.r dots.h.c arrow.r F_0 arrow.r 0 \) $
  whose homology modules have finite length and for which $H_0 \( F \) eq.not 0$.
    For any bounded complex $G$ with finite-length homology, write
  $ chi_R \( G \) = sum_i \( - 1 \)^i "ℓ"_R H_i \( G \) . $
  When $G$ is finite free, let $Phi_R^n G$ denote scalar extension along the $n$th Frobenius endomorphism.
    Its #emph[Dutta multiplicity] is
  $ chi_oo^R \( G \) = lim_(n arrow.r oo) p^(- n d) chi_R \( Phi_R^n G \) . $
] <def:short-complex>

The limit exists; see [14] Section 4.17. For a short complex over a complete characteristic-$p$ local ring,
  the Frobenius homology theorem of Roberts, as recalled in [20] Theorem 2.4, states that

$ lim_(n arrow.r oo) p^(- n d) "ℓ"_R H_i \( Phi_R^n F \) = 0 wide \( i > 0 \) . $

Consequently

#[#set math.equation(numbering: n => "(5.1)")
 $ chi_oo^R \( F \) = lim_(n arrow.r oo) p^(- n d) "ℓ"_R H_0 \( Phi_R^n F \) . $ <eq:dutta-h0>]

This holds for arbitrary short complexes; it does not require their zeroth homology to be cyclic.

Iyengar, Ma, and Walker conjectured the lower bound in the next corollary for short complexes over all complete
  local rings [14] Conjecture 8.1. Here we prove the bound for complete domains of positive characteristic.

#thm([Corollary 5.4.])[
  (Dutta multiplicity over positive-characteristic domains).  #emph[Let $\( R \, frak(m) \)$ be a complete
    Noetherian local domain of characteristic $p > 0$, and let $F$ be a short complex over $R$. Then
$ chi_oo^R \( F \) gt.eq e \( R \) . $

]
] <cor:dutta-domain>

#proof[
  Put $d = dim R$. If $d = 0$, then $R$ is a field and $F_0$ is a nonzero free module, so $chi_oo^R \( F \) =
    "rank"_R F_0 gt.eq 1 = e \( R \)$. Assume $d > 0$. Splitting off contractible free summands makes $F$ minimal
    without changing its homology or Dutta multiplicity. Write $b_i = "rank"_R F_i$; in particular $b_0 gt.eq 1$.
  First suppose that the residue field is algebraically closed.
    Choose a minimal reduction $I = \( z_1 \, dots.h \, z_d \)$ of $frak(m)$.
    As in the proof of Theorem 17, there is a fixed integer $c gt.eq 0$ with
  $ frak(m)^q subset.eq I^(q - c) wide \( q gt.eq c \) . $
  Use the characteristic-$p$ algebra $C = R_(upright("perf"))$ and normalized length $lambda$ from Theorem 8.
    For any short complex $G$ over $R$, right exactness gives
  $ C ⊗_R H_0 \( G \) = H_0 \( C ⊗_R G \) \, wide Phi_R^n \( H_0 \( G \) \) = H_0 \( Phi_R^n G \) . $
  Lemma 11 and (5.1) therefore give
  $ lambda H_0 \( C ⊗_R G \) = chi_oo^R \( G \) . $
  Let $q = p^n$. The entries of the differentials of $Phi_R^n F$ lie in $frak(m)^(\[ q \]) subset.eq frak(m)^q
    subset.eq I^(q - c)$. Frobenius preserves a contracting homotopy at every localization where $F$ is
    contractible. Thus $Phi_R^n F$ again has finite-length homology;
    it is minimal and has nonzero zeroth homology, so it is short.
    Scalar extension to $C$ preserves the same contracting homotopies; since $I$ is $frak(m)$-primary,
    the extended complex is contractible locally off $V \( I C \)$.
    The defining Dutta limit, with its index shifted by $n$, now gives
  $ lambda H_0 \( C ⊗_R Phi_R^n F \) = chi_oo^R \( Phi_R^n F \) = q^d chi_oo^R \( F \) . $
  Moreover $sum_i \( - 1 \)^i b_i = 0$, since $F$ becomes exact over the fraction field of $R$.
    Apply Theorem 2 to $C ⊗_R Phi_R^n F$ with parameter ideal $I C$, depth $s = q - c$, and $mu = e \( I \, R \) =
    e \( R \)$. For $q > c$ it gives
  $ q^d chi_oo^R \( F \) gt.eq e \( R \) \( q - c \)^d (b_0 - frac(A_d, q - c) sum_(i = 0)^d b_i) . $
  After division by $q^d$, the right side tends to $b_0 e \( R \)$.
    Since $b_0 gt.eq 1$, this proves the corollary in this case.
  For an arbitrary residue field, Lemma 12 gives a complete flat local extension $\( R \, frak(m) \)
    arrow.r \( S \, frak(n) \)$ with $frak(n) = frak(m) S$, algebraically closed residue field, and $dim S = d$,
    $e \( S \) = e \( R \)$. Put $G = S ⊗_R F$. This is again a minimal short complex.
    Frobenius scalar extension commutes with this base change, and finite-length module lengths are preserved, so
  $ chi_oo^S \( G \) = chi_oo^R \( F \) \; $
  this invariance is also recorded in [14] Section 4.17. The ring $S$ need not be a domain,
    so we pass to its components by a prime filtration rather than apply the preceding case directly.
  Choose a finite prime filtration of the $S$-module $S$ with factors $D_j = S \/ P_j$, and put $h_j = dim D_j$.
    Additivity of Euler characteristic for the bounded free complex $Phi_S^n G$ gives
  $ chi_S \( Phi_S^n G \) = sum_j chi_S \( D_j ⊗_S Phi_S^n G \) . $
  The complexes in the sum have finite-length homology because the contracting homotopies off $frak(n)$ persist
    after tensoring. The Hochster–Huneke Frobenius homology estimate, in the form [3] Theorem 5.2,
    gives constants $C_j$ such that
  $ "ℓ"_S H_i \( D_j ⊗_S Phi_S^n G \) lt.eq C_j p^(n min { h_j \, d - i }) wide \( 0 lt.eq i lt.eq d \) . $
  Indeed, its complex has length $d$ and finite-length homology,
    and its finite coefficient module $D_j$ has dimension $h_j$.
    When $h_j < d$, every homology length in this summand is $O \( p^(n h_j) \)$,
    so its contribution divided by $p^(n d)$ tends to zero.
  When $h_j = d$, the ring $D_j$ is a complete local domain with the same algebraically closed residue field.
    The complex $D_j ⊗_S G$ is short over $D_j$: its homology is supported at the maximal ideal because the
    localized contracting homotopies persist, and its zeroth homology is nonzero because its matrices remain
    minimal and $b_0 gt.eq 1$. Inspecting differential matrices gives
  $ D_j ⊗_S Phi_S^n G tilde.equiv Phi_(D_j)^n \( D_j ⊗_S G \) . $
  Lengths of its homology over $S$ and $D_j$ agree. Taking limits,
    applying the already proved domain case to these factors,
    and using additivity of top-dimensional Hilbert–Samuel multiplicity along the prime filtration, we obtain
  $ chi_oo^R \( F \) = chi_oo^S \( G \) = sum_(h_j = d) chi_oo^(D_j) \( D_j ⊗_S G \) gt.eq
    sum_(h_j = d) e \( D_j \) = e \( S \) = e \( R \) . $
  This completes the proof. ◻
]

== 6 Mixed characteristic <sec:mixed>

We work one irreducible component at a time. Finite integral extensions make the differential entries deep enough
  to apply the uniform complex estimate. An upper bound for the resulting normalized length is obtained from a
  prime filtration, and is independent of those extensions after a separate parameter-power limit.
  The following two multiplicity estimates supply that upper bound.
  Whenever an ideal is used on a quotient ring, its image in that quotient is understood.

#thm([Lemma 6.1.])[
  #emph[Let $\( A \, frak(a) \)$ be a Noetherian local ring of positive dimension $t$,
    let $H$ be $frak(a)$-primary, and let $f in H$. If $dim A \/ \( f \) = t - 1$, then
$ e \( H \, A \) lt.eq e \( H \, A \/ \( f \) \) . $

]
] <lem:mixed-quotient>

#proof[
  Multiplication by $f$ induces a map $A \/ H^(j - 1) arrow.r A \/ H^j$ whose cokernel is $A \/ \( H^j \, f \)$.
    Consequently
  $ "ℓ"_A \( A \/ \( H^j \, f \) \) gt.eq "ℓ"_A \( A \/ H^j \) - "ℓ"_A \( A \/ H^(j - 1) \) . $
  For large $j$ these are Hilbert–Samuel polynomials. The polynomial on the right has leading coefficient
    $e \( H \, A \) \/ \( t - 1 \) !$, and the one on the left has leading coefficient
    $e \( H \, A \/ \( f \) \) \/ \( t - 1 \) !$. Comparing them proves the assertion, including the case $t = 1$. ◻
]

#thm([Lemma 6.2.])[
  #emph[Let $\( B \, frak(b) \)$ be a complete Noetherian local domain of dimension $h$, and let $1 lt.eq d lt.eq
    h$. Suppose that an ideal $L subset.eq frak(b)$ and elements $x_1 \, dots.h \,
    x_d in frak(b)$ satisfy $sqrt(L + \( x_1 \, dots.h \, x_d \)) = frak(b)$. Put
$ H_N = L + \( x_1^N \, dots.h \, x_d^N \) \, wide N gt.eq 1 . $

 The following assertions hold.]
  + #emph[If $dim B \/ L < d$, then $e \( H_N \, B \) = O \( N^(d - 1) \)$.]
  + #emph[If $L = frak(q)$ is prime, $dim B \/ frak(q) = d$, and $B_(frak(q))$ is regular, then
$ e \( H_N \, B \) lt.eq N^d e \( \( x_1 \, dots.h \, x_d \) \, B \/ frak(q) \) + O \( N^(d - 1) \) . $

]
  #emph[All constants concern the fixed data $B \, L \, x$ and are independent of $N$.]
] <lem:mixed-asymptotic>

#proof[
  Choose $a gt.eq 1$ with $frak(b)^a subset.eq L + \( x_1 \, dots.h \, x_d \)$, and set $r_N = d \( N - 1 \) + 1$.
    The pigeonhole principle for monomials gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ frak(b)^(a r_N) subset.eq #scale(x: 120%, y: 120%)[\(] L + \( x_1 \, dots.h \, x_d \)
     #scale(x: 120%, y: 120%)[\)]^(r_N) subset.eq L + \( x_1^N \, dots.h \, x_d^N \) =
     H_N . $ <eq:mixed-power-containment>]
  In particular, on any fixed nonzero quotient $A$ of $B$ of dimension $t lt.eq d - 1$,
    monotonicity of multiplicity under inclusion of primary ideals gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ e \( H_N \, A \) lt.eq e \( frak(b)^(a r_N) \, A \) = \( a r_N \)^t e \( frak(b) \, A \) =
     O \( N^(d - 1) \) . $ <eq:mixed-small-quotient>]
  This also applies when $t = 0$.
  To use this estimate, we will pass from $B$ to fixed quotients of smaller dimension.
    Quotienting by an element of $L$ that lowers the dimension by one can only increase the multiplicity of $H_N$,
    by Lemma 20. In the first case we will reach dimension $d - 1$.
    In the second case we will first reach dimension $d$, choosing the quotient so that its localization at
    $frak(q)$ is the residue field of $B_(frak(q))$. The component $B \/
    frak(q)$ will therefore have coefficient one in the associativity formula,
    while every other component of that quotient will admit one more dimension-lowering quotient.
  The ring $B$ is catenary and equidimensional. Thus, for every prime $frak(p) subset B$,
    one has $dim B \/ frak(p) = h - "ht" frak(p)$. We will also use the following consequence.
    A list of $j$ partial parameters in $B$ has all its minimal primes of height $j$:
    its quotient has dimension $h - j$, which gives the lower bound on these heights,
    and the generalized principal ideal theorem gives the upper bound. In particular its quotient is equidimensional.
  For the first assertion, select $h - d + 1$ partial parameters $v_1 \, dots.h \, v_(h - d + 1)$ in $L$.
    Here is the required prime avoidance argument. After $j < h - d + 1$ choices,
    a minimal prime of the preceding ideal has height $j$ and quotient dimension $h - j gt.eq d$.
    It cannot contain $L$, because $dim B \/ L < d$. Hence the next element can be chosen in $L$ outside all these
    finitely many primes. Each choice lowers the dimension by one.
    Applying Lemma 20 successively, with $H_N$ fixed, gives
  $ e \( H_N \, B \) lt.eq e \( H_N \, B \/ \( v_1 \, dots.h \, v_(h - d + 1) \) \) . $
  The quotient on the right is fixed and has dimension $d - 1$, so (6.2) proves the first assertion.
  For the second assertion put $c = h - d = "ht" frak(q)$. We choose $v_1 \, dots.h \,
    v_c in frak(q)$ that are partial parameters in $B$ and generate the maximal ideal of the regular local ring
    $B_(frak(q))$. To justify both conditions simultaneously, suppose that $v_1 \, dots.h \,
    v_j$ have been chosen, with $j < c$, and that their images in
  $ frak(q) B_(frak(q)) \/ \( frak(q) B_(frak(q)) \)^2 $
  are linearly independent over $kappa \( frak(q) \)$. Let $E_j$ be the contraction to $B$ of
  $ \( v_1 \, dots.h \, v_j \) B_(frak(q)) + \( frak(q) B_(frak(q)) \)^2 . $
  Since this cotangent space has dimension $c$, the ideal $frak(q)$ is not contained in $E_j$.
    Nor is it contained in any minimal prime of $\( v_1 \, dots.h \, v_j \)$: those primes have height $j < c$.
    Prime avoidance, with the single possibly nonprime ideal $E_j$,
    therefore supplies an element $v_(j + 1)$ in $frak(q)$ outside their union. This preserves both conditions.
    At the end, Nakayama’s Lemma gives
  $ \( v_1 \, dots.h \, v_c \) B_(frak(q)) = frak(q) B_(frak(q)) . $
  For $c = 0$ this is the empty list.
  Set $A = B \/ \( v_1 \, dots.h \, v_c \)$, which is equidimensional of dimension $d$.
    Repeated application of Lemma 20, followed by associativity of multiplicity, gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ e \( H_N \, B \) lt.eq e \( H_N \, A \) = sum_(frak(p) in "Min" \( A \)) "ℓ"_(B_(frak(p))) \( A_(frak(p)) \)
     thin e \( H_N \, B \/ frak(p) \) \, $ <eq:mixed-cut-associativity>]
  where primes of $A$ are identified with primes of $B$. The prime $frak(q)$ is one of these minimal primes,
    and its coefficient is
  $ "ℓ"_(B_(frak(q))) \( A_(frak(q)) \) = "ℓ"_(B_(frak(q))) \( B_(frak(q)) \/ frak(q) B_(frak(q)) \) = 1 . $
  On this component $H_N$ becomes $\( x_1^N \, dots.h \, x_d^N \)$.
    The parameter-ideal power formula therefore makes its contribution exactly $N^d
    e \( \( x_1 \, dots.h \, x_d \) \, B \/ frak(q) \)$.
  For any other prime $frak(p)$ in (6.3), the two distinct primes $frak(p)$ and $frak(q)$ have the same height $c$
    and are incomparable. Choose $w_(frak(p)) in frak(q) \\ frak(p)$.
    Its image is nonzero in the complete local domain $B \/ frak(p)$ of dimension $d$,
    and its quotient has dimension $d - 1$. It belongs to the image of every $H_N$. Thus Lemma 20 and (6.2) give
  $ e \( H_N \, B \/ frak(p) \) lt.eq e \( H_N \, B \/ \( frak(p) \, w_(frak(p)) \) \) = O \( N^(d - 1) \) . $
  The number of these components and their coefficients in (6.3) are fixed and finite.
    Summing proves the second assertion. ◻
]

#thm([Theorem 6.3.])[
  #emph[Assume the notation and conclusions of Proposition 14,
    and suppose that the source domain $R$ has mixed characteristic. Then
$ e \( S \) gt.eq e \( T \) = e \( R \) . $

]
] <thm:mixed-characteristic>

#proof[
  Write $frak(t)$ for the maximal ideal of $T$, and recall that $dim T = h$, $dim S = d > 0$, $S = T \/ J$, and
  $ F = P ⊗_T K \( x_1 \, dots.h \, x_d \; T \) \, $
  where $P$ is a finite free resolution of $S$, of length at most $h - d$.
    The complex $F$ has length at most $h$, has $F_0 = T$, and is contractible away from the closed point.
    Its differentials have entries in $frak(t)$, and its ranks have alternating sum zero.
    The images of $x_1 \, dots.h \, x_d$ form a minimal reduction of the maximal ideal of $S$;
    in particular $sqrt(J + \( x_1 \, dots.h \, x_d \)) = frak(t)$.
    The residue field, denoted by $k$, is algebraically closed.
  Fix a minimal prime $P_0$ of $T$ and put $B = T \/ P_0$, with maximal ideal $frak(b)$.
    By Proposition 14, $B$ is a complete local domain of mixed characteristic, has dimension $h$,
    and has residue field $k$. Choose a parameter ideal $\( u_1 \, dots.h \, u_h \)$ that reduces $frak(b)$.
  #emph[Finite extensions that make the differentials deep.] Fix an integer $q > h$ and choose roots $z_i =
    u_i^(1 \/ q)$ in an algebraic closure of $"Frac" \( B \)$.
    The ring $B' = B \[ z_1 \, dots.h \, z_h \]$ is a finite domain extension of $B$.
    It is complete local, has residue field $k$, and has dimension $h$.
    The ideal $\( z_1 \, dots.h \, z_h \)$ is primary for its maximal ideal.
    Since $frak(b)$ is integral over $\( u_1 \, dots.h \, u_h \)$,
    every element of $frak(b)$ is integral over $\( z_1 \, dots.h \, z_h \)^q B'$.
  Choose $a gt.eq 1$ with $p^a in \( z_1 \, dots.h \, z_h \) B'$, where $p$ is the residue characteristic.
    Apply Heitmann’s integral-extension form of the Briançon–Skoda Theorem [11],
    as stated in [12] Proposition 2.8 to the generating list
  $ p^a \, z_1 \, dots.h \, z_h $
  of the ideal $I = \( z_1 \, dots.h \, z_h \) B'$. This list has $n = h +
    1$ members and satisfies the theorem’s hypothesis $p in sqrt(\( p^a \, z_1 \) B')$.
    With $k' = q - h - 1 gt.eq 0$, its conclusion sends each element integral over $I^(n + k') =
    I^q$ into $I^(k' + 1) = I^(q - h)$ after an integral extension.
    Here redundant generators are allowed by the theorem’s statement.
    Apply it to a finite generating set of $frak(b)$. Taking a prime above zero in each extension if necessary
    gives integral domain extensions, which can be embedded in a common algebraic closure of $"Frac" \( B \)$.
    Adjoin the finitely many integral coefficients witnessing the resulting memberships.
    We obtain a domain $D$ finite over $B$ such that
  #[#set math.equation(numbering: n => "(6.4)")
   $ frak(b) D subset.eq \( z_1 \, dots.h \, z_h \)^(q - h) D . $ <eq:mixed-deep-entries>]
  We may replace $D$ by its normalization: it remains finite by excellence, and the inclusion persists.
    A finite algebra over a complete local ring is a product of complete local rings; since $D$ is a domain,
    there is just one factor. Thus $D$ is complete local of dimension $h$,
    and its residue field is $k$ because it is finite over the algebraically closed field $k$.
  Put $r = "rank"_B D$. For every $frak(b)$-primary ideal $H$,
    the finite-module multiplicity formula and equality of residue fields give
  #[#set math.equation(numbering: n => "(6.5)")
   $ e \( H D \, D \) = r e \( H \, B \) . $ <eq:mixed-rank-formula>]
  Indeed, a $"Frac" \( B \)$-basis of $D ⊗_B "Frac" \( B \)$ can be cleared of denominators to give an injection
    $B^r arrow.r D$ with torsion cokernel. This cokernel has dimension less than $h$,
    so it does not contribute to multiplicity. Moreover, lengths of finite-length $D$-modules are the same over
    $B$ and over $D$ because the residue fields agree. Applying (6.5) to $\( u_1 \, dots.h \, u_h \)$ and using
    the parameter-ideal power formula gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ q^h e \( \( z_1 \, dots.h \, z_h \) \, D \) = e \( \( u_1 \, dots.h \, u_h \) \, D \) =
     r e \( B \) . $ <eq:mixed-mu-normalization>]
  #emph[A lower bound for the normalized length.] Use the algebra $C$ and additive length $lambda$ supplied for
    $D$ by Theorem 8, and put $mu = e \( \( z_1 \, dots.h \, z_h \) \, D \)$.
    Extend $F$ along $T arrow.r B arrow.r D arrow.r C$. Its entries belong to $\( z_1 \, dots.h \, z_h \)^(q - h)
    C$ by (6.4). Local contractions survive this base change.
    The ideals $frak(t) D$ and $\( z_1 \, dots.h \, z_h \) D$ have the same radical,
    so the required support is also preserved. Theorem 2, with $s = q - h$ and zeroth rank one,
    therefore gives a constant $K$ depending only on $h$ and the fixed ranks of $F$ such that
  $ lambda \( C \/ \( J \, x_1 \, dots.h \, x_d \) C \) gt.eq mu \( q - h \)^h (1 - frac(K, q - h)) $
  for all sufficiently large $q$. Together with (6.6), this reads
  #[#set math.equation(numbering: n => "(6.7)")
   $ frac(lambda \( C \/ \( J \, x_1 \, dots.h \, x_d \) C \), r) gt.eq
     e \( B \) (1 - h / q)^h (1 - frac(K, q - h)) . $ <eq:mixed-lower-bound>]
  In particular, $K$ is independent of the choices of $D$, $C$, and $lambda$ as $q$ varies.
  #emph[The power rule for the quotient lengths.] For now keep $q$, $D$, $C$, and $lambda$ fixed.
    For every list of positive integers $a_1 \, dots.h \, a_d$, consider
  $ F \( a \) = P_C ⊗_C K \( x_1^(a_1) \, dots.h \, x_d^(a_d) \; C \) . $
  Before base change this complex is contractible away from the closed point:
    outside $V \( J \)$ the resolution $P$ is split exact, and outside $V \( x_1 \, dots.h \, x_d \)$ the Koszul
    complex is contractible. Its length is at most $h$. Lemma 3 therefore shows that its positive homology has
    $lambda$-length zero and that its zeroth homology has finite $lambda$-length. Thus
  $ chi_lambda \( F \( a \) \) := sum_i \( - 1 \)^i lambda \( H_i \( F \( a \) \) \) =
    lambda \( C \/ \( J \, x_1^(a_1) \, dots.h \, x_d^(a_d) \) C \) . $
  To check the power rule without any finiteness assumption on partial Koszul complexes,
    fix all exponents but $a_i$, and let $E$ denote $P_C$ tensored with the remaining Koszul factors.
    For positive integers $v \, w$, the composable scalar maps $x_i^v \, x_i^w$ on $E$ give the mapping-cone triangle
  $ "Cone" \( x_i^v : E arrow.r E \) arrow.r "Cone" \( x_i^(v + w) : E arrow.r E \) arrow.r
    "Cone" \( x_i^w : E arrow.r E \) arrow.r "Cone" \( x_i^v : E arrow.r E \) \[ 1 \] . $
  Every cone includes a positive power of each $x_j$, so all three have finite homology lengths by the preceding
    argument. Additivity of $lambda$ in their long exact homology sequence gives additivity of Euler
    characteristic. Hence that Euler characteristic is linear in each positive exponent.
    Applying this to all $d$ exponents proves
  #[#set math.equation(numbering: n => "(6.8)")
   $ lambda \( C \/ \( J \, x_1^N \, dots.h \, x_d^N \) C \) =
     N^d lambda \( C \/ \( J \, x_1 \, dots.h \, x_d \) C \) wide \( N gt.eq 1 \) . $ <eq:mixed-length-power-rule>]
  No assertion that the homology of $E$ itself has finite length was needed.
  #emph[An upper bound from a prime filtration.] Fix a finite prime filtration
  $ 0 = S_0 subset S_1 subset dots.h.c subset S_m = S \, wide S_j \/ S_(j - 1) tilde.eq T \/ Q_j . $
  All $Q_j$ contain $J$; the list records repetitions. Set
  $ M_N = C \/ \( x_1^N \, dots.h \, x_d^N \) C \, wide H_(j \, N) = Q_j B + \( x_1^N \, dots.h \, x_d^N \) B . $
  Tensoring each filtration sequence with $M_N$ gives a right exact sequence
  $ S_(j - 1) ⊗_T M_N arrow.r S_j ⊗_T M_N arrow.r C \/ H_(j \, N) C arrow.r 0 . $
  Every module here is killed by $J + \( x_1^N \, dots.h \, x_d^N \)$,
    whose extension to $D$ is primary for its maximal ideal. Their lengths are finite:
    for example, each $S_j ⊗_T M_N$ is a quotient of a finite direct sum of
    $C \/ \( J \, x_1^N \, dots.h \, x_d^N \) C$. The image of the first arrow is a quotient of its source,
    so additivity and nonnegativity of $lambda$ yield
  $ lambda \( S_j ⊗_T M_N \) lt.eq lambda \( S_(j - 1) ⊗_T M_N \) + lambda \( C \/ H_(j \, N) C \) . $
  Summing these inequalities, applying the primary-ideal bound from Theorem 8, and then applying (6.5), we obtain
  #[#set math.equation(numbering: n => "(6.9)")
   $ lambda \( C \/ \( J \, x_1^N \, dots.h \, x_d^N \) C \) lt.eq
     sum_(j = 1)^m lambda \( C \/ H_(j \, N) C \) lt.eq r sum_(j = 1)^m e \( H_(j \, N) \, B \) .
     $ <eq:mixed-filtration-bound>]
  Thus this use of the prime filtration requires only right exactness of tensor product, not flatness of $C$ over $T$.
  We apply Lemma 21 to each term of the last sum. Since $Q_j supset.eq J$, one has $dim T \/ Q_j lt.eq d$.
    If $dim T \/ Q_j < d$, then also $dim B \/ Q_j B < d$. If $P_0$ is not contained in $Q_j$,
    its image in the domain $T \/ Q_j$ is nonzero, and hence
  $ dim B \/ Q_j B = dim T \/ \( P_0 + Q_j \) < dim T \/ Q_j lt.eq d . $
  In either case the first assertion of the Lemma gives $e \( H_(j \, N) \, B \) = O \( N^(d - 1) \)$.
  The remaining case is $dim T \/ Q_j = d$ and $P_0 subset.eq Q_j$. Such a $Q_j$ is minimal over $J$:
    a strictly smaller prime over $J$ would give a quotient of dimension greater than $d$.
    The generic regularity in Proposition 14 gives that $T_(Q_j)$ is regular.
    It follows that $Q_j$ contains exactly one minimal prime of $T$, namely $P_0$, and
  $ B_(Q_j B) = T_(Q_j) . $
  Indeed the localization of $P_0$ is the unique minimal prime of the regular local domain $T_(Q_j)$ and is
    therefore zero. The second assertion of Lemma 21 now gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ e \( H_(j \, N) \, B \) lt.eq N^d e \( \( x_1 \, dots.h \, x_d \) \, T \/ Q_j \) +
     O \( N^(d - 1) \) . $ <eq:mixed-component-asymptotic>]
  #emph[The two limits and the component sum.] Divide (6.9) by $r N^d$ and use (6.8).
    Let $N$ tend to infinity while keeping the chosen $q \, D \, C \, lambda$ fixed.
    The preceding asymptotic estimates imply
  #[#set math.equation(numbering: n => "(6.11)")
   $ frac(lambda \( C \/ \( J \, x_1 \, dots.h \, x_d \) C \), r) lt.eq
     sum_(1 lt.eq j lt.eq m thin : med dim T \/ Q_j = d\
P_0 subset.eq Q_j) e \( \( x_1 \, dots.h \, x_d \) \, T \/ Q_j \) . $ <eq:mixed-uniform-upper-bound>]
  The right side does not involve any auxiliary extension or length algebra.
    Combine this bound with (6.7) and then let $q$ tend to infinity. Uniformity of $K$ gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ e \( T \/ P_0 \) lt.eq sum_(1 lt.eq j lt.eq m thin : med dim T \/ Q_j = d\
P_0 subset.eq Q_j) e \( \( x_1 \, dots.h \, x_d \) \, T \/ Q_j \) . $ <eq:mixed-one-component>]
  There is no exchange of limits: the $N$-limit was taken separately for each fixed choice of the data belonging to $q$.
  Finally sum (6.12) over the minimal primes $P_0$ of $T$. The ring $T$ is equidimensional and generically reduced
    by Proposition 14; its generic local lengths are therefore all one, and associativity gives
  $ e \( T \) = sum_(P_0 in "Min" \( T \)) e \( T \/ P_0 \) . $
  Every $Q_j$ of dimension $d$ belongs to exactly one of these components, because $T_(Q_j)$ is regular.
    Thus summation counts each occurrence of $Q_j$ in the filtration exactly once.
    The number of occurrences of a fixed such prime $Q$ is $"ℓ"_(T_Q) \( S_Q \)$,
    as seen by localizing the filtration at $Q$. The multiplicity formula for $S$ consequently yields
  $ e \( T \) lt.eq sum_(1 lt.eq j lt.eq m thin : med dim T \/ Q_j = d)
    e \( \( x_1 \, dots.h \, x_d \) \, T \/ Q_j \) = e \( \( x_1 \, dots.h \, x_d \) \, S \) = e \( S \) . $
  The equality $e \( T \) = e \( R \)$ from Proposition 14 finishes the proof. ◻
]

== 7 Residue characteristic zero <sec:charzero>

We deduce the residue-characteristic-zero case from Theorem 17 by encoding a hypothetical strict counterexample in
  finitely many polynomial equations. We follow the reduction-and-approximation strategy of [20] Section 5,
  beginning with the finite free reduction of [20] Lemma 5.1.
  For the subsequent transfer, it is enough to preserve a lower bound for the source multiplicity and an upper
  bound for the target multiplicity. This allows us to use a presentation matrix and finitely many initial
  relations, without keeping track of the homology of a resolution.

=== 7.1 A finite free map with a common coefficient field <a-finite-free-map-with-a-common-coefficient-field>

#thm([Lemma 7.1.])[
  #emph[Let $\( R \, frak(m) \) arrow.r \( S \, frak(n) \)$ be a flat local map between complete Noetherian local
    rings of equal dimension and residue characteristic zero. There is a factorization
$ R arrow.r R' arrow.r S $

 such that $R'$ is complete local, $e \( R' \) = e \( R \)$, and $R' arrow.r S$ is finite free.
   Moreover, $R'$ and $S$ have the same coefficient field and the same residue field.]
] <lem:charzero-finite-free>

#proof[
  Choose a coefficient field $k subset R$, and identify it with its image in $S$. Put $L = S \/ frak(n)$.
    A coefficient field of $S$ containing this copy of $k$ can be chosen as follows.
    Lift a transcendence basis of $L \/ k$ to $S$. These lifts generate a copy of the corresponding rational
    function field, because a polynomial with nonzero residue is a unit whenever it occurs as a denominator.
    The remaining algebraic extension of residue fields is separable.
    Hensel’s lemma lifts each simple algebraic root, and a maximal compatible choice, obtained by Zorn’s lemma,
    lifts all of $L$. We henceforth identify this coefficient field with $L$.
  Choose a presentation $R = k \[ \[ X_1 \, dots.h \, X_a \] \] \/ I$ and set
  $ R' = L \[ \[ X_1 \, dots.h \, X_a \] \] \/ I L \[ \[ X_1 \, dots.h \, X_a \] \] . $
  The compatible maps from $R$ and $L$ to $S$ give a local map $R' arrow.r S$.
    Extension of coefficient fields on power series rings is flat; for example,
    the local criterion of flatness applies to the regular sequence of variables and the field extension on their
    quotients. Thus $R arrow.r R'$ is flat, its maximal ideal is $frak(m)' = frak(m) R'$,
    and its residue field is $L$. Filtering by powers of the maximal ideal gives
  $ "gr"_(frak(m)') R' tilde.equiv \( "gr"_(frak(m)) R \) ⊗_k L . $
  In particular, $dim R' = dim R$ and $e \( R' \) = e \( R \)$.
  The flat dimension formula for the original map shows that $S \/ frak(m) S$ is Artinian.
    Since $frak(m)' S = frak(m) S$, this quotient is a finite-dimensional $L$-vector space.
    Lift an $L$-basis to $s_1 \, dots.h \, s_q in S$. Successively expressing a remainder modulo $frak(m)' S$,
    then modulo $\( frak(m)' S \)^2$, and so on, expresses every element of $S$ as $sum_i a_i s_i$ with $a_i in
    R'$. Indeed, the coefficient corrections at step $j$ lie in $\( frak(m)' \)^j$, so they converge in $R'$,
    and the remainders tend to zero in $S$: the $frak(m)' S$-adic and $frak(n)$-adic topologies agree.
    Hence $S$ is finite over $R'$.
  Let $P_bullet$ be a free resolution of $k$ over $R$. Flatness of $R'$ over $R$ makes $P_bullet ⊗_R
    R'$ a free resolution of $L$ over $R'$. Therefore
  $ "Tor"_1^(R') \( L \, S \) = H_1 \( P_bullet ⊗_R S \) = "Tor"_1^R \( k \, S \) = 0 . $
  A finite module over a Noetherian local ring with this vanishing is free.
    Thus $R' arrow.r S$ is finite free, necessarily of positive rank. ◻
]

=== 7.2 Encoding the multiplicity bounds <encoding-the-multiplicity-bounds>

#thm([Lemma 7.2.])[
  #emph[Let $\( R_0 \, frak(m)_0 \) arrow.r \( S_0 \, frak(n)_0 \)$ be a finite free local map of complete local
    rings of dimension $d > 0$, with a common infinite coefficient field $L$ and residue field $L$.
    Put $r = e \( R_0 \)$. There is a finite system
$ F \( t_1 \, dots.h \, t_d \, Y_1 \, dots.h \, Y_N \) = 0 $

 of polynomial equations over $bb(Z)$ with a solution in $L \[ \[ t_1 \, dots.h \, t_d \] \]$,
   having the following property. For every field $K$ and every solution in $A =
   K \[ \[ t_1 \, dots.h \, t_d \] \]$, the solution determines a finite free local map
$ \( R \, frak(a) \) arrow.r \( S \, frak(b) \) $

 of nonzero complete local rings of dimension $d$ and residue field $K$, for which
$ e \( R \) gt.eq r \, wide e \( S \) lt.eq e \( S_0 \) . $

]
] <lem:charzero-certificate>

#proof[
  Choose a minimal reduction $t_1 \, dots.h \, t_d$ of $frak(m)_0$. The induced map
  $ A_0 = L \[ \[ t_1 \, dots.h \, t_d \] \] arrow.r R_0 $
  is finite, by completeness and the parameter property. It is injective:
    a nonzero kernel in the regular local domain $A_0$ would force the dimension of its finite algebra $R_0$ to be
    less than $d$. Since the residue fields agree, the finite-module multiplicity formula and the reduction
    property give
  #[#set math.equation(numbering: n => "(7.1)")
   $ r = e \( R_0 \) = e \( \( t \) \, R_0 \) = "rank"_(A_0) R_0 . $ <eq:charzero-original-rank>]
  Here no domain or Cohen–Macaulay hypothesis on $R_0$ is needed.
    For completeness, a finite module of rank $r$ over $A_0$ contains a copy of $A_0^r$ with torsion cokernel;
    the cokernel has dimension less than $d$, so additivity of multiplicity gives the last equality.
  We describe the finite system. Throughout the construction,
    an equality in a presented module means a coordinate equality with an additional vector witnessing membership
    in its relation submodule. Thus, for a matrix $U$, the assertion $w in "im" U$ is encoded by $w =
    U c$ with a new vector of unknowns $c$. The number of coordinates and assertions below is always fixed and finite.
  The system records the algebra structures, freeness, and locality.
    The numerical conditions use the source’s generic rank for a lower multiplicity bound and the dimensions of
    the target’s associated graded pieces for an upper bound.
  #emph[The source algebra and its generic rank.] Fix a presentation
  $ A_0^v arrow.r^(U_0) A_0^u arrow.r R_0 arrow.r 0 . $
  The entries of a matrix $U$ of this same size are unknowns.
    On $A^u$, specify a bilinear multiplication by vectors $c_(i j) in
    A^u$ giving the products of standard basis vectors, and specify a unit vector $epsilon.alt in A^u$.
    Impose the following identities modulo $"im" U$: commutativity and associativity on basis vectors,
    the two unit identities on basis vectors, and the assertion that a relation column multiplied by any basis
    vector is again in $"im" U$. These identities give a unital commutative $A$-algebra structure on
  $ R = "coker" U . $
  They are polynomial equations in the entries of $U$, the multiplication table, $epsilon.alt$,
    and the membership witnesses.
  Impose also the vanishing of all $\( u - r + 1 \)$-minors of $U$.
    If there are no minors of that size, this condition is empty. Over the fraction field of $A$, it gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ "rank"_A R = u - "rank" U gt.eq r > 0 . $ <eq:charzero-rank-bound>]
  These equations are satisfied by the original presentation in view of (7.1).
    A solution may give $U$ smaller rank, but this only increases the rank of its cokernel.
    To turn that rank bound into a multiplicity bound, we will retain the source reduction $\( t \)$ as well.
  #emph[The target as a free source-module.] Let $n > 0$ be the original free rank of $S_0$ over $R_0$.
    Define the underlying module of the new target to be $S = R^n$. Give it an $R$-bilinear multiplication by specifying
  $ eta_i eta_j = sum_(h = 1)^n d_(i j h) eta_h \, wide d_(i j h) in R \, $
  and a unit $delta in R^n$. Represent these coefficients and this unit by vectors over $A$.
    Impose commutativity, associativity, and the unit identities on the $R$-basis $eta_1 \, dots.h \, eta_n$.
    The underlying $A$-module is presented by the block diagonal matrix with $n$ copies of $U$,
    so these are again finitely many polynomial equations, using the source multiplication table and relation
    witnesses. The structural map is $a mapsto a delta$. Consequently, in every solution,
    $S$ is a unital commutative $R$-algebra which is free of rank $n$ as an $R$-module.
  #emph[The local ideals and the source reduction.] Choose finite generating lists for $frak(m)_0$ and $frak(n)_0$
    that include the respective images of $t_1 \, dots.h \, t_d$.
    Represent corresponding lists in $R$ and $S$ by vectors of unknowns,
    with their first $d$ entries defined to be $t_i epsilon.alt$ and $t_i delta$.
    Denote the generated ideals by $frak(a)$ and $frak(b)$. Fix exponents $N_R \,
    N_S$ and $j$ for which the original rings satisfy the following conditions, and impose them on the new data:
  #[#set math.equation(numbering: n => "(7.3)")
   $ frak(a)^(N_R) subset.eq \( t \) R \, wide frak(b)^(N_S) subset.eq \( t \) S \, wide
     frak(a)^(j + 1) subset.eq \( t \) frak(a)^j . $ <eq:charzero-ideal-conditions>]
  Such exponents exist because $\( t \)$ is primary for both original maximal ideals and reduces $frak(m)_0$.
    For each standard $A$-module generator $e_i$ of $R$, impose an expression
  $ e_i = c_i epsilon.alt + sum_nu a_nu w_(i nu) \, wide c_i in A \, quad w_(i nu) in R \, $
  where $a_nu$ is the source ideal list. Impose the analogous expressions for the $u
    n$ standard $A$-module generators of $S$, using its unit and its ideal list.
    Thus $R \/ frak(a)$ and $S \/ frak(b)$ are spanned by their units as $A$-modules.
    All these conditions reduce to identities on finite lists of generators and monomials.
    Expanding products with the multiplication tables, and representing each coefficient by a vector,
    encodes them as polynomial equations.
  We first check their consequences, before imposing the target Hilbert-function conditions.
    By (7.2), $R$ is a nonzero finite $A$-algebra, and $S = R^n$ is also nonzero and finite over $A$.
    In a finite algebra over the local ring $A$, every maximal ideal contains the extended ideal $\( t \)$.
    The first two conditions in (7.3) therefore show that every maximal ideal of $R$ contains $frak(a)$,
    and every maximal ideal of $S$ contains $frak(b)$. In particular, both ideals are proper.
    Since $R \/ frak(a)$ is spanned by the unit and annihilated by $\( t \)$, it is a nonzero quotient of $K$,
    hence is $K$. Thus $frak(a)$ is the unique maximal ideal of $R$.
    The same argument gives $S \/ frak(b) = K$ and uniqueness of $frak(b)$.
  The map $R arrow.r S$ is local. Indeed, an element of $frak(a)$ is nilpotent modulo $\( t \) R$,
    so its image belongs to $sqrt(\( t \) S) = frak(b)$; contraction of $frak(b)$ is then $frak(a)$.
    Positive generic rank implies that $R$ is faithful as an $A$-module, so $A arrow.r R$ is injective.
    The map $R arrow.r S$ is also injective: if $a delta = 0$, multiplication by $a$ on $S$ is zero, whereas $S =
    R^n$ is faithful. Finiteness now gives $dim R = dim S = d$.
    Both rings are complete, since they are finite over complete $A$ and their maximal-ideal topologies agree with
    their $\( t \)$-adic topologies by (7.3).
  Because $\( t \) subset.eq frak(a)$, the last inclusion in (7.3) is equality.
    It makes $\( t \)$ a reduction of $frak(a)$, whence
  #[#set math.equation(numbering: n => "(7.4)")
   $ e \( R \) = e \( \( t \) \, R \) = "rank"_A R gt.eq r . $ <eq:charzero-source-bound>]
  The rank equality has the same proof as (7.1). Thus the reduction relation converts the lower rank bound into
    the required source multiplicity bound. Neither a nonvanishing minor nor an additional condition on the length
    of the residue quotient is required.
  #emph[An upper bound for the target Hilbert function.] Write $y_1 \, dots.h \,
    y_q$ for the chosen original target ideal list. There is a graded surjection
  $ L \[ Z_1 \, dots.h \, Z_q \] arrow.r "gr"_(frak(n)_0) S_0 \, wide Z_i mapsto y_i + frak(n)_0^2 . $
  Let $I$ be its homogeneous kernel. Fix a degree-compatible monomial order.
    Choose finitely many monic homogeneous polynomials $f_1 \, dots.h \,
    f_b in I$ whose leading monomials generate the initial ideal $J = "in" \( I \)$. Write
  $ f_ell = Z^(alpha_ell) + sum_(beta in B_ell) c_(ell beta) Z^beta \, wide \| beta \| = \| alpha_ell \| =
    a_ell \, quad Z^beta < Z^(alpha_ell) . $
  Here $B_ell$ is a fixed finite set. Replace the coefficients $c_(ell beta)$ by unknowns $C_(ell beta) in
    A$ and require, on the new target ideal list $b_1 \, dots.h \, b_q$, that
  #[#set math.equation(numbering: n => "(7.5)")
   $ b^(alpha_ell) + sum_(beta in B_ell) C_(ell beta) b^beta in frak(b)^(a_ell + 1) . $ <eq:charzero-leading-relations>]
  Membership is expressed using the finitely many degree $a_ell +
    1$ monomials in the ideal list and coefficient vectors in $S$.
    These are again polynomial equations, and the original data provide a solution.
  For any transferred solution, reduce the coefficients $C_(ell beta)$ modulo $\( t \)$.
    Equation (7.5) gives a homogeneous relation in the kernel of $K \[ Z \] arrow.r
    "gr"_(frak(b)) S$ with the same leading monomial $Z^(alpha_ell)$. The leading coefficient is still $1$.
    The higher $\( t \)$-adic terms of the other coefficients do not contribute:
    their products with a degree-$a_ell$ monomial lie in $frak(b)^(a_ell + 1)$.
    It follows that the new initial ideal contains the monomial ideal $J$, interpreted over $K$.
    The transferred target may have additional initial relations;
    this containment is the direction needed for an upper bound.
    Standard monomials outside $J$ thus span each new graded piece,
    whereas they form a basis of the corresponding original graded piece. Consequently
  $ dim_K frak(b)^a \/ frak(b)^(a + 1) lt.eq dim_L frak(n)_0^a \/ frak(n)_0^(a + 1) quad \( a gt.eq 0 \) . $
  Summation and the equality of dimensions give
  #[#set math.equation(numbering: n => "(7.6)")
   $ e \( S \) lt.eq e \( S_0 \) . $ <eq:charzero-target-bound>]
  Finally, every coefficient in the foregoing presentations, tables, lists,
    and membership witnesses is an unknown; only the sizes, exponents, monomials,
    and the distinguished coefficients $1$ have been fixed. Accordingly the entire system has coefficients in
    $bb(Z) \[ t_1 \, dots.h \, t_d \]$. It is finite, the original data solve it in $A_0$,
    and (7.4) and (7.6) prove the assertion. ◻
]

=== 7.3 Specialization to positive characteristic <specialization-to-positive-characteristic>

The preceding encoding reduces the problem to transferring existence of a solution of a finite polynomial system.
  Artin approximation supplies an algebraic solution whose coefficients can be specialized.

#thm([Lemma 7.3.])[
  #emph[Let $L$ be a field of characteristic zero. A finite polynomial system over
    $bb(Z) \[ t_1 \, dots.h \, t_d \]$ which has a solution in $L \[ \[ t_1 \, dots.h \, t_d \] \]$ has a solution
    in $K \[ \[ t_1 \, dots.h \, t_d \] \]$ for some algebraically closed field $K$ of positive characteristic.]
] <lem:charzero-specialization>

#proof[
  Put $B = \( L \[ t_1 \, dots.h \, t_d \]_(\( t \)) \)^h$, whose completion is $L \[ \[ t \] \]$.
    Artin approximation [1] Theorem 1.10 gives a solution in $B$.
    The henselization is the filtered direct limit of pointed etale neighborhoods of the origin.
    Thus the finitely many solution entries and identities descend to one such neighborhood with an $L$-rational
    point over $t = 0$; this is also the explicit conclusion of [1] Corollary 2.1.
  Shrink about that point. An etale presentation then has the form
  $ E = #scale(x: 120%, y: 120%)[\(] L \[ t \, z_1 \, dots.h \, z_m \] \/ \( G_1 \, dots.h \, G_m \)
    #scale(x: 120%, y: 120%)[\)]_(g Delta) \, wide Delta = det (frac(partial G_i, partial z_j)) \, $
  where the distinguished point is $\( t \, z \) = \( 0 \, c \)$, with $c in L^m$, $G_i \( 0 \, c \) = 0$,
    and $g \( 0 \, c \) Delta \( 0 \, c \) eq.not 0$. The solution entries are elements of $E$.
    Choose polynomial representatives with denominators powers of $g Delta$.
    For each of the finitely many solution identities, clear denominators and choose a polynomial expression in
    the ideal $\( G_1 \, dots.h \, G_m \)$ which witnesses that identity.
    One may multiply by a further power of $g Delta$ before doing so.
  Let $W subset L$ be the $bb(Z)$-algebra generated by the following finite set:
    the coefficients of $G_i$ and $g$, the coordinates of $c$,
    the coefficients of the representatives and ideal-membership witnesses just chosen,
    and the inverse of $g \( 0 \, c \) Delta \( 0 \, c \)$. This is a nonzero finitely generated $bb(Z)$-algebra
    of characteristic zero. The same presentation defines an etale $W \[ t \]$-algebra
  $ E_W = #scale(x: 120%, y: 120%)[\(] W \[ t \, z \] \/ \( G_1 \, dots.h \, G_m \)
    #scale(x: 120%, y: 120%)[\)]_(g Delta) . $
  Evaluation at $\( 0 \, c \)$ gives a $W$-valued point. All solution identities hold in $E_W$, by the chosen witnesses.
  Choose a maximal ideal of $W$ and let $k_0$ be its residue field. This field is finite.
    Indeed, it is a field finitely generated as a $bb(Z)$-algebra.
    If it had characteristic zero, Zariski’s lemma over $bb(Q)$ would make it a number field.
    Finitely many ring generators of a number field are contained in its ring of integers with one nonzero integer
    inverted, which cannot contain the inverse of every rational prime.
    This is impossible for a field of characteristic zero. In positive characteristic,
    Zariski’s lemma makes $k_0$ a finite extension of its finite prime field.
  Let $K$ be an algebraic closure of $k_0$. The distinguished point specializes to a $K$-rational point of
    $E_W ⊗_W K$ over $t = 0$. The inverted Jacobian and denominator remain nonzero there.
    The etale lifting property, or multivariable Hensel’s lemma, lifts this point to a $K \[ t \]$-algebra map
  $ E_W ⊗_W K arrow.r K \[ \[ t \] \] . $
  Explicitly, the point lifts uniquely over each successive quotient $K \[ \[ t \] \] \/ \( t \)^a$,
    since the Jacobian is invertible, and the compatible lifts give the displayed map by completeness.
    Applying it to the solution entries preserves all the polynomial identities and proves the assertion. ◻
]

#thm([Theorem 7.4.])[
  #emph[For every flat local homomorphism of nonzero Noetherian local rings $\( R \, frak(m) \)
    arrow.r \( S \, frak(n) \)$ whose residue fields have characteristic zero, one has $e \( R \) lt.eq e \( S \)$.]
] <thm:charzero>

#proof[
  By Lemma 13, it suffices to consider complete rings of the same dimension with algebraically closed target
    residue field. Lemma 23 then permits us to assume that the map is finite free and that both rings have the
    same algebraically closed coefficient field $L$.
  If the common dimension is zero, equality of residue fields and freeness of rank $n gt.eq 1$ give $e \( S \) =
    "ℓ"_S S = n "ℓ"_R R gt.eq e \( R \)$. Suppose instead that $d > 0$ and that $e \( R \) > e \( S \)$.
    Lemma 24 produces a finite polynomial system with a solution over $L \[ \[ t_1 \, dots.h \, t_d \] \]$.
    Lemma 25 gives a solution over $K \[ \[ t_1 \, dots.h \, t_d \] \]$ for an algebraically closed field $K$ of
    positive characteristic. The resulting finite free local map $tilde(R) arrow.r tilde(S)$ satisfies
  $ e \( tilde(R) \) gt.eq e \( R \) > e \( S \) gt.eq e \( tilde(S) \) \, $
  contradicting Theorem 17. ◻
]

== 8 Proof of the main theorem <sec:assembly>

#proof[
  The reductions of Section 4 reduce the assertion to a complete,
    equal-dimensional flat local map with domain source and algebraically closed target residue field;
    the dimension-zero case is immediate. A source of positive characteristic is covered by Theorem 17,
    a source of mixed characteristic by Theorem 22, and a source of residue characteristic zero by Theorem 26.
    These cases exhaust the possibilities. Each reduction preserves the source multiplicity and preserves or
    decreases the target multiplicity, or recombines the inequalities by additivity.
    Thus the inequality holds for the original map. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Artin, #emph[Algebraic approximation of structures over complete local rings],
  Publications Mathématiques de l'IHÉS #strong[36] (1969), 23--58.
  #link("https://numdam.org/item/10.1007/BF02684596.pdf")[Original article].]
#bibitem([2])[L.~L.~Avramov, H.-B.~Foxby, and B.~Herzog, #emph[Structure of local homomorphisms],
  Journal of Algebra #strong[164] (1994), 124--145.
  #link("https://doi.org/10.1006/jabr.1994.1057")[doi:10.1006/jabr.1994.1057].]
#bibitem([3])[B.~Bhatt, M.~Hochster, and L.~Ma, #emph[Lim Cohen--Macaulay sequences of modules],
  #link("https://arxiv.org/abs/2410.18372v2")[arXiv:2410.18372v2], 2026. Numbered citations refer to this version.]
#bibitem([4])[B.~Bhatt and P.~Scholze, #emph[Prisms and prismatic cohomology],
  Annals of Mathematics (2) #strong[196] (2022), no.~3, 1135--1275.
  #link("https://doi.org/10.4007/annals.2022.196.3.5")[doi:10.4007/annals.2022.196.3.5].
  #link("https://arxiv.org/abs/1905.08229v4")[arXiv:1905.08229v4]. Numbered citations refer to this version.]
#bibitem([5])[H.~Cai, S.~Lee, L.~Ma, K.~Schwede, and K.~Tucker, #emph[Perfectoid signature,
  perfectoid Hilbert--Kunz multiplicity, and an application to local fundamental groups],
  Inventiones Mathematicae #strong[244] (2026), 357--454.
  #link("https://arxiv.org/abs/2209.04046v4")[arXiv:2209.04046v4], 2025. All numbered citations refer to this version.]
#bibitem([6])[S.~P.~Dutta, #emph[Frobenius and multiplicities], Journal of Algebra #strong[85] (1983), no.~2,
  424--448. #link("https://doi.org/10.1016/0021-8693(83)90106-0")[doi:10.1016/0021-8693(83)90106-0].]
#bibitem([7])[D.~Eisenbud and D.~Erman, #emph[Categorified duality in Boij--Söderberg theory and invariants of
  free complexes], Journal of the European Mathematical Society #strong[19] (2017), 2657--2695.
  #link("https://doi.org/10.4171/JEMS/725")[doi:10.4171/JEMS/725].]
#bibitem([8])[D.~Eisenbud and F.-O.~Schreyer, #emph[Betti numbers of graded modules and cohomology of vector
  bundles], Journal of the American Mathematical Society #strong[22] (2009), 859--888.
  #link("https://arxiv.org/abs/0712.1843v3")[arXiv:0712.1843v3], 2008. Numbered citations refer to this version.]
#bibitem([9])[G.~Faltings, #emph[Almost étale extensions], Astérisque #strong[279] (2002), 185--270.
  #link("https://numdam.org/item/AST_2002__279__185_0/")[Original article].]
#bibitem([10])[D.~Hanes, #emph[Special conditions on maximal Cohen--Macaulay modules,
  and applications to the theory of multiplicities], Ph.D. thesis, University of Michigan, 1999.]
#bibitem([11])[R.~C.~Heitmann, #emph[The plus closure in mixed characteristic],
  Journal of Algebra #strong[193] (1997), no.~2, 688--708.
  #link("https://doi.org/10.1006/jabr.1997.7023")[doi:10.1006/jabr.1997.7023].]
#bibitem([12])[R.~C.~Heitmann and L.~Ma, #emph[Extended plus closure in complete local rings],
  Journal of Algebra #strong[571] (2021), 134--150.
  #link("https://arxiv.org/abs/1708.05761v3")[arXiv:1708.05761v3], 2018. All numbered citations refer to this version.]
#bibitem([13])[C.~Huneke, #emph[Hilbert--Kunz multiplicity and the $F$-signature], in #emph[Commutative Algebra],
  I.~Peeva (ed.), Springer, 2013, pp.~485--525.
  #link("https://arxiv.org/abs/1409.0467v1")[arXiv:1409.0467v1], 2014. Numbered citations refer to this version.]
#bibitem([14])[S.~B.~Iyengar, L.~Ma, and M.~E.~Walker, #emph[Multiplicities and Betti numbers in local algebra via
  lim Ulrich points], Algebra & Number Theory #strong[16] (2022), 1213--1257.
  #link("https://doi.org/10.2140/ant.2022.16.1213")[doi:10.2140/ant.2022.16.1213].
  #link("https://arxiv.org/abs/2104.10140v2")[arXiv:2104.10140v2]. Numbered citations refer to this version.]
#bibitem([15])[S.~B.~Iyengar, L.~Ma, and M.~E.~Walker, #emph[Lim Ulrich sequences and Boij--Söderberg cones],
  Forum of Mathematics, Sigma #strong[11] (2023), e115, 26 pp.
  #link("https://doi.org/10.1017/fms.2023.108")[doi:10.1017/fms.2023.108].]
#bibitem([16])[S.~B.~Iyengar, L.~Ma, and M.~E.~Walker, #emph[Ulrich modules over local rings of dimension two],
  #link("https://arxiv.org/abs/2510.02698v1")[arXiv:2510.02698v1], 2025.]
#bibitem([17])[K.~Kurano and K.~Shimomoto, #emph[An elementary proof of Cohen--Gabber theorem in the equal
  characteristic $p > 0$ case], Tohoku Mathematical Journal #strong[70] (2018), 377--389.
  #link("https://doi.org/10.2748/tmj/1537495352")[doi:10.2748/tmj/1537495352].]
#bibitem([18])[C.~Lech, #emph[Note on multiplicities of ideals], Arkiv för Matematik #strong[4] (1960), 63--86.]
#bibitem([19])[C.~Lech, #emph[Inequalities related to certain couples of local rings],
  Acta Mathematica #strong[112] (1964), 69--89.]
#bibitem([20])[L.~Ma, #emph[Lech's conjecture in dimension three], Advances in Mathematics #strong[322] (2017),
  940--970. #link("https://arxiv.org/abs/1609.00095v3")[arXiv:1609.00095v3], 2018.
  All numbered citations refer to this version.]
#bibitem([21])[L.~Ma, #emph[Lim Ulrich sequences and Lech's conjecture],
  Inventiones Mathematicae #strong[231] (2023), 407--429.
  #link("https://arxiv.org/abs/2005.02338v2")[arXiv:2005.02338v2], 2022. Numbered citations refer to this version.]
#bibitem([22])[C.~Meng, #emph[Strongly Lech-independent ideals and Lech's conjecture],
  #link("https://arxiv.org/abs/2112.09849v3")[arXiv:2112.09849v3], 2025. Numbered citations refer to this version.]
#bibitem([23])[P.~Monsky, #emph[The Hilbert--Kunz function], Mathematische Annalen #strong[263] (1983), 43--49.
  #link("https://doi.org/10.1007/BF01457082")[doi:10.1007/BF01457082].]
#bibitem([24])[OpenAI, #emph[A Complete Local Domain without a Small Cohen--Macaulay Module],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-Complete-Local-Domain-Without-a-Small-Cohen-Macaulay-Module-September-23-2026/paper.pdf")[OAI:A-Complete-Local-Domain-Without-a-Small-Cohen-Macaulay-Module-September-23-2026],
  2026.]
#bibitem([25])[T.~Polstra and K.~Tucker, #emph[$F$-signature and Hilbert--Kunz multiplicity:
  a combined approach and comparison], Algebra & Number Theory #strong[12] (2018), no.~1, 61--97.
  #link("https://doi.org/10.2140/ant.2018.12.61")[doi:10.2140/ant.2018.12.61].]
#bibitem([26])[P.~Roberts, #emph[Intersection theorems], in #emph[Commutative Algebra] (Berkeley, 1987),
  Mathematical Sciences Research Institute Publications, vol.~15, Springer, 1989, pp.~417--436.
  #link("https://doi.org/10.1007/978-1-4612-3660-3_23")[doi:10.1007/978-1-4612-3660-3\_23].]
#bibitem([27])[K.~Shimomoto, #emph[The Frobenius action on local cohomology modules in mixed characteristic],
  Compositio Mathematica #strong[143] (2007), no.~6, 1478--1492.
  #link("https://doi.org/10.1112/S0010437X07002825")[doi:10.1112/S0010437X07002825].]
#bibitem([28])[The Stacks Project Authors, #emph[The Stacks Project], 2026.
  #link("https://stacks.math.columbia.edu")[stacks.math.columbia.edu].]
#bibitem([29])[F.~C.~Yhee, #emph[Ulrich modules and weakly lim Ulrich sequences do not always exist],
  Forum of Mathematics, Sigma #strong[11] (2023), e71.
  #link("https://doi.org/10.1017/fms.2023.68")[doi:10.1017/fms.2023.68].
  Numbered citations refer to the published version.]
