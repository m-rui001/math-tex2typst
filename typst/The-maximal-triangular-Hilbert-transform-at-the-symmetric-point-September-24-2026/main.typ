#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The maximal triangular Hilbert transform \
at the symmetric point]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The triangular Hilbert transform couples translations in two different coordinate directions.
  For complex functions $F \, G$ on $bb(R)^2$ and $0 < epsilon < R < oo$, write

$ B_(epsilon \, R) \( F \, G \) \( x \, y \) = integral_(epsilon < \| t \| < R) F \( x + t \, y \)
  G \( x \, y + t \) thin frac(#h(-0.16667em) upright(d) t, t) \, wide B_(*) \( F \, G \) =
  sup_(0 < epsilon < R < oo) \| B_(epsilon \, R) \( F \, G \) \| . $

For $L^3$ inputs, the finite integrals are absolutely convergent outside one common null set,
  and the supremum is measurable; the details are given in Lemma 19.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C$ such that, for every pair of complex functions $F \, G in L^3 \( bb(R)^2 \)$,
$ parallel B_(*) \( F \, G \) parallel_(L^(3 \/ 2) \( bb(R)^2 \)) lt.eq
  C parallel F parallel_(L^3 \( bb(R)^2 \)) parallel G parallel_(L^3 \( bb(R)^2 \)) . $

 The supremum is over both finite hard truncation endpoints.]
] <thm:main>

The estimate controls a truncation chosen separately at each spatial point.
  This is stronger than a uniform bound for the norm of each individual truncation:
  the same $L^(3 \/ 2)$ majorant must control every choice of the two endpoints. It also gives the joint principal value

$ B \( F \, G \) = lim_(epsilon arrow.b 0\
R arrow.t oo) B_(epsilon \, R) \( F \, G \) $

almost everywhere and in $L^(3 \/ 2)$, with the same norm bound (Theorem 20).

Pairing the bilinear output with a third $L^3$ function leads to the scalar triangular form.
  In its symmetric coordinates this is

$ Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) = integral.triple_(epsilon < \| a + b + c \| < R) G_0 \( a \, b \)
  G_1 \( b \, c \) G_2 \( c \, a \) thin frac(#h(-0.16667em) upright(d) a thin #h(-0.16667em) upright(d) b thin
  #h(-0.16667em) upright(d) c, a + b + c) . $

The three factors have equal exponent $3$, which is the symmetric point of the scalar Hölder relation $1 \/ p_0 +
  1 \/ p_1 + 1 \/ p_2 = 1$. We obtain an endpoint-uniform bound by $C product_v parallel G_v
  parallel_3$ and a joint scalar principal value for every complex $L^3$ triple.
  Proposition 22 gives the explicit determinant-one changes of variables and proves that the flat and simplex
  scalar estimates have the same optimal constant. In particular,
  the result resolves positively the symmetric triangular Hilbert transform problem stated by Thiele
  in #cite(label("GrafakosEtAl2017")) Section 9, Problem 13.

=== 1.1 Previous work <previous-work>

The flat operator appears in Demeter and Thiele’s discussion of bilinear averages for two commuting
  transformations #cite(label("DemeterThiele2010")) Section 6.
  The three inputs of the scalar form depend on the three pairs of variables,
  making it a basic example of an entangled singular integral.
  Kovač, Thiele and Zorin-Kranich proved estimates for a Walsh model with one structurally restricted
  input #cite(label("KovacThieleZorinKranich2015")) Theorem 1.7.

Tao proved sublogarithmic cancellation for one-dimensional multilinear Hilbert
  transforms #cite(label("Tao2016Cancellation")) Theorem 1.2.
  Zorin-Kranich extended this cancellation to simplex Hilbert transforms #cite(label("ZorinKranich2017"))
  Theorem 1.3. Square-function estimates of Durcik, Kovač, Škreb and Thiele gave square-root cancellation for the
  triangular form across finitely many smooth scales #cite(label("DurcikKovacSkrebThiele2019")) Corollary 5.
  Durcik, Kovač and Thiele proved power-type cancellation with hard
  truncations #cite(label("DurcikKovacThiele2019")) Theorem 1;
  at the symmetric tuple the bound grows like $sqrt(log \( R \/ epsilon \))$,
  by permutation and interpolation of their $\( 4 \, 4 \, 2 \)$ estimates.
  These finite-scale bounds retain a dependence on the scale range.

Bounds for averages over direction parameters were obtained by Durcik and Roos #cite(label("DurcikRoos2021"))
  Theorem 1 and, for rough angular weights, by Lin and Slavíková #cite(label("LinSlavikova2026")) Theorem 1.1.
  For curved translations, Christ, Durcik and Roos proved bounds along
  $\( t \, t^2 \)$ #cite(label("ChristDurcikRoos2021")) Theorem 1.
  Hsu and Lin treat more general curves under geometric hypotheses excluding the flat curve
  $\( t \, t \)$ #cite(label("HsuLin2026")) Theorem 1.37. The curvature in these results provides an additional
  source of cancellation that is unavailable for the flat curve.

Our argument uses a nonnegative matrix energy and Gaussian heat flow.
  Energy telescoping for entangled forms appears in Kovač’s twisted-paraproduct
  argument #cite(label("Kovac2012Twisted")) Lemma 2 and his Bellman-function framework #cite(label("Kovac2011"))
  Section 2. Continuous Gaussian telescoping appears in Durcik #cite(label("Durcik2015")) Lemma 3 and Section 3.
  These methods concern bipartite forms; Kovač discusses the obstacle posed by the triangular cycle
  in #cite(label("Kovac2011")) Section 6.2. The cyclic trace representation itself also occurs
  in #cite(label("KovacThieleZorinKranich2015")) Equation (1.5).
  We prove a dimension-independent mixed trace inequality and compare the energy derivatives at neighboring
  vertices. The key additional estimate controls the total change in energy when individual matrix entries are
  switched on and off at independently chosen scales. This permits the pointwise maximum without a factor
  depending on the number of scales or the matrix dimensions.

=== 1.2 Proof overview <proof-overview>

The change of variables $x = - a$, $y = - b$, $t = a + b + c$ writes the bilinear output in terms of

$ G_1 \( b \, c \) = F \( b + c \, - b \) \, wide G_2 \( c \, a \) = G \( - a \, c + a \) . $

Both pair maps preserve $L^3$ norms. We first sample these inputs, together with a dual input $G_0 \( a \, b \)$,
  on a finite mesh. Multiplying entries by Gaussian weights gives maps $W_v : H_(v + 1) arrow.r
  H_v$ between finite-dimensional complex Hilbert spaces, indexed by $v in bb(Z) \/ 3 bb(Z)$.
  The three vertex spaces correspond to the sampled $a$-, $b$- and $c$-coordinates.
  Thus the two indices of the dual array record the output position $\( x \, y \) = \( - a \, - b \)$.
  At a vertex, combine its two incident maps into $R_v = \[ thin W_v quad W_(v - 1)^(*) thin \]$ and use the
  energy $"tr" \( \( R_v^(*) R_v \)^(3 \/ 2) \)$.

Sections 2 and 3 prove the matrix inequalities. Section 4 then integrates the sum of the three energies over
  Gaussian centers satisfying $p_0 + p_1 + p_2 = 0$. For fixed arrays,
  its decrease as the variance grows controls the quadratic costs needed to estimate a cyclic trace with three odd
  Gaussian windows.

To select different truncations at different output points,
  the dual array entry at $\( i \, j \)$ must be present only between its own two scales.
  The energy is therefore decreasing between finitely many switching scales and may jump at those scales.
  Section 5 bounds the sum of the absolute jumps by the discrete $L^3$ masses of the three arrays.
  The underlying matrix fact is that the derivative with respect to an entry is controlled by the product of its
  row and column norms. After Gaussian integration, one-dimensional maximal functions bound these products
  uniformly in the switching scales.

Section 6 uses this bound to linearize any finite maximum of smooth truncations.
  Mesh limits and rational exhaustion give the full smooth maximum.
  A pointwise comparison of its kernel with the hard Hilbert kernel completes the estimate for compactly supported
  smooth inputs. Finally, Section 7 uses density and a vanishing tail-oscillation argument to prove Theorem 1,
  the joint principal values, and the scalar equivalence.

== 2 A matrix energy and its Hessian <sec:matrix>

We begin with the finite-dimensional inequalities that control the derivatives of our energy.
  Their constants are independent of the matrix dimensions.
  Throughout this section, matrices act on finite-dimensional complex Hilbert spaces,
  and inequalities between Hermitian matrices mean inequalities of quadratic forms.

For a positive semidefinite matrix $P$, set

$ Phi \( P \) = "tr" \( P^(3 \/ 2) \) \, wide "supp" P = \( ker P \)^perp . $

A matrix is #emph[supported on $P$] if it vanishes on $ker P$ on both sides.
  We use the Hilbert–Schmidt inner product $chevron.l K \, L chevron.r_(upright("HS")) = "tr" \( K^(*) L \)$.
  For a Hermitian matrix $A$, write $sans(L)_A \( X \) = A X$ and $sans(R)_A \( X \) = X A$.
  On matrices acting on $"supp" P$, the operator $sans(L)_(sqrt(P)) + sans(R)_(sqrt(P))$ is positive definite.
  For Hermitian $K \, L$ supported on $P$, define

$ cal(B)_P \( K \, L \) = 3 / 2 "Re" chevron.l K \, \( sans(L)_(sqrt(P)) + sans(R)_(sqrt(P)) \)^(- 1) L
  chevron.r_(upright("HS")) \, wide b_P \( K \) = cal(B)_P \( K \, K \) . $

If $P = 0$, the only supported directions are zero, and these expressions are defined to be zero.

The square-root derivative used here is a case of the classical divided-difference calculus for Hermitian matrix
  functions #cite(label("Daletskii1957")) Section 1, Equation (1).
  We give a direct inverse-function proof to keep the support conventions explicit.

#thm([Lemma 2.1.])[
  (Energy derivatives).  #emph[On the cone of matrices positive definite on a fixed support, $Phi$ is smooth.
    For Hermitian directions $K \, L$ on that support,
$ d Phi_P \( K \) = 3 / 2 "tr" \( sqrt(P) K \) \, wide d^2 Phi_P \( K \, L \) = cal(B)_P \( K \, L \) . $

 If $p_i > 0$ are the eigenvalues on the support, then in an orthonormal eigenbasis
#[#set math.equation(numbering: n => "(2.1)")
 $ b_P \( K \) = 3 / 2 sum_(i \, j) frac(\| K_(i j) \|^2, sqrt(p_i) + sqrt(p_j)) . $ <eq:hessian-metric>]

 In particular, $cal(B)_P$ is a positive definite symmetric bilinear form on the real space of supported Hermitian
   directions, and
$ \| cal(B)_P \( K \, L \) \| lt.eq b_P \( K \)^(1 \/ 2) b_P \( L \)^(1 \/ 2) . $

]
] <lem:hessian>

#proof[
  Restrict to the support and put $A = sqrt(P)$. The derivative of the squaring map at $A$ is $X mapsto A X +
    X A$. In an eigenbasis of $A$, this map multiplies its $\( i \, j \)$ entry by $sqrt(p_i) + sqrt(p_j) > 0$.
    The inverse function theorem therefore gives a smooth positive square root.
    Its derivative $X_K$ in direction $K$ satisfies
  $ A X_K + X_K A = K . $
  Taking a trace after multiplication by $A$ yields $"tr" \( P X_K \) = 1 / 2 "tr" \( A K \)$.
    Differentiation of $Phi \( P \) = "tr" \( P sqrt(P) \)$ now gives
  $ d Phi_P \( K \) = "tr" \( K A \) + "tr" \( P X_K \) = 3 / 2 "tr" \( A K \) . $
  Differentiating this identity in direction $L$ proves the Hessian formula.
    The entrywise formula follows by diagonalizing $A$. It also proves symmetry, positivity,
    and Cauchy–Schwarz on the real space of Hermitian directions. ◻
]

The energy and its Hessian are unchanged by simultaneous unitary conjugation of their arguments.
  They are also unchanged if all arguments are extended by zero to a larger Hilbert space:
  the positive eigenvalues and the supported entries in (2.1) stay the same.
  We will use these observations to compare Grams acting on different subspaces.

#thm([Lemma 2.2.])[
  (Order comparison).  #emph[Let $P \, Q$ be positive semidefinite matrices on the same Hilbert space,
    let $a gt.eq 1$, and suppose $P lt.eq a Q$. Every Hermitian $K$ supported on $P$ is supported on $Q$, and
#[#set math.equation(numbering: n => "(2.2)")
 $ b_P \( K \) gt.eq a^(- 1 \/ 2) b_Q \( K \) . $ <eq:matrix-order>]

]
] <lem:order>

