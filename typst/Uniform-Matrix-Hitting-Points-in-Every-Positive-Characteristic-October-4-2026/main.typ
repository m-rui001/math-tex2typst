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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform Matrix Hitting Points \
in Every Positive Characteristic]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Polynomial identity testing asks whether a polynomial given by arithmetic operations is zero. In the noncommutative setting, variables are evaluated on matrices: scalar substitutions would, for example, erase the nonzero commutator $x_1 x_2 - x_2 x_1$. The question considered here is whether one can construct a single matrix substitution, using only the characteristic, the number of variables, and a formula-size bound, that detects every nonzero formula of that size. We construct such a substitution over the prime field in every positive characteristic. Its dimension and the time needed to print all its entries are polynomially bounded.

=== 1.1 The result <the-result>

For a field $F$, the free associative algebra $F chevron.l x_1 \, dots.h \, x_n chevron.r$ has as an $F$-basis the finite ordered words in $x_1 \, dots.h \, x_n$, including the empty word $1$; multiplication concatenates words. A #emph[noncommutative formula] is a rooted tree whose leaves are variables or scalars in $F$, and whose internal vertices are binary addition or ordered multiplication gates. Its #emph[size] is the number of all vertices, including scalar leaves. Thus there are no inverse gates and no shared subexpressions. Scalars may be arbitrary elements of $F$. When evaluating at $d times d$ matrices, a scalar $a$ is interpreted as $a I_d$.

#thm([Theorem 1.1.])[
  #emph[There is a deterministic Turing machine and absolute positive integers $C \, k$ with the following property. Given a prime $p$ in binary and positive integers $n \, s$ in unary, the machine outputs a positive integer $d = O \( n^3 s^6 \)$ and a tuple 
$ \( T_1 \, dots.h \, T_n \) in "Mat"_d \( bb(F)_p \)^n . $

 For every field $F$ of characteristic $p$ and every nonzero $f in F chevron.l x_1 \, dots.h \, x_n chevron.r$ computed by a formula of size at most $s$, the same tuple, viewed over $F$, satisfies 
$ f \( T_1 \, dots.h \, T_n \) eq.not 0 . $

 Writing $L = ceil.l log_2 p ceil.r$, the total running time and output length are at most $C \( n + s + L + 1 \)^k$. All matrix entries are output densely as ordinary binary residues in ${ 0 \, dots.h \, p - 1 }$, with dimensions and separators included. Primality of $p$ is promised.]
] <thm:main>

The generator receives no formula or coefficients. In particular, its guarantee is uniform over arbitrary extensions of $bb(F)_p$, and applies to $p = 2$ without any relation between the characteristic and the formula size. The required conclusion is matrix nonvanishing. The time to evaluate a formula over an unspecified coefficient field is separate from the bit complexity of constructing the tuple.

The proof also applies to an #emph[acyclic algebraic path program]: a finite directed acyclic graph with a designated source and sink, edges labelled by scalars or variables, and value equal to the sum of ordered label products over source–sink paths. Replacing the formula-size parameter by the number of vertices gives the same polynomial construction; see Corollary 9. This extension follows from the coefficient representation used in the proof.

=== 1.2 Context and the characteristic obstruction <context-and-the-characteristic-obstruction>

Noncommutative identity testing has distinct tests that use the internal representation and tests that only evaluate the polynomial. Nisan characterized homogeneous noncommutative branching-program complexity by ranks of coefficient matrices #cite(label("Nisan1991")) Theorem 1. Raz and Shpilka gave a deterministic polynomial-time identity test for noncommutative formulas and algebraic branching programs when their descriptions are available #cite(label("RS2005")). Matrix evaluation also underlies randomized black-box tests; Bogdanov and Wee gave such a test for circuits with a supplied degree bound, using polynomial identities of matrix algebras #cite(label("BW2005")) Theorem 4.2.

For deterministic black-box testing, Forbes and Shpilka constructed quasipolynomial-size matrix hitting sets for noncommutative algebraic branching programs, under a field-cardinality hypothesis #cite(label("FS2013")) Corollary 4.7. A block-diagonal sum can combine a finite hitting set into one tuple, but its dimension grows with the size of that set. Lakhani and Mukhopadhyay constructed one integer matrix tuple for sparsity-bounded polynomials over characteristic-zero fields #cite(label("LM2026")) Theorem 2.1 and Remark 2.6; their finite-field formulation also distinguishes a succinct extension-field description from its explicit coordinate cost. Sparsity is a different parameter: a formula of small size can have exponentially many words. These results provide relevant benchmarks, while the construction here is polynomial in formula size and in the binary length of the characteristic.

The characteristic-zero companion #cite(label("OAInc")) Theorem 1.1 constructs one rational matrix tuple for formulas, with dimension at most $2 n s^2$ and polynomial bit complexity. Its proof encodes words by iterated integrals, puts the encoding of a formula into a finite differential system, and applies an order-of-vanishing bound before truncating. The representation by an acyclic path program is independent of the characteristic. The analytic-looking part of the construction is not: formal integration divides by positive integers, ordinary differentiation annihilates $p$th powers in characteristic $p$, and distinct integer pole locations may coincide. Nor does reduction of a rational hitting tuple automatically preserve its guarantee at every prime.

We retain the word-series and matrix-system organization, replacing the differential operator by an infinite-order multiplicative shift. The resulting order bound and the final descent to prime-field matrices are proved directly in the given characteristic. The dimension bound is larger than in the companion, but remains polynomial without any lower bound on $p$.

=== 1.3 Proof strategy <proof-strategy>

Fix an arbitrary coefficient field $F$ and introduce an indeterminate $t$ over it. Over $K = F \( t \)$, let $sigma$ act on formal series in $z$ by $sigma \( g \) \( z \) = g \( t z \)$. For each letter $i$, define the operator $cal(J)_i$ by requiring $cal(J)_i \( g \)$ to have zero constant term and

$ \( sigma - 1 \) cal(J)_i \( g \) = frac(z, 1 - \( 1 + t \)^i z) thin g . $

