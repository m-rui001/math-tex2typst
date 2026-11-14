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

#align(center)[#text(size: 16pt, weight: "bold")[Hyperbolicity Cones Without Semidefinite Lifts]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

A real homogeneous polynomial $p$ on a finite-dimensional real vector space is #emph[hyperbolic with respect to]
  $e$ if $p \( e \) > 0$ and, for every $x$, all roots of $t mapsto p \( t e - x \)$ are real.
  Its closed hyperbolicity cone is

$ K \( p \, e \) = { x : upright("every root of ") t mapsto p \( t e - x \) upright(" is nonnegative") } . $

Gårding proved that this is a convex cone #cite(label("Garding1959")).
  The determinant on real symmetric matrices, with direction the identity,
  gives the positive semidefinite cone as a basic example. Hyperbolicity cones also support logarithmic
  self-concordant barriers, as shown by Güler #cite(label("Guler1997")),
  and hence form a natural setting for convex optimization beyond semidefinite programming.

A #emph[spectrahedron] is a set defined by a finite affine linear matrix inequality.
  A #emph[spectrahedral shadow], or a set with a finite semidefinite lift, is a set $S subset bb(R)^d$ of the form

#[#set math.equation(numbering: n => "(1.1)")
 $ S = {x in bb(R)^d : exists u in bb(R)^a \, A_0 + sum_(i = 1)^d x_i A_i +
   sum_(j = 1)^a u_j B_j succ.curly.eq 0} \, $ <eq:lift-definition>]

where $a$ and the common size of the real symmetric matrices are finite.
  Equality in this definition is exact; taking the closure of the displayed projection is not part of the
  definition. The #emph[generalized Lax conjecture] asserts that every hyperbolicity cone is a spectrahedron.
  The weaker #emph[Projected Lax Conjecture], formulated by Netzer and Sanyal #cite(label("NetzerSanyal2015")),
  asks whether every hyperbolicity cone is a spectrahedral shadow.

#thm([Theorem 1.1.])[
  #emph[There exists a real homogeneous hyperbolic polynomial whose closed hyperbolicity cone has no finite
    semidefinite lift.]
] <thm:main>

Thus both conjectures have a negative resolution. The assertion excludes every finite choice in (1.1),
  with arbitrary real coefficients and any number of auxiliary variables.
  The construction is an existence argument in high dimension,
  not a lower bound on the size of a particular representation.

=== 1.1 Context and earlier obstructions <context-and-earlier-obstructions>

The original Lax question concerned homogeneous polynomials in three variables #cite(label("Lax1958")).
  The determinantal theorem of Helton and Vinnikov #cite(label("HeltonVinnikov2007")),
  together with the equivalence explained by Lewis, Parrilo, and Ramana #cite(label("LewisParriloRamana2005")),
  gave an affirmative answer: a ternary hyperbolic polynomial has a definite symmetric determinantal
  representation. The distinction between a representation of a polynomial and a representation of its cone
  becomes essential in higher dimension. Brändén #cite(label("Branden2011")) constructed a real-zero polynomial
  for which no positive integral power has a definite determinantal representation.
  This does not exclude another polynomial with the same positivity region.
  Indeed, Kummer #cite(label("Kummer2016")) proved that the related specialized Vámos polynomial has a
  spectrahedral hyperbolicity cone. Nor does failure of a specified sums-of-squares relaxation,
  such as those studied by Kummer, Plaumann, and Vinzant #cite(label("KummerPlaumannVinzant2015")),
  exclude all finite lifts.

Positive representation results cover substantial classes.
  Brändén #cite(label("Branden2014")) proved spectrahedrality for elementary symmetric hyperbolicity cones.
  Building on the representability criteria of Helton and Nie #cite(label("HeltonNie2010")),
  Netzer and Sanyal #cite(label("NetzerSanyal2015")) Theorem 1.1 proved that a hyperbolicity cone is a
  spectrahedral shadow when each nonzero boundary point is a smooth point of its defining hyperbolic polynomial.
  Scheiderer #cite(label("Scheiderer2025")) subsequently obtained second-order-cone lifts for hyperbolicity cones
  with Nash-smooth boundary. Recent preprints prove spectrahedrality for five-variable hyperbolic cubics
  #cite(label("Netzer2026")) and for strictly hyperbolic polynomials #cite(label("KummerNetzer2026")).
  These results concern special families or impose regularity hypotheses;
  they do not yield an exact finite lift for every hyperbolicity cone.

For general convex semialgebraic sets, Scheiderer #cite(label("Scheiderer2018")) established nonexistence of
  semidefinite lifts by local positivity obstructions. His finite-dimensional sum-of-squares pullback criterion
  and local arguments explain how a putative lift constrains functions near a smooth point.
  He explicitly asked whether these methods could settle the hyperbolicity-cone question
  #cite(label("Scheiderer2018")) Section 5.4. The argument here is closely related to that approach,
  but tests analytic Gram identities directly by a finite positive moment functional.
  Moment and sum-of-squares semidefinite methods are classical #cite(label("Lasserre2001"));
  our functional need not be integration against a measure.
  The general relationship between cone lifts and positive factorizations is developed by Gouveia, Parrilo,
  and Thomas #cite(label("GouveiaParriloThomas2013")). We do not need to invoke their factorization theorem.

=== 1.2 The construction and proof strategy <the-construction-and-proof-strategy>

We begin with a matrix-valued homogeneous quadratic map $Q : bb(R)^m arrow.r
  "Sym"_r$ that is positive semidefinite at every real input.
  Here $"Sym"_r$ denotes the real symmetric $r$-by-$r$ matrices.
  Section 2 associates to $Q$ a homogeneous polynomial $p_Q$ and proves its hyperbolicity by a symmetric
  determinant identity on each line in the input space. It also identifies an exact affine section and projection
  of its closed cone:

$ E_Q = { \( A \, t \, y \) : A succ.curly.eq 0 \, med "ran" Q \( y \) subset.eq "ran" A \, med t gt.eq
  "tr" \( A^dagger Q \( y \) \) } . $

The symbol $A^dagger$ denotes the Moore–Penrose inverse. It is enough to choose $Q$ so that $E_Q$ has no finite lift.

The difficulty is to force such an obstruction while keeping $Q \( y \)$ positive semidefinite for #emph[every]
  $y$. Sections 3 and 4 address this constraint. Let $H$ be the 36-dimensional space of quadratic forms in eight
  variables. Each linear functional $y$ on quartic forms determines a Hankel matrix $Y \( y \)$ on $H$ by
  $Y \( y \) \( f \, g \) = y \( f g \)$. We construct a rank-twenty positive semidefinite Hankel matrix whose
  kernel has strong multiplication properties. After normalizing translations and dilations,
  its geometry yields a twenty-dimensional subspace $W subset
  H$ and a finite set of projective classes of nonzero symmetric forms on $W$.
  The class of every nonzero limit of inverses of compressions to $W$ arising in the separation argument belongs
  to this set. The seed matrix is established by the finite-field certificate in Appendix 6;
  the passage from its rank computations to a real positive semidefinite matrix is part of the proof.

For a sufficiently large integer $N$, finiteness lets us choose a tuple $w = \( w_1 \, dots.h \, w_N \) in
  W^N$ with $sum_i w_i^T C w_i eq.not 0$ for every representative $C$ of one of these classes.
  We then choose $U subset w^perp subset H^N$ so that convergence to $w$ of vectors $\( I_N ⊗ Y \( y \) \) u$,
  $u in U$, would force one of these pairings to vanish. Thus $w$ lies outside the closure of those Hankel images.
  A symmetric form $g$ can be chosen nonnegative on every such image and negative at $w$.
  Using a basis matrix also denoted by $U$, we set

$ G \( y \) = I_N ⊗ Y \( y \) \, wide Q \( y \) = U^top G \( y \) g G \( y \) U . $

Nonnegativity on the Hankel images proves that $Q$ is admissible.
  The construction uses $m = 330$ and $r = 20 N - 1$, where one may take $N > 10 dot.op 36^2$.

Section 5 turns the negative direction of $g$ into a local obstruction.
  Evaluation functionals at points $\( 1 \, s \)$, $s in bb(R)^7$,
  give a degree-four polynomial patch $x \( s \)$ in $E_Q$.
  A positive definite moment functional $Lambda$, applied to $x \( c + epsilon s \)$,
  produces points violating the trace inequality of $E_Q$ by a negative term of order $epsilon^4$.
  At the same time their $A$ coordinates are bounded below by a positive multiple of $epsilon^4 I$.

If a finite lift existed, semialgebraic selection would provide analytic lift coordinates and analytic Gram
  factors on an open part of this patch. Applying $Lambda$ to their Taylor polynomials almost preserves the lift
  inequality. A mixing argument on the common support of the feasible pencil values repairs the small error
  without a strict feasibility assumption. It yields feasible points within $O \( epsilon^16 \)$ of the tested
  patch, too close to remove its order-four violation. The finite positive extension and finite-jet approximation
  lemmas isolate reusable parts of this obstruction. Together with the finite inverse-limit construction,
  they supply the proof of Theorem 1.

== 2 A determinant construction and its affine section <sec:cone>

The first step is to place the obstruction in a tractable affine section.
  We prove hyperbolicity for every admissible quadratic matrix and identify the section exactly,
  including its singular boundary.

Let $Q : bb(R)^m arrow.r "Sym"_r$ have homogeneous quadratic entries and satisfy $Q \( y \) succ.curly.eq
  0$ for every $y$. Put $n = r + 1$. For $W = mat(delim: "(", a, v^top; v, T) in "Sym"_n$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ Phi_y \( W \) = mat(delim: "(", "tr" \( Q \( y \) T \), - v^top Q \( y \); - Q \( y \) v, a Q \( y \)) . $ <eq:Phi>]

The polynomial used throughout the paper is

#[#set math.equation(numbering: n => "(2.2)")
 $ p_Q \( X \, Z \, y \) = det #scale(x: 120%, y: 120%)[\(] \( det X \) Z -
   Phi_y \( "adj" X \) #scale(x: 120%, y: 120%)[\)] \, wide X \, Z in "Sym"_n \, quad y in bb(R)^m . $ <eq:pQ>]

The adjugate in this formula is the classical adjugate, so the formula is polynomial even when $X$ is singular.

#thm([Proposition 2.1.])[
  #emph[The polynomial $p_Q$ is homogeneous of degree $n \( n + 1 \)$ and hyperbolic with respect to
    $e = \( I_n \, I_n \, 0 \)$, with $p_Q \( e \) = 1$. Fix $y$ and choose vectors $b_1 \, dots.h \,
    b_n in bb(R)^r$ with $Q \( y \) = sum_(j = 1)^n b_j b_j^top$. Define
$ B_j = mat(delim: "(", 0, b_j^top; - b_j, 0) \, wide cal(B) = vec(B_1, dots.v, B_n) . $

 Then the closed hyperbolicity cone $K_Q$ of $p_Q$ is characterized, at this value of $y$, by
#[#set math.equation(numbering: n => "(2.3)")
 $ \( X \, Z \, y \) in K_Q quad arrow.l.r.double quad mat(delim: "(", I_n ⊗ X, cal(B); cal(B)^top, Z)
   succ.curly.eq 0 . $ <eq:block-cone>]

]
] <prop:hyperbolic>

#proof[
  The entries of the matrix in (2.2) have degree $n + 1$, and $p_Q \( e \) = 1$,
    which proves the degree assertion. A Gram factorization as in the statement exists since $n > r$;
    zero vectors may be added. Direct multiplication gives
  $ Phi_y \( W \) = sum_(j = 1)^n B_j^top W B_j . $
  For every real $eta$ we have the polynomial identity
  #[#set math.equation(numbering: n => "(2.4)")
   $ p_Q \( X \, Z \, eta y \) = det mat(delim: "(", I_n ⊗ X, eta cal(B); eta cal(B)^top, Z) . $ <eq:line-determinant>]
  Indeed, when $X$ is invertible the right side is
  $ \( det X \)^n det #scale(x: 120%, y: 120%)[\(] Z - eta^2 Phi_y \( X^(- 1) \) #scale(x: 120%, y: 120%)[\)] \, $
  which equals the left side by homogeneity of $Q$ and the adjugate identity.
    Equality everywhere follows because both sides are polynomials in $X \, Z \, eta$.
  Write $D_y \( X \, Z \)$ for the symmetric matrix on the right of (2.3).
    Substituting $t I_n - X \, t I_n - Z \, - y$ in (2.4) gives
  $ p_Q \( t e - \( X \, Z \, y \) \) = det #scale(x: 120%, y: 120%)[\(] t I_(n \( n + 1 \)) -
    D_y \( X \, Z \) #scale(x: 120%, y: 120%)[\)] . $
  Its roots are real, being the eigenvalues of a real symmetric matrix.
    They are all nonnegative exactly when $D_y \( X \, Z \) succ.curly.eq 0$, proving both hyperbolicity and (2.3). ◻
]

The Gram factorization in Proposition 2 is chosen separately for each $y$.
  In particular, (2.3) is not asserted to be a linear matrix inequality jointly in $X \, Z \, y$.
  The closed cone $K_Q$ is convex by Gårding’s theorem #cite(label("Garding1959")).

For a positive semidefinite matrix $A$, let $A^dagger$ denote its Moore–Penrose inverse. Define

#[#set math.equation(numbering: n => "(2.5)")
 $ E_Q = {\( A \, t \, y \) : A in "Sym"_r \, med A succ.curly.eq 0 \, quad "ran" Q \( y \) subset.eq "ran" A \,\
t gt.eq "tr" #scale(x: 120%, y: 120%)[\(] A^dagger Q \( y \) #scale(x: 120%, y: 120%)[\)]} . $ <eq:EQ>]

#thm([Proposition 2.2.])[
  #emph[The set $E_Q$ is the image of the affine section $K_Q ∩ { X = "diag" \( 1 \, A \) :
    A in "Sym"_r }$ under the projection $\( X \, Z \, y \) mapsto \( A \, Z_00 \, y \)$.
    Consequently, if $K_Q$ is a spectrahedral shadow, then so is $E_Q$.]
] <prop:epigraph>

