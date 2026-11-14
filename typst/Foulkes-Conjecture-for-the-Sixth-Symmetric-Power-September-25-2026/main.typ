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

#align(center)[#text(size: 16pt, weight: "bold")[Foulkes' conjecture for the sixth symmetric power]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 The result and its context <the-result-and-its-context>

Foulkes’ conjecture compares two ways of composing symmetric powers.
  For a finite-dimensional complex vector space $V$ and integers $1 lt.eq a lt.eq b$,
  it asks for a $"GL" \( V \)$-equivariant injection

$ "Sym"^a \( "Sym"^b V \) arrow.r.hook "Sym"^b \( "Sym"^a V \) . $

Over $bb(C)$, complete reducibility makes this equivalent to an inequality between the multiplicities of every
  irreducible polynomial representation. Write $upright(bold(S))_lambda
  V$ for the Schur module indexed by a partition $lambda$, and $s_lambda$ for its character.
  If $h_r$ denotes the complete homogeneous symmetric function,
  then $h_a \[ h_b \]$ is the stable character of $"Sym"^a \( "Sym"^b V \)$, where brackets denote plethysm.
  The conjecture says that $h_b \[ h_a \] - h_a \[ h_b \]$ is Schur-positive:
  all its Schur coefficients are nonnegative integers. We prove the sixth case.

#thm([Theorem 1.1.])[
  #emph[For every integer $b gt.eq 6$ and every finite-dimensional complex vector space $V$,
    there is a $"GL" \( V \)$-equivariant injection
$ "Sym"^6 \( "Sym"^b V \) med arrow.r.hook med "Sym"^b \( "Sym"^6 V \) . $

 Equivalently, $h_b \[ h_6 \] - h_6 \[ h_b \]$ is Schur-positive for every $b gt.eq 6$.]
] <thm:main>

Theorem 1 resolves this case of Foulkes’ conjecture positively, with no restriction on $dim V$.
  The diagonal case $b = 6$ is immediate; the content is the comparison for every larger $b$.

===== 1.1 History and the canonical map. <history-and-the-canonical-map.>

The conjecture originates in Foulkes’ study of concomitants #cite(label("Foulkes1950")).
  For binary forms, classical Hermite reciprocity gives an isomorphism between the two symmetric powers for all
  $a \, b$; see #cite(label("RaicuSamWeyman2022")) Introduction.
  In higher dimension one seeks a multiplicity inequality instead. The case $a = 1$ is immediate.
  Thrall’s decomposition formulas imply $a = 2$ #cite(label("Thrall1942"));
  see also #cite(label("DentSiemons2000")) p. 237. Dent and Siemons proved $a = 3$ #cite(label("DentSiemons2000")).

A natural approach uses the canonical Foulkes–Howe map

$ Psi_(a \, b \, V) : "Sym"^a \( "Sym"^b V \) arrow.r "Sym"^b \( "Sym"^a V \) . $

Realize the source as symmetric tensors in $V^(⊗ a b)$, arrange the tensor positions in $a$ rows of length $b$,
  transpose the array, and symmetrize the resulting blocks.
  McKay proved that injectivity for every $V$ at a seed $\( a \, b_0 \)$, with $b_0 gt.eq a$,
  propagates to every $\( a \, b \)$ with $b gt.eq b_0$ #cite(label("McKay2008")) #cite(label("Ikenmeyer2015")).
  The computation at $\( 4 \, 4 \)$ by Müller and Neunhöffer therefore yields $a =
  4$ #cite(label("MuellerNeunhoeffer2005")); Cheung, Ikenmeyer,
  and Mkrtchyan’s injectivity computation at $\( 5 \, 6 \)$ yields $a = 5$,
  with the diagonal comparison again immediate #cite(label("CheungIkenmeyerMkrtchyan2017")) preprint,
  Theorem 6(a). Canonical injectivity is stronger than Foulkes’ multiplicity comparison.
  The canonical maps at $\( 5 \, 5 \)$ and $\( 6 \, 6 \)$ have nonzero kernels in suitable dimensions,
  although their source and target representations coincide #cite(label("MuellerNeunhoeffer2005"))
  #cite(label("CheungIkenmeyerMkrtchyan2017")). For the sixth diagonal this already occurs when $dim V gt.eq
  6$ #cite(label("CheungIkenmeyerMkrtchyan2017")) preprint, Theorem 6(c).
  Our finite comparison does not require injectivity of a prescribed map.

Exact character calculations give another approach. Evseev, Paget,
  and Wildon verified Foulkes’ multiplicity inequalities when the two parameters sum to at most $19$,
  including the sixth case through $b = 13$ #cite(label("EvseevPagetWildon2014")) Corollary 5.2.
  Their character-deflation recurrence is a predecessor of the exact source calculation used here.
  The present certificates combine such calculations with bounds on entire families of multiplicities,
  leaving only a small band for exact comparison.

Brion proved eventual truth for fixed $a$ #cite(label("Brion1993")) Corollary 1.3 and later gave a
  dimension-dependent bound for surjectivity of the canonical map in the opposite direction
  #cite(label("Brion1997")) Theorem 3.3. That map, $Psi_(b \, a \, V)$,
  is realized as multiplication in the invariant ring associated with the normalization of the Chow variety
  #cite(label("Landsberg2015")) Section 7; #cite(label("RaicuSamWeyman2022")) Section 2.
  The companion paper proves its surjectivity for $b gt.eq a \( a - 1 \)$,
  uniformly in dimension #cite(label("OpenAIQuadratic2026")) Theorem 1.
  At $a = 6$, an invariant complement to its kernel supplies an embedding for $b gt.eq 30$.
  The remaining task is to compare all multiplicities for $6 lt.eq b lt.eq 29$.

For binary forms, recent generalized comparisons concern plethysms with different parameter pairs:
  Raicu, Sam, Weyman, and Yang prove maximal rank under divisibility conditions
  #cite(label("RaicuSamWeymanYang2026")) Theorem 1.4, and Gangl, Gutiérrez,
  and Szwej identify the dual map through a substitution construction #cite(label("GanglGutierrezSzwej2026"))
  Theorem 1.2. These results concern a two-dimensional underlying space;
  the theorem above treats every finite dimension.

===== 1.2 Proof strategy. <proof-strategy.>

The source $"Sym"^6 \( "Sym"^b V \)$ has Schur support of length at most six.
  Let $F \( lambda \)$ and $Q \( lambda \)$ denote its multiplicity and the corresponding target multiplicity,
  respectively, for a partition $lambda$ of $6 b$. Section 2 reduces the problem to these six-part partitions and
  supplies rectangular highest-weight shifts of known comparisons and a chart certificate for partitions with
  $lambda_2 + dots.h.c + lambda_6 lt.eq b$. The canonical multiplication map also proves the main large-degree
  range in Corollary 2.

The finite argument compares upper bounds for $F$ with lower bounds for $Q$.
  Section 3 bounds source multiplicities by counting possible intermediate partitions in a signed strip
  recurrence, and gives exact recurrences for both characters. Section 4 amplifies known target multiplicities:
  a basis of highest-weight polynomials can be chosen with distinct leading monomials,
  so a sumset bound supplies many independent products of those polynomials.
  Multiplication by a single nonzero highest-weight polynomial then transfers these lower bounds to further
  weights. Section 5 organizes the resulting tests into a finite computation.
  It checks every partition for $6 lt.eq b lt.eq 25$. In increasing degrees from $26$ onward,
  rectangular shifts reduce the remaining problem to $lambda_6 < 6$;
  the certificates leave only partitions in the band $lambda_3 + dots.h.c + lambda_6 lt.eq 27$.
  Section 6 computes exact differences throughout this band by reusing seven truncated rational-function
  numerators. Section 7 proves the arithmetic bounds and assembles the range coverage.

An independent route is retained in full. The chart calculation used in the finite comparison,
  combined with polarization, proves canonical surjectivity for $b gt.eq 150$ in Proposition 8.
  The polarization argument is related to the successive weight shifts in the proof of McKay’s theorem
  #cite(label("Ikenmeyer2015")) Section 5. Both certificate programs run through $b = 149$,
  so the extended finite verification and this chart bound prove Theorem 1 without the quadratic-stabilization
  input. The main route needs only the finite comparisons through $b = 29$.
  The complete programs are printed in the appendices and supplied with reference outputs and a reproduction
  script. The formulas explain what the programs compute; their exact execution supplies the finite nonnegativity
  assertions.

Throughout, we use characteristic-zero complete reducibility and highest-weight theory for polynomial
  $"GL"$-representations #cite(label("FultonHarris1991")) Theorem 9.19 and Proposition 14.13,
  Schur functors and the Cauchy decomposition #cite(label("FultonHarris1991")) Theorem 6.3 and Exercise 6.11(b),
  and the Schur alternant formula #cite(label("Macdonald1995")) Chapter I, (3.1).
  Stable Schur coefficients are unchanged on specializing extra character variables to zero whenever the partition
  length remains admissible #cite(label("Macdonald1995")) Chapter I, (3.2)–(3.3).
  The character interpretation of plethysm is recalled in #cite(label("Macdonald1995")) Chapter I, Appendix A,
  Sections 7–8. We also write $e_r$ for the elementary symmetric function and set $h_0 = e_0 = 1$.

== 2 The large-degree range and finite reductions <sec:reduction>

The proof has a representation-theoretic reduction and a finite multiplicity comparison.
  We first specify the canonical map supplied by the companion and reduce the remaining comparison to partitions
  with at most six parts. A chart of the same invariant ring gives one of the finite certificates.
  The final subsection proves the independent large-degree bound used with the extended computation.

=== 2.1 The multiplication map <the-multiplication-map>

For the moment let $a gt.eq 2$, and set

$ P = \( "Sym" V \)^(⊗ a) \, wide W_j = P_(\( j \, dots.h \, j \)) \, wide R_j = W_j^(frak(S)_a) \, wide R =
  xor.big_(j gt.eq 0) R_j . $

The symmetric group permutes the tensor factors. We identify $"Sym"^a
  W$ with $\( W^(⊗ a) \)^(frak(S)_a)$ by the normalized average

$ w_1 dots.h.c w_a mapsto frac(1, a !) sum_(sigma in frak(S)_a) w_(sigma \( 1 \)) ⊗ dots.h.c ⊗ w_(sigma \( a \)) . $

Its inverse is the restriction of the symmetric-product quotient.
  Let $A subset R$ be the graded subalgebra generated by $R_1 = "Sym"^a V$.
  For $v in V$, put $z \( v \) = v^(⊗ a) in R_1$. Multiplication defines the canonical Foulkes–Howe map

