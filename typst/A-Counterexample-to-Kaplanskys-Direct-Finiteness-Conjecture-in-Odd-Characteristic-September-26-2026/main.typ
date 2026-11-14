#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Odd Characteristic]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <op:introduction>

A group algebra $K \[ G \]$ consists of finite sums $sum_g c_g g$, with $c_g in K$,
  multiplied by the group law and bilinearity. A unital ring is #emph[directly finite] when $a b =
  1$ implies $b a = 1$; it is #emph[stably finite] when this implication holds in every finite square matrix ring.
  Kaplansky’s direct-finiteness conjecture asks whether $K \[ G \]$ is directly finite for every field $K$ and
  every group $G$, including groups with torsion. The result here is a negative answer in one specified odd
  characteristic.

#thm([Theorem 1.1.])[
  #emph[Put
$ m = binom(1200, 600) \, wide p = min { h in bb(Z) : h > 1 \, med h divides \( m ! \)^2 + 1 } . $

 Then $p$ is an odd prime. There are a specified field $K$ of order $p^4$,
   a specified finitely generated group $G$ containing torsion, and specified finite sums $a \,
   b in K \[ G \]$ satisfying $a b = 1$ and $b a eq.not 1$.]
] <op:main>

The word “specified” refers to finite formulas and choices in ordered finite sets.
  The field is a quadratic tower, the group is built from finitely many finite groups and explicit
  identifications, and the sums are defined without solving the word problem of that group.
  The construction is not claimed to have been evaluated as a practical computation.
  It concerns the displayed prime, not every odd prime.

===== 1.1 The finiteness problem. <the-finiteness-problem.>

For finite $G$, the algebra and all its finite matrix rings are finite-dimensional over $K$.
  A one-sided inverse between their left multiplication operators is therefore two-sided.
  This argument works even when the characteristic divides $\| G \|$.
  The difficulty for an infinite group is to obtain a corresponding conclusion from finite support alone.

Kaplansky proved stable finiteness in characteristic zero using finite von Neumann algebras,
  and asked whether the one-sided-inverse property persists in positive
  characteristic #cite(label("Kaplansky1972")) pp. 122–123.
  Ara, O’Meara, and Perera proved stable finiteness for free-by-amenable groups over arbitrary division
  rings #cite(label("AraOMearaPerera2002")). Elek and Szabó #cite(label("ElekSzabo2004")) Corollary 4.7
  established the same conclusion for all sofic groups. Such groups admit finite permutation models that
  approximate multiplication while keeping distinct elements separated.
  These theorems are constraints on the example, not hypotheses about its group.
  In particular, Elek–Szabó’s theorem implies, after the scalar construction is completed, that $G$ cannot be sofic.

A separate characteristic-two construction uses incidence structures, polynomial pairings,
  a planar group-embedding argument, and character packing #cite(label("OpenAICharacteristicTwo2026"))
  Theorem 1.1. The construction here has a different local mechanism.
  A high-degree subspace of a modular translation representation is annihilated on one side;
  a weighted pairing gives a compatible annihilation on the other.
  The characteristic-two theorem is not an input to this odd-prime argument,
  and the two methods retain distinct coefficient hypotheses.

===== 1.2 The two quantities that must be compared. <the-two-quantities-that-must-be-compared.>

A matrix $F$ #emph[fits] a simple graph when $F_(i i) = 1$ and $F_(i j) = 0$ for distinct nonadjacent vertices.
  We use a triangle-free graph on $m$ vertices and a specified factorization

$ F_(i j) = sum_(T in cal(T)) alpha_i \( T \) beta_j \( T \) \, wide \| cal(T) \| = t \, wide t / m < 1 / 100 . $

This is an explicit threshold-Kneser instance of the polynomial constructions of Haviv and Golovnev–Haviv
  #cite(label("Haviv2018Theta")) Proposition 13 #cite(label("GolovnevHaviv2022")) Theorem 3.2 and Lemma 3.5,
  whose polynomial ancestry includes Alon–Babai–Suzuki #cite(label("AlonBabaiSuzuki1991")).
  Low-rank fitting matrices also give storage-code recovery equations.
  The triangle-free constructions of Barg–Zémor, Huang–Xiang,
  and Barg–Schwartz–Yohananov provide related context #cite(label("BargZemor2022")) #cite(label("HuangXiang2023"))
  #cite(label("BargSchwartzYohananov2024")). Their results are not used to supply a group-algebra idempotent.

At every vertex we use a copy of a finite group $H$ and an idempotent $e in K \[ H \]$.
  Write $w = \| H \|$ and $d = dim_K e K \[ H \]$, the rank of left multiplication by $e$ on the regular
  representation. The second quantity is

$ d / w > 1 / 96 . $

The idempotents satisfy a directed condition: after identifying certain cyclic subgroups at adjacent vertices,
  $e_i e_j = 0$ for every edge with $i < j$. There is no assertion about the reverse product.
  The asymmetry is what allows a triangular calculation to combine the two strict bounds.

The characteristic-dependent construction appears in Section 3.
  High augmentation degree gives the annihilated columns, in the elementary abelian setting of Jennings’
  theory #cite(label("Jennings1941")). A diagonal weighted Gram determinant and Schwartz’s grid
  bound #cite(label("Schwartz1980")) Lemma 1 and Corollary 1,
  with related polynomial-identity work of Zippel #cite(label("Zippel1979")),
  supply enough nondegenerate pairings. Fourier character orbits turn these projections into actual elements of
  $K \[ H \]$. The full algebra need not be semisimple; only its prime-to-$p$ normal abelian subgroup is
  diagonalized, in the character-orbit setting of Clifford #cite(label("Clifford1937Announcement")).

===== 1.3 From the comparison to scalar elements. <from-the-comparison-to-scalar-elements.>

The proof has three transitions that numerical rank inequalities alone cannot justify.
  First, the quotient identifying the cyclic subgroups must retain the finite vertex groups.
  Its injectivity proof uses the $C \( 4 \)$–$T \( 4 \)$ graphical-complex mechanism described by
  Prytuła #cite(label("Prytula2024")) Section 8: local short-word restrictions and triangle-freeness rule out a
  spherical map with exactly one nontrivial face. Ordinary graph-of-groups normal form does not by itself
  establish this first quotient’s injectivity. Section 4 proves it locally,
  including the reductions for loops and bridges.

Second, regular ranks must become identities over the same ring.
  A further group enlargement $G_1$ has a nonzero central idempotent $f$ in $R = K \[ G_1 \]$.
  In the ring $S = f R$, whose identity is $f$, the elements $P_i = f e_i$ admit rectangular matrices

$ J_i in "Mat"_(w times d) \( S \) \, wide Y_i in "Mat"_(d times w) \( S \) \, wide Y_i J_i = f I_d \, quad
  J_i Y_i = P_i I_w . $

The finite-group blocks in this step have elementary abelian $p$-group stabilizers,
  possibly nontrivial and nonnormal. Their group algebras have nilpotent augmentation ideals,
  and a finite change of basis proves exact integer rank identities before coordinates are paired.
  Section 5 gives the full construction of these matrices, with their entries in explicitly attached finite subgroups.

Third, a matrix counterexample does not yet give two scalar elements of the same group algebra.
  In Section 6, the fit and the ordered zero products produce a split injection

$ S^(m d) arrow.r S^(w t) arrow.r S^(m d) \, wide w t < m d \, $

whose composite is the identity. We derive square matrices with a one-sided inverse and certify the reverse defect
  by a nonzero kernel vector. Section 7 then implements the finite-factor reduction of
  Dykema–Juschenko #cite(label("DykemaJuschenko2015")) Lemma 2.1 and Theorem 2.2.
  A finite Heisenberg group gives explicit matrix units, their linear independence makes the encoding injective,
  and a complementary idempotent restores the full scalar identity.
  The shift and modulation model is classical #cite(label("GurevichHadani2009")) Section 1.2;
  the composite cyclic order and finite coefficient field used here are checked directly.

===== 1.4 The dynamical consequence. <the-dynamical-consequence.>

A configuration over a finite alphabet $A$ is any function $G arrow.r A$.
  A cellular automaton has one finite memory set $E subset G$ and one rule applied to $\( x \( g u \) \)_(u in E)$
  at every $g$. A group is #emph[surjunctive] when every injective such automaton, over every finite alphabet,
  is surjective. Gottschalk proposed this for all groups #cite(label("Gottschalk1973"));
  Gromov and Weiss proved it for sofic groups #cite(label("Gromov1999")) #cite(label("Weiss2000")).
  The group-ring connection is recorded by Elek–Szabó and developed in the linear theory of
  Ceccherini-Silberstein–Coornaert #cite(label("ElekSzabo2004")) #cite(label("CSCCoornaert2006")).
  Phung proved stable finiteness over every field for surjunctive groups #cite(label("Phung2023")) Theorem B;
  subsequent proofs and extensions include #cite(label("CSCPhungGroup2025")) #cite(label("CSCPhungMonoid2025")).

Section 8 gives the elementary transfer with its actual multiplication convention.
  The coefficients of $b$ define an injective automaton, those of $a$ give a left inverse,
  and a nonzero coefficient of $b a - 1$ specifies a missing point indicator.
  The argument excludes preimages of arbitrary support. It is a consequence of the scalar construction,
  not a further existence theorem.

All matrices below act on columns of free right modules. Matrix entries therefore multiply coordinates on the
  left. Transpose is ordinary transpose over $K$, with no involution.
  Cardinalities and dimensions in rank comparisons are integers, not elements of the coefficient field.
  For a positive integer $n$, write $\[ n \] = { 1 \, dots.h \, n }$.

== 2 The field, the graph, and the local group <op:finite-section>

We first construct the finite data. This fixes every coefficient field and denominator before the modular argument
  begins.

#thm([Lemma 2.1.])[
  #emph[For $m \, p$ in Theorem 1, $p > m$ is an odd prime and $- 1$ is a square in $bb(F)_p$.
    If $eta$ is a nonsquare in $bb(F)_p^(*)$, then
$ K_0 = bb(F)_p \[ xi \] \/ \( xi^2 - eta \) \, wide K = K_0 \[ nu \] \/ \( nu^2 - xi \) $

 are quadratic field extensions, so $\| K \| = p^4$.]
] <op:field>

#proof[
  A least divisor greater than one of an integer is prime: any nontrivial proper divisor of a composite least
    divisor would be smaller. If $p lt.eq m$, then $p$ divides both $m !$ and $\( m ! \)^2 + 1$,
    which is impossible. Hence $p > m > 600$, and the defining divisibility gives $\( m ! \)^2 = -
    1$ in $bb(F)_p$. There are nonsquares because each nonzero square has exactly two square roots.
    The first quotient is therefore a quadratic field. The conjugate of $xi$ is $- xi$, so its norm is $- eta$.
    Since $- 1$ is square, $- eta$ is nonsquare. A square in $K_0$ would have square norm,
    proving that $xi$ is nonsquare and that the second quotient is a field. ◻
]

Choose the least nonsquare using representatives $0 \, dots.h \, p - 1$;
  order $K$ by its coefficients in $\( 1 \, xi \, nu \, xi nu \)$.
  Put $M = p^4 - 1$ and choose the least element $zeta in K^(*)$ of order $M$. This element exists:
  if $b$ is the least common multiple of all orders in $K^(*)$, then $b divides M$,
  while the root bound for $X^b - 1$ gives $M lt.eq b$. For each prime-power factor of $b$,
  an appropriate power of one element has that exact order.
  Multiplying the resulting commuting elements of coprime orders gives order $b = M$.
  In particular, $M$ and all its powers are invertible in $K$.