On the coefficient of $z^r$ for $r gt.eq 1$, this divides by $t^r - 1$, which is nonzero in every characteristic. Iteration defines a series $h_w$ for each word $w$, starting from $h_epsilon.alt = 1$ for the empty word $epsilon.alt$. Section 2 proves that these series are linearly independent. A minimal-relation argument reduces the claim to a pole obstruction: a difference $sigma \( R \) - R$, with $R in K \( z \)$, cannot have just one pole in an infinite shift orbit, whereas the poles $\( 1 + t \)^(- i)$ lie in disjoint such orbits. Thus a nonzero polynomial $f = sum_w f_w x_w$ gives a nonzero series $h_f = sum_w f_w h_w$.

Formula size bounds how late the first nonzero coefficient of $h_f$ can appear. Section 3 finds a row $u$, a column $v$, and strictly upper triangular $m times m$ matrices $B_1 \, dots.h \, B_n$ over $F$, with $m lt.eq 2 s$, such that $f_w = u B_w v$; here $B_(i_1 dots.h.c i_ell) = B_(i_1) dots.h.c B_(i_ell)$ and $B_epsilon.alt = I_m$. The finite sum $H = sum_w B_w h_w$ satisfies $H \( 0 \) = I$ and $sigma \( H \) = \( P \/ Q \) H$, with $z$-degrees at most $n$ and $Q \( 0 \) = 1$. Section 4 proves the reusable bound

$ u H v eq.not 0 quad arrow.r.double quad "ord"_z \( u H v \) lt.eq n binom(m, 2) . $

The proof adapts the determinant method for differential systems: a basis of series with distinct leading orders $c_i$ has a shifted determinant whose leading coefficient is a Vandermonde determinant on $t^(c_i)$. These elements remain distinct in small characteristic. Rational degree bounds then control the orders of the relevant minors.

Truncating in $z$ now gives matrices over $bb(F)_p \( t \)$ that detect all the required formulas. Section 5 removes $t$ without choosing a large finite extension. Strict triangularity supplies one denominator clearing every evaluated word, together with a polynomial bound on the remaining $t$-degree. Reduction modulo a sufficiently large power $t^E$ preserves nonvanishing. Finally, representing multiplication on $bb(F)_p \[ t \] \/ \( t^E \)$ by matrices over $bb(F)_p$ gives the output tuple. The shift order bound is useful independently of the formula application; the last step is a general way to retain bounded-degree rational data in ordinary matrices over the base field.

== 2 Independent word series from a multiplicative shift <sec:words>

We first encode free polynomials by formal power series without losing any nonzero polynomial. No size bound is needed in this section. Fix a field $F$, let $t$ be an indeterminate over $F$, and put $K = F \( t \)$. For a second formal variable $z$, define

$ sigma : K \( \( z \) \) arrow.r K \( \( z \) \) \, #h(2em) sigma \( g \) \( z \) = g \( t z \) . $

This automorphism fixes $K$ and preserves both $K \[ \[ z \] \]$ and $K \( z \)$, where rational functions are embedded by Laurent expansion at $z = 0$. Since $t^r eq.not 1$ for every nonzero integer $r$, coefficient comparison gives

#[#set math.equation(numbering: n => "(1)")
 $ K \( \( z \) \)^sigma = K . $ <eq:fixed-field>]

In particular, this remains true when the characteristic divides $r$.

For $1 lt.eq i lt.eq n$, set

#[#set math.equation(numbering: n => "(2)")
 $ a_i = \( 1 + t \)^i \, #h(2em) b_i \( z \) = frac(z, 1 - a_i z) . $ <eq:letters>]

Given $g in K \[ \[ z \] \]$, define $cal(J)_i \( g \)$ to be the unique series $h in z K \[ \[ z \] \]$ satisfying

#[#set math.equation(numbering: n => "(3)")
 $ \( sigma - 1 \) h = b_i g . $ <eq:shift-antiderivative>]

Indeed, the right side has zero constant coefficient, and the coefficient of $z^r$ in $h$, for $r gt.eq 1$, is obtained by dividing the corresponding coefficient of $b_i g$ by $t^r - 1$. Thus $cal(J)_i$ is $K$-linear and

#[#set math.equation(numbering: n => "(4)")
 $ cal(J)_i #scale(x: 120%, y: 120%)[\(] z^j K \[ \[ z \] \] #scale(x: 120%, y: 120%)[\)] subset.eq z^(j + 1) K \[ \[ z \] \] #h(2em) \( j gt.eq 0 \) . $ <eq:order-raising>]

The role of the transcendental parameter is already visible: all these divisions are valid in every characteristic.

Let ${ 1 \, dots.h \, n }^(*)$ denote the set of finite words, including the empty word $epsilon.alt$. For $w = i_1 dots.h.c i_ell$, write $x_w = x_(i_1) dots.h.c x_(i_ell)$, with $x_epsilon.alt = 1$. Define

#[#set math.equation(numbering: n => "(5)")
 $ h_epsilon.alt = 1 \, #h(2em) h_(i w) = cal(J)_i \( h_w \) \, $ <eq:word-series>]

where $i w$ means that $i$ is prefixed to $w$. Our objective is to prove that these series are linearly independent, even with rational-function coefficients. The relevant obstruction is that a rational difference cannot have an isolated pole in an infinite shift orbit. Such pole-orbit obstructions are central to rational $q$-summation; see Chen and Singer #cite(label("ChenSinger2012")) Section 2.3 for a systematic residue criterion in characteristic zero. The elementary form needed here has the following proof in arbitrary characteristic.

#thm([Lemma 2.1.])[
  (A rational difference obstruction).  #emph[With $K$, $sigma$, and $b_1 \, dots.h \, b_n$ as above, suppose 
$ sum_(i = 1)^n c_i b_i = sigma \( R \) - R \, #h(2em) c_i in K \, quad R in K \( z \) . $

 Then $c_1 = dots.h.c = c_n = 0$.]
] <lem:poles>