#[#set math.equation(numbering: n => "(1)")
 $ mu_(a \, b \, V) : "Sym"^b \( "Sym"^a V \) arrow.r R_b = "Sym"^a \( "Sym"^b V \) \, $ <eq:multmap>]

whose image is $A_b$. Thus $mu_(a \, b \, V) = Psi_(b \, a \, V)$ in the notation of the introduction.
  It is equivariant, so $A_b = R_b$ suffices for the desired embedding, by complete reducibility.
  This is the equal-multidegree invariant construction underlying the Chow normalization;
  see #cite(label("RaicuSamWeyman2022")) Section 2. We will use its explicit polynomial realization.

#thm([Corollary 2.1.])[
  (The main large-degree range).  #emph[For every finite-dimensional complex $V$ and every $b gt.eq 30$,
    there is a $"GL" \( V \)$-equivariant injection $"Sym"^6 \( "Sym"^b V \) arrow.r.hook "Sym"^b \( "Sym"^6 V \)$.]
] <cor:quadratic-range>

#proof[
  The map in (1), with exactly the averaging convention above,
    is the canonical multiplication map of #cite(label("OpenAIQuadratic2026")) Theorem 1.
    That theorem gives $A_b = R_b$ for $a = 6$ and $b gt.eq 6 \( 6 - 1 \) = 30$, including dimension zero.
    In positive dimension its kernel has an invariant complement,
    by complete reducibility of complex polynomial $"GL" \( V \)$-representations.
    Restriction to this complement is an isomorphism onto $R_b$;
    its inverse gives an equivariant section and hence the stated injection.
    There is no assertion that this section is a prescribed canonical map. ◻
]

=== 2.2 Six variables and rectangular shifts <six-variables-and-rectangular-shifts>

For the finite comparison take $a = 6$. If $b gt.eq 0$ and $lambda$ is a partition of $6 b$,
  the Cauchy decomposition of $P = "Sym" \( V ⊗ bb(C)^6 \)$ #cite(label("FultonHarris1991")) Exercise 6.11(b)
  gives the source multiplicity

#[#set math.equation(numbering: n => "(2)")
 $ F \( lambda \) = dim (\( upright(bold(S))_lambda bb(C)^6 \)_(\( b \, dots.h \, b \))^(frak(S)_6)) .
   $ <eq:label-multiplicity>]

In particular it vanishes for partitions of length greater than six.
  Stable Schur coefficients allow us to work in $V = bb(C)^6$:
  extra variables are specialized to zero, while longer target constituents already have nonnegative
  multiplicities. This covers every dimension.

Put $S = "Sym" \( "Sym"^6 bb(C)^6 \)$ with its ordinary symmetric-algebra grading,
  and let $Q \( lambda \)$ be the multiplicity of $upright(bold(S))_lambda bb(C)^6$ in $S_b$.
  Pad every partition by zeros to six parts and write

$ d_i = lambda_i - lambda_(i + 1) \, quad lambda_7 = 0 \, wide lambda \( d \)_i = sum_(j = i)^6 d_j \, wide
  w \( d \) = sum_(i = 1)^6 i thin d_i . $

Also put $t_s \( d \) = sum_(j > s) lambda \( d \)_j$. We abbreviate $F \( d \) =
  F \( lambda \( d \) \)$ and $Q \( d \) = Q \( lambda \( d \) \)$ when $6 divides w \( d \)$; then $b =
  w \( d \) \/ 6$. Gap-vector inequalities are componentwise,
  and $e_i$ denotes the $i$-th unit vector in gap coordinates.

#thm([Lemma 2.2.])[
  #emph[Let $c \, d in bb(Z)_(gt.eq 0)^6$ satisfy $6 divides w \( c \)$ and $6 divides w \( d \)$.
    If $Q \( c \) > 0$, then $Q \( d + c \) gt.eq Q \( d \)$. In particular
$ Q \( d + 6 e_i \) gt.eq Q \( d \) quad \( 1 lt.eq i lt.eq 6 \) \, wide F \( d + 6 e_6 \) = F \( d \) . $

]
] <lem:rectangles>

#proof[
  Multiplication by one nonzero highest-weight polynomial of weight $lambda \( c \)$ injects the highest-weight
    space at $lambda \( d \)$ into that at their sum, because $S$ is a domain.
    This is the usual highest-weight multiplication argument;
    compare #cite(label("BurgisserIkenmeyerPanova2019")) preprint, Lemma 2.2.
  The rectangular occurrence $Q \( 6 e_i \) > 0$ is a special case of the even-partition theorem of Bürgisser,
    Christandl, and Ikenmeyer #cite(label("BurgisserChristandlIkenmeyer2011")) Section 1.1, Theorem.
    We give the determinant-tensor construction of #cite(label("BurgisserIkenmeyerPanova2019")) preprint,
    Corollary 4.8 in the form needed here. Take six copies of the determinant tensor on the first $i$ basis
    vectors. Regroup the tensor positions into $i$ blocks, each taking the same position from every copy,
    and symmetrize to $"Sym"^i \( "Sym"^6 bb(C)^6 \)$. This is a highest vector of weight $\( 6 \, dots.h \, 6 \)$
    with $i$ parts. Pair each block with the same sum of pure sixth powers of the first $i$ dual basis vectors.
    A surviving term uses the same permutation in all six determinant copies, so its sign is $+ 1$;
    such terms exist. The vector is nonzero.
  Adding $6 e_6$ adds six to every partition part. In (2), this tensors with $det^6$,
    shifts the equal label weight by six, and is trivial on permutation matrices.
    Thus $F \( d + 6 e_6 \) = F \( d \)$. ◻
]

It follows that, after checking all partitions for $6 lt.eq b lt.eq 25$, induction in $26 lt.eq b lt.eq
  29$ need only treat $d_6 < 6$. If $d_6 gt.eq 6$, subtract $6 e_6$; the degree becomes $b - 6 gt.eq 20$,
  and Lemma 3 imports the earlier comparison. The same induction works throughout $26 lt.eq b lt.eq 149$,
  the full range retained in the programs for the independent route.

=== 2.3 A chart certificate for the first row <a-chart-certificate-for-the-first-row>

We return to arbitrary $a gt.eq 2$ and $V$ for the chart calculation.
  Its factor bound will show, at $a = 6$, that the multiplication image contains every source highest-weight space
  with $lambda_1 gt.eq 5 b$. It will also provide the independent large-degree bound in the next subsection.
  Dimension zero is immediate, so assume $V eq.not 0$.

Fix $0 eq.not v in V$, use it as the first basis vector, and write $x_(i 0) \, x_(i 1) \,
  dots.h$ for the corresponding polynomial variables in row $i$ of $P$. Put $z = z \( v \) = product_i x_(i 0)$.
  After inverting $z$, every $x_(i 0)$ is invertible. Write
  $Y_i = \( x_(i 1) \/ x_(i 0) \, x_(i 2) \/ x_(i 0) \, dots.h \)$.

#thm([Lemma 2.3.])[
  #emph[For every integer $t gt.eq 0$, every row-permutation-invariant polynomial in the lists $Y_i$ of total
    degree at most $t$ is a linear combination of products of at most $t$ elements of $z^(- 1) R_1$.
    Consequently, for integers $k \, L gt.eq 0$ and $f in R_k$,
$ z^L f in A_(k + L) wide upright("if ") k + L gt.eq a k . $

]
] <lem:chart>

#proof[
  The multisymmetric generators are described in #cite(label("RaicuSamWeyman2022")) Remark 2.9;
    we include the factor-length argument needed here. For the general multisymmetric generator theorems,
    see #cite(label("Vaccarino2005")) Theorem 1 and #cite(label("Rydh2007")) Corollary 8.4.
    For each linear form $ell$ in one list, the coefficients of
  $ frac(z \( v + t u \), z) = product_(i = 1)^a \( 1 + t ell \( Y_i \) \) $
  show that $e_h \( ell \( Y_1 \) \, dots.h \, ell \( Y_a \) \)$, and all their polarizations,
    lie in $z^(- 1) R_1$, for $1 lt.eq h lt.eq a$. Here $u$ ranges over the span of the remaining basis vectors.
  Give $e_h$ weight $h$. Newton identities express $sum_i ell \( Y_i \)^d$ as a polynomial in $e_1 \, dots.h \,
    e_a$ of weighted degree $d$, including when $d > a$. Each product has at most $d$ factors.
    Polarizing in $ell$ therefore expresses
  $ p_m = sum_i m \( Y_i \) $
  for every degree-$d$ monomial $m$ using at most $d$ polarized elementary factors.
  Invariant monomial orbit sums are scalar multiples of expressions
  $ sum_(i_1 \, dots.h \, i_h\
upright("distinct")) product_(nu = 1)^h m_nu \( Y_(i_nu) \) \, $
  where the $m_nu$ have positive degree. Inclusion-exclusion over collisions of the indices expresses this in
    products of $p_m$’s; a collision replaces monomials by their product and preserves total degree.
    Thus total degree at most $t$ requires at most $t$ elementary factors. Constants require no factors.
  For $f in R_k$, the polynomial $f \/ z^k$ is invariant and has total list degree at most $a k$.
    A term with $m lt.eq a k$ ratio factors has the form $z^(- m) g_1 dots.h.c g_m$, with $g_nu in R_1$.
    Multiplication by $z^(k + L)$ gives an element of $A_(k + L)$ when $k + L gt.eq a k$.
    Equality in the localization descends to $P$, a domain. ◻
]

#thm([Corollary 2.4.])[
  (First-row certificate).  #emph[For every integer $b gt.eq
    1$ and partition $lambda$ of $6 b$ with $sum_(i gt.eq 2) lambda_i lt.eq b$, one has
$ \[ s_lambda \] h_6 \[ h_b \] lt.eq \[ s_lambda \] h_b \[ h_6 \] . $

]
] <cor:first-row>

#proof[
  Partitions of length greater than six have zero source multiplicity, so work in $V =
    bb(C)^6$ with its standard ordered basis and put $a = 6$.
    Choose $v$ to be the first basis vector in the chart above.
    For every weight-$lambda$ polynomial $f in R_b$, the total list degree of $f \/ z^b$ is $t = lambda_2 +
    dots.h.c + lambda_6$. The first assertion of Lemma 4 writes this ratio as a linear combination of terms
    $z^(- m) g_1 dots.h.c g_m$, with $m lt.eq t lt.eq b$ and $g_nu in R_1$. Thus every corresponding term of $f$ is
  $ z^(b - m) g_1 dots.h.c g_m in A_b . $
  The entire weight-$lambda$ space of $R_b$ therefore lies in $A_b$.
    Since $A_b$ is a $"GL" \( V \)$-submodule of $R_b$, their highest-weight spaces at $lambda$ are equal:
    intersect the common weight space with the kernels of the positive simple-root operators.
    The surjection onto $A_b$ induced by (1) then gives $Q \( lambda \) gt.eq F \( lambda \)$. ◻
]

