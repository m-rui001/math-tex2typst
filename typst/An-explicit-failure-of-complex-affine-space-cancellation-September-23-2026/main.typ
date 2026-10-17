#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 81.7pt, y: 81.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[An explicit failure of complex affine-space cancellation]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Zariski cancellation problem asks whether an affine variety is determined by its cylinder when that cylinder is affine space. Over the complex numbers, its algebraic formulation is the implication

#[#set math.equation(numbering: n => "(1.1)")
 $ A \[ w \] tilde.eq bb(C)^(\[ n + 1 \]) quad arrow.r.double quad A tilde.eq bb(C)^(\[ \]) n \, $ <eq:cancellation-question>]

where $A$ is a finitely generated commutative unital complex algebra, $w$ is an independent polynomial variable, and all isomorphisms fix the complex scalars. Here $C^(\[ \]) r$ denotes a polynomial ring in $r$ variables over a ring $C$. The hypothesis says that adjoining one variable turns $A$ into a polynomial ring; the question is whether that variable can be cancelled. An isomorphism of cylinders need not respect the given projection to the affine line, so its existence alone does not identify polynomial coordinates on $A$.

Cancellation for the affine line follows from the work of Abhyankar, Heinzer, and Eakin [1] Corollary (2.8). Cancellation for the complex affine plane was established through the work of Fujita, Miyanishi, and Sugie [10,21], using the structure of affine surfaces and cylinderlike open sets. In positive characteristic, Asanuma’s work on polynomial fiber rings supplied threefolds whose one-variable cylinders are affine four-space [2]. Gupta proved that suitable members of this family are not affine three-space over their ground field [12], then established failure of cancellation in every dimension at least three over every field of positive characteristic [13]. The latter result uses a separate family of examples: adjoining variables to a threefold whose first cylinder is already polynomial would not produce higher-dimensional counterexamples.

The characteristic-zero problem in dimensions at least three is still listed as open in Gaifullin–Petrov’s July 2026 preprint [11] p. 1. Gupta’s survey [14] explains its history and its connections with coordinates, polynomial fibrations, and the recognition of affine space. We give a negative answer to (1.1) over $bb(C)$ for $n = 4$. The defining polynomial also gives a negative answer to the Stable Coordinate Conjecture over $bb(C)$ in ambient dimension five, already after adjoining one variable.

Let $p \, s \, u \, F \, J$ be algebraically independent over $bb(C)$, and set

#[#set math.equation(numbering: n => "(1.2)")
 $ P & = bb(C) \[ p \, s \, u \, F \, J \] \, #h(2em) x = s^2 + u^3 + p^2 F \,\
H & = x^2 F - \( 1 + 2 s x \) J - p^2 J^2 - p u \, #h(2em) A = P \/ \( H \) . $ <eq:example>]

Thus $x$ is an abbreviation for the displayed polynomial, and $H$ is a polynomial in exactly the five indicated variables.

#thm([Theorem 1.1.])[
  #emph[The algebra $A$ in (1.2) is an integral complex algebra of dimension four. For an independent variable $w$, 
$ A \[ w \] tilde.eq bb(C)^(\[ 5 \]) \, #h(2em) A tilde.eq.not bb(C)^(\[ 4 \]) . $

 Consequently the Zariski cancellation problem over the complex numbers has a negative answer in dimension four.]
] <thm:main>

===== 1.1 The polynomial cylinder. <the-polynomial-cylinder.>

The stabilization belongs to the theory of residual and stable coordinates. A polynomial in $bb(C) \[ p \]^(\[ 4 \])$ is a #emph[residual coordinate] if its image is a polynomial coordinate over the residue field of every prime of $bb(C) \[ p \]$; it is #emph[one-stably a coordinate] if it becomes a coordinate after adjoining one variable. Our $H$ is a residual coordinate: it is a coordinate after inverting $p$, while a linear change in $F \, J$ makes its reduction at $p = 0$ a coordinate. Its one-stability therefore follows from the theorem of El Kahoui–Ouali [8] Theorem 1.1, generalized by Dutta–Lahiri [6] Theorem 3.4.

The Stable Coordinate Conjecture asks whether a polynomial $f in bb(C)^(\[ \]) n$ that becomes a coordinate in $bb(C)^(\[ n + 1 \])$ after adjoining one variable must already be a coordinate in $bb(C)^(\[ \]) n$ [18] p. 342. The assertion concerns polynomial automorphisms of the ambient spaces.

#thm([Corollary 1.2.])[
  (Failure of the Stable Coordinate Conjecture).  #emph[The polynomial $H$ in (1.2) is not a coordinate of $P = bb(C) \[ p \, s \, u \, F \, J \]$, but it is a coordinate of $P \[ w \]$ for one independent variable $w$. Thus the Stable Coordinate Conjecture over $bb(C)$ fails in ambient dimension five after one stabilization.]
] <cor:stable-coordinate>

#proof[
  Since $H$ is a residual coordinate of $P = bb(C) \[ p \]^(\[ 4 \])$, the theorem of Dutta–Lahiri [6] Theorem 3.4, applied with $R = bb(C) \[ p \]$ and four relative variables, gives $G_2 \, G_3 \, G_4 \, G_5 in P \[ w \]$ such that
  $ P \[ w \] = bb(C) \[ p \] \[ H \, G_2 \, G_3 \, G_4 \, G_5 \] = bb(C) \[ p \, H \, G_2 \, G_3 \, G_4 \, G_5 \] . $
  Hence $H$ is a coordinate of $P \[ w \]$ as a $bb(C)$-algebra. If $H$ were a coordinate of $P$ as a $bb(C)$-algebra, quotienting a polynomial coordinate system containing $H$ by $\( H \)$ would give $A = P \/ \( H \) tilde.eq bb(C)^(\[ 4 \])$, contrary to 1. ◻
]

A derivation $D$ is #emph[locally nilpotent] if every element is killed by some iterate of $D$; over $bb(C)$, its exponential is an algebraic action of the additive group $bb(G)_a$. We make the stabilization method explicit. A locally nilpotent derivation of $P$ sends $H$ to $p^3$. Exponentiating it converts $H$ into $H + p^3 w$, and a coordinate calculation identifies the resulting quotient with a polynomial ring. This exponential-shift argument follows the method of El Kahoui–Ouali [8] Lemma 3.1 and proof of Theorem 1.1; the final coordinate change realizes the transfer criterion of Edo–Vénéreau [7] Theorem 7. We include its polynomial inverse and the divisibility that makes it valid at $p = 0$.

===== 1.2 Affine-space fibrations. <affine-space-fibrations.>

An $bb(A)^3$-fibration is a morphism of complex affine varieties whose base change to every geometric point of the target is affine three-space. The affine-fibration assertion of Dolgachev and Weisfeiler predicts that an affine morphism to a normal locally noetherian integral base is Zariski-locally a product with affine $r$-space if every fiber is affine $r$-space over its residue field [26] Section 3.8.5. The residual-coordinate property of $H$ gives two counterexamples in relative dimension three:

$ p : "Spec" A arrow.r bb(A)^1 \, #h(2em) \( p \, H \) : "Spec" P = bb(A)^5 arrow.r bb(A)^2 . $

Both maps are smooth $bb(A)^3$-fibrations, but neither is a Zariski-locally trivial $bb(A)^3$-bundle. 7 proves this consequence using the locally-polynomial-algebra theorem of Bass–Connell–Wright [3] Theorem 3(a) and the Quillen–Suslin theorem [24] Theorem 2(b).

===== 1.3 From polynomiality to a homogeneous additive action. <from-polynomiality-to-a-homogeneous-additive-action.>

The main work is to prove that $A$ itself is not polynomial. Additive actions have long served to distinguish affine varieties from affine space: Makar-Limanov used them to show that the Russell cubic is not affine three-space [17]. Our obstruction has three stages, beginning with the passage from filtered derivations to homogeneous derivations developed by Kaliman and Makar-Limanov [15] Sections 3–5.

The construction in Section 2, Section 3 identifies an auxiliary subalgebra of $A$ with the presentation

$ S = bb(C) \[ p \, x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) - p^3 u #scale(x: 120%, y: 120%)[\)] \, #h(2em) S \[ p^(- 1) \] = A \[ p^(- 1) \] . $

Under this inclusion, $p^2 F$ and $p^2 J$ belong to $S$. Define

$ R = S \/ p S = bb(C) \[ x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) I = \( overline(p^2 F) \, overline(p^2 J) \) subset R \, $

where the bars denote residues of elements of $S$ modulo $p S$. The order $"ord"_p$ along $p = 0$ in $S$ applies to every nonzero element of $A$. Its negative defines the #emph[valuation degree] $deg h = - "ord"_p \( h \)$ and a filtration of $A$. We prove the exact identification

$ G = "gr" A = R \[ tau \, I \/ tau^2 \] subset R \[ tau \, tau^(- 1) \] \, #h(2em) deg tau = - 1 \, #h(2em) deg R = 0 . $

Here $tau$ is an indeterminate representing the initial form of $p$, and the right-hand side is generated by $R$, $tau$, and all $i \/ tau^2$ with $i in I$. The coefficient inclusion is the one induced by $S subset A$: the residue of $b in S$ corresponds to its degree-zero class. This is an affine modification of $R \[ tau \]$ in the sense of Kaliman–Zaidenberg [16], and it is smooth.

If $A$ were polynomial, some polynomial coordinate would have positive valuation degree: otherwise all of $A$ would have nonpositive degree, contrary to $deg F = 2$. Differentiation in a different coordinate fixes that positive-degree coordinate. The exact graded identification then induces a nonzero homogeneous locally nilpotent derivation of $G$ with a nonzero homogeneous invariant of positive degree. This is the action the remaining two stages exclude.

===== 1.4 Lifting through the principalizing line bundle. <lifting-through-the-principalizing-line-bundle.>

The standard torus bundle from $upright("SL")_2$ to the smooth affine quadric principalizes $I$ after adjoining the unchanged variable $u$. This quadric and its polynomial embeddings also occur in the work of Blanc and van Santen [4]. The bundle algebra and the pullback of $G$ are

$ tilde(R) = bb(C) \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) \, #h(2em) x = a b \, quad y = d c \, quad z = d b \,\
tilde(G) = G ⊗_R tilde(R) = tilde(R) \[ tau \, V \] \/ \( tau^2 V - v \) \, #h(2em) v = a^3 b - a^2 u^3 - d^2 . $

The valuation degree is zero on $tilde(R)$, with $deg tau = - 1$ and $deg V = 2$. Separately, fiber scaling gives $a \, d$ weight $1$, $b \, c$ weight $- 1$, and $u \, tau$ weight $0$; thus $v \, V$ have fiber weight $2$.

The morphism $"Spec" tilde(G) arrow.r "Spec" G$ is the complement of the zero section in a line bundle. Every additive action on the smooth affine base $"Spec" G$ lifts uniquely to an action on this line bundle that is linear on fibers and normalized at the identity. For the homogeneous action just obtained, uniqueness makes the lift homogeneous with the same valuation degree shift, while fiber linearity preserves fiber weights. This applies even when the original action does not preserve the quadric algebra $R$. A positive-degree invariant is divisible by $V$, forcing $V$ itself to be invariant. The homogeneous pieces of $tilde(G)$, with separate arguments according to whether $tau$ is invariant, then produce a nonzero locally nilpotent derivation $E$ of $tilde(R)$ with nonpositive fiber weight and

$ E^2 \( v \) = 0 . $

Thus the lift converts the geometric action into a constrained derivation on the explicit determinant ring.

===== 1.5 The weighted rigidity obstruction. <the-weighted-rigidity-obstruction.>

A highest component $E'$ for an auxiliary grading remains a nonzero locally nilpotent derivation with the same fiber weight. The grading separates the two parts of $v$ so that $\( E' \)^2 \( d^2 + a^2 u^3 \) = 0$. The polynomial orbit of $d^2 + a^2 u^3$ therefore has degree at most one. The Mason–Stothers polynomial $a b c$ inequality [19,23] and the nonsquareness of $- u^3$ in $"Frac" tilde(R)$ force $E'$ to fix $a \, d \, u$. The determinant relation then forces positive fiber weight, contradicting the sign obtained in the preceding stage. The use of polynomial $a b c$ for rigidity of additive actions has precedents in Finston–Maubach [9] Section 2; here the nonsquare obstruction requires keeping the leading coefficients in the original fraction field.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Ring
], table.cell(rowspan: 1, colspan: 1)[Definition
], table.cell(rowspan: 1, colspan: 1)[Role in the proof
]),
  table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[$P \/ \( H \)$
], table.cell(rowspan: 1, colspan: 1)[Coordinate ring of the fourfold.
],
  table.cell(rowspan: 1, colspan: 1)[$S$
], table.cell(rowspan: 1, colspan: 1)[(3.1)
], table.cell(rowspan: 1, colspan: 1)[Subalgebra of $A$ defining the order along $p = 0$.
],
  table.cell(rowspan: 1, colspan: 1)[$R$
], table.cell(rowspan: 1, colspan: 1)[$S \/ p S$
], table.cell(rowspan: 1, colspan: 1)[Coefficient ring of the degeneration.
],
  table.cell(rowspan: 1, colspan: 1)[$G$
], table.cell(rowspan: 1, colspan: 1)[$"gr" A = R \[ tau \, I \/ tau^2 \]$
], table.cell(rowspan: 1, colspan: 1)[Exact graded algebra carrying the induced action.
],
  table.cell(rowspan: 1, colspan: 1)[$tilde(R)$
], table.cell(rowspan: 1, colspan: 1)[(4.2)
], table.cell(rowspan: 1, colspan: 1)[Torus-bundle algebra in which $I$ becomes principal.
],
  table.cell(rowspan: 1, colspan: 1)[$tilde(G)$
], table.cell(rowspan: 1, colspan: 1)[$G ⊗_R tilde(R)$
], table.cell(rowspan: 1, colspan: 1)[Pullback algebra carrying the lifted action.
],
)
]],
  caption: [Table 1: The rings in the proof. The valuation degree on $G$ and $tilde(G)$ is separate from the fiber weight on $tilde(R)$ and $tilde(G)$. ],
)