#proof[
  For a symmetric block matrix $mat(delim: "(", H, C; C^top, Z)$, positive semidefiniteness is equivalent to
  $ H succ.curly.eq 0 \, wide "ran" C subset.eq "ran" H \, wide Z - C^top H^dagger C succ.curly.eq 0 . $
  To see the boundary assertion directly, positivity forces every vector in $ker H$ to annihilate $C$,
    by testing the quadratic form on $\( u \, lambda v \)$. The asserted range condition then follows,
    and a triangular congruence reduces the matrix to the direct sum of $H$ and $Z - C^top H^dagger C$.
  Apply this criterion to (2.3) with $X = "diag" \( 1 \, A \)$.
    Its range condition says $b_j in "ran" A$ for every $j$, equivalently $"ran" Q \( y \) subset.eq "ran" A$. Moreover,
  $ cal(B)^top \( I_n ⊗ X \)^dagger cal(B) = Phi_y \( "diag" \( 1 \, A^dagger \) \) =
    "diag" #scale(x: 120%, y: 120%)[\(] "tr" \( A^dagger Q \( y \) \) \, Q \( y \) #scale(x: 120%, y: 120%)[\)] . $
  It follows that every point of the affine section projects into $E_Q$.
    Conversely, given $\( A \, t \, y \) in E_Q$, take $Z = "diag" \( t \, Q \( y \) \)$ to obtain a point of that
    section. This proves the asserted equality with no closure operation.
    Affine sections and coordinate projections preserve the existence of an affine semidefinite lift,
    proving the final assertion. ◻
]

We will construct $Q$ for which $E_Q$ has no such lift. The rest of the argument therefore concerns (2.5),
  not the much larger determinant in (2.2).

== 3 Hankel matrices and finitely many inverse limits <sec:hankel>

We construct a positive semidefinite Hankel matrix of rank $20$ and a $20$-dimensional subspace $W$ with a
  finiteness property: certain nonzero limits of inverses of compressions to $W$ have only finitely many
  projective directions. The construction has two parts. A rank calculation, proved in Appendix 6,
  supplies a point at which a kernel-projection map has sufficiently large derivative.
  We then divide out translations and dilations, choose a finite fiber of the resulting map,
  and use that fiber to classify the inverse limits.

=== 3.1 The rank stratum and the seed matrix <the-rank-stratum-and-the-seed-matrix>

Let $x = \( x_0 \, x_1 \, dots.h \, x_7 \)$ and put

$ H = bb(R) \[ x \]_2 = L xor P \, wide L = chevron.l x_0^2 \, x_0 x_1 \, dots.h \, x_0 x_7 chevron.r \, wide P =
  bb(R) \[ x_1 \, dots.h \, x_7 \]_2 . $

Subscripts denote homogeneous degree. Monomials are our coordinate bases,
  and these bases are orthonormal whenever we take an orthogonal complement or compression.
  Setting $x_0 = 1$ identifies $H$ with polynomials of degree at most two in $s = \( s_1 \, dots.h \, s_7 \)$.
  In this identification, $L$ consists of the constant and linear terms and $P$ consists of the quadratic terms. Write

#[#set math.equation(numbering: n => "(3.1)")
 $ h = dim H = 36 \, wide d_(*) = 20 \, wide k = h - d_(*) = 16 \, wide q = d_(*) - dim L =
   12 . $ <eq:hankel-dimensions>]

Let $cal(H) subset "Sym" \( H \)$ be the space of Hankel matrices

#[#set math.equation(numbering: n => "(3.2)")
 $ Y \( p \, p' \) = y \( p p' \) \, wide p \, p' in H \, wide y in bb(R) \[ x \]_4^(*) . $ <eq:hankel-functional>]

Multiplication $"Sym"^2 H arrow.r bb(R) \[ x \]_4$ is onto, so $y mapsto Y$ is injective and $dim cal(H) =
  binom(11, 4) = 330$. We also call $Y$ a moment matrix. This terminology refers only to (3.2);
  no representing measure is assumed. In the chart $x_0 = 1$,
  the functional $y$ acts on polynomials in $s$ of degree at most four.

For subspaces of polynomial spaces, a product such as $J H_0$ denotes the linear span of all products of one
  element of each space. We use the following algebraic input.

#thm([Lemma 3.1.])[
  (Seed matrix).  #emph[There is a positive semidefinite matrix $T in cal(H)$ of rank $d_(*) =
    20$ with the following properties. Its restriction to $L$ is positive definite. If
$ J = ker T \, wide K = "proj"_P J \, wide H_0 = { p in H : T \( p \, L \) = 0 } \, $

 then $dim K = k = 16$, multiplication
$ "Sym"^2 K arrow.r bb(R) \[ x_1 \, dots.h \, x_7 \]_4 $

 is injective, and
#[#set math.equation(numbering: n => "(3.3)")
 $ K chevron.l x_1 \, dots.h \, x_7 chevron.r = bb(R) \[ x_1 \, dots.h \, x_7 \]_3 . $ <eq:pure-cubic-spanning>]

 Finally, $J H_0$ has codimension $9$ in $bb(R) \[ x \]_4$.]
] <lem:seed>

The proof in Appendix 6 begins with two cyclic orbits of real points and deforms their moment matrix inside the
  rank-$20$ stratum. All rank conditions needed for that deformation are verified there by explicit minors.

Let $cal(X)$ be the set of projective classes $\[ Y \] in upright(bold(P)) \( cal(H) \)$ such that $"rank" Y =
  d_(*)$, $ker Y ∩ L = 0$, and the projected kernel $K_Y = "proj"_P \( ker Y \)$ satisfies the two multiplication
  conditions of Lemma 4. Positivity is not part of the definition of $cal(X)$. Define

$ pi : cal(X) arrow.r "Gr" \( k \, P \) \, wide pi \( \[ Y \] \) = K_Y . $

#thm([Lemma 3.2.])[
  #emph[The set $cal(X)$ is a smooth semialgebraic manifold of dimension
$ D = 330 - 1 - frac(k \( k + 1 \), 2) = 193 . $

 Before projectivization, the tangent space at a representative $Y$ is the space of $Y' in
   cal(H)$ whose restriction to $ker Y times ker Y$ is zero.]
] <lem:hankel-stratum>

#proof[
  Put $J_Y = ker Y$. Taking highest homogeneous parts in the affine chart identifies $J_Y$ with $K_Y$.
    Injectivity of multiplication on $"Sym"^2 K_Y$ therefore implies injectivity on $"Sym"^2 J_Y$:
    a relation among products in $J_Y$ would have a relation among their highest parts.
    By duality, restriction of Hankel forms gives a surjection
  $ cal(H) arrow.r "Sym" \( J_Y \) . $
  Choose a complement of $J_Y$ in $H$. The compression of $Y$ to this complement is invertible:
    a vector in the complement orthogonal for $Y$ to that complement is orthogonal for $Y$ to all of $H$,
    and hence lies in $J_Y$. In a neighborhood of $Y$, rank $d_(*)$ is thus equivalent to the vanishing of a
    $k$-by-$k$ symmetric Schur complement. At $Y$, the derivative of this Schur complement is restriction to
    $J_Y$. The implicit function theorem gives a smooth manifold of codimension $k \( k + 1 \) \/ 2 =
    136$ in $cal(H)$, with the asserted tangent space. The condition $ker Y ∩ L =
    0$ and the multiplication conditions on $K_Y$ are open rank conditions.
    Finally, projectivization removes the nonzero scalar parameter, giving dimension $193$. ◻
]

=== 3.2 Removing translations and dilations <removing-translations-and-dilations>

The fibers of $pi$ contain the orbits of affine translations and positive dilations in the $s$ variables.
  We give explicit coordinates for removing these eight parameters.
  Because $J_Y ∩ L = 0$, its elements, in the affine chart, have a unique description

#[#set math.equation(numbering: n => "(3.4)")
 $ J_Y = { p \( s \) + b \( p \) \( s \) + a \( p \) : p in K_Y } \, $ <eq:kernel-graph>]

where $b : K_Y arrow.r bb(R) \[ s \]_1$ takes values in homogeneous linear forms and $a : K_Y arrow.r
  bb(R)$ is linear. These coefficient maps depend continuously and semialgebraically on $\[ Y \]$.

Pushforward of moments by $s mapsto s + t$ transforms a kernel polynomial by $f \( s \) mapsto f \( s - t \)$.
  Thus translation changes the coefficient maps by

#[#set math.equation(numbering: n => "(3.5)")
 $ b_t \( p \) = b \( p \) - partial_t p \, wide a_t \( p \) = a \( p \) - b \( p \) \( t \) + p \( t \) \,
   $ <eq:translation-kernel-coefficients>]

where $partial_t p$ is the directional derivative of $p$ in direction $t$.
  Pushforward by $s mapsto lambda s$, with $lambda > 0$, gives

#[#set math.equation(numbering: n => "(3.6)")
 $ b mapsto lambda b \, wide a mapsto lambda^2 a . $ <eq:dilation-kernel-coefficients>]

Both actions are congruences on moment matrices. They preserve Hankel structure, rank, and $pi$,
  and preserve positive semidefiniteness when it is present.

#thm([Lemma 3.3.])[
  #emph[For every $\[ Y \] in cal(X)$, the map
$ Delta_(K_Y) : bb(R)^7 arrow.r "Hom" \( K_Y \, bb(R) \[ s \]_1 \) \, wide t mapsto \( p mapsto partial_t p \) $

 is injective, and the coefficient maps $a \, b$ in (3.4) are not both zero.
   The seven infinitesimal translations and the infinitesimal dilation give eight independent variations of the
   kernel graph. These assertions, including the independence of the variations,
   also hold over $upright(bold(C))$ under the same rank and multiplication hypotheses.]
] <lem:kernel-affine-action>

#proof[
  If $t eq.not 0$ belongs to the kernel of $Delta_(K_Y)$, a linear change of the pure variables makes $t$ the
    first coordinate direction. All quadratics in $K_Y$ are then independent of that coordinate,
    so their products with linear forms cannot span its cube. This contradicts (3.3).
  Suppose next that $a = b = 0$, so $J_Y = K_Y$ in the chart.
    The kernel condition and (3.3) force all moments of degree three to vanish.
    Multiplying that spanning identity by linear forms shows that $K_Y P = bb(R) \[ s \]_4$,
    so all moments of degree four vanish as well. With coordinates ordered by degrees $0 \, 1 \, 2$,
    the moment matrix consequently has the form
  $ mat(delim: "(", *, *, *; *, *, 0; *, 0, 0) \, $
  where the degree-zero block has size one and the degree-one block has size seven.
    The last block row has rank at most one, and the first eight rows have rank at most eight.
    Thus $"rank" Y lt.eq 9$, a contradiction.
  For independence of the infinitesimal variations, suppose a translation in direction $t$ and a dilation with
    infinitesimal coefficient $alpha$ have zero combined variation of the graph. Equations (3.5) and (3.6) give
  $ alpha b \( p \) = partial_t p \, wide 2 alpha a \( p \) = b \( p \) \( t \) quad \( p in K_Y \) . $
  If $alpha = 0$, injectivity of $Delta_(K_Y)$ gives $t = 0$. If $alpha eq.not 0$, put $c = t \/ alpha$.
    Then $b \( p \) = partial_c p$ and $a \( p \) = p \( c \)$,
    so every polynomial in the graph is $p \( s + c \)$. A translation would therefore produce the already
    excluded case $a = b = 0$. This proves independence. Each argument is algebraic and applies equally over
    $upright(bold(C))$. ◻
]

Equip the spaces of coefficient maps with the Euclidean inner products induced by the monomial bases.
  We normalize $\[ Y \]$ in two steps. First choose the unique translation for which $b perp "ran" Delta_(K_Y)$.
  Explicitly, its parameter is

$ t = \( Delta_(K_Y)^(*) Delta_(K_Y) \)^(- 1) Delta_(K_Y)^(*) b . $

Next choose the unique positive dilation for which

#[#set math.equation(numbering: n => "(3.7)")
 $ parallel b parallel^2 + parallel a parallel^2 = 1 . $ <eq:kernel-normalization>]

For the translated coefficients, this amounts to solving $lambda^2 parallel b parallel^2 +
  lambda^4 parallel a parallel^2 = 1$. The left side is strictly increasing from zero to infinity, by Lemma 6.

#thm([Lemma 3.4.])[
  #emph[The normalized matrices, together with their data $\( K_Y \, b \, a \)$,
    form a semialgebraic set $cal(M)$ of dimension $185$. Normalization is continuous,
    and each $\[ Y \] in cal(X)$ is uniquely recovered from its normalized data and its seven translation
    parameters and positive dilation parameter. Moreover, $cal(M)$ has a compact ambient semialgebraic space in
    which the projection to $"Gr" \( k \, P \)$ is continuous.]
] <lem:hankel-normalization>

#proof[
  The translation formula is continuous because $Delta_(K_Y)$ has constant full column rank.
    The unique positive solution for $lambda$ is continuous and semialgebraic as well.
    Dilation preserves the orthogonality condition on $b$, so the two normalizations are compatible.
    Conversely, start with normalized data, undo its positive dilation, and then undo its translation.
    Applying the two normalization steps recovers the prescribed parameters.
    This gives a semialgebraic homeomorphism between $cal(X)$ and $cal(M) times bb(R)^7 times bb(R)_(> 0)$,
    and hence $dim cal(M) = 193 - 8 = 185$.
  To specify a compact ambient space, retain the projective matrix $\[ Y \]$ and the subspace $K_Y$,
    and extend $a \, b$ by zero on $K_Y^perp$ in $P$. The extended maps have the same norms as the original maps.
    Condition (3.7) places their pair on a fixed unit sphere.
    The product of this sphere with $upright(bold(P)) \( cal(H) \)$ and $"Gr" \( k \, P \)$ is compact,
    and projection to the last factor is continuous. We take the closure of $cal(M)$ in this product. ◻
]

=== 3.3 Selecting a finite fiber <selecting-a-finite-fiber>

We now show that the positive semidefinite part of $cal(X)$ has enough distinct projected kernels to avoid both
  infinite normalized fibers and limits at the boundary of $cal(M)$.
  We use the standard dimension and fiber-dimension theorems for semialgebraic sets,
  as well as the fact that the frontier $overline(S) \\ S$ of a semialgebraic set has smaller dimension than $S$;
  see #cite(label("BCR1998")). A zero-dimensional semialgebraic set is finite.

At any $T$ representing a point of $cal(X)$, put $J = ker T$ and $H_0 = { p : T \( p \, L \) = 0 }$.
  The kernel of the derivative of the kernel-projection map, before projectivizing, is

#[#set math.equation(numbering: n => "(3.8)")
 $ { Y' in cal(H) : Y' \( J \) subset T \( L \) } = \( J H_0 \)^perp . $ <eq:projection-tangent>]

Here the right side is an annihilator in $bb(R) \[ x \]_4^(*)$, identified with $cal(H)$.
  To verify the identity, continue a vector $j in J$ along a differentiable curve of kernels.
  Its first variation $j'$ must satisfy

$ Y' j + T j' = 0 . $

The projected kernel has zero first variation precisely when the pure part of each $j'$ lies in $K$.
  Subtracting an element of $J$ then makes $j'$ belong to $L$, without changing this equation.
  Thus the condition is $Y' J subset T \( L \)$. Conversely,
  that condition allows all the corrections to be chosen in $L$; it also implies $Y' \|_(J times J) = 0$,
  so Lemma 5 gives an actual rank-stratum tangent. Finally, $H_0 = T \( L \)^perp$,
  which proves the annihilator description.