=== 2.4 An independent large-degree bound <an-independent-large-degree-bound>

We now prove surjectivity of $mu_(a \, b \, V)$ for $b gt.eq a \( a - 1 \)^2$, without using the companion.
  The chart will clear denominators uniformly once we know that $R$, as an $A$-module,
  is generated in degrees below $a$. Polarization supplies that finite-generation statement and then turns the
  chart calculation into surjectivity in large degree. We continue with arbitrary $a gt.eq 2$;
  the zero-dimensional case is immediate.

#thm([Lemma 2.5.])[
  (Polarization).  #emph[For integers $L gt.eq 1$ and $j gt.eq a L$,
$ W_j = sum_(v in V) z \( v \)^L W_(j - L) \, wide R_j = sum_(v in V) z \( v \)^L R_(j - L) . $

 The sums mean linear spans.]
] <lem:polarization>

#proof[
  The operator argument is related to the successive weight shifts in #cite(label("Ikenmeyer2015")) Section 5.
    Polarize the degree-$a L$ polynomial $v mapsto z \( v \)^L$, and multiply, to obtain a linear map
  $ "Sym"^(a L) V ⊗ W_(j - L) arrow.r W_j . $
  Its image is the first displayed span. Identify $W_j^(*)$ with polynomials $f \( x_1 \, dots.h \, x_a \)$,
    separately homogeneous of degree $j$. Introduce one auxiliary vector variable $y$.
    The dual map is, up to a nonzero scalar,
  $ f mapsto product_(i = 1)^a \( y dot.op partial_(x_i) \)^L f . $
  Indeed, evaluation of the dual pairing extracts the coefficient of $t_1^L dots.h.c
    t_a^L$ in $f \( x_1 + t_1 y \, dots.h \, x_a + t_a y \)$.
  On the polynomial space of total degree $a j$ in $x_1 \, dots.h \, x_a \, y$, the operators
  $ D_i = y dot.op partial_(x_i) \, quad E_i = x_i dot.op partial_y \, quad H_i = deg \( x_i \) - deg \( y \) $
  form an $frak(s l)_2$, with $D_i$ lowering weight by two. The other lists are spectator variables.
    The standard weight strings are described in #cite(label("FultonHarris1991")) Section 11.1, (11.5).
    In an irreducible module of highest weight $n$, a weight $w gt.eq L$ is at distance $\( n + w \) \/ 2 gt.eq
    L$ from the bottom. Therefore $D_i^L$ is injective on the full weight-$w$ space of any finite-dimensional
    module. After the first $i - 1$ shifts, the relevant weight is $j - \( i - 1 \) L gt.eq L$.
    Every shift is injective on a space containing the preceding image, so their product is injective.
    Duality proves the first identity. Average its coefficients over $frak(S)_a$; each $z \( v \)^L$ is invariant,
    proving the second identity. ◻
]

#thm([Corollary 2.6.])[
  #emph[The $A$-module $R$ is generated by $R_0 \, dots.h \, R_(a - 1)$.]
] <cor:module-generation>

#proof[
  Lemma 6 with $L = 1$ gives $R_j = R_1 R_(j - 1)$ for $j gt.eq a$; apply induction on $j$. ◻
]

#thm([Proposition 2.7.])[
  (Independent chart bound).  #emph[For $a gt.eq 2$, one has $R_b = A_b$ whenever $b gt.eq a \( a - 1 \)^2$.]
] <prop:large>

#proof[
  Take $L = \( a - 1 \)^2$, so that $L gt.eq \( a - 1 \) k$ for every $0 lt.eq k < a$.
    Lemma 4 therefore applies to each of these degrees. For any fixed nonzero $v$,
    multiply an $A$-linear expression in the generators of Corollary 7 by $z \( v \)^L$;
    this gives $z \( v \)^L R subset A$. The same assertion is trivial for $v = 0$. If $b gt.eq a L$, Lemma 6 now yields
  $ R_b = sum_v z \( v \)^L R_(b - L) subset.eq A_b . $
  The opposite inclusion is definitional. ◻
]

For $a = 6$, Proposition 8 supplies the independent large-degree range $b gt.eq 150$.
  Combined with the retained finite verification through $b = 149$,
  it proves Theorem 1 without the quadratic-stabilization input.
  The main proof needs only $6 lt.eq b lt.eq 29$, since Corollary 2 applies from $b = 30$.

== 3 An upper bound and two exact recurrences <sec:upper>

We compare the source and target multiplicities without computing both at every partition.
  This section supplies a gap-monotone upper bound $U \( d \) gt.eq F \( d \)$,
  together with exact recurrences for the target tables and for the source values needed when that bound is
  inconclusive. All three constructions come from coefficient extraction with Schur alternants.

=== 3.1 The signed strip rule <the-signed-strip-rule>

The coefficient rule below is the complete-symmetric case of the plethystic Murnaghan–Nakayama rule;
  see #cite(label("DesarmenienLeclercThibon1994")) pp. 28–29 and #cite(label("Wildon2016")) arXiv:1408.3554v2,
  equation (2). Its residue-class determinant formulation also appears in #cite(label("CaoJingLiu2025"))
  Theorem 3.4 and Corollary 3.11. We include the proof and the containment inequalities in the form needed by the
  exact calculation.

For $n$ variables put $delta_n = \( n - 1 \, dots.h \, 0 \)$.
  The next rule bounds a single removal step in a product of factors $h_b \( X^i \)$,
  and also enumerates that step exactly.

#thm([Lemma 3.1.])[
  (Signed strips).  #emph[Let $gamma \, mu$ be partitions of length at most $n$,
    and suppose $\| gamma \| - \| mu \| = i b$, where $i \, b gt.eq 1$. Then
$ \[ s_gamma \] thin h_b \( X^i \) s_mu \( X \) in { 0 \, 1 \, - 1 } . $

 For a nonzero coefficient one necessarily has
$ gamma_j gt.eq mu_j \, wide mu_j gt.eq gamma_(j + i) quad upright("whenever the subscripts are in range") . $

 Here $X^i = \( x_1^i \, dots.h \, x_n^i \)$.]
] <lem:strips>

#proof[
  Set $l = gamma + delta_n$ and $a = mu + delta_n$. Multiplying by the Schur alternant denominator
    #cite(label("Macdonald1995")) Chapter I, equation (3.1) gives
  $ \[ s_gamma \] h_b \( X^i \) s_mu \( X \) = det #scale(x: 120%, y: 120%)[\[]
    bold(1)_({ a_k lt.eq l_j \, med a_k equiv l_j med \( mod med i \) }) #scale(x: 120%, y: 120%)[\]]_(j \, k = 1)^n . $
  Indeed its determinant expansion assigns the entries of $a$ to positions $j$, with assigned values $beta_j$ satisfying
  $ beta_j lt.eq l_j \, wide beta_j equiv l_j med \( mod med i \) . $
  The size condition makes the sum of the decrement quotients equal to $b$,
    so there is no further constraint from $h_b \( X^i \)$.
  Group the rows and columns by residue modulo $i$, preserving decreasing order within each group.
    Unequal row and column counts in a residue give zero, and empty blocks contribute one.
    In a square block of size $m$, each row support is a terminal interval of columns,
    and the supports decrease with the row index. A zero row or repeated support makes the determinant zero.
    Otherwise their sizes are $m \, m - 1 \, dots.h \, 1$: the block is upper triangular with diagonal entries
    one, and its only allowed matching is the diagonal. Translating this matching back to the original positions gives
  #[#set math.equation(numbering: n => "(3)")
   $ beta_j lt.eq l_j \, wide beta_j > l_(j') quad upright("if ") j'
     upright(" is the next position of the same residue") . $ <eq:stripconditions>]
  There is therefore just one surviving assignment. The sign from sorting the assembled $beta$’s is the remaining
    row-and-column ordering sign, which proves the asserted coefficient values.
  Sorting the componentwise inequalities $beta_j lt.eq l_j$ gives $mu_j lt.eq gamma_j$.
    For the other inequality, consider the first $j + i$ entries of $l$.
    At most one per residue lacks a preceding entry of that residue.
    Each of the remaining at least $j$ entries has a predecessor position whose assigned value, by (3),
    is at least $l_(j + i) + i$. The $j$-th largest assigned value is therefore at least $l_(j + i) + i$,
    which after removing the staircases says $mu_j gt.eq gamma_(j + i)$. ◻
]

=== 3.2 A monotone upper certificate <a-monotone-upper-certificate>

Averaging the permutations of six tensor factors projects onto $"Sym"^6 \( "Sym"^b V \)$.
  Taking traces gives the cycle formula

#[#set math.equation(numbering: n => "(4)")
 $ h_6 \[ h_b \] \( X \) = 1 / 720 sum_(pi in frak(S)_6) product_(upright("cycles ") c upright(" of ") pi)
   h_b \( X^(\| c \|) \) . $ <eq:cycle>]

We bound a coefficient of each product by removing its factors one at a time.
  The signed strip rule restricts the intermediate partitions;
  the bound below counts their possible coordinates while discarding their signs and some of their constraints.

For a nonnegative gap vector $d$, define

$ h_(s j) = 1 + lambda \( d \)_j - lambda \( d \)_(j + 6 - s) \, wide N_s \( d \) =
  frac(product_(j = 1)^s h_(s j), max_(1 lt.eq j lt.eq s) h_(s j)) quad \( 2 lt.eq s lt.eq 5 \) \, wide N_0 =
  N_1 = 1 . $

For an ordered list $I = \( i_1 \, dots.h \, i_v \)$ with positive entries summing to six put

$ B_I \( d \) = product_(u = 1)^v N_(6 - i_1 - dots.h.c - i_u) \( d \) \, wide U \( d \) = ⌊1 /
  720 sum_(pi in frak(S)_6) min_(I tilde.op pi) B_I \( d \)⌋ \, $

where $I tilde.op pi$ means any ordering of the cycle lengths of $pi$.
  This definition makes sense even when $6 divides.not w \( d \)$.

#thm([Proposition 3.2.])[
  #emph[The function $U$ is nondecreasing in every gap. For every nonnegative gap vector $d$ with $6 divides
    w \( d \)$, one has $F \( d \) lt.eq U \( d \)$.]
] <prop:upper>

