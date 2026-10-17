#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[A nonspectrahedral hyperbolicity cone]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A homogeneous polynomial $p in bb(R) \[ x_1 \, dots.h \, x_m \]$ of degree $d gt.eq 1$ is #emph[hyperbolic with respect to] $e in bb(R)^m$ if $p \( e \) eq.not 0$ and every root of $t mapsto p \( t e - x \)$ is real for every $x in bb(R)^m$. Write these roots, with multiplicity, as $lambda_1 \( x \) \, dots.h \, lambda_d \( x \)$. The closed hyperbolicity cone is

$ Lambda_(+) \( p \, e \) = { x in bb(R)^m : lambda_j \( x \) gt.eq 0 upright(" for ") 1 lt.eq j lt.eq d } . $

We write $bb(S)^N$ for the real symmetric $N times N$ matrices and $A succ.curly.eq 0$ (respectively, $A succ 0$) for positive semidefiniteness (respectively, positive definiteness). A cone is #emph[spectrahedral] if it has the form

#[#set math.equation(numbering: n => "(1.1)")
 $ K = { x in bb(R)^m : L \( x \) succ.curly.eq 0 } \, #h(2em) L \( x \) = sum_(i = 1)^m x_i A_i \, quad A_i in bb(S)^N \, $ <eq:spectrahedral>]

for some finite $N gt.eq 1$. The geometric Generalized Lax conjecture asserts that every hyperbolicity cone is spectrahedral. We give a counterexample.

=== 1.1 The explicit polynomial <the-explicit-polynomial>

All indices in ${ 1 \, 2 \, 3 }$ in the following construction are cyclic. For $z \, y in bb(R)^3$, let

#[#set math.equation(numbering: n => "(1.2)")
 $ b \( z \, y \) = sum_(i = 1)^3 z_i^2 y_i^2 - 2 sum_(1 lt.eq i < j lt.eq 3) z_i y_i z_j y_j + sum_(i = 1)^3 z_i^2 y_(i + 1)^2 . $ <eq:form>]

This is the coefficient-one Choi–Lam biquadratic form #cite(label("choi-lam-1977")) Section 4. Define $Q \( y \) in bb(S)^3$ by

$ Q \( y \)_(i i) = y_i^2 + y_(i + 1)^2 \, #h(2em) Q \( y \)_(i j) = - y_i y_j quad \( i eq.not j \) \, $

so that $b \( z \, y \) = z^top Q \( y \) z$. For $a in bb(R)$, $r in bb(R)^3$ and $T in bb(S)^3$, define the linear map $Phi_y : bb(S)^4 arrow.r bb(S)^4$ by

#[#set math.equation(numbering: n => "(1.3)")
 $ Phi_y #h(-0.16667em) mat(delim: "(", a, r^top; r, T) = mat(delim: "(", "tr" \( Q \( y \) T \), - r^top Q \( y \); - Q \( y \) r, a Q \( y \)) . $ <eq:phi>]

The dependence on $y$ is homogeneous quadratic. If $"adj" X$ denotes the adjugate of $X$, set

#[#set math.equation(numbering: n => "(1.4)")
 $ p \( X \, Z \, y \) = det #scale(x: 120%, y: 120%)[\(] \( det X \) Z - Phi_y \( "adj" X \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( X \, Z \, y \) in bb(S)^4 times bb(S)^4 times bb(R)^3 . $ <eq:polynomial>]

This formula is polynomial even when $X$ is singular. The ambient space has dimension $10 + 10 + 3 = 23$.

#thm([Theorem 1.1.])[
  #emph[The polynomial (1.4) is homogeneous of degree $20$ and hyperbolic with respect to $e = \( I_4 \, I_4 \, 0 \)$, with $p \( e \) = 1$. Its closed hyperbolicity cone $K = Lambda_(+) \( p \, e \)$ is not spectrahedral: for every finite $N gt.eq 1$ and every real linear map $L : bb(S)^4 times bb(S)^4 times bb(R)^3 arrow.r bb(S)^N$, 
$ K eq.not { \( X \, Z \, y \) : L \( X \, Z \, y \) succ.curly.eq 0 } . $

]
] <thm:main>

The conclusion concerns the cone itself, so it allows every possible defining pencil and every finite matrix size. The compact formula for $p$ is convenient for the proof, but one determinant factor can be removed.

#thm([Corollary 1.2.])[
  #emph[The quotient $q = p \/ det X$ extends to a homogeneous polynomial of degree $16$ in the same $23$ variables. It is hyperbolic with respect to $e$, with $q \( e \) = 1$, and $Lambda_(+) \( q \, e \) = K$. In particular, its closed hyperbolicity cone is not spectrahedral.]
] <cor:reduced>

We prove the degree reduction in Section 7, after the obstruction argument. We make no claim that the dimension or degree is minimal. The real symmetric convention also covers Hermitian pencils: for a Hermitian matrix $H = A + i B$, positivity is equivalent to positivity of the real symmetric matrix $mat(delim: "(", A, - B; B, A)$.

=== 1.2 Historical context <historical-context>

Gårding’s theory establishes the convexity of hyperbolicity cones #cite(label("garding-1959")). The original Lax conjecture asks for a definite determinantal representation of homogeneous hyperbolic polynomials in three variables #cite(label("lax-1958")). Helton and Vinnikov proved the corresponding definite determinantal representation theorem #cite(label("helton-vinnikov-2007")); Lewis, Parrilo, and Ramana established its equivalence with Lax’s formulation #cite(label("lewis-parrilo-ramana-2005")). In higher dimension, Brändén constructed a real-zero polynomial none of whose positive powers admits a definite determinantal representation #cite(label("branden-2011")) Theorem 3.3. That obstruction does not exclude a different determinant, with additional factors, from defining the same cone. The geometric conjecture concerns this remaining possibility. Kummer exhibited the distinction concretely: the cone of the specialized Vámos polynomial has a $7 times 7$ representation, although no positive power of that polynomial has a definite determinantal representation #cite(label("kummer-2016-vamos")) Section 3. Raghavendra, Ryder, Srivastava, and Weitz proved exponential lower bounds on the matrix size of spectrahedral representations for suitable hyperbolicity cones #cite(label("raghavendra-ryder-srivastava-2018")). Recent positive results include Netzer’s theorem for hyperbolic cubics in five variables #cite(label("netzer-2026")) Theorem 3.9.

