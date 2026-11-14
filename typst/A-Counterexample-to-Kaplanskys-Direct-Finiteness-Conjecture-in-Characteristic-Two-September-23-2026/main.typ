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

#align(center)[#text(size: 16pt, weight: "bold")[A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Characteristic Two]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

If a linear map on a finite-dimensional vector space has a left inverse, that inverse is also a right inverse.
  A group algebra need not have finite dimension, but each of its elements still has finite support.
  Kaplansky’s direct-finiteness conjecture asks whether this finite support is enough:
  for every field $K$, group $G$, and $a \, b in K \[ G \]$, must $a b = 1$ imply $b a = 1$?
  Here $K \[ G \]$ consists of finite formal sums $sum_g c_g g$, multiplied using the group law.

A unital ring with this property is #emph[directly finite];
  it is #emph[stably finite] if all its finite square matrix rings are directly finite.
  This distinction matters to a counterexample. Producing matrices $A B =
  I eq.not B A$ over a group algebra does not by itself produce scalar elements with the same property.
  Our construction first produces the matrix pair, then embeds its matrix algebra in a larger group algebra to
  obtain the following scalar conclusion.

#thm([Theorem 1.1.])[
  #emph[There exist a finite field $K$ of characteristic two,
    a finitely presented group $G$ containing an element of odd prime order, and elements $a_(upright("out")) \,
    b_(upright("out")) in K \[ G \]$ such that
$ a_(upright("out")) b_(upright("out")) = 1 \, wide b_(upright("out")) a_(upright("out")) eq.not 1 . $

 The field, group, and finite sums are specified by a terminating prescription involving finite sets and
   finite-field arithmetic.]
] <thm:main>

Thus Theorem 1 resolves the unrestricted conjecture negatively in characteristic two.
  The construction uses odd-order torsion and does not assert that $K = bb(F)_2$.
  The prescription need not be computationally practical and has not been executed:
  its termination is proved, and the two product assertions have algebraic certificates independent of any
  decision procedure for the group word problem.

===== 1.1 History and positive results. <history-and-positive-results.>

For a finite group $G$, the algebra $K \[ G \]$ and all its finite square matrix rings are finite dimensional,
  so elementary linear algebra gives stable finiteness. The classical characteristic-zero theorem uses a different
  substitute for dimension. Kaplansky’s operator-algebra argument places $bb(C) \[ G \]$ in a finite tracial
  setting; Montgomery gave a proof using the operator-norm closure of the regular representation and its
  identity-coefficient trace, including the extension to every finite matrix size #cite(label("Montgomery1969")).
  The trace rules out a proper one-sided inverse. For an arbitrary characteristic-zero field,
  all coefficients of a proposed finite matrix pair lie in a finitely generated subfield, which embeds in $bb(C)$.
  Thus the complex result gives stable finiteness over every characteristic-zero field.

In positive characteristic, rank and approximation methods have supplied broad classes of positive results without
  a complex representation. Ara, O’Meara, and Perera proved stable finiteness over arbitrary division rings for
  free-by-amenable groups, using Sylvester rank functions and amenable translation
  rings #cite(label("AraOMearaPerera2002")). Elek and Szabó obtained stable finiteness over arbitrary division
  rings for all sofic groups from finite approximate models and a rank construction #cite(label("ElekSzabo2004"))
  Corollary 4.7. These are restrictions on a possible counterexample’s group,
  not assumptions that the group constructed here satisfies.

Dykema and Juschenko clarified how a matrix obstruction can nevertheless yield a scalar one:
  for a fixed field and group, stable finiteness is equivalent to direct finiteness after taking the direct
  product with every finite group #cite(label("DykemaJuschenko2015")) Theorem 2.2.
  Their reduction embeds a matrix algebra in a finite-group algebra and adds the complementary identity.
  We realize this transfer explicitly for the field used here,
  giving both the matrix units and the resulting two elements.

===== 1.2 Finite presentation and soficity. <finite-presentation-and-soficity.>

For a finite nonempty set $Omega$, write $d_Omega \( f \, h \)$ for the fraction of points on which two maps $f \,
  h : Omega arrow.r Omega$ differ. In the finite-map formulation of Elek and Szabó #cite(label("ElekSzabo2004"))
  Definition 4.2, a group $Gamma$ is #emph[sofic] if, for every finite $E subset.eq Gamma$ and every $epsilon
  in \( 0 \, 1 \)$, there are a finite nonempty $Omega$ and a map $sigma : Gamma arrow.r Omega^Omega$ such that

$ d_Omega #scale(x: 120%, y: 120%)[\(] sigma \( g h \) \,
  sigma \( g \) sigma \( h \) #scale(x: 120%, y: 120%)[\)] & lt.eq epsilon &  & \( g \, h in E \) \,\
d_Omega #scale(x: 120%, y: 120%)[\(] sigma \( 1 \) \, upright("id") #scale(x: 120%, y: 120%)[\)] & lt.eq epsilon \,\
d_Omega #scale(x: 120%, y: 120%)[\(] sigma \( g \) \, upright("id") #scale(x: 120%, y: 120%)[\)] & > 1 -
  epsilon &  & \( g in E \\ { 1 } \) \, $

where products of maps denote composition. Thus soficity asks for finite approximate models of multiplication in
  which nonidentity elements act almost without fixed points.

The stable-finiteness theorem of Elek and Szabó #cite(label("ElekSzabo2004")) Corollary 4.7 applies to the field
  $K$ in Theorem 1. If its particular group $G$ were sofic,
  then $K \[ G \]$ would be stably finite and hence directly finite by the matrix-size-one case,
  contradicting the two displayed product assertions. Therefore this same $G$ is nonsofic.
  In particular, the construction supplies a finitely presented counterexample to the assertion that every group
  is sofic. The finite presentation is established directly in Section 4.6;
  the nonsoficity conclusion uses only the scalar defect and the cited theorem.

===== 1.3 Cellular automata. <cellular-automata.>

For a nonempty finite alphabet $A$, a configuration is an arbitrary function $x : G arrow.r A$.
  A #emph[cellular automaton] on $A^G$ is a map given by a finite set $M subset G$ and a local rule $phi.alt :
  A^M arrow.r A$ through

$ tau \( x \) \( g \) = phi.alt #scale(x: 120%, y: 120%)[\(] \( x \( g u \) \)_(u in M) #scale(x: 120%, y: 120%)[\)] . $

The group $G$ is #emph[surjunctive] if every injective cellular automaton on $A^G$ is surjective,
  for every such $A$. Gottschalk’s conjecture asserts that every group is
  surjunctive #cite(label("Gottschalk1973")). The problem asks whether finite local dependence and translation
  symmetry preserve the finite-set implication from injectivity to surjectivity on the infinite configuration space.

Gromov developed a general symbolic-algebraic surjunctivity theorem #cite(label("Gromov1999")) Section 7.G$'$;
  Weiss gave the finite-alphabet sofic-group theorem directly #cite(label("Weiss2000")) Theorem 3.2.
  Elek and Szabó explicitly recorded the implication from surjunctivity to direct finiteness over finite
  fields #cite(label("ElekSzabo2004")) Section 1. Ceccherini-Silberstein and Coornaert developed the linear
  theory: their equivalence, quantified over all coefficient fields,
  relates stable finiteness to injective-to-surjective behavior of linear cellular automata with
  finite-dimensional vector alphabets #cite(label("CSCCoornaert2006")) Theorem 4.2.
  Phung proved stable finiteness over every field for surjunctive groups,
  using algebraic cellular automata #cite(label("Phung2023")) Theorem B.
  Ceccherini-Silberstein, Coornaert, and Phung later gave a model-theoretic proof and a monoid
  extension #cite(label("CSCPhungGroup2025")) #cite(label("CSCPhungMonoid2025")).
  These results connect algebraic finiteness to a dynamical property rather than imposing finite dimensionality.

For the finite field in Theorem 1, the short algebra-to-automaton passage can be given directly.
  The coefficients of $b_(upright("out"))$ define a local rule,
  the coefficients of $a_(upright("out"))$ give a left inverse on all configurations,
  and a nonzero coefficient of $b_(upright("out")) a_(upright("out")) -
  1$ identifies a missing point-indicator configuration. Section 7 proves this standard transfer in full,
  including the multiplication convention. It gives a negative resolution of Gottschalk’s conjecture for the group
  in Theorem 1; it requires no further existence theorem or approximation assumption.

The characteristic-two scalar pair in Theorem 1 is also the input to the companion counterexample to the
  group-ring Determinant Conjecture #cite(label("DeterminantCompanion")) Theorem 1.1.
  By a separate construction, that paper produces an integral square matrix over another finitely generated group,
  invertible over its rational group ring, whose Fuglede–Kadison determinant lies strictly between zero and one.

===== 1.4 The construction. <the-construction.>

The obstacle is to force a one-sided inverse while retaining a certificate that the reverse product is not the
  identity. The proof separates these requirements through finite incidence data.
  Let $cal(F)$ be a family of subsets of a finite set $V$. We require that each point lie in $ell + 1$ members,
  where $ell$ is an odd prime, and that the bipartite incidence graph have girth at least $12$.
  We also require column vectors $x_v in K^m$ satisfying

$ sum_(v in f) x_v x_v^(sans(T)) = 0 quad \( f in cal(F) \) \, wide sum_(v in V) x_v x_v^(sans(T)) = - I_m \, wide
  m < \| V \| lt.eq m ell^2 . $

Theorem 6 turns these finite data into a counterexample.

Two parts of this criterion explain the separation. First,
  a planar balance argument proves that copies of the additive group $bb(F)_ell^2$,
  glued along their one-dimensional subgroups according to the incidence structure, embed in the resulting group.
  Incidence girth forces a contradiction with Euler’s formula for any diagram witnessing a collapsed local
  element. Second, character idempotents and prescribed subgroup conjugations pack a rectangular factorization
  into square matrices. Their forward product is the identity by the displayed pairings.

To detect the reverse-product defect, we sandwich it by the packing maps and obtain a matrix in an embedded
  subgroup algebra. A homomorphism from that algebra to $K$ sends this matrix to $X^(sans(T)) X - I_(\| V \|)$,
  where $X$ has columns $x_v$. Since $X$ has only $m < \| V \|$ rows, $X^(sans(T)) X$ cannot be the identity,
  so the original defect is nonzero. The homomorphism is used only on the subgroup algebra;
  it is not asserted to extend to the larger group algebra.
  A finite auxiliary group then converts the matrix obstruction into the scalar outputs of Theorem 1.

To produce the incidence data, we take full affine lines over a finite field $Q subset
  K$ and remove a small set of points. Low-degree interpolation on these holes gives the vectors $x_v$:
  the pairings sum to zero on each full line, but removing the holes leaves the nonzero total $- I_m$.
  The geometric task is to retain a regular line system of large incidence girth.
  We combine random small-dimensional slabs with an exact trade in each bundle of directions through a hole.
  Hole selection and a weighted local-lemma estimate rule out triangles, rectangles, and pentagons of lines;
  the local trades preserve regularity. A uniform bound from Linnik’s theorem supplies compatible
  parameters #cite(label("Xylouris2011")) Theorem 1.1.

Low-degree polynomial products and affine-line restrictions also occur in the coding-theoretic constructions of
  Golowich–Lin and Dinur–Liu–Zhang #cite(label("GolowichLin2024")) #cite(label("DinurLiuZhang2025")):
  degree bounds add under products, while restriction to a line does not increase degree.
  Here these features produce the line and total pairing identities.
  We use no coding-theoretic theorem from those works. The only non-elementary existence theorem imported into the
  direct construction is the uniform least-prime bound; the group embeddings, finite matrix block, interpolation,
  and probability argument needed here are proved below.

Section 2 first explains the polynomial pairing and the two size bounds.
  Section 3 formulates the algebraic criterion and proves that its local groups embed.
  Section 4 completes the passage from subgroup averages to scalar elements,
  including a certificate for the reverse defect. Section 5 then supplies the required affine-line system by the
  full probability and local-trade argument. Section 6 fixes all choices and completes the proof of Theorem 1.
  Section 7 gives the cellular automaton and determines its image by finite local equations.

===== 1.5 Conventions. <conventions.>

All incidence structures in the proof are finite. Their incidence graphs have one vertex for each point and one
  for each member of the family, with an edge for each membership.
  The girth is the length of a shortest cycle, and is infinite for a forest.
  An affine $Q$-line is a translate of a one-dimensional $Q$-subspace.
  A direction is such a linear subspace, not a chosen nonzero vector.
  Superscript $sans(T)$ denotes transpose, without any involution on the coefficient field.
  All group presentations define abstract discrete groups.

== 2 Polynomial pairings on a punctured affine space <sec:pairing>

The pairing comes from low-degree polynomials that distinguish the points to be deleted.
  Their pairwise products sum to zero on every full affine line and on the whole affine space.
  At the deleted points, however, the evaluation vectors are coordinate vectors,
  so their contribution is the identity matrix. Removing these points leaves its negative as the total pairing on
  the remaining space.