Use natural orders on integer indices, increasing-list lexicographic orders on subsets,
  and lexicographic orders on tuples and finite function tables.
  Order characters of $\( bb(Z) \/ M bb(Z) \)^D$ by their exponent lists on the ordered coordinate generators.
  These conventions specify the finite choices below.

Let $I_1 \, dots.h \, I_m$ be the $600$-subsets of $\[ 1200 \]$ in order.
  Join distinct $i \, j$ in $Gamma$ exactly when $\| I_i ∩ I_j \| < 200$. Put

$ cal(T) = { T subset.eq \[ 1200 \] : \| T \| lt.eq 400 } \, wide t = sum_(j = 0)^400 binom(1200, j) . $

#thm([Proposition 2.2.])[
  #emph[The graph $Gamma$ is triangle-free and has a specified fitting factorization $F_(i j) =
    sum_(T in cal(T)) alpha_i \( T \) beta_j \( T \)$ over $bb(F)_p$ with $t \/ m < 1 \/ 100$.]
] <op:graph>

#proof[
  Three pairwise adjacent sets would have union of size at least $3 dot.op 600 - 3 dot.op 199 = 1203$,
    exceeding $1200$. To construct the fit, let $alpha_i \( T \) = 1$ when $T subset.eq I_i$, and zero otherwise.
    Define $beta_j \( T \)$ as the coefficient of $product_(x in T) X_x$ obtained by expanding
  $ Q_j \( X \) = product_(k = 200)^599 frac(sum_(x in I_j) X_x - k, 600 - k) $
  and replacing every positive exponent in each monomial by one.
    All denominators are in ${ 1 \, dots.h \, 400 }$, hence invertible.
    This replacement preserves evaluations on zero-one vectors and does not increase degree. Thus
  $ F_(i j) = product_(k = 200)^599 frac(\| I_i ∩ I_j \| - k, 600 - k) . $
  It equals one for $i = j$. For distinct nonneighbors the intersection size lies between $200$ and $599$,
    so one factor is zero. This is the threshold-Kneser polynomial specialization of
    #cite(label("Haviv2018Theta")) Proposition 13 #cite(label("GolovnevHaviv2022")) Theorem 3.2.
  The binomial coefficients increase up to index $400$. Consequently
  $ t / m lt.eq 401 product_(u = 401)^600 frac(u, 1201 - u) lt.eq 401 \( 5 \/ 7 \)^100 < 1 / 100 . $
  In the second inequality the first hundred factors are at most $500 \/ 701 < 5 \/
    7$ and the rest are at most one. The last inequality follows from $\( 5 \/ 7 \)^3 < 1 \/ 2$ and $40100 < 2^33$. ◻
]

For the local algebra define the additive group $P = \( bb(F)_p \)^3$,
  the function group $A_0 = \( bb(Z) \/ M bb(Z) \)^P$, and

$ H = A_0 times.r P \, wide \( a \, s \) \( a' \, s' \) = \( a + s dot.op a' \, s + s' \) \,
  wide \( s dot.op a \) \( x \) = a \( x - s \) . $

Its order is $w = M^(p^3) p^3$. Let $c in A_0$ have value one at zero and zero elsewhere, and put

$ u \( s \) = \( 0 \, s \) \, quad U = u \( P \) \, wide v \( s \) = c u \( s \) c^(- 1) \, quad V = c U c^(- 1) . $

The coordinate formula $v \( s \) = \( c - s dot.op c \, s \)$ gives $U ∩ V = { 1 }$, because $c -
  s dot.op c eq.not 0$ when $s eq.not 0$. We next construct an idempotent with incoming annihilation by $U$ and
  outgoing annihilation by $V$.

== 3 Large idempotents with ordered annihilations <op:modular-section>

The graph has supplied the ratio $t \/ m < 1 \/ 100$. Our present objective is an idempotent in the finite group
  algebra $K \[ H \]$ whose regular rank fraction exceeds $1 \/ 96$.
  It must also have two prescribed annihilations, on opposite sides. Here

$ ell = \( p - 1 \) \/ 2 \, wide D = 3 \( p - 1 \) \, wide w = \| H \| . $

The #emph[regular rank] of $e in K \[ H \]$ means $dim_K e K \[ H \]$,
  the dimension of the image of left multiplication. Although this map multiplies on the left,
  its image is a right ideal.

#thm([Proposition 3.1.])[
  #emph[There is a specified idempotent $e in K \[ H \]$ satisfying, for every $s in P$,
$ \( u \( s \) - 1 \)^ell e = 0 \, wide e \( v \( s \) - 1 \)^ell = 0 . $

 Its regular rank $d$ satisfies $d \/ w > 1 \/ 96$. Its coefficients are obtained by finite operations in the
   specified field $K$.]
] <op:modular>

=== 3.1 The annihilated column space <the-annihilated-column-space>

On $K^P$, let $upright(bold(e))_x$ be the standard basis and $L_s upright(bold(e))_x = upright(bold(e))_(s + x)$.
  For the three standard generators $epsilon_j$ of $P$ set $X_j = L_(epsilon_j) - I$.
  The $X_j$ commute, and characteristic $p$ gives $X_j^p = 0$. The vectors

$ X_1^(n_1) X_2^(n_2) X_3^(n_3) upright(bold(e))_0 \, wide 0 lt.eq n_1 \, n_2 \, n_3 < p \, $

are a basis. Indeed, every translation of $upright(bold(e))_0$ is a product of powers of $I +
  X_j$ applied to $upright(bold(e))_0$, so the displayed family spans $K^P$; its cardinality is the dimension $p^3$.

This is the elementary abelian augmentation filtration in the setting studied by
  Jennings #cite(label("Jennings1941")). Here the exact degree argument can be given directly.
  Let $B$ have as columns the displayed basis vectors with $n_1 + n_2 + n_3 gt.eq D - ell + 1$, in order.
  For every $s$, the matrix $L_s - I$ is a polynomial in the $X_j$ with zero constant term.
  Multiplication by its $ell$th power raises every column’s total degree to at least $D + 1$.
  Such a monomial has an exponent at least $p$, so vanishes. Applying the same assertion to $- s$ and transposing yields

#[#set math.equation(numbering: n => "(3.1)")
 $ \( L_s - I \)^ell B = 0 \, wide B^(sans(T)) \( L_s - I \)^ell = 0 . $ <op:B-annihilation>]

The transpose identity uses $L_(- s)^(sans(T)) = L_s$; no scalar conjugation is present.

The columns are independent. Their number $h$ can be counted by setting $a_j = p - 1 - n_j$:
  the new nonnegative indices have sum at most $ell - 1$. Their individual upper bounds are automatic because
  $ell - 1 < p$. Stars and bars gives

#[#set math.equation(numbering: n => "(3.2)")
 $ h = binom(ell + 2, 3) \, wide h / p^3 = frac(\( p - 1 \) \( p + 1 \) \( p + 3 \), 48 p^3) > 1 / 48 . $ <op:h>]

For the strict inequality, the numerator minus $p^3$ is $3 p^2 - p - 3 > 0$ for $p gt.eq 3$.

The same subspace is killed on the two sides in Equation (3.1),
  but an arbitrary projection onto it need not give the outgoing conjugate annihilation.
  We therefore choose the row factor by a diagonal weighted pairing.

=== 3.2 Many nonsingular diagonal pairings <many-nonsingular-diagonal-pairings>

For a finite function group $A_(*) = \( bb(Z) \/ M bb(Z) \)^E$, its characters $chi : A_(*) arrow.r
  K^(*)$ are all exponent lists of powers of $zeta$. Put

#[#set math.equation(numbering: n => "(3.3)")
 $ p_chi^(A_(*)) = \| A_(*) \|^(- 1) sum_(a in A_(*)) chi \( a \)^(- 1) a . $ <op:fourier>]

The denominator is invertible. Reindexing the sum gives $a p_chi^(A_(*)) = chi \( a \) p_chi^(A_(*))$.
  A nontrivial character has sum zero, since translating its sum by an element on which it is nontrivial
  multiplies it by a scalar different from one. It follows that

$ p_chi^(A_(*)) p_psi^(A_(*)) = delta_(chi psi) p_chi^(A_(*)) \, wide sum_chi p_chi^(A_(*)) = 1 . $

For the last identity, sum coefficients over the independent character exponents:
  every nonzero coordinate of a nonidentity element is detected by a power of $zeta$.
  Each idempotent is nonzero, there are $\| A_(*) \|$ of them, and orthogonality makes them independent.
  They form a basis of $K \[ A_(*) \]$.

Specialize to $A_0$. Its character action is $\( s lambda \) \( a \) = lambda \( \( - s \) dot.op a \)$. Define

$ chi_x = x lambda \, wide D_lambda = "diag" \( chi_x \( c \) : x in P \) \, wide N_lambda =
  B^(sans(T)) D_lambda^(- 1) B . $

Call $lambda$ admissible if its stabilizer in $P$ is trivial and $N_lambda$ is invertible.
  This condition is a finite test.

#thm([Lemma 3.2.])[
  #emph[More than half of the $\| A_0 \| = M^(p^3)$ characters are admissible.]
] <op:good-count>

#proof[
  For each nonzero $s in P$, translation partitions $P$ into $p^2$ cycles of length $p$.
    A character fixed by $s$ has constant exponent on each cycle, so exactly $M^(p^2)$ characters are fixed.
    A union bound therefore bounds the fraction with nontrivial stabilizer by
  $ \( p^3 - 1 \) M^(p^2 - p^3) . $
  Let $c_r$ be the coordinate generator at $r$. Since $chi_x \( c \) = lambda \( c_(- x) \)$,
    the diagonal entries of $D_lambda^(- 1)$ range independently over $K^(*)$ as $lambda$ ranges over all
    characters. For independent variables $tau_x$, Cauchy–Binet gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ Q \( tau \) := det #scale(x: 120%, y: 120%)[\(] B^(sans(T)) "diag" \( tau_x \) B
     #scale(x: 120%, y: 120%)[\)] = sum_(J subset.eq P\
\| J \| = h) det \( B_J \)^2 product_(x in J) tau_x . $ <op:weighted-gram>]
  Here $B_J$ consists of the indicated rows in their fixed order.
    Some maximal minor is nonzero because $B$ has full column rank.
    The monomials for distinct $J$ are distinct, so $Q$ is nonzero of total degree $h$,
    even though the unweighted Gram matrix could be singular.
  We use the polynomial grid estimate of Schwartz #cite(label("Schwartz1980")) Lemma 1 and Corollary 1;
    see also the related identity-testing method of Zippel #cite(label("Zippel1979")).
    A nonzero polynomial of total degree at most $a$ vanishes on at most an $a \/
    M$ fraction of a product grid whose coordinate sets each have size $M$.
    To prove this, induct on the number of variables. If the degree in the last variable is $b$,
    its leading coefficient has degree at most $a - b$. It vanishes at at most an $\( a - b \) \/
    M$ fraction of the earlier choices. For each remaining choice,
    the last-variable polynomial has at most $b$ roots, contributing at most $b \/ M$.
    The sum proves the bound; the constant case starts the induction.
  Applying the estimate on $\( K^(*) \)^(p^3)$ to Equation (3.4),
    the singular-pairing fraction is at most $h \/ M$. Both excluded fractions are strictly smaller than $1 \/ 4$:
  $ h / M lt.eq frac(p^3, p^4 - 1) < 1 / 4 \, wide \( p^3 - 1 \) M^(- p^2 \( p - 1 \)) lt.eq
    frac(p^3 - 1, M) < 1 / 4 . $
  The estimates use $p > 600$; for example, $p^4 - 1 - 4 p^3 = p^3 \( p - 4 \) - 1 > 0$.
    Their union therefore excludes fewer than half of the characters. ◻
]

