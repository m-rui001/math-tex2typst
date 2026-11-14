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

#align(center)[#text(size: 16pt, weight: "bold")[A power improvement in the Heilbronn triangle lower bound]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <intro:section>

For three points $p \, q \, r in bb(R)^2$, write

$ "Area" \( p q r \) = 1 / 2 \| det \( q - p \, r - p \) \| . $

If $P subset \[ 0 \, 1 \]^2$ is finite and $\| P \| gt.eq 3$, define

$ Delta \( P \) = min_({ p \, q \, r } in binom(P, 3)) "Area" \( p q r \) \, wide Delta \( n \) =
  max_(P subset \[ 0 \, 1 \]^2\
\| P \| = n) Delta \( P \) . $

The minimum is over all unordered triples of distinct points.
  In particular, a collinear triple makes $Delta \( P \) = 0$. The maximum defining $Delta \( n \)$ exists:
  the minimum area is continuous on the compact space of ordered $n$-tuples,
  it is positive for suitable points on a parabola, and a tuple with a repeated point has minimum area zero.

The original Heilbronn conjecture asked whether $Delta \( n \) = O \( n^(- 2) \)$;
  see Roth #cite(label("Roth1951")) p. 198. Two elementary constructions attain this scale.
  Erdős’s finite-field parabola, recorded in Roth #cite(label("Roth1951")) Appendix,
  gives a grid configuration whose triangle determinants are nonzero integers before scaling.
  Random sampling followed by deleting one point from each small triangle also gives $Delta \( n \) gt.double
  n^(- 2)$. Komlós, Pintz and Szemerédi improved this to $Delta \( n \) gt.double \( log n \) \/ n^2$,
  disproving the original conjecture #cite(label("KPS1982")).
  Their argument represents the small-area triples in a random point set as edges of a hypergraph,
  removes short cycles, and uses a stronger independence bound to select a large subset containing none of those
  triples #cite(label("KPS1982")) Section 2.

The almost $n^(- 2)$ formulation, discussed in Zakharov’s survey #cite(label("Zakharov2026")) Section 3,
  asks whether, for every $epsilon > 0$, there are constants $C_epsilon$ and $n_0 \( epsilon \)$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ Delta \( n \) lt.eq C_epsilon n^(- 2 + epsilon) wide \( n gt.eq n_0 \( epsilon \) \) . $ <intro:almost>]

We disprove this formulation by a power improvement in the lower bound.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $eta \, c_1 > 0$ and an integer $n_0 gt.eq 3$ such that
$ Delta \( n \) gt.eq c_1 n^(- 2 + eta) wide upright("for every integer ") n gt.eq n_0 . $

]
] <intro:main>

In particular, $Delta \( n \) gt.eq n^(- 2 + eta \/ 2)$ for every sufficiently large $n$.
  The ratio of the theorem’s lower bound to $n^(- 2 + eta \/ 2)$ is $c_1 n^(eta \/ 2) arrow.r oo$,
  which contradicts (1.1) at $epsilon = eta \/ 2$. Section 8 gives an explicit, though extremely small,
  admissible exponent.

On the upper-bound side, Roth #cite(label("Roth1951")) proved the first $o \( n^(- 1) \)$ estimate by a
  density-increment argument, followed by refinements of Schmidt #cite(label("Schmidt1972")) and
  Roth #cite(label("Roth1972a")) #cite(label("Roth1972b")).
  Komlós, Pintz and Szemerédi #cite(label("KPS1981")) refined Roth’s analytic method to obtain $Delta \( n \)
  lt.double_epsilon n^(- 8 \/ 7 + epsilon)$. Cohen, Pohoata and Zakharov developed new incidence-geometric
  approaches, first obtaining $Delta \( n \) lt.eq n^(- 8 \/ 7 - 1 \/ 2000)$ for sufficiently large
  $n$ #cite(label("CPZ2023")) Theorem 1.1, and subsequently proving $Delta \( n \) lt.double_epsilon
  n^(- 7 \/ 6 + epsilon)$ for every $epsilon > 0$ #cite(label("CPZ2025")) Theorem 1.8.

Earlier preprints claim stronger power lower bounds than ours, with unresolved issues in the following versions.
  Ellmann’s version 12 acknowledges an unproved local uniformity assumption and describes the argument as
  heuristic #cite(label("Ellmann2025")) p. 3; the deletion estimate uses this
  assumption #cite(label("Ellmann2025")) Theorem 4, pp. 5–6.
  In Agama’s version 13, Theorem 4.1 #cite(label("Agama2026")) pp. 12–13,
  counting the center with the boundary points introduces a collinear triple consisting of the two endpoints of a
  diameter and their midpoint. Omitting the center leaves the every-triple estimate unproved,
  since the argument estimates triangles formed by the center and adjacent boundary points.
  These objections concern the cited arguments, not the impossibility of their asserted bounds.

=== 1.1 The two congruence conditions <the-two-congruence-conditions>

The proof works first with integer columns $u = \( u_1 \, u_2 \, u_3 \)^(sans(T))$ in a box of the form

$ 0 lt.eq u_1 \, u_2 < N \, wide N lt.eq u_3 < 2 N . $

Such a column represents the unit-square point $pi \( u \) = \( u_1 \/ u_3 \, u_2 \/ u_3 \)$.
  Three columns forming a matrix $A$ give a triangle of area

#[#set math.equation(numbering: n => "(1.2)")
 $ frac(\| det A \|, 2 A_31 A_32 A_33) . $ <intro:area>]

We therefore seek many columns for which proportional pairs and triples with small absolute determinant are
  sufficiently rare to delete.

The first congruence condition separates most triples before they are lifted to integers.
  Give each column an independent uniform label $xi in bb(F)_(r^d)$,
  where $d$ is fixed and odd and the prime $r$ grows. The columns $\( 1 \, xi \, xi^2 \)^(sans(T))$ have nonzero
  determinant whenever their labels are distinct. This is the finite-field parabola underlying Erdős’s
  construction recorded in Roth #cite(label("Roth1951")) Appendix.
  Taking the field norm to $bb(F)_r$ produces an alternating polynomial in three groups of coordinates.
  We express that polynomial as a sum of monomial determinants and encode it in one designated coefficient of a
  determinant whose entries are base-$B$ expansions. Large-base control of carries has classical precedents in the
  progression-free constructions of Salem and Spencer #cite(label("SalemSpencer1942")) and
  Behrend #cite(label("Behrend1946")); here it isolates a determinant coefficient.
  Modulo $h = B^k$, with $k$ fixed, distinct labels then preclude a small determinant.
  Independent choices of digits with the prescribed residues leave enough randomness even when labels coincide.

A common random matrix of determinant one mixes the three rows modulo $h$ without changing their determinant.
  Conditional on the digit columns, the resulting matrix is uniform on a special-linear orbit.
  The rows of every integral lift lie in a lattice whose index, together with the orbit size,
  can be read from a diagonal form. An anisotropic lattice count controls lifts of any fixed nonzero determinant,
  while a conditional moment bound handles singular digit matrices and repeated labels.

The fixed nonzero-determinant count does not cover determinant zero,
  where all three rows can lie in one integral plane. We control this case with a second congruence condition.
  At an independent prime $q$, choose residues from a small portion of an affine quadratic surface with no three
  points on a line. A carefully restricted random translation excludes short integer relations;
  a random invertible linear map permits uniform counting. The Chinese remainder theorem combines the two
  congruence conditions, and uniform lifting supplies integer columns in the box.

For a singular lifted matrix with pairwise distinct projected columns,
  a primitive integer null vector determines a rank-two row lattice.
  We sum over those vectors, treating equal residue columns and low rank modulo $q$ separately.
  This supplies the missing count for collinear projected triples.

The exceptional triples require repeated labels, whose probability provides the saving used in an elementary
  deletion argument. Thus the improvement comes from the arithmetic distribution of sampled points.
  Formula (1.2) then transfers the determinant bound to every triangle of the retained point set.

=== 1.2 Organization and conventions <organization-and-conventions>

Section 2 proves the lattice estimates. Section 3 constructs the norm polynomial and digit distribution,
  and Section 4 estimates its matrix orbits. Section 5 constructs the auxiliary residues.
  Sections 6 and 7 count small determinants, including zero.
  Section 8 completes the deletion and scaling argument and passes to every sufficiently large cardinality.
  Appendix 9 gives the elementary prime-interval proof used in the parameter choices and interpolation.

Lengths are Euclidean. A primitive integer vector has coordinates with greatest common divisor one.
  The covolume of a lattice is measured in its real span. The notation $F lt.double G$ means $\| F \| lt.eq C G$;
  constants may depend on the fixed construction parameters,
  but never on the growing prime or on the sampled labels and columns. All logarithms are natural.

== 2 Lattice counts with a prescribed determinant <lat:section>

We prove a uniform bound for integer matrices whose rows belong to a fixed lattice and whose determinant is a
  prescribed nonzero integer. The lattice may have very different scales in different directions,
  so the proof keeps track of three separate column bounds.
  We also record the plane counts needed when the determinant is zero.

All lengths in this section are Euclidean. The determinant of a lattice means its covolume in its real span.
  For a lattice $L$ of positive rank $s$, choose $v_1 \, dots.h \, v_s$ successively,
  with $v_i$ a shortest lattice vector outside $"span"_(bb(R)) \( v_1 \, dots.h \, v_(i - 1) \)$,
  and put $lambda_i = \| v_i \|$. In particular, $0 < lambda_1 lt.eq dots.h.c lt.eq lambda_s$.
  The notation $A lt.double B$ means $A lt.eq C B$ for an absolute constant $C$, unless dependence is indicated.

The classical geometry-of-numbers antecedent is Minkowski’s second theorem on successive minima;
  see Henk #cite(label("Henk2002")) Theorem 1.3. Only the weaker fixed-dimensional Euclidean product bound below
  is needed here, and we include its proof.

#thm([Lemma 2.1.])[
  (Successive lengths).  #emph[For a lattice $L$ of positive rank $s$ and the lengths just defined,
$ det L lt.eq product_(i = 1)^s lambda_i lt.eq s^(s \/ 2) det L . $

 Consequently, the lattice generated by $v_1 \, dots.h \, v_s$ has index at most $s^(s \/ 2)$ in $L$.]
] <lat:successive>

#proof[
  The determinant of the lattice generated by the $v_i$ is an integer multiple of $det
    L$ and is at most $product_i lambda_i$. For the reverse bound,
    choose orthonormal coordinates whose first $j$ directions span $v_1 \, dots.h \, v_j$ for each $j$. Let
  $ Q = { \( a_1 \, dots.h \, a_s \) : \| a_i \| < lambda_i \/ sqrt(s) upright(" for every ") i } . $
  If a nonzero lattice vector in $Q$ has last nonzero coordinate $j$,
    it lies outside the preceding span and has length strictly less than $lambda_j$, a contradiction.
    The translates of $Q \/ 2$ by $L$ are therefore disjoint.
    Integrating their indicator functions over a fundamental domain of $L$ gives $"vol" \( Q \/ 2 \) lt.eq det L$.
    Since $"vol" \( Q \/ 2 \) = s^(- s \/ 2) product_i lambda_i$, the result follows. ◻
]