#proof[
  Each $N_s$ is the minimum of the products obtained by omitting one of the widths $h_(s j)$.
    Every width is nondecreasing in the gaps, proving monotonicity through the products, minima, sum, and floor.
  The zero vector has $F \( 0 \) = U \( 0 \) = 1$, so assume $b = w \( d \) \/ 6 gt.eq 1$.
    Remove the factors of one product in (4) in an order $I$.
    After lengths totaling $6 - s$ have been removed, the remaining product is the trace of a permutation of the
    $s$ factors on $\( "Sym"^b V \)^(⊗ s)$, together with the diagonal $"GL" \( V \)$-action.
    The permutation commutes with that action, so its Schur support lies among the constituents of the tensor
    power. Those have length at most $s$ by Pieri’s rule #cite(label("Macdonald1995")) Chapter I, equation (5.16).
    Iterating Lemma 9, every possible intermediate partition $mu$ satisfies
  $ \| mu \| = s b \, wide lambda_(j + 6 - s) lt.eq mu_j lt.eq lambda_j quad \( 1 lt.eq j lt.eq s \) . $
  Fix all but one coordinate; the sum fixes the remaining one.
    Thus there are at most $N_s \( d \)$ choices for $2 lt.eq s lt.eq 5$, and at most one for $s = 0 \, 1$.
    Each chain has absolute coefficient at most one. The coefficient of the product consequently has absolute
    value at most $B_I \( d \)$, for every order $I$. Average these bounds in (4) and use the integrality of
    $F \( d \)$. ◻
]

In Appendix 8, #raw("init_masks") lists the eleven cycle types with their class sizes and the remaining lengths $s
  in { 2 \, 3 \, 4 \, 5 }$ for each removal order. The routine #raw("ub_cycle") forms the corresponding products
  of $N_s$, takes their minima, and performs the weighted sum and division by $720$.

=== 3.3 Exact coefficients <exact-coefficients>

The target tables and the remaining source comparisons use Newton’s identity in place of a bound.
  For an integer vector $v$ of length $n$, a #emph[signed lookup] is zero if $v$ has a negative entry or a
  repeated entry. Otherwise sort $v$ decreasingly, subtract $delta_n$,
  and multiply the coefficient at that partition by the sorting sign.
  A strictly decreasing nonnegative integer list is at least $delta_n$ componentwise,
  so this subtraction always gives a partition.

Write $Q_b \( lambda \) = \[ s_lambda \] h_b \[ h_6 \]$ and $tilde(Q)_b \( v \)$ for its signed lookup in $n$
  variables. The initial value is $Q_0 \( 0 \) = 1$. Newton’s identity #cite(label("Macdonald1995")) Chapter I,
  equation (2.11), multiplied by the alternating denominator, gives

#[#set math.equation(numbering: n => "(5)")
 $ b Q_b \( lambda \) = sum_(i = 1)^b med sum_(alpha in bb(Z)_(gt.eq 0)^n\
\| alpha \| = 6) tilde(Q)_(b - i) \( lambda + delta_n - i alpha \) . $ <eq:targetrec>]

Indeed $h_6 \( X^i \) = sum_(\| alpha \| = 6) X^(i alpha)$.
  Every nonzero previous partition $mu$ in this formula satisfies $mu lt.eq lambda$ componentwise:
  subtracting a nonnegative vector cannot increase any decreasing order statistic,
  and the same staircase is then subtracted. In particular,
  a bound on a partition’s tail is preserved in all previous lookups.

For the source, fix $b$ and set

$ H_j \( gamma \) = \[ s_gamma \] h_j \[ h_b \] \, wide H_0 \( 0 \) = 1 . $

Newton’s identity now gives the source recurrence; compare the character formulation in
  #cite(label("EvseevPagetWildon2014")) Proposition 5.1:

#[#set math.equation(numbering: n => "(6)")
 $ j H_j \( gamma \) = sum_(i = 1)^j med sum_mu \[ s_gamma \] #scale(x: 120%, y: 120%)[\(] h_b \( X^i \)
   s_mu \( X \) #scale(x: 120%, y: 120%)[\)] H_(j - i) \( mu \) \, wide \| mu \| = \( j - i \) b . $ <eq:sourcerec>]

At stage $j$, $n = j$ variables suffice. Lemma 9 gives an economical enumeration. Put $l = gamma + delta_j$.
  In each residue modulo $i$, its last assigned value must be that residue’s least nonnegative representative:
  the partition $mu$ has length at most $j - i$, so its shifted list ends in $i - 1 \, dots.h \, 0$.
  If any residue is absent, there is no term. At every other position $h$,
  whose next position in its residue is $h'$, choose

$ beta_h = l_h - i x_h \, wide 0 lt.eq x_h lt.eq \( l_h - l_(h') \) \/ i - 1 . $

The sum of all decrement quotients, including the fixed last ones, is $b$. These choices have distinct values:
  different residues cannot coincide, and in the same residue $beta_h > l_(h') gt.eq beta_(h')$.
  The fixed representatives $0 \, dots.h \, i - 1$ are the smallest $i$ values.
  Thus sorting and subtracting $delta_j$ gives a partition $mu$ of length at most $j - i$, with the sorting sign.
  Every such choice contributes once. This is exactly the routine #raw("strip") in Appendix 8.
  Equation (5) is implemented by #raw("gen"), #raw("Make"), and #raw("QTail"); (6) by #raw("Source").

== 4 A power bound from leading monomials <sec:lower>

Rectangular shifts give a first lower bound for $Q$. The following bound amplifies a known multiplicity.

The sumset estimate is the repeated-set case of the Matolcsi–Ruzsa inequality #cite(label("MatolcsiRuzsa2010"))
  preprint, Theorem 1.5; take $A = B = D$ and $r = k - 1$ there when $k gt.eq 2$.
  See also #cite(label("BoroczkySantosSerra2014")) author version, Corollary 2.
  We include a self-contained triangulation proof. Its generic-point assignment is closely related to the
  half-open-simplex count used in #cite(label("BoroczkySantosSerra2014")) author version, Theorem 20,
  where the regions are instead obtained from a shelling.

#thm([Lemma 4.1.])[
  (Sumsets).  #emph[Let $D$ be a nonempty finite set of $C$ points in a real vector space,
    of affine dimension $h$. Write $k D = { v_1 + dots.h.c + v_k : v_1 \, dots.h \, v_k in D }$.
    For this $k$-fold sumset, $k gt.eq 1$, one has
$ \| k D \| med gt.eq med f \( C \, h \, k \) := binom(k + h, h) + \( C - 1 - h \) binom(k + h - 1, h) . $

]
] <lem:sumset>

#proof[
  The case $h = 0$ is immediate. Triangulate $"conv" D$ using every point of $D$ as a vertex and no other
    vertices. Such a triangulation can be built by starting with a full-dimensional simplex from $D$,
    then inserting points. For a point in the current hull, subdivide the simplices through its minimal containing
    face in the current triangulation by coning from it, retaining the induced common face subdivisions.
    For a point outside the hull, cone from it to the boundary simplices on strictly visible facets.
    Rays from the new point give the intersection and coverage assertions in the latter construction.
    Both operations preserve all previous vertices.
  Choose $p$ in the relative interior of the hull, off all hyperplanes of facets of full-dimensional simplices.
    Assign $x in "conv" D$ to the unique full simplex whose interior contains $\( 1 - epsilon.alt \) x +
    epsilon.alt p$ for all sufficiently small positive $epsilon.alt$.
    There are finitely many facet hyperplanes, so this rule is well defined.
  In barycentric coordinates of one full simplex, this assigned region requires nonnegative coordinates,
    with strict positivity exactly at the indices where the corresponding coordinate of $p$ is negative.
    Assign a sum of $k$ vertices according to its average, which lies in $"conv" D$.
    If there are $e$ strict indices, the sums of $k$ vertices of this simplex whose averages are assigned to it
    number $binom(k - e + h, h)$, interpreted as zero if $k < e$.
    Affine independence makes these points distinct; the assignment makes the counted sets for different simplices
    disjoint subsets of $k D$.
  There is exactly one simplex with $e = 0$, namely the one containing $p$.
    At $k = 1$ the counting rule counts precisely the $C$ vertices.
    To see this, a vertex of the complex lying in a full simplex must be a vertex of that simplex,
    by the common-face property. Its assigned simplex therefore counts it.
    A simplex with $e = 0$ contributes $h + 1$, one with $e = 1$ contributes $1$, and all others contribute zero.
    Thus exactly $C - h - 1$ simplices have $e = 1$. Keeping just the $e = 0 \,
    1$ contributions for arbitrary $k$ proves the bound. ◻
]

The leading-monomial argument in the next proposition is an elementary instance of the value-semigroup method:
  dimensions are counted by distinct values, and multiplication adds values;
  see #cite(label("KavehKhovanskii2012")) preprint, Propositions 2.3, 2.6, and 2.10.
  We give the finite-degree argument and the dimension estimate explicitly,
  since their quantitative form is used in the certificate.

#thm([Proposition 4.2.])[
  (Power certificate).  #emph[Suppose $Q \( x \) gt.eq C > 0$, where $C$ is an integer and $w \( x \) =
    6 d_0$ with $d_0 > 0$. Put
$ z = min (18 \, med min {h gt.eq 0 : binom(d_0 + h, h) gt.eq C}) . $

 Then for all $k gt.eq 1$,
#[#set math.equation(numbering: n => "(7)")
 $ Q \( k x \) gt.eq f \( C \, z \, k \) . $ <eq:power>]

]
] <prop:power>

The cap at $18$ only weakens the lower bound; it limits the integer arithmetic in Section 7.

#proof[
  Choose $C$ independent highest-weight polynomials at $x$ in the polynomial algebra $S =
    "Sym" \( "Sym"^6 bb(C)^6 \)$. Row reduction with respect to a fixed monomial order gives a basis with distinct
    leading monomials. Their exponent vectors form a set $D$ of size $C$,
    all with nonnegative integer entries summing to $d_0$. For each point of $k D$,
    choose a product of $k$ basis elements with that leading exponent.
    The products have distinct leading monomials and hence are independent highest-weight polynomials at $k x$.
    Thus $Q \( k x \) gt.eq \| k D \|$.
  Let $h = dim "aff" D$. Some projection onto $h$ coordinate positions is injective on $"aff" D$,
    by a nonzero maximal minor of its direction space. The projected integer points are nonnegative with sum at
    most $d_0$, so
  $ C lt.eq binom(d_0 + h, h) \, wide z lt.eq h lt.eq C - 1 . $
  Lemma 11 applies. Finally, for $0 lt.eq j < h$ one computes
  $ frac(f \( C \, j + 1 \, k \) - f \( C \, j \, k \), binom(k + j - 1, j)) =
    frac(\( k - 1 \) \( C - j - 1 \), j + 1) gt.eq 0 . $
  This proves $f \( C \, h \, k \) gt.eq f \( C \, z \, k \)$.
    The formula also covers $C = 1$, when $h = z = 0$, and $k = 1$. ◻
]

