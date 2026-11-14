#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A stable coordinate that is not a coordinate \
in four variables]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $k = upright(bold(C))$. An element $f in k \[ x_1 \, dots.h \, x_n \]$ is a #emph[coordinate] if there are
  elements $f_2 \, dots.h \, f_n$ such that

$ k \[ x_1 \, dots.h \, x_n \] = k \[ f \, f_2 \, dots.h \, f_n \] $

as a polynomial ring. Equivalently, a polynomial automorphism sends $f$ to $x_1$.
  It is a #emph[one-stable coordinate] if it is a coordinate in $k \[ x_1 \, dots.h \, x_n \, w \]$,
  where $w$ is independent. The stable coordinate conjecture asks whether an element that becomes a coordinate
  after adjoining finitely many variables was already a coordinate.
  The one-variable formulation appears in #cite(label("ShpilrainYu2002")) Conjecture 3;
  successive applications give the formulation with finitely many added variables.
  Over $upright(bold(C))$, the answer is affirmative in two and three variables by #cite(label("ShpilrainYu2002"))
  Proposition 1.1(c). The case of one original variable is elementary.
  Thus four variables are the first possible dimension for a counterexample, and one added variable already suffices.

#thm([Theorem 1.1.])[
  #emph[In $R = upright(bold(C)) \[ x_1 \, x_2 \, x_3 \, x_4 \]$, put
#[#set math.equation(numbering: n => "(1.1)")
 $ Q = x_2^2 - x_4^2 + x_1 x_3 \, wide f = x_1 - 2 Q #scale(x: 120%, y: 120%)[\(] Q \( x_2 + x_4 \) +
   x_1 x_4 #scale(x: 120%, y: 120%)[\)] . $ <eq:explicit-counterexample>]

 There is a $upright(bold(C))$-algebra automorphism of $R \[ w \]$ sending $f$ to $x_1$,
   but there is no such automorphism of $R$.]
] <thm:main>

The example also has a geometric consequence. A closed embedding $bb(A)^(n - 1) arrow.r.hook
  bb(A)^n$ is #emph[rectifiable] if an automorphism of the ambient affine space takes its image to a coordinate
  hyperplane. The Abhyankar–Sathaye embedding conjecture asserts, in characteristic zero,
  that a polynomial $g$ with $k \[ x_1 \, dots.h \, x_n \] \/ \( g \) tilde.eq k^(\[ n - 1 \])$ is a coordinate;
  see #cite(label("BlancVanSanten2019")) p. 8429. Here $k^(\[ r \])$ denotes a polynomial ring in $r$ variables.
  Corollary 2 gives a negative answer to this conjecture in ambient dimension four.
  In fact, every fiber is affine three-space and its inclusion in $bb(A)^4$ is nonrectifiable.

#thm([Corollary 1.2.])[
  #emph[For every $lambda in upright(bold(C))$, the hypersurface $f^(- 1) \( lambda \) subset
    bb(A)^4$ is isomorphic to $bb(A)^3$ and its embedding in $bb(A)^4$ is not rectifiable.]
] <cor:fibers>

#proof[
  Proposition 5 identifies each fiber with $bb(A)^3$; in particular,
    $\( f - lambda \)$ is its prime defining ideal. If an ambient automorphism takes $f^(- 1) \( lambda \)$ to a
    coordinate hyperplane, it takes its defining principal ideal to the ideal of a coordinate.
    The two generators therefore differ by a nonzero constant.
    This would make $f - lambda$, and hence $f$, a coordinate, contrary to Theorem 1. ◻
]

=== History and related methods <history-and-related-methods>

The coordinate question retains the embedding in affine space:
  it asks whether a given function can be made into a coordinate projection by an ambient automorphism.
  Cancellation asks instead whether an affine variety whose product with an affine line is an affine space must
  itself be an affine space. Makar-Limanov, van Rossum, Shpilrain,
  and Yu established an implication from the stable coordinate conjecture to cancellation in
  #cite(label("MakarLimanovRossumShpilrainYu2004")) Theorem 1.2.
  In our example the ambient variety is already $bb(A)^4$, and the obstruction concerns its distinguished polynomial.

The low-dimensional proof in #cite(label("ShpilrainYu2002")) proof of Proposition 1.1(c) uses curve cancellation
  and the Abhyankar–Moh embedding theorem in two variables.
  In three variables it combines affine-surface cancellation, using work of Fujita and Miyanishi–Sugie,
  with Kaliman’s theorem that a polynomial on $upright(bold(C))^3$ with general fiber $upright(bold(C))^2$ is a
  coordinate #cite(label("Kaliman2002")) Main Theorem.

The four-variable Vénéreau polynomials have been an important testing ground for these coordinate questions.
  Lewis proved that the second Vénéreau polynomial is a coordinate #cite(label("Lewis2013")).
  Blanc and Poloni developed a description in terms of affine bundles and bivariables, revisited that result,
  and proved one-stability for a broader family of related polynomials #cite(label("BlancPoloni2022"))
  Proposition 2.3. These results illustrate the distinction between exhibiting polynomial coordinates after
  stabilization and proving that a polynomial cannot occur in any original coordinate system.
  For the polynomial in Theorem 1, the first problem is settled by explicit substitutions;
  the second requires a derivation obstruction.

=== The construction and the obstruction <the-construction-and-the-obstruction>

The proof uses two presentations of the same four-variable polynomial ring.
  We first write it as a hypersurface $A = P \/ \( H \)$ in a five-variable polynomial ring $P$,
  with a distinguished element $p$. A determinant-preserving matrix transformation makes $H$ linear in one new
  coordinate. It identifies $A$ with $R$ and carries $p$ to the polynomial in (1.1).
  A second construction, using the exponential of a locally nilpotent derivation,
  shows that $p$ belongs to polynomial coordinates on $A \[ w \]$.
  These explicit changes of coordinates occupy Section 2.

To show that $p$ is not a coordinate, we put an integer-indexed filtration on $A$.
  Its associated graded ring has the form

$ G = B \[ tau \, I \/ tau \] subset B \[ tau \, tau^(- 1) \] \, wide B =
  k \[ x \, y \, z \, u \] \/ \( x y - z \( z + 1 \) \) \, $