#thm([Lemma 2.2.])[
  (Points in a plane lattice).  #emph[Let $L$ be a rank-two Euclidean lattice with successive lengths $lambda_1
    lt.eq lambda_2$. If $R gt.eq lambda_2$, any translate of $L$ has at most $C R^2 \/ det
    L$ points in any ball of radius $R$. If $R < lambda_2$, the points of $L$ in the ball of radius $R$ centered
    at zero lie in a line and number at most $1 + 2 R \/ lambda_1$.]
] <lat:plane-count>

#proof[
  For the first assertion let $L_0 = bb(Z) v_1 + bb(Z) v_2$.
    A half-open fundamental parallelogram for $L_0$ has diameter at most $lambda_1 + lambda_2 lt.eq 2 R$.
    For each coset of $L_0$, attach such a parallelogram to every point in the ball.
    The parallelograms are disjoint and lie in a disk of radius at most $3 R$ in the affine span.
    Thus each coset contributes at most $9 pi R^2 \/ det L_0$ points.
    Summing over $\[ L : L_0 \]$ cosets proves the first assertion.
    For the second, every lattice vector outside $bb(R) v_1$ has length at least $lambda_2$.
    The lattice on $bb(R) v_1$ is $bb(Z) v_1$, since a shorter generator would contradict the choice of $v_1$.
    Counting its multiples proves the bound. ◻
]

#thm([Lemma 2.3.])[
  (Covolumes of integral planes).  #emph[Let $y in bb(Z)^3$ be primitive,
    meaning that its coordinates have greatest common divisor one.
    Then $L_y = bb(Z)^3 ∩ y^perp$ has determinant $\| y \|$. More generally,
    if $Lambda subset.eq bb(Z)^3$ is a full-rank lattice of index $I$ and $y dot.op Lambda = g bb(Z)$ with $g > 0$, then
$ det \( Lambda ∩ y^perp \) = frac(I \| y \|, g) . $

]
] <lat:plane-covolume>

#proof[
  Choose $u in Lambda$ with $y dot.op u = g$. The map $v mapsto y dot.op v \/ g$ maps $Lambda$ onto $bb(Z)$,
    has kernel $Lambda ∩ y^perp$, and splits by $1 mapsto u$.
    Hence a basis of the kernel together with $u$ is a basis of $Lambda$.
    The height of $u$ above $y^perp$ is $g \/ \| y \|$, which proves the formula.
    For $Lambda = bb(Z)^3$, primitivity gives $g = 1$. ◻
]

We next count matrices with unequal column bounds. The difficult case occurs when the third-column radius reaches
  only one direction of its integral plane; we count those planes through their shortest vectors.

#thm([Lemma 2.4.])[
  (Unequal column bounds).  #emph[Let $R_1 gt.eq R_2 gt.eq R_3 gt.eq 1$ and let $t in bb(Z) \\ { 0 }$.
    The number of triples $u_1 \, u_2 \, u_3 in bb(Z)^3$ satisfying $\| u_j \| lt.eq
    R_j$ and $det \( u_1 \, u_2 \, u_3 \) = t$ is at most
$ C \( R_1 R_2 R_3 \)^2 #scale(x: 120%, y: 120%)[\(] log \( 2 R_1 \) #scale(x: 120%, y: 120%)[\)]^2 . $

 The constant is independent of $t$ and of the three radii.]
] <lat:anisotropic>

#proof[
  The columns $u_2 \, u_3$ are independent. Choose a primitive normal $y$ to their plane,
    fixing its sign by requiring its first nonzero coordinate to be positive.
    Then $u_2 times u_3 = a y$ for some nonzero integer $a$, so $\| y \| lt.eq R_2 R_3$.
    If $mu_1 \, mu_2$ are the successive lengths of $L_y$, the columns imply $mu_1 lt.eq R_3$ and $mu_2 lt.eq R_2$.
  For fixed $u_2 \, u_3$, the determinant equation is $u_1 dot.op y = t \/ a$.
    Its integral solutions are either absent or form a translate of $L_y$.
    By Lemmas 3 and 4, at most $C R_1^2 \/ \| y \|$ satisfy the first-column bound;
    the required hypothesis is $mu_2 lt.eq R_2 lt.eq R_1$. For a fixed normal $y$,
    there are likewise at most $C R_2^2 \/ \| y \|$ choices for $u_2$.
  First suppose $mu_2 lt.eq R_3$. There are at most $C R_3^2 \/ \| y \|$ choices for $u_3$.
    The resulting bound, summed over normals, is
  $ C \( R_1 R_2 R_3 \)^2 sum_(y in bb(Z)^3\
0 < \| y \| lt.eq R_2 R_3) \| y \|^(- 3) lt.double \( R_1 R_2 R_3 \)^2 log \( 2 R_2 R_3 \) . $
  The last estimate follows by splitting the integer vectors into dyadic shells; a shell of radius $Y gt.eq
    1$ has $O \( Y^3 \)$ vectors.
  It remains to treat $mu_2 > R_3$. Group the normals by powers of two $U \, Z gt.eq 1$ with
  $ U lt.eq mu_1 < 2 U \, wide Z lt.eq mu_2 < 2 Z . $
  Lemma 2 gives $\| y \| asymp U Z$. There are at most $C U^4 Z^2$ normals in such a group.
    Indeed, choose a shortest nonzero vector $z in L_y$. It is primitive in $bb(Z)^3$,
    because division by a common divisor would produce a shorter vector in $L_y$.
    Its length is in $\[ U \, 2 U \)$, giving $O \( U^3 \)$ choices.
    For each such $z$, the possible normals lie in $L_z$ and have length less than $4 U Z$.
    If $nu_1 \, nu_2$ are the successive lengths of $L_z$, integrality gives $nu_1 gt.eq 1$,
    and the preceding lemmas give
  $ nu_2 lt.eq nu_1 nu_2 lt.eq 2 \| z \| < 4 U lt.eq 4 U Z . $
  Consequently Lemma 3, applied at radius $4 U Z$, bounds their number by $C \( U Z \)^2 \/ \| z \| lt.eq
    C U Z^2$. This proves the claimed normal count.
  For each of these normals, all eligible third columns lie on the line of a shortest vector.
    Lemma 3 gives at most $1 + 2 R_3 \/ mu_1 lt.double R_3 \/ U$ choices, since $U lt.eq mu_1 lt.eq R_3$.
    Thus the contribution of one dyadic group is at most
  $ C U^4 Z^2 thin frac(R_1^2, U Z) thin frac(R_2^2, U Z) thin R_3 / U = C R_1^2 R_2^2 R_3 U lt.eq
    C \( R_1 R_2 R_3 \)^2 . $
  There are $O \( log \( 2 R_3 \) log \( 2 R_2 \) \)$ groups, since $1 lt.eq U lt.eq R_3$ and $1 lt.eq Z lt.eq
    R_2$. Combining both cases proves the assertion. ◻
]

#thm([Proposition 2.5.])[
  (A fixed nonzero determinant).  #emph[Let $Lambda subset.eq bb(Z)^3$ have index $I$, let $X gt.eq 2$,
    and suppose its third successive length satisfies $lambda_3 lt.eq X$.
    For every $t in bb(Z) \\ { 0 }$, the number of $3$ by $3$ matrices with rows in $Lambda$,
    row lengths at most $X$, and determinant $t$ is at most
$ C #scale(x: 120%, y: 120%)[\(] log \( 2 X \) #scale(x: 120%, y: 120%)[\)]^2 X^6 / I^2 . $

 The constant is absolute.]
] <lat:fixed-det>

#proof[
  Let $V$ be the matrix whose rows are the successive shortest vectors $v_1 \, v_2 \, v_3$,
    and let $Lambda_0$ be their integer span. By Lemma 2,
  $ m = \[ Lambda : Lambda_0 \] = frac(\| det V \|, I) lt.eq 3^(3 \/ 2) . $
  Since the finite group $Lambda \/ Lambda_0$ has order $m$,
    each $u in Lambda$ has coordinates in $m^(- 1) bb(Z)$ relative to this basis.
    If $u = sum_j alpha_j v_j$ and $\| u \| lt.eq X$, Cramer’s rule gives
  $ \| alpha_j \| lt.eq frac(X product_(i eq.not j) lambda_i, \| det V \|) lt.eq 3^(3 \/ 2) X / lambda_j . $
  Thus the map $A mapsto Q = m A V^(- 1)$ is injective and takes the matrices under consideration to integral
    matrices. Their common determinant is $m^3 t \/ det V eq.not 0$.
    If this number is not an integer, there are no such matrices; otherwise Lemma 5 applies.
  The $j$th column of $Q$ has length at most $R_j = C_0 X \/ lambda_j$,
    where $C_0$ is an absolute constant chosen sufficiently large.
    These radii satisfy $R_1 gt.eq R_2 gt.eq R_3 gt.eq 1$. Moreover, integrality of $Lambda$ gives $lambda_j gt.eq
    1$, and Lemma 2 gives
  $ R_j lt.eq C_0 X \, wide R_1 R_2 R_3 = frac(C_0^3 X^3, lambda_1 lambda_2 lambda_3) lt.eq frac(C_0^3 X^3, I) . $
  The bound in Lemma 5 is therefore the claimed one. ◻
]

== 3 A determinant obstruction from field norms <norm:section>

We construct random columns modulo a prime power, each carrying a label in a finite field.
  Three distinct labels will force the determinant residue to have no small integer representative.
  The construction first expresses a field norm as a sum of determinants,
  then places these summands at one specified coefficient in a base expansion.

=== 3.1 The norm polynomial <the-norm-polynomial>

Fix

#[#set math.equation(numbering: n => "(3.1)")
 $ d = 41 \, wide M = binom(4 d - 1, d) \, wide T = binom(M, 3) \, wide k = T^2 + 1 . $ <norm:fixed-parameters>]

Let $r$ be an odd prime. We recall the elementary finite-field facts needed here;
  see #cite(label("LidlNiederreiter1994")) Chapter 2 for background.
  In a splitting field over $bb(F)_r$, the roots of $X^(r^d) - X$ form a field:
  the Frobenius identity shows closure under addition, subtraction and multiplication,
  and nonzero roots are closed under inversion. The derivative is $- 1$,
  so there are exactly $r^d$ distinct roots. This field, denoted $K = bb(F)_(r^d)$,
  consequently has dimension $d$ over $bb(F)_r$. Its automorphism $t mapsto
  t^r$ has $d$th power equal to the identity, and its fixed elements are exactly the $r$ roots of $X^r - X$,
  namely $bb(F)_r$. For $t in K$, the product $product_(j = 0)^(d - 1)
  t^(r^j)$ is therefore fixed by Frobenius and belongs to $bb(F)_r$; it is nonzero if $t eq.not 0$.
  Choose an $bb(F)_r$-basis $beta_1 \, dots.h \, beta_d$ of $K$.
  For a group $X = \( X_(i nu) \)_(1 lt.eq i lt.eq 3 \, thin 1 lt.eq nu lt.eq d)$ of $3 d$ variables, define

