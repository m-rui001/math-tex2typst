#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Exact-orders-and-invariant-anticanonical-linear-systems-September-26-2026]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <V:introduction>

An effective divisor can have normalized order tending to zero while vanishing at the same center in every degree.
  For example, order one becomes negligible after division by an unbounded sequence of integers.
  Producing a section which is actually nonzero at that center is a stronger problem.
  We prove an exact attainment theorem for divisors approaching the anticanonical class of a smooth projective
  variety with a smoothly semipositive anticanonical bundle.
  We then use generic orbit arcs to translate this control of orders into statements about characters and
  invariant sections.

The broader nonvanishing problem asks whether a nef anticanonical bundle on a smooth projective variety has a
  nonzero section in some positive power. Numerical effectivity and effectivity in rational linear equivalence are
  distinct here. Lazić, Matsumura, Peternell, Tsakanikas and Xie prove numerical effectivity for smooth projective
  threefolds with nef anticanonical class and develop nonvanishing methods based on twisted differential forms
  #cite(label("LMPTX2023")) Theorem A and Section 5. Müller proves anti-log-canonical nonvanishing for projective
  klt threefold pairs with nef anti-log-canonical divisor #cite(label("Muller2025")) Corollary B.
  Our positivity hypothesis is smooth semipositivity, and our first result retains both rational linear
  equivalence and the order at a prescribed valuation.

Let $X$ be a smooth connected projective complex variety, of dimension $n > 0$, and put $L = - K_X$.
  Fix a smooth Hermitian metric on $L$ with semipositive curvature form $alpha$,
  normalized to represent $c_1 \( L \)$. Let $nu$ be the maximum complex rank of $alpha$,
  and let $G_0$ be an ample line bundle. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ ell \( D \) = cases(delim: "{", D dot.op L^nu dot.op G_0^(n - nu - 1) \, & nu < n \,, 0 \, & nu = n .)
   $ <V:null-functional>]

This functional is nonnegative on effective divisors. Moreover $ell \( L \) = 0$, since $alpha^(nu + 1) =
  0$ when $nu < n$. A discrete valuation $v$ of $bb(C) \( X \)$ is #emph[centered on $X$] if its valuation ring
  dominates the local ring of a point of $X$. We allow the zero valuation as well.
  The value $v \( D \)$ of a Cartier divisor is the valuation of a local defining rational function at the center.
  It is well defined because units have value zero, and extends rationally to rational divisors.

#thm([Theorem 1.1.])[
  (Exact attainment of zero order).  #emph[With $X \, L \, alpha \, nu \, G_0 \, ell$ as above,
    let $v$ be either a discrete valuation of $bb(C) \( X \)$ centered on $X$ or the zero valuation.
    Let $M$ be any fixed line bundle. Suppose that effective integral divisors $N_j$ and positive integers $m_j
    arrow.r oo$ satisfy
$ N_j tilde.op m_j L + M \, wide ell \( N_j \) = 0 \, wide frac(v \( N_j \), m_j) arrow.r 0 . $

 There is an effective rational divisor $N tilde.op_(bb(Q)) L$ such that $v \( N \) = 0$.]
] <V:exact>

The null intersection condition is the geometric input; the auxiliary line $M$ is arbitrary.
  No irregularity or Euler-characteristic hypothesis is used.
  The theorem preserves rational linear equivalence, which is necessary for constructing sections.
  A limit in the numerical effective cone would not give its conclusion.

Here is a useful special case. A #emph[generic formal arc] on $X$ is a morphism $gamma :
  "Spec" F \[ \[ t \] \] arrow.r X$, for an extension field $F \/ bb(C)$,
  whose fraction point maps to the generic point of $X$. If $- M$ is pseudoeffective and $N_j tilde.op m_j L +
  M$ is effective, nef intersection gives $0 lt.eq ell \( N_j \) = ell \( M \) lt.eq 0$.
  Thus, if the orders of $N_j$ along $gamma$ are $o \( m_j \)$,
  Theorem 1 supplies a section of some positive multiple of $L$ whose order along $gamma$ is exactly zero.
  Corollary 7 verifies the centered-valuation and integrality details, including a point variety and the zero valuation.

=== 1.1 Why finite generation attains the limit <why-finite-generation-attains-the-limit>

The proof first places the principal corrections to the given divisors in one function field,
  and then uses finite generation to attain the limiting class.
  Let $k subset bb(C) \( X \)$ be the field of rational functions whose polar divisors have $ell$-value zero.
  It is relatively algebraically closed. Two fixed input divisors give representatives of $L +
  M \/ m_j$ on a common finite support, and the principal corrections between those representatives and $N_j \/
  m_j$ belong to $k$.

The geometric task is to find a model $Y$ of $k$ on which these corrections lie in a finitely generated divisor
  section ring. On a smooth resolution $pi : Z arrow.r X$ of the rational map to $Y$,
  the null-polar field makes the section space of the effective divisor $K_(Z \/ X)$ one-dimensional on the
  generic fiber over $Y$. The null intersection also forces the curvature kernel to be vertical on a nonempty open
  set. Section 3 verifies these two inputs to the volume-metric theorem of #emph[Metric descent and
  rank-preserving contractions] #cite(label("CompanionG")) Theorem (Toroidal volume metric).
  It gives an effective rational correction $A_0$ on $Y$ whose pullback is exceptional over $X$.
  The semipositive metric it supplies on $- K_Y + A_0$ has locally integrable squared frame norms and is smooth
  and strictly positive on an ordinary open set. The correction-ring theorem of #emph[Integrable metrics and
  effectivity with controlled boundary] #cite(label("CompanionE")) Theorem (Finite generation near a correction
  divisor) then gives finite generation in the two rational divisor directions selected by the input sequence.

The remaining argument uses the actual rational functions representing sections.
  In a finitely generated bigraded ring, a monomial whose normalized degree approaches a boundary ray uses off-ray
  generators in negligible degree. For each input section, the valuation inequality selects a monomial with no
  larger valuation. One boundary-ray generator therefore has sufficiently small normalized valuation.
  Its divisor is effective up to the correction $A_0$. Birational pushforward removes that correction;
  centeredness then turns the resulting upper bound on the valuation into exact equality with zero.
  This order of operations allows the exceptional correction itself to have positive valuation.

The endpoint argument belongs to the study of asymptotic vanishing and multigraded section rings.
  Ein, Lazarsfeld, Mustaţă, Nakamaye and Popa explain how finite generation controls asymptotic orders and base
  loci #cite(label("ELMNP2006")) Section 4, with the corrected polyhedral argument
  #cite(label("ELMNP2023Erratum")) Proposition 1.1; Corti and Lazić give a multigraded formulation
  #cite(label("CortiLazic2013")) Theorem 3.5. Lemma 3 gives the direct one-ray, one-valuation argument used here.
  The geometric finite-generation input rests on the adjoint-ring theory of Birkar, Cascini,
  Hacon and McKernan #cite(label("BCHM2010")) and Cascini–Lazić #cite(label("CasciniLazic2012")),
  in the form #cite(label("CortiLazic2013")) Theorem 3.2(1).

=== 1.2 From orders to invariant sections <from-orders-to-invariant-sections>

For a torus action, the differential of the action gives $- K_X$ its natural linearization.
  A nonzero section can transform by a nontrivial character,
  so scalar nonvanishing does not by itself give invariance.
  Along the generic orbit of a one-parameter subgroup, an eigensection of weight $w$ has order $mu - w$,
  where $mu$ is the fiber weight at the limit. Exact order zero therefore attains that fiber weight.

Müller’s equivariant nonvanishing theorem gives invariant anti-log-canonical sections for projective
  sub-log-canonical pairs with semiample anti-log-canonical divisor,
  under commutative linear algebraic group actions #cite(label("Muller2025")) Theorem C.
  For smooth varieties with a torus action, we obtain the following result under smooth semipositivity and a
  cohomological hypothesis.

#thm([Theorem 1.2.])[
  #emph[Let $X$ be smooth connected projective over $bb(C)$, with $-
    K_X$ smoothly semipositive and $H^i \( X \, cal(O)_X \) = 0$ for every $i > 0$.
    For every algebraic torus $T$ acting on $X$, some positive anticanonical multiple has a nonzero $T$-invariant
    section for its natural linearization.]
] <V:invariant-main>

The proof starts with the source component, which attracts the generic orbit as the one-parameter subgroup tends
  to zero. The attracting decomposition of Białynicki-Birula identifies this component #cite(label("BB1973")).
  The holomorphic fixed-point formula of Atiyah–Bott, Atiyah–Segal and Atiyah–Singer
  #cite(label("AtiyahBott1968")) #cite(label("AtiyahSegal1968")) #cite(label("AtiyahSinger1968")) supplies
  cohomology classes of the corresponding extremal weight. Semipositive hard Lefschetz #cite(label("DPS2001"))
  Theorem 0.1 turns them into twisted differential forms. Saturated determinants,
  following the method of Lazić–Peternell #cite(label("LP2018")) Lemma 4.1 and its anticanonical adaptation
  #cite(label("LMPTX2023")) Lemma 5.1, give effective divisors with bounded order along the generic orbit.
  Their character calculation retains the determinant-rank shift.
  Theorem 1 then supplies actual normalized section weights whose convex hull contains zero.
  A rational convex combination becomes an invariant product after clearing denominators.
  The comparison of fixed-fiber and section-weight polytopes in the semiample setting is developed in
  #cite(label("Muller2025")) Proposition 3.13 and Corollary 3.14;
  here exact attainment supplies the supporting section weights.

Together with the structural inputs described below, the invariant sections yield the following scalar
  consequence: for every smooth connected projective complex variety $X$ with smoothly semipositive $- K_X$,
  there is an integer $m > 0$ such that

$ H^0 \( X \, - m K_X \) eq.not 0 . $

Sections 13 and 14 give two descents. The first uses the compact-monodromy structure theorem of
  #emph[Anticanonical nonvanishing from smooth semipositivity] #cite(label("CompanionH")) Theorem (Finite cover
  with compact torus monodromy), based on the universal-cover structure of Demailly–Peternell–Schneider and its
  rational-connectedness refinement by Campana–Demailly–Peternell #cite(label("DPS1996")) #cite(label("CDP2015")).
  The second uses a locally constant maximal rationally connected fibration,
  supplied by Matsumura–Wang #cite(label("MatsumuraWangV3")),
  following the earlier smooth structure theorem of Cao–Höring #cite(label("CaoHoring")).
  It follows Müller’s invariant-section reduction #cite(label("Muller2025")) Theorem 2.2 and includes the
  unipotent part of the commutative algebraic monodromy. The compact-monodromy argument uses only the structural
  and finite-cover norm results of the nonvanishing companion; its nonvanishing theorem is not an input.

=== 1.3 Independent methods and their additional outputs <independent-methods-and-their-additional-outputs>

The exact-order theorem and its invariant application are followed by two independent constructions.
  Their purpose is to retain different information during the passage from twisted sections to anticanonical sections.

The first uses nef reduction and extension. Given bounded orders in $\| m_j L + M \|$, with $q \( X \) = 0$ and $-
  M$ pseudoeffective, it separates a fixed divisor of zero arc order from a line bundle on a base.
  A fiber-maximum metric makes that line nef; the nef reduction of Bauer and collaborators
  #cite(label("BCEKPRSW2002")) removes its numerical null directions.
  Extension of first jets by the theorem of Cao–Demailly–Matsumura #cite(label("CDM2017")) proves that the
  remaining base line is big and yields arbitrarily small normalized arc orders.
  Theorem 14 records this approximate transfer, which the exact theorem already strengthens under the same
  hypotheses. The independent proof also gives the bigness and jet construction.
  Its character application, Proposition 15, uses $q \( X \) =
  0$ and $chi \( X \, cal(O)_X \) eq.not 0$ instead of vanishing of all higher structure-sheaf cohomology,
  together with the stated equivariant very ample linearization.

There is a second ending to this nef-reduction construction.
  Starting with invariant sections of $j L - G$ for unbounded $j$,
  where $G$ is a fixed pseudoeffective linearized line bundle,
  it forms a base from invariant rational functions with pseudoeffectively controlled poles.
  It then extends one nonzero invariant class in a multiplier-ideal quotient.
  Theorem 16 thus removes the fixed error while keeping invariance throughout.
  This ending needs $q \( X \) = 0$ but does not require the first-jet or weight-polytope steps.
  The common tools occupy Section 8, the arc and character applications Sections 9 and 10,
  and the invariant conversion Section 11.

The other finite-generation construction assumes rational connectedness and controls an entire collection of
  divisor classes. A prime divisor $D$ is controlled when $a L -
  D$ is pseudoeffective for some positive integer $a$. Proposition 19 places the naturally linearized classes of
  all invariant controlled primes in one rational polyhedral cone generated by invariant effective rational
  divisors. Its generators need not themselves be controlled.
  Here the effectivity companion’s weighted-approximation theorem produces an adjoint boundary on a base;
  its correction disappears under birational pushforward. Finite generation of the full multigraded ring and then
  of its invariant subring gives the cone. Character separation supplies another proof of invariant nonvanishing
  in the rationally connected case, as well as the fiberwise input used in the locally constant MRC descent.
  Section 12 keeps this weighted metric construction distinct from the unweighted integrability used for exact
  attainment.

The proof of exact attainment is organized as follows. Section 2 proves the finite-generator lemma and its
  birational application. Sections 3 and 4 construct the null-polar base and prove Theorem 1;
  Section 5 gives the formal-arc consequence. Section 6 establishes the order/weight identity,
  and Section 7 proves Theorem 2. The independent methods then supply the additional conclusions just described,
  before the paired monodromy descents finish the scalar nonvanishing consequence.

== 2 Selecting a generator on the boundary ray <sec:generator>

For a field $K$ containing $bb(C)$, a real-valued valuation is a map $v : K^times arrow.r bb(R)$ satisfying

$ v \( f g \) = v \( f \) + v \( g \) \, wide v \( f + g \) gt.eq min { v \( f \) \,
  v \( g \) } quad \( f + g eq.not 0 \) . $

All valuations in this section are trivial on $bb(C)^times$. The zero valuation is allowed.
  If a homogeneous polynomial has the form $f x^a y^b$, we apply $v$ to its coefficient $f$;
  the formal variables $x \, y$ record degrees only.

The relevant boundary ray consists of degrees $\( 0 \, b \)$.
  A sequence approaches that ray after normalization when its first degree is negligible compared with its total degree.

#thm([Lemma 2.1.])[
  #emph[Let $R subset K \[ x \, y \]$ be a finitely generated $bb(C)$-subalgebra,
    graded by $bb(N)^2$ with $deg x = \( 1 \, 0 \)$, $deg y = \( 0 \, 1 \)$, and $R_(0 \, 0) = bb(C)$.
    Let $v$ be a real-valued valuation of $K$, trivial on $bb(C)^times$. Suppose that nonzero homogeneous elements
$ s_j = f_j x^(a_j) y^(b_j) in R \, wide d_j = a_j + b_j > 0 \, $

 satisfy
$ a_j / d_j arrow.r 0 \, wide frac(v \( f_j \), d_j) arrow.r gamma in bb(R) . $

 Then every finite set of nonzero homogeneous generators of $R$ contains a generator $f x^0 y^b$, with $b > 0$,
   such that
$ frac(v \( f \), b) lt.eq gamma . $

]
] <lem:endpoint>

#proof[
  Discard constant generators and write the others as
  $ r_i = g_i x^(u_i) y^(w_i) \, wide u_i \, w_i in bb(N) \, wide u_i + w_i > 0 . $
  There are finitely many indices $i$. Because the generators are homogeneous,
    $s_j$ can be expressed as a sum of monomials of degree $\( a_j \, b_j \)$.
    One nonzero monomial has coefficient valuation at most $v \( f_j \)$:
    otherwise the valuation inequality for the sum would contradict its coefficient $f_j$.
    Let $e_(i j)$ be the exponents of the generators in such a monomial.
    Nonzero scalar coefficients have valuation zero, so
  #[#set math.equation(numbering: n => "(2.1)")
   $ sum_i e_(i j) u_i = a_j \, wide sum_i e_(i j) w_i = b_j \, wide sum_i e_(i j) v \( g_i \) lt.eq
     v \( f_j \) . $ <eq:monomial>]
  We compare the factors with $u_i > 0$ and those with $u_i = 0$. Every positive $u_i$ is at least one; hence
  $ sum_(u_i > 0) e_(i j) lt.eq a_j . $
  Since the generating set is finite, there are constants $C_1 \, C_2 gt.eq
    0$ such that these factors contribute at most $C_1 a_j$ to the second degree and at least $-
    C_2 a_j$ to the valuation. For example, take
  $ C_1 = max_i w_i \, wide C_2 = max_i max { 0 \, - v \( g_i \) } . $
  The set of nonconstant generators is nonempty because $d_j > 0$.
  Some generator must have $u_i = 0$. Otherwise (2.1) would give $b_j lt.eq C_1 a_j$,
    contrary to $a_j \/ d_j arrow.r 0$. For every such generator $w_i > 0$, so we may define
  $ lambda = min_(u_i = 0) frac(v \( g_i \), w_i) . $
  Let $c_j$ be the second degree contributed by the factors with $u_i > 0$. Thus $0 lt.eq c_j lt.eq C_1 a_j$.
    The remaining factors contribute second degree $b_j - c_j$,
    and their valuation is at least $lambda \( b_j - c_j \)$. Equation (2.1) therefore gives
  $ v \( f_j \) gt.eq lambda b_j - #scale(x: 120%, y: 120%)[\(] C_2 + \| lambda \| C_1
    #scale(x: 120%, y: 120%)[\)] a_j . $
  Divide by $d_j$ and pass to the limit. Since $b_j \/ d_j arrow.r 1$, we obtain $gamma gt.eq lambda$.
    A generator realizing the finite minimum $lambda$ proves the assertion. ◻
]

The proof needs the finite list of actual coefficients $g_i$.
  It does not follow from knowing only a limiting cone of numerical classes.
  This is the feature that will matter for divisor section rings in the next subsection.

=== 2.1 Removing a birational correction <sec:geometric>

We now specify the geometric data to which the lemma applies.
  The main point is that the correction on the base need not have valuation zero.
  It will disappear under birational pushforward before the last valuation comparison.

All varieties below are integral projective varieties over $bb(C)$.
  For a Cartier divisor $B$ on a normal variety $Y$, we identify sections with rational functions:

$ H^0 \( Y \, cal(O)_Y \( B \) \) = { h in bb(C) \( Y \)^times : "div"_Y \( h \) + B gt.eq 0 } union { 0 } . $

For two Cartier divisors $B_1 \, B_0$, their bigraded section ring is

#[#set math.equation(numbering: n => "(2.2)")
 $ R \( Y \; B_1 \, B_0 \) = xor.big_(a \, b in bb(N)) H^0 #scale(x: 120%, y: 120%)[\(] Y \,
   cal(O)_Y \( a B_1 + b B_0 \) #scale(x: 120%, y: 120%)[\)] x^a y^b subset bb(C) \( Y \) \[ x \, y \] .
   $ <eq:section-ring>]

Projectivity and integrality give $H^0 \( Y \, cal(O)_Y \) = bb(C)$, as required in Lemma 3.

We also use rational powers of rational functions, interpreted as elements of $bb(C) \( Y \)^times ⊗_(bb(Z))
  bb(Q)$, written multiplicatively. The divisor map and every valuation extend $bb(Q)$-linearly to this group.
  Each element becomes an ordinary rational function after a positive integral power is taken.
  No extension of the function field by actual roots is intended.

A valuation of $bb(C) \( X \)$ is centered on $X$ if its valuation ring dominates $cal(O)_(X \, xi)$ for some
  point $xi in X$. For a Cartier divisor $D$, define $v \( D \)$ by applying $v$ to a local defining rational
  function at $xi$. This is independent of the equation, because units have valuation zero,
  and extends $bb(Q)$-linearly to rational Cartier divisors.
  In particular, $v \( D \) gt.eq 0$ for every effective rational Cartier divisor $D$.
  The zero valuation is centered at the generic point.

#thm([Proposition 2.2.])[
  #emph[Let $X \, Y$ be smooth integral projective complex varieties, let $W$ be normal and projective, and let
