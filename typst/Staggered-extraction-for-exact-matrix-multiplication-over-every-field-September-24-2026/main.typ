#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Staggered extraction for exact matrix multiplication over every field]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a fixed field $bb(F)$, the matrix multiplication exponent $omega =
  omega_(bb(F))$ is the infimum of the real numbers $tau$ for which two $n times
  n$ matrices over $bb(F)$ can be multiplied using $O \( n^(tau + o \( 1 \)) \)$ scalar additions and
  multiplications. This exponent measures the asymptotic arithmetic cost of a central bilinear operation and of
  many algorithms built from it. The field is fixed throughout;
  constants in an arithmetic algorithm may depend on the field and on its chosen finite construction.

Strassen’s seven-product algorithm for $2 times 2$ matrices gave the subcubic exponent $log_2
  7$ #cite(label("Strassen1969")). Subsequent advances used tensors to record bilinear operations:
  tensor rank counts the products of linear forms needed to realize an operation.
  Approximate bilinear identities and their conversion to exact algorithms #cite(label("Bini1980")),
  Schönhage’s asymptotic sum inequality #cite(label("Schonhage1981")),
  and Strassen’s laser method #cite(label("Strassen1987")) established the main ingredients of this approach.
  The sum inequality converts a low-rank direct sum of matrix tensors into an exponent bound.
  The laser method constructs such direct sums by restricting powers of a tensor with low asymptotic rank.
  Coppersmith and Winograd combined these ideas with progression-free sets and introduced the tensor family used
  here #cite(label("CoppersmithWinograd1990")).

Passing to a larger tensor power gives more freedom in choosing the intermediate pieces before extracting matrix
  tensors from them. Stothers analyzed the fourth power, in work subsequently published with
  Davie #cite(label("Stothers2010")) #cite(label("DavieStothers2013")).
  Vassilevska Williams analyzed the eighth power, and Le Gall continued through the thirty-second
  power #cite(label("VassilevskaWilliams2012")) #cite(label("LeGall2014")).
  Alman and Vassilevska Williams then reduced the extraction loss that arises when prescribed marginal
  distributions permit several joint distributions, obtaining $omega < 2.3728596$ #cite(label("AlmanWilliams2024")).

A further source of loss is requiring entire variable blocks to be disjoint when the final matrix tensors need
  only disjoint subsets of those blocks. Duan, Wu, and Zhou used asymmetric hashing to reduce this
  #emph[combination loss] in the recursive analysis #cite(label("DuanWuZhou2023")).
  Vassilevska Williams, Xu, Xu, and Zhou allowed finer sharing of variables and extended recovery from deletions
  on all three sides to the restricted tensor products needed in the recursion #cite(label("VXXZ2023")).
  Alman, Duan, Vassilevska Williams, Xu, Xu, and Zhou then introduced successive compatibility tests that treat
  all three sides differently #cite(label("MoreAsymmetry2026")). These tests underlie the extraction studied here.

For a recent numerical comparison, Dupont et al. obtained $omega <
  2.371177$ by optimizing the eighth-power instance of this asymmetric framework,
  combining modern optimization with AlphaEvolve #cite(label("Dupont2026")).
  Version 3 of #emph[More Asymmetry Yields Faster Matrix Multiplication] records that improvement and credits the
  new parameters to Dupont et al. #cite(label("MoreAsymmetry2026")) Table 1.
  We prove the following bound over every fixed field.

#thm([Theorem 1.1.])[
  #emph[Over every fixed field $bb(F)$, the arithmetic exponent of square matrix multiplication satisfies
$ omega_(bb(F)) < 2.371054886006746 < 2.371054887 . $

]
] <thm:main>

The construction gives exact arithmetic algorithms, including in positive characteristic.
  Its finite choices are independent of the input matrices.
  The theorem concerns asymptotic arithmetic cost; the counting arguments and parameter choices do not give
  bit-complexity or practical crossover estimates.

=== 1.1 Proof overview <proof-overview>

We use the Coppersmith–Winograd tensor with parameter $5$, denoted $upright("CW")_5$.
  Section 2 defines it and proves that the rank of its $m$th tensor power is at most $7^m$ times a polynomial in
  $m$, over the original field. A #emph[strand of length $ell$] is a copy of $upright("CW")_5^(⊗ ell)$.
  On each side the variables of $upright("CW")_5$ are indexed by $0 \, dots.h \, 6$, with weights $0 \, 1 \, 1 \,
  1 \, 1 \, 1 \, 2$. A strand variable is a word of these indices,
  and a #emph[shape] records the weight sums on the three sides.
  We start with strands of length $8$ and split them successively into lengths $4$, $2$, and $1$.
  At each depth we restrict by shape. A shape with a zero coordinate already gives a matrix multiplication tensor;
  positive shapes pass to the next split.

===== 1.1.1 Combining capacities across depths. <combining-capacities-across-depths.>

An extraction restricts a tensor to a direct sum of specified tensor products.
  To make the outputs disjoint, its three side-assignment tests each impose a bound on the guaranteed logarithmic
  number of outputs; we call these bounds its #emph[directional capacities]. The guarantee uses their minimum.
  The constituent-stage analysis in #cite(label("MoreAsymmetry2026")) Theorem 6.4 already combines differently
  prescribed populations at one depth before taking this minimum.
  Our joint step also combines populations at different depths,
  provided their priority orders agree on the physical tensor sides.
  For their weighted capacity vectors $v_r in bb(R)^3$, the benefit of pooling across depths is expressed by

$ sum_r min_W v_(r \, W) med lt.eq med min_W sum_r v_(r \, W) . $

Thus a shortage on one side at one depth can be offset by capacity from another depth.

Section 3 proves this joint extraction by following the actual order of the tests.
  On the first side, variables are grouped by their sequences of strand or half-strand weight sums;
  these groups are the #emph[coarse blocks]. Each retained coarse block is assigned to a unique output.
  Compatibility with that assignment then determines which complete variables on the second and third sides can be
  retained. The result is a direct sum of the intended products with some variables deleted.
  Populations retain their ancestry and physical placement throughout,
  so each subsequent split receives its own prescribed distributions.

===== 1.1.2 Recovering outputs with inherited restrictions. <recovering-outputs-with-inherited-restrictions.>

Some variables are missing because an earlier extraction imposed type conditions,
  meaning conditions on empirical distributions of variable statistics.
  Others are deleted to resolve competing assignments in the current extraction.
  Earlier recovery arguments already treat three-side deletions and inherited type conditions
  #cite(label("VXXZ2023")) Section 7, #cite(label("MoreAsymmetry2026")) Section 6.5.
  Section 4 proves the form needed for our joint step. With $N$ the large strand-count parameter,
  the extraction selects outputs in which every orbit of complete variables under the allowed position
  permutations loses at most $C \/ N$ of its variables, uniformly over the orbits.
  Here $C$ depends only on the fixed population data and tolerances.
  Independent symmetry shifts then cover the ideal tensor. Partitioning variables by their presence in those
  shifts reconstructs every coefficient exactly once, over the original field.
  Only a subexponential number of independent input copies is needed.
  The recovered products can then be subdivided and used in further extractions.

===== 1.1.3 Staggering and the final rank comparison. <staggering-and-the-final-rank-comparison.>

A #emph[lot] contains $N$ length-$8$ strands. We stagger finitely many lots so that, at an interior time step,
  one lot is at each of the three splitting stages. Stage priorities balance the summed directional capacities.
  The work is partitioned among the six physical axis orders; one joint extraction acts on each part,
  and the six output counts multiply. Section 5 constructs this schedule, shown in Figure 1,
  and computes its finite boundary loss. Section 6 counts the common oriented dimensions of the terminal matrix
  tensors and combines these counts with the schedule to prove the total yield and rank comparison.

Write $H_0$ for the initial logarithmic yield, $C_(*)$ for the contribution of the three staggered stages,
  and $S_(*)$ for the terminal logarithmic matrix volume, all normalized per initial length-$8$ strand.
  The direct-sum rank inequality then gives

#[#set math.equation(numbering: n => "(1)")
 $ omega_(bb(F)) lt.eq frac(3 \( 8 log 7 - H_0 - C_(*) \), S_(*)) . $ <eq:intro-constraint>]

For each fixed number of lots, we first take the divisible strand count $N$ to infinity and remove approximation
  losses; the number of lots tends to infinity last. Thus the boundary cost vanishes without a uniform assertion
  for a growing schedule. The explicit rational data in Section 7 and Appendix 8 certify $S_(*) >
  0$ and place the ratio in (1) below the bound in Theorem 1.
  The complete parameter verifier and its rational-logarithm interval certificate accompany the source.
  The proof requires a single feasible choice of parameters, with no assertion that this choice is optimal.

== 2 Rank and the basic tensor <sec:foundations>

Fix an arbitrary field $bb(F)$. All tensor identities and linear maps below are over $bb(F)$,
  and all logarithms are natural. A tensor is viewed as a trilinear form in three disjoint sets of variables.
  Its rank $"R" \( T \)$ is the least number of products of three linear forms, one on each side,
  whose sum is $T$. A #emph[restriction] substitutes linear forms separately on the three sides.
  Restrictions cannot increase rank. A direct sum uses disjoint variables,
  and a tensor product pairs the variable indices on each side;
  rank is subadditive under direct sum and submultiplicative under tensor product.
  These statements follow by applying the indicated operations to rank decompositions.

For positive integers $a \, b \, c$, write

$ chevron.l a \, b \, c chevron.r = sum_(i = 1)^a sum_(j = 1)^b sum_(k = 1)^c x_(i j) y_(j k) z_(k i) . $

This is the tensor for multiplying an $a times b$ matrix by a $b times c$ matrix. Its #emph[volume] is $a b c$.
  Pairing the three matrix indices gives

$ chevron.l a \, b \, c chevron.r ⊗ chevron.l a' \, b' \, c' chevron.r tilde.equiv chevron.l a a' \, b b' \,
  c c' chevron.r . $

Cyclically permuting the three variable spaces replaces the parameters by $\( b \, c \, a \)$ or
  $\( c \, a \, b \)$ and preserves rank.

=== 2.1 Exact rank and the arithmetic exponent <exact-rank-and-the-arithmetic-exponent>

Put $R_d = "R" \( chevron.l d \, d \, d chevron.r \)$ and

#[#set math.equation(numbering: n => "(2)")
 $ w = inf_(d gt.eq 2) frac(log R_d, log d) \, wide d upright(" an integer") . $ <eq:rank-exponent>]

The flattening that sends a $z$ coordinate to its coefficient bilinear form has rank $d^2$:
  the $d^2$ forms $sum_j x_(i j) y_(j k)$ are linearly independent.
  A rank-one tensor has flattening rank at most one. Thus $d^2 lt.eq R_d lt.eq d^3$ and $2 lt.eq w lt.eq 3$.
  In particular,

#[#set math.equation(numbering: n => "(3)")
 $ R_d gt.eq d^w wide \( d gt.eq 1 \) \, $ <eq:square-rank-lower>]

where $R_1 = 1$ handles the unit case.

Let $omega$ denote the arithmetic exponent of square matrix multiplication over $bb(F)$,
  counting scalar additions and multiplications. A fixed rank-$R_d$ decomposition gives a bilinear matrix
  multiplication identity with $R_d$ products. This identity remains valid on matrix blocks:
  every product has its $x$-linear factor before its $y$-linear factor,
  and comparison of coefficients proves the same identity for noncommuting blocks with central coefficients in
  $bb(F)$. At size $d^k$ the resulting arithmetic cost satisfies

$ C_k lt.eq R_d C_(k - 1) + O_d \( d^(2 k) \) . $

The implied constant may depend on the chosen decomposition.
  Since $R_d gt.eq d^2$, this gives $C_k = O_d \( k R_d^k \)$, including the boundary case $R_d = d^2$.
  Padding an arbitrary size to the next power of $d$ therefore gives cost
  $O_d \( n^(log_d R_d) log \( n + 1 \) \)$. The logarithmic factor is absorbed by $n^eta$ for every $eta > 0$;
  taking the infimum in (2) proves

#[#set math.equation(numbering: n => "(4)")
 $ omega lt.eq w . $ <eq:omega-rank-exponent>]

We also need a uniform upper bound on exact square rank. Given $epsilon > 0$, choose one integer $d gt.eq
  2$ with $theta = log_d R_d < w + epsilon$. For $h gt.eq 1$, tensor powers and padding give

#[#set math.equation(numbering: n => "(5)")
 $ "R" \( chevron.l h \, h \, h chevron.r \) lt.eq R_d^(ceil.l log_d h ceil.r) lt.eq C_epsilon h^(w + epsilon) \,
   wide C_epsilon = R_d . $ <eq:square-rank-upper>]

This argument uses one approximating dimension; it does not require the infimum defining $w$ to be attained.

We use the following identical-summand form of Schönhage’s asymptotic sum
  inequality #cite(label("Schonhage1981")), with a proof from exact rank.

#thm([Lemma 2.1.])[
  (Direct sums of identical matrix tensors).  #emph[Let $s \, a \, b \, c$ be positive integers. If
$ "R" (xor.big_(j = 1)^s chevron.l a \, b \, c chevron.r) lt.eq R_(*) \, $

 then
#[#set math.equation(numbering: n => "(6)")
 $ s \( a b c \)^(w \/ 3) lt.eq R_(*) . $ <eq:identical-direct-sum>]

]
] <lem:direct-sum>

#proof[
  First consider $s$ copies of $chevron.l d \, d \, d chevron.r$.
    When $s = 1$, the assertion $s d^w lt.eq R_(*)$ is (3). When $d = 1$,
    the direct sum is $sum_(j = 1)^s x_j y_j z_j$, whose flattening has rank $s$, so the assertion also holds.
    We may therefore assume $s \, d gt.eq 2$.
  Fix $epsilon > 0$ and the constant in (5). For all sufficiently large integers $k$, set
  $ h_k = ⌊\( s^k \/ C_epsilon \)^(1 \/ \( w + epsilon \))⌋ . $
  Then $h_k gt.eq 2$, $"R" \( chevron.l h_k \, h_k \, h_k chevron.r \) lt.eq s^k$, and
  $ lim_(k arrow.r oo) frac(log h_k, k) = frac(log s, w + epsilon) . $
  The $k$th tensor power of the given direct sum is a direct sum of $s^k$ copies of $chevron.l d^k \, d^k \,
    d^k chevron.r$, of rank at most $R_(*)^k$. A rank-$r$ decomposition of $chevron.l h_k \, h_k \,
    h_k chevron.r$, with $r lt.eq s^k$, expresses it as a restriction of $r$ independent scalar products.
    Tensor this restriction with $chevron.l d^k \, d^k \, d^k chevron.r$ and discard unused copies.
    It gives $chevron.l d^k h_k \, d^k h_k \, d^k h_k chevron.r$ as a restriction of the available direct sum.
    Consequently
  $ R_(*)^k gt.eq \( d^k h_k \)^w . $
  Taking logarithms, dividing by $k$, and then taking $k arrow.r oo$ at fixed $epsilon$ yields
  $ log R_(*) gt.eq w log d + frac(w, w + epsilon) log s . $
  Letting $epsilon arrow.b 0$ proves $s d^w lt.eq R_(*)$.
  For the rectangular case, let $U = xor.big_(j = 1)^s chevron.l a \, b \,
    c chevron.r$ and tensor $U$ with its two cyclic rotations. Distributivity gives $s^3$ independent copies of
  $ chevron.l a \, b \, c chevron.r ⊗ chevron.l b \, c \, a chevron.r ⊗ chevron.l c \, a \,
    b chevron.r tilde.equiv chevron.l a b c \, a b c \, a b c chevron.r \, $
  and the product has rank at most $R_(*)^3$. The square case gives $s^3 \( a b c \)^w lt.eq R_(*)^3$,
    whose cube root is (6). The same proof covers $a b c = 1$ through the unit square case. ◻
]

The hypothesis in Lemma 2 specifies one common #emph[oriented] triple $\( a \, b \, c \)$ for all summands.
  In the construction below, exact history counts and common terminal type restrictions will provide these
  identical dimensions.

=== 2.2 An integer coefficient construction <an-integer-coefficient-construction>

The relation between approximate bilinear identities and exact algorithms was studied by
  Bini #cite(label("Bini1980")). Here a direct coefficient calculation gives an exact rank bound over the original
  field, including when that field is finite.

For an integer $q gt.eq 1$, define the symmetric Coppersmith–Winograd tensor #cite(label("CoppersmithWinograd1990"))