$ Z \( X \) =
  (sum_(nu = 1)^d beta_nu X_(1 nu) \, sum_(nu = 1)^d beta_nu X_(2 nu) \, sum_(nu = 1)^d beta_nu X_(3 nu))^(sans(T)) . $

For three disjoint variable groups $X^(\( 1 \)) \, X^(\( 2 \)) \, X^(\( 3 \))$, put

$ cal(D) = det #scale(x: 120%, y: 120%)[\(] Z \( X^(\( 1 \)) \) \, Z \( X^(\( 2 \)) \) \,
  Z \( X^(\( 3 \)) \) #scale(x: 120%, y: 120%)[\)] . $

Let $sigma$ act on this polynomial ring by applying $c mapsto
  c^r$ to coefficients in $K$ and fixing every variable. Define

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(N) \( X^(\( 1 \)) \, X^(\( 2 \)) \, X^(\( 3 \)) \) =
   product_(j = 0)^(d - 1) sigma^j \( cal(D) \) . $ <norm:polynomial>]

The action of $sigma$ permutes the factors, so $cal(N)$ has coefficients in $bb(F)_r$.
  It is homogeneous of degree $d$ in each group. At arguments in $bb(F)_r^(3 d)$,
  it evaluates to the field norm of the corresponding determinant:

$ cal(N) \( U^(\( 1 \)) \, U^(\( 2 \)) \, U^(\( 3 \)) \) & =
  "Nm"_(K \/ bb(F)_r) det #scale(x: 120%, y: 120%)[\(] Z \( U^(\( 1 \)) \) \, Z \( U^(\( 2 \)) \) \,
  Z \( U^(\( 3 \)) \) #scale(x: 120%, y: 120%)[\)] \,\
"Nm"_(K \/ bb(F)_r) \( t \) & = product_(j = 0)^(d - 1) t^(r^j) . $

Indeed, coefficient conjugation commutes with evaluation at such arguments.
  Transposing two variable groups changes the sign of each factor in (3.2). Since $d$ is odd, $cal(N)$ is alternating.

#thm([Lemma 3.1.])[
  #emph[There exist homogeneous degree-$d$ polynomials $f_(i a) in
    bb(F)_r \[ X \]$ (allowing the zero polynomial), for $1 lt.eq i lt.eq 3$ and $0 lt.eq a < T$, such that
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(N) \( X^(\( 1 \)) \, X^(\( 2 \)) \, X^(\( 3 \)) \) =
   sum_(a = 0)^(T - 1) det #scale(x: 120%, y: 120%)[\(] f_(i a) \( X^(\( j \)) \)
   #scale(x: 120%, y: 120%)[\)]_(1 lt.eq i \, j lt.eq 3) . $ <norm:determinant-sum>]

 For each $a$, the three polynomials are obtained from three distinct degree-$d$ monomials by multiplying the
   first by a scalar that may be zero.]
] <norm:decomposition>

#proof[
  List the degree-$d$ monomials in $3 d$ variables as $m_1 \, dots.h \, m_M$.
    Expand $cal(N)$ in products $m_p \( X^(\( 1 \)) \) m_q \( X^(\( 2 \)) \) m_s \( X^(\( 3 \)) \)$.
    If two of $p \, q \, s$ coincide, the coefficient equals its negative under the corresponding transposition,
    and hence is zero because $r$ is odd. For each $p < q < s$,
    let $c_(p q s)$ be the coefficient of $m_p \( X^(\( 1 \)) \) m_q \( X^(\( 2 \)) \) m_s \( X^(\( 3 \)) \)$.
    Alternation identifies the other five coefficients with the signs in
  $ c_(p q s) det
    mat(delim: "(", m_p \( X^(\( 1 \)) \), m_p \( X^(\( 2 \)) \), m_p \( X^(\( 3 \)) \); m_q \( X^(\( 1 \)) \),
    m_q \( X^(\( 2 \)) \), m_q \( X^(\( 3 \)) \); m_s \( X^(\( 1 \)) \), m_s \( X^(\( 2 \)) \), m_s \( X^(\(
    3 \)) \)) . $
  Enumerate the $T$ triples $p < q < s$ by $a$, and take
  $ \( f_(1 a) \, f_(2 a) \, f_(3 a) \) = \( c_(p q s) m_p \, m_q \, m_s \) . $
  This argument uses no division by $3 !$, so it applies also when $r = 3$. ◻
]

For a label $xi in K$, set $z \( xi \) = \( 1 \, xi \, xi^2 \)^(sans(T))$ and let $X \( xi \) in
  bb(F)_r^(3 d)$ be its coordinates in the chosen basis, so that $Z \( X \( xi \) \) = z \( xi \)$.
  The Vandermonde determinant gives

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(N) \( X \( xi_1 \) \, X \( xi_2 \) \, X \( xi_3 \) \) =
   "Nm"_(K \/ bb(F)_r) (product_(1 lt.eq i < j lt.eq 3) \( xi_j - xi_i \)) eq.not 0 $ <norm:distinct-labels>]

whenever the three labels are distinct. Although the basis and the coefficients $f_(i a)$ may depend on $r$,
  the numbers $d \, M \, T \, k$ in (3.1) do not.

=== 3.2 Encoding the polynomial in a base expansion <encoding-the-polynomial-in-a-base-expansion>

Two prime choices will keep the construction parameters polynomial in $r$.
  We use the following sufficiently-large form of Bertrand’s postulate;
  Appendix 9 gives its elementary binomial proof, following Erdős #cite(label("Erdos1932")).

#thm([Lemma 3.2.])[
  #emph[For every sufficiently large integer $n$, there is a prime $p$ with $n < p lt.eq 2 n$.]
] <norm:prime-interval>

Set $L = r^10$. For all sufficiently large $r$, apply Lemma 8 with $n = 100 k^2 L^3$ to choose a prime $B$ satisfying

#[#set math.equation(numbering: n => "(3.5)")
 $ 100 k^2 L^3 < B lt.eq 200 k^2 L^3 \, wide h = B^k \, wide tau = ⌊B^(k - 1) / 2⌋ \, wide R_h =
   bb(Z) \/ h bb(Z) . $ <norm:base>]

For $0 lt.eq a < T$, designate positions in rows $1 \, 2 \, 3$, respectively, by

#[#set math.equation(numbering: n => "(3.6)")
 $ i_a = a \, wide j_a = T a \, wide ell_a = T^2 - \( T + 1 \) a . $ <norm:positions>]

These positions lie in ${ 0 \, dots.h \, k - 1 }$ and are distinct within each row:
  they lie respectively in the intervals $\[ 0 \, T - 1 \]$, $\[ 0 \, T^2 - T \]$, and $\[ 1 \, T^2 \]$.
  The only designated positions whose sum is $k - 1$ are the matched triples:

#[#set math.equation(numbering: n => "(3.7)")
 $ i_a + j_(a') + ell_(a'') = k - 1 quad arrow.l.r.double quad a = a' = a'' . $ <norm:matching>]

To prove the forward implication, rewrite the equation as $a + T a' = \( T + 1 \) a''$.
  Reduction modulo $T$, together with $0 lt.eq a \, a'' < T$, gives $a = a''$; substitution then gives $a' = a''$.
  The reverse implication follows from (3.6).

A random column $c = \( c_1 \, c_2 \, c_3 \)^(sans(T)) in R_h^3$ is now defined as follows.
  First choose $xi$ uniformly from $K$. For each row $1 lt.eq i lt.eq 3$ and each position $0 lt.eq v < k$,
  choose an integer digit $c_(i v) in { 1 \, dots.h \, L }$.
  Its required residue modulo $r$ is $f_(1 a) \( X \( xi \) \)$ when $\( i \, v \) = \( 1 \, i_a \)$,
  $f_(2 a) \( X \( xi \) \)$ when $\( i \, v \) = \( 2 \, j_a \)$,
  and $f_(3 a) \( X \( xi \) \)$ when $\( i \, v \) = \( 3 \, ell_a \)$.
  At every other position its required residue is zero. Conditional on $xi$,
  choose all $3 k$ digits independently and uniformly subject to these requirements, and set

#[#set math.equation(numbering: n => "(3.8)")
 $ c_i = sum_(v = 0)^(k - 1) c_(i v) B^v med \( mod med h \) . $ <norm:column>]

Every required residue has exactly $L \/ r = r^9$ possible digits, including the zero residue.
  In particular a digit prescribed to be zero modulo $r$ is still a positive integer.
  Since $L < B$, the lowest digit is a unit modulo $B$; thus every entry of $c$ is a unit in $R_h$.
  Different columns use independent labels and fresh independent digits, even when their labels coincide.

#thm([Lemma 3.3.])[
  (Determinant obstruction).  #emph[Let $C$ be a matrix of three columns constructed by (3.8),
    with labels $xi_1 \, xi_2 \, xi_3$. If these labels are distinct,
    then the residue $det C in R_h$ has no integer representative in $\[ - tau \, tau \]$.]
] <norm:obstruction>

#proof[
  Write $c_(i v)^(\( j \))$ for the digit at row $i$, position $v$, in column $j$. Form the integer polynomial
  $ F \( Y \) = det (sum_(v = 0)^(k - 1) c_(i v)^(\( j \)) Y^v)_(1 lt.eq i \, j lt.eq 3) =
    sum_(u = 0)^(3 \( k - 1 \)) gamma_u Y^u . $
  For a fixed exponent $u$ and each of the six determinant permutations,
    choosing the first two digit positions determines the third. Therefore
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| gamma_u \| lt.eq A_0 := 6 k^2 L^3 . $ <norm:coefficient-bound>]
  Alternatively expanding by rows, $gamma_(k - 1)$ is the sum of determinants of digit rows at positions whose sum
    is $k - 1$. Modulo $r$, all terms with an undesignated position vanish.
    By (3.7), the surviving terms are exactly those in (3.3), evaluated at the three label vectors. Consequently
  $ gamma_(k - 1) equiv cal(N) \( X \( xi_1 \) \, X \( xi_2 \) \, X \( xi_3 \) \) med \( mod med r \) \, $
  which is nonzero by (3.4). In particular $\| gamma_(k - 1) \| gt.eq 1$ as an integer.
  The integer
  $ S_C = sum_(u = 0)^(k - 1) gamma_u B^u $
  represents $det C$ modulo $h$, because all omitted terms in $F \( B \)$ are divisible by $B^k$.
    Since $B - 1 gt.eq 100 k^2 L^3$, the coefficient bound gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ \| S_C \| & lt.eq frac(A_0, B - 1) \( h - 1 \) lt.eq 3 / 50 \( h - 1 \) < h / 2 \,\
lr(|sum_(u = 0)^(k - 2) gamma_u B^u|) & lt.eq 3 / 50 \( B^(k - 1) - 1 \) . $ <norm:centered>]
  It follows that
  $ \| S_C \| gt.eq B^(k - 1) - 3 / 50 \( B^(k - 1) - 1 \) = frac(47 B^(k - 1) + 3, 50) > tau . $
  By (3.10), every other representative $S_C + m h$, $m in bb(Z) \\ { 0 }$,
    has absolute value greater than $h \/ 2 > tau$. This proves the assertion. ◻
]