$ X arrow.l^(med p med) W arrow.r^(med f med) Y $

 be morphisms, with $p$ birational and $f$ surjective and equidimensional.
   Identify $bb(C) \( Y \)$ with its induced subfield of $bb(C) \( X \) = bb(C) \( W \)$.
   Fix a centered discrete valuation $v$ of $bb(C) \( X \)$, allowing also the zero valuation.]
  #emph[Let $A gt.eq 0$ be a rational divisor on $Y$ such that $p_(*) f^(*) A = 0$.
    Let $D_0 \, D_1$ be rational Cartier divisors on $X$ and put
$ D \( t \) = \( 1 - t \) D_0 + t D_1 wide \( 0 lt.eq t lt.eq 1 \) . $

 For each prime divisor $Q$ of $Y$, define
#[#set math.equation(numbering: n => "(2.3)")
 $ P \( t \) = sum_Q min_(E : thin f \( E \) = Q) frac("coeff"_E p^(*) D \( t \), "ord"_E \( f^(*) Q \)) thin Q \,
   $ <eq:minimum-divisor>]

 where $E$ ranges over the prime divisors of $W$ dominating $Q$.
   Assume that $P \( t \) = \( 1 - t \) P \( 0 \) + t P \( 1 \)$ throughout $\[ 0 \, 1 \]$.]
  #emph[Suppose that rational numbers $t_j in \[ 0 \, 1 \]$ tend to zero and that $h_j in
    bb(C) \( Y \)^times ⊗_(bb(Z)) bb(Q)$ satisfy
$ N_j = D \( t_j \) + "div"_X \( h_j \) gt.eq 0 \, wide v \( N_j \) arrow.r 0 . $

 Finally, suppose that for some $epsilon.alt in bb(Q)_(> 0)$ and integer $k > 0$, the divisors
$ B_1 = k #scale(x: 120%, y: 120%)[\(] A + epsilon.alt P \( 1 \) #scale(x: 120%, y: 120%)[\)] \, wide B_0 =
  k #scale(x: 120%, y: 120%)[\(] A + epsilon.alt P \( 0 \) #scale(x: 120%, y: 120%)[\)] $

 are Cartier and the ring $R \( Y \; B_1 \, B_0 \)$ is finitely generated. Then there is an effective rational divisor
$ N tilde.op_(bb(Q)) D_0 \, wide v \( N \) = 0 . $

]
] <prop:geometric>

The minimum in (2.3) is over a finite nonempty set, since $f$ is surjective and equidimensional.
  Only finitely many base primes occur: the pullbacks of $D_0 \, D_1$ have fixed finite support.
  Each coefficient is a minimum of finitely many rational affine functions, so $P \( t \)$ is piecewise affine.
  In applications one restricts to a sufficiently small rational segment ending at $t =
  0$ and rescales the parameter to obtain the stated affine hypothesis.
  If $Y$ is a point, the sum is empty and means $P \( t \) = 0$.

#proof[
  Write
  $ t_j = a_j / d_j \, wide d_j = a_j + b_j > 0 \, wide a_j \, b_j in bb(N) . $
  Scale the pair $\( a_j \, b_j \)$ by a positive integer whenever necessary to clear denominators.
    The ratio $a_j \/ d_j = t_j$ is unchanged. In particular we can arrange that
  $ s_j = h_j^(epsilon.alt k d_j) $
  is an ordinary rational function on $Y$.
  The effective divisor $N_j$ is rational Cartier because $X$ is smooth, so $p^(*) N_j gt.eq 0$.
    For a prime $E$ of $W$ dominating a base prime $Q$, let $e_E = "ord"_E \( f^(*) Q \) > 0$.
    Taking its coefficient in this pullback gives
  $ frac("coeff"_E p^(*) D \( t_j \), e_E) + "coeff"_Q "div"_Y \( h_j \) gt.eq 0 . $
  Taking the minimum proves
  #[#set math.equation(numbering: n => "(2.4)")
   $ P \( t_j \) + "div"_Y \( h_j \) gt.eq 0 . $ <eq:base-effectivity>]
  The affine hypothesis now gives
  $ a_j B_1 + b_j B_0 = k d_j #scale(x: 120%, y: 120%)[\(] A + epsilon.alt P \( t_j \) #scale(x: 120%, y: 120%)[\)] . $
  Since $A gt.eq 0$, equation (2.4) shows that $s_j x^(a_j)
    y^(b_j)$ is a nonzero homogeneous element of $R \( Y \; B_1 \, B_0 \)$.
  The valuation of $D \( t \)$ is affine in $t$, since the two divisors have fixed support and valuation is
    $bb(Q)$-linear. Thus
  $ v \( h_j \) = v \( N_j \) - v \( D \( t_j \) \) arrow.r - v \( D_0 \) \, wide frac(v \( s_j \), d_j) arrow.r -
    epsilon.alt k thin v \( D_0 \) . $
  Apply Lemma 3 to this section ring and to the restriction of $v$ to $bb(C) \( Y \)$.
    The lemma only uses this restriction as a real-valued valuation.
    We obtain a generator represented by a rational function $r$, of degree $\( 0 \, b \)$ with $b > 0$, such that
  $ frac(v \( r \), epsilon.alt k b) lt.eq - v \( D_0 \) . $
  Put $h_(*) = r^(1 \/ \( epsilon.alt k b \))$ in the rational-power group. The section inequality for $r$ gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ P \( 0 \) + A \/ epsilon.alt + "div"_Y \( h_(*) \) gt.eq 0 . $ <eq:endpoint-effectivity>]
  We have selected the endpoint section on $Y$. It remains to show that it gives an effective divisor on $X$
    without retaining the correction $A \/ epsilon.alt$.
  A prime of $W$ is horizontal if it dominates $Y$, and vertical otherwise.
    Principal divisors pulled back from $Y$ have no horizontal components.
    Consequently the horizontal coefficients of $p^(*) D \( t_j \)$ are nonnegative,
    by effectivity of $p^(*) N_j$; the same is true for $p^(*) D_0$ by passage to the limit.
    Every vertical prime dominates a base prime, by equidimensionality.
    For such a prime $E$ over $Q$, the minimum defining $P \( 0 \)$ and (2.5) show that its coefficient in
  $ p^(*) D_0 + f^(*) #scale(x: 120%, y: 120%)[\(] "div"_Y \( h_(*) \) + A \/ epsilon.alt #scale(x: 120%, y: 120%)[\)] $
  is nonnegative. This divisor is therefore effective.
  Push it forward by $p$. The assumption $p_(*) f^(*) A = 0$ removes the correction,
    while pullback and pushforward of the principal divisor give $"div"_X \( h_(*) \)$. Hence
  $ N = D_0 + "div"_X \( h_(*) \) gt.eq 0 \, wide N tilde.op_(bb(Q)) D_0 . $
  Centering gives $v \( N \) gt.eq 0$. The selected generator gives $v \( N \) = v \( D_0 \) + v \( h_(*) \) lt.eq
    0$, proving equality. ◻
]

The proof never evaluates the correction $f^(*) A$ at $v$. Its removal is a divisor identity under pushforward.
  This permits an exceptional correction with positive valuation on a higher model.

== 3 The field selected by the curvature intersection <V:null-field>

We now construct the base needed for Theorem 1. The data $X \, L \, alpha \, nu \, G_0 \,
  ell$ remain as in the introduction. A divisor is called #emph[null] in this section if it is effective and has
  $ell$-value zero. Nonnegativity of $ell$ implies that every effective divisor bounded by a null divisor is again null.

#thm([Lemma 3.1.])[
  #emph[The set
$ k = { 0 } union { h in bb(C) \( X \)^times : ell \( \( h \)_oo \) = 0 } $

 is a finitely generated subfield of $bb(C) \( X \)$, relatively algebraically closed in $bb(C) \( X \)$.]
] <V:polar-field>

#proof[
  The polar divisors of $h_1 + h_2$ and $h_1 h_2$ are bounded by the sum of the polar divisors of $h_1 \, h_2$.
    The zero and polar divisors of a nonzero rational function are linearly equivalent,
    and therefore have the same $ell$-value. These observations prove closure under addition,
    multiplication and inversion.
  Suppose that $b in bb(C) \( X \)$ is algebraic over $k$. In a monic equation $b^r + a_1 b^(r - 1) + dots.h.c +
    a_r = 0$, each coefficient belongs to $k$. At a prime divisor $P$ where $b$ has a pole,
    the term $b^r$ cannot have strictly smaller order than every other term.
    Thus, for some $i$, $i "ord"_P \( b \) gt.eq "ord"_P \( a_i \)$.
    In particular the pole order of $b$ is bounded by the sum of the pole orders of the coefficients.
    Its polar divisor is null, so $b in k$.
  Choose a transcendence basis $t_1 \, dots.h \, t_d$ of $k \/ bb(C)$.
    The algebraic closure of $bb(C) \( t_1 \, dots.h \, t_d \)$ inside the finitely generated field
    $bb(C) \( X \)$ is a finite extension of that rational function field.
    The intermediate field $k$ is algebraic over the same field and is therefore finite over it.
    This proves finite generation. ◻
]

Choose smooth projective models and morphisms

$ X arrow.l^(med pi med) Z arrow.r^(med g med) Y \, wide bb(C) \( Y \) = k \, $

with $pi$ birational and $g$ surjective. Characteristic zero and relative algebraic closedness imply that its
  generic fiber is geometrically integral. We first verify two properties which persist under every birational
  change of these models.

#thm([Lemma 3.2.])[
  #emph[For every very ample divisor $H$ on $Y$,
#[#set math.equation(numbering: n => "(3.1)")
 $ ell \( pi_(*) g^(*) H \) = 0 . $ <V:ample-null>]

 If $E_Z = K_(Z \/ X)$ is the effective Jacobian divisor, then
#[#set math.equation(numbering: n => "(3.2)")
 $ dim_(bb(C) \( Y \)) H^0 \( Z_eta \, cal(O)_Z \( E_Z \) \|_(Z_eta) \) = 1 . $ <V:zero-rank>]

]
] <V:null-rank>

#proof[
  Choose a basis $s_0 \, dots.h \, s_N$ of the very ample system.
    The functions $s_i \/ s_0$ belong to $k$, so their polar divisors on $X$ are bounded by one null divisor $D$.
    Their poles on $Z$ are then bounded by $pi^(*) D$. Base point freeness says that the componentwise maximum of
    those polar divisors on $Z$ is $g^(*) "div" \( s_0 \)$. After pushforward,
    effectivity and monotonicity give $0 lt.eq ell \( pi_(*) g^(*) H \) lt.eq ell \( D \) = 0$.
  The Jacobian section $s_(E_Z)$ gives one nonzero section in (3.2). Divide any other generic-fiber section by it.
    The resulting rational function $a in bb(C) \( Z \) = bb(C) \( X \)$ has horizontal poles bounded by $E_Z$.
    There are finitely many remaining polar primes. Each maps into a proper closed subset of $Y$.
    A sufficiently high very ample system has an effective member $B$ vanishing to prescribed orders on their
    images; increasing these orders ensures
  $ \( a \)_oo lt.eq E_Z + g^(*) B . $
  This also works when a vertical prime maps to codimension greater than one.
    Since $E_Z$ is exceptional over $X$, pushforward and (3.1) show that the polar divisor of $a$ on $X$ is null.
    Thus $a in k$. Every generic section is a scalar multiple of the Jacobian section, as claimed. ◻
]

The equality in (3.2) concerns the full adjoint space in degree zero.
  It has not been deduced from an eventual rank statement. It identifies the integrated Jacobian volume with a
  line metric on the base, rather than with a selected subspace of a larger direct image.

=== 3.1 An equidimensional model without a field extension <an-equidimensional-model-without-a-field-extension>

Assume $d = dim Y > 0$. We need a normal projective variety $W$ and a diagram

#[#set math.equation(numbering: n => "(3.3)")
 $ X arrow.l^(med p med) W arrow.r^(med f med) Y $ <V:model>]

with $p$ birational, $Y$ smooth projective, and $f$ equidimensional and toroidal for strict toroidal embeddings.
  All modifications here are birational; in particular the field of the base remains $k$.
  A toroidal embedding is locally modeled on a toric variety with its dense torus; the complement is its boundary.
  Strictness means that the irreducible boundary components are normal.
  Toroidal morphisms are locally toric morphisms, so boundary strata determine rational cones and the morphism
  determines their lattice-linear maps.

Weak toroidalization #cite(label("ADK2013")) Theorem 1.1 first gives a birational toroidal diagram with smooth
  projective target. For a toroidal morphism, equidimensionality is equivalent to the condition that every source
  cone maps onto a target cone #cite(label("AK2000")) Lemma 4.1 and Remark 4.2.
  Refine the target cone complex so that the image of every source cone is a union of cones.
  Projective refinements exist by #cite(label("AK2000")) Lemma 4.3;
  further projective toroidal resolution makes the target nonsingular.
  Intersecting the source cones with inverse images of target cones gives projective source subdivisions and a
  compatible toroidal morphism. In a target cone of the new subdivision,
  an old cone image meets it in a union of faces which is convex, hence in a face.
  Thus the new source cones map onto target cones. This is the equidimensionalization of #cite(label("AK2000"))
  Proposition 4.4.

In local toric models, a source stratum maps submersively onto its target stratum.
  Cone surjectivity bounds the dimension of the fiber in each stratum above by $n - d$;
  the opposite bound for full fibers follows because the target is smooth. This gives equidimensionality.
  The normal source may remain singular, and no covering to reduce multiplicities is needed.
  Resolve it by $Z arrow.r W$ when using smooth differential forms;
  that resolution need not itself be equidimensional. We continue to write $pi : Z arrow.r X$ and $g : Z arrow.r
  Y$ for the induced maps.

=== 3.2 The horizontal curvature patch <the-horizontal-curvature-patch>

The next calculation verifies the remaining analytic hypothesis of the toroidal-volume theorem.
  Let $omega_0$ be a positive form representing $c_1 \( G_0 \)$,
  and let $omega_H$ represent a very ample class on $Y$. When $nu < n$, equation (3.1) implies

#[#set math.equation(numbering: n => "(3.4)")
 $ \( pi^(*) alpha \)^nu and g^(*) omega_H and pi^(*) omega_0^(n - nu - 1) = 0 . $ <V:vanishing-form>]

Indeed the left side is a semipositive top-degree form whose integral is the displayed intersection number.
  It therefore vanishes pointwise.

At a maximum-rank point away from the Jacobian divisor, diagonalize $pi^(*)
  alpha$ in coordinates orthonormal for $pi^(*) omega_0$. Its first $nu$ eigenvalues are positive and the rest are
  zero. The left side of (3.4) is a positive multiple of the sum of the diagonal entries of $g^(*)
  omega_H$ in the remaining $n - nu$ directions. These entries vanish.
  A semipositive Hermitian form vanishing on a vector has zero mixed terms with that vector, so

$ ker pi^(*) alpha subset ker d g . $

For $nu = n$ this inclusion is automatic. The maximum-rank locus is a nonempty ordinary open and intersects the
  dense smooth base-change locus, away from the Jacobian divisor.
  Near a point in their intersection the rank is constant. On a smaller relatively compact neighborhood the
  positive eigenvalues are bounded below, and the kernel inclusion gives

#[#set math.equation(numbering: n => "(3.5)")
 $ pi^(*) alpha gt.eq c thin g^(*) omega_H wide \( c > 0 \) . $ <V:strict-patch>]

The Jacobian section is nonzero on this patch. If $nu = 0$, the same calculation would force $d g =
  0$ on a nonempty open; thus a positive- dimensional base cannot occur in that case.

We have now proved both analytic inputs from the null-polar field: full rank one in (3.2) and the patch (3.5).
  Apply the toroidal-volume theorem #cite(label("CompanionG")) Theorem (Toroidal volume metric) to (3.3).
  For a prime $E$ of $W$ put $a_E = "ord"_E K_(W \/ X)$. Its conclusion uses

#[#set math.equation(numbering: n => "(3.6)")
 $ A_0 = sum_Q max {0 \, min_(E mapsto Q) (frac(1 + a_E, "ord"_E f^(*) Q) - 1)} Q . $ <V:correction>]

It supplies $A_0 gt.eq 0$, $p_(*) f^(*) A_0 = 0$, and a semipositive metric on $- K_Y +
  A_0$ with locally integrable squared frame norms, smooth and strictly positive on a nonempty ordinary open.
  The cited theorem proves the all-valuation discrepancy calculation and extension across boundary divisors and
  codimension two. Its strictness requirement is exactly (3.5);
  no global strict curvature bound is being inferred directly from that patch.

The correction-ring theorem #cite(label("CompanionE")) Theorem (Finite generation near a correction divisor) now
  applies. For every finite list of rational divisors $P_i$ on $Y$,
  there exist $epsilon.alt in bb(Q)_(> 0)$ and $k_0 in bb(Z)_(> 0)$ such that all
  $k_0 \( A_0 + epsilon.alt P_i \)$ are Cartier and their multigraded section ring is finitely generated.
  This statement retains the actual rational linear equivalences and the common value of $epsilon.alt$.
  We next choose the two directions dictated by the divisors in Theorem 1.

== 4 Proof of exact attainment <V:exact-proof>

The preceding construction depends only on the curvature-null field.
  We now place the given divisors in a two-dimensional section ring and apply Proposition 4.

#proof[
  Choose two input divisors with distinct exponents, write them as $N_1 \, N_2$,
    and denote their exponents by $u_1 \, u_2$. For a rational vector $t = \( t^1 \, t^2 \)$ put $D \( t \) =
    t^1 N_1 + t^2 N_2$. Let $t_j$ solve
  $ u_1 t_j^1 + u_2 t_j^2 = 1 \, wide t_j^1 + t_j^2 = 1 \/ m_j . $
  After discarding finitely many terms, these points approach from one side the rational point $t_(*)$ given by
    the same first equation and $t_(*)^1 + t_(*)^2 = 0$. Hence $D \( t_(*) \) tilde.op_(bb(Q)) L$,
    and there are rational powers of rational functions $h_j$ such that
  #[#set math.equation(numbering: n => "(4.1)")
   $ N_j \/ m_j = D \( t_j \) + "div"_X \( h_j \) . $ <V:principal-corrections>]
  A positive power clearing denominators is an ordinary rational function.
    Its polar divisor is bounded by a positive linear combination of $N_1 \, N_2$,
    because the left side of (4.1) is effective. That bound is null.
    Thus the power belongs to $k$, and we may regard $h_j$ as an element of $k^times ⊗_(bb(Z)) bb(Q)$.
  If $k = bb(C)$, the principal correction vanishes. The fixed-support limit of the effective divisors
    $D \( t_j \)$ is effective, and linearity on that finite support gives
  $ v \( D \( t_(*) \) \) = lim_j v \( N_j \) \/ m_j = 0 . $
  Then $N = D \( t_(*) \)$ proves the assertion.
  Otherwise use the equidimensional model of Section 3. Define the divisor $P \( t \)$ on $Y$ by
  $ P \( t \) = sum_Q min_(E : thin f \( E \) = Q) frac("coeff"_E p^(*) D \( t \), "ord"_E f^(*) Q) thin Q . $
  Its support is finite and fixed, since the support of $p^(*) D \( t \)$ lies in that of $p^(*) N_1 + p^(*) N_2$.
    Each coefficient is a minimum of finitely many rational linear functions.
    On a sufficiently short rational segment $\[ t_(*) \, t_0 \]$ containing a tail of $t_j$,
    all these minima are linear. Reparameterize this segment by $u in \[ 0 \, 1 \]$, so that $u =
    0$ corresponds to $t_(*)$ and $u = 1$ to $t_0$.
  Apply the correction-ring theorem to $P \( t_0 \) \, P \( t_(*) \)$.
    It gives a finitely generated bigraded section ring for
  $ B_1 = k_0 \( A_0 + epsilon.alt P \( t_0 \) \) \, wide B_0 = k_0 \( A_0 + epsilon.alt P \( t_(*) \) \) . $
  All the hypotheses of Proposition 4 now hold: $p_(*) f^(*) A_0 = 0$ by the toroidal-volume theorem;
    the normalized effective divisors in (4.1) approach $D \( t_(*) \)$ through principal corrections from $Y$;
    their valuations tend to zero; and the minimum divisor is affine on the chosen segment.
    That proposition gives an effective rational divisor $N tilde.op_(bb(Q)) D \( t_(*) \) tilde.op_(bb(Q))
    L$ with $v \( N \) = 0$. ◻
]