At the seed matrix of Lemma 4, the space in (3.8) has dimension $9$.
  The rank stratum before projectivizing has dimension $194$, so the derivative of $pi$ has rank $194 - 9 = 185$.
  Projectivization removes one kernel direction, namely scaling, and leaves this derivative rank unchanged.
  Near the seed matrix, rank remains $20$ and its nonzero eigenvalues remain positive.
  Its $L$ block remains positive definite as well. Consequently the $pi$-image of matrices with these positivity
  properties has dimension at least $185$. It has dimension at most $185$ because $pi$ factors through $cal(M)$.

The seed’s final condition can also be retained in this neighborhood.
  Indeed, an invertible $321$-row product minor for $J H_0$ remains invertible nearby.
  On the other hand, scaling, translations, and dilation always give nine independent tangent directions in (3.8):
  the eight affine directions have independent kernel variations by Lemma 6,
  whereas scaling has zero kernel variation. Thus $dim \( J H_0 \) lt.eq 321$ throughout this neighborhood.

#thm([Proposition 3.5.])[
  #emph[The matrix $T$ in Lemma 4 may be chosen so that, for $K = "proj"_P ker T$,]
  + #emph[the fiber $cal(M)_K$ of $cal(M) arrow.r "Gr" \( k \, P \)$ is finite;]
  + #emph[no point of $overline(cal(M)) \\ cal(M)$ projects to $K$.]
] <prop:finite-normalized-fiber>

#proof[
  The set of subspaces over which the fiber of $cal(M)$ has positive dimension has dimension at most $184$,
    by the fiber-dimension theorem and $dim cal(M) = 185$. The frontier of $cal(M)$ has dimension at most $184$,
    so its projection to $"Gr" \( k \, P \)$ has dimension at most $184$ as well.
    The positive semidefinite image just constructed has dimension $185$.
    We can therefore choose $K$ in that image outside both exceptional sets,
    and choose a corresponding positive semidefinite $T$ in the neighborhood under consideration.
    Its fiber is nonempty and zero-dimensional, hence finite. ◻
]

Fix this $T$ and $K$ for the rest of the paper, and set

#[#set math.equation(numbering: n => "(3.9)")
 $ R = K^perp subset P \, wide W = L xor R . $ <eq:fixed-complements>]

Thus $H = W xor K$ is an orthogonal decomposition, $dim R = q = 12$, and $dim W = d_(*) = 20$.

Each normalized class $\[ macron(Y) \] in cal(M)_K$ determines a nonzero symmetric matrix on $W$, up to scale.
  Let $macron(A)$ be the compression of a representative $macron(Y)$ to $W$.
  The kernel of $macron(Y)$ is a graph over $K$ with lower terms in $L$, so $W$ is a complement of that kernel.
  The same nondegeneracy argument used in Lemma 5 shows that $macron(A)$ is invertible,
  even if $macron(Y)$ is indefinite. Define $C_(macron(Y)) in "Sym" \( W \)$ to have block form

#[#set math.equation(numbering: n => "(3.10)")
 $ C_(macron(Y)) = mat(delim: "(", 0, 0; 0, \( macron(A)^(- 1) \)_(R \, R)) quad upright("on ") W = L xor R \,
   wide cal(C) = { \[ C_(macron(Y)) \] : \[ macron(Y) \] in cal(M)_K } . $ <eq:finite-inverse-directions>]

If its $R \, R$ block were zero, the invertible operator $macron(A)^(- 1)$ would map $R$ into $L$,
  which is impossible because $12 > 8$. Thus $cal(C)$ is a finite nonempty set of projective classes of nonzero
  symmetric matrices on $W$.

=== 3.4 The inverse-limit property <the-inverse-limit-property>

To connect the normalized fiber to arbitrary limiting sequences,
  we first need a rank correction that remains small even when some matrix entries diverge.
  All norms below are fixed Euclidean operator norms; convergence is equivalent in any choice of such norms.

#thm([Lemma 3.6.])[
  (Uniform rank correction).  #emph[Use the fixed decomposition $H = W xor K$ from (3.9).
    Suppose $Y_i in cal(H)$ have blocks
$ Y_i = mat(delim: "(", A_i, B_i; B_i^T, D_i) \, $

 where $A_i$ is invertible, $sup_i parallel A_i^(- 1) parallel < oo$, and
$ A_i^(- 1) B_i arrow.r 0 \, wide D_i - B_i^T A_i^(- 1) B_i arrow.r 0 . $

 There are Hankel perturbations $Delta_i arrow.r 0$ such that $Y_i^sharp = Y_i + Delta_i$ has rank $d_(*)$.
   Its $W$ compression $A_i^sharp$ satisfies
$ \( A_i^sharp \)^(- 1) - A_i^(- 1) arrow.r 0 \, $

 and $ker Y_i^sharp arrow.r K$, or equivalently $"ran" Y_i^sharp arrow.r W$.]
] <lem:hankel-rank-correction>

#proof[
  On matrices whose $W$ block is invertible, write $cal(S) \( Y \) = D -
    B^T A^(- 1) B$ for the Schur complement on $K$. For a variation $Delta$ with blocks $\( a \, b \, d \)$ and
    $F = A^(- 1) B$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ D cal(S)_Y \( Delta \) = d - b^T F - F^T b + F^T a F . $ <eq:schur-differential>]
  At $Y_i$, these derivatives tend to the restriction map $Delta mapsto Delta_(K \, K)$ on Hankel space.
    That restriction map is onto $"Sym" \( K \)$ because multiplication on $"Sym"^2 K$ is injective.
    Choose a fixed linear right inverse $cal(E) : "Sym" \( K \) arrow.r cal(H)$.
  We record why an implicit-function argument is uniform in $i$. Put $M = sup_i parallel A_i^(- 1) parallel$.
    On a fixed sufficiently small ball of perturbations, the inverse of the perturbed $W$ block obeys
  $ \( A_i + a \)^(- 1) = \( I + A_i^(- 1) a \)^(- 1) A_i^(- 1) \, wide
    parallel \( A_i + a \)^(- 1) parallel lt.eq 2 M . $
  Moreover,
  $ \( A_i + a \)^(- 1) \( B_i + b \) = \( I + A_i^(- 1) a \)^(- 1) \( A_i^(- 1) B_i + A_i^(- 1) b \) $
  is uniformly bounded there. Differentiating the inverse and this last expression gives
  $ delta \( A^(- 1) \) = - A^(- 1) \( delta A \) A^(- 1) \, wide delta F = A^(- 1) \( delta B - \( delta A \) F \) . $
  Together with (3.11), these identities give a uniform bound for the second derivatives of $cal(S)$ on that ball.
    This bound uses neither boundedness of $A_i$ nor boundedness of $B_i$.
  Define $f_i \( z \) = cal(S) \( Y_i + cal(E) z \)$ for $z in "Sym" \( K \)$ in a fixed small ball.
    We have $f_i \( 0 \) arrow.r 0$ and $D f_i \( 0 \) arrow.r I$.
    Shrinking the fixed ball if needed, the uniform second-derivative bound gives $parallel D f_i \( z \) -
    I parallel lt.eq 1 \/ 2$ there for all sufficiently large $i$.
    The map $z mapsto z - f_i \( z \)$ is therefore a contraction on the closed ball of radius $2 parallel
    f_i \( 0 \) parallel$: its value at zero has norm $parallel f_i \( 0 \) parallel$,
    and its Lipschitz constant is at most $1 \/ 2$. Its fixed point $z_i$ satisfies $f_i \( z_i \) =
    0$ and $z_i arrow.r 0$. Set $Delta_i = cal(E) z_i$.
  The $W$ block remains invertible, and its Schur complement is zero, so $"rank" Y_i^sharp = d_(*)$.
    The inverse identity gives $\( A_i^sharp \)^(- 1) - A_i^(- 1) arrow.r 0$.
    The displayed formula for the perturbed cross block also gives $\( A_i^sharp \)^(- 1) B_i^sharp arrow.r 0$.
    The kernel of $Y_i^sharp$ is the graph with columns $binom(- \( A_i^sharp \)^(- 1) B_i^sharp, I_K)$,
    proving the final assertion. Discarding finitely many indices has no effect on any of the conclusions. ◻
]

#thm([Lemma 3.7.])[
  (Finite inverse limits).  #emph[Let $T \, K \, R \, W$, and $cal(C)$ be chosen as above.
    Suppose a sequence $Y_i in cal(H)$ has a group of $d_(*)$ eigenvalues bounded away from zero in absolute
    value, and the span of the corresponding eigenvectors tends to $W$.
    Suppose all remaining eigenvalues tend to zero. If the inverses of the compressions $A_i = \( Y_i \)_(W \, W)$
    converge to a nonzero matrix $C$, then
$ \[ C \] in cal(C) . $

]
] <lem:inverse-limits>

#proof[
  We first put the sequence in the situation of Lemma 9. Split off the distinguished eigenvalues to write $Y_i =
    Y_i^(upright("large")) + E_i$, where $"rank" Y_i^(upright("large")) = d_(*)$ and $E_i arrow.r 0$.
    After passage to a subsequence, orthonormal frames for the large eigenspaces have $W$ components $S_i$
    converging to an orthogonal matrix and $K$ components tending to zero. In particular $S_i$ is invertible, and
  #[#set math.equation(numbering: n => "(3.12)")
   $ Y_i^(upright("large")) = vec(I, G_i) A_i^0 mat(delim: "(", I, G_i^T) \, wide G_i arrow.r 0 \, wide
     sup_i parallel \( A_i^0 \)^(- 1) parallel < oo . $ <eq:spectral-graph>]
  Indeed $A_i^0 = S_i "diag" \( lambda_(i \, 1) \, dots.h \, lambda_(i \, d_(*)) \) S_i^T$,
    and the inverse eigenvalues are bounded.
  Write the blocks of $E_i$ as $\( a_i \, b_i \, d_i \)$ in the same order as in the rank-correction lemma. Then
  $ A_i = A_i^0 + a_i \, wide B_i = A_i^0 G_i^T + b_i \, wide D_i = G_i A_i^0 G_i^T + d_i . $
  The inverses $A_i^(- 1)$ are bounded, and
  $ A_i^(- 1) B_i = G_i^T + A_i^(- 1) \( b_i - a_i G_i^T \) arrow.r 0 . $
  With $e_i = b_i - a_i G_i^T$, direct block elimination gives
  $ D_i - B_i^T A_i^(- 1) B_i = d_i - G_i b_i - b_i^T G_i^T + G_i a_i G_i^T - e_i^T A_i^(- 1) e_i arrow.r 0 . $
  These formulas explain explicitly why divergence of the large eigenvalues causes no difficulty. Apply Lemma 9.
    The corrected Hankel matrices have exact rank $d_(*)$, their kernels tend to $K$,
    and their compression inverses have the same nonzero limit $C$.
    We replace $Y_i$ by these corrected matrices for the rest of the proof.
  For large $i$, the class $\[ Y_i \]$ belongs to $cal(X)$:
    its kernel is close to $K subset H$, and the required product conditions are open at $K$.
    Put $K_i = pi \( \[ Y_i \] \)$. Then $K_i arrow.r K$, and the lower coefficient maps $a_i^(upright("ker")) \,
    b_i^(upright("ker"))$ of the kernel graph tend to zero. The translations used in normalization consequently
    tend to zero, by the explicit left-inverse formula for $Delta_(K_i)$.
    The translated coefficient maps still tend to zero, so the normalizing dilation factors tend to infinity.
    Let their reciprocals be $epsilon_i arrow.r 0$.
  The normalized data lie in the compact ambient space of Lemma 7. Pass to a convergent subsequence.
    Its limit projects to $K$, and Proposition 8 excludes a limit in the frontier of $cal(M)$.
    It is therefore a member $\[ macron(Y) \] in cal(M)_K$. Choose representatives $Z_i$ of the normalized
    matrices converging to a representative $macron(Y)$. Up to nonzero scalar multiples,
    the original matrices are obtained from $Z_i$ by dilation by $epsilon_i$,
    followed by translations whose parameters tend to zero.
  We compute the inverse limit first before those translations.
    Set $R_i = K_i^perp subset P$ and $W_i = L xor R_i$. Use orthonormal coordinates on $W_i$ converging to the
    fixed coordinates on $W$, and keep the coordinates on $L$ unchanged.
    The compressions $macron(A)_i = \( Z_i \)_(W_i \, W_i)$ then converge to the invertible compression
    $macron(A)$ of $macron(Y)$ to $W$. Dilation acts on monomial columns by
  $ D_epsilon = "diag" \( 1 \, epsilon I_7 \, epsilon^2 I_28 \) $
  on $H$, according to degrees $0 \, 1 \, 2$. Since it preserves $W_i$, the compression of the dilated matrix is
  $ A_i^(upright("dil")) = D_(epsilon_i \, W_i) macron(A)_i D_(epsilon_i \, W_i) . $
  Consequently
  #[#set math.equation(numbering: n => "(3.13)")
   $ epsilon_i^4 \( A_i^(upright("dil")) \)^(- 1) = "diag" \( epsilon_i^2 \, epsilon_i I_7 \, I_q \) thin
     macron(A)_i^(- 1) thin "diag" \( epsilon_i^2 \, epsilon_i I_7 \, I_q \) arrow.r
     C_(macron(Y)) . $ <eq:dilated-inverse-limit>]
  It remains to justify changing $W_i$ to $W$ and restoring the translations.
    After dilation, the kernel coefficients of $Z_i$ are $epsilon_i b_i^(upright("norm"))$ and $epsilon_i^2
    a_i^(upright("norm"))$. The normalized coefficients are bounded.
    Write the dilated kernel in $W_i xor K_i$ as ${ \( F_i k \, k \) : k in K_i }$;
    the preceding coefficient bounds give $F_i arrow.r 0$. Its orthogonal complement,
    which is the range of the dilated matrix, has graph embedding
  $ iota_i : W_i arrow.r H \, wide iota_i w = \( w \, - F_i^(*) w \) . $
  Thus $iota_i$ tends to the inclusion of $W$ after the chosen coordinate identifications,
    and the full dilated matrix is $iota_i A_i^(upright("dil")) iota_i^T$.
  Let $sans(B)_i$ denote the monomial matrix of the remaining translation.
    Its parameter tends to zero, so $sans(B)_i arrow.r I_H$. Compression to $W$ after this translation therefore gives
  $ M_i A_i^(upright("dil")) M_i^T \, wide M_i = "proj"_W sans(B)_i iota_i arrow.r I_W . $
  The actual compression $A_i$ differs from this matrix by a nonzero scalar $alpha_i$,
    coming from the choice of projective representative. Equation (3.13) yields
  $ alpha_i epsilon_i^4 A_i^(- 1) = M_i^(- T) #scale(x: 120%, y: 120%)[\(]
    epsilon_i^4 \( A_i^(upright("dil")) \)^(- 1) #scale(x: 120%, y: 120%)[\)] M_i^(- 1) arrow.r
    C_(macron(Y)) eq.not 0 . $
  Hence $\[ A_i^(- 1) \] arrow.r \[ C_(macron(Y)) \]$. Since $A_i^(- 1) arrow.r
    C eq.not 0$ also gives $\[ A_i^(- 1) \] arrow.r \[ C \]$, we obtain $\[ C \] = \[ C_(macron(Y)) \] in cal(C)$. ◻
]