where $I$ is an explicitly defined two-generated ideal of $B$ and $tau$ is the initial form of $p$.
  The notation $B \[ tau \, I \/ tau \]$ means the subalgebra generated by $B$, $tau$,
  and all elements $h \/ tau$ with $h in I$. If $p$ were a coordinate,
  differentiation in a suitable other coordinate would induce a nonzero locally nilpotent derivation $E$ on $B$
  whose kernel contains a nonzero element of $I$. Section 3 proves this implication,
  including the care needed for negative filtration degrees.

The last two sections exclude that invariant. Section 4 passes from $"Spec"
  B$ to the complement of the zero section in a line bundle. In its coordinate ring

$ C = k \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) \, $

the ideal $I$ becomes principal, generated by $v = a^3 b + a^2 u^2 - d^2$.
  The additive action defined by $E$ lifts to this bundle and commutes with fiber scaling.
  A nonzero invariant in $I$ would force the lifted derivation to annihilate $v$.
  In Section 5, a second grading reduces this to a derivation fixing $a \, d \, u$.
  Such a derivation has a coefficient that would simultaneously have to be a polynomial in $a \, d \,
  u$ and have negative fiber weight. This is impossible.

The graded-ring and line-bundle strategy adapts the construction in #cite(label("Cancellation2026")) Sections 2–6.
  That paper studies an affine-space cancellation example. Here the quadratic choice in the defining equation has
  two different uses: it permits the determinant-preserving change that makes $A$ polynomial,
  and it makes the highest auxiliary part of $v$ factor as $\( a u - d \) \( a u + d \)$.
  The latter factorization gives the final rigidity argument without a polynomial $a b c$ estimate.
  The passage to leading derivations follows the filtered methods of Kaliman and Makar-Limanov
  #cite(label("KalimanMakarLimanov2007")) Sections 3–5, and the lift of an additive action uses the line-bundle
  normalization argument of Brion #cite(label("Brion2015")) Lemma 2.9.
  Every construction and obstruction needed for Theorem 1 is proved below.

== 2 Polynomial presentation and stabilization <sec:construction>

We construct the counterexample through a hypersurface presentation of a four-variable polynomial ring.
  This presentation makes stabilization explicit and will also supply the filtration used to obstruct
  coordinateness. It adapts the construction of #cite(label("Cancellation2026")) Section 2,
  with quadratic terms that permit the polynomial change of coordinates below.

Let

#[#set math.equation(numbering: n => "(2.1)")
 $ P = k \[ p \, s \, u \, F \, J \] \, wide x = s^2 - u^2 + p F \,\
H = x^2 F - \( 1 + 2 s x \) J - p J^2 - u \, wide A = P \/ \( H \) . $ <con:presentation>]

The five generators of $P$ are independent. We use the same letters for their images in $A$;
  the distinguished element is $p in A$.

=== 2.1 A polynomial change of coordinates <a-polynomial-change-of-coordinates>

#thm([Proposition 2.1.])[
  #emph[There are polynomial coordinates $p' \, s' \, F' \, J$ on $A$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ x = \( s' \)^2 - J^2 + p' F' \, wide p = p' - 2 x #scale(x: 120%, y: 120%)[\(] x \( s' + J \) +
   p' J #scale(x: 120%, y: 120%)[\)] . $ <con:candidate>]

 Thus, under the identification $\( p' \, s' \, F' \, J \) = \( x_1 \, x_2 \, x_3 \, x_4 \)$,
   the element $p$ is the polynomial $f$ in Theorem 1.]
] <prop:polynomial>

#proof[
  The relation $H$ becomes linear after a change of coordinates preserving $x$. To exhibit that change, write
  $ M = mat(delim: "(", F, s - u; s + u, - p) \, wide e = binom(x, - J) \, wide n = binom(J, x) . $
  Then $x = - det M$, $e^(sans(t)) n = 0$, and
  $ H = e^(sans(t)) M e - J - u . $
  Keep $J$ fixed and define $F' \, s' \, u' \, p'$ by
  #[#set math.equation(numbering: n => "(2.3)")
   $ M' = \( I_2 - 2 n e^(sans(t)) \) M = mat(delim: "(", F', s' - u'; s' + u', - p') . $ <con:matrix-change>]
  Since $\( n e^(sans(t)) \)^2 = 0$ and $det \( I_2 - 2 n e^(sans(t)) \) = 1$, we have $- det M' = x$.
    Consequently $x$ and $J$, and hence $e$ and $n$, are unchanged by the substitution.
    Its inverse is the polynomial substitution
  $ M = \( I_2 + 2 n e^(sans(t)) \) M' \, wide x = - det M' \, $
  so $p' \, s' \, u' \, F' \, J$ form a coordinate system on $P$.
  Taking half the difference of the off-diagonal entries in Equation (2.3) gives
  $ u' = u - e^(sans(t)) M e \, wide H = - J - u' . $
  Eliminating $u'$ therefore identifies $A$ with $k \[ p' \, s' \, F' \, J \]$.
    In this quotient $u' = - J$, so the determinant identity gives the first formula in Equation (2.2).
    The lower-right entry of the inverse matrix identity gives
  $ p = p' - 2 x #scale(x: 120%, y: 120%)[\(] x \( s' - u' \) + p' J #scale(x: 120%, y: 120%)[\)] \, $
  which becomes the second formula after substituting $u' = - J$. ◻
]

The expression for $p$ in Equation (2.2) takes the values $0$ and $1$ at
  $\( p' \, s' \, F' \, J \) = \( 0 \, 0 \, 0 \, 0 \)$ and $\( 1 \, 0 \, 0 \, 0 \)$, respectively.
  In particular, $p$ is a nonzero nonunit of $A$.

=== 2.2 One-variable stabilization <one-variable-stabilization>

We next change the defining equation after adjoining one variable, while keeping $p$ fixed. For this purpose set

#[#set math.equation(numbering: n => "(2.4)")
 $ y = s + x \( x + u^2 \) \, wide z = s x + p J . $ <con:xyz>]

Expansion gives the identity

#[#set math.equation(numbering: n => "(2.5)")
 $ x y - z \( z + 1 \) = p \( H + u \) . $ <con:quadric-identity>]

Moreover,

