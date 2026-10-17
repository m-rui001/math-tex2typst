#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[An explicit noncoordinate polynomial \
with affine three-space zero fibre]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction and statement <sec:introduction>

The Abhyankar–Sathaye conjecture asks whether a polynomial $f in bb(C) \[ z_1 \, dots.h \, z_n \]$ satisfying

$ bb(C) \[ z_1 \, dots.h \, z_n \] \/ \( f \) tilde.equiv bb(C)^(\[ n - 1 \]) $

must be a coordinate, that is, the first component of a polynomial automorphism of $bb(A)_(bb(C))^n$. Here $bb(C)^(\[ m \])$ denotes a polynomial ring in $m$ independent variables, and the displayed isomorphism is required to fix $bb(C)$. Geometrically, the question asks whether every hypersurface embedding $bb(A)_(bb(C))^(n - 1) arrow.r.hook bb(A)_(bb(C))^n$ can be carried to a coordinate hyperplane by an ambient polynomial automorphism.

For $n = 2$, the question is answered affirmatively by the Abhyankar–Moh–Suzuki Theorem [1,13]. The higher-dimensional problem belongs to a family of questions about polynomial maps with affine-space fibres. Sathaye [11] pp. 1–2 distinguished the coordinate, or epimorphism, question from the weaker question whether an affine-space zero fibre forces all fibres to be affine space. A coordinate polynomial defines a projection after an automorphism, so its fibres are all isomorphic to $bb(A)_(bb(C))^(n - 1)$; an isomorphism of the zero fibre alone supplies no such global trivialization. Kraft [7] §4 surveys the embedding problem and its relation to algebraic group actions. Among the early affirmative results, Sathaye [11] proved rectifiability for planes defined by polynomials linear in one of three variables in characteristic zero, and Russell [10] Theorem 2.3 extended this result to arbitrary fields.

In four variables, Kaliman, Vénéreau and Zaidenberg [6] Theorem 4.2(a) and Maubach [8] Corollaries 4.2–4.3 established affirmative results for equations $a \( x \) y + b \( x \, z \, t \)$ with $a eq.not 0$: an affine-three-space zero fibre can be straightened by an ambient automorphism. Here $x \, y \, z \, t$ are independent variables, and the coefficient of $y$ depends on only one of them. Further algebraic treatments appear in work of El Kahoui, Essamaoui and Ouali [2] and Ghosh, Gupta and Pal [5]. Ghosh, Gupta and Pal also study linear hypersurfaces with multivariable coefficients under additional hypotheses on the coefficients and their divisors [4] Theorem 4.11. Ghosh [3] Theorem 1.4 proves an affirmative embedding theorem in characteristic zero for $a \( x_m \) b \( x_1 \, dots.h \, x_(m - 1) \) y + f \( z \, t \) + x_m$, where the displayed variables are independent, $b eq.not 0$, and $a$ has at least two distinct roots over the algebraic closure. These results illustrate the role of restrictions on the defining equation; an abstract polynomial presentation of the quotient does not itself provide an automorphism of the ambient polynomial ring.

We give a counterexample in ambient dimension four, and hence in every ambient dimension at least four. The three-variable case is not addressed.

The construction starts from the cusp parametrization $\( u^3 \, - u^2 \)$ and perturbs its two entries by independent multiples of $h$. In $R = bb(C) \[ h \, u \, v \, w \]$, put

#[#set math.equation(numbering: n => "(1.1)")
 $ x & = u^3 + h v \, #h(2em) y = - u^2 + h w \,\
s & = S \( h \, u \, v \, w \) := 2 u^3 v + 3 u^4 w + h \( v^2 - 3 u^2 w^2 \) + h^2 w^3 . $ <eq:xyz>]

Since $x^2 + y^3$ vanishes modulo $h$, it is divisible by $h$ in $R$. The displayed polynomial $s$ is its quotient, so $x^2 + y^3 = h s$. Define $p$ and $F$ by