The interpolation argument does not depend on how the retained full lines are arranged.
  Regularity and girth enter as separate geometric hypotheses in the proposition below.
  Section 5 will supply them, after Sections 3 and 4 explain their algebraic use.

We use the usual lower-set Newton interpolation argument; compare Dyn and Floater #cite(label("DynFloater2014")).
  The triangular evaluation proof below works directly over the finite field needed here.
  The later products of interpolants and their restrictions to full affine lines are the features related to the
  coding constructions of Golowich–Lin #cite(label("GolowichLin2024")) Sections 2.1.2–2.1.3 and Dinur–Liu–Zhang
  #cite(label("DinurLiuZhang2025")) Sections 3.4–3.5. We need no coding theorem from either work:
  the degree bound and all line identities used in this paper are proved below.

#thm([Lemma 2.1.])[
  (Interpolation on an index simplex).  #emph[Let $Q$ be a field of order $q$, enumerate its elements as $a_0 \,
    dots.h \, a_(q - 1)$, and let $0 lt.eq d < q$. For $n gt.eq 1$, set
$ S_d = { \( a_(k_1) \, dots.h \, a_(k_n) \) : k_i gt.eq 0 \, med sum_i k_i lt.eq d } subset Q^n . $

 Evaluation on $S_d$ is an isomorphism from the $Q$-vector space of polynomials of total degree at most $d$ to
   $Q^(S_d)$.]
] <lem:interpolation>

#proof[
  For each tuple $k = \( k_1 \, dots.h \, k_n \)$ of total sum at most $d$, consider
  $ N_k \( X_1 \, dots.h \, X_n \) = product_(i = 1)^n product_(0 lt.eq u < k_i) \( X_i - a_u \) . $
  Its evaluation at the point with index tuple $j$ vanishes if $j_i < k_i$ for any $i$.
    Thus, with tuples in lexicographic order, the square evaluation matrix is triangular.
    Its diagonal entry indexed by $k$ is
  $ product_(i = 1)^n product_(0 lt.eq u < k_i) \( a_(k_i) - a_u \) eq.not 0 . $
  Since $d < q$, there is no additional coordinate restriction on these tuples.
    Their number is $binom(d + n, n)$, the dimension of the polynomial space.
    The displayed polynomials therefore give an invertible evaluation map. ◻
]

#thm([Lemma 2.2.])[
  (Line sums).  #emph[Let $n gt.eq 1$. If $P$ is a polynomial on $Q^n$ of total degree at most $q - 2$,
    then its sum on every full affine $Q$-line is zero. Its sum on $Q^n$ is also zero.]
] <lem:line-sums>

#proof[
  On a line, write its restriction as a polynomial in a parameter $z in Q$ of degree at most $q - 2$.
    The sum of the constant monomial is $q = 0$ in $Q$. If $1 lt.eq k < q - 1$,
    choose $c in Q^times$ with $c^k eq.not 1$, using cyclicity of $Q^times$. Multiplication by $c$ permutes $Q$, so
  $ sum_(z in Q) z^k = c^k sum_(z in Q) z^k $
  forces the sum to vanish. More explicitly, $\( 1 - c^k \) sum_z z^k = 0$ and $1 - c^k eq.not 0$.
    This proves the line assertion. Partition $Q^n$ into parallel lines to obtain the last assertion. ◻
]

#thm([Proposition 2.3.])[
  (The pairing supplied by holes).  #emph[Let $q gt.eq 4$ be a power of two, let $Q$ be a field of order $q$,
    fix an enumeration of $Q$, and let $n gt.eq 1$. Put $d_0 = \( q - 2 \) \/ 2$, $S = S_(d_0) subset cal(A) =
    Q^n$, and $N_(upright("pt")) = q^n$. Let $ell$ be an odd prime and $D = ell + 1$.
    Suppose that $O subset S$ and that $cal(F)$ is a family of full affine $Q$-lines contained in $V =
    cal(A) \\ O$, with
#[#set math.equation(numbering: n => "(2.1)")
 $ frac(2 N_(upright("pt")), D^2) lt.eq \| O \| lt.eq frac(7 N_(upright("pt")), D^2) . $ <eq:hole-size>]

 Suppose also that every point of $V$ lies on $D$ members of $cal(F)$ and that the incidence graph has girth at
   least $12$. If $K$ is a finite extension of $Q$ containing a primitive $ell$th root of unity, then,
   with $m = \| O \|$ and $t = \| V \|$, there are columns $x_v in K^m$, $v in V$, such that
$ 0 < m < t lt.eq m ell^2 \, wide sum_(v in V) x_v x_v^(sans(T)) = - I_m \, wide sum_(v in f) x_v x_v^(sans(T)) =
  0 quad \( f in cal(F) \) . $

]
] <prop:pairing>

#proof[
  Interpolation is on the whole set $S$, although only the subset $O$ is deleted.
    For each $o in O$, Lemma 2 gives a unique polynomial $f_o$ of total degree at most $d_0$ whose values on $S$
    are the indicator function of $o$. Order $O$ and define, for all $v in cal(A)$,
  $ x_v = \( f_o \( v \) \)_(o in O) in Q^m subset K^m \, wide W_v = x_v x_v^(sans(T)) . $
  Each entry of $W_v$ is the value at $v$ of a polynomial of total degree at most $2 d_0 = q - 2$.
    Lemma 3 therefore gives
  $ sum_(v in f) W_v = 0 quad \( f in cal(F) \) \, wide sum_(v in cal(A)) W_v = 0 . $
  For $o in O$, $x_o$ is its coordinate unit vector. Hence $sum_(o in O) W_o = I_m$, and subtraction yields
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_(v in V) W_v = - I_m \, wide sum_(v in f) W_v = 0 quad \( f in cal(F) \) . $ <eq:polynomial-pairing>]
  It remains to check the sizes. Since $D gt.eq 4$, the upper bound in (2.1) is strictly less than
    $N_(upright("pt")) \/ 2$. The lower bound is positive. Thus $0 < m < t$, and
  $ t / m = N_(upright("pt")) / m - 1 lt.eq D^2 / 2 - 1 lt.eq \( D - 1 \)^2 = ell^2 \, $
  where the last inequality is equivalent to $\( D - 2 \)^2 \/ 2 gt.eq 0$.
    These are all the claimed identities and inequalities. ◻
]

#prodef([Remark 2.4.])[
  The simultaneous identities in (2.2) are compatible with regularity because $D = ell +
    1$ is zero as a scalar in characteristic two. Summing the line identities multiplies the total point sum by
    $D$, rather than recovering that total point sum.
]

== 3 An incidence criterion and its embedded local groups <sec:criterion>

We now leave affine geometry. The following criterion is the algebraic part of the construction.
  Its input consists of a finite incidence system and vectors satisfying two matrix identities.
  All groups and group-algebra elements in its conclusion are constructed in this section and Section 4;
  no further geometric assumption enters those arguments.

#thm([Theorem 3.1.])[
  (Incidence criterion).  #emph[Let $ell$ be an odd prime, let $K$ be a finite field of characteristic two
    containing a primitive $ell$th root of unity $zeta$, and put $kappa = ell^2$.
    Let $V$ be a finite set of cardinality $t$, and let $cal(F)$ be a finite family of nonempty subsets of $V$.
    Assume that every $v in V$ belongs to exactly $ell + 1$ members of $cal(F)$ and that the bipartite incidence
    graph of $V$ and $cal(F)$ has girth at least $12$.]
  #emph[Suppose that an integer $m$ and column vectors $x_v in K^m$, $v in V$, satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ 0 < m < t lt.eq m kappa $ <eq:criterion-size>]

 and
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(v in V) x_v x_v^(sans(T)) = - I_m \, wide sum_(v in f) x_v x_v^(sans(T)) = 0 quad
   upright("for every ") f in cal(F) . $ <eq:criterion-pairing>]

 Then there are a finitely presented group $G$ containing an element of order $ell$ and finite sums
   $a_(upright("out")) \, b_(upright("out")) in K \[ G \]$ such that
$ a_(upright("out")) b_(upright("out")) = 1 \, wide b_(upright("out")) a_(upright("out")) eq.not 1 . $

 They are given by the constructions and formulas below.]
] <thm:criterion>

The hypotheses have separate roles. Incidence girth preserves the local subgroups,
  while Equation (3.2) produces a rectangular matrix identity.
  The upper bound $t lt.eq m kappa$ permits character packing into square matrices;
  the strict inequality $m < t$ then detects their reverse-product defect in an embedded subgroup algebra.
  An explicit finite group supplies matrix units that turn these matrices into the promised elements.

=== 3.1 The glued group <the-glued-group>

We first realize the incidence data by finite subgroups of one group.
  For each $v in V$, let $K_v^0$ be a coordinatized copy of the additive group of $bb(F)_ell^2$,
  and for each $f in cal(F)$, let $L_f^0$ be a copy of the additive group of $bb(F)_ell$.
  Since exactly $ell + 1$ hyperedges contain $v$, choose injections

$ iota_(v f) : L_f^0 arrow.r K_v^0 wide \( v in f \) $

whose images are the $ell + 1$ distinct one-dimensional subspaces of $K_v^0$.
  These are homomorphisms of additive groups. In particular,
  their images partition $K_v^0 \\ { 0 }$ outside their common zero element.

Introduce a generator $s_(f \, c)$ for each $f in cal(F)$ and each $0 eq.not c in L_f^0$. A signed word

$ s_(f_1 \, c_1)^(epsilon_1) dots.h.c s_(f_k \, c_k)^(epsilon_k) \, wide epsilon_i in { 1 \, - 1 } \, $

is a defining relator whenever some $v in V$ belongs to every $f_i$ and

$ sum_(i = 1)^k epsilon_i iota_(v f_i) \( c_i \) = 0 quad upright("in ") K_v^0 . $

Let $N$ be the group with these generators and relators. It is finitely generated,
  since the incidence data and all the local groups are finite.

There is a homomorphism $theta_v : K_v^0 arrow.r N$ determined by

$ theta_v \( 0 \) = 1 \, wide theta_v #scale(x: 120%, y: 120%)[\(] iota_(v f) \( c \)
  #scale(x: 120%, y: 120%)[\)] = s_(f \, c) quad \( c eq.not 0 \) . $

Indeed, each nonzero element has a unique expression on the left.
  For $a \, b in K_v^0$, the word expressing $theta_v \( a \) theta_v \( b \)
  theta_v \( a + b \)^(- 1)$ is a defining relator, after omitting factors corresponding to zero elements.

The same group is presented by the finite sublist of defining relators of length at most three.
  These include every local multiplication-table relation just displayed, as well as the local inverse relations.
  Within one $K_v^0$, successive applications of those relations reduce any signed word to the generator for its
  sum, or to the empty word when the sum is zero. Thus they imply every defining relator of $N$,
  and $N$ is finitely presented. We retain the all-word formulation because it makes the planar proof below more
  transparent.

#thm([Lemma 3.2.])[
  #emph[If the incidence graph of $\( V \, cal(F) \)$ has girth at least $12$, then every homomorphism $theta_v :
    K_v^0 arrow.r N$ is injective.]
] <lem:embedding>