Select the first admissible character from each $P$-orbit containing one,
  and call the set of selected characters $cal(R)$. Each selected orbit is free, of size $p^3$.
  These orbits cover all admissible characters, so

#[#set math.equation(numbering: n => "(3.5)")
 $ \| cal(R) \| > frac(\| A_0 \|, 2 p^3) . $ <op:orbit-count>]

This argument does not need admissibility to be constant on an orbit.

=== 3.3 Realizing the projections in the group algebra <realizing-the-projections-in-the-group-algebra>

Fix $lambda in cal(R)$. For $x \, y in P$, define

$ E_(x y)^lambda = p_(x lambda)^(A_0) u \( x - y \) . $

Conjugation gives $u \( s \) p_chi^(A_0) u \( s \)^(- 1) = p_(s chi)^(A_0)$.
  Fourier orthogonality and freeness of the orbit therefore imply

$ E_(x y)^lambda E_(z t)^lambda = delta_(y z) E_(x t)^lambda . $

Indeed the Fourier product can survive only when $x lambda = \( x - y + z \) lambda$, which is equivalent to $y =
  z$. Products between different orbits vanish. The sum $q_lambda = sum_x p_(x lambda)^(A_0)$ is central:
  it commutes with $A_0$ and its summands are permuted by $P$.
  The basis $p_(x lambda)^(A_0) u \( s \)$ of its ideal is indexed equally by $\( x \, y \)$ through $s = x - y$.
  Thus these units prove

$ q_lambda K \[ H \] tilde.equiv "Mat"_(p^3) \( K \) . $

This is an explicit character-orbit block, in the normal-subgroup representation setting of
  Clifford #cite(label("Clifford1937Announcement")). It does not assert semisimplicity of the entire modular algebra.

On this block, the elements $u \( s \)$, $c$, and $v \( s \)$ act respectively by

$ L_s \, wide D_lambda \, wide D_lambda L_s D_lambda^(- 1) . $

For example, left multiplication by $u \( s \)$ shifts row $x$ to row $s + x$,
  whereas $c$ multiplies row $x$ by $\( x lambda \) \( c \)$.

Define a matrix and then a finite group-algebra element by

#[#set math.equation(numbering: n => "(3.6)")
 $ T_lambda = B N_lambda^(- 1) B^(sans(T)) D_lambda^(- 1) \, wide e =
   sum_(lambda in cal(R)) sum_(x \, y in P) \( T_lambda \)_(x y) E_(x y)^lambda . $ <op:explicit-e>]

The inverse exists by the selection criterion. Since $B^(sans(T)) D_lambda^(- 1) B = N_lambda$,
  we have $T_lambda B = B$ and $T_lambda^2 = T_lambda$. Its image is exactly $"im" B$, of dimension $h$.
  Orthogonality of the blocks proves $e^2 = e$; on the complementary ideal its component is zero.

We now compute the regular rank, rather than the smaller rank of a single representation matrix.
  In $"Mat"_(p^3) \( K \)$, left multiplication by $T_lambda$ has image the matrices whose $p^3$ columns all lie
  in $"im" B$. Its image dimension is $h p^3$. Summing the selected blocks gives

#[#set math.equation(numbering: n => "(3.7)")
 $ d = h p^3 \| cal(R) \| \, wide d / w = frac(h \| cal(R) \|, \| A_0 \|) > frac(h, 2 p^3) > 1 /
   96 . $ <op:regular-rank>]

The incoming annihilation follows from $\( L_s - I \)^ell T_lambda = 0$.
  For the outgoing annihilation, keep the factors in their actual order:

$ B^(sans(T)) D_lambda^(- 1) \( D_lambda L_s D_lambda^(- 1) - I \)^ell & = B^(sans(T)) \( L_s - I \)^ell D_lambda^(- 1)\
 & = 0 . $

Equation (3.1) proves both assertions on every selected block.
  They also hold on the complementary ideal, where $e$ is zero.
  This proves Proposition 4, including its finite prescription and the strict rank estimate.

=== 3.4 From opposite annihilations to an ordered zero product <from-opposite-annihilations-to-an-ordered-zero-product>

Take copies $H_i$ of $H$. For each edge $i < j$, identify $v \( 1 \, macron(j) \, macron(j)^2 \)$ in $H_i$ with
  $u \( 1 \, macron(i) \, macron(i)^2 \)$ in $H_j$, where bars denote residues in $bb(F)_p$.
  Let $G_0$ be the resulting free-product quotient, and let $e_i$ denote the image of $e$ from $H_i$.
  The injectivity of these copies is proved in Section 4. The following ordered identity already follows from the
  local calculations and the quotient relations.

#thm([Corollary 3.3.])[
  #emph[For every edge $i < j$ of $Gamma$, $e_i e_j = 0$ in $K \[ G_0 \]$.]
] <op:edge-zero>

#proof[
  Let $y$ be its generator, initially of order $p$ on either local side, and put $X = y - 1$.
    In the local cyclic group algebra $K \[ chevron.l y chevron.r \] = K \[ X \] \/ \( X^p \)$,
    the annihilator of right multiplication by $X^ell$ is precisely the ideal $\( X^(p - ell) \)$.
    Choose representatives of the left cosets $a chevron.l y chevron.r$ in $H_i$;
    they give a free right $K \[ chevron.l y chevron.r \]$-basis of $K \[ H_i \]$.
    Thus the outgoing identity $e_i X^ell = 0$, applied coefficientwise in this basis before taking images in the
    quotient, gives $e_i = q X^(p - ell)$ for some local $q$. On the incoming side $X^ell e_j = 0$.
    Since $p - ell = ell + 1$,
  $ e_i e_j = q X^(ell + 1) e_j = q X \( X^ell e_j \) = 0 . $
  No factor is commuted across $X$, and no reverse ordered product is asserted. ◻
]

We have constructed the large regular rank and the edge vanishings.
  To compare them with the graph factorization, the remaining structural step must put exact rectangular
  realizations of all those ranks inside one nonzero ring.

== 4 Gluing the finite groups without collapsing them <sec:gluing>

The quotient $G_0$ of Section 3 identifies a cyclic subgroup across each edge of $Gamma$.
  It must retain every vertex group: otherwise a later nonzero element of a finite group algebra could disappear.
  We first prove a general injectivity criterion and then verify it for the groups used here.
  The local injectivity argument belongs to the $C \( 4 \)$–$T \( 4 \)$ theory of graphical complexes of groups
  #cite(label("Prytula2024")) Section 8. We give a direct proof using only labelled spherical maps and Euler’s formula.

=== 4.1 An injectivity criterion <an-injectivity-criterion>

#thm([Lemma 4.1.])[
  (Triangle-free gluing).  #emph[Let $Delta$ be a finite simple triangle-free graph.
    For each vertex $i$, let $D_i$ be a finite group. For each edge $gamma = { i \, j }$,
    let $C_gamma$ be a nontrivial finite cyclic group, with injective homomorphisms $iota_(gamma \, i) :
    C_gamma arrow.r D_i$ and $iota_(gamma \, j) : C_gamma arrow.r D_j$.
    Assume the following condition at every vertex $i$. If $1 lt.eq k lt.eq 3$, the edges $gamma_1 \, dots.h \,
    gamma_k$ are incident to $i$, and $s_a in C_(gamma_a) \\ { 1 }$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ iota_(gamma_1 \, i) \( s_1 \) dots.h.c iota_(gamma_k \, i) \( s_k \) eq.not 1 $ <eq:gluing-short-word>]

 whenever consecutive edge labels are distinct cyclically.
   For $k = 1$ the distinctness condition is omitted; for $k gt.eq 2$ it includes $gamma_k eq.not gamma_1$.
   Then every natural homomorphism $D_i arrow.r Q$ is injective, where
$ Q = (*_(i in V \( Delta \)) D_i) #scale(x: 120%, y: 120%)[\/] ⟨#h(-0.16667em) ⟨iota_(gamma \, i) \( s \)
  iota_(gamma \, j) \( s \)^(- 1) : gamma = { i \, j } \, med s in C_gamma⟩ #h(-0.16667em)⟩ . $

]
] <lem:triangle-free-gluing>