#proof[
  If $x in ker Q$, then $0 lt.eq chevron.l P x \, x chevron.r lt.eq a chevron.l Q x \, x chevron.r = 0$, so $P x =
    0$. Thus $ker Q subset.eq ker P$, proving the support assertion.
  We recall the two operator-order facts needed for the comparison.
    Inversion reverses order on positive definite matrices: for $0 < X lt.eq Y$, conjugate by $X^(- 1 \/ 2)$,
    invert the resulting matrix at least $I$, and conjugate back. Moreover,
  $ sqrt(X) = 1 / pi integral_0^oo X \( X + t I \)^(- 1) thin frac(#h(-0.16667em) upright(d) t, sqrt(t)) . $
  This norm-convergent formula follows from the scalar integral by spectral calculus.
    Since $X \( X + t I \)^(- 1) = I - t \( X + t I \)^(- 1)$,
    inversion order proves that the positive square root preserves order.
    This is the classical Loewner–Heinz square-root monotonicity; see, for example,
    Kwong #cite(label("Kwong1975")) Theorem 1 and Section 2. The supported Hessian comparison below is derived
    from these order facts here.
  For $eta > 0$, the assumptions give
  $ P + eta I lt.eq a \( Q + eta I \) \, wide sqrt(P + eta I) lt.eq sqrt(a) thin sqrt(Q + eta I) . $
  If $A lt.eq B$, then $sans(L)_A + sans(R)_A lt.eq sans(L)_B +
    sans(R)_B$ as selfadjoint operators on Hilbert–Schmidt space.
    Indeed, left and right multiplication by the positive matrix $B -
    A$ have the nonnegative quadratic forms $"tr" \( X^(*) \( B - A \) X \)$ and $"tr" \( X^(*) X \( B - A \) \)$.
    Inverting the resulting positive definite operators gives
  $ b_(P + eta I) \( K \) gt.eq a^(- 1 \/ 2) b_(Q + eta I) \( K \) . $
  Finally let $eta arrow.b 0$. Formula (2.1), applied in a full eigenbasis,
    shows that both limits are the asserted supported costs: every entry of $K$ meeting the kernel of the
    respective matrix is zero. ◻
]

We will apply the Hessian to Gram matrices with an insertion between the two factors.
  The following bound controls such derivatives by the energy itself.

#thm([Lemma 2.3.])[
  (Inserted Gram bound).  #emph[Let $R : E arrow.r F$ be a linear map between finite-dimensional complex Hilbert
    spaces, and let $L : F arrow.r F$ be Hermitian. The matrix $R^(*) L R$ is supported on $R^(*) R$, and
#[#set math.equation(numbering: n => "(2.3)")
 $ b_(R^(*) R) \( R^(*) L R \) lt.eq 3 / 4 lr(bar.v.double L bar.v.double)_(upright("op"))^2 Phi \( R^(*) R \) .
   $ <eq:insertion-bound>]

]
] <lem:insertion>

#proof[
  The insertion annihilates $ker R = ker \( R^(*) R \)$ and is Hermitian, so it is supported on the Gram.
    The assertion is immediate if $R = 0$. Otherwise take a singular-value decomposition,
    with positive singular values $rho_i$, and let $C$ be the compression of $L$ to the corresponding left
    singular vectors. Then $lr(bar.v.double C bar.v.double)_(upright("op")) lt.eq
    lr(bar.v.double L bar.v.double)_(upright("op"))$ and
  $ b_(R^(*) R) \( R^(*) L R \) = 3 / 2 sum_(i \, j) frac(rho_i^2 rho_j^2, rho_i + rho_j) \| C_(i j) \|^2 . $
  For $x \, y > 0$, the arithmetic–geometric mean inequality gives
  $ frac(x^2 y^2, x + y) lt.eq frac(\( x y \)^(3 \/ 2), 2) lt.eq frac(x^3 + y^3, 4) . $
  Each row and each column of $C$ has squared Euclidean norm at most
    $lr(bar.v.double L bar.v.double)_(upright("op"))^2$. Consequently
  $ b_(R^(*) R) \( R^(*) L R \) lt.eq 3 / 8 sum_(i \, j) \( rho_i^3 + rho_j^3 \) \| C_(i j) \|^2 lt.eq 3 /
    4 lr(bar.v.double L bar.v.double)_(upright("op"))^2 sum_i rho_i^3 \, $
  which is (2.3). ◻
]

== 3 A mixed trace inequality <sec:trace>

The triangular form is naturally represented by a cyclic product of operators.
  Such a representation also appears in the dyadic model of Kovač,
  Thiele and Zorin-Kranich #cite(label("KovacThieleZorinKranich2015")) Equation (1.5).
  We prove a finite-dimensional estimate that controls this product by three of the quadratic costs from Section 2.

Let $H_v$, $v in bb(Z) \/ 3 bb(Z)$, be finite-dimensional complex Hilbert spaces, and let $W_v : H_(v + 1) arrow.r
  H_v$ be arbitrary linear maps. Combine the two edges incident to $v$ into the #emph[row star]

#[#set math.equation(numbering: n => "(3.1)")
 $ R_v = \[ thin W_v quad W_(v - 1)^(*) thin \] : H_(v + 1) xor H_(v - 1) arrow.r H_v . $ <eq:row-star>]

Its two Gram matrices are

#[#set math.equation(numbering: n => "(3.2)")
 $ T_v = R_v^(*) R_v \, wide S_v = R_v R_v^(*) . $ <eq:star-grams>]