#[#set math.equation(numbering: n => "(2.6)")
 $ P \[ p^(- 1) \] = k \[ p \, p^(- 1) \] \[ x \, y \, z \, u \] \, $ <con:localized-coordinates>]

with inverse coordinate formulas

#[#set math.equation(numbering: n => "(2.7)")
 $ s = y - x \( x + u^2 \) \, wide F = frac(x - s^2 + u^2, p) \, wide J = frac(z - s x, p) . $ <con:localized-inverse>]

#thm([Proposition 2.2.])[
  #emph[For an independent variable $w$, the ring $A \[ w \]$ is a polynomial ring in five variables with $p$ as
    one of its coordinates.]
] <prop:stable>

#proof[
  A derivation $delta$ of a $k$-algebra is #emph[locally nilpotent] if, for every element $g$,
    some iterate $delta^r \( g \)$ is zero. We use such a derivation to replace the equation $H = 0$ by $H + p w = 0$.
  In the coordinates of Equation (2.6), take
  $ Delta = - p frac(partial, partial u) \, wide Delta \( p \) = Delta \( x \) = Delta \( y \) = Delta \( z \) = 0 . $
  This locally nilpotent derivation of $P \[ p^(- 1) \]$ preserves $P$, because Equation (2.7) yields
  #[#set math.equation(numbering: n => "(2.8)")
   $ Delta \( p \) = 0 \, wide Delta \( u \) = - p \, wide Delta \( s \) = 2 p x u \,\
Delta \( F \) = - 4 s x u - 2 u \, wide Delta \( J \) = - 2 x^2 u . $ <con:delta>]
  Its restriction to $P$ is therefore locally nilpotent as well.
    Applying $Delta$ to Equation (2.5) gives $Delta \( H \) = p$.
    Extend $Delta$ to $P \[ w \]$ by $Delta \( w \) = 0$. The exponential
  $ exp \( w Delta \) \( g \) = sum_(r gt.eq 0) frac(w^r Delta^r \( g \), r !) $
  is a polynomial automorphism: each sum is finite, and its inverse is $exp \( - w Delta \)$.
    It fixes $p$ and sends $H$ to $H + p w$, inducing a $k \[ p \]$-algebra isomorphism
  #[#set math.equation(numbering: n => "(2.9)")
   $ A \[ w \] tilde.eq P \[ w \] \/ \( H + p w \) . $ <con:stabilized-hypersurface>]
  It remains to eliminate one variable from the equation on the right. Put $x_0 = s^2 - u^2$ and introduce
  #[#set math.equation(numbering: n => "(2.10)")
   $ L & = x_0^2 F - \( 1 + 2 s x_0 \) J \,\
N & = \( 1 - 2 s x_0 \) F + 4 s^2 J . $ <con:linear-coordinates>]
  The coefficient matrix of this substitution has determinant $4 s^2 x_0^2 + \( 1 + 2 s x_0 \) \( 1 - 2 s x_0 \) =
    1$; explicitly,
  #[#set math.equation(numbering: n => "(2.11)")
   $ F = 4 s^2 L + \( 1 + 2 s x_0 \) N \, wide J = - \( 1 - 2 s x_0 \) L + x_0^2 N . $ <con:linear-inverse>]
  Thus $p \, s \, u \, L \, N$ are polynomial coordinates on $P$. Expanding $x = x_0 + p F$ in $H$ gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ H = L - u + p Q_0 \, wide Q_0 = 2 x_0 F^2 + p F^3 - 2 s F J - J^2 . $ <con:H-expansion>]
  Since $Q_0 in P$, the substitution $w' = w + Q_0$ is another polynomial change of coordinates, and
  $ P \[ w \] \/ \( H + p w \) = k \[ p \, s \, u \, L \, N \, w' \] \/ \( L - u + p w' \) tilde.eq
    k \[ p \, s \, u \, N \, w' \] . $
  Together with Equation (2.9), this proves the assertion with $p$ fixed throughout.
    Composing with the identification in Proposition 3 and relabeling the target variables so that $p$ maps to
    $x_1$ gives an automorphism of $R \[ w \]$ sending $f$ to $x_1$. ◻
]

The two steps explicitly realize the exponential shift of #cite(label("DuttaLahiri2021")) Lemma 3.3 and the case
  of the transfer construction in #cite(label("EdoVenereau2001")) Theorem 7 in which the perturbation $p
  Q_0$ is divisible by $p$.

=== 2.3 The fibers <the-fibers>

The same coordinate computations describe every fiber of $p$.
  This will give a geometric consequence once noncoordinateness has been proved.

#thm([Proposition 2.3.])[
  #emph[For every $lambda in k$, the quotient $A \/ \( p - lambda \)$ is a polynomial ring in three variables over $k$.]
] <prop:fibers>

#proof[
  At $lambda = 0$, Equations (2.10)–(2.12) give
  $ A \/ \( p \) = k \[ s \, u \, L \, N \] \/ \( L - u \) = k \[ s \, u \, N \] . $
  For $lambda eq.not 0$, Equations (2.6) and (2.5) give
  $ A \/ \( p - lambda \) = k \[ x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) -
    lambda u #scale(x: 120%, y: 120%)[\)] tilde.eq k \[ x \, y \, z \] \, $
  by elimination of $u$. ◻
]

Propositions 3 and 4 establish the polynomial presentation and the stable-coordinate assertion of Theorem 1.
  The remaining task is to show that $p$ cannot be a coordinate of $A$ itself.

== 3 A graded obstruction to coordinateness <sec:filtration>

We now turn to the assertion that $p$ is not a coordinate of $A$.
  The first step is to pass to a weighted degeneration of $A$.
  If $p$ were a coordinate, differentiation in another coordinate would then produce a nonzero locally nilpotent
  derivation of a simpler quadric ring, with a nonzero invariant in an explicit ideal.
  The rest of the proof will exclude that possibility. The use of leading derivations follows the filtration
  methods of #cite(label("KalimanMakarLimanov2007")) Sections 3–5;
  the particular quadric construction is adapted from #cite(label("Cancellation2026")) Sections 3–5.

=== 3.1 The associated graded ring <the-associated-graded-ring>

Give the generators of $P = k \[ p \, s \, u \, F \, J \]$ the weights

#[#set math.equation(numbering: n => "(3.1)")
 $ & p & s & u & F & J\