== 5 Certificates in degrees below 150 <sec:certificates>

We now combine the upper bound $F lt.eq U$, exact target multiplicities, and highest-weight multiplication.
  The base interval $6 lt.eq b lt.eq 25$ is checked directly.
  Beyond it, exact target values supply lower-bound seeds: they are computed from the target recurrence without
  assuming the desired comparison. The resulting certificates leave a set of partitions whose exact differences
  will be checked in Section 6. We retain the full interval through $b = 149$ for the independent chart proof;
  only $b lt.eq 29$ is needed with quadratic stabilization.

=== 5.1 Initial tables and the base interval <initial-tables-and-the-base-interval>

Compute $Q$ using (5) on the following four sets. All partitions have length at most six.

#[#set math.equation(numbering: n => "(8)")
 $ upright("degrees") & upright("additional restriction") & upright("variables used")\
0 lt.eq b lt.eq 25 & upright("none") & 6\
0 lt.eq b lt.eq 149 & "length" \( lambda \) lt.eq 3 & 3\
0 lt.eq b lt.eq 55 & "length" \( lambda \) lt.eq 4 & 4\
0 lt.eq b lt.eq 45 & t_3 \( d \) lt.eq 18 & 6 $ <eq:tables>]

Previous-degree lookups remain in the applicable set by Section 3.
  The first table supplies the direct base comparisons; all four supply lower-bound seeds for larger degrees.
  Overlaps are immaterial.