===== 1.6 Organization. <organization.>

1 records the rings used in the argument. 2 proves the stabilization. 3 constructs the filtration and identifies $G$. 4 describes the torus bundle and proves the lifting statement. 5 extracts the constrained derivation on $tilde(R)$, and 6 excludes it and completes the proof of 1. 7 derives the two nontrivial affine-space fibrations. All locally nilpotent derivations and algebraic group actions in the proof are defined over $bb(C)$.

== 2 The equation and its polynomial cylinder <sec:construction>

We first prove that the displayed equation defines an integral fourfold, then construct the five polynomial coordinates on its cylinder. The localization at $p$ explains the equation; the stabilization argument will produce coordinates in the original ring, including the fiber $p = 0$.

The construction realizes the residual-coordinate method of El Kahoui–Ouali [8] Lemma 3.1 and Theorem 1.1, generalized by Dutta–Lahiri [6] Lemma 3.3 and Theorem 3.4. The coordinate criterion of Maubach [20] Theorem 4.5 applies to $H + p^3 w$: the only root of $p^3$ is $p = 0$, where the coordinate change below makes $H$ a coordinate. We retain the explicit formulas so that the resulting isomorphism is available without an existence argument.

Recall the polynomial ring and its elements

#[#set math.equation(numbering: n => "(2.1)")
 $ P = bb(C) \[ p \, s \, u \, F \, J \] \, #h(2em) x = s^2 + u^3 + p^2 F \,\
y = s + x \( x - u^3 \) \, #h(2em) z = s x + p^2 J \,\
H = x^2 F - \( 1 + 2 s x \) J - p^2 J^2 - p u \, #h(2em) A = P \/ \( H \) . $ <con:setup>]

Thus $H$ is a specified polynomial in the five independent variables $p \, s \, u \, F \, J$. We will use $w$ for the polynomial indeterminate adjoined to $A$. All maps below are $bb(C)$-algebra maps.

=== 2.1 Localization and integrality <localization-and-integrality>

The definitions give the identity

#[#set math.equation(numbering: n => "(2.2)")
 $ x y - z \( z + 1 \) = p^2 \( H + p u \) . $ <con:identity>]

Indeed, substituting $y$ and $z$ into the left-hand side and cancelling the terms $s x$ gives

$ x^2 \( x - u^3 - s^2 \) - p^2 \( 1 + 2 s x \) J - p^4 J^2 \, $

which is the right-hand side because $x - u^3 - s^2 = p^2 F$.

#thm([Lemma 2.1.])[
  #emph[The algebra $A$ is an integral domain of dimension four, $p eq.not 0$ in $A$, and 
$ A \[ p^(- 1) \] = bb(C) \[ p \, p^(- 1) \, x \, y \, z \] $

 is a Laurent polynomial ring in the displayed generators.]
] <con:domain>

#proof[
  Over $bb(C) \[ p \, p^(- 1) \]$, the elements $x \, y \, z \, u$ are polynomial coordinates on $P \[ p^(- 1) \]$. The inverse substitutions are
  #[#set math.equation(numbering: n => "(2.3)")
   $ s = y - x \( x - u^3 \) \, #h(2em) F = p^(- 2) \( x - s^2 - u^3 \) \, #h(2em) J = p^(- 2) \( z - s x \) . $ <con:localized-coordinates>]
  Substitution in either direction gives the identity, so in particular the new coordinates are algebraically independent. In these coordinates, (2.2) reads
  #[#set math.equation(numbering: n => "(2.4)")
   $ H = p^(- 2) #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) #scale(x: 120%, y: 120%)[\)] - p u . $ <con:localized-h>]
  The coefficient of $u$ is a unit. Replacing $u$ by $H$ is therefore another polynomial coordinate change over $bb(C) \[ p \, p^(- 1) \]$. Consequently $\( H \)$ is prime in $P \[ p^(- 1) \]$, and its quotient is the Laurent polynomial ring asserted in the lemma, with $u = p^(- 3) \( x y - z \( z + 1 \) \)$.
  Set $x_0 = s^2 + u^3$. Reduction modulo $p$ gives
  $ H med mod med p = x_0^2 F - \( 1 + 2 s x_0 \) J eq.not 0 \, $
  so $p$ does not divide $H$ in $P$. To descend irreducibility from the localization, factor $H$ in the unique factorization domain $P$. Its image in $P \[ p^(- 1) \]$ is irreducible, so all but one of its irreducible factors must become units there. An irreducible element of $P$ that becomes a unit upon inverting $p$ divides a power of $p$, and hence is associated to $p$. Nondivisibility by $p$ excludes such factors. Thus $H$ is irreducible in $P$, and is prime because $P$ is a unique factorization domain. This proves that $A$ is a domain. Its localization computed above is nonzero, which also proves that $p eq.not 0$ in $A$. This localization has fraction field $bb(C) \( p \, x \, y \, z \)$, of transcendence degree four over $bb(C)$. The same is true of $A$, so the dimension formula for finitely generated domains over a field [22] Tag 00P0 gives $dim A = 4$. ◻
]

=== 2.2 An explicit stabilization <an-explicit-stabilization>

The main calculation has two stages. An exponential automorphism replaces $H$ by $H + p^3 w$. A linear coordinate change in $F \, J$ then makes this new equation linear modulo $p^2$, which allows a polynomial root modulo $p^3$ and a fifth coordinate to be written down explicitly.

#thm([Proposition 2.2.])[
  #emph[For the algebra $A$ in (2.1), there is an algebraic $bb(C)$-isomorphism 
$ A \[ w \] tilde.equiv bb(C)^(\[ 5 \]) . $

]
] <prop:stabilization>

#proof[
  We first change the equation by a polynomial automorphism, and then exhibit five polynomial coordinates on the resulting quotient.
  #emph[Changing the equation.] On $P \[ p^(- 1) \] = bb(C) \[ p \, p^(- 1) \, x \, y \, z \, u \]$, define $Delta = - p^2 partial \/ partial u$, with $p \, x \, y \, z$ fixed. This derivation is locally nilpotent: every polynomial is killed by a sufficiently high iterate of $Delta$. Applying it to (2.3) gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ Delta p = 0 \, #h(2em) Delta u = - p^2 \, #h(2em) Delta s = - 3 p^2 x u^2 \,\
Delta F = \( 6 s x + 3 \) u^2 \, #h(2em) Delta J = 3 x^2 u^2 . $ <con:derivation>]
  These values belong to $P$, so $Delta$ restricts to a locally nilpotent derivation of $P$. Extend it by $Delta w = 0$. The formula
  $ Phi \( f \) = exp \( w Delta \) \( f \) = sum_(i gt.eq 0) frac(w^i, i !) Delta^i \( f \) #h(2em) \( f in P \[ w \] \) $
  is a finite sum for every $f$. The iterated Leibniz rule makes $Phi$ an algebra homomorphism, and the exponential identity gives its inverse $exp \( - w Delta \)$. By (2.4), $Delta H = p^3$ and $Delta^2 H = 0$. Hence
  #[#set math.equation(numbering: n => "(2.6)")
   $ Phi \( H \) = H + p^3 w \, #h(2em) A \[ w \] arrow.r_(med Phi med)^(med tilde.op med) T := P \[ w \] \/ \( H + p^3 w \) . $ <con:cylinder-automorphism>]
  In particular, $T$ is a domain by 3, and its element $p$ is nonzero since $Phi$ fixes $p$.
  #emph[Coordinates adapted to the fiber $p = 0$.] With $x_0 = s^2 + u^3$, put
  #[#set math.equation(numbering: n => "(2.7)")
   $ L = x_0^2 F - \( 1 + 2 s x_0 \) J \, #h(2em) M = \( 1 - 2 s x_0 \) F + 4 s^2 J . $ <con:linear-coordinates>]
  The determinant of this linear change in $\( F \, J \)$, over $bb(C) \[ p \, s \, u \]$, is
  $ 4 s^2 x_0^2 + \( 1 + 2 s x_0 \) \( 1 - 2 s x_0 \) = 1 . $
  Its inverse is
  #[#set math.equation(numbering: n => "(2.8)")
   $ F = 4 s^2 L + \( 1 + 2 s x_0 \) M \, #h(2em) J = - \( 1 - 2 s x_0 \) L + x_0^2 M . $ <con:linear-inverse>]
  It follows that $p \, s \, u \, L \, M$ are algebraically independent and that
  $ P = B \[ L \] \, #h(2em) B := bb(C) \[ p \, s \, u \, M \] tilde.equiv bb(C)^(\[ 4 \]) . $
  For the rest of the proof, regard $F \, J \, H$ as polynomials in $L$ over $B$, using (2.8). Expansion only in powers of $p$ gives
  #[#set math.equation(numbering: n => "(2.9)")
   $ H \( L \) = L - p u + p^2 Q \( L \) + p^4 F \( L \)^3 \, #h(2em) Q \( L \) = 2 x_0 F \( L \)^2 - 2 s F \( L \) J \( L \) - J \( L \)^2 . $ <con:h-expansion>]
  At this point the transfer theorem of Edo–Vénéreau [7] Theorem 7 also applies, with coefficient ring $B$ and parameter $p^3$: every coefficient of $H \( L \) - L$ is divisible by $p$, hence nilpotent modulo $p^3 B$. The following calculation gives a polynomial inverse in this instance.
  #emph[A polynomial root modulo $p^3$.] Define elements and a polynomial over $B$ by
  #[#set math.equation(numbering: n => "(2.10)")
   $ C = Q \( 0 \) = M^2 \( 2 x_0 + 6 s x_0^2 + 4 s^2 x_0^3 - x_0^4 \) \,\
Q_1 \( L \) = frac(Q \( L \) - C, L) in B \[ L \] \, #h(2em) L_(*) = p u - p^2 C in B . $ <con:root>]
  Since $Q \( L_(*) \) - C = L_(*) Q_1 \( L_(*) \)$, (2.9) gives the exact identity
  #[#set math.equation(numbering: n => "(2.11)")
   $ H \( L_(*) \) = p^3 #scale(x: 120%, y: 120%)[\(] \( u - p C \) Q_1 \( L_(*) \) + p F \( L_(*) \)^3 #scale(x: 120%, y: 120%)[\)] in p^3 B . $ <con:root-divisibility>]
  #emph[A polynomial representative for the fifth coordinate.] The quotient $\( L - L_(*) \) \/ p^3$ suggests the remaining coordinate after localization. The next identity provides a polynomial representative for it before $p$ is inverted. In $B \[ L \, w \]$, put
  #[#set math.equation(numbering: n => "(2.12)")
   $ h = u - p Q \( L \) - p^3 F \( L \)^3 - p^2 w \, #h(2em) e_0 = - w - p F \( L \)^3 - Q_1 \( L \) h . $ <con:e-polynomial>]
  Then $H \( L \) + p^3 w = L - p h$. Using $Q \( L \) - C = L Q_1 \( L \)$, we obtain the polynomial identity
  #[#set math.equation(numbering: n => "(2.13)")
   $ p^3 e_0 - \( L - L_(*) \) = \( p^2 Q_1 \( L \) - 1 \) #scale(x: 120%, y: 120%)[\(] H \( L \) + p^3 w #scale(x: 120%, y: 120%)[\)] . $ <con:e-certificate>]
  Thus the image $e$ of $e_0$ in $T$ satisfies
  #[#set math.equation(numbering: n => "(2.14)")
   $ p^3 e = L - L_(*) . $ <con:e-relation>]
  In particular, $e$ belongs to the unlocalized ring $T$.
  #emph[Generation and algebraic independence.] Inverting $p$ in the presentation $T = B \[ L \, w \] \/ \( H \( L \) + p^3 w \)$ allows us to eliminate $w$, giving the isomorphism
  #[#set math.equation(numbering: n => "(2.15)")
   $ T \[ p^(- 1) \] arrow.r^(med tilde.op med) B \[ p^(- 1) \] \[ L \] \, #h(2em) w mapsto - p^(- 3) H \( L \) \, $ <con:t-localized>]
  which is the identity on $B$ and $L$. The composite $B arrow.r T arrow.r T \[ p^(- 1) \]$ is therefore the natural injection $B arrow.r.hook B \[ p^(- 1) \] \[ L \]$. This proves that the displayed copy of $B$ embeds in $T$. Moreover, (2.14) identifies $e$ in this localization with $p^(- 3) \( L - L_(*) \)$, an affine linear coordinate in the independent variable $L$. Consequently $e$ is transcendental over $B \[ p^(- 1) \]$, and hence over $B$.
  It remains to prove that $B$ and $e$ generate $T$. By (2.14), $L = L_(*) + p^3 e$. The polynomial difference $H \( L_(*) + p^3 Z \) - H \( L_(*) \)$ is divisible by $p^3$ in $B \[ Z \]$. Together with (2.11), this shows that
  $ W \( Z \) := - frac(H \( L_(*) + p^3 Z \), p^3) in B \[ Z \] . $
  The defining relation of $T$ now gives $p^3 \( w - W \( e \) \) = 0$. Since $T$ is a domain and $p eq.not 0$, it follows that $w = W \( e \)$. Thus $L \, w in B \[ e \]$, which proves
  #[#set math.equation(numbering: n => "(2.16)")
   $ T = B \[ e \] = bb(C) \[ p \, s \, u \, M \, e \] tilde.equiv bb(C)^(\[ 5 \]) . $ <con:polynomial-cylinder>]
  For completeness, the five independent coordinates in $A \[ w \]$ itself are the classes of
  $ Phi^(- 1) \( p \) \, quad Phi^(- 1) \( s \) \, quad Phi^(- 1) \( u \) \, quad Phi^(- 1) \( M \) \, quad Phi^(- 1) \( e_0 \) . $
  These are polynomials by the finite exponential formula. They are obtained by transporting the five generators in (2.16) through the inverse of (2.6), which proves the proposition. ◻
]