In particular, if $G in "SL"_3 \( R_h \)$ and an integer matrix $A$ satisfies $A med mod med h =
  G C$ and $\| det A \| lt.eq tau$, then at least two labels of $C$ coincide:
  multiplication by $G$ preserves its determinant residue. For three independently sampled labels,
  the probability of such a coincidence is at most $3 r^(- d)$ by the union bound.

== 4 Residue orbits and a conditional divisor estimate <orb:section>

We now describe the lattice of possible rows after a change of coordinates modulo a prime power.
  The size of the corresponding special-linear orbit will control the probability of a prescribed lifted matrix.
  Two divisors measure the singularity of the residue matrix;
  the smaller one has bounded expectation even after all three labels have been fixed.

Throughout this section, let $B$ be a prime, let $k gt.eq 1$ be an integer, and put $h = B^k$ and $R_h =
  bb(Z) \/ h bb(Z)$. We interpret $B^k$ as zero when it occurs as an entry of a matrix over $R_h$,
  but as the positive integer $h$ in counting formulas. The row span of a matrix over $R_h$ is the $R_h$-submodule
  generated by its rows.

The diagonal reduction below is the prime-power-ring form of Smith’s normal form;
  see Smith #cite(label("Smith1861")) Articles 12–16 for the classical integer reduction and determinantal
  divisors. We include the elementary proof needed here, including singular cases.

#thm([Lemma 4.1.])[
  (Diagonal form and the row lattice).  #emph[Let $C in M_3 \( R_h \)$ have at least one unit entry.
    There are invertible matrices $P \, Q in "GL"_3 \( R_h \)$ and integers $0 lt.eq b lt.eq e lt.eq k$ such that
$ C = P thin "diag" \( 1 \, B^b \, B^e \) thin Q . $

 Set $D = B^b$, $E = B^e$, and $I = D E$, all as positive integers. The subgroup
$ Lambda_C = { v in bb(Z)^3 : v med mod med h upright(" belongs to the row span of ") C } $

 is a full lattice satisfying
#[#set math.equation(numbering: n => "(4.1)")
 $ \[ bb(Z)^3 : Lambda_C \] = I \, wide E bb(Z)^3 subset.eq Lambda_C . $ <orb:lattice>]

 Moreover, $b gt.eq j$, for $1 lt.eq j lt.eq k$, if and only if every $2 times 2$ minor of $C$ vanishes modulo $B^j$.]
] <orb:diagonal>

#proof[
  Move a unit entry into the first position, scale it to $1$,
    and clear the rest of its row and column by invertible operations.
    In the remaining $2 times 2$ block choose a nonzero entry of least $B$-adic valuation $b$,
    move it to the first position of that block, and multiply by a unit to make it $B^b$.
    Every other entry of the block is divisible by $B^b$ in $R_h$,
    so row and column subtraction clear its row and column. The final entry is still divisible by $B^b$;
    scaling it by a unit makes it $B^e$ with $b lt.eq e lt.eq k$. If the block is zero, take $b = e = k$.
    This proves the stated form, including all zero-pivot cases.
  Invertible row and column operations preserve the ideal generated by the $2 times 2$ minors:
    each new minor is a linear combination of old minors, and the inverse operations give the reverse inclusion.
    For the diagonal matrix this ideal is $B^b R_h$. Its image modulo $B^j$ is zero exactly when $b gt.eq j$,
    proving the last assertion and, in particular, showing that $b$ is independent of the diagonalization.
  Write $cal(M)$ for the row span of $C$. Left multiplication by $P$ does not change the row span,
    while multiplication on the right by $Q$ is an automorphism of $R_h^3$. Hence
  $ \| cal(M) \| = \| R_h times D R_h times E R_h \| = h h / D h / E = h^3 / I . $
  The reduction map identifies $bb(Z)^3 \/ Lambda_C$ with $R_h^3 \/ cal(M)$, which proves the index formula.
    Since $D$ divides $E$, the diagonal row span contains $E R_h^3$.
    Right multiplication by $Q$ preserves $E R_h^3$, so $cal(M)$ also contains $E R_h^3$.
    Taking inverse images proves the containment in (4.1). ◻
]

The preceding description permits singular matrices: either or both of the last two diagonal entries may be zero.
  The orbit estimate must retain these cases, because zero determinants are included in the triangle problem.

#thm([Lemma 4.2.])[
  (A special-linear orbit bound).  #emph[Under the hypotheses and notation of Lemma 10, define
$ cal(O)_C = { G C : G in "SL"_3 \( R_h \) } . $

 There is an absolute constant $c_0 > 0$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ \| cal(O)_C \| gt.eq c_0 frac(h^8, D^3 E^2) . $ <orb:orbit-bound>]

 For a uniformly chosen $G in "SL"_3 \( R_h \)$, the matrix $G C$ is uniform on $cal(O)_C$.
   Every matrix in this orbit has the same row span and determinant as $C$.]
] <orb:orbit>

#proof[
  Let $cal(G) = "GL"_3 \( R_h \)$, and let $cal(H)$ be the stabilizer of $C$ under left multiplication.
    Conjugation by $P$ identifies $cal(H)$ with the stabilizer of $"diag" \( 1 \, D \, E \)$ and preserves
    determinants. An element of this latter stabilizer has first column exactly $\( 1 \, 0 \, 0 \)^(sans(T))$.
    Its second column differs from $\( 0 \, 1 \, 0 \)^(sans(T))$ by three entries annihilated by $D$,
    and its third column differs from $\( 0 \, 0 \, 1 \)^(sans(T))$ by three entries annihilated by $E$.
    The respective annihilators have $D$ and $E$ elements. Discarding the invertibility condition gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| cal(H) \| lt.eq D^3 E^3 . $ <orb:stabilizer>]
  For every unit $u in R_h^times$ with $u equiv 1 med \( mod med h \/ E \)$,
    the matrix $"diag" \( 1 \, 1 \, u \)$ stabilizes $"diag" \( 1 \, D \, E \)$.
    If $e < k$, there are exactly $E$ such units. If $e = k$, this congruence imposes no restriction,
    so there are $phi \( h \) = \( 1 - B^(- 1) \) E$ of them. Consequently, in all cases,
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| det cal(H) \| gt.eq \( 1 - B^(- 1) \) E \, wide frac(\| det cal(H) \|, \| R_h^times \|) gt.eq E /
     h . $ <orb:det-image>]
  Here $det cal(H)$ denotes the image of the determinant homomorphism on $cal(H)$.
  The determinant map from $cal(G)$ onto $R_h^times$ has kernel $"SL"_3 \( R_h \)$.
    Applying the orbit–stabilizer formula in these two groups gives the exact identity
  $ frac(\| cal(O)_C \|, \| cal(G) C \|) = frac(\| det cal(H) \|, \| R_h^times \|) . $
  Reduction modulo $B$ shows that
  $ \| cal(G) \| = h^9 \( 1 - B^(- 1) \) \( 1 - B^(- 2) \) \( 1 - B^(- 3) \) gt.eq 21 / 64 h^9 . $
  Together with (4.3) and (4.4), this proves (4.2), for example with $c_0 = 21 \/ 64$.
    Every fiber of the map $G mapsto G C$ is a coset of its stabilizer, which proves uniformity.
    The assertions about row spans and determinants follow directly from invertibility and $det G = 1$. ◻
]

We next estimate the smaller divisor $D$ for digit columns.
  Only the independence and number of digit choices matter here;
  their prescribed residues may be arbitrary functions of the labels.

#thm([Lemma 4.3.])[
  (Conditional digit estimate).  #emph[Let $r \, L$ be positive integers with $r gt.eq 2$, $r divides L$,
    and $L < B$. Let $cal(L)$ be a label set, and for each $lambda in cal(L)$, $1 lt.eq i lt.eq 3$, and $0 lt.eq
    u < k$, prescribe a residue $a_(i u) \( lambda \) in bb(Z) \/ r bb(Z)$.
    Fix any three labels $lambda_1 \, lambda_2 \, lambda_3$, allowing repetitions.
    Independently for every $i \, j \, u$, choose $d_(i j u)$ uniformly from
$ { a in { 1 \, dots.h \, L } : a equiv a_(i u) \( lambda_j \) med \( mod med r \) } \, $

 and define $C in M_3 \( R_h \)$ by
$ C_(i j) = sum_(u = 0)^(k - 1) d_(i j u) B^u med \( mod med h \) . $

 Let $b$ and $D = B^b$ be as in Lemma 10, and put $theta = B \( r \/ L \)^4$. Then, for every $1 lt.eq j lt.eq k$,
#[#set math.equation(numbering: n => "(4.5)")
 $ Pr \( b gt.eq j divides lambda_1 \, lambda_2 \, lambda_3 \) lt.eq \( r \/ L \)^(4 j) . $ <orb:tail>]

 If $theta < 1$, then
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) \[ D divides lambda_1 \, lambda_2 \, lambda_3 \] lt.eq 1 + sum_(j = 1)^k theta^j lt.eq
   frac(1, 1 - theta) . $ <orb:moment>]

]
] <orb:conditional>

#proof[
  Every prescribed digit set has exactly $L \/ r$ elements.
    Since the lowest digit belongs to ${ 1 \, dots.h \, L }$ and $L < B$, every entry of $C$ is a unit in $R_h$.
  In addition to the three labels, condition on the complete first column of $C$ and the first entries of its
    other two columns. If $b gt.eq j$, Lemma 10 implies, for $i \, v in { 2 \, 3 }$,
  $ C_(i v) equiv C_(i 1) C_11^(- 1) C_(1 v) med \( mod med B^j \) . $
  The right sides are fixed under this conditioning. Each congruence determines the first $j$ base-$B$ digits of
    its entry, since all chosen digits lie between $0$ and $B - 1$.
    It therefore has probability either zero or $\( r \/ L \)^j$.
    The four entries use disjoint independent digit draws, even if their labels agree.
    Their joint probability is at most $\( r \/ L \)^(4 j)$. Averaging over the additional conditioning proves
    (4.5), including $j = k$.
  Finally, the pointwise identity
  $ B^b = 1 + sum_(j = 1)^k \( B^j - B^(j - 1) \) thin upright(bold(1))_({ b gt.eq j }) $
  and (4.5) give (4.6). ◻
]

For the parameters $L = r^10$ and $B lt.eq 200 k^2 L^3$ of the digit construction, we have

$ theta lt.eq 200 k^2 r^(- 6) . $

Thus, for fixed $k$ and all sufficiently large $r$,

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) \[ D divides lambda_1 \, lambda_2 \, lambda_3 \] lt.eq 2 quad
   upright("for every fixed triple of labels.") $ <orb:uniform-moment>]

In particular, suppose the labels are independent and uniform in a set of size $r^d$,
  and let $cal(E)$ be the event that at least two labels coincide. The union bound and conditioning on the labels yield

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) \[ D upright(bold(1))_(cal(E)) \] lt.eq 2 Pr \( cal(E) \) lt.eq 6 r^(- d) . $ <orb:collision-moment>]

This is the estimate needed when the digit obstruction restricts a small determinant to triples with repeated labels.

== 5 An auxiliary cap and its inclusion probabilities <aux:section>