Their positive eigenvalues are the squares of the nonzero singular values of $R_v$, with the same multiplicities.
  In particular, $Phi \( T_v \) = Phi \( S_v \)$. Figure 1 shows the cyclic edges and the row star at vertex $0$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.3182, 1.582), (0.3182, 2.218), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_0$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((-2.118, -1.118), (-1.482, -0.4818), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_1$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((1.482, -1.118), (2.118, -0.4818), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_2$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-1.546, -0.4197), (-0.2535, 1.52), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((-1.076, 0.55), [#text(size: 9pt)[$W_0$]], anchor: "east", padding: 0.1176cm)
  line((1.343, -0.8), (-1.343, -0.8), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0, -0.9764), [#text(size: 9pt)[$W_1$]], anchor: "north", padding: 0.1176cm)
  line((0.2535, 1.52), (1.546, -0.4197), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((1.076, 0.55), [#text(size: 9pt)[$W_2$]], anchor: "west", padding: 0.1176cm)
  content((0, -1.435), [#text(size: 9pt)[the cyclic product $W_0W_1W_2$]], anchor: "north", padding: 0.1176cm)
  content((4.682, 0.9818), (5.318, 1.618), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_1$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((4.682, -1.118), (5.318, -0.4818), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_2$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((7.182, -0.0682), (7.818, 0.5682), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$H_0$]]], frame: "circle", stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((5.421, 1.123), (7.079, 0.427), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((6.25, 0.9514), [#text(size: 9pt)[$W_0$]], anchor: "south", padding: 0.1176cm)
  line((5.421, -0.623), (7.079, 0.07301), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((6.25, -0.4514), [#text(size: 9pt)[$W_2^*$]], anchor: "north", padding: 0.1176cm)
  content((6.25, -1.435), [#text(size: 9pt)[$R_0=[thin W_0 W_2^*thin ]$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The three edge maps and the row star at vertex $0$. Taking the adjoint of $W_2$ makes both blocks of $R_0$ have target $H_0$. The two Grams $R_0^(*) R_0$ and $R_0 R_0^(*)$ have the same positive eigenvalues on different spaces. ],
) <fig:triangle>

#thm([Lemma 3.1.])[
  (Mixed trace estimate).  #emph[Let $W_v : H_(v + 1) arrow.r
    H_v$ be linear maps between finite-dimensional complex Hilbert spaces,
    with row stars $R_v$ and Gram matrices $T_v$ as in (3.1)–(3.2).
    For Hermitian maps $D_v : H_v arrow.r H_v$, put $D_(*) = max_v
    lr(bar.v.double D_v bar.v.double)_(upright("op"))$. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|"tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \)|) lt.eq 5 / 3 D_(*) sum_(v = 0)^2 b_(T_v) \( R_v^(*) D_v R_v \) .
   $ <eq:mixed-trace>]

 The constant is independent of the dimensions of the spaces.]
] <lem:mixed-trace>

#proof[
  We first put the three quadratic costs in a common metric.
    We then estimate a cubic trace in an eigenbasis and recover the absolute value of the original cyclic product
    by changing the phase of one edge.
  ===== 3.1 A common quadratic form. <a-common-quadratic-form.>
  On $H = H_0 xor H_1 xor H_2$, define the Hermitian matrices
  $ M = mat(delim: "(", 0, W_0, W_2^(*); W_0^(*), 0, W_1; W_2, W_1^(*), 0) \, wide D =
    "diag" \( D_0 \, D_1 \, D_2 \) . $
  Thus $lr(bar.v.double D bar.v.double)_(upright("op")) = D_(*)$.
    Let $P_v$ be the orthogonal projection onto $H_v$ and set
  $ A_v = M P_v M \, wide K_v = M P_v D M . $
  Only the $v$-th block row of $P_v M$ can be nonzero; it consists of $R_v$ with its columns placed in the
    corresponding vertex spaces. Consequently $A_v$ and $K_v$ are, respectively, $T_v$ and $R_v^(*) D_v R_v$,
    after a permutation of blocks and extension by zero. These operations preserve the quadratic cost.
    Since $P_v$ commutes with $D$, the matrix $K_v$ is Hermitian. Moreover,
  $ ker A_v = ker \( P_v M \) subset.eq ker K_v \, wide 0 lt.eq A_v lt.eq M^2 . $
  The first identity follows from $chevron.l A_v x \, x chevron.r = lr(bar.v.double P_v M x bar.v.double)^2$.
    Thus $K_v$ is supported on $A_v$, and hence also on $M^2$.
    Lemma 3, followed by the quadratic-form inequality for three vectors, yields
  #[#set math.equation(numbering: n => "(3.4)")
   $ cal(E) & := sum_v b_(T_v) \( R_v^(*) D_v R_v \)\
 & gt.eq sum_v b_(M^2) \( K_v \) gt.eq 1 / 3 b_(M^2) (sum_v K_v) = 1 /
   3 b_(M^2) \( M D M \) . $ <eq:trace-common-metric>]
  All these quadratic forms are taken on their supports; no invertibility of $M$ is required.
  ===== 3.2 The cubic trace. <the-cubic-trace.>
  Choose an orthonormal eigenbasis $\( e_i \)$ of $M$, write the real eigenvalues as $m_i$,
    and arrange the indices so that $q_i := \| m_i \|$ is nonincreasing. Equal values may be ordered arbitrarily.
    Write $D_(i j)$ for the entries of $D$ in this basis. The spectral formula for $b_(M^2)$ gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ cal(E) gt.eq 1 / 2 Q \, wide Q := sum_(i \, j : q_i + q_j > 0) frac(q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 .
     $ <eq:trace-Q>]
  If either eigenvalue is zero, its summand is zero; pairs of zero eigenvalues are omitted. Define
  $ A_i = q_i^3 \| D_(i i) \|^2 \, wide E_i = q_i sum_(j > i) q_j^2 \| D_(i j) \|^2 \, wide A = sum_i A_i \, quad
    E = sum_i E_i . $
  Hermitian symmetry and the ordering of the $q_i$ imply
  #[#set math.equation(numbering: n => "(3.6)")
   $ Q & = A / 2 + 2 sum_(i < j\
q_i + q_j > 0) frac(q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 gt.eq A / 2 + E . $ <eq:trace-AE>]
  Indeed, for $i < j$ we have $q_j lt.eq q_i$, so $2 q_i \/ \( q_i + q_j \) gt.eq
    1$ whenever the denominator is positive.
  We now bound
  $ "tr" \( \( D M \)^3 \) = sum_(i \, j \, k) m_i m_j m_k D_(i j) D_(j k) D_(k i) $
  by grouping the triples according to how often their smallest index occurs.
    This is the index of a largest absolute eigenvalue in the triple.
  If the smallest index $i$ occurs once, its three cyclic positions give
  $ 3 m_i sum_(j \, k > i) m_j m_k D_(i j) D_(j k) D_(k i) . $
  Here $j = k$ is allowed. For the vector $x = \( m_j D_(j i) \)_(j > i)$, the inner sum is $x^(*) D_(> i) x$,
    where $D_(> i)$ is the compression of $D$ to the indices greater than $i$.
    Since $lr(bar.v.double D_(> i) bar.v.double)_(upright("op")) lt.eq D_(*)$,
    the modulus of this contribution is at most $3 D_(*) E_i$.
    This argument retains the signs of the $m_j$ and uses $D_(j i) = overline(D_(i j))$.
  If the smallest index $i$ occurs twice, the contribution is
  $ 3 m_i^2 D_(i i) sum_(k > i) m_k \| D_(i k) \|^2 . $
  Cauchy–Schwarz and $sum_k \| D_(i k) \|^2 = lr(bar.v.double D e_i bar.v.double)^2 lt.eq D_(*)^2$ give
  $ lr(|sum_(k > i) m_k \| D_(i k) \|^2|) lt.eq D_(*) (sum_(k > i) q_k^2 \| D_(i k) \|^2)^(1 \/ 2) . $
  Its contribution therefore has modulus at most $3 D_(*) sqrt(A_i E_i)$.
    This also holds when $q_i = 0$, without any division by $q_i$.
  Finally, when all three indices equal $i$, the modulus is at most $D_(*) A_i$.
    These three cases exhaust all triples, including repeated indices.
    Summing them and applying Cauchy–Schwarz once more, we obtain
  #[#set math.equation(numbering: n => "(3.7)")
   $ \| "tr" \( \( D M \)^3 \) \| & lt.eq D_(*) #scale(x: 120%, y: 120%)[\(] A + 3 E +
     3 sqrt(A E) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq D_(*) (5 / 2 A + 9 / 2 E) lt.eq 5 D_(*) (A / 2 + E) lt.eq 5 D_(*) Q . $ <eq:trace-cubic>]
  ===== 3.3 Recovering the complex cyclic product. <recovering-the-complex-cyclic-product.>
  We have bounded the cubic trace by the star costs. It remains to extract the modulus of the desired triangular
    trace. Put
  $ tau = "tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \) . $
  Because $M$ has zero diagonal blocks, a nonzero closed three-step block product must visit all three vertices.
    The three starting points in one orientation each give $tau$, by cyclicity of the trace.
    Reversing the orientation gives $overline(tau)$, since the $D_v$ are Hermitian. Hence
  $ "tr" \( \( D M \)^3 \) = 6 "Re" tau . $
  If $tau eq.not 0$, choose $z in bb(C)$ with $\| z \| = 1$ and $z tau = \| tau \|$, and replace $W_0$ by $z W_0$.
    The row stars change by
  $ R_0 & mapsto R_0 "diag" \( z I_(H_1) \, I_(H_2) \) \,\
R_1 & mapsto R_1 "diag" \( I_(H_2) \, overline(z) I_(H_0) \) \, $
  while $R_2$ is unchanged. Each displayed right multiplier is unitary and conjugates the corresponding Gram and
    inserted Gram by the same unitary. Thus $cal(E)$ is unchanged, as is $D_(*)$.
    Applying (3.5) and (3.7) to the modified matrices, with $Q$ computed for the new $M$, gives
  $ 6 \| tau \| lt.eq 5 D_(*) Q lt.eq 10 D_(*) cal(E) \, $
  which is (3.3). The case $tau = 0$ is immediate. ◻
]

== 4 Gaussian heat dissipation <sec:heat>

We now weight the three edge matrices by Gaussians. For the variance rates chosen below,
  the sum of the star energies decreases after integration over a plane of centers.
  This decrease controls the matrix derivatives that will produce the odd kernel.
  The estimate must be independent of the number of matrix entries;
  this uniformity will allow us to pass from finite matrices to functions.

Continuous Gaussian telescoping for entangled forms appears in Durcik #cite(label("Durcik2015")) Lemma 3 and
  Section 3. Here we use the Hessian of a matrix energy and compare its costs at neighboring vertices.

Fix $h > 0$, an integer $N gt.eq 0$, and nodes $u_i = i h$, $- N lt.eq i lt.eq N$.
  At vertex $v in bb(Z) \/ 3 bb(Z)$ take $H_v = bb(C)^(2 N + 1)$,
  and prescribe arbitrary complex edge values $A_v \( i \, j \)$.
  For centers $p_v in bb(R)$ and variances $sigma_v > 0$, define

$ g_sigma \( t \) = \( 2 pi sigma \)^(- 1 \/ 2) e^(- t^2 \/ \( 2 sigma \)) \, wide w_v \( i \) =
  h g_(sigma_v) \( u_i - p_v \) \,\
W_v \( i \, j \) = A_v \( i \, j \) sqrt(w_v \( i \) w_(v + 1) \( j \)) . $

Use the stars $R_v = \[ W_v med W_(v - 1)^(*) \]$ and Grams $T_v = R_v^(*) R_v$, $S_v =
  R_v R_v^(*)$ from Section 3, and set

$ e_v = Phi \( T_v \) = Phi \( S_v \) . $

Define the diagonal score and its insertions into the incident stars by

$ L_w & = "diag"_i frac(u_i - p_w, sigma_w) \, & U_v & = R_v^(*) L_v R_v \,\
U_(v \, v + 1) & = W_v L_(v + 1) W_v^(*) \, & U_(v \, v - 1) & = W_(v - 1)^(*) L_(v - 1) W_(v - 1) . $

Define their quadratic costs and the mixed term by

#[#set math.equation(numbering: n => "(4.1)")
 $ V_v = b_(T_v) \( U_v \) \, wide Y_(v \, w) = b_(S_v) \( U_(v \, w) \) quad \( w eq.not v \) \, wide Z_v =
   cal(B)_(S_v) \( U_(v \, v + 1) \, U_(v \, v - 1) \) . $ <eq:heat-costs>]

Every insertion is supported on the Gram used in its definition:
  an inserted Gram $A^(*) B A$ annihilates $ker A$ on both sides.

For $d in bb(R)$, let $Pi_d = { p_0 + p_1 + p_2 = d }$, with the measure

#[#set math.equation(numbering: n => "(4.2)")
 $ integral_(Pi_d) H thin #h(-0.16667em) upright(d) pi_d =
   integral_(bb(R)^2) H \( p_0 \, p_1 \, d - p_0 - p_1 \) thin #h(-0.16667em) upright(d) p_0 thin #h(-0.16667em)
   upright(d) p_1 . $ <eq:heat-plane-measure>]

Any other pair of free coordinates gives the same measure,
  since the change of coordinates has absolute determinant one. Put $lambda = 11 \/ 10$.

We also write

$ cal(S) \( A \) = sum_(v = 0)^2 sum_(i \, j = - N)^N h^2 \| A_v \( i \, j \) \|^3 . $

Our goal in this section is the fixed-array inequality

$ - partial_s J \( d \, s \) gt.eq c_(*) integral_(Pi_d) sum_v V_v thin #h(-0.16667em) upright(d) pi_d \, wide
  J \( d \, s \) = integral_(Pi_d) sum_v e_v thin #h(-0.16667em) upright(d) pi_d \, $

when the variances are $sigma_i = alpha_i s$ and $bold(alpha)$ is a permutation of $\( 1 \, lambda \, lambda \)$.
  The odd-window estimate in Section 6 uses wider Gaussian weights for uniformly bounded diagonal factors,
  but compares each score cost after narrowing only its own vertex.
  The fixed enlargement $lambda = 11 \/ 10$ retains strict dissipation for all three comparisons.
  Lemma 9 gives an absolute $c_(*) > 0$; Lemma 10 bounds $J$ by $C cal(S) \( A \)$ at scales $s gt.eq h^2$.
  Later, when entries change at prescribed scales, the same differential inequality will apply between successive
  changes.

We first differentiate the star energies, choosing the Gram orientation whose support stays fixed.
  We then integrate over the center plane and compare neighboring stars.
  These two steps produce the strict decrease that controls the score costs.

=== 4.1 Differentiating the star energies <differentiating-the-star-energies>

#thm([Lemma 4.1.])[
  #emph[For fixed finite edge arrays, each $e_v$ is smooth in all centers and positive variances.
    If only the parameters at vertex $v$ vary, the support of $T_v$ is fixed.
    If the parameters at either or both other vertices vary while those at $v$ are fixed,
    the support of $S_v$ is fixed.]
] <lem:star-smoothness>

#proof[
  The weighted star has the form $R_v = D_(upright("row")) R_v^0 D_(upright("col"))$,
    where $R_v^0 = \[ A_v med A_(v - 1)^(*) \]$ is fixed and both diagonal multipliers are strictly positive;
    the column multiplier has one block for each neighbor. Invertible row multiplication preserves the kernel,
    and invertible column multiplication preserves the range. This proves the two support assertions, since
  $ ker R_v = ker \( R_v^0 D_(upright("col")) \) \, wide "ran" R_v = D_(upright("row")) "ran" R_v^0 $
  when the respective other multiplier is held fixed.
  For joint smoothness, the rank-zero case is immediate. Otherwise factor $R_v^0 = X Y^(*)$ with $X \,
    Y$ of full column rank. Write $X' = D_(upright("row")) X$, $Y' = D_(upright("col")) Y$ and $P' =
    X' ""^(*) X'$, $Q' = Y' ""^(*) Y'$. These last two matrices are positive definite and depend smoothly on the
    parameters. The nonzero eigenvalues of $R_v R_v^(*) = X' Q' X' ""^(*)$ are those of $Q' ""^(1 \/ 2) P' Q'
    ""^(1 \/ 2)$, by comparing $A A^(*)$ and $A^(*) A$ for $A = X' Q' ""^(1 \/ 2)$. Therefore
  $ e_v = Phi \( Q' ""^(1 \/ 2) P' Q' ""^(1 \/ 2) \) \, $
  which is smooth on the positive definite cone. ◻
]

#thm([Lemma 4.2.])[
  #emph[Fix a positive vector $bold(alpha)$ and set $sigma_i = alpha_i s$. For all centers and all $s > 0$,
#[#set math.equation(numbering: n => "(4.3)")
 $ 2 partial_s e_v & = sum_i alpha_i partial_(p_i)^2 e_v - alpha_v V_v - sum_(w eq.not v) alpha_w Y_(v \, w) \,\
partial_(p_(v + 1)) partial_(p_(v - 1)) e_v & = Z_v . $ <eq:heat-identity>]

]
] <lem:heat-identities>

#proof[
  For $w = h g_sigma \( u - p \)$ and $L = \( u - p \) \/ sigma$,
  $ partial_p w = L w \, wide partial_p^2 w = \( L^2 - sigma^(- 1) \) w \, wide partial_sigma w = 1 /
    2 partial_p^2 w . $
  With the columns fixed, $T_v$ is linear in the row density, so
  $ partial_(p_v) T_v = U_v \, wide partial_(sigma_v) T_v = 1 / 2 partial_(p_v)^2 T_v . $
  Its support is fixed by Lemma 6. The chain rule and Lemma 2 thus give
  $ partial_(sigma_v) e_v = 1 / 2 partial_(p_v)^2 e_v - 1 / 2 cal(B)_(T_v) \( U_v \, U_v \) = 1 /
    2 partial_(p_v)^2 e_v - 1 / 2 V_v . $
  For a column vertex $w eq.not v$, use instead $S_v$, which is linear in that column density and has fixed
    support. This gives
  $ partial_(p_w) S_v = U_(v \, w) \, wide partial_(sigma_w) e_v = 1 / 2 partial_(p_w)^2 e_v - 1 / 2 Y_(v \, w) . $
  Summing the three variance derivatives with coefficients $alpha_i$ proves (4.3).
  The two summands in $S_v = W_v W_v^(*) + W_(v - 1)^(*) W_(v - 1)$ depend on different column densities.
    Its mixed derivative in the two column centers is therefore zero.
    Only the Hessian term remains in the mixed derivative of $e_v$, giving (4.3). ◻
]

=== 4.2 Comparing neighbors and integrating centers <comparing-neighbors-and-integrating-centers>

#thm([Lemma 4.3.])[
  #emph[For every choice of the weighted matrices and every vertex $w$,
#[#set math.equation(numbering: n => "(4.4)")
 $ Y_(w + 1 \, w) + Y_(w - 1 \, w) lt.eq sqrt(2) thin V_w . $ <eq:heat-neighbors>]

]
] <lem:neighbors>

#proof[
  Abbreviate $A = W_w$, $B = W_(w - 1)^(*)$, and $L = L_w$.
    The inequality $lr(bar.v.double A z + B z' bar.v.double)^2 lt.eq 2 lr(bar.v.double A z bar.v.double)^2 +
    2 lr(bar.v.double B z' bar.v.double)^2$ implies
  $ T_w lt.eq 2 Q \, wide Q = "diag" \( A^(*) A \, B^(*) B \) . $
  Since $U_w = \[ A med B \]^(*) L \[ A med B \]$ is supported on $T_w$, Lemma 3 gives $b_(T_w) \( U_w \) gt.eq
    2^(- 1 \/ 2) b_Q \( U_w \)$. In a block-preserving eigenbasis of $Q$,
    the formula for $b_Q$ is a sum of nonnegative squared entries. Discarding the off-diagonal blocks yields
  $ b_Q \( U_w \) gt.eq b_(A^(*) A) \( A^(*) L A \) + b_(B^(*) B) \( B^(*) L B \) . $
  Here $A^(*) A lt.eq S_(w + 1)$ and $B^(*) B lt.eq S_(w - 1)$,
    and the respective insertions are $U_(w + 1 \, w)$ and $U_(w - 1 \, w)$.
    Each is supported on its smaller edge Gram. Apply Lemma 3 again, now with comparison factor one, to obtain (4.4). ◻
]

#thm([Lemma 4.4.])[
  #emph[Fix finite edge arrays and a positive vector $bold(alpha)$, and evaluate the energies at $sigma_i =
    alpha_i s$. Set
$ J_v \( d \, s \) = integral_(Pi_d) e_v thin #h(-0.16667em) upright(d) pi_d \, wide J \( d \, s \) =
  sum_v J_v \( d \, s \) \, wide Sigma_alpha = sum_i alpha_i . $

 These integrals are finite, continuously differentiable in $s > 0$, and twice continuously differentiable in $d$.
   Moreover,
#[#set math.equation(numbering: n => "(4.5)")
 $ 2 partial_s J \( d \, s \) lt.eq
   integral_(Pi_d) sum_w [- alpha_w + sqrt(2) max { 0 \, Sigma_alpha \/ 2 - alpha_w }] V_w thin #h(-0.16667em)
   upright(d) pi_d . $ <eq:heat-plane-dissipation>]

 In particular, for each permutation of $\( 1 \, lambda \, lambda \)$,
#[#set math.equation(numbering: n => "(4.6)")
 $ - partial_s J \( d \, s \) gt.eq c_(*) integral_(Pi_d) sum_w V_w thin #h(-0.16667em) upright(d) pi_d \, wide
   c_(*) = 1 / 2 min { 1 - 3 / 5 sqrt(2) \, 11 / 10 - 1 / 2 sqrt(2) } > 0 . $ <eq:heat-strict>]

]
] <lem:plane-dissipation>