== 3 A smooth degeneration and its derivations <sec:degeneration>

We retain the notation of 2, using the same letters for elements of $P$ and their images in the domain $A = P \/ \( H \)$. The filtration constructed here will let us replace a locally nilpotent derivation of $A$ by a homogeneous one on a smooth algebra with a simpler equation.

=== 3.1 The valuation and its coefficients <the-valuation-and-its-coefficients>

Consider the presented algebra

#[#set math.equation(numbering: n => "(3.1)")
 $ S = bb(C) \[ p \, x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) - p^3 u #scale(x: 120%, y: 120%)[\)] \, #h(2em) R = S \/ p S = bb(C) \[ x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) #scale(x: 120%, y: 120%)[\)] . $ <deg:S-R>]

The identity $x y - z \( z + 1 \) = p^2 \( H + p u \)$ defines a homomorphism $S arrow.r A$.

#thm([Lemma 3.1.])[
  #emph[The map $S arrow.r A$ is injective, and $S \[ p^(- 1) \] = A \[ p^(- 1) \]$. The ring $R$ is a smooth domain. On the common fraction field of $S$ and $A$ there is a discrete valuation $"ord"_p$, normalized by $"ord"_p \( p \) = 1$, coming from $S_(p S)$. For $b in S$ and every integer $i gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ "ord"_p \( b \) gt.eq i quad arrow.l.r.double quad b in p^i S . $ <deg:global-divisibility>]

 In particular, each nonzero $h in S \[ p^(- 1) \]$ has a unique expression $h = p^m b$ with $m = "ord"_p \( h \) in bb(Z)$ and $b in S \\ p S$.]
] <deg:valuation>

#proof[
  After inverting $p$, the defining polynomial of $S$ is linear in $u$ with invertible leading coefficient. It is therefore irreducible in $bb(C) \[ p \, p^(- 1) \, x \, y \, z \, u \]$. It is not divisible by $p$ in $bb(C) \[ p \, x \, y \, z \, u \]$, so it is irreducible there as well: any factor becoming a unit after localization would be a scalar times a power of $p$. The latter polynomial ring is a unique factorization domain, so $S$ is a domain and $p$ is nonzero in $S$. The inverse formulas
  $ s = y - x \( x - u^3 \) \, #h(2em) F = frac(x - s^2 - u^3, p^2) \, #h(2em) J = frac(z - s x, p^2) $
  show that $S arrow.r A$ becomes an isomorphism after inverting $p$. Its kernel is consequently $p$-torsion, hence zero in the domain $S$. This also proves equality of the fraction fields.
  The polynomial $x y - z \( z + 1 \)$ is primitive as a polynomial in $y$ over $bb(C) \[ x \, z \, u \]$, since $x$ and $z \( z + 1 \)$ are coprime. It is linear and irreducible over $bb(C) \( x \, z \, u \)$, so $R$ is a domain. Its hypersurface is smooth by the Jacobian criterion [22] Tags 00T6 and 00T7: simultaneous vanishing of the partial derivatives $y$, $x$, and $- \( 2 z + 1 \)$ would give $x = y = 0$, $z = - 1 \/ 2$, which does not satisfy its equation.
  Thus $p S$ is a nonzero prime ideal, and the noetherian local domain $T = S_(p S)$ has maximal ideal $p T$. To see directly that $T$ is a discrete valuation ring, divide a nonzero nonunit repeatedly by $p$. This process must end: otherwise the principal ideals generated by the successive quotients form an ascending chain, and stabilization would imply that $p$ is a unit, by cancellation in the domain $T$. Every nonzero element of $T$ is therefore a power of $p$ times a unit. This gives the stated valuation on $"Frac" \( T \)$.
  If $b in S$ has positive order, then $b in p T$, so $t b in p S$ for some $t in S \\ p S$. Primality of $p S$ gives $b in p S$. Dividing by $p$ and repeating proves (3.2); its converse is immediate. Finally, write $h = p^(- N) b_0$ with $b_0 in S$, $N gt.eq 0$, and apply (3.2) to $b_0$ to divide out its full order. The asserted expression follows, and its uniqueness follows from the valuation and cancellation. ◻
]

For $0 eq.not h in A$ define its #emph[valuation degree] by $deg h = - "ord"_p \( h \)$, and put $deg 0 = - oo$. In particular,

$ deg \( h h' \) = deg h + deg h' \, #h(2em) deg \( h + h' \) lt.eq max { deg h \, deg h' } . $

These formulas give an exhaustive, separated filtration indexed by all integers,

$ cal(F)_d A = { h in A : deg h lt.eq d } \, #h(2em) "gr" A = xor.big_(d in bb(Z)) cal(F)_d A \/ cal(F)_(d - 1) A . $

Write $\[ h \]_d$ for the class of $h in cal(F)_d A$ in the $d$th summand, and $"in" \( h \) = \[ h \]_(deg h)$ for a nonzero $h$. Give $R \[ tau \, tau^(- 1) \]$ the grading in which $R$ has degree zero and $tau$ has degree $- 1$. 5 gives a graded injection

#[#set math.equation(numbering: n => "(3.3)")
 $ "gr" A arrow.r.hook R \[ tau \, tau^(- 1) \] \, #h(2em) \[ h \]_d mapsto overline(p^d h) thin tau^(- d) . $ <deg:graded-injection>]

Indeed $p^d h in S$ whenever $h in cal(F)_d A$, including when $d < 0$, by the last assertion of 5. Its residue modulo $p S$ vanishes exactly when $h in cal(F)_(d - 1) A$. The displayed maps respect sums and products and are injective on each summand. This explains why their coefficients lie in $R$ itself.

=== 3.2 The exact associated graded algebra <the-exact-associated-graded-algebra>

The initial forms of the five generators give a candidate for $"gr" A$. The point requiring proof is that no cancellation among their leading terms produces an additional generator. We establish the presentation of the candidate first, then reduce the weight of any representative whose leading terms cancel.

In $R$ set

#[#set math.equation(numbering: n => "(3.4)")
 $ s_R = y - x \( x - u^3 \) \, #h(2em) f = x - s_R^2 - u^3 \, #h(2em) g = z - s_R x \, #h(2em) I = \( f \, g \) . $ <deg:center>]

#thm([Proposition 3.2.])[
  #emph[Under (3.3), the associated graded algebra is the following specific subalgebra of $R \[ tau \, tau^(- 1) \]$: 
#[#set math.equation(numbering: n => "(3.5)")
 $ G := "gr" A = R \[ tau \, I \/ tau^2 \] = R \[ tau \, f \/ tau^2 \, g \/ tau^2 \] . $ <deg:G>]

 It is a smooth domain. Give $P = bb(C) \[ p \, s \, u \, F \, J \]$ the presentation weights 
#[#set math.equation(numbering: n => "(3.6)")
 $ \( omega \( p \) \, omega \( s \) \, omega \( u \) \, omega \( F \) \, omega \( J \) \) = \( - 1 \, 0 \, 0 \, 2 \, 2 \) . $ <deg:presentation-weights>]

 Then every nonzero $h in A$ has a polynomial representative whose maximum weight is exactly $deg h$, and there is a graded isomorphism 
#[#set math.equation(numbering: n => "(3.7)")
 $ G tilde.equiv P \/ \( H_(upright("top")) \) \, #h(2em) H_(upright("top")) = x^2 F - \( 1 + 2 s x \) J - p^2 J^2 \, quad x = s^2 + u^3 + p^2 F . $ <deg:graded-presentation>]

 The images of $p \, s \, u \, F \, J$ in this isomorphism are respectively $tau \, s_R \, u \, f \/ tau^2 \, g \/ tau^2$.]
] <prop:graded>

#proof[
  The residues of $s$ and $u$ in $R$ are the nonzero elements $s_R$ and $u$. Also $f$ and $g$ are nonzero: specializing $x = z = 0$ sends $f$ to $- y^2 - u^3$, and specializing $x = 0$, $z = - 1$ sends $g$ to $- 1$. The identities $p^2 F = x - s^2 - u^3$ and $p^2 J = z - s x$ therefore give
  #[#set math.equation(numbering: n => "(3.8)")
   $ h & p & s & u & F & J\
deg h & - 1 & 0 & 0 & 2 & 2\
"in" \( h \) & tau & s_R & u & f \/ tau^2 & g \/ tau^2 . $ <deg:initial-generators>]
  Here $s_R$ is nonzero because its specialization at $x = z = 0$ is $y$.
  Let $theta : P arrow.r R \[ tau \, tau^(- 1) \]$ substitute the five initial forms in (3.8). Its image contains the specified copy of $R$: the generators of that copy are recovered by
  #[#set math.equation(numbering: n => "(3.9)")
   $ x & = s_R^2 + u^3 + tau^2 \( f \/ tau^2 \) \,\
y & = s_R + x \( x - u^3 \) \,\
z & = s_R x + tau^2 \( g \/ tau^2 \) . $ <deg:recover-R>]
  Consequently $theta \( P \)$ is exactly the subalgebra on the right of (3.5). In particular this is an identification over the given coefficient ring $R$.
  For the presentation weights, $x$ has weight zero and $H_(upright("top"))$ is homogeneous of weight two, with
  #[#set math.equation(numbering: n => "(3.10)")
   $ H = H_(upright("top")) - p u \, #h(2em) x y - z \( z + 1 \) = p^2 H_(upright("top")) . $ <deg:top-relation>]
  After inverting $p$, the coordinate change from $\( s \, u \, F \, J \)$ to $\( x \, y \, z \, u \)$ and its inverse in 5 identify $theta$ with the quotient map
  $ bb(C) \[ p \, p^(- 1) \, x \, y \, z \, u \] arrow.r R \[ tau \, tau^(- 1) \] \, #h(2em) p mapsto tau . $
  Its kernel is $\( x y - z \( z + 1 \) \)$, or equivalently $\( H_(upright("top")) \)$ in the original localized coordinates. This is a prime ideal. Moreover $p$ does not divide $H_(upright("top"))$, since its reduction modulo $p$ is
  $ x_0^2 F - \( 1 + 2 s x_0 \) J \, #h(2em) x_0 = s^2 + u^3 \, $
  which is nonzero. The same unique factorization argument as in 5 shows that $H_(upright("top"))$ is irreducible, hence prime, in $P$. Its principal ideal is thus saturated with respect to $p$: if $p^N Q in \( H_(upright("top")) \)$ then $Q in \( H_(upright("top")) \)$. Contracting the localized kernel yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ ker theta = \( H_(upright("top")) \) . $ <deg:kernel>]
  It remains to show that these initial forms generate all of $"gr" A$. For a nonzero polynomial $Q in P$, let $omega \( Q \)$ be its maximum monomial weight. If $Q$ represents a nonzero $h in A$, then $deg h lt.eq omega \( Q \)$ by (3.8) and the valuation inequalities. Suppose the inequality is strict, and write $M = omega \( Q \)$. The weight-$M$ part $Q_M$ has $theta \( Q_M \) = 0$, since the degree-$M$ class of $h$ is zero. By (3.11),
  $ Q_M = H_(upright("top")) C \, $
  where $C$ may be taken homogeneous of weight $M - 2$. To justify the homogeneity, decompose any quotient $C$ into its finitely many homogeneous parts; multiplication by the nonzero homogeneous $H_(upright("top"))$ cannot cancel contributions of different weights in the domain $P$. The polynomial
  $ Q - H C = Q - Q_M + p u C $
  represents the same element $h$ and has maximum weight strictly less than $M$, because $p u C$ has weight $M - 3$. Repeating this operation terminates: the maximum weights are strictly decreasing integers bounded below by the fixed finite number $deg h$. Thus it ends with a representative of weight exactly $deg h$. No lower bound on the weights of all monomials in $P$ is needed.
  The initial form of $h$ is now the image under $theta$ of the top part of such an exact representative. This proves $"gr" A = theta \( P \)$ and, together with (3.11), proves both (3.5) and (3.7).
  Finally, $G$ is a domain by its embedding in $R \[ tau \, tau^(- 1) \]$. On the open set where $p$, or equivalently $tau$, is invertible, the presentation gives the smooth algebra $R \[ tau \, tau^(- 1) \]$. On $p = 0$, the partial derivatives of $H_(upright("top"))$ with respect to $F$ and $J$ reduce to $x_0^2$ and $- \( 1 + 2 s x_0 \)$. They cannot vanish simultaneously, as
  $ \( 1 - 2 s x_0 \) \( 1 + 2 s x_0 \) + 4 s^2 x_0^2 = 1 . $
  The Jacobian criterion proves smoothness also at every point of $p = 0$, and hence on all of $"Spec" G$. ◻
]

The weights in (3.6) compute the valuation degree on $G$. This degree will remain distinct from the fiber weight and the auxiliary degree introduced later.

The description $G = R \[ tau \, I \/ tau^2 \]$ is an affine modification in the sense of Kaliman–Zaidenberg [16] Definition 1.1: the base ring is $R \[ tau \]$, the ideal is $\( tau^2 \, I \)$, and the element inverted in the construction is $tau^2$. Here the exact graded presentation, including its coefficient ring, is what permits the later bundle pullback.

=== 3.3 Inducing locally nilpotent derivations <inducing-locally-nilpotent-derivations>