For $6 lt.eq b lt.eq 25$, every partition is first tested against $Q \( d \) gt.eq U \( d \)$.
  When this fails, compute $F \( d \) = H_6 \( lambda \( d \) \)$ exactly by (6).
  Only these requested values at the last stage $j = 6$ are needed.
  Table 1 records all the fallback comparisons and their equalities.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$b$
], table.cell(rowspan: 1, colspan: 1)[exact comparisons
], table.cell(rowspan: 1, colspan: 1)[equalities
], table.cell(rowspan: 1, colspan: 1)[$b$
], table.cell(rowspan: 1, colspan: 1)[exact comparisons
], table.cell(rowspan: 1, colspan: 1)[equalities
]),
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[2428
], table.cell(rowspan: 1, colspan: 1)[2428
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[7370
], table.cell(rowspan: 1, colspan: 1)[354
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[4476
], table.cell(rowspan: 1, colspan: 1)[315
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[7599
], table.cell(rowspan: 1, colspan: 1)[369
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[6820
], table.cell(rowspan: 1, colspan: 1)[255
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[7801
], table.cell(rowspan: 1, colspan: 1)[384
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[6899
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[8057
], table.cell(rowspan: 1, colspan: 1)[399
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[6886
], table.cell(rowspan: 1, colspan: 1)[264
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[8233
], table.cell(rowspan: 1, colspan: 1)[414
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[6814
], table.cell(rowspan: 1, colspan: 1)[279
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[8427
], table.cell(rowspan: 1, colspan: 1)[429
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[6850
], table.cell(rowspan: 1, colspan: 1)[294
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[8650
], table.cell(rowspan: 1, colspan: 1)[444
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[6872
], table.cell(rowspan: 1, colspan: 1)[309
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[8850
], table.cell(rowspan: 1, colspan: 1)[459
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[6973
], table.cell(rowspan: 1, colspan: 1)[324
], table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[9031
], table.cell(rowspan: 1, colspan: 1)[474
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[7131
], table.cell(rowspan: 1, colspan: 1)[339
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[9268
], table.cell(rowspan: 1, colspan: 1)[489
],
)
]],
  caption: [Table 1: The base interval: $145435$ exact fallback comparisons, $9272$ equalities, and no negative difference. All other partitions pass $Q gt.eq U$. ],
)

=== 5.2 Residues and transport of lower bounds <residues-and-transport-of-lower-bounds>

For $26 lt.eq b lt.eq 149$ we need only consider $d_6 < 6$, by Lemma 3. There is a unique expression

$ d = r + 6 m \, wide r in cal(R) = { 0 \, dots.h \, 5 }^6 ∩ { 6 divides w \( r \) } \, wide m in cal(G) =
  { m in bb(Z)_(gt.eq 0)^6 : m_6 = 0 \, med w \( m \) lt.eq 149 } . $

Write $b_0 \( r \) = w \( r \) \/ 6$, so that $b = b_0 \( r \) + w \( m \)$. There are $7776$ residues:
  choose $r_2 \, dots.h \, r_6$, and $r_1$ is uniquely determined modulo six. Moreover $b_0 \( r \) lt.eq 17$.
  The grid $cal(G)$ has $6611697$ points. We call its indices $m$ modes:
  fixing $m$ groups the $7776$ possible residues for simultaneous testing.
  Pairs whose degree lies outside $26 lt.eq b lt.eq 149$ will not require a test.

For an array on a downward-closed set, #emph[propagation] replaces its value at $m$ by the maximum of all values
  at indices $u lt.eq m$. Extending an array means filling new positions by zero and propagating.
  An increasing-$w$ sweep taking maxima with the five immediate predecessors performs this operation.
  A reverse sweep through the same predecessors forms the downward closure of a set.
  Lemma 3 shows that propagation preserves every lower bound for $Q \( r + 6 m \)$, with $r$ fixed.

The same multiplication lemma also transports a multiplicity from residue zero to residue $r$.
  Suppose $J \( u \) lt.eq Q \( 6 u \)$ for $u in cal(G)$, $M \( m \) lt.eq Q \( r + 6 m \)$,
  and $E subset.eq cal(G)$ is a set of indices satisfying $Q \( r + 6 c \) > 0$ for $c in E$.
  Multiplication by one nonzero highest-weight polynomial at $r + 6 c$ gives

#[#set math.equation(numbering: n => "(9)")
 $ Q \( r + 6 m \) gt.eq max ({ M \( m \) } union { J \( m - c \) : c in E \, med c lt.eq m }) . $ <eq:transport>]

The right side certifies the comparison whenever it is at least $U \( r + 6 m \)$.
  No product of two multiplicity dimensions is used: a single nonzero factor gives each injection.

We first construct $J$ and choices of $M \, E$ valid for every residue, so that one test can discard a whole mode.
  For the modes left over we use more precise choices depending on $r$.
  The following construction specifies all arrays and tests; the common cap $Z = 2^100$ is applied only to lower bounds.

=== 5.3 Certificates shared by all residues <certificates-shared-by-all-residues>

===== 5.3.1 A shared power table. <a-shared-power-table.>

Initialize $J \( m \) = 1$ on $cal(G)$, using the rectangle occurrences and the nonzero constant at $m = 0$.
  For every gap vector $x$ with $x_6 = 0$, $Q \( x \) > 1$, and known value in one of the first three sets of (8),
  put $d_0 = w \( x \) \/ 6$ and $C = min \( Q \( x \) \, Z \)$.
  For each integer $k gt.eq 1$ with $k d_0 lt.eq 149$ and all entries of $k x$ divisible by six, update

$ J \( k x \/ 6 \) med arrow.l med max { J \( k x \/ 6 \) \, med min \( Z \, f \( C \, z \, k \) \) } \, $

where $z$ is as in Proposition 12. Then propagate. It follows that

#[#set math.equation(numbering: n => "(10)")
 $ J \( m \) lt.eq Q \( 6 m \) quad \( m in cal(G) \) . $ <eq:Jbound>]

===== 5.3.2 Common multiplicities and occurrences. <common-multiplicities-and-occurrences.>

For each $r$, initialize the exact array $Q \( r + 6 u \)$ on $w \( u \) lt.eq 25 - b_0 \( r \)$,
  then extend it to $w \( m \) lt.eq 42$. Take the pointwise minimum of these propagated arrays over all $r$,
  with a cap at $Z$, to obtain $M_0$ on that grid. Let $E_0$ be the minimal points where $M_0 > 0$,
  before extending $M_0$ to all of $cal(G)$. Then

#[#set math.equation(numbering: n => "(11)")
 $ M_0 \( m \) lt.eq Q \( r + 6 m \) quad upright("for every ") r \, wide Q \( r + 6 c \) > 0 quad
   upright("for every ") r upright(" and ") c in E_0 . $ <eq:Mbound>]

The exact entries supplying the minimum may come from different predecessors for different $r$.
  Their common consequence is precisely the two universal inequalities in (11).

===== 5.3.3 Selecting modes. <selecting-modes.>

Keep a mode $m in cal(G)$ unless either $w \( m \) + 17 lt.eq 25$, or

#[#set math.equation(numbering: n => "(12)")
 $ max ({ M_0 \( m \) } union { J \( m - c \) : c in E_0 \, med c lt.eq m }) gt.eq
   U \( 6 m + \( 5 \, 5 \, 5 \, 5 \, 5 \, 5 \) \) . $ <eq:sharedtest>]

The first condition puts every residue in the already settled base range whenever its degree is at least six.
  For the second, use (9) with $M = M_0$ and $E = E_0$. Proposition 10 bounds $F \( r + 6 m \)$ by
  $U \( 6 m + \( 5 \, 5 \, 5 \, 5 \, 5 \, 5 \) \)$, because $r lt.eq \( 5 \, 5 \, 5 \, 5 \, 5 \, 5 \)$.
  The high-residue gap vector need not be admissible; $U$ is defined and monotone there nonetheless.

=== 5.4 Tests for each remaining residue <tests-for-each-remaining-residue>

Form the downward closure of the retained modes. On this closure,
  initialize $Q \( r + 6 m \)$ wherever it is available in (8), use zero elsewhere, and propagate to obtain $M_r$.
  Let $E_r$ be the minimal positive locations of the exact array $Q \( r + 6 u \)$ on $w \( u \) lt.eq 25 -
  b_0 \( r \)$. For each originally retained mode with $26 lt.eq b_0 \( r \) + w \( m \) lt.eq 149$, put $d = r +
  6 m$ and clear the pair if either

$ t_1 \( d \) lt.eq b quad upright("or") quad
  max ({ M_r \( m \) } union { J \( m - c \) : c in E_r \, med c lt.eq m }) gt.eq U \( d \) . $

Flag it otherwise. The first test is Corollary 5. The second is (9) with $M = M_r$ and $E = E_r$.

Minimal positive locations can be found by checking the immediate predecessors.
  Indeed positive exact multiplicities form an upper set within the small grid, by the rectangular shifts;
  the propagated common array has the same property. The set used for $M_r$ retains every predecessor needed for
  propagation. Each difference $m - c$ in a mixed test is nonnegative and lies in $cal(G)$.

In Appendix 8, #raw("powerAll") stores $J$, #raw("uniBase") and #raw("uOcc") store $M_0$ and $E_0$.
  The routine #raw("setup") retains the modes and their downward closure, #raw("init_occ") constructs $E_r$,
  and #raw("TestSpec") propagates $M_r$ and tests the remaining pairs.
  The routine #raw("run") performs the base-interval comparisons.

#thm([Finite verification 5.1.])[
  #strong[Finite verification 13].  #emph[The complete program in Appendix 8 verifies the base comparisons in
    Table 1. Its mode list has $87354$ points, or $114314$ after taking the downward closure.
    It flags $4969698$ pairs in the middle interval, all with $t_2 \( d \) lt.eq 27$.
    Their counts by degree range appear in Table 2.]
] <ver:certificates>

Every pair in $26 lt.eq b lt.eq 149$ cleared by these tests satisfies $Q gt.eq F$,
  by the proved upper and lower bounds or the chart. Verification 13 supplies the separate finite assertion that
  every pair left over has $t_2 lt.eq 27$. Thus it remains only to check the entire band $t_2 lt.eq
  27$ in $26 lt.eq b lt.eq 149$.

== 6 Exact differences in the small-tail band <sec:band>

We compute the entire band

$ 26 lt.eq b lt.eq 149 \, wide lambda = \( 6 b - B - \| eta \| \, B \, eta \) \,\
eta_1 gt.eq dots.h.c gt.eq eta_4 gt.eq 0 \, quad \| eta \| lt.eq 27 \, quad eta_1 lt.eq
  B lt.eq ⌊frac(6 b - \| eta \|, 2)⌋ . $

In particular it contains every flagged partition of Verification 13.
  For each fixed tail $eta$, we will construct seven Laurent series independent of $b$.
  Their coefficients at $B \, B - b \, dots.h \, B - 6 b$ will sum to $720 \( Q \( lambda \) - F \( lambda \) \)$.
  The same seven rows therefore serve every degree and every second part in the displayed range.
  Write $cal(Q)_b = h_b \[ h_6 \]$, $cal(F)_b = h_6 \[ h_b \]$, and set

$ cal(C) \( q \, y \) = \( 1 - q \) product_(ell = 1)^4 \( 1 - y_ell \) \( 1 - y_ell \/ q \) \, quad
  cal(A) \( y \) = product_(ell < h) \( 1 - y_h \/ y_ell \) \, quad D \( q \) = product_(h = 1)^6 \( 1 - q^h \) . $

We first expand the characters and geometric products in the tail variables $y$,
  and then expand their rational coefficients in $q$ as Laurent series at $q = 0$.
  In particular, $D \( q \)^(- 1)$ has only nonnegative powers.

=== 6.1 Coefficient extraction and truncation <coefficient-extraction-and-truncation>

The normalized alternating Schur formula gives

#[#set math.equation(numbering: n => "(13)")
 $ Q \( lambda \) - F \( lambda \) = \[ q^B y^eta \] cal(C) \( q \, y \)
   cal(A) \( y \) \( cal(Q)_b - cal(F)_b \) \( 1 \, q \, y \) . $ <eq:bandextract>]

Indeed in six variables it extracts the coefficient of $x^lambda$ after multiplication by
  $product_(i < j) \( 1 - x_j \/ x_i \)$. Distinct decreasing shifted partitions cannot be permutations of each
  other, so only the Schur term at $lambda$ contributes. All Laurent monomials have total degree $6 b$;
  setting the first variable to one loses no information about its exponent once the remaining five are fixed.

Give each $y_ell$ degree one and $q$ degree zero. The monomials of $cal(A)$ have total $y$-degree zero;
  those of $cal(C)$ have nonnegative total $y$-degree. Character terms above degree $27$ therefore cannot
  contribute to (13). This uses total degree even when individual exponents in the alternant are negative.
  Write $equiv_27$ for equality of coefficients of nonnegative $y$-monomials through total degree $27$,
  with coefficients in $bb(Q) \( q \)$.

=== 6.2 Seven numerators independent of the degree <seven-numerators-independent-of-the-degree>

For $0 lt.eq j lt.eq 6$ define

$ L_j \( q \, y \) = product_(tau in bb(Z)_(gt.eq 0)^4 \, med 1 lt.eq \| tau \| lt.eq 6\
0 lt.eq u lt.eq 6 - \| tau \|) \( 1 - y^tau q^(u - j) \)^(- 1) . $

Then

#[#set math.equation(numbering: n => "(14)")
 $ cal(Q)_b \( 1 \, q \, y \) equiv_27 frac(1, D \( q \)) sum_(j = 0)^6 q^(j b) \( - 1 \)^j
   e_j \( q \, q^2 \, dots.h \, q^6 \) L_j \( q \, y \) . $ <eq:targetband>]

To prove this, fix a multiset of $k$ inner monomials with nonzero tail.
  The remaining $b - k$ entries come from $1 \, q \, dots.h \, q^6$, with generating polynomial

$ h_(b - k) \( 1 \, q \, dots.h \, q^6 \) = product_(h = 1)^6 frac(1 - q^(b - k + h), 1 - q^h)
  quad \( b - k gt.eq 0 \) . $

This Gaussian polynomial counts partitions in a $6$-by-$\( b - k \)$ rectangle.
  In general their generating polynomial $P_(r \, s)$, with at most $r$ rows of length at most $s$,
  satisfies $P_(r \, s) = P_(r \, s - 1) + q^s P_(r - 1 \, s)$,
  by removing a row of length $s$ when one is present, and $P_(0 \, s) = P_(r \, 0) = 1$.
  The displayed product with $r = b - k \, s = 6$ satisfies the same recurrence and boundary values,
  proving the formula. Expanding the numerator gives the $e_j$ in (14);
  the factor $q^(- j k)$ contributes $q^(- j)$ per selected tail monomial, and hence produces $L_j$.
  Within the cutoff $k lt.eq 27$ and $b gt.eq 26$, so the only possible negative value of $b - k$ is $- 1$.
  Its numerator has the factor $1 - q^0$ and vanishes, exactly as required.
  Thus the formula includes the boundary $b = 26 \, k = 27$; its cancellation is across the seven $j$-terms.

Similarly, the binary complement of one tail monomial gives

#[#set math.equation(numbering: n => "(15)")
 $ h_b \( 1 \, q \, y \) equiv_27
   frac(product_ell \( 1 - y_ell \)^(- 1) - q^(b + 1) product_ell \( 1 - y_ell \/ q \)^(- 1), 1 - q) .
   $ <eq:binarysource>]

At tail degree $t$, its coefficient is $\( 1 - q^(b + 1 - t) \) \/ \( 1 - q \)$.
  It counts the binary monomials when $t lt.eq b$ and is zero at $t = b + 1$, the only extra possible degree.

For a cycle type $I = \( i_1 \, dots.h \, i_v \) tack.r 6$, let

$ n_I = frac(720, product_(r gt.eq 1) r^(m_r) m_r !) \, wide E_I \( q \) =
  frac(D \( q \), product_(h = 1)^v \( 1 - q^(i_h) \)) \, $

where $m_r$ counts cycles of length $r$. The quotient $E_I$ is an integer polynomial of degree $15$:
  the multiplicity of the cyclotomic factor $Phi_d$ in its denominator is the number of cycle lengths divisible by
  $d$, which is at most $floor.l 6 \/ d floor.r$, its multiplicity in $D$.
  Apply (15) with variables raised to each cycle length in (4). Together with (14) this yields

#[#set math.equation(numbering: n => "(16)")
 $ 720 D \( q \) \( cal(Q)_b - cal(F)_b \) \( 1 \, q \, y \) equiv_27 sum_(j = 0)^6 q^(j b) G_j \( q \, y \) \,
   $ <eq:seven>]

where the seven numerators are explicitly

#[#set math.equation(numbering: n => "(17)")
 $ G_j \( q \, y \) =  & 720 \( - 1 \)^j e_j \( q \, dots.h \, q^6 \) L_j \( q \, y \)\
 & - sum_(I tack.r 6) n_I sum_(J subset.eq { 1 \, dots.h \, v }\
sum_(h in J) i_h = j) \( - 1 \)^(\| J \|) q^j E_I \( q \) product_(ell = 1)^4
  product_(h = 1)^v \( 1 - y_ell^(i_h) q^(- i_h bold(1)_(h in J)) \)^(- 1) . $ <eq:G>]

Here $bold(1)_(h in J)$ is the indicator of membership. Every selected second term of (15) contributes $-
  q^(i_h \( b + 1 \))$, explaining the sign and the residual $q^j$ after $q^(j b)$ is factored out.
  Equal-length cycles still have distinct positions in the subset sum.
  These formulas involve eleven cycle types and seven values of $j$, regardless of $b$.

=== 6.3 Computing the numerators <computing-the-numerators>

Write $L_(j \, a) = \[ y^a \] L_j$. Euler differentiation of the product gives

#[#set math.equation(numbering: n => "(18)")
 $ L_(j \, 0) = 1 \, wide \| a \| L_(j \, a) = sum_(tau \, u) med sum_(i gt.eq 1\
i tau lt.eq a) \| tau \| q^(i \( u - j \)) L_(j \, a - i tau) quad \( \| a \| > 0 \) . $ <eq:euler>]

For example, this follows by differentiating the logarithmic series $sum_(i gt.eq 1) \( y^tau q^(u - j) \)^i \/
  i$. Its denominator $i$ cancels the extra $i$ from differentiation.
  Every lookup has smaller total tail degree, and the division by $\| a \|$ is exact.

For the source product in (17), put

$ A_J \( m \) = \[ z^m \] product_(h in J) \( 1 - z^(i_h) \)^(- 1) . $

At a single tail-coordinate exponent $m$, its Laurent coefficient is

$ sum_(p = 0)^m A_J \( p \) A_(macron(J)) \( m - p \) q^(- p) . $

Multiply these four one-coordinate polynomials and then $\( - 1 \)^(\| J \|) n_I q^j E_I \( q \)$.
  These are the #raw("ways") arrays and convolutions of #raw("source") in Appendix 9.
  The routines #raw("target") and #raw("gen_source") implement (18) and the cycle-type enumeration.

All raw arrays are symmetric in the four tail variables, so they need only be stored at decreasing nonnegative
  exponent vectors; arbitrary orders are looked up by sorting, without a sign.
  To multiply by the cross factors in $cal(C)$, the coefficient at a shift $v in { 0 \, 1 \, 2 }^4$ is

$ \( - 1 \)^(n_1) q^(- n_2) \( 1 + q^(- 1) \)^(n_1) \, wide n_s = \# { ell : v_ell = s } . $

An in-place sweep in decreasing tail degree reads unmodified lower-degree rows.
  A subsequent decreasing-exponent sweep multiplies by $1 - q$. This is the routine #raw("cross").

The cross factors preserve symmetry in the four tail variables.
  To extract a Schur coefficient, we now apply the alternating factor $cal(A)$;
  the permutation signs enter at this step, rather than in the sorted lookups.
  Put $rho = \( 3 \, 2 \, 1 \, 0 \)$, and let $M_(j \, a) = \[ y^a \] cal(C) G_j$,
  with value zero at a vector with a negative coordinate. The exact row produced by #raw("schur_row") is

#[#set math.equation(numbering: n => "(19)")
 $ R_(j \, eta) \( q \) = frac(1, D \( q \)) sum_(pi in frak(S)_4) "sgn" \( pi \)
   M_(j \, eta + rho - pi rho) \( q \) . $ <eq:row>]

This follows from $cal(A) \( y \) = y^(- rho) sum_pi "sgn" \( pi \) y^(pi rho)$.
  Every accepted index in (19) has nonnegative entries and total degree $\| eta \| lt.eq 27$;
  in particular every coordinate is at most $27$. There are $1908$ decreasing four-coordinate tails in this range.
  Equations (13) and (16) show that the final integer tested is precisely

#[#set math.equation(numbering: n => "(20)")
 $ sum_(j = 0)^6 \[ q^(B - j b) \] R_(j \, eta) \( q \) = 720 #scale(x: 120%, y: 120%)[\(]
   Q \( 6 b - B - \| eta \| \, B \, eta \) - F \( 6 b - B - \| eta \| \, B \, eta \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:finalinteger>]

The notation on the right specifies partitions rather than gap vectors.

=== 6.4 The Laurent window <the-laurent-window>

At total tail degree $t$, the coefficients and individual Euler summands of $L_j$ have $q$-support in
  $\[ - 6 t \, 5 t \]$. The elementary factor adds at most $21$.
  A cross term consuming $s$ tail units shifts down by at most $s$, while its raw input has degree $t - s$;
  the factor $1 - q$ adds at most one. Thus all target numerator summands lie in

$ \[ - 6 t \, 5 t + 22 \] . $

The source has raw support in $\[ - t \, 21 \]$ and final support in $\[ - t \, 22 \]$, using $deg E_I =
  15$ and $0 lt.eq j lt.eq 6$. Alternation does not change total tail degree or $q$-support.
  At $t lt.eq 27$ all these supports are therefore contained in

$ \[ - 162 \, 157 \] subset \[ - 168 \, 161 \] \, $

the interval stored by the program. Its clipping operation discards only zero terms.
  In particular all terms of the boundary cancellation at $b = 26 \, k = 27$ are retained separately.

Since $D \( 0 \) = 1$, its inverse is a power series with no negative exponents.
  Starting from exponent $- 168$, six forward passes $a_n arrow.l a_n + a_(n - h)$, for $h = 1 \, dots.h \, 6$,
  divide by $D$ exactly. The numerator is zero above $161$. Expansion through $447$ suffices because

$ B - j b lt.eq B lt.eq 3 b lt.eq 447 . $

Entries below $- 168$ are zero; every accessed nonnegative array index is at most $168 + 447 = 615$,
  within the $616$ allocated entries. Neither division nor the shift $q^(j b)$ can bring a discarded high exponent
  down to a requested one. The program converts to arbitrary-precision integers before the denominator passes and
  uses them for all final sums and divisibility tests.

Finally, #raw("run_thin") visits each of the $1908$ tails once, constructs its seven rows,
  and loops over the displayed ranges of $b$ and $B$. For a fixed $b \, eta$, the number of permitted second parts is

$ 3 b - ⌈frac(\| eta \|, 2)⌉ - eta_1 + 1 . $

This is positive throughout the band. Summing it over the tails and $26 lt.eq b lt.eq
  149$ gives $57065668$ distinct partitions; there is no dependence on which partitions the first program flagged.

#thm([Finite verification 6.1.])[
  #strong[Finite verification 14].  #emph[The complete program in Appendix 9 checks $57065668$ coefficients in
    this band. Of these, $177134$ are zero and none are negative; every integer in (20) is divisible by $720$.
    The grouped counts appear in Table 2.]
] <ver:band>