In particular, no valuation of the exceptional correction is assumed to vanish.
  The proof of Proposition 4 first removes it by pushforward and then uses centeredness on $X$.
  This is also why the fixed valuation may have center of any codimension.

== 5 Exact zero order along a formal arc <sec:arc>

A generic formal arc on $X$ is a morphism

$ gamma : "Spec" F \[ \[ t \] \] arrow.r X $

over an extension field $F \/ bb(C)$, whose fraction point maps to the generic point of $X$.
  For a Cartier divisor $D$, write $v_gamma \( D \)$ for the order in $t$ of its local equation pulled back along
  the arc. Genericity ensures that a nonzero equation remains nonzero.

#thm([Corollary 5.1.])[
  #emph[Let $X$ be smooth integral projective over $bb(C)$, let $L = -
    K_X$ have a smooth semipositive Hermitian metric, and let $M$ be a line bundle such that $-
    M$ is pseudoeffective. Let $gamma$ be a generic formal arc on $X$. Suppose that effective integral divisors satisfy
$ N_j tilde.op M + m_j L \, wide m_j in bb(Z)_(> 0) \, quad m_j arrow.r oo \, wide v_gamma \( N_j \) = o \( m_j \) . $

 Then, for some integer $r > 0$, there is an effective integral divisor
$ D tilde.op r L \, wide v_gamma \( D \) = 0 . $

]
] <cor:arc>

#proof[
  If $X$ is a point, use its zero divisor. Otherwise set $n =
    dim X > 0$ and choose $G_0$ and $ell$ as in Theorem 1. Smooth semipositivity makes $L$ nef.
    If $nu < n$, the functional $ell$ is nonnegative on effective divisors, since its remaining factors are nef;
    by continuity it is nonnegative on the closed pseudoeffective cone.
    If $alpha$ is the curvature form normalized to represent $c_1 \( L \)$, then $alpha^(nu + 1) = 0$,
    so $ell \( L \) = 0$. Thus
  $ 0 lt.eq ell \( N_j \) = ell \( M \) + m_j ell \( L \) = ell \( M \) lt.eq 0 . $
  The last inequality uses pseudoeffectivity of $- M$. This proves $ell \( N_j \) = 0$.
    For $nu = n$, the same conclusion follows from the definition $ell = 0$.
  The generic fraction point of the arc gives an injection
  $ bb(C) \( X \) arrow.r.hook F \( \( t \) \) . $
  Restrict $"ord"_t$ to $bb(C) \( X \)^times$. Its image is either zero or $d bb(Z)$ for an integer $d > 0$.
    Let $xi$ be the image of the closed point of the arc. The local ring $cal(O)_(X \, xi)$ maps into
    $F \[ \[ t \] \]$, its maximal ideal maps into $t F \[ \[ t \] \]$, and its units have order zero.
    Hence the restricted valuation is centered at $xi$. If it is zero, this forces $xi$ to be the generic point;
    we use the zero-valuation case of Theorem 1. Otherwise divide by $d$ to obtain a normalized discrete valuation
    centered at $xi$. Orders of local divisor equations agree with arc orders, up to this fixed normalization.
  The assumption $v_gamma \( N_j \) = o \( m_j \)$ is exactly the required normalized-order limit,
    and dividing by $d$ leaves that limit unchanged. Theorem 1 therefore supplies an effective rational divisor $N
    tilde.op_(bb(Q)) L$ with $v_gamma \( N \) = 0$. Choose $r >
    0$ clearing the coefficients of $N$ and the rational linear equivalence.
    Then $D = r N$ is effective integral, $D tilde.op r L$, and $v_gamma \( D \) = 0$. ◻
]

In particular, bounded input orders imply the corollary, and the same output $D$ satisfies $v_gamma \( D \) <
  delta r$ for every $delta > 0$. There is also an independent route to the weaker approximate conclusion.
  It starts from the numerical nef reduction of Bauer et al. #cite(label("BCEKPRSW2002")) Theorem 2.1 and uses the
  multiplier-ideal quotient extension theorem of Cao–Demailly–Matsumura #cite(label("CDM2017")) Theorem 1.1 to
  obtain the required jets. The passage from nef reduction to linear equivalence,
  and the construction of that quotient, are additional steps;
  the corresponding anticanonical argument assumes irregularity zero.
  The implication proved here uses neither that assumption nor the extension theorem.
  It uses the stronger exact valuation theorem, whose finite-generation preparation remains essential.

== 6 Orbit orders and characters <V:sec-order-weight>

We use the left action on sections of a linearized line bundle:
  $\( g dot.op s \) \( x \) = g #scale(x: 120%, y: 120%)[\(] s \( g^(- 1) x \) #scale(x: 120%, y: 120%)[\)]$.
  Thus a character $alpha$ means $g dot.op s = alpha \( g \) s$.
  Fixing this convention is necessary when an order estimate is converted into a weight estimate.
  The next two elementary lemmas will be used both for approximate weights and for exact attainment of a
  supporting weight.

#thm([Lemma 6.1.])[
  (The order on a generic orbit).  #emph[Let an algebraic torus $T$ act on a smooth integral projective variety
    $X$, and let $L$ be a $T$-linearized line bundle. Let $lambda : bb(G)_m arrow.r T$ be a cocharacter,
    and let $S$ be its source component: a dense open subset of $X$ tends to $S$ as the parameter tends to zero.
    Let $mu$ be the $lambda$-weight on $L \|_S$. If $0 eq.not s in H^0 \( X \, L \)$ has $lambda$-weight $w$, then
$ v_lambda \( "div" s \) = mu - w \, $

 where $v_lambda$ is the order on the arc $t mapsto lambda \( t \) xi$ and $xi$ is the generic point,
   viewed as a $bb(C) \( X \)$-valued point. For the zero cocharacter the order and both weights are zero.]
] <V:order-weight>

#proof[
  The orbit map is defined over $bb(C) \( X \) \( t \)$ and remains generic on $X$.
    By properness it extends to the formal disc over $bb(C) \( X \)$. Its center belongs to $S$.
    Pull back $L$ to this disc. If the pulled-back section has order $d$,
    its first nonzero class belongs to the fiber of $L$ tensored with the degree-$d$ parameter ideal quotient.
    Parameter scaling acts on this quotient, under the declared action on sections, with weight $- d$.
    The first nonzero class therefore has weight $mu - d$. Equivariance gives $w = mu - d$.
    The zero-cocharacter arc is constant at the generic point; every nonzero rational function is a unit there,
    which proves the last assertion directly. ◻
]

#thm([Lemma 6.2.])[
  (Multiplying characters).  #emph[Let $T$ act on an integral projective variety $X$,
    and let $L$ be a $T$-linearized line bundle. Suppose, for $1 lt.eq i lt.eq N$,
    that $s_i in H^0 \( X \, r_i L \)$ are nonzero eigensections with characters $alpha_i$,
    where $r_i in bb(Z)_(> 0)$. If zero lies in the convex hull of the rational points $alpha_i \/ r_i$,
    then $H^0 \( X \, r L \)^T eq.not 0$ for some $r > 0$.]
] <V:convex-product>

#proof[
  The defining linear equations and inequalities have rational coefficients,
    so there are rational numbers $c_i gt.eq 0$ satisfying $sum_i c_i = 1$ and $sum_i c_i alpha_i \/ r_i = 0$.
    Clear the denominators of $c_i \/ r_i$ to obtain integers $n_i gt.eq 0$, not all zero,
    with $sum_i n_i alpha_i = 0$. The product $product_i s_i^(n_i)$ has weight zero and belongs to
    $H^0 \( X \, r L \)$, where $r = sum_i n_i r_i > 0$. Its factors are nonzero at the generic point of the
    integral variety, so the product is nonzero. ◻
]

== 7 Exact attainment of source weights <subsec:valuation-extremal-weights>

We prove Theorem 2 by constructing the small input orders required by Theorem 1.
  Let $X$ be smooth connected projective with smoothly semipositive $L = - K_X$,
  and assume $H^i \( X \, cal(O)_X \) = 0$ for all $i > 0$. Let an algebraic torus $T$ act effectively on $X$.
  If $X$ is a point, its constant section proves the theorem. Otherwise use $G_0$ and $ell$ as in (1.1).
  The anticanonical line $L = det T_X$ has its natural linearization.
  The action on sections is the left action induced by the action on the total space.

=== 7.1 Source weights and cohomology <source-weights-and-cohomology>

Fix a cocharacter $lambda : bb(G)_m arrow.r T$. Its unique source component $S$ attracts a dense open subset as $t
  arrow.r 0$, by the Białynicki-Birula decomposition #cite(label("BB1973"));
  see also the smooth attracting decomposition in #cite(label("JelisiejewSienkiewicz2019")) Theorem 1.5 and
  Corollary 7.3. Let $c$ be the weight of $L$ on $S$. This is the sum of the positive normal tangent weights,
  so $c > 0$ for a nonzero cocharacter. For the zero cocharacter take $S = X$ and $c = 0$.
  The rational attracting map to $S$ is dominant. Resolve it and pull back holomorphic forms;
  birational invariance and Hodge symmetry give $H^i \( S \, cal(O)_S \) = 0$ for $i > 0$.

Average the logarithmic weights of the metric over the circle in $lambda \( bb(G)_m \)$.
  For a nonzero vector $u in L_x$, put $q_u \( s \) = log \| lambda \( e^s \) u \|$.
  The logarithmic norm of this nonvanishing holomorphic orbit section is superharmonic by semipositive curvature.
  Circle invariance therefore makes $q_u$ concave in $s$. There is a smooth function $theta : X arrow.r
  bb(R)$ such that $q'_u \( s \) = theta \( lambda \( e^s \) x \)$;
  it is independent of the scaling of $u$ and equals the fiber weight on each fixed component.
  If $x$ is in the dense attracting set, continuity gives $q'_u \( s \) arrow.r c$ as $s arrow.r - oo$.
  Concavity then gives $theta \( x \) lt.eq c$. Density and continuity extend this inequality to all of $X$,
  so every fixed-component fiber weight is at most $c$.

For all sufficiently large integers $l$, the weight $\( l - 1 \) c$ occurs in some $H^q \( X \, \( l - 1 \) L \)$.
  Indeed, expand the equivariant holomorphic Lefschetz formula at infinity in its weight variable $z$.
  For a normal tangent weight $w$, the inverse normal factor is $\( 1 - z^(- w) e^(- x) \)^(- 1)$.
  If $w > 0$, it has constant term one and lower powers; if $w < 0$, all its powers are strictly negative.
  Every component other than the source has a negative normal weight.
  Maximality of $c$ therefore makes the coefficient of $z^(\( l - 1 \) c)$ precisely
  $chi \( S \, \( l - 1 \) L \|_S \)$. This polynomial in $l - 1$ has value $chi \( S \, cal(O)_S \) = 1$ at zero,
  and is nonzero for all large $l$. See #cite(label("AtiyahSegal1968")) #cite(label("AtiyahSinger1968")) for the
  fixed-component formula.

Equivariant hard Lefschetz with the smooth semipositive coefficient $l
  L$ #cite(label("DPS2001")) Theorem 0.1 gives a surjection

$ H^0 \( X \, Omega_X^(n - q) ⊗ l L \) arrow.r H^q \( X \, K_X + l L \) = H^q \( X \, \( l - 1 \) L \) . $

A circle-invariant Kähler form makes this map equivariant.
  On an infinite subsequence we obtain nonzero eigensections $u_l$ of $Omega_X^a ⊗ l L$, with one fixed $a$,
  of weight $\( l - 1 \) c$ for $lambda$. Decompose each into $T$-weight components and select a nonzero
  component; all the components have the same $lambda$-weight. Thus the $u_l$ can be chosen to be $T$-eigensections.

=== 7.2 Determinants with bounded orbit order <determinants-with-bounded-orbit-order>

The use of saturated determinants follows the method of Lazić–Peternell #cite(label("LP2018")) Lemma 4.1 and its
  anticanonical adaptation in #cite(label("LMPTX2023")) Lemma 5.1.
  Those statements include a numerical-nontriviality hypothesis on the twisting line.
  Here the positive unbounded twists are already available,
  and the generic-span and wedge construction below proves exactly the assertion needed,
  also for a numerically trivial $L$.

Each section $u_l$ defines a map $L^(- l) arrow.r Omega_X^a$.
  Take the span of their image lines over $bb(C) \( X \)$, of rank $e > 0$,
  and saturate its determinant line in $and.big^e Omega_X^a$.
  This construction is independent of a choice of rational frame for $L$. Denote the resulting line bundle by $M$.
  Rank-one saturation in a locally free sheaf is reflexive and hence a line bundle on the smooth variety;
  its natural linearization extends from the subbundle locus across codimension two.
  The needed curvature-intersection sign is $ell \( M \) lt.eq 0$; it is automatic when $nu = n$.
  Suppose $nu < n$. The smooth metric on $L = - K_X$ determines a positive volume form whose Ricci form is
  $alpha$. For every $b > 0$, scale this volume to the volume of the Kähler class $G_0 +
  b L$ and apply the Calabi–Yau theorem #cite(label("Yau1978")).
  The resulting Kähler metric has Ricci form $alpha gt.eq 0$.
  Kähler curvature symmetries identify the mean curvature of its tangent bundle with the Ricci endomorphism.
  Duals and exterior powers therefore make the mean curvature of $and.big^e Omega_X^a$ nonpositive.

Apply the subbundle curvature inequality to the inclusion of $M$ where it is nonzero.
  Its logarithmic norm extends as a locally quasiplurisubharmonic function across the zero set.
  Its Hessian has a smooth lower bound there, so the singular trace measure is nonnegative and the extension
  preserves the degree inequality. Hence

$ M dot.op \( G_0 + b L \)^(n - 1) lt.eq 0 . $

Since $L^(nu + 1) = 0$, all powers above $b^nu$ vanish in this intersection polynomial.
  The coefficient of $b^nu$ is a positive multiple of $ell \( M \)$, so letting $b arrow.r oo$ proves the required sign.

Choose a fixed finite collection of the $u_l$ whose image lines form a generic basis.
  Every further nonzero $u_l$ can be completed to a basis by $e - 1$ members of this collection.
  There are finitely many choices; on an infinite subsequence one choice is fixed.
  Taking these wedges gives nonzero eigensections of $M + m_j L$,
  where $m_j$ is the sum of the $e$ twists and tends to infinity.
  Their weights are $\( m_j - e \) c$, since each of the $e$ constituent forms contributes its twist minus one.
  Their zero divisors $N_j$ satisfy $ell \( N_j \) = 0$, by effectivity and $ell \( M \) lt.eq 0$.
  Let $v$ be the order obtained by substituting $lambda \( t \) x$ for the generic point $x$ of $X$.
  Properness extends this orbit to a formal arc at zero, with center at the generic point of $S$;
  its order is a discrete valuation up to rescaling, or is zero. If $c_M$ is the fiber weight of $M$ at $S$, then

$ v \( N_j \) = m_j c + c_M - \( m_j - e \) c = c_M + e c . $

This is Lemma 8 for the declared left action. The constant $c_M + e c$ retains the determinant-rank shift.

=== 7.3 Exact source weights and an invariant product <exact-source-weights-and-an-invariant-product>

Theorem 1 now gives an effective rational representative of $L$ of order zero at the generic source.
  After clearing denominators, some section of $m L$ restricts nontrivially to $S$.
  Its weight decomposition consequently contains a normalized weight whose value on $lambda$ is exactly $c$.
  If $T$ is trivial, this is already a nonzero invariant section. Assume from now on that $T$ has positive dimension.

The function $c$ is the maximum of the finitely many $T$-fixed fiber weights evaluated on $lambda$:
  the source is $T$-stable and contains a $T$-fixed point by the Borel fixed-point theorem.
  It thus extends to a continuous rational polyhedral homogeneous function on real cocharacters.
  It is strictly positive away from zero. Indeed a nontrivial zero or negative locus would,
  by rational polyhedrality, contain a nonzero rational cocharacter, contrary to the source-weight calculation.
  Every normalized section weight is bounded above by $c$ on each cocharacter, by the same orbit-order test,
  and the preceding argument attains this upper bound. The comparison between fixed-fiber and section-weight
  polytopes for semiample linearized line bundles, and the resulting invariant-product criterion,
  are established in Müller #cite(label("Muller2025")) Proposition 3.13 and Corollary 3.14.
  Here exact order attainment supplies the supporting section weights.

Testing a lattice basis of cocharacters and its negatives bounds all normalized section weights.
  Their closed convex hull is therefore compact; its support function equals $c$ on rational cocharacters by exact
  attainment, and then on all real cocharacters by continuity.
  Strict positivity of $c$ away from zero puts zero in its interior.
  Choose a small simplex surrounding zero in that convex hull and approximate its vertices by finite convex
  combinations of actual normalized weights. Sufficiently close approximations still surround zero,
  so the finitely many actual weights in these combinations have zero in their convex hull.
  Lemma 9 now multiplies finitely many corresponding eigensections to produce a nonzero invariant section.

This proves Theorem 2. For an arbitrary torus action, replace $T$ by its effective quotient $T \/
  ker \( T arrow.r "Aut" \( X \) \)$. The entire kernel, including its finite part,
  acts trivially on the natural anticanonical line, so a section invariant under the quotient is invariant under $T$.

== 8 Nef bases and extension of sections <V:sec-nef>

The nef-reduction arguments in Sections 9 and 11 start from twisted anticanonical sections.
  Their common construction is a diagram

$ X arrow.l^p W arrow.r^f Y \, wide a p^(*) L tilde.op D + f^(*) B \, $

where $L = - K_X$, $a$ is a positive integer, $W$ is normal and equidimensional over the smooth base $Y$,
  and $p$ is birational. The divisor $D$ is effective Cartier,
  and above each prime of $Y$ it has coefficient zero on at least one component.
  The line bundle $B$ is the part whose positivity must be established.

On a smooth resolution of $W$, a rank-one hypothesis for every relative adjoint twist identifies the relevant
  sections with powers of the section defining $D$, multiplied by the Jacobian section.
  The bounded maximum metric lemma below states this hypothesis in ordinary and invariant forms.
  It shows that the fiber maximum of the norm of the section defining $D$ gives a locally bounded semipositive
  metric on $B$, hence makes $B$ nef. Nef reduction then identifies its numerical null directions,
  and irregularity zero turns the resulting numerical descent into rational linear descent.

The two applications finish differently. For a prescribed arc, Section 9 proves $v \( D \) =
  0$ and extends first jets at one point of the reduced base;
  this makes its descended line big and yields arbitrarily small normalized arc orders.
  Starting instead with invariant twisted sections, Section 11 extends one nonzero invariant class in a quotient
  of multiplier ideals and obtains an invariant anticanonical section.
  We now prove the model, metric, descent and curvature-concentration statements shared by these constructions.

=== 8.1 Models and connected fibers <models-and-connected-fibers>

The relative section must be normalized over every base divisor.
  For that purpose we use a normal equidimensional model. Its smooth resolution is used for integration,
  and is not required to remain equidimensional.

#thm([Lemma 8.1.])[
  (Equidimensional models).  #emph[Let $X arrow.r.dashed Y$ be a dominant rational map of integral projective
    varieties over $bb(C)$. There are a smooth projective birational model $Y'$ of $Y$ and an integral projective
    flat family $X_0 arrow.r Y'$ with a birational morphism to the graph of the original map.
    Every irreducible component of every fiber has dimension $dim X - dim Y$.
    The normalization $V$ of $X_0$ is equidimensional over $Y'$; in particular,
    every vertical prime divisor of $V$ maps onto a prime divisor of $Y'$.
    If $bb(C) \( Y \)$ is algebraically closed in $bb(C) \( X \)$, the morphism from $V$,
    and from any smooth resolution of $V$, to $Y'$ has connected fibers.
    If a torus acts on $X$ and the rational map is invariant,
    these constructions and a projective resolution of $V$ can be made equivariant, with trivial action on the base.]
] <V:flat-model>