#proof[
  We first handle the subgroups generated by the incident cyclic groups.
    The diagram argument will rule out a relation that is nontrivial at one vertex but follows from the relations
    at all the vertices. At the end, a permutation action extends the conclusion to the full groups $D_i$.
  Put
  $ D_i^0 = chevron.l iota_(gamma \, i) \( C_gamma \) : gamma in.rev i chevron.r . $
  Choose a generator of each $C_gamma$, and let $L$ have one generator $x_gamma$ for each edge.
    Its defining relators are all words in the $x_gamma^(plus.minus 1)$ incident to a single vertex that evaluate
    to $1$ in that vertex group. There is a well-defined map $D_i^0 arrow.r L$:
    two words representing the same element of $D_i^0$ differ by one of these relators.
  ===== 4.1.1 A failed injection produces a spherical map. <a-failed-injection-produces-a-spherical-map.>
  Suppose a nonidentity element of $D_i^0$ maps to $1$ in $L$, and choose a word $w$ representing it.
    There is a finite sequence of words from $w$ to the empty word,
    each step inserting or deleting a defining relator, its inverse, or a free inverse pair.
    Indeed, membership in the normal closure of the relators expresses $w$ in the free group as a finite product
    of conjugates of relators; free insertions and cancellations reach such a product,
    and the conjugated relators can then be erased.
  We describe the spherical maps needed to encode this sequence.
    A map is a finite connected graph drawn tamely on the sphere, allowing loops and parallel edges.
    An edge is either #emph[neutral], with value $1$, or is labelled by an edge $gamma$ of $Delta$.
    In the latter case its two oriented traversals, called darts,
    have mutually inverse values in $C_gamma \\ { 1 }$. Every face has a type $i in
    V \( Delta \)$ incident to every label in its boundary walk.
    Its boundary word is evaluated in $D_i$, using the specified embeddings.
    A face is #emph[ordinary] when this evaluation is the identity.
    Call the map #emph[exceptional] if precisely one face has nonidentity evaluation and all other faces have
    identity evaluation. Changing the starting point conjugates a boundary product,
    and reversing the walk inverts it, so identity versus nonidentity is well-defined.
  Draw the successive words in horizontal levels of a rectangle, with each letter an oriented edge.
    Represent an empty level by a single neutral edge. In every intervening strip join corresponding vertices
    along the unchanged prefix and suffix by noncrossing neutral edges.
    At an insertion or deletion, join the single insertion vertex on the shorter path to the two endpoints of the
    inserted block on the longer path. The strip faces then read either a letter followed by its inverse,
    or the inserted relator, with neutral edges interspersed.
    If a level is empty, the adjacent nonempty word is the entire inserted or deleted block;
    one face between these two levels suffices. Assign the relator’s vertex type to its face,
    and either endpoint type of a letter’s label to an unchanged-letter face. All these faces evaluate to $1$.
    Include the neutral edges along the two vertical sides of the rectangle.
    The exterior face has word $w$ or $w^(- 1)$, apart from neutral edges; give it type $i$.
    This connected drawing, viewed on the sphere, is exceptional.
  We shall prove that no exceptional map exists. Choose one with the smallest possible number of edges.
    This number is positive: the only face of an isolated vertex has the empty word, which evaluates to $1$.
    The reductions below will make every vertex degree and every ordinary face length at least four away from a
    possible loop. Euler’s formula will then rule out both the loop-free case and the remaining one-loop case.
  ===== 4.1.2 Boundary walks and elementary reductions. <boundary-walks-and-elementary-reductions.>
  Fix an orientation of the sphere. At each vertex let $sigma$ be the cyclic successor of outgoing darts and let
    $alpha$ reverse a dart. Boundary walks are the cycles of $sigma alpha$:
    after traversing a dart, take the successor of its reverse.
    For a disconnected drawing we use each component’s own boundary walks,
    counting one empty walk for an isolated vertex. If a drawing has $v$ vertices, $e$ edges,
    $F$ such walks and $c$ components, then
  #[#set math.equation(numbering: n => "(4.2)")
   $ v - e + F = 2 c . $ <eq:gluing-euler>]
  For completeness, in a connected spherical drawing a nonbridge edge lies on a simple circuit.
    Its two sides are therefore on distinct boundary walks; deleting it merges those walks and preserves
    connectedness. Repeated deletion leaves a tree, which has one boundary walk and $e = v - 1$.
    This proves the formula for a connected drawing; summing proves the displayed formula.
    The same walk rules follow by taking small vertex discs and thin edge bands.
  A neutral nonloop edge can be contracted, with its neutral darts omitted from the boundary words.
    This preserves every face evaluation and contradicts minimality.
    For a neutral loop based at $b$, retain the closed side containing the exceptional face, then remove the loop.
    The retained graph is connected: each side of the loop attaches to the other only at $b$.
    The other dart slots on the retained side form an interval between the loop slots;
    closing that interval gives precisely the old walks on that side with the neutral loop dart removed.
    Thus their evaluations are unchanged. If only $b$ remains, its walk is empty and could not be exceptional.
    In every possible case a smaller exceptional map results. Hence every edge is nonneutral.
  There are no bridges. To see this, delete a bridge with value $s$, leaving two components.
    Its incident face walk splits into words $W_1 \, W_2$, one in each component, possibly empty.
    Both receive the old face type. With suitable starting point and orientation, the old word was
  $ W_1 s W_2 s^(- 1) . $
  If it was exceptional, at least one $W_a$ has nonidentity evaluation; retain that component.
    If it was ordinary, the evaluations of $W_1$ and $W_2$ are either both identity or both nonidentity.
    In the first case retain the component with the original exceptional face.
    In the second retain the component without that face: its new boundary walk is now its unique exceptional
    face. All choices give a smaller exceptional map.
  Every edge consequently separates two distinct faces. Their types must also be distinct.
    Otherwise delete the edge and merge the faces, using their common type.
    If their words, starting at its opposite darts, are $s D$ and $s^(- 1) E$, the merged word is $D E$, and
  #[#set math.equation(numbering: n => "(4.3)")
   $ D E = s^(- 1) \( s D \) s \( s^(- 1) E \) . $ <eq:gluing-merge>]
  Thus two ordinary faces merge to an ordinary face, whereas one ordinary and one exceptional face merge to an
    exceptional face. Again this would reduce the number of edges.
    The types across an edge labelled $gamma$ are therefore exactly the two endpoints of $gamma$.
  There is at most one loop, and if it exists it bounds the exceptional face as a monogon.
    In fact, given a loop, keep its closed side #emph[without] the exceptional face,
    including the loop and its base vertex, and erase the graph on the other side.
    All retained old faces are ordinary. The erased side becomes a monogon with the loop’s nonidentity value;
    either endpoint of its label supplies its type. This is another exceptional map.
    Minimality forces the erased side to have contained no other edges in the original drawing.
    That side was consequently already the exceptional monogon.
    This applies to every loop, and the one exceptional face cannot be a monogon for two different loops.
  ===== 4.1.3 Consecutive equal labels can be smoothed. <consecutive-equal-labels-can-be-smoothed.>
  We have reduced to nonneutral, nonbridge edges with different face types on their two sides;
    the sole possible loop bounds the exceptional monogon. It remains to rule out consecutive nonloop darts with
    equal labels and then compare degrees with Euler’s formula.
    The remaining reduction ensures that the short-word hypothesis applies to face boundaries.
    Suppose a face $Phi$ has consecutive nonloop darts
  $ e : a arrow.r b \, wide f : b arrow.r d $
  with a common label $gamma$ and respective values $epsilon.alt \, phi$. The two darts belong to distinct edges:
    otherwise the edge would occur on both sides of $Phi$ and would be a bridge.
    Let $X \, Y$ be the faces containing $macron(e) \, macron(f)$, respectively.
    They are distinct from $Phi$ and have a common type $j$, namely the other endpoint of $gamma$ from the type of
    $Phi$. They may coincide with each other.
  Remove the two edges and insert an edge $g : a arrow.r d$ along their arcs,
    smoothed through the empty corner of $Phi$ at $b$. Give it value $epsilon.alt phi$ and label $gamma$,
    or make it neutral when that product is $1$. If $a = d$, this produces a loop.
    Keep all vertices, including any that become isolated. At $a \, d$ the new darts occupy the old slots of $e \,
    macron(f)$; at $b$ delete the consecutive slots $macron(e) \, f$.
    These instructions specify the spherical embedding even when vertices or other boundary segments coincide.
    The walk of $Phi$ replaces $e f$ by $g$ and has unchanged evaluation.
  When $X eq.not Y$, write
  $ X = macron(e) D \, wide Y = macron(f) E \, quad D : a arrow.r b \, quad E : b arrow.r d . $
  The walks $D \, E$ avoid the removed edges, so the new graph remains connected.
    The two opposite faces merge to the walk $macron(g) D E$.
    All other walks, apart from the specified change in $Phi$, are unchanged. Its evaluation in $D_j$ is
  #[#set math.equation(numbering: n => "(4.4)")
   $ \( epsilon.alt phi \)^(- 1) D E = phi^(- 1) \( epsilon.alt^(- 1) D \) phi \( phi^(- 1) E \) .
     $ <eq:gluing-smooth-merge>]
  Thus the merged face is ordinary when both old faces were ordinary,
    and exceptional when exactly one was exceptional. This yields a smaller exceptional map.
  The case $X = Y$ requires keeping track of components. Write
  $ X = macron(e) D macron(f) E \, wide D : a arrow.r d \, quad E : b arrow.r b . $
  The slot rules replace this single walk by the two walks
  #[#set math.equation(numbering: n => "(4.5)")
   $ macron(g) D wide upright("and") wide E . $ <eq:gluing-smooth-split>]
  One can read this directly from $sigma alpha$: the transition from $macron(g)$ is the old transition from
    $macron(e)$, and removal of the two slots at $b$ joins the end of $E$ to its beginning.
    If $E$ is empty, the old transitions were $e mapsto f$ and $macron(f) mapsto macron(e)$.
    Equivalently, $sigma \( macron(e) \) = f$ and $sigma \( f \) = macron(e)$,
    so $b$ had degree two and now becomes an isolated vertex with its stipulated empty face.
    If $D$ is empty, then $a = d$ and $macron(g) D$ is the monogon of the new loop.
    Thus the description includes all empty cases. Figure 1 illustrates the local replacement and the two boundary
    walks; all other incidences are suppressed.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-3.61, 0), (-2.28, 0.95), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-2.945, 0.475), [#text(size: 9pt)[$e, epsilon$]], anchor: "south-east", padding: 0.1176cm)
  line((-2.28, 0.95), (-0.95, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.615, 0.475), [#text(size: 9pt)[$f, phi$]], anchor: "south-west", padding: 0.1176cm)
  circle((-3.61, 0), radius: 0.05292, fill: black, stroke: none)
  content((-3.61, 0), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  circle((-2.28, 0.95), radius: 0.05292, fill: black, stroke: none)
  content((-2.28, 0.95), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  circle((-0.95, 0), radius: 0.05292, fill: black, stroke: none)
  content((-0.95, 0), [#text(size: 9pt)[$d$]], anchor: "north", padding: 0.1176cm)
  content((-2.28, 0.2375), [#text(size: 9pt)[$Phi$]])
  content((-3.562, 1.092), [#text(size: 9pt)[$X$]])
  content((-0.9975, 1.092), [#text(size: 9pt)[$Y$]])
  line((-0.475, 0.475), (0.475, 0.475), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((0.95, 0), (3.61, 0), (1.89, 0.4384), (2.67, 0.4384), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.28, 0.3288), [#text(size: 9pt)[$g, epsilon phi$]], anchor: "north", padding: 0.1176cm)
  circle((0.95, 0), radius: 0.05292, fill: black, stroke: none)
  content((0.95, 0), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  circle((2.28, 0.95), radius: 0.05292, fill: black, stroke: none)
  content((2.28, 0.95), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  circle((3.61, 0), radius: 0.05292, fill: black, stroke: none)
  content((3.61, 0), [#text(size: 9pt)[$d$]], anchor: "north", padding: 0.1176cm)
  content((2.28, -0.2375), [#text(size: 9pt)[$Phi$]])
  content((-2.375, -1.425), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$macron(e) D macron(f) E$]]])])
  content((1.235, -1.425), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$macron(g) D$]]])])
  content((2.945, -1.425), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$E$]]])])
  line((-1.615, -1.425), (0.7843, -1.425), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-0.57, -1.425), [#text(size: 9pt)[$X=Y$]], anchor: "south", padding: 0.1176cm)
  content((-2.375, -1.814), [#text(size: 9pt)[one boundary]], anchor: "north", padding: 0.1176cm)
  content((2.09, -1.816), [#text(size: 9pt)[two components]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Smoothing two consecutive nonloop darts of one label. All other incidences are omitted. The opposite faces $X \, Y$ may be the same face; in that case its boundary splits as shown below the local picture. The resulting drawing has two components, as the boundary-walk calculation shows. If $E$ is empty, its component is the isolated vertex $b$. ],
  ) <fig:gluing-smoothing>
  Across the components, the total number of boundary walks increases by one, the edge count decreases by one,
    and the vertex count is unchanged. Formula (4.2) gives exactly two components.
    The new edge places $a \, d$ in one of them. Every component must contain an endpoint of a removed edge,
    because the old graph was connected; hence $b$ is in the other component.
    In particular, the two walks in (4.5) belong to different components.
  Give both walks type $j$, and denote their evaluations by
  $ A = \( epsilon.alt phi \)^(- 1) D \, wide B = E . $
  The old word has evaluation $epsilon.alt^(- 1) D phi^(- 1) B$.
    Moving the first factor $epsilon.alt^(- 1) D$ to the end is a cyclic change of starting point,
    so it preserves identity versus nonidentity. The resulting evaluation is
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( phi^(- 1) B phi \) A . $ <eq:gluing-split-evaluation>]
  If $X$ was exceptional, at least one of $A \, B$ is nonidentity; retain its component.
    If $X$ was ordinary, $A$ and $B$ are either both identity or both nonidentity.
    In the former case keep the component with the original exceptional face,
    whose evaluation is unchanged even if it is $Phi$. In the latter keep the component without that face;
    its new boundary is its sole exception. This again gives a smaller exceptional map.
    We have proved that no face of the minimal map has consecutive nonloop darts with equal labels,
    including the last and first darts of its cyclic boundary walk.
  ===== 4.1.4 Euler’s formula rules out the minimal map. <eulers-formula-rules-out-the-minimal-map.>
  Consider a vertex that is not the base of a loop. Reading the adjacent face types around it gives a closed walk
    in $Delta$. Each incident edge crosses between its two different endpoint types,
    and successive edge labels are distinct by the smoothing reduction. Thus the walk has no immediate reversal.
    Its length is positive since the connected map has edges.
    A simple triangle-free graph has no such closed walk of length less than four,
    so this vertex has degree at least four.
  An ordinary face not incident to a loop has a nonempty boundary walk.
    Indeed every boundary walk of a connected graph with at least one edge is a nonempty dart cycle;
    an empty walk occurs only for an isolated vertex. Its consecutive labels are distinct,
    and the short-word condition (4.1) therefore forces its length to be at least four.
    Here and below a loop counts twice toward its vertex degree, and boundary lengths count dart occurrences.
  For our connected spherical map, Euler’s formula and the two degree sums give
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_v \( 4 - deg v \) + sum_F \( 4 - \| partial F \| \) = 8 . $ <eq:gluing-deficit>]
  Without a loop, only the exceptional face can contribute positively,
    and its nonempty walk contributes at most $3$. With a loop, its base vertex contributes at most $2$,
    the exceptional monogon contributes $3$, and the face on the other side of the loop contributes at most $2$:
    that face is ordinary and cannot have length one, since its sole letter would be the loop’s nonidentity value.
    There are no other loops, so every remaining vertex and face contributes at most zero.
    The total is at most $2 + 3 + 2 = 7$, again contradicting (4.7).
    Consequently no exceptional map exists, and every $D_i^0 arrow.r L$ is injective.
  ===== 4.1.5 Extending to the full vertex groups. <extending-to-the-full-vertex-groups.>
  Let $Omega = L times bb(N)$, with $L$ acting by left multiplication on the first coordinate.
    The restriction to each embedded $D_i^0$ is free and has countably infinitely many orbits.
    The same is true of the left $D_i^0$-action on $D_i times bb(N)$.
    Pair their orbits and choose one point in each pair; this determines a $D_i^0$-equivariant bijection $D_i
    times bb(N) arrow.r Omega$. Transport the free left $D_i$-action along this bijection.
    Its restriction to $D_i^0$ is exactly the original $L$-action. Make this choice separately for each $i$.
    The resulting actions agree on every edge group because both copies of its chosen generator act as $x_gamma in
    L$. They therefore define an action of $Q$ on $Omega$, faithful on every $D_i$.
    This proves the required injections. ◻
]

=== 4.2 Application to the modular construction <application-to-the-modular-construction>

Recall from Section 2 the group $H = A_0 times.r P$, with $P = \( bb(F)_p \)^3$ and
  $A_0 = \( bb(Z) \/ M bb(Z) \)^P$. Its subgroups $U = u \( P \)$ and $V = c U c^(- 1)$ satisfy $U ∩ V = { 1 }$.
  The quotient $G_0$ identifies, for every edge $i < j$, the elements

#[#set math.equation(numbering: n => "(4.8)")
 $ v \( 1 \, macron(j) \, macron(j)^2 \) in H_i \, wide u \( 1 \, macron(i) \, macron(i)^2 \) in H_j \,
   $ <eq:gluing-embeddings>]

where $macron(i)$ denotes the residue of $i$ in $bb(F)_p$.
  Both elements have order $p$, so the corresponding maps from $C_p$ are embeddings.
  We now verify the remaining local condition.

#thm([Proposition 4.2.])[
  #emph[Every natural map $H_i arrow.r G_0$ is injective. In particular, the maps $K \[ H_i \] arrow.r
    K \[ G_0 \]$ induced on group algebras are injective.]
] <prop:first-gluing-injective>

#proof[
  We verify the short-word hypothesis of Lemma 7. At a fixed vertex,
    every incident edge subgroup lies either in $U$ or in $V$.
    Within either subgroup, the labels supplied by distinct neighbors $j$ correspond to the vectors
    $\( 1 \, macron(j) \, macron(j)^2 \)$; a nonidentity syllable corresponds to a nonzero scalar multiple of its
    vector. Any three with distinct residues are independent, because their determinant is, up to sign,
  $ \( macron(j)_2 - macron(j)_1 \) \( macron(j)_3 - macron(j)_1 \) \( macron(j)_3 - macron(j)_2 \) eq.not 0 . $
  The residues are distinct since $p > m$. The analogous first two coordinates show independence for two vectors,
    and a single vector is nonzero. Thus a word of at most three nonidentity syllables with distinct labels,
    all in $U$ or all in $V$, cannot evaluate to $1$.
  For a mixed word of length two or three, one of $U \, V$ supplies exactly one syllable.
    After a cyclic permutation, a putative relation would equate that nonidentity syllable to a product of
    syllables from the other subgroup. This contradicts $U ∩ V = { 1 }$.
    For lengths two and three, cyclically distinct consecutive labels are precisely distinct labels,
    so all required words have been covered. The graph $Gamma$ is simple and triangle-free,
    and all groups in question are finite. The lemma proves the injections.
    The group-algebra assertion follows because distinct elements of an embedded subgroup remain distinct basis
    elements of $K \[ G_0 \]$. ◻
]

== 5 Realizing the local ranks in a common central sector <sec:sector>

An idempotent in a finite group algebra has a well-defined rank as a linear operator.
  We now turn each of these numerical ranks into an isomorphism between modules over one common ring.
  The enlargement of the group is needed because the different simple or modular summands of the original group
  algebra need not have the same rank fraction.

Here are the precise inputs to this step. Let $K$ be a field of characteristic $p$,
  let $M$ be a positive integer prime to $p$, and assume that $K$ contains an element $zeta$ of order $M$.
  In the application, $M = p^4 - 1$ and $\| K \| = p^4$. Write $C_M = bb(Z) \/ M bb(Z)$ and put

$ P = \( bb(F)_p \)^3 \, wide A_0 = \( C_M \)^P \, wide H = A_0 times.r P \, wide w = \| H \| \, $

where $P$ acts on the functions in $A_0$ by translation. Suppose that a countable group $G_0$ contains specified
  copies $H_1 \, dots.h \, H_m$ of $H$. For each $i$, let $e_i in K \[ H_i \]$ be an idempotent,
  and assume that the positive integer

$ d = dim_K e_i K \[ H_i \] $

is independent of $i$. All matrices below act on column vectors in free right modules,
  so their entries multiply coordinates on the left.

#thm([Proposition 5.1.])[
  #emph[Under these assumptions, there is a group $G_1$ containing $G_0$ and a central element $z in
    G_1$ of order $M$ with the following property. Set
$ R = K \[ G_1 \] \, wide f = 1 / M sum_(k = 0)^(M - 1) zeta^(- k) z^k \, wide S = f R \, wide P_i = f e_i . $

 Then $f$ is a nonzero central idempotent. There are explicitly specified matrices
$ J_i in "Mat"_(w times d) \( S \) \, wide Y_i in "Mat"_(d times w) \( S \) $

 satisfying
#[#set math.equation(numbering: n => "(5.1)")
 $ Y_i J_i = f I_d \, wide J_i Y_i = P_i I_w . $ <eq:sector-rectangular>]

 The entries of $J_i$ and $Y_i$ lie in the group algebra of a finite subgroup of $G_1$, multiplied by $f$.
   Their construction uses only finite group operations and linear algebra over $K$.]
] <prop:sector-ranks>