$ upright("CW")_q =  & sum_(i = 1)^q \( x_0 y_i z_i + x_i y_0 z_i + x_i y_i z_0 \)\
 & + x_(q + 1) y_0 z_0 + x_0 y_(q + 1) z_0 + x_0 y_0 z_(q + 1) . $

We use $q = 5$. The following exact-rank estimate makes the field independence and the polynomial overhead explicit.

#thm([Lemma 2.2.])[
  (Rank bound for powers of the basic tensor).  #emph[Over every field and for every integer $m gt.eq 0$,
#[#set math.equation(numbering: n => "(7)")
 $ "R" \( upright("CW")_q^(⊗ m) \) lt.eq \( q + 2 \)^m binom(3 m + 2, 2) . $ <eq:cw-power-rank>]

]
] <lem:cw-rank>

#proof[
  We use the Laurent-polynomial identity of Coppersmith and Winograd #cite(label("CoppersmithWinograd1990"))
    Section 7, equation (10) over the integers, with a formal variable $t$.
    Set $X_1 = sum_(i = 1)^q x_i$, $Y_1 = sum_(i = 1)^q y_i$, and $Z_1 = sum_(i = 1)^q z_i$, and consider
  #[#set math.equation(numbering: n => "(8)")
   $ P \( t \) =  & t^(- 2) sum_(i = 1)^q \( x_0 + t x_i \) \( y_0 + t y_i \) \( z_0 + t z_i \)\
 & - t^(- 3) \( x_0 + t^2 X_1 \) \( y_0 + t^2 Y_1 \) \( z_0 + t^2 Z_1 \)\
 & + \( t^(- 3) - q t^(- 2) \) \( x_0 + t^3 x_(q + 1) \) \( y_0 + t^3 y_(q + 1) \) \( z_0 + t^3 z_(q + 1) \) .
   $ <eq:cw-laurent>]
  The only possible negative degrees are $- 3 \, - 2 \, - 1$. Their coefficients are, respectively,
  $ \( - 1 + 1 \) x_0 y_0 z_0 \, wide \( q - q \) x_0 y_0 z_0 \,
    wide \( 1 - 1 \) \( X_1 y_0 z_0 + x_0 Y_1 z_0 + x_0 y_0 Z_1 \) . $
  The degree-zero coefficient is precisely $upright("CW")_q$.
    Thus $P \( t \) = upright("CW")_q + t Q \( t \)$ for a polynomial $Q$ with integer coefficients. In particular,
  #[#set math.equation(numbering: n => "(9)")
   $ \[ t^0 \] P \( t \)^(⊗ m) = upright("CW")_q^(⊗ m) . $ <eq:cw-constant-power>]
  These coefficient identities remain valid after reduction to any field.
  Regard (8) as $q + 2$ products of three Laurent-polynomial linear forms,
    absorbing the scalar prefactor of each product into its $x$ form.
    In one tensor position the possible degrees on the $x$ side lie, respectively, in
  $ { - 2 \, - 1 } \, wide { - 3 \, - 1 } \, wide { - 3 \, - 2 \, 0 \, 1 } . $
  The last set includes both terms of $t^(- 3) - q t^(- 2)$ within a single linear form.
    On each of the other two sides the degrees lie between $0$ and $3$.
  Expanding $P \( t \)^(⊗ m)$ therefore gives $\( q + 2 \)^m$ products,
    each of the form $A \( t \) B \( t \) C \( t \)$ with
  $ A \( t \) = sum_(a = - 3 m)^m A_a t^a \, wide B \( t \) = sum_(b = 0)^(3 m) B_b t^b \, wide C \( t \) =
    sum_(c = 0)^(3 m) C_c t^c . $
  Here each coefficient is one linear form in the corresponding tensor-product variables.
    The constant coefficient of this product is
  $ sum_(b \, c gt.eq 0\
b + c lt.eq 3 m) A_(- b - c) B_b C_c \, $
  a sum of at most $binom(3 m + 2, 2)$ rank-one tensors. Summing over the $\( q + 2 \)^m$ choices and using (9)
    proves (7). For $m = 0$, both sides equal $1$ under the empty tensor product convention.
    Only coefficient addition and multiplication were used; no interpolation or field division is needed. ◻
]

=== 2.3 Strands and shapes <strands-and-shapes>

Give the label $0$ weight $0$, the labels $1 \, dots.h \, q$ weight $1$, and the label $q + 1$ weight $2$.
  Every term of $upright("CW")_q$ has total weight $2$. A #emph[strand of length $ell$] is a copy of
  $upright("CW")_q^(⊗ ell)$; its variable indices are words of length $ell$.
  For a triple $g = \( g_0 \, g_1 \, g_2 \)$ of nonnegative integers with $g_0 + g_1 + g_2 = 2 ell$,
  let $T_(ell \, g)$ be the restriction in which the weight sums on the three sides are $g_0 \, g_1 \, g_2$.
  The coordinates of $g$ refer to sides, whereas the weights $0 \, 1 \, 2$ refer to individual labels.
  A shape is #emph[positive] if all three coordinates are positive.
  When $ell$ is even, splitting a strand into its two consecutive halves gives child shapes $u$ and $g - u$,
  where $0 lt.eq u lt.eq g$ coordinatewise and $sum_i u_i = ell$.

A zero coordinate gives an especially simple terminal tensor. Suppose $g_0 = 0$.
  The $x$ word is then forced to be the all-zero word. In each position a label on the $y$ side uniquely
  determines the $z$ label: $0$ and $q + 1$ are exchanged, and every label $i in { 1 \, dots.h \, q }$ is fixed.
  Thus the other two sides are matched bijectively, and $T_(ell \, g)$ is $chevron.l 1 \, 1 \, M chevron.r$, where

$ M = \[ z^(g_1) \] \( 1 + q z + z^2 \)^ell . $

For $g_1 = 0$ or $g_2 = 0$ the corresponding orientations are $chevron.l M \, 1 \, 1 chevron.r$ or $chevron.l 1 \,
  M \, 1 chevron.r$. Restricting the matched words by corresponding type conditions on their two sides preserves
  this form, with $M$ replaced by the number of allowed matched pairs; an empty matching gives the zero tensor.
  This observation will supply the terminal volume counts.

== 3 A joint extraction at several depths <sec:joint>

The constituent-stage analysis of #cite(label("MoreAsymmetry2026")) Theorem 6.4 combines differently prescribed
  populations at a common depth. The extraction below also permits populations at different depths to share one
  hashing step, provided their priority orders agree on the physical tensor sides.
  Population data, strand lengths, and the constant sums defining their coarse supports may differ.
  The successive compatibility checks follow #cite(label("MoreAsymmetry2026")) Section 4.1,
  building on the asymmetric hashing and interface-tensor methods of #cite(label("DuanWuZhou2023"))
  #cite(label("VXXZ2023")). We specify the intended output first,
  then derive the three capacities that govern its extraction yield.

For a probability vector $p$ on a finite alphabet, write $H \( p \) = - sum_a p \( a \) log p \( a \)$,
  with $0 log 0 = 0$. A word has #emph[type] $p$ if its empirical distribution is exactly $p$;
  a type window of width $theta$ means coordinatewise distance at most $theta$.
  All alphabets, populations, and positive population masses in this section are fixed as $N$ tends to infinity.

=== 3.1 The data of a joint step <the-data-of-a-joint-step>

Index the populations by a finite set $cal(R)$. Population $r$ has $m_r =
  c_r N$ copies of a fixed strand tensor $F_r$ with finite variable sets, where $c_r > 0$ is rational.
  On each side its variables are partitioned into coarse blocks indexed by ${ 0 \, dots.h \, 16 }$.
  Every monomial of $F_r$ has its triple of coarse indices in an ambient support $Omega_r$,
  whose elements $u = \( u_X \, u_Y \, u_Z \)$ satisfy

#[#set math.equation(numbering: n => "(10)")
 $ u_X + u_Y + u_Z = s_r . $ <eq:coarse-sum>]

Here $X \, Y \, Z$ is one common ordering of the physical sides.
  In the product $⨂_r F_r^(⊗ m_r)$, a coarse block is specified by a sequence of indices, one for every strand.
  A fine side variable is a complete basis variable of the product input;
  its coarse block records the coarse index at every strand position.
  The fixed strand tensor in a population is repeated identically at all its positions.
  Populations with different histories or physical placements are kept distinct.

Choose a rational law $p_r$ on $Omega_r$ that maximizes entropy among all laws on $Omega_r$ with its three
  marginals. The support of $p_r$ may be smaller than $Omega_r$. There are two kinds of population.

+ An #emph[ordinary population] delivers the full tensor block at each selected triple $u$,
  without further output type tests. The blocks may themselves be tensor products of child strands.
  This includes extraction by whole-strand shape and the final split into length-one strands.
+ A #emph[sharing population] consists of copies of $T_(ell \, g)$, with even $ell$ and $sum_W g_W = 2 ell$.
  Its coarse index $u_W$ is the weight sum in the left half, so
  $ Omega_r = { u : 0 lt.eq u lt.eq g \, med sum_W u_W = ell } \, wide T_(ell \, g) \|_u =
    T_(ell \/ 2 \, u) ⊗ T_(ell \/ 2 \, g - u) . $
  Assume $p_r \( u \) = p_r \( g - u \)$. On each side $W$,
    a statistic of the full half-strand variable takes values in a fixed finite alphabet $cal(A)_(r \, W)$.
    A map $rho_W$ from this alphabet to weights determines the half weight sum.
    For every half-shape $u$ with $p_r \( u \) > 0$, prescribe a rational law $nu_(r \, u \, W)$ supported on
    $rho_W^(- 1) \( u_W \)$.
  When a half-shape has a zero coordinate, the full variables on the other two sides match by complementation.
    Require that their statistics also match by a fixed bijection and that their prescribed laws are its
    pushforwards. A side having a unique possible variable has its corresponding point-mass prescription.
    These requirements apply as well when two coordinates vanish.

===== 3.1.1 Ideal outputs and inherited masks. <ideal-outputs-and-inherited-masks.>

A #emph[target triple] $e$ is a triple of coarse sequences having exact joint type $p_r$ in each population.
  Start with the tensor block at $e$. In every sharing population,
  impose a positive type window around $nu_(r \, u \, W)$ separately in every class of positions of given
  $\( r \, u \, upright("half") \)$, on each side. The right-half prescription in the class indexed by $u$ is
  $nu_(r \, g - u \, W)$. Leave ordinary blocks unrestricted.
  The resulting tensor product is the #emph[ideal output] $Q_e$.
  Target triples have the same class sizes, so their ideal outputs are isomorphic by position permutations
  preserving the physical sides; denote a canonical such tensor by $Q_N$.
  A fine side variable in a coarse block of $e$ is #emph[useful for $e$] if it satisfies all these output windows;
  ordinary populations contribute no further condition. Thus usefulness specifies the variables of the ideal
  tensor. Additional input or separation tests may delete some of them.

The child windows constrain the two halves separately. Inherited conditions can also constrain how their
  statistics are paired at parent positions. For a sharing population,
  suppress $r$ temporarily and define the mixture law, omitting all zero-mass shapes as we do below:

#[#set math.equation(numbering: n => "(11)")
 $ D_W = sum_(u in Omega_r) p \( u \) thin nu_(u \, W) ⊗ nu_(g - u \, W) . $ <eq:joint-pair-law>]

This is the expected pair law when, within each shape class,
  the left and right statistics have their prescribed laws and are independently arranged.

An input mask is always a deletion of individual side variables.
  For sharing populations we allow finitely many empirical tests on the ordered pair of half statistics,
  or a fixed function of that pair. Their centers must be the law $D_(r \, W)$ in (11),
  or its corresponding pushforward, and their widths must be fixed positive numbers.
  Ordinary input masks must already follow from the exact target coarse types and the specified ideal blocks.
  No other inherited masks are assumed. All masks are imposed separately in the populations just defined.
  A mask on a larger received class can instead be enforced separately, with tighter widths and the same center,
  on any fixed subdivision; the resulting partwise restrictions imply the original one.

Choose output widths small enough that replacing each prescribed child law by any law in its window leaves the
  expected ordered-pair law strictly inside every inherited window. This condition has a uniform positive margin:
  for coordinatewise child errors at most $theta$, a product-law coordinate changes by at most $2 theta$,
  and all relevant collections are finite. The same margin will be required for the additional pair tests
  introduced in the proof.

===== 3.1.2 Compatibility groups and capacities. <compatibility-groups-and-capacities.>

The extraction will first separate targets by their $X$ coarse blocks and impose the $X$ output windows.
  It then separates $Y$ variables, imposes their output windows, and finally separates $Z$ variables.
  The later-side separation tests use only those individual shape types that matching forces from an earlier side.
  Define their designated shapes by

#[#set math.equation(numbering: n => "(12)")
 $ cal(I)_Y = { u in "supp" p : u_Z = 0 } \, wide cal(I)_Z = { u in "supp" p : u_X u_Y =
   0 } . $ <eq:designated-compatibility>]

A zero $Z$ coordinate lets matching transfer the $X$-side output type condition to $Y$.
  For $Z$, a zero $Y$ coordinate transfers the condition from $X$; a zero $X$ coordinate instead uses $Y$,
  after its output windows have been imposed. If both $X$ and $Y$ coordinates vanish, the $Z$ variable is forced.
  For the remaining shapes with a given $W$ coordinate, the pair law $D_W$ determines only an aggregate statistic
  law after the designated contributions are removed. We impose no individual compatibility test on these shapes.
  The exact predicate and its tolerances are given in the incidence count below.
  For $W in { Y \, Z }$, the partition $cal(G)_W$ consists of the individual groups ${ u }$ for $u in cal(I)_W$,
  and the residual groups ${ u in "supp" p \\ cal(I)_W : u_W = i }$. Empty groups are omitted.
  A residual group is treated as residual even when it contains just one shape.
  Put $p \( G \) = sum_(u in G) p \( u \)$ and define

#[#set math.equation(numbering: n => "(13)")
 $ J_W = sum_(G in cal(G)_W) p \( G \) H (frac(sum_(u in G) p \( u \) nu_(u \, W), p \( G \))) \, wide W in { Y \,
   Z } . $ <eq:joint-group-entropy>]

The entropy $J_W$ measures the choices for one half-statistic word within these groups.
  Counting both halves gives the cost $2 J_W$; comparison with the pair-word entropy $H \( D_W \)$ gives the
  saving that controls the number of compatible targets. Accordingly, define the sharing capacities by

#[#set math.equation(numbering: n => "(14)")
 $ C_(r \, X) = H \( p_(r \, X) \) \, wide C_(r \, Y) = H \( D_(r \, Y) \) - 2 J_(r \, Y) \, wide C_(r \, Z) =
   H \( D_(r \, Z) \) - 2 J_(r \, Z) . $ <eq:sharing-capacities>]

Only the law of half-shapes is assumed invariant under $u mapsto g - u$;
  the two prescriptions $nu_(u \, W)$ and $nu_(g - u \, W)$ may differ.

For an ordinary population no compatibility restriction is needed, and the capacities are simply

$ C_(r \, X) = H \( p_(r \, X) \) \, wide C_(r \, Y) = H \( p_(r \, Y) \) \, wide C_(r \, Z) = H \( p_(r \, Z) \) . $

The counting arguments below give a common interpretation:
  each $C_(r \, W)$ is the entropy saving in the bound on competitors at side $W$.
  The joint step adds these savings over populations before taking their minimum.

#thm([Theorem 3.1.])[
  (Heterogeneous joint step).  #emph[Let $B_N$ be the restriction of $⨂_r
    F_r^(⊗ m_r)$ by the inherited masks just specified, with the population data above. Set
#[#set math.equation(numbering: n => "(15)")
 $ A_(upright("amb")) = sum_(r in cal(R)) c_r H \( p_r \) \, wide C_W = sum_(r in cal(R)) c_r C_(r \, W) \, wide
   E = min { C_X \, C_Y \, C_Z } . $ <eq:joint-totals>]

 If $E > 0$, then for every $epsilon > 0$ one can choose positive output widths, as small as desired,
   such that for all sufficiently large $N$ divisible by the fixed type denominators,
   a direct sum of $exp \( o \( N \) \)$ independent copies of $B_N$ has a linear restriction to at least $floor.l
   exp \( N \( E - epsilon \) \) floor.r$ independent copies of $Q_N$.]
  #emph[The choices of populations, rational laws, positive widths,
    and divisibility requirements precede the limit $N arrow.r oo$.
    In particular, the assertion does not require common strand lengths.]
] <thm:joint-step>