#proof[
  Embed the projective graph over $Y$ in $bb(P)^N times Y$.
    Over the flat open set the fibers define a map to the projective Hilbert scheme
    #cite(label("Grothendieck1961Hilbert")) Theorem 3.2 and the Hilbert-scheme specialization after
    Proposition 3.8. Resolve the closure of its graph, also resolving the base,
    and pull back the universal family. Flatness over an integral base embeds each affine coordinate ring in its
    generic localization. The generic fiber is integral, so these coordinate rings have neither nilpotents nor
    zero divisors. Thus the pulled-back family is integral and is the closure of the original family over the flat
    open set. Its map to the graph is birational.
  Constancy of the Hilbert polynomial bounds the dimension of every fiber above by the generic relative dimension.
    At any fiber component the height bound for the ideal generated by local parameters of the smooth base gives
    the opposite bound. This proves purity of fiber dimension.
    Normalization is finite, so fiber dimensions and dimensions of images of components are preserved.
    A prime divisor mapping into codimension at least two in $Y'$ would have dimension at most $dim Y' -
    2 + \( dim X - dim Y' \) = dim X - 2$, a contradiction.
  For connectedness apply Stein factorization to the normal total space.
    Its finite intermediate base has function field the algebraic closure of $bb(C) \( Y' \)$ in $bb(C) \( X \)$;
    the asserted field condition and normality of $Y'$ make the finite birational morphism an isomorphism.
    The same reasoning applies after resolution. In the equivariant case,
    the family over the original open set is stable under the action.
    Its closure and normalization are therefore stable, and equivariant resolution in characteristic zero supplies
    the last assertion. ◻
]

=== 8.2 A bounded metric from all relative moments <V:sec-maximum>

The two nef-reduction arguments below construct a section of a relative line bundle and normalize its orders over
  base divisors. The purpose of this normalization is analytic:
  it prevents the maximum of the section’s norm on nearby fibers from tending to zero.
  Together with rank one for every relative adjoint twist, it produces a nef line bundle on the base.
  Ordinary and invariant rank one are separate hypotheses in the statement.

#thm([Lemma 8.2.])[
  (Bounded maximum metric).  #emph[Let $X \, Y$ be smooth connected projective varieties, let $L = -
    K_X$ have a smooth semipositive metric $h$, and consider
$ W arrow.r^p X \, wide W arrow.r^f Y \, wide Z arrow.r^r W \, $

 where $W$ is normal integral projective, $p$ is a birational morphism,
   $f$ is surjective and equidimensional with connected general fiber, and $r$ is a smooth projective resolution.
   Write $pi = p r$, $g = f r$ and $E = K_Z - pi^(*) K_X gt.eq 0$.
   Let $B$ be a line bundle on $Y$, let $a in bb(Z)_(> 0)$, and suppose
$ 0 eq.not tau in H^0 \( W \, a p^(*) L - f^(*) B \) $

 has order zero on at least one component above every prime divisor of $Y$.
   Assume that, for every integer $l gt.eq 1$, the ordinary generic adjoint space for $K_(Z \/ Y) + \( a l + 1 \)
   pi^(*) L$ has dimension one and is generated, in base frames, by $s_E \( r^(*) tau \)^l$.
   Then $B$ has a semipositive metric with locally bounded weights.
   On a smooth connected-fiber open set its weight in a frame $beta$ is the continuous plurisubharmonic function
#[#set math.equation(numbering: n => "(8.1)")
 $ phi_beta \( y \) = - log max_(Z_y) \| r^(*) tau thin g^(*) beta \|_(\( pi^(*) h \)^a)^2 . $ <V:sup-weight>]

 In particular, $B$ is nef.]
  #emph[The same conclusion holds with invariant generic rank one in place of ordinary rank one,
    provided an algebraic torus acts compatibly on the diagram with trivial action on $Y$,
    $L$ has its natural linearization, $B$ has trivial linearization, $tau$ is invariant,
    and $h$ is invariant under the maximal compact torus.]
] <V:bounded-maximum>

#proof[
  The point-base case is immediate, so assume $dim Y > 0$. The generic fiber is connected;
    the fibers over a sufficiently small smooth-submersion open set $U$ are therefore connected and smooth,
    hence irreducible. Shrink $U$ so that neither $s_E$ nor $r^(*) tau$ vanishes identically on any fiber.
  Choose frames $beta$ of $B$ and $kappa$ of $- K_Y$ on a base chart. For each $l gt.eq 1$, the relative adjoint section
  $ u_l = s_E g^(*) kappa thin \( r^(*) tau g^(*) beta \)^l $
  generates the relevant generic space. On its locally free base-change locus,
    Berndtsson’s smooth direct-image theorem #cite(label("Berndtsson2009")) Theorem 1.2 applies to the smooth
    semipositive coefficient $\( a l + 1 \) pi^(*) L$. In the invariant case,
    compact averaging is a holomorphic projection on the direct image.
    It is orthogonal for the fiber integral metric, by change of variables and invariance of the coefficient
    metric. Its invariant line is consequently also a metric quotient and inherits semipositive curvature.
    This is the only extra positivity step in the invariant case.
    If the relative dimension is zero, the connected smooth fiber is one point and the same assertion follows
    directly from the coefficient metric.
  Put $b = \| r^(*) tau g^(*) beta \|_(\( pi^(*) h \)^a)^2$,
    and let $d mu_y$ be the smooth nonnegative density of $s_E g^(*) kappa$ with coefficient $pi^(*) L$.
    The preceding positivity gives plurisubharmonicity of
  $ - 1 / l log integral_(Z_y) b^l thin d mu_y . $
  The density has full support on each fiber in $U$. Smooth proper integration extends the displayed function
    across the possible base-change exceptions for this particular $l$, preserving plurisubharmonicity.
    Thus no common base-change locus for infinitely many $l$ is required.
  Normalize each density to mass one. Its $l$-th power mean of $b$ increases to the maximum.
    The maximum is positive and continuous under a proper smooth submersion,
    so this convergence is uniform on compact subsets by monotonicity.
    The logarithm of the mass, divided by $l$, tends uniformly to zero there.
    Passing to the limit proves that (8.1) is plurisubharmonic on $U$.
  It remains to extend the metric over $Y \\ U$. Regularity of $tau$ and properness bound $b$ above over compact
    base charts; hence $phi_beta$ is locally bounded below. At a general point of every boundary prime $Q$,
    choose a component $Gamma$ above $Q$ on which $tau$ has order zero.
    Normality makes $W$ smooth at a general point of $Gamma$.
    We can choose this point so that $tau$ is nonzero and $Gamma arrow.r Q$ is submersive.
    In local coordinates a parameter for $Q$ pulls back to a unit times a positive power of a parameter for
    $Gamma$. Taking a local root of the unit, and completing with the tangential coordinates,
    shows that $f$ is open there. A neighborhood on which the norm of $tau$ is bounded below by a positive
    constant therefore covers a base neighborhood. Surjectivity of $Z arrow.r
    W$ gives the same lower bound for the fiber maximum. Thus $phi_beta$ is locally bounded above near a general
    point of $Q$.
  The removable-singularities theorem for plurisubharmonic functions now extends the weights across the divisors,
    except over a closed analytic set of codimension at least two.
    The Hartogs extension for plurisubharmonic functions removes that set as well.
    More explicitly, choose a small transverse disc whose boundary avoids the missing set and parallel nearby
    discs with boundaries in a fixed compact subset of the complement.
    Outside a proper set of parameters these discs miss the analytic set.
    Their boundary maximum gives a common upper bound, and the submean inequality extends it to the other points
    of the domain. The original lower bounds persist under extension. Finally,
  $ phi_(u beta) = phi_beta - log \| u \|^2 $
  for a nowhere-zero holomorphic function $u$, so the local weights glue to a metric on $B$.
    Restricting the bounded plurisubharmonic weights to the normalization of any curve gives nonnegative degree.
    This proves nefness. ◻
]

The conclusion over the entire base is local boundedness.
  Continuity on the smooth locus is used for the power-mean limit;
  the extension argument does not require continuity at every boundary point.

=== 8.3 Descending through the numerical null directions <descending-through-the-numerical-null-directions>

A nef divisor has degree zero on the general fibers of its nef reduction.
  The next argument upgrades this to every contracted curve,
  which is the hypothesis needed for numerical pullback. Irregularity zero is then used to turn that numerical
  identity into a rational linear identity of line bundles.

#thm([Lemma 8.3.])[
  (Descent of a nef divisor).  #emph[Let $Y$ be smooth connected projective with $q \( Y \) = 0$,
    and let $B$ be a nef Cartier divisor on $Y$. There are smooth connected projective varieties $Y'$ and $Z$,
    a birational morphism $rho : Y' arrow.r Y$, a surjective morphism $h : Y' arrow.r Z$ with connected fibers,
    and a nef rational Cartier divisor $L$ on $Z$ such that
$ rho^(*) B tilde.op_(bb(Q)) h^(*) L . $

 If $dim Z > 0$, every irreducible curve through a very general point of $Z$ has positive $L$-degree.
   After multiplying $B$ and $L$ by one positive integer, $L$ is Cartier and the displayed equivalence is linear.]
] <V:nef-descent>

#proof[
  Apply the nef reduction theorem of Bauer, Campana, Eckl, Kebekus, Peternell, Rams,
    Szemberg and Wotzlaw #cite(label("BCEKPRSW2002")) Theorem 2.1.
    It gives an almost holomorphic dominant map $Y arrow.r.dashed Z_0$ with connected general fibers,
    numerical triviality of $B$ on its compact general fibers,
    and positive $B$-degree for every noncontracted curve through a very general point of $Y$.
    Apply Lemma 10 to its graph, over a smooth projective birational model $Z$ of $Z_0$.
    Write $T arrow.r Z$ for the flat family and $B_T$ for the pullback of $B$.
  We claim that $B_T$ is numerically trivial on every curve in every fiber.
    Almost holomorphicity identifies sufficiently general graph fibers with compact fibers in the domain of the
    original map. Indeed the complement of that domain has smaller relative dimension over a general base point;
    the compact fiber in the domain is already closed, and so acquires no additional points in the graph.
    Thus $B_T$ is numerically trivial on a general fiber.
  Let $d$ be the relative dimension. If $d = 0$ there are no contracted curves on $T$.
    Suppose $d > 0$ and choose an ample Cartier divisor $H$ on $T$. Both $H$ and $H + B_T$ are relatively ample.
    Their top degrees on the fundamental fiber cycles are constant,
    by flatness and the leading coefficients of their Hilbert polynomials, and agree on the general fiber.
    On any fiber the binomial expansion of their difference is a sum of nonnegative mixed intersections.
    Since the fiber has pure dimension $d$, every component $R$ occurs with positive multiplicity; we obtain
  $ B_T dot.op H^(d - 1) dot.op R = 0 wide upright("for every fiber component ") R . $
  If $d = 1$, every integral curve $C subset R$ equals $R$, so its degree is already zero.
    For $d gt.eq 2$, choose $d - 1$ sufficiently high ample hypersurfaces through a prescribed curve $C subset R$.
    Global generation of its twisted ideal permits successive general choices avoiding all existing components not
    contained in $C$, so the final intersection is proper and one-dimensional.
    At the generic point of $C$, their local equations form a system of parameters;
    their intersection multiplicity there is positive. Thus the resulting effective curve cycle contains $C$ with
    positive coefficient, also when $R$ is singular. Its $B_T$-degree is zero,
    and nefness makes every component degree nonnegative. Hence $B_T dot.op C = 0$, as claimed.
  Normalize $T$ and resolve it to $Y'$, with maps $rho : Y' arrow.r Y$ and $h : Y' arrow.r Z$.
    A curve contracted by $h$ either maps to a curve in a fiber of $T$ or maps to a point,
    so $rho^(*) B$ has degree zero on every such curve. The fibers of $h$ are connected,
    by Stein factorization and the connected general fibers of the nef reduction.
    Lehmann’s numerical pullback theorem #cite(label("Lehmann2015")) Theorem 1.2 applies:
    the divisor $rho^(*) B$ is pseudoeffective, is numerically trivial on all contracted curves,
    and the smooth base $Z$ is $bb(Q)$-factorial. It gives $rho^(*) B equiv
    h^(*) L$ for a real numerical divisor class $L$. The pullback map on numerical divisor spaces is defined over
    $bb(Q)$, so the linear equation with rational right-hand side has a rational solution. Choose such an $L$.
    It is nef: for each curve in $Z$, a projective slice of its inverse image gives a curve dominating it,
    and the projection formula gives nonnegative degree.
  Birational invariance gives $q \( Y' \) = 0$. Numerically trivial integral line bundles on a smooth projective
    variety belong to $"Pic"^0$ up to torsion; see #cite(label("Kleiman2005")) Definition 6.1 and Theorem 6.3.
    Therefore the rational numerical equivalence just obtained is a rational linear equivalence.
    Clearing its torsion and denominators gives the asserted integral scaling.
  Finally, choose a very general $z in Z$ and a point $y' in
    h^(- 1) \( z \)$ where $h$ is smooth and $rho$ is an isomorphism,
    such that $rho \( y' \)$ lies outside the countable exceptional union in the nef reduction theorem.
    Such a point exists: for each proper closed exception, the image of its complement contains a dense open
    subset of $Z$; on a very general irreducible fiber, the resulting countably many proper closed subsets cannot
    cover the fiber. Given any curve through $z$, normalize it and slice a component of its inverse image through
    $y'$ to obtain a curve through $y'$ dominating it. Smoothness at $y'$ permits a nonvertical curve germ,
    so the slicing may be chosen to retain that property. Its image in $Y$ is not contracted by the original nef
    reduction. The positivity part of that theorem, followed by the projection formula,
    proves that the given curve has positive $L$-degree. ◻
]

The reduced base now has positive degree on every curve through a very general point.
  We next turn this qualitative condition into an arbitrarily large Seshadri bound after adding a fixed small
  ample term. This will give an isolated logarithmic pole strong enough to detect either a first jet or a nonzero
  quotient class.

We use the following metric conventions in this extension argument.
  If a singular Hermitian metric has squared frame norm $h = e^(- phi)$, its multiplier ideal $cal(I) \( h \)$,
  also denoted $cal(J) \( h \)$, consists of holomorphic germs $u$ for which $\| u \|^2
  e^(- phi)$ is locally integrable. The metric $h e^(- psi)$ has weight $phi + psi$ and curvature $i Theta_h +
  i partial macron(partial) psi$. A quasi-plurisubharmonic function has #emph[neat analytic singularities] if
  locally it has the form $c log sum_j \| f_j \|^2 + u$, where $c > 0$, the $f_j$ are holomorphic and $u$ is smooth.

#thm([Lemma 8.4.])[
  (Concentrating curvature at one base point).  #emph[Let $Z$ be smooth projective of dimension $b > 0$,
    let $L$ be a nef Cartier divisor, and suppose every curve through a very general point of $Z$ has positive
    $L$-degree. Fix a very ample Cartier divisor $H$ and rational $epsilon.alt > 0$.
    For every $c > 0$, all sufficiently large integers $k$ make
$ J_k = 1 / 2 \( k L + epsilon.alt H \) $

 an ample rational divisor with Seshadri constant greater than $c$ at a very general point.
   At any such point $z$ one can choose a smooth positive metric of curvature $eta$ on $J_k$ and a
   quasi-plurisubharmonic function $psi$ with neat analytic singularities, smooth away from $z$, such that
$ eta + i partial macron(partial) psi gt.eq 0 \, wide psi \( w \) lt.eq c log \| w \|^2 + O \( 1 \) $

 in coordinates centered at $z$.]
] <V:sesha>

#proof[
  Fix the countable union of proper closed subsets outside which the curve positivity holds.
    If an integral $d$-dimensional subvariety $U$ is not contained in this union,
    then $L dot.op H^(d - 1) dot.op U$ is a positive integer.
    Otherwise nefness and the cutting-through-a-curve argument in the proof of Lemma 12 would make $L$ numerically
    trivial on $U$, contrary to a curve in $U$ through a point outside the union.
    The mixed term in the binomial expansion consequently gives
  $ J_k^d dot.op U gt.eq 2^(- d) d k epsilon.alt^(d - 1) . $
  Choose $alpha > c$ and then $k$ large enough that this is at least $\( d alpha \)^d$ for every $1 lt.eq d lt.eq
    b$. The theorem of Ein–Küchle–Lazarsfeld #cite(label("EKL1995")) Theorem 3.1,
    applied after clearing rational denominators, gives the required Seshadri bound.
  Choose a rational number $c_0$ strictly between $c$ and the Seshadri constant.
    On the blowup of $z$, the pullback of $J_k$ minus $c_0$ times the exceptional divisor is ample.
    To see ampleness rather than mere nefness, choose $c_0 < c' < epsilon.alt \( J_k \; z \)$;
    a sufficiently small positive exceptional subtraction is ample,
    and the desired divisor is a positive convex combination of that ample divisor and the nef divisor with
    coefficient $c'$. For a sufficiently divisible large integer $p$,
    a basis of sections of $p J_k$ vanishing to order at least $p
    c_0$ at $z$ therefore has no common zero away from $z$. If these sections are $s_j$, put
  $ psi = 1 / p log sum_j \| s_j \|_(h_(J_k)^p)^2 . $
  The curvature inequality follows directly, and the pole with coefficient $c_0 >
    c$ gives the asserted upper bound after shrinking the coordinate neighborhood.
    For $dim Z = 1$ use $J_k - c_0 z$ on the curve. ◻
]

== 9 An approximate transfer theorem for formal-arc orders <V:sec-transfer>

An order along a generically dominant formal arc records vanishing of effective Cartier divisors even when the
  arc’s center is not a closed point. We will transfer bounded orders in a twisted sequence to arbitrarily small
  normalized orders in anticanonical systems.

#thm([Theorem 9.1.])[
  (Approximate arc transfer).  #emph[Let $W$ be smooth connected projective over $bb(C)$, with $q \( W \) = 0$,
    and let $A = - K_W$ admit a smooth semipositive Hermitian metric.
    Let $M$ be a line bundle with $- M$ pseudoeffective. Let $v$ be the order along a formal arc over an extension
    field of $bb(C)$ whose fraction point maps to the generic point of $W$; the trivial order is allowed.
    Suppose there are effective integral divisors
$ N_i tilde.op M + m_i A \, wide 0 < m_1 < m_2 < dots.h.c \, wide v \( N_i \) = O \( 1 \) . $

 For every real $delta > 0$ there are an integer $r > 0$ and an effective integral divisor $N tilde.op r
   A$ with $v \( N \) < delta r$.]
] <V:approximate-arc>

The exact scalar theorem proved earlier yields a stronger conclusion under these hypotheses.
  The proof here explains a different mechanism. A fixed part absorbs none of the prescribed arc order;
  a nef reduction then leaves a base line whose first jets can be extended.
  Bigness of that line supplies sections with arbitrarily small normalized order.
  Both the assumption $q \( W \) = 0$ and the pseudoeffectivity of $- M$ have specific roles in this construction.