We now transfer a derivation of $A$ to its associated graded algebra. The exact representative statement in 6 is the needed input: a bound on the five generators then bounds the degree shift on every element of $A$. This is the filtered-to-homogeneous derivation method developed by Kaliman–Makar-Limanov [15] Sections 3–5. We give the argument for the present integer-indexed filtration, including the possibility of negative degrees.

A $bb(C)$-derivation of a $bb(C)$-algebra $C$ is a $bb(C)$-linear map $D : C arrow.r C$ satisfying $D \( h h' \) = h D \( h' \) + h' D \( h \)$. It is #emph[locally nilpotent] if for each $h in C$ there is an integer $N gt.eq 1$ such that $D^N h = 0$; all subsequent iterates then vanish as well. We abbreviate this by LND. On a graded algebra a derivation is #emph[homogeneous of degree shift $j$] if it sends the component of degree $d$ to that of degree $d + j$ for every $d in bb(Z)$.

#thm([Lemma 3.3.])[
  #emph[Every nonzero LND $D$ of $A$ induces a nonzero homogeneous LND $D_0$ of $G$. If $0 eq.not h in ker D$, then $"in" \( h \) in ker D_0$.]
] <lem:induced-lnd>

#proof[
  Let $\( h_1 \, dots.h \, h_5 \) = \( p \, s \, u \, F \, J \)$ be the generators of $A$ and set
  #[#set math.equation(numbering: n => "(3.12)")
   $ j = max_(D h_i eq.not 0) #scale(x: 120%, y: 120%)[\(] deg \( D h_i \) - deg h_i #scale(x: 120%, y: 120%)[\)] . $ <deg:shift>]
  The maximum is over a finite nonempty set, since $D$ is nonzero. We claim that
  #[#set math.equation(numbering: n => "(3.13)")
   $ deg \( D h \) lt.eq deg h + j #h(2em) \( 0 eq.not h in A \) . $ <deg:shift-bound>]
  By 6, choose a representative of $h$ of maximum weight exactly $deg h$. Applying the product rule to each monomial, every nonzero summand in its derivative has degree at most the monomial’s weight plus $j$: differentiating a factor $h_i$ changes its degree by at most $j$. Summing these bounds gives (3.13).
  It follows that $D \( cal(F)_d A \) subset.eq cal(F)_(d + j) A$, so
  #[#set math.equation(numbering: n => "(3.14)")
   $ D_0 \( \[ h \]_d \) = \[ D h \]_(d + j) $ <deg:induced-map>]
  defines a homogeneous derivation of degree shift $j$ on $G$. It is well defined because $D \( cal(F)_(d - 1) A \)$ lies in $cal(F)_(d + j - 1) A$, and the product rule descends to the graded algebra. For a generator attaining the maximum in (3.12), the right side of (3.14) applied to its initial form is nonzero. Thus $D_0 eq.not 0$.
  For every $h in cal(F)_d A$ and $m gt.eq 0$, induction gives the identity in the indicated graded component
  #[#set math.equation(numbering: n => "(3.15)")
   $ D_0^m \( \[ h \]_d \) = \[ D^m h \]_(d + m j) . $ <deg:iterate>]
  It includes the case when an intermediate class vanishes: the shift bound ensures that a drop below the indicated degree persists in all later iterates. Local nilpotence of $D$ therefore kills each homogeneous class after finitely many iterates of $D_0$. Every element of $G$ is a finite sum of homogeneous classes, so a maximum of their nilpotence bounds kills that element. This proves local nilpotence on all of $G$, without a sign restriction on $j$. Finally, if $D h = 0$, (3.14) gives $D_0 "in" \( h \) = 0$. ◻
]

The positive-degree-invariant obstruction is inspired by Gupta’s Derksen-invariant strategy; see [12] Lemma 2.4 and the proof of Proposition 3.6. Here it is expressed directly through polynomial coordinates. The characteristic-zero construction and the subsequent bundle and rigidity arguments are proved in this paper; Gupta’s positive-characteristic theorem is not an input to them.

#thm([Proposition 3.4.])[
  #emph[If $A tilde.equiv bb(C)^(\[ 4 \])$, then $G$ admits a nonzero homogeneous LND with a nonzero homogeneous invariant of strictly positive valuation degree.]
] <prop:positive-invariant>

#proof[
  Under the hypothesis choose polynomial coordinates $q_1 \, q_2 \, q_3 \, q_4$ of $A$. The subset $cal(F)_0 A$ is a $bb(C)$-subalgebra. Since $F$ has degree two by (3.8), this subalgebra is proper. Therefore at least one coordinate $q_r$ has positive degree; otherwise the coordinates would generate $A$ inside $cal(F)_0 A$. Choose $i eq.not r$. The coordinate partial derivative $D = partial \/ partial q_i$ is a nonzero LND of $A$ and satisfies $D q_r = 0$. By 7, its induced derivation $D_0$ on $G$ is nonzero and homogeneous, and it kills the nonzero homogeneous element $"in" \( q_r \)$ of degree $deg q_r > 0$. ◻
]

Neither 7 nor 8 asserts that $D_0$ preserves the subalgebra $R subset G$. Coefficient preservation can fail even for a homogeneous LND on $G$. The derivation $Delta$ in (2.5) has presentation-weight shift $- 2$ and satisfies $Delta \( H_(upright("top")) \) = Delta \( H + p u \) = p^3 - p^3 = 0$. It therefore descends through (3.7) to an LND on $G$ sending $u in R$ to $- tau^2 in.not R$. This example concerns actions on $G$: $Delta$ does not descend to $A$, since $Delta H = p^3$. The next section lifts the action on $"Spec" G$ directly, without assuming $D_0 \( R \) subset R$.

== 4 Principalization and lifted additive actions <sec:bundle>

The ideal defining $G$ becomes principal after pullback to a line bundle with its zero section removed. We construct that bundle and then show that every homogeneous additive action on $G$ lifts to the pullback. This replaces the two generators of the ideal by one element while retaining both degree and fiber weight.

We retain the coefficient ring and ideal from 6:

$ R = bb(C) \[ x \, y \, z \, u \] \/ #scale(x: 120%, y: 120%)[\(] x y - z \( z + 1 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) s_R = y - x \( x - u^3 \) \, #h(2em) I = \( f \, g \) = \( x - s_R^2 - u^3 \, med z - s_R x \) . $

The inclusion $R subset G = R \[ tau \, I \/ tau^2 \]$ is the actual coefficient inclusion in $R \[ tau \, tau^(- 1) \]$. In terms of the initial generators, it is given by

#[#set math.equation(numbering: n => "(4.1)")
 $ x = s_R^2 + u^3 + tau^2 \( f \/ tau^2 \) \, #h(2em) y = s_R + x \( x - u^3 \) \, #h(2em) z = s_R x + tau^2 \( g \/ tau^2 \) . $ <bun:coefficient-inclusion>]

This is the inclusion used in the base change below. Its elements have valuation degree zero.

=== 4.1 A line bundle that principalizes the center <a-line-bundle-that-principalizes-the-center>

The bundle used here is the standard quotient of $upright("SL")_2$ by its diagonal torus, with the coordinate $u$ adjoined; see Blanc–van Santen [4] p. 8431 for this description of the affine quadric. We give its charts explicitly because the transition functions determine the fiber weights.

Set

#[#set math.equation(numbering: n => "(4.2)")
 $ tilde(R) = bb(C) \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) \, #h(2em) x = a b \, quad y = d c \, quad z = d b \, $ <bun:determinant-ring>]

and let

#[#set math.equation(numbering: n => "(4.3)")
 $ v = a^2 \( x - u^3 \) - d^2 = a^3 b - a^2 u^3 - d^2 . $ <bun:v>]

The assignments in (4.2) define a homomorphism $R arrow.r tilde(R)$, since $x y = \( a c \) \( b d \) = z \( z + 1 \)$.

#thm([Proposition 4.1.])[
  #emph[The morphism $"Spec" tilde(R) arrow.r "Spec" R$ is the complement of the zero section in a line bundle, with fiber scaling specified by the weights 
$ "wt" \( a \) = "wt" \( d \) = 1 \, #h(2em) "wt" \( b \) = "wt" \( c \) = - 1 \, #h(2em) "wt" \( u \) = 0 . $

 The homomorphism $R arrow.r tilde(R)$ is faithfully flat, and $I tilde(R) = \( v \)$. Moreover, base change gives a faithfully flat inclusion $G arrow.r.hook tilde(G)$, where 
#[#set math.equation(numbering: n => "(4.4)")
 $ tilde(G) := G ⊗_R tilde(R) = tilde(R) \[ tau \, v \/ tau^2 \] subset tilde(R) \[ tau \, tau^(- 1) \] \, #h(2em) tilde(G) tilde.equiv tilde(R) \[ tau \, V \] \/ \( tau^2 V - v \) . $ <bun:pullback-algebra>]

 Thus $V$ denotes the element $v \/ tau^2$ in the displayed subalgebra. The ring $tilde(G)$ is a domain and has the following commuting gradings:]
  #[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[#emph[$a \, d$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$b \, c$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$u$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$tau$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$V$]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[Valuation degree]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$- 1$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[Fiber weight]
], table.cell(rowspan: 1, colspan: 1)[#emph[$1$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$- 1$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$2$]
],
)
]
] <prop:principalization>

#proof[
  First, $tilde(R)$ is a domain: the polynomial $a c - \( b d + 1 \)$ is primitive as a polynomial in $c$ over the unique factorization domain $bb(C) \[ a \, d \, b \, u \]$, and is irreducible over its fraction field because it is linear. The element $v$ is nonzero, since $u$ is an indeterminate over the determinant ring and its coefficient in degree three in $v$ is $- a^2 eq.not 0$.
  The principal opens $D \( z + 1 \)$ and $D \( z \)$ cover $"Spec" R$. Over the first open, $a c = z + 1$ is invertible, and the formulas
  #[#set math.equation(numbering: n => "(4.5)")
   $ c = frac(z + 1, a) \, #h(2em) b = x / a \, #h(2em) d = frac(a y, z + 1) $ <bun:first-chart>]
  give mutually inverse identifications
  $ tilde(R) \[ \( z + 1 \)^(- 1) \] tilde.equiv R \[ \( z + 1 \)^(- 1) \] \[ a \, a^(- 1) \] . $
  Indeed, they give $a c = z + 1$, $a b = x$, $d c = y$, and $d b = x y \/ \( z + 1 \) = z$. Over the second open, the analogous formulas are
  #[#set math.equation(numbering: n => "(4.6)")
   $ b = z / d \, #h(2em) c = y / d \, #h(2em) a = frac(d x, z) \, #h(2em) tilde(R) \[ z^(- 1) \] tilde.equiv R \[ z^(- 1) \] \[ d \, d^(- 1) \] . $ <bun:second-chart>]
  Here $d b = z$, $d c = y$, $a b = x$, and $a c = x y \/ z = z + 1$. On the overlap the fiber parameters satisfy
  $ d = frac(y, z + 1) a \, #h(2em) frac(y, z + 1) dot.op x / z = 1 . $
  Thus their transition function is a base unit. Gluing affine lines by this same transition function gives a line bundle whose complement of the zero section is $"Spec" tilde(R)$. The indicated weights are exactly scalar multiplication on the two fiber parameters. Each Laurent polynomial chart is faithfully flat over its base chart: as a module it is free with basis the integral powers of its fiber parameter. Since the base charts cover, $R arrow.r tilde(R)$ is faithfully flat.
  We prove principalization by global identities. In $tilde(R)$ put
  $ h = x - u^3 \, #h(2em) C_1 = c^2 - b^2 h \, #h(2em) alpha = a^2 \( 1 - 2 b d \) \, #h(2em) beta = d^2 \( 3 + 2 b d \) + alpha h . $
  Since $s_R = d c - a b h$ and $a c - b d = 1$, we have
  $ a s_R - d = - b v \, #h(2em) g = b \( d - a s_R \) = b^2 v . $
  Expansion also gives
  $ f - C_1 v = h - \( d c - a b h \)^2 - \( c^2 - b^2 h \) \( a^2 h - d^2 \) = h #scale(x: 120%, y: 120%)[\(] 1 - \( a c - b d \)^2 #scale(x: 120%, y: 120%)[\)] = 0 . $
  Finally, with $q = b d$ the coefficient identity is
  $ alpha C_1 + beta b^2 & = \( a c \)^2 \( 1 - 2 b d \) + 3 b^2 d^2 + 2 b^3 d^3\
 & = \( 1 + q \)^2 \( 1 - 2 q \) + 3 q^2 + 2 q^3 = 1 . $
  Consequently
  #[#set math.equation(numbering: n => "(4.7)")
   $ f = C_1 v \, #h(2em) g = b^2 v \, #h(2em) v = alpha f + beta g \, $ <bun:principalization-certificate>]
  which proves $I tilde(R) = \( v \)$.
  Flatness permits us to tensor the injection $G arrow.r.hook R \[ tau \, tau^(- 1) \]$ with $tilde(R)$. The resulting injection has image generated by $tilde(R)$, $tau$, $f \/ tau^2$, and $g \/ tau^2$. By (4.7), this image is precisely $tilde(R) \[ tau \, v \/ tau^2 \]$. In particular it is a domain. The map $G arrow.r G ⊗_R tilde(R)$ is faithfully flat by base change, and hence injective.
  For completeness, the single displayed relation is the entire presentation. Let $W$ be an indeterminate and set $Q = tilde(R) \[ tau \, W \] \/ \( tau^2 W - v \)$. If $tau F = \( tau^2 W - v \) B$ in $tilde(R) \[ tau \, W \]$, reduction modulo $tau$ gives $v B \( 0 \, W \) = 0$. Since $tilde(R) \[ W \]$ is a domain and $v eq.not 0$, we have $B = tau B_1$; cancellation then gives $F = \( tau^2 W - v \) B_1$. Thus $tau$ is a nonzerodivisor in $Q$. After inverting $tau$, the relation eliminates $W$ and identifies $Q \[ tau^(- 1) \]$ with $tilde(R) \[ tau \, tau^(- 1) \]$. It follows that $Q$ injects into that Laurent ring with image $tilde(R) \[ tau \, v \/ tau^2 \]$, proving (4.4). The two gradings follow from $deg \( v \) = 0$ and $"wt" \( v \) = 2$; the relation $tau^2 V = v$ is homogeneous for each. ◻
]