#proof[
  Every nonzero element of $K_v^0$ maps to a single generator $s_(f \, c)$.
    It therefore suffices to prove that no such generator is the identity in $N$.
    Suppose, to the contrary, that $s_(f \, c) = 1$, with $c eq.not 0$.
    We will encode this equality by a planar graph with zero local sums at every vertex except one.
    Reducing the graph will make the local group relations force lower bounds on vertex degrees,
    while incidence girth forces lower bounds on facial lengths.
    These bounds will contradict Euler’s formula even with the one exceptional vertex.
  #emph[From a word equality to a planar graph.] The one-letter word $s_(f \, c)$ can be changed to the empty word
    by finitely many insertions and deletions of contiguous defining relators.
    To justify this form of reduction, take the congruence on signed words generated by those operations.
    Every formal inverse pair is a defining relator, since its hyperedge has an incident vertex.
    The quotient is consequently a group, and its universal property is exactly that of the presentation of $N$.
    Thus equality in $N$ is equality under this congruence. Equivalently,
    each factor $u r^(plus.minus 1) u^(- 1)$ in a finite normal-closure expression can be inserted by first
    forming $u u^(- 1)$ through nested inverse-pair insertions and then inserting $r^(plus.minus 1)$ between its
    two halves. Inverses of defining relators are again defining relators.
  Draw the successive words on horizontal levels, treating each signed letter as an individual token.
    Between two levels, connect the tokens that persist in their unchanged order.
    An inserted or deleted block begins or ends its tokens at a new black vertex,
    labelled by a point $v$ at which the corresponding relator has zero sum. This can be drawn without crossings:
    the affected block is contiguous, so its star occupies a single gap between the other order-preserving wires.
    Joining the finitely many strips gives a planar drawing.
  Every inserted token $s_(i \, y)^epsilon$ has one creation vertex and one deletion vertex.
    Subdivide its full lifetime wire by a white vertex labelled $i$,
    and give its two edges weights $epsilon y$ at the creation end and $- epsilon y$ at the deletion end.
    The initial token instead has an exceptional white endpoint labelled $f$,
    joined to its deletion vertex by an edge of weight $- c$.
    We obtain a finite planar bipartite multigraph with black labels in $V$ and white labels in $cal(F)$.
    An edge joining labels $v$ and $i$ has a nonzero weight in $L_i^0$, and $v in i$. Its balances are
  #[#set math.equation(numbering: n => "(3.3)")
   $ & sum_(a in.rev x) iota_(v \, i \( a \)) #scale(x: 120%, y: 120%)[\(] omega \( a \)
     #scale(x: 120%, y: 120%)[\)] = 0 &  & upright("at each black vertex ") x upright(" labelled ") v \,\
 & sum_(a in.rev y) omega \( a \) = 0 &  & upright("at each ordinary white vertex ") y \, $ <eq:embedding-balances>]
  where $omega \( a \)$ is the weight of edge $a$ and $i \( a \)$ is its white label.
    The exceptional white vertex has nonzero sum. At creation vertices the first balance is the relator sum,
    and at deletion vertices it is its negative. Ordinary white sums vanish because their two weights are
    opposite. Retain only the connected component of the exception.
  #emph[Reducing the planar graph.] Among all connected planar bipartite multigraphs with the indicated labels,
    nonzero edge weights, and balances (3.3), and with exactly one exceptional white vertex of nonzero sum,
    choose one minimizing lexicographically the number of vertices and then the number of edges.
    We do not require this comparison graph to come from a word reduction.
    Its exceptional vertex has positive degree, so the graph has an edge.
  There are no parallel edges. Two parallel edges have weights in the same $L_i^0$ and the same map $iota_(v i)$
    at their black endpoint. Replace them by one edge carrying their sum, or delete both if that sum is zero,
    and again retain the component of the exception. Additivity preserves every balance and preserves the
    exceptional nonzero sum. This gives a smaller comparison graph, a contradiction.
  Fix a spherical embedding of the minimal graph. We claim that, at each vertex of degree at least two,
    cyclically consecutive neighbors have distinct labels. If two such neighbors have the same label,
    they are distinct vertices because parallel edges have been removed.
    Join them by an auxiliary arc following one side of the two incident edges and the empty sector between those
    edges, and contract the arc. A sufficiently narrow neighborhood of this two-edge path makes the arc disjoint
    from the rest of the graph. This construction is local and remains valid when either edge is a bridge.
  The contraction merges vertices of the same color and label.
    Each original edge keeps its weight and its opposite-color endpoint;
    hence the resulting graph is still bipartite, and every edge weight is nonzero.
    Parallel edges created by the contraction are allowed in the comparison class.
    When black vertices are merged, their balances add in the same $K_v^0$, while white balances are unchanged.
    When white vertices are merged, their balances add in the same $L_i^0$,
    while every black incidence map and weighted sum is unchanged.
    If the exception is merged, its sum is increased by zero.
    Thus the contraction gives a comparison graph with fewer vertices, proving the claim.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-1.55, 2.2), (-1.1, 1.65), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((-1.1, 1.65), (0, 0), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((0, 0), (1.1, 1.65), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((1.1, 1.65), (1.55, 2.2), stroke: (thickness: 0.6pt, miter-limit: 10))
  bezier((-1.1, 1.65), (0, 0.43), (-0.92, 1.47), (-0.15, 0.43), stroke: (thickness: 0.55pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((0, 0.43), (1.1, 1.65), (0.15, 0.43), (0.92, 1.47), stroke: (thickness: 0.55pt, miter-limit: 10, dash: "densely-dashed"))
  circle((-1.1, 1.65), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((-1.1, 1.782), [$f$], anchor: "south")
  content((-1.232, 1.65), [$p$], anchor: "east")
  circle((1.1, 1.65), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((1.1, 1.782), [$f$], anchor: "south")
  content((1.232, 1.65), [$q$], anchor: "west")
  circle((0, 0), radius: 0.07937, fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.1147), [$v$], anchor: "north")
  content((-0.1147, 0), [$x$], anchor: "east")
  content((-0.76, 0.78), [#text(size: 9pt)[$a$]])
  content((0.76, 0.78), [#text(size: 9pt)[$b$]])
  line((1.95, 1), (3.35, 1), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  content((2.65, 1.106), [#text(size: 9pt)[contract]], anchor: "south", padding: 0.1176cm)
  line((4.35, 2.2), (5.1, 1.65), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((5.1, 1.65), (5.85, 2.2), stroke: (thickness: 0.6pt, miter-limit: 10))
  bezier((5.1, 0), (5.1, 1.65), (4.47, 0.45), (4.47, 1.2), stroke: (thickness: 0.6pt, miter-limit: 10))
  bezier((5.1, 0), (5.1, 1.65), (5.73, 0.45), (5.73, 1.2), stroke: (thickness: 0.6pt, miter-limit: 10))
  circle((5.1, 1.65), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((5.1, 1.782), [$f$], anchor: "south")
  content((5.232, 1.65), [$r$], anchor: "west")
  circle((5.1, 0), radius: 0.07937, fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.1, -0.1147), [$v$], anchor: "north")
  content((4.985, 0), [$x$], anchor: "east")
  content((4.38, 0.82), [#text(size: 9pt)[$a$]])
  content((5.82, 0.82), [#text(size: 9pt)[$b$]])
})],
    caption: [Figure 1: The white vertices $p \, q$, both labelled $f$, merge to $r$ along the dashed auxiliary arc in the empty sector between their consecutive edges at the black vertex $x$, labelled $v$. The edges of weights $a \, b$ remain distinct parallel edges. ],
  ) <fig:merge>
  #emph[Degrees, faces, and Euler’s formula.] An ordinary white vertex cannot have degree one,
    since its incident weight would be nonzero. A black vertex cannot have degree one either,
    since the maps $iota_(v i)$ are injective. If a black vertex had degree two,
    its two white neighbors would have distinct labels by the preceding claim.
    Its zero balance would then equate two nonzero vectors in distinct one-dimensional subspaces of $K_v^0$,
    which is impossible. Consequently every black degree is at least three,
    and every white degree is at least two except possibly the exceptional degree, which is at least one.
  Consider the facial boundary walks of this connected plane graph, counting edge sides with multiplicity.
    At a turn through a vertex of degree at least two, the entering and leaving edges are distinct and consecutive
    in its rotation. Their opposite endpoints have different labels.
    Thus the image of the boundary walk in the incidence graph has no immediate backtracking at that turn.
    This also applies to the cyclic closing turn of the walk. Bridges cause no difficulty:
    their two sides are counted separately, and a facial walk reverses immediately along an edge only at a
    degree-one vertex. There is at most one such vertex, the exceptional white vertex, and it belongs to just one face.
  It follows that all but at most one face have boundary walks whose images are nonempty closed walks without
    immediate backtracking in the incidence graph. Such a walk contains a cycle,
    so each of these faces has length at least $12$. Write $n_(upright(b)) \, n_(upright(w)) \,
    n_(upright(f))$ for the numbers of black vertices, white vertices, and faces, and $E$ for the number of edges.
    The degree bounds and the total of $2 E$ edge sides give
  $ n_(upright(b)) lt.eq E / 3 \, wide n_(upright(w)) lt.eq frac(E + 1, 2) \, wide n_(upright(f)) lt.eq E / 6 + 1 . $
  Therefore
  $ n_(upright(b)) + n_(upright(w)) + n_(upright(f)) lt.eq E + 3 / 2 < E + 2 \, $
  contrary to Euler’s formula for a connected plane graph. The assumed word equality is impossible,
    and every $theta_v$ is injective. ◻
]

We henceforth identify $K_v^0$ with its image $K_v lt.eq N$, and identify $L_f^0$ with the subgroup $L_f lt.eq
  N$ given by $c mapsto s_(f \, c)$, with $0$ mapped to the identity.
  The latter is injective by choosing any point incident to $f$ and applying Lemma 7.
  The shared generators identify this same subgroup inside every $K_v$ with $v in f$.
  In particular, $\| K_v \| = ell^2$, $\| L_f \| = ell$, and the incident subgroups $L_f$ partition $K_v$ outside
  the identity. No assertion about intersections between other local subgroups is needed.

== 4 From subgroup averages to the scalar defect <sec:packing>

The embedded groups now allow legitimate subgroup averages.
  We first obtain a rectangular identity, then pack its intermediate coordinates into square matrices,
  and finally encode those matrices as scalar elements of a group algebra.
  The strict size inequality will detect the reverse defect after packing.

=== 4.1 Subgroup averages and a rectangular identity <subgroup-averages-and-a-rectangular-identity>

We prove Theorem 6 using the group $N$ and subgroups $K_v \, L_f lt.eq N$ supplied by Lemma 7.
  We retain the coordinates on $K_v$ transported from $K_v^0 = bb(F)_ell^2$.
  Fix an ordering of $V$, and use it for all matrix indices indexed by $V$. For $v in V$ put

#[#set math.equation(numbering: n => "(4.1)")
 $ P_v = kappa^(- 1) sum_(u in K_v) u in K \[ N \] . $ <eq:local-average>]

The integer $kappa$ is invertible in $K$, since $ell$ is odd.
  For each $w in K_v$ there are exactly $kappa$ pairs $\( u \, u' \) in K_v^2$ with $u u' = w$, so $P_v^2 = P_v$.

At a fixed $v$, the subgroups $L_f$ for $f in.rev v$ run through all the one-dimensional subspaces of the additive
  group $K_v$. Their nonidentity elements partition $K_v \\ { 1 }$. Consequently

#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(u in K_v) u = 1 + sum_(f in.rev v) (sum_(u in L_f) u - 1) . $ <eq:subgroup-decomposition>]

This equality is internal to $K_v$; no assertion about intersections between different $K_v$ is needed.

Write $W_v = x_v x_v^(sans(T))$. Define matrices over $K \[ N \]$ by

#[#set math.equation(numbering: n => "(4.3)")
 $ U in "Mat"_(m times t) \( K \[ N \] \) \, wide T in "Mat"_(t times m) \( K \[ N \] \) \, wide U_(- \, v) = -
   kappa x_v P_v \, quad T_(v \, -) = P_v x_v^(sans(T)) \, $ <eq:rectangular-definitions>]

and set $P = "diag"_(v in V) \( P_v \)$. Since the entries of each $x_v$ belong to the coefficient field,
  they commute with all group-algebra elements. Idempotence gives $U P = U$ and $P T = T$. Moreover,

$ U T & = - kappa sum_(v in V) W_v P_v^2 = - sum_(v in V) W_v sum_(u in K_v) u\
 & = - sum_(v in V) W_v - sum_(f in cal(F)) (sum_(v in f) W_v) (sum_(u in L_f) u - 1) = I_m \, $

where we used Equations (4.2) and (3.2). We have proved

#[#set math.equation(numbering: n => "(4.4)")
 $ U P = U \, wide P T = T \, wide U T = I_m . $ <eq:rectangular-identities>]

=== 4.2 A group extension implementing character twists <a-group-extension-implementing-character-twists>

Equation (4.4) gives the forward identity, but the factors are rectangular.
  We next arrange enough orthogonal character idempotents to place their $t$ intermediate coordinates into $m$
  slots. The extension will implement the necessary changes of character by conjugation while preserving the
  original subgroup algebra.

Let $z$ generate a cyclic group of order $ell$, and put $H = N times chevron.l z chevron.r$.
  Choose $v_(*) in V$ and put $K_(*) = K_(v_(*))$. For every $v in V$ let $phi.alt_v : K_v arrow.r
  K_(*)$ be the isomorphism taking each element to the element with identical $bb(F)_ell^2$ coordinates.
  There are exactly $kappa$ linear forms $K_(*) arrow.r bb(F)_ell$.
  By Equation (3.1), we may assign to each $v in V$ a slot $s \( v \) in { 1 \, dots.h \,
  m }$ and a linear form $alpha_v : K_(*) arrow.r bb(F)_ell$ so that the pairs $\( s \( v \) \, alpha_v \)$ are
  distinct. In particular, the forms assigned within any one slot are distinct.

We use a multiple HNN extension #cite(label("HNN1949")) Theorem II,
  verifying the required base-group embedding directly. Adjoin to $H$ generators $tau_v$, $v in V$, with relations

#[#set math.equation(numbering: n => "(4.5)")
 $ tau_v \( u z^r \) tau_v^(- 1) = phi.alt_v \( u \) z^(r + alpha_v \( phi.alt_v \( u \) \))
   wide \( u in K_v \, med r in bb(Z) \/ ell \) . $ <eq:twisted-conjugation>]

Denote the resulting group by $L$. Exponents in $bb(F)_ell$ are interpreted in $bb(Z) \/ ell$.
  For each $v$, the specified map

$ psi_v : K_v times chevron.l z chevron.r arrow.r K_(*) times chevron.l z chevron.r \, wide
  u z^r mapsto phi.alt_v \( u \) z^(r + alpha_v \( phi.alt_v \( u \) \)) \, $

is a group isomorphism. Its inverse takes $w z^r$ to $phi.alt_v^(- 1) \( w \) z^(r - alpha_v \( w \))$.

We verify directly that $H$ embeds in $L$. Let $H$ act on itself by left multiplication.
  Restricted to either the domain or the image of $psi_v$, this is a disjoint union of regular actions of a
  subgroup of order $ell^3$. These two collections of orbits have the same cardinality.
  Indeed, if $H$ is finite, both have $\| H \| \/ ell^3$ orbits; if $H$ is infinite,
  both have countably infinitely many, since $H$ is countable and the subgroups are finite.
  Pair these orbits and choose representatives $h_i \, k_i$ so that they are respectively
  $\( K_v times chevron.l z chevron.r \) h_i$ and $\( K_(*) times chevron.l z chevron.r \) k_i$. The bijection

$ F_v \( a h_i \) = psi_v \( a \) k_i wide \( a in K_v times chevron.l z chevron.r \) $

of the set $H$ conjugates left multiplication by $a$ to left multiplication by $psi_v \( a \)$.
  Assign $F_v$ to $tau_v$ for each $v$. These assignments, together with the left regular action of $H$,
  satisfy all the relations defining $L$: no defining relation couples two distinct stable letters,
  so overlapping associated subgroups impose no additional compatibility condition on the independently chosen
  $F_v$. They therefore give a permutation representation of $L$ whose restriction to $H$ is faithful.
  This proves the required embedding. In particular, $K \[ H \]$ embeds in $K \[ L \]$.

Taking $u = 1$ in Equation (4.5) shows that every $tau_v$ centralizes $z$.
  Since $z$ is already central in $H$, it is central in $L$. Define

#[#set math.equation(numbering: n => "(4.6)")
 $ e = ell^(- 1) sum_(r = 0)^(ell - 1) zeta^(- r) z^r in K \[ L \] . $ <eq:central-character-idempotent>]

This is a nonzero central idempotent and satisfies $e z = zeta e$.
  For completeness, in the convolution square each coefficient of $z^a$ is $ell^(- 2) ell zeta^(- a)$,
  which proves $e^2 = e$; reindexing the sum proves $e z = zeta e$.
  The identity coefficient is $ell^(- 1) eq.not 0$ because $chevron.l z chevron.r$ remains embedded.

For a linear form $alpha : K_(*) arrow.r bb(F)_ell$, put

#[#set math.equation(numbering: n => "(4.7)")
 $ Q_alpha = kappa^(- 1) sum_(u in K_(*)) zeta^(alpha \( u \)) u . $ <eq:local-character-idempotent>]

Using additive notation for the coordinates of $K_(*)$, the coefficient of $w$ in $Q_alpha Q_beta$ is

$ kappa^(- 2) zeta^(beta \( w \)) sum_(u in K_(*)) zeta^(alpha \( u \) - beta \( u \)) . $

If $alpha = beta$, the inner sum is $kappa$. Otherwise choose $u_0$ with $zeta^(alpha \( u_0 \) - beta \( u_0 \))
  eq.not 1$. Translating the summation variable by $u_0$ multiplies the sum by this scalar while leaving it
  unchanged, so the sum is zero. Thus

#[#set math.equation(numbering: n => "(4.8)")
 $ Q_alpha Q_beta = cases(delim: "{", Q_alpha \, & alpha = beta \,, 0 \, & alpha eq.not beta .)
   $ <eq:character-products>]

The conjugation relations and $e z^r = zeta^r e$ now give

#[#set math.equation(numbering: n => "(4.9)")
 $ tau_v e P_v tau_v^(- 1) = kappa^(- 1) sum_(u in K_v) e phi.alt_v \( u \) z^(alpha_v \( phi.alt_v \( u \) \)) =
   e Q_(alpha_v) . $ <eq:twisted-projection>]

=== 4.3 Packing into square matrices <packing-into-square-matrices>

The orthogonality in Equation (4.8) now lets different coordinates share a slot without cross terms.
  The following matrices implement the assignment of each coordinate $v$ to its slot $s \( v \)$.

Define $C in "Mat"_(m times t) \( K \[ L \] \)$ and $J_0 in "Mat"_(t times m) \( K \[ L \] \)$ by

#[#set math.equation(numbering: n => "(4.10)")
 $ C_(s \, v) = cases(delim: "{", tau_v e P_v \, & s = s \( v \) \,, 0 \, & s eq.not s \( v \) \,)
   wide \( J_0 \)_(v \, s) =
   cases(delim: "{", e P_v tau_v^(- 1) \, & s = s \( v \) \,, 0 \, & s eq.not s \( v \) .) $ <eq:packing-matrices>]

We claim that

#[#set math.equation(numbering: n => "(4.11)")
 $ J_0 C = e P . $ <eq:packing-identity>]

The diagonal entry indexed by $v$ is $e P_v$. If $v eq.not w$ have different slots,
  the corresponding entry is zero. If they have the same slot, Equation (4.9) rewrites that entry as

$ e P_v tau_v^(- 1) tau_w e P_w = tau_v^(- 1) e Q_(alpha_v) e Q_(alpha_w) tau_w = 0 \, $

because $alpha_v eq.not alpha_w$. This proves the claim.

Set

#[#set math.equation(numbering: n => "(4.12)")
 $ a_(upright("mat")) = U J_0 + \( 1 - e \) I_m \, wide b_(upright("mat")) =
   C T + \( 1 - e \) I_m . $ <eq:square-elements>]

Every entry of $C$ and $J_0$ contains the central factor $e$.
  Consequently the cross terms with $1 - e$ vanish, and Equations (4.4) and (4.11) imply

#[#set math.equation(numbering: n => "(4.13)")
 $ a_(upright("mat")) b_(upright("mat")) = U \( e P \) T + \( 1 - e \) I_m = e I_m + \( 1 - e \) I_m =
   I_m . $ <eq:square-forward-product>]

=== 4.4 Detecting the reverse defect <detecting-the-reverse-defect>

Put $Delta = b_(upright("mat")) a_(upright("mat")) - I_m$.
  We detect its nonvanishing by multiplying on the left by $J_0$ and on the right by $C$.
  This brings the calculation back from $K \[ L \]$ to its embedded subgroup algebra $K \[ H \]$,
  where a scalar specialization is available. Direct multiplication gives $Delta = C T U J_0 - e I_m$, and hence

#[#set math.equation(numbering: n => "(4.14)")
 $ J_0 Delta C = \( e P \) T U \( e P \) - e P = e \( T U - P \) . $ <eq:reverse-sandwich>]

