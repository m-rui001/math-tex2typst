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

#align(center)[#text(size: 16pt, weight: "bold")[One Rational Matrix Hitting Point \
for Noncommutative Formulas]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Polynomial identity testing asks whether an arithmetic expression computes the zero polynomial.
  We study this question for noncommuting variables when the expression is accessible through matrix evaluations.
  The aim is to choose the evaluation matrices before seeing the expression or any of its coefficients.

Let $F chevron.l x_1 \, dots.h \, x_n chevron.r$ be the free associative polynomial algebra over a field $F$.
  A #emph[noncommutative formula] is a rooted tree whose leaves are variables or scalars in $F$,
  and whose internal gates have two inputs and are labelled $+$ or $times$.
  The two inputs to each multiplication gate are ordered. Its #emph[size] counts all gates, including the leaves.
  Write $sans(F o r m)_(n \, s) \( F \)$ for the polynomials computed by formulas of size at most $s$ in $n$ variables.

For a tuple $upright(bold(T)) = \( T_1 \, dots.h \, T_n \) in "Mat"_d \( F \)^n$,
  the value $f \( upright(bold(T)) \)$ is the usual ordered matrix evaluation; a scalar $a in F$ acts as $a I_d$.
  A #emph[hitting point] for a class of polynomials is one tuple on which every nonzero member of the class has
  nonzero matrix value. More generally, a hitting set allows several tuples and requires a nonzero value on at
  least one of them.

#thm([Theorem 1.1.])[
  #emph[There is a deterministic algorithm which, given integers $n \, s gt.eq 1$, constructs a tuple
$ upright(bold(T))_(n \, s) in "Mat"_d \( bb(Q) \)^n \, wide d lt.eq 2 n s^2 \, $

 in time polynomial in $n \, s$, measured in bit operations.
   The numerators and denominators of its entries have bit length
   $O \( log \( n s + 1 \) + n s^2 log \( n + 1 \) \)$. For every field $F$ of characteristic zero and every $0
   eq.not f in sans(F o r m)_(n \, s) \( F \)$,
$ f \( upright(bold(T))_(n \, s) \) eq.not 0 \, $

 where the tuple is viewed over $F$ through the canonical embedding $bb(Q) arrow.r.hook F$.
   The construction uses $d = 2 n s^2$ when $n s gt.eq 2$ and $d = 1$ when $n = s = 1$.]
] <thm:main>

Thus a single exact matrix-evaluation query decides whether a polynomial promised to lie in
  $sans(F o r m)_(n \, s) \( F \)$ is zero. The bit-time statement concerns construction of the rational tuple.
  Evaluation over an arbitrary field is understood as an exact oracle operation;
  no encoding or bit-cost assumption on arbitrary elements of $F$ is needed.
  In particular, the singleton set ${ upright(bold(T))_(n \, s) }$ gives a positive solution to the
  polynomial-size rational-matrix hitting-set problem for characteristic-zero formulas.

=== 1.1 Context and scope <context-and-scope>

An #emph[acyclic algebraic branching program] is a directed acyclic graph with a designated source and sink,
  and with affine-linear edge labels over the coefficient field.
  Its output is the sum of the ordered products of edge labels along source-to-sink paths;
  here its size is the number of vertices. Formulas admit such path representations of linear size.

Linear algebra has long played a central role in noncommutative complexity.
  Nisan characterized layered homogeneous algebraic branching-program complexity by ranks of coefficient matrices
  #cite(label("Nisan1991")) Theorem 1. Raz and Shpilka gave deterministic polynomial-time identity tests for
  noncommutative formulas and algebraic branching programs #cite(label("RazShpilka2005")) Theorems 4 and 5.
  These algorithms use the internal structure of the input, which is the white-box model.
  In the black-box model, Bogdanov and Wee gave a randomized matrix-evaluation identity test with one-sided error
  and running time polynomial in a supplied degree bound and the other input parameters
  #cite(label("BogdanovWee2005")) Theorem 4.2. Forbes and Shpilka constructed deterministic quasipolynomial-size
  matrix hitting sets for noncommutative algebraic branching programs over sufficiently large fields
  #cite(label("ForbesShpilka2013")) Corollary 4.7, and hence for formulas.
  Their field-size condition is automatic in characteristic zero.

Arvind, Chatterjee and Mukhopadhyay obtained quasipolynomial black-box tests over $bb(Q)$ for rational formulas of
  inversion height two #cite(label("ArvindChatterjeeMukhopadhyay2022")) Theorem 1.1,
  and subsequently for unrestricted noncommutative rational formulas
  #cite(label("ArvindChatterjeeMukhopadhyay2026")) Theorem 2 and Corollary 3.
  Such formulas may have inverse gates, and evaluation requires each inverse operand to be invertible.
  A separate manuscript #cite(label("OpenAIRationalFormulas2026")) Theorem 1.1 constructs polynomial-size rational
  matrix hitting lists for formulas over $bb(Q)$ with a nonempty rational matrix evaluation domain.
  Whenever such a formula is nonzero on its domain, the list contains a defined evaluation with invertible value,
  without a bound on inverse nesting or rational constant heights.
  Here the single tuple works over every characteristic-zero coefficient field for division-free formulas,
  whose matrix evaluations are everywhere defined.

Two recent results treat different size restrictions. Lakhani and Mukhopadhyay construct one integer matrix tuple
  for sparse noncommutative polynomials over every characteristic-zero field,
  with polynomial construction time and dimension equal to the sparsity bound,
  without a degree restriction #cite(label("LakhaniMukhopadhyay2026")) Theorem 2.1 and Remark 2.6.
  Formula size can be much smaller than sparsity: the ordered product of $k$ copies of $x_1 + x_2$ has $4 k -
  1$ gates and $2^k$ monomials. Lakhani and Saxena obtain randomized black-box tests for homogeneous
  noncommutative circuits of constant depth #cite(label("LakhaniSaxena2026")) Theorem 1.
  Theorem 1 is deterministic and imposes no depth or homogeneity restriction on a formula.