== 7 Finite arithmetic, reproduction, and conclusion <sec:verification>

=== 7.1 Indexing and arithmetic in the certificate program <indexing-and-arithmetic-in-the-certificate-program>

Appendix 8 lists the complete program used for Verification 13; it has no external data input.
  Its partition order reads parts from last to first. If $p_j \( u \)$ counts partitions of $u$ into at most $j$
  parts, the prefix table counts those whose last padded part is $< k$, by

$ N_j \( u \, k \) = N_j \( u \, k - 1 \) + p_(j - 1) \( u - j \( k - 1 \) \) . $

The second summand subtracts the last part from all $j$ positions.
  Negative arguments count as zero and $p_0 \( 0 \) = 1$. Subtracting two prefix counts ranks the next part after
  the already fixed smaller neighbor. A shorter partition padded by zeros has the same rank.
  For the tail-restricted table, first group by its exact last three parts,
  subtract their largest part from the preceding three, and use the three-part rank.
  The grid similarly groups by $w \( m \)$ and ranks the partition corresponding to its first five gaps.

The allocated prefix array has size parameter $1250$. Its terminal weight need not supply a complete unrestricted
  count; all counts used for multiplicities and grid indices have weight at most $894$,
  strictly below that terminal boundary. The prefix entries are bounded by $binom(1254, 5) < 2^63$.
  The actual largest complete levels used in six, four, and three variables have respectively $1229120$, $261072$,
  and $67051$ partitions. The largest tail-restricted level has $1263138$ entries, and the grid has $6611697$.
  These ranks, offsets, and predecessor indices fit signed 32-bit integers.
  Independently of these evaluated counts, coarse bounds for the three complete levels, the grid, and any tail level are

$ max {binom(155, 5) \, binom(333, 3) \, binom(896, 2) \, binom(154, 5) \, binom(21, 3) binom(272, 2)} < 2^31 . $

These count unrestricted weak compositions. For the grid, $w \( m \) lt.eq 149$ implies $sum_i m_i lt.eq 149$;
  for a tail level there are at most $binom(21, 3)$ ordered tails of size at most $18$,
  and each remaining three-part prefix has weight at most $270$.

Multiplicity arithmetic is signed 128-bit. The target recurrences check every accumulation for overflow,
  and test integrality and nonnegativity before division. For the source, only $b lt.eq 25$ is needed.
  Each intermediate multiplicity is at most $151^10$: it is bounded by its multiplicity in
  $\( "Sym"^b V \)^(⊗ j)$, $j lt.eq 6$, and the successive interlacing partitions have at most
  $151^(0 + 1 + 2 + 3 + 4)$ choices. In one source Newton step, there are fewer than $6 dot.op 151^4 +
  6$ strip terms, by fixing one coordinate with the size constraint.
  Thus every signed accumulation is bounded absolutely by

$ 151^10 \( 6 dot.op 151^4 + 6 \) < 2^127 . $

For $U$, every width in every actual or high-residue call is at most $920$.
  A chain has at most $1 + 2 + 3 + 4 = 10$ width factors, so

$ B_I lt.eq 920^10 < Z = 2^100 . $

The minimum initialized at $Z$ therefore never clips an upper bound,
  and summing class weights costs a factor at most $720$.

For the power bound, $S$ has $dim "Sym"^6 bb(C)^6 = binom(11, 5) = 462$ polynomial generators.
  Consequently $binom(d_0 + 461, 461) gt.eq Q \( x \)$, so the binomial search for $z$, before its cap at $18$,
  stops by $461$. With $C lt.eq Z$ and $d_0 lt.eq 149$, its first crossing is at most $150 Z$;
  predivision multiplication costs at most another factor $610$, still below $2^127$.
  After the cap, the other binomials are at most $binom(167, 18)$.
  Products in the final lower bound are screened against $Z$ before multiplication.
  Capping can only weaken a lower certificate. These observations cover the unchecked arithmetic as well as the
  program’s explicit assertions.

OpenMP distributes distinct coefficient destinations within one degree.
  All previous degrees are read-only, and each work-sharing loop has its barrier before the next degree.
  The mathematical result is therefore independent of the thread count.

=== 7.2 Integer bounds for the band program <integer-bounds-for-the-band-program>

It remains to bound the signed 128-bit arithmetic before the arbitrary-precision division described in Section 6.
  For a Laurent series truncated to total tail degree at most $27$,
  use the sum of absolute coefficients as its norm. The norm of $L_j$ is bounded by

$ N = sum_(n = 0)^27 \[ z^n \] P \( z \) \, wide P \( z \) = product_(h = 1)^6 \( 1 - z^h \)^(- M_h) \, wide
  M_h = \( 7 - h \) binom(h + 3, 3) . $

Here $\( M_1 \, dots.h \, M_6 \) = \( 24 \, 50 \, 80 \, 105 \, 112 \, 84 \)$.
  There is a convenient purely elementary estimate

#[#set math.equation(numbering: n => "(21)")
 $ N lt.eq 4^27 P \( 1 \/ 4 \) < 2^79 . $ <eq:normbound>]

The first inequality follows from nonnegative coefficients. For the second, put $r_h = 4^h \/ 2$.
  Bernoulli’s inequality gives $\( 1 - 4^(- h) \)^(r_h) > 1 \/ 2$.
  Thus the $h$-th factor of $P \( 1 \/ 4 \)$ is at most $2^(ceil.l M_h \/ r_h ceil.r)$,
  with strict total inequality. The six ceilings are $12 \, 7 \, 3 \, 1 \, 1 \, 1$, whose sum is $25$;
  combine this with $4^27 = 2^54$.

Each four-coordinate source product has at most $24$ geometric factors, each consuming at least one tail unit,
  so its norm is at most

$ S_0 = binom(51, 24) < 2^51 . $

Using $parallel D parallel_1 lt.eq 64$, the quotient $E_I$ has norm at most

$ Q_0 = 64 binom(21, 6) = 3472896 < 2^22 . $

Indeed dominate all reciprocal cycle factors by $\( 1 - q \)^(- 6)$ and sum through degree $15$.
  The partial quotient calculations through degree $21$ have bound $64 binom(27, 6) = 18944640$,
  and the one-coordinate arrays $A_J$ have coefficients at most $binom(32, 5) = 201376$.
  Their additions fit signed 32-bit integers. Class-size divisions are exact:
  for each partial cycle multiset of size $r lt.eq 6$, its centralizer order divides $r !$, hence divides $720$.

The undivided Euler step costs at most $27 N$. The absolute weight of all target elementary masks is $720 dot.op
  64$, and the class-subset weight is