#proof[
  The unique finite pole of $b_i$ is $alpha_i = \( 1 + t \)^(- i)$, a nonzero element of $K$. The orbits
  $ cal(O)_i = { t^j alpha_i : j in bb(Z) } $
  are infinite and pairwise disjoint. To check the latter assertion, an orbit intersection would give $\( 1 + t \)^(i - i') = t^a$ for an integer $a$. The order at $t = 0$ forces $a = 0$, and the order at $t = - 1$ then forces $i = i'$. Orders of rational functions are integers; this reasoning is unchanged when the characteristic divides $i - i'$.
  Suppose $c_i eq.not 0$. The left side has exactly one pole on $cal(O)_i$. The rational function $R$ has only finitely many poles there. If it has none, neither does $sigma \( R \) - R$. Otherwise let $j_(-)$ and $j_(+)$ be the smallest and largest indices of its poles in this orbit. Substitution $z mapsto t z$ moves each pole from index $j$ to index $j - 1$. At index $j_(-) - 1$, only $sigma \( R \)$ has a pole; at index $j_(+)$, only $- R$ has one. These are two distinct poles of $sigma \( R \) - R$, a contradiction. The argument does not depend on the pole orders or on cancellation at interior indices; Figure 1 illustrates precisely this point. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.605, 1.5), [#text(size: 9pt)[$R$]], anchor: "east", padding: 0.1176cm)
  line((-0.275, 1.5), (4.895, 1.5), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.448), (0, 1.552), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.1, 1.448), (1.1, 1.552), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.2, 1.448), (2.2, 1.552), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.3, 1.448), (3.3, 1.552), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, 1.448), (4.4, 1.552), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  content((-0.605, 0.75), [#text(size: 9pt)[$sigma (R)$]], anchor: "east", padding: 0.1176cm)
  line((-0.275, 0.75), (4.895, 0.75), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.6975), (0, 0.8025), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.1, 0.6975), (1.1, 0.8025), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.2, 0.6975), (2.2, 0.8025), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.3, 0.6975), (3.3, 0.8025), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, 0.6975), (4.4, 0.8025), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  content((-0.605, 0), [#text(size: 9pt)[$sigma (R)-R$]], anchor: "east", padding: 0.1176cm)
  line((-0.275, 0), (4.895, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.0525), (0, 0.0525), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.1, -0.0525), (1.1, 0.0525), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.2, -0.0525), (2.2, 0.0525), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.3, -0.0525), (3.3, 0.0525), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, -0.0525), (4.4, 0.0525), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  circle((1.1, 1.5), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((3.3, 1.5), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((4.4, 1.5), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((0, 0.75), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((2.2, 0.75), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((3.3, 0.75), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((0, 0), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((1.1, 0), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((2.2, 0), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((4.4, 0), radius: 0.08819, fill: rgb("#1e4273"), stroke: none)
  circle((3.3, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#1e4273"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.1764, stroke: (paint: rgb("#1e4273"), thickness: 0.8pt, miter-limit: 10))
  circle((4.4, 0), radius: 0.1764, stroke: (paint: rgb("#1e4273"), thickness: 0.8pt, miter-limit: 10))
  line((1.1, 1.328), (0, 0.9225), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#808080"))))
  content((0, -0.1125), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((1.1, -0.1125), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((2.2, -0.1125), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  content((3.3, -0.1125), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  content((4.4, -0.1125), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  content((5.335, 0), [#text(size: 9pt)[interior poles may cancel;#linebreak()the two ends cannot]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Pole indices in one orbit ${ t^j alpha : j in bb(Z) }$, illustrated with pole set ${ 1 \, 3 \, 4 }$ for $R$. The shift lowers indices by one. The open point allows cancellation at an overlapping pole, while the circled endpoint poles always survive. The proof uses the same endpoint argument for every finite nonempty pole set. ],
) <fig:poles>

The proof below is a shift analogue of the minimal-relation argument for differential word series in Deneufchâtel, Duchamp, Hoang Ngoc Minh, and Solomon #cite(label("Deneufchatel2011")) Theorem 1. We include the argument: $sigma - 1$ is not a derivation, and the field here may have positive characteristic.

#thm([Proposition 2.2.])[
  (Word-series independence).  #emph[For every field $F$ and every positive integer $n$, the series $\( h_w \)_(w in { 1 \, dots.h \, n }^(*))$ in (5) are linearly independent over $F \( t \) \( z \)$.]
] <thm:words>

#proof[
  Suppose there is a nontrivial finite relation
  #[#set math.equation(numbering: n => "(6)")
   $ sum_w R_w h_w = 0 \, #h(2em) R_w in K \( z \) . $ <eq:minimal-relation>]
  Choose one with smallest maximum occurring word length $ell$, then with fewest nonzero coefficients at length $ell$. Since $h_epsilon.alt = 1$, we have $ell gt.eq 1$. Divide by one nonzero length-$ell$ coefficient to make it $1$.
  Apply $sigma$ to (6) and subtract the original relation. By (3), the coefficient of $h_w$ in the resulting relation is
  #[#set math.equation(numbering: n => "(7)")
   $ tilde(R)_w = sigma \( R_w \) - R_w + sum_(i = 1)^n b_i sigma \( R_(i w) \) \, $ <eq:new-relation>]
  where missing coefficients are zero. This relation has no words longer than $ell$, introduces no new length-$ell$ coefficient, and removes the normalized coefficient. If any $tilde(R)_w$ were nonzero, one of the two minimality conditions would fail. Therefore all of them vanish.
  For $\| w \| = ell$, Equation (7) gives $sigma \( R_w \) = R_w$, so (1) implies $R_w in K$. For each $\| w \| = ell - 1$, it then gives
  $ sum_(i = 1)^n b_i R_(i w) = sigma \( - R_w \) - \( - R_w \) . $
  Lemma 2 forces every $R_(i w)$ to vanish. Every word of length $ell$ occurs in exactly one such family, contradicting the choice of the original relation. ◻
]

For a free polynomial $f = sum_w f_w x_w$ over $F$, put

#[#set math.equation(numbering: n => "(8)")
 $ h_f = sum_w f_w h_w = f \( cal(J)_1 \, dots.h \, cal(J)_n \) 1 . $ <eq:hf>]

The rightmost operator acts first, so the second equality follows from the prefix convention in (5). Proposition 3 shows that $f eq.not 0$ implies $h_f eq.not 0$. To turn this encoding into finite matrices, we must now bound how far into $h_f$ its first nonzero coefficient can occur. Formula size supplies that bound through a finite matrix system.

== 3 From formulas to finite shift systems <sec:systems>

The word series of Section 2 send every nonzero polynomial $f = sum_w f_w x_w$ to a nonzero series $h_f = sum_w f_w h_w$. To bound the order of this series in terms of formula size, we first represent the word coefficients $f_w$ by matrices of bounded dimension. We use the standard passage from formulas to path programs #cite(label("RS2005")) Section 2.1, Lemma 2, Step 1 and the resulting coefficient representation #cite(label("OAInc")) Lemma 3.1. We give the construction over an arbitrary field, keeping track of scalar edges and the order of multiplication.

An #emph[acyclic scalar/variable-labelled path program] over a field $F$ is a finite directed acyclic graph, with parallel edges allowed, whose edges are labelled by scalars in $F$ or by variables $x_1 \, dots.h \, x_n$. It has designated source and sink vertices; these vertices may coincide and need not be first and last in a topological ordering. The value of a directed path is the product of its edge labels in traversal order. The value of the program is the sum of these products over all paths from the designated source to the designated sink. When the two vertices coincide, the empty path contributes $1$. Acyclicity makes this a finite sum in $F chevron.l x_1 \, dots.h \, x_n chevron.r$.

#thm([Lemma 3.1.])[
  (Coefficient representation of a path program).  #emph[Let $F$ be a field, and let a path program with $m gt.eq 1$ vertices have value $f = sum_w f_w x_w$. There are a row $u in F^(1 times m)$, a column $v in F^(m times 1)$, and strictly upper triangular matrices $B_1 \, dots.h \, B_n in "Mat"_m \( F \)$ such that 
#[#set math.equation(numbering: n => "(9)")
 $ f_w = u B_w v \, #h(2em) B_(i_1 dots.h.c i_ell) = B_(i_1) dots.h.c B_(i_ell) \, #h(2em) B_epsilon.alt = I_m . $ <eq:coefficient-representation>]

 In particular, $B_w = 0$ whenever $\| w \| gt.eq m$.]
] <lem:acyclic-representation>

#proof[
  Number the vertices in a topological order, so every edge goes from a smaller index to a larger one. Matrix rows index starting vertices and columns index ending vertices. Let $\( E_0 \)_(a b)$ be the sum of the scalar labels on edges from $a$ to $b$. Let $\( X_i \)_(a b)$ be the sum of one copy of $1_F$ for each edge from $a$ to $b$ labelled $x_i$. All these matrices are strictly upper triangular. Consequently
  $ S = I_m + E_0 + dots.h.c + E_0^(m - 1) $
  has as its $\( a \, b \)$ entry the sum of the values of all scalar-only paths from $a$ to $b$, including the empty path when $a = b$.
  Write $upright("src")$ and $upright("snk")$ for the designated vertices, and let $e_a$ denote the $a$th coordinate column. A path whose sequence of variable labels is $i_1 dots.h.c i_ell$ decomposes uniquely into scalar-only paths separated by these variable edges. Since scalar labels are central, summing over these decompositions gives
  #[#set math.equation(numbering: n => "(10)")
   $ f_(i_1 dots.h.c i_ell) = e_(upright("src"))^(sans(T)) S X_(i_1) S dots.h.c X_(i_ell) S e_(upright("snk")) . $ <eq:scalar-path-elimination>]
  For the empty word the right-hand side is $e_(upright("src"))^(sans(T)) S e_(upright("snk"))$. Taking
  $ u = e_(upright("src"))^(sans(T)) S \, #h(2em) B_i = X_i S \, #h(2em) v = e_(upright("snk")) $
  proves (9). The product of a strictly upper triangular matrix with an upper triangular matrix is strictly upper triangular, so each $B_i$ has this property. Any product of $m$ such $m times m$ matrices is zero. ◻
]

#thm([Lemma 3.2.])[
  (Formula representation).  #emph[Let $F$ be a field, and let $f$ be computed by a noncommutative formula of size at most $s$, counting all vertices including scalar leaves. Then $f$ is the value of an acyclic scalar/variable-labelled path program with at most $2 s$ vertices. Its coefficients therefore have a representation (9) with $m lt.eq 2 s$.]
] <lem:formula-representation>

#proof[
  Associate two vertices, an entrance and an exit, to each formula vertex. For a leaf, join its entrance to its exit by one edge labelled by the leaf’s variable or scalar. At a sum gate, join its entrance to both child entrances and both child exits to its exit, using edges labelled $1$. At an ordered product gate, use edges labelled $1$ from its entrance to the first child entrance, from the first child exit to the second child entrance, and from the second child exit to its exit.
  The child subtrees have disjoint vertices because the computation is a formula. Recursively order the vertices of each subtree with its entrance first, its first child subtree before its second, and its exit last. Every edge points forward in this ordering, so the graph is acyclic. A path through a sum gate chooses one of its two child programs; a path through a product gate traverses the two child programs in their prescribed order. Induction on the formula therefore shows that the program from the root entrance to the root exit has value $f$. There are two program vertices per formula vertex, including each scalar leaf. The claimed coefficient representation now follows from Lemma 4. ◻
]

We now return to a field $F$ of characteristic $p$ and to $K = F \( t \)$. We combine the word series with the coefficient matrices in (9) to form one invertible matrix. Strict upper triangularity makes the following sum finite.

#thm([Proposition 3.3.])[
  (Shift system for a coefficient representation).  #emph[Let $F$ be a field of characteristic $p$ and put $K = F \( t \)$. Suppose $u in F^(1 times m)$, $v in F^(m times 1)$, and strictly upper triangular $B_1 \, dots.h \, B_n in "Mat"_m \( F \)$ represent the coefficients of a polynomial $f$ as in (9). With the word series from Section 2, define 
#[#set math.equation(numbering: n => "(11)")
 $ H \( z \) = sum_w B_w h_w \( z \) . $ <eq:fundamental-series-matrix>]

 Then $H in "GL"_m \( K \[ \[ z \] \] \)$, $H \( 0 \) = I_m$, and 
#[#set math.equation(numbering: n => "(12)")
 $ h_f = u H v \, #h(2em) sigma \( H \) = A \( z \) H \,\
A \( z \) = I_m + sum_(i = 1)^n b_i \( z \) B_i = frac(P \( z \), Q \( z \)) \, $ <eq:formula-shift-system>]

 where 
#[#set math.equation(numbering: n => "(13)")
 $ Q \( z \) = product_(i = 1)^n \( 1 - a_i z \) \, #h(2em) Q \( 0 \) = 1 \,\
deg_z Q lt.eq n \, #h(2em) deg_z P_(a b) lt.eq n quad \( 1 lt.eq a \, b lt.eq m \) . $ <eq:system-denominator>]

 Here $P in "Mat"_m \( K \[ z \] \)$, and $a_i = \( 1 + t \)^i$ and $b_i = z \/ \( 1 - a_i z \)$ are as in Section 2. If $f eq.not 0$, then $u H v eq.not 0$.]
] <prop:formula-system>

#proof[
  Only words of length less than $m$ contribute to (11), so the sum is finite. The empty word contributes $I_m$, whereas every nonempty word series has zero constant term. Hence $H \( 0 \) = I_m$ and $H$ is invertible over $K \[ \[ z \] \]$. The coefficient representation gives
  $ u H v = sum_w \( u B_w v \) h_w = sum_w f_w h_w = h_f . $
  In particular, Proposition 3 gives $u H v eq.not 0$ when $f eq.not 0$.
  The shift fixes every $B_i$, and the defining recursion for the word series gives $sigma \( h_(i w) \) - h_(i w) = b_i h_w$. Splitting the nonempty words according to their first letter, we obtain
  $ sigma \( H \) - H = sum_(i = 1)^n sum_w B_i B_w b_i h_w = (sum_(i = 1)^n b_i B_i) H . $
  This proves the shift equation with the displayed order of matrix factors. Finally, multiplying $A$ by $Q$ gives
  $ P \( z \) = Q \( z \) I_m + sum_(i = 1)^n z product_(j eq.not i) \( 1 - a_j z \) B_i . $
  Each summand has degree at most $n$, proving (13). ◻
]

For a size-$s$ formula, Lemma 5 makes the system dimension at most $2 s$. The next section bounds the order of every nonzero scalar component $u H v$ using this dimension and the degree bound in (13).

== 4 An order bound for multiplicative-shift systems <sec:order>

A bound on the order of a nonzero scalar series produced by the formula system will make a finite truncation possible. We prove such a bound for a general rational system under a multiplicative shift. We adapt the derivative-row and minor comparison underlying Moura’s multiplicity estimate #cite(label("Moura2003")), in the formal presentation of #cite(label("OAInc")) Section 4, Theorem 4.2, to successive shifts. The distinct-order basis and leading-term calculation parallel the Wronskian argument of Bostan and Dumas #cite(label("BostanDumas2010")) Lemmas 1–3. Here the leading determinant uses distinct powers of the shift parameter, and remains nonzero in every characteristic.

For a nonzero series $h in K \[ \[ z \] \]$, write $"ord"_z h$ for its least exponent with nonzero coefficient, and put $"ord"_z 0 = + oo$.

#thm([Theorem 4.1.])[
  (Order bound).  #emph[Let $K$ be a field, let $tau in K^times$ have infinite multiplicative order, and let $sigma$ be the automorphism of $K \( \( z \) \)$ that fixes $K$ and sends $z$ to $tau z$. Let $m gt.eq 1$ and $nu gt.eq 0$ be integers. Suppose that $H in "GL"_m \( K \[ \[ z \] \] \)$ satisfies 
#[#set math.equation(numbering: n => "(14)")
 $ sigma \( H \) = A H \, #h(2em) A = P / Q \, $ <eq:order-system>]

 where $P in "Mat"_m \( K \[ z \] \)$, $Q in K \[ z \]$, $Q \( 0 \) eq.not 0$, and $Q$ and every entry of $P$ have degree at most $nu$. For every constant row $u in K^(1 times m)$ and constant column $v in K^(m times 1)$, 
#[#set math.equation(numbering: n => "(15)")
 $ u H v eq.not 0 quad arrow.r.double quad "ord"_z \( u H v \) lt.eq nu binom(m, 2) . $ <eq:order-bound>]

]
] <thm:order>