Kummer and Netzer prove spectrahedrality for cones of strictly hyperbolic polynomials #cite(label("kummer-netzer-2026-strict")) Theorem 1. Here #emph[strictly hyperbolic] means that $p \( t e - x \)$ has distinct roots whenever $x in.not bb(R) e$. The polynomial (1.4) fails this hypothesis: at $w = \( I_4 \, 0 \, 0 \) in.not bb(R) e$ it gives

$ p \( t e - w \) = \( t - 1 \)^16 t^4 . $

For the reduced polynomial of Corollary 2, the same line gives $q \( t e - w \) = \( t - 1 \)^12 t^4$. Thus neither defining polynomial satisfies the strict-case hypothesis.

A #emph[spectrahedral shadow] is a linear image of a set defined by an affine real symmetric linear matrix inequality. Netzer and Sanyal proved that a hyperbolicity cone is a spectrahedral shadow when every nonzero boundary point is a smooth point of the defining polynomial #cite(label("netzer-sanyal-2015")) Theorem 1.1. Our result concerns a direct representation in the original variables; it makes no assertion about representations using auxiliary variables.

The scalar ingredient is the coefficient-one Choi–Lam biquadratic form #cite(label("choi-lam-1977")) Section 4, which reduces the coefficient of the extra cyclic squared monomials from two in Choi’s earlier nonnegative form #cite(label("choi-1975")) to one. Its inability to dominate a nonzero bilinear square follows from the extremality proved in #cite(label("choi-lam-1977")) Theorem 4.4; we give a short proof of precisely this property. It is called #emph[weak extremality] by Blekherman, Raiţă, Shankar, and Sinn #cite(label("blekherman-raita-shankar-sinn-2022")) Definition 2.7, whose characterization uses Taylor expansions of dominated squares at zeros #cite(label("blekherman-raita-shankar-sinn-2022")) Theorem 3.2. The correspondence between nonnegative biquadratic forms and positive maps on real symmetric matrices is classical; see #cite(label("ha-2013")) Section 3. Positive maps have also been used to obtain certificates of conic polynomial stability #cite(label("dey-gardoll-theobald-2021")). Here the construction turns the scalar obstruction into an obstruction to every finite pencil describing one hyperbolicity cone. A related general strategy appears in Scheiderer’s local sums-of-squares obstructions to spectrahedral shadows #cite(label("scheiderer-2018")) Section 4. Our proof extracts bilinear square minorants from a differentiated operator-norm identity; it does not invoke a criterion for shadows.

González Nevado states a positive solution of the geometric conjecture in #cite(label("gonzalez-nevado-2026")) Theorem 53, pp. 16–17. Appendix 8 records a counterexample to the path-containment assertion used in that argument. The construction and proof in the present paper are independent of that comparison.

=== 1.3 Proof strategy <proof-strategy>

The scalar obstruction is particularly rigid: $b$ is nonnegative and nonzero, but every bilinear form $ell$ satisfying $ell \( z \, y \)^2 lt.eq b \( z \, y \)$ for all $z \, y$ is zero. Section 2 gives a short proof using zeros and curves along which $b$ vanishes to fourth order.

The map $Phi_y$ translates this form into a matrix inequality. In Section 3 we prove hyperbolicity and identify the slice of $K$ with $X succ 0$ as

$ Z succ.curly.eq Phi_y \( X^(- 1) \) . $

The remaining argument assumes an arbitrary pencil defining $K$ and extracts a bilinear square dominated by $b$. First, Section 4 rescales the pencil along $\( X \, s^2 Z \, s y \)$ and obtains an equivalent block matrix inequality. Section 5 then sends $X^(- 1)$ and $Z^(- 1)$ toward rank-one projections; the resulting comparison yields an exact operator-norm identity for kernel projections of the pencil blocks. These projections are parametrized by the unit sphere in $bb(R)^4$. Finally, Section 6 differentiates one kernel projection on a neighborhood of constant rank in that sphere. At a suitable base point, the three-dimensional tangent space can be identified with all the $z$-variables, so this local identity controls $b$ for every $z$ and $y$. Each entry of the resulting matrix is a bilinear form whose square is bounded by $b$, giving a contradiction.

The mechanism connecting the biquadratic form to the geometry of the cone is the rescaling and subsequent first variation of these kernel projections. It applies to an arbitrary hypothetical pencil without comparing its determinant with $p$. All matrix norms below are Euclidean operator norms, denoted by $∥thin dot.op thin∥_(upright("op"))$; vector norms are Euclidean.

== 2 A biquadratic form with no dominated square <sec:form>

The geometric argument will produce bilinear forms whose squares are bounded by the Choi–Lam form $b$ in (1.2). We prove directly the particular consequence of its classical extremality #cite(label("choi-lam-1977")) Theorem 4.4 that the geometric argument needs: every such bilinear form must vanish. This property is also called #emph[weak extremality] #cite(label("blekherman-raita-shankar-sinn-2022")) Definition 2.7.

#thm([Lemma 2.1.])[
  #emph[The form $b : bb(R)^3 times bb(R)^3 arrow.r bb(R)$ defined in (1.2) is nonnegative and nonzero. If a real bilinear form $ell : bb(R)^3 times bb(R)^3 arrow.r bb(R)$ satisfies 
$ ell \( z \, y \)^2 lt.eq b \( z \, y \) #h(2em) upright("for every ") z \, y in bb(R)^3 \, $

 then $ell = 0$.]
] <lem:form>