#[#set math.equation(numbering: n => "(1.2)")
 $ p \( x \, y \, s \) = - 2 s^2 x + 3 s y^2 - 3 s^3 y \, #h(2em) F = h - p \( x \, y \, s \) - 1 . $ <eq:F>]

Thus $F$ is a polynomial in the four independent variables $h \, u \, v \, w$.

#thm([Theorem 1.1.])[
  #emph[The polynomial $F$ defined in (1.1)–(1.2) satisfies 
$ R \/ \( F \) tilde.equiv bb(C)^(\[ 3 \]) \, #h(2em) "∇" F \( 2 \, 0 \, - 1 \/ 2 \, 1 \/ 2 \) = 0 . $

 Consequently $F$ is not a coordinate of $R$.]
] <thm:main>

The critical point $P = \( 2 \, 0 \, - 1 \/ 2 \, 1 \/ 2 \)$ lies on the fibre $F = - 1$. The zero fibre is smooth, since it is isomorphic to affine three-space.

#thm([Corollary 1.2.])[
  #emph[For every integer $n gt.eq 4$, there is a polynomial $f in bb(C) \[ z_1 \, dots.h \, z_n \]$ such that $bb(C) \[ z_1 \, dots.h \, z_n \] \/ \( f \) tilde.equiv bb(C)^(\[ n - 1 \])$ and $f$ is not a coordinate.]
] <cor:dimension>

Shpilrain and Yu [12] §1 used the ambient critical locus to distinguish isomorphic hypersurfaces with inequivalent embeddings. They asked whether the gradient must be nowhere zero when the zero fibre is isomorphic to a coordinate hyperplane. Theorem 1 gives a negative answer in ambient dimension four, and Corollary 2 preserves this obstruction after adjoining variables. The distinction is between the intrinsic geometry of one fibre and the behaviour of its defining polynomial on the ambient space.

The main algebraic ingredient is Lemma 3. It turns a presentation over a commutative base ring $B$ with $x^2 + y^3 = h s$ and $\( h \, y \) = B$ into a polynomial extension of that base. Two compatible linear equations, with coefficients generating the unit ideal, give explicit inverse maps even when the base has zero divisors. In our example, a translation identifies the auxiliary algebra cut out by $x^2 + y^3 = h s$ and $h = 1 + p \( x \, y \, s \)$ with a polynomial ring in two variables; the lemma supplies the third variable. This proves that the zero fibre is affine space. An identity in the original four-variable ring then exhibits a critical point on the fibre over $- 1$, which rules out a coordinate.

The polynomials in (1.1) also have an invariant-theoretic interpretation. The triangular derivation $D = h partial_u - 3 u^2 partial_v + 2 u partial_w$ of $R$ annihilates $h \, x \, y \, s$. They arise in the triangular monomial kernel calculation of Maubach [9] proof of Theorem 3.2, case (3). The proof below uses the cusp relation directly through Lemma 3.

Section 2 proves the lifting lemma over an arbitrary commutative base ring. Section 3 identifies the auxiliary algebra, establishes the zero-fibre isomorphism, and proves the critical-point obstruction and its persistence after adjoining variables. Appendix 4 records the resulting polynomial coordinates and their inverse.

== 2 An elementary lifting lemma <sec:lifting>

The next lemma provides the polynomial parameter used to identify the zero fibre. Its unit-ideal hypothesis allows us to solve two compatible linear equations without dividing by either coefficient. This point matters because the coefficients need not be units, and the base ring may have zero divisors.

In the following statement, $S \( H \, U \, V \, W \)$ denotes the universal polynomial specified in (1.1), with the indicated arguments. All rings are commutative with identity.

#thm([Lemma 2.1.])[
  #emph[Let $B$ be a ring and let $h \, x \, y \, s in B$ satisfy 
#[#set math.equation(numbering: n => "(2.1)")
 $ x^2 + y^3 = h s \, #h(2em) \( h \, y \) = B . $ <eq:base>]

 Then the $B$-algebra 