We prove the proposition in three stages. First we attach the finite groups while preserving all the given
  embeddings. Next we describe their $f$-parts as matrix algebras over group algebras of elementary abelian
  $p$-groups. Finally, nilpotence of the corresponding augmentation ideals makes the ranks exact and produces the
  two rectangular matrices.

=== 5.1 Attaching the finite groups <attaching-the-finite-groups>

Let $z$ initially generate an independent copy of $C_M$, and write $Q_(upright("base")) =
  chevron.l z chevron.r times G_0$. For each $i$, define

$ B_i = \( C_M \)^(H_i) \, wide L_i = B_i times.r H_i \, wide \( h dot.op b \) \( x \) = b \( h^(- 1) x \) . $

The groups $B_i$ are written additively. Let $delta_i in B_i$ be the constant function of value $1 in C_M$.
  It has order $M$ and is fixed by $H_i$, so it is central in $L_i$.
  Moreover, $chevron.l delta_i chevron.r ∩ H_i = 1$. Thus $C_i = chevron.l z chevron.r times
  H_i$ embeds in both $Q_(upright("base"))$ and $L_i$, with $\( z^k \, h \)$ sent to $\( k delta_i \, h \)$ in the
  latter. Define $G_1$ to be the quotient of the free product

$ Q_(upright("base")) * L_1 * dots.h.c * L_m $

that identifies these two copies of $C_i$ for every $i$.

For completeness, the following action proves that all the factors embed in this quotient.
  Let $X$ be a countable disjoint union of copies of the left regular $Q_(upright("base"))$-set.
  Its restriction to each $C_i$ is free and has countably infinitely many orbits.
  A countable disjoint union $X_i$ of regular $L_i$-sets has the same property when restricted to $C_i$.
  Pair their $C_i$-orbits and choose one point in each paired orbit;
  extending those point pairings equivariantly gives a $C_i$-equivariant bijection $X arrow.r X_i$.
  Transport the regular $L_i$-action to $X$ using this bijection.
  The resulting actions of $Q_(upright("base")) \, L_1 \, dots.h \, L_m$ agree on every prescribed $C_i$,
  hence define an action of $G_1$ on $X$. Each factor acts faithfully, which proves its injectivity in $G_1$.
  This argument uses the assumed embeddings $H_i arrow.r.hook G_0$ in defining the subgroups $C_i lt.eq
  Q_(upright("base"))$.

The element $z$ is central in every generating factor of $G_1$ and therefore in $G_1$;
  its order is still $M$ because $Q_(upright("base"))$ embeds. In $R$, direct multiplication gives

$ z f = zeta f \, wide f^2 = 1 / M sum_(k = 0)^(M - 1) zeta^(- k) z^k f = f . $

The coefficient of the identity in $f$ is $M^(- 1) eq.not 0$, since the elements $1 \, z \, dots.h \,
  z^(M - 1)$ are distinct. Thus $f$ is a nonzero central idempotent, and $S = f R$ is a ring with identity $f$.
  Each $P_i$ is an idempotent in $f K \[ L_i \]$. Also, any identity $e_i e_j =
  0$ already valid in $K \[ G_0 \]$ remains valid after multiplication by $f$ in $S$.

=== 5.2 The matrix blocks of the central sector <the-matrix-blocks-of-the-central-sector>