We first bound hash survival and assignment collisions. The sequential $X \, Y \,
  Z$ tests then put surviving monomials in a direct sum of variable restrictions of the ideal outputs.
  Section 4 completes the proof by bounding the missing fraction on every full-variable orbit and restoring the
  ideal outputs from $exp \( o \( N \) \)$ input copies.

=== 3.2 Entropy and a common modular hash <entropy-and-a-common-modular-hash>

For a fixed alphabet $cal(A)$, the number of words of type $p$ is

#[#set math.equation(numbering: n => "(16)")
 $ frac(m !, product_a \( m p \( a \) \) !) = exp #scale(x: 120%, y: 120%)[\(] m H \( p \) +
   O \( log \( m + 2 \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:type-count>]

Indeed, comparing the sum $sum_(j = 1)^n log j$ with its integral gives $log \( n ! \) = n log n - n +
  O \( log \( n + 2 \) \)$. There are at most $\( m + 1 \)^(\| cal(A) \|)$ possible types.
  Both bounds are uniform on each fixed alphabet, including types with zero coordinates.

One convenient way to meet the entropy hypothesis is to use positive weights $a_i \, b_j \, c_k$ and set

$ p \( i \, j \, k \) = Z^(- 1) a_i b_j c_k quad \( \( i \, j \, k \) in Omega_r \) . $

For any competing law $q$ with the same marginals, $- sum q log p = - sum p log p = H \( p \)$,
  because $log p$ is a sum of three one-coordinate functions and a constant. Further,

$ sum_(q \( u \) > 0) q \( u \) log frac(p \( u \), q \( u \)) lt.eq
  sum_(q \( u \) > 0) \( p \( u \) - q \( u \) \) lt.eq 0 \, $

by $log t lt.eq t - 1$. Thus $H \( q \) lt.eq H \( p \)$.
  Positive rational weights give rational laws with this same property.
  When the marginals specify a unique law, maximality also holds, including boundary laws with zero probabilities.

First keep, on each side, just the coarse sequences having marginal type $p_(r \, W)$ in every population.
  Call a triple satisfying these three filters and the support conditions #emph[ambient].
  The total number of target triples is

#[#set math.equation(numbering: n => "(17)")
 $ \| cal(T)_N \| = exp #scale(x: 120%, y: 120%)[\(] N A_(upright("amb")) +
   O \( log N \) #scale(x: 120%, y: 120%)[\)] . $ <eq:target-count>]

For a fixed $X$ coarse sequence, each possible ambient joint type $q_r$ has the prescribed marginals.
  Its number of completions in population $r$ is

$ frac(product_i \( m p_(r \, X) \( i \) \) !, product_u \( m q_r \( u \) \) !) =
  exp #scale(x: 120%, y: 120%)[\(] m \( H \( q_r \) - H \( p_(r \, X) \) \) +
  O \( log N \) #scale(x: 120%, y: 120%)[\)] . $

Summing over the polynomially many types and using maximality yields the degree bound

#[#set math.equation(numbering: n => "(18)")
 $ \# { upright("ambient triples at a fixed ") X upright(" block") } lt.eq
   exp #scale(x: 120%, y: 120%)[\(] N \( A_(upright("amb")) - C_X \) +
   O \( log N \) #scale(x: 120%, y: 120%)[\)] . $ <eq:ambient-x-degree>]

Here and below the coarse counts ignore all fine masks, thereby bounding every interaction that could actually occur.

Fix a small slack $delta > 0$. Since $C_X lt.eq A_(upright("amb"))$ and $E lt.eq C_X$, choose a power $M = 37^k$ with

#[#set math.equation(numbering: n => "(19)")
 $ log M = N \( A_(upright("amb")) - E + delta \) + O \( 1 \) . $ <eq:hash-size>]

There is a set $U subset bb(Z) \/ M bb(Z)$ with

#[#set math.equation(numbering: n => "(20)")
 $ log \| U \| = log M - O \( sqrt(log M) \) $ <eq:ap-free-size>]

and no nonconstant three-term arithmetic progression. Here is a version of Behrend’s
  construction #cite(label("Behrend1946")) that also rules out modular wraparound.
  Put $h = floor.l sqrt(log M) floor.r$, $b = floor.l M^(1 \/ h) \/ 2 floor.r$, and encode $d in { 0 \, dots.h \,
  b - 1 }^h$ as $n \( d \) = sum_(j = 0)^(h - 1) d_j \( 2 b \)^j$.
  Choose a largest class with fixed $sum_j d_j^2$. Every encoded integer is less than $\( 2 b \)^h \/ 2 lt.eq
  M \/ 2$, so a modular progression among them is an integer progression.
  In $n \( d \) + n \( e \) = 2 n \( f \)$ all digit sums are at most $2 b - 2$, so there is no carry and $d + e =
  2 f$. Equal squared norms now give $parallel d - e parallel^2 = 2 parallel d parallel^2 +
  2 parallel e parallel^2 - parallel d + e parallel^2 = 0$.
  There are at most $1 + h \( b - 1 \)^2$ norm classes, whence $\| U \| gt.eq b^h \/ \( 1 + h b^2 \)$.
  The inequalities $b gt.eq M^(1 \/ h) \/ 4$ and $b lt.eq M^(1 \/ h)$ imply (20).

Concatenate all $d = sum_r m_r$ strand positions to form coarse words $I \, J \, K$.
  Let $S$ have entry $s_r$ at positions in population $r$. Every ambient triple satisfies $I + J + K = S$,
  even though the entries of $S$ can vary. Choose independent uniform offsets $a \,
  b'$ and a uniform vector $v$ over $bb(Z) \/ M bb(Z)$, and set

#[#set math.equation(numbering: n => "(21)")
 $ x \( I \) = a + chevron.l v \, I chevron.r \, quad y \( J \) = b' + chevron.l v \, J chevron.r \, quad
   z \( K \) = frac(a + b' + chevron.l v \, S - K chevron.r, 2) . $ <eq:joint-hashes>]

Division by $2$ is defined since $M$ is odd. Keep only coarse blocks whose hashes lie in $U$.
  Since $x + y = 2 z$, a surviving triple has $x = y = z$.

For a fixed ambient triple $e$, let $S_e$ be its full hash-survival event.
  For every $v$ and $t in U$ there is exactly one offset pair giving $x = y = z = t$, so

#[#set math.equation(numbering: n => "(22)")
 $ Pr \( S_e \) = h_M := frac(\| U \|, M^2) . $ <eq:hash-survival>]

Conditional on $S_e$, $\( v \, t \)$ is uniform on $\( bb(Z) \/ M bb(Z) \)^d times U$.
  A second triple with differences $\( Delta I \, Delta J \, Delta K \)$ has hashes

$ t + chevron.l v \, Delta I chevron.r \, quad t + chevron.l v \, Delta J chevron.r \, quad t - 1 /
  2 chevron.l v \, Delta K chevron.r . $

If it shares $X$ with $e$, survival is equivalent to $chevron.l v \, Delta J chevron.r = 0$;
  if it shares $Y$ or $Z$, it is equivalent to $chevron.l v \, Delta I chevron.r = 0$.
  In the shared-$Z$ case use $Delta J = - Delta I$. Distinct triples cannot share two blocks,
  by their common sum $S$. Thus the tested difference vector has a nonzero coordinate of absolute value at most
  $16$, which is a unit modulo $37^k$. Conditioning on the other coordinates of $v$ shows, in all three cases, that

#[#set math.equation(numbering: n => "(23)")
 $ Pr \( S_(e') divides S_e \) = 1 / M quad upright("for distinct triples sharing a block") . $ <eq:hash-collision>]

No further hash-dependent event is included in this conditioning.

=== 3.3 The finite compatibility count <the-finite-compatibility-count>

In a sharing population, prefilter side $W in { Y \, Z }$ by requiring its empirical ordered-pair law to be within
  width $eta$ of $D_W$. A fine side variable is #emph[compatible] with a target triple if its statistic type is
  within width $chi$ of the prescribed law in every designated shape class, separately on the two halves.
  On the left these are the positions with $u in cal(I)_W$, using $nu_(u \, W)$;
  on the right they are the positions with $g - u in cal(I)_W$, using $nu_(g - u \, W)$.
  No individual compatibility test is imposed on a residual group, including a residual group with one shape.
  The positions of each tested class are read from the target triple.
  Ordinary populations impose no compatibility test. A variable for the whole product is compatible exactly when
  it is compatible in every population.

#thm([Lemma 3.2.])[
  (Compatibility incidence count).  #emph[For fixed population data,
    there is a function $xi \( eta \, chi \) arrow.r 0$ as $\( eta \, chi \)
    arrow.r \( 0 \, 0 \)$ such that any fine side variable passing the pair filters is compatible with at most
#[#set math.equation(numbering: n => "(24)")
 $ exp #scale(x: 120%, y: 120%)[\(] N \( A_(upright("amb")) - C_W + xi \( eta \, chi \) \) +
   O \( log N \) #scale(x: 120%, y: 120%)[\)] \, wide W in { Y \, Z } \, $ <eq:compatibility-degree>]

 target triples containing its coarse block, before hashing.
   The estimate is uniform in the variable and the target arrangement.]
] <lem:compatibility-count>

#proof[
  Consider first one sharing population of size $m$, and fix the coarse $W$ word $k = \( k_1 \, dots.h \, k_m \)$.
    If $k$ does not have type $p_W$, no target contains it and the bound is immediate.
    Assume henceforth that it has this type, and let $cal(C)$ be the set of shape words
    $\( u_1 \, dots.h \, u_m \)$ of type $p$ with $u_(j \, W) = k_j$.
    Such a word determines a complete coarse triple. If the given fine variable has pair-statistic word
    $z = \( \( a_j \, b_j \) \)_(j = 1)^m$ and empirical law $D'$, let $cal(B)$ be its orbit under
  $ Gamma_k = product_i "Sym" { j : k_j = i } . $
  This group acts transitively on $cal(B)$ by definition and on $cal(C)$ because all shape counts within every
    coarse class are fixed. Compatibility is unchanged by applying the same permutation to a candidate and a
    statistic word. Hence its incidence degrees $a = \# { z in cal(B) :
    z upright(" compatible with ") c }$ and $b = \# { c in cal(C) :
    z upright(" compatible with ") c }$ do not depend on $c$ and $z$, respectively.
    Counting incidences gives the exact finite identity
  #[#set math.equation(numbering: n => "(25)")
   $ \| cal(C) \| a = \| cal(B) \| b . $ <eq:incidence-identity>]
  Since the statistic determines the half weight,
  $ \| cal(C) \| & = frac(product_i \( m p_W \( i \) \) !, product_u \( m p \( u \) \) !) \, & log \|
    cal(C) \| & = m \( H \( p \) - H \( p_W \) \) + O \( log \( m + 2 \) \) \,\
\| cal(B) \| & = frac(product_i \( m p_W \( i \) \) !, product_(a \, b) \( m D' \( a \, b \) \) !) \, & log \|
  cal(B) \| & = m \( H \( D' \) - H \( p_W \) \) + O \( log \( m + 2 \) \) . $
  To bound $a$, now fix a candidate $c in cal(C)$. This fixes the position set of every left and right
    compatibility group. On the left, compatibility specifies the law within each designated group to accuracy
    $chi$. The row sums of $D'$ give the total count of each statistic among positions with each coarse value,
    since $rho_W \( a_j \) = k_j$. Subtracting the designated-group counts leaves,
    in the remaining group with coarse value $i$, the law
  $ frac(sum_(u in G) p \( u \) nu_(u \, W), p \( G \)) $
  up to an error tending uniformly to zero with $eta$ and $chi$.
    More explicitly, each coordinate error is at most $\( \| cal(A)_(r \, W) \| eta + chi \) \/ p \( G \)$:
    summing a row of $D'$ costs at most $\| cal(A)_(r \, W) \| eta$,
    and the weighted errors of the subtracted designated laws total at most $chi$.
    Only fixed positive numbers $p \( G \)$ are divided by. A product of multinomial counts over these fixed
    position sets, and then a sum over polynomially many types,
    bounds the number of left-statistic assignments by
    $exp \( m \( J_W + o_(eta \, chi) \( 1 \) \) + O \( log \( m + 2 \) \) \)$.
  For the right half, use the column sums of $D'$. Its coarse value is $g_W - k_j$,
    so those sums determine precisely the analogous aggregate counts.
    The right half-shape distribution is $p \( g - u \) = p \( u \)$, giving the same entropy $J_W$,
    with the actual right prescription $nu_(g - u \, W)$. Count the two halves independently;
    discarding the requirement that they reassemble the exact pair law $D'$ can only enlarge the count. We obtain
  $ a lt.eq exp #scale(x: 120%, y: 120%)[\(] m \( 2 J_W + o_(eta \, chi) \( 1 \) \) +
    O \( log \( m + 2 \) \) #scale(x: 120%, y: 120%)[\)] . $
  There is no factor for choosing group locations: those locations were fixed with $c$.
    By (25) and uniform continuity of entropy on a finite simplex,
  $ b lt.eq exp #scale(x: 120%, y: 120%)[\(] m \( H \( p \) - H \( D_W \) + 2 J_W + o_(eta \, chi) \( 1 \) \) +
    O \( log \( m + 2 \) \) #scale(x: 120%, y: 120%)[\)] . $
  For an ordinary population all candidates are compatible,
    and their number is $exp \( m \( H \( p \) - H \( p_W \) \) + O \( log \( m + 2 \) \) \)$ directly.
    The candidate sets, permutation groups, and compatibility conditions factor over populations.
    Multiplying their bounds proves (24). ◻
]

=== 3.4 Sequential assignment by variable deletion <sequential-assignment-by-variable-deletion>

Choose $eta \, chi > 0$ sufficiently small that the error in Lemma 5 is below $delta \/ 4$.
  Next choose output widths $theta > 0$ smaller than $chi$ and small enough for the positive margins required by
  all inherited and pair tests. Complementary prescribed laws ensure that usefulness of one side transfers to the
  compatibility window on a matching side. Every choice here is fixed before $N$ grows.

First delete an $X$ coarse block unless it belongs to exactly one ambient hash survivor and that survivor is a
  target triple. Call the retained triples #emph[eligible]. Freeze this list for all subsequent tests.
  By (18), (19), and (23), a target triple $e$ fails this test, conditional only on $S_e$,
  with probability at most $exp \( - delta N + O \( log N \) \)$.
  Each retained $X$ block now has an unambiguous assignment.
  In that block retain only the fine variables useful for its assigned triple, that is,
  those satisfying its output windows.

On $Y$, apply its pair filters and delete every fine variable having other than exactly one compatible eligible
  triple containing its coarse block. Assign it to that triple and impose usefulness for that assignment.
  Apply the same procedure to $Z$, using the designated classes $cal(I)_Z$.
  Include all inherited masks as side-variable deletions; their application does not change the frozen eligible
  list or the definitions of the compatible lists.

We verify that these operations produce a direct sum, rather than merely a list of proposed components.
  Take an actual monomial surviving every deletion, and let $e$ be its ambient coarse triple.
  Its $X$ block survived, so $e$ is that block’s unique eligible triple and its $X$ variable is useful for $e$.
  In every sharing half with $u_Z = 0$, the $Y$ statistics are complementary to the $X$ statistics.
  Thus the actual $Y$ variable is compatible with $e$; deterministic sides satisfy their point-mass tests as well.
  The $Y$ uniqueness test therefore assigns this variable to $e$. Its usefulness is now known for the actual triple.

For $Z$, a half with $u_Y = 0$ transfers the required statistics from $X$.
  A half with $u_X = 0$ and $u_Y > 0$ transfers them from the already useful $Y$ variable.
  With both $u_X = u_Y = 0$, the remaining variable is forced.
  These cases prove compatibility with $e$ on every designated shape class in $cal(I)_Z$.
  Its uniqueness test then assigns the actual $Z$ variable to $e$ as well.
  Ordinary populations add no compatibility conditions in either argument.
  All three variables of every retained monomial therefore have the same assignment.

Different assignments share no retained fine variable on any side.
  Within assignment $e$, usefulness restricts precisely to $Q_e$;
  all other tests delete individual variables of $Q_e$. Consequently the surviving tensor is a direct sum of
  tensors $Q_e^(upright("hole"))$, each obtained from its ideal $Q_e$ solely by variable deletion.
  This statement concerns complete variables of the population product;
  sharing a local coordinate factor between two complete variables does not identify those variables.

Here is the probability estimate needed to repair these holes.
  For a fixed $e$ and a fixed variable $v$ of $Q_e$ passing all its deterministic inherited and pair masks,
  own-triple compatibility and usefulness hold. Let $R_(e \, v)$ be the union of the $X$ eligibility-failure event
  and, when $v$ is on side $Y$ or $Z$, the events that another compatible target triple sharing its coarse block
  survives the hash. Every random deletion of $v$ is contained in $R_(e \, v)$.
  Bound those competitors among #emph[all] target triples before eligibility and other deletions.
  Lemma 5 and (23) then give, for some constant $c > 0$,

#[#set math.equation(numbering: n => "(26)")
 $ Pr \( R_(e \, v) divides S_e \) lt.eq exp \( - c N \) \, $ <eq:joint-conditional-loss>]

uniformly in $e$ and the passing variable, for all large $N$.
  Indeed, the exponent for side $W$ is at most $N \( E - C_W - delta + xi \) + O \( log N \)$ and $C_W gt.eq E$.
  This estimate is conditioned only on $S_e$, never on eligibility or on passing a hash-dependent test.

For reference in the recovery argument, let $G_e$ act by independent position permutations in every ideal child
  class $\( r \, u \, upright("half") \)$, simultaneously on all three sides.
  In ordinary whole-strand blocks use their position permutations;
  for a factorized ordinary block one may also permute its child factors independently.
  These are automorphisms of $Q_e$. The full variable alphabets in its finitely many classes are fixed,
  so $G_e$ has only polynomially many orbits of variables. Lemma 6 supplies the uniform deterministic mask bound
  on these orbits. The completion of Theorem 4 in Section 4 combines that bound with (26),
  selects exponentially many good assignments using (17) and (22),
  and applies Lemma 7 to reconstruct their ideal outputs.

== 4 Recovering the ideal outputs and composing extractions <sec:recovery>

The assignment procedure in Section 3 leaves a direct sum of variable restrictions of the intended outputs.
  We now select sufficiently many of these outputs and recover them exactly.
  Two different probability spaces occur: permutations of an ideal output control inherited masks,
  whereas the random hash controls assignment collisions. Keeping these spaces separate is essential when a
  received population already has type restrictions. Recovery from deletions on all three sides appears in
  #cite(label("VXXZ2023")) Section 7, especially Property 7.1 and Theorem 7.2;
  its interface-tensor consequence is Corollary 4.2 there. The constituent-stage analysis in
  #cite(label("MoreAsymmetry2026")) Section 6.5 also accounts for inherited approximate type restrictions.
  Here we establish uniform loss on every full-variable orbit of each selected heterogeneous output and
  reconstruct its coefficients by an exact linear restriction.

=== 4.1 Uniform control of inherited masks <sec:recovery-masks>

Fix all population masses, rational laws, and positive tolerances before letting the divisible integer $N$ grow.
  Classes of zero mass are omitted. For a target coarse triple $e$, write $Q_e$ for its ideal child product,
  including its prescribed child-side type windows, but before inherited input masks and global pair-frequency
  masks. Keep distinct the population, its previous history, its exact parent split triple,
  and its left or right half. Each resulting child class $c$ has $n_c = c_c N$ positions, with $c_c > 0$ fixed.
  At an ordinary extraction the corresponding whole-strand classes,
  or the unrestricted child classes of an ordinary split, are used instead.

Let $G_e$ be the product of the symmetric groups on these classes.
  A permutation acts simultaneously on the three sides of a child tensor, and different child classes,
  including opposite halves, are permuted independently. This action preserves both the tensor factors and the
  child-side type windows, so it consists of coefficient-preserving automorphisms of $Q_e$.
  The action is on complete variables: a symbol records the entire child word, including its weight-one labels.

#thm([Lemma 4.1.])[
  (Uniform loss from inherited masks).  #emph[The total number of $G_e$-orbits of variables on the three sides is
    polynomial in $N$, uniformly over target triples $e$. Suppose every inherited or global mask is either implied
    by the exact coarse choices, or tests an empirical ordered pair of child statistics (or a fixed function of
    that pair) against its prescribed mixture law with a fixed positive tolerance.
    Choose the child tolerances sufficiently smaller than those mask tolerances,
    with the mixture laws consistent as in Theorem 4. There is then a constant $C_0$ such that,
    in every full-variable orbit on every side, the fraction failing any of these deterministic masks is at most
    $C_0 \/ N$. The constant may depend on the fixed data and tolerances, but not on $e$, the orbit, or $N$.]
] <lem:orbit-masks>