The determinant obstruction at the main modulus leaves triples with repeated labels.
  We now impose an independent restriction at a second prime.
  This restriction excludes short integer relations among three distinct residue columns and gives bounds for the
  probability of each remaining triple, including triples with equal residue columns.

Retain the main modulus $h gt.eq 2$, and choose a prime $q$ with

#[#set math.equation(numbering: n => "(5.1)")
 $ H = h^2 \, wide h^100 < q lt.eq 2 h^100 \, wide w = ⌊frac(q, 1000 H^2)⌋ . $ <aux:parameters>]

Lemma 8 supplies such a prime for all sufficiently large $h$. These choices imply $q gt.eq 2000 H^2$, and hence

$ frac(q, 2000 H^2) lt.eq w lt.eq frac(q, 1000 H^2) . $

We identify the integers $0 \, dots.h \, w - 1$ with their residues in $bb(F)_q$.

The following construction uses an affine part of a classical elliptic quadric,
  a cap with no three collinear points; see Barlotti #cite(label("Barlotti1956")) p. 248.
  The proof also gives the required intersection with a small box.

#thm([Lemma 5.1.])[
  #emph[Let $q$ be an odd prime and $1 lt.eq w lt.eq q$ an integer.
    There is a set $S subset { 0 \, dots.h \, w - 1 }^3 subset bb(F)_q^3$ with $\| S \| gt.eq
    w^3 \/ q$ such that no affine line contains three distinct points of $S$.]
] <aux:cap>

#proof[
  Choose a nonsquare $nu in bb(F)_q$ and put
  $ Q \( x \, y \) = x^2 - nu y^2 \, wide Gamma = { \( x \, y \, Q \( x \, y \) \) : x \, y in bb(F)_q } . $
  The form $Q$ vanishes only at $\( 0 \, 0 \)$. On a line with nonzero direction $\( v_1 \, v_2 \)$ in its first
    two coordinates, the equation defining $Gamma$ is a quadratic equation in the line parameter with nonzero
    leading coefficient $Q \( v_1 \, v_2 \)$. Such a line meets $Gamma$ at most twice.
    A line with direction $\( 0 \, 0 \, v_3 \)$ meets $Gamma$ exactly once.
    Thus $Gamma$, and every translate of it, has the asserted line property.
  For a uniform $b in bb(F)_q^3$, every point belongs to $b + Gamma$ with probability $\| Gamma \| \/ q^3 =
    1 \/ q$. Therefore the average of $\| \( b + Gamma \) ∩ { 0 \, dots.h \, w - 1 }^3 \|$ is $w^3 \/ q$.
    Choose a translate attaining at least this average and take its intersection with the box. ◻
]

Fix one such set $S$ for the parameters in (5.1), and write $s = \| S \|$. In particular,

#[#set math.equation(numbering: n => "(5.2)")
 $ s gt.eq w^3 / q gt.eq frac(q^2, 2000^3 H^6) . $ <aux:cap-size>]

The set $S$ is fixed before any random choices are made.

For $t in bb(F)_q$, write $parallel t parallel_q$ for the least absolute value of an integer representative of
  $t$. Three distinct cap points already exclude nontrivial relations over $bb(F)_q$ whose coefficients sum to
  zero. For a shift $a in bb(F)_q^3$, a relation among three points of $a +
  S$ with integer coefficients $\| x_i \| lt.eq H$ and nonzero sum $m = x_1 + x_2 +
  x_3$ would force $parallel m a_1 parallel_q lt.eq 3 H w$.
  We exclude this possibility by defining the set of allowed shifts

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(A) = { a in bb(F)_q^3 : parallel m a_1 parallel_q > 3 H w upright(" for every ") 1 lt.eq m lt.eq
   3 H } . $ <aux:allowed-shifts>]

Choose $a$ uniformly from $cal(A)$, and independently choose $G_q$ uniformly from $"GL"_3 \( bb(F)_q \)$.
  Our auxiliary set is

#[#set math.equation(numbering: n => "(5.4)")
 $ V = G_q \( a + S \) . $ <aux:set-definition>]

Here and below a triple $u^(\( 1 \)) \, u^(\( 2 \)) \, u^(\( 3 \))$ is #emph[affinely independent] if
  $u^(\( 2 \)) - u^(\( 1 \))$ and $u^(\( 3 \)) - u^(\( 1 \))$ are linearly independent.
  This allows the three columns to have linear rank two.

#thm([Lemma 5.2.])[
  #emph[Let $H gt.eq 1$ be an integer, let $q gt.eq 2000 H^2$ be prime, and put $w =
    floor.l q \/ \( 1000 H^2 \) floor.r$. Suppose $S subset { 0 \, dots.h \, w -
    1 }^3$ contains no three distinct collinear points. The set $cal(A)$ in (5.3) has at least $q^3 \/
    2$ elements. For every $a in cal(A)$ and every invertible $G_q$, the set $V$ in (5.4) has $\| S \|$ elements,
    does not contain zero, and contains no three distinct collinear points.]
  #emph[Moreover, let $x = \( x_1 \, x_2 \, x_3 \) in bb(Z)^3 \\ { 0 }$ satisfy $\| x \| lt.eq H$,
    where $\| x \|$ is the Euclidean norm. For any $u^(\( 1 \)) \, u^(\( 2 \)) \, u^(\( 3 \)) in V$, the relation
#[#set math.equation(numbering: n => "(5.5)")
 $ x_1 u^(\( 1 \)) + x_2 u^(\( 2 \)) + x_3 u^(\( 3 \)) = 0 quad upright("in ") bb(F)_q^3 $ <aux:short-relation>]

 is impossible if $x_1 + x_2 + x_3 eq.not 0$. If $x_1 + x_2 + x_3 = 0$,
   it is impossible whenever the three columns are affinely independent.
   Consequently, (5.5) is impossible for three distinct elements of $V$.]
] <aux:random-set>

#proof[
  For each integer $1 lt.eq m lt.eq 3 H < q$, multiplication by $m$ permutes $bb(F)_q$.
    Since $3 H w < q \/ 2$, a uniform shift violates the condition for this $m$ with probability
    $\( 6 H w + 1 \) \/ q$. The union bound gives
  $ Pr \( a in.not cal(A) \) lt.eq frac(3 H \( 6 H w + 1 \), q) lt.eq 18 / 1000 + frac(3, 2000 H) < 1 / 2 . $
  Thus the required uniform choice of $a$ is defined. Invertible affine maps preserve cardinality and the line
    property. If $a + v = 0$ for some $v in S$, then $parallel a_1 parallel_q lt.eq w - 1 lt.eq 3 H w$,
    contrary to the condition with $m = 1$. Hence $0 in.not V$.
  Write $u^(\( i \)) = G_q \( a + v^(\( i \)) \)$ with $v^(\( i \)) in S$, and let $m = x_1 + x_2 + x_3$.
    If $m eq.not 0$, then $1 lt.eq \| m \| lt.eq 3 H$. Applying $G_q^(- 1)$ to (5.5) and taking first coordinates gives
  $ m a_1 = - sum_(i = 1)^3 x_i v_1^(\( i \)) . $
  The integer on the right, using the representatives $0 lt.eq v_1^(\( i \)) < w$,
    has absolute value at most $3 H \( w - 1 \)$. Since $parallel m a_1 parallel_q =
    parallel \| m \| a_1 parallel_q$, this contradicts (5.3).
  If $m = 0$, the coefficients in (5.5) have sum zero also in $bb(F)_q$.
    They are not all zero there, since $x eq.not 0$ and $\| x_i \| lt.eq H < q$.
    Such a relation contradicts affine independence: substituting $x_3 = - x_1 -
    x_2$ would give a nontrivial linear relation between $u^(\( 1 \)) - u^(\( 3 \))$ and $u^(\( 2 \)) -
    u^(\( 3 \))$. Finally, three distinct elements of $V$ are affinely independent by the line property. ◻
]

The restricted shift excludes short relations. We next show that this restriction costs only a constant in the
  inclusion probability of an affinely independent triple, and obtain the weaker bounds needed when residue
  columns coincide.

For an integer $3 times 3$ matrix $A$, define

#[#set math.equation(numbering: n => "(5.6)")
 $ W \( A \) = (q^3 / s)^3 Pr \( upright("all columns of ") A med mod med q upright(" belong to ") V \) .
   $ <aux:weight>]

The probability is over $a$ and $G_q$; $S$ remains fixed.

#thm([Proposition 5.3.])[
  #emph[For the distribution in (5.4), with $s = \| S \| gt.eq 1$, the following bounds hold with absolute constants:
#[#set math.equation(numbering: n => "(5.7)")
 $ W \( A \) & lt.double 1 &  & upright("if the columns of ") A med mod med q upright(" are affinely independent") \,\
W \( A \) & lt.double q^3 \/ s &  & upright("if ") "rank" \( A med mod med q \) gt.eq 2 \,\
W \( A \) & lt.double \( q^3 \/ s \)^2 &  & upright("for every ") A . $ <aux:weight-bounds>]

 If $W \( A \) > 0$, no column of $A med mod med q$ is zero,
   and its columns are either affinely independent or include two equal columns.
   For an affinely independent triple with $W \( A \) > 0$, there is no nonzero $x in bb(Z)^3$ with $\| x \| lt.eq
   H$ and $A x = 0 med mod med q$.]
] <aux:weights>

#proof[
  First replace the allowed shift by an unconditional uniform $a in bb(F)_q^3$.
    Under this replacement the map $v mapsto G_q v + G_q a$ is uniform in the affine group:
    conditional on $G_q$, its translation $G_q a$ is uniform.
    Conditioning back on $a in cal(A)$ increases the probability of any event by at most two, by Lemma 14.
  The affine group acts transitively on the ordered affinely independent triples in $bb(F)_q^3$, whose number is
  $ q^3 \( q^3 - 1 \) \( q^3 - q \) . $
  There are $s \( s - 1 \) \( s - 2 \)$ such triples in $S$. Therefore, for an affinely independent triple of columns,
  $ W \( A \) lt.eq 2 q^9 / s^3 frac(s \( s - 1 \) \( s - 2 \), q^3 \( q^3 - 1 \) \( q^3 - q \)) lt.double 1 . $
  For the other two bounds, fix any allowed $a$ and put $S_a = a + S$.
    If two specified target columns are linearly independent,
    their inverse images under a uniform $G_q$ are uniform among the $\( q^3 - 1 \) \( q^3 - q \)$ ordered
    independent pairs. At most $s^2$ of these pairs belong to $S_a^2$.
    Requiring all three columns to belong to $G_q S_a$ can only reduce this probability. Consequently,
  $ W \( A \) lt.eq q^9 / s^3 frac(s^2, \( q^3 - 1 \) \( q^3 - q \)) lt.double q^3 / s $
  whenever the target matrix has rank at least two. This estimate holds for each allowed shift,
    so also after averaging over $a$.
  If any target column is zero, its inclusion probability is zero. Otherwise fix one target column.
    Its inverse image under $G_q$ is uniform among the $q^3 - 1$ nonzero vectors,
    and $S_a$ consists of $s$ nonzero vectors. Thus
  $ W \( A \) lt.eq q^9 / s^3 frac(s, q^3 - 1) lt.double (q^3 / s)^2 . $
  This also covers all patterns of equal columns. The remaining assertions follow from the line property and
    short-relation conclusion in Lemma 14. ◻
]