#proof[
  We first justify differentiation at the fixed mesh. On compact positive $s$-intervals the nodes are bounded,
    the scores grow at most linearly in the centers, and the first and second density ratios grow at most
    quadratically. Lemma 4 gives
  $ V_v lt.eq 3 / 4 lr(bar.v.double L_v bar.v.double)_(upright("op"))^2 e_v \, wide Y_(v \, w) lt.eq 3 /
    4 lr(bar.v.double L_w bar.v.double)_(upright("op"))^2 e_v . $
  For the second inequality, pad $L_w$ by zero on the other column block, obtaining $B_w$ with $U_(v \, w) =
    R_v B_w R_v^(*)$, and apply the lemma to $R_v^(*)$. Also $2 \| Z_v \| lt.eq Y_(v \, v + 1) + Y_(v \, v - 1)$.
    For a Hermitian matrix $B$,
  $ \| "tr" \( sqrt(T_v) R_v^(*) B R_v \) \| lt.eq lr(bar.v.double B bar.v.double)_(upright("op")) e_v \, $
  since $R_v sqrt(T_v) R_v^(*)$ is positive with trace $e_v$.
    The corresponding column estimate follows in the same way with $S_v$ and a padded column insertion.
    Together with the density-ratio formulas in Lemma 7, these bounds control every first center derivative,
    pure second center derivative, mixed column derivative, and first $s$-derivative by a polynomial in the
    centers times $e_v$.
  To dominate the energy itself, use
  #[#set math.equation(numbering: n => "(4.7)")
   $ e_v
     lt.eq \( lr(bar.v.double W_v bar.v.double)_(upright("HS"))^2 + lr(bar.v.double W_(v - 1)
     bar.v.double)_(upright("HS"))^2 \)^(3 \/ 2) lt.eq
     sqrt(2) \( lr(bar.v.double W_v bar.v.double)_(upright("HS"))^3 + lr(bar.v.double W_(v - 1)
     bar.v.double)_(upright("HS"))^3 \) . $ <eq:heat-energy-bound>]
  Each edge norm cubed is bounded by a Gaussian in its two endpoint centers, locally uniformly for $s > 0$.
    Indeed, the finite set of nodes is bounded and $\( u - p \)^2 gt.eq p^2 \/ 2 - u^2$.
    On $Pi_d$ with $\| d \| lt.eq D$, any pair of centers satisfies
  $ p_0^2 + p_1^2 + p_2^2 lt.eq 4 \( p_i^2 + p_j^2 \) + 3 D^2 . $
  Thus an endpoint-pair Gaussian, multiplied by any of the preceding polynomials,
    has an integrable majorant in any fixed plane chart, locally uniformly in $\( d \, s \)$.
    This proves all needed differentiation statements by dominated convergence.
    The constants in this justification may depend on the finite mesh and the compact parameter intervals;
    they will not enter the uniform estimate.
  We can now differentiate the plane integrals. It remains to express their second derivatives in $d$ using both
    pure and mixed center derivatives, then apply Lemma 8 to the resulting costs.
  Choosing $p_i$ as the dependent coordinate in (4.2) gives
  $ partial_d^2 J_v = integral_(Pi_d) partial_(p_i)^2 e_v thin #h(-0.16667em) upright(d) pi_d wide
    upright("for every ") i . $
  For the column indices $j = v + 1$, $k = v - 1$, first choose $p_j$ dependent to write $partial_d J_v =
    integral_(Pi_d) partial_(p_j) e_v thin #h(-0.16667em) upright(d) pi_d$.
    Reparametrize this last integral with $p_k$ dependent, then differentiate again. It follows from (4.3) that
  #[#set math.equation(numbering: n => "(4.8)")
   $ partial_d^2 J_v = integral_(Pi_d) partial_(p_k) partial_(p_j) e_v thin #h(-0.16667em) upright(d) pi_d =
     integral_(Pi_d) Z_v thin #h(-0.16667em) upright(d) pi_d . $ <eq:heat-plane-mixed>]
  These are identities of integrated derivatives; no pointwise equality between pure and mixed derivatives is required.
  Integrating (4.3) and using (4.8), we obtain
  $ 2 partial_s J_v = integral_(Pi_d) [Sigma_alpha Z_v - alpha_v V_v - sum_(w eq.not v) alpha_w Y_(v \, w)]
    #h(-0.16667em) upright(d) pi_d . $
  Cauchy–Schwarz gives $2 Z_v lt.eq Y_(v \, v + 1) + Y_(v \, v - 1)$.
    Sum over $v$ and collect the two neighbor costs carrying the score at $w$.
    Their common coefficient is $Sigma_alpha \/ 2 - alpha_w$.
    If it is negative, discard those terms; otherwise apply Lemma 8. This proves (4.5).
  For the indicated permutations, $Sigma_alpha = 16 \/ 5$. The two possible coefficients in (4.5) are $-
    1 + \( 3 \/ 5 \) sqrt(2)$ and $- 11 \/ 10 + \( 1 \/ 2 \) sqrt(2)$, both strictly negative.
    Dividing by two gives (4.6). ◻
]

=== 4.3 The initial energy <the-initial-energy>

The previous lemma controls the accumulated costs by the energy lost along the heat flow.
  We now bound the energy itself at scales no smaller than the mesh.
  This estimate will also apply immediately after entries are switched on or off,
  since it requires only a bound on their absolute values.

#thm([Lemma 4.5.])[
  (Initial energy).  #emph[Let $h > 0$, let $N gt.eq 0$ be an integer,
    and let $A_v \( i \, j \)$ be the finite complex arrays above.
    For any $d in bb(R)$ and variances $sigma_v gt.eq h^2$,
#[#set math.equation(numbering: n => "(4.9)")
 $ integral_(Pi_d) sum_v e_v thin #h(-0.16667em) upright(d) pi_d lt.eq C_0 cal(S) \( A \) \, wide C_0 =
   2 sqrt(2) (1 + sqrt(2 \/ pi)) . $ <eq:initial-energy>]

 The same bound holds if any entries are replaced by smaller entries in absolute value before forming the weighted
   matrices.]
] <lem:initial-energy>

#proof[
  For every center $p$ and variance $sigma > 0$,
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_(i = - N)^N h g_sigma \( u_i - p \) lt.eq 1 + frac(2 h, sqrt(2 pi sigma)) . $ <eq:heat-mesh-mass>]
  To see this, compare a grid point $u_i gt.eq p + h$ with the integral over its preceding interval of length $h$,
    where the Gaussian is at least its value at $u_i$. For $u_i lt.eq p - h$, use the succeeding interval.
    These intervals are disjoint, and the at most two remaining grid points each contribute at most $h sup g_sigma$.
  Since each $sigma_v gt.eq h^2$, every density has total mass at most $M = 1 + sqrt(2 \/ pi)$. Weighted Hölder gives
  $ lr(bar.v.double W_v bar.v.double)_(upright("HS"))^3 & =
    (sum_(i \, j) \| A_v \( i \, j \) \|^2 w_v \( i \) w_(v + 1) \( j \))^(3 \/ 2)\
 & lt.eq M sum_(i \, j) \| A_v \( i \, j \) \|^3 w_v \( i \) w_(v + 1) \( j \) . $
  Integrate with $p_v \, p_(v + 1)$ as free coordinates on $Pi_d$. Each density has integral $h$, so
  $ integral_(Pi_d) lr(bar.v.double W_v bar.v.double)_(upright("HS"))^3 thin #h(-0.16667em) upright(d) pi_d lt.eq
    M sum_(i \, j) h^2 \| A_v \( i \, j \) \|^3 . $
  Each edge occurs in exactly two stars. Equation (4.7) therefore proves (4.9).
    Replacing entries by smaller ones in absolute value only reduces the last upper bounds,
    proving the final assertion. ◻
]

For fixed arrays and a permutation $bold(alpha)$ of $\( 1 \, lambda \, lambda \)$, Lemmas 9 and 10 now give,
  whenever $h^2 lt.eq s_0 < s_1$,

$ integral_(s_0)^(s_1) integral_(Pi_0) sum_v V_v thin #h(-0.16667em) upright(d) pi_0 thin #h(-0.16667em)
  upright(d) s lt.eq frac(J \( 0 \, s_0 \) - J \( 0 \, s_1 \), c_(*)) lt.eq C_0 / c_(*) cal(S) \( A \) . $

The first inequality retains the final energy. In the next section,
  we will add these inequalities over intervals with different masked arrays.

== 5 Output-dependent truncations and energy jumps <sec:jumps>

We now allow each entry of one edge array to have its own truncation interval.
  Between endpoint scales, the heat estimate from Section 4 still applies.
  The new task is to bound the total increase in energy when entries switch on or off.
  We will in fact bound the sum of the absolute energy jumps.
  The estimate depends on the original arrays alone, because every entry switches at most twice.
  We first establish two inputs to this bound: estimates for Gaussian averages that are uniform in the scale,
  and a formula for changes in the matrix energy that remains valid when the rank changes.

=== 5.1 Maximal averages on a line <maximal-averages-on-a-line>

For a locally integrable function on $bb(R)$, and a sequence on $bb(Z)$, respectively,
  define the centered maximal functions

$ M_(bb(R)) f \( x \) = sup_(r > 0) frac(1, 2 r) integral_(x - r)^(x + r) \| f \( t \) \| thin #h(-0.16667em)
  upright(d) t \, wide M_(bb(Z)) f \( n \) = sup_(r in bb(Z)_(gt.eq 0)) frac(1, 2 r + 1)
  sum_(\| m - n \| lt.eq r) \| f \( m \) \| . $

Thus discrete averages include singletons. We use Lebesgue measure on $bb(R)$ and counting measure on $bb(Z)$.
  The estimates below are versions of the classical Hardy–Littlewood maximal
  inequalities #cite(label("HardyLittlewood1930")) Section IV;
  we include the centered covering argument and the Gaussian comparison with the constants needed here.

#thm([Lemma 5.1.])[
  (One-dimensional maximal estimates).  #emph[On either of these measure spaces,
    write $M$ for the corresponding centered maximal operator. For $f in L^1$ and $rho > 0$,
$ mu { M f > rho } lt.eq 3 / rho parallel f parallel_1 . $

 For every $1 < q < oo$ and $f in L^q$,
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel M f parallel_q^q lt.eq frac(6 q thin 2^(q - 1), q - 1) parallel f parallel_q^q . $ <eq:line-maximal-strong>]

 Moreover, there is an absolute constant $C_g$ such that, whenever $h > 0$, $sigma gt.eq h^2$ and $n in bb(Z)$,
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(m in bb(Z)) h g_sigma \( \( m - n \) h \) \| f \( m \) \| lt.eq
   C_g M_(bb(Z)) f \( n \) . $ <eq:discrete-gaussian-maximal>]

]
] <lem:line-maximal>

#proof[
  For a finite collection of intervals, repeatedly choose an interval of largest radius and discard all intervals
    meeting it. The chosen intervals are disjoint. Every discarded interval has radius no larger than that of the
    interval which removed it and is contained in its triple-radius enlargement.
    This enlargement has three times the original length on $bb(R)$.
    On $bb(Z)$, its cardinality is $6 r + 1 lt.eq 3 \( 2 r + 1 \)$, including $r = 0$.
  For each point in a finite subset of ${ M_(bb(Z)) f > rho }$,
    choose a witnessing interval whose average exceeds $rho$.
    The preceding selection bounds the size of that subset by three times the sum of the cardinalities of the
    chosen intervals, and hence by $3 parallel f parallel_1 \/ rho$.
    Taking the supremum over finite subsets proves the discrete weak estimate.
    On $bb(R)$, fixed-radius averages of an $L^1$ function are continuous, so ${ M_(bb(R)) f > rho }$ is open.
    Apply the same selection to a finite witnessing cover of any compact subset and then use inner regularity to
    obtain the continuous estimate.
  For $f in L^q$, split $f$ into its parts on ${ \| f \| lt.eq rho \/ 2 }$ and ${ \| f \| > rho \/ 2 }$.
    The first part has maximal function at most $rho \/ 2$, and the second is integrable. The weak estimate gives
  $ mu { M f > rho } lt.eq 6 / rho integral_(\| f \| > rho \/ 2) \| f \| thin #h(-0.16667em) upright(d) mu . $
  The distribution formula and Tonelli’s theorem now yield
  $ parallel M f parallel_q^q & lt.eq 6 q integral \| f \( x \) \| integral_0^(2 \| f \( x \) \|) rho^(q - 2) thin
    #h(-0.16667em) upright(d) rho thin #h(-0.16667em) upright(d) mu \( x \)\
 & = frac(6 q thin 2^(q - 1), q - 1) parallel f parallel_q^q . $
  These formulas are valid first with a bounded range of distribution parameters and then by monotone convergence;
    finiteness of $M f$ is not assumed in advance. Both maximal functions are measurable:
    the discrete supremum is countable, and continuous averages are continuous in their radius,
    so positive rational radii suffice on $bb(R)$.
  Finally put $a = sqrt(sigma) \/ h gt.eq 1$. In the sum in (5.2), the kernel is
  $ h g_sigma \( \( m - n \) h \) = frac(1, sqrt(2 pi) a) exp (- frac(\( m - n \)^2, 2 a^2)) . $
  Split the integers into $\| m - n \| lt.eq a$ and the annuli $2^(j - 1) a < \| m - n \| lt.eq 2^j a$, $j gt.eq
    1$. The sum of $\| f \|$ over $\| m - n \| lt.eq 2^j a$ is at most $3 dot.op 2^j a thin M_(bb(Z)) f \( n \)$.
    Bounding the Gaussian by its maximum on each region proves the claim with, for example,
  $ C_g = 3 / sqrt(2 pi) (1 + sum_(j gt.eq 1) 2^j e^(- 4^(j - 1) \/ 2)) < oo . $
  All constants are independent of the mesh and of the support of $f$. ◻
]