#proof[
  Set $g = u H$ and suppose that $y = g v eq.not 0$. Let $V subset.eq K \[ \[ z \] \]$ be the $K$-linear span of the $m$ components of $g$, and put $k = dim_K V$. Then $1 lt.eq k lt.eq m$ and $y in V$. We first express the orders occurring in $V$ through a determinant, and then bound that determinant using the rational system.
  There is a basis $w_1 \, dots.h \, w_k$ of $V$ whose orders satisfy
  $ 0 lt.eq c_1 < c_2 < dots.h.c < c_k \, #h(2em) c_i = "ord"_z w_i . $
  To construct it, choose a nonzero element of smallest order in $V$. The coefficient functional at that order is nonzero, so its kernel has codimension one and every nonzero element of the kernel has larger order. Repeat inside this kernel, and continue until the dimension is zero. In any nonzero linear combination of the resulting basis, the first basis element with a nonzero coefficient supplies the unique lowest-order term. In particular,
  #[#set math.equation(numbering: n => "(16)")
   $ "ord"_z y lt.eq c_k . $ <eq:order-largest-basis-order>]
  Consider the determinant of successive shifts, or Casoratian,
  $ C \( w_1 \, dots.h \, w_k \) = det #scale(x: 120%, y: 120%)[\(] sigma^j \( w_i \) #scale(x: 120%, y: 120%)[\)]_(0 lt.eq j < k\