The essential quantitative assertion is that matrix dimension, rational entry length,
  and construction bit time are all polynomial in formula size and the number of variables.
  For polynomials, a finite matrix hitting set can always be combined into one tuple by taking block-diagonal
  sums, but the resulting dimension is the sum of the dimensions in the set.
  The construction here gives the polynomial bounds directly.
  The formula model is used to obtain a small acyclic path representation.
  In fact, Proposition 7 applies the same construction to the algebraic branching programs defined above,
  with matrix dimension $\( n - 1 \) binom(m, 2) + m$ for $m$ vertices.
  Thus the path-program consequence also improves the preceding quasipolynomial hitting-set bound in
  characteristic zero. No bound for arbitrary shared circuits is asserted.

=== 1.2 Proof idea <proof-idea>

The obstacle is that a small formula may contain exponentially many words after expansion.
  We retain these words through a faithful encoding, and bound the necessary truncation using a small
  representation of the formula. We encode words by iterated integrals in one variable.
  For a word $w = i_1 dots.h.c i_k$ on ${ 1 \, dots.h \, n }$, write $x_w = x_(i_1) dots.h.c x_(i_k)$,
  with $x_epsilon.alt = 1$ for the empty word. Define

$ h_epsilon.alt \( z \) = 1 \, wide h_(i w) \( z \) = integral_0^z frac(h_w \( t \), t + i) thin d t \, $

where $epsilon.alt$ is the empty word and integration is interpreted by formal power series at zero.
  Section 2 proves that the $h_w$ are linearly independent over every characteristic-zero field.
  Over $bb(C)$, continuation around the distinct poles yields a triangular spanning argument in a truncated free
  algebra. A nonzero rational coefficient minor then transfers independence to every field in the theorem.
  These functions belong to the classical theory of iterated integrals and hyperlogarithms
  #cite(label("Chen1977")). Their independence is a special case of the stronger differential-field theorem of
  Deneufchâtel, Duchamp, Hoang Ngoc Minh and Solomon #cite(label("DeneufchatelEtAl2011")) Theorem 1;
  we include a direct proof for the particular kernels used here.
  Its triangular monodromy argument has a two-letter antecedent in Minh,
  Petitot and van der Hoeven #cite(label("MinhPetitotVanderHoeven1998")) Section 5, Theorem 4.

If $f_w$ denotes the coefficient of $x_w$ in $f$, put $h_f = sum_w f_w h_w$.
  Section 3 converts a size-$s$ formula into an acyclic path representation with at most $2 s$ states,
  using the standard formula-to-path construction of Nisan #cite(label("Nisan1991")) Section 2, Lemma 1,
  also presented by Raz and Shpilka #cite(label("RazShpilka2005")) Section 2.1, Lemma 2, Step 1.
  It follows that $h_f = u G v$ for constant vectors $u \, v$ and an invertible formal matrix $G$ satisfying

$ G' = (sum_(i = 1)^n frac(B_i, z + i)) G . $

The matrices $B_i$ describe the formula and are used only in the proof.

The quantitative step is a uniform bound on vanishing at zero.
  Moura’s multiplicity estimate for rational differential systems #cite(label("Moura2003")),
  also stated in #cite(label("MouraHyperelliptic2003")) Section 2, Theorem 1,
  bounds the order of a nonzero scalar component $u G v$ of an $m$-dimensional system $G' = \( P \/ q \) G$,
  with $q \( 0 \) eq.not 0$, $deg q = n$ and $deg P lt.eq n - 1$, by $\( n - 1 \) binom(m, 2) + m - 1$.
  Section 4 gives a self-contained formal proof of this estimate over the characteristic-zero field in use.
  It uses the formal Wronskian criterion #cite(label("BostanDumas2010")) and the minimum order of the maximal
  minors of a matrix of derivative rows. This bound is independent of all coefficient values and applies beyond
  the particular systems arising from formulas.

Finally, Section 5 realizes the integration operators on the space of Taylor coefficients of degrees below $2 n
  s^2$. Their matrices have explicit rational entries. Linear independence makes $h_f$ nonzero,
  and the order bound ensures that this finite truncation retains a nonzero coefficient.
  That coefficient occurs in the first column of $f \( upright(bold(T))_(n \, s) \)$.