In the last equality the order of multiplication is essential:
  $\( e P \) T U \( e P \) = e \( P T \) \( U P \) = e T U$.
  The right-hand side of Equation (4.14) already belongs to $"Mat"_t \( K \[ H \] \)$.

There is a $K$-algebra homomorphism

#[#set math.equation(numbering: n => "(4.15)")
 $ epsilon : K \[ H \] arrow.r K \, wide epsilon \( n z^r \) =
   zeta^r quad \( n in N \) . $ <eq:subgroup-specialization>]

It is well-defined because $H = N times chevron.l z chevron.r$. It sends $e$ to $1$ and each $P_v$ to $1$.
  Let $X in "Mat"_(m times t) \( K \)$ be the matrix with columns $x_v$.
  Since the characteristic is two and $kappa$ is odd,

$ epsilon \( U \) = X \, wide epsilon \( T \) = X^(sans(T)) \, wide X X^(sans(T)) = I_m . $

Thus

#[#set math.equation(numbering: n => "(4.16)")
 $ epsilon #scale(x: 120%, y: 120%)[\(] e \( T U - P \) #scale(x: 120%, y: 120%)[\)] = X^(sans(T)) X -
   I_t . $ <eq:specialized-defect>]

Because $t > m$, choose a nonzero $y in ker X$. Then

#[#set math.equation(numbering: n => "(4.17)")
 $ epsilon #scale(x: 120%, y: 120%)[\(] e \( T U - P \) #scale(x: 120%, y: 120%)[\)] y = -
   y eq.not 0 . $ <eq:nonzero-witness>]

One explicit choice is the first nonzero column of $I_t - X^(sans(T)) X$:
  this matrix is nonzero because $"rank" \( X^(sans(T)) X \) lt.eq m < t$, and $X \( I_t - X^(sans(T)) X \) = 0$.
  This choice uses only finite-field arithmetic on the given vectors.

Equation (4.17) proves that $e \( T U - P \)$ is nonzero in $"Mat"_t \( K \[ H \] \)$.
  The embedding $K \[ H \] subset.eq K \[ L \]$ and Equation (4.14) therefore show that $Delta eq.not 0$.
  The homomorphism $epsilon$ has been applied only to elements of $K \[ H \]$;
  no extension of it to $K \[ L \]$ is used.

=== 4.5 From matrices to two group-algebra elements <from-matrices-to-two-group-algebra-elements>

The square factors give a failure of stable finiteness for $K \[ L \]$.
  To obtain scalar factors, we embed $"Mat"_m \( K \[ L \] \)$ in an idempotent corner of $K \[ L times F \]$ for
  a suitable finite group $F$. The identity of this corner need not be the identity of the whole group algebra;
  adding its complement to both factors will give a scalar product equal to $1$.
  This is an explicit instance of the finite-factor reduction of Dykema and
  Juschenko #cite(label("DykemaJuschenko2015")) Theorem 2.2.

For the finite matrix block, let

#[#set math.equation(numbering: n => "(4.18)")
 $ B = \( bb(Z) \/ ell \)^m \, wide F = B times.r S_m \, $ <eq:finite-auxiliary-group>]

where $S_m$ permutes the coordinates. For $1 lt.eq i lt.eq m$ define

#[#set math.equation(numbering: n => "(4.19)")
 $ p_i = \| B \|^(- 1) sum_(w in B) zeta^(- w_i) w in K \[ F \] . $ <eq:coordinate-idempotents>]

The coordinate characters are distinct. The character-sum calculation used in Equation (4.8), now on $B$,
  shows that the $p_i$ are pairwise orthogonal idempotents.
  Each is nonzero, since its identity coefficient is $\| B \|^(- 1)$.
  This denominator exists because $\| B \| = ell^m$ is odd. No inverse of $\| S_m \|$ is required.

Let $sigma_i in S_m$ exchange coordinates $1$ and $i$, taking $sigma_1 = 1$. Then $sigma_i p_1 sigma_i^(- 1) = p_i$. Put

#[#set math.equation(numbering: n => "(4.20)")
 $ p_(i j) = sigma_i p_1 sigma_j^(- 1) wide \( 1 lt.eq i \, j lt.eq m \) . $ <eq:finite-matrix-units>]

These elements are nonzero, being left and right translates of $p_1$, and they satisfy $p_(i i) =
  p_i$ and $p_i p_(i j) p_j = p_(i j)$. For $j eq.not k$ the latter identity and $p_j p_k =
  0$ give $p_(i j) p_(k r) = 0$. For $j = k$, direct cancellation gives $p_(i j) p_(j r) =
  sigma_i p_1^2 sigma_r^(- 1) = p_(i r)$. Thus

#[#set math.equation(numbering: n => "(4.21)")
 $ p_(i j) p_(k r) = delta_(j k) p_(i r) . $ <eq:matrix-unit-products>]

The matrix units are linearly independent over $K$: multiplying a linear relation on the left by $p_i$ and on the
  right by $p_j$ isolates its coefficient of the nonzero element $p_(i j)$.

Take

#[#set math.equation(numbering: n => "(4.22)")
 $ G = L times F . $ <eq:output-group>]

We regard $K \[ L \]$ and $K \[ F \]$ as commuting subalgebras of $K \[ G \]$, and put

#[#set math.equation(numbering: n => "(4.23)")
 $ f_(upright("blk")) = sum_(i = 1)^m p_(i i) \, wide Phi : "Mat"_m \( K \[ L \] \) arrow.r K \[ G \] \, wide
   Phi \( Z \) = sum_(i \, j = 1)^m Z_(i j) p_(i j) . $ <eq:block-embedding>]

Equation (4.21) proves that $Phi$ is multiplicative and that $Phi \( I_m \) = f_(upright("blk"))$.
  It is also injective. Indeed, the group basis identifies $K \[ L times F \]$ with $K \[ L \] ⊗_K K \[ F \]$.
  If $Phi \( Z \) = 0$, expand each entry as $Z_(i j) = sum_(g in L) c_(i j \, g) g$.
  Comparing the $L$-basis coefficient of each $g$ gives $sum_(i \, j) c_(i j \, g) p_(i j) = 0$.
  The linear independence just proved forces every $c_(i j \, g)$ to be zero.

The required two elements are

#[#set math.equation(numbering: n => "(4.24)")
 $ #box(stroke: black, inset: 3pt, [$ a_(upright("out")) & = 1 - f_(upright("blk")) +
   sum_(i \, j = 1)^m #scale(x: 120%, y: 120%)[\(] \( U J_0 \)_(i j) + \( 1 - e \) delta_(i j)
   #scale(x: 120%, y: 120%)[\)] p_(i j) \,\