$ C = B \[ U \, V \, W \] \/ #scale(x: 120%, y: 120%)[\(] U^3 + h V - x \, thin - U^2 + h W - y \, thin S \( h \, U \, V \, W \) - s #scale(x: 120%, y: 120%)[\)] $

 is isomorphic to $B \[ T \]$, where $T$ is an indeterminate.]
] <lem:lift>

#proof[
  We first make one relation linear, then eliminate $W$ using the unit-ideal hypothesis, and finally identify the remaining algebra with a polynomial ring in one variable. Choose $alpha \, beta in B$ with
  #[#set math.equation(numbering: n => "(2.2)")
   $ alpha h + beta y = 1 . $ <eq:bezout>]
  Make the polynomial substitution $G = V + U W$, whose inverse is $V = G - U W$. Modulo the relation $h W = y + U^2$, direct expansion gives
  $ S \( h \, U \, G - U W \, W \) = h G^2 - 2 U y G + y^2 W . $
  The first defining relation becomes $h G - y U = x$ modulo the same relation. Consequently
  #[#set math.equation(numbering: n => "(2.3)")
   $ C tilde.equiv B \[ U \, G \, W \] \/ #scale(x: 120%, y: 120%)[\(] h G - y U - x \, med h W - y - U^2 \, med y^2 W - s + h G^2 - 2 U y G #scale(x: 120%, y: 120%)[\)] . $ <eq:Clinear>]
  Put $A = B \[ U \, G \] \/ \( h G - y U - x \)$ and, in $A$, set
  $ a = y + U^2 \, #h(2em) b = s - h G^2 + 2 U y G . $
  The last two equations in (2.3) are $h W = a$ and $y^2 W = b$. They are compatible, since
  #[#set math.equation(numbering: n => "(2.4)")
   $ y^2 a - h b = \( h G - y U \)^2 + y^3 - h s = x^2 + y^3 - h s = 0 . $ <eq:compat>]
  Moreover, if $r = alpha \( 1 + beta y \)$ and $q = beta^2$, then
  $ r h + q y^2 = \( 1 - beta y \) \( 1 + beta y \) + beta^2 y^2 = 1 . $
  It follows that
  #[#set math.equation(numbering: n => "(2.5)")
   $ W_0 = r a + q b $ <eq:Wlinear>]
  solves both equations: (2.4) gives $h W_0 = \( r h + q y^2 \) a = a$ and $y^2 W_0 = \( r h + q y^2 \) b = b$. In $A \[ W \]$ one has
  $ W - W_0 = r \( h W - a \) + q \( y^2 W - b \) \, $
  while $h W - a = h \( W - W_0 \)$ and $y^2 W - b = y^2 \( W - W_0 \)$. Hence
  $ \( h W - a \, med y^2 W - b \) = \( W - W_0 \) . $
  Evaluation at $W_0$ therefore gives $A \[ W \] \/ \( h W - a \, y^2 W - b \) tilde.equiv A$. By (2.3), this proves $C tilde.equiv A$.
  Finally, define a $B$-algebra map $A arrow.r B \[ T \]$ by
  #[#set math.equation(numbering: n => "(2.6)")
   $ U = h T - beta x \, #h(2em) G = y T + alpha x . $ <eq:UG>]
  Its inverse is given by $T mapsto alpha U + beta G$. Indeed, $h G - y U = x$ follows from (2.2); in $A$ one has
  $ h \( alpha U + beta G \) = U + beta x \, #h(2em) y \( alpha U + beta G \) = G - alpha x \, $
  and substitution of (2.6) gives $alpha U + beta G = T$. These verify both composites. Thus $C tilde.equiv A tilde.equiv B \[ T \]$. In the original variables, the parameter is
  $ T = alpha U + beta \( V + U W \) . $
  Its inverse recovers $U \, G$ by (2.6), then $W$ by (2.5) and $V = G - U W$. ◻
]