For $n s gt.eq 2$, write $pi_d \( a \)$ for the column of the first $d =
  2 n s^2$ Taylor coefficients of a series $a$, and put $e_0 = pi_d \( 1 \)$.
  Figure 1 summarizes the argument for a nonzero formula polynomial $f$,
  separating the generator from the formula-dependent objects used to prove its guarantee.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.55), [#text(size: 9pt)[$n,s$]])
  content((10.8, 1.55), [#text(size: 9pt)[$bold(T)_(n,s) in "Mat"_d( bb(Q) )^n$]])
  line((0.3628, 1.55), (9.802, 1.55), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.4, 1.55), [#text(size: 9pt)[explicit rational entries; $d lt.eq 2"ns"^2$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$f$]])
  content((3.2, 0), [#text(size: 9pt)[$(u,B_1, dots.h ,B_n,v)$]])
  content((7.05, 0), [#text(size: 9pt)[$h_f="uGv" != 0$]])
  content((10.8, 0), [#text(size: 9pt)[$f( bold(T)_(n,s))e_0 != 0$]])
  line((0.204, 0), (1.996, 0), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.6, 0), [#text(size: 9pt)[paths]], anchor: "south", padding: 0.1176cm)
  line((4.404, 0), (6.267, 0), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.125, 0), [#text(size: 9pt)[word integrals]], anchor: "south", padding: 0.1176cm)
  line((7.833, 0), (9.747, 0), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((8.925, 0), [#text(size: 9pt)[$pi_d$]], anchor: "south", padding: 0.1176cm)
  line((10.8, 1.267), (10.8, 0.2834), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.4, -0.65), [#text(size: 8pt)[The lower row is used only to prove the hitting property.]])
})],
  caption: [Figure 1: The construction for $n s gt.eq 2$. The generator uses only the size bounds. The correctness argument associates a differential system to each possible input formula. Independence makes its scalar output nonzero, and the multiplicity bound ensures that the retained Taylor coefficients include a nonzero entry. ],
) <fig:proof-route>

== 2 A faithful encoding by iterated integrals <sec:iterated-integrals>

We first encode noncommutative polynomials as power series in one variable.
  The encoding will preserve every nonzero polynomial; the remaining sections will bound how many Taylor
  coefficients are needed for a small formula.

Fix an integer $n gt.eq 1$ and a field $F$ of characteristic zero.
  For $i in \[ n \] = { 1 \, dots.h \, n }$, define an $F$-linear operator on $F \[ \[ z \] \]$ by

#[#set math.equation(numbering: n => "(1)")
 $ cal(J)_i \( a \) \( z \) = integral_0^z frac(a \( t \), t + i) thin d t . $ <eq:integration-operator>]

Here integration means termwise formal integration with zero constant term:
  expand $\( t + i \)^(- 1) = sum_(j gt.eq 0) \( - 1 \)^j t^j \/ i^(j + 1)$ first.
  All denominators are nonzero in $F$. For a nonzero series $a$,
  let $"ord"_0 a$ denote the least exponent with nonzero coefficient, and put $"ord"_0 0 = oo$. Then

#[#set math.equation(numbering: n => "(2)")
 $ "ord"_0 cal(J)_i \( a \) gt.eq "ord"_0 a + 1 . $ <eq:integration-order>]

A word $w = i_1 dots.h.c i_b$ on $\[ n \]$ has length $\| w \| = b$; the empty word is denoted by $epsilon.alt$.
  Define the series $h_w in bb(Q) \[ \[ z \] \]$ recursively by

#[#set math.equation(numbering: n => "(3)")
 $ h_epsilon.alt = 1 \, wide h_(i w) = cal(J)_i \( h_w \) . $ <eq:word-series>]

We regard these series as elements of $F \[ \[ z \] \]$ through the canonical embedding $bb(Q) arrow.r.hook F$.
  In particular, $"ord"_0 h_w gt.eq \| w \|$. Over $bb(C)$, they are holomorphic germs at zero:
  the same recursion uses ordinary integration on any disk of radius less than one.
  These functions are classical iterated integrals, also called hyperlogarithms;
  see Chen #cite(label("Chen1977")) for the general framework.
  The following independence statement is a special case of Deneufchâtel et
  al. #cite(label("DeneufchatelEtAl2011")) Theorem 1. Their criterion in fact gives independence over $F \( z \)$:
  no nonzero $F$-linear combination of $1 \/ \( z + 1 \) \, dots.h \,
  1 \/ \( z + n \)$ is the derivative of a rational function,
  because such a derivative has zero residue at every pole.
  We give a direct proof of the constant-coefficient independence needed here.
  We use a triangular monodromy argument, as in the two-letter case treated by Minh,
  Petitot and van der Hoeven #cite(label("MinhPetitotVanderHoeven1998")) Section 5, Theorem 4.

#thm([Lemma 2.1.])[
  (Linear independence of the word series).  #emph[For every integer $n gt.eq 1$, every integer $D gt.eq 0$,
    and every characteristic-zero field $F$, the series
$ { h_w : w upright(" is a word on ") \[ n \] \, med \| w \| lt.eq D } $

 are linearly independent over $F$.]
] <lem:word-independence>

#proof[
  The case $D = 0$ consists of the single series $1$. Suppose $D gt.eq 1$, and first work over $bb(C)$.
    Let $E_D$ be the complex algebra with basis $X_w$, $\| w \| lt.eq D$,
    whose multiplication is concatenation of words, with products of length greater than $D$ set equal to zero.
    Its identity is $X_epsilon.alt = 1$. The span $frak(m)$ of the nonempty words is an ideal satisfying
    $frak(m)^(D + 1) = 0$. For one-letter words write $X_i = X_(\( i \))$, and set
  $ U \( z \) = sum_(\| w \| lt.eq D) h_w \( z \) X_w . $
  The recursion (3) gives the left differential equation
  #[#set math.equation(numbering: n => "(4)")
   $ U' \( z \) = (sum_(i = 1)^n frac(X_i, z + i)) U \( z \) \, wide U \( 0 \) = 1 . $ <eq:word-differential-equation>]
  This is a linear equation on the finite-dimensional vector space $E_D$,
    with coefficients holomorphic on $Omega = bb(C) \\ { - 1 \, dots.h \, - n }$.
    For this particular equation, local existence and uniqueness follow directly by induction on word length:
    the derivative of a length-$b$ coefficient is determined by length-$\( b - 1 \)$ coefficients.
    On a disk avoiding the poles, taking holomorphic primitives with prescribed initial values therefore
    constructs the solution in $D$ steps. A finite chain of overlapping disks continues it along any path in
    $Omega$, and uniqueness makes the solutions agree on overlaps.
  For a loop $gamma$ in $Omega$ based at zero, let $Q_gamma$ be the value at zero after continuation around
    $gamma$. It belongs to $1 + frak(m)$, since the constant coefficient of the solution remains one.
    Suppose that $sum_(\| w \| lt.eq D) c_w h_w = 0$ as a complex germ,
    and define a complex-linear functional $lambda : E_D arrow.r bb(C)$ by $lambda \( X_w \) = c_w$.
    The germ $lambda \( U \)$ is zero, and its continuation around every loop is zero;
    hence $lambda \( Q_gamma \) = 0$ for every $gamma$. It therefore suffices to prove that the loop values span $E_D$.
  The order of multiplication matters here. Along a fixed path,
    a solution with initial value $b in E_D$ equals the solution with initial value one multiplied by $b$ on the
    right. Thus traversing $gamma$ and then $delta$ gives $Q_delta Q_gamma$.
    In particular, the set of loop values contains $1$, and every ordered product of loop values is again a loop value.
  Choose a based loop $gamma_i$ with winding number one about $- i$ and zero about every other pole,
    and put $Q_i = Q_(gamma_i)$. One may take an access path from zero, a small positive circle about $- i$,
    and the reversed access path. For the degree-one integrals the two access paths cancel.
    Direct integration on the circle gives $2 pi sqrt(- 1)$ for $d z \/ \( z + i \)$ and zero for $d
    z \/ \( z + j \)$ when $j eq.not i$; the latter also follows by integrating its convergent Taylor expansion on
    the disk bounded by the circle. Reducing (4) modulo $frak(m)^2$ and integrating around this loop yields
  $ Q_i = 1 + tau X_i med \( mod med frak(m)^2 \) \, wide tau = 2 pi sqrt(- 1) . $
  For $w = i_1 dots.h.c i_b$, define
  $ C_w = \( Q_(i_1) - 1 \) dots.h.c \( Q_(i_b) - 1 \) \, wide C_epsilon.alt = 1 . $
  Expanding the product shows that $C_w$ lies in the complex linear span of the loop values.
    It has no terms of word length less than $b$, and its length-$b$ part is $tau^b X_w$.
    Consequently the family ${ C_w : \| w \| lt.eq D }$ is a basis of $E_D$:
    in a word basis ordered by length, its coefficient matrix is triangular with nonzero diagonal entries
    $tau^(\| w \|)$. The loop values therefore span $E_D$, so $lambda = 0$. This proves complex linear independence.
  To pass to $F$, form the matrix whose columns are the Taylor coefficients of the finitely many series $h_w$,
    $\| w \| lt.eq D$. Every entry is rational. The kernels over $bb(C)$ of its successive finite row prefixes
    form a descending sequence of subspaces of a fixed finite-dimensional space.
    Their intersection is zero by the complex independence just proved,
    so some finite prefix has full column rank. It therefore contains a square minor with nonzero rational
    determinant. That determinant stays nonzero under $bb(Q) arrow.r.hook F$,
    which rules out every $F$-linear relation among the series.
    This minor is used only to prove independence; the construction of the hitting point does not compute it. ◻
]

For $w = i_1 dots.h.c i_b$, write $x_w = x_(i_1) dots.h.c x_(i_b)$ and $x_epsilon.alt = 1$.
  Given $f = sum_w f_w x_w in F chevron.l x_1 \, dots.h \, x_n chevron.r$, define

#[#set math.equation(numbering: n => "(5)")
 $ h_f = sum_w f_w h_w . $ <eq:polynomial-series>]

Lemma 2 says that the $F$-linear map $f mapsto h_f$ is injective.
  It is not an algebra homomorphism into $F \[ \[ z \] \]$.
  Instead, the ordered word $x_(i_1) dots.h.c x_(i_b)$ acts by the composition $cal(J)_(i_1) dots.h.c
  cal(J)_(i_b)$, applied to $1$:

#[#set math.equation(numbering: n => "(6)")
 $ h_f = f \( cal(J)_1 \, dots.h \, cal(J)_n \) 1 . $ <eq:operator-evaluation>]

For example, when $n gt.eq 2$, the commutator $x_1 x_2 - x_2 x_1$ gives

$ h_12 \( z \) - h_21 \( z \) = - z^3 / 24 + O \( z^4 \) . $

Thus the encoding retains word order, but cancellation can delay the first nonzero coefficient beyond the word
  length. We next use formula size to bound this delay uniformly.

== 3 From formulas to differential systems <sec:formula-systems>

The word functions from Section 2 turn a nonzero polynomial $f = sum_w f_w x_w$ into the nonzero series $h_f =
  sum_w f_w h_w$. We now express this series as a scalar output of a differential system whose dimension is at
  most twice the formula size. This small system will control how late the first nonzero coefficient of $h_f$ can
  occur. The underlying formula-to-path construction is due to Nisan #cite(label("Nisan1991")) Section 2, Lemma 1;
  see also Raz and Shpilka #cite(label("RazShpilka2005")) Section 2.1, Lemma 2, Step 1.

#thm([Lemma 3.1.])[
  (Acyclic coefficient representation).  #emph[Let $F$ be a field, and let $f in F chevron.l x_1 \, dots.h \,
    x_n chevron.r$ be computed by a fan-in-two formula with at most $s$ gates, counting leaves.
    There are an integer $m lt.eq 2 s$, a row $u in F^(1 times m)$, a column $v in F^(m times 1)$,
    and strictly upper triangular matrices $B_1 \, dots.h \, B_n in F^(m times m)$ such that
#[#set math.equation(numbering: n => "(7)")
 $ f_w = u B_w v quad upright("for every word ") w \, wide B_(i_1 dots.h.c i_k) = B_(i_1) dots.h.c B_(i_k) \, quad
   B_epsilon.alt = I_m . $ <eq:formula-representation>]

 In particular, $B_w = 0$ whenever $\| w \| gt.eq m$.]
] <lem:formula-representation>

#proof[
  Construct a directed acyclic graph for each subformula, with a designated source having no incoming edges and a
    designated sink having no outgoing edges. Each edge is labeled either by a variable or by a scalar in $F$.
    The label of a path is the ordered product of its edge labels.
  A leaf gives two vertices joined by one edge with the leaf’s label.
    For a sum, take disjoint copies of the two child graphs, add a new source and sink,
    and join the new source to both child sources and both child sinks to the new sink by edges labeled $1$.
    For an ordered product, take disjoint child graphs and join the first child’s sink to the second child’s
    source by an edge labeled $1$; retain the first source and the second sink.
    These operations preserve acyclicity and the stated source and sink properties.
    A path through a sum chooses one child, whereas a path through a product traverses the first child and then
    the second. Induction therefore shows that the sum of source-to-sink path labels is $f$.
  If the formula has $L$ leaves and $a$ addition gates, the graph has $m = 2 L + 2 a lt.eq 2 s$ vertices:
    multiplication adds no vertex. Order the vertices topologically.
    Let $E$ be the adjacency matrix of the scalar edges, with their scalar weights,
    and let $N_i$ be the adjacency matrix of the edges labeled $x_i$, with weight $1$.
    In each adjacency matrix, row $a$ and column $b$ record edges from $a$ to $b$;
    parallel-edge weights are summed. All these matrices are strictly upper triangular. The matrix
  $ Q = \( I_m - E \)^(- 1) = I_m + E + dots.h.c + E^(m - 1) $
  records all paths consisting only of scalar edges, including the empty path at each vertex.
    Write $e_j$ for the $j$th standard column vector. If $sigma$ and $rho$ are the source and sink,
    every path with variable word $i_1 dots.h.c i_k$ decomposes uniquely into scalar subpaths separated by those
    $k$ variable edges. Consequently
  $ f_(i_1 dots.h.c i_k) = e_sigma^(sans(T)) Q N_(i_1) Q dots.h.c N_(i_k) Q e_rho \, wide f_epsilon.alt =
    e_sigma^(sans(T)) Q e_rho . $
  Set
  $ u = e_sigma^(sans(T)) Q \, wide v = e_rho \, wide B_i = N_i Q . $
  Then (7) follows. Multiplying a strictly upper triangular matrix by an upper triangular matrix preserves strict
    upper triangularity, so each $B_i$ has that property. A product of $m$ strictly upper triangular $m times
    m$ matrices is zero, proving the last assertion. ◻
]