Write $Y = "Spec" R$ and $Z = "Spec" G$. The geometric content of (4.4) is the Cartesian square

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$"Spec" tilde(G)$])
  content((2.849, 0), [$"Spec" tilde(R)$])
  content((0, -1.585), [$Z$])
  content((2.849, -1.585), [$Y .$])
  line((0.732, 0), (2.117, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((2.849, -0.2725), (2.849, -1.313), mark: (end: ">"))
  line((0.336, -1.585), (2.447, -1.585), mark: (end: ">"))
})

If $L_Y$ is the line bundle just constructed on $Y$, then $"Spec" tilde(G) = L^times$, where $L$ is its pullback to $Z$ and $L^times$ denotes the complement of its zero section.

=== 4.2 A normalized lift on a line bundle <a-normalized-lift-on-a-line-bundle>

The pullback is a line bundle over $Z = "Spec" G$. An additive action on $Z$ need not descend to $Y = "Spec" R$, so a lift obtained by first acting on $Y$ would not suffice. Instead, we prove a lifting statement for any line bundle over a smooth integral affine base. The two ingredients are invariance of the Picard group under adjoining a variable and the absence of nonconstant polynomial units over a domain.

For a variety $X$, $"Pic" \( X \)$ is the group of isomorphism classes of line bundles on $X$, with tensor product as its operation. For a line bundle $L$ on $X$, normalization means that the restriction over ${ 0 } times X$ is the identity on $L$. The Picard-group assertion is the regular-ring case of Traverso’s theorem [25] Theorem 3.6. Additive linearization also follows from the equivariant Picard-group results of Brion [5] Proposition 2.10 and Theorem 2.14. For the normalized isomorphism and cocycle verification we follow [5] Lemma 2.9; we include the argument to make the subsequent compatibility with valuation degree explicit.

#thm([Proposition 4.2.])[
  #emph[Let $X$ be a smooth integral affine variety over $bb(C)$, and let $pi : bb(A)^1 times X arrow.r X$ be the projection. Then 
$ pi^(*) : "Pic" \( X \) arrow.r^(med tilde.op med) "Pic" \( bb(A)^1 times X \) . $

 For every algebraic additive action $alpha : bb(G)_a times X arrow.r X$ and every line bundle $L$ on $X$, there is a unique isomorphism of line bundles 
#[#set math.equation(numbering: n => "(4.8)")
 $ phi.alt : pi^(*) L arrow.r^(med tilde.op med) alpha^(*) L $ <bun:linearization-map>]

 whose restriction to ${ 0 } times X$ is $upright("id")_L$. This isomorphism obeys the action cocycle. It therefore defines a unique action on $L$ that lifts $alpha$, is linear on its fibers, and acts as the identity at the group identity. The action preserves $L^times$ and commutes with fiber scaling. If $L^times$ is affine, the induced derivation of its coordinate ring is locally nilpotent and preserves the fiber weights.]
] <prop:linearization>

#proof[
  Put $C = Gamma \( X \, cal(O)_X \)$ and $K = "Frac" C$. Both $X$ and $bb(A)^1 times X$ are regular. Their local rings are factorial, so every Weil divisor is Cartier and their Picard groups identify with their divisor class groups [22] Tags 056S, 0AG0, and 0BE9. Let $D$ be a Weil divisor on $"Spec" C \[ t \]$. Its restriction to $"Spec" K \[ t \]$ is principal, since $K \[ t \]$ is a principal ideal domain. Choose $r in K \( t \)^(*)$ giving that divisor. Subtracting $"div" \( r \)$ from $D$ removes every prime component whose defining prime ideal has zero contraction to $C$.
  Each remaining component has a height-one prime ideal $frak(P) subset C \[ t \]$ with nonzero contraction. Choose $0 eq.not c in frak(P) ∩ C$, and choose a prime $frak(q)$ minimal over $\( c \)$ and contained in $frak(P) ∩ C$. The principal ideal theorem [22] Tag 00KV and the fact that $C$ is a domain give $"ht" frak(q) = 1$. Now $frak(q) C \[ t \]$ is a nonzero prime contained in the height-one prime $frak(P)$, so $frak(P) = frak(q) C \[ t \]$. The corresponding divisor is the pullback of the prime divisor defined by $frak(q)$, with multiplicity one: a uniformizer of the discrete valuation ring $C_(frak(q))$ is also a uniformizer at the generic point of that pulled-back divisor. Thus every divisor class on $bb(A)^1 times X$ is pulled back from $X$, proving surjectivity of $pi^(*)$. Restriction to $i_0 : X arrow.r bb(A)^1 times X$, $x mapsto \( 0 \, x \)$, is a left inverse to $pi^(*)$ on Picard groups, proving injectivity as well.
  Since $alpha compose i_0 = pi compose i_0 = upright("id")_X$, the line bundles $alpha^(*) L$ and $pi^(*) L$ have the same restriction to the identity section. The Picard isomorphism just proved implies that they are isomorphic. Take an isomorphism $phi.alt_1$ between them, with the orientation in (4.8). Its restriction $i_0^(*) phi.alt_1$ is an automorphism of $L$. Composing on the source with $pi^(*) \( \( i_0^(*) phi.alt_1 \)^(- 1) \)$ produces an isomorphism $phi.alt$ whose restriction is the identity.
  An automorphism of any line bundle on a scheme is multiplication by a global unit: its endomorphism sheaf is canonically the structure sheaf. Because $C$ is a domain,
  #[#set math.equation(numbering: n => "(4.9)")
   $ C \[ t \]^(*) = C^(*) \, #h(2em) C \[ s \, t \]^(*) = C^(*) . $ <bun:parameter-units>]
  Indeed, total degree of a product of nonzero polynomials over a domain is the sum of their total degrees, so a polynomial unit has degree zero. The ratio of two normalized isomorphisms in (4.8) is a unit of $C \[ t \]$ whose value at $t = 0$ is one. By (4.9), that ratio is one. This proves uniqueness, without a restriction on the units of $C$.
  To check the cocycle, denote the fiber map by $phi.alt_(t \, x) : L_x arrow.r L_(alpha \( t \, x \))$. Over $bb(A)^2 times X$, the two compositions to compare are
  $ phi.alt_(t \, alpha \( s \, x \)) compose phi.alt_(s \, x) \, quad phi.alt_(s + t \, x) : L_x arrow.r L_(alpha \( s + t \, x \)) . $
  Their sources and targets agree by the action law for $alpha$. Thus
  $ phi.alt_(s + t \, x)^(- 1) compose phi.alt_(t \, alpha \( s \, x \)) compose phi.alt_(s \, x) $
  is an automorphism of the pullback of $L$ from $X$, hence a unit of $C \[ s \, t \]$. At $s = 0$ it is the identity. By (4.9), it is the identity everywhere. This proves the cocycle. The family of fiber maps consequently defines an algebraic additive action on the total space of $L$. Linearity preserves zero and nonzero vectors and commutes with scalar multiplication, giving the asserted action on $L^times$.
  Finally, suppose $L^times = "Spec" T$ is affine. Write its action on functions as
  $ rho \( r \) = sum_(n gt.eq 0) delta_n \( r \) t^n in T \[ t \] \, #h(2em) r in T \, $
  where the sum is finite for each $r$. The identity and action laws give $delta_0 = upright("id")$ and
  $ delta_i delta_j = binom(i + j, i) delta_(i + j) . $
  The coefficient of $t$ in multiplicativity of $rho$ says that $delta_1$ is a derivation. Since the characteristic is zero, the displayed composition identity gives $delta_n = delta_1^n \/ n !$. Finiteness of $rho \( r \)$ now says that $delta_1$ is locally nilpotent. Commutation with fiber scaling says precisely that this derivation preserves the fiber weights. ◻
]

=== 4.3 Compatibility with valuation degree <compatibility-with-valuation-degree>

The preceding proposition gives a lift preserving fiber weights. We still need its valuation degree to agree with that of the original derivation. The degree action has its own explicit bundle lift; uniqueness of the normalized additive lift makes the two compatible.

#thm([Proposition 4.3.])[
  #emph[Let $D_0$ be a homogeneous locally nilpotent derivation of $G$ of valuation degree shift $j$. There is a locally nilpotent derivation $tilde(D)$ of $tilde(G)$ restricting to $D_0$ on $G$, with fiber weight zero and valuation degree shift $j$. If $D_0 eq.not 0$, then $tilde(D) eq.not 0$.]
] <prop:homogeneous-lift>

#proof[
  By 6, $Z = "Spec" G$ is smooth and integral. Exponentiating $D_0$ gives the algebraic action on functions
  $ exp \( t D_0 \) \( r \) = sum_(n gt.eq 0) frac(D_0^n \( r \), n !) t^n . $
  Apply 10 to this action and the line bundle $L$ on $Z$ whose complement is $"Spec" tilde(G)$. The resulting locally nilpotent derivation $tilde(D)$ restricts to $D_0$ because the action covers the given action on $Z$, and has fiber weight zero because the lift commutes with fiber scaling. Since $G arrow.r.hook tilde(G)$, a nonzero $D_0$ gives a nonzero $tilde(D)$.
  It remains to establish its valuation degree. For $lambda in bb(C)^(*)$, let $sigma_lambda$ be the automorphism of $G$ multiplying a homogeneous element of degree $h$ by $lambda^h$. It fixes the coefficient subring $R$ pointwise. Therefore it has the pullback lift $tilde(sigma)_lambda = sigma_lambda ⊗ upright("id")_(tilde(R))$ on $tilde(G)$. Explicitly,
  #[#set math.equation(numbering: n => "(4.10)")
   $ tilde(sigma)_lambda \( r \) = r quad \( r in tilde(R) \) \, #h(2em) tilde(sigma)_lambda \( tau \) = lambda^(- 1) tau \, #h(2em) tilde(sigma)_lambda \( V \) = lambda^2 V . $ <bun:degree-scaling>]
  Geometrically this lift acts on $L = Z times_Y L_Y$ by the degree action on $Z$ and the identity on $L_Y$. In particular it extends to a linear bundle automorphism, and its action on the complement agrees with (4.10).
  On the coordinate ring of the base, homogeneity of $D_0$ gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ sigma_lambda D_0 sigma_lambda^(- 1) = lambda^j D_0 . $ <bun:base-conjugacy>]
  Conjugate the lifted additive action by $tilde(sigma)_lambda$, using the expression on coordinate rings
  $ tilde(sigma)_lambda thin exp \( t tilde(D) \) thin tilde(sigma)_lambda^(- 1) . $
  This is a normalized linear lift of the base action $exp \( lambda^j t D_0 \)$, by (4.11). The action $exp \( lambda^j t tilde(D) \)$ is another normalized linear lift of that same base action. Uniqueness in 10 therefore gives equality of these two families. Taking their coefficients of $t$ yields
  $ tilde(sigma)_lambda tilde(D) tilde(sigma)_lambda^(- 1) = lambda^j tilde(D) #h(2em) \( lambda in bb(C)^(*) \) . $
  For a homogeneous $r$ of degree $h$, this says $tilde(sigma)_lambda \( tilde(D) r \) = lambda^(h + j) tilde(D) r$ for every $lambda$. The distinct integral characters of $bb(G)_m$ are linearly independent, so $tilde(D) r$ is homogeneous of degree $h + j$ whenever it is nonzero. This proves the required degree shift. ◻
]

The additive lift in 11 is constructed on the line bundle over $Z = "Spec" G$. It does not require $D_0 \( R \) subset R$, and it does not assert $tilde(D) \( tilde(R) \) subset tilde(R)$. The invariance of coefficient rings used in the proof belongs to the separate degree action: $sigma_lambda$ fixes $R$, and $tilde(sigma)_lambda$ fixes $tilde(R)$.

== 5 Extracting a derivation on the determinant ring <sec:reduction>

We now pass from a homogeneous additive action on the degeneration to a locally nilpotent derivation of

$ tilde(R) = bb(C) \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) $

with a prescribed sign for its fiber weight. Throughout this section, #emph[degree] means the valuation degree, so that

$ deg tilde(R) = 0 \, #h(2em) deg tau = - 1 \, #h(2em) deg V = 2 . $

The separate fiber weights are

$ "wt" \( a \) = "wt" \( d \) = 1 \, quad "wt" \( b \) = "wt" \( c \) = - 1 \, quad "wt" \( u \) = "wt" \( tau \) = 0 \, quad "wt" \( V \) = 2 . $

By 9, we work in the domain

#[#set math.equation(numbering: n => "(5.1)")
 $ tilde(G) = tilde(R) \[ tau \, V \] subset tilde(R) \[ tau \, tau^(- 1) \] \, #h(2em) tau^2 V = v = a^3 b - a^2 u^3 - d^2 . $ <red:ring>]

In particular, $tau$, $V$, and $v$ are nonzero. The notation $tilde(R) \[ tau \, V \]$ here denotes the indicated subalgebra, with the displayed relation.

The positive-degree invariant supplied by polynomiality will be divisible by $V$. The elementary order of a locally nilpotent derivation makes its kernel factorially closed, so this divisibility will force $V$ itself to be invariant. We recall the argument, including the order estimates needed when $tau$ moves; compare Finston–Maubach [9] Lemma 1.1.