b_(upright("out")) & = 1 - f_(upright("blk")) + sum_(i \, j = 1)^m
  #scale(x: 120%, y: 120%)[\(] \( C T \)_(i j) + \( 1 - e \) delta_(i j) #scale(x: 120%, y: 120%)[\)] p_(i j) .
  $]) $ <eq:output-elements>]

Equivalently, these are $1 - f_(upright("blk")) + Phi \( a_(upright("mat")) \)$ and $1 - f_(upright("blk")) +
  Phi \( b_(upright("mat")) \)$, respectively. The matrix-unit identities imply

$ f_(upright("blk"))^2 = f_(upright("blk")) \, wide f_(upright("blk")) Phi \( Z \) = Phi \( Z \) =
  Phi \( Z \) f_(upright("blk")) . $

Therefore $1 - f_(upright("blk"))$ annihilates every image of $Phi$ on both sides. It follows from Equation (4.13) that

$ a_(upright("out")) b_(upright("out")) = 1 - f_(upright("blk")) + Phi \( I_m \) = 1 \, $

whereas

#[#set math.equation(numbering: n => "(4.25)")
 $ b_(upright("out")) a_(upright("out")) - 1 = Phi \( Delta \) eq.not 0 $ <eq:output-defect>]

by injectivity. Only the identity action of $f_(upright("blk"))$ on the image of $Phi$ is needed for these computations.

=== 4.6 Finite presentation and the retained odd torsion <sec:finite-presentation>

All sums in Equation (4.24) are finite, as are the sums defining their entries.
  We now verify the remaining assertions about the group $G$ by tracking its presentation through the construction.

Let $N = chevron.l cal(S)_N divides cal(R)_N chevron.r$ be the finite presentation from Section 3,
  with the generators $s_(f \, c)$ and the local zero-sum relators of length at most three.
  With $\[ x \, y \] = x y x^(- 1) y^(- 1)$, the direct product with the cyclic group has the finite presentation

$ H = ⟨cal(S)_N \, z med mid(bar.v) thick cal(R)_N \, med z^ell \, med \[ z \, s \] med \( s in cal(S)_N \)⟩ . $

Every element of $K_v$ and $K_(*)$ in Equation (4.5) has a representative given by its local generator,
  or by the empty word for the identity. Using those representatives,
  that equation adds $\| V \|$ stable letters and at most $\| V \|
  ell^3$ relators to the displayed presentation of $H$: its indices are $v in V$, $u in K_v$,
  and $r in bb(Z) \/ ell$. Hence $L$ is finitely presented.
  The permutation action used above proves that the base group embeds; its choices do not add generators or relators.

The group $F = \( bb(Z) \/ ell \)^m times.r S_m$ is finite,
  so its finite multiplication table gives a finite presentation.
  A presentation of $G = L times F$ consists of finite presentations of the two factors on disjoint generator
  sets, together with the commutators of every generator of $L$ with every generator of $F$.
  This adds only finitely many relators, and therefore $G$ is finitely presented.
  Finally, the embeddings already proved give

$ K_v lt.eq N lt.eq H lt.eq L lt.eq G . $

Since $K_v$ is the additive group of $bb(F)_ell^2$, its nonidentity elements have order $ell$.
  The output group therefore contains the asserted odd-order torsion. This completes the proof of Theorem 6.

The construction proves a failure of direct finiteness for a group algebra by exhibiting its two elements.
  In particular, the last step does not infer stable finiteness from direct finiteness for an arbitrary ring:
  it uses the explicit finite group $F$ and the injective map $Phi$.

== 5 A regular hypergraph of affine lines <sec:hypergraph>

The algebraic criterion is now complete. Its remaining input is a line system satisfying Proposition 4:
  full lines avoiding a set of holes of controlled size, with exact regularity and incidence girth at least $12$.
  Starting from line partitions gives regularity, but simply deleting the lines through a hole would lower the
  degree of other points as well. We instead arrange the lines through each hole in planar bundles that can be
  replaced by parallel lines missing the hole. Each replacement preserves every other point’s degree.
  We choose the holes to make these replacements compatible,
  then use random three-dimensional slabs to exclude the remaining short incidence cycles.

Let $q = 2^h$ and let $ell$ be the least prime congruent to $- 1$ modulo $q^100$.
  The residue $q^100 - 1$ is coprime to $q^100$. Linnik’s theorem #cite(label("Linnik1944")) gives absolute
  constants $c \, L > 0$ such that this prime exists and $ell lt.eq c q^(100 L)$; see, for example,
  #cite(label("Xylouris2011")) Theorem 1.1. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ D = ell + 1 \, wide s = floor.l log_q D floor.r \, wide b = s + 20 \, wide n = 10 b \, wide N_(upright("pt")) =
   q^n . $ <eq:hypergraph-parameters>]

Thus $q^100 divides D$, $s gt.eq 100$, and

#[#set math.equation(numbering: n => "(5.2)")
 $ q^s lt.eq D < q^(s + 1) . $ <eq:hypergraph-growth>]

Moreover, $s$ is bounded independently of $h$: indeed, $D lt.eq \( c + 1 \) q^(100 L)$ implies $s lt.eq 100 L +
  log_2 \( c + 1 \)$. In this section all asymptotic statements refer to $h arrow.r oo$.
  Constants implicit in $O \( dot.op \)$ may depend on a fixed upper bound for $s$, but not on $h$,
  the field enumeration, or the indices of the objects being counted.
  Thus $s$ and $n$ may vary with $h$, but the estimates below use fixed upper bounds for them.

The divisibility $q divides D$ permits bundles of $q$ directions.
  The lower bound $s gt.eq 100$ makes the hole-selection estimates small, and the slack in $b = s +
  20$ controls the later event weights. The factor ten in $n =
  10 b$ permits ten-wise independent subspaces in the construction below.
  Each step of a short polygon will involve at most two of these subspaces,
  so their directness will cover polygons with at most five steps.

Let $Q$ be a field of order $q$, with any enumeration $\( a_0 \, dots.h \, a_(q - 1) \)$, and put $cal(A) = Q^n$. Define

#[#set math.equation(numbering: n => "(5.3)")
 $ d_0 = \( q - 2 \) \/ 2 \, wide S = {\( a_(i_1) \, dots.h \, a_(i_n) \) : i_1 + dots.h.c + i_n lt.eq
   d_0} . $ <eq:hypergraph-lower-set>]

An affine line always means a full translate of a one-dimensional $Q$-subspace,
  and consequently contains exactly $q$ points.

#thm([Theorem 5.1.])[
  #emph[For all sufficiently large $h$, for every $Q$ and enumeration as above,
    there are a set $O subset S$ and a set $cal(F)$ of affine lines contained in $V = cal(A) \\ O$ such that
#[#set math.equation(numbering: n => "(5.4)")
 $ frac(2 N_(upright("pt")), D^2) lt.eq \| O \| lt.eq frac(7 N_(upright("pt")), D^2) \, $ <eq:hypergraph-hole-size>]

 every point of $V$ lies on exactly $D$ members of $cal(F)$,
   and the bipartite incidence graph of $V$ and $cal(F)$ has girth at least $12$.]
] <thm:hypergraph>

=== 5.1 Direction spaces and the local trade <direction-spaces-and-the-local-trade>

Divide an index set of size $D$ into $D \/ q$ bundles of size $q$.
  Write $rho \( j \)$ for the bundle containing an index $j$.

#thm([Lemma 5.2.])[
  #emph[There are two-dimensional subspaces $W_r subset cal(A)$, one per bundle,
    and $\( b - 1 \)$-dimensional subspaces $E_j subset cal(A)$, one per index,
    such that any at most ten distinct members of this list have direct sum.
    Choose a direction $e_r$ in each $W_r$, and assign its other $q$ directions bijectively to the indices in that
    bundle, calling them $d_j$. Then $U_j = d_j xor E_j$ has dimension $b$, and
#[#set math.equation(numbering: n => "(5.5)")
 $ U_j ∩ U_(j') = 0 quad \( j eq.not j' \) \, wide U_j ∩ e_r = 0 \, wide U_j ∩ W_r =
   cases(delim: "{", d_j \, & r = rho \( j \) \,, 0 \, & r eq.not rho \( j \) .) $ <eq:hypergraph-intersections>]

]
] <lem:hypergraph-direction-spaces>

#proof[
  Let $Q' \/ Q$ be an extension of degree $b$, and identify the $Q$-space $cal(A)$ with $\( Q' \)^10$.
    For distinct $xi in Q'$, the vectors $\( 1 \, xi \, dots.h \, xi^9 \)$ have the property that any at most ten
    are linearly independent over $Q'$: the first $k$ coordinates of $k$ such vectors form an invertible
    Vandermonde matrix. There are enough parameters because $D + D \/ q < q^(s + 2) lt.eq q^b$.
    Give each $W_r$ and $E_j$ its own parameter, and choose it, of the prescribed $Q$-dimension,
    inside the corresponding one-dimensional $Q'$-space. These choices have the required directness.
  To verify the intersections, any equality involving $U_j$ and $U_(j')$ first has zero $E_j$- and
    $E_(j')$-components. Its remaining components belong either to independent $W$-spaces or to distinct
    directions in one $W$-space. In both cases they vanish. The other assertions follow the same way;
    within $W_(rho \( j \))$ the directions $d_j$ and $e_(rho \( j \))$ are distinct. ◻
]

Fix these spaces for the rest of the construction. The eventual preliminary partition indexed by $j$ will use
  varying directions in $U_j$, with $o + d_j$ its line through a hole $o$;
  the spaces $E_j$ provide the other directions. If these $q$ axes are present for a bundle $r$, then inside $o +
  W_r$ they can be replaced by the $q - 1$ lines parallel to $e_r$ other than $o + e_r$.
  Each point off $o + e_r$ loses and gains one incidence, the hole loses $q$, and the remaining points of $o +
  e_r$ are unaffected. Figure 2 illustrates this local count.
  The hole restrictions and slab construction below will supply these axes and make all the trades simultaneously
  possible.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-5.04, -1.485), (-0.99, 1.485), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((-3.015, 1.845), [#text(size: 9pt)[Remove a fan of $q$ lines]])
  line((-3.015, -1.305), (-3.015, 1.305), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-4.725, -0.99), (-1.305, 0.99), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((-4.725, -0.36), (-1.305, 0.36), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((-4.725, 0.36), (-1.305, -0.36), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((-4.725, 0.99), (-1.305, -0.99), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.015, 0), radius: 0.08819, fill: rgb("#bf0000"), stroke: none)
  content((-3.06, 0.072), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$o$]]])], anchor: "south-east")
  content((-3.015, 0.882), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$o+e_r$]]])], anchor: "south-west")
  content((-3.015, -1.845), [#text(size: 9pt)[All directions in $W_r$ except $e_r$]])
  line((-0.585, 0), (0.585, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  rect((0.99, -1.485), (5.04, 1.485), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((3.015, 1.845), [#text(size: 9pt)[Insert $q-1$ parallel lines]])
  line((3.015, -1.305), (3.015, 1.305), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.53, -1.26), (1.53, 1.26), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.295, -1.26), (2.295, 1.26), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.23, -1.26), (4.23, 1.26), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.015, 0), radius: 0.08819, fill: rgb("#bf0000"), stroke: none)
  content((2.97, 0.072), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$o$]]])], anchor: "south-east")
  content((3.015, 0.882), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$o+e_r$]]])], anchor: "south-west")
  content((3.015, -1.845), [#text(size: 9pt)[Direction $e_r$; omit the line through $o$]])
})],
  caption: [Figure 2: Schematic of the trade inside $o + W_r$. Every point off $o + e_r$ loses and gains one incidence; $o$ loses $q$ incidences, and other points of $o + e_r$ are unaffected. The strokes illustrate line families, not a real-plane realization of finite-field incidences. ],
) <fig:hypergraph-trade>

=== 5.2 Choosing compatible holes <choosing-compatible-holes>