upright("weight") & - 1 & 0 & 0 & 1 & 1 . $ <gr:weights>]

For $d in bb(Z)$, let $cal(F)_d P$ be the span of the monomials of weight at most $d$, and give $A =
  P \/ \( H \)$ the quotient filtration $cal(F)_d A = "im" \( cal(F)_d P arrow.r A \)$.
  These are increasing multiplicative filtrations, indexed by all integers. Their negative indices are essential:
  $p$ has weight $- 1$.

#thm([Proposition 3.1.])[
  #emph[The filtration on $A$ is exhaustive and separated. Its associated graded ring is the domain
#[#set math.equation(numbering: n => "(3.2)")
 $ G := "gr" A tilde.eq k \[ p \, s \, u \, F \, J \] \/ \( H_(*) \) \, wide H_(*) = x^2 F - \( 1 + 2 s x \) J -
   p J^2 \, quad x = s^2 - u^2 + p F \, $ <gr:presentation>]

 with the grading induced by (3.1). The filtration degrees of $p \, s \, u \, F \, J$ in $A$ are respectively $-
   1 \, 0 \, 0 \, 1 \, 1$.]
] <prop:graded>

#proof[
  Exhaustiveness follows because every element of $A$ has a polynomial representative.
    For $r > 0$, every monomial of weight at most $- r$ is divisible by $p^r$, so
  $ cal(F)_(- r) A subset.eq p^r A . $
  By Proposition 3, $A$ is a polynomial ring, and Equation (2.2) shows that $p$ is a nonzero nonunit.
    Therefore $⋂_(r > 0) p^r A = 0$: in a unique factorization domain,
    a nonzero element cannot be divisible by arbitrarily high powers of an irreducible factor of $p$.
    This proves separation. In particular, every nonzero $a in A$ has a well-defined degree
  $ deg a = min { d in bb(Z) : a in cal(F)_d A } $
  and a nonzero initial form in $cal(F)_d A \/ cal(F)_(d - 1) A$.
  The element $x$ is homogeneous of weight zero in $P$, and $H = H_(*) - u$ has highest weight part $H_(*)$,
    of weight one. For every nonzero $q in P$, the highest weight part of $q H$ is $\( "in" q \) H_(*)$:
    the polynomial ring is a graded domain, so the product of the highest parts does not vanish.
    Consequently the ideal of initial relations is exactly $\( H_(*) \)$.
    For completeness, the natural graded map $P arrow.r "gr" A$ sends a homogeneous polynomial of weight $d$ to
    its class in $cal(F)_d A \/ cal(F)_(d - 1) A$, which may at this stage be zero. This map is surjective.
    A homogeneous polynomial of weight $d$ lies in its kernel exactly when its image in $A$ has a representative
    of weight at most $d - 1$; subtracting that representative gives a relation with the original polynomial as
    its highest part. Thus the kernel is the ideal of initial relations, proving (3.2).
  To prove that this quotient is a domain, use the polynomial coordinates $x \, y \, z \,
    u$ of $P \[ p^(- 1) \]$ from the preceding section. The identity $x y - z \( z + 1 \) = p \( H + u \)$ becomes
  $ p H_(*) = x y - z \( z + 1 \) . $
  The polynomial on the right is irreducible over $k \[ p \, p^(- 1) \, x \, z \, u \]$:
    as a polynomial in $y$, it is primitive, because $x$ and $z \( z + 1 \)$ are coprime,
    and it has degree one over the fraction field. Thus $H_(*)$ is irreducible after inverting $p$.
    It is not divisible by $p$ before localization, since its reduction modulo $p$ is
  $ \( s^2 - u^2 \)^2 F - #scale(x: 120%, y: 120%)[\(] 1 + 2 s \( s^2 - u^2 \) #scale(x: 120%, y: 120%)[\)] J
    eq.not 0 . $
  Any factorization of $H_(*)$ in $P$ has a factor that becomes a unit after inverting $p$,
    hence is a scalar times a power of $p$. Since $p divides.not H_(*)$, this factor is already a unit in $P$.
    Thus $H_(*)$ is irreducible in $P$, and hence prime by unique factorization.
    Finally, $H_(*)$ is not associated to any of the five variables, so their classes in $G$ are nonzero.
    These classes are the initial forms of the corresponding elements of $A$, proving the asserted degrees. ◻
]

=== 3.2 A quadric and its distinguished ideal <a-quadric-and-its-distinguished-ideal>

From now on write $tau$ for the class of $p$ in $G$, to distinguish the graded ring from $A$. Consider the quadric ring

#[#set math.equation(numbering: n => "(3.3)")
 $ B = k \[ x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y -
   z \( z + 1 \) #scale(x: 120%, y: 120%)[\)] . $ <gr:quadric>]

The formulas

$ x = s^2 - u^2 + tau F \, wide y = s + x \( x + u^2 \) \, wide z = s x + tau J $

define elements of degree zero in $G$. They satisfy the relation in (3.3); after inverting $tau$,
  the inverse coordinate formulas from the preceding section give an isomorphism

#[#set math.equation(numbering: n => "(3.4)")
 $ G \[ tau^(- 1) \] = B \[ tau \, tau^(- 1) \] \, wide deg B = 0 \, quad deg tau = - 1 . $ <gr:localization>]

In particular, the induced map $B arrow.r G$ is injective:
  its composition with localization is the inclusion of $B$ in this Laurent polynomial ring.
  We henceforth regard $B$ as a subring of $G$.

Define elements and an ideal of $B$ by

#[#set math.equation(numbering: n => "(3.5)")
 $ s_B & = y - x \( x + u^2 \) \,\
f_0 & = x - s_B^2 + u^2 \, wide g_0 = z - s_B x \, wide I = \( f_0 \, g_0 \) . $ <gr:ideal>]

In (3.4) we have $s = s_B$, $F = f_0 \/ tau$, and $J = g_0 \/ tau$. These identities give the more precise description

#[#set math.equation(numbering: n => "(3.6)")
 $ G = B \[ tau \, I \/ tau \] = B \[ tau \, f_0 \/ tau \, g_0 \/ tau \] subset B \[ tau \, tau^(- 1) \] .
   $ <gr:modification>]