We retain the positive semidefinite matrix $T$, the subspaces $K$, $R = K^perp subset P$, and $W = L xor R$,
  and the finite set $cal(C)$ from (3.10). These are the geometric data used in the next construction.

== 4 Separation from Hankel images <sec:separation>

Retain the Hankel matrix $T$, the spaces $K$, $R = K^perp subset P$, and $W = L xor R$ from the preceding section.
  In particular, $dim W = d_(*) = 20$ and $H = W xor K$ orthogonally.
  Let $cal(C)$ be the finite set of projective classes of nonzero symmetric operators on $W$ supplied by Lemma 10.
  We will construct a vector $w$ and a subspace $U$ such that $w$ is outside the closure of all images of $U$
  obtained by applying one Hankel matrix componentwise. A quadratic form separating $w$ from those images will
  then give the required positive semidefinite quadratic matrix $Q$.

Fix an integer $N > 10 h^2$, where $h = dim H = 36$, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ r = d_(*) N - 1 . $ <eq:separation-dimensions>]

We equip $H^N$ with the sum of the Euclidean inner products on its factors.
  For a subspace $F subset H$, write $P_F$ for orthogonal projection onto $F$;
  the notation $P_F^N$ denotes its componentwise action on $H^N$.
  The two subspaces in the third condition below will represent directions in which eigenvalues diverge or have
  finite nonzero limits. Their different projection constraints arise by taking limits of bounded Hankel images of
  unit tuples.

#thm([Lemma 4.1.])[
  (Choice of the vector and subspace).  #emph[There exist a unit vector $w = \( w_1 \, dots.h \, w_N \) in
    W^N$ and an $r$-dimensional subspace $U subset w^perp subset H^N$ with the following properties.]
  + #emph[The vectors $w_1 \, dots.h \, w_N$ span $W$, and
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(i = 1)^N w_i^T C w_i eq.not 0 wide upright("whenever ") \[ C \] in cal(C) . $ <eq:inverse-pairings>]

]
  + #emph[The map
#[#set math.equation(numbering: n => "(4.3)")
 $ P_W^N \|_U : U arrow.r w^perp ∩ W^N $ <eq:projection-U>]

 is an isomorphism.]
  + #emph[Suppose that $F_oo \, F_0 subset H$ are orthogonal subspaces, $C_0$ is a symmetric operator on $F_0$,
    and $dim \( F_oo xor F_0 \) > d_(*)$. No nonzero tuple $u = \( u_1 \, dots.h \, u_N \) in U$ satisfies
#[#set math.equation(numbering: n => "(4.4)")
 $ P_(F_oo) u_i = 0 \, wide P_(F_0) u_i = C_0 P_(F_0) w_i wide \( 1 lt.eq i lt.eq N \) . $ <eq:forbidden-projections>]

]
] <lem:generic-wu>

#proof[
  For a nonzero symmetric operator $C$ on $W$, the polynomial $sum_i w_i^T C w_i$ on $W^N$ is nonzero:
    a vector with just one nonzero component already detects a nonzero value of the quadratic form of $C$.
    Its nonvanishing therefore defines a dense open subset of $W^N$.
    The spanning condition is also dense and open, since $N gt.eq dim W$.
    There are only finitely many classes in $cal(C)$, and changing a representative does not affect nonvanishing.
    We may consequently choose $w$ satisfying all these conditions and then normalize it to unit length.
  Fix this $w$ and consider the Grassmannian
  $ cal(G) = "Gr" \( r \, w^perp \) \, wide dim w^perp = h N - 1 . $
  Inside $w^perp$ we have the orthogonal decomposition
  $ w^perp = \( w^perp ∩ W^N \) xor K^N . $
  The $r$-planes complementary to $K^N$ form a nonempty open subset of $cal(G)$.
    They are exactly the subspaces satisfying (4.3).
  We show that the subspaces violating the third property have smaller dimension than $cal(G)$.
    Fix dimensions for $F_oo$ and $F_0$, and set $j = dim F_oo + dim F_0 > d_(*)$.
    The triples $\( F_oo \, F_0 \, C_0 \)$ form a semialgebraic parameter space of dimension at most $4 h^2$.
    For example, orthogonal projections onto the two spaces and the extension of $C_0$ by zero give matrix
    coordinates with this bound. For each fixed triple, (4.4) prescribes the component of every $u_i$ in $F_oo xor
    F_0$. Its solution set in $H^N$ is therefore an affine space of dimension $\( h - j \) N$.
  For a fixed nonzero $u in w^perp$, the subspaces in $cal(G)$ containing $u$ form a Grassmannian of codimension
  $ \( h N - 1 \) - r = \( h - d_(*) \) N $
  in $cal(G)$. Apply the semialgebraic dimension bounds to the incidence relation consisting of a parameter
    triple, a nonzero solution $u in w^perp$ of (4.4), and an $r$-plane containing $u$.
    Its image in $cal(G)$ has dimension at most
  $ dim cal(G) + 4 h^2 + \( h - j \) N - \( h - d_(*) \) N & = dim cal(G) + 4 h^2 - \( j - d_(*) \) N\
 & < dim cal(G) . $
  There are finitely many possible pairs of dimensions for $F_oo \, F_0$.
    The union of their exceptional images still has smaller dimension and cannot contain the nonempty open set of
    complements to $K^N$. Choosing $U$ outside that union proves both remaining properties. ◻
]

Fix $w$ and $U$ as in Lemma 11. Notice that the $P^N$ component of $w$ is nonzero:
  otherwise all its components would lie in $L$ and could not span $W$.
  We now use the third property of the lemma to control every possible limit of Hankel images,
  including limits produced by unbounded matrices.

#thm([Lemma 4.2.])[
  (Separation from the closure).  #emph[For $w$ and $U$ as in Lemma 11, let
$ cal(S)_U = { \( I_N ⊗ Y \) u : u in U \, med Y upright(" a Hankel matrix on ") H } . $

 Then $w in.not overline(cal(S)_U)$.]
] <lem:separation>

#proof[
  Suppose, to the contrary, that there are tuples $u^(\( n \)) in U$ and Hankel matrices $Y_n$ such that
  $ \( I_N ⊗ Y_n \) u^(\( n \)) arrow.r w . $
  After omitting finitely many terms the tuples are nonzero.
    Replacing $u^(\( n \))$ by $u^(\( n \)) \/ parallel u^(\( n \)) parallel$ and $Y_n$ by $parallel u^(\( n \))
    parallel Y_n$ leaves the products unchanged. We may thus assume that $parallel u^(\( n \)) parallel = 1$.
    Pass to a subsequence for which $u^(\( n \)) arrow.r u in U$, where $parallel u parallel = 1$.
  Choose an orthonormal eigenbasis $e_(1 \, n) \, dots.h \, e_(h \, n)$ for each $Y_n$,
    with eigenvalues $lambda_(1 \, n) \, dots.h \, lambda_(h \, n)$.
    After a further subsequence, each eigenvector converges and each eigenvalue converges in the extended real
    line. The limiting eigenvectors form an orthonormal basis of $H$.
    Let $F_oo$ be the span of those corresponding to eigenvalues whose absolute values tend to infinity,
    and let $F_0$ be the span of those corresponding to finite nonzero limits.
    All remaining eigenvalues tend to zero. Define $C_0$ on $F_0$ by taking the reciprocal of each corresponding
    eigenvalue limit in this limiting basis.
  For each component of the tuples, the spectral identity is
  #[#set math.equation(numbering: n => "(4.5)")
   $ chevron.l e_(ell \, n) \, Y_n u_i^(\( n \)) chevron.r = lambda_(ell \, n) chevron.l e_(ell \, n) \,
     u_i^(\( n \)) chevron.r . $ <eq:spectral-components>]
  When $lambda_(ell \, n) arrow.r 0$, the right side tends to zero because $u^(\( n \))$ is bounded.
    It follows that each $w_i$ belongs to $F := F_oo xor F_0$,
    and the spanning property of $w$ gives $W subset F$. When $\| lambda_(ell \, n) \| arrow.r oo$,
    divide (4.5) by $lambda_(ell \, n)$ to see that the corresponding component of $u_i$ is zero.
    For finite nonzero limits, the same identity gives
  $ P_(F_oo) u_i = 0 \, wide P_(F_0) u_i = C_0 P_(F_0) w_i wide \( 1 lt.eq i lt.eq N \) . $
  Since $u eq.not 0$, Lemma 11 excludes $dim F > d_(*)$. Together with $W subset F$ this yields $F = W$.
    Moreover $F_0$ is nonzero. Otherwise $F_oo = W$ and $P_W^N u = 0$, contradicting the injectivity in (4.3).
  Extend $C_0$ by zero on $F_oo$ to obtain a nonzero symmetric operator $C$ on $W$.
    We next verify that $C$ is an inverse limit covered by Lemma 10.
    The two groups defining $F$ consist of exactly $d_(*)$ eigenvalues, bounded away from zero in absolute value,
    and the span of their eigenvectors converges to $W$. All remaining eigenvalues tend to zero. Let
  $ A_n = P_W Y_n \|_W $
  be the compression to $W$. To identify its inverse, first keep only the $d_(*)$ eigenvalues in the two groups.
    In a fixed orthonormal basis of $W$, their contribution to $A_n$ is
  $ A_n^(upright("large")) = S_n Lambda_n S_n^T \, $
  where the columns of $S_n$ are the projected eigenvectors and $Lambda_n$ is the diagonal matrix of these
    eigenvalues. The matrices $S_n$ converge to an orthogonal matrix,
    while $Lambda_n^(- 1)$ converges to the diagonal matrix of the reciprocal finite limits and zeros for the
    divergent eigenvalues. Consequently
  $ \( A_n^(upright("large")) \)^(- 1) arrow.r C . $
  The contribution of the remaining eigenvalues tends to zero in norm.
    Since the displayed inverses are bounded, the identity
  $ A_n^(- 1) =
    #scale(x: 120%, y: 120%)[\(] I + \( A_n^(upright("large")) \)^(- 1) \( A_n - A_n^(upright("large")) \)
    #scale(x: 120%, y: 120%)[\)]^(- 1) \( A_n^(upright("large")) \)^(- 1) $
  shows that $A_n$ is invertible for all sufficiently large $n$ and $A_n^(- 1) arrow.r C$.
    Lemma 10 now gives $\[ C \] in cal(C)$.
  The projection identities above say $P_W u_i = C w_i$. Since $u in U$ and $U subset w^perp$, we obtain
  $ 0 = chevron.l w \, u chevron.r = sum_(i = 1)^N chevron.l w_i \, P_W u_i chevron.r = sum_(i = 1)^N w_i^T C w_i . $
  This contradicts (4.2) and proves the lemma. ◻
]

The preceding separation has a useful quadratic consequence.
  The set $cal(S)_U$ is closed under multiplication by any real scalar.
  Hence its closed set of directions on the unit sphere contains neither $w$ nor $- w$.
  Compactness gives a number $delta > 0$ such that

$ parallel P_(w^perp) z parallel gt.eq delta parallel z parallel wide \( z in cal(S)_U \) . $

Here the projections act on $H^N$, and $w$ has unit length. Define the symmetric operator

$ g = delta^(- 2) P_(w^perp) - P_(bb(R) w) . $

For $z in cal(S)_U$, its quadratic form satisfies $z^T g z gt.eq parallel z parallel^2 -
  parallel P_(bb(R) w) z parallel^2 gt.eq 0$, whereas $w^T g w = - 1$. We have therefore obtained

#[#set math.equation(numbering: n => "(4.6)")
 $ w^T g w < 0 \, wide #scale(x: 120%, y: 120%)[\(] \( I_N ⊗ Y \) u #scale(x: 120%, y: 120%)[\)]^T g
   #scale(x: 120%, y: 120%)[\(] \( I_N ⊗ Y \) u #scale(x: 120%, y: 120%)[\)] gt.eq
   0 quad \( u in U \, med Y upright(" Hankel") \) . $ <eq:g-properties>]

We can now define the quadratic matrix used in the rest of the proof.
  Use the monomial coordinates to identify $bb(R) \[ x_0 \, dots.h \, x_7 \]_4^(*)$ with $bb(R)^m$, where $m =
  330$. For such a functional $y$, let $Y \( y \)$ be its Hankel matrix on $H$, so $Y \( y \) \( p \, p' \) =
  y \( p p' \)$, and set

$ G \( y \) = I_N ⊗ Y \( y \) . $

Choose a basis of $U$ and also write $U$ for the $h N$-by-$r$ matrix whose columns are these basis vectors. Define

#[#set math.equation(numbering: n => "(4.7)")
 $ Q \( y \) = U^T G \( y \) g G \( y \) U . $ <eq:constructed-Q>]

The entries of $G \( y \)$ are linear in $y$, so $Q$ is a real symmetric $r$-by-$r$ matrix with homogeneous
  quadratic entries. For every $a in bb(R)^r$, the vector $U a$ belongs to the subspace $U$, and (4.6) gives

$ a^T Q \( y \) a = \( G \( y \) U a \)^T g \( G \( y \) U a \) gt.eq 0 . $

Thus $Q \( y \) succ.curly.eq 0$ for every real $y$. The data retained for the next section are $T$, $w$, $U$,
  and $g$, together with this admissible map $Q$; the strict inequality at $w$ in (4.6) will produce the
  obstruction to a finite semidefinite lift.

== 5 A local obstruction to a semidefinite lift <sec:obstruction>

We prove that the quadratic matrix map constructed in Section 4 has an epigraph set $E_Q$ with no finite
  semidefinite lift. The proof has two parts. First, a polynomial patch in $E_Q$ admits a positive moment
  functional whose application at small scales violates the defining inequality of $E_Q$ to order four.
  Second, any finite lift would force the resulting points to lie much closer to $E_Q$ than this violation allows.
  The second part is a local sum-of-squares obstruction, in the sense of the methods developed by Scheiderer
  #cite(label("Scheiderer2018")) Section 4; here we give a direct proof using finite Taylor polynomials of Gram factors.

We retain the spaces $H = L xor P$, $R = K^perp subset P$, and $W = L xor R$,
  the positive semidefinite Hankel matrix $T$, and the data $N \, w \, U \, g$ of the preceding sections. In particular,

$ dim H = 36 \, wide dim L = 8 \, wide dim R = 12 \, wide "rank" T = 20 \, wide r = 20 N - 1 . $

Write $J = ker T$. We use that $J ∩ L = 0$ and that the projection of $J$ to $P$ is $K$.
  As in Section 4, the symbol $U$ also denotes a $36 N$-by-$r$ matrix whose columns form a basis of the subspace
  $U subset H^N$. By Lemma 11, orthogonal projection induces an isomorphism

#[#set math.equation(numbering: n => "(5.1)")
 $ U arrow.r w^perp ∩ W^N . $ <eq:obstruction-U-projection>]