In the sampling construction, choose $\( a \, G_q \)$ independently of all labels, all digit choices,
  and the random change of coordinates at the main modulus.
  Given $V$, choose the auxiliary residues of the sampled columns independently and uniformly from $V$.
  Since $\| V \| = s$ for every outcome, the probability of any prescribed ordered triple of auxiliary residues is

#[#set math.equation(numbering: n => "(5.8)")
 $ frac(Pr \( upright("all three residues belong to ") V \), s^3) = frac(W \( A \), q^9) \,
   $ <aux:normalized-probability>]

where $A$ is any integer lift of that triple. This identity includes repeated residues and is unchanged on
  conditioning on any main-modulus data. It is the normalization used when the two residue conditions are combined
  by the Chinese remainder theorem.

== 6 Sampling integral columns <sam:section>

We now combine the two residue constructions and lift them to integral columns.
  The purpose of this section is to express the probability of a small determinant as a weighted lattice count.
  The main and auxiliary changes of coordinates are shared by all samples; fresh labels, digits,
  auxiliary columns, and lifts are chosen for each sample.

Set

#[#set math.equation(numbering: n => "(6.1)")
 $ N = \( h q \)^10 \, wide cal(B) = #scale(x: 120%, y: 120%)[\(] \[ 0 \, N \)^2 times \[ N \, 2 N \)
   #scale(x: 120%, y: 120%)[\)] ∩ bb(Z)^3 . $ <sam:box>]

For $u in cal(B)$, define its projection by

$ pi \( u \) = \( u_1 \/ u_3 \, u_2 \/ u_3 \) in \[ 0 \, 1 \)^2 . $

Choose $G_h$ uniformly in $"SL"_3 \( bb(Z) \/ h bb(Z) \)$, independently of the auxiliary set $V$.
  Conditional on $\( G_h \, V \)$, sample columns $u in cal(B)$ independently as follows:

+ Draw a label uniformly from $K$ and its digit column $c$ by the main-modulus construction,
  using fresh independent digit choices. Prescribe $u med mod med h = G_h c$.
+ Independently choose $u med mod med q$ uniformly from $V$.
+ Among columns with those residues, choose $u$ uniformly in $cal(B)$.

Since $h$ and $q$ are coprime and $h q$ divides $N$, each pair of prescribed residues has exactly
  $\( N \/ \( h q \) \)^3$ lifts. This also shows that the sampling rule is defined for every outcome of the
  residue choices. The samples need not be independent after averaging over $\( G_h \, V \)$;
  all estimates below retain the shared choices.

#thm([Lemma 6.1.])[
  (Proportional pairs).  #emph[For two sampled columns $u \, v$, one has
#[#set math.equation(numbering: n => "(6.2)")
 $ Pr #scale(x: 120%, y: 120%)[\(] pi \( u \) = pi \( v \) #scale(x: 120%, y: 120%)[\)] lt.double \( h q \)^6
   N^(- 3) . $ <sam:pair-bound>]

]
] <sam:proportional>

#proof[
  Equality of the projections is equivalent to proportionality of $u$ and $v$,
    because their third coordinates are positive. Every column in $cal(B)$ is a positive integer multiple of a
    unique primitive integral vector $z$ with $z_3 > 0$. The number of its multiples in $cal(B)$ is at most
    $sqrt(6) N \/ \| z \|$. Therefore the total number of ordered proportional pairs in $cal(B)^2$,
    including equal columns, is at most
  $ 6 N^2 sum_(0 < \| z \| lt.eq sqrt(6) N) \| z \|^(- 2) lt.double N^3 . $
  For the last estimate, dyadic shells of radius $R$ contain $O \( R^3 \)$ integral vectors and contribute
    $O \( R \)$ to the sum.
  Condition on both columns’ residues at both moduli and on the shared random choices.
    Their lifts are independent, each uniform on exactly $\( N \/ \( h q \) \)^3$ columns.
    The preceding count bounds the number of proportional pairs within any two such sets of lifts.
    Dividing by $\( N \/ \( h q \) \)^6$ and averaging proves the claim. ◻
]

For three samples, write $A = \( u^(\( 1 \)) \, u^(\( 2 \)) \, u^(\( 3 \)) \)$ for the integral matrix of columns,
  and $C = \( c^(\( 1 \)) \, c^(\( 2 \)) \, c^(\( 3 \)) \)$ for their digit matrix before multiplication by $G_h$.
  With $C$ fixed, use Lemma 10 to define $D \, E \, I = D E$ and the row lattice $Lambda = Lambda_C$,
  and write $cal(O) = cal(O)_C$ for the orbit in Lemma 11. Thus $Lambda$ is the inverse image in $bb(Z)^3$ of the
  row span of $C$ modulo $h$, and $cal(O) = { G C : G in "SL"_3 \( bb(Z) \/ h bb(Z) \) }$.
  Recall also the auxiliary weight from (5.6):

$ W \( A \) = (q^3 / s)^3 Pr #scale(x: 120%, y: 120%)[\(] u^(\( 1 \)) \, u^(\( 2 \)) \, u^(\( 3 \)) med mod med
  q in V #scale(x: 120%, y: 120%)[\)] . $

Here the probability defining $W$ averages only over the auxiliary choices.

#thm([Lemma 6.2.])[
  (Exact lifting identity).  #emph[Condition on all three labels and digit columns, hence on $C$.
    For any set $cal(E) subset.eq cal(B)^3$ of integral matrices,
#[#set math.equation(numbering: n => "(6.3)")
 $ Pr \( A in cal(E) divides C \, upright("labels") \) = frac(h^9, N^9 \| cal(O) \|) sum_(A in cal(E)\
A med mod med h in cal(O)) W \( A \) . $ <sam:crt-identity>]

]
] <sam:lifting>

#proof[
  The matrix $G_h C$ is uniform on $cal(O)$, since every point of an orbit has the same number of group elements
    mapping $C$ to it. Given $V$, the three auxiliary residues are independent and uniform on its $s$ elements.
    Consequently, for each specified ordered triple of auxiliary residues,
    its probability is its inclusion probability in $V$, divided by $s^3$.
    This remains true when some residues coincide. Independence of the main and auxiliary choices and the exact
    number of lifts give, for each fixed integral $A$ with $A med mod med h in cal(O)$, the conditional probability
  $ frac(1, \| cal(O) \|) thin frac(Pr \( A med mod med q upright(" has all columns in ") V \), s^3)
    (frac(h q, N))^9 = frac(h^9, N^9 \| cal(O) \|) W \( A \) . $
  For other matrices the probability is zero. Summation proves the identity. ◻
]

We call a sampled triple #emph[bad] if its projected points are pairwise distinct and $\| det A \| lt.eq tau$.
  Every matrix in $cal(O)$ has determinant $det C$ modulo $h$.
  Since $2 tau < h$, at most one integer $t in \[ - tau \, tau \]$ can occur as the determinant of a bad triple
  with $A med mod med h in cal(O)$. If the labels are all distinct, Lemma 9 rules out every such $t$.

The following estimate handles the one remaining determinant value.
  Its nonzero case follows immediately from the lattice count;
  the zero case requires the auxiliary construction and is proved in the next section.

#thm([Proposition 6.3.])[
  (Weighted count at a fixed determinant).  #emph[Fix a digit matrix $C$, with row lattice $Lambda$ of index $I =
    D E$ and special-linear orbit $cal(O)$ modulo $h$. For each integer $t$ with $\| t \| lt.eq tau$,
    let $cal(A)_t$ consist of the matrices $A$ whose columns lie in $cal(B)$,
    whose projected columns are pairwise distinct, and which satisfy $A med mod med h in cal(O)$ and $det A = t$. Then
#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(A in cal(A)_t) W \( A \) lt.double \( log \( 2 N \) \)^2 N^6 / I^2 . $ <sam:weighted-estimate>]

]
] <sam:weighted-count>

#proof[
  Suppose first that $t eq.not 0$. Since $0 < \| t \| lt.eq tau < q$,
    the reduction of $A$ modulo $q$ has rank three. Its columns are therefore affinely independent,
    and Proposition 15 gives $W \( A \) lt.double 1$. Every row of $A$ belongs to $Lambda$ and has norm less than
    $4 N$. Moreover $E bb(Z)^3 subset.eq Lambda$ gives $lambda_3 \( Lambda \) lt.eq E lt.eq h < 4 N$.
    Proposition 6, applied with $X = 4 N$, proves the estimate.
  For $t = 0$, Proposition 20 below proves the stronger bound $O \( log \( 2 N \) N^6 \/ I^2 \)$ for all matrices
    with rows in $Lambda$ and pairwise distinct projected columns.
    The orbit restriction only reduces this set, so it gives the claimed estimate as well. ◻
]

#thm([Corollary 6.4.])[
  (Probability of a bad triple).  #emph[Three sampled columns satisfy
#[#set math.equation(numbering: n => "(6.5)")
 $ Pr #scale(x: 120%, y: 120%)[\(] pi \( u^(\( 1 \)) \) \, pi \( u^(\( 2 \)) \) \,
   pi \( u^(\( 3 \)) \) upright(" are pairwise distinct") \, med \| det A \| lt.eq
   tau #scale(x: 120%, y: 120%)[\)] lt.double \( log \( 2 N \) \)^2 frac(h, N^3 r^d) . $ <sam:triple-bound>]

]
] <sam:bad-triple>

#proof[
  Conditional on the labels and digit matrix $C$, the probability is zero when all labels are distinct.
    Otherwise Lemma 17 and Proposition 18, together with the bound $\| cal(O) \| gt.double
    h^8 \/ \( D^3 E^2 \)$ from (4.2), bound it by
  $ h^9 / N^9 frac(D^3 E^2, h^8) \( log \( 2 N \) \)^2 frac(N^6, D^2 E^2) lt.double \( log \( 2 N \) \)^2
    frac(h D, N^3) . $
  Let $F$ be the event that two of the three labels agree. The uniform conditional moment estimate (4.7) gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] D upright(bold(1))_F #scale(x: 120%, y: 120%)[\]] =
    bb(E)_(upright("labels")) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_F
    bb(E) \( D divides upright("labels") \) #scale(x: 120%, y: 120%)[\]] lt.double Pr \( F \) lt.eq 3 r^(- d) . $
  This step uses the moment estimate for every fixed label triple, including repeated labels;
    the corresponding digit draws remain independent. Averaging the conditional bound proves the corollary. ◻
]

== 7 Counting determinant-zero triples <zero:section>

The remaining part of the weighted count concerns collinear projected points.
  We organize these triples by their integral linear relation.
  The auxiliary modulus excludes short relations when the three residues are affinely independent.
  When two residues coincide, the equality usually imposes an additional lattice condition;
  the relations for which it does not are sufficiently sparse.

Keep the digit matrix $C$ fixed, and write $Lambda = Lambda_C$ for its row lattice from Lemma 10. Write

$ h = B^k \, wide D = B^b \, wide E = B^e \, wide I = D E \, wide 0 lt.eq b lt.eq e lt.eq k . $