#thm([Lemma 5.1.])[
  (Order of a locally nilpotent derivation).  #emph[Let $T$ be a domain over $bb(C)$ and let $delta$ be a locally nilpotent derivation of $T$. For $0 eq.not h in T$, define 
$ nu_delta \( h \) = max { n gt.eq 0 : delta^n \( h \) eq.not 0 } . $

 Then for nonzero $f \, g in T$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ nu_delta \( f g \) = nu_delta \( f \) + nu_delta \( g \) . $ <red:order-product>]

 If $delta \( h \) eq.not 0$, then $nu_delta \( delta \( h \) \) = nu_delta \( h \) - 1$. Consequently, $ker delta$ is factorially closed in $T$: if $0 eq.not f g in ker delta$, then $f \, g in ker delta$. Moreover, $delta \( h \) eq.not 0$ implies $delta \( h \) in.not h T$.]
] <lem:lnd-order>

#proof[
  Local nilpotence makes the defining maximum finite. Set $r = nu_delta \( f \)$ and $s = nu_delta \( g \)$. The iterated Leibniz rule gives
  $ delta^n \( f g \) = sum_(i = 0)^n binom(n, i) delta^i \( f \) delta^(n - i) \( g \) . $
  For $n > r + s$ every term is zero. For $n = r + s$ only the term with $i = r$ can be nonzero, and it equals
  $ binom(r + s, r) delta^r \( f \) delta^s \( g \) eq.not 0 . $
  Here we use both characteristic zero and the domain property. This proves (5.2). The assertion about $delta \( h \)$ follows directly from the definition. Since a nonzero element has order zero exactly when it is invariant, product additivity proves factorial closure. Finally, if $0 eq.not delta \( h \) = h q$, then $q eq.not 0$ and
  $ nu_delta \( h \) - 1 = nu_delta \( delta \( h \) \) = nu_delta \( h \) + nu_delta \( q \) gt.eq nu_delta \( h \) \, $
  which is impossible. ◻
]

We will also use the exact homogeneous pieces of (5.1). Writing $tilde(G)_e$ for its degree-$e$ component, they are

#[#set math.equation(numbering: n => "(5.3)")
 $ tilde(G)_e = cases(delim: "{", tau^(- e) tilde(R) \, & e < 0 \,, V^ell tilde(R) \, & e = 2 ell \, quad ell gt.eq 0 \,, tau V^(ell + 1) tilde(R) \, & e = 2 ell + 1 \, quad ell gt.eq 0 .) $ <red:pieces>]

Indeed, a degree-$e$ element is an $tilde(R)$-linear combination of monomials $tau^i V^h$ with $i \, h gt.eq 0$ and $2 h - i = e$. Using $tau^2 V = v$, these monomials become, respectively,

$ tau^(- e) v^h \, #h(2em) V^ell v^(h - ell) \, #h(2em) tau V^(ell + 1) v^(h - ell - 1) . $

The exponents of $v$ in the relevant cases are nonnegative. Conversely, the multipliers displayed in (5.3) belong to $tilde(G)$ and have the required degrees. This proves the equalities, including that their coefficients lie in $tilde(R)$. Since the multipliers are nonzero and $tilde(G)$ is a domain, each such coefficient is unique.

#thm([Proposition 5.2.])[
  #emph[If $A tilde.equiv bb(C)^(\[ 4 \])$, there are a nonzero locally nilpotent derivation $E$ of $tilde(R)$ and an integer $q lt.eq 0$ such that $E$ is homogeneous of fiber weight shift $q$ and 
$ E^2 \( v \) = 0 . $

 Here homogeneity means that $E \( r \)$ has fiber weight $"wt" \( r \) + q$ whenever $r$ is fiber homogeneous and $E \( r \) eq.not 0$.]
] <prop:extracted-lnd>

#proof[
  By 8, polynomiality of $A$ supplies a nonzero homogeneous LND $D_0$ of $G$ and a nonzero homogeneous $h_0 in ker D_0$ of positive degree. Apply 11 to obtain an LND $tilde(D)$ of $tilde(G)$ lifting $D_0$, homogeneous of some degree shift $j in bb(Z)$ and of fiber weight shift zero. The injection $G arrow.r.hook tilde(G)$ in 9 ensures both that $tilde(D) eq.not 0$ and that the image $h$ of $h_0$ is nonzero. This image is a homogeneous invariant of the same positive degree. By (5.3), $h$ is divisible by $V$ in $tilde(G)$. Factorial closure in 12 therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ tilde(D) \( V \) = 0 . $ <red:V-invariant>]
  We distinguish whether $tau$ is also invariant. If it is, the derivation restricts after removing a power of $tau$. If it is not, the homogeneous pieces force a positive factor of $V$ into its values on $tilde(R)$; removing this factor produces a derivation of negative fiber weight. The LND order proves local nilpotence in this second case without assuming that $tilde(D)$ preserves $tilde(R)$.
  #strong[Case 1: $tilde(D) \( tau \) = 0$.] In this case $tilde(D)$ extends to a locally nilpotent derivation of
  $ tilde(G) \[ tau^(- 1) \] = tilde(R) \[ tau \, tau^(- 1) \] . $
  Indeed, for $f in tilde(G)$ and $m gt.eq 0$, all iterates on $f tau^(- m)$ equal $tau^(- m) tilde(D)^n \( f \)$. The degree-$j$ component of this Laurent polynomial ring is exactly $tau^(- j) tilde(R)$. Since every $r in tilde(R)$ has degree zero, there is thus a unique $E \( r \) in tilde(R)$ satisfying
  #[#set math.equation(numbering: n => "(5.5)")
   $ tilde(D) \( r \) = tau^(- j) E \( r \) . $ <red:fixed-tau>]
  Linearity and the Leibniz rule for $tilde(D)$, followed by cancellation of $tau^(- j)$, show that $E : tilde(R) arrow.r tilde(R)$ is a $bb(C)$-derivation. It has fiber weight shift zero because $tau$ has fiber weight zero and $tilde(D)$ preserves fiber weight. Since $tilde(D) \( tau \) = 0$, induction in (5.5) gives
  $ tilde(D)^n \( r \) = tau^(- n j) E^n \( r \) #h(2em) \( n gt.eq 0 \) . $
  Local nilpotence of $tilde(D)$ therefore proves local nilpotence of $E$. By (5.4),
  $ 0 = tilde(D) \( tau^2 V \) = tilde(D) \( v \) = tau^(- j) E \( v \) \, $
  so $E \( v \) = 0$. Finally, $E = 0$ would make $tilde(D)$ vanish on $tilde(R)$, $tau$, and $V$, which generate $tilde(G)$; hence $E eq.not 0$. This proves the desired conclusion with $q = 0$.
  #strong[Case 2: $tilde(D) \( tau \) eq.not 0$.] Write $nu = nu_(tilde(D))$ on the nonzero elements of $tilde(G)$, and put $m = nu \( tau \) gt.eq 1$. By 12, $tilde(D) \( tau \) in.not tau tilde(G)$. On the other hand, this element is homogeneous of degree $j - 1$. (5.3) shows that every component of negative degree, and every component of positive odd degree, is contained in $tau tilde(G)$. We must therefore have
  #[#set math.equation(numbering: n => "(5.6)")
   $ j - 1 = 2 ell quad upright("for some ") ell gt.eq 0 \, #h(2em) j = 2 ell + 1 . $ <red:odd-shift>]
  For $r in tilde(R)$, the value $tilde(D) \( r \)$ belongs to the degree-$j$ piece. By (5.3) there is a unique element $E \( r \) in tilde(R)$ such that
  #[#set math.equation(numbering: n => "(5.7)")
   $ tilde(D) \( r \) = tau V^(ell + 1) E \( r \) . $ <red:moving-tau>]
  Thus the values of $E$ lie in $tilde(R)$ before any iteration or nilpotence argument is used. Cancellation of the common nonzero multiplier in the linearity and Leibniz identities again proves that $E$ is a $bb(C)$-derivation of $tilde(R)$. Since that multiplier has fiber weight $2 \( ell + 1 \)$, the fiber weight shift of $E$ is
  #[#set math.equation(numbering: n => "(5.8)")
   $ q = - 2 \( ell + 1 \) < 0 . $ <red:negative-weight>]
  We prove local nilpotence inside $tilde(G)$ using its LND order. Whenever $E \( r \) eq.not 0$, (5.7), (5.4), and 12 imply
  #[#set math.equation(numbering: n => "(5.9)")
   $ nu \( E \( r \) \) = nu \( r \) - 1 - m . $ <red:order-decrease>]
  In fact, the order of the left side of (5.7) is $nu \( r \) - 1$, whereas that of its right side is $m + \( ell + 1 \) nu \( V \) + nu \( E \( r \) \) = m + nu \( E \( r \) \)$. Every iterate $E^n \( r \)$ still lies in $tilde(R)$. Consequently, as long as it is nonzero, successive applications of (5.9) give
  $ nu \( E^n \( r \) \) = nu \( r \) - n \( m + 1 \) . $
  This nonnegative integer cannot decrease indefinitely, proving that $E$ is locally nilpotent.
  Differentiating the relation in (5.1) gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ tau V^(ell + 1) E \( v \) = tilde(D) \( v \) = 2 tau V tilde(D) \( tau \) eq.not 0 . $ <red:moving-v>]
  The last inequality uses characteristic zero and the domain property. Thus $E \( v \) eq.not 0$, and in particular $E eq.not 0$. Product additivity and (5.4) give $nu \( v \) = nu \( tau^2 V \) = 2 m$; hence (5.9) yields
  $ nu \( E \( v \) \) = m - 1 . $
  If $E^2 \( v \)$ were nonzero, a second application would yield
  $ nu \( E^2 \( v \) \) = \( m - 1 \) - 1 - m = - 2 \, $
  an impossibility. Therefore $E^2 \( v \) = 0$, as required. ◻
]

#prodef([Remark 5.3.])[
  The restriction to nonpositive fiber weight is essential to the obstruction proved in 6. Indeed, the derivation
  $ E_(+) \( b \) = a \, #h(2em) E_(+) \( c \) = d \, #h(2em) E_(+) \( a \) = E_(+) \( d \) = E_(+) \( u \) = 0 $
  annihilates $a c - b d - 1$ and so defines a derivation of $tilde(R)$. It is locally nilpotent, since on the polynomial ring it lowers total degree in $b \, c$, and it has fiber weight shift $+ 2$. Nevertheless, $E_(+) \( v \) = a^4$ and $E_(+)^2 \( v \) = 0$.
] <red:sign-essential>

== 6 The rigidity obstruction <sec:rigidity>

We now exclude the derivation supplied by 13. Recall that

$ tilde(R) = bb(C) \[ a \, d \, b \, c \, u \] \/ \( a c - b d - 1 \) \, #h(2em) v = a^3 b - a^2 u^3 - d^2 \, $

and that the fiber weights of $\( a \, d \, b \, c \, u \)$ are $\( 1 \, 1 \, - 1 \, - 1 \, 0 \)$. A derivation has fiber shift $e$ if it sends each fiber-weight-$i$ component into the fiber-weight-$\( i + e \)$ component.

The proof first passes to the highest part for a third, auxiliary grading. It then studies the polynomial orbit of $N = d^2 + a^2 u^3$. The polynomial $a b c$ inequality forces this highest derivation to fix $u$, and a nonsquare in the original fraction field forces it to fix $a \, d$ as well. The determinant relation leaves only derivations whose fiber weight is positive.

The use of polynomial $a b c$ to constrain locally nilpotent derivations has precedents in Finston–Maubach [9] Section 2. We include the Wronskian proof of the Mason–Stothers inequality [19,23], followed by the elementary one-variable fact needed at the end of the argument.

#thm([Lemma 6.1.])[
  (Mason–Stothers polynomial $a b c$).  #emph[Let $F$ be a field of characteristic zero, and let $X \, Y \, Z in F \[ q \]$ be nonzero, pairwise relatively prime polynomials satisfying $X + Y = Z$. If they are not all constant, then 
$ max { deg X \, deg Y \, deg Z } lt.eq r \( X Y Z \) - 1 \, $

 where $r \( X Y Z \)$ is the number of distinct roots of $X Y Z$ in an algebraic closure of $F$.]
] <rig:abc>

#proof[
  Primes in this proof denote differentiation with respect to $q$. Consider the Wronskian
  $ W = X' Y - X Y' . $
  It is nonzero. Indeed, if $W = 0$, relative primality implies that $X$ divides $X'$. In characteristic zero this is impossible for nonconstant $X$, so $X$ is a nonzero constant. Then $Y' = 0$, hence $Y$ and $Z$ are constant as well, contrary to the hypothesis.
  The same Wronskian, up to sign, is obtained from either of the other two pairs, because $Z = X + Y$. Work over an algebraic closure only to count roots. A root of multiplicity $h$ of one of the three polynomials is not a root of either of the others. Computing $W$ from a pair containing that polynomial shows that $W$ vanishes at the root to order at least $h - 1$. These roots are distinct across the three polynomials, so, on writing $T = deg X + deg Y + deg Z$, we obtain
  $ deg W gt.eq T - r \( X Y Z \) . $
  On the other hand, compute $W$ from the two polynomials other than one of maximum degree $M$. Differentiation lowers the degree of every nonconstant polynomial by one, and therefore
  $ deg W lt.eq T - M - 1 . $
  Together these inequalities give $M lt.eq r \( X Y Z \) - 1$.
  The nonconstant hypothesis is necessary: for three nonzero constants the right side would be $- 1$. The nonzero hypothesis also causes no missing nonconstant case: if one member of a pairwise relatively prime triple $X + Y = Z$ is zero, the other two must be nonzero constants. The all-zero triple is not pairwise relatively prime. ◻
]

#thm([Lemma 6.2.])[
  (Derivations in one variable).  #emph[Let $F$ be a field of characteristic zero. If $delta$ is a locally nilpotent $F$-derivation of $F \[ t \]$, then $delta \( t \) in F$.]
] <rig:one-variable>