#proof[
  The assertion is immediate if $W$ is a point. We assume positive dimension.
    The arc lifts uniquely to every proper birational model, by the valuative criterion.
    We use the same letter $v$ for orders there; orders of effective rational Cartier divisors are finite and
    nonnegative, and are preserved by pullback.
  === The common field and its rank-one fibers <the-common-field-and-its-rank-one-fibers>
  Call the indices $i gt.eq 2$ interior. For each $i$, let $K_i$ be the subfield of $bb(C) \( W \)$ generated by
    ratios of nonzero sections of the same positive multiple of $N_i$.
    We first show that $K_i$ is independent of the interior index.
  For an interior $i$ and any $j$, there is a rational $c > 0$ such that $N_i -
    c N_j$ is rationally linearly equivalent to an effective rational divisor.
    For $j < i$ choose an index beyond $i$, and for $j > i$ choose an earlier index,
    then express $m_i$ as the corresponding strict rational convex combination.
    The same combination of the effective divisors has class $M + m_i A$. The case $i = j$ is immediate.
    Given a ratio of sections of $k N_j$, choose a sufficiently divisible $d$ so that $d N_i -
    k N_j$ has a nonzero section. Multiplying numerator and denominator by that section realizes the same ratio in
    $\| d N_i \|$. Thus $K_j subset K_i$, and the fields for interior indices coincide;
    write $K$ for their common value.
  Choose finitely many of these ratios attaining the transcendence degree of $K$ and place them in one complete
    system $\| d N_(i_0) \|$. Resolve its map and take the Stein factor.
    Its function field $F$ is relatively algebraically closed in $bb(C) \( W \)$ and contains $K$:
    the field of the selected image is contained in $K$ with the same transcendence degree,
    so every element of $K$ is algebraic over it. Apply Lemma 10 and then resolve to obtain
  $ S arrow.r V \, wide f : V arrow.r Y \, wide p : V arrow.r W \, $
  where $Y \, S$ are smooth projective, $V$ is normal equidimensional over $Y$, $p$ is birational,
    and $bb(C) \( Y \) = F$. We also write $f \, p$ for the maps from $S$.
    Set $A_S = p^(*) A$ and $E = K_S - p^(*) K_W gt.eq 0$. The divisor $E$ is exceptional.
    Thus, for a line bundle $Q$ on $W$ and an integer $u gt.eq 0$,
  $ H^0 \( S \, p^(*) Q + u E \) = s_E^u p^(*) H^0 \( W \, Q \) \, $
  by normality of $W$ and extension across codimension two.
  The pullback of the hyperplane bundle from the selected image is big on its Stein factor and remains big after
    modifying the base. It is linearly dominated by $d p^(*) N_(i_0)$.
    The interpolation above therefore shows that a sufficiently divisible multiple of any interior $p^(*)
    N_i$ linearly dominates the pullback of any fixed divisor on $Y$. This remains true on further base modifications.
  For every $l > 0$ and every interior $i$, on the generic fiber one has
  #[#set math.equation(numbering: n => "(9.1)")
   $ h^0 \( S_eta \, l \( p^(*) N_i + E \) \|_(S_eta) \) = h^0 \( S_eta \, l p^(*) N_i \|_(S_eta) \) =
     1 . $ <V:generic-rank-one>]
  Both spaces contain the indicated effective section. If either had two independent sections,
    a sufficiently ample base twist would extend them globally by generation of the twisted direct image.
    The preceding domination clears this twist using a common effective multiplier.
    Their ratio would then be a ratio in a multiple of $p^(*) N_i + E$ and would not belong to $F$,
    by independence over the generic base field. Exceptional pushforward identifies its ratio field with that of
    $N_i$, contradicting $K_i subset F$.
  Rank one now turns interpolation of line bundles into interpolation of horizontal divisors.
    If interior indices $i < j < k$ satisfy $m_j = c m_i + \( 1 - c \) m_k$ with $0 < c < 1$ rational, then
  $ N_j tilde.op_(bb(Q)) c N_i + \( 1 - c \) N_k . $
  Clear denominators and restrict to the generic fiber. The two effective sections belong to the same
    one-dimensional space in (9.1); their ratio is a scalar in $F$ and has no horizontal divisor. Consequently
  $ \( p^(*) N_j \)^(upright("hor")) =
    c \( p^(*) N_i \)^(upright("hor")) + \( 1 - c \) \( p^(*) N_k \)^(upright("hor")) . $
  Fixing two interior indices gives rational horizontal divisors $D_0 \, C_0$ with fixed finite support such that
  $ \( p^(*) N_i \)^(upright("hor")) = m_i D_0 + C_0 quad \( i gt.eq 2 \) . $
  Since the left side is effective for arbitrarily large $m_i$, each coefficient of $D_0$ is nonnegative.
  Take two interior indices $j > i$ and set $G = p^(*) \( N_j - N_i \)$ on $V$.
    Its horizontal part is nonnegative. For each prime divisor $Q$ of $Y$ take the minimum of
  $ frac("coeff"_Gamma G, "coeff"_Gamma f^(*) Q) quad upright("over the components ") Gamma
    upright(" dominating ") Q upright(".") $
  There are only finitely many nonzero minima. Subtracting their pullback makes $G$ effective:
    the equidimensional normal model has no other vertical primes. After clearing denominators this gives
  #[#set math.equation(numbering: n => "(9.2)")
   $ a p^(*) A tilde.op D^V + f^(*) B \, wide a > 0 \, $ <V:base-decomposition>]
  where $D^V$ is effective Cartier, $B$ is Cartier, and over every prime of $Y$ some component has coefficient
    zero in $D^V$. On $S$ put $D = \( D^V \) \|_S$ by pullback. Its horizontal part is $a D_0$.
  For fixed $l gt.eq 0$ and sufficiently large $i$, the horizontal formula gives an effective generic-fiber divisor
  $ R_(i \, l) = \( p^(*) N_i - l D \) \|_(S_eta) gt.eq 0 . $
  Since $a A_S \|_(S_eta) tilde.op D \|_(S_eta)$, multiplication by $s_(R_(i \, l))$ embeds the section spaces of
    $l a A_S$ and $l a A_S + E$ on the generic fiber into those of $p^(*) N_i$ and $p^(*) N_i + E$, respectively.
    The latter spaces have dimension one by (9.1). The former contain $s_D^l$ and $s_E s_D^l$ in base frames,
    so they too have dimension one. For $l = 0$ this also uses connectedness of the generic fiber. In particular,
  #[#set math.equation(numbering: n => "(9.3)")
   $ H^0 \( W \, l a A \) = s_D^l f^(*) H^0 \( Y \, l B \) $ <V:global-sections-base>]
  under pullback to $S$. Indeed any section has this form with a rational base section by the generic-fiber
    statement. On $V$, a pole over a base prime would remain a pole on its coefficient-zero component,
    which is impossible. The rational base section is therefore regular.
    Conversely every section on the right is regular on $S$ and descends to $W$.
  === Removing the fixed divisor from the arc order <removing-the-fixed-divisor-from-the-arc-order>
  Pass to an infinite subsequence with $m_i$ in one residue class modulo $a$, and fix an index $j$ in it.
    For subsequent indices put $l_i = \( m_i - m_j \) \/ a$. Horizontal equality and (9.2) give actual divisor
    identities on $V$
  $ p^(*) N_i = p^(*) N_j + l_i D^V + f^(*) V_i \, wide V_i tilde.op l_i B . $
  To justify the base divisor, subtract first $l_i B$ using the line bundle identification.
    The remaining principal divisor is vertical; its rational function has zero divisor on the proper normal
    generic fiber, and hence belongs to its constant field $F$.
  The negative parts of the $V_i$ are bounded by a fixed effective Cartier divisor $R$ on $Y$.
    For a negative coefficient over $Q$, use a component where $D^V$ has coefficient zero.
    The fixed divisor $p^(*) N_j$ must compensate that coefficient;
    moreover only finitely many such $Q$ can occur. Taking orders yields
  $ v \( N_i \) gt.eq v \( N_j \) + l_i v \( D \) - v \( f^(*) R \) . $
  The left side is bounded and $l_i arrow.r oo$, so $v \( D \) = 0$.
    The remaining task is to find base sections of small normalized order.
  === The base line is nef <the-base-line-is-nef>
  The normalized section $s_D$ on the equidimensional model has order zero on a component over every base prime.
    The preceding generic fiber calculation gives ordinary adjoint rank one for every $l gt.eq 1$,
    with generator $s_E s_D^l$ in base frames. Thus all the hypotheses of Lemma 11 hold with $L = A$, $tau =
    s_(D^V)$ and the base line $B$. It follows that $B$ has a semipositive metric with locally bounded weights,
    and in particular is nef. The fixed divisor has zero arc order;
    it remains to use the nefness of $B$ to construct base sections of small normalized order.
  === Nef reduction and a linearly descended base divisor <nef-reduction-and-a-linearly-descended-base-divisor>
  The base has $q \( Y \) = 0$: pull holomorphic one-forms through a resolution of the dominant rational map $W
    arrow.r.dashed Y$, and use birational invariance of irregularity. Apply Lemma 12 to $B$.
    Lift $S$ further to a smooth model $S'$ mapping to its $Y'$, and compose to obtain $g : S' arrow.r Z$.
    Multiply $a \, D \, B \, L$ by the common integer from that lemma.
    Retain $D$ for its pullback, put $A' = p^(*) A$ and $E' = K_(S') - p^(*) K_W$, and obtain
  $ a A' tilde.op D + g^(*) L \, wide L upright(" Cartier and nef") \, wide v \( D \) = 0 . $
  Equation (9.3), the projection formula, and $h_(*) cal(O)_(Y') = cal(O)_Z$ give for every $l gt.eq 0$
  #[#set math.equation(numbering: n => "(9.4)")
   $ H^0 \( S' \, K_(S') + \( 1 + l a \) A' \) = s_(E') s_D^l g^(*) H^0 \( Z \, l L \) . $ <V:adjoint-sections-base>]
  If $Z$ is a point, the divisor $D$ already proves the theorem. Assume henceforth that $b = dim Z > 0$.
  Choose a very ample $H$ on $Z$. For some integer $m_0 > 0$,
  #[#set math.equation(numbering: n => "(9.5)")
   $ P = m_0 A' - g^(*) H quad upright("is pseudoeffective") . $ <V:pseudoeffective-base-domination>]
  Indeed a multiple of one interior $p^(*) N_i$ linearly dominates $g^(*) H$,
    because the original image polarization is big on the modified base.
    Writing $N_i tilde.op M + m_i A$ and adding the pseudoeffective negative multiple of $p^(*) M$ proves (9.5).
  === Extending first jets and proving bigness <extending-first-jets-and-proving-bigness>
  Take a singular semipositive metric $h_P$ on $P$. Skoda integrability and a finite covering of the compact
    variety $S'$ give a small rational $epsilon.alt > 0$ with $cal(I) \( h_P^epsilon.alt \) = cal(O)_(S')$.
    Use Lemma 13 with $c = b + 1$ to choose $k$, a very general $z in Z$, the ample rational divisor $J = 1 /
    2 \( k L + epsilon.alt H \)$, its smooth metric of curvature $eta$, and $psi$ with
  $ eta + i partial macron(partial) psi gt.eq 0 \, wide psi \( w \) lt.eq \( b + 1 \) log \| w \|^2 + O \( 1 \) . $
  Choose $z$ also so that some $x in g^(- 1) \( z \)$ lies outside $D union E'$ and $g$ is submersive at $x$.
    The image of this nonempty open subset of $S'$ contains a dense base open,
    so the additional condition is compatible with being very general.
  For all sufficiently large $l gt.eq k$ put $m = 1 + l a$ and use
  #[#set math.equation(numbering: n => "(9.6)")
   $ m A' tilde.op_(bb(Q)) k D + g^(*) \( 2 J \) + epsilon.alt P + \( m - k a - epsilon.alt m_0 \) A' .
     $ <V:jet-metric-decomposition>]
  The last coefficient is nonnegative. The divisor metric of $k D$, the smooth metric of $2 J$,
    the metric $h_P^epsilon.alt$, and the smooth semipositive metric on the remaining multiple of $A'$ define a
    singular metric $h_m$ on the integral line bundle $m A'$.
    Rational identifications are interpreted on a common multiple and then rooted.
    Vanishing by $k D$ cancels its divisorial singularity, so
  $ cal(O)_(S') \( - k D \) subset.eq cal(I) \( h_m \) . $
  Put $Psi = g^(*) psi$. Locally $psi = c log sum_j \| f_j \|^2 + u$ with $c > 0$ and $u$ smooth;
    pullback has the same form with $f_j compose g$ and $u compose g$.
    Surjectivity of $g$ prevents it from being identically $- oo$, so it still has neat analytic singularities.
    The two copies of the base curvature in (9.6) give
  $ i Theta_(h_m) + \( 1 + s \) i partial macron(partial) Psi gt.eq 0 wide \( 0 lt.eq s lt.eq 1 \) . $
  The extension theorem of Cao–Demailly–Matsumura #cite(label("CDM2017")) Theorem 1.1 applies on the compact
    Kähler manifold $S'$: $h_m$ may be singular, and $Psi$ has neat analytic singularities.
    Injectivity in degree one, together with the long exact sequence, yields the surjection
  #[#set math.equation(numbering: n => "(9.7)")
   $ H^0 #h(-0.16667em) (S' \, cal(O)_(S') \( K_(S') + m A' \) ⊗ cal(I) \( h_m \)) arrow.r
     H^0 #h(-0.16667em)
     (S' \, cal(O)_(S') \( K_(S') + m A' \) ⊗ frac(cal(I) \( h_m \), cal(I) \( h_m e^(- Psi) \))) .
     $ <V:quotient-surjection>]
  The quotient is supported over $z$, since $Psi$ is smooth elsewhere.
    For any holomorphic local section $sigma$ of $l L$ near $z$,
    the section $s_(E') s_D^l g^(*) sigma$ lies in the larger ideal twist near the entire fiber, because $l gt.eq
    k$. Its quotient class glues with zero off the fiber. Surjectivity and (9.4) produce $u in
    H^0 \( Z \, l L \)$ for which
  $ s_(E') s_D^l g^(*) \( u - sigma \) in cal(O)_(S') \( K_(S') + m A' \) ⊗ cal(I) \( h_m e^(- Psi) \) $
  near $x$. The effective factors are units at $x$, and the local weight of $h_m$ is bounded above.
    Submersion coordinates and Fubini’s theorem therefore imply local integrability downstairs of
  $ \| \( u - sigma \) \( w \) \|^2 \| w \|^(- 2 \( b + 1 \)) . $
  If the first nonzero homogeneous term had degree $d lt.eq 1$,
    integration over a cone of directions where it does not vanish would contain $integral_0^epsilon
    r^(2 d - 2 \( b + 1 \) + 2 b - 1) thin d r$, which diverges. Thus $u - sigma$ vanishes to order at least two.
    First jets of $l L$ are generated at $z$.
  Choose a local frame and prescribe the jets $1 \, w_1 \, dots.h \, w_b$.
    The resulting global sections define ratios with independent differentials at $z$,
    so the associated rational map has image dimension $b$. Consequently $L$ is big.
  === Finishing the order estimate <finishing-the-order-estimate>
  Write $L tilde.op_(bb(Q)) H_1 + C$ with $H_1$ ample rational and $C gt.eq 0$.
    For every sufficiently small rational $gamma > 0$, the rational divisor $\( 1 - gamma \) L +
    gamma H_1$ is ample. A sufficiently divisible basepoint free multiple has a section not vanishing at the
    center of the lifted arc on $Z$, even if this center is not a closed point.
    Indeed global generation gives a section which is a unit in the local ring at that scheme point.
    Dividing its divisor by the multiple gives an effective rational divisor $H_gamma
    tilde.op_(bb(Q)) \( 1 - gamma \) L + gamma H_1$ with $v \( g^(*) H_gamma \) = 0$. Hence
  $ D + g^(*) \( H_gamma + gamma C \) tilde.op_(bb(Q)) a A' \, wide v #scale(x: 120%, y: 120%)[\(] D +
    g^(*) \( H_gamma + gamma C \) #scale(x: 120%, y: 120%)[\)] = gamma v \( g^(*) C \) . $
  After clearing denominators this is the divisor of a section of a positive multiple $r A'$;
    such sections descend to $W$. Its order divided by $r$ is $gamma v \( g^(*) C \) \/ a$,
    which is less than $delta$ for a suitable $gamma$. This completes the proof. ◻
]

== 10 Extremal weights from twisted differential forms <V:sec-extremal>

The transfer theorem becomes equivariant when its arc is a generic one-parameter orbit.
  Its bounded input order comes from the fixed shift between a cohomological weight and the twist of a
  differential form. The output sections approximate every exposed vertex of the anticanonical weight polytope,
  after which multiplication clears the weights.

The cohomological assumptions here are $q \( W \) = 0$ and $chi \( W \, cal(O)_W \) eq.not 0$.
  The virtual character determines the source coefficient directly from this Euler characteristic.
  The rest of the argument follows the source-weight construction of Section 7,
  using pseudoeffectivity of the inverse determinant and approximate arc transfer to approach the vertices.
  Thus the proof does not require vanishing of all the higher structure-sheaf cohomology groups or exact
  attainment of a source weight.

#thm([Proposition 10.1.])[
  #emph[Let $W$ be smooth connected projective with $q \( W \) = 0$ and $chi \( W \, cal(O)_W \) eq.not 0$.
    Suppose $A = - K_W$ has a smooth semipositive Hermitian metric.
    Let an algebraic torus $T$ act faithfully on $W$, and suppose an equivariantly linearized very ample line
    bundle is available. For the natural linearization on $A$,
    there is an integer $r > 0$ with $H^0 \( W \, r A \)^T eq.not 0$.]
] <V:extremal-invariants>

#proof[
  The point case is immediate. In the real character space of $T$ put
  $ cal(P) = "conv" { upright("fiber characters of ") A upright(" on the components of ") W^T } . $
  The fixed locus is nonempty and has finitely many components, so this is a rational polytope.
    Fix an integral cocharacter $lambda : bb(C)^(*) arrow.r T$.
    For a nontrivial action let $S_(+)$ be the source component,
    whose attracting set for parameter tending to zero is dense,
    and let $mu_(+)$ be the $lambda$-weight of $A$ there. The Białynicki-Birula decomposition
    #cite(label("BB1973")) shows that all normal weights at $S_(+)$ are positive and that every other fixed
    component has a negative normal direction. Following such a direction backwards along an orbit moves to a
    component of strictly larger weight for the fixed very ample linearization.
    For any nef linearized line bundle, its weight at the zero end minus its weight at the infinity end is the
    degree on the parametrized orbit $bb(P)^1$ and is nonnegative.
    Iterating the backwards move therefore terminates at the source and gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ mu_(+) = max_(alpha in cal(P)) chevron.l alpha \, lambda chevron.r . $ <V:source-support>]
  Here $S_(+)$ is $T$-stable by uniqueness and contains a $T$-fixed point.
    Faithfulness makes the $lambda$-action nontrivial for every nonzero cocharacter.
    Since the natural anticanonical weight is the sum of tangent weights, $mu_(+) > 0$ for every such cocharacter.
    Rational polyhedral separation implies that $0$ is in the interior of $cal(P)$.
    If $T$ is trivial, use the zero cocharacter, $S_(+) = W$, and $mu_(+) = 0$ in the argument below.
  === The largest cohomological weight <the-largest-cohomological-weight>
  Apply the equivariant holomorphic fixed-point formula #cite(label("AtiyahSegal1968"))
    #cite(label("AtiyahSinger1968")) to the virtual character $sum_j \( - 1 \)^j H^j \( W \, m A \)$.
    A fixed component $U$ contributes
  $ t^(m mu_U) integral_U e^(m c_1 \( A \) \|_U) "td" \( T_U \) product_nu \( 1 - t^(- d_nu) e^(- x_nu) \)^(- 1) \, $
  where $d_nu eq.not 0$ are its normal weights and $x_nu$ the corresponding Chern roots. Expand at infinity.
    A positive $d_nu$ contributes a series with highest exponent zero,
    whereas a negative $d_nu$ contributes only strictly negative exponents.
    Thus for $m gt.eq 0$ the coefficient of $t^(m mu_(+))$ is exactly
  $ Q \( m \) = chi \( S_(+) \, m A \|_(S_(+)) \) . $
  Indeed every other component has a negative normal direction and $mu_U lt.eq mu_(+)$.
    At $m = 0$, the connected torus acts trivially on $H^j \( W \, cal(O)_W \)$:
    it acts trivially on ordinary cohomology by homotopy, hence on its Hodge summands.
    The constant coefficient is therefore $chi \( W \, cal(O)_W \)$.
    It follows that $Q \( 0 \) = chi \( W \, cal(O)_W \) eq.not 0$.
    Riemann–Roch makes $Q$ a polynomial, so it is nonzero for all sufficiently large integers $m$.
  For some fixed $j$, infinitely many $H^j \( W \, m A \)$ therefore contain weight $m mu_(+)$.
    Average a Kähler form over the compact circle of $lambda$.
    Semipositive hard Lefschetz #cite(label("DPS2001")), applied to $\( m + 1 \) A$, gives the equivariant surjection
  $ H^0 \( W \, Omega_W^(n - j) ⊗ \( m + 1 \) A \) arrow.r H^j \( W \, K_W + \( m + 1 \) A \) =
    H^j \( W \, m A \) \, wide n = dim W . $
  The equality uses the natural anticanonical linearization; its shift is $m + 1$.
    Projecting to the desired circle weight gives a nonzero holomorphic eigenform of weight $m
    mu_(+)$ for each of infinitely many $m$.
  === Saturated determinants and the fixed order <saturated-determinants-and-the-fixed-order>
  We use the determinant method of Lazić–Peternell #cite(label("LP2018")) Lemma 4.1 and its anticanonical
    adaptation in #cite(label("LMPTX2023")) Lemma 5.1. Those published statements assume that the twisting line is
    numerically nontrivial. Here the twists are already positive and unbounded,
    so the elementary construction below also handles the numerically trivial case.
    The weights of its wedges, including the rank shift, are computed locally.
  Put $p = n - j$ and take the generic span of these forms as lines in $Omega_W^p$ over $bb(C) \( W \)$.
    Let its rank be $s > 0$. Wedge $s$ generic basis forms. The saturation of the resulting generic line in
    $and.big^s Omega_W^p$ is a line bundle $M$, with its induced $lambda$-linearization.
    More concretely, the wedge has some twist $a_1 A$; removing its common divisorial zero $D_1$ gives $M = D_1 -
    a_1 A$ and a map into $and.big^s Omega_W^p$ nonvanishing in codimension one.
    The saturation is reflexive of rank one, hence invertible on the smooth variety.
    Its map extends across codimension two, and regular generic-line sections factor through it because their
    coefficients have no poles in codimension one.
  The negative divisor $- M$ is pseudoeffective. When $p > 0$,
    the exterior/tensor inclusion places this saturated line in a positive tensor power of $Omega_W^1$.
    The theorem of Lazić–Matsumura–Peternell–Tsakanikas–Xie #cite(label("LMPTX2023")) Theorem 4.1,
    following Ou’s movable-slope theorem #cite(label("Ou2023")) Theorem 1.4,
    applies to the smooth zero-boundary pair with nef anticanonical divisor.
    If $p = 0$, the line is the underlying trivial bundle, so the same conclusion holds directly.
  Complete each eigenform of increasingly large twist to a generic basis using $s -
    1$ members of the fixed finite basis, then take an infinite subsequence with the same choice of these members.
    This gives nonzero eigensections and effective divisors
  #[#set math.equation(numbering: n => "(10.2)")
   $ N_i tilde.op M + m_i A \, wide upright("section weight ") \( m_i - s \) mu_(+) \, wide
     0 < m_1 < m_2 < dots.h.c . $ <V:weighted-determinants>]
  The exponent $m_i$ is the sum of the $s$ form twists $m + 1$; the subtracted $s$ in the weight is therefore essential.
  Let $v$ be the order along the generic orbit arc $t mapsto lambda \( t \) xi$,
    where $xi$ is the generic point regarded as a $bb(C) \( W \)$-valued point.
    Projectivity extends it to $"Spec" bb(C) \( W \) \[ \[ t \] \]$,
    and its fraction point still maps to the generic point. Its center is in $S_(+)$.
    Lemma 8 applies with the declared left action on sections. The order is the fiber weight minus the section weight.
  Writing $mu_M$ for the fiber weight of $M$ on the source, equation (10.2) and Lemma 8 give
  $ v \( N_i \) = mu_M + m_i mu_(+) - \( m_i - s \) mu_(+) = mu_M + s mu_(+) . $
  These are bounded unnormalized orders. Theorem 14 therefore supplies sections of $r A$ with $v \/
    r$ as small as desired.
  === Approximating vertices and multiplying characters <approximating-vertices-and-multiplying-characters>
  Decompose each such section into $T$-weight vectors. At least one nonzero component has order no greater than
    the original section, since the order of a sum is at least the minimum of its summands’ orders.
    If its character is $alpha$, Lemma 8 gives
  $ frac(chevron.l alpha \, lambda chevron.r, r) = mu_(+) - v / r . $
  Every normalized character $alpha \/ r$ of an actual section belongs to $cal(P)$:
    applying nonnegativity of order to each integral cocharacter gives all the rational supporting-half-space
    inequalities from (10.1).
  Choose one integral exposing direction for each vertex of $cal(P)$. In such a direction the maximum is unique.
    Compactness of the polytope then turns approach to the maximal value into approach to that vertex.
    Thus every vertex is a limit of normalized characters of actual sections.
    Since zero is interior, choose finitely many of these normalized characters close enough to the vertices that
    zero remains in their convex hull. Lemma 9 now gives a nonzero invariant section of a positive multiple of
    $A$. For the trivial torus the transfer theorem has already given the required section.
    This proves the proposition. ◻
]