The replacement lines are parallel within a bundle, but lines from two bundles could form a rectangle.
  We prevent this while choosing the holes. An #emph[exceptional rectangle] has corners $x \, x + u \, x + u +
  v \, x + v$, where $0 eq.not u in e_r$, $0 eq.not v in e_(r')$, and $r eq.not r'$.
  For each of its four side lines, a #emph[witness] is a point off that line but in the translate of $W_r$ or
  $W_(r')$ containing it, according to the side’s direction.
  If that side is produced by a trade, its hole is such a witness.

#thm([Lemma 5.3.])[
  #emph[For all sufficiently large $h$, there is $O subset S$ satisfying Equation (5.4) and the following properties.]
  + #emph[Every translate of every $W_r$ contains at most one point of $O$.]
  + #emph[For every $j$, every coset $C$ of $U_j$, and every $r$, $\| O ∩ \( C + W_r \) \| lt.eq 100$.]
  + #emph[No exceptional rectangle has four distinct witnesses in $O$, one for each of its four side lines.]
] <lem:hypergraph-holes>

#proof[
  Write $M = N_(upright("pt")) \/ D^2$. Since $d_0 < q$, counting nonnegative index tuples gives $\| S \| =
    binom(d_0 + n, n)$. For large $h$, $d_0 gt.eq q \/ 3$, so
  $ \| S \| gt.eq frac(q^n, 3^n n !) gt.eq c_S N_(upright("pt")) $
  with a constant $c_S > 0$ independent of $h$, because $n$ is bounded.
    Choose each point of $S$ independently with probability $theta = 5 M \/ \| S \|$.
    For large $h$ this is at most $1$, and $theta = O \( D^(- 2) \)$.
    If $X$ is the chosen set, then $bb(E) \| X \| = 5 M$ and $"Var" \( \| X \| \) lt.eq 5 M$.
    Also $M > q^(n - 2 s - 2) = q^(8 s + 198) arrow.r oo$. Chebyshev’s inequality therefore gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ Pr \( 4 M lt.eq \| X \| lt.eq 6 M \) = 1 - o \( 1 \) . $ <eq:hypergraph-initial-holes>]
  There are at most $D^2 N_(upright("pt"))$ triples $\( j \, r \, C \)$, and every $C +
    W_r$ has at most $q^(b + 2)$ points. Repeated affine spaces in this count only cause overcounting.
    A union bound over choices of $100$ selected points bounds the probability that any such space contains more
    than $100$ points of $X$ by
  $ D^2 N_(upright("pt")) \( theta q^(b + 2) \)^100 = O (q^(2 s + 2 + n + 100 \( b + 2 - 2 s \))) =
    O (q^(2402 - 88 s)) = o \( 1 \) . $
  Mark every selected point belonging to a pair of distinct selected points in one translate of some $W_r$.
    Also mark every selected point belonging to a tuple of four distinct selected witnesses for an exceptional
    rectangle. The expected number of collision pairs is at most $N_(upright("pt")) \( D \/ q \) q^2 theta^2$.
    There are at most $N_(upright("pt")) \( D \/ q \)^2 \( q - 1 \)^2 lt.eq
    N_(upright("pt")) D^2$ choices of rectangle data, and at most $q^8$ witness tuples per rectangle.
    Each distinct tuple is selected with probability at most $theta^4$;
    tuples containing a point outside $S$ have probability zero. Thus the number $Z$ of marked points satisfies
  $ frac(bb(E) Z, M) lt.eq
    frac(2 N_(upright("pt")) \( D \/ q \) q^2 theta^2 + 4 N_(upright("pt")) D^2 q^8 theta^4, M) =
    O (q / D + q^8 / D^4) = o \( 1 \) . $
  Markov’s inequality gives $Z lt.eq M$ with probability $1 - o \( 1 \)$.
    Choose an outcome satisfying this bound, Equation (5.6), and the occupancy bound,
    and delete all marked points. The remaining set $O$ has $3 M lt.eq \| O \| lt.eq 6 M$,
    hence the required bounds. Deletion preserves the occupancy bound and eliminates every obstruction in (i) and
    (iii). ◻
]

Fix such an $O$. Put

$ T_r = union.big_(o in O) \( o + W_r \) . $

The #emph[replacement lines of label $R_r$] are all the lines of direction $e_r$ in each $o + W_r$, except $o +
  e_r$ itself.

#thm([Lemma 5.4.])[
  #emph[The replacement lines avoid $O$ and are pairwise disjoint within each label $R_r$.
    No exceptional rectangle has all four side lines among these replacement lines.]
] <lem:hypergraph-replacement-lines>

#proof[
  Property (i) of Lemma 10 says that different holes lie in disjoint translates of a fixed $W_r$.
    Within one such plane the replacement lines are parallel and omit its unique hole. This proves the first assertions.
  If a rectangle used four replacement lines, each side would have its corresponding hole as a witness.
    These four witnesses must be distinct. Opposite sides of direction $e_r$ lie in $W_r$-cosets separated by a
    nonzero vector in $e_(r')$, which lies outside $W_r$. Their planes are therefore disjoint.
    The planes of two adjacent sides intersect exactly at their shared corner, because $W_r ∩ W_(r') = 0$.
    This corner is on both side lines, so neither off-line witness can equal it.
    The resulting four distinct witnesses contradict property (iii) of Lemma 10. ◻
]

=== 5.3 Random slabs and short polygons <random-slabs-and-short-polygons>

The holes and the replacement lines are now fixed. It remains to partition the rest of the space into lines
  without introducing short polygons. We first choose the slabs in which those lines will lie,
  excluding a finite list of events that would allow such polygons;
  the line partitions themselves are constructed only afterward.

Independently for each index $j$ and each coset $C$ of $U_j$,
  choose a uniformly random two-dimensional subspace $P_(j \, C) subset E_j$.
  The translates of $d_j xor P_(j \, C)$ partition $C$ into three-dimensional affine #emph[slabs].
  For $u in U_j$, write $u^(\( E_j \))$ for its $E_j$-component.
  A fixed nonzero vector of $E_j$ belongs to $P_(j \, C)$ with probability

#[#set math.equation(numbering: n => "(5.7)")
 $ p_(*) = frac(q^2 - 1, q^(b - 1) - 1) lt.eq 2 q^(3 - b) . $ <eq:hypergraph-inclusion-probability>]

Indeed, linear automorphisms of $E_j$ act transitively on its nonzero vectors,
  and every two-dimensional subspace contains $q^2 - 1$ of them.

We define a finite list of bad events before selecting any lines inside the slabs.
  First, for each pair of holes in a coset $C$ of $U_j$, declare it bad if they occupy the same slab.
  Their difference has nonzero $E_j$-component: otherwise it would lie in $d_j subset W_(rho \( j \))$,
  contrary to Lemma 10(i). This event is exactly the inclusion of that component in $P_(j \, C)$ and has
  probability $p_(*)$.

The other events concern closed labelled sequences of $k$ nonzero steps, $k in { 3 \, 4 \, 5 }$, in $cal(A)$.
  The allowed step types are

$ G_j & : quad u in U_j \, quad u^(\( E_j \)) eq.not 0 \;\
R_r & : quad u in e_r \\ { 0 } \, quad upright("both endpoints belong to ") T_r . $

We call $G_j$ steps #emph[generic] and $R_r$ steps #emph[replacement] steps;
  a replacement step vector will also be called exceptional. An $R_r$ step need not lie on a replacement line:
  its endpoint condition only requires membership in $T_r$, which every actual replacement line satisfies.
  This deliberately enlarges the list of possible polygons.
  Require at least one $G$ step and distinct labels at cyclically adjacent steps.
  Repeated vertices are allowed, so this list can only be larger than the list of simple polygons that will matter
  for girth. For each such sequence, declare it bad if every $G_j$ step has $u^(\( E_j \)) in P_(j \, C)$,
  where $C$ is the $U_j$-coset containing that step. All point, label, and step choices are finite,
  so the complete event list is finite.

The three hole conditions now have separate roles. Condition (i) separates the replacement planes within each
  bundle and makes each hole-pair event test a nonzero $E_j$-component.
  Condition (ii) controls the hole contributions to the event counts for a fixed $P_(j \, C)$.
  Condition (iii) has already excluded rectangles formed entirely from replacement lines.

#thm([Lemma 5.5.])[
  #emph[Every candidate sequence with a generic step has one of the following forms.]
  + #emph[A rectangle alternating $G_j \, R_r$, with opposite vectors paired.]
  + #emph[A rectangle alternating distinct $G_j \, G_(j')$, with opposite vectors paired.]
  + #emph[A pentagon containing two $G_j$ steps, two $G_(j')$ steps, and one $R_r$ step, where $rho \( j \) =
    rho \( j' \) = r$.]
  #emph[If $g$ is the number of distinct generic labels, its bad event uses $2
    g$ distinct random variables and has probability $p_(*)^(2 g)$.
    In case (iii), the exceptional vector and one vector of each generic label determine the other two vectors,
    once their order is fixed.]
] <lem:hypergraph-polygons>

#proof[
  Before classifying the sequence, observe that each step involves at most two members of the list of $W$- and
    $E$-spaces. Thus at most $2 k lt.eq 10$ distinct spaces occur, and their directness is available from Lemma 9.
    Closure forces the sum of the $E_j$-components to be zero for each generic label.
    Each such label therefore occurs at least twice. Cyclic non-adjacency in a sequence of at most five steps
    allows any label at most twice. Consequently $g$ is $1$ or $2$, and each generic label occurs exactly twice.
  If $g = 1$, the direction $d_j$ and the distinct occurring directions $e_r$ are linearly independent.
    In its own bundle this uses just the two distinct directions $d_j \, e_(rho \( j \))$;
    other bundles contribute independent $W$-spaces. Every exceptional label must therefore occur twice as well.
    Only case (i) is possible, and closure gives the claimed opposite vectors.
  If $g = 2$ and $k = 4$, the labels must alternate, and $U_j ∩ U_(j') = 0$ forces the opposite vectors to pair.
    If $k = 5$, there is one exceptional step, of label $R_r$.
    Its nonzero $e_r$-component must be canceled by the $W$-components of the generic steps.
    Neither zero contribution nor a contribution from just one of the directions $d_j \, d_(j')$ can cancel it,
    since each such direction differs from $e_r$. Thus both generic labels belong to bundle $r$,
    giving case (iii). After choosing the exceptional vector and one vector of each generic label,
    closure prescribes the sum of the remaining vector in $U_j$ and the remaining vector in $U_(j')$.
    Their direct sum makes these vectors unique.
  Finally, between the two occurrences of a generic label $G_j$ there is, in one cyclic direction,
    exactly one intervening step. That step has a different label and a nonzero vector outside $U_j$,
    by Equation (5.5). The two occurrences therefore belong to different $U_j$-cosets:
    if the first starts at $x$ with vector $u in U_j$ and the intervening vector is $v in.not U_j$,
    the second starts at $x + u + v in.not x + U_j$. Variables from different generic labels are also distinct.
    All $2 g$ variables are consequently independent, and Equation (5.7) gives the asserted event probability. ◻
]

=== 5.4 Avoiding the slab events <avoiding-the-slab-events>

The classification controls the probability of each polygon event.
  To avoid all events simultaneously, we must also control how many of them use any one slab variable.
  We bound the sum of their probabilities at a fixed $P_(j \, C)$;
  the local lemma will apply once this bound is at most $1 \/ 16$.

#thm([Lemma 5.6.])[
  #emph[Let $mu$ be the largest, over all variables $P_(j \, C)$,
    of the sum of probabilities of bad events using that variable.
    Then $mu = O \( q^(- 7) \)$, uniformly in the variable, and every event uses at most four variables.]
] <lem:hypergraph-event-bounds>

#proof[
  The assertion about four variables follows from Lemma 12, with one variable for a hole-pair event.
    Fix $P_(j \, C)$. There are at most $100$ holes in $C$, since $C subset C + W_r$ for any $r$.
    Hole pairs therefore contribute at most $100^2 p_(*)$.
  For a polygon using this variable, cyclically rotate so that one of its $G_j$ steps starts the sequence.
    Rotations and orders of at most five labels introduce only an absolute constant factor in all the following
    counts. For a generic rectangle choose the other label ($lt.eq D$ choices),
    the sequence’s initial point in $C$ ($q^b$ choices), and one vector of each label ($lt.eq q^(2 b)$ choices).
    Closure determines the other two vectors. The contribution is therefore $O \( D q^(3 b) p_(*)^4 \)$.
  For a mixed rectangle $G_j \, R_r$, both endpoints of the initial generic step belong to $C ∩ T_r$.
    A hole $o$ can contribute to this intersection only if $o in C + W_r$, so there are at most $100$ such holes.
    Each intersection $C ∩ \( o + W_r \)$, when nonempty, is a coset of $U_j ∩ W_r$.
    It has $q$ points if $r = rho \( j \)$ and one point otherwise.
    Thus $C ∩ T_r$ has at most $100 q$ points in the first case and at most $100$ in the second.
    Choose the two endpoints, and then choose the exceptional vector in $e_r$ in at most $q$ ways.
    Summing over the $D \/ q$ bundles gives at most
  $ O (100^2 (q^3 + D / q thin q)) = O #scale(x: 120%, y: 120%)[\(] 100^2 \( q^3 + D \) #scale(x: 120%, y: 120%)[\)] $
  mixed rectangles, and hence a contribution $O \( 100^2 \( q^3 + D \) p_(*)^2 \)$.
    This is an upper bound even when some selected endpoints or vectors fail the candidate conditions.
  For a pentagon the other generic label is in bundle $rho \( j \)$, giving at most $q$ choices.
    Choose the sequence’s initial point in $C$, one vector of each generic label, and the exceptional vector.
    There are at most $q^(b + 2 b + 1)$ choices after the label is chosen.
    Lemma 12 determines the remaining vectors, so the contribution is $O \( q^(3 b + 2) p_(*)^4 \)$.
  In total,
  $ mu & lt.eq 100^2 p_(*) + O (D q^(3 b) p_(*)^4 + \( D + q^3 \) p_(*)^2 + q^(3 b + 2) p_(*)^4)\
 & = O (q^(- s - 17) + q^(- 7) + q^(- s - 33) + q^(- 2 s - 31) + q^(- s - 6)) = O \( q^(- 7) \) \, $
  using $b = s + 20$, Equation (5.2), and Equation (5.7). The constants in these event counts are absolute;
    in particular the bound is uniform. ◻
]