This is the algebraic construction of an affine modification, with divisor $tau =
  0$ and center $\( tau \, I \)$ in $B \[ tau \]$; see #cite(label("KalimanZaidenberg1999")) Definition 1.1 and
  Proposition 1.1(b). We will only need its explicit homogeneous pieces.

#thm([Lemma 3.2.])[
  #emph[For each integer $ell > 0$, the degree-$ell$ piece of $G$ is
$ G_ell = tau^(- ell) I^ell . $

]
] <gr:positive-piece>

#proof[
  A monomial in the generators in (3.6), with coefficient in $B$, has the form
  $ b thin tau^r \( f_0 \/ tau \)^i \( g_0 \/ tau \)^j \, wide r \, i \, j gt.eq 0 . $
  It has degree $ell$ exactly when $i + j - r = ell$. In that case it equals $tau^(- ell) b f_0^i g_0^j$,
    whose numerator belongs to $I^(ell + r) subset.eq I^ell$.
    Since the presentation is homogeneous, such monomials span $G_ell$.
    Conversely, every element of $I^ell$ is a $B$-linear combination of the products $f_0^i g_0^j$ with $i + j =
    ell$, and dividing these products by $tau^ell$ gives elements of $G_ell$. ◻
]

=== 3.3 What a coordinate would force <what-a-coordinate-would-force>

The ideal $I$ records the positive part of the grading. We now show why a hypothetical coordinate system
  containing $p$ supplies a nonzero locally nilpotent derivation of $B$ fixing a nonzero element of $I$.

#thm([Proposition 3.3.])[
  #emph[If $p$ is a coordinate of $A$, then there exist a nonzero locally nilpotent derivation $E$ of the ring $B$
    in (3.3) and an element $0 eq.not h in I$ such that $E \( h \) = 0$.]
] <prop:coordinate-obstruction>

#proof[
  Suppose $A = k \[ p \, q_1 \, q_2 \, q_3 \]$ for a polynomial coordinate system.
    At least one $q_i$ has strictly positive filtration degree.
    Indeed, if all three had degree at most zero, then so would every polynomial in $p \, q_1 \, q_2 \, q_3$,
    contrary to $deg F = 1$. Relabel so that $deg q_1 > 0$, and take
  $ D = frac(partial, partial q_2) . $
  This is a nonzero locally nilpotent derivation of $A$ satisfying $D \( p \) = D \( q_1 \) = 0$.
  We give the details of its passage to $G$, because the filtration has both positive and negative indices.
    Write $omega \( t \)$ for the assigned weight of a generator $t in { p \, s \, u \, F \, J }$, and put
  #[#set math.equation(numbering: n => "(3.7)")
   $ m = max_(D \( t \) eq.not 0) #scale(x: 120%, y: 120%)[\(] deg D \( t \) -
     omega \( t \) #scale(x: 120%, y: 120%)[\)] . $ <gr:shift>]
  This maximum is defined: a nonzero derivation cannot kill all algebra generators.
    The product rule shows that a monomial of weight at most $d$ has derivative in $cal(F)_(d + m) A$.
    Every element of $cal(F)_d A$ has a representative that is a sum of such monomials,
    by the definition of the quotient filtration. Thus
  $ D \( cal(F)_d A \) subset.eq cal(F)_(d + m) A wide \( d in bb(Z) \) . $
  It follows that $D$ induces a homogeneous derivation $D_0$ of $G$ of degree $m$.
    For $a in cal(F)_d A$, write $\[ a \]_d$ for its class in $cal(F)_d A \/ cal(F)_(d - 1) A$. Explicitly,
  #[#set math.equation(numbering: n => "(3.8)")
   $ D_0 \( \[ a \]_d \) = \[ D \( a \) \]_(d + m) \, wide D_0^r \( \[ a \]_d \) = \[ D^r \( a \) \]_(d + r m)
     quad \( r gt.eq 0 \) . $ <gr:iterate>]
  The first formula is well-defined because $D$ also sends $cal(F)_(d - 1) A$ into $cal(F)_(d + m - 1) A$;
    the second follows by induction. It proves that $D_0$ is locally nilpotent,
    first on homogeneous elements and then on finite sums of them.
    Moreover, equality is attained in (3.7) for some generator $t$,
    whose initial form has degree $omega \( t \)$ by Proposition 6.
    Its image under $D_0$ is the nonzero initial form of $D \( t \)$, so $D_0 eq.not 0$.
    Finally, (3.8) shows that $D_0$ kills both $tau$ and the nonzero initial form $eta$ of $q_1$.
    The latter is homogeneous of degree $ell = deg q_1 > 0$.
  Because $D_0 \( tau \) = 0$, extending $D_0$ to $G \[ tau^(- 1) \] =
    B \[ tau \, tau^(- 1) \]$ preserves local nilpotence. Homogeneity implies that there is a derivation $E :
    B arrow.r B$ with
  #[#set math.equation(numbering: n => "(3.9)")
   $ D_0 \( b \) = tau^(- m) E \( b \) wide \( b in B \) . $ <gr:descent>]
  Indeed, every degree-$m$ element of the Laurent ring is uniquely $tau^(- m)$ times an element of $B$.
    The derivation $E$ is nonzero: otherwise $D_0$ would kill both $B$ and $tau$,
    hence the whole Laurent ring and its subring $G$. It is locally nilpotent because
  $ E^r \( b \) = tau^(r m) D_0^r \( b \) wide \( b in B \, r gt.eq 0 \) . $
  Here, as in (3.8), the formula follows by induction, using that $D_0$ fixes $tau$.
  By Lemma 7, write $eta = tau^(- ell) h$ with $0 eq.not h in I^ell$. Equations (3.9) and $D_0 \( eta \) = 0$ give
  $ 0 = D_0 \( eta \) = tau^(- m - ell) E \( h \) . $
  Thus $E \( h \) = 0$, and $I^ell subset.eq I$ because $ell > 0$. ◻
]

Proposition 8 has removed the original coordinate system from the problem.
  It remains to show that no nonzero locally nilpotent derivation of $B$ can have a nonzero invariant in $I$.
  We will make this ideal principal after pulling it back to the complement of the zero section in a line bundle,
  where a second grading gives the contradiction.

== 4 Lifting the obstruction to a line bundle <sec:bundle>