Fix $i$ for the moment. A character of $B_i$ means a homomorphism $chi : B_i arrow.r K^(*)$.
  If $b_x$ denotes the coordinate function with value $1$ at $x in H_i$ and $0$ elsewhere,
  then every character is uniquely specified by exponents $a_x in bb(Z) \/ M bb(Z)$ through $chi \( b_x \) =
  zeta^(a_x)$. Define

$ p_chi = frac(1, \| B_i \|) sum_(b in B_i) chi \( b \)^(- 1) b quad upright("in ") K \[ B_i \] . $

Apply the Fourier calculation of Equation (3.3) to the finite index set $H_i$.
  The denominator is invertible because $p divides.not M$. The elements $p_chi$ are a basis of pairwise orthogonal
  idempotents whose sum is $1$, and $b p_chi = chi \( b \) p_chi$.

Use the action

$ \( h chi \) \( b \) = chi \( h^(- 1) dot.op b \) . $

Then $h p_chi h^(- 1) = p_(h chi)$. Since $z = delta_i$ is fixed by $H_i$, the set

$ cal(X)_i = { chi : chi \( z \) = zeta } $

is $H_i$-invariant, and the Fourier formulas give

#[#set math.equation(numbering: n => "(5.2)")
 $ f = sum_(chi in cal(X)_i) p_chi . $ <eq:sector-fourier-f>]

For each orbit in $cal(X)_i$, choose one representative $theta$ and put $T_theta = "Stab"_(H_i) \( theta \)$.

#thm([Lemma 5.2.])[
  #emph[For each such $theta$, the subgroup $T_theta$ is elementary abelian of exponent $p$ and rank at most $3$,
    with the trivial subgroup allowed.]
] <lem:sector-stabilizers>

#proof[
  Write $theta \( b_x \) = zeta^(a_x)$. Since $z = sum_(x in H_i) b_x$, the condition on $theta$ is
  $ sum_(x in H_i) a_x = 1 quad upright("in ") bb(Z) \/ M bb(Z) . $
  Suppose that a nonidentity $g in A_0 ∩ T_theta$ has order $q$.
    The exponent of $A_0$ divides $M$, so $q > 1$ divides $M$.
    Left multiplication by $g$ partitions $H_i$ into cycles of length exactly $q$.
    Invariance of $theta$ says that the exponents $a_x$ are constant on these cycles.
    Their sum consequently lies in $q \( bb(Z) \/ M bb(Z) \)$. It cannot equal $1$:
    reduction modulo $q$ would give $0 = 1$. This contradiction proves $T_theta ∩ A_0 = 1$.
    The quotient homomorphism $H_i arrow.r H_i \/ A_0 tilde.equiv P$ is therefore injective on $T_theta$.
    Every subgroup of the additive group $\( bb(F)_p \)^3$ is an $bb(F)_p$-linear subspace, giving the assertion. ◻
]

Eliminating the prime-to-$p$ part of each stabilizer is what makes its augmentation ideal nilpotent,
  and will permit the later change of basis. We next give the block isomorphism, including its inverse.
  This is the character-orbit construction already used in Section 3, now allowing nontrivial stabilizers;
  compare the Clifford-theoretic orbit picture in #cite(label("Clifford1937Announcement")).
  It will identify the underlying $K$-linear rank of $P_i$ in every block with the same original integer $d$.
  For one orbit representative $theta$, abbreviate

$ T = T_theta \, wide s = \[ H_i : T \] \, wide D = K \[ T \] . $

Choose representatives $r_1 \, dots.h \, r_s$ of the left cosets $h T$.
  The space $K \[ H_i \]$ is a free right $D$-module with this ordered basis.
  Let $g in H_i$ act on it by left multiplication $L_g$, and let $b in B_i$ act diagonally by

$ D_b \( h \) = \( h theta \) \( b \) h wide \( h in H_i \) . $

Both actions commute with the right action of $T$. For the diagonal action this follows from $\( h t \) theta =
  h theta$ for $t in T$. The semidirect-product relation is also respected, because

$ L_g D_b L_g^(- 1) \( h \) = \( \( g^(- 1) h \) theta \) \( b \) h = \( h theta \) \( g dot.op b \) h =
  D_(g dot.op b) \( h \) . $

Thus we have an algebra homomorphism $rho_theta : K \[ L_i \] arrow.r "Mat"_s \( D \)$.
  The element $z$ acts as $zeta$, so $rho_theta \( f \) = I_s$.

For $t_0 in T$ and $1 lt.eq a \, b lt.eq s$, consider

#[#set math.equation(numbering: n => "(5.3)")
 $ p_(r_a theta) thin r_a t_0 r_b^(- 1) . $ <eq:sector-block-inverse>]

It belongs to $f K \[ L_i \]$ by (5.2). In the $theta$-representation it sends $r_b t'$ to $r_a t_0
  t'$ for every $t' in T$ and vanishes on every other basis coset.
  To check the last assertion, its left group factor sends the coset $r_c T$ to $r_a t_0 r_b^(- 1) r_c T$;
  the Fourier projection keeps this coset precisely when it equals $r_a T$, which is equivalent to $c = b$.
  In a representation associated to another orbit, the Fourier projection vanishes identically.
  Consequently (5.3) maps to the matrix with entry $t_0$ in position $\( a \, b \)$ of the $theta$-block and zero
  elsewhere.

Taking the product of these representations gives a surjective map

#[#set math.equation(numbering: n => "(5.4)")
 $ rho : f K \[ L_i \] arrow.r product_theta "Mat"_(\[ H_i : T_theta \]) \( K \[ T_theta \] \) . $ <eq:sector-blocks>]

It is injective as well. The elements $p_chi h$, for $chi in cal(X)_i$ and $h in H_i$, form a basis of its source.
  An orbit of size $s$ contributes $s w = s^2 \| T \|$ basis elements,
  equal to the dimension of the corresponding target block.
  Hence the source and target have equal finite $K$-dimension.
  Formula (5.3), extended linearly in $t_0$ and summed over the positions and blocks, is an explicit inverse of $rho$.

=== 5.3 Turning dimensions into rectangular identities <turning-dimensions-into-rectangular-identities>

Continue in one block and let $E = rho_theta \( P_i \) in "Mat"_s \( D \)$.
  As a $K$-linear operator on $K \[ H_i \]$, $E$ is exactly left multiplication by $e_i$,
  since $f$ acts as the identity. Therefore

#[#set math.equation(numbering: n => "(5.5)")
 $ dim_K "im" E = d . $ <eq:sector-regular-rank>]

This is the link between the original rank calculation and the block decomposition.
  We will now obtain a basis in which $E$ is a coordinate projection over $D$, not just over $K$.
  The argument is a constructive nilpotent-ideal instance of the freeness of projective modules over local rings,
  studied by Kaplansky #cite(label("Kaplansky1958")) Theorem 2; no general projective-module theorem is needed here.

Let $epsilon : D arrow.r K$ be augmentation, and set $frak(a) = ker epsilon$.
  By Lemma 10, we may choose generators $t_1 \, dots.h \, t_q$ of $T tilde.equiv \( C_p \)^q$ with $0 lt.eq
  q lt.eq 3$. The elements $X_j = t_j - 1$ commute, satisfy $X_j^p = 0$, and generate $frak(a)$.
  Expanding $t_j = 1 + X_j$ and counting dimensions gives

$ D tilde.equiv K \[ X_1 \, dots.h \, X_q \] \/ \( X_1^p \, dots.h \, X_q^p \) . $

It follows that

$ frak(a)^(D_max + 1) = 0 \, wide D_max = 3 \( p - 1 \) . $

Indeed, a monomial of total degree greater than $q \( p - 1 \)$ has an exponent at least $p$.
  This also covers $q = 0$, when $D = K$ and $frak(a) = 0$.
  Matrices with entries in $frak(a)$ have the same nilpotence bound under multiplication,
  because each entry of a product of $D_max + 1$ such matrices lies in $frak(a)^(D_max + 1)$.

Put $overline(E) = epsilon \( E \)$, applying augmentation entrywise, and let $d_0 = "rank"_K overline(E)$.
  As $overline(E)$ is idempotent, its image and the image of $I_s -
  overline(E)$ form complementary subspaces of $K^s$. Scan the columns of $overline(E)$ in order and keep each
  column that increases their span; then do the same for $I_s - overline(E)$.
  Build $Q$ by taking the corresponding $d_0$ columns of $E$, followed by the corresponding $s -
  d_0$ columns of $I_s - E$. Its augmentation $Q_0$ is invertible over $K$.
  Regard $Q_0$ as a scalar matrix over $D$, and set $N = Q_0^(- 1) \( Q - Q_0 \)$.
  Its entries belong to $frak(a)$, so $N^(D_max + 1) = 0$. Since $Q = Q_0 \( I_s + N \)$,

#[#set math.equation(numbering: n => "(5.6)")
 $ Q^(- 1) = (sum_(k = 0)^(D_max) \( - N \)^k) Q_0^(- 1) . $ <eq:sector-Q-inverse>]

Each of the first $d_0$ columns of $Q$ is fixed by $E$, and every remaining column is killed by $E$.
  Thus, for $Pi = "diag" \( I_(d_0) \, 0 \)$,

$ E Q = Q Pi \, wide Q^(- 1) E Q = Pi . $

Conjugation by $Q$ preserves $K$-dimension of images. Comparing with (5.5) gives the integer equalities

#[#set math.equation(numbering: n => "(5.7)")
 $ d = d_0 \| T \| \, wide w = s \| T \| \, wide w d_0 = s d . $ <eq:sector-dimensions>]

In particular, these are equalities of ordinary dimensions, not equalities after reduction to $K$.

We can now match coordinates exactly. Order pairs lexicographically and choose the increasing bijection between

$ { \( mu \, l \) : 1 lt.eq mu lt.eq d \, med 1 lt.eq l lt.eq s } quad upright("and") quad { \( lambda \, k \) :
  1 lt.eq lambda lt.eq w \, med 1 lt.eq k lt.eq d_0 } \; $

the sets have equal size by (5.7). Let $V$ be the $w$-by-$d$ block matrix with $s$-by-$s$ entries that sends
  coordinate $\( mu \, l \)$ to its paired coordinate $\( lambda \, k \)$.
  Thus $V_(lambda mu)$ is the sum of standard matrix units $E_(k l)^(upright("std"))$ over all such pairings.
  Let $W$ be the $d$-by-$w$ block matrix reversing each pairing,
  with $W_(mu lambda)$ the corresponding sum of $E_(l k)^(upright("std"))$.
  It sends all unpaired coordinates with $k > d_0$ to zero. Directly on these coordinates,

$ W V = I_d ⊗ I_s \, wide V W = I_w ⊗ Pi . $

Define block matrices

$ J^(\( theta \)) = \( I_w ⊗ Q \) V \, wide Y^(\( theta \)) = W \( I_w ⊗ Q^(- 1) \) . $

They have outer shapes $w times d$ and $d times w$, respectively, with entries in $"Mat"_s \( D \)$. Their products are

$ Y^(\( theta \)) J^(\( theta \)) = I_d ⊗ I_s \, wide J^(\( theta \)) Y^(\( theta \)) = I_w ⊗ E . $

