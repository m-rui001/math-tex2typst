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

#align(center)[#text(size: 16pt, weight: "bold")[Bounded-klt-complements-for-Fano-contractions-September-25-2026]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $f : X arrow.r Z$ be a projective contraction of normal varieties,
  meaning that $f$ is surjective and $f_(*) cal(O)_X = cal(O)_Z$.
  A complement near a closed point $z in Z$ is an effective rational boundary $B$ for which the adjoint divisor
  $K_X + B$ becomes torsion on the inverse image of a neighbourhood of $z$.
  More precisely, an index $N$ records that $N \( K_X + B \)$ is integral Cartier and linearly trivial there.
  The complement is klt if every log discrepancy of $\( X \, B \)$ is positive.
  We ask whether one index works for all contractions of a fixed dimension whose singularities have a fixed
  positive lower discrepancy bound.

When $K_X$ is rational Cartier and $- K_X$ is ample over $Z$, we call $f$ a #emph[Fano contraction].
  Complements turn this positivity into an adjoint divisor with controlled torsion.
  The distinction between lc and klt complements is essential:
  an lc complement permits zero discrepancies, whereas a klt complement must keep every discrepancy strictly
  positive. We prove that a uniform positive bound for the singularities of $X$ suffices to achieve the latter
  conclusion with a bounded index.

#thm([Theorem 1.1.])[
  #emph[For every positive integer $d$ and positive rational number $epsilon.alt$ there is a positive integer $N =
    N \( d \, epsilon.alt \)$ with the following property. Let $k$ be an algebraically closed field of
    characteristic zero, and let $f : X arrow.r Z$ be a projective surjective morphism of normal integral
    $k$-varieties such that $f_(*) cal(O)_X = cal(O)_Z$, $dim X = d$, $K_X$ is $bb(Q)$-Cartier,
    $X$ is $epsilon.alt$-lc, and $- K_X$ is ample over $Z$. For every closed point $z in
    Z$ there are an effective $bb(Q)$-divisor $B$ on $X$ and a Zariski open neighbourhood $U$ of $z$ such that
    $\( X \, B \)$ is klt over $U$ and
$ N \( K_X + B \) \|_(f^(- 1) \( U \)) tilde.op 0 $

 is an integral Cartier divisor.]
] <thm:main>

The morphism in Theorem 1 need not have relative Picard number one,
  nor need its general fibre have positive dimension. The displayed linear equivalence means triviality of the
  associated line bundle on $f^(- 1) \( U \)$, after the indicated shrinking;
  it is stronger than numerical triviality. Both $B$ and $U$ may depend on $f$ and $z$, whereas $N$ does not.

A variety is of Fano type over its base if it admits an effective $bb(Q)$-boundary $Delta$ for which
  $\( X \, Delta \)$ is klt and $- \( K_X + Delta \)$ is relatively ample.
  Equivalent versions using a nef and big anti-log-canonical divisor may be converted to this one by a small
  boundary perturbation.

The proof uses the equivalence between bounded klt complements and a local threshold statement established by Chen
  #cite(label("Chen")) Theorem 1.6. The birational, boundary-free case of that threshold statement remains the
  main issue. We formulate it in Proposition 3 and prove it by contradiction.
  The role of bounded lc complements is different: they supply an auxiliary linear system of a fixed degree $n$.
  Throughout the proof, this $n$ is distinguished from the final klt complement index $N$.

=== 1.1 Earlier results and the finite-coefficient conjecture <earlier-results-and-the-finite-coefficient-conjecture>

Shokurov introduced complements in his work on threefold log flips #cite(label("ShokurovFlips")) Section 5 and
  formulated their boundedness systematically in his surface theory #cite(label("ShokurovSurfaces"))
  Conjecture 1.3. Prokhorov–Shokurov developed the passage from global complements to local ones and the
  higher-dimensional inductive program #cite(label("ProkhorovShokurovFirst")) #cite(label("ProkhorovShokurov")).
  Shokurov’s later treatment includes a bounded lc complement theorem assuming the existence of a klt real
  complement #cite(label("ShokurovComplements")) Theorem 3.
  Here the klt condition concerns the input real complement; the bounded-index output is lc.
  An lc complement may have places of zero discrepancy. Reducing its boundary coefficients need not preserve the
  linear triviality of the adjoint divisor, so keeping the complement klt requires an additional argument.

Birkar proved boundedness of lc complements for Fano type fibrations with hyperstandard coefficients
  #cite(label("BirkarComplements")) Theorems 1.7 and 1.8, and boundedness of klt complements for boundary-free
  Fano fibrations over curves #cite(label("BirkarFibrations")) Corollary 1.4.
  Chen related bounded klt complements to uniform local hypersurface thresholds and established the conjecture for
  bases of dimension at most two #cite(label("Chen")) Theorem 1.6 and Corollary 1.8.

Theorem 1 also gives the following consequence in Chen’s complex quasi-projective setting.

#thm([Corollary 1.2.])[
  #emph[Fix a positive integer $d$, a real number $epsilon.alt > 0$,
    and a finite set $I subset \[ 0 \, 1 \] ∩ bb(Q)$. There is a positive integer $M =
    M \( d \, epsilon.alt \, I \)$ with the following property.
    Let $\( X \, Delta \)$ be an $epsilon.alt$-lc pair of dimension $d$ with coefficients in $I$, over $bb(C)$.
    Let $f : X arrow.r Z$ be a contraction of quasi-projective normal varieties,
    assume that $X$ is of Fano type over $Z$, and assume that $- \( K_X + Delta \)$ is nef over $Z$.
    For every closed $z in Z$, there is an effective $bb(Q)$-divisor $Delta^(+) gt.eq Delta$ such that,
    near $f^(- 1) \( z \)$, the pair $\( X \, Delta^(+) \)$ is klt and $M \( K_X + Delta^(+) \)$ is Cartier and
    linearly trivial after shrinking the base about $z$.]
] <cor:finite-coefficients>

The proof, using Chen’s equivalence and a crepant ample model, is given in Section 2.

Corollary 2 is the finite-rational-coefficient form of Shokurov’s bounded-klt-complement conjecture stated in
  #cite(label("Chen")) Conjecture 1.1. The same equivalence yields the local hypersurface assertions in
  #cite(label("Chen")) Conjectures 1.3 and 1.4. The conclusion concerns klt complements;
  the stronger requirement of an $epsilon.alt$-lc complement in #cite(label("Chen")) Remark 1.2(1) is not asserted here.

=== 1.2 Methods and related work <methods-and-related-work>

Our first tools come from normalized-volume minimization.
  Li established properness estimates #cite(label("LiProperness"));
  Blum proved existence of a minimizer #cite(label("BlumExistence"));
  Xu proved its quasi-monomiality #cite(label("XuQuasimonomial"));
  and Xu–Zhuang proved uniqueness and finite generation #cite(label("XuZhuangUniqueness"))
  #cite(label("XuZhuangStable")). Li–Xu identifies the minimizing Reeb valuation on the resulting K-semistable
  cone #cite(label("LiXuStable")). We use this ordinary klt theory after proving an additional exactness
  statement: one fixed small rational perturbation has its actual global minimizer on the prescribed lc
  constraint. This is Proposition 13; its constants are allowed to depend on the individual germ and ideals.

The projective stage combines minimal models and Mori dream spaces #cite(label("BCHM")) #cite(label("HuKeel")),
  Ambro’s canonical bundle formula #cite(label("AmbroBoundary")) #cite(label("AmbroModuli")),
  and Birkar’s boundedness and threshold theorems #cite(label("BirkarBAB")) #cite(label("BirkarPolarised"))
  #cite(label("BirkarFibrations")). The needed uniformity concerns both divisor classes and effective
  representatives. We retain those representatives in marked bounded families before passing to generic fibres or
  taking limits.

The final stage uses Takagi’s comparison between multiplier and test ideals #cite(label("Takagi")),
  in the dense-open formulation recalled by de Fernex–Docampo–Takagi–Tucker #cite(label("DFDTT")) Theorem 11,
  together with Schwede’s Cartier-algebra formulation #cite(label("SchwedeNonQG")).
  These results supply trace generation for a fixed rational pair.
  The proof below additionally retains the finite output spaces and their valuation bounds through two successive
  liftings. Related local Cartier-threshold bounds under a positive normalized-volume lower bound appear in
  #cite(label("HanLiuQiLocalVolumes")) Theorem 1.7.

The companion article #cite(label("OpenAICartier")) Theorem 1 proves a uniform Cartier-section threshold for
  rational-boundary Fano type contractions by an independent character and pinning argument.
  Its endpoint is a Cartier divisor through a prescribed base point with a uniformly lc pullback.
  The proof here develops the complement index directly through the birational threshold and the trace estimates above.

=== 1.3 Outline of the proof <outline-of-the-proof>

The reduction in Section 2 asks for a uniform lower bound on the log canonical threshold of the pullback of a
  closed base point’s maximal ideal in the birational, zero-boundary case.
  A sequence violating this bound has divisors whose orders on that ideal are arbitrarily large compared with
  their discrepancies. We will construct a prime divisor of discrepancy less than $epsilon.alt$.
  Small discrepancy at a real valuation is not by itself enough,
  since rescaling the valuation also rescales its discrepancy.
  The proof must therefore control both discrepancy and the eventual divisor normalization.

#emph[From concentration to a graded model.] After shrinking each base to an affine neighbourhood of $z$ and
  replacing the sequence by its crepant ample models, Sections 3–6 encode anticanonical sections in an affine
  cone. Its bounded-degree lc system has a centred lc place detecting the concentration of the base ideal.
  We minimize normalized volume subject to this lc equality.
  Proposition 13 shows that the constrained minimizer is exactly the ordinary minimizer of a small effective klt
  perturbation. This permits ordinary stable degeneration to produce a finitely generated graded ring,
  while a comparison at the minimizer preserves concentration of the base ideal.

Compatible further filtrations let us maximize the rank of the torus whose characters record the occurring
  valuation degrees. Each successive valuation remains realized on the original cone.
  The resulting projective quotient carries a klt pair $\( S \, B \)$ and an effective ample rational divisor $H
  tilde.op_(bb(Q)) - \( K_S + B \)$ for which $\( S \, B + H \)$ is lc.
  At each lc place of this latter pair, replacing $H$ by any effective rationally linearly equivalent divisor
  increases its order by at most a factor $1 + eta$, where $eta arrow.r 0$ along the sequence.
  This is the weak essentiality property of Proposition 20.

We also keep actual sections on $X$. Choose a general degree-$n$ anticanonical section $h$,
  and let $B_h$ be one $n$-th of its effective section divisor, so $\( X \, B_h \)$ is lc.
  For $m in n bb(Z)_(gt.eq 0)$, dividing degree-$m$ anticanonical sections by $h^(m \/ n)$ gives a space of
  rational functions $V_m subset k \( X \)$. The normalized cone valuation restricts to a valuation $v$ with
  $A_(X \, B_h) \( v \) = 0$. The cone valuation assigns to a section the #emph[cost] $b \( F \) = m +
  v \( F \)$ of the corresponding $F in V_m$; the assigned degree $m$ is retained in this notation.
  Costs are nonnegative, $V_0 = k \[ Z \]$, and $v \( frak(m)_z \) arrow.r oo$ along the sequence.
  These systems and the exact discrepancy identity below are constructed in Subsection 6.4.

#emph[Upper counts and independent sections.] Sections 7–10 use weak essentiality to control these section spaces.
  A finite tower of projective contractions removes one small scale of the residual field $k \( S \)$ at a time.
  Horizontal discrepancy bounds give divisor-order estimates on each relative field.
  Together with the torus directions, these fields determine $d$ widths $W_j$:
  independent rational functions in direction $j$ can be obtained at degree and cost $O \( W_j \)$.

The two needed estimates go in opposite directions. At any fixed physical degree,
  the sum of initial spaces through cost $T$ has dimension at most a uniform multiple of
  $product_j \( 1 + T \/ W_j \)$. Monomials in actual sections with independent initials give lower box bounds at
  comparable degree and cost. Here an initial is the least-valued part of a function in the associated graded
  field. The directions whose widths stay bounded need a further estimate:
  through a slowly growing cutoff, cost is bounded by a uniform multiple of physical degree,
  and the dimension is $O \( \( 1 + m \)^r \)$, where $r$ is their number.
  To prove this, Section 10 retains effective divisor representatives in a marked projective family.
  An obstruction would produce a degree-zero section of bounded positive cost,
  contradicting concentration of the entire base maximal ideal.

#emph[A small discrepancy with controlled divisor normalization.] The connection back to the singularities of $X$ is

$ A_X \( w \) = A_(X \, B_h) \( w \) + sup_(m in n bb(Z)_(> 0)\
0 eq.not F in V_m) frac(- w \( F \), m) $

for quasi-monomial valuations centred on $X$; this is (6.7).
  Thus inequalities $w \( F \) + B_(*) m gt.eq q thin b \( F \)$, with $B_(*) \, q > 0$,
  bound the second term by $B_(*)$. In degree zero they give nonnegative values on $k \[ Z \]$ and positive values
  on $frak(m)_z$, forcing the centre to lie over $z$. Sections 11–14 seek such valuations with small
  $A_(X \, B_h) \( w \)$, while preserving independent initial coordinates.
  The fractional-form discrepancy $A_theta$ used there is precisely $A_(X \, B_h)$.

The optimization has a finite test and compact sublevels on a monomial skeleton.
  A suitably chosen optimizer gives a strict divisorial budget on a geometric generic fibre of the full initial
  field, which retains all homogeneous degrees, rather than just residue classes.
  In suitable positive-characteristic reductions, Cartier trace converts this budget into sections of controlled
  degree and value. Relative trace survival is first lifted to the full initial field and then to the original
  field; the finite output spaces are fixed before reduction to positive characteristic.

Comparing these trace outputs with the upper counts controls both changes of coordinate values and growth of the
  number of independent initials. First the bounded-width coordinates acquire value zero.
  A further trace argument then gives two-sided bounds for section values.
  Through the remaining width layers, independent initials are added and their values are rounded to integers,
  preserving all earlier constraints. Once the initials form a full transcendence basis,
  the section counts bound the denominator of the entire value group.
  A bounded multiple of the resulting valuation is an integral multiple of a prime divisor.
  The final choice of tolerances and scaling makes that divisor’s discrepancy less than $epsilon.alt$,
  completing the contradiction.

=== 1.4 Conventions <conventions>

All varieties in characteristic zero are over an algebraically closed field.
  After Section 2 we work over $bb(C)$ through Section 10. In Section 11 we descend the contradiction sequence and
  its specified data to a countable algebraically closed field of characteristic zero;
  later constructions allow the stated extensions of constants.
  From Section 12, positive-characteristic reductions are auxiliary trace calculations on retained finite data:
  the chosen valuations, optimization, and strict discrepancy assertions remain in characteristic zero.
  A contraction is a projective surjective morphism with connected fibres in the sense $f_(*) cal(O)_X = cal(O)_Z$.

We use log discrepancies. For a prime divisor $E$ on a smooth birational model $pi : Y arrow.r X$,

$ A_(X \, B) \( E \) = 1 + "ord"_E #scale(x: 120%, y: 120%)[\(] K_Y -
  pi^(*) \( K_X + B \) #scale(x: 120%, y: 120%)[\)] . $

Discrepancies, divisor orders, and ideal orders are extended homogeneously to positive real multiples of
  valuations. The order of an ideal is the minimum of the orders of local generators.
  The notation $A_X$ means $A_(X \, 0)$. For a nonzero ideal $frak(a)$ on a klt variety,

$ "lct" \( X \; frak(a) \) = inf_(E \( frak(a) \) > 0) frac(A_X \( E \), E \( frak(a) \)) \, $

where the infimum is over prime divisors over $X$. Rational Cartier divisors are evaluated by pullback on a model
  on which the valuation has a centre.

In contradiction sequences we pass to subsequences and shrink the base about the chosen point without repeating
  this convention. Constants called uniform are independent of the sequence index after these operations;
  their allowed geometric dependencies will be stated. The number of contractions, scale layers,
  and rank increases is bounded. Small positive constants chosen before a limit are kept separate from quantities
  tending to zero along the sequence. The original dimension is $d$; the first section cone has dimension $p = d +
  1$. Characteristic primes in the trace arguments are denoted by $frak(p)$.

== 2 The birational threshold reduction <sec:reduction>

The central assertion is the following uniform estimate.

#thm([Proposition 2.1.])[
  #emph[For every positive integer $d$ and every $epsilon.alt > 0$ there is $c \( d \, epsilon.alt \) >
    0$ such that, over $bb(C)$, the following holds. Let $f : X arrow.r
    Z$ be a birational contraction of $d$-dimensional normal varieties, let $X$ be of Fano type over $Z$,
    and assume that $K_X$ is $bb(Q)$-Cartier, $- K_X$ is nef over $Z$, and $X$ is $epsilon.alt$-lc.
    For each closed point $z in Z$,
#[#set math.equation(numbering: n => "(2.1)")
 $ "lct" #scale(x: 120%, y: 120%)[\(] X \; frak(m)_z cal(O)_X #scale(x: 120%, y: 120%)[\)] gt.eq
   c \( d \, epsilon.alt \) . $ <eq:A1>]

]
] <prop:birational-threshold>

The subsequent sections prove Proposition 3. We first explain precisely why it suffices.

#thm([Lemma 2.2.])[
  #emph[Proposition 3 in all dimensions implies Theorem 1 over $bb(C)$.]
] <lem:threshold-to-complement>

#proof[
  Shrink $Z$ to an affine neighbourhood of $z$. Choose generators of $frak(m)_z$ and take a log resolution of
    their pullback ideal and of $X$. The pullback system has a fixed divisor and a base-point-free moving system.
    By (2.1), multiplying the fixed divisor by $c \( d \, epsilon.alt \)$ preserves log canonicity.
    For a general linear combination $h$ of the generators, Bertini’s theorem makes its moving divisor transverse
    to the resolution strata. Consequently, with $t = min { c \( d \, epsilon.alt \) \, 1 \/ 2 }$,
    the pair $\( X \, t f^(*) "Div" \( h \) \)$ is lc near $f^(- 1) \( z \)$;
    the same conclusion follows componentwise on the resolution. The divisor $"Div" \( h \)$ passes through $z$.
    This is the birational boundary-zero instance of the local hypersurface assertion in #cite(label("Chen"))
    Conjecture 1.3.
  Apply the implication (4)$arrow.r.double$(1) in #cite(label("Chen")) Theorem 1.6,
    for every base-dimension bound needed and with boundary coefficient set ${ 0 }$.
    Its conclusion supplies a bounded klt complement on an $epsilon.alt$-lc contraction of Fano type whose
    anti-log-canonical divisor is relatively nef. A Fano contraction as in Theorem 1 satisfies these hypotheses,
    using the zero boundary. Over our affine base its total space is quasi-projective, as required there.
    Relative linear triviality becomes actual linear triviality after shrinking about $z$ to trivialize the line
    bundle on the base.
  The birational assertion in Chen’s formulation allows a canonical Weil divisor that is $bb(R)$-Cartier.
    Such a divisor is already $bb(Q)$-Cartier: on a finite open cover,
    expressing its Cartier condition in terms of finitely many integral divisors gives a finite system of rational
    linear equations. A real solution of this consistent system can be replaced by a rational solution,
    and a common denominator works on the finite cover. Finally a real positive lower discrepancy bound may be
    decreased to a positive rational one. Thus these harmless differences in formulation do not restrict the
    implication. ◻
]

#thm([Lemma 2.3.])[
  #emph[If Theorem 1 holds over $bb(C)$ with a fixed index depending only on $d$ and $epsilon.alt$,
    it holds over every algebraically closed field of characteristic zero with a fixed multiple of that index.]
] <lem:field-descent>

#proof[
  Work over an affine neighbourhood of $z$. Descend the morphism, the point,
    and the relevant canonical-divisor data to a countable algebraically closed subfield $k_0$ of the given field
    $k$. All defining equations require only finitely many coefficients,
    so such a $k_0$ exists and embeds in $bb(C)$. Normality, the contraction property,
    and relative ampleness descend and ascend under these field extensions after enlarging the defining field when
    necessary. A log resolution defined over $k_0$ checks the discrepancy bound:
    its finitely many boundary coefficients, together with the smooth transverse strata,
    compute the same lc condition after either extension. We may therefore apply the complex assertion to this
    descended model.
  Let $b > 1$ be a fixed multiple of the complex complement index.
    Write $K_X$ using a rational top-degree form $omega$ defined over $k_0$.
    The coherent module of relative sections of the reflexive sheaf $cal(O)_X \( - b K_X \)$ has finitely many
    generators over the affine base. Represent these generators by rational functions $phi.alt_1 \, dots.h \,
    phi.alt_s$ over $k_0$. Sections commute with flat constant-field extension;
    equivalently one may compute the reflexive powers on the smooth locus and use flat base change there.
    We do not require $b K_X$ to be Cartier.
  Take a log resolution $pi : Y arrow.r X$ over $k_0$ on which the fractional ideal generated by the $phi.alt_i$
    is principal, and its divisor together with $"Div"_Y \( omega \)$ and the exceptional locus has simple normal
    crossings. For every component $E$ of these divisors put
  $ a_E = "ord"_E \( omega \) \, wide q_E = min_i E \( phi.alt_i \) . $
  Over $bb(C)$, the given klt complement is represented, after localizing on a neighbourhood of $z$,
    by a section $phi.alt$ with $"Div"_X \( phi.alt \) = b \( K_X + B \)$.
    Its order at every $E$ whose proper image in the base contains $z$ is at least $q_E$:
    the coefficients expressing it in the chosen generators are regular on that neighbourhood.
    Klt of this complement therefore gives the strict inequalities
  #[#set math.equation(numbering: n => "(2.2)")
   $ 1 + a_E > q_E / b $ <eq:descent-fixed-part>]
  for all such components. These are finite inequalities for the descended resolution, so they remain true over $k$.
  Remove from the base the proper images of the finitely many offending components that do not contain $z$.
    The fractional ideal is now its fixed divisor times a base-point-free system.
    A general $k$-linear combination $phi.alt = sum_i lambda_i
    phi.alt_i$ has a moving divisor which is smooth and transverse to the resolution strata,
    by Bertini in characteristic zero. Its coefficient in
  $ 1 / b "Div"_Y \( phi.alt \) - "Div"_Y \( omega \) $
  is $1 \/ b < 1$; the fixed coefficients are strictly less than one by (2.2).
    This simple-normal-crossing subpair is klt. Pushing down gives an effective boundary
  $ B = frac("Div"_X \( phi.alt \) - b K_X, b) \, wide b \( K_X + B \) = "Div"_X \( phi.alt \) \, $
  which is klt on a neighbourhood of $f^(- 1) \( z \)$. Properness justifies the shrinking used above.
    Closing up this effective divisor in the original $X$ gives the divisor required by the theorem;
    its restriction to that neighbourhood is unchanged. Thus the fixed index $b$ works over $k$. ◻
]

=== 2.1 The contradiction sequence <subsec:contradiction-sequence>

Suppose Proposition 3 fails for fixed $d > 0$ and $epsilon.alt > 0$.
  Choose a sequence of its data with threshold tending to zero. We will usually suppress the sequence index.
  Before constructing the cone, we make two reductions that preserve this failure.

#thm([Lemma 2.4.])[
  #emph[The sequence may be chosen with $- K_X$ ample over $Z$.
    This replacement preserves all discrepancies and the threshold in (2.1).]
] <lem:ample-model>

#proof[
  Choose a klt log Fano boundary $Delta$ over $Z$ and a positive integer $r$ with $- r K_X$ Cartier.
    The divisor $D = - r K_X$ is relatively nef, and for a positive integer $a$,
  $ a D - \( K_X + Delta \) = - a r K_X - \( K_X + Delta \) $
  is relatively ample. The relative klt base-point-free theorem #cite(label("FujinoBPF")) Theorem 1.3 makes $-
    K_X$ semiample over $Z$. Let $g : X arrow.r X^(upright(a))$ be its relative ample model.
    Since $X arrow.r Z$ is birational, so is $g$. Choose canonical divisors from the same rational top form.
    For a Cartier divisor $H$ on $X^(upright(a))$ ample over $Z$ and a sufficiently divisible $m$, write $-
    m K_X = g^(*) H + "Div"_X \( phi.alt \)$. Birationality identifies the function fields,
    so pushing forward gives $- m K_(X^(upright(a))) = H + "Div"_(X^(upright(a))) \( phi.alt \)$.
    Pulling back this identity gives
  $ K_X = g^(*) K_(X^(upright(a))) . $
  The morphism is crepant; the new variety is $epsilon.alt$-lc and has ample anti-canonical divisor over $Z$.
    In particular it is of Fano type there. Every divisorial valuation has the same discrepancy on these two
    models, and its value on the ideal from $Z$ is the same. The valuative formula for the threshold proves the
    assertion. ◻
]

We henceforth assume that $Z$ is affine and $- K_X$ is ample over $Z$.
  By the valuative description of the failing threshold, there are prime divisors $P$ over $X$ such that

#[#set math.equation(numbering: n => "(2.3)")
 $ frac(P \( frak(m)_z \), A_X \( P \)) arrow.r oo . $ <eq:bad-prime-ratio>]

Here and below $P \( frak(m)_z \)$ denotes the order of $frak(m)_z cal(O)_X$.

Birkar’s relative bounded lc complement theorem #cite(label("BirkarComplements")) Theorem 1.8 applies to the pair
  $\( X \, 0 \)$: the coefficient set is fixed, the total space is of Fano type over the base, and $-
  K_X$ is relatively nef. Our base has positive dimension $d$, so the stated relative theorem applies.
  After shrinking about $z$, it supplies an lc complement of an index bounded in terms of $d$.
  Taking a fixed multiple of the finitely bounded indices and then a further multiple if necessary,
  we obtain one integer $n > 1$, independent of the sequence, for which

#[#set math.equation(numbering: n => "(2.4)")
 $ 1 / n \| - n K_X \| quad upright("is an lc linear system") . $ <eq:auxiliary-lc-system>]

This means that for every divisorial valuation $E$ with centre in the neighbourhood under consideration, $1 /
  n E \( \| - n K_X \| \) lt.eq A_X \( E \)$, where the system order is the minimum section order.
  One lc section already proves these inequalities for the whole system.
  The integer $n$ will remain fixed in the cone construction; it is not asserted to be a klt complement index.

=== 2.2 The finite-coefficient consequence <the-finite-coefficient-consequence>

The crepant model also gives the consequence stated in the introduction, once Theorem 1 has been proved.

#proof[
  We check item (2) of #cite(label("Chen")) Theorem 1.6 in every birational dimension.
    For its boundary-zero, relatively nef data, use the crepant ample model $g : X arrow.r Y$ of Lemma 6.
    Apply Theorem 1 to $Y arrow.r Z$, decreasing $epsilon.alt$ to a fixed positive rational number when needed.
    After shrinking about $z$, its complement boundary $B_Y$ is $bb(Q)$-Cartier, since both $K_Y$ and $K_Y +
    B_Y$ are $bb(Q)$-Cartier there. On this neighbourhood, $B_X = g^(*) B_Y$ is effective and
  $ K_X + B_X = g^(*) \( K_Y + B_Y \) . $
  The pair upstairs is klt, and the same complement index makes its adjoint divisor Cartier and trivial.
    Take the effective closure of $B_X$ outside this neighbourhood if necessary.
    In particular the multiple used to construct the ample model does not change the complement index.
    This proves Chen’s item (2) for every base-dimension bound.
    The implication (2)$arrow.r.double$(1) of his theorem gives the assertion, with the stated dependence on $I$. ◻
]

In the rest of the paper we work with the contradiction sequence above, with its fixed auxiliary lc degree $n$,
  and prove Proposition 3.

== 3 The anticanonical cone and a distinguished lc place <a:cone>

We work with the contradiction sequence introduced after (2.1).
  Thus $X arrow.r Z$ is birational, $Z$ is affine, $- K_X$ is relatively ample, $z in Z$ is closed, and $d =
  dim X > 0$. The integer $n > 1$ is fixed along the sequence and $n^(- 1) \| - n K_X \|$ is an lc system.
  Put $p = d + 1$. All valuations in this section are trivial on $k = bb(C)$.

=== 3.1 Valuations and forms <valuations-and-forms>

We shall use the full initial field of a valuation, as well as its residue field; these are different objects.
  We first record the monomial facts needed to distinguish them.
  The smooth monomial description and its finite-ideal refinements are standard in valuation theory;
  see #cite(label("JM")) Proposition 3.7 and Lemma 3.6. We include the argument in the form needed for
  restrictions to subfields.

#thm([Lemma 3.1.])[
  (Monomial charts and restriction).  #emph[A real valuation of a function field of characteristic zero satisfying
    Abhyankar equality is quasi-monomial on a smooth proper model.
    The model can dominate a prescribed model and resolve finitely many additional functions and divisors.
    Its restriction to a subfunction field again satisfies Abhyankar equality.
    In particular, the restriction of a prime-divisor valuation is either trivial or a positive integral multiple
    of a prime-divisor valuation.]
] <a:abhyankar>

#proof[
  Choose functions with rationally independent values spanning the value group over $bb(Q)$,
    and functions of value zero whose residues form a transcendence basis of the residue field.
    Resolve the divisors of the first functions and the maps to $bb(P)^1$ defined by the second,
    together with the prescribed data. The latter functions are regular and invertible at the centre.
    Consequently the dimension of the centre is at least the residue transcendence degree.
    At least as many transverse boundary components as the rational rank pass through it:
    the independent values of the first functions are integral combinations of their orders.
    Abhyankar equality forces equality in both bounds. The centre is therefore the generic point of their
    transverse intersection, and the normal parameters have rationally independent values.
  In the completed local ring at that generic point, each nonzero function has a unique least-weight normal
    monomial with nonzero residue coefficient. The monomial ideal of strictly higher weight is finitely generated.
    The congruence to that monomial times a unit contracts to the local ring by faithful flatness.
    This proves the monomial formula.
  For a restriction, add the Abhyankar inequalities for the restricted valuation and the valued field extension.
    Equality for the full field forces equality for the restriction.
    A nonzero subgroup of the value group $bb(Z)$ of a prime divisor is $j bb(Z)$, $j > 0$.
    The restricted Abhyankar valuation of rational rank one is therefore $j$ times a prime-divisor valuation. ◻
]

For a rational top form $eta$, its #emph[form discrepancy] is $A_eta \( E \) = 1 +
  "ord"_E \( eta \)$ at a prime divisor, extended by the log smooth formula to quasi-monomial valuations.
  We also write $a_eta$. For a fractional form whose $r$-th power is a rational $r$-canonical form, use $1 +
  r^(- 1) "ord"_E \( eta^(⊗ r) \)$. The top wedge of logarithmic normal differentials and regular tangential
  differentials has form discrepancy zero at the monomial valuation;
  multiplication by a rational function adds its value. Pair discrepancy is form discrepancy minus the value of
  the log canonical divisor expressed with that form. The trivial valuation has discrepancy zero.
  Precise leading-form formulas are proved in Lemma 14.

=== 3.2 The cone and its canonical generator <the-cone-and-its-canonical-generator>

Fix a rational volume form $omega$ on $k \( X \) = k \( Z \)$ and use $K_X = "Div"_X \( omega \)$.
  For an indeterminate $t$, set

$ cal(A)_m = { g t^m : "Div"_X \( g \) - m K_X gt.eq 0 } union { 0 } \, wide cal(A) =
  xor.big_(m gt.eq 0) cal(A)_m \, wide W = "Spec" cal(A) . $

Here $cal(A)_0 = k \[ Z \]$. Denote the degree cocharacter by $D$, and the point of the vertex section above $z$ by $o$.

#thm([Lemma 3.2.])[
  (Canonical anticanonical cone).  #emph[The algebra $cal(A)$ is finitely generated and normal,
    with fraction field $k \( X \) \( t \)$. The variety $W$ is klt, and
$ Omega = t thin omega and d log t $

 has divisor zero on $W$. In particular it is a canonical generator, of $D$-weight one.]
] <a:canonical-cone>

#proof[
  Relative ampleness gives finite generation of a sufficiently divisible Veronese and finite generation of each
    shifted-degree module over it. Thus it gives finite generation in all degrees.
    The ring is the intersection of $k \( X \) \[ t \]$ with the valuation rings imposing $"ord"_P \( g \) -
    m P \( K_X \) gt.eq 0$ at strict prime divisors $P$ of $X$.
    Here and below, a strict prime of a specified model means a prime divisor on that model itself;
    a prime over the model may lie on any higher birational model.
    Thus a divisor extracted on a new model is strict on that model.
    The displayed intersection is therefore normal. Over the birational generic point of $Z$ its field is
    $k \( X \) \( t \)$.
  Consider
  $ hat(W) = "Spec"_X xor.big_(m gt.eq 0) cal(O)_X \( - m K_X \) t^m . $
  For a sufficiently divisible $r$, the analogous relative spectrum in degrees divisible by $r$ is the total space
    of a line bundle. It is proper over the Veronese cone: evaluation by generating sections embeds it,
    relative to $X$, into a product with affine space over $Z$, and $X arrow.r Z$ is proper.
    The original relative spectrum is finite over this line-bundle model.
    Since $W$ is separated over its Veronese cone, the resulting map $hat(W) arrow.r W$ is proper.
    It is birational by the fraction-field calculation. The same prime inequalities give normality of $hat(W)$.
  Over the smooth locus of $X$, if $s$ is a local rational function with $"Div" \( s \) = K_X$,
    the regular fibre coordinate is $s t$, and the displayed form is a nowhere-vanishing top form.
    The complement of this locus in $hat(W)$ has codimension at least two,
    as is also seen by the finite map to the line-bundle model.
  For completeness, the local singularities of $hat(W)$ are klt.
    Trivialize $r K_X$ locally and take the normalized cyclic cover adjoining $s$ with $s^r$ equal to its rational
    trivializing function. Because the coefficients of the Weil divisor $K_X$ are integral,
    this cover is quasi-etale. Finite crepant pullback preserves klt singularities.
    On the index cover, form the line-bundle algebra (the normalized reflexive pullback) with coordinate $y =
    s t$. The deck group acts on $y$ with the same character as on $s$, keeping $t$ invariant;
    the form $Omega = \( omega \/ s \) and d y$ is invariant.
    Its cyclic invariants recover the original algebra, by the codimension-one regularity inequalities.
    The cover of total spaces is again quasi-etale. The finite-cover discrepancy formula consequently proves that
    $hat(W)$ is klt. We have $"Div"_(hat(W)) \( Omega \) = 0$, and pushing forward gives $"Div"_W \( Omega \) =
    0$. Thus the proper birational map is crepant, and $W$ is klt as well. ◻
]

#thm([Lemma 3.3.])[
  (Gaussian discrepancy).  #emph[For a prime divisor $P$ over $X$,
    extend $P$ by the Gauss rule with $t$-weight $q - P \( K_X \)$.
    If $q gt.eq 0$, the extension $tilde(P)$ is centred on $W$, and
$ tilde(P) \( g t^m \) = m q + P \( "Div"_X \( g \) - m K_X \) \, wide A_W \( tilde(P) \) = q + A_X \( P \) . $

 If $q$ is rational it is divisorial up to positive scaling.
   Every $D$-invariant divisorial valuation centred on $W$ has this form, allowing a positive multiple of $P$,
   or has trivial restriction to $k \( X \)$, in which case its discrepancy is $q$.
   The ideal $I_n = \( cal(A)_n \) subset cal(A)$ satisfies $\( W \, I_n^(1 \/ n) \)$ lc.]
] <a:cone-gauss>

#proof[
  The value formula follows from the assigned weight of $t$.
    The divisor $"Div"_X \( g \) - m K_X$ is effective and rational Cartier, so the values are nonnegative.
    A Gauss extension is Abhyankar; wedging with $d log t$ preserves form discrepancy,
    while multiplication by $t$ adds $q - P \( K_X \)$. Since $A_omega \( P \) = A_X \( P \) + P \( K_X \)$,
    this proves the discrepancy formula. The rational-weight assertion follows from Lemma 7.
  An invariant valuation evaluates a sum of different torus characters by their minimum:
    finite torus translates separate the character components. It is therefore Gaussian.
    Properness gives a centre on $X$ for its restriction, and Lemma 7 applies.
    The same formulas hold for this restriction and for the trivial one. The corresponding $q$ is nonnegative:
    a sufficiently divisible relatively free anticanonical section can be chosen with zero divisor order at the
    centre, and its value on $W$ is its degree times $q$. The lc assertion reduces to
  $ 1 / n P #scale(x: 120%, y: 120%)[\(] \| - n K_X \| #scale(x: 120%, y: 120%)[\)] lt.eq A_X \( P \) \, $
  which is our choice of $n$. Invariant divisors suffice: take an equivariant log resolution of the invariant
    ideal; the connected torus fixes its finitely many prime components.
  We shall also use general members of these systems. On a log resolution,
    the fixed part is the ideal’s order and the residual system is free.
    A general member with coefficient $1 \/ n < 1$ is transverse to the fixed support and preserves the lc
    inequalities. The same choice in a finite-dimensional generating subspace can therefore be made lc on both $X$
    and $W$. ◻
]

=== 3.3 An lc place at the closed vertex <an-lc-place-at-the-closed-vertex>

We need a bounded hypersurface statement only for a fixed-index klt germ.
  It is the argument used in #cite(label("Chen")) proof of Proposition 5.1.

#thm([Lemma 3.4.])[
  (A hypersurface on a fixed-index germ).  #emph[Given $p gt.eq 2$ and an integer $N > 0$,
    there is $tau \( p \, N \) > 0$ with the following property.
    If $\( U \, G \)$ is klt near a closed point $x$, $G gt.eq 0$, $dim U = p$, and $N \( K_U + G \)$ is Cartier,
    then, after shrinking at $x$, an effective Cartier divisor $H_x$ through $x$ satisfies
    $\( U \, G + tau \( p \, N \) H_x \)$ lc.]
] <a:index-hypersurface>

#proof[
  Take a plt blowup extracting only $E$ over $x$, as in #cite(label("Chen")) Lemma 2.27.
    For its strict boundary $G_Y$, $- E$ and $- \( K_Y + G_Y + E \)$ are relatively ample rational Cartier
    divisors. Decreasing the coefficient of $E$ slightly gives a klt relative log Fano pair,
    so $Y$ is of Fano type over $U$. The coefficients of $G_Y$ belong to the finite $1 \/ N$-grid below one.
    The relative monotone lc complement theorem #cite(label("BirkarComplements")) Theorem 1.8 gives a
    bounded-index lc complement of $G_Y + E$ near $x$. Its coefficient at $E$ remains one.
  Push the complemented boundary down. The bounded-index principal identity pushes down as well and makes the
    pullback crepant, so the result is an lc boundary $G^(+) gt.eq G$ with $E$ an lc place.
    For a bounded common multiple $L$ of its complement index and $N$, the divisor $H_x =
    L \( G^(+) - G \)$ is effective Cartier. It passes through $x$:
    its order at $E$ is $L A_(\( U \, G \)) \( E \) > 0$. Taking $tau = 1 \/ L$,
    and then a common smaller positive choice over the finitely many bounded indices, proves the claim. ◻
]

In the next proposition, $N$ is a cutoff tending to infinity along the contradiction sequence;
  it is independent of the final complement index in Theorem 1.

#thm([Proposition 3.5.])[
  (A centred lc place detecting the bad sequence).  #emph[After passing to a subsequence,
    there are divisorial valuations $u^0$ centred at $o$, and integers $N arrow.r oo$, such that
#[#set math.equation(numbering: n => "(3.1)")
 $ u^0 \( I_n \) = n A_W \( u^0 \) \, wide u^0 \( frak(m)_z \) gt.eq N A_W \( u^0 \) . $ <eq:A2>]

 Here and below $frak(m)_z$ denotes also its extension to $cal(A)$.]
] <a:initial-lc-place>

#proof[
  Choose $N$ divisible by $n$, tending to infinity slowly enough that the bad divisors in the contradiction
    sequence satisfy
  $ frac(P \( frak(m)_z \), A_X \( P \)) > frac(N, tau \( p \, N \)) . $
  This is a diagonal choice: each fixed $N$ is allowed before passing sufficiently far along the bad sequence.
    For each individual algebra, choose $M > N$ sufficiently divisible that the degree-$M$ elements cut out the
    irrelevant locus set-theoretically. Set
  $ I = \( cal(A)_N \, frak(m)_z \, cal(A)_M \) . $
  Its radical is $frak(m)_o = frak(m)_z cal(A) + cal(A)_(> 0)$.
    Since $I_n^(N \/ n) subset I$, Lemma 9 implies $\( W \, I^(1 \/ N) \)$ lc.
  Suppose it were klt near $o$. A general element $g$ of a finite generating space of $I$ would give $G =
    N^(- 1) "Div" \( g \)$ klt there. Indeed the moving part has coefficient $1 \/ N < 1$ on a log resolution.
    The canonical generator of $W$ shows that $N \( K_W + G \)$ is Cartier.
    Lemma 10 supplies an effective Cartier hypersurface $H_o$ through $o$ for which
    $\( W \, G + tau \( p \, N \) H_o \)$ is lc.
  Choose rational $q$ with
  $ frac(A_X \( P \), tau \( p \, N \)) < q lt.eq frac(P \( frak(m)_z \), N) . $
  The Gauss extension $tilde(P)$ has positive value on every positive-degree element and on $frak(m)_z$,
    hence is centred at $o$. It has value at least $N q$ on $I$, whereas its bare discrepancy is $q +
    A_X \( P \)$. Consequently
  $ A_(\( W \, G \)) \( tilde(P) \) lt.eq A_X \( P \) . $
  Moreover $tilde(P) \( frak(m)_o \) gt.eq q$: each positive-degree homogeneous term has value at least its degree
    times $q$, and each degree-zero term vanishing at $z$ has value at least $N q$.
    A local equation of $H_o$ therefore has value at least $q$. This contradicts lc, since
  $ A_(\( W \, G \)) \( tilde(P) \) lt.eq A_X \( P \) < tau \( p \, N \) q lt.eq tau \( p \, N \) tilde(P) \( H_o \) . $
  Thus $I^(1 \/ N)$ is lc but not klt at $o$. An lc divisor on a log resolution is centred there,
    because $I$ is supported at $o$ and $W$ is klt elsewhere. For this divisor,
  $ A_W \( u^0 \) = frac(u^0 \( I \), N) lt.eq frac(u^0 \( I_n \), n) lt.eq A_W \( u^0 \) . $
  Both inequalities are equalities. Since $frak(m)_z subset I$, the second inequality in (3.1) follows too. ◻
]

== 4 Exact normalized-volume minimization with an lc constraint <a:minimum>

The principal point of this section is that a constrained minimum is already an ordinary klt minimum for a
  sufficiently small positive perturbation. Convergence to the constraint would not suffice for the
  finite-generation argument.

=== 4.1 The ordinary klt inputs <the-ordinary-klt-inputs>

For a valuation $u$ centred at a closed point $x$ of a $p$-dimensional germ, put

$ frak(a)_m \( u \) = { F : u \( F \) gt.eq m } \, wide "vol" \( u \) =
  lim_(m arrow.r oo) frac(p ! thin dim_k \( cal(O)_(U \, x) \/ frak(a)_m \( u \) \), m^p) . $

The limit exists for these valuation-ideal families #cite(label("CutkoskyVolumes")) Theorem 1.1 and Corollary 5.6;
  the local rings here are excellent and normal, so their completions are reduced.
  For a klt pair with discrepancy $A$, the normalized volume is $A \( u \)^p "vol" \( u \)$.

We use the following established results in their ordinary klt setting.
  The minimum is attained at a unique ray, its valuation is quasi-monomial,
  and its associated graded algebra is finitely generated and defines a klt K-semistable log Fano cone.
  The induced grading again minimizes: see #cite(label("BlumExistence")) Main Theorem and Section 7.3,
  #cite(label("XuQuasimonomial")) Theorem 1.2 and Remark 3.8, #cite(label("XuZhuangUniqueness")) Theorem 1.1,
  and #cite(label("XuZhuangStable")) Theorems 1.1–1.2, with the cone characterization in
  #cite(label("LiXuStable")) Theorem 3.5. For the bare klt germ, the estimates

$ hat("vol")_U \( u \) gt.eq c_U frac(A_U \( u \), u \( frak(m)_x \)) \, wide u \( F \) lt.eq
  C_U A_U \( u \) "ord"_(frak(m)_x) \( F \) $

are the properness and log Izumi estimates of #cite(label("LiProperness")) Theorems 1.1–1.2.
  Their constants may depend on this individual germ.

If the boundary is a rational nonnegative combination of divisors of regular equations,
  its specialized boundary is the corresponding combination of divisors of their initial equations.
  The precise simultaneous specialization, including possible component multiplicities, is proved in Lemma 17.
  Thus all the uses below are of effective rational klt pairs.

#thm([Lemma 4.1.])[
  (A uniform comparison at a minimizer).  #emph[Let $b$ minimize normalized volume for a $p$-dimensional klt pair.
    For every centred quasi-monomial valuation $u$ and every nonzero $F in cal(O)_(U \, x)$,
#[#set math.equation(numbering: n => "(4.1)")
 $ u \( F \) lt.eq C_p frac(A \( u \), A \( b \)) thin b \( F \) \, $ <eq:A3>]

 where $C_p$ depends only on $p$. Multiplying the discrepancy function by a common positive constant does not
   change this inequality.]
] <a:minimizer-comparison>

#proof[
  The relative expected-vanishing criterion #cite(label("XuZhuangUniqueness")) Lemma 3.3,
    Definition 3.4 and Theorem 3.10 gives $A \( u \) gt.eq S \( b \; u \)$.
    On $Q_m = cal(O)_(U \, x) \/ frak(a)_m \( b \)$, let $W_m \( b \; u \)$ be the sum of the jumping weights of
    the induced $u$-filtration, with integer rounding if desired. Then
  $ frac(S \( b \; u \), A \( b \)) = lim_(m arrow.r oo) frac(W_m \( b \; u \), W_m \( b \; b \)) . $
  The induced filtration is the image filtration: its dimension at level $q$ is
  $ dim_k frac(frak(a)_q \( u \), frak(a)_q \( u \) ∩ frak(a)_m \( b \)) . $
  Filtering this image by the $b$-grading gives the same dimension, so no compatibility of bases is being assumed.
  Suppose $b \( F \) > 0$, and put $k_m = floor.l m \/ \( 2 b \( F \) \) floor.r$.
    Multiplication by $F^(k_m)$ embeds $cal(O)_(U \, x) \/ frak(a)_(m - k_m b \( F \)) \( b \)$ into $Q_m$.
    Every vector in this image has induced $u$-level at least $k_m u \( F \)$.
    The image dimension is asymptotic to $2^(- p) dim_k Q_m$, whereas $W_m \( b \; b \) lt.eq m dim_k Q_m$. Thus
  $ frac(S \( b \; u \), A \( b \)) gt.eq 2^(- p - 1) frac(u \( F \), b \( F \)) . $
  The integer-rounding errors vanish in this limit. This proves (4.1), for example with $C_p = 2^(p + 1)$.
    A unit has value zero at both valuations. ◻
]

A second proof for canonical-generator germs with Cartier-equation boundaries appears in Section 5.4,
  after the specialization and torus-field constructions it uses.

=== 4.2 The constrained problem <the-constrained-problem>

#thm([Proposition 4.2.])[
  (Exact penalization).  #emph[Let $x in U$ be an affine klt germ of dimension $p$, and let $I_0 \,
    J$ be nonzero ideals. Suppose $c > 0$ is rational, $\( U \, I_0^c \)$ is lc,
    and an lc quasi-monomial place is centred at $x$. Let $b_0 gt.eq 1$ and $c' gt.eq 0$ be rational, and assume
$ a \( u \) = b_0 A_U \( u \) - c' u \( J \) \, wide A_U \( u \) lt.eq a \( u \) lt.eq b_0 A_U \( u \) . $

 The minimum of $a \( u \)^p "vol" \( u \)$ among centred quasi-monomial lc places of $I_0^c$ is attained at a
   unique ray. This same ray minimizes normalized volume for a family of ordinary effective rational klt pairs for
   every sufficiently small positive rational parameter. In particular its associated graded is finitely
   generated. It is invariant, after an invariant normalization, under any torus preserving $x \, I_0 \, J$.]
  #emph[All smallness thresholds and constants in the proof may depend on the fixed germ and ideals.]
] <a:exact-penalization>

#proof[
  #emph[From ideals to ordinary klt minimizers.] Choose a common log resolution of $U \, I_0 \, J \, frak(m)_x$.
    Replace the order of each ideal by the average orders of sufficiently many general elements in a prescribed
    finite-dimensional generating space. Write the resulting functions as
  $ C = A_U - B_0 \, wide a_D = b_0 A_U - B_J \, $
  where $B_0$ and $B_J$ are rational nonnegative combinations of the divisors of the chosen regular equations,
    including the coefficients $c$ and $c'$. The resolving support and these general moving hypersurfaces form a
    simple normal crossing divisor $Phi$: choose successively transverse members on its finitely many strata.
    Dividing each coefficient among enough members makes every new moving coefficient sufficiently small.
  The old component orders are unchanged. The simple normal crossing discrepancy tests therefore give
  $ C gt.eq 0 \, wide a_D gt.eq A_U \/ 2 \, wide a_D lt.eq b_0 A_U . $
  They also give $C = 0$ exactly on the original ideal-lc places and $a_D = a$ there.
    Indeed the discrepancy expression for $C$ has nonnegative residual term and component terms,
    strictly positive on every added moving component, including those used for $J$.
    An ideal-lc place has $C = 0$ by comparison with the fixed ideal orders; conversely, $C =
    0$ forces all these moving orders to vanish and recovers the original ideal equality.
    Every chosen equation then has exactly its ideal’s order.
  For positive rational $t'$, sufficiently small, the function
  $ frac(C + t' a_D, 1 + t' b_0) $
  is the discrepancy of the effective rational klt pair with boundary
  $ Delta_(t') = frac(B_0 + t' B_J, 1 + t' b_0) . $
  Let $u = u_(t')$ minimize its normalized volume, with $u \( frak(m)_x \) = 1$.
    Comparison with one fixed centred lc place and $a_D gt.eq
    A_U \/ 2$ bounds $A_U \( u \)^p "vol" \( u \)$ independently of $t'$.
    Properness bounds $A_U \( u \)$; log Izumi consequently bounds $"vol" \( u \)$ away from zero.
    The same comparison now gives $C \( u \) = O \( t' \)$.
  #emph[Retraction to the lc strata.] Let $Sigma$ consist of the coefficient-one components for $C$ on the fixed
    resolution. Use the monomial retraction of #cite(label("JM")) Lemma 4.7 and Corollary 4.8:
    retract $u$ to the generic stratum of $Sigma$ through its centre, retaining the same positive normal weights,
    and call the retraction $w$. The component formulas give
  $ d_log := A_(\( Y \, Sigma \)) \( u \) & lt.eq C_1 C \( u \) \, & C \( w \) & = 0 \,\
a_D \( w \) & lt.eq a_D \( u \) \, & w \( frak(m)_x \) & gt.eq 1 - C_1 C \( u \) . $
  To see the first bound, express $C$ as $A_(\( Y \, Phi \))$ plus the component values multiplied by their
    discrepancies. These coefficients are zero exactly on $Sigma$, and positive on the omitted components.
    For $d_log$, the omitted coefficients are instead one. The formula for $a_D$ has a nonnegative residual term
    and positive component coefficients. The maximal ideal is a fixed component sum.
    These observations give all four comparisons. In particular, for small $t'$, $w$ is nontrivial and centred at $x$.
  Retraction has removed the lc defect and has not increased $a_D$.
    To compare the two objectives, we must also control its possible increase in volume.
    We prove the following quantitative claim for the minimizers $u =
    u_(t')$ and their retractions $w$ constructed above:
  #[#set math.equation(numbering: n => "(4.2)")
   $ u \( F \) lt.eq \( 1 + C_2 C \( u \) \) w \( F \) wide \( 0 eq.not F in cal(O)_(U \, x) \) . $ <eq:A4>]
  The constant $C_2$ is independent of $F$ and of sufficiently small $t'$ on this fixed resolved germ.
    We first isolate a polynomial’s least normal terms by a differential operator of controlled order,
    then bound the value lost under differentiation. A local truncation will give the claim for every regular $F$.
  #emph[Polynomial isolation.] Cover the relevant strata by finitely many etale-coordinate charts
    $\( x_1 \, dots.h \, x_s \, y_1 \, dots.h \, y_(p - s) \)$, with $x_i =
    0$ the components of $Sigma$ through the centre and $w_i = u \( x_i \) > 0$.
    For a polynomial $G$ of degree at most $M$ in fixed affine generators of $k \[ U \]$ vanishing at $x$, we claim
  #[#set math.equation(numbering: n => "(4.3)")
   $ u \( G \) - w \( G \) lt.eq C_3 \( 1 + M \) d_log . $ <eq:A5>]
  We will obtain a differential expression with $u$-value exactly $w \( G \)$,
    using $O \( 1 + M \)$ tangential and logarithmic normal derivatives.
    The order bound must remain independent of the smallest positive normal weight;
    otherwise it would not control the minimizers as their weights approach a face.
  Expand $G$ normally in the $x_i$ at the generic stratum. Etaleness identifies the coefficient field as the
    finite separable residue-field lift over $k \( y \)$. Its normal Taylor coefficients are restrictions of
    regular lifted $x$-derivatives divided by factorials; they are regular on the stratum.
    Lifted $y$-derivatives differentiate these coefficients without changing normal exponents.
    At a closed point this agrees with the expansion in $x$ and translated tangential coordinates.
  Let $H$ be the sum of the least-weight normal terms of $G$.
    We first bound every active exponent by $O \( 1 + M \)$, independently of the smallest positive weight.
    The extension $k \( U \) \/ k \( x_1 \, dots.h \, x_s \, y_1 \, dots.h \, y_(p - s) \)$ is finite.
    Fixed multiplication matrices for the affine generators give a relation
  $ sum_j a_j \( x \, y \) G^j = 0 $
  of fixed degree in $G$, with polynomial coefficient degrees $O \( 1 + M \)$.
    Indeed entries in a degree-$M$ polynomial of these matrices have denominators bounded by powers of fixed
    denominators; the characteristic polynomial and denominator clearing preserve a linear degree bound.
  For a positive normal weight vector $lambda$, write $f \( lambda \) =
    min_(alpha in "Supp"_x \( G \)) chevron.l alpha \, lambda chevron.r$.
    At least two different powers $j \, j'$ tie at the least value in the relation.
    Choose normal exponents $beta \, beta'$ in the finite supports of $a_j \,
    a_(j')$ that attain their respective minimum weights. Here the supports retain only coefficients nonzero in
    the stratum field. The tie gives
  $ f \( lambda \) = frac(chevron.l beta - beta' \, lambda chevron.r, j' - j) . $
  Thus $f$ takes its values among finitely many linear forms whose coefficients are $O \( 1 + M \)$:
    the coefficient degrees bound $beta \, beta'$, and $\| j' - j \| gt.eq 1$.
    The Taylor minimum is locally finite on the positive orthant,
    since the coordinates of $lambda$ stay bounded below in a small neighbourhood and all normal exponents are
    nonnegative. Let $cal(A) \( lambda \)$ be the finite set of active Taylor exponents.
    For every coordinate $i$ and all sufficiently small $h > 0$, local finiteness gives
  $ frac(f \( lambda \) - f \( lambda - h e_i \), h) = max_(alpha in cal(A) \( lambda \)) alpha_i . $
  On this segment, $f$ agrees with the restriction of one of the finitely many linear forms above,
    so the quotient is $O \( 1 + M \)$. It bounds every active coordinate, including tied exponents.
    The permissible $h$ may shrink as the weights approach a face, but the bound does not:
    no division by a normal weight has occurred.
  Take the least parts of the relation at the given weights and divide out the lowest power of $H$.
    The resulting polynomial relation in $H$ has a nonzero constant term,
    an $x$-polynomial with coefficients polynomial in $y$ of degree $O \( 1 + M \)$.
    At a general closed point of the centre, not every coefficient of $H$ can vanish to order exceeding that
    bound. Otherwise the relation would force every coefficient of its nonzero constant term to vanish to that
    order, impossible for a nonzero polynomial of the stated degree in etale tangential coordinates.
    All other coefficients in the relation are regular there,
    so their possible vanishing cannot invalidate this implication.
  A tangential derivative of order $O \( 1 + M \)$ therefore makes one active coefficient a unit.
    Let its normal exponent be $alpha$. For each normal coordinate apply the product of $x_i partial_(x_i) -
    j$ over the integers from zero to the active coordinate bound other than $alpha_i$.
    This isolates the chosen active monomial, with total differential order $O \( 1 + M \)$.
    Both sorts of derivatives preserve normal exponents; lower-weight coefficients remain zero.
    To interpret the resulting congruence in the local ring, work at the chosen closed point of the centre and put
  $ I_(>) = #scale(x: 120%, y: 120%)[\(] x^beta : sum_i beta_i w_i > w \( G \) #scale(x: 120%, y: 120%)[\)] . $
  This monomial ideal is finitely generated for the individual positive weights.
    In the completion, the output is congruent to $x^alpha$ times a coefficient whose residue on the stratum is a
    unit. Lift that residue coefficient from $cal(O)_Y \/ \( x_1 \, dots.h \, x_s \)$ to an ordinary local unit
    $h$. Since $x^alpha \( x_1 \, dots.h \, x_s \) subset I_(>)$,
    the output minus $x^alpha h$ lies in the completed ideal $I_(>)$, hence in $I_(>)$ by faithful flatness.
    Localize this congruence at the generic centre of $u$. Every ideal generator has $u$-value strictly larger
    than $w \( G \)$. The isolated output consequently has #emph[exactly] $u$-value $w \( G \)$.
    The positive gap here may depend on the valuation; its size is never used in an estimate.
  #emph[The differential loss.] Let $lambda_0 = and.big_i d log x_i and and.big_j d y_j$.
    For a prime divisor $E$ centred in the chart, $"ord"_E \( lambda_0 \) = A_(\( Y \, Sigma \)) \( E \) - 1$.
    Replacing a factor by $d G_(*) \/ G_(*)$ multiplies the wedge, up to sign,
    by $x_i partial_(x_i) G_(*) \/ G_(*)$ or $partial_(y_j) G_(*) \/ G_(*)$.
    The new wedge has order at least $- 1$: at a uniformizer of $E$,
    each logarithmic differential has only a possible simple logarithmic pole,
    and a nonzero wedge can contain that normal logarithmic factor at most once.
    Pullbacks of regular tangential differentials have no poles.
    Therefore each indicated derivation lowers value by at most $A_(\( Y \, Sigma \)) \( E \)$,
    including over a proper subcentre of the stratum. Approximate real monomial weights on a higher adapted chart
    by rational divisorial weights. Continuity of the fixed function values and discrepancy gives the same
    inequality for $u$. The operator $x_i partial_(x_i) - j$ obeys it too,
    because constants have value zero and $d_log gt.eq 0$. Composing the bounded number of factors loses at most
    their total order times $d_log$. The exact value of the isolated output proves (4.3).
  #emph[From polynomials to local functions.] For a nonunit $F in cal(O)_(U \, x)$, take $M =
    ceil.l 3 w \( F \) ceil.r + 1$. Modulo $frak(m)_x^M$, the local ring is spanned by polynomials of degree less
    than $M$ in the fixed affine generators. In particular a unit denominator is inverted by its finite geometric
    series in this quotient. Choose such a polynomial $G$ representing $F$.
    For small $t'$, $w \( frak(m)_x \) gt.eq 1 \/ 2$, so the remainder has $u$-value at least $M$ and $w$-value at
    least $M \/ 2 > w \( F \)$. Thus $w \( G \) = w \( F \)$.
    Also $w \( F \) gt.eq 1 \/ 2$, so $1 + M lt.eq C' w \( F \)$.
    Equation (4.3) and $d_log lt.eq C_1 C \( u \)$ now show that
  $ u \( G \) lt.eq \( 1 + C_2 C \( u \) \) w \( F \) < M $
  for all sufficiently small $t'$. Hence $u \( F \) = u \( G \)$, proving (4.2).
    Units have value zero at both valuations.
  #emph[Exactness of the minimum.] We now compare the objectives at $u$ and $w$. Put $K = 1 + C_2 C \( u \)$.
    Equation (4.2) gives $frak(a)_m \( u \) subset.eq frak(a)_(m \/ K) \( w \)$,
    and therefore $"vol" \( u \) gt.eq K^(- p) "vol" \( w \)$.
    On the fixed germ, properness has bounded $a_D \( w \) lt.eq b_0 A_U \( u \) lt.eq M_0$.
    Choose $t'$ so small that $C_2 t' M_0 < 1$. If $C \( u \) > 0$, then
  $ \( C + t' a_D \) \( u \) - K thin t' a_D \( w \) gt.eq C \( u \) #scale(x: 120%, y: 120%)[\(] 1 -
    C_2 t' a_D \( w \) #scale(x: 120%, y: 120%)[\)] > 0 . $
  Together with the volume inequality this contradicts minimality of $u$, because $C \( w \) = 0$.
    Thus $C \( u \) = 0$ exactly.
  On the constraint, $a_D = a$, so every sufficiently small parameter gives a constrained minimum.
    Conversely any other constrained minimum would also minimize that ordinary klt objective, whose ray is unique.
    The ray is consequently independent of the small parameter. Stable degeneration gives finite generation.
    A torus preserving the ideals and point preserves the constrained objective and its unique ray;
    an invariant normalization, for instance by $u \( frak(m)_x \)$, makes the valuation invariant.
    This proves the proposition. ◻
]

== 5 Leading forms and compatible further filtrations <a:filtrations>

The exact minimizer gives one finitely generated graded ring.
  To improve that ring by a further minimization, we must preserve its canonical form, the lc equations,
  and the values of specified functions on the original variety.
  This section proves these compatibility statements. Its final flattening lemma realizes two successive
  filtrations by a single real valuation on the original function field.

=== 5.1 Full initial fields and leading forms <full-initial-fields-and-leading-forms>

All associated graded fields in this section include every homogeneous degree.
  Thus, for a valued function field $\( K \, b \)$, we write

$ K_b = "Frac" \( "gr"_b K \) . $

This is not the degree-zero residue field. Its transcendence degree is $"ratrank" \( b \) +
  "trdeg"_k kappa \( b \)$: choose functions of independent values and lifts of a residue transcendence basis;
  after these choices any further homogeneous element is algebraic, by taking monomial ratios.
  In particular $"trdeg"_k K_b = "trdeg"_k K$ for an Abhyankar valuation.
  In the rationally independent smooth monomial chart of Lemma 7,
  it is the rational normal-variable field over the stratum field.
  Every homogeneous fraction is a stratum coefficient times a Laurent monomial,
  and the normal variables are algebraically independent because their weights are rationally independent.
  A Gaussian extension by weighted variables adjoins their independent initial variables to the previous full
  initial field.

These descriptions also justify the continuities used below.
  On a positive monomial cone, the value of a fixed rational function is locally a difference of minima on finite
  supports. Form discrepancy is linear on the corresponding log smooth chart. Both are therefore continuous.

For normal test configurations with normal central fibre,
  preservation of a canonical generator is the top-degree case of #cite(label("XuZhuangForms")) Definition 3.3 and
  Proposition 3.5(2). Here we identify the leading rational top form on the full initial field and retain
  prescribed rational-function tests.

#thm([Lemma 5.1.])[
  (Leading differential forms).  #emph[Let $b$ be a real Abhyankar valuation of a characteristic-zero function
    field $K \/ k$, and choose $s_1 \, dots.h \, s_q in K^(*)$ whose initials form a transcendence basis of
    $K_b \/ k$, where $q = "trdeg"_k K$. If $eta = g and.big_(i = 1)^q d log s_i$, then
#[#set math.equation(numbering: n => "(5.1)")
 $ A_eta \( b \) = b \( g \) \, wide eta_b = macron(g) and.big_(i = 1)^q d log macron(s)_i . $ <eq:A6>]

 The second formula is independent of the probes $s_i$, is equivariant for actions preserving $b$,
   and applies to fractional forms by taking tensor powers.]
] <a:leading-form>

#proof[
  Use the rationally independent normal monomial chart, including the divisors of the finitely many probes in the
    monomialization. A basis of logarithmic normal differentials together with logarithmic differentials of a
    separating unit tangential basis has wedge of form discrepancy zero.
    Each probe is a unit times a Laurent normal monomial. In this basis its logarithmic differential has
    coefficients of nonnegative value. Their degree-zero parts are exactly the coefficients of its initial
    logarithmic differential in the initial variables: a logarithmic normal derivative of a unit reduces to zero,
    and a tangential derivative differentiates its restriction.
    Lifted etale coordinate derivations give these assertions in the local ring.
  The determinant relating the probe wedge to this fixed wedge has nonzero reduction,
    since the initial probes are algebraically independent and the field has characteristic zero.
    Its value is therefore zero. This proves the discrepancy formula.
    Comparing two sets of probes by the same determinant computation proves the independence of the leading form.
    The construction commutes with field automorphisms preserving the valuation.
    Applying it to an integral tensor power and then dividing discrepancies by that power gives the
    fractional-form assertion. ◻
]

=== 5.2 Finite presentations and simultaneous specialization <finite-presentations-and-simultaneous-specialization>

We next realize a finitely generated associated graded ring by a weight family,
  retaining the rational functions that specify its canonical form and boundary.
  Finite generating sets of initials and the corresponding weight presentations are developed in
  #cite(label("KavehManon")) Theorem 2.17, Lemmas 3.2 and 3.4, and Section 3.3.
  The proof below explains how log Izumi and maximal-ideal powers end the subduction with an exact polynomial
  representative in our local setting.

#thm([Lemma 5.2.])[
  (Finite adapted presentations).  #emph[Let $x in U$ be an affine klt germ and let $b$ be a quasi-monomial
    valuation centred at $x$. Suppose $R_b = "gr"_b k \[ U \]$ is finitely generated.
    One can choose affine algebra generators $x_i$, all vanishing at $x$, whose initials generate $R_b$.
    If $J subset k \[ X_1 \, dots.h \, X_N \]$ is their relation ideal, then
$ R_b = k \[ X_1 \, dots.h \, X_N \] \/ "in"_(b \( x_i \)) J \, $

 where $"in"$ always means the #emph[minimum]-weight initial ideal.
   Every regular function has a polynomial representative attaining its valuation and prescribed initial;
   the analogous statement holds for rational functions using fractions.]
] <a:adapted-presentation>

#proof[
  Add lifts of finitely many graded generators to any affine generating set,
    subtracting constants from the latter. All generator weights are positive.
    The minimum of a polynomial relation vanishes on their initials, giving one inclusion.
    Conversely, a homogeneous relation between these initials lifts to a function of strictly higher value.
    Subtract a polynomial matching that new initial, and continue with strictly higher-weight polynomials.
    Only finitely many monomial weights in these generators occur below any fixed bound,
    so the residual value can be made arbitrarily large. Log Izumi then puts the residual in an arbitrarily high
    power of the maximal ideal of the local ring. The same holds in the affine ring:
    the power of the closed-point maximal ideal is primary. That ideal is generated by the $x_i$,
    so a polynomial expression in its sufficiently high power has all monomials of strictly higher weight than the
    starting relation. This ends subduction with an actual polynomial relation of the desired initial.
    The identical argument, starting from a function instead of a relation, gives adapted representatives.
    Local unit denominators have constant initial, so the affine and local graded rings agree;
    taking fractions gives the final assertion. ◻
]

#thm([Lemma 5.3.])[
  (Canonical specialization).  #emph[In Lemma 15, suppose further that $R_b$ is normal and that $U$ has a
    canonical generator $Omega_U$. Then $\( Omega_U \)_b$ generates the canonical divisor of $"Spec" R_b$:
    its divisor is zero. There is a one-parameter weight family realizing this specialization and preserving
    initial identifications on any prescribed finite set of rational functions.]
] <a:canonical-specialization>

#proof[
  Choose finite relations whose minima generate the initial ideal in Lemma 15.
    Add adapted representatives of the finite tests, including full probes and the coefficient $g$ in (5.1).
    Their ties and strict weight comparisons form a finite system of rational linear equalities and strict
    inequalities. Approximate the generator weights, up to common scaling,
    by positive integers $m_i$ preserving that system. Consider the domain
  $ cal(R) = k \[ s \, s^(- m_i) x_i \] subset k \[ U \] \[ s \, s^(- 1) \] . $
  It is flat over $k \[ s \]$, since it is torsion-free. Its fibre at zero has the minimum-weight initial
    presentation for these integer weights. Indeed substitution and homogenization give one inclusion; conversely,
    separating the powers of $s$ in a homogeneous expression lying in $\( s \)$ expresses its upstairs value by
    terms of strictly higher weight.
  The chosen initial relations show that this fibre’s ideal contains the prime presenting $R_b$.
    The zero-coordinate section makes the fibre nonempty. Every minimal prime of the principal ideal $\( s \)$ has
    height one in the finite-type domain $cal(R)$, so the fibre has dimension $dim U$.
    The old initial prime has that same dimension, since its fraction field is $K_b$.
    A strict enlargement would have smaller dimension. Thus the initial ideals coincide and the special fibre is
    exactly $"Spec" R_b$, with the required test initials.
  All fibres are normal: the nonzero ones are copies of $U$, and the zero fibre is normal by hypothesis.
    Flatness over the smooth curve therefore gives normality of the total space.
    The form $Omega_U and d s$ has zero divisor away from the special fibre.
    That fibre is irreducible, reduced and Cartier, so multiplication by a power of $s$ gives a rational form with
    zero divisor on the total space, hence a canonical generator on its smooth locus.
  We identify its relative restriction explicitly. At the generic point of the special fibre,
    write the tested probes as $s_i = s^(e_i) S_i$ and $g = s^(e_g) G$,
    with residues $macron(s)_i$ and $macron(g)$. Because a factor involving $d s$ disappears after wedging with $d s$,
  $ Omega_U and d s = s^(e_g) G and.big_i d log S_i and d s . $
  The initial logarithmic probe wedge is nonzero. The normalizing power is consequently exactly $- e_g$,
    and the relative restricted form is $macron(g) and.big_i d log macron(s)_i = \( Omega_U \)_b$, up to sign.
    At every codimension-one point of the normal special fibre that fibre is smooth;
    flatness and geometric smoothness there make the family smooth over the base.
    Its relative generator restricts to a generator there. Thus $\( Omega_U \)_b$ has zero divisor on $"Spec"
    R_b$, as claimed. This argument uses only codimension-one restriction,
    and makes no canonical-sheaf base-change assumption at singular points. ◻
]

#thm([Lemma 5.4.])[
  (Simultaneous boundary specialization).  #emph[In the preceding situation,
    a rational effective boundary expressed as a sum of divisors of regular equations specializes to the same sum
    of the divisors of their initial equations. This identification agrees with specializing its prime components,
    with all multiplicities.]
] <a:boundary-specialization>

#proof[
  For a principal ideal, valuation multiplicativity makes its associated graded ideal principal,
    generated by the equation’s initial. We verify that component ideals can be preserved at the same time.
    For each of the finitely many component ideals, use its polynomial preimage in the adapted presentation.
    Its minimum initial ideal maps onto the associated graded ideal:
    the adapted representatives in Lemma 15 prove this also for each element of the ideal.
  Homogenize all these polynomial ideals with one extra variable of weight zero.
    Each homogeneous minimum ideal has finitely many generators that are minima of homogeneous elements of the
    original homogenized ideal. Preserve these generators, and the ring’s initial ideal and the equation tests,
    in one positive integral weight approximation. Inclusion of the old minima in the new minima is then
    automatic. There can be no extra elements, since both homogeneous minimum ideals have the original Hilbert
    function, obtained by filtering each finite-dimensional total-degree piece.
    Dehomogenization preserves the equality: distinct terms of one homogeneous polynomial cannot coalesce after
    setting the extra variable to one.
  The component closures in the resulting weight family have these specialized ideals,
    as follows by using the analogous family algebras of the quotient rings.
    Rescale each boundary equation by its parameter power. Its divisor has no vertical component and restricts to
    the divisor of the nonzero initial equation. Intersection of codimension-one cycles with the special-fibre
    parameter is additive. This can also be checked at the regular codimension-one points of the normal special
    fibre, where the total family is smooth over the base. Decomposing the horizontal equation divisors into their
    prime components therefore gives precisely the same restricted boundary cycles and multiplicities. ◻
]

=== 5.3 Torus fields and flattening on the original field <torus-fields-and-flattening-on-the-original-field>

We have now identified the specialized canonical form and boundary.
  The remaining task is to combine two graded constructions while retaining that information.
  Torus invariance separates the first grading from the second and makes the required combination possible.

The value torus has character lattice generated by the occurring valuation degrees.
  Its grading valuation is the real cocharacter that evaluates these degrees, injectively on this lattice.
  When other invariant torus actions descend, we also use their joint effective torus.
  For a faithful torus grading on a field generated by homogeneous functions,
  choose multiplicative rational variables $z^mu$ for a basis of its character lattice $M$.
  Such variables exist because the occurring characters generate $M$ as a group. If $K^T$ is the invariant field, then

$ K = K^T \( z^(mu_1) \, dots.h \, z^(mu_r) \) . $

Distinct characters give algebraic independence, and division of every homogeneous generator by its corresponding
  torus variable produces an invariant generator. In particular invariants are generated by ratios of equal-weight
  homogeneous elements.

A $T$-invariant valuation is Gaussian in these variables.
  To see the minimum rule, span the finitely many character terms of a sum by finitely many torus translates and
  invert their character matrix. Invariance shows that each term has value at least that of the sum;
  the valuation inequality gives the reverse comparison with the minimum.
  Formula (5.1) thus applies using the torus variables and full independent initials of the restricted valuation.
  In particular a pure cocharacter valuation evaluates a homogeneous volume form’s discrepancy by its character.

The next construction refines the successive-degeneration argument of #cite(label("LiXuStable")) proof of
  Theorem 4.16 and Remark 4.17. We retain a prescribed finite set of rational-function initials and the leading
  top form, and record uniform comparison with the first valuation.

#thm([Lemma 5.5.])[
  (Compatible real flattening).  #emph[Let $b$ be as in Lemma 15, and let $T$ be the value torus of $R =
    "gr"_b k \[ U \]$, so that $b$ is injective on its character lattice.
    Let $u$ be a $T$-invariant quasi-monomial valuation centred at the vertex of $"Spec" R$, with $R' =
    "gr"_u R$ finitely generated. Any stipulated old grading on $U$ is assumed to preserve $b$ and to act on $R$
    through $T$.]
  #emph[For arbitrarily small positive real $xi$, there is an Abhyankar valuation $b_xi$ on the #emph[actual]
    field $k \( U \)$ with associated graded ring $R'$, graded by first weights plus $xi$ times second weights.
    Its value torus is the joint torus generated by $T$ and the value torus of $u$ on $R'$.
    It preserves the stipulated grading. For any finite set of rational functions,
    one can preserve both their double initials and the formula
$ b_xi \( F \) = b \( F \) + xi u \( "in"_b F \) . $

 One can also arrange, on every nonzero regular function,
$ 1 / 2 b \( F \) lt.eq b_xi \( F \) lt.eq 2 b \( F \) . $

 If $U \, R$ have the canonical generators in Lemma 16 and both $b \,
   u$ have their respective form discrepancies equal to one, the finite tests can be chosen so that
$ A_(Omega_U) \( b_xi \) = 1 + xi \, wide \( Omega_U \)_(b_xi) = \( \( Omega_U \)_b \)_u . $

]
] <a:flattening>

#proof[
  First use the lexicographically ordered valuation
  $ V \( F \) = \( b \( F \) \, u \( "in"_b F \) \) . $
  On each first-weight slice its second graded calculation is exactly the one for $u$.
    Invariance makes the $u$-filtration split over first degrees.
    Hence its associated graded on $k \[ U \]$ is precisely $R'$, with the joint grading.
    Choose lifted joint homogeneous generators, including the additional generators needed for $R$ and
    $k \[ U \]$. Take them homogeneous for the stipulated old grading and vanishing at the point.
    In the lexicographic subduction procedure there are only finitely many possible values with bounded first
    coordinate: the first graded pieces are finite-dimensional and only finitely many occur up to that bound.
    Subduction therefore works as in Lemma 15, using log Izumi for the first coordinate.
    In particular the lexicographic minimum ideal is the prime presenting $R'$,
    and adapted polynomial and fractional representatives exist.
  Choose $xi > 0$ small enough to preserve the minima of finitely many relations generating that initial prime,
    and avoid all rational ties on the joint character lattice. The flattened initial ideal contains this prime.
    Suppose it contained an extra initial relation. Approximate the positive flattened generator weights by
    positive integral weights, preserving that extra minimum together with the previous finite minima.
    The weight-family argument of Lemma 16 then gives a nonempty special fibre of dimension $dim U$,
    whose ideal strictly contains the prime of $R'$, also of dimension $dim U$. This is impossible.
    Thus the flattened minimum ideal is exactly the desired prime.
  For completeness, the resulting real quotient filtration does define a valuation on the original ring.
    Its weight on a function is the maximum of the minimum weights of all polynomial representatives.
    Positivity of the finitely many generator weights makes the weights locally finite.
    If the minima of representatives could be arbitrarily high,
    every monomial in those representatives would have arbitrarily large ordinary total degree,
    putting the function in every maximal-ideal power, hence making it zero.
    The maximum is thus attained for every nonzero function. At an attained maximum,
    polynomial minima give the graded quotient by the minimum relation ideal:
    an improvement of a representative differs from it by a relation with that minimum.
    The quotient being a domain proves multiplicativity, and the triangle inequality is immediate.
    Extending by fractions yields $b_xi$. Its full graded field has transcendence degree $dim U$,
    so it is Abhyankar. Avoidance of rational ties identifies its value torus with the full joint torus.
    The homogeneous presentation preserves the old grading.
  To preserve any finite test list, choose its lex-adapted polynomial representatives and denominators and retain
    their leading comparisons. For uniform comparison on #emph[all] regular functions,
    take $xi$ smaller until every generator’s flattened weight lies between half and twice its first weight.
    A $b$-adapted representative gives $b_xi \( F \) gt.eq b \( F \) \/ 2$.
    Conversely, a $b_xi$-adapted representative gives $b \( F \) gt.eq b_xi \( F \) \/ 2$.
    This uses the attained maximum description separately for the two valuations,
    and so includes functions whose initially chosen representatives have cancellation.
  Finally choose first-stage probes as follows. Use rational torus variables and functions of the invariant field
    whose restricted $u$-initials form a full transcendence basis there.
    Gaussianity and Abhyankar equality show that these have full independent first and double initials:
    the second-stage torus initials adjoin independent variables to the full restricted initial field.
    The invariant probes are ratios of equal-first-weight homogeneous functions, so they lift to $k \( U \)$,
    as do the torus variables. Include these probes and the coefficient of $Omega_U$ in their logarithmic basis
    among the finite tests. Applying (5.1) first to $b$, then to $u$,
    and then to the flattening gives coefficient values $1$, $1$, and $1 + xi$, respectively.
    The same formula identifies the flattened leading form with the iterated leading form.
    This proves the last two assertions. ◻
]

=== 5.4 A cone proof of the comparison for Cartier-equation boundaries <a:comparison-cone-proof>

The preceding constructions give a second proof of Lemma 12 in the setting actually used later:
  $U$ has a canonical generator, and the klt boundary is a nonnegative rational combination of regular equations.
  This proof explains why tests with nonclosed centres on the stable cone cause no loss of uniformity.
  It uses the torus-field description above and the algebraic degeneration and canonical-form assertions of
  Lemmas 16 and 17.

Let $F$ be regular affine with $b \( F \) > 0$; local denominators that are units have value zero.
  Degenerate to the stable cone, retaining the initial equations of the boundary and of $F$.
  The grading $b$ is still minimizing with the same pair discrepancy, and the canonical form is the leading form.
  Normalize $A \( b \) = 1$. For an invariant prime-divisor valuation $E$ centred on the cone,
  not necessarily at the vertex, normalize $A \( E \) = 1$.
  On homogeneous elements use $w_s = b + s E$, and extend by the minimum rule.
  Gaussianity in rational torus variables shows this is a quasi-monomial valuation:
  its invariant-field restriction is multiplied by $s$, and its torus weights are translated by those of $b$.
  It is centred at the vertex since $w_s gt.eq b$ on the ring.
  The leading-form rule and the homogeneous boundary equations give $A \( w_s \) = 1 + s$.

Put $L_(*) = E \( macron(F) \) \/ b \( macron(F) \) > 0$ and $s = 1 \/ L_(*)$.
  For $k_m = floor.l m \/ \( 2 b \( macron(F) \) \) floor.r$, multiply the homogeneous pieces whose $b$-weights lie in

$ \[ thin 3 m \/ 4 - k_m b \( macron(F) \) \, med m - k_m b \( macron(F) \) thin \) $

by $macron(F)^(k_m)$. They inject into the $b$-jets of weight below $m$.
  Their $b$-weight is at least $3 m \/ 4$, and their added $s E$-weight is at least $s k_m E \( macron(F) \)$,
  so they vanish among the $w_s$-jets for large $m$. The lost dimension fraction tends to $c_p = 2^(- p) -
  4^(- p) > 0$. Therefore

$ "vol" \( w_s \) lt.eq \( 1 - c_p \) "vol" \( b \) \, wide 1 lt.eq \( 1 + 1 \/ L_(*) \)^p \( 1 - c_p \) $

by minimality. This bounds $L_(*)$ by a constant depending only on $p$.

Equivariant log resolution shows that invariant prime divisors suffice to test the homogeneous pair together with
  $macron(F)$. Undoing the normalizations, adding $a "Div" \( macron(F) \)$ preserves lc near the vertex whenever

$ a < frac(A \( b \), C_p b \( F \)) $

for a dimensional $C_p$, which may be enlarged from the first proof. For a strict inequality the cone pair is klt.
  Transfer this test through the weight family of Lemma 16.
  Its total space is normal with Cartier canonical divisor; the special fibre is reduced, normal and Cartier.
  All other boundaries are nonnegative rational Cartier-equation divisors without a vertical component.
  At codimension one of the special fibre the family is smooth,
  and the different is exactly their Cartier restriction. The ordinary inversion-of-adjunction theorem
  #cite(label("Kawakita")) Theorem on p. 1 applies with coefficient one on the special fibre.
  It makes the total pair lc near the vertex.

Away from parameter zero the family and pair are a product.
  The section of the original closed point, with all chosen affine generators zero, specializes to the vertex.
  Hence the original pair with $a "Div" \( F \)$ is lc near that point.
  Letting $a$ increase to the displayed bound gives (4.1). This argument uses stable degeneration only for the
  ordinary klt minimizer, and makes no finite-generation assertion about an arbitrary lc place.

== 6 A deepest weakly essential residual system <a:essential>

We return to the sequence of anticanonical cones $W = "Spec" cal(A)$ from Section 3,
  retaining its fixed integer $n > 1$, degree action $D$, canonical generator $Omega$, and vertex $o$.
  Constants called uniform in this section are independent of the member of that sequence.
  The small parameters realizing each exact minimum may depend on the individual member.

=== 6.1 Initial minimizing data <initial-minimizing-data>

Apply Proposition 13 on $W$ with constraint $I_n^(1 \/ n)$ and residual discrepancy $a = A_W$.
  Proposition 11 supplies a centred quasi-monomial lc place.
  Normalize the resulting $D$-invariant minimizer $tilde(v)$ by $A_W \( tilde(v) \) = 1$.
  In constructing its auxiliary klt pairs, take the general core equations in degree $n$;
  every such equation has value $n$ at $tilde(v)$. On both $tilde(v)$ and the lc place $u^0$ from (3.1),
  the auxiliary discrepancy is the parameter times bare discrepancy, up to their common scaling.
  Here rescale $u^0$ so that $A_W \( u^0 \) = 1$, which preserves (3.1).
  Applying (4.1) with minimizer $tilde(v)$ and test valuation $u^0$ therefore gives, uniformly on the ideal $frak(m)_z$,

#[#set math.equation(numbering: n => "(6.1)")
 $ tilde(v) \( frak(m)_z \) arrow.r oo . $ <eq:A7>]

Indeed $A_W \( u^0 \) = A_W \( tilde(v) \) = 1$ and $u^0 \( frak(m)_z \) arrow.r oo$ by (3.1).

Stable degeneration makes $R = "gr"_(tilde(v)) cal(A)$ finitely generated and normal.
  Removing its effective specialized boundary shows that $"Spec" R$ is klt.
  These homogeneous assertions, initially near the vertex, hold globally:
  the positive grading makes every orbit closure contain the vertex.
  Lemma 16 gives the canonical generator $Omega_(tilde(v))$.
  Let $T$ be the joint effective torus of the value grading and $D$, with character lattice $M_T$,
  and let $chi$ be the character of this form. Then

$ D \( chi \) = 1 = tilde(v) \( chi \) . $

Every specialized core equation has pure weight $n chi$: its two weights are degree $n$ and value $n$,
  and these determine the joint character. Write $I_R = \( R_(n chi) \)$.

The exact minimum fixes the normalized valuation and the chosen core through all sufficiently small rational
  parameters on this member. The induced auxiliary klt discrepancies, before their common canonical scaling,
  are the specialized core discrepancy plus the parameter times the bare discrepancy.
  Letting that parameter tend to zero shows that the specialized core boundary is lc.
  The order of $I_R$ is no larger than the averaged order of the core equations;
  hence $I_R^(1 \/ n)$ is lc as well. Moreover every quasi-monomial lc place $u$ of this system centred at the
  vertex satisfies

#[#set math.equation(numbering: n => "(6.2)")
 $ u \( f \) lt.eq C A_R \( u \) tilde(v) \( f \) wide \( 0 eq.not f in R \) \, $ <eq:A8>]

with uniform $C$. Apply (4.1) on the auxiliary klt stable cone.
  At $u$, the core equations have orders at least $u \( I_R \)$,
  so the auxiliary discrepancy is at most the parameter times $A_R \( u \)$.
  At the minimizing grading $tilde(v)$ it is exactly the parameter, by (5.1). The parameter cancels, giving the bound.

We may ensure that evaluation by $tilde(v)$ is injective on $M_T$.
  If necessary add a sufficiently small positive multiple $delta D$ and renormalize by $1 + delta$.
  On each original homogeneous degree this translates values by $delta$ times that degree;
  extend by the minimum rule. Generic $delta$ avoids ties of distinct joint weights and retains the same joint
  graded ring and Abhyankar equality. To check canonical normalization,
  choose homogeneous lifts of joint homogeneous independent initial probes.
  In their logarithmic basis the coefficient of $Omega$ has degree one and old value one, so its new value is $1 +
  delta$. Formula (5.1) gives both the stated normalization and the unchanged leading form.
  Homogeneous lifts exist by character splitting in the $D$-invariant filtrations, also for fractions.

The actual ideal $I_n$ still has normalized value $n$. All degrees on $cal(A)$ are nonnegative,
  and $frak(m)_z$ has degree zero. Taking $delta$ individually small,
  the bounds (6.1)–(6.2) persist with uniform factors. We henceforth use the adjusted notation.
  To compare torus ranks, we will retain actual valuations on $W$, together with

$ A_W \( tilde(v) \) = 1 \, quad tilde(v) \( I_n \) = n \, quad R = "gr"_(tilde(v)) cal(A) med
  upright("finitely generated and klt") \,\
T supset D med upright("the value torus") \, quad D \( chi \) = tilde(v) \( chi \) = 1 \, quad I_R^(1 \/ n) med
  upright("lc") \, $

and the uniform estimates (6.1)–(6.2).

Among all sequences of such data and their subsequences, choose one whose torus rank is constant and as large as
  possible. This is possible because $"rank" T lt.eq dim R = d + 1$.
  All future rank comparisons concern sequences retaining the uniform estimates, rather than isolated members.
  For each member choose $h in cal(A)_n$ general so that its divisor divided by $n$ is lc on $W$ and the
  corresponding divisor is lc on $X$, and its initial $macron(h)$ is general nonzero in $R_(n chi)$.
  Indeed this finite-dimensional weight space is exactly the leading space at the minimal value $n$ from degree
  $n$. Include lifts of its basis, together with system generators,
  in the finite-dimensional space used for the general choice.
  On $R$, the divisor $"Div" \( macron(h) \) \/ n$ is lc, and each of its discrepancy-zero primes is also an lc
  place of $I_R^(1 \/ n)$. On a resolution, the moving part has coefficient $1 \/ n < 1$,
  so its general smooth components introduce no additional discrepancy-zero primes. The fixed part is the ideal’s part.

=== 6.2 The projective torus quotient <a:quotient>

The character $chi$ lies in the interior of the rational polyhedral cone of occurring weights.
  Otherwise a nonzero rational dual cocharacter would be nonnegative on all occurring weights and nonpositive on
  $chi$. It defines a nontrivial centred valuation on $R$, whose bare discrepancy is its evaluation on $chi$,
  contradicting klt. Also $chi$ is primitive, since $D \( chi \) = 1$. Set

$ R_chi = xor.big_(m gt.eq 0) R_(m chi) \, wide S = "Proj" R_chi . $

This ray ring is a subtorus invariant ring, hence finitely generated and normal.
  Its field and the invariant field satisfy

$ k \( S \) = k \( R \)^T \, wide "Frac" R_chi = k \( S \) \( z^chi \) . $

Here and below $z^mu$ are multiplicative rational torus variables.
  We give the monoid detail that ensures these identities in all degrees.
  The finitely generated occurring monoid spans $M_T$ as a group.
  Its saturation in the weight cone is a finite module over it:
  subtract integer multiples of its generators until the remainder lies in a bounded set.
  For each of the finitely many module representatives, use the group-span property to write its difference as a
  difference of monoid elements. Adding a common monoid translate sends the entire saturation into the monoid.
  Since $chi$ is interior, for every fixed weight $mu$ the points $m chi -
  mu$ lie in that translated saturation for all sufficiently large $m$.
  Thus a homogeneous numerator and denominator of equal weight can be multiplied by a common occurring element to
  have ray degrees. Likewise ray elements occur in all sufficiently large integral degrees,
  so their degree group is $bb(Z) chi$. This proves the field identities.

Choose a rational volume form $omega_S$ so that

$ Omega_(tilde(v)) = z^chi omega_S and d log upright(bold(z)) \, $

where $d log upright(bold(z))$ is the wedge for a lattice basis of $M_T$.
  The quotient of the two sides is invariant, so it can be absorbed in $omega_S$.
  There is an ample rational $bb(Q)$-Cartier divisor $L$ on the normal projective variety $S$ for which

#[#set math.equation(numbering: n => "(6.3)")
 $ f z^(m chi) in R quad arrow.l.r.double quad "Div"_S f + m L gt.eq
   0 wide \( m gt.eq 0 \, med f in k \( S \)^(*) \) . $ <eq:A9>]

Take a sufficiently divisible Veronese of the ray ring and write its tautological polarization using the
  corresponding power of the rational section $z^chi$. The equivalence holds in sufficiently high divisible
  degrees by the Proj description. For any remaining degree, take a sufficiently divisible power:
  membership of that power implies membership of the element by normality of $R_chi$,
  and the divisor inequality is equivalent to that for its power.
  If $dim S = 0$, set $L = 0$; all subsequent prime tests on $S$ are then vacuous.

On $S$ define

$ f_h = macron(h) \/ z^(n chi) \, wide H = L + 1 / n "Div"_S f_h \, wide B = - K_S^(omega_S) - L . $

In particular $H gt.eq 0$ and $H tilde.op_(bb(Q)) L$.

#thm([Lemma 6.1.])[
  (Gauss lifts and the quotient boundary).  #emph[For every prime-divisor valuation $P$ over $S$,
    there is a rational Gaussian extension to $k \( R \)$, centred on $"Spec" R$,
    whose restriction is $P$ and whose value on $z^chi$ is $P \( L \)$. It is divisorial up to scaling.
    The pair $\( S \, B \)$ is klt log Fano, and $B$ is effective with coefficients in ${ 1 - 1 \/ j :
    j in bb(Z)_(> 0) }$.]
] <a:gauss-lifts>

#proof[
  Impose nonnegativity on finitely many eigenfunction generators of $R$.
    For an extension of $P$ these are linear inequalities in the rational torus-variable weights,
    with the one weight on $z^chi$ fixed to $P \( L \)$. The criterion for a solution is that every nonnegative
    combination eliminating the other weights has nonnegative right-hand side.
    By rational polyhedrality it suffices to test rational combinations.
    Clear denominators and multiply the corresponding eigenfunctions.
    Their total weight is a multiple of $chi$; it is a nonnegative multiple because the occurring cone is pointed.
    The required inequality is exactly (6.3) pulled back to $P$.
    The rational linear system therefore has a rational solution.
    Its Gaussian valuation has rational rank one and satisfies Abhyankar equality,
    so it is divisorial up to scaling. Formula (5.1) gives its discrepancy
  $ A_B \( P \) = a_(omega_S) \( P \) + P \( L \) > 0 \, $
  where positivity follows from klt of $R$. Thus $\( S \, B \)$ is sub-klt;
    we next verify effectivity and the coefficients.
  For a strict prime $P$ on $S$, first lift $P$ to a homogeneous prime divisor $P'$ of the affine ray cone.
    Use the punctured cone for a degree-one generated Veronese, and then the finite map from the full ray cone.
    The affine subtorus quotient $"Spec" R arrow.r "Spec" R_chi$ is surjective:
    projection to invariant summands splits the inclusion as an $R_chi$-module.
    Localize at the generic point of $P'$ and pull back its uniformizer.
    A height-one minimal prime of this nonzero parameter ideal gives a prime divisor $E$ on $"Spec"
    R$ dominating $P'$. Its contraction is the maximal ideal of that discrete valuation ring.
    A connected torus preserves each of these finitely many components, so $E$ is invariant.
    Its restriction is $j P$ for an integer $j > 0$, by Lemma 7.
  Choose a section in a sufficiently divisible degree whose corresponding section of $L$ is nonvanishing at the
    generic point of $P$. It has order zero at the ray-cone divisor and at its dominating lift,
    which gives $E \( z^chi \) = j P \( L \)$. As $E$ is a strict prime of the variety $"Spec"
    R$ with zero canonical divisor, $A_R \( E \) = 1$. The leading-form formula now yields
  $ 1 = j A_B \( P \) . $
  The coefficient of $B$ at $P$ is therefore $1 - 1 \/ j$, proving effectivity and the asserted standard
    coefficients. Together with all prime tests already proved, this makes $\( S \, B \)$ klt.
    Finally $- K_S - B = L$ is ample, so it is log Fano. ◻
]

Test the lc divisor $"Div" \( macron(h) \) \/ n$ on the Gauss lifts of Lemma 19. This gives, for every prime over $S$,

#[#set math.equation(numbering: n => "(6.4)")
 $ A^(+) \( P \) := A_B \( P \) - P \( H \) = a_(omega_S) \( P \) - 1 / n P \( f_h \) gt.eq 0 . $ <eq:A10>]

The positive values of $A^(+)$ on primes have gap $1 \/ n$: form orders and function orders are integers.
  These are also generalized Calabi–Yau data with effective boundary $B + H$, principal nef b-divisor $- 1 /
  n "Div" \( f_h \)$, and total adjoint divisor literally zero.
  The principal divisor here is taken on every model. It is rational Cartier and numerically trivial, so is b-nef.
  Indeed $K_S + B + H = 1 / n "Div"_S f_h$.

For an invariant prime divisor $E$ on $"Spec" R$, write $h_E = E \( macron(h) \) \/ n gt.eq 0$.
  When its restriction is nonzero, Lemma 7 writes it as $j P$, $j in bb(Z)_(> 0)$. Then

#[#set math.equation(numbering: n => "(6.5)")
 $ E \|_(k \( S \)) = j P eq.not 0 quad arrow.r.double quad 1 = j A^(+) \( P \) + h_E \, wide j P \( H \) lt.eq
   h_E . $ <eq:A11>]

For the equality, Gaussianity and (5.1) give

$ 1 = j a_(omega_S) \( P \) + E \( z^chi \) \, wide h_E = j / n P \( f_h \) + E \( z^chi \) . $

For the inequality, choose sufficiently divisible sections of $L$ avoiding the centre of $P$.
  Their nonnegative values under $E$, together with (6.3), give $E \( z^chi \) gt.eq j P \( L \)$.
  If the restriction is trivial, the valuation is a pure toric cocharacter and $h_E = E \( chi \) = A_R \( E \) = 1$.

=== 6.3 Weak essentiality by maximality of the torus rank <weak-essentiality-by-maximality-of-the-torus-rank>

#thm([Proposition 6.2.])[
  (Weak essentiality).  #emph[On the chosen maximal-rank sequence, there are numbers $eta arrow.r 0$ such that,
    for every prime divisor $P$ over $S$ with $A^(+) \( P \) = 0$,
#[#set math.equation(numbering: n => "(6.6)")
 $ sup_(H' gt.eq 0 \, med H' tilde.op_(bb(Q)) H) P \( H' \) lt.eq \( 1 + eta \) P \( H \) . $ <eq:A12>]

]
] <a:weak-essentiality>

#proof[
  Otherwise pass to a subsequence carrying lc primes $P$ and effective divisors $H' tilde.op_(bb(Q))
    H$ with $P \( H' \) > \( 1 + c_(*) \) P \( H \)$, for a fixed $c_(*) > 0$. Here $P \( H \) = A_B \( P \) > 0$.
    The lift from Lemma 19 has bare discrepancy $P \( H \)$ and discrepancy zero for $"Div" \( macron(h) \) \/ n$.
    Normalize it to bare discrepancy one. By our general choice of $h$, it is also an lc place of $I_R^(1 \/ n)$.
    Average this normalized lift and the grading valuation $tilde(v)$ on eigenfunctions,
    extending by the Gaussian minimum rule. The resulting valuation $u_(*)$ restricts to $P \/ \( 2 P \( H \) \)$
    on the invariant field. It is quasi-monomial, has bare discrepancy one by (5.1),
    and is an lc place of $I_R^(1 \/ n)$. For the last assertion, the core weight is pure:
    every core function has value at least $n$ at the lift and exactly $n$ at the grading,
    with equality for $macron(h)$. Also $u_(*) gt.eq tilde(v) \/ 2$ on regular functions,
    so it is centred at the vertex and
  $ "vol" \( u_(*) \) lt.eq 2^p "vol" \( tilde(v) \) . $
  Write $H' = L + 1 / m "Div"_S f'$ with $m > 0$ integral, clearing rational denominators.
    By (6.3), $g = f' z^(m chi) in R_(m chi)$. Its value divided by $m$ is $P \( H' \) \/ P \( H \) > 1 +
    c_(*)$ at the normalized lift, and one at the grading. Hence
  $ u_(*) \( g \) \/ m > 1 + c_(*) \/ 2 . $
  Choose rational $1 < c_0 < 1 + c_(*) \/ 2$ and a fixed rational $lambda > 0$ large enough that
  $ 1 + lambda \( c_0 - 1 \) > 2 C \, $
  where $C$ is the old uniform constant in (6.2). On $"Spec" R$, minimize subject to the same lc constraint,
    now with residual discrepancy
  $ a \( u \) = \( 1 + lambda c_0 \) A_R \( u \) - lambda min { u \( g \) \/ m \, c_0 u \( I_R \) \/ n } . $
  This has the ideal form of Proposition 13. Explicitly take an integer $q_0$ for which $q_0 \/ m$ and $q_0 c_0 \/
    n$ are integral and put $J = \( g^(q_0 \/ m) \) + I_R^(q_0 c_0 \/ n)$;
    the subtracted term is $\( lambda \/ q_0 \) u \( J \)$. Since the constraint ideal is lc,
    $u \( I_R \) \/ n lt.eq A_R \( u \)$, and consequently
  $ A_R \( u \) lt.eq a \( u \) lt.eq \( 1 + lambda c_0 \) A_R \( u \) . $
  The ideals are $T$-invariant, so the exact minimizing valuation is $T$-invariant. Normalize it by $A_R \( u \) = 1$.
  This $u$ cannot be a cocharacter valuation in $T$. For any centred cocharacter competitor with bare discrepancy
    one, pure weights give $u \( g \) = m$ and $u \( I_R \) = n$, hence $a = 1 + lambda \( c_0 - 1 \)$.
    Such competitors are lc places of the system; (6.2) gives their volume at least $C^(- p)
    "vol" \( tilde(v) \)$. Their objective thus strictly exceeds $2^p "vol" \( tilde(v) \)$,
    while $a \( u_(*) \) = 1$ and the displayed volume bound makes $u_(*)$’s objective at most that number.
    This contradicts minimality if $u$ were a cocharacter.
  We have obtained a minimizer that is not a cocharacter of the old torus.
    To contradict maximality, we must realize its joint graded ring on the original $W$ and preserve the system
    value $n$, concentration (6.1), and the uniform comparison (6.2).
  Let $R' = "gr"_u R$. Stable degeneration for each sufficiently small auxiliary klt parameter gives finite
    generation, normality and, after removing boundaries, klt of $R'$.
    Use the joint effective torus of $T$ and the new value torus.
    By Lemma 16, its canonical generator is $\( Omega_(tilde(v)) \)_u$; call its character $chi'$.
    It restricts to $chi$ on $T$, and $u \( chi' \) = 1$. Choose the old core equations in $R_(n chi)$ for the
    exact-minimum construction. Their next initials have old weight $n chi$ and $u$-value $n$,
    hence joint weight $n chi'$. The old and new weights determine characters of the joint torus,
    so this is an equality of characters, not only of their evaluations.
  Let $I_(R') = \( R'_(n chi') \)$. The core and normalized minimum remain fixed as the auxiliary parameter tends
    to zero. Boundary specialization and this pure weight therefore imply that $I_(R')^(1 \/ n)$ is lc,
    exactly as in the initial construction. The same auxiliary klt pairs give a new uniform version of (6.2),
    initially relative to grading $u$. Indeed at a centred lc place $q$ of the new system,
    the core term is at most zero; all perturbing boundary subtractions are nonnegative,
    so the auxiliary discrepancy before common scaling is at most
  $ t' \( 1 + lambda c_0 \) A_(R') \( q \) . $
  At the minimizing grading $u$ it equals $t' a \( u \)$, which is at least $t'$.
    Formula (4.1) cancels the parameter and yields a sequence-uniform comparison with $u$, since $lambda \, c_0 \,
    p$ are fixed.
  On the old ring, (6.2) applies to the normalized lc place $u$ and gives $u \( f \) lt.eq C tilde(v) \( f \)$.
    On each new joint piece this says that its new $u$-weight is at most $C$ times its old $tilde(v)$-weight:
    use a homogeneous lift of that piece to $R$. We now flatten the two successive valuations on the actual
    original $W$, by Lemma 18, and divide by $1 + xi$. This preserves $D$, the iterated canonical generator,
    and discrepancy one. The parameter $xi$ may be chosen individually for each member;
    all bounds below use fixed factors.
  Include a finite degree-$n$ generating list for the actual ideal $I_n$ in the preserved tests.
    If an old value is greater than $n$, its normalized flattened value is still greater for small enough $xi$.
    If the old value is $n$, its first initial lies in $R_(n chi)$, so the next value is at least $n$.
    Include also a degree-$n$ lift attaining equality for this system minimum;
    such a lift exists because $R_(n chi)$ is precisely that leading space.
    The normalized flattened valuation therefore still has $tilde(v)_(upright("new")) \( I_n \) = n$.
  The all-functions comparison in Lemma 18, with $0 < xi < 1$,
    bounds the new actual valuation below by $tilde(v) \/ 4$. Thus (6.1) persists.
    On each new joint weight, its normalized value is
  $ frac(upright("old weight") + xi thin upright("new ") u upright("-weight"), 1 + xi) gt.eq 1 /
    2 thin upright("old weight") gt.eq frac(1, 2 C) thin upright("new ") u upright("-weight") . $
  Both grading valuations use the minimum rule, so the same comparison holds on all elements of $R'$.
    The new comparison relative to $u$ therefore gives (6.2) relative to the normalized flattened grading,
    with a uniform enlarged constant. All required sequence properties survive.
  The joint torus has strictly larger rank. Every old occurring character still occurs after taking the invariant
    associated graded, so $T$ continues to act faithfully. If the $u$-grading belonged to this old torus,
    each nonzero element in an old weight space would have its $u$-value determined by that character and one
    fixed linear functional. Invariance and the minimum rule would then make $u$ itself a cocharacter valuation on
    $R$, which was excluded above. Thus the rank increases. Passing to a constant-rank subsequence gives an
    admissible sequence of larger rank, contrary to its maximal choice. This proves (6.6). ◻
]

Fix this sequence from now on. The dual section

$ Q_T = { rho in "Hom" \( M_T \, bb(R) \) : rho gt.eq 0 upright(" on occurring weights") \, med rho \( chi \) = 1 } $

is compact, because $chi$ is interior and the occurring cone is full-dimensional.
  It contains $D$, and its point $tilde(v)$ obeys

$ tilde(v) + c \( tilde(v) - Q_T \) subset.eq Q_T $

for a uniform $c > 0$. To see this, apply (6.2) first to interior cocharacters $rho$.
  They are centred at the vertex and are lc places of the pure system, of bare discrepancy one.
  Therefore $rho \( mu \) lt.eq C tilde(v) \( mu \)$ for every occurring character $mu$.
  Continuity extends this to all $Q_T$; take, for example, any $c > 0$ with $c \( C - 1 \) lt.eq 1$.

Use the integral splitting

$ M_T = bb(Z) chi xor M_0 \, wide M_0 = ker D . $

At each invariant prime divisor $E$ on $"Spec" R$, the values $E \( z^beta \)$ are integral linear functions of
  $beta in M_0$. These primes, with the data in (6.5), test regularity of eigenfunctions by normality:
  any pole divisor of an eigenfunction is invariant, and a normal affine ring is the intersection of its
  height-one valuation rings.

=== 6.4 Angular forms and section costs <a:angular>

Distinguish the quotient function $f_h$ on $S$ from the actual rational function

$ f_h^W = h \/ t^n in k \( X \) = k \( Z \) . $

Set

$ theta = frac(omega, \( f_h^W \)^(1 \/ n)) \, wide V_m =
  h^(- m \/ n) cal(A)_m subset k \( X \) quad \( m in n bb(Z)_(gt.eq 0) \) . $

The form is fractional, interpreted by its $n$-th tensor power.
  The section systems multiply and are nested, since multiplication by $h$ identifies $V_m subset.eq V_(m + n)$.
  For $v = tilde(v) \|_(k \( X \))$, the Gaussian cone formula gives $A_theta \( v \) = 0$.
  On $0 eq.not F in V_m$, write its cost as

$ b \( F \) = m + v \( F \) \, $

which is the value of its actual degree-$m$ section under $tilde(v)$.
  The label $m$ is retained when an element belongs to more than one system.

More generally, for a quasi-monomial valuation $w$ of $k \( X \)$, the Gauss extension assigning $h$ value $n B_(*)$ has

$ A_Omega = A_theta \( w \) + B_(*) \, wide upright("section value") = w \( F \) + m B_(*) quad \( F in V_m \) . $

Indeed its value on $t$ is $B_(*) - w \( f_h^W \) \/ n$; substitution in the cone formula gives the displayed
  identities.

The full initial field for $v$ is

$ k \( X \)_v = k \( R \)^D = k \( S \) \( z^beta : beta in M_0 \) . $

This follows from Gaussianity of $tilde(v)$ in $t$: its initial field is the full initial field downstairs with
  one independent initial variable of $D$-degree one. The leading $V_m$-spaces are the leading degree-$m$ pieces
  of $R$ divided by $macron(h)^(m \/ n)$. Apply (5.1) to the fractional identity

$ Omega \/ h^(1 \/ n) = theta and d log t . $

For a basis of $M_0$, the result is

$ theta_v = plus.minus frac(omega_S and d log upright(bold(z))_0, f_h^(1 \/ n)) . $

In fact $d log macron(t) = d log z^chi$ modulo differentials from $k \( R \)^D$,
  since both variables have $D$-degree one; wedging with the full downstairs form kills their difference.

Finally let $w$ be any quasi-monomial valuation centred on $X$, including one lying over $z$.
  The general divisor $1 / n \( "Div"_X f_h^W - n K_X \)$ is lc, so $A_theta \( w \) gt.eq 0$, and

#[#set math.equation(numbering: n => "(6.7)")
 $ A_X \( w \) & = A_theta \( w \) + 1 / n w \( "Div"_X f_h^W - n K_X \) \,\
1 / n w \( "Div"_X f_h^W - n K_X \) & = sup_(m in n bb(Z)_(> 0)\
0 eq.not F in V_m) frac(- w \( F \), m) . $ <eq:A13>]

Effectivity of every degree-$m$ section divisor gives the upper bound for the supremum.
  Conversely, sufficiently divisible multiples of $- K_X$ are relatively free.
  Over the affine base choose a section avoiding the centre of $w$;
  its effective section divisor has value zero there and attains the asserted value.
  This proves the equality and completes the angular data used below.

Equation (6.7) specifies the final task. A lower bound close to zero for all positive-degree ratios $w \( F \) \/
  m$, together with small $A_theta \( w \)$, gives small $A_X \( w \)$.
  To use $epsilon.alt$-log canonicity, we also need a uniformly bounded positive integer $e$ for which $e
  w$ is a positive integral multiple of a prime-divisor valuation.
  We will obtain this control from independent initial coordinates with integral values and the section counts.
  The tower and section estimates in the next four sections supply the information needed to construct such a
  valuation on the original field.

== 7 Valuative pushforward of discrepancy functions <b:discrepancy-push>

The residual system from Section 6 will be studied through successively smaller function fields.
  We need discrepancy data that pass through these contractions with an exact rule for pullbacks and with
  controlled denominators. The construction below uses the least normalized discrepancy among divisors lying over
  a given base divisor. We first prove attainment and compatibility, then construct its nef moduli presentation.

We continue over $bb(C)$, and retain the chosen rational volume forms.
  A prime divisor is identified with its normalized integral valuation.
  The coefficient of a rational b-divisor $upright(bold(D))$ at a valuation $P$ is denoted by
  $P \( upright(bold(D)) \)$. All b-divisors are evaluated on models on which the displayed Cartier data descend.

#prodef([Definition 7.1.])[
  A discrepancy presentation on a normal projective model $Y$ is
  $ a = a_(K \, Y) + upright(bold(M)) - overline(D) . $
  Here $a_(K \, Y)$ is the form discrepancy, $upright(bold(M))$ is b-nef and b-$bb(Q)$-Cartier,
    and $D$ is a rational Cartier divisor on $Y$. The boundary trace $B = sum_P \( 1 - a \( P \) \) P$,
    summed over strict primes on $Y$, satisfies
  $ K_Y + B + M_Y = D $
  as divisors. The presentation is #emph[Calabi–Yau] if $D = 0$.
    Sub-generalized lc and sub-generalized klt mean, respectively, $a \( P \) gt.eq
    0$ and $a \( P \) > 0$ for every relevant prime divisor on every higher model.
    Effectivity means effectivity of the boundary trace on the specified model, not on every higher model.
] <b:discrepancy-presentation>

The effective unscaled case is the generalized-pair framework of Birkar–Zhang #cite(label("BirkarZhang"))
  Definitions 1.4 and 4.1. Positive rational scalings are also allowed.
  For $mu a_K + upright(bold(M)) - overline(D)$, trace effectivity means that strict prime discrepancies are at
  most $mu$. Bars denote Cartier closure and may be suppressed when there is no ambiguity.

#prodef([Definition 7.2.])[
  For a projective contraction $pi : Y arrow.r V$, put
  #[#set math.equation(numbering: n => "(7.1)")
   $ \( pi_(\#) a \) \( P \) = min_(F \|_(bb(C) \( V \)) = m P\
m > 0) frac(a \( F \), m) . $ <eq:B1>]
  We use this operation for data sub-generalized lc over the generic point of $V$,
    with total divisor pulled back from $V$, and for positive scalings of such data.
    A prime valuation upstairs is #emph[horizontal] when its restriction to $bb(C) \( V \)$ is trivial.
] <b:valuative-push>

For an unscaled discrepancy presentation, $\( pi_(\#) a \) \( P \)$ is one minus the discriminant coefficient at
  $P$ in the canonical bundle formula #cite(label("FilipazziGeneralized")) Section 2.
  Keeping it as a function on all prime valuations makes composition and base pullbacks explicit.

#thm([Lemma 7.3.])[
  #emph[The minimum in (7.1) is finite and attained. Pullback terms from the base translate it exactly,
    and successive pushes compose.]
] <b:push-threshold>

#proof[
  Place $P$ on a smooth projective base model. Resolve the map upstairs, the boundary and nef data,
    and the pullback of $P$, so that the nef part descends and the relevant divisors have simple normal crossings.
    Over $eta_P$, the largest real number that can be subtracted times the pullback of $P$ while preserving sub-lc
    discrepancies is the least component-discrepancy-to-multiplicity ratio among components of positive
    multiplicity. This number may be negative. Horizontal sub-lc takes care of components of zero multiplicity.
    The snc discrepancy formula gives the same inequalities for every higher valuation, proving attainment and (7.1).
  A nontrivial restriction of a prime-divisor valuation to a subfunction field is a positive integral multiple of
    a prime-divisor valuation: the relative Abhyankar inequalities force equality for the restriction,
    and its nonzero value group is a subgroup of $bb(Z)$. Apply this to the intermediate fields and choose
    attained minimizing lifts successively to obtain composition.
    Finally $F \( pi^(*) D \) = m P \( D \)$, proving translation. ◻
]

=== 7.1 Preparatory birational operations <preparatory-birational-operations>

#thm([Lemma 7.4.])[
  #emph[Effective generalized klt data with big b-nef part admit an ordinary effective klt representative in the
    same rational adjoint class, whose discrepancies do not exceed the generalized ones.
    Generalized $delta$-lc data, $0 < delta lt.eq 1$, admit such a representative which is $delta \/ 2$-lc.
    A sufficiently small ample class on the low model may be reserved before taking the representative.
    In particular, effective relatively Calabi–Yau generalized klt data with big b-nef part make the underlying
    variety of Fano type over the base.]
] <b:ordinary-approximation>

#proof[
  On a projective descent write $M tilde.op_(bb(Q)) D_0 + E_0$, with $D_0$ ample and $E_0 gt.eq 0$.
    For small rational $s > 0$, use $s E_0$ as fixed part and the ample class $\( 1 - s \) M +
    s D_0$ as moving part. A still smaller pullback ample reserve can be subtracted from this moving part.
    Resolve fixed supports and take a sufficiently divisible general free representative of the moving part,
    divided by its multiplicity. Fixed coefficients change arbitrarily little and new coefficients are arbitrarily
    small. The snc discrepancy formula therefore retains klt, or $delta \/ 2$-lc, on every higher valuation.
    Subtracting the effective Cartier b-divisor representing the nef part only lowers the generalized
    discrepancies. For open bases use a projective compactification and common higher projective descents,
    testing these inequalities over the required open. The ample reserve proves the Fano-type assertion. ◻
]

On a $bb(Q)$-factorial model the negativity lemma #cite(label("FujinoFundamental")) Lemma 4.16 gives

$ overline(M_Y) - upright(bold(M)) gt.eq 0 . $

Removing effective boundary or forgetting b-nef data consequently does not decrease discrepancies.
  Adjoint MMPs preserve lower discrepancy bounds by pullback negativity on common resolutions.

We use the following established model results with their hypotheses.
  An effective klt rational pair with big boundary and pseudo-effective adjoint,
  projective over a quasi-projective base, has a log terminal model;
  the model is nonextracting and $bb(Q)$-factorial, and is good because the boundary is big #cite(label("BCHM"))
  Theorem 1.2 and Lemma 3.9.3. The nonextraction convention is explicit in #cite(label("BCHM")) Definition 3.6.6;
  all these locators refer to the same arXiv version. Relative bigness is tested on the generic fiber.
  A rational-function witness can be extended globally after adding a sufficiently vanishing effective Cartier
  divisor from the base to remove its finitely many residual vertical poles.

A projective $bb(Q)$-factorial variety of Fano type is a Mori dream space #cite(label("BCHM")) Corollary 1.3.1;
  in particular, its effective cone is rational polyhedral and closed,
  rational classes in it are rational-linearly effective, and their divisor MMPs end at nef semiample models
  #cite(label("HuKeel")) Definition 1.10 and Proposition 1.11.
  This is a statement for each individual variety, with no uniform chamber or generator assertion.
  Nonextracting $bb(Q)$-factorial outputs from a Fano-type model remain of Fano type:
  push an effective klt rationally trivial adjoint with big boundary.
  Rational triviality makes this crepant, and persistence of sections preserves bigness.
  Perturbing the big boundary gives a log Fano boundary again.

#thm([Lemma 7.5.])[
  #emph[Let $\( Y \, B \)$ be an effective klt log Fano pair.
    Any finite collection of exceptional prime divisors with discrepancies in $\( 0 \, 1 \]$ can be extracted on a
    projective $bb(Q)$-factorial birational model having no other exceptional prime divisors.
    This model is of Fano type. An empty collection gives a small $bb(Q)$-factorialization.]
] <b:controlled-extraction>

#proof[
  On a log resolution displaying the collection, retain their crepant coefficients, which lie in $\[ 0 \, 1 \)$.
    Raise every other exceptional coefficient to a strictly larger nonnegative rational number below one.
    The resulting effective pair is klt, its boundary is big over the birational base,
    and its adjoint is relatively the effective exceptional divisor $R$ supported exactly on the raised
    components. Normality gives $f_(*) cal(O) \( m R \) = cal(O)_Y$ for divisible $m$.
    The good log terminal model preserves these sections by negativity and makes the transform of $R$ relatively
    semiample. A free multiple has only the relative generator $1$, so its effective transform vanishes.
    The pullback difference is zero at every requested divisor;
    strict adjoint negativity for contracted divisors therefore prevents their contraction.
    The MMP extracts no divisor. The original pair’s crepant trace on this extraction is effective and has nef big
    anti-adjoint, so a small perturbation gives Fano type. ◻
]

=== 7.2 A uniform interval of primary minimization <a-uniform-interval-of-primary-minimization>

For a small perturbation of an lc discrepancy function, we need its computing divisors to continue computing the
  unperturbed function. The next lemma obtains one interval valid for every tested base prime from a bounded index
  and generalized threshold ACC. This is the uniformity that will later allow us to pass to a nef endpoint on a
  fixed model.

#thm([Lemma 7.6.])[
  #emph[Fix a positive integer $r_(upright("ind"))$. Let $A \, C$ have Calabi–Yau presentations on $Y$,
    effective in horizontal trace over $V$. Assume that $A$ is sub-generalized lc over the generic point,
    that $C$ is generalized klt there with big b-nef part, and that $r_(upright("ind"))
    upright(bold(M))_A$ is integral b-Cartier. There is $t_0 > 0$,
    depending only on the dimension and $r_(upright("ind"))$, such that for every rational $0 < t < t_0$,
    every prime $T$ computing $pi_(\#) \( \( 1 - t \) A + t C \) \( P \)$ also computes $pi_(\#) A \( P \)$.]
] <b:primary-minimization>

#proof[
  Fix a prime $P$ and a lift $T$ computing the mixture. We will construct a model on which $T$ is the only strict
    prime above $eta_P$, and on which both individually shifted boundaries are effective.
    On that model, generalized threshold ACC will force the shifted $A$-datum to be lc.
  #emph[Shifting the two data at the computing prime.] Work over an open neighborhood $U$ of $eta_P$ on a smooth
    base model and put
  $ T \|_(bb(C) \( V \)) = m_T P \, wide alpha_A = A \( T \) \/ m_T \, wide alpha_C = C \( T \) \/ m_T . $
  Subtract $alpha_A pi^(*) P \, alpha_C pi^(*) P$ from the respective discrepancy functions.
    Their mixture is sub-generalized lc over $U$ after shrinking:
    its threshold at $P$ is zero, and horizontal sub-lc is already known. Both shifted totals are pulled back from $U$.
  Add $kappa pi^(*) P$ to the shifted mixture discrepancy for a small positive rational $kappa$.
    It becomes sub-generalized klt there, with coefficient $1 - kappa m_T gt.eq 0$ at $T$.
    On a high smooth model displaying $T$, resolve the boundary, exceptional, fiber and nef data.
    Raise the coefficients of every other component over $eta_P$,
    and every horizontally exceptional divisor over the original generic fiber,
    to strictly larger nonnegative rationals below one. Remove unwanted vertical supports away from $eta_P$ by
    shrinking. Horizontal strict primes over the original generic fiber already have effective trace.
    Thus we obtain effective generalized klt data whose adjoint is relatively an effective divisor
    $R_(upright("ex"))$, supported exactly on these raises and omitting $T$.
  #emph[A model whose only strict prime above $eta_P$ is $T$.] By Lemma 24,
    replace the big nef part by ordinary effective data while keeping klt and big boundary.
    Take its good $bb(Q)$-factorial log terminal model over $U$.
    The reason every raised divisor disappears is that $R_(upright("ex"))$ has no relative sections except those
    from $cal(O)_U$. We verify this before using semiampleness on the good model.
  For every divisible $m$, a relative section of $cal(O) \( m R_(upright("ex")) \)$ has no nonexceptional
    horizontal poles on the original normal proper generic fiber.
    It is therefore a constant on that fiber, hence an element of $bb(C) \( V \)$.
    A base pole at $P$ is impossible because its pullback has a pole along $T$, absent from $R_(upright("ex"))$.
    At every other retained base prime, a component missing from $R_(upright("ex"))$ likewise prevents a pole.
    Such a component exists above each strict prime of a normal contraction base,
    by pulling back a local equation near its generic point; other vertical supports were removed by the shrink.
    Consequently these relative section sheaves are precisely $cal(O)_U$.
  The ordinary approximation may change the adjoint by a rational principal term and a base pullback.
    Clear denominators and identify the corresponding section spaces by multiplication by that principal function
    and local trivialization of the base term. Under this identification the algebra just computed is unchanged.
    Negativity preserves it on the good model. The effective transform of $R_(upright("ex"))$ is relatively
    semiample; a divisible free multiple is generated by the section $1$,
    whose zero divisor is that multiple of $R_(upright("ex"))$. Hence its support is empty.
    The output must still have a divisor over $eta_P$, and the MMP extracts none.
    Thus $T$ survives and is the unique such divisor.
  The pre-raise, $kappa$-adjusted mixture is crepant on this output, since its adjoint is pulled back from $U$,
    and has effective trace. Its big b-nef part gives relative Fano type by Lemma 24.
    In particular the bare output is klt. The surviving horizontal primes come from the original generic fiber;
    both individual shifted boundaries are therefore effective after shrinking. Their coefficient at $T$ is one.
  #emph[The bounded-coefficient threshold test.] We now return to the shifted mixture before the
    $kappa$-adjustment; it is lc on this same model. Remove $t$ times the shifted $C$-boundary and its
    corresponding nef datum. Effectivity and negativity show that discrepancies only increase.
    Thus the generalized threshold on the bare variety of the shifted $A$-boundary $B'_A$ together with
    $upright(bold(M))_A$ lies in $\[ 1 - t \, 1 \]$; the upper bound comes from $T$.
    The horizontal coefficients of $B'_A$ lie in the finite $1 \/ r_(upright("ind"))$-grid in $\[ 0 \, 1 \]$,
    because $r_(upright("ind")) A \( F \)$ is integral for Calabi–Yau data with $r_(upright("ind"))
    upright(bold(M))_A$ Cartier. The only remaining nonzero vertical coefficient is one.
    Use $\( 1 \/ r_(upright("ind")) \) \( r_(upright("ind")) upright(bold(M))_A \)$ as a single nef Cartier
    summand. These are exactly the effective test and nef Cartier coefficient hypotheses of generalized threshold
    ACC #cite(label("BirkarZhang")) Theorem 1.5. The test scales the boundary and the nef datum together;
    at parameter one it is precisely the shifted $A$-presentation.
    More explicitly, the initial boundary and nef datum in the threshold theorem are both zero;
    the effective test boundary is $B'_A$, and the nef test datum is
    $\( 1 \/ r_(upright("ind")) \) \( r_(upright("ind")) upright(bold(M))_A \)$.
    The latter is required to be nef, with the stated Cartier coefficient; its trace need not be effective.
    A Cartier divisor descending on the low model does not affect the nef-data discrepancy $upright(bold(M))_A -
    overline(M_(A \, Y))$, so any auxiliary effective representative obtained by twisting on the affine base does
    not alter the test.
  If thresholds below one occurred for arbitrarily small $t$, a subsequence would increase strictly to one,
    contradicting ACC. Thus the threshold is one for all sufficiently small $t$,
    with a bound depending only on dimension and $r_(upright("ind"))$.
    Closedness supplies the inequalities at the endpoint. The shifted $A$-data are therefore lc over $eta_P$,
    proving that $T$ computes $pi_(\#) A \( P \)$. ◻
]

#thm([Corollary 7.7.])[
  #emph[In Lemma 26, with the fixed positive integer $r_(upright("ind"))$ as there,
    assume in addition that $r_(upright("ind")) upright(bold(M))_A$ is principal.
    Then every value $\( pi_(\#) A \) \( P \)$ has bounded denominator,
    in terms only of the dimension and $r_(upright("ind"))$.]
] <b:principal-denominators>

#proof[
  Use the model constructed in the proof of Lemma 26: its unique strict prime above $eta_P$ is $T$,
    and the shifted $A$-boundary is effective and lc. The shifted $A$-data now have ordinary discrepancies, and
  $ K + B'_A = alpha_A pi^(*) P - M_(A \, Y) . $
  The pair is lc, its anti-adjoint is nef over $U$, its coefficient set is finite rational (hence contained in a
    fixed hyperstandard set), and its underlying variety is of Fano type over $U$.
    Apply the bounded relative monotone lc complement theorem near a closed point of $P ∩
    U$ #cite(label("BirkarComplements")) Theorem 1.8. The effective complement addition restricts to a rationally
    trivial effective divisor on the proper generic fiber, so has no horizontal component.
    It cannot add to $T$, whose coefficient is already one. Thus the boundary is unchanged near $eta_P$.
    Higher crepant traces are determined by the same adjoint and introduce no new independent addition.
  For clarity, if the local complement identity is $n' \( K + B'_A \) =
    "Div" \( h \)$ and $r_(upright("ind")) M_(A \, Y) = "Div" \( g \)$, take $N =
    n' r_(upright("ind"))$ and $phi.alt = h^(r_(upright("ind"))) g^(n')$. Thus a bounded integer $N$ gives
  $ N alpha_A pi^(*) P = "Div" \( phi.alt \) $
  over a neighborhood still containing $eta_P$. The principal adjustment from $M_A$ is absorbed in $phi.alt$.
    This function has no horizontal poles. Generic-fiber properness and the contraction property imply $phi.alt in
    bb(C) \( V \)$, even though its initial expression was obtained on an open neighborhood. Evaluating at $T$ gives
  $ N alpha_A m_T = m_T "ord"_P \( phi.alt \) \, wide N alpha_A = "ord"_P \( phi.alt \) in bb(Z) . $
  The fiber multiplicity cancels; neither a norm nor an extension-degree factor is introduced. ◻
]

=== 7.3 Nef push presentations <nef-push-presentations>

The preceding denominator argument applies to principal moduli data.
  We now construct the moduli b-divisor for a general semiample or nef and big presentation.
  The proof treats descent from generic coefficients, tests on newly appearing primes, and nefness separately,
  before taking the endpoint of a small perturbation. For the unscaled presentation,
  the moduli conclusion is a case of the generalized canonical bundle formula of Filipazzi
  #cite(label("FilipazziGeneralized")) Theorem 1.4. We retain an explicit proof in the chosen volume-form
  conventions, together with the perturbation argument used here.

#thm([Proposition 7.8.])[
  #emph[Let $a = a_(K \, Y) + upright(bold(M))$ be a Calabi–Yau presentation,
    sub-generalized klt over the generic point of $V$ and effective in horizontal trace.
    If $upright(bold(M))$ is b-semiample or b-nef and big, then
$ pi_(\#) a = a_(K \, V) + upright(bold(N)) $

 for a b-nef b-$bb(Q)$-Cartier divisor $upright(bold(N))$.
   Positive rational scaling and translation by base Cartier pullbacks give the corresponding presentations with
   their scaled canonical coefficient and prescribed total divisor.]
] <b:push-presentation>

#proof[
  We first assume b-semiampleness. Let $k = bb(C)$, and enlarge constants to the algebraic closure $k'$ of a
    purely transcendental extension of finite transcendence degree.
    Use enough independent coefficients to choose a member of a free Cartier system $\| m upright(bold(M)) \|$,
    $m > 1$, generic over $k$, on a high descent. Divide it by $m$ and denote its Cartier closure by $Delta$. The data
  $ a^(k') - Delta = a_(K \, Y)^(k') + upright(bold(M))^(k') - Delta $
  are ordinary pair discrepancies, because the remaining moduli term is rationally principal.
    Their ordinary boundary adds the trace of $Delta$ to the generalized boundary.
    Bertini on a log resolution, with moving coefficient $1 \/ m < 1$, makes them sub-klt generically.
    Their horizontal trace on the original low model remains effective.
  The rank-one condition in the ordinary canonical bundle formula holds as follows.
    On a resolution over the generic point, the rounded discrepancy sheaf contains constants by sub-klt
    singularities. Any additional poles allowed by it are exceptional over the original normal generic fiber,
    because the low horizontal boundary is effective. Such functions are regular on that proper low fiber and
    therefore constant. The contraction condition gives rank one.
    The rational principal adjustment makes the total adjoint pulled back from zero.
    Ambro’s ordinary klt-trivial-fibration theorem therefore gives a b-nef b-$bb(Q)$-Cartier divisor
  $ upright(bold(N))^Delta = \( pi^(k') \)_(\#) \( a^(k') - Delta \) - a_(K \, V)^(k') . $
  Here we use #cite(label("AmbroBoundary")) Theorem 0.2; see also #cite(label("AmbroModuli")).
    Vertical negative boundary components are allowed in this theorem.
    Alternatively, compensate them with a pulled-back base divisor,
    which translates thresholds and total divisor compatibly.
  For each prime $P$ over $k$, a resolution computing its threshold is defined over $k$.
    Extension does not change its finite snc calculation, and the generic free divisor meets that calculation
    transversely, without changing the threshold. Thus, writing $upright(bold(N)) = pi_(\#) a -
    a_(K \, V)$ initially as a coefficient function,
  #[#set math.equation(numbering: n => "(7.2)")
   $ upright(bold(N))^Delta \( P_(k') \) = upright(bold(N)) \( P \) . $ <b:old-prime-equality>]
  This holds for every old prime simultaneously in the requisite sense:
    each transversality condition is a nonempty open condition defined over $k$,
    and the chosen coefficient tuple lies over the generic point of its parameter space.
    No countable intersection of open subsets of $k$-points is being asserted.
  #emph[Descent of the Cartier presentation.] The restriction to old prime extensions of any rational b-Cartier
    divisor over $k'$ is rational b-Cartier over $k$. On a projective descent,
    taking differences and multiples reduces this to a globally generated Cartier divisor $J$.
    For finitely many rational sections $f_j$,
  $ Q \( J \) = - min_j Q \( f_j \) . $
  Put these sections over a common denominator in $k \( V \) ⊗_k k'$,
    and express every numerator and the denominator as a finite sum of coefficients in $k \( V \)$ times constants
    linearly independent over $k$. At $P_(k')$, the value of such a sum is exactly the least coefficient value.
    Indeed those constants remain independent over $k \( P \)$ in $"Frac" \( k \( P \) ⊗_k k' \)$;
    geometric integrality over algebraically closed $k$ makes this tensor product a domain.
    Hence the restricted function is a difference of minima over finite lists in $k \( V \)$.
    Resolving the corresponding fractional ideals makes it Cartier.
    Apply this to $upright(bold(N))^Delta$ and (7.2) to obtain a b-$bb(Q)$-Cartier presentation of
    $upright(bold(N))$ over $k$.
  #emph[Testing new primes and nefness.] The identity $pi_(\#) a = a_(K \, V) +
    upright(bold(N))$ remains valid after extension at every prime over $k'$.
    To prove this, fix one such prime on a smooth model dominating a descent of $upright(bold(N))$.
    Choose a smooth model upstairs, with descended $upright(bold(M))$,
    on which its threshold is computed by snc data including the pullback of that prime.
    All models, morphisms, prime components, rational forms and Cartier data in this single test are defined over
    a finitely generated extension of $k$. Spread them over an integral parameter variety over $k$.
    After shrinking, the models remain projective birational resolutions fiberwise;
    the required components remain geometrically integral; smoothness and relative snc hold;
    and the same components dominate the tested prime. Properness and constructibility permit these requirements.
    The finitely many divisor identities for forms, functions and pullbacks also persist with unchanged
    multiplicities: keep their supports on the smooth models and remove the parameter locus where a stated divisor
    identity or dominance fails.
  Specialize to a sufficiently general closed $k$-point. Both the proposed b-Cartier coefficient and the threshold
    are computed by the same respective finite numerical lists as before specialization.
    They agree there by the already proved identity over $k$. They therefore agree for the chosen prime over $k'$.
    This argument uses one finite spread per test prime, not a common resolution of all primes.
  Since $Delta gt.eq 0$, threshold monotonicity gives the b-effective difference
  $ upright(bold(N))^(k') - upright(bold(N))^Delta gt.eq 0 . $
  Its value at every $P_(k')$ is zero by (7.2). Let $C$ be a curve on a smooth projective descent of
    $upright(bold(N))$ over $k$, and take a common higher descent over $k'$ where $upright(bold(N))^Delta$ is nef.
    Choose an old prime valuation centered at the generic point of $C$.
    Its extended center $Z$ on the common model dominates $C_(k')$.
    After clearing denominators, if $Z$ lay in the effective Cartier difference,
    a local equation would have strictly positive valuation, contrary to its zero value.
    Thus $Z$ is not contained in that support. General complete intersections in $Z$ have a component dominating
    $C_(k')$ and not contained in the support: their restriction to the generic fiber of $Z arrow.r
    C_(k')$ has positive top ample intersection, and a general choice avoids containment in a fixed proper closed
    subset. On this curve the effective difference has nonnegative degree.
    The nef term and projection formula show $upright(bold(N)) dot.op C gt.eq 0$.
    If the base itself is a curve, use the whole curve on its common smooth model;
    the avoidance issue is automatic. A zero-dimensional base is immediate. This proves b-nefness in the semiample case.
  #emph[The nef and big endpoint.] On a projective descent write $M tilde.op_(bb(Q)) D_0 + E_0$,
    with $D_0$ ample and $E_0 gt.eq 0$. For sufficiently small rational $s > 0$,
  $ a_s = a - s overline(E)_0 $
  retains horizontal klt and effectivity, and its moduli class $M - s E_0 tilde.op_(bb(Q)) \( 1 - s \) M +
    s D_0$ is ample, hence semiample. Fix one such $s_0 > 0$.
    Apply Lemma 26 to $a \, a_(s_0)$, choosing a positive integer $r_(upright("ind"))$ for which
    $r_(upright("ind")) upright(bold(M))$ is integral b-Cartier.
    This index may depend on the individual presentation; the interval below is uniform over its test primes. Since
  $ a_s = \( 1 - s \/ s_0 \) a + \( s \/ s_0 \) a_(s_0) \, $
  the lemma gives one interval $0 < s < s_1$, independent of the prime $P$,
    on which every computing lift for $pi_(\#) a_s \( P \)$ also computes $pi_(\#) a \( P \)$.
  For a fixed $P$, a computing lift at any one positive parameter exists by Lemma 23.
    Comparing it with every other primary minimizer shows that it maximizes $E_0 \( F \) \/ m$ among them.
    This maximum is attained and is independent of $s$. Thus the threshold is exactly
  $ \( pi_(\#) a_s \) \( P \) = \( pi_(\#) a \) \( P \) - s e_P $
  on this interval, including its stated value at $s = 0$. The identity holds for every prime.
    If $0 < s' < s'' < s_1$ are rational, the endpoint moduli function is therefore
  $ upright(bold(N))_0 = frac(s'' upright(bold(N))_(s') - s' upright(bold(N))_(s''), s'' - s') . $
  The two terms on the right descend on a common model; hence so does $upright(bold(N))_0$.
    All other small positive-parameter terms descend there by the same affine formula and are nef there,
    since nefness on a higher descent descends by lifting curves and projection formula.
    Taking the limit on this fixed model proves that $upright(bold(N))_0$ is nef.
    This proves the endpoint assertion. Scaling and translation now follow from Lemma 23. ◻
]

== 8 A tower on the residual field <b:scale-tower>

We apply the discrepancy calculus to the residual data $S \, H \, A^(+)$ of (6.3)–(6.6).
  All varieties in this section are over $bb(C)$. The construction is performed along the sequence fixed there.
  The symbols $lt.tilde$ and $asymp$ mean inequalities with constants independent of its member.
  Constants may depend on the original bounded dimension and index data and on constants already fixed at an
  earlier level. There will be at most $dim S + 1$ levels; passing to subsequences or discarding finitely many
  members at each level is therefore harmless. A positive rational described as fixed is independent of the
  member, whereas extraction models and sufficiently small perturbations used only to construct them may depend on
  that member.

At a collapsing level, we isolate an lc divisor carrying the smallest scale and construct a contraction for which
  it is the only horizontal component of the positive support of $H$.
  Weak essentiality bounds the contraction threshold from below;
  bounded fibre degrees and a birational section system bound it from above.
  The same degree comparison then excludes every other positive horizontal component.

=== 8.1 The data carried by one level <the-data-carried-by-one-level>

The discrepancy functions and the divisor $H$ define the contraction step.
  The invariant-prime inequalities retain the regularity tests for sections.
  We also keep a model of the initial residual field: its principal moduli will bound the index after pushing to
  each successive base, without accumulating fibre multiplicities.
  We maintain the following data on a projective normal variety $S$, whose function field is denoted by $K$.

+ #emph[The lc presentation.] $H$ is an effective ample rational Cartier divisor.
  The discrepancy function $A^(+)$ has an effective generalized lc CY presentation $a_K + upright(bold(M))_0$,
  with boundary $B_0 gt.eq H$ and a bounded b-Cartier multiple of $upright(bold(M))_0$.
+ #emph[The positive discrepancy inherited from the preceding level.] Except at the first level,
  there is an effective generalized $delta$-lc presentation $Q$, for a fixed $delta > 0$,
  with rational b-Cartier b-nef part $upright(bold(M))_Q$, boundary $B_Q$, and total adjoint $H \/ lambda$,
  where $lambda > 0$ is rational and tends to zero. Initially $Q$ is absent and $lambda = 0$.
+ #emph[The scale.] Write
  $ Lambda = H + lambda Q \, wide s = min #scale(x: 120%, y: 120%)[\(] { 1 } union { Lambda \( P \) :
    A^(+) \( P \) = 0 } #scale(x: 120%, y: 120%)[\)] . $
  The primes in this definition are divisorial valuations anywhere over $S$;
    the minimum is $1$ when there are none. It exists and is positive:
    for each member the rational presentations give a discrete group of values;
    away from the first level $Lambda gt.eq delta lambda$ on these primes, while initially $A^(+) + H = A_B > 0$.
    In particular $s gt.tilde lambda$.
+ #emph[The section tests.] For every invariant prime $E$ of $"Spec" R$ whose nontrivial restriction to $K$ is $j
  P$, we have
  #[#set math.equation(numbering: n => "(8.1)")
   $ j A^(+) \( P \) lt.eq 1 - h_E \, wide j H \( P \) lt.eq h_E \, wide j Lambda \( P \) lt.eq lambda +
     C_0 h_E . $ <eq:B2>]
  Every strict prime $P$ of $S$ with $H \( P \) = 0$ has such a witness $E$ with $h_E = 0$ and bounded $j$.
    A positive strict coefficient $H \( P \)$ is at least a fixed $c_0 > 0$ if $A^(+) \( P \) > 0$,
    and at least $c_0 s$ if $A^(+) \( P \) = 0$.
+ #emph[Essentiality and the initial field.] Weak essentiality holds in the form
  #[#set math.equation(numbering: n => "(8.2)")
   $ P \( H' \) lt.eq P \( H \) + eta Lambda \( P \) quad upright("if ") H' gt.eq 0 \, med
     H' tilde.op_(bb(Q)) H \, med A^(+) \( P \) = 0 \, wide eta arrow.r 0 . $ <b:scale-essentiality>]
  There is also a projective $bb(Q)$-factorial Fano type model $cal(Y)$ of the initial field $K_1$,
    with a contraction to $S$, such that $A^(+)$ is the valuative push of $A_1^(+)$ and $A_1^(+)$ has effective
    trace on $cal(Y)$.

Here $A_1^(+)$ is the ordinary lc discrepancy with $K_(S_1) + B_(0 \, 1) = 1 / n "Div" \( f_h \)$,
  equivalently with principal CY moduli of denominator dividing $n$.
  Initially the asserted conditions follow from (6.3)–(6.6).
  For the strict coefficient bounds, the witnesses there satisfy $j H \( P \) = h_E in 1 / n bb(Z)$;
  $j$ is bounded when $A^(+) \( P \) > 0$ by the discrepancy index gap.
  For a strict lc prime, $H \( P \) gt.eq s$. Use a small $bb(Q)$-factorialization for $cal(Y)$;
  the initial variety is of Fano type.

Pass to a subsequence on which either $s arrow.r 0$, called a collapsing level, or $s$ stays bounded below.
  In the latter case this is the last level and we replace $s$ by $1$ in subsequent formulas,
  retaining the actual positive lower bound when choosing constants and decreasing the strict coefficient-gap
  constants accordingly.

=== 8.2 A positive perturbation and a birational system <a-positive-perturbation-and-a-birational-system>

Choose fixed small positive rationals $a \, b$, with $b$ sufficiently small relative to the preceding constants, and put

#[#set math.equation(numbering: n => "(8.3)")
 $ gamma = frac(b lambda, s) \, wide A' = \( 1 - gamma \) A^(+) + gamma Q + a H \, wide d' = b / s -
   a . $ <b:scale-perturbation>]

At the first level the convention is $gamma Q = 0$ and $d' = - a$.
  The total adjoint of $A'$ is $d' H$, and its b-nef part is $upright(bold(M))' = \( 1 - gamma \)
  upright(bold(M))_0 + gamma upright(bold(M))_Q$. Since $lambda \/ s$ is bounded, $gamma$ is uniformly small.
  The trace is effective because $B_0 gt.eq H$ and both original boundaries are effective.
  The datum is generalized klt: at later levels use $gamma Q > 0$, and at the first use $A' = \( 1 - a \) A^(+) +
  a A_B > 0$.

#thm([Lemma 8.1.])[
  #emph[For a sufficiently small fixed $e > 0$, every prime with $A' \( P \) < e$ is lc for $A^(+)$.
    There are finitely many such primes for each member. At a collapsing level they satisfy
$ s / 2 lt.eq H \( P \) lt.eq e / a . $

 At the last level the constants may be chosen so there are none.
   One can extract exactly their exceptional members on a projective $bb(Q)$-factorial Fano type model $S' arrow.r
   S$. At a collapsing level one may additionally extract a prime $G_(*)$ with $A^(+) \( G_(*) \) =
   0$ and $Lambda \( G_(*) \) = s$. On this model the trace of $A'$ is effective and $B_0 gt.eq H$ still holds,
   where $H$ now denotes its pullback.]
] <b:scale-bad-primes>

#proof[
  The bounded b-index of $upright(bold(M))_0$ gives a uniform positive gap for nonzero values of $A^(+)$.
    Choose $e$ below this gap multiplied by $1 - gamma$. For a bad prime we therefore have $A^(+) \( P \) = 0$, and
  $ a H \( P \) < e \, wide lambda Q \( P \) < frac(e s, b) $
  when $Q$ is present. Since $H \( P \) + lambda Q \( P \) gt.eq s$,
    choosing $e < b \/ 2$ gives the asserted lower bound; initially it follows directly from $H \( P \) gt.eq s$.
    At the last level, if the unmodified scale is at least $s_0 > 0$,
    these same formulas give a uniform positive lower bound for $A'$ on lc primes, in terms of $a \, b \, s_0$.
    Decrease $e$ further.
  For completeness, the finiteness assertion uses more than the finiteness of components on one resolution.
    On a smooth b-Cartier descent of any generalized klt datum,
    let $Sigma$ be the reduced snc support of its boundary. Its discrepancy at $P$ is
  $ A_(\( W \, Sigma \)) \( P \) + sum_D a_D "ord"_P \( D \) \, wide a_D > 0 . $
  The first term is a nonnegative integer. If the total is less than $e < 1$, this term is zero.
    We recall why this forces $P$ to be monomial at a stratum of $Sigma$.
    At the generic point of its centre choose regular parameters $x_1 \, dots.h \, x_ell$,
    including the boundary normals, and units $y_j$ lifting a separating transcendence basis of the centre.
    The reduced-pair discrepancy is the discrepancy of
  $ d log x_1 and dots.h.c and d log x_ell and and.big_j d y_j $
  plus the orders of those $x_i$ which are not boundary normals.
    On a smooth model carrying $P$, write $x_i = t^(w_i) u_i$, with $t$ a uniformizer and $u_i$ units.
    The displayed form has at most a simple pole. Equality zero thus forces every $x_i$ to be a boundary normal
    and the logarithmic wedge to have nonzero residue. The centre is a stratum,
    and the wedge of the initials $overline(u)_i overline(t)^(w_i)$ and $overline(y)_j$ is nonzero.
    In characteristic zero these initials are algebraically independent in the required normal directions,
    also over the centre’s function field, which is algebraic over $bb(C) \( overline(y)_j \)$.
    Expand an element of the local ring to arbitrarily high finite order in the $x_i$,
    with coefficients lifted from its residue field. Independence prevents cancellation in its leading polynomial,
    while the remainder has arbitrarily large value. Its value is therefore the minimum of its monomial values.
    The stratum and the positive integral weights $w_i$ determine $P$.
    There are finitely many strata, and $sum a_D w_D < 1$ bounds all these weights. This proves finiteness.
  In the collapsing case choose $G_(*)$ attaining the scale, and write $H_(*) = H \( G_(*) \)$. Then
  $ H_(*) lt.eq s \, wide A' \( G_(*) \) lt.eq b + a s . $
  To extract the indicated finite set, replace $gamma$ temporarily by a much smaller positive rational
    $tilde(gamma) < a lambda$, leaving it zero at the first level.
    The resulting effective generalized klt datum has ample anti-adjoint.
    Its discrepancy at every requested prime is less than $1$:
    these primes are lc for $A^(+)$, their $H$-values have the bounds just proved,
    and $tilde(gamma)$ can be chosen for this finite set in the given member.
    Add a sufficiently small positive multiple of $H$ to both moduli and total adjoint.
    This leaves discrepancies unchanged, makes the moduli big, and preserves ample anti-adjoint.
    By Lemma 24, replace the moduli by ordinary effective klt data with no larger discrepancies.
    The resulting ordinary pair is log Fano. Lemma 25 extracts precisely the requested exceptional primes on a
    $bb(Q)$-factorial Fano type model. For the original $A'$,
    their discrepancies are either less than $e$ or at most $b + a s < 1$, so its trace remains effective.
    At these primes $B_0 \( P \) = 1$ and $H \( P \) lt.eq max \( e \/ a \, s \) lt.eq
    1$ after the indicated choices. Consequently $B_0 gt.eq H$ also survives the extraction. ◻
]

#thm([Lemma 8.2.])[
  #emph[At every level there is a positive integer $k lt.eq C_1 \/ s$ such that
#[#set math.equation(numbering: n => "(8.4)")
 $ \| k H \| upright(" is birational on ") S . $ <eq:B3>]

 For a rational divisor this denotes the space of rational functions $f$ with $"Div" \( f \) + k H gt.eq 0$;
   no bounded Cartier index for $H$ is asserted.]
] <b:scale-birationality>

#proof[
  There is nothing to prove in dimension zero. First extract just the bad primes by Lemma 29,
    without an additional pivot. Every positive strict coefficient of $H$ is now at least a fixed positive
    multiple of $s$. Moreover the $A'$-boundary coefficient at each such prime has a uniform positive lower bound.
    At a new prime it is greater than $1 - e$. At an old non-lc prime use $B_0 \( P \) gt.eq H \( P \) gt.eq
    c_0$ and the effectiveness of the other boundary; at an old lc prime use $B_0 \( P \) = 1$ and $H \( P \) lt.eq 1$.
  Let $G$ be the sum of the bad primes, which are now strict.
    With a sufficiently large fixed $C_2$ and $k_0 = ceil.l C_2 \/ s ceil.r$, the integral Weil divisor
  $ N = floor.l k_0 H floor.r - G $
  satisfies $N gt.eq k_0 H \/ 2$. Indeed the rounding error plus the coefficient of $G$ is at most $2$ at each
    prime of the support, whereas each positive coefficient of $k_0 H$ is uniformly large.
    Choose a fixed sufficiently small rational $sigma > 0$. Subtract $sigma \( { k_0 H } + G \)$ from the
    $A'$-boundary and add $\( sigma k_0 - d' \) overline(H)$ to its moduli;
    choose $C_2$ large after $sigma$ so this last coefficient is positive.
    The total adjoint is $sigma N$, the boundary is effective, and its discrepancy is
  $ A' + sigma overline(\( { k_0 H } + G \)) . $
  It is uniformly generalized positive-lc: nonbad valuations already have discrepancy at least $e$,
    the added divisor is effective Cartier up to a rational multiple on this $bb(Q)$-factorial model,
    and every bad prime has received an increment at least $sigma$.
  Run its adjoint MMP on this Fano type model. The Mori dream space property and divisor MMP give a nef semiample
    transform of the big $N$; see #cite(label("BCHM")) Corollary 1.3.1 and #cite(label("HuKeel"))
    Proposition 1.11. Denote that transform by $N'$ on $Z$. It is an effective nef big integral Weil divisor.
    Negativity preserves the uniform generalized discrepancy bound;
    forgetting the effective boundary and b-nef part gives a uniform ordinary lc bound on $Z$.
    The model remains of Fano type, so $- K_Z$ is big. In particular $N' - K_Z$ is big.
    Theorem 1.1 of #cite(label("BirkarPolarised")), which permits an integral Weil polarization,
    now makes $\| q N' \|$ birational for a bounded positive integer $q$.
    Negativity on a common resolution transfers every such section to $q N$ on the original model:
    the pullback of the source divisor dominates that of its transform.
    This applies to the rational Cartier divisors represented by Weil sections as well.
    Finally $N lt.eq k_0 H$, so $\| q k_0 H \|$ is birational and $q k_0 lt.eq C_1 \/ s$.
  One can also obtain a bounded positive integer $u$ with $K_Z + u N'$ big.
    This additional observation is useful when using the version of the polarization result with both signs of
    $K_Z$. Let $u_0 gt.eq 0$ be the pseudo-effective threshold of $K_Z$ with respect to $N'$.
    It is rational by the Mori dream space property. If $u_0 = 0$, bigness follows for every positive $u$.
    Otherwise take the adjoint MMP at $u_0$, regarding $u_0 overline(N')$ as b-nef big data.
    Negativity retains a uniform generalized lc bound, and the nef semiample threshold adjoint is nonbig,
    hence defines a contraction of positive relative dimension.
    On its geometric generic fibre, ordinary approximation with a small ample reserve gives an effective uniformly
    positive-lc log Fano pair. Theorem 1.1 of #cite(label("BirkarBAB")) bounds the fibre.
    For a bounded very ample polarization, the degree of $- K$ is bounded above by adjunction to a general section
    curve. The transform of $N'$ has positive integral degree there:
    it is effective and integral, and its bigness, preserved by sections, excludes purely vertical support.
    Relative adjoint triviality gives $u_0 deg N' = deg \( - K \)$, so $u_0$ is bounded.
    Taking an integer $u > u_0$ proves the assertion. ◻
]

=== 8.3 Isolating the horizontal pivot <isolating-the-horizontal-pivot>

Suppose the level is collapsing. Use Lemma 29 to choose an extraction $S' arrow.r
  S$ containing the pivot $G_(*)$ as well as all bad primes, and put $H_(*) = H \( G_(*) \)$.
  Set $b_(*) = 1 \/ 4$, take $b lt.double b_(*)$, and choose a fixed rational $0 < nu lt.double b_(*)$,
  sufficiently small also for the coefficient bounds below. On $S'$ define

$ J = b_(*) G_(*) + nu sum_(P med upright("bad")\
P eq.not G_(*)) P . $

The coefficient at the pivot will determine the contraction threshold.
  The smaller coefficients at the remaining bad primes retain a uniform positive discrepancy bound without leaving
  another horizontal component.

#thm([Lemma 8.3.])[
  #emph[At a collapsing level there are a projective $bb(Q)$-factorial Fano type model $Y$ of $K$,
    a contraction $pi : Y arrow.r V$ with $dim V < dim S$, an effective ample rational Cartier divisor $H_V$ on
    $V$, and a rational $x asymp s^(- 1)$ with the following properties.
    The pivot survives on $Y$, and it is the only horizontal prime in the positive support of the trace $H''$ of
    $H$. Moreover
$ x = b_(*) / H_(*) \, wide H_(*) asymp s \, wide x H'' - J'' = x pi^(*) H_V \, $

 with $J$ as just defined. On common higher models,
#[#set math.equation(numbering: n => "(8.5)")
 $ H gt.eq pi^(*) H_V . $ <eq:B4>]

 The datum with b-nef part $upright(bold(M))_C = upright(bold(M))' + \( x - d' \)
   overline(H)$ and boundary obtained by subtracting $J$ from the $A'$-boundary has effective uniformly
   generalized positive-lc trace on $Y$, with total adjoint $x pi^(*) H_V$.
   The geometric generic fibres of $pi$ form a bounded family.]
] <b:scale-collapse>

#proof[
  #emph[The threshold and its lower bound.] On the chosen extraction set
  $ x = min { r : r H - J upright(" is pseudo-effective on ") S' } . $
  Subtracting $J$ leaves the $A'$-boundary effective: its coefficient at the pivot is at least $1 - b - a s$,
    and at the other indicated primes it is greater than $1 - e$. The discrepancy becomes $A' + overline(J)$.
    Every bad prime has received a fixed positive increment, so this datum is uniformly generalized $delta'$-lc
    for a fixed $delta' > 0$.
  The threshold $x$ is positive and finite, because $J$ is nonzero effective and $H$ is big.
    It is rational, and $x H - J$ is rationally linearly equivalent to an effective divisor,
    by the Mori dream space property. Adding $J$ to such a representative and dividing by $x$ gives an effective
    representative of the pullback of $H$ on $S'$. It descends as $H +
    "Div" \( f \) \/ q$ to an effective representative on $S$, by pushing its coefficients down.
    Consequently weak essentiality at the pivot gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ b_(*) / x lt.eq H_(*) + eta s lt.eq \( 1 + eta \) s . $ <b:scale-pivot-lower>]
  It follows that $x gt.tilde s^(- 1)$ and, after choosing $b$ small, $x - d' gt.tilde x$.
    Thus $upright(bold(M))_C$ is b-nef big. Adding $\( x - d' \)
    overline(H)$ to the moduli changes the total adjoint to $x H - J$ without changing $A' + overline(J)$.
  Run the adjoint MMP to a nef semiample transform on $Y$. Its total adjoint is the trace $x H'' - J''$.
    This divisor is not big, since $x$ is the threshold. Its semiample contraction $pi : Y arrow.r
    V$ therefore has positive relative dimension. The transformed boundary is effective,
    and negativity preserves the uniform generalized $delta'$-lc bound.
    All the birational models used here remain $bb(Q)$-factorial and of Fano type.
  #emph[Bounded fibres and the upper bound for the threshold.] We next bound the degree of $x
    H''$ on a geometric generic fibre. A proper normal generic fibre of a contraction in characteristic zero is
    geometrically integral and normal. Indeed its global functions are $k \( V \)$,
    so $k \( V \)$ is algebraically closed in $k \( Y \)$; separability gives the geometric assertions.
    Canonical forms on the fibre are obtained by dividing out a base volume form.
    A resolution with snc data shows that generic restriction and extension to an algebraic closure preserve the
    required discrepancy bounds. Apply Lemma 24 to the b-nef big part, reserving a tiny ample class.
    On the geometric generic fibre this gives an ordinary effective $delta' \/ 2$-lc log Fano pair.
    Theorem 1.1 of #cite(label("BirkarBAB")) therefore bounds the underlying fibre.
    The theorem applies over this algebraically closed characteristic-zero field;
    one may also transport the data along an isomorphism of the algebraic closure of $bb(C) \( V \)$ with $bb(C)$.
  Fix a bounded very ample Cartier polarization on these fibres,
    and write $deg$ for intersection with its appropriate power.
    If $L$ is this polarization in dimension $r gt.eq 1$, a general complete-intersection curve avoids the
    singular locus and gives
  $ deg \( - K \) lt.eq \( r - 1 \) L^r + 2 . $
  Thus this degree is bounded above. The trace of any b-nef part has nonnegative degree:
    upstairs add an arbitrarily small ample rational class, take an effective representative, push its trace down,
    and then let that class tend to zero. On $Y$ the CY trace of $A^(+)$ still has $B''_0 gt.eq
    H''$ and is effective. Every component of $J''$ is lc for $A^(+)$,
    so its $B''_0$-coefficient is $1$ and $J'' lt.eq B''_0$. The CY equality gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ x deg H'' = deg J'' lt.eq deg B''_0 lt.eq deg \( - K \) lt.eq C_3 . $ <b:scale-fibre-degree>]
  Here traces are rational Cartier, since $Y$ is $bb(Q)$-factorial.
  The birational functions of Lemma 30 remain sections satisfying $"Div" \( f \) + k H'' gt.eq
    0$ after the non-extracting MMP. If $s x$ were sufficiently large, (8.7) and $k lt.eq
    C_1 \/ s$ would bound the degree of every possible polar divisor on a geometric generic fibre by a number
    strictly less than $1$. An integral nonzero effective divisor has positive integral degree,
    so these polar divisors would vanish. Properness would then put all the functions in $k \( V \)$,
    contradicting their generation of $k \( Y \)$ and the positive relative dimension. Thus $x lt.tilde s^(- 1)$.
    Equation (8.6) now also gives $H_(*) gt.tilde s$.
  #emph[The pivot is the only positive horizontal component.] Consider the coefficients of $H'' - J'' \/ x$.
    At every positive coefficient other than the pivot, this divisor has coefficient at least $H'' \( P \) \/ 2
    gt.tilde s$. Outside $J''$ this follows from the inductive coefficient gaps and the extraction bounds.
    At a bad prime use $H \( P \) gt.eq s \/ 2$, $1 \/ x lt.eq \( 1 + eta \) s \/ b_(*)$,
    and choose $nu$ sufficiently small compared with $b_(*)$.
    At the pivot its coefficient is at least $- eta s$, by (8.6).
    If horizontal, that prime has bounded degree, since its coefficient in $B''_0$ is $1$.
    The total degree of $H'' - J'' \/ x$ on a generic fibre is zero.
    As $eta arrow.r 0$, a horizontal nonpivot component would contribute at least a fixed multiple of $s$,
    and the pivot could contribute only $- O \( eta s \)$. This is impossible.
    There must nevertheless be a horizontal component in the positive support of $H''$,
    since otherwise the birational functions would again be fibrewise regular.
    Hence the pivot survives and is the sole such horizontal component.
    The degree identity forces its coefficient in $H'' - J'' \/ x$ to be zero, proving $x = b_(*) \/ H_(*)$.
  #emph[The exact divisor on the base.] It follows that $D_Y = x H'' - J''$ is effective and vertical.
    Semiampleness gives $D_Y tilde.op_(bb(Q)) pi^(*) L$ for an ample rational Cartier divisor $L$ on $V$.
    The rational function implementing this equivalence has no horizontal poles,
    and hence lies in $k \( V \)$ by normality and properness of the generic fibre.
    Absorb its principal divisor into $L$ and divide by $x$ to obtain an exact equality $D_Y = x pi^(*) H_V$.
    Every strict base prime has a strict lift, so $D_Y gt.eq 0$ implies $H_V gt.eq 0$.
    Its rational linear class is ample. Finally, on a common resolution,
    negativity gives the effective rational Cartier b-divisor
  #[#set math.equation(numbering: n => "(8.8)")
   $ upright(bold(E))_(upright("MMP")) := x overline(H) - overline(J) - x overline(pi^(*) H_V) gt.eq
     0 . $ <b:scale-mmp-correction>]
  Since $J gt.eq 0$, this proves (8.5). The threshold datum after the MMP has discrepancy
  $ \( A' + overline(J) \) + upright(bold(E))_(upright("MMP")) = A' + x overline(H) - x overline(pi^(*) H_V) . $
  Thus its uniform positive lower bound holds on every prime over $Y$, as required for the next step. ◻
]

=== 8.4 Passing the data to the base <passing-the-data-to-the-base>

The contraction supplies $H_V$ and a uniformly positive discrepancy on $Y$.
  We push this discrepancy to obtain $Q_(upright("next"))$, and push $A^(+)$ separately to retain the lc places.
  Its bounded index will follow by returning to the principal-moduli datum on the initial field.

#thm([Proposition 8.4.])[
  #emph[At a collapsing level the construction of Lemma 31 supplies data at the next level satisfying all the
    stated invariants. More precisely, with the CY discrepancy
$ C = A' + x H = a_K + upright(bold(M))_C \, $

 put
#[#set math.equation(numbering: n => "(8.9)")
 $ A_(upright("next"))^(+) & = pi_(\#) A^(+) \, & Q_(upright("next")) & = pi_(\#) \( C - x pi^(*) H_V \) \,\
lambda_(upright("next")) & = x^(- 1) \, & S_(upright("next")) & = V \, wide H_(upright("next")) =
  H_V . $ <b:scale-next-data>]

 Then $Lambda_(upright("next")) = x^(- 1) pi_(\#) C$, $lambda_(upright("next")) asymp s arrow.r 0$,
   and $s_(upright("next")) gt.tilde s$. The CY moduli of $A_(upright("next"))^(+)$ have a bounded b-Cartier
   multiple, and $Q_(upright("next"))$ has a uniform positive discrepancy bound on every prime over $V$.]
] <b:scale-inheritance>

#proof[
  #emph[Discrepancy presentations and their lower bounds.] By (8.8),
    the threshold datum on $Y$ has discrepancy exactly $C - x pi^(*) H_V$.
    Therefore $C$ has effective horizontal trace and is uniformly generalized klt over the generic point of $V$.
    Its moduli are b-nef big, so Proposition 28, followed by translation by the base divisor,
    gives a presentation for $Q_(upright("next"))$ with rational b-Cartier b-nef part and total adjoint $x H_V$.
  The CY datum $A^(+)$ has effective horizontal trace on $Y$. Apply Lemma 26 to $A^(+) \, C$.
    For all sufficiently small rational $t > 0$, uniformly in the member and the base prime,
    a lift computing the push of $\( 1 - t \) A^(+) + t C$ also computes the push of $A^(+)$.
    On primary minimizers its value is
  $ \( 1 - t \) A_(upright("next"))^(+) \( P \) + t frac(C \( T \), m_T) . $
  A minimizer at any one such $t$ minimizes the second summand among all primary minimizers.
    Thus the push is exactly affine on a common interval including $t = 0$.
    At positive $t$ the moduli are b-nef big upstairs and the horizontal trace is klt,
    so Proposition 28 supplies b-nef rational b-Cartier CY moduli downstairs.
    Two distinct positive rational parameters give a common descent for their affine endpoint.
    All smaller positive parameters are nef on that descent; passing to the limit proves b-nefness of the
    endpoint. This constructs the required CY presentation for $A_(upright("next"))^(+)$.
  Nonnegativity of $A_(upright("next"))^(+)$ follows from (7.1).
    For effectivity, take a strict lift $F$ of a strict prime $P$ of $V$, with restriction $m P$.
    The effective trace upstairs bounds its normalized discrepancy by $1 \/ m lt.eq 1$,
    proving effectivity of the pushed boundary. For $A^(+)$ the stronger inequality $B''_0 gt.eq H'' gt.eq
    pi^(*) H_V$ gives
  $ A_(upright("next"))^(+) \( P \) lt.eq frac(A^(+) \( F \), m) lt.eq 1 / m - H_V \( P \) lt.eq 1 - H_V \( P \) . $
  Its boundary therefore dominates $H_V$.
  To obtain a bound for $Q_(upright("next"))$ on all valuations,
    apply Lemma 24 to the effective uniformly generalized $delta'$-lc threshold datum on the whole of $Y$.
    Use an ordinary effective $delta' \/ 2$-lc representative with the same relative rational log CY class and no
    larger discrepancies. The Fano type property implies that $- K_Y$ is big over $V$.
    The discriminant bound of #cite(label("BirkarFibrations")) Theorem 1.1 therefore gives a uniform positive
    bound for the valuative push of this ordinary pair, on every model of $V$.
    Equation (7.1) then gives the same bound for $Q_(upright("next"))$.
    Notice that this application uses the uniform lc bound on the entire total pair, not just its generic fibre.
  #emph[A model of the initial field and the uniform index.] To bound the new index,
    we retain a model of the initial field throughout. For each exceptional prime of $S' arrow.r S$,
    which is lc for $A^(+)$, attainment and composition in Lemma 23 give a prime over $cal(Y)$ that is lc for
    $A_1^(+)$ and restricts to a positive multiple of the prescribed prime.
    Extract these primes, if they are not already strict, without any others.
    To justify this extraction, mix the effective ordinary lc CY boundary of $A_1^(+)$ on $cal(Y)$ with an
    effective klt log Fano boundary, giving the latter a sufficiently small positive weight.
    The mixture is log Fano and klt, and the requested discrepancies lie strictly between $0$ and $1$.
    Lemma 25 applies, producing a $bb(Q)$-factorial Fano type model $cal(Y)'$.
    The trace of $A_1^(+)$ remains effective, since each new prime has $A_1^(+)$-discrepancy zero.
    Every strict prime of $S'$ now has a strict lift on $cal(Y)'$;
    for the nonexceptional ones use the existing morphism to $S$.
    The same is true for every strict prime of $Y$, because the MMP extracts none.
  There need not yet be a morphism $cal(Y)' arrow.r Y$, so we construct one without losing these properties.
    Choose an ample Cartier divisor $D_Y$ on $Y$, pull it back on a resolution of the rational map,
    and let $D^(*)$ be its trace on $cal(Y)'$. It is rational Cartier.
    The rational-function sections satisfy, in every nonnegative degree,
  #[#set math.equation(numbering: n => "(8.10)")
   $ { f in K_1 : "Div" \( f \) + m D^(*) gt.eq 0 } = { f in k \( Y \) : "Div" \( f \) + m D_Y gt.eq
     0 } . $ <b:scale-auxiliary-sections>]
  Indeed a function on the left has no poles on the normal proper generic fibre of $cal(Y)' arrow.r S$:
    the divisor $D^(*)$ has coefficient zero at every prime dominating $S$,
    since it comes from the field $k \( S \)$. It is therefore a member of $k \( S \) = k \( Y \)$.
    The strict lifts just constructed test its order at every strict prime of $Y$, giving one inclusion.
    Conversely an effective Cartier divisor represented by a section on $Y$ has effective pullback and trace on
    $cal(Y)'$. This also proves the assertion for the possibly nondivisible degrees,
    by viewing the conditions as inequalities of rational divisors.
  Run a divisor MMP for $D^(*)$ on the Fano type variety $cal(Y)'$.
    Its effective rational class is pseudo-effective, and its transform is nef semiample.
    Negativity preserves the divisible section systems in (8.10).
    Their Proj is $Y$, so the resulting model has a morphism to $Y$ inducing the given field inclusion.
    This morphism is a contraction: $k \( Y \) = k \( S \)$ is relatively algebraically closed in $K_1$,
    and normality identifies its Stein factor with $Y$. The model remains $bb(Q)$-factorial of Fano type,
    and the trace of $A_1^(+)$ remains effective under non-extraction.
    Composing with $Y arrow.r V$ supplies the next auxiliary model.
    Valuative composition shows that its push of $A_1^(+)$ is exactly $A_(upright("next"))^(+)$.
  A klt log Fano boundary on this auxiliary model supplies an effective generalized klt CY datum with b-nef big
    part: take minus its own adjoint as the moduli divisor. Apply Corollary 27 to this contraction and the initial
    principal-moduli datum $A_1^(+)$. Its dimension and denominator $n$ are bounded independently of the level and
    member. Thus a bounded integer clears every discrepancy denominator of $A_(upright("next"))^(+)$.
    On a smooth descent of its already constructed CY moduli, the form discrepancies are integral,
    so the same integer clears the coefficients of the moduli trace.
    An integral divisor on that smooth model is Cartier. This proves the required bounded b-Cartier multiple,
    without introducing any fibre-multiplicity factor.
  #emph[Weak essentiality on the base.] If $P$ is lc for $A_(upright("next"))^(+)$, choose a lift $T$,
    with restriction $m_T P$, computing the push of $\( 1 - t \) A^(+) +
    t C$ for a fixed sufficiently small rational $t > 0$. Lemma 26 gives $A^(+) \( T \) = 0$.
    The formulas for $C$, together with $x asymp s^(- 1)$, give discrepancy inequalities
  $ A^(+) lt.tilde C \, wide x Lambda lt.tilde C . $
  For example, $C = \( 1 - gamma \) A^(+) + gamma Q + \( a + x \) H$, all summands are nonnegative, $1 -
    gamma$ is bounded below, and $x lambda \/ gamma = x s \/ b$ is bounded when $Q$ is present.
    Compare the mixture at $T$ with its value at a lift minimizing $C \/ m$. Since $A^(+) \( T \) = 0$, this proves
  #[#set math.equation(numbering: n => "(8.11)")
   $ frac(Lambda \( T \), m_T) lt.eq C_4 Lambda_(upright("next")) \( P \) . $ <b:scale-essential-lift>]
  The factor $t^(- 1)$ is harmless because $t$ was fixed uniformly.
  If $H'_V gt.eq 0$ is rationally linearly equivalent to $H_V$,
    apply its rational principal change to $H$ through the field inclusion.
    Inequality (8.5) shows on a common resolution that the new divisor is effective:
    it is the sum of $H - pi^(*) H_V$ and $pi^(*) H'_V$. Pushing down gives an effective representative $H'
    tilde.op_(bb(Q)) H$ on $S$. Its change at $T$ is exactly $m_T \( P \( H'_V \) - P \( H_V \) \)$.
    Apply (8.2) at $T$ and then (8.11). We obtain
  $ P \( H'_V \) lt.eq P \( H_V \) + C_4 eta Lambda_(upright("next")) \( P \) . $
  Replacing $eta$ by $C_4 eta$ preserves its convergence to zero.
  #emph[Invariant-prime inequalities and strict coefficient gaps.] For (8.1),
    the first two inequalities follow immediately from valuative minimization and (8.5).
    If an invariant prime has restriction $j P$ at the old level and remains nontrivial at the next,
    its full-multiplicity next $Lambda$-value is at most
  $ x^(- 1) j #scale(x: 120%, y: 120%)[\(] \( 1 - gamma \) A^(+) \( P \) +
    gamma Q \( P \) + \( a + x \) H \( P \) #scale(x: 120%, y: 120%)[\)] . $
  When $Q$ is present, (8.1) gives
  $ j gamma Q \( P \) lt.eq gamma + b / s C_0 h_E . $
  The constant $gamma$ cancels the $- gamma$ in the bound $\( 1 - gamma \) j A^(+) \( P \)
    lt.eq \( 1 - gamma \) \( 1 - h_E \)$. Using $j H \( P \) lt.eq h_E$ and $x asymp s^(- 1)$,
    we obtain a bound $x^(- 1) + C' h_E$, exactly the next third inequality.
    Initially the same calculation simply omits the $Q$-term.
  It remains to check the strict coefficient gaps and witnesses;
    they cannot be inferred solely from the preceding inequalities.
    For a strict prime $P_V$ take a strict lift $F$ on $Y$ with restriction $m P_V$.
    The effective threshold boundary and the lower bound for $Q_(upright("next"))$ imply
  $ 0 < delta_(upright("next")) lt.eq Q_(upright("next")) \( P_V \) lt.eq
    frac(\( C - x pi^(*) H_V \) \( F \), m) lt.eq 1 / m . $
  Hence $m$ is uniformly bounded. If $H_V \( P_V \) > 0$ and $A_(upright("next"))^(+) \( P_V \) > 0$,
    the lift is non-lc for $A^(+)$. It is therefore an old strict prime of $S$, lies outside $J$,
    and satisfies $m H_V \( P_V \) = H'' \( F \) gt.eq c_0$. This proves the absolute positive gap.
    If instead $P_V$ is lc and $H_V \( P_V \) > 0$, the nonpivot coefficient bound for $H'' -
    J'' \/ x$ gives $H_V \( P_V \) gt.tilde s$, since the pivot is horizontal and $m$ is bounded.
    Before any terminal replacement of the scale, effectivity of the $Q_(upright("next"))$-boundary gives
  $ s_(upright("next")) lt.eq H_V \( P_V \) + lambda_(upright("next")) Q_(upright("next")) \( P_V \) lt.eq
    H_V \( P_V \) + lambda_(upright("next")) . $
  Since $lambda_(upright("next")) asymp s$, this proves the required lower bound by a fixed multiple of
    $s_(upright("next"))$.
  Finally suppose $H_V \( P_V \) = 0$. The same nonpivot coefficient bound forces $H'' \( F \) = 0$.
    All extracted primes have positive $H$-value, so $F$ is an old strict prime.
    Its old witness has $h_E = 0$ and bounded restriction multiplicity.
    Restricting that witness to $k \( V \)$ only multiplies this multiplicity by the bounded $m$,
    giving the next witness. The lower bound for $Q_(upright("next"))$ also yields $s_(upright("next")) gt.tilde
    lambda_(upright("next")) asymp s$ from the definition of the scale. All invariants have now been proved. ◻
]

=== 8.5 The terminal level <the-terminal-level>

At the last level the unmodified scale is bounded away from zero.
  We use that lower bound to choose the constants below, while writing $s = 1$ as agreed above.
  No further field contraction is needed beyond the map to a point.

#thm([Lemma 8.5.])[
  #emph[At the final level one may take $Y = S$ up to a small $bb(Q)$-factorialization, with target a point,
    and choose a fixed small rational $x > 0$ so that
$ C = A' + x H = a_K + upright(bold(M))_C \, wide upright(bold(M))_C = upright(bold(M))' + \( x - d' \) overline(H) $

 is effective and uniformly generalized klt. Its b-nef big part has a fixed positive $H$-reserve,
   its boundary dominates a fixed positive multiple of $H$, and the underlying $Y$ belongs to a bounded family.
   For every invariant prime with restriction $E \|_(k \( S \)) = c P eq.not 0$,
#[#set math.equation(numbering: n => "(8.12)")
 $ c C \( P \) lt.eq 1 - h_E / 2 . $ <b:scale-terminal-bound>]

]
] <b:scale-terminal>

#proof[
  Use $s = 1$ and the actual lower bound for the unmodified scale to choose $e$ as in Lemma 29.
    There are no bad primes, so $A'$, and hence $C gt.eq A'$, has a uniform positive discrepancy bound.
    Take $b lt.double a$ and then a fixed small positive $x$.
    Now $x - d' = x + a - b > 0$ (initially it is $x + a$), giving a fixed positive $H$-reserve. The boundary of $C$ is
  $ \( 1 - gamma \) B_0 + gamma B_Q - \( a + x \) H gt.eq \( 1 - gamma - a - x \) H \, $
  with the usual initial convention. Make the constants small enough that the right side is a fixed positive
    multiple of $H$.
  For the displayed estimate, the same constant-term cancellation as in the inheritance proof gives
  $ c C \( P \) & lt.eq \( 1 - gamma \) \( 1 - h_E \) + gamma + b C_0 h_E + \( a + x \) h_E\
 & = 1 - \( 1 - gamma - b C_0 - a - x \) h_E . $
  Choose $gamma + b C_0 + a + x < 1 \/ 2$; this is uniform since $gamma = b lambda$ and $lambda arrow.r 0$,
    or $gamma = 0$ initially. This proves (8.12). Ordinary approximation with a tiny ample reserve gives an
    effective ordinary uniformly positive-lc log Fano pair on $Y$.
    Theorem 1.1 of #cite(label("BirkarBAB")) bounds the underlying variety.
    All assertions in dimension zero are interpreted vacuously. ◻
]

Starting with $S_1 = S$, repeat Proposition 32 whenever the scale tends to zero, and use Lemma 33 otherwise.
  Each collapsing level strictly lowers the dimension. The construction therefore terminates after a bounded
  number of levels, with contractions

$ Y_i arrow.r S_(i + 1) \, wide k \( Y_i \) = k \( S_i \) = K_i \, wide S_(f + 1) = "Spec" bb(C) \, $

where the $K_i$ form a nested tower of actual function fields.
  Passing to a subsequence makes the number of levels and their dimensions constant.
  All positive constants fixed during this construction are uniform along that subsequence.

== 9 Uniform estimates and widths <b:width-estimates>

The tower controls discrepancies one relative field at a time.
  We now translate this control into estimates for sections:
  upper bounds on the dimensions of their initial spaces, together with independent sections of comparable cost.
  These two directions are both used in the later valuation argument.
  Divisor orders provide the upper bounds; opposite torus twists and birational systems provide the sections.

Index the tower by $i = 1 \, dots.h \, f$, with

$ k \( S_i \) = k \( Y_i \) = K_i \, wide Y_i arrow.r S_(i + 1) \, wide S_(f + 1) = upright("pt") \, wide
  K_(f + 1) = k = bb(C) . $

The first field is the residual field in (6.3). After a subsequence all dimensions and ranks are constant. Put

$ p_i = "trdeg"_(K_(i + 1)) K_i \, wide a_i = s_i C_i asymp s_i A_i^(+) + Lambda_i \, wide s_f = 1 \, quad
  s_i arrow.r 0 quad \( i < f \) . $

Indeed the tower gives, with the constants chosen at level $i$,

$ a_i = \( 1 - gamma_i \) s_i A_i^(+) + b lambda_i Q_i + s_i \( a + x_i \) H_i \, $

omitting the $Q_1$-term. All terms have nonnegative values. Moreover

$ lambda_(i + 1) = 1 \/ x_i asymp s_i \, wide s_(i + 1) gt.tilde s_i . $

Constants in this section may depend on the previously fixed sequence bounds and dimensions,
  but are uniform in the functions, divisors, weights and cutoffs subsequently tested.

The b-nef Calabi–Yau moduli of $a_i$ contain simultaneous positive reserves of $upright(bold(H))_i =
  overline(H_i)$ and, for $i > 1$, of $s_(i - 1) upright(bold(M))_(Q_i)$.
  The first coefficient is $s_i \( x_i - d'_i \) gt.tilde 1$; the second follows from $s_i gamma_i = b lambda_i$.
  For an invariant prime $E$ on $"Spec" R$, write $E \|_(K_i) = j_i P_i$ when nontrivial, with $P_i$ normalized. Then

#[#set math.equation(numbering: n => "(9.1)")
 $ j_i a_i \( P_i \) lt.eq s_i + C_0 h_E . $ <b:scaled-witness>]

To see the exact constant, substitute (8.1) in the displayed formula for $a_i$.
  The constant contributions are $\( 1 - gamma_i \) s_i + b lambda_i = s_i$;
  the remaining terms are bounded multiples of $h_E$, using $j_i H_i \( P_i \) lt.eq h_E$.
  The unscaled $C_i$ have uniform positive horizontal discrepancy bounds.
  The scaled functions $a_i = s_i C_i$ measure the smaller divisor orders that correspond to width $1 \/ s_i$;
  their positive lower bounds are not uniform at collapsing levels.
  All restrictions and discrepancy functions are evaluated homogeneously.
  At a trivial restriction their value is defined to be zero.

=== 9.1 Horizontal orders and errors of nef traces <horizontal-orders-and-errors-of-nef-traces>

Let $cal(F)_i$ be the arithmetic generic fiber of $Y_i arrow.r S_(i + 1)$, over $K_(i + 1)$; for $i =
  f$ this is $Y_f$. The models $Y_i$ are $bb(Q)$-factorial.
  A horizontal prime means a prime-divisor valuation on $K_i$ trivial on $K_(i + 1)$.
  Horizontally $C_i = a_(K_i) + upright(bold(M))_(C_i)$ has effective uniformly positive-lc generalized Calabi–Yau
  data with big nef part. For $i < f$, use the transformed threshold discrepancy $C_i - x_i pi^(*) H_(i + 1)$;
  for $i = f$, use the last-step data. The trace boundary $B''_(0 \, i)$ of $A_i^(+) = a_(K_i) +
  upright(bold(M))_(0 \, i)$ is effective and dominates the trace $H''_i$ of $upright(bold(H))_i$.

The normal projective arithmetic fibers are geometrically integral and normal,
  by characteristic zero and the contraction property. Their arithmetic Weil divisors are rationally Cartier,
  by taking closures on $Y_i$. We do not require geometric $bb(Q)$-factoriality.
  Divide the chosen volume form by a base volume form generating canonical on a smooth base open.
  At horizontal generic points, smoothness of the generic fiber identifies the resulting relative canonical
  coefficients, including on resolving models. The dimension formula identifies normalized horizontal tests with
  prime-divisor tests of the relative field.

Such a test extends after algebraic closure of $K_(i + 1)$ with unchanged normalization on arithmetic functions:
  take a component of its extension on a smooth birational chart,
  whose generic ramification index is one by separability. Conversely snc resolution transfers the arithmetic
  discrepancy inequalities to all geometric tests. In particular an snc boundary with coefficients at most $1 -
  delta$, $0 < delta lt.eq 1$, has discrepancy at least $delta$ on every normalized prime:
  subtract the reduced-support discrepancy and use integrality of the remaining orders.

Lemma 24, with an ample reserve, makes the geometric fibers klt of Fano type and puts them in a bounded family by
  #cite(label("BirkarBAB")) Theorem 1.1 and Corollary 1.4. Use a bounded very ample Cartier polarization $D$ to
  measure degrees. These bounded-family assertions over $bb(C)$ apply here:
  the algebraic closure of a finitely generated function field over $bb(C)$ is individually isomorphic to $bb(C)$.
  The ordinary effective approximation $Delta$ can be chosen with $K + Delta tilde.op_(bb(Q)) 0$,
  a uniform positive-lc bound, and ordinary discrepancies no larger than $C_i$.
  This approximation may first be made on the whole threshold model and then restricted geometrically.
  Dimension-zero fibers need none of the following divisor estimates.

#thm([Lemma 9.1.])[
  #emph[For every effective rational $bb(Q)$-Cartier divisor $L'$ on $cal(F)_i$ and every horizontal test $P$,
#[#set math.equation(numbering: n => "(9.2)")
 $ P \( L' \) lt.eq C_0 deg \( L' \) C_i \( P \) . $ <eq:C1>]

 If $upright(bold(U))$ is rational b-Cartier and b-nef, with trace $U_(upright("tr"))$ on $Y_i$, then
#[#set math.equation(numbering: n => "(9.3)")
 $ 0 lt.eq P \( overline(U_(upright("tr"))) - upright(bold(U)) \) lt.eq
   C_0 deg \( U_(upright("tr")) \) C_i \( P \) . $ <eq:C2>]

]
] <b:horizontal-estimates>

#proof[
  Put $p = p_i > 0$. The bare geometric fiber is klt, so the cone theorem and its length bound
    #cite(label("FujinoFundamental")) Theorem 1.1(5) give $K + 2 p D$ nef.
    Thus $A = \( 2 p + 1 \) D$ satisfies $A - Delta tilde.op_(bb(Q)) A + K$ ample.
    Its degree is bounded, and the polarized threshold theorem #cite(label("BirkarBAB")) Theorem 1.8 gives a
    uniform positive lower threshold for the $bb(R)$-linear system of $A$ against the ordinary positive-lc pair.
    The same cone inequality bounds $deg \( - K \)$.
  Every geometric prime of degree $e$ lies in a Cartier section of $\| q D \|$ for some $1 lt.eq q lt.eq e$.
    Indeed a general basepoint-free projection to $bb(P)^p$ is finite, since its pulled-back hyperplane is ample.
    The image of the prime is a hypersurface of degree at most $e$, and its pullback contains the prime.
    Consequently a nonzero $L'$ is dominated geometrically by a rational weighted sum of such sections,
    of rational class $q' D$ with $q' lt.eq deg L'$. The difference is effective rationally Cartier,
    even when the individual geometric primes are not rationally Cartier.
    Scale this sum to the system of $A$, apply the threshold bound,
    and compare the ordinary discrepancy with $C_i$. Extension of the arithmetic test gives (9.2).
  Negativity makes $overline(U_(upright("tr"))) - upright(bold(U))$ b-effective.
    On a high projective descent add a positive rational ample amount tending to zero.
    The error of the ample addition is again nonnegative, so this can only increase the error being bounded.
    The perturbed nef class is ample and has, after a rational principal adjustment,
    an effective representative upstairs. That adjustment changes neither error.
    Its nonnegative orders bound the new error by the pullback order of its effective trace.
    Apply (9.2) and let the added amount tend to zero. The traces in question are arithmetically rationally
    Cartier and geometrically pseudo-effective; their degrees are nonnegative. This proves (9.3). ◻
]

=== 9.2 A pure upper estimate <a-pure-upper-estimate>

#thm([Proposition 9.2.])[
  #emph[For $D_1 gt.eq 0$, $D_1 tilde.op_(bb(Q)) H_1$ on $S_1$, and every divisorial test $P_1$,
    with restriction multiplicities included in $P_i = P_1 \|_(K_i)$, one has
#[#set math.equation(numbering: n => "(9.4)")
 $ D_1 \( P_1 \) lt.eq C_0 sum_i a_i \( P_i \) . $ <eq:C3>]

 For tests trivial on $K_f$, this implies
#[#set math.equation(numbering: n => "(9.5)")
 $ D_1 \( P_1 \) lt.eq C_0 #scale(x: 120%, y: 120%)[\(] H_1 \( P_1 \) +
   s_exp A_1^(+) \( P_1 \) #scale(x: 120%, y: 120%)[\)] \, wide s_exp := max_(i < f) s_i arrow.r 0 \, $ <eq:C4>]

 where an empty maximum is zero.]
] <b:pure-upper>

#proof[
  Horizontally on $Y_1$, $deg D_(1 \, upright("tr")) lt.tilde s_1$.
    For a nonlast level, $x_1 H''_1 = J'' lt.eq B''_(0 \, 1)$; at the last level use $H''_1 lt.eq B''_(0 \, 1)$.
    The Calabi–Yau trace identity and nonnegative moduli degree bound $deg B''_(0 \, 1)$ by $deg \( - K \)$.
    The b-nef divisor $D_1$ has orders at most those of its effective trace closure.
    Hence (9.2) gives $D_1 \( P \) lt.eq C_0 a_1 \( P \)$ on horizontal tests.
    Subtract $tau_1 D_1$ from $a_1$ for a small uniform positive rational $tau_1$.
    The moduli stay nef and big by the $upright(bold(H))_1$-reserve,
    and the horizontal data stay generalized klt and effective.
  Inductively define
  $ D_(i + 1) = pi_(\#) a_i - pi_(\#) \( a_i - tau_i D_i \) . $
  The minimum formula makes it nonnegative everywhere. Proposition 28 writes it as $upright(bold(U)) -
    upright(bold(U))'$ with both terms rational b-Cartier and b-nef. Their canonical coefficients agree, and
  $ upright(bold(U)) = s_i upright(bold(M))_(Q_(i + 1)) \, wide pi_(\#) C_i = Q_(i + 1) + x_i H_(i + 1) . $
  The next level has a positive reserve of this $upright(bold(U))$.
    Its effective scaled horizontal Calabi–Yau identity therefore bounds $deg U_(upright("tr")) lt.eq
    C_0 s_(i + 1)$. Nonnegativity of trace degrees and of the trace of $D_(i + 1)$ gives the same bound for
    $U'_(upright("tr"))$ and $D_(i + 1 \, upright("tr"))$. Apply (9.2) to the latter trace and (9.3) to the two
    trace errors. Thus
  $ 0 lt.eq D_(i + 1) \( P \) lt.eq C_0 a_(i + 1) \( P \) $
  horizontally. For a uniform sufficiently small $tau_(i + 1) > 0$,
    subtracting $tau_(i + 1) D_(i + 1)$ preserves nef big moduli:
    it subtracts $tau_(i + 1) upright(bold(U))$ from its reserve and adds $tau_(i + 1) upright(bold(U))'$.
    It also preserves horizontal klt and trace effectivity. A level without horizontal tests needs no degree estimate.
  For a test continuing nontrivially to $P_(i + 1)$,
  $ \( a_i - tau_i D_i \) \( P_i \) gt.eq pi_(\#) \( a_i - tau_i D_i \) \( P_(i + 1) \) gt.eq -
    D_(i + 1) \( P_(i + 1) \) \, $
  because $a_i gt.eq 0$. Rearranging and using the horizontal estimate at the last nontrivial restriction proves
    (9.4). For a test trivial on $K_f$, only $i < f$ contribute. The tower gives
  $ A_(i + 1)^(+) \( P_(i + 1) \) lt.eq A_i^(+) \( P_i \) \, wide Lambda_(i + 1) \( P_(i + 1) \) lt.eq
    lambda_(i + 1) C_i \( P_i \) lt.tilde a_i \( P_i \) . $
  Recursively use $a_i asymp s_i A_i^(+) + Lambda_i$ and $Lambda_1 = H_1$; the tower length is bounded.
    This gives (9.5). ◻
]

For tests trivial on the terminal field $K_f$, (9.5) involves only the scales that tend to zero.
  The uniformly bounded residual directions have disappeared from that estimate.

=== 9.3 Integral classes for opposite characters <integral-classes-for-opposite-characters>

Recall $M_T = bb(Z) chi xor M_0$, with $M_0 = ker D$, and the normalized dual polytope $Q_T$. On $M_(0 \, bb(R))$ set

$ parallel beta parallel = max_(rho in Q_T) \| rho \( beta \) \| . $

This is a norm by the occurring-cone and interiority properties.

For an occurring weight $mu = m chi + beta$ of positive cost $B' = tilde(v) \( mu \)$,
  the comparison on $Q_T$ following (6.6) gives

$ 0 lt.eq m lt.tilde B' \, wide parallel beta parallel lt.tilde B' . $

Indeed $D in Q_T$ and $0 lt.eq rho \( mu \) lt.eq C B'$ for all $rho in Q_T$.

To see how the pure estimate will control a general weight space, write $R_mu =
  z^mu U$ with coefficient space $U subset K_1$. Finite generation supplies an opposite section of weight
  $d \( m' chi - beta \)$ for a suitable $m' > parallel beta parallel$ and some positive clearing integer $d$.
  If its coefficient is $g'$, then for every $g in U \\ { 0 }$ the product $z^(d \( m + m' \) chi) g^d
  g'$ is a pure section. Both its degree and the exponent of $g$ have been multiplied by $d$,
  so this factor cancels when (9.4) is used to bound the order of $g$.
  We carry out the resulting coefficient count below.

Actual probes require more: their degrees and costs must be bounded by a uniform multiple of $max { 1 \,
  parallel beta parallel }$, so their clearing factor must be bounded as well.
  The following integral class data make that possible on the bounded fibres.
  They will also control the divisor classes in the marked families of Section 10.

#thm([Lemma 9.3.])[
  (Integral class data).  #emph[For projective normal klt varieties of Fano type occurring in a bounded family
    with bounded polarizations, the groups $"Cl" \/ upright("torsion")$ can be identified with Euclidean lattices
    of finitely many types, so that
#[#set math.equation(numbering: n => "(9.6)")
 $ parallel \[ G \] parallel_(upright("cl")) lt.eq C_0 deg \( G \) $ <b:class-norm>]

 for effective rational Weil divisors and for pseudo-effective rationally Cartier rational classes.
   The orders of $"Cl"$-torsion are bounded. For the $bb(Q)$-factorial members,
   a single bounded positive multiple of every integral Weil divisor is Cartier.
   A numerically trivial rational Cartier divisor is rationally linearly trivial.]
] <b:class-lattices>

#proof[
  The bounded family need only contain the varieties under consideration;
    its other members need not satisfy positivity. After finite stratification and finite base extensions,
    take simultaneous projective smooth resolutions $b_t : W_t arrow.r
    X_t$ with labeled exceptional prime divisors. To construct them,
    resolve the geometric generic fiber #cite(label("WlodarczykResolution")) Theorems 1.0.1–1.0.3,
    spread after a finite extension, shrink, and apply noetherian induction to the complement.
    Keep an isomorphism on dense opens and spread the components of the complements.
    Stabilizing their fiber and image dimensions identifies all exceptional prime families and excludes additional
    exceptional divisors. Smoothness of $W_t$, normality and geometric integrality of the fibers in use,
    and geometric integrality of the prime families hold after the corresponding open restrictions.
    Fixed labeled prime or Cartier data can be included in this process.
  On the selected fibers, Kawamata–Viehweg vanishing for a klt log Fano boundary #cite(label("FujinoFundamental"))
    Theorem 3.2 and rationality of klt singularities #cite(label("FujinoRational")) Theorem 0.1 give
    $H^1 \( cal(O) \) = H^2 \( cal(O) \) = 0$, both on $X_t$ and on $W_t$.
    The exponential sequence and GAGA #cite(label("SerreGAGA")) Section 12, Theorems 1–3; Section 20,
    Proposition 18 therefore identify $"Pic"$ with integral $H^2$ on both.
    Strict transform and pushforward give the diagram
  $ H^2 \( X_t \, bb(Z) \) med arrow.r^(thin b_t^(*) thin) med H^2 \( W_t \, bb(Z) \) med arrow.r med
    H^2 \( W_t \, bb(Z) \) \/ chevron.l \[ E_1 \] \, dots.h \, \[ E_q \] chevron.r = "Cl" \( X_t \) . $
  The image of the first group in the quotient is $"Pic" \( X_t \)$.
  These are locally constant integral group data, including torsion, after stratification:
    proper topological constructibility gives the integral cohomology local systems and functorial pullback,
    while relative line bundles give the labeled Chern classes.
    Here is the finite stratification argument, including compatibility with the markings.
    For either projective family $cal(V) arrow.r T$, let $Z_1 \, dots.h \,
    Z_s subset cal(V)$ be its finitely many closed marked subsets.
    Apply #cite(label("DeCataldoMiglioriniHodge")) Theorem 3.2.3 to the finite map
  $ cal(V) union.sq union.sq.big_(i = 1)^s Z_i arrow.r cal(V) $
  given by the identity and the inclusions. Split the source strata by the open-and-closed summands and their
    connected components. For each connected target stratum $S$, the subset $Z_i ∩ S$ is closed.
    It is also open, since it is a union of images of submersive source strata.
    Hence it is either empty or all of $S$, so the finite target Whitney stratification is compatible with every
    marking.
  Work over each irreducible base piece and restrict to a smooth dense open.
    Remove the closures of the images of all nondominating strata and of the critical loci of the dominating
    strata. These closures are proper by generic smoothness. The remaining strata map submersively to the base,
    and the whole family remains proper. Embed the family relatively in a smooth projective ambient space.
    Thom’s first isotopy lemma #cite(label("MatherTopological")) Proposition 11.1 gives local topological
    triviality. Intersect the opens for the finitely many families in use.
    Noetherian induction treats the remaining base pieces by reapplying this construction to their reduced
    base-changed families and closed markings; no Whitney assertion for arbitrary closed restrictions is needed.
  In trivializations over a small contractible base open, the fiber maps vary continuously and hence induce
    constant cohomology maps. No simultaneous trivialization of the resolution morphism, or trivial monodromy,
    is required. Monodromy preserves the isomorphism type of this group diagram.
  There are consequently finitely many group-diagram types.
    Their cokernels bound the torsion of $"Cl"$; when $"Cl" \/ "Pic"$ is finite, its exponent is bounded as well.
    The latter finiteness is exactly rational factoriality here, so it gives the asserted Cartier multiple.
  For the norm assertion in dimension $p gt.eq 2$, fix a relative very ample $D_W$ on each resolved stratum.
    After further finite extension and shrinking, choose relative line bundles $T_1 \, dots.h \,
    T_r$ spanning $H^2 \( W_t \, bb(Q) \)$, with a common integer $l > 0$ such that $l D_W plus.minus
    T_j$ are ample. We justify this choice, which contains more information than the abstract local systems.
    Shrink where the coherent vanishings hold and the Betti ranks are constant.
    Descend the finite family data to a countable algebraically closed subfield of $bb(C)$,
    and realize its geometric generic fiber as a complex fiber generic over that smaller field.
    The relevant algebraic closures and $bb(C)$ are isomorphic over the embedded defining parameter field,
    since their remaining transcendence degrees have the same infinite cardinality.
    On that fiber $"Pic" = H^2 \( bb(Z) \)$. Hard Lefschetz and the Hodge–Riemann bilinear relations
    #cite(label("DeCataldoMiglioriniHodge")) Theorem 3.1.2(a)–(c) make the pairing $T T'
    D_W^(p - 2)$ nondegenerate on $H^2 \( bb(Q) \)$. Indeed $H^2 =
    P^2 xor D_W H^0$ is an orthogonal decomposition: the primitive summand is nondegenerate by polarization,
    and the ample summand has nonzero self-pairing $D_W^p$. Choose spanning line bundles there,
    spread them after a finite extension, and retain their nonsingular intersection matrix and ample comparisons
    on an open. Betti-rank constancy proves they continue to span. Noetherian induction treats the other strata.
  Use the coordinates
  $ #scale(x: 120%, y: 120%)[\(] G_W dot.op T_j dot.op D_W^(p - 2) #scale(x: 120%, y: 120%)[\)]_j . $
  For an effective divisor their absolute values are at most $l deg_(D_W) \( G_W \)$, by the ample comparisons.
    The integral free lattice embeds in $bb(Z)^r$ and contains the fixed full-rank subgroup generated by the
    $T_j$-coordinates. Thus only finitely many intermediate lattices occur.
    The exceptional classes have fixed coordinates too. Orthogonal projection modulo their real span gives
    lattices of finitely many types for the free class groups downstairs.
  If $G_W$ is the strict transform of an effective prime $G$,
    the containing hypersurface used in the proof of (9.2) pulls back to an effective Cartier divisor dominating
    $G_W$. The fixed family intersection degrees give $deg_(D_W) \( G_W \) lt.eq C deg \( G \)$.
    Linearity and the triangle inequality prove (9.6) for effective rational Weil divisors.
    In dimension one use ordinary degree and the Picard description above; dimension zero is vacuous.
  A numerically trivial rational Cartier divisor pulls back to a numerically trivial class upstairs.
    The same nondegenerate pairing and $"Pic" \( W_t \) = H^2 \( W_t \, bb(Z) \)$ make its rational class zero.
    Pushforward proves rational linear triviality downstairs.
    Finally a pseudo-effective rational Cartier class becomes big after adding any small positive rational ample
    amount, and a big rational Cartier class is rational-linearly effective.
    Apply the effective bound and pass to the limit. ◻
]

#thm([Lemma 9.4.])[
  (Arithmetic principal witnesses).  #emph[An integral Weil divisor defined on a proper geometrically integral
    normal arithmetic fiber which becomes principal geometrically is already principal over the arithmetic field.
    No extension-degree factor is needed. The same holds for a rational divisor after clearing its specified
    denominator.]
] <b:principal-descent>

#proof[
  A witnessing function is defined over a finite normal extension $L \/ K$.
    For $sigma in "Gal" \( L \/ K \)$, its conjugate quotient has zero divisor,
    hence is an invertible global regular function on the proper normal fiber.
    Geometric integrality makes it a constant in $L^(*)$. The resulting scalar cocycle is trivial by Hilbert 90.
    Rescale the function by the corresponding scalar; its divisor is unchanged and the function is Galois invariant. ◻
]

=== 9.4 Saturation of opposite twists <saturation-of-opposite-twists>

For a character $beta$ with $parallel beta parallel lt.eq L$ and $L gt.eq 1$,
  we now use the integral class data to replace arbitrary monoid clearing by a bounded factor.
  On each fibre for which $L s_i arrow.r 0$, discreteness of divisor classes forces the obstruction to be a
  multiple of the pivot class. A rational principal correction removes it,
  and the discrepancy bounds allow us to pass the corrected inequalities to the next field.
  At the first scale with $L s_i gt.tilde 1$, a section construction and integrality close the argument.

#thm([Proposition 9.5.])[
  #emph[If $beta in M_0$, $parallel beta parallel lt.eq L$, and $L gt.eq 1$,
    then there are $m in n bb(Z)_(gt.eq 0)$ and a bounded positive integer $d_0$, with $m lt.tilde L$, such that
#[#set math.equation(numbering: n => "(9.7)")
 $ R_(m chi + d_0 beta) eq.not 0 \, wide R_(m chi - d_0 beta) eq.not 0 . $ <eq:C5>]

]
] <b:twist-saturation>

#proof[
  We may test the assertion on a contrary sequence, allowing $beta$ and $L$ to vary with its member,
    and take subsequences throughout. The first clearing factor $d$ below may be arbitrary;
    only the eventual factor $d_0$ is required to be uniformly bounded.
    At each individual member, finite generation of the weight monoid gives the assertion with member-dependent
    constants: rational cone points enter the monoid after a common multiple,
    by decomposition into simplicial generator cones. For $m_0 in n bb(Z)$ a little larger than $L$,
    both $m_0 chi plus.minus beta$ lie in the cone by its normalized dual inequalities.
    Thus $m_0 lt.tilde L$, and actual opposite sections exist after a possibly arbitrary common clearing factor $d > 0$:
  $ macron(h)^(d m_0 \/ n) z^(plus.minus d beta) r_plus.minus \, wide r_plus.minus in K_1^(*) . $
  We can take late members of a contrary sequence and round $L$ up to an integer. Start with
  $ u_plus.minus = - "Div" \( r_plus.minus \) \/ d \, wide ell_E = E \( z^beta \) \, wide mu = 0 . $
  The arbitrary $d$ occurs in $u_plus.minus$; the initial $ell_E$ are integral.
  After subsequences, stop at the first stage with $L s_i gt.tilde 1$; at all preceding stages $L s_i arrow.r 0$.
    A stop exists because $s_f = 1$. At entry to each reached stage we maintain $mu gt.eq 0$, $mu = o \( 1 \)$,
    $mu lt.tilde L lambda_i$, and
  #[#set math.equation(numbering: n => "(9.8)")
   $ u_plus.minus & = mu a_(K_i) + upright(bold(U))_plus.minus \, & upright(bold(U))_plus.minus &
     upright(" rational b-Cartier and b-nef") \,\
u_(+) + u_(-) & lt.eq C_0 L Lambda_i \,\
j_i u_plus.minus \( P_i \) & lt.eq plus.minus ell_E + C_0 L h_E + mu \, & j_i P_i & = E \|_(K_i) . $ <eq:C6>]
  The first inequality is on every prime and is homogeneous.
    The last line has left side zero at a trivial restriction.
    We allow $ell_E$ to change by orders of fractional rational functions from tower fields,
    with bounded clearing denominators. Such fractional functions are notation for rational principal b-divisors,
    not field extensions. Initially the product of the two sections and (6.3) give
  $ "Div" \( r_(+) r_(-) \) + 2 d m_0 H_1 gt.eq 0 \, $
  which is the sum bound; their regularity gives the last line.
  #emph[Removing the class obstruction before the stopping scale.] Consider a stage before the stop,
    so $L s_i arrow.r 0$. On its arithmetic fiber every strict prime other than the pivot $G_(*)$ comes from a
    strict prime of $S_i$ with $H_i \( P \) = 0$: the pivot alone among the positive support survives
    horizontally, and every extracted prime had positive $H_i$.
    Choose a witness $j_i P = E \|_(K_i)$ from (8.1) for each such prime, with bounded positive $j_i$ and $h_E =
    0$, and set
  $ c_P = ell_E \/ j_i \, wide Delta_(upright("col")) = sum_(P eq.not G_(*)) c_P P . $
  This arithmetic divisor has finite support and bounded denominator.
    Indeed $ell_E$ is initially an integral character order, and subsequently only the orders of previously
    bounded fractional gauges are added. There are dimension-many stages and bounded restriction integers.
    The original arbitrary $d$ never enters $Delta_(upright("col"))$.
    A rational function has nonzero orders at only finitely many strict primes of $"Spec" R$,
    proving the support assertion.
  Write $B''_0 = B''_(0 \, i)$, $upright(bold(M))_0 = upright(bold(M))_(0 \, i)$, and $c_plus.minus^(*) =
    u_plus.minus \( G_(*) \)$. At nonpivot strict primes,
  $ \( upright(bold(U))_plus.minus - mu upright(bold(M))_0 \) \( P \) = u_plus.minus \( P \) -
    mu A_i^(+) \( P \) lt.eq plus.minus c_P + mu B''_0 \( P \) . $
  At the pivot $A_i^(+) \( G_(*) \) = 0$, while $c_(+)^(*) + c_(-)^(*) lt.eq C_0 L s_i$. Hence the divisors
  $ W_plus.minus = plus.minus Delta_(upright("col")) + c_plus.minus^(*) G_(*) +
    mu B''_0 - \( U_plus.minus - mu M_0 \)_(upright("tr")) $
  are effective on the arithmetic fiber. Their degrees and those of the pseudo-effective traces
    $U_(plus.minus \, upright("tr"))$ are $O \( L s_i \)$: add the two identities to obtain
  $ W_(+) + W_(-) + \( U_(+) + U_(-) \)_(upright("tr")) = \( c_(+)^(*) + c_(-)^(*) \) G_(*) +
    2 mu \( B''_0 + M_(0 \, upright("tr")) \) . $
  All terms on the left have nonnegative degree. The degrees of $B''_0$,
    $M_(0 \, upright("tr"))$ and $G_(*)$ are bounded by Calabi–Yau effectivity;
    the pivot has coefficient one in $B''_0$. Also $mu lt.tilde L s_i$.
  On the geometric fiber, Lemma 36 applied to these identities gives
  $ parallel plus.minus \[ Delta_(upright("col")) \] + c_plus.minus^(*) \[ G_(*) \] parallel_(upright("cl")) lt.eq
    C_1 L s_i . $
  The nonzero integral vector $\[ G_(*) \]$ has bounded length; it is nonzero already by its positive degree.
    Bounded-denominator lattice vectors projected modulo its line are uniformly discrete,
    because there are finitely many lattice types and finitely many possible bounded pivot vectors.
    As $L s_i arrow.r 0$, we obtain the exact equality
  $ \[ Delta_(upright("col")) \] = q \[ G_(*) \] \, wide \| c_plus.minus^(*) plus.minus q \| lt.tilde L s_i . $
  The denominator of $q$ is bounded. In fact if $\[ G_(*) \] = h g$ with $g$ primitive, bounded length bounds $h$;
    if $Q \[ Delta_(upright("col")) \]$ is integral, then $Q q h in bb(Z)$.
    After also killing the bounded torsion, a bounded positive multiple of $- Delta_(upright("col")) +
    q G_(*)$ is principal geometrically. Lemma 37 descends the witness without an extension-degree multiplier.
    Let $phi.alt$ be a fractional function in $K_i$, with bounded clearing denominator,
    having this divisor on the fiber.
  Replace $u_plus.minus$ by $u_plus.minus plus.minus "Div" \( phi.alt \)$, and $ell_E$ by $ell_E +
    E \( phi.alt \)$. These principal changes preserve (9.8).
    They give $u_plus.minus \( P \) lt.eq mu$ on strict nonpivot primes and $u_plus.minus \( G_(*) \) lt.eq
    C_1 L s_i$. The new signed trace of $upright(bold(U))_plus.minus - mu upright(bold(M))_0$ is
  $ \( c_plus.minus^(*) plus.minus q \) G_(*) + mu B''_0 - W_plus.minus . $
  Its positive and negative parts have degrees $O \( L s_i \)$,
    and the trace degrees of $upright(bold(U))_plus.minus$ are unchanged.
    All these arithmetic traces and parts are rationally Cartier.
    Apply (9.2) to the signed trace and (9.3) to the errors of $upright(bold(U))_plus.minus$ and
    $upright(bold(M))_0$, in the identity
  $ u_plus.minus = mu A_i^(+) + upright(bold(U))_plus.minus - mu upright(bold(M))_0 . $
  Since $A_i^(+) gt.eq 0$, this proves, on every horizontal test,
  $ u_plus.minus gt.eq - C' L a_i . $
  #emph[Pushing the corrected inequalities.] The horizontal lower bound just proved will give klt discrepancies
    after adding a large multiple of $L a_i$. The strict-prime upper bounds give effective horizontal trace.
    An additional multiple of $L s_i A_i^(+)$ supplies the needed allowance at the pivot.
    For sufficiently large fixed positive rational $K' \, T'$, push
  $ u_plus.minus + K' L a_i + T' L s_i A_i^(+) $
  to the next field and use these pushes as the new $u_plus.minus$.
    Their canonical coefficient is $mu_(upright("next")) = mu + \( K' + T' \) L s_i > 0$.
    They have big nef moduli and horizontal generalized klt discrepancies by the preceding lower bound.
    They are effective in horizontal trace as well: on strict nonpivot primes use $u_plus.minus lt.eq
    mu$ and $C_i \, A_i^(+) lt.eq 1$; at the pivot use $u_plus.minus lt.eq C_1 L s_i$, $A_i^(+) = 0$,
    and the extra slack $T' L s_i$. Proposition 28 therefore applies.
    We have $mu_(upright("next")) = o \( 1 \)$ and $mu_(upright("next")) lt.tilde L lambda_(i + 1)$.
  For the sum bound, evaluate both signs on one common lift minimizing $C_i$.
    Use $Lambda_i + s_i A_i^(+) lt.tilde a_i$ and $s_i pi_(\#) C_i lt.tilde Lambda_(i + 1)$.
    For the witness bound, if the projection remains nontrivial, evaluate on the old $j_i P_i$.
    By (9.1) and (8.1), the newly added constants are exactly $\( K' + T' \) L s_i$,
    while the other terms are $O \( L h_E \)$. They are therefore precisely absorbed in $mu_(upright("next"))$.
    If the projection becomes trivial, the expression just pushed has positive value at the old horizontal test,
    so the same upper bound holds with left side zero. An already trivial projection continues to satisfy the
    bound. This proves the induction.
  #emph[Completing the canonical coefficient and obtaining regular sections.] At the stopping stage $L s_i
    gt.tilde 1$, let $d_0$ be a bounded positive integer clearing all accumulated gauges.
    There are only boundedly many stages, and eventually $d_0 mu < 1$.
    The positive coefficient $1 - d_0 mu$ will complete the canonical coefficient to one;
    the same equality will give the one-unit allowance in the final integral regularity test.
    For each sign we claim that some $f_plus.minus in K_i^(*)$ satisfies, at every prime,
  #[#set math.equation(numbering: n => "(9.9)")
   $ P \( f_plus.minus \) + d_0 u_plus.minus \( P \) + \( 1 - d_0 mu \) A_i^(+) \( P \) +
     C_2 L H_i \( P \) > 0 . $ <eq:C6a>]
  If $S_i$ is a point, take $f_plus.minus = 1$. Otherwise the middle terms have the presentation
  $ a_(K_i) + upright(bold(N)) \, wide upright(bold(N)) = d_0 upright(bold(U))_plus.minus + \( 1 - d_0 mu \)
    upright(bold(M))_(0 \, i) \, $
  with b-nef $upright(bold(N))$.
  On a high smooth descent, (8.4) provides a big free integral Cartier divisor $D' lt.eq k H_i$ in actual orders,
    with $k lt.tilde 1 \/ s_i lt.tilde L$. Indeed choose a list $1 \, f_1 \, dots.h \,
    f_t$ with poles bounded by $k H_i$ giving the birational system, resolve its projective map,
    and pull back its first coordinate hyperplane. Freeness makes the order of this divisor $-
    min \( 0 \, P \( f_1 \) \, dots.h \, P \( f_t \) \)$, which is at most $k H_i \( P \)$.
    Resolve the fractional support of $N = upright(bold(N))_(upright("tr"))$ too,
    and use the canonical divisor $K$ of the same chosen form.
    For $j = 1 \, dots.h \, dim S_i + 1$, Kawamata–Viehweg vanishing #cite(label("FujinoFundamental")) Theorem 3.1
    applies to
  $ K + ceil.l N ceil.r + j D' \, $
  with snc klt boundary $ceil.l N ceil.r - N$ and nef big adjoint difference $N + j D'$.
    Riemann–Roch makes its Euler characteristic a polynomial in $j$ of degree $dim
    S_i$ with positive leading coefficient. It cannot vanish at all these integers;
    vanishing identifies its values with section dimensions. Choose a nonzero section at one of them.
    The associated function $f_plus.minus$ makes the left side of (9.9), with $j D'$ in place of $C_2 L H_i$,
    the sum of the positive discrepancy of the snc pair and the order of the section’s effective divisor.
    This proves the claim.
  For a nontrivial $j_i P_i = E \|_(K_i)$, multiply (9.9) by $j_i$ and substitute (9.8),
    $j_i A_i^(+) \( P_i \) lt.eq 1 - h_E$, and $j_i H_i \( P_i \) lt.eq h_E$. The constant allowance is exactly
  $ d_0 mu + \( 1 - d_0 mu \) = 1 . $
  Consequently, for $m in n bb(Z)_(gt.eq 0)$ sufficiently large with $m lt.tilde L$, both signs satisfy
  $ E \( f_plus.minus \) plus.minus d_0 ell_E + m h_E > - 1 . $
  At trivial restrictions this follows directly from (9.8) and $d_0 mu < 1$.
    Multiply $f_plus.minus$ by $z^(plus.minus d_0 beta)$, by the corresponding cleared gauge functions,
    and by $macron(h)^(m \/ n)$. The displayed orders are integers, hence nonnegative.
    These are nonzero eigenfunctions. Any polar divisor of an eigenfunction is torus invariant,
    so the invariant-prime tests and normality make them regular.
    Their weights are $m chi plus.minus d_0 beta$, proving (9.7) along every alleged contrary subsequence and
    therefore uniformly. ◻
]

=== 9.5 Axes, coefficient spaces, and actual probes <axes-coefficient-spaces-and-actual-probes>

We now combine the residual tower and the torus directions into one list of widths.
  We first complete the coefficient count described above and sum it over the torus characters at each fixed
  physical degree. That upper bound uses only arbitrary monoid clearing.
  The bounded clearing just proved supplies the matching actual probes and their independent initials.

Choose a lattice basis $beta_1 \, dots.h \, beta_("rank" T - 1)$ of $M_0$ and positive widths $L_j$ so that

#[#set math.equation(numbering: n => "(9.10)")
 $ parallel sum k_j beta_j parallel asymp sum_j \| k_j \| L_j . $ <b:torus-axis-norm>]

Here is a uniform construction in bounded dimension. Replace the norm by an equivalent Euclidean norm using an
  ellipsoid, then choose successive shortest nonzero vectors in the orthogonal projected lattices.
  Each is primitive, so the next projection is again a lattice.
  Choose size-reduced lifts, subtracting earlier vectors in reverse order until their earlier Gram–Schmidt
  coefficients have absolute value at most $1 \/ 2$. Let $L_j$ be their Gram–Schmidt lengths.
  A size-reduced one-step lift of the next projected shortest vector has component along the preceding shortest
  vector at most half its length. The lift cannot be shorter than that preceding shortest vector, so

$ L_j^2 lt.eq L_(j + 1)^2 + \( L_j \/ 2 \)^2 . $

Thus the next projected length is at least $sqrt(3) \/ 2$ times the preceding shortest length.
  Hence the normalized basis columns in orthonormal Gram–Schmidt coordinates form a triangular matrix with
  diagonal one and bounded entries; its inverse is bounded in fixed dimension. This proves (9.10).

Adjoin $p_i$ residual axes of width $1 \/ s_i$ for each level. Denote all widths by $W_j$. There are

$ d = \( "rank" T - 1 \) + "trdeg"_k K_1 $

axes in total.

#thm([Proposition 9.6.])[
  #emph[For every occurring weight $mu = m chi + beta$ of positive cost $B' = tilde(v) \( mu \)$,
#[#set math.equation(numbering: n => "(9.11)")
 $ dim R_mu lt.tilde product_i \( 1 + B' s_i \)^(p_i) . $ <eq:C7>]

 At each fixed physical degree $m$, the dimension through cost $S' gt.eq 0$, including constants if present, is at most
#[#set math.equation(numbering: n => "(9.12)")
 $ C_3 product_j \( 1 + S' \/ W_j \) . $ <eq:C8>]

 For $m in n bb(Z)_(gt.eq 0)$, the same expression bounds the truncated associated graded dimension of $V_m$.]
] <b:coefficient-dimension>

#proof[
  Write $R_mu = z^mu U$ for a finite-dimensional coefficient space $U subset K_1$;
    positive finite generation ensures finiteness. Choose rational $m' > parallel beta parallel$ with $m' lt.tilde
    B'$, and a nonzero opposite section of weight $d' \( m' chi - beta \)$,
    where $d' > 0$ is an arbitrary clearing factor as at the start of the twist proof.
    Increase $d'$ so that $M = d' \( m + m' \) in n bb(Z)_(> 0)$.
    If $g'$ is its coefficient, every nonzero $g in U$ gives $z^(M chi) g^(d') g' in R$. By (6.3),
  $ D_1 = H_1 + 1 / M "Div"_(S_1) #scale(x: 120%, y: 120%)[\(] g^(d') g' \/ f_h^(M \/ n)
    #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Assume $dim S_1 > 0$. Construct compatible smooth projective high models with morphisms down the tower,
    resolving rational maps successively from the bottom, and include descents for all displayed data.
    Choose compatible general closed points where the morphisms are smooth.
    Lift relative parameters to nested Taylor systems with $p_i$ parameters at level $i$.
    Avoid the supports of the fixed forms, boundary, moduli and $H_1$.
    Make $g' \, f_h$ units and a fixed basis of $U$ regular there.
    Give the parameters at level $i$ rational weights $1 \/ s_i$.
    This monomial test $P_1$ is divisorial up to scale: it is discrete up to scaling,
    and ratios of equal-weight monomials give the required residue transcendence degree.
    Its restriction $P_i$ uses exactly the parameters at levels $ell gt.eq i$.
    At the chosen points the smooth monomial formula gives
  $ a_i \( P_i \) = s_i sum_(ell gt.eq i) p_ell \/ s_ell lt.tilde 1 \, $
  using the bounded tower length and $s_ell gt.tilde s_i$. Proposition 35 therefore implies
  $ P_1 \( g \) lt.eq C M \/ d' lt.eq C' B' $
  for every nonzero $g in U$. Taylor truncation at this weighted bound is injective on $U$;
    the number of allowed monomials is at most $C product_i \( 1 + B' s_i \)^(p_i)$.
    If $dim S_1 = 0$, use $K_1 = k$. This proves (9.11).
  At fixed physical degree, (9.10) bounds each integer coordinate by $\| k_j \| lt.eq C S' \/ L_j$.
    Counting these weights and using (9.11) proves (9.12). Weight zero contributes only constants.
    The angular translation following (6.6) identifies this count with the associated graded truncation of $V_m$.
    There are only finitely many costs below a fixed cutoff, so it is also the dimension modulo higher costs. ◻
]

#thm([Proposition 9.7.])[
  #emph[Each residual level has $p_i$ actual probes in some $V_m$, of degree and cost $O \( 1 \/ s_i \)$,
    whose initials are in $K_i$ and algebraically independent over $K_(i + 1)$.
    Each torus axis has opposite angular probes in $V_(m_j)$ with initial weights $plus.minus d_j
    beta_j$ in the full initial field; their corresponding degree-$m_j$ sections have weights $m_j chi plus.minus
    d_j beta_j$. Here $d_j$ are bounded positive integers, $m_j in n bb(Z)_(gt.eq 0)$,
    and degrees and costs are $O \( 1 + L_j \)$. The residual and positive torus initials together are
    algebraically independent, and their monomials give box lower bounds with widths $max \( 1 \, W_j \)$.]
] <b:actual-probes>

#proof[
  The birational system in (8.4), containing $1$, gives $p_i$ functions algebraically independent over $K_(i + 1)$
    whose poles are bounded by $k H_i$, $k lt.tilde 1 \/ s_i$. For any one of them, (8.5) and pullback orders give
  $ "Div"_(S_1) \( g \) + k H_1 gt.eq 0 . $
  A trivial restriction evaluates both the lower function and lower divisor at zero.
    Increase $k$ to $m in n bb(Z)_(gt.eq 0)$ with $m lt.tilde 1 \/ s_i$.
    Then (6.3) gives $g macron(h)^(m \/ n) in R_(m chi)$. Its angular lift lies in $V_m$ with initial $g$ and cost $m$.
  For a torus axis use (9.7) with $L = C max \( 1 \, L_j \)$, where the fixed uniform constant $C gt.eq
    1$ is chosen using (9.10) so that $parallel beta_j parallel lt.eq L$.
    The resulting opposite sections lift to actual angular functions after dividing their initials by
    $macron(h)^(m_j \/ n)$. Their costs satisfy the asserted bound because $tilde(v) in Q_T$.
  Tower independence first makes the residual initials algebraically independent.
    The positive torus initials then have independent Laurent charges over $K_1$,
    so adjoining them preserves algebraic independence. For $S' gt.eq 1$, take monomial exponents through
  $ ⌊frac(c S', max \( 1 \, W_j \))⌋ $
  at each axis, for sufficiently small fixed $c > 0$. Their degrees sum to at most $S'$;
    nest the products into a common allowed degree, rounding up to a multiple of $n$.
    Their costs are $O \( S' \)$, and their independent initials ensure the same upper cost bound for nonzero
    combinations. This proves the probe and box assertions. ◻
]

== 10 Bounded axes and specialization of effectivity <b:bounded-axes>

The width estimates still allow torus widths to approach zero,
  and their upper counts involve the cost as well as the physical degree.
  This section removes both difficulties in the range needed for the first optimization step.
  Its key obstruction is a degree-zero section of bounded positive cost,
  which would contradict concentration of the entire base maximal ideal.
  To construct such a section from a hypothetical obstruction, we must retain effectivity,
  not only numerical divisor classes.

Pass to a subsequence on which each width is either bounded above or tends to infinity.
  Call the former axes #emph[cheap], and let $J$ be the set of cheap torus indices.
  The cheap residual axes are precisely the $p_f$ axes from $K_f$; there are $r = \| J \| +
  p_f$ cheap axes in total. Put $F = Y_f$; this is $S_f$ up to the small $bb(Q)$-factorialization in the last step
  of the tower. We use $H_f$ for its pullback to $F$ as well.
  Its positive strict coefficients are bounded below by a fixed positive constant,
  including after the final normalization $s_f = 1$. All constants in this section are uniform along the retained
  sequence; the finite covers and open restrictions introduced below may depend on a subsequence.

For each $j in J$, the opposite probes constructed in (9.7) and after (9.12) give

$ macron(h)^(m_j \/ n) y_j^(+) \, med macron(h)^(m_j \/ n) y_j^(-) in R \, wide "wt" \( y_j^plus.minus \) =
  plus.minus d_j beta_j . $

Here $m_j in n bb(Z)_(gt.eq 0)$ and the positive integers $d_j$ are uniformly bounded.
  Their boundedness follows from the upper bounds on the cheap widths.
  The functions $y_j^plus.minus$ are angular functions and have physical degree zero.

Here is the estimate we will prove. For a homogeneous section of $R$, its physical degree is its $D$-degree $m$,
  and its cost $b$ is its $tilde(v)$-value. On an actual angular lift $F_0 in V_m$, the same cost is $b = m +
  v \( F_0 \)$.

#thm([Proposition 10.1.])[
  (The bounded axes estimates).  #emph[All widths $W_j$ are bounded below by a uniform positive constant.
    There are cutoffs $S_0 arrow.r oo$ and a uniform constant $C_4$ such that
#[#set math.equation(numbering: n => "(10.1)")
 $ b = tilde(v) \( upright("weight") \) lt.eq C_4 m wide \( 0 < b lt.eq S_0 \) \,\
dim #scale(x: 120%, y: 120%)[\(] upright("initial spaces at degree ") m upright(" through cost ") S_0
  #scale(x: 120%, y: 120%)[\)] lt.eq C_4 \( 1 + m \)^r \, wide r = \| J \| + p_f . $ <eq:D3>]

 The independent probes after (9.12) give matching box lower bounds, up to uniform factors, for all the widths.
   There are $r$ algebraically independent probes of bounded degree and cost:
   the positive cheap torus probes and the $p_f$ residual probes from $K_f$.]
] <b:bounded-axes-estimates>

The proof is completed at the end of the section. Its main step is to bound the cheap torus charges in terms of
  physical degree, as long as both grow slowly compared with the collapsing scales.
  A failure will produce a regular eigenfunction of physical degree zero and bounded positive cost.
  We first reduce its regularity to a finite problem on the terminal field $K_f$.

#thm([Lemma 10.2.])[
  (Descent of slow pure sections).  #emph[Suppose, along the sequence, that
$ g in K_1^(*) \, wide "div"_(S_1) \( g \) + M H_1 gt.eq 0 \, wide M in bb(Q)_(gt.eq 0) \, wide M s_exp arrow.r 0 . $

 Then, for all sufficiently late members,
$ g in K_f^(*) \, wide "div"_F \( g \) + C M H_f gt.eq 0 $

 for a uniform constant $C$.]
] <b:pure-descent>

#proof[
  Maintain the inequality $"div" \( g \) gt.eq - C M Lambda_i$ on all divisorial valuations of $K_i$.
    It holds initially by effectiveness and pullback of the given rational Cartier divisor.
    At a collapsing level, the pivot on the proper normal arithmetic generic fibre has $Lambda_i$-value $s_i$.
    Every other strict prime of that fibre comes from a strict prime on $S_i$ with $H_i$-coefficient zero.
    The effective trace boundary of $Q_i$, when present, gives $Lambda_i lt.eq lambda_i$ there.
    Since $lambda_i lt.tilde s_i$ and $M s_i arrow.r 0$, every possible pole order of $g$ on this fibre is an
    integer bounded in absolute value by a quantity tending to zero. Thus $g$ has no poles on the fibre.
    Properness, normality and the contraction property imply $g in K_(i + 1)$.
  For a divisorial valuation downstairs, choose a lift attaining the minimum for $C_i$ in (7.1).
    Use $Lambda_i lt.tilde lambda_(i + 1) C_i$ and $lambda_(i + 1) pi_(\#) C_i = Lambda_(i + 1)$.
    Dividing by the restriction multiplicity gives the same maintained inequality at level $i + 1$.
    There are at most dimension-many steps, so the resulting constant is uniform.
    At the last level $lambda_f = O \( s_exp \)$, with the usual zero convention when the tower has no collapsing
    step. Off $"Supp" H_f$, the same integral-order argument excludes poles.
    On $"Supp" H_f$, the strict coefficient gap and the effective trace of $Q_f$ give $Lambda_f lt.tilde H_f$.
    This proves the claimed divisor inequality. ◻
]

Applying (6.3) and Lemma 42 to the products of opposite probes gives

$ g_j := y_j^(+) y_j^(-) in K_f^(*) \, wide "div"_F \( g_j \) + C H_f gt.eq 0 . $

Let $Sigma$ be the union of $"Supp" H_f$ and the supports of the zero divisors of the $g_j$.
  The degrees of its components, and the degrees of the zero and pole divisors of every $g_j$, are bounded.
  Indeed the last displayed inequality bounds the pole degrees;
  principality bounds the zero degrees by the same quantity.
  The degree of $H_f$ is bounded by its moduli reserve and the effective Calabi–Yau trace, as in (9.4);
  its strict coefficient gap bounds the degree of its support. Divisor data are omitted when $dim F = 0$.

For an invariant prime divisor $E$ of $"Spec" R$, write $E \|_(K_f) = c P$,
  with $P$ normalized when the restriction is nontrivial, and put $ell_j = E \( y_j^(+) \)$.
  At the trivial restriction put $c = 0$ and interpret all restricted orders as zero.
  The last step of the tower and regularity of the two probes give

#[#set math.equation(numbering: n => "(10.2)")
 $ c C_f \( P \) lt.eq 1 - h_E \/ 2 quad \( c > 0 \) \, wide - m_j h_E lt.eq ell_j lt.eq c P \( g_j \) +
   m_j h_E . $ <b:finite-row-bounds>]

Consequently the rows $\( c \, h_E \, \( ell_j \)_(j in J) \)$ belong to a fixed finite set.
  To see this, $c$ is integral and bounded because $C_f \( P \)$ has a uniform positive lower bound;
  also $h_E in 1 / n bb(Z) ∩ \[ 0 \, 1 \]$ by (6.4)–(6.5). Applying (9.2) to the zero and pole divisors bounds
  $c \| P \( g_j \) \|$, using (10.2); finally each $ell_j$ is integral.
  If $h_E = 0$, and either $c = 0$ or the centre of $P$ is not contained in $Sigma$, then all $ell_j = 0$.

=== 10.1 A finite marked regularity problem <a-finite-marked-regularity-problem>

Consider an occurring weight supported on the cheap torus axes,

$ m chi + sum_(j in J) alpha_j beta_j \, wide (m + sum_(j in J) \| alpha_j \|) s_exp arrow.r 0 . $

Raise a nonzero section of this weight to a bounded positive common power clearing $n$ and the $d_j$. It becomes

$ macron(h)^(m' \/ n) product_(j in J) \( y_j^(+) \)^(a_j) g \, wide n divides m' \, quad a_j in bb(Z) \, quad
  g in K_1^(*) . $

Here $m'$ is that common multiple of $m$, and $a_j$ is the same multiple of $alpha_j \/ d_j$.
  Multiplying this expression by the opposite regular probe to the power $a_j$ when $a_j > 0$,
  and by the positive regular probe to the power $- a_j$ when $a_j < 0$, produces a pure section.
  Its degree is $m' + sum \| a_j \| m_j$ and its angular coefficient is $g product_(a_j > 0) g_j^(a_j)$.
  Equation (6.3) and Lemma 42 imply that $g in K_f$ and that its poles on $F$ lie in $Sigma$.
  Regularity of the original eigenfunction is exactly the family of inequalities

#[#set math.equation(numbering: n => "(10.3)")
 $ c P \( g \) + m' h_E + a dot.op ell gt.eq 0 . $ <eq:D1>]

These tests suffice because a pole divisor of a rational eigenfunction is invariant, and $R$ is normal.

We shall exclude an obstruction sequence with $sum \| a_j \| \/ m' arrow.r oo$, counting $m' = 0$,
  $a eq.not 0$ as infinite. Suppose such a sequence exists and first assume $dim F > 0$.
  Our aim is a single rational polyhedral test for the possible degrees and charges.
  The finitely many row types do not yet give such a test: the projected prime valuations $P$ and the existence of
  an effective representative for the required pole divisor still depend on the member.
  We next place the relevant primes on bounded marked models.

#thm([Lemma 10.3.])[
  (A bounded guard model).  #emph[After passing to a subsequence,
    there are bounded projective $bb(Q)$-factorial varieties of Fano type $F' arrow.r
    F$ and labelled prime divisors on $F'$, of bounded number and degree, with the following properties.
    Every nontrivial projection in (10.3) for which $h_E > 0$, or whose centre is contained in $Sigma$,
    is one of the marked prime valuations. Every component of $Sigma$ has marked strict transform,
    and every exceptional prime of $F' arrow.r F$ is marked. The pullback of $H_f$ has bounded degree on $F'$.]
] <b:guard-model>

#proof[
  The effective Calabi–Yau datum $C_f$ has a uniform positive discrepancy bound,
    a boundary dominating a fixed positive multiple of $H_f$,
    and a big nef b-part with a fixed positive $upright(bold(H))_f$-reserve. Choose a fixed rational $C_0$ such that
  $ upright(bold(T))_j = "div" \( g_j \) + C_0 upright(bold(H))_f $
  is the b-Cartier closure of an effective divisor on $F$. For sufficiently small fixed rational $epsilon > 0$,
    define guard data by
  $ C^(upright(g)) = C_f - epsilon sum_(j in J) upright(bold(T))_j . $
  Subtract the same terms from the moduli presentation. Equation (9.2) bounds $upright(bold(T))_j \( P \)$ by a
    uniform multiple of $C_f \( P \)$, so this retains a uniform positive discrepancy bound.
    Principal terms do not affect nefness, and the reserve absorbs $epsilon C_0 \| J \| upright(bold(H))_f$.
    Thus the new moduli remain big and nef, with a positive $upright(bold(H))_f$-reserve,
    and the trace boundary remains effective.
  There is a fixed $e_0 > 0$ such that all the prime valuations specified in the statement satisfy
    $C^(upright(g)) \( P \) lt.eq 1 - e_0$. For a projection with $h_E > 0$, this follows from (10.2),
    since $h_E gt.eq 1 \/ n$ and $c gt.eq 1$. If $h_E = 0$, Equation (8.1) gives $P \( H_f \) = 0$.
    A centre contained in $Sigma$ therefore lies generically outside $"Supp"
    H_f$ and inside a zero divisor of some $g_j$; its integral order $P \( g_j \)$ is at least one.
    Since $C_f \( P \) lt.eq 1$, subtracting $epsilon upright(bold(T))_j$ gives the required gap.
    A strict prime of $F$ in $"Supp" H_f$ has a boundary coefficient bounded below by domination and the strict
    coefficient gap. A remaining strict prime of $Sigma$ has the same positive zero order just used.
    This also proves the assertion for all components of $Sigma$.
  Apply Lemmas 24 and 25. The monomial calculation in the proof of Lemma 29 gives only finitely many exceptional
    prime valuations with $C^(upright(g)) \( P \) lt.eq 1 - e_0 < 1$, including equality at the upper endpoint:
    their positive integral normal weights satisfy a weighted-sum bound below one,
    and each coefficient in that sum is positive. Ordinary approximation with a tiny ample reserve does not
    increase their discrepancies. The extraction construction gives a projective $bb(Q)$-factorial model $F'
    arrow.r F$ extracting exactly these primes. The guard trace is effective on $F'$,
    retains its uniform positive log discrepancy bound, and has big nef moduli.
    Ordinary approximation therefore gives an effective big boundary with rationally trivial adjoint and a uniform
    positive discrepancy bound. By #cite(label("BirkarBAB")) Corollary 1.4, the varieties $F'$ are bounded;
    they are also of Fano type by the ample-reserve version of the construction.
  Mark every strict prime of $F'$ whose guard discrepancy is at most $1 - e_0$.
    Each has guard boundary coefficient at least $e_0$. The trace degree of the nef b-part is nonnegative by the
    perturbation argument in (9.3). Thus the degree of the effective guard boundary is at most the degree of $-
    K_(F')$, which is uniformly bounded for the bounded very ample polarizations by the cone-theorem calculation
    preceding (9.2). This bounds both the number and the degrees of the marks.
    The surviving $upright(bold(H))_f$-reserve gives the asserted bound on the degree of the pullback of $H_f$ in
    the same way. ◻
]

Label the marks along a subsequence, preserving which are exceptional and which are strict over components of
  $Sigma$. Stabilize the finite sets of rows in (10.3) projecting to each mark and the rows with trivial
  projection. Introduce a rational signed pole allowance $r_P$ at each mark:
  a function $g$ is allowed when $P \( g \) gt.eq - r_P$, so a negative allowance requires a zero.
  Consider the conditions

#[#set math.equation(numbering: n => "(10.4)")
 $ m' gt.eq 0 \, wide c r_P lt.eq m' h_E + a dot.op ell quad upright("for every row projecting to a mark ") P \,\
0 lt.eq m' h_E + a dot.op ell quad upright("for every row with ") c = 0 \,\
r_P lt.eq 0 quad upright("at marks strict over primes of ") F upright(" outside ") Sigma \,\
sum_(P med upright("marked")) r_P \[ P \] in overline("Eff") \( F' \) . $ <eq:D2>]

An actual candidate satisfies these conditions with $r_P = - P \( g \)$: $"div"_(F') g + sum r_P P$ is effective.
  Conversely, suppose a rational solution has $sum r_P P$ rational-linearly equivalent to an effective divisor.
  Choose a positive integer $q$ and a function $f in K_f^(*)$ with

$ "div"_(F') f + q sum r_P P gt.eq 0 \, wide q m' in n bb(Z) \, wide q a in bb(Z)^J . $

The integer $q$ clears the divisor coefficients and the degree and charge denominators.
  For a marked row, effectivity and (10.4) give

$ c P \( f \) + q \( m' h_E + a dot.op ell \) gt.eq q #scale(x: 120%, y: 120%)[\(] m' h_E + a dot.op ell -
  c r_P #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $

The rows with trivial projection also remain valid after multiplication by $q$.
  The poles of $f$ downstairs on $F$ are confined to $Sigma$:
  the sign condition excludes other strict marked primes, and effectivity excludes all unmarked strict primes.
  Any remaining nontrivial projection has $h_E = 0$, $ell = 0$, and centre not contained in $Sigma$, by Lemma 43.
  The function is regular at the generic point of that centre, so its order is nonnegative.
  Thus all tests (10.3) hold, and $macron(h)^(q m' \/ n) product_j \( y_j^(+) \)^(q a_j)
  f$ is an actual regular eigenfunction.

=== 10.2 A marked family with a Fano type generic fibre <a-marked-family-with-a-fano-type-generic-fibre>

We now construct a common cone test for (10.4). We need two implications.
  Every actual candidate must satisfy the cone inequalities of one geometric generic marked fibre,
  even when its coefficients $r_P$ are unbounded. Conversely,
  one fixed rational solution of those inequalities must give an effective representative,
  and hence an actual eigenfunction, on all sufficiently late retained members.
  The first implication will use sweeping curves; the second will spread a line bundle with a nonzero section.

Both arguments require the geometric generic marked fibre to be $bb(Q)$-factorial and of Fano type.
  We establish these properties by retaining an ordinary klt Calabi–Yau boundary with a fixed denominator that
  dominates a big marked divisor. The member-dependent generalized guard data do not yet give this finite set of
  transferable divisor coefficients and adjoint relations. The next lemma constructs it.

#thm([Lemma 10.4.])[
  (A bounded auxiliary Calabi–Yau boundary).  #emph[The models of Lemma 43 admit effective integral divisors $P'$
    of bounded degree, supported on the marks, such that $\| P' \|$ is birational.
    They also admit klt boundaries $Theta^(+)$, with bounded degrees and coefficients in a fixed finite rational
    set, satisfying
$ Theta^(+) gt.eq e' P' \, wide N \( K_(F') + Theta^(+) \) tilde.op 0 $

 for a fixed positive rational $e'$ and a bounded positive integer $N$.
   The marks, $P'$, and $Theta^(+)$ together form a bounded family of labelled divisor data.]
] <b:bounded-guard-boundary>

#proof[
  Use the bounded $k$ at the final level in (8.4) and set $P' = floor.l k H_f floor.r$ on $F'$,
    using total pullback before rounding. This is effective integral of bounded degree.
    Its support lies in the marks, since the strict support of $H_f$ and all exceptional primes of $F' arrow.r
    F$ are marked. The functions in (8.4) still belong to its complete system:
    their integral orders and positivity of pullback allow the indicated rounding.
    Thus this system remains birational, and $P'$ is big.
  Choose a small fixed rational $e' > 0$ so that
  $ Delta_0 = e' sum_(P med upright("marked")) P + e' P' $
  is at most the guard boundary. Such a uniform choice is possible because the mark coefficients have a fixed
    lower bound and the coefficients of $P'$ are bounded by its degree.
    By ordinary approximation of the big nef b-part, obtain an effective uniformly positive-lc boundary $Theta$ with
  $ K_(F') + Theta tilde.op_(bb(Q)) 0 \, wide Theta gt.eq Delta_0 \, wide Theta - Delta_0 med upright("big") . $
  Here the added effective representative of the big b-part has big trace:
    sections on a descent remain sections after pushforward. It supplies the last bigness assertion.
  Set $D' = - \( K_(F') + Delta_0 \)$, which is big. Since $F'$ is a $bb(Q)$-factorial variety of Fano type,
    it is a Mori dream space by #cite(label("BCHM")) Corollary 1.3.1.
    Run a $D'$-MMP to a $bb(Q)$-factorial model $Y$ with nef and big transform $D_Y$.
    The program extracts no divisors. The rationally trivial log adjoint $K +
    Theta$ is crepant through the program, so $\( Y \, Theta_Y \)$, and hence $\( Y \, \( Delta_0 \)_Y \)$,
    retain the uniform positive discrepancy bound. Moreover $D_Y = - \( K_Y + \( Delta_0 \)_Y \)$ is nef and big.
    Thus $Y$ is bounded by #cite(label("BirkarBAB")) Theorem 1.1. It is of Fano type:
    writing $D_Y tilde.op_(bb(Q)) A + E$ with $A$ ample and $E gt.eq 0$,
    a sufficiently small positive multiple of $E$ can be added to $\( Delta_0 \)_Y$ while keeping klt,
    and the resulting negative log adjoint is ample.
  The coefficients of $\( Delta_0 \)_Y$ have a fixed common denominator.
    Lemma 36, applied to the bounded $bb(Q)$-factorial varieties $Y$,
    gives a bounded integer $q > 0$ with $q D_Y$ Cartier. Apply #cite(label("FujinoBPF")) Theorem 1.1 and
    Remark 1.2 to the klt pair $\( Y \, \( Delta_0 \)_Y \)$, with $L = q D_Y$ and $a = 1$. The divisor
  $ L - \( K_Y + \( Delta_0 \)_Y \) = \( q + 1 \) D_Y $
  is nef and big; for a klt pair there are no additional lc-centre conditions in log bigness.
    The theorem gives a bounded integer $N > 1$ with $N D_Y$ Cartier and free.
    Increase the free multiple if necessary. For a general member $G_Y = "div"_Y psi + N D_Y$,
    Bertini on a log resolution shows that $\( Y \, \( Delta_0 \)_Y + G_Y \/ N \)$ is klt.
  Use the same rational canonical form on all models and define
  $ Theta^(+) = - K_(F') + 1 / N "div"_(F') psi . $
  On a common resolution with maps $p$ to $F'$ and $q_Y$ to $Y$, the MMP negativity comparison reads $p^(*) D' =
    q_Y^(*) D_Y + E'$, with $E' gt.eq 0$ exceptional over $Y$. Consequently
  $ p^(*) \( Theta^(+) - Delta_0 \) = q_Y^(*) \( G_Y \/ N \) + E' gt.eq 0 . $
  Thus $Theta^(+) gt.eq Delta_0$. Its log adjoint is crepant to that of the klt pair just constructed on $Y$,
    so it too is klt. Moreover $N \( K_(F') + Theta^(+) \) = "div"_(F') psi$.
    Its coefficients belong to $1 / N bb(Z) ∩ \[ 0 \, 1 \)$, and its degree is the bounded degree of $- K_(F')$.
    In bounded projective embeddings, the supports are parametrized by finitely many fixed-dimension,
    fixed-degree Chow spaces #cite(label("KollarChow2017")) Definition 3.21.
    Their universal cycles may be taken over normal strata. The finite coefficient set bounds the possible
    multiplicities, and the degree bound bounds the number of prime components.
    Taking finite products and labelling their components therefore bounds these data together with the marks and
    $P'$. ◻
]

Parametrize the labelled data of Lemma 44 in finite-type projective families over $bb(C)$,
  and pass to a subsequence with fixed coefficient types and fixed $N$.
  Choose a minimal closed parameter subset containing infinitely many selected indices,
  then an irreducible component $T$ containing infinitely many of them.
  Every proper closed subset of $T$ contains only finitely many selected indices:
  otherwise it would contradict minimality. Hence every dense open restriction retains all but finitely many of
  those indices. Repetitions of a parameter value cause no difficulty;
  in that case a minimal subset may be a point. Denote the resulting marked family by $X^0 arrow.r T$,
  with fibres $X_t^0$, marked primes, integral divisor $P'_t$, and boundary $Theta_t^(+)$.

This retention property survives the finite field extensions used below.
  After normalization and restriction to a dense open, a finite extension of $bb(C) \( T \)$ gives an irreducible
  finite surjective cover $T' arrow.r T$. Every proper closed subset of $T'$ has proper closed image,
  since finite maps preserve dimension and both bases have the same dimension.
  Therefore later dense open restrictions of $T'$ exclude lifts only over a proper closed subset of $T$.
  Choose lifts of the remaining selected points. The same reasoning applies after any finite composite of these
  extensions.

#thm([Lemma 10.5.])[
  (The geometric generic marked model).  #emph[After the finite covers and dense open restrictions just described,
    the geometric generic marked fibre $X_(macron(eta))^0$ is $bb(Q)$-factorial and of Fano type.
    Its marked divisor $P'_(macron(eta))$ is big, and its marked boundary $Theta_(macron(eta))^(+)$ is klt with
    $N \( K + Theta_(macron(eta))^(+) \) tilde.op 0$.]
] <b:generic-marked-fano>

#proof[
  We first transport the integral divisor-class relations to the generic fibre.
    We then transport the crepant snc calculation for $Theta^(+)$ and the section map of a Cartier multiple of
    $P'$; these establish klt singularities and bigness, respectively.
  Spread a projective smooth resolution of the geometric generic fibre, after a finite extension,
    and restrict the base so that it resolves every fibre under consideration.
    Track all exceptional prime divisors and all strict transforms of the finitely many marked primes.
    This uses the resolution and constructibility argument in Lemma 36:
    keep a birational isomorphism on dense opens, spread the complementary components,
    and fix their fibre and image dimensions. Shrink also so that the downstairs fibres are geometrically normal
    and integral and the prime marking families have integral geometric fibres.
    Write this simultaneous resolution as $b_t : W_t arrow.r X_t^0$.
  On every selected fibre, vanishing for a log Fano boundary #cite(label("FujinoFundamental")) Theorem 3.2 and
    rationality of klt singularities #cite(label("FujinoRational")) Theorem 0.1 give $H^1 \( cal(O) \) =
    H^2 \( cal(O) \) = 0$ both downstairs and upstairs. Semicontinuity and density of the selected points give
    these vanishings throughout an open base. On its complex fibres,
    the exponential sequence and GAGA #cite(label("SerreGAGA")) Section 12, Theorems 1–3; Section 20,
    Proposition 18 identify $"Pic"$ with integral $H^2$. On a connected dense stratum,
    topological constructibility gives locally constant integral group data
  $ H^2 \( X_t^0 \, bb(Z) \) med arrow.r^(med b_t^(*) med) med H^2 \( W_t \, bb(Z) \) med arrow.r med
    H^2 \( W_t \, bb(Z) \) \/ chevron.l \[ upright("exceptional primes") \] chevron.r . $
  The last group is $"Cl" \( X_t^0 \)$, and the image of the first group is $"Pic" \( X_t^0 \)$.
    The exceptional and marked upstairs divisor classes, and the class of the relative canonical bundle of the
    smooth resolution, are locally constant as well. These are integral diagrams, so their cokernels,
    including torsion, are controlled; trivial monodromy is not required.
  On the selected fibres, the image of $"Pic"$ has finite index in $"Cl"$, and $N \[ K + Theta^(+) \] =
    0$ in $"Cl"$. The same assertions therefore hold on this entire complex stratum.
    Here the canonical class downstairs is the pushforward of the canonical class upstairs.
    They hold also on the geometric generic fibre. For completeness, descend the finite family, markings,
    resolution and open conditions to a countable algebraically closed subfield of $bb(C)$,
    and choose a complex point generic over that subfield. The geometric generic model is identified,
    up to an isomorphism of algebraically closed fields preserving these finite data, with this complex fibre:
    the two algebraically closed extension fields have the same infinite transcendence degree over the embedded
    defining function field. Thus the integral class conclusions apply there.
    Finite index of $"Pic"$ in $"Cl"$ gives $bb(Q)$-factoriality,
    and the second conclusion gives the asserted principal multiple of the log adjoint.
  It remains to verify singularities and bigness; neither follows from the integral class diagram alone.
    Take a log resolution of the geometric generic marked pair,
    and a relative rational volume form and a rational function witnessing $N \( K + Theta^(+) \) tilde.op 0$.
    Spread all these data after a further finite extension. On the smooth resolving family,
    retain the divisor identities for the form and the witnessing function,
    the strict transforms and exceptional components, and the snc pullback computation.
    The coefficients and orders in these finite divisor formulas remain unchanged on every fibre after shrinking.
    This can be arranged by spreading each prime component of the formulas and retaining its geometric integrality
    and its image dimension; restricting the formulas on the smooth models then preserves the divisor orders.
    Pushing down preserves the marked principal relation. The snc crepant boundary coefficients are now constant,
    and one selected fibre is klt. They are therefore all less than one on the geometric generic resolution,
    proving that $Theta_(macron(eta))^(+)$ is klt.
  Choose a positive Cartier multiple $t P'_(macron(eta))$, and spread its line bundle with a rational section
    whose divisor is exactly this marked divisor. Retain the divisor identity by the same resolution argument.
    After further shrinking, formation of its space of sections commutes with base change.
    The dimension of the image of the associated rational map is generically constant, by constructibility.
    On each selected fibre, the system $\| t P'_t \|$ contains products from the birational system $\| P'_t \|$,
    so its image has dimension $dim F'$. The generic system has that same dimension. Hence $P'_(macron(eta))$ is big.
  Finally $Theta_(macron(eta))^(+) gt.eq e' P'_(macron(eta))$ is big.
    To see Fano type explicitly, write $Theta_(macron(eta))^(+) tilde.op_(bb(Q)) A +
    E$ with $A$ ample and $E gt.eq 0$. For sufficiently small rational $t > 0$,
    the effective boundary $\( 1 - t \) Theta_(macron(eta))^(+) + t E$ is klt,
    and its negative log adjoint is rationally equivalent to $t A$. This is a log Fano boundary. ◻
]

=== 10.3 Facet curves and one effective witness <facet-curves-and-one-effective-witness>

The geometric generic marked fibre now has the Fano type and rational factoriality needed for its effective cone.
  We use this one cone in two ways: finitely many sweeping curve families test every candidate on a retained
  fibre, and one fixed rational solution supplies an effective section that spreads to those fibres.
  These two implications suffice for the degree-zero obstruction.

#thm([Lemma 10.6.])[
  (Specializing a finite cone test).  #emph[In (10.4), replace the last condition by
$ sum_(P med upright("marked")) r_P \[ P_(macron(eta)) \] in overline("Eff") \( X_(macron(eta))^0 \) . $

 This is a finite rational polyhedral test. After the allowed covers and open restrictions,
   every actual candidate satisfies this test. Conversely, each fixed rational solution has,
   after one clearing multiple fixed for that solution, regular eigenfunction realizations on all retained
   sufficiently late members of the sequence.]
] <b:marked-cone-test>

#proof[
  By Lemma 45 and #cite(label("BCHM")) Corollary 1.3.1, $X_(macron(eta))^0$ is a Mori dream space.
    Its pseudo-effective cone in numerical divisor space is rational polyhedral.
    We first show that each facet is tested by a family of curves sweeping a dense open of $X_(macron(eta))^0$.
  Choose a rational divisor class $D$ in the relative interior of that facet. The class is pseudo-effective.
    Its divisor MMP ends in a minimal model $Y_D$ on which the transform $D_Y$ is nef and semiample.
    As $D$ lies on the boundary of the pseudo-effective cone, $D_Y$ is not big.
    A sufficiently divisible multiple defines a contraction $phi : Y_D arrow.r
    Z_D$ with positive-dimensional general fibres. The birational program has no extraction.
    There is consequently an open $U subset Y_D$, with complement of codimension at least two,
    isomorphic to an open of $X_(macron(eta))^0$. On a common resolution the comparison has the form
  $ p^(*) D = q^(*) D_Y + E_D \, wide E_D gt.eq 0 \, $
  where the correction is exceptional over $Y_D$. Enlarge the excluded codimension-two subset to contain its image
    and all inverse-map indeterminacy. Curves in $U$ then lift to the original variety and avoid this correction,
    including the correction from any contracted fixed divisorial part of $D$.
  A general fibre of $phi$ is geometrically integral. Each component of $Y_D \\ U$ either does not dominate $Z_D$,
    and hence misses a general fibre, or has codimension at least two in that fibre.
    If the relative dimension is one, the latter case is impossible:
    a bad component has dimension at most $dim Y_D - 2 < dim Z_D$.
    Thus the entire general curve fibre lies in $U$. In larger relative dimension $t$,
    intersect a general fibre with $t - 1$ sufficiently general very ample hyperplanes.
    Bertini gives an integral curve, and the codimension estimate makes it miss the bad locus entirely.
  These curves vary in a projective flat family over an integral parameter space after restriction to a dense open
    of the fibre-and-hyperplane parameter space. Its evaluation map dominates $Y_D$.
    Indeed the incidence obtained by choosing a point and hyperplanes through it is irreducible and dominates
    $Y_D$; restriction to the dense open of flat integral curves avoiding the bad locus preserves dominance.
    The lifted curves therefore sweep a dense open of $X_(macron(eta))^0$.
    Their intersections with divisor classes are constant in this family.
    The corresponding linear functional is nonnegative on every effective class,
    because a member can be chosen not contained in the divisor’s support; it is positive on an ample class.
    Its value on $D$ is zero by the pullback comparison and contraction.
    A nonzero supporting functional vanishing at a relative interior point of a facet defines exactly that facet
    inequality. This constructs the required test for each facet.
  There are finitely many facets. Spread the finitely many curve families,
    their parameter spaces and evaluation maps after a finite extension of the base function field.
    Spread also fixed Cartier multiples of all marked divisors.
    After shrinking, the curves remain projective and flat with integral geometric fibres,
    their intersection vectors with these markings remain fixed,
    and their evaluation maps dominate dense opens of every selected fibre.
    To justify the last assertion, the generic evaluation image contains a dense open.
    Its image is constructible, so after spreading and shrinking one retains an open in that image whose
    intersection with each fibre is dense; fibre-dimension constructibility excludes the exceptional parameter
    values. Equivalently one can track the evaluation incidence and its generic dominance before the shrink.
  Let $sum r_P P$ be the class furnished by an actual candidate on any retained fibre.
    It has an effective rational Cartier representative. For each of our curve families,
    density provides a member not contained in that representative’s support.
    Its intersection with the effective representative is nonnegative,
    and is the fixed linear combination of the marked intersection vector with coefficients $r_P$.
    Thus every generic facet inequality holds. This argument makes no boundedness assumption on the coefficient
    vector of the candidate.
  For the converse, fix one rational solution of the generic test.
    On the generic Mori dream space, a rational class in the effective cone has an effective rational
    representative. Numerical and rational linear classes agree for rational Cartier divisors here by Lemma 36.
    Hence for some positive integer $q$ there is a rational function $f$ with
  $ "div" \( f \) + q sum r_P P_(macron(eta)) gt.eq 0 . $
  Replace $\( q \, f \)$ by $\( k q \, f^k \)$ for a sufficiently divisible positive integer $k$,
    and retain the notation $\( q \, f \)$. This preserves the effective divisor inequality while making the
    marked divisor Cartier and all degree and charge exponents integral, with the degree divisible by $n$.
    Spread the line bundle $cal(O) \( q sum r_P P_(macron(eta)) \)$, its rational trivialization,
    and the nonzero regular section represented by $f$, after a further finite extension.
    The divisor identity can also be retained on the simultaneous resolution.
    On a dense open of the parameter, the section is regular and not identically zero on any fibre.
    Thus its rational-function representatives have exactly the permitted pole bound on each selected fibre;
    possible additional zeros are harmless. Regularity as a section of this specified line bundle excludes
    unmarked poles.
  The minimal-closure retention property ensures that these open restrictions keep infinitely many selected
    indices, and eventually all retained ones. Transfer the witness through the marked identifications with the
    corresponding $F'$. The converse argument following (10.4), including its automatic unmarked tests,
    gives the asserted regular eigenfunctions. Only this one rational solution,
    its clearing multiple and its effective section were spread.
    No simultaneous family of the algebras $R$ is needed, and no equality between the effective cones of different
    fibres is asserted. ◻
]

#thm([Proposition 10.7.])[
  (The slow-charge bound).  #emph[For sequences of actual candidates above satisfying $\( m' + sum \| a_j \| \)
    s_exp arrow.r 0$, the ratio $sum \| a_j \| \/ m'$ cannot tend to infinity,
    with the convention already specified at degree zero.]
] <b:slow-charge-bound>

#proof[
  Suppose first that $dim F > 0$. Use the stabilized rows of (10.4) and the generic cone test of Lemma 46.
    They define a rational polyhedral cone in the variables $\( m' \, a \, \( r_P \) \)$.
    Its projection $cal(P)$ to $\( m' \, a \)$ is again a rational polyhedral cone and is therefore closed.
    For example, express the original cone by finitely many rational generators and project those generators.
    This proof of closedness imposes no boundedness condition on the auxiliary coefficients $r_P$.
  Actual candidates lie in $cal(P)$. Divide an alleged obstruction sequence by $sum \| a_j \|$.
    After a subsequence, their charge coordinates converge to $a_oo$ of $ell^1$-norm one,
    whereas their degree coordinates tend to zero. Closedness gives $\( 0 \, a_oo \) in cal(P)$.
    The rational face $cal(P) ∩ { m' = 0 }$ therefore contains a rational point with nonzero charge:
    one can use its rational generators, or density of rational points in its relative interior.
    A nonempty fibre of a rational linear inequality system over a rational point has a rational point,
    so choose rational auxiliary coordinates giving a fixed rational solution of (10.4) with $m' = 0$ and $a eq.not 0$.
  By Lemma 46, one fixed clearing multiple and one spread effective witness produce actual nonzero regular
    eigenfunctions on all sufficiently late retained rings $R$,
    of degree zero and fixed nonzero charge coordinates. If $dim F = 0$, the same conclusion follows directly:
    pure descent makes $g$ constant, all restrictions to $K_f$ are trivial,
    and the stabilized trivial-projection inequalities in (10.4) themselves give the rational polyhedral cone.
    There are no markings or effectivity variables in this case.
  The resulting eigenfunctions have positive $tilde(v)$-cost,
    since a nonzero charge is nonconstant and the grading is positive. These costs are uniformly bounded:
    only cheap axes occur, their widths are bounded above, the charge coordinates and the $d_j$ are fixed or
    bounded, and $tilde(v) in Q_T$. Each eigenfunction lifts, in physical degree zero,
    to a function of $cal(A)_0 = k \[ Z \]$ with the same positive value.
    The lift therefore belongs to $frak(m)_z$. Its bounded value contradicts (6.1),
    which asserts $tilde(v) \( frak(m)_z \) arrow.r oo$ uniformly over all nonzero functions in this ideal.
    This rules out the obstruction sequence. ◻
]

=== 10.4 The cost gap and the section count <the-cost-gap-and-the-section-count>

#proof[
  The residual widths $1 \/ s_i$ are already at least one. If some torus width $L_j$ tended to zero on a
    subsequence, choose integers $k arrow.r oo$ sufficiently slowly that $k L_j$ remains bounded and $k s_exp
    arrow.r 0$. Apply (9.7) to $k beta_j$, using a fixed scalar norm bound at least one.
    It gives actual opposite weights of bounded physical degree and charges $plus.minus d_0 k beta_j$,
    with $d_0$ positive and bounded. These weights are supported on a cheap axis, satisfy the slow condition,
    and have unbounded charge-to-degree ratio. Raising to the earlier bounded common clearing power does not
    change that conclusion. This contradicts Proposition 47. A further-subsequence argument therefore gives a
    uniform positive lower bound for every $L_j$.
  Choose $S_0 arrow.r oo$ so slowly that
  $ S_0 s_exp arrow.r 0 \, wide S_0 \/ W_j arrow.r 0 quad upright("for each width tending to infinity") . $
  For a weight $m chi + sum alpha_j beta_j$ of positive cost at most $S_0$, the weight comparisons preceding (9.11) give
  $ m lt.tilde S_0 \, wide sum_j \| alpha_j \| L_j lt.tilde S_0 . $
  An expensive torus coordinate must vanish, since it is integral and its width eventually exceeds every fixed
    multiple of $S_0$. The lower width bound then gives $m + sum \| alpha_j \| lt.tilde S_0$,
    so these weights satisfy the slow condition. Proposition 47 now implies a uniform $sum \| alpha_j \| lt.tilde
    m$ for all such weights: failure would give an obstruction sequence on late members.
    The bounded clearing factors and the bounded positive $d_j$ preserve this equivalence.
  Since the remaining widths are bounded above,
  $ b = m + tilde(v) #scale(x: 180%, y: 180%)[\(] sum_(j in J) alpha_j beta_j #scale(x: 180%, y: 180%)[\)] lt.eq
    m + parallel sum_(j in J) alpha_j beta_j #scale(x: 180%, y: 180%)[parallel] lt.tilde m . $
  Thus every initial at fixed degree $m$ through $S_0$ already occurs through $min { S_0 \, C_4 m }$.
    Apply (9.12) with this cutoff. The factors for expensive widths are uniformly bounded,
    while each cheap factor is at most a fixed multiple of $1 + m$.
    There are exactly $\| J \| + p_f = r$ cheap axes. This proves both estimates in (10.1),
    including the constant initial at degree zero.
  Finally the probe construction after (9.12) had box denominators $max { 1 \, W_j }$.
    The positive lower width bound makes these uniformly comparable to $W_j$.
    Hence those lower bounds now match all widths. The residual probes have independent initials along the field
    tower, and the positive torus probes add independent Laurent charges over $K_1$.
    Their combined initials are algebraically independent. The stated $r$ probes at the cheap axes have bounded
    degree and cost. ◻
]

Through the angular identification of Section 6.4, (10.1) controls the actual systems $V_m$.
  At each degree $m in n bb(Z)_(gt.eq 0)$, no function has cost in $C_4 m < b \( F \) lt.eq S_0$,
  and the quotient of $V_m$ by its subspace of cost greater than $S_0$, including zero,
  has dimension at most $C_4 \( 1 + m \)^r$. The $r$ cheap probes have actual lifts in these systems with bounded
  degree and cost and independent initials. These are the finite-cutoff estimates used when varying the valuation
  on $k \( X \)$.

== 11 Real valuations and a finite constrained optimization <c:optimization-section>

The section estimates are now in place. We seek a valuation whose discrepancy is small,
  whose values on all sections satisfy a lower bound, and whose selected initial coordinates remain independent.
  The first task is to make this optimization finite and attain its minimum on the original function field.
  The second is to extract a strict divisorial inequality from optimality;
  that inequality is the input for Cartier trace in the next section.

We return to the actual function field $K = k \( X \) = k \( Z \)$, the fractional form $theta$,
  the valuation $v$, and the nested multiplicative systems $V_m$ constructed above.
  All physical degrees in this and the following sections belong to $n bb(Z)_(gt.eq 0)$.
  If $0 eq.not F in V_m$, its #emph[assigned cost] is

$ b \( F \) = m + v \( F \) . $

The assigned degree is part of this notation. We have $V_0 = k \[ Z \]$ and $"Frac" \( V_0 \) = K$.
  The only zero-cost elements are the degree-zero functions invertible at $z$.
  The preceding weight estimates and (6.1) give

$ m lt.eq C b \( F \) quad upright("when ") b \( F \) > 0 \, $

and a uniform positive lower bound for positive costs along the chosen subsequence.
  Constants may depend on the fixed subsequence bounds already selected.

The earlier normalized-volume minimization supplied the graded model underlying these section estimates.
  In the present optimization, $v$ remains fixed and determines the costs $b \( F \)$,
  while the candidate valuation varies on the actual field $K$.
  The objective balances its angular discrepancy against a common lower bound for section values,
  with prescribed independent initial coordinates.

=== 11.1 Constants and full initial fields <constants-and-full-initial-fields>

We may, and do, take $k$ countable and algebraically closed of characteristic zero.
  Here is the descent needed for this choice. Descend the countably many members of the sequence and all their
  finite data simultaneously from $bb(C)$: the points $z$, the sections $h$,
  the graded algebra presentations and generators with their lifts, the monomial charts for $v \, tilde(v)$,
  the models and contractions, the lattice and field identifications, the forms and divisors,
  and the chosen probes. Retain the numerical valuation weights.
  These data are defined over the algebraic closure of a countably generated subfield of $bb(C)$, which is countable.

We explain why the assertions used below survive this descent.
  On an independent-normal-weight chart as in (5.1), the full initial field is the stratum field with independent
  normal variables. The leading-monomial congruences and their nonzero residue coefficients are preserved on
  extending constants. For any finite-dimensional space of functions over $k$,
  there are only finitely many values: elements of distinct values are linearly independent.
  Taking bases on its successive value slices gives a basis with independent initials.
  These initials remain independent after extension to $bb(C)$,
  since the stratum is geometrically integral and its initial coordinates extend injectively.
  This computes the whole filtered space after extension as well.
  Sections of the reflexive powers defining the graded affine algebra commute with constant extension by flat base
  change; alternatively compute them on the smooth locus. Taking finite spans therefore proves that the associated
  graded algebras, the prescribed lifts, and the field identifications extend as required.

In particular the leading-space dimensions, widths, and nonemptiness assertions descend.
  Retain $S_1 \, H_1 \, A_1^(+)$, (6.3), and the terminal field $K_f$.
  A divisorial test over $k$ extends from a smooth divisor chart to $bb(C)$,
  with its orders and discrepancies unchanged, so (9.5) continues to hold.
  If its restriction to $K_f$ is trivial, the residue embedding of $K_f$ stays injective after tensoring and
  taking fractions, so this condition is preserved too. The $epsilon.alt$-lc condition on $X$ and the lc condition
  defined by $h$ likewise descend. A contradiction over $k$ will consequently suffice.
  We shall enlarge constants again when forming geometric generic fibres.

All valuations are trivial on their stated ground field. For a real Abhyankar valuation $w$ of $K$,
  including the zero valuation, write $K_w$ for the fraction field of its associated graded ring,
  and $overline(F)$ for a homogeneous initial. Thus $K_w$ is the #emph[full initial field],
  not merely the residue field. Write $E$ for the residue field of $w$.
  A valuation is #emph[Gaussian] on a list if the initials of that list are algebraically independent over the
  constants. Equivalently, every nonzero polynomial in the list has the termwise minimum value.

=== 11.2 The barrier and its finite test <the-barrier-and-its-finite-test>

Fix one sequence member, positive real numbers $B_(*) \, kappa \, q_(*) \,
  q_(upright("bar"))$ with $q_(upright("bar")) < q_(*)$, and an algebraically independent list $y = \( y_j \)$ of
  rational functions, possibly empty. The symbol $B_(*)$ is a budget scalar, not a boundary. Define

#[#set math.equation(numbering: n => "(11.1)")
 $ q \( w \) = min {q_(*) \, inf_(m \, thick 0 eq.not F in V_m\
b \( F \) > 0) frac(w \( F \) + B_(*) m, b \( F \))} \, wide cal(L) \( w \) = A_theta \( w \) -
  kappa q \( w \) . $ <eq:E3>]

For a real parameter vector $t$, minimize $cal(L)$ over real quasi-monomial $w$ with $q \( w \) gt.eq
  q_(upright("bar"))$, Gaussian on $y$, and $w \( y \) = t$. A feasible valuation is centred over $z$ on $X$:
  its bound on $V_0 = k \[ Z \]$ gives positivity on the maximal ideal of $z$, zero on functions invertible there,
  and properness supplies the centre on $X$. The lc boundary in (6.7) then gives $A_theta \( w \) gt.eq 0$.

#thm([Lemma 11.1.])[
  (Finite barrier test).  #emph[There are finitely many pairs $\( m_i \, F_i \)$, with $b_i = m_i +
    v \( F_i \) > 0$, such that whenever their minimum ratio, including $q_(*)$, is at least $q_(upright("bar"))$,
    it equals $q \( w \)$. An index attaining the minimum is called active;
    the cap is an additional active entry when $q \( w \) = q_(*)$.]
] <c:finite-barrier>

#proof[
  Take the degree-$n$ Veronese $cal(A)'$ of the actual section algebra $cal(A)$.
    Write $o'$ for the image of $o$ in $"Spec" cal(A)'$. The initial algebra of $cal(A)'$ at $tilde(v)$ is the
    corresponding Veronese of $R$: $tilde(v)$ is degree-torus invariant,
    and linear combinations of torus translates separate the physical degree characters.
    This algebra is finitely generated, with value-zero part consisting only of constants.
    Choose lifts $s_i = h^(m_i \/ n) F_i$ of homogeneous initial generators and include ordinary homogeneous
    algebra generators of $cal(A)'$. In degree zero subtract their value at the point $o'$,
    so all these generators vanish there and have positive cost.
  Every homogeneous $s = h^(m \/ n) F$ vanishing at $o'$ has an exact polynomial representative in these
    generators, all of whose terms have physical degree $m$ and cost at least $b = tilde(v) \( s \)$.
    To prove exactness, subduct by the initial generators, retaining physical degree, to arbitrarily high cost.
    The residual value strictly increases; only finitely many costs occur below a fixed bound,
    by positivity and finite graded generation. The fixed-germ log Izumi estimate at the bare klt cone point $o$
    then puts a sufficiently high residual in any prescribed power of its maximal ideal.
    The powers are primary also on the affine ring, so this assertion is global.
    It may equally be checked after extension to $bb(C)$ and contracted.
  The same conclusion holds in $cal(A)'$. Indeed the radical of its point ideal extended to $cal(A)$ is the point
    ideal of $o$, as seen by taking degree powers; moreover the Veronese inclusion splits as $cal(A)'$-modules.
    Thus a sufficiently high residual belongs to any prescribed power of the point ideal in $cal(A)'$.
    Such a power has representatives by sufficiently long monomials in the ordinary generators,
    and hence by terms of high cost. Project to physical degree $m$.
    This finishes subduction by an exact finite representative.
  Divide by $h^(m \/ n)$. If the finite ratios are bounded below by a positive number $q$,
    every term satisfies $w \( upright("term") \) + B_(*) m gt.eq q thin \( upright("its cost") \) gt.eq
    q b \( F \)$. Taking the minimum gives the same bound for $F$. Zero-cost units cause no additional condition.
    This proves the asserted finite test. ◻
]

=== 11.3 Monomial models and variations <monomial-models-and-variations>

The finite test replaces the section inequalities by finitely many actual functions.
  We still need to control discrepancy while retracting a valuation to a finite skeleton,
  and to construct variations with controlled probe values and preserved Gaussianity.
  The following monomialization and differential arguments provide these two kinds of control.

We will also use ordered-group valuations satisfying Abhyankar equality.
  The relative Abhyankar inequality says that, for an extension of valued function fields,
  the increment of rational rank plus the increment of residue transcendence degree is at most the transcendence
  degree of the extension. Indeed choose values independent modulo the old values over $bb(Q)$,
  and value-zero elements with residues independent over the old residue field.
  Their monomials are independent, by first comparing values and then residues.
  It follows that Abhyankar equality passes by restriction to subfunction-fields.
  The transcendence degree of the full initial field is rational rank plus residue transcendence degree:
  choose homogeneous elements whose values rationally span the value group;
  all remaining homogeneous elements become algebraic after taking monomial ratios.

#thm([Lemma 11.2.])[
  (Ordered monomialization).  #emph[An ordered-group valuation of a characteristic-zero function field satisfying
    Abhyankar equality is monomial on a smooth projective model,
    which may dominate a prescribed model and resolve prescribed finite divisor data.
    Its centre is the generic point of a transverse stratum; the positive normal-parameter values are rationally
    independent. Its full initial field is the stratum field with independent normal variables.]
] <c:ordered-monomialization>

#proof[
  Choose functions with rationally independent values spanning the rational value group,
    and value-zero functions with residues forming a complementary transcendence basis.
    Resolve the divisors of the first functions and the maps to $bb(P)^1$ of the second functions,
    together with the prescribed finite data. At the centre, the number of crossing components is at least the
    rational rank: the chosen functions are units times Laurent monomials in their local equations.
    The closure of the centre has dimension at least the residue transcendence degree,
    because the chosen residue functions are regular and invertible there.
    Equality of their sum with the field dimension forces the centre to be generic in a transverse stratum and the
    normal values to be rationally independent.
  Complete the regular local ring at that generic point and expand over a coefficient field.
    The support of a nonzero series has finitely many componentwise-minimal exponents.
    Since all normal weights are positive, its least weight is attained among them;
    rational independence makes the least exponent unique. This also works in the ordered group.
    The ideal of monomials of strictly higher weight is finitely generated.
    Faithful flatness contracts the congruence modulo this ideal to the local ring.
    Hence the function equals its least monomial times a residue-coefficient lift, modulo strictly higher weight.
    This proves the value formula and the initial-field description.
    Independence of the normal values also identifies the degree-zero field with the stratum field. ◻
]

For a real $w$, Lemma 49 gives

$ K_w = E \( upright(bold(z)) \) \, $

where the homogeneous Laurent variables $upright(bold(z))$ have degrees forming a basis of the value lattice.
  This lattice is free of finite rank by the same chart. Any homogeneous elements of those basis degrees can serve
  as the variables: correct characters to degree zero and use independence of distinct degrees.
  Fractional forms are interpreted by taking their $n$-th powers and dividing form orders by $n$.
  In particular $theta_w^n$ is homogeneous for this value torus, by the leading-form rule (5.1).

#thm([Lemma 11.3.])[
  (Logarithmic determinant).  #emph[If $a_1 \, dots.h \, a_d$ are a transcendence basis and $w$ is a real
    Abhyankar valuation in characteristic zero, then
$ A_(and.big_i d log a_i) \( w \) gt.eq 0 . $

 Equality holds exactly when the initials of the $a_i$ are algebraically independent.]
] <c:log-determinant>

#proof[
  Include their divisors in the monomialization. Use logarithmic differentials of the normal parameters and of
    unit lifts of a separating basis on the stratum. Their wedge has form discrepancy zero.
    Each $a_i$ is a unit times a normal Laurent monomial. The logarithmic differential matrix has entries of
    nonnegative value, and its reduction is the corresponding matrix of initial logarithmic differentials.
    Logarithmic normal derivatives of a unit reduce to zero; tangential derivatives differentiate the residue
    coefficient. The determinant therefore has value zero exactly when the initial differentials are independent,
    equivalently when the initials are algebraically independent in characteristic zero. ◻
]

#thm([Lemma 11.4.])[
  (Invariantization).  #emph[Let $Q^(*)$ be a real Abhyankar valuation of $K_w = E \( upright(bold(z)) \)$.
    Put $P = Q^(*) \|_E$, and let $Q$ be the Gauss valuation with restriction $P$ and the same values as $Q^(*)$
    on $upright(bold(z))$. Then $Q$ is Abhyankar, agrees with $Q^(*)$ on every homogeneous element, and
#[#set math.equation(numbering: n => "(11.2)")
 $ A_(theta_w) \( Q^(*) \) gt.eq A_(theta_w) \( Q \) . $ <eq:E1>]

 Equality implies $Q^(*) = Q$. Gaussianity of $Q^(*)$ on a list of homogeneous probes is preserved by $Q$.]
] <c:invariantization>

#proof[
  The restriction $P$ is Abhyankar by the relative inequality.
    The Gauss extension is Abhyankar because its variable initials are independent over the full field $E_P$.
    Choose functions $x$ in $E$ with full independent initials at $P$.
    The coefficient of $theta_w^n$ in the $n$-th power of $d log x and d log upright(bold(z))$ is homogeneous,
    so its value is the same for $Q$ and $Q^(*)$. The logarithmic differential contribution is zero at $Q$,
    and is nonnegative at $Q^(*)$ by Lemma 50. Equality requires independent initials of $x \, upright(bold(z))$.
    As $E_P$ is algebraic over the field generated by the $x$-initials,
    the $upright(bold(z))$-initials are then independent even over $E_P$.
    This gives the termwise Gauss rule at $Q^(*)$, proving equality of valuations.
  For the last assertion, group a polynomial in the probes by its torus characters.
    The two valuations agree on each homogeneous part, and $Q$ takes their minimum.
    Gaussianity at $Q^(*)$ therefore gives the same polynomial minimum at $Q$. ◻
]

#thm([Lemma 11.5.])[
  (Flattening a secondary valuation).  #emph[For the invariant valuation $Q$ of Lemma 51,
    there are real monomial valuations $w_lambda$, for small $lambda > 0$, such that
#[#set math.equation(numbering: n => "(11.3)")
 $ w_lambda \( F \) & = w \( F \) + lambda Q \( overline(F) \) \,\
A_theta \( w_lambda \) & = A_theta \( w \) + lambda A_(theta_w) \( Q \) . $ <eq:E2>]

 For each fixed nonzero rational function the first identity holds for all sufficiently small $lambda$,
   with the interval allowed to depend on that function. If $w$ is Gaussian on a prescribed finite list $y$,
   and $Q$ is Gaussian on $overline(y)$, then $w_lambda$ may be kept Gaussian on $y$.]
] <c:flattening>

#proof[
  Give $F$ the lexicographically ordered value $\( w \( F \) \, Q \( overline(F) \) \)$.
    Grouping tied first values proves the valuation inequality. Its initials identify with double initials:
    on each first homogeneous slice the second comparison is exactly the definition,
    while distinct first degrees remain separated by their $upright(bold(z))$-characters,
    with coefficients in $E_P$. Multiplication is preserved. Lifts to $K$ of the variables $upright(bold(z))$ and
    of the functions $x$ used above have full independent lex initials.
    Such lifts exist for all homogeneous elements, including degree-zero residue elements.
    The lex valuation therefore satisfies Abhyankar equality.
  Monomialize it by Lemma 49. Replace each normal weight by its first coordinate plus $lambda$ times its second
    coordinate. These weights are positive for small $lambda > 0$.
    For any fixed numerator and denominator, the finitely many componentwise-minimal support exponents show that
    its former least exponent remains least eventually. The resulting initial with its stratum coefficient and
    normal variables is unchanged. The normal initial variables remain independent even if the new real values
    have ties, since a monomial valuation retains all least-weight terms.
    This proves the value assertion and preserves independence of the lifted full probes.
    Double initials likewise preserve independence of $y$ under the two stated Gaussian conditions.
  Express $theta^n$ in the logarithmic basis of those full probes.
    Its coefficient computes the discrepancy at $w$ by (5.1), and its initial is the coefficient of $theta_w^n$.
    The logarithmic basis contributes zero at $w_lambda$ and at $Q$.
    Apply the value identity also to this one fixed coefficient and divide by $n$; the second identity follows. ◻
]

=== 11.4 Retraction and compact optimization <retraction-and-compact-optimization>

We now apply these valuation tools to the finite barrier data.
  Retraction will restrict the valuations to finitely many skeleton cones;
  the comparison with $A_X$ in (6.7) will exclude escape to infinity on an objective sublevel.

#thm([Lemma 11.6.])[
  (Retraction and strict discrepancy drop).  #emph[Resolve on a smooth projective model the divisor supports of
    $theta^n \, F_i \, y_j$. Retraction to its normal crossing skeleton preserves the finite barrier data,
    probe values and probe Gaussianity, and does not increase $A_theta$.
    The discrepancy decreases strictly for a real Abhyankar valuation outside the skeleton.
    On every closed skeleton cone, each fixed rational function has a continuous finite piecewise-linear value,
    with a finite Lipschitz constant.]
] <c:skeleton>

#proof[
  At a centre, keep the weights on the crossing normal equations and move to the generic stratum;
    if there are no such equations, the retraction is zero. Retraction can only decrease the value of a regular
    function. To see this with the required control at faces, let $x$ be the normal parameters.
    A monomial ideal of positive threshold contracts from the generic stratum to the local ring.
    In its completed quotient there is a finite free module over the formal series in the other parameters.
    A function outside the stratum prime acts injectively: its reduction in the other parameters is nonzero,
    and the remaining normal part acts nilpotently. The monomial ideal is therefore primary to the stratum prime,
    and faithful flatness gives contraction. Membership in this ideal characterizes the threshold at the generic
    stratum and bounds the value at the original centre.
  On an open cone, normal expansion computes values by the minima over finitely many componentwise-minimal support
    exponents of regular numerators and denominators. At a face apply the same primary-ideal argument to just the
    remaining positive-weight parameters. It proves that these formulas extend to the face;
    at the origin both values are zero. This gives continuity, finite piecewise linearity and a Lipschitz bound.
    Divisors included in the resolution have linear values on each cone.
    So does $A_theta$, using the local logarithmic top generator.
  The retraction preserves all resolved divisor values. For a polynomial in $y$, clear poles by a normal monomial,
    since each $y_j$ is a unit times a normal Laurent monomial.
    Its retracted value is at most its old value and at least its termwise minimum.
    If $w$ is Gaussian these agree, proving preservation. Within one open cone the initial formulas of $y$ in
    stratum coefficients and independent normal variables do not depend on the positive weights.
    Gaussianity thus selects whole open cones. It persists on their faces by continuity of all polynomial values.
  For the discrepancy comparison, choose supplementary regular functions $z'$ with étale differentials at the
    centre, including a separating residue basis, and put $lambda_0 = d log x and d z'$.
    The coefficient of $theta^n$ relative to $lambda_0^n$ is a unit-monomial.
    The difference from the retracted discrepancy is $A_(lambda_0) \( w \)$.
    Switching the regular supplementary factors to logarithmic ones and applying Lemma 50 makes this nonnegative.
    If the centre is proper in its stratum, a supplementary parameter vanishing there has positive value,
    making the difference strict.
  If the centre is generic in the stratum, use unit lifts of a separating stratum basis.
    Equality in the determinant test makes those initials and the normal initials independent.
    The normal initials are independent even over the embedded stratum field,
    which is algebraic over that basis field. Least normal terms therefore cannot cancel;
    contracting their congruence modulo strictly higher monomial weight proves that $w$ itself is the monomial
    retraction. This proves strictness outside the skeleton. The proof is unchanged over other algebraically
    closed characteristic-zero constant fields. ◻
]

#thm([Proposition 11.7.])[
  (Compact optimization and continuation).  #emph[The optimization in (11.1) is a finite polyhedral optimization
    with compact sublevels, and attains its minimum whenever feasible. Every optimizer lies on the fixed skeleton.
    At any parameter admitting an optimizer with $q > q_(upright("bar"))$,
    the minimum is locally finite and continuous. On full-dimensional generic parameter cells it is affine.
    Through every optimizer at such a generic parameter there is a local affine continuation by optimizers within
    its same open stratum cone and with the same active mask.]
] <c:optimization>

#proof[
  By Lemmas 48 and 53 we may optimize on a finite union of closed polyhedral pieces,
    with affine projection to $t$ and piecewise affine objective.
    Strict retraction excludes every optimizer outside them.
  Suppose a sublevel, allowing $t$ to vary, were unbounded.
    Normalize an escaping sequence in one closed cone by the norms of its weights and take a limit of norm one,
    defining a nonzero monomial valuation $w'$. The barrier and continuity give $w' \( F \) gt.eq
    0$ for every $0 eq.not F in V_m$, including degree-zero units.
    The bounded cap in (11.1) gives $A_theta \( w' \) lt.eq 0$.
    Nonnegativity on $k \[ Z \]$, and properness over the affine base, give a centre on $X$.
    Equation (6.7), valid at such centres by freeness of sufficiently divisible multiples over the affine base,
    implies $A_X \( w' \) lt.eq 0$. This is impossible: on a monomializing resolution a nonzero quasi-monomial
    valuation centred on a klt variety has strictly positive discrepancy. The sublevels are compact, proving attainment.
  For continuity, let $w$ be an optimizer with strict barrier slack.
    Give $k \( overline(y) \)$ arbitrary rational-direction Gauss weights.
    Extend this valuation to $K_w$ by completing to a transcendence basis with freely weighted variables and then
    extending over the finite algebraic extension. The relative Abhyankar inequality gives equality,
    and the extended value group is contained in the rational span of the starting real weights,
    so the extension remains real. Invariantize by Lemma 51 and flatten by Lemma 52.
    The finite test makes a small segment in the prescribed direction feasible, with cost tending to the optimum.
    Retraction can only improve it.
  A compact skeleton sublevel cut strictly above that optimum projects to a finite union of closed polytopes.
    The tangent cones at the parameter contain all rational directions and hence, by closedness and density,
    all directions. Near the point only the active inequalities of the incident polytopes matter.
    Its projection therefore contains a neighbourhood. Applying this for sublevels arbitrarily close above the
    optimum proves local finiteness and upper continuity. Compactness proves lower continuity.
  Finally subdivide a compact sublevel into finitely many polyhedra with affine cost and fixed active mask and
    stratum on each relative interior. Projection to parameter and cost gives the piecewise-affine minimum.
    Avoid its walls and all lower-dimensional parameter projections of domain faces.
    The affine hull of the relative interior containing any optimizer then projects with full rank.
    Choose a local affine right inverse through that optimizer, staying in the same relative interior.
    Its cost minus the optimal value is affine, nonnegative nearby and zero centrally, hence identically zero.
    This is the required continuation. In the applications below,
    strict objective bounds maintain strict barrier slack; compactness and continuity then also control limits
    along nongeneric segments. ◻
]

=== 11.5 A strict budget on a geometric generic fibre <a-strict-budget-on-a-geometric-generic-fibre>

Compactness and continuation allow us to choose and vary optimizers.
  We next examine a second valuation of their full initial field.
  If it preserves the old initial coordinates, flattening gives an admissible variation on the original field.
  Optimality controls its discrepancy; a tie rule will make the resulting inequality strict after adding finitely
  many small auxiliary terms.

Fix parameters admitting an optimizer with $q > q_(upright("bar"))$,
  and let $cal(M)$ be the compact set of all optimizers. We first maximize $q$ on $cal(M)$.
  The finite barrier test makes $q$ continuous there, so its maximum $q_max$ is attained and satisfies $q_max >
  q_(upright("bar"))$. The locus

$ cal(M)_max = { u in cal(M) : q \( u \) = q_max } $

is therefore nonempty and compact. Choose the coefficients $c_F > 0$,
  indexed by the countable nonzero angular functions, so rapidly decreasing that

$ Psi \( u \) = sum_F c_F u \( F \) $

converges absolutely and uniformly on $cal(M)$, and that the weighted Lipschitz constants are summable on each of
  the finitely many closed cones. This is possible by Lemma 53.
  We then choose $w in cal(M)_max$ maximizing $Psi$ there. In particular $q \( w \) = q_max > q_(upright("bar"))$.
  We call this an optimizer with the stated tie rule.

Take independent homogeneous probes $g = \( overline(y) \, g_(upright("add")) \)$ in $K_w$.
  The optional $g_(upright("add"))$ are not optimization constraints.
  Let $L$ be any geometric generic fibre field over $k \( g \)$:
  choose a component of the compositum with $k' = overline(k \( g \))$ and work over $k'$.
  Divide $theta_w$ by the ordinary base wedge $and.big_j d g_j$, interpreting fractional forms through powers,
  to obtain $theta_(w \, upright("rel"))$.

#thm([Proposition 11.8.])[
  (Relative optimality and its equality case).  #emph[For every nontrivial real Abhyankar valuation $Q^dagger$ of
    $L \/ k'$,
#[#set math.equation(numbering: n => "(11.4)")
 $ A_(theta_(w \, upright("rel"))) \( Q^dagger \) gt.eq kappa min_(i med upright("active"))
   frac(Q^dagger \( overline(F)_i \), b_i) . $ <eq:E4>]

 An active cap contributes the entry zero. If equality holds,
   then $Q^dagger \( overline(F) \) < 0$ for some actual angular function $F$.]
] <c:relative-budget>

#proof[
  Restrict $Q^dagger$ to a valuation $Q^(*)$ of $K_w$. The extension $L \/ K_w$ is algebraic,
    and its enlarged constants contribute $\| g \|$ to residue transcendence degree over $k$.
    The relative inequality thus shows that $Q^(*)$ has Abhyankar equality.
    The $g_j$ have value zero and independent initials. Complete them, using functions of $K_w$,
    to a list with full independent initials. Their supplementary initials remain independent over $k'$ at
    $Q^dagger$: the graded-field embedding is injective, and the constant extension is algebraic over $k \( g \)$.
    Expressing the form in $d g$ wedged with logarithmic supplementary differentials and using (5.1) gives
  $ A_(theta_(w \, upright("rel"))) \( Q^dagger \) = A_(theta_w) \( Q^(*) \) . $
  The coefficient is unchanged on dividing by the base wedge;
    changing $d g_j$ to $d log g_j$ contributes only value-zero factors.
  Invariantize $Q^(*)$ to $Q$. It agrees on the homogeneous active entries and preserves zero-value Gaussianity on
    the old probes $overline(y)$. Equation (11.3) gives a path $w_lambda$ preserving the old Gaussian parameters.
    No preservation of additional constraints is being required.
    Let $mu$ be the active minimum in (11.4), including the zero entry if the cap is active.
    For small $lambda > 0$, the finitely many test ratios and the cap have minimum $q \( w \) + lambda mu$.
    Since $q \( w \) > q_(upright("bar"))$, this stays above the barrier;
    Lemma 48 identifies it with $q \( w_lambda \)$ and makes the path feasible for the original optimization.
    Original objective optimality and (11.2) prove the inequality.
  Equality forces equality in invariantization, hence $Q^(*) = Q$,
    and an exact path of original optimizers $w_lambda$. Suppose every angular initial had nonnegative
    $Q^dagger$-value. Then $mu gt.eq 0$, including the possible cap entry.
    Since the path consists of original optimizers and $q \( w \) = q_max$, maximality of $q$ forces $mu = 0$.
    Thus this equality path lies in $cal(M)_max$. Some angular value is positive:
    otherwise all homogeneous initials, obtained as ratios of initials from $V_0$, have value zero,
    and the invariant Gauss rule makes $Q$ trivial. Algebraicity would then make $Q^dagger$ trivial as well.
  This positive value contradicts the tie rule by differentiation of $Psi$.
    The interchange of sum and derivative is justified as follows.
    Strict retraction puts every small $w_lambda$ on the fixed test skeleton.
    Monomialize the lex valuation on a model dominating that skeleton.
    The flattened positive normal weights have fixed centre for small positive $lambda$,
    so their images use one skeleton cone. Values of its finitely many normal equations are affine in $lambda$ on
    a common interval by (11.3). Their face limit is $w$, by the pointwise identities and closed-cone continuity.
    Thus the coordinate distance is $O \( lambda \)$. The summable weighted Lipschitz constants dominate all
    difference quotients; termwise differentiation follows even though the eventual interval in (11.3) depends on
    $F$. Every derivative is nonnegative and at least one is positive,
    contradicting maximality of $Psi$ on $cal(M)_max$. ◻
]

#thm([Corollary 11.9.])[
  (Strict rational budget).  #emph[On the same geometric generic fibre,
    one can choose positive rational numbers $alpha_i$ arbitrarily close to $kappa \/ b_i$,
    a finite list of additional actual angular functions $U_j$, and arbitrarily small positive rational $e_j$,
    so that every prime divisor $P$ over a proper model satisfies
#[#set math.equation(numbering: n => "(11.5)")
 $ A_(theta_(w \, upright("rel"))) \( P \) > min_(i med upright("active")) alpha_i P \( overline(F)_i \) +
   sum_j e_j min { 0 \, P \( overline(U)_j \) } . $ <eq:E5>]

 The same zero-entry convention applies to an active cap. The list may include field generators over $k'$.
   The added $e_j$-weighted terms and the errors from approximating $kappa \/
   b_i$ may meet any prescribed finite degree, value and Lipschitz tolerances along a specified local affine
   optimizer continuation.]
] <c:strict-budget>

#proof[
  Resolve the finite form and active-divisor data on a proper relative model.
    By strict retraction, the nonzero equality directions in (11.4) lie on its normal crossing skeleton:
    retraction preserves the minimum term and strictly lowers discrepancy off the skeleton.
    A nonzero valuation retracted to zero has strictly positive discrepancy gap and is not an equality direction.
    Normalize the sum of the nonnegative normal weights to one.
    The equality locus is closed in the finite compact union of these simplices.
  Proposition 55 supplies an open cover of this locus by conditions $P \( overline(U) \) < 0$.
    Choose a finite subcover. Add field generators: initials from $V_0$ generate $K_w$, since $K =
    "Frac" \( V_0 \)$. Adding the indicated two-element minimum systems with any positive small coefficients makes
    the inequality strict everywhere, first with coefficients $kappa \/ b_i$.
  When a local affine continuation is specified, fix it before choosing these coefficients.
    It is a continuation by optimizers of the original problem through $w$; the tie rule is imposed only at $w$.
    For each added or active actual function $F$, fix its assigned degree.
    On a sufficiently small compact parameter neighbourhood, its absolute values and Lipschitz constant are
    bounded. Let $N \( F \)$ bound the sum of these quantities and its assigned degree.
    The added terms meet any prescribed positive tolerance $eta$ by choosing the $e_j$ so small that $sum_j e_j
    N \( U_j \) < eta$. With no continuation specified, retain just the degree and value bounds needed.
  Resolve also the added functions. The strict gap has positive minimum on the normalized enlarged skeleton.
    Each of the finitely many active evaluations is bounded there, and
  $ \| min_i a_i - min_i b_i \| lt.eq max_i \| a_i - b_i \| . $
  Consequently a single sufficiently close rational perturbation of the $kappa \/ b_i$ preserves strictness,
    including where the minimizing index switches. The cap remains a fixed zero entry.
    Retraction deals with every remaining direction, including zero retraction.
    Having chosen the $e_j$ first, make the rational perturbation still closer so that $sum_i \| alpha_i -
    kappa \/ b_i \| N \( F_i \) < eta$ and the resulting strict margin is retained.
    Finitely many prescribed tolerances can be met simultaneously by taking $eta$ sufficiently small.
  After clearing denominators, realize each term $e_j min { 0 \,
    P \( overline(U)_j \) }$ by product powers of the two-element system ${ 1 \, overline(U)_j }$.
    The ratio $overline(U)_j$, rather than only one of its powers, remains among ratios of the combined system:
    keep all other factors fixed and replace one $1$ by $overline(U)_j$.
    This also supplies its asserted birationality. ◻
]

== 12 Cartier trace and controlled lifting <c:trace-section>

The strict inequality from the previous section supplies a nonzero trace on a geometric generic fibre of a full
  initial field. To turn it into the section estimates needed later,
  we must lift that nonvanishing twice and keep its exact value formula.
  This section proves each lifting step, then checks that the finite spaces used to count all possible outputs can
  be retained before reduction.

We write $frak(p)$ for the residue characteristic, reserving $p$ for the auxiliary cone dimension used earlier.
  We write $P_0 = frak(p)^l$ for a Frobenius power. All valuations, optimizers,
  strict discrepancy inequalities and finite output bounds are chosen in characteristic zero.
  Reduction transports the specified finite algebraic data and numerical monomial formulas;
  it does not assert the existence of an optimizer with the same properties in positive characteristic.

The applications seek nonzero traced outputs $F'$ from actual inputs $G in V_M$.
  In the retained reductions, survival of the $w$-initial trace will give

$ F' in V_(m') \, wide m' lt.eq M \/ P_0 + n \, wide w \( F' \) = frac(w \( G \), P_0) -
  (1 - 1 / P_0) A_theta \( w \) . $

The corresponding lower value inequality will remain valid when the positive weights vary in the same open stratum
  cone. Thus inputs whose degrees and values are $O \( P_0 \)$ give outputs in degree and value ranges bounded
  independently of $P_0$ for this fixed application, even though the trace power is not known in advance.
  Independent traces in the full initial field will be counted inside the span of actual output initials.
  The degree and value bounds determine the possible filtered output spaces;
  the span inclusion transfers a lower dimension bound to them.
  We state the relative nonvanishing input first, then prove the lifting properties before returning to its
  independent proof.

=== 12.1 A trace supplied by a strict divisorial budget <a-trace-supplied-by-a-strict-divisorial-budget>

If $J$ is a nonempty finite set of elements of a field, $J^a$ denotes the set of products of $a$ members,
  with repetitions, and $min P \( J \)$ denotes $min_(F in J) P \( F \)$.

#thm([Lemma 12.1.])[
  (Strict budget and trace).  #emph[Let $L$ be a finitely generated field over an algebraically closed field $k$
    of characteristic zero, let $theta.alt = nu \/ f^(1 \/ n)$ be a fractional rational volume form,
    and let $I subset L^(*)$ be a nonempty finite system whose ratios generate $L \/ k$.
    Let $k_I$ be a positive integer. Suppose that every prime divisor $P$ over a proper model of $L \/ k$ satisfies
#[#set math.equation(numbering: n => "(12.1)")
 $ A_theta.alt \( P \) > frac(min P \( I \), k_I) . $ <eq:E6>]

 After spreading these data, in sufficiently general reductions of arbitrarily large characteristic $frak(p) equiv
   1 med \( mod med n k_I \)$ there are $l gt.eq 1$ and $H in "span" \( I^(\( P_0 - 1 \) \/ k_I) \)$, where $P_0 =
   frak(p)^l$, such that
#[#set math.equation(numbering: n => "(12.2)")
 $ cal(C)_theta.alt^l \( H \) :=
   frac(cal(C)^l #scale(x: 120%, y: 120%)[\(] H f^(\( P_0 - 1 \) \/ n) nu #scale(x: 120%, y: 120%)[\)], nu) eq.not
   0 . $ <eq:E7>]

 Here $cal(C)^l$ is iterated Cartier trace on rational top forms over perfect constants.
   One may choose $H$ to be a single product from $I^(\( P_0 - 1 \) \/ k_I)$.]
] <c:trace-existence>

The operator in (12.2) is independent of the presentation of $theta.alt$.
  Indeed replacing $\( nu \, f \)$ by $\( a nu \, a^n f \)$ multiplies the trace input by $a^(P_0)$ and the
  denominator by $a$, and Cartier trace is $frak(p)^(- l)$-linear.
  We will repeatedly use its logarithmic-coordinate formula.
  If $x = \( x_1 \, dots.h \, x_s \)$ is a $frak(p)$-basis, then

$ b = sum_(0 lt.eq alpha_j < P_0) b_alpha^(P_0) x^alpha quad arrow.r.double quad
  cal(C)^l (b and.big_j d log x_j) = b_0 and.big_j d log x_j . $

This is the iterated Cartier isomorphism #cite(label("Cartier1957")) Théorème 1:
  logarithmic differentials are fixed, and all the other displayed monomials are killed.

The proof of Lemma 57 appears in the final subsection, after the lifting and finite-space estimates.
  Those steps explain how its surviving product supplies the actual degree, value, and dimension bounds just described.

=== 12.2 Survival of initials and the degree bound <survival-of-initials-and-the-degree-bound>

We now distinguish the actual field $K$ from the full initial field $K_w$ of a real monomial valuation $w$.
  The latter is the rational function field in the independent normal variables over the field of the stratum.
  We use the angular systems $V_m$ and the fractional form $theta$ from (6.7).
  The reductions in the following statements retain the monomial chart, its stratum, its form identities,
  and separating coordinates. The simultaneous finite-data construction is given below in Lemma 61.

#thm([Lemma 12.2.])[
  (Initial survival).  #emph[Transport $w$ to a reduction of its monomial chart,
    using the same positive normal weights. Let $x$ consist of its normal parameters and a unit separating
    tangential basis. Retain the conditions that $x$ is a $frak(p)$-basis of the actual field and that its
    initials form a $frak(p)$-basis of $K_w$. Write
$ theta = frac(and.big_j d log x_j, f_x^(1 \/ n)) . $

 For $frak(p) equiv 1 med \( mod med n \)$, $P_0 = frak(p)^l$, and every $G$ in the reduced actual field,
#[#set math.equation(numbering: n => "(12.3)")
 $ w #scale(x: 120%, y: 120%)[\(] cal(C)_theta^l \( G \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(w \( G \), P_0) -
   (1 - 1 / P_0) A_theta \( w \) . $ <eq:E8>]

 We set $w \( 0 \) = + oo$. For $G eq.not 0$, equality holds if and only if $cal(C)_(theta_w)^l \( macron(G) \)
   eq.not 0$; in that case
$ overline(cal(C)_theta^l \( G \)) = cal(C)_(theta_w)^l \( macron(G) \) . $

 The discrepancy in (12.3) is the characteristic-zero numerical quantity transported by the chart formula.
   The same assertions hold with ordered monomial weights, and the inequality holds under local real weight
   variation within the same open stratum cone.]
] <c:trace-initial-survival>

#proof[
  The $P_0$-basis expansion has the unique form
  $ G f_x^(\( P_0 - 1 \) \/ n) = sum_(0 lt.eq alpha_j < P_0) c_alpha^(P_0) x^alpha \, wide
    cal(C)_theta^l \( G \) = c_0 . $
  There is no cancellation between the least-valued terms on the right:
    the monomials $macron(x)^alpha$ are linearly independent over $K_w^(P_0)$. Consequently
  $ P_0 w \( c_0 \) gt.eq w \( G \) + frac(P_0 - 1, n) w \( f_x \) . $
  The logarithmic form identity (5.1) says $A_theta \( w \) = - w \( f_x \) \/ n$, proving (12.3).
    Taking least terms in the same expansion computes $macron(G)
    macron(f)_x^(\( P_0 - 1 \) \/ n)$ in the initial $P_0$-basis.
    Its zero-index coefficient is nonzero exactly when the inequality is an equality,
    and then it is the initial of $c_0$. The leading-form identity in (5.1) identifies the fractional form in this
    calculation with $theta_w$. This proves the equality criterion as well as the asserted initial identity.
    The argument only uses the order, addition of values, and independence over powers,
    so it also applies to ordered value groups. For nearby positive weights in the same chart the coefficient
    argument again gives the inequality, with the corresponding numerical discrepancy. ◻
]

#thm([Lemma 12.3.])[
  (Angular degree of a traced output).  #emph[In the retained reductions of the angular algebra, if $G in V_M$,
    then $cal(C)_theta^l \( G \) in V_(m')$ for some $m' in n bb(Z)_(gt.eq 0)$ with
$ m' lt.eq M / P_0 + n . $

]
] <c:trace-degree>

#proof[
  Choose $m' in n bb(Z)_(gt.eq 0)$ with $P_0 m' + P_0 - 1 gt.eq M$ and $m' lt.eq M \/ P_0 + n$. Recall the cone notation
  $ Omega = t thin omega and d log t \, wide h = t^n f_h^W \, wide theta = omega \/ \( f_h^W \)^(1 \/ n) . $
  Since $frak(p) equiv 1 med \( mod med n \)$, the exponent in
  $ b = G h^(\( P_0 m' + P_0 - 1 \) \/ n) $
  is integral; $b$ is regular on $W$ by $G in V_M$ and the displayed inequality.
    Apply $b mapsto cal(C)^l \( b Omega \) \/ Omega$. The log-$t$ formula and Frobenius-linearity give
  $ frac(cal(C)^l \( b Omega \), Omega) = h^(m' \/ n) cal(C)_theta^l \( G \) . $
  Indeed the $t$ exponent in $b Omega$ is $P_0 \( m' + 1 \)$, which trace divides by $P_0$,
    and the remaining coefficient is precisely the defining coefficient of $cal(C)_theta^l$.
    The output is regular in codimension one, because $Omega$ is a regular canonical generator there and Cartier
    trace sends regular top forms to regular top forms. It is therefore regular everywhere by normality.
    Its physical degree is $m'$, so division by $h^(m' \/ n)$ places the output in $V_(m')$.
    The normal graded algebra of $W$, its field and its codimension-one canonical generator are retained in the
    spread. This argument requires no new discrepancy assertion in positive characteristic. ◻
]

=== 12.3 From a relative trace to the full initial field <from-a-relative-trace-to-the-full-initial-field>

Fix independent homogeneous probes $g = \( g_1 \, dots.h \, g_(r_g) \)$ in $K_w$ and use the relative fractional
  form obtained by dividing $theta_w$ by the wedge of the #emph[ordinary] differentials $d g_j$.
  To describe its geometric generic field without confusing constants and functions,
  first introduce independent constants $xi_1 \, dots.h \, xi_(r_g)$ and put $k' =
  overline(k \( xi_1 \, dots.h \, xi_(r_g) \))$. Extend the full field model by these constants;
  the functions $g_j$ remain independent over $k'$ on this total model.
  At the generic point $eta$ of a chosen component of $g = xi$,
  the residue field is the chosen geometric generic field for $K_w \/ k \( g \)$.
  Every nonzero rational function from $K_w$ before this constant extension is a unit at $eta$,
  and its residue is its prescribed relative image, since $eta$ maps to the original generic point.

Choose a smooth model on which the map $g$ is smooth at $eta$. Then

$ u'_j = g_j - xi_j quad \( 1 lt.eq j lt.eq r_g \) $

are a regular system of parameters at $eta$. Choose unit supplementary coordinates $s$ whose residues form a
  separating transcendence basis of the relative field. They may be chosen among pre-extension rational functions.
  Spread the total model, this component, its relative model,
  and all these coordinate and restriction data together. After reduction, $u' \,
  s$ are a $frak(p)$-basis of the total field, and the Taylor initials of these coordinates form a $frak(p)$-basis
  of the Taylor initial field. The relative trace below is taken in the field of this transported component.
  Its existence is supplied by Lemma 57 applied before reduction to the fixed characteristic-zero pair.

#thm([Lemma 12.4.])[
  (Taylor flags).  #emph[Suppose a product of restrictions of homogeneous initials gives a nonzero relative trace
    as in (12.2), and let $H$ denote the lift of that product by the same factors to the full initial field.
    Then $cal(C)_(theta_w)^l$ is nonzero on
#[#set math.equation(numbering: n => "(12.4)")
 $ H product_(j = 1)^(r_g) \( u'_j \)^(P_0 - 1) . $ <eq:E9>]

 More precisely, give $u'_j$ the standard positive basis values in lexicographically ordered $bb(Z)^(r_g)$,
   and use the resulting Taylor valuation at $eta$. If a shift input $B$ has Taylor order $P_0 a$,
   with $a in bb(Z)^(r_g)$, and has a nonzero scalar leading coefficient, then
$ "ord"_(upright(T)) (cal(C)_(theta_w)^l (B H product_j \( u'_j \)^(P_0 - 1))) = a . $

 For $r_g = 0$ the empty product is one and the statement is the original relative nonvanishing assertion.]
] <c:trace-taylor-flags>

#proof[
  Write $macron(u)'_j$ for the normal variables of the Taylor initial field; this bar refers to Taylor initial,
    rather than the original $w$-initial. In the logarithmic basis for $u' \, s$,
    write the denominator of $theta_w$ as $f_(u' \, s)$. Its Taylor initial is
  $ "in"_(upright(T)) \( f_(u' \, s) \) = product_j \( macron(u)'_j \)^(- n) f_(upright("rel")) \, $
  where $f_(upright("rel"))$ is the denominator of $theta_(w \, upright("rel"))$ in the logarithmic basis of the
    residue coordinates $s$. This is precisely the effect of first dividing by $and.big_j d g_j =
    and.big_j d u'_j$ and only then changing from ordinary to logarithmic normal differentials.
    The unit coefficient identities are among the retained data at the fiber.
  The factors of $H$ are units at $eta$ and restrict to the factors of the nonzero relative trace.
    If the scalar leading coefficient of $B$ is $c eq.not 0$,
    the Taylor initial of the coefficient to which Cartier trace is applied is consequently
  $ c \( macron(u)' \)^(P_0 a) H \|_eta thin f_(upright("rel"))^(\( P_0 - 1 \) \/ n) . $
  The normal factor $product_j \( macron(u)'_j \)^(- \( P_0 - 1 \))$ from the denominator has been canceled
    exactly by the flags in (12.4). Extraction in the initial $P_0$-basis therefore gives
  $ c^(1 \/ P_0) \( macron(u)' \)^a cal(C)_(theta_(w \, upright("rel")))^l \( H \|_eta \) \, $
  which is nonzero. The ordered-weight version of Lemma 58 identifies it with the Taylor initial of the full
    trace, proving the asserted order and nonvanishing. ◻
]

There is one more lifting step. Expand an input in Lemma 60, including any shift,
  as a linear combination of products of homogeneous angular initials over the enlarged constants.
  Suppose that the factors in this expansion have actual lifts with the prescribed degree and value bounds.
  A homogeneous summand with nonzero trace #emph[in the full initial field] then has an actual lift $G$ for which
  Lemma 58 gives equality in (12.3) and identifies its traced initial.
  Additivity and perfectness of the constants show that the full initial-field outputs of all these inputs belong
  to the span of such actual output initials. In particular,
  a family of independent shifted outputs is spanned in this way;
  there is no need to select a single actual summand equal to each full output.
  Degree and value budgets are checked for every expanded summand.
  Thus cancellation in the expansion is not needed for the bounds.

The order of the argument is essential: relative survival first gives full initial-field survival by Lemma 60,
  and only then does Lemma 58 give actual survival and its equality formula.
  Mere nonvanishing of an actual trace would not give that equality.

Figure 1 summarizes these two lifting steps. The output degree is controlled term by term,
  while independent full-field outputs are counted inside the span of actual output initials.

#figure(
  [#strong[Geometric generic fibre of $K_w \/ k \( g \)$] A strict divisorial budget gives a product $H \|_eta$ with nonzero relative Cartier trace.
  $arrow.b$
  Taylor flags $product_j \( g_j - xi_j \)^(P_0 - 1)$ Lemma 60
  #strong[Full initial field $K_w$] The flagged product has nonzero trace.
    Expand it in homogeneous angular factors and retain the summands whose traces survive.
    Independent full-field outputs lie in the span of the resulting actual output initials.
  $arrow.b$
  Lift the same factors to the original field Lemmas 58 and 59
  #strong[Actual function field $K$] Each surviving summand gives an output $F'$ attaining equality in (12.3),
    with controlled physical degree.],
  caption: [Figure 1: The order of trace lifting. The downward steps use the retained reductions over the extended perfect constants. Whole output spaces and their filtration bounds are fixed in characteristic zero before the characteristic and the Frobenius power are chosen. ],
) <fig:trace-survival>

=== 12.4 Finite data retained before choosing the characteristic <finite-data-retained-before-choosing-the-characteristic>

The trace power and the surviving products are chosen only after reduction.
  Their bounds must therefore hold for every possible output in the prescribed degrees.
  We retain the relevant finite-cutoff filtrations of the whole modules $V_m$, including their high-cost parts,
  before making those choices.

#thm([Lemma 12.5.])[
  (Simultaneous finite-data reduction).  #emph[For each single application of the preceding trace constructions
    one may retain simultaneously the following data on a sufficiently general spread:
    the specified actual and initial monomial charts and fractional forms;
    the total and relative charts for the geometric generic component; finitely many functions,
    field identities and initial identifications; finitely many Taylor leading terms;
    and all specified finite-degree, finite-cutoff comparisons between the angular filtrations of $v$ and $w$.
    The last assertion concerns every element of each tested space,
    including elements with arbitrary coefficients in the extended reduced constants.
    A strict lower $w$-bound on the part of high $v$-cost also persists locally under positive weight variation in
    the specified chart.]
  #emph[These data, and all required output degrees and cutoffs, are fixed before $frak(p)$ and $P_0$.
    They may depend on the sequence member, the optimizer, the parameter, and the particular application.
    Products formed later from the retained finite lists, with multiplicities depending on $P_0$,
    require no new spreading assertion.]
] <c:trace-finite-data>

#proof[
  #emph[Models, coordinates, and forms.] Descend the finite algebraic data to a finitely generated integral base
    over $bb(Z)$. When geometric generic constants $k'$ are used,
    first extend the actual and full initial models by these constants as well,
    and include the finitely many constants occurring in the constructions in the spread.
    Spread generators, relations, maps, their inverse identities on birational opens, and rational forms.
    Shrinking the base retains flatness, geometric integrality, and normality where used.
    It also retains the smooth charts, chosen transverse integral strata,
    normal parameters and étale differential or supplementary coordinates.
    On $W$ retain the graded algebra, its birational field description,
    and the fact that $Omega$ generates in codimension one: its generating smooth open has complement of
    codimension at least two, and the same remains true after shrinking.
    Thus the $frak(p)$-bases and their initial-field identifications used above coexist with the angular algebra.
    They may also be imposed together with the finite spreading conditions in the deferred proof of Lemma 57,
    by a common shrinking of the spread.
  #emph[Finite initial expressions.] Consider a regular numerator or denominator at one of the stratum points.
    For sufficiently large ordinary normal degree $N$, successive jets express it modulo the $N$-th power of the
    normal ideal as a finite sum of distinct normal monomials with lifted unit coefficients.
    Retain their nonzero residue coefficients and the congruence,
    whose remainder is a combination of degree-$N$ monomials with regular coefficients.
    Near fixed positive normal weights, all terms in that remainder have weight greater than the weights under
    consideration. Consequently the finite expansion determines the value and the initial expression there.
    Spread this finite expansion and its unit and stratum data.
    Its minimum and homogeneous initial expression then agree in characteristic zero and in the identified reduced
    stratum/normal-variable field. Applying this to numerators and denominators handles the specified rational
    functions. For a finite list it also retains the piecewise leading rules for locally varying positive weights.
  Finite initial linear independences are retained by a nonzero evaluation determinant,
    after adjoining the finitely many points or constants needed to witness it.
    Finite algebraic independences in characteristic zero are retained by nonzero differential wedges.
    Include the full initial-field model itself through its stratum/normal-variable identification.
    This ensures that preservation of the initials is a statement in the full initial field,
    rather than only a list of numerical equalities.
  #emph[The geometric generic component and Taylor data.] Spread the smooth component chart at $g =
    xi$ as a subvariety of the total initial-field model over the enlarged constants.
    Retain geometric integrality of the selected component, the field identifications,
    the local normal equations $u' = g - xi$, the differential conditions,
    and the restrictions of the specified functions and forms to that component.
    For a specified Taylor leading exponent, the monomial ideal of exponents strictly above it is finitely
    generated. The required leading expansion is a finite congruence modulo this ideal.
    A congruence first obtained in the completion contracts to the local ring, by faithful flatness of completion.
    Thus it too can be spread, together with any required nonzero scalar leading coefficient.
    Apply this to a numerator and a denominator if necessary.
    Later shift products only multiply these predetermined leading expressions.
    Their possibly $P_0$-dependent multiplicities cause no new condition on the spread.
    This retains the relative form, the Taylor flag formula, and the actual-to-initial identification simultaneously.
  #emph[Entire spaces at finite cutoffs.] The angular space $V_m$ is a finite module over $k \[ Z \]$.
    At each of the finitely many tested degrees, choose module generators $e_(m \, t)$ and choose affine algebra
    generators $a_1 \, dots.h \, a_s$ of $k \[ Z \]$ vanishing at $z$.
    Both $v$ and $w$ are positive on these $a_j$, by the given barriers and the initial construction.
    Retain the module generation and these values after constant extension and reduction.
    There is a common $delta > 0$ that is a lower bound for all their $v$- and $w$-values;
    for $w$ it remains a lower bound, after a harmless decrease,
    on a small neighborhood of the chosen positive weights. If $frak(a) = \( a_1 \, dots.h \, a_s \)$,
    every element of $frak(a)^N V_m$ has both values at least
  $ N delta + min_t { v \( e_(m \, t) \) \, w \( e_(m \, t) \) } . $
  Choose $N$ so this exceeds every relevant upper cutoff. The same estimate holds after reduction,
    and locally for $w$. Modulo this tail, the finite span of $a^alpha e_(m \, t)$ with $\| alpha \| <
    N$ represents all of $V_m$.
  Choose bases of that finite span adapted separately to the two valuation filtrations.
    Retain the relations, change-of-basis matrices, values, and linear independence of initials in each same-value
    slice. The last condition prevents cancellation of a least-valued slice for any nonzero coefficient vector
    over the extended constants. Therefore the retained finite spans have exactly the same filtration dimensions,
    gaps, and specified cutoff inclusions. Combined with the tail estimate,
    these statements hold for every element of $V_m$ through the specified cutoffs.
    For the high-$v$-cost subspace use its retained finite basis.
    A lower $w$-bound with strict margin persists under a small change of positive weights by continuity of each
    basis value; the tail remains above the same bound. This proves also the local assertion.
    Only these finite comparisons are transported; no global optimization or infinite ratio test is asserted in
    the reduction. ◻
]

=== 12.5 Applying the strict budget and accounting for all factors <applying-the-strict-budget-and-accounting-for-all-factors>

#thm([Proposition 12.6.])[
  (Budgeted actual outputs).  #emph[Apply the strict budget (11.5) on the geometric generic field of $K_w$ over
    the independent probes $g$, choosing the optional $macron(U)_j$ to include generators of the relative field.
    Assume each probe has a fixed angular lift $g_j = overline(G_j)$ with $G_j in V_(d_j)$.
    Any prescribed shift is assumed to satisfy the Taylor leading-term hypothesis of Lemma 60 and to have an
    expansion in fixed homogeneous factors with angular lifts and bounded factor counts divided by $P_0$.
    Clear all the rational exponents by one positive integer $k_I$.
    The trace product may be chosen so that the multiplicities of the active factors in its lift $H$ are
#[#set math.equation(numbering: n => "(12.5)")
 $ \( P_0 - 1 \) tau_i alpha_i \, wide tau_i gt.eq 0 \, wide sum_i tau_i = 1 quad upright("or") quad
   sum_i tau_i lt.eq 1 med upright("if the cap is active") . $ <eq:E10>]

 The multiplicity of a tiny factor $macron(U)_j$ is at most $\( P_0 - 1 \) e_j$.
   Expanding the Taylor flags adds between zero and $P_0 - 1$ copies of each probe.
   Every surviving homogeneous initial summand has an actual traced output $F'$ of degree at most its total
   physical input degree divided by $P_0$, plus $n$. At the chosen $w$ its value satisfies equality in (12.3);
   on a local affine continuation in the same open stratum cone the lower inequality remains available.]
  #emph[Common mandatory factors included in every generator of the input system remain in every product and every
    expanded summand. All output spaces and finite cutoff comparisons needed for this conclusion may be chosen
    before $frak(p)$ and $P_0$, from bounds for the normalized factor counts.]
] <c:trace-budget>

#proof[
  Choose $k_I$ so that $k_I alpha_i$ and $k_I e_j$ are positive integers.
    On the relative field take the system consisting of
  $ macron(F)_i^(k_I alpha_i) product_j macron(U)_j^(l_j) \, wide 0 lt.eq l_j lt.eq k_I e_j \, $
  for each active index $i$; if the cap is active include also the same products with initial active factor $1$.
    The minimum of a valuation on this system, divided by $k_I$, is exactly
  $ min_(i med upright("active")) alpha_i P \( macron(F)_i \) + sum_j e_j min { 0 \, P \( macron(U)_j \) } \, $
  with zero included in the minimum for the active cap. Its ratios include each $macron(U)_j$,
    by comparing the exponents $0$ and $1$ while holding the other choices fixed.
    The field-generation provision in (11.5) therefore makes the system birational.
    Equation (11.5) is exactly the hypothesis (12.1) for this fixed system.
  Apply Lemma 57 and choose a surviving product of $N_I = \( P_0 - 1 \) \/ k_I$ generators.
    If $N_i$ occurrences use the active index $i$, put $tau_i = N_i \/ N_I$.
    Then its $macron(F)_i$ exponent is $N_i k_I alpha_i = \( P_0 - 1 \) tau_i alpha_i$, proving (12.5).
    A cap occurrence accounts for the possible deficit in $sum_i tau_i$.
    The bound for the $macron(U)_j$ exponents follows from $N_I k_I e_j = \( P_0 - 1 \) e_j$.
  Lift this product using the same full initial factors and multiply by the Taylor flags of (12.4),
    and by any shift prescribed in the application. Each flag expands over the extended constants as a linear
    combination of $g_j^a$ with $0 lt.eq a lt.eq P_0 - 1$. More generally,
    expand every prescribed shift in its fixed list of homogeneous factors,
    with the Taylor leading term required by Lemma 60. Lemma 60 supplies full initial-field survival.
    For every homogeneous summand whose initial trace survives,
    Lemma 58 produces the actual trace and its initial with equality in (12.3).
    Multiplying actual lifts puts the input in $V_M$, where $M$ is the sum of their physical degrees,
    and Lemma 59 gives $m' lt.eq M \/ P_0 + n$. These surviving initials span the full initial-field output,
    as explained after Lemma 60.
  If, in a later application, every system generator is multiplied by $product_a macron(B)_a^(k_I beta_a)$,
    with nonnegative rational $beta_a$ and integral $k_I beta_a$,
    then every selected product contains $product_a macron(B)_a^(\( P_0 - 1 \) beta_a)$.
    These factors also remain in each term after expanding flags and shifts.
    Selection of a surviving term therefore retains all mandatory factors,
    including their degree and value contributions.
  Finally fix the finite lists of factors and their actual lifts before reduction.
    Their physical degrees, values at the tested valuations and, when needed,
    Lipschitz bounds on the given continuation are now known.
    For any additional shifts, include their separately verified bounds on normalized factor counts among these
    data. Each multiplicity is then bounded by a fixed constant times $P_0$.
    Summing and dividing by $P_0$, the degree estimate and equality at $w$ give predetermined output degree and
    $w$-value bounds; the rounding term $n$ is also fixed. The required $v$-filtration cutoffs are chosen before
    reduction as well. The same accounting is applied separately to every term in the expansions of flags and
    shifts. Any output spaces, their $v$-filtration cutoffs, and high-$v$-to-high-$w$ inclusions used later are
    retained in their entirety by Lemma 61, before $frak(p)$ and $P_0$ are chosen.
    Thus they cover every possible later output coefficient vector,
    without having to lift that particular vector to characteristic zero.
  The normalized contributions of the tiny factors are bounded by the fixed finite data times $e_j$.
    Those from replacing $kappa \/ b_i$ by $alpha_i$ are bounded by the same finite data times the approximation
    errors, since the $tau_i$ lie in the simplex of (12.5). As in the construction of (11.5),
    first choose the positive $e_j$ sufficiently small and then approximate sufficiently closely to respect any
    prescribed finite tolerances. This controls physical degrees,
    values and Lipschitz changes on the already specified continuation.
    The strict budget is kept during these choices. Neither uniform comparison for varying pairs nor a global
    characteristic-$frak(p)$ optimizer is used. ◻
]

=== 12.6 Proof of relative trace existence <proof-of-relative-trace-existence>

#proof[
  #emph[The cone and its sub-klt boundary.] Introduce an indeterminate $u$, put $S = k \[ I u \]$,
    and let $R_c$ be the normalization of $S$ in its fraction field.
    The ratios of $I$ generate $L$, so $"Frac" \( S \) = L \( u \)$.
    Finite normalization gives a nonnegatively graded normal affine domain $R_c$ with $\( R_c \)_0 = k$.
    The conductor is a nonzero homogeneous ideal; multiplying a nonzero homogeneous conductor element by a
    positive-degree element if necessary, choose $d_c$ of positive degree with
  $ 0 eq.not d_c in R_c \, wide d_c R_c subset S . $
  Set
  $ Theta = nu and d log u \, wide K^Theta = "Div"_(R_c) \( Theta \) \, wide Delta_c = - K^Theta + 1 /
    n "Div" \( f \) - 1 / k_I "Div" \( u \) . $
  In particular $K^Theta + Delta_c$ is rational-principal.
  We verify that $\( "Spec" R_c \, Delta_c \)$ is sub-klt. An invariant prime valuation $D$ centered on $"Spec"
    R_c$ is Gaussian in $u$ over $L$. Its restriction to $L$ is either trivial or a positive multiple of a prime
    divisorial valuation $P$. For the latter assertion, the restriction has rational rank one,
    and the residue-transcendence-degree inequality for $L \( u \) \/ L$,
    together with Abhyankar equality for $D$, forces Abhyankar equality for the restriction.
    We allow the positive multiple in the notation $P$; (12.1) is homogeneous and therefore applies to it.
    The logarithmic differential formula (5.1) gives
  $ A_(R_c \, Delta_c) \( D \) = A_theta.alt \( P \) + frac(D \( u \), k_I) . $
  Since $D \( F u \) gt.eq 0$ for every $F in I$, we have $D \( u \) gt.eq - min P \( I \)$,
    and the displayed discrepancy is positive by (12.1). If the restriction is trivial, set $A_theta.alt \( 0 \) =
    0$. Then $D \( u \) gt.eq 0$, and equality would make the Gaussian valuation $D$ trivial;
    hence again the discrepancy is positive. These tests suffice:
    an equivariant log resolution of the homogeneous divisor data has invariant divisor components,
    because a connected torus cannot permute a finite set nontrivially.
    All the divisors on this resolution consequently have positive log discrepancy, which is the sub-klt criterion.
  #emph[An effective boundary and multiplier-ideal membership.] Choose a homogeneous $0 eq.not h_c in R_c$ such that
  $ Delta' = Delta_c + "Div" \( h_c \) gt.eq 0 . $
  We record a construction that also makes every coefficient of $Delta'$ at most one.
    Each coefficient of $Delta_c$ on $"Spec" R_c$ is strictly less than one.
    If they are all nonnegative, take $h_c = 1$. In particular, when $L = k$,
    the ring is $k \[ u \]$ and the sole boundary coefficient is $1 - 1 \/ k_I$. Otherwise $dim R_c gt.eq 2$.
    At the finitely many negative prime components $Q_i$ write $a_i = ceil.l - "coeff"_(Q_i) Delta_c ceil.r$,
    and use the homogeneous ideal
  $ frak(a) = ⋂_i Q_i^(\( a_i \)) . $
  Its minimum order is $a_i$ at $Q_i$ and zero at every other height-one prime, as follows by localization.
    Choose homogeneous generators of $frak(a)$. Multiply each by all products of the degree-one generators $I
    u$ that bring it to one sufficiently large common degree.
    The resulting finite system retains the same minimum order at every height-one prime.
    Indeed no such prime contains all of $I u$: by the finite extension from $S$,
    the inverse image of the vertex has codimension $dim R_c gt.eq 2$.
    A general combination attains the prescribed minimum orders at the finite support of $Delta_c$.
    Away from that support the system has no fixed prime divisor,
    and Bertini on the smooth basepoint-free open makes any new divisorial zeros reduced.
    This gives the asserted $h_c$ and boundary.
  Write $cal(J)$ for the multiplier ideal, allowing a fractional ideal for a non-effective sub-pair. Sub-klt gives
  $ R_c subset.eq cal(J) \( R_c \, Delta_c \) . $
  For example, this containment follows on a log resolution by rounding up the relative discrepancy divisor,
    whose coefficients are greater than $- 1$. Cartier translation therefore yields
  $ cal(J) \( R_c \, Delta' \) = h_c cal(J) \( R_c \, Delta_c \) supset.eq h_c R_c . $
  Only the membership of $h_c$ is needed. The fractional multiplier ideal of a non-effective sub-klt boundary need
    not equal the structure sheaf.
  #emph[Comparison and the full family of Cartier maps.] Apply the fixed-pair multiplier/test-ideal comparison to
    the effective pair $\( "Spec" R_c \, Delta' \)$. Its hypotheses hold because
  $ K^Theta + Delta' = 1 / n "Div" \( f \) - 1 / k_I "Div" \( u \) + "Div" \( h_c \) $
  is rational-principal, with index dividing $n k_I$; neither klt of $Delta'$ nor an independent
    $bb(Q)$-Gorenstein hypothesis on $R_c$ is required. The comparison is #cite(label("Takagi")) Theorem 3.2;
    the dense-open form with the big test ideal is recalled in #cite(label("DFDTT")) Theorem 11, applied with $Z =
    0$. Thus, on a sufficiently general reduction to a finite residue field of characteristic $frak(p) equiv
    1 med \( mod med n k_I \)$, the image of $h_c$ belongs to the big test ideal $tau_b \( R_c \, Delta' \)$.
  We use the following characterization: on an $F$-finite normal domain the big test ideal of an effective
    rational divisor pair is the smallest nonzero ideal preserved by all restricted maps
  $ "Hom"_(R_c) #h(-0.16667em)
    (F_(*)^e R_c #scale(x: 120%, y: 120%)[\(] ceil.l \( frak(p)^e - 1 \) Delta' ceil.r
    #scale(x: 120%, y: 120%)[\)] \, R_c) \, wide e gt.eq 1 . $
  This is #cite(label("SchwedeNonQG")) Definitions 3.15–3.16 and Theorem 3.18,
    with the divisor-pair identification in its Remarks 3.10 and 3.17.
    The log-$bb(Q)$-Cartier comparison with the usual test ideal is also recorded in #cite(label("Takagi"))
    Theorem 2.8(2) and #cite(label("SchwedeNonQG")) Remark 6.1.
  In the reduction define
  $ T^e \( b \) = frac(cal(C)^e \( b Theta \), Theta) \, wide L_e =
    R_c #scale(x: 120%, y: 120%)[\(] \( 1 - frak(p)^e \) \( K^Theta + Delta' \) #scale(x: 120%, y: 120%)[\)] . $
  We use the convention $R_c \( D \) = { b in "Frac" \( R_c \) : "Div" \( b \) + D gt.eq 0 }$, so explicitly
  $ L_e = f^(\( frak(p)^e - 1 \) \/ n) u^(- \( frak(p)^e - 1 \) \/ k_I) h_c^(frak(p)^e - 1) R_c . $
  All the allowed maps of degree $e$ are exactly $T^e \( r thin dot.op \)$, $r in L_e$.
    Here every $\( frak(p)^e - 1 \) Delta'$ is integral, because $frak(p) - 1$ is divisible by $n k_I$;
    thus this statement describes the full allowed family in every Frobenius degree,
    with no rounding or omitted degrees. This is the divisor–Frobenius-map correspondence
    #cite(label("SchwedeFAdjunction")) Corollary 3.10 and Theorems 3.11, 3.13.
    We check it in the chosen trivialization to fix the normalization.
    On the fraction field a nonzero Frobenius-linear functional generates all such functionals by input
    multiplication. At a smooth codimension-one point, Cartier trace for a regular canonical generator in ordinary
    coordinates extracts the monomial with all exponents $frak(p)^e - 1$.
    Multiplication and trace give the perfect pairing on the Frobenius basis,
    also after an étale change of coordinates. Changing the canonical generator to $Theta$ twists the multiplier
    by the $\( 1 - frak(p)^e \)$-th power of its coefficient.
    Allowing the poles prescribed by $\( frak(p)^e - 1 \) Delta'$ gives precisely $L_e$ at that height-one point.
    Normality makes these codimension-one conditions sufficient globally.
  #emph[A compatible ideal and homogeneous extraction.] Set $T^0 = "id"$, $L_0 = R_c$, and
  $ J = sum_(l gt.eq 0) T^l \( d_c h_c L_l \) subset R_c . $
  This is an ideal: ordinary multiplication can be moved inside $T^l$ by $a T^l \( b \) =
    T^l \( a^(frak(p)^l) b \)$. It is nonzero, since its degree-zero Frobenius summand is $d_c h_c R_c$.
    It is preserved by every allowed map. Indeed, if $a_s in L_s$ and $a_l in L_l$, composition gives
  $ T^s #scale(x: 120%, y: 120%)[\(] a_s T^l \( d_c h_c a_l \) #scale(x: 120%, y: 120%)[\)] =
    T^(s + l) #scale(x: 120%, y: 120%)[\(] d_c h_c a_s^(frak(p)^l) a_l #scale(x: 120%, y: 120%)[\)] \, wide
    L_s^(frak(p)^l) L_l subset.eq L_(s + l) . $
  In particular the conductor factor stays present. The minimality characterization therefore gives
    $tau_b \( R_c \, Delta' \) subset.eq J$. A comparison localized at the homogeneous vertex would already
    suffice: compatibility localizes, because Hom localizes and denominators move inside trace after taking
    Frobenius powers.
  The ideal $J$ is homogeneous. Indeed log-$u$ trace kills a homogeneous input whose degree is not divisible by
    $frak(p)^l$, and otherwise divides its degree by $frak(p)^l$.
    Thus local membership of the homogeneous element $h_c$ also gives global membership:
    multiply by a vertex unit, and project the result to degree $deg h_c$;
    the unit’s nonzero constant part is the only contribution in that degree. We conclude $h_c in J$.
  For $P_0 = frak(p)^l$ the input factor $h_c L_l$ contains $h_c^(P_0)$.
    Dividing the finite trace identity for $h_c in J$ by $h_c$, using Frobenius-linearity in every summand, gives
  $ 1 in sum_(l gt.eq 0) T^l (f^(\( frak(p)^l - 1 \) \/ n) u^(- \( frak(p)^l - 1 \) \/ k_I) d_c R_c) . $
  Project to homogeneous degree zero. The term with $l = 0$ contributes nothing,
    since $d_c$ has positive degree and $R_c$ is nonnegatively graded.
    At least one term with $l gt.eq 1$ has nonzero degree-zero output. It arises from a homogeneous element
  $ H u^(\( P_0 - 1 \) \/ k_I) in d_c R_c subset k \[ I u \] . $
  Consequently $H in "span" \( I^(\( P_0 - 1 \) \/ k_I) \)$.
    The log-$u$ coefficient formula identifies its nonzero output with (12.2).
    Additivity and perfectness of the constants let us choose a single product in that span with nonzero output.
  #emph[The reduction choices.] Spread the finite normalization algebra, its generators and inclusions,
    its birational field identification, the conductor, the forms, and all the boundary data together.
    Shrinking the base preserves geometric normality, grading, codimension-one orders, effectivity of $Delta'$,
    and the displayed rational-principal log canonical relation.
    For the form and divisor identities, spread their rational sections on smooth opens,
    or on the chosen resolving model, and retain codimension at least two for the complements used in
    codimension-one tests downstairs. The fixed-pair comparison above then holds on a sufficiently general open of
    this spread. These requirements are compatible with any finite additional open conditions.
    A nonempty open of a finite-type integral base of characteristic zero has nonempty fibers at all sufficiently
    large primes; choose arbitrarily large primes $frak(p) equiv
    1 med \( mod med n k_I \)$ and closed points in those fibers.
    Their residue fields are finite and hence $F$-finite. After the trace identity has been obtained,
    extension to algebraically closed perfect constants preserves it, and preserves its particular nonzero output,
    by the coefficient formula and faithful scalar extension. This proves the lemma. ◻
]

The relative nonvanishing input is now established. Together with the lifting and finite-space arguments,
  it proves the budgeted-output conclusions of Proposition 62,
  which we apply next to move the cheap probe values to zero and then to bound all angular values.

== 13 Collapsing the cheap parameters <c:cheap-section>

This section has two outputs. First we move the cheap probe values to zero while retaining a lower bound on every
  angular section and a bounded form discrepancy. We then prove a two-sided bound for all angular values at
  valuations Gaussian on the cheap probes, vanishing there,
  and satisfying the scaled lower bound and the stated discrepancy bound.
  The bridge is the cost gap from Proposition 41: it forces certain traced outputs of bounded degree and cost to
  have exactly zero value. The two-sided estimate will supply the lower dimension bound in the next section.

We continue with the actual field $K$, the fractional form $theta$,
  and the nested multiplicative angular systems $V_m$. Degrees are nonnegative multiples of $n$,
  and the cost of a nonzero $F in V_m$, with this assigned degree, is $b \( F \) = m + v \( F \)$.
  In particular, changing the assigned degree changes the cost.
  We retain the uniform comparison $m lt.eq C b \( F \)$ for positive costs.
  Constants denoted by $C$ may increase, but are uniform along the chosen sequence.
  Let $y = \( y_1 \, dots.h \, y_r \)$ be actual angular lifts of the cheap probes in (9.12) and (10.1).
  Their degrees and costs are uniformly bounded; their initials at $v$ are algebraically independent.
  Thus $v$ is Gaussian on $y$, and the vector $v \( y \)$ ranges in a fixed bounded set.
  As in the preceding section, the notation $P_0 = frak(p)^(ell_0)$ refers to a Frobenius power in a reduction of
  characteristic $frak(p)$; it is unrelated to the auxiliary cone dimension $p$.

=== 13.1 A translated-box count <a-translated-box-count>

A section-dimension bound will control the number of distinct values of powers of one trace output multiplied by
  cheap probe monomials. The following count turns that control into a rational linear expression in the probe
  values, with bounded denominator and coefficients. These coefficient bounds will control the slope of the
  optimization objective.

#thm([Lemma 13.1.])[
  #emph[Fix $r gt.eq 1$ and $A > 0$. There are constants $N_0 \, D_0 \, C_0$, depending only on $r \, A$,
    with the following property. Let $T gt.eq 1$, let $t_1 \, dots.h \, t_r$ be linearly independent over $bb(Q)$,
    and let $s in bb(R)$. For an integer $N gt.eq N_0$, set $L = ceil.l N T ceil.r$. Suppose that
$ \# { a s + alpha dot.op t : 0 lt.eq a < N \, quad alpha in { 0 \, dots.h \, L - 1 }^r } lt.eq A \( N T \)^r . $

 Then $s = gamma dot.op t$ for a unique $gamma in bb(Q)^r$.
   The order of $gamma$ in $bb(Q)^r \/ bb(Z)^r$ is at most $D_0$, and $\| gamma \| lt.eq C_0 T$.]
] <c:cheap-box-count>

#proof[
  If $s$ is outside the rational span of the $t_j$, all $N L^r$ displayed values are distinct.
    This contradicts the bound once $N > A$. Otherwise write $s = gamma dot.op t$,
    uniquely by independence of $t$. The distinct values are precisely the distinct vectors $a gamma + alpha$.
    If $D$ is the order of $gamma$ modulo $bb(Z)^r$, these vectors occupy $min \( N \, D \)$ disjoint lattice
    cosets, each containing a box of $L^r$ points. Consequently $min \( N \, D \) L^r lt.eq A \( N T \)^r lt.eq
    A L^r$; taking $N > A$ bounds $D$ by a constant $D_0$.
  Use only $a = 0 \, D \, 2 D \, dots.h \, q D$, where $q = floor.l \( N - 1 \) \/ D floor.r$.
    For a coordinate $j$, the projections of the corresponding boxes are integer intervals of length $L$,
    whose successive displacement is $D gamma_j in bb(Z)$. Their union has
  $ L + q min \( L \, D \| gamma_j \| \) $
  points. Over each such point, one of the boxes supplies $L^(r - 1)$ points in the remaining coordinates.
    Hence $q min \( L \, D \| gamma_j \| \) lt.eq \( A - 1 \) L$.
    Choose $N_0$ so large, in terms of $A \, D_0$, that $q > A + 1$ and $q D gt.eq N \/ 2$.
    The minimum cannot equal $L$, and therefore
  $ \| gamma_j \| lt.eq frac(\( A - 1 \) L, q D) lt.eq C_0 T . $
  Increasing $C_0$ gives the asserted norm bound. If $A < 1$, the hypothesis is empty,
    so this case causes no exception. ◻
]

=== 13.2 Moving the cheap weights to zero <moving-the-cheap-weights-to-zero>

#thm([Proposition 13.2.])[
  #emph[There are fixed sufficiently large positive constants $B_0$ and $kappa$ such that every sufficiently late
    member of the sequence admits a monomial valuation $w_c$, Gaussian on $y$, satisfying
$ w_c \( y \) = 0 \, wide A_theta \( w_c \) lt.eq kappa \, wide w_c \( F \) + B_0 m gt.eq 1 /
  2 b \( F \) quad \( 0 eq.not F in V_m \) . $

 The choices are made in the order $B_0$, then $kappa$, before passing to a sufficiently late member.]
] <c:cheap-collapse>

#proof[
  If $r = 0$, take $w_c = v$ and $B_0 gt.eq 1$; the assertion is immediate. Assume henceforth that $r > 0$.
    Use (11.1) with cap $q_(*) = 1$, barrier $q_(upright("bar")) = 1 \/ 8$, and budget scalar $B_(*) = B_0$.
    Write $L \( t \) = min cal(L)$ under the Gaussian constraint $w \( y \) = t$.
    At $t = v \( y \)$ the competitor $v$ has $A_theta \( v \) = 0$ and $q \( v \) = 1$ when $B_0 gt.eq 1$.
    Since $A_theta gt.eq 0$ and $q lt.eq 1$, this gives $L \( v \( y \) \) = - kappa$.
    We shall move $t$ along the segment from $v \( y \)$ to zero.
    Work in a fixed bounded open parameter region containing all these segments,
    and consider the part where $L \( t \) < - kappa \/ 2$. Every optimizer there has $q > 1 \/ 2$.
    Thus it lies strictly above the barrier, and the openness, continuity,
    and local polyhedral properties of the constrained optimization apply.
  Take a full-dimensional cell, a point $t$ with rationally independent coordinates,
    and the tiebroken optimizer $w$ there. Fix its local affine continuation by optimizers with the same active
    mask. Apply Corollary 56 and Proposition 62 on the geometric generic fibre over the $w$-initials $g =
    macron(y)$, without further Taylor shifts. Select a homogeneous summand with surviving full-initial-field
    trace and lift its factors to the actual field in a reduction.
    The continuation is fixed before choosing the tiny exponents and rational approximations to $kappa \/ b_i$.
    Choose them so that, after division by $P_0$, their total errors in degree, value,
    and Lipschitz variation on that continuation are bounded by a fixed small constant.
    For the resulting nonzero traced output $F' in V_(m')$, put
  $ tau = sum_i tau_i \, wide rho = sum_i tau_i m_i / b_i lt.eq C . $
  Here the $tau_i$ are the active multiplicities in (12.5); $tau lt.eq 1$,
    and $tau < 1$ is possible only when the cap is active. The degree bound and the equality case of (12.3) give
  #[#set math.equation(numbering: n => "(13.1)")
   $ m' & lt.eq C + kappa rho \,\
w \( F' \) & = \( 1 - P_0^(- 1) \) #scale(x: 120%, y: 120%)[\(] kappa tau q - kappa B_0 rho -
  A_theta \( w \) #scale(x: 120%, y: 120%)[\)] + O \( 1 \) . $ <eq:F1>]
  Indeed, every active input satisfies $w \( F_i \) = q b_i - B_0 m_i$.
    The Taylor flag factors from (12.4) have exponents between zero and $P_0 - 1$ in the expanded summands.
    Their normalized degrees and values, and their slopes because $w_(tilde(t)) \( y \) = tilde(t)$, are bounded.
    All formulas used here are among the finite chart and filtration data retained before reduction.
    The constants in the following counting argument are independent of the large fixed $B_0 \, kappa$.
  Set $T_0 = C + 1 + kappa rho$, increasing the constant in (13.1) if necessary.
    For a sufficiently large fixed integer $N$, consider
  $ \( F' \)^a y^alpha \, wide 0 lt.eq a < N \, quad 0 lt.eq alpha_j < N T_0 \, quad alpha_j in bb(Z) . $
  These products lie in a common nested degree $O \( N T_0 \)$ and have values at most $C' \( kappa + T_0 \) N$.
    The same upper bound, after a fixed enlargement, holds near $t$ on the chosen continuation.
    Their number of distinct values is at most $C'' \( N T_0 \)^r$.
    To justify this last assertion uniformly, before selecting the output transfer the filtration comparisons for
    every degree up to $C''' N \( 1 + kappa \)$. At each such degree $m$, the original high-cost part $b > S_0$ has
  $ w > S_0 \/ 2 - B_0 m \, $
  whereas (10.1) bounds the dimension of its quotient by $C_4 \( 1 + m \)^r$.
    For fixed $N \, B_0 \, kappa$, the right side of the value inequality exceeds all the required upper cutoffs
    on late members. Retain this implication with slack by the finite-filtration spreading argument,
    including the zero vector in each high-cost subspace. Its strict margin persists locally on the continuation.
    The quotient by values above the tested cutoff therefore has the same dimension bound in the reduction.
    Distinct values below the cutoff give independent classes in this quotient, proving the count.
  Lemma 63 now yields
  $ w \( F' \) = gamma dot.op t \, wide gamma in bb(Q)^r \, wide "ord"_(bb(Q)^r \/ bb(Z)^r) \( gamma \) lt.eq
    D_0 \, wide \| gamma \| lt.eq C' \( 1 + kappa rho \) . $
  The same linear expression holds on a neighborhood of $t$ on the affine continuation.
    Indeed, after fixing $F'$, the same count applies at nearby rationally independent parameters,
    with the same bounds. There are only finitely many rational vectors of bounded norm and denominator.
    At $t$ their evaluations are distinct. Continuity of monomial evaluation therefore excludes all but the
    central vector on a sufficiently small neighborhood; density of rationally independent parameters extends its
    formula to that whole neighborhood.
  Because $t$ is bounded, this gives $w \( F' \) gt.eq - C' \( 1 + kappa rho \)$.
    In (13.1) use $A_theta \( w \) gt.eq 0$ and $q \, tau lt.eq 1$. Since $1 - P_0^(- 1) gt.eq 1 \/ 2$, we obtain
  $ kappa \( B_0 - C' \) rho lt.eq C'' \( 1 + kappa \) . $
  Thus $rho lt.eq C''' \/ B_0$ once $B_0$ and then $kappa$ are sufficiently large.
  We next differentiate the trace inequality, using equality at the central point rather than assuming equality
    throughout the continuation. Denote its lifted input by $G$ and its valuations by $w_(tilde(t))$. The function
  $ D \( tilde(t) \) = w_(tilde(t)) \( F' \) - P_0^(- 1) w_(tilde(t)) \( G \) + \( 1 - P_0^(- 1) \)
    A_theta \( w_(tilde(t)) \) $
  is nonnegative near $t$, by (12.3), and $D \( t \) = 0$ by the surviving initial trace.
    Active entries retain $w_(tilde(t)) \( F_i \) = b_i q \( w_(tilde(t)) \) - B_0 m_i$.
    Consequently the variation of their normalized contribution is $\( 1 - P_0^(- 1) \) kappa thin d
    q$ up to the chosen small Lipschitz error. If $tau < 1$, the cap is active and $d q = 0$,
    so the same statement holds. The flag contributions and the remaining errors have a uniformly bounded
    Lipschitz constant.
  The optimizer value $L$ is affine on this cell and $w_(tilde(t)) \( F' \) = gamma dot.op tilde(t)$.
    Subtracting $D \( t \) = 0$ from the inequality at $t + h$ therefore gives
  $ gamma dot.op h + \( 1 - P_0^(- 1) \) nabla L dot.op h gt.eq - C \| h \| . $
  Using $- h$ gives the reverse bound. Together with the bounds on $gamma$ and $rho$, these inequalities imply
  #[#set math.equation(numbering: n => "(13.2)")
   $ \| nabla L \| lt.eq C_5 \( 1 + kappa \/ B_0 \) . $ <eq:F2>]
  All degree and cutoff bounds used in this deduction are uniform.
    The individual reductions, Frobenius powers, and approximations may depend on the optimizer;
    no uniform choice of these is required.
  Let $D_y$ bound the lengths of the segments from $v \( y \)$ to zero.
    Choose first $B_0$ so that $D_y C_5 \/ B_0 < 1 \/ 4$, and then $kappa$ so that $D_y C_5 < kappa \/ 4$,
    with strict room in both inequalities. Integrating (13.2) keeps $L$ strictly below $-
    kappa \/ 2$ throughout any portion of the segment reached so far.
    The bound on generic full-dimensional cells also applies along nongeneric segments by continuity and local
    polyhedrality. At a first limiting endpoint, compactness of the relevant sublevels supplies a feasible
    optimizer with the same strict objective bound. Openness then extends the continuation,
    so the whole segment is reached. At the endpoint $q gt.eq 1 \/ 2$ and $A_theta \( w_c \) = L \( 0 \) +
    kappa q lt.eq kappa$, which proves the proposition. ◻
]

=== 13.3 Exact vanishing from a cost gap <exact-vanishing-from-a-cost-gap>

The following elementary limiting argument will turn a bounded initial-value output into an output of exactly zero
  value at the collapsed valuation. The conclusion is stronger than convergence of those values to zero.
  In the two-sided estimate below, a prescribed power of the tested function will occur in every trace input.
  Once the trace output has value zero, the lower trace inequality will bound that prescribed factor’s
  contribution from above.

#thm([Lemma 13.3.])[
  #emph[For each sequence index $i$, let $V_(m \, i)$ be nested multiplicative $k_i$-linear subspaces of a field,
    containing $1 in V_(0 \, i)$, and let $v_i \, w_i$ be real valuations trivial on $k_i$.
    Suppose there are $r$ probes $y_(j \, i)$ of uniformly bounded degree, Gaussian for both valuations,
    such that $\| v_i \( y_(j \, i) \) \|$ is uniformly bounded and $w_i \( y_(j \, i) \) = 0$.
    Suppose also that there are $M_i \, S_i \, R_i arrow.r oo$ and a fixed $C_4$ with the following properties in
    every tested degree $m lt.eq M_i$. Costs $b_i \( F \) = m + v_i \( F \)$ are nonnegative,
$ { b_i : C_4 m < b_i lt.eq S_i } = diameter \,\
dim_(k_i) #scale(x: 120%, y: 120%)[\(] V_(m \, i) \/ { F : b_i \( F \) > S_i } #scale(x: 120%, y: 120%)[\)] lt.eq
  C_4 \( 1 + m \)^r \,\
b_i \( F \) > S_i med arrow.r.double med w_i \( F \) > R_i . $

 The high-cost subspaces include zero, whose value is $+ oo$.
   Then any sequence of nonzero $F_i$ of bounded degree and bounded $v_i \( F_i \)$ satisfies $w_i \( F_i \) =
   0$ eventually.]
] <c:cheap-exact-zero>

#proof[
  Suppose that the asserted vanishing fails. Restrict to a subsequence on which $w_i \( F_i \) eq.not 0$,
    and choose a nonprincipal ultrafilter $cal(U)$ on it. Let $k_(cal(U)) = product_(cal(U)) k_i$. The nested union
  $ A = union.big_m product_(cal(U)) V_(m \, i) $
  is a $k_(cal(U))$-algebra, because the spaces are nested and multiply with addition of degrees.
    Membership in this union means that the degree is bounded independently of $i$;
    it does not permit an unbounded sequence of degrees. Define
  $ I = { a = \( a_i \) in A : v_i \( a_i \) arrow.r_(cal(U)) + oo } . $
  In a fixed degree $m$, nonnegative cost gives $v_i \( a_i \) gt.eq - m$.
    This uniform lower bound, the triangle inequality, and additivity on products show that $I$ is an ideal.
    It is proper because it does not contain $1$. It is prime:
    if neither $a$ nor $b$ belongs to $I$, each has a finite upper valuation bound on a $cal(U)$-large set;
    their product has such a bound on the intersection of those sets. Thus $A \/ I$ is a domain.
  Every $a in I$ also satisfies $w_i \( a_i \) arrow.r_(cal(U)) + oo$.
    This implication uses the gap, not just slow growth of the cutoffs.
    Indeed, represent $a$ in one fixed degree $m$. Divergence gives $b_i \( a_i \) > C_4
    m$ on a $cal(U)$-large set. The gap excludes all costs between this bound and $S_i$,
    hence $b_i \( a_i \) > S_i$ there. The last hypothesis then gives $w_i \( a_i \) > R_i arrow.r oo$.
  The image in $A \/ I$ of degree $m$ has dimension at most $C_4 \( 1 + m \)^r$ over $k_(cal(U))$.
    To see this, take more than this many elements and representatives in $V_(m \, i)$.
    The finite quotient-dimension bound gives, at each sufficiently large $i$,
    a nontrivial linear combination in the high-cost subspace.
    There are finitely many coefficients; on a $cal(U)$-large set one fixed coefficient can be normalized to $1$.
    The resulting coefficient sequences define constants in $k_(cal(U))$,
    and the combination has $v_i arrow.r_(cal(U)) oo$. It therefore gives a nontrivial dependence modulo $I$.
  Let $hat(y)_j$ denote the classes of the probes in $A \/ I$.
    They are algebraically independent over $k_(cal(U))$. For a nonzero polynomial with coefficients in
    $k_(cal(U))$, choose representatives of its finitely many nonzero coefficients.
    On a $cal(U)$-large set they remain nonzero. Gaussianity at $v_i$ evaluates that polynomial by the minimum of
    finitely many fixed monomial weights in the $v_i \( y_(j \, i) \)$.
    Those weights are uniformly bounded, so the polynomial does not belong to $I$.
  It follows that $"Frac" \( A \/ I \)$ is algebraic over $k_(cal(U)) \( hat(y)_1 \, dots.h \, hat(y)_r \)$.
    Otherwise some element of $A \/ I$ would be transcendental over that field.
    This element and the $r$ probes lie in some fixed nested degree.
    Their monomials with every exponent at most $N$ would be linearly independent,
    giving $\( N + 1 \)^(r + 1)$ independent elements in a degree $O \( N \)$,
    contrary to the established $O \( N^r \)$ bound. This also proves the assertion when $r = 0$.
  The bounded degree and bounded $v_i$-value of $F_i$ show that its class $hat(F)$ in $A \/ I$ is nonzero.
    Its minimal polynomial over the cheap rational field therefore has nonzero leading and constant coefficients.
    Clearing denominators yields
  $ sum_(a = 0)^(d_0) h_a \( hat(y) \) hat(F)^(thin a) = 0 \, wide h_a in k_(cal(U)) \[ Y_1 \, dots.h \, Y_r \] \,
    wide h_0 h_(d_0) eq.not 0 . $
  Choose representatives of all its finitely many scalar coefficients and lift this relation to $A$.
    Its residual belongs to $I$, so its $w_i$-value tends to $+ oo$ along $cal(U)$.
    For every nonzero $h_a$, Gaussianity on $y_i$ over the whole constant field $k_i$,
    together with $w_i \( y_i \) = 0$, gives $w_i \( h_(a \, i) \( y_i \) \) = 0$ on a $cal(U)$-large set.
    Intersect these finitely many sets. If $w_i \( F_i \) > 0$,
    the constant term is the unique least term of the lifted relation, of value zero.
    If $w_i \( F_i \) < 0$, its highest-degree term is uniquely least, of negative value.
    In either case the residual has value at most zero, a contradiction.
    No positive lower bound on $\| w_i \( F_i \) \|$ is used.
  The relation was obtained after forming the ultraproduct, but this does not reverse the order of the choices.
    Its supports, its coefficients after denominator clearing,
    and all its products have some fixed finite nested degree $m_0$.
    The hypotheses were retained for every $m lt.eq M_i$, with $M_i arrow.r oo$,
    so they already apply to $m_0$ on a tail. The proof does not require spreading this newly chosen relation.
    The contradiction on any contrary subsequence proves ordinary eventual vanishing, as asserted. ◻
]

=== 13.4 Two-sided angular budgets <two-sided-angular-budgets>

#thm([Proposition 13.4.])[
  #emph[Fix the constant $B_0$ of Proposition 64 and a positive constant $c$.
    For each sufficiently small fixed $delta > 0$, consider any actual monomial valuation $w$, Gaussian on $y$,
    such that $w \( y \) = 0$, $A_theta \( w \) lt.eq 1$, and
#[#set math.equation(numbering: n => "(13.3)")
 $ w \( F \) + delta B_0 m gt.eq c delta b \( F \) wide \( 0 eq.not F in V_m \) . $ <eq:F3>]

 For all sufficiently late sequence members, uniformly over all these valuations and angular functions,
#[#set math.equation(numbering: n => "(13.4)")
 $ \| w \( F \) \| lt.eq C_6 delta b \( F \) . $ <eq:F4>]

 The constant $C_6$ is independent of the small fixed $delta$;
   the index after which the assertion holds may depend on $delta$.]
] <c:cheap-two-sided>

#proof[
  The lower bound follows from (13.3) and $m lt.eq C b \( F \)$.
    Degree-zero units have zero value at $w$ by centering, so they also satisfy the assertion.
    To prove the upper bound uniformly, consider an arbitrary sequence of tests $w \, F$ with $b = b \( F \) > 0$.
    We may pass to subsequences throughout. A contradiction for every sequence violating one uniform upper bound
    gives the stated uniform conclusion.
  Return to the leading construction at $v$, and let $macron(F)$ be the $v$-initial of $F$,
    of charge $beta in M_0$. The occurring weight comparisons give $parallel beta parallel lt.eq C b$,
    and positive costs are bounded away from zero. By (9.7), choose an actual angular $G$ whose initial has charge
    $- d' beta$, for a positive integer $d'$, and whose degree $m_G$ and cost are at most $C d' b$. Thus
  $ u = macron(F)^(thin d') macron(G) in K_1 \, wide "div"_(S_1) \( u \) + M H_1 gt.eq 0 \, wide M = d' m +
    m_G lt.eq C d' b \, $
  by purity and (6.3). Here $M > 0$: if $M = 0$, both degrees vanish and the opposite proportional charges have
    opposite proportional costs, one strictly positive, contradicting nonnegative degree-zero costs.
  Work on a geometric generic fibre field of $K_v$ over the cheap initial probes $macron(y)$.
    For a prime-divisor valuation $Q$ there, over the geometric generic constants,
    restrict first to $K_v$ and then put $P = Q \|_(K_1)$. The algebraic-extension and relative Abhyankar argument
    of (11.4) shows that $P$ is trivial or prime-divisorial up to scaling.
    In particular, restriction preserves Abhyankar equality, and a nontrivial subgroup of the discrete value group
    remains discrete. Moreover, $P$ is trivial on $K_f$: the cheap residual probes contain a transcendence basis
    of $K_f$, and the remaining extension is algebraic. We have
  #[#set math.equation(numbering: n => "(13.5)")
   $ frac(P \( u \), d') lt.eq C b #scale(x: 120%, y: 120%)[\(] H_1 \( P \) +
     s_exp A_1^(+) \( P \) #scale(x: 120%, y: 120%)[\)] \, wide A_(theta_(v \, upright("rel"))) \( Q \) gt.eq
     A_1^(+) \( P \) . $ <eq:F5>]
  The first inequality is (9.5) applied to the effective pure divisor just constructed.
    For the second, first apply the relative-form comparison in (11.4),
    then invariantize the restriction to $K_v = K_1 \( upright(bold(z))_0 \)$ by (11.2). The form is
  $ theta_v = plus.minus frac(omega_S and d log upright(bold(z))_0, f_h^(1 \/ n)) \, $
  so the Gauss extension of $P$ has discrepancy exactly $A_1^(+) \( P \)$.
    Equality in the second inequality of (13.5) therefore requires the restriction to $K_v$ itself to be Gaussian
    over $P$ in these torus variables.
  Fix a large $ell$ with $1 \/ ell lt.eq delta$, before taking the sequence limit.
    We now construct a strict trace budget in which the factors $macron(F) \, macron(G)$ are mandatory.
    Give them respective rational exponents
  $ u_0 in \[ ell \/ b \, 2 ell \/ b \] \, wide u_0 \/ d' . $
  Choose a sufficiently divisible $D in n bb(Z)_(> 0)$ for which $D H_1$ is free Cartier.
    A basis of this complete pure angular system has minimum order $- D H_1 \( P \)$ at every $P$,
    by freeness and (6.3). Lift it by charge-zero angular functions and give its minimum a rational exponent in
    $\[ K_0 ell \/ D \, 2 K_0 ell \/ D \]$, where $K_0$ is a sufficiently large fixed constant.
    The mandatory contribution equals $u_0 P \( u \) \/ d'$ and is at most $C
    ell \( H_1 \( P \) + s_exp A_1^(+) \( P \) \)$. The pure system subtracts at least $K_0 ell H_1 \( P \)$.
  For $P eq.not 0$, choose $K_0 > C$ and then take a sufficiently late member so that $C ell s_exp < 1 \/ 2$.
    Since $H_1 \( P \) \, A_1^(+) \( P \)$ are nonnegative and their sum is positive,
    these contributions have sum strictly less than $A_1^(+) \( P \)$,
    and hence less than $A_(theta_(v \, upright("rel"))) \( Q \)$. For $P = 0$, both contributions vanish.
    Failure of strictness would force equality in (13.5), so the restriction to $K_v$ would be a Gauss valuation
    over the trivial valuation of $K_1$. That restriction is nontrivial,
    by the algebraic-extension argument in (11.4); hence some torus basis weight is nonzero.
    Add finite minimum systems consisting of $1$ and angular initials of both signs of the basis charges,
    allowing multiples as supplied by (9.7). One of their minima is negative in each such direction.
    Give each an arbitrarily tiny positive rational exponent.
    Finally add systems $\( 1 \, macron(U) \)$ for angular initials generating the relative field,
    again with arbitrarily tiny positive rational exponents, as in (11.5).
    These extra minima are nonpositive everywhere, make the budget strict also when $P = 0$,
    and retain birationality through their ratios.
  Clear all rational denominators. The resulting finite system $I$ and integer $k_I$ satisfy (12.1).
    Every member of $I$ contains the mandatory factors, while products of the finite minimum systems realize
    exactly the specified remaining minimum orders. Because all terms have the same mandatory factor,
    retaining the field-generating ratios is unaffected by that factor.
    Choose the tiny exponents to make their total normalized degree and absolute initial-value contributions
    bounded by a fixed constant. These choices may depend on the individual test.
  Before invoking trace existence, also choose the following finite data in its reductions.
    Along the sequence take slow cutoffs
  $ M_i arrow.r oo \, wide M_i lt.double S'_i lt.eq S_(0 \, i) \, wide S'_i arrow.r oo \, wide R'_i arrow.r oo . $
  For every degree $m lt.eq M_i$, retain nonnegative costs, the exclusion of all costs in $C_4 m < b lt.eq S'_i$,
    and the quotient-dimension bound $C_4 \( 1 + m \)^r$ from (10.1). Retain also
  $ b > S'_i quad arrow.r.double quad w > R'_i . $
  This is possible by (13.3): its lower bound is $c delta S'_i - delta B_0 M_i$ on these high parts,
    and we choose $R'_i$ below this bound with slack. Here $delta$ is fixed and $S'_i$ dominates $M_i$.
    The finite-filtration comparisons from the preceding section retain these statements for whole spaces over the
    enlarged reduced constant field, using adapted bases and high module tails.
    There are only finitely many degrees and cutoffs at each index.
    Slowing the diagonal choices as necessary allows all of them to be retained before choosing $P_0$ or a traced
    output.
  We also retain Gaussianity on $y$ at both valuations over the entire new constant field,
    with bounded $v \( y \)$ and $w \( y \) = 0$. This does not follow merely from preserving finitely many
    polynomial tests. On each of the two monomial charts, write the probe initials as rational functions of the
    stratum coordinates and independent normal variables. In characteristic zero these initials are algebraically
    independent. Retain their finite expressions and a nonzero differential minor witnessing this independence,
    together with smooth chart data and separating residue coordinates.
    A sufficiently general large-characteristic reduction preserves that minor and those separating conditions.
    Over the perfect extended constants the reduced initials are therefore still algebraically independent.
    This proves the Gaussian rule for every polynomial over those constants,
    including coefficients chosen later and varying with $i$.
    The actual charts at $v \, w$, the form identities, the prescribed input functions,
    and their needed values are spread simultaneously with these data.
  Now apply (12.2) and (12.4) at $v$. A surviving full-initial-field trace,
    followed by homogeneous expansion and selection of a surviving term,
    lifts to an actual nonzero traced output $F'$ in the reduction.
    All its input degrees and absolute $v$-values, after division by $P_0$, are at most $C ell$.
    Indeed, $m \, \| v \( F \) \| lt.eq C b$ and $m_G \, \| v \( G \) \| lt.eq C d' b$;
    multiplication by $u_0$ and $u_0 \/ d'$ respectively cancels these costs.
    The pure system has degree $D$ and initial value zero, while its exponent times $D$ is at most $2 K_0 ell$.
    The tiny systems were chosen with bounded normalized contributions,
    and the Taylor flags contribute bounded amounts. The degree bound for actual trace and the equality case of
    (12.3), using $A_theta \( v \) = 0$, therefore give
  $ m' lt.eq C ell + n \, wide \| v \( F' \) \| lt.eq C ell . $
  These are bounds before knowing which surviving term is selected; no bound on the Frobenius iterate is needed.
  Apply Lemma 65 to these reduced systems, with $S_i = S'_i$ and $R_i = R'_i$.
    Its hypotheses were retained before trace existence, and $ell$ is fixed,
    so the output degree and initial value are uniformly bounded. It follows that
  $ w \( F' \) = 0 $
  eventually. In particular, this is an exact statement even if a hypothetical sequence of nonzero output values
    were tending to zero. The diagonal degree tests and full Gaussianity are precisely what allow the lemma to
    handle the polynomial relation chosen later.
  Finally apply only the lower inequality of (12.3) at $w$ to the product traced to this $F'$.
    The mandatory input power of $F$ is exactly $F^(\( P_0 - 1 \) u_0)$,
    by denominator clearing and the chosen characteristic congruence.
    Every remaining factor has value at least $- delta B_0$ times its degree by (13.3) and the retained
    comparisons; constants have value zero. Their total degree divided by $P_0$ is at most $C ell$.
    The chart calculation also retains the value of $F$ and $A_theta \( w \) lt.eq 1$. Hence
  $ 0 = w \( F' \) gt.eq \( 1 - P_0^(- 1) \) #scale(x: 120%, y: 120%)[\(] u_0 w \( F \) -
    1 #scale(x: 120%, y: 120%)[\)] - C delta B_0 ell . $
  Since $1 - P_0^(- 1) gt.eq 1 \/ 2$, $u_0 gt.eq ell \/ b$, and $1 \/ ell lt.eq delta$, this yields
  $ w \( F \) lt.eq b #scale(x: 120%, y: 120%)[\(] ell^(- 1) + 2 C delta B_0 #scale(x: 120%, y: 120%)[\)] lt.eq
    C_6 delta b . $
  The constants are independent of small fixed $delta$ and of the chosen sequence of tests.
    This proves the upper bound and completes (13.4). ◻
]

== 14 Expensive layers, rank growth, and the contradiction <c:rank-section>

The bounded-width coordinates now have value zero. We extend their independent initials through the remaining
  width layers, while keeping discrepancy small and making the new coordinate values integral.
  Once there are $d$ independent initials, a section count bounds the denominator of the entire value group.
  This produces the prime divisor that contradicts $epsilon.alt$-log canonicity.
  The completion proof at the end of this section chooses the tolerances and the final small scaling after all
  uniform size bounds have been established. Proposition 71 uses a separate large-degree limit on one fixed member
  of the sequence.

After reordering and passing to a subsequence, partition the unbounded widths $W_j$ into successive layers.
  The widths in one layer are comparable to a scale $S arrow.r oo$,
  and each scale divided by the next tends to zero. All cheap widths are comparable to $1$.
  If every width is cheap, the valuation $w_c$ constructed in the preceding section is Gaussian of value zero on a
  full transcendence basis. It is therefore trivial on its rational field and on the algebraic extension $K$,
  contradicting its positive barrier on $frak(m)_z$. We may assume that an expensive layer exists.

For a small fixed scaling $delta > 0$, use the optimization of (11.1) with

#[#set math.equation(numbering: n => "(14.1)")
 $ B_(*) = delta B_0 \, wide q_(*) = delta \/ 4 \, wide q_(upright("bar")) = delta \/ 16 \, wide
   cal(L)_delta \( w \) = A_theta \( w \) + delta^(- 1) \( q_(*) - q \( w \) \) . $ <eq:G1>]

Only finitely many fixed scalings will be needed before taking the sequence limit.
  We work with objective bounds strictly below $1 \/ 8$. At every such optimizer,

$ q \( w \) > delta \/ 8 \, wide A_theta \( w \) < 1 \, $

because both summands in (14.1) are nonnegative. At the cheap parameters $t = 0$,
  the starting optimum is at most $delta kappa$: use $delta w_c$, whose barrier is at least $delta b \/ 2$,
  so the cap is attained.

Consider a layer with scale $S$, and let $s$ be the number of axes up to and including this layer.
  Inductively, the old probes, from cheap and preceding layers,
  are actual angular functions of degree and $v$-cost at most $C W_j$, and their Gaussian parameters are integral,
  satisfy $\| t_j \| lt.eq C delta W_j$, and are zero on the cheap axes.
  Suppose the old minimum of $cal(L)_delta$ is less than $1 \/ 8$.
  Constants below may depend on previous size bounds and fixed width comparabilities,
  but not on the small fixed $delta$. Choose an optimizer $w$ with the tie rule from Section 11.
  The two-sided estimate (13.4) applies to it.

For $J gt.eq 1$, let $E_J subset K_w$ be the span of the homogeneous $w$-initials of elements of
  $V_(ceil.l J S ceil.r_n)$ with value at most $K_2 delta J S$.
  Here $ceil.l x ceil.r_n$ denotes the least nonnegative multiple of $n$ at least $x$,
  and $K_2$ is a sufficiently large fixed constant. Nesting of the systems makes these spaces nested in $J$.

#thm([Lemma 14.1.])[
  (Layer dimension).  #emph[For every fixed $J gt.eq 1$, on sufficiently late members,
#[#set math.equation(numbering: n => "(14.2)")
 $ dim E_J asymp J^s product_(j lt.eq s) S / W_j . $ <eq:G2>]

 The comparison constants are independent of $J$ and $delta$; the required lateness may depend on both.]
] <c:layer-dimension>

#proof[
  At the tested degree, the barrier $q > delta \/ 8$ sends costs $b > C' J S$,
    for a sufficiently large fixed $C'$, to values $w > K_2 delta J S$.
    Equation (9.12) bounds the quotient through the former cost by a constant times the right side of (14.2),
    since fixed $J S$ is negligible compared with widths in subsequent layers. This proves the upper bound.
    In particular the quotient by $w > K_2 delta J S$, with zero included in the high part, is finite-dimensional.
    Its dimension equals $dim E_J$, by taking initials on its successive value slices.
    Distinct occurring values already give independent quotient classes.
  For the lower bound, the original independent probe boxes following (9.12) and (10.1) give products with exponents
  $ 0 lt.eq a_j lt.eq ⌊c' J S \/ W_j⌋ wide \( j lt.eq s \) \, $
  for a sufficiently small fixed $c' > 0$. After nesting, they lie in the tested physical degree.
    They are independent, and their $v$-Gaussianity bounds the cost of every nonzero linear combination by $C'' J
    S$. Equation (13.4) bounds its absolute $w$-value by $C_6 C'' delta J S$.
    Taking $K_2$ above this constant makes their span inject into the quotient.
    Their number is bounded below by the required box product. ◻
]

#thm([Proposition 14.2.])[
  (Rank increase in a layer).  #emph[There is a bounded $J$, independent of the small fixed $delta$,
    such that the old probe initials extend to $s$ algebraically independent homogeneous initials in $E_J$.
    Their actual lifts can be chosen with degree and cost $O \( S \)$, and absolute $w$-value $O \( delta S \)$.]
] <c:rank-increase>

#proof[
  Choose a fixed $J_0 gt.eq 1$ whose space contains the old probe initials; their widths are $o \( S \)$.
    Suppose the transcendence degrees of the fields generated by $E_(J_0)$ and $E_N$ are equal to $a < s$,
    where $N$ is a sufficiently large fixed integer to be chosen in terms of $J_0$.
    The dimension of $E_N$ grows as $N^s$ times the layer box factor in (14.2).
    We will encode its elements by Taylor orders in $a$ variables and scale their order polytope by $1 \/ N$.
    This loses only a factor $N^a$. Trace will put the resulting independent outputs into a degree and value
    budget independent of $N$, contradicting the upper section count when $a < s$.
  Choose a transcendence basis $g = \( g_j \)_(j lt.eq a)$ from the homogeneous generators of $E_(J_0)$,
    extending the old probes, with their actual lifts in that budget.
    If $a = 0$, every element of $E_N$ is algebraic over the algebraically closed constant field,
    so $dim E_N lt.eq 1$. This contradicts (14.2) for large $N$, since $S \/ W_j$ is bounded below for $j lt.eq
    s$. Assume henceforth $a > 0$. The finite space $E_N$ lies in a finite separable extension of $k \( g \)$.
  Extend constants independently to $k' = overline(k \( xi \))$, with $xi_1 \, dots.h \, xi_a$ independent,
    and use the generic component at $g = xi$ from the Taylor construction (12.4). Put $u'_j = g_j - xi_j$.
    Every nonzero pre-extension element of the finite algebraic field is a unit at the generic point of this
    component. Its Taylor expansion has coefficients in $k'$.
    Indeed take its separable polynomial over $k \( g \)$. At this generic specialization the coefficients are
    regular, the chosen root remains simple, and its residue lies in the algebraically closed field $k'$.
    Simple-root lifting gives the unique formal solution in $k' \[ \[ u' \] \]$.
    This also describes all $k'$-linear combinations.
  This operation keeps full Taylor series, not merely residue values.
    Geometric integrality preserves linear independence under the independent constant extension,
    and the local completion is injective on the functions under consideration.
    For example the independent functions $1 \, g_j$ expand as $1 \, xi_j + u'_j$,
    rather than being replaced by $1 \, xi_j$. Thus the extended $E_N$ retains its dimension and has exactly
    $dim_k E_N$ distinct lexicographic Taylor orders. Each leading-order slice has dimension one over $k'$,
    since its leading coefficient is a scalar; elimination then gives the equality of counts.
    These orders lie in $bb(Z)_(gt.eq 0)^a$ and contain $0$ and all standard basis vectors, using $1 \, u'_j$.
  Let $cal(P)$ be their convex hull. It is full-dimensional and
  $ "vol" \( cal(P) \) gt.eq c_d dim E_N . $
  To verify this bound even when many points lie on faces, triangulate using all the given lattice points as
    vertices, inserting them by successive subdivisions. Every such vertex lies in a full simplex,
    so there are at least $dim E_N \/ \( a + 1 \)$ full simplices. Each lattice simplex has volume at least $1 \/ a !$.
  Translation averaging gives $z' in \[ 0 \, 1 \]^a$ such that $z' +
    cal(P) \/ N$ contains at least $"vol" \( cal(P) \) \/ N^a$ lattice points $b'$. They are nonnegative.
    For each occurring order $alpha_h$ choose an element $h'$ of the extended $E_N$ with that order and a nonzero
    scalar leading coefficient. Retain their finite Taylor leading data and their expressions in homogeneous
    initials with actual lifts, together with those of $g$, in the spread for (12.2)–(12.4).
  We require shifts for whatever Frobenius power $P_0 = frak(p)^(ell_0)$, $ell_0 gt.eq 1$,
    that construction later supplies. Write
  $ N \( b' - z' \) = sum_h lambda_h alpha_h \, wide lambda_h gt.eq 0 \, wide sum_h lambda_h = 1 . $
  Use $h'$ to exponent $k_h = floor.l P_0 lambda_h \/ N floor.r$. The remaining Taylor order is
  $ P_0 b' - sum_h k_h alpha_h & = P_0 z' + sum_h {frac(P_0 lambda_h, N)} alpha_h . $
  It is integral and componentwise nonnegative. Its $j$-th coordinate is at most $P_0 + sum_h \( alpha_h \)_j$,
    hence at most $2 P_0$ once $frak(p)$ exceeds the finitely many coordinate sums.
    This one choice works for every $ell_0 gt.eq 1$. Fill the remainder by powers of $u'_j$.
    The resulting shift has exact Taylor order $P_0 b'$, a nonzero scalar leading coefficient,
    total $E_N$ multiplicity at most $P_0 \/ N$, and at most $2 P_0$ filler factors per coordinate.
  Use Corollary 56 and Proposition 62 over the probes $g$, with $kappa = 1 \/ delta$, at the same old optimizer.
    Only the old probes are optimization constraints; enlarging the list for the relative field does not alter
    this optimization. Apply every shift to the same surviving relative input and the same trace power from
    (12.2). The full initial-field outputs have the distinct Taylor orders $b'$,
    so are independent over the enlarged perfect constants. Their common relative leading coefficient may be
    nonconstant in the residue field; it is nonzero, which is all that distinct-order independence needs.
    Semilinearity only takes the $P_0$-th roots of scalar coefficients.
  Expand the inputs in homogeneous angular initials and discard summands with zero initial-field trace.
    Each remaining summand lifts by equality in (12.3) to an actual output initial.
    Its physical degree and value satisfy
  $ m' lt.eq C_7 \( 1 + J_0 \) S \, wide w \( F' \) lt.eq C_7 \( 1 + J_0 \) delta S . $
  These estimates are termwise. Each $E_N$ generator has degree at most $ceil.l N S
    ceil.r_n$ and value at most $K_2 delta N S$, and there are at most $P_0 \/ N$ occurrences.
    The filler factors and the flags of (12.4) use the $E_(J_0)$ budget with at most $3 P_0$ occurrences per axis.
    Expand $g_j - xi_j$ as a probe plus a scalar before estimating; both terms satisfy that budget.
    Likewise use the fixed bounded homogeneous expressions for each $h'$,
    so no cancellation is needed to improve an upper estimate.
  The active terms of (12.5), after division by $P_0$, cost only $O \( 1 \/ delta \)$ in degree and $O \( 1 \)$ in
    value. Indeed $m_i \/ b_i$ is bounded and $w \( F_i \) = q b_i - delta B_0 m_i$.
    The tiny factors and active-exponent approximation errors can be made arbitrarily small.
    Since $delta$ is fixed before $S arrow.r oo$, these contributions are negligible in the displayed budgets.
    Apply (12.3) with equality, using $A_theta \( w \) gt.eq 0$, and its degree bound.
  Consequently the independent initial-field outputs belong to the span of actual output initials in those two
    budgets. Before choosing the characteristic, pad to one nested degree dominating $C_7 \( 1 + J_0 \) S$,
    retain the cost-dimension bound through $C' \( 1 + J_0 \) S$ at $v$,
    and retain the inclusion of the larger-cost subspace into values strictly above the required cutoff at $w$.
    The barrier $q > delta \/ 8$ gives this inclusion with margin for sufficiently large fixed $C'$.
    Lemma 61, with the budget accounting of Proposition 62, therefore bounds that output span in reduction by
  $ C_8 \( 1 + J_0 \)^d product_(j lt.eq s) S \/ W_j . $
  It applies to all coefficient vectors of this predetermined space, not to a list of outputs chosen after $P_0$.
    On the other hand, the number of distinct orders $b'$ is at least
  $ c N^(s - a) product_(j lt.eq s) S \/ W_j $
  by (14.2). Choose $N$ large in terms of $J_0$ and the preceding constants, independently of $delta$.
    These bounds contradict each other.
  Thus rank increases from $E_(J_0)$ to $E_(N \( J_0 \))$ unless it has reached $s$.
    Iterate, setting the next $J_0$ equal to that $N$, at most $s$ times, all at the same optimizer.
    Choose the new probes among the homogeneous generators, extending the old list.
    Their degree is $O \( S \)$; the barrier bounds their cost by $C S$ and their value below by $-
    delta B_0 O \( S \)$, while the defining cutoff bounds it above by $C delta S$.
    Their initials are independent, so $w$ is Gaussian on the enlarged list. This proves all assertions. ◻
]

#thm([Proposition 14.3.])[
  (Slopes after a rank increase).  #emph[For the enlarged optimization with $s$ probes,
    on full-dimensional generic cells with $\| t_j \| lt.eq C delta W_j$ and minimum $< 1 \/ 8$,
#[#set math.equation(numbering: n => "(14.3)")
 $ lr(|partial_(t_j) min cal(L)_delta|) lt.eq C_9 thin S \/ W_j wide \( j lt.eq s \) . $ <eq:G3>]

 The same assertion holds in slightly enlarged fixed parameter boxes and at each of the later fixed scalings.
   In particular the new-coordinate slopes are uniformly bounded independently of the small fixed $delta$.]
] <c:layer-slopes>

#proof[
  We repeat the slope mechanism from the proof of Proposition 64,
    using rectangular probe boxes whose side lengths reflect the widths $W_j$.
    We retain its central trace equality and nearby lower inequality.
    Here even cheap parameters may vary, so the lower section barrier supplies the upper dimension count without
    using (13.4). Choose a generic parameter $t$ whose coordinates are $bb(Q)$-linearly independent,
    and an optimizer with the tie rule. Use its affine continuation with fixed stratum cone and active mask from
    Proposition 54. Apply Corollary 56 and Proposition 62 over $overline(y)$,
    and lift a surviving initial trace by (12.3). Its actual output $F'$, in the reduction, satisfies
  $ m' lt.eq C' S \, wide w \( F' \) lt.eq C' delta S . $
  The active contributions cost $O \( 1 \/ delta \)$ and $O \( 1 \)$ in the two budgets.
    The flag powers divided by $P_0$ cost $O \( S \)$ and $O \( delta S \)$, by the probe and parameter bounds.
    Choose tiny factors and approximation errors after knowing this continuation,
    including their Lipschitz errors. For fixed $delta$, the claimed bounds follow on late members.
  Fix a sufficiently large integer $N$, and consider
  $ \( F' \)^h y^alpha \, wide 0 lt.eq h < N \, wide 0 lt.eq alpha_j < L'_j := ceil.l N S \/ W_j ceil.r . $
  They lie in one nested degree $O \( N S \)$ and have upper value $O \( delta N S \)$.
    After enlarging the bounds, these statements hold nearby on the same continuation,
    by continuity after $F'$ is chosen. The quotient dimension through that value is at most $C''
    product_(j lt.eq s) L'_j$. Indeed, before applying (12.2),
    retain (9.12) in that predetermined degree and the inclusion of costs $b > C''' N S$ into larger $w$-values,
    with strict margin. The barrier $q > delta \/ 8$ supplies this inclusion,
    and fixed $N S$ is smaller than all subsequent widths. The constants do not depend on $N \, delta$.
    Finite-space transfer with margin gives the same bound locally on the reduced continuation.
  There are therefore at most $C''' product_(j lt.eq s) L'_j$ distinct product values.
    At independent $t$, this forces a unique expression $w \( F' \) = gamma dot.op t$ with $gamma in bb(Q)^s$:
    otherwise all $N$ layers have different values, contradicting the count for large $N$.
    We record the quantitative consequence. Let $D'$ be the order of $gamma$ in $bb(Q)^s \/ bb(Z)^s$.
    Modulo $bb(Z)^s$, the first $N$ translated boxes have $min \( N \, D' \)$ distinct classes,
    each with $product_j L'_j$ points. Thus $D'$ is uniformly bounded.
    Restricting $h$ to multiples of $D'$, the union of projections to coordinate $j$ contains
  $ L'_j + floor.l \( N - 1 \) \/ D' floor.r min \( L'_j \, D' \| gamma_j \| \) $
  points, since these are translates of an integer interval.
    Over each projected point lies a full box with $product_(l eq.not j) L'_l$ points in the other coordinates.
    Comparison with the total bound, for sufficiently large uniformly chosen $N$, gives
  $ \| gamma_j \| lt.eq C S \/ W_j . $
  The same argument works at nearby independent parameters on the continuation.
    There are only finitely many possible rational vectors with the stated denominator and coordinate bounds.
    Uniqueness at the central independent parameter and continuity therefore show that,
    in a neighborhood of that parameter,
  $ w_(tilde(t)) \( F' \) = gamma dot.op tilde(t) $
  with this same $gamma$.
  Let $G$ be the input term lifted for $F'$. Equation (12.3) makes
  $ w_(tilde(t)) \( F' \) - frac(w_(tilde(t)) \( G \), P_0) + \( 1 - 1 \/ P_0 \) A_theta \( w_(tilde(t)) \) $
  nonnegative nearby and zero centrally. In the active part of $w_(tilde(t)) \( G \) \/ P_0$,
    each $w_(tilde(t)) \( F_i \)$ varies by $b_i thin d q$. Equation (12.5) says that the resulting variation is
    $\( 1 - 1 \/ P_0 \) d q \/ delta$, up to an arbitrarily small Lipschitz slope error.
    If the cap is active, $d q = 0$. Tiny systems give arbitrarily small further slope errors,
    while the flag powers in (12.4) have bounded slopes. All these formulas use the chosen characteristic-zero
    continuation and its chart valuations in reduction; finite input data are retained and errors are chosen after
    that continuation is known, as in the proof of (13.2). The displayed nonnegative function has a local minimum
    at the central point. Using both signs of variation, the formula for $w_(tilde(t)) \( F' \)$, and (14.1),
    bounds the objective slope by $C S \/ W_j$. Here bounded extra slopes are absorbed because $S \/
    W_j$ is bounded below. This proves (14.3) on the generic cells.
  Openness, continuity, and local polyhedrality on the strict sublevel set extend this bound to changes along
    segments varying only the new coordinates, even when the old coordinates are fixed at nongeneric values.
    Equivalently, approximate such a segment by generic ones,
    apply the bound piecewise on the finitely many local cells, and pass to the limit using compact sublevels.
    The assertions concerning enlarged boxes and later fixed scalings follow from the same estimates. ◻
]

#thm([Proposition 14.4.])[
  (Integral rounding).  #emph[For every absolute tolerance $sigma > 0$,
    a rank increase followed by a bounded integral scaling and rounding of the new parameters changes a small
    objective bound according to
#[#set math.equation(numbering: n => "(14.4)")
 $ e_(upright("new")) = K \( sigma \, d \) e_(upright("old")) + C_10 sigma . $ <eq:G4>]

 Old parameters remain integral and cheap parameters remain zero.
   The constants for probe and parameter sizes remain uniform at every later fixed scaling.]
] <c:integral-rounding>

#proof[
  Simultaneous Dirichlet approximation gives a positive integer $u lt.eq
    K \( sigma \, d \)$ for which every new parameter of $u t$ is within $sigma$ of an integer.
    For example, subdivide the unit cube into boxes of side at most $sigma$,
    apply the pigeonhole principle to the fractional parts of finitely many multiples of the new parameter vector,
    and subtract two multiples in the same box. Multiply $w \, t \, delta$ by this common $u$.
    Integrality of the old parameters is preserved. Both $q$ and $q_(*)$ scale by $u$,
    so the nonnegative penalty in (14.1) is unchanged; discrepancy scales by $u$.
    Thus the starting objective for the newly scaled enlarged optimization is at most $u e_(upright("old"))$.
  Move only the new parameters to the chosen integers along a line segment.
    Integrating (14.3) in the new coordinates adds at most $C_10 sigma$.
    Choose tolerances so that the full resulting bound is strictly less than $1 \/ 8$.
    If continuation had a first limiting endpoint, compact sublevels would supply a feasible optimizer there with
    this same strict bound, and local continuation would extend the segment. Hence the whole rounding is possible.
    At fixed scaling and tolerance, the rounding errors are negligible relative to $delta
    W_j$ in the new layer on sufficiently late members. The path therefore stays within slightly enlarged
    parameter boxes, and the stated size bounds persist under subsequent scaling. ◻
]

#thm([Proposition 14.5.])[
  (Bounded divisorial index).  #emph[At a final optimizer with $d$ independent probe initials and integral probe
    parameters, there is a uniformly bounded positive integer $e$ such that $e
    w$ is a positive integral multiple of a prime-divisor valuation over $X$.]
] <c:divisorial-index>

#proof[
  First bound the image of the value group of $w$ in $bb(R) \/ bb(Z)$.
    Choose any finite list of functions whose values represent distinct classes.
    Multiplying them all by a common denominator puts them in $V_0$ and translates all classes by the same amount,
    so they remain distinct. Multiply each function by all probe monomials in the boxes
  $ 0 lt.eq alpha_j lt.eq floor.l R \/ W_j floor.r \, wide 1 lt.eq j lt.eq d . $
  Here $R arrow.r oo$ on this one fixed member of the sequence. The resulting initials are linearly independent:
    between different functions their values are in disjoint classes modulo $bb(Z)$,
    since all probe values are integral; within one box Gaussianity of the probes gives independence.
  At a common nested degree $O \( R \)$ all these products have upper $w$-value $O \( delta R \)$.
    The constants are uniform by the size bounds, once $R$ is also large enough for the finitely many chosen
    function degrees and values. The barrier $q > delta \/ 8$ and (9.12) bound the dimension through this cutoff by
  $ C_11 product_(j = 1)^d \( 1 + R \/ W_j \) . $
  Comparing with the number of independent products and letting $R$ tend to infinity bounds the length of the
    finite list uniformly. Thus the image of the entire value group modulo $bb(Z)$ is a finite subgroup of
    uniformly bounded order. Its exponent is a uniformly bounded positive integer $e$, and $e w$ is integer-valued.
  Equation (13.3) makes $w$ nonzero on the degree-zero field.
    It is an Abhyankar valuation with center on $X$, as supplied throughout by monomialization.
    A nonzero discrete rank-one Abhyankar valuation is divisorial:
    on a monomial chart, the rational weight ray is extracted by a toric subdivision,
    and the corresponding primitive ray defines a prime divisor.
    Since $e w$ is integer-valued, it is a positive integral multiple of that prime-divisor valuation.
    This proves the claim. ◻
]

#proof[
  #emph[Completion of Proposition 3.] We now specify the order of all choices.
    The rank, probe-size, parameter-size, and slope constants in (14.2)–(14.3) can be bounded successively forward
    through the at most $d$ layers. These bounds are independent of the sufficiently small fixed scalings and
    rounding tolerances: each step uses only the preceding uniform size bounds,
    with fixed enlargements of their constants. Fix these constants first,
    including a final bound $C_12$ for the integer $e$ in Proposition 71.
  Prescribe objective tolerances backwards through (14.4). At each step choose $sigma$ first so that $C_10
    sigma$ is smaller than the desired next tolerance, then choose the previous objective bound so small that its
    product with $K \( sigma \, d \)$ fits the remaining allowance.
    Make every intermediate bound satisfy all strict-sublevel requirements,
    and make the final bound less than $epsilon.alt \/ \( 3 C_12 \)$.
    Only after these finitely many choices choose the initial $delta$ so small that $delta
    kappa$ is below the first starting tolerance. Require also that after every bounded possible product of the
    integer scalings, the resulting $delta$ remains small and satisfies
  $ delta B_0 < epsilon.alt \/ \( 3 C_12 \) . $
  Finally pass to sufficiently late members of the sequence.
    All estimates involve fixed scalings; only finitely many possible integer scaling products have to be accommodated.
  Cheap collapse, rank extension, and integral rounding then give a final optimizer with
  $ A_theta \( w \) < epsilon.alt \/ \( 3 C_12 \) \, wide A_X \( w \) lt.eq A_theta \( w \) + delta B_0 . $
  The second inequality is (6.7) and the budget barrier. By Proposition 71, write $e w = a "ord"_E$,
    where $E$ is a prime divisor over $X$, $a$ is a positive integer, and $e lt.eq C_12$. Consequently
  $ A_X \( E \) = e / a A_X \( w \) lt.eq e A_X \( w \) < epsilon.alt . $
  This contradicts the assumed $epsilon.alt$-log canonicity of $X$.
    Hence the sequence violating (2.1) cannot exist, proving Proposition 3. ◻
]

Theorem 1 follows by Lemma 4 and Lemma 5. The resulting complement index $N$ is distinct from the auxiliary degree
  $n$ fixed for the cone construction.

#bibliography("refs.bib", style: "ieee", title: [References])