#proof[
  Put $a_i = z_i^2$, with indices read cyclically modulo $3$. The matrix of $b \( z \, y \)$ as a quadratic form in $y$ is
  $ M \( z \) = mat(delim: "(", a_1 + a_3, - z_1 z_2, - z_1 z_3; - z_1 z_2, a_2 + a_1, - z_2 z_3; - z_1 z_3, - z_2 z_3, a_3 + a_2) . $
  Its diagonal entries are nonnegative. Its three principal minors of order two are
  $ det M \( z \) \[ { i \, i + 1 } \] = a_i^2 + a_(i - 1) \( a_i + a_(i + 1) \) gt.eq 0 \, #h(2em) i = 1 \, 2 \, 3 \, $
  where the brackets denote a principal submatrix. Finally,
  $ det M \( z \) = a_1^2 a_2 + a_2^2 a_3 + a_3^2 a_1 - 3 a_1 a_2 a_3 gt.eq 0 $
  by the arithmetic–geometric mean inequality. All principal minors are therefore nonnegative, so $M \( z \) succ.curly.eq 0$ and $b \( z \, y \) gt.eq 0$. For the standard coordinate vectors $e_1 \, e_2 \, e_3$ of $bb(R)^3$, we have $b \( e_1 \, e_1 \) = 1$.
  Now write $ell \( z \, y \) = sum_(i \, j) c_(i j) z_i y_j$ and assume the stated bound. Zeros will eliminate the off-diagonal coefficients; fourth-order vanishing along curves will eliminate the diagonal coefficients. At every zero of $b$, the form $ell$ vanishes. In particular,
  $ b \( e_i \, e_(i - 1) \) = 0 quad arrow.r.double quad c_(i \, i - 1) = 0 . $
  For each sign vector $sigma in { - 1 \, 1 }^3$, we also have $b \( sigma \, sigma \) = 3 - 6 + 3 = 0$, and hence
  $ 0 = sum_i c_(i i) + sum_(i < j) \( c_(i j) + c_(j i) \) sigma_i sigma_j . $
  Multiplying by $sigma_p sigma_q$ and averaging over the eight sign vectors gives $c_(p q) + c_(q p) = 0$ for every $p < q$. Together with $c_(i \, i - 1) = 0$, these identities force all off-diagonal entries to vanish. Thus $ell \( z \, y \) = sum_i c_i z_i y_i$ for some real $c_i$.
  For a cyclic index $i$ and $s in bb(R)$, set
  $ z = e_i + s e_(i - 1) \, #h(2em) y = e_(i - 1) + s e_i . $
  Direct substitution gives
  $ b \( z \, y \) = 2 s^2 - 2 s^2 + s^4 = s^4 \, #h(2em) ell \( z \, y \) = s \( c_i + c_(i - 1) \) . $
  For $s eq.not 0$, the bound implies $\( c_i + c_(i - 1) \)^2 lt.eq s^2$. Letting $s arrow.r 0$ yields $c_i + c_(i - 1) = 0$ for all three indices. These equations force $c_1 = c_2 = c_3 = 0$, proving the lemma. ◻
]

== 3 Hyperbolicity and two cone slices <sec:hyperbolic>

We first prove that the polynomial in (1.4) is hyperbolic. We then identify the two slices of its closed cone that will constrain any representing pencil.

For $u = \( u_0 \, u' \)$ and $v = \( v_0 \, v' \)$ in $bb(R)^4$, the block formula (1.3) gives

#[#set math.equation(numbering: n => "(3.1)")
 $ u^top Phi_y \( v v^top \) u = \( v_0 u' - u_0 v' \)^top Q \( y \) \( v_0 u' - u_0 v' \) = b \( v_0 u' - u_0 v' \, y \) . $ <eq:rank-one>]

Indeed, the three terms on expanding the middle expression are $v_0^2 u' ""^top Q \( y \) u'$, $- 2 u_0 v_0 u' ""^top Q \( y \) v'$, and $u_0^2 v' ""^top Q \( y \) v'$, exactly the terms from the block formula. Lemma 3 therefore implies that $Phi_y \( v v^top \) succ.curly.eq 0$. Every positive semidefinite real symmetric matrix is a nonnegative linear combination of such rank-one matrices. Thus $Phi_y$ is a positive linear map: it preserves positive semidefiniteness, and hence the order $prec.curly.eq$. The same formula also gives

#[#set math.equation(numbering: n => "(3.2)")
 $ Phi_(s y) = s^2 Phi_y #h(2em) \( s in bb(R) \) \, $ <eq:phi-scaling>]

so in particular $Phi_0 = 0$ and $Phi_(- y) = Phi_y$. This rank-one verification is the real-symmetric positive-map correspondence for biquadratic forms #cite(label("ha-2013")) Section 3 applied to the explicit map (1.3).

#thm([Proposition 3.1.])[
  #emph[The polynomial $p$ in (1.4) is homogeneous of degree $20$ on $bb(S)^4 times bb(S)^4 times bb(R)^3$, a real vector space of dimension $23$. It satisfies $p \( e \) = 1$ and is hyperbolic with respect to $e = \( I_4 \, I_4 \, 0 \)$.]
] <prop:hyperbolic>

#proof[
  Each entry of $\( det X \) Z - Phi_y \( "adj" X \)$ is homogeneous of degree $5$: the adjugate has degree $3$, and $Phi_y$ is quadratic in $y$. Taking its $4 times 4$ determinant gives a homogeneous polynomial of degree $20$. Since $Phi_0 = 0$, evaluation at $e$ gives $p \( e \) = 1$, so this polynomial is nonzero. The dimension is $10 + 10 + 3 = 23$.
  Extend $Phi_y$ complex linearly to complex symmetric matrices. For invertible $X$, real or complex, linearity and $"adj" X = \( det X \) X^(- 1)$ give
  #[#set math.equation(numbering: n => "(3.3)")
   $ p \( X \, Z \, y \) = \( det X \)^4 det #scale(x: 120%, y: 120%)[\(] Z - Phi_y \( X^(- 1) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:inverse-formula>]
  The adjugate formula remains the definition at singular $X$.
  Fix real symmetric $X \, Z$ and real $y$, and let $t = a + i eta$ with $eta > 0$. Orthogonal diagonalization of $X$ gives
  $ "Im" \( t I_4 - X \)^(- 1) = - eta #scale(x: 120%, y: 120%)[\(] \( a I_4 - X \)^2 + eta^2 I_4 #scale(x: 120%, y: 120%)[\)]^(- 1) prec 0 . $
  For a complex symmetric matrix, the entrywise imaginary part equals the Hermitian imaginary part $\( A - A^(*) \) \/ \( 2 i \)$ and is real symmetric. Complex linearity and positivity of $Phi_(- y)$ consequently show that
  $ H = t I_4 - Z - Phi_(- y) #scale(x: 120%, y: 120%)[\(] \( t I_4 - X \)^(- 1) #scale(x: 120%, y: 120%)[\)] quad upright("satisfies") quad "Im" H succ.curly.eq eta I_4 succ 0 . $
  Such an $H$ is invertible: if $H w = 0$ for a nonzero complex vector $w$, then $0 = "Im" \( w^(*) H w \) = w^(*) \( "Im" H \) w > 0$. Also $t I_4 - X$ is invertible. Equation (3.3) therefore implies $p \( t e - \( X \, Z \, y \) \) eq.not 0$. The coefficients of this polynomial in $t$ are real, so conjugation also excludes roots in the lower half-plane. Finally, its leading coefficient is $p \( e \) = 1$ by homogeneity; it has degree $20$ for every real input. All its roots are therefore real, as required. ◻
]