Proposition 8 reduces noncoordinateness to excluding a nonzero locally nilpotent derivation $E$ of $B$ with a
  nonzero invariant in $I = \( f_0 \, g_0 \)$. We pull $I$ back to the complement of the zero section in a line
  bundle over $"Spec" B$; on this complement the ideal becomes principal.
  Every additive action on the base lifts linearly to the line bundle and preserves this complement.
  Consequently, an invariant in $I$ will force the lifted action to fix one specific polynomial.
  This use of the quadric and its line bundle adapts the construction of #cite(label("Cancellation2026"))
  Sections 4–6; all the lifting and principalization arguments needed here are proved below.

Put $Y = "Spec" B$ and define

#[#set math.equation(numbering: n => "(4.1)")
 $ C = k \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) . $ <bun:C>]

The assignment

#[#set math.equation(numbering: n => "(4.2)")
 $ x = a b \, wide y = d c \, wide z = d b \, wide u = u $ <bun:base-map>]

defines a homomorphism $B arrow.r C$, since $x y = a b d c = \( d b \) \( a c \) = z \( z + 1 \)$.
  The ring $C$ is a domain: the polynomial $a c - b d - 1$,
  viewed as a primitive linear polynomial in $c$ over $k \[ a \, d \, b \, u \]$, is irreducible.
  We give $C$ the #emph[fiber weights]

#[#set math.equation(numbering: n => "(4.3)")
 $ "wt" \( a \, d \, b \, c \, u \) = \( 1 \, 1 \, - 1 \, - 1 \, 0 \) . $ <bun:fiber-weights>]

The relation is homogeneous of weight zero, and the image of $B$ has weight zero.
  These weights describe the action of $bb(G)_m$ that scales the fibers of the following bundle.
  Geometrically this is the familiar quotient of $upright("SL")_2$ by a diagonal torus, times the affine $u$-line;
  see #cite(label("BlancVanSanten2019")) p. 8431. We use explicit charts throughout.

#thm([Lemma 4.1.])[
  #emph[The map $B arrow.r C$ is injective. The morphism $"Spec" C arrow.r
    Y$ is the complement of the zero section in a line bundle $cal(L) arrow.r Y$. It is trivial over the open cover
$ U_0 = D \( z + 1 \) \, wide U_1 = D \( z \) $

 of $Y$, with respective invertible fiber coordinates $a$ and $d$.]
] <bun:charts>

#proof[
  Over $U_0$, the identity $a c = z + 1$ makes $a$ invertible. The formulas
  #[#set math.equation(numbering: n => "(4.4)")
   $ c = frac(z + 1, a) \, wide b = x / a \, wide d = frac(a y, z + 1) $ <bun:chart-a>]
  give an isomorphism $C \[ \( z + 1 \)^(- 1) \] = B \[ \( z + 1 \)^(- 1) \] \[ a \, a^(- 1) \]$.
    In particular the localized map from $B$ is injective, and so is the original map because $B$ is a domain.
    Over $U_1$, the corresponding formulas are
  #[#set math.equation(numbering: n => "(4.5)")
   $ b = z / d \, wide c = y / d \, wide a = frac(x d, z) \, $ <bun:chart-d>]
  and give $C \[ z^(- 1) \] = B \[ z^(- 1) \] \[ d \, d^(- 1) \]$.
    The opens cover $Y$ because $z$ and $z + 1$ generate the unit ideal. On their overlap the fiber coordinates satisfy
  #[#set math.equation(numbering: n => "(4.6)")
   $ d = frac(y, z + 1) thin a \, $ <bun:transition>]
  where $y \/ \( z + 1 \)$ is a unit with inverse $x \/ z$.
    Gluing the trivial line bundles by this transition gives $cal(L)$;
    removing their zero sections gives precisely the two charts of $"Spec" C$ above.
    Both fiber coordinates have weight one, so the scaling agrees with (4.3). ◻
]

The two generators of $I$ acquire a common factor in $C$. Define

#[#set math.equation(numbering: n => "(4.7)")
 $ v = a^2 \( x + u^2 \) - d^2 = a^3 b + a^2 u^2 - d^2 in C . $ <bun:v>]

#thm([Lemma 4.2.])[
  #emph[The extended ideal $I C$ is the principal ideal $\( v \)$.]
] <bun:principalization>

#proof[
  In $C \[ a^(- 1) \]$, put $xi = d \/ a$ and $j = x + u^2 - xi^2$. The determinant relation and (4.2) give
  $ z = xi x \, wide y = xi + xi^2 x \, wide s_B = y - x \( x + u^2 \) = xi - x j . $
  Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ f_0 = \( 1 + 2 xi x - x^2 j \) j \, wide g_0 = x^2 j \, wide v = a^2 j . $ <bun:ideal-chart>]
  The two coefficients of $j$ generate the unit ideal, as the identity
  $ \( 1 - 2 xi x \) \( 1 + 2 xi x - x^2 j \) + x^2 \( 4 xi^2 + j - 2 xi x j \) = 1 $
  shows. Thus $I C \[ a^(- 1) \] = \( j \) = \( v \)$.
  It remains to check primes of $C$ containing $a$. Modulo such a prime, $b d = - 1$, while $x = 0$ and $z = - 1$.
    Hence $g_0 = z - s_B x$ has nonzero residue $- 1$, and $v$ has nonzero residue $- d^2$.
    Both are units in the corresponding local ring. The ideals $I C$ and $\( v \)$ therefore agree at every prime,
    which proves the assertion. ◻
]

Figure 1 records the geometric meaning of this ideal equality:
  the inverse image of $V \( I \)$ is cut out by the single function $v$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$V \( v \)$])
  content((2.783, 0), [$"Spec" C$])
  content((0, -1.585), [$V \( I \)$])
  content((2.783, -1.585), [$Y = "Spec" B$])
  line((0.534, 0), (2.117, 0), mark: (end: ">"))
  line((0.534, 0), (0.534, 0.3))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((2.783, -0.2725), (2.783, -1.313), mark: (end: ">"))
  line((0.534, -1.585), (1.919, -1.585), mark: (end: ">"))
  line((0.534, -1.585), (0.534, -1.285))
})],
  caption: [Figure 1: A Cartesian square of closed subschemes. Pulling $I$ to the complement of the zero section of $cal(L)$ gives the principal ideal $\( v \)$. In particular, every $h in I$ pulls back to a multiple of $v$. ],
) <bun:figure>