== 3 The affine-space fibre and the critical point <sec:mainproof>

We first identify the base algebra to which Lemma 3 applies. After obtaining the coordinates on the zero fibre, we use the same polynomial identities in the ambient ring to locate a critical point on another fibre.

#proof[
  First, direct expansion of (1.1) gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ x^2 + y^3 = h s . $ <eq:cusp>]
  For formal $x \, y \, s$, the translation
  #[#set math.equation(numbering: n => "(3.2)")
   $ X = x + s^3 \, #h(2em) Y = y - s^2 $ <eq:shift>]
  satisfies
  #[#set math.equation(numbering: n => "(3.3)")
   $ X^2 + Y^3 = x^2 + y^3 - s p \( x \, y \, s \) . $ <eq:shiftidentity>]
  Here the terms $s^6$ from the square and cube cancel.
  Using independent indeterminates $h \, x \, y \, s$, form the auxiliary algebra
  #[#set math.equation(numbering: n => "(3.4)")
   $ B = bb(C) \[ h \, x \, y \, s \] \/ #scale(x: 120%, y: 120%)[\(] h - 1 - p \( x \, y \, s \) \, med x^2 + y^3 - s h #scale(x: 120%, y: 120%)[\)] . $ <eq:B>]
  We use the same symbols for their residue classes in $B$. This is a new presentation: at this stage $x \, y \, s$ are independent generators before passage to the quotient, rather than the polynomials in (1.1). Eliminating $h$ and applying the invertible translation (3.2) over $bb(C) \[ s \]$ gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ B tilde.equiv bb(C) \[ X \, Y \, s \] \/ \( X^2 + Y^3 - s \) tilde.equiv bb(C) \[ X \, Y \] . $ <eq:Bplane>]
  The inverse presentation is explicitly
  #[#set math.equation(numbering: n => "(3.6)")
   $ s = X^2 + Y^3 \, quad x = X - s^3 \, quad y = Y + s^2 \, quad h = 1 + p \( x \, y \, s \) . $ <eq:Bparam>]
  The elements $h \, y$ generate the unit ideal in $B$. Indeed, modulo $\( h \, y \)$, the two defining equations give $x^2 = 0$ and $1 = 2 s^2 x$; squaring the latter gives $1 = 0$. Hence $B \/ \( h \, y \)$ is the zero ring.
  Form the algebra in Lemma 3 over this $B$, using lower-case $u \, v \, w$ for its three added variables. Its presentation is
  $ C = B \[ u \, v \, w \] \/ #scale(x: 120%, y: 120%)[\(] u^3 + h v - x \, thin - u^2 + h w - y \, thin S \( h \, u \, v \, w \) - s #scale(x: 120%, y: 120%)[\)] . $
  In the polynomial ring on $h \, x \, y \, s \, u \, v \, w$, the last three equations eliminate $x \, y \, s$. The relation $x^2 + y^3 - s h$ then becomes the zero polynomial by (3.1), and the other relation in (3.4) becomes exactly $F$. Thus $C tilde.equiv R \/ \( F \)$. Lemma 3 and (3.5) now give
  #[#set math.equation(numbering: n => "(3.7)")
   $ R \/ \( F \) tilde.equiv C tilde.equiv B \[ T \] tilde.equiv bb(C) \[ X \, Y \, T \] . $ <eq:fiber>]
  It remains to show that $F$ is not a coordinate. Return to $R$, with $X = x + s^3$ and $Y = y - s^2$ now interpreted using (1.1). Equations (3.1), (1.2), and (3.3) give the ambient polynomial identity
  #[#set math.equation(numbering: n => "(3.8)")
   $ X^2 + Y^3 = s \( 1 + F \) . $ <eq:ambient>]
  At $P = \( 2 \, 0 \, - 1 \/ 2 \, 1 \/ 2 \)$ in the variable order $\( h \, u \, v \, w \)$, the values are
  $ x = - 1 \, quad y = 1 \, quad s = 1 \, quad p = 2 \, #h(2em) X = Y = 0 \, quad F = - 1 . $
  Differentiating (3.8) gives
  $ 2 X thin d X + 3 Y^2 thin d Y = \( 1 + F \) thin d s + s thin d F . $
  At $P$ this reduces to $0 = d F \( P \)$, so $"∇" F \( P \) = 0$.
  We now use the ambient critical-point obstruction emphasized by Shpilrain and Yu [12] §1. If a polynomial automorphism had $F$ as its first component, its Jacobian matrix at $P$ would have a zero first row. But the chain rule applied to the automorphism and its polynomial inverse makes that matrix invertible. This contradiction proves that $F$ is not a coordinate. ◻
]