#thm([Proposition 3.2.])[
  #emph[Let $K = Lambda_(+) \( p \, e \)$. For real symmetric $X \, Z$ and $y in bb(R)^3$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ X succ 0 : #h(2em) \( X \, Z \, y \) in K & med arrow.l.r.double med Z succ.curly.eq Phi_y \( X^(- 1) \) \,\
\( X \, Z \, 0 \) in K & med arrow.l.r.double med X succ.curly.eq 0 med upright("and") med Z succ.curly.eq 0 . $ <eq:slice-positive>]

 Moreover, $e$ lies in the interior of $K$ in the full ambient space.]
] <prop:slices>

#proof[
  If $lambda_1 \( x \) \, dots.h \, lambda_20 \( x \)$ are the roots of $t mapsto p \( t e - x \)$, homogeneity gives
  $ p \( x + t e \) = product_(j = 1)^20 \( t + lambda_j \( x \) \) . $
  Thus $x in K$ if and only if $p \( x + t e \) eq.not 0$ for every real $t > 0$. The strict inequality on $t$ allows zero roots and hence includes the boundary of $K$.
  Suppose $X succ 0$ and set, for $t gt.eq 0$,
  $ F \( t \) = Z + t I_4 - Phi_y #scale(x: 120%, y: 120%)[\(] \( X + t I_4 \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  If $F \( 0 \) succ.curly.eq 0$, order preservation yields
  $ F \( t \) = F \( 0 \) + t I_4 + Phi_y #scale(x: 120%, y: 120%)[\(] X^(- 1) - \( X + t I_4 \)^(- 1) #scale(x: 120%, y: 120%)[\)] succ.curly.eq t I_4 succ 0 #h(2em) \( t > 0 \) . $
  Equation (3.3) then shows that there is no positive root, so $\( X \, Z \, y \) in K$.
  Conversely, if $F \( 0 \) succ.curly.eq.not 0$, its least eigenvalue is negative. For $t > 0$, positivity gives
  $ 0 prec.curly.eq Phi_y #scale(x: 120%, y: 120%)[\(] \( X + t I_4 \)^(- 1) #scale(x: 120%, y: 120%)[\)] prec.curly.eq t^(- 1) Phi_y \( I_4 \) . $
  Consequently $F \( t \) succ 0$ for all sufficiently large $t$. Continuity of its least eigenvalue gives a $t > 0$ at which $F \( t \)$ is singular. Since $X + t I_4 succ 0$, Equation (3.3) now gives a positive root of $p \( \( X \, Z \, y \) + t e \)$. This proves (3.4) in both directions, including equality in the matrix inequality.
  When $y = 0$, the polynomial definition directly gives
  $ p \( t e - \( X \, Z \, 0 \) \) = det \( t I_4 - X \)^4 det \( t I_4 - Z \) \, $
  also for singular $X$ and $Z$. Its roots are the eigenvalues of $X$, each repeated four times, and the eigenvalues of $Z$. They are all nonnegative exactly when both matrices are positive semidefinite. This proves (3.4).
  Finally, $X succ 0$ and $Z - Phi_y \( X^(- 1) \) succ 0$ define an open subset of the full ambient space. It contains $e$ and, by (3.4), is contained in $K$. Thus $e$ is an interior point. ◻
]

== 4 What a semidefinite representation would imply <sec:pencil>

The two slices in Proposition 5 constrain every pencil representing $K$. We now turn those constraints into an exact block matrix inequality whose off-diagonal block is linear in $y$. A positive linear map preserves positive semidefiniteness; it is called #emph[unital] if it sends the identity to the identity.

#thm([Proposition 4.1.])[
  #emph[Let $K = Lambda_(+) \( p \, \( I_4 \, I_4 \, 0 \) \)$ for the polynomial in (1.4). Suppose that $K$ admits a representation by a finite homogeneous real symmetric linear pencil. Then there are integers $a \, c gt.eq 1$, positive linear maps 
$ D : bb(S)^4 arrow.r bb(S)^a \, #h(2em) E : bb(S)^4 arrow.r bb(S)^c \, #h(2em) D \( I_4 \) = I_a \, quad E \( I_4 \) = I_c \, $

 and a linear map $B : bb(R)^3 arrow.r bb(R)^(a times c)$ such that, for every $X succ 0$, $Z in bb(S)^4$ and $y in bb(R)^3$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ Z succ.curly.eq Phi_y \( X^(- 1) \) quad arrow.l.r.double quad E \( Z \) succ.curly.eq B \( y \)^top D \( X \)^(- 1) B \( y \) . $ <eq:schur-equivalence>]

]
] <prop:pencil>