#proof[
  Let $cal(A)_(c \, W)$ be the finite alphabet of complete child variables on side $W$ in class $c$.
    An orbit is specified by the multiplicity of every symbol in every class.
    Its number on side $W$ is therefore at most
  $ product_c \( n_c + 1 \)^(\| cal(A)_(c \, W) \|) = O \( N^(d_W) \) $
  for a fixed integer $d_W$. Child type windows merely select some of these orbits.
    The alphabets include all labels, even when a mask uses only a much coarser statistic.
  Consider one mask with tolerance $eta > 0$, on a population of size $m = c N$.
    Its tested law is an ordered-pair mixture. Write its exact parent-triple classes as $a$, with weights $w_a =
    n_a \/ m$, and let $q_(a \, L) \, q_(a \, R)$ be the two empirical statistic laws in a fixed orbit.
    For the prescribed laws $nu_(a \, L) \, nu_(a \, R)$, the child windows give coordinate errors at most $tau$.
    If a coarsening of a child statistic is needed, choose its original window smaller by the fixed alphabet size,
    so this assertion holds for the statistic actually tested. The elementary inequality
  $ \| q_(a \, L) \( s \) q_(a \, R) \( t \) - nu_(a \, L) \( s \) nu_(a \, R) \( t \) \| lt.eq 2 tau $
  shows that the mean mixture differs from $sum_a w_a nu_(a \, L) ⊗ nu_(a \, R)$ by at most $2
    tau$ in each coordinate. More generally, suppose the mask center differs from this prescribed mixture by
    coordinatewise error at most $alpha lt.eq eta \/ 4$. Choosing $tau lt.eq
    eta \/ 8$ then leaves a margin of at least $eta \/ 2$ inside the mask’s acceptance interval.
    For the consistent rational prescriptions of Theorem 4, $alpha = 0$.
    This margin holds also for orbits at the boundary of a child window.
  Uniformly permute an element of the orbit. Within one parent-triple class of size $n$,
    the two half-statistic words are independently arranged. If the frequencies of $s$ and $t$ are $a$ and $b$,
    their paired count $K_(s \, t)$ satisfies, for $n gt.eq 2$,
  #[#set math.equation(numbering: n => "(27)")
   $ bb(E) K_(s \, t) = n a b \, wide "Var" \( K_(s \, t) \) = frac(n^2 a \( 1 - a \) b \( 1 - b \), n - 1) lt.eq
     n / 8 . $ <eq:matching-variance>]
  Indeed, fix the positions of the $n a$ occurrences on the left.
    The indicators that the right symbol is $t$ have mean $b$, variance $b \( 1 - b \)$, and covariance $-
    b \( 1 - b \) \/ \( n - 1 \)$ at distinct positions. Summing gives (27).
    This calculation is uniform over $a \, b in \[ 0 \, 1 \]$, including deterministic symbols.
  Different parent-triple classes use independent permutations.
    Consequently the variance of a pair count summed over a population is at most $m \/ 8$.
    Chebyshev’s inequality and the acceptance margin give
  $ Pr (lr(|frac(sum_a K_(s \, t)^(\( a \)), m) - bb(E) frac(sum_a K_(s \, t)^(\( a \)), m)|) > eta \/ 2) lt.eq
    frac(1, 2 c eta^2 N) . $
  For a mask on a fixed function of the ordered pair, a coordinate of the pushed-forward law is a sum of at most
    $B$ pair coordinates, where $B$ is fixed. Choose $tau lt.eq
    eta \/ \( 8 B \)$ and apply the last bound to each pair coordinate with deviation threshold
    $eta \/ \( 2 B \)$. Summing coordinate errors and taking a finite union bound proves the same $O \( 1 \/ N \)$
    conclusion for that mask. All positive classes eventually have size at least two.
    There are only finitely many masks and statistic coordinates, so another union bound gives $C_0 \/ N$.
    A uniform group element sends any fixed variable uniformly over its full orbit;
    thus this probability is exactly the rejected fraction of that orbit.
    We have not conditioned on passing a mask. Taking a minimum of the finitely many positive tolerance gaps and
    positive population masses makes $C_0$ uniform as asserted.
    A statistic that is itself an ordered pair is simply a symbol of a larger fixed alphabet.
    Masks implied by the exact coarse choices cause no loss. ◻
]

=== 4.2 Exact repair <sec:recovery-exact>

We next give an algebraic recovery statement. A variable restriction of a tensor means that some basis variables
  are set to zero; all coefficients on the remaining variables retain their original values.

#thm([Lemma 4.2.])[
  (Exact repair by presence masks).  #emph[Let $Q_N$ be a tensor over an arbitrary field,
    with at most $exp \( b N \)$ nonzero monomials for a fixed $b > 0$.
    Let $G_N$ be a finite group of coefficient-preserving permutations of its variables,
    acting separately on the three sides. Suppose a variable restriction $H_N$ of $Q_N$ omits at most $C \/
    N$ of each $G_N$-orbit of variables, for a fixed $C > 0$. For all sufficiently large $N$, a direct sum of
$ R_N = exp #scale(x: 120%, y: 120%)[\(] O \( N \/ log N \) #scale(x: 120%, y: 120%)[\)] $

 copies of $H_N$ has $Q_N$ as a linear restriction. Every coefficient is reconstructed exactly once.
   The bound is uniform over all $H_N \, Q_N \, G_N$ satisfying these same constants.]
] <lem:hole-repair>

#proof[
  We first cover all ideal monomials by shifted copies. Partitioning variables by their presence masks then
    converts this cover into an exact linear restriction. Put $gamma = C \/ N$ and, for $N > 3 C$, choose
  $ L = ⌈frac(\( b + 1 \) N, log \( N \/ \( 3 C \) \))⌉ = O \( N \/ log N \) . $
  Take $L$ independent uniform elements $g_1 \, dots.h \, g_L$ of $G_N$.
    For a fixed ideal variable, its probability of absence from $g_i H_N$ is at most $gamma$.
    For a fixed nonzero monomial $x y z$ of $Q_N$, the union bound on its three variables makes its probability of
    absence at most $3 gamma$. Independence of the $L$ shifts, followed by a union bound over the support,
    bounds the probability of an uncovered monomial by
  $ exp \( b N \) \( 3 gamma \)^L lt.eq e^(- N) < 1 . $
  Fix a family covering every monomial. The group need only preserve $Q_N$; it is allowed to move the holes of $H_N$.
  For an ideal variable $x$, define its presence mask
  $ A \( x \) = { i in { 1 \, dots.h \, L } : x upright(" is retained in ") g_i H_N } \, $
  and define $B \( y \)$ and $C \( z \)$ similarly. Partition the three sides into the classes $X_A \, Y_B \,
    Z_C$ of equal masks. There are at most $2^L$ classes on each side.
    For each triple of classes whose rectangle $X_A times Y_B times Z_C$ contains a nonzero monomial of $Q_N$,
    coverage implies $A ∩ B ∩ C eq.not diameter$. Choose one index $i \( A \, B \, C \)$ in this intersection.
    All variables in these three classes are present in $g_(i \( A \, B \, C \)) H_N$.
    Since this is a variable restriction of $Q_N$, its restriction to these classes is the full ideal tensor on
    the rectangle, with every original coefficient.
  Use a separate copy of $H_N$ for each such rectangle, permute that copy by the chosen $g_(i \( A \, B \, C \))$,
    and zero all other variables. In the direct sum of these rectangular tensors,
    map the copied variable $\( A \, B \, C \, x \)$ to the ideal variable $x$,
    and similarly on the other two sides. These are ordinary linear maps.
    Every nonzero monomial $x y z$ belongs to exactly one triple of mask classes,
    so its coefficient is supplied once and only once. Identifying a variable used in several rectangles
    introduces no additional monomials: linear maps act on the sum of the existing tensor terms.
    There is no division or characteristic restriction. At most $2^(3 L)$ copies are used,
    and padding with unused copies gives the asserted common bound $R_N$. ◻
]

=== 4.3 Completing the joint extraction <sec:recovery-completion>

#proof[
  #emph[Completion of the proof of Theorem 4.] Use the hash slack $delta > 0$ from Section 3,
    with all entropy errors chosen smaller than a fixed fraction of this slack.
    For a target triple $e$, let $S_e$ be its own hash-survival event; $Pr \( S_e \) = h_M = \| U \| \/ M^2$.
    Let $P_e \( v \)$ denote the deterministic assertion that an ideal variable $v$ of $Q_e$ passes its inherited
    and global masks. Membership in $Q_e$, together with the tolerance inclusions,
    supplies usefulness and compatibility with its own triple. For every $G_e$-orbit $cal(O)$, Lemma 6 gives
  $ d_(e \, cal(O)) = frac(\| { v in cal(O) : not P_e \( v \) } \|, \| cal(O) \|) lt.eq C_0 \/ N . $
  For a passing variable $v$, use the event $R_(e \, v)$ defined at the end of Section 3:
    it includes failure of $e$ at the $X$ uniqueness test and all compatible-target collisions relevant to $v$.
    Equation (26) gives
  #[#set math.equation(numbering: n => "(28)")
   $ Pr \( R_(e \, v) divides S_e \) lt.eq e^(- c N) $ <eq:conditional-variable-loss>]
  for one fixed $c > 0$, uniformly in $e$ and $v$, for all large $N$.
    Here $P_e \( v \)$ is fixed before choosing the hash; the conditioning is still only $S_e$.
    We now average this individual loss over each full ideal orbit,
    including in the denominator the variables that fail the deterministic masks.
  Specifically, put
  $ r_(e \, cal(O)) = frac(1, \| cal(O) \|) sum_(v in cal(O)\
P_e \( v \)) upright(bold(1))_(R_(e \, v)) . $
  By linearity of expectation, $bb(E) \( r_(e \, cal(O)) divides S_e \) lt.eq e^(- c N)$.
    Variables failing $P_e$ contribute to $d_(e \, cal(O))$, and need no collision estimate.
    If $P \( N \)$ bounds the total number of orbits on all three sides, Markov’s inequality and a union bound imply
  $ Pr (exists cal(O) : r_(e \, cal(O)) > 1 \/ N divides S_e) lt.eq N P \( N \) e^(- c N) =
    e^(- c N + O \( log N \)) . $
  Declare $e$ good if it survives hashing, remains eligible, and all these random fractions are at most $1 \/ N$.
    Including the exponentially small eligibility failure explicitly changes only the polynomial factor in this
    bound. Every good $e$ therefore has missing fraction at most
  #[#set math.equation(numbering: n => "(29)")
   $ gamma_N = \( C_0 + 1 \) \/ N $ <eq:uniform-good-holes>]
  in each orbit. The eligible list remains the fixed list used in Section 3.
    Deterministic masks are accounted for as additional deletion flags;
    they do not trigger a recomputation of that list or of the compatibility candidates.
  There are $exp \( N A_(upright("amb")) + O \( log N \) \)$ target triples, and $log M =
    N \( A_(upright("amb")) - E + delta \) + O \( 1 \)$ with $log \| U \| = log M - o \( N \)$.
    If $cal(G)$ is the set of good triples,
  $ bb(E) \| cal(G) \| & gt.eq exp \( N A_(upright("amb")) + O \( log N \) \) thin h_M
    #scale(x: 120%, y: 120%)[\(] 1 - e^(- c N + O \( log N \)) #scale(x: 120%, y: 120%)[\)]\
 & = exp #scale(x: 120%, y: 120%)[\(] N \( E - delta \) - o \( N \) #scale(x: 120%, y: 120%)[\)] . $
  Thus one hash choice has at least this many good triples, up to integer rounding.
    This uses no independence between different targets or between their losses.
    The assignment proof has already made their holed outputs $H_e$ disjoint. Discard all other outputs.
  All strand lengths and alphabets are bounded, and there are $O \( N \)$ factors,
    so every ideal $Q_e$ has at most $exp \( b N \)$ monomials for one fixed $b$.
    For example, a product on at most $a N$ original $upright("CW")_5$ sites has at most $18^(a N)$ terms before
    any masks, since $upright("CW")_5$ has $3 dot.op 5 + 3 = 18$ terms; any $b > a log 18$ suffices.
    Apply Lemma 7 with $C = C_0 + 1$ to every good output. A common $R_N =
    exp \( O \( N \/ log N \) \)$ works for all of them. Indeed,
  $ xor.big_(r = 1)^(R_N) med xor.big_(e in cal(G)) H_e tilde.equiv xor.big_(e in cal(G)) med
    xor.big_(r = 1)^(R_N) H_e . $
  The same replication slots supply each summand with $R_N$ copies.
    Within a summand choose its own covering family and rectangular maps,
    and keep variables of different summands distinct. This produces $xor.big_(e in cal(G))
    Q_e$ with $R_N$ copies of the original joint input. The number of summands does not multiply the replication cost.
  Finally, exact target types give the same number of factors in every population, history, split-triple,
    and half class for every $e$. After repair, simultaneous position relabelings within each population put these
    classes in a fixed canonical order. They identify all $Q_e$ with a single ideal product $Q_N$,
    without permuting the physical tensor sides. This canonicalization concerns the repaired ideal tensors and
    their child windows; no invariance of an earlier hole pattern is needed.
    Choose $0 < delta < min \( E \, epsilon \)$ and then $N$ large enough to absorb the $o \( N \)$ term.
    The result is at least $exp \( N \( E - epsilon \) \)$ identical ideal outputs from $exp \( o \( N \) \)$
    input copies, as claimed. ◻
]