1 lt.eq i lt.eq k) . $
  Write the leading term of $w_i$ as $lambda_i z^(c_i)$, with $lambda_i in K^times$. After factoring $z^(c_i)$ from column $i$, the constant term of the determinant that remains is
  $ (product_(i = 1)^k lambda_i) det #scale(x: 120%, y: 120%)[\(] \( tau^(c_i) \)^j #scale(x: 120%, y: 120%)[\)]_(0 lt.eq j < k\
1 lt.eq i lt.eq k) = (product_(i = 1)^k lambda_i) product_(1 lt.eq i < h lt.eq k) \( tau^(c_h) - tau^(c_i) \) . $
  This expression is nonzero because $tau$ has infinite multiplicative order. Therefore
  #[#set math.equation(numbering: n => "(17)")
   $ "ord"_z C \( w_1 \, dots.h \, w_k \) = sum_(i = 1)^k c_i . $ <eq:casoratian-order>]
  Every other $K$-basis of $V$ gives a Casoratian of the same order: its matrix of successive shifts is obtained by an invertible change of columns over $K$, which is fixed by $sigma$.
  To bound this order, we compare the shifted components of $g$ with rational rows obtained from the system. Define rational rows
  #[#set math.equation(numbering: n => "(18)")
   $ R_0 = u \, #h(2em) R_(j + 1) = sigma \( R_j \) A quad \( j gt.eq 0 \) . $ <eq:order-rational-rows>]
  Equation (14) gives $sigma^j \( g \) = R_j H$ by induction. Each row has a presentation
  #[#set math.equation(numbering: n => "(19)")
   $ R_j = N_j / D_j \, #h(2em) D_j \( z \) = product_(e = 0)^(j - 1) Q \( tau^e z \) \, $ <eq:order-row-denominators>]
  where $N_j$ is a polynomial row whose entries have degree at most $j nu$; the empty product is $D_0 = 1$. Indeed, take $N_0 = u$ and then $N_(j + 1) = sigma \( N_j \) P$. Substitution by $tau z$ preserves polynomial degree, which proves the degree bound. Moreover, $D_j \( 0 \) = Q \( 0 \)^j eq.not 0$, so every entry of every $R_j$ belongs to $K \[ \[ z \] \]$.
  Let $M$ be the $k times m$ matrix with rows $R_0 \, dots.h \, R_(k - 1)$. Its product $M H$ has rows $g \, sigma \( g \) \, dots.h \, sigma^(k - 1) \( g \)$. For a $k times m$ matrix $X$ and a $k$-element subset $J subset.eq { 1 \, dots.h \, m }$, let $X_J$ denote the square matrix formed by the columns indexed by $J$, in increasing order. A determinant $det \( \( M H \)_J \)$ is the Casoratian of the corresponding components of $g$. It vanishes when those components are $K$-linearly dependent. Otherwise they form a basis of $V$, and (17) shows that its order is $sum_i c_i$. Some $k$ components form a basis of $V$, so at least one of these determinants is nonzero. Consequently,
  #[#set math.equation(numbering: n => "(20)")
   $ min_J "ord"_z det \( \( M H \)_J \) = sum_(i = 1)^k c_i . $ <eq:order-casoratian-minors>]
  Right multiplication by $H$ preserves the minimum order of the $k times k$ minors. To see this directly, Cauchy–Binet expresses every minor of $M H$ as a $K \[ \[ z \] \]$-linear combination of minors of $M$. The minimum order therefore cannot decrease. Applying the same argument to $M = \( M H \) H^(- 1)$ proves the reverse inequality, since $H^(- 1)$ also has power series entries. Thus
  #[#set math.equation(numbering: n => "(21)")
   $ min_J "ord"_z det \( M_J \) = min_J "ord"_z det \( \( M H \)_J \) . $ <eq:order-minor-invariance>]
  In particular, $M$ has a nonzero $k times k$ minor.
  By (19), any such nonzero minor has denominator $product_(j = 0)^(k - 1) D_j$, a unit at zero, and a nonzero polynomial numerator of degree at most
  $ sum_(j = 0)^(k - 1) j nu = nu binom(k, 2) . $
  Its order is at most this degree. Combining (16), (20), and (21) gives
  $ "ord"_z y lt.eq c_k lt.eq sum_(i = 1)^k c_i lt.eq nu binom(k, 2) lt.eq nu binom(m, 2) \, $
  as claimed. ◻
]