Moreover, $w in W^N$ has components spanning $W$, and $w^T g w < 0$.
  The admissible quadratic matrix map is $Q \( y \) = U^T G \( y \) g G \( y \) U$, as defined in (4.7).

To keep track of repeated blocks, for an operator $S$ on $H$ we write $S_N = I_N ⊗ S$, an operator on $H^N$.
  The same convention applies to maps between subspaces of $H$.
  We order the coordinates of $H^N$ as $L^N xor P^N$ when using two-by-two block matrices.
  Subscripts $L L$, $L P$, and $P P$ on an operator on $H^N$ refer to these blocks.

=== 5.1 A polynomial patch and its moment deformation <a-polynomial-patch-and-its-moment-deformation>

Let $v \( s \) in H$, for $s in bb(R)^7$, be the column of homogeneous quadratic monomials evaluated at
  $\( 1 \, s \)$. Thus its entries have affine degrees zero, one, and two.
  Let $y_s$ be evaluation at $\( 1 \, s \)$ on homogeneous quartics, and define

#[#set math.equation(numbering: n => "(5.2)")
 $ V \( s \) = I_N ⊗ v \( s \) in bb(R)^(36 N times N) \, wide M \( s \) =
   U^T V \( s \) in bb(R)^(r times N) . $ <eq:patch-matrices>]

The moment identity gives $G \( y_s \) = V \( s \) V \( s \)^T$.
  In the following lemma, $E_Q$ is the set defined in Proposition 3.

#thm([Lemma 5.1.])[
  (Polynomial patch).  #emph[There is an open ball $Omega_0 subset
    bb(R)^7$ about zero such that $M \( s \)$ has rank $N$ for every $s in Omega_0$. The polynomial map
#[#set math.equation(numbering: n => "(5.3)")
 $ x \( s \) = #scale(x: 120%, y: 120%)[\(] M \( s \) M \( s \)^T \, med "tr" \( g G \( y_s \) \) \, med
   y_s #scale(x: 120%, y: 120%)[\)] $ <eq:polynomial-patch>]

 has degree at most four and takes $Omega_0$ into $E_Q$. Its values satisfy the trace inequality defining $E_Q$
   with equality.]
] <lem:polynomial-patch>

#proof[
  Decompose $w = w_L + w_P$ in $L^N xor P^N$. Since the components of $w$ span $W$ and $R eq.not 0$,
    we have $w_P eq.not 0$; also $w_P in R^N$. Given $ell in L^N$, the vector
  $ ell - frac(chevron.l ell \, w_L chevron.r, parallel w_P parallel^2) w_P $
  belongs to $w^perp ∩ W^N$. By (5.1), it is the projection to $W^N$ of some vector of $U$.
    Thus projection from $U$ to $L^N$ is surjective. The columns of $V \( 0 \)$ form a basis for the $N$
    constant-coordinate directions in $L^N$. If $M \( 0 \) a = 0$, then $V \( 0 \) a$ is orthogonal to $U$;
    surjectivity onto $L^N$ forces $V \( 0 \) a = 0$, and hence $a = 0$.
    Therefore $"rank" M \( 0 \) = N$, and the same holds on a sufficiently small open ball.
  Put $Theta \( s \) = V \( s \)^T g V \( s \)$. The definition of $Q$ gives
  $ Q \( y_s \) = M \( s \) Theta \( s \) M \( s \)^T . $
  Consequently
  $ "ran" Q \( y_s \) subset "ran" M \( s \) = "ran" \( M \( s \) M \( s \)^T \) . $
  Full column rank of $M \( s \)$ gives
  $ M \( s \)^T \( M \( s \) M \( s \)^T \)^dagger M \( s \) = I_N \, $
  and hence
  $ "tr" #scale(x: 120%, y: 120%)[\(] \( M \( s \) M \( s \)^T \)^dagger Q \( y_s \)
    #scale(x: 120%, y: 120%)[\)] = "tr" Theta \( s \) = "tr" \( g G \( y_s \) \) . $
  This proves membership in $E_Q$. Finally, $M \( s \)$ has degree at most two,
    while $G \( y_s \)$ and $y_s$ have degree at most four, proving the degree bound. ◻
]

For a linear functional $Lambda$ on polynomials in seven variables through degree four,
  its moment matrix is the symmetric matrix indexed by monomials of degree at most two,
  with $\( alpha \, beta \)$ entry $Lambda \( s^(alpha + beta) \)$.
  Under the affine chart $x_0 = 1$, this is precisely a Hankel matrix on $H$.
  Applying $Lambda$ to a vector or matrix of polynomials always means applying it entrywise.

#thm([Lemma 5.2.])[
  (A deformation outside $E_Q$).  #emph[There exist a linear functional $Lambda :
    bb(R) \[ s_1 \, dots.h \, s_7 \]_(lt.eq 4) arrow.r bb(R)$ and an open ball $Omega subset
    Omega_0$ about zero with the following properties:]
  + #emph[$Lambda \( 1 \) = 1$, and its moment matrix on polynomials of degree at most two is positive definite;]
  + #emph[for every $c in Omega$, writing
#[#set math.equation(numbering: n => "(5.4)")
 $ \( A_(c \, epsilon) \, t_(c \, epsilon) \, y_(c \, epsilon) \) =
   Lambda_s #scale(x: 120%, y: 120%)[\(] x \( c + epsilon s \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:tested-patch>]

 there are constants $a_c > 0$ and $kappa_c > 0$ such that, as $epsilon arrow.b 0$,
#[#set math.equation(numbering: n => "(5.5)")
 $ A_(c \, epsilon) succ.curly.eq a_c epsilon^4 I_r \,\
t_(c \, epsilon) - "tr" #scale(x: 120%, y: 120%)[\(] A_(c \, epsilon)^(- 1) Q \( y_(c \, epsilon) \)
  #scale(x: 120%, y: 120%)[\)] = - kappa_c epsilon^4 + o \( epsilon^4 \) . $ <eq:deformation-lower-bound>]

 All three entries of (5.4) remain bounded as $epsilon arrow.b 0$.]
] <lem:moment-violation>

#proof[
  We first allow the moment matrix to be an arbitrary Hankel matrix $S$ near $T$,
    and normalize its constant moment at the end. Let $B_c$ be the matrix on $H$ determined by $B_c v \( s \) =
    v \( s + c \)$. This is an invertible matrix, depends polynomially on $c$, and satisfies $B_0 = I_H$.
    In the affine chart, $L$ consists of the constant and linear monomials,
    and $P$ consists of the quadratic monomials. On this degree decomposition of $H$, put
  $ D_epsilon = "diag" \( 1 \, epsilon I_7 \, epsilon^2 I_28 \) . $
  The functional with moment matrix $S$, applied at $c + epsilon s$,
    has moment matrix $B_c D_epsilon S D_epsilon B_c^T$. Its repeated matrix is therefore
  #[#set math.equation(numbering: n => "(5.6)")
   $ G = B_(c \, N) D_(epsilon \, N) S_N D_(epsilon \, N) B_(c \, N)^T . $ <eq:translated-scaled-moment>]
  For the corresponding tested data, $A = U^T G U$ and $t = "tr" \( g G \)$.
    Whenever $A$ is invertible, the quantity to be made negative is
  #[#set math.equation(numbering: n => "(5.7)")
   $ t - "tr" \( A^(- 1) Q \( y \) \) = "tr" #scale(x: 120%, y: 120%)[\(] g
     thin \[ G - G U \( U^T G U \)^(- 1) U^T G \] #scale(x: 120%, y: 120%)[\)] . $ <eq:trace-residual>]
  We now analyze the matrix inside this trace at small $epsilon$.
    Projection of the column space of $B_(c \, N)^T U$ to $L^N$ remains surjective for $c$ near zero.
    We can therefore choose a continuously varying basis matrix $U_c$ for this column space in the form
  #[#set math.equation(numbering: n => "(5.8)")
   $ U_c = mat(delim: "(", I_(8 N), 0; F_c, E_c) \, wide F_c in bb(R)^(28 N times 8 N) \, quad
     E_c in bb(R)^(28 N times \( 12 N - 1 \)) . $ <eq:Uc-blocks>]
  For completeness, keep one invertible $8 N$-by-$8 N$ minor of the projection matrix and normalize its columns to
    have $L^N$ components $I_(8 N)$. From each remaining column subtract its $L^N$ component expressed in these
    normalized columns. The resulting columns have zero $L^N$ component and give the block $E_c$.
    All these operations depend continuously on $c$. At $c = 0$,
    projection of the columns of $E_0$ to $R^N$ is injective:
    a vector $\( 0 \, E_0 z \)$ with zero $R^N$ projection would belong to $U ∩ K^N$, which is zero by (5.1).
  Let $D_(epsilon \, L \, N)$ denote the restriction of $D_(epsilon \, N)$ to $L^N$.
    For $epsilon > 0$, multiplication of $D_(epsilon \, N) U_c$ on the right by the invertible block diagonal
    matrix with blocks $D_(epsilon \, L \, N)^(- 1)$ and $epsilon^(- 2) I_(12 N - 1)$ gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ hat(U)_(c \, epsilon) = mat(delim: "(", I_(8 N), 0; epsilon^2 F_c D_(epsilon \, L \, N)^(- 1), E_c) .
     $ <eq:rescaled-U>]
  This matrix extends continuously to $epsilon = 0$, where the lower-left block is zero.
    The Gram matrix $hat(U)_(0 \, 0)^T T_N hat(U)_(0 \, 0)$ is positive definite.
    Indeed, if a vector $\( ell \, E_0 z \)$ belongs to $J^N$, then $E_0 z in K^N$.
    Injectivity of its $R^N$ projection gives $z = 0$, and $J ∩ L = 0$ then gives $ell = 0$.
    Thus the column space of $hat(U)_(0 \, 0)$ meets $ker T_N$ trivially.
  It follows that, for $\( c \, epsilon \, S \)$ near $\( 0 \, 0 \, T \)$, the Gram matrix in
  #[#set math.equation(numbering: n => "(5.10)")
   $ hat(C)_(c \, epsilon) \( S \) = S_N - S_N hat(U)_(c \, epsilon) #scale(x: 120%, y: 120%)[\(]
     hat(U)_(c \, epsilon)^T S_N hat(U)_(c \, epsilon) #scale(x: 120%, y: 120%)[\)]^(- 1) hat(U)_(c \, epsilon)^T
     S_N $ <eq:rescaled-residual>]
  is invertible. In particular, the displayed residual is continuous in all three arguments,
    including at $epsilon = 0$. Changing a basis of the columns does not change the residual in (5.7).
    After removing the outer translation factors, define
  $ C_(c \, epsilon) \( S \) = D_(epsilon \, N) hat(C)_(c \, epsilon) \( S \) D_(epsilon \, N) . $
  The exact relation to the matrix in (5.7) is
  #[#set math.equation(numbering: n => "(5.11)")
   $ G - G U \( U^T G U \)^(- 1) U^T G = B_(c \, N) C_(c \, epsilon) \( S \) B_(c \, N)^T . $ <eq:restored-residual>]
  The matrix $C_(c \, epsilon) \( S \)$ annihilates $U_c$. If a symmetric block matrix $C$ annihilates the first
    $8 N$ columns $binom(I_(8 N), F_c)$ of $U_c$, its blocks satisfy $C_(P L) = - C_(P P) F_c$ and $C_(L L) =
    F_c^T C_(P P) F_c$. Hence, with
  $ iota_c = vec(- F_c^T, I_(28 N)) : P^N arrow.r H^N \, $
  we obtain the exact identity
  #[#set math.equation(numbering: n => "(5.12)")
   $ C_(c \, epsilon) \( S \) = epsilon^4 iota_c #scale(x: 120%, y: 120%)[\(] hat(C)_(c \, epsilon) \( S \)
     #scale(x: 120%, y: 120%)[\)]_(P P) iota_c^T wide \( epsilon > 0 \) . $ <eq:order-four-residual>]
  Combining (5.11) and (5.12), the limit of (5.7) divided by $epsilon^4$ is
  #[#set math.equation(numbering: n => "(5.13)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] g B_(c \, N) iota_c \( hat(C)_(c \, 0) \( S \) \)_(P P) iota_c^T
     B_(c \, N)^T #scale(x: 120%, y: 120%)[\)] . $ <eq:continuous-leading-coefficient>]
  This expression is continuous in $c$ and $S$. Its sign can therefore be computed first at the singular moment
    matrix $T$.
  At $\( c \, epsilon \, S \) = \( 0 \, 0 \, T \)$, the matrix in (5.10) is positive semidefinite of rank $20 N -
    r = 1$. To see this rank directly, set $Z = T_N^(1 \/ 2) hat(U)_(0 \, 0)$.
    The residual equals $T_N^(1 \/ 2) \( I - P_Z \) T_N^(1 \/ 2)$,
    where $P_Z$ is the orthogonal projection onto the $r$-dimensional column space of $Z$,
    a subspace of $"ran" T_N^(1 \/ 2)$. It annihilates $L^N$, the embedded columns $binom(0, E_0)$, and $J^N$.
    Its range is consequently contained in
  $ P^N ∩ \( J^N \)^perp ∩ \( "ran" E_0 \)^perp = R^N ∩ \( "ran" E_0 \)^perp . $
  Because projection of $E_0$ to $R^N$ has rank $12 N - 1$, this last space is one-dimensional.
    It contains $w_P$, since $w$ is orthogonal to every column of $U_0$. Therefore
  $ #scale(x: 120%, y: 120%)[\(] hat(C)_(0 \, 0) \( T \) #scale(x: 120%, y: 120%)[\)]_(P P) = alpha w_P w_P^T wide
    upright("for some ") alpha > 0 . $
  The other columns of $U_0$ give $w_L = - F_0^T w_P$, so $iota_0 w_P = w$.
    Restoring the translation in (5.12), whose matrix is the identity at $c = 0$,
    shows that the limiting coefficient in (5.7) is
  $ alpha "tr" \( g w w^T \) = alpha w^T g w < 0 . $
  Choose a positive definite Hankel matrix $S$ sufficiently close to $T$.
    Such a choice is possible by adding a small positive multiple of the degree-two moment matrix of a
    nondegenerate Gaussian measure on $bb(R)^7$. By the continuity just proved,
    the limiting coefficient remains negative for every $c$ in an open ball about zero.
    Its constant moment is positive. Normalize the corresponding functional by its value at $1$ and call the
    result $Lambda$. Scaling the functional by a positive number $rho$ scales $A \, t \, y$ by $rho$,
    and scales $Q \( y \)$ by $rho^2$. It therefore scales (5.7) by $rho$, preserving the sign.
    Shrinking the ball to lie in $Omega_0$ proves (5.5).
  Let $S_Lambda succ 0$ be the normalized moment matrix. For fixed $c$,
    the matrix $B_(c \, N)^T U$ has full column rank. Since the smallest diagonal entry of $D_(epsilon \, N)$ is
    $epsilon^2$ for $0 < epsilon lt.eq 1$, formula (5.6) gives, for $z in bb(R)^r$,
  $ z^T A_(c \, epsilon) z gt.eq lambda_min \( S_Lambda \) epsilon^4 parallel B_(c \, N)^T U z parallel^2 gt.eq
    a_c epsilon^4 parallel z parallel^2 $
  with $a_c > 0$. Finally, the tested coordinates are polynomials in $epsilon$, so they remain bounded.
    This completes the proof. ◻
]