=== 4.4 Composition and subdivision <sec:recovery-composition>

To iterate Theorem 4, we record the two algebraic operations explicitly.
  Write $D_r \( T \) = xor.big_(i = 1)^r T$, and write $A prec.curly.eq B$ when $A$ is a linear restriction of $B$.

#thm([Lemma 4.3.])[
  (Replication and composition).  #emph[Suppose $D_(s_1) \( T \) prec.curly.eq
    D_(r_1) \( S \)$ and $D_(s_2) \( V \) prec.curly.eq D_(r_2) \( T \)$. Then
$ D_(s_1 s_2) \( V \) prec.curly.eq D_(r_1 r_2) \( S \) . $

 For any finite collection of tensors,
$ ⨂_(i = 1)^j D_(r_i) \( F_i \) tilde.equiv D_(product_(i = 1)^j r_i) (⨂_(i = 1)^j F_i) . $

 The same assertions permit different maps in different direct-sum branches,
   provided a common upper bound on their replication counts is used.
   Consequently every fixed finite sequence of the joint extractions above,
   including finite tensor products of them, costs only $exp \( o \( N \) \)$ replications of its original input.]
] <lem:replication>

#proof[
  Take $r_2$ copies of the first restriction and reorder their direct sum as $D_(s_1) \( D_(r_2) \( T \) \)$.
    Apply the second restriction separately to its $s_1$ disjoint blocks.
    This gives the first identity with $r_1 r_2$ source copies, regardless of the value of $s_1$.
    The second identity is direct-sum distributivity: its summands are indexed by the choices of one replication
    slot for each factor. A finished factor can be tensored through with replication count one.
    Branch-dependent maps act block by block after padding unused slots to the common bound.
    Lemma 7 provides such a bound uniformly over the selected outputs of each joint step.
    Products of finitely many $exp \( o \( N \) \)$ quantities are $exp \( o \( N \) \)$.
    For a fixed finite set of population specifications, all positive sizes are $c N$ with $c > 0$ fixed,
    so a local $o \( c N \)$ is also $o \( N \)$. ◻
]

There is also an exact way to subdivide a received population before its next use.
  Let $B$ be its strand tensor, let $nu_W$ be the prescribed statistic law on side $W$,
  and denote by $U \( m \, nu \, eta \)$ the restriction of $B^(⊗ m)$ to the three coordinatewise type windows
  with tolerance $eta$. Partition the positions into fixed parts of sizes $m_1 \, dots.h \, m_j$,
  and on each part use the same laws and a positive tolerance $eta_i lt.eq eta$. There is an exact variable restriction

#[#set math.equation(numbering: n => "(30)")
 $ ⨂_(i = 1)^j U \( m_i \, nu \, eta_i \) prec.curly.eq U (sum_(i = 1)^j m_i \, nu \, eta) .
   $ <eq:subdivision-restriction>]

To see this, the empirical law of a concatenated variable is the weighted average of its partwise empirical laws,
  with error at most $sum_i \( m_i \/ sum_j m_j \) eta_i lt.eq eta$.
  Hence every retained variable satisfies the original window; after the partwise masks are imposed,
  no condition couples different parts, giving exactly the displayed product.
  Different side tolerances are handled in the same way. Apply this argument separately within every received
  history class; classes with different prescriptions remain distinct.

Equation (30) need not retain a large fraction of the earlier variables.
  The next application of Theorem 4 starts from this exact product,
  with its new positive population masses and its consistent inherited laws.
  Thus it supplies its own yield and mask analysis. Together with canonicalization after repair,
  this explains why arbitrary fixed finite subdivisions and heterogeneous populations can be used in a subsequent
  joint step. All such subdivisions and tolerances are fixed before $N$ grows;
  no assertion of uniformity in a number of populations growing with $N$ is needed.

The required tolerance hierarchy exists for any fixed finite calculation.
  At a step first make its global and compatibility tolerances small enough for the entropy errors allowed by its
  hash slack. Then choose its child windows smaller than all those tests and all inherited windows that they must
  satisfy. Repeat toward the descendants. There are finitely many constraints,
  each allowing a strictly positive choice. All constants in this section may depend on this fixed calculation;
  the strand limit is taken only after these choices.

== 5 Staggering the three extraction stages <sec:stagger>

A #emph[lot] consists of $N$ strands of length $8$, hence of $8 N$ copies of $upright("CW")_5$.
  Its positive shapes pass successively through three stages:
  A splits length $8$ into length $4$, B splits length $4$ into length $2$,
  and C splits length $2$ into length $1$. Every shape with a zero coordinate terminates immediately as a matrix
  tensor. Theorem 4 lets one extraction act on populations from different stages.
  We specify their data first, then give the finite schedule that exploits this freedom.

=== 5.1 Shapes, prescriptions, and the three stages <shapes-prescriptions-and-the-three-stages>

All coordinate labels in this section belong to ${ 0 \, 1 \, 2 }$.
  A shape is #emph[positive] if all its coordinates are positive.
  Choose a symmetric product-weight law on the ordered shapes of size $16$:
  its probability at $\( a \, b \, c \)$ is proportional to $alpha_a alpha_b alpha_c$,
  where every $alpha_j > 0$ and $a + b + c = 16$. Write $A_g$ for the resulting probability of the sorted shape
  $g$. Thus the multiplicity of its distinct permutations is included in $A_g$.
  If $rho_g$ gives mass $1 \/ 3$ to each coordinate of $g$, counting multiplicities,
  the common marginal and initial ordinary yield are

#[#set math.equation(numbering: n => "(31)")
 $ mu = sum_g A_g rho_g \, wide H_0 = H \( mu \) . $ <eq:initial-yield>]

The product-weight hypothesis verifies maximum entropy at the given marginals.
  The initial ordinary extraction therefore yields $exp \( N \( H_0 - o \( 1 \) \) \)$ identical products of shape
  tensors, after the arbitrarily small losses of Theorem 4.

Give each sorted $g$ canonical labels $0 \, 1 \, 2$. Its six placements of these labels on the three physical
  sides will each have amount $N A_g \/ 6$. To implement this when $g$ has ties,
  let $s_g$ be the number of label permutations fixing $g$.
  There are $6 \/ s_g$ distinct physical shapes, each with $N A_g s_g \/ 6$ positions.
  Divide its positions into $s_g$ equal classes and assign the distinct tied-label placements to them.
  This is a regrouping of full tensor factors: no fine mask has yet been imposed.
  For example, each physical arrangement of $\( 4 \, 6 \, 6 \)$ has two such classes.
  Later laws may distinguish its two labels of weight $6$. Descendants retain these canonical labels and are never
  re-sorted.

For each positive sorted $g$ of size $16$, choose a positive product-weight law $P_g \( t \)$ on

$ \| t \| = 8 \, wide 0 lt.eq t lt.eq g \, $

with $P_g \( t \) = P_g \( g - t \)$. For every positive #emph[ordered] $t$ of size $8$,
  likewise choose a positive product-weight law $p_t \( u \)$ on $\| u \| = 4$, $0 lt.eq u lt.eq t$,
  with $p_t \( u \) = p_t \( t - u \)$. The numerical data in Section 7 specify these laws,
  as well as the parameters $d_(t \, u) in \[ 0 \, 1 \]$ and terminal laws $z_t$ used below.
  Infeasible subscripts always have probability zero.

The length-$2$ statistic on one side is its unordered pair of weights.
  We use the following fixed coding; $D_i$ counts the actual index words with statistic $i$, including the $q =
  5$ choices at a weight-$1$ site:

#[#set math.equation(numbering: n => "(32)")
 $ i & 0 & 1 & 2 & 3 & 4 & 5\
upright("weight pair") & 00 & 01 & 11 & 02 & 12 & 22\
r_i & 0 & 1 & 2 & 2 & 3 & 4\
D_i & 1 & 10 & 25 & 2 & 10 & 1 wide kappa = \( 5 \, 4 \, 2 \, 3 \, 1 \, 0 \) . $ <eq:pair-statistics>]

Here $r_i$ is the sum of the two weights, and $kappa$ is the image list for complementation.
  For positive $t$ and a feasible child $u$, define the law $v_(t \, u \, W)$ on these six statistics,
  for each canonical label $W$, by requiring support on $r_i = u_W$. If $u_W eq.not 2$ this determines the law.
  If $u_W = 2$, put masses $1 - d_(t \, u)$ and $d_(t \, u)$ on $11$ and $02$, respectively.
  A parameter is needed precisely when $u$ is a permutation of $022$ or $112$.

On a length-$4$ strand the statistic is the #emph[ordered] pair of the statistics of its length-$2$ halves.
  For positive $t$ prescribe

#[#set math.equation(numbering: n => "(33)")
 $ V_(t \, W) = sum_u p_t \( u \) thin v_(t \, u \, W) ⊗ v_(t \, t - u \, W) . $ <eq:inherited-mixture>]

For a zero-coordinate $t$, let $W_(*)$ be its first canonical label attaining $max t$.
  Choose $z_t$ on the ordered pairs $\( i \, j \)$ with $r_i + r_j = max t$.
  Prescribe $V_(t \, W_(*)) = z_t$, prescribe the point mass at $\( 0 \, 0 \)$ on zero coordinates,
  and prescribe the coordinatewise $kappa$-image of $z_t$ on the remaining nonzero coordinate, if any.
  The laws of the two matched sides therefore agree under complementation.
  The same property holds for zero-coordinate $u$: $01$ complements $12$,
  while $11$ and $02$ complement themselves. These are exactly the zero-side consistency requirements of Theorem 4.

#emph[Stage A] is a sharing split of $T_(8 \, g)$ with coarse law $P_g$, child laws $V_(t \, W)$,
  and canonical priority $\( 0 \, 1 \, 2 \)$. #emph[Stage B] is a sharing split of $T_(4 \, t)$ with coarse law
  $p_t$, child laws $v_(t \, u \, W)$, and canonical priority $pi \( t \)$.
  This priority is the lexicographically first permutation of the labels that reads $t$ as one of

#[#set math.equation(numbering: n => "(34)")
 $ \( 1 \, 1 \, 6 \) \, quad \( 1 \, 2 \, 5 \) \, quad \( 1 \, 3 \, 4 \) \, quad \( 2 \, 2 \, 4 \) \,
   quad \( 3 \, 2 \, 3 \) . $ <eq:B-priority>]

These represent every positive size-$8$ shape up to permutation.
  The last representative intentionally gives the middle priority to the coordinate of weight $2$:
  for $t = \( 2 \, 3 \, 3 \)$ the priority is $\( 1 \, 0 \, 2 \)$. The symbols here remain inherited labels.

#emph[Stage C] is an ordinary split of a positive $T_(2 \, u)$. Such $u$ is a permutation of $112$.
  Write its labels as $\( a \, b \, c \)$, where $c$ is the distinguished label of weight $2$.
  In this order, the four possible left shapes and their probabilities are

#[#set math.equation(numbering: n => "(35)")
 $ upright("left shape") & \( 1 \, 1 \, 0 \) & \( 0 \, 0 \, 2 \) & \( 1 \, 0 \, 1 \) & \( 0 \, 1 \, 1 \)\
upright("probability") & d_(t \, u) \/ 2 & d_(t \, u) \/ 2 & \( 1 - d_(t \, u) \) \/ 2 & \( 1 - d_(t \, u) \) \/
  2 . $ <eq:C-law>]

The right shape is $u$ minus the left one. The distinguished marginal fixes the first two probabilities,
  and the two Bernoulli-$1 \/ 2$ marginals fix the other two.
  Thus the coupling is uniquely determined by its marginals, also at $d = 0$ or $1$,
  and has the required maximum entropy. Put

$ h_b \( d \) = H \( 1 - d \, d \) + d log 2 . $

Its three ordinary capacities are $log 2 \, log 2 \, h_b \( d_(t \, u) \)$, with the last at label $c$.
  Every delivered length-$1$ shape has a zero coordinate and is already a matrix tensor.

This also verifies the inherited masks. At A to B, the input law required by B is exactly the mixture (33)
  prescribed by A; the orbit-mask estimate of Lemma 6 applies with smaller child tolerances.
  At B to C, an exact type in (35) forces unordered frequency $d_(t \, u)$ on $02$ and $1 -
  d_(t \, u)$ on $11$ at the distinguished label, and forces $01$ at the other labels.
  Hence it satisfies the received $v_(t \, u \, W)$ masks exactly.
  Complementary children may have different $d$ parameters:
  each is a separate factor, and both actual laws appear in (33).

After Stage B is repaired, its ideal children carry the prescribed $v_(t \, u \, W)$ windows.
  The earlier $V_(t \, W)$ masks were constraints on the input to B; their holes have been repaired,
  so they are not additional constraints on the recovered children.
  Thus the exact Stage C types need only satisfy the $v_(t \, u \, W)$ windows, as verified above.
  The permutation group used for repair preserves the ideal child tensor,
  without needing to preserve the historical pattern of input holes.

A history records the lot, initial $g$, its label placement, every coarse split, its left/right provenance,
  and any subsequent part. We keep all these populations separate, even when their present shapes coincide.
  In particular equal $u$ from different $t$ never merge their $d_(t \, u)$ values.
  The sums below record total amounts; they do not combine differently prescribed populations.

=== 5.2 Capacity balance <capacity-balance>

Stages A and B have fixed capacities in their chosen priority orders.
  At Stage C, each positive length-$2$ population has two capacities equal to $log
  2$ and one equal to $h_b \( d_(t \, u) \)$. We may assign the latter to any priority position by choosing the
  extraction order. We use this freedom to make the sum of the three stages’ capacity vectors have equal coordinates.

Amounts throughout are measured per initial length-$8$ strand.
  After summing over histories while retaining their specifications, the amounts of the smaller shapes are

#[#set math.equation(numbering: n => "(36)")
 $ m_t = 2 sum_(min g > 0) A_g P_g \( t \) \, wide m_(t \, u) =
   2 m_t p_t \( u \) quad \( min t > 0 \) . $ <eq:population-counts>]

The factors $2$ count the left and right children; reflection symmetry of the coarse laws justifies each equality.
  A parent split is charged only once when computing its capacity.

Let $L_A in bb(R)^3$ be the sharing-capacity vectors of Stage A, weighted by $A_g$ and summed over positive $g$,
  with entries in priority order. Likewise let $L_B$ be the Stage B vectors weighted by $m_t$ and read in the
  order $pi \( t \)$. More explicitly, for each parent its vector is

$ #scale(x: 120%, y: 120%)[\(] H \( p_X \) \, med H \( D_Y \) - 2 J_Y \, med H \( D_Z \) -
  2 J_Z #scale(x: 120%, y: 120%)[\)] \, $

using its own coarse law and child prescriptions in the definitions of Section 3.
  Thus the two vectors are fully determined by the data just specified.
  Let $T$ be the total positive length-$2$ amount, and let $B_(*)$ be the sum of those populations’ average
  capacities, weighted by their amounts. The average over priority positions of the total stage capacity is
  $C_(*)$, where

#[#set math.equation(numbering: n => "(37)")
 $ T & = sum_(min t > 0 \, thin min u > 0) m_(t \, u) \, & B_(*) & =
   sum_(min t > 0 \, thin min u > 0) m_(t \, u) frac(2 log 2 + h_b \( d_(t \, u) \), 3) \,\
C_(*) & = B_(*) + 1 / 3 sum_(i = 0)^2 \( L_A + L_B \)_i . $ <eq:balance-data>]

Suppose, as the numerical certificate verifies, that