The characteristic plays no role in the Vandermonde calculation: distinct orders $c_i$ yield distinct powers $tau^(c_i)$. In the application, $K = F \( t \)$ and $tau = t$, so this condition holds for every coefficient field $F$. The other essential local condition is that $H$ be invertible over $K \[ \[ z \] \]$, as required to use both $H$ and $H^(- 1)$ in (21).

== 5 Truncation and construction over the prime field <sec:construction>

The order bound gives a finite amount of information in the variable $z$ that detects every nonzero formula. We first express the operators on this finite space as matrices over $bb(F)_p \( t \)$. We then retain bounded Taylor expansions in $t$ and represent multiplication by these truncated polynomials as matrices over $bb(F)_p$. A common denominator bound ensures that the second truncation preserves the nonvanishing established by the first.

=== 5.1 Truncating the word operators <truncating-the-word-operators>

Fix a prime $p$ and integers $n \, s gt.eq 1$, and set

#[#set math.equation(numbering: n => "(22)")
 $ N = 1 + n binom(2 s, 2) . $ <eq:z-truncation-length>]

Let $F$ be any field of characteristic $p$ and put $K = F \( t \)$, with $t$ an indeterminate over $F$. Each operator $cal(J)_i$ raises $z$-order by at least one, so it induces an operator on $K \[ \[ z \] \] \/ \( z^N \)$. In the ordered basis $1 \, z \, dots.h \, z^(N - 1)$, with vectors represented by coefficient columns, its matrix is

#[#set math.equation(numbering: n => "(23)")
 $ \( U_i \)_(r \, q) = cases(delim: "{", frac(\( 1 + t \)^(i \( r - q - 1 \)), t^r - 1) \, & 0 lt.eq q < r < N \,, 0 \, & 0 lt.eq r lt.eq q < N \,) #h(2em) 1 lt.eq i lt.eq n . $ <eq:truncated-operators>]

Indeed, the coefficient of $z^r$ in $b_i \( z \) z^q = z^(q + 1) \/ \( 1 - \( 1 + t \)^i z \)$ is $\( 1 + t \)^(i \( r - q - 1 \))$ for $r > q$, and inverting $sigma - 1$ divides that coefficient by $t^r - 1$. In particular, $U_i in "Mat"_N \( bb(F)_p \( t \) \)$, independently of the choice of $F$.