Thus $C$ has diagonal form $\( 1 \, D \, E \)$ over $bb(Z) \/ h bb(Z)$, $\[ bb(Z)^3 : Lambda \] = I$,
  and $E bb(Z)^3 subset.eq Lambda$. Recall also $H = h^2$, $q > h^100$,
  the box $cal(B) = \[ 0 \, N \)^2 times \[ N \, 2 N \) ∩ bb(Z)^3$, and the weight $W \( A \)$ from (5.6).
  For a column $u in cal(B)$, its projection means $\( u_1 \/ u_3 \, u_2 \/ u_3 \)$.

#thm([Proposition 7.1.])[
  #emph[For the lattice $Lambda$ and weight $W$ above, let $cal(Z)$ be the set of integer $3 times
    3$ matrices whose columns belong to $cal(B)$, whose rows belong to $Lambda$, whose determinant is zero,
    and whose three projected columns are pairwise distinct. Then
#[#set math.equation(numbering: n => "(7.1)")
 $ sum_(A in cal(Z)) W \( A \) lt.double log \( 2 N \) N^6 / I^2 . $ <zero:target>]

 The implied constant is independent of the fixed digit matrix $C$.]
] <zero:weighted-zero>

The orbit restriction in Proposition 18 only reduces this sum.
  We first record the lattice estimates needed for the null vectors.

#thm([Lemma 7.2.])[
  #emph[For a primitive vector $x in bb(Z)^3$, put
$ Lambda_x = Lambda ∩ x^perp \, wide x dot.op Lambda = g \( x \) bb(Z) \, wide J_x = det \( Lambda_x \) \, $

 where $g \( x \) > 0$. Then
#[#set math.equation(numbering: n => "(7.2)")
 $ g \( x \) divides E \, wide J_x = frac(I \| x \|, g \( x \)) \, wide frac(g \( x \)^3, I) lt.eq
   h^2 . $ <zero:plane-data>]

 The reduction of $Lambda_x$ modulo $q$ is the entire plane
$ Pi_x = { v in bb(F)_q^3 : v dot.op macron(x) = 0 } \, wide macron(x) = x med mod med q eq.not 0 . $

 If $Gamma subset.eq Lambda_x$ is a sublattice of index $m$, the number of ordered triples of vectors in $Gamma$,
   all of length at most $4 N$ and spanning a plane over $bb(Q)$, is at most
#[#set math.equation(numbering: n => "(7.3)")
 $ lt.double frac(N^6, \( m J_x \)^3) . $ <zero:row-count>]

]
] <zero:plane>

#proof[
  Primitivity gives $x dot.op bb(Z)^3 = bb(Z)$. Since $E bb(Z)^3 subset.eq Lambda$,
    we have $E bb(Z) subset.eq g \( x \) bb(Z)$, so $g \( x \) divides E$.
    Lemma 4 gives the formula for $J_x$, and $g \( x \)^3 \/ I lt.eq E^2 \/ D lt.eq h^2$.
  Primitivity also implies $macron(x) eq.not 0$, with no restriction on the size of $x$.
    To prove surjectivity, choose $z in bb(Z)^3$ with $x dot.op z = 1$.
    If an integral lift $v$ of a point of $Pi_x$ has $x dot.op v = q a$, then $v -
    q a z in bb(Z)^3 ∩ x^perp$ is another lift of the same point. Thus $bb(Z)^3 ∩ x^perp$ reduces onto $Pi_x$.
    Its multiple by $E$ lies in $Lambda_x$ and still reduces onto $Pi_x$, because $q divides.not E$.
  Finally, a triple counted in (7.3) contains two independent vectors of length at most $4 N$.
    Therefore the second successive minimum of $Gamma$ is at most $4 N$ whenever the count is nonzero.
    Lemma 3 then bounds the choices for each vector by $O \( N^2 \/ det Gamma \)$, and $det Gamma = m J_x$. ◻
]

#thm([Lemma 7.3.])[
  #emph[For $R gt.eq h$,
#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(x in bb(Z)^3 med upright("primitive")\
R lt.eq \| x \| < 2 R) g \( x \)^3 lt.double R^3 I . $ <zero:moment-bound>]

 In particular, this estimate holds when $R > H \/ 2$.]
] <zero:moment>

#proof[
  Since $g \( x \) divides B^e$, write $g \( x \) = B^(a \( x \))$ with $0 lt.eq a \( x \) lt.eq e$.
    For $0 lt.eq j lt.eq e$, the condition $B^j divides g \( x \)$ is equivalent to $C x =
    0 med \( mod med B^j \)$. Indeed, if $tilde(C)$ is any integral lift of $C$,
    then $Lambda$ is the sum of the integral row span of $tilde(C)$ and $h bb(Z)^3$, and $B^j divides h$.
    The diagonal form of $C$ shows that the fraction of residue classes modulo $B^j$ satisfying this congruence is
  $ B^(- j - max \( j - b \, 0 \)) . $
  Indeed, the first diagonal coordinate must vanish, the second must be divisible by $B^(max \( j - b \, 0 \))$,
    and the third is unrestricted since $j lt.eq e$.
  Because $R gt.eq h gt.eq B^j$, each residue class contains $O \( \( R \/ B^j \)^3 \)$ integral vectors of length
    less than $2 R$. We may discard primitivity for this upper bound. Consequently,
  $ sum_(x med upright("primitive")\
R lt.eq \| x \| < 2 R) g \( x \)^3 & lt.eq sum_(j = 0)^e B^(3 j) \# { x in bb(Z)^3 : \| x \| < 2 R \, med C x =
  0 med \( mod med B^j \) }\
 & lt.double R^3 sum_(j = 0)^e B^(2 j - max \( j - b \, 0 \)) lt.double R^3 B^(b + e) = R^3 I . $
  The exponents in the last sum strictly increase to $b + e$, so its bound is uniform in $B$.
    Finally, $h gt.eq 2$ implies $H \/ 2 = h^2 \/ 2 gt.eq h$. ◻
]

#proof[
  Every $A in cal(Z)$ has rational rank two. Indeed, its columns are nonzero,
    and no two are proportional because their projections are distinct.
    Its right nullspace therefore has a primitive integral generator $x$, unique up to sign.
    Every coordinate of $x$ is nonzero: otherwise the relation would make two columns proportional.
    Taking the cross product of two independent rows and dividing by the gcd of its coordinates gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ A x = 0 \, wide x_1 x_2 x_3 eq.not 0 \, wide \| x \| lt.double N^2 . $ <zero:null-range>]
  Every row of $A$ lies in $Lambda_x$ and has length at most $4 N$.
    Thus $x$ records a relation among the columns, while the rows are lattice vectors perpendicular to $x$.
    We may sum over both choices of sign of $x$ for an upper bound.
  Partition the possible vectors into dyadic shells $R lt.eq \| x \| < 2 R$, $R = 1 \, 2 \, 4 \, dots.h$.
    By (7.5), there are $O \( log \( 2 N \) \)$ shells. We will bound the weighted contribution of each shell by
    $O \( N^6 \/ I^2 \)$. For a fixed primitive $x$ in such a shell,
    a condition confining every row to an index-$m$ sublattice of $Lambda_x$ gives at most
  #[#set math.equation(numbering: n => "(7.6)")
   $ lt.double frac(N^6 g \( x \)^3, m^3 I^3 R^3) $ <zero:fixed-null-count>]
  matrices of rational rank two, by (7.3) and $J_x = I \| x \| \/ g \( x \)$.
    In the affine case we will sum $g \( x \)^3$ using Lemma 22.
    In the equal-pair cases we instead use $g \( x \)^3 lt.eq I h^2$,
    together with an extra row congruence or a smaller number of possible null vectors.
    The support statement and the three weight bounds in Proposition 15 give the following exhaustive cases.
  ===== 7.1 Affinely independent residues. <affinely-independent-residues.>
  If $W \( A \) > 0$ and the columns of $A med mod med q$ are affinely independent,
    Lemma 14 excludes the relation $A x = 0$ when $\| x \| lt.eq H$.
    To see both parts of this exclusion, if $x_1 + x_2 + x_3 eq.not 0$ use the restricted shift;
    if the sum is zero, use affine independence and $macron(x) eq.not 0$.
    Hence a contributing shell satisfies $R > H \/ 2$. Using $W \( A \) lt.double 1$, (7.6) with $m = 1$,
    and Lemma 22, its contribution is at most
  #[#set math.equation(numbering: n => "(7.7)")
   $ lt.double frac(N^6, I^3 R^3) sum_(x med upright("primitive")\
R lt.eq \| x \| < 2 R) g \( x \)^3 lt.double N^6 / I^2 . $ <zero:affine-count>]
  ===== 7.2 An equal pair with an additional equation. <an-equal-pair-with-an-additional-equation.>
  Every other matrix of positive weight has two equal columns modulo $q$.
    Fix one pair $i < j$ with this property, and put $delta = upright(bold(e))_i - upright(bold(e))_j$,
    where the $upright(bold(e))_i$ are the standard basis vectors.
    Summing over the three pairs only changes the implied constant.
    First suppose that $macron(x) in.not bb(F)_q delta$. The functional $v mapsto v dot.op
    delta$ is nonzero on $Pi_x$: the annihilator of $Pi_x$ is precisely $bb(F)_q macron(x)$.
    By Lemma 21, the rows of $A$ therefore belong to the index-$q$ sublattice
  $ { v in Lambda_x : v_i = v_j med \( mod med q \) } . $
  There are $O \( R^3 \)$ integral $x$ in any shell. Using (7.6) with $m = q$,
    the pointwise bound $g \( x \)^3 lt.eq I h^2$, and $W \( A \) lt.double \( q^3 \/ s \)^2$,
    the contribution is at most
  #[#set math.equation(numbering: n => "(7.8)")
   $ lt.double N^6 / I^2 thin h^2 q^(- 3) \( q^3 \/ s \)^2 lt.double N^6 / I^2 thin h^26 / q lt.double N^6 /
     I^2 . $ <zero:equal-additional>]
  Here and below we use $q^3 \/ s lt.double q H^6 = q h^12$ and $q > h^100$.
    This argument includes matrices of every rank modulo $q$.
  ===== 7.3 An equal pair without an additional equation. <an-equal-pair-without-an-additional-equation.>
  It remains to consider $macron(x) in bb(F)_q delta$. The coordinate of $x$ outside the pair $i \,
    j$ is divisible by $q$ and, by (7.5), is a nonzero integer.
    Thus $\| x \| gt.eq q$, and a contributing shell has $R > q \/ 2$.
    The nonzero multiples of $delta$ give $q - 1$ residue classes for $x$ modulo $q$.
    Each class contains $O \( \( 1 + R \/ q \)^3 \)$ vectors of length less than $2 R$,
    so the number of possible $x$ in this shell is
  #[#set math.equation(numbering: n => "(7.9)")
   $ lt.double R^3 \/ q^2 . $ <zero:special-normals>]
  #strong[Rank at least two modulo $q$.] The weight bound $W \( A \) lt.double q^3 \/ s$ now gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ lt.double N^6 / I^2 thin h^2 q^(- 2) \( q^3 \/ s \) lt.double N^6 / I^2 thin h^14 / q lt.double N^6 /
     I^2 $ <zero:special-rank-two>]
  for the contribution of the shell.
  #strong[Rank at most one modulo $q$.] All rows reduce into one of the $q +
    1$ one-dimensional linear subspaces of $Pi_x$. This also covers the zero row space.
    For each such line $ell subset.eq Pi_x$, surjectivity in Lemma 21 shows that
  $ { v in Lambda_x : v med mod med q in ell } $
  has index $q$ in $Lambda_x$. Formula (7.3) thus bounds the rank-two rational row triples,
    summed over all these lines, by
  $ lt.double \( q + 1 \) frac(N^6, \( q J_x \)^3) lt.double frac(N^6, q^2 J_x^3) . $
  Using (7.9) and the general weight bound, the weighted contribution is at most
  #[#set math.equation(numbering: n => "(7.11)")
   $ lt.double N^6 / I^2 thin h^2 q^(- 4) \( q^3 \/ s \)^2 lt.double N^6 / I^2 thin h^26 / q^2 lt.double N^6 /
     I^2 . $ <zero:special-rank-one>]
  The affine and equal-pair cases cover the support of $W$.
    Their bounds are uniform over the dyadic shells, so summing over the $O \( log \( 2 N \) \)$ shells proves (7.1). ◻
]