#proof[
  Write $delta = P \( t \) thin d \/ d t$. There is nothing to prove if $P = 0$. Otherwise let $m = deg P$ and let $gamma eq.not 0$ be its leading coefficient. If $m gt.eq 1$, induction shows that, for every $n gt.eq 1$, the polynomial $delta^n \( t \)$ has degree $1 + n \( m - 1 \)$ and leading coefficient
  $ gamma^n product_(j = 0)^(n - 1) #scale(x: 120%, y: 120%)[\(] 1 + j \( m - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Every factor is nonzero in characteristic zero, including when $m = 1$. Thus no iterate vanishes, contradicting local nilpotence. Consequently $m = 0$. ◻
]

#thm([Proposition 6.3.])[
  #emph[There is no nonzero locally nilpotent $bb(C)$-derivation $E$ of $tilde(R)$ with a fixed fiber shift $e lt.eq 0$ and $E^2 \( v \) = 0$.]
] <prop:rigidity>

#proof[
  Suppose such an $E$ exists. We introduce an #emph[auxiliary grading], distinct from both the valuation degree and the fiber weight:
  #[#set math.equation(numbering: n => "(6.1)")
   $ & a & d & b & c & u\
upright("valuation degree") & 0 & 0 & 0 & 0 & 0\
upright("fiber weight") & 1 & 1 & - 1 & - 1 & 0\
upright("auxiliary degree") & 0 & 3 & - 3 & 0 & 2 . $ <rig:auxiliary-grading>]
  The relation $a c - b d - 1$ is homogeneous of auxiliary degree zero, so this is an actual $bb(Z)$-grading on $tilde(R)$. Its components need not vanish in negative degrees. The generators are homogeneous for both this grading and the fiber grading, and the relation is homogeneous for both; thus the two gradings commute.
  #emph[The highest auxiliary component.] For an auxiliary-homogeneous $r in tilde(R)$ of degree $i$, define $E_j \( r \)$ to be the degree-$\( i + j \)$ component of $E \( r \)$, and extend linearly to $tilde(R)$. Projecting the product rule to each degree shows that every $E_j$ is a derivation. Only finitely many of these derivations are nonzero: their values on the five generators are obtained from the finitely many homogeneous components of their images under $E$, and a derivation vanishing on all five generators is zero. We therefore have a finite decomposition
  $ E = sum_j E_j . $
  Let $lambda$ be its greatest nonzero shift and set $E' = E_lambda$. Then $E' eq.not 0$. For every auxiliary-homogeneous $r$ of degree $i$ and every $n gt.eq 1$, the component of $E^n \( r \)$ of degree $i + n lambda$ equals $\( E' \)^n \( r \)$: in the expansion of the iterate, each chosen shift is at most $lambda$, and their sum can equal $n lambda$ only when every chosen shift equals $lambda$. Local nilpotence of $E$ therefore implies local nilpotence of $E'$ on every homogeneous $r$, and hence on every element, which is a finite sum of such elements. This reasoning uses finite shift sets and finite sums, so the negative degrees in (6.1) cause no difficulty. Projection to auxiliary degree preserves fiber weight, and consequently $E'$ still has fiber shift $e$.
  Set
  $ N = d^2 + a^2 u^3 . $
  Both its summands have auxiliary degree $6$, whereas $a^3 b$ has auxiliary degree $- 3$. In $E^2 \( v \) = E^2 \( a^3 b - N \)$, the first term has auxiliary degrees at most $- 3 + 2 lambda$. The degree $6 + 2 lambda$ component of the second term is $\( E' \)^2 \( N \)$. Taking that component of $E^2 \( v \) = 0$ gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ \( E' \)^2 \( N \) = 0 . $ <rig:linear-orbit>]
  #emph[The orbit polynomials fix $a \, d \, u$.] The localization obtained by solving for $c$ is
  #[#set math.equation(numbering: n => "(6.3)")
   $ tilde(R) \[ a^(- 1) \] = bb(C) \[ a \, a^(- 1) \, d \, u \] \[ b \] \, #h(2em) c = frac(1 + b d, a) . $ <rig:a-chart>]
  In particular, $a \, d \, b \, u$ are algebraically independent, $N eq.not 0$, and the fraction field is
  #[#set math.equation(numbering: n => "(6.4)")
   $ K = "Frac" \( tilde(R) \) = bb(C) \( a \, d \, b \) \( u \) . $ <rig:original-field>]
  Since $E'$ is locally nilpotent, exponentiating it gives polynomials
  $ a \( q \) = exp \( q E' \) \( a \) \, quad d \( q \) = exp \( q E' \) \( d \) \, quad u \( q \) = exp \( q E' \) \( u \) quad upright("in ") tilde(R) \[ q \] subset K \[ q \] . $
  Each is nonzero, since its value at $q = 0$ is the corresponding nonzero element of $tilde(R)$. The exponential is multiplicative by the iterated product rule. Hence (6.2) implies
  #[#set math.equation(numbering: n => "(6.5)")
   $ d \( q \)^2 + a \( q \)^2 u \( q \)^3 = N \( q \) := exp \( q E' \) \( N \) = N + q E' \( N \) \, #h(2em) deg_q N \( q \) lt.eq 1 . $ <rig:orbit-sum>]
  Here $N \( q \) eq.not 0$ because $N \( 0 \) = N eq.not 0$. Thus neither summand nor their sum is the zero polynomial.
  The three polynomials in (6.5) are pairwise relatively prime in $K \[ q \]$. To see this, a common root of the two summands over $overline(K)$ would have multiplicity at least two in each summand. For the second summand this follows whether the root belongs to $a \( q \)$, to $u \( q \)$, or to both. Their sum would then have a root of multiplicity at least two, which a nonzero polynomial of degree at most one cannot have. Thus the summands are relatively prime, and the identity $X + Y = Z$ implies relative primality of the other two pairs. No relative primality between $a \( q \)$ and $u \( q \)$ is needed.
  Write
  $ D_a = deg_q a \( q \) \, #h(2em) D_d = deg_q d \( q \) \, #h(2em) D_u = deg_q u \( q \) . $
  Suppose at least one summand in (6.5) is nonconstant. A nonconstant summand has degree at least two. Since the sum has degree at most one, both summands must then have the same degree
  $ M = 2 D_d = 2 D_a + 3 D_u gt.eq 2 . $
  The number of distinct roots of their product with $N \( q \)$ is at most $D_d + D_a + D_u + deg_q N \( q \)$. Applying 15 therefore yields
  #[#set math.equation(numbering: n => "(6.6)")
   $ 2 D_d = 2 D_a + 3 D_u lt.eq D_d + D_a + D_u + deg_q N \( q \) - 1 lt.eq D_d + D_a + D_u . $ <rig:degree-bound>]
  This also covers constant $N \( q \)$; in that case the first bound is stronger. The last inequality gives $D_d lt.eq D_a + D_u$. Combining it with $2 D_d = 2 D_a + 3 D_u$ gives $3 D_u lt.eq 2 D_u$, so $D_u = 0$. Consequently $u \( q \) = u$ and $D_d = D_a > 0$.
  Let $alpha \, delta in K^(*)$ be the leading coefficients of $a \( q \)$ and $d \( q \)$, respectively. Cancellation of the degree-$M$ terms in (6.5) requires
  $ delta^2 + alpha^2 u^3 = 0 \, #h(2em) upright("hence") #h(2em) (delta / alpha)^2 = - u^3 . $
  This equality would hold in the original field $K$ of (6.4), not merely in $overline(K)$. It is impossible: put $K_0 = bb(C) \( a \, d \, b \)$, so that $K = K_0 \( u \)$. For a nonzero rational function of $u$, the multiplicity of $u$ in its numerator minus its multiplicity in its denominator defines an integer-valued order. A square has even order, while $- u^3$ has order three. Passing to $overline(K)$ above was used only for counting roots and has not changed the field of the leading coefficients.
  We conclude that both summands in (6.5) are constant. Their nonvanishing gives $2 D_d = 0$ and $2 D_a + 3 D_u = 0$. All three degrees are nonnegative, so $D_a = D_d = D_u = 0$. Taking coefficients of $q$ in their exponentials now gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ E' \( a \) = E' \( d \) = E' \( u \) = 0 . $ <rig:fixed-coefficients>]
  #emph[The remaining coefficient has an impossible fiber weight.] Differentiating $a c - b d = 1$ and using (6.7) gives $a E' \( c \) = d E' \( b \)$. Define
  $ h = c E' \( b \) - b E' \( c \) in tilde(R) . $
  Using both determinant identities, without dividing by either $a$ or $d$, gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ a h = \( a c - b d \) E' \( b \) = E' \( b \) \, #h(2em) d h = \( a c - b d \) E' \( c \) = E' \( c \) . $ <rig:h-formulas>]
  Let $C_0 = bb(C) \[ a \, d \, u \]$ and $Q = "Frac" \( C_0 \) = bb(C) \( a \, d \, u \)$. By (6.7), every nonzero element of $C_0$ is invariant. Thus $E'$ extends to a locally nilpotent $Q$-derivation of
  $ \( C_0 \\ { 0 } \)^(- 1) tilde(R) = Q \[ b \] \, $
  where the equality follows by solving for $c$ as in (6.3). Local nilpotence is preserved because $\( E' \)^n \( r \/ s \) = \( E' \)^n \( r \) \/ s$ for $s in C_0 \\ { 0 }$. By 16, $E' \( b \) in Q$; hence (6.8) implies $h in Q$.
  We spell out the coefficient intersection that improves this to $h in C_0$. Besides (6.3), solving for $b$ gives
  $ tilde(R) \[ d^(- 1) \] = bb(C) \[ a \, d \, d^(- 1) \, u \] \[ c \] \, #h(2em) b = frac(a c - 1, d) . $
  Since $b$ and $c$ are each transcendental over $Q$, comparison of polynomial coefficients in these two presentations gives
  $ tilde(R) ∩ Q subset C_0 \[ a^(- 1) \] ∩ C_0 \[ d^(- 1) \] = C_0 . $
  The last intersection is taken in $Q$: in the unique factorization domain $C_0$, the reduced denominator of an element belonging to both rings must divide a power of $a$ and a power of $d$. As $a$ and $d$ are relatively prime, that denominator is a unit. Conversely $C_0 subset tilde(R) ∩ Q$, so the intersection is exactly $C_0$. In particular $h in C_0$.
  The derivation $E'$ is nonzero and fixes $a \, d \, u$; therefore (6.8) implies $h eq.not 0$. Since $E'$ has fiber shift $e$, the definition of $h$ shows that it is homogeneous of fiber weight $e - 2 < 0$. But every monomial in $C_0 = bb(C) \[ a \, d \, u \]$ has nonnegative fiber weight, because the weights of $a \, d \, u$ are $1 \, 1 \, 0$. A nonzero element of $C_0$ cannot have negative fiber weight. This contradiction proves the proposition. ◻
]

#proof[
  The explicitly defined algebra $A = P \/ \( H \)$ is a finitely generated unital $bb(C)$-algebra. By 3 it is integral, with fraction field $bb(C) \( p \, x \, y \, z \)$, and hence has dimension four. Moreover, 4 gives a $bb(C)$-algebra isomorphism
  $ A \[ w \] tilde.equiv bb(C)^(\[ 5 \]) . $
  Suppose that $A tilde.equiv bb(C)^(\[ 4 \])$. By Proposition 3.2, Proposition 3.4, its associated graded ring $G$ admits a nonzero homogeneous locally nilpotent derivation $D_0$ with a nonzero homogeneous invariant of positive valuation degree. The principal bundle and its coordinate ring $tilde(G)$ are given by 9. By 11, $D_0$ lifts to a locally nilpotent derivation $tilde(D)$ on $tilde(G)$ with the same valuation degree shift and fiber shift zero. The reduction of this lift and invariant in 13 produces a nonzero locally nilpotent derivation $E$ of $tilde(R)$ with a fixed nonpositive fiber shift and $E^2 \( v \) = 0$. This contradicts 17. Thus $A tilde.nequiv bb(C)^(\[ 4 \])$, while its cylinder is $bb(C)^(\[ 5 \])$. Taking $n = 4$ proves the claimed counterexample over $bb(C)$. ◻
]

== 7 Nontrivial affine-space fibrations <sec:affine-fibrations>

The residual-coordinate property of $H$ determines the fibers of two natural morphisms. We first use it to prove that the morphisms are smooth, then use the nonpolynomiality of $A$ to rule out Zariski local triviality.

#thm([Corollary 7.1.])[
  (Nontrivial smooth $bb(A)^3$-fibrations).  #emph[Let $P \, H \, A$ be as in (1.2), and put $X = "Spec" A$. Write $bb(A)_p^1 = "Spec" bb(C) \[ p \]$ and $bb(A)_(p \, q)^2 = "Spec" bb(C) \[ p \, q \]$, where $q$ is independent of $p$. Consider the morphisms 
$ pi : X arrow.r bb(A)_p^1 \, #h(2em) rho = \( p \, H \) : "Spec" P = bb(A)^5 arrow.r bb(A)_(p \, q)^2 \, $

 induced respectively by $bb(C) \[ p \] arrow.r A$ and by $bb(C) \[ p \, q \] arrow.r P$ with $q mapsto H$. Both are smooth surjective morphisms of relative dimension three. For either morphism and every point $y$ of its base, the fiber over $y$ is isomorphic to $bb(A)_(kappa \( y \))^3$; in particular, every geometric fiber is affine three-space. Neither morphism is a Zariski-locally trivial $bb(A)^3$-bundle. Thus the Dolgachev–Weisfeiler affine-fibration conjecture fails in relative dimension three over each of the smooth complex affine bases $bb(A)^1$ and $bb(A)^2$.]
] <cor:affine-fibrations>