This construction allows arbitrary scalar leaves and constant terms. Its size bound uses the formula tree:
  the child graphs represent disjoint subtrees, so each gate is counted once.
  The construction does not enumerate the monomials of $f$.

#thm([Proposition 3.2.])[
  (The system associated to a formula).  #emph[Let $F$ have characteristic zero,
    and let $0 eq.not f in F chevron.l x_1 \, dots.h \, x_n chevron.r$ have a formula of size at most $s$.
    There are $m lt.eq 2 s$, a nonzero constant row $u$, a constant column $v$,
    and an invertible matrix $G in F \[ \[ z \] \]^(m times m)$ such that
#[#set math.equation(numbering: n => "(8)")
 $ G' = A G \, wide G \( 0 \) = I_m \, wide A \( z \) = frac(P \( z \), q \( z \)) \, wide q \( z \) =
   product_(i = 1)^n \( z + i \) \, quad deg P lt.eq n - 1 \, $ <eq:formula-system>]

 where $P$ is a polynomial matrix. Moreover,
#[#set math.equation(numbering: n => "(9)")
 $ h_f \( z \) = sum_w f_w h_w \( z \) = u G \( z \) v eq.not 0 . $ <eq:formula-output>]

]
] <prop:formula-system>

#proof[
  Take the representation from Lemma 3 and define the finite sum
  $ G \( z \) = sum_(\| w \| < m) B_w h_w \( z \) \, wide A \( z \) = sum_(i = 1)^n frac(B_i, z + i) . $
  The empty word contributes $I_m$, and every other $h_w$ has zero constant term.
    Thus $G \( 0 \) = I_m$, which makes $G$ invertible over $F \[ \[ z \] \]$.
    The identity $h'_(i w) = h_w \/ \( z + i \)$ gives
  $ G' = sum_(i = 1)^n sum_(\| w \| < m - 1) frac(B_i B_w h_w, z + i) = A G . $
  The terms with $\| w \| = m - 1$ added in the last equality vanish because $B_i B_w = 0$.
    In particular the system acts on the #emph[left], in the same order as the letters of a word.
  The denominator in (8) is nonzero at zero: $q \( 0 \) = n ! eq.not 0$. Its numerator is
  $ P \( z \) = sum_(i = 1)^n B_i product_(j eq.not i) \( z + j \) \, $
  whose entries have degree at most $n - 1$. Finally, (7) gives $u G v = h_f$.
    This series is nonzero by Lemma 2, since $f eq.not 0$; in particular $u eq.not 0$. ◻
]