#proof[
  Write the hypothetical pencil as
  $ L \( X \, Z \, y \) = L_1 \( X \) + L_2 \( Z \) + L_3 \( y \) . $
  We first remove the pencil’s common kernel and normalize two positive blocks. We then rescale the pencil and prove that its limit represents the same inequality.
  #emph[Compression and normalization.] We use the elementary fact that
  $ A + H succ.curly.eq 0 \, quad A - H succ.curly.eq 0 quad arrow.r.double quad ker A subset.eq ker H . $
  Indeed, if $w in ker A$, the two nonnegative quadratic forms on $w$ sum to zero. A positive semidefinite matrix annihilates every vector on which its quadratic form vanishes, so both $\( A + H \) w$ and $\( A - H \) w$ are zero.
  Since $e$ is interior to $K$, for every ambient vector $x$ there is an $epsilon > 0$ with $L \( e \) plus.minus epsilon L \( x \) succ.curly.eq 0$. The preceding fact shows that $ker L \( e \)$ is a common kernel of the whole pencil. Compressing to its orthogonal complement preserves the represented cone and makes $L \( e \) succ 0$. This complement is nonzero: otherwise the pencil would vanish identically, whereas $\( - I_4 \, I_4 \, 0 \) in.not K$ by (3.4).
  The same slice shows that $L_1$ and $L_2$ are positive maps. Set $U = ker L_1 \( I_4 \)$. Positivity at $I_4 plus.minus epsilon X$, for small $epsilon > 0$, and the same kernel argument show that every $L_1 \( X \)$ annihilates $U$. Thus, in $U^perp xor U$,
  $ L_1 \( X \) = mat(delim: "(", D \( X \), 0; 0, 0) . $
  Both summands are nonzero. If $U^perp = 0$, then $L_1 = 0$ and the pencil accepts $\( - I_4 \, I_4 \, 0 \)$, contradicting (3.4). If $U = 0$, then $L_1 \( I_4 \) succ 0$, so $L_1 \( I_4 \) - epsilon L_2 \( I_4 \) succ 0$ for sufficiently small $epsilon > 0$. This would accept $\( I_4 \, - epsilon I_4 \, 0 \)$, again contradicting that slice.
  Let $a = dim U^perp$, $c = dim U$, and let $E \( Z \)$ be the lower diagonal block of $L_2 \( Z \)$. Both $D$ and $E$ are positive maps. Moreover, $D \( I_4 \) succ 0$ by the definition of $U$, and $E \( I_4 \) succ 0$ because it is the compression of $L \( e \) succ 0$ to $U$. Apply the fixed block diagonal congruence
  $ "diag" #scale(x: 120%, y: 120%)[\(] D \( I_4 \)^(- 1 \/ 2) \, E \( I_4 \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] $
  and retain the notation for the resulting blocks. We now have $D \( I_4 \) = I_a$ and $E \( I_4 \) = I_c$.
  #emph[Rescaling the pencil.] Write the other blocks as
  $ L_2 \( Z \) = mat(delim: "(", F \( Z \), C \( Z \); C \( Z \)^top, E \( Z \)) \, #h(2em) L_3 \( y \) = mat(delim: "(", A \( y \), B \( y \); B \( y \)^top, G \( y \)) . $
  Fix $y$ and put $Z_0 = Phi_y \( I_4 \)$. By (3.4) and $Phi_(s y) = s^2 Phi_y$, the point $\( I_4 \, s^2 Z_0 \, s y \)$ lies in $K$ for every real $s$. Its lower pencil block therefore satisfies
  $ s^2 E \( Z_0 \) + s G \( y \) succ.curly.eq 0 #h(2em) \( s in bb(R) \) . $
  Dividing by $\| s \|$ and taking limits through positive and negative $s$ gives $G \( y \) succ.curly.eq 0$ and $- G \( y \) succ.curly.eq 0$. Hence $G \( y \) = 0$.
  For fixed $X succ 0$, $Z$ and $y$, and any real $s eq.not 0$, congruence of $L \( X \, s^2 Z \, s y \)$ by $"diag" \( I_a \, s^(- 1) I_c \)$ gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ M_s \( X \, Z \, y \) = mat(delim: "(", D \( X \) + s A \( y \) + s^2 F \( Z \), B \( y \) + s C \( Z \); B \( y \)^top + s C \( Z \)^top, E \( Z \)) . $ <eq:scaled-pencil>]
  Congruence preserves positive semidefiniteness for either sign of $s$. The exact slice (3.4) gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ M_s \( X \, Z \, y \) succ.curly.eq 0 quad arrow.l.r.double quad Z succ.curly.eq Phi_y \( X^(- 1) \) \, #h(2em) s eq.not 0 . $ <eq:scaled-test>]
  As $s arrow.r 0$, these matrices converge to
  $ M \( X \, Z \, y \) = mat(delim: "(", D \( X \), B \( y \); B \( y \)^top, E \( Z \)) . $
  It follows immediately that $Z succ.curly.eq Phi_y \( X^(- 1) \)$ implies $M \( X \, Z \, y \) succ.curly.eq 0$.
  #emph[Recovering the inequality from the limit.] For the converse, suppose that $M \( X \, Z \, y \) succ.curly.eq 0$. Positivity and unitality give
  $ D \( X \) succ.curly.eq lambda_min \( X \) I_a succ 0 . $
  For every $delta > 0$,
  $ M \( X \, Z + delta I_4 \, y \) = M \( X \, Z \, y \) + "diag" \( 0 \, delta I_c \) succ 0 . $
  To see strict positivity, a vector with nonzero lower component has strictly positive contribution from the added term. A nonzero vector with lower component zero has strictly positive quadratic form under $D \( X \)$.
  Consequently, for each fixed $delta > 0$, the matrices $M_s \( X \, Z + delta I_4 \, y \)$ are positive definite for sufficiently small nonzero $s$. Equation (4.3) yields $Z + delta I_4 succ.curly.eq Phi_y \( X^(- 1) \)$. Letting $delta arrow.b 0$ proves the converse. We have therefore shown
  $ Z succ.curly.eq Phi_y \( X^(- 1) \) quad arrow.l.r.double quad M \( X \, Z \, y \) succ.curly.eq 0 . $
  Taking the Schur complement of the positive definite block $D \( X \)$ gives (4.1). ◻
]

The maps and their finite dimensions are now fixed by the hypothetical pencil. We next recover the scalar form $b$ from (4.1); this will force a nonzero bilinear square dominated by $b$ and contradict its defining obstruction.

== 5 Rank-one limits and a norm identity <sec:norm>

Let $D \, E \, B$ be the maps supplied by Proposition 6. Thus $D$ and $E$ are positive maps with output sizes $a \, c gt.eq 1$ and are #emph[unital], meaning $D \( I_4 \) = I_a$ and $E \( I_4 \) = I_c$, and $B \( y \)$ is an $a times c$ matrix. For unit vectors $u \, v in bb(R)^4$, define the orthogonal projections

#[#set math.equation(numbering: n => "(5.1)")
 $ P \( v \) = "proj"_(ker D \( I - v v^top \)) \, #h(2em) R \( u \) = "proj"_(ker E \( I - u u^top \)) . $ <eq:projections>]

These act on $bb(R)^a$ and $bb(R)^c$, respectively. The next proposition recovers the scalar form (1.2) from the Schur threshold (4.1).