#[#set math.equation(numbering: n => "(38)")
 $ T log 2 > B_(*) \, wide C_(*) - \( L_A + L_B \)_i < T log 2 quad \( 0 lt.eq i < 3 \) . $ <eq:balance-feasibility>]

The denominator and each numerator below are positive by (38). The numbers

#[#set math.equation(numbering: n => "(39)")
 $ lambda_i = frac(T log 2 - C_(*) + \( L_A + L_B \)_i, 3 \( T log 2 - B_(*) \)) wide \( 0 lt.eq i < 3 \)
   $ <eq:balance-fractions>]

sum to $1$: their numerators sum to $3 \( T log 2 - B_(*) \)$ by (37).
  Divide #emph[each] positive length-$2$ history class into these proportions.
  In part $i$, place its distinguished label in priority position $i$ and order the other labels increasingly in
  the remaining positions. This changes the extraction order only;
  it keeps the same parent-specific $d_(t \, u)$ and masks. The resulting Stage C capacity vector satisfies

#[#set math.equation(numbering: n => "(40)")
 $ \( L_C \)_i & = T log 2 - lambda_i sum_(min t > 0 \, thin min u > 0) m_(t \, u) #scale(x: 120%, y: 120%)[\(]
   log 2 - h_b \( d_(t \, u) \) #scale(x: 120%, y: 120%)[\)]\
 & = T log 2 - 3 lambda_i \( T log 2 - B_(*) \) = C_(*) - \( L_A + L_B \)_i . $ <eq:stage-balance>]

Consequently $L_A + L_B + L_C = \( C_(*) \, C_(*) \, C_(*) \)$.

=== 5.3 Physical orders and the finite schedule <physical-orders-and-the-finite-schedule>

Apply the subdivision restriction (30) separately within each received history class,
  keeping the same prescribed laws and using smaller positive windows. Different parts may use different widths.
  The resulting tensor is exactly the product of the partwise restrictions;
  no retained-fraction estimate is required, since Theorem 4 acts on this specified product directly.
  After each repair, exact coarse counts let simultaneous position permutations put its ideal child classes in a
  canonical order. All selected summands therefore have identical future inputs.
  These permutations are made after repair and need not preserve the earlier hole patterns.

Suppress the physical placement in a fixed canonical history $h$.
  At each of its six placements $phi.alt$, its amount is $a_h N \/ 6$ for the same $a_h$.
  This is true initially by the tied-label subdivision. Every child split and part allocation multiplies it by a
  number depending only on the canonical history, so it remains true inductively.
  If $rho_h$ maps priority positions to canonical labels, the physical priority is $phi.alt compose rho_h$.
  For any prescribed physical order $sigma$ there is exactly one contributing placement,

#[#set math.equation(numbering: n => "(41)")
 $ phi.alt = sigma compose rho_h^(- 1) . $ <eq:physical-order-map>]

Thus the six physical orders give a disjoint partition of the work,
  with one sixth of every history’s priority-capacity vector in each factor.
  This applies to the Stage C parts as well as to A and B.

Assume that $L_A \, L_B \, L_C$ have positive entries, as verified in Proposition 11.
  Then each vector obtained by summing any nonempty subset of the active stages also has positive minimum
  capacity. This supplies the condition $E > 0$ of Theorem 4 for each physical-order factor at every tick of the
  following schedule. Its finite applications will use the rational choices made in Section 6.1.

Fix an integer $K gt.eq 2$ and perform the initial ordinary extraction on each of $K$ lots.
  Within every resulting summand, launch lot $j$ at A on tick $j$, at B on tick $j + 1$, and at C on tick $j + 2$.
  The active stage patterns are

#[#set math.equation(numbering: n => "(42)")
 $ A \; quad A + B \; quad underbrace(A + B + C \; med dots.h \; med A + B + C, K - 2 upright(" ticks")) \; quad
   B + C \; quad C . $ <eq:finite-schedule>]

Every lot is processed once at each of its three depths. We first compute the rates for the prescribed data.
  The rational approximations and arbitrarily small extraction losses are handled in Section 6.1.

At a tick, collect all currently active populations with one physical priority into one tensor factor,
  using (30) if a received type class needs subdivision. Apply one joint step to each of the six factors.
  A full tick has, in each factor, total priority-capacity vector

$ 1 / 6 \( L_A + L_B + L_C \) = 1 / 6 \( C_(*) \, C_(*) \, C_(*) \) . $

Its minimum is $C_(*) \/ 6$, so multiplying the six output counts gives log-yield approaching $N C_(*)$.
  The four boundary ticks similarly have log-yields divided by $N$ approaching

$ min L_A \, wide min \( L_A + L_B \) \, wide min \( L_B + L_C \) \, wide min L_C \, $

where $min x = min_(0 lt.eq i < 3) x_i$ for a vector $x$.
  All four minima are strictly positive by the entrywise positivity assumption.
  Relative to $K$ full-tick contributions, their deficit is

#[#set math.equation(numbering: n => "(43)")
 $ beta = 2 C_(*) - min L_A - min \( L_A + L_B \) - min \( L_B + L_C \) - min L_C . $ <eq:boundary-deficit>]

Using $L_A + L_B + L_C = C_(*) upright(bold(1))$, this is equivalently
  $beta = \( max L_A - min L_A \) + \( max L_C - min L_C \) gt.eq 0$.
  The certificate in Proposition 11 also verifies $beta < 1$.
  Thus the $K - 2$ full ticks and four boundary ticks contribute $K C_(*) - beta$,
  and the initial extractions add $K H_0$.