We next lift additive actions from $Y$ to $cal(L)$. The elementary reason that a lift exists is that adjoining an
  affine-line parameter does not change line bundles on $Y$.

#thm([Lemma 4.3.])[
  #emph[Every line bundle on $bb(A)^1 times Y$ is isomorphic to the pullback of its restriction to ${ 0 } times Y$.]
] <bun:homotopy>

#proof[
  The two charts of Lemma 9 have coordinate rings
  $ B \[ \( z + 1 \)^(- 1) \] & = k \[ x \, t \, u \, \( x t + 1 \)^(- 1) \] \, & t & = frac(y, z + 1) \, quad z =
    x t \,\
B \[ z^(- 1) \] & = k \[ x \, t \, u \, \( x t - 1 \)^(- 1) \] \, & t & = y / z \, quad z = x t - 1 . $
  Here $t$ denotes a separate coordinate on each chart. Each ring,
    and its polynomial extension by the affine-line coordinate $T$, is a noetherian unique factorization domain.
    A line bundle on the spectrum of such a ring is trivial: its divisor class is represented by a Cartier
    divisor, and unique factorization makes every divisor principal.
  Let $cal(M)$ be a line bundle on $bb(A)^1 times Y$. Choose trivializations on $bb(A)^1 times
    U_0$ and $bb(A)^1 times U_1$. Its transition function belongs to
    $B \[ z^(- 1) \, \( z + 1 \)^(- 1) \] \[ T \]^(*)$. A polynomial over a domain is a unit only when it is a
    constant unit, so this transition function is independent of $T$.
    Its specialization at $T = 0$ is therefore the same transition function.
    The chosen trivializations identify $cal(M)$ with the pullback of its restriction at zero. ◻
]

The lifting argument has a useful general form. Its normalization step is the standard one for linearizing a line
  bundle under an additive action; compare #cite(label("Brion2015")) Lemma 2.9.

#thm([Lemma 4.4.])[
  #emph[Let $X$ be an affine integral $k$-variety such that every line bundle on $bb(A)^1 times
    X$ is the pullback of its restriction at zero. Every $bb(G)_a$-action on $X$ lifts to any line bundle on $X$
    by maps linear on fibers, commuting with fiber scaling.]
] <bun:action-lift>

#proof[
  Write $R = k \[ X \]$, let $cal(M)$ be the line bundle, and let $alpha : bb(A)^1 times X arrow.r
    X$ be the action. If $pi : bb(A)^1 times X arrow.r X$ is projection,
    then $alpha^(*) cal(M)$ and $pi^(*) cal(M)$ restrict to $cal(M)$ at parameter zero.
    The hypothesis therefore supplies an isomorphism
  $ eta : pi^(*) cal(M) arrow.r alpha^(*) cal(M) . $
  At zero, $eta$ is an automorphism of $cal(M)$, hence multiplication by a unit of $R$.
    Multiplying $eta$ by the inverse pullback of that unit normalizes it to the identity at zero.
  The isomorphism $eta$ gives a fiberwise linear lift of $alpha$.
    To check the group law, compare, over $bb(A)^2 times X$, the map on fibers obtained by applying parameters $S$
    and then $T$ with the map obtained by applying $T + S$. Both are global isomorphisms of the same source and
    target line bundles, with fiber maps from $cal(M)_x$ to $cal(M)_(alpha \( T + S \, x \))$.
    Their ratio is an automorphism of the source line bundle.
    Its endomorphism sheaf is canonically $cal(O)$, so this automorphism is multiplication by a global unit in
    $R \[ T \, S \]$. Since $R$ is a domain, this unit is independent of $T \, S$.
    At $\( T \, S \) = \( 0 \, 0 \)$ it equals one by the normalization of $eta$. Thus the group law holds.
    The resulting action is linear on fibers, so it commutes with fiber scaling and preserves the complement of
    the zero section. ◻
]

We will also use the following elementary property of locally nilpotent derivations;
  see #cite(label("KalimanMakarLimanov2007")) Proposition 2.1(3).

#thm([Lemma 4.5.])[
  #emph[Let $R$ be a domain over a field of characteristic zero and let $delta$ be a locally nilpotent derivation
    of $R$. If $r \, s in R$ are nonzero and $delta \( r s \) = 0$, then $delta \( r \) = delta \( s \) = 0$.]
] <bun:factorial-closure>

#proof[
  The exponential $exp \( T delta \)$ takes values in $R \[ T \]$. If $r s$ is fixed, then
  $ exp \( T delta \) \( r \) thin exp \( T delta \) \( s \) = r s . $
  Degrees in $T$ add under multiplication of nonzero polynomials over a domain.
    Both factors on the left therefore have degree zero, and their coefficients of $T$ give the assertion. ◻
]

#thm([Proposition 4.6.])[
  #emph[Let $E$ be a nonzero locally nilpotent derivation of $B$ such that $I ∩ ker E eq.not 0$.
    There is a nonzero locally nilpotent derivation $tilde(E)$ of $C$ that extends $E$, preserves fiber weights,
    and satisfies $tilde(E) \( v \) = 0$.]
] <prop:lift>

#proof[
  The exponential of $E$ defines an additive-group action on $Y$.
    By Lemmas 11 and 12, it lifts to $cal(L)$ by fiberwise linear maps.
    Restrict to the complement of the zero section, namely $"Spec" C$.
    Differentiating this action at the identity gives a derivation $tilde(E)$ of $C$.
    The action law expresses its pullback on each function as $sum_(r gt.eq 0) T^r tilde(E)^(thin r) \/ r !$;
    because the action is algebraic, the sum is finite for each function. Hence $tilde(E)$ is locally nilpotent.
    It extends $E$ and is nonzero, and commutation with fiber scaling says exactly that it preserves the weights (4.3).
  Finally choose $0 eq.not h in I ∩ ker E$. The inclusion $B subset C$ and Lemma 10 give a factorization $h =
    v q$ in $C$, with both factors nonzero. Since $tilde(E) \( h \) = 0$, Lemma 13 yields $tilde(E) \( v \) = 0$. ◻
]

== 5 Rigidity and the coordinate obstruction <sec:rigidity>