#proof[
  Set $Lambda = bb(C) \[ p \]$ and write $upright(bold(z)) = \( s \, u \, F \, J \)$. For every prime $frak(p)$ of $Lambda$, let $H_(frak(p))$ denote the image of $H$ in $kappa \( frak(p) \) \[ upright(bold(z)) \]$. The coordinate changes in (2.3), (2.4) show that $H$ is a coordinate over $bb(C) \[ p \, p^(- 1) \]$. At $frak(p) = \( p \)$, the determinant-one change in (2.7), (2.8) gives $H_(frak(p)) = L med mod med p$. Every other prime of $Lambda$ avoids $p$. It follows that for every $frak(p)$ there are three polynomials $G_1 \, G_2 \, G_3$ over $kappa \( frak(p) \)$ such that
  #[#set math.equation(numbering: n => "(7.1)")
   $ kappa \( frak(p) \) \[ upright(bold(z)) \] = kappa \( frak(p) \) \[ H_(frak(p)) \, G_1 \, G_2 \, G_3 \] $ <fib:residual-coordinate>]
  is a polynomial coordinate system.
  Let $y$ be any point of $bb(A)_(p \, q)^2$, set $frak(p) = ker \( Lambda arrow.r kappa \( y \) \)$, and let $b$ be the image of $q$ in $kappa \( y \)$. The field $kappa \( y \)$ is an extension of $kappa \( frak(p) \)$. Tensoring (7.1) with $kappa \( y \)$ and then setting the coordinate $H_(frak(p))$ equal to $b$ gives
  $ rho_y = "Spec" #scale(x: 120%, y: 120%)[\(] kappa \( y \) \[ upright(bold(z)) \] \/ \( H_(frak(p)) - b \) #scale(x: 120%, y: 120%)[\)] tilde.eq bb(A)_(kappa \( y \))^3 . $
  Here $H_(frak(p))$ in the quotient denotes its image after this field extension. Thus every fiber of $rho$ is affine three-space over its residue field, and the same is true after extension to an algebraic closure. In particular, $rho$ is surjective. Moreover,
  $ A = P \/ \( H \) tilde.eq P ⊗_(Lambda \[ q \]) Lambda \, #h(2em) q mapsto 0 \, $
  so $pi$ is the base change of $rho$ along the closed immersion $bb(A)_p^1 arrow.r.hook bb(A)_(p \, q)^2$ defined by $q = 0$. The fiber assertions and surjectivity follow for $pi$ as well.
  We next check smoothness without assuming local triviality. Let
  $ frak(j) = (frac(partial H, partial s) \, frac(partial H, partial u) \, frac(partial H, partial F) \, frac(partial H, partial J)) subset P . $
  For every $frak(p)$, differentiation with respect to the coordinate $H_(frak(p))$ in (7.1) gives a $kappa \( frak(p) \)$-derivation $delta$ with $delta \( H_(frak(p)) \) = 1$. The chain rule expresses $1$ as a linear combination of the four partial derivatives of $H_(frak(p))$. Consequently the image of $frak(j)$ generates the unit ideal in $kappa \( frak(p) \) \[ upright(bold(z)) \]$. If a prime of $P$ contained $frak(j)$, localization and reduction over its contraction to $Lambda$ would give a proper prime of this fiber algebra containing that unit ideal. Hence $frak(j) = P$.
  As a $Lambda \[ q \]$-algebra, $P$ has the presentation
  $ P tilde.eq Lambda \[ q \] \[ upright(bold(z)) \] \/ \( q - H \) . $
  The principal open sets on which one of the four displayed partial derivatives is invertible cover $"Spec" P$. On each such open set this presentation has one relation with an invertible Jacobian minor, so it is standard smooth of relative dimension $4 - 1 = 3$. Thus $rho$ is smooth of relative dimension three. Smoothness and relative dimension are preserved by base change, giving the same assertion for $pi$.
  Suppose now that one of the two morphisms is Zariski-locally trivial, and put
  $ \( R_0 \, B \) = \( bb(C) \[ p \] \, A \) quad upright("or") quad \( R_0 \, B \) = \( bb(C) \[ p \, q \] \, P \) \, $
  respectively, with the algebra structures specified in the statement. In either case, $B$ is a finitely presented $R_0$-algebra, and local triviality implies $B_(frak(m)) tilde.eq R_(0 \, frak(m))^(\[ 3 \])$ for every maximal ideal $frak(m)$ of $R_0$. Bass–Connell–Wright’s theorem [3] Theorem 3(a), in the formulation recalled by Gupta [14] Theorem 4.1, therefore gives an $R_0$-algebra isomorphism
  $ B tilde.eq "Sym"_(R_0) \( M \) $
  for a projective $R_0$-module $M$. This conclusion allows arbitrary polynomial transition automorphisms in the assumed local trivializations; no linear structure is assumed beforehand.
  The module $M$ is finitely generated. Indeed, if $frak(a)$ is the augmentation ideal of $"Sym"_(R_0) \( M \)$, then $M tilde.eq frak(a) \/ frak(a)^2$; finite generation follows because $B$ is a finite-type augmented $R_0$-algebra. Tensoring with each residue field and comparing the dimensions of the resulting polynomial rings shows that $M$ has rank three. For the freeness step, Suslin’s Theorem 2(b) [24] states that a finitely generated projective module of rank greater than $dim C$ over $C \[ t_1 \, dots.h \, t_m \]$ is extended from $C$ when $C$ is regular and noetherian. Here $C = bb(C)$ has dimension zero, giving the needed Quillen–Suslin statement: $M$ is extended from a three-dimensional complex vector space. Thus $M$ is free and
  $ B tilde.eq R_0^(\[ 3 \]) . $
  For $pi$ this would give $A tilde.eq bb(C) \[ p \]^(\[ 3 \]) tilde.eq bb(C)^(\[ 4 \])$, contrary to 1. For $rho$ an $R_0$-algebra isomorphism would give a polynomial coordinate system $P = bb(C) \[ p \, H \, G_1 \, G_2 \, G_3 \]$ for suitable $G_1 \, G_2 \, G_3 in P$. In particular, $H$ would be a coordinate of $P$, contrary to Corollary 2. Neither morphism is therefore Zariski-locally trivial. ◻
]

The two bases are smooth, normal, and affine over $bb(C)$. The fiber calculation verifies the residue-field hypothesis in the original affine-fibration assertion of Dolgachev–Weisfeiler, not only its geometric-fiber version. These counterexamples have relative dimension three; they do not address the corresponding assertions in relative dimensions one or two.

#heading(level: 1)[References]
#bibitem([1])[S.~S. Abhyankar, W. Heinzer, and P. Eakin, #emph[On the uniqueness of the coefficient ring in a polynomial ring], J. Algebra #strong[23] (1972), no.~2, 310--342. #link("https://doi.org/10.1016/0021-8693(72)90134-2").]
#bibitem([2])[T. Asanuma, #emph[Polynomial fibre rings of algebras over Noetherian rings], Invent. Math. #strong[87] (1987), 101--127. #link("https://doi.org/10.1007/BF01389155").]
#bibitem([3])[H. Bass, E.~H. Connell, and D.~L. Wright, #emph[Locally polynomial algebras are symmetric], Bull. Amer. Math. Soc. #strong[82] (1976), no.~5, 719--720. #link("https://doi.org/10.1090/S0002-9904-1976-14128-6").]
#bibitem([4])[J. Blanc and I. van Santen, #emph[Embeddings of affine spaces into quadrics], Trans. Amer. Math. Soc. #strong[371] (2019), no.~12, 8429--8465. #link("https://doi.org/10.1090/tran/7555").]
#bibitem([5])[M. Brion, #emph[On linearization of line bundles], J. Math. Sci. Univ. Tokyo #strong[22] (2015), no.~1, 113--147. #link("https://www.ms.u-tokyo.ac.jp/journal/pdf/jms220104.pdf").]
#bibitem([6])[A.~K. Dutta and A. Lahiri, #emph[On residual and stable coordinates], J. Pure Appl. Algebra #strong[225] (2021), no.~10, article 106707. #link("https://doi.org/10.1016/j.jpaa.2021.106707"). Preprint: #link("https://arxiv.org/abs/1908.03549v1")[arXiv:1908.03549v1].]
#bibitem([7])[E. Edo and S. Vénéreau, #emph[Length $2$ variables of $A \[ x \, y \]$ and transfer], Ann. Polon. Math. #strong[76] (2001), nos.~1--2, 67--76. #link("https://doi.org/10.4064/ap76-1-6").]
#bibitem([8])[M. El Kahoui and M. Ouali, #emph[A note on residual coordinates of polynomial rings], J. Commut. Algebra #strong[10] (2018), no.~3, 317--326. #link("https://doi.org/10.1216/JCA-2018-10-3-317").]
#bibitem([9])[D. Finston and S. Maubach, #emph[Constructing (almost) rigid rings and a UFD having infinitely generated Derksen and Makar-Limanov invariants], Canad. Math. Bull. #strong[53] (2010), no.~1, 77--86. #link("https://doi.org/10.4153/CMB-2010-017-8").]
#bibitem([10])[T. Fujita, #emph[On Zariski problem], Proc. Japan Acad. Ser. A Math. Sci. #strong[55] (1979), no.~3, 106--110. #link("https://doi.org/10.3792/pjaa.55.106").]
#bibitem([11])[S. Gaifullin and M. Petrov, #emph[Non-cancellative varieties, maximal tori, and the Makar-Limanov invariant], preprint, 15 July 2026. #link("https://arxiv.org/abs/2607.13593v1")[arXiv:2607.13593v1].]
#bibitem([12])[N. Gupta, #emph[On the cancellation problem for the affine space $bb(A)^3$ in characteristic $p$], Invent. Math. #strong[195] (2014), no.~1, 279--288. #link("https://doi.org/10.1007/s00222-013-0455-2").]
#bibitem([13])[N. Gupta, #emph[On Zariski's cancellation problem in positive characteristic], Adv. Math. #strong[264] (2014), 296--307. #link("https://doi.org/10.1016/j.aim.2014.07.012"). Preprint: #link("https://arxiv.org/abs/1309.1368v1")[arXiv:1309.1368v1].]
#bibitem([14])[N. Gupta, #emph[The Zariski cancellation problem and related problems in affine algebraic geometry], in #emph[Proceedings of the International Congress of Mathematicians 2022], vol.~3, EMS Press, Berlin, 2023, 1578--1598. #link("https://doi.org/10.4171/ICM2022/151").]
#bibitem([15])[Sh. Kaliman and L. Makar-Limanov, #emph[AK-invariant of affine domains], in #emph[Affine Algebraic Geometry], Osaka University Press, Osaka, 2007, 231--255. #link("https://www.math.miami.edu/~kaliman/library/KM-L.miyanishi.pdf").]
#bibitem([16])[Sh. Kaliman and M. Zaidenberg, #emph[Affine modifications and affine hypersurfaces with a very transitive automorphism group], Transform. Groups #strong[4] (1999), no.~1, 53--95. #link("https://doi.org/10.1007/BF01236662").]
#bibitem([17])[L. Makar-Limanov, #emph[On the hypersurface $x + x^2 y + z^2 + t^3 = 0$ in $bb(C)^4$ or a $bb(C)^3$-like threefold which is not $bb(C)^3$], Israel J. Math. #strong[96] (1996), 419--429. #link("https://doi.org/10.1007/BF02937314").]
#bibitem([18])[L. Makar-Limanov, P. van Rossum, V. Shpilrain, and J.-T. Yu, #emph[The stable equivalence and cancellation problems], Comment. Math. Helv. #strong[79] (2004), no.~2, 341--349. #link("https://doi.org/10.1007/s00014-003-0796-3").]
#bibitem([19])[R.~C. Mason, #emph[Diophantine Equations over Function Fields], London Mathematical Society Lecture Note Series #strong[96], Cambridge University Press, Cambridge, 1984. #link("https://doi.org/10.1017/CBO9780511752490").]
#bibitem([20])[S. Maubach, #emph[The commuting derivation conjecture], J. Pure Appl. Algebra #strong[179] (2003), nos.~1--2, 159--168. #link("https://doi.org/10.1016/S0022-4049(02)00198-6").]
#bibitem([21])[M. Miyanishi and T. Sugie, #emph[Affine surfaces containing cylinderlike open sets], J. Math. Kyoto Univ. #strong[20] (1980), no.~1, 11--42. #link("https://doi.org/10.1215/kjm/1250522319").]
#bibitem([22])[The Stacks Project Authors, #emph[The Stacks Project], accessed September 23, 2026. #link("https://stacks.math.columbia.edu/").]
#bibitem([23])[W.~W. Stothers, #emph[Polynomial identities and Hauptmoduln], Quart. J. Math. Oxford Ser.~(2) #strong[32] (1981), no.~3, 349--370. #link("https://doi.org/10.1093/qmath/32.3.349").]
#bibitem([24])[A.~A. Suslin, #emph[Projective modules over a polynomial ring are free], Dokl. Akad. Nauk SSSR #strong[229] (1976), no.~5, 1063--1066. #link("https://www.mathnet.ru/eng/dan40545").]
#bibitem([25])[C. Traverso, #emph[Seminormality and Picard group], Ann. Scuola Norm. Sup. Pisa Cl. Sci. (3) #strong[24] (1970), no.~4, 585--595. #link("https://www.numdam.org/item/ASNSP_1970_3_24_4_585_0/").]
#bibitem([26])[B.~Yu. Weisfeiler and I.~V. Dolgachev, #emph[Unipotent group schemes over integral rings], Math. USSR-Izv. #strong[8] (1974), no.~4, 761--800. #link("https://doi.org/10.1070/IM1974v008n04ABEH002127").]