Figure 1 shows the distinction between progression of one lot and joint extraction of three distinct lots.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.65), [#text(size: 9pt)[\(a\) A finite schedule: each entry names the lot being processed]], anchor: "west", padding: 0.1176cm)
  rect((5.55, -2.82), (8.55, 0.25), fill: rgb("#f5f5f5"), stroke: none, radius: 2pt)
  content((2.5, 0), [#text(size: 9pt)[tick $1$]])
  content((4.25, 0), [#text(size: 9pt)[tick $2$]])
  content((7.05, 0), [#text(size: 9pt)[tick $tau$, $3 lt.eq tau lt.eq K$]])
  content((9.8, 0), [#text(size: 9pt)[tick $K+1$]])
  content((11.9, 0), [#text(size: 9pt)[tick $K+2$]])
  content((0, -0.65), [#text(size: 9pt)[A: $8 arrow.r 4$]], anchor: "west", padding: 0.1176cm)
  content((0, -1.38), [#text(size: 9pt)[B: $4 arrow.r 2$]], anchor: "west", padding: 0.1176cm)
  content((0, -2.11), [#text(size: 9pt)[C: $2 arrow.r 1$]], anchor: "west", padding: 0.1176cm)
  content((2.5, -0.65), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $1$]]])])
  content((4.25, -0.65), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $2$]]])])
  content((7.05, -0.65), [#box(width: 2.32cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $tau$]]])])
  content((4.25, -1.38), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffeede"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $1$]]])])
  content((7.05, -1.38), [#box(width: 2.32cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffeede"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $tau -1$]]])])
  content((9.8, -1.38), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffeede"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $K$]]])])
  content((7.05, -2.11), [#box(width: 2.32cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6f2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $tau -2$]]])])
  content((9.8, -2.11), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6f2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $K-1$]]])])
  content((11.9, -2.11), [#box(width: 1.65cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6f2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[lot $K$]]])])
  line((3.325, -0.935), (3.425, -1.095), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2.5, -2.6), [#text(fill: rgb("#595959"))[#text(size: 8pt)[start]]])
  content((4.25, -2.6), [#text(fill: rgb("#595959"))[#text(size: 8pt)[start]]])
  content((7.05, -2.6), [#text(size: 8pt)[$K-2$ full ticks]])
  content((9.8, -2.6), [#text(fill: rgb("#595959"))[#text(size: 8pt)[finish]]])
  content((11.9, -2.6), [#text(fill: rgb("#595959"))[#text(size: 8pt)[finish]]])
  content((0, -3.35), [#text(size: 9pt)[\(b\) One full tick: six physical-order factors, each with all three depths]], anchor: "west", padding: 0.1176cm)
  content((1.1, -4.03), [#box(width: 1.9cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6e6ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[A: lot $tau$]]])])
  content((1.1, -4.84), [#box(width: 1.9cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffeede"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[B: lot $tau -1$]]])])
  content((1.1, -5.65), [#box(width: 1.9cm, height: 0.57cm, inset: 0.1058cm, radius: 1pt, stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e6f2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[C: lot $tau -2$]]])])
  content((4.78, -4.84), [#box(width: 3.12cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[factor for $sigma in S_3$#linebreak() $phi compose rho_h= sigma$#linebreak() one sixth of each history]]])])
  line((2.05, -4.03), (3.22, -3.69), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.05, -4.84), (3.22, -4.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.05, -5.65), (3.22, -5.99), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((10.18, -4.84), [#box(width: 4.55cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[one joint extraction#linebreak() $ frac(L_A+L_B+L_C, 6) = frac(C_*, 6) (1,1,1)$#linebreak() limiting log-yield per $N$: $ frac(C_*, 6)$]]])])
  line((6.34, -4.84), (7.905, -4.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((7.03, -6.39), [#text(size: 8pt)[Tensoring the six outputs adds their limiting rates: $6 dot.op C_*"/"6=C_*$.]])
})],
  caption: [Figure 1: Mixed-depth extraction with finite boundaries ($K gt.eq 2$). A lot advances one stage per tick, while a full tick combines three different lots. Within each physical-order factor, the common order $sigma$ permits one application of Theorem 4 to the summed capacities. The four boundary ticks have the positive minima appearing in (43); they incur only the fixed deficit $beta$. The middle column is absent when $K = 2$. ],
) <fig:pipeline>

Finished matrix factors are carried through subsequent operations by tensor product.
  After the last tick, every lot has terminated, and exact coarse counts fix the number of terminal factors in
  every oriented history class. The next section computes their dimensions and then combines that count with the
  yield $K \( H_0 + C_(*) \) - beta$ to obtain the rank constraint.

== 6 Terminal dimensions and the rank comparison <sec:leaf-volumes>

The terminal factors have either a zero coordinate or length one.
  Their dimensions can be counted directly, including the restrictions on their prescribed statistics.
  We first show that the completed ideal outputs restrict to one common oriented matrix tensor.
  We then combine its volume with the finite schedule’s yield and compare ranks. Write

$ c_ell \( j \) = \[ x^j \] \( 1 + 5 x + x^2 \)^ell $

for the number of labeled weight words of length $ell$ and weight sum $j$.
  With the amounts and laws of Section 5, define

#[#set math.equation(numbering: n => "(44)")
 $ S_0 & = sum_(min g = 0) A_g log c_8 \( max g \) \,\
S_1 & = sum_(min t = 0) m_t (H \( z_t \) + sum_(i \, j) z_t \( i \, j \) log \( D_i D_j \)) \,\
S_2 & = sum_(min t > 0) med sum_(u lt.eq t \, thin sum_i u_i = 4) m_(t \, u) R_(t \, u) \,\
S_(*) & = S_0 + S_1 + S_2 \, $ <eq:leaf-s0>]

where $g$ is sorted, $t$ and $u$ retain their coordinate labels, and

#[#set math.equation(numbering: n => "(45)")
 $ R_(t \, u) =
   cases(delim: "{", 0 \, & max u = 4 \,, log 10 \, & max u = 3 \,, h_b \( d_(t \, u) \) + 2 \( 1 - d_(t \, u) \)
   log 5 \, & max u = 2 \, med min u = 0 \,, \( 2 - d_(t \, u) \) log 5 \, & min u > 0 .) $ <eq:leaf-rates>]

In these sums, infeasible or zero-mass populations are omitted.

#thm([Proposition 6.1.])[
  (Leaf volumes and common dimensions).  #emph[Fix a finite number $K$ of lots and rational stage laws satisfying
    the prescriptions of Section 5. Use fixed rational subdivisions retaining each history class’s prescribed
    laws, as in (30); exact capacity balance is not required for this volume count.
    For all sufficiently divisible $N$, every completed ideal output in the staggered construction has a
    restriction to the same oriented matrix tensor $chevron.l a_N \, b_N \, c_N chevron.r$, with
#[#set math.equation(numbering: n => "(46)")
 $ log \( a_N b_N c_N \) gt.eq K N S_(*) - O_K \( log \( N + 2 \) \) . $ <eq:leaf-volume-bound>]

 The implied constant may depend on the fixed laws and subdivisions.
   For limiting real data, the corresponding volume rate can approach $S_(*)$ arbitrarily closely by consistent
   rational approximation.]
] <prop:leaf-volume>

#proof[
  We first count one terminal population. When a shape has a zero on side $X$,
    that side has a unique weight word and a unique variable.
    Every variable on $Y$ has exactly one partner on $Z$: complement each weight $0 arrow.l.r
    2$ and retain the label at each weight $1$. Consequently a set of $M$ such matched pairs gives $chevron.l 1 \,
    1 \, M chevron.r$. A zero on $Y$ gives $chevron.l M \, 1 \, 1 chevron.r$,
    and a zero on $Z$ gives $chevron.l 1 \, M \, 1 chevron.r$.
    These orientations follow from the convention $x_(i j) y_(j k) z_(k i)$; in every case the volume is $M$.
    If two coordinates are zero, $M = 1$.
  For an unrestricted length-eight leaf, the generating function above counts the choices on an axis of maximum
    weight. Complementation is a bijection to the other axis, so the volume is $c_8 \( max g \)$.
    Their total contribution per initial strand is therefore (44).
  Here is the exact count needed for the restricted leaves.
    Suppose the statistic on the chosen nonzero side has values $sigma$ with multiplicities $b_sigma$,
    and a population of $m$ strands is restricted to an exact statistic type $theta$ with integer counts
    $n_sigma = m theta_sigma$. The number of surviving matching words is
  #[#set math.equation(numbering: n => "(47)")
   $ M \( m \, theta \) = frac(m !, product_sigma n_sigma !) product_sigma b_sigma^(n_sigma) . $ <eq:exact-leaf-count>]
  Indeed, first choose the positions of each statistic and then its independent labeled realization at each
    position. The other side is uniquely determined. Prescribing the pushforward type under complementation on
    that side retains all these pairs. For a fixed alphabet the multinomial estimate gives
  #[#set math.equation(numbering: n => "(48)")
   $ log M \( m \, theta \) = m (H \( theta \) + sum_sigma theta_sigma log b_sigma) +
     O \( log \( m + 2 \) \) . $ <eq:leaf-type-rate>]
  Zero type entries cause no difficulty, with $0 ! = 1$.
  At a zero-coordinate length-four leaf, the statistic is the ordered pair $\( i \, j \)$ of the two length-two
    statistics. Its multiplicity is $D_i D_j$, and its type is $z_t$.
    Equation (48) therefore gives precisely the summand in (44).
    Within a length-two statistic, $11$ has $5^2 = 25$ labelings and $02$ has two orders;
    these choices have already been included in $D$. The two halves remain ordered.
    Thus, when $z_t$ is specified by weights on $i lt.eq j$, an off-diagonal weight occurs twice in its
    normalizing sum, once for each ordered pair. There is no further multiplicity factor beyond $D_i D_j$ in (47).
  The complement involution $kappa$ satisfies $D_(kappa \( i \)) =
    D_i$ and sends $\( i \, j \)$ to $\( kappa \( i \) \, kappa \( j \) \)$.
    The prescription on the second nonzero axis is exactly this pushforward of $z_t$.
    The same matching count applies when the two nonzero coordinates tie for the maximum:
    choosing the first maximum only chooses which of the two matched words is counted.
    No invariance of $z_t$ under complementation is needed.
  The nonnegative shapes of size four have sorted forms $\( 0 \, 0 \, 4 \)$, $\( 0 \, 1 \, 3 \)$,
    $\( 0 \, 2 \, 2 \)$, and $\( 1 \, 1 \, 2 \)$. These are the four disjoint cases of (45).
    The first has volume one. The second has ten matched words,
    since the weight-three side has either order of weights $1 \, 2$ and five choices for the weight-one label.
    For the third, write $d = d_(t \, u)$. In $m$ strands, impose the exact type with $m \( 1 - d \)$ statistics
    $11$ and $m d$ statistics $02$. Its matching count is
  $ binom(m, m d) 25^(m \( 1 - d \)) 2^(m d) . $
  Its logarithmic rate is $H \( 1 - d \, d \) + 2 \( 1 - d \) log 5 + d log 2$, the third case of (45).
    Complementation fixes both of these unordered statistics, so the same exact type is allowed on both nonzero sides.
  For the positive case, consider first $u = \( 1 \, 1 \, 2 \)$ on the physical sides $\( X \, Y \, Z \)$,
    so $Z$ is distinguished, and again put $d = d_(t \, u)$. The four Stage C choices are
  $ upright("left and right shapes") & upright("probability") & upright("product of the two matrix tensors")\
\( 0 \, 0 \, 2 \) \, med \( 1 \, 1 \, 0 \) & d \/ 2 & chevron.l 1 \, 5 \, 1 chevron.r\
\( 1 \, 1 \, 0 \) \, med \( 0 \, 0 \, 2 \) & d \/ 2 & chevron.l 1 \, 5 \, 1 chevron.r\
\( 0 \, 1 \, 1 \) \, med \( 1 \, 0 \, 1 \) & \( 1 - d \) \/ 2 & chevron.l 5 \, 1 \, 5 chevron.r\
\( 1 \, 0 \, 1 \) \, med \( 0 \, 1 \, 1 \) & \( 1 - d \) \/ 2 & chevron.l 5 \, 1 \, 5 chevron.r . $
  Every selected exact coarse type therefore produces, from $m$ strands, the oriented tensor
  #[#set math.equation(numbering: n => "(49)")
   $ ⟨5^(m \( 1 - d \)) \, thin 5^(m d) \, thin 5^(m \( 1 - d \))⟩ . $ <eq:positive-leaf-dimensions>]
  Its volume is $5^(m \( 2 - d \))$, proving the final case of (45).
    This is the dimension of one output with fixed coarse blocks;
    the choices of coarse blocks have already contributed to the extraction yield.
    Permuting the physical sides gives the other orientations; the volume remains the same.
    This formula includes $d = 0$ and $d = 1$ whenever they are allowed by the chosen laws.
  Both children must be counted in the volume sum. For each positive parent $t$, their contribution is
  $ m_t sum_u p_t \( u \) #scale(x: 120%, y: 120%)[\(] R_(t \, u) + R_(t \, t - u) #scale(x: 120%, y: 120%)[\)] =
    2 m_t sum_u p_t \( u \) R_(t \, u) = sum_u m_(t \, u) R_(t \, u) . $
  The equality changes variables $u mapsto t - u$ in the second sum and uses only $p_t \( u \) = p_t \( t - u \)$.
    It does not identify $d_(t \, u)$ with $d_(t \, t - u)$. The analogous calculation with $P_g$ gives the
    amounts $m_t$ after Stage A. Thus (44)–(44) count every terminal factor once.
  Finally we verify that these counts provide common oriented dimensions, as required by Lemma 2.
    Keep separate every finite class specified by its lot, full ancestry, left or right half,
    coordinate-label placement on the physical sides, and subdivision for a priority choice.
    Exact coarse types fix the number of factors in each such class in every output.
    A simultaneous relabeling of positions on all three sides takes each class to the same canonical set of
    positions. Its ideal tensor and its prescribed type windows are consequently the same in every output.
    The recovery argument restores these ideal tensors before the terminal restrictions are made.
  Choose once, in each zero-coordinate class with a statistic prescription, the exact matching type used in (47);
    use the same choice in every output. For rational data and divisible $N$,
    this type equals the prescribed law and lies in every positive tolerance window.
    Each class then has the same integer matching dimension and the same zero physical side;
    unrestricted classes already have fixed matching dimensions.
    At positive length-two classes the exact Stage C counts give the same oriented dimensions in (49) or its
    prescribed side permutation. Multiplying these fixed dimensions over all classes gives one common triple
    $\( a_N \, b_N \, c_N \)$, with each dimension fixed separately.
  The parts of each subdivision retain the same prescribed laws,
    so their leading logarithmic contributions add to that of the original class.
    Allocating these parts among extraction priorities therefore does not change $S_(*)$.
    There are finitely many classes for fixed $K$. Summing (48) over them contributes only
    $O_K \( log \( N + 2 \) \)$ to the logarithm, while the leading term is $K N \( S_0 + S_1 + S_2 \)$.
    This proves (46). For real limiting laws, choose consistent rational laws first and then a divisible $N$.
    The entropy function is continuous on each finite probability simplex,
    so the resulting normalized volume rates tend to $S_(*)$. ◻
]

=== 6.1 Finite extraction and the rank comparison <sec:staggered-assembly>

We now combine the schedule of Section 5 with the terminal dimensions just established.
  The finite statement records both the boundary deficit and the order in which the data are fixed.

#thm([Proposition 6.2.])[
  (Finite staggered yield).  #emph[Assume the prescriptions of Section 5, the balance conditions (38),
    and positive entries of $L_A \, L_B \, L_C$. Let $S_(*) = S_0 + S_1 + S_2$ be the terminal rate defined above.
    For every fixed integer $K gt.eq 2$ and every $epsilon.alt > 0$, suitable fixed rational approximations,
    part allocations, and tolerances give, for all sufficiently large divisible $N$,
    a restriction of $exp \( o_K \( N \) \)$ copies of $upright("CW")_5^(⊗ 8 K N)$ to $s_N$ identical matrix
    tensors of volume $V_N$, where
#[#set math.equation(numbering: n => "(50)")
 $ frac(log s_N, N) gt.eq K \( H_0 + C_(*) \) - beta - epsilon.alt \, wide frac(log V_N, N) gt.eq K S_(*) -
   epsilon.alt . $ <eq:finite-stagger-yield>]

]
] <prop:staggered-yield>

#proof[
  Use the initial extractions and the $K + 2$-tick schedule (42).
    Their total limiting logarithmic yield, divided by $N$, is $K \( H_0 + C_(*) \) - beta$:
    each of the $K - 2$ full ticks contributes $C_(*)$ and the four boundaries contribute the positive minima in
    (43). We show that fixed rational data and a finite composition of joint steps attain these rates to within
    the stated losses.
  Fix $K$ before making any asymptotic choices. Choose rational product weights for the initial, A, and B laws,
    preserving their symmetries, and rational $d$ and $z$ data.
    Define $v$ and $V$ from these same choices by their formulas;
    do not approximate an inherited mixture separately. Choose rational allocations approaching (39).
    For these approximations the full-tick capacities approach $C_(*) \/ 6$,
    which is all the yield bound requires. By continuity, the approximations may also be chosen to keep every
    boundary minimum strictly positive. There are finitely many histories,
    and all positive history masses are now fixed rational multiples of $N$.
    Omit zero classes and make $N$ divisible by every required denominator.
    Choose the finitely many tolerances successively smaller toward the leaves,
    so all inherited masks and subdivisions meet Theorem 4.
  There are $K$ initial operations and at most $6 \( K + 2 \)$ subsequent joint operations.
    Lemma 8 pulls their finitely many replication factors back to $exp \( o_K \( N \) \)$ copies of the original
    source. This cost is per operation, including all its already disjoint summands;
    it is not repeated multiplicatively for each summand. Entropy continuity makes the total approximation and
    tolerance loss less than $epsilon.alt$, for this fixed $K$, before $N$ tends to infinity.
    Integer rounding and polynomial type-class factors contribute $o_K \( N \)$.
  Proposition 9 applies to these fixed rational laws and subdivisions:
    the schedule keeps all histories distinct, and repair restores their ideal windows before any terminal
    restriction. Its common exact terminal types and exact Stage C counts give one oriented matrix tensor in every
    final summand, with volume rate approaching $K S_(*)$. Thus the approximation and extraction losses can be
    chosen to satisfy both bounds in (50). ◻
]

Lemma 3 bounds the rank of the replicated source by

$ exp \( o_K \( N \) \) thin 7^(8 K N) binom(24 K N + 2, 2) . $

Apply Lemma 2 to the identical outputs of Proposition 10, divide its logarithm by $K N$,
  and first let divisible $N arrow.r oo$. For fixed $K$ let the approximation and tolerance losses tend to zero.
  The result is

$ H_0 + C_(*) - beta / K + w / 3 S_(*) lt.eq 8 log 7 . $

Letting $K arrow.r oo$ last gives the promised constraint

#[#set math.equation(numbering: n => "(51)")
 $ #box(stroke: black, inset: 3pt, [$ H_0 + C_(*) + w / 3 S_(*) lt.eq 8 log 7 . $]) $ <eq:rank-constraint>]

Only fixed finite schedules were used; no estimate uniform in a simultaneously growing $K$ is required.

== 7 Exact parameters and numerical certification <sec:parameters>

We now evaluate the logarithmic yield rate $H_0 + C_(*)$ and terminal logarithmic volume rate $S_(*)$ for one
  choice of distributions. The same calculation verifies positive entries of the stage-capacity vectors,
  the balance conditions, and $S_(*) > 0$, then bounds the exponent ratio obtained from (51).
  Five integer arrays in Appendix 8, followed by rational operations, specify this choice;
  no optimization procedure is part of the certificate.

For an integer argument $n$, define the rational weight

#[#set math.equation(numbering: n => "(52)")
 $ F \( n \) = (sum_(j = 0)^16 frac(\( n \/ 640000 \)^j, j !))^64 . $ <eq:rational-weight>]

The initial weights, the two split-weight arrays, and the terminal weights use 223 distinct arguments of $F$,
  including the implicit zero, all between $- 120770$ and $45052$.
  The binary-parameter array instead supplies the fractions $n \/ 10^6$ and is not passed to $F$.
  For the 223 weight arguments, exact rational evaluation gives

#[#set math.equation(numbering: n => "(53)")
 $ 2^(- 23) < F \( n \) < 2^23 . $ <eq:weight-bounds>]

The truncated series is positive directly as well: for nonnegative arguments all terms are nonnegative,
  and for negative arguments the even Taylor partial sum lies above the positive exponential.
  This observation concerns ordinary real arithmetic used to choose probabilities,
  and imposes no restriction on the field of the tensor construction.

===== 7.1 Complete decoding rules. <complete-decoding-rules.>

All shapes and pairs below are traversed in increasing lexicographic order,
  and coordinate labels and array indices start at zero. For a shape $s$ of size $2 ell$, write

$ cal(B) \( s \) = { b in bb(Z)_(gt.eq 0)^3 : b_0 + b_1 + b_2 = ell \, med b_i lt.eq s_i med \( 0 lt.eq i < 3 \) } . $

The arrays are consumed as follows.

+ The 17 entries $a_0 \, dots.h \, a_16$ define the initial sorted law by
  $ A_g =
    frac("mult" \( g \) product_(i = 0)^2 F \( a_(g_i) \), sum_(h_0 lt.eq h_1 lt.eq h_2 \, thin sum h_i = 16)
    "mult" \( h \) product_(i = 0)^2 F \( a_(h_i) \)) \, wide "mult" \( g \) =
    frac(3 !, product_j #scale(x: 120%, y: 120%)[\(] \# { i : g_i = j } #scale(x: 120%, y: 120%)[\)] !) . $
  Thus the law on ordered shapes, before coalescing permutations, is a product of three one-coordinate weights.
+ The 118 entries in the Stage A array are read over all positive sorted $g$ of size 16.
  The 54 entries in the Stage B array are read over all positive #emph[ordered] $t$ of size 8.
  At either parent $s$, set $ell = 1 / 2 sum_i s_i$. For coordinate $i = 0 \, 1 \, 2$, with $k = s_i$,
  read one integer $n_(s \, i) \( j \)$ for each
  $ max \( 0 \, k - ell \) lt.eq j < floor.l k \/ 2 floor.r \, wide n_(s \, i) \( floor.l k \/ 2 floor.r \) = 0 $
  (the final zero consumes no entry). For $b in cal(B) \( s \)$ put
  $ w_s \( b \) = product_(i = 0)^2 F #scale(x: 120%, y: 120%)[\(] n_(s \, i) \( min \( b_i \, s_i - b_i \) \)
    #scale(x: 120%, y: 120%)[\)] \, wide q_s \( b \) = frac(w_s \( b \), sum_(c in cal(B) \( s \)) w_s \( c \)) . $
  Use $P_g = q_g$ at Stage A and $p_t = q_t$ at Stage B. Each is a positive product-weight law and satisfies
    $q_s \( b \) = q_s \( s - b \)$ exactly.
+ Read the 75 entries of the fourth array over positive ordered $t$ of size 8,
  and then over $u in cal(B) \( t \)$ with $max u = 2$. An entry $n$ means $d_(t \, u) = n \/ 10^6$.
  These include both the zero-coordinate $022$ shapes and the positive $112$ shapes.
  The range is $0 lt.eq d_(t \, u) lt.eq 0.110106$.
+ Read the 36 entries of the fifth array over all ordered $t$ of size 8 with a zero coordinate.
  For each $t$, list the pairs
  $ \( i \, j \) \, wide 0 lt.eq i lt.eq j lt.eq 5 \, wide r_i + r_j = max t . $
  Read an integer for each pair except the last, whose integer is zero.
    Assign its $F$-weight to both $\( i \, j \)$ and $\( j \, i \)$ and normalize over #emph[ordered] pairs to
    obtain $z_t$. Hence an off-diagonal weight occurs twice in the denominator,
    while a diagonal weight occurs once. The multiplicities $D_i
    D_j$ count words at the leaf and are not included in this probability normalization.

There are 30 sorted initial shapes, 21 positive sorted initial shapes, 21 positive ordered size-8 shapes,
  and 24 size-8 shapes with a zero. All specified parents consume their entries,
  including parents whose eventual amount is zero. For example,
  $\( 6 \, 1 \, 1 \)$ is included in the Stage B and binary traversals.
  Skipping it, or a zero-amount parent in the $z$ traversal, would change the meaning of the arrays.
  The exact types in this construction are rational, because (52) and every normalization are rational.
  Only the balance fractions, and limiting tolerance choices, require subsequent rational approximation.

The complement prescriptions in Section 5 can be checked without logarithms.
  On the six statistic slots, $kappa$ is an involution with $D_(kappa \( i \)) = D_i$ and $r_(kappa \( i \)) = 4 -
  r_i$. At a $022$ child it fixes both slots 2 and 3, so the common parameter on the two nonzero sides gives
  exactly matching laws. At zero-coordinate length-four shapes the other side receives the pushforward of $z_t$ in
  both slots. These identities, including all zero-axis cases,
  are checked with exact integers and fractions by the archived verifier.
  Complementary #emph[child shapes] need not have equal parameters: for instance

$ d_(\( 1 \, 3 \, 4 \) \, \( 0 \, 2 \, 2 \)) = 92966 / 10^6 \, wide d_(\( 1 \, 3 \, 4 \) \, \( 1 \, 1 \, 2 \)) =
  1204 / 10^6 . $

They retain their separate prescriptions throughout the contractions.

===== 7.2 Finite contractions. <finite-contractions.>

Here is an explicit evaluation rule for the conditional entropies appearing in the capacities.
  For a finite nonnegative vector $x$, let

$ cal(K) \( x \) = (sum_i x_i) log (sum_i x_i) - sum_i x_i log x_i \, wide 0 log 0 = 0 . $

Thus $cal(K) \( x \) = M H \( x \/ M \)$ when $M = sum_i x_i > 0$, and $cal(K) \( 0 \) = 0$.
  Given a parent $s$, its split law $q$, a priority $\( X \, Y \, Z \)$, and half-laws $Q_(b \, W)$,
  form the ordered pair law

$ D_W \( i \, j \) = sum_(b in cal(B) \( s \)) q \( b \) Q_(b \, W) \( i \) Q_(s - b \, W) \( j \) . $

For $W = Y$, let $cal(I)_W = { b : b_Z = 0 }$; for $W = Z$, let $cal(I)_W = { b : b_X b_Y = 0 }$.
  The grouped entropy is exactly

#[#set math.equation(numbering: n => "(54)")
 $ J_W = sum_(b in cal(I)_W) q \( b \) cal(K) \( Q_(b \, W) \) + sum_(k = 0)^(s_W) cal(K) (sum_(b in.not cal(I)_W\
b_W = k) q \( b \) Q_(b \, W)) . $ <eq:finite-group-contraction>]

The capacity vector is

$
  (cal(K) #scale(x: 120%, y: 120%)[\(] \( sum_(b : b_X = k) q \( b \) \)_k #scale(x: 120%, y: 120%)[\)] \,
  cal(K) \( D_Y \) - 2 J_Y \, cal(K) \( D_Z \) - 2 J_Z) . $

At A substitute $\( s \, q \, Q \) = \( g \, P_g \, V \)$ and weight by $A_g$;
  at B substitute $\( t \, p_t \, v_(t \, dot.op \, dot.op) \)$ and weight by $m_t$,
  with the priorities already specified. This rule uses each parent once.
  Child amounts and leaf volumes use both halves as in Proposition 9.
  Along with the formulas for $H_0 \, B_(*) \, T \, S_0 \, S_1 \, S_2$, it specifies only finite additions,
  multiplications, divisions, and logarithms of rational numbers.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Partial capacity
], table.cell(rowspan: 1, colspan: 1)[position 0
], table.cell(rowspan: 1, colspan: 1)[position 1
], table.cell(rowspan: 1, colspan: 1)[position 2
]),
  table.cell(rowspan: 1, colspan: 1)[A: $min g = 1$
], table.cell(rowspan: 1, colspan: 1)[.010739192
], table.cell(rowspan: 1, colspan: 1)[.016912163
], table.cell(rowspan: 1, colspan: 1)[.016213531
],
  table.cell(rowspan: 1, colspan: 1)[A: $min g = 2$
], table.cell(rowspan: 1, colspan: 1)[.081941050
], table.cell(rowspan: 1, colspan: 1)[.088150511
], table.cell(rowspan: 1, colspan: 1)[.082591626
],
  table.cell(rowspan: 1, colspan: 1)[A: $min g = 3$
], table.cell(rowspan: 1, colspan: 1)[.292033029
], table.cell(rowspan: 1, colspan: 1)[.283922596
], table.cell(rowspan: 1, colspan: 1)[.257330639
],
  table.cell(rowspan: 1, colspan: 1)[A: $min g = 4$
], table.cell(rowspan: 1, colspan: 1)[.547143900
], table.cell(rowspan: 1, colspan: 1)[.527202791
], table.cell(rowspan: 1, colspan: 1)[.487211274
],
  table.cell(rowspan: 1, colspan: 1)[A: $min g = 5$
], table.cell(rowspan: 1, colspan: 1)[.247999127
], table.cell(rowspan: 1, colspan: 1)[.248080948
], table.cell(rowspan: 1, colspan: 1)[.237330883
],
  table.cell(rowspan: 1, colspan: 1)[B: $116$
], table.cell(rowspan: 1, colspan: 1)[.002770751
], table.cell(rowspan: 1, colspan: 1)[.002770751
], table.cell(rowspan: 1, colspan: 1)[.000443544
],
  table.cell(rowspan: 1, colspan: 1)[B: $125$
], table.cell(rowspan: 1, colspan: 1)[.080908872
], table.cell(rowspan: 1, colspan: 1)[.106275766
], table.cell(rowspan: 1, colspan: 1)[.087117877
],
  table.cell(rowspan: 1, colspan: 1)[B: $134$
], table.cell(rowspan: 1, colspan: 1)[.386356324
], table.cell(rowspan: 1, colspan: 1)[.454421695
], table.cell(rowspan: 1, colspan: 1)[.323639129
],
  table.cell(rowspan: 1, colspan: 1)[B: $224$
], table.cell(rowspan: 1, colspan: 1)[.395346750
], table.cell(rowspan: 1, colspan: 1)[.395353092
], table.cell(rowspan: 1, colspan: 1)[.248930076
],
  table.cell(rowspan: 1, colspan: 1)[B: $233$
], table.cell(rowspan: 1, colspan: 1)[.611253765
], table.cell(rowspan: 1, colspan: 1)[.686627626
], table.cell(rowspan: 1, colspan: 1)[.634289551
],
)
]],
  caption: [Table 1: Partial sums defining $L_A$ and $L_B$. A B row sums over all ordered parents with that sorted shape. Each displayed entry has absolute error less than $4.795 dot.op 10^(- 10)$. ],
)

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, right, center, right, center, right,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$H_0$
], table.cell(rowspan: 1, colspan: 1)[1.841147374
], table.cell(rowspan: 1, colspan: 1)[$B_(*)$
], table.cell(rowspan: 1, colspan: 1)[1.158066972
], table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[2.345955063
],
  table.cell(rowspan: 1, colspan: 1)[$S_0$
], table.cell(rowspan: 1, colspan: 1)[.031704071
], table.cell(rowspan: 1, colspan: 1)[$S_1$
], table.cell(rowspan: 1, colspan: 1)[.882362236
], table.cell(rowspan: 1, colspan: 1)[$S_2$
], table.cell(rowspan: 1, colspan: 1)[11.680704014
],
)
]],
  caption: [Table 2: The other scalar contractions, each with absolute error less than $3 dot.op 10^(- 8)$. ],
)

#thm([Proposition 7.1.])[
  (Numerical certificate).  #emph[The exact parameters above satisfy every positivity and balance condition used
    in Proposition 10. All thirty partial capacity entries in Table 1 are positive.
    In particular, $S_(*) > 0$, $T log 2 - B_(*) > 0$, all entries of $L_A \, L_B \, L_C$ are positive,
    and the three balance fractions are strictly positive. Moreover,
#[#set math.equation(numbering: n => "(55)")
 $ 5.612983956059236756 & < H_0 + C_(*) < 5.612983956059236757 \,\
12.594770321594676362 & < S_(*) < 12.594770321594676363 \,\
2.371054886006745684 & < frac(3 \( 8 log 7 - H_0 - C_(*) \), S_(*)) < 2.371054886006745685 . $ <eq:yield-certificate>]

 With $Omega = 2.371056$, the strict comparison has the outward enclosure
#[#set math.equation(numbering: n => "(56)")
 $ 0.000004676829725968 < H_0 + C_(*) + Omega / 3 S_(*) - 8 log 7 < 0.000004676829725969 . $ <eq:gap-certificate>]

]
] <prop:numerical-certificate>

#proof[
  We give the elementary interval rule and its error accounting,
    so that the certificate does not depend on assuming decimal logarithms are accurate. For $1 lt.eq y lt.eq 2$ put
  $ P \( y \) = 2 sum_(j = 0)^30 frac(1, 2 j + 1) (frac(y - 1, y + 1))^(2 j + 1) \, wide cal(L) \( x \) =
    e P \( 2 \) + P \( 2^(- e) x \) \, quad e = floor.l log_2 x floor.r . $
  For rational $x > 0$, its exponent $e$ is determined by exact comparisons with powers of two.
    Integrating the geometric series for $2 \/ \( 1 - z^2 \)$ gives
  $ 0 lt.eq log y - P \( y \) lt.eq tau := frac(2 thin 3^(- 63), 63 \( 1 - 1 \/ 9 \)) < 3.120348 dot.op 10^(- 32) . $
  Thus $\| log x - cal(L) \( x \) \| lt.eq \( \| e \| + 1 \) tau$, including when $e < 0$.
    On each dyadic interval $cal(L)$ is increasing; at a boundary its left limit is $e P \( 2 \) +
    P \( 2 \) = \( e + 1 \) P \( 2 \)$, the value from the next interval.
    It is therefore continuous and increasing on $\( 0 \, oo \)$.
    Applying $P$ at outward endpoints, then enlarging by the indicated tail,
    encloses $log x$ even if an input interval crosses a dyadic boundary.
  For completeness, all exponents in this evaluation satisfy $\| e \| < 2048$.
    There are fewer than 256 ordered points in every product-law support.
    By (53), a nonzero product-law probability exceeds $2^(- 146)$, a $z$ entry exceeds $2^(- 54)$,
    and a positive binary entry exceeds $2^(- 20)$. The initial marginal entries exceed $2^(- 148)$.
    Positive entries of a length-four law $V$ exceed $2^(- 186)$;
    multiplying one by a Stage A probability gives $2^(- 332)$, and multiplying two gives $2^(- 518)$.
    These bounds also cover sums within nonzero groups; all these masses are at most one.
    The integer leaf multiplicities and coefficients are less than $7^8 < 2^23$.
    Hence the actual logarithm arguments lie between $2^(- 518)$ and $2^23$, a stronger range than needed.
    One may uniformly use
  #[#set math.equation(numbering: n => "(57)")
   $ epsilon.alt = 2048 tau < 6.391 dot.op 10^(- 29) . $ <eq:log-error>]
  Here is an independent propagation bound for replacing every logarithm literally by $cal(L)$,
    without presuming that the resulting rational version of $cal(K)$ is homogeneous.
    For a vector of total mass $M$, the error in $cal(K)$ is at most $2 M epsilon.alt$.
    The total singleton and nonsingleton group masses in (54) sum to one, so its error is at most $2 epsilon.alt$.
    A sharing capacity has errors at most $\( 2 \, 6 \, 6 \) epsilon.alt$ in its three positions.
    The A parent amounts sum to at most one, the B parent amounts to at most two,
    and the positive length-two amount $T$ is at most four. Consequently the entrywise error in $L_A +
    L_B$ is at most $\( 6 \, 18 \, 18 \) epsilon.alt$, and its average has error at most $14 epsilon.alt$.
    The error in $h_b \( d \)$ is at most $3 epsilon.alt$, hence that in $B_(*)$ at most $20 epsilon.alt \/ 3$.
    Including $H_0$ gives
  $ \| upright("error in ") \( H_0 + C_(*) \) \| lt.eq 68 / 3 epsilon.alt . $
  For $S_0 \, S_1 \, S_2$ the corresponding bounds are $epsilon.alt \, 6 epsilon.alt \, 20 epsilon.alt$,
    respectively. Therefore
  $ \| upright("error in ") S_(*) \| lt.eq 27 epsilon.alt \,
    wide \| upright("error in the comparison at ") Omega \| lt.eq
    (68 / 3 + 9 Omega + 8) epsilon.alt < 3.324 dot.op 10^(- 27) . $
  The file #raw("verification/scripts/verify_parameters.py") implements the stated finite contractions.
    It constructs every $F \( n \)$ as an exact fraction, then uses outward interval operations for all
    arithmetic, including each normalizing denominator. Shared occurrences of a denominator are retained as
    interval occurrences; no independence or cancellation is assumed to reduce error.
    Exact structural checks establish normalization by division by the positive total, complement symmetry,
    and statistic support before the numerical checks. The interval checks of zero differences are only
    consistency checks of these identities. The primary verification evaluates the rational series above and adds
    its tail; a second run uses directed native logarithms as a cross-check.
    Binary interval endpoints are converted to exact fractions and serialized by floor for lower bounds and
    ceiling for upper bounds, including negative endpoints. These operations give outward decimal bounds without a
    nearest-rounding assumption. At 80 decimal digits, every reported native-log interval has width below
    $10^(- 76)$; with the rational-series tail included, every reported interval has width below $3 dot.op
    10^(- 29)$. These bounds include all normalization and subsequent arithmetic rounding.
  In addition to (55)–(56), the resulting bounds include
  $ 0.468025165562828972 < T log 2 - B_(*) < 0.468025165562828973 . $
  The following entries enclose $L_C$, the numerators $b_i = T log 2 -
    C_(*) + \( L_A + L_B \)_i$ of the balance fractions, and the fractions $lambda_i$, respectively.
    Each listed number is a lower bound; adding $10^(- 15)$ to it gives an upper bound.
  $ & 0 & 1 & 2\
L_C & 1.115343821954349 & .962118642424118 & 1.396738451843254\
b & .510748315682386 & .663973495212618 & .229353685793481\
lambda & .363761291246081 & .472890166361139 & .163348542392779 $
  The fractions sum to one exactly by their definition, since the sum of their numerators is
    $3 \( T log 2 - B_(*) \)$. Positivity of $L_A \, L_B$ follows already from the thirty positive partial
    entries. The boundary deficit used in the finite-lot schedule also satisfies
  $ 0.533798153 < 2 C_(*) - min_i \( L_A \)_i - min_i \( L_A + L_B \)_i - min_i \( L_B + L_C \)_i -
    min_i \( L_C \)_i < 0.533798155 < 1 . $
  These bounds verify all stated feasibility conditions. The script checks every displayed enclosure and stores
    the full interval outputs with the packaged integer data.
  The rounded entries in Tables 1 and 2 already certify $omega < 2.371056$.
    The stronger bound in Theorem 1 uses the interval enclosure (55).
    For the rounded-table check, allow independent errors of $4 dot.op 10^(- 8)$ in all 30 partial capacities,
    $H_0$, $B_(*)$, and the three volume rows. The total uncertainty in the comparison is at most
  $ (12 + Omega) 4 dot.op 10^(- 8) = 5.7484224 dot.op 10^(- 7) . $
  Using the displayed centers and an outward bound on $8 log 7$ leaves a positive margin greater than $4.1011
    dot.op 10^(- 6)$. Thus the strict inequality has ample room for both arithmetic enclosure and the arbitrarily
    small losses in the construction. ◻
]

#proof[
  Since $S_(*) > 0$, Proposition 11 and (51) give
  $ omega lt.eq w lt.eq frac(3 \( 8 log 7 - H_0 - C_(*) \), S_(*)) < 2.371054886006746 < 2.371054887 . $
  ◻
]