Let $e_0$ be the coefficient column of the constant series $1$. The recursion $h_(i w) = cal(J)_i \( h_w \)$ gives

#[#set math.equation(numbering: n => "(24)")
 $ f \( U_1 \, dots.h \, U_n \) e_0 = upright("the coefficient column of ") h_f med mod med z^N $ <eq:operator-evaluation>]

for every $f in F chevron.l x_1 \, dots.h \, x_n chevron.r$. The order of the operators agrees with the order of matrix multiplication: the rightmost operator of a word acts first.

Suppose that $f$ is nonzero and has a formula of size at most $s$. Word-series independence gives $h_f eq.not 0$. Section 3 represents this series as $u H v$ in a system of dimension $m lt.eq 2 s$ with numerator and denominator degrees at most $n$. Theorem 7 therefore gives

$ "ord"_z h_f lt.eq n binom(m, 2) lt.eq n binom(2 s, 2) = N - 1 . $

Thus (24) is nonzero, and in particular

#[#set math.equation(numbering: n => "(25)")
 $ f \( U_1 \, dots.h \, U_n \) eq.not 0 . $ <eq:rational-hitting>]

The tuple $U$ already has the required simultaneous detection property, but its entries are rational functions. We next replace these functions by finite matrices while preserving this property.

=== 5.2 Retaining finitely many coefficients of $t$ <retaining-finitely-many-coefficients-of-t>

All denominators in (23) are nonzero at $t = 0$. Moreover, one denominator clears every polynomial evaluated at $U$. Define

#[#set math.equation(numbering: n => "(26)")
 $ D \( t \) = product_(r = 1)^(N - 1) \( t^r - 1 \) \, #h(2em) E = 1 + binom(N, 2) + n \( N - 1 \) . $ <eq:t-truncation-length>]

For every $f in F chevron.l x_1 \, dots.h \, x_n chevron.r$, each entry of $D f \( U \)$ is a polynomial in $F \[ t \]$ of degree less than $E$. To verify this, consider a nonzero summand in the $\( r \, q \)$ entry of a word product $U_(i_1) dots.h.c U_(i_k)$. Since the matrices are strictly lower triangular, the summand follows a chain

$ q = j_0 < j_1 < dots.h.c < j_k = r < N . $

Its denominator is $product_(a = 1)^k \( t^(j_a) - 1 \)$, which divides $D$ because the indices $j_a$ are distinct. Its numerator is a power of $1 + t$ whose exponent is

$ sum_(a = 1)^k i_(k - a + 1) \( j_a - j_(a - 1) - 1 \) lt.eq n \( r - q - k \) lt.eq n \( N - 1 \) . $

Multiplying by $D$ therefore gives degree at most $deg D + n \( N - 1 \) = E - 1$. For the empty word the assertion follows from $deg D = binom(N, 2)$; words of length at least $N$ give zero. Taking $F$-linear combinations proves the assertion for $f$. This reasoning does not require the factors of $D$ to be relatively prime.

We use the following elementary descent statement to turn this degree bound into matrices over the coefficient field. For a field $k$, write

$ k \[ t \]_(\( t \)) = {frac(a \( t \), b \( t \)) : a \, b in k \[ t \] \, med b \( 0 \) eq.not 0} . $

Reduction modulo $t^E$ defines a $k$-algebra map from this ring to $k \[ t \] \/ \( t^E \)$, since a polynomial with nonzero constant term is a unit in the quotient.

#thm([Lemma 5.1.])[
  (Descent by a finite coefficient ring).  #emph[Let $k$ be a field, let $n \, N \, E gt.eq 1$, and let $V_1 \, dots.h \, V_n in "Mat"_N \( k \[ t \]_(\( t \)) \)$. Reduce their entries modulo $t^E$, and replace each resulting entry by its matrix of multiplication on $k \[ t \] \/ \( t^E \)$ in the basis $1 \, t \, dots.h \, t^(E - 1)$. This produces matrices $T_1 \, dots.h \, T_n in "Mat"_(N E) \( k \)$.]
  #emph[Let $F \/ k$ be any field extension and $f in F chevron.l x_1 \, dots.h \, x_n chevron.r$. Suppose that a polynomial $D in F \[ t \]$ with $D \( 0 \) eq.not 0$ satisfies 
$ D f \( V \) in "Mat"_N \( F \[ t \] \) \, #h(2em) deg_t #scale(x: 120%, y: 120%)[\(] \( D f \( V \) \)_(a \, b) #scale(x: 120%, y: 120%)[\)] < E quad upright("whenever ") \( D f \( V \) \)_(a \, b) eq.not 0 . $

 If $f \( V \) eq.not 0$ over $F \( t \)$, then $f \( T \) eq.not 0$ over $F$.]
] <lem:coefficient-descent>

#proof[
  Put $R_F = F \[ t \] \/ \( t^E \)$ and let $pi_F : F \[ t \]_(\( t \)) arrow.r R_F$ be reduction. Since $f \( V \) eq.not 0$, some entry of $D f \( V \)$ is a nonzero polynomial of degree less than $E$. Its reduction is nonzero. Hence
  $ pi_F \( D \) thin f \( pi_F \( V \) \) = pi_F \( D f \( V \) \) eq.not 0 \, $
  and therefore $f \( pi_F \( V \) \) eq.not 0$.
  Multiplication on $R_F$ gives a unital $F$-algebra map
  $ rho_F : R_F arrow.r "Mat"_E \( F \) . $
  It is injective: if multiplication by $a in R_F$ is zero, applying it to $1$ gives $a = 0$. Replacing entries by their multiplication matrices thus gives an injective unital $F$-algebra map
  $ rho_F^(\( N \)) : "Mat"_N \( R_F \) arrow.r "Mat"_(N E) \( F \) . $
  The maps $pi_F$ and $rho_F$ extend the corresponding maps over $k$. Consequently $rho_F^(\( N \)) \( pi_F \( V_i \) \)$ is the matrix $T_i$ viewed over $F$, and
  $ f \( T \) = rho_F^(\( N \)) #scale(x: 120%, y: 120%)[\(] f \( pi_F \( V \) \) #scale(x: 120%, y: 120%)[\)] eq.not 0 . $
  Unital $F$-linearity also shows that every scalar $a in F$ acts as $a I_(N E)$ throughout this evaluation. ◻
]