== 11 Invariant conversion by a controlled function field <V:sec-invariant-field>

The preceding method works one cocharacter at a time and then multiplies sections.
  We now give a second nef-reduction argument which keeps invariance throughout.
  Its starting point is a sequence of invariant twisted sections.
  The base is defined by invariant functions with pseudoeffectively controlled poles,
  and the final extension produces one nonzero invariant quotient class directly.
  In particular this argument does not need the jet-generation or weight-polytope steps.

#thm([Theorem 11.1.])[
  #emph[Let $X$ be smooth connected projective with $q \( X \) = 0$, and let $A = -
    K_X$ carry a smooth semipositive Hermitian metric. Let an algebraic torus $T$ act on $X$,
    and use the natural linearization on $A$. Let $G$ be a pseudoeffective $T$-linearized line bundle.
    Suppose that for an unbounded set $I$ of positive integers there are nonzero sections
$ delta_j in H^0 \( X \, j A - G \)^T wide \( j in I \) . $

 Then $H^0 \( X \, m A \)^T eq.not 0$ for some integer $m > 0$.]
] <V:invariant-conversion>

#proof[
  We use the maximal compact torus $T_c$ for averaging. Average the local weights of the given smooth metric using
    the natural linearization of $A$, and call the resulting invariant smooth semipositive metric $h_A$.
    Use its pullbacks on all subsequent models. Define $F subset
    bb(C) \( X \)$ to consist of the invariant rational functions $u$ for which
  #[#set math.equation(numbering: n => "(11.1)")
   $ b A - D_oo \( u \) quad upright("is pseudoeffective for some integer ") b > 0 \, $ <V:controlled-poles>]
  and include zero. Here $D_oo \( u \)$ denotes the effective polar divisor on $X$.
    Sum and product preserve this condition by the usual pole inequalities,
    and inversion preserves it because a rational function’s zero and pole divisors are linearly equivalent.
    Thus $F$ is a field.
  It is relatively algebraically closed in $bb(C) \( X \)$.
    For if $u^d + sum_(i < d) c_i u^i = 0$ with $c_i in F$, then at a pole of $u$ of order $a >
    0$ some term satisfies $"ord" \( D_oo \( c_i \) \) gt.eq \( d - i \) a$.
    Consequently $D_oo \( u \) lt.eq sum_(c_i eq.not 0) D_oo \( c_i \)$. The root is invariant as well:
    the connected torus permutes the finite set of roots trivially. It therefore belongs to $F$.
    The field $F$ is finitely generated over $bb(C)$. Indeed take a transcendence basis $x$ for $F \/
    bb(C)$ and extend it by $z$ to one for $bb(C) \( X \) \/ bb(C)$.
    The finite degree of $bb(C) \( X \) \/ bb(C) \( x \, z \)$ bounds $\[ F : bb(C) \( x \) \]$,
    because $z$ is algebraically independent over $F$. Hence the latter degree is finite.
  Choose a projective model of $F$ and apply Lemma 10 equivariantly.
    Denote the smooth base by $Y$, the normal equidimensional model by $V$,
    and a smooth equivariant resolution by $S$, with maps
  $ p : V arrow.r X \, quad f : V arrow.r Y \, wide p : S arrow.r X \, quad f : S arrow.r Y . $
  The base action is trivial and $f$ has connected fibers. Put $A_S = p^(*) A$ and $E = K_S - p^(*) K_X gt.eq 0$.
    The natural section $s_E$ is invariant; this follows directly from pullback of top forms.
  We record a domination consequence of the definition of $F$.
    For every smooth birational model of $X$ mapping to a smooth projective base $Y_1$ with $bb(C) \( Y_1 \)
    subset F$, and every ample Cartier divisor $H$ on $Y_1$, there is an integer $b > 0$ with
  #[#set math.equation(numbering: n => "(11.2)")
   $ b p^(*) A - f_1^(*) H quad upright("pseudoeffective") . $ <V:field-domination>]
  Choose sections $s_0 \, dots.h \, s_N$ generating $h H$ with $s_0 eq.not 0$. The ratios $s_i \/ s_0$ are in $F$.
    On every prime of the total space, generation ensures that one pulled-back section has zero order, so
  $ "div" \( f_1^(*) s_0 \) lt.eq p^(*) sum_i D_oo \( s_i \/ s_0 \) . $
  The pole inequality is valid also on exceptional primes, since the pole divisor of the pullback of a rational
    function is bounded by the pullback of its polar divisor.
    Sum the pseudoeffective bounds (11.1) and then add $\( h - 1 \) f_1^(*) H$ to obtain (11.2).
  === An invariant relative section with vertical minima <an-invariant-relative-section-with-vertical-minima>
  Choose $r < s$ in $I$. For $j in I$ with $j > s$, the invariant function
  $ u_j = frac(delta_j^(s - r) delta_r^(j - s), delta_s^(j - r)) $
  belongs to $F$. Its poles are bounded by $\( j - r \) "div" \( delta_s \)$, and $s A -
    "div" \( delta_s \) tilde.op G$ is pseudoeffective. At each horizontal prime of $V arrow.r Y$,
    the order of $u_j$ is zero. If $v_j$ denotes the order there of $p^(*) delta_j$, then
  $ \( s - r \) v_j = \( j - r \) v_s - \( j - s \) v_r . $
  Since $v_j gt.eq 0$ for arbitrarily large $j$, we have $v_s gt.eq v_r$.
    Thus the invariant rational section $t = p^(*) \( delta_s \/ delta_r \)$ of $\( s - r \) p^(*)
    A$ has no horizontal pole. If $Y$ is a point, $t$ is regular by normality and descends to $X$,
    proving the assertion.
  Otherwise, over each prime $Q$ of $Y$, take the minimum of $"ord"_Gamma \( t \) \/
    "ord"_Gamma \( f^(*) Q \)$ over components $Gamma$ dominating $Q$.
    Let $k_0$ clear their finitely many nonzero denominators.
    Subtracting the pullback of the resulting Cartier divisor $B$ on $Y$ gives an invariant section
  #[#set math.equation(numbering: n => "(11.3)")
   $ 0 eq.not tau in H^0 \( V \, a p^(*) A - f^(*) B \)^T \, wide a = k_0 \( s - r \) > 0 . $ <V:relative-invariant>]
  It has zero order on at least one component over every base prime.
    There are no vertical primes above higher codimension on $V$,
    so nonnegative orders on these primes and on horizontal primes prove regularity.
    Pull $tau$ to $S$, and write $P_tau$ for its effective divisor.
    Every base line bundle in this construction has trivial linearization.
  === Rank one for the invariant direct image <rank-one-for-the-invariant-direct-image>
  For each $l gt.eq 1$ consider
  $ cal(E)_l = f_(*) \( K_(S \/ Y) + \( a l + 1 \) A_S \) . $
  Over a dense base-change open set its invariant part has rank one.
    To prove the upper bound, twist by a sufficiently ample $H$ on $Y$ so that $H -
    K_Y$ is ample and the twisted direct image is generated. Averaging shows that invariant global sections
    generate the invariant fiber spaces there. The ratio of any two invariant global sections lies in $F$:
    if the denominator has divisor $N$ on $S$, then
  $ N tilde.op a l A_S + E + f^(*) \( H - K_Y \) . $
  Equation (11.2) bounds the last summand pseudoeffectively by a multiple of $A_S$.
    Pushforward to the smooth $X$ preserves pseudoeffectivity and kills $E$,
    so the polar divisor of the ratio on $X$ satisfies (11.1).
    Since all these ratios come from $Y$, the invariant fiber space is at most one-dimensional.
    It is at least one-dimensional, because in local frames $beta$ of $B$ and $tau_Y$ of $- K_Y$ the section
  $ v_l = \( tau f^(*) beta \)^l s_E f^(*) tau_Y $
  is a nonzero invariant relative canonical section with coefficient $\( a l + 1 \) A_S$.
  We can now apply the invariant version of Lemma 11. The action on the base and its line $B$ is trivial,
    $s_E$ is the natural invariant Jacobian section, $tau$ is invariant,
    and the coefficient metric is smooth and compact-invariant.
    The rank-one assertion has been proved for #emph[every] $l gt.eq 1$.
    The lemma therefore gives locally bounded semipositive weights on $B$, so $B$ is nef.
    Notice that this step uses the invariant adjoint rank and the orthogonal averaging projection;
    ordinary rank one has not been assumed.
  === Nef reduction and a nonzero quotient class <nef-reduction-and-a-nonzero-quotient-class>
  Since $Y$ is dominated rationally by $X$, pullback of holomorphic one-forms gives $q \( Y \) = 0$.
    Apply Lemma 12, lift $S$ further equivariantly, and clear the common denominators.
    Retaining $p : S arrow.r X$, $A_S = p^(*) A$, $E = K_S - p^(*) K_X$, and writing $g : S arrow.r Z$,
    we have a nef Cartier divisor $L$ and an invariant section
  $ tau in H^0 \( S \, a A_S - g^(*) L \)^T \, wide P_tau = "div" \( tau \) gt.eq 0 . $
  The line-bundle identification comes from a base with trivial action, so invariance is preserved.
    A zero-dimensional $Z$ finishes the proof by descending $tau$. Otherwise let $b = dim Z > 0$.
  Fix very ample $H$ on $Z$. Equation (11.2), using $bb(C) \( Z \) subset F$,
    gives a pseudoeffective divisor $R_0 = b_0 A_S - g^(*) H$ for some integer $b_0 > 0$.
    Take a $T_c$-invariant semipositive singular metric $h_R$ on it.
    Such a metric is obtained by averaging its local weights relative to an invariant smooth reference metric.
    The quasi-plurisubharmonic potentials have uniformly bounded $L^1$ norm under the compact group,
    so the average is well defined, has semipositive curvature distributionally,
    and gives invariant plurisubharmonic weights. Choose a small rational $epsilon.alt >
    0$ with $cal(I) \( h_R^epsilon.alt \) = cal(O)_S$.
  Apply Lemma 13 with $c = 2 b$. For sufficiently large $k$, the ample rational divisor $B_k = k L +
    epsilon.alt H$ has Seshadri constant at least $4 b$ at very general points.
    Choose such a point $z$ with some $x in g^(- 1) \( z \)$ where $g$ is submersive and $P_tau union
    E$ is absent. Put $beta = 3 b$. The pole construction in the same lemma, applied to $B_k \/ 2$ with $c =
    beta \/ 2$, gives a smooth positive metric of curvature $omega_k \/
    2$ and a function $psi$ with neat analytic singularities, smooth away from $z$, such that
  $ i partial macron(partial) psi gt.eq - 1 / 2 omega_k \, wide psi lt.eq beta / 2 log \| w \|^2 + O \( 1 \) . $
  Give $B_k$ the induced smooth metric of curvature $omega_k$, and put $Psi = g^(*) psi$.
    As in the first-jet argument, surjectivity of $g$ preserves the local analytic-singularity form and prevents
    the pullback from being identically $- oo$. Thus $Psi$ has neat analytic singularities,
    is smooth away from $g^(- 1) \( z \)$, and satisfies
  $ i partial macron(partial) Psi gt.eq - 1 / 2 g^(*) omega_k \, wide Psi lt.eq beta / 2 log \| w \|^2 + O \( 1 \) $
  in transverse base coordinates at the chosen submersion point.
  Choose an integer $p_0 gt.eq k$ sufficiently large, set $m = a p_0$, and use the decomposition
  #[#set math.equation(numbering: n => "(11.4)")
   $ \( m + 1 \) A_S = k \( a A_S - g^(*) L \) + g^(*) B_k +
     epsilon.alt R_0 + \( m + 1 - k a - epsilon.alt b_0 \) A_S . $ <V:invariant-metric-decomposition>]
  The last coefficient is nonnegative. Give the four terms respectively the divisor metric of $tau^k$,
    the indicated smooth base metric, $h_R^epsilon.alt$, and the remaining smooth semipositive metric.
    They define a $T_c$-invariant metric $h_J$ on $J = \( m + 1 \) A_S$ with
  $ i Theta_(h_J) + \( 1 + s \) i partial macron(partial) Psi gt.eq 0 wide \( 0 lt.eq s lt.eq 1 \) . $
  Its multiplier ideal is exactly
  #[#set math.equation(numbering: n => "(11.5)")
   $ cal(I) \( h_J \) = cal(O)_S \( - k P_tau \) . $ <V:fixed-divisor-ideal>]
  Divisibility by the equation of $k P_tau$ is sufficient because the remaining singular factor $h_R^epsilon.alt$
    is integrable. It is necessary at the generic smooth point of each prime divisor:
    the remaining local weights are bounded above, and an uncancelled integral pole already prevents square
    integrability there. The resulting codimension-one divisibility implies divisibility as a holomorphic germ,
    since the local rings of the smooth variety are factorial. This proves (11.5).
  Apply #cite(label("CDM2017")) Theorem 1.1. It gives
  $ H^0 #h(-0.16667em) (S \, cal(O)_S \( K_S + J \) ⊗ cal(I) \( h_J \)) arrow.r
    H^0 (S \, cal(O)_S \( K_S + J \) ⊗ frac(cal(I) \( h_J \), cal(I) \( h_J e^(- Psi) \))) quad
    upright("surjectively") . $
  The quotient is supported over $z$. In a local frame $e_L$ of $L$ near $z$, the section
  $ s_E \( tau g^(*) e_L \)^(p_0) $
  is a section of the larger ideal twist near the whole fiber, because $p_0 gt.eq k$.
    Its quotient class glues with zero away from that fiber and is invariant,
    as the base action and its frame action are trivial. The class is nonzero.
    At $x$ its coefficient is a unit; the local weight of $h_J$ is bounded above,
    while the transverse pole has exponent $beta \/ 2 = 3 b \/ 2 gt.eq b$.
    Thus its squared norm for $h_J e^(- Psi)$ is not locally integrable in the $b$ transverse variables.
  Lift this nonzero class and average the lift over $T_c$. The ideals are invariant, the map is equivariant,
    and averaging preserves the chosen invariant quotient class. We obtain a nonzero invariant section of
  $ K_S + J = m A_S + E . $
  Remove the canonical exceptional factor and push to $X$. It is a section of $m A$ off a codimension-two subset,
    hence extends holomorphically over the smooth $X$. It remains nonzero and $T_c$-invariant,
    therefore $T$-invariant. This proves the theorem. ◻
]

#thm([Corollary 11.2.])[
  #emph[Let $X \, T \, A$ satisfy the geometric hypotheses of Theorem 16.
    If for a fixed $0 lt.eq p lt.eq dim X$ there are nonzero invariant sections of $Omega_X^p ⊗ j
    A$ for an unbounded set of positive integers $j$, then $H^0 \( X \, m A \)^T eq.not 0$ for some $m > 0$.]
] <V:invariant-differentials>

#proof[
  For $p = 0$ the conclusion is part of the assumption. Otherwise use the determinant construction of Section 10,
    now with invariant forms throughout. Form the saturated invariant subsheaf $cal(S) subset
    Omega_X^p$ spanned generically by the chosen forms, and put
    $G = - \( and.big^("rank" cal(S)) cal(S) \)^(* *)$. This is a line bundle on the smooth $X$,
    with its induced linearization. The inclusion into the tensor power of $Omega_X^1$ and
    #cite(label("LMPTX2023")) Theorem 4.1 make $G$ pseudoeffective.
    A form with arbitrarily large twist can be completed to a generic basis using a fixed finite collection of
    forms. Their wedges, followed by the reflexive determinant map, give nonzero invariant sections of $j' A - G$,
    with $j'$ unbounded. Theorem 16 applies. ◻
]

#prodef([Remark 11.3.])[
  Under the geometric hypotheses of Theorem 16, in particular $q \( X \) = 0$,
    this conversion also supplies the nef-reduction route from invariant cohomology.
    The invariant-index theorem #cite(label("CompanionI")) Theorem (Invariant anticanonical index) applies to the
    compact complex manifold $X$ and its maximal compact torus, with the natural linearization of $A = - K_X$.
    It says that the invariant index agrees with a rational polynomial on every positive multiple of some integer,
    and that this polynomial’s value at zero is the actual invariant index at zero.
    The connected torus acts trivially on ordinary cohomology by homotopy and therefore on its Hodge summands.
    Consequently this zero value is $chi \( X \, cal(O)_X \)$.
    If it is nonzero, some fixed $q$ has nonzero invariant $H^q \( X \, m A \)$ for unbounded $m$.
    The compact-averaged hard Lefschetz map with coefficient $\( m + 1 \)
    A$ produces the invariant twisted forms needed by Corollary 17.
    Thus $H^0 \( X \, m A \)^T eq.not 0$ for some $m > 0$ whenever $chi \( X \, cal(O)_X \) eq.not 0$.
    In particular the hypothesis $H^q \( X \, cal(O)_X \) = 0$ for every $q >
    0$ gives the zero index value $1$ and $q \( X \) = 0$. The index theorem and the conversion play separate
    roles: the former retains the actual constant term, whereas the latter produces an invariant section without
    presuming an equivariant version of an ordinary nonvanishing criterion.
] <V:invariant-index-application>