$ sum_(I tack.r 6) n_I 2^(v \( I \)) = sum_(sigma in frak(S)_6) 2^(\# upright("cycles") \( sigma \)) =
  2 dot.op 3 dot.op 4 dot.op 5 dot.op 6 dot.op 7 = 5040 . $

The last identity follows inductively by inserting the new largest element into an existing cycle or making it a
  new cycle. Cross multiplication including $1 - q$ has norm at most $512$; alternation costs at most $24$.
  A bound for every predivision coefficient, partial sum, and product is therefore

#[#set math.equation(numbering: n => "(22)")
 $ 512 dot.op 24 #scale(x: 120%, y: 120%)[\(] 27 dot.op 720 dot.op 64 N +
   5040 Q_0 S_0 #scale(x: 120%, y: 120%)[\)] < 2^115 < 2^127 . $ <eq:allbounds>]

The source convolutions have nonnegative factors before their final signs,
  so this also bounds their intermediate products. Potentially large products in the code already have a 128-bit
  operand. The row divisions and final sums then use arbitrary precision.
  Each output counter covers at most six degrees, $1908$ tails, and $448$ second parts per degree and tail.
  Thus even the coarse bound $1908 dot.op 6 dot.op 448 < 2^31$ keeps these counters within signed 32-bit range.

=== 7.3 Recorded computations and reproduction <recorded-computations-and-reproduction>

The reference output streams contain $20$ base rows, $21$ flag rows, and $21$ band rows.
  Tables 1 and 2 present all $62$ numeric rows, including every tested degree.
  The reproduction script checks these streams against fixed hashes and compares their numeric contents with both
  manuscript tables.

A full reproduction compiled the two printed sources with GNU C++ 13.3.0 and executed both programs over their
  entire stated ranges, with assertions enabled. The first used two OpenMP threads and the second was serial.
  Both exited with status zero, and all four output streams matched the reference streams byte for byte.
  This execution reproduced all $62$ numeric rows in the tables.

The programs retain the complete ranges $6 lt.eq b lt.eq 149$.
  For the main proof using Corollary 2, only the base comparisons $6 lt.eq b lt.eq
  25$ and the first row of Table 2, for $26 lt.eq b lt.eq 29$, are required.
  That row contains $29814$ flags and $467068$ band coefficients; the band differences are nonnegative,
  with $2114$ equalities. The later rows give the additional finite checks for the independent route through
  Proposition 8. Exact target tables at higher degrees are computed from the recurrences,
  not assumed from Foulkes’ conjecture, so their use in lower certificates introduces no circularity.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$b$ range
], table.cell(rowspan: 1, colspan: 1)[flagged pairs
], table.cell(rowspan: 1, colspan: 1)[largest $t_2$
], table.cell(rowspan: 1, colspan: 1)[band coefficients
], table.cell(rowspan: 1, colspan: 1)[zero differences
]),
  table.cell(rowspan: 1, colspan: 1)[26–29
], table.cell(rowspan: 1, colspan: 1)[29814
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[467068
], table.cell(rowspan: 1, colspan: 1)[2114
],
  table.cell(rowspan: 1, colspan: 1)[30–35
], table.cell(rowspan: 1, colspan: 1)[46805
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[872322
], table.cell(rowspan: 1, colspan: 1)[3621
],
  table.cell(rowspan: 1, colspan: 1)[36–41
], table.cell(rowspan: 1, colspan: 1)[50091
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[1078386
], table.cell(rowspan: 1, colspan: 1)[4161
],
  table.cell(rowspan: 1, colspan: 1)[42–47
], table.cell(rowspan: 1, colspan: 1)[54443
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[1284450
], table.cell(rowspan: 1, colspan: 1)[4701
],
  table.cell(rowspan: 1, colspan: 1)[48–53
], table.cell(rowspan: 1, colspan: 1)[63027
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[1490514
], table.cell(rowspan: 1, colspan: 1)[5241
],
  table.cell(rowspan: 1, colspan: 1)[54–59
], table.cell(rowspan: 1, colspan: 1)[74729
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[1696578
], table.cell(rowspan: 1, colspan: 1)[5781
],
  table.cell(rowspan: 1, colspan: 1)[60–65
], table.cell(rowspan: 1, colspan: 1)[90684
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[1902642
], table.cell(rowspan: 1, colspan: 1)[6321
],
  table.cell(rowspan: 1, colspan: 1)[66–71
], table.cell(rowspan: 1, colspan: 1)[109505
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[2108706
], table.cell(rowspan: 1, colspan: 1)[6861
],
  table.cell(rowspan: 1, colspan: 1)[72–77
], table.cell(rowspan: 1, colspan: 1)[130920
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[2314770
], table.cell(rowspan: 1, colspan: 1)[7401
],
  table.cell(rowspan: 1, colspan: 1)[78–83
], table.cell(rowspan: 1, colspan: 1)[155274
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[2520834
], table.cell(rowspan: 1, colspan: 1)[7941
],
  table.cell(rowspan: 1, colspan: 1)[84–89
], table.cell(rowspan: 1, colspan: 1)[182871
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[2726898
], table.cell(rowspan: 1, colspan: 1)[8481
],
  table.cell(rowspan: 1, colspan: 1)[90–95
], table.cell(rowspan: 1, colspan: 1)[214444
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[2932962
], table.cell(rowspan: 1, colspan: 1)[9021
],
  table.cell(rowspan: 1, colspan: 1)[96–101
], table.cell(rowspan: 1, colspan: 1)[248073
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[3139026
], table.cell(rowspan: 1, colspan: 1)[9561
],
  table.cell(rowspan: 1, colspan: 1)[102–107
], table.cell(rowspan: 1, colspan: 1)[285382
], table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[3345090
], table.cell(rowspan: 1, colspan: 1)[10101
],
  table.cell(rowspan: 1, colspan: 1)[108–113
], table.cell(rowspan: 1, colspan: 1)[324614
], table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[3551154
], table.cell(rowspan: 1, colspan: 1)[10641
],
  table.cell(rowspan: 1, colspan: 1)[114–119
], table.cell(rowspan: 1, colspan: 1)[366623
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[3757218
], table.cell(rowspan: 1, colspan: 1)[11181
],
  table.cell(rowspan: 1, colspan: 1)[120–125
], table.cell(rowspan: 1, colspan: 1)[410723
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[3963282
], table.cell(rowspan: 1, colspan: 1)[11721
],
  table.cell(rowspan: 1, colspan: 1)[126–131
], table.cell(rowspan: 1, colspan: 1)[457715
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[4169346
], table.cell(rowspan: 1, colspan: 1)[12261
],
  table.cell(rowspan: 1, colspan: 1)[132–137
], table.cell(rowspan: 1, colspan: 1)[506088
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[4375410
], table.cell(rowspan: 1, colspan: 1)[12801
],
  table.cell(rowspan: 1, colspan: 1)[138–143
], table.cell(rowspan: 1, colspan: 1)[557588
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[4581474
], table.cell(rowspan: 1, colspan: 1)[13341
],
  table.cell(rowspan: 1, colspan: 1)[144–149
], table.cell(rowspan: 1, colspan: 1)[610285
], table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[4787538
], table.cell(rowspan: 1, colspan: 1)[13881
],
  table.cell(rowspan: 1, colspan: 1)[total
], table.cell(rowspan: 1, colspan: 1)[4969698
], table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[57065668
], table.cell(rowspan: 1, colspan: 1)[177134
],
)
]],
  caption: [Table 2: Full retained verification range. The first row is the residual range required with quadratic stabilization; subsequent rows support the independent chart route. All flags lie in the checked band, and no negative difference is found. The program’s first row is labeled $24$, the multiple of six below the first tested degree; the explicit degree ranges here avoid that convention. ],
)

The supporting package contains the complete program sources, reference output streams,
  their hashes and numeric tables, and a reproduction script.
  A new full run creates its own compiler and execution metadata. The commands, run from the paper directory, are

#raw(block: true, lang: "", "python3 -B verification/verify_computations.py --check\npython3 -B verification/verify_computations.py --run --threads 2")

The first checks source and reference-stream identities, all $62$ numeric rows,
  agreement with the manuscript tables, and the numerical bounds above;
  it does not execute the mathematical programs. The second compiles both unchanged sources with
  #raw("-std=c++17 -O3 -UNDEBUG"), enables OpenMP only for the first, executes them,
  and requires both complete output streams to match the reference streams byte for byte.
  It keeps each run in a new external directory, with the compiler version, build and execution commands,
  exit statuses, timings, hashes, and captured streams. The option #raw("--serial") may replace
  #raw("--threads 2") to compile and run the first program without OpenMP.
  The two C++ files are also printed in full below, so every finite step is specified in this paper.
  The coefficient formulas, indexing arguments, and arithmetic bounds establish what they check;
  successful execution supplies the finite nonnegativity assertions.

=== 7.4 Completion of the proof <completion-of-the-proof>

#proof[
  Corollary 2 settles $b gt.eq 30$. Verification 13 settles $6 lt.eq b lt.eq 25$.
    Proceed by increasing $b$ from $26$ through $29$. If $d_6 gt.eq 6$,
    Lemma 3 reduces the comparison to degree $b - 6 gt.eq 20$.
    Otherwise $d = r + 6 m$ lies in the exhaustive classification of Section 5.
    Every pair is either cleared there by a proved certificate or the chart, or flagged.
    The flags have $t_2 lt.eq 27$ and are covered by Verification 14.
    Hence $Q \( lambda \) gt.eq F \( lambda \)$ for every source partition and every $b gt.eq 6$.
    The source has no constituents of length greater than six;
    specialization at extra variables zero transfers the comparisons to every finite dimension.
    Complete reducibility gives the required equivariant injection. ◻
]

#prodef([Remark 7.1.])[
  (The independent full-range route).  The same finite argument, with no change of predicate or arithmetic,
    continues from $b = 30$ through $b = 149$, as recorded in the full tables.
    Combining it with Proposition 8 for $b gt.eq 150$ proves the theorem without using the quadratic companion.
    The chart and certificate methods are therefore retained as a complete independent proof,
    while Corollary 2 gives the shorter large-degree route.
]

== 8 The bounded certificate program <app:certificate>

The following is the complete first program. It uses GNU C++17 signed 128-bit integers and optional OpenMP;
  assertions must remain enabled. The source file is #raw("verification/programs/appendix-a.cpp").
  See Sections 3–5 for the construction and Section 7 for arithmetic and reproduction.

#raw(block: true, lang: "", "")

== 9 The tail-band program <app:band>

The following is the complete second program. It uses GNU C++17 and Boost.Multiprecision for the final coefficient
  sums. The source file is #raw("verification/programs/appendix-b.cpp").
  See Section 6 for the construction and Section 7 for arithmetic and reproduction.

#raw(block: true, lang: "", "")

#bibliography("refs.bib", style: "ieee", title: [References])