We have obtained a nonzero series $h_f$ inside a system of dimension at most $2 s$,
  with a denominator of degree $n$ and a regular expansion point at zero.
  The next section bounds its vanishing order using only these parameters,
  uniformly in all scalar coefficients of the formula.

== 4 A bound on the order of vanishing <sec:multiplicity>

The preceding representation turns a formula into a scalar component of a rational differential system.
  A multiplicity estimate of Moura #cite(label("Moura2003")) bounds how long such a component can vanish.
  We give a self-contained formal proof of the required estimate, valid directly over any field of characteristic zero.

For a nonzero series $b in F \[ \[ z \] \]$, write $"ord"_0 b$ for the least exponent with nonzero coefficient,
  and put $"ord"_0 0 = + oo$. For $b_1 \, dots.h \, b_k in F \[ \[ z \] \]$, their #emph[Wronskian] is

$ W \( b_1 \, dots.h \, b_k \) = det #scale(x: 120%, y: 120%)[\(] b_ell^(\( j \))
  #scale(x: 120%, y: 120%)[\)]_(0 lt.eq j < k \, thin 1 lt.eq ell lt.eq k) . $

The proof of the formal power-series Wronskian criterion by Bostan and Dumas #cite(label("BostanDumas2010"))
  Theorem 2 and Lemmas 1–3 uses a basis with distinct orders and a Vandermonde determinant.
  We recall that argument, recording also the order of the Wronskian.