=== 5.2 Changing a matrix entry <changing-a-matrix-entry>

At a truncation endpoint the rank of a star can change. We therefore need a first-derivative formula that does not
  require fixed support. For the sum of cubes of the singular values,
  this formula is a case of the general gradient formula for unitarily invariant matrix
  functions #cite(label("Lewis1995")) Theorem 3.1. We give a direct regularization proof and then establish the
  entrywise bound used in the jump estimate.

#thm([Lemma 5.2.])[
  (A derivative through rank changes).  #emph[For finite rectangular complex matrices $R_(-) \,
    R_(+)$ of the same size, put $R \( z \) = \( 1 - z \) R_(-) + z R_(+)$ and $D = R_(+) - R_(-)$. Then
#[#set math.equation(numbering: n => "(5.3)")
 $ & Phi \( R_(+)^(*) R_(+) \) - Phi \( R_(-)^(*) R_(-) \)\
 & quad = 3 integral_0^1 "Re" chevron.l R \( z \) sqrt(R \( z \)^(*) R \( z \)) \,
   D chevron.r_(upright("HS")) thin #h(-0.16667em) upright(d) z . $ <eq:rank-change-derivative>]

 For every rectangular matrix $R$ and every entry $\( i \, j \)$,
#[#set math.equation(numbering: n => "(5.4)")
 $ \| \( R sqrt(R^(*) R) \)_(i j) \| lt.eq parallel "row"_i R parallel_2 thin parallel "col"_j R parallel_2 .
   $ <eq:entry-gradient>]

]
] <lem:rank-change>

#proof[
  For $eta > 0$, differentiate $"tr" \( \( R \( z \)^(*) R \( z \) + eta I \)^(3 \/ 2) \)$ using Lemma 2.
    Its derivative is
  $ 3 "Re" chevron.l R \( z \) sqrt(R \( z \)^(*) R \( z \) + eta I) \, D chevron.r_(upright("HS")) . $
  Spectral calculus gives
  $ parallel sqrt(R^(*) R + eta I) - sqrt(R^(*) R) parallel_(upright("op")) lt.eq sqrt(eta) . $
  Since $R \( z \)$ stays in a bounded set, the derivatives converge uniformly in $z$,
    and the endpoint energies converge. Integrating the regularized identity before letting $eta arrow.b
    0$ proves (5.3).
  Cauchy–Schwarz in the matrix-product formula bounds the left side of (5.4) by the norm of row $i$ of $R$ times
    the norm of column $j$ of $sqrt(R^(*) R)$. The squared norm of that column is $\( R^(*) R \)_(j j)$,
    which is also the squared norm of column $j$ of $R$. This proves (5.4),
    including zero columns and singular matrices. ◻
]

=== 5.3 The total jump bound <the-total-jump-bound>

Return to the finite arrays and Gaussian weights of Section 4, and write $#h(-0.16667em) upright(d) pi =
  #h(-0.16667em) upright(d) pi_0$ on $Pi_0$. Independently for every pair $\( i \, j \)$, choose finite endpoints

$ h lt.eq epsilon_(i j) < rho_(i j) \, wide A_0^s \( i \, j \) =
  A_0 \( i \, j \) upright(bold(1))_({ epsilon_(i j)^2 < s < rho_(i j)^2 }) . $

The chosen endpoints are fixed independently of the Gaussian centers.
  Keep $A_1 \, A_2$ fixed and form the weighted matrices and costs using $A_0^s$ in place of $A_0$.
  The arrays are complex; any phase at an output pair may be included in the fixed value $A_0 \( i \, j \)$. Set

$ s_(-) = min_(i \, j) epsilon_(i j)^2 \, wide s_(+) = max_(i \, j) rho_(i j)^2 . $

#thm([Proposition 5.3.])[
  (Dissipation with output-dependent endpoints).  #emph[For every $h > 0$, $N gt.eq 0$,
    complex arrays $A_v$ on ${ - N \, dots.h \, N }^2$, and endpoint choices as above,
    let $alpha$ be any permutation of $\( 1 \, 11 \/ 10 \, 11 \/ 10 \)$ and use variances $sigma_v = alpha_v s$.
    The corresponding masked costs satisfy
#[#set math.equation(numbering: n => "(5.5)")
 $ integral_(s_(-))^(s_(+)) integral_(Pi_0) sum_(v = 0)^2 V_v \( p \, s \) thin #h(-0.16667em) upright(d) pi thin
   #h(-0.16667em) upright(d) s lt.eq C cal(S) \( A \) . $ <eq:masked-dissipation>]

 The constant is independent of the arrays, the mesh, the endpoints, and the number of distinct endpoint values.]
] <prop:masked-dissipation>

#proof[
  Write $J \( s \) = integral_(Pi_0) sum_v e_v \( p \, s \) thin #h(-0.16667em) upright(d)
    pi$ for the masked energy, and put $Delta J \( tau \) = J \( tau + \) - J \( tau - \)$ at an endpoint.
    We first estimate its jump at a single scale, then sum those estimates and telescope the heat inequality.
  ===== 5.3.1 The two stars at a jump. <the-two-stars-at-a-jump.>
  At an endpoint scale $tau$, hold the weights at $s = tau$ and let
  $ delta A \( i \, j \) = A_0^(tau +) \( i \, j \) - A_0^(tau -) \( i \, j \) . $
  The superscripts denote one-sided masks. Interpolate all changed entries at once between these two arrays.
    Each interpolated entry has absolute value at most $\| A_0 \( i \, j \) \|$,
    even when some entries open and others close at the same scale.
  For fixed $i \, j \, p$, define nonnegative numbers using the original, unmasked arrays:
  #[#set math.equation(numbering: n => "(5.6)")
   $ X^2 & = sum_m \| A_0 \( i \, m \) \|^2 w_1 \( m \) \, & Y^2 & = sum_m \| A_0 \( m \, j \) \|^2 w_0 \( m \) \,\
H^2 & = sum_m \| A_2 \( m \, i \) \|^2 w_2 \( m \) \, & K^2 & =
  sum_m \| A_1 \( j \, m \) \|^2 w_2 \( m \) . $ <eq:jump-slice-quantities>]
  In $R_0 = \[ W_0 thick W_2^(*) \]$, a changing entry has row norm at most $sqrt(w_0 \( i \)) sqrt(X^2 + H^2)$,
    column norm at most $sqrt(w_1 \( j \)) Y$, and derivative modulus $sqrt(w_0 \( i \) w_1 \( j \)) \| delta
    A \( i \, j \) \|$. In $R_1 = \[ W_1 thick W_0^(*) \]$, its adjoint entry has row norm at most
    $sqrt(w_1 \( j \)) sqrt(Y^2 + K^2)$ and column norm at most $sqrt(w_0 \( i \)) X$,
    with the same derivative modulus. Star $R_2 = \[ W_2 thick W_1^(*) \]$ is unchanged.
    Lemma 12 and $sqrt(x^2 + y^2) lt.eq x + y$ therefore give
  #[#set math.equation(numbering: n => "(5.7)")
   $ \| Delta e_0 \| + \| Delta e_1 \| lt.eq 3 sum_(i \, j) \| delta A \( i \, j \) \| w_0 \( i \) w_1 \( j \)
     #scale(x: 120%, y: 120%)[\[] \( X + H \) Y + \( Y + K \) X #scale(x: 120%, y: 120%)[\]] . $ <eq:jump-entry-bound>]
  This estimate requires no assumption on the ranks during interpolation.
  ===== 5.3.2 A probability measure on the center plane. <a-probability-measure-on-the-center-plane.>
  For each fixed $i \, j$, the measure
  $ #h(-0.16667em) upright(d) nu_(i j) = h^(- 2) w_0 \( i \) w_1 \( j \) thin #h(-0.16667em) upright(d) pi $
  is a probability measure. Indeed, in the free coordinates $\( p_0 \, p_1 \)$,
    its density is $g_(sigma_0) \( u_i - p_0 \) g_(sigma_1) \( u_j - p_1 \)$.
    Thus $p_0 \, p_1$ are independent Gaussian variables with means $u_i \, u_j$ and variances $sigma_0 \,
    sigma_1$, while $p_2 = - p_0 - p_1$. Adding Gaussian variances gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ bb(E)_(nu_(i j)) w_0 \( m \) & = h g_(2 sigma_0) \( u_m - u_i \) \,\
bb(E)_(nu_(i j)) w_1 \( m \) & = h g_(2 sigma_1) \( u_m - u_j \) \,\
bb(E)_(nu_(i j)) w_2 \( m \) & = h g_(sigma_0 + sigma_1 + sigma_2) \( u_m + u_i + u_j \) .
  $ <eq:jump-gaussian-expectations>]
  For the last identity, $p_0 + p_1$ has mean $u_i + u_j$ and variance $sigma_0 + sigma_1$,
    and averaging $g_(sigma_2) \( u_m + p_0 + p_1 \)$ adds the remaining variance.
    Each identity also follows directly by completing the square in its Gaussian integral.
  Extend the arrays by zero to $bb(Z)^2$ and define
  #[#set math.equation(numbering: n => "(5.9)")
   $ X_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_0 \( i \, dot.op \) \|^2 \) \( j \) \,\
Y_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_0 \( dot.op \, j \) \|^2 \) \( i \) \,\
H_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_2 \( dot.op \, i \) \|^2 \) \( - i - j \) \,\
K_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_1 \( j \, dot.op \) \|^2 \) \( - i - j \) . $ <eq:jump-starred-majorants>]
  Every variance in (5.8) is at least $h^2$. Lemma 11 consequently bounds $bb(E) X^2 \, bb(E) Y^2 \, bb(E) H^2 \,
    bb(E) K^2$ by $C_g$ times the corresponding starred squares.
    Cauchy–Schwarz under the probability $nu_(i j)$ gives, in particular,
  $ bb(E) \( X Y \) lt.eq C_g X_(*) Y_(*) \, wide bb(E) \( H Y \) lt.eq C_g H_(*) Y_(*) \, wide
    bb(E) \( K X \) lt.eq C_g K_(*) X_(*) . $
  No independence of these four random variables is needed.
    The starred quantities depend only on the original arrays and the output indices, not on the scale $tau$.
  ===== 5.3.3 Summing the jumps. <summing-the-jumps.>
  Integrating (5.7) over the centers and using $w_0 \( i \) w_1 \( j \) thin #h(-0.16667em) upright(d) pi =
    h^2 thin #h(-0.16667em) upright(d) nu_(i j)$ yields
  $ \| Delta J \( tau \) \| lt.eq 3 C_g sum_(i \, j) h^2 \| delta
    A \( i \, j \) \| \( 2 X_(*) Y_(*) + H_(*) Y_(*) + K_(*) X_(*) \) . $
  Every entry opens once and closes once. Therefore its total absolute change,
    summed over any subset of endpoint scales, is at most $2 \| A_0 \( i \, j \) \|$. We obtain
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_tau \| Delta J \( tau \) \| lt.eq 6 C_g sum_(i \, j) h^2 \|
     A_0 \( i \, j \) \| \( 2 X_(*) Y_(*) + H_(*) Y_(*) + K_(*) X_(*) \) . $ <eq:total-jump-majorant>]
  The sum may include all endpoints or just the interior ones.
  To bound this expression, set
  $ n_v = (sum_(i \, j) h^2 \| A_v \( i \, j \) \|^3)^(1 \/ 3) \, wide parallel f parallel_(3 \, h)^3 =
    sum_(i \, j in bb(Z)) h^2 \| f \( i \, j \) \|^3 . $
  The $q = 3 \/ 2$ case of (5.1), applied on slices, gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ parallel X_(*) parallel_(3 \, h) \, med parallel Y_(*) parallel_(3 \, h) lt.eq C n_0 \, wide
     parallel H_(*) parallel_(3 \, h) lt.eq C n_2 \, wide parallel K_(*) parallel_(3 \, h) lt.eq
     C n_1 . $ <eq:jump-slice-norms>]
  For $H_(*)$, fix $i$ and change the summation index from $j$ to $- i - j$; this is a bijection of $bb(Z)$.
    For $K_(*)$, fix $j$ and change $i$ to $- i - j$. Thus both estimates are ordinary slice estimates,
    with no multiplicity or mesh factor. Restricting the sums back to the original finite square can only decrease them.
  Hölder’s inequality in (5.10), followed by (5.11), proves
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_tau \| Delta J \( tau \) \| lt.eq C \( 2 n_0^3 + n_0^2 n_2 + n_0^2 n_1 \) lt.eq
     C cal(S) \( A \) . $ <eq:total-jump-bound>]
  The last step uses $a^2 b lt.eq \( 2 a^3 + b^3 \) \/ 3$. In particular,
    the estimate has no dependence on how many distinct scales occur.
  ===== 5.3.4 Telescoping the heat estimate. <telescoping-the-heat-estimate.>
  List the distinct squared endpoints as $t_0 = s_(-) < t_1 < dots.h.c < t_m = s_(+)$.
    On every open interval $\( t_k \, t_(k + 1) \)$ the array is fixed, so Lemma 9 applies.
    Its fixed-array continuity and Gaussian domination also justify the one-sided endpoint limits.
    Integrating on these intervals and summing gives
  $ c_(*) integral_(s_(-))^(s_(+)) integral_(Pi_0) sum_v V_v thin #h(-0.16667em) upright(d) pi thin #h(-0.16667em)
    upright(d) s & lt.eq sum_(k = 0)^(m - 1) #scale(x: 120%, y: 120%)[\[] J \( t_k + \) -
    J \( t_(k + 1) - \) #scale(x: 120%, y: 120%)[\]]\
 & = J \( s_(-) + \) - J \( s_(+) - \) + sum_(k = 1)^(m - 1) #scale(x: 120%, y: 120%)[\[] J \( t_k + \) -
   J \( t_k - \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq J \( s_(-) + \) + sum_(k = 1)^(m - 1) \| Delta J \( t_k \) \| . $
  Here the terminal energy was discarded by nonnegativity. The initial right-hand mask has entries bounded by
    those of the original array, and all its variances are at least $h^2$.
    Lemma 10 therefore gives $J \( s_(-) + \) lt.eq C cal(S) \( A \)$. Together with (5.12), this proves (5.5).
    The initial opening is accounted for by the right-hand initial energy; a final closing jump is unnecessary.
    Simultaneous endpoints have already been combined in the list of distinct scales,
    and their values at the single endpoint do not affect the scale integral. ◻
]