The preceding lemma supplies points outside $E_Q$ whose violation has a controlled leading term.
  We next show that a semidefinite lift would force any such moment deformation of a polynomial patch to be
  arbitrarily well approximated, to a prescribed finite order, by feasible points.

=== 5.2 Moment tests of analytic lift data <moment-tests-of-analytic-lift-data>

We first record why moments given only through degree four can be used to test Taylor polynomials of higher
  degree. The assertion concerns finite positive moment matrices and does not require a representing measure.

#thm([Lemma 5.3.])[
  (Finite positive extension).  #emph[Let $n gt.eq 1$ and $j gt.eq 0$ be integers,
    let $z = \( z_1 \, dots.h \, z_n \)$, and let the linear functional $lambda :
    bb(R) \[ z \]_(lt.eq 2 j) arrow.r bb(R)$ satisfy $lambda \( p^2 \) > 0$ for every nonzero $p in
    bb(R) \[ z \]_(lt.eq j)$. For every integer $b gt.eq j$, there is an extension $tilde(lambda) :
    bb(R) \[ z \]_(lt.eq 2 b) arrow.r bb(R)$ such that $tilde(lambda) \( p^2 \) > 0$ for every nonzero $p in
    bb(R) \[ z \]_(lt.eq b)$.]
] <lem:positive-moment-extension>

#proof[
  It suffices to extend from $j$ to $j + 1$. Index the enlarged moment matrix first by monomials of degree at most
    $j$, and then by monomials homogeneous of degree $j + 1$. It has the form
  $ mat(delim: "(", M_j, C; C^T, D) \, wide M_j succ 0 . $
  The mixed block $C$ uses moments of degree at most $2 j + 1$.
    Its entries of degree at most $2 j$ are already fixed, and we may assign arbitrary values to all moments of
    degree $2 j + 1$. Every entry of $D$ has degree exactly $2 j + 2$,
    so none of these moments has yet been assigned. Give them the values $a integral z^gamma thin d
    gamma_n \( z \)$, where $gamma_n$ is a nondegenerate Gaussian probability measure and $a > 0$.
    Then $D = a D_0$, where $D_0 succ 0$: the integral of the square of any nonzero homogeneous polynomial is
    strictly positive. Choosing $a$ sufficiently large makes $a D_0 - C^T M_j^(- 1) C$ positive definite.
    The Schur complement proves positivity of the enlarged moment matrix.
    Each degree layer is assigned as a functional on monomials, so all repeated Hankel entries agree.
    Iteration proves the assertion. ◻
]

The next lemma provides simultaneous analytic lift variables and Gram factors.
  Only a nonempty open part of the polynomial patch is needed.

#thm([Lemma 5.4.])[
  (Local analytic Gram factors).  #emph[Let $C subset bb(R)^a$ have an exact representation
$ C = { x in bb(R)^a : upright("there exists ") u in bb(R)^nu upright(" with ") cal(L) \( x \, u \) succ.curly.eq
  0 } \, $

 where $nu gt.eq 0$ and $cal(L)$ is an affine symmetric pencil of size $ell gt.eq 1$.
   Let $Omega subset bb(R)^n$ be nonempty, open, and semialgebraic, and let $p : bb(R)^n arrow.r
   bb(R)^a$ be polynomial with $p \( Omega \) subset C$. There is a nonempty open subset $Omega' subset
   Omega$ and real analytic maps $u : Omega' arrow.r bb(R)^nu$ and $F : Omega' arrow.r bb(R)^(ell times ell)$ such that
#[#set math.equation(numbering: n => "(5.14)")
 $ cal(L) \( p \( s \) \, u \( s \) \) = F \( s \) F \( s \)^T wide \( s in Omega' \) . $ <eq:analytic-Gram-identity>]

]
] <lem:analytic-lift>

#proof[
  Consider the semialgebraic set
  $ cal(A) = { \( s \, u \, F \) : s in Omega \, quad cal(L) \( p \( s \) \, u \) = F F^T } . $
  Its projection to $Omega$ is surjective, since every positive semidefinite matrix has a real square Gram factor.
    A semialgebraic set admits a finite stratification by real analytic semialgebraic manifolds;
    see #cite(label("BCR1998")) Proposition 9.1.8, or #cite(label("LRT2025")) Section 2.2.2.
    On at least one stratum, the differential of the projection has rank $n$ at some point.
    Otherwise Sard’s theorem on each of the finitely many strata would imply that the whole image has Lebesgue
    measure zero, contradicting that it contains $Omega$. The analytic submersion theorem at such a point gives a
    local analytic section of the projection. Its $u$ and $F$ coordinates give (5.14). ◻
]

#thm([Lemma 5.5.])[
  (Feasible approximation after a moment test).  #emph[Let $C$, $p$, and $Omega$ be as in Lemma 16.
    Fix an integer $b gt.eq max { 1 \, deg p }$ and a linear functional $lambda :
    bb(R) \[ z_1 \, dots.h \, z_n \]_(lt.eq 2 b) arrow.r bb(R)$ satisfying $lambda \( 1 \) =
    1$ and $lambda \( q^2 \) gt.eq 0$ for all $q in bb(R) \[ z \]_(lt.eq b)$.
    There is a nonempty open subset $Omega' subset Omega$ such that, for each $c in Omega'$, the points
$ x_epsilon = lambda_z #scale(x: 120%, y: 120%)[\(] p \( c + epsilon z \) #scale(x: 120%, y: 120%)[\)] $

 admit points $tilde(x)_epsilon in C$, for all sufficiently small $epsilon > 0$, with
#[#set math.equation(numbering: n => "(5.15)")
 $ parallel tilde(x)_epsilon - x_epsilon parallel = O \( epsilon^b \) . $ <eq:near-feasibility>]

 The implied constant may depend on $c$ and on the displayed data.]
] <lem:moment-near-feasibility>

#proof[
  Choose analytic maps $u \, F$ on $Omega'$ as in Lemma 16, and fix $c in Omega'$.
    For a real analytic map $f$, write its degree-$b$ Taylor polynomial at $c$, evaluated at $c + epsilon z$, as
  $ f_(c \, b) \( epsilon \, z \) = sum_(\| alpha \| lt.eq b) frac(partial^alpha f \( c \), alpha !)
    epsilon^(\| alpha \|) z^alpha . $
  Set $u_epsilon = lambda_z \( u_(c \, b) \( epsilon \, z \) \)$ and
  $ P_epsilon = cal(L) \( x_epsilon \, u_epsilon \) \, wide H_epsilon =
    lambda_z #scale(x: 120%, y: 120%)[\(] F_(c \, b) \( epsilon \, z \) F_(c \, b) \( epsilon \, z \)^T
    #scale(x: 120%, y: 120%)[\)] . $
  For every $v in bb(R)^ell$, the scalar $v^T H_epsilon v$ is the value of $lambda$ on a sum of squares of
    polynomials of degree at most $b$. Thus $H_epsilon succ.curly.eq 0$.
    The Taylor identity (5.14) implies that $P_epsilon$ and $H_epsilon$ have the same coefficients through degree
    $b$ in $epsilon$. Here $deg p lt.eq b$ ensures that the polynomial patch is retained exactly,
    and $lambda \( 1 \) = 1$ retains the constant term of the affine pencil.
    Both tested expressions are polynomials in $epsilon$, so
  #[#set math.equation(numbering: n => "(5.16)")
   $ parallel P_epsilon - H_epsilon parallel = O \( epsilon^(b + 1) \) \, wide P_epsilon succ.curly.eq -
     O \( epsilon^(b + 1) \) I_ell . $ <eq:approximate-pencil>]
  To turn this approximate positivity into exact feasibility, let
  $ K_0 = ⋂_(cal(L) \( x \, u \) succ.curly.eq 0) ker cal(L) \( x \, u \) \, wide S_0 = K_0^perp . $
  Every selected matrix $cal(L) \( p \( s \) \, u \( s \) \)$ annihilates $K_0$.
    Its Taylor coefficients at $c$ therefore do so as well. Since $P_epsilon$ is obtained by applying $lambda$ to
    its Taylor polynomial through degree $b$, we have
  #[#set math.equation(numbering: n => "(5.17)")
   $ P_epsilon K_0 = 0 . $ <eq:exact-common-kernel>]
  In particular, any negative eigenvalues of $P_epsilon$ occur on $S_0$.
  There is a feasible pencil matrix $P_(*) = cal(L) \( x_(*) \, u_(*) \)$ whose restriction to $S_0$ is positive
    definite. Indeed, choose a feasible matrix of maximum rank.
    For any other feasible matrix $P$, the average $\( P_(*) + P \) \/ 2$ is feasible, and $ker \( P_(*) + P \) =
    ker P_(*) ∩ ker P$. Maximality of the rank therefore forces $ker P_(*) subset ker P$, proving $ker P_(*) =
    K_0$. If $S_0 = 0$, equation (5.17) already gives $P_epsilon = 0$,
    so $x_epsilon in C$ and there is nothing to prove.
  Otherwise choose $mu > 0$ with $P_(*) \|_(S_0) succ.curly.eq mu I_(S_0)$ and put $delta_epsilon = epsilon^b$.
    For sufficiently small positive $epsilon$,
  $ #scale(x: 120%, y: 120%)[\(] \( 1 - delta_epsilon \) P_epsilon +
    delta_epsilon P_(*) #scale(x: 120%, y: 120%)[\)] \|_(S_0) succ.curly.eq #scale(x: 120%, y: 120%)[\(] mu
    epsilon^b - C_1 epsilon^(b + 1) #scale(x: 120%, y: 120%)[\)] I_(S_0) succ.curly.eq 0 . $
  Both summands annihilate $K_0$, so the mixed matrix is positive semidefinite on all of $bb(R)^ell$.
    By affineness of the pencil it is the pencil value at
  $ tilde(x)_epsilon = \( 1 - delta_epsilon \) x_epsilon + delta_epsilon x_(*) \, wide
    tilde(u)_epsilon = \( 1 - delta_epsilon \) u_epsilon + delta_epsilon u_(*) . $
  Thus $tilde(x)_epsilon in C$. The vector $x_epsilon$ is polynomial in $epsilon$ and hence bounded near zero,
    giving (5.15). ◻
]

=== 5.3 The contradiction <the-contradiction>

#thm([Theorem 5.6.])[
  #emph[For the admissible quadratic matrix map $Q$ of (4.7), the set $E_Q$ is not a spectrahedral shadow.
    Consequently its associated entire closed hyperbolicity cone $K_Q$ is not a spectrahedral shadow.]
] <prop:no-lift>

#proof[
  Suppose that $E_Q$ has a finite affine semidefinite lift.
    Take the polynomial patch $x$, the functional $Lambda$, and the open ball $Omega$ from Lemmas 13 and 14.
    By Lemma 15, extend $Lambda$ through degree $32$ so that it is positive definite on squares of polynomials of
    degree at most $b = 16$. This extension leaves all tested patch coordinates unchanged,
    since their degrees are at most four, and preserves $Lambda \( 1 \) = 1$.
  Apply Lemma 17 with $C = E_Q$, $p = x$, and $b = 16$. Fix a center $c$ in the resulting nonempty open subset of
    $Omega$, and abbreviate the tested data by $x_epsilon = \( A_epsilon \, t_epsilon \, y_epsilon \)$.
    There are feasible points
  $
    tilde(x)_epsilon = \( A_epsilon + Delta A_epsilon \, med t_epsilon + Delta t_epsilon \, y_epsilon + Delta
    y_epsilon \) in E_Q $
  with all three perturbations of norm $O \( epsilon^16 \)$.
    By (5.5), $A_epsilon succ.curly.eq a_c epsilon^4 I_r$. Therefore, for sufficiently small $epsilon > 0$,
  $ A_epsilon + Delta A_epsilon succ.curly.eq 1 / 2 a_c epsilon^4 I_r \, wide parallel A_epsilon^(- 1) parallel +
    parallel \( A_epsilon + Delta A_epsilon \)^(- 1) parallel = O \( epsilon^(- 4) \) . $
  The inverse identity gives
  $ & \( A_epsilon + Delta A_epsilon \)^(- 1) - A_epsilon^(- 1)\
 & #h(1cm)  = - \( A_epsilon + Delta A_epsilon \)^(- 1) Delta A_epsilon A_epsilon^(- 1) = O \( epsilon^8 \) $
  in operator norm. The vectors $y_epsilon$ are bounded, and $Q$ is quadratic, so
  $ Q \( y_epsilon \) = O \( 1 \) \, wide Q \( y_epsilon + Delta y_epsilon \) - Q \( y_epsilon \) =
    O \( epsilon^16 \) . $
  Combining these estimates and using that $r$ is fixed yields
  $ & t_epsilon + Delta t_epsilon - "tr" #scale(x: 120%, y: 120%)[\(] \( A_epsilon + Delta A_epsilon \)^(- 1)
    Q \( y_epsilon + Delta y_epsilon \) #scale(x: 120%, y: 120%)[\)]\
 & wide = t_epsilon - "tr" #scale(x: 120%, y: 120%)[\(] A_epsilon^(- 1) Q \( y_epsilon \)
   #scale(x: 120%, y: 120%)[\)] + O \( epsilon^8 \)\
 & wide = - kappa_c epsilon^4 + o \( epsilon^4 \) < 0 $
  for all sufficiently small positive $epsilon$. Since $A_epsilon + Delta A_epsilon$ is positive definite,
    this contradicts the trace inequality defining the feasible point $tilde(x)_epsilon in E_Q$.
    Thus $E_Q$ has no finite semidefinite lift. Proposition 3 identifies $E_Q$ as a projection of an affine
    section of $K_Q$, so the same conclusion holds for $K_Q$. ◻
]