#thm([Lemma 4.1.])[
  #emph[Let $F$ be a field of characteristic zero and let $V subset
    F \[ \[ z \] \]$ be a vector space of finite positive dimension $k$ over $F$.
    There is a basis $b_1 \, dots.h \, b_k$ of $V$ with distinct orders $0 lt.eq a_1 < dots.h.c < a_k$. For this basis,
#[#set math.equation(numbering: n => "(10)")
 $ "ord"_0 W \( b_1 \, dots.h \, b_k \) = sum_(ell = 1)^k a_ell - binom(k, 2) . $ <eq:wronskian-order>]

 In particular, the Wronskian of any basis of $V$ is nonzero, its order does not depend on the basis,
   and every nonzero member of $V$ has order at most $a_k$.]
] <lem:wronskian>

#proof[
  Consider the decreasing filtration $V_r = V ∩ z^r F \[ \[ z \] \]$ for $r gt.eq 0$.
    The coefficient of $z^r$ embeds $V_r \/ V_(r + 1)$ into $F$, so each quotient has dimension at most one.
    Moreover, $⋂_r V_r = 0$. Since $V$ is finite-dimensional, the filtration is eventually zero:
    otherwise its dimensions would eventually stabilize at a positive value,
    and then the subspaces themselves would stabilize, contradicting the zero intersection.
    Choosing a vector at each of the $k$ dimension drops gives a basis with the asserted distinct orders.
    A nonzero linear combination has the order of its lowest-order basis term.
  Write $b_ell = beta_ell z^(a_ell) + dots.h.c$, with $beta_ell eq.not 0$.
    Factoring $z^(a_ell)$ from column $ell$ and $z^(- j)$ from row $j$ in the Laurent-series field,
    the remaining constant determinant is
  $ (product_(ell = 1)^k beta_ell) det #scale(x: 120%, y: 120%)[\(] \( a_ell \)_j
    #scale(x: 120%, y: 120%)[\)]_(j \, ell) = (product_(ell = 1)^k beta_ell) product_(r < ell) \( a_ell - a_r \) . $
  Here $\( a \)_0 = 1$ and $\( a \)_j = a \( a - 1 \) dots.h.c \( a - j + 1 \)$;
    these are monic polynomials of successive degrees, so their determinant is the Vandermonde determinant.
    It is nonzero in characteristic zero. The factorization remains valid when $a_ell < j$:
    the corresponding falling factorial vanishes and the remaining entry is still a power series.
    This proves (10). A change of basis over $F$ multiplies the Wronskian by the nonzero determinant of the
    constant change-of-basis matrix, proving the remaining assertions. ◻
]

The bound below is the specialization of Moura’s estimate to the present degree assumptions.
  In its complex formulation, recalled in #cite(label("MouraHyperelliptic2003")) Section 2, Theorem 1,
  the bound is $m - 1 + binom(m, 2) \( sigma - 2 \)$, where $sigma$ is the sum of pole orders of the matrix
  differential form $\( P \/ q \) thin d z$ on the projective line.
  The finite poles contribute at most $n$, and infinity contributes at most one.
  The case $P = 0$ is immediate, since every solution is constant.
  The argument below proves the stated bound formally and follows the same derivative-row and Wronskian method.

#thm([Theorem 4.2.])[
  (Multiplicity estimate of Moura).  #emph[Let $F$ be a field of characteristic zero, and let $n \, m gt.eq 1$.
    Suppose that $q in F \[ z \]$ has degree $n$ and $q \( 0 \) eq.not 0$,
    that $P in "Mat"_m \( F \[ z \] \)$ has entries of degree at most $n - 1$, and that
$ G in "GL"_m \( F \[ \[ z \] \] \) \, wide G' = \( P \/ q \) G . $

 For a constant row $u in F^(1 times m)$ and a constant column $v in F^(m times 1)$, if $y = u G v$ is nonzero, then
#[#set math.equation(numbering: n => "(11)")
 $ "ord"_0 y lt.eq \( n - 1 \) binom(m, 2) + m - 1 . $ <eq:multiplicity-bound>]

]
] <thm:multiplicity>