Apply the construction in Lemma 8 with $k = bb(F)_p$ and $V_i = U_i$, using the parameters in (22) and (26). We denote the resulting tuple by

#[#set math.equation(numbering: n => "(27)")
 $ T_(p \, n \, s) = \( T_1 \, dots.h \, T_n \) \, #h(2em) d = N E . $ <eq:prime-field-tuple>]

Only multiplication and reduction of functions regular at $t = 0$ enter this step. The shift automorphism is used before truncation; no shift on $bb(F)_p \[ t \] \/ \( t^E \)$ is needed.

=== 5.3 The uniform algorithm and the main theorem <the-uniform-algorithm-and-the-main-theorem>

#proof[
  We first verify the simultaneous guarantee. Fix any field $F$ of characteristic $p$ and any nonzero polynomial $f$ over $F$ computed by a formula of size at most $s$. Equation (25) gives $f \( U \) eq.not 0$ over $F \( t \)$. The degree bound following (26) verifies the hypotheses of Lemma 8, which gives $f \( T \) eq.not 0$. The tuple in (27) depends only on $p \, n \, s$. Thus this argument applies to all choices of $F$ and all their scalar coefficients with the same prime-field output.
  Here is a finite deterministic algorithm for producing that output. Compute the integers $N \, E \, d$. Represent elements of $bb(F)_p \[ t \] \/ \( t^E \)$ by length-$E$ coefficient arrays, keeping each coefficient as its residue in ${ 0 \, dots.h \, p - 1 }$. For $0 lt.eq q < r < N$, the required denominator inverse is explicitly
  #[#set math.equation(numbering: n => "(28)")
   $ \( t^r - 1 \)^(- 1) = - sum_(j = 0)^(floor.l \( E - 1 \) \/ r floor.r) t^(r j) med \( mod med t^E \) . $ <eq:inverse-geometric-series>]
  Indeed, its product with $t^r - 1$ is $1 - t^(r \( floor.l \( E - 1 \) \/ r floor.r + 1 \))$, which is $1$ in the quotient. Form $\( 1 + t \)^(i \( r - q - 1 \))$ by repeated multiplication by $1 + t$, reducing modulo $t^E$ and modulo $p$ after every operation, and multiply it by (28). This computes the reduction of every entry in (23); the remaining entries are zero.
  If such an entry is $c_0 + c_1 t + dots.h.c + c_(E - 1) t^(E - 1)$, its multiplication block has entry $c_(a - b)$ in row $a$, column $b$ when $0 lt.eq b lt.eq a < E$, and zero when $a < b$. Thus each block is obtained by shifts and truncations of one coefficient array. Output $d$ and the matrices $T_i$ densely, with these blocks in the positions prescribed by $U_i$ and with every entry written as its ordinary binary residue.
  We record the cost in the Turing model. Put $L = ceil.l log_2 p ceil.r$ and $B = n + s + L + 1$. The parameter formulas give
  $ N = O \( n s^2 \) \, #h(2em) E = O \( n^2 s^4 \) \, #h(2em) d = O \( n^3 s^6 \) \, $
  and in particular $N = O \( B^3 \)$, $E = O \( B^6 \)$, and $d = O \( B^9 \)$. All exponents used above are at most $n \( N - 1 \)$. With schoolbook polynomial arithmetic, at most
  $ O #scale(x: 120%, y: 120%)[\(] \( 1 + n N \) E^2 #scale(x: 120%, y: 120%)[\)] $
  residue operations suffice per entry of the $N$-by-$N$ matrices, including the construction of its multiplication block. For all $n N^2$ entries this is $O \( B^23 \)$ residue operations. Elementary binary arithmetic and division with remainder implement each residue operation in a number of bit operations polynomial in $L + 1$.
  The dense output has bit length
  $ O #scale(x: 120%, y: 120%)[\(] log \( d + 1 \) + n d^2 \( L + 1 \) #scale(x: 120%, y: 120%)[\)] = O \( B^20 \) \, $
  including entry separators and dimensions. The algorithm stores only polynomially many bits: coefficient arrays, matrices, and loop counters all have polynomial size in $B$. On an ordinary Turing machine, even locating every array entry by a scan of this storage adds only a polynomial factor. Integer parameter calculations and input processing also have polynomial bit cost. These explicit finite loops therefore give absolute constants $C \, k$ bounding both running time and output length by $C B^k$, as claimed. ◻
]

The same construction applies to the acyclic scalar/variable-labelled path programs of Section 3. Their significance here is that their state bound is the number of graph vertices, even when different paths share subpaths.

#thm([Corollary 5.2.])[
  #emph[There is a deterministic algorithm which, on input $\( "bin" \( p \) \, 1^n \, 1^m \)$ with $p$ prime and $n \, m gt.eq 1$, outputs a tuple in $"Mat"_d \( bb(F)_p \)^n$ detecting every nonzero polynomial computed by an acyclic scalar/variable-labelled path program with at most $m$ vertices, simultaneously over every field of characteristic $p$. One may take 
$ N = 1 + n binom(m, 2) \, #h(2em) E = 1 + binom(N, 2) + n \( N - 1 \) \, #h(2em) d = N E = O \( n^3 m^6 \) . $

 The running time and dense output length are polynomial in $n + m + ceil.l log_2 p ceil.r$.]
] <cor:path-programs>

#proof[
  Section 3 gives the same strictly upper triangular coefficient representation using at most $m$ states. Thus Theorem 7 yields $"ord"_z h_f lt.eq n binom(m, 2)$ for every nonzero path polynomial. With this value of $N$, define $U_i$ by (23) and apply Lemma 8 with $k = bb(F)_p$ and $E$ as displayed above. The same degree bound and bit analysis apply. When $m = 1$, every path polynomial is constant and $N = E = d = 1$; the output consists of zero $1$-by-$1$ matrices, which detect every nonzero constant. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