Proposition 14 converts the hypothetical invariant in $I$ into a locally nilpotent derivation of $C$ that fixes
  $v$ and preserves fiber weights. We now rule out such a derivation.
  An auxiliary grading isolates the difference of squares $a^2 u^2 - d^2$ inside $v$.
  Its two factors force three generators to be invariant, leaving a coefficient whose required fiber weight is
  impossible.

#thm([Proposition 5.1.])[
  #emph[There is no nonzero locally nilpotent derivation of $C =
    k \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \)$ that preserves the fiber weights (4.3) and annihilates
    $v = a^3 b + a^2 u^2 - d^2$.]
] <prop:rigidity>

#proof[
  Suppose that $tilde(E)$ is such a derivation. Give $C$ the auxiliary grading in the second row of the following table:
  #[#set math.equation(numbering: n => "(5.1)")
   $ & a & d & b & c & u\
upright("fiber weight") & 1 & 1 & - 1 & - 1 & 0\
upright("auxiliary degree") & 0 & 1 & - 1 & 0 & 1 $ <rig:gradings>]
  The two gradings are compatible because $a c - b d - 1$ is homogeneous of degree zero for each.
    The auxiliary degrees of the two parts of $v$ are
  $ deg_(upright("aux")) \( a^3 b \) = - 1 \, wide deg_(upright("aux")) \( a^2 u^2 - d^2 \) = 2 . $
  Decompose $tilde(E)$ into its homogeneous components for auxiliary degree shift,
    and let $E'$ be the nonzero component with largest shift, say $m$. There are only finitely many components:
    a derivation is determined by its values on the five homogeneous generators,
    and each value is a finite sum of homogeneous terms. Each component is a derivation by the product rule.
    Moreover, $E'$ is locally nilpotent. Indeed, for homogeneous $r in C$ of auxiliary degree $e$,
    the component of auxiliary degree $e + n m$ in $tilde(E)^(thin n) \( r \)$ is $\( E' \)^n \( r \)$.
    For sufficiently large $n$ the former expression vanishes, so the latter vanishes as well.
    Homogeneous elements span $C$, proving local nilpotence on every element.
    Since the gradings in (5.1) are compatible, $E'$ still preserves fiber weights.
  Taking the component of degree $m + 2$ in $tilde(E) \( v \) = 0$ gives
  $ E' \( a^2 u^2 - d^2 \) = 0 . $
  The factorization
  $ a^2 u^2 - d^2 = \( a u - d \) \( a u + d \) $
  and Lemma 13 imply that $E'$ annihilates both $a u - d$ and $a u + d$.
    Thus $E' \( d \) = E' \( a u \) = 0$, and another application of that lemma gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ E' \( a \) = E' \( d \) = E' \( u \) = 0 . $ <rig:fixed>]
  All the factors used here are nonzero; for example, after inverting $a$ one has
  #[#set math.equation(numbering: n => "(5.3)")
   $ C \[ a^(- 1) \] = k \[ a \, a^(- 1) \, d \, u \] \[ b \] \, wide c = frac(1 + b d, a) \, $ <rig:a-chart>]
  where their nonvanishing is immediate.
  It remains to control the possible values of $E'$ on $b \, c$.
    Differentiating $a c - b d = 1$ and using (5.2) yields $a E' \( c \) = d E' \( b \)$. Define
  $ q = c E' \( b \) - b E' \( c \) in C . $
  Multiplication by $a$ and $d$, respectively, then gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ E' \( b \) = a q \, wide E' \( c \) = d q . $ <rig:q>]
  The element $q$ is nonzero, since otherwise $E'$ would kill every generator.
    We claim that $q$ belongs to the polynomial subring $k \[ a \, d \, u \]$.
  The elements $a \, d \, u$ are algebraically independent by (5.3).
    Put $K = k \( a \, d \, u \)$ and localize $C$ at the nonzero elements of $k \[ a \, d \, u \]$.
    Because these elements lie in $ker E'$, the localized derivation remains locally nilpotent.
    The resulting algebra is $K \[ b \]$, with $c = \( 1 + b d \) \/ a$.
    A locally nilpotent $K$-derivation of $K \[ b \]$ sends $b$ into $K$:
    if its value $P \( b \)$ had degree at least one, iterating $P \( b \) thin d \/ d
    b$ on $b$ would never give zero. More explicitly, differentiation of a nonconstant polynomial multiplies its
    nonzero leading coefficient by its positive degree, and multiplication by $P$ then leaves the result
    nonconstant. Equation (5.4) therefore gives $q in K$.
  To compute $C ∩ K$ inside the fraction field of $C$, use both coordinate charts:
  $ C \[ a^(- 1) \] = k \[ a \, a^(- 1) \, d \, u \] \[ b \] \, wide C \[ d^(- 1) \] =
    k \[ a \, d \, d^(- 1) \, u \] \[ c \] . $
  An element of the first polynomial ring lying in $K$ has no $b$ terms,
    and an element of the second lying in $K$ has no $c$ terms. Hence
  $ C ∩ K subset k \[ a \, a^(- 1) \, d \, u \] ∩ k \[ a \, d \, d^(- 1) \, u \] = k \[ a \, d \, u \] . $
  The last equality follows from unique factorization in $k \[ a \, d \, u \]$:
    a reduced denominator that is both a power of $a$ and a power of $d$ is a unit.
    The reverse inclusion is immediate, proving the claim.
  Finally, preservation of fiber weights makes $E' \( b \)$ have weight $- 1$.
    By (5.4), the nonzero polynomial $q$ has weight $- 2$. This is impossible in $k \[ a \, d \, u \]$,
    whose generators have weights $1 \, 1 \, 0$. The contradiction proves the proposition. ◻
]

#proof[
  By Proposition 3, the algebra $A$ is a polynomial ring in four variables and its element $p$ becomes the
    polynomial $f$ stated in the theorem. Proposition 4 makes $p$ a coordinate of $A \[ w \]$.
    If $p$ were a coordinate of $A$, Proposition 8 would produce a nonzero locally nilpotent derivation $E$ of $B$
    with $I ∩ ker E eq.not 0$. Proposition 14 would then supply a derivation forbidden by Proposition 15.
    Thus $p$ is not a coordinate of $A$. Transporting these two properties through the polynomial presentation
    proves the assertion for $f$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