#proof[
  Put $h = u G$, and let $V$ be the $F$-span of its $m$ component series.
    Since $y eq.not 0$, its dimension $k$ satisfies $1 lt.eq k lt.eq m$.
    We compare Wronskians of these components with minors of a rational matrix whose numerator degrees are controlled.
  Define rational rows
  $ R_0 = u \, wide R_(j + 1) = R'_j + R_j P \/ q . $
  Then $h^(\( j \)) = R_j G$. Writing $R_j = Z_j \/ q^j$, the recurrence becomes
  $ Z_0 = u \, wide Z_(j + 1) = q Z'_j - j q' Z_j + Z_j P . $
  Induction shows that $Z_j$ is a polynomial row with entries of degree at most $j \( n - 1 \)$.
    This includes $n = 1$, when every $Z_j$ is constant. Every $R_j$ is regular at zero, because $q \( 0 \) eq.not 0$.
  Let $B$ be the $k times m$ matrix with rows $R_0 \, dots.h \, R_(k - 1)$, and put $S = binom(k, 2)$.
    The rows of $B G$ are $h \, h' \, dots.h \, h^(\( k - 1 \))$.
    Some $k$ components of $h$ form a basis of $V$, so Lemma 5 gives a nonzero $k times k$ minor of $B G$.
    Since $G$ is invertible, $B$ also has a nonzero $k times k$ minor.
    Every such minor has denominator $q^S$ and polynomial numerator of degree at most $\( n - 1 \) S$.
    As $q \( 0 \) eq.not 0$, the minimum order $delta$ among the nonzero $k times k$ minors of $B$ satisfies
  #[#set math.equation(numbering: n => "(12)")
   $ 0 lt.eq delta lt.eq \( n - 1 \) S . $ <eq:minor-order>]
  The minimum order of the $k times k$ minors of $B G$ is also $delta$.
    Indeed, Cauchy–Binet expresses every such minor as an $F \[ \[ z \] \]$-linear combination of the minors of
    $B$, so its order is at least $delta$. Applying the same argument to $B = \( B G \)
    G^(- 1)$ gives the reverse inequality, because $G^(- 1)$ also has power-series entries.
    Equivalently, multiplication by $G$ preserves the ideal generated by these minors in $F \[ \[ z \] \]$.
  A nonzero minor of $B G$ attaining this minimum is a Wronskian of $k$ components of $h$.
    Those components are linearly independent over $F$, and hence form a basis of $V$.
    Replace them by a basis of distinct orders $a_1 < dots.h.c < a_k$ as in Lemma 5.
    Its Wronskian still has order $delta$, so
  $ delta = sum_(j = 1)^k #scale(x: 120%, y: 120%)[\(] a_j - \( j - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Every summand is nonnegative. Since $y in V$ is nonzero, the same Lemma and (12) give
  $ "ord"_0 y lt.eq a_k lt.eq delta + k - 1 lt.eq \( n - 1 \) binom(k, 2) + k - 1 lt.eq \( n - 1 \) binom(m, 2) +
    m - 1 . $
  ◻
]

For the formula systems of the preceding section, $q \( z \) = product_(i = 1)^n \( z + i \)$ and $G \( 0 \) = I$,
  so every hypothesis of Theorem 6 holds. Word-series independence makes $u G
  v$ nonzero for a nonzero formula polynomial; the theorem bounds the number of Taylor coefficients needed to
  detect it. We now realize these coefficients by finite rational matrices.

== 5 The rational hitting point <sec:construction>

We now turn the integration operators into finite matrices and prove Theorem 1.
  The hitting matrices depend only on the size parameters; the representation of a polynomial is used to prove
  that they detect it.

=== 5.1 Taylor coefficients as a matrix space <taylor-coefficients-as-a-matrix-space>

For $d gt.eq 1$ and a characteristic-zero field $F$, let

$ pi_d : F \[ \[ z \] \] arrow.r F^d \, wide
  pi_d (sum_(r gt.eq 0) a_r z^r) = \( a_0 \, dots.h \, a_(d - 1) \)^(sans(T)) . $

This identifies $F \[ \[ z \] \] \/ \( z^d \)$ with the column space having ordered basis $1 \, z \, dots.h \,
  z^(d - 1)$. The operator $cal(J)_i \( a \) = integral_0^z a \( t \) \/ \( t + i \) thin d
  t$ increases vanishing order, so it induces a linear map on this quotient. Its matrix $T_i in "Mat"_d \( bb(Q) \)$ is

#[#set math.equation(numbering: n => "(13)")
 $ \( T_i \)_(r \, q) =
   cases(delim: "{", frac(\( - 1 \)^(r - q - 1), r thin i^(thin r - q)) \, & 0 lt.eq q < r < d \,, 0 \, & 0 lt.eq
   r lt.eq q < d .) $ <eq:explicit-matrices>]

Indeed,

$ frac(1, z + i) = sum_(a gt.eq 0) frac(\( - 1 \)^a z^a, i^(a + 1)) \, wide cal(J)_i \( z^q \) =
  sum_(r > q) frac(\( - 1 \)^(r - q - 1), r thin i^(r - q)) z^r . $

Every denominator in the nonzero case is nonzero, since $r gt.eq 1$ and $i gt.eq 1$.
  Discarding terms of degree at least $d$ before applying $cal(J)_i$ does not change any retained coefficient.
  Thus, for every $a in F \[ \[ z \] \]$,

#[#set math.equation(numbering: n => "(14)")
 $ pi_d \( cal(J)_i a \) = T_i pi_d \( a \) . $ <eq:jet-intertwining>]

Let $e_0 = pi_d \( 1 \)$. For a word $w = i_1 dots.h.c i_k$, repeated application of (14) gives

$ T_(i_1) dots.h.c T_(i_k) e_0 = pi_d \( h_w \) . $

The rightmost matrix acts first, exactly as in $h_w = cal(J)_(i_1) dots.h.c cal(J)_(i_k) \( 1 \)$.
  For the empty word both products are identities. Consequently, for every $f =
  sum_w f_w x_w in F chevron.l x_1 \, dots.h \, x_n chevron.r$,