Figure 2 illustrates the masks and the energy accounting.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((2.3, 0.1), (2.3, 6.15), stroke: (paint: rgb("#c2c2c2"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.8, 0.1), (3.8, 6.15), stroke: (paint: rgb("#c2c2c2"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((6.4, 0.1), (6.4, 6.15), stroke: (paint: rgb("#c2c2c2"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((9, 0.1), (9, 6.15), stroke: (paint: rgb("#c2c2c2"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((11.6, 0.1), (11.6, 6.15), stroke: (paint: rgb("#c2c2c2"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((1.9, 6.65), [#text(size: 9pt)[Output-dependent scale intervals]], anchor: "west", padding: 0.1176cm)
  line((1.95, 5.8), (12.25, 5.8), stroke: (paint: rgb("#c7c7c7"), thickness: 0.4pt, miter-limit: 10))
  line((1.95, 4.8), (12.25, 4.8), stroke: (paint: rgb("#c7c7c7"), thickness: 0.4pt, miter-limit: 10))
  line((1.95, 3.8), (12.25, 3.8), stroke: (paint: rgb("#c7c7c7"), thickness: 0.4pt, miter-limit: 10))
  content((1.7, 5.8), [#text(size: 9pt)[$(i_1,j_1)$]], anchor: "east", padding: 0.1176cm)
  content((1.7, 4.8), [#text(size: 9pt)[$(i_2,j_2)$]], anchor: "east", padding: 0.1176cm)
  content((1.7, 3.8), [#text(size: 9pt)[$(i_3,j_3)$]], anchor: "east", padding: 0.1176cm)
  line((2.3, 5.8), (6.4, 5.8), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  line((3.8, 4.8), (9, 4.8), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  line((6.4, 3.8), (11.6, 3.8), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  circle((2.3, 5.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  circle((6.4, 5.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  circle((3.8, 4.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  circle((9, 4.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  circle((6.4, 3.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  circle((11.6, 3.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.65pt, miter-limit: 10))
  content((2.3, 5.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon_(i_1j_1)^(thin 2)$]]])], anchor: "south")
  content((6.4, 5.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$rho_(i_1j_1)^(thin 2)$]]])], anchor: "south")
  content((3.8, 4.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon_(i_2j_2)^(thin 2)$]]])], anchor: "south")
  content((9, 4.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$rho_(i_2j_2)^(thin 2)$]]])], anchor: "south")
  content((6.4, 3.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon_(i_3j_3)^(thin 2)$]]])], anchor: "south")
  content((11.6, 3.91), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$rho_(i_3j_3)^(thin 2)$]]])], anchor: "south")
  line((1.95, 3.35), (12.6, 3.35), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#595959"))))
  content((12.6, 3.35), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  content((1.9, 2.9), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Integrated energy]]])], anchor: "west")
  line((1.95, 0.1), (12.6, 0.1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#595959"))))
  content((12.6, 0.1), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  content((1.7, 1.7), [#text(size: 9pt)[$J(s)$]], anchor: "east", padding: 0.1176cm)
  bezier((2.3, 2.2), (3.8, 1.82), (2.9, 2.05), (3.3, 1.91), stroke: (paint: rgb("#000000"), thickness: 1.0pt, miter-limit: 10))
  line((3.8, 1.82), (3.8, 2.38), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ">>", length: 0.1058cm, fill: rgb("#a60000"))))
  bezier((3.8, 2.38), (6.4, 1.64), (4.7, 2.13), (5.4, 1.85), stroke: (paint: rgb("#000000"), thickness: 1.0pt, miter-limit: 10))
  line((6.4, 1.64), (6.4, 1.97), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ">>", length: 0.1058cm, fill: rgb("#a60000"))))
  bezier((6.4, 1.97), (9, 1.18), (7.2, 1.75), (8.1, 1.37), stroke: (paint: rgb("#000000"), thickness: 1.0pt, miter-limit: 10))
  line((9, 1.18), (9, 0.78), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ">>", length: 0.1058cm, fill: rgb("#a60000"))))
  bezier((9, 0.78), (11.6, 0.32), (9.9, 0.61), (10.7, 0.43), stroke: (paint: rgb("#000000"), thickness: 1.0pt, miter-limit: 10))
  content((2.3, 0.02), [#text(size: 9pt)[$s_-$]], anchor: "north", padding: 0.1176cm)
  content((11.6, 0.02), [#text(size: 9pt)[$s_+$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: Three selected output pairs and a schematic integrated energy, not an exact heat-flow solution. The entry $A_0^s \( i \, j \)$ is retained only on $\( epsilon_(i j)^2 \, rho_(i j)^2 \)$. Between successive event scales, $J \( s \)$ is nonincreasing by the fixed-array dissipation inequality. Dashed arrows connect its one-sided limits at events; the values at the events themselves are not shown. Jumps may have either sign, and endpoints may coincide, as illustrated by $rho_(i_1 j_1)^2 = epsilon_(i_3 j_3)^2$. The bound $sum_tau \| Delta J \( tau \) \| lt.eq C cal(S) \( A \)$, together with the initial-energy bound, controls the accumulated dissipation independently of the number of event scales. ],
) <fig:mask-energy>

== 6 From masked energies to the maximal transform <sec:maximal>

The estimate of Section 5 allows different truncation endpoints at every output position.
  We first use this freedom on a finite mesh, choosing the endpoints that maximize each output.
  We then pass to functions and compare the resulting smooth kernels with hard truncations.
  The comparison will be pointwise and uniform in both endpoints.

=== 6.1 Odd windows and selected endpoints <odd-windows-and-selected-endpoints>

For $s > 0$ and $0 < epsilon < R$, define

$ k_s \( t \) = t / sqrt(s) g_s \( t \) \, wide psi = k_1 * k_1 * k_1 \, wide I_(epsilon \, R) \( t \) =
  integral_(epsilon^2)^(R^2) s^(- 1 \/ 2) psi \( t \/ sqrt(s) \) thin frac(#h(-0.16667em) upright(d) s, s) . $

Here $*$ is convolution on $bb(R)$. The function $psi$ is Schwartz,
  and $I_(epsilon \, R)$ is smooth and integrable for fixed positive endpoints.

#thm([Proposition 6.1.])[
  (Selected smooth truncations).  #emph[Let $h > 0$, let $N gt.eq 0$ be an integer, set $u_i = i h$,
    and let $A_v \( i \, j \)$, $v = 0 \, 1 \, 2$, be complex arrays indexed by $- N lt.eq i \, j lt.eq N$.
    Assign an arbitrary endpoint pair $h lt.eq epsilon_(i j) < rho_(i j) < oo$ to each $\( i \, j \)$. Then
#[#set math.equation(numbering: n => "(6.1)")
 $
   lr(|h^3 sum_(i \, j \, l) A_0 \( i \, j \) A_1 \( j \, l \) A_2 \( l \, i \) I_(epsilon_(i j) \, rho_(i j)) \(
   u_i + u_j + u_l \)|) lt.eq C product_(v = 0)^2 (sum_(i \, j) h^2 \| A_v \( i \, j \) \|^3)^(1 \/ 3) .
   $ <eq:selected-kernel>]

 The constant is independent of the arrays, mesh and selected endpoints.]
] <prop:selected-kernel>

#proof[
  We apply the mixed trace inequality with Gaussian weights of larger variance than the windows $k_s$,
    so that the diagonal insertions are bounded. We then compare each quadratic cost with a variance choice
    covered by Proposition 13.
  Use the masked array $A_0^s \( i \, j \) = A_0 \( i \, j \)
    upright(bold(1))_({ epsilon_(i j)^2 < s < rho_(i j)^2 })$ and the scale interval $\[ s_(-) \, s_(+) \]$ from
    Proposition 13. All weighted matrices below use this same mask.
    Let superscript $upright(b)$ denote the base variances $\( lambda s \, lambda s \, lambda s \)$,
    where $lambda = 11 \/ 10$, and put
  $ D_v \( i \, i \) = frac(k_s \( u_i - p_v \), g_(lambda s) \( u_i - p_v \)) . $
  These matrices are real diagonal. With $z = \( u_i - p_v \) \/ sqrt(s)$,
  $ \| D_v \( i \, i \) \| = sqrt(lambda) thin \| z \| e^(- \( lambda - 1 \) z^2 \/ \( 2 lambda \)) lt.eq lambda /
    sqrt(e \( lambda - 1 \)) . $
  Thus their operator norms have an absolute bound.
  For each vertex $v$, let $bold(alpha) \( v \)$ equal $1$ at $v$ and $lambda$ at the other two vertices.
    In the star centered at $v$, changing from the base variances to $bold(alpha) \( v \)
    s$ changes only its row weight. In particular,
  $ R_v^(bold(alpha) \( v \)) = "diag"_i (sqrt(frac(g_s \( u_i - p_v \), g_(lambda s) \( u_i - p_v \))))
    R_v^(upright(b)) \, wide T_v^(bold(alpha) \( v \)) lt.eq sqrt(lambda) thin T_v^(upright(b)) . $
  The last inequality uses $g_s lt.eq sqrt(lambda) thin g_(lambda s)$.
    The score $L_v^(bold(alpha) \( v \))$ equals $"diag"_i \( \( u_i - p_v \) \/ s \)$,
    so the row densities also give the exact identity
  #[#set math.equation(numbering: n => "(6.2)")
   $ \( R_v^(upright(b)) \)^(*) D_v R_v^(upright(b)) = sqrt(s) thin \( R_v^(bold(alpha) \( v \)) \)^(*)
     L_v^(bold(alpha) \( v \)) R_v^(bold(alpha) \( v \)) . $ <eq:maximal-window-score>]
  Indeed, both inserted row densities are $h k_s \( u_i - p_v \)$, and all column weights agree.
    The insertion on the left is therefore supported on $T_v^(bold(alpha) \( v \))$.
    Lemma 3 and quadratic homogeneity give
  $ b_(T_v^(upright(b))) #scale(x: 120%, y: 120%)[\(] \( R_v^(upright(b)) \)^(*) D_v R_v^(upright(b))
    #scale(x: 120%, y: 120%)[\)] lt.eq lambda^(1 \/ 4) s V_v^(bold(alpha) \( v \)) . $
  Apply Lemma 5 to the base matrices. Integrate its three nonnegative terms separately,
    using Proposition 13 with the corresponding $bold(alpha) \( v \)$.
    The factor $s$ cancels $#h(-0.16667em) upright(d) s \/ s$, and we obtain
  #[#set math.equation(numbering: n => "(6.3)")
   $ integral_(s_(-))^(s_(+)) integral_(Pi_0)
     lr(|"tr" \( D_0 W_0^(upright(b)) D_1 W_1^(upright(b)) D_2 W_2^(upright(b)) \)|) thin #h(-0.16667em)
     upright(d) pi_0 thin frac(#h(-0.16667em) upright(d) s, s) lt.eq C cal(S) \( A \) . $ <eq:masked-window-integral>]
  We identify the signed integral in this estimate. Expanding the trace leaves one signed Gaussian weight at each
    vertex:
  $ h^3 sum_(i \, j \, l) A_0^s \( i \, j \) A_1 \( j \, l \) A_2 \( l \, i \) k_s \( u_i - p_0 \)
    k_s \( u_j - p_1 \) k_s \( u_l - p_2 \) . $
  On $Pi_0$, substitute $r = u_i - p_0$ and $q = u_j - p_1$.
    The Jacobian is one and the third argument becomes $u_i + u_j + u_l - r - q$.
    Consequently the center integral is $\( k_s * k_s * k_s \) \( u_i + u_j + u_l \)$.
    Since $k_s \( t \) = s^(- 1 \/ 2) k_1 \( t \/ sqrt(s) \)$, this convolution equals
  $ s^(- 1 \/ 2) psi #scale(x: 120%, y: 120%)[\(] \( u_i + u_j + u_l \) \/ sqrt(s) #scale(x: 120%, y: 120%)[\)] . $
  The sums are finite and the Gaussian products are absolutely integrable on the center plane and the compact
    positive scale interval. Thus all these integrations can be performed term by term.
    The mask restricts the scale integral of the $\( i \, j \, l \)$ term to
    $\( epsilon_(i j)^2 \, rho_(i j)^2 \)$. Taking the absolute value after integration in (6.3) proves (6.1) with
    its right side initially replaced by $C cal(S) \( A \)$.
  Put $n_v = \( sum h^2 \| A_v \|^3 \)^(1 \/ 3)$. If any $n_v$ is zero the signed sum vanishes.
    Otherwise apply the last estimate to $A_v \/ n_v$ for all three vertices,
    keeping the selected endpoints fixed. The normalized value of $cal(S)$ is $3$.
    Scaling the signed trilinear expression back proves the proposition. ◻
]

=== 6.2 Finite maxima and the continuum limit <finite-maxima-and-the-continuum-limit>

For functions $F \, G$ on $bb(R)^2$, write

$ B_(epsilon \, R)^I \( F \, G \) \( x \, y \) = integral_(bb(R)) F \( x + t \, y \) G \( x \, y + t \)
  I_(epsilon \, R) \( t \) thin #h(-0.16667em) upright(d) t . $

For compactly supported smooth inputs this integral is defined at every point.
  We now place the supremum over its endpoints inside the spatial norm.

#thm([Proposition 6.2.])[
  #emph[For all complex $F \, G in C_c^oo \( bb(R)^2 \)$,
$ ∥sup_(0 < epsilon < R) \| B_(epsilon \, R)^I \( F \, G \) \|∥_(L^(3 \/ 2) \( bb(R)^2 \)) lt.eq
  C parallel F parallel_(L^3 \( bb(R)^2 \)) parallel G parallel_(L^3 \( bb(R)^2 \)) . $

 The supremum is measurable and the constant is absolute.]
] <prop:smooth-kernel-maximal>

#proof[
  First fix a nonempty finite family of endpoint pairs $\( epsilon_k \, R_k \)$, $1 lt.eq k lt.eq m$,
    and take $h lt.eq min_k epsilon_k$. For finite arrays $A_1 \, A_2$, define
  $ U_k \( i \, j \) = h sum_l A_1 \( j \, l \) A_2 \( l \, i \) I_(epsilon_k \, R_k) \( u_i + u_j + u_l \) \,
    wide M \( i \, j \) = max_(1 lt.eq k lt.eq m) \| U_k \( i \, j \) \| . $
  At each output pair choose the least index attaining this maximum, and write $U \( i \, j \)$ for its output.
    These choices provide admissible $epsilon_(i j) \, rho_(i j)$ in Proposition 14.
    They are fixed while the testing array $A_0$ varies.
  Set $H = sum_(i \, j) h^2 M \( i \, j \)^(3 \/ 2)$. If $H = 0$ the desired bound is immediate. Otherwise choose
  $ A_0 \( i \, j \) =
    cases(delim: "{", H^(- 1 \/ 3) M \( i \, j \)^(1 \/ 2) thin overline(U \( i \, j \)) \/ \| U \( i \,
    j \) \| \, & U \( i \, j \) eq.not 0 \,, 0 \, & U \( i \, j \) = 0 .) $
  Then $sum h^2 \| A_0 \|^3 = 1$ and $h^2 sum A_0 U = H^(2 \/ 3)$. Proposition 14 therefore gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ (sum_(i \, j) h^2 M \( i \, j \)^(3 \/ 2))^(2 \/ 3) lt.eq
     C product_(v = 1)^2 (sum_(i \, j) h^2 \| A_v \( i \, j \) \|^3)^(1 \/ 3) . $ <eq:discrete-finite-maximum>]
  This estimate has no dependence on the number of endpoint pairs.
    The complex phase of $A_0$ accounts for the absolute value at each output.
  To pass to functions, define the compactly supported smooth inputs
  $ G_1 \( b \, c \) = F \( b + c \, - b \) \, wide G_2 \( c \, a \) = G \( - a \, c + a \) . $
  Both pair maps have determinant one, so $parallel G_1 parallel_3 =
    parallel F parallel_3$ and $parallel G_2 parallel_3 = parallel G parallel_3$.
    Choose $B > 0$ so that both supports lie in the interior of $\[ - B \, B \]^2$.
    Take $h = B \/ N$, $- N lt.eq i \, j \, l lt.eq N$, and sample
  $ A_1 \( j \, l \) = G_1 \( j h \, l h \) \, wide A_2 \( l \, i \) = G_2 \( l h \, i h \) . $
  The corresponding continuum outputs are
  $ cal(U)_k \( a \, b \) = integral_(bb(R)) G_1 \( b \, c \) G_2 \( c \, a \)
    I_(epsilon_k \, R_k) \( a + b + c \) thin #h(-0.16667em) upright(d) c . $
  They vanish outside $\[ - B \, B \]^2$: $G_2 \( c \, a \)$ restricts $a$ and $G_1 \( b \, c \)$ restricts $b$.
    A nonzero integrand also has $c in \[ - B \, B \]$. For our fixed finite endpoint family the integrands and
    their $c$ derivatives are uniformly bounded on this compact cube.
    Riemann sums in $c$ consequently converge uniformly for $\( a \, b \) in \[ - B \, B \]^2$ and $1 lt.eq
    k lt.eq m$. In particular,
  $ max_(i \, j) max_(1 lt.eq k lt.eq m) \| U_k \( i \, j \) - cal(U)_k \( i h \, j h \) \| arrow.r 0 . $
  The finite maximum of magnitudes preserves this uniform convergence.
    Since $max_k \| cal(U)_k \|$ is continuous and compactly supported,
    the two-dimensional Riemann sums on the left of (6.4) converge to its $L^(3 \/ 2)$ norm.
    The cube roots of the input sums converge to $parallel G_1 parallel_3$ and $parallel G_2 parallel_3$.
    The condition on $h$ holds for all sufficiently large $N$. We obtain
  $ parallel max_k \| cal(U)_k \| parallel_(3 \/ 2) lt.eq C parallel G_1 parallel_3 parallel G_2 parallel_3 . $
  No convergence or regularity of the maximizing indices is needed: we passed to the limit in the finite maximum itself.
  With $x = - a$, $y = - b$, and $t = a + b + c$, the last integral is
    $B_(epsilon_k \, R_k)^I \( F \, G \) \( x \, y \)$. The output coordinate change preserves Lebesgue measure,
    giving the asserted estimate for every finite endpoint family.
  Finally enumerate all rational pairs $0 < epsilon < R$ and take increasing finite subfamilies.
    At each spatial point the output is continuous in the two positive endpoints,
    by its defining integrals on compact scale and spatial intervals.
    Thus the supremum over these rational pairs equals the supremum over all real pairs.
    It is measurable as a countable supremum of continuous spatial functions.
    Monotone convergence of the $3 \/ 2$ powers of the finite maxima proves the result. ◻
]

=== 6.3 A pointwise comparison with hard truncations <a-pointwise-comparison-with-hard-truncations>

The smooth maximal estimate will imply the hard one because each endpoint error has a common pointwise majorant.
  A uniform bound on its kernel’s $L^1$ norm alone would not provide this comparison.

#thm([Lemma 6.3.])[
  #emph[There are an absolute constant $C$ and functions $E_r$, $r > 0$, such that, for $t eq.not 0$,
    apart from endpoint values,
#[#set math.equation(numbering: n => "(6.5)")
 $ I_(epsilon \, R) \( t \) = c_0 / t upright(bold(1))_({ epsilon < \| t \| < R }) + E_epsilon \( t \) -
   E_R \( t \) \, wide c_0 = - frac(2, 3 sqrt(6 pi)) \, $ <eq:maximal-hard-decomposition>]

 and