#proof[
  For $n > 4$, use the same $F$ in $R \[ z_1 \, dots.h \, z_(n - 4) \]$. Equation (3.7) shows that the quotient is a polynomial ring in $n - 1$ variables. All derivatives of $F$ in the added variables vanish, and its original four derivatives vanish at $P$. Thus the extended polynomial has a critical point at $\( P \, 0 \, dots.h \, 0 \)$, and the same Jacobian argument rules out a coordinate. The case $n = 4$ is Theorem 1. ◻
]

== 4 Explicit coordinates on the zero fibre <app:coordinates>

The proof of Theorem 1 already supplies both directions of the isomorphism. We collect them here, including a polynomial certificate for the unit-ideal condition, so that the parametrization can be used directly.

To make the isomorphism (3.7) explicit, take in the algebra $B$ of (3.4)

#[#set math.equation(numbering: n => "(4.1)")
 $ alpha & = 1 + 2 s^2 x + 4 s^5 \,\
beta & = \( 3 s^3 - 3 s y \) \( 1 + 2 s^2 x \) - 4 s^4 y^2 . $ <eq:alphabeta>]

The following identity in the free polynomial ring proves $alpha h + beta y = 1$ in $B$:

#[#set math.equation(numbering: n => "(4.2)")
 $ alpha h + beta y - 1 = \( 1 + 2 s^2 x \) \( h - 1 - p \) - 4 s^4 \( x^2 + y^3 - s h \) . $ <eq:certificate>]

The three polynomial coordinates on $F = 0$ are

#[#set math.equation(numbering: n => "(4.3)")
 $ X = x + s^3 \, #h(2em) Y = y - s^2 \, #h(2em) T = alpha u + beta \( v + u w \) \, $ <eq:fibercoords>]

with all expressions interpreted by (1.1) and (4.1). Together they define a map from the zero fibre to $bb(A)_(bb(C))^3$. Conversely, start from independent $X \, Y \, T$, reconstruct $s \, x \, y \, h$ by (3.6), and compute $alpha \, beta$ by (4.1). Set

#[#set math.equation(numbering: n => "(4.4)")
 $ u & = h T - beta x \, #h(2em) g = y T + alpha x \,\
w & = alpha \( 1 + beta y \) \( y + u^2 \) + beta^2 \( s - h g^2 + 2 u y g \) \,\
v & = g - u w . $ <eq:explicitinverse>]

These are exactly the inverse maps from Lemma 3. In particular, they are defined on every point of $bb(A)_(bb(C))^3$ and every point of the zero fibre; no open subset has been removed.