#[#set math.equation(numbering: n => "(15)")
 $ f \( T_1 \, dots.h \, T_n \) e_0 = pi_d \( h_f \) . $ <eq:first-column>]

This identity also accounts for constant terms, since a scalar is evaluated as a scalar matrix.

=== 5.2 Detection and construction cost <detection-and-construction-cost>

Suppose first that $n s gt.eq 2$, and set $d = 2 n s^2$ in (13).
  Let $F$ have characteristic zero, and let $f in sans(F o r m)_(n \, s) \( F \)$ be nonzero.
  By Lemma 2, its series $h_f$ is nonzero. Proposition 4 represents this series as $u G
  v$ in a system of dimension $m lt.eq 2 s$ satisfying the hypotheses of Theorem 6. Hence

$ "ord"_0 h_f & lt.eq \( n - 1 \) binom(m, 2) + m - 1\
 & lt.eq \( n - 1 \) binom(2 s, 2) + 2 s - 1 lt.eq 2 n s^2 - 1 = d - 1 . $

The last inequality follows from

$ \( 2 n s^2 - 1 \) - (\( n - 1 \) binom(2 s, 2) + 2 s - 1) = s \( 2 s + n - 3 \) gt.eq 0 . $

Therefore $pi_d \( h_f \) eq.not 0$. Equation (15) supplies a nonzero first column of
  $f \( T_1 \, dots.h \, T_n \)$, proving detection.

When $n = s = 1$, a formula of size at most one is a single scalar or variable leaf.
  The one-by-one tuple $T_1 = \[ 1 \]$ detects every nonzero polynomial in this class.
  This gives dimension one in the remaining case.

For completeness, we give the bit cost of constructing the tuple. With $d = 2 n s^2$, put

$ B = 3 + ceil.l log_2 \( d + 1 \) ceil.r + d ceil.l log_2 \( n + 1 \) ceil.r . $

Every nonzero entry in (13) has numerator $1$ or $- 1$ and positive denominator $r i^(r - q)$,
  of bit length at most $B$. These fractions are already in lowest terms.
  For each $i$, precompute $i \, i^2 \, dots.h \, i^(d - 1)$ by repeated multiplication,
  then form each denominator by multiplying one of these powers by $r$.
  There are $O \( n d^2 \)$ such integer operations on $O \( B \)$-bit integers.
  Schoolbook multiplication gives total bit cost $O \( n d^2 B^2 \)$, with output length $O \( n d^2 B \)$.
  Both bounds are polynomial in $n \, s$, and the stated entry bound in Theorem 1 follows by substituting $d =
  2 n s^2$. The branch $n = s = 1$ has constant output and cost. This completes the proof of Theorem 1.

=== 5.3 Acyclic path programs <acyclic-path-programs>

The formula-to-path conversion is the only step that uses the tree model.
  The remaining argument applies to any strictly upper triangular coefficient representation,
  with its number of states in place of the formula-size bound.

#thm([Proposition 5.1.])[
  #emph[For every pair of integers $n \, m gt.eq 1$, the matrices in (13), with
$ d = \( n - 1 \) binom(m, 2) + m \, $

 form a rational hitting point for the following class over every characteristic-zero field $F$:
   nonzero polynomials $f = sum_w f_w x_w in F chevron.l x_1 \, dots.h \,
   x_n chevron.r$ whose coefficients admit a representation $f_w = u B_w v$, where $u in F^(1 times m)$,
   $v in F^(m times 1)$, and $B_1 \, dots.h \, B_n in "Mat"_m \( F \)$ are strictly upper triangular.
   The tuple depends only on $n \, m$ and can be constructed in time polynomial in $n \, m$,
   measured in bit operations.]
] <prop:path-programs>

#proof[
  For such a representation, define $G = sum_(\| w \| < m) B_w h_w$.
    Strict upper triangularity makes all longer products zero. As in Proposition 4, this gives $G \( 0 \) = I_m$ and
  $ G' = (sum_(i = 1)^n frac(B_i, z + i)) G \, wide u G v = h_f . $
  Thus $G$ is invertible over $F \[ \[ z \] \]$, and the system has the denominator and numerator degrees in (8).
    The series $h_f$ is nonzero by Lemma 2. Theorem 6 gives $"ord"_0 h_f lt.eq d - 1$, so (15) proves detection.
    The preceding entry and output cost calculation applies to this value of $d$ as well,
    and $d$ is polynomial in $n \, m$. ◻
]

In particular, an acyclic path program on $m$ vertices with scalar- or variable-labelled edges has such a
  representation by the scalar-edge elimination in Lemma 3.
  The same vertex bound holds for the affine-linear edge labels allowed in an algebraic branching program.
  To see this, order its vertices topologically and write each edge label as $c_0 + sum_(i = 1)^n c_i x_i$.
  Let $E_(a b)$ sum the coefficients $c_0$ over edges from $a$ to $b$,
  and let $\( N_i \)_(a b)$ sum their coefficients $c_i$. Both $E$ and each $N_i$ are strictly upper triangular.
  Expanding the ordered path products and putting $Q = \( I_m - E \)^(- 1)$ gives, for source $sigma$ and sink $rho$,

$ f_(i_1 dots.h.c i_k) = e_sigma^(sans(T)) Q N_(i_1) Q dots.h.c N_(i_k) Q e_rho . $

For the empty word the right side is $e_sigma^(sans(T)) Q e_rho$.
  Thus $u = e_sigma^(sans(T)) Q$, $B_i = N_i Q$, and $v = e_rho$ give the required representation without adding
  vertices.

#bibliography("refs.bib", style: "ieee", title: [References])