#[#set math.equation(numbering: n => "(6.6)")
 $ \| E_r \( t \) \| lt.eq C / r (1 + frac(\| t \|, r))^(- 2) wide \( t eq.not 0 \) . $ <eq:maximal-error-envelope>]

]
] <lem:maximal-hard-kernel>

#proof[
  Since $k_1 = - g'_1$ and Gaussian variances add under convolution,
  $ psi \( t \) = - g'''_3 \( t \) = (t^3 / 27 - t / 3) g_3 \( t \) . $
  The convolution identity follows by completing the square;
    differentiation under convolution is justified by Schwartz decay. For $v gt.eq 0$, put
  $ P \( v \) = 2 integral_0^v psi \( z \) thin #h(-0.16667em) upright(d) z = 2 g''_3 \( 0 \) - 2 g''_3 \( v \) \,
    wide c_0 = P \( oo \) = 2 g''_3 \( 0 \) = - frac(2, 3 sqrt(6 pi)) . $
  The substitution $z = t \/ sqrt(s)$ for $t > 0$, followed by oddness for $t < 0$, yields
  $ I_(epsilon \, R) \( t \) = frac(P \( \| t \| \/ epsilon \) - P \( \| t \| \/ R \), t) . $
  Define $Q \( v \) = P \( v \) - c_0 upright(bold(1))_({ v > 1 })$ for $v gt.eq 0$.
    Smooth oddness of $psi$ gives $P \( v \) = O \( v^2 \)$ at zero. For $v > 1$,
  $ Q \( v \) = - 2 g''_3 \( v \) = - 2 (v^2 / 9 - 1 / 3) g_3 \( v \) . $
  Thus $Q$ has Gaussian decay at infinity and bounded one-sided values at its sole jump, $v = 1$.
    Enlarging an absolute constant on a compact interval, we have
  $ frac(\| Q \( v \) \|, v) lt.eq C \( 1 + v \)^(- 2) wide \( v > 0 \) . $
  Set $E_r \( t \) = Q \( \| t \| \/ r \) \/ t$ for $t eq.not 0$ and set $E_r \( 0 \) = 0$.
    Substituting the definition of $Q$ proves (6.5) and (6.6).
    Values at the four hard endpoints have no effect on any integral. ◻
]

Let $M_x$ and $M_y$ denote the continuous centered interval maximal operators in the first and second variables,
  respectively. The next estimate follows from their one-dimensional bounds in Lemma 11.

#thm([Lemma 6.4.])[
  #emph[For complex $F \, G in C_c^oo \( bb(R)^2 \)$ and every $r > 0$,
$ lr(|integral_(bb(R)) F \( x + t \, y \) G \( x \, y + t \) E_r \( t \) thin #h(-0.16667em) upright(d) t|) lt.eq
  C #scale(x: 120%, y: 120%)[\[] M_x \( \| F \|^2 \) \( x \, y \) M_y \( \| G \|^2 \) \( x \, y \)
  #scale(x: 120%, y: 120%)[\]]^(1 \/ 2) . $

 The right side has $L^(3 \/ 2) \( bb(R)^2 \)$ norm at most $C parallel F parallel_3 parallel G parallel_3$.]
] <lem:pointwise-endpoint-error>

#proof[
  Put $q_r \( t \) = r^(- 1) \( 1 + \| t \| \/ r \)^(- 2)$.
    For nonnegative locally integrable $f$ on $bb(R)$, the part of $integral q_r \( t \) f \( x + t \) thin
    #h(-0.16667em) upright(d) t$ with $\| t \| lt.eq r$ is at most $2 M_(bb(R)) f \( x \)$.
    On the shell $2^k r < \| t \| lt.eq 2^(k + 1) r$, $k gt.eq 0$, its contribution is at most
  $ r^(- 1) 2^(- 2 k) integral_(\| t \| lt.eq 2^(k + 1) r) f \( x + t \) thin #h(-0.16667em) upright(d) t lt.eq
    4 thin 2^(- k) M_(bb(R)) f \( x \) . $
  Summing the geometric series proves a bound independent of $r$. By (6.6) and weighted Cauchy–Schwarz,
  $ lr(|integral F \( x + t \, y \) G \( x \, y + t \) E_r \( t \) thin #h(-0.16667em) upright(d) t|) & lt.eq
    C (integral \| F \( x + t \, y \) \|^2 q_r \( t \) thin #h(-0.16667em) upright(d) t)^(1 \/ 2)\
 & #h(12mm)  dot.op (integral \| G \( x \, y + t \) \|^2 q_r \( t \) thin #h(-0.16667em) upright(d) t)^(1 \/ 2) . $
  Apply the preceding one-dimensional bound on the respective coordinate lines. This gives the pointwise assertion.
  Hölder’s inequality and Lemma 11, applied on slices and then integrated in the other coordinate, give
  $ parallel \[ M_x \( \| F \|^2 \) M_y \( \| G \|^2 \) \]^(1 \/ 2) parallel_(3 \/ 2) & lt.eq
    parallel M_x \( \| F \|^2 \) parallel_(3 \/ 2)^(1 \/ 2) parallel M_y \( \| G \|^2 \) parallel_(3 \/ 2)^(1 \/ 2)\
 & lt.eq C parallel \| F \|^2 parallel_(3 \/ 2)^(1 \/ 2) parallel \| G \|^2 parallel_(3 \/ 2)^(1 \/ 2) =
   C parallel F parallel_3 parallel G parallel_3 . $
  ◻
]

#thm([Proposition 6.5.])[
  (Compact smooth inputs).  #emph[For all complex $F \, G in C_c^oo \( bb(R)^2 \)$,
$ parallel B_(*) \( F \, G \) parallel_(L^(3 \/ 2) \( bb(R)^2 \)) lt.eq
  C parallel F parallel_(L^3 \( bb(R)^2 \)) parallel G parallel_(L^3 \( bb(R)^2 \)) \, $

 with an absolute constant. The supremum defining $B_(*)$ is over both finite hard truncation endpoints,
   inside the spatial norm.]
] <prop:compact-maximal>

#proof[
  Lemma 16 and Lemma 17 give, at each spatial point,
  $ \| c_0 \| sup_(0 < epsilon < R) \| B_(epsilon \, R) \( F \, G \) \| lt.eq
    sup_(0 < epsilon < R) \| B_(epsilon \, R)^I \( F \, G \) \| +
    2 C \[ M_x \( \| F \|^2 \) M_y \( \| G \|^2 \) \]^(1 \/ 2) . $
  Both endpoint errors have the same majorant, independently of their radii.
    The hard outputs are continuous in both positive endpoints,
    so their supremum also equals the measurable supremum over rational pairs.
    Take $L^(3 \/ 2)$ norms, apply Proposition 15 and Lemma 17, and divide by $\| c_0 \| > 0$. ◻
]

== 7 General inputs and principal values <sec:consequences>

We now pass the hard maximal estimate from compactly supported smooth inputs to all complex $L^3$ inputs.
  The main point is to control all truncations on one set of full measure.
  We then prove joint principal-value convergence and recover the scalar simplex formulation.

Write $p = 3 \/ 2$ and

$ B_(epsilon \, R) \( F \, G \) \( x \, y \) = integral_(epsilon < \| t \| < R) F \( x + t \, y \)
  G \( x \, y + t \) thin frac(#h(-0.16667em) upright(d) t, t) . $

Proposition 18 supplies the hard maximal estimate for compactly supported smooth inputs; denote its constant by $C_M$.

#thm([Lemma 7.1.])[
  (Finite truncations).  #emph[For complex $F \, G in L^3 \( bb(R)^2 \)$,
    there is a set of full measure on which every finite truncation is absolutely convergent and depends
    continuously on $\( epsilon \, R \)$ in $0 < epsilon < R < oo$.
    The resulting family is independent of the representatives of $F \, G$ up to a common null set. Moreover,
#[#set math.equation(numbering: n => "(7.1)")
 $ ∥integral_(epsilon < \| t \| < R) \| F \( x + t \, y \) G \( x \, y + t \) \| thin frac(#h(-0.16667em)
   upright(d) t, \| t \|)∥_p lt.eq 2 log \( R \/ epsilon \) parallel F parallel_3 parallel G parallel_3 .
   $ <eq:elementary-bilinear>]

]
] <lem:finite-truncations>

#proof[
  For each fixed $t$, Hölder’s inequality and translation invariance give $parallel F \( dot.op + t \, dot.op \)
    G \( dot.op \, dot.op + t \) parallel_p lt.eq parallel F parallel_3 parallel G parallel_3$.
    Minkowski’s integral inequality proves (7.1). Apply it to the countable annuli $1 \/ n < \| t \| < n$,
    $n gt.eq 2$. Outside their combined exceptional null set,
    the integrand is absolutely integrable on every compact annulus away from zero.
    Absolute continuity of its integral gives the asserted endpoint continuity.
    If either input changes on a null set, apply the same bound to the zero $L^3$ difference,
    and use the same countable annuli. This proves independence simultaneously at every endpoint pair. ◻
]

Define $B_(*) \( F \, G \)$ on this full-measure set as the supremum of $\|
  B_(epsilon \, R) \( F \, G \) \|$ over all finite endpoint pairs, and set it to zero elsewhere.
  Endpoint continuity makes this supremum equal to the one over positive rational endpoint pairs, so it is measurable.

#proof[
  Choose compactly supported smooth $f_m arrow.r F$ and $g_m arrow.r G$ in $L^3$.
    For a fixed endpoint pair, bilinearity and (7.1) show that $B_(epsilon \, R) \( f_m \, g_m \) arrow.r
    B_(epsilon \, R) \( F \, G \)$ in $L^p$. Fix a finite family of rational endpoint pairs.
    The difference of the two finite maxima of magnitudes is bounded by the sum of the corresponding truncation
    differences. Thus these maxima also converge in $L^p$. Passing the compact smooth maximal estimate to the
    limit bounds this finite maximum by $C_M parallel F parallel_3 parallel G parallel_3$.
    The constant is independent of the family. Exhaust all rational endpoint pairs and use monotone convergence
    and Lemma 19 to obtain Theorem 1.
  We also obtain a useful continuity statement. For two pairs of inputs, bilinearity of every truncation gives,
    almost everywhere,
  #[#set math.equation(numbering: n => "(7.2)")
   $ \| B_(*) \( F \, G \) - B_(*) \( f \, g \) \| lt.eq B_(*) \( F - f \, G \) +
     B_(*) \( f \, G - g \) . $ <eq:maximal-continuity>]
  The bound just established makes the maximal map continuous from $L^3 times L^3$ to $L^(3 \/ 2)$.
    Density shows that it is the unique continuous extension of its compact smooth values. ◻
]

#thm([Theorem 7.2.])[
  (Joint bilinear principal values).  #emph[For all complex $F \, G in L^3 \( bb(R)^2 \)$, the joint limit
$ B \( F \, G \) = lim_(epsilon arrow.b 0\
R arrow.t oo) B_(epsilon \, R) \( F \, G \) $

 exists almost everywhere and in $L^(3 \/ 2) \( bb(R)^2 \)$, with $parallel B \( F \, G \) parallel_(3 \/ 2) lt.eq
   C_M parallel F parallel_3 parallel G parallel_3$. More precisely,
#[#set math.equation(numbering: n => "(7.3)")
 $ ∥sup_(0 < epsilon < 1 \/ n\
R > n) \| B_(epsilon \, R) \( F \, G \) - B \( F \, G \) \|∥_(3 \/ 2) arrow.r 0 . $ <eq:maximal-tail-convergence>]

 The limit is the unique bounded bilinear extension of the principal-value operator on compactly supported smooth
   inputs.]
] <thm:bilinear-pv>

#proof[
  For compactly supported smooth $f \, g$ and a fixed $\( x \, y \)$, the function $h \( t \) =
    f \( x + t \, y \) g \( x \, y + t \)$ is smooth and compactly supported. The truncated integral is
  $ integral_epsilon^R frac(h \( t \) - h \( - t \), t) thin #h(-0.16667em) upright(d) t . $
  Its numerator is $O \( t \)$ at zero and vanishes for large $t$, so it has a joint limit at every point.
  For general inputs, let
  $ Omega_n \( F \, G \) = sup_(0 < epsilon \, epsilon' < 1 \/ n\
R \, R' > n) \| B_(epsilon \, R) \( F \, G \) - B_(epsilon' \, R') \( F \, G \) \| . $
  These are measurable: by endpoint continuity the supremum may be taken over rational parameters.
    They decrease with $n$ and are bounded by $2 B_(*) \( F \, G \)$.
    Fix smooth approximants $f_m \, g_m$ as above. Outside a single null set for this countable collection of
    input pairs,
  $ Omega_n \( F \, G \) lt.eq Omega_n \( f_m \, g_m \) + 2 B_(*) \( F - f_m \, G \) + 2 B_(*) \( f_m \, G - g_m \) . $
  Letting $n arrow.r oo$, the smooth joint convergence and Theorem 1 give
  $ ∥lim_(n arrow.r oo) Omega_n \( F \, G \)∥_p lt.eq 2 C_M #scale(x: 120%, y: 120%)[\(] parallel F -
    f_m parallel_3 parallel G parallel_3 + parallel f_m parallel_3 parallel G -
    g_m parallel_3 #scale(x: 120%, y: 120%)[\)] . $
  The right side tends to zero with $m$. Hence the limiting oscillation is zero almost everywhere.
    This is the Cauchy criterion for all pairs of endpoints in the indicated tails,
    so the joint complex limit exists. It is measurable by taking a fixed cofinal sequence of endpoint pairs,
    and its magnitude is at most $B_(*) \( F \, G \)$.
  Taking $\( epsilon' \, R' \)$ to the limit in the definition of $Omega_n$ bounds the supremum in (7.3) by
    $Omega_n \( F \, G \)$. Dominated convergence applies because $0 lt.eq Omega_n \( F \, G \) lt.eq
    2 B_(*) \( F \, G \) in L^p$. This proves (7.3), and hence joint norm convergence.
    Passing to the norm limit in the bilinear identities for the truncations proves bilinearity of $B$.
    Its bound and uniqueness follow from Theorem 1 and density. ◻
]

=== 7.1 Scalar forms and the simplex coordinates <scalar-forms-and-the-simplex-coordinates>

For complex $F_0 \, F_1 \, F_2 in L^3 \( bb(R)^2 \)$, define the flat scalar form

$ cal(L)_(epsilon \, R) \( F_0 \, F_1 \, F_2 \) = integral.triple_(epsilon < \| t \| < R) F_0 \( x \, y \)
  F_1 \( x + t \, y \) F_2 \( x \, y + t \) thin #h(-0.16667em) upright(d) x thin #h(-0.16667em) upright(d) y thin
  frac(#h(-0.16667em) upright(d) t, t) . $

#thm([Corollary 7.3.])[
  (Flat scalar principal values).  #emph[For complex $F_0 \, F_1 \, F_2 in L^3 \( bb(R)^2 \)$,
    every finite flat truncation is absolutely integrable, and
$ sup_(0 < epsilon < R < oo) \| cal(L)_(epsilon \, R) \( F_0 \, F_1 \, F_2 \) \| lt.eq
  C_M product_(v = 0)^2 parallel F_v parallel_3 . $

 Its joint scalar principal value exists and equals $integral F_0 B \( F_1 \, F_2 \)$.
   This limiting form is the unique bounded trilinear extension of its compact smooth definition.]
] <cor:scalar-pv>

#proof[
  Hölder’s inequality in $\( x \, y \)$ bounds the absolute integral by $2 log \( R \/ epsilon \) product_v
    parallel F_v parallel_3$. Thus Fubini identifies the truncated form with $integral F_0
    B_(epsilon \, R) \( F_1 \, F_2 \)$. Theorem 1 gives its endpoint-uniform bound,
    and Theorem 20 gives joint scalar convergence by pairing the $L^(3 \/ 2)$ limit with $F_0$.
    The limiting form is bounded and complex trilinear. Density of compact smooth triples proves uniqueness. ◻
]

For the simplex form, set

$ Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) = integral.triple_(epsilon < \| a + b + c \| < R) G_0 \( a \, b \)
  G_1 \( b \, c \) G_2 \( c \, a \) thin frac(#h(-0.16667em) upright(d) a thin #h(-0.16667em) upright(d) b thin
  #h(-0.16667em) upright(d) c, a + b + c) . $

The flat and simplex scalar formulations, including equality of their optimal norm constants,
  are already related in #cite(label("KovacThieleZorinKranich2015")) Appendix B.1.
  We record explicit norm-preserving maps and track both finite endpoints and their joint limit.

#thm([Proposition 7.4.])[
  (Scalar equivalence).  #emph[For all complex $G_0 \, G_1 \, G_2 in L^3 \( bb(R)^2 \)$,
    every finite simplex truncation is absolutely integrable, and
$ sup_(0 < epsilon < R < oo) \| Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) \| lt.eq
  C_M product_(v = 0)^2 parallel G_v parallel_3 . $

 Its joint scalar principal value exists for every such triple and is the unique bounded trilinear extension of
   its compact smooth definition. The optimal constants in the uniform flat and simplex scalar estimates are equal.]
] <prop:flat-equivalence>

#proof[
  Use the determinant-one change of variables
  $ x = - a \, wide y = - b \, wide t = a + b + c \, wide a = - x \, quad b = - y \, quad c = t + x + y . $
  For flat inputs define
  $ G_0 \( u \, v \) & = F_0 \( - u \, - v \) \,\
G_1 \( u \, v \) & = F_1 \( u + v \, - u \) \,\
G_2 \( u \, v \) & = F_2 \( - v \, u + v \) . $
  Each pair map has determinant one. Their inverses are
  $ F_0 \( r \, s \) = G_0 \( - r \, - s \) \, quad F_1 \( r \, s \) = G_1 \( - s \, r + s \) \, quad
    F_2 \( r \, s \) = G_2 \( r + s \, - r \) . $
  They preserve $L^3$ norms, compact smoothness, and Schwartz class.
    Direct substitution identifies the flat and simplex integrands and their truncation regions.
    The absolute integrability, uniform bound, and joint scalar convergence therefore follow from the flat
    conclusions. The inverse maps realize every simplex triple,
    which proves equality of the two optimal scalar constants.
    Density gives uniqueness of the bounded trilinear extension. ◻
]

Write $C_S$ for the common optimal scalar constant. Complex $L^p$ duality shows that it is also the optimal
  constant for the uniform family of individual bounds

$ parallel B_(epsilon \, R) \( F \, G \) parallel_(3 \/ 2) lt.eq C_S parallel F parallel_3 parallel G parallel_3 . $

Indeed, for nonzero $U in L^p$, the function

$ H = frac(overline(U), \| U \|) thin frac(\| U \|^(1 \/ 2), parallel U parallel_p^(1 \/ 2)) \, $

set to zero where $U = 0$, has $L^3$ norm one and satisfies $integral H U = parallel U parallel_p$.
  Apply this to each bilinear truncation; the zero case is immediate.
  The pointwise maximal optimal constant is at least $C_S$.

#bibliography("refs.bib", style: "ieee", title: [References])