#thm([Proposition 5.1.])[
  #emph[Let $a \, c gt.eq 1$, let $D : bb(S)^4 arrow.r bb(S)^a$ and $E : bb(S)^4 arrow.r bb(S)^c$ be positive unital linear maps, and let $B : bb(R)^3 arrow.r bb(R)^(a times c)$ be linear. Assume that (4.1) holds for every $X succ 0$, $Z in bb(S)^4$ and $y in bb(R)^3$, with $Phi_y$ defined by (1.3). Define $P \( v \)$ and $R \( u \)$ by (5.1). For every pair of unit vectors $u = \( u_0 \, u' \) \, v = \( v_0 \, v' \) in bb(R)^4$ and every $y in bb(R)^3$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ b \( v_0 u' - u_0 v' \, y \) = ∥P \( v \) B \( y \) R \( u \)∥_(upright("op"))^2 . $ <eq:norm-identity>]

 Here the operator norm uses the Euclidean structures on the two block spaces.]
] <prop:norm>

#proof[
  Fix $u \, v \, y$. For $t gt.eq 1$, set
  $ X_t = v v^top + t \( I - v v^top \) \, #h(2em) Z_t = u u^top + t \( I - u u^top \) . $
  Both matrices are at least $I$. Positivity and unitality therefore give $D \( X_t \) succ.curly.eq I$ and $E \( Z_t \) succ.curly.eq I$, so all inverse square roots below exist. Put
  $ A_t = Z_t^(- 1 \/ 2) Phi_y \( X_t^(- 1) \) Z_t^(- 1 \/ 2) \, #h(2em) C_t = D \( X_t \)^(- 1 \/ 2) B \( y \) E \( Z_t \)^(- 1 \/ 2) . $
  The matrix $A_t$ is positive semidefinite. For every real $r$, congruence by $Z_t^(- 1 \/ 2)$ gives
  $ r Z_t succ.curly.eq Phi_y \( X_t^(- 1) \) quad arrow.l.r.double quad r gt.eq lambda_max \( A_t \) . $
  Likewise, linearity of $E$ and congruence by $E \( Z_t \)^(- 1 \/ 2)$ give
  $ E \( r Z_t \) succ.curly.eq B \( y \)^top D \( X_t \)^(- 1) B \( y \) & quad arrow.l.r.double quad r I succ.curly.eq C_t^top C_t\
 & quad arrow.l.r.double quad r gt.eq ∥C_t∥_(upright("op"))^2 . $
  Equation (4.1) identifies these two closed rays in $r in bb(R)$, including their endpoints. Consequently,
  #[#set math.equation(numbering: n => "(5.3)")
   $ lambda_max \( A_t \) = ∥C_t∥_(upright("op"))^2 . $ <eq:threshold-norm>]
  This applies to rectangular $C_t$ and includes a zero threshold.
  The explicit formulas
  $ X_t^(- 1) = v v^top + t^(- 1) \( I - v v^top \) \, #h(2em) Z_t^(- 1 \/ 2) = u u^top + t^(- 1 \/ 2) \( I - u u^top \) $
  show that
  $ A_t arrow.r u u^top Phi_y \( v v^top \) u u^top = alpha u u^top \, #h(2em) alpha = u^top Phi_y \( v v^top \) u gt.eq 0 . $
  The sign follows from positivity of $Phi_y$. Thus the largest eigenvalue of this limit is $alpha$, also when $alpha = 0$. Continuity of the largest eigenvalue gives $lambda_max \( A_t \) arrow.r alpha$.
  For the other side, unitality gives
  $ D \( X_t \) = I + \( t - 1 \) D \( I - v v^top \) . $
  If $H succ.curly.eq 0$ is a fixed finite-dimensional matrix, diagonalizing $H$ shows that
  #[#set math.equation(numbering: n => "(5.4)")
   $ \[ I + \( t - 1 \) H \]^(- 1 \/ 2) arrow.r "proj"_(ker H) quad upright("in operator norm") . $ <eq:kernel-limit>]
  Indeed, the factor on an eigenvector of eigenvalue $mu gt.eq 0$ is $\( 1 + \( t - 1 \) mu \)^(- 1 \/ 2)$, which is one when $mu = 0$ and tends to zero otherwise. Applying (5.4) to $D \( I - v v^top \)$ and $E \( I - u u^top \)$ yields
  $ D \( X_t \)^(- 1 \/ 2) arrow.r P \( v \) \, #h(2em) E \( Z_t \)^(- 1 \/ 2) arrow.r R \( u \) . $
  Hence $C_t arrow.r P \( v \) B \( y \) R \( u \)$ in operator norm. The dimensions $a \, c$ are fixed throughout; the limits include zero and identity kernel projections. Taking limits in (5.3) and using the rank-one identity (3.1) proves (5.2). ◻
]

At $u = v$, the left side of (5.2) vanishes, so $P \( v \) B \( y \) R \( v \) = 0$ for every $y$. We next study the identity as $u$ varies near $v$.

== 6 The tangent obstruction <sec:tangent>

We finish the proof by taking a first-order limit in the norm identity at a point where the kernel projection varies smoothly. This produces a bilinear matrix whose entries must vanish by Lemma 3.