The following is a special case of the asymmetric Lovász local lemma;
  we include the classical conditional-probability proof. For the origins see Erdős and
  Lovász #cite(label("ErdosLovasz1975")); for the product-form condition used below see
  #cite(label("MoserTardos2009")) Theorem 1.1. No resampling algorithm is needed.

#thm([Lemma 5.7.])[
  #emph[Let a finite collection of events be determined by independent random variables,
    with each event assigned a nonempty set of at most four variables that determine it.
    If the sum of event probabilities at every variable is at most $1 \/ 16$,
    there is positive probability that no event occurs.]
] <lem:hypergraph-local-lemma>

#proof[
  Connect two events when their assigned sets share a variable.
    An event is independent of all its non-neighbors jointly. Set $x_A = 2 Pr \( A \)$.
    Since each event has a nonempty assigned set, $0 lt.eq x_A lt.eq 1 \/ 8 < 1$, and for every event
  $ sum_(B upright(" neighbor of ") A) x_B lt.eq 2 dot.op 4 dot.op 1 / 16 = 1 / 2 . $
  It follows that
  #[#set math.equation(numbering: n => "(5.8)")
   $ Pr \( A \) lt.eq x_A product_(B upright(" neighbor of ") A) \( 1 - x_B \) \,
     $ <eq:hypergraph-local-lemma-condition>]
  because the product is at least $1 - sum_B x_B gt.eq 1 \/ 2$.
  We prove inductively that
  $ Pr (A thin mid(bar.v) thin ⋂_(B in cal(S)) B^c) lt.eq x_A $
  whenever $cal(S)$ is a sublist excluding $A$, and that all conditioning events in this assertion have positive
    probability. The empty sublist follows from Equation (5.8).
    At each induction step, positivity for a sublist follows by exposing its events in order and using the smaller
    conditional bounds and $x_B < 1$. For the bound, split $cal(S)$ into neighbors and non-neighbors of $A$.
    Let $B_0$ be avoidance of the non-neighbors and $D_0$ avoidance of the neighbors.
    Independence gives $Pr \( A divides B_0 \) = Pr \( A \)$, and
  $ Pr \( A divides B_0 ∩ D_0 \) lt.eq frac(Pr \( A \), Pr \( D_0 divides B_0 \)) lt.eq
    frac(Pr \( A \), product_(B in cal(S) \, med B upright(" neighbor of ") A) \( 1 - x_B \)) lt.eq x_A . $
  The middle bound uses the smaller conditional bounds successively; the last uses Equation (5.8).
    The same successive conditioning for the full finite event list gives positive probability of avoiding all events. ◻
]

By Lemmas 13 and 14, for all sufficiently large $h$ we can fix the spaces $P_(j \, C)$ so that every slab contains
  at most one hole and none of the candidate polygon events occurs.

=== 5.5 Line partitions, the local trade, and girth <line-partitions-the-local-trade-and-girth>

The slab choices have excluded every candidate short polygon with a generic step,
  but no line partition has yet been specified. We now partition each slab,
  perform the trades that remove the holes, and check that every possible short incidence cycle is one of the
  excluded polygons.

#thm([Lemma 5.8.])[
  #emph[Let a three-dimensional affine space have direction $P xor d$, where $dim_Q P = 2$ and $dim_Q d = 1$.
    If it has no designated point, it has a line partition whose directions project nontrivially to $P$.
    If it has a designated point $o$, it has a line partition containing $o + d$,
    with every other line’s direction projecting nontrivially to $P$.]
] <lem:hypergraph-slab-partition>

#proof[
  In the first case use parallel lines of any fixed nonzero direction in $P$.
    In the second choose $0 eq.not delta in d$ and a $Q$-linear operator $J$ on $P$ with no eigenvector over $Q$.
    Identify $P$ with the $Q$-space of a quadratic field extension of $Q$,
    and let $J$ be multiplication by an element $eta$ outside $Q$.
    An equation $eta x = lambda x$ with $x eq.not 0$ and $lambda in Q$ would imply $eta = lambda$,
    so this operator has the required property. Besides $o + d$, use the lines
  #[#set math.equation(numbering: n => "(5.9)")
   $ {o + x + gamma \( J x \) delta : x in P \, med gamma \( x \) = 1} \, wide
     0 eq.not gamma in "Hom"_Q \( P \, Q \) . $ <eq:hypergraph-slab-lines>]
  The set $gamma \( x \) = 1$ is an affine line in $P$. Its displayed lift is injective,
    with direction projecting onto the nonzero line $ker gamma$,
    so it is an affine line with the required direction. For each $x eq.not 0$, the vectors $x \,
    J x$ form a basis of $P$. For every $c in Q$ there is consequently exactly one functional with
    $gamma \( x \) = 1$ and $gamma \( J x \) = c$, and it is nonzero.
    Thus the $q^2 - 1$ lines in Equation (5.9) partition the $q^3 - q$ points off $o + d$.
    The axis $o + d$ supplies the remaining $q$ points. ◻
]

For each $j$, apply Lemma 15 separately in every slab of every coset of $U_j$,
  using its unique hole as the designated point when present.
  This gives a preliminary line partition of all of $cal(A)$ for each $j$.
  The line through a hole $o$ in partition $j$ is $o + d_j$.
  These hole axes are the only lines whose directions have zero $E_j$-component.
  Every other line has a nonzero $E_j$-component in its direction, lying in the corresponding $P_(j \, C)$.

#thm([Lemma 5.9.])[
  #emph[For every hole $o$ and bundle $r$, remove the $q$ lines $o + d_j$ with $rho \( j \) = r$,
    and insert the $q - 1$ replacement lines of label $R_r$ in $o + W_r$.
    After all these operations, the resulting set $cal(F)$ consists of lines in $V$,
    and every point of $V$ has degree $D$. The surviving lines of each preliminary partition are pairwise
    disjoint, as are the replacement lines within each label. There are no duplicate lines across different labels.]
] <lem:hypergraph-trade>

#proof[
  Within $o + W_r$, the removed fan uses every direction except $e_r$.
    Each point off $o + e_r$ lies on exactly one removed line and exactly one inserted line.
    The hole $o$ loses $q$ incidences and gains none; other points of $o + e_r$ lose and gain none.
    Thus every non-hole point has zero net change in degree in each trade.
  No removal is requested twice. Two holes using the same line of one preliminary partition would be in the same
    slab, which was excluded. Lines from distinct preliminary partitions have directions in distinct $U_j$’s with
    zero intersection, so cannot coincide. Inserted lines of a given label are distinct by Lemma 11.
    Lines of different labels cannot coincide either: their direction spaces are distinct $U_j$’s or $e_r$’s with
    pairwise zero intersections, by Lemma 9. Hence the pointwise degree changes genuinely add when all trades are
    performed, even if planes from different bundles overlap.
    Initially every point has one incidence in each of the $D$ partitions.
    Each hole loses all $D$ of its incidences, and every non-hole retains degree $D$.
    All inserted lines avoid the holes, and all preliminary lines through a hole were removed.
    Finally, disjointness within a surviving preliminary label is inherited from its partition,
    and disjointness within a replacement label was proved in Lemma 11. ◻
]

The pointwise incidence changes are summarized in Figure 2.

#proof[
  Use the holes from Lemma 10, the successful slab choices, and the line family from Lemma 16.
    The size and degree assertions have been proved. Label surviving preliminary lines from partition $j$ by
    $G_j$, and replacement lines by their labels $R_r$.
  Two distinct affine lines have at most one common point, so a cycle of length less than $12$ in the incidence
    graph would give a polygon of $k = 3 \, 4$, or $5$ nonzero steps along its successive lines.
    Consecutive labels, including the last and first, are different because lines of one label are disjoint.
    If there is a generic step, this polygon is one of the candidate sequences used above.
    Each generic step’s $E_j$-component lies in its slab direction $P_(j \, C)$,
    so the corresponding bad event would occur, a contradiction.
  If all steps have replacement labels, the distinct occurring $e_r$ directions are independent:
    at most five $W_r$’s occur. Closure forces every label to occur at least twice,
    while cyclic non-adjacency allows at most twice. The only possibility is a four-step alternating rectangle,
    with opposite vectors paired. This is forbidden by Lemma 11. Thus the incidence girth is at least $12$. ◻
]

This supplies the full-line system, exact degree, and girth required by Proposition 4.
  That proposition uses the same holes to produce the two matrix pairings and the size inequalities for Theorem 6.
  Section 6 now makes the choices by finite enumeration.

== 6 A terminating prescription for the witnesses <sec:prescription>

We now fix every choice in the preceding construction. The purpose of the prescription is to define one field,
  one group, and two finite sums without relying on an unspecified successful random choice.

=== 6.1 Finite search for the incidence data <finite-search-for-the-incidence-data>

Order binary coefficient vectors lexicographically, with $0 < 1$;
  for a polynomial of fixed degree use the list of coefficients in increasing degree order.
  For each integer $h gt.eq 2$, perform the following finite computations.

+ Put $q = 2^h$, and let $ell$ be the least prime congruent to $- 1$ modulo $q^100$.
  Test successive integers in that class for primality. Linnik’s theorem guarantees that this search terminates.
  Define $D = ell + 1$, $s = floor.l log_q D floor.r$, $b = s + 20$, and $n = 10 b$ as in Section 5.
+ Let $g$ be the lexicographically first monic irreducible polynomial over $bb(F)_2$ of degree $h \( ell - 1 \)$,
  and put
  #[#set math.equation(numbering: n => "(6.1)")
   $ K = bb(F)_2 \[ Z \] \/ \( g \( Z \) \) . $ <eq:exact-field>]
  Order $K$ by the coefficient vectors of its unique representatives of degree less than $h \( ell - 1 \)$,
    padded by zeros. Irreducible polynomials of this degree exist, and irreducibility is a finite test.
+ Take the subfield
  $ Q = { x in K : x^q = x } \, $
  with its induced order. It has $q$ elements since $h$ divides $h \( ell - 1 \)$.
    Let $zeta$ be the first element of $K$ of multiplicative order $ell$. Such an element exists:
    Fermat’s little theorem gives $ell divides 2^(ell - 1) - 1$, so $ell$ divides $\| K^times \| =
    2^(h \( ell - 1 \)) - 1$, and $K^times$ is cyclic.
+ Form $cal(A) = Q^n$ in lexicographic order and the index simplex $S$ of Section 2.
  Order subsets of a finite ordered set by their indicator vectors, with $0 < 1$.
  In particular this orders affine lines as subsets of $cal(A)$,
  families of lines as subsets of the ordered line set, and pairs $\( O \, cal(F) \)$ lexicographically.
  Test every pair with $O subset S$ and $cal(F)$ a family of full affine $Q$-lines for the following conditions:
  + $2 q^n \/ D^2 lt.eq \| O \| lt.eq 7 q^n \/ D^2$;
  + every line of $cal(F)$ is contained in $cal(A) \\ O$;
  + every point of $cal(A) \\ O$ lies on exactly $D$ lines of $cal(F)$;
  + the incidence graph has no cycle of length less than $12$.

Start with $h = 2$. For a fixed $h$, step (4) tests only finite sets and a finite graph.
  Stop at the first successful pair; if every pair fails, increase $h$ by one and repeat.
  This selects the least successful $h$ and then the first successful pair in its prescribed order.
  Theorem 8 guarantees success for every sufficiently large $h$, uniformly in the enumeration of $Q$,
  so the outer search terminates. The search enumerates the required incidence data directly,
  not the auxiliary random choices used to prove their existence.
  The auxiliary extension field in that proof is only a model for a $Q$-vector space;
  it is not required to embed in $K$.

Fix these data and write $m = \| O \|$, $t = \| V \|$, where $V = cal(A) \\ O$.
  The indicator polynomials $f_o$ and vectors $x_v$ are the unique ones from Proposition 4;
  their coefficients may be computed by finite-field linear algebra.
  We use the induced orders on $O$, $V$, and $cal(F)$.

=== 6.2 Local groups, the presentation, and the two sums <local-groups-the-presentation-and-the-two-sums>

At each point $v$, use the standard coordinate copy $K_v^0 = \( bb(F)_ell^2 \, + \)$,
  and for each line $f$ use $L_f^0 = \( bb(F)_ell \, + \)$.
  Order $bb(F)_ell$ by the residues $0 \, dots.h \, ell - 1$ and $bb(F)_ell^2$ lexicographically.
  Order its one-dimensional subspaces as subsets. Match them in order to the $D = ell + 1$ incident lines at $v$,
  and define $iota_(v f)$ by sending $1 in L_f^0$ to the first nonzero vector of the assigned direction.
  These maps specify the group $N$ in Lemma 7 without any further choices.