Finally define the $\( lambda \, mu \)$ entry of $J_i$ by applying $rho^(- 1)$ to the tuple
  $\( J_(lambda mu)^(\( theta \)) \)_theta$, and similarly define $Y_i$ entrywise from the $Y^(\( theta \))$.
  The isomorphism (5.4) carries $f$ to the tuple of identity matrices and $P_i$ to the tuple of matrices $E$.
  The last two identities therefore pull back to (5.1). This proves Proposition 9.

All choices in the matrix construction are over finite sets:
  character orbits, coset representatives, augmentation matrices, and coordinate pairings.
  Taking the first element or the first independent columns in fixed orders makes the prescription definite.
  The inverse (5.6) is a finite sum, and the inverse (5.3) is a finite group-algebra formula.
  Thus the matrices furnished by the proposition are finite sums in the explicitly attached finite groups.

We now apply Proposition 9 to the embedded groups of Proposition 8 and the identical idempotents of Proposition 4.
  The group $G_0$ is countable because it is finitely generated.
  All the ranks equal the positive integer $d$ from Equation (3.7).
  Hence the group $G_1$, the nonzero central idempotent $f$, and the matrices $J_i \,
  Y_i$ are now fixed by the constructions above. Corollary 6 also gives $P_i P_j = 0$ on every edge with $i < j$.
  These are precisely the inputs to the next section.

== 6 Compression with a visible nonzero defect <op:compression-section>

We now use only the graph factorization and the precise common-sector output.
  The first lemma is independent of the group construction.
  Its proof explains why ordered edge annihilations, rather than symmetric orthogonality, suffice.

#thm([Lemma 6.1.])[
  (Triangular compression).  #emph[Let $S$ be a nonzero unital algebra over a field $K$, and let $m \, t \, w \,
    d$ be positive integers. Suppose $P_i in S$ are idempotents and $alpha_i \( T \) \, beta_j \( T \) in K$ satisfy
$ F_(i j) = sum_(T = 1)^t alpha_i \( T \) beta_j \( T \) \, wide F_(i i) = 1 \, wide F_(i j) P_i P_j =
  0 quad \( i < j \) . $

 Suppose there are $J_i in "Mat"_(w times d) \( S \)$ and $Y_i in "Mat"_(d times w) \( S \)$ with $Y_i J_i = I_d$,
   $J_i Y_i = P_i I_w$. Then explicit matrices
$ C_sharp in "Mat"_(w t times m d) \( S \) \, wide D_sharp in "Mat"_(m d times w t) \( S \) $

 satisfy $D_sharp C_sharp = I_(m d)$.]
] <op:compression>

#proof[
  Define $C_0$ of shape $t times m$ and $D_0$ of shape $m times t$ by
  $ \( C_0 \)_(T \, j) = beta_j \( T \) P_j \, wide \( D_0 \)_(i \, T) = alpha_i \( T \) P_i . $
  Their product has entries $F_(i j) P_i P_j$. Therefore $D_0 C_0 = cal(P) + cal(N)$, where $cal(P) =
    "diag" \( P_1 \, dots.h \, P_m \)$ and $cal(N)$ is strictly lower triangular. In particular $cal(N)^m = 0$.
    Every off-diagonal entry begins with $P_i$ and ends with $P_j$, so idempotence gives
  $ cal(P)^2 = cal(P) \, wide cal(P) cal(N) = cal(N) = cal(N) cal(P) . $
  This is all the commutation information needed. The finite sum
  $ cal(Q) = cal(P) + sum_(k = 1)^(m - 1) \( - cal(N) \)^k $
  satisfies $cal(Q) \( cal(P) + cal(N) \) = cal(P)$ by cancellation of consecutive powers.
    Put $D_1 = cal(Q) D_0$; then $D_1 C_0 = cal(P)$. For $m = 1$ the sum is empty and the same identity holds.
  Take block diagonals $C_(upright("rep"))$ and $D_(upright("rep"))$ of $w$ copies of $C_0$ and $D_1$.
    Use ordered coordinates $\( lambda \, i \)$ on $S^(w m)$ and $\( lambda \, T \)$ on $S^(w t)$. Their product is
  $ D_(upright("rep")) C_(upright("rep")) = cal(P)_(upright("rep")) := "diag"_(lambda = 1)^w \( cal(P) \) . $
  Define matrices $cal(J) : S^(m d) arrow.r S^(w m)$ and $cal(Y) : S^(w m) arrow.r S^(m d)$ by
  $ cal(J)_(\( lambda \, i \) \, \( j \, mu \)) = delta_(i j) \( J_i \)_(lambda mu) \, wide
    cal(Y)_(\( j \, mu \) \, \( lambda \, i \)) = delta_(i j) \( Y_i \)_(mu lambda) \, quad 1 lt.eq mu lt.eq d . $
  The assumed rectangular identities give $cal(Y) cal(J) = I_(m d)$ and $cal(J) cal(Y) = cal(P)_(upright("rep"))$. Thus
  $ C_sharp = C_(upright("rep")) cal(J) \, wide D_sharp = cal(Y) D_(upright("rep")) $
  have the asserted shapes and satisfy
  $ D_sharp C_sharp = cal(Y) cal(P)_(upright("rep")) cal(J) = cal(Y) cal(J) cal(Y) cal(J) = I_(m d) . $
  Only associativity and the stated identities have been used; the $P_i$ are not assumed to commute. ◻
]

Apply the lemma to $S = f K \[ G_1 \]$, whose identity is $f$.
  Distinct nonedges have $F_(i j) = 0$ by Proposition 3; edges with $i < j$ have $P_i P_j = 0$.
  The rectangular identities are exactly those of Proposition 9. Consequently

#[#set math.equation(numbering: n => "(6.1)")
 $ D_sharp C_sharp = f I_(m d) \, wide C_sharp : S^(m d) arrow.r S^(w t) . $ <op:split>]

The strict, ordinary rational inequalities are

$ t / m < 1 / 100 < 1 / 96 < d / w \, wide r := w t < m d = : N . $

This is more than an abstract rank paradox: it gives a nonzero vector that will certify the reverse-product defect.

#thm([Lemma 6.2.])[
  (A square inverse and its certificate).  #emph[Let $R$ be a unital ring, $f eq.not 0$ a central idempotent,
    and $S = f R$. Suppose $N > r gt.eq 1$ and matrices $C in "Mat"_(r times N) \( S \)$,
    $D in "Mat"_(N times r) \( S \)$ satisfy $D C = f I_N$. Let $iota : S^r arrow.r
    S^N$ include the first $r$ coordinates and $pi : S^N arrow.r S^r$ retain them, with entries $f$ and zero. Then
$ A_R = pi D + \( 1 - f \) I_r \, wide B_R = C iota + \( 1 - f \) I_r $

 satisfy $A_R B_R = I_r$ and $B_R A_R eq.not I_r$. More precisely,
   if $u_(*) in S^N$ has last coordinate $f$ and all others zero, then
$ v_(*) := C u_(*) eq.not 0 \, wide D v_(*) = u_(*) \, wide A_R v_(*) = 0 \, wide \( B_R A_R - I_r \) v_(*) = -
  v_(*) eq.not 0 . $

]
] <op:kernel>

#proof[
  Every entry of $C \, D \, iota \, pi$ belongs to $S$ and is annihilated on both sides by $1 - f$.
    Since $pi iota = f I_r$,
  $ A_R B_R = pi D C iota + \( 1 - f \) I_r = f I_r + \( 1 - f \) I_r = I_r . $
  The vector $u_(*)$ is nonzero because $f eq.not 0$. The equation $D v_(*) = D C u_(*) =
    u_(*)$ proves $v_(*) eq.not 0$. But $N > r$ makes $pi u_(*) = 0$, so
  $ A_R v_(*) = pi D v_(*) + \( 1 - f \) v_(*) = 0 . $
  Multiplying by $B_R$ and subtracting $v_(*)$ gives the final displayed identity and proves the strict reversal
    defect. ◻
]

Using $C = C_sharp$, $D = D_sharp$ in Lemma 12 gives square matrices over the entire algebra $K \[ G_1 \]$,
  not only the $f$-summand. The nonzero certificate is rooted in the exact order of $z$,
  which proves $f eq.not 0$, and then in $D_sharp v_(*) = u_(*)$.
  It does not depend on identifying a coefficient by deciding equality of group words.
  The remaining step is to retain this defect when replacing matrices by scalar elements.

== 7 An injective finite-group encoding <op:scalar-section>

We have a strict matrix one-sided inverse over $K \[ G_1 \]$.
  The finite-factor reduction of Dykema and Juschenko #cite(label("DykemaJuschenko2015")) Lemma 2.1 and
  Theorem 2.2 explains the appropriate next step: put a full matrix algebra inside a finite group algebra and fill
  the complementary summand with the identity. We prove the actual matrix block needed here,
  including its injectivity. Its shift and diagonal operators are the finite Heisenberg model;
  the comparison with #cite(label("GurevichHadani2009")) Section 1.2 is methodological,
  since our cyclic order can be composite and our coefficient field is finite.

#thm([Proposition 7.1.])[
  #emph[Let $K$ be a field, let $M gt.eq 2$ be invertible in $K$, and let $zeta in K$ have order $M$.
    For an integer $q gt.eq 0$ put $Z_q = \( bb(Z) \/ M bb(Z) \)^q$ and $n = M^q$.
    There is a finite group $Lambda$ of order $M n^2$ and a nonzero central idempotent $f' in
    K \[ Lambda \]$ for which explicitly specified elements $Omega_(u v)$, $u \, v in Z_q$,
    form a basis of $f' K \[ Lambda \]$ and obey
$ Omega_(u v) Omega_(s t) = delta_(v s) Omega_(u t) \, wide sum_u Omega_(u u) = f' . $

 Thus $"Mat"_n \( K \) tilde.equiv f' K \[ Lambda \]$ by its standard matrix units.]
] <op:heisenberg>