#proof[
  The construction in Section 4 gives finite dimensions $m = 330$ and $r = 20 N -
    1$ and a quadratic matrix map $Q$ satisfying $Q \( y \) succ.curly.eq 0$ for every $y in bb(R)^m$.
    Proposition 2 shows that its polynomial $p_Q$ is hyperbolic with respect to the specified direction.
    Theorem 18 shows that the entire closed hyperbolicity cone $K_Q$ has no finite semidefinite lift.
    These are all the assertions of Theorem 1. ◻
]

== 6 A rank certificate for the Hankel seed <app:certificate>

We prove Lemma 4. Recall that

$ H = bb(R) \[ x_0 \, dots.h \, x_7 \]_2 = L xor P \, wide dim H = 36 \, quad dim L = 8 \, quad dim P = 28 \, $

where $L$ consists of the quadratic monomials divisible by $x_0$.
  We seek a positive semidefinite Hankel matrix $T$ of rank $20$ whose restriction to $L$ is positive definite.
  Its projected kernel $K = "proj"_P \( ker T \)$ must have independent pairwise products and span all pure cubics
  after multiplication by pure linear forms. The remaining requirement is

$ dim #scale(x: 120%, y: 120%)[\(] \( ker T \) dot.op H_0 #scale(x: 120%, y: 120%)[\)] = 321 \, wide H_0 =
  { p in H : T \( p \, L \) = 0 } \, $

inside the $330$-dimensional quartic space.

Our starting matrix is the moment matrix of twenty points arranged in two cyclic orbits.
  At that matrix the last product space has dimension $302$.
  We exhibit a tangent direction for which nineteen independent product directions appear to first order.
  All nonvanishing assertions are certified below by explicit minors over $bb(F)_7$;
  we then explain why these certificates produce a real positive semidefinite matrix with the required properties.

=== 6.1 Cyclic orbit matrices and the required rank increase <subsec:orbit-seed>

For the algebraic construction work first over $bb(C)$, keeping $x_0$ as the homogenizing coordinate.
  Give the eight variables the respective weights

#[#set math.equation(numbering: n => "(6.1)")
 $ omega = \( 0 \, 5 \, 1 \, 9 \, 2 \, 8 \, 4 \, 6 \) med \( mod med 10 \) . $ <eq:certificate-weights>]

Let $zeta$ be a primitive tenth root of unity. For $a = \( 1 \, a_1 \, dots.h \, a_7 \)$,
  take the two orbits of $\( 1 \, dots.h \, 1 \)$ and $a$ under the diagonal action $x_j mapsto zeta^(omega_j)
  x_j$. Give every orbit point weight $1 \/ 10$, and let $T \( a \)$ be the resulting quadratic moment matrix.
  If $m$ is a quartic monomial, its moment is

#[#set math.equation(numbering: n => "(6.2)")
 $ t_a \( m \) = cases(delim: "{", 1 + m \( a \) \, & "wt" \( m \) = 0 \,, 0 \, & "wt" \( m \) eq.not 0 .)
   $ <eq:orbit-moments>]

In particular $T \( a \)_(u \, v) = t_a \( u v \)$ for quadratic monomials $u \, v$.
  Formula (6.2) has integer coefficients in the parameters and also defines the matrices used in the finite-field
  calculation; no tenth roots of unity in $bb(F)_7$ are needed.

Write $I_i$ for the ordered quadratic monomials of weight $i$ and set

$ C_i \( a \) = mat(delim: "(", 1, dots.h.c, 1; u_1 \( a \), dots.h.c, u_(\| I_i \|) \( a \)) \,
  wide \( u_1 \, dots.h \, u_(\| I_i \|) \) = I_i . $

The only nonzero block in column weight $i$ of $T \( a \)$ is $C_(- i) \( a \)^T C_i \( a \)$.
  If every $C_i \( a \)$ has rank two, then $"rank" T \( a \) =
  20$ and its kernel is the direct sum of the nullspaces $J_i = ker C_i \( a \)$.
  Thus $J = ker T \( a \)$ has dimension $16$.

Let $D$ denote a matrix whose columns are the quartic products of a basis of $J$ with a basis of $H_0$.
  For a Hankel variation $T_1$ satisfying

#[#set math.equation(numbering: n => "(6.3)")
 $ T_1 \|_(J times J) = 0 \, $ <eq:certificate-tangent>]

write $D_1$ for the first-order product variation obtained by differentiating the equations for bases of $J$ and
  $H_0$. We give explicit formulas below and later realize $T_1$ as the velocity of a smooth arc.
  We shall establish, simultaneously with the two product conditions on $K$,

#[#set math.equation(numbering: n => "(6.4)")
 $ "rank" D = 302 \, wide "rank" mat(delim: "(", D, 0; D_1, D) gt.eq 623 = 2 dot.op 302 +
   19 . $ <eq:certificate-target-ranks>]

These ranks do not depend on the choices of differentiable bases.
  Indeed, a change of the derivatives of those bases changes $D_1$ by a matrix of the form $A D + D B$,
  which is removed by block row and column operations in the second matrix of (6.4).

We first record the upper bounds that give the target ranks their meaning.
  They apply in characteristic zero wherever $T$ has rank $20$, $J ∩ L = 0$,
  and $K$ spans all pure cubics after multiplication by pure linear forms.
  The seven translations and the dilation in the chart $x_0 = 1$ have independent derivatives on the kernel graph,
  by the proof of Lemma 6, which uses only these hypotheses and works over $bb(C)$ as well as over $bb(R)$.
  Recall the obstruction to a dependence involving dilation:
  it would allow a translation making the kernel equal to the homogeneous space $K$.
  Cubic spanning would then annihilate all chart moments of degrees three and four, forcing rank at most $8 + 1 =
  9$ instead of $20$.

A translation or dilation preserves the projected kernel $K$.
  Continue each kernel vector with its highest homogeneous part fixed, so that its first derivative lies in $L$.
  Differentiating the kernel equation therefore gives $T' \( 0 \) J subset T \( L \)$,
  so its quartic functional annihilates $J H_0$. Scaling $T$ gives one further independent annihilator,
  since scaling has zero kernel derivative whereas the eight affine motions have independent kernel derivatives.
  Hence, throughout the rank-$20$ locus under consideration,

#[#set math.equation(numbering: n => "(6.5)")
 $ "rank" D lt.eq 330 - 9 = 321 . $ <eq:certificate-upper-321>]

At an orbit matrix, scaling belongs to the twenty-dimensional family obtained by varying the individual weights of
  its twenty points. Rank $20$ means that their evaluation functionals are independent already on quadratics,
  and hence on quartics by multiplication by $x_0^2$. Each such quartic evaluation annihilates $J H_0$,
  and all weight variations have zero kernel derivative. The eight affine motions remain independent modulo these
  twenty directions. Thus at the orbit matrix

#[#set math.equation(numbering: n => "(6.6)")
 $ "rank" D lt.eq 330 - 20 - 8 = 302 . $ <eq:certificate-upper-302>]

In particular, attaining rank at least $302$ there is an open condition equivalent to equality.

=== 6.2 Bases and first derivatives modulo seven <subsec:certificate-bases>

All entries in the remainder of this subsection and the next are in $bb(F)_7$. Use the specialization

#[#set math.equation(numbering: n => "(6.7)")
 $ a = \( 1 \, 6 \, 6 \, 0 \, 3 \, 0 \, 2 \, 5 \) . $ <eq:certificate-point>]

Index monomials by nondecreasing strings of variable indices, ordered lexicographically,
  both globally and within each weight. For example, $23$ means $x_2 x_3$ and $0011$ means $x_0^2 x_1^2$.
  Every row and column number below starts at one within its indicated block.

For $C_i$, take pivot columns

#[#set math.equation(numbering: n => "(6.8)")
 $ E_i = \( 1 \, 2 \) quad upright("except that") quad E_0 = E_8 = \( 1 \, 3 \) . $ <eq:certificate-pivots>]

Use the nullspace basis having an identity matrix on the remaining coordinates, in their order.
  The quadratic blocks and resulting columns of $J_i$ are as follows.
  A digit string in the third column records one entire column vector in the order of $I_i$.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, left, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$I_i$
], table.cell(rowspan: 1, colspan: 1)[columns of $J_i$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$00 \, 11 \, 23 \, 45 \, 67$
], table.cell(rowspan: 1, colspan: 1)[$61000 \, med 00610 \, med 40201$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$02 \, 17 \, 34$
], table.cell(rowspan: 1, colspan: 1)[$421$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$04 \, 22 \, 56 \, 77$
], table.cell(rowspan: 1, colspan: 1)[$4210 \, med 2401$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$15 \, 24 \, 36$
], table.cell(rowspan: 1, colspan: 1)[$601$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$06 \, 13 \, 44 \, 57$
], table.cell(rowspan: 1, colspan: 1)[$6010 \, med 0601$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$01 \, 26 \, 37$
], table.cell(rowspan: 1, colspan: 1)[$511$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$07 \, 12 \, 46 \, 55$
], table.cell(rowspan: 1, colspan: 1)[$4210 \, med 2401$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$14 \, 27 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$151$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$05 \, 33 \, 47 \, 66$
], table.cell(rowspan: 1, colspan: 1)[$6100 \, med 3031$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$03 \, 16 \, 25$
], table.cell(rowspan: 1, colspan: 1)[$601$
],
)
]

Each specified two-column pivot is invertible. Thus every $C_i$ has rank two and $T$ has rank $20$.
  The block on $L$ is also invertible: in the order $00 \, 01 \, dots.h \, 07$ its determinant is $6$.

For later calculations, the ordered list of weight-zero quartics is

#[#set math.equation(numbering: n => "(6.9)")
 $ 0000 \, 0011 \, 0023 \, 0045 \, 0067 \, 0126 \, 0137 \, 0225 \, 0334 \, 0447 \,\
0466 \, 0556 \, 0577 \, 1111 \, 1123 \, 1145 \, 1167 \, 1244 \, 1257 \, 1346 \,\
1355 \, 2233 \, 2247 \, 2266 \, 2345 \, 2367 \, 3356 \, 3377 \, 4446 \, 4455 \,\
4567 \, 4777 \, 5557 \, 5666 \, 6677 . $ <eq:certificate-zero-quartics>]

Define $T_1$ by setting its quartic moments outside weight zero equal to zero and its moments in the order (6.9)
  equal to

#[#set math.equation(numbering: n => "(6.10)")
 $ \( 2 \, 0 \, 0 \, 0 \, 3 \, 6 \, 1 \, 4 \, 1 \, 6 \, 0 \, 3 \, 0 \, 5 \, 2 \, 2 \, 0 \, 0 \, 4 \, 0 \, 6 \,
   underbrace(0 \, dots.h \, 0, 14) \) . $ <eq:certificate-tangent-moments>]

The weight-zero block of products in $"Sym"^2 J$ has seventeen columns.
  Its transpose times the vector (6.10) is the zero vector.
  Products of every other weight pair trivially with $T_1$, so (6.3) holds.

We specify a basis $N_i$ for the weight-$i$ part of $H_0$.
  There is one coordinate of $L$ in each weight except $3$ and $7$.
  Denote its within-block index by $L_i$; thus $L_0 = 1$ corresponds to $00$.
  If weight $- i$ has no $L$ coordinate, let $N_i$ be the identity matrix.
  Otherwise let $N_i$ be the nullspace basis of the single row $T_(L_(- i) \, I_i)$,
  using pivot $L_i$ and identity on the free indices. Its pivot is nonzero because $T \|_L$ is invertible.

The following formulas specify derivatives of both bases. Put $J'_i$ equal to zero off the pivot rows $E_i$, and set