The compact-factor application of these invariant conclusions is given in the descent section.
  Only the geometric structure and finite-cover norm are needed there;
  neither of the proofs above uses the headline nonvanishing theorem.

== 12 Controlled prime divisors and invariant section rings <V:controlled-cone-section>

Exact order preservation studies one valuation at a time.
  We now give a different finite-generation argument, in which the entire character of a section is retained.
  The geometric input is a smooth connected rationally connected projective variety $V$,
  an algebraic torus $T$ acting on $V$, and a smooth semipositive metric on $L = - K_V$.
  We always use the natural linearization of $L$. Rational connectedness supplies $H^i \( V \, cal(O)_V \) =
  0$ for $i > 0$ and $"Pic"^0 \( V \) = 0$. Put $n = dim V$.
  If $V$ is a point, its constant section proves the desired nonvanishing; assume below that $dim V > 0$.

Our first aim is to put a finite bound on a collection of divisor classes.
  Call a prime divisor $D$ on $V$ #emph[controlled] if $a L - D$ is pseudoeffective for some integer $a > 0$.
  An effective integral divisor supported on controlled primes is itself dominated by a positive multiple of $L$:
  add the finitely many domination relations, with their multiplicities.
  Conversely, each component of a dominated effective integral divisor is controlled.

We retain linearizations in this bound. Write $"Pic"^T \( V \)_(bb(Q))$ for the group of linearized line bundles
  tensored with $bb(Q)$. It is finite dimensional. Indeed, $"Pic"^0 \( V \) =
  0$ makes the ordinary rational Picard group finite dimensional,
  and the kernel of forgetting a linearization is the character lattice of $T$.
  Every line bundle becomes linearizable after a positive power.
  To see this first for an ample line, a very ample power gives a projective representation of the torus,
  which lifts after a further power. Write an arbitrary line as a difference of ample lines to obtain the general
  assertion.

For an invariant rational divisor $D$, denote its divisor linearization by $\[ D \]^T$;
  its canonical rational section is invariant. We regard a character $eta$ as the corresponding linearization of
  the trivial line. With the left action on sections, an eigensection of a linearized line $B^T$ of character
  $eta$ has zero divisor of linearized class $B^T - eta$.

#thm([Proposition 12.1.])[
  (Finite cone of controlled invariant divisors).  #emph[Let $V$ be smooth, connected,
    rationally connected and projective over $bb(C)$. Suppose that $L = - K_V$ has a smooth semipositive metric,
    and let an algebraic torus $T$ act on $V$. There is a rational polyhedral cone in $"Pic"^T \( V \)_(bb(R))$
    generated by classes of invariant effective rational divisors and containing $\[ D \]^T$ for every invariant
    prime $D$ for which $a L - D$ is pseudoeffective for some integer $a > 0$.]
] <V:controlled-cone>

The generators are effective but need not be controlled. To prove Proposition 19,
  we first show that all but finitely many controlled primes come from divisors on a common base.
  We then construct an adjoint ring whose invariant generators control the rational pullbacks of every invariant
  effective divisor on that base. An auxiliary boundary makes finite generation possible and disappears under
  rational pullback to $V$.

=== 12.1 The field of functions with controlled poles <the-field-of-functions-with-controlled-poles>

Let $P$ consist of zero and the rational functions whose poles are supported on controlled primes of $V$.
  Sums and products stay in $P$. If $u eq.not 0$ belongs to $P$,
  its zero divisor is linearly equivalent to its polar divisor, hence is dominated by a multiple of $L$.
  Thus $u^(- 1) in P$ as well. This proves that $P$ is a $T$-stable subfield of $bb(C) \( V \)$.

The field is relatively algebraically closed. In fact, if $u$ is algebraic over $P$ and had a pole at an
  uncontrolled prime, all coefficients of a monic equation for $u$ would have nonnegative order there.
  Its leading power would then have strictly smaller order than every other term, which is impossible.
  Also $P$ is finitely generated over $bb(C)$. For completeness, choose a transcendence basis $t_1 \, dots.h \,
  t_d$ for $P \/ bb(C)$ and extend it to a transcendence basis of $bb(C) \( V \)$.
  The algebraic closure of $bb(C) \( t_1 \, dots.h \, t_d \)$ inside this finitely generated field is finite over
  $bb(C) \( t_1 \, dots.h \, t_d \)$, so its intermediate algebraic extension $P$ is finite too.

Choose controlled primes $D_1 \, dots.h \, D_s$ spanning the classes of all controlled primes in
  $"Pic" \( V \)_(bb(Q))$. If a controlled prime $D$ is not among them,
  clearing denominators and torsion gives a principal divisor supported on $D \, D_1 \, dots.h \,
  D_s$ whose coefficient at $D$ is nonzero. Its defining function belongs to $P$.
  Thus the valuation of $D$ is nontrivial on $P$, and $D$ is vertical for any rational map with target field $P$.
  In particular, only finitely many controlled primes can be horizontal.
  If $P = bb(C)$, this proves Proposition 19 directly: there are only finitely many controlled primes,
  and we take the cone of the invariant ones.

Suppose $"trdeg"_(bb(C)) P > 0$. Choose a smooth projective equivariant model $Y$ of $P$ and an equivariant diagram

#[#set math.equation(numbering: n => "(12.1)")
 $ V arrow.l^pi U arrow.r^f Y \, wide bb(C) \( Y \) = P \, $ <V:controlled-model>]

with $U$ smooth projective and $pi$ birational. We require that the strict transform of each prime of $V$ either
  dominate $Y$ or map onto a prime divisor of $Y$. Here is a construction with this property.

Finitely many generators of $P$ have a common controlled polar bound $N gt.eq 0$.
  A sufficiently large full linear system of a multiple of $N$ contains these generators as ratios,
  and every ratio of its sections still has controlled poles.
  After linearizing a multiple, its image is an equivariant projective model with function field $P$.
  Over a dense open, the closures in $V$ of the fibers form a flat family.
  Resolve equivariantly the graph of its rational map to the Hilbert scheme and pull back the universal family.
  This uses the Hilbert-family and flattening constructions of Grothendieck and Raynaud–Gruson
  #cite(label("Grothendieck1961Hilbert")) #cite(label("RaynaudGruson1971")).
  Flatness with fixed Hilbert polynomial bounds fiber dimension by $dim V - dim Y$.
  The main component is birational to $V$. A divisor coming from $V$ therefore cannot map to codimension at least
  two: that would force its generic fiber dimension to exceed this bound.
  Resolve the total space equivariantly; strict transforms retain the asserted images.
  Relative algebraic closedness of $P$ makes $f$ have connected fibers by Stein factorization.
  Pullback of holomorphic one-forms, followed by birational invariance, gives $"Pic"^0 \( Y \) = 0$.

Define rational pullback of divisors and linearized line bundles by

$ p^diamond.stroked.small = pi_(*) f^(*) . $

For line bundles, one can equivalently pull back on the big open set where $V arrow.r.dashed
  Y$ is defined and extend reflexively across codimension two.
  Since $V$ is smooth, this extension is a line bundle; the equivariant structure extends uniquely.
  If $sigma : Y' arrow.r Y$ is a smooth birational modification,
  resolve the diagram above it and use the same notation. Then $p^diamond.stroked.small$ commutes with $sigma^(*)$
  and kills $sigma$-exceptional divisors, including their divisor linearizations.
  Indeed, a prime of $V$ above such a divisor would have image of codimension at least two on $Y$,
  contrary to the model property. That property persists over $Y'$:
  a horizontal prime remains horizontal, and a prime mapping onto a divisor of $Y$ maps onto its strict transform,
  because $sigma$ is an isomorphism at its generic point.

We can now reduce the proposition to a statement about divisors on $Y$.
  On a nonempty Zariski open subset of $Y$, the morphism $f$ is smooth with geometrically connected,
  hence geometrically integral, fibers. If the generic point of a prime $Q$ lies in this open,
  exactly one prime of $U$ dominates $Q$, and its multiplicity in $f^(*) Q$ is one.
  Every other component of $f^(*) Q$ maps into a smaller subset of $Y$;
  by the model property it is exceptional over $V$ and pushes to zero.
  Consequently, if a prime $D$ of $V$ maps onto such a $Q$, then

$ p^diamond.stroked.small Q = D . $

The controlled primes not covered by this statement form a finite set:
  they are the finitely many horizontal controlled primes already identified and the finitely many primes over the
  excluded base divisors. If $D$ is invariant, its image $Q$ is invariant,
  and the equality also holds for their divisor linearizations.

It therefore remains to find a rational polyhedral cone of invariant effective classes containing
  $p^diamond.stroked.small \[ R \]^T$ for every invariant effective integral divisor $R$ on $Y$.
  Adding the classes of the finitely many invariant controlled exceptions will finish the proof.
  We may construct this cone on any smooth equivariant modification $sigma : Y' arrow.r Y$:
  the effective total transform $sigma^(*) R$ has its canonical divisor linearization,
  and $p^diamond.stroked.small \[ sigma^(*) R \]^T = p^diamond.stroked.small \[ R \]^T$.

#thm([Lemma 12.2.])[
  #emph[For the diagram (12.1) and any very ample divisor $H$ on $Y$, some integer $a > 0$ satisfies
#[#set math.equation(numbering: n => "(12.2)")
 $ a pi^(*) L - f^(*) H quad upright("pseudoeffective") . $ <V:controlled-domination>]

 If $E = K_(U \/ V)$, then
#[#set math.equation(numbering: n => "(12.3)")
 $ "rank" f_(*) cal(O)_U \( E \) = 1 . $ <V:controlled-rank>]

 Moreover there is an invariant effective integral divisor $J$ with
#[#set math.equation(numbering: n => "(12.4)")
 $ \( f_(*) cal(O)_U \( E \) \)^(* *) = cal(O)_Y \( J \) \, wide p^diamond.stroked.small \[ J \]^T = 0 \,
   $ <V:controlled-J>]

 where the first identification uses the canonical inclusion of constants.]
] <V:controlled-rank-metric-data>

#proof[
  The homogeneous coordinate ratios for $H$ belong to $P$, so they have a common controlled polar bound $N$.
    On $U$ the corresponding sections have a common factor and define $f$; hence $pi^(*) N -
    f^(*) H$ is linearly equivalent to an effective divisor. Combine this with the pseudoeffectivity of $a L - N$.
  Twist $f_(*) cal(O)_U \( E \)$ by a large multiple $b H$ so that its global sections span its generic fiber.
    Divide these sections by the Jacobian section of $E$ and by a fixed rational frame with divisor $b H$.
    The resulting rational functions on $U$ have poles bounded by $E + f^(*) \( b H \)$.
    Their pushdowns to $V$ have no poles contributed by $E$; the remaining polar divisor is bounded by
    $p^diamond.stroked.small \( b H \)$. The preceding common-factor argument shows that this effective divisor is
    controlled. Thus all these functions belong to $P = bb(C) \( Y \)$,
    and their span over $P$ has dimension at most one. The Jacobian section is nonzero, proving (12.3).
  The inclusion of constants makes the rank-one reflexive hull $cal(O)_Y \( J \)$ for an effective integral
    divisor $J$. Every construction is equivariant, so $J$ is invariant.
    If a base prime $Q$ has a component above it that is not $pi$-exceptional, $E$ has coefficient zero there.
    A rational function on the base with a pole at $Q$ cannot therefore represent a local section of $f_(*)
    cal(O)_U \( E \)$. Its coefficient in $J$ is zero. The remaining components of $J$ have only exceptional
    preimages, which proves the second identity in (12.4). ◻
]

The field construction has now supplied a rank-one adjoint image and an exceptional correction $J$.
  We next use smooth semipositivity on $V$ to produce a strictly positive metric on $- K_Y + J$.
  Its integrable object will be the canonical section of $J$,
  which is the precise input needed for weighted approximation.

=== 12.2 The weighted metric and its disappearing boundary <the-weighted-metric-and-its-disappearing-boundary>

By (12.2), $pi^(*) L$ has a singular metric whose curvature dominates a positive multiple of $f^(*) omega_H$.
  Mix its weight with the pulled-back smooth semipositive weight,
  using a sufficiently small positive coefficient for the singular term.
  Skoda’s local integrability theorem #cite(label("Skoda1972")) and compactness give a metric $h$ such that

#[#set math.equation(numbering: n => "(12.5)")
 $ Theta_h \( pi^(*) L \) gt.eq epsilon.alt f^(*) omega_H \, wide cal(J) \( h \) = cal(O)_U \, wide
   epsilon.alt > 0 . $ <V:controlled-upstairs-metric>]

The identity

$ K_(U \/ Y) + pi^(*) L = E - f^(*) K_Y $

identifies the reflexive hull of the adjoint direct image with $- K_Y + J$.
  Apply the singular direct-image metric theorem of Păun–Takayama #cite(label("PT2018")) Theorem 3.3.5.
  Its multiplier-ideal inclusion is an isomorphism here by (12.5).
  The rank-one fiber integral therefore gives a singular metric with weights $phi$ on $- K_Y + J$,
  extending across divisors and then across codimension two. It has curvature at least $epsilon.alt omega_H$:
  locally subtract a potential of this form from the coefficient weight before applying positivity,
  and restore it afterward.

For clarity, its required integrability follows directly from the same integral.
  The section induced by the Jacobian section of $E$ is represented by $s_J$ in a local frame of the reflexive
  hull. Integrating its squared fiber norm against base coordinate volume gives the integral upstairs of the
  corresponding canonical-valued form with coefficient metric $h$.
  This is finite by $cal(J) \( h \) = cal(O)_U$ and properness.
  Fiber integration on the smooth locus, which has full measure, proves

#[#set math.equation(numbering: n => "(12.6)")
 $ \| s_J \|^2 e^(- phi) in L_(upright("loc"))^1 \( Y \) \, wide
   cal(J) \( phi \) supset.eq cal(O)_Y \( - J \) . $ <V:controlled-weighted-integral>]

This is the weighted input of #cite(label("CompanionE")) Theorem (Weighted anticanonical approximation).
  It does not require an unweighted integrability assertion for $e^(- phi)$.

We record the complete output of that theorem at this use.
  A power of an ample line on $Y$ is $T$-linearizable, since $"Pic"^0 \( Y \) = 0$;
  the zero divisor of an eigensection of a very ample power is invariant and ample.
  Choose a small positive rational multiple $A$ of this divisor so that $B = - K_Y + J -
  A$ still has a strict curvature bound. Resolve the full system of a sufficiently divisible $r
  B$ together with $J$ by an equivariant sequence of smooth blowups $sigma : Y' arrow.r Y$ and write

$ sigma^(*) \| r B \| = G + \| upright("Mov") \| \, $

with the mobile system base-point free. Weighted approximation gives

#[#set math.equation(numbering: n => "(12.7)")
 $ Psi = G \/ r - sigma^(*) J - K_(Y' \/ Y) \, wide "coeff" Psi < 1 . $ <V:controlled-signed-boundary>]

Writing $Psi = Psi^(+) - Psi^(-)$ with disjoint positive and negative parts, put $D_0 = Psi^(-)$. Then

#[#set math.equation(numbering: n => "(12.8)")
 $ D_0 tilde.op_(bb(Q)) K_(Y') + Psi^(+) + upright("Mov") \/ r + sigma^(*) A . $ <V:controlled-adjoint>]

Here $Psi^(+)$ is an effective simple-normal-crossings klt boundary,
  and the last two summands are nef and big together. The support of $D_0$ is contained in that of $sigma^(*)
  J$ and the exceptional divisor of $sigma$. The divisors $G \, K_(Y' \/ Y) \, Psi^(+) \,
  D_0$ are invariant and the free system $\| upright("Mov") \|$ is torus-stable.
  Identity (12.8) is an ordinary rational linear equivalence;
  we construct the needed linearized classes separately below.

The support statement has the crucial additional consequence

#[#set math.equation(numbering: n => "(12.9)")
 $ p^diamond.stroked.small \[ D_0 \]^T = 0 . $ <V:controlled-D0-zero>]

Indeed $p^diamond.stroked.small$ kills the effective divisor $sigma^(*) J$ by (12.4),
  and it kills every $sigma$-exceptional prime by the model property.
  An effective divisor supported on this union has zero pushdown.
  Its canonical invariant section also pushes to the constant rational section,
  so the equality includes the linearization. No character shift is lost in (12.9).

=== 12.3 The multigraded ring and the finite cone <the-multigraded-ring-and-the-finite-cone>

We now build the cone of base pullbacks required above. Let $R_0$ be any invariant effective integral divisor on
  $Y'$. Since $\[ D_0 \]^T$ disappears under $p^diamond.stroked.small$, the divisor $D_0 +
  t R_0$ for a small rational $t > 0$ has the same rational pullback class as $t R_0$.
  We will place these divisors in a finite multigraded ring and express their invariant sections through its
  generators. This is why we need a whole neighborhood of $\[ D_0 \]^T$ in the linearized Picard space,
  rather than just the single adjoint ring of $D_0$.

Because $sigma$ is a sequence of smooth blowups, there is an effective exceptional rational divisor $F$ with $-
  F$ relatively ample. One constructs it successively by giving sufficiently small positive coefficients to the
  later exceptional divisors. For small rational $delta > 0$, $sigma^(*) A - delta F$ is ample and $Psi^(+) +
  delta F$ is still a klt boundary with simple normal crossings. If $sigma$ is the identity, take $F = 0$.
  Thus (12.8) expresses $D_0$ as $K_(Y')$ plus that boundary and an ample rational class.

Choose a fixed small ample rational part $A_(*)$. Every rational class in a sufficiently small neighborhood of the
  underlying class of $D_0$ can be written

$ K_(Y') + A_(*) + Delta_i \, $

with $Delta_i gt.eq 0$ and klt. For a finite set of classes,
  choose general members of sufficiently divisible very ample systems for the remaining ample parts,
  divided by their multiples. They can be chosen transverse to one another and to the fixed boundary,
  with coefficients less than one. Consequently their union has simple normal crossings.
  Small character changes only change linearizations, so the same construction gives a neighborhood in
  $"Pic"^T \( Y' \)_(bb(R))$.

Choose rational vertices $U_1^T \, dots.h \, U_s^T$ of a polytope with $\[ D_0 \]^T$ in its interior.
  After a common multiple $k$, let $cal(E)_i$ be integral linearized representatives of $k U_i^T$. The ordinary ring

#[#set math.equation(numbering: n => "(12.10)")
 $ R = xor.big_(bold(ell) in bb(N)^s) H^0 #h(-0.16667em) (Y' \, ⨂_(i = 1)^s cal(E)_i^(⊗ ell_i)) $ <V:controlled-ring>]

is finitely generated by the multigraded adjoint-ring theorem of Cascini–Lazić #cite(label("CasciniLazic2012"))
  Theorem A; compare #cite(label("CortiLazic2013")) Theorem 3.2(1).
  We take $k$ sufficiently divisible to turn the rational linear equivalences above into isomorphisms of line
  bundles. This identifies (12.10) with a divisible subring of the stated adjoint ring.
  The linearizations give an algebraic $T$-action on $R$, independently of the general boundary representatives
  used to prove finite generation.

Here is the invariant-ring step explicitly. Enlarge finitely many multihomogeneous generators of $R$ to their
  finitely many character components. They define an equivariant multigraded surjection from a polynomial ring to
  $R$. Projection to weight zero is exact for a torus, so the invariant polynomial ring surjects onto $R^T$.
  If the variable weights are $eta_1 \, dots.h \, eta_N$, its invariant monomials have exponents

$ \( a_1 \, dots.h \, a_N \) in bb(N)^N \, wide sum a_i eta_i = 0 . $

These are the lattice points of a rational polyhedral cone;
  Gordan’s lemma makes their semigroup finitely generated. Thus $R^T$ has finitely many nonzero multihomogeneous
  generators $u_1 \, dots.h \, u_b$.

Let $cal(C)_0$ be the cone generated by the rational pullbacks $p^diamond.stroked.small \[ "div" \( u_j \) \]^T$.
  These are classes of invariant effective divisors on $V$.
  We claim that $cal(C)_0$ contains $p^diamond.stroked.small \[ R_0 \]^T$ for #emph[every] invariant effective
  integral divisor $R_0$ on $Y'$. Choose a small rational $t > 0$ such that $\[ D_0 \]^T +
  t \[ R_0 \]^T$ belongs to the vertex polytope. Express it as a rational convex combination of the $U_i^T$.
  Clearing denominators and torsion gives an equivariant isomorphism between a positive multiple of $D_0 +
  t R_0$ and one multidegree in (12.10). Its canonical section gives a nonzero element of $R^T$ in that
  multidegree. Express it as a polynomial in the $u_j$ and retain the terms of that multidegree.
  At least one nonzero monomial occurs, and its degree is a nonnegative integral sum of generator degrees.
  Thus the corresponding linearized class lies in their cone.
  Only equality of homogeneous degrees is used here; the selected monomial need not have the same zero divisor as
  the original section. Apply $p^diamond.stroked.small$, use (12.9),
  and divide by the positive factor containing $t$. This proves the claim.

Apply this claim to the total transforms of invariant effective divisors on the original base $Y$.
  Compatibility of $p^diamond.stroked.small$ with $sigma^(*)$ gives the required cone of their rational pullbacks.
  Add the invariant effective classes of the finitely many controlled primes excluded in the initial comparison
  with base divisors. The resulting rational polyhedral cone proves Proposition 19.

=== 12.4 A weight bound and character separation <a-weight-bound-and-character-separation>

The cone gives finitely many effective generators. To obtain an invariant anticanonical section,
  we must still put the #emph[specified natural linearization] of $L$ in their cone.
  The following fixed-point calculation supplies the sign needed for separation.
  It is a bound on some cohomology weight, rather than the weight-zero index theorem.

#thm([Lemma 12.3.])[
  #emph[Let $V$ be smooth connected projective with $H^i \( V \, cal(O)_V \) = 0$ for $i > 0$, and let $v :
    bb(G)_m arrow.r "Aut" \( V \)$ be an algebraic action. Give $L = - K_V$ its natural linearization.
    There is a constant $C$ such that, for every sufficiently large integer $m$,
    some $H^q \( V \, m L \)$ has a $v$-weight at most $C$.]
] <V:bounded-above-weight>

#proof[
  If the action is trivial, all weights are zero and the ordinary Riemann–Roch polynomial $chi \( V \, m L \)$ has
    constant term one, so the assertion follows. Otherwise use the holomorphic fixed-point formula of Atiyah–Bott,
    in its fixed-component equivariant index form #cite(label("AtiyahBott1968")) #cite(label("AtiyahSegal1968"))
    #cite(label("AtiyahSinger1968")). For a fixed component $Z$,
    let $a$ be the nonzero weights of its normal tangent bundle, with Chern roots $x_(a \, j)$.
    The anticanonical fiber weight is $b_Z = sum_(a \, j) a$.
    Its contribution to the alternating cohomology character is
  $ t^(m b_Z) integral_Z e^(m c_1 \( L \|_Z \)) "td" \( Z \)
    product_(a \, j) \( 1 - t^(- a) e^(- x_(a \, j)) \)^(- 1) . $
  The integral is a finite cohomological expansion. Denote the alternating sum of the cohomology characters by
    $chi_v \( V \, m L \)$. Grouping by $b_Z$ writes it as
  #[#set math.equation(numbering: n => "(12.11)")
   $ chi_v \( V \, m L \) = sum_b t^(m b) R_b \( m \, t \) \, $ <V:weight-windows>]
  where each $R_b$ is polynomial in $m$ with rational functions of $t$ as coefficients.
  At $m = 0$, the left side is one. As $t arrow.r 0$, each component having a positive normal tangent weight has
    contribution tending to zero; the other components have $b_Z lt.eq 0$.
    Hence at least one $b lt.eq 0$ has $R_b \( 0 \, t \) eq.not 0$.
    Multiply (12.11) by one fixed nonzero Laurent polynomial clearing the denominators of every coefficient.
    For the selected $b$, the exponents lie in $m b + \[ - C_0 \, C_0 \]$.
    Some coefficient is a nonzero polynomial in $m$, so this block is nonzero for all large $m$.
    The finitely many windows for different $b$ are disjoint for large $m$.
    Thus the multiplied character has a nonzero exponent bounded above independently of $m$.
    Removing a fixed Laurent-polynomial factor changes the minimum exponent only by a fixed number.
    The original virtual character therefore has such an exponent too,
    and it occurs in at least one actual cohomology group. ◻
]

We now obtain an independent proof of the rationally connected special case of Theorem 2.
  Its additional output is the controlled-divisor cone just constructed.
  The proof uses that cone and character separation, and will supply the fiberwise section in the locally constant
  MRC application of Section 14.

#thm([Theorem 12.4.])[
  #emph[Let $V$ be a smooth connected rationally connected projective complex variety with smoothly semipositive
    $- K_V$. For every algebraic torus $T$ acting on $V$, there is an integer $m > 0$ such that
$ H^0 \( V \, - m K_V \)^T eq.not 0 $

 with the natural anticanonical linearization.]
] <V:controlled-invariant-nonvanishing>