== 8 Deletion and projective normalization <alt:section>

The preceding estimates allow us to remove every repeated projected point and every small triangle while retaining
  many columns. We first construct a set for each sufficiently large prime $r$,
  compare its area bound with its cardinality, and then pass to every sufficiently large cardinality.
  All constants below may depend on the fixed integer $k$; none depends on the growing prime $r$.

This final step is an elementary alteration argument. The earlier probabilistic lower bound of Komlós,
  Pintz and Szemerédi #cite(label("KPS1982")) uses a stronger hypergraph independence lemma;
  no such lemma is needed below.

#proof[
  Keep the parameters constructed above, with $d = 41$, and set
  #[#set math.equation(numbering: n => "(8.1)")
   $ a_r = r sqrt(N^3 \/ tau) \, wide n_r = floor.l a_r floor.r . $ <alt:sample-size>]
  Here $k gt.eq 2$ and $B$ is an odd prime, so $tau gt.eq 1$.
    Take $2 n_r$ samples with the shared random choices and independent conditional draws specified in Section 6.
    Let $Z$ count the unordered pairs of sample indices with equal projected points,
    plus the unordered triples whose projected points are pairwise distinct and whose determinant has absolute
    value at most $tau$. Linearity of expectation, Lemma 16, and Corollary 19 give
  #[#set math.equation(numbering: n => "(8.2)")
   $ frac(bb(E) Z, n_r) lt.double n_r \( h q \)^6 N^(- 3) + n_r^2 \( log \( 2 N \) \)^2 frac(h, N^3 r^d) .
     $ <alt:expected-events>]
  No independence between the counted events is needed.
  Both terms tend to zero. Indeed, $N = \( h q \)^10$ and $tau gt.eq 1$ give
  $ n_r \( h q \)^6 N^(- 3) lt.eq r tau^(- 1 \/ 2) \( h q \)^(- 9) = o \( 1 \) . $
  For the other term, the definition of $n_r$ gives
  $ n_r^2 \( log \( 2 N \) \)^2 frac(h, N^3 r^d) lt.eq \( log \( 2 N \) \)^2 h / tau r^(2 - d) . $
  Since $B^(k - 1) gt.eq 3$, the definition of $tau$ implies $tau gt.eq B^(k - 1) \/ 3$, and hence $h \/ tau lt.eq
    3 B = O_k \( r^30 \)$. The bounds $B = O_k \( r^30 \)$, $q lt.eq 2 h^100$,
    and $N = \( h q \)^10$ also give $log \( 2 N \) = O_k \( log r \)$.
    Thus the second term in (8.2) is $O_k \( \( log r \)^2 r^(- 9) \) = o \( 1 \)$. Thus $bb(E) Z = o \( n_r \)$.
  For sufficiently large $r$, choose an outcome with $Z < n_r$.
    For each violating pair or triple in that outcome, mark one of its indices for deletion.
    This marks at most $Z$ indices and meets every original violation.
    After deleting all marked indices, at least $n_r$ remain; retain any $n_r$ of them.
    Their projections form a set $P_r$ of $n_r$ distinct points in $\[ 0 \, 1 \)^2$,
    and every triple of retained columns satisfies $\| det A \| > tau$.
    In particular, the construction excludes every zero-area triple as well.
  For a retained triple, divide the $j$th column of $A$ by its positive third coordinate $A_(3 j)$.
    The resulting columns have the form $\( p_(j 1) \, p_(j 2) \, 1 \)^(sans(T))$,
    so the determinant formula for triangle area gives the exact identity
  #[#set math.equation(numbering: n => "(8.3)")
   $ "Area" \( p_1 p_2 p_3 \) = frac(\| det A \|, 2 A_31 A_32 A_33) . $ <alt:area-identity>]
  Since $N lt.eq A_(3 j) < 2 N$ for each $j$, every retained triangle has area at least $tau \/ \( 16 N^3 \)$.
    Consequently
  #[#set math.equation(numbering: n => "(8.4)")
   $ Delta \( P_r \) gt.eq frac(tau, 16 N^3) . $ <alt:area-bound>]
  Also $tau < h$ and $N gt.eq h^10$ give $a_r > r h^(29 \/ 2) arrow.r oo$.
    Hence $n_r arrow.r oo$ and eventually $n_r gt.eq a_r \/ 2$. Combining this with (8.4) yields
  #[#set math.equation(numbering: n => "(8.5)")
   $ n_r^2 Delta \( P_r \) gt.eq r^2 / 64 . $ <alt:scaled-area>]
  We now express both the cardinality and the area bound in terms of $r$. The parameter choices give
  $ 100 k^2 r^30 < B lt.eq 200 k^2 r^30 \, wide h = B^k \,\
h^100 < q lt.eq 2 h^100 \, wide N^(3 \/ 2) = \( h q \)^15 \,\
B^(k - 1) \/ 3 lt.eq tau lt.eq B^(k - 1) \/ 2 . $
  Consequently, if
  $ beta = 1515 k - frac(k - 1, 2) = frac(3029 k + 1, 2) \, $
  then
  $ sqrt(2) thin r B^beta < a_r lt.eq 2^15 sqrt(3) thin r B^beta . $
  Since $a_r \/ 2 lt.eq n_r lt.eq a_r$ for sufficiently large $r$, there are fixed constants $A_k \, D_k > 0$ such that
  #[#set math.equation(numbering: n => "(8.6)")
   $ A_k r^alpha lt.eq n_r lt.eq D_k r^alpha \, wide alpha = 1 + 30 beta = 45435 k + 16 \, $ <alt:cardinality-growth>]
  for every sufficiently large prime $r$. In particular, put
  #[#set math.equation(numbering: n => "(8.7)")
   $ eta = 2 / alpha = frac(2, 45435 k + 16) . $ <alt:exponent>]
  The upper bound in (8.6) gives $r^2 gt.eq D_k^(- eta) n_r^eta$. Combining this with (8.5), we obtain
  #[#set math.equation(numbering: n => "(8.8)")
   $ Delta \( P_r \) gt.eq c_(*) n_r^(- 2 + eta) \, wide c_(*) = frac(1, 64 D_k^eta) > 0 . $ <alt:prime-area>]
  Thus the same cardinality estimate that will permit interpolation also converts the factor $r^2$ into a fixed
    power of the number of points.
  For a sufficiently large integer $n$, put $m = ceil.l \( n \/ A_k \)^(1 \/ alpha) ceil.r$.
    Lemma 8 supplies a prime $r$ with $m < r lt.eq 2 m$. Once $\( n \/ A_k \)^(1 \/ alpha) gt.eq 1$,
    we have $m lt.eq 2 \( n \/ A_k \)^(1 \/ alpha)$, so (8.6) gives
  $ n lt.eq n_r lt.eq C_k n \, wide C_k = max {1 \, frac(4^alpha D_k, A_k)} . $
  This uses only the two-sided cardinality bounds, not monotonicity of $n_r$. Retain any $n$ points of $P_r$.
    Deleting points cannot decrease the minimum triangle area. Since $0 < eta < 2$, (8.8) therefore yields
  $ Delta \( n \) gt.eq c_(*) n_r^(- 2 + eta) gt.eq c_(*) C_k^(- 2 + eta) n^(- 2 + eta) . $
  Taking $c_1 = c_(*) C_k^(- 2 + eta)$ proves Theorem 1. All constants are absolute because $k$ is fixed
    independently of $r$ and $n$. The formula (8.7) is explicit;
    no attempt has been made to optimize the construction parameters. ◻
]

== 9 An elementary prime-interval estimate <app:prime-interval>

We prove Lemma 8, the form of Bertrand’s postulate used to choose the two moduli and to pass to every sufficiently
  large cardinality. The argument is the elementary binomial proof of Erdős #cite(label("Erdos1932")).

#proof[
  Write $P \( x \) = product_(p lt.eq x) p$, where the product is over primes.
    First, $P \( x \) < 4^x$ for $x gt.eq 1$. It suffices to prove this for integer $x$ by induction.
    The cases $x = 1 \, 2$ are immediate. An even integer $x > 2$ is composite, so $P \( x \) = P \( x - 1 \)$.
    For $x = 2 m + 1$, every prime in $\( m + 1 \, 2 m + 1 \]$ divides $binom(2 m + 1, m)$.
    The two central binomial coefficients are equal and their sum is strictly less than $2^(2 m + 1)$,
    whence $binom(2 m + 1, m) < 4^m$. Thus
  $ P \( 2 m + 1 \) lt.eq P \( m + 1 \) binom(2 m + 1, m) < 4^(2 m + 1) . $
  Suppose now that there is no prime in $\( n \, 2 n \]$. The largest binomial coefficient in $\( 1 + 1 \)^(2 n)$
    gives $binom(2 n, n) gt.eq 4^n \/ \( 2 n + 1 \)$. For any prime $p$, its exponent in this coefficient is
  $ sum_(j gt.eq 1) (⌊frac(2 n, p^j)⌋ - 2 ⌊n / p^j⌋) . $
  Each summand is zero or one, so the entire prime power contributed by $p$ is at most $2 n$.
    The primes at most $sqrt(2 n)$ therefore contribute at most $\( 2 n \)^(sqrt(2 n))$.
    Larger primes have exponent at most one. Those in $\( 2 n \/ 3 \, n \]$ have exponent zero,
    and by assumption there are none in $\( n \, 2 n \]$. For sufficiently large $n$ it follows that
  $ frac(4^n, 2 n + 1) lt.eq binom(2 n, n) lt.eq \( 2 n \)^(sqrt(2 n)) P \( 2 n \/ 3 \) < \( 2 n \)^(sqrt(2 n))
    4^(2 n \/ 3) . $
  Taking logarithms contradicts $\( n \/ 3 \) log 4 > sqrt(2 n) log \( 2 n \) +
    log \( 2 n + 1 \)$ for sufficiently large $n$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