#proof[
  Proposition 4 establishes the polynomial’s degree, normalization, and hyperbolicity. Suppose its closed hyperbolicity cone has a real symmetric pencil representation of some finite size. Fix the maps $D \, E \, B$ supplied by Proposition 6, with their fixed finite dimensions $a \, c$. Proposition 7 gives (5.2) for the projections in (5.1). We shall show that this identity is impossible.
  Write $S^3 = { u in bb(R)^4 : ∥u∥ = 1 }$ and consider the symmetric matrix
  $ A \( u \) = E \( I - u u^top \) \, #h(2em) u in Omega := { u in S^3 : u_0 eq.not 0 } . $
  Its ranks take only finitely many values, so their maximum $rho$ is attained at some $v in Omega$. If $rho > 0$, select $rho$ independent columns of $A \( v \)$, and let $W \( u \)$ contain the same columns of $A \( u \)$. These columns remain independent on a neighborhood of $v$ in $Omega$. By maximality of $rho$, they span the range of $A \( u \)$ throughout that neighborhood. Symmetry of $A \( u \)$ then gives
  $ R \( u \) = I - W \( u \) #scale(x: 120%, y: 120%)[\(] W \( u \)^top W \( u \) #scale(x: 120%, y: 120%)[\)]^(- 1) W \( u \)^top . $
  This is a smooth matrix function. If $rho = 0$, then $R \( u \) = I$ on $Omega$, so it is smooth in this case as well.
  Keep $v$ fixed. At $u = v$, Equation (5.2) gives
  $ P \( v \) B \( y \) R \( v \) = 0 #h(2em) \( y in bb(R)^3 \) \, $
  because $b \( 0 \, y \) = 0$. For $h = \( h_0 \, h' \) in v^perp$, define
  $ J h = v_0 h' - h_0 v' \, #h(2em) u_s = frac(v + s h, sqrt(1 + s^2 ∥h∥^2)) . $
  For small $s$, this path stays in the neighborhood where $R$ is smooth, and its velocity at zero is $h$. Moreover,
  $ v_0 u'_s - \( u_s \)_0 v' = frac(s thin J h, sqrt(1 + s^2 ∥h∥^2)) . $
  Thus, for $s eq.not 0$, homogeneity of $b$ and (5.2) give
  $ frac(b \( J h \, y \), 1 + s^2 ∥h∥^2) = ∥P \( v \) B \( y \) frac(R \( u_s \) - R \( v \), s)∥_(upright("op"))^2 . $
  The matrix difference quotient converges to the differential $d R_v \( h \)$. Passing to the limit by continuity of the operator norm yields
  #[#set math.equation(numbering: n => "(6.1)")
   $ b \( J h \, y \) = ∥P \( v \) B \( y \) d R_v \( h \)∥_(upright("op"))^2 #h(2em) \( h in v^perp \, med y in bb(R)^3 \) . $ <eq:tangent-identity>]
  Only $R$ has been differentiated; the projection $P \( v \)$ remains fixed. Figure 1 illustrates this local variation.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.02), [#text(size: 8pt)[Local sphere section]], anchor: "west", padding: 0.1176cm)
  circle((1.65, 1.45), radius: 1.1, stroke: (paint: rgb("#b8b8b8"), thickness: 0.6pt, miter-limit: 10))
  arc((2.696, 1.11), start: -18deg, stop: 48deg, radius: 1.1, stroke: (paint: rgb("#235c87"), thickness: 1.6pt, miter-limit: 10))
  line((1.65, 1.45), (2.75, 1.45), stroke: (paint: rgb("#999999"), thickness: 0.5pt, miter-limit: 10))
  line((1.65, 1.45), (2.647, 1.915), stroke: (paint: rgb("#999999"), thickness: 0.5pt, miter-limit: 10))
  circle((1.65, 1.45), radius: 0.025, fill: rgb("#737373"), stroke: none)
  content((1.65, 1.36), [#text(size: 7pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((2.75, 1.45), (2.75, 2.65), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((2.86, 2.49), [#text(size: 8pt)[$h perp v$]], anchor: "west", padding: 0.1176cm)
  circle((2.75, 1.45), radius: 0.035, fill: black, stroke: none)
  content((2.83, 1.42), [#text(size: 9pt)[$v$]], anchor: "north-west", padding: 0.1176cm)
  circle((2.647, 1.915), radius: 0.037, fill: rgb("#235c87"), stroke: none)
  content((2.54, 1.96), [#text(fill: rgb("#235c87"))[#text(size: 9pt)[$u_s$]]], anchor: "south-east", padding: 0.1176cm)
  content((1.65, 0.22), [#text(size: 7pt)[$S^3 inter "span" \{v,h\}$]], anchor: "north", padding: 0.1176cm)
  content((4.65, 3.02), [#text(size: 8pt)[Only $R$ is differentiated]], anchor: "west", padding: 0.1176cm)
  content((4.65, 2.49), [#text(size: 9pt)[$cal(U) subset Omega , "rank" A(u)= rho (u in cal(U) ).$]], anchor: "west", padding: 0.1176cm)
  content((4.65, 1.79), [#text(size: 9pt)[$ u_s= frac(v+"sh", sqrt(1+s^2\|h\|^2) ) , u_(s=0)=v, frac("du"_s, "ds") |_(s=0)=h.$]], anchor: "west", padding: 0.1176cm)
  content((4.65, 1.02), [#text(size: 9pt)[$P(v) "stays" "fixed".$]], anchor: "west", padding: 0.1176cm)
  content((4.65, 0.43), [#text(fill: rgb("#235c87"))[#text(size: 9pt)[$R(u_s)=R(v)+s#h(0.1667em) "dR"_v(h)+o(s) (s arrow.r 0).$]]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: A schematic local tangent step, for a fixed nonzero $h in v^perp$. The highlighted arc lies in a chosen constant-rank neighborhood $cal(U)$; the expansion of $R$ is used only for small $s$ with $u_s in cal(U)$. The pictured section belongs to the parameter sphere, whereas $P \( v \)$ and $R \( u_s \)$ act on the separate block spaces $bb(R)^a$ and $bb(R)^c$. ],
  ) <fig:local-tangent>
  The linear map $J : v^perp arrow.r bb(R)^3$ is an isomorphism. Indeed, if $J h = 0$, then $v_0 eq.not 0$ gives $h = \( h_0 \/ v_0 \) v$; since $h perp v$, this forces $h = 0$. Both spaces have dimension three. Consequently the matrix
  $ F \( z \, y \) = P \( v \) B \( y \) d R_v \( J^(- 1) z \) \, #h(2em) z \, y in bb(R)^3 \, $
  has entries that are bilinear in $z \, y$, since $B$ and the differential $d R_v$ are linear. In fixed orthonormal bases, each entry $ell_(i j) \( z \, y \)$ satisfies
  $ ell_(i j) \( z \, y \)^2 lt.eq ∥F \( z \, y \)∥_(upright("op"))^2 = b \( z \, y \) #h(2em) \( z \, y in bb(R)^3 \) . $
  Lemma 3 forces every entry to vanish identically. Equation (6.1) would therefore make $b$ identically zero, contradicting $b \( e_1 \, e_1 \) = 1$. This excludes the hypothetical finite pencil and completes the proof. ◻
]

== 7 Removing a determinant factor <sec:reduced>

The polynomial $p$ makes the positive-map construction explicit through a $4 times 4$ determinant. We now remove a factor that is unnecessary for its hyperbolicity cone. A larger block determinant shows directly that the quotient remains polynomial at singular $X$.

#proof[
  For the standard coordinate vectors $e_i$ of $bb(R)^3$, put
  $ K_i = mat(delim: "(", 0, e_i^top; - e_i, 0) in bb(R)^(4 times 4) \, #h(2em) C = mat(delim: "(", K_1, K_2, K_3) in bb(R)^(4 times 12) . $
  Here $U ⊗ V$ denotes the block matrix with blocks $U_(i j) V$. Direct block multiplication in (1.3) gives, for $T in bb(S)^4$,
  $ Phi_y \( T \) = sum_(i \, j = 1)^3 Q \( y \)_(i j) K_i T K_j^top = C #scale(x: 120%, y: 120%)[\(] Q \( y \) ⊗ T #scale(x: 120%, y: 120%)[\)] C^top . $
  Define the polynomial
  #[#set math.equation(numbering: n => "(7.1)")
   $ q \( X \, Z \, y \) = det mat(delim: "(", I_3 ⊗ X, C^top; C #scale(x: 120%, y: 120%)[\(] Q \( y \) ⊗ I_4 #scale(x: 120%, y: 120%)[\)], Z) . $ <eq:reduced-polynomial>]
  For invertible $X$, taking a Schur complement yields
  $ q \( X \, Z \, y \) = \( det X \)^3 det #scale(x: 120%, y: 120%)[\(] Z - Phi_y \( X^(- 1) \) #scale(x: 120%, y: 120%)[\)] . $
  Comparison with (3.3) proves the polynomial identity
  #[#set math.equation(numbering: n => "(7.2)")
   $ p \( X \, Z \, y \) = \( det X \) q \( X \, Z \, y \) $ <eq:reduced-factor>]
  first for invertible $X$ and then everywhere by continuity. Since $p$ and $det X$ are homogeneous of degrees $20$ and $4$, this identity makes $q$ homogeneous of degree $16$; also $q \( e \) = 1$. For each real $\( X \, Z \, y \)$, the polynomial $q \( t e - \( X \, Z \, y \) \)$ is a factor of the real-rooted polynomial $p \( t e - \( X \, Z \, y \) \)$. Hence $q$ is hyperbolic with respect to $e$.
  Write $K_q = Lambda_(+) \( q \, e \)$. The factorization (7.2) gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ K = { \( X \, Z \, y \) : X succ.curly.eq 0 } ∩ K_q \, $ <eq:cone-intersection>]
  because the roots contributed by $det \( t I_4 - X \)$ are the eigenvalues of $X$. It remains to show that $K_q$ already forces $X succ.curly.eq 0$. The polynomial $q$ is even in $y$, so $\( X \, Z \, y \) in K_q$ implies $\( X \, Z \, - y \) in K_q$. By convexity of hyperbolicity cones #cite(label("garding-1959")), their midpoint $\( X \, Z \, 0 \)$ also belongs to $K_q$. But (7.1) gives
  $ q \( X \, Z \, 0 \) = \( det X \)^3 det Z \, $
  whose closed hyperbolicity cone in this slice is exactly ${ \( X \, Z \, 0 \) : X succ.curly.eq 0 \, med Z succ.curly.eq 0 }$. Thus $X succ.curly.eq 0$ throughout $K_q$, and (7.3) implies $K_q = K$. Theorem 1 now supplies nonspectrahedrality. ◻
]

== 8 A path-containment assertion <app:opposition>

Theorem 53 (pp. 16–17) of version 1 of González Nevado’s #cite(label("gonzalez-nevado-2026")) states a positive solution of the geometric Generalized Lax conjecture. Its proof invokes Theorem 52 (p. 16), which asserts containment of a fixed rigidly convex set throughout a smooth real-zero deformation from a product of normalized tangent linear factors to a multiple of the defining polynomial. The following example violates that intermediate assertion under its stated hypotheses.

A real polynomial $g$ with $g \( 0 \) = 1$ is #emph[real-zero] if the roots of $s mapsto g \( s x \)$ are real for every real vector $x$. Its closed rigidly convex set is the closure of the component of ${ g eq.not 0 }$ containing the origin. Fix $a \, b \, eta > 0$ and, in one variable, put

$ g \( x \) = \( 1 - x \/ a \) \( 1 + x \/ b \) \, #h(2em) c \( t \) = 1 + eta sin^2 \( pi t \) \, #h(2em) H_t \( x \) = g \( c \( t \) x \) \, quad 0 lt.eq t lt.eq 1 . $

The zero set of $g$ is the compact smooth set ${ - b \, a }$. The normalized tangent linear factors at these two points are $1 + x \/ b$ and $1 - x \/ a$, whose product is $g$. Every $H_t$ has value $1$ at the origin and two distinct real roots,

$ - frac(b, c \( t \)) quad upright("and") quad frac(a, c \( t \)) . $

Thus the path depends smoothly on $t$ and consists of real-zero polynomials with compact smooth zero sets. It even admits the smooth monic real symmetric determinantal representation

$ H_t \( x \) = det mat(delim: "(", 1 - c \( t \) x \/ a, 0; 0, 1 + c \( t \) x \/ b) . $

Both endpoints equal $g$, so the final polynomial is $g$ times the constant cofactor $1$, as allowed by the stated hypotheses. Nevertheless the rigidly convex set of $H_t$ is

$ [- frac(b, c \( t \)) \, frac(a, c \( t \))] \, $

which is strictly smaller than $\[ - b \, a \]$ whenever $0 < t < 1$. Consequently it does not contain the rigidly convex set of $g$.

The parameters $a \, b > 0$ describe the open family of normalized real quadratics with negative leading coefficient, so the failure is not confined to a symmetric or multiple-root example. The parameter $eta$ may be arbitrarily small. The cited Theorem 52 states no restriction to two or more variables, no lower bound on pencil size, and no requirement that the endpoint cofactor be nonconstant.

This example refutes the all-intermediate-times conclusion of that theorem. Its endpoints coincide, so it does not refute an endpoint-only statement. The nonspectrahedrality result of this paper follows from the construction and obstruction proved above.


#bibliography("refs.bib", style: "ieee", title: [References])