#proof[
  Let $cal(C)$ be the cone in Proposition 19. Suppose $L^T in.not cal(C)$.
    Rational polyhedral separation gives a rational functional $lambda$ on the linearized Picard space with
  $ lambda \( L^T \) > 0 \, wide lambda \( cal(C) \) lt.eq 0 . $
  After positive rescaling, its restriction to characters is pairing with a cocharacter $v : bb(G)_m arrow.r T$,
    possibly zero. Lemma 21 gives cohomology classes with $v$-weights uniformly bounded above and with unbounded
    positive $m$.
  Average a Kähler form and the smooth metric over the maximal compact torus.
    Smooth-coefficient hard Lefschetz then gives the equivariant surjection
  $ H^0 \( V \, Omega_V^(n - q) ⊗ \( m + 1 \) L \) arrow.r H^q \( V \, K_V + \( m + 1 \) L \) = H^q \( V \, m L \) . $
  This is the smooth case of the Demailly–Peternell–Schneider theorem #cite(label("DPS2001")) Theorem 0.1.
    The coefficient shift $m + 1$ and its equivariant identification use the natural action on $L$.
    Pass to a subsequence with fixed $p = n - q$, and choose $T$-eigensections $alpha_m$ of
    $Omega_V^p ⊗ \( m + 1 \) L$ whose $v$-weights are bounded above.
  Take the generic span of their untwisted lines in $Omega_V^p$, of rank $s$,
    and saturate its determinant to a line bundle $M subset.eq and.big^s Omega_V^p$.
    This line inherits a $T$-linearization. The inverse-determinant pseudoeffectivity theorem of
    Lazić–Matsumura–Peternell–Tsakanikas–Xie #cite(label("LMPTX2023")) Theorem 4.1,
    following Ou’s generic nefness theorem #cite(label("Ou2023")) Theorem 1.4, gives $- M$ pseudoeffective.
    Its hypotheses apply because $V$ is smooth projective and $- K_V$ is nef;
    the exterior construction is a direct summand of a cotangent tensor power,
    and saturation of the line persists in that summand. If $p = 0$, $M = cal(O)_V$ instead.
  Choose finitely many $alpha_m$ forming a generic basis. Each further nonzero $alpha_m$ can be completed to a
    generic basis using this fixed set. Their wedge gives a nonzero eigensection of $M + k L$,
    for unbounded positive $k$, whose $v$-weight is still bounded above.
    The wedge lands in $M + k L$ by saturation in codimension one and reflexive extension.
    Let $D_k$ be its divisor and $eta_k$ its character. Then $k L - D_k$ has class $- M$,
    so each component of $D_k$ is controlled. Each is also invariant,
    because $T$ is connected and $D_k$ is the zero divisor of an eigensection.
    Consequently $\[ D_k \]^T in cal(C)$. On the other hand,
  $ lambda \( \[ D_k \]^T \) = lambda \( M^T \) + k lambda \( L^T \) - chevron.l eta_k \, v chevron.r > 0 $
  for large $k$, a contradiction.
  Thus $L^T in cal(C)$. A real nonnegative expression in its finitely many rational generators admits a rational
    nonnegative expression. Clear denominators and torsion in the linearized Picard group and multiply the
    canonical invariant sections of these effective divisors.
    The product is nonzero since $V$ is integral, and is a section of a positive multiple of the naturally
    linearized $L$. If $L^T$ is zero in the rational class space,
    clearing its torsion gives the constant invariant section directly. ◻
]

== 13 Descent with compact isometric monodromy <V:isometric-descent>

We first apply the invariant results when the residual monodromy lies in a compact torus.
  The geometric structure is supplied by the finite-cover theorem of #emph[Anticanonical nonvanishing from smooth
  semipositivity] #cite(label("CompanionH")) Theorem 2.1, based on Demailly–Peternell–Schneider and
  Campana–Demailly–Peternell #cite(label("DPS1996")) #cite(label("CDP2015")).
  Its nonvanishing theorem is not used in the argument below.

Let $X$ be smooth connected projective with smoothly semipositive $- K_X$.
  The cited structure theorem gives a connected finite étale cover $nu : S arrow.r
  X$ and an equivariant product description of its universal cover

$ tilde(X) = bb(C)^a times F times Z \, wide S = \( bb(C)^a times F times Z \) \/ Lambda . $

Here $Lambda$ acts by translations on $bb(C)^a$, trivially on the compact simply connected Ricci-flat projective
  factor $F$, and through a compact connected real torus on $Z$.
  The variety $Z$ is smooth projective, its anticanonical line is smoothly semipositive,
  and $H^i \( Z \, cal(O)_Z \) = 0$ for every $i > 0$. The compact action has algebraic torus closure $G subset
  "Aut" \( Z \)$, with its natural anticanonical linearization.
  There are invariant canonical frames $eta_0 \, eta_F$ on $bb(C)^a \, F$. Any factor may be a point.

Theorem 2 gives a nonzero $s in H^0 \( Z \, K_Z^(- m) \)^G$ for some $m > 0$.
  If $Z$ is a point, take $m = 1$ and $s = 1$. Equally, the controlled-field conversion and its index application
  can be used here: $Z$ has irregularity zero and actual index one,
  and its natural compact action meets precisely those hypotheses.

Under the determinant identity for the product tangent bundle, the section

$ "pr"_0^(*) \( eta_0^(- m) \) ⊗ "pr"_F^(*) \( eta_F^(- m) \) ⊗ "pr"_Z^(*) s $

belongs to $H^0 \( tilde(X) \, K_(tilde(X))^(- m) \)$. It is nonzero,
  since the first two factors never vanish and $s$ is nonzero on a nonempty open set of $Z$.
  Translations preserve $eta_0$, the action on $F$ preserves $eta_F$, and the residual action on $Z$ fixes $s$.
  Thus this product is $Lambda$-invariant and descends to a nonzero holomorphic section of $K_S^(- m)$.
  It is algebraic by projectivity. The finite étale norm #cite(label("CompanionH")) Lemma 2.2 then gives a nonzero
  section of $K_X^(- m deg nu)$.

The product is used on the universal cover; the finite cover $S$ need not split as a product.
  The next argument starts from a locally constant rationally connected fibration instead.
  Its algebraic monodromy can have a nontrivial unipotent part, which requires an additional fixed-vector argument.

== 14 Descent through a locally constant MRC fibration <V:sec-mrc-descent>

We apply Theorem 22 to the rationally connected fibers of a locally constant fibration.
  The constant extension of a section on one fiber gives a relative anticanonical section precisely when the
  section is fixed by monodromy. The argument below first reduces monodromy to a connected commutative algebraic
  group, then uses its unipotent part to pass from torus invariance to monodromy invariance.
  The final two steps remove the base canonical bundle and descend through a finite cover.
  This is the invariant-section reduction of Müller #cite(label("Muller2025")) Theorem 2.2 and its proof,
  with the fiberwise section supplied here by the controlled-cone theorem.

Let $X$ be a smooth connected projective complex variety, and assume that $-
  K_X$ has a smooth Hermitian metric with semipositive curvature.
  The structure input is Matsumura–Wang’s theorem for projective klt pairs with nef anti-log-canonical divisor
  #cite(label("MatsumuraWangV3")) Theorem 1.1, Definition 2.3, Theorem 4.12, and the conclusion of §4.4.
  We use its zero-boundary case. The hypotheses hold because smoothness implies the klt condition and smooth
  semipositivity implies nefness. The theorem gives a finite quasi-étale cover $p_0 : X_0 arrow.r
  X$ and a holomorphic maximal rationally connected fibration

$ f_0 : X_0 arrow.r B_0 \, wide K_(B_0) tilde.op_(bb(Q)) 0 \, $

where $B_0$ is projective and the fibration is locally constant.
  Concretely, for a fixed connected rationally connected fiber $F$, there are a representation

$ rho_0 : pi_1 \( B_0 \) arrow.r "Aut" \( F \) quad upright("and an isomorphism") quad
  X_0 tilde.eq \( tilde(B)_0 times F \) \/ pi_1 \( B_0 \) $

over $B_0$; the group acts by deck transformations on $tilde(B)_0$ and through $rho_0$ on $F$.
  The rational linear equivalence of $K_(B_0)$ is the conclusion of Theorem 4.12,
  not merely the numerical triviality in the introductory statement of Theorem 1.1.
  The same formulation appears in Müller #cite(label("Muller2025")) Theorem 2.1.
  Cao–Höring #cite(label("CaoHoring")) provides the earlier smooth locally trivial structure theorem;
  the constant transition maps used here come from Matsumura–Wang.

Purity of the branch locus makes $p_0$ étale, since its target $X$ is smooth.
  Hence $X_0$ is smooth and projective. Local product charts for $f_0$ imply that $B_0$ and $F$ are smooth as
  well: the embedding dimension and the dimension of a product of analytic germs are sums,
  so a smooth product has smooth factors. The fiber $F$ is projective because it is closed in $X_0$.
  On the fiber over $b in B_0$ the tangent sequence gives

$ K_(X_0)^(- 1) \|_F tilde.eq K_F^(- 1) ⊗ #scale(x: 120%, y: 120%)[\(] det T_b B_0 #scale(x: 120%, y: 120%)[\)] ⊗
  cal(O)_F . $

A choice of nonzero vector in the constant determinant line therefore transfers the restricted smooth semipositive
  metric to $- K_F$. Rational connectedness and Hodge symmetry give $H^i \( F \, cal(O)_F \) =
  0$ for every $i > 0$. Thus $F$ has all the nonequivariant hypotheses of Theorem 22.

=== 14.1 Making the monodromy group connected and commutative <making-the-monodromy-group-connected-and-commutative>

The structure theorem of Demailly–Peternell–Schneider #cite(label("DPS1996")) Structure Theorem (iii),
  p. 218 shows that $pi_1 \( X_0 \)$ is virtually abelian. Since $f_0$ is a fiber bundle with connected fiber,
  its homotopy sequence makes $pi_1 \( X_0 \) arrow.r pi_1 \( B_0 \)$ surjective.
  The image of an abelian finite-index subgroup is again abelian of finite index.
  Consequently $pi_1 \( B_0 \)$ is virtually abelian.

To place monodromy in a fixed algebraic group, choose an ample line bundle $A$ on $X_0$ and put $A_F = A \|_F$.
  The restrictions of $c_1 \( A \)$ form a flat section of $R^2 \( f_0 \)_(*) bb(Z)$,
  so monodromy fixes the integral class $c_1 \( A_F \)$. Since $H^1 \( F \, cal(O)_F \) = 0$,
  the exponential sequence makes the Chern-class map $"Pic" \( F \) arrow.r H^2 \( F \, bb(Z) \)$ injective.
  It follows that $rho_0 \( gamma \)^(*) A_F tilde.eq A_F$ for every $gamma in pi_1 \( B_0 \)$.
  Choose $a > 0$ such that $A_F^a$ is very ample. The projective embedding by $A_F^a$ identifies
  $"Aut" \( F \, A_F^a \)$ with the closed stabilizer of the embedded $F$ in
  $"PGL" \( H^0 \( F \, A_F^a \)^(*) \)$. Monodromy therefore lies in a linear algebraic group.
  This argument uses a projective action and requires no choice of linearization on $A$ or $A_F$.

Pass to the connected finite étale cover of $B_0$ corresponding to an abelian subgroup of finite index in
  $pi_1 \( B_0 \)$, and pull back $X_0$. The resulting monodromy has commutative Zariski closure $H$:
  the commutator morphism is trivial on the dense product of the monodromy image with itself.
  Pass next to the cover corresponding to the inverse image of the identity component $H^compose$.
  The new monodromy is dense in $H^compose$, since each component of an algebraic group is open and closed. Write

$ f : Y arrow.r B \, wide p : Y arrow.r X \, wide G = overline(rho \( pi_1 \( B \) \))^(upright("Zar")) = H^compose $

for the resulting fibration, composite finite étale cover, and monodromy closure.
  These finite covers of projective varieties are projective, and $K_B$ is still torsion.
  In particular $G$ is a connected commutative linear algebraic group acting on the same fiber $F$.

=== 14.2 From a torus-fixed section to a section on $X$ <from-a-torus-fixed-section-to-a-section-on-x>

We use the natural action on anticanonical bundles: an automorphism acts on $K_F^(- 1) =
  det T_F$ by the determinant of its differential. It induces an algebraic representation on every
  finite-dimensional space $H^0 \( F \, K_F^(- m) \)$. This specified action is also the action in the relative
  canonical transition functions of the locally constant fibration.

Let $T subset G$ be a maximal algebraic torus. Theorem 22 gives an integer $m > 0$ for which

$ W := H^0 \( F \, K_F^(- m) \)^T eq.not 0 . $

If $F$ is a point, take $m = 1$ and the constant section; the rest of the argument is unchanged.
  The trivial torus is allowed. The inclusion $G subset "Aut" \( F \)$ makes the action faithful,
  so there is no ineffective subgroup that could introduce a scalar character on the natural anticanonical line.

For completeness, the following elementary argument explains why $W$ contains a vector fixed by all of $G$.
  Jordan decomposition in a connected commutative linear algebraic group over $bb(C)$ gives

$ G = T times U \, $

where $U$ is connected and unipotent. Commutativity makes $W$ stable under $U$.
  Its Lie algebra acts on $W$ by commuting nilpotent endomorphisms $N_1 \, dots.h \, N_e$,
  after choosing a basis of the Lie algebra. Their kernels have nonzero intersection:
  successively restrict $N_j$ to the intersection of the preceding kernels, which it preserves by commutativity;
  a nilpotent endomorphism of a nonzero finite-dimensional space has nonzero kernel.
  A nonzero vector in this intersection is fixed by $U$, because $U$ is connected and is generated by the
  exponentials of its Lie algebra. We obtain

$ 0 eq.not s in W^U = H^0 \( F \, K_F^(- m) \)^G . $

This is the connected-group step in #cite(label("Muller2025")) Lemma 2.3 and the proof of Theorem 2.2;
  we have retained the unipotent argument because $G$ need not be a torus.
  The input here is a fixed vector for the natural linearization, not a section of an unspecified character.

Since $s$ is fixed by monodromy, its constant extension to $tilde(B) times F$ descends to a nonzero section

$ sigma in H^0 \( Y \, K_(Y \/ B)^(- m) \) . $

The canonical bundle formula reads $K_Y = K_(Y \/ B) ⊗ f^(*) K_B$.
  Choose $r > 0$ with $K_B^r tilde.eq cal(O)_B$ and a nowhere-zero section $tau in H^0 \( B \, K_B^(- r) \)$. Then

$ sigma^r ⊗ f^(*) tau^m in H^0 \( Y \, K_Y^(- m r) \) \\ { 0 } . $

All these holomorphic sections are algebraic by projectivity. Finally, let $d = deg p$.
  Since $p$ is finite étale, $K_Y^(- m r) tilde.eq p^(*) K_X^(- m r)$,
  and the norm of this section is a section of $K_X^(- m r d)$. It is nonzero:
  over the generic point the norm is a product of nonzero conjugates in a finite field extension.
  Thus $X$ has a nonzero section of a positive anticanonical power.
  The construction uses the locally constant product only after passing to the universal cover of the base;
  no product decomposition of a finite cover of $X$ is required.

#bibliography("refs.bib", style: "ieee", title: [References])