#proof[
  Use the set $Lambda = Z_q times Z_q times bb(Z) \/ M bb(Z)$ with
  #[#set math.equation(numbering: n => "(7.1)")
   $ \( x \, y \, k \) \( x' \, y' \, k' \) = \( x + x' \, y + y' \, k + k' + y dot.op x' \) . $ <op:heisenberg-law>]
  All coordinates and the dot product use residues modulo $M$. Associativity follows from the bilinear identity
  $ y dot.op x' + \( y + y' \) dot.op x'' = y' dot.op x'' + y dot.op \( x' + x'' \) . $
  The zero tuple is the identity, and the inverse is $\( - x \, - y \, - k + y dot.op x \)$.
    No primality of $M$ is involved. The element $z' = \( 0 \, 0 \, 1 \)$ is central of exact order $M$. Define
  $ f' = 1 / M sum_(k = 0)^(M - 1) zeta^(- k) \( z' \)^k . $
  Reindexing gives $z' f' = zeta f'$, and convolution gives $\( f' \)^2 = f'$.
    The identity coefficient $M^(- 1)$ is nonzero, so $f' eq.not 0$.
  Write $X_x = \( x \, 0 \, 0 \)$ and $Y_y = \( 0 \, y \, 0 \)$, and put
  #[#set math.equation(numbering: n => "(7.2)")
   $ D_v = 1 / n sum_(y in Z_q) zeta^(- y dot.op v) f' Y_y . $ <op:heisenberg-D>]
  The denominator is invertible because $n = M^q$. Character orthogonality here means the direct identity
  #[#set math.equation(numbering: n => "(7.3)")
   $ sum_(y in Z_q) zeta^(y dot.op a) = cases(delim: "{", n \, & a = 0 \,, 0 \, & a eq.not 0 .)
     $ <op:composite-orthogonality>]
  When $a eq.not 0$, choose a nonzero coordinate $a_j$. Translation of the sum by the $j$th coordinate vector
    multiplies it by $zeta^(a_j) eq.not 1$. In the field $K$, this forces the sum to vanish.
    The argument still works when $a_j$ is a zero divisor modulo the composite integer $M$.
  Convolution in the abelian group of $Y_y$ gives $D_v D_t = delta_(v t) D_t$;
    indeed the coefficient of $f' Y_b$ in the product is
  $ zeta^(- b dot.op t) / n^2 sum_(y in Z_q) zeta^(y dot.op \( t - v \)) . $
  Summing Equation (7.2) over $v$ also gives $sum_v D_v = f'$.
    The group law gives $Y_y X_a = \( z' \)^(y dot.op a) X_a Y_y$, and hence
  $ D_v X_a = X_a D_(v - a) . $
  Set
  #[#set math.equation(numbering: n => "(7.4)")
   $ Omega_(u v) = X_(u - v) D_v = X_(u - v) 1 / n sum_(y in Z_q) zeta^(- y dot.op v) f' Y_y . $ <op:matrix-units>]
  Then
  $ Omega_(u v) Omega_(s t) = X_(u - v + s - t) D_(v - s + t) D_t = delta_(v s) Omega_(u t) \, $
  and the diagonal sum is $f'$.
  The multiplication identities alone do not yet prove that this block has no kernel. On $K^(Z_q)$ define
  $ rho \( x \, y \, k \) upright(bold(e))_s = zeta^(k + y dot.op s) upright(bold(e))_(s + x) . $
  The scalar in a composite is $zeta^(k + k' + y dot.op x' + \( y + y' \) dot.op s)$,
    so Equation (7.1) proves that $rho$ is a representation. It sends $f'$ to the identity and $D_v$ to the
    coordinate projection at $v$. Therefore
  $ rho \( Omega_(u v) \) upright(bold(e))_s = delta_(v s) upright(bold(e))_u \, $
  which proves independence of all $n^2$ elements $Omega_(u v)$.
    On the other hand, the $n^2$ elements $f' \( x \, y \, 0 \)$ span $f' K \[ Lambda \]$,
    because $f' \( x \, y \, k \) = zeta^k f' \( x \, y \, 0 \)$.
    Their group-basis supports have distinct $\( x \, y \)$ coordinates, so they too are independent.
    The sector has dimension exactly $n^2$, and the matrix units form a basis.
    When $q = 0$, the empty tuple set has one element: $n = 1$, $Lambda = C_M$, and the sole matrix unit is $f'$.
    All formulas remain valid. ◻
]

The elementary identity-completion step is worth recording separately. Its unit need not be central in the target ring.

#thm([Lemma 7.2.])[
  #emph[Let $Phi : cal(A) arrow.r cal(B)$ be an injective ring homomorphism between unital rings,
    not necessarily preserving their identities, and put $g = Phi \( 1_(cal(A)) \)$.
    If $A B = 1_(cal(A))$ and $B A eq.not 1_(cal(A))$, then
$ a = 1_(cal(B)) - g + Phi \( A \) \, wide b = 1_(cal(B)) - g + Phi \( B \) $

 satisfy $a b = 1_(cal(B))$ and $b a eq.not 1_(cal(B))$.]
] <op:complement>

#proof[
  The element $g$ is idempotent and is an identity on the image of $Phi$ on both sides.
    Thus $1 - g$ annihilates that image on both sides. Expanding the two products gives
  $ a b = 1 - g + Phi \( A B \) = 1 \, wide b a - 1 = Phi \( B A - 1 \) eq.not 0 . $
  Only the last inequality uses injectivity; no global centrality of $g$ is required. ◻
]

#thm([Corollary 7.3.])[
  #emph[Under the field hypotheses of Proposition 13, suppose $A \,
    B in "Mat"_r \( K \[ L \] \)$ for a group $L$ and an integer $r gt.eq 1$, with $A B =
    I_r$ and $B A eq.not I_r$. Finite formulas give a finite group $Lambda$ and $a \,
    b in K \[ L times Lambda \]$ with $a b = 1$ and $b a eq.not 1$.
    In particular, over any fixed finite field with at least three elements,
    a failure of stable finiteness transfers to a scalar failure after a finite direct factor,
    without changing the field.]
] <op:scalar>

#proof[
  Choose the least $q gt.eq 0$ with $n = M^q gt.eq r$. This search is finite, since $M^r gt.eq 2^r gt.eq r$.
    Pad the matrices by identities:
  $ tilde(A) = "diag" \( A \, I_(n - r) \) \, wide tilde(B) = "diag" \( B \, I_(n - r) \) . $
  The padding is empty if $n = r$. Then $tilde(A) tilde(B) = I_n$ and $tilde(B) tilde(A) - I_n =
    "diag" \( B A - I_r \, 0 \) eq.not 0$. Use Proposition 13 and the group-basis identification
    $K \[ L times Lambda \] = K \[ L \] ⊗_K K \[ Lambda \]$. For an $n$-square matrix $T$ over $K \[ L \]$, put
  $ Phi \( T \) = sum_(u \, v in Z_q) T_(u v) ⊗ Omega_(u v) . $
  The matrix-unit products prove multiplicativity, with $Phi \( I_n \) = 1 ⊗ f'$.
    Independence of the $Omega_(u v)$ gives injectivity: extend their coordinate dual functionals to
    $K \[ Lambda \]$ and apply each in the second tensor factor to recover $T_(u v)$.
    This works even when $K \[ L \]$ has zero divisors.
  Lemma 14 now yields the promised finite sums
  #[#set math.equation(numbering: n => "(7.5)")
   $ a & = 1 ⊗ \( 1 - f' \) + sum_(u \, v in Z_q) tilde(A)_(u v) ⊗ Omega_(u v) \,\
b & = 1 ⊗ \( 1 - f' \) + sum_(u \, v in Z_q) tilde(B)_(u v) ⊗ Omega_(u v) . $ <op:scalar-formulas>]
  Their full scalar product is one, and their reverse defect is $Phi \( tilde(B) tilde(A) - I_n \) eq.not 0$.
    For a finite field of order $Q gt.eq 3$, take $M = Q - 1$ and a generator of its multiplicative group.
    Then $M gt.eq 2$ is invertible in the field, so the preceding construction applies. ◻
]

#proof[
  Lemma 2 supplies the specified odd prime and field of order $p^4$.
    Propositions 3 and 4 give the graph fit and the strict regular-rank comparison.
    Proposition 8 embeds the local groups in $G_0$, and Proposition 9 places their ranks in the nonzero ring $f
    K \[ G_1 \]$ with the required rectangular identities. Corollary 6 supplies every ordered edge product.
    Lemmas 11 and 12 produce $A_R \, B_R in "Mat"_r \( K \[ G_1 \] \)$, with their nonzero certificate.
    Corollary 15, using $L = G_1$ and $M = p^4 - 1$, gives $G = G_1 times Lambda$ and the sums in Equation (7.5).
    Their product is one and their reverse-product defect is nonzero by the injectivity of the matrix encoding.
  The group $G_0$ is generated by the finite groups $H_i$. The construction of $G_1$ adds only $chevron.l z
    chevron.r$ and the finitely many finite groups $L_i$, and $Lambda$ is finite. Thus $G$ is finitely generated.
    The embedded copy of any $H_i$ supplies nontrivial torsion.
    All field, group and coefficient choices were given by finite formulas and fixed orders, as required. ◻
]

===== 7.1 Finite prescriptions and scope. <finite-prescriptions-and-scope.>

Every choice of character, basis, field element, or finite inverse occurs in an explicitly finite set.
  Products of the resulting group words define finite group-algebra sums even when different words happen to
  coincide. No word comparisons are needed to define the elements,
  and the kernel certificate and injective matrix block certify the nonzero reverse defect.
  The countable permutation actions used to certify group embeddings are not coefficient-search inputs.

Containing torsion does not say that every element has finite order.
  The group must be infinite, since finite-dimensional left multiplication proves direct finiteness for every
  finite group algebra, in modular characteristic as well as otherwise.
  The coefficient field throughout remains the specified $K$ of order $p^4$.

More generally, the supports of any two finite sums in a group algebra generate a finitely generated subgroup.
  Its group algebra embeds by the group bases, preserving both a one-sided product and its nonzero reverse defect.
  Thus a universal direct-finiteness theorem for finitely generated groups would already imply the assertion for
  all groups.

== 8 The cellular automaton on all configurations <op:cellular-section>

The final transfer is short and characteristic-independent.
  We give it locally to fix the multiplication order and the meaning of a missing configuration.
  Its group-ring ancestry appears in #cite(label("ElekSzabo2004")) Section 1 and the linear theory
  of #cite(label("CSCCoornaert2006")).

For any field $k$, group $L$, and finite sum $c = sum_u c_u u in k \[ L \]$, define on all functions $x : L arrow.r k$

$ \( T_c x \) \( g \) = sum_u c_u x \( g u \) . $

Only the coefficient sum is finite; $x$ may have infinite support. Expanding the two finite sums gives

#[#set math.equation(numbering: n => "(8.1)")
 $ \( T_c T_d x \) \( g \) = sum_(u \, v) c_u d_v x \( g u v \) = \( T_(c d) x \) \( g \) . $ <op:cellular-product>]

Thus $T_c T_d = T_(c d)$ and $T_1 = upright("id")$. If $delta_h$ is the point indicator at $h$,
  then $\( T_c delta_h \) \( 1_L \) = c_h$, which also proves faithfulness.

#thm([Proposition 8.1.])[
  #emph[Let $k$ be a finite field, $L$ a group, and $a \, b in k \[ L \]$ with $a b = 1$.
    Then $T_b : k^L arrow.r k^L$ is an injective cellular automaton, with
$ "im" T_b = { y in k^L : T_(b a) y = y } . $

 For every $h$ with $\( b a - 1 \)_h eq.not 0$, the configuration $delta_h$ is absent from its image.]
] <op:cellular>

#proof[
  The support of $b$ is a finite memory set with rule $\( x_u \)_u mapsto sum_u b_u x_u$.
    Equation (8.1) gives $T_a T_b = T_(a b) = upright("id")$, proving injectivity.
    If $y = T_b x$, then $T_(b a) y = T_b T_a T_b x = y$. Conversely, a fixed point of $T_(b a)$ has $y =
    T_b \( T_a y \)$, hence lies in the image. Finally,
  $ \( T_(b a) delta_h - delta_h \) \( 1_L \) = \( b a - 1 \)_h eq.not 0 \, $
  so $delta_h$ is not a fixed point and cannot be in the image. ◻
]

Apply the proposition to the scalar sums in Equation (7.5).
  Their nonzero defect has a nonzero coefficient in the group basis,
  so the resulting automaton is injective and nonsurjective.
  The missing point indicator has no preimage even among infinitely supported configurations.
  If the finite formula for $b$ displays a group element more than once,
  its terms simply add in the same local rule; specifying the rule requires no word-problem oracle.
  Thus the constructed group also gives a negative answer to Gottschalk’s surjunctivity conjecture.

#bibliography("refs.bib", style: "ieee", title: [References])