#heading(level: 1)[References]
#bibitem([1])[S.~S.~Abhyankar and T.~T.~Moh, #emph[Embeddings of the line in the plane], J.~Reine Angew. Math. #strong[276] (1975), 148--166. #link("https://doi.org/10.1515/crll.1975.276.148")[doi:10.1515/crll.1975.276.148].]
#bibitem([2])[M.~El~Kahoui, N.~Essamaoui, and M.~Ouali, #emph[Interpolation in the automorphism group of a polynomial ring], Algebra Colloq. #strong[27] (2020), no.~3, 587--598. #link("https://doi.org/10.1142/S1005386720000486")[doi:10.1142/S1005386720000486].]
#bibitem([3])[P.~Ghosh, #emph[On $bb(A)^1$-contractibility of certain simple birational extensions of affine spaces], #link("https://arxiv.org/abs/2506.09166v4")[arXiv:2506.09166v4] (2026).]
#bibitem([4])[P.~Ghosh, N.~Gupta, and A.~Pal, #emph[On embedding of linear hypersurfaces], #link("https://arxiv.org/abs/2405.07205v3")[arXiv:2405.07205v3] (2024).]
#bibitem([5])[P.~Ghosh, N.~Gupta, and A.~Pal, #emph[On the family of affine threefolds $a \( x \) y = F \( x \, z \, t \)$], J.~Algebra #strong[700] (2026), 267--288. #link("https://doi.org/10.1016/j.jalgebra.2026.04.008")[doi:10.1016/j.jalgebra.2026.04.008]\; #link("https://arxiv.org/abs/2403.17397v2")[arXiv:2403.17397v2].]
#bibitem([6])[S.~Kaliman, S.~Vénéreau, and M.~Zaidenberg, #emph[Simple birational extensions of the polynomial algebra $bb(C)^(\[ 3 \])$], Trans. Amer. Math. Soc. #strong[356] (2004), 509--555. #link("https://doi.org/10.1090/S0002-9947-03-03398-1")[doi:10.1090/S0002-9947-03-03398-1]\; #link("https://arxiv.org/abs/math/0104204v2")[arXiv:math/0104204v2].]
#bibitem([7])[H.~Kraft, #emph[#link("https://numdam.org/item/SB_1994-1995__37__295_0/")[Challenging problems on affine $n$-space]], Séminaire Bourbaki, Vol.~1994/95, Exposé~802, Astérisque #strong[237] (1996), 295--317.]
#bibitem([8])[S.~Maubach, #emph[The commuting derivations conjecture], J.~Pure Appl. Algebra #strong[179] (2003), 159--168. #link("https://doi.org/10.1016/S0022-4049(02)00198-6")[doi:10.1016/S0022-4049(02)00198-6].]
#bibitem([9])[S.~Maubach, #emph[Triangular monomial derivations on $k \[ X_1 \, X_2 \, X_3 \, X_4 \]$ have kernel generated by at most four elements], J.~Pure Appl. Algebra #strong[153] (2000), no.~2, 165--170. #link("https://doi.org/10.1016/S0022-4049(99)00084-5")[doi:10.1016/S0022-4049(99)00084-5].]
#bibitem([10])[P.~Russell, #emph[Simple birational extensions of two dimensional affine rational domains], Compositio Math. #strong[33] (1976), no.~2, 197--208. #link("https://www.numdam.org/item/CM_1976__33_2_197_0/")[Archival full text].]
#bibitem([11])[A.~Sathaye, #emph[On linear planes], Proc. Amer. Math. Soc. #strong[56] (1976), 1--7. #link("https://doi.org/10.1090/S0002-9939-1976-0409472-6")[doi:10.1090/S0002-9939-1976-0409472-6].]
#bibitem([12])[V.~Shpilrain and J.-T.~Yu, #emph[Embeddings of hypersurfaces in affine spaces], J.~Algebra #strong[239] (2001), no.~1, 161--173. #link("https://doi.org/10.1006/jabr.2000.8677")[doi:10.1006/jabr.2000.8677]\; #link("https://arxiv.org/abs/math/0010211v1")[arXiv:math/0010211v1].]
#bibitem([13])[M.~Suzuki, #emph[Propriétés topologiques des polynômes de deux variables complexes, et automorphismes algébriques de l'espace $bb(C)^2$], J.~Math. Soc. Japan #strong[26] (1974), 241--257. #link("https://doi.org/10.2969/jmsj/02620241")[doi:10.2969/jmsj/02620241].]