#[#set math.equation(numbering: n => "(6.11)")
 $ \( J'_i \)_(E_i) = - #scale(x: 120%, y: 120%)[\(] T_(E_(- i) \, E_i)
   #scale(x: 120%, y: 120%)[\)]^(- 1) \( T_1 \)_(E_(- i) \, I_i) J_i . $ <eq:certificate-J-derivative>]

If $N_i$ is an identity matrix, put $N'_i = 0$. In the other cases, put $N'_i$ equal to zero off row $L_i$, and set

#[#set math.equation(numbering: n => "(6.12)")
 $ \( N'_i \)_(L_i) = - #scale(x: 120%, y: 120%)[\(] T_(L_(- i) \, L_i)
   #scale(x: 120%, y: 120%)[\)]^(- 1) \( T_1 \)_(L_(- i) \, I_i) N_i . $ <eq:certificate-N-derivative>]

These are the differentiated kernel equations with the free coordinates held fixed.
  For $J'_i$, tangency ensures that solving the two selected equations also solves all the equations $T J'_i +
  T_1 J_i = 0$: the image of $T_1 J_i$ lies in the image of $T$,
  and the two selected rows give coordinates on that image in the relevant weight block.
  The formulas for $N'_i$ follow by differentiating $T \( L \, N_i \) = 0$.

=== 6.3 The explicit minors <subsec:certificate-minors>

We now give the minors that establish the two product conditions on $K$ and the rank increase in (6.4).
  All product matrices use the following convention. In weight $w$,
  multiply a column $u$ from block $i$ by a column $v$ from block $w - i$, adding

$ u_(j j') v_(k k') quad upright("to row") quad "sort" \( j j' k k' \) . $

Order columns lexicographically by the weight $i$, the column number of $u$, and the column number of $v$.
  For products from $"Sym"^2 J$, retain only pairs for which the first index $\( i \, upright("column number") \)$
  is at most the second. Thus each unordered product occurs once, with its ordinary polynomial coefficients.

Let $G_1$ be this matrix for $J dot.op J$, restricted to quartic rows with no zero index.
  It is the product matrix for $"Sym"^2 K$. Let $G_2$ be the product matrix of $J$ with the seven coordinate
  vectors $x_0 x_j$, $1 lt.eq j lt.eq 7$, restricted to rows with exactly one zero index.
  Removing that zero identifies it with the product map from $K$ times pure linear forms to pure cubics.
  Rows and columns are numbered anew after the restriction to a weight and to these row sets.
  In all the tables, a colon denotes the inclusive range.

The following square minors use all columns of $G_1$ and all rows of $G_2$, respectively.
  The specified omissions determine the other index set completely.

#[
  #set par(justify: false)
#table(
  columns: 7,
  align: (center, left, right, right, left, right, right,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 3, align: center)[$G_1$
], table.cell(rowspan: 1, colspan: 3, align: center)[$G_2$
],
  table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[omit rows
], table.cell(rowspan: 1, colspan: 1)[size
], table.cell(rowspan: 1, colspan: 1)[det.
], table.cell(rowspan: 1, colspan: 1)[omit columns
], table.cell(rowspan: 1, colspan: 1)[size
], table.cell(rowspan: 1, colspan: 1)[det.
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$15 \, 19 : 22$
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$8 \, 10 \, 11$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$9 \, 11 \, 12 \, 15 : 20$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$9 : 11$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$13 \, 15 \, 19 : 22$
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$8 \, 10 \, 11$
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[2
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$3 \, 10 \, 14 : 20$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$8 \, 10$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$13 \, 15 \, 18 \, 19 \, 21 \, 22$
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$10 : 12$
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$9 \, 11 \, 13 \, 15 : 20$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$8 \, 10 \, 11$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[4
],
)
]

The number of columns of $G_1$ in weights $0 \, dots.h \, 5$ is $17 \, 11 \, 16 \, 11 \, 16 \, 11$;
  the number of rows of $G_2$ is $8 \, 8 \, 9 \, 8 \, 9 \, 8$.
  Thus these determinants give precisely the full column and full row ranks needed in these weights.

For $D$, use first factors from $J$ and second factors from $H_0$, with the preceding product order.
  Form $D_1$ by replacing the first factor by its derivative in (6.11),
  replacing the second by its derivative in (6.12), and adding the two resulting product columns.
  In weights $0 \, dots.h \, 5$, the dimensions of $D$ are respectively

$ 35 times 48 \, quad 31 times 42 \, quad 35 times 47 \, quad 31 times 43 \, quad 35 times 47 \, quad 31 times 42 . $

The next table specifies a square submatrix $E = D \[ R \, S \]$ in each weight by listing the omitted rows and
  columns; $R \, S$ always denote the retained indices.

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, left, left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[omit rows
], table.cell(rowspan: 1, colspan: 1)[omit columns
], table.cell(rowspan: 1, colspan: 1)[size
], table.cell(rowspan: 1, colspan: 1)[$det E$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$13 \, 34 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$5 \, 9 \, 11 \, 33 \, 34 \, 36 : 38 \, 40 : 43 \, 45 : 48$
], table.cell(rowspan: 1, colspan: 1)[32
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$24 \, 26 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$7 \, 9 \, 10 \, 28 \, 30 \, 32 \, 33 \, 36 : 42$
], table.cell(rowspan: 1, colspan: 1)[28
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$32 \, 34 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$12 \, 14 : 16 \, 18 \, 19 \, 35 \, 38 \, 40 \, 41 \, 43 : 47$
], table.cell(rowspan: 1, colspan: 1)[32
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$26 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$14 \, 16 \, 17 \, 19 \, 20 \, 35 : 43$
], table.cell(rowspan: 1, colspan: 1)[29
], table.cell(rowspan: 1, colspan: 1)[3
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$33 \, 34 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$17 \, 20 \, 21 \, 23 : 25 \, 27 \, 28 \, 41 : 47$
], table.cell(rowspan: 1, colspan: 1)[32
], table.cell(rowspan: 1, colspan: 1)[5
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$19 \, 26 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$17 \, 18 \, 20 \, 22 \, 23 \, 25 \, 26 \, 36 : 42$
], table.cell(rowspan: 1, colspan: 1)[28
], table.cell(rowspan: 1, colspan: 1)[3
],
)
]

To obtain the bordered minors, use the indices $R \, S$ in both diagonal positions of
  $mat(delim: "(", D, 0; D_1, D)$. Add rows $R'$ in its second block row and columns $S'$ in its first block
  column. Set $A = D \[ R \, S' \]$ and $B = D \[ R' \, S \]$. Eliminating the two copies of $E$ leaves the corner

#[#set math.equation(numbering: n => "(6.13)")
 $ Z =  & D_1 \[ R' \, S' \] - D_1 \[ R' \, S \] E^(- 1) A - B E^(- 1) D_1 \[ R \, S' \]\
 & #h(27mm)  + B E^(- 1) D_1 \[ R \, S \] E^(- 1) A . $ <eq:certificate-corner>]

The corner matrices are the following, with rows separated by semicolons when their entries are listed.

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, left, left, left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[$R'$
], table.cell(rowspan: 1, colspan: 1)[$S'$
], table.cell(rowspan: 1, colspan: 1)[$Z$
], table.cell(rowspan: 1, colspan: 1)[$det Z$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$34$
], table.cell(rowspan: 1, colspan: 1)[$38$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \)$
], table.cell(rowspan: 1, colspan: 1)[5
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$24 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$38 \, 40$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 2 \; med 2 \, 4 \)$
], table.cell(rowspan: 1, colspan: 1)[5
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$34 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$45 \, 46$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 4 \; med 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$26 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$37 \, 39$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 6 \; med 0 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$33 \, 35$
], table.cell(rowspan: 1, colspan: 1)[$43 \, 46$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 4 \; med 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$26 \, 31$
], table.cell(rowspan: 1, colspan: 1)[$37 \, 38$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 6 \; med 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[2
],
)
]

In particular the resulting bordered minor has size $2 \| R \| + 1$ in weight zero and $2 \| R \| +
  2$ in each of weights one through five. The bordered determinant is, up to its row and column ordering sign,
  $\( det E \)^2 det Z$, as follows directly by eliminating the two diagonal copies of $E$.
  Thus the table proves the asserted bordered lower bounds without requiring an upper bound on the rank of $D$ in
  the finite field.

For completeness, every entry in these tables can be checked with the following fixed elimination rule.
  At column $n$, interchange row $n$ with the first row at or below it whose entry $t$ in that column is nonzero.
  Divide the new row by $t$ and subtract the appropriate multiples from every other row,
  always reducing modulo seven. The determinant is the product of the pivots,
  with one minus sign for each interchange. Appended columns give the inverse actions in (6.13) by the same rule.
  For the $G_2$ minor in weight zero, the signed pivots are

$ \( - 2 \, - 2 \, - 5 \, - 1 \, 4 \, - 1 \, 1 \, 5 \) . $

For $E$ in weight zero they are

#[#set math.equation(numbering: n => "(6.14)")
 $ 1 \, 4 \, 1 \, 4 \, - 4 \, - 1 \, - 4 \, - 5 \, - 5 \, - 4 \, - 4 \, 6 \, - 4 \, 4 \, 6 \, - 3 \,\
- 3 \, - 1 \, 6 \, 6 \, 4 \, 5 \, - 5 \, 2 \, 1 \, 5 \, 2 \, 5 \, 6 \, 4 \, 4 \, 4 . $ <eq:certificate-pivot-example>]

Together with the monomial order, the basis rules, and the moment vectors above,
  this specifies the finite calculation using matrices with at most thirty-five quartic rows in each weight.

=== 6.4 Characteristic zero and simultaneous real data <subsec:certificate-lifting>

We now pass from the explicit modular minors to actual orbit matrices and tangent directions in characteristic
  zero. First lift (6.7) to the same integer vector. The chosen pivots of the $C_i$,
  the entries used as pivots for $N_i$, and the $2 times 2$ blocks in (6.11) are all invertible modulo seven.
  Hence the corresponding bases and inverse formulas are defined over $bb(Z)_(\( 7 \))$,
  the rational numbers whose denominators are not divisible by seven.

There is one point to address before lifting the bordered minors:
  the first variation must remain tangent exactly, not just modulo seven.
  The weight-zero part of $"Sym"^2 J$ has dimension seventeen.
  Its seventeen product columns are independent, since their restriction to the pure rows contains the nonzero $17
  times 17$ minor of $G_1$ above. Consequently tangency of a weight-zero functional gives seventeen independent
  equations on its thirty-five moment coordinates. Choose as pivot coordinates the seventeen quartic rows of that
  minor. Lift the remaining eighteen coordinates of (6.10) to integers and solve these seventeen equations over
  $bb(Z)_(\( 7 \))$. The solution reduces to precisely the displayed moment vector.
  It therefore defines an exact characteristic-zero tangent whose basis derivatives reduce to (6.11) and (6.12).
  Every nonzero determinant in the preceding tables thus proves that its defining rational function is nonzero in
  characteristic zero.

It remains to obtain all weights and a real positive semidefinite matrix simultaneously.
  We spell out the genericity argument to make clear that the tangent need not be chosen separately for different
  weights. The permutation

$ \( x_2 \, x_3 \) \, quad \( x_4 \, x_5 \) \, quad \( x_6 \, x_7 \) quad upright("interchanged, with ") x_0 \,
  x_1 upright(" fixed") \, $

negates every weight and preserves the family of orbit matrices.
  The nonzero minors for weights $1 \, 2 \, 3 \, 4$ therefore also give nonempty rank conditions for weights $9 \,
  8 \, 7 \, 6$, respectively.

More formally, take the Zariski open subset of the parameter space $bb(C)^7$ on which all $C_i$ have rank two,
  $T \|_L$ is invertible, and the seventeen weight-zero products are independent.
  This is a nonempty irreducible parameter space. The solutions of the seventeen tangency equations form a
  rank-eighteen algebraic vector bundle over it: locally an invertible seventeen-column minor solves for seventeen
  moment coordinates in terms of the other eighteen. Its total space is irreducible.
  Each condition certified above is a nonempty Zariski open subset of this space,
  as is its image under the weight-negating permutation, after restricting to the common nonempty parameter
  domain. Their finite intersection is nonempty. The same reasoning for the minors of $G_1$ and $G_2$,
  which depend only on $a$, gives both product conditions on $K$.

The resulting lower bounds in weights $0 \, dots.h \, 9$ are

#[#set math.equation(numbering: n => "(6.15)")
 $ w & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & upright("sum")\
"rank" G_1 & 17 & 11 & 16 & 11 & 16 & 11 & 16 & 11 & 16 & 11 & 136\
"rank" G_2 & 8 & 8 & 9 & 8 & 9 & 8 & 9 & 8 & 9 & 8 & 84\
"rank" D & 32 & 28 & 32 & 29 & 32 & 28 & 32 & 29 & 32 & 28 & 302\
"rank" mat(delim: "(", D, 0; D_1, D) & 65 & 58 & 66 & 60 & 66 & 58 & 66 & 60 & 66 & 58 & 623
  $ <eq:certificate-rank-sums>]

Here $136 = dim "Sym"^2 K$ and $84$ is the dimension of the pure cubic space.
  The first two rows prove the required injectivity and surjectivity.
  Equation (6.6) then turns the third row into equality, and the fourth row gives (6.4).

Impose now the real structure in which $x_0 \, x_1$ are real and the pairs $\( x_2 \, x_3 \)$, $\( x_4 \, x_5 \)$,
  $\( x_6 \, x_7 \)$ are conjugate. Its fixed parameter set

$ a_1 in bb(R) \, wide a_3 = overline(a_2) \, quad a_5 = overline(a_4) \, quad a_7 = overline(a_6) $

is a real form of $bb(C)^7$ and is Zariski dense. One way to see this is to write each conjugate pair as
  $\( u + i v \, u - i v \)$: this is an invertible complex linear change of coordinates from a real coordinate
  space, and a polynomial vanishing on that real space is zero.
  The weight-zero tangent equations at a fixed real parameter are preserved by the real structure.
  Their solution space is therefore the complexification of its real fixed subspace,
  which is likewise Zariski dense. A nonempty open condition in the tangent bundle is attained over a nonempty
  open set of parameters, and within each such fiber it is an open condition on a linear space.
  We can thus choose simultaneously a parameter in the real form and a real tangent satisfying every rank
  condition in (6.15).

For these parameters all twenty orbit points are real in the corresponding real coordinates.
  Indeed multiplication by $zeta^(omega_j)$ respects the conjugate pairs and multiplies the weight-five coordinate
  by $plus.minus 1$. Since every point has positive weight $1 \/ 10$,
  the moment matrix is real positive semidefinite. Its rank is $20$,
  and its nonsingular restriction to $L$ is positive definite.
  Choose ordinary real coordinates on this fixed real form, keeping $x_0$ and the pure-variable span,
  and relabel them $x_0 \, dots.h \, x_7$. The induced polynomial change of coordinates preserves $L xor
  P$ and multiplication, and hence the total product and first-variation ranks above.
  Thus these are real Hankel data in the conventions of Section 3.

=== 6.5 Deformation to the seed matrix <deformation-to-the-seed-matrix>

We have obtained a real positive semidefinite orbit matrix $T$ and a real Hankel tangent $T_1$ satisfying (6.4).
  Independence of the products in $"Sym"^2 K$ implies independence of those in $"Sym"^2
  J$ by taking highest chart degree. Lemma 5, or its Schur-complement proof,
  therefore shows that the rank-$20$ Hankel locus is smooth near $T$, with tangent condition (6.3).
  There is a real smooth arc $T \( t \)$ on this locus with $T \( 0 \) = T$ and $T' \( 0 \) = T_1$.
  For sufficiently small $t$, its twenty nonzero eigenvalues remain positive,
  its restriction to $L$ remains positive definite, and the two product conditions on $K \( t \)$ remain valid.

Choose smooth local kernel and $H_0$ bases along the arc and let $D \( t \)$ be their product matrix.
  Apply fixed invertible row and column operations that put $D \( 0 \)$ in rank normal form

$ D \( 0 \) = mat(delim: "(", I_302, 0; 0, 0) . $

Writing the transformed derivative in the same blocks as $mat(delim: "(", A, B; C, F)$,
  elementary block elimination gives

$ "rank" mat(delim: "(", D \( 0 \), 0; D' \( 0 \), D \( 0 \)) = 604 + "rank" F . $

Thus $"rank" F gt.eq 19$. Eliminate the invertible leading $302 times 302$ block of $D \( t \)$.
  Its remaining Schur complement is $t F + o \( t \)$, since both off-diagonal blocks vanish at $t = 0$.
  A nonzero $19 times 19$ minor of $F$ remains nonzero after division by $t^19$ for every sufficiently small
  nonzero $t$. Hence $"rank" D \( t \) gt.eq 321$ there. The upper bound (6.5) applies along the arc and gives
  equality. Taking one such $T \( t \)$ proves Lemma 4.

===== 6.5.1 Reproducible calculation. <reproducible-calculation.>

The accompanying source file #raw("verify_certificate.py") reconstructs the monomial blocks, bases,
  differentiated products, and every displayed minor using exact integer arithmetic modulo seven.
  It also verifies the ranks in weights six through nine at the very same specialization (6.7) and tangent (6.10).
  This supplies an independent reproduction of the finite calculation;
  the explicit minors and the characteristic-zero argument above establish the lemma without relying on the program.

#bibliography("refs.bib", style: "ieee", title: [References])