The integer tables and their full traversal are sufficient to reproduce this comparison.
  The verification package includes a readable assignment table and both interval outputs;
  verification requires Python 3.10 or later and #raw("mpmath") 1.3.0, with no optimization software or external data.

== 8 Exact integer parameter tables <app:parameter-tables>

These five arrays, with the traversals in Section 7, specify all rational distributions used in the construction.
  Every integer is exact; line breaks carry no meaning. Array indices start at zero.

===== 8.1 Initial shape weights: 17 entries ($a$). <initial-shape-weights-17-entries-a.>

#raw(block: true, lang: "", " -55839  -36137  -17449   -1780   11561   22640   31188   36731   38593   35898\n  29051   18387    3823  -14569  -39776  -38598  -23708")

===== 8.2 Stage A split weights: 118 entries ($P$). <stage-a-split-weights-118-entries-p.>

#raw(block: true, lang: "", "  -3070     295  -20546   -1514  -38211   -9654   -7530   -2765  -55230  -16412\n -14246   -5912  -78106  -32809   -7009  -26324  -13519   -3592  -96458  -47439\n -16217  -46871  -25058   -9643  -95643  -62269  -28725   -8576   -2535   -2550\n -34711   -7207   -3270   -6376  -53221  -15352   -3477  -14828   -4187  -74924\n -32439   -7231   -3578  -24599   -8700  -92989  -46655  -16926   -3517  -42976\n -20283   -5132 -107049  -63201  -31013   -9730   -3705  -67421  -35684  -13735\n -68829  -36752  -13993   -7658   -7586  -76746  -33496   -7329   -7447  -17336\n  -4721  -96770  -49297  -17874   -7143  -30044  -10107 -116558  -68325  -33467\n -10424   -7476  -51341  -24711   -5530  -76548  -41988  -15608  -17266   -4357\n -17106   -4343 -120770  -70820  -34294  -10580  -16819   -4315  -32943   -9992\n -83616  -44202  -16154  -17098   -4371  -56609  -25990   -5564  -56356  -25900\n  -5561  -33052   -9918  -32951   -9906  -57255  -26128   -5560")

===== 8.3 Stage B split weights: 54 entries ($p$). <stage-b-split-weights-54-entries-p.>

#raw(block: true, lang: "", " -39594   -5561  -55254  -15178  -62331  -19672  -54917  -18539  -16455  -32184\n  -5716  -11688   -5527  -53009   -6669   -6669  -64938  -20286   -6616  -26336\n -26429   -6696  -60888  -19760   -6690   -5724  -32216  -15829  -58477  -18987\n -26339   -6619  -26393  -26340  -26359   -6620  -16239  -55176  -18587  -55107\n -18571  -16272  -60868  -19755   -6696   -6692  -55133  -18580  -16247  -32128\n  -5727  -32138   -5725    -122")

===== 8.4 Binary parameters: 75 entries ($d$). <binary-parameters-75-entries-d.>

#raw(block: true, lang: "", "     63   97655       0   42132   92966    1204   42148   95604   41743    3057\n 109933   42092    3747   41991       1  100622   42166  103562    9039   42157\n 103577   42165   63582  110082    4584   42175  104091   38838  102383  104793\n  42126   11814   63338   42165  104864    3587   42166  110086    2207   94768\n  42166  104185    4735   38889  110065   42166  102372  104314   38956    4876\n 102395   42166  110068    2953   42166   96000   41863   95723    3031   63321\n  42040   42174  104662   11860  104902   42189    2967   96042   42047  109872\n   3986   42200    3834  110106   60257")

===== 8.5 Terminal length-four weights: 36 entries ($z$). <terminal-length-four-weights-36-entries-z.>

#raw(block: true, lang: "", " -11037  -36170   -4779   23107  -12831   29263   45052   22289   -6216   23895\n -14326  -40670   -9623  -34674  -12708  -36610   -2174   21564   -5587   22521\n  -9766   28961   43809   22299  -12216   28778   44147   22176   -7811   21870\n  -6053   23786    -166      94     -52      17")

#bibliography("refs.bib", style: "ieee", title: [References])