Choose $v_(*)$ to be the first point of $V$. The isomorphism $phi.alt_v : K_v arrow.r
  K_(v_(*))$ preserves the standard coordinates transported from the embedded copies.
  Order linear forms on $bb(F)_ell^2$ by their coefficient pairs.
  Assign the points of $V$, in order, to the first $t$ pairs

$ \( s \, alpha \) \, wide 1 lt.eq s lt.eq m \, quad alpha in \( bb(F)_ell^2 \)^(*) \, $

in lexicographic order. Proposition 4 gives $t lt.eq m ell^2$, so there are enough pairs.
  This fixes every slot and every character in the construction of Theorem 6.

For the finite presentation of $N$, use the local zero-sum relators of length at most three,
  as justified in Section 3. Section 4 then defines $H = N times chevron.l z chevron.r$,
  the conjugation extension $L$, the finite group $F = \( bb(Z) \/ ell \)^m times.r S_m$, and finally $G = L times
  F$; Section 4.6 gives the resulting finite presentation. The regular-permutation action used to prove that $H$
  embeds in $L$ is an embedding certificate; a choice of such permutations is not part of the definition of the group.

With this group fixed, the formulas in Section 4 give $e \, P \, U \, T \, C \, J_0$,
  the two square matrices $a_(upright("mat")) \, b_(upright("mat"))$, and the matrix units $p_(i j)$.
  The two required finite expressions are

#[#set math.equation(numbering: n => "(6.2)")
 $ a_(upright("out")) & = 1 - sum_(i = 1)^m p_(i i) + sum_(i \, j = 1)^m \( a_(upright("mat")) \)_(i j) p_(i j) \,\
b_(upright("out")) & = 1 - sum_(i = 1)^m p_(i i) + sum_(i \, j = 1)^m \( b_(upright("mat")) \)_(i j) p_(i j) .
  $ <eq:exact-outputs>]

Coefficients from $K \[ L \]$ and matrix units from $K \[ F \]$ are viewed in the two factors of $K \[ G \]$.
  The displayed expressions, together with the preceding formulas,
  involve only finitely many group words and field coefficients.
  They define finite sums whether or not distinct displayed words represent the same group element;
  no word-equality oracle is used to normalize them.

#proof[
  The finite search terminates by Theorem 8. Its output satisfies Proposition 4,
    and hence every hypothesis of Theorem 6. That theorem proves the two product assertions for (6.2),
    supplies a finite presentation of this group $G$, and retains an embedded element of order $ell$.
    In particular the nonvanishing of the reverse-product defect follows by specializing the right-hand side of
    Equation (4.14), which lies in $"Mat"_t \( K \[ H \] \)$, to a nonzero matrix over $K$;
    it does not depend on an unproved inequality between group words.
    The prime $ell$ is odd, and the field in (6.1) is finite of characteristic two. ◻
]

=== 6.3 Scope of the construction <scope-of-the-construction>

The construction uses torsion explicitly. The embedded subgroups of orders $ell$, $ell^2$,
  and $ell^3$ have odd order, so every denominator in their averages is invertible in $K$.
  In the finite auxiliary group we invert only $\| \( bb(Z) \/ ell \)^m \|$, never $\| S_m \|$.
  Characteristic two makes the regular degree $ell + 1$ vanish as a scalar,
  allowing the simultaneous line and total pairing identities of Proposition 4.
  No assertion about group algebras of torsion-free groups is needed.

For comparison, if $G_0$ is finite, then $K_0 \[ G_0 \]$ is finite dimensional over every field $K_0$,
  even when the characteristic divides $\| G_0 \|$. Left multiplication is a faithful representation of this
  algebra. In finite dimension, $L_a L_b = I$ implies $L_b L_a = I$, and hence $a b = 1$ implies $b a = 1$.
  Thus the group in Theorem 1 is necessarily infinite.

Finally, for any group and any two finite group-algebra sums,
  the union of their supports generates a finitely generated subgroup.
  Its group algebra embeds in the original one, so both product assertions already hold or fail in that subgroup
  algebra. Finite generation is therefore automatic for a direct-finiteness counterexample after passing to the
  support subgroup. The stronger finite-presentation conclusion for the particular group $G$ here comes from the
  presentation argument in Section 4.6; it does not follow merely from finite generation of the support subgroup.

== 7 An injective nonsurjective cellular automaton <sec:cellular>

The scalar elements constructed in Section 6 now give a cellular automaton over the finite alphabet $K$.
  We prove the standard transfer explicitly, in the right-neighbor convention used in the introduction;
  compare #cite(label("ElekSzabo2004")) Section 1. The proof applies to all configurations,
  not just finitely supported ones, and identifies the image by finite local equations.

=== 7.1 The group algebra acting on all configurations <the-group-algebra-acting-on-all-configurations>

For this subsection, let $K$ be any field and $G$ any group, with identity $1_G$.
  For $c = sum_(u in G) c_u u in K \[ G \]$, put $"supp" \( c \) = { u in G : c_u eq.not 0 }$.
  Multiplication in $K \[ G \]$ is

$ \( c d \)_w = sum_(u v = w) c_u d_v . $

Every sum has only finitely many nonzero terms. Define a $K$-linear map $T_c : K^G arrow.r K^G$ by

#[#set math.equation(numbering: n => "(7.1)")
 $ \( T_c x \) \( g \) = sum_(u in G) c_u x \( g u \) . $ <eq:ca-operator>]

This sum is finite even when $x$ has infinite support. If $K$ is finite,
  it is a cellular automaton with memory $"supp" \( c \)$.

#thm([Lemma 7.1.])[
  #emph[For every field $K$ and group $G$, the assignment $c mapsto
    T_c$ is a faithful unital $K$-algebra homomorphism from $K \[ G \]$ to the algebra of $K$-linear endomorphisms
    of $K^G$, with composition as multiplication. In particular,
#[#set math.equation(numbering: n => "(7.2)")
 $ T_c compose T_d = T_(c d) \, wide T_1 = upright("id")_(K^G) . $ <eq:ca-composition>]

]
] <lem:ca-representation>

#proof[
  Linearity in $c$ and the identity $T_1 = upright("id")_(K^G)$ follow directly from Equation (7.1).
    For $x in K^G$ and $g in G$,
  $ \( T_c \( T_d x \) \) \( g \) & = sum_(u in G) c_u sum_(v in G) d_v x \( g u v \)\
 & = sum_(w in G) (sum_(u v = w) c_u d_v) x \( g w \) = \( T_(c d) x \) \( g \) . $
  All sums being regrouped are finite. In particular, the product is $c d$, not $d c$,
    for this right-neighbor convention.
  For $h in G$, let $delta_h in K^G$ take value $1_K$ at $h$ and zero elsewhere. Then
  #[#set math.equation(numbering: n => "(7.3)")
   $ \( T_c delta_h \) \( 1_G \) = c_h . $ <eq:ca-coefficient>]
  Thus $T_c = 0$ implies that every coefficient $c_h$ is zero, proving faithfulness. ◻
]

=== 7.2 The local rule and its image <the-local-rule-and-its-image>

#thm([Proposition 7.2.])[
  #emph[Let $K$ be a finite field, $G$ a group, and $a \, b in K \[ G \]$ satisfy $a b = 1$.
    Put $M = "supp" \( b \)$ and define
#[#set math.equation(numbering: n => "(7.4)")
 $ phi.alt : K^M arrow.r K \, wide phi.alt \( p \) = sum_(u in M) b_u p \( u \) . $ <eq:ca-rule>]

 The cellular automaton $tau = T_b$ is injective, and
#[#set math.equation(numbering: n => "(7.5)")
 $ "im" \( tau \) = { y in K^G : T_(b a) y = y } . $ <eq:ca-image>]

 If $b a eq.not 1$, every $h in G$ with $\( b a - 1 \)_h eq.not 0$ gives a configuration $delta_h in.not
   "im" \( tau \)$; hence $tau$ is not surjective.]
] <prop:ca-transfer>

#proof[
  The support of $b$ is finite, so Equation (7.4) is a single finite-memory local rule, used at every $g in G$.
    The alphabet $K$ is finite and nonempty. Lemma 17 gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ T_a compose tau = T_(a b) = T_1 = upright("id")_(K^G) . $ <eq:ca-leftinverse>]
  Applying $T_a$ to $tau \( x \) = tau \( x' \)$ yields $x = x'$ for arbitrary $x \, x' in K^G$.
  If $y = tau \( x \) = T_b x$, then
  $ T_(b a) y = T_b T_a T_b x = T_b x = y \, $
  by Equation (7.6). Conversely, if $T_(b a) y = y$, then $y = T_b \( T_a y \)$ lies in the image of $tau$.
    This proves Equation (7.5).
  If $\( b a - 1 \)_h eq.not 0$, Equation (7.3) gives
  $ #scale(x: 120%, y: 120%)[\(] T_(b a) delta_h - delta_h #scale(x: 120%, y: 120%)[\)] \( 1_G \) =
    #scale(x: 120%, y: 120%)[\(] T_(b a - 1) delta_h #scale(x: 120%, y: 120%)[\)] \( 1_G \) = \( b a - 1 \)_h
    eq.not 0 . $
  Therefore $delta_h$ is not fixed by $T_(b a)$, and Equation (7.5) excludes it from the image.
    This calculation also covers $h = 1_G$, when $delta_h \( 1_G \) = 1_K$ rather than zero. ◻
]

Equation (7.5) describes the image by the uniform finite local equations

$ sum_(u in "supp" \( b a - 1 \)) \( b a - 1 \)_u thin y \( g u \) = 0 wide \( g in G \) . $

Thus the missing configuration has no preimage even among infinitely supported functions.
  No restriction to finitely supported configurations has entered the argument.

The memory need not be minimal. If a finite expression for $b$ is $b = sum_(j = 1)^r lambda_j u_j$,
  with $lambda_j in K$ and $u_j in G$ and with repetitions allowed, take $M' = { u_j : 1 lt.eq j lt.eq
  r }$ and $phi.alt' \( p \) = sum_(j = 1)^r lambda_j p \( u_j \)$.
  Repeated group elements automatically combine to give the same operator $T_b$.
  Consequently, the finite word expressions of Equation (6.2) specify the local rule without an algorithm deciding
  which displayed words represent the same group element.

#thm([Corollary 7.3.])[
  #emph[For the field $K$, group $G$, and outputs of Theorem 1, the cellular automaton $T_(b_(upright("out"))) :
    K^G arrow.r K^G$ is injective and not surjective. Its image is the fixed set of
    $T_(b_(upright("out")) a_(upright("out")))$. In particular, $G$ is not surjunctive.]
] <cor:nonsurjunctive>

#proof[
  Apply Proposition 18 to $a = a_(upright("out"))$ and $b = b_(upright("out"))$.
    Their product relations are proved in Theorem 1, and the nonzero reverse-product defect has a nonzero
    coefficient in the ordinary group algebra. ◻
]

Characteristic two is used to construct the algebraic witnesses, not in Proposition 18.
  Finiteness of the field supplies the finite alphabet, and the scalar form of the witnesses makes that alphabet
  $K$ itself rather than a vector space over $K$. The existence of a nonzero defect coefficient is certified
  algebraically; no practical execution of the finite search or normalization of group words is asserted.

=== 7.3 Transport to a group of type $F_oo$ <transport-to-a-group-of-type-f_infty>

A group has type $F_oo$ if it admits a classifying CW complex with finitely many cells in every dimension.
  The finite presentation of $G$ allows a further consequence:
  a separate embedding theorem transports the same scalar counterexample to an overgroup of type $F_oo$.

#thm([Corollary 7.4.])[
  #emph[For the finite characteristic-two field $K$ of Theorem 1,
    there are a group $U$ of type $F_oo$ and scalar elements $A \, B in K \[ U \]$ such that $A B =
    1$ and $B A eq.not 1$. The group $U$ is nonsofic and nonsurjunctive.]
] <cor:finfty-counterexample>

#proof[
  The group $G$ in Theorem 1 is finitely presented. The companion embedding
    theorem #cite(label("UniversalFinftyCompanion")) Theorem 1.1 therefore gives an injection $i :
    G arrow.r.hook U$ into a group of type $F_oo$. Extending $i$ linearly over the same field $K$ gives a unital
    algebra injection $i_(*) : K \[ G \] arrow.r.hook K \[ U \]$: distinct group basis elements remain distinct.
    Set $A = i_(*) \( a_(upright("out")) \)$ and $B = i_(*) \( b_(upright("out")) \)$. Then
  $ A B = 1 \, wide B A - 1 = i_(*) \( b_(upright("out")) a_(upright("out")) - 1 \) eq.not 0 . $
  If $U$ were sofic, Elek–Szabó’s theorem #cite(label("ElekSzabo2004")) Corollary 4.7 would make $K \[ U \]$
    stably finite, contradicting these scalar identities. Proposition 18, applied to $U \, K \, A \, B$,
    makes $T_B : K^U arrow.r K^U$ an injective nonsurjective cellular automaton over the finite alphabet $K$,
    with left inverse $T_A$ in the same right-neighbor convention. Hence $U$ is nonsurjunctive. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
